<%-- Document : homeManager Created on : Oct 1, 2023, 10:41:15 PM Author : hailo --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">
        <link rel="stylesheet" href="assets/css/feathericon.min.css">
        <link rel="stylehseet" href="https://cdn.oesmith.co.uk/morris-0.5.1.css">
        <link rel="stylesheet" href="assets/plugins/morris/morris.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
        <!-- Material Icons -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
        <!-- CSS Files -->
        <link id="pagestyle" href="assets/css/material-dashboard.css?v=3.1.0" rel="stylesheet" />
        <script src="https://d3js.org/d3.v5.min.js"></script>
        <style>
            .tooltip {
                position: absolute;
                text-align: center;
                padding: 6px;
                font: 12px sans-serif;
                background: #333;
                color: #fff;
                border-radius: 4px;
                pointer-events: none;
            }
        </style>
        <!-- Nepcha Analytics (nepcha.com) -->
        <!-- Nepcha is a easy-to-use web analytics. No cookies and fully compliant with GDPR, CCPA and PECR. -->
        <script defer data-site="YOUR_DOMAIN_HERE" src="https://api.nepcha.com/js/nepcha-analytics.js"></script>
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700" />
    </head>

    <body>
        <div class="main-wrapper">
            <div class="header">
                <div class="header-left">
                    <a href="index.html" class="logo"> <img src="assets/img/hotel_logo.png" width="50"
                                                            height="70" alt="logo"> <span class="logoclass">FUNIR</span> </a>
                    <a href="index.html" class="logo logo-small"> <img src="assets/img/hotel_logo.png"
                                                                       alt="Logo" width="30" height="30"> </a>
                </div>
                <a href="javascript:void(0);" id="toggle_btn"> <i class="fe fe-text-align-left"></i> </a>
                <a class="mobile_btn" id="mobile_btn"> <i class="fas fa-bars"></i> </a>
                <ul class="nav user-menu">
                    <li class="nav-item dropdown noti-dropdown">
                        <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown"> <i
                                class="fe fe-bell"></i> <span class="badge badge-pill">3</span> </a>
                        <div class="dropdown-menu notifications">
                            <div class="topnav-dropdown-header"> <span
                                    class="notification-title">Notifications</span> <a href="javascript:void(0)"
                                    class="clear-noti"> Clear All </a> </div>
                            <div class="noti-content">
                                <ul class="notification-list">
                                    <!--                                    <li class="notification-message">
                                                                    <a href="#">
                                                                        <div class="media"> <span class="avatar avatar-sm">
                                                                                <img class="avatar-img rounded-circle" alt="User Image" src="assets/img/profiles/avatar-02.jpg">
                                                                            </span>
                                                                            <div class="media-body">
                                                                                <p class="noti-details"><span class="noti-title">Carlson Tech</span> has approved <span class="noti-title">your estimate</span></p>
                                                                                <p class="noti-time"><span class="notification-time">4 mins ago</span> </p>
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                </li>-->
                                </ul>
                            </div>
                            <div class="topnav-dropdown-footer"> <a href="#">View all Notifications</a> </div>
                        </div>
                    </li>
                    <li class="nav-item dropdown has-arrow">
                        <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown"> <span
                                class="user-img"><img class="rounded-circle"
                                                  src="assets/img/profiles/avatar-01.jpg" width="31" alt="Soeng Souy"></span>
                        </a>
                        <div class="dropdown-menu">
                            <div class="user-header">
                                <div class="avatar avatar-sm"> <img src="assets/img/profiles/avatar-01.jpg"
                                                                    alt="User Image" class="avatar-img rounded-circle"> </div>
                                <div class="user-text">

                                    <p class="text-muted mb-0">Manager</p>
                                </div>
                            </div> <a class="dropdown-item" href="profile.html">My Profile</a> <a
                                class="dropdown-item" href="MainController?action=logout">Logout</a>
                        </div>
                    </li>
                </ul>
                <div class="top-nav-search">
                    <form>
                        <input type="text" class="form-control" placeholder="Search here">
                        <button class="btn" type="submit"><i class="fas fa-search"></i></button>
                    </form>
                </div>
            </div>
            <div class="sidebar" id="sidebar">
                <div class="sidebar-inner slimscroll">
                    <div id="sidebar-menu" class="sidebar-menu">
                        <ul>
                            <li class="active"> <a href=" MainController?action=DASH"><i class="fas fa-tachometer-alt"></i>
                                    <span>Dashboard</span></a> </li>
                            <li class="list-divider"></li>
                            <li class="active"> <a href="MainController?action=ALLBOOKING"><i
                                        class="fas fa-suitcase"></i> <span>Bookings</span></a> </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="page-wrapper">
                <div class="content container-fluid">
                    <div class="page-header">
                        <div class="row">
                            <div class="col-sm-12 mt-5">
                                <h3 class="page-title mt-3">Good Morning !</h3>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item active">Dashboard</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="row" href="MainController?action=DASH">
                        <div class="col-xl-3 col-sm-6 col-12">
                            <div class="card board1 fill">
                                <div class="card-body">
                                    <div class="dash-widget-header">
                                        <div>
                                            <h3 class="card_widget_header">${countOrder}</h3>
                                            <h6 class="text-muted">Tổng đơn</h6>
                                        </div>
                                        <div class="ml-auto mt-md-3 mt-lg-0"> <span
                                                class="opacity-7 text-muted"><svg
                                                    xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                    viewbox="0 0 24 24" fill="none" stroke="#009688"
                                                    stroke-width="2" stroke-linecap="round"
                                                    stroke-linejoin="round" class="feather feather-user-plus">
                                                <path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                                                <circle cx="8.5" cy="7" r="4"></circle>
                                                <line x1="20" y1="8" x2="20" y2="14"></line>
                                                <line x1="23" y1="11" x2="17" y2="11"></line>
                                                </svg></span> </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-sm-6 col-12">
                            <div class="card board1 fill">
                                <div class="card-body">
                                    <div class="dash-widget-header">
                                        <div>
                                            <h3 class="card_widget_header">${Sum} VNĐ</h3>
                                            <h6 class="text-muted">Doanh thu</h6>
                                        </div>
                                        <div class="ml-auto mt-md-3 mt-lg-0"> <span
                                                class="opacity-7 text-muted"><svg
                                                    xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                    viewbox="0 0 24 24" fill="none" stroke="#009688"
                                                    stroke-width="2" stroke-linecap="round"
                                                    stroke-linejoin="round" class="feather feather-dollar-sign">
                                                <line x1="12" y1="1" x2="12" y2="23"></line>
                                                <path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6">
                                                </path>
                                                </svg></span> </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-sm-6 col-12">
                            <div class="card board1 fill">
                                <div class="card-body">
                                    <div class="dash-widget-header">
                                        <div>
                                            <h3 class="card_widget_header">${CountCustom}</h3>
                                            <h6 class="text-muted"> Đơn thiết kế </h6>
                                        </div>
                                        <div class="ml-auto mt-md-3 mt-lg-0"> <span
                                                class="opacity-7 text-muted"><svg
                                                    xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                    viewbox="0 0 24 24" fill="none" stroke="#009688"
                                                    stroke-width="2" stroke-linecap="round"
                                                    stroke-linejoin="round" class="feather feather-file-plus">
                                                <path
                                                    d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z">
                                                </path>
                                                <polyline points="14 2 14 8 20 8"></polyline>
                                                <line x1="12" y1="18" x2="12" y2="12"></line>
                                                <line x1="9" y1="15" x2="15" y2="15"></line>
                                                </svg></span> </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                                            
                                              <div class="col-xl-3 col-sm-6 col-12">
                            <div class="card board1 fill">
                                <div class="card-body">
                                    <div class="dash-widget-header">
                                        <div>
                                            <h3 class="card_widget_header">${payme}</h3>
                                            <h6 class="text-muted">  ĐƠn hủy  </h6>
                                        </div>
                                        <div class="ml-auto mt-md-3 mt-lg-0"> <span
                                                class="opacity-7 text-muted"><svg
                                                    xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                    viewbox="0 0 24 24" fill="none" stroke="#009688"
                                                    stroke-width="2" stroke-linecap="round"
                                                    stroke-linejoin="round" class="feather feather-file-plus">
                                                <path
                                                    d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z">
                                                </path>
                                                <polyline points="14 2 14 8 20 8"></polyline>
                                                <line x1="12" y1="18" x2="12" y2="12"></line>
                                                <line x1="9" y1="15" x2="15" y2="15"></line>
                                                </svg></span> </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                       
                    </div>
                    <div class="row" style="margin-top :50px">
                        <div class="col-md-12 d-flex">
                            <div class=" col-md-6 ">
                                <div class="card z-index-2 ">
                                    <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2 bg-transparent">
                                        <div class="bg-gradient-primary shadow-primary border-radius-lg py-3 pe-1">
                                            <div class="chart">
                                                <canvas id="chart-bars" class="chart-canvas" height="170"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <h6 class="mb-0 ">Doanh thu 7 ngày bán hàng </h6>

                                        <hr class="dark horizontal">
                                        <div class="d-flex ">
                                            <i class="material-icons text-sm my-auto me-1">schedule</i>
                                            <p class="mb-0 text-sm">Đã cập nhật   ${currentDateTime} ago </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class=" col-md-6 ">
                                <div class="card z-index-2  ">
                                    <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2 bg-transparent">
                                        <div class="bg-gradient-success shadow-success border-radius-lg py-3 pe-1">
                                            <div class="chart">
                                                <canvas id="chart-line" class="chart-canvas" height="170"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <h6 class="mb-0 "> Doanh thu 12 tháng  bán hàng </h6>
                                        <hr class="dark horizontal">
                                        <div class="d-flex ">
                                            <i class="material-icons text-sm my-auto me-1">schedule</i>
                                            <p class="mb-0 text-sm">Đã cập nhật   ${currentDateTime} ago </p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                     
                            <div class=" col-md-4 ">
                                <div class="card z-index-2  ">
                                    <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2 bg-transparent">
                                      
                                            <div class="chart">
                               
                                </div>
                                    
                                    </div>
                            </div>

                        </div>
