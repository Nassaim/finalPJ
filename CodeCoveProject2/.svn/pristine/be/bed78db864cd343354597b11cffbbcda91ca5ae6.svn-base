<!DOCTYPE html>
<html>
<head>
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id"
	content="636511148424-mghktber42ms2j1nu54v79m3r9de7cnk.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script>
	function onSignIn(googleUser) {
		console.log("클릭");
		// Useful data for your client-side scripts:
		var profile = googleUser.getBasicProfile();
		console.log("ID: " + profile.getId()); // Don't send this directly to your server!
		console.log('Full Name: ' + profile.getName());
		console.log('Given Name: ' + profile.getGivenName());
		console.log('Family Name: ' + profile.getFamilyName());
		console.log("Image URL: " + profile.getImageUrl());
		console.log("Email: " + profile.getEmail());

		// The ID token you need to pass to your backend:
		var id_token = googleUser.getAuthResponse().id_token;
		console.log("ID Token: " + id_token);
	}

	//         function init() {
	//             gapi.auth2.init({
	//                 client_id: '636511148424-mghktber42ms2j1nu54v79m3r9de7cnk.apps.googleusercontent.com'
	//             }).then(function() {
	//                 gapi.signin2.render('my-signin2', {
	//                     'scope': 'profile email',
	//                     'onsuccess': onSignIn
	//                 });
	//             });
	//         }
	window.onLoadCallback = function() {
		gapi.auth2.init({
			client_id : 'filler_text_for_client_id.apps.googleusercontent.com'
		}).then(function() {
			gapi.signin2.render('my-signin2', {
				'scope' : 'profile email',
				'onsuccess' : onSignIn
			});
		});
	}
</script>
</head>
<body>
	<div id="my-signin2"></div>
</body>
</html>
