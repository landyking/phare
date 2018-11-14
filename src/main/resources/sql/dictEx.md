listDict
===
	select
	@pageTag(){
    t.*
    @}
	from T_DICT t 
	where
	delete_flag=0
	@if(!isEmpty(code)){
	 and CODE like #'%'+code+'%'#
	@}
	@if(!isEmpty(description)){
	 and DESCRIPTION like #'%'+description+'%'#
	@}
	@pageIgnoreTag(){
	order by t.code asc
	@}