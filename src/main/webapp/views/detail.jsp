<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<!-- <link rel="stylesheet" href="/css/trangchu.css"> -->

<style>
.left {
	background-color: rgb(230, 230, 230);
	min-height: 500px;
	display: inline-block;
	align-items: flex-start;
}

.right {
	background-color: white;
	min-height: 500px;
}

/* nav {
            height: 50px;
            text-align: center;
            background-color: black;
        } */
header {
	height: 120px;
	text-align: center;
}

footer {
	height: 180px;
	background-color: black;
}

div>a>img {
	width: 200px;
}

.bantin {
	display: flex;
	align-items: flex-start;
}

.bantin>div>a {
	text-decoration: none;
	font-weight: bold;
	font-size: 18px;
	color: black;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	max-width: 350px;
	display: inline-block;
}

.bantin>div>span {
	/* white-space: nowrap; */
	overflow: hidden;
	text-overflow: ellipsis;
}

.left>div>span {
	line-height: 1.6;
	margin: 0;
	text-align: justify;
}

.left>img {
	width: 1000px;
	margin-right: 15px;
}

main {
	background-color: white;
}

.box {
	max-width: 100%;
	background-color: gainsboro;
	border-radius: 30px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Header -->
	<%@include file="/common/header.jsp"%>
	<!-- NAV -->
	<%@include file="/common/nav.jsp"%>
	<!-- Main -->
	<main>
		<div class="container">
			<div class="row">
				<div class="box col-12">
				<i>Ngày Đăng: ${newsDetail.postedDate }</i>
				<span> | </span>
				<i>Lượt xem: ${newsDetail.viewCount } </i>
				
					<h1 align="center">${newsDetail.title }</h1>
					<c:url var="img" value="/images/${newsDetail.image }" ></c:url>
					<img alt="" src="${img }"
						style="width: 900px; margin-left: 198px;">
						<div>${newsDetail.content }</div>
				</div>

			</div>
			<div class="row">
				<div class="box col-12">
					
					
				</div>

			</div>
		</div>
	</main>
	<%@include file="/common/footer.jsp" %>
</body>
</html>