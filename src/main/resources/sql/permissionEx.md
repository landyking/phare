listPermission
===
	select
    @pageTag(){
    t.*
    @}
	from T_PERMISSION  t
	@if(hasValue(roleId)){
	left join t_role_permission rp on rp.permission_id = t.id
	@}
	where 1=1
	@if(hasValue(roleId)){
	 and rp.role_id = #roleId#
	@}
	@if(hasValue(id)){
	 and t.ID = #id#
	@}	
	@if(hasValue(useFlag)){
	 and t.use_flag = #useFlag#
	@}
	@if(hasValue(pid)){
	 and t.pid = #pid#
	@}
	@if(hasValue(name)){
	 and t.NAME like #'%'+name+'%'#
	@}
    @pageIgnoreTag(){
	order by t.pid asc,t.order_flag asc
	@}

listAuthPermission
===
    select
    distinct(p.id),p.*
    from t_role_user ru
    left join t_role_permission rp on ru.role_id = rp.role_id
    left join t_permission p on rp.permission_id = p.id
    where
    p.use_flag = 1
    and ru.user_id= #userId#