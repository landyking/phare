listPageData
===
    select
    @pageTag(){
        t.*,p.name as project_name
    @}
    from T_PHARE_CONSTANT t
    left join t_phare_project p on t.project_id = p.id
    where 1=1
    @if(!isEmpty(id)){
    and t.ID like #'%'+id+'%'#
    @}
    @if(!isEmpty(projectId)){
    and t.PROJECT_ID = #projectId#
    and t.PROJECT_ID like #'%'+projectId+'%'#
    @}
    @if(!isEmpty(name)){
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
    order by t.create_time desc
    @}
