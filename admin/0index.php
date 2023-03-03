<!DOCTYPE html>
<html lang="en">
<?php
// Start session
session_start();

// Check if user is logged in
if (!isset($_SESSION['login_id'])) {
    header('location: login.php');
    exit;
}

// Include header and navbar
include('./header.php');
include('topbar.php');
include('navbar.php');
?>

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title><?= isset($_SESSION['system']['name']) ? $_SESSION['system']['name'] : '' ?></title>
    <style>
        body {
            background: #80808045;
        }

        /* Add other styles here */
    </style>
</head>

<body>
    <div class="toast" id="alert_toast" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="toast-body text-white">
        </div>
    </div>

    <main id="view-panel">
        <?php
        // Load page
        $page = isset($_GET['page']) ? $_GET['page'] : 'home';
        include $page . '.php';
        ?>
    </main>

    <!-- Add modals here -->

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.1.0-beta.1/js/select2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script>
        $(document).ready(function () {
            // Initialize select2 plugin
            $('.select2').select2({
                placeholder: "Please select here",
                width: "100%"
            });

            // Initialize flatpickr plugin
            $('.datetimepicker').flatpickr({
                enableTime: true,
                dateFormat: 'Y/m/d H:i',
                defaultDate: '+3d'
            });
        });

        // Add other scripts here
    </script>
</body>

</html>
