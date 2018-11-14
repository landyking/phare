package gen;

import org.beetl.sql.core.annotatoin.Table;

import java.util.Date;


/*
* 用户信息表
* gen by beetlsql
*/
@Table(name="t_account")
public class Account extends org.beetl.sql.core.TailBean  {

	private String id ;
	private Long deleteFlag ;
	/*
	描述
	*/
	private String description ;
	private Long enableFlag ;
	private String lastLoginIp ;
	private String password ;
	private String username ;
	private Date lastLoginTime ;

	public Account() {
	}

	public String getId(){
		return  id;
	}
	public void setId(String id ){
		this.id = id;
	}

	public Long getDeleteFlag(){
		return  deleteFlag;
	}
	public void setDeleteFlag(Long deleteFlag ){
		this.deleteFlag = deleteFlag;
	}

	/**
	* 描述
	*@return
	*/
	public String getDescription(){
		return  description;
	}
	/**
	* 描述
	*@param  description
	*/
	public void setDescription(String description ){
		this.description = description;
	}

	public Long getEnableFlag(){
		return  enableFlag;
	}
	public void setEnableFlag(Long enableFlag ){
		this.enableFlag = enableFlag;
	}

	public String getLastLoginIp(){
		return  lastLoginIp;
	}
	public void setLastLoginIp(String lastLoginIp ){
		this.lastLoginIp = lastLoginIp;
	}

	public String getPassword(){
		return  password;
	}
	public void setPassword(String password ){
		this.password = password;
	}

	public String getUsername(){
		return  username;
	}
	public void setUsername(String username ){
		this.username = username;
	}

	public Date getLastLoginTime(){
		return  lastLoginTime;
	}
	public void setLastLoginTime(Date lastLoginTime ){
		this.lastLoginTime = lastLoginTime;
	}


}
