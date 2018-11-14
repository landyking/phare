package gen;
import org.beetl.sql.core.annotatoin.Table;
import java.util.Date;


/*
* 列信息
*/
@Table(name="T_PHARE_TABLE_COLUMN")
public class TableColumn extends org.beetl.sql.core.TailBean  {

	/*
	id
	*/
	private String id ;
	/*
	所属表
	*/
	private String tableId ;
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
	可空
	*/
	private Integer nullableFlag ;
	/*
	是否主键
	*/
	private Integer pkFlag ;
	/*
	外键引用id
	*/
	private String fkId ;
	/*
	默认值
	*/
	private String defVal ;
	/*
	数据类型
	*/
	private String dataType ;
	/*
	数据库类型
	*/
	private String dbType ;
	/*
	类型长度
	*/
	private Integer typeLength ;
	/*
	类型精度
	*/
	private Integer typePrecision ;
	/*
	常量引用id
	*/
	private String constantId ;
	/*
	创建时间
	*/
	private Date createTime ;

	public TableColumn() {
	}

	public String getId(){
		return  id;
	}

	public void setId(String id ){
		this.id = id;
	}

	public String getTableId(){
		return  tableId;
	}

	public void setTableId(String tableId ){
		this.tableId = tableId;
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

	public Integer getNullableFlag(){
		return  nullableFlag;
	}

	public void setNullableFlag(Integer nullableFlag ){
		this.nullableFlag = nullableFlag;
	}

	public Integer getPkFlag(){
		return  pkFlag;
	}

	public void setPkFlag(Integer pkFlag ){
		this.pkFlag = pkFlag;
	}

	public String getFkId(){
		return  fkId;
	}

	public void setFkId(String fkId ){
		this.fkId = fkId;
	}

	public String getDefVal(){
		return  defVal;
	}

	public void setDefVal(String defVal ){
		this.defVal = defVal;
	}

	public String getDataType(){
		return  dataType;
	}

	public void setDataType(String dataType ){
		this.dataType = dataType;
	}

	public String getDbType(){
		return  dbType;
	}

	public void setDbType(String dbType ){
		this.dbType = dbType;
	}

	public Integer getTypeLength(){
		return  typeLength;
	}

	public void setTypeLength(Integer typeLength ){
		this.typeLength = typeLength;
	}

	public Integer getTypePrecision(){
		return  typePrecision;
	}

	public void setTypePrecision(Integer typePrecision ){
		this.typePrecision = typePrecision;
	}

	public String getConstantId(){
		return  constantId;
	}

	public void setConstantId(String constantId ){
		this.constantId = constantId;
	}

	public Date getCreateTime(){
		return  createTime;
	}

	public void setCreateTime(Date createTime ){
		this.createTime = createTime;
	}


}
