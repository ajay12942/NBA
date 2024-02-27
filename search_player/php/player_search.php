<html>
<head>
<meta charset="UTF-8">
<title>Player Search Results</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel='stylesheet' href='css/34b729901a37198f5d0414728.css'>
<link rel="stylesheet" href="css/style.css">
<link href="css/menu.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/webfont/1.4.7/webfont.js" type="text/javascript"></script>  
<link href="https://fonts.googleapis.com/css?family=Poppins" rel="stylesheet" />

</head>
<body>

<canvas class="fireworks">

</canvas>
<section>
<ul class="menu cf">
<li><a href="../../INDEX.html">Home</a></li>
<li><a href="../player_search.html">Search</a> </li>
<li><a href="../../update_player/update_player.html">Update</a></li>
<li><a href="../../insert_player/insert_new_player.html">Insert</a></li>
<li><a href="../../database/database.php">Database</a></li>
<li><a href="../../report/project_report.html">Report</a></li>
<li><a href="../../procedures/procedures.html">Procedures</a></li>

</ul>  


<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "NBA_MANAGEMENT";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
die("Connection failed: " . $conn->connect_error);
} 
$choices = $_POST['choices-single-defaul'];
$input_name = $_POST['input_search_keyword'];
if ($choices == 'AGE' && ctype_digit(strval($input_name))) {
$sql = "SELECT * FROM PLAYERS P,PERFORMANCE PR WHERE P.PLAYER_ID=PR.PLAYER_ID AND P.P_AGE=\"$input_name\" ORDER BY P_NAME ";
?>
 <div class="tbl-header">
<table cellpadding="0" cellspacing="0" border="0"><thead>
<tr>
<th>NAME</th>
     <th>AGE</th>
    <th>STATE</th>
    <th>Avg Specific Performance</th>
    <th>Avg general performance</th>
</tr>    
</thead>    

</table> 
</div>
<div class="tbl-content">
<table cellpadding="0" cellspacing="0" border="0">
<tbody>
<?php
$result = $conn->query($sql);
if ($result) {
// output data of each row
while($row = $result->fetch_assoc()) { 
echo "<tr>";
echo("<td>" . $row["P_NAME"] . "</td> <td>" . $row["P_AGE"] . "</td> <td>" . $row["P_STATE"] . "</td><td>" .$row["SP_AVG"]. "</td><td>" .$row["GP_AVG"]. "</td>");
echo "</tr>";
}
} 
}

else if ($choices == 'STATE' && !ctype_digit(strval($input_name))) {
$sql = "SELECT * FROM PLAYERS P,PERFORMANCE PR WHERE P.PLAYER_ID=PR.PLAYER_ID AND P_STATE=\"$input_name\"";
?>
</tbody>
</table>
</div>
 <div class="tbl-header">
<table cellpadding="0" cellspacing="0" border="0"><thead>
<tr>
<th>NAME</th>
     <th>AGE</th>
    <th>STATE</th>
    <th>Avg Specific Performance</th>
    <th>Avg general performance</th>

</tr>     
</thead>    

</table> 
</div>
<div class="tbl-content">
<table cellpadding="0" cellspacing="0" border="0">
<tbody>
<?php
$result = $conn->query($sql);
if ($result) {
// output data of each row
while($row = $result->fetch_assoc()) { 
echo "<tr>";
echo("<td>" . $row["P_NAME"] . "</td> <td>" . $row["P_AGE"] . "</td> <td>" . $row["P_STATE"] . "</td><td>" .$row["SP_AVG"]. "</td><td>" .$row["GP_AVG"]. "</td>");
}
} 

}
else if ($choices == 'AVERAGE SPECIFIC PERFORMANCE' && ctype_digit(strval($input_name))) {
$sql = "SELECT * FROM PLAYERS P,PERFORMANCE PR WHERE P.PLAYER_ID=PR.PLAYER_ID AND SP_AVG=\"$input_name\"";
?>
</tbody>
</table>
</div>
 <div class="tbl-header">
<table cellpadding="0" cellspacing="0" border="0"><thead>
<tr>
   <th>NAME</th>
     <th>AGE</th>
     <th>STATE</th>
    <th>Avg Specific Performance</th>
    <th>Avg general performance</th>
     

</tr>   
</thead>    

</table>
</div>
<div class="tbl-content">
<table cellpadding="0" cellspacing="0" border="0">
<tbody>
<?php
$result = $conn->query($sql);
if ($result) {
// output data of each row
while($row = $result->fetch_assoc()) { 
echo "<tr>";
echo("<td>" . $row["P_NAME"] . "</td> <td>" . $row["P_AGE"] . "</td> <td>" . $row["P_STATE"] . "</td><td>" .$row["SP_AVG"]. "</td><td>" .$row["GP_AVG"]. "</td>");
}
} 

}

