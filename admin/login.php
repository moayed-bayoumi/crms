<!DOCTYPE html>
<html lang="en">
<?php
session_start();
include('db_connect.php');
$page_title = 'login';
ob_start();
if (!isset($_SESSION['system'])) {
	$system = $conn->query("SELECT * FROM system_settings limit 1")->fetch_array();
	foreach ($system as $k => $v) {
		$_SESSION['system'][$k] = $v;
	}
}
ob_end_flush();
?>

<head>
	<title><?php echo $_SESSION['system']['name'] ?></title>
	<?php include('app/assets/header.php'); ?>
</head>


<style>
	<?php include 'app/css/login.css'; ?>
</style>


<body>
	<main>
		<div class="card">
			<h1>Login</h1>
			<form id="login-form">
				<div class="form-group">
					<label for="username">Username</label>
					<input type="text" id="username" name="username" class="form-control" required>
				</div>
				<div class="form-group">
					<label for="password">Password</label>
					<input type="password" id="password" name="password" class="form-control" required>
				</div>
				<button type="submit">Login</button>
				<div id="error-msg"></div>
			</form>
		</div>

	</main>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function() {
			$('#login-form').on('submit', function(e) {
				e.preventDefault();
				var username = $('#username').val();
				var password = $('#password').val();

				$.ajax({
					type: 'POST',
					url: 'ajax.php?action=login',
					data: {
						username: username,
						password: password
					},
					success: function(response) {
						if (response == 1) {
							window.location.href = 'index.php?page=home';
						} else {
							$('#error-msg').html('<div class="alert-danger">Invalid username or password.</div>');
						}
					}
				});
			});
		});
	</script>

</html>