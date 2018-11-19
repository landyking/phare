listPageData
===
    select
    @pageTag(){
        t.*
    @}
    from T_DEPARTMENT t
    where 1=1
    @if(hasValue(address)){
    and t.ADDRESS = #address#
    and t.ADDRESS like #'%'+address+'%'#
    @}
    @if(hasValue(createTime)){
    and t.CREATE_TIME = #createTime#
    and t.CREATE_TIME like #'%'+createTime+'%'#
    @}
    @if(hasValue(description)){
    and t.DESCRIPTION = #description#
    and t.DESCRIPTION like #'%'+description+'%'#
    @}
    @if(hasValue(id)){
    and t.ID = #id#
    and t.ID like #'%'+id+'%'#
    @}
    @if(hasValue(latitude)){
    and t.LATITUDE = #latitude#
    and t.LATITUDE like #'%'+latitude+'%'#
    @}
    @if(hasValue(longitude)){
    and t.LONGITUDE = #longitude#
    and t.LONGITUDE like #'%'+longitude+'%'#
    @}
    @if(hasValue(name)){
    and t.NAME = #name#
    and t.NAME like #'%'+name+'%'#
    @}
    @if(hasValue(pid)){
    and t.PID = #pid#
    and t.PID like #'%'+pid+'%'#
    @}
    @if(hasValue(updateTime)){
    and t.UPDATE_TIME = #updateTime#
    and t.UPDATE_TIME like #'%'+updateTime+'%'#
    @}
    @pageIgnoreTag(){
    order by t.create_time desc
    @}
