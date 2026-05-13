<!-- app/views/enrollments/create.php -->

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Inscription</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">

    <div class="card p-4 shadow">

        <h2 class="mb-4">Nouvelle inscription</h2>

        <form method="POST">

            <div class="mb-3">

                <label>Étudiant</label>

                <select name="student_id"
                        class="form-control">

                    <?php foreach($students as $student): ?>

                        <option value="<?= $student['id'] ?>">

                            <?= $student['firstname'] ?>
                            <?= $student['lastname'] ?>

                        </option>

                    <?php endforeach; ?>

                </select>

            </div>

            <div class="mb-3">

                <label>Cours</label>

                <select name="course_id"
                        class="form-control">

                    <?php foreach($courses as $course): ?>

                        <option value="<?= $course['id'] ?>">

                            <?= $course['title'] ?>

                        </option>

                    <?php endforeach; ?>

                </select>

            </div>

            <div class="mb-3">

                <label>Date d'inscription</label>

                <input type="date"
                       name="enrollment_date"
                       class="form-control">

            </div>

            <div class="mb-3">

                <label>Statut</label>

                <select name="status"
                        class="form-control">

                    <option>En cours</option>
                    <option>Terminé</option>

                </select>

            </div>

            <button class="btn btn-dark">
                Enregistrer
            </button>

        </form>

    </div>

</div>

</body>
</html>