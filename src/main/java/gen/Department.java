package gen;
import org.beetl.sql.core.annotatoin.Table;
import java.util.Date;


/*
* 单位信息表
*/
@Table(name="T_DEPARTMENT")
public class Department extends org.beetl.sql.core.TailBean  {

	/*
	单位地址
	*/
	private String address ;
	/*
	创建时间
	*/
	private Long createTime ;
	/*
	描述
	*/
	private String description ;
	/*
	主键|单位编号
	*/
	private String id ;
	/*
	纬度
	*/
	private String latitude ;
	/*
	经度
	*/
	private String longitude ;
	/*
	单位名称
	*/
	private String name ;
	/*
	上级单位id
	*/
	private String pid ;
	/*
	更新时间
	*/
	private Long updateTime ;

	public Department() {
	}

	public String getAddress(){
		return  address;
	}

	public void setAddress(String address ){
		this.address = address;
	}

	public Long getCreateTime(){
		return  createTime;
	}

	public void setCreateTime(Long createTime ){
		this.createTime = createTime;
	}

	public String getDescription(){
		return  description;
	}

	public void setDescription(String description ){
		this.description = description;
	}

	public String getId(){
		return  id;
	}

	public void setId(String id ){
		this.id = id;
	}

	public String getLatitude(){
		return  latitude;
	}

	public void setLatitude(String latitude ){
		this.latitude = latitude;
	}

	public String getLongitude(){
		return  longitude;
	}

	public void setLongitude(String longitude ){
		this.longitude = longitude;
	}

	public String getName(){
		return  name;
	}

	public void setName(String name ){
		this.name = name;
	}

	public String getPid(){
		return  pid;
	}

	public void setPid(String pid ){
		this.pid = pid;
	}

	public Long getUpdateTime(){
		return  updateTime;
	}

	public void setUpdateTime(Long updateTime ){
		this.updateTime = updateTime;
	}


}
