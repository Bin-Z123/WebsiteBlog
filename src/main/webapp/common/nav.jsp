<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container-fluid">

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					<c:url var="trangchu" value="/TrangTinTuc"></c:url>
					aria-current="page" href="${trangchu }">Trang Chủ</a></li>
				<li class="nav-item"><a class="nav-link active"
					<c:url var="vanhoa" value="/trangvanhoa?categoryId=1"></c:url>
					aria-current="page" href="${vanhoa }">Văn Hóa</a></li>
				<li class="nav-item"><a class="nav-link active"
					<c:url var="phapluat" value="/trangphapluat?categoryId=2"></c:url>
					aria-current="page" href="${phapluat }">Pháp Luật</a></li>

				<li class="nav-item"><a class="nav-link active"
					<c:url var="thethao" value="/trangthethao?categoryId=3"></c:url>
					aria-current="page" href="${thethao }">Thể Thao</a></li>
					<li class="nav-item"><a class="nav-link active"
						<c:url var="quantri" value="/LoginServlet"></c:url>
						aria-current="page" href="${quantri }">Quản Trị</a></li>
			</ul>
			<form class="d-flex">
				
			</form>
		</div>
	</div>
</nav>