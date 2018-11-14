listPermission
===
	select
    @pageTag(){
    t.*
    @}
	from T_PERMISSION  t
	@if(!isEmpty(roleId)){
	left join t_role_permission rp on rp.permission_id = t.id
	@}
	where 1=1
	@if(!isEmpty(roleId)){
	 and rp.role_id = #roleId#
	@}
	@if(!isEmpty(id)){
	 and t.ID = #id#
	@}	
	@if(!isEmpty(useFlag)){
	 and t.use_flag = #useFlag#
	@}
	@if(!isEmpty(pid)){
	 and t.pid = #pid#
	@}
	@if(!isEmpty(name)){
	 and t.NAME like #'%'+name+'%'#
	@}
    @pageIgnoreTag(){
	order by t.id asc
	@}

listAuthPermission
===
    select
    p.*
    from t_role_user ru
    left join t_role_permission rp on ru.role_id = rp.role_id
    left join t_permission p on rp.permission_id = p.id
    where
    p.use_flag = 1
    and ru.user_id= #userId#