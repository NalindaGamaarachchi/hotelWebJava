/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DatabaseConnection;

/**
 *
 * @author nalindagamaarachchi
 */
public class MakeReservation extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet MakeReservation</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MakeReservation at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession hs=request.getSession();
		int guest_id = 0;
		int travel_id = 0;
		int room_id=(int)hs.getAttribute("room_id");
		String Status = "Pending";
		String firstname = request.getParameter("firstname");
		String middlename = request.getParameter("middlename");
		String lastname = request.getParameter("lastname");
		String address = request.getParameter("address");
		String contactno = request.getParameter("contactno");
		String oldDate = request.getParameter("date");
		int day = Integer.parseInt(request.getParameter("day"));
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar c = Calendar.getInstance();
		try {
			c.setTime(sdf.parse(oldDate));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		c.add(Calendar.DAY_OF_MONTH, day);
		String newDate = sdf.format(c.getTime());
		System.out.println("Date after Addition: " + newDate);
		try {
			Connection con = DatabaseConnection.getConnection();
			Statement st = con.createStatement();
			Statement statement = con.createStatement();
			int makeReservation = st.executeUpdate("insert into guest values('" + guest_id + "','" + firstname + "','"+ middlename + "','" + lastname + "','" + address + "','" + contactno + "')");
			ResultSet rs = st.executeQuery("select guest_id from guest where firstname='" + firstname + "'");
			if (rs.next()) {
				int guestId = rs.getInt(1);
				int loadReservationDate = statement.executeUpdate("insert into travel values('" + travel_id + "','"+ oldDate + "','" + day + "','" + newDate + "','" + Status + "','" + guestId + "','"+room_id+"',0,0,0)");
				response.sendRedirect("reservation.jsp");
			}else{
				response.sendRedirect("reservation.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
