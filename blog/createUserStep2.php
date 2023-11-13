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
include_once( 'header.php')
?>


<?php
// Vérifier si le login existe déjà
$login = htmlspecialchars( $_POST['login'] );
$password =  htmlspecialchars($_POST['password']);
$passwordConfirm = htmlspecialchars( $_POST['passwordConfirm'] );

$req = $db->prepare( 'SELECT * FROM users2 WHERE pseudo =:pseudo' );
$req->execute( [':pseudo'=>$login] );
if( $req->rowCount() ) {
    
    header( 'Location: createUserStep1.php?invalidpseudo=1' );
    exit();
}

// Vérifier le mot de passe et la confirm
if( strlen( $password ) < 8 ) {
    header( 'Location: createUserStep1.php?invalidpass=1' );
    exit();
}
if( $password != $passwordConfirm ) {
    header( 'Location: createUserStep1.php?invalidconfirm=1' );
    exit();
} 

$passHash = sodium_crypto_pwhash_str( 
    $password, 
    SODIUM_CRYPTO_PWHASH_OPSLIMIT_INTERACTIVE,
    SODIUM_CRYPTO_PWHASH_MEMLIMIT_INTERACTIVE
);
// $salt = random_bytes( SODIUM_CRYPTO_PWHASH_SALTBYTES );
// $passHash = sodium_crypto_pwhash( 
//     SODIUM_CRYPTO_AEAD_CHACHA20POLY1305_IETF_KEYBYTES, 
//     $password, 
//     $salt, 
//     SODIUM_CRYPTO_PWHASH_OPSLIMIT_INTERACTIVE,
//     SODIUM_CRYPTO_PWHASH_MEMLIMIT_INTERACTIVE,
//     SODIUM_CRYPTO_PWHASH_ALG_ARGON2ID13
// );

//$hashedPassword = password_hash($password, PASSWORD_ARGON2ID);

$req = $db->prepare( 
    "INSERT INTO users2( pseudo, password ) VALUE( :pseudo, :password )"
 );
$isInsertOk = $req->execute([
    ':pseudo'   => $login,
    ':password' => bin2hex($passHash), 
 ]);
 if( !$isInsertOk ) {
    echo "Erreur lors de l'enregistrement";
    die;
 } else {
     $idUser = $db->lastInsertId();
     $_SESSION['id'] = $idUser;
     $_SESSION['login'] = $login;
   //  echo $_SESSION['id'];
 }
?>

<section class="container mt-5">
    <div class="row">

        <div class="col-12">
            <form name="accesform" method="post" action="validUser.php" enctype="multipart/form-data">
                <input type="hidden" value="<?=$idUser?>" name="idUser">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="inputGroupFileAddon01">Fichier</span>
                    </div>
                    <div class="custom-file">
                        <input type="file" class="custom-file-input" id="photo" name="photo">
                        <label class="custom-file-label" for="photo">Choisissez votre photo de profil</label>
                    </div>
                </div>
                <div class="mb-3 row justify-content-end">
                    <div class="col-sm-4">
                        <button type="submit" class="btn btn-primary mb-3">Valider</button>


                        <a href="index.php" class="btn btn-secondary">Ignorer la photo de profil >></a>
                    </div>
                </div>

            </form>
        </div>
    </div>
</section>



<footer class="container">

</footer>


</body>