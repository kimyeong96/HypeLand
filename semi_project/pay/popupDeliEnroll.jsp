<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송지 수정</title>
<!-- Core theme CSS (includes Bootstrap)-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
 integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<style>
.container{
    text-align: right;
    padding: 30px;
    width: 800px;
    text-align: center;
}

tr {
  border-bottom: 1px solid #00000050;
  text-align: left;
  font-size: 0.8rem;
}

.star {
  color: red;
}

.phoneWrap {
  margin-right: 40px;
}

.phone {
  margin-right: 3px;
  width: 100px;
  height: 30px;
  border: 1px solid lightgray;
}

.container {
  width: 900px;
}
.adress{
  font-size: 0.8rem;
}

.button{
  width: 120px;
  height: 50px;
  font-size: 0.8rem;
}
</style>
<script>
$(document).ready(function(){
	$("#btnBack").on("click", function(){
		location.href = "/toSearchDeli.deli";
	});
	
	
	$("#btnConfirm").on("click", function(){
		if( $("#deli_place").val()== "" || $("#deli_name").val()== "" || $("#deli_phone2").val()== "" ||
			$("#deli_phone3").val()== "" ||	$("#deli_postCode").val()== "" || $("#deli_roadAddr").val()== ""){
			alert("정보를 입력해주세요.");
			return;
		}
		
		let phone = $("#deli_phone1 option:selected").val()+$("#deli_phone2").val() + $("#deli_phone3").val();
		$("#deli_phone").val(phone);
		let regexPhone = /[0-9]{11}/;

		if(!regexPhone.test(phone)){
			alert("올바르지 않은 형식의 전화번호 입니다.");
			return;
		}
		
		if( $("#deli_detailAddr").val() == ""){
			let result = confirm("상세주소가 입력되지 않아 배송에 차질이 생길 수 있습니다."
								 + "변경하시겠습니까?");
			if(!result){
				return;
			}
		}
		
		let deli_address = $("#deli_roadAddr").val() + " " + $("#deli_detailAddr").val();
		$("#deli_address").val(deli_address);
		let data = $("#insertForm").serialize();
		
		$.ajax({
			url : "/toinsertDeliProc.deli"
			, type : "post"
			, data : data
			, success : function(resultData){
				if(resultData === "enrollSuccess"){
					alert("등록 성공");
					
					opener.parent.location.reload();
					
				}else{
					alert("등록 실패!");
				}
				location.href="/toSearchDeli.deli";
			}, error : function(e){
				console.log(e);
			}
		})
		
	});
	
	$('#btnPostCode').on('click', function () {
		  new daum.Postcode({
		    oncomplete: function (data) {
		      var roadAddr = data.roadAddress; // 도로명 주소 변수
		      var extraRoadAddr = ''; // 참고 항목 변수

		      if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
		        extraRoadAddr += data.bname;
		      }
		      // 건물명이 있고, 공동주택일 경우 추가한다
		      if (data.buildingName !== '' && data.apartment === 'Y') {
		        extraRoadAddr +=
		          extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName;
		      }
		      // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		      if (extraRoadAddr !== '') {
		        extraRoadAddr = ' (' + extraRoadAddr + ')';
		      }

		      // 우편번호와 주소 정보를 해당 필드에 넣는다.
		      $('#deli_postCode').val(data.zonecode);
		      $('#deli_roadAddr').val(roadAddr);

		      // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
		      if (roadAddr !== '') {
		        $('#extraAddr').val(extraRoadAddr);
		      } else {
		        $('#extraAddr').val('');
		      }
		    }
		  }).open();
		});
	
});

</script>
<body>
<form id="insertForm" action="/toinsertDeliProc.deli" method="post">
 <div class="container" style="padding: 30px; width: 800px;text-align: center;">
     <div class="row">
         <div class="col"><h3 style="font-weight: bold;">배송지 입력하기</h3></div>
     </div>
     <table class="join_table mt-5">
         <colgroup>
           <col width="25%">
         </colgroup>
         <tbody>
         <tr style="height: 70px;">
             <th>
               <label for="memberId">배송지명</label>
             </th>
             <td colspan="2">
               <input type="text" id="deli_place" name="deli_place" placeholder="ex)회사" >
             </td>
           </tr>
           <tr style="height: 70px;">
             <th>
               <label for="memberId">수령인</label>
             </th>
             <td colspan="2">
               <input type="text" id="deli_name" name="deli_name" placeholder="ex)홍길동" >
             </td>
           </tr>
           <tr style="height: 70px;">
             <th>
               <label for="selectNo">휴대폰</label>
             </th>
             <td colspan="2">
               <div class="row">
                 <div class="col-2 phoneWrap">
                   <select name="deli_phone1" id="deli_phone1" class="phone">
                     <option value="010">010</option>
                     <option value="011">011</option>
                     <option value="016">016</option>
                     <option value="017">017</option>
                     <option value="018">018</option>
                     <option value="019">019</option>
                   </select>
                 </div>
                 <div class="col-2 phoneWrap">
                   <input type="text" class="form-control phone" id="deli_phone2"name="deli_phone2" maxlength="4">
                 </div>
                 <div class="col-2 phoneWrap">
                   <input type="text" class="form-control phone"id="deli_phone3" name="deli_phone3" maxlength="4">
                   <input type="hidden" id="deli_phone" name="deli_phone"  >
                 </div>
               </div>
             </td>
           </tr>
           <tr>
             <th>
               <label for="adress">주소</label>
             </th>
             <td colspan="2">
               <div class="row p-2">
                 <div class="col">
                   <input type="text" class="form-control adress" id="deli_postCode" name="deli_postCode" placeholder="우편번호"  readonly>
                 </div>
                 <div class="col">
                   <button type="button" class="btn btn-primary w-100 adress" id="btnPostCode">우편번호 찾기</button>
                 </div>
               </div>
               <div class="row p-2">
                 <div class="col">
                   <input type="text" class="form-control adress" id="deli_roadAddr" name="deli_roadAddr" placeholder="도로명주소" readonly>
                   
                 </div>
               </div>
               <div class="row p-2">
                 <div class="col mb-2">
                   <input type="text" class="form-control adress" id="deli_detailAddr" name="deli_detailAddr" placeholder="상세주소">
                   <input type="hidden" class="form-control" id="deli_address" name="deli_address">
                 </div>
               </div>
             </td>
           </tr>
         </tbody>
       </table>
     <div class="row" style="margin-top: 10px;">
         <div class="col">
             <button type="button" id="btnBack" class="btn btn-secondary button">취소</button>
             <button type="button" id="btnConfirm" class="btn btn-dark button">등록</button>
         </div>
     </div>
 </div>
</form>
</body>
</html>