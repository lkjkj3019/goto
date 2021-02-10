<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
	//SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
	Kakao.init('6de89a1775e81d3bf2eebade3deea3b8');

	// SDK 초기화 여부를 판단합니다.
	console.log(Kakao.isInitialized());
</script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<style>
.api-btn {
	min-width: 222px;
	height: 49px;
	line-height: 49px;
	font-size: 16px;
	font-weight: 600;
	color: #000;
	background-color: #ffeb00;
	border: 0;
}
</style>
<!-- Property Details Hero Section Begin -->

<!-- Property Details Section Begin -->
<section class="property-details-section spad">
	<div class="container pd-hero-section">
		<div class="row pd-details-text" style="text-align: center;">
			<div class="col-lg-6 property-contactus margin_center">
				<h4 class="table-in">회원 로그인</h4>
				<form action="MemberLogin" class="agent-contact-form section-title"
					id="memberLogin" method="post">
					<input type="text" name="mid" id="mid" placeholder="아이디"> 
					<input type="text" name="mpassword" id="mpassword" placeholder="비밀번호">
					<div class="margin_center" style="padding: 10px 0; text-align: right; margin: 0 auto;">
						<a href="findLoginForm"><span>아이디 </span></a> 
						<a href="findPasswordForm"><span>• 비밀번호 찾기</span></a>
					</div>
					<button type="button" onclick="MLoginBtn()" class="site-btn btn">로그인</button>
				</form>
				<form action="kakaoLogin">
					<a id="kakao-login-btn" href="javascript:loginWithKakao()">
					<img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" width="222" />
					</a>
				</form>
			</div>
		</div>
	</div>
</section>

<script type="text/javascript">
	function MLoginBtn() {
		var mid = $("#mid").val();
		var mpassword = $("#mpassword").val();
		var MLoginId = '${sessionScope.MLoginId}';
		console.log(mid + ":::" + mpassword + ":::" + MLoginId);

		if (mid == '') {
			alert("아이디를 입력해야 합니다.");
			$("#mid").focus();
			return;
		}
		if (mpassword == '') {
			alert("비밀번호를 입력해야 합니다.");
			$("#mpassword").focus();
			return;
		}
		memberLogin.submit();

	};

	$(document).ready(function() {
		var loginResult = "${loginResult}";
		if (loginResult == "NO") {
			alert('아이디 비밀번호가 일치하지 않습니다.')
		}
	})
function loginWithKakao() {
		/* 카카오 api 불러오기 */
    Kakao.Auth.loginForm({
				success : function(authObj) {
					Kakao.API.request({
								url : '/v2/user/me',
								success : function(response) {
									/* 카카오 연동된 아이디, 이메일, 닉네임 받기 */
									var userId = response.id;
									var userEmail = response.kakao_account.email;
									var userNickname = response.properties.nickname;
									
									console.log("userId", userId);
									console.log("userEmail", userEmail);
									console.log("userNickname", userNickname);

									/* 카카오로 회원가입이 되어 있는지 확인하여 회원가입 되어있다면 비밀번호 받기 */
									var mpassword = checkKakaoJoin(userId);
									console.log("mpassword", mpassword);
									if(mpassword != null){
										/* 비밀번호가 비어있지 않다면 로그인 */
										$("#mid").val(userId);
										$("#mpassword").val(mpassword);
										MLoginBtn();
									} else {
										/* 카카오 계정으로 회원가입 되어있는 아이디가 없다면 회원가입 시키기 */
										if(confirm('카카오계정으로 가입된 정보가 없습니다. 카카오 계정으로 가입하시겠습니까?')){
											joinKakao(userId, userEmail, userNickname);
										}
									}
								},
								fail : function(error) {
									alert('login success, but failed to request user information: '
											+ JSON.stringify(error))
								},
							})
							console.log(authObj);
					var token = authObj.access_token;
				},
      fail: function(err) {
        alert(JSON.stringify(err))
      },
    })
  }
  
/* 카카오 아이디로 회원가입 되어 있는지 확인 */
  function checkKakaoJoin(userId){
		var checkResult = null;
		$.ajax({
			type: "post",
			url: "checkKakaoJoin",
			data: {
				"userId": userId
				},
			dataType: "text",
			async: false,
			success: function(result){
				if(result != "NO") {
					checkResult = result;
					}
				},
			error: function(){
				console.log('checkKakao 연결 실패')
				}
			
			})
			return checkResult;
	  }
  
  /* 카카오로 회원가입하는 window창 띄우기 */
	function joinKakao(userId, userEmail, userNickname){
		window.name = "joinKakao";
		var openWin = window.open("joinKakaoForm?mid="+userId+"&memail="+userEmail+"&mname="+userNickname, "joinKakaoPop", "width=600, height=800, left=100, top=50")
	}
	
	function gotoMain(){
		alert('회원가입 및 로그인 되었습니다.');
		location.href="/";
		}
</script>


<%@ include file="../includes/footer.jsp"%>
