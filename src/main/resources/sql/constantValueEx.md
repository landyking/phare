listPageData
===
    select
    @pageTag(){
        t.*,c.name as constant_name
    @}
    from T_PHARE_CONSTANT_VALUE t
    left join t_phare_constant c on t.constant_id=c.id
    where 1=1
    @if(hasValue(id)){
    and t.ID = #id#
    and t.ID like #'%'+id+'%'#
    @}
    @if(hasValue(constantId)){
    and t.CONSTANT_ID = #constantId#
    @}
    @if(hasValue(name)){
    and t.NAME = #name#
    and t.NAME like #'%'+name+'%'#
    @}
    @if(hasValue(description)){
    and t.DESCRIPTION = #description#
    and t.DESCRIPTION like #'%'+description+'%'#
    @}
    @if(hasValue(createTime)){
    and t.CREATE_TIME = #createTime#
    and t.CREATE_TIME like #'%'+createTime+'%'#
    @}
    @pageIgnoreTag(){
    order by t.create_time desc
    @}
