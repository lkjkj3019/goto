<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp"%>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- 상단 지도 부분 -->
<section class="breadcrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <h2>Booking Check</h2>
                        <div class="breadcrumb-option">
                            호텔 예약 체크
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

<section class="property-section spad">
        <div class="container" style="margin-left: auto; margin-right: auto;">
            <div class="row">
     
                <div class="col-lg-12">
                    <h4 class="property-title" style="text-align: center;">예약 체크</h4>
                    <div class="property-list">


				<div class="col-lg-9">

                            <div class="contact-text">
                                <form action="bookingCheck" class="contact-form" method="post" id="bookingForm">
                                    <input type="hidden" id="inputBcode" name="bcode" value="${boCheck.bcode}"><span id="bcodeCheck"></span>
                                    <input type="text" readonly="readonly" value="${mCheck.mname }">
                                    <input type="hidden" name="b_mcode" value="${mCheck.mcode }">
                                    
                                    <input type="text" readonly="readonly" value="${ctCheck.ctname }">
                                    <input type="hidden" name="b_ctcode" value="${ctCheck.ctcode }">
                                    <input type="hidden" name="b_hocode" value="${inCheck.in_hocode}">
                                    
                                    <input type="text" readonly="readonly" value="${hoCheck.honame }">
                                    <input type="text" readonly="readonly" value="${inCheck.inwifi }">
                                    <input type="text" readonly="readonly" value="${inCheck.inbreak }">
                                    <label>체크인</label><input type="date" name="bcheckin" readonly="readonly" value="${boCheck.bcheckin }">
                                    <label>체크아웃</label><input type="date" name="bcheckout" readonly="readonly" value="${boCheck.bcheckout }">
                                    <i class="fa fa-car"></i><input type="text" readonly="readonly" value="${inCheck.inparking }">
                                    
                                    <input type="text" readonly="readonly" value="${roCheck.roname }">
                                    <input type="hidden" name="b_rocode" value="${roCheck.rocode }">
                                    <input type="text" readonly="readonly" value="${roCheck.rodetail }">
                                    <label>가격</label><input type="text" name="bprice" readonly="readonly" value="${roCheck.roprice }">
                                    <label>인원수</label><input type="number" name="bperson"  max="${roCheck.romaxper }">
									
                                    <textarea name="brequest" placeholder="요청 사항"></textarea>
                                    <!-- 회원가입 버튼 -->
								<hr>
								<div class="col-lg-12">
									<div class="loadmore">
										<button onclike="submitForm()" class="btn site-btn">예약하기</button>
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
    
<script type="text/javascript">
	function submitForm(){
		bookingForm.submit();
		}
</script>
    
    
 <%@ include file="../includes/footer.jsp"%>