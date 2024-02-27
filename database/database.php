<!DOCTYPE html>
<html lang="en" >

<head>
  <meta charset="UTF-8">
  <title>Database</title>
  
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
    <link rel='stylesheet' href='css/34b729901a37198f5d0414728.css'>
      <link rel="stylesheet" href="css/style.css">
      <link href='https://fonts.googleapis.com/css?family=Codystar' rel='stylesheet' type='text/css'>
      <link href="css/menu.css" rel="stylesheet" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.4.7/webfont.js" type="text/javascript"></script>   
      <link href="https://fonts.googleapis.com/css?family=Poppins" rel="stylesheet" />
  
</head>

<body style="background-image: linear-gradient(to right top, #1600ff, #9300a5, #930061, #751039, #4c2e2e);">
    <canvas class="fireworks">
        
      </canvas>
  <section>
      <ul class="menu cf navbar">
          <li><a href="../INDEX.html">Home</a></li>
          <li><a href="../search_player/player_search.html">Search</a> </li>
          <li><a href="../update_player/update_player.html">Update</a></li>
          <li><a href="../insert_player/insert_new_player.html">Insert</a></li>
          <li><a href="database.php">Database</a></li>
            <li><a href="../report/project_report.html">Report</a></li>
          <li><a href="../procedures/procedures.html">Procedures</a></li>
          
        </ul>  <br>      
<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "NBA_MANAGEMENT";

$conn = mysqli_connect($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
die("Connection failed: " . $conn->connect_error);
} 
?>
  <h1>PERSONAL DETAILS</h1>
  <div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
          <th>PLAYER ID</th>
          <th>NAME</th>
          <th>AGE</th>
          <th>STATE</th>
        </tr>
      </thead>
    </table>
  </div>
<div class="tbl-content">
<table cellpadding="0" cellspacing="0" border="0">
<!--<tbody>-->
<?php
$sql = "SELECT * FROM players ORDER BY PLAYER_ID";
$result = $conn->query($sql);
if ($result->num_rows >0 ) {
    while($row = $result->fetch_assoc()) { 
        echo "<tbody>";
        echo "<tr>";
         echo "<td>" .$row["PLAYER_ID"]. "</td>";
          echo "<td>" .$row["P_NAME"]. "</td>";
          echo "<td>" .$row["P_AGE"]. "</td>";
          echo "<td>" .$row["P_STATE"]. "</td>";
         echo "</tr>";
        echo "</tbody>";
    }
}else {
     echo "0 results";
 }    
?>
<!-- </tbody>-->
</table>
</div><br>

  <h1>PLAYER POSITIONS</h1>
  <div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
          <th>PLAYER ID</th>
          <th>POINT GUARD</th>
          <th>SHOOTING GUARD</th>
          <th>POST</th>
          <th>SMALL-FORWARD</th>
          <th>POWER-FORWARD</th>
        </tr>
      </thead>
    </table>
  </div>
<div class="tbl-content">
<table cellpadding="0" cellspacing="0" border="0">
<!--<tbody>-->
<?php
$sql = "SELECT * FROM p_position ORDER BY PLAYER_ID";
$result = $conn->query($sql);
if ($result->num_rows >0 ) {
    while($row = $result->fetch_assoc()) { 
        echo "<tbody>";
        echo "<tr>";
         echo "<td>" .$row["PLAYER_ID"]. "</td>";
          echo "<td>" .$row["POINT_GUARD"]. "</td>";
          echo "<td>" .$row["SHOOTING_GUARD"]. "</td>";
         echo "<td>" .$row["POST"]. "</td>";
          echo "<td>" .$row["SMALL_FORWARD"]. "</td>";
          echo "<td>" .$row["POWER_FORWARD"]. "</td>";
         echo "</tr>";
        echo "</tbody>";
    }
}else {
     echo "0 results";
 }    
