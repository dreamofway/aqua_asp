var faceBook_appID = "1032833390156719";
jQuery(document).ready(function(){

	// Load the SDK asynchronously
	(function(d, s, id) {
	  var js, fjs = d.getElementsByTagName(s)[0];
	  if (d.getElementById(id)) return;
	  js = d.createElement(s); js.id = id;
	  js.src = "//connect.facebook.net/en/sdk.js#xfbml=1&version=v2.5&appId="+faceBook_appID;
	  fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));


});

/**
	로그인 시도
*/
function fb_login(access_type) {
	
	
	// 전송버튼 hidden 후 로딩 이미지 show
	//loading_call();


	FB.login(function(response) {
		if (response.authResponse) {
			FB.api('/me?fields=name,email,picture', function(response) {
			
				if(response["email"] == null) {
					alert("이메일 정보를 제공해주셔야 가입이 가능합니다.");
				} else {
					/*
					if(terms_check() == false) {
						return false;
					}
					*/

					jQuery("#sns_join_type").val("facebook");
					jQuery("#sns_id").val(response.id);
					jQuery("#sns_email").val(response.email);
					jQuery("#sns_name").val(response.name);
					jQuery("#sns_profile_image").val(response.picture.data.url);
					jQuery("#sns_basics_terms_agree").val("y");
					jQuery("#sns_service_terms_agree").val("y");
					jQuery("#sns_personalData_terms_agree").val("y");

					if(jQuery("#email_receive_agree").prop("checked") == true) {
						jQuery("#sns_email_receive_agree").val("y");
					} else {
						jQuery("#sns_email_receive_agree").val("n");
					}

					jQuery("#sns_from").submit();
				}

			});
		} else {
			//로그인 실패.
			//alert("페이스북 계정연동에 문제가 발생하였습니다.\n\n잠시 후 다시 시도해주세요.");
			jQuery.unblockUI();
		}
	}, {scope: 'public_profile, email', return_scopes: true , auth_type: 'rerequest'});
}
