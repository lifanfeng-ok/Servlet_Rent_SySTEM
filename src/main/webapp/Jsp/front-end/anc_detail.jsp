<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../common/head.jsp" %>


<!-- ============================ Page Title Start================================== -->
<div class="page-title" style="background:#f4f4f4 url(/final/assets/img/banner-3.jpg);" data-overlay="5">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12">

                <div class="breadcrumbs-wrap">
                    <ol class="breadcrumb">
                        <li class="active" aria-current="page" style="font-weight:700;font-size:30px; color:#fff; text-align:center">Announcements</li>
                    </ol>
                    <h2 class="breadcrumb-title" style="font-size:20px;text-align:center" >Details of Announcements</h2>
                </div>

            </div>
        </div>
    </div>
</div>
<!-- ============================ Page Title End ================================== -->

<!-- ============================ Agency List Start ================================== -->
<section class="gray-simple">

    <div class="container">

        <!-- row Start -->
        <div class="row">

            <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                <div class="article_detail_wrapss single_article_wrap format-standard">
                    <div class="article_body_wrap">

                        <div class="article_top_info">
                            <ul class="article_middle_info">
                                <li><a href="#"><span class="icons"><i class="ti-user"></i></span>admin</a>
                                </li>
                                <li><a href="#">
                                    <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${notice.createTime}" />
                                </a>
                                </li>
                            </ul>
                        </div>
                        <h4 class="post-title">${notice.title}</h4>
                        <div>
                            <p>${notice.content}</p>
                        </div>
                    </div>
                </div>


            </div>
        </div>
        <!-- /row -->

        <
    </div>

</section>
<!-- ============================ Agency List End ================================== -->


<%@ include file="../common/footer.jsp" %>


</body>
</html>