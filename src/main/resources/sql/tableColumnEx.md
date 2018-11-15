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
    @if(hasValue(id)){
    and t.ID = #id#
    and t.ID like #'%'+id+'%'#
    @}
    @if(hasValue(tableId)){
    and t.TABLE_ID = #tableId#
    @}
    @if(hasValue(name)){
    and t.NAME = #name#
    and t.NAME like #'%'+name+'%'#
    @}
    @if(hasValue(description)){
    and t.DESCRIPTION = #description#
    and t.DESCRIPTION like #'%'+description+'%'#
    @}
    @if(hasValue(nullableFlag)){
    and t.NULLABLE_FLAG = #nullableFlag#
    and t.NULLABLE_FLAG like #'%'+nullableFlag+'%'#
    @}
    @if(hasValue(pkFlag)){
    and t.PK_FLAG = #pkFlag#
    and t.PK_FLAG like #'%'+pkFlag+'%'#
    @}
    @if(hasValue(fkId)){
    and t.FK_ID = #fkId#
    and t.FK_ID like #'%'+fkId+'%'#
    @}
    @if(hasValue(defVal)){
    and t.DEF_VAL = #defVal#
    and t.DEF_VAL like #'%'+defVal+'%'#
    @}
    @if(hasValue(dataType)){
    and t.DATA_TYPE = #dataType#
    and t.DATA_TYPE like #'%'+dataType+'%'#
    @}
    @if(hasValue(dbType)){
    and t.DB_TYPE = #dbType#
    and t.DB_TYPE like #'%'+dbType+'%'#
    @}
    @if(hasValue(typeLength)){
    and t.TYPE_LENGTH = #typeLength#
    and t.TYPE_LENGTH like #'%'+typeLength+'%'#
    @}
    @if(hasValue(typePrecision)){
    and t.TYPE_PRECISION = #typePrecision#
    and t.TYPE_PRECISION like #'%'+typePrecision+'%'#
    @}
    @if(hasValue(constantId)){
    and t.CONSTANT_ID = #constantId#
    and t.CONSTANT_ID like #'%'+constantId+'%'#
    @}
    @if(hasValue(createTime)){
    and t.CREATE_TIME = #createTime#
    and t.CREATE_TIME like #'%'+createTime+'%'#
    @}
    @pageIgnoreTag(){
    order by t.code asc,t.create_time desc
    @}
