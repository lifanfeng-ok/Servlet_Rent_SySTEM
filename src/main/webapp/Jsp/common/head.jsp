<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8"/>
        <meta name="author" content="Drizvato"/>
        <meta name="viewport"
              content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>

        <title>Rental house Web</title>

        <!-- Custom CSS -->
        <link href="/final/assets/css/styles.css?v=20210423" rel="stylesheet">
        <!-- Custom Color Option -->
        <link href="/final/assets/css/colors.css" rel="stylesheet">
    </head>

    <body class="yellow-skin">

        <!-- ============================================================== -->
        <!-- Preloader - style you can find in spinners.css -->
        <!-- ============================================================== -->
        <div class="preloader"></div>

        <!-- ============================================================== -->
        <!-- Main wrapper - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <div id="main-wrapper">

            <!-- ============================================================== -->
            <!-- Top header  -->
            <!-- ============================================================== -->
            <!-- Start Navigation -->
            <div class="header header-light dark-text">
                <div class="container">
                    <nav id="navigation" class="navigation navigation-landscape">
                        <div class="nav-header" style="padding-top:5px">
                            <a class="nav-brand" href="/final/Index" style="margin-right:5px; padding:5px 5px 5px 0">
                                <img src="/final/assets/img/logo2.jpg" style="width:146px; height:62px" class="logo" alt=""/>
                            </a>
                            <div class="nav-toggle"></div>
                        </div>
                        <div class="nav-menus-wrapper" style="transition-property: none;">
                            <ul class="nav-menu">

                                <li><a href="/final/Index" style="font-size: 15px;">Home</a></li>
                                <li><a href="/final/House_list?rentType=whole" style="font-size: 15px;">Whole Rent</a></li>
                                <li><a href="/final/House_list?rentType=share" style="font-size: 15px;">Share Rent</a></li>
                                <li><a href="/final/Post_list" style="font-size: 15px;">Post</a></li>
                                <li><a href="/final/Announcements" style="font-size: 15px;">Notices</a></li>
                              <!--   <li><a href="/feedback" style="font-size: 15px;">用户反馈</a></li> -->

                            </ul>

                            <c:choose>
                               <c:when test="${ empty user }">
                                    <ul class="nav-menu nav-menu-social align-to-right dhsbrd">

                                        <li>
                                            <a href="#" data-toggle="modal" id="gotoLogin" data-target="#login" style=" color:#8A2BE2">
                                                <i class="fas fa-user-circle mr-1"></i><span class="dn-lg" style="font-size:15px">log in</span>
                                            </a>
                                        </li>
                                        <li class="add-listing dark-bg" style="background-color:#fff">
                                            <a href="#" data-toggle="modal" data-target="#signup" class="theme-cl">
                                                <i class="fas fa-arrow-alt-circle-right mr-1" style="color:#8A2BE2"></i>
                                                <span style="color:#8A2BE2; font-size:15px">register</span>
                                            </a>
                                        </li>
                                    </ul>

                                </c:when>
                                <c:otherwise>

                                    <ul class="nav-menu nav-menu-social align-to-right dhsbrd">

                                        <li>
                                            <div class="btn-group account-drop">
                                                <button type="button" class="btn btn-order-by-filt"
                                                        data-toggle="dropdown" aria-haspopup="true"
                                                        aria-expanded="false">
                                                    <img src="/final/${user.userAvatar}" class="avater-img"
                                                         alt="">
                                                        ${user.userDisplayName} |
                                                    <c:choose>
                                                        <c:when test="${user.role == 'admin'}"><span style="float:right;height:100%; line-height:34px;font-size:17px; font-weight:700;color:#140c40">&nbsp Admin</span></c:when>
                                                        <c:when test="${user.role == 'owner'}"><span style="float:right;height:100%; line-height:34px;font-size:17px; font-weight:700;color:#140c40">&nbsp Owner</span></c:when>
                                                        <c:when test="${user.role == 'customer'}"><span style="float:right;height:100%; line-height:34px;font-size:17px; font-weight:700;color:#140c40">&nbsp Renter</span></c:when>
                                                        <c:otherwise>unknown</c:otherwise>
                                                    </c:choose>
                                                </button>


                                                <c:choose>       
                                                    <c:when test="${user.role == 'admin'}">
                                                        <div class="dropdown-menu pull-right animated flipInX">
                                                            <a href="/final/Profile">
                                                                <i class="ti-user"></i>My Info
                                                            </a>
                                                            <a href="/final/B_House_list">
                                                                <i class="ti-home"></i>House Section
                                                            </a>
                                                            <a href="/final/Annouc_list">
                                                                <i class="ti-new-window"></i>Announcements 
                                                            </a>
                                                            <a href="/final/Logout">
                                                                <i class="ti-power-off"></i>Logout
                                                            </a>
                                                        </div>
                                                    </c:when>
                                                    <c:when test="${user.role == 'owner'}">
                                                        <div class="dropdown-menu pull-right animated flipInX">
                                                            <a href="/final/Profile">
                                                                <i class="ti-user"></i>My Info
                                                            </a>
                                                            <a href="/final/B_House_list">
                                                                <i class="ti-home"></i>  Home Section
                                                            </a>
                                                             <a href="/final/Comment_list">
                                                                <i class="ti-comment"></i>My Comment
                                                            </a>
                                                            <a href="/final/Logout">
                                                                <i class="ti-power-off"></i>Logout
                                                            </a>
                                                        </div>
                                                    </c:when>                                                   
                                                    <c:when test="${user.role == 'customer'}">
                                                        <div class="dropdown-menu pull-right animated flipInX">
                                                            <a href="/final/Profile">
                                                                <i class="ti-user"></i>My info
                                                            </a>
                                                            <a href="/final/Mark_list">
                                                                <i class="ti-bookmark"></i>My Favorites
                                                            </a>
                                                             <a href="/final/Comment_list">
                                                                <i class="ti-comment"></i>My Comment
                                                            </a>
                                                            <a href="/final/Logout">
                                                                <i class="ti-power-off"></i>Logout
                                                            </a>
                                                        </div>
                                                    </c:when>
                                                </c:choose>
                                            </div>
                                        </li>
                                    </ul>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </nav>
                </div>
            </div>
            <!-- End Navigation -->
            <div class="clearfix"></div>
            <!-- ============================================================== -->
            <!-- Top header  -->
            <!-- ============================================================== -->