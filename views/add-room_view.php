<div class="container mx-auto my-8 p-8 bg-white rounded-lg shadow-md">
    <h1 class="text-2xl font-bold mb-4">Create a Room</h1>

    <form action="/process_form" method="post">
      <!-- Room Name -->
      <div class="mb-4">
        <label for="roomName" class="block text-sm font-medium text-gray-600">Room Name:</label>
        <input type="text" id="roomName" name="roomName" class="mt-1 p-2 w-full border rounded-md">
      </div>

      <!-- Select Users -->
      <div class="mb-4">
        <label for="selectedUsers" class="block text-sm font-medium text-gray-600">Select Users:</label>
        <select id="selectedUsers" name="selectedUsers[]" multiple class="mt-1 p-2 w-full border rounded-md">
          <option value="user1">User 1</option>
          <option value="user2">User 2</option>
          <option value="user3">User 3</option>
          <!-- Add more users as needed -->
        </select>
      </div>

      <!-- Submit Button -->
      <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded-md">Create Room</button>
    </form>

  </div>