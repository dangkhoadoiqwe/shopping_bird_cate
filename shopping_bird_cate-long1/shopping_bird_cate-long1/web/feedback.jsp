<%-- 
    Document   : feedback
    Created on : 27-09-2023, 17:53:34
    Author     : Quang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
          <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel='stylesheet prefetch' href='https://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css'>
        <link href="css/feedback.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    
    </head>
    <body>

        <div class="row">
            <div class="col-6 col-md-6"> <img src="images/product-1.png" class="img-fluid product-thumbnail"></div>
            <div class="col-6 col-md-6">
            <div class="product-content">
                <h2 class="product-title">Lồng chào mào khung gỗ</h2>
                <div class="product-rating">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                    <span>4.7(21)</span>
                </div>

                <div class="product-price">
                  
                    <p class="new-price">Giá: <span>$249.00 (5%)</span></p>
                </div>

                <div class="product-detail">
                    <h2>Mô tả </h2>
                    <p>hình dáng độc đáo</p>
                    <ul>
                        <li>Màu: <span>nâu</span></li>
                        <li>chất liệu <span>gỗ</span></li>
                        <li>loại <span>Chào mào</span></li>
                        <li>hình dáng <span>tròn</span></li>
                        
                    </ul>
                </div>




                <div class="stars">
                    <form action="">
                        <input class="star star-5" id="star-5" type="radio" name="star"/>
                        <label class="star star-5" for="star-5"></label>
                        <input class="star star-4" id="star-4" type="radio" name="star"/>
                        <label class="star star-4" for="star-4"></label>
                        <input class="star star-3" id="star-3" type="radio" name="star"/>
                        <label class="star star-3" for="star-3"></label>
                        <input class="star star-2" id="star-2" type="radio" name="star"/>
                        <label class="star star-2" for="star-2"></label>
                        <input class="star star-1" id="star-1" type="radio" name="star"/>
                        <label class="star star-1" for="star-1"></label>
                    </form>
                </div>
                <section id="feedback">
                    <h2>Đánh giá và phản hồi</h2>
                    <form id="feedback-form">
                        <label for="comment">Phản hồi:</label>
                        <textarea id="comment" name="comment" rows="4" cols="50" required></textarea>
                        <button type="submit">Gửi</button>
                    </form>
                </section>
                 
            </div>
            </div>
        </div>
    </body>
</html>
