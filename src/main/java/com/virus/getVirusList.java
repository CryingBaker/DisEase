package com.virus;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class getVirusList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public getVirusList() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
            resultSet = statement.executeQuery("SELECT Name FROM virus ORDER BY Name");
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Create a list to store the doctor names
        List<String> virusname = new ArrayList<>();

        // Add the doctor names to the list
        try {
			while (resultSet.next()) {
			    virusname.add(resultSet.getString("Name"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        // Set the attribute in the request object
        request.setAttribute("virusname", virusname);

        // Close the database connection
        try {
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
	}
}
