<html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
            <c:set var="flipDelay" value="2000" />
            <c:set var="tileColor" value="blue" />
            <c:forEach items="${businesses}" var="business">
                <div class="live-tile ${tileColor}" data-mode="flip" data-initdelay="${flipDelay}" data-delay="4000">
                    <!-- adding the 'full' class to an 'img' or 'a' tag causes it to fill the entire tile -->
                    <div><a href="#"><img class="full" src="${business.picUrl}" alt="first" /></a>
                    </div>
                    <div>
                        <p>${business.name}</p>
                    </div>
                </div>
                <c:choose>
                  <c:when test="${flipDelay == 2000}">
                    <c:set var="flipDelay" value="0" />
                    <c:set var="tileColor" value="" />
                  </c:when>
                  <c:otherwise>
                    <c:set var="flipDelay" value="2000" />
                    <c:set var="tileColor" value="blue" />
                  </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
    <script>
        $(".live-tile").liveTile();
    </script>
</body>
</html>