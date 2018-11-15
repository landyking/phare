listOperateLog
===
	select
	@pageTag(){
    t.*,a.username
    @}
	from T_OPERATE_LOG t 
	left join t_account a on t.operator = a.id
	where 1=1
	@if(hasValue(type)){
	 and t.TYPE = #type#
	@}
	@if(hasValue(description)){
	 and t.DESCRIPTION like #'%'+description+'%'#
	@}
	@if(hasValue(username)){
	 and a.username like #'%'+username+'%'#
	@}
    @if(hasValue(dateMin)){
        and t.create_time >= #dateMin#
    @}
    @if(hasValue(dateMax)){
        and t.create_time < #nextDay(dateMax)#
    @}
	@pageIgnoreTag(){
	order by t.create_time desc
	@}
	