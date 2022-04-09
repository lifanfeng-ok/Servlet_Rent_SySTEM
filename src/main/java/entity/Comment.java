package entity;

import java.util.Date;

public class Comment {
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
	    
	    private String content;

	    /**
	     * 留言用户ID
	     */
	    private Long userId;

	    /**
	     * 文章用户ID
	     */
	    private Long postUserId;

	    /**
	     * 文章ID
	     */
	    private Long postId;


	    private Post post;


	    private User user;
	    
	    public Comment() {
	    	
	    }
	    
	    public Comment(Long id, String content, Long userId, Date createTime) {
	    	this.id = id;
	    	this.content = content;
	    	this.userId =userId;
	    	this.createTime = createTime;
	    }
	    public Comment(Long id, String content, Long userId, Long postId, Date createTime) {
	    	this.id = id;
	    	this.content = content;
	    	this.userId =userId;
	    	this.postId = postId;
	    	this.createTime = createTime;
	    }
	    

	    public String getContent() {
	        return content;
	    }

	    public void setContent(String content) {
	        this.content = content;
	    }

	    public Long getUserId() {
	        return userId;
	    }

	    public void setUserId(Long userId) {
	        this.userId = userId;
	    }

	    public Long getPostUserId() {
	        return postUserId;
	    }

	    public void setPostUserId(Long postUserId) {
	        this.postUserId = postUserId;
	    }

	    public Long getPostId() {
	        return postId;
	    }

	    public void setPostId(Long postId) {
	        this.postId = postId;
	    }

	    public Post getPost() {
	        return post;
	    }

	    public void setPost(Post post) {
	        this.post = post;
	    }

	    public User getUser() {
	        return user;
	    }

	    public void setUser(User user) {
	        this.user = user;
	    }
}
