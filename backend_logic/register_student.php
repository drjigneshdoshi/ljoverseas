<?php

$first_name = ucfirst($_POST['first_name']);
$middle_name = ucfirst($_POST['middle_name']);
$last_name = ucfirst($_POST['last_name']);
$email = $_POST['email'];
$contact = $_POST['contact'];
$gender = $_POST['gender'];
$resi_add=$_POST['resi_address'];
$resi_city=$_POST['resi_city'];
$resi_state=$_POST['resi_state'];
$resi_pin=$_POST['resi_pin'];
$inst_id='517';
$enrl_no=$_POST['enrlid'];
// $inst_id=$_POST['inst_id'];

$photo = $_FILES['photo']['name'];
$password = md5($_POST['password']);
$date = date("Y-m-d H:i:s");

$maxsize    = 307200;

$imageFileType = pathinfo($photo,PATHINFO_EXTENSION);

$sql_temp = "SELECT * FROM `user_master` WHERE `email` = '$email' or `contact` = '$contact'";
$res_temp = mysqli_query($connect,$sql_temp);
$data = mysqli_fetch_assoc($res_temp);

if($data!=null)
{
    $response['success']=false;
    $response['error_message']="Email or Contact Already Exits";
}
else if(strlen($first_name)<3)
{
    $response['success']=false;
    $response['error_message']="First Name Should Be Atleast 3 Characters Long with no spaces/special characters allowed";
}
else if( strlen($last_name)<3)
{
    $response['success']=false;
    $response['error_message']="Last Name Should Be Atleast 3 Characters Long with no spaces/special characters allowed";
}

else if(strlen($contact)!=10)
{
    $response['success']=false;
    $response['error_message']="Contact Number Should Be of 10 Digits";
}
else if(strlen($_POST['password'])<8)
{
    $response['success']=false;
    $response['error_message']="Password Should Be Atleast 8 Characters Long";
}
else if($imageFileType != "jpg" && $imageFileType != "jpeg"  && $imageFileType != "JPG" && $imageFileType != "JPEG")
 {
   $response['success']=false;    $response['error_message']="Only JPG, JPEG files are allowed.";
}
else if(($_FILES['photo']['size'] > $maxsize) ) 
{
    $response['success']=false;
    $response['error_message']="File Size Should Be Less Than 300KB";
}
else if(($_FILES["photo"]["size"] == 0)) 
{
    $response['success']=false;
    $response['error_message']="File Size Can not Be Zero";
}
else{
    $sql_temp = "INSERT INTO `user_master`(`email`, `contact`, `passwd`, `user_type`, `user_status`, `created_dtm`) VALUES ('$email',$contact,'$password','Student','1','$date')";
    $res_temp = mysqli_query($connect,$sql_temp);
    
    $sql_temp = "SELECT * FROM `user_master` WHERE `email` = '$email'";
    $res_temp = mysqli_query($connect,$sql_temp);
    $data = mysqli_fetch_assoc($res_temp);
    
    $user_id = $data['user_id'];    
    
    
    $sql_temp = "INSERT INTO `student_master`(`user_id`, `first_name`, `middle_name`, `last_name`, `gender`, `photo`,`resi_address`,`resi_state`,`resi_city`,`resi_pin`) VALUES ($user_id,'$first_name','$middle_name','$last_name','$gender','$photo','$resi_add','$resi_state','$resi_city','$resi_pin')";
    $res_temp = mysqli_query($connect,$sql_temp);

    $sql_temp = "SELECT * FROM user_master u,student_master s where u.user_id = s.user_id and u.email='$email'";
    $res_temp = mysqli_query($connect,$sql_temp);
    $data = mysqli_fetch_assoc($res_temp);
    
    $student_id = $data['student_id']; 

    $foldername = "images/student/$student_id/";
    
    mkdir($foldername);
    
    
    move_uploaded_file($_FILES['photo']['tmp_name'],$foldername.$photo);
    if($res_temp)
    {
        $response['success']=true;
    }
    else
    {
        $response['success']=false;
        $response['error_message']= "Data not Added";    
    }
    
}
echo json_encode($response);
?>