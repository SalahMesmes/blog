<?php
session_start();

require_once("bd.php");


$login = $_POST['login'];
$password = $_POST['password'];
$sql = $db->prepare("SELECT * FROM users2 WHERE pseudo=:login");
$sql->execute( [':login'=>$login] );



if( $acces = $sql->fetch(PDO::FETCH_ASSOC) ) {
    $passHash =  hex2bin($acces['password']);
    //password_verify($password, $passHash) 
    if( sodium_crypto_pwhash_str_verify($passHash, $password  )) {
        $_SESSION['login'] = $login;
        $_SESSION['photo'] = $acces['photo'];
        header('Location:index.php?error=0');
        die;
    } else {
        $_SESSION['login'] = $login;
        header('Location:login.php?error=1&passerror=1&login='.$login);
        die;
    }
} else {
    header('Location:login.php?error=1&loginerror=1');
    die;

}

header( "Location:index.php?error=0" );