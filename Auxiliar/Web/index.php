<?php
session_start();
?>
<?php include('header.php'); ?>

<?php

$page = @$_GET['page'];
if ($_GET['page']==null){
    include('home.php');
}else{
include($page);
}
?>

<?php include('footer.php'); ?>
