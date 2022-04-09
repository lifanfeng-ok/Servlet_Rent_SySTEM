package entity;

import java.util.Date;

public class Post {
	private Long id;
	
	private Date createTime;
	
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    
    public Date getCreateTime() {
    	return createTime;
    }
    public void setCreateTime(Date createTime) {
    	this.createTime = createTime;
    }
	  /**
     * ����
     */
    private String title;

    /**
     * ����
     */
    private String content;

    /**
     * ժҪ
     */
    private String summary;

    /**
     * �û�ID
     */
    private Long userId;

    /**
     * �������ͣ�����
     * @see com.example.ssm.rental.common.enums.PostTypeEnum
     */
    private String postType;

    /**
     * �û�
     */
    private User user;
    
    public Post(Long id, String title, String summary, Date createTime) {
    	this.id = id;
    	this.title = title;
    	this.summary = summary;
    	this.createTime = createTime;
    }
    public Post(String title, Long id, String content,Date createTime,Long userId) {
    	this.id = id;
    	this.title = title;
    	this.content = content;
    	this.createTime = createTime;
    	this.userId = userId;
    }
    public Post() {
    	
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

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getPostType() {
        return postType;
    }

    public void setPostType(String postType) {
        this.postType = postType;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
