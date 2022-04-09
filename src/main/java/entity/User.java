package entity;

public class User {
	
	private Long id;
	
	private String country;
	
	public Long getId() {
	        return id;
	    }

	public void setId(Long id) {
	        this.id = id;
	    }
	    
	 /**
     * ��¼��
     */
    private String userName;

    /**
     * ������
     */
    private String userDisplayName;

    /**
     * ����
     */
    private String userPass;

    /**
     * ���֤����
     */
    private String idCard;

    /**
     * ͷ��
     */
    private String userAvatar;

    /**
     * ˵��
     */
    private String userDesc;

    /**
     * 0 ����
     * 1 ����
     */
    private Integer status = 0;

    /**
     * ��������
     */
    private String email;

    /**
     * �ֻ���
     */
    private String phone;

    /**
     * ְҵ
     */
    private String job;

    /**
     * ҵ�మ��
     */
    private String hobby;

    /**
     * �Ա�
     */
    private String sex;

    /**
     * ��ɫ������Աadmin/����owner/���customer
     */
    private String role;
    
    public User(Long id, String userName, String userDisplayName, String userPass,
    		   String userAvatar, Integer status, String role) {
    	this.id = id;
    	this.userName= userName;
    	this.status = status;
    	this.userDisplayName = userDisplayName;
    	this.userPass = userPass;
    	this.userAvatar = userAvatar;
    	this.role = role;
    }
    public User() {
    	
    }
    
    public User(Long id, String userName, String userDisplayName, String userPass,
 		   String userAvatar, String email, String phone, String sex, String role, String career, String country, String hobby,
 		   int status) {
 	this.id = id;
 	this.userName= userName;
 	this.email = email;
 	this.userDisplayName = userDisplayName;
 	this.userPass = userPass;
 	this.userAvatar = userAvatar;
 	this.phone = phone;
 	this.sex = sex;
 	this.role = role;   	
 	this.job = career;
 	this.country = country;
 	this.hobby = hobby;
 	this.status = status;
 }
    public User(int status,Long id, String userName, String userDisplayName, String userPass,
 		     String email,String phone,String hobby,String job) {
 	this.id = id;
 	this.userName= userName;
 	this.userDisplayName = userDisplayName;
 	this.userPass = userPass;	
 	this.email = email;
 	this.phone = phone;
 	this.hobby = hobby;
 	this.job = job;
 	this.status = status;
 }

    /**
     * ���֤��Ƭ
     */
    private String idCardImg;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserDisplayName() {
        return userDisplayName;
    }

    public void setUserDisplayName(String userDisplayName) {
        this.userDisplayName = userDisplayName;
    }

    public String getUserPass() {
        return userPass;
    }

    public void setUserPass(String userPass) {
        this.userPass = userPass;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public String getUserAvatar() {
        return userAvatar;
    }

    public void setUserAvatar(String userAvatar) {
        this.userAvatar = userAvatar;
    }

    public String getUserDesc() {
        return userDesc;
    }

    public void setUserDesc(String userDesc) {
        this.userDesc = userDesc;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public String getHobby() {
        return hobby;
    }

    public void setHobby(String hobby) {
        this.hobby = hobby;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getIdCardImg() {
        return idCardImg;
    }

    public void setIdCardImg(String idCardImg) {
        this.idCardImg = idCardImg;
    }
    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }
}
