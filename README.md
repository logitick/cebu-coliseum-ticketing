cebu-coliseum-ticketing
=======================

An online ticketing system for Cebu Coliseum. Project for IT 321

REQUIREMENTS
PHP with ibm_extension
	Windows users download the extension from http://sourceforge.net/projects/db2mc/files/IBM_DB2%20PHP%20Driver%20for%20Windows/

	
STEP 1:
SETUP the PHP EXtension by adding:
extension=php_ibm_db2.dll
to php.ini

copy the dll to php/ext

STEP 2
DB2:
db2set DB2COMM=TCPIP
update db2 cfg using svcename 50000

STEP 3
run sql script