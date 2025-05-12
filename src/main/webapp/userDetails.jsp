<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Details</title>
</head>
<body>
    <%@ page import="java.sql.*, java.io.*, java.util.*,main.java.Demo" %>
    <%
    String email = request.getParameter("email");
    String password = request.getParameter("pwd1");
    String conpwd = request.getParameter("pwd2");
    String username = request.getParameter("uname");
    String gender = request.getParameter("gender");
    String birthdate = request.getParameter("birthday");
    String question = request.getParameter("question");
    String answer = request.getParameter("answer");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
    	
    	
    	Demo d1 = new Demo();
		conn=d1.returnConn();
        
		
		
		
		
        // Checking if the username already exists
        String checkSql = "SELECT COUNT(*) FROM userdetails WHERE uname = ?";
        pstmt = conn.prepareStatement(checkSql);
        pstmt.setString(1, username);
        rs = pstmt.executeQuery();
        
        rs.next();
        if (rs.getInt(1) > 0) {
            // Username already exists
            out.print("<script>window.alert('Username already exists. Please choose a different username.'); window.location.href = 'signup.html';</script>");
        } else {
            // Checking if passwords match
            if(password.equals(conpwd)){
                // Preparing SQL statement
                String sql = "INSERT INTO userdetails (email, new_pwd, con_pwd, uname, gender, dob, que, ans) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                pstmt = conn.prepareStatement(sql);
                
                // Setting parameters for SQL statement
                pstmt.setString(1, email);
                pstmt.setString(2, password); // Store password (ideally hashed in real applications)
                pstmt.setString(3, conpwd);
                pstmt.setString(4, username);
                pstmt.setString(5, gender);
                pstmt.setString(6, birthdate);
                pstmt.setString(7, question);
                pstmt.setString(8, answer);
                
                out.print("hello");

                // Executing SQL statement
                int rows = pstmt.executeUpdate();
                if (rows > 0) {
                    out.println("<script>window.alert('Registration successful!!'); window.location.href = 'main.html';</script>");
                } else {
                    out.print("<script>window.alert('Error in user registration. Please try again.'); window.location.href = 'signup.html';</script>");
                }
            } else {
                out.print("<script>window.alert('Passwords mismatch. Please try again.'); window.location.href = 'signup.html';</script>");
            }
        }
    } catch (SQLException e) {
        // Handle SQL errors
        out.print("<script>window.alert('Database error: " + e + "'); window.location.href = 'signup.html';</script>");
    } catch (Exception e) {
    	out.print("hello");
        out.print("<script>window.alert('Error: " + e +" Driver not found.."+ "'); window.location.href = 'signup.html';</script>");
        out.print(e);
    } finally {
        // Closing the ResultSet
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        // Closing the PreparedStatement
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        // Closing the Connection
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    %>
</body>
</html>
