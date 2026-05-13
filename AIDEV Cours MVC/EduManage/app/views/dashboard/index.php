<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Dashboard - EduManage</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>

        body{
            background:#f4f7fb;
        }

        .sidebar{
            width:250px;
            height:100vh;
            position:fixed;
            background:#1e293b;
            padding-top:20px;
        }

        .sidebar h3{
            color:white;
            text-align:center;
            margin-bottom:30px;
        }

        .sidebar a{
            display:block;
            color:#cbd5e1;
            text-decoration:none;
            padding:15px 25px;
            transition:0.3s;
        }

        .sidebar a:hover{
            background:#334155;
            color:white;
        }

        .main{
            margin-left:250px;
            padding:30px;
        }

        .card-box{
            border:none;
            border-radius:20px;
            box-shadow:0 5px 15px rgba(0,0,0,0.08);
        }

    </style>

</head>
<body>

<!-- SIDEBAR -->

<div class="sidebar">

    <h3>EduManage</h3>

    <a href="index.php?url=dashboard/index">
        Dashboard
    </a>

    <a href="index.php?url=student/index">
        Étudiants
    </a>

    <a href="index.php?url=student/create">
        Ajouter étudiant
    </a>

    <a href="index.php?url=course/index">
        Cours
    </a>

    <a href="index.php?url=course/create">
        Ajouter cours
    </a>

    <a href="index.php?url=enrollment/index">
        Inscriptions
    </a>

    <a href="index.php?url=enrollment/create">
        Nouvelle inscription
    </a>

    <a href="index.php?url=auth/logout">
        Déconnexion
    </a>

</div>

<!-- MAIN -->

<div class="main">

    <div class="d-flex justify-content-between align-items-center mb-4">

        <div>
            <h2>Dashboard</h2>

            <p class="text-muted">
                Bienvenue
                <?= $user['email'] ?>
            </p>
        </div>

    </div>

    <!-- CARDS -->

    <div class="row">

        <div class="col-md-4 mb-4">

            <div class="card card-box p-4">

                <h5>Gestion étudiants</h5>

                <p class="text-muted">
                    Ajouter, modifier et consulter les étudiants.
                </p>

                <a href="index.php?url=student/index"
                   class="btn btn-primary">
                    Ouvrir
                </a>

            </div>

        </div>

        <div class="col-md-4 mb-4">

            <div class="card card-box p-4">

                <h5>Gestion cours</h5>

                <p class="text-muted">
                    Administrer les cours et les niveaux.
                </p>

                <a href="index.php?url=course/index"
                   class="btn btn-warning text-white">
                    Ouvrir
                </a>

            </div>

        </div>

        <div class="col-md-4 mb-4">

            <div class="card card-box p-4">

                <h5>Gestion inscriptions</h5>

                <p class="text-muted">
                    Associer étudiants et cours.
                </p>

                <a href="index.php?url=enrollment/index"
                   class="btn btn-dark">
                    Ouvrir
                </a>

            </div>

        </div>

    </div>

    <!-- INFOS -->

    <div class="card card-box p-4 mt-3">

        <h4 class="mb-3">
            Informations système
        </h4>

        <table class="table">

            <tr>
                <th>Application</th>
                <td>EduManage MVC</td>
            </tr>

            <tr>
                <th>Version</th>
                <td>1.0</td>
            </tr>

            <tr>
                <th>Utilisateur connecté</th>
                <td><?= $user['email'] ?></td>
            </tr>

            <tr>
                <th>Architecture</th>
                <td>PHP MVC</td>
            </tr>

        </table>

    </div>

</div>

</body>
</html>