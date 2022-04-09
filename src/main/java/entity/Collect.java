package entity;

import java.util.Date;

public class Collect {
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
	     * 房子ID
	     */
	    private Long houseId;

	    /**
	     * 房子信息
	     */
	    private House house;

	    public Long getUserId() {
	        return userId;
	    }

	    public void setUserId(Long userId) {
	        this.userId = userId;
	    }

	    public Long getHouseId() {
	        return houseId;
	    }

	    public void setHouseId(Long houseId) {
	        this.houseId = houseId;
	    }

	    public House getHouse() {
	        return house;
	    }

	    public void setHouse(House house) {
	        this.house = house;
	    }
}
