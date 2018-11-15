listDict
===
	select
	@pageTag(){
    t.*
    @}
	from T_DICT t 
	where
	delete_flag=0
	@if(hasValue(code)){
	 and CODE like #'%'+code+'%'#
	@}
	@if(hasValue(description)){
	 and DESCRIPTION like #'%'+description+'%'#
	@}
	@pageIgnoreTag(){
	order by t.code asc
	@}