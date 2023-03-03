<?php
include('db_connect.php');

// Generate the SQL dump file
$output = shell_exec("mysqldump -u username -p password dbname > books.sql");

// Send the file to the browser for download
header('Content-Type: application/octet-stream');
header('Content-Disposition: attachment; filename="books.sql"');
echo file_get_contents('books.sql');
exit;
