<?php
session_start();

require_once("bd.php");

if( isset( $_POST['login'] ) && isset( $_POST['password'] ) ) {
    $login = $_POST['login'];
    $sql = "SELECT * FROM users2 WHERE pseudo=:login";
    $reponse = $db->prepare( $sql );
    $reponse->execute( [':login'=>$login] );

    if( $acces = $reponse->fetch(PDO::FETCH_ASSOC) ) {
       $passHash = hex2bin($acces['password']);
        if( sodium_crypto_pwhash_str_verify( $acces['password'], $_POST['password'] ) ) {
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
        //var_dump($acces['password']);
        die;
    }



    header( "Location:index.php?error=0" );


}