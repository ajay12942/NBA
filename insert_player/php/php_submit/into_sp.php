
<html>
<head>
<meta charset="UTF-8">
<title>Success !</title> 
<link rel="stylesheet" href="css/style.css">

</head>

<body>
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


$spid = $_POST["pid"];
$spd = $_POST["pd"];
$spp = $_POST["pp"];
$spbt = $_POST["pbt"];
$spin = $_POST["pin"];
$spps = $_POST["pps"];
$spsr = $_POST["psr"];


?>
<ul class="menu cf">
<li><a href="../../../INDEX.html">Home</a></li>
<li><a href="../../../search_player/player_search.html">Search</a> </li>
<li><a href="../../../update_player/update_player.html">Update</a></li>
<li><a href="../../insert_new_player.html">Insert</a></li>
<li><a href="../../../database/database.php">Database</a></li>
<li><a href="../../../report/project_report.html">Report</a></li>
<li><a href="../../../procedures/procedures.html">Procedures</a></li>

</ul>



<?php
$sql = "INSERT INTO $dbname.sp (PLAYER_ID,DRIBBLING,PASSING,BTFW,INDIVIDUAL_DEFENCE,PSBH,SR ) VALUES ('$spid','$spd','$spp','$spbt','$spin','$spps','$spsr')";

if ($conn->query($sql) === TRUE) {
echo "<h3 style=\"color:white; text-align:center; font-family:cursive;\">New record inserted successfully ! Go ahead to <a href=\"../../../database/database.php\">DATABASE</a> to see for yourself.</h3>";
} else {
header("Location:index.html");
//echo "Error: " . $sql . "<br>" . $conn->error;
}
$conn->close();
?>
<canvas>                    
</canvas>

<script  src="js/index.js"></script>
</body>
</html>
