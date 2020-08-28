<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
			<div class="col-2 contents">${list.staffNo }</div>
			<div class="col-2 contents">${list.staffName }</div>
			<div class="col-2 contents">
				<c:choose>
					<c:when test="${list.gender eq 1 }">
						남
					</c:when>
					<c:otherwise>
						여
					</c:otherwise>
				</c:choose>
			</div>
			<div class="col-2 contents">${list.departmentCode }</div>
			<div class="col-2 contents">
				<fmt:formatDate value="${list.graduateDay }" pattern="yyyy-MM-dd"/>
			</div>
			<div class="col-2 contents"><button type="button" class="update-delete-btn">수정/삭제</button></div>
	  </c:forEach>
	</div>
	</div>
</body>
</html>