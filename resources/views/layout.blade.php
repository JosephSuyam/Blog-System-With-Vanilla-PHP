<!DOCTYPE html>
<html lang="en">
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>
        <?php
            echo (isset($pgTitle) ? $pgTitle: "Default: Page Title");
        ?>
        </title>
        <link rel = "stylesheet" href = "../css/bootstrap/css/bootstrap(3.3.7).css">
        <link rel = "stylesheet" href = "../css/stylo.css">
        <link rel = "stylesheet" href = "../css/style.css">
        
        <script language = "javascript" type = "text/javascript" src = "../js/jquery-2.0.2.js"></script>
        <script language = "javascript" type = "text/javascript" src = "../js/jquery.min.js"></script>
    </head>
    <body>
        <div class="container">

            @yield('container')
            
        </div>
    </body>

    <script language = "javascript" type = "text/javascript" src = "../js/jquery-1.9.1.js"></script>
    <script language = "javascript" type = "text/javascript" src = "../js/bootstrap.js"></script>
</html>