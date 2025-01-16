<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:url var="ins" value="/TrangAdminServlet/insert"></c:url>
<form action="${ins }" method="post" enctype="multipart/form-data">
	<div class="modal fade" id="insert" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true"
		data-bs-backdrop="static">
		<div class="modal-dialog  modal-dialog-centered"
			style="max-width: 1500px;">
			<div class="modal-content" style="height: auto;">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">Tạo Tin Mới</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">

					<div class="container-fluid">
						<div class="row row-cols-2">
							<div class="col-7">
								<div class="box" style="min-height: 50px; width: auto;">
									<div class="row">
										<div class="mb-3">
											<!--Title  -->
											<label for="title" class="form-label">Tiêu đề tin</label> <input
												type="text" name="title"
												class="form-control" id="title" aria-describedby="emailHelp">
										</div>
									</div>
									<div class="row">
										<div class="mb-3">
											<label for="category" class="form-label">Loại tin</label> <select
												class="form-select" name="category" aria-label="Default select example">
												<c:forEach var="cate" items="${listCate}">
													<option
														value="${cate.id }">${cate.name}</option>
												</c:forEach>


											</select>
										</div>
									</div>
									<div class="row">
										<div class="mb-3">
											<label for="author" class="form-label">Người đăng</label> <select
												disabled class="form-select" name="author" aria-label="Default select example">
												
													<option value="${idtable }">${fullname }</option>
														



											</select>
										</div>
									</div>
									<div class="row">
										<div class="mb-3">
											<label for="date" class="form-label">Ngày đăng</label> <input
												type="text" class="form-control" id="date"
												aria-describedby="emailHelp" value="${DATE}" disabled>
										</div>
									</div>
									<div class="row">
										<div class="mb-3">
											<label for="views" class="form-label">Lượt Xem</label> <input
												type="number" class="form-control" id="exampleInputEmail1"
												aria-describedby="views" value="0" name="views">
										</div>
									</div>


								</div>
							</div>
							<div class="col-5">
								<div class="box" style="min-height: 50px; width: auto;">
									<div class="row">
										<div class="mb-3">

											<label for="exampleInputEmail1" class="form-label">Hình
												ảnh</label>
												<input id="ipphoto-insert" name="photo" type="file">
											<c:url var="imgInsert" value="/images/${imgName}"></c:url>
											<img id="outimg-insert" name="imgup" src="${imgInsert }" class="img-fluid" alt="...">
											<%--<button type="button" class="btn btn-primary mt-2">Thêm
												ảnh</button> --%>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="mb-3">
								<label for="content" class="form-label">Nội dung tin</label>
								<textarea name="content" class="form-control" id="content" rows="5"></textarea>
							</div>
						</div>
					</div>

				</div>
				<div class="modal-footer">
					<div class="container-fluid">
						<div class="row row-cols-2">
							<div class="col-12 text-end">
								<div class="footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">Thoát</button>
									<button type="submit" class="btn btn-primary">Xác nhận</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>