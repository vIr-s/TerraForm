<html>
<head>
<title>TerraForm</title>
<style type="text/css">
a.fbbtn {
	background-image: url("images/active_200.png");
	display: inline-block;
	width: 100px;
	height: 46px;
}

a.fbbtn:HOVER {
	background-image: url("images/pressed_200.png");
}
</style>
</head>
<body>
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
					envProp.FB_LOGIN_URL = o.FB_LOGIN_URL;
					envProp.FB_CHANNEL_URL = o.FB_CHANNEL_URL;

					document.getElementById("IDfbBtn").href = o.FB_LOGIN_URL;

					window.fbAsyncInit = function() {

						FB.Event.subscribe('auth.statusChange', function(
								response) {
							if (response.status === 'connected') {
								location.replace(envProp.FB_LOGIN_URL);
							}
						});

						FB.init({
							appId : '263887647069917', // App ID
							// channelUrl : '//terraform.herokuapp.com/channel.html', // Channel File
							channelUrl : envProp.FB_CHANNEL_URL, // Channel File
							status : true, // check login status
							cookie : true, // enable cookies to allow the server to access the session
							xfbml : true
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

			xmlhttp.open("GET", "prop", true);
			xmlhttp.send();
		}
	</script>

	<!--
  Below we include the Login Button social plugin. This button uses the JavaScript SDK to
  present a graphical Login button that triggers the FB.login() function when clicked.

  Learn more about options for the login button plugin:
  /docs/reference/plugins/login/ -->

	<!-- <fb:login-button show-faces="false" max-rows="1" autologoutlink="true"
		size="large" onlogin="foo()"></fb:login-button> -->

	<a id="IDfbBtn" class="fbbtn"></a>

</body>
</html>