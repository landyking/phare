package gen;

import org.beetl.sql.core.annotatoin.Table;

import java.util.Date;


/*
* 角色表
* gen by beetlsql
*/
@Table(name="t_role")
public class Role extends org.beetl.sql.core.TailBean  {

	/*
	主键
	*/
	private String id ;
	/*
	角色名称
	*/
	private String name ;
	/*
	创建时间
	*/
	private Date createTime ;

	public Role() {
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
	* 角色名称
	*@return
	*/
	public String getName(){
		return  name;
	}
	/**
	* 角色名称
	*@param  name
	*/
	public void setName(String name ){
		this.name = name;
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
