<!DOCTYPE html>
<html lang="en" >

<head>
<meta charset="UTF-8">
<title>Insert Player Data</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

<link rel='stylesheet' href='css/34b729901a37198f5d0414728.css'>

<link rel="stylesheet" href="css/style.css">
<link href='https://fonts.googleapis.com/css?family=Love+Ya+Like+A+Sister' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Codystar' rel='stylesheet' type='text/css'>
<link href="css/menu.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/webfont/1.4.7/webfont.js" type="text/javascript"></script>    <link href="https://fonts.googleapis.com/css?family=Poppins" rel="stylesheet" />
<link href="css/searchbar.css" rel="stylesheet" />

</head>

<body>

<canvas class="fireworks">

</canvas>
<section>

<ul class="menu cf">
<li><a href="../../INDEX.html">Home</a></li>
<li><a href="../../search_player/player_search.html">Search</a> </li>
<li><a href="../../update_player/update_player.html">Update</a></li>
<li><a href="../insert_new_player.html">Insert</a></li>
<li><a href="../../database/database.php">Database</a></li>
<li><a href="../../report/project_report.html">Report</a></li>
<li><a href="../../procedures/procedures.html">Procedures</a></li>

</ul>   

<?php
$servername = "localhost";
$username = "root";
$password = "";

// Create connection
$conn = new mysqli($servername, $username, $password);

// Check connection
if ($conn->connect_error) {
die("Connection failed: " . $conn->connect_error);
} 

$choices = $_POST["choices-single-defaul"];
?>
    
<?php
if($choices=='PLAYER DETAILS'){
echo "<form action=\"php_submit/into_personal_details.php\" method=\"post\">";
echo "<input id=\"input-1s\" type=\"text\" placeholder=\"PlayerID\" required autofocus name=\"pid\"/>";
echo "<label for=\"input-1\">";
echo "<span class=\"label-text\">Player ID</span>";
echo "<span class=\"nav-dot\"></span>";
echo "</label>";
echo "<input id=\"input-2\" type=\"text\" placeholder=\"Player Name\" required name=\"pname\"/>";
echo "<label for=\"input-2\">";
echo "<span class=\"label-text\">Player Name</span>";
echo "<span class=\"nav-dot\"></span>";
echo "</label>";
echo "<input id=\"input-3\" type=\"text\" placeholder=\"Age\" required name=\"page\"/>";
echo "<label for=\"input-3\">";
echo " <span class=\"label-text\">Player Age</span>";
echo "  <span class=\"nav-dot\"></span>";
echo "</label>";
echo "<input id=\"input-5\" type=\"text\" placeholder=\"STATE\" required name=\"pstate\"/>";
echo "<label for=\"input-5\">";
echo "  <span class=\"label-text\">STATE</span>";
echo "  <span class=\"nav-dot\"></span>";
echo "</label>";
echo "<button type=\"submit\" onclick=\"php_submit/into_personal_details.php\" class=\"signup-button\">INSERT</button>";
echo "<p class=\"tip\">Press Tab</p>";
echo "</form>";
}

else  if($choices=='PLAYER CLUB'){

echo "<form action=\"php_submit/into_club.php\" method=\"post\">";
echo "<input id=\"input-1s\" type=\"text\" placeholder=\"PlayerID\" required autofocus name=\"pid\"/>";
echo "<label for=\"input-1\">";
echo "<span class=\"label-text\">Player ID</span>";
echo "<span class=\"nav-dot\"></span>";
echo "</label>";
echo "<input id=\"input-2\" type=\"text\" placeholder=\"Player Club\" required name=\"pclub\"/>";
echo "<label for=\"input-2\">";
echo "<span class=\"label-text\">Player Club</span>";
echo "<span class=\"nav-dot\"></span>";
echo "</label>";

echo "<input id=\"input-3\" type=\"text\" placeholder=\"Preferred Position\" required name=\"ppreferredposition\"/>";
echo "<label for=\"input-3\">";
echo " <span class=\"label-text\">Preferred Position</span>";
echo "  <span class=\"nav-dot\"></span>";
echo "</label>";

echo "<button type=\"submit\" onclick=\"php_submit/into_other_details.php\" class=\"signup-button\">INSERT</button>";
echo "<p class=\"tip\">Press Tab</p>";
echo "</form>";

}

else  if($choices=='POSITION'){

echo "<form action=\"php_submit/into_position.php\" method=\"post\">";
echo "<input id=\"input-1s\" type=\"text\" placeholder=\"PlayerID\" required autofocus name=\"pid\"/>";
echo "<label for=\"input-1\">";
echo "<span class=\"label-text\">Player ID</span>";
echo "<span class=\"nav-dot\"></span>";
echo "</label>";
echo "<input id=\"input-2\" type=\"text\" placeholder=\"Player@point-guard\" required name=\"ppg\"/>";
echo "<label for=\"input-2\">";
echo "<span class=\"label-text\">Player@Point-guard Rating</span>";
echo "<span class=\"nav-dot\"></span>";
echo "</label>";
echo "<input id=\"input-3\" type=\"text\" placeholder=\"Player@shooting-guard\" required name=\"psg\"/>";
echo "<label for=\"input-3\">";
echo " <span class=\"label-text\">Player@Shooting-guard Rating</span>";
echo "  <span class=\"nav-dot\"></span>";
echo "</label>";
echo "<input id=\"input-4\" type=\"text\" placeholder=\"Player@post\" required name=\"pp\"/>";
echo "<label for=\"input-4\">";
echo "  <span class=\"label-text\">Player@post Rating</span>";
echo "  <span class=\"nav-dot\"></span>";
echo "</label>";
echo "<input id=\"input-5\" type=\"text\" placeholder=\"Player@small_Forward\" required name=\"psf\"/>";
echo "<label for=\"input-5\">";
echo "  <span class=\"label-text\">Player@small-forward Rating</span>";
echo "  <span class=\"nav-dot\"></span>";
echo "</label>";
echo "<input id=\"input-5\" type=\"text\" placeholder=\"Player@power_Forward\" required name=\"ppf\"/>";
echo "<label for=\"input-5\">";
echo "  <span class=\"label-text\">Player@Power-Forward Rating</span>";
echo "  <span class=\"nav-dot\"></span>";
echo "</label>";
echo "<button type=\"submit\" onclick=\"php_submit/into_position.php\" class=\"signup-button\">INSERT</button>";
echo "<p class=\"tip\">Press Tab</p>";
echo "</form>";
}

