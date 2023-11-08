<% if(session.getAttribute("name")==null){ }else { String userName=(String) session.getAttribute("name"); } %>
  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/default1.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

    <link rel="stylesheet" href="css/home.css">
    <link rel="shortcut icon" type="image/png" href="images/favicon.png">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
    <title>Viral Disease Knowledge Portal</title>
  </head>

  <body>
    <header>
      <div class="navbar1">
        <div class="navleft1">
          <div class="navlogo1 border1">
            <a href="index.jsp"><img src="images/nav-logo.png"></a>
          </div>
        </div>
        <div class="navoptions1">
          <ul>
            <li class="border1 selected"><a href="index.jsp"><b>Home</b></a></li>
            <li class="border1"><a href="viruses.jsp">Viruses</a></li>
            <li class="border1"><a href="doctors.jsp">Doctors</a></li>
          </ul>
        </div>
        <div class="navsearch1">
          <input placeholder="Search for Viruses" name="dis" id="dis" onchange="updateLink()">
          <a href="/virus1/getVirusinfo?diseasename=" id="link"><i class="fa-solid fa-magnifying-glass border"></i></a>
        </div>
        <!-- Modified code starts here -->
        <div class="navlogin1">
          <% String userName=(String) session.getAttribute("name"); String userRole=(String)
            session.getAttribute("userrole"); if (userName !=null) { %>
            <div class='dropdown'>
              <p class='border1'>
                <%= userName %>
              </p>
              <button class='dropbtn'></button>
              <div class='dropdown-content'>
                <% if ("doctor".equals(userRole)) { %> <!-- Check if the user is a doctor -->
                  <a href='DoctorAdmin.jsp'>Admin</a> <!-- Add the Admin option if the user is a doctor -->
                  <% } %>
                    <a href='<%= request.getContextPath() %>/logout'>Logout</a>
              </div>
            </div>
            <% } else { %>
              <p class='border1'><a href='login.jsp'>Login</a></p>
              <% } %>
        </div>
        <!-- Modified code ends here -->
      </div>
    </header>
    <main>
      <div id="carouselExampleCaptions" class="carousel slide">
        <div class="carousel-indicators">
          <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active"
            aria-current="true" aria-label="Slide 1"></button>
          <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1"
            aria-label="Slide 2"></button>
          <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2"
            aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <a href="/virus1/getVirusinfo?diseasename=Covid-19"><img src="images/covid19.jpg"
                class="d-block w-100 resize1" alt="..."></a>
            <div class="carousel-caption d-none d-md-block">
              <h5>Covid-19</h5>
              <p>COVID-19 is a serious respiratory illness that can affect anyone. It is caused by a virus called
                SARS-CoV-2 that spreads through respiratory droplets produced when an infected person coughs, sneezes,
                or talks. COVID-19 can cause a range of symptoms, including fever, cough, shortness of breath, fatigue,
                muscle aches, headache, loss of taste or smell, sore throat, congestion or runny nose, nausea, vomiting,
                and diarrhea.</p>
            </div>
          </div>
          <div class="carousel-item">
            <a href="/virus1/getVirusinfo?diseasename=Dengue"><img src="images/hero.png" class="d-block w-100 resize1"
                alt="..."></a>
            <div class="carousel-caption d-none d-md-block">
              <h5>Dengue</h5>
              <p>Dengue fever is a serious disease that can affect anyone who travels to tropical or subtropical regions
                of the world. It is caused by a virus that is spread by mosquitoes, and it can cause high fever, severe
                headaches,muscle, and joint pain, rash and bleeding. In some cases, it can lead to shock, organ failure
                and death. There is no specific treatment or vaccine for dengue fever, so the best way to avoid mosquito
                bites and reduce the mosquito population.</p>
            </div>
          </div>
          <div class="carousel-item">
            <a href="/virus1/getVirusinfo?diseasename=Hepatitis%20B"><img src="images/hepatitisb.jpg"
                class="d-block w-100 resize1" alt="..."></a>
            <div class="carousel-caption d-none d-md-block">
              <h5>Hepatitis B</h5>
              <p>Hepatitis B is a serious liver infection that can affect anyone. It is caused by a virus that is spread
                through contact with infected blood or body fluids, such as semen and vaginal fluids. Hepatitis B can
                cause a range of symptoms, including fever, fatigue, nausea, vomiting, jaundice (yellowing of the skin
                and eyes), and abdominal pain. In some cases, hepatitis B can lead to chronic liver disease, liver
                cancer, and death.</p>
            </div>
          </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions"
          data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions"
          data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>
      <div class="about1">
        <h2><b>About DisEase:</b></h2>
        <br>
        <p>DisEase is a portal that displays information about various viral diseases, their symptoms, and preventative
          measures to take to avoid them</p>
      </div>
    </main>
    <footer>
      <div class="credits1">
        <p>
          Developed by Group 16
        </p>
      </div>
    </footer>
    <script>
      function updateLink() {
        // Get the input element by its id
        var input = document.getElementById("dis");
        // Get the input value
        var value = input.value;
        // Get the anchor element by its id
        var link = document.getElementById("link");
        // Get the base URL of the anchor element
        var baseURL = link.href;
        // Update the href attribute with the input value
        link.href = baseURL + value;
      }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
      crossorigin="anonymous"></script>
  </body>

  </html>