<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Inscription</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body{
            background: #f4f7fb;
        }

        .register-box{
            width: 420px;
            margin: 80px auto;
            background: white;
            padding: 35px;
            border-radius: 20px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>

<div class="register-box">

    <h3 class="text-center mb-4">Créer un compte</h3>

    <!-- Message d'erreur -->
    <?php if(isset($error)): ?>
        <div class="alert alert-danger">
            <?= $error ?>
        </div>
    <?php endif; ?>

    <!-- FORMULAIRE -->
    <form method="POST">

        <div class="mb-3">
            <label>Email</label>
            <input type="email"
                   name="email"
                   class="form-control"
                   placeholder="ex: admin@email.com"
                   required>
        </div>

        <div class="mb-3">
            <label>Mot de passe</label>
            <input type="password"
                   name="password"
                   class="form-control"
                   placeholder="Mot de passe"
                   required>
        </div>

        <div class="mb-3">
            <label>Confirmer mot de passe</label>
            <input type="password"
                   name="confirm_password"
                   class="form-control"
                   placeholder="Confirmer mot de passe"
                   required>
        </div>

        <button class="btn btn-success w-100">
            S'inscrire
        </button>

    </form>

    <hr>

    <div class="text-center">
        <a href="index.php?url=auth/login">
            Déjà un compte ? Se connecter
        </a>
    </div>

</div>

</body>
</html>