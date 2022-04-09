package entity;

import java.util.Date;

public class Notice {
	private Long id;
	 /**
     * 标题
     */
    private String title;
    
    private Date createTime;

    /**
     * 内容
     */
    private String content;

    /**
     * 摘要
     */
    private String summary;
    
    public Notice(Long id, String title, String summary, Date createTime) {
    	this.id = id;
    	this.title = title;
    	this.summary = summary;
    	this.createTime = createTime;
    }
    public Notice(String title, Long id, String summary, String content,Date createTime) {
    	this.id = id;
    	this.title = title;
    	this.summary = summary;
    	this.content = content;
    	this.createTime = createTime;
    }
    
    public Notice() {
    	
    }
    
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
}
