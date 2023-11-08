<%@page import="DAO.MaterialDao"%>
<%@page import="DTO.Material"%>
<%@page import="java.util.List"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <link href="css/tiny-slider.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <!--<link href="scss/style.css" rel="stylesheet" type="text/css"/>-->
        <link href="css/BookingCageFormStyle.css" rel="stylesheet" type="text/css"/>
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <header>
            <c:choose>
                <c:when test="${account.getRole() == 1}">
                    <jsp:include page="headerUser.jsp"></jsp:include>
                </c:when>
                <c:otherwise>
                    <jsp:include page="headerGuest.jsp"></jsp:include>
                </c:otherwise>
            </c:choose>
        </header>
        <div class="booking-custom-cage-form container">
            <div class="booking-custom-cage-main">
                <form action="MainController" method="POST">
                    <div class="update-bird-heading-form">
                        <h1>Custom Cage Booking Form</h1>
                    </div>
                    <input type="hidden" name="cusId" value="${not empty account ? account.getId() : ''}">
                    <div class="form-group">
                        <label>Họ tên :</label><br>
                        <input type="text" id="inputName" value="${not empty account ? account.getName() : ''}" 
                               name="cusName" class="form-control input-form" readonly="" required="">                      
                    </div>
                    <div class="form-group">
                        <label>Email :</label><br>
                        <input type="text" value="${not empty account ? account.getEmail() : ''}" 
                               name="email" class="form-control input-form"  readonly="" required="" >
                    </div>
                    <div class="form-group">
                        <label>Số điện thoại :</label><br>
                        <input type="tel" value="${not empty account ? account.getPhone() : ''}"
                               name="phone" class="form-control input-form"  readonly="" required="" pattern="[0-9]{10}" placeholder="123-456-7890"> 
                    </div>
                    <div class="form-group">
                        <label>Màu sắc :</label> 
                        <select name="color" id="color" onchange="showInputColor()" oninput="calculateTotal()">
                            <option>Đen</option>
                            <option>Đỏ</option>
                            <option>Xanh Dương</option>
                            <option>Xanh Lá</option>
                            <option>Hồng</option>
                            <option>Khác</option>
                        </select>
                        <div id="InputColor" style="display: none">                         
                            <input type="text" class="form-control" name="customColor" value="" placeholder="Nhập màu bạn mong muốn">
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Kích thước :</label> 
                        <select name="size" id="size" onchange="showInputSize()" oninput="calculateTotal()">
                            <option>Nhỏ (Dài, rộng, cao khoảng 18 inch (45cm) hoặc nhỏ hơn)</option>
                            <option>Trung bình (Dài, rộng, cao khoảng 24 đến 36 inch (61 đến 91 cm)</option>
                            <option>Lớn (Dài, rộng, cao khoảng 36 inch đổ lên(91cm đổ lên)</option>
                            <option>Khác</option>
                        </select>
                        <div id="inputSize" style="display: none">
                            <input type="text" class="form-control" name="customSize" value="" placeholder="hãy viết theo dạng Dài: , rộng: , cao: ">
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Loại chim :</label> 
                        <select name="birdType" id="bird" onchange="showInputBird()" oninput="calculateTotal()">
                            <option>Chào mào</option>
                            <option>Sơn ca</option>
                            <option>Cu gáy</option>
                            <option>Khác</option>
                        </select>
                        <div id="inputBirdType" style="display: none">
                            <input type="text" class="form-control" name="customBirdType" value="" placeholder="Nhập loài chim của bạn">
                        </div> 
                    </div>
                    <div class="form-group">
                        <label>Số lượng :</label> 
                        <div>
                            <input type="number" id="quantity" name="quantity" class="form-control" value="" placeholder="Nhập Số lượng" oninput="calculateTotal()" required="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Chất liệu lồng chim :</label> 
                        <select name="material" id="material" onchange="showInputMaterial()" oninput="calculateTotal()">
                            <%
                                MaterialDao mtDao = new MaterialDao();
                                List<Material> list = mtDao.listMaterials();
                                for (Material mt : list) {
                            %>
                            <option id="material" value="<%= mt.getId()%>" price="<%= mt.getPrice()%>"><%= mt.getName()%></option>
                            <%
                                }
                            %>

                        </select>
                        <div id="inputMaterial" style="display: none">
                            <input type="text" step="0.01" min="0" class="form-control" name="customMaterial" value="" placeholder="Nhập chất liệu mà bạn muốn">
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Địa chỉ:</label> 
                        <div>
                            <input type="text" name="address" class="form-control" value="" 
                                   placeholder="Tỉnh/ Thành phố, Quận/Huyện, Phường/Xã, Đường" required="">
                        </div>
                    </div>   
                    <div class="form-group">
                        <label >Hình ảnh lồng(Nếu có) :</label>
                        <button type="button"onclick="document.getElementById('input-img2').click()">Upload</button>
                        <div>
                            <label for="input-img2" class="preview">
                                <img class="tournament-img" id="previewImg2" src="${requestScope.bird.getBirdPhoto()}">
                            </label>
                            <input type="file" hidden id="input-img2" name="image" />
                        </div>
                    </div> 
                    <div class="form-group">
                        <h5 id="textTotal">
                            <div id="total"></div>
                            <input type="hidden" name="subtotal" id="subtotal">
                            <input type="hidden" name="status" id="status"> 
                        </h5>                                        
                        <h5><font style="color: red">(Lưu ý đây mới là giá nguyên liệu, chưa bao gồm các phụ phí khác như tiền gia công,....)</h5>
                    </div>
                    <div class="btn-update-bird">
                        <c:choose>
                            <c:when test="${sessionScope.account != null}">
                                <button type="submit" class="btn btn-primary" name="action" value="BOOKING">Gửi</button>
                            </c:when>
                            <c:otherwise>
                                <h5>Bạn cần phải đăng nhập trước.</h5>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </form>
                <h5>${msg}</h5>
                <div style="color: red; font-size: 20px;">${mess}</div>
            </div>
        </div>
    </body>
    <script>

        const fileInput2 = document.getElementById('input-img2');
        const previewImg2 = document.getElementById('previewImg2');
        fileInput2.addEventListener('change', function () {
            if (fileInput2.files && fileInput2.files[0]) {
                const reader = new FileReader();
                reader.addEventListener('load', function (e) {
                    previewImg2.src = e.target.result;
                });
                reader.readAsDataURL(fileInput2.files[0]);
            }
        });

        function calculateTotal() {
            var color = document.getElementById('color').value;
            var quantity = parseFloat(document.getElementById('quantity').value) || 0;
            var size = document.getElementById('size').value;
            var materialSelectOption = document.getElementById('material').options[document.getElementById('material').selectedIndex];
            var materialPrice = parseInt(materialSelectOption.getAttribute('price'));
            var status = document.getElementById('status');
            var colorPrice = color === "Khác" ? 20.000 : 10.000;
            var sizePrice = size.includes("Nhỏ") ? 1 : size.includes("Trung bình") ? 2 : size.includes("Lớn") ? 3 : 3;
            var birdTypePrice = 10.000;
            var total = document.getElementById('total');
            var phiGiacong = 200.000;
            var totalPrice = (colorPrice + birdTypePrice + (materialPrice * 1.000)) * sizePrice * quantity + phiGiacong;
            var formStatus = parseInt(status.value);
            var text = "";
            if (size === "Khác") {
                text += ", tiền kích thước";
            }
            if (materialPrice === 0) {
                text += ", tiền vật liệu";
            }
            if (text !== "") {
                text += " sẽ được cộng sau";
                formStatus = 0;
            } else {
                formStatus = 1;
            }
            status.value = formStatus;
            document.getElementById('subtotal').value
            total.innerHTML = 'Giá dự kiến: ' + totalPrice.toFixed(3) + " VND" + text;
            document.getElementById('subtotal').value = totalPrice.toFixed(3) + text;
        }


        function showInputColor() {
            const color = document.getElementById('color');
            const inputColor = document.getElementById('InputColor');
            if (color.value === 'Khác') {
                inputColor.style.display = 'block';
            } else {
                inputColor.style.display = 'none';
            }
        }

        function showInputSize() {
            const size = document.getElementById('size');
            const inputSize = document.getElementById('inputSize');
            if (size.value === "Khác") {
                inputSize.style.display = 'block';
            } else {
                inputSize.style.display = 'none';
            }
        }

        function showInputBird() {
            const bird = document.getElementById('bird');
            const inputBirdType = document.getElementById('inputBirdType');
            if (bird.value === 'Khác') {
                inputBirdType.style.display = 'block';
            } else {
                inputBirdType.style.display = 'none';
            }
        }

        function showInputMaterial() {
            const material = document.getElementById('material');
            const inputMaterial = document.getElementById('inputMaterial');
            if (parseInt(material.value) === 4) {
                inputMaterial.style.display = 'block';
            } else {
                inputMaterial.style.display = 'none';
            }
        }      
    </script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/tiny-slider.js"></script>
    <script src="js/custom.js"></script>
</html>
