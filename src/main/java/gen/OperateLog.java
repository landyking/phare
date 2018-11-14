package gen;

import org.beetl.sql.core.annotatoin.Table;

import java.util.Date;


/*
* 日志信息
* gen by beetlsql
*/
@Table(name="t_operate_log")
public class OperateLog extends org.beetl.sql.core.TailBean  {

	private String id ;
	private String description ;
	/*
	操作人
	*/
	private String operator ;
	private Long type ;
	private Date createTime ;

	public OperateLog() {
	}

	public String getId(){
		return  id;
	}
	public void setId(String id ){
		this.id = id;
	}

	public String getDescription(){
		return  description;
	}
	public void setDescription(String description ){
		this.description = description;
	}

	/**
	* 操作人
	*@return
	*/
	public String getOperator(){
		return  operator;
	}
	/**
	* 操作人
	*@param  operator
	*/
	public void setOperator(String operator ){
		this.operator = operator;
	}

	public Long getType(){
		return  type;
	}
	public void setType(Long type ){
		this.type = type;
	}

	public Date getCreateTime(){
		return  createTime;
	}
	public void setCreateTime(Date createTime ){
		this.createTime = createTime;
	}


}
