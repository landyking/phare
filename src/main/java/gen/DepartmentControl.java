package gen;
import org.beetl.sql.core.annotatoin.Table;
import java.util.Date;


/*
* 部门控制情况
*/
@Table(name="T_DEPARTMENT_CONTROL")
public class DepartmentControl extends org.beetl.sql.core.TailBean  {

	/*
	创建时间
	*/
	private Long createTime ;
	/*
	部门id
	*/
	private String depId ;
	/*
	主键
	*/
	private String id ;
	/*
	控制类型
	*/
	private Integer type ;
	/*
	用户id
	*/
	private String userId ;

	public DepartmentControl() {
	}

	public Long getCreateTime(){
		return  createTime;
	}

	public void setCreateTime(Long createTime ){
		this.createTime = createTime;
	}

	public String getDepId(){
		return  depId;
	}

	public void setDepId(String depId ){
		this.depId = depId;
	}

	public String getId(){
		return  id;
	}

	public void setId(String id ){
		this.id = id;
	}

	public Integer getType(){
		return  type;
	}

	public void setType(Integer type ){
		this.type = type;
	}

	public String getUserId(){
		return  userId;
	}

	public void setUserId(String userId ){
		this.userId = userId;
	}


}
