listPageData
===
    select
    @pageTag(){
        t.*,d.dev_no,d.name
    @}
    from T_DEVICE_CAPTURE_POLICY t
    left join t_device d on d.id = t.device_id
    where 1=1
    @if(!isEmpty(id)){
    and t.ID = #id#
    @}
    @if(!isEmpty(deviceId)){
    and t.DEVICE_ID = #deviceId#
    @}
    @if(!isEmpty(protocol)){
    and t.PROTOCOL = #protocol#
    @}
    @if(!isEmpty(sip)){
    and t.SIP like #'%'+sip+'%'#
    @}
    @if(!isEmpty(dip)){
    and t.DIP like #'%'+dip+'%'#
    @}
    @if(!isEmpty(sport)){
    and t.SPORT = #sport#
    @}
    @if(!isEmpty(dport)){
    and t.DPORT = #dport#
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
    @if(!isEmpty(name)){
    and d.NAME like #'%'+name+'%'#
    @}
    @if(!isEmpty(devNo)){
    and d.DEV_NO like #'%'+devNo+'%'#
    @}
    @pageIgnoreTag(){
    order by t.create_time desc
    @}