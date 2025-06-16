package main.java;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Demo {
    public Connection returnConn() throws Exception {
        String dbName = "shuttle"; // Your phpMyAdmin DB name
        String userName = "shuttleWebApp";  // Default XAMPP username
        String password = "Shuttle@123";      // Default password is blank in XAMPP

        // JDBC URL for localhost (XAMPP)
        String jdbcUrl = "jdbc:mysql://localhost:3306/" + dbName;

        // Register driver (optional for newer JDBC versions)
        Class.forName("com.mysql.cj.jdbc.Driver");

        return DriverManager.getConnection(jdbcUrl, userName, password);
    }
}
