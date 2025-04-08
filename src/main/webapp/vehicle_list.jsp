<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vehicle List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <h2 class="mb-4 text-center">All Vehicles</h2>
    <div class="table-responsive">
        <table class="table table-bordered table-hover text-center">
            <thead class="table-dark">
            <tr>
                <th>Reg. Number</th>
                <th>Owner</th>
                <th>Model</th>
                <th>Type</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <%
                String filePath = "C:\\Users\\USER\\Desktop\\OOP Project\\vehicle.info\\vehicle_data.txt";
                File file = new File(filePath);
                if (file.exists()) {
                    BufferedReader reader = new BufferedReader(new FileReader(file));
                    String line;
                    while ((line = reader.readLine()) != null) {
                        String[] data = line.split(",");
                        if (data.length == 4) {
            %>
            <tr>
                <td><%= data[0] %></td>
                <td><%= data[1] %></td>
                <td><%= data[2] %></td>
                <td><%= data[3] %></td>
                <td>
                    <form action="VehicleServlet" method="post" class="d-inline">
                        <input type="hidden" name="action" value="deleteVehicle">
                        <input type="hidden" name="id" value="<%= data[0] %>">
                        <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this vehicle?');">Delete</button>
                    </form>

                </td>
            </tr>
            <%
                        }
                    }
                    reader.close();
                }
            %>
            </tbody>
        </table>
    </div>
    <div class="text-center mt-3">
        <a href="index.jsp" class="btn btn-primary">Go Back</a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
