<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<style>
#help{
color: #2CBDB8;
}
</style>
<!-- Property Section Begin -->
<section class="contact-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-3" style="margin-top: 200px;">
				<div class="property-sidebar">
					<div class="best-agents">
						<h4>Help</h4>
						<c:if test="${sessionScope.MLoginId != null }">
							<a href="questionList" class="ba-item">
								<div class="ba-text">
									<h5>1대1 문의 목록</h5>
									<span>Q&A</span>
								</div>
							</a>
							<a href="HelpWriteForm" class="ba-item">
								<div class="ba-text">
									<h5>1대1 문의 작성</h5>
									<span>1:1 Write</span>
								</div>
						</c:if>
						</a> <a href="/c_FAQList" class="ba-item">
							<div class="ba-text">
								<h5>자주 묻는 질문</h5>
								<span>FAQ</span>
							</div>
						</a>
					</div>
				</div>
			</div>
			<!-- 사이드 메뉴 끝 -->

			<!-- Contact Section Begin -->
			<div class="col-lg-7 offset-lg-1">
				<div class="contact-text">
					<div class="section-title">
						<span>Help</span>
						<h2>1대1 문의 작성 폼</h2>
					</div>
					<form action="HelpWrite" class="contact-form">
						<select name="he_qccode" id="he_qccode">
						<c:forEach var="list" items="${qcateList }">
							<option value="${list.qccode }">${list.qcname }</option>
						</c:forEach>
						</select><br>
						<br>
						<br> <input type="text" name="hetitle" id="hetitle"
							placeholder="제목"> <input type="text" name="he_mid"
							id="he_mid" value="${sessionScope.MLoginId }" readonly="readonly">

						<textarea placeholder="내용" name="hecontent" id="hecontent"></textarea>
						<button type="button" onclick="submitForm()" class="site-btn btn">보내기</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>

<script type="text/javascript">
	function submitForm() {
		var he_qccode = $("#he_qccode").val();
		var hetitle = $("#hetitle").val();
		var he_mid = $("#he_mid").val();
		var hecontent = $("#hecontent").val();
		if(hetitle == ""){
			alert('제목을 입력해주세요');
			$("#hetitle").focus();
			return;
			}
		if(hecontent == ""){
			alert('내용을 입력해주세요');
			$("#hecontent").focus();
			return;
			}
		/* 문의 등록 */
		$.ajax({
			type : 'post',
			url : 'HelpWrite',
			data : {
				"he_qccode" : he_qccode,
				"hetitle" : hetitle,
				"he_mid" : he_mid,
				"hecontent" : hecontent,
			},
			dataType : 'text',
			success : function(data) {
				if (data == "OK")
					alert('문의가 접수되었습니다.');
				location.href = "questionList";
			},
			error : function() {
				console.log('연결 실패')
			}
		});
	}
</script>






<%@ include file="../includes/footer.jsp"%>