<?php

// Basic example of PHP script to handle with jQuery-Tabledit plug-in.
// Note that is just an example. Should take precautions such as filtering the input data.

//header('Content-Type: application/json');

include('db-connect.php');

$input = filter_input_array(INPUT_POST);

if ($input['action'] === 'edit') 
{	
    $sql = "UPDATE SP SET " .
    "DRIBBLING = '" . $input['DRIBBLING'] . "', " .
    "PASSING = '" . $input['PASSING'] . "', " .
    "BTFW = '" . $input['BTFW'] . "', " .
    "INDIVIDUAL_DEFENCE = '" . $input['INDIVIDUAL_DEFENCE'] . "', " .
    "PSBH = '" . $input['PSBH'] . "', " .
    "SR = '" . $input['SR'] . "' " .
    "WHERE PLAYER_ID = '" . $input['PLAYER_ID'] . "'";

    
	
    mysqli_query($con,$sql);
} 
if ($input['action'] === 'delete') 
{
    mysqli_query($con,"DELETE FROM SP WHERE PLAYER_ID='" . $input['PLAYER_ID'] . "'");
} 

mysqli_close($mysqli);

echo json_encode($input);
?>
