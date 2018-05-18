<?php

$sql = "SELECT * FROM `institute_master`";
$res = mysqli_query($connect,$sql);
$data = array();

while($row=mysqli_fetch_assoc($res)){
    array_push($data,$row);
}


//$response = array($data);
echo json_encode($data);

?>
