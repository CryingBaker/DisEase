package com.virus;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Servlet implementation class cancelAppointment
 */
public class cancelAppointment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cancelAppointment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		Connection con = null;
		try {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/virus","virusservlet","0000");
			PreparedStatement pst = con.prepareStatement("DELETE FROM UserAppointmentDoctor WHERE AppointmentDate = ? AND AppointmentTime = ?");
			pst.setString(1, date);
			pst.setString(2, time);
			pst.executeUpdate();
			RequestDispatcher dispatcher = request.getRequestDispatcher("DoctorAdmin.jsp");
			dispatcher.forward(request, response);
	            con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	}


}
