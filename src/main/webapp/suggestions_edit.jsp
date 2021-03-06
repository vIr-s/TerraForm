<html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
    <title> Suggestions </title>
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>
    <script src="./metrojs/MetroJs.js" type="text/javascript"></script>
    <link href="./metrojs/MetroJs.css" type="text/css" rel="stylesheet">
</head>
<body>
        <div class="tiles red">
            <c:set var="flipDelay" value="2000" />
            <c:set var="tileColor" value="blue" />
            <fmt:parseNumber var="count" value="0" />
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
                <c:choose>
                    <c:when test="${count == 2}">
                        <br><br><br><br><br><br><br><br><br>
                        <fmt:parseNumber var="count" value="0" />
                    </c:when>
                    <c:otherwise>
                        <c:set var="count" value="${count + 1}" />
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
    <script>
        $(".live-tile").liveTile();
    </script>
</body>
</html>