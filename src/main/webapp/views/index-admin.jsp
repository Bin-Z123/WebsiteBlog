<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<!-- <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous"> -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

<c:url var="chuyen" value="/TrangAdminServlet"></c:url>
<title>Trang ADMIN</title>
<style>
header {
	height: 120px;
	text-align: center;
}

main {
	background-color: white;
}

.nav-item>a {
	font-size: 20px;
}

nav {
	background-color: rgb(142, 198, 250);
}

.box {
	min-height: 200px;
	border-radius: 30px;
}

.box1 {
	background-color: #118AB2;
}

.text1 {
	color: #F78C6B;
}

.box2 {
	background-color: #FFD166;
}

.text2 {
	color: #06D6A0;
}

.box3 {
	background-color: #EF476F;
}

.text3 {
	color: #073B4C;
}

.box4 {
	background-color: #06D6A0;
}

.text4 {
	color: #FFD166;
}

.text {
	font-weight: bold;
	font-size: 20px;
}

.sl {
	color: white;
	font-weight: bold;
	font-size: 35px;
}
</style>
</head>
<body>
	<c:set value="${data }" var="newsList" scope="request" />
	<c:set value="${listAllUser }" var="usersList" scope="request" />
	<c:set value="${listAllCate }" var="cateList" scope="request" />
	<%@include file="/common/header-admin.jsp"%>
	<main>
		<%@include file="/common/nav-admin.jsp"%>
		<div class="container-fluid">
			<div class="row row-cols-4 gy-3">
				<div class="col">
					<div class="box box1">
						<div class="sl p-4 pb-0">${count }</div>
						<div class="text text1 p-4 pt-0">TẤT CẢ TIN</div>
						<div>
							<i
								class="fa-solid fa-earth-asia fa-2xl d-flex justify-content-center align-items-center p-3"></i>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="box box2">
						<div class="sl p-4 pb-0">${countVanHoa }</div>
						<div class="text text2 p-4 pt-0">TIN VĂN HÓA</div>
						<div>
							<i
								class="fa-solid fa-hippo fa-2xl d-flex justify-content-center align-items-center p-3"></i>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="box box3">
						<div class="sl p-4 pb-0">${countPhapLuat }</div>
						<div class="text text3 p-4 pt-0">TIN PHÁP LUẬT</div>
						<div>
							<i
								class="fa-solid fa-scale-balanced fa-2xl d-flex justify-content-center align-items-center p-3"></i>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="box box4">
						<div class="sl p-4 pb-0">${countTheThao }</div>
						<div class="text text4 p-4 pt-0">TIN THỂ THAO</div>
						<div>
							<i
								class="fa-solid fa-football fa-2xl d-flex justify-content-center align-items-center p-3"></i>
						</div>
					</div>
				</div>

			</div>
			<div class="row row-cols-1 mt-4">
				<div class="col-12 text-end">
					<!--TIN TỨC -->
					<c:if test="${not empty newsList }">
						<button type="button" class="btn btn-outline-success"
							data-bs-toggle="modal" data-bs-target="#insert">Tạo Tin
							Mới</button>
					</c:if>
					<!-- NGƯỜI DÙNG -->
					<c:if test="${not empty usersList }">
						<button type="button" class="btn btn-outline-success"
							data-bs-toggle="modal" data-bs-target="#">Tạo Người Dùng
							Mới</button>
					</c:if>
					<!-- DANH MỤC -->
					<c:if test="${not empty cateList }">
						<button type="button" class="btn btn-outline-success"
							data-bs-toggle="modal" data-bs-target="#">Tạo Loại Tin
							Mới</button>
					</c:if>
				</div>

			</div>
			<%@include file="/common/popup-insert.jsp"%>
			<!-- table -->
			<h1>${tin }</h1>
			<div class="container-fluid overflow-auto mb-5" style="height: 500px">

				<table class="table table-striped table-hover table-light">

					<thead>
						<tr class="table-dark sticky-top">
							<!--TIN TỨC -->
							<c:if test="${not empty newsList }">
								<th scope="col">STT</th>
								<th scope="col">ID</th>
								<th scope="col">Tiêu Đề</th>
								<th scope="col">Loại Tin</th>
								<th scope="col">Ngày Đăng</th>
								<th scope="col">Tác Giả</th>
								<th scope="col">Trạng Thái</th>
								<th scope="col">Chỉnh Sửa</th>
							</c:if>
							<!-- NGƯỜI DÙNG -->
							<c:if test="${not empty usersList }">
								<th scope="col">STT</th>
								<th scope="col">ID</th>
								<th scope="col">Tên Người Dùng</th>
								<th scope="col">Tên Tài Khoản</th>
								<th scope="col">SDT</th>
								<th scope="col">Vai Trò</th>
								<th scope="col">Chỉnh Sửa</th>
							</c:if>
							<!-- DANH MỤC -->
							<c:if test="${not empty cateList }">
								<th scope="col">STT</th>
								<th scope="col">ID</th>
								<th scope="col">Tên Danh Mục</th>
							</c:if>
						</tr>
					</thead>


					<tbody>
						<!-- TRANG TIN TỨC -->
						<c:if test="${not empty newsList }">
							<c:forEach var="news" items="${data }" varStatus="vs">
								<tr>
									<th scope="row">${vs.count }</th>
									<td>${news[4]}</td>
									<td style="font-weight: bold; width: 35%">${news[0]}</td>
									<td>${news[1]}</td>
									<td>${news[2] }</td>
									<td>${news[3] }</td>
									<td>${news[10] == true ? "Hiện" : "Ẩn" }</td>
									<td style="width: 15%">
										<button type="button" class="btn btn-outline-primary"
											data-bs-toggle="modal" data-bs-target="#update${news[4] }">Chỉnh
											Sửa</button> <span> </span>
										<button data-bs-toggle="modal"
											data-bs-target="#delete${news[4] }" type="button"
											class="btn btn-outline-danger">Xóa</button>
									</td>
									<!--Popup xác nhận xóa  -->
									<%@ include file="/common/alert-delete.jsp"%>
									<!--Popup Chỉnh sửa Tin  -->
									<%@include file="/common/popup-update.jsp"%>
								</tr>
							</c:forEach>
						</c:if>
						<!-- NGƯỜI DÙNG -->
						<c:if test="${not empty usersList }">
							<c:forEach var="user" items="${usersList }" varStatus="vs">
								<tr>
									<th scope="row">${vs.count }</th>
									<td>${user.id }</td>
									<td>${user.fullname }</td>
									<td>${user.username }</td>
									<td>0${user.phone }</td>
									<td>${user.role == true ? "Admin" : "Phóng Viên" }</td>
									<td><button type="button" class="btn btn-outline-primary"
											data-bs-toggle="modal" data-bs-target="#s${user.id }">Chỉnh
											Sửa</button></td>
								</tr>
							</c:forEach>
						</c:if>
						<!-- DANH MỤC -->
						<c:if test="${not empty cateList }">
							<c:forEach var="cate" items="${cateList }" varStatus="vs">
								<tr>
									<th scope="row">${vs.count }</th>
									<td>${cate.id }</td>
									<td>${cate.name }</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>

			</div>
		</div>
		<div class="toast-container position-fixed bottom-0 end-0 p-3">
			<div id="liveToast" class="toast" role="alert" aria-live="assertive"
				aria-atomic="true">
				<div class="toast-header">
					<strong
						class="me-auto">Thông Báo</strong> <small>Bây Giờ</small>
					<button type="button" class="btn-close" data-bs-dismiss="toast"
						aria-label="Close"></button>
				</div>
				<div class="toast-body">
					${toastMessage}
					<!-- Hiển thị thông báo từ Servlet -->
				</div>
			</div>
		</div>
		<script>
			var toastMessage = "${toastMessage}"; // Lấy giá trị từ server
			var toastLiveExample = document.getElementById('liveToast');

			if (toastMessage !== "") { // Nếu có giá trị trong toastMessage, tự động hiển thị
				const toastBootstrap = bootstrap.Toast
						.getOrCreateInstance(toastLiveExample);
				toastBootstrap.show();
			}
		</script>
	</main>
	<%@include file="/common/footer-admin.jsp"%>

	<script>
		document.querySelectorAll('input[type="file"]').forEach(
				function(input) {
					input.addEventListener('change', function(event) {
						const file = event.target.files[0]; // Lấy file người dùng chọn
						if (file) {
							const reader = new FileReader();
							reader.onload = function(e) {
								// Lấy giá trị từ thuộc tính data-target của input
								const targetId = input
										.getAttribute('data-target');
								const previewImage = document
										.getElementById(targetId); // Sử dụng id từ data-target để tìm thẻ img
								if (previewImage) {
									previewImage.src = e.target.result; // Cập nhật ảnh src cho thẻ img
									previewImage.style.display = 'block'; // Hiển thị thẻ img
								}
							}
							reader.readAsDataURL(file); // Đọc file dưới dạng URL
						}
					});
				});
	</script>
	<script>
		document.getElementById('ipphoto-insert').addEventListener(
				'change',
				function(event) {
					const file = event.target.files[0]; // Lấy file người dùng chọn
					if (file) {
						const reader = new FileReader();
						reader.onload = function(e) {
							const previewImage = document
									.getElementById('outimg-insert');
							previewImage.src = e.target.result; // Cập nhật ảnh src cho thẻ img
							previewImage.style.display = 'block'; // Hiển thị thẻ img
						}
						reader.readAsDataURL(file); // Đọc file dưới dạng URL
					}
				});
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
		integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
		crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/87bc9fd7a7.js"
		crossorigin="anonymous"></script>

</body>
</html>