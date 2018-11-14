package gen;


import org.beetl.sql.core.annotatoin.Table;

import java.util.Date;

/*
* 工程信息
*/
@Table(name="T_PHARE_PROJECT")
public class Project extends org.beetl.sql.core.TailBean  {

	/*
	id
	*/
	private String id ;
	/*
	编码
	*/
	private String code ;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	/*
        名称
        */
	private String name ;
	/*
	描述
	*/
	private String description ;
	/*
	创建时间
	*/
	private Date createTime ;

	public Project() {
	}

	public String getId(){
		return  id;
	}

	public void setId(String id ){
		this.id = id;
	}

	public String getName(){
		return  name;
	}

	public void setName(String name ){
		this.name = name;
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


}
