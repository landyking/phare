package gen;

import org.beetl.sql.core.annotatoin.Table;

import java.util.Date;


/*
* 权限表
* gen by beetlsql
*/
@Table(name="t_permission")
public class Permission extends org.beetl.sql.core.TailBean  {

	/*
	主键
	*/
	private String id ;
	/*
	菜单图标
	*/
	private String ico ;
	/*
	权限名称
	*/
	private String name ;
	/*
	排序号，小的优先级高
	*/
	private Long orderFlag ;
	/*
	父级权限ID
	*/
	private String pid ;
	/*
	菜单分类，0菜单，1按钮
	*/
	private Integer type ;
	/*
	资源访问路径
	*/
	private String url ;
	/*
	启用停用，1启用，0停用
	*/
	private Integer useFlag ;
	/*
	创建时间
	*/
	private Date createTime ;

	public Permission() {
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
	* 菜单图标
	*@return
	*/
	public String getIco(){
		return  ico;
	}
	/**
	* 菜单图标
	*@param  ico
	*/
	public void setIco(String ico ){
		this.ico = ico;
	}

	/**
	* 权限名称
	*@return
	*/
	public String getName(){
		return  name;
	}
	/**
	* 权限名称
	*@param  name
	*/
	public void setName(String name ){
		this.name = name;
	}

	/**
	* 排序号，小的优先级高
	*@return
	*/
	public Long getOrderFlag(){
		return  orderFlag;
	}
	/**
	* 排序号，小的优先级高
	*@param  orderFlag
	*/
	public void setOrderFlag(Long orderFlag ){
		this.orderFlag = orderFlag;
	}

	/**
	* 父级权限ID
	*@return
	*/
	public String getPid(){
		return  pid;
	}
	/**
	* 父级权限ID
	*@param  pid
	*/
	public void setPid(String pid ){
		this.pid = pid;
	}

	/**
	* 菜单分类，0菜单，1按钮
	*@return
	*/
	public Integer getType(){
		return  type;
	}
	/**
	* 菜单分类，0菜单，1按钮
	*@param  type
	*/
	public void setType(Integer type ){
		this.type = type;
	}

	/**
	* 资源访问路径
	*@return
	*/
	public String getUrl(){
		return  url;
	}
	/**
	* 资源访问路径
	*@param  url
	*/
	public void setUrl(String url ){
		this.url = url;
	}

	/**
	* 启用停用，1启用，0停用
	*@return
	*/
	public Integer getUseFlag(){
		return  useFlag;
	}
	/**
	* 启用停用，1启用，0停用
	*@param  useFlag
	*/
	public void setUseFlag(Integer useFlag ){
		this.useFlag = useFlag;
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
