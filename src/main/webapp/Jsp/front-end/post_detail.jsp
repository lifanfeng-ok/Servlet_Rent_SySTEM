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
                        <li class="active" aria-current="page" style="font-weight:700;font-size:30px; color:#fff; text-align:center">Posts</li>
                    </ol>
                    <h2 class="breadcrumb-title" style="font-size:20px;text-align:center" >Details of Posts</h2>
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
                                <li><a href="#"><span class="icons"><i
                                        class="ti-user"></i></span>${post.user.userDisplayName}</a>
                                </li>
                                <li><a href="#">
                                    <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${post.createTime}"/>
                                </a>
                                </li>
                            </ul>
                        </div>
                        <h4 class="post-title" style="font-size:26px">${post.title}</h4>
                        <div >
                            <p>${post.content}</p>
                        </div>
                    </div>
                </div>


            </div>
        </div>
        <!-- /row -->

        <div class="article_detail_wrapss single_article_wrap format-standard">

            <div class="comment-area">
                <div class="all-comments">
                    <h3 class="comments-title" style="border-bottom:1px dashed black; padding-bottom: 9px; text-align:center; margin:0 0 15px 0; font-size:20px">${commentList.size()} Messages</h3>
                    <div class="comment-list">
                        <ul>
                            <c:forEach items="${commentList}" var="c">
                                <li class="article_comments_wrap">
                                    <article id="comment-${c.id}" style="margin: 0 0 20px 0">
                                        <div class="article_comments_thumb">
                                            <img src="/final/${c.user.userAvatar}" alt="">
                                        </div>
                                        <div class="comment-details">
                                            <div class="comment-meta">
                                                <div class="comment-left-meta">
                                                    <h4 class="author-name">${c.user.userDisplayName}<span
                                                            class="selected"></span></h4>
                                                    <div class="comment-date"><fmt:formatDate pattern="yyyy-MM-dd" value="${c.createTime}"/></div>
                                                </div>
                                            </div>
                                            <div class="comment-text">
                                                <p>${c.content}</p>
                                            </div>
                                        </div>
                                    </article>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
                <div class="comment-box submit-form" style="margin-top: 50px;">
                    <h3 class="reply-title">Messages</h3>
                    <div class="comment-form">
                        <form  id="commentForm">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <div class="form-group">
                                        <input type="hidden" name="postId" value="${post.id}">
                                        <textarea id="text" name="content" class="form-control" cols="30" rows="6"
                                                  placeholder="please input your content"></textarea>
                                      <div id="show_col_msg" class="col-md-12" style="display:none; padding-left:0">
                                              <p style="color:red;font-size: 15px" >Input should not be Null</p>
                                       </div>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <div class="form-group">
                                        <a href="javascript:;" class="btn search-btn bg-2" onclick="submitComment()">Submit</a>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>
    </div>

</section>
<!-- ============================ Agency List End ================================== -->


<%@ include file="../common/footer.jsp" %>
<script>
function submitComment() {
	var content = document.getElementById("text");
	var show = document.getElementById("show_col_msg")
	if (content.value == '') {
		show.style.display = 'block';
		return;
	}
	
    $.ajax({
        type: 'POST',
        url: '/final/Commenting',
        async: false,
        data: $("#commentForm").serialize(), // 获取该表单下的所有参数
        success: function (data) {
        	var obj = JSON.parse(data)
            // 如果反馈成功，刷新页面
            if (obj.status == 0) {
            	alert(obj.message);
            	$('#gotoLogin').click();
                return;
            }
            else if (obj.status == 1) {
            	alert(obj.message);
            	window.location.reload();
            }
        }
    }); 
}
</script>

</body>
</html>
