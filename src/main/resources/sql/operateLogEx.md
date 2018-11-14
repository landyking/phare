listOperateLog
===
	select
	@pageTag(){
    t.*,a.username
    @}
	from T_OPERATE_LOG t 
	left join t_account a on t.operator = a.id
	where 1=1
	@if(!isEmpty(type)){
	 and t.TYPE = #type#
	@}
	@if(!isEmpty(description)){
	 and t.DESCRIPTION like #'%'+description+'%'#
	@}
	@if(!isEmpty(username)){
	 and a.username like #'%'+username+'%'#
	@}
    @if(!isEmpty(dateMin)){
        and t.create_time >= #dateMin#
    @}
    @if(!isEmpty(dateMax)){
        and t.create_time < #nextDay(dateMax)#
    @}
	@pageIgnoreTag(){
	order by t.create_time desc
	@}
	