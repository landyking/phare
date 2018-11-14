listPageData
===
    select
    @pageTag(){
        t.*
    @}
    from T_PHARE_PROJECT t
    where 1=1
    @if(!isEmpty(id)){
    and t.ID = #id#
    and t.ID like #'%'+id+'%'#
    @}
    @if(!isEmpty(code)){
    and t.code like #'%'+code+'%'#
    @}
    @if(!isEmpty(name)){
    and t.NAME like #'%'+name+'%'#
    @}
    @if(!isEmpty(description)){
    and t.DESCRIPTION like #'%'+description+'%'#
    @}
    @if(!isEmpty(createTime)){
    and t.CREATE_TIME = #createTime#
    and t.CREATE_TIME like #'%'+createTime+'%'#
    @}
    @pageIgnoreTag(){
    order by t.create_time desc
    @}
