<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Modal -->
<c:url var="del" value="/TrangAdminServlet/delete"></c:url>
<form action="${del }" method="post">
	<div class="modal fade" id="delete${news[4]}" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5 text-danger" id="staticBackdropLabel">Cảnh
						Báo</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<label class="text text-danger">Bạn Thực Sự Muốn Xóa Tin
						Này</label> <label class="text text-danger">ID: ${news[4] }</label> <input
						type="hidden" name="iddel" value="${news[4] }">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-toggle="modal" data-bs-target="#update${news[4] }">Không</button>
					<button type="submit" class="btn btn-danger">Xác Nhận Xóa</button>
				</div>
			</div>
		</div>
	</div>
</form>