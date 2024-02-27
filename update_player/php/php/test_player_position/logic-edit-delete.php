<?php

// Basic example of PHP script to handle with jQuery-Tabledit plug-in.
// Note that is just an example. Should take precautions such as filtering the input data.

//header('Content-Type: application/json');

include('db-connect.php');

$input = filter_input_array(INPUT_POST);

if ($input['action'] === 'edit') 
{	
	$sql = "UPDATE P_POSITION 
        SET POINT_GUARD = '" . $input['POINT_GUARD'] . "', 
            SHOOTING_GUARD = '" . $input['SHOOTING_GUARD'] . "', 
            POST = '" . $input['POST'] . "', 
            SMALL_FORWARD = '" . $input['SMALL_FORWARD'] . "', 
            POWER_FORWARD = '" . $input['POWER_FORWARD'] . "' 
        WHERE PLAYER_ID = '" . $input['PLAYER_ID'] . "'";

	
    mysqli_query($con,$sql);
} 
if ($input['action'] === 'delete') 
{
    mysqli_query($con,"DELETE FROM P_POSITION WHERE PLAYER_ID='" . $input['PLAYER_ID'] . "'");
} 


mysqli_close($mysqli);

echo json_encode($input);
?>
