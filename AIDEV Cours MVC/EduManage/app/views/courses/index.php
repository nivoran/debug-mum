<!-- app/views/courses/index.php -->

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Liste des cours</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>

        body{
            background:#f4f7fb;
        }

        .card-box{
            border:none;
            border-radius:20px;
            box-shadow:0 5px 15px rgba(0,0,0,0.08);
        }

    </style>

</head>
<body>

<div class="container mt-5">

    <div class="d-flex justify-content-between align-items-center mb-4">

        <div>
            <h2>Liste des cours</h2>

            <p class="text-muted">
                Gestion des cours disponibles
            </p>
        </div>

        <div>

            <a href="index.php?url=dashboard/index"
               class="btn btn-secondary">
                Dashboard
            </a>

            <a href="index.php?url=course/create"
               class="btn btn-primary">
                Ajouter un cours
            </a>

        </div>

    </div>

    <div class="card card-box p-4">

        <table class="table table-hover align-middle">

            <thead class="table-dark">

                <tr>
                    <th>ID</th>
                    <th>Titre</th>
                    <th>Description</th>
                    <th>Durée</th>
                    <th>Niveau</th>
                    <th>Actions</th>
                </tr>

            </thead>

            <tbody>

            <?php foreach($courses as $course): ?>

                <tr>

                    <td>
                        <?= $course['id'] ?>
                    </td>

                    <td>
                        <?= $course['title'] ?>
                    </td>

                    <td>
                        <?= $course['description'] ?>
                    </td>

                    <td>
                        <?= $course['duration'] ?>
                    </td>

                    <td>

                        <?php if($course['level'] == 'Débutant'): ?>

                            <span class="badge bg-success">
                                <?= $course['level'] ?>
                            </span>

                        <?php elseif($course['level'] == 'Intermédiaire'): ?>

                            <span class="badge bg-warning text-dark">
                                <?= $course['level'] ?>
                            </span>

                        <?php else: ?>

                            <span class="badge bg-danger">
                                <?= $course['level'] ?>
                            </span>

                        <?php endif; ?>

                    </td>

                    <td>

                        <a href="index.php?url=course/edit/<?= $course['id'] ?>"
                           class="btn btn-warning btn-sm text-white">
                            Modifier
                        </a>

                        <a href="index.php?url=course/delete/<?= $course['id'] ?>"
                           class="btn btn-danger btn-sm"
                           onclick="return confirm('Supprimer ce cours ?')">
                            Supprimer
                        </a>

                    </td>

                </tr>

            <?php endforeach; ?>

            </tbody>

        </table>

    </div>

</div>

</body>
</html>