<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../common/head.jsp" %>


<!-- ============================ Property Detail Head Start ================================== -->
<div class="pt-5 pb-5 gray-simple">
    <div class="container">

        <div class="row justify-content-center">
            <div class="col-lg-8 col-md-10 col-sm-12">
                <div class="prt_detail_three_clicks">
                    <div class="pdt_clicks_price"><h4>S$ ${house.monthRent}/Month</h4></div>
                    <div class="pdt_clicks_title"><h3>${house.title}</h3></div>
                    <div class="pdt_clicks_location"><span><i class="ti-location-pin"></i></span>${house.address}</div>
                </div>
            </div>
        </div>

    </div>
</div>
<!-- ============================ Property Detail Head End ================================== -->

<!-- ============================ 地图 Map & Gallery Part Start ================================== -->
<div class="pt-5 pb-5" style="padding-top:20px!important">
    <div class="container-fluid p-0">

        <div class="row">
            <div class="col-lg-12 col-md-12 mb-4">
                <div class="mapg_part_nav">
                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item">
                            <a href="#gallery" class="nav-link active" id="gallery-tab"  role="tab"
                               aria-controls="gallery" aria-selected="true" data-toggle="tab"><i class="ti-gallery mr-1"></i>Pictures</a>
                        </li>
                        <li class="nav-item">
                            <a href="#map" class="nav-link" id="map-tab"  role="tab" aria-controls="map"
                               aria-selected="false" data-toggle="tab"><i class="ti-map-alt mr-1"></i>Map</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="row justify-content-center no-flex">
            <div class="mapg_part_caption">
                <div class="tab-content" id="myTabContent">
                    <!-- Gallery -->
                    <div class="tab-pane active" id="gallery" role="tabpanel" aria-labelledby="gallery-tab">
                        <div class="featured_slick_gallery gray">
                            <div class="featured_slick_gallery-slide">
                                <c:forEach items="${house.slideImgList}" var="url">
                                    <div class="featured_slick_padd">
                                        <a href="/final/${url}" class="mfp-gallery">
                                            <img style="height: 400px;width: 100%;" src="/final/${url}"
                                                 class="img-fluid mx-auto" alt=""/></a></div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>


                    <!-- Map -->
                    <div class="tab-pane " id="map" role="tabpanel" aria-labelledby="map-tab">
                        <div class="map-container">
                            <iframe src="/final/House_map?id=${house.id}" width="100%" height="500px;"></iframe>
                        </div>
                    </div>

                </div>
            </div>
        </div>

    </div>
</div>
<!-- ============================ Map & Gallery Part End ================================== -->


