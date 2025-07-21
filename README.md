# 🚀 Shuttle Court Management System

Welcome to **Shuttle Maven July** – a web-based application for booking shuttle courts!  
This project demonstrates a full-stack Java web application featuring user authentication, booking management, and a stylish, responsive UI.

---

## 🌟 Features

- **User Authentication:** Sign up, log in, and manage your account securely.
- **Shuttle Court Booking:** Book available courts for specific dates and times.
- **Booking Bill:** Get a printable bill/confirmation after booking.
- **Password Recovery:** Forgot your password? Reset it securely with security questions.
- **Account Dashboard:** View and manage your profile and bookings.
- **Responsive UI:** Modern, mobile-friendly design using HTML, CSS, and JSP.

---

## 🛠️ Tech Stack

| Technology      | Purpose/Role                   |
|-----------------|-------------------------------|
| Java            | Backend core logic             |
| JSP/Servlets    | Dynamic web pages              |
| HTML/CSS        | Frontend structure & styling   |
| MySQL           | Database for users/bookings    |
| JDBC            | Java-DB connectivity           |
| Eclipse         | Development IDE                |
| XAMPP           | Local MySQL (phpMyAdmin)       |

---

## 📁 Project Structure (Partial)

```
Shuttle_maven_july/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   ├── demo.java
│   │   │   └── main/java/Demo.java
│   │   └── webapp/
│   │       ├── main.html           # Landing page
│   │       ├── signup.html         # Registration
│   │       ├── forgotpassword.html # Password reset (form)
│   │       ├── forgot.jsp          # Password reset (backend)
│   │       ├── myAccount.jsp       # User dashboard
│   │       ├── final.jsp           # Booking bill/confirmation
│   │       └── ...                 # (More JSP/HTML files)
└── .settings/
```

*(Note: This may be incomplete. [See full structure on GitHub.](https://github.com/Vamsi1807/Shuttle_maven_july))*

---

## ⚡ How to Run

1. **Clone the Repository**
   ```bash
   git clone https://github.com/Vamsi1807/Shuttle_maven_july.git
   ```

2. **Set Up Database**
   - Create a MySQL database named `shuttle`
   - Use XAMPP/phpMyAdmin for easy setup
   - Update credentials in `Demo.java`

3. **Import the Project**
   - Open in Eclipse (as a Maven or Dynamic Web Project)
   - Ensure you have a compatible JDK and server (like Apache Tomcat)

4. **Build & Deploy**
   - Build the project in Eclipse
   - Deploy to your servlet container (Tomcat)

5. **Access the App**
   - Go to `http://localhost:8080/Shuttle_maven_july/src/main/webapp/main.html` in your browser

---

> Designed and developed by [Vamsi1807](https://github.com/Vamsi1807)  
> *Modern shuttle court booking made simple!*
