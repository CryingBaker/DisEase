package com.virus;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.*;

@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String firstname = request.getParameter("firstName");
		String lastname = request.getParameter("lastName");
		String email = request.getParameter("email");
		String contactno = request.getParameter("contactno");
		String city = request.getParameter("city");
		String age = request.getParameter("age");
		String gender = request.getParameter("gender");
		String medical = request.getParameter("medicalConditions");
		String password = request.getParameter("password");
		int Age = Integer.parseInt(age);
		long Contact = Long.parseLong(contactno);
		Connection con = null;
		RequestDispatcher dispatcher = null;
		PrintWriter out = response.getWriter();
		if(Contact>9999999999l) {
			out.print("Invalid Contact Number");
		}
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/virus","virusservlet","0000");
			PreparedStatement pst = con.prepareStatement("INSERT INTO User(FirstName,LastName,Email,ContactNumber,City,Age,Gender,PastMedicalConditions,Password,UserRole) VALUES (?,?,?,?,?,?,?,?,?,?)");
			pst.setString(1, firstname);
			pst.setString(2, lastname);
			pst.setString(3, email);
			pst.setString(4, contactno);
			pst.setString(5, city);
			pst.setInt(6, Age);
			pst.setString(7, gender);
			pst.setString(8, medical);
			pst.setString(9, password);
			pst.setString(10, "User");
			
			int rowCount = pst.executeUpdate();
			dispatcher = request.getRequestDispatcher("signup.jsp");
			if(rowCount>0) {
				request.setAttribute("status","success");
			}else {
				request.setAttribute("status", "failed");
			}
			dispatcher.forward(request, response);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
