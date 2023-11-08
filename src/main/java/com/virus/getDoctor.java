package com.virus;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class getDoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getDoctor() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the database connection
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/virus", "virusservlet", "0000");
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        // Create a statement
        Statement statement = null;
        try {
            statement = connection.createStatement();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Execute the query to select the doctor-name column from the database
        ResultSet resultSet = null;
        try {
            resultSet = statement.executeQuery("SELECT DoctorID,FirstName,LastName,Specialization,ContactNumber,Address FROM doctor");
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Create a list to store the doctor names
        List<String> doctorNames = new ArrayList<>();
        List<String> doctorLName = new ArrayList<>();
        List<String> doctorid = new ArrayList<>();
        List<String> doctoraddress = new ArrayList<>();
        List<String> doctorphone = new ArrayList<>();
        List<String> doctorspeciality = new ArrayList<>();

        // Add the doctor names to the list
        try {
			while (resultSet.next()) {
			    doctorNames.add(resultSet.getString("FirstName"));
			    doctorLName.add(resultSet.getString("LastName"));
			    doctorid.add(resultSet.getString("DoctorID"));
			    doctoraddress.add(resultSet.getString("Address"));
			    doctorphone.add(resultSet.getString("ContactNumber"));
			    doctorspeciality.add(resultSet.getString("Specialization"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        // Set the attribute in the request object
        request.setAttribute("doctorNames", doctorNames);
        request.setAttribute("doctorLName", doctorLName);
        request.setAttribute("doctorid", doctorid);
        request.setAttribute("doctoraddress", doctoraddress);
        request.setAttribute("doctorphone", doctorphone);
        request.setAttribute("doctorspeciality", doctorspeciality);

        // Close the database connection
        try {
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

}
}
