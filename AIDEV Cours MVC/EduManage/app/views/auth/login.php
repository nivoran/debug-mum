<!-- app/views/auth/login.php -->

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Connexion</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body{
            background:#f4f7fb;
        }

        .login-box{
            width:400px;
            margin:100px auto;
            background:white;
            padding:40px;
            border-radius:20px;
            box-shadow:0 5px 15px rgba(0,0,0,0.1);
        }
    </style>

</head>
<body>

<div class="login-box">

    <h2 class="mb-4 text-center">Connexion</h2>

    <?php if(isset($error)): ?>

        <div class="alert alert-danger">
            <?= $error ?>
        </div>

    <?php endif; ?>

    <form method="POST">

        <div class="mb-3">
            <label>Email</label>

            <input type="email"
                   name="email"
                   class="form-control">
        </div>

        <div class="mb-3">
            <label>Mot de passe</label>

            <input type="password"
                   name="password"
                   class="form-control">
        </div>

        <button class="btn btn-primary w-100">
            Se connecter
        </button>
        <a href="index.php?url=auth/register">
        Créer un compte
        </a>
    </form>

</div>

</body>
</html>