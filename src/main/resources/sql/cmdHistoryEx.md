listPageData
===
    select
    @pageTag(){
        t.*,d.dev_no,d.name
    @}
    from T_CMD_HISTORY t
    left join t_device d on t.device_id = d.id
    where 1=1
    @if(hasValue(id)){
    and t.ID = #id#
    @}
    @if(hasValue(receiveTime)){
    and t.RECEIVE_TIME = #receiveTime#
    @}
    @if(hasValue(content)){
    and t.CONTENT like #'%'+content+'%'#
    @}
    @if(hasValue(responseTime)){
    and t.RESPONSE_TIME = #responseTime#
    @}
    @if(hasValue(createTime)){
    and t.CREATE_TIME = #createTime#
    @}
    @if(hasValue(name)){
    and d.NAME like #'%'+name+'%'#
    @}
    @if(hasValue(devNo)){
    and d.DEV_NO like #'%'+devNo+'%'#
    @}
    @pageIgnoreTag(){
    order by t.create_time desc
    @}