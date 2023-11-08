<%@ page import="java.util.List" %>
    <jsp:include page="/getVirusList" />
    <% if(session.getAttribute("name")==null){ }else { String userName=(String) session.getAttribute("name"); } %>

        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <link rel="stylesheet" href="css/default.css">
                <link rel="stylesheet" href="css/viruses.css">
                <link rel="shortcut icon" type="image/png" href="images/favicon.png">
                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
                <title>Viruses</title>
            </head>

            <body>
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
                                <li class="border selected"><a href="viruses.jsp"><b>Viruses</b></a></li>
                                <li class="border"><a href="doctors.jsp">Doctors</a></li>
                            </ul>
                        </div>
                        <div class="navsearch">
          <input placeholder="Search for Viruses" name="dis" id="dis" onchange="updateLink()">
          <a href="/virus/getVirusinfo?diseasename=" id="link"><i class="fa-solid fa-magnifying-glass border"></i></a>
        </div>
                        <!-- Modified code starts here -->
                        <div class="navlogin">
                            <% String userName=(String) session.getAttribute("name"); String userRole=(String)
                                session.getAttribute("userrole"); if (userName !=null) { %>
                                <div class='dropdown'>
                                    <p class='border'>
                                        <%= userName %>
                                    </p>
                                    <button class='dropbtn'></button>
                                    <div class='dropdown-content'>
                                        <% if ("doctor".equals(userRole)) { %> <!-- Check if the user is a doctor -->
                                            <a href='DoctorAdmin.jsp'>Admin</a>
                                            <!-- Add the Admin option if the user is a doctor -->
                                            <% } %>
                                                <a href='<%= request.getContextPath() %>/logout'>Logout</a>
                                    </div>
                                </div>
                                <% } else { %>
                                    <p class='border'><a href='login.jsp'>Login</a></p>
                                    <% } %>
                        </div>
                        <!-- Modified code ends here -->
                    </div>
                    <!-- Modified code ends here -->
                </header>
                <div class="container">
                    <div class="navbar1">
                        <ul id="disease-list">
                            <% // Assuming you have retrieved the virus names as a List<String>
                                List<String> virusList = (List<String>) request.getAttribute("virusname");

                                        for (String virus : virusList) {
                                        %>
                                        <li><a href="/virus/getVirusinfo?diseasename=<%=virus%>">
                                                <%= virus %>
                                            </a></li>
                                        <% } %>
                        </ul>
                    </div>
                    <div class="disease-info">
                        <% String desc=(String) request.getAttribute("desc"); String tm=(String)
                            request.getAttribute("tm"); String ip=(String) request.getAttribute("ip"); String
                            mr=(String) request.getAttribute("mr"); String symp=(String) request.getAttribute("symp");
                            String pm=(String) request.getAttribute("pm"); String treat=(String)
                            request.getAttribute("treat"); String nam=(String) request.getAttribute("nam"); if (desc
                            !=null) { %>
                            <h1><b>
                                    <%= nam %>:
                                </b></h1>
                            <br>
                            <%= desc %><br><b>Symptoms: </b>
                                <%= symp %><br><b>Mortality Rate: </b><%= mr %><br><b>Transmission Mode: </b><%= tm %><br><b>Image:</b><%= ip %><br><b>Prevention Measures: </b><%= pm %><br><b>Treatment: </b><%= treat %><br>
                                    <% } %>
                    </div>
                </div>
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