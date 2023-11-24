package com.virus;

import com.virus.DatabaseConnectionUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class getDoctorInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public getDoctorInfo() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String DoctorID = (String) session.getAttribute("myID");

		try (
				Connection con = DatabaseConnectionUtil.getConnection();
				PreparedStatement pst = con.prepareStatement(
						"SELECT FirstName, LastName, Specialization, Address, Email FROM Doctor WHERE DoctorID = ?")) {

			pst.setString(1, DoctorID);
			ResultSet rs = pst.executeQuery();

			if (rs.next()) {
				request.setAttribute("DFirstName", rs.getString("FirstName"));
				request.setAttribute("DLastName", rs.getString("LastName"));
				request.setAttribute("DSpecialization", rs.getString("Specialization"));
				request.setAttribute("DAddress", rs.getString("Address"));
				request.setAttribute("DEmail", rs.getString("Email"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}