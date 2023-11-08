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
        <link rel="stylesheet" href="css/login.css">
        <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.8.0/dist/sweetalert2.min.css" rel="stylesheet">
        <title>Login</title>
    </head>

    <body>
        <input type="hidden" id="status" value="<%= request.getAttribute(" status") %>">
        <header>
            <div class="navbar">
                <div class="navleft">
                    <div class="navlogo border">
                        <a href="index.jsp"><img src="images/nav-logo.png"></a>
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
                    <a href="/virus1/getVirusinfo?diseasename=" id="link"><i
                            class="fa-solid fa-magnifying-glass border"></i></a>
                </div>
                <div class="navlogin">
                    <p class="border selected"><a href="login.jsp"><b>Login</b></a></p>
                </div>
            </div>
        </header>
        <main>
            <section>
                <div class="form-box">
                    <div class="form-value">
                        <form action="login" method="post">
                            <h2>Login</h2>
                            <div class="inputbox">
                                <ion-icon name="mail-outline"></ion-icon>
                                <input type="email" name="email" required>
                                <label>Email</label>
                            </div>
                            <div class="inputbox">
                                <ion-icon name="lock-closed-outline"></ion-icon>
                                <input type="password" name="password" required>
                                <label>Password</label>
                            </div>
                            <div class="forget">
                                <label><input type="checkbox">Remember Me! &nbsp; </label>
                                <a href="#" style="color: #fff;"> Forgot Password </a>
                            </div>
                            <button type="submit">Log in</button>
                            <div class="register">
                                <p id="toggleText"><a href="signup.jsp" id="signupLink">Don't have an account?
                                        Register</a></p>
                                <button id="loginButton" style="display: none;">Login</button>
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
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.8.0/dist/sweetalert2.all.min.js"></script>
        <script type="text/javascript">
            var status = document.getElementById("status").value
            if (status == "failed") {
            	Swal.fire(
            			  'Account not Found',
            			  'error'
            			)
            }
        </script>
    </body>

    </html>