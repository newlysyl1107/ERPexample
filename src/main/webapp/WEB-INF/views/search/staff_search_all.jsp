<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>

	<div class="result-count"> 검색건수 → ${list.size() }건 </div>
	<div class="result-table-wrap">
	<div class="row">
		<div class="col-2 title"><b>번호</b></div>
		<div class="col-2 title"><b>이름</b></div>
		<div class="col-2 title"><b>성별</b></div>
		<div class="col-2 title"><b>부서</b></div>
		<div class="col-2 title"><b>졸업일</b></div>
		<div class="col-2 title"></div>
	</div>
	<div class="row">
	   <c:forEach var="list" items="${list }">
			<div class="col-2 contents">${list.staffVO.staffNo }</div>
			<div class="col-2 contents">${list.staffVO.staffName }</div>
			<div class="col-2 contents">
				<c:choose>
					<c:when test="${list.staffVO.gender eq 0 }">
						남
					</c:when>
					<c:otherwise>
						여
					</c:otherwise>
				</c:choose>
			</div>
			<div class="col-2 contents">${list.codeDepartmentVO.departmentName }</div>
			<div class="col-2 contents">
				${list.staffVO.graduateDay }
			</div>
	<script>
		function openUpdatePage() {
			var staffNo = '${list.staffVO.staffNo}';
			window.name = "parent";
			window.open("updelStaff/" + staffNo, "child", "width=1370, height=700, resizable=no");
	}
	</script>
			<div class="col-2 contents"><button type="button" class="update-delete-btn" onclick="window.open('updelStaff/' + ${list.staffVO.staffNo}, 'child', 'width=1370, height=700, resizable=no');">수정/삭제</button></div>
	  </c:forEach>
	</div>
	</div>
	
</body>
</html>