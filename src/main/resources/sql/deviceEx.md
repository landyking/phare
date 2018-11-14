listPageData
===
    select
    @pageTag(){
        t.*
    @}
    from T_DEVICE t
    where 1=1
    @if(!isEmpty(id)){
    and t.ID = #id#
    @}
    @if(!isEmpty(name)){
    and t.NAME like #'%'+name+'%'#
    @}
    @if(!isEmpty(type)){
    and t.TYPE = #type#
    @}
    @if(!isEmpty(devNo)){
    and t.DEV_NO like #'%'+devNo+'%'#
    @}
    @if(!isEmpty(authType)){
    and t.AUTH_TYPE = #authType#
    @}
    @if(!isEmpty(certificate)){
    and t.CERTIFICATE = #certificate#
    @}
    @if(!isEmpty(enableFlag)){
    and t.ENABLE_FLAG = #enableFlag#
    @}
    @if(!isEmpty(deleteFlag)){
    and t.DELETE_FLAG = #deleteFlag#
    @}
    @if(!isEmpty(createTime)){
    and t.CREATE_TIME = #createTime#
    @}
    @if(!isEmpty(updateTime)){
    and t.UPDATE_TIME = #updateTime#
    @}
    @pageIgnoreTag(){
    order by t.create_time desc
    @}
    