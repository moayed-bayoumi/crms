<!DOCTYPE html>
<html>

<head>
    <title>List of Books</title>
    <!-- Add CSS file -->
    <link rel="stylesheet" type="text/css" href="assets/style.css">
</head>

<body>
    <!-- Add header -->
    <header>
        <h1>List of Books</h1>
    </header>

    <div class="container-fluid">
        <div class="col-lg-12">
            <div class="row mb-4 mt-4">
                <div class="col-md-12">

                </div>
            </div>
            <div class="row">
                <!-- FORM Panel -->

                <!-- Table Panel -->
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <b>List of Books</b>
                            <span class="float:right"><a class="btn btn-primary btn-block btn-sm col-sm-2 float-right" href="javascript:void(0)" id="new_book">
                                    <i class="fa fa-plus"></i> New Entry
                                </a></span>
                            <button class="btn btn-success btn-block btn-sm col-sm-2 float-right" id="export_csv">
                                <i class="fa fa-download"></i> Export CSV
                            </button>
                        </div>
                        <div class="card-body">
                            <table class="table table-condensed table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th class="text-center">#</th>
                                        <th class="">المؤجر</th>
                                        <th class="">تاريخ الاستلام</th>
                                        <th class="">تاريخ التسليم</th>
                                        <th class="">Days</th>
                                        <th class="">معلومات السيارة </th>
                                        <th class="">الحالة</th>
                                        <th class="text-center">تعديل</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    $i = 1;
                                    $cat = array();
                                    $cat[] = '';
                                    $qry = $conn->query("SELECT * FROM categories ");
                                    while ($row = $qry->fetch_assoc()) {
                                        $cat[$row['id']] = $row['name'];
                                    }
                                    $tt = array();
                                    $tt[] = '';
                                    $qry = $conn->query("SELECT * FROM transmission_types ");
                                    while ($row = $qry->fetch_assoc()) {
                                        $tt[$row['id']] = $row['name'];
                                    }
                                    $et = array();
                                    $et[] = '';
                                    $qry = $conn->query("SELECT * FROM engine_types ");
                                    while ($row = $qry->fetch_assoc()) {
                                        $et[$row['id']] = $row['name'];
                                    }
                                    $books = $conn->query("SELECT b.*,c.model,c.brand,c.transmission_id,c.engine_id, DATEDIFF(b.dropoff_datetime, b.pickup_datetime) as days_diff FROM books b inner join cars c on c.id = b.car_id ");
                                    while ($row = $books->fetch_assoc()) :

                                    ?>
                                        <tr>
                                            <td class="text-center"><?php echo $i++ ?></td>
                                            <td class="">
                                                <p> <b><?php echo ucwords($row['name']) ?></b></p>
                                            </td>
                                            <td class="">
                                                <p> <b><?php echo date("M d,Y h:i A", strtotime($row['pickup_datetime'])) ?></b></p>
                                            </td>
                                            <td class="">
                                                <p> <b><?php echo date("M d,Y h:i A", strtotime($row['dropoff_datetime'])) ?></b></p>
                                            </td>
                                            <td class=""><?php echo $row['days_diff'] ?></td>
                                            <td>
                                                <p>Brand: <b><?php echo ucwords($row['brand']) ?></b></p>
                                                <p>Model: <b><?php echo ucwords($row['model']) ?></b></p>
                                            </td>
                                            <td>
                                                <?php if ($row['status'] == 1) : ?>
                                                    <span class="badge badge-secondary">Pending</span>
                                                <?php elseif ($row['status'] == 2) : ?>
                                                    <span class="badge badge-primary">Confirmed</span>
                                                <?php else : ?>
                                                    <span class="badge badge-danger">Canceled</span>
                                                <?php endif; ?>
                                            </td>
                                            <td class="text-center">
                                                <button class="btn btn-sm btn-outline-primary edit_book" type="button" data-id="<?php echo $row['id'] ?>">Edit</button>
                                                <button class="btn btn-sm btn-outline-danger delete_book" type="button" data-id="<?php echo $row['id'] ?>">Delete</button>
                                            </td>
                                        </tr>
                                    <?php endwhile; ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- Table Panel -->
            </div>
        </div>
    </div>

    <!-- Add footer -->
    <footer>
        <p>&copy; 2023 Book Management System. All rights reserved.</p>
    </footer>

    <!-- Add JS file -->
    <script src="assets/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/datatables/datatables.min.js"></script>
    <script src="assets/script.js"></script>
</body>

</html>
<!-- Add asset folder with CSS and JS files -->
<!-- In "assets" folder, create "style.css" and "script.js" files -->
<!-- Update path to CSS and JS files in header and footer -->