<!DOCTYPE html>
<html>

<head>
  <title>Flutter Communication Demo - Web</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/flutter_web/2.0.3/flutter_web.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flutter_web/2.0.3/flutter_web.css">
</head>

<body>
  <script>
    const webLabelElement = document.getElementById('web-label');

    function updateWebLabel() {
      // Ganti URL dengan URL yang sesuai
      fetch('http://localhost:3000/web/index.php')
        .then(response => response.json())
        .then(data => {
          webLabelElement.textContent = data;
        })
        .catch(error => {
          console.error('Error fetching web label:', error);
        });
    }
  </script>

  <h1 id="web-label">nice to meet you</h1>
 
</body>

</html>
