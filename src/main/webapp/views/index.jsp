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
	width: 1090px;
	border-radius: 30px;
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
	display: inline-block;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	width: 350px;
	white-space: nowrap;
}

.left>div>span {
	line-height: 1.6;
	margin: 0;
	text-align: justify;
}

.left>a>img {
	width: 1000px;
	margin-right: 15px;
}

main {
	background-color: white;
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
	<!-- MAIN -->
	<main>
		<!-- Trang Chi Tiet -->
		<div class="con">
			<div class="row g-0 mx-5">
				<div class="col-8 mx-0">
					<div class="box left px-5"
						style="background-color: rgb(228, 228, 228);">
						<h1>${tin }</h1>
						<c:url var="img" value="/images/${top1News.image }"></c:url>
						<a href="/ASSIGNMENT_JAVA3/trangchitiet?id=${top1News.id }"><img
							src="${img }" class="rounded block-start" alt="..."></a>
						<h2>${top1News.title }</h2>
						<p>${top1News.content }</p>
						<%-- <span>${content }</span> --%>

					</div>
				</div>

				<!-- Trang Tin -->
				<div class="col-4">
					<div class="box right">
						<div class="accordion" id="accordionExample">
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingOne">
									<button class="accordion-button" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseOne"
										aria-expanded="true" aria-controls="collapseOne">Bản
										Tin Được Xem Nhiều</button>
								</h2>
								<div id="collapseOne" class="accordion-collapse collapse show"
									aria-labelledby="headingOne" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										<!--Cac Ban Tin -->
										<!-- Bantin1 -->
										<c:forEach var="News" items="${top5News}">
											<c:if test="${News.home == true }">
											<div class="bantin">
												<c:url var="img1" value="/images/${News.image }"></c:url>
												<a href="/ASSIGNMENT_JAVA3/trangchitiet?id=${News.id }"><img
													src="${img1 }" class="rounded block-start" alt="..."
													style="margin-right: 10px;"></a>
												<div>
													<a href="/ASSIGNMENT_JAVA3/trangchitiet">${News.title }</a><br>
													<span class="noidungtin">${News.content }</span> <br>
													<span><i>${News.postedDate }</i></span>
													<span><i>Lượt xem: ${News.viewCount }</i></span>
												</div>
											</div>
											<hr>
											</c:if>
										</c:forEach>

										<!-- Bantin2 -->

									</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingTwo">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseTwo"
										aria-expanded="false" aria-controls="collapseTwo">
										Bản Tin Mới Nhất</button>
								</h2>
								<div id="collapseTwo" class="accordion-collapse collapse"
									aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										<c:forEach var="News" items="${top5NewsNew}">
											<div class="bantin">
												<c:url var="img1" value="/images/${News.image }"></c:url>
												<a href="/ASSIGNMENT_JAVA3/trangchitiet?id=${News.id }"><img
													src="${img1 }" class="rounded block-start" alt="..."
													style="margin-right: 10px;"></a>
												<div>
													<a href="/ASSIGNMENT_JAVA3/trangchitiet">${News.title }</a><br>
													<span class="noidungtin">${News.content }</span> <br>
													<span><i>${News.postedDate }</i></span>
													<span><i>Lượt xem: ${News.viewCount }</i></span>
												</div>
											</div>
											<hr>
										</c:forEach>
									</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingThree">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseThree"
										aria-expanded="false" aria-controls="collapseThree">
										Bản Tin Đã Xem</button>
								</h2>
								<div id="collapseThree" class="accordion-collapse collapse"
									aria-labelledby="headingThree"
									data-bs-parent="#accordionExample">
									<div class="accordion-body">
										Bản Tin A
										<hr>
										Bản Tin B
										<hr>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<!-- Footer -->
	<%@include file="/common/footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>