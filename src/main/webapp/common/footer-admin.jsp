<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Bootstrap Footer -->
  <div class="container-fluid bg-dark text-light py-4 ">
    <div class="row">
      <!-- Contact Info Section -->
      <div class="col-4">
        <h5>Liên hệ chúng tôi</h5>
        <ul class="list-unstyled">
          <li><i class="bi bi-geo-alt-fill"></i> 123, Bà Điểm, Hóc Môn</li>
          <li><i class="bi bi-envelope-fill"></i> thanhvo201600@gmail.com</li>
          <li><i class="bi bi-telephone-fill"></i> +84 999 665 91</li>
        </ul>
      </div>

      <!-- Useful Links Section -->
      <div class="col-4">
        <h5>Trang thông tin</h5>
        <ul class="list-unstyled">
          <li><a href="#" class="text-light">Về chúng tôi:</a></li>
          <li><a href="#" class="text-light">Chính xác bảo mật:</a></li>
          <li><a href="#" class="text-light">Điều khoản dịch vụ</a></li>
        </ul>
      </div>

      <!-- Newsletter Section -->
      <div class="col-4">
        <h2>Xin Chào ${wellcome }</h2>
        <div>Trang tin tức số 2 hiện nay ID: ${idtable }</div>
        <input name="idtable" value="${idtable }" type="hidden">
        <c:url var="logout" value="/admin/logout"></c:url>
        <div><a href="${logout }">Đăng Xuất</a></div>
      </div>
    </div>
    
    <!-- Copyright Section -->
    <div class="row mt-4">
      <div class="col text-center">
        <p class="mb-0">&copy; 2024 Website tin tức. Tất cả thuộc bản quyền của Anh Bĩn.</p>
      </div>
    </div>
  </div>

<!-- Bootstrap Icons CDN -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.9.1/font/bootstrap-icons.min.css">