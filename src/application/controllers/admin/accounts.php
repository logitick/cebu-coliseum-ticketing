<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Accounts extends CI_Controller {
    public function __construct()
    {
        parent::__construct();
        $this->load->library("admin", array($this));
        $this->admin->isAuth();
        $this->load->library('parser');
		$this->load->database();
    }
    public function index() {
        
        $this->display();
    }
	
	public function display() {
		$this->load->library("table");
		$templateData = array(
			"h2" => "Accounts List",
			"list" => ""
		);
		$table_template = array (
                    'table_open'          => '<table class="DataList">',

                    'heading_row_start'   => '<tr>',
                    'heading_row_end'     => '</tr>',
                    'heading_cell_start'  => '<th>',
                    'heading_cell_end'    => '</th>',

                    'row_start'           => '<tr>',
                    'row_end'             => '</tr>',
                    'cell_start'          => '<td>',
                    'cell_end'            => '</td>',

                    'row_alt_start'       => '<tr class="AltRow">',
                    'row_alt_end'         => '</tr>',
                    'cell_alt_start'      => '<td>',
                    'cell_alt_end'        => '</td>',

                    'table_close'         => '</table>'
              );
		$this->table->set_template($table_template);
		$this->table->set_heading("First Name", "Last Name", "Email", "Date Created", "Account Type","Status", "Actions");
		
		$sql = "SELECT account_id, firstname, lastname, email, created, status, account_type FROM ACCOUNT";
		$query = $this->db->query($sql);
		foreach ($query->result() as $row) {
				$email = '<a href="/admin/account/user/'.$row->ACCOUNT_ID.'">'.$row->EMAIL.'</a>';
				$actions ='<a href="/admin/account/activate/'.$row->ACCOUNT_ID.'"><img src="/media/images/icon-unlock-small.png" title="Activate '.$row->LASTNAME.'"></a>';
				if ($row->STATUS == "A")
					$actions ='<a href="/admin/account/suspend/'.$row->ACCOUNT_ID.'"><img src="/media/images/icon-lock-small.png" title="Suspend '.$row->LASTNAME.'"></a>';
				$type = $row->ACCOUNT_TYPE == "A" ? "Administrator":"Regular";
				$this->table->add_row($row->FIRSTNAME, $row->LASTNAME, $email, $row->CREATED, $type, $row->STATUS, $actions);
		}

		$templateData["list"] =  $this->table->generate();
		
        $this->admin->loadHeader("Accounts List");
        $this->parser->parse("admin/accounts", $templateData);
        $this->admin->loadFooter();
	}
    
    public function create() {
		

		$this->load->helper("notify");
		$this->load->library("form_validation");
		$this->form_validation->set_rules("type", "Account type", "required");
		$this->form_validation->set_rules("firstname", "First Name", "required");
		$this->form_validation->set_rules("lastname", "Last Name", "required");
		$this->form_validation->set_rules("email", "Email", "required");
		$this->form_validation->set_rules("password", "Password", "required|matches[verifyPassword]");
		
        $templateData = array(
			"notification" => "",
			"rSelected" => 'checked="checked"',
			"aSelected" => "",
			"firstname" => "",
			"lastname" => "",
			"email" => ""
        );
		
		if ($this->input->post("action") && $this->input->post("action") == "Create User") {
			if ($this->form_validation->run() === false) {
				$templateData["notification"] = getWarning(validation_errors());
			} else {
				$this->load->helper("encrypt");
				$sql = "INSERT INTO ACCOUNT (ACCOUNT_ID, EMAIL, PASSWORD, FIRSTNAME, LASTNAME, CREATED, ACCOUNT_TYPE, STATUS) VALUES (DEFAULT, ?, ?, ?, ?, CURRENT DATE, ?, DEFAULT);";
				
				$formData = array(
					$this->input->post("email"),
					ci_encrypt($this->input->post("password")),
					$this->input->post("firstname"),
					$this->input->post("lastname"),
					$this->input->post("type")
				);
				$query = $this->db->query($sql, $formData);
				if ($query === true)
					$templateData["notification"] = getMessage("User created successfully");
				else
					$templateData["notification"] = getError("An error has occured. Try again.");
			}
		}
		
        $this->admin->loadHeader("Create a new account");
        $this->parser->parse("admin/accounts-create", $templateData);
        $this->admin->loadFooter();
    }

}