?>
<!-- </tbody>-->
</table>
</div><br>
      
  <h1>SPECIFIC PERFORMANCE</h1>
  <div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
          <th>PLAYER ID</th>
          <th>DRIBBLING</th>
          <th>PASSING</th>
          <th>BODY TECHNIQUE AND FOOTWORK</th>
          <th>INDIVIDUAL DEFENCE</th>
          <th>PLAYER STANCE AND BALL HANDLING</th>
          <th>SHOOTING AND REBOUNDING</th>
        </tr>
      </thead>
    </table>
  </div>
<div class="tbl-content">
<table cellpadding="0" cellspacing="0" border="0">
<!--<tbody>-->
<?php
$sql = "SELECT * FROM SP ORDER BY PLAYER_ID";
$result = $conn->query($sql);
if ($result->num_rows >0 ) {
    while($row = $result->fetch_assoc()) { 
        echo "<tbody>";
        echo "<tr>";
         echo "<td>" .$row["PLAYER_ID"]. "</td>";
          echo "<td>" .$row["DRIBBLING"]. "</td>";
          echo "<td>" .$row["PASSING"]. "</td>";
          echo "<td>" .$row["BTFW"]. "</td>";
          echo "<td>" .$row["INDIVIDUAL_DEFENCE"]. "</td>";
          echo "<td>" .$row["PSBH"]. "</td>";
          echo "<td>" .$row["SR"]. "</td>";
         echo "</tr>";
        echo "</tbody>";
    }
}else {
     echo "0 results";
 }    
?>
<!-- </tbody>-->
</table>
</div><br>
        <h1>GENERAL PERFORMANCE</h1>
  <div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
          <th>PLAYER ID</th>
            <th>STRENGTH</th>
            <th>POWER</th>
            <th>ENDURANCE</th>
            <th>CO-ORDINATION</th>
        </tr>
      </thead>
    </table>
  </div>
<div class="tbl-content">
<table cellpadding="0" cellspacing="0" border="0">
<!--<tbody>-->
<?php
$sql = "SELECT * FROM GP ORDER BY PLAYER_ID";
$result = $conn->query($sql);
if ($result->num_rows >0 ) {
    while($row = $result->fetch_assoc()) { 
        echo "<tbody>";
        echo "<tr>";
         echo "<td>" .$row["PLAYER_ID"]. "</td>";
         echo "<td>" .$row["STRENGTH"]. "</td>";
         echo "<td>" .$row["POWER"]. "</td>";
         echo "<td>" .$row["ENDURANCE"]. "</td>";
         echo "<td>" .$row["CORDINATION"]. "</td>";
         echo "</tr>";
        echo "</tbody>";
    }
}else {
     echo "0 results";
 }    
?>
<!-- </tbody>-->
</table>
</div><br>
            
  <h1>PLAYER CLUB</h1>
  <div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
          <th>PLAYER ID</th>
          <th>CLUB</th>
          <th>PREFERRED POSITION</th>
        </tr>
      </thead>
    </table>
  </div>
<div class="tbl-content">
<table cellpadding="0" cellspacing="0" border="0">
<!--<tbody>-->
<?php
$sql = "SELECT * FROM CLUB ORDER BY PLAYER_ID";
$result = $conn->query($sql);
if ($result->num_rows >0 ) {
    while($row = $result->fetch_assoc()) { 
        echo "<tbody>";
        echo "<tr>";
         echo "<td>" .$row["PLAYER_ID"]. "</td>";
          echo "<td>" .$row["C_NAME"]. "</td>";
          echo "<td>" .$row["PREFFERED_POS"]. "</td>";
         echo "</tr>";
        echo "</tbody>";
    }
}else {
     echo "0 results";
 }  
$conn-> close();
?>
<!-- </tbody>-->
</table>
</div><br>
      
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


  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>


    <script src='js/4032af61ca0478304ab7b31b7.js'></script>

    <script  src="js/index.js"></script>


</body>

</html>
