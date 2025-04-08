<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <title>Vehicle Management System</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<h2> Vehicle Management System</h2>

<!-- Add Vehicle Form -->
<form action="VehicleServlet" method="post">
    <h3>Add Vehicle</h3>
    <input type="hidden" name="action" value="addVehicle">
    <label>Reg. Number:</label>
    <input type="text" name="id" required><br>

    <label>Owner Name:</label>
    <input type="text" name="owner" required><br>

    <label>Vehicle Model:</label>
    <input type="text" name="model" required><br>

    <label>Type:</label>
    <select name="type">
        <option value="Car">Car</option>
        <option value="Motorcycle">Motorcycle</option>
        <option value="Truck">Truck</option>
    </select><br>

    <button type="submit">Add Vehicle</button>
</form>

<!-- Add Service Record Form -->
<form action="VehicleServlet" method="post">
    <h3>Add Service Record</h3>
    <input type="hidden" name="action" value="addService">
    <label>Vehicle Reg. Number:</label>
    <input type="text" name="regNumber" required><br>

    <label>Service Description:</label>
    <input type="text" name="description" required><br>

    <button type="submit">Add Service Record</button>
</form>


<button><a  type="button" href="vehicle_list.jsp" class="btn btn-outline-warning">Go Back</a> </button>
<button><a  type="button" href="customer-list.jsp" class="btn btn-outline-warning">Go Back</a> </button>
<button><a  type="button" href="add-customer.jsp" class="btn btn-outline-warning">Go Back</a> </button>
<a href="dashboard.jsp">Dashboard</a>
<a href="login.jsp">login</a>



</body>
</html>
