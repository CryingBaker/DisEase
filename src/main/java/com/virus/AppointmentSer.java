package com.virus;

import com.virus.DatabaseConnectionUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class AppointmentSer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AppointmentSer() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String UserID = (String) session.getAttribute("userid");
		String DoctorID = request.getParameter("doctor");
		String date = request.getParameter("date");
		String time = request.getParameter("times");
		String remark = request.getParameter("remarks");
		Connection con = null;
		RequestDispatcher dispatcher = null;
		try {
			con = DatabaseConnectionUtil.getConnection();
			PreparedStatement pst1 = con.prepareStatement(
					"SELECT * FROM UserAppointmentDoctor WHERE AppointmentDate= ? and AppointmentTime= ? and DoctorID = ? ");
			pst1.setString(1, date);
			pst1.setString(2, time);
			pst1.setString(3, DoctorID);
			ResultSet rs1 = pst1.executeQuery();
			if (rs1.next()) {
				request.setAttribute("status3", "failed");
				PrintWriter out = response.getWriter();
				out.println("Time not available");
				dispatcher = request.getRequestDispatcher("doctors.jsp");
				dispatcher.forward(request, response);
			} else {
				PreparedStatement pst2 = con.prepareStatement(
						"INSERT INTO UserAppointmentDoctor(UserID,DoctorID,AppointmentDate,AppointmentTime,Remarks) VALUES (?,?,?,?,?)");
				pst2.setString(1, UserID);
				pst2.setString(2, DoctorID);
				pst2.setString(3, date);
				pst2.setString(4, time);
				pst2.setString(5, remark);
				pst2.executeUpdate();
				request.setAttribute("status3", "success");
				dispatcher = request.getRequestDispatcher("doctors.jsp");
				response.sendRedirect("doctors.jsp");
				dispatcher.forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}