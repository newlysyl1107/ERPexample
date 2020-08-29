<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- bootStrap -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/staff_updel_form.css">
<title>Insert dd here</title>
</head>
<body>
<form name="frm" id="frm" method="post">
<input type="hidden" value="1" name="staffVO.gender">
	<div class="container">
		<div class="search-input">
			<div class="row" style="text-align: center;">
				<div class="col" style="background-color: #cecece; padding-bottom: 8px; padding-top: 8px;">
					<b>사원 정보 수정</b>
				</div>
			</div>
			<div class="row">
				<div class="col-1 col-title">이름</div>
				<div class="col-3">
					<input type="text" id="staffName" name="staffName" class="name-input" value="${userInfo.staffName }">
				</div>
				<div class="col-1 col-title">주민번호</div>
				<div class="col-3" style="text-align: center;">
					<input type="text" id="juminFront" name="juminFront" class="jumin-front" value="${front }"> - <input type="password" id="juminBack" name="juminBack" class="jumin-back" value="${back }">
				</div>
				<div class="col-1 col-title">부서</div>
				<div class="col-3" style="text-align: center;">
					<select style="width: 200px;" id="departmentCode" name="departmentCode" sel="${userInfo.departmentCode }">
						<option value="none"></option>
						<option value="1">컨설팅사업부</option>
						<option value="2">하이테크사업부</option>
						<option value="3">SI사업부</option>
						<option value="4">반도체사업부</option>
						<option value="5">기업부설연구소</option>
						<option value="6">전략기획팀</option>
						<option value="7">경영지원팀</option>
					</select>
				</div>
			</div>
			<div class="row">
				<div class="col-1 col-title">학력</div>
				<div class="col-3" style="text-align: center;">
					<input type="checkbox" name="schoolCode" value="1" id='schoolCheck1' onclick="oneCheckbox(this)"> 고졸  &nbsp; 
					<input type="checkbox" name="schoolCode" value="2" id='schoolCheck2' onclick="oneCheckbox(this)"> 전문대졸  &nbsp; 
					<input type="checkbox" name="schoolCode" value="3" id='schoolCheck3' onclick="oneCheckbox(this)"> 일반대졸
				</div>
				<div class="col-1 col-title">기술</div>
				<div class="col-7">
					<input type="checkbox" name="tech" id="tech1" value="1"> Java &nbsp;&nbsp;
					<input type="checkbox" name="tech" id="tech2" value="2"> JSP &nbsp;&nbsp; 
					<input type="checkbox" name="tech" id="tech3" value="3"> ASP &nbsp;&nbsp;
					<input type="checkbox" name="tech" id="tech4" value="4"> PHP &nbsp;&nbsp; 
					<input type="checkbox" name="tech" id="tech5" value="5"> Delphi
				</div>
			</div>
			<div class="row">
				<div class="col-1 col-title">졸업일</div>
				<div class="col searchBox">
					<select id="graduateYear" class="year-select" sel="${year }"></select> 년 
					<select id="graduateMonth" class="month-select" sel="${notZeroMonth }"></select> 월 
					<select id="graduateDay" class="day-select" sel="${notZeroDay }"></select> 일
				</div>
			</div>
		</div>
		<div class="btn-wrap">
			<button type="button" id="updateBtn" class="update-btn" onclick="updateStaff()"> 수정 </button>
			<button type="button" id="deleteBtn" class="delete-btn" onclick="deleteStaff()"> 삭제 </button>
		</div>
	</div>
</form>



<script>
$(document).ready(function() {
	
	
	// 연도 select
	$("#graduateYear").append('<option value="none"></option>');
	for(var year=1980; year<=2020; year++) {
		$("#graduateYear").append('<option value="' + year + '">' + year + '</option>');
	}
	
	// 월 select
	$("#graduateMonth").append('<option value="none"></option>');
	for(var month=1; month<=12; month++) {
		$("#graduateMonth").append('<option value="' + month + '">' + month + '</option>');
	}
	
	// 일 select
	$("#graduateDay").append('<option value="none"></option>');
	for(var day=1; day<=31; day++) {
		$("#graduateDay").append('<option value="' + day + '">' + day + '</option>');
	}
	
	// 부서코드 가져오기
	var temp1 = $("select#departmentCode").attr("sel");
	$('select#departmentCode option[value="'+temp1+'"]').attr('selected', 'selected');
	
	// 졸업일 가져오기
	var year = $("select#graduateYear").attr("sel");
	$('select#graduateYear option[value="'+year+'"]').attr('selected', 'selected');
	
	var month = $("select#graduateMonth").attr("sel");
	$('select#graduateMonth option[value="'+month+'"]').attr('selected', 'selected');
	
	var day = $("select#graduateDay").attr("sel");
	$('select#graduateDay option[value="'+day+'"]').attr('selected', 'selected');

	// 학력 가져오기
	$("input:checkbox[id='schoolCheck${userInfo.schoolCode}']").prop("checked", true);
	
	// 스킬 가져오기
	// 일단 staff_skill 테이블에 스태프넘버 제대로 들어가게 수정해야함!
	
})
</script>


