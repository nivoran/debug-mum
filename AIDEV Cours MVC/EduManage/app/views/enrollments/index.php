<!-- app/views/enrollments/index.php -->

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Liste des inscriptions</title>

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

            <h2>Liste des inscriptions</h2>

            <p class="text-muted">
                Gestion des inscriptions des étudiants
            </p>

        </div>

        <div>

            <a href="index.php?url=dashboard/index"
               class="btn btn-secondary">
                Dashboard
            </a>

            <a href="index.php?url=enrollment/create"
               class="btn btn-primary">
                Nouvelle inscription
            </a>

        </div>

    </div>

    <div class="card card-box p-4">

        <table class="table table-hover align-middle">

            <thead class="table-dark">

                <tr>
                    <th>ID</th>
                    <th>Étudiant</th>
                    <th>Cours</th>
                    <th>Date inscription</th>
                    <th>Statut</th>
                    <th>Actions</th>
                </tr>

            </thead>

            <tbody>

            <?php foreach($enrollments as $enrollment): ?>

                <tr>

                    <td>
                        <?= $enrollment['id'] ?>
                    </td>

                    <td>
                        <?= $enrollment['firstname'] ?>
                        <?= $enrollment['lastname'] ?>
                    </td>

                    <td>
                        <?= $enrollment['title'] ?>
                    </td>

                    <td>
                        <?= $enrollment['enrollment_date'] ?>
                    </td>

                    <td>

                        <?php if($enrollment['status'] == 'En cours'): ?>

                            <span class="badge bg-warning text-dark">
                                <?= $enrollment['status'] ?>
                            </span>

                        <?php else: ?>

                            <span class="badge bg-success">
                                <?= $enrollment['status'] ?>
                            </span>

                        <?php endif; ?>

                    </td>

                    <td>

                        <a href="index.php?url=enrollment/delete/<?= $enrollment['id'] ?>"
                           class="btn btn-danger btn-sm"
                           onclick="return confirm('Supprimer cette inscription ?')">
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