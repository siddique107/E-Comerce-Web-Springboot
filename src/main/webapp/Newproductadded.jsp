<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Product Added Successfully</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(135deg, #0d6efd, #20c997);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .success-card {
            border-radius: 22px;
            box-shadow: 0 10px 35px rgba(0,0,0,0.35);
            animation: fadeIn 0.8s ease-in-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .icon-success {
            font-size: 4rem;
            color: #198754;
        }
        .btn-custom {
            background: linear-gradient(135deg, #0d6efd, #20c997);
            border: none;
            font-weight: 600;
        }
        .btn-custom:hover {
            background: linear-gradient(135deg, #0b5ed7, #17a589);
        }
    </style>
</head>

<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-7">
            <div class="card success-card p-5 text-center">

                <div class="mb-4">
                    <i class="bi bi-check-circle-fill icon-success"></i>
                </div>

                <h2 class="text-success fw-bold">Product Added Successfully!</h2>
                <p class="lead mt-3">
                    The new product details have been saved successfully.
                </p>

                <hr class="my-4">

                <!-- Dynamic values from Controller -->
                <p class="mb-1">
                    <strong>Product Name:</strong> ${product.name}
                </p>
                <p class="mb-1">
                    <strong>Quantity:</strong> ${product.quantity}
                </p>
                <p class="mb-3">
                    <strong>Price:</strong> ₹ ${product.price}
                </p>

                <div class="d-flex justify-content-center gap-3 mt-4">
                    <a href="Newproduct" class="btn btn-custom text-white px-4">
                        <i class="bi bi-plus-circle"></i> Add Another Product
                    </a>

                    <a href="products" class="btn btn-outline-success px-4">
                        <i class="bi bi-list-ul"></i> View Products
                    </a>
                </div>

            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
