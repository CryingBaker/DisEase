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
import java.sql.ResultSet;
import java.sql.SQLException;

public class getVirusinfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public getVirusinfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String virus = request.getParameter("diseasename");
		Connection con = null;
		try {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/virus","virusservlet","0000");
			PreparedStatement pst = con.prepareStatement("SELECT Name, Description, TransmissionMode, Image, MortalityRate, Symptoms, PreventionMeasures, Treatment FROM virus WHERE Name LIKE ?");
			pst.setString(1, "%"+virus+"%");
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
				request.setAttribute("desc", rs.getString("Description"));
				request.setAttribute("tm", rs.getString("TransmissionMode"));
				request.setAttribute("ip", rs.getString("Image"));
				request.setAttribute("mr", rs.getString("MortalityRate"));
				request.setAttribute("symp", rs.getString("Symptoms"));
				request.setAttribute("pm", rs.getString("PreventionMeasures"));
				request.setAttribute("treat", rs.getString("Treatment"));
				request.setAttribute("nam", rs.getString("Name"));
			}
			RequestDispatcher dispatcher = request.getRequestDispatcher("viruses.jsp");
			dispatcher.forward(request, response);
	            con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
		}
	}
