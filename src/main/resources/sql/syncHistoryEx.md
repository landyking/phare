listPageData
===
    select
    @pageTag(){
        t.*
    @}
    from T_SYNC_HISTORY t
    where 1=1
    @if(hasValue(id)){
    and t.ID = #id#
    @}
    @if(hasValue(dataType)){
    and t.data_type = #dataType#
    @}
    @if(hasValue(triggerType)){
    and t.trigger_type = #triggerType#
    @}
    @if(hasValue(updateCount)){
    and t.UPDATE_COUNT = #updateCount#
    @}
    @if(hasValue(latestTime)){
    and t.LATEST_TIME = #latestTime#
    @}
    @if(hasValue(createTime)){
    and t.CREATE_TIME = #createTime#
    @}
    @if(hasValue(dateMin)){
    and t.CREATE_TIME >= #dateMin.time#
    @}
    @if(hasValue(dateMax)){
    and t.CREATE_TIME < #nextDay(dateMax.time)#
    @}
    @pageIgnoreTag(){
    order by t.create_time desc
    @}