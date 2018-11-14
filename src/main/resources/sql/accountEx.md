

listAccount
===
	select 
	@pageTag(){
        t.*
    @}
	from T_ACCOUNT t 
	where t.delete_flag=0
	@if(!isEmpty(username)){
	 and t.USERNAME like #'%'+username+'%'#
	@}
	@if(!isEmpty(description)){
     and t.description like #'%'+description+'%'#
    @}
	@if(!isEmpty(enableFlag)){
	 and t.ENABLE_FLAG=#enableFlag#
	@}
    @pageIgnoreTag(){
	order by t.username asc
	@}