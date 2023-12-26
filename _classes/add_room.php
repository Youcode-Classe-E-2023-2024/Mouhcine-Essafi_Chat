<?php
class add_room
{

    private $db;

    public function __construct($db)
    {
        $this->db = $db;
    }

    public function createRoom($roomName, $creator, $selectedUsers)
    {
        // Insert room details into the 'room' table
        $roomId = $this->insertRoom($roomName, $creator);

        // Add users to the room in the 'room_member' table if they already selected
        if ($selectedUsers) {
            $this->addUsersToInvitation($roomId, $creator, $selectedUsers);
        }

        return "Room created successfully!";
    }

    private function insertRoom($roomName, $creator)
    {
        // Insert room details into the 'room' table and return the room ID
        $sql = "INSERT INTO room (room_name, creator) VALUES ('$roomName', '$creator')";
        $this->db->query($sql);

        // Return the auto-generated room ID
        return $this->db->insert_id;
    }

    private function addUsersToInvitation($roomId, $creator, $selectedUsers)
    {
        // Add user-room relationships into the 'room_invitation' table
        foreach ($selectedUsers as $userId) {
            $sql = "INSERT INTO room_invitation (room_id, sender, receiver) VALUES ('$roomId', '$creator', '$userId')";
            $this->db->query($sql);
        }
    }

    // private function addUsersToRoom($roomId, $selectedUsers)
    // {
    //     // Add user-room relationships into the 'room_member' table
    //     foreach ($selectedUsers as $userId) {
    //         $sql = "INSERT INTO room_member (room_id, user_id) VALUES ('$roomId', '$userId')";
    //         $this->db->query($sql);
    //     }
    // }
}
