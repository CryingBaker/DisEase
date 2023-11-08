<%@ page import="java.util.List" %>
<jsp:include page="/getDoctor" />
<% if(session.getAttribute("name")==null) { } else { String userName=(String) session.getAttribute("name"); } %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/default1.css">
    <link rel="stylesheet" href="css/doctors.css">
    <link rel="shortcut icon" type="image/png" href="images/favicon.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
    <title>Viruses</title>
    <!-- Add custom CSS for the appointment form and button -->
    <style>
        .book-appointment-button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 20px 30px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin:10px ;
            cursor: pointer;
        }

        .appointment-form {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: white;
            padding: 20px;
            z-index: 999;
        }
        .blur-background {
            filter: blur(5px);
        }
    </style>
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
                    <li class="border1"><a href="index.jsp">Home</a></li>
                    <li class="border1"><a href="viruses.jsp">Viruses</a></li>
                    <li class="border1 selected1"><a href="doctors.jsp"><b>Doctors</b></a></li>
                </ul>
            </div>
            <div class="navsearch1">
          <input placeholder="Search for Viruses" name="dis" id="dis" onchange="updateLink()">
          <a href="/virus/getVirusinfo?diseasename=" id="link"><i class="fa-solid fa-magnifying-glass border"></i></a>
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
                                <a href='DoctorAdmin.jsp'>Admin</a>
                                <!-- Add the Admin option if the user is a doctor -->
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
        <% if (userName == null) { %>
            <p><ion-icon name="alert-circle-outline"></ion-icon>You need to login to access this page</p>
        <% } else { 
            List<String> doctorNames = (List<String>) request.getAttribute("doctorNames");
                List<String> doctorLName = (List<String>) request.getAttribute("doctorLName");
                        List<String> doctoraddress = (List<String>)
                                request.getAttribute("doctoraddress");
                                List<String> doctorphone = (List<String>)
                                        request.getAttribute("doctorphone");
                                        List<String> doctorspeciality = (List<String>)
                                                request.getAttribute("doctorspeciality");
                                                List<String> doctorid = (List<String>)
                                                        request.getAttribute("doctorid");
                                                        for (int i = 0; i < doctorNames.size(); i++) {
                                                            String doctorName=doctorNames.get(i); String
                                                            doctorLNames=doctorLName.get(i); String
                                                            doctorids=doctorid.get(i); String
                                                            doctoraddresss=doctoraddress.get(i); String
                                                            doctorphones=doctorphone.get(i); String
                                                            doctorspecialitys=doctorspeciality.get(i);%>
                                                            

                                                            <div class="doctor-box">
                                                            	<div class="doctor-photo"><img src = "images/userp.jpg" width=100 height=100></div>
                                                            	<div class="doctorinfo">
                                                                <div class="doctor-name">Dr.<%=
                                                                        doctorName %>
                                                                        <%= doctorLNames %></div>
                                                                <div class="doctor-address">
                                                                    <%= doctoraddresss %>
                                                                </div>
                                                                <div class="doctor-phone">
                                                                    <%= doctorphones %>
                                                                </div>
                                                                <div class="doctor-specialty">
                                                                    <%= doctorspecialitys %>
                                                                </div>
                                                            </div></div><%} %>
                                                            <div class="container mt-5">
															        <h2>Book an Appointment</h2>
															        <form class="mt-4" action='AppointmentSer' method='post'>
															            <div class="mb-3">
															                <label for="doctor" class="form-label">Doctor Name</label>
															                <select class="form-select" id="doctor" name="doctor" required>
															                    <% for(int i = 0; i < doctorNames.size(); i++) { 
															                        String doctorName = doctorNames.get(i);
															                        String doctorLNames = doctorLName.get(i);
															                        String doctorids=doctorid.get(i);
															                    %>
															                    <option value="<%= doctorids %>">Dr. <%= doctorName %> <%= doctorLNames %></option>
															                    <% } %>
															                </select>
															            </div>
															            <div class="mb-3">
															                <label for="date" class="form-label">Date</label>
															                <input type="date" class="form-control" id="date" name="date" required>
															            </div>
															            <div class="mb-3">
															                <label for="time" class="form-label">Time</label>
															                <select class="form-select" id="times" name="times" required>
															                	<option value='10:00:00'>10.00</option>
															                	<option value='11:00:00'>11.00</option>
															                	<option value='12:00:00'>12.00</option>
															                	<option value='13:00:00'>13.00</option>
															                	<option value='14:00:00'>14:00</option>
															                	<option value='15:00:00'>15:00</option>
															                	<option value='16:00:00'>16:00</option>
															                	<option value='17:00:00'>17:00</option>
															                	<option value='18:00:00'>18:00</option>
															                </select>
															            </div>
															            <div class="mb-3">
															                <label for="remarks" class="form-label">Remarks (optional)</label>
															                <textarea class="form-control" id="remarks" name="remarks" rows="3"></textarea>
															            </div>
															            <button type="submit" class="btn btn-primary">Submit</button>
															        </form>
															    </div>
             
            <!-- Create a div for the appointment booking form -->
            
<%} %>
            
    </main>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
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
