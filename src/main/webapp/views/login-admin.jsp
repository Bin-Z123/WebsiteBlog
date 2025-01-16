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
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
</style>
</head>
<body>
	<c:url value="/images/header.png" var="imgHeader"></c:url>
	<img src="${imgHeader }" alt="Background Image"
		style="width: 100%; height: 100%; position: absolute; z-index: -1000; display: flex">

	<section class="vh-100">
		<div class="container py-5 h-100">
			<div
				class="row d-flex align-items-center justify-content-center h-100">
				<div class="col-md-8 col-lg-7 col-xl-6">
					<img
						src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.svg"
						class="img-fluid" alt="Phone image">
				</div>
				<div class="col-md-7 col-lg-5 col-xl-5 offset-xl-1">
					<c:url var="login" value="/admin/login"></c:url>
					<form action="${login }" method="post">
						<!-- Email input -->
						<div data-mdb-input-init class="form-outline mb-4">
						<div class="text text-danger">${error }</div>
							<input name="username" value="${username }"
								placeholder="Nhập Username" type="text" id="form1Example13"
								class="form-control form-control-lg" /> <label
								class="form-label" for="form1Example13">Username</label>
						</div>

						<!-- Password input -->
						<div data-mdb-input-init class="form-outline mb-4">
							<input name="password" value="${password }" type="password"
								id="form1Example23" class="form-control form-control-lg"
								placeholder="Nhập Password" /> <label class="form-label"
								for="form1Example23">Password</label>
						</div>

						<div class="d-flex justify-content-around align-items-center mb-4">
							<!-- Checkbox -->
							<div class="form-check">
								<input class="form-check-input" type="checkbox"
									name="remember-me" value="" id="form1Example3" checked /> <label
									class="form-check-label" for="form1Example3"> Nhớ tôi </label>
							</div>
							<a href="#!">Quên mật khẩu?</a>
						</div>

						<!-- Submit button -->
						<c:url var="trangchu" value="/TrangAdminServlet"></c:url>
						<button type="submit" data-mdb-button-init data-mdb-ripple-init
							class="btn btn-primary btn-lg btn-block">Đăng nhập</button>
						

					</form>
				</div>
			</div>
		</div>
	</section>
</body>
</html>