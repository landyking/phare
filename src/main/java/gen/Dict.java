package gen;

import org.beetl.sql.core.annotatoin.Table;

import java.util.Date;


/*
* 字典表
* gen by beetlsql
*/
@Table(name="t_dict")
public class Dict extends org.beetl.sql.core.TailBean  {

	private String id ;
	private String code ;
	private Long deleteFlag ;
	private String description ;
	private Date createTime ;
	private Date updateTime ;

	public Dict() {
	}

	public String getId(){
		return  id;
	}
	public void setId(String id ){
		this.id = id;
	}

	public String getCode(){
		return  code;
	}
	public void setCode(String code ){
		this.code = code;
	}

	public Long getDeleteFlag(){
		return  deleteFlag;
	}
	public void setDeleteFlag(Long deleteFlag ){
		this.deleteFlag = deleteFlag;
	}

	public String getDescription(){
		return  description;
	}
	public void setDescription(String description ){
		this.description = description;
	}

	public Date getCreateTime(){
		return  createTime;
	}
	public void setCreateTime(Date createTime ){
		this.createTime = createTime;
	}

	public Date getUpdateTime(){
		return  updateTime;
	}
	public void setUpdateTime(Date updateTime ){
		this.updateTime = updateTime;
	}


}
