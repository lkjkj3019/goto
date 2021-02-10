<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/a_sidebar.jsp"%>
<!-- Breadcrumb Section Begin -->
<!-- Contact Section Begin -->
    <section class="contact-section">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-6" style="margin-left: auto; margin-right: auto;">
                    <div class="row">
                        <div class="col-lg-10 offset-lg-1">
                            <div class="contact-text">
                                <div class="section-title">
                                    <h2>호텔 정보</h2>
                                </div>
                                <form action="hotelModifyForm" class="contact-form" method="post" enctype="multipart/form-data">
                                    <!-- 호텔이름 -->
                                    <div class="row">
                                		<div class="col-lg-8">
                                			<label class="breadcrumb-text">호텔 이름</label>
                                    		<input type="text" id="honame" name="honame" value="${hotelDTO.honame }" readonly="readonly">
                               			</div>
                            		</div>
                                    
                                    <!-- 호텔주소 -->
                                	<div class="ba-text">
                                        <label class="breadcrumb-text">호텔 주소</label>
                                        <input type="text" id="hoaddr" name="hoaddr" readonly="readonly" value="${hotelDTO.hoaddr }">
                                    </div>
                                    
                                    <!-- 호텔홍보내용 -->
                                	<div class="ba-text">
                                        <label class="breadcrumb-text">소개글</label>
                                        <textarea rows="8" class="card-body form-control" name="hopublicize" readonly="readonly">${hotelDTO.hopublicize }</textarea>
                                    </div>
                                    
                                    <hr>
                                    
                                    <!-- 정보들 입력 -->
                                    <!-- 와이파이 -->
                                    <div class="row">
                                		<div class="col-lg-4">
                                			<label class="breadcrumb-text">와이파이</label>
                                    		<input type="text" id="inwifi" name="inwifi" readonly="readonly" value="${h_infoDTO.inwifi }">
                               			</div>
                               			
                               			<!-- 조식 -->
                                		<div class="col-lg-4">
                                			<label class="breadcrumb-text">조식여부</label>
                                    		<input type="text" id="inbreak" name="inbreak" readonly="readonly" value="${h_infoDTO.inbreak }">
                                		</div>
                                		
                                		<!-- 주차장 -->
                                		<div class="col-lg-4">
                                			<label class="breadcrumb-text">주차장</label>
                                    		<input type="text" id="inparking" name="inparking" readonly="readonly" value="${h_infoDTO.inparking }">
                                		</div>
                            		</div>
                            		
                            		<!-- 이른체크인 -->
                                    <div class="row">
                                		<div class="col-lg-6">
                                			<label class="breadcrumb-text">이른 체크인</label>
                                    		<input type="text" id="incin_early" name="incin_early" readonly="readonly" value="${h_infoDTO.incin_early }">
                               			</div>
                               			
                               			<!-- 늦은 체크아웃 -->
                                		<div class="col-lg-6">
                                			<label class="breadcrumb-text">늦은 체크아웃</label>
                                    		<input type="text" id="incout_late" name="incout_late" readonly="readonly" value="${h_infoDTO.incout_late }">
                                		</div>
                            		</div>
                            		
                            		<!-- 체크인 -->
                                    <div class="row">
                                		<div class="col-lg-6">
                                			<label class="breadcrumb-text">체크인</label>
                                    		<input type="text" id="incin" name="incin" readonly="readonly" value="${h_infoDTO.incin }">
                               			</div>
                               			
                               			<!-- 체크아웃 -->
                                		<div class="col-lg-6">
                                			<label class="breadcrumb-text">체크아웃</label>
                                    		<input type="text" id="incout" name="incout" readonly="readonly" value="${h_infoDTO.incout }">
                                		</div>
                            		</div>
                            		
                            		<!-- 그외 세부내용 -->
                                	<div class="ba-text">
                                        <label class="breadcrumb-text">그 외 세부내용</label>
                                        <textarea rows="8" class="card-body form-control update" name="indetail" id="indetail" readonly="readonly">${h_infoDTO.indetail }</textarea>
                                    </div>

									<hr>
								<!-- 호텔사진 -->
									<div class="form-row">
										<div class="form-group col-md-6">
											<label class="small mb-1">호텔 사진</label>
											<img src="/resources/img/hotelFile/${hotelDTO.hofileName }" style="max-width: 75%;">
										</div>
									</div>
								</form>

								<!-- 수정 버튼 -->
                                    <hr>
                                    <div class="col-lg-12">
                    					<div class="loadmore">
                        					<button type="button" class="btn site-btn" onclick="btnUpdate()" id="btnUp">수정하기</button>
                    					</div>
                					</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
    </section>
    <!-- Contact Section End -->
    </body>
<script type="text/javascript">
 	/* 수정버튼 */
	function btnUpdate(){
		console.log("btnUpdate() 실행.");

		var output = "<button type='button' class='btn site-btn' onclick='btnUpdateCheck(true)'>수정</button>";
		output += "   <button type='button' class='btn site-btn' onclick='btnUpdateCancel(false)'>취소</button>";
		
		$(".update").removeAttr("readonly");
		$("#btnUp").remove();
		$(".loadmore").html(output);
 	}


	 /* 세부내용 수정 */
	 function btnUpdateCheck(check) {
		console.log("btnUpdateCheck() 실행::" + check);

		if(check){
			var in_hocode = '${h_infoDTO.in_hocode}';
			/* 수정내용 */
			var newIndetail = $("#indetail").val();
			console.log(in_hocode+"::"+newIndetail);

			/* 원래내용 */
			var indetail = '${h_infoDTO.indetail }';

			/* 호텔 수정 */
			$.ajax({
				type : "post",
				url : "updateIndetail",
				data : {
					"in_hocode" : in_hocode,
					"indetail" : newIndetail
					},
					dataType : "text",
					success : function(updateResult){
						var output = "<button type='button' class='btn site-btn' onclick='btnUpdate()' id='btnUp'>수정</button>";

						 $(".update").attr("readonly","readonly");
						 $(".loadmore").html(output);
						},
					error : function(){
						alert("updateIndetail 연결 실패.");
						$("#indetail").val(indetail);
						}
				});
			}
		 }


	 
	 /* 취소버튼 */
	 function btnUpdateCancel(check){
		 console.log("btnUpdateCancel() 실행::" + check);

		 var output = "<button type='button' class='btn site-btn' onclick='btnUpdate()' id='btnUp'>수정</button>";

		 $(".update").attr("readonly","readonly");
		 $(".loadmore").html(output);
		 }
</script>

	<script src="resources/js/jquery-3.3.1.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
    <script src="resources/js/jquery.magnific-popup.min.js"></script>
    <script src="resources/js/jquery.nice-select.min.js"></script>
    <script src="resources/js/jquery.slicknav.js"></script>
    <script src="resources/js/jquery-ui.min.js"></script>
    <script src="resources/js/owl.carousel.min.js"></script>
    <script src="resources/js/main.js"></script>

</html>
