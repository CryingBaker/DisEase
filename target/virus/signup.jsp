<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/default.css">
        <link rel="shortcut icon" type="image/png" href="images/favicon.png">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
            integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
            crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="css/signup.css">
        <link rel="stylesheet" href="alert/dist/sweetalert.css">
        <title>Sign-Up</title>
    </head>

    <body>
        <input type="hidden" id="status" value="<%= request.getAttribute(" status") %>">
        <header>
            <div class="navbar">
                <div class="navleft">
                    <div class="navlogo border">
                        <a href="index.jsp"><img src="images/nav-logo.png" alt="Logo"></a>
                    </div>
                </div>
                <div class="navoptions">
                    <ul>
                        <li class="border"><a href="index.jsp">Home</a></li>
                        <li class="border"><a href="viruses.jsp">Viruses</a></li>
                        <li class="border"><a href="doctors.jsp">Doctors</a></li>
                    </ul>
                </div>
               	<div class="navsearch">
          <input placeholder="Search for Viruses" name="dis" id="dis" onchange="updateLink()">
          <a href="/virus/getVirusinfo?diseasename=" id="link"><i class="fa-solid fa-magnifying-glass border"></i></a>
        </div>
                <div class="navlogin">
                    <p class="border"><a href="login.jsp">Login</a></p>
                </div>
            </div>
        </header>
        <main>
            <section>
                <div class="form-box">
                    <div class="form-value">
                        <form action="register" method="post">
                            <h2>Sign Up</h2>
                            <div class="inputbox">
                                <ion-icon name="person-outline"></ion-icon>
                                <input type="text" name="firstName" id="firstName" required placeholder="First Name">
                            </div>
                            <div class="inputbox">
                                <ion-icon name="person-outline"></ion-icon>
                                <input type="text" name="lastName" id="lastName" required placeholder="Last Name">
                            </div>
                            <div class="inputbox">
                                <ion-icon name="mail-outline"></ion-icon>
                                <input type="email" name="email" id="email" required placeholder="Email">
                            </div>
                            <div class="inputbox">
                                <ion-icon name="call-outline"></ion-icon>
                                <input type="text" name="contactno" id="contactno" required placeholder="Contact No.">
                            </div>
                            <div class="inputbox">
                                <ion-icon name="home-outline"></ion-icon>
                                <input type="text" name="city" id="city" required placeholder="City">
                            </div>
                            <div class="inputbox">
                                <ion-icon name="calendar-outline"></ion-icon>
                                <input type="number" name="age" id="age" required placeholder="Age">
                            </div>
                            <div class="inputbox">
                                <select name="gender" id="gender" required>
                                    <option value="" disabled selected hidden>Select Gender</option>
                                    <option value="male">Male</option>
                                    <option value="female">Female</option>
                                    <option value="other">Other</option>
                                </select>
                            </div>
                            <div class="inputbox">
                                <ion-icon name="heart-outline"></ion-icon>
                                <input type="text" name="medicalConditions" id="medicalConditions" required
                                    placeholder="Medical Conditions">
                            </div>
                            <div class="inputbox">
                                <ion-icon name="lock-closed-outline"></ion-icon>
                                <input type="password" name="password" id="password" required placeholder="Password">
                            </div>

                            <button type="submit" name="signup" id="signup">Sign Up</button>
                            <div class="register">
                                <p id="toggleText"><a href="login.jsp" id="loginLink">Already have an account? Login</a>
                                </p>
                            </div>
                        </form>
                    </div>
                </div>
            </section>
        </main>
        <footer>
            <div class="credits">
                <p>
                    Developed by Group 16
                </p>
            </div>
        </footer>
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script type="text/javascript">
            var status = document.getElementById("status").value
            if (status == "success") {
                swal("Congratulations", "Account created successfully", "success");
            }
        </script>
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
    </body>

    </html>