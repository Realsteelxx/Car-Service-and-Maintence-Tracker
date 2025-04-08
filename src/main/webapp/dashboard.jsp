<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AutoService - Service History</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .sidebar {
            min-height: 100vh;
            background-color: #343a40;
        }
        .sidebar .nav-link {
            color: rgba(255, 255, 255, 0.8);
            padding: 0.75rem 1rem;
            border-radius: 0.25rem;
            margin-bottom: 0.25rem;
        }
        .sidebar .nav-link:hover {
            color: #fff;
            background-color: rgba(255, 255, 255, 0.1);
        }
        .sidebar .nav-link.active {
            color: #fff;
            background-color: #007bff;
        }
        .sidebar .nav-link i {
            margin-right: 0.5rem;
        }
        .stat-card {
            border-left: 4px solid #007bff;
        }
        .service-item {
            border-left: 3px solid #007bff;
            padding-left: 1rem;
            margin-bottom: 1rem;
        }
        .service-item.completed {
            border-left-color: #28a745;
        }
        .service-item.in-progress {
            border-left-color: #ffc107;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-2 sidebar p-0">
            <div class="p-3">
                <h4 class="text-white mb-4">AutoService</h4>
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <i class="fas fa-tachometer-alt"></i> Dashboard
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="customer-list.jsp">
                            <i class="fas fa-users"></i> Customers
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="vehicle_list.jsp">
                            <i class="fas fa-car"></i> Vehicles
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="#">
                            <i class="fas fa-history"></i> Service History
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <i class="fas fa-boxes"></i> Inventory
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <i class="fas fa-file-invoice-dollar"></i> Billing
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <i class="fas fa-bell"></i> Notifications
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <i class="fas fa-cog"></i> Settings
                        </a>
                    </li>
                </ul>
            </div>
        </div>

        <!-- Main Content -->
        <div class="col-md-10 p-4">
            <h2 class="mb-4">Service History</h2>

            <!-- Stats Cards -->
            <div class="row mb-4">
                <div class="col-md-3 mb-3">
                    <div class="card stat-card h-100">
                        <div class="card-body">
                            <h5 class="card-title text-muted">Active Customers</h5>
                            <p class="card-text display-6">234</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-3">
                    <div class="card stat-card h-100">
                        <div class="card-body">
                            <h5 class="card-title text-muted">Vehicles in Service</h5>
                            <p class="card-text display-6">18</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-3">
                    <div class="card stat-card h-100">
                        <div class="card-body">
                            <h5 class="card-title text-muted">Pending Services</h5>
                            <p class="card-text display-6">12</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-3">
                    <div class="card stat-card h-100">
                        <div class="card-body">
                            <h5 class="card-title text-muted">Monthly Revenue</h5>
                            <p class="card-text display-6">$45,678</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Recent Services Section -->
            <div class="card mb-4">
                <div class="card-header">
                    <h5 class="mb-0">Recent Services</h5>
                </div>
                <div class="card-body">
                    <div class="service-item in-progress">
                        <h6><strong>Toyota Camry - Oil Change</strong></h6>
                        <p class="mb-1">John Doe - <span class="badge bg-warning text-dark">In Progress</span></p>
                        <p class="text-muted">$49.99</p>
                    </div>
                    <div class="service-item completed">
                        <h6><strong>Honda Civic - Brake Service</strong></h6>
                        <p class="mb-1">Jane Smith - <span class="badge bg-success">Completed</span></p>
                        <p class="text-muted">$149.99</p>
                    </div>
                </div>
            </div>

            <!-- Upcoming Appointments Section -->
            <div class="card mb-4">
                <div class="card-header">
                    <h5 class="mb-0">Upcoming Appointments</h5>
                </div>
                <div class="card-body">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">
                            <div class="d-flex justify-content-between">
                                <div>
                                    <strong>Honda Civic - Brake Service</strong>
                                    <div class="text-muted">Tomorrow 10:00 AM</div>
                                </div>
                                <button class="btn btn-sm btn-outline-primary">View</button>
                            </div>
                        </li>
                        <li class="list-group-item">
                            <div class="d-flex justify-content-between">
                                <div>
                                    <strong>Ford F-150 - Tire Rotation</strong>
                                    <div class="text-muted">Tomorrow 2:00 PM</div>
                                </div>
                                <button class="btn btn-sm btn-outline-primary">View</button>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>