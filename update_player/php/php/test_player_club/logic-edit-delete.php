<?php

// Basic example of PHP script to handle with jQuery-Tabledit plug-in.
// Note that is just an example. Should take precautions such as filtering the input data.

//header('Content-Type: application/json');

include('db-connect.php');

$input = filter_input_array(INPUT_POST);

if ($input['action'] === 'edit') 
{	
	$sql = "UPDATE CLUB SET  C_NAME='" . $input['C_NAME'] . "',PREFFERED_POS ='" . $input['PREFFERED_POS'] . "'" ." WHERE PLAYER_ID='" . $input['PLAYER_ID'] . "'";
	
    mysqli_query($con,$sql);
} 
if ($input['action'] === 'delete') 
{
    mysqli_query($con,"DELETE FROM CLUB WHERE PLAYER_ID='" . $input['PLAYER_ID'] . "'");
} 


mysqli_close($mysqli);

echo json_encode($input);
?>
