listPageData
===
    select
    @pageTag(){
        t.*,
        tb.code as table_code
    @}
    from T_PHARE_TABLE_COLUMN t
    left join t_phare_table_info tb on t.table_id = tb.id
    where 1=1
    @if(!isEmpty(id)){
    and t.ID = #id#
    and t.ID like #'%'+id+'%'#
    @}
    @if(!isEmpty(tableId)){
    and t.TABLE_ID = #tableId#
    @}
    @if(!isEmpty(name)){
    and t.NAME = #name#
    and t.NAME like #'%'+name+'%'#
    @}
    @if(!isEmpty(description)){
    and t.DESCRIPTION = #description#
    and t.DESCRIPTION like #'%'+description+'%'#
    @}
    @if(!isEmpty(nullableFlag)){
    and t.NULLABLE_FLAG = #nullableFlag#
    and t.NULLABLE_FLAG like #'%'+nullableFlag+'%'#
    @}
    @if(!isEmpty(pkFlag)){
    and t.PK_FLAG = #pkFlag#
    and t.PK_FLAG like #'%'+pkFlag+'%'#
    @}
    @if(!isEmpty(fkId)){
    and t.FK_ID = #fkId#
    and t.FK_ID like #'%'+fkId+'%'#
    @}
    @if(!isEmpty(defVal)){
    and t.DEF_VAL = #defVal#
    and t.DEF_VAL like #'%'+defVal+'%'#
    @}
    @if(!isEmpty(dataType)){
    and t.DATA_TYPE = #dataType#
    and t.DATA_TYPE like #'%'+dataType+'%'#
    @}
    @if(!isEmpty(dbType)){
    and t.DB_TYPE = #dbType#
    and t.DB_TYPE like #'%'+dbType+'%'#
    @}
    @if(!isEmpty(typeLength)){
    and t.TYPE_LENGTH = #typeLength#
    and t.TYPE_LENGTH like #'%'+typeLength+'%'#
    @}
    @if(!isEmpty(typePrecision)){
    and t.TYPE_PRECISION = #typePrecision#
    and t.TYPE_PRECISION like #'%'+typePrecision+'%'#
    @}
    @if(!isEmpty(constantId)){
    and t.CONSTANT_ID = #constantId#
    and t.CONSTANT_ID like #'%'+constantId+'%'#
    @}
    @if(!isEmpty(createTime)){
    and t.CREATE_TIME = #createTime#
    and t.CREATE_TIME like #'%'+createTime+'%'#
    @}
    @pageIgnoreTag(){
    order by t.code asc,t.create_time desc
    @}
