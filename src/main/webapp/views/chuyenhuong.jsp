<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<c:url var="chuyen" value="/TrangAdminServlet/tintuc"></c:url>
<meta charset="UTF-8" http-equiv="refresh" content="0.8; URL=${chuyen }">
<title>Insert title here</title>
</head>
<body class="text-center mt-5">
	<button class="btn btn-primary"  type="button" disabled>
		<span class="spinner-border spinner-border-sm" aria-hidden="true"></span>
		<span role="status">Loading...</span>
	</button>
</body>
</html>