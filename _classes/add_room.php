<?php
class add_room {

    public function createRoom($roomName, $selectedUsers) {
        // Validate inputs (you may add more validation as needed)

        // Create room in the 'room' table
        $roomId = $this->insertRoom($roomName);

        // Add users to the room in the 'user_room' table
        if ($selectedUsers) {
        $this->addUsersToRoom($selectedUsers, $roomId);}

        return "Room created successfully!";
    }

    private function insertRoom($roomName) {
        // Insert room details into the 'room' table and return the room ID
        // This method should be adapted based on your database structure
        // (e.g., use prepared statements to prevent SQL injection)
        // ...

        // For the sake of the example, let's assume a successful insertion and return a dummy ID
        return 123;
    }

    private function addUsersToRoom($selectedUsers, $roomId) {
        // Add user-room relationships into the 'user_room' table
        // This method should be adapted based on your database structure
        // ...

        // For the sake of the example, let's assume a successful insertion
    }
}