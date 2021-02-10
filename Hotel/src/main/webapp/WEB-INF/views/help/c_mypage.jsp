<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp"%>


<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text">
					<h2>MyPage</h2>
					<div class="breadcrumb-option">
						<a href="/"><i class="fa fa-home"></i> Home</a>
						<a href="c_mypage?mid=${sessionScope.MLoginId }">My Page</a>
						<span>My Information</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Breadcrumb Section Begin -->

<!-- Property Section Begin -->
<section class="property-section spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="property-sidebar">
					<div class="best-agents">
						<h4>MyPage</h4>
						<a href="c_mypage?mid=${sessionScope.MLoginId }" class="ba-item">
							<div class="ba-text">
								<h5>내 정보</h5>
								<span>Info</span>
							</div>
						</a> <a href="c_myBookingList" class="ba-item">
							<div class="ba-text">
								<h5>내 예약 목록</h5>
								<span>Booking</span>
							</div>
						</a> <a href="heartList" class="ba-item">
							<div class="ba-text">
								<h5>찜 목록</h5>
								<span>♡</span>
							</div>
						</a> <a href="reviewPage" class="ba-item">
							<div class="ba-text">
								<h5>나의 후기</h5>
								<span>Review</span>
							</div>
						</a>
						<button
							onclick="delMember('${memberDTO.mcode }','${memberDTO.mid }')"
							class="ba-item btn-none">
							<div class="ba-text">
								<h5>회원 탈퇴</h5>
								<span>Secession</span>
							</div>
						</button>
					</div>
				</div>
			</div>
			<!-- 사이드 메뉴 끝 -->

			<div class="col-lg-9">
				<h4 class="property-title">내 정보</h4>
				<div class="property-list">
					<div class="single-property-item">
						<div class="row">
							<div class="col-lg-10 accordion_one">
								<div class="panel-group" id="accordion_oneRight">

									<form action="memberModify" method="post" id="myInfo">
										<table class="table-width">
											<tr>
												<td>이름</td>
												<td><input type="text" class="input-table" value="${memberDTO.mname }" id="mname" name="mname" readonly="readonly"></td>
											</tr>
											<tr>
												<td>아이디</td>
												<td><input type="text" class="input-table" value="${memberDTO.mid }" id="mid" name="mid" readonly="readonly"></td>
											</tr>
											<tr>
												<td>전화번호</td>
												<td><input type="text" class="input-table" value="${memberDTO.mphone }" id="mphone" name="mphone" readonly="readonly"></td>
											</tr>
											<tr>
												<td>생일</td>
												<td><input type="date" class="input-table" value="${memberDTO.mbirth }" id="mbirth" name="mbirth" readonly="readonly"></td>
											</tr>
											<tr>
												<td>이메일</td>
												<td><input type="text" class="input-table" value="${memberDTO.memail }" id="memail" name="memail" readonly="readonly"></td>
											</tr>
											<tr id="password-text">
												<td><span style="color: #ff0000;">*</span> 회원 비밀번호</td>
												<td><input type="password" class="input-table" id="check_password"></td>
											</tr>
											<tr>
												<td colspan="2"><input type="button" class="site-btn btn" id="modify-1" value="수정하기" onclick="remove_readonly()">
													<input type="button" class="site-btn btn" id="modify-2" value="수정하기" onclick="myInfo_modify()">
													<input type="reset" class="site-btn btn" style="width: 115px" id="reset" value="취소"></td>
											</tr>
										</table>
									</form>
								</div>
							</div>
						</div>
					</div>
</section>
<!-- Property Section End -->




<%@ include file="../includes/footer.jsp"%>


<script type="text/javascript">
	function remove_readonly() {
		$('#modify-2').show()
		$('#reset').show()
		$('#password-text').show()
		$('#modify-1').hide()

		$("#mname").removeAttr("readolny")
		$("#mid").removeAttr("readonly")
		$("#mphone").removeAttr("readonly")
		$("#mbirth").removeAttr("readonly")
		$("#memail").removeAttr("readonly")
	}

	function myInfo_modify() {
		var check = $("#check_password").val()
		var member = ${memberDTO.mpassword}
		console.log(check);
		console.log(member);
		/* 비밀번호가 같으면 실행 */
		if (check == member) {
			var mid = $("#mid").val();
			var mname = $("#mname").val();
			var mphone = $("#mphone").val();
			var mbirth = $("#mbirth").val();
			var memail = $("#memail").val();
			/* 멤버 정보 수정 */
			$.ajax({
				type: 'post',
				url : 'memberModify',
				data : {
					"mid": mid,
					"mname": mname,
					"mphone": mphone,
					"mbirth": mbirth,
					"memail": memail
					},
				dataType: 'text',
				success : function(data){									
					if(data == "OK") alert('수정이 완료되었습니다.');
					location.href="c_mypage";
				},
				error: function(){
					console.log('연결 실패')
				}
			});
		} else {
			alert('비밀번호가 일치하지 않습니다.')
			return;
		}
	}

	$("#reset").click(function() {
		$("#mname").attr("readolny", true)
		$("#mid").attr("readonly", true)
		$("#mphone").attr("readonly", true)
		$("#mbirth").attr("readonly", true)
		$("#memail").attr("readonly", true)
		
		$('#modify-1').show()
		$('#modify-2').hide()
		$('#reset').hide()
		$('#password-text').hide()

	});

	/* 멤버 삭제 */
	function delMember(mcode, mid) {
		$.ajax({
			type : 'post',
			url : 'memberDelete',
			data : {
				'mcode' : mcode,
				'mid' : mid
			},
			dataType : 'text',
			success : function(result) {
				console.log(result);
				if (result == 'OK') {
					alert('탈퇴되었습니다.')
					location.href = "/"
				}
			},
			error : function() {
				console.log('member 삭제 연결 실패')
			}
		})
	}
</script>