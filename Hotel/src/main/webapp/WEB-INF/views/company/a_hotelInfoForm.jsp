<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/a_sidebar.jsp"%>


<!-- 주소 -->
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<div class="main">
	<section class="breadcrumb-section">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text">
					<h2>호텔 등록</h2>
					<div class="breadcrumb-option">
						<span>HotelInfoForm</span>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- main top 끝 -->

<!-- Contact Section Begin -->
    <section class="contact-section">
        <div class="single-property-item" style="background-color: white;">
            <div class="row">
                <div class="col-lg-7" style="margin-left: auto; margin-right: auto;">
                    <div class="row">
                        <div class="col-lg-10 offset-lg-1">
                            <div class="contact-text">
                                <form action="hotelInfoForm" class="contact-form" method="post" enctype="multipart/form-data" id="insertId">
                                	<!-- 지역 카테고리 코드 선택 -->
                                	<div class="row">
                                    	<div class="col-lg-4">
                                    		<div class="section-title">
                                				<select name="ctname" id="ctname">
                                					<option value="none">지역 선택</option>
                                					<option value="서울">서울</option>
                                					<option value="경주">경주</option>
                                					<option value="부산">부산</option>
                                					<option value="여수">여수</option>
                                					<option value="제주도">제주도</option>
                            					</select>
                                    		</div>
                                    	</div>
                                    	<div class="col-lg-4" style="display: none;" id="ctdivideDiv">
                                    		<div class="section-title">
                                				<select name="ctdivide" id="ctdivide">
                                					<option value="none">지역 선택</option>
                                					<option value="동">동</option>
                                					<option value="서">서</option>
                                					<option value="남">남</option>
                                					<option value="북">북</option>
                            					</select>
                                    		</div>
                                    	</div>
                                    	<div class="col-lg-4" style="display: none;" id="ctboroughDiv">
                                    		<div class="section-title" id="optionId">
                                				<select name="ctborough" id="ctborough">
                                					<option value="none">지역 선택</option>
                                					<!-- <option value="은평구">은평구</option>
                                					<option value="서대문구">서대문구</option>
                                					<option value="종로구">종로구</option>
                                					<option value="중구">중구</option>
                                					<option value="용산구">용산구</option>
                                					<option value="마포구">마포구</option> -->
                            					</select>
                                    		</div>
                                    	</div>
                                    </div>
                                    <hr>
                                    
                                    <!-- 호텔 이름 -->
                                	<div class="ba-text">
                                        <label class="breadcrumb-text">호텔 이름</label>
                                        <input type="text" id="honame" name="honame" required="required">
                                    </div>
                                    
                                    <!-- 주소 -->
                                    <div class="row">
                                    	<div class="col-lg-6">
                                        	<label class="breadcrumb-text">주소</label>
                                        	<input type="text" id="sample6_postcode" name="hopost" placeholder="우편번호" required="required">
                                        </div>
                                        <div class="col-lg-6">
                                        	<label class="breadcrumb-text">우편번호</label>
											<input class="btn" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
										</div>
										<div class="col-lg-10">
											<input type="text" id="sample6_address" name="hoaddress" placeholder="주소">
										</div>
										<div class="col-lg-6">
											<input type="text" id="sample6_detailAddress" name="hodetail" placeholder="상세주소">
										</div>
										<div class="col-lg-6">
											<input type="text" id="sample6_extraAddress" name="hoexaddr" placeholder="참고항목">
										</div>
                                    </div>
                                    
                                    <!-- 호텔홍보내용 -->
                                	<div class="ba-text">
                                        <label class="breadcrumb-text">소개글</label>
                                        <textarea rows="8" class="card-body form-control" name="hopublicize" id="hopublicize"></textarea>
                                    </div>
                                    
                                    <hr>
                                    <!-- 정보들 입력 -->
                                    <!-- 와이파이 -->
                                    <div class="row">
                                		<div class="col-lg-4">
                                			<label class="breadcrumb-text">와이파이</label>
                                    		<input type="text" id="inwifi" name="inwifi" required="required" placeholder="무료와이파이제공/불가">
                               			</div>
                               			
                               			<!-- 조식 -->
                                		<div class="col-lg-4">
                                			<label class="breadcrumb-text">조식여부</label>
                                    		<input type="text" id="inbreak" name="inbreak" required="required" placeholder="조식제공/불가">
                                		</div>
                                		
                                		<!-- 주차장 -->
                                		<div class="col-lg-4">
                                			<label class="breadcrumb-text">주차장</label>
                                    		<input type="text" id="inparking" name="inparking" required="required" placeholder="무료주차/불가">
                                		</div>
                            		</div>
                            		
                            		<!-- 이른체크인 -->
                                    <div class="row">
                                		<div class="col-lg-6">
                                			<label class="breadcrumb-text">이른 체크인</label>
                                    		<input type="text" id="incin_early" name="incin_early" required="required" placeholder="ex)오후 14:00/해당없음">
                               			</div>
                               			
                               			<!-- 늦은 체크아웃 -->
                                		<div class="col-lg-6">
                                			<label class="breadcrumb-text">늦은 체크아웃</label>
                                    		<input type="text" id="incout_late" name="incout_late" required="required" placeholder="ex)오후 13:00/해당없음">
                                		</div>
                            		</div>
                            		
                            		<!-- 체크인 -->
                                    <div class="row">
                                		<div class="col-lg-6">
                                			<label class="breadcrumb-text">체크인</label>
                                    		<input type="text" id="incin" name="incin" required="required" placeholder="ex)오후 15:00">
                               			</div>
                               			
                               			<!-- 체크아웃 -->
                                		<div class="col-lg-6">
                                			<label class="breadcrumb-text">체크아웃</label>
                                    		<input type="text" id="incout" name="incout" required="required" placeholder="ex)오전 11:00">
                                		</div>
                            		</div>
                            		
                            		<!-- 그외 세부내용 -->
                                	<div class="ba-text">
                                        <label class="breadcrumb-text">그 외 세부내용</label>
                                        <textarea rows="8" class="card-body form-control" name="indetail" ></textarea>
                                    </div>
                                    
                                    <hr>
                                    <!-- 호텔사진 -->
									<div class="form-row">
										<div class="form-group col-md-6">
											<label class="small mb-1">호텔 사진</label> 
											<input type="file" class="form-control" id="hophoto" name="hophoto"><br>
										</div>
									</div>
                                    
                                    <!-- 등록 버튼 -->
                                    <hr>
                                    <div class="col-lg-12">
                    					<div class="loadmore">
                        					<button type="button" onclick="insertForm()" class="btn site-btn">등록하기</button>
                    					</div>
                					</div>
                                	</form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
    </section>
            </div>
    <!-- Contact Section End -->

