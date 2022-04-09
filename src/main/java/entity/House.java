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
     * �������ͣ�����whole/ ����share
     */
    private String rentType;

    /**
     * ����
     */
    private String title;


    /**
     * ��ϸ����
     */
    private String content;

    /**
     * ��������
     */
    private String city;

    /**
     * ��ϸ��ַ��Ϣ
     */
    private String address;

    /**
     * ����ͼURL
     */
    private String thumbnailUrl;

    /**
     * �õ�ƬURL
     */
    private String slideUrl;

    /**
     * �����
     */
    private Integer monthRent;

    /**
     * ״̬: 0�������1δ�����,-1���¼�,-2����ˣ�-3��˲���
     */
    private Integer status;

    /**
     * ����֤���
     */
    private String certificateNo;

    /**
     * ����������
     */
    private Integer toiletNum;

    /**
     * ��������
     */
    private Integer kitchenNum;

    /**
     * ��������
     */
    private Integer livingRoomNum;

    /**
     * ��������
     */
    private Integer bedroomNum;

    /**
     * �Ƿ��пյ���1�ǣ�0��
     */
    private Integer hasAirConditioner;

    /**
     * ���
     */
    private Double area;

    /**
     * ¥��
     */
    private Integer floor;

    /**
     * ���¥��
     */
    private Integer maxFloor;

    /**
     * �Ƿ��е��ݣ�1�ǣ�0��
     */
    private Integer hasElevator;

    /**
     * �������
     */
    private Integer buildYear;

    /**
     * ����
     */
    private String direction;

    /**
     * ��ʼʱ��
     */
    private Date lastOrderStartTime;

    /**
     * ����ʱ��
     */
    private Date lastOrderEndTime;

    /**
     * ��γ��
     */
    private String longitudeLatitude;

    /**
     * ��ϵ������
     */
    private String contactName;

    /**
     * ��ϵ�˵绰
     */
    private String contactPhone;

    /**
     * �����û�
     */
  
    private User ownerUser;

    /**
     * �ֲ�ͼ�б�
     */
 
    private List<String> slideImgList;



    /**
     * ���ⷿ��
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
