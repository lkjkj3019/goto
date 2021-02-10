<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/a_sidebar.jsp"%>
<!-- main 시작 -->
<!-- main top 시작-->
<div class="main">
	<section class="breadcrumb-section">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text">
					<h2>1대1 문의 답변</h2>
					<div class="breadcrumb-option">
						<span>AnswerForm</span>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- main top 끝 -->

	<!-- main container 시작 -->
	<section class="property-section spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="property-list">
						<div class="card shadow property-list">
							<div class="card-body single-property-item">
								<div class="table-responsive accordion_one">
									<table class="table table-bordered" cellspacing="0">
											<tr>
												<th>카테고리</th>
												<td><input type="hidden" id="hecode" value="${helpAnswer.hecode }">
													<input type="text" class="input-table table-in" value="${helpAnswer.qcname }"
													readonly="readonly"></td>
											</tr>
											<tr>
												<th>문의제목</th>
												<td><input type="text" class="input-table table-in" value="${helpAnswer.hetitle }"
													readonly="readonly"></td>
											</tr>
											<tr>
												<th>내용</th>
												<td><input type="text" class="input-table table-in" value="${helpAnswer.hecontent }"
													readonly="readonly"></td>
											</tr>
											<tr>
												<th>관리자아이디</th>
												<td><input type="text" class="input-table table-in" value="${sessionScope.ALoginId }" readonly="readonly"></td>
											</tr>
											<tr>
												<th>답변</th>
												<td><textarea class="" id="heanswer"></textarea></td>
											</tr>

											<tr>
												<td colspan="2"><input type="button"  class="site-btn btn" value="답변하기" onclick="answerSubmit()"></td>
											</tr>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- main container 끝 -->
</div>
<!-- main 끝 -->
</body>

<!-- Js Plugins -->
<script src="resources/js/jquery-3.3.1.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.magnific-popup.min.js"></script>
<script src="resources/js/jquery.nice-select.min.js"></script>
<script src="resources/js/jquery.slicknav.js"></script>
<script src="resources/js/jquery-ui.min.js"></script>
<script src="resources/js/owl.carousel.min.js"></script>
<script src="resources/js/main.js"></script>
<script type="text/javascript">
function answerSubmit(){
	var hecode = $("#hecode").val()
	var heanswer = $("#heanswer").val()
	console.log(hecode);
	console.log(heanswer);
	/* 작성한 답변이 있으면 실행 */
	if(heanswer != ""){
		/* 답변 update */
		$.ajax({
			type : "post",
			url : "answerUpdate",
			data : {
					"heanswer":heanswer,
					"hecode":hecode,
			},
			dataType : "text",
			success : function(result){
				if(result=="OK"){
					alert("등록성공");
					location.href="a_questionList";
				}
			},
			error: function(){
				console.log('연결 실패')
			}
		})
	}else{
		alert("답변을 작성해 주세요.");
	}
}

</script>

</html>