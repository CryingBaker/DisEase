package com.virus;

import com.virus.DatabaseConnectionUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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
        try {
            con = DatabaseConnectionUtil.getConnection();
            PreparedStatement pst = con.prepareStatement("INSERT INTO User(FirstName,LastName,Email,ContactNumber,City,Age,Gender,PastMedicalConditions,Password,UserRole) VALUES (?,?,?,?,?,?,?,?,?,?)");
            pst.setString(1, firstname);
            pst.setString(2, lastname);
            pst.setString(3, email);
            pst.setLong(4, Contact);
            pst.setString(5, city);
            pst.setInt(6, Age);
            pst.setString(7, gender);
            pst.setString(8, medical);
            pst.setString(9, password);
            pst.setString(10, "user");
            int i = pst.executeUpdate();
            if(i!=0){
                response.sendRedirect("login.jsp");
            }
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