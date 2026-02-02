<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FreshMart | Login</title>
    <link rel="stylesheet" href="style.css">
    <style>
        /* Specific styles for the login layout to complement style.css */
        .login-container {
            min-height: 80vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem;
        }
        .login-card {
            background: white;
            padding: 2.5rem;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 400px;
        }
        .login-card h2 {
            margin-bottom: 1.5rem;
            color: #333;
            text-align: center;
        }
        .form-group {
            margin-bottom: 1.2rem;
        }
        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 600;
            color: #555;
        }
        .form-group input {
            width: 100%;
            padding: 0.8rem;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-family: inherit;
        }
        .form-group input:focus {
            outline: 2px solid var(--primary);
            border-color: transparent;
        }
        .login-footer {
            margin-top: 1.5rem;
            text-align: center;
            font-size: 0.9rem;
        }
        .login-footer a {
            color: var(--primary);
            text-decoration: none;
            font-weight: 600;
        }
    </style>
</head>
<body>

<header class="header">
  <nav class="navbar">
    <a href="index" class="logo">FRESHMART</a>
    <ul class="nav-links">
      <li><a href="/">Home</a></li>
      <li><a href="shop">Shop</a></li>
      <li><a href="login" style="color: var(--primary);">Login</a></li>
    </ul>
  </nav>
</header>

<main class="login-container">
    <section class="login-card reveal active">
        <h2>Customer Login</h2>
        
        <form action="/Login" method="post">
            <div class="form-group">
                <label>Username</label>
                <input type="text" name="username" placeholder="Enter your username" required>
            </div>
            
            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" placeholder="Enter your password" required>
            </div>
            
            <button type="submit" class="btn btn-primary" style="width: 100%; margin-top: 1rem; cursor: pointer;">
                Login to Account
            </button>
        </form>

        <div class="login-footer">
            <p>Don't have an account? <a href="register">Sign up here</a></p>
        </div>
    </section>
</main>

<script>
  // Consistent reveal animation from your index page
  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) entry.target.classList.add('active');
    });
  }, { threshold: 0.1 });

  document.querySelectorAll('.reveal').forEach(el => observer.observe(el));
</script>

</body>
</html>