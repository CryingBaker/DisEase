package com.virus;

import com.virus.DatabaseConnectionUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class getVirusinfo extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public getVirusinfo() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String diseasename = request.getParameter("diseasename");
        Connection con = null;
        try {
            con = DatabaseConnectionUtil.getConnection();
            PreparedStatement pst = con.prepareStatement("SELECT Name, Description, TransmissionMode, Image, MortalityRate, Symptoms, PreventionMeasures, Treatment FROM virus WHERE Name LIKE ?");
            pst.setString(1, "%"+diseasename+"%");
            ResultSet rs = pst.executeQuery();
            if(rs.next()) {
                request.setAttribute("nam", rs.getString("Name"));
                request.setAttribute("desc", rs.getString("Description"));
                request.setAttribute("tm", rs.getString("TransmissionMode"));
                request.setAttribute("ip", rs.getString("Image"));
                request.setAttribute("mr", rs.getString("MortalityRate"));
                request.setAttribute("symp", rs.getString("Symptoms"));
                request.setAttribute("pm", rs.getString("PreventionMeasures"));
                request.setAttribute("treat", rs.getString("Treatment"));
            }
            request.getRequestDispatcher("viruses.jsp").forward(request, response);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
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