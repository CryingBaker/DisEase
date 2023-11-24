package com.virus;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class cancelAppointment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public cancelAppointment() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		Connection con = null;
		try {
			con = DatabaseConnectionUtil.getConnection();
			PreparedStatement pst = con.prepareStatement(
					"DELETE FROM UserAppointmentDoctor WHERE AppointmentDate = ? AND AppointmentTime = ?");
			pst.setString(1, date);
			pst.setString(2, time);
			pst.executeUpdate();
			response.sendRedirect("DoctorAdmin.jsp");
		} catch (ClassNotFoundException | SQLException e) {
			// handle exception
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}
}
