listPageData
===
    select
    @pageTag(){
        t.*
    @}
    from T_DEPARTMENT_CONTROL t
    where 1=1
    @if(hasValue(createTime)){
    and t.CREATE_TIME = #createTime#
    and t.CREATE_TIME like #'%'+createTime+'%'#
    @}
    @if(hasValue(depId)){
    and t.DEP_ID = #depId#
    and t.DEP_ID like #'%'+depId+'%'#
    @}
    @if(hasValue(id)){
    and t.ID = #id#
    and t.ID like #'%'+id+'%'#
    @}
    @if(hasValue(type)){
    and t.TYPE = #type#
    @}
    @if(hasValue(userId)){
    and t.USER_ID = #userId#
    @}
    @pageIgnoreTag(){
    order by t.create_time desc
    @}
