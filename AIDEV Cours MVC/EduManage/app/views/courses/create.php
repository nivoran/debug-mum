<!-- app/views/courses/create.php -->

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Ajouter cours</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">

    <div class="card p-4 shadow">

        <h2 class="mb-4">Ajouter un cours</h2>

        <form method="POST">

            <div class="mb-3">

                <label>Titre</label>

                <input type="text"
                       name="title"
                       class="form-control">

            </div>

            <div class="mb-3">

                <label>Description</label>

                <textarea name="description"
                          class="form-control"></textarea>

            </div>

            <div class="row">

                <div class="col-md-6 mb-3">

                    <label>Durée</label>

                    <input type="text"
                           name="duration"
                           class="form-control">

                </div>

                <div class="col-md-6 mb-3">

                    <label>Niveau</label>

                    <select name="level"
                            class="form-control">

                        <option>Débutant</option>
                        <option>Intermédiaire</option>
                        <option>Avancé</option>

                    </select>

                </div>

            </div>

            <button class="btn btn-warning text-white">
                Ajouter
            </button>

        </form>

    </div>

</div>

</body>
</html>