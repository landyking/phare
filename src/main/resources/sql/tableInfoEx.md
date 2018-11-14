listPageData
===
    select
    @pageTag(){
        t.*,
        p.name as project_name,
        (select count(0) from t_phare_table_column where table_id = t.id) as column_count
    @}
    from T_PHARE_TABLE_INFO t
    left join t_phare_project p on p.id=t.project_id
    where 1=1
    @if(!isEmpty(id)){
    and t.ID = #id#
    and t.ID like #'%'+id+'%'#
    @}
    @if(!isEmpty(projectId)){
    and t.PROJECT_ID = #projectId#
    and t.PROJECT_ID like #'%'+projectId+'%'#
    @}
    @if(!isEmpty(name)){
    and t.NAME = #name#
    and t.NAME like #'%'+name+'%'#
    @}
    @if(!isEmpty(description)){
    and t.DESCRIPTION = #description#
    and t.DESCRIPTION like #'%'+description+'%'#
    @}
    @if(!isEmpty(createTime)){
    and t.CREATE_TIME = #createTime#
    and t.CREATE_TIME like #'%'+createTime+'%'#
    @}
    @pageIgnoreTag(){
    order by t.code asc,t.create_time desc
    @}
