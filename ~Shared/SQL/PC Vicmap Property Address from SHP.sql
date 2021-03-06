select
    property.prop_pfi as property_pfi,
    property.pr_lgac as lga_code,
    ifnull ( property.pr_propnum , '' ) as propnum,
    property.pr_multass as multi_assessment,
    property.pr_stat as status,
    address.pfi as address_pfi,
    substr ( address.ezi_add , 1 , length ( address.ezi_add ) - 5 ) as ezi_address,
    address.source as source,
    ifnull ( address.src_verif , '' ) as src_verified,
    address.is_primary as is_primary,
    address.dist_flag as distance_related_flag,
    ifnull ( address.loc_desc , '' ) as location_descriptor,
    ifnull ( address.blgunttyp , '' ) as blg_unit_type,
    ifnull ( address.hsa_flag , '' ) as hsa_flag,
    ifnull ( address.hsaunitid , '' ) as hsa_unit_id,
    ifnull ( address.bunit_pre1 , '' ) as blg_unit_prefix_1,
    address.bunit_id1 as blg_unit_id_1,
    ifnull ( address.bunit_suf1 , '' ) as blg_unit_suffix_1,
    ifnull ( address.bunit_pre2 , '' ) as blg_unit_prefix_2,
    address.bunit_id2 as blg_unit_id_2,
    ifnull ( address.bunit_suf2 , '' ) as blg_unit_suffix_2,
    ifnull ( address.floor_type , '' ) as floor_type,
    ifnull ( address.fl_pref1 , '' ) as floor_prefix_1,
    address.floor_no_1 as floor_no_1,
    ifnull ( address.fl_suf1 , '' ) as floor_suffix_1,
    ifnull ( address.fl_pref2 , '' ) as floor_prefix_2,
    address.floor_no_2 as floor_no_2,
    ifnull ( address.fl_suf2 , '' ) as floor_suffix_2,
    ifnull ( address.building , '' ) as building_name,
    ifnull ( address.complex , '' ) as complex_name,
    ifnull ( address.hse_pref1 , '' ) as house_prefix_1,
    address.hse_num1 as house_number_1,
    ifnull ( address.hse_suf1 , '' ) as house_suffix_1,
    ifnull ( address.hse_pref2 , '' ) as house_prefix_2,
    address.hse_num2 as house_number_2,
    ifnull ( address.hse_suf2 , '' ) as house_suffix_2,
    ifnull ( address.road_name , '' ) as road_name,
    ifnull ( address.road_type , '' ) as road_type,
    ifnull ( address.rd_suf , '' ) as road_suffix,
    address.locality as locality_name,
    address.num_rd_add as num_road_address,
    ifnull ( address.num_add , '' ) as num_address,
    address.add_class as address_class,
    address.accesstype as access_type,
    address.out_prop as outside_property,
    property.geometry as property_geometry,
    address.geometry as address_geometry
from
    VMPROP_PROPERTY property,   
    VMADD_ADDRESS address
where
    property.prop_pfi = address.pr_pfi and  
    property.pr_ptype = 'O' and 
    address.is_primary = 'Y'