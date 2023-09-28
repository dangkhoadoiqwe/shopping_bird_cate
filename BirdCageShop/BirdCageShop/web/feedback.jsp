<%-- 
    Document   : feedback
    Created on : 27-09-2023, 17:53:34
    Author     : Quang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
     
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
          <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel='stylesheet prefetch' href='https://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css'>
        <link href="css/feedback.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            /* Styles for the popup container */
.popup-container {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.7);
    z-index: 1000;
    justify-content: center;
    align-items: center;
}

/* Styles for the popup */
.popup {
    background: #fff;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
    max-width: 600px;
    margin: 0 auto;
}

/* Styles for the close button */
.close-popup-button {
    background-color: #ccc;
    border: none;
    padding: 5px 10px;
    margin-top: 10px;
    border-radius: 5px;
    cursor: pointer;
}

.close-popup-button:hover {
    background-color: #999;
}

        </style>
    
    </head>
    <body>
         <header>
            <%@include file="headerGuest.jsp"%>
        </header>
        <div class="row">
            <div class="col-4 col-md-6"> <img src="images/product-1.png" class="img-fluid product-thumbnail"></div>
            <div class="col-6 col-md-6">
            <div class="product-content">
                <h2 class="product-title">OD45345345435</h2>
                <div class="product-rating">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                   
                </div>

                <div class="product-price">
                       <p class="new-price">Lồng chào mào <span>khung gỗ</span></p>
                     <p class="new-price">Số lương: <span>1</span></p>
                    <p class="new-price">Giá: <span>$249.00 (5%)</span></p>
                </div>

                <div class="product-detail">
                   
                    <p>ngày mua : 20/8/2023</p>
                     <p>ngày giao : 15/9/2023</p>
                    <ul>
                        <li>Màu: <span>nâu</span></li>
                        <li>chất liệu <span>gỗ</span></li>
                        <li>loại <span>Chào mào</span></li>
                        <li>hình dáng <span>tròn</span></li>
                      <button id="open-popup-button" class="open-popup-button">Open Popup</button>  
                    </ul>
                </div>
                <div id="popup-container" class="popup-container">
    

    <div class="popup" id="popup">
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

        <button id="close-popup-button" class="close-popup-button">Close</button>
    </div>
</div>

 </div>
                </div>
        </div>



                 
           
            
        <script>
            // Open the popup when the "Open Popup" button is clicked
document.getElementById("open-popup-button").addEventListener("click", function () {
    document.getElementById("popup-container").style.display = "flex";
});

// Close the popup when the "Close" button is clicked
document.getElementById("close-popup-button").addEventListener("click", function () {
    document.getElementById("popup-container").style.display = "none";
});

// Handle form submission here (you can use AJAX to send data)
document.getElementById("feedback-form").addEventListener("submit", function (e) {
    e.preventDefault();
    // Add your code to handle form submission (e.g., sending data to the server)
});

        </script>
    </body>
</html>
