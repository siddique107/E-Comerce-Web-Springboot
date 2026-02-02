<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>FreshMart | All Orders</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        :root { --primary: #28a745; }
        body { background-color: #f8f9fa; font-family: 'Poppins', sans-serif; }
        .table-container { 
            background: white; 
            padding: 30px; 
            border-radius: 20px; 
            box-shadow: 0 10px 30px rgba(0,0,0,0.05); 
            margin-top: 50px;
        }
        .product-img { width: 50px; height: 50px; border-radius: 8px; object-fit: cover; }
        .status-badge { background: #e9f7ef; color: #28a745; padding: 5px 12px; border-radius: 20px; font-size: 0.8rem; font-weight: 600; }
        .header-box { display: flex; justify-content: space-between; align-items: center; margin-bottom: 25px; }
    </style>
</head>
<body>

<div class="container-fluid px-5">
    <div class="table-container">
        <div class="header-box">
            <div>
                <h2 class="fw-bold mb-0">Customer Orders</h2>
                <p class="text-muted">Manage and track all incoming grocery orders</p>
            </div>
<a href="#" onclick="history.go(-1); return false;" class="btn btn-outline-secondary">
    Return to Previous Page
</a>            
        </div>

        <div class="table-responsive">
            <table class="table table-hover align-middle">
                <thead class="table-light">
                    <tr>
                        <th>ID</th>
                        <th>Product</th>
                        <th>Price</th>
                        <th>Qty</th>
                        <th>Customer</th>
                        <th>Phone</th>
                        <th>Address</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="order" items="${orders}">
                        <tr>
                            <td><strong>#${order.order_id}</strong></td>
                            <td>
                                <div class="d-flex align-items-center gap-3">
                                    <img src="${order.image_src}" class="product-img" alt="product">
                                    <span>${order.productName}</span>
                                </div>
                            </td>
                            <td class="fw-bold text-success">₹${order.price}</td>
                            <td>${order.quantity}</td>
                            <td>${order.customerName}</td>
                            <td>${order.phone}</td>
                            <td style="max-width: 200px;" class="text-truncate">${order.address}</td>
                            <td><span class="status-badge">Processing</span></td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty orders}">
                        <tr>
                            <td colspan="8" class="text-center py-5 text-muted">No orders found yet.</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>