</div>
                       
                                                                 
                        <!--   Core JS Files   -->
                        <script src="assets/js/core/popper.min.js"></script>
                        <script src="assets/js/core/bootstrap.min.js"></script>
                        <script src="assets/js/plugins/perfect-scrollbar.min.js"></script>
                        <script src="assets/js/plugins/smooth-scrollbar.min.js"></script>
                        <script src="assets/js/plugins/chartjs.min.js"></script>
                        <c:set var="id1" value="${paymentSummaries[0].getTotal()}" />
                        <c:set var="id2" value="${paymentSummaries[1].getTotal()}" />
                        <c:set var="id3" value="${paymentSummaries[2].getTotal()}" />
                        <c:set var="id4" value="${paymentSummaries[3].getTotal()}" />
                        <c:set var="id5" value="${paymentSummaries[4].getTotal()}" />
                        <c:set var="id6" value="${paymentSummaries[5].getTotal()}" />
                        <c:set var="id7" value="${paymentSummaries[6].getTotal()}" />

                        <c:set var="ed1" value="${paymentSummaries[0].getCreateTime()}" />
                        <c:set var="ed2" value="${paymentSummaries[1].getCreateTime()}" />
                        <c:set var="ed3" value="${paymentSummaries[2].getCreateTime()}" />
                        <c:set var="ed4" value="${paymentSummaries[3].getCreateTime()}" />
                        <c:set var="ed5" value="${paymentSummaries[4].getCreateTime()}" />
                        <c:set var="ed6" value="${paymentSummaries[5].getCreateTime()}" />
                        <c:set var="ed7" value="${paymentSummaries[6].getCreateTime()}" />


                        <c:set var="med1" value="${paymentmonthSummariess[0].getCreateTime()}" />
                        <c:set var="med2" value="${paymentmonthSummaries[1].getCreateTime()}" />
                        <c:set var="med3" value="${paymentmonthSummaries[2].getCreateTime()}" />
                        <c:set var="med4" value="${paymentmonthSummaries[3].getCreateTime()}" />
                        <c:set var="med5" value="${paymentmonthSummaries[4].getCreateTime()}" />
                        <c:set var="med6" value="${paymentmonthSummaries[5].getCreateTime()}" />
                        <c:set var="med7" value="${paymentmonthSummaries[6].getCreateTime()}" />


                        <c:set var="mid1" value="${paymentmonthSummaries[0].getTotall()}" />
                        <c:set var="mid2" value="${paymentmonthSummaries[1].getTotall()}" />
                        <c:set var="mid3" value="${paymentmonthSummaries[2].getTotall()}" />
                        <c:set var="mid4" value="${paymentmonthSummaries[3].getTotall()}" />
                        <c:set var="mid5" value="${paymentmonthSummaries[4].getTotall()}" />
                        <c:set var="mid6" value="${paymentmonthSummaries[5].getTotall()}" />
                        <c:set var="mid7" value="${paymentmonthSummaries[6].getTotall()}" />

                        <script>
                            var ctx = document.getElementById("chart-bars").getContext("2d");

                            new Chart(ctx, {
                                type: "bar",
                                data: {
                                    labels: ["${ed1}", "${ed2}", "${ed3}", "${ed4}", "${ed5}", "${ed6}", "${ed7}"],
                                    datasets: [{
                                            label: "Sales",
                                            tension: 0.4,
                                            borderWidth: 0,
                                            borderRadius: 4,
                                            borderSkipped: false,
                                            backgroundColor: "rgba(255, 255, 255, .8)",
                                            data: [${id1}, ${id2}, ${id3}, ${id4}, ${id5}, ${id6}, ${id7}],
                                            maxBarThickness: 6
                                        }, ],
                                },
                                options: {
                                    responsive: true,
                                    maintainAspectRatio: false,
                                    plugins: {
                                        legend: {
                                            display: false,
                                        }
                                    },
                                    interaction: {
                                        intersect: false,
                                        mode: 'index',
                                    },
                                    scales: {
                                        y: {
                                            grid: {
                                                drawBorder: false,
                                                display: true,
                                                drawOnChartArea: true,
                                                drawTicks: false,
                                                borderDash: [5, 5],
                                                color: 'rgba(255, 255, 255, .2)'
                                            },
                                            ticks: {
                                                suggestedMin: 0,
                                                suggestedMax: 500,
                                                beginAtZero: true,
                                                padding: 10,
                                                font: {
                                                    size: 14,
                                                    weight: 300,
                                                    family: "Roboto",
                                                    style: 'normal',
                                                    lineHeight: 2
                                                },
                                                color: "#fff"
                                            },
                                        },
                                        x: {
                                            grid: {
                                                drawBorder: false,
                                                display: true,
                                                drawOnChartArea: true,
                                                drawTicks: false,
                                                borderDash: [5, 5],
                                                color: 'rgba(255, 255, 255, .2)'
                                            },
                                            ticks: {
                                                display: true,
                                                color: '#f8f9fa',
                                                padding: 10,
                                                font: {
                                                    size: 14,
                                                    weight: 300,
                                                    family: "Roboto",
                                                    style: 'normal',
                                                    lineHeight: 2
                                                },
                                            }
                                        },
                                    },
                                },
                            });


                            var ctx2 = document.getElementById("chart-line").getContext("2d");

                            new Chart(ctx2, {
                                type: "line",
                                data: {
                                    labels: ["Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                                    datasets: [{
                                            label: "Sản phẩm bán được:",
                                            tension: 0,
                                            borderWidth: 0,
                                            pointRadius: 5,
                                            pointBackgroundColor: "rgba(255, 255, 255, .8)",
                                            pointBorderColor: "transparent",
                                            borderColor: "rgba(255, 255, 255, .8)",
                                            borderColor: "rgba(255, 255, 255, .8)",
                                            borderWidth: 4,
                                            backgroundColor: "transparent",
                                            fill: true,
                                            data: [${mid1}, ${mid2}, ${mid3}, ${mid4}, ${mid5}, ${mid6}, ${mid7}],
                                            maxBarThickness: 6

                                        }],
                                },
                                options: {
                                    responsive: true,
                                    maintainAspectRatio: false,
                                    plugins: {
                                        legend: {
                                            display: false,
                                        }
                                    },
                                    interaction: {
                                        intersect: false,
                                        mode: 'index',
                                    },
                                    scales: {
                                        y: {
                                            grid: {
                                                drawBorder: false,
                                                display: true,
                                                drawOnChartArea: true,
                                                drawTicks: false,
                                                borderDash: [5, 5],
                                                color: 'rgba(255, 255, 255, .2)'
                                            },
                                            ticks: {
                                                display: true,
                                                color: '#f8f9fa',
                                                padding: 10,
                                                font: {
                                                    size: 14,
                                                    weight: 300,
                                                    family: "Roboto",
                                                    style: 'normal',
                                                    lineHeight: 2
                                                },
                                            }
                                        },
                                        x: {
                                            grid: {
                                                drawBorder: false,
                                                display: false,
                                                drawOnChartArea: false,
                                                drawTicks: false,
                                                borderDash: [5, 5]
                                            },
                                            ticks: {
                                                display: true,
                                                color: '#f8f9fa',
                                                padding: 10,
                                                font: {
                                                    size: 14,
                                                    weight: 300,
                                                    family: "Roboto",
                                                    style: 'normal',
                                                    lineHeight: 2
                                                },
                                            }
                                        },
                                    },
                                },
                            });


                        </script>
                        <script>
                            var win = navigator.platform.indexOf('Win') > -1;
                            if (win && document.querySelector('#sidenav-scrollbar')) {
                                var options = {
                                    damping: '0.5'
                                }
                                Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
                            }
                        </script>
                        <!-- Github buttons -->
                        <script async defer src="https://buttons.github.io/buttons.js"></script>
                        <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
                        <script src="assets/js/material-dashboard.min.js?v=3.1.0"></script>

                    </div>
                </div>
            </div>
                                              </div>
            </div>
            <script data-cfasync="false"
            src="../../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
            <script src="assets/js/jquery-3.5.1.min.js"></script>
            <script src="assets/js/popper.min.js"></script>
            <script src="assets/js/bootstrap.min.js"></script>
            <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
            <script src="assets/plugins/raphael/raphael.min.js"></script>
            <script src="assets/plugins/morris/morris.min.js"></script>
            <script src="assets/js/chart.morris.js"></script>
            <script src="assets/js/script.js"></script>

            <script>
                            var data = [
                                {category: "Cage : 30", value: 30},
                                {category: "Booking :30", value: 50},
                                {category: "Cagebuy :30", value: 20}
                            ];

                            var width = 300;
                            var height = 300;
                            var radius = Math.min(width, height) / 2;
                            var donutWidth = 75;

                            var svg = d3.select("#donut-chart")
                                    .append("svg")
                                    .attr("width", width)
                                    .attr("height", height)
                                    .append("g")
                                    .attr("transform", "translate(" + (width / 2) + "," + (height / 2) + ")");

                            var pie = d3.pie()
                                    .value(function (d) {
                                        return d.value;
                                    });

                            var arc = d3.arc()
                                    .innerRadius(radius - donutWidth)
                                    .outerRadius(radius);

                            var color = d3.scaleOrdinal(d3.schemeCategory10);

                            var path = svg.selectAll("path")
                                    .data(pie(data))
                                    .enter()
                                    .append("path")
                                    .attr("d", arc)
                                    .attr("fill", function (d, i) {
                                        return color(d.data.category);
                                    })
                                    .on("mouseover", function (d) {
                                        d3.select(this).transition()
                                                .duration(200)
                                                .attr("d", d3.arc()
                                                        .innerRadius(radius - donutWidth + 10)
                                                        .outerRadius(radius)
                                                        );
                                        tooltip.style("opacity", 1)
                                                .html(d.data.category + "<br>" + d.data.value)
                                                .style("left", (d3.event.pageX) + "px")
                                                .style("top", (d3.event.pageY - 28) + "px");
                                    })
                                    .on("mouseout", function (d) {
                                        d3.select(this).transition()
                                                .duration(200)
                                                .attr("d", arc);
                                        tooltip.style("opacity", 0);
                                    });

                            var text = svg.selectAll("text")
                                    .data(pie(data))
                                    .enter()
                                    .append("text")
                                    .text(function (d) {
                                        return d.data.category;
                                    })
                                    .attr("transform", function (d) {
                                        var pos = arc.centroid(d);
                                        return "translate(" + pos + ")";
                                    })
                                    .style("text-anchor", "middle")
                                    .style("font-size", "14px")
                                    .style("fill", "#fff");

                            var tooltip = d3.select(".tooltip");

                            var legend = svg.selectAll(".legend")
                                    .data(data)
                                    .enter()
                                    .append("g")
                                    .attr("class", "legend")
                                    .attr("transform", function (d, i) {
                                        var height = 18;
                                        var offset = height * color.domain().length / 2;
                                        var horz = 4 * donutWidth;
                                        var vert = i * height - offset;
                                        return "translate(" + horz + "," + vert + ")";
                                    });

                            legend.append("rect")
                                    .attr("width", 18)
                                    .attr("height", 18)
                                    .style("fill", function (d, i) {
                                        return color(d.category);
                                    });

                            legend.append("text")
                                    .attr("x", 24)
                                    .attr("y", 9)
                                    .attr("dy", ".35em")
                                    .style("text-anchor", "start")
                                    .text(function (d) {
                                        return d.category;
                                    });
            </script>
    </body>

</html>