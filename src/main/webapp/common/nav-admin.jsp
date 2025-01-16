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
					<c:url var="tintuc" value="/TrangAdminServlet/tintuc"></c:url>
					aria-current="page" href="${tintuc }" >Tin Tức</a></li>
				<li class="nav-item"><a class="nav-link active"
					<c:url var="loaitin" value="/loaitin"></c:url>
					aria-current="page" href="${loaitinz }">Loại Tin</a></li>

				<li class="nav-item"><a class="nav-link active  ${users.role == true ? 'visible' : 'invisible' }"
					<c:url var="nguoidung" value="/TrangAdminServlet/nguoidung"></c:url>
					aria-current="page" href="${nguoidung }">Người Dùng</a></li>
					
				<li class="nav-item"><a class="nav-link active  ${users.role == true ? 'visible' : 'invisible' }"
					<c:url var="danhmuc" value="/TrangAdminServlet/danhmuc"></c:url>
					aria-current="page" href="${danhmuc }">Danh Mục</a></li>
			</ul>
			<form class="d-flex">

			</form>
		</div>
	</div>
</nav>