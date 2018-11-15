listPageData
===
    select
    @pageTag(){
        t.*,d.dev_no,d.name
    @}
    from T_DEVICE_CAPTURE_POLICY t
    left join t_device d on d.id = t.device_id
    where 1=1
    @if(hasValue(id)){
    and t.ID = #id#
    @}
    @if(hasValue(deviceId)){
    and t.DEVICE_ID = #deviceId#
    @}
    @if(hasValue(protocol)){
    and t.PROTOCOL = #protocol#
    @}
    @if(hasValue(sip)){
    and t.SIP like #'%'+sip+'%'#
    @}
    @if(hasValue(dip)){
    and t.DIP like #'%'+dip+'%'#
    @}
    @if(hasValue(sport)){
    and t.SPORT = #sport#
    @}
    @if(hasValue(dport)){
    and t.DPORT = #dport#
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
    @if(hasValue(name)){
    and d.NAME like #'%'+name+'%'#
    @}
    @if(hasValue(devNo)){
    and d.DEV_NO like #'%'+devNo+'%'#
    @}
    @pageIgnoreTag(){
    order by t.create_time desc
    @}