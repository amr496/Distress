SELECT 
-- Section Meta-data
pmu_meta_tenths.timestamp, 
pmu_meta_tenths.pmsdb_year,
pmu_meta_tenths.section_id,
pmu_meta_tenths.profiler_date,
pmu_meta_tenths.mega_id,
pmu_meta_tenths.record_guid,
pmu_meta_tenths.uid,
pmu_meta_tenths.lane_count,
pmu_meta_tenths.sri, 
pmu_meta_tenths.mp_start,
pmu_meta_tenths.mp_end,
pmu_meta_tenths.collection_type,

-- NHS / HPMS / 
pmu_meta_tenths.nhs,
pmu_meta_tenths.hpms,
pmu_meta_tenths.bridge,

-- Pavement Info
 pmu_meta_tenths.pave_type, pmu_meta_tenths.surface_type,
 pmu_meta_tenths.surf_segment_pavement_type,
-- Pre-Calculated Indices
pmu_indexes_tenths.dot_gfp, pmu_indexes_tenths.sdia,
pmu_indexes_tenths.ndia, pmu_indexes_tenths.ldia,

-- IRI and RUT  
 pmu_distress_tenths.liri, pmu_distress_tenths.riri, pmu_distress_tenths.airi, 
 pmu_distress_tenths.lrut_max, pmu_distress_tenths.rrut_max, pmu_distress_tenths.avg_rut,
  
-- Pothole and Depression
 pmu_distress_tenths.bc_pothole_count, pmu_distress_tenths.bc_pothole_size, pmu_distress_tenths.bc_pothole_size_avg, 
 pmu_distress_tenths.bc_depression,

-- BC Raveling Percentage
 pmu_distress_tenths.bc_raveling_mod,
 pmu_distress_tenths.bc_raveling_sev,
 pmu_distress_tenths.bc_raveling_sl,

-- BC Cracking Percentage Zone 1,3,5
 pmu_distress_tenths.bc_longitudinal_mod,
 pmu_distress_tenths.bc_longitudinal_sev,
 pmu_distress_tenths.bc_longitudinal_sl,
 pmu_distress_tenths.bc_pattern_mod,
 pmu_distress_tenths.bc_pattern_sev,
 pmu_distress_tenths.bc_pattern_sl,
 pmu_distress_tenths.bc_transverse_mod,
 pmu_distress_tenths.bc_transverse_sev,
 pmu_distress_tenths.bc_transverse_sl,

-- BC Cracking Percentage Zone 2,4 
 pmu_distress_tenths.bc_wp_longitudinal_mod,
 pmu_distress_tenths.bc_wp_longitudinal_sev,
 pmu_distress_tenths.bc_wp_longitudinal_sl,
 pmu_distress_tenths.bc_wp_pattern_mod,
 pmu_distress_tenths.bc_wp_pattern_sev,
 pmu_distress_tenths.bc_wp_pattern_sl,

-- BC Cracking Lengths Zone 1,3,5
 pmu_distress_tenths.bc_length_longitudinal_mod,
 pmu_distress_tenths.bc_length_longitudinal_sev,
 pmu_distress_tenths.bc_length_longitudinal_sl,
 pmu_distress_tenths.bc_length_transverse_mod,
 pmu_distress_tenths.bc_length_transverse_sev,
 pmu_distress_tenths.bc_length_transverse_sl,

-- BC Cracking Lengths Zone 2,4
 pmu_distress_tenths.bc_wp_length_longitudinal_mod,
 pmu_distress_tenths.bc_wp_length_longitudinal_sev,
 pmu_distress_tenths.bc_wp_length_longitudinal_sl,

--RC Basics
 pmu_distress_tenths.rc_crack_mod, pmu_distress_tenths.rc_crack_sev, pmu_distress_tenths.rc_crack_sl,
 pmu_distress_tenths.rc_fault_max, pmu_distress_tenths.rc_cracked_slab_count,
 pmu_distress_tenths.rc_joint_count, pmu_distress_tenths.rc_slab_count, pmu_distress_tenths.rc_spalling,
 
