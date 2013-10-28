<%@page import="terraform.common.URLHelper"%>
<html>
<head>
<title>TerraForm</title>
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
							var exdate=new Date();
							exdate.setDate(exdate.getDate() - 100);
							var c_value=escape("") + "; expires="+exdate.toUTCString();
							document.cookie="tfid" + "=" + c_value;
							
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

	<!--
  Below we include the Login Button social plugin. This button uses the JavaScript SDK to
  present a graphical Login button that triggers the FB.login() function when clicked.

  Learn more about options for the login button plugin:
  /docs/reference/plugins/login/ -->

	<fb:login-button show-faces="false" max-rows="1" autologoutlink="true"
		size="large"></fb:login-button>
	<div>OK</div>
</body>
</html>