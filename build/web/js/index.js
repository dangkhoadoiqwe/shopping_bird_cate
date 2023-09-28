//menu ẩn
document.querySelector('.lg').addEventListener('click', function() {
  document.querySelector('.sidebar').classList.toggle('active');
  document.querySelectorAll('.gach-icon').forEach(function(icon) {
    icon.classList.toggle('active');
  });
});
document.addEventListener('click', function(event) {
  const sidebar = document.querySelector('.sidebar');
  const menuToggle = document.querySelector('.lg');
  const isClickInsideSidebar = sidebar.contains(event.target);
  const isClickOnMenuToggle = menuToggle.contains(event.target);

  if (!isClickInsideSidebar && !isClickOnMenuToggle && sidebar.classList.contains('active')) {
    menuToggle.click();
  }
});

//giỏ hàng
document.querySelector('.bt1').addEventListener('click', function() {
  document.querySelector('.sedibar2').classList.toggle('active');
  document.querySelectorAll('.sc-6dt8ej-bt1').forEach(function(icon) {
    icon.classList.toggle('active');
  });
});

document.addEventListener('click', function(event) {
  const sidebar2 = document.querySelector('.sedibar2');
  const menuToggle1 = document.querySelector('.bt1');
  const isClickInsideSidebar2 = sidebar2.contains(event.target);
  const isClickOnMenuToggle1 = menuToggle1.contains(event.target);

  if (!isClickInsideSidebar2 && !isClickOnMenuToggle1 && sidebar2.classList.contains('active')) {
    menuToggle1.click();
  }
});

//menu cấp 2
const button = document.querySelector('.bt');
const submenu = document.querySelector('.submenu');
// Xử lý sự kiện khi người dùng nhấp vào nút
button.addEventListener('click', function () {
    // Kiểm tra trạng thái hiện tại của menu cấp 2
    if (submenu.style.display === 'none') {
        // Nếu menu đang ẩn, hiển thị menu
        submenu.style.display = 'block';
    } else {
        // Nếu menu đang hiển thị, ẩn menu
        submenu.style.display = 'none';
    }
});
const button1 = document.querySelector('.mnphu');
const submenu1 = document.querySelector('.language-menu');

// Xử lý sự kiện khi người dùng nhấp vào nút
button1.addEventListener('click', function () {
    // Kiểm tra trạng thái hiện tại của menu cấp 2
    if (submenu1.style.display === 'none') {
        // Nếu menu đang ẩn, hiển thị menu
        submenu1.style.display = 'block';
    } else {
        // Nếu menu đang hiển thị, ẩn menu
        submenu1.style.display = 'none';
    }
});











// dau x
// Lấy trạng thái trang phụ từ sessionStorage
const sidebarState = sessionStorage.getItem('sidebarState');

// Kiểm tra trạng thái để hiển thị trang phụ
if (sidebarState === 'active') {
  document.querySelector('.sidebar').classList.add('active');
}
// Xử lý sự kiện click vào .daux
document.querySelector('.daux').addEventListener('click', function() {
  const sidebar = document.querySelector('.sidebar');
  const isActive = sidebar.classList.contains('active');

  // Đảo trạng thái hiện tại
  if (isActive) {
    sidebar.classList.remove('active');
    sessionStorage.setItem('sidebarState', '');
  } else {
    sidebar.classList.add('active');
    sessionStorage.setItem('sidebarState', 'active');
  }
});

const sidebarState1 = sessionStorage.getItem('sidebarState1');

// Kiểm tra trạng thái để hiển thị trang phụ
if (sidebarState1 === 'active') {
  document.querySelector('.sedibar2').classList.add('active');
}
// Xử lý sự kiện click vào .daux
document.querySelector('.daux-sb2').addEventListener('click', function() {
  const sidebar2 = document.querySelector('.sedibar2');
  const isActive1 = sidebar2.classList.contains('active');

  // Đảo trạng thái hiện tại
  if (isActive1) {
    sidebar2.classList.remove('active');
    sessionStorage.setItem('sidebarState1', '');
  } else {
    sidebar2.classList.add('active');
    sessionStorage.setItem('sidebarState1', 'active');
  }
});

