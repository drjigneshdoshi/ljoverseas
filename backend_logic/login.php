<?php

$email=$_POST['email'];
$password=md5($_POST['password']);

$admin = "select * from  user_master where ( email='$email' OR contact = '$email') and passwd='$password'";
$admin_result=$connect->query($admin);
$admin_row=$admin_result->fetch_array();
$uid = $admin_row['user_id'];
$ustatus = $admin_row['user_status'];

if ( $ustatus == '0' || $ustatus == "" ) { 
    $response['success']=false;
    $response['error_message']= "User is disabled";    
}
else if(($admin_row['email'] == $email || $admin_row['contact'] == $email) && $admin_row['passwd'] == $password)
{
    // $sql_temp = "SELECT * FROM `user_master` WHERE `email` = '$email' or `contact` = '$email'";
    // $res_temp = mysqli_query($connect,$sql_temp);
    // $data = mysqli_fetch_assoc($res_temp);
    // $email_temp = $data['email']; 
    $admin = "SELECT * FROM `student_master` s,`user_master` u WHERE s.user_id = u.user_id AND u.user_id = $uid";
    $admin_result=$connect->query($admin);
    $data_row=$admin_result->fetch_array();
    
    $response['success']=true;
    $response['email']=$admin_row['email'];
    $response['first_name']=$data_row['first_name'];
    $response['last_name']=$data_row['last_name'];
    $response['credentials']=md5($admin_row['email'].":".$password);
    $response['user_type']=$admin_row['user_type'];
}
else
{
    $response['success']=false;
    $response['error_message']= "Invaid Credentials";    
}
echo json_encode($response);
?>