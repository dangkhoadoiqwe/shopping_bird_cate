<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <link href="css/tiny-slider.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link href="scss/style.css" rel="stylesheet" type="text/css"/>
        <link href="css/BookingCageFormStyle.css" rel="stylesheet" type="text/css"/>
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <header>
            <%@include file="headerGuest.jsp"%>
        </header>
        <div class="booking-custom-cage-form container">
            <div class="booking-custom-cage-main">
                <form action="" method="POST">
                    <div class="update-bird-heading-form">
                        <h1>Custom Cage Booking Form</h1>
                    </div>
                    <input type="hidden" name="accID" class="form-control" value="${requestScope.account.getAccountID()}"/>
                    <input type="hidden" name="birdID" class="form-control" value="${requestScope.birdID}"/>
                    <div class="form-group">
                        <label>Họ tên :</label><br>
                        <input type="text" value="${requestScope.bird.getBirdName()}" name="bName" class="form-control input-form">                      
                    </div>
                    <div class="form-group">
                        <label>Email :</label><br>
                        <input type="text" value="${requestScope.bird.getHeight()}" name="bHeight" class="form-control input-form" >
                    </div>
                    <div class="form-group">
                        <label>Số điện thoại :</label><br>
                        <input type="text" value="${requestScope.bird.getWeight()}" name="bWeight" class="form-control input-form" > 
                    </div>
                    <div class="form-group">
                        <label>Màu sắc :</label> 
                        <select name="color" id="color" onchange="showInputColor()">
                            <option>Đen</option>
                            <option>Đỏ</option>
                            <option>Xanh Dương</option>
                            <option>Xanh Lá</option>
                            <option>Hồng</option>
                            <option>Khác</option>
                        </select>
                        <div id="InputColor" style="display: none">
                            <input type="text" class="form-control" name="color" value="" placeholder="Nhập màu bạn mong muốn">
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Kích thước :</label> 
                        <select name="size" id="size" onchange="showInputSize()">
                            <option>Nhỏ (Chiều dài, chiều rộng và chiều cao khoảng 18 inch (45 cm) hoặc nhỏ hơn)</option>
                            <option>Trung bình (Thường từ 24 đến 36 inch (61 đến 91 cm) chiều dài, chiều rộng và chiều cao  )</option>
                            <option>Lớn (Thường là 36 inch (91 cm) trở lên chiều dài, chiều rộng và chiều cao)</option>
                            <option>Khác</option>
                        </select>
                        <div id="inputSize" style="display: none">
                            <input type="text" class="form-control" name="color" value="" placeholder="Nhập kích thước bạn mong muốn">
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Loại chim :</label> 
                        <select name="bird" id="bird" onchange="showInputBird()">
                            <option>Chào mào</option>
                            <option>Sơn ca</option>
                            <option>Cu gáy</option>
                            <option>Khác</option>
                        </select>
                        <div id="inputBirdType" style="display: none">
                            <input type="text" class="form-control" name="color" value="" placeholder="Nhập loài chim của bạn">
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Số lượng :</label> 
                        <div>
                            <input type="number" class="form-control" value="" placeholder="Nhập Số lượng">
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Chất liệu lồng chim :</label> 
                        <select name="material" id="material" onchange="showInputMaterial()">
                            <option>Gỗ</option>
                            <option>Sắt</option>
                            <option>Tre</option>
                            <option>Khác</option>
                        </select>
                        <div id="inputMaterial" style="display: none">
                            <input type="text" class="form-control" name="color" value="" placeholder="Nhập chất liệu mà bạn muốn">
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Địa chỉ:</label> 
                        <div>
                            <input type="text" class="form-control" value="" placeholder="Tỉnh/ Thành phố, Quận/Huyện, Phường/Xã, Đường">
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
                        <!--<label>Thành tiền(Chưa bao gồm tiền gia công,...):</label>-->
                        <h4>Thành tiền: 600.000 vnd</h4>
                        <h5><font style="color: red">(Lưu ý đây mới là giá nguyên liệu, chưa bao gồm các phụ phí khác như tiền gia công,....)</h5>
                    </div>
                    <div class=" btn-update-bird">
                        <button type="submit" class="btn btn-primary" name="" value="UPDATE_BIRD">Gửi</button>
                    </div>
                </form>
                <div style="color: red; font-size: 20px;">${mess}</div>
            </div>
        </div>
    </body>
    <script> const fileInput2 = document.getElementById('input-img2');
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

        function showInputColor() {
            const color = document.getElementById('color');
            const inputColor = document.getElementById('InputColor');
            if (color.value === 'Khác') {
                inputColor.style.display = 'block';
            } else {
                inputColor.style.display = 'none';
            }
        }
        ;

        function showInputSize() {
            const size = document.getElementById('size');
            const inputSize = document.getElementById('inputSize');
            if (size.value === 'Khác') {
                inputSize.style.display = 'block';
            } else {
                inputSize.style.display = 'none';
            }
        }
        ;
        function showInputBird() {
            const bird = document.getElementById('bird');
            const inputBirdType = document.getElementById('inputBirdType');
            if (bird.value === 'Khác') {
                inputBirdType.style.display = 'block';
            } else {
                inputBirdType.style.display = 'none';
            }
        }
        ;

        function showInputMaterial() {
            const material = document.getElementById('material');
            const inputMaterial = document.getElementById('inputMaterial');
            if (material.value === 'Khác') {
                inputMaterial.style.display = 'block';
            } else {
                inputMaterial.style.display = 'none';
            }
        }
        ;
    </script>
</html>