--RC Lengths
 pmu_distress_tenths.rc_length_longitudinal_spalling_mod,
 pmu_distress_tenths.rc_length_longitudinal_spalling_sev,
 pmu_distress_tenths.rc_length_longitudinal_spalling_sl,
 pmu_distress_tenths.rc_length_transverse_spalling_mod,
 pmu_distress_tenths.rc_length_transverse_spalling_sev,
 pmu_distress_tenths.rc_length_transverse_spalling_sl,
 
-- Random (Don't know if long joint issue was really utilized correctly. Test Speed would be good filter.)
 pmu_distress_tenths.bc_longitudinal_joint_issue, 
 pmu_distress_tenths.average_testing_speed,
 
 -- Manual Only BC
 pmu_distress_tenths.patch_sl,
 pmu_distress_tenths.patch_mod,
 pmu_distress_tenths.patch_sev,
 pmu_distress_tenths.shoulder_deterioration_sl,
 pmu_distress_tenths.shoulder_deterioration_mod,
 pmu_distress_tenths.shoulder_deterioration_sev,
 pmu_distress_tenths.shoulder_drop_sl,
 pmu_distress_tenths.shoulder_drop_mod,
 pmu_distress_tenths.shoulder_drop_sev,
-- Manual Only RC
 pmu_distress_tenths.rc_fault_sl,
 pmu_distress_tenths.rc_fault_mod,
 pmu_distress_tenths.rc_fault_sev,
 

-- Calculate some of the basic items here
-- -- BC Percentage Totals Full Mat
(pmu_distress_tenths.bc_raveling_mod + pmu_distress_tenths.bc_raveling_sev + 
 pmu_distress_tenths.bc_raveling_sl) AS sum_bc_raveling_mat,
 
(pmu_distress_tenths.bc_transverse_mod + pmu_distress_tenths.bc_transverse_sev +
 pmu_distress_tenths.bc_transverse_sl) AS sum_bc_trans_mat,

(pmu_distress_tenths.bc_pattern_sl + pmu_distress_tenths.bc_pattern_mod + pmu_distress_tenths.bc_pattern_sev + pmu_distress_tenths.bc_wp_pattern_sl + pmu_distress_tenths.bc_wp_pattern_mod +
pmu_distress_tenths.bc_wp_pattern_sev) AS sum_bc_pattern_cracking_mat,

CAST((pmu_distress_tenths.bc_longitudinal_sl + pmu_distress_tenths.bc_longitudinal_mod + 
 pmu_distress_tenths.bc_longitudinal_sev + pmu_distress_tenths.bc_wp_longitudinal_sl +
pmu_distress_tenths.bc_wp_longitudinal_mod + pmu_distress_tenths.bc_wp_longitudinal_sev) AS FLOAT) AS sum_bc_long_cracking_mat,

-- -- BC Percentage Totals Zone 1,3,5 (Non-Wheel-Path) (Trans is always full mat...)
(pmu_distress_tenths.bc_pattern_sl + pmu_distress_tenths.bc_pattern_mod + 
 pmu_distress_tenths.bc_pattern_sev) AS sum_bc_pattern_cracking_135,
 
 (pmu_distress_tenths.bc_longitudinal_sl + pmu_distress_tenths.bc_longitudinal_mod + 
 pmu_distress_tenths.bc_longitudinal_sev) AS sum_bc_long_cracking_135,
 
 (pmu_distress_tenths.bc_wp_longitudinal_sl + pmu_distress_tenths.bc_wp_longitudinal_mod +
  pmu_distress_tenths.bc_wp_longitudinal_sev) AS sum_bc_wp_long_cracking,

-- -- BC Length Totals Zones 1,3,5 (Non-Wheel-Path) (Trans is always full mat ...)
 (pmu_distress_tenths.bc_length_longitudinal_mod + pmu_distress_tenths.bc_length_longitudinal_sev + pmu_distress_tenths.bc_length_longitudinal_sl) AS sum_bc_length_long_135,

(pmu_distress_tenths.bc_length_transverse_mod + pmu_distress_tenths.bc_length_transverse_sev +
 pmu_distress_tenths.bc_length_transverse_sl) AS sum_bc_len_trans_135,
 
-- -- BC Length Totals Zones 2,4, (Wheel-Path)
 (pmu_distress_tenths.bc_wp_length_longitudinal_mod + pmu_distress_tenths.bc_wp_length_longitudinal_sev +
 pmu_distress_tenths.bc_wp_length_longitudinal_sl) AS sum_bc_wp_length_long,
 
 (pmu_distress_tenths.bc_wp_pattern_mod + pmu_distress_tenths.bc_wp_pattern_sev + pmu_distress_tenths.bc_wp_pattern_sl) AS sum_bc_wp_pattern,

-- -- RC Percentage Totals Full Mat (We don't have zoned Concrete Distresses)
(pmu_distress_tenths.rc_crack_sl + pmu_distress_tenths.rc_crack_mod +
pmu_distress_tenths.rc_crack_sev) AS sum_rc_cracking_mat,

-- -- RC Length Totals Full Mat
(pmu_distress_tenths.rc_length_longitudinal_spalling_mod + pmu_distress_tenths.rc_length_longitudinal_spalling_sev + pmu_distress_tenths.rc_length_longitudinal_spalling_sl) AS sum_rc_long_spall_len, 

(pmu_distress_tenths.rc_length_transverse_spalling_mod + pmu_distress_tenths.rc_length_transverse_spalling_sev + pmu_distress_tenths.rc_length_transverse_spalling_sl ) AS sum_rc_trans_spall_len,

-- BC percentage totals (Manual Only)
(pmu_distress_tenths.patch_sl + pmu_distress_tenths.patch_mod + pmu_distress_tenths.patch_sev) AS sum_patch,

 (pmu_distress_tenths.shoulder_deterioration_sl + pmu_distress_tenths.shoulder_deterioration_mod +
 pmu_distress_tenths.shoulder_deterioration_sev) AS sum_shoulder_deterioration,
 
 (pmu_distress_tenths.shoulder_drop_sl + pmu_distress_tenths.shoulder_drop_mod + pmu_distress_tenths.shoulder_drop_sev) AS sum_shoulder_drop,
 
-- -- RC Percentage Total Fault (Manual Only)
 pmu_distress_tenths.rc_fault_sl + pmu_distress_tenths.rc_fault_mod + pmu_distress_tenths.rc_fault_sev AS sum_rc_fault,

-- -- NHPP (Wheelpath Only, with lane width adjustment for wheelpath size)
(pmu_distress_tenths.bc_wp_pattern_sl + pmu_distress_tenths.bc_wp_pattern_mod +
pmu_distress_tenths.bc_wp_pattern_sev + pmu_distress_tenths.bc_wp_longitudinal_sl +
pmu_distress_tenths.bc_wp_longitudinal_mod + pmu_distress_tenths.bc_wp_longitudinal_sev) AS sum_bc_wp_cracking_nhpp

 FROM public.pmu_meta_tenths

LEFT JOIN public.pmu_indexes_tenths
ON pmu_meta_tenths.mega_id=pmu_indexes_tenths.mega_id

LEFT JOIN public.pmu_distress_tenths
ON pmu_meta_tenths.mega_id=pmu_distress_tenths.mega_id

WHERE

 pmu_meta_tenths.timestamp BETWEEN '2016-01-01 23:59:00'::timestamp
                 AND '2019-12-31 23:59:00'::timestamp AND pmu_meta_tenths.collection_type = 'A'

ORDER BY mega_id
LIMIT 1000;