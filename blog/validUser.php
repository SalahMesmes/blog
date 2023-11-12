<?php
session_start();
require_once("bd.php");
?>
    <html lang="fr">
    <head>
        <title></title>
        <meta charset="utf-8">
        <link rel="stylesheet" href="css/bootstrap.css" />
        <link rel="stylesheet" href="css/style.css" />
    </head>


    <body>

<?php
include_once( 'header.php');

$strInfo = '';
$isThumbOk = false;
$photoName = false;
$errorThumb = false;
if( isset( $_FILES['photo'] ) && $_FILES['photo']['error'] == 0 ) {
    if( $_FILES['photo']['size'] < 128000 ) {
        $infoFichier = pathinfo( $_FILES['photo']['name'] );
        $extension_upload = $infoFichier['extension'];
        $extension_autorisees = [ 'jpg', 'jpeg', 'png' ];
        if( in_array( $extension_upload, $extension_autorisees ) ) {
            $photoName = basename( $_FILES['photo']['name'] );
            move_uploaded_file( $_FILES['photo']['tmp_name'], 'images/' . $photoName );
            $strInfo = "La photo a bien été envoyé";
            $isThumbOk = true;
        } else {
            $strInfo = "Erreur ! Le format de la photo n'est pas autorisé";
            $errorThumb = true;
        }
    } else {
        $strInfo = "La photo ne doit pas dépasser les 128Ko";
        $errorThumb = true;
    }
} else {
    $strInfo = "Erreur lors du tranfert de la photo";
    $errorThumb = true;
}

$idUser = $_POST['idUser'];
$req = $db->prepare( 'UPDATE users2 SET photo=:photo WHERE id=:id ');
$setUpdate = $req->execute([
        ':photo'        => $photoName,
        ':id'           => $idUser
]);
if( !$setUpdate ) {
    echo 'Erreur lors de la mise à jour !';
    die;
} else {
    $_SESSION['photo'] = $photoName;
    header( "Location:index.php?error=0" );
}


?>



