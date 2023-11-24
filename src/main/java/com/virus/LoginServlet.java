package com.virus;

import com.virus.DatabaseConnectionUtil;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        Connection con = null;
        HttpSession session = request.getSession();
        RequestDispatcher dispatcher = null;
        try {
            con = DatabaseConnectionUtil.getConnection();
            PreparedStatement pst = con.prepareStatement("SELECT FirstName,UserID FROM User WHERE Email= ? and Password= ?");
            pst.setString(1, email);
            pst.setString(2, password);
            ResultSet rs = pst.executeQuery();
            if(rs.next()) {
                session.setAttribute("name", rs.getString("FirstName"));
                String id = rs.getString("UserID");
                session.setAttribute("userid", rs.getString("UserID"));
                PreparedStatement pst1 = con.prepareStatement("SELECT UserRole FROM User WHERE Email= ? and Password= ?");
                pst1.setString(1, email);
                pst1.setString(2, password);
                ResultSet rs1 = pst1.executeQuery();
                if(rs1.next()) {
                    session.setAttribute("userrole", rs1.getString("UserRole"));
                    if ("doctor".equals(rs1.getString("UserRole"))) {
                        PreparedStatement pst3 = con.prepareStatement("SELECT DoctorID from Doctor WHERE UserID = ?");
                        pst3.setString(1,id);
                        ResultSet rs3 = pst3.executeQuery();
                        if(rs3.next()) {
                            session.setAttribute("myID", rs3.getString("DoctorID") );
                        }
                    }
                }
                dispatcher = request.getRequestDispatcher("index.jsp");
            }else {
                request.setAttribute("status", "failed");
                dispatcher = request.getRequestDispatcher("login.jsp");
            }
            dispatcher.forward(request, response);
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