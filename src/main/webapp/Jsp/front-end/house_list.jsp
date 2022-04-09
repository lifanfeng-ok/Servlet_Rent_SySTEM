<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../common/head.jsp" %>


<!-- ============================ All Property ================================== -->
<section class="gray-simple" style="padding:40px 0">

    <div class="container">

        <div class="row">

            <!-- property Sidebar -->
            <div class="col-lg-4 col-md-12 col-sm-12">
                <div class="hidden-md-down">

                    <div class="page-sidebar">

                        <!-- Find New Property -->
                        <div class="sidebar-widgets" data-select2-id="28">

                            <form action="/final/House_list" method="get">

                                <div class="form-group">
                                    <div class="simple-input">
                                        <select id="region" name="region" class="form-control">
                                            <option value="">&nbsp;</option>
                                            <option value="Central"
                                                    <c:if test="${region == 'Central'}">selected</c:if>>
                                                Central
                                            </option>
                                            <option value="North"
                                                    <c:if test="${region == 'North'}">selected</c:if>>
                                                North
                                            </option>
                                            <option value="East"
                                                    <c:if test="${region == 'East'}">selected</c:if>>
                                                East
                                            </option>
                                            <option value="West"
                                                    <c:if test="${region == 'West'}">selected</c:if>>
                                                West
                                            </option>
                                            <option value="North-East"
                                                    <c:if test="${region == 'North-East'}">selected</c:if>>
                                                North-East
                                            </option>                                        
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="simple-input">
                                        <select id="RentType" name="rentType" class="form-control">
                                            <option value="">不限</option>
                                            <option value="whole"
                                                    <c:if test="${rentType == 'whole'}">selected</c:if>>Whole
                                            </option>
                                            <option value="share"
                                                    <c:if test="${rentType == 'share'}">selected</c:if>>Share
                                            </option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="input-with-icon">
                                        <input type="text" class="form-control" name="address" placeholder="Street"
                                               value="${address}">
                                        <i class="ti-search"></i>
                                    </div>
                                </div>





                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 pt-4 pb-4">
                                        <h6>Price Range</h6>
                                        <div class="rg-slider">
                                            <input type="text" class="js-range-slider-price" name="priceRange"
                                                   value=""/>
                                        </div>
                                    </div>
                                </div>


                                <div class="ameneties-features">
                                    <button type="submit" class="btn btn-theme full-width bg-2">Search</button>
                                </div>
                            </form>

                        </div>

                    </div>
                </div>
                <!-- Sidebar End -->

            </div>


            <div class="col-lg-8 col-md-12 col-sm-12">


                <div class="row">

                    <c:forEach items="${houses}" var="c">
                        <!-- Single Property -->
                        <div class="col-lg-6 col-md-6 col-sm-12">
                            <div class="single_property_style property_style_2 modern">

                                <div class="listing_thumb_wrapper">
                                    <div class="property_gallery_slide-thumb">
                                        <a href="/final/House_detail?id=${c.id}">
                                            <img src="/final/${c.thumbnailUrl}" class="img-fluid mx-auto" alt="">
                                        </a>
                                    </div>
                                </div>

                                <div class="property_caption_wrappers pb-0">
                                    <div class="property_short_detail">
                                        <div class="pr_type_status">
                                            <h4 class="pr-property_title mb-1">
                                                <a href="/final/House_detail?id=${c.id}">${c.title}</a>
                                            </h4>
                                            <div class="listing-location-name">
                                                <a href="/final/House_detail?id=${c.id}">${c.address}</a>
                                            </div>
                                        </div>
                                        <div class="property-real-price">
                                            <a href="/final/House_detail?id=${c.id}" class="cl-blue">S$ ${c.monthRent}
                                                <span class="price_status">/Month</span></a>
                                        </div>
                                    </div>
                                </div>

                                <div class="modern_property_footer">
                                    <div class="property-lists flex-1">
                                        <ul>
                                            <li><span class="flatcons">
                                                <img src="/final/assets/img/bed.svg" alt=""></span>
                                                    ${c.bedroomNum} Bedroom
                                            </li>
                                            <li><span class="flatcons">
                                                <img src="/final/assets/img/bath.svg" alt=""></span>
                                                    ${c.toiletNum} Washroom
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="fp_types">
                                        <a href="javascript:void(0)" class="markHouse"
                                           onclick="submitMark(${c.id})">Favorite</a>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>


            </div>


        </div>
    </div>
</section>

<!-- ============================ All Property ================================== -->


<%@ include file="../common/footer.jsp" %>
<script>
    $('#region').select2({
         //当没有选择数据时,显示内容
         placeholder: 'Region',
         //当存在数据时,显示清楚按钮
         allowClear: true
       });
     $('#RentType').select2({
            //当没有选择数据时,显示内容
            placeholder: 'RentType',
             //当存在数据时,显示清楚按钮
             allowClear: true
        });
    let minPrice = ${minPrice};
    let maxPrice = ${maxPrice};
    // Range Slider Script
    $(".js-range-slider-price").ionRangeSlider({
        type: "double",
        min: 0,
        max: 20000,
        from: minPrice,
        to: maxPrice,
        grid: true
    });
    function submitMark(houseId) {
        $.ajax({
            type: 'POST',
            url: '/final/Collecting',
            async: false,
            data: {
                "houseId": houseId 
            },
            success: function (data) {
            	var obj = JSON.parse(data)
            	
                if ( obj.status == 0) {
                	alert(obj.message);
                    $('#gotoLogin').click();
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


    // Range Slider Script
/*     $(".js-range-slider-area").ionRangeSlider({
        type: "double",
        min: 0,
        max: 300,
        from: minArea,
        to: maxArea,
        grid: true
    }); */

</script>

</body>
</html>