else if ($choices == 'AVERAGE GENERAL PERFORMANCE' && ctype_digit(strval($input_name))) {
    $sql = "SELECT * FROM PLAYERS P,PERFORMANCE PR WHERE P.PLAYER_ID=PR.PLAYER_ID AND GP_AVG=\"$input_name\"";
    ?>
    </tbody>
    </table>
    </div>
     <div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0"><thead>
    <tr>
       <th>NAME</th>
         <th>AGE</th>
         <th>STATE</th>
        <th>Avg Specific Performance</th>
        <th>Avg general performance</th>
         
    
    </tr>   
    </thead>    
    
    </table>
    </div>
    <div class="tbl-content">
    <table cellpadding="0" cellspacing="0" border="0">
    <tbody>
    <?php
    $result = $conn->query($sql);
    if ($result) {
    // output data of each row
    while($row = $result->fetch_assoc()) { 
    echo "<tr>";
    echo("<td>" . $row["P_NAME"] . "</td> <td>" . $row["P_AGE"] . "</td> <td>" . $row["P_STATE"] . "</td><td>" .$row["SP_AVG"]. "</td><td>" .$row["GP_AVG"]. "</td>");
    }
    } 
    
    }


else if ($choices == 'PLAYER ID' && ctype_digit(strval($input_name))) {
$sql = "SELECT * FROM PLAYERS P ,PERFORMANCE PR WHERE P.PLAYER_ID=PR.PLAYER_ID AND P.PLAYER_ID=\"$input_name\"" ;
?>
</tbody>
</table>
</div>
 <div class="tbl-header">
<table cellpadding="0" cellspacing="0" border="0"><thead>
<tr>
    <th>PLAYER ID</th>
  <th>NAME</th>
     <th>AGE</th>
     <th>STATE</th>
        <th>Avg Specific Performance</th>
        <th>Avg general performance</th>
</tr> 
</thead>    
</table> 
</div>
<div class="tbl-content">
<table cellpadding="0" cellspacing="0" border="0">
<tbody>
<?php
$result = $conn->query($sql);
if ($result) {
// output data of each row
while($row = $result->fetch_assoc()) { 
echo "<tr>";
echo("<td>" . $row["PLAYER_ID"]."</td> <td>". $row["P_NAME"] . "</td> <td>" . $row["P_AGE"] . "</td> <td>" . $row["P_STATE"] . "</td><td>" .$row["SP_AVG"]. "</td><td>" .$row["GP_AVG"]. "</td>");
}
} 

}
else if ($choices == 'PLAYER NAME' && !ctype_digit(strval($input_name))) {
$sql = "SELECT * FROM PLAYERS P ,PERFORMANCE PR WHERE P.PLAYER_ID=PR.PLAYER_ID AND P_NAME LIKE \"$input_name\"";
?>
</tbody>
</table>
</div>
 <div class="tbl-header">
<table cellpadding="0" cellspacing="0" border="0"><thead>
<tr>
    <th>NAME</th>
    <th>AGE</th>
    <th>STATE</th>
    <th>Avg Specific Performance</th>
    <th>Avg general performance</th>
</tr>  
</thead>    

</table> 
</div>
<div class="tbl-content">
<table cellpadding="0" cellspacing="0" border="0">
<tbody>
<?php
$result = $conn->query($sql);
if ($result) {
// output data of each row
while($row = $result->fetch_assoc()) { 
echo "<tr>";
echo("<td>" . $row["P_NAME"] . "</td> <td>" . $row["P_AGE"] . "</td> <td>" . $row["P_STATE"] . "</td><td>" .$row["SP_AVG"]. "</td><td>" .$row["GP_AVG"]. "</td>");
}
} 

}
else if ($choices == 'CLUB' && !ctype_digit(strval($input_name))) {
$sql = "SELECT * FROM PLAYERS P,PERFORMANCE PR,CLUB C WHERE P.PLAYER_ID =PR.PLAYER_ID AND P.PLAYER_ID=C.PLAYER_ID AND C_NAME= \"$input_name\"";
?>
</tbody>
</table>
</div>
 <div class="tbl-header">
<table cellpadding="0" cellspacing="0" border="0"><thead>
<tr>
  <th>NAME</th>
     <th>AGE</th>
     <th>STATE</th>
        <th>TEAM</th>
        <th>Avg SPECIFIC performance</th>
    <th>Avg GENERAL Performance</th>
</tr> 
</thead>    

</table>  
</div>
<div class="tbl-content">
<table cellpadding="0" cellspacing="0" border="0">
<tbody>
<?php
$result = $conn->query($sql);
if ($result) {
// output data of each row
while($row = $result->fetch_assoc()) { 
echo "<tr>";
echo("<td>" . $row["P_NAME"] . "</td> <td>" . $row["P_AGE"] . "</td> <td>" . $row["P_STATE"] . "</td><td>". $row["C_NAME"] . "</td><td>" .$row["SP_AVG"]. "</td><td>" .$row["GP_AVG"]. "</td>");
echo "</tr>";
}
} 

}

