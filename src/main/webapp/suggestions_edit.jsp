<html>
<head>
    <title> Suggestions </title>
    <script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
    <script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script src="./metrojs/MetroJs.js" type="text/javascript"></script>
    <link href="./metrojs/MetroJs.css" type="text/css" rel="stylesheet">
</head>
<body>
    <h1>Terraform</h1>
    <div class="tiles red">
        <div class="live-tile" data-mode="flip" data-initdelay="500">
            <!-- adding the 'full' class to an 'img' or 'a' tag causes it to fill the entire tile -->
            <div> <a href="#"><img class="full" src="http://s3-media2.ak.yelpcdn.com/bphoto/LyxRzNho2KYVgOVlGwOlQQ/ms.jpg" alt="first" /></a>

            </div>
            <div>
                <p>Taqueria Olgys</p>
            </div>
        </div>
        <div class="live-tile blue" data-mode="flip">
            <!-- adding the 'full' class to an 'img' or 'a' tag causes it to fill the entire tile -->
            <div> <a href="#"><img class="full" src="http://s3-media4.ak.yelpcdn.com/bphoto/ZKIzftdm2UyEvesX0_OS_Q/ms.jpg" alt="first" /></a>

            </div>
            <div>
                <p>Cactus Flower Cafe</p>
            </div>
        </div>
    </div>
    <script>
        $(".live-tile").liveTile();
    </script>
</body>
</html>