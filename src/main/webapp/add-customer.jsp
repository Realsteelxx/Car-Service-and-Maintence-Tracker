<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add New Car</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .card {
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .btn-primary {
            background-color: #007bff;
            border: none;
            transition: 0.3s;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="container d-flex justify-content-center align-items-center vh-100">
    <div class="card p-4" style="max-width: 500px; width: 100%;">
        <h3 class="text-center mb-4">Add New Customer</h3>
        <form action="customersServlet" method="post">
            <input type="hidden" name ="action" value = "addCustomer" />
            <div class="mb-3">
                <label for="name" class="form-label">Name</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email" required>

                <div class="mb-3">
                    <label for="number" class="form-label">Contact Number</label>
                    <input type="text" class="form-control" id="number" name="number" required>
                </div>

                <button type="submit" class="btn btn-primary w-100">Add Car</button>
            </div>

        </form>
    </div>
</div>
</body>
</html>
