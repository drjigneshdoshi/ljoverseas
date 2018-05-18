<?php

$sql = "SELECT * FROM `stream_master`";
$res = mysqli_query($connect,$sql);
$data = array();

while($row=mysqli_fetch_assoc($res)){
    array_push($data,$row);
}

$sql = "SELECT * FROM `branch_master`";
$res = mysqli_query($connect,$sql);
$data1 = array();

while($row=mysqli_fetch_assoc($res)){
    array_push($data1,$row);
}

$response = array("streams"=>$data,"branches"=>$data1);
echo json_encode($response);

?>
