<?php
	$connect = mysqli_connect("localhost","root","","ljoverseas");

	if(!$connect){
		die("Connection Failed: " .mysqli_connect_error());
	}
?>
