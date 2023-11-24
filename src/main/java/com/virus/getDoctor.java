package com.virus;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class getDoctor extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public getDoctor() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (Connection connection = DatabaseConnectionUtil.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery("SELECT DoctorID,FirstName,LastName,Specialization,ContactNumber,Address FROM doctor")) {

            List<String> doctorNames = new ArrayList<>();
            List<String> doctorLName = new ArrayList<>();
            List<String> doctorid = new ArrayList<>();
            List<String> doctoraddress = new ArrayList<>();
            List<String> doctorphone = new ArrayList<>();
            List<String> doctorspeciality = new ArrayList<>();

            while (resultSet.next()) {
                doctorNames.add(resultSet.getString("FirstName"));
                doctorLName.add(resultSet.getString("LastName"));
                doctorid.add(resultSet.getString("DoctorID"));
                doctoraddress.add(resultSet.getString("Address"));
                doctorphone.add(resultSet.getString("ContactNumber"));
                doctorspeciality.add(resultSet.getString("Specialization"));
            }

            request.setAttribute("doctorNames", doctorNames);
            request.setAttribute("doctorLName", doctorLName);
            request.setAttribute("doctorid", doctorid);
            request.setAttribute("doctoraddress", doctoraddress);
            request.setAttribute("doctorphone", doctorphone);
            request.setAttribute("doctorspeciality", doctorspeciality);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}