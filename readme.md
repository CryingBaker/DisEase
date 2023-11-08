<!DOCTYPE html>
<html>
<head>
  <style>
    body {
      font-family: Arial, sans-serif;
      max-width: 800px;
      margin: 0 auto;
      padding: 20px;
      background-color: #f7f7f7;
    }
    h1 {
      color: #333;
    }
    h2 {
      color: #333;
    }
    p {
      color: #666;
      line-height: 1.6;
    }
    code {
      background-color: #f0f0f0;
      padding: 2px 4px;
      border: 1px solid #ddd;
      font-size: 90%;
    }
    ul {
      list-style-type: disc;
      padding-left: 20px;
    }
    li {
      margin-bottom: 8px;
    }
  </style>
</head>
<body>
  <h1>DisEase - Viral Disease Knowledge Portal and Appointment System</h1>

  <p>DisEase is a web-based platform designed to provide information and assistance for viral diseases, along with an appointment scheduling system. The system is built using HTML, CSS, JavaScript, and Java with MySQL as the database.</p>

  <h2>Features</h2>
  <ul>
    <li><strong>Viral Disease Information:</strong> Provides comprehensive information about various viral diseases, including symptoms, prevention, and treatment.</li>
    <li><strong>Appointment System:</strong> Allows users to schedule appointments with healthcare professionals for disease consultations.</li>
    <li><strong>Database Backend:</strong> Utilizes MySQL as the database to store user data and disease information.</li>
    <li><strong>Responsive Design:</strong> Ensures a user-friendly experience on both desktop and mobile devices.</li>
  </ul>

  <h2>Prerequisites</h2>
  <p>Before getting started, make sure you have the following installed on your system:</p>
  <ul>
    <li>Java Development Kit (JDK)</li>
    <li>Apache Tomcat 10</li>
    <li>MySQL Server</li>
    <li>Web browser</li>
  </ul>

  <h2>Getting Started</h2>

  <h3>Database Setup</h3>
  <ol>
    <li>Create a MySQL database and import the schema using the provided <code>database.sql</code> file. You can use the following command to import the database schema:</li>
  </ol>
  <pre><code>mysql -u your_username -p your_database_name &lt; database.sql</code></pre>

  <h3>Deploying on Apache Tomcat</h3>
  <ol>
    <li>Build the project or package it into a WAR (Web Application Archive) file.</li>
    <li>Deploy the WAR file to Apache Tomcat 10.</li>
  </ol>

  <h2>Usage</h2>
  <ol>
    <li>Open your web browser.</li>
    <li>Access the DisEase portal by entering the following URL: <code>http://localhost:8080/virus</code> (replace <code>8080</code> with the actual port if you've configured Tomcat differently).</li>
    <li>Explore the viral disease knowledge portal, read about diseases, and access appointment scheduling functionality.</li>
  </ol>

</body>
</html>