else  if($choices=='SPECIFIC PERFORMANCE'){

echo "<form action=\"php_submit/into_sp.php\" method=\"post\">";
echo "<input id=\"input-1s\" type=\"text\" placeholder=\"PlayerID\" required autofocus name=\"pid\"/>";
echo "<label for=\"input-1\">";
echo "<span class=\"label-text\">Player ID</span>";
echo "<span class=\"nav-dot\"></span>";
echo "</label>";

echo "<input id=\"input-2\" type=\"text\" placeholder=\"Dribbling\" required name=\"pd\"/>";
echo "<label for=\"input-2\">";
echo "<span class=\"label-text\">DRIBBLING</span>";
echo "<span class=\"nav-dot\"></span>";
echo "</label>";

echo "<input id=\"input-3\" type=\"text\" placeholder=\"Passing\" required name=\"pp\" />";
echo "<label for=\"input-3\">";
echo " <span class=\"label-text\">Passing</span>";
echo "  <span class=\"nav-dot\"></span>";
echo "</label>";

echo "<input id=\"input-4\" type=\"text\" placeholder=\"Body technique and Foot word\" required name=\"pbt\"/>";
echo "<label for=\"input-4\">";
echo "  <span class=\"label-text\">Body technique and Foot work</span>";
echo "  <span class=\"nav-dot\"></span>";
echo "</label>";

echo "<input id=\"input-5\" type=\"text\" placeholder=\"Induvidual defence\" required name=\"pin\"/>";
echo "<label for=\"input-5\">";
echo "  <span class=\"label-text\">Individual defence</span>";
echo "  <span class=\"nav-dot\"></span>";
echo "</label>";

echo "<input id=\"input-5\" type=\"text\" placeholder=\"Player stance and Ball handling\" required name=\"pps\"/>";
echo "<label for=\"input-5\">";
echo "  <span class=\"label-text\">Curve</span>";
echo "  <span class=\"nav-dot\"></span>";
echo "</label>";

echo "<input id=\"input-5\" type=\"text\" placeholder=\"Shooting and Rebounding\" required name=\"psr\"/>";
echo "<label for=\"input-5\">";
echo "  <span class=\"label-text\">Shooting and Rebounding</span>";
echo "  <span class=\"nav-dot\"></span>";
echo "</label>";

echo "<button type=\"submit\" onclick=\"php_submit/into_player_stats.php\" class=\"signup-button\">INSERT</button>";
echo "<p class=\"tip\">Press Tab</p>";
echo "</form>";

}
else if($choices=='GENERAL PERFORMANCE'){

echo "<form action=\"php_submit/into_gp.php\" method=\"post\">";
echo "<input id=\"input-1s\" type=\"text\" placeholder=\"PlayerID\" required autofocus name=\"pid\" />";
echo "<label for=\"input-1\">";
echo "<span class=\"label-text\">Player ID</span>";
echo "<span class=\"nav-dot\"></span>";
echo "</label>";
echo "<input id=\"input-2\" type=\"text\" placeholder=\"strength\" required name=\"pst\"/>";
echo "<label for=\"input-2\">";
echo "<span class=\"label-text\">Strength</span>";
echo "<span class=\"nav-dot\"></span>";
echo "</label>";
echo "<input id=\"input-3\" type=\"text\" placeholder=\"Power\" required name=\"ppwr\"/>";
echo "<label for=\"input-3\">";
echo " <span class=\"label-text\">Power</span>";
echo "  <span class=\"nav-dot\"></span>";
echo "</label>";
echo "<input id=\"input-3\" type=\"text\" placeholder=\"Endurance\" required name=\"pend\"/>";
echo "<label for=\"input-3\">";
echo " <span class=\"label-text\">Endurance</span>";
echo "  <span class=\"nav-dot\"></span>";
echo "</label>";
echo "<input id=\"input-3\" type=\"text\" placeholder=\"Co-ordination\" required name=\"pco\"/>";
echo "<label for=\"input-3\">";
echo " <span class=\"label-text\">Co-ordination</span>";
echo "  <span class=\"nav-dot\"></span>";
echo "</label>";
echo "<button type=\"submit\" onclick=\"php_submit/into_salary.php\" class=\"signup-button\">INSERT</button>";
echo "<p class=\"tip\">Press Tab</p>";
echo "</form>";

}
else {
header("Location:index.html");
}
?>
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

<script src='js/4032af61ca0478304ab7b31b7.js'></script>

<script  src="js/index.js"></script>

<script src="js/extention/choices.js"></script>
<script>
const choices = new Choices('[data-trigger]',
{
searchEnabled: false,
itemSelectText: '',
});

</script>

</body>

</html>
