loadRoleByUser
===
	select 
	t.*
	from T_ROLE t
	left join t_role_user ru on ru.role_id = t.id
	where  ru.user_id = #userId#
	
	