package gen;

import org.beetl.sql.core.annotatoin.Table;

import java.util.Date;


/*
* 角色用户关联表
* gen by beetlsql
*/
@Table(name="t_role_user")
public class RoleUser extends org.beetl.sql.core.TailBean  {

	/*
	主键
	*/
	private String id ;
	/*
	角色id
	*/
	private String roleId ;
	/*
	用户id
	*/
	private String userId ;
	/*
	创建时间
	*/
	private Date createTime ;

	public RoleUser() {
	}

	/**
	* 主键
	*@return
	*/
	public String getId(){
		return  id;
	}
	/**
	* 主键
	*@param  id
	*/
	public void setId(String id ){
		this.id = id;
	}

	/**
	* 角色id
	*@return
	*/
	public String getRoleId(){
		return  roleId;
	}
	/**
	* 角色id
	*@param  roleId
	*/
	public void setRoleId(String roleId ){
		this.roleId = roleId;
	}

	/**
	* 用户id
	*@return
	*/
	public String getUserId(){
		return  userId;
	}
	/**
	* 用户id
	*@param  userId
	*/
	public void setUserId(String userId ){
		this.userId = userId;
	}

	/**
	* 创建时间
	*@return
	*/
	public Date getCreateTime(){
		return  createTime;
	}
	/**
	* 创建时间
	*@param  createTime
	*/
	public void setCreateTime(Date createTime ){
		this.createTime = createTime;
	}


}