<!-- ============================ Property Detail Start ================================== -->
<section class="gray-dark" style="padding: 40px 0">
    <div class="container">
        <div class="row">

            <!-- property main detail -->
            <div class="col-lg-8 col-md-12 col-sm-12">

                <!-- Single Block Wrap -->
                <div class="property_block_wrap style-2">

                    <div class="property_block_wrap_header">
                        <a data-toggle="collapse" data-parent="#features" href="#clOne" aria-expanded="true">
                        <h4 class="property_block_title">Detail Information</h4></a>
                    </div>
                    <div id="clOne" class="panel-collapse collapse show" aria-expanded="true">
                        <div class="block-body">
                            <ul class="deatil_features">
                                <li><strong>Status:</strong>
                                    <c:choose>
                                        <c:when test="${house.status == 1}">Renting out</c:when>
                                        <c:when test="${house.status == 0}">Rented out</c:when>
                                        <c:when test="${house.status == -1}">Removed</c:when>
                                        <c:when test="${house.status == -2}">Pending review</c:when>
                                        <c:when test="${house.status == -3}">Review rejected</c:when>
                                        <c:otherwise>Unknown</c:otherwise>
                                    </c:choose>
                                </li>
                                <li><strong>Rent:</strong>¥ ${house.monthRent}/Month</li>
                                <li><strong>Certificate Number:</strong>${house.certificateNo}</li>
                                <li><strong>Bedroom Number:</strong>${house.bedroomNum}</li>
                                <li><strong>Washroom Number:</strong>${house.toiletNum}</li>
                                <li><strong>Kitchen Number:</strong>${house.kitchenNum}</li>
                                <li><strong>Living Room Number:</strong>${house.livingRoomNum}</li>
                                <li><strong>House area:</strong>${house.area}m²</li>
                                <li><strong>Air Conditioner ? :</strong>
                                    <c:choose>
                                        <c:when test="${house.hasAirConditioner == 1}">Yes</c:when>
                                        <c:otherwise>No</c:otherwise>
                                    </c:choose>
                                </li>
                                <li><strong>Build Year:</strong>${house.buildYear}</li>
                                <li><strong>House direction:</strong>${house.direction}</li>
                                <li><strong>Floor:</strong>${house.floor}/${house.maxFloor}</li>
                                <li><strong>Elevator ? :</strong>
                                    <c:choose>
                                        <c:when test="${house.hasElevator == 1}">Yes</c:when>
                                        <c:otherwise>No</c:otherwise>
                                    </c:choose>
                                </li>
                                <li><strong>Owner Name:</strong>${house.contactName}</li>
                                <li><strong>Contact Phone:</strong>${house.contactPhone}</li>
                            </ul>
                        </div>
                    </div>

                </div>

                <!-- Single Block Wrap -->
                <div class="property_block_wrap style-2">

                    <div class="property_block_wrap_header">
                        <a data-toggle="collapse" data-parent="#dsrp" href="#clTwo" aria-expanded="true"><h4
                                class="property_block_title">Description</h4></a>
                    </div>
                    <div id="clTwo" class="panel-collapse collapse show" aria-expanded="true">
                        <div class="block-body">
                            ${house.content}
                        </div>
                    </div>
                </div>

                <!-- Single Block Wrap -->
                <c:if test="${house.rentType == 'share'}">
                    <div class="property_block_wrap style-2" id="shareHouse">

                        <div class="property_block_wrap_header">
                            <a data-toggle="collapse" data-parent="#rev" href="#clEight" aria-expanded="true"><h4
                                    class="property_block_title">Shared rent</h4></a>
                        </div>

                        <div id="clEight" class="panel-collapse collapse show" aria-expanded="true">
                            <div class="block-body">
                                <div class="author-review">
                                    <div class="comment-list">
                                        <ul>
                                            <c:forEach items="${house.shareHouseList}" var="c">
                                                <li class="article_comments_wrap">
                                                    <article>
                                                        <div class="article_comments_thumb">
                                                            <a href="/final/House_detail?id=${c.id}" target="_blank">
                                                                <img src="/final/${c.thumbnailUrl}" alt=""
                                                                     style="border-radius: 0;">
                                                            </a>
                                                        </div>
                                                        <div class="comment-details">
                                                            <div class="comment-meta">
                                                                <div class="comment-left-meta">
                                                                    <a href="/final/House_detail?id=${c.id}" target="_blank">
                                                                        <h4 class="author-name">${c.title}</h4>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                            <div>
                                                            <p><strong>rent:</strong>S$ ${c.monthRent}/Month </p>
                                                            </div>
                                     
                                                        </div>
                                                    </article>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </c:if>
                <!-- Single Block Wrap -->
                <div class="property_block_wrap style-2">

                    <div class="property_block_wrap_header">
                        <a data-toggle="collapse" data-parent="#loca" href="#clSix" aria-expanded="true"
                           class="collapsed"><h4 class="property_block_title">Map Position</h4></a>
                    </div>

                    <div id="clSix" class="panel-collapse collapse show" aria-expanded="true">
                        <div class="block-body">
                            <div class="map-container">
                                <iframe src="/final/House_map?id=${house.id}" width="100%" height="300px;"></iframe>
                            </div>

                        </div>
                    </div>

                </div>

                <!-- Single Block Wrap -->
                <div class="property_block_wrap style-2">

                    <div class="property_block_wrap_header">
                        <a data-toggle="collapse" data-parent="#gal" href="#clSev" aria-expanded="true"
                           class="collapsed"><h4 class="property_block_title">Gallery</h4></a>
                    </div>

                    <div id="clSev" class="panel-collapse collapse show" aria-expanded="true">
                        <div class="block-body">
                            <ul class="list-gallery-inline">
                                <c:forEach items="${house.slideImgList}" var="url">
                                    <li>
                                        <a href="/final/${url}" class="mfp-gallery">
                                            <img style="width:230px;height:141px" src="/final/${url}" class="img-fluid mx-auto" alt=""/>
                                        </a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>

                </div>

            </div>

            <!-- property Sidebar -->
            <div class="col-lg-4 col-md-12 col-sm-12">
                <div class="property-sidebar">

                    <!-- Share & Like Button -->
                    <div class="like_share_wrap b-0">
                    <c:choose>
                    <c:when test="${is_col == false }">    
                        <ul class="like_share_list">                       
                            <li><a href="javascript:void(0)" class="btn btn-likes" onclick="submitMark(${house.id})">
                            <i class="fas"></i>Collect</a></li>
                        </ul>
                       </c:when>
                    <c:otherwise>
                        <ul class="like_share_list">                       
                            <li><a style="cursor:default" class="btn btn-likes" id="already" >
                            <i  class="fas fa-heart"></i>Collected</a></li>
                        </ul>   
                    </c:otherwise>
                     </c:choose>
                    </div>

                    <!-- Agent Detail -->
                    <div class="agent-_blocks_wrap b-0">
                        <div class="side-block-header">
                            <h3 class="title">Contact Owner</h3>
                        </div>
                        <div class="side-block-body">
                            <form action="" id="contactForm">
                                <div class="row">
                                    <input type="hidden" name="houseId" value="${house.id}">
                                    <div class="col-lg-12 col-md-12 col-sm-6">
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="name" placeholder="My Name"/>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-6">
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="email" placeholder="My Email"/>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="phone" placeholder="My Phone Number"/>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="form-group">
                                            <textarea class="form-control" name="content"
                                                      placeholder="Message"></textarea>
                                        </div>
                                    </div>

                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                        <div class="stbooking-footer mt-1">
                                            <div class="form-group mb-0 pb-0">
                                                <a href="javascript:void(0)" onclick="submitContact()"
                                                   class="btn btn-md full-width btn-theme bg-2">Send</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>
</section>
<!-- ============================ Property Detail End ================================== -->


<%@ include file="../common/footer.jsp" %>
<script>
    function submitMark(houseId) {
        $.ajax({
            type: 'POST',
            url: '/final/Collecting',
            async: false,
            data: {
                "houseId": houseId // 以表单格式传参数
            },
            success: function (data) {
            	var obj = JSON.parse(data)
            	
                if ( obj.status == 0) {
                	alert(obj.message);
                    $('#gotoLogin').click();
                    return;
                }
                else if (obj.status == 1) {
                	alert(obj.message); 
                }
                else if(obj.status == 2) {
                	alert(obj.message); 
                	window.location.reload();
                }

            }
        });
    }
 
/*     function toggleMap() {
        $('#map').toggleClass('active');
    }

    function toggleGallery() {
        $('#gallery').toggleClass('active');
    } */

</script>

</body>
</html>