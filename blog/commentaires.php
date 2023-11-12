<!DOCTYPE html>
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
<header class="container">
    <div class="row justify-content-center">
        <div class="col-12">
            <h1>Mon super blog !</h1>
            <p><a href="index.php" class="btn btn-secondary">Retour Ã  la liste des billets</a></p>
        </div>
    </div>
</header>

<section class="container-fluid">
    <div class="row justify-content-center">
        <div class="col-9">
            <?php
            // Connexion à la base de donnÃ©es
            require_once("bd.php");

            // RÃ©cupÃ©ration du billet
            $req = $db->prepare(
                'SELECT id, titre, contenu, DATE_FORMAT(date_creation, \'%d/%m/%Y à %Hh%imin%ss\') AS date_creation_fr FROM billets 
                WHERE id = :id'
            );
            $req->execute([
                    ':id'=>$_REQUEST['billet']
            ]);
            $donnees = $req->fetch();
            ?>
            <div class="card mt-5">
                <div class="card-header">
                    <em>publiÃ© le <?php echo $donnees['date_creation_fr']; ?></em>
                </div>
                <div class="card-body">
                    <h5 class="card-title"><?php echo htmlspecialchars($donnees['titre']); ?></h5>
                    <p class="card-text"><?php echo nl2br(htmlspecialchars($donnees['contenu'])); ?></p>
                </div>
            </div>
        </div>
    </div>

    <div class="row justify-content-center mt-5">
        <div class="col-9">

            <h3>Commentaires</h3>

            <div class="list-group">
                <?php
                $req->closeCursor(); // Important : on libÃ¨re le curseur pour la prochaine requÃªte

                // RÃ©cupÃ©ration des commentaires
                $req = $db->prepare(
                    'SELECT 
                                auteur, 
                                commentaire, 
                                DATE_FORMAT(date_commentaire, \'%d/%m/%Y à %Hh%imin%ss\') AS date_commentaire_fr 
                            FROM commentaires 
                            WHERE id_billet = :id 
                            ORDER BY date_commentaire DESC'
                );
                $req->execute([
                        ':id'=>$_GET['billet']
                ]);

                while ($donnees = $req->fetch())
                {
                    ?>

                    <a href="#" class="list-group-item list-group-item-action flex-column align-items-start">
                        <div class="d-flex w-100 justify-content-between">
                            <h5 class="mb-1"><?php echo htmlspecialchars($donnees['auteur']); ?></h5>
                            <small><?php echo htmlspecialchars($donnees['auteur']); ?></strong> le <?php echo $donnees['date_commentaire_fr']; ?></small>
                        </div>
                        <p class="mb-1"><?php echo nl2br(htmlspecialchars($donnees['commentaire'])); ?></p>
                    </a>
                    <?php
                } // Fin de la boucle des commentaires
                $req->closeCursor();
                ?>
            </div>
        </div>
    </div>


</section>

</body>
</html>