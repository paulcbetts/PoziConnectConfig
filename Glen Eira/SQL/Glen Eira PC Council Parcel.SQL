select
    *,
    case
        when plan_number <> '' and lot_number = '' then plan_number
        when plan_number <> '' and sec <> '' then lot_number || '~' || sec || '\' || plan_number
        when plan_number <> '' then lot_number || '\' || plan_number
        when ( parish_code <> '' or township_code <> '' ) then
            allotment ||
            case when sec <> '' then '~' || sec else '' end ||
            '\PP' ||
            case when township_code <> '' then township_code else parish_code end
        else ''
    end as spi,
    case
        when plan_numeral <> '' and lot_number = '' then plan_numeral
        when plan_number <> '' and sec <> '' then lot_number || '~' || sec || '\' || plan_numeral
        when plan_numeral <> '' then lot_number || '\' || plan_numeral
        when ( parish_code <> '' or township_code <> '' ) then
            allotment ||
            case when sec <> '' then '~' || sec else '' end ||
            '\' ||
            case when township_code <> '' then township_code else parish_code end
        else ''
    end as simple_spi
from
(
select distinct
    cast ( cast ( lraassm.assmnumber as integer ) as varchar ) as propnum,
    lpaparc.status as status,
    '' as crefno,
    ifnull ( lpaparc.fmtparcel , '' ) as summary,
    case
        when lpaparc.plannum is null then cast (null as varchar)
        else cast ( trim (lpaparc.plancode ) ||
            case
                when substr ( trim ( lpaparc.plannum ) , -1 ) > '9' and substr ( trim ( lpaparc.plannum ) , 1 ) <> '0' then substr ( lpaparc.plannum , 1 , ( length ( trim ( plannum ) ) -1 ) )
                when substr ( trim ( lpaparc.plannum ) , 2 ) = '00'  then substr ( lpaparc.plannum , 3 , 99 )
                when substr ( trim ( lpaparc.plannum ) , 1 ) = '0'  then substr ( lpaparc.plannum , 2 , 99 )
                else trim ( lpaparc.plannum )
            end as varchar)
    end as plan_number,
    ifnull ( lpaparc.plancode , '' ) as plan_prefix,
    case
        when substr ( trim ( lpaparc.plannum ) , -1 ) > '9' and substr ( trim ( lpaparc.plannum ) , 1 ) <> '0' then substr ( lpaparc.plannum , 1 , ( length ( trim ( plannum ) ) -1 ) )
        when substr ( trim ( lpaparc.plannum ) , 2 ) = '00'  then substr ( lpaparc.plannum , 3 , 99 )
        when substr ( trim ( lpaparc.plannum ) , 1 ) = '0'  then substr ( lpaparc.plannum , 2 , 99 )
        else trim ( lpaparc.plannum )
    end as plan_numeral,
    ifnull ( lpaparc.parcelnum , '' ) as lot_number,
    ifnull ( lpaparc.parcelnum , '' ) as allotment,
    ifnull ( lpasect.parcelsect , '' ) as sec,
    '' as parish_code,
    '' as township_code,
    '322' as lga_code
from
   Pathway_lpaprop as lpaprop left outer join
   Pathway_lpaprti as lpaprti  ON lpaprop.tpklpaprop = lpaprti.tfklpaprop left outer join
   Pathway_lpatipa as lpatipa  ON lpaprti.tfklpatitl = lpatipa.tfklpatitl left outer join
   Pathway_lpaparc as lpaparc  ON lpatipa.tfklpaparc = lpaparc.tpklpaparc left outer join
   Pathway_lpasect as lpasect ON lpaparc.tpklpaparc = lpasect.tfklpaparc left outer join
   Pathway_lparole_filtered as lparole_filt ON lpaprop.tpklpaprop = lparole_filt.tfklocl left outer join
   Pathway_lraassm as lraassm ON lparole_filt.tfkappl = lraassm.tpklraassm  
where
   lpaparc.status <> 'H' and   
   lraassm.applicatn = 'R' and
   lpaprop.tfklpacncl = 13
)