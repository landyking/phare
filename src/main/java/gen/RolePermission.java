package gen;

import org.beetl.sql.core.annotatoin.Table;

import java.util.Date;


/*
* 角色权限关联表
* gen by beetlsql
*/
@Table(name="t_role_permission")
public class RolePermission extends org.beetl.sql.core.TailBean  {

	/*
	主键
	*/
	private String id ;
	/*
	权限id
	*/
	private String permissionId ;
	/*
	角色id
	*/
	private String roleId ;
	/*
	创建时间
	*/
	private Date createTime ;

	public RolePermission() {
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
	* 权限id
	*@return
	*/
	public String getPermissionId(){
		return  permissionId;
	}
	/**
	* 权限id
	*@param  permissionId
	*/
	public void setPermissionId(String permissionId ){
		this.permissionId = permissionId;
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
