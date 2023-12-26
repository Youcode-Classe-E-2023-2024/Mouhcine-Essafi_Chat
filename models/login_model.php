<!-- <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form id="form">
        <label >Enter your username:</label><br>
        <input type="text" name="username">
        <button type="submit">submit</button>
    </form>

    <script>
        const body = document.querySelector('body'); 
        console.log(body);
        const form = document.getElementById('form'); 
        form.addEventListener('submit', function(event) {
            event.preventDefault();
            const formData = new FormData(form);
            
            fetch('file.php', {
                method: 'POST',
                body: formData
            })
            .then(response => response.text())
            .then(data => {
                console.log(data);
                body.innerHTML = data;
            })
            .catch(error => {
                console.error('Error:', error);
            });
        })
    </script>
</body>
</html> -->