<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Events extends CI_Controller {

	public function __construct() {
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
		$templateData = array(
			"list" => ""
		);
        $this->admin->loadHeader("Events");
        $this->parser->parse("admin/events", $templateData);
        $this->admin->loadFooter();
	}
	
	public function create() {
		$areas = $this->getAreas();
		$this->load->library("form_validation");
		$templateData = array(
			"heading" => "Create Event",
			"notification" => "",
			"list" => "",
			"areaPriceEntries" => "",
			"name" => "",
			"description" => "",
			"date" => "",
			"buttonValue" => "Add this event"
		);
		if (!is_null($areas)) {
			$templateData["areaPriceEntries"].= '<h3>Section Prices</h3>';
			foreach ($areas as $row) {
				$templateData["areaPriceEntries"] .= '<div><label>'.$row->NAME.'</label><input type="text" name="area['.$row->AREA_ID.']" value="" id="createArea['.$row->AREA_ID.']"  /></div>';
				$this->form_validation->set_rules('area['.$row->AREA_ID.']', $row->NAME.' price', 'required|numeric');
			}
		}
		
		if ($this->input->post("action") == "Add this event") {
			$this->load->helper("notify");
			$this->form_validation->set_rules("name", "Name", "required");
			$this->form_validation->set_rules("date", "Date", "required");
			
			if ($this->form_validation->run() == false) {
				$templateData["notification"] .= getWarning(validation_errors());
			} else {
				
			}
			
		}
		
        $this->admin->loadHeader("Events");
        $this->parser->parse("admin/events-form", $templateData);
        $this->admin->loadFooter();
	}
	
	private function getAreas() {
		$sql = "SELECT * FROM AREA";
		$query = $this->db->query($sql);
		if (count($query->result()) > 0) {
			return $query->result();
		}
		return null;
	}
}