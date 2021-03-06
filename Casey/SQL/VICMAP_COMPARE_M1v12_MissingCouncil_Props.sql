SELECT
    
	MissingCProps.LGA_Code AS "lga_code",
	'' AS "new_sub",
	MissingCProps.PR_PFI AS "property_PFI",
	'' AS "parcel_PFI",
	'' AS "Address_PFI",
	'' AS "spi",
	'' AS "plan_number",
	'' AS "lot_number",
	'' AS "base_propnum",
	'' AS "propnum",
	'' AS "crefno",
	'' AS "hsa_flag",
	'' AS "hsa_unit_id",
    MissingCProps.su_type AS "blg_unit_type",
    MissingCProps.su_prefix_1 AS "blg_unit_prefix_1",
    MissingCProps.su_no_1 AS "blg_unit_id_1",
    MissingCProps.su_suff_1 AS "blg_unit_suffix_1",
    '' AS "blg_unit_prefix_2",
    MissingCProps.su_no_2 AS "blg_unit_id_2",
    MissingCProps.su_suff_2 AS "blg_unit_suffix_2",
    MissingCProps.fl_type AS "floor_type",
    '' AS "floor_prefix_1",
    MissingCProps.fl_no_1 AS "floor_no_1",
    '' AS "floor_suffix_1",
    '' AS floor_prefix_2,
   MissingCProps.fl_no_2 AS floor_no_2,
    '' AS floor_suffix_2,
    '' AS building_name,
    '' AS complex_name,
    '' AS location_descriptor,
    '' AS "house_prefix_1",
    MissingCProps.house_number_1 AS "house_number_1",
    MissingCProps.house_suffix_1 AS "house_suffix_1",
    '' AS "house_prefix_2",
    MissingCProps.house_number_2 AS "house_number_2",
    MissingCProps.house_suffix_2 AS "house_suffix_2",
    '' AS access_type,
	'' AS new_road,
    MissingCProps.street_name AS "road_name",
    MissingCProps.street_type AS "road_type",
    MissingCProps.street_suffix AS "road_suffix",
    MissingCProps.locality AS "locality_name",
    '' AS "distance_related_flag",
	'' AS "is_primary",
	'' AS "easting",
	'' AS "northing",
	'' AS "datum/proj",
	'' AS "outside_property",
	
	CASE
        WHEN  MissingCProps.MultAss ='N'  THEN 'E'
		ELSE 'R'
	END AS "edit_code",
	'Council Property No in Vicmap invalid\retired - Property to be removed\retired' AS Comments
	

	
FROM
    TMP_VM_COMPARE_MissingCouncilProps_usingPropno AS MissingCProps 
