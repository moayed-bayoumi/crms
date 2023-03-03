<?php

// Import database connection
require_once('db_connect.php');

// Define the page title
$page_title = 'List of Books';

// Query the categories table and build an array of category names
$categories = [];
$result = $conn->query("SELECT * FROM categories");
while ($row = $result->fetch_assoc()) {
    $categories[$row['id']] = $row['name'];
}

// Query the transmission_types table and build an array of transmission type names
$transmission_types = [];
$result = $conn->query("SELECT * FROM transmission_types");
while ($row = $result->fetch_assoc()) {
    $transmission_types[$row['id']] = $row['name'];
}

// Query the engine_types table and build an array of engine type names
$engine_types = [];
$result = $conn->query("SELECT * FROM engine_types");
while ($row = $result->fetch_assoc()) {
    $engine_types[$row['id']] = $row['name'];
}

// Query the books and cars tables, and build a result set for the book list
$result = $conn->query("
    SELECT b.*, c.model, c.brand, c.transmission_id, c.engine_id,
           DATEDIFF(b.dropoff_datetime, b.pickup_datetime) AS days_diff
    FROM books b
    INNER JOIN cars c ON c.id = b.car_id
");

// Define an array to hold the book data for the table
$book_data = [];

// Loop through each row in the result set and add it to the book data array
while ($row = $result->fetch_assoc()) {
    $book_data[] = [
        'id' => $row['id'],
        'name' => ucwords($row['name']),
        'pickup_datetime' => date('M d, Y h:i A', strtotime($row['pickup_datetime'])),
        'dropoff_datetime' => date('M d, Y h:i A', strtotime($row['dropoff_datetime'])),
        'days_diff' => $row['days_diff'],
        'brand' => ucwords($row['brand']),
        'model' => ucwords($row['model']),
        'transmission_type' => $transmission_types[$row['transmission_id']],
        'engine_type' => $engine_types[$row['engine_id']],
        'status' => $row['status']
    ];
}

// Include the header HTML
include('app/assets/header.php');


?>
<style>
    <?php include 'app/css/books.css'; ?>
</style>
<div class="container">
    <div class="row mb-4 mt-4">
        <div class="col-md-12">
            <h1>List of Books</h1>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <b>List of Books</b>
                    <span class="float-right">
                        <a class="btn btn-primary btn-block btn-sm col-sm-2 float-right" href="javascript:void(0)" id="new_book">
                            <i class="fa fa-plus"></i> New Entry
                        </a>
                    </span>
                    <button class="btn btn-success btn-block btn-sm col-sm-2 float-right" id="export_csv">
                        <i class="fa fa-download"></i> Export CSV
                    </button>
                </div>
                <div class="card-body">
                    <table class="table table-condensed table-bordered table-hover" id="book_table">
                        <thead>
                            <tr>
                                <th class="text-center">#</th>
                                <th class="">المؤجر</th>
                                <th class="">تاريخ الاستلام</th>
                                <th class="">تاريخ التسليم</th>
                                <th class="">Days</th>
                                <th class="">معلومات السيارة</th>
                                <th class="">الحالة</th>
                                <th class="text-center">تعديل</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            // Loop through the book data array and generate the rows for the book table
                            foreach ($book_data as $i => $book) {
                                $status_label = '';
                                switch ($book['status']) {
                                    case 1:
                                        $status_label = '<span class="badge badge-secondary">Pending</span>';
                                        break;
                                    case 2:
                                        $status_label = '<span class="badge badge-primary">Confirmed</span>';
                                        break;
                                    case 3:
                                        $status_label = '<span class="badge badge-danger">Canceled</span>';
                                        break;
                                }
                            ?>
                                <tr>
                                    <td class="text-center"><?php echo $i + 1 ?></td>
                                    <td><?php echo $book['name'] ?></td>
                                    <td><?php echo $book['pickup_datetime'] ?></td>
                                    <td><?php echo $book['dropoff_datetime'] ?></td>
                                    <td><?php echo $book['days_diff'] ?></td>
                                    <td>
                                        <p>Brand: <b><?php echo $book['brand'] ?></b></p>
                                        <p>Model: <b><?php echo $book['model'] ?></b></p>
                                        <p>Transmission Type: <b><?php echo $book['transmission_type'] ?></b></p>
                                        <p>Engine Type: <b><?php echo $book['engine_type'] ?></b></p>
                                    </td>
                                    <td><?php echo $status_label ?></td>
                                    <td class="text-center">
                                        <button class="btn btn-sm btn-outline-primary edit_book" type="button" data-id="<?php echo $book['id'] ?>">Edit</button>
                                        <button class="btn btn-sm btn-outline-danger delete_book" type="button" data-id="<?php echo $book['id'] ?>">Delete</button>
                                    </td>
                                </tr>
                            <?php
                            }
                            ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Include the footer HTML -->
<?php include('app/assets/footer.php'); ?>
<!-- Add CSS and JS files -->
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
<script>
    $(document).ready(function() {
        $('table').dataTable()
    })

    $('.view_book').click(function() {
        window.open("../index.php?page=view_book&id=" + $(this).attr('data-id'))

    })
    $('#new_book').click(function() {
        uni_modal("New Book", "manage_booking.php", "mid-large")

    })
    $('.edit_book').click(function() {
        uni_modal("Manage Book Details", "manage_booking.php?id=" + $(this).attr('data-id'), "mid-large")

    })
    $('.delete_book').click(function() {
        _conf("Are you sure to delete this book?", "delete_book", [$(this).attr('data-id')])
    })

    function delete_book($id) {
        start_load()
        $.ajax({
            url: 'ajax.php?action=delete_book',
            method: 'POST',
            data: {
                id: $id
            },
            success: function(resp) {
                if (resp == 1) {
                    alert_toast("Data successfully deleted", 'success')
                    setTimeout(function() {
                        location.reload()
                    }, 1500)

                }
            }
        })
    }

    // 




    // data to cvs
    $(document).ready(function() {
        // Initialize DataTable
        $('table').dataTable();

        // Export CSV button click event handler
        $('#export_csv').click(function() {
            // Get table data as an array of arrays
            var table_data = $('table').DataTable().data().toArray();

            // Convert the table data to CSV format
            var csv_data = table_data.map(function(row) {
                return row.join(',');
            }).join('\n');

            // Download the CSV file
            var a = document.createElement('a');
            a.href = 'data:text/csv;charset=utf-8,' + encodeURIComponent(csv_data);
            a.download = 'books.csv';
            a.click();
        });
    });
</script>

<!-- Add footer -->
<footer>
    <p>&copy; 2023 Book Management System. All rights reserved.</p>
</footer>