<!DOCTYPE html>

<?php
session_start();
require_once("bd.php");
?>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Mon blog</title>
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet" />
</head>

<body>


<header>
    <div class="row">
        <div class="col-12">
            <nav class="nav justify-content-end">
                <?php

                    $photo = 'photo';
                    $isConnect = false;
                    if( isset( $_SESSION['login'] ) ) {
                        $isConnect = true;     
                    

                        if( $isConnect ) {
                            $strPhoto = 'images/' . $_SESSION[$photo];
                            if (isset( $_SESSION['photo'] )) {
                                return $strPhoto;

                                ?>
                                    <img src="<?=$strPhoto?>" width="40"/>
                                <?php

                            }
                        
                        ?>
                        <a class="nav-link" href="logout.php">  Se déconnecter </a>
                        <?php
                        }
                    }else {
                    ?>
                        <a class="nav-link" href="login.php">Se connecter</a>
                        <a class="nav-link" href="createUserStep1.php">M'inscrire</a>
                    <?php 
                    }?>
        
            </nav>
        </div>
    </div>
    <div class="row justify-content-center">
        <div class="col-12 text-center">
            <h1>Mon super blog !</h1>
        </div>
    </div>
</header>

<section class="container-fluid">
    <?php if( $isConnect ) { ?>
    <div class="row">
        <div class="col-12">
            Bienvenue <?=$_SESSION['login'];?>
        </div>
    </div>
    <?php
    }
    ?>

    <div class="row justify-content-center">
        <div class="col-9">
            <p>Derniers billets du blog :</p>
        </div>
    </div>
    <div class="row justify-content-center">
        <div class="col-9">

            <?php
            // Connexion Ã  la base de donnÃ©es
            require_once("bd.php");

            // On rÃ©cupÃ¨re les 5 derniers billets
            $req = $db->query(
                'SELECT id, titre, contenu, DATE_FORMAT(date_creation, \'%d/%m/%Y à %Hh%imin%ss\') AS date_creation_fr FROM billets 
                    ORDER BY date_creation DESC LIMIT 0, 5'
            );

            while ($donnees = $req->fetch()) {
                ?>
                <div class="card mt-5">
                    <div class="card-header">
                        <em>publié le <?=$donnees['date_creation_fr']; ?></em>
                    </div>
                    <div class="card-body">
                        <h5 class="card-title"><?php echo htmlspecialchars($donnees['titre']); ?></h5>
                        <p class="card-text"><?php echo nl2br(htmlspecialchars($donnees['contenu'])); ?></p>
                        <a href="commentaires.php?billet=<?=$donnees['id']; ?>" class="btn btn-primary">Commentaires</a>
                    </div>
                </div>
                <?php
            } // Fin de la boucle des billets
            $req->closeCursor();
            ?>
        </div>
    </div>
</section>
</body>
</html>