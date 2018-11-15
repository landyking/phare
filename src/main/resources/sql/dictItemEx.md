getItemContentByDictAndCode
===
* 翻译自定字典下的字典项


	select i.content 
	from T_DICT_ITEM i 
	left join t_dict d on i.dict_id = d.id 
	where d.delete_flag=0 and d.code = #dictCode# and i.code = #itemCode#
	
listItemByDictCode
===
* 获取指定字典编码下的所有字典项


	select i.*
	from T_DICT_ITEM i 
	left join t_dict d on i.dict_id = d.id 
	where d.delete_flag=0 and d.code = #dictCode#

listItemByDictId
===
	select
	@pageTag(){
	t.*
	@}
	from T_DICT_ITEM t
	where t.dict_id = #id#
	@if(hasValue(code)){
	 and CODE like #'%'+code+'%'#
	@}
	@if(hasValue(content)){
	 and content like #'%'+content+'%'#
	@}
	@pageIgnoreTag(){
	order by t.code asc
	@}
