

listAccount
===
	select 
	@pageTag(){
        t.*
    @}
	from T_ACCOUNT t 
	where t.delete_flag=0
	@if(hasValue(username)){
	 and t.USERNAME like #'%'+username+'%'#
	@}
	@if(hasValue(description)){
     and t.description like #'%'+description+'%'#
    @}
	@if(hasValue(enableFlag)){
	 and t.ENABLE_FLAG=#enableFlag#
	@}
    @pageIgnoreTag(){
	order by t.username asc
	@}