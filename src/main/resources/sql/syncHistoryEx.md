listPageData
===
    select
    @pageTag(){
        t.*
    @}
    from T_SYNC_HISTORY t
    where 1=1
    @if(!isEmpty(id)){
    and t.ID = #id#
    @}
    @if(!isEmpty(dataType)){
    and t.data_type = #dataType#
    @}
    @if(!isEmpty(triggerType)){
    and t.trigger_type = #triggerType#
    @}
    @if(!isEmpty(updateCount)){
    and t.UPDATE_COUNT = #updateCount#
    @}
    @if(!isEmpty(latestTime)){
    and t.LATEST_TIME = #latestTime#
    @}
    @if(!isEmpty(createTime)){
    and t.CREATE_TIME = #createTime#
    @}
    @if(!isEmpty(dateMin)){
    and t.CREATE_TIME >= #dateMin.time#
    @}
    @if(!isEmpty(dateMax)){
    and t.CREATE_TIME < #nextDay(dateMax.time)#
    @}
    @pageIgnoreTag(){
    order by t.create_time desc
    @}