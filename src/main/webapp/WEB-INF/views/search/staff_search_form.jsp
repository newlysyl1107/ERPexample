<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<link rel="stylesheet" href="../resources/css/staff_search_form.css">
<title>Insert title here</title>


</head>
<body>
	<div class="container">
	<div class="search-input">
		<div class="row" style="text-align: center;">
			<div class="col" style="background-color: #cecece;padding-bottom:8px;padding-top:8px;"><b>사원 정보 검색</b></div>
		</div>
		<div class="row">
			<div class="col-1 col-title">이름</div>
			<div class="col-3">
				<input type="text" class="name-input">
			</div>
			<div class="col-1 col-title">성별</div>
			<div class="col-3" style="text-align:center;">
				<input type="checkbox" value="남" name="gender" onclick="oneCheckbox(this)"> 남 &nbsp; 
				<input type="checkbox" value="여" name="gender" onclick="oneCheckbox(this)"> 여
			</div>
			<div class="col-1 col-title">부서</div>
			<div class="col-3" style="text-align:center;">
				<select style="width:200px;">
					<option value="none"></option>
					<option value="컨설팅사업부">컨설팅사업부</option>
					<option value="하이테크사업부">하이테크사업부</option>
					<option value="SI사업부">SI사업부</option>
					<option value="전략기획팀">전략기획팀</option>
					<option value="경영지원팀">경영지원팀</option>
				</select>
			</div>
		</div>
		<div class="row">
			<div class="col-1 col-title">학력</div>
			<div class="col-3" style="text-align:center;">
				<input type="checkbox"> 고졸 &nbsp;
				<input type="checkbox"> 전문대졸  &nbsp;
				<input type="checkbox"> 일반대졸
			</div>
			<div class="col-1 col-title">기술</div>
			<div class="col-7">
				<input type="checkbox"> Java &nbsp;&nbsp;
				<input type="checkbox"> JSP &nbsp;&nbsp;
				<input type="checkbox"> ASP &nbsp;&nbsp;
				<input type="checkbox"> PHP &nbsp;&nbsp;
				<input type="checkbox"> Delphi
			</div>
		</div>
		<div class="row">
			<div class="col-1 col-title">졸업일</div>
			<div class="col searchBox">
				<select id="graduateYear" class="year-select"></select> 년
				<select id="graduateMonth" class="month-select"></select> 월
				<select id="graduateDay" class="day-select"></select> 일
			</div>
		</div>
	</div>
	<div class="btn-wrap">
		<button type="button" class="search-btn" onclick="search()"> 검색 </button>
		<button type="button" class="allSearch-btn" onclick="showAllResult()"> 전부검색</button>
		<button type="button" class="clear-btn"> 초기화 </button>
		<button type="button" class="submit-btn" onclick="openInsertPage()"> 등록 </button>
	</div>
	
	<div class="result-wrap">
		
	</div>

	</div>



<script>
	function showAllResult() {
		$(".result-wrap").load("showAllResult");
	}
	
	function openInsertPage() {
		window.name = "parent";
		window.open("insertStaffPage", "child", "width=1370, height=700, resizable=no");
	}
</script>





<script>
/* function showAllResult() {
 	$.ajax({
		url:"showAllResult",
		type:"get",
		success:function (result) {
			data = result;
			
				$(".result-wrap").append("<div class='row searchRow"+i+"'>");
	
				$(".searchRow"+i).append("<div class='col-1' style='border:1px solid #222;'> 번호  </div>" );
				$(".searchRow"+i).append("<div class='col-3' style='border:1px solid #222;'> 이름  </div>" );
				$(".searchRow"+i).append("<div class='col-1' style='border:1px solid #222;'> 성별  </div>" );
				$(".searchRow"+i).append("<div class='col-3' style='border:1px solid #222;'> 부서  </div>" );
				$(".searchRow"+i).append("<div class='col-3' style='border:1px solid #222;'> 졸업일  </div>" );
				
				$(".result-wrap").append("</div>");
		}
	}) */
/* 	$.ajax({
		url:"showAllResult",
		type:"get",
		success:function(list) {
			$(".result-wrap").append("<p>"+ list.staff_name +"</p>");
		}
	}) 
} */
</script>


<script>
// select 연월일
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
})
</script>

<script>
// 체크박스 하나만 선택되도록 하기
function oneCheckbox(a){

    var obj = document.getElementsByName("gender");
    
    for(var i=0; i<obj.length; i++){
        if(obj[i] != a) {
            obj[i].checked = false;
        }

    }

}

</script>












</body>
</html>