else if ($choices == 'PLAYING POSITION' && !ctype_digit(strval($input_name))) {
$sql = "SELECT P.P_NAME,PR.SP_AVG,PR.GP_AVG,C.PREFFERED_POS,PS.POINT_GUARD,PS.SHOOTING_GUARD,PS.POST,PS.SMALL_FORWARD,PS.POWER_FORWARD FROM PLAYERS P, PERFORMANCE PR, CLUB C,P_POSITION PS WHERE C.PREFFERED_POS LIKE \"$input_name\" AND P.PLAYER_ID=PR.PLAYER_ID AND P.PLAYER_ID=C.PLAYER_ID AND P.PLAYER_ID=PS.PLAYER_ID GROUP BY P.PLAYER_ID";
?>
</tbody>
</table>
</div>
 <div class="tbl-header">
<table cellpadding="0" cellspacing="0" border="0"><thead>
<tr>
    <th>NAME</th>
    <th>PREFFERED POSITION</th>
    <th colspan="2"> PERFORMANCE</th>
    <th colspan="5">RATING AT OTHER POSITIONS</th>
</tr>
<tr>
    <th></th>
    <th></th>
    <th>SPECIFIC AVERAGE</th>
    <th>GENERAL AVERAGE</th>
    <th>POINT GUARD</th>
    <th>SHOOTING-GUARD</th>
    <th>POST</th>
    <th>SMALL FORWARD</th>
    <th>POWER FORWARD</th>
</tr>
</thead>    
</table>  
</div>
<div class="tbl-content">
<table cellpadding="0" cellspacing="0" border="0">
<tbody>
<?php
$result = $conn->query($sql);
if ($result) {
// output data of each row
while($row = $result->fetch_assoc()) { 
echo "<tr>";
echo("<td>" . $row["P_NAME"] . "</td> <td>" . $row["PREFFERED_POS"] . "</td> <td>" . $row["SP_AVG"] . "</td> <td>" . $row["GP_AVG"] . "</td> <td>" .$row["POINT_GUARD"]. "</td> <td>" . $row["SHOOTING_GUARD"] . "</td> <td>" . $row["POST"] . "</td> <td>" . $row["SMALL_FORWARD"] . "</td> <td>" . $row["POWER_FORWARD"] . "</td>");
echo "</tr>";
}
} 
} else {
header("Location:index.html");
}

$conn->close();
?> </tbody>
</table>
</div>

<defs>
<radialGradient cx="50%" cy="0%" fx="50%" fy="0%" r="50%" id="radialGradient-1">
<stop stop-color="#329FFF" offset="0%"></stop>
<stop stop-color="#206EFF" offset="100%"></stop>
</radialGradient>
<radialGradient cx="50%" cy="0%" fx="50%" fy="0%" r="50%" id="radialGradient-2">
<stop stop-color="#FF7894" offset="0%"></stop>
<stop stop-color="#FF324A" offset="100%"></stop>
</radialGradient>
<radialGradient cx="50%" cy="0%" fx="50%" fy="0%" r="100%" id="radialGradient-3">
<stop stop-color="#FF7894" offset="0%"></stop>
<stop stop-color="#FF324A" offset="100%"></stop>
</radialGradient>
<radialGradient cx="50%" cy="0%" fx="50%" fy="0%" r="100%" id="radialGradient-4">
<stop stop-color="#359FFC" offset="0%"></stop>
<stop stop-color="#206EFF" offset="100%"></stop>
</radialGradient>
<radialGradient cx="50%" cy="0%" fx="50%" fy="0%" r="50%" id="radialGradient-5">
<stop stop-color="#5FFFD2" offset="0%"></stop>
<stop stop-color="#31FFA6" offset="100%"></stop>
</radialGradient>
</defs>
<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
<rect id="dot-js" x="80" y="352" width="32" height="32" rx="16"></rect>
</g>
</section>

<script src='../js/4032af61ca0478304ab7b31b7.js'></script>
<script  src="../js/index.js"></script>
<script src="../js/extention/choices.js"></script>
<script>
const choices = new Choices('[data-trigger]',
{
searchEnabled: false,
itemSelectText: '',
});
</script>
</body>
</html>
