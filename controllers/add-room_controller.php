<?php
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $add_room = new add_room($db);
    $roomName = $_POST["roomName"];
    $creator = $_SESSION['id'];  // Assuming the creator's user ID
    $selectedUsers = $_POST["selectedUsers"];

    $result = $add_room->createRoom($roomName, $creator, $selectedUsers);
}