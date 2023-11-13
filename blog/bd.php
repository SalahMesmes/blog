<?php 


if( strstr($_SERVER['HTTP_HOST'], '51.178.86.117') ){

    
    $name = "salah";
    $username = "salah";
    $password = "up7Li(La";
}else{
    $name = "blog";
    $username = "root";
    $password = "";
}

try
{
    $db = new PDO('mysql:host=localhost;dbname='.$name.';charset=utf8', $username, $password);
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING); // On Ã©met une alerte Ã  chaque fois qu'une
}
catch(Exception $e)
{
    echo 'Erreur : '.$e->getMessage();
    //die('Erreur : '.$e->getMessage());
}
