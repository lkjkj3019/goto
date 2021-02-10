<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../includes/a_sidebar.jsp"%>
<!-- main 시작 -->
<style>
input{
    border: none;
    color: #aaaab3;
}
</style>
<!-- main top 시작-->
<div class="main">
   <section class="breadcrumb-section">
      <div class="row">
         <div class="col-lg-12">
            <div class="breadcrumb-text">
               <h2>업체 정보 수정</h2>
               <div class="breadcrumb-option">
                  <span>CompanyInfoView</span>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!-- main top 끝 -->

   <!-- main container 시작 -->
   <section class="property-section spad">
      <div class="container" style="text-align: center;">
         <div class="row">
            <div class="col-lg-12">
               <div class="property-list">
                  <div class="card shadow">
                     <div class="card-body">
                        <div class="table-responsive">
                           <table class="table table-bordered" cellspacing="0">
                              <tr>
                                 <td>아이디</td>
                                 <td><input type="text" name="cmid"
                                    value="${companyDTO.cmid }" readonly="readonly"></td>
                              </tr>
                              <tr>
                                 <td>비밀번호</td>
                                 <td><input type="text" name="cmpassword"
                                    value="${companyDTO.cmpassword }" readonly="readonly"></td>
                              </tr>
                              <tr>
                                 <td>이름</td>
                                 <td><input type="text" name="cmname"
                                    value="${companyDTO.cmname }" readonly="readonly"></td>
                              </tr>
                              <tr>
                                 <td>업체코드(번호)</td>
                                 <td><input type="text" name="cmcode"
                                    value="${companyDTO.cmcode }" readonly="readonly"></td>
                              </tr>
                              <tr>
                                 <td>이메일</td>
                                 <td><input type="email" name="cmemail"
                                    value="${companyDTO.cmemail }" readonly="readonly"></td>
                              </tr>
                              <tr>
                                 <td>전화번호</td>
                                 <td><input type="text" name="cmphone"
                                    value="${companyDTO.cmphone }" readonly="readonly"></td>
                              </tr>
                              <tr>
                                 <td>주소</td>
                                 <td><input type="text" name="cmaddress"
                                    value="${companyDTO.cmaddress }" readonly="readonly"></td>
                              </tr>
                           </table>
                           <button type="button" class="site-btn btn"
                              onclick="location.href='CompanyModify?cmid=${companyDTO.cmid }'">업체정보수정</button>
                              <button type="button" class="site-btn btn" onclick="companyDelete()">업체 탈퇴</button>
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
<script type="text/javascript">
	function companyDelete(){
		var cmcode = '${companyDTO.cmcode }';
		var cmid = '${companyDTO.cmid}';
		var inputPw = prompt('비밀번호를 입력하세요');
		var loginPw = '${companyDTO.cmpassword}';
		if(inputPw == loginPw){
			alert('탈퇴되었습니다.')
			location.href="companyDelete?cmid="+cmid+"&cmcode="+cmcode;
			}
		}
</script>


<!-- Js Plugins -->
<script src="resources/js/jquery-3.3.1.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.magnific-popup.min.js"></script>
<script src="resources/js/jquery.nice-select.min.js"></script>
<script src="resources/js/jquery.slicknav.js"></script>
<script src="resources/js/jquery-ui.min.js"></script>
<script src="resources/js/owl.carousel.min.js"></script>
<script src="resources/js/main.js"></script>
</html>