<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="xJaDprikqToZB1LMWhfhs3Db4OqyzZhBg6a2UurH">
        <title>
        <?php
            echo (isset($pgTitle) ? $pgTitle: "Default: Page Title");
        ?>
        </title>
        <link href="http://localhost/blog/public/css/app.css" rel="stylesheet">
        <link rel = "stylesheet" href = "../css/bootstrap/css/bootstrap(3.3.7).css">
        <link rel = "stylesheet" href = "../css/stylo.css">
        <link rel = "stylesheet" href = "../css/style.css">
        
        <script language = "javascript" type = "text/javascript" src = "../js/jquery-2.0.2.js"></script>
        <script language = "javascript" type = "text/javascript" src = "../js/jquery.min.js"></script>
    </head>
    <body style="min-width: 100%; min-height: 100%; position: relative;">
        <div class="container" style="min-height: 100%; min-width: 100%; position: relative;">

            @yield('content')
            
        </div>
    </body>

    <script language = "javascript" type = "text/javascript" src = "../js/jquery-1.9.1.js"></script>
    <script language = "javascript" type = "text/javascript" src = "../js/bootstrap.js"></script>
</html>