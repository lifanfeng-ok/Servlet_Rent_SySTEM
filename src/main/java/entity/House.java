package entity;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public class House {
	private Long id;
	
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    
    private Date createTime;
    
    public Date getCreateTime() {
    	return createTime;
    }
    public void setCreateTime(Date createTime) {
     	this.createTime = createTime;
    }
	
    private Long userId;

    /**
     * 出租类型：整租whole/ 合租share
     */
    private String rentType;

    /**
     * 名称
     */
    private String title;


    /**
     * 详细介绍
     */
    private String content;

    /**
     * 城市名称
     */
    private String city;

    /**
     * 详细地址信息
     */
    private String address;

    /**
     * 缩略图URL
     */
    private String thumbnailUrl;

    /**
     * 幻灯片URL
     */
    private String slideUrl;

    /**
     * 月租金
     */
    private Integer monthRent;

    /**
     * 状态: 0已租出，1未租出，,-1已下架,-2待审核，-3审核驳回
     */
    private Integer status;

    /**
     * 房产证编号
     */
    private String certificateNo;

    /**
     * 卫生间数量
     */
    private Integer toiletNum;

    /**
     * 厨房数量
     */
    private Integer kitchenNum;

    /**
     * 客厅数量
     */
    private Integer livingRoomNum;

    /**
     * 卧室数量
     */
    private Integer bedroomNum;

    /**
     * 是否有空调，1是，0否
     */
    private Integer hasAirConditioner;

    /**
     * 面积
     */
    private Double area;

    /**
     * 楼层
     */
    private Integer floor;

    /**
     * 最高楼层
     */
    private Integer maxFloor;

    /**
     * 是否有电梯，1是，0否
     */
    private Integer hasElevator;

    /**
     * 建成年份
     */
    private Integer buildYear;

    /**
     * 方向
     */
    private String direction;

    /**
     * 开始时间
     */
    private Date lastOrderStartTime;

    /**
     * 结束时间
     */
    private Date lastOrderEndTime;

    /**
     * 经纬度
     */
    private String longitudeLatitude;

    /**
     * 联系人姓名
     */
    private String contactName;

    /**
     * 联系人电话
     */
    private String contactPhone;

    /**
     * 房东用户
     */
  
    private User ownerUser;

    /**
     * 轮播图列表
     */
 
    private List<String> slideImgList;



    /**
     * 合租房子
     */

    private List<House> shareHouseList;
    
    public House(Long id, String thumbnailUrl, String title,
    		String address, Integer status) {
 	this.id= id;
 	this.thumbnailUrl = thumbnailUrl;
 	this.title = title;
 	this.address = address;
    this.status = status;
 }
    
    public House(Long id, String thumbnailUrl, String title,
    		String address, Integer monthRent,Integer bedroomNum,Integer toiletNum) {
 	this.id= id;
 	this.thumbnailUrl = thumbnailUrl;
 	this.title = title;
 	this.address = address;
 	this.monthRent = monthRent;
 	this.bedroomNum = bedroomNum;
 	this.toiletNum = toiletNum;
 }
    public House(Long id, String thumbnailUrl, String title,Integer monthRent) {
    	this.id= id;
     	this.thumbnailUrl = thumbnailUrl;
     	this.title = title;
     	this.monthRent = monthRent;
    }
    public House(Long id, Long userId, String thumbnailUrl, String title,
    		String address, Integer monthRent,Integer bedroomNum,Integer toiletNum,Integer kitchenNum,
    		Integer livingRoomNum, Double area, Integer has_air_conditioner, Integer buildYear,
    		Integer status, String certificateNo, String direction,Integer floor,
    		Integer maxFloor,Integer has_elevator, String contactName, String contactPhone,
    		String content, String rent_type, String slide_url) {
 	this.id= id;
 	this.userId = userId;
 	this.thumbnailUrl = thumbnailUrl;
 	this.title = title;
 	this.address = address;
 	this.monthRent = monthRent;
 	this.bedroomNum = bedroomNum;
 	this.toiletNum = toiletNum;
 	this.kitchenNum = kitchenNum;
 	this.livingRoomNum = livingRoomNum;
 	this.area = area;
 	this.hasAirConditioner = has_air_conditioner;
 	this.buildYear = buildYear;
 	this.status = status;
 	this.certificateNo = certificateNo;
 	this.direction = direction;
 	this.floor = floor;
 	this.maxFloor = maxFloor;
 	this.hasElevator = has_elevator;
 	this.contactName = contactName;
 	this.contactPhone = contactPhone;
 	this.content = content;
 	this.rentType = rent_type;
 	this.slideUrl =slide_url;
 	
 }
    public House() {	
    }
    public House(Long id,String longitudeLatitude,String address) {
    	this.id = id;
    	this.longitudeLatitude = longitudeLatitude;
    	this.address = address;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getRentType() {
        return rentType;
    }

    public void setRentType(String rentType) {
        this.rentType = rentType;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getThumbnailUrl() {
        return thumbnailUrl;
    }

    public void setThumbnailUrl(String thumbnailUrl) {
        this.thumbnailUrl = thumbnailUrl;
    }

    public String getSlideUrl() {
        return slideUrl;
    }

    public void setSlideUrl(String slideUrl) {
        this.slideUrl = slideUrl;
    }

    public Integer getMonthRent() {
        return monthRent;
    }

    public void setMonthRent(Integer monthRent) {
        this.monthRent = monthRent;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getCertificateNo() {
        return certificateNo;
    }

    public void setCertificateNo(String certificateNo) {
        this.certificateNo = certificateNo;
    }

    public Integer getToiletNum() {
        return toiletNum;
    }

    public void setToiletNum(Integer toiletNum) {
        this.toiletNum = toiletNum;
    }

    public Integer getKitchenNum() {
        return kitchenNum;
    }

    public void setKitchenNum(Integer kitchenNum) {
        this.kitchenNum = kitchenNum;
    }

    public Integer getLivingRoomNum() {
        return livingRoomNum;
    }

    public void setLivingRoomNum(Integer livingRoomNum) {
        this.livingRoomNum = livingRoomNum;
    }

    public Integer getBedroomNum() {
        return bedroomNum;
    }

    public void setBedroomNum(Integer bedroomNum) {
        this.bedroomNum = bedroomNum;
    }

    public Integer getHasAirConditioner() {
        return hasAirConditioner;
    }

    public void setHasAirConditioner(Integer hasAirConditioner) {
        this.hasAirConditioner = hasAirConditioner;
    }

    public Double getArea() {
        return area;
    }

    public void setArea(Double area) {
        this.area = area;
    }

    public Integer getFloor() {
        return floor;
    }

    public void setFloor(Integer floor) {
        this.floor = floor;
    }

    public Integer getMaxFloor() {
        return maxFloor;
    }

    public void setMaxFloor(Integer maxFloor) {
        this.maxFloor = maxFloor;
    }

    public Integer getHasElevator() {
        return hasElevator;
    }

    public void setHasElevator(Integer hasElevator) {
        this.hasElevator = hasElevator;
    }

    public Integer getBuildYear() {
        return buildYear;
    }

    public void setBuildYear(Integer buildYear) {
        this.buildYear = buildYear;
    }

    public String getDirection() {
        return direction;
    }

    public void setDirection(String direction) {
        this.direction = direction;
    }

    public Date getLastOrderStartTime() {
        return lastOrderStartTime;
    }

    public void setLastOrderStartTime(Date lastOrderStartTime) {
        this.lastOrderStartTime = lastOrderStartTime;
    }

    public Date getLastOrderEndTime() {
        return lastOrderEndTime;
    }

    public void setLastOrderEndTime(Date lastOrderEndTime) {
        this.lastOrderEndTime = lastOrderEndTime;
    }

    public String getLongitudeLatitude() {
        return longitudeLatitude;
    }

    public void setLongitudeLatitude(String longitudeLatitude) {
        this.longitudeLatitude = longitudeLatitude;
    }

    public String getContactName() {
        return contactName;
    }

    public void setContactName(String contactName) {
        this.contactName = contactName;
    }

    public String getContactPhone() {
        return contactPhone;
    }

    public void setContactPhone(String contactPhone) {
        this.contactPhone = contactPhone;
    }

    public User getOwnerUser() {
        return ownerUser;
    }

    public void setOwnerUser(User ownerUser) {
        this.ownerUser = ownerUser;
    }

    public List<String> getSlideImgList() {
        return slideImgList;
    }

    public void setSlideImgList(List<String> slideImgList) {
        this.slideImgList = slideImgList;
    }

    public List<House> getShareHouseList() {
        return shareHouseList;
    }

    public void setShareHouseList(List<House> shareHouseList) {
        this.shareHouseList = shareHouseList;
    }
}
