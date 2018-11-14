package gen;

import org.beetl.sql.core.annotatoin.Table;

import java.util.Date;


/*
* 字典项表
* gen by beetlsql
*/
@Table(name="t_dict_item")
public class DictItem extends org.beetl.sql.core.TailBean  {

	private String id ;
	private String code ;
	private String content ;
	private String dictId ;
	private Date createTime ;
	private Date updateTime ;

	public DictItem() {
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

	public String getContent(){
		return  content;
	}
	public void setContent(String content ){
		this.content = content;
	}

	public String getDictId(){
		return  dictId;
	}
	public void setDictId(String dictId ){
		this.dictId = dictId;
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
