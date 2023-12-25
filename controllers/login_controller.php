<?php

if (isset($_POST['submit_l'])) {
    $userRegistration = new UserLogin($db);
    $registrationResult = $userRegistration->loginUser($_POST['log_email'], $_POST['log_password']);
    echo '<div class="alert">' . $registrationResult . '</div>';
    if ($registrationResult === true) {
        header('location: index.php?page=');
    }
    else
        header('location: index.php?page=login');
}
?>