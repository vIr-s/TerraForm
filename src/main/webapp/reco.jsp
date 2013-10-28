<!DOCTYPE HTML>
<html>

<head>
<title>TerraForm</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css" />
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>

</head>

<body>
	<%
		if (request.getAttribute("obj") == null) {
			// response.sendRedirect("/");
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
		<div data-role="content" style="text-align: center;"></div>
	</div>

	<div data-role="page" id="locationDiag"  data-close-btn="right">

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
				<li><a href="#" onclick="console.log('a')">Acura</a></li>
				<li><a href="#">Audi</a></li>
				<li><a href="#">BMW</a></li>
				<li><a href="#">Cadillac</a></li>
				<li><a href="#">Chrysler</a></li>
				<li><a href="#">Dodge</a></li>
				<li><a href="#">Ferrari</a></li>
				<li><a href="#">Ford</a></li>
				<li><a href="#">GMC</a></li>
				<li><a href="#">Honda</a></li>
				<li><a href="#">Hyundai</a></li>
				<li><a href="#">Infiniti</a></li>
				<li><a href="#">Jeep</a></li>
				<li><a href="#">Kia</a></li>
				<li><a href="#">Lexus</a></li>
				<li><a href="#">Mini</a></li>
				<li><a href="#">Nissan</a></li>
				<li><a href="#">Porsche</a></li>
				<li><a href="#">Subaru</a></li>
				<li><a href="#">Toyota</a></li>
				<li><a href="#">Volkswagen</a></li>
				<li><a href="#">Volvo</a></li>
			</ul>
		</div>
	</div>
</body>
</html>