<!-- Js Plugins -->
<script src="resources/js/jquery-3.3.1.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.magnific-popup.min.js"></script>
<script src="resources/js/jquery.nice-select.min.js"></script>
<script src="resources/js/jquery.slicknav.js"></script>
<script src="resources/js/jquery-ui.min.js"></script>
<script src="resources/js/owl.carousel.min.js"></script>
<script src="resources/js/main.js"></script>
<script src="resources/js/findLocation.js"></script>
</html>




<script type="text/javascript">
$(document).ready(function(){
    $(".active").removeClass('active');
    $("#hotelInsert").addClass('active');
    $("#ctname").change(function(){
		$("#ctdivideDiv").removeAttr("style");
    	})
    $("#ctdivide").change(function(){
        var ctname = $("#ctname").val();
        var ctdivide = $("#ctdivide").val();
        /* 도시 선택에 따라 지역 세부적으로 불러오기 */
		$.ajax({
			type : "post",
			url : "getCtborough",
			data : {
				"ctname" : ctname,
				"ctdivide" : ctdivide
				},
			dataType : "json",
			success : function(result) {
				console.log(result);
				showCtborough(result);
				},
				error : function(){
					alert("연결 실패.");
					}
			})
    	})
 })
 
 /* 세부 지역 option 생성 */
 function showCtborough(result){
	$("#ctboroughDiv").removeAttr("style");
	$("#ctborough").empty();
	$("#optionId .list").empty();
	var output = '<li data-value="none" class="option selected">지역 선택</li>';
	var option = "<option value='none'>지역 선택</option>";
	for(var list in result){
		option += "<option value='"+result[list]+"'>"+result[list]+"</option>";
		output += '<li data-value="'+result[list]+'" class="option selected focus">'+result[list]+'</li>'
		}
		$("#ctborough").append(option);
		$("#optionId .list").append(output);
	 }

	function insertForm(){
		var ctname = $("#ctname").val();
        var ctdivide = $("#ctdivide").val();
		var ctborough = $("#ctborough").val();
		/* 지역 선택 안 할 시에 insert  되지 않도록 */
		if(ctname == "none" || ctdivide == "none" || ctborough == "none"){
			alert('지역을 선택해주세요');
			return;
			}
		var honame = $("#honame").val();
        var hopost = $("#hopost").val();
		var inwifi = $("#inwifi").val();
		var inbreak = $("#inbreak").val();
		var hopublicize = $("#hopublicize").val();
		var inparking = $("#inparking").val();
		var incin_early =  $("#incin_early").val();
		var incout_late =  $("#incout_late").val();
		var incin =  $("#incin").val();
		var incout =  $("#incout").val();
		if(honame == "" || hopost == "" || inwifi == ""|| inbreak == "" || hopublicize == ""|| inparking == "" || incin_early == ""|| incout_late == "" || incin == ""|| incout == ""){
			alert('작성을 완료해주세요');
			return;
			}
		alert('등록되었습니다.')
		insertId.submit();
		
		}
</script>