// //menu trang phu
// const languageButton = document.querySelector('.language-button');
// const languageIcon = document.querySelector('#language-icon');
// const languageMenu = document.querySelector('.language-menu');

// languageIcon.addEventListener('click', function() {
//   languageMenu.classList.toggle('active');
// });

// // Đóng menu cấp 2 khi click bên ngoài
// document.addEventListener('click', function(event) {
//   const isClickInsideLanguageButton = languageButton.contains(event.target);
//   const isClickInsideLanguageMenu = languageMenu.contains(event.target);

//   if (!isClickInsideLanguageButton && !isClickInsideLanguageMenu) {
//     languageMenu.classList.remove('active');
//   }
// });



//bt4 icon-sang
var hasMovedLeft = false; // Biến kiểm tra đã di chuyển sang trái hay chưa
var hasMovedRight = false; // Biến kiểm tra đã di chuyển sang phải hay chưa

function moveLeft() {
  if (hasMovedLeft || hasMovedRight) {
 // Nếu đã di chuyển sang trái hoặc đã di chuyển sang phải, không thực hiện di chuyển nữa
  }
  var conList = document.querySelectorAll('.con');
  var distance = -1129; // Khoảng cách di chuyển, trong trường hợp này -1124px

  conList.forEach(function(con) {
    var currentLeft = parseInt(con.style.left) || 0; // Lấy giá trị hiện tại của thuộc tính left, nếu không tồn tại thì mặc định là 0
    var newLeft = currentLeft + distance;

    if (newLeft < -1129) {
      newLeft = -1129; // Giới hạn không cho di chuyển quá giá trị -1124px
    }

    con.style.left = newLeft + 'px'; // Thay đổi giá trị của thuộc tính left
  });

  hasMovedLeft = true; // Đánh dấu đã di chuyển sang trái
}
function moveRight() {
  if (!hasMovedLeft || hasMovedRight) {
  }

  var conList = document.querySelectorAll('.con');
  var distance = 1129; 

  conList.forEach(function(con) {
    var currentLeft = parseInt(con.style.left) || 0;
    var newLeft = currentLeft + distance;

    if (newLeft > 0) {
      newLeft = 0; 
    }

    con.style.left = newLeft + 'px'; 
  });

  hasMovedRight = true; 
}




//bt5
var hasMovedLeft1 = false; // Biến kiểm tra đã di chuyển sang trái hay chưa
var hasMovedRight1 = false; // Biến kiểm tra đã di chuyển sang phải hay chưa

function moveLeft1() {
  if (hasMovedLeft1 || hasMovedRight1) {
 // Nếu đã di chuyển sang trái hoặc đã di chuyển sang phải, không thực hiện di chuyển nữa
  }
  var conList1 = document.querySelectorAll('.con1');
  var distance1 = -1150; // Khoảng cách di chuyển, trong trường hợp này -1124px

  conList1.forEach(function(con) {
    var currentLeft1 = parseInt(con.style.left) || 0; // Lấy giá trị hiện tại của thuộc tính left, nếu không tồn tại thì mặc định là 0
    var newLeft1 = currentLeft1 + distance1;

    if (newLeft1 < -1150) {
      newLeft1 = -1150; // Giới hạn không cho di chuyển quá giá trị -1124px
    }

    con.style.left = newLeft1 + 'px'; // Thay đổi giá trị của thuộc tính left
  });

  hasMovedLeft1 = true; // Đánh dấu đã di chuyển sang trái
}
function moveRight1() {
  if (!hasMovedLeft1 || hasMovedRight1) {
  }

  var conList1 = document.querySelectorAll('.con1');
  var distance1 = 1150; 

  conList1.forEach(function(con) {
    var currentLeft1 = parseInt(con.style.left) || 0;
    var newLeft1 = currentLeft1 + distance1;

    if (newLeft1 > 0) {
      newLeft1 = 0; 
    }

    con.style.left = newLeft1 + 'px'; 
  });

  hasMovedRight1 = true; 
}
