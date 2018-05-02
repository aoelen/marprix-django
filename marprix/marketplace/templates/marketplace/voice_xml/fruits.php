<?php
header("Content-type: text/xml");
echo '<?xml version="1.0" encoding="UTF-8"?>';
echo '<vxml version = "2.1" >';
require("phpsqlsearch_dbinfo.php");
$connection= mysqli_connect($server, $username, $password, $database);
if (!$connection) {
  die("Not connected : " . mysqli_connect_error());
}

?>

<!-- 
The header and database connection is set up.
The structure is the same as the other categories files, only the menu names and products differ. 
Also different database tables need to be accessed. 
-->

  <menu id="form-fruit" dtmf="true">
   <prompt>
<break time="1s"/>   
For bananas, press 1.
For Apples, press 2.
For oranges, press 3.
For lettuce, press 4. 
If you want to select another category, press 5.
if you'd like to retrieve prices using a product ID, Press 6.
    
   </prompt>
   <choice next="#bananas"/>
   <choice next="#apples"/>
   <choice next="#oranges"/>
   <choice next="#lettuce"/>
   <choice next="categories.php"/>
    <choice next="IDs.php"/>
 </menu>

<!-- 
All menus contain a SQL query with php to acces the database to dynamically access the latest market prices.
-->


  <menu id="bananas" dtmf="true">
   <prompt>
    <break time="1s"/>   
    Price of bananas is: 
 <?php

$querry = "SELECT `Price` FROM `Fruits` WHERE `ID`=1";
$query = mysqli_query($connection, $querry);
$rows = array();

while($r = mysqli_fetch_assoc($query)) {
    print($r['Price']);
}

?>
<break time="0.5s"/>  
CEDI per bowl.
<break time="1s"/>   
Press 1 if you'd like to retrieve other prices in this category.  
Press 2 if you'd like to retrieve prices from other categories.
Press 3 if you'd like to retrieve prices using a product ID.
</prompt>
   <choice next="#form-fruit"/>
   <choice next="categories.php"/>
    <choice next="IDs.php"/>
 </menu>



   <menu id="apples" dtmf="true">
   <prompt>
    <break time="1s"/>   
    Price of apples is: 
 <?php

$querry = "SELECT `Price` FROM `Fruits` WHERE `ID`=2";
$query = mysqli_query($connection, $querry);
$rows = array();

while($r = mysqli_fetch_assoc($query)) {
    print($r['Price']);
}

?>
<break time="0.5s"/>  
CEDI per bowl.
    <break time="1s"/>   
Press 1 if you'd like to retrieve other prices in this category.  
Press 2 if you'd like to retrieve prices from other categories.
Press 3 if you'd like to retrieve prices using a product ID.
</prompt>
   <choice next="#form-fruit"/>
   <choice next="categories.php"/>
    <choice next="IDs.php"/>
 </menu>



    <menu id="oranges" dtmf="true">
   <prompt>
    <break time="1s"/>   
    Price of oranges is: 
 <?php

$querry = "SELECT `Price` FROM `Fruits` WHERE `ID`=3";
$query = mysqli_query($connection, $querry);
$rows = array();

while($r = mysqli_fetch_assoc($query)) {
    print($r['Price']);
}

?>
<break time="0.5s"/>  
CEDI per bowl.
<break time="1s"/>   
Press 1 if you'd like to retrieve other prices in this category.  
Press 2 if you'd like to retrieve prices from other categories.
Press 3 if you'd like to retrieve prices using a product ID.
</prompt>
   <choice next="#form-fruit"/>
   <choice next="categories.php"/>
    <choice next="IDs.php"/>
 </menu>



<menu id="lettuce" dtmf="true">
   <prompt>
    <break time="1s"/>   
    The price of lettuce is: 
    
 <?php

$querry = "SELECT `Price` FROM `Fruits` WHERE `ID`=4";
$query = mysqli_query($connection, $querry);
$rows = array();

while($r = mysqli_fetch_assoc($query)) {
    print($r['Price']);
}

?>

<break time="0.5s"/>  
CEDI per bowl.
<break time="1s"/>   
Press 1 if you'd like to retrieve other prices in this category.  
Press 2 if you'd like to retrieve prices from other categories.
Press 3 if you'd like to retrieve prices using a product ID.
</prompt>
   <choice next="#form-fruit"/>
   <choice next="categories.php"/>
    <choice next="IDs.php"/>
 </menu>

<!-- 
The database connection is closed.
-->


 <?php
mysqli_close($connection);
 ?>
</vxml>