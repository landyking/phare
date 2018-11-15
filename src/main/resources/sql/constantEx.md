listPageData
===
    select
    @pageTag(){
        t.*,p.name as project_name
    @}
    from T_PHARE_CONSTANT t
    left join t_phare_project p on t.project_id = p.id
    where 1=1
    @if(hasValue(id)){
    and t.ID like #'%'+id+'%'#
    @}
    @if(hasValue(projectId)){
    and t.PROJECT_ID = #projectId#
    and t.PROJECT_ID like #'%'+projectId+'%'#
    @}
    @if(hasValue(name)){
    and t.NAME like #'%'+name+'%'#
    @}
    @if(hasValue(description)){
    and t.DESCRIPTION = #description#
    and t.DESCRIPTION like #'%'+description+'%'#
    @}
    @if(hasValue(createTime)){
    and t.CREATE_TIME = #createTime#
    and t.CREATE_TIME like #'%'+createTime+'%'#
    @}
    @pageIgnoreTag(){
    order by t.create_time desc
    @}
