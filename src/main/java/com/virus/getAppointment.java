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
import java.util.ArrayList;
import java.util.List;

/**
 * Servlet implementation class getAppointment
 */
public class getAppointment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getAppointment() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String DoctorID = (String) session.getAttribute("myID");
		Connection con = null;
		List<String> date = new ArrayList<>();
		List<String> time = new ArrayList<>();
		List<String> fn = new ArrayList<>();
		List<String> ln = new ArrayList<>();
		List<String> rem = new ArrayList<>();
		try {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/virus","virusservlet","0000");
			PreparedStatement pst = con.prepareStatement("SELECT AppointmentDate, AppointmentTime, FirstName, LastName, Remarks FROM UserAppointmentDoctor NATURAL JOIN User WHERE DoctorID=?");
			pst.setString(1, DoctorID);
			ResultSet rs = pst.executeQuery();
			int hi = 0;
			while(rs.next()) {
				hi = 1;
				date.add(rs.getString("AppointmentDate"));
				time.add(rs.getString("AppointmentTime"));
				fn.add(rs.getString("FirstName"));
				ln.add(rs.getString("LastName"));
				rem.add(rs.getString("Remarks"));
			}
			request.setAttribute("stat",hi);
			request.setAttribute("date", date);
			request.setAttribute("time", time);
			request.setAttribute("fn", fn);
			request.setAttribute("ln", ln);
			request.setAttribute("rem", rem);
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
