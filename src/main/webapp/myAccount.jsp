<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Account</title>
<style>
    * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    
    body {
        background-image: url("images/shuttle.jpeg");
        background-position: center;
        background-size: cover;
        background-attachment: fixed;
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: flex-start;
        padding: 20px;
    }
    
    .blur-container {
        width: 90%;
        max-width: 700px;
        background-color: rgba(255, 255, 255, 0.3);
        backdrop-filter: blur(8px);
        border-radius: 12px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        margin: 20px auto;
        padding: 25px;
    }
    
    .content-container {
        width: 100%;
        margin: 0 auto;
    }
    
    h1 {
        text-align: center;
        color: #2c3e50;
        margin-bottom: 20px;
        font-size: 1.8rem;
    }
    
    .account-table {
        width: 100%;
        max-width: 500px;
        margin: 20px auto;
        border-collapse: collapse;
        background-color: rgba(255, 255, 255, 0.8);
        border-radius: 8px;
        overflow: hidden;
    }
    
    .bookings-table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px auto;
        background-color: rgba(255, 255, 255, 0.8);
        border-radius: 8px;
        overflow: hidden;
        table-layout: fixed;
    }
    
    .bookings-table th, 
    .bookings-table td {
        padding: 10px 8px;
        text-align: center;
        border-bottom: 1px solid #ddd;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        font-size: 14px;
    }
    
    .bookings-table th {
        background-color: rgba(57, 155, 15, 0.5);
        color: white;
        padding: 10px 8px;
    }
    
    th, td {
        padding: 12px 15px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }
    
    th {
        background-color: rgba(57, 155, 15, 0.5);
        color: white;
        width: 30%;
    }
    
    td {
        width: 70%;
    }
    
    tr:hover {
        background-color: rgba(242, 242, 242, 0.7);
    }
    
    .btn {
        border-radius: 5px;
        background-color: #3f8ffd;
        color: white;
        padding: 12px 25px;
        border: none;
        cursor: pointer;
        font-size: 16px;
        font-weight: 500;
        transition: all 0.3s ease;
        margin: 20px auto 0;
        display: block;
        max-width: 200px;
    }
    
    .btn:hover {
        background-color: #2c7be5;
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    }
    
    .no-bookings {
        text-align: center;
        padding: 20px;
        background-color: rgba(255, 255, 255, 0.8);
        border-radius: 8px;
        margin: 20px 0;
        max-width: 500px;
        margin-left: auto;
        margin-right: auto;
    }
    
    @media (max-width: 768px) {
        .blur-container {
            padding: 15px;
        }
        
        h1 {
            font-size: 1.5rem;
        }
        
        th, td {
            padding: 10px;
            font-size: 14px;
        }
        
        .account-table, .bookings-table {
            display: block;
            overflow-x: auto;
        }
    }
</style>
</head>
<body>
    <%@ page import="java.sql.*, java.util.*,main.java.Demo" %>
    <%
        String uname = (String) session.getAttribute("username");
        if (uname == null) {
            response.sendRedirect("main.html");
            return;
        }

        String email = "";
        String dob = "";

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Demo d1 = new Demo();
            conn = d1.returnConn();

            String query = "SELECT email, dob FROM userdetails WHERE uname = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, uname);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                email = rs.getString("email");
                dob = rs.getString("dob");
            } else {
                out.print("No user details found for username: " + uname);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
    
    <div class="blur-container">
        <div class="content-container">
            <h1>My Account</h1>
            <table class="account-table">
                <tr>
                    <th>Username</th>
                    <td><%= uname %></td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td><%= email %></td>
                </tr>
                <tr>
                    <th>Date Of Birth</th>
                    <td><%= dob %></td>
                </tr>
            </table>

            <h1>Previous Bookings</h1>
            <%
                Connection conn1 = null;
                PreparedStatement pstmt1 = null;
                ResultSet rs1 = null;
                boolean hasBookings = false;

                try {
                    Demo d1 = new Demo();
                    conn1 = d1.returnConn();

                    String q2 = "SELECT date1 AS day, play AS time, court, booking_id AS Id FROM courts WHERE username = ? ORDER BY day DESC";
                    pstmt1 = conn1.prepareStatement(q2);
                    pstmt1.setString(1, uname);
                    rs1 = pstmt1.executeQuery();

                    ResultSetMetaData rsmd = rs1.getMetaData();
                    int columnCount = rsmd.getColumnCount();
                    
                    out.print("<table class='bookings-table'>");
                    out.print("<tr>");
                    for (int i = 1; i <= columnCount; i++) {
                        out.print("<th>" + rsmd.getColumnName(i) + "</th>");
                    }
                    out.print("</tr>");

                    while (rs1.next()) {
                        hasBookings = true;
                        out.print("<tr>");
                        for (int i = 1; i <= columnCount; i++) {
                            String value = rs1.getString(i);
                            out.print("<td>" + value + "</td>");
                        }
                        out.print("</tr>");
                    }
                    
                    if (!hasBookings) {
                        out.print("<tr><td colspan='" + columnCount + "'>No bookings found</td></tr>");
                    }
                    
                    out.print("</table>");

                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (rs1 != null) rs1.close();
                        if (pstmt1 != null) pstmt1.close();
                        if (conn1 != null) conn1.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            %>
            
            <form method="post" action="booking.jsp">
                <input type="submit" value="HOME" class="btn">
            </form>
        </div>
    </div>
</body>
</html>