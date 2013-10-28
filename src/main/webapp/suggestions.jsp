<!DOCTYPE HTML>
<%@page import="terraform.common.URLHelper"%>
<html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<title>TerraForm</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css" />
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>
<script src="./metrojs/MetroJs.js" type="text/javascript"></script>
<link href="./metrojs/MetroJs.css" type="text/css" rel="stylesheet">
</head>

<body>
	<%
		if (request.getAttribute("obj") == null) {
			// response.sendRedirect("/");
			response.sendRedirect(URLHelper.getRedirectURL(request, "/"));
		}
	%>

	<div id="fb-root"></div>
	<script>
		var xmlhttp;
		var envProp = {};

		if (window.XMLHttpRequest) {
			// IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp = new XMLHttpRequest();

			xmlhttp.onreadystatechange = function() {
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {

					var o = eval('(' + xmlhttp.responseText + ')');
					envProp.FB_CHANNEL_URL = o.FB_CHANNEL_URL;
					envProp.FB_LOGIN_URL = o.FB_LOGIN_URL;

					window.fbAsyncInit = function() {

						FB.init({
							appId : '263887647069917', // App ID
							// channelUrl : '//terraform.herokuapp.com/channel.html', // Channel File
							channelUrl : '//localhost:8080/channel.html', // Channel File
							cookie : true, // enable cookies to allow the server to access the session
							status : false,
							xfbml : true
						});

						FB.getLoginStatus(function(response) {
							if (response.status != 'connected') {
								location.replace('/');
							}
						});

						FB.Event.subscribe('auth.logout', function(response) {
							var exdate = new Date();
							exdate.setDate(exdate.getDate() - 100);
							var c_value = escape("") + "; expires="
									+ exdate.toUTCString();
							document.cookie = "tfid" + "=" + c_value;

							location.replace("/");
						});
					};

					// Load the SDK asynchronously
					(function(d) {
						var js, id = 'facebook-jssdk', ref = d
								.getElementsByTagName('script')[0];
						if (d.getElementById(id)) {
							return;
						}
						js = d.createElement('script');
						js.id = id;
						js.async = true;
						js.src = "//connect.facebook.net/en_US/all.js";
						ref.parentNode.insertBefore(js, ref);
					}(document));
				}
			}
		}

		xmlhttp.open("GET", "prop", true);
		xmlhttp.send();
	</script>

	<div data-role="page" data-theme='i' id="home_page">
		<div data-role="header" data-theme='c'>
			<a href="#locationDiag" data-rel="dialog" data-icon="gear" data-iconpos="notext" class="ui-btn-right"></a>
			<fb:login-button show-faces="false" max-rows="1" autologoutlink="true" size="large" style="float: left; top: 6px; left: 5px;"></fb:login-button>
			<span class="ui-title">TerraForm</span>
		</div>
		<div data-role="content" style="text-align: center;">
			<div class="tiles red">
				<c:set var="flipDelay" value="2000" />
				<c:set var="tileColor" value="blue" />
				<fmt:parseNumber var="count" value="0" />
				<c:forEach items="${businesses}" var="business">
					<div class="live-tile ${tileColor}" data-mode="flip" data-initdelay="${flipDelay}" data-delay="4000">
						<!-- adding the 'full' class to an 'img' or 'a' tag causes it to fill the entire tile -->
						<div>
							<a href="${business.yelpUrl}" target='_blank'><img class="full" src="${business.picUrl}" alt="first" /></a>
						</div>
						<div>
							<p>
								<a href="${business.yelpUrl}" target='_blank'>${business.name}</a>
							</p>
							<img src="${business.ratingUrl}" alt="first" />
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
						<c:when test="${count == 1}">
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
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
		</div>
	</div>

	<div data-role="page" id="locationDiag" data-close-btn="right">

		<div data-role="header" data-theme="d" class="ui-header ui-bar-d" role="banner">
			<!--
			<a href="#" class="ui-btn-left ui-btn ui-btn-up-d ui-shadow ui-btn-corner-all ui-btn-icon-notext" data-icon="delete" data-iconpos="notext" data-corners="true" data-shadow="true"
				data-iconshadow="true" data-wrapperels="span" data-theme="d" title="Close"><span class="ui-btn-inner"><span class="ui-btn-text">Close</span><span
					class="ui-icon ui-icon-delete ui-icon-shadow">&nbsp;</span></span></a>
			-->
			<h1 class="ui-title" role="heading">Choose Location</h1>
		</div>

		<div data-role="content" class="ui-content ui-body-c" role="main">
			<ul data-role="listview" data-inset="true" data-filter="true" data-filter-reveal="true" data-filter-placeholder="Location...">
				<li><a href="#" onclick="getNewSuggestions('atlanta')">Atlanta</a></li>
				<li><a href="#" onclick="getNewSuggestions('new_york')">New York</a></li>
				<li><a href="#" onclick="getNewSuggestions('san_francisco')">San Francisco</a></li>
				<li><a href="#" onclick="getNewSuggestions('washington_dc')">Washington D.C.</a></li>
				<li><a href="#" onclick="getNewSuggestions('seattle')">Seattle</a></li>
				<li><a href="#" onclick="getNewSuggestions('austin')">Austin</a></li>
				<li><a href="#" onclick="getNewSuggestions('new_orleans')">New Orleans</a></li>
				<li><a href="#" onclick="getNewSuggestions('miami')">Miami</a></li>
				<li><a href="#" onclick="getNewSuggestions('london')">London</a></li>
				<li><a href="#" onclick="getNewSuggestions('portland')">Portland</a></li>
				<li><a href="#" onclick="getNewSuggestions('los_angeles')">Los Angeles</a></li>
			</ul>
		</div>
	</div>
	<script>
		function getNewSuggestions(city) {
			document.cookie = "city" + "=" + city;
			location.replace('/main');
		}
	</script>
</body>
</html>
