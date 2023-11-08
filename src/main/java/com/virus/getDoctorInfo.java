package com.virus;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class getDoctorInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public getDoctorInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String DoctorID = (String) session.getAttribute("myID");
		Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/virus", "virusservlet", "0000");
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        PreparedStatement pst;
		try {
			pst = con.prepareStatement("SELECT FirstName, LastName, Specialization, Address, Email FROM Doctor WHERE DoctorID = ?");
			pst.setString(1, DoctorID);
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
				request.setAttribute("DFirstName",rs.getString("FirstName"));
				request.setAttribute("DLastName",rs.getString("LastName"));
				request.setAttribute("DSpecialization",rs.getString("Specialization"));
				request.setAttribute("DAddress",rs.getString("Address"));
				request.setAttribute("DEmail",rs.getString("Email"));
			}
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
