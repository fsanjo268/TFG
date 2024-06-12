<?php
session_start();
?>
<?php include('header.php'); ?>

<?php

$page = isset($_GET['page'])? $_GET['page'] : "home.php";

include($page);

?>

<?php include('footer.php'); ?>
