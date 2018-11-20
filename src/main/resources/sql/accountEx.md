

listAccount
===
	select 
	@pageTag(){
        t.*,d.name as dep_name
    @}
	from T_ACCOUNT t 
	left join t_department d on t.dep_id = d.id
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