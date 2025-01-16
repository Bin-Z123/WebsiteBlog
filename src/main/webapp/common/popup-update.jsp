<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- <button type="button" class="btn btn-primary" data-bs-toggle="modal"
	data-bs-target="#update" data-bs-whatever="@mdo">Chỉnh Sửa</button> -->
<c:url var="up" value="/TrangAdminServlet/update"></c:url>
<form action="${up }" method="post" enctype="multipart/form-data">
	<div class="modal fade" id="update${news[4] }" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true"
		data-bs-backdrop="static">
		<div class="modal-dialog  modal-dialog-centered"
			style="max-width: 1500px;">
			<div class="modal-content" style="height: auto;">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">Tin Chi
						Tiết | ID: ${news[4] }</h1>
					<input type="hidden" name="idup" value="${news[4] }">
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
												type="text" name="title" value="${news[0] }"
												class="form-control" id="title" aria-describedby="emailHelp">
												<div>${errorTitle }</div>
										</div>
									</div>
									<div class="row">
										<div class="mb-3">
											<label for="category" class="form-label">Loại tin</label> <select
												class="form-select" name="category"
												aria-label="Default select example">
												<c:forEach var="cate" items="${listCate}">
													<option ${news[1]==cate.name?"selected":" "}
														value="${cate.id }">${cate.name}</option>
												</c:forEach>


											</select>
										</div>
									</div>
									<div class="row">
										<div class="mb-3">
											<label for="author" class="form-label">Người đăng</label> <input
												type="text" class="form-control" id="author"
												aria-describedby="emailHelp" value="${news[3] }" disabled>
										</div>
									</div>
									<div class="row">
										<div class="mb-3">
											<label for="date" class="form-label">Ngày đăng</label> <input
												type="text" class="form-control" id="date"
												aria-describedby="emailHelp" value="${news[2] }" disabled>
										</div>
									</div>
									<div class="row">
										<div class="mb-3">
											<label for="views" class="form-label">Lượt Xem</label> <input
												disabled type="number" class="form-control"
												id="exampleInputEmail1" aria-describedby="views"
												value="${news[5] }">
										</div>
									</div>
									<div class="row">
										<div class="mb-3">
											<label class="form-label">Trạng Thái Tin</label><br>
											<div class="form-check form-check-inline">
												<input id="hien"class="form-check-input" type="radio" name="home"
													value="true" ${news[10]=='true'?'checked':''}> <label
													class="form-check-label" for="hien">Hiện tin lên trang độc giả</label>
											</div>
											<div class="form-check form-check-inline">
												<input id="an" class="form-check-input" type="radio" name="home"
													value="false" ${news[10]=='false'?'checked':''}>
												<label class="form-check-label" for="an">Ẩn tin khỏi trang độc giả</label>
											</div>
										</div>
									</div>


								</div>
							</div>
							<div class="col-5">
								<div class="box" style="min-height: 50px; width: auto;">
									<div class="row">
										<div class="mb-3">

											<label for="exampleInputEmail1" class="form-label">Hình
												ảnh</label> <input id="ipphoto${vs.count }" name="photo" type="file"
												data-target="outimg${vs.count }">
											<c:url var="imgUpdate" value="/images/${news[7] }"></c:url>
											<img id="outimg${vs.count }" name="imgup" src="${imgUpdate }"
												class="img-fluid" alt="..."> <input type="hidden"
												id="imgSrc" name="imgSrc" value="${news[7]}" />
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
								<textarea name="content" class="form-control" id="content"
									rows="5">${news[6] }</textarea>
							</div>
						</div>
					</div>

				</div>
				<div class="modal-footer">
					<div class="container-fluid">
						<div class="row row-cols-2">
							<div class="col-6">
								<div class="footer">
									<button data-bs-toggle="modal"
										data-bs-target="#delete${news[4] }" type="button"
										class="btn btn-outline-danger">Xóa</button>
								</div>
							</div>
							<div class="col-6 text-end">
								<div class="footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">Thoát</button>
									<button type="submit" class="btn btn-primary">Xác Nhận
										Sửa</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>