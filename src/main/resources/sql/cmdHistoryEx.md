listPageData
===
    select
    @pageTag(){
        t.*,d.dev_no,d.name
    @}
    from T_CMD_HISTORY t
    left join t_device d on t.device_id = d.id
    where 1=1
    @if(!isEmpty(id)){
    and t.ID = #id#
    @}
    @if(!isEmpty(receiveTime)){
    and t.RECEIVE_TIME = #receiveTime#
    @}
    @if(!isEmpty(content)){
    and t.CONTENT like #'%'+content+'%'#
    @}
    @if(!isEmpty(responseTime)){
    and t.RESPONSE_TIME = #responseTime#
    @}
    @if(!isEmpty(createTime)){
    and t.CREATE_TIME = #createTime#
    @}
    @if(!isEmpty(name)){
    and d.NAME like #'%'+name+'%'#
    @}
    @if(!isEmpty(devNo)){
    and d.DEV_NO like #'%'+devNo+'%'#
    @}
    @pageIgnoreTag(){
    order by t.create_time desc
    @}