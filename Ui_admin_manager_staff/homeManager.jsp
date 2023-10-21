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
                            <li class="active"> <a href="homeManager.jsp"><i class="fas fa-tachometer-alt"></i>
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
                                            <h6 class="text-muted"> custom cage</h6>
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
                                            <h3 class="card_widget_header">20</h3>
                                            <h6 class="text-muted"> Sản phẩm đổi trả</h6>
                                        </div>
                                        <div class="ml-auto mt-md-3 mt-lg-0"> <span
                                                class="opacity-7 text-muted"><svg
                                                    xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                    viewbox="0 0 24 24" fill="none" stroke="#009688"
                                                    stroke-width="2" stroke-linecap="round"
                                                    stroke-linejoin="round" class="feather feather-globe">
                                                <circle cx="12" cy="12" r="10"></circle>
                                                <line x1="2" y1="12" x2="22" y2="12"></line>
                                                <path
                                                    d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z">
                                                </path>
                                                </svg></span> </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 col-lg-6">
                            <div class="card card-chart">
                                <div class="card-body">
                                    <div
                                        class="d-sm-flex d-block align-items-center justify-content-between mb-9">
                                        <div class="mb-3 mb-sm-0">
                                            <h5 class="card-title fw-semibold">Thống kê Doanh Thu</h5>
                                        </div>
                                        <div>
                                            <select class="form-select">
                                                <option value="1">March 2023</option>
                                                <option value="2">April 2023</option>
                                                <option value="3">May 2023</option>
                                                <option value="4">June 2023</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div id="chart" style="min-height: 360px;">
                                        <div id="apexcharts3y7kk3m1"
                                             class="apexcharts-canvas apexcharts3y7kk3m1 apexcharts-theme-light"
                                             style="width: 569px; height: 345px;"><svg id="SvgjsSvg1536"
                                                                                  width="569" height="345" xmlns="http://www.w3.org/2000/svg"
                                                                                  version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink"
                                                                                  xmlns:svgjs="http://svgjs.dev" class="apexcharts-svg"
                                                                                  xmlns:data="ApexChartsNS" transform="translate(-15, 0)"
                                                                                  style="background: transparent;">
                                            <g id="SvgjsG1538" class="apexcharts-inner apexcharts-graphical"
                                               transform="translate(50.02777862548828, 30)">
                                            <defs id="SvgjsDefs1537">
                                            <linearGradient id="SvgjsLinearGradient1542" x1="0"
                                                            y1="0" x2="0" y2="1">
                                            <stop id="SvgjsStop1543" stop-opacity="0.4"
                                                  stop-color="rgba(216,227,240,0.4)" offset="0">
                                            </stop>
                                            <stop id="SvgjsStop1544" stop-opacity="0.5"
                                                  stop-color="rgba(190,209,230,0.5)" offset="1">
                                            </stop>
                                            <stop id="SvgjsStop1545" stop-opacity="0.5"
                                                  stop-color="rgba(190,209,230,0.5)" offset="1">
                                            </stop>
                                            </linearGradient>
                                            <clipPath id="gridRectMask3y7kk3m1">
                                                <rect id="SvgjsRect1547" width="515.9722213745117"
                                                      height="278.55022136497496" x="-3.5" y="-1.5"
                                                      rx="0" ry="0" opacity="1" stroke-width="0"
                                                      stroke="none" stroke-dasharray="0" fill="#fff">
                                                </rect>
                                            </clipPath>
                                            <clipPath id="forecastMask3y7kk3m1"></clipPath>
                                            <clipPath id="nonForecastMask3y7kk3m1"></clipPath>
                                            <clipPath id="gridRectMarkerMask3y7kk3m1">
                                                <rect id="SvgjsRect1548" width="512.9722213745117"
                                                      height="279.55022136497496" x="-2" y="-2" rx="0"
                                                      ry="0" opacity="1" stroke-width="0"
                                                      stroke="none" stroke-dasharray="0" fill="#fff">
                                                </rect>
                                            </clipPath>
                                            </defs>
                                            <rect id="SvgjsRect1546" width="11.133767342567443"
                                                  height="275.55022136497496" x="0" y="0" rx="0" ry="0"
                                                  opacity="1" stroke-width="0" stroke-dasharray="3"
                                                  fill="url(#SvgjsLinearGradient1542)"
                                                  class="apexcharts-xcrosshairs" y2="275.55022136497496"
                                                  filter="none" fill-opacity="0.9"></rect>
                                            <line id="SvgjsLine1592" x1="0" y1="276.55022136497496"
                                                  x2="0" y2="282.55022136497496" stroke="#e0e0e0"
                                                  stroke-dasharray="0" stroke-linecap="butt"
                                                  class="apexcharts-xaxis-tick"></line>
                                            <line id="SvgjsLine1593" x1="63.621527671813965"
                                                  y1="276.55022136497496" x2="63.621527671813965"
                                                  y2="282.55022136497496" stroke="#e0e0e0"
                                                  stroke-dasharray="0" stroke-linecap="butt"
                                                  class="apexcharts-xaxis-tick"></line>
                                            <line id="SvgjsLine1594" x1="127.24305534362793"
                                                  y1="276.55022136497496" x2="127.24305534362793"
                                                  y2="282.55022136497496" stroke="#e0e0e0"
                                                  stroke-dasharray="0" stroke-linecap="butt"
                                                  class="apexcharts-xaxis-tick"></line>
                                            <line id="SvgjsLine1595" x1="190.8645830154419"
                                                  y1="276.55022136497496" x2="190.8645830154419"
                                                  y2="282.55022136497496" stroke="#e0e0e0"
                                                  stroke-dasharray="0" stroke-linecap="butt"
                                                  class="apexcharts-xaxis-tick"></line>
                                            <line id="SvgjsLine1596" x1="254.48611068725586"
                                                  y1="276.55022136497496" x2="254.48611068725586"
                                                  y2="282.55022136497496" stroke="#e0e0e0"
                                                  stroke-dasharray="0" stroke-linecap="butt"
                                                  class="apexcharts-xaxis-tick"></line>
                                            <line id="SvgjsLine1597" x1="318.1076383590698"
                                                  y1="276.55022136497496" x2="318.1076383590698"
                                                  y2="282.55022136497496" stroke="#e0e0e0"
                                                  stroke-dasharray="0" stroke-linecap="butt"
                                                  class="apexcharts-xaxis-tick"></line>
                                            <line id="SvgjsLine1598" x1="381.7291660308838"
                                                  y1="276.55022136497496" x2="381.7291660308838"
                                                  y2="282.55022136497496" stroke="#e0e0e0"
                                                  stroke-dasharray="0" stroke-linecap="butt"
                                                  class="apexcharts-xaxis-tick"></line>
                                            <line id="SvgjsLine1599" x1="445.35069370269775"
                                                  y1="276.55022136497496" x2="445.35069370269775"
                                                  y2="282.55022136497496" stroke="#e0e0e0"
                                                  stroke-dasharray="0" stroke-linecap="butt"
                                                  class="apexcharts-xaxis-tick"></line>
                                            <line id="SvgjsLine1600" x1="508.9722213745117"
                                                  y1="276.55022136497496" x2="508.9722213745117"
                                                  y2="282.55022136497496" stroke="#e0e0e0"
                                                  stroke-dasharray="0" stroke-linecap="butt"
                                                  class="apexcharts-xaxis-tick"></line>
                                            <g id="SvgjsG1608" class="apexcharts-xaxis"
                                               transform="translate(0, 0)">
                                            <g id="SvgjsG1609" class="apexcharts-xaxis-texts-g"
                                               transform="translate(0, -4)"><text
                                               id="SvgjsText1611" font-family="inherit"
                                               x="31.810763835906982" y="304.55022136497496"
                                               text-anchor="middle" dominant-baseline="auto"
                                               font-size="12px" font-weight="400"
                                               fill="#adb0bb"
                                               class="apexcharts-text apexcharts-xaxis-label grey--text lighten-2--text fill-color"
                                               style="font-family: inherit;">
                                            <tspan id="SvgjsTspan1612">16/08</tspan>
                                            <title>16/08</title>
                                            </text><text id="SvgjsText1614"
                                                         font-family="inherit" x="95.43229150772095"
                                                         y="304.55022136497496" text-anchor="middle"
                                                         dominant-baseline="auto" font-size="12px"
                                                         font-weight="400" fill="#adb0bb"
                                                         class="apexcharts-text apexcharts-xaxis-label grey--text lighten-2--text fill-color"
                                                         style="font-family: inherit;">
                                            <tspan id="SvgjsTspan1615">17/08</tspan>
                                            <title>17/08</title>
                                            </text><text id="SvgjsText1617"
                                                         font-family="inherit" x="159.0538191795349"
                                                         y="304.55022136497496" text-anchor="middle"
                                                         dominant-baseline="auto" font-size="12px"
                                                         font-weight="400" fill="#adb0bb"
                                                         class="apexcharts-text apexcharts-xaxis-label grey--text lighten-2--text fill-color"
                                                         style="font-family: inherit;">
                                            <tspan id="SvgjsTspan1618">18/08</tspan>
                                            <title>18/08</title>
                                            </text><text id="SvgjsText1620"
                                                         font-family="inherit" x="222.67534685134888"
                                                         y="304.55022136497496" text-anchor="middle"
                                                         dominant-baseline="auto" font-size="12px"
                                                         font-weight="400" fill="#adb0bb"
                                                         class="apexcharts-text apexcharts-xaxis-label grey--text lighten-2--text fill-color"
                                                         style="font-family: inherit;">
                                            <tspan id="SvgjsTspan1621">19/08</tspan>
                                            <title>19/08</title>
                                            </text><text id="SvgjsText1623"
                                                         font-family="inherit" x="286.29687452316284"
                                                         y="304.55022136497496" text-anchor="middle"
                                                         dominant-baseline="auto" font-size="12px"
                                                         font-weight="400" fill="#adb0bb"
                                                         class="apexcharts-text apexcharts-xaxis-label grey--text lighten-2--text fill-color"
                                                         style="font-family: inherit;">
                                            <tspan id="SvgjsTspan1624">20/08</tspan>
                                            <title>20/08</title>
                                            </text><text id="SvgjsText1626"
                                                         font-family="inherit" x="349.9184021949768"
                                                         y="304.55022136497496" text-anchor="middle"
                                                         dominant-baseline="auto" font-size="12px"
                                                         font-weight="400" fill="#adb0bb"
                                                         class="apexcharts-text apexcharts-xaxis-label grey--text lighten-2--text fill-color"
                                                         style="font-family: inherit;">
                                            <tspan id="SvgjsTspan1627">21/08</tspan>
                                            <title>21/08</title>
                                            </text><text id="SvgjsText1629"
                                                         font-family="inherit" x="413.53992986679077"
                                                         y="304.55022136497496" text-anchor="middle"
                                                         dominant-baseline="auto" font-size="12px"
                                                         font-weight="400" fill="#adb0bb"
                                                         class="apexcharts-text apexcharts-xaxis-label grey--text lighten-2--text fill-color"
                                                         style="font-family: inherit;">
                                            <tspan id="SvgjsTspan1630">22/08</tspan>
                                            <title>22/08</title>
                                            </text><text id="SvgjsText1632"
                                                         font-family="inherit" x="477.16145753860474"
                                                         y="304.55022136497496" text-anchor="middle"
                                                         dominant-baseline="auto" font-size="12px"
                                                         font-weight="400" fill="#adb0bb"
                                                         class="apexcharts-text apexcharts-xaxis-label grey--text lighten-2--text fill-color"
                                                         style="font-family: inherit;">
                                            <tspan id="SvgjsTspan1633">23/08</tspan>
                                            <title>23/08</title>
                                            </text></g>
                                            </g>
                                            <g id="SvgjsG1588" class="apexcharts-grid">
                                            <g id="SvgjsG1589"
                                               class="apexcharts-gridlines-horizontal">
                                            <line id="SvgjsLine1602" x1="0"
                                                  y1="68.88755534124374" x2="508.9722213745117"
                                                  y2="68.88755534124374" stroke="rgba(0,0,0,0.1)"
                                                  stroke-dasharray="3" stroke-linecap="butt"
                                                  class="apexcharts-gridline"></line>
                                            <line id="SvgjsLine1603" x1="0"
                                                  y1="137.77511068248748" x2="508.9722213745117"
                                                  y2="137.77511068248748" stroke="rgba(0,0,0,0.1)"
                                                  stroke-dasharray="3" stroke-linecap="butt"
                                                  class="apexcharts-gridline"></line>
                                            <line id="SvgjsLine1604" x1="0"
                                                  y1="206.66266602373122" x2="508.9722213745117"
                                                  y2="206.66266602373122" stroke="rgba(0,0,0,0.1)"
                                                  stroke-dasharray="3" stroke-linecap="butt"
                                                  class="apexcharts-gridline"></line>
                                            </g>
                                            <g id="SvgjsG1590"
                                               class="apexcharts-gridlines-vertical"></g>
                                            <line id="SvgjsLine1607" x1="0" y1="275.55022136497496"
                                                  x2="508.9722213745117" y2="275.55022136497496"
                                                  stroke="transparent" stroke-dasharray="0"
                                                  stroke-linecap="butt"></line>
                                            <line id="SvgjsLine1606" x1="0" y1="1" x2="0"
                                                  y2="275.55022136497496" stroke="transparent"
                                                  stroke-dasharray="0" stroke-linecap="butt"></line>
                                            </g>
                                            <g id="SvgjsG1549"
                                               class="apexcharts-bar-series apexcharts-plot-series">
                                            <g id="SvgjsG1550" class="apexcharts-series" rel="1"
                                               seriesName="Earningsxthisxmonthx"
                                               data:realIndex="0">
                                            <path id="SvgjsPath1554"
                                                  d="M 20.676996493339537 275.55122136497494 L 20.676996493339537 37.000399903559696 C 20.676996493339537 34.000399903559696 23.676996493339537 31.000399903559693 26.676996493339537 31.000399903559693 L 26.676996493339537 31.000399903559693 C 27.74388016462326 31.000399903559693 28.810763835906982 34.000399903559696 28.810763835906982 37.000399903559696 L 28.810763835906982 275.55122136497494 z "
                                                  fill="rgba(93,135,255,0.85)" fill-opacity="1"
                                                  stroke="transparent" stroke-opacity="1"
                                                  stroke-linecap="butt" stroke-width="3"
                                                  stroke-dasharray="0" class="apexcharts-bar-area"
                                                  index="0" clip-path="url(#gridRectMask3y7kk3m1)"
                                                  pathTo="M 20.676996493339537 275.55122136497494 L 20.676996493339537 37.000399903559696 C 20.676996493339537 34.000399903559696 23.676996493339537 31.000399903559693 26.676996493339537 31.000399903559693 L 26.676996493339537 31.000399903559693 C 27.74388016462326 31.000399903559693 28.810763835906982 34.000399903559696 28.810763835906982 37.000399903559696 L 28.810763835906982 275.55122136497494 z "
                                                  pathFrom="M 20.676996493339537 275.55122136497494 L 20.676996493339537 275.55122136497494 L 28.810763835906982 275.55122136497494 L 28.810763835906982 275.55122136497494 L 28.810763835906982 275.55122136497494 L 28.810763835906982 275.55122136497494 L 28.810763835906982 275.55122136497494 L 20.676996493339537 275.55122136497494 z"
                                                  cy="30.99939990355969" cx="82.79852416515351"
                                                  j="0" val="355" barHeight="244.55082146141527"
                                                  barWidth="11.133767342567443"></path>
                                            <path id="SvgjsPath1556"
                                                  d="M 84.29852416515351 275.55122136497494 L 84.29852416515351 12.889755534124358 C 84.29852416515351 9.889755534124358 87.29852416515351 6.889755534124357 90.29852416515351 6.889755534124357 L 90.29852416515351 6.889755534124357 C 91.36540783643723 6.889755534124357 92.43229150772095 9.889755534124358 92.43229150772095 12.889755534124358 L 92.43229150772095 275.55122136497494 z "
                                                  fill="rgba(93,135,255,0.85)" fill-opacity="1"
                                                  stroke="transparent" stroke-opacity="1"
                                                  stroke-linecap="butt" stroke-width="3"
                                                  stroke-dasharray="0" class="apexcharts-bar-area"
                                                  index="0" clip-path="url(#gridRectMask3y7kk3m1)"
                                                  pathTo="M 84.29852416515351 275.55122136497494 L 84.29852416515351 12.889755534124358 C 84.29852416515351 9.889755534124358 87.29852416515351 6.889755534124357 90.29852416515351 6.889755534124357 L 90.29852416515351 6.889755534124357 C 91.36540783643723 6.889755534124357 92.43229150772095 9.889755534124358 92.43229150772095 12.889755534124358 L 92.43229150772095 275.55122136497494 z "
                                                  pathFrom="M 84.29852416515351 275.55122136497494 L 84.29852416515351 275.55122136497494 L 92.43229150772095 275.55122136497494 L 92.43229150772095 275.55122136497494 L 92.43229150772095 275.55122136497494 L 92.43229150772095 275.55122136497494 L 92.43229150772095 275.55122136497494 L 84.29852416515351 275.55122136497494 z"
                                                  cy="6.888755534124357" cx="146.42005183696747"
                                                  j="1" val="390" barHeight="268.6614658308506"
                                                  barWidth="11.133767342567443"></path>
                                            <path id="SvgjsPath1558"
                                                  d="M 147.92005183696747 275.55122136497494 L 147.92005183696747 74.88855534124374 C 147.92005183696747 71.88855534124374 150.92005183696747 68.88855534124374 153.92005183696747 68.88855534124374 L 153.92005183696747 68.88855534124374 C 154.98693550825118 68.88855534124374 156.0538191795349 71.88855534124374 156.0538191795349 74.88855534124374 L 156.0538191795349 275.55122136497494 z "
                                                  fill="rgba(93,135,255,0.85)" fill-opacity="1"
                                                  stroke="transparent" stroke-opacity="1"
                                                  stroke-linecap="butt" stroke-width="3"
                                                  stroke-dasharray="0" class="apexcharts-bar-area"
                                                  index="0" clip-path="url(#gridRectMask3y7kk3m1)"
                                                  pathTo="M 147.92005183696747 275.55122136497494 L 147.92005183696747 74.88855534124374 C 147.92005183696747 71.88855534124374 150.92005183696747 68.88855534124374 153.92005183696747 68.88855534124374 L 153.92005183696747 68.88855534124374 C 154.98693550825118 68.88855534124374 156.0538191795349 71.88855534124374 156.0538191795349 74.88855534124374 L 156.0538191795349 275.55122136497494 z "
                                                  pathFrom="M 147.92005183696747 275.55122136497494 L 147.92005183696747 275.55122136497494 L 156.0538191795349 275.55122136497494 L 156.0538191795349 275.55122136497494 L 156.0538191795349 275.55122136497494 L 156.0538191795349 275.55122136497494 L 156.0538191795349 275.55122136497494 L 147.92005183696747 275.55122136497494 z"
                                                  cy="68.88755534124374" cx="210.04157950878144"
                                                  j="2" val="300" barHeight="206.66266602373122"
                                                  barWidth="11.133767342567443"></path>
                                            <path id="SvgjsPath1560"
                                                  d="M 211.54157950878144 275.55122136497494 L 211.54157950878144 40.44477767062187 C 211.54157950878144 37.44477767062187 214.54157950878144 34.44477767062187 217.54157950878144 34.44477767062187 L 217.54157950878144 34.44477767062187 C 218.60846318006514 34.44477767062187 219.67534685134888 37.44477767062187 219.67534685134888 40.44477767062187 L 219.67534685134888 275.55122136497494 z "
                                                  fill="rgba(93,135,255,0.85)" fill-opacity="1"
                                                  stroke="transparent" stroke-opacity="1"
                                                  stroke-linecap="butt" stroke-width="3"
                                                  stroke-dasharray="0" class="apexcharts-bar-area"
                                                  index="0" clip-path="url(#gridRectMask3y7kk3m1)"
                                                  pathTo="M 211.54157950878144 275.55122136497494 L 211.54157950878144 40.44477767062187 C 211.54157950878144 37.44477767062187 214.54157950878144 34.44477767062187 217.54157950878144 34.44477767062187 L 217.54157950878144 34.44477767062187 C 218.60846318006514 34.44477767062187 219.67534685134888 37.44477767062187 219.67534685134888 40.44477767062187 L 219.67534685134888 275.55122136497494 z "
                                                  pathFrom="M 211.54157950878144 275.55122136497494 L 211.54157950878144 275.55122136497494 L 219.67534685134888 275.55122136497494 L 219.67534685134888 275.55122136497494 L 219.67534685134888 275.55122136497494 L 219.67534685134888 275.55122136497494 L 219.67534685134888 275.55122136497494 L 211.54157950878144 275.55122136497494 z"
                                                  cy="34.44377767062187" cx="273.6631071805954"
                                                  j="3" val="350" barHeight="241.1064436943531"
                                                  barWidth="11.133767342567443"></path>
                                            <path id="SvgjsPath1562"
                                                  d="M 275.1631071805954 275.55122136497494 L 275.1631071805954 12.889755534124358 C 275.1631071805954 9.889755534124358 278.1631071805954 6.889755534124357 281.1631071805954 6.889755534124357 L 281.1631071805954 6.889755534124357 C 282.2299908518791 6.889755534124357 283.29687452316284 9.889755534124358 283.29687452316284 12.889755534124358 L 283.29687452316284 275.55122136497494 z "
                                                  fill="rgba(93,135,255,0.85)" fill-opacity="1"
                                                  stroke="transparent" stroke-opacity="1"
                                                  stroke-linecap="butt" stroke-width="3"
                                                  stroke-dasharray="0" class="apexcharts-bar-area"
                                                  index="0" clip-path="url(#gridRectMask3y7kk3m1)"
                                                  pathTo="M 275.1631071805954 275.55122136497494 L 275.1631071805954 12.889755534124358 C 275.1631071805954 9.889755534124358 278.1631071805954 6.889755534124357 281.1631071805954 6.889755534124357 L 281.1631071805954 6.889755534124357 C 282.2299908518791 6.889755534124357 283.29687452316284 9.889755534124358 283.29687452316284 12.889755534124358 L 283.29687452316284 275.55122136497494 z "
                                                  pathFrom="M 275.1631071805954 275.55122136497494 L 275.1631071805954 275.55122136497494 L 283.29687452316284 275.55122136497494 L 283.29687452316284 275.55122136497494 L 283.29687452316284 275.55122136497494 L 283.29687452316284 275.55122136497494 L 283.29687452316284 275.55122136497494 L 275.1631071805954 275.55122136497494 z"
                                                  cy="6.888755534124357" cx="337.28463485240934"
                                                  j="4" val="390" barHeight="268.6614658308506"
                                                  barWidth="11.133767342567443"></path>
                                            <path id="SvgjsPath1564"
                                                  d="M 338.78463485240934 275.55122136497494 L 338.78463485240934 157.55362175073626 C 338.78463485240934 154.55362175073626 341.78463485240934 151.55362175073626 344.78463485240934 151.55362175073626 L 344.78463485240934 151.55362175073626 C 345.8515185236931 151.55362175073626 346.9184021949768 154.55362175073626 346.9184021949768 157.55362175073626 L 346.9184021949768 275.55122136497494 z "
                                                  fill="rgba(93,135,255,0.85)" fill-opacity="1"
                                                  stroke="transparent" stroke-opacity="1"
                                                  stroke-linecap="butt" stroke-width="3"
                                                  stroke-dasharray="0" class="apexcharts-bar-area"
                                                  index="0" clip-path="url(#gridRectMask3y7kk3m1)"
                                                  pathTo="M 338.78463485240934 275.55122136497494 L 338.78463485240934 157.55362175073626 C 338.78463485240934 154.55362175073626 341.78463485240934 151.55362175073626 344.78463485240934 151.55362175073626 L 344.78463485240934 151.55362175073626 C 345.8515185236931 151.55362175073626 346.9184021949768 154.55362175073626 346.9184021949768 157.55362175073626 L 346.9184021949768 275.55122136497494 z "
                                                  pathFrom="M 338.78463485240934 275.55122136497494 L 338.78463485240934 275.55122136497494 L 346.9184021949768 275.55122136497494 L 346.9184021949768 275.55122136497494 L 346.9184021949768 275.55122136497494 L 346.9184021949768 275.55122136497494 L 346.9184021949768 275.55122136497494 L 338.78463485240934 275.55122136497494 z"
                                                  cy="151.55262175073625" cx="400.9061625242233"
                                                  j="5" val="180" barHeight="123.99759961423872"
                                                  barWidth="11.133767342567443"></path>
                                            <path id="SvgjsPath1566"
                                                  d="M 402.4061625242233 275.55122136497494 L 402.4061625242233 37.000399903559696 C 402.4061625242233 34.000399903559696 405.4061625242233 31.000399903559693 408.4061625242233 31.000399903559693 L 408.4061625242233 31.000399903559693 C 409.47304619550704 31.000399903559693 410.53992986679077 34.000399903559696 410.53992986679077 37.000399903559696 L 410.53992986679077 275.55122136497494 z "
                                                  fill="rgba(93,135,255,0.85)" fill-opacity="1"
                                                  stroke="transparent" stroke-opacity="1"
                                                  stroke-linecap="butt" stroke-width="3"
                                                  stroke-dasharray="0" class="apexcharts-bar-area"
                                                  index="0" clip-path="url(#gridRectMask3y7kk3m1)"
                                                  pathTo="M 402.4061625242233 275.55122136497494 L 402.4061625242233 37.000399903559696 C 402.4061625242233 34.000399903559696 405.4061625242233 31.000399903559693 408.4061625242233 31.000399903559693 L 408.4061625242233 31.000399903559693 C 409.47304619550704 31.000399903559693 410.53992986679077 34.000399903559696 410.53992986679077 37.000399903559696 L 410.53992986679077 275.55122136497494 z "
                                                  pathFrom="M 402.4061625242233 275.55122136497494 L 402.4061625242233 275.55122136497494 L 410.53992986679077 275.55122136497494 L 410.53992986679077 275.55122136497494 L 410.53992986679077 275.55122136497494 L 410.53992986679077 275.55122136497494 L 410.53992986679077 275.55122136497494 L 402.4061625242233 275.55122136497494 z"
                                                  cy="30.99939990355969" cx="464.52769019603727"
                                                  j="6" val="355" barHeight="244.55082146141527"
                                                  barWidth="11.133767342567443"></path>
                                            <path id="SvgjsPath1568"
                                                  d="M 466.02769019603727 275.55122136497494 L 466.02769019603727 12.889755534124358 C 466.02769019603727 9.889755534124358 469.02769019603727 6.889755534124357 472.02769019603727 6.889755534124357 L 472.02769019603727 6.889755534124357 C 473.094573867321 6.889755534124357 474.16145753860474 9.889755534124358 474.16145753860474 12.889755534124358 L 474.16145753860474 275.55122136497494 z "
                                                  fill="rgba(93,135,255,0.85)" fill-opacity="1"
                                                  stroke="transparent" stroke-opacity="1"
                                                  stroke-linecap="butt" stroke-width="3"
                                                  stroke-dasharray="0" class="apexcharts-bar-area"
                                                  index="0" clip-path="url(#gridRectMask3y7kk3m1)"
                                                  pathTo="M 466.02769019603727 275.55122136497494 L 466.02769019603727 12.889755534124358 C 466.02769019603727 9.889755534124358 469.02769019603727 6.889755534124357 472.02769019603727 6.889755534124357 L 472.02769019603727 6.889755534124357 C 473.094573867321 6.889755534124357 474.16145753860474 9.889755534124358 474.16145753860474 12.889755534124358 L 474.16145753860474 275.55122136497494 z "
                                                  pathFrom="M 466.02769019603727 275.55122136497494 L 466.02769019603727 275.55122136497494 L 474.16145753860474 275.55122136497494 L 474.16145753860474 275.55122136497494 L 474.16145753860474 275.55122136497494 L 474.16145753860474 275.55122136497494 L 474.16145753860474 275.55122136497494 L 466.02769019603727 275.55122136497494 z"
                                                  cy="6.888755534124357" cx="528.1492178678512"
                                                  j="7" val="390" barHeight="268.6614658308506"
                                                  barWidth="11.133767342567443"></path>
                                            <g id="SvgjsG1552"
                                               class="apexcharts-bar-goals-markers"
                                               style="pointer-events: none">
                                            <g id="SvgjsG1553"
                                               className="apexcharts-bar-goals-groups"></g>
                                            <g id="SvgjsG1555"
                                               className="apexcharts-bar-goals-groups"></g>
                                            <g id="SvgjsG1557"
                                               className="apexcharts-bar-goals-groups"></g>
                                            <g id="SvgjsG1559"
                                               className="apexcharts-bar-goals-groups"></g>
                                            <g id="SvgjsG1561"
                                               className="apexcharts-bar-goals-groups"></g>
                                            <g id="SvgjsG1563"
                                               className="apexcharts-bar-goals-groups"></g>
                                            <g id="SvgjsG1565"
                                               className="apexcharts-bar-goals-groups"></g>
                                            <g id="SvgjsG1567"
                                               className="apexcharts-bar-goals-groups"></g>
                                            </g>
                                            </g>
                                            <g id="SvgjsG1569" class="apexcharts-series" rel="2"
                                               seriesName="Expensexthisxmonthx" data:realIndex="1">
                                            <path id="SvgjsPath1573"
                                                  d="M 31.810763835906982 275.55122136497494 L 31.810763835906982 88.66606640949249 C 31.810763835906982 85.66606640949249 34.81076383590698 82.66606640949249 37.81076383590698 82.66606640949249 L 37.81076383590698 82.66606640949249 C 38.8776475071907 82.66606640949249 39.94453117847443 85.66606640949249 39.94453117847443 88.66606640949249 L 39.94453117847443 275.55122136497494 z "
                                                  fill="rgba(73,190,255,0.85)" fill-opacity="1"
                                                  stroke="transparent" stroke-opacity="1"
                                                  stroke-linecap="butt" stroke-width="3"
                                                  stroke-dasharray="0" class="apexcharts-bar-area"
                                                  index="1" clip-path="url(#gridRectMask3y7kk3m1)"
                                                  pathTo="M 31.810763835906982 275.55122136497494 L 31.810763835906982 88.66606640949249 C 31.810763835906982 85.66606640949249 34.81076383590698 82.66606640949249 37.81076383590698 82.66606640949249 L 37.81076383590698 82.66606640949249 C 38.8776475071907 82.66606640949249 39.94453117847443 85.66606640949249 39.94453117847443 88.66606640949249 L 39.94453117847443 275.55122136497494 z "
                                                  pathFrom="M 31.810763835906982 275.55122136497494 L 31.810763835906982 275.55122136497494 L 39.94453117847443 275.55122136497494 L 39.94453117847443 275.55122136497494 L 39.94453117847443 275.55122136497494 L 39.94453117847443 275.55122136497494 L 39.94453117847443 275.55122136497494 L 31.810763835906982 275.55122136497494 z"
                                                  cy="82.66506640949248" cx="93.93229150772095"
                                                  j="0" val="280" barHeight="192.88515495548248"
                                                  barWidth="11.133767342567443"></path>
                                            <path id="SvgjsPath1575"
                                                  d="M 95.43229150772095 275.55122136497494 L 95.43229150772095 109.33233301186561 C 95.43229150772095 106.33233301186561 98.43229150772095 103.33233301186561 101.43229150772095 103.33233301186561 L 101.43229150772095 103.33233301186561 C 102.49917517900467 103.33233301186561 103.56605885028839 106.33233301186561 103.56605885028839 109.33233301186561 L 103.56605885028839 275.55122136497494 z "
                                                  fill="rgba(73,190,255,0.85)" fill-opacity="1"
                                                  stroke="transparent" stroke-opacity="1"
                                                  stroke-linecap="butt" stroke-width="3"
                                                  stroke-dasharray="0" class="apexcharts-bar-area"
                                                  index="1" clip-path="url(#gridRectMask3y7kk3m1)"
                                                  pathTo="M 95.43229150772095 275.55122136497494 L 95.43229150772095 109.33233301186561 C 95.43229150772095 106.33233301186561 98.43229150772095 103.33233301186561 101.43229150772095 103.33233301186561 L 101.43229150772095 103.33233301186561 C 102.49917517900467 103.33233301186561 103.56605885028839 106.33233301186561 103.56605885028839 109.33233301186561 L 103.56605885028839 275.55122136497494 z "
                                                  pathFrom="M 95.43229150772095 275.55122136497494 L 95.43229150772095 275.55122136497494 L 103.56605885028839 275.55122136497494 L 103.56605885028839 275.55122136497494 L 103.56605885028839 275.55122136497494 L 103.56605885028839 275.55122136497494 L 103.56605885028839 275.55122136497494 L 95.43229150772095 275.55122136497494 z"
                                                  cy="103.33133301186561" cx="157.5538191795349"
                                                  j="1" val="250" barHeight="172.21888835310935"
                                                  barWidth="11.133767342567443"></path>
                                            <path id="SvgjsPath1577"
                                                  d="M 159.0538191795349 275.55122136497494 L 159.0538191795349 57.66666650593282 C 159.0538191795349 54.66666650593282 162.0538191795349 51.66666650593282 165.0538191795349 51.66666650593282 L 165.0538191795349 51.66666650593282 C 166.12070285081865 51.66666650593282 167.18758652210235 54.66666650593282 167.18758652210235 57.66666650593282 L 167.18758652210235 275.55122136497494 z "
                                                  fill="rgba(73,190,255,0.85)" fill-opacity="1"
                                                  stroke="transparent" stroke-opacity="1"
                                                  stroke-linecap="butt" stroke-width="3"
                                                  stroke-dasharray="0" class="apexcharts-bar-area"
                                                  index="1" clip-path="url(#gridRectMask3y7kk3m1)"
                                                  pathTo="M 159.0538191795349 275.55122136497494 L 159.0538191795349 57.66666650593282 C 159.0538191795349 54.66666650593282 162.0538191795349 51.66666650593282 165.0538191795349 51.66666650593282 L 165.0538191795349 51.66666650593282 C 166.12070285081865 51.66666650593282 167.18758652210235 54.66666650593282 167.18758652210235 57.66666650593282 L 167.18758652210235 275.55122136497494 z "
                                                  pathFrom="M 159.0538191795349 275.55122136497494 L 159.0538191795349 275.55122136497494 L 167.18758652210235 275.55122136497494 L 167.18758652210235 275.55122136497494 L 167.18758652210235 275.55122136497494 L 167.18758652210235 275.55122136497494 L 167.18758652210235 275.55122136497494 L 159.0538191795349 275.55122136497494 z"
                                                  cy="51.66566650593282" cx="221.17534685134888"
                                                  j="2" val="325" barHeight="223.88455485904214"
                                                  barWidth="11.133767342567443"></path>
                                            <path id="SvgjsPath1579"
                                                  d="M 222.67534685134888 275.55122136497494 L 222.67534685134888 133.44297738130092 C 222.67534685134888 130.44297738130092 225.67534685134888 127.44297738130092 228.67534685134888 127.44297738130092 L 228.67534685134888 127.44297738130092 C 229.7422305226326 127.44297738130092 230.80911419391632 130.44297738130092 230.80911419391632 133.44297738130092 L 230.80911419391632 275.55122136497494 z "
                                                  fill="rgba(73,190,255,0.85)" fill-opacity="1"
                                                  stroke="transparent" stroke-opacity="1"
                                                  stroke-linecap="butt" stroke-width="3"
                                                  stroke-dasharray="0" class="apexcharts-bar-area"
                                                  index="1" clip-path="url(#gridRectMask3y7kk3m1)"
                                                  pathTo="M 222.67534685134888 275.55122136497494 L 222.67534685134888 133.44297738130092 C 222.67534685134888 130.44297738130092 225.67534685134888 127.44297738130092 228.67534685134888 127.44297738130092 L 228.67534685134888 127.44297738130092 C 229.7422305226326 127.44297738130092 230.80911419391632 130.44297738130092 230.80911419391632 133.44297738130092 L 230.80911419391632 275.55122136497494 z "
                                                  pathFrom="M 222.67534685134888 275.55122136497494 L 222.67534685134888 275.55122136497494 L 230.80911419391632 275.55122136497494 L 230.80911419391632 275.55122136497494 L 230.80911419391632 275.55122136497494 L 230.80911419391632 275.55122136497494 L 230.80911419391632 275.55122136497494 L 222.67534685134888 275.55122136497494 z"
                                                  cy="127.44197738130092" cx="284.79687452316284"
                                                  j="3" val="215" barHeight="148.10824398367404"
                                                  barWidth="11.133767342567443"></path>
                                            <path id="SvgjsPath1581"
                                                  d="M 286.29687452316284 275.55122136497494 L 286.29687452316284 109.33233301186561 C 286.29687452316284 106.33233301186561 289.29687452316284 103.33233301186561 292.29687452316284 103.33233301186561 L 292.29687452316284 103.33233301186561 C 293.3637581944466 103.33233301186561 294.4306418657303 106.33233301186561 294.4306418657303 109.33233301186561 L 294.4306418657303 275.55122136497494 z "
                                                  fill="rgba(73,190,255,0.85)" fill-opacity="1"
                                                  stroke="transparent" stroke-opacity="1"
                                                  stroke-linecap="butt" stroke-width="3"
                                                  stroke-dasharray="0" class="apexcharts-bar-area"
                                                  index="1" clip-path="url(#gridRectMask3y7kk3m1)"
                                                  pathTo="M 286.29687452316284 275.55122136497494 L 286.29687452316284 109.33233301186561 C 286.29687452316284 106.33233301186561 289.29687452316284 103.33233301186561 292.29687452316284 103.33233301186561 L 292.29687452316284 103.33233301186561 C 293.3637581944466 103.33233301186561 294.4306418657303 106.33233301186561 294.4306418657303 109.33233301186561 L 294.4306418657303 275.55122136497494 z "
                                                  pathFrom="M 286.29687452316284 275.55122136497494 L 286.29687452316284 275.55122136497494 L 294.4306418657303 275.55122136497494 L 294.4306418657303 275.55122136497494 L 294.4306418657303 275.55122136497494 L 294.4306418657303 275.55122136497494 L 294.4306418657303 275.55122136497494 L 286.29687452316284 275.55122136497494 z"
                                                  cy="103.33133301186561" cx="348.4184021949768"
                                                  j="4" val="250" barHeight="172.21888835310935"
                                                  barWidth="11.133767342567443"></path>
                                            <path id="SvgjsPath1583"
                                                  d="M 349.9184021949768 275.55122136497494 L 349.9184021949768 67.99979980711939 C 349.9184021949768 64.99979980711939 352.9184021949768 61.99979980711938 355.9184021949768 61.99979980711938 L 355.9184021949768 61.99979980711938 C 356.98528586626054 61.99979980711938 358.0521695375443 64.99979980711939 358.0521695375443 67.99979980711939 L 358.0521695375443 275.55122136497494 z "
                                                  fill="rgba(73,190,255,0.85)" fill-opacity="1"
                                                  stroke="transparent" stroke-opacity="1"
                                                  stroke-linecap="butt" stroke-width="3"
                                                  stroke-dasharray="0" class="apexcharts-bar-area"
                                                  index="1" clip-path="url(#gridRectMask3y7kk3m1)"
                                                  pathTo="M 349.9184021949768 275.55122136497494 L 349.9184021949768 67.99979980711939 C 349.9184021949768 64.99979980711939 352.9184021949768 61.99979980711938 355.9184021949768 61.99979980711938 L 355.9184021949768 61.99979980711938 C 356.98528586626054 61.99979980711938 358.0521695375443 64.99979980711939 358.0521695375443 67.99979980711939 L 358.0521695375443 275.55122136497494 z "
                                                  pathFrom="M 349.9184021949768 275.55122136497494 L 349.9184021949768 275.55122136497494 L 358.0521695375443 275.55122136497494 L 358.0521695375443 275.55122136497494 L 358.0521695375443 275.55122136497494 L 358.0521695375443 275.55122136497494 L 358.0521695375443 275.55122136497494 L 349.9184021949768 275.55122136497494 z"
                                                  cy="61.99879980711938" cx="412.03992986679077"
                                                  j="5" val="310" barHeight="213.55142155785558"
                                                  barWidth="11.133767342567443"></path>
                                            <path id="SvgjsPath1585"
                                                  d="M 413.53992986679077 275.55122136497494 L 413.53992986679077 88.66606640949249 C 413.53992986679077 85.66606640949249 416.53992986679077 82.66606640949249 419.53992986679077 82.66606640949249 L 419.53992986679077 82.66606640949249 C 420.6068135380745 82.66606640949249 421.67369720935824 85.66606640949249 421.67369720935824 88.66606640949249 L 421.67369720935824 275.55122136497494 z "
                                                  fill="rgba(73,190,255,0.85)" fill-opacity="1"
                                                  stroke="transparent" stroke-opacity="1"
                                                  stroke-linecap="butt" stroke-width="3"
                                                  stroke-dasharray="0" class="apexcharts-bar-area"
                                                  index="1" clip-path="url(#gridRectMask3y7kk3m1)"
                                                  pathTo="M 413.53992986679077 275.55122136497494 L 413.53992986679077 88.66606640949249 C 413.53992986679077 85.66606640949249 416.53992986679077 82.66606640949249 419.53992986679077 82.66606640949249 L 419.53992986679077 82.66606640949249 C 420.6068135380745 82.66606640949249 421.67369720935824 85.66606640949249 421.67369720935824 88.66606640949249 L 421.67369720935824 275.55122136497494 z "
                                                  pathFrom="M 413.53992986679077 275.55122136497494 L 413.53992986679077 275.55122136497494 L 421.67369720935824 275.55122136497494 L 421.67369720935824 275.55122136497494 L 421.67369720935824 275.55122136497494 L 421.67369720935824 275.55122136497494 L 421.67369720935824 275.55122136497494 L 413.53992986679077 275.55122136497494 z"
                                                  cy="82.66506640949248" cx="475.66145753860474"
                                                  j="6" val="280" barHeight="192.88515495548248"
                                                  barWidth="11.133767342567443"></path>
                                            <path id="SvgjsPath1587"
                                                  d="M 477.16145753860474 275.55122136497494 L 477.16145753860474 109.33233301186561 C 477.16145753860474 106.33233301186561 480.16145753860474 103.33233301186561 483.16145753860474 103.33233301186561 L 483.16145753860474 103.33233301186561 C 484.22834120988847 103.33233301186561 485.2952248811722 106.33233301186561 485.2952248811722 109.33233301186561 L 485.2952248811722 275.55122136497494 z "
                                                  fill="rgba(73,190,255,0.85)" fill-opacity="1"
                                                  stroke="transparent" stroke-opacity="1"
                                                  stroke-linecap="butt" stroke-width="3"
                                                  stroke-dasharray="0" class="apexcharts-bar-area"
                                                  index="1" clip-path="url(#gridRectMask3y7kk3m1)"
                                                  pathTo="M 477.16145753860474 275.55122136497494 L 477.16145753860474 109.33233301186561 C 477.16145753860474 106.33233301186561 480.16145753860474 103.33233301186561 483.16145753860474 103.33233301186561 L 483.16145753860474 103.33233301186561 C 484.22834120988847 103.33233301186561 485.2952248811722 106.33233301186561 485.2952248811722 109.33233301186561 L 485.2952248811722 275.55122136497494 z "
                                                  pathFrom="M 477.16145753860474 275.55122136497494 L 477.16145753860474 275.55122136497494 L 485.2952248811722 275.55122136497494 L 485.2952248811722 275.55122136497494 L 485.2952248811722 275.55122136497494 L 485.2952248811722 275.55122136497494 L 485.2952248811722 275.55122136497494 L 477.16145753860474 275.55122136497494 z"
                                                  cy="103.33133301186561" cx="539.2829852104187"
                                                  j="7" val="250" barHeight="172.21888835310935"
                                                  barWidth="11.133767342567443"></path>
                                            <g id="SvgjsG1571"
                                               class="apexcharts-bar-goals-markers"
                                               style="pointer-events: none">
                                            <g id="SvgjsG1572"
                                               className="apexcharts-bar-goals-groups"></g>
                                            <g id="SvgjsG1574"
                                               className="apexcharts-bar-goals-groups"></g>
                                            <g id="SvgjsG1576"
                                               className="apexcharts-bar-goals-groups"></g>
                                            <g id="SvgjsG1578"
                                               className="apexcharts-bar-goals-groups"></g>
                                            <g id="SvgjsG1580"
                                               className="apexcharts-bar-goals-groups"></g>
                                            <g id="SvgjsG1582"
                                               className="apexcharts-bar-goals-groups"></g>
                                            <g id="SvgjsG1584"
                                               className="apexcharts-bar-goals-groups"></g>
                                            <g id="SvgjsG1586"
                                               className="apexcharts-bar-goals-groups"></g>
                                            </g>
                                            </g>
                                            <g id="SvgjsG1551" class="apexcharts-datalabels"
                                               data:realIndex="0"></g>
                                            <g id="SvgjsG1570" class="apexcharts-datalabels"
                                               data:realIndex="1"></g>
                                            </g>
                                            <g id="SvgjsG1591" class="apexcharts-grid-borders">
                                            <line id="SvgjsLine1601" x1="0" y1="0"
                                                  x2="508.9722213745117" y2="0"
                                                  stroke="rgba(0,0,0,0.1)" stroke-dasharray="3"
                                                  stroke-linecap="butt" class="apexcharts-gridline">
                                            </line>
                                            <line id="SvgjsLine1605" x1="0" y1="275.55022136497496"
                                                  x2="508.9722213745117" y2="275.55022136497496"
                                                  stroke="rgba(0,0,0,0.1)" stroke-dasharray="3"
                                                  stroke-linecap="butt" class="apexcharts-gridline">
                                            </line>
                                            <line id="SvgjsLine1634" x1="0" y1="276.55022136497496"
                                                  x2="508.9722213745117" y2="276.55022136497496"
                                                  stroke="#e0e0e0" stroke-dasharray="0"
                                                  stroke-width="1" stroke-linecap="butt"></line>
                                            </g>
                                            <line id="SvgjsLine1652" x1="0" y1="0"
                                                  x2="508.9722213745117" y2="0" stroke="#b6b6b6"
                                                  stroke-dasharray="0" stroke-width="1"
                                                  stroke-linecap="butt" class="apexcharts-ycrosshairs">
                                            </line>
                                            <line id="SvgjsLine1653" x1="0" y1="0"
                                                  x2="508.9722213745117" y2="0" stroke-dasharray="0"
                                                  stroke-width="0" stroke-linecap="butt"
                                                  class="apexcharts-ycrosshairs-hidden"></line>
                                            <g id="SvgjsG1654" class="apexcharts-yaxis-annotations"></g>
                                            <g id="SvgjsG1655" class="apexcharts-xaxis-annotations"></g>
                                            <g id="SvgjsG1656" class="apexcharts-point-annotations"></g>
                                            </g>
                                            <g id="SvgjsG1635" class="apexcharts-yaxis" rel="0"
                                               transform="translate(20.02777862548828, 0)">
                                            <g id="SvgjsG1636" class="apexcharts-yaxis-texts-g"><text
                                                id="SvgjsText1638" font-family="inherit" x="20"
                                                y="31.4" text-anchor="end" dominant-baseline="auto"
                                                font-size="11px" font-weight="400" fill="#adb0bb"
                                                class="apexcharts-text apexcharts-yaxis-label grey--text lighten-2--text fill-color"
                                                style="font-family: inherit;">
                                            <tspan id="SvgjsTspan1639">400</tspan>
                                            <title>400</title>
                                            </text><text id="SvgjsText1641" font-family="inherit"
                                                         x="20" y="100.28755534124375" text-anchor="end"
                                                         dominant-baseline="auto" font-size="11px"
                                                         font-weight="400" fill="#adb0bb"
                                                         class="apexcharts-text apexcharts-yaxis-label grey--text lighten-2--text fill-color"
                                                         style="font-family: inherit;">
                                            <tspan id="SvgjsTspan1642">300</tspan>
                                            <title>300</title>
                                            </text><text id="SvgjsText1644" font-family="inherit"
                                                         x="20" y="169.17511068248749" text-anchor="end"
                                                         dominant-baseline="auto" font-size="11px"
                                                         font-weight="400" fill="#adb0bb"
                                                         class="apexcharts-text apexcharts-yaxis-label grey--text lighten-2--text fill-color"
                                                         style="font-family: inherit;">
                                            <tspan id="SvgjsTspan1645">200</tspan>
                                            <title>200</title>
                                            </text><text id="SvgjsText1647" font-family="inherit"
                                                         x="20" y="238.06266602373123" text-anchor="end"
                                                         dominant-baseline="auto" font-size="11px"
                                                         font-weight="400" fill="#adb0bb"
                                                         class="apexcharts-text apexcharts-yaxis-label grey--text lighten-2--text fill-color"
                                                         style="font-family: inherit;">
                                            <tspan id="SvgjsTspan1648">100</tspan>
                                            <title>100</title>
                                            </text><text id="SvgjsText1650" font-family="inherit"
                                                         x="20" y="306.95022136497494" text-anchor="end"
                                                         dominant-baseline="auto" font-size="11px"
                                                         font-weight="400" fill="#adb0bb"
                                                         class="apexcharts-text apexcharts-yaxis-label grey--text lighten-2--text fill-color"
                                                         style="font-family: inherit;">
                                            <tspan id="SvgjsTspan1651">0</tspan>
                                            <title>0</title>
                                            </text></g>
                                            </g>
                                            <g id="SvgjsG1539" class="apexcharts-annotations"></g>
                                            </svg>
                                            <div class="apexcharts-legend" style="max-height: 172.5px;"></div>
                                            <div class="apexcharts-tooltip apexcharts-theme-light">
                                                <div class="apexcharts-tooltip-title"
                                                     style="font-family: inherit; font-size: 12px;"></div>
                                                <div class="apexcharts-tooltip-series-group" style="order: 1;">
                                                    <span class="apexcharts-tooltip-marker"
                                                          style="background-color: rgb(93, 135, 255);"></span>
                                                    <div class="apexcharts-tooltip-text"
                                                         style="font-family: inherit; font-size: 12px;">
                                                        <div class="apexcharts-tooltip-y-group"><span
                                                                class="apexcharts-tooltip-text-y-label"></span><span
                                                                class="apexcharts-tooltip-text-y-value"></span>
                                                        </div>
                                                        <div class="apexcharts-tooltip-goals-group"><span
                                                                class="apexcharts-tooltip-text-goals-label"></span><span
                                                                class="apexcharts-tooltip-text-goals-value"></span>
                                                        </div>
                                                        <div class="apexcharts-tooltip-z-group"><span
                                                                class="apexcharts-tooltip-text-z-label"></span><span
                                                                class="apexcharts-tooltip-text-z-value"></span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="apexcharts-tooltip-series-group" style="order: 2;">
                                                    <span class="apexcharts-tooltip-marker"
                                                          style="background-color: rgb(73, 190, 255);"></span>
                                                    <div class="apexcharts-tooltip-text"
                                                         style="font-family: inherit; font-size: 12px;">
                                                        <div class="apexcharts-tooltip-y-group"><span
                                                                class="apexcharts-tooltip-text-y-label"></span><span
                                                                class="apexcharts-tooltip-text-y-value"></span>
                                                        </div>
                                                        <div class="apexcharts-tooltip-goals-group"><span
                                                                class="apexcharts-tooltip-text-goals-label"></span><span
                                                                class="apexcharts-tooltip-text-goals-value"></span>
                                                        </div>
                                                        <div class="apexcharts-tooltip-z-group"><span
                                                                class="apexcharts-tooltip-text-z-label"></span><span
                                                                class="apexcharts-tooltip-text-z-value"></span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div
                                                class="apexcharts-yaxistooltip apexcharts-yaxistooltip-0 apexcharts-yaxistooltip-left apexcharts-theme-light">
                                                <div class="apexcharts-yaxistooltip-text"></div>
                                            </div>
                                       
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 col-lg-6">
                            <div class="card card-chart">
                              
                                <div class="card-body p-4">
                                    <h5 class="card-title mb-9 fw-semibold">Yearly Breakup</h5>
                                    <div class="row align-items-center">
                                        <div class="col-8">
                                            <h4 class="fw-semibold mb-3">$36,358</h4>
                                            <div class="d-flex align-items-center mb-3">
                                                <span
                                                    class="me-1 rounded-circle bg-light-success round-20 d-flex align-items-center justify-content-center">
                                                    <i class="ti ti-arrow-up-left text-success"></i>
                                                </span>
                                                <p class="text-dark me-1 fs-3 mb-0">+9%</p>
                                                <p class="fs-3 mb-0">last year</p>
                                            </div>
                                            <div class="d-flex align-items-center">
                                                <div class="me-4">
                                                    <span
                                                        class="round-8 bg-primary rounded-circle me-2 d-inline-block"></span>
                                                    <span class="fs-2">2023</span>
                                                </div>
                                                <div>
                                                    <span
                                                        class="round-8 bg-light-primary rounded-circle me-2 d-inline-block"></span>
                                                    <span class="fs-2">2023</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <div class="d-flex justify-content-center">
                                                <div id="breakup" style="min-height: 128.7px;">
                                                    <div id="apexchartsj729bqzp"
                                                         class="apexcharts-canvas apexchartsj729bqzp apexcharts-theme-light"
                                                         style="width: 180px; height: 128.7px;"><svg
                                                            id="SvgjsSvg1721" width="180" height="128.7"
                                                            xmlns="http://www.w3.org/2000/svg" version="1.1"
                                                            xmlns:xlink="http://www.w3.org/1999/xlink"
                                                            xmlns:svgjs="http://svgjs.dev"
                                                            class="apexcharts-svg" xmlns:data="ApexChartsNS"
                                                            transform="translate(0, 0)"
                                                            style="background: transparent;">
                                                        <g id="SvgjsG1723"
                                                           class="apexcharts-inner apexcharts-graphical"
                                                           transform="translate(28, 0)">
                                                        <defs id="SvgjsDefs1722">
                                                        <clipPath id="gridRectMaskj729bqzp">
                                                            <rect id="SvgjsRect1725" width="132"
                                                                  height="150" x="-3" y="-1" rx="0"
                                                                  ry="0" opacity="1" stroke-width="0"
                                                                  stroke="none" stroke-dasharray="0"
                                                                  fill="#fff"></rect>
                                                        </clipPath>
                                                        <clipPath id="forecastMaskj729bqzp">
                                                        </clipPath>
                                                        <clipPath id="nonForecastMaskj729bqzp">
                                                        </clipPath>
                                                        <clipPath id="gridRectMarkerMaskj729bqzp">
                                                            <rect id="SvgjsRect1726" width="130"
                                                                  height="152" x="-2" y="-2" rx="0"
                                                                  ry="0" opacity="1" stroke-width="0"
                                                                  stroke="none" stroke-dasharray="0"
                                                                  fill="#fff"></rect>
                                                        </clipPath>
                                                        </defs>
                                                        <g id="SvgjsG1727" class="apexcharts-pie">
                                                        <g id="SvgjsG1728"
                                                           transform="translate(0, 0) scale(1)">
                                                        <circle id="SvgjsCircle1729"
                                                                r="41.59756097560976" cx="63"
                                                                cy="63" fill="transparent"></circle>
                                                        <g id="SvgjsG1730"
                                                           class="apexcharts-slices">
                                                        <g id="SvgjsG1731"
                                                           class="apexcharts-series apexcharts-pie-series"
                                                           seriesName="2022" rel="1"
                                                           data:realIndex="0">
                                                        <path id="SvgjsPath1732"
                                                              d="M 63 7.536585365853654 A 55.463414634146346 55.463414634146346 0 0 1 103.6849453198706 100.69516662913668 L 93.51370898990294 91.27137497185251 A 41.59756097560976 41.59756097560976 0 0 0 63 21.40243902439024 L 63 7.536585365853654 z"
                                                              fill="rgba(93,135,255,1)"
                                                              fill-opacity="1"
                                                              stroke-opacity="1"
                                                              stroke-linecap="butt"
                                                              stroke-width="0"
                                                              stroke-dasharray="0"
                                                              class="apexcharts-pie-area apexcharts-donut-slice-0"
                                                              index="0" j="0"
                                                              data:angle="132.81553398058253"
                                                              data:startAngle="0"
                                                              data:strokeWidth="0"
                                                              data:value="38"
                                                              data:pathOrig="M 63 7.536585365853654 A 55.463414634146346 55.463414634146346 0 0 1 103.6849453198706 100.69516662913668 L 93.51370898990294 91.27137497185251 A 41.59756097560976 41.59756097560976 0 0 0 63 21.40243902439024 L 63 7.536585365853654 z">
                                                        </path>
                                                        </g>
                                                        <g id="SvgjsG1733"
                                                           class="apexcharts-series apexcharts-pie-series"
                                                           seriesName="2021" rel="2"
                                                           data:realIndex="1">
                                                        <path id="SvgjsPath1734"
                                                              d="M 103.6849453198706 100.69516662913668 A 55.463414634146346 55.463414634146346 0 0 1 7.594622861729029 60.463359102040855 L 21.445967146296773 61.097519326530644 A 41.59756097560976 41.59756097560976 0 0 0 93.51370898990294 91.27137497185251 L 103.6849453198706 100.69516662913668 z"
                                                              fill="rgba(236,242,255,1)"
                                                              fill-opacity="1"
                                                              stroke-opacity="1"
                                                              stroke-linecap="butt"
                                                              stroke-width="0"
                                                              stroke-dasharray="0"
                                                              class="apexcharts-pie-area apexcharts-donut-slice-1"
                                                              index="0" j="1"
                                                              data:angle="139.8058252427184"
                                                              data:startAngle="132.81553398058253"
                                                              data:strokeWidth="0"
                                                              data:value="40"
                                                              data:pathOrig="M 103.6849453198706 100.69516662913668 A 55.463414634146346 55.463414634146346 0 0 1 7.594622861729029 60.463359102040855 L 21.445967146296773 61.097519326530644 A 41.59756097560976 41.59756097560976 0 0 0 93.51370898990294 91.27137497185251 L 103.6849453198706 100.69516662913668 z">
                                                        </path>
                                                        </g>
                                                        <g id="SvgjsG1735"
                                                           class="apexcharts-series apexcharts-pie-series"
                                                           seriesName="2020" rel="3"
                                                           data:realIndex="2">
                                                        <path id="SvgjsPath1736"
                                                              d="M 7.594622861729029 60.463359102040855 A 55.463414634146346 55.463414634146346 0 0 1 62.99031980805149 7.536586210609762 L 62.99273985603862 21.402439657957324 A 41.59756097560976 41.59756097560976 0 0 0 21.445967146296773 61.097519326530644 L 7.594622861729029 60.463359102040855 z"
                                                              fill="rgba(249,249,253,1)"
                                                              fill-opacity="1"
                                                              stroke-opacity="1"
                                                              stroke-linecap="butt"
                                                              stroke-width="0"
                                                              stroke-dasharray="0"
                                                              class="apexcharts-pie-area apexcharts-donut-slice-2"
                                                              index="0" j="2"
                                                              data:angle="87.37864077669906"
                                                              data:startAngle="272.62135922330094"
                                                              data:strokeWidth="0"
                                                              data:value="25"
                                                              data:pathOrig="M 7.594622861729029 60.463359102040855 A 55.463414634146346 55.463414634146346 0 0 1 62.99031980805149 7.536586210609762 L 62.99273985603862 21.402439657957324 A 41.59756097560976 41.59756097560976 0 0 0 21.445967146296773 61.097519326530644 L 7.594622861729029 60.463359102040855 z">
                                                        </path>
                                                        </g>
                                                        </g>
                                                        </g>
                                                        </g>
                                                        <line id="SvgjsLine1737" x1="0" y1="0" x2="126"
                                                              y2="0" stroke="#b6b6b6" stroke-dasharray="0"
                                                              stroke-width="1" stroke-linecap="butt"
                                                              class="apexcharts-ycrosshairs"></line>
                                                        <line id="SvgjsLine1738" x1="0" y1="0" x2="126"
                                                              y2="0" stroke-dasharray="0" stroke-width="0"
                                                              stroke-linecap="butt"
                                                              class="apexcharts-ycrosshairs-hidden">
                                                        </line>
                                                        </g>
                                                        <g id="SvgjsG1724" class="apexcharts-annotations">
                                                        </g>
                                                        </svg>
                                                        <div class="apexcharts-legend"></div>
                                                        <div class="apexcharts-tooltip apexcharts-theme-dark"
                                                             style="left: -17.6181px; top: 5.40277px;">
                                                            <div class="apexcharts-tooltip-series-group apexcharts-active"
                                                                 style="order: 1; display: flex;"><span
                                                                    class="apexcharts-tooltip-marker"
                                                                    style="background-color: rgb(249, 249, 253);"></span>
                                                                <div class="apexcharts-tooltip-text"
                                                                     style="font-size: 12px;">
                                                                    <div class="apexcharts-tooltip-y-group">
                                                                        <span
                                                                            class="apexcharts-tooltip-text-y-label">2020:
                                                                        </span><span
                                                                            class="apexcharts-tooltip-text-y-value">25</span>
                                                                    </div>
                                                                    <div class="apexcharts-tooltip-goals-group">
                                                                        <span
                                                                            class="apexcharts-tooltip-text-goals-label"></span><span
                                                                            class="apexcharts-tooltip-text-goals-value"></span>
                                                                    </div>
                                                                    <div class="apexcharts-tooltip-z-group">
                                                                        <span
                                                                            class="apexcharts-tooltip-text-z-label"></span><span
                                                                            class="apexcharts-tooltip-text-z-value"></span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="apexcharts-tooltip-series-group"
                                                                 style="order: 2; display: none;"><span
                                                                    class="apexcharts-tooltip-marker"
                                                                    style="background-color: rgb(249, 249, 253);"></span>
                                                                <div class="apexcharts-tooltip-text"
                                                                     style="font-size: 12px;">
                                                                    <div class="apexcharts-tooltip-y-group">
                                                                        <span
                                                                            class="apexcharts-tooltip-text-y-label">2020:
                                                                        </span><span
                                                                            class="apexcharts-tooltip-text-y-value">25</span>
                                                                    </div>
                                                                    <div class="apexcharts-tooltip-goals-group">
                                                                        <span
                                                                            class="apexcharts-tooltip-text-goals-label"></span><span
                                                                            class="apexcharts-tooltip-text-goals-value"></span>
                                                                    </div>
                                                                    <div class="apexcharts-tooltip-z-group">
                                                                        <span
                                                                            class="apexcharts-tooltip-text-z-label"></span><span
                                                                            class="apexcharts-tooltip-text-z-value"></span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="apexcharts-tooltip-series-group"
                                                                 style="order: 3; display: none;"><span
                                                                    class="apexcharts-tooltip-marker"
                                                                    style="background-color: rgb(249, 249, 253);"></span>
                                                                <div class="apexcharts-tooltip-text"
                                                                     style="font-size: 12px;">
                                                                    <div class="apexcharts-tooltip-y-group">
                                                                        <span
                                                                            class="apexcharts-tooltip-text-y-label">2020:
                                                                        </span><span
                                                                            class="apexcharts-tooltip-text-y-value">25</span>
                                                                    </div>
                                                                    <div class="apexcharts-tooltip-goals-group">
                                                                        <span
                                                                            class="apexcharts-tooltip-text-goals-label"></span><span
                                                                            class="apexcharts-tooltip-text-goals-value"></span>
                                                                    </div>
                                                                    <div class="apexcharts-tooltip-z-group">
                                                                        <span
                                                                            class="apexcharts-tooltip-text-z-label"></span><span
                                                                            class="apexcharts-tooltip-text-z-value"></span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <!-- Monthly Earnings -->
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="row alig n-items-start">
                                                <div class="col-8">
                                                    <h5 class="card-title mb-9 fw-semibold"> Monthly Earnings
                                                    </h5>
                                                    <h4 class="fw-semibold mb-3">$6,820</h4>
                                                    <div class="d-flex align-items-center pb-1">
                                                        <span
                                                            class="me-2 rounded-circle bg-light-danger round-20 d-flex align-items-center justify-content-center">
                                                            <i class="ti ti-arrow-down-right text-danger"></i>
                                                        </span>
                                                        <p class="text-dark me-1 fs-3 mb-0">+9%</p>
                                                        <p class="fs-3 mb-0">last year</p>
                                                    </div>
                                                </div>
                                                <div class="col-4">
                                                    <div class="d-flex justify-content-end">
                                                        <div
                                                            class="text-white bg-secondary rounded-circle p-6 d-flex align-items-center justify-content-center">
                                                            <i class="ti ti-currency-dollar fs-6"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="earning" style="min-height: 60px;">
                                            <div id="apexchartssparkline3"
                                                 class="apexcharts-canvas apexchartssparkline3 apexcharts-theme-light"
                                                 style="width: 303px; height: 60px;"><svg id="SvgjsSvg1676"
                                                                                     width="303" height="60" xmlns="http://www.w3.org/2000/svg"
                                                                                     version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink"
                                                                                     xmlns:svgjs="http://svgjs.dev" class="apexcharts-svg"
                                                                                     xmlns:data="ApexChartsNS" transform="translate(0, 0)"
                                                                                     style="background: transparent;">
                                                <g id="SvgjsG1678"
                                                   class="apexcharts-inner apexcharts-graphical"
                                                   transform="translate(0, 0)">
                                                <defs id="SvgjsDefs1677">
                                                <clipPath id="gridRectMask4nbfsuia">
                                                    <rect id="SvgjsRect1683" width="309" height="62"
                                                          x="-3" y="-1" rx="0" ry="0" opacity="1"
                                                          stroke-width="0" stroke="none"
                                                          stroke-dasharray="0" fill="#fff"></rect>
                                                </clipPath>
                                                <clipPath id="forecastMask4nbfsuia"></clipPath>
                                                <clipPath id="nonForecastMask4nbfsuia"></clipPath>
                                                <clipPath id="gridRectMarkerMask4nbfsuia">
                                                    <rect id="SvgjsRect1684" width="307" height="64"
                                                          x="-2" y="-2" rx="0" ry="0" opacity="1"
                                                          stroke-width="0" stroke="none"
                                                          stroke-dasharray="0" fill="#fff"></rect>
                                                </clipPath>
                                                </defs>
                                                <line id="SvgjsLine1682" x1="151" y1="0" x2="151"
                                                      y2="60" stroke="#b6b6b6" stroke-dasharray="3"
                                                      stroke-linecap="butt" class="apexcharts-xcrosshairs"
                                                      x="151" y="0" width="1" height="60" fill="#b1b9c4"
                                                      filter="none" fill-opacity="0.9" stroke-width="1">
                                                </line>
                                                <g id="SvgjsG1705" class="apexcharts-xaxis"
                                                   transform="translate(0, 0)">
                                                <g id="SvgjsG1706" class="apexcharts-xaxis-texts-g"
                                                   transform="translate(0, -4)"></g>
                                                </g>
                                                <g id="SvgjsG1691" class="apexcharts-grid">
                                                <g id="SvgjsG1692"
                                                   class="apexcharts-gridlines-horizontal"
                                                   style="display: none;">
                                                <line id="SvgjsLine1696" x1="0"
                                                      y1="8.571428571428571" x2="303"
                                                      y2="8.571428571428571" stroke="#e0e0e0"
                                                      stroke-dasharray="0" stroke-linecap="butt"
                                                      class="apexcharts-gridline"></line>
                                                <line id="SvgjsLine1697" x1="0"
                                                      y1="17.142857142857142" x2="303"
                                                      y2="17.142857142857142" stroke="#e0e0e0"
                                                      stroke-dasharray="0" stroke-linecap="butt"
                                                      class="apexcharts-gridline"></line>
                                                <line id="SvgjsLine1698" x1="0"
                                                      y1="25.714285714285715" x2="303"
                                                      y2="25.714285714285715" stroke="#e0e0e0"
                                                      stroke-dasharray="0" stroke-linecap="butt"
                                                      class="apexcharts-gridline"></line>
                                                <line id="SvgjsLine1699" x1="0"
                                                      y1="34.285714285714285" x2="303"
                                                      y2="34.285714285714285" stroke="#e0e0e0"
                                                      stroke-dasharray="0" stroke-linecap="butt"
                                                      class="apexcharts-gridline"></line>
                                                <line id="SvgjsLine1700" x1="0"
                                                      y1="42.857142857142854" x2="303"
                                                      y2="42.857142857142854" stroke="#e0e0e0"
                                                      stroke-dasharray="0" stroke-linecap="butt"
                                                      class="apexcharts-gridline"></line>
                                                <line id="SvgjsLine1701" x1="0"
                                                      y1="51.42857142857142" x2="303"
                                                      y2="51.42857142857142" stroke="#e0e0e0"
                                                      stroke-dasharray="0" stroke-linecap="butt"
                                                      class="apexcharts-gridline"></line>
                                                <line id="SvgjsLine1702" x1="0"
                                                      y1="59.99999999999999" x2="303"
                                                      y2="59.99999999999999" stroke="#e0e0e0"
                                                      stroke-dasharray="0" stroke-linecap="butt"
                                                      class="apexcharts-gridline"></line>
                                                </g>
                                                <g id="SvgjsG1693"
                                                   class="apexcharts-gridlines-vertical"
                                                   style="display: none;"></g>
                                                <line id="SvgjsLine1704" x1="0" y1="60" x2="303"
                                                      y2="60" stroke="transparent"
                                                      stroke-dasharray="0" stroke-linecap="butt">
                                                </line>
                                                <line id="SvgjsLine1703" x1="0" y1="1" x2="0"
                                                      y2="60" stroke="transparent"
                                                      stroke-dasharray="0" stroke-linecap="butt">
                                                </line>
                                                </g>
                                                <g id="SvgjsG1685"
                                                   class="apexcharts-area-series apexcharts-plot-series">
                                                <g id="SvgjsG1686" class="apexcharts-series"
                                                   seriesName="Earnings" data:longestSeries="true"
                                                   rel="1" data:realIndex="0">
                                                <path id="SvgjsPath1689"
                                                      d="M 0 60 L 0 38.57142857142857C 17.674999999999997 38.57142857142857 32.825 3.4285714285714306 50.5 3.4285714285714306C 68.175 3.4285714285714306 83.325 42.85714285714286 101 42.85714285714286C 118.675 42.85714285714286 133.825 25.714285714285715 151.5 25.714285714285715C 169.175 25.714285714285715 184.325 49.714285714285715 202 49.714285714285715C 219.675 49.714285714285715 234.825 10.285714285714292 252.5 10.285714285714292C 270.175 10.285714285714292 285.325 42.85714285714286 303 42.85714285714286C 303 42.85714285714286 303 42.85714285714286 303 60M 303 42.85714285714286z"
                                                      fill="rgba(73,190,255,0.05)"
                                                      fill-opacity="1" stroke-opacity="1"
                                                      stroke-linecap="butt" stroke-width="0"
                                                      stroke-dasharray="0" class="apexcharts-area"
                                                      index="0"
                                                      clip-path="url(#gridRectMask4nbfsuia)"
                                                      pathTo="M 0 60 L 0 38.57142857142857C 17.674999999999997 38.57142857142857 32.825 3.4285714285714306 50.5 3.4285714285714306C 68.175 3.4285714285714306 83.325 42.85714285714286 101 42.85714285714286C 118.675 42.85714285714286 133.825 25.714285714285715 151.5 25.714285714285715C 169.175 25.714285714285715 184.325 49.714285714285715 202 49.714285714285715C 219.675 49.714285714285715 234.825 10.285714285714292 252.5 10.285714285714292C 270.175 10.285714285714292 285.325 42.85714285714286 303 42.85714285714286C 303 42.85714285714286 303 42.85714285714286 303 60M 303 42.85714285714286z"
                                                      pathFrom="M -1 60 L -1 60 L 50.5 60 L 101 60 L 151.5 60 L 202 60 L 252.5 60 L 303 60">
                                                </path>
                                                <path id="SvgjsPath1690"
                                                      d="M 0 38.57142857142857C 17.674999999999997 38.57142857142857 32.825 3.4285714285714306 50.5 3.4285714285714306C 68.175 3.4285714285714306 83.325 42.85714285714286 101 42.85714285714286C 118.675 42.85714285714286 133.825 25.714285714285715 151.5 25.714285714285715C 169.175 25.714285714285715 184.325 49.714285714285715 202 49.714285714285715C 219.675 49.714285714285715 234.825 10.285714285714292 252.5 10.285714285714292C 270.175 10.285714285714292 285.325 42.85714285714286 303 42.85714285714286"
                                                      fill="none" fill-opacity="1"
                                                      stroke="#49beff" stroke-opacity="1"
                                                      stroke-linecap="butt" stroke-width="2"
                                                      stroke-dasharray="0" class="apexcharts-area"
                                                      index="0"
                                                      clip-path="url(#gridRectMask4nbfsuia)"
                                                      pathTo="M 0 38.57142857142857C 17.674999999999997 38.57142857142857 32.825 3.4285714285714306 50.5 3.4285714285714306C 68.175 3.4285714285714306 83.325 42.85714285714286 101 42.85714285714286C 118.675 42.85714285714286 133.825 25.714285714285715 151.5 25.714285714285715C 169.175 25.714285714285715 184.325 49.714285714285715 202 49.714285714285715C 219.675 49.714285714285715 234.825 10.285714285714292 252.5 10.285714285714292C 270.175 10.285714285714292 285.325 42.85714285714286 303 42.85714285714286"
                                                      pathFrom="M -1 60 L -1 60 L 50.5 60 L 101 60 L 151.5 60 L 202 60 L 252.5 60 L 303 60"
                                                      fill-rule="evenodd"></path>
                                                <g id="SvgjsG1687"
                                                   class="apexcharts-series-markers-wrap"
                                                   data:realIndex="0">
                                                <g class="apexcharts-series-markers">
                                                <circle id="SvgjsCircle1720" r="0"
                                                        cx="151.5" cy="25.714285714285715"
                                                        class="apexcharts-marker wo3pw2hluf no-pointer-events"
                                                        stroke="#ffffff" fill="#49beff"
                                                        fill-opacity="1" stroke-width="2"
                                                        stroke-opacity="0.9"
                                                        default-marker-size="0"></circle>
                                                </g>
                                                </g>
                                                </g>
                                                <g id="SvgjsG1688" class="apexcharts-datalabels"
                                                   data:realIndex="0"></g>
                                                </g>
                                                <g id="SvgjsG1694" class="apexcharts-grid-borders"
                                                   style="display: none;">
                                                <line id="SvgjsLine1695" x1="0" y1="0" x2="303"
                                                      y2="0" stroke="#e0e0e0" stroke-dasharray="0"
                                                      stroke-linecap="butt"
                                                      class="apexcharts-gridline"></line>
                                                </g>
                                                <line id="SvgjsLine1715" x1="0" y1="0" x2="303" y2="0"
                                                      stroke="#b6b6b6" stroke-dasharray="0"
                                                      stroke-width="1" stroke-linecap="butt"
                                                      class="apexcharts-ycrosshairs"></line>
                                                <line id="SvgjsLine1716" x1="0" y1="0" x2="303" y2="0"
                                                      stroke-dasharray="0" stroke-width="0"
                                                      stroke-linecap="butt"
                                                      class="apexcharts-ycrosshairs-hidden"></line>
                                                <g id="SvgjsG1717" class="apexcharts-yaxis-annotations">
                                                </g>
                                                <g id="SvgjsG1718" class="apexcharts-xaxis-annotations">
                                                </g>
                                                <g id="SvgjsG1719" class="apexcharts-point-annotations">
                                                </g>
                                                </g>
                                                <rect id="SvgjsRect1681" width="0" height="0" x="0" y="0"
                                                      rx="0" ry="0" opacity="1" stroke-width="0" stroke="none"
                                                      stroke-dasharray="0" fill="#fefefe"></rect>
                                                <g id="SvgjsG1714" class="apexcharts-yaxis" rel="0"
                                                   transform="translate(-18, 0)"></g>
                                                <g id="SvgjsG1679" class="apexcharts-annotations"></g>
                                                </svg>
                                                <div class="apexcharts-legend" style="max-height: 30px;"></div>
                                                <div class="apexcharts-tooltip apexcharts-theme-dark"
                                                     style="left: 185.361px; top: 0px;">
                                                    <div class="apexcharts-tooltip-series-group apexcharts-active"
                                                         style="order: 1; display: flex;"><span
                                                            class="apexcharts-tooltip-marker"
                                                            style="background-color: rgb(73, 190, 255);"></span>
                                                        <div class="apexcharts-tooltip-text"
                                                             style="font-size: 12px;">
                                                            <div class="apexcharts-tooltip-y-group"><span
                                                                    class="apexcharts-tooltip-text-y-label">Earnings:
                                                                </span><span
                                                                    class="apexcharts-tooltip-text-y-value">40</span>
                                                            </div>
                                                            <div class="apexcharts-tooltip-goals-group"><span
                                                                    class="apexcharts-tooltip-text-goals-label"></span><span
                                                                    class="apexcharts-tooltip-text-goals-value"></span>
                                                            </div>
                                                            <div class="apexcharts-tooltip-z-group"><span
                                                                    class="apexcharts-tooltip-text-z-label"></span><span
                                                                    class="apexcharts-tooltip-text-z-value"></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div
                                                    class="apexcharts-yaxistooltip apexcharts-yaxistooltip-0 apexcharts-yaxistooltip-left apexcharts-theme-dark">
                                                    <div class="apexcharts-yaxistooltip-text"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 d-flex">
                            <div class="card card-table flex-fill">
                                <div class="card-header">
                                    <h4 class="card-title float-left mt-2">Booking</h4>
                                    <button type="button" class="btn btn-primary float-right veiwbutton">Veiw
                                        All</button>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-hover table-center">
                                            <thead>
                                                <tr>
                                                    <th>Booking ID</th>
                                                    <th>Name</th>
                                                    <th>Email ID</th>
                                                    <th>Aadhar Number</th>
                                                    <th class="text-center">Room Type</th>
                                                    <th class="text-right">Number</th>
                                                    <th class="text-center">Status</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td class="text-nowrap">
                                                        <div>BKG-0001</div>
                                                    </td>
                                                    <td class="text-nowrap">Tommy Bernal</td>
                                                    <td><a href="/cdn-cgi/l/email-protection"
                                                           class="__cf_email__"
                                                           data-cfemail="3743585a5a4e55524559565b77524f565a475b521954585a">[email&#160;protected]</a>
                                                    </td>
                                                    <td>12414786454545</td>
                                                    <td class="text-center">Double</td>
                                                    <td class="text-right">
                                                        <div>631-254-6480</div>
                                                    </td>
                                                    <td class="text-center"> <span
                                                            class="badge badge-pill bg-success inv-badge">INACTIVE</span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="text-nowrap">
                                                        <div>BKG-0002</div>
                                                    </td>
                                                    <td class="text-nowrap">Ellen Thill</td>
                                                    <td><a href="/cdn-cgi/l/email-protection"
                                                           class="__cf_email__"
                                                           data-cfemail="89fbe0eae1e8fbedebfbe6ebfafdc9ecf1e8e4f9e5eca7eae6e4">[email&#160;protected]</a>
                                                    </td>
                                                    <td>5456223232322</td>
                                                    <td class="text-center">Double</td>
                                                    <td class="text-right">
                                                        <div>830-468-1042</div>
                                                    </td>
                                                    <td class="text-center"> <span
                                                            class="badge badge-pill bg-success inv-badge">INACTIVE</span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="text-nowrap">
                                                        <div>BKG-0003</div>
                                                    </td>
                                                    <td class="text-nowrap">Corina Kelsey</td>
                                                    <td><a href="/cdn-cgi/l/email-protection"
                                                           class="__cf_email__"
                                                           data-cfemail="76131a1a1318021e1f1a1a36130e171b061a135815191b">[email&#160;protected]</a>
                                                    </td>
                                                    <td>454543232625</td>
                                                    <td class="text-center">Single</td>
                                                    <td class="text-right">
                                                        <div>508-335-5531</div>
                                                    </td>
                                                    <td class="text-center"> <span
                                                            class="badge badge-pill bg-success inv-badge">INACTIVE</span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="text-nowrap">
                                                        <div>BKG-0004</div>
                                                    </td>
                                                    <td class="text-nowrap">Carolyn Lane</td>
                                                    <td><a href="/cdn-cgi/l/email-protection"
                                                           class="__cf_email__"
                                                           data-cfemail="50333f22393e313b353c23352910373d31393c7e333f3d">[email&#160;protected]</a>
                                                    </td>
                                                    <td>2368989562621</td>
                                                    <td class="text-center">Double</td>
                                                    <td class="text-right">
                                                        <div>262-260-1170</div>
                                                    </td>
                                                    <td class="text-center"> <span
                                                            class="badge badge-pill bg-success inv-badge">INACTIVE</span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="text-nowrap">
                                                        <div>BKG-0005</div>
                                                    </td>
                                                    <td class="text-nowrap">Denise</td>
                                                    <td><a href="/cdn-cgi/l/email-protection"
                                                           class="__cf_email__"
                                                           data-cfemail="1c7f7d6e73706572707d72795c7b717d7570327f7371">[email&#160;protected]</a>
                                                    </td>
                                                    <td>3245455582287</td>
                                                    <td class="text-center">Single</td>
                                                    <td class="text-right">
                                                        <div>570-458-0070</div>
                                                    </td>
                                                    <td class="text-center"> <span
                                                            class="badge badge-pill bg-success inv-badge">INACTIVE</span>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
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
            $(document).ready(function () {
                lineChart();
                donutChart();
                pieChart();

                $(window).resize(function () {
                    window.lineChart.redraw();
                    window.donutChart.redraw();
                    window.pieChart.redraw();
                });
            });

            function lineChart() {
                window.lineChart = Morris.Line({
                    element: 'line-chart',
                    data: [
                        {y: '2006', a: 100, b: 90},
                        {y: '2007', a: 75, b: 65},
                        {y: '2008', a: 50, b: 40},
                        {y: '2009', a: 75, b: 65},
                        {y: '2010', a: 50, b: 40},
                        {y: '2011', a: 75, b: 65},
                        {y: '2012', a: 100, b: 90}
                    ],
                    xkey: 'y',
                    ykeys: ['a', 'b'],
                    labels: ['Series aA', 'Series B'],
                    lineColors: ['#009688', '#cdc6c6'],
                    lineWidth: '3px',
                    resize: true,
                    redraw: true
                });
            }

            function donutChart() {
                window.donutChart = Morris.Donut({
                    element: 'donut-chart',
                    data: [
                        {label: "Normal Room", value: 50},
                        {label: "Ac Cage", value: 25},
                        {label: "Special cage", value: 5},
                        {label: "cage", value: 10},
                        {label: "cage", value: 10},
                    ],
                    backgroundColor: '#f2f5fa',
                    labelColor: '#009688',
                    colors: ['#0BA462', '#39B580', '#67C69D', '#95D7BB'],
                    resize: true,
                    redraw: true
                });
            }

            function pieChart() {
                var paper = Raphael("pie-chart");
                paper.piechart(100, 100, 90, [18.373, 18.686, 2.867, 23.991, 9.592, 0.213], {
                    legend: ["Windows/Windows Live", "Server/Tools", "Online Services", "Business", "Entertainment/Devices", "Unallocated/Other"]
                });
            }
        </script>

    </body>

</html>