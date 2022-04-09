<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="col-lg-3 col-md-4 col-sm-12">
    <div class="property_dashboard_navbar" style="background: #311441">

        <c:choose>
            <%--  admin  --%>
            <c:when test="${user.role == 'admin'}">
                <div class="dash_user_menues">
                    <ul>                        
                        <li <c:if test="${tab == 'my-profile'}"> class="active"</c:if>><a href="/final/Profile"><i
                                class="ti-user"></i>My Info</a></li>
                        <li <c:if test="${tab == 'house-list'}"> class="active"</c:if>><a href="/final/B_House_list"><i
                                class="ti-layers"></i>House Management</a></li>                  
                        <li <c:if test="${tab == 'user-list'}"> class="active"</c:if>><a href="/final/User_back"><i
                                class="ti-user"></i>User Management</a></li>                        
                        <li <c:if test="${tab == 'announc-list'}"> class="active"</c:if>><a href="/final/Annouc_list"><i
                                class="ti-new-window"></i>Announcements</a></li>
                        <li <c:if test="${tab == 'post-list'}"> class="active"</c:if>><a href="/final/Post_list_back"><i
                                class="ti-pencil"></i>Post Management</a></li>
                        <li <c:if test="${tab == 'comment-list'}"> class="active"</c:if>><a href="/final/Comment_list"><i
                                class="ti-comment"></i>Comment Management</a></li>
                        <li <c:if test="${tab == 'my-password'}"> class="active"</c:if>><a href="/final/Reset_page"><i
                                class="ti-unlock"></i>Reset password</a></li>
                        <li><a href="/final/Logout"><i class="ti-power-off"></i>Logout</a></li>
                    </ul>
                </div>
            </c:when>
            <%--  owner  --%>
            <c:when test="${user.role == 'owner'}">
                <div class="dash_user_menues">
                    <ul>
                        <li <c:if test="${tab == 'my-profile'}"> class="active"</c:if>><a href="/final/Profile"><i
                                class="ti-user"></i>My Info</a></li>
                        <li <c:if test="${tab == 'house-list'}"> class="active"</c:if>><a href="/final/B_House_list"><i
                                class="ti-home"></i>My House</a></li>                  
                        <li <c:if test="${tab == 'house-publish'}"> class="active"</c:if>><a
                                ><i class="ti-pencil-alt"></i>House Publish</a></li>
                        <li <c:if test="${tab == 'mark-list'}"> class="active"</c:if>><a href="/final/Mark_list"><i
                                class="ti-bookmark"></i>My Favorites</a></li>    
                        <li <c:if test="${tab == 'post-list'}"> class="active"</c:if>><a href="/final/Post_list_back"><i
                                class="ti-pencil"></i>My Post</a></li>
                        <li <c:if test="${tab == 'comment-list'}"> class="active"</c:if>><a href="/final/Comment_list"><i
                                class="ti-comment"></i>My Comment</a></li>
                         <li <c:if test="${tab == 'feedback-list'}"> class="active"</c:if>><a ><i
                                class="ti-alert"></i>My Feedback</a></li>
                        <li <c:if test="${tab == 'my-password'}"> class="active"</c:if>><a href="/final/Reset_page"><i
                                class="ti-unlock"></i>Reset Password</a></li>
                        <li><a href="/final/Logout"><i class="ti-power-off"></i>Logout</a></li>
                    </ul>
                </div>
            </c:when>
            <%--  renter  --%>
            <c:when test="${user.role == 'customer'}">
                <div class="dash_user_menues">
                    <ul>
                        <li <c:if test="${tab == 'my-profile'}"> class="active"</c:if>><a href="/final/Profile"><i
                                class="ti-user"></i>My Info</a></li>
                        <li <c:if test="${tab == 'house-list'}"> class="active"</c:if>><a ><i
                                class="ti-home"></i>My House</a></li>                  
                        <li <c:if test="${tab == 'house-publish'}"> class="active"</c:if>><a
                                ><i class="ti-pencil-alt"></i>House Publish</a></li>
                        <li <c:if test="${tab == 'mark-list'}"> class="active"</c:if>><a href="/final/Mark_list"><i
                                class="ti-bookmark"></i>My Favorites</a></li>                       
                        <li <c:if test="${tab == 'post-list'}"> class="active"</c:if>><a href="/final/Post_list_back"><i
                                class="ti-pencil"></i>My Post</a></li>
                        <li <c:if test="${tab == 'comment-list'}"> class="active"</c:if>><a href="/final/Comment_list"><i
                                class="ti-comment"></i>My Comment</a></li>
                         <li <c:if test="${tab == 'feedback-list'}"> class="active"</c:if>><a ><i
                                class="ti-alert"></i>My Feedback</a></li>
                        <li <c:if test="${tab == 'my-password'}"> class="active"</c:if>><a href="/final/Reset_page"><i
                                class="ti-unlock"></i>Reset Password</a></li>
                        <li><a href="/final/Logout"><i class="ti-power-off"></i>Logout</a></li>
                    </ul>
                </div>
            </c:when>
        </c:choose>

    </div>
</div>