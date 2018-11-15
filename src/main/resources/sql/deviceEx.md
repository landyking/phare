listPageData
===
    select
    @pageTag(){
        t.*
    @}
    from T_DEVICE t
    where 1=1
    @if(hasValue(id)){
    and t.ID = #id#
    @}
    @if(hasValue(name)){
    and t.NAME like #'%'+name+'%'#
    @}
    @if(hasValue(type)){
    and t.TYPE = #type#
    @}
    @if(hasValue(devNo)){
    and t.DEV_NO like #'%'+devNo+'%'#
    @}
    @if(hasValue(authType)){
    and t.AUTH_TYPE = #authType#
    @}
    @if(hasValue(certificate)){
    and t.CERTIFICATE = #certificate#
    @}
    @if(hasValue(enableFlag)){
    and t.ENABLE_FLAG = #enableFlag#
    @}
    @if(hasValue(deleteFlag)){
    and t.DELETE_FLAG = #deleteFlag#
    @}
    @if(hasValue(createTime)){
    and t.CREATE_TIME = #createTime#
    @}
    @if(hasValue(updateTime)){
    and t.UPDATE_TIME = #updateTime#
    @}
    @pageIgnoreTag(){
    order by t.create_time desc
    @}
    