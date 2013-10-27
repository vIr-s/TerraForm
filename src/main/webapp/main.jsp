<html>
<head>
<title>TerraForm</title>
</head>
<body>
	<div id="fb-root"></div>
	<script>
		window.fbAsyncInit = function() {

			FB.init({
				appId : '263887647069917', // App ID
				channelUrl : '//localhost:8080/channel.html', // Channel File
				cookie : true, // enable cookies to allow the server to access the session
				status: false,
				xfbml : true
			});

			FB.getLoginStatus(function(response) {
				if (response.status != 'connected') {
					location.replace('/');
				}
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