<script>
	function updateStaff() {
		
		var staffName = $("#staffName").val();
		var juminFront = $("#juminFront").val();
		var juminBack = $("#juminBack").val();
		var jumin = juminFront + "-" + juminBack;
		var juminReg = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4][0-9]{6}$/;
		
		var nameCheck = false;
		var juminCheck = false;
		var schoolCheck = false;
		var departmentCheck = false;
		var graduateDayCheck = false;
		var techCheck = false;
		
		var formTag = document.getElementById("frm");
		
		
		// 이름 공백 확인
		if(staffName == '') {
			alert("이름을 입력해주세요");
		} else {
			nameCheck = true;
		}
		
		// 주민번호 공백 확인
		if(juminFront == '' || juminBack == '') {
			alert("주민번호를 입력해주세요");
		}
		
		// 학력 공백 확인 후 유효하면 form append
		if( $("input:checkbox[id=schoolCheck1]").is(":checked") == false &&
			$("input:checkbox[id=schoolCheck2]").is(":checked") == false &&
			$("input:checkbox[id=schoolCheck3]").is(":checked") == false ) {
			alert("학력을 선택해주세요");
		} else {
			schoolCheck = true;
			var schoolElement = document.createElement("input");
			var schoolValue = $("input:checkbox[name=schoolCode]:checked").val();
			schoolElement.setAttribute("type", "hidden");
			schoolElement.setAttribute("name", "staffVO.schoolCode");
			schoolElement.setAttribute("value", schoolValue);
			formTag.appendChild(schoolElement);
		}
		
		// 부서 공백 확인 후 유효하면 form append
		if( $("#departmentCode option:selected").val() == 'none' ) {
			alert("부서를 선택해주세요");
		} else {
			departmentCheck = true;
			var departmentElement = document.createElement("input");
			var departmentValue = $("#departmentCode > option:selected").val();
			departmentElement.setAttribute("type", "hidden");
			departmentElement.setAttribute("name", "staffVO.departmentCode");
			departmentElement.setAttribute("value", departmentValue);
			formTag.appendChild(departmentElement);
		}
		
		// 졸업일 공백 확인 후 유효하면 form append
		if( $("#graduateYear > option:selected").val() == 'none'  ||
			$("#graduateMonth > option:selected").val() == 'none' ||
			$("#graduateDay > option:selected").val() == 'none')     {
			alert("졸업일을 선택해주세요");
		}
		
		var yearValue = $("#graduateYear option:selected").val();
		var monthValue = $("#graduateMonth option:selected").val();
		var dateValue = $("#graduateDay option:selected").val();
		
		if(monthValue < 10) {
			monthValue = "0" + monthValue;
		}
		
		if(dateValue < 10) {
			dateValue = "0" + dateValue;
		}
		var graduateDay = yearValue + "-" + monthValue + "-" + dateValue;		// 2020-01-01
		alert(graduateDay);
		
		// 졸업일 날짜 유효성 확인
		var graduateDayReg = /[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])/;
		
		if(graduateDayReg.test(graduateDay) == false) {
			alert("졸업일이 유효한 날짜가 아닙니다.");
		} else {
			graduateDayCheck = true;
			var graduateElement = document.createElement("input");
			graduateElement.setAttribute("type", "hidden");
			graduateElement.setAttribute("name", "graduateDay");
			graduateElement.setAttribute("value", graduateDay);
			formTag.appendChild(graduateElement);
		}
		
		// 기술 선택 확인 후 유효하면 form append
		if( $("input:checkbox[id=tech1]").is(":checked") == false &&
			$("input:checkbox[id=tech2]").is(":checked") == false &&
			$("input:checkbox[id=tech3]").is(":checked") == false &&
			$("input:checkbox[id=tech4]").is(":checked") == false &&
			$("input:checkbox[id=tech5]").is(":checked") == false ) {
			alert("기술을 하나라도 선택해야 합니다.");
		} else {
			techCheck = true;
			// ★★★★★★★★★★★★★★★★★★ 기술은 staff 테이블이 아니라 staff_skill 테이블에 넣어야됨 ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
			var techElement = document.createElement("input");
			var techValues = [];
			$("input[name=tech]:checked").each(function(i) {
				techValues.push( parseInt($(this).val()) );
			})
			techElement.setAttribute("type", "hidden");
			techElement.setAttribute("name", "skillArray");
			techElement.setAttribute("value", techValues);
			formTag.appendChild(techElement);
			console.log(typeof techValues);
			console.log(typeof techValues[0]);
			console.log(typeof techValues[1]);
		}
		
		// 주민번호 유효성 확인 후 유효하면 form append
		if( juminFront != '' && juminBack != '' && !juminReg.test(jumin) ) {
			alert("주민번호가 유효하지 않습니다.");
		} else {
			juminCheck = true;
			var juminElement = document.createElement("input");
			juminElement.setAttribute("type", "hidden");
			juminElement.setAttribute("name", "juminNo");
			juminElement.setAttribute("value", jumin);
			formTag.appendChild(juminElement);
		}
		
		if(nameCheck == true && juminCheck == true && schoolCheck == true && departmentCheck == true &&
				graduateDayCheck == true && techCheck == true) {
				
				
				if(confirm("정말 저장하시겠습니까?") == true) {
				    
				    var staffData = $("[id=frm]").serialize();
		
				    $.ajax({
				    	url:"updateStaff",
				    	type:"post",
				    	data:staffData,
				    	success:function(result) {
				    		alert(result.msg);
				    		window.opener.location.reload();    //부모창 reload
						    window.close();    //현재 팝업창 Close
				    	}
				    })
				    
				} else {
					// 저장 취소한 경우
					return false;
				}
			}
	}
</script>

<script>
	function deleteStaff() {
		if(confirm("정말 삭제하시겠습니까?") == true) {
			
			$.ajax({
				url:"/a/member/deleteStaff/${userInfo.staffNo}",
				type:"get",
				success:function(result) {
					alert(result.msg);
					window.opener.location.reload();
					window.close();
				}
			})
		} else {
			return false;
		}
	}
</script>





</body>
</html>