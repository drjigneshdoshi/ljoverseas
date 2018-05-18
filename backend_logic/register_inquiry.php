<?php

$date = date("Y-m-d H:i:s");
$name = ucfirst($_POST['name']);
$email = $_POST['email'];
$inquiry_purpose = $_POST['inquiry_purpose'];
$inquiry_description = $_POST['inquiry_desc'];
$contact=$_POST['contact'];
$inquiry_stream=$_POST['stream'];


    if(strlen($name)<3)
    {
        $response['success']=false;
        $response['error_message']="Name Should Be Atleast 3 Characters Long ";
    }
    
    else{
        $sql_temp = "INSERT INTO `inquiry_details`(`inquiry_date`, `student_name`, `emailid`, `inquiry_purpose`, `inquiry_description`, `inquiry_contact_no`,`inquiry_stream`, `inquiry_status`, `replied_by`, `replied_on`, `replied_remark`) VALUES ('$date','$name','$email','$inquiry_purpose','$inquiry_description','$contact','$inquiry_stream','Active','','','')";
        $res_temp = mysqli_query($connect,$sql_temp);

        if ($res_temp==null) {
             $response['success']=false;
             $response['error_message']="Input failed. Try again";
        }    
		else {
		    $response['success']=true;
           
		}

    }

    echo json_encode($response);
?>