<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<jsp:include page="/getDoctorInfo" />
<jsp:include page="/getAppointment" />
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Doctor Admin Page</title>
        <link rel="stylesheet" href="css/default.css">
        <link rel="stylesheet" href="css/doctoradmin.css">
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
                        <li class="border selected"><a href="index.jsp">Home</a></li>
                        <li class="border"><a href="viruses.jsp">Viruses</a></li>
                        <li class="border"><a href="doctors.jsp">Doctors</a></li>
                    </ul>
                </div>
                <div class="navsearch">
                    <input placeholder="Search for Viruses or Symptoms">
                    <i class="fa-solid fa-magnifying-glass border"></i>
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
        </header>
        <main>
        <%	String FName = (String) request.getAttribute("DFirstName");
        	String LName = (String) request.getAttribute("DLastName");
        	String Spec = (String) request.getAttribute("DSpecialization");
        	String Address = (String) request.getAttribute("DAddress");
        	String Email = (String) request.getAttribute("DEmail");%>
            <div class="doctor-profile">
                <h1>Doctor Profile</h1>
                <div class="doctor-info">
                    <p><strong>Name:</strong> Dr.<%= FName %> <%= LName %> </p>
                    <p><strong>Specialty:</strong> <%= Spec %></p>
                    <p><strong>Location:</strong> <%= Address %></p>
                    <p><strong>Contact:</strong> <%= Email %></p>
                </div>
            </div>
            <div class="doctor-appointments">
                <h2>Appointments</h2>
                <table>
                    
                    <%	int stat = (Integer) request.getAttribute("stat");
                    	if(stat == 1){
                    	List<String> date = (List<String>) request.getAttribute("date");
                    	List<String> time = (List<String>) request.getAttribute("time");
                    	List<String> fn = (List<String>) request.getAttribute("fn");
                    	List<String> ln = (List<String>) request.getAttribute("ln");
                    	List<String> rem = (List<String>) request.getAttribute("rem");%>
                    	<tr>
                        <th>Date</th>
                        <th>Time</th>
                        <th>Patient</th>
                        <th>Remarks</th>
                        <th></th>
                    	</tr>
                    <%
                    	for (int i = 0; i < date.size(); i++) {
                    		String dat = date.get(i);
                    		String tim = time.get(i);
                    		String f = fn.get(i);
                    		String l = ln.get(i);
                    		String re = rem.get(i);
                    	%>
                    	
                    <tr>
                        <td><%= dat %></td>
                        <td><%= tim %></td>
                        <td><%= f %> <%= l %></td>
                        <td><%= re %></td>
                        <td><a href="/virus1/cancelAppointment?time=<%= tim %>&date=<%=dat%>">Cancel</a></td>
                    </tr>
                    <%}} else{ %>
                    No Appointments
                    <%} %>
                    
                </table>
            </div>
        </main>
        <footer>
            <!-- Your footer content can go here -->
        </footer>
    </body>

    </html>