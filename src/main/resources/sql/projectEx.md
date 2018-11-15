listPageData
===
    select
    @pageTag(){
        t.*
    @}
    from T_PHARE_PROJECT t
    where 1=1
    @if(hasValue(id)){
    and t.ID = #id#
    and t.ID like #'%'+id+'%'#
    @}
    @if(hasValue(code)){
    and t.code like #'%'+code+'%'#
    @}
    @if(hasValue(name)){
    and t.NAME like #'%'+name+'%'#
    @}
    @if(hasValue(description)){
    and t.DESCRIPTION like #'%'+description+'%'#
    @}
    @if(hasValue(createTime)){
    and t.CREATE_TIME = #createTime#
    and t.CREATE_TIME like #'%'+createTime+'%'#
    @}
    @pageIgnoreTag(){
    order by t.create_time desc
    @}
