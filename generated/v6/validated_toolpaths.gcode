; HEADER_BLOCK_START
; BambuStudio 02.08.02.61
; model printing time: 12m 58s; total estimated time: 19m 16s
; total layer number: 73
; total filament length [mm] : 897.72
; total filament volume [cm^3] : 2159.28
; total filament weight [g] : 2.68
; filament_density: 1.24
; filament_diameter: 1.75
; max_z_height: 14.60
; filament: 1
; support_material_on_wipe_tower: 0
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; accel_to_decel_enable = 0
; accel_to_decel_factor = 50%
; activate_air_filtration = 0
; additional_cooling_fan_speed = 70
; additional_fan_full_speed_layer = 0
; alternate_extra_wall = 0
; ams_filament_load_time_ams = 0
; ams_filament_load_time_ams_lite = 0
; ams_filament_load_time_n3f_s = 0
; ams_filament_unload_time_ams = 0
; ams_filament_unload_time_ams_lite = 0
; ams_filament_unload_time_n3f_s = 0
; apply_scarf_seam_on_circles = 1
; auxiliary_fan = 0
; avoid_crossing_wall_includes_support = 0
; bed_custom_model = 
; bed_custom_texture = 
; bed_exclude_area = 
; bed_heat_soak_area = 
; bed_temperature_formula = by_first_filament
; before_layer_change_gcode = 
; best_object_pos = 0.5,0.5
; bottom_color_penetration_layers = 3
; bottom_shell_layers = 5
; bottom_shell_thickness = 1
; bottom_surface_density = 100%
; bottom_surface_pattern = monotonic
; bridge_angle = 0
; bridge_flow = 1
; bridge_no_support = 0
; bridge_speed = 50
; brim_object_gap = 0.1
; brim_type = auto_brim
; brim_width = 5
; chamber_temperatures = 0
; change_filament_gcode = ;===== A1 20251031 =======================\nM1007 S0 ; turn off mass estimation\nG392 S0\nM620 S[next_extruder]A\nM204 S9000\nG1 Z{max_layer_z + 3.0} F1200\n\nM400\nM106 P1 S0\nM106 P2 S0\n{if old_filament_temp > 142 && next_extruder < 255}\nM104 S[old_filament_temp]\n{endif}\n\nG1 X267 F18000\n\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E-{retraction_distances_when_cut[previous_extruder]} F1200\n{else}\nM620.11 S0\n{endif}\nM400\n\nM620.1 E F{flush_volumetric_speeds[previous_extruder]/2.4053*60} T{flush_temperatures[previous_extruder]}\nM620.10 A0 F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nT[next_extruder]\nM620.1 E F{flush_volumetric_speeds[next_extruder]/2.4053*60} T{flush_temperatures[next_extruder]}\nM620.10 A1 F{flush_volumetric_speeds[next_extruder]/2.4053*60} L[flush_length] H[nozzle_diameter] T{flush_temperatures[next_extruder]}\n\nG1 Y128 F9000\n\n{if next_extruder < 255}\n\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nM628 S1\nG92 E0\nG1 E{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nM400\nM629 S1\n{else}\nM620.11 S0\n{endif}\n\nM400\nG92 E0\nM628 S0\n\n{if flush_length_1 > 1}\n; FLUSH_START\n; always use highest temperature to flush\nM400\nM1002 set_filament_type:UNKNOWN\nM109 S[flush_temperatures[next_extruder]]\nM106 P1 S60\n{if flush_length_1 > 23.7}\nG1 E23.7 F{flush_volumetric_speeds[previous_extruder]/2.4053*60} ; do not need pulsatile flushing for start part\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\n{else}\nG1 E{flush_length_1} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\n{endif}\n; FLUSH_END\nG1 E-[old_retract_length_toolchange] F1800\nG1 E[old_retract_length_toolchange] F300\nM400\nM1002 set_filament_type:{filament_type[next_extruder]}\n{endif}\n\n{if flush_length_1 > 45 && flush_length_2 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_2 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_2 > 45 && flush_length_3 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_3 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_3 > 45 && flush_length_4 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_4 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\n; FLUSH_END\n{endif}\n\nM629\n\nM400\nM106 P1 S60\nM109 S[new_filament_temp]\nG1 E6 F{flush_volumetric_speeds[next_extruder]/2.4053*60} ;Compensate for filament spillage during waiting temperature\nM400\nG92 E0\nG1 E-[new_retract_length_toolchange] F1800\nM400\nM106 P1 S178\nM400 S3\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nM400\nG1 Z{max_layer_z + 3.0} F3000\nM106 P1 S0\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\n\nM622.1 S0\nM9833 F{outer_wall_volumetric_speed/2.4} A0.3 ; cali dynamic extrusion compensation\nM1002 judge_flag filament_need_cali_flag\nM622 J1\n  G92 E0\n  G1 E-[new_retract_length_toolchange] F1800\n  M400\n  \n  M106 P1 S178\n  M400 S4\n  G1 X-38.2 F18000\n  G1 X-48.2 F3000\n  G1 X-38.2 F18000 ;wipe and shake\n  G1 X-48.2 F3000\n  G1 X-38.2 F12000 ;wipe and shake\n  G1 X-48.2 F3000\n  M400\n  M106 P1 S0 \nM623\n\nM621 S[next_extruder]A\nG392 S0\n\nM1007 S1\n
; circle_compensation_manual_offset = 0
; circle_compensation_speed = 200
; close_additional_fan_first_x_layers = 1
; close_fan_the_first_x_layers = 1
; complete_print_exhaust_fan_speed = 70
; cool_plate_temp = 35
; cool_plate_temp_initial_layer = 35
; cooling_filter_enabled = 0
; cooling_perimeter_transition_distance = 10
; cooling_slowdown_logic = uniform_cooling
; counter_coef_1 = 0
; counter_coef_2 = 0.008
; counter_coef_3 = -0.041
; counter_limit_max = 0.033
; counter_limit_min = -0.035
; counterbore_hole_bridging = none
; curr_bed_type = Textured PEI Plate
; default_acceleration = 6000
; default_ams_type = -1
; default_filament_colour = ""
; default_filament_profile = "Bambu PLA Basic @BBL A1"
; default_jerk = 0
; default_nozzle_volume_type = Standard
; default_print_profile = 0.20mm Standard @BBL A1
; deretraction_speed = 30
; detect_floating_vertical_shell = 1
; detect_narrow_internal_solid_infill = 1
; detect_overhang_wall = 1
; detect_thin_wall = 0
; diameter_limit = 50
; different_settings_to_system = bottom_shell_layers;bottom_shell_thickness;skeleton_infill_density;skin_infill_density;sparse_infill_density;sparse_infill_pattern;top_shell_layers;top_shell_thickness;wall_loops;;
; draft_shield = disabled
; during_print_exhaust_fan_speed = 70
; elefant_foot_compensation = 0.075
; embedding_wall_into_infill = 0
; enable_arc_fitting = 1
; enable_circle_compensation = 0
; enable_filament_dynamic_map = 0
; enable_height_slowdown = 0
; enable_long_retraction_when_cut = 2
; enable_mixed_color_sublayer = 0
; enable_order_independent_overlap_carving = 0
; enable_overhang_bridge_fan = 1
; enable_overhang_speed = 1
; enable_pre_heating = 0
; enable_pressure_advance = 0
; enable_prime_tower = 1
; enable_support = 0
; enable_support_ironing = 0
; enable_tower_interface_features = 0
; enable_wrapping_detection = 0
; enforce_support_layers = 0
; eng_plate_temp = 0
; eng_plate_temp_initial_layer = 0
; ensure_vertical_shell_thickness = enabled
; exclude_object = 1
; extruder_ams_count = 1#0|4#0;
; extruder_clearance_dist_to_rod = 56.5
; extruder_clearance_height_to_lid = 256
; extruder_clearance_height_to_rod = 25
; extruder_clearance_max_radius = 73
; extruder_colour = #018001
; extruder_max_nozzle_count = 1
; extruder_nozzle_stats = Standard#1
; extruder_nozzle_stats_new = Standard#1
; extruder_offset = 0x0
; extruder_printable_area = 
; extruder_type = Direct Drive
; extruder_variant_list = "Direct Drive Standard"
; fan_cooling_layer_time = 80
; fan_direction = undefine
; fan_max_speed = 80
; fan_min_speed = 60
; farthest_point_timelapse = 0
; filament_adaptive_volumetric_speed = 0
; filament_adhesiveness_category = 100
; filament_bridge_speed = 25
; filament_change_length = 10
; filament_change_length_nc = 10
; filament_colour = #00AE42
; filament_colour_type = 1
; filament_cooling_before_tower = 0
; filament_cost = 20
; filament_density = 1.24
; filament_dev_ams_drying_ams_limitations = 1;0
; filament_dev_ams_drying_heat_distortion_temperature = 45
; filament_dev_ams_drying_temperature = 45,45,45,45
; filament_dev_ams_drying_time = 12,12,12,12
; filament_dev_chamber_drying_bed_temperature = 70
; filament_dev_chamber_drying_time = 12
; filament_dev_drying_cooling_temperature = 45
; filament_dev_drying_softening_temperature = 50
; filament_diameter = 1.75
; filament_enable_overhang_speed = 1
; filament_end_gcode = "; filament end gcode \n\n"
; filament_extruder_compatibility = 0
; filament_extruder_variant = "Direct Drive Standard"
; filament_flow_ratio = 0.98
; filament_flush_temp = 0
; filament_flush_temp_fast = 0
; filament_flush_volumetric_speed = 0
; filament_ids = GFL99
; filament_is_mixed = 0
; filament_is_support = 0
; filament_map = 1
; filament_map_2 = 0
; filament_map_mode = Auto For Flush
; filament_max_volumetric_speed = 12
; filament_metal_stickiness = None
; filament_minimal_purge_on_wipe_tower = 15
; filament_mixed_components = ""
; filament_mixed_gradient = 0
; filament_mixed_gradient_curve = ""
; filament_mixed_gradient_per_part = 0
; filament_mixed_gradient_range = ""
; filament_mixed_sublayer_ratios = ""
; filament_multi_colour = #00AE42
; filament_notes = 
; filament_nozzle_map = 0
; filament_overhang_1_4_speed = 0
; filament_overhang_2_4_speed = 50
; filament_overhang_3_4_speed = 30
; filament_overhang_4_4_speed = 10
; filament_overhang_totally_speed = 10
; filament_pre_cooling_temperature = 0
; filament_pre_cooling_temperature_nc = 0
; filament_preheat_temperature_delta = 0
; filament_prime_volume = 45
; filament_prime_volume_nc = 60
; filament_printable = 3
; filament_ramming_travel_time = 0
; filament_ramming_travel_time_nc = 0
; filament_ramming_volumetric_speed = -1
; filament_ramming_volumetric_speed_nc = -1
; filament_retract_length_nc = 14
; filament_scarf_gap = 15%
; filament_scarf_height = 10%
; filament_scarf_length = 10
; filament_scarf_seam_type = none
; filament_self_index = 1
; filament_settings_id = "Generic PLA @BBL A1"
; filament_shrink = 100%
; filament_soluble = 0
; filament_start_gcode = "; filament start gcode\n{if  (bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S255\n{elsif(bed_temperature[current_extruder] >35)||(bed_temperature_initial_layer[current_extruder] >35)}M106 P3 S180\n{endif};Prevent PLA from jamming\n\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}"
; filament_tower_interface_pre_extrusion_dist = 10
; filament_tower_interface_pre_extrusion_length = 0
; filament_tower_interface_print_temp = -1
; filament_tower_interface_purge_volume = 20
; filament_tower_ironing_area = 4
; filament_type = PLA
; filament_velocity_adaptation_factor = 1
; filament_vendor = Generic
; filament_volume_map = 0
; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
; fill_multiline = 1
; filter_out_gap_fill = 0
; first_layer_print_sequence = 0
; first_x_layer_fan_speed = 0
; first_x_layer_part_fan_speed = 0
; flush_into_infill = 0
; flush_into_objects = 0
; flush_into_support = 1
; flush_multiplier = 1
; flush_multiplier_fast = 1.2
; flush_volumes_matrix = 0
; flush_volumes_vector = 140,140
; full_fan_speed_layer = 0
; fuzzy_skin = none
; fuzzy_skin_first_layer = 0
; fuzzy_skin_mode = displacement
; fuzzy_skin_noise_type = classic
; fuzzy_skin_octaves = 4
; fuzzy_skin_persistence = 0.5
; fuzzy_skin_point_distance = 0.8
; fuzzy_skin_scale = 1
; fuzzy_skin_thickness = 0.3
; gap_infill_speed = 250
; gcode_add_line_number = 0
; gcode_flavor = marlin
; grab_length = 17.4
; group_algo_with_time = 0
; has_filament_switcher = 0
; has_scarf_joint_seam = 0
; head_wrap_detect_zone = 226x224,256x224,256x256,226x256
; hole_coef_1 = 0
; hole_coef_2 = -0.008
; hole_coef_3 = 0.23415
; hole_limit_max = 0.22
; hole_limit_min = 0.088
; host_type = octoprint
; hot_plate_temp = 65
; hot_plate_temp_initial_layer = 65
; hotend_cooling_rate = 2
; hotend_heating_rate = 2
; impact_strength_z = 10
; independent_support_layer_height = 1
; infill_combination = 0
; infill_direction = 45
; infill_instead_top_bottom_surfaces = 0
; infill_jerk = 9
; infill_lock_depth = 1
; infill_rotate_step = 0
; infill_shift_step = 0.4
; infill_wall_overlap = 15%
; inherits_group = ;;
; initial_layer_acceleration = 500
; initial_layer_flow_ratio = 1
; initial_layer_infill_speed = 105
; initial_layer_jerk = 9
; initial_layer_line_width = 0.5
; initial_layer_print_height = 0.2
; initial_layer_speed = 50
; initial_layer_travel_acceleration = 6000
; inner_wall_acceleration = 0
; inner_wall_jerk = 9
; inner_wall_line_width = 0.45
; inner_wall_speed = 300
; interface_shells = 0
; interlocking_beam = 0
; interlocking_beam_layer_count = 2
; interlocking_beam_width = 0.8
; interlocking_boundary_avoidance = 2
; interlocking_depth = 2
; interlocking_orientation = 22.5
; internal_bridge_support_thickness = 0.8
; internal_solid_infill_line_width = 0.42
; internal_solid_infill_pattern = zig-zag
; internal_solid_infill_speed = 250
; ironing_direction = 45
; ironing_fan_speed = -1
; ironing_flow = 10%
; ironing_inset = 0.21
; ironing_pattern = zig-zag
; ironing_spacing = 0.15
; ironing_speed = 30
; ironing_type = no ironing
; is_infill_first = 0
; layer_change_gcode = ; layer num/total_layer_count: {layer_num+1}/[total_layer_count]\n; update layer progress\nM73 L{layer_num+1}\nM991 S0 P{layer_num} ;notify layer change
; layer_height = 0.2
; line_width = 0.42
; locked_skeleton_infill_pattern = zigzag
; locked_skin_infill_pattern = crosszag
; long_retractions_when_cut = 0
; long_retractions_when_ec = 0
; machine_bed_mass_Y = 0
; machine_end_gcode = ;===== date: 20260513 =====================\nG392 S0 ;turn off nozzle clog detect\n\nM400 ; wait for buffer to clear\nG92 E0 ; zero the extruder\nG90\nG1 Z{max_layer_z + 0.4} F900 ; lower z a little\nG1 X0 Y{first_layer_center_no_wipe_tower[1]} F18000 ; move to safe pos\nG1 X-13.0 F3000 ; move to safe pos\n{if !spiral_mode && print_sequence != \"by object\"}\nM1002 judge_flag timelapse_record_flag\nM622 J1\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM991 S0 P-1 ;end timelapse at safe pos\nM623\n{endif}\n\nM140 S0 ; turn off bed\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off remote part cooling fan\nM106 P3 S0 ; turn off chamber cooling fan\n\n;G1 X27 F15000 ; wipe\n\n; pull back filament to AMS\nM620 S255\nG1 X267 F15000\nT255\nG1 X-28.5 F18000\nG1 X-48.2 F3000\nG1 X-28.5 F18000\nG1 X-48.2 F3000\nM621 S255\n\nM104 S0 ; turn off hotend\n\nM400 ; wait all motion done\nM17 S\nM17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom\n{if (max_layer_z + 100.0) < 256}\n    G1 Z{max_layer_z + 100.0} F600\n    G1 Z{max_layer_z +98.0}\n{else}\n    G1 Z256 F600\n    G1 Z256\n{endif}\nM400 P100\nM17 R ; restore z current\n\nG90\nG1 X-48 Y180 F3600\n\nM220 S100  ; Reset feedrate magnitude\nM201.2 K1.0 ; Reset acc magnitude\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 0\n\n;=====printer finish  sound=========\nM17\nM400 S1\nM1006 S1\nM1006 A0 B20 L100 C37 D20 M40 E42 F20 N60\nM1006 A0 B10 L100 C44 D10 M60 E44 F10 N60\nM1006 A0 B10 L100 C46 D10 M80 E46 F10 N80\nM1006 A44 B20 L100 C39 D20 M60 E48 F20 N60\nM1006 A0 B10 L100 C44 D10 M60 E44 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A0 B10 L100 C39 D10 M60 E39 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A0 B10 L100 C44 D10 M60 E44 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A0 B10 L100 C39 D10 M60 E39 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A0 B10 L100 C48 D10 M60 E44 F10 N80\nM1006 A0 B10 L100 C0 D10 M60 E0 F10  N80\nM1006 A44 B20 L100 C49 D20 M80 E41 F20 N80\nM1006 A0 B20 L100 C0 D20 M60 E0 F20 N80\nM1006 A0 B20 L100 C37 D20 M30 E37 F20 N60\nM1006 W\n;=====printer finish  sound=========\n\n;M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power\nM400\nM18 X Y Z\n\n
; machine_hotend_change_time = 0
; machine_load_filament_time = 25
; machine_max_acceleration_e = 5000,5000
; machine_max_acceleration_extruding = 12000,12000
; machine_max_acceleration_retracting = 5000,5000
; machine_max_acceleration_travel = 9000,9000
; machine_max_acceleration_x = 12000,12000
; machine_max_acceleration_y = 12000,12000
; machine_max_acceleration_z = 1500,1500
; machine_max_force_Y = 0
; machine_max_jerk_e = 3,3
; machine_max_jerk_x = 9,9
; machine_max_jerk_y = 9,9
; machine_max_jerk_z = 3,3
; machine_max_printed_mass = 0
; machine_max_speed_e = 30,30
; machine_max_speed_x = 500,200
; machine_max_speed_y = 500,200
; machine_max_speed_z = 30,30
; machine_min_extruding_rate = 0,0
; machine_min_travel_rate = 0,0
; machine_pause_gcode = M400 U1
; machine_prepare_compensation_time = 260
; machine_start_gcode = ;===== machine: A1 =========================\n;===== date: 20260513 ==================\nG392 S0\nM9833.2\n;M400\n;M73 P1.717\n\n;===== start to heat heatbead&hotend==========\nM1002 gcode_claim_action : 2\nM1002 set_filament_type:{filament_type[initial_no_support_extruder]}\nM104 S140\nM140 S[bed_temperature_initial_layer_single]\n\n;=====start printer sound ===================\nM17\nM400 S1\nM1006 S1\nM1006 A0 B10 L100 C37 D10 M60 E37 F10 N60\nM1006 A0 B10 L100 C41 D10 M60 E41 F10 N60\nM1006 A0 B10 L100 C44 D10 M60 E44 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A43 B10 L100 C46 D10 M70 E39 F10 N80\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N80\nM1006 A0 B10 L100 C43 D10 M60 E39 F10 N80\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N80\nM1006 A0 B10 L100 C41 D10 M80 E41 F10 N80\nM1006 A0 B10 L100 C44 D10 M80 E44 F10 N80\nM1006 A0 B10 L100 C49 D10 M80 E49 F10 N80\nM1006 A0 B10 L100 C0 D10 M80 E0 F10 N80\nM1006 A44 B10 L100 C48 D10 M60 E39 F10 N80\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N80\nM1006 A0 B10 L100 C44 D10 M80 E39 F10 N80\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N80\nM1006 A43 B10 L100 C46 D10 M60 E39 F10 N80\nM1006 W\nM18 \n;=====start printer sound ===================\n\n;=====avoid end stop =================\nG91\nG380 S2 Z40 F1200\nG380 S3 Z-15 F1200\nG90\n\n;===== reset machine status =================\n;M290 X39 Y39 Z8\nM204 S6000\n\nM630 S0 P0\nG91\nM17 Z0.3 ; lower the z-motor current\n\nG90\nM17 X0.65 Y1.2 Z0.6 ; reset motor current to default\nM960 S5 P1 ; turn on logo lamp\nG90\nM220 S100 ;Reset Feedrate\nM221 S100 ;Reset Flowrate\nM73.2   R1.0 ;Reset left time magnitude\n;M211 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem\n\n;====== cog noise reduction=================\nM982.2 S1 ; turn on cog noise reduction\n\nM1002 gcode_claim_action : 13\n\nG28 X\nG91\nG1 Z5 F1200\nG90\nG0 X128 F30000\nG0 Y254 F3000\nG91\nG1 Z-5 F1200\n\nM109 S25 H140\n\nM17 E0.3\nM83\nG1 E10 F1200\nG1 E-0.5 F30\nM17 D\n\nG28 Z P0 T140; home z with low precision,permit 300deg temperature\nM104 S{nozzle_temperature_initial_layer[initial_extruder]}\n\nM1002 judge_flag build_plate_detect_flag\nM622 S1\n  G39.4\n  G90\n  G1 Z5 F1200\nM623\n\n;M400\n;M73 P1.717\n\n;===== prepare print temperature and material ==========\nM1002 gcode_claim_action : 24\n\nM400\n;G392 S1\nM211 X0 Y0 Z0 ;turn off soft endstop\nM975 S1 ; turn on\n\nG90\nG1 X-28.5 F30000\nG1 X-48.2 F3000\n\nM620 M ;enable remap\nM620 S[initial_no_support_extruder]A   ; switch material if AMS exist\n    M1002 gcode_claim_action : 4\n    M400\n    M1002 set_filament_type:UNKNOWN\n    M109 S[nozzle_temperature_initial_layer]\n{if (filament_type[initial_no_support_extruder] == \"PLA\") && (nozzle_diameter != 0.2)}\n    M104 S220\n{else}\n    M104 S250\n{endif}\n    M400\n    T[initial_no_support_extruder]\n    G1 X-48.2 F3000\n    M400\n\n{if (filament_type[initial_no_support_extruder] == \"PLA\") && (nozzle_diameter != 0.2)}\n    M620.1 E F{flush_volumetric_speeds[initial_no_support_extruder]/2.4053*60} T220\n    M109 S220 ;set nozzle to common flush temp\n{else}\n    M620.1 E F{flush_volumetric_speeds[initial_no_support_extruder]/2.4053*60} T{flush_temperatures[initial_no_support_extruder]}\n    M109 S250 ;set nozzle to common flush temp\n{endif}\n    M106 P1 S0\n    G92 E0\n    G1 E50 F200\n    M400\n    M1002 set_filament_type:{filament_type[initial_no_support_extruder]}\nM621 S[initial_no_support_extruder]A\n\n{if (filament_type[initial_no_support_extruder] == \"PLA\") && (nozzle_diameter != 0.2)}\n    M109 S220 H300\n{else}\n    M109 S{flush_temperatures[initial_no_support_extruder]} H300\n{endif}\nG92 E0\nG1 E50 F200 ; lower extrusion speed to avoid clog\nM400\nM106 P1 S178\nG92 E0\nG1 E5 F200\nM104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]}\nG92 E0\nG1 E-0.5 F300\n\nG1 X-28.5 F30000\nG1 X-48.2 F3000\nG1 X-28.5 F30000 ;wipe and shake\nG1 X-48.2 F3000\nG1 X-28.5 F30000 ;wipe and shake\nG1 X-48.2 F3000\n\n;G392 S0\n\nM400\nM106 P1 S0\n;===== prepare print temperature and material end =====\n\n;M400\n;M73 P1.717\n\n;===== auto extrude cali start =========================\nM975 S1\n;G392 S1\n\nG90\nM83\nT1000\nG1 X-48.2 Y0 Z10 F10000\nM400\nM1002 set_filament_type:UNKNOWN\n\nM412 S1 ;  ===turn on  filament runout detection===\nM400 P10\nM620.3 W1; === turn on filament tangle detection===\nM400 S2\n\nM1002 set_filament_type:{filament_type[initial_no_support_extruder]}\n\n;M1002 set_flag extrude_cali_flag=1\nM1002 judge_flag extrude_cali_flag\n\nM622 J1\n    M1002 gcode_claim_action : 8\n\n    M109 S{nozzle_temperature[initial_extruder]}\n    G1 E10 F{outer_wall_volumetric_speed/2.4*60}\n    M983 F{outer_wall_volumetric_speed/2.4} A0.3 H[nozzle_diameter]; cali dynamic extrusion compensation\n\n    M106 P1 S255\n    M400 S5\n    G1 X-28.5 F18000\n    G1 X-48.2 F3000\n    G1 X-28.5 F18000 ;wipe and shake\n    G1 X-48.2 F3000\n    G1 X-28.5 F12000 ;wipe and shake\n    G1 X-48.2 F3000\n    M400\n    M106 P1 S0\n\n    M1002 judge_last_extrude_cali_success\n    M622 J0\n        M983 F{outer_wall_volumetric_speed/2.4} A0.3 H[nozzle_diameter]; cali dynamic extrusion compensation\n        M106 P1 S255\n        M400 S5\n        G1 X-28.5 F18000\n        G1 X-48.2 F3000\n        G1 X-28.5 F18000 ;wipe and shake\n        G1 X-48.2 F3000\n        G1 X-28.5 F12000 ;wipe and shake\n        M400\n        M106 P1 S0\n    M623\n    \n    G1 X-48.2 F3000\n    M400\n    M984 A0.1 E1 S1 F{outer_wall_volumetric_speed/2.4} H[nozzle_diameter]\n    M106 P1 S178\n    M400 S7\n    G1 X-28.5 F18000\n    G1 X-48.2 F3000\n    G1 X-28.5 F18000 ;wipe and shake\n    G1 X-48.2 F3000\n    G1 X-28.5 F12000 ;wipe and shake\n    G1 X-48.2 F3000\n    M400\n    M106 P1 S0\nM623 ; end of \"draw extrinsic para cali paint\"\n\n;G392 S0\n;===== auto extrude cali end ========================\n\n;M400\n;M73 P1.717\n\nM104 S170 ; prepare to wipe nozzle\nM106 S255 ; turn on fan\n\n;===== mech mode fast check start =====================\nM1002 gcode_claim_action : 3\n\nG1 X128 Y128 F20000\nG1 Z5 F1200\nM400 P200\nM970.3 Q1 A5 K0 O3\nM974 Q1 S2 P0\n\nM970.2 Q1 K1 W58 Z0.1\nM974 S2\n\nG1 X128 Y128 F20000\nG1 Z5 F1200\nM400 P200\nM970.3 Q0 A10 K0 O1\nM974 Q0 S2 P0\n\nM970.2 Q0 K1 W78 Z0.1\nM974 S2\n\nM975 S1\nG1 F30000\nG1 X0 Y5\nG28 X ; re-home XY\n\nG1 Z4 F1200\n\n;===== mech mode fast check end =======================\n\n;M400\n;M73 P1.717\n\n;===== wipe nozzle ===============================\nM1002 gcode_claim_action : 14\n\nM975 S1\nM106 S255 ; turn on fan (G28 has turn off fan)\nM211 S; push soft endstop status\nM211 X0 Y0 Z0 ;turn off Z axis endstop\n\n;===== remove waste by touching start =====\n\nM104 S170 ; set temp down to heatbed acceptable\n\nM83\nG1 E-1 F500\nG90\nM83\n\nM109 S170\nG0 X108 Y-0.5 F30000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X110 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X112 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X114 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X116 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X118 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X120 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X122 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X124 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X126 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X128 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X130 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X132 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X134 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X136 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X138 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X140 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X142 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X144 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X146 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X148 F10000\nG380 S3 Z-5 F1200\n\nG1 Z5 F30000\n;===== remove waste by touching end =====\n\nG1 Z10 F1200\nG0 X118 Y261 F30000\nG1 Z5 F1200\nM109 S{nozzle_temperature_initial_layer[initial_extruder]-50}\n\nG28 Z P0 T300; home z with low precision,permit 300deg temperature\nG29.2 S0 ; turn off ABL\nM104 S140 ; prepare to abl\nG0 Z5 F20000\n\nG0 X128 Y261 F20000  ; move to exposed steel surface\nG0 Z-1.01 F1200      ; stop the nozzle\n\nG91\nG2 I1 J0 X2 Y0 F2000.1\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\n\nG90\nG1 Z10 F1200\n\n;===== brush material wipe nozzle =====\n\nG90\nG1 Y250 F30000\nG1 X55\nG1 Z1.300 F1200\nG1 Y262.5 F6000\nG91\nG1 X-35 F30000\nG1 Y-0.5\nG1 X45\nG1 Y-0.5\nG1 X-45\nG1 Y-0.5\nG1 X45\nG1 Y-0.5\nG1 X-45\nG1 Y-0.5\nG1 X45\nG1 Z5.000 F1200\n\nG90\nG1 X30 Y250.000 F30000\nG1 Z1.300 F1200\nG1 Y262.5 F6000\nG91\nG1 X35 F30000\nG1 Y-0.5\nG1 X-45\nG1 Y-0.5\nG1 X45\nG1 Y-0.5\nG1 X-45\nG1 Y-0.5\nG1 X45\nG1 Y-0.5\nG1 X-45\nG1 Z10.000 F1200\n\n;===== brush material wipe nozzle end =====\n\nG90\n;G0 X128 Y261 F20000  ; move to exposed steel surface\nG1 Y250 F30000\nG1 X138\nG1 Y261\nG0 Z-1.01 F1200      ; stop the nozzle\n\nG91\nG2 I1 J0 X2 Y0 F2000.1\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\n\nM109 S140\nM106 S255 ; turn on fan (G28 has turn off fan)\n\nM211 R; pop softend status\n\n;===== wipe nozzle end ================================\n\n;M400\n;M73 P1.717\n\n;===== bed leveling ==================================\nM1002 judge_flag g29_before_print_flag\n\nG90\nG1 Z5 F1200\nG1 X0 Y0 F30000\nG29.2 S1 ; turn on ABL\n\nM190 S[bed_temperature_initial_layer_single]; ensure bed temp\nM109 S140\nM106 S0 ; turn off fan , too noisy\n\nM622 J1\n    M1002 gcode_claim_action : 1\n    G29 A1 X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    M400\n    M500 ; save cali data\nM623\n;===== bed leveling end ================================\n\n;===== home after wipe mouth============================\nM1002 judge_flag g29_before_print_flag\nM622 J0\n\n    M1002 gcode_claim_action : 13\n    G28\n\nM623\n\n;===== home after wipe mouth end =======================\n\n;M400\n;M73 P1.717\n\nG1 X108.000 Y-0.500 F30000\nG1 Z0.300 F1200\nM400\nG2814 Z0.32\n\nM104 S{nozzle_temperature_initial_layer[initial_extruder]} ; prepare to print\n\n;===== nozzle load line ===============================\n;G90\n;M83\n;G1 Z5 F1200\n;G1 X88 Y-0.5 F20000\n;G1 Z0.3 F1200\n\n;M109 S{nozzle_temperature_initial_layer[initial_extruder]}\n\n;G1 E2 F300\n;G1 X168 E4.989 F6000\n;G1 Z1 F1200\n;===== nozzle load line end ===========================\n\n;===== extrude cali test ===============================\n\nM400\n    M900 S\n    M900 C\n    G90\n    M83\n\n    M109 S{nozzle_temperature_initial_layer[initial_extruder]}\n    G0 X128 E8  F{outer_wall_volumetric_speed/(24/20)    * 60}\n    G0 X133 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 X138 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X143 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 X148 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X153 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G91\n    G1 X1 Z-0.300\n    G1 X4\n    G1 Z1 F1200\n    G90\n    M400\n\nM900 R\n\nM1002 judge_flag extrude_cali_flag\nM622 J1\n    G90\n    G1 X108.000 Y1.000 F30000\n    G91\n    G1 Z-0.700 F1200\n    G90\n    M83\n    G0 X128 E10  F{outer_wall_volumetric_speed/(24/20)    * 60}\n    G0 X133 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 X138 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X143 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 X148 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X153 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G91\n    G1 X1 Z-0.300\n    G1 X4\n    G1 Z1 F1200\n    G90\n    M400\nM623\n\nG1 Z0.2\n\n;M400\n;M73 P1.717\n\n;========turn off light and wait extrude temperature =============\nM1002 gcode_claim_action : 0\nM400\n\n;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==\n;curr_bed_type={curr_bed_type}\n{if curr_bed_type==\"Textured PEI Plate\"}\nG29.1 Z{-0.02} ; for Textured PEI Plate\n{endif}\n\nM960 S1 P0 ; turn off laser\nM960 S2 P0 ; turn off laser\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off big fan\nM106 P3 S0 ; turn off chamber fan\n\nM975 S1 ; turn on mech mode supression\nG90\nM83\nT1000\n\nM211 X0 Y0 Z0 ;turn off soft endstop\n;G392 S1 ; turn on clog detection\nM1007 S1 ; turn on mass estimation\nG29.4\n
; machine_switch_extruder_time = 0
; machine_unload_filament_time = 29
; master_extruder_id = 1
; max_bridge_length = 0
; max_layer_height = 0.28
; max_travel_detour_distance = 0
; min_bead_width = 85%
; min_feature_size = 25%
; min_layer_height = 0.08
; minimum_sparse_infill_area = 15
; mmu_segmented_region_interlocking_depth = 0
; mmu_segmented_region_max_width = 0
; monotonic_travel_into_wall = 0%
; no_slow_down_for_cooling_on_outwalls = 0
; nozzle_diameter = 0.4
; nozzle_flush_dataset = 0
; nozzle_height = 4.76
; nozzle_temperature = 220
; nozzle_temperature_initial_layer = 220
; nozzle_temperature_range_high = 240
; nozzle_temperature_range_low = 190
; nozzle_type = stainless_steel
; nozzle_volume = 92
; nozzle_volume_type = Standard
; only_one_wall_first_layer = 0
; ooze_prevention = 0
; other_layers_print_sequence = 0
; other_layers_print_sequence_nums = 0
; outer_wall_acceleration = 5000
; outer_wall_jerk = 9
; outer_wall_line_width = 0.42
; outer_wall_speed = 200
; overhang_1_4_speed = 0
; overhang_2_4_speed = 50
; overhang_3_4_speed = 30
; overhang_4_4_speed = 10
; overhang_fan_speed = 100
; overhang_fan_threshold = 50%
; overhang_threshold_participating_cooling = 95%
; overhang_totally_speed = 10
; override_filament_scarf_seam_setting = 0
; override_process_overhang_speed = 0
; physical_extruder_map = 0
; post_process = 
; pre_start_fan_time = 0
; precise_outer_wall = 0
; precise_z_height = 0
; pressure_advance = 0.02
; prime_tower_brim_width = 3
; prime_tower_enable_framework = 0
; prime_tower_extra_rib_length = 0
; prime_tower_fillet_wall = 1
; prime_tower_flat_ironing = 0
; prime_tower_infill_gap = 150%
; prime_tower_lift_height = -1
; prime_tower_lift_speed = 90
; prime_tower_max_speed = 90
; prime_tower_rib_wall = 1
; prime_tower_rib_width = 8
; prime_tower_skip_points = 1
; prime_tower_width = 35
; prime_volume_mode = Default
; print_compatible_printers = 
; print_extruder_id = 1
; print_extruder_variant = "Direct Drive Standard"
; print_flow_ratio = 1
; print_in_clockwise = 0
; print_sequence = by layer
; print_settings_id = 0.20mm Standard @BBL A1
; printable_area = 0x0,256x0,256x256,0x256
; printable_height = 256
; printer_extruder_id = 1
; printer_extruder_variant = "Direct Drive Standard"
; printer_model = Bambu Lab A1
; printer_notes = 
; printer_settings_id = Bambu Lab A1 0.4 nozzle
; printer_structure = i3
; printer_technology = FFF
; printer_variant = 0.4
; printhost_authorization_type = key
; printhost_ssl_ignore_revoke = 0
; printing_by_object_gcode = 
; process_notes = 
; raft_contact_distance = 0.1
; raft_expansion = 1.5
; raft_first_layer_density = 90%
; raft_first_layer_expansion = -1
; raft_layers = 0
; reduce_crossing_wall = 0
; reduce_fan_stop_start_freq = 1
; reduce_infill_retraction_mode = Auto
; required_nozzle_HRC = 3
; resolution = 0.012
; retract_before_wipe = 0%
; retract_length_toolchange = 2
; retract_lift_above = 0
; retract_lift_below = 255
; retract_restart_extra = 0
; retract_restart_extra_toolchange = 0
; retract_when_changing_layer = 1
; retraction_distances_when_cut = 18
; retraction_distances_when_ec = 0
; retraction_length = 0.8
; retraction_minimum_travel = 1
; retraction_speed = 30
; role_base_wipe_speed = 1
; scan_first_layer = 0
; scarf_angle_threshold = 155
; seam_gap = 15%
; seam_placement_away_from_overhangs = 0
; seam_position = aligned
; seam_slope_conditional = 1
; seam_slope_entire_loop = 0
; seam_slope_gap = 0
; seam_slope_inner_walls = 1
; seam_slope_min_length = 10
; seam_slope_start_height = 10%
; seam_slope_steps = 10
; seam_slope_type = none
; silent_mode = 0
; single_extruder_multi_material = 1
; skeleton_infill_density = 20%
; skeleton_infill_line_width = 0.45
; skin_infill_density = 20%
; skin_infill_depth = 2
; skin_infill_line_width = 0.45
; skirt_distance = 2
; skirt_height = 1
; skirt_loops = 0
; skirt_per_object = 1
; slice_closing_radius = 0.049
; slicing_mode = regular
; slow_down_for_layer_cooling = 1
; slow_down_layer_time = 8
; slow_down_min_speed = 20
; slowdown_end_acc = 100000
; slowdown_end_height = 400
; slowdown_end_speed = 1000
; slowdown_start_acc = 100000
; slowdown_start_height = 0
; slowdown_start_speed = 1000
; small_perimeter_speed = 50%
; small_perimeter_threshold = 0
; smooth_coefficient = 80
; smooth_speed_discontinuity_area = 1
; solid_infill_filament = 0
; sparse_infill_acceleration = 100%
; sparse_infill_anchor = 400%
; sparse_infill_anchor_max = 20
; sparse_infill_density = 20%
; sparse_infill_filament = 0
; sparse_infill_lattice_angle_1 = -45
; sparse_infill_lattice_angle_2 = 45
; sparse_infill_line_width = 0.45
; sparse_infill_pattern = gyroid
; sparse_infill_speed = 270
; spiral_mode = 0
; spiral_mode_max_xy_smoothing = 200%
; spiral_mode_smooth = 0
; standby_temperature_delta = -5
; start_end_points = 30x-3,54x245
; supertack_plate_temp = 45
; supertack_plate_temp_initial_layer = 45
; support_air_filtration = 0
; support_angle = 0
; support_base_pattern = default
; support_base_pattern_spacing = 2.5
; support_bottom_interface_spacing = 0.5
; support_bottom_z_distance = 0.2
; support_chamber_temp_control = 0
; support_cooling_filter = 0
; support_critical_regions_only = 0
; support_expansion = 0
; support_fast_purge_mode = 0
; support_filament = 0
; support_interface_bottom_layers = 2
; support_interface_filament = 0
; support_interface_loop_pattern = 0
; support_interface_not_for_body = 1
; support_interface_pattern = auto
; support_interface_spacing = 0.5
; support_interface_speed = 80
; support_interface_top_layers = 2
; support_ironing_direction = 0
; support_ironing_flow = 10%
; support_ironing_inset = 0
; support_ironing_pattern = zig-zag
; support_ironing_spacing = 0.15
; support_ironing_speed = 30
; support_line_width = 0.42
; support_object_first_layer_gap = 0.2
; support_object_skip_flush = 0
; support_object_xy_distance = 0.35
; support_on_build_plate_only = 0
; support_remove_small_overhang = 1
; support_speed = 150
; support_style = default
; support_threshold_angle = 30
; support_top_z_distance = 0.2
; support_type = tree(auto)
; symmetric_infill_y_axis = 0
; temperature_vitrification = 45
; template_custom_gcode = 
; textured_plate_temp = 65
; textured_plate_temp_initial_layer = 65
; thick_bridges = 0
; thumbnail_size = 50x50
; time_lapse_gcode = ;===================== date: 20250206 =====================\n{if !spiral_mode && print_sequence != \"by object\"}\n; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer\n; SKIPPABLE_START\n; SKIPTYPE: timelapse\nM622.1 S1 ; for prev firmware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\nG92 E0\nG1 Z{max_layer_z + 0.4}\nG1 X0 Y{first_layer_center_no_wipe_tower[1]} F18000 ; move to safe pos\nG1 X-48.2 F3000 ; move to safe pos\nM400\nM1004 S5 P1  ; external shutter\nM400 P300\nM971 S11 C11 O0\nG92 E0\nG1 X0 F18000\nM623\n\n; SKIPTYPE: head_wrap_detect\nM622.1 S1\nM1002 judge_flag g39_3rd_layer_detect_flag\nM622 J1\n    ; enable nozzle clog detect at 3rd layer\n    {if layer_num == 2}\n      M400\n      G90\n      M83\n      M204 S5000\n      G0 Z2 F4000\n      G0 X261 Y250 F20000\n      M400 P200\n      G39 S1\n      G0 Z2 F4000\n    {endif}\n\n\n    M622.1 S1\n    M1002 judge_flag g39_detection_flag\n    M622 J1\n      {if !in_head_wrap_detect_zone}\n        M622.1 S0\n        M1002 judge_flag g39_mass_exceed_flag\n        M622 J1\n        {if layer_num > 2}\n            G392 S0\n            M400\n            G90\n            M83\n            M204 S5000\n            G0 Z{max_layer_z + 0.4} F4000\n            G39.3 S1\n            G0 Z{max_layer_z + 0.4} F4000\n            G392 S0\n          {endif}\n        M623\n    {endif}\n    M623\nM623\n; SKIPPABLE_END\n{endif}\n
; timelapse_type = 0
; top_area_threshold = 200%
; top_color_penetration_layers = 5
; top_one_wall_type = all top
; top_shell_layers = 5
; top_shell_thickness = 1
; top_solid_infill_flow_ratio = 1
; top_surface_acceleration = 2000
; top_surface_density = 100%
; top_surface_jerk = 9
; top_surface_line_width = 0.42
; top_surface_pattern = monotonicline
; top_surface_speed = 200
; top_z_overrides_xy_distance = 0
; travel_acceleration = 10000
; travel_jerk = 9
; travel_short_distance_acceleration = 250
; travel_speed = 700
; travel_speed_z = 0
; tree_support_branch_angle = 45
; tree_support_branch_diameter = 2
; tree_support_branch_diameter_angle = 5
; tree_support_branch_distance = 5
; tree_support_wall_count = -1
; upward_compatible_machine = "Bambu Lab H2D 0.4 nozzle";"Bambu Lab H2D Pro 0.4 nozzle";"Bambu Lab H2S 0.4 nozzle";"Bambu Lab P2S 0.4 nozzle";"Bambu Lab H2C 0.4 nozzle";"Bambu Lab X2D 0.4 nozzle";"Bambu Lab A2L 0.4 nozzle"
; use_firmware_retraction = 0
; use_relative_e_distances = 1
; vertical_shell_speed = 80%
; volumetric_speed_coefficients = "0 0 0 0 0 0"
; wall_distribution_count = 1
; wall_filament = 0
; wall_generator = classic
; wall_loops = 3
; wall_sequence = inner wall/outer wall
; wall_transition_angle = 10
; wall_transition_filter_deviation = 25%
; wall_transition_length = 100%
; wipe = 1
; wipe_distance = 2
; wipe_speed = 80%
; wipe_tower_no_sparse_layers = 0
; wipe_tower_rotation_angle = 0
; wipe_tower_x = 15
; wipe_tower_y = 216.972
; wrapping_detection_gcode = 
; wrapping_detection_layers = 20
; wrapping_exclude_area = 
; xy_contour_compensation = 0
; xy_hole_compensation = 0
; z_direction_outwall_speed_continuous = 0
; z_hop = 0.4
; z_hop_types = Auto Lift
; CONFIG_BLOCK_END

; EXECUTABLE_BLOCK_START
M73 P0 R19
M201 X12000 Y12000 Z1500 E5000
M203 X500 Y500 Z30 E30
M204 P12000 R5000 T12000
M205 X9.00 Y9.00 Z3.00 E3.00
M106 S0
; FEATURE: Custom
;===== machine: A1 =========================
;===== date: 20260513 ==================
G392 S0
M9833.2
;M400
;M73 P1.717

;===== start to heat heatbead&hotend==========
M1002 gcode_claim_action : 2
M1002 set_filament_type:PLA
M104 S140
M140 S65

;=====start printer sound ===================
M17
M400 S1
M1006 S1
M1006 A0 B10 L100 C37 D10 M60 E37 F10 N60
M1006 A0 B10 L100 C41 D10 M60 E41 F10 N60
M1006 A0 B10 L100 C44 D10 M60 E44 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A43 B10 L100 C46 D10 M70 E39 F10 N80
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N80
M1006 A0 B10 L100 C43 D10 M60 E39 F10 N80
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N80
M1006 A0 B10 L100 C41 D10 M80 E41 F10 N80
M1006 A0 B10 L100 C44 D10 M80 E44 F10 N80
M1006 A0 B10 L100 C49 D10 M80 E49 F10 N80
M1006 A0 B10 L100 C0 D10 M80 E0 F10 N80
M1006 A44 B10 L100 C48 D10 M60 E39 F10 N80
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N80
M1006 A0 B10 L100 C44 D10 M80 E39 F10 N80
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N80
M1006 A43 B10 L100 C46 D10 M60 E39 F10 N80
M1006 W
M18 
;=====start printer sound ===================

;=====avoid end stop =================
G91
G380 S2 Z40 F1200
G380 S3 Z-15 F1200
G90

;===== reset machine status =================
;M290 X39 Y39 Z8
M204 S6000

M630 S0 P0
G91
M17 Z0.3 ; lower the z-motor current

G90
M17 X0.65 Y1.2 Z0.6 ; reset motor current to default
M960 S5 P1 ; turn on logo lamp
G90
M220 S100 ;Reset Feedrate
M221 S100 ;Reset Flowrate
M73.2   R1.0 ;Reset left time magnitude
;M211 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem

;====== cog noise reduction=================
M982.2 S1 ; turn on cog noise reduction

M1002 gcode_claim_action : 13

G28 X
G91
G1 Z5 F1200
G90
G0 X128 F30000
G0 Y254 F3000
G91
G1 Z-5 F1200

M109 S25 H140

M17 E0.3
M83
G1 E10 F1200
G1 E-0.5 F30
M17 D

G28 Z P0 T140; home z with low precision,permit 300deg temperature
M104 S220

M1002 judge_flag build_plate_detect_flag
M622 S1
  G39.4
  G90
  G1 Z5 F1200
M623

;M400
;M73 P1.717

;===== prepare print temperature and material ==========
M1002 gcode_claim_action : 24

M400
;G392 S1
M211 X0 Y0 Z0 ;turn off soft endstop
M975 S1 ; turn on

G90
G1 X-28.5 F30000
G1 X-48.2 F3000

M620 M ;enable remap
M620 S0A   ; switch material if AMS exist
    M1002 gcode_claim_action : 4
    M400
    M1002 set_filament_type:UNKNOWN
    M109 S220

    M104 S220

    M400
    T0
    G1 X-48.2 F3000
    M400


    M620.1 E F299.339 T220
    M109 S220 ;set nozzle to common flush temp

    M106 P1 S0
    G92 E0
    G1 E50 F200
    M400
    M1002 set_filament_type:PLA
M621 S0A


    M109 S220 H300

G92 E0
G1 E50 F200 ; lower extrusion speed to avoid clog
M400
M106 P1 S178
G92 E0
G1 E5 F200
M104 S220
G92 E0
M73 P2 R18
G1 E-0.5 F300

G1 X-28.5 F30000
M73 P4 R18
G1 X-48.2 F3000
M73 P5 R18
G1 X-28.5 F30000 ;wipe and shake
G1 X-48.2 F3000
G1 X-28.5 F30000 ;wipe and shake
G1 X-48.2 F3000

;G392 S0

M400
M106 P1 S0
;===== prepare print temperature and material end =====

;M400
;M73 P1.717

;===== auto extrude cali start =========================
M975 S1
;G392 S1

G90
M83
T1000
G1 X-48.2 Y0 Z10 F10000
M400
M1002 set_filament_type:UNKNOWN

M412 S1 ;  ===turn on  filament runout detection===
M400 P10
M620.3 W1; === turn on filament tangle detection===
M400 S2

M1002 set_filament_type:PLA

;M1002 set_flag extrude_cali_flag=1
M1002 judge_flag extrude_cali_flag

M622 J1
    M1002 gcode_claim_action : 8

    M109 S220
    G1 E10 F300
    M983 F5 A0.3 H0.4; cali dynamic extrusion compensation

    M106 P1 S255
    M400 S5
    G1 X-28.5 F18000
    G1 X-48.2 F3000
    G1 X-28.5 F18000 ;wipe and shake
    G1 X-48.2 F3000
M73 P7 R17
    G1 X-28.5 F12000 ;wipe and shake
    G1 X-48.2 F3000
    M400
    M106 P1 S0

    M1002 judge_last_extrude_cali_success
    M622 J0
        M983 F5 A0.3 H0.4; cali dynamic extrusion compensation
        M106 P1 S255
        M400 S5
        G1 X-28.5 F18000
        G1 X-48.2 F3000
        G1 X-28.5 F18000 ;wipe and shake
        G1 X-48.2 F3000
        G1 X-28.5 F12000 ;wipe and shake
        M400
        M106 P1 S0
    M623
    
    G1 X-48.2 F3000
    M400
    M984 A0.1 E1 S1 F5 H0.4
    M106 P1 S178
    M400 S7
    G1 X-28.5 F18000
    G1 X-48.2 F3000
M73 P8 R17
    G1 X-28.5 F18000 ;wipe and shake
    G1 X-48.2 F3000
    G1 X-28.5 F12000 ;wipe and shake
    G1 X-48.2 F3000
    M400
    M106 P1 S0
M623 ; end of "draw extrinsic para cali paint"

;G392 S0
;===== auto extrude cali end ========================

;M400
;M73 P1.717

M104 S170 ; prepare to wipe nozzle
M106 S255 ; turn on fan

;===== mech mode fast check start =====================
M1002 gcode_claim_action : 3

G1 X128 Y128 F20000
G1 Z5 F1200
M400 P200
M970.3 Q1 A5 K0 O3
M974 Q1 S2 P0

M970.2 Q1 K1 W58 Z0.1
M974 S2

G1 X128 Y128 F20000
G1 Z5 F1200
M400 P200
M970.3 Q0 A10 K0 O1
M974 Q0 S2 P0

M970.2 Q0 K1 W78 Z0.1
M974 S2

M975 S1
G1 F30000
G1 X0 Y5
G28 X ; re-home XY

G1 Z4 F1200

;===== mech mode fast check end =======================

;M400
;M73 P1.717

;===== wipe nozzle ===============================
M1002 gcode_claim_action : 14

M975 S1
M106 S255 ; turn on fan (G28 has turn off fan)
M211 S; push soft endstop status
M211 X0 Y0 Z0 ;turn off Z axis endstop

;===== remove waste by touching start =====

M104 S170 ; set temp down to heatbed acceptable

M83
G1 E-1 F500
G90
M83

M109 S170
G0 X108 Y-0.5 F30000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X110 F10000
G380 S3 Z-5 F1200
M73 P30 R13
G1 Z2 F1200
G1 X112 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X114 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X116 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X118 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X120 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X122 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X124 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X126 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X128 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X130 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X132 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X134 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X136 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X138 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X140 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X142 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X144 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X146 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X148 F10000
G380 S3 Z-5 F1200

G1 Z5 F30000
;===== remove waste by touching end =====

G1 Z10 F1200
G0 X118 Y261 F30000
G1 Z5 F1200
M109 S170

G28 Z P0 T300; home z with low precision,permit 300deg temperature
G29.2 S0 ; turn off ABL
M104 S140 ; prepare to abl
G0 Z5 F20000

G0 X128 Y261 F20000  ; move to exposed steel surface
G0 Z-1.01 F1200      ; stop the nozzle

G91
G2 I1 J0 X2 Y0 F2000.1
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
M73 P31 R13
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5

G90
G1 Z10 F1200

;===== brush material wipe nozzle =====

G90
G1 Y250 F30000
G1 X55
G1 Z1.300 F1200
G1 Y262.5 F6000
G91
G1 X-35 F30000
G1 Y-0.5
G1 X45
G1 Y-0.5
G1 X-45
G1 Y-0.5
G1 X45
G1 Y-0.5
G1 X-45
G1 Y-0.5
G1 X45
G1 Z5.000 F1200

G90
G1 X30 Y250.000 F30000
G1 Z1.300 F1200
G1 Y262.5 F6000
G91
G1 X35 F30000
G1 Y-0.5
G1 X-45
G1 Y-0.5
G1 X45
G1 Y-0.5
G1 X-45
G1 Y-0.5
G1 X45
G1 Y-0.5
G1 X-45
G1 Z10.000 F1200

;===== brush material wipe nozzle end =====

G90
;G0 X128 Y261 F20000  ; move to exposed steel surface
G1 Y250 F30000
G1 X138
G1 Y261
G0 Z-1.01 F1200      ; stop the nozzle

G91
G2 I1 J0 X2 Y0 F2000.1
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5

M109 S140
M106 S255 ; turn on fan (G28 has turn off fan)

M211 R; pop softend status

;===== wipe nozzle end ================================

;M400
;M73 P1.717

;===== bed leveling ==================================
M1002 judge_flag g29_before_print_flag

G90
G1 Z5 F1200
G1 X0 Y0 F30000
G29.2 S1 ; turn on ABL

M190 S65; ensure bed temp
M109 S140
M106 S0 ; turn off fan , too noisy

M622 J1
    M1002 gcode_claim_action : 1
    G29 A1 X123.401 Y114.4 I9.19782 J27.1999
    M400
    M500 ; save cali data
M623
;===== bed leveling end ================================

;===== home after wipe mouth============================
M1002 judge_flag g29_before_print_flag
M622 J0

    M1002 gcode_claim_action : 13
    G28

M623

;===== home after wipe mouth end =======================

;M400
;M73 P1.717

G1 X108.000 Y-0.500 F30000
G1 Z0.300 F1200
M400
G2814 Z0.32

M104 S220 ; prepare to print

;===== nozzle load line ===============================
;G90
;M83
;G1 Z5 F1200
;G1 X88 Y-0.5 F20000
;G1 Z0.3 F1200

;M109 S220

;G1 E2 F300
;G1 X168 E4.989 F6000
;G1 Z1 F1200
;===== nozzle load line end ===========================

;===== extrude cali test ===============================

M400
    M900 S
    M900 C
    G90
    M83

    M109 S220
    G0 X128 E8  F720
    G0 X133 E.3742  F1200
    G0 X138 E.3742  F4800
    G0 X143 E.3742  F1200
    G0 X148 E.3742  F4800
    G0 X153 E.3742  F1200
    G91
    G1 X1 Z-0.300
    G1 X4
    G1 Z1 F1200
    G90
    M400

M900 R

M1002 judge_flag extrude_cali_flag
M622 J1
    G90
    G1 X108.000 Y1.000 F30000
    G91
    G1 Z-0.700 F1200
    G90
    M83
    G0 X128 E10  F720
    G0 X133 E.3742  F1200
    G0 X138 E.3742  F4800
    G0 X143 E.3742  F1200
    G0 X148 E.3742  F4800
    G0 X153 E.3742  F1200
    G91
    G1 X1 Z-0.300
    G1 X4
    G1 Z1 F1200
    G90
    M400
M623

G1 Z0.2

;M400
;M73 P1.717

;========turn off light and wait extrude temperature =============
M1002 gcode_claim_action : 0
M400

;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==
;curr_bed_type=Textured PEI Plate

G29.1 Z-0.02 ; for Textured PEI Plate


M960 S1 P0 ; turn off laser
M960 S2 P0 ; turn off laser
M106 S0 ; turn off fan
M106 P2 S0 ; turn off big fan
M106 P3 S0 ; turn off chamber fan

M975 S1 ; turn on mech mode supression
G90
M83
T1000

M211 X0 Y0 Z0 ;turn off soft endstop
;G392 S1 ; turn on clog detection
M1007 S1 ; turn on mass estimation
G29.4
; MACHINE_START_GCODE_END
; filament start gcode
M106 P3 S255
;Prevent PLA from jamming


;VT0 H-1
G90
G21
M83 ; use relative distances for extrusion
M981 S1 P20000 ;open spaghetti detector
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.2
G1 E-.8 F1800
; layer num/total_layer_count: 1/73
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
; OBJECT_ID: 394
G1 X129.642 Y128.316 F42000
M204 S6000
M73 P32 R13
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X131.069 Y139.196 E.40871
G1 X126.26 Y139.83 E.18067
G1 X124.85 Y129.122 E.40226
G3 X124.783 Y127.676 I11.286 J-1.248 E.05398
G1 X129.582 Y128.308 E.1803
; WIPE_START
G1 X129.853 Y130.289 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X127.04 Y137.384 Z.6 F42000
G1 X125.866 Y140.343 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X124.396 Y129.177 E.41947
G3 X124.357 Y127.159 I9.372 J-1.193 E.07534
G1 X130.08 Y127.912 E.21501
G2 X130.109 Y128.401 I4.119 J.006 E.01825
G1 X131.582 Y139.589 E.4203
M73 P32 R12
G1 X125.926 Y140.335 E.21248
; WIPE_START
G1 X125.654 Y138.354 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X128.343 Y131.21 Z.6 F42000
G1 X129.773 Y127.411 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X124.766 Y126.752 E.18809
G1 X125.997 Y117.4 E.35133
G1 X126.104 Y116.589 E.03044
G1 X131.111 Y117.248 E.18809
G1 X129.781 Y127.351 E.37954
; WIPE_START
G1 X127.795 Y127.114 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X128.435 Y119.508 Z.6 F42000
G1 X128.69 Y116.469 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X125.809 Y116.089 E.10822
G1 X125.867 Y115.656 E.01628
G1 X131.582 Y116.408 E.21471
G1 X131.525 Y116.842 E.01629
G1 X128.75 Y116.477 E.10426
; WIPE_START
G1 X126.767 Y116.216 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X126.369 Y123.838 Z.6 F42000
G1 X125.48 Y140.853 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X125.464 Y140.786 I.271 J-.101 E.00257
G1 X123.943 Y129.232 E.43407
G3 X123.943 Y126.768 I10.515 J-1.232 E.09198
G1 X125.464 Y115.213 E.43407
G3 X125.481 Y115.144 I.271 J.031 E.00266
G1 X125.889 Y115.198 E.01534
G1 X132.087 Y116.014 E.23281
G3 X132.085 Y116.09 I-.243 J.033 E.00285
G1 X130.563 Y127.646 E.43415
G2 X130.563 Y128.351 I3.957 J.354 E.02627
G1 X132.086 Y139.915 E.43444
G3 X132.087 Y139.986 I-.318 J.041 E.00266
G1 X125.539 Y140.846 E.24595
; WIPE_START
G1 X125.464 Y140.786 E-.0365
G1 X125.215 Y138.899 E-.7235
; WIPE_END
G1 E-.04 F1800
M204 S6000
G17
G3 Z.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.6
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X128.403 Y128.337 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50234
G1 F5175
M204 S500
G1 X129.381 Y129.315 E.05176
G1 X129.479 Y130.062 E.02823
M73 P33 R12
G1 X127.894 Y128.477 E.08392
G1 X127.146 Y128.379 E.02825
G1 X129.577 Y130.81 E.12873
G1 X129.675 Y131.558 E.02823
G1 X126.398 Y128.28 E.17353
G1 X125.649 Y128.182 E.02825
G1 X129.773 Y132.306 E.21834
G1 X129.871 Y133.053 E.02823
G1 X125.173 Y128.355 E.24877
G1 X125.235 Y129.067 E.02677
G1 X129.97 Y133.801 E.25064
G1 X130.068 Y134.549 E.02823
G1 X125.333 Y129.815 E.25066
G1 X125.432 Y130.563 E.02825
G1 X130.166 Y135.297 E.25063
G1 X130.264 Y136.045 E.02823
G1 X125.53 Y131.311 E.25061
G1 X125.629 Y132.059 E.02825
G1 X130.362 Y136.792 E.25059
G1 X130.46 Y137.54 E.02823
G1 X125.727 Y132.808 E.25056
G1 X125.826 Y133.556 E.02825
G1 X130.558 Y138.288 E.25054
G1 X130.633 Y138.861 E.02165
G1 X130.499 Y138.879 E.00506
G1 X125.924 Y134.304 E.24221
G1 X126.023 Y135.052 E.02825
G1 X129.925 Y138.955 E.20661
G1 X129.351 Y139.03 E.02167
G1 X126.121 Y135.8 E.171
G1 X126.22 Y136.549 E.02825
G1 X128.777 Y139.106 E.1354
G1 X128.203 Y139.182 E.02167
G1 X126.318 Y137.297 E.09979
G1 X126.417 Y138.045 E.02825
G1 X127.629 Y139.258 E.06419
G1 X127.055 Y139.333 E.02167
G1 X126.276 Y138.554 E.04123
; WIPE_START
G1 F6300
G1 X127.055 Y139.333 E-.41854
G1 X127.629 Y139.258 E-.22001
G1 X127.403 Y139.032 E-.12146
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X128.818 Y131.531 Z.6 F42000
G1 X131.544 Y117.075 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.40132
G1 F3000
M204 S500
G1 X130.148 Y127.69 E.3127
; WIPE_START
G1 X130.409 Y125.708 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X124.334 Y126.925 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.399105
G1 F3000
M204 S500
G1 X125.73 Y116.31 E.31076
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
G1 X125.469 Y118.293 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/73
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S201.45
; open powerlost recovery
M1003 S1
; OBJECT_ID: 394
M204 S10000
G17
G3 Z.6 I-1.217 J.028 P1  F42000
G1 X125.971 Y140.338 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4346
M204 S6000
G1 X124.5 Y129.166 E.37379
G3 X124.446 Y127.399 I8.998 J-1.162 E.05874
G1 X129.984 Y128.129 E.18529
G2 X130.006 Y128.419 I2.23 J-.023 E.00966
G1 X131.48 Y139.615 E.3746
G1 X126.031 Y140.331 E.18231
; WIPE_START
G1 F8843.478
G1 X125.759 Y138.349 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.356 Y131.172 Z.8 F42000
G1 X129.623 Y127.67 Z.8
G1 Z.4
G1 E.8 F1800
G1 F4346
M204 S6000
G1 X124.455 Y126.99 E.17289
G1 X125.209 Y121.268 E.19144
G1 X125.866 Y116.278 E.16695
G1 X131.422 Y117.01 E.1859
G1 X130.012 Y127.722 E.35839
G1 X129.682 Y127.678 E.01102
M204 S250
G1 X129.674 Y127.282 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4346
M204 S5000
G1 X124.895 Y126.653 E.1481
G1 X125.597 Y121.319 E.16529
G1 X126.203 Y116.718 E.1426
G1 X130.982 Y117.347 E.14811
G1 X129.682 Y127.222 E.30604
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.696 Y126.986 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.562 Y134.534 Z.8 F42000
G1 X125.621 Y140.795 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4346
M204 S6000
G1 X124.096 Y129.215 E.38744
G3 X124.096 Y126.785 I10.347 J-1.215 E.08081
G1 X125.621 Y115.205 E.38745
G1 X131.937 Y116.035 E.21131
G1 X130.41 Y127.63 E.38794
G2 X130.41 Y128.37 I5.01 J.37 E.02459
G1 X131.937 Y139.965 E.38794
G1 X125.68 Y140.787 E.20932
M204 S250
G1 X125.277 Y141.044 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2880
M204 S5000
G1 X125.252 Y140.955 E.00283
G1 F4346
G1 X125.197 Y140.559 E.01229
G1 X125.154 Y140.251 E.00957
G1 X123.785 Y129.857 E.32212
G3 X123.785 Y126.143 I11.271 J-1.857 E.11464
G1 X125.154 Y115.744 E.32228
G1 X125.197 Y115.441 E.00941
G1 X125.252 Y115.045 E.01229
G1 F2880
G1 X125.277 Y114.957 E.00282
G1 F2640
G1 X125.308 Y114.888 E.00232
G1 F2280
G1 X125.334 Y114.849 E.00143
G1 F2160
G1 X125.361 Y114.82 E.00123
G1 F1920
M73 P34 R12
G1 X125.385 Y114.803 E.0009
M106 S255
G1 F1800
G1 X125.426 Y114.787 E.00134
M106 S201.45
M106 S255
G1 F1680
G1 X132.204 Y115.674 E.21005
M106 S201.45
M106 S255
G1 X132.235 Y115.685 E.00101
M106 S201.45
M106 S255
G1 F1800
G1 X132.268 Y115.709 E.00125
M106 S201.45
G1 F1920
G1 X132.29 Y115.737 E.00109
G1 F2040
G1 X132.3 Y115.755 E.00063
G1 F2160
G1 X132.311 Y115.78 E.00086
G1 F2400
G1 X132.321 Y115.811 E.00097
G1 F2520
G1 X132.33 Y115.859 E.00152
G1 F2880
G1 X132.335 Y115.933 E.00226
G1 F3000
G1 X132.333 Y115.997 E.00198
G1 F4346
G1 X132.283 Y116.394 E.01229
G1 X132.244 Y116.705 E.00964
G1 X130.878 Y127.081 E.32157
G2 X130.788 Y128.216 I4.916 J.962 E.03504
G1 X130.799 Y128.324 E.00335
G1 X132.244 Y139.295 E.34002
G1 X132.281 Y139.583 E.00892
G1 X132.331 Y139.979 E.01229
G1 F3466.014
G1 X132.335 Y140.055 E.00231
G1 F2880
G1 X132.332 Y140.12 E.00201
G1 F2640
G1 X132.321 Y140.188 E.00212
G1 F2400
G1 X132.305 Y140.233 E.00147
G1 F2160
G1 X132.289 Y140.263 E.00105
G1 F1920
G1 X132.269 Y140.289 E.001
M106 S255
G1 F1800
G1 X132.234 Y140.315 E.00134
M106 S201.45
M106 S255
G1 F1680
G1 X125.426 Y141.213 E.21101
M106 S201.45
M106 S255
G1 F1800
G1 X125.385 Y141.197 E.00135
M106 S201.45
G1 F1920
G1 X125.361 Y141.18 E.00091
G1 F2160
G1 X125.334 Y141.151 E.00122
G1 F2400
G1 X125.308 Y141.112 E.00144
G1 F2640
G1 X125.302 Y141.099 E.00045
; WIPE_START
M204 S6000
G1 X125.252 Y140.955 E-.0576
G1 X125.197 Y140.559 E-.152
G1 X125.154 Y140.251 E-.11837
G1 X125.005 Y139.124 E-.43203
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.8
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X127.63 Y130.463 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.35504
G1 F4346
M204 S6000
G1 X127.31 Y130.421 E.00822
G1 X128.228 Y137.397 E.17896
G1 X128.538 Y137.357 E.00794
G1 X127.638 Y130.523 E.17531
M204 S10000
G1 X127.938 Y130.156 F42000
; LINE_WIDTH: 0.41999
G1 F4346
M204 S6000
G1 X126.91 Y130.021 E.03185
G1 X127.932 Y137.784 E.24059
G1 X128.925 Y137.653 E.03077
G1 X127.945 Y130.216 E.23051
M204 S10000
G1 X128.274 Y129.82 F42000
G1 F4346
M204 S6000
G1 X126.472 Y129.583 E.05584
G1 X127.607 Y138.207 E.26727
G1 X129.348 Y137.978 E.05394
G1 X128.281 Y129.88 E.25099
M204 S10000
G1 X128.61 Y129.484 F42000
G1 F4346
M204 S6000
G1 X126.034 Y129.145 E.07983
G1 X127.283 Y138.63 E.29395
G1 X129.771 Y138.303 E.07711
G1 X128.618 Y129.544 E.27147
M204 S10000
G1 X128.946 Y129.148 F42000
G1 F4346
M204 S6000
G1 X125.611 Y128.709 E.10336
G1 X125.641 Y129.047 E.01044
G1 X126.958 Y139.053 E.31009
G1 X130.194 Y138.628 E.10028
G1 X128.954 Y129.207 E.29195
M204 S10000
G1 X129.282 Y128.812 F42000
G1 F4346
M204 S6000
G1 X125.201 Y128.275 E.12646
G2 X125.267 Y129.096 I13.266 J-.641 E.02533
G1 X126.633 Y139.476 E.32167
G1 X130.617 Y138.952 E.12345
G1 X129.29 Y128.871 E.31243
M204 S10000
G1 X129.618 Y128.476 F42000
G1 F4346
M204 S6000
G1 X124.828 Y127.845 E.14846
G2 X124.89 Y129.124 I6.722 J.313 E.03939
G1 X126.309 Y139.899 E.33393
G1 X131.04 Y139.277 E.14662
G1 X129.626 Y128.535 E.3329
; WIPE_START
G1 F9547.299
G1 X129.887 Y130.518 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.85 Y122.947 Z.8 F42000
G1 X131.667 Y116.521 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.669175
G1 F4346
M204 S6000
G1 X125.755 Y115.743 E.3043
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5748.461
G1 X127.738 Y116.004 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/73
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z.8 I-1.196 J.223 P1  F42000
G1 X129.997 Y128.13 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4117
M204 S6000
G2 X130.019 Y128.417 I2.189 J-.022 E.00956
G1 X131.508 Y139.729 E.37848
G1 X125.974 Y140.456 E.18514
G1 X124.487 Y129.168 E.37768
G3 X124.433 Y127.398 I9.01 J-1.163 E.05885
G1 X129.937 Y128.122 E.18416
M204 S10000
G1 X129.623 Y127.67 F42000
G1 F4117
M204 S6000
G1 X124.455 Y126.99 E.17289
G1 X124.823 Y124.197 E.09346
G1 X125.866 Y116.278 E.26493
G1 X131.422 Y117.01 E.1859
G1 X130.012 Y127.722 E.35839
G1 X129.682 Y127.678 E.01102
M204 S250
G1 X129.674 Y127.282 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4117
M204 S5000
G1 X124.895 Y126.653 E.14811
G1 X125.212 Y124.248 E.07453
G1 X126.203 Y116.718 E.23336
G1 X130.982 Y117.347 E.14811
G1 X129.682 Y127.222 E.30604
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.696 Y126.986 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.166 Y119.764 Z1 F42000
G1 X131.257 Y116.578 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4117
M204 S6000
G1 X125.93 Y115.876 E.17823
G1 X125.974 Y115.543 E.01115
G1 X131.508 Y116.271 E.18516
G1 X131.464 Y116.605 E.01118
G1 X131.316 Y116.585 E.00494
; WIPE_START
G1 F8843.478
G1 X129.333 Y116.324 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.029 Y123.925 Z1 F42000
G1 X130.401 Y127.978 Z1
G1 Z.6
G1 E.8 F1800
G1 F4117
M204 S6000
G1 X130.405 Y128.007 E.00096
G2 X130.423 Y128.369 I3.868 J-.008 E.01204
G1 X131.965 Y140.08 E.39183
G1 X125.624 Y140.913 E.21215
G1 X124.083 Y129.217 E.39132
G3 X124.083 Y126.783 I10.362 J-1.217 E.08093
G1 X125.623 Y115.086 E.39134
G1 X131.965 Y115.92 E.21216
G1 X130.422 Y127.638 E.39204
G1 X130.404 Y127.918 E.00933
M204 S250
G1 X130.805 Y127.785 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4117
M204 S5000
G1 X130.796 Y128.002 E.00667
G2 X130.812 Y128.322 I3.341 J-.003 E.00985
G1 X132.368 Y140.15 E.36657
G1 X132.374 Y140.226 E.00233
G1 X132.37 Y140.273 E.00147
G1 X132.361 Y140.309 E.00114
G1 X132.35 Y140.338 E.00096
G1 X132.326 Y140.378 E.00142
G3 X132.278 Y140.421 I-.142 J-.112 E.00199
G3 X132.219 Y140.442 I-.085 J-.143 E.00192
G1 X125.455 Y141.33 E.20964
G3 X125.39 Y141.318 I-.003 J-.157 E.00205
G1 X125.355 Y141.299 E.00122
G1 X125.335 Y141.283 E.00077
G1 X125.309 Y141.252 E.00125
G1 X125.288 Y141.218 E.00121
G1 X125.266 Y141.162 E.00187
G1 X125.254 Y141.109 E.00166
G1 X125.251 Y141.085 E.00076
G1 X123.694 Y129.264 E.36636
G3 X123.694 Y126.736 I10.794 J-1.264 E.07786
G1 X125.25 Y114.917 E.3663
G1 X125.25 Y114.916 E.00001
G1 X125.266 Y114.839 E.00242
G1 X125.282 Y114.794 E.00148
G1 X125.298 Y114.763 E.00106
G1 X125.327 Y114.726 E.00145
G1 X125.357 Y114.7 E.00122
G1 X125.39 Y114.682 E.00114
G3 X125.46 Y114.67 I.064 J.15 E.0022
G1 X132.225 Y115.559 E.20966
G1 X132.239 Y115.562 E.00045
G3 X132.287 Y115.586 I-.047 J.16 E.00167
G3 X132.328 Y115.624 I-.105 J.15 E.00173
G1 X132.345 Y115.651 E.00097
G1 X132.355 Y115.672 E.00074
G1 X132.365 Y115.702 E.00097
G1 X132.371 Y115.736 E.00105
G1 X132.374 Y115.768 E.00099
G1 X132.369 Y115.847 E.00242
G1 X130.812 Y127.68 E.36674
G1 X130.809 Y127.726 E.0014
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.796 Y128.002 E-.10524
G1 X130.812 Y128.322 E-.12173
G1 X130.995 Y129.713 E-.53303
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    
      M400
      G90
      M83
      M204 S5000
      G0 Z2 F4000
      G0 X261 Y250 F20000
      M400 P200
      G39 S1
      G0 Z2 F4000
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z1.000
G1 X129.631 Y128.478 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F4117
M204 S6000
G1 X124.815 Y127.843 E.14926
G2 X124.877 Y129.125 I6.736 J.315 E.03949
G1 X126.312 Y140.016 E.33753
G1 X131.068 Y139.392 E.1474
G1 X129.639 Y128.537 E.3364
M204 S10000
G1 X129.295 Y128.814 F42000
G1 F4117
M204 S6000
G1 X125.189 Y128.273 E.12726
G2 X125.254 Y129.098 I13.132 J-.626 E.02544
G1 X126.636 Y139.594 E.32527
G1 X130.645 Y139.067 E.12423
G1 X129.303 Y128.873 E.31592
M204 S10000
G1 X128.959 Y129.15 F42000
G1 F4117
M204 S6000
G1 X125.598 Y128.707 E.10417
G1 X125.628 Y129.049 E.01054
G1 X126.961 Y139.171 E.31369
G1 X130.222 Y138.742 E.10106
M73 P35 R12
G1 X128.967 Y129.209 E.29544
M204 S10000
G1 X128.623 Y129.486 F42000
G1 F4117
M204 S6000
G1 X126.021 Y129.143 E.08064
G1 X127.285 Y138.748 E.29766
G1 X129.799 Y138.417 E.07789
G1 X128.631 Y129.545 E.27496
M204 S10000
G1 X128.287 Y129.822 F42000
G1 F4117
M204 S6000
G1 X126.459 Y129.581 E.05665
G1 X127.61 Y138.325 E.27098
G1 X129.376 Y138.093 E.05471
G1 X128.295 Y129.881 E.25448
M204 S10000
G1 X127.951 Y130.158 F42000
G1 F4117
M204 S6000
G1 X126.897 Y130.019 E.03266
G1 X127.935 Y137.902 E.24429
G1 X128.953 Y137.768 E.03154
G1 X127.958 Y130.217 E.234
M204 S10000
G1 X127.638 Y130.471 F42000
; LINE_WIDTH: 0.367734
G1 F4117
M204 S6000
G1 X127.304 Y130.427 E.0089
G1 X128.237 Y137.508 E.18905
G1 X128.559 Y137.466 E.0086
G1 X127.646 Y130.53 E.18516
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11083.263
G1 X127.907 Y132.513 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/73
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z1 I1.084 J.553 P1  F42000
G1 X130.014 Y128.385 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3964
M204 S6000
G1 X131.515 Y139.781 E.3813
G1 X125.981 Y140.51 E.18516
G1 X124.487 Y129.168 E.37948
G3 X124.418 Y127.648 I11.756 J-1.298 E.05052
G1 X129.955 Y128.377 E.18524
M204 S10000
G1 X130.399 Y128.025 F42000
G1 F3964
M204 S6000
G2 X130.422 Y128.362 I2.589 J-.002 E.01123
G1 X131.971 Y140.132 E.39377
G1 X125.63 Y140.967 E.21216
G1 X124.083 Y129.217 E.39313
G3 X124.039 Y127.187 I9.6 J-1.226 E.06746
G1 X130.34 Y128.017 E.21082
M204 S250
G1 X129.889 Y127.562 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3964
M204 S5000
G1 X124.615 Y126.868 E.16347
G1 X125.912 Y117.017 E.3053
G1 X125.988 Y116.438 E.01795
G1 X131.262 Y117.132 E.16347
G1 X129.897 Y127.503 E.32141
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.911 Y127.264 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.217 Y119.988 Z1.2 F42000
G1 X131.249 Y116.735 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3964
M204 S6000
G1 X125.506 Y115.979 E.19215
G1 X125.63 Y115.033 E.03164
G1 X131.971 Y115.868 E.21216
G1 X131.847 Y116.814 E.03163
G1 X131.308 Y116.743 E.01802
; WIPE_START
G1 F8843.478
G1 X129.325 Y116.482 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.314 Y124.05 Z1.2 F42000
G1 X130.804 Y127.797 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3964
M204 S5000
G1 X130.796 Y127.998 E.00617
G2 X130.812 Y128.32 I3.347 J.003 E.00991
G1 X132.385 Y140.267 E.37028
G3 X132.361 Y140.399 I-.266 J.02 E.00415
G1 X132.343 Y140.427 E.00102
G1 X132.313 Y140.456 E.00128
G3 X132.256 Y140.486 I-.115 J-.148 E.00199
G1 X126.083 Y141.303 E.19132
G3 X125.456 Y141.383 I-.852 J-4.174 E.01946
G3 X125.393 Y141.371 I.001 J-.187 E.00199
G3 X125.337 Y141.339 I.064 J-.176 E.00199
G1 X125.325 Y141.327 E.00051
G3 X125.266 Y141.204 I.187 J-.166 E.00424
G1 X123.694 Y129.264 E.37006
G3 X123.694 Y126.736 I10.794 J-1.264 E.07786
G1 X125.266 Y114.798 E.37
G3 X125.321 Y114.678 I.253 J.043 E.0041
G1 X125.337 Y114.661 E.00071
G3 X125.39 Y114.63 I.115 J.137 E.00192
G1 X125.427 Y114.62 E.00117
G3 X125.488 Y114.619 I.033 J.209 E.00188
G1 X132.229 Y115.507 E.20893
G3 X132.308 Y115.54 I-.042 J.21 E.00264
G3 X132.349 Y115.581 I-.116 J.159 E.00178
G1 X132.362 Y115.601 E.00074
G1 X132.371 Y115.619 E.00063
G3 X132.384 Y115.735 I-.237 J.086 E.00361
G1 X130.812 Y127.678 E.37014
G1 X130.808 Y127.737 E.00182
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.796 Y127.998 E-.09905
G1 X130.812 Y128.32 E-.12256
G1 X130.997 Y129.725 E-.53839
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.2
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.2 F4000
            G39.3 S1
            G0 Z1.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X129.375 Y130.624 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Top surface
G1 F3964
M204 S2000
G1 X130.002 Y129.997 E.02725
G1 X129.94 Y129.526
G1 X128.904 Y130.562 E.04503
G1 X128.433 Y130.5
G1 X129.878 Y129.055 E.06281
G1 X129.816 Y128.583
G1 X127.962 Y130.438 E.08059
G1 X127.49 Y130.376
G1 X129.345 Y128.521 E.08061
G1 X128.874 Y128.459
G1 X127.019 Y130.314 E.08061
G1 X126.548 Y130.252
G1 X128.403 Y128.397 E.08061
G1 X127.932 Y128.335
G1 X126.077 Y130.19 E.08061
G1 X125.605 Y130.128
G1 X127.461 Y128.273 E.08061
G1 X126.989 Y128.211
G1 X125.134 Y130.066 E.08061
G1 X124.803 Y129.863
G1 X126.518 Y128.149 E.07451
G1 X126.047 Y128.087
G1 X124.741 Y129.392 E.05673
G1 X124.688 Y128.912
M73 P36 R12
G1 X125.576 Y128.025 E.03856
G1 X125.104 Y127.963
G1 X124.645 Y128.422 E.01995
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.104 Y127.963 E-.24676
G1 X125.576 Y128.025 E-.18061
G1 X124.957 Y128.644 E-.33263
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.128 Y127.001 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.580845
G1 F3964
M204 S6000
G1 X125.552 Y116.183 E.47831
M204 S10000
G1 X125.77 Y115.533 F42000
; LINE_WIDTH: 0.589454
G1 F3964
M204 S6000
G1 X131.707 Y116.315 E.26671
M204 S10000
G1 X131.749 Y116.999 F42000
; LINE_WIDTH: 0.58085
G1 F3964
M204 S6000
G1 X130.325 Y127.817 E.47832
; WIPE_START
G1 F6692.327
G1 X130.586 Y125.834 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.444 Y130.838 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F3964
M204 S6000
G1 X125.027 Y130.26 E.13689
G1 X126.318 Y140.07 E.30402
G1 X131.075 Y139.444 E.14741
G1 X129.937 Y130.803 E.2678
G1 X129.504 Y130.834 E.01334
M204 S10000
G1 X129.395 Y131.212 F42000
G1 F3964
M204 S6000
G1 X125.465 Y130.698 E.12181
G1 X126.643 Y139.647 E.27735
G1 X130.652 Y139.119 E.12424
G1 X129.61 Y131.207 E.24519
G1 X129.455 Y131.211 E.00476
M204 S10000
G1 X127.624 Y132.856 F42000
; LINE_WIDTH: 0.367835
G1 F3964
M204 S6000
G1 X128.244 Y137.561 E.12565
G1 X128.566 Y137.518 E.0086
G1 X127.958 Y132.899 E.12335
G1 X127.684 Y132.863 E.00732
M204 S10000
G1 X127.216 Y132.448 F42000
; LINE_WIDTH: 0.41999
G1 F3964
M204 S6000
G1 X127.941 Y137.955 E.17065
G1 X128.959 Y137.821 E.03155
G1 X128.27 Y132.586 E.16222
G1 X127.276 Y132.456 E.03082
M204 S10000
G1 X126.778 Y132.011 F42000
G1 F3964
M204 S6000
G1 X127.617 Y138.378 E.19733
G1 X129.382 Y138.145 E.05472
G1 X128.606 Y132.25 E.1827
G1 X126.838 Y132.018 E.0548
M204 S10000
G1 X126.341 Y131.573 F42000
G1 F3964
M204 S6000
G1 X127.292 Y138.801 E.224
G1 X129.806 Y138.47 E.0779
G1 X128.942 Y131.914 E.20319
G1 X126.4 Y131.581 E.07878
M204 S10000
G1 X125.903 Y131.136 F42000
G1 F3964
M204 S6000
G1 X126.967 Y139.224 E.25067
G1 X130.229 Y138.794 E.10107
G1 X129.278 Y131.577 E.22367
G1 X125.962 Y131.143 E.10277
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X127.945 Y131.403 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/73
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z1.2 I.844 J.877 P1  F42000
G1 X129.708 Y129.706 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3746
M204 S6000
G1 X130.197 Y129.77 E.01635
G1 X131.515 Y139.788 E.33516
G1 X125.982 Y140.517 E.18516
G1 X124.467 Y129.016 E.38478
G1 X129.648 Y129.698 E.17334
M204 S10000
G1 X130.201 Y128.965 F42000
G1 F3746
M204 S6000
G1 X130.244 Y128.638 E.01095
G1 X130.458 Y128.638 E.0071
G1 X131.972 Y140.138 E.38478
G1 X125.631 Y140.973 E.21216
G1 X124.083 Y129.217 E.39334
G3 X124.021 Y128.547 I7.636 J-1.043 E.02234
G1 X130.15 Y129.354 E.20504
G1 X130.193 Y129.024 E.01102
M204 S250
G1 X129.812 Y128.914 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3746
M204 S5000
G1 X124.339 Y128.193 E.16961
G1 X124.499 Y126.984 E.03749
G1 X129.971 Y127.704 E.16961
G1 X129.82 Y128.854 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.834 Y128.615 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.018 Y121.301 Z1.4 F42000
G1 X131.262 Y117.132 Z1.4
G1 Z1
G1 E.8 F1800
G1 F3746
M204 S5000
G1 X129.889 Y127.562 E.32325
G1 X124.615 Y126.868 E.16347
G1 X125.716 Y118.5 E.25933
G1 X125.988 Y116.438 E.06392
G1 X131.203 Y117.124 E.16163
M204 S250
G1 X131.378 Y117.016 F42000
G1 F3746
M204 S5000
G1 X125.906 Y116.296 E.16961
G1 X126.065 Y115.086 E.03749
G1 X131.538 Y115.807 E.16961
G1 X131.386 Y116.957 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.401 Y116.717 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.358 Y124.29 Z1.4 F42000
G1 X130.803 Y127.809 Z1.4
G1 Z1
G1 E.8 F1800
G1 F3746
M204 S5000
G1 X130.794 Y128 E.00589
G2 X130.812 Y128.32 I2.824 J0 E.00985
G1 X132.386 Y140.28 E.37067
G3 X132.228 Y140.5 I-.19 J.03 E.00924
G1 X125.489 Y141.387 E.20884
G3 X125.267 Y141.215 I-.028 J-.193 E.00966
G1 X123.694 Y129.264 E.37038
G3 X123.694 Y126.736 I10.795 J-1.264 E.07786
G1 X125.267 Y114.785 E.37038
G3 X125.463 Y114.611 I.197 J.024 E.0088
G1 X132.23 Y115.501 E.20972
G3 X132.386 Y115.723 I-.036 J.191 E.00922
G1 X130.812 Y127.68 E.3706
G1 X130.807 Y127.749 E.00211
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.794 Y128 E-.09568
G1 X130.812 Y128.32 E-.1217
G1 X130.998 Y129.736 E-.54262
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.4
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.4 F4000
            G39.3 S1
            G0 Z1.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X130.349 Y128.442 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.533843
G1 F3746
M204 S6000
G1 X130.356 Y128.146 E.01181
; LINE_WIDTH: 0.495916
G1 X130.408 Y127.564 E.02159
; LINE_WIDTH: 0.505844
G1 X130.397 Y127.457 E.00406
; LINE_WIDTH: 0.555838
G1 X130.386 Y127.35 E.0045
; LINE_WIDTH: 0.580822
G1 X131.687 Y117.466 E.43698
; LINE_WIDTH: 0.556688
G1 X131.653 Y117.436 E.00192
; LINE_WIDTH: 0.508412
G1 X131.618 Y117.407 E.00174
; LINE_WIDTH: 0.460135
G1 X131.583 Y117.377 E.00156
; LINE_WIDTH: 0.411859
G1 X131.548 Y117.347 E.00138
; LINE_WIDTH: 0.363582
G1 X131.513 Y117.318 E.0012
; LINE_WIDTH: 0.315306
G1 X131.478 Y117.288 E.00102
; LINE_WIDTH: 0.267029
G1 X131.443 Y117.258 E.00084
M204 S10000
G1 X131.687 Y117.466 F42000
; LINE_WIDTH: 0.555823
G1 F3746
M204 S6000
G1 X131.726 Y117.365 E.0045
; LINE_WIDTH: 0.505832
G1 X131.764 Y117.265 E.00406
; LINE_WIDTH: 0.48085
G1 X131.975 Y115.665 E.0576
M204 S10000
G1 X125.679 Y114.837 F42000
; LINE_WIDTH: 0.48085
G1 F3746
M204 S6000
G1 X125.469 Y116.436 E.05755
; LINE_WIDTH: 0.505861
G1 X125.48 Y116.543 E.00406
; LINE_WIDTH: 0.555849
G1 X125.491 Y116.65 E.0045
M204 S10000
G1 X125.78 Y116.513 F42000
; LINE_WIDTH: 0.26703
G1 F3746
M204 S6000
G1 X125.739 Y116.532 E.00084
; LINE_WIDTH: 0.315311
G1 X125.698 Y116.552 E.00102
; LINE_WIDTH: 0.363591
G1 X125.656 Y116.572 E.0012
; LINE_WIDTH: 0.411872
G1 X125.615 Y116.591 E.00138
; LINE_WIDTH: 0.460153
G1 X125.574 Y116.611 E.00156
; LINE_WIDTH: 0.508434
G1 X125.532 Y116.63 E.00174
; LINE_WIDTH: 0.556714
G1 X125.491 Y116.65 E.00192
; LINE_WIDTH: 0.58085
G1 X124.19 Y126.534 E.437
; LINE_WIDTH: 0.556709
G1 X124.225 Y126.564 E.00192
; LINE_WIDTH: 0.508429
G1 X124.259 Y126.593 E.00174
; LINE_WIDTH: 0.460149
G1 X124.294 Y126.623 E.00156
; LINE_WIDTH: 0.41187
G1 X124.329 Y126.653 E.00138
; LINE_WIDTH: 0.36359
G1 X124.364 Y126.682 E.0012
; LINE_WIDTH: 0.31531
G1 X124.399 Y126.712 E.00102
; LINE_WIDTH: 0.267031
G1 X124.434 Y126.742 E.00084
M204 S10000
G1 X124.19 Y126.534 F42000
; LINE_WIDTH: 0.555849
G1 F3746
M204 S6000
G1 X124.151 Y126.635 E.0045
; LINE_WIDTH: 0.497812
G2 X124.106 Y126.786 I.294 J.17 E.0059
; LINE_WIDTH: 0.467579
G2 X124.017 Y127.596 I18.512 J2.439 E.02821
; LINE_WIDTH: 0.42335
G1 X123.986 Y128 E.01255
; LINE_WIDTH: 0.387816
G1 X123.968 Y128.342 E.00963
; WIPE_START
G1 F10437.947
G1 X123.986 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.675 Y131.223 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F3746
M204 S6000
G1 X127.618 Y138.384 E.22193
G1 X129.383 Y138.152 E.05473
G1 X128.503 Y131.464 E.20726
G1 X126.734 Y131.231 E.05481
M204 S10000
G1 X127.113 Y131.661 F42000
G1 F3746
M204 S6000
G1 X127.942 Y137.961 E.19524
G1 X128.96 Y137.827 E.03155
G1 X128.167 Y131.8 E.18678
G1 X127.172 Y131.669 E.03082
M204 S10000
G1 X127.52 Y132.069 F42000
; LINE_WIDTH: 0.36784
M73 P37 R12
G1 F3746
M204 S6000
G1 X128.244 Y137.567 E.14683
G1 X128.566 Y137.525 E.0086
G1 X127.854 Y132.113 E.14453
G1 X127.58 Y132.077 E.00732
M204 S10000
G1 X128.839 Y131.128 F42000
; LINE_WIDTH: 0.41999
G1 F3746
M204 S6000
G1 X126.237 Y130.785 E.08065
G1 X127.293 Y138.807 E.24861
G1 X129.806 Y138.476 E.0779
G1 X128.847 Y131.188 E.22589
M204 S10000
G1 X129.175 Y130.792 F42000
G1 F3746
M204 S6000
G1 X125.799 Y130.347 E.10464
G1 X126.968 Y139.23 E.2753
G1 X130.229 Y138.801 E.10107
G1 X129.183 Y130.851 E.24636
M204 S10000
G1 X129.511 Y130.456 F42000
G1 F3746
M204 S6000
G1 X125.361 Y129.909 E.12863
G1 X126.644 Y139.654 E.30198
G1 X130.653 Y139.125 E.12424
G1 X129.519 Y130.515 E.26684
M204 S10000
G1 X129.847 Y130.12 F42000
G1 F3746
M204 S6000
G1 X124.923 Y129.471 E.15261
G1 X126.319 Y140.077 E.32867
G1 X131.076 Y139.45 E.14741
G1 X129.855 Y130.179 E.28732
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X130.116 Y132.162 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/73
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z1.4 I1.2 J-.2 P1  F42000
G1 X129.708 Y129.706 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2689
M204 S6000
G1 X130.197 Y129.77 E.01635
G1 X131.515 Y139.788 E.33516
G1 X125.981 Y140.517 E.18516
G1 X124.467 Y129.016 E.38478
G1 X129.648 Y129.698 E.17334
M204 S10000
G1 X130.201 Y128.965 F42000
G1 F2689
M204 S6000
G1 X130.244 Y128.638 E.01095
G1 X130.458 Y128.638 E.0071
G1 X131.972 Y140.138 E.38478
G1 X125.631 Y140.973 E.21216
G1 X124.083 Y129.217 E.39334
G3 X124.021 Y128.547 I7.624 J-1.042 E.02233
G1 X130.15 Y129.354 E.20504
G1 X130.193 Y129.024 E.01102
M204 S250
G1 X129.812 Y128.914 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2689
M204 S5000
G1 X124.339 Y128.193 E.16961
G1 X124.499 Y126.984 E.03749
G1 X129.971 Y127.704 E.16961
G1 X129.82 Y128.854 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.834 Y128.615 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.018 Y121.301 Z1.6 F42000
G1 X131.262 Y117.132 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F2689
M204 S5000
G1 X129.889 Y127.562 E.32325
G1 X124.615 Y126.868 E.16347
G1 X125.521 Y119.984 E.21335
G1 X125.988 Y116.438 E.1099
G1 X131.203 Y117.124 E.16163
M204 S250
G1 X131.378 Y117.016 F42000
G1 F2689
M204 S5000
G1 X125.906 Y116.296 E.16961
G1 X126.065 Y115.086 E.03749
G1 X131.538 Y115.807 E.16961
G1 X131.386 Y116.957 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.401 Y116.717 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.357 Y124.29 Z1.6 F42000
G1 X130.803 Y127.821 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F2689
M204 S5000
G1 X130.796 Y127.998 E.00542
G2 X130.812 Y128.32 I3.337 J.003 E.00992
G1 X132.386 Y140.28 E.37067
G3 X132.23 Y140.499 I-.19 J.03 E.00917
G1 X125.489 Y141.387 E.20892
G3 X125.268 Y141.217 I-.03 J-.191 E.00961
G1 X123.694 Y129.264 E.37045
G3 X123.694 Y126.736 I10.795 J-1.264 E.07785
G1 X125.268 Y114.783 E.37045
G3 X125.489 Y114.613 I.193 J.022 E.00958
G1 X132.275 Y115.514 E.21034
G3 X132.386 Y115.722 I-.087 J.18 E.00776
G1 X130.812 Y127.678 E.37052
G1 X130.807 Y127.762 E.00258
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.796 Y127.998 E-.08985
G1 X130.812 Y128.32 E-.12257
G1 X131 Y129.749 E-.54758
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.6
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.6 F4000
            G39.3 S1
            G0 Z1.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X130.349 Y128.442 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.533455
G1 F2689
M204 S6000
G1 X130.356 Y128.143 E.01196
; LINE_WIDTH: 0.495877
G2 X130.401 Y127.493 I-25.367 J-2.084 E.02405
; LINE_WIDTH: 0.53085
G1 X130.394 Y127.421 E.00285
; LINE_WIDTH: 0.564185
G1 X130.386 Y127.35 E.00305
; LINE_WIDTH: 0.580833
G1 X131.687 Y117.466 E.43699
; LINE_WIDTH: 0.55669
G1 X131.653 Y117.436 E.00192
; LINE_WIDTH: 0.508414
G1 X131.618 Y117.407 E.00174
; LINE_WIDTH: 0.460137
G1 X131.583 Y117.377 E.00156
; LINE_WIDTH: 0.41186
G1 X131.548 Y117.347 E.00138
; LINE_WIDTH: 0.363583
G1 X131.513 Y117.318 E.0012
; LINE_WIDTH: 0.315306
G1 X131.478 Y117.288 E.00102
; LINE_WIDTH: 0.267029
G1 X131.443 Y117.258 E.00084
M204 S10000
G1 X131.687 Y117.466 F42000
; LINE_WIDTH: 0.555838
G1 F2689
M204 S6000
G1 X131.726 Y117.365 E.0045
; LINE_WIDTH: 0.505842
G1 X131.764 Y117.265 E.00406
; LINE_WIDTH: 0.480849
G1 X131.975 Y115.665 E.0576
; WIPE_START
G1 F8220.515
G1 X131.764 Y117.265 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.491 Y116.65 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.556715
G1 F2689
M204 S6000
G1 X125.532 Y116.63 E.00192
; LINE_WIDTH: 0.508437
G1 X125.574 Y116.611 E.00174
; LINE_WIDTH: 0.460159
G1 X125.615 Y116.591 E.00156
; LINE_WIDTH: 0.41188
M73 P37 R11
G1 X125.656 Y116.572 E.00138
; LINE_WIDTH: 0.363602
G1 X125.698 Y116.552 E.0012
; LINE_WIDTH: 0.315324
G1 X125.739 Y116.532 E.00102
; LINE_WIDTH: 0.267046
G1 X125.78 Y116.513 E.00084
M204 S10000
G1 X125.679 Y114.835 F42000
; LINE_WIDTH: 0.480859
G1 F2689
M204 S6000
G1 X125.469 Y116.436 E.05762
; LINE_WIDTH: 0.505865
G1 X125.48 Y116.543 E.00406
; LINE_WIDTH: 0.555861
G1 X125.491 Y116.65 E.0045
; LINE_WIDTH: 0.580852
G1 X124.19 Y126.534 E.43701
; LINE_WIDTH: 0.555851
G1 X124.151 Y126.635 E.0045
; LINE_WIDTH: 0.49781
G2 X124.106 Y126.786 I.294 J.17 E.0059
; LINE_WIDTH: 0.467575
G2 X124.017 Y127.596 I18.499 J2.437 E.02821
; LINE_WIDTH: 0.423321
G1 X123.986 Y128 E.01256
; LINE_WIDTH: 0.387789
G1 X123.968 Y128.342 E.00962
M204 S10000
G1 X124.434 Y126.742 F42000
; LINE_WIDTH: 0.267031
G1 F2689
M204 S6000
G1 X124.399 Y126.712 E.00084
; LINE_WIDTH: 0.31531
G1 X124.364 Y126.682 E.00102
; LINE_WIDTH: 0.36359
G1 X124.329 Y126.653 E.0012
; LINE_WIDTH: 0.41187
G1 X124.294 Y126.623 E.00138
; LINE_WIDTH: 0.460149
G1 X124.259 Y126.593 E.00156
; LINE_WIDTH: 0.508429
G1 X124.225 Y126.564 E.00174
; LINE_WIDTH: 0.556709
G1 X124.19 Y126.534 E.00192
; WIPE_START
G1 F7006.776
G1 X124.225 Y126.564 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.707 Y129.531 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2689
M204 S6000
G1 X127.321 Y129.743 E.05401
G1 X128 Y129.969 E.02373
G1 X128.545 Y129.904 E.01822
G1 X129.886 Y130.081 E.04487
G1 X130.052 Y131.34 E.04213
G1 X129.31 Y131.82 E.0293
G3 X127.345 Y132.512 I-1.521 J-1.184 E.07303
G3 X126.035 Y131.478 I5.125 J-7.844 E.05544
G1 X125.379 Y131.272 E.02278
G1 X125.12 Y131.303 E.00867
G1 X125.462 Y133.903 E.08698
G1 X126.035 Y133.971 E.01913
G1 X126.69 Y134.44 E.02674
G2 X128.655 Y135.132 I1.521 J-1.184 E.07303
G2 X129.966 Y134.099 I-5.127 J-7.846 E.05544
G1 X130.397 Y133.963 E.01502
G1 X130.738 Y136.55 E.08657
G1 X130.621 Y136.513 E.00408
G1 X129.966 Y136.591 E.02189
G1 X129.31 Y137.061 E.02674
G3 X127.345 Y137.753 I-1.521 J-1.184 E.07303
G3 X126.035 Y136.719 I5.127 J-7.846 E.05544
G1 X125.824 Y136.653 E.00732
G1 X126.174 Y139.312 E.08896
G3 X127.083 Y140.02 I-3.507 J5.437 E.03826
G1 X129.554 Y139.695 E.08267
G3 X130.621 Y139.134 I1.185 J.959 E.04111
G1 X131.085 Y139.189 E.01553
G1 X130.873 Y137.575 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X131.085 Y139.189 E-.61876
G1 X130.716 Y139.145 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/73
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z1.6 I1.21 J-.129 P1  F42000
G1 X129.708 Y129.706 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2723
M204 S6000
G1 X130.197 Y129.77 E.01635
G1 X131.515 Y139.788 E.33516
G1 X125.982 Y140.517 E.18516
M73 P38 R11
G1 X124.467 Y129.016 E.38478
G1 X129.648 Y129.698 E.17334
M204 S10000
G1 X130.201 Y128.965 F42000
G1 F2723
M204 S6000
G1 X130.244 Y128.638 E.01095
G1 X130.458 Y128.638 E.0071
G1 X131.972 Y140.138 E.38478
G1 X125.631 Y140.973 E.21216
G1 X124.083 Y129.217 E.39334
G3 X124.021 Y128.547 I7.634 J-1.043 E.02234
G1 X130.15 Y129.354 E.20504
G1 X130.193 Y129.024 E.01102
M204 S250
G1 X129.812 Y128.914 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2723
M204 S5000
G1 X124.339 Y128.193 E.16961
G1 X124.377 Y127.909 E.00882
G1 X124.499 Y126.984 E.02867
G1 X129.971 Y127.704 E.16961
G1 X129.82 Y128.854 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.834 Y128.615 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.018 Y121.301 Z1.8 F42000
G1 X131.262 Y117.132 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F2723
M204 S5000
G1 X129.889 Y127.562 E.32325
G1 X124.615 Y126.868 E.16347
G1 X125.326 Y121.467 E.16737
G1 X125.988 Y116.438 E.15588
G1 X131.203 Y117.124 E.16163
M204 S250
G1 X131.378 Y117.016 F42000
G1 F2723
M204 S5000
G1 X125.906 Y116.296 E.16961
G1 X125.943 Y116.011 E.00882
G1 X126.065 Y115.086 E.02867
G1 X131.538 Y115.807 E.16961
G1 X131.386 Y116.957 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.401 Y116.717 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.355 Y124.29 Z1.8 F42000
G1 X130.802 Y127.834 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F2723
M204 S5000
G1 X130.794 Y128 E.00512
G2 X130.812 Y128.32 I2.838 J0 E.00984
G1 X132.386 Y140.28 E.37067
G3 X132.228 Y140.5 I-.192 J.029 E.00922
G1 X125.49 Y141.387 E.20883
G3 X125.268 Y141.217 I-.029 J-.193 E.00959
G1 X123.694 Y129.264 E.37045
G3 X123.694 Y126.736 I10.795 J-1.264 E.07786
G1 X125.267 Y114.785 E.37038
G3 X125.49 Y114.613 I.192 J.018 E.00969
G1 X132.23 Y115.501 E.20891
G3 X132.386 Y115.722 I-.039 J.193 E.00919
G1 X130.812 Y127.68 E.3706
G1 X130.806 Y127.774 E.00289
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.794 Y128 E-.08608
G1 X130.812 Y128.32 E-.12167
G1 X131.001 Y129.761 E-.55225
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.8
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.8 F4000
            G39.3 S1
            G0 Z1.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X129.892 Y130.126 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2723
M204 S6000
G1 X129.886 Y130.081 E.00151
G1 X128.317 Y129.874 E.05251
G1 X128 Y129.968 E.01096
G1 X127.345 Y129.878 E.02194
G1 X127.124 Y129.717 E.00906
G1 X124.872 Y129.421 E.07535
G1 X125.126 Y131.348 E.0645
G1 X125.379 Y131.273 E.00877
G1 X126.035 Y131.363 E.02194
G1 X126.69 Y131.841 E.02689
G2 X128.655 Y132.499 I1.487 J-1.178 E.07274
G2 X129.966 Y131.467 I-6.475 J-9.574 E.05536
G1 X130.065 Y131.438 E.00344
G1 X130.392 Y133.925 E.08323
G1 X129.966 Y133.984 E.01429
G1 X129.31 Y134.461 E.02689
G3 X127.345 Y135.119 I-1.487 J-1.178 E.07274
G3 X126.035 Y134.088 I6.475 J-9.574 E.05536
G1 X125.464 Y133.919 E.01973
G1 X125.814 Y136.574 E.08884
G1 X126.035 Y136.605 E.00739
G1 X126.69 Y137.082 E.02689
G2 X128.655 Y137.74 I1.487 J-1.178 E.07274
G2 X129.966 Y136.708 I-6.475 J-9.575 E.05536
G1 X130.621 Y136.515 E.02266
G1 X130.735 Y136.53 E.00384
G1 X131.097 Y139.276 E.09187
G1 X130.621 Y139.135 E.01647
G1 X129.966 Y139.225 E.02194
G2 X129.277 Y139.731 I3.149 J5.009 E.02837
G1 X126.909 Y140.043 E.07921
G3 X126.194 Y139.464 I3.645 J-5.232 E.03054
G1 X125.982 Y137.85 E.05401
; WIPE_START
G1 F8843.478
G1 X126.194 Y139.464 E-.61876
G1 X126.483 Y139.698 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.155 Y132.073 Z1.8 F42000
G1 X125.491 Y116.65 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.556683
G1 F2723
M204 S6000
G1 X125.532 Y116.63 E.00192
; LINE_WIDTH: 0.508387
G1 X125.574 Y116.611 E.00174
; LINE_WIDTH: 0.460092
G1 X125.615 Y116.591 E.00156
; LINE_WIDTH: 0.411797
G1 X125.656 Y116.572 E.00138
; LINE_WIDTH: 0.363502
G1 X125.698 Y116.552 E.0012
; LINE_WIDTH: 0.315207
G1 X125.739 Y116.532 E.00102
; LINE_WIDTH: 0.266911
G1 X125.78 Y116.513 E.00084
M204 S10000
G1 X125.679 Y114.835 F42000
; LINE_WIDTH: 0.48088
G1 F2723
M204 S6000
G1 X125.469 Y116.436 E.05762
; LINE_WIDTH: 0.505886
G1 X125.48 Y116.543 E.00406
; LINE_WIDTH: 0.555852
G1 X125.491 Y116.65 E.00449
; LINE_WIDTH: 0.580837
G1 X124.19 Y126.534 E.437
M204 S10000
G1 X124.434 Y126.742 F42000
; LINE_WIDTH: 0.267031
G1 F2723
M204 S6000
G1 X124.399 Y126.712 E.00084
; LINE_WIDTH: 0.31531
G1 X124.364 Y126.682 E.00102
; LINE_WIDTH: 0.36359
G1 X124.329 Y126.653 E.0012
; LINE_WIDTH: 0.41187
G1 X124.294 Y126.623 E.00138
; LINE_WIDTH: 0.460149
G1 X124.259 Y126.593 E.00156
; LINE_WIDTH: 0.508429
G1 X124.225 Y126.564 E.00174
; LINE_WIDTH: 0.556709
G1 X124.19 Y126.534 E.00192
; LINE_WIDTH: 0.555849
G1 X124.151 Y126.635 E.0045
; LINE_WIDTH: 0.497814
G2 X124.106 Y126.786 I.294 J.17 E.0059
; LINE_WIDTH: 0.467599
G2 X124.017 Y127.596 I18.514 J2.439 E.02821
; LINE_WIDTH: 0.423375
G1 X123.986 Y128 E.01256
; LINE_WIDTH: 0.387859
G1 X123.968 Y128.342 E.00963
; WIPE_START
G1 F10436.652
G1 X123.986 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.35 Y128.442 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.534151
G1 F2723
M204 S6000
G1 X130.356 Y128.15 E.01168
; LINE_WIDTH: 0.49627
G1 X130.356 Y128.134 E.00057
G2 X130.401 Y127.493 I-15.482 J-1.4 E.02377
; LINE_WIDTH: 0.530827
G1 X130.394 Y127.421 E.00285
; LINE_WIDTH: 0.564161
G1 X130.386 Y127.35 E.00305
; LINE_WIDTH: 0.580831
G1 X131.687 Y117.466 E.43699
M204 S10000
G1 X131.443 Y117.258 F42000
; LINE_WIDTH: 0.267031
G1 F2723
M204 S6000
G1 X131.478 Y117.288 E.00084
; LINE_WIDTH: 0.31531
G1 X131.513 Y117.318 E.00102
; LINE_WIDTH: 0.36359
G1 X131.548 Y117.347 E.0012
; LINE_WIDTH: 0.41187
G1 X131.583 Y117.377 E.00138
; LINE_WIDTH: 0.460149
G1 X131.618 Y117.407 E.00156
; LINE_WIDTH: 0.508429
G1 X131.653 Y117.436 E.00174
; LINE_WIDTH: 0.556709
G1 X131.687 Y117.466 E.00192
; LINE_WIDTH: 0.55585
G1 X131.726 Y117.365 E.0045
; LINE_WIDTH: 0.505858
G1 X131.764 Y117.265 E.00406
; LINE_WIDTH: 0.480859
G1 X131.975 Y115.665 E.0576
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.338
G1 X131.764 Y117.265 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/73
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z1.8 I-1.201 J-.198 P1  F42000
G1 X129.708 Y129.706 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2725
M204 S6000
G1 X130.197 Y129.77 E.01635
G1 X131.515 Y139.788 E.33516
G1 X125.982 Y140.517 E.18516
G1 X124.467 Y129.016 E.38478
G1 X129.648 Y129.698 E.17334
M204 S10000
G1 X129.761 Y129.302 F42000
G1 F2725
M204 S6000
G1 X130.15 Y129.354 E.01301
G1 X130.244 Y128.638 E.02395
G1 X130.458 Y128.638 E.0071
G1 X131.972 Y140.138 E.38478
G1 X125.631 Y140.973 E.21216
G1 X124.083 Y129.217 E.39334
G3 X124.021 Y128.547 I7.644 J-1.044 E.02234
G1 X129.701 Y129.295 E.19004
M204 S250
G1 X129.812 Y128.914 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2725
M204 S5000
G1 X124.339 Y128.193 E.16961
G1 X124.381 Y127.878 E.00976
G1 X124.499 Y126.984 E.02773
G1 X129.971 Y127.704 E.16961
G1 X129.82 Y128.854 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.834 Y128.615 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.018 Y121.301 Z2 F42000
G1 X131.262 Y117.132 Z2
G1 Z1.6
G1 E.8 F1800
G1 F2725
M204 S5000
G1 X129.889 Y127.562 E.32325
G1 X124.615 Y126.868 E.16347
G1 X125.13 Y122.951 E.1214
G1 X125.988 Y116.438 E.20186
G1 X131.203 Y117.124 E.16163
M204 S250
G1 X131.378 Y117.016 F42000
G1 F2725
M204 S5000
G1 X125.906 Y116.296 E.16961
G1 X125.947 Y115.981 E.00976
G1 X126.065 Y115.086 E.02773
G1 X131.538 Y115.807 E.16961
G1 X131.386 Y116.957 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.401 Y116.717 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.353 Y124.29 Z2 F42000
G1 X130.801 Y127.847 Z2
G1 Z1.6
M73 P39 R11
G1 E.8 F1800
G1 F2725
M204 S5000
G1 X130.793 Y128 E.0047
G2 X130.812 Y128.32 I2.805 J0 E.00985
G1 X132.386 Y140.28 E.37067
G3 X132.228 Y140.5 I-.19 J.03 E.00924
G1 X125.489 Y141.387 E.20884
G3 X125.267 Y141.215 I-.03 J-.191 E.00968
G1 X123.694 Y129.264 E.37038
G3 X123.694 Y126.736 I10.794 J-1.264 E.07786
G1 X125.267 Y114.785 E.37038
G3 X125.489 Y114.613 I.192 J.018 E.00968
G1 X132.23 Y115.501 E.20893
G3 X132.386 Y115.723 I-.039 J.193 E.00919
G1 X130.812 Y127.68 E.3706
G1 X130.805 Y127.787 E.0033
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.793 Y128 E-.08088
G1 X130.812 Y128.32 E-.12175
G1 X131.003 Y129.774 E-.55737
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2 F4000
            G39.3 S1
            G0 Z2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X129.874 Y130.079 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2725
M204 S6000
G1 X128.259 Y129.867 E.05401
G1 X128 Y129.991 E.00954
G3 X126.747 Y129.667 I-.362 J-1.187 E.04516
G1 X124.872 Y129.421 E.06273
G1 X125.129 Y131.371 E.06524
G1 X125.379 Y131.25 E.00923
G1 X126.035 Y131.221 E.02175
G1 X126.362 Y131.346 E.01163
G3 X127.345 Y132.297 I-4.256 J5.381 E.04544
G2 X128.655 Y132.641 I1.057 J-1.361 E.04618
G1 X128.983 Y132.516 E.01163
G2 X129.966 Y131.565 I-4.256 J-5.381 E.04544
G1 X130.075 Y131.512 E.00402
G1 X130.384 Y133.86 E.07856
G2 X129.638 Y133.967 I-.25 J.917 E.0257
G2 X128.655 Y134.918 I4.256 J5.381 E.04544
G3 X127.345 Y135.261 I-1.057 J-1.361 E.04618
G1 X127.017 Y135.137 E.01163
G3 X126.035 Y134.186 I4.256 J-5.381 E.04544
G1 X125.463 Y133.911 E.02103
G1 X125.8 Y136.473 E.08571
G3 X126.362 Y136.587 I.148 J.708 E.01955
G3 X127.345 Y137.538 I-4.257 J5.382 E.04544
G2 X128.655 Y137.882 I1.057 J-1.361 E.04618
G1 X128.983 Y137.757 E.01163
G2 X129.966 Y136.806 I-4.255 J-5.38 E.04544
G1 X130.73 Y136.487 E.02747
G1 X131.106 Y139.345 E.09564
G2 X129.966 Y139.083 I-.877 J1.203 E.03989
G2 X129.04 Y139.762 I.746 J1.987 E.03855
G1 X126.664 Y140.075 E.0795
G1 X126.214 Y139.611 E.02145
G1 X126.001 Y137.997 E.05401
; WIPE_START
G1 F8843.478
G1 X126.214 Y139.611 E-.61876
G1 X126.472 Y139.878 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.853 Y132.419 Z2 F42000
G1 X123.968 Y128.342 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.387847
G1 F2725
M204 S6000
G1 X123.986 Y128 E.00962
; LINE_WIDTH: 0.423356
G1 X124.017 Y127.596 E.01256
; LINE_WIDTH: 0.467604
G3 X124.106 Y126.786 I18.599 J1.628 E.02821
; LINE_WIDTH: 0.49782
G3 X124.151 Y126.635 I.339 J.019 E.0059
; LINE_WIDTH: 0.555849
G1 X124.19 Y126.534 E.0045
M204 S10000
G1 X124.434 Y126.742 F42000
; LINE_WIDTH: 0.267012
G1 F2725
M204 S6000
G1 X124.399 Y126.712 E.00084
; LINE_WIDTH: 0.315294
G1 X124.364 Y126.682 E.00102
; LINE_WIDTH: 0.363576
G1 X124.329 Y126.653 E.0012
; LINE_WIDTH: 0.411859
G1 X124.294 Y126.623 E.00138
; LINE_WIDTH: 0.460141
G1 X124.259 Y126.593 E.00156
; LINE_WIDTH: 0.508423
G1 X124.225 Y126.564 E.00174
; LINE_WIDTH: 0.556705
G1 X124.19 Y126.534 E.00192
; LINE_WIDTH: 0.58084
G1 X125.491 Y116.65 E.437
; LINE_WIDTH: 0.564184
G1 X125.484 Y116.579 E.00305
; LINE_WIDTH: 0.530849
G1 X125.476 Y116.507 E.00285
; LINE_WIDTH: 0.497514
G1 X125.469 Y116.436 E.00266
; LINE_WIDTH: 0.480848
G1 X125.679 Y114.835 E.05761
M204 S10000
G1 X125.78 Y116.513 F42000
; LINE_WIDTH: 0.267045
G1 F2725
M204 S6000
G1 X125.739 Y116.532 E.00084
; LINE_WIDTH: 0.315321
G1 X125.698 Y116.552 E.00102
; LINE_WIDTH: 0.363597
G1 X125.656 Y116.572 E.0012
; LINE_WIDTH: 0.411873
G1 X125.615 Y116.591 E.00138
; LINE_WIDTH: 0.460149
G1 X125.574 Y116.611 E.00156
; LINE_WIDTH: 0.508425
G1 X125.532 Y116.63 E.00174
; LINE_WIDTH: 0.556702
G1 X125.491 Y116.65 E.00192
; WIPE_START
G1 F7006.873
G1 X125.532 Y116.63 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.687 Y117.466 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.556709
G1 F2725
M204 S6000
G1 X131.653 Y117.436 E.00192
; LINE_WIDTH: 0.508429
G1 X131.618 Y117.407 E.00174
; LINE_WIDTH: 0.460149
G1 X131.583 Y117.377 E.00156
; LINE_WIDTH: 0.41187
G1 X131.548 Y117.347 E.00138
; LINE_WIDTH: 0.36359
G1 X131.513 Y117.318 E.0012
; LINE_WIDTH: 0.31531
G1 X131.478 Y117.288 E.00102
; LINE_WIDTH: 0.267031
G1 X131.443 Y117.258 E.00084
M204 S10000
G1 X131.975 Y115.665 F42000
; LINE_WIDTH: 0.480859
G1 F2725
M204 S6000
G1 X131.764 Y117.265 E.0576
; LINE_WIDTH: 0.505861
G1 X131.726 Y117.365 E.00406
; LINE_WIDTH: 0.555851
G1 X131.687 Y117.466 E.0045
; LINE_WIDTH: 0.580835
G1 X130.386 Y127.35 E.43699
; LINE_WIDTH: 0.55584
G1 X130.397 Y127.457 E.0045
; LINE_WIDTH: 0.497274
G3 X130.363 Y128.005 I-2.662 J.11 E.02037
G1 X130.356 Y128.143 E.0051
; LINE_WIDTH: 0.533477
G1 X130.349 Y128.442 E.01196
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7338.6
G1 X130.356 Y128.143 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/73
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z2 I-1.124 J-.466 P1  F42000
G1 X129.708 Y129.706 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2734
M204 S6000
G1 X130.197 Y129.77 E.01635
G1 X131.515 Y139.788 E.33516
G1 X125.982 Y140.517 E.18516
G1 X124.467 Y129.016 E.38478
G1 X129.648 Y129.698 E.17334
M204 S10000
G1 X130.201 Y128.965 F42000
G1 F2734
M204 S6000
G1 X130.244 Y128.638 E.01095
G1 X130.458 Y128.638 E.0071
G1 X131.972 Y140.138 E.38478
G1 X125.631 Y140.973 E.21216
G1 X124.083 Y129.217 E.39334
G3 X124.021 Y128.547 I7.639 J-1.043 E.02233
G1 X130.15 Y129.354 E.20504
G1 X130.193 Y129.024 E.01102
M204 S250
G1 X129.812 Y128.914 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2734
M204 S5000
G1 X124.339 Y128.193 E.16961
G1 X124.385 Y127.848 E.01071
G1 X124.499 Y126.984 E.02678
G1 X129.971 Y127.704 E.16961
G1 X129.82 Y128.854 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.834 Y128.615 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.018 Y121.301 Z2.2 F42000
G1 X131.262 Y117.132 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F2734
M204 S5000
G1 X129.889 Y127.562 E.32325
G1 X124.615 Y126.868 E.16347
G1 X124.935 Y124.434 E.07542
G1 X125.988 Y116.438 E.24783
G1 X131.203 Y117.124 E.16163
M204 S250
G1 X131.378 Y117.016 F42000
G1 F2734
M204 S5000
G1 X125.906 Y116.296 E.16961
G1 X125.951 Y115.95 E.01071
G1 X126.065 Y115.086 E.02678
G1 X131.538 Y115.807 E.16961
G1 X131.386 Y116.957 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.401 Y116.717 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.352 Y124.29 Z2.2 F42000
G1 X130.8 Y127.861 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F2734
M204 S5000
G1 X130.797 Y127.998 E.0042
G2 X130.812 Y128.32 I3.427 J.002 E.00991
G1 X132.386 Y140.28 E.37066
G3 X132.23 Y140.499 I-.192 J.029 E.00916
G1 X125.489 Y141.387 E.20891
G3 X125.268 Y141.217 I-.03 J-.191 E.00961
G1 X123.694 Y129.264 E.37045
G3 X123.694 Y126.736 I10.795 J-1.264 E.07786
G1 X125.267 Y114.785 E.37038
G3 X125.489 Y114.613 I.192 J.018 E.00968
G1 X132.23 Y115.501 E.20892
G3 X132.386 Y115.722 I-.039 J.193 E.00919
G1 X130.812 Y127.678 E.37052
G1 X130.804 Y127.801 E.00381
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.797 Y127.998 E-.07479
G1 X130.812 Y128.32 E-.12247
G1 X131.005 Y129.788 E-.56275
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.2
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.2 F4000
            G39.3 S1
            G0 Z2.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X129.87 Y130.079 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2734
M204 S6000
G1 X128.256 Y129.866 E.05401
G1 X128 Y130.041 E.01028
G1 X127.345 Y130.204 E.02239
G3 X126.479 Y129.632 I.079 J-1.061 E.03593
G1 X124.872 Y129.421 E.05378
G1 X125.129 Y131.372 E.06528
G1 X125.379 Y131.2 E.01008
G1 X126.035 Y131.038 E.02239
M73 P40 R11
G3 X126.69 Y131.324 I.081 J.709 E.02484
G1 X127.345 Y132.212 E.03662
G2 X128.655 Y132.824 I1.47 J-1.44 E.04902
G2 X129.31 Y132.538 I.081 J-.709 E.02484
G1 X129.966 Y131.65 E.03662
G1 X130.082 Y131.569 E.0047
G1 X130.37 Y133.759 E.07324
G2 X129.31 Y133.944 I-.404 J.809 E.03824
G1 X128.655 Y134.833 E.03662
G3 X127.345 Y135.445 I-1.47 J-1.44 E.04902
G3 X126.69 Y135.159 I-.081 J-.709 E.02484
G1 X126.035 Y134.27 E.03662
G1 X125.458 Y133.875 E.02318
G1 X125.783 Y136.341 E.08253
G3 X126.69 Y136.565 I.289 J.777 E.03291
G1 X127.345 Y137.454 E.03662
G2 X128.655 Y138.065 I1.47 J-1.44 E.04902
G2 X129.31 Y137.779 I.081 J-.709 E.02484
G1 X129.966 Y136.891 E.03662
G1 X130.72 Y136.416 E.02957
G1 X131.113 Y139.4 E.09982
G2 X129.966 Y138.9 I-1.24 J1.279 E.04243
G1 X129.638 Y138.939 E.01095
G2 X128.869 Y139.785 I1.031 J1.71 E.03846
G1 X126.469 Y140.101 E.08028
G1 X126.237 Y139.785 E.01301
G1 X126.024 Y138.171 E.05401
; WIPE_START
G1 F8843.478
G1 X126.237 Y139.785 E-.61876
G1 X126.457 Y140.085 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.177 Y132.648 Z2.2 F42000
G1 X131.687 Y117.466 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.556709
G1 F2734
M204 S6000
G1 X131.653 Y117.436 E.00192
; LINE_WIDTH: 0.508429
G1 X131.618 Y117.407 E.00174
; LINE_WIDTH: 0.460149
G1 X131.583 Y117.377 E.00156
; LINE_WIDTH: 0.41187
G1 X131.548 Y117.347 E.00138
; LINE_WIDTH: 0.36359
G1 X131.513 Y117.318 E.0012
; LINE_WIDTH: 0.31531
G1 X131.478 Y117.288 E.00102
; LINE_WIDTH: 0.267031
G1 X131.443 Y117.258 E.00084
M204 S10000
G1 X131.975 Y115.665 F42000
; LINE_WIDTH: 0.480867
G1 F2734
M204 S6000
G1 X131.764 Y117.265 E.0576
; LINE_WIDTH: 0.505858
G1 X131.726 Y117.365 E.00406
; LINE_WIDTH: 0.55585
G1 X131.687 Y117.466 E.0045
; LINE_WIDTH: 0.580841
G1 X130.386 Y127.35 E.437
; LINE_WIDTH: 0.555845
G1 X130.397 Y127.457 E.0045
; LINE_WIDTH: 0.505846
G1 X130.408 Y127.564 E.00406
; LINE_WIDTH: 0.496322
G1 X130.356 Y128.153 E.02186
; LINE_WIDTH: 0.534445
G1 X130.35 Y128.442 E.01155
; WIPE_START
G1 F7324.154
G1 X130.356 Y128.153 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.19 Y126.534 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.556709
G1 F2734
M204 S6000
G1 X124.225 Y126.564 E.00192
; LINE_WIDTH: 0.508429
G1 X124.259 Y126.593 E.00174
; LINE_WIDTH: 0.460149
G1 X124.294 Y126.623 E.00156
; LINE_WIDTH: 0.41187
G1 X124.329 Y126.653 E.00138
; LINE_WIDTH: 0.36359
G1 X124.364 Y126.682 E.0012
; LINE_WIDTH: 0.31531
G1 X124.399 Y126.712 E.00102
; LINE_WIDTH: 0.267031
G1 X124.434 Y126.742 E.00084
M204 S10000
G1 X123.968 Y128.342 F42000
; LINE_WIDTH: 0.387792
G1 F2734
M204 S6000
G1 X123.986 Y128 E.00962
; LINE_WIDTH: 0.423308
G1 X124.017 Y127.596 E.01256
; LINE_WIDTH: 0.467576
G3 X124.106 Y126.786 I18.558 J1.624 E.02821
; LINE_WIDTH: 0.497812
G3 X124.151 Y126.635 I.339 J.019 E.0059
; LINE_WIDTH: 0.555849
G1 X124.19 Y126.534 E.0045
; LINE_WIDTH: 0.580839
G1 X125.491 Y116.65 E.43699
M204 S10000
G1 X125.78 Y116.513 F42000
; LINE_WIDTH: 0.26706
G1 F2734
M204 S6000
G1 X125.739 Y116.532 E.00084
; LINE_WIDTH: 0.315331
G1 X125.698 Y116.552 E.00102
; LINE_WIDTH: 0.363603
G1 X125.656 Y116.572 E.0012
; LINE_WIDTH: 0.411875
G1 X125.615 Y116.591 E.00138
; LINE_WIDTH: 0.460146
G1 X125.574 Y116.611 E.00156
; LINE_WIDTH: 0.508418
G1 X125.532 Y116.63 E.00174
; LINE_WIDTH: 0.556689
G1 X125.491 Y116.65 E.00192
; LINE_WIDTH: 0.564165
G1 X125.484 Y116.579 E.00305
; LINE_WIDTH: 0.53083
G1 X125.476 Y116.507 E.00285
; LINE_WIDTH: 0.497495
G1 X125.469 Y116.436 E.00266
; LINE_WIDTH: 0.480835
G1 X125.679 Y114.835 E.05761
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.788
G1 X125.469 Y116.436 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/73
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z2.2 I-1.159 J.37 P1  F42000
G1 X129.708 Y129.706 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2696
M204 S6000
G1 X130.197 Y129.77 E.01635
G1 X131.515 Y139.788 E.33516
G1 X125.982 Y140.517 E.18516
G1 X124.467 Y129.016 E.38478
G1 X129.648 Y129.698 E.17334
M204 S10000
G1 X129.761 Y129.302 F42000
G1 F2696
M204 S6000
G1 X130.15 Y129.354 E.01301
G1 X130.244 Y128.638 E.02395
G1 X130.458 Y128.638 E.0071
G1 X131.972 Y140.138 E.38478
G1 X125.631 Y140.973 E.21216
G1 X124.083 Y129.217 E.39334
G3 X124.021 Y128.547 I7.646 J-1.044 E.02233
G1 X129.701 Y129.295 E.19004
M204 S250
G1 X129.812 Y128.914 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2696
M204 S5000
G1 X124.339 Y128.193 E.16961
G1 X124.389 Y127.817 E.01165
G1 X124.499 Y126.984 E.02583
G1 X129.971 Y127.704 E.16961
G1 X129.82 Y128.854 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.834 Y128.615 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.018 Y121.301 Z2.4 F42000
G1 X131.262 Y117.132 Z2.4
G1 Z2
G1 E.8 F1800
G1 F2696
M204 S5000
G1 X129.889 Y127.562 E.32325
G1 X124.615 Y126.868 E.16347
G1 X124.74 Y125.918 E.02944
G1 X125.988 Y116.438 E.29381
G1 X131.203 Y117.124 E.16162
M204 S250
G1 X131.378 Y117.016 F42000
G1 F2696
M204 S5000
G1 X125.906 Y116.296 E.16961
G1 X125.955 Y115.92 E.01165
G1 X126.065 Y115.086 E.02583
G1 X131.538 Y115.807 E.16961
G1 X131.386 Y116.957 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.401 Y116.717 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.35 Y124.291 Z2.4 F42000
G1 X130.799 Y127.875 Z2.4
G1 Z2
G1 E.8 F1800
G1 F2696
M204 S5000
G1 X130.793 Y128 E.00384
G2 X130.812 Y128.32 I2.805 J0 E.00985
G1 X132.386 Y140.28 E.37067
G3 X132.23 Y140.499 I-.19 J.03 E.00917
G1 X125.489 Y141.387 E.20891
G3 X125.268 Y141.217 I-.028 J-.193 E.00959
G1 X123.694 Y129.264 E.37045
G3 X123.694 Y126.736 I10.795 J-1.264 E.07786
G1 X125.267 Y114.786 E.37037
G3 X125.489 Y114.613 I.192 J.018 E.00969
G1 X132.249 Y115.505 E.20949
G3 X132.386 Y115.722 I-.053 J.186 E.00867
G1 X130.812 Y127.68 E.3706
G1 X130.803 Y127.815 E.00416
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.793 Y128 E-.07028
G1 X130.812 Y128.32 E-.12175
G1 X131.007 Y129.802 E-.56797
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.4
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.4 F4000
            G39.3 S1
            G0 Z2.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X129.823 Y130.072 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2696
M204 S6000
G1 X129.886 Y130.081 E.00211
G1 X130.09 Y131.632 E.0519
G2 X129.507 Y132.914 I2.182 J1.766 E.04721
G1 X129.645 Y133.241 E.01179
G1 X130.353 Y133.626 E.02671
G1 X130.711 Y136.343 E.09091
G1 X130.39 Y136.517 E.01212
G2 X129.507 Y138.155 I2.104 J2.189 E.06272
G1 X129.645 Y138.483 E.01179
G1 X130.852 Y139.138 E.04554
G1 X131.125 Y139.488 E.01472
G1 X128.781 Y139.793 E.07839
G2 X129.113 Y138.81 I-2.5 J-1.392 E.0346
G1 X128.975 Y138.483 E.01179
G1 X127.769 Y137.827 E.04554
G3 X126.887 Y136.19 I2.104 J-2.189 E.06272
G1 X127.025 Y135.862 E.01179
G1 X128.231 Y135.207 E.04554
G2 X129.113 Y133.569 I-2.104 J-2.189 E.06272
G1 X128.975 Y133.241 E.01179
G1 X127.769 Y132.586 E.04554
G3 X126.887 Y130.948 I2.104 J-2.189 E.06272
G1 X127.025 Y130.621 E.01179
G1 X128.231 Y129.965 E.04554
G1 X128.309 Y129.873 E.004
G1 X126.28 Y129.606 E.06787
G3 X126.355 Y130.621 I-.812 J.57 E.03544
G1 X125.121 Y131.309 E.04688
G1 X125.45 Y133.809 E.08366
G1 X125.61 Y133.896 E.00607
G3 X126.493 Y135.534 I-2.104 J2.189 E.06272
G1 X126.355 Y135.862 E.01179
G1 X125.762 Y136.184 E.02236
G1 X125.975 Y137.798 E.05401
; WIPE_START
M73 P41 R11
G1 F8843.478
G1 X125.762 Y136.184 E-.61876
G1 X126.089 Y136.006 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.053 Y128.65 Z2.4 F42000
G1 X123.968 Y128.342 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.387804
G1 F2696
M204 S6000
G1 X123.986 Y128 E.00962
; LINE_WIDTH: 0.423336
G1 X124.017 Y127.596 E.01257
; LINE_WIDTH: 0.46759
G3 X124.106 Y126.786 I18.631 J1.632 E.02821
; LINE_WIDTH: 0.497812
G3 X124.151 Y126.635 I.339 J.019 E.0059
; LINE_WIDTH: 0.555849
G1 X124.19 Y126.534 E.0045
; LINE_WIDTH: 0.556709
G1 X124.225 Y126.564 E.00192
; LINE_WIDTH: 0.508429
G1 X124.259 Y126.593 E.00174
; LINE_WIDTH: 0.46015
G1 X124.294 Y126.623 E.00156
; LINE_WIDTH: 0.41187
G1 X124.329 Y126.653 E.00138
; LINE_WIDTH: 0.36359
G1 X124.364 Y126.682 E.0012
; LINE_WIDTH: 0.315311
G1 X124.399 Y126.712 E.00102
; LINE_WIDTH: 0.267031
G1 X124.434 Y126.742 E.00084
M204 S10000
G1 X124.19 Y126.534 F42000
; LINE_WIDTH: 0.580851
G1 F2696
M204 S6000
G1 X125.491 Y116.65 E.43701
M204 S10000
G1 X125.78 Y116.513 F42000
; LINE_WIDTH: 0.267014
G1 F2696
M204 S6000
G1 X125.739 Y116.532 E.00084
; LINE_WIDTH: 0.315297
G1 X125.698 Y116.552 E.00102
; LINE_WIDTH: 0.36358
G1 X125.656 Y116.572 E.0012
; LINE_WIDTH: 0.411864
G1 X125.615 Y116.591 E.00138
; LINE_WIDTH: 0.460147
G1 X125.574 Y116.611 E.00156
; LINE_WIDTH: 0.508431
G1 X125.532 Y116.63 E.00174
; LINE_WIDTH: 0.556714
G1 X125.491 Y116.65 E.00192
; LINE_WIDTH: 0.555868
G1 X125.48 Y116.543 E.0045
; LINE_WIDTH: 0.50588
G1 X125.469 Y116.436 E.00406
; LINE_WIDTH: 0.48087
G1 X125.679 Y114.835 E.05762
M204 S10000
G1 X131.975 Y115.665 F42000
; LINE_WIDTH: 0.480867
G1 F2696
M204 S6000
G1 X131.764 Y117.265 E.0576
; LINE_WIDTH: 0.505856
G1 X131.726 Y117.365 E.00406
; LINE_WIDTH: 0.555849
G1 X131.687 Y117.466 E.0045
M204 S10000
G1 X131.443 Y117.258 F42000
; LINE_WIDTH: 0.267031
G1 F2696
M204 S6000
G1 X131.478 Y117.288 E.00084
; LINE_WIDTH: 0.31531
G1 X131.513 Y117.318 E.00102
; LINE_WIDTH: 0.36359
G1 X131.548 Y117.347 E.0012
; LINE_WIDTH: 0.41187
G1 X131.583 Y117.377 E.00138
; LINE_WIDTH: 0.460149
G1 X131.618 Y117.407 E.00156
; LINE_WIDTH: 0.508429
G1 X131.653 Y117.436 E.00174
; LINE_WIDTH: 0.556709
G1 X131.687 Y117.466 E.00192
; LINE_WIDTH: 0.580841
G1 X130.386 Y127.35 E.437
; LINE_WIDTH: 0.555843
G1 X130.397 Y127.457 E.0045
; LINE_WIDTH: 0.497272
G3 X130.363 Y128.005 I-2.662 J.11 E.02037
G1 X130.356 Y128.143 E.0051
; LINE_WIDTH: 0.533477
G1 X130.349 Y128.442 E.01196
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7338.6
G1 X130.356 Y128.143 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/73
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
M106 S198.9
; OBJECT_ID: 394
M204 S10000
G17
G3 Z2.4 I-1.124 J-.466 P1  F42000
G1 X129.708 Y129.706 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X130.197 Y129.77 E.01635
G1 X131.515 Y139.788 E.33516
G1 X125.982 Y140.517 E.18516
G1 X124.467 Y129.016 E.38478
G1 X129.648 Y129.698 E.17334
M204 S10000
G1 X130.201 Y128.965 F42000
G1 F8843.478
M204 S6000
G1 X130.244 Y128.638 E.01095
G1 X130.458 Y128.638 E.0071
G1 X131.972 Y140.138 E.38478
G1 X125.631 Y140.973 E.21216
G1 X124.083 Y129.217 E.39334
G3 X124.021 Y128.547 I7.646 J-1.044 E.02233
G1 X130.15 Y129.354 E.20504
G1 X130.193 Y129.024 E.01102
M204 S250
G1 X129.812 Y128.914 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X124.339 Y128.193 E.16961
G1 X124.393 Y127.787 E.0126
G1 X124.499 Y126.984 E.02489
G1 X129.971 Y127.704 E.16961
G1 X129.82 Y128.854 E.03564
; WIPE_START
M204 S6000
G1 X127.834 Y128.615 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.065 Y121.315 Z2.6 F42000
G1 X131.378 Y117.016 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X125.906 Y116.296 E.16961
G1 X125.959 Y115.889 E.0126
G1 X126.065 Y115.086 E.02489
G1 X131.538 Y115.807 E.16961
G1 X131.386 Y116.957 E.03564
; WIPE_START
M204 S6000
G1 X129.401 Y116.717 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.6 I-1.11 J-.499 P1  F42000
G1 X125.109 Y126.258 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M106 S255
M204 S6000
G1 X124.729 Y126.208 E.01269
M106 S198.9
G1 F2851.445
G1 X124.572 Y126.187 E.00525
G1 F6579.114
G1 X124.625 Y125.791 E.01327
G1 F8843.478
G1 X124.677 Y125.394 E.01327
G1 X125.666 Y117.877 E.2515
G1 X125.719 Y117.481 E.01327
G1 F6579.129
G1 X125.771 Y117.084 E.01327
G1 F2851.455
G1 X125.928 Y117.105 E.00525
M106 S255
G1 F1800
G1 X126.307 Y117.155 E.01269
M106 S198.9
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X126.323 Y117.157 E.00053
M106 S198.9
M106 S255
G1 F600
G1 X125.13 Y126.216 E.30311
M106 S198.9
; WIPE_START
M204 S6000
G1 X124.729 Y126.208 E-.15231
G1 X124.572 Y126.187 E-.06018
G1 X124.625 Y125.791 E-.152
G1 X124.677 Y125.394 E-.152
G1 X124.76 Y124.759 E-.24352
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.6 I.961 J.747 P1  F42000
G1 X130.367 Y117.552 Z2.6
G1 Z2.2
G1 E.8 F1800
M106 S255
G1 F600
M204 S5000
G1 X129.133 Y126.925 E.31361
G1 X125.51 Y126.448 E.12121
G1 X126.654 Y117.761 E.29067
G1 X126.744 Y117.075 E.02295
G1 X130.308 Y117.544 E.11922
M106 S198.9
M204 S250
G1 X129.927 Y117.889 F42000
M106 S255
G1 F600
M204 S5000
G1 X128.795 Y126.485 E.2876
G1 X125.95 Y126.111 E.0952
G1 X127.043 Y117.812 E.27766
G1 X127.082 Y117.515 E.00994
G1 X129.868 Y117.882 E.09321
M106 S198.9
; WIPE_START
M204 S6000
G1 X129.62 Y119.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.6 I.949 J.762 P1  F42000
G1 X131.274 Y117.809 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X131.305 Y117.813 E.00102
G1 X130.211 Y126.123 E.27804
G1 X130.159 Y126.519 E.01327
G1 F6578.988
G1 X130.106 Y126.916 E.01327
G1 F2851.362
G1 X129.949 Y126.895 E.00525
M106 S255
G1 F1800
G1 X129.57 Y126.845 E.01269
M106 S198.9
; FEATURE: Overhang wall
M106 S255
G1 F600
M204 S5000
G1 X129.554 Y126.843 E.00053
G1 X130.753 Y117.74 E.30457
G1 X130.769 Y117.742 E.00053
M106 S198.9
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X131.148 Y117.792 E.01269
M106 S198.9
G1 F2219.003
G1 X131.215 Y117.801 E.00224
M204 S10000
G1 X131.327 Y117.405 F42000
G1 F8843.478
M204 S6000
G1 X131.761 Y117.462 E.01453
G1 X130.509 Y126.976 E.31831
G1 X130.457 Y127.373 E.01327
G1 F5701.219
G1 X129.896 Y127.299 E.01876
M106 S255
G1 F1320
G1 X124.676 Y126.612 E.17465
M106 S198.9
G1 F5701.233
G1 X124.116 Y126.538 E.01876
G1 F8843.478
G1 X124.168 Y126.141 E.01327
G1 X125.368 Y117.024 E.30504
G1 X125.42 Y116.627 E.01327
G1 F5701.336
G1 X125.981 Y116.701 E.01876
M106 S255
G1 F1320
M73 P42 R11
G1 X131.201 Y117.388 E.17465
M106 S198.9
G1 F1681.621
G1 X131.268 Y117.397 E.00224
; WIPE_START
G1 X131.761 Y117.462 E-.18922
G1 X131.565 Y118.951 E-.57079
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.913 Y126.556 Z2.6 F42000
G1 X130.798 Y127.89 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X130.797 Y127.998 E.00334
G2 X130.812 Y128.32 I3.379 J.002 E.0099
G1 X132.386 Y140.28 E.37066
G3 X132.23 Y140.499 I-.192 J.029 E.00915
G1 X125.49 Y141.387 E.20891
G3 X125.267 Y141.215 I-.029 J-.193 E.00967
G1 X123.694 Y129.264 E.37038
G3 X123.694 Y126.736 I10.795 J-1.264 E.07786
G1 X125.267 Y114.785 E.37038
G3 X125.489 Y114.613 I.192 J.018 E.00968
G1 X132.23 Y115.501 E.20892
G3 X132.386 Y115.722 I-.038 J.193 E.0092
G1 X130.812 Y127.678 E.37054
G1 X130.802 Y127.83 E.00466
; WIPE_START
M204 S6000
G1 X130.797 Y127.998 E-.06409
G1 X130.812 Y128.32 E-.12236
G1 X131.009 Y129.816 E-.57355
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.6
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.6 F4000
            G39.3 S1
            G0 Z2.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X129.827 Y130.073 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X129.886 Y130.081 E.00199
G1 X130.091 Y131.636 E.05203
G1 X129.91 Y131.931 E.01148
G1 X129.797 Y132.586 E.02206
G2 X130.323 Y133.397 I1.249 J-.234 E.0329
G1 X130.692 Y136.204 E.0939
G2 X129.871 Y138.155 I.955 J1.55 E.07494
G2 X130.93 Y139.138 I2.846 J-2.004 E.04827
G3 X131.125 Y139.488 I-.296 J.394 E.01368
G1 X128.702 Y139.807 E.08106
G1 X128.824 Y139.138 E.02256
G2 X128.488 Y138.483 I-.847 J.021 E.02527
G1 X127.691 Y137.827 E.03423
G3 X127.251 Y136.19 I1.419 J-1.259 E.05832
G3 X128.309 Y135.207 I2.846 J2.004 E.04827
G2 X128.749 Y133.569 I-1.419 J-1.259 E.05832
G2 X127.691 Y132.586 I-2.846 J2.004 E.04827
G3 X127.251 Y130.948 I1.419 J-1.259 E.05832
G3 X128.309 Y129.965 I2.846 J2.004 E.04827
G1 X128.362 Y129.88 E.00332
G1 X126.138 Y129.587 E.07441
G3 X125.867 Y130.621 I-.893 J.318 E.03764
G1 X125.112 Y131.241 E.03243
G1 X125.434 Y133.687 E.08181
G1 X125.689 Y133.896 E.01096
G3 X126.129 Y135.534 I-1.419 J1.259 E.05832
G3 X125.734 Y135.971 I-1.227 J-.711 E.01966
G1 X125.947 Y137.585 E.05401
; WIPE_START
G1 X125.734 Y135.971 E-.61876
G1 X125.983 Y135.695 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.171 Y128.383 Z2.6 F42000
G1 X131.975 Y115.665 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.480859
G1 F8220.338
M204 S6000
G1 X131.764 Y117.265 E.0576
; WIPE_START
G1 X131.975 Y115.665 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.002 Y117.978 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.192577
G1 F15000
M204 S6000
G1 X129.857 Y126.678 E.10701
; WIPE_START
G1 X130.118 Y124.695 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.6 I-.621 J-1.047 P1  F42000
G1 X123.968 Y128.342 Z2.6
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.387791
G1 F10438.696
M204 S6000
G1 X123.986 Y128 E.00962
; LINE_WIDTH: 0.42332
G1 F9463.722
G1 X124.017 Y127.596 E.01256
; LINE_WIDTH: 0.466959
G1 F8489.792
G3 X124.113 Y126.735 I18.667 J1.635 E.02993
; WIPE_START
G1 X124.017 Y127.596 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.875 Y126.022 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.192586
G1 F15000
M204 S6000
G1 X126.02 Y117.322 E.10701
; WIPE_START
G1 X125.759 Y119.305 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.469 Y116.436 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.480853
G1 F8220.439
M204 S6000
G1 X125.679 Y114.835 E.05761
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.439
G1 X125.469 Y116.436 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/73
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
M106 S201.45
; OBJECT_ID: 394
M204 S10000
G17
G3 Z2.6 I-1.159 J.37 P1  F42000
G1 X129.708 Y129.706 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3884
M204 S6000
G1 X130.197 Y129.77 E.01635
G1 X131.515 Y139.788 E.33516
G1 X125.982 Y140.517 E.18516
G1 X124.467 Y129.016 E.38478
G1 X129.648 Y129.698 E.17334
M204 S10000
G1 X130.201 Y128.965 F42000
G1 F3884
M204 S6000
G1 X130.244 Y128.638 E.01095
G1 X130.458 Y128.638 E.0071
G1 X131.972 Y140.138 E.38478
G1 X125.631 Y140.973 E.21216
G1 X124.084 Y129.218 E.3933
G3 X124.021 Y128.547 I8.71 J-1.144 E.02238
G1 X130.15 Y129.354 E.20504
G1 X130.193 Y129.024 E.01102
M204 S250
G1 X129.812 Y128.914 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3884
M204 S5000
G1 X124.339 Y128.193 E.16961
G1 X124.397 Y127.756 E.01354
G1 X124.499 Y126.984 E.02394
G1 X129.971 Y127.704 E.16961
G1 X129.82 Y128.854 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.834 Y128.615 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.065 Y121.315 Z2.8 F42000
G1 X131.378 Y117.016 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F3884
M204 S5000
G1 X125.906 Y116.296 E.16961
G1 X125.963 Y115.859 E.01354
G1 X126.065 Y115.086 E.02394
G1 X131.538 Y115.807 E.16961
G1 X131.386 Y116.957 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.401 Y116.717 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I-.979 J.722 P1  F42000
G1 X129.978 Y117.501 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3884
M204 S6000
G1 X130.367 Y117.552 E.01301
G1 X129.133 Y126.925 E.31361
G1 X125.51 Y126.448 E.12121
G1 X126.63 Y117.939 E.28472
G1 X126.744 Y117.075 E.0289
G1 X129.919 Y117.493 E.10622
M204 S250
G1 X129.927 Y117.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3884
M204 S5000
G1 X128.795 Y126.485 E.2664
G1 X125.95 Y126.111 E.08819
G1 X127.019 Y117.99 E.25169
G1 X127.082 Y117.515 E.01472
G1 X129.868 Y117.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.62 Y119.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I.722 J-.98 P1  F42000
G1 X126.289 Y117.41 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3884
M204 S6000
G1 X125.124 Y126.26 E.29609
G1 X124.572 Y126.187 E.01847
G1 X125.771 Y117.084 E.30457
G1 X126.323 Y117.157 E.01847
G1 X126.297 Y117.351 E.0065
; WIPE_START
G1 F8843.478
G1 X126.036 Y119.334 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I.34 J1.168 P1  F42000
G1 X131.274 Y117.809 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F3884
M204 S6000
G1 X131.305 Y117.813 E.00102
G1 X130.106 Y126.916 E.30457
G1 X129.554 Y126.843 E.01847
G1 X130.753 Y117.74 E.30457
G1 X131.215 Y117.801 E.01545
M204 S10000
G1 X131.327 Y117.405 F42000
G1 F3884
M204 S6000
G1 X131.761 Y117.462 E.01453
G1 X130.457 Y127.373 E.33158
G1 X124.116 Y126.538 E.21216
G1 X125.42 Y116.627 E.33158
G1 X131.268 Y117.397 E.19564
; WIPE_START
G1 F8843.478
G1 X131.761 Y117.462 E-.18922
G1 X131.565 Y118.951 E-.57078
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.913 Y126.556 Z2.8 F42000
G1 X130.797 Y127.904 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3884
M204 S5000
G1 X130.797 Y127.998 E.00289
G2 X130.812 Y128.32 I3.469 J.002 E.0099
G1 X132.386 Y140.28 E.37066
G3 X132.228 Y140.5 I-.192 J.029 E.00922
G1 X125.49 Y141.387 E.20883
G3 X125.267 Y141.215 I-.029 J-.193 E.00967
G1 X123.694 Y129.264 E.37037
G3 X123.694 Y126.736 I10.793 J-1.264 E.07786
G1 X125.267 Y114.785 E.37038
G3 X125.489 Y114.613 I.192 J.018 E.00968
G1 X132.231 Y115.501 E.20893
G3 X132.386 Y115.722 I-.039 J.192 E.00919
G1 X130.812 Y127.678 E.37052
G1 X130.801 Y127.844 E.00513
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.797 Y127.998 E-.05849
G1 X130.812 Y128.32 E-.12242
G1 X131.011 Y129.831 E-.57908
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.8
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.8 F4000
            G39.3 S1
            G0 Z2.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X129.857 Y126.678 F42000
M73 P42 R10
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192586
G1 F3884
M204 S6000
G1 X131.002 Y117.978 E.10701
; WIPE_START
G1 F15000
G1 X130.741 Y119.961 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.764 Y117.265 Z2.8 F42000
G1 Z2.4
M73 P43 R10
G1 E.8 F1800
; LINE_WIDTH: 0.480858
G1 F3884
M204 S6000
G1 X131.975 Y115.665 E.05759
M204 S10000
G1 X125.679 Y114.835 F42000
; LINE_WIDTH: 0.480846
G1 F3884
M204 S6000
G1 X125.469 Y116.436 E.05761
; WIPE_START
G1 F8220.569
G1 X125.679 Y114.835 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.02 Y117.322 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.192587
G1 F3884
M204 S6000
G1 X124.875 Y126.022 E.10701
; WIPE_START
G1 F15000
G1 X125.136 Y124.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.113 Y126.735 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.466967
G1 F3884
M204 S6000
G2 X124.017 Y127.596 I18.579 J2.497 E.02993
; LINE_WIDTH: 0.423329
G1 X123.986 Y128 E.01257
; LINE_WIDTH: 0.38782
G1 X123.968 Y128.342 E.00962
; WIPE_START
G1 F10437.806
G1 X123.986 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.484 Y133.962 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.383016
G1 F3884
M204 S6000
G1 X124.913 Y129.591 E.12217
G1 X125.086 Y129.526 E.00512
G1 X126.081 Y129.594 E.02763
G1 X129.752 Y130.078 E.10262
G1 X129.857 Y130.11 E.00304
G1 X129.889 Y130.215 E.00304
G1 X130.895 Y137.851 E.21345
M204 S10000
G1 X126.082 Y138.502 F42000
; Slow Down Start
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X125.654 Y135.248 E.09093
G1 X125.714 Y135.059 E.00549
G1 X125.699 Y134.796 E.00728
; Slow Down End
M204 S10000
G1 X126.232 Y136.859 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3884
M204 S6000
G1 X126.036 Y135.207 E.0552
G2 X125.871 Y134.123 I-1.318 J-.354 E.03741
G1 X125.434 Y130.802 E.11111
G2 X126.036 Y129.954 I-1.879 J-1.972 E.03471
G1 X128.143 Y130.232 E.07049
G2 X127.343 Y131.276 I1.94 J2.316 E.04399
G2 X127.602 Y132.586 I1.623 J.36 E.04559
G3 X128.657 Y133.896 I-2.343 J2.966 E.05627
G3 X128.398 Y135.207 I-1.623 J.36 E.04559
G2 X127.343 Y136.517 I2.343 J2.966 E.05627
G2 X127.602 Y137.827 I1.623 J.36 E.04559
G3 X128.657 Y139.138 I-2.342 J2.965 E.05627
G1 X128.662 Y139.812 E.02237
G1 X131.125 Y139.488 E.0824
G2 X131.019 Y139.138 I-.704 J.022 E.01227
G3 X129.964 Y137.827 I2.343 J-2.966 E.05627
G3 X130.337 Y136.397 I1.945 J-.256 E.05028
G1 X130.125 Y134.783 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X130.337 Y136.397 E-.61876
G1 X130.223 Y136.517 E-.06307
G1 X130.144 Y136.707 E-.07816
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/73
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z2.8 I1.215 J-.076 P1  F42000
G1 X129.708 Y129.706 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5629
M204 S6000
G1 X130.197 Y129.77 E.01635
G1 X131.515 Y139.788 E.33516
G1 X125.982 Y140.517 E.18516
G1 X124.467 Y129.016 E.38478
G1 X129.648 Y129.698 E.17334
M204 S10000
G1 X129.761 Y129.302 F42000
G1 F5629
M204 S6000
G1 X130.15 Y129.354 E.01301
G1 X130.244 Y128.638 E.02395
G1 X130.458 Y128.638 E.0071
G1 X131.972 Y140.138 E.38478
G1 X125.631 Y140.973 E.21216
G1 X124.083 Y129.217 E.39334
G3 X124.021 Y128.547 I7.643 J-1.044 E.02233
G1 X129.701 Y129.295 E.19004
M204 S250
G1 X129.812 Y128.914 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5629
M204 S5000
G1 X124.339 Y128.193 E.16961
G1 X124.401 Y127.726 E.01449
G1 X124.499 Y126.984 E.023
G1 X129.971 Y127.704 E.16961
G1 X129.82 Y128.854 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.834 Y128.615 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.065 Y121.315 Z3 F42000
G1 X131.378 Y117.016 Z3
G1 Z2.6
G1 E.8 F1800
G1 F5629
M204 S5000
G1 X125.906 Y116.296 E.16961
G1 X125.967 Y115.828 E.01449
G1 X126.065 Y115.086 E.023
G1 X131.538 Y115.807 E.16961
G1 X131.386 Y116.957 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.401 Y116.717 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I-.979 J.722 P1  F42000
G1 X129.978 Y117.501 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5629
M204 S6000
G1 X130.367 Y117.552 E.01301
G1 X129.133 Y126.925 E.31361
G1 X125.51 Y126.448 E.12121
G1 X126.607 Y118.116 E.27877
G1 X126.744 Y117.075 E.03484
G1 X129.919 Y117.493 E.10622
M204 S250
G1 X129.927 Y117.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5629
M204 S5000
G1 X128.795 Y126.485 E.2664
G1 X125.95 Y126.111 E.08819
G1 X126.996 Y118.168 E.24618
G1 X127.082 Y117.515 E.02023
G1 X129.868 Y117.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.62 Y119.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I.722 J-.98 P1  F42000
G1 X126.289 Y117.41 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5629
M204 S6000
G1 X125.124 Y126.26 E.29609
G1 X124.572 Y126.187 E.01847
G1 X125.771 Y117.084 E.30457
G1 X126.323 Y117.157 E.01847
G1 X126.297 Y117.351 E.0065
; WIPE_START
G1 F8843.478
G1 X126.036 Y119.334 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I.34 J1.168 P1  F42000
G1 X131.274 Y117.809 Z3
G1 Z2.6
G1 E.8 F1800
G1 F5629
M204 S6000
G1 X131.305 Y117.813 E.00102
G1 X130.106 Y126.916 E.30457
G1 X129.554 Y126.843 E.01847
G1 X130.753 Y117.74 E.30457
G1 X131.215 Y117.801 E.01545
M204 S10000
G1 X131.327 Y117.405 F42000
G1 F5629
M204 S6000
G1 X131.761 Y117.462 E.01453
G1 X130.457 Y127.373 E.33158
G1 X124.116 Y126.538 E.21216
G1 X125.42 Y116.627 E.33158
G1 X131.268 Y117.397 E.19564
; WIPE_START
G1 F8843.478
G1 X131.761 Y117.462 E-.18922
G1 X131.565 Y118.951 E-.57078
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.913 Y126.556 Z3 F42000
G1 X130.796 Y127.919 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5629
M204 S5000
G1 X130.796 Y127.998 E.00242
G2 X130.812 Y128.32 I3.337 J.003 E.00991
G1 X132.386 Y140.28 E.37067
G3 X132.228 Y140.5 I-.192 J.028 E.00921
G1 X125.489 Y141.387 E.20884
G3 X125.268 Y141.217 I-.028 J-.193 E.00959
G1 X123.694 Y129.264 E.37044
G3 X123.694 Y126.736 I10.794 J-1.264 E.07786
G1 X125.267 Y114.785 E.37038
G3 X125.489 Y114.613 I.194 J.02 E.00965
G1 X132.23 Y115.501 E.20893
G3 X132.386 Y115.722 I-.038 J.192 E.00919
G1 X130.812 Y127.678 E.37053
G1 X130.8 Y127.859 E.00558
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.796 Y127.998 E-.05269
G1 X130.812 Y128.32 E-.12256
G1 X131.013 Y129.846 E-.58475
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3 F4000
            G39.3 S1
            G0 Z3 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X129.857 Y126.678 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192586
G1 F5629
M204 S6000
G1 X131.002 Y117.978 E.10701
; WIPE_START
G1 F15000
G1 X130.741 Y119.961 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.764 Y117.265 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F5629
M204 S6000
G1 X131.975 Y115.665 E.0576
; WIPE_START
G1 F8220.316
G1 X131.764 Y117.265 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I-.012 J-1.217 P1  F42000
G1 X126.02 Y117.322 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.192587
G1 F5629
M204 S6000
G1 X124.875 Y126.022 E.10701
; WIPE_START
G1 F15000
G1 X125.136 Y124.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.113 Y126.735 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.466963
G1 F5629
M204 S6000
G2 X124.017 Y127.596 I18.557 J2.494 E.02993
; LINE_WIDTH: 0.423327
G1 X123.986 Y128 E.01256
; LINE_WIDTH: 0.387797
G1 X123.968 Y128.342 E.00962
; WIPE_START
G1 F10438.528
G1 X123.986 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.721 Y129.657 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.41125
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X126.599 Y129.67 E.10165
G1 X129.867 Y130.1 E.17841
G1 X129.874 Y130.153 E.00288
G1 X124.986 Y130.12 E.26457
G1 X125.047 Y130.582 E.0252
G1 X129.935 Y130.614 E.26457
M73 P44 R10
G1 X129.996 Y131.076 E.0252
G1 X125.107 Y131.043 E.26457
G1 X125.168 Y131.505 E.0252
G1 X130.056 Y131.538 E.26457
G1 X130.117 Y131.999 E.0252
G1 X125.229 Y131.967 E.26457
G1 X125.29 Y132.428 E.0252
G1 X130.178 Y132.461 E.26457
G1 X130.239 Y132.923 E.0252
G1 X125.35 Y132.89 E.26457
G1 X125.411 Y133.352 E.0252
G1 X130.3 Y133.384 E.26457
G1 X130.36 Y133.846 E.0252
G1 X125.472 Y133.813 E.26457
G1 X125.481 Y133.879 E.00357
G1 X125.674 Y134.013 E.01273
G1 X125.768 Y134.277 E.01517
G1 X130.421 Y134.308 E.25181
G1 X130.482 Y134.769 E.0252
G1 X125.87 Y134.739 E.24958
G1 X125.862 Y135.169 E.0233
G1 X125.823 Y135.2 E.00268
G1 X130.543 Y135.231 E.25545
G1 X130.603 Y135.693 E.0252
G1 X125.715 Y135.66 E.26457
G1 X125.776 Y136.122 E.0252
G1 X130.664 Y136.154 E.26457
G1 X130.725 Y136.616 E.0252
G1 X125.837 Y136.583 E.26457
G1 X125.897 Y137.045 E.0252
G1 X130.786 Y137.078 E.26457
G1 X130.847 Y137.539 E.0252
G1 X125.958 Y137.507 E.26457
G1 X126.019 Y137.968 E.0252
G1 X130.566 Y137.999 E.24608
G1 X130.505 Y138.028 E.00364
G1 X128.791 Y138.448 E.09549
G1 X125.875 Y138.429 E.15783
M106 S201.45
M204 S10000
G1 X130.876 Y139.47 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.432323
; LAYER_HEIGHT: 0.2
G1 F5629
M204 S6000
G1 X131.069 Y139.445 E.00618
G1 X131.015 Y139.04 E.01296
G1 X130.825 Y139.084 E.00621
G1 X126.33 Y139.676 E.14385
G1 X126.271 Y139.665 E.00192
G1 X126.324 Y140.07 E.01296
G1 X130.816 Y139.478 E.14376
; WIPE_START
G1 F9244.93
G1 X128.833 Y139.739 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.743 Y132.185 Z3 F42000
G1 X125.469 Y116.436 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.480845
G1 F5629
M204 S6000
G1 X125.679 Y114.835 E.05761
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.599
G1 X125.469 Y116.436 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/73
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z3 I-1.159 J.37 P1  F42000
G1 X129.708 Y129.706 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4865
M204 S6000
G1 X130.197 Y129.77 E.01635
G1 X131.515 Y139.788 E.33516
G1 X125.982 Y140.517 E.18516
G1 X124.467 Y129.016 E.38478
G1 X129.648 Y129.698 E.17334
M204 S10000
G1 X130.201 Y128.965 F42000
G1 F4865
M204 S6000
G1 X130.244 Y128.638 E.01095
G1 X130.458 Y128.638 E.0071
G1 X131.972 Y140.138 E.38478
G1 X125.631 Y140.973 E.21216
G1 X124.083 Y129.217 E.39334
G3 X124.021 Y128.547 I7.646 J-1.044 E.02233
G1 X130.15 Y129.354 E.20504
G1 X130.193 Y129.024 E.01102
M204 S250
G1 X129.812 Y128.914 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4865
M204 S5000
G1 X124.339 Y128.193 E.16961
G1 X124.405 Y127.695 E.01543
G1 X124.499 Y126.984 E.02205
G1 X129.971 Y127.704 E.16961
G1 X129.82 Y128.854 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.834 Y128.615 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.065 Y121.315 Z3.2 F42000
G1 X131.378 Y117.016 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F4865
M204 S5000
G1 X125.906 Y116.296 E.16961
G1 X125.971 Y115.798 E.01543
G1 X126.065 Y115.086 E.02205
G1 X131.538 Y115.807 E.16961
G1 X131.386 Y116.957 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.401 Y116.717 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.978 Y117.501 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4865
M204 S6000
G1 X130.367 Y117.552 E.01301
G1 X129.133 Y126.925 E.31361
G1 X125.51 Y126.448 E.12121
G1 X126.584 Y118.294 E.27282
G1 X126.744 Y117.075 E.04079
G1 X129.919 Y117.493 E.10622
M204 S250
G1 X129.927 Y117.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4865
M204 S5000
G1 X128.795 Y126.485 E.2664
G1 X125.95 Y126.111 E.08819
G1 X126.972 Y118.345 E.24066
G1 X127.082 Y117.515 E.02574
G1 X129.868 Y117.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.62 Y119.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.289 Y117.41 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4865
M204 S6000
G1 X125.124 Y126.26 E.29609
G1 X124.572 Y126.187 E.01847
G1 X125.771 Y117.084 E.30457
G1 X126.323 Y117.157 E.01847
G1 X126.297 Y117.351 E.0065
; WIPE_START
G1 F8843.478
G1 X126.036 Y119.334 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.274 Y117.809 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F4865
M204 S6000
G1 X131.305 Y117.813 E.00102
G1 X130.106 Y126.916 E.30457
G1 X129.554 Y126.843 E.01847
G1 X130.753 Y117.74 E.30457
G1 X131.215 Y117.801 E.01545
M204 S10000
G1 X131.327 Y117.405 F42000
G1 F4865
M204 S6000
G1 X131.761 Y117.462 E.01453
G1 X130.457 Y127.373 E.33158
G1 X124.116 Y126.538 E.21216
G1 X125.42 Y116.627 E.33158
G1 X131.268 Y117.397 E.19565
; WIPE_START
G1 F8843.478
G1 X131.761 Y117.462 E-.18922
G1 X131.565 Y118.951 E-.57078
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.913 Y126.556 Z3.2 F42000
G1 X130.795 Y127.934 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4865
M204 S5000
G1 X130.797 Y127.999 E.00199
G2 X130.812 Y128.32 I3.392 J.002 E.00989
G1 X132.386 Y140.28 E.37066
G3 X132.23 Y140.499 I-.19 J.03 E.00918
G1 X125.489 Y141.387 E.20891
G3 X125.268 Y141.216 I-.028 J-.193 E.0096
G1 X123.694 Y129.264 E.37043
G3 X123.694 Y126.736 I10.795 J-1.264 E.07786
G1 X125.268 Y114.783 E.37046
G3 X125.489 Y114.613 I.192 J.021 E.0096
G1 X132.23 Y115.501 E.20893
G3 X132.386 Y115.722 I-.038 J.193 E.00919
G1 X130.812 Y127.679 E.37055
G1 X130.799 Y127.874 E.00602
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.797 Y127.999 E-.04735
G1 X130.812 Y128.32 E-.1223
G1 X131.015 Y129.86 E-.59034
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.2
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.2 F4000
            G39.3 S1
            G0 Z3.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X130.087 Y131.945 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F4865
M204 S6000
G1 X129.847 Y130.12 E.05656
G1 X124.923 Y129.471 E.15261
G1 X126.319 Y140.077 E.32867
G1 X131.076 Y139.45 E.14741
G1 X130.095 Y132.004 E.23076
M204 S10000
G1 X129.714 Y131.994 F42000
G1 F4865
M204 S6000
G1 X129.511 Y130.456 E.04767
G1 X125.361 Y129.909 E.12863
G1 X126.644 Y139.654 E.30198
G1 X130.653 Y139.125 E.12424
G1 X129.721 Y132.053 E.21917
M204 S10000
G1 X129.34 Y132.043 F42000
G1 F4865
M204 S6000
G1 X129.175 Y130.792 E.03878
G1 X125.799 Y130.347 E.10464
G1 X126.968 Y139.23 E.2753
G1 X130.229 Y138.801 E.10107
G1 X129.348 Y132.103 E.20759
M204 S10000
G1 X128.966 Y132.092 F42000
G1 F4865
M204 S6000
G1 X128.839 Y131.128 E.02989
G1 X126.237 Y130.785 E.08065
G1 X127.293 Y138.807 E.24861
G1 X129.806 Y138.476 E.0779
G1 X128.974 Y132.152 E.196
M204 S10000
G1 X128.592 Y132.142 F42000
G1 F4865
M204 S6000
G1 X128.503 Y131.464 E.021
G1 X126.675 Y131.223 E.05666
G1 X127.618 Y138.384 E.22193
G1 X129.383 Y138.152 E.05473
G1 X128.6 Y132.201 E.18442
M204 S10000
G1 X128.218 Y132.191 F42000
G1 F4865
M204 S6000
G1 X128.167 Y131.8 E.01211
G1 X127.113 Y131.661 E.03267
G1 X127.942 Y137.961 E.19524
G1 X128.96 Y137.827 E.03155
G1 X128.226 Y132.25 E.17283
M204 S10000
G1 X127.87 Y132.237 F42000
; LINE_WIDTH: 0.36784
G1 F4865
M204 S6000
G1 X127.854 Y132.113 E.0033
G1 X127.52 Y132.069 E.00891
M73 P45 R10
G1 X128.244 Y137.567 E.14683
G1 X128.566 Y137.525 E.0086
G1 X127.878 Y132.296 E.13964
; WIPE_START
G1 F11079.65
G1 X128.139 Y134.279 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.968 Y128.342 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.387803
G1 F4865
M204 S6000
G1 X123.986 Y128 E.00962
; LINE_WIDTH: 0.423333
G1 X124.017 Y127.596 E.01257
; LINE_WIDTH: 0.466969
G3 X124.113 Y126.735 I18.675 J1.636 E.02993
; WIPE_START
G1 F8489.598
G1 X124.017 Y127.596 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.875 Y126.022 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.192595
G1 F4865
M204 S6000
G1 X126.02 Y117.322 E.10702
; WIPE_START
G1 F15000
G1 X125.759 Y119.305 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.469 Y116.436 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.480863
G1 F4865
M204 S6000
G1 X125.679 Y114.835 E.05761
M204 S10000
G1 X131.975 Y115.665 F42000
; LINE_WIDTH: 0.48086
G1 F4865
M204 S6000
G1 X131.764 Y117.265 E.0576
; WIPE_START
G1 F8220.316
G1 X131.975 Y115.665 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.002 Y117.978 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.192586
G1 F4865
M204 S6000
G1 X129.857 Y126.678 E.10701
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X130.118 Y124.695 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/73
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z3.2 I-1.213 J-.099 P1  F42000
G1 X129.708 Y129.706 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4841
M204 S6000
G1 X130.197 Y129.77 E.01635
G1 X131.515 Y139.788 E.33516
G1 X125.982 Y140.517 E.18516
G1 X124.467 Y129.016 E.38478
G1 X129.648 Y129.698 E.17334
M204 S10000
G1 X129.761 Y129.302 F42000
G1 F4841
M204 S6000
G1 X130.15 Y129.354 E.01301
G1 X130.244 Y128.638 E.02395
G1 X130.458 Y128.638 E.0071
G1 X131.972 Y140.138 E.38477
G1 X125.631 Y140.973 E.21216
G1 X124.083 Y129.217 E.39334
G3 X124.021 Y128.547 I7.646 J-1.044 E.02233
G1 X129.701 Y129.295 E.19004
M204 S250
G1 X129.812 Y128.914 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4841
M204 S5000
G1 X124.339 Y128.193 E.16961
G1 X124.409 Y127.665 E.01638
G1 X124.499 Y126.984 E.02111
G1 X129.971 Y127.704 E.16961
G1 X129.82 Y128.854 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.834 Y128.615 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.065 Y121.315 Z3.4 F42000
G1 X131.378 Y117.016 Z3.4
G1 Z3
G1 E.8 F1800
G1 F4841
M204 S5000
G1 X125.906 Y116.296 E.16961
G1 X125.975 Y115.767 E.01638
G1 X126.065 Y115.086 E.02111
G1 X131.538 Y115.807 E.16961
G1 X131.386 Y116.957 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.401 Y116.717 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.978 Y117.501 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4841
M204 S6000
G1 X130.367 Y117.552 E.01301
G1 X129.133 Y126.925 E.31361
G1 X125.51 Y126.448 E.12121
G1 X126.56 Y118.472 E.26687
G1 X126.744 Y117.075 E.04674
G1 X129.919 Y117.493 E.10622
M204 S250
G1 X129.927 Y117.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4841
M204 S5000
G1 X128.795 Y126.485 E.2664
G1 X125.95 Y126.111 E.08819
G1 X126.949 Y118.523 E.23515
G1 X127.082 Y117.515 E.03125
G1 X129.868 Y117.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.62 Y119.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.289 Y117.41 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4841
M204 S6000
G1 X125.124 Y126.26 E.29609
G1 X124.572 Y126.187 E.01847
G1 X125.771 Y117.084 E.30457
G1 X126.323 Y117.157 E.01847
G1 X126.297 Y117.351 E.0065
; WIPE_START
G1 F8843.478
G1 X126.036 Y119.334 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.274 Y117.809 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F4841
M204 S6000
G1 X131.305 Y117.813 E.00102
G1 X130.106 Y126.916 E.30457
G1 X129.554 Y126.843 E.01847
G1 X130.753 Y117.74 E.30457
G1 X131.215 Y117.801 E.01545
M204 S10000
G1 X131.327 Y117.405 F42000
G1 F4841
M204 S6000
G1 X131.761 Y117.462 E.01453
G1 X130.457 Y127.373 E.33158
G1 X124.116 Y126.538 E.21216
G1 X125.42 Y116.627 E.33158
G1 X131.268 Y117.397 E.19564
; WIPE_START
G1 F8843.478
G1 X131.761 Y117.462 E-.18922
G1 X131.565 Y118.951 E-.57078
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.914 Y126.556 Z3.4 F42000
G1 X130.794 Y127.949 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4841
M204 S5000
G1 X130.793 Y128 E.00157
G2 X130.812 Y128.32 I2.806 J0 E.00985
G1 X132.386 Y140.28 E.37067
G3 X132.228 Y140.5 I-.19 J.03 E.00924
G1 X125.489 Y141.387 E.20884
G3 X125.268 Y141.217 I-.028 J-.192 E.0096
G1 X123.694 Y129.264 E.37044
G3 X123.694 Y126.736 I10.795 J-1.264 E.07786
G1 X125.268 Y114.784 E.37043
G3 X125.489 Y114.613 I.192 J.02 E.00962
G1 X132.23 Y115.501 E.20893
G3 X132.386 Y115.723 I-.038 J.192 E.00919
G1 X130.812 Y127.68 E.37059
G1 X130.798 Y127.889 E.00643
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.793 Y128 E-.04225
G1 X130.812 Y128.32 E-.12177
G1 X131.016 Y129.875 E-.59598
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.4
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.4 F4000
            G39.3 S1
            G0 Z3.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X129.857 Y126.678 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192586
G1 F4841
M204 S6000
G1 X131.002 Y117.978 E.10701
; WIPE_START
G1 F15000
G1 X130.741 Y119.961 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.764 Y117.265 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.480857
G1 F4841
M204 S6000
G1 X131.975 Y115.665 E.05759
M204 S10000
G1 X125.679 Y114.835 F42000
; LINE_WIDTH: 0.480847
G1 F4841
M204 S6000
G1 X125.469 Y116.436 E.05761
; WIPE_START
G1 F8220.551
G1 X125.679 Y114.835 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.02 Y117.322 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.192585
G1 F4841
M204 S6000
G1 X124.875 Y126.022 E.10701
; WIPE_START
G1 F15000
G1 X125.136 Y124.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.113 Y126.735 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.466961
G1 F4841
M204 S6000
G2 X124.017 Y127.596 I18.593 J2.498 E.02993
; LINE_WIDTH: 0.423324
G1 X123.986 Y128 E.01256
; LINE_WIDTH: 0.38779
G1 X123.968 Y128.342 E.00962
; WIPE_START
G1 F10438.732
G1 X123.986 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.675 Y131.223 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F4841
M204 S6000
G1 X127.618 Y138.384 E.22193
G1 X129.383 Y138.152 E.05473
G1 X128.503 Y131.464 E.20726
G1 X126.734 Y131.231 E.05481
M204 S10000
G1 X127.113 Y131.661 F42000
G1 F4841
M204 S6000
G1 X127.942 Y137.961 E.19524
G1 X128.96 Y137.827 E.03155
G1 X128.167 Y131.8 E.18678
G1 X127.172 Y131.669 E.03082
M204 S10000
G1 X127.52 Y132.069 F42000
; LINE_WIDTH: 0.367845
G1 F4841
M204 S6000
G1 X128.244 Y137.567 E.14683
G1 X128.566 Y137.525 E.0086
G1 X127.854 Y132.113 E.14453
G1 X127.58 Y132.077 E.00732
M204 S10000
G1 X128.839 Y131.128 F42000
; LINE_WIDTH: 0.41999
G1 F4841
M204 S6000
G1 X126.237 Y130.785 E.08065
G1 X127.293 Y138.807 E.24861
M73 P46 R10
G1 X129.806 Y138.476 E.0779
G1 X128.847 Y131.187 E.22589
M204 S10000
G1 X129.175 Y130.792 F42000
G1 F4841
M204 S6000
G1 X125.799 Y130.347 E.10464
G1 X126.968 Y139.23 E.2753
G1 X130.229 Y138.801 E.10107
G1 X129.183 Y130.851 E.24637
M204 S10000
G1 X129.511 Y130.456 F42000
G1 F4841
M204 S6000
G1 X125.361 Y129.909 E.12862
G1 X126.644 Y139.654 E.30198
G1 X130.653 Y139.125 E.12424
G1 X129.519 Y130.515 E.26684
M204 S10000
G1 X129.847 Y130.12 F42000
G1 F4841
M204 S6000
G1 X124.923 Y129.471 E.15261
G1 X126.319 Y140.077 E.32867
G1 X131.076 Y139.45 E.14741
G1 X129.855 Y130.179 E.28732
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X130.116 Y132.162 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/73
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z3.4 I1.2 J-.2 P1  F42000
G1 X129.708 Y129.706 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4842
M204 S6000
G1 X130.197 Y129.77 E.01636
G1 X131.515 Y139.788 E.33516
G1 X125.982 Y140.517 E.18516
G1 X124.467 Y129.016 E.38478
G1 X129.648 Y129.698 E.17334
M204 S10000
G1 X130.201 Y128.965 F42000
G1 F4842
M204 S6000
G1 X130.244 Y128.638 E.01095
G1 X130.458 Y128.638 E.0071
G1 X131.972 Y140.138 E.38478
G1 X125.631 Y140.973 E.21216
G1 X124.083 Y129.217 E.39334
G3 X124.021 Y128.547 I7.643 J-1.044 E.02233
G1 X130.15 Y129.354 E.20504
G1 X130.193 Y129.024 E.01102
M204 S250
G1 X129.812 Y128.914 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4842
M204 S5000
G1 X124.339 Y128.193 E.16961
G1 X124.413 Y127.634 E.01733
G1 X124.499 Y126.984 E.02016
G1 X129.971 Y127.704 E.16961
G1 X129.82 Y128.854 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.834 Y128.615 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.065 Y121.315 Z3.6 F42000
G1 X131.378 Y117.016 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F4842
M204 S5000
G1 X125.906 Y116.296 E.16961
G1 X125.979 Y115.737 E.01733
G1 X126.065 Y115.086 E.02016
G1 X131.538 Y115.807 E.16961
G1 X131.386 Y116.957 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.401 Y116.717 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.978 Y117.501 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4842
M204 S6000
G1 X130.367 Y117.552 E.01301
G1 X129.133 Y126.925 E.31361
G1 X125.51 Y126.448 E.12121
G1 X126.537 Y118.65 E.26092
G1 X126.744 Y117.075 E.05269
G1 X129.919 Y117.493 E.10622
M204 S250
G1 X129.927 Y117.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4842
M204 S5000
G1 X128.795 Y126.485 E.2664
G1 X125.95 Y126.111 E.08819
G1 X126.926 Y118.701 E.22964
G1 X127.082 Y117.515 E.03676
G1 X129.868 Y117.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.62 Y119.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.289 Y117.41 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4842
M204 S6000
G1 X125.124 Y126.26 E.29609
G1 X124.572 Y126.187 E.01847
G1 X125.771 Y117.084 E.30457
G1 X126.323 Y117.157 E.01847
G1 X126.297 Y117.351 E.0065
; WIPE_START
G1 F8843.478
G1 X126.036 Y119.334 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.274 Y117.809 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
G1 F4842
M204 S6000
G1 X131.305 Y117.813 E.00102
G1 X130.106 Y126.916 E.30457
G1 X129.554 Y126.843 E.01847
G1 X130.753 Y117.74 E.30457
G1 X131.215 Y117.801 E.01545
M204 S10000
G1 X131.327 Y117.405 F42000
G1 F4842
M204 S6000
G1 X131.761 Y117.462 E.01453
G1 X130.457 Y127.373 E.33158
G1 X124.116 Y126.538 E.21216
G1 X125.42 Y116.627 E.33158
G1 X131.268 Y117.397 E.19565
; WIPE_START
G1 F8843.478
G1 X131.761 Y117.462 E-.18922
G1 X131.565 Y118.951 E-.57079
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.914 Y126.556 Z3.6 F42000
G1 X130.793 Y127.964 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4842
M204 S5000
G1 X130.797 Y127.998 E.00108
G2 X130.812 Y128.32 I3.525 J.002 E.0099
G1 X132.386 Y140.28 E.37066
G3 X132.23 Y140.5 I-.192 J.029 E.00916
G1 X125.49 Y141.387 E.20889
G3 X125.268 Y141.217 I-.028 J-.193 E.00959
G1 X123.694 Y129.264 E.37046
G3 X123.694 Y126.736 I10.794 J-1.264 E.07786
G1 X125.267 Y114.786 E.37037
G3 X125.489 Y114.613 I.194 J.02 E.00965
G1 X132.23 Y115.501 E.20893
G3 X132.386 Y115.723 I-.038 J.192 E.0092
G1 X130.812 Y127.678 E.37052
G1 X130.797 Y127.904 E.00696
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.797 Y127.998 E-.03597
G1 X130.812 Y128.32 E-.12235
G1 X131.018 Y129.89 E-.60168
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.6
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.6 F4000
            G39.3 S1
            G0 Z3.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X129.857 Y126.678 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192577
G1 F4842
M204 S6000
G1 X131.002 Y117.978 E.10701
; WIPE_START
G1 F15000
G1 X130.741 Y119.961 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.764 Y117.265 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.480857
G1 F4842
M204 S6000
G1 X131.975 Y115.665 E.0576
M204 S10000
G1 X125.679 Y114.835 F42000
; LINE_WIDTH: 0.480845
G1 F4842
M204 S6000
G1 X125.469 Y116.436 E.05761
; WIPE_START
G1 F8220.599
G1 X125.679 Y114.835 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.02 Y117.322 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.192587
G1 F4842
M204 S6000
G1 X124.875 Y126.022 E.10701
; WIPE_START
G1 F15000
G1 X125.136 Y124.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.113 Y126.735 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.46697
G1 F4842
M204 S6000
G2 X124.017 Y127.596 I18.539 J2.492 E.02993
; LINE_WIDTH: 0.423324
G1 X123.986 Y128 E.01256
; LINE_WIDTH: 0.387814
G1 X123.968 Y128.342 E.00962
; WIPE_START
G1 F10437.991
G1 X123.986 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.675 Y131.223 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F4842
M204 S6000
G1 X127.618 Y138.384 E.22192
G1 X129.383 Y138.152 E.05473
G1 X128.503 Y131.464 E.20726
G1 X126.734 Y131.231 E.05481
M204 S10000
G1 X127.113 Y131.661 F42000
G1 F4842
M204 S6000
G1 X127.942 Y137.961 E.19524
G1 X128.96 Y137.827 E.03155
G1 X128.167 Y131.8 E.18678
G1 X127.172 Y131.669 E.03082
M204 S10000
G1 X127.52 Y132.069 F42000
; LINE_WIDTH: 0.367845
G1 F4842
M204 S6000
G1 X128.244 Y137.567 E.14683
G1 X128.566 Y137.525 E.0086
G1 X127.854 Y132.113 E.14453
G1 X127.58 Y132.077 E.00732
M204 S10000
G1 X128.839 Y131.128 F42000
; LINE_WIDTH: 0.41999
G1 F4842
M204 S6000
G1 X126.237 Y130.785 E.08065
G1 X127.293 Y138.807 E.24861
G1 X129.806 Y138.476 E.0779
G1 X128.847 Y131.188 E.22589
M204 S10000
G1 X129.175 Y130.792 F42000
G1 F4842
M204 S6000
G1 X125.799 Y130.347 E.10464
G1 X126.968 Y139.23 E.2753
G1 X130.229 Y138.801 E.10107
G1 X129.183 Y130.851 E.24636
M204 S10000
G1 X129.511 Y130.456 F42000
G1 F4842
M204 S6000
G1 X125.361 Y129.909 E.12863
G1 X126.644 Y139.654 E.30198
G1 X130.653 Y139.125 E.12424
G1 X129.519 Y130.515 E.26684
M204 S10000
G1 X129.847 Y130.12 F42000
G1 F4842
M204 S6000
G1 X124.923 Y129.471 E.15261
G1 X126.319 Y140.077 E.32867
G1 X131.076 Y139.45 E.14741
G1 X129.855 Y130.179 E.28732
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X130.116 Y132.162 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/73
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z3.6 I-1.203 J.186 P1  F42000
G1 X131.244 Y139.469 Z3.6
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5289
M204 S6000
G1 X131.47 Y139.44 E.00756
G1 X131.515 Y139.788 E.01164
G1 X125.982 Y140.517 E.18516
G1 X125.936 Y140.168 E.01165
G1 X131.184 Y139.477 E.1756
; WIPE_START
G1 F8843.478
G1 X131.47 Y139.44 E-.10943
G1 X131.515 Y139.788 E-.13332
G1 X130.166 Y139.965 E-.51724
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.19 Y132.333 Z3.8 F42000
G1 X130.201 Y128.965 Z3.8
G1 Z3.4
G1 E.8 F1800
M73 P47 R10
G1 F5289
M204 S6000
G1 X130.244 Y128.638 E.01095
G1 X130.458 Y128.638 E.0071
G1 X131.972 Y140.138 E.38478
G1 X125.631 Y140.973 E.21216
G1 X124.083 Y129.217 E.39334
G3 X124.021 Y128.547 I7.646 J-1.044 E.02233
G1 X125.012 Y128.677 E.03313
G1 X125.012 Y128.891 E.0071
G1 X124.702 Y128.932 E.01034
G1 X126.124 Y139.733 E.36137
G1 X131.175 Y139.068 E.16898
G1 X129.891 Y129.32 E.32616
G1 X130.15 Y129.354 E.00864
G1 X130.193 Y129.024 E.01102
M204 S250
G1 X129.812 Y128.914 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5289
M204 S5000
G1 X124.339 Y128.193 E.16961
G1 X124.417 Y127.604 E.01827
G1 X124.499 Y126.984 E.01922
G1 X129.971 Y127.704 E.16961
G1 X129.82 Y128.854 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.834 Y128.615 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.065 Y121.315 Z3.8 F42000
G1 X131.378 Y117.016 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F5289
M204 S5000
G1 X125.906 Y116.296 E.16961
G1 X125.983 Y115.706 E.01827
G1 X126.065 Y115.086 E.01922
G1 X131.538 Y115.807 E.16961
G1 X131.386 Y116.957 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.401 Y116.717 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.978 Y117.501 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5289
M204 S6000
G1 X130.367 Y117.552 E.01301
G1 X129.133 Y126.925 E.31361
G1 X125.51 Y126.448 E.12121
G1 X126.513 Y118.828 E.25497
G1 X126.744 Y117.075 E.05864
G1 X129.919 Y117.493 E.10622
M204 S250
G1 X129.927 Y117.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5289
M204 S5000
G1 X128.795 Y126.485 E.2664
G1 X125.95 Y126.111 E.08819
G1 X126.902 Y118.879 E.22413
G1 X127.082 Y117.515 E.04227
G1 X129.868 Y117.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.62 Y119.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.289 Y117.41 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5289
M204 S6000
G1 X125.124 Y126.26 E.29609
G1 X124.572 Y126.187 E.01847
G1 X125.771 Y117.084 E.30457
G1 X126.323 Y117.157 E.01847
G1 X126.297 Y117.351 E.0065
; WIPE_START
G1 F8843.478
G1 X126.036 Y119.334 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.274 Y117.809 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F5289
M204 S6000
G1 X131.305 Y117.813 E.00102
G1 X130.106 Y126.916 E.30457
G1 X129.554 Y126.843 E.01847
G1 X130.753 Y117.74 E.30457
G1 X131.215 Y117.801 E.01545
M204 S10000
G1 X131.327 Y117.405 F42000
G1 F5289
M204 S6000
G1 X131.761 Y117.462 E.01453
G1 X130.457 Y127.373 E.33158
G1 X124.116 Y126.538 E.21216
G1 X125.42 Y116.627 E.33158
G1 X131.268 Y117.397 E.19564
; WIPE_START
G1 F8843.478
G1 X131.761 Y117.462 E-.18922
G1 X131.565 Y118.951 E-.57078
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.914 Y126.556 Z3.8 F42000
G1 X130.792 Y127.979 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5289
M204 S5000
G1 X130.793 Y128 E.00066
G2 X130.812 Y128.32 I2.802 J0 E.00985
G1 X132.386 Y140.28 E.37067
G3 X132.23 Y140.5 I-.19 J.03 E.00918
G1 X125.49 Y141.387 E.20889
G3 X125.268 Y141.217 I-.03 J-.19 E.00962
G1 X123.694 Y129.264 E.37045
G3 X123.694 Y126.736 I10.795 J-1.264 E.07786
G1 X125.267 Y114.785 E.37037
G3 X125.489 Y114.613 I.192 J.018 E.00969
G1 X132.23 Y115.501 E.20892
G3 X132.386 Y115.723 I-.038 J.192 E.00919
G1 X130.812 Y127.68 E.37059
G1 X130.796 Y127.919 E.00735
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.793 Y128 E-.03089
G1 X130.812 Y128.32 E-.12175
G1 X131.02 Y129.905 E-.60736
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.8
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.8 F4000
            G39.3 S1
            G0 Z3.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X130.253 Y129.572 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.28679
G1 F5289
M204 S6000
G1 X131.524 Y139.227 E.19352
; WIPE_START
G1 F14761.99
G1 X131.263 Y137.244 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.515 Y129.616 Z3.8 F42000
G1 X131.975 Y115.665 Z3.8
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.480855
G1 F5289
M204 S6000
G1 X131.764 Y117.265 E.05759
; WIPE_START
G1 F8220.402
G1 X131.975 Y115.665 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.002 Y117.978 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.192586
G1 F5289
M204 S6000
G1 X129.857 Y126.678 E.10701
; WIPE_START
G1 F15000
G1 X130.118 Y124.695 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.208 Y128.784 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.508088
G1 F5289
M204 S6000
G1 X125.423 Y128.784 E.00817
; LINE_WIDTH: 0.459715
G1 X125.639 Y128.784 E.00732
; LINE_WIDTH: 0.411343
G1 X125.854 Y128.784 E.00647
; LINE_WIDTH: 0.362971
G1 X126.07 Y128.784 E.00562
; LINE_WIDTH: 0.314599
G1 X126.285 Y128.784 E.00477
; LINE_WIDTH: 0.266227
G1 X126.501 Y128.784 E.00392
; LINE_WIDTH: 0.217854
G1 X126.716 Y128.784 E.00307
; LINE_WIDTH: 0.169482
G1 X126.932 Y128.784 E.00222
; LINE_WIDTH: 0.12111
G1 X127.147 Y128.784 E.00137
M204 S10000
G1 X128.711 Y128.978 F42000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5289
M204 S2000
G1 X129.76 Y130.027 E.04558
G1 X129.841 Y130.641
G1 X128.097 Y128.897 E.07578
G1 X127.483 Y128.816
G1 X129.922 Y131.255 E.10597
G1 X130.003 Y131.869
G1 X126.989 Y128.855 E.13096
G1 X126.518 Y128.917
G1 X130.083 Y132.483 E.15495
G1 X130.164 Y133.097
G1 X126.046 Y128.979 E.17894
G1 X125.575 Y129.042
G1 X130.245 Y133.711 E.20293
G1 X130.326 Y134.326
G1 X125.104 Y129.104 E.22692
G1 X125.007 Y129.54
G1 X130.407 Y134.94 E.23466
G1 X130.488 Y135.554
G1 X125.088 Y130.154 E.23466
G1 X125.168 Y130.768
G1 X130.569 Y136.168 E.23466
G1 X130.649 Y136.782
G1 X125.249 Y131.382 E.23466
G1 X125.33 Y131.996
G1 X130.73 Y137.396 E.23466
G1 X130.811 Y138.01
G1 X125.411 Y132.61 E.23466
G1 X125.492 Y133.224
G1 X130.892 Y138.624 E.23466
G1 X130.647 Y138.913
G1 X125.573 Y133.838 E.22052
G1 X125.654 Y134.452
G1 X130.176 Y138.975 E.19653
G1 X129.705 Y139.037
G1 X125.734 Y135.066 E.17254
G1 X125.815 Y135.681
G1 X129.234 Y139.099 E.14855
G1 X128.763 Y139.161
G1 X125.896 Y136.295 E.12456
G1 X125.977 Y136.909
G1 X128.291 Y139.223 E.10057
G1 X127.82 Y139.285
G1 X126.058 Y137.523 E.07658
G1 X126.139 Y138.137
G1 X127.349 Y139.347 E.05259
G1 X126.878 Y139.409
G1 X126.219 Y138.751 E.0286
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.878 Y139.409 E-.35372
G1 X127.349 Y139.347 E-.18061
G1 X126.929 Y138.927 E-.22567
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.828 Y139.977 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.286672
G1 F5289
M204 S6000
G1 X124.361 Y128.797 E.22398
M204 S10000
G1 X123.968 Y128.342 F42000
; LINE_WIDTH: 0.387788
G1 F5289
M204 S6000
G1 X123.986 Y128 E.00962
; LINE_WIDTH: 0.423314
G1 X124.017 Y127.596 E.01257
; LINE_WIDTH: 0.46697
G3 X124.113 Y126.735 I18.729 J1.641 E.02993
; WIPE_START
G1 F8489.568
G1 X124.017 Y127.596 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.875 Y126.022 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.192587
G1 F5289
M204 S6000
G1 X126.02 Y117.322 E.10702
; WIPE_START
G1 F15000
G1 X125.759 Y119.305 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.469 Y116.436 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.480864
G1 F5289
M204 S6000
G1 X125.679 Y114.835 E.05761
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.227
G1 X125.469 Y116.436 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/73
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z3.8 I-1.159 J.37 P1  F42000
M73 P48 R10
G1 X129.708 Y129.706 Z3.8
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4476
M204 S6000
G1 X130.197 Y129.77 E.01636
G1 X131.515 Y139.788 E.33516
G1 X125.982 Y140.517 E.18516
G1 X124.467 Y129.016 E.38478
G1 X125.039 Y129.091 E.01912
G1 X126.394 Y139.382 E.3443
G1 X130.824 Y138.799 E.14822
G1 X129.625 Y129.695 E.30459
G1 X129.648 Y129.698 E.00077
; WIPE_START
G1 F8843.478
G1 X130.197 Y129.77 E-.21016
G1 X130.386 Y131.205 E-.54984
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.899 Y129.501 Z4 F42000
G1 Z3.6
G1 E.8 F1800
G1 F4476
M204 S6000
G1 X125.51 Y129.552 E.01301
G1 X126.744 Y138.925 E.31361
G1 X130.367 Y138.448 E.12121
G1 X129.152 Y129.222 E.30868
G1 X130.15 Y129.354 E.03337
G1 X130.244 Y128.638 E.02395
G1 X130.458 Y128.638 E.0071
G1 X131.972 Y140.138 E.38478
G1 X125.631 Y140.973 E.21216
G1 X124.083 Y129.217 E.39334
G3 X124.021 Y128.547 I7.643 J-1.044 E.02233
G1 X127.769 Y129.04 E.1254
G1 X127.769 Y129.254 E.0071
G1 X125.958 Y129.493 E.0606
M204 S250
G1 X125.95 Y129.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4476
M204 S5000
G1 X128.795 Y129.515 E.08819
G1 X129.927 Y138.111 E.26641
G1 X127.082 Y138.485 E.08819
G1 X125.958 Y129.949 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
M73 P48 R9
G1 X127.935 Y129.646 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.812 Y128.914 Z4 F42000
G1 Z3.6
G1 E.8 F1800
G1 F4476
M204 S5000
G1 X124.339 Y128.193 E.16961
G1 X124.421 Y127.573 E.01922
G1 X124.499 Y126.984 E.01827
G1 X129.971 Y127.704 E.16961
G1 X129.82 Y128.854 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.834 Y128.615 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.065 Y121.315 Z4 F42000
G1 X131.378 Y117.016 Z4
G1 Z3.6
G1 E.8 F1800
G1 F4476
M204 S5000
G1 X125.906 Y116.296 E.16961
G1 X125.987 Y115.676 E.01922
G1 X126.065 Y115.086 E.01827
G1 X131.538 Y115.807 E.16961
G1 X131.386 Y116.957 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.401 Y116.717 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.978 Y117.501 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4476
M204 S6000
G1 X130.367 Y117.552 E.01301
G1 X129.133 Y126.925 E.31361
G1 X125.51 Y126.448 E.12121
G1 X126.49 Y119.005 E.24902
G1 X126.744 Y117.075 E.06459
G1 X129.919 Y117.493 E.10622
M204 S250
G1 X129.927 Y117.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4476
M204 S5000
G1 X128.795 Y126.485 E.2664
G1 X125.95 Y126.111 E.08819
G1 X126.879 Y119.057 E.21862
G1 X127.082 Y117.515 E.04778
G1 X129.868 Y117.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.62 Y119.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.289 Y117.41 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4476
M204 S6000
G1 X125.124 Y126.26 E.29609
G1 X124.572 Y126.187 E.01847
G1 X125.771 Y117.084 E.30457
G1 X126.323 Y117.157 E.01847
G1 X126.297 Y117.351 E.0065
; WIPE_START
G1 F8843.478
G1 X126.036 Y119.334 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.274 Y117.809 Z4 F42000
G1 Z3.6
G1 E.8 F1800
G1 F4476
M204 S6000
G1 X131.305 Y117.813 E.00102
G1 X130.106 Y126.916 E.30457
G1 X129.554 Y126.843 E.01847
G1 X130.753 Y117.74 E.30457
G1 X131.215 Y117.801 E.01545
M204 S10000
G1 X131.327 Y117.405 F42000
G1 F4476
M204 S6000
G1 X131.761 Y117.462 E.01453
G1 X130.457 Y127.373 E.33158
G1 X124.116 Y126.538 E.21216
G1 X125.42 Y116.627 E.33158
G1 X131.268 Y117.397 E.19564
; WIPE_START
G1 F8843.478
G1 X131.761 Y117.462 E-.18922
G1 X131.565 Y118.951 E-.57078
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.914 Y126.556 Z4 F42000
G1 X130.791 Y127.993 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4476
M204 S5000
G1 X130.793 Y128 E.00021
G2 X130.812 Y128.32 I2.804 J0 E.00985
G1 X132.386 Y140.28 E.37067
G3 X132.228 Y140.5 I-.19 J.03 E.00924
G1 X125.49 Y141.387 E.20883
G3 X125.267 Y141.215 I-.029 J-.193 E.00967
G1 X123.694 Y129.264 E.37037
G3 X123.694 Y126.736 I10.794 J-1.264 E.07786
G1 X125.268 Y114.784 E.37043
G3 X125.489 Y114.613 I.192 J.02 E.00962
G1 X132.23 Y115.501 E.20892
G3 X132.386 Y115.722 I-.038 J.192 E.0092
G1 X130.812 Y127.68 E.37059
G1 X130.795 Y127.934 E.00781
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.793 Y128 E-.02526
G1 X130.812 Y128.32 E-.12177
G1 X131.022 Y129.919 E-.61297
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4 F4000
            G39.3 S1
            G0 Z4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X129.938 Y129.942 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192562
G1 F4476
M204 S6000
G1 X131.126 Y138.964 E.11097
M204 S10000
G1 X126.355 Y140.03 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50537
G1 F4476
M204 S6000
G1 X126.538 Y140.004 E.00695
; LINE_WIDTH: 0.532108
G1 X126.6 Y139.97 E.00283
; LINE_WIDTH: 0.582083
G1 X126.663 Y139.937 E.00312
; LINE_WIDTH: 0.632058
G1 X126.726 Y139.903 E.00341
; LINE_WIDTH: 0.706416
G1 X126.788 Y139.87 E.00384
G1 X130.569 Y139.372 E.20616
; LINE_WIDTH: 0.686374
G1 X130.632 Y139.384 E.00338
; LINE_WIDTH: 0.645682
G1 X130.695 Y139.397 E.00317
; LINE_WIDTH: 0.60499
G1 X130.759 Y139.409 E.00295
; LINE_WIDTH: 0.564298
G1 X130.822 Y139.421 E.00274
; LINE_WIDTH: 0.512051
G2 X130.969 Y139.422 I.075 J-.221 E.00573
M204 S10000
G1 X126.144 Y139.62 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192595
G1 F4476
M204 S6000
G1 X124.781 Y129.263 E.12741
M204 S10000
G1 X125.252 Y129.147 F42000
; LINE_WIDTH: 0.429465
G1 F4476
M204 S6000
G1 X125.451 Y129.147 E.00627
; LINE_WIDTH: 0.385126
G1 X125.65 Y129.147 E.00555
; LINE_WIDTH: 0.340787
G1 X125.849 Y129.147 E.00483
; LINE_WIDTH: 0.296448
G1 X126.048 Y129.147 E.00411
; LINE_WIDTH: 0.252109
G1 X126.247 Y129.147 E.00339
; LINE_WIDTH: 0.207771
G1 X126.446 Y129.147 E.00267
; LINE_WIDTH: 0.163432
G1 X126.645 Y129.147 E.00195
; LINE_WIDTH: 0.119093
G1 X126.844 Y129.147 E.00124
; WIPE_START
G1 F15000
G1 X126.645 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.966 Y129.147 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.507801
G1 F4476
M204 S6000
G1 X128.292 Y129.147 E.01236
; LINE_WIDTH: 0.458932
G1 X128.618 Y129.147 E.01106
; LINE_WIDTH: 0.410064
G1 X128.945 Y129.147 E.00976
; WIPE_START
G1 F9805.436
G1 X128.618 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.857 Y126.678 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.192586
G1 F4476
M204 S6000
G1 X131.002 Y117.978 E.10701
; WIPE_START
G1 F15000
G1 X130.741 Y119.961 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.764 Y117.265 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.480859
G1 F4476
M204 S6000
G1 X131.975 Y115.665 E.05759
; WIPE_START
G1 F8220.323
G1 X131.764 Y117.265 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.02 Y117.322 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.192587
G1 F4476
M204 S6000
G1 X124.875 Y126.022 E.10701
; WIPE_START
G1 F15000
G1 X125.136 Y124.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.113 Y126.735 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.466963
G1 F4476
M204 S6000
G2 X124.017 Y127.596 I18.559 J2.495 E.02993
; LINE_WIDTH: 0.423328
G1 X123.986 Y128 E.01256
; LINE_WIDTH: 0.387797
G1 X123.968 Y128.342 E.00962
; WIPE_START
G1 F10438.528
G1 X123.986 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.957 Y120.429 Z4 F42000
G1 X125.469 Y116.436 Z4
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.480845
G1 F4476
M204 S6000
G1 X125.679 Y114.835 E.05761
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.6
G1 X125.469 Y116.436 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/73
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z4 I-1.159 J.37 P1  F42000
G1 X129.708 Y129.706 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4476
M204 S6000
G1 X130.197 Y129.77 E.01636
G1 X131.515 Y139.788 E.33516
G1 X125.982 Y140.517 E.18516
G1 X124.467 Y129.016 E.38478
G1 X125.039 Y129.091 E.01912
G1 X126.394 Y139.382 E.3443
G1 X130.824 Y138.799 E.14822
G1 X129.625 Y129.695 E.30459
G1 X129.648 Y129.698 E.00077
M204 S10000
G1 X130.201 Y128.965 F42000
G1 F4476
M204 S6000
M73 P49 R9
G1 X130.244 Y128.638 E.01095
G1 X130.458 Y128.638 E.0071
G1 X131.972 Y140.138 E.38478
G1 X125.631 Y140.973 E.21216
G1 X124.083 Y129.217 E.39334
G3 X124.021 Y128.547 I7.644 J-1.044 E.02234
G1 X127.769 Y129.04 E.1254
G1 X127.769 Y129.254 E.0071
G1 X125.51 Y129.552 E.07559
G1 X126.744 Y138.925 E.31361
G1 X130.367 Y138.448 E.12121
G1 X129.152 Y129.222 E.30868
G1 X130.15 Y129.354 E.03337
G1 X130.193 Y129.024 E.01102
; WIPE_START
G1 F8843.478
G1 X130.244 Y128.638 E-.14819
G1 X130.458 Y128.638 E-.08139
G1 X130.64 Y130.022 E-.53042
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.95 Y129.889 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4476
M204 S5000
G1 X128.508 Y129.553 E.07928
G1 X128.795 Y129.515 E.00891
G1 X129.927 Y138.111 E.26641
G1 X127.082 Y138.485 E.08819
G1 X125.958 Y129.949 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.934 Y129.642 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.812 Y128.914 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
G1 F4476
M204 S5000
G1 X124.339 Y128.193 E.16961
G1 X124.425 Y127.543 E.02016
G1 X124.499 Y126.984 E.01733
G1 X129.971 Y127.704 E.16961
G1 X129.82 Y128.854 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.834 Y128.615 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.065 Y121.315 Z4.2 F42000
G1 X131.378 Y117.016 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F4476
M204 S5000
G1 X125.906 Y116.296 E.16961
G1 X125.991 Y115.645 E.02016
G1 X126.065 Y115.086 E.01733
G1 X131.538 Y115.807 E.16961
G1 X131.386 Y116.957 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.401 Y116.717 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.978 Y117.501 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4476
M204 S6000
G1 X130.367 Y117.552 E.01301
G1 X129.133 Y126.925 E.31361
G1 X125.51 Y126.448 E.12121
G1 X126.467 Y119.183 E.24307
G1 X126.744 Y117.075 E.07054
G1 X129.919 Y117.493 E.10622
M204 S250
G1 X129.927 Y117.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4476
M204 S5000
G1 X128.795 Y126.485 E.2664
G1 X125.95 Y126.111 E.08819
G1 X126.855 Y119.234 E.21311
G1 X127.082 Y117.515 E.05329
G1 X129.868 Y117.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.62 Y119.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.289 Y117.41 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4476
M204 S6000
G1 X125.124 Y126.26 E.29609
G1 X124.572 Y126.187 E.01847
G1 X125.771 Y117.084 E.30457
G1 X126.323 Y117.157 E.01847
G1 X126.297 Y117.351 E.0065
; WIPE_START
G1 F8843.478
G1 X126.036 Y119.334 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.274 Y117.809 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
G1 F4476
M204 S6000
G1 X131.305 Y117.813 E.00102
G1 X130.106 Y126.916 E.30457
G1 X129.554 Y126.843 E.01847
G1 X130.753 Y117.74 E.30457
G1 X131.215 Y117.801 E.01545
M204 S10000
G1 X131.327 Y117.405 F42000
G1 F4476
M204 S6000
G1 X131.761 Y117.462 E.01453
G1 X130.457 Y127.373 E.33158
G1 X124.116 Y126.538 E.21216
G1 X125.42 Y116.627 E.33158
G1 X131.268 Y117.397 E.19564
; WIPE_START
G1 F8843.478
G1 X131.761 Y117.462 E-.18922
G1 X131.565 Y118.951 E-.57078
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.917 Y126.556 Z4.2 F42000
G1 X130.792 Y128.019 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4476
M204 S5000
G1 X130.812 Y128.32 E.00926
G1 X132.386 Y140.28 E.37066
G3 X132.228 Y140.5 I-.192 J.028 E.00922
G1 X125.489 Y141.387 E.20884
G3 X125.268 Y141.217 I-.03 J-.191 E.0096
G1 X123.694 Y129.264 E.37045
G3 X123.694 Y126.736 I10.794 J-1.264 E.07786
G1 X125.267 Y114.785 E.37038
G3 X125.489 Y114.613 I.194 J.02 E.00964
G1 X132.23 Y115.501 E.20893
G3 X132.386 Y115.722 I-.039 J.193 E.00919
G1 X130.812 Y127.678 E.37053
G2 X130.798 Y127.96 I3.551 J.323 E.00868
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.812 Y128.32 E-.13699
G1 X131.026 Y129.946 E-.62301
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.2
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.2 F4000
            G39.3 S1
            G0 Z4.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X129.938 Y129.942 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192595
G1 F4476
M204 S6000
G1 X131.126 Y138.964 E.11099
M204 S10000
G1 X126.355 Y140.03 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50538
G1 F4476
M204 S6000
G1 X126.538 Y140.004 E.00695
; LINE_WIDTH: 0.532108
G1 X126.6 Y139.97 E.00283
; LINE_WIDTH: 0.582083
G1 X126.663 Y139.937 E.00312
; LINE_WIDTH: 0.632058
G1 X126.726 Y139.903 E.00341
; LINE_WIDTH: 0.706416
G1 X126.788 Y139.87 E.00384
G1 X130.569 Y139.372 E.20616
; LINE_WIDTH: 0.686374
G1 X130.632 Y139.384 E.00338
; LINE_WIDTH: 0.645682
G1 X130.695 Y139.397 E.00317
; LINE_WIDTH: 0.60499
G1 X130.759 Y139.409 E.00295
; LINE_WIDTH: 0.564298
G1 X130.822 Y139.421 E.00274
; LINE_WIDTH: 0.51205
G2 X130.969 Y139.422 I.075 J-.221 E.00573
M204 S10000
G1 X126.144 Y139.62 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192606
G1 F4476
M204 S6000
G1 X124.781 Y129.263 E.12742
M204 S10000
G1 X125.252 Y129.147 F42000
; LINE_WIDTH: 0.429479
G1 F4476
M204 S6000
G1 X125.451 Y129.147 E.00627
; LINE_WIDTH: 0.385138
G1 X125.65 Y129.147 E.00555
; LINE_WIDTH: 0.340797
G1 X125.849 Y129.147 E.00483
; LINE_WIDTH: 0.296457
G1 X126.048 Y129.147 E.00411
; LINE_WIDTH: 0.252116
G1 X126.247 Y129.147 E.00339
; LINE_WIDTH: 0.207775
G1 X126.446 Y129.147 E.00267
; LINE_WIDTH: 0.163435
G1 X126.645 Y129.147 E.00195
; LINE_WIDTH: 0.119094
G1 X126.844 Y129.147 E.00124
; WIPE_START
G1 F15000
G1 X126.645 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.966 Y129.147 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.507807
G1 F4476
M204 S6000
G1 X128.292 Y129.147 E.01236
; LINE_WIDTH: 0.458928
G1 X128.618 Y129.147 E.01106
; LINE_WIDTH: 0.41005
G1 X128.945 Y129.147 E.00976
; WIPE_START
G1 F9805.792
G1 X128.618 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.857 Y126.678 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.192586
G1 F4476
M204 S6000
G1 X131.002 Y117.978 E.10701
; WIPE_START
G1 F15000
G1 X130.741 Y119.961 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.764 Y117.265 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F4476
M204 S6000
G1 X131.975 Y115.665 E.0576
; WIPE_START
G1 F8220.316
G1 X131.764 Y117.265 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.02 Y117.322 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.192586
G1 F4476
M204 S6000
G1 X124.875 Y126.022 E.10701
; WIPE_START
G1 F15000
G1 X125.136 Y124.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.113 Y126.735 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.466963
G1 F4476
M204 S6000
G2 X124.017 Y127.596 I18.593 J2.498 E.02993
; LINE_WIDTH: 0.423328
G1 X123.986 Y128 E.01256
; LINE_WIDTH: 0.387811
G1 X123.968 Y128.342 E.00962
; WIPE_START
G1 F10438.082
G1 X123.986 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.957 Y120.429 Z4.2 F42000
G1 X125.469 Y116.436 Z4.2
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.480845
G1 F4476
M204 S6000
G1 X125.679 Y114.835 E.05761
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.599
G1 X125.469 Y116.436 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/73
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z4.2 I-1.213 J-.097 P1  F42000
G1 X124.467 Y129.016 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4475
M204 S6000
G1 X125.039 Y129.091 E.01912
G1 X126.394 Y139.382 E.3443
G1 X130.824 Y138.799 E.14822
G1 X129.625 Y129.695 E.30459
G1 X130.197 Y129.77 E.01912
G1 X131.515 Y139.788 E.33516
G1 X125.982 Y140.517 E.18516
G1 X124.475 Y129.076 E.38279
M204 S10000
G1 X124.288 Y128.582 F42000
G1 F4475
M204 S6000
G1 X127.769 Y129.04 E.11647
G1 X127.769 Y129.254 E.0071
G1 X125.51 Y129.552 E.07559
G1 X126.744 Y138.925 E.31361
G1 X130.367 Y138.448 E.12121
G1 X129.152 Y129.222 E.30868
G1 X130.15 Y129.354 E.03337
G1 X130.244 Y128.638 E.02395
G1 X130.458 Y128.638 E.0071
G1 X131.972 Y140.138 E.38478
G1 X125.631 Y140.973 E.21216
G1 X124.083 Y129.217 E.39334
G3 X124.021 Y128.547 I7.616 J-1.041 E.02233
G1 X124.229 Y128.574 E.00694
; WIPE_START
G1 F8843.478
G1 X126.212 Y128.835 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.95 Y129.889 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4475
M204 S5000
G1 X128.455 Y129.56 E.07764
G1 X128.795 Y129.515 E.01054
G1 X129.927 Y138.111 E.26641
G1 X127.082 Y138.485 E.08819
G1 X125.958 Y129.949 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.934 Y129.641 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.499 Y126.984 Z4.4 F42000
G1 Z4
G1 E.8 F1800
G1 F4475
M204 S5000
G1 X129.971 Y127.704 E.16961
G1 X129.812 Y128.914 E.03749
G1 X124.339 Y128.193 E.16961
G1 X124.429 Y127.512 E.02111
G1 X124.491 Y127.043 E.01454
; WIPE_START
G1 F9547.055
M204 S6000
M73 P50 R9
G1 X126.476 Y127.283 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.765 Y120.395 Z4.4 F42000
G1 X131.378 Y117.016 Z4.4
G1 Z4
G1 E.8 F1800
G1 F4475
M204 S5000
G1 X125.906 Y116.296 E.16961
G1 X125.995 Y115.615 E.02111
G1 X126.065 Y115.086 E.01638
G1 X131.538 Y115.807 E.16961
G1 X131.386 Y116.957 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.401 Y116.717 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.978 Y117.501 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4475
M204 S6000
G1 X130.367 Y117.552 E.01301
G1 X129.133 Y126.925 E.31361
G1 X125.51 Y126.448 E.12121
G1 X126.443 Y119.361 E.23712
G1 X126.744 Y117.075 E.07649
G1 X129.919 Y117.493 E.10622
M204 S250
G1 X129.927 Y117.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4475
M204 S5000
G1 X128.795 Y126.485 E.2664
G1 X125.95 Y126.111 E.08819
G1 X126.832 Y119.412 E.2076
G1 X127.082 Y117.515 E.05881
G1 X129.868 Y117.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.62 Y119.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.289 Y117.41 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4475
M204 S6000
G1 X125.124 Y126.26 E.29609
G1 X124.572 Y126.187 E.01847
G1 X125.771 Y117.084 E.30457
G1 X126.323 Y117.157 E.01847
G1 X126.297 Y117.351 E.0065
; WIPE_START
G1 F8843.478
G1 X126.036 Y119.334 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.274 Y117.809 Z4.4 F42000
G1 Z4
G1 E.8 F1800
G1 F4475
M204 S6000
G1 X131.305 Y117.813 E.00102
G1 X130.106 Y126.916 E.30457
G1 X129.554 Y126.843 E.01847
G1 X130.753 Y117.74 E.30457
G1 X131.215 Y117.801 E.01545
M204 S10000
G1 X131.327 Y117.405 F42000
G1 F4475
M204 S6000
G1 X131.761 Y117.462 E.01453
G1 X130.457 Y127.373 E.33158
G1 X124.116 Y126.538 E.21216
G1 X125.42 Y116.627 E.33158
G1 X131.268 Y117.397 E.19564
; WIPE_START
G1 F8843.478
G1 X131.761 Y117.462 E-.18922
G1 X131.565 Y118.951 E-.57078
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.919 Y126.556 Z4.4 F42000
G1 X130.793 Y128.036 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4475
M204 S5000
G1 X130.812 Y128.32 E.00874
G1 X132.386 Y140.28 E.37068
G3 X132.23 Y140.5 I-.19 J.03 E.00919
G1 X125.489 Y141.387 E.20889
G3 X125.268 Y141.216 I-.03 J-.191 E.00963
G1 X123.694 Y129.264 E.37043
G3 X123.694 Y126.736 I10.795 J-1.264 E.07786
G1 X125.268 Y114.784 E.37043
G3 X125.489 Y114.613 I.194 J.022 E.00959
G1 X132.23 Y115.501 E.20893
G3 X132.386 Y115.722 I-.038 J.192 E.0092
G1 X130.812 Y127.678 E.37052
G2 X130.796 Y127.976 I3.321 J.323 E.00918
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.812 Y128.32 E-.13073
G1 X131.028 Y129.962 E-.62927
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.4
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.4 F4000
            G39.3 S1
            G0 Z4.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X129.938 Y129.942 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192584
G1 F4475
M204 S6000
G1 X131.126 Y138.964 E.11098
M204 S10000
G1 X126.355 Y140.03 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50537
G1 F4475
M204 S6000
G1 X126.538 Y140.004 E.00695
; LINE_WIDTH: 0.532108
G1 X126.6 Y139.97 E.00283
; LINE_WIDTH: 0.582083
G1 X126.663 Y139.937 E.00312
; LINE_WIDTH: 0.632058
G1 X126.726 Y139.903 E.00341
; LINE_WIDTH: 0.706426
G1 X126.788 Y139.87 E.00384
G1 X130.569 Y139.372 E.20616
; LINE_WIDTH: 0.686396
G1 X130.632 Y139.384 E.00338
; LINE_WIDTH: 0.645708
G1 X130.696 Y139.397 E.00317
; LINE_WIDTH: 0.60502
G1 X130.759 Y139.409 E.00295
; LINE_WIDTH: 0.564332
G1 X130.822 Y139.421 E.00274
; LINE_WIDTH: 0.512091
G2 X130.969 Y139.422 I.075 J-.221 E.00573
M204 S10000
G1 X126.144 Y139.62 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192595
G1 F4475
M204 S6000
G1 X124.781 Y129.263 E.12741
M204 S10000
G1 X125.252 Y129.147 F42000
; LINE_WIDTH: 0.429465
G1 F4475
M204 S6000
G1 X125.451 Y129.147 E.00627
; LINE_WIDTH: 0.385126
G1 X125.65 Y129.147 E.00555
; LINE_WIDTH: 0.340787
G1 X125.849 Y129.147 E.00483
; LINE_WIDTH: 0.296448
G1 X126.048 Y129.147 E.00411
; LINE_WIDTH: 0.252109
G1 X126.247 Y129.147 E.00339
; LINE_WIDTH: 0.207771
G1 X126.446 Y129.147 E.00267
; LINE_WIDTH: 0.163432
G1 X126.645 Y129.147 E.00195
; LINE_WIDTH: 0.119093
G1 X126.844 Y129.147 E.00124
; WIPE_START
G1 F15000
G1 X126.645 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.966 Y129.147 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.50781
G1 F4475
M204 S6000
G1 X128.292 Y129.147 E.01236
; LINE_WIDTH: 0.458936
G1 X128.618 Y129.147 E.01106
; LINE_WIDTH: 0.410063
G1 X128.945 Y129.147 E.00976
; WIPE_START
G1 F9805.448
G1 X128.618 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.857 Y126.678 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.192586
G1 F4475
M204 S6000
G1 X131.002 Y117.978 E.10701
; WIPE_START
G1 F15000
G1 X130.741 Y119.961 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.764 Y117.265 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.480859
G1 F4475
M204 S6000
G1 X131.975 Y115.665 E.05759
; WIPE_START
G1 F8220.323
G1 X131.764 Y117.265 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.02 Y117.322 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.192587
G1 F4475
M204 S6000
G1 X124.875 Y126.022 E.10702
; WIPE_START
G1 F15000
G1 X125.136 Y124.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.113 Y126.735 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.466963
G1 F4475
M204 S6000
G2 X124.017 Y127.596 I18.593 J2.498 E.02993
; LINE_WIDTH: 0.423329
G1 X123.986 Y128 E.01256
; LINE_WIDTH: 0.387808
G1 X123.968 Y128.342 E.00962
; WIPE_START
G1 F10438.186
G1 X123.986 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.957 Y120.429 Z4.4 F42000
G1 X125.469 Y116.436 Z4.4
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.480848
G1 F4475
M204 S6000
G1 X125.679 Y114.835 E.05761
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.543
G1 X125.469 Y116.436 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/73
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z4.4 I-1.159 J.37 P1  F42000
G1 X129.708 Y129.706 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4476
M204 S6000
G1 X130.197 Y129.77 E.01636
G1 X131.515 Y139.788 E.33516
G1 X125.982 Y140.517 E.18516
G1 X124.467 Y129.016 E.38478
G1 X125.039 Y129.091 E.01912
G1 X126.394 Y139.382 E.3443
G1 X130.824 Y138.799 E.14822
G1 X129.625 Y129.695 E.30458
G1 X129.648 Y129.698 E.00077
; WIPE_START
G1 F8843.478
G1 X130.197 Y129.77 E-.21016
G1 X130.386 Y131.205 E-.54984
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.899 Y129.501 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F4476
M204 S6000
G1 X125.51 Y129.552 E.01301
G1 X126.744 Y138.925 E.31361
G1 X130.367 Y138.448 E.12121
G1 X129.152 Y129.222 E.30868
G1 X130.15 Y129.354 E.03337
G1 X130.244 Y128.638 E.02395
G1 X130.458 Y128.638 E.0071
G1 X131.972 Y140.138 E.38478
G1 X125.631 Y140.973 E.21216
G1 X124.083 Y129.217 E.39334
G3 X124.021 Y128.547 I7.643 J-1.044 E.02233
G1 X127.769 Y129.04 E.1254
G1 X127.769 Y129.254 E.0071
G1 X125.958 Y129.493 E.0606
M204 S250
G1 X125.95 Y129.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4476
M204 S5000
G1 X128.402 Y129.567 E.07601
G1 X128.795 Y129.515 E.01218
G1 X129.927 Y138.111 E.2664
G1 X127.082 Y138.485 E.08819
G1 X125.958 Y129.949 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.934 Y129.64 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.812 Y128.914 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F4476
M204 S5000
G1 X124.339 Y128.193 E.16961
G1 X124.433 Y127.482 E.02205
G1 X124.499 Y126.984 E.01543
G1 X129.971 Y127.704 E.16961
G1 X129.82 Y128.854 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.834 Y128.615 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.065 Y121.315 Z4.6 F42000
G1 X131.378 Y117.016 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F4476
M204 S5000
G1 X125.906 Y116.296 E.16961
G1 X125.999 Y115.584 E.02205
G1 X126.065 Y115.086 E.01543
G1 X131.538 Y115.807 E.16961
G1 X131.386 Y116.957 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.401 Y116.717 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.978 Y117.501 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4476
M204 S6000
M73 P51 R9
G1 X130.367 Y117.552 E.01301
G1 X129.133 Y126.925 E.31361
G1 X125.51 Y126.448 E.12121
G1 X126.42 Y119.539 E.23117
G1 X126.744 Y117.075 E.08244
G1 X129.919 Y117.493 E.10622
M204 S250
G1 X129.927 Y117.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4476
M204 S5000
G1 X128.795 Y126.485 E.2664
G1 X125.95 Y126.111 E.08819
G1 X126.808 Y119.59 E.20209
G1 X127.082 Y117.515 E.06432
G1 X129.868 Y117.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.62 Y119.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.289 Y117.41 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4476
M204 S6000
G1 X125.124 Y126.26 E.29609
G1 X124.572 Y126.187 E.01847
G1 X125.771 Y117.084 E.30457
G1 X126.323 Y117.157 E.01847
G1 X126.297 Y117.351 E.0065
; WIPE_START
G1 F8843.478
G1 X126.036 Y119.334 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.274 Y117.809 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F4476
M204 S6000
G1 X131.305 Y117.813 E.00102
G1 X130.106 Y126.916 E.30457
G1 X129.554 Y126.843 E.01847
G1 X130.753 Y117.74 E.30457
G1 X131.215 Y117.801 E.01545
M204 S10000
G1 X131.327 Y117.405 F42000
G1 F4476
M204 S6000
G1 X131.761 Y117.462 E.01453
G1 X130.457 Y127.373 E.33158
G1 X124.116 Y126.538 E.21216
G1 X125.42 Y116.627 E.33158
G1 X131.268 Y117.397 E.19564
; WIPE_START
G1 F8843.478
G1 X131.761 Y117.462 E-.18922
G1 X131.565 Y118.951 E-.57078
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.921 Y126.557 Z4.6 F42000
G1 X130.794 Y128.052 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4476
M204 S5000
G1 X130.812 Y128.322 E.00831
G1 X132.386 Y140.28 E.3706
G3 X132.23 Y140.499 I-.192 J.029 E.00914
G1 X125.49 Y141.387 E.20891
G3 X125.267 Y141.215 I-.029 J-.193 E.00967
G1 X123.694 Y129.264 E.37038
G3 X123.694 Y126.736 I10.794 J-1.264 E.07786
G1 X125.267 Y114.785 E.37038
G3 X125.489 Y114.613 I.194 J.02 E.00965
G1 X132.23 Y115.501 E.20893
G3 X132.386 Y115.722 I-.038 J.192 E.00919
G1 X130.812 Y127.678 E.37052
G2 X130.8 Y127.993 I4.386 J.322 E.00968
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.812 Y128.322 E-.12534
G1 X131.03 Y129.978 E-.63466
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.6
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.6 F4000
            G39.3 S1
            G0 Z4.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X129.938 Y129.942 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192573
G1 F4476
M204 S6000
G1 X131.126 Y138.964 E.11097
M204 S10000
G1 X126.355 Y140.03 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50537
G1 F4476
M204 S6000
G1 X126.538 Y140.004 E.00695
; LINE_WIDTH: 0.532105
G1 X126.6 Y139.97 E.00283
; LINE_WIDTH: 0.582075
G1 X126.663 Y139.937 E.00312
; LINE_WIDTH: 0.632045
G1 X126.726 Y139.903 E.00341
; LINE_WIDTH: 0.706406
G1 X126.788 Y139.87 E.00384
G1 X130.569 Y139.372 E.20615
; LINE_WIDTH: 0.686378
G1 X130.632 Y139.384 E.00338
; LINE_WIDTH: 0.645694
G1 X130.695 Y139.397 E.00317
; LINE_WIDTH: 0.60501
G1 X130.759 Y139.409 E.00295
; LINE_WIDTH: 0.564326
G1 X130.822 Y139.421 E.00274
; LINE_WIDTH: 0.512097
G2 X130.969 Y139.422 I.075 J-.221 E.00573
M204 S10000
G1 X126.144 Y139.62 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192595
G1 F4476
M204 S6000
G1 X124.781 Y129.263 E.12741
M204 S10000
G1 X125.252 Y129.147 F42000
; LINE_WIDTH: 0.42948
G1 F4476
M204 S6000
G1 X125.451 Y129.147 E.00627
; LINE_WIDTH: 0.385139
G1 X125.65 Y129.147 E.00555
; LINE_WIDTH: 0.340798
G1 X125.849 Y129.147 E.00483
; LINE_WIDTH: 0.296458
G1 X126.048 Y129.147 E.00411
; LINE_WIDTH: 0.252117
G1 X126.247 Y129.147 E.00339
; LINE_WIDTH: 0.207776
G1 X126.446 Y129.147 E.00267
; LINE_WIDTH: 0.163435
G1 X126.645 Y129.147 E.00195
; LINE_WIDTH: 0.119094
G1 X126.844 Y129.147 E.00124
; WIPE_START
G1 F15000
G1 X126.645 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.966 Y129.147 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.50783
G1 F4476
M204 S6000
G1 X128.292 Y129.147 E.01236
; LINE_WIDTH: 0.458956
G1 X128.618 Y129.147 E.01106
; LINE_WIDTH: 0.410082
G1 X128.945 Y129.147 E.00976
; WIPE_START
G1 F9804.953
G1 X128.618 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.857 Y126.678 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4476
M204 S6000
G1 X131.002 Y117.978 E.10701
; WIPE_START
G1 F15000
G1 X130.741 Y119.961 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.764 Y117.265 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.480859
G1 F4476
M204 S6000
G1 X131.975 Y115.665 E.05759
; WIPE_START
G1 F8220.323
G1 X131.764 Y117.265 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.02 Y117.322 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.192587
G1 F4476
M204 S6000
G1 X124.875 Y126.022 E.10701
; WIPE_START
G1 F15000
G1 X125.136 Y124.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.113 Y126.735 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.466963
G1 F4476
M204 S6000
G2 X124.017 Y127.596 I18.559 J2.495 E.02993
; LINE_WIDTH: 0.423328
G1 X123.986 Y128 E.01256
; LINE_WIDTH: 0.387797
G1 X123.968 Y128.342 E.00962
; WIPE_START
G1 F10438.528
G1 X123.986 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.957 Y120.429 Z4.6 F42000
G1 X125.469 Y116.436 Z4.6
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.480845
G1 F4476
M204 S6000
G1 X125.679 Y114.835 E.05761
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.599
G1 X125.469 Y116.436 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/73
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z4.6 I-1.159 J.37 P1  F42000
G1 X129.708 Y129.706 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4476
M204 S6000
G1 X130.197 Y129.77 E.01635
G1 X131.515 Y139.788 E.33516
G1 X125.982 Y140.517 E.18516
G1 X124.467 Y129.016 E.38478
G1 X125.039 Y129.091 E.01912
G1 X126.394 Y139.382 E.3443
G1 X130.824 Y138.799 E.14822
G1 X129.625 Y129.695 E.30458
G1 X129.648 Y129.698 E.00077
; WIPE_START
G1 F8843.478
G1 X130.197 Y129.77 E-.21015
G1 X130.386 Y131.205 E-.54985
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.899 Y129.501 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F4476
M204 S6000
G1 X125.51 Y129.552 E.01301
G1 X126.744 Y138.925 E.31361
G1 X130.367 Y138.448 E.12121
G1 X129.152 Y129.222 E.30868
G1 X130.15 Y129.354 E.03337
G1 X130.244 Y128.638 E.02395
G1 X130.458 Y128.638 E.0071
G1 X131.972 Y140.138 E.38478
G1 X125.631 Y140.973 E.21216
G1 X124.083 Y129.217 E.39334
G3 X124.021 Y128.547 I7.646 J-1.044 E.02233
G1 X127.769 Y129.04 E.1254
G1 X127.769 Y129.254 E.0071
G1 X125.958 Y129.493 E.0606
M204 S250
G1 X125.95 Y129.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4476
M204 S5000
G1 X128.35 Y129.573 E.07437
G1 X128.795 Y129.515 E.01382
G1 X129.927 Y138.111 E.2664
G1 X127.082 Y138.485 E.08819
G1 X125.958 Y129.949 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.934 Y129.639 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.812 Y128.914 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F4476
M204 S5000
G1 X124.339 Y128.193 E.16961
G1 X124.437 Y127.451 E.023
G1 X124.499 Y126.984 E.01449
G1 X129.971 Y127.704 E.16961
G1 X129.82 Y128.854 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.834 Y128.615 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.065 Y121.315 Z4.8 F42000
G1 X131.378 Y117.016 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F4476
M204 S5000
G1 X125.906 Y116.296 E.16961
G1 X126.003 Y115.554 E.023
G1 X126.065 Y115.086 E.01449
G1 X131.538 Y115.807 E.16961
G1 X131.386 Y116.957 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.401 Y116.717 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.978 Y117.501 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4476
M204 S6000
G1 X130.367 Y117.552 E.01301
G1 X129.133 Y126.925 E.31361
G1 X125.51 Y126.448 E.12121
G1 X126.396 Y119.717 E.22522
G1 X126.744 Y117.075 E.08839
G1 X129.919 Y117.493 E.10622
M204 S250
G1 X129.927 Y117.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4476
M204 S5000
G1 X128.795 Y126.485 E.2664
G1 X125.95 Y126.111 E.08819
G1 X126.785 Y119.768 E.19658
G1 X127.082 Y117.515 E.06983
G1 X129.868 Y117.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.62 Y119.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.289 Y117.41 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4476
M204 S6000
G1 X125.124 Y126.26 E.29609
M73 P52 R9
G1 X124.572 Y126.187 E.01847
G1 X125.771 Y117.084 E.30457
G1 X126.323 Y117.157 E.01847
G1 X126.297 Y117.351 E.0065
; WIPE_START
G1 F8843.478
G1 X126.036 Y119.334 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.274 Y117.809 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F4476
M204 S6000
G1 X131.305 Y117.813 E.00102
G1 X130.106 Y126.916 E.30457
G1 X129.554 Y126.843 E.01847
G1 X130.753 Y117.74 E.30457
G1 X131.215 Y117.801 E.01545
M204 S10000
G1 X131.327 Y117.405 F42000
G1 F4476
M204 S6000
G1 X131.761 Y117.462 E.01453
G1 X130.457 Y127.373 E.33158
G1 X124.116 Y126.538 E.21216
G1 X125.42 Y116.627 E.33158
G1 X131.268 Y117.397 E.19565
; WIPE_START
G1 F8843.478
G1 X131.761 Y117.462 E-.18922
G1 X131.565 Y118.951 E-.57078
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.923 Y126.557 Z4.8 F42000
G1 X130.795 Y128.067 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4476
M204 S5000
G1 X130.812 Y128.32 E.00778
G1 X132.386 Y140.28 E.37068
G3 X132.23 Y140.499 I-.19 J.03 E.00916
G1 X125.49 Y141.387 E.20891
G3 X125.268 Y141.216 I-.029 J-.193 E.00962
G1 X123.694 Y129.264 E.37043
G3 X123.694 Y126.736 I10.795 J-1.264 E.07786
G1 X125.268 Y114.784 E.37043
G3 X125.489 Y114.613 I.194 J.022 E.0096
G1 X132.23 Y115.501 E.20893
G3 X132.386 Y115.722 I-.038 J.192 E.0092
G1 X130.812 Y127.678 E.37053
G2 X130.796 Y127.998 I3.323 J.323 E.00984
G1 X130.796 Y128.007 E.00029
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.812 Y128.32 E-.11895
G1 X131.032 Y129.992 E-.64105
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.8
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.8 F4000
            G39.3 S1
            G0 Z4.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X129.938 Y129.942 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192595
G1 F4476
M204 S6000
G1 X131.126 Y138.964 E.11099
M204 S10000
G1 X126.355 Y140.03 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50538
G1 F4476
M204 S6000
G1 X126.538 Y140.004 E.00695
; LINE_WIDTH: 0.532108
G1 X126.6 Y139.97 E.00283
; LINE_WIDTH: 0.582083
G1 X126.663 Y139.937 E.00312
; LINE_WIDTH: 0.632058
G1 X126.726 Y139.903 E.00341
; LINE_WIDTH: 0.706426
G1 X126.788 Y139.87 E.00384
G1 X130.569 Y139.372 E.20616
; LINE_WIDTH: 0.686396
G1 X130.632 Y139.384 E.00338
; LINE_WIDTH: 0.645708
G1 X130.695 Y139.397 E.00317
; LINE_WIDTH: 0.60502
G1 X130.759 Y139.409 E.00295
; LINE_WIDTH: 0.564332
G1 X130.822 Y139.421 E.00274
; LINE_WIDTH: 0.512091
G2 X130.969 Y139.422 I.075 J-.221 E.00573
M204 S10000
G1 X126.144 Y139.62 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192595
G1 F4476
M204 S6000
G1 X124.781 Y129.263 E.12741
M204 S10000
G1 X125.252 Y129.147 F42000
; LINE_WIDTH: 0.429477
G1 F4476
M204 S6000
G1 X125.451 Y129.147 E.00627
; LINE_WIDTH: 0.385136
G1 X125.65 Y129.147 E.00555
; LINE_WIDTH: 0.340796
G1 X125.849 Y129.147 E.00483
; LINE_WIDTH: 0.296455
G1 X126.048 Y129.147 E.00411
; LINE_WIDTH: 0.252115
G1 X126.247 Y129.147 E.00339
; LINE_WIDTH: 0.207774
G1 X126.446 Y129.147 E.00267
; LINE_WIDTH: 0.163434
G1 X126.645 Y129.147 E.00195
; LINE_WIDTH: 0.119093
G1 X126.844 Y129.147 E.00124
; WIPE_START
G1 F15000
G1 X126.645 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.966 Y129.147 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.507816
G1 F4476
M204 S6000
G1 X128.292 Y129.147 E.01236
; LINE_WIDTH: 0.458947
G1 X128.618 Y129.147 E.01106
; LINE_WIDTH: 0.410078
G1 X128.945 Y129.147 E.00976
; WIPE_START
G1 F9805.06
G1 X128.618 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.857 Y126.678 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.192586
G1 F4476
M204 S6000
G1 X131.002 Y117.978 E.10701
; WIPE_START
G1 F15000
G1 X130.741 Y119.961 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.764 Y117.265 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.480844
G1 F4476
M204 S6000
G1 X131.975 Y115.665 E.05759
; WIPE_START
G1 F8220.609
G1 X131.764 Y117.265 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.02 Y117.322 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.192587
G1 F4476
M204 S6000
G1 X124.875 Y126.022 E.10702
; WIPE_START
G1 F15000
G1 X125.136 Y124.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.113 Y126.735 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.466963
G1 F4476
M204 S6000
G2 X124.017 Y127.596 I18.593 J2.498 E.02993
; LINE_WIDTH: 0.423328
G1 X123.986 Y128 E.01256
; LINE_WIDTH: 0.387807
G1 X123.968 Y128.342 E.00962
; WIPE_START
G1 F10438.215
G1 X123.986 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.957 Y120.429 Z4.8 F42000
G1 X125.469 Y116.436 Z4.8
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.480853
G1 F4476
M204 S6000
G1 X125.679 Y114.835 E.05761
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.439
G1 X125.469 Y116.436 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/73
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z4.8 I-1.159 J.37 P1  F42000
G1 X129.708 Y129.706 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4476
M204 S6000
G1 X130.197 Y129.77 E.01635
G1 X131.515 Y139.788 E.33516
G1 X125.982 Y140.517 E.18516
G1 X124.467 Y129.016 E.38478
G1 X125.039 Y129.091 E.01912
G1 X126.394 Y139.382 E.3443
G1 X130.824 Y138.799 E.14822
G1 X129.625 Y129.695 E.30459
G1 X129.648 Y129.698 E.00077
; WIPE_START
G1 F8843.478
G1 X130.197 Y129.77 E-.21016
G1 X130.386 Y131.205 E-.54984
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.899 Y129.501 Z5 F42000
G1 Z4.6
G1 E.8 F1800
G1 F4476
M204 S6000
G1 X125.51 Y129.552 E.01301
G1 X126.744 Y138.925 E.31361
G1 X130.367 Y138.448 E.12121
G1 X129.152 Y129.222 E.30868
G1 X130.15 Y129.354 E.03337
G1 X130.244 Y128.638 E.02395
G1 X130.458 Y128.638 E.0071
G1 X131.972 Y140.138 E.38478
G1 X125.631 Y140.973 E.21216
G1 X124.083 Y129.217 E.39334
G3 X124.021 Y128.547 I7.616 J-1.041 E.02233
G1 X127.769 Y129.04 E.1254
G1 X127.769 Y129.254 E.0071
G1 X125.958 Y129.493 E.0606
M204 S250
G1 X125.95 Y129.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4476
M204 S5000
G1 X128.297 Y129.58 E.07273
G1 X128.795 Y129.515 E.01545
G1 X129.927 Y138.111 E.26641
G1 X127.082 Y138.485 E.08819
G1 X125.958 Y129.949 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.933 Y129.638 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.812 Y128.914 Z5 F42000
G1 Z4.6
G1 E.8 F1800
G1 F4476
M204 S5000
G1 X124.339 Y128.193 E.16961
G1 X124.441 Y127.421 E.02394
G1 X124.499 Y126.984 E.01354
G1 X129.971 Y127.704 E.16961
G1 X129.82 Y128.854 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.834 Y128.615 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.065 Y121.315 Z5 F42000
G1 X131.378 Y117.016 Z5
G1 Z4.6
G1 E.8 F1800
G1 F4476
M204 S5000
G1 X125.906 Y116.296 E.16961
G1 X126.007 Y115.523 E.02394
G1 X126.065 Y115.086 E.01354
G1 X131.538 Y115.807 E.16961
G1 X131.386 Y116.957 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.401 Y116.717 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.978 Y117.501 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4476
M204 S6000
G1 X130.367 Y117.552 E.01301
G1 X129.133 Y126.925 E.31361
G1 X125.51 Y126.448 E.12121
G1 X126.373 Y119.894 E.21927
G1 X126.744 Y117.075 E.09434
G1 X129.919 Y117.493 E.10622
M204 S250
G1 X129.927 Y117.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4476
M204 S5000
G1 X128.795 Y126.485 E.2664
G1 X125.95 Y126.111 E.08819
G1 X126.762 Y119.946 E.19107
G1 X127.082 Y117.515 E.07534
G1 X129.868 Y117.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.62 Y119.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.289 Y117.41 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4476
M204 S6000
G1 X125.124 Y126.26 E.29609
G1 X124.572 Y126.187 E.01847
G1 X125.771 Y117.084 E.30457
G1 X126.323 Y117.157 E.01847
G1 X126.297 Y117.351 E.0065
; WIPE_START
G1 F8843.478
G1 X126.036 Y119.334 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.274 Y117.809 Z5 F42000
G1 Z4.6
G1 E.8 F1800
G1 F4476
M204 S6000
G1 X131.305 Y117.813 E.00102
G1 X130.106 Y126.916 E.30457
G1 X129.554 Y126.843 E.01847
G1 X130.753 Y117.74 E.30457
G1 X131.215 Y117.801 E.01545
M204 S10000
G1 X131.327 Y117.405 F42000
G1 F4476
M204 S6000
G1 X131.761 Y117.462 E.01453
G1 X130.457 Y127.373 E.33158
G1 X124.116 Y126.538 E.21216
G1 X125.42 Y116.627 E.33158
G1 X131.268 Y117.397 E.19565
; WIPE_START
G1 F8843.478
M73 P53 R9
G1 X131.761 Y117.462 E-.18922
G1 X131.565 Y118.951 E-.57078
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.925 Y126.557 Z5 F42000
G1 X130.796 Y128.082 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4476
M204 S5000
G1 X130.812 Y128.32 E.00735
G1 X132.386 Y140.28 E.37066
G3 X132.23 Y140.5 I-.19 J.03 E.00919
G1 X125.49 Y141.387 E.20888
G3 X125.267 Y141.215 I-.029 J-.193 E.00967
G1 X123.694 Y129.264 E.37038
G3 X123.694 Y126.736 I10.795 J-1.264 E.07786
G1 X125.267 Y114.786 E.37037
G3 X125.489 Y114.613 I.193 J.018 E.00967
G1 X132.23 Y115.501 E.20893
G3 X132.386 Y115.723 I-.038 J.192 E.0092
G1 X130.812 Y127.68 E.37059
G2 X130.794 Y128.001 I2.94 J.32 E.00988
G1 X130.795 Y128.022 E.00063
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.812 Y128.32 E-.11365
G1 X131.034 Y130.007 E-.64635
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5 F4000
            G39.3 S1
            G0 Z5 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X129.938 Y129.942 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192584
G1 F4476
M204 S6000
G1 X131.126 Y138.964 E.11098
M204 S10000
G1 X126.355 Y140.03 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50537
G1 F4476
M204 S6000
G1 X126.538 Y140.004 E.00695
; LINE_WIDTH: 0.532108
G1 X126.6 Y139.97 E.00283
; LINE_WIDTH: 0.582083
G1 X126.663 Y139.937 E.00312
; LINE_WIDTH: 0.632058
G1 X126.726 Y139.903 E.00341
; LINE_WIDTH: 0.706406
G1 X126.788 Y139.87 E.00384
G1 X130.569 Y139.372 E.20615
; LINE_WIDTH: 0.686354
G1 X130.632 Y139.384 E.00338
; LINE_WIDTH: 0.645662
G1 X130.696 Y139.397 E.00317
; LINE_WIDTH: 0.60497
G1 X130.759 Y139.409 E.00295
; LINE_WIDTH: 0.564278
G1 X130.822 Y139.421 E.00274
; LINE_WIDTH: 0.512035
G2 X130.969 Y139.422 I.075 J-.221 E.00573
M204 S10000
G1 X126.144 Y139.62 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192595
G1 F4476
M204 S6000
G1 X124.781 Y129.263 E.12741
M204 S10000
G1 X125.252 Y129.147 F42000
; LINE_WIDTH: 0.429466
G1 F4476
M204 S6000
G1 X125.451 Y129.147 E.00627
; LINE_WIDTH: 0.385127
G1 X125.65 Y129.147 E.00555
; LINE_WIDTH: 0.340788
G1 X125.849 Y129.147 E.00483
; LINE_WIDTH: 0.296449
G1 X126.048 Y129.147 E.00411
; LINE_WIDTH: 0.25211
G1 X126.247 Y129.147 E.00339
; LINE_WIDTH: 0.207771
G1 X126.446 Y129.147 E.00267
; LINE_WIDTH: 0.163432
G1 X126.645 Y129.147 E.00195
; LINE_WIDTH: 0.119093
G1 X126.844 Y129.147 E.00124
; WIPE_START
G1 F15000
G1 X126.645 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.966 Y129.147 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.507826
G1 F4476
M204 S6000
G1 X128.292 Y129.147 E.01236
; LINE_WIDTH: 0.458948
G1 X128.618 Y129.147 E.01106
; LINE_WIDTH: 0.410069
G1 X128.945 Y129.147 E.00976
; WIPE_START
G1 F9805.288
G1 X128.618 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.857 Y126.678 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.192586
G1 F4476
M204 S6000
G1 X131.002 Y117.978 E.10701
; WIPE_START
G1 F15000
G1 X130.741 Y119.961 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.764 Y117.265 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.480857
M73 P53 R8
G1 F4476
M204 S6000
G1 X131.975 Y115.665 E.0576
; WIPE_START
G1 F8220.362
G1 X131.764 Y117.265 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.02 Y117.322 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.192587
G1 F4476
M204 S6000
G1 X124.875 Y126.022 E.10702
; WIPE_START
G1 F15000
G1 X125.136 Y124.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.113 Y126.735 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.466947
G1 F4476
M204 S6000
G2 X124.017 Y127.596 I18.539 J2.492 E.02993
; LINE_WIDTH: 0.42332
G1 X123.986 Y128 E.01256
; LINE_WIDTH: 0.387804
G1 X123.968 Y128.342 E.00962
; WIPE_START
G1 F10438.314
G1 X123.986 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.957 Y120.429 Z5 F42000
G1 X125.469 Y116.436 Z5
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.480844
G1 F4476
M204 S6000
G1 X125.679 Y114.835 E.05761
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.615
G1 X125.469 Y116.436 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/73
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z5 I-1.159 J.37 P1  F42000
G1 X129.708 Y129.706 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4476
M204 S6000
G1 X130.197 Y129.77 E.01635
G1 X131.515 Y139.788 E.33516
G1 X125.982 Y140.517 E.18516
G1 X124.467 Y129.016 E.38478
G1 X125.039 Y129.091 E.01912
G1 X126.394 Y139.382 E.3443
G1 X130.824 Y138.799 E.14822
G1 X129.625 Y129.695 E.30459
G1 X129.648 Y129.698 E.00077
; WIPE_START
G1 F8843.478
G1 X130.197 Y129.77 E-.21016
G1 X130.386 Y131.205 E-.54984
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.899 Y129.501 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F4476
M204 S6000
G1 X125.51 Y129.552 E.01301
G1 X126.744 Y138.925 E.31361
G1 X130.367 Y138.448 E.12121
G1 X129.152 Y129.222 E.30868
G1 X130.15 Y129.354 E.03337
G1 X130.244 Y128.638 E.02395
G1 X130.458 Y128.638 E.0071
G1 X131.972 Y140.138 E.38478
G1 X125.631 Y140.973 E.21216
G1 X124.083 Y129.217 E.39334
G3 X124.021 Y128.547 I7.643 J-1.044 E.02233
G1 X127.769 Y129.04 E.1254
G1 X127.769 Y129.254 E.0071
G1 X125.958 Y129.493 E.0606
M204 S250
G1 X125.95 Y129.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4476
M204 S5000
G1 X128.244 Y129.587 E.0711
G1 X128.795 Y129.515 E.01709
G1 X129.927 Y138.111 E.26641
G1 X127.082 Y138.485 E.08819
G1 X125.958 Y129.949 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.933 Y129.636 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.812 Y128.914 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F4476
M204 S5000
G1 X124.339 Y128.193 E.16961
G1 X124.445 Y127.39 E.02489
G1 X124.499 Y126.984 E.0126
G1 X129.971 Y127.704 E.16961
G1 X129.82 Y128.854 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.834 Y128.615 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.065 Y121.315 Z5.2 F42000
G1 X131.378 Y117.016 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F4476
M204 S5000
G1 X125.906 Y116.296 E.16961
G1 X126.011 Y115.493 E.02489
G1 X126.065 Y115.086 E.0126
G1 X131.538 Y115.807 E.16961
G1 X131.386 Y116.957 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.401 Y116.717 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.978 Y117.501 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4476
M204 S6000
G1 X130.367 Y117.552 E.01301
G1 X129.133 Y126.925 E.31361
G1 X125.51 Y126.448 E.12121
G1 X126.35 Y120.072 E.21332
G1 X126.744 Y117.075 E.10029
G1 X129.919 Y117.493 E.10622
M204 S250
G1 X129.927 Y117.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4476
M204 S5000
G1 X128.795 Y126.485 E.2664
G1 X125.95 Y126.111 E.08819
G1 X126.738 Y120.123 E.18556
G1 X127.082 Y117.515 E.08085
G1 X129.868 Y117.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.62 Y119.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.289 Y117.41 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4476
M204 S6000
G1 X125.124 Y126.26 E.29609
G1 X124.572 Y126.187 E.01847
G1 X125.771 Y117.084 E.30457
G1 X126.323 Y117.157 E.01847
G1 X126.297 Y117.351 E.0065
; WIPE_START
G1 F8843.478
G1 X126.036 Y119.334 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.274 Y117.809 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F4476
M204 S6000
G1 X131.305 Y117.813 E.00102
G1 X130.106 Y126.916 E.30457
G1 X129.554 Y126.843 E.01847
G1 X130.753 Y117.74 E.30457
G1 X131.215 Y117.801 E.01545
M204 S10000
G1 X131.327 Y117.405 F42000
G1 F4476
M204 S6000
G1 X131.761 Y117.462 E.01453
G1 X130.457 Y127.373 E.33158
G1 X124.116 Y126.538 E.21216
G1 X125.42 Y116.627 E.33158
G1 X131.268 Y117.397 E.19564
; WIPE_START
G1 F8843.478
G1 X131.761 Y117.462 E-.18922
G1 X131.565 Y118.951 E-.57078
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.926 Y126.557 Z5.2 F42000
G1 X130.797 Y128.095 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4476
M204 S5000
G1 X130.812 Y128.32 E.00693
G1 X132.386 Y140.28 E.37067
G3 X132.228 Y140.5 I-.191 J.029 E.00922
G1 X125.489 Y141.387 E.20884
G3 X125.267 Y141.215 I-.028 J-.193 E.00966
G1 X123.694 Y129.264 E.37038
G3 X123.694 Y126.736 I10.794 J-1.264 E.07786
G1 X125.267 Y114.785 E.37037
G3 X125.489 Y114.613 I.194 J.02 E.00964
G1 X132.23 Y115.501 E.20894
G3 X132.386 Y115.722 I-.038 J.192 E.0092
G1 X130.812 Y127.678 E.37052
G2 X130.796 Y127.998 I3.322 J.323 E.00985
G1 X130.797 Y128.035 E.00114
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.812 Y128.32 E-.10852
G1 X131.036 Y130.02 E-.65148
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
M73 P54 R8
G1 Z5.2
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5.2 F4000
            G39.3 S1
            G0 Z5.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X129.938 Y129.942 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192584
G1 F4476
M204 S6000
G1 X131.126 Y138.964 E.11098
M204 S10000
G1 X126.355 Y140.03 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50537
G1 F4476
M204 S6000
G1 X126.538 Y140.004 E.00695
; LINE_WIDTH: 0.532108
G1 X126.6 Y139.97 E.00283
; LINE_WIDTH: 0.582083
G1 X126.663 Y139.937 E.00312
; LINE_WIDTH: 0.632058
G1 X126.726 Y139.903 E.00341
; LINE_WIDTH: 0.706406
G1 X126.788 Y139.87 E.00384
G1 X130.569 Y139.372 E.20615
; LINE_WIDTH: 0.686356
G1 X130.632 Y139.384 E.00338
; LINE_WIDTH: 0.645668
G1 X130.696 Y139.397 E.00317
; LINE_WIDTH: 0.60498
G1 X130.759 Y139.409 E.00295
; LINE_WIDTH: 0.564292
G1 X130.822 Y139.421 E.00274
; LINE_WIDTH: 0.512049
G2 X130.969 Y139.422 I.075 J-.221 E.00573
M204 S10000
G1 X126.144 Y139.62 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192595
G1 F4476
M204 S6000
G1 X124.781 Y129.263 E.12741
M204 S10000
G1 X125.252 Y129.147 F42000
; LINE_WIDTH: 0.42948
G1 F4476
M204 S6000
G1 X125.451 Y129.147 E.00627
; LINE_WIDTH: 0.385139
G1 X125.65 Y129.147 E.00555
; LINE_WIDTH: 0.340798
G1 X125.849 Y129.147 E.00483
; LINE_WIDTH: 0.296458
G1 X126.048 Y129.147 E.00411
; LINE_WIDTH: 0.252117
G1 X126.247 Y129.147 E.00339
; LINE_WIDTH: 0.207776
G1 X126.446 Y129.147 E.00267
; LINE_WIDTH: 0.163435
G1 X126.645 Y129.147 E.00195
; LINE_WIDTH: 0.119094
G1 X126.844 Y129.147 E.00124
; WIPE_START
G1 F15000
G1 X126.645 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.966 Y129.147 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.507814
G1 F4476
M204 S6000
G1 X128.292 Y129.147 E.01236
; LINE_WIDTH: 0.458941
G1 X128.618 Y129.147 E.01106
; LINE_WIDTH: 0.410067
G1 X128.945 Y129.147 E.00976
; WIPE_START
G1 F9805.341
G1 X128.618 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.857 Y126.678 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.192577
G1 F4476
M204 S6000
G1 X131.002 Y117.978 E.10701
; WIPE_START
G1 F15000
G1 X130.741 Y119.961 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.764 Y117.265 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.480855
G1 F4476
M204 S6000
G1 X131.975 Y115.665 E.05759
; WIPE_START
G1 F8220.399
G1 X131.764 Y117.265 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.02 Y117.322 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.192587
G1 F4476
M204 S6000
G1 X124.875 Y126.022 E.10702
; WIPE_START
G1 F15000
G1 X125.136 Y124.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.113 Y126.735 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.466963
G1 F4476
M204 S6000
G2 X124.017 Y127.596 I18.559 J2.495 E.02993
; LINE_WIDTH: 0.423328
G1 X123.986 Y128 E.01256
; LINE_WIDTH: 0.387797
G1 X123.968 Y128.342 E.00962
; WIPE_START
G1 F10438.528
G1 X123.986 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.957 Y120.429 Z5.2 F42000
G1 X125.469 Y116.436 Z5.2
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.480865
G1 F4476
M204 S6000
G1 X125.679 Y114.835 E.05761
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.221
G1 X125.469 Y116.436 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/73
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z5.2 I-1.159 J.37 P1  F42000
G1 X129.708 Y129.706 Z5.2
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4476
M204 S6000
G1 X130.197 Y129.77 E.01635
G1 X131.515 Y139.788 E.33516
G1 X125.982 Y140.517 E.18516
G1 X124.467 Y129.016 E.38478
G1 X125.039 Y129.091 E.01912
G1 X126.394 Y139.382 E.3443
G1 X130.824 Y138.799 E.14822
G1 X129.625 Y129.695 E.30459
G1 X129.648 Y129.698 E.00077
; WIPE_START
G1 F8843.478
G1 X130.197 Y129.77 E-.21016
G1 X130.386 Y131.205 E-.54984
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.899 Y129.501 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F4476
M204 S6000
G1 X125.51 Y129.552 E.01301
G1 X126.744 Y138.925 E.31361
G1 X130.367 Y138.448 E.12121
G1 X129.152 Y129.222 E.30868
G1 X130.15 Y129.354 E.03337
G1 X130.244 Y128.638 E.02395
G1 X130.458 Y128.638 E.0071
G1 X131.972 Y140.138 E.38478
G1 X125.631 Y140.973 E.21216
G1 X124.083 Y129.217 E.39334
G3 X124.021 Y128.547 I7.646 J-1.044 E.02233
G1 X127.769 Y129.04 E.1254
G1 X127.769 Y129.254 E.0071
G1 X125.958 Y129.493 E.0606
M204 S250
G1 X125.95 Y129.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4476
M204 S5000
G1 X128.191 Y129.594 E.06946
G1 X128.795 Y129.515 E.01873
G1 X129.927 Y138.111 E.26641
G1 X127.082 Y138.485 E.08819
G1 X125.958 Y129.949 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.933 Y129.635 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.812 Y128.914 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F4476
M204 S5000
G1 X124.339 Y128.193 E.16961
G1 X124.449 Y127.36 E.02583
G1 X124.499 Y126.984 E.01165
G1 X129.971 Y127.704 E.16961
G1 X129.82 Y128.854 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.834 Y128.615 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.065 Y121.315 Z5.4 F42000
G1 X131.378 Y117.016 Z5.4
G1 Z5
G1 E.8 F1800
G1 F4476
M204 S5000
G1 X125.906 Y116.296 E.16961
G1 X126.015 Y115.462 E.02583
G1 X126.065 Y115.086 E.01165
G1 X131.538 Y115.807 E.16961
G1 X131.386 Y116.957 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.401 Y116.717 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.978 Y117.501 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4476
M204 S6000
G1 X130.367 Y117.552 E.01301
G1 X129.133 Y126.925 E.31361
G1 X125.51 Y126.448 E.12121
G1 X126.326 Y120.25 E.20737
G1 X126.744 Y117.075 E.10624
G1 X129.919 Y117.493 E.10622
M204 S250
G1 X129.927 Y117.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4476
M204 S5000
G1 X128.795 Y126.485 E.2664
G1 X125.95 Y126.111 E.08819
G1 X126.715 Y120.301 E.18004
G1 X127.082 Y117.515 E.08636
G1 X129.868 Y117.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.62 Y119.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.289 Y117.41 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4476
M204 S6000
G1 X125.124 Y126.26 E.29609
G1 X124.572 Y126.187 E.01847
G1 X125.771 Y117.084 E.30458
G1 X126.323 Y117.157 E.01847
G1 X126.297 Y117.351 E.0065
; WIPE_START
G1 F8843.478
G1 X126.036 Y119.334 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.274 Y117.809 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F4476
M204 S6000
G1 X131.305 Y117.813 E.00102
G1 X130.106 Y126.916 E.30457
G1 X129.554 Y126.843 E.01847
G1 X130.753 Y117.74 E.30457
G1 X131.215 Y117.801 E.01545
M204 S10000
G1 X131.327 Y117.405 F42000
G1 F4476
M204 S6000
G1 X131.761 Y117.462 E.01453
G1 X130.457 Y127.373 E.33158
G1 X124.116 Y126.538 E.21216
G1 X125.42 Y116.627 E.33158
G1 X131.268 Y117.397 E.19565
; WIPE_START
G1 F8843.478
G1 X131.761 Y117.462 E-.18922
G1 X131.565 Y118.951 E-.57078
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.928 Y126.557 Z5.4 F42000
G1 X130.798 Y128.107 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4476
M204 S5000
G1 X130.812 Y128.32 E.00656
G1 X132.386 Y140.28 E.37068
G3 X132.228 Y140.5 I-.19 J.03 E.00924
G1 X125.489 Y141.387 E.20884
G3 X125.268 Y141.216 I-.03 J-.191 E.00964
G1 X123.694 Y129.264 E.37042
G3 X123.694 Y126.736 I10.795 J-1.264 E.07786
G1 X125.267 Y114.785 E.37038
G3 X125.489 Y114.613 I.192 J.018 E.00968
G1 X132.231 Y115.501 E.20894
G3 X132.386 Y115.722 I-.038 J.192 E.00919
G1 X130.812 Y127.68 E.3706
G2 X130.793 Y128 I2.785 J.32 E.00985
G1 X130.795 Y128.047 E.00144
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.812 Y128.32 E-.10389
G1 X131.037 Y130.032 E-.65611
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.4
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5.4 F4000
            G39.3 S1
            G0 Z5.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X129.938 Y129.942 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192584
G1 F4476
M204 S6000
G1 X131.126 Y138.964 E.11098
M204 S10000
G1 X126.355 Y140.03 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50539
G1 F4476
M204 S6000
G1 X126.538 Y140.004 E.00695
; LINE_WIDTH: 0.532125
G1 X126.6 Y139.97 E.00283
; LINE_WIDTH: 0.582095
G1 X126.663 Y139.937 E.00312
; LINE_WIDTH: 0.632065
G1 X126.726 Y139.903 E.00341
; LINE_WIDTH: 0.706406
G1 X126.788 Y139.87 E.00384
G1 X130.569 Y139.372 E.20615
; LINE_WIDTH: 0.686356
G1 X130.632 Y139.384 E.00338
; LINE_WIDTH: 0.645668
G1 X130.696 Y139.397 E.00317
; LINE_WIDTH: 0.60498
G1 X130.759 Y139.409 E.00295
; LINE_WIDTH: 0.564292
G1 X130.822 Y139.421 E.00274
; LINE_WIDTH: 0.512049
G2 X130.969 Y139.422 I.075 J-.221 E.00573
M204 S10000
M73 P55 R8
G1 X126.144 Y139.62 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192606
G1 F4476
M204 S6000
G1 X124.781 Y129.263 E.12742
M204 S10000
G1 X125.252 Y129.147 F42000
; LINE_WIDTH: 0.429479
G1 F4476
M204 S6000
G1 X125.451 Y129.147 E.00627
; LINE_WIDTH: 0.385138
G1 X125.65 Y129.147 E.00555
; LINE_WIDTH: 0.340797
G1 X125.849 Y129.147 E.00483
; LINE_WIDTH: 0.296457
G1 X126.048 Y129.147 E.00411
; LINE_WIDTH: 0.252116
G1 X126.247 Y129.147 E.00339
; LINE_WIDTH: 0.207775
G1 X126.446 Y129.147 E.00267
; LINE_WIDTH: 0.163435
G1 X126.645 Y129.147 E.00195
; LINE_WIDTH: 0.119094
G1 X126.844 Y129.147 E.00124
; WIPE_START
G1 F15000
G1 X126.645 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.966 Y129.147 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.507809
G1 F4476
M204 S6000
G1 X128.292 Y129.147 E.01236
; LINE_WIDTH: 0.458936
G1 X128.618 Y129.147 E.01106
; LINE_WIDTH: 0.410063
G1 X128.945 Y129.147 E.00976
; WIPE_START
G1 F9805.443
G1 X128.618 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.857 Y126.678 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.192586
G1 F4476
M204 S6000
G1 X131.002 Y117.978 E.10701
; WIPE_START
G1 F15000
G1 X130.741 Y119.961 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.764 Y117.265 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F4476
M204 S6000
G1 X131.975 Y115.665 E.0576
; WIPE_START
G1 F8220.316
G1 X131.764 Y117.265 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.02 Y117.322 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.192587
G1 F4476
M204 S6000
G1 X124.875 Y126.022 E.10702
; WIPE_START
G1 F15000
G1 X125.136 Y124.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.113 Y126.735 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.466948
G1 F4476
M204 S6000
G2 X124.017 Y127.596 I18.539 J2.492 E.02993
; LINE_WIDTH: 0.423325
G1 X123.986 Y128 E.01256
; LINE_WIDTH: 0.387811
G1 X123.968 Y128.342 E.00962
; WIPE_START
G1 F10438.106
G1 X123.986 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.957 Y120.429 Z5.4 F42000
G1 X125.469 Y116.436 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.480853
G1 F4476
M204 S6000
G1 X125.679 Y114.835 E.05761
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.439
G1 X125.469 Y116.436 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/73
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z5.4 I-1.159 J.37 P1  F42000
G1 X129.708 Y129.706 Z5.4
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4476
M204 S6000
G1 X130.197 Y129.77 E.01635
G1 X131.515 Y139.788 E.33516
G1 X125.982 Y140.517 E.18516
G1 X124.467 Y129.016 E.38478
G1 X125.039 Y129.091 E.01912
G1 X126.394 Y139.382 E.3443
G1 X130.824 Y138.799 E.14822
G1 X129.625 Y129.695 E.30459
G1 X129.648 Y129.698 E.00077
; WIPE_START
G1 F8843.478
G1 X130.197 Y129.77 E-.21016
G1 X130.386 Y131.205 E-.54984
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.899 Y129.501 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F4476
M204 S6000
G1 X125.51 Y129.552 E.01301
G1 X126.744 Y138.925 E.31361
G1 X130.367 Y138.448 E.12121
G1 X129.152 Y129.222 E.30868
G1 X130.15 Y129.354 E.03337
G1 X130.244 Y128.638 E.02395
G1 X130.458 Y128.638 E.0071
G1 X131.972 Y140.138 E.38478
G1 X125.631 Y140.973 E.21216
G1 X124.083 Y129.217 E.39334
G3 X124.021 Y128.547 I7.644 J-1.044 E.02234
G1 X127.769 Y129.04 E.1254
G1 X127.769 Y129.254 E.0071
G1 X125.958 Y129.493 E.0606
M204 S250
G1 X125.95 Y129.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4476
M204 S5000
G1 X128.138 Y129.601 E.06782
G1 X128.795 Y129.515 E.02036
G1 X129.927 Y138.111 E.2664
G1 X127.082 Y138.485 E.08819
G1 X125.958 Y129.949 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.933 Y129.634 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.812 Y128.914 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F4476
M204 S5000
G1 X124.339 Y128.193 E.16961
G1 X124.453 Y127.329 E.02678
G1 X124.499 Y126.984 E.01071
G1 X129.971 Y127.704 E.16961
G1 X129.82 Y128.854 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.834 Y128.615 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.065 Y121.315 Z5.6 F42000
G1 X131.378 Y117.016 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F4476
M204 S5000
G1 X125.906 Y116.296 E.16961
G1 X126.019 Y115.432 E.02678
G1 X126.065 Y115.086 E.01071
G1 X131.538 Y115.807 E.16961
G1 X131.386 Y116.957 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.401 Y116.717 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.978 Y117.501 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4476
M204 S6000
G1 X130.367 Y117.552 E.01301
G1 X129.133 Y126.925 E.31361
G1 X125.51 Y126.448 E.12121
G1 X126.303 Y120.428 E.20143
G1 X126.744 Y117.075 E.11219
G1 X129.919 Y117.493 E.10622
M204 S250
G1 X129.927 Y117.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4476
M204 S5000
G1 X128.795 Y126.485 E.2664
G1 X125.95 Y126.111 E.08819
G1 X126.691 Y120.479 E.17453
G1 X127.082 Y117.515 E.09187
G1 X129.868 Y117.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.62 Y119.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.289 Y117.41 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4476
M204 S6000
G1 X125.124 Y126.26 E.29609
G1 X124.572 Y126.187 E.01847
G1 X125.771 Y117.084 E.30457
G1 X126.323 Y117.157 E.01847
G1 X126.297 Y117.351 E.0065
; WIPE_START
G1 F8843.478
G1 X126.036 Y119.334 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.274 Y117.809 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F4476
M204 S6000
G1 X131.305 Y117.813 E.00102
G1 X130.106 Y126.916 E.30457
G1 X129.554 Y126.843 E.01847
G1 X130.753 Y117.74 E.30457
G1 X131.215 Y117.801 E.01545
M204 S10000
G1 X131.327 Y117.405 F42000
G1 F4476
M204 S6000
G1 X131.761 Y117.462 E.01453
G1 X130.457 Y127.373 E.33158
G1 X124.116 Y126.538 E.21216
G1 X125.42 Y116.627 E.33158
G1 X131.268 Y117.397 E.19565
; WIPE_START
G1 F8843.478
G1 X131.761 Y117.462 E-.18922
G1 X131.565 Y118.951 E-.57078
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.929 Y126.557 Z5.6 F42000
G1 X130.799 Y128.118 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4476
M204 S5000
G1 X130.812 Y128.32 E.00623
G1 X132.386 Y140.28 E.37066
G3 X132.229 Y140.5 I-.19 J.03 E.00919
G1 X125.49 Y141.387 E.20888
G3 X125.267 Y141.215 I-.029 J-.192 E.00967
G1 X123.694 Y129.264 E.37038
G3 X123.694 Y126.736 I10.794 J-1.264 E.07786
G1 X125.268 Y114.784 E.37043
G3 X125.489 Y114.613 I.194 J.021 E.0096
G1 X132.275 Y115.514 E.21034
G3 X132.386 Y115.722 I-.087 J.18 E.00777
G1 X130.812 Y127.679 E.37056
G2 X130.797 Y127.999 I3.409 J.321 E.00986
G1 X130.798 Y128.058 E.0018
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.812 Y128.32 E-.09988
G1 X131.039 Y130.043 E-.66012
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.6
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5.6 F4000
            G39.3 S1
            G0 Z5.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X129.938 Y129.942 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192595
G1 F4476
M204 S6000
G1 X131.126 Y138.964 E.11099
M204 S10000
G1 X126.355 Y140.03 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50537
G1 F4476
M204 S6000
G1 X126.538 Y140.004 E.00695
; LINE_WIDTH: 0.532108
G1 X126.6 Y139.97 E.00283
; LINE_WIDTH: 0.582083
G1 X126.663 Y139.937 E.00312
; LINE_WIDTH: 0.632058
G1 X126.726 Y139.903 E.00341
; LINE_WIDTH: 0.706406
G1 X126.788 Y139.87 E.00384
G1 X130.569 Y139.372 E.20615
; LINE_WIDTH: 0.686354
G1 X130.632 Y139.384 E.00338
; LINE_WIDTH: 0.645662
G1 X130.695 Y139.397 E.00317
; LINE_WIDTH: 0.60497
G1 X130.759 Y139.409 E.00295
; LINE_WIDTH: 0.564278
G1 X130.822 Y139.421 E.00274
; LINE_WIDTH: 0.512035
G2 X130.969 Y139.422 I.075 J-.221 E.00573
M204 S10000
G1 X126.144 Y139.62 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192595
G1 F4476
M204 S6000
G1 X124.781 Y129.263 E.12741
M204 S10000
G1 X125.252 Y129.147 F42000
; LINE_WIDTH: 0.429495
G1 F4476
M204 S6000
G1 X125.451 Y129.147 E.00627
; LINE_WIDTH: 0.385153
G1 X125.65 Y129.147 E.00555
; LINE_WIDTH: 0.34081
G1 X125.849 Y129.147 E.00483
; LINE_WIDTH: 0.296467
G1 X126.048 Y129.147 E.00411
; LINE_WIDTH: 0.252124
G1 X126.247 Y129.147 E.00339
; LINE_WIDTH: 0.207781
G1 X126.446 Y129.147 E.00267
; LINE_WIDTH: 0.163438
G1 X126.645 Y129.147 E.00195
; LINE_WIDTH: 0.119095
G1 X126.844 Y129.147 E.00124
; WIPE_START
G1 F15000
G1 X126.645 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.966 Y129.147 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.507816
G1 F4476
M204 S6000
G1 X128.292 Y129.147 E.01236
; LINE_WIDTH: 0.45895
G1 X128.618 Y129.147 E.01106
; LINE_WIDTH: 0.410083
M73 P56 R8
G1 X128.945 Y129.147 E.00976
; WIPE_START
G1 F9804.914
G1 X128.618 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.857 Y126.678 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.192586
G1 F4476
M204 S6000
G1 X131.002 Y117.978 E.10701
; WIPE_START
G1 F15000
G1 X130.741 Y119.961 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.764 Y117.265 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.480854
G1 F4476
M204 S6000
G1 X131.975 Y115.665 E.05759
; WIPE_START
G1 F8220.423
G1 X131.764 Y117.265 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.02 Y117.322 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.192587
G1 F4476
M204 S6000
G1 X124.875 Y126.022 E.10702
; WIPE_START
G1 F15000
G1 X125.136 Y124.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.113 Y126.735 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.466962
G1 F4476
M204 S6000
G2 X124.017 Y127.596 I18.561 J2.495 E.02993
; LINE_WIDTH: 0.423327
G1 X123.986 Y128 E.01256
; LINE_WIDTH: 0.387795
G1 X123.968 Y128.342 E.00962
; WIPE_START
G1 F10438.566
G1 X123.986 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.957 Y120.429 Z5.6 F42000
G1 X125.469 Y116.436 Z5.6
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.480853
G1 F4476
M204 S6000
G1 X125.679 Y114.835 E.05761
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.445
G1 X125.469 Y116.436 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/73
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z5.6 I-1.159 J.37 P1  F42000
G1 X129.708 Y129.706 Z5.6
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4476
M204 S6000
G1 X130.197 Y129.77 E.01635
G1 X131.515 Y139.788 E.33516
G1 X125.982 Y140.517 E.18516
G1 X124.467 Y129.016 E.38478
G1 X125.039 Y129.091 E.01912
G1 X126.394 Y139.382 E.3443
G1 X130.824 Y138.799 E.14822
G1 X129.625 Y129.695 E.30458
G1 X129.648 Y129.698 E.00077
; WIPE_START
G1 F8843.478
G1 X130.197 Y129.77 E-.21015
G1 X130.386 Y131.205 E-.54985
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.899 Y129.501 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
G1 F4476
M204 S6000
G1 X125.51 Y129.552 E.01301
G1 X126.744 Y138.925 E.31361
G1 X130.367 Y138.448 E.12121
G1 X129.152 Y129.222 E.30868
G1 X130.15 Y129.354 E.03337
G1 X130.244 Y128.638 E.02395
G1 X130.458 Y128.638 E.0071
G1 X131.972 Y140.138 E.38478
G1 X125.631 Y140.973 E.21216
G1 X124.083 Y129.217 E.39334
G3 X124.021 Y128.547 I7.643 J-1.044 E.02233
G1 X127.769 Y129.04 E.1254
G1 X127.769 Y129.254 E.0071
G1 X125.958 Y129.493 E.0606
M204 S250
G1 X125.95 Y129.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4476
M204 S5000
G1 X128.086 Y129.608 E.06619
G1 X128.795 Y129.515 E.022
G1 X129.927 Y138.111 E.2664
G1 X127.082 Y138.485 E.08819
G1 X125.958 Y129.949 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.933 Y129.633 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.812 Y128.914 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
G1 F4476
M204 S5000
G1 X124.339 Y128.193 E.16961
G1 X124.457 Y127.299 E.02773
G1 X124.499 Y126.984 E.00976
G1 X129.971 Y127.704 E.16961
G1 X129.82 Y128.854 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.834 Y128.615 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.065 Y121.315 Z5.8 F42000
G1 X131.378 Y117.016 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F4476
M204 S5000
G1 X125.906 Y116.296 E.16961
G1 X126.023 Y115.401 E.02773
G1 X126.065 Y115.086 E.00976
G1 X131.538 Y115.807 E.16961
G1 X131.386 Y116.957 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.401 Y116.717 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.978 Y117.501 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4476
M204 S6000
G1 X130.367 Y117.552 E.01301
G1 X129.133 Y126.925 E.31361
G1 X125.51 Y126.448 E.12121
G1 X126.279 Y120.606 E.19548
G1 X126.744 Y117.075 E.11813
G1 X129.919 Y117.493 E.10622
M204 S250
G1 X129.927 Y117.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4476
M204 S5000
G1 X128.795 Y126.485 E.2664
G1 X125.95 Y126.111 E.08819
G1 X126.668 Y120.657 E.16902
G1 X127.082 Y117.515 E.09738
G1 X129.868 Y117.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.62 Y119.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.289 Y117.41 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4476
M204 S6000
G1 X125.124 Y126.26 E.29609
G1 X124.572 Y126.187 E.01847
G1 X125.771 Y117.084 E.30457
G1 X126.323 Y117.157 E.01847
G1 X126.297 Y117.351 E.0065
; WIPE_START
G1 F8843.478
G1 X126.036 Y119.334 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.274 Y117.809 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
G1 F4476
M204 S6000
G1 X131.305 Y117.813 E.00102
G1 X130.106 Y126.916 E.30457
G1 X129.554 Y126.843 E.01847
G1 X130.753 Y117.74 E.30457
G1 X131.215 Y117.801 E.01545
M204 S10000
G1 X131.327 Y117.405 F42000
G1 F4476
M204 S6000
G1 X131.761 Y117.462 E.01453
G1 X130.457 Y127.373 E.33158
G1 X124.116 Y126.538 E.21216
G1 X125.42 Y116.627 E.33158
G1 X131.268 Y117.397 E.19565
; WIPE_START
G1 F8843.478
G1 X131.761 Y117.462 E-.18922
G1 X131.565 Y118.951 E-.57079
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.93 Y126.557 Z5.8 F42000
G1 X130.799 Y128.128 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4476
M204 S5000
G1 X130.812 Y128.322 E.00599
G1 X132.386 Y140.28 E.3706
G3 X132.228 Y140.5 I-.191 J.029 E.00923
G1 X125.49 Y141.387 E.20883
G3 X125.268 Y141.216 I-.029 J-.193 E.00962
G1 X123.694 Y129.264 E.37042
G3 X123.694 Y126.736 I10.794 J-1.264 E.07786
G1 X125.267 Y114.786 E.37037
G3 X125.489 Y114.613 I.194 J.02 E.00965
G1 X132.23 Y115.501 E.20893
G3 X132.386 Y115.722 I-.036 J.191 E.00923
G1 X130.812 Y127.678 E.37052
G2 X130.8 Y128 I4.385 J.322 E.00991
G1 X130.8 Y128.068 E.00208
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.812 Y128.322 E-.0968
G1 X131.04 Y130.053 E-.6632
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.8
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5.8 F4000
            G39.3 S1
            G0 Z5.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X129.938 Y129.942 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192595
G1 F4476
M204 S6000
G1 X131.126 Y138.964 E.11099
M204 S10000
G1 X126.355 Y140.03 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50536
G1 F4476
M204 S6000
G1 X126.538 Y140.004 E.00695
; LINE_WIDTH: 0.53209
G1 X126.6 Y139.97 E.00283
; LINE_WIDTH: 0.58207
G1 X126.663 Y139.937 E.00312
; LINE_WIDTH: 0.63205
G1 X126.726 Y139.903 E.00341
; LINE_WIDTH: 0.706416
G1 X126.788 Y139.87 E.00384
G1 X130.569 Y139.372 E.20616
; LINE_WIDTH: 0.686378
G1 X130.632 Y139.384 E.00338
; LINE_WIDTH: 0.645694
G1 X130.695 Y139.397 E.00317
; LINE_WIDTH: 0.60501
G1 X130.759 Y139.409 E.00295
; LINE_WIDTH: 0.564326
G1 X130.822 Y139.421 E.00274
; LINE_WIDTH: 0.51209
G2 X130.969 Y139.422 I.075 J-.221 E.00573
M204 S10000
G1 X126.144 Y139.62 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192606
G1 F4476
M204 S6000
G1 X124.781 Y129.263 E.12742
M204 S10000
G1 X125.252 Y129.147 F42000
; LINE_WIDTH: 0.429481
G1 F4476
M204 S6000
G1 X125.451 Y129.147 E.00627
; LINE_WIDTH: 0.38514
G1 X125.65 Y129.147 E.00555
; LINE_WIDTH: 0.340799
G1 X125.849 Y129.147 E.00483
; LINE_WIDTH: 0.296458
G1 X126.048 Y129.147 E.00411
; LINE_WIDTH: 0.252117
G1 X126.247 Y129.147 E.00339
; LINE_WIDTH: 0.207776
G1 X126.446 Y129.147 E.00267
; LINE_WIDTH: 0.163435
G1 X126.645 Y129.147 E.00195
; LINE_WIDTH: 0.119094
G1 X126.844 Y129.147 E.00124
; WIPE_START
G1 F15000
G1 X126.645 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.966 Y129.147 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.507817
G1 F4476
M204 S6000
G1 X128.292 Y129.147 E.01236
; LINE_WIDTH: 0.45895
G1 X128.618 Y129.147 E.01106
; LINE_WIDTH: 0.410083
G1 X128.945 Y129.147 E.00976
; WIPE_START
G1 F9804.921
G1 X128.618 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.857 Y126.678 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.192577
G1 F4476
M204 S6000
G1 X131.002 Y117.978 E.10701
; WIPE_START
G1 F15000
G1 X130.741 Y119.961 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.764 Y117.265 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.480848
G1 F4476
M204 S6000
G1 X131.975 Y115.665 E.05759
; WIPE_START
G1 F8220.534
G1 X131.764 Y117.265 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.02 Y117.322 Z5.8 F42000
M73 P57 R8
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.192587
G1 F4476
M204 S6000
G1 X124.875 Y126.022 E.10701
; WIPE_START
G1 F15000
G1 X125.136 Y124.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.113 Y126.735 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.466948
G1 F4476
M204 S6000
G2 X124.017 Y127.596 I18.541 J2.492 E.02993
; LINE_WIDTH: 0.423325
G1 X123.986 Y128 E.01256
; LINE_WIDTH: 0.387816
G1 X123.968 Y128.342 E.00962
; WIPE_START
G1 F10437.947
G1 X123.986 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.957 Y120.429 Z5.8 F42000
G1 X125.469 Y116.436 Z5.8
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.480852
G1 F4476
M204 S6000
G1 X125.679 Y114.835 E.05761
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.467
G1 X125.469 Y116.436 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/73
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z5.8 I-1.159 J.37 P1  F42000
G1 X129.708 Y129.706 Z5.8
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4476
M204 S6000
G1 X130.197 Y129.77 E.01635
G1 X131.515 Y139.788 E.33516
G1 X125.982 Y140.517 E.18516
G1 X124.467 Y129.016 E.38478
G1 X125.039 Y129.091 E.01912
G1 X126.394 Y139.382 E.3443
G1 X130.824 Y138.799 E.14822
G1 X129.625 Y129.695 E.30458
G1 X129.648 Y129.698 E.00077
; WIPE_START
G1 F8843.478
G1 X130.197 Y129.77 E-.21016
G1 X130.386 Y131.205 E-.54984
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.899 Y129.501 Z6 F42000
G1 Z5.6
G1 E.8 F1800
G1 F4476
M204 S6000
G1 X125.51 Y129.552 E.01301
G1 X126.744 Y138.925 E.31361
G1 X130.367 Y138.448 E.12121
G1 X129.152 Y129.222 E.30868
G1 X130.15 Y129.354 E.03337
G1 X130.244 Y128.638 E.02395
G1 X130.458 Y128.638 E.0071
G1 X131.972 Y140.138 E.38478
G1 X125.631 Y140.973 E.21216
G1 X124.083 Y129.217 E.39334
G3 X124.021 Y128.547 I7.646 J-1.044 E.02233
G1 X127.769 Y129.04 E.1254
G1 X127.769 Y129.254 E.0071
G1 X125.958 Y129.493 E.0606
M204 S250
G1 X125.95 Y129.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4476
M204 S5000
G1 X128.033 Y129.615 E.06455
G1 X128.795 Y129.515 E.02364
G1 X129.927 Y138.111 E.2664
G1 X127.082 Y138.485 E.08819
G1 X125.958 Y129.949 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.932 Y129.631 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.812 Y128.914 Z6 F42000
G1 Z5.6
G1 E.8 F1800
G1 F4476
M204 S5000
G1 X124.339 Y128.193 E.16961
G1 X124.461 Y127.268 E.02867
G1 X124.499 Y126.984 E.00882
G1 X129.971 Y127.704 E.16961
G1 X129.82 Y128.854 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.834 Y128.615 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.065 Y121.315 Z6 F42000
G1 X131.378 Y117.016 Z6
G1 Z5.6
G1 E.8 F1800
G1 F4476
M204 S5000
G1 X125.906 Y116.296 E.16961
G1 X126.027 Y115.371 E.02867
G1 X126.065 Y115.086 E.00882
G1 X131.538 Y115.807 E.16961
G1 X131.386 Y116.957 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.401 Y116.717 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.978 Y117.501 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4476
M204 S6000
G1 X130.367 Y117.552 E.01301
G1 X129.133 Y126.925 E.31361
G1 X125.51 Y126.448 E.12121
G1 X126.256 Y120.784 E.18953
G1 X126.744 Y117.075 E.12408
G1 X129.919 Y117.493 E.10622
M204 S250
G1 X129.927 Y117.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4476
M204 S5000
G1 X128.795 Y126.485 E.2664
G1 X125.95 Y126.111 E.08819
G1 X126.645 Y120.835 E.16351
G1 X127.082 Y117.515 E.10289
G1 X129.868 Y117.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.62 Y119.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.289 Y117.41 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4476
M204 S6000
G1 X125.124 Y126.26 E.29609
G1 X124.572 Y126.187 E.01847
G1 X125.771 Y117.084 E.30457
G1 X126.323 Y117.157 E.01847
G1 X126.297 Y117.351 E.0065
; WIPE_START
G1 F8843.478
G1 X126.036 Y119.334 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.274 Y117.809 Z6 F42000
G1 Z5.6
G1 E.8 F1800
G1 F4476
M204 S6000
G1 X131.305 Y117.813 E.00102
G1 X130.106 Y126.916 E.30457
G1 X129.554 Y126.843 E.01847
G1 X130.753 Y117.74 E.30457
G1 X131.215 Y117.801 E.01545
M204 S10000
G1 X131.327 Y117.405 F42000
G1 F4476
M204 S6000
G1 X131.761 Y117.462 E.01453
G1 X130.457 Y127.373 E.33158
G1 X124.116 Y126.538 E.21216
G1 X125.42 Y116.627 E.33158
G1 X131.268 Y117.397 E.19565
; WIPE_START
G1 F8843.478
G1 X131.761 Y117.462 E-.18922
G1 X131.565 Y118.951 E-.57078
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.931 Y126.558 Z6 F42000
G1 X130.8 Y128.136 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4476
M204 S5000
G1 X130.812 Y128.32 E.00567
G1 X132.386 Y140.28 E.37066
G3 X132.228 Y140.5 I-.19 J.03 E.00925
G1 X125.49 Y141.387 E.20883
G3 X125.268 Y141.216 I-.03 J-.191 E.00965
G1 X123.694 Y129.264 E.37042
G3 X123.694 Y126.736 I10.795 J-1.264 E.07786
G1 X125.268 Y114.784 E.37042
G3 X125.489 Y114.613 I.194 J.021 E.0096
G1 X132.23 Y115.501 E.20894
G3 X132.386 Y115.722 I-.038 J.192 E.0092
G1 X130.812 Y127.678 E.37053
G2 X130.798 Y127.999 I3.684 J.323 E.00988
G1 X130.799 Y128.076 E.00238
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.812 Y128.32 E-.09285
G1 X131.041 Y130.061 E-.66715
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6 F4000
            G39.3 S1
            G0 Z6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X129.938 Y129.942 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192595
G1 F4476
M204 S6000
G1 X131.126 Y138.964 E.11099
M204 S10000
G1 X126.355 Y140.03 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50536
G1 F4476
M204 S6000
G1 X126.538 Y140.004 E.00695
; LINE_WIDTH: 0.53209
G1 X126.6 Y139.97 E.00283
; LINE_WIDTH: 0.58207
G1 X126.663 Y139.937 E.00312
; LINE_WIDTH: 0.63205
G1 X126.726 Y139.903 E.00341
; LINE_WIDTH: 0.706426
G1 X126.788 Y139.87 E.00384
G1 X130.569 Y139.372 E.20616
; LINE_WIDTH: 0.686396
G1 X130.632 Y139.384 E.00338
; LINE_WIDTH: 0.645708
G1 X130.695 Y139.397 E.00317
; LINE_WIDTH: 0.60502
G1 X130.759 Y139.409 E.00295
; LINE_WIDTH: 0.564332
G1 X130.822 Y139.421 E.00274
; LINE_WIDTH: 0.51209
G2 X130.969 Y139.422 I.075 J-.221 E.00573
M204 S10000
G1 X126.144 Y139.62 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192606
G1 F4476
M204 S6000
G1 X124.781 Y129.263 E.12742
M204 S10000
G1 X125.252 Y129.147 F42000
; LINE_WIDTH: 0.429476
G1 F4476
M204 S6000
G1 X125.451 Y129.147 E.00627
; LINE_WIDTH: 0.385136
G1 X125.65 Y129.147 E.00555
; LINE_WIDTH: 0.340795
G1 X125.849 Y129.147 E.00483
; LINE_WIDTH: 0.296455
G1 X126.048 Y129.147 E.00411
; LINE_WIDTH: 0.252115
G1 X126.247 Y129.147 E.00339
; LINE_WIDTH: 0.207774
G1 X126.446 Y129.147 E.00267
; LINE_WIDTH: 0.163434
G1 X126.645 Y129.147 E.00195
; LINE_WIDTH: 0.119093
G1 X126.844 Y129.147 E.00124
; WIPE_START
G1 F15000
G1 X126.645 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.966 Y129.147 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.507829
G1 F4476
M204 S6000
G1 X128.292 Y129.147 E.01236
; LINE_WIDTH: 0.458957
G1 X128.618 Y129.147 E.01106
; LINE_WIDTH: 0.410085
G1 X128.945 Y129.147 E.00976
; WIPE_START
G1 F9804.855
G1 X128.618 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.857 Y126.678 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.192586
G1 F4476
M204 S6000
G1 X131.002 Y117.978 E.10701
; WIPE_START
G1 F15000
G1 X130.741 Y119.961 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.764 Y117.265 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.480853
G1 F4476
M204 S6000
G1 X131.975 Y115.665 E.05759
; WIPE_START
G1 F8220.437
G1 X131.764 Y117.265 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.02 Y117.322 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.192586
G1 F4476
M204 S6000
G1 X124.875 Y126.022 E.10701
; WIPE_START
G1 F15000
G1 X125.136 Y124.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.113 Y126.735 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.466921
G1 F4476
M204 S6000
G2 X124.017 Y127.596 I18.573 J2.496 E.02993
; LINE_WIDTH: 0.4233
G1 X123.986 Y128 E.01256
; LINE_WIDTH: 0.387804
G1 X123.968 Y128.342 E.00962
; WIPE_START
M73 P58 R8
G1 F10438.304
G1 X123.986 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.957 Y120.429 Z6 F42000
G1 X125.469 Y116.436 Z6
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.480845
G1 F4476
M204 S6000
G1 X125.679 Y114.835 E.05761
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.6
G1 X125.469 Y116.436 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/73
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z6 I-1.159 J.37 P1  F42000
G1 X129.708 Y129.706 Z6
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4476
M204 S6000
G1 X130.197 Y129.77 E.01635
G1 X131.515 Y139.788 E.33516
G1 X125.982 Y140.517 E.18516
G1 X124.467 Y129.016 E.38478
G1 X125.039 Y129.091 E.01912
G1 X126.394 Y139.382 E.3443
G1 X130.824 Y138.799 E.14822
G1 X129.625 Y129.695 E.30459
G1 X129.648 Y129.698 E.00077
; WIPE_START
G1 F8843.478
G1 X130.197 Y129.77 E-.21015
G1 X130.386 Y131.205 E-.54985
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.899 Y129.501 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
G1 F4476
M204 S6000
G1 X125.51 Y129.552 E.01301
G1 X126.744 Y138.925 E.31361
G1 X130.367 Y138.448 E.12121
G1 X129.152 Y129.222 E.30868
G1 X130.15 Y129.354 E.03337
G1 X130.244 Y128.638 E.02395
G1 X130.458 Y128.638 E.0071
G1 X131.972 Y140.138 E.38478
G1 X125.631 Y140.973 E.21216
G1 X124.083 Y129.217 E.39334
G3 X124.021 Y128.547 I7.646 J-1.044 E.02233
G1 X127.769 Y129.04 E.1254
G1 X127.769 Y129.254 E.0071
G1 X125.958 Y129.493 E.0606
M204 S250
G1 X125.95 Y129.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4476
M204 S5000
G1 X127.98 Y129.622 E.06291
G1 X128.795 Y129.515 E.02527
G1 X129.927 Y138.111 E.2664
G1 X127.082 Y138.485 E.08819
G1 X125.958 Y129.949 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.932 Y129.63 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.812 Y128.914 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
G1 F4476
M204 S5000
G1 X124.339 Y128.193 E.16961
G1 X124.499 Y126.984 E.03749
G1 X129.971 Y127.704 E.16961
G1 X129.82 Y128.854 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.834 Y128.615 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.065 Y121.315 Z6.2 F42000
G1 X131.378 Y117.016 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F4476
M204 S5000
G1 X125.906 Y116.296 E.16961
G1 X126.065 Y115.086 E.03749
G1 X131.538 Y115.807 E.16961
G1 X131.386 Y116.957 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.401 Y116.717 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.978 Y117.501 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4476
M204 S6000
G1 X130.367 Y117.552 E.01301
G1 X129.133 Y126.925 E.31361
G1 X125.51 Y126.448 E.12121
G1 X126.232 Y120.961 E.18358
G1 X126.744 Y117.075 E.13003
G1 X129.919 Y117.493 E.10622
M204 S250
G1 X129.927 Y117.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4476
M204 S5000
G1 X128.795 Y126.485 E.26641
G1 X125.95 Y126.111 E.08819
G1 X126.621 Y121.013 E.158
G1 X127.082 Y117.515 E.1084
G1 X129.868 Y117.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.62 Y119.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.289 Y117.41 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4476
M204 S6000
G1 X125.124 Y126.26 E.29609
G1 X124.572 Y126.187 E.01847
G1 X125.771 Y117.084 E.30457
G1 X126.323 Y117.157 E.01847
G1 X126.297 Y117.351 E.0065
; WIPE_START
G1 F8843.478
G1 X126.036 Y119.334 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.274 Y117.809 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
G1 F4476
M204 S6000
G1 X131.305 Y117.813 E.00102
G1 X130.106 Y126.916 E.30457
G1 X129.554 Y126.843 E.01847
G1 X130.753 Y117.74 E.30457
G1 X131.215 Y117.801 E.01545
M204 S10000
G1 X131.327 Y117.405 F42000
G1 F4476
M204 S6000
G1 X131.761 Y117.462 E.01453
G1 X130.457 Y127.373 E.33158
G1 X124.116 Y126.538 E.21216
G1 X125.42 Y116.627 E.33158
G1 X131.268 Y117.397 E.19564
; WIPE_START
G1 F8843.478
G1 X131.761 Y117.462 E-.18922
G1 X131.565 Y118.951 E-.57078
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.932 Y126.558 Z6.2 F42000
G1 X130.8 Y128.144 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4476
M204 S5000
G1 X130.812 Y128.32 E.00541
G1 X132.386 Y140.28 E.37067
G3 X132.229 Y140.5 I-.191 J.029 E.00918
M73 P58 R7
G1 X125.489 Y141.387 E.20888
G3 X125.268 Y141.216 I-.03 J-.191 E.00964
G1 X123.694 Y129.264 E.37043
G3 X123.694 Y126.736 I9.872 J-1.264 E.07789
G1 X125.268 Y114.784 E.37042
G3 X125.489 Y114.613 I.194 J.021 E.00961
G1 X132.23 Y115.501 E.20893
G3 X132.386 Y115.722 I-.038 J.192 E.00921
G1 X130.812 Y127.679 E.37056
G2 X130.795 Y127.998 I3.115 J.321 E.00982
G1 X130.798 Y128.084 E.00264
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.812 Y128.32 E-.08973
G1 X131.042 Y130.069 E-.67027
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.2
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6.2 F4000
            G39.3 S1
            G0 Z6.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X129.938 Y129.942 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192595
G1 F4476
M204 S6000
G1 X131.126 Y138.964 E.11099
M204 S10000
G1 X126.355 Y140.03 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50536
G1 F4476
M204 S6000
G1 X126.538 Y140.004 E.00695
; LINE_WIDTH: 0.53209
G1 X126.6 Y139.97 E.00283
; LINE_WIDTH: 0.58207
G1 X126.663 Y139.937 E.00312
; LINE_WIDTH: 0.63205
G1 X126.726 Y139.903 E.00341
; LINE_WIDTH: 0.706416
G1 X126.788 Y139.87 E.00384
G1 X130.569 Y139.372 E.20616
; LINE_WIDTH: 0.686374
G1 X130.632 Y139.384 E.00338
; LINE_WIDTH: 0.645682
G1 X130.695 Y139.397 E.00317
; LINE_WIDTH: 0.60499
G1 X130.759 Y139.409 E.00295
; LINE_WIDTH: 0.564298
G1 X130.822 Y139.421 E.00274
; LINE_WIDTH: 0.512056
G2 X130.969 Y139.422 I.075 J-.221 E.00573
M204 S10000
G1 X126.144 Y139.62 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192606
G1 F4476
M204 S6000
G1 X124.781 Y129.263 E.12742
M204 S10000
G1 X125.252 Y129.147 F42000
; LINE_WIDTH: 0.429479
G1 F4476
M204 S6000
G1 X125.451 Y129.147 E.00627
; LINE_WIDTH: 0.385138
G1 X125.65 Y129.147 E.00555
; LINE_WIDTH: 0.340798
G1 X125.849 Y129.147 E.00483
; LINE_WIDTH: 0.296457
G1 X126.048 Y129.147 E.00411
; LINE_WIDTH: 0.252116
G1 X126.247 Y129.147 E.00339
; LINE_WIDTH: 0.207775
G1 X126.446 Y129.147 E.00267
; LINE_WIDTH: 0.163435
G1 X126.645 Y129.147 E.00195
; LINE_WIDTH: 0.119094
G1 X126.844 Y129.147 E.00124
; WIPE_START
G1 F15000
G1 X126.645 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.966 Y129.147 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.507819
G1 F4476
M204 S6000
G1 X128.292 Y129.147 E.01236
; LINE_WIDTH: 0.45895
G1 X128.618 Y129.147 E.01106
; LINE_WIDTH: 0.410081
G1 X128.945 Y129.147 E.00976
; WIPE_START
G1 F9804.985
G1 X128.618 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.857 Y126.678 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.192587
G1 F4476
M204 S6000
G1 X131.002 Y117.978 E.10702
; WIPE_START
G1 F15000
G1 X130.741 Y119.961 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.764 Y117.265 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.480855
G1 F4476
M204 S6000
G1 X131.975 Y115.665 E.05759
; WIPE_START
G1 F8220.399
G1 X131.764 Y117.265 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.02 Y117.322 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.192587
G1 F4476
M204 S6000
G1 X124.875 Y126.022 E.10702
; WIPE_START
G1 F15000
G1 X125.136 Y124.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.113 Y126.735 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.466963
G1 F4476
M204 S6000
G2 X124.017 Y127.596 I18.559 J2.495 E.02993
; LINE_WIDTH: 0.423328
G1 X123.986 Y128 E.01256
; LINE_WIDTH: 0.387796
G1 X123.968 Y128.342 E.00962
; WIPE_START
G1 F10438.558
G1 X123.986 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P59 R7
G1 X124.957 Y120.429 Z6.2 F42000
G1 X125.469 Y116.436 Z6.2
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.480853
G1 F4476
M204 S6000
G1 X125.679 Y114.835 E.05761
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.445
G1 X125.469 Y116.436 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/73
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z6.2 I-1.159 J.37 P1  F42000
G1 X129.708 Y129.706 Z6.2
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4476
M204 S6000
G1 X130.197 Y129.77 E.01635
G1 X131.515 Y139.788 E.33516
G1 X125.982 Y140.517 E.18516
G1 X124.467 Y129.016 E.38478
G1 X125.039 Y129.091 E.01912
G1 X126.394 Y139.382 E.3443
G1 X130.824 Y138.799 E.14822
G1 X129.625 Y129.695 E.30458
G1 X129.648 Y129.698 E.00077
; WIPE_START
G1 F8843.478
G1 X130.197 Y129.77 E-.21016
G1 X130.386 Y131.205 E-.54984
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.899 Y129.501 Z6.4 F42000
G1 Z6
G1 E.8 F1800
G1 F4476
M204 S6000
G1 X125.51 Y129.552 E.01301
G1 X126.744 Y138.925 E.31361
G1 X130.367 Y138.448 E.12121
G1 X129.152 Y129.222 E.30868
G1 X130.15 Y129.354 E.03337
G1 X130.244 Y128.638 E.02395
G1 X130.458 Y128.638 E.0071
G1 X131.972 Y140.138 E.38478
G1 X125.631 Y140.973 E.21216
G1 X124.083 Y129.217 E.39334
G3 X124.021 Y128.547 I7.644 J-1.044 E.02233
G1 X127.769 Y129.04 E.1254
G1 X127.769 Y129.254 E.0071
G1 X125.958 Y129.493 E.0606
M204 S250
G1 X125.95 Y129.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4476
M204 S5000
G1 X127.927 Y129.629 E.06128
G1 X128.795 Y129.515 E.02691
G1 X129.927 Y138.111 E.2664
G1 X127.082 Y138.485 E.08819
G1 X125.958 Y129.949 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.927 Y129.629 E-.75815
G1 X127.932 Y129.628 E-.00185
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.812 Y128.914 Z6.4 F42000
G1 Z6
G1 E.8 F1800
G1 F4476
M204 S5000
G1 X124.339 Y128.193 E.16961
G1 X124.499 Y126.984 E.03749
G1 X129.971 Y127.704 E.16961
G1 X129.82 Y128.854 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.834 Y128.615 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.065 Y121.315 Z6.4 F42000
G1 X131.378 Y117.016 Z6.4
G1 Z6
G1 E.8 F1800
G1 F4476
M204 S5000
G1 X125.906 Y116.296 E.16961
G1 X126.065 Y115.086 E.03749
G1 X131.538 Y115.807 E.16961
G1 X131.386 Y116.957 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.401 Y116.717 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.978 Y117.501 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4476
M204 S6000
G1 X130.367 Y117.552 E.01301
G1 X129.133 Y126.925 E.31361
G1 X125.51 Y126.448 E.12121
G1 X126.209 Y121.139 E.17763
G1 X126.744 Y117.075 E.13598
G1 X129.919 Y117.493 E.10622
M204 S250
G1 X129.927 Y117.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4476
M204 S5000
G1 X128.795 Y126.485 E.2664
G1 X125.95 Y126.111 E.08819
G1 X126.598 Y121.19 E.15249
G1 X127.082 Y117.515 E.11391
G1 X129.868 Y117.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.62 Y119.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.289 Y117.41 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4476
M204 S6000
G1 X125.124 Y126.26 E.29609
G1 X124.572 Y126.187 E.01847
G1 X125.771 Y117.084 E.30457
G1 X126.323 Y117.157 E.01847
G1 X126.297 Y117.351 E.0065
; WIPE_START
G1 F8843.478
G1 X126.036 Y119.334 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.274 Y117.809 Z6.4 F42000
G1 Z6
G1 E.8 F1800
G1 F4476
M204 S6000
G1 X131.305 Y117.813 E.00102
G1 X130.106 Y126.916 E.30457
G1 X129.554 Y126.843 E.01847
G1 X130.753 Y117.74 E.30457
G1 X131.215 Y117.801 E.01545
M204 S10000
G1 X131.327 Y117.405 F42000
G1 F4476
M204 S6000
G1 X131.761 Y117.462 E.01453
G1 X130.457 Y127.373 E.33158
G1 X124.116 Y126.538 E.21216
G1 X125.42 Y116.627 E.33158
G1 X131.268 Y117.397 E.19564
; WIPE_START
G1 F8843.478
G1 X131.761 Y117.462 E-.18922
G1 X131.565 Y118.951 E-.57078
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.933 Y126.558 Z6.4 F42000
G1 X130.801 Y128.151 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4476
M204 S5000
G1 X130.812 Y128.322 E.00527
G1 X132.386 Y140.28 E.3706
G3 X132.23 Y140.499 I-.19 J.03 E.00916
G1 X125.489 Y141.387 E.20892
G3 X125.268 Y141.216 I-.028 J-.193 E.00962
G1 X123.694 Y129.264 E.37042
G3 X123.694 Y126.736 I9.873 J-1.264 E.07789
G1 X125.267 Y114.785 E.37037
G3 X125.489 Y114.613 I.192 J.018 E.00967
G1 X132.249 Y115.505 E.2095
G3 X132.386 Y115.722 I-.053 J.186 E.00867
G1 X130.812 Y127.678 E.37052
G2 X130.8 Y128 I4.382 J.322 E.00991
G1 X130.801 Y128.091 E.0028
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.812 Y128.322 E-.08796
G1 X131.043 Y130.076 E-.67204
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.4
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6.4 F4000
            G39.3 S1
            G0 Z6.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X129.938 Y129.942 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192595
G1 F4476
M204 S6000
G1 X131.126 Y138.964 E.11099
M204 S10000
G1 X126.355 Y140.03 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50536
G1 F4476
M204 S6000
G1 X126.538 Y140.004 E.00695
; LINE_WIDTH: 0.53209
G1 X126.6 Y139.97 E.00283
; LINE_WIDTH: 0.58207
G1 X126.663 Y139.937 E.00312
; LINE_WIDTH: 0.63205
G1 X126.726 Y139.903 E.00341
; LINE_WIDTH: 0.706416
G1 X126.788 Y139.87 E.00384
G1 X130.569 Y139.372 E.20616
; LINE_WIDTH: 0.686376
G1 X130.632 Y139.384 E.00338
; LINE_WIDTH: 0.645688
G1 X130.695 Y139.397 E.00317
; LINE_WIDTH: 0.605
G1 X130.759 Y139.409 E.00295
; LINE_WIDTH: 0.564312
G1 X130.822 Y139.421 E.00274
; LINE_WIDTH: 0.512069
G2 X130.969 Y139.422 I.075 J-.221 E.00573
M204 S10000
G1 X126.144 Y139.62 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192606
G1 F4476
M204 S6000
G1 X124.781 Y129.263 E.12742
M204 S10000
G1 X125.252 Y129.147 F42000
; LINE_WIDTH: 0.429475
G1 F4476
M204 S6000
G1 X125.451 Y129.147 E.00627
; LINE_WIDTH: 0.385135
G1 X125.65 Y129.147 E.00555
; LINE_WIDTH: 0.340795
G1 X125.849 Y129.147 E.00483
; LINE_WIDTH: 0.296454
G1 X126.048 Y129.147 E.00411
; LINE_WIDTH: 0.252114
G1 X126.247 Y129.147 E.00339
; LINE_WIDTH: 0.207774
G1 X126.446 Y129.147 E.00267
; LINE_WIDTH: 0.163434
G1 X126.645 Y129.147 E.00195
; LINE_WIDTH: 0.119093
G1 X126.844 Y129.147 E.00124
; WIPE_START
G1 F15000
G1 X126.645 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.966 Y129.147 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.50783
G1 F4476
M204 S6000
G1 X128.292 Y129.147 E.01236
; LINE_WIDTH: 0.458957
G1 X128.618 Y129.147 E.01106
; LINE_WIDTH: 0.410085
G1 X128.945 Y129.147 E.00976
; WIPE_START
G1 F9804.87
G1 X128.618 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.857 Y126.678 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.192577
G1 F4476
M204 S6000
G1 X131.002 Y117.978 E.10701
; WIPE_START
G1 F15000
G1 X130.741 Y119.961 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.764 Y117.265 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.480853
G1 F4476
M204 S6000
G1 X131.975 Y115.665 E.05759
; WIPE_START
G1 F8220.448
G1 X131.764 Y117.265 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.02 Y117.322 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.192587
G1 F4476
M204 S6000
G1 X124.875 Y126.022 E.10701
; WIPE_START
G1 F15000
G1 X125.136 Y124.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.113 Y126.735 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.466962
G1 F4476
M204 S6000
G2 X124.017 Y127.596 I18.598 J2.498 E.02993
; LINE_WIDTH: 0.423327
G1 X123.986 Y128 E.01256
; LINE_WIDTH: 0.387806
G1 X123.968 Y128.342 E.00962
; WIPE_START
G1 F10438.231
G1 X123.986 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.957 Y120.429 Z6.4 F42000
G1 X125.469 Y116.436 Z6.4
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.480862
G1 F4476
M204 S6000
G1 X125.679 Y114.835 E.05761
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.277
G1 X125.469 Y116.436 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/73
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z6.4 I-1.16 J.368 P1  F42000
M73 P60 R7
G1 X129.588 Y129.41 Z6.4
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4934
M204 S6000
G1 X130.824 Y138.799 E.31411
G1 X126.394 Y139.382 E.14822
G1 X125.053 Y129.201 E.34062
G1 X127.77 Y128.844 E.09089
G1 X128.234 Y128.783 E.01553
G1 X128.631 Y128.73 E.01327
G1 F2880
G1 X129.483 Y128.618 E.02853
G1 X129.514 Y128.847 E.00764
G1 F4934
G1 X129.58 Y129.351 E.01687
M204 S10000
G1 X128.744 Y129.126 F42000
G1 F4934
M204 S6000
G1 X129.133 Y129.075 E.01301
G1 X130.367 Y138.448 E.31361
G1 X126.744 Y138.925 E.12121
G1 X125.51 Y129.552 E.31361
G1 X127.823 Y129.247 E.07739
G1 X128.685 Y129.134 E.02883
M204 S250
G1 X128.795 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4934
M204 S5000
G1 X129.927 Y138.111 E.2664
G1 X127.082 Y138.485 E.08819
G1 X125.95 Y129.889 E.2664
G1 X127.874 Y129.636 E.05964
G1 X128.736 Y129.523 E.0267
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.011 Y131.504 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.6 I1.214 J.086 P1  F42000
G1 X130.031 Y117.097 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4934
M204 S6000
G1 X130.824 Y117.201 E.02651
G1 X129.483 Y127.382 E.34062
G1 X125.053 Y126.799 E.14822
G1 X125.782 Y121.264 E.18518
G1 X126.394 Y116.618 E.15543
G1 X129.972 Y117.089 E.11972
M204 S10000
G1 X129.978 Y117.501 F42000
G1 F4934
M204 S6000
G1 X130.367 Y117.552 E.01301
G1 X129.133 Y126.925 E.31361
G1 X125.51 Y126.448 E.12121
G1 X126.186 Y121.317 E.17168
G1 X126.744 Y117.075 E.14193
G1 X129.919 Y117.493 E.10622
M204 S250
G1 X129.927 Y117.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4934
M204 S5000
G1 X128.795 Y126.485 E.2664
G1 X125.95 Y126.111 E.08819
G1 X126.574 Y121.368 E.14698
G1 X127.082 Y117.515 E.11942
G1 X129.868 Y117.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.62 Y119.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.969 Y127.491 Z6.6 F42000
G1 X129.995 Y128.042 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4934
M204 S6000
G1 X130.017 Y128.406 E.01212
G1 X131.515 Y139.788 E.38079
G1 X125.982 Y140.517 E.18516
G1 X124.487 Y129.168 E.37969
G3 X124.414 Y128.175 I9.494 J-1.199 E.03304
G1 X124.41 Y128 E.00581
G1 X124.414 Y127.837 E.00541
G3 X124.487 Y126.832 I9.558 J.193 E.03346
G1 X125.825 Y116.673 E.33989
G1 X125.877 Y116.277 E.01327
G1 X125.929 Y115.88 E.01327
G1 F3164.415
G1 X125.982 Y115.483 E.01327
G1 F814.55
G1 X126.039 Y115.491 E.00194
M106 S255
G1 F600
G1 X131.458 Y116.205 E.18128
M106 S201.45
G1 F814.427
G1 X131.515 Y116.212 E.00194
G1 F3164.173
G1 X131.463 Y116.609 E.01327
G1 F4934
G1 X131.411 Y117.006 E.01327
G1 X131.359 Y117.402 E.01327
G1 X130.019 Y127.583 E.34062
G2 X129.999 Y127.982 I4.389 J.419 E.01327
M204 S10000
G1 X130.4 Y128.02 F42000
G1 F4934
M204 S6000
G1 X130.422 Y128.362 E.01139
G1 X131.972 Y140.138 E.39399
G1 X125.631 Y140.973 E.21216
G1 X124.083 Y129.217 E.39334
G3 X124.083 Y126.783 I10.363 J-1.217 E.08092
G1 X125.631 Y115.027 E.39334
G1 X131.972 Y115.862 E.21216
G1 X130.423 Y127.631 E.39377
G2 X130.405 Y127.96 I3.844 J.37 E.01093
M204 S250
G1 X130.801 Y128.157 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4934
M204 S5000
G1 X130.812 Y128.32 E.00502
G1 X132.386 Y140.28 E.37068
G3 X132.229 Y140.5 I-.19 J.03 E.0092
G1 X125.49 Y141.387 E.20887
G3 X125.268 Y141.216 I-.029 J-.193 E.00962
G1 X123.694 Y129.264 E.37042
G3 X123.694 Y126.736 I10.794 J-1.264 E.07785
G1 X125.268 Y114.784 E.37042
G3 X125.489 Y114.613 I.192 J.019 E.00962
G1 X132.23 Y115.501 E.20894
G3 X132.386 Y115.722 I-.038 J.192 E.0092
G1 X130.812 Y127.678 E.37053
G2 X130.796 Y127.998 I3.321 J.323 E.00984
G1 X130.799 Y128.097 E.00305
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.812 Y128.32 E-.08484
G1 X131.044 Y130.081 E-.67516
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.6
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6.6 F4000
            G39.3 S1
            G0 Z6.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X129.808 Y128.37 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192287
G1 F4934
M204 S6000
G1 X129.743 Y128.454 E.0013
G1 X131.126 Y138.964 E.12902
M204 S10000
G1 X126.355 Y140.03 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50534
G1 F4934
M204 S6000
G1 X126.537 Y140.004 E.00693
; LINE_WIDTH: 0.53207
G1 X126.6 Y139.97 E.00283
; LINE_WIDTH: 0.58205
G1 X126.663 Y139.937 E.00312
; LINE_WIDTH: 0.63203
G1 X126.725 Y139.904 E.00341
; LINE_WIDTH: 0.706396
G1 X126.788 Y139.87 E.00384
G1 X130.569 Y139.372 E.20619
; LINE_WIDTH: 0.686354
G1 X130.632 Y139.384 E.00338
; LINE_WIDTH: 0.645662
G1 X130.696 Y139.397 E.00317
; LINE_WIDTH: 0.60497
G1 X130.759 Y139.409 E.00295
; LINE_WIDTH: 0.564278
G1 X130.822 Y139.421 E.00274
; LINE_WIDTH: 0.512044
G2 X130.969 Y139.422 I.075 J-.221 E.00572
M204 S10000
G1 X126.144 Y139.62 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.191523
G1 F4934
M204 S6000
G1 X124.752 Y129.036 E.12927
; WIPE_START
G1 F15000
G1 X125.013 Y131.019 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.6 I1.214 J-.078 P1  F42000
G1 X124.752 Y126.964 Z6.6
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.191494
G1 F4934
M204 S6000
G1 X126.144 Y116.38 E.12924
M204 S10000
G1 X130.886 Y116.867 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.43377
M106 S255
G1 F3000
M204 S6000
G1 X126.588 Y116.301 E.13808
G1 X126.613 Y116.106 E.00626
G1 X126.535 Y116.095 E.00252
G1 X126.55 Y115.979 E.00375
G1 X126.353 Y115.953 E.00633
G1 X126.363 Y115.877 E.00244
G1 X131.213 Y116.516 E.15582
M106 S201.45
M204 S10000
G1 X131.126 Y117.036 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.193363
G1 F4934
M204 S6000
G1 X129.734 Y127.62 E.13087
M204 S10000
G1 X129.456 Y127.737 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.46436
M106 S255
G1 F3000
M204 S6000
G1 X125.158 Y127.171 E.14888
G1 X125.134 Y127.35 E.00622
G1 X125.055 Y127.34 E.00272
G1 X125.04 Y127.457 E.00405
G1 X124.842 Y127.431 E.00687
G1 X124.826 Y127.552 E.00421
G1 X129.429 Y128.158 E.15944
G2 X129.346 Y128.3 I.317 J.28 E.00568
G1 X128.776 Y128.375 E.01975
G1 X127.809 Y128.248 E.03348
G1 X127.809 Y128.37 E.0042
G1 X124.771 Y127.97 E.10525
G1 X124.747 Y128.079 E.00381
G1 X124.761 Y128.394 E.01084
G1 X127.347 Y128.734 E.08958
M106 S201.45
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
G1 X125.365 Y128.473 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/73
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z6.6 I-.091 J1.214 P1  F42000
G1 X128.691 Y128.722 Z6.6
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4244
M204 S6000
G1 X129.483 Y128.618 E.02651
G1 X130.824 Y138.799 E.34062
G1 X126.394 Y139.382 E.14822
G1 X125.053 Y129.201 E.34062
G1 X127.717 Y128.851 E.08913
G1 X128.632 Y128.73 E.03059
M204 S10000
G1 X128.744 Y129.126 F42000
G1 F4244
M204 S6000
G1 X129.133 Y129.075 E.01301
G1 X130.367 Y138.448 E.31361
G1 X126.744 Y138.925 E.12121
G1 X125.51 Y129.552 E.31361
G1 X127.77 Y129.254 E.07562
G1 X128.685 Y129.134 E.03059
M204 S250
G1 X128.795 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4244
M204 S5000
G1 X129.927 Y138.111 E.2664
G1 X127.082 Y138.485 E.08819
G1 X125.95 Y129.889 E.2664
G1 X127.822 Y129.643 E.058
G1 X128.736 Y129.523 E.02834
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.011 Y131.504 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.8 I1.214 J.086 P1  F42000
G1 X130.031 Y117.097 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4244
M204 S6000
G1 X130.824 Y117.201 E.02651
G1 X129.483 Y127.382 E.34062
G1 X125.053 Y126.799 E.14822
G1 X125.759 Y121.442 E.17923
G1 X126.394 Y116.618 E.16138
G1 X129.972 Y117.089 E.11972
M204 S10000
G1 X129.978 Y117.501 F42000
G1 F4244
M204 S6000
G1 X130.367 Y117.552 E.01301
G1 X129.133 Y126.925 E.31361
G1 X125.51 Y126.448 E.12121
G1 X126.162 Y121.495 E.16573
G1 X126.744 Y117.075 E.14788
G1 X129.919 Y117.493 E.10622
M204 S250
G1 X129.927 Y117.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4244
M204 S5000
G1 X128.795 Y126.485 E.2664
G1 X125.95 Y126.111 E.08819
G1 X126.551 Y121.546 E.14147
G1 X127.082 Y117.515 E.12494
G1 X129.868 Y117.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.62 Y119.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.973 Y127.491 Z6.8 F42000
G1 X129.994 Y127.952 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4244
M204 S6000
G1 X130.003 Y128 E.00161
G2 X130.019 Y128.417 I5.603 J0 E.01386
G1 X131.515 Y139.788 E.38043
G1 X125.982 Y140.517 E.18516
G1 X124.487 Y129.168 E.37969
G3 X124.487 Y126.832 I9.913 J-1.168 E.07768
G1 X125.982 Y115.483 E.37969
G1 X131.515 Y116.212 E.18516
G1 X130.019 Y127.583 E.38043
G1 X129.998 Y127.892 E.01029
M204 S10000
G1 X130.4 Y128.023 F42000
G1 F4244
M204 S6000
G1 X130.423 Y128.369 E.01148
G1 X131.972 Y140.138 E.39377
G1 X125.631 Y140.973 E.21216
G1 X124.083 Y129.217 E.39334
G3 X124.083 Y126.783 I10.362 J-1.217 E.08092
G1 X125.631 Y115.027 E.39334
G1 X131.972 Y115.862 E.21216
G1 X130.423 Y127.631 E.39378
G2 X130.409 Y127.965 I4.976 J.369 E.01109
M204 S250
G1 X130.802 Y128.162 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4244
M204 S5000
G1 X130.812 Y128.322 E.00493
M73 P61 R7
G1 X132.386 Y140.28 E.3706
G3 X132.228 Y140.5 I-.191 J.029 E.00923
G1 X125.49 Y141.387 E.20883
G3 X125.268 Y141.217 I-.029 J-.193 E.00959
G1 X123.694 Y129.264 E.37046
G3 X123.694 Y126.736 I10.793 J-1.264 E.07785
G1 X125.267 Y114.785 E.37038
G3 X125.489 Y114.613 I.192 J.018 E.00966
G1 X132.23 Y115.501 E.20894
G3 X132.386 Y115.722 I-.039 J.193 E.00919
G1 X130.812 Y127.678 E.37052
G2 X130.8 Y128 I4.389 J.322 E.00991
G1 X130.801 Y128.102 E.00314
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.812 Y128.322 E-.0837
G1 X131.044 Y130.087 E-.6763
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.8
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6.8 F4000
            G39.3 S1
            G0 Z6.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X129.808 Y128.37 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192511
G1 F4244
M204 S6000
G1 X129.743 Y128.454 E.0013
G1 X131.126 Y138.964 E.12922
M204 S10000
G1 X126.355 Y140.03 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50536
G1 F4244
M204 S6000
G1 X126.537 Y140.004 E.00693
; LINE_WIDTH: 0.53209
G1 X126.6 Y139.97 E.00283
; LINE_WIDTH: 0.58207
G1 X126.663 Y139.937 E.00312
; LINE_WIDTH: 0.63205
G1 X126.725 Y139.904 E.00341
; LINE_WIDTH: 0.706406
G1 X126.788 Y139.87 E.00384
G1 X130.569 Y139.372 E.20618
; LINE_WIDTH: 0.686356
G1 X130.632 Y139.384 E.00338
; LINE_WIDTH: 0.645668
G1 X130.696 Y139.397 E.00317
; LINE_WIDTH: 0.60498
G1 X130.759 Y139.409 E.00295
; LINE_WIDTH: 0.564292
G1 X130.822 Y139.421 E.00274
; LINE_WIDTH: 0.512047
G2 X130.969 Y139.422 I.075 J-.221 E.00572
M204 S10000
G1 X126.144 Y139.62 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.191512
G1 F4244
M204 S6000
G1 X124.752 Y129.036 E.12926
M204 S10000
G1 X125.561 Y127.963 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F4244
M204 S6000
G1 X125.497 Y128 E.00204
G1 X125.546 Y128.028 E.00155
M204 S10000
G1 X128.287 Y128 F42000
; LINE_WIDTH: 0.41999
G1 F4244
M204 S6000
G1 X125.368 Y127.616 E.09045
G1 X125.325 Y127.682 E.00243
G1 X125.193 Y127.712 E.00417
G1 X125.195 Y128.289 E.01773
G1 X125.326 Y128.318 E.00411
G1 X125.368 Y128.384 E.00242
G1 X128.227 Y128.008 E.0886
M204 S10000
G1 X129.21 Y127.741 F42000
G1 F4244
M204 S6000
G1 X125.211 Y127.215 E.12392
G1 X125.123 Y127.364 E.00532
G3 X124.83 Y127.37 I-.154 J-.4 E.00919
G2 X124.835 Y128.63 I6.68 J.607 E.03876
G3 X125.123 Y128.636 I.136 J.4 E.00906
G1 X125.226 Y128.783 E.00551
G1 X129.305 Y128.246 E.12642
G1 X129.49 Y127.983 E.00988
G1 X129.296 Y127.933 E.00616
G3 X129.224 Y127.799 I.101 J-.14 E.00483
M204 S10000
G1 X129.734 Y127.62 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.193372
G1 F4244
M204 S6000
G1 X131.126 Y117.036 E.13088
M204 S10000
G1 X126.355 Y115.97 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.5036
G1 F4244
M204 S6000
G1 X126.498 Y115.989 E.0054
; LINE_WIDTH: 0.523924
G1 X126.556 Y116.017 E.00253
; LINE_WIDTH: 0.564612
G1 X126.614 Y116.045 E.00274
; LINE_WIDTH: 0.6053
G1 X126.672 Y116.074 E.00296
; LINE_WIDTH: 0.645988
G1 X126.73 Y116.102 E.00317
; LINE_WIDTH: 0.706534
G1 X126.788 Y116.13 E.00349
G1 X130.568 Y116.628 E.2062
; LINE_WIDTH: 0.686376
G1 X130.632 Y116.616 E.00338
; LINE_WIDTH: 0.645688
G1 X130.695 Y116.603 E.00317
; LINE_WIDTH: 0.605
G1 X130.758 Y116.591 E.00295
; LINE_WIDTH: 0.564312
G1 X130.822 Y116.579 E.00274
; LINE_WIDTH: 0.512045
G3 X130.969 Y116.578 I.075 J.222 E.00574
M204 S10000
G1 X126.144 Y116.38 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.191494
G1 F4244
M204 S6000
G1 X124.752 Y126.964 E.12924
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X125.013 Y124.981 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/73
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z6.8 I-.868 J.853 P1  F42000
G1 X128.691 Y128.722 Z6.8
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4223
M204 S6000
G1 X129.483 Y128.618 E.02651
G1 X130.824 Y138.799 E.34062
G1 X126.394 Y139.382 E.14822
G1 X125.053 Y129.201 E.34062
G1 X127.664 Y128.858 E.08736
G1 X128.632 Y128.73 E.03236
M204 S10000
G1 X128.744 Y129.126 F42000
G1 F4223
M204 S6000
G1 X129.133 Y129.075 E.01301
G1 X130.367 Y138.448 E.31361
G1 X126.744 Y138.925 E.12121
G1 X125.51 Y129.552 E.31361
G1 X127.718 Y129.261 E.07386
G1 X128.685 Y129.134 E.03236
M204 S250
G1 X128.795 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4223
M204 S5000
G1 X129.927 Y138.111 E.2664
G1 X127.082 Y138.485 E.08819
G1 X125.95 Y129.889 E.2664
G1 X127.769 Y129.65 E.05637
G1 X128.736 Y129.523 E.02998
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.011 Y131.504 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7 I1.214 J.086 P1  F42000
G1 X130.031 Y117.097 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4223
M204 S6000
G1 X130.824 Y117.201 E.02651
G1 X129.483 Y127.382 E.34062
G1 X125.053 Y126.799 E.14822
G1 X125.735 Y121.619 E.17328
G1 X126.394 Y116.618 E.16733
G1 X129.972 Y117.089 E.11972
M204 S10000
G1 X129.978 Y117.501 F42000
G1 F4223
M204 S6000
G1 X130.367 Y117.552 E.01301
G1 X129.133 Y126.925 E.31361
G1 X125.51 Y126.448 E.12121
G1 X126.139 Y121.673 E.15978
G1 X126.744 Y117.075 E.15383
G1 X129.919 Y117.493 E.10622
M204 S250
G1 X129.927 Y117.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4223
M204 S5000
G1 X128.795 Y126.485 E.2664
G1 X125.95 Y126.111 E.08819
G1 X126.528 Y121.724 E.13596
G1 X127.082 Y117.515 E.13045
G1 X129.868 Y117.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.62 Y119.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.969 Y127.491 Z7 F42000
G1 X129.995 Y128.046 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4223
M204 S6000
G1 X130.017 Y128.407 E.01201
G1 X131.515 Y139.788 E.38077
G1 X125.982 Y140.517 E.18516
G1 X124.487 Y129.168 E.37969
G3 X124.487 Y126.832 I9.914 J-1.168 E.07768
G1 X125.982 Y115.483 E.37969
G1 X131.515 Y116.212 E.18516
G1 X130.017 Y127.593 E.38077
G2 X129.995 Y127.986 I3.728 J.407 E.01305
M204 S10000
G1 X130.4 Y128.023 F42000
G1 F4223
M204 S6000
G1 X130.422 Y128.363 E.01129
G1 X131.972 Y140.138 E.39398
G1 X125.631 Y140.973 E.21216
G1 X124.083 Y129.217 E.39334
G3 X124.083 Y126.783 I10.363 J-1.217 E.08092
G1 X125.631 Y115.027 E.39334
G1 X131.972 Y115.862 E.21216
G1 X130.422 Y127.637 E.39398
G2 X130.402 Y127.963 I3.245 J.363 E.01082
M204 S250
G1 X130.802 Y128.167 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4223
M204 S5000
G1 X130.812 Y128.32 E.00471
G1 X132.386 Y140.28 E.37067
G3 X132.229 Y140.5 I-.192 J.028 E.00917
G1 X125.49 Y141.387 E.20887
G3 X125.267 Y141.214 I-.028 J-.193 E.00967
G1 X123.694 Y129.264 E.37037
G3 X123.694 Y126.736 I10.795 J-1.264 E.07785
G1 X125.267 Y114.785 E.37038
G3 X125.489 Y114.613 I.193 J.019 E.00966
G1 X132.23 Y115.501 E.20894
G3 X132.386 Y115.722 I-.038 J.192 E.0092
G1 X130.812 Y127.68 E.3706
G2 X130.793 Y128 I2.784 J.32 E.00985
G1 X130.799 Y128.107 E.00329
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.812 Y128.32 E-.0811
G1 X131.045 Y130.091 E-.6789
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z7 F4000
            G39.3 S1
            G0 Z7 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X129.808 Y128.37 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192291
G1 F4223
M204 S6000
G1 X129.743 Y128.454 E.0013
G1 X131.126 Y138.964 E.12902
M204 S10000
G1 X126.355 Y140.03 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50534
G1 F4223
M204 S6000
G1 X126.537 Y140.004 E.00693
; LINE_WIDTH: 0.53207
G1 X126.6 Y139.97 E.00283
; LINE_WIDTH: 0.58205
G1 X126.663 Y139.937 E.00312
; LINE_WIDTH: 0.63203
G1 X126.725 Y139.904 E.00341
; LINE_WIDTH: 0.706406
G1 X126.788 Y139.87 E.00384
G1 X130.569 Y139.372 E.20619
; LINE_WIDTH: 0.686378
G1 X130.632 Y139.384 E.00338
; LINE_WIDTH: 0.645694
M73 P62 R7
G1 X130.696 Y139.397 E.00317
; LINE_WIDTH: 0.60501
G1 X130.759 Y139.409 E.00295
; LINE_WIDTH: 0.564326
G1 X130.822 Y139.421 E.00274
; LINE_WIDTH: 0.512099
G2 X130.969 Y139.422 I.075 J-.221 E.00572
M204 S10000
G1 X126.144 Y139.62 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.191512
G1 F4223
M204 S6000
G1 X124.752 Y129.036 E.12926
M204 S10000
G1 X125.561 Y127.963 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F4223
M204 S6000
G1 X125.497 Y128 E.00204
G1 X125.546 Y128.028 E.00155
M204 S10000
G1 X128.286 Y128 F42000
; LINE_WIDTH: 0.41999
G1 F4223
M204 S6000
G1 X125.368 Y127.616 E.09045
G1 X125.326 Y127.682 E.00243
G1 X125.193 Y127.712 E.00417
G1 X125.195 Y128.289 E.01773
G1 X125.326 Y128.318 E.00411
G1 X125.368 Y128.384 E.00242
G1 X128.227 Y128.008 E.0886
M204 S10000
G1 X129.309 Y127.754 F42000
G1 F4223
M204 S6000
G1 X125.211 Y127.215 E.12699
G1 X125.123 Y127.364 E.00532
G3 X124.83 Y127.37 I-.154 J-.4 E.00919
G2 X124.835 Y128.63 I6.682 J.607 E.03876
G3 X125.123 Y128.636 I.136 J.4 E.00906
G1 X125.226 Y128.783 E.00551
G1 X129.322 Y128.244 E.12696
G1 X129.477 Y128.016 E.00845
G1 X129.341 Y127.805 E.00773
M204 S10000
G1 X129.808 Y127.63 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192288
G1 F4223
M204 S6000
G1 X129.743 Y127.546 E.0013
G1 X131.126 Y117.036 E.12902
M204 S10000
G1 X126.355 Y115.97 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50359
G1 F4223
M204 S6000
G1 X126.498 Y115.989 E.0054
; LINE_WIDTH: 0.523924
G1 X126.556 Y116.017 E.00253
; LINE_WIDTH: 0.564612
G1 X126.614 Y116.045 E.00274
; LINE_WIDTH: 0.6053
G1 X126.672 Y116.074 E.00296
; LINE_WIDTH: 0.645988
G1 X126.73 Y116.102 E.00317
; LINE_WIDTH: 0.706534
G1 X126.788 Y116.13 E.00349
G1 X130.569 Y116.628 E.20623
; LINE_WIDTH: 0.686374
G1 X130.632 Y116.616 E.00338
; LINE_WIDTH: 0.645682
G1 X130.696 Y116.603 E.00317
; LINE_WIDTH: 0.60499
G1 X130.759 Y116.591 E.00295
; LINE_WIDTH: 0.564298
G1 X130.822 Y116.579 E.00274
; LINE_WIDTH: 0.512059
G3 X130.969 Y116.578 I.075 J.221 E.00572
M204 S10000
G1 X126.144 Y116.38 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.191493
G1 F4223
M204 S6000
G1 X124.752 Y126.964 E.12924
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X125.013 Y124.981 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/73
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z7 I-.868 J.853 P1  F42000
G1 X128.691 Y128.722 Z7
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4215
M204 S6000
G1 X129.483 Y128.618 E.02651
G1 X130.824 Y138.799 E.34062
G1 X126.394 Y139.382 E.14822
G1 X125.053 Y129.201 E.34062
G1 X127.612 Y128.865 E.08559
G1 X128.632 Y128.73 E.03413
M204 S10000
G1 X128.744 Y129.126 F42000
G1 F4215
M204 S6000
G1 X129.133 Y129.075 E.01301
G1 X130.367 Y138.448 E.31361
G1 X126.744 Y138.925 E.12121
G1 X125.51 Y129.552 E.31361
G1 X127.665 Y129.268 E.07209
G1 X128.685 Y129.134 E.03413
M204 S250
G1 X128.795 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4215
M204 S5000
G1 X129.927 Y138.111 E.2664
G1 X127.082 Y138.485 E.08819
G1 X125.95 Y129.889 E.2664
G1 X127.716 Y129.657 E.05473
G1 X128.736 Y129.523 E.03161
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.011 Y131.504 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.55 Y123.89 Z7.2 F42000
G1 X130.031 Y117.097 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4215
M204 S6000
G1 X130.824 Y117.201 E.02651
G1 X129.483 Y127.382 E.34062
G1 X125.053 Y126.799 E.14822
G1 X125.712 Y121.797 E.16733
G1 X126.394 Y116.618 E.17328
G1 X129.972 Y117.089 E.11972
M204 S10000
G1 X129.978 Y117.501 F42000
G1 F4215
M204 S6000
G1 X130.367 Y117.552 E.01301
G1 X129.133 Y126.925 E.31361
G1 X125.51 Y126.448 E.12121
G1 X126.115 Y121.85 E.15383
G1 X126.744 Y117.075 E.15978
G1 X129.919 Y117.493 E.10622
M204 S250
G1 X129.927 Y117.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4215
M204 S5000
G1 X128.795 Y126.485 E.2664
G1 X125.95 Y126.111 E.08819
G1 X126.504 Y121.902 E.13045
G1 X127.082 Y117.515 E.13596
G1 X129.868 Y117.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.62 Y119.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.974 Y127.49 Z7.2 F42000
G1 X130.015 Y128.37 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4215
M204 S6000
G1 X130.017 Y128.407 E.00121
G1 X131.515 Y139.788 E.38079
G1 X125.982 Y140.517 E.18516
G1 X124.487 Y129.168 E.37969
G3 X124.487 Y126.832 I9.913 J-1.168 E.07768
G1 X125.982 Y115.483 E.37969
G1 X131.515 Y116.212 E.18516
G1 X130.019 Y127.583 E.38043
G2 X129.999 Y127.989 I4.392 J.419 E.01349
G1 X130.012 Y128.31 E.01066
M204 S10000
G1 X130.421 Y128.345 F42000
G1 F4215
M204 S6000
G1 X130.422 Y128.362 E.00058
G1 X131.972 Y140.138 E.39399
G1 X125.631 Y140.973 E.21216
G1 X124.083 Y129.217 E.39334
G3 X124.083 Y126.783 I10.362 J-1.217 E.08092
G1 X125.631 Y115.027 E.39334
G1 X131.972 Y115.862 E.21216
G1 X130.423 Y127.631 E.39377
G2 X130.405 Y127.993 I3.847 J.37 E.01203
G1 X130.418 Y128.285 E.00968
M204 S250
G1 X130.802 Y128.175 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4215
M204 S5000
G1 X130.812 Y128.32 E.00447
G1 X132.386 Y140.28 E.37067
G3 X132.229 Y140.5 I-.192 J.028 E.00917
G1 X125.489 Y141.387 E.20888
G3 X125.267 Y141.215 I-.028 J-.193 E.00966
G1 X123.694 Y129.264 E.37038
G3 X123.694 Y126.736 I10.793 J-1.264 E.07785
G1 X125.268 Y114.784 E.37042
G3 X125.488 Y114.612 I.192 J.019 E.00962
G1 X132.23 Y115.501 E.20895
G3 X132.386 Y115.722 I-.038 J.192 E.0092
G1 X130.812 Y127.678 E.37053
G2 X130.796 Y127.998 I3.321 J.323 E.00984
G1 X130.8 Y128.115 E.00359
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.812 Y128.32 E-.07813
G1 X131.046 Y130.099 E-.68187
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.2
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z7.2 F4000
            G39.3 S1
            G0 Z7.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X129.808 Y128.37 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192282
G1 F4215
M204 S6000
G1 X129.743 Y128.454 E.0013
G1 X131.126 Y138.964 E.12902
M204 S10000
G1 X126.355 Y140.03 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50536
G1 F4215
M204 S6000
G1 X126.537 Y140.004 E.00693
; LINE_WIDTH: 0.53209
G1 X126.6 Y139.97 E.00283
; LINE_WIDTH: 0.58207
G1 X126.663 Y139.937 E.00312
; LINE_WIDTH: 0.63205
G1 X126.725 Y139.904 E.00341
; LINE_WIDTH: 0.706416
G1 X126.788 Y139.87 E.00384
G1 X130.569 Y139.372 E.20619
; LINE_WIDTH: 0.686374
G1 X130.632 Y139.384 E.00338
; LINE_WIDTH: 0.645682
G1 X130.696 Y139.397 E.00317
; LINE_WIDTH: 0.60499
G1 X130.759 Y139.409 E.00295
; LINE_WIDTH: 0.564298
G1 X130.822 Y139.421 E.00274
; LINE_WIDTH: 0.512059
G2 X130.969 Y139.422 I.075 J-.221 E.00572
M204 S10000
G1 X126.144 Y139.62 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.19151
G1 F4215
M204 S6000
G1 X124.752 Y129.036 E.12926
M204 S10000
G1 X125.561 Y127.963 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38294
G1 F4215
M204 S6000
G1 X125.497 Y128 E.00204
G1 X125.546 Y128.028 E.00155
M204 S10000
G1 X128.287 Y128 F42000
; LINE_WIDTH: 0.41999
G1 F4215
M204 S6000
G1 X125.368 Y127.616 E.09045
G1 X125.325 Y127.682 E.00243
G1 X125.193 Y127.712 E.00417
G1 X125.195 Y128.289 E.01773
G1 X125.326 Y128.318 E.00411
G1 X125.368 Y128.384 E.00242
G1 X128.227 Y128.008 E.0886
M204 S10000
G1 X129.21 Y127.741 F42000
G1 F4215
M204 S6000
G1 X125.211 Y127.215 E.12392
G1 X125.123 Y127.364 E.00532
G3 X124.83 Y127.37 I-.154 J-.4 E.00919
G2 X124.835 Y128.63 I6.68 J.607 E.03876
G3 X125.123 Y128.636 I.136 J.4 E.00906
G1 X125.226 Y128.783 E.00551
G1 X129.322 Y128.244 E.12695
G1 X129.498 Y127.984 E.00963
G1 X129.312 Y127.944 E.00585
G3 X129.224 Y127.799 I.087 J-.152 E.00543
M204 S10000
M73 P63 R7
G1 X129.734 Y127.62 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.193363
G1 F4215
M204 S6000
G1 X131.126 Y117.036 E.13087
M204 S10000
G1 X126.355 Y115.97 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50359
G1 F4215
M204 S6000
G1 X126.498 Y115.989 E.0054
; LINE_WIDTH: 0.523922
G1 X126.556 Y116.017 E.00253
; LINE_WIDTH: 0.564606
G1 X126.614 Y116.045 E.00274
; LINE_WIDTH: 0.60529
G1 X126.672 Y116.074 E.00296
; LINE_WIDTH: 0.645974
G1 X126.73 Y116.102 E.00317
; LINE_WIDTH: 0.706514
G1 X126.788 Y116.13 E.00349
G1 X130.568 Y116.628 E.20619
; LINE_WIDTH: 0.686356
G1 X130.632 Y116.616 E.00338
; LINE_WIDTH: 0.645668
G1 X130.695 Y116.603 E.00317
; LINE_WIDTH: 0.60498
G1 X130.758 Y116.591 E.00295
; LINE_WIDTH: 0.564292
G1 X130.822 Y116.579 E.00274
; LINE_WIDTH: 0.512025
G3 X130.969 Y116.578 I.075 J.221 E.00574
M204 S10000
G1 X126.144 Y116.38 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.191493
G1 F4215
M204 S6000
G1 X124.752 Y126.964 E.12924
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X125.013 Y124.981 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/73
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z7.2 I-.846 J.874 P1  F42000
G1 X129.588 Y129.41 Z7.2
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4217
M204 S6000
G1 X130.824 Y138.799 E.31411
G1 X126.394 Y139.382 E.14822
G1 X125.053 Y129.201 E.34062
G1 X127.559 Y128.872 E.08383
G1 X129.483 Y128.618 E.06439
G1 X129.58 Y129.351 E.02452
M204 S10000
G1 X128.744 Y129.126 F42000
G1 F4217
M204 S6000
G1 X129.133 Y129.075 E.01301
G1 X130.367 Y138.448 E.31361
G1 X126.744 Y138.925 E.12121
G1 X125.51 Y129.552 E.31361
G1 X127.612 Y129.275 E.07032
G1 X128.685 Y129.134 E.03589
M204 S250
G1 X128.795 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4217
M204 S5000
G1 X129.927 Y138.111 E.2664
G1 X127.082 Y138.485 E.08819
G1 X125.95 Y129.889 E.2664
G1 X127.663 Y129.664 E.05309
G1 X128.736 Y129.523 E.03325
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.011 Y131.504 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.55 Y123.89 Z7.4 F42000
G1 X130.031 Y117.097 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4217
M204 S6000
G1 X130.824 Y117.201 E.02651
G1 X129.483 Y127.382 E.34062
G1 X125.053 Y126.799 E.14822
G1 X125.688 Y121.975 E.16138
G1 X126.394 Y116.618 E.17923
G1 X129.972 Y117.089 E.11972
M204 S10000
G1 X129.978 Y117.501 F42000
G1 F4217
M204 S6000
G1 X130.367 Y117.552 E.01301
G1 X129.133 Y126.925 E.31361
G1 X125.51 Y126.448 E.12121
G1 X126.092 Y122.028 E.14788
G1 X126.744 Y117.075 E.16573
G1 X129.919 Y117.493 E.10622
M204 S250
G1 X129.927 Y117.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4217
M204 S5000
G1 X128.795 Y126.485 E.2664
G1 X125.95 Y126.111 E.08819
G1 X126.481 Y122.079 E.12494
G1 X127.082 Y117.515 E.14147
G1 X129.868 Y117.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.62 Y119.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.975 Y127.49 Z7.4 F42000
G1 X130.016 Y128.376 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4217
M204 S6000
G1 X130.018 Y128.417 E.00137
G1 X131.515 Y139.788 E.38043
G1 X125.982 Y140.517 E.18516
G1 X124.487 Y129.168 E.37969
G3 X124.487 Y126.832 I9.078 J-1.168 E.07771
G1 X125.982 Y115.483 E.37969
G1 X131.515 Y116.212 E.18516
G1 X130.018 Y127.583 E.38044
G2 X129.991 Y128 I3.155 J.417 E.01387
G1 X130.012 Y128.316 E.0105
M204 S10000
G1 X130.421 Y128.348 F42000
G1 F4217
M204 S6000
G1 X130.423 Y128.369 E.00068
G1 X131.972 Y140.138 E.39378
G1 X125.631 Y140.973 E.21216
G1 X124.083 Y129.217 E.39334
G3 X124.083 Y126.783 I9.483 J-1.217 E.08096
G1 X125.631 Y115.027 E.39334
G1 X131.972 Y115.862 E.21216
G1 X130.423 Y127.631 E.39378
G2 X130.409 Y128 I4.977 J.369 E.01224
G1 X130.419 Y128.288 E.00957
M204 S250
G1 X130.803 Y128.178 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4217
M204 S5000
G1 X130.812 Y128.322 E.00444
G1 X132.386 Y140.28 E.3706
G3 X132.228 Y140.5 I-.19 J.03 E.00924
G1 X125.489 Y141.387 E.20884
G3 X125.268 Y141.216 I-.028 J-.193 E.00962
G1 X123.694 Y129.264 E.37041
G3 X123.694 Y126.736 I9.873 J-1.264 E.07789
G1 X125.267 Y114.785 E.37038
G3 X125.489 Y114.613 I.193 J.019 E.00965
G1 X132.23 Y115.501 E.20895
G3 X132.386 Y115.722 I-.038 J.192 E.0092
G1 X130.812 Y127.678 E.37053
G2 X130.8 Y128 I4.385 J.322 E.00991
G1 X130.802 Y128.118 E.00362
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.812 Y128.322 E-.07771
G1 X131.046 Y130.102 E-.68229
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.4
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z7.4 F4000
            G39.3 S1
            G0 Z7.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X129.808 Y128.37 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192508
G1 F4217
M204 S6000
G1 X129.743 Y128.454 E.0013
G1 X131.126 Y138.964 E.12921
M204 S10000
G1 X126.355 Y140.03 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50534
G1 F4217
M204 S6000
G1 X126.537 Y140.004 E.00693
; LINE_WIDTH: 0.532073
G1 X126.6 Y139.97 E.00283
; LINE_WIDTH: 0.582058
G1 X126.663 Y139.937 E.00312
; LINE_WIDTH: 0.632043
G1 X126.725 Y139.904 E.00341
; LINE_WIDTH: 0.706416
G1 X126.788 Y139.87 E.00384
G1 X130.569 Y139.372 E.20619
; LINE_WIDTH: 0.686376
G1 X130.632 Y139.384 E.00338
; LINE_WIDTH: 0.645688
G1 X130.696 Y139.397 E.00317
; LINE_WIDTH: 0.605
G1 X130.759 Y139.409 E.00295
; LINE_WIDTH: 0.564312
G1 X130.822 Y139.421 E.00274
; LINE_WIDTH: 0.512079
G2 X130.969 Y139.422 I.075 J-.221 E.00572
M204 S10000
G1 X126.144 Y139.62 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.191522
M73 P63 R6
G1 F4217
M204 S6000
G1 X124.752 Y129.036 E.12927
M204 S10000
G1 X125.561 Y127.963 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38294
G1 F4217
M204 S6000
G1 X125.497 Y128 E.00204
G1 X125.546 Y128.028 E.00155
M204 S10000
G1 X128.286 Y128 F42000
; LINE_WIDTH: 0.41999
G1 F4217
M204 S6000
G1 X125.368 Y127.616 E.09045
G1 X125.325 Y127.682 E.00243
G1 X125.193 Y127.712 E.00417
G1 X125.195 Y128.289 E.01774
G1 X125.326 Y128.318 E.00411
G1 X125.368 Y128.384 E.00242
G1 X128.227 Y128.008 E.0886
M204 S10000
G1 X129.21 Y127.741 F42000
G1 F4217
M204 S6000
G1 X125.211 Y127.215 E.12392
G1 X125.123 Y127.364 E.00532
G3 X124.83 Y127.37 I-.154 J-.4 E.00919
G2 X124.835 Y128.63 I6.679 J.607 E.03876
G3 X125.123 Y128.636 I.136 J.4 E.00906
G1 X125.226 Y128.783 E.00551
G1 X129.325 Y128.244 E.12705
G1 X129.497 Y127.984 E.00956
G1 X129.313 Y127.945 E.00578
G3 X129.224 Y127.799 I.086 J-.152 E.00547
M204 S10000
G1 X129.734 Y127.62 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.193372
G1 F4217
M204 S6000
G1 X131.126 Y117.036 E.13088
M204 S10000
G1 X126.355 Y115.97 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50359
G1 F4217
M204 S6000
G1 X126.498 Y115.989 E.0054
; LINE_WIDTH: 0.523922
G1 X126.556 Y116.017 E.00253
; LINE_WIDTH: 0.564606
G1 X126.614 Y116.045 E.00274
; LINE_WIDTH: 0.60529
G1 X126.672 Y116.074 E.00296
; LINE_WIDTH: 0.645974
G1 X126.73 Y116.102 E.00317
; LINE_WIDTH: 0.706524
G1 X126.788 Y116.13 E.00349
G1 X130.568 Y116.628 E.2062
; LINE_WIDTH: 0.686374
G1 X130.632 Y116.616 E.00338
; LINE_WIDTH: 0.645682
G1 X130.695 Y116.603 E.00317
; LINE_WIDTH: 0.60499
G1 X130.758 Y116.591 E.00295
; LINE_WIDTH: 0.564298
G1 X130.822 Y116.579 E.00274
; LINE_WIDTH: 0.512025
G3 X130.969 Y116.578 I.075 J.222 E.00574
M204 S10000
G1 X126.144 Y116.38 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.191493
G1 F4217
M204 S6000
G1 X124.752 Y126.964 E.12924
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X125.013 Y124.981 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/73
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z7.4 I-.868 J.853 P1  F42000
G1 X128.691 Y128.722 Z7.4
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P64 R6
G1 F4215
M204 S6000
G1 X129.483 Y128.618 E.02651
G1 X130.824 Y138.799 E.34062
G1 X126.394 Y139.382 E.14822
G1 X125.053 Y129.201 E.34062
G1 X127.506 Y128.879 E.08206
G1 X128.632 Y128.73 E.03766
M204 S10000
G1 X128.744 Y129.126 F42000
G1 F4215
M204 S6000
G1 X129.133 Y129.075 E.01301
G1 X130.367 Y138.448 E.31361
G1 X126.744 Y138.925 E.12121
G1 X125.51 Y129.552 E.31361
G1 X127.559 Y129.282 E.06856
G1 X128.685 Y129.134 E.03766
M204 S250
G1 X128.795 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4215
M204 S5000
G1 X129.927 Y138.111 E.2664
G1 X127.082 Y138.485 E.08819
G1 X125.95 Y129.889 E.2664
G1 X127.61 Y129.671 E.05146
G1 X128.736 Y129.523 E.03489
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.011 Y131.504 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.55 Y123.89 Z7.6 F42000
G1 X130.031 Y117.097 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4215
M204 S6000
G1 X130.824 Y117.201 E.02651
G1 X129.483 Y127.382 E.34062
G1 X125.053 Y126.799 E.14822
G1 X125.665 Y122.153 E.15543
G1 X126.394 Y116.618 E.18518
G1 X129.972 Y117.089 E.11972
M204 S10000
G1 X129.978 Y117.501 F42000
G1 F4215
M204 S6000
G1 X130.367 Y117.552 E.01301
G1 X129.133 Y126.925 E.31361
G1 X125.51 Y126.448 E.12121
G1 X126.069 Y122.206 E.14193
G1 X126.744 Y117.075 E.17168
G1 X129.919 Y117.493 E.10622
M204 S250
G1 X129.927 Y117.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4215
M204 S5000
G1 X128.795 Y126.485 E.2664
G1 X125.95 Y126.111 E.08819
G1 X126.457 Y122.257 E.11943
G1 X127.082 Y117.515 E.14698
G1 X129.868 Y117.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.62 Y119.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.975 Y127.49 Z7.6 F42000
G1 X130.016 Y128.376 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4215
M204 S6000
G1 X130.019 Y128.417 E.00138
G1 X131.515 Y139.788 E.38043
G1 X125.982 Y140.517 E.18516
G1 X124.487 Y129.168 E.37969
G3 X124.487 Y126.832 I9.078 J-1.168 E.07771
G1 X125.982 Y115.483 E.37969
G1 X131.515 Y116.212 E.18516
G1 X130.019 Y127.583 E.38043
G2 X130.003 Y128 I5.583 J.417 E.01385
G1 X130.014 Y128.316 E.01048
M204 S10000
G1 X130.421 Y128.348 F42000
G1 F4215
M204 S6000
G1 X130.423 Y128.369 E.00068
G1 X131.972 Y140.138 E.39377
G1 X125.631 Y140.973 E.21216
G1 X124.083 Y129.217 E.39334
G3 X124.083 Y126.783 I9.483 J-1.217 E.08096
G1 X125.631 Y115.027 E.39334
G1 X131.972 Y115.862 E.21216
G1 X130.423 Y127.631 E.39377
G2 X130.409 Y128 I4.972 J.369 E.01225
G1 X130.419 Y128.288 E.00957
M204 S250
G1 X130.803 Y128.181 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4215
M204 S5000
G1 X130.812 Y128.322 E.00435
G1 X132.386 Y140.28 E.3706
G3 X132.228 Y140.5 I-.191 J.029 E.00923
G1 X125.489 Y141.387 E.20884
G3 X125.267 Y141.215 I-.028 J-.193 E.00966
G1 X123.694 Y129.264 E.37038
G3 X123.694 Y126.736 I9.873 J-1.264 E.07789
G1 X125.267 Y114.785 E.37038
G3 X125.489 Y114.613 I.192 J.018 E.00966
G1 X132.23 Y115.501 E.20894
G3 X132.386 Y115.722 I-.037 J.192 E.0092
G1 X130.812 Y127.678 E.37052
G2 X130.8 Y128 I4.385 J.322 E.00991
G1 X130.802 Y128.121 E.00372
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.812 Y128.322 E-.07655
G1 X131.047 Y130.105 E-.68345
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.6
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z7.6 F4000
            G39.3 S1
            G0 Z7.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X129.808 Y128.37 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192512
G1 F4215
M204 S6000
G1 X129.743 Y128.454 E.0013
G1 X131.126 Y138.964 E.12922
M204 S10000
G1 X126.355 Y140.03 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50534
G1 F4215
M204 S6000
G1 X126.537 Y140.004 E.00693
; LINE_WIDTH: 0.532073
G1 X126.6 Y139.97 E.00283
; LINE_WIDTH: 0.582058
G1 X126.663 Y139.937 E.00312
; LINE_WIDTH: 0.632043
G1 X126.725 Y139.904 E.00341
; LINE_WIDTH: 0.706406
G1 X126.788 Y139.87 E.00384
G1 X130.569 Y139.372 E.20618
; LINE_WIDTH: 0.686356
G1 X130.632 Y139.384 E.00338
; LINE_WIDTH: 0.645668
G1 X130.696 Y139.397 E.00317
; LINE_WIDTH: 0.60498
G1 X130.759 Y139.409 E.00295
; LINE_WIDTH: 0.564292
G1 X130.822 Y139.421 E.00274
; LINE_WIDTH: 0.512048
G2 X130.969 Y139.422 I.075 J-.221 E.00572
M204 S10000
G1 X126.144 Y139.62 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.191522
G1 F4215
M204 S6000
G1 X124.752 Y129.036 E.12927
M204 S10000
G1 X125.561 Y127.963 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38294
G1 F4215
M204 S6000
G1 X125.497 Y128 E.00204
G1 X125.546 Y128.028 E.00155
M204 S10000
G1 X128.287 Y128 F42000
; LINE_WIDTH: 0.41999
G1 F4215
M204 S6000
G1 X125.368 Y127.616 E.09045
G1 X125.325 Y127.682 E.00243
G1 X125.193 Y127.712 E.00417
G1 X125.195 Y128.289 E.01774
G1 X125.326 Y128.318 E.00411
G1 X125.368 Y128.384 E.00242
G1 X128.227 Y128.008 E.0886
M204 S10000
G1 X129.21 Y127.741 F42000
G1 F4215
M204 S6000
G1 X125.211 Y127.215 E.12392
G1 X125.123 Y127.364 E.00532
G3 X124.83 Y127.37 I-.154 J-.4 E.00919
G2 X124.835 Y128.63 I6.68 J.607 E.03876
G3 X125.123 Y128.636 I.136 J.4 E.00906
G1 X125.226 Y128.783 E.00551
G1 X129.325 Y128.244 E.12705
G1 X129.497 Y127.984 E.00956
G1 X129.313 Y127.945 E.00578
G3 X129.224 Y127.799 I.086 J-.153 E.00547
M204 S10000
G1 X129.734 Y127.62 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.193362
G1 F4215
M204 S6000
G1 X131.126 Y117.036 E.13087
M204 S10000
G1 X126.355 Y115.97 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50359
G1 F4215
M204 S6000
G1 X126.498 Y115.989 E.0054
; LINE_WIDTH: 0.523924
G1 X126.556 Y116.017 E.00253
; LINE_WIDTH: 0.564612
G1 X126.614 Y116.045 E.00274
; LINE_WIDTH: 0.6053
G1 X126.672 Y116.074 E.00296
; LINE_WIDTH: 0.645988
G1 X126.73 Y116.102 E.00317
; LINE_WIDTH: 0.706534
G1 X126.788 Y116.13 E.00349
G1 X130.568 Y116.628 E.2062
; LINE_WIDTH: 0.686376
G1 X130.632 Y116.616 E.00338
; LINE_WIDTH: 0.645688
G1 X130.695 Y116.603 E.00317
; LINE_WIDTH: 0.605
G1 X130.758 Y116.591 E.00295
; LINE_WIDTH: 0.564312
G1 X130.822 Y116.579 E.00274
; LINE_WIDTH: 0.512045
G3 X130.969 Y116.578 I.075 J.222 E.00574
M204 S10000
G1 X126.144 Y116.38 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.191494
G1 F4215
M204 S6000
G1 X124.752 Y126.964 E.12924
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X125.013 Y124.981 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/73
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z7.6 I-.868 J.853 P1  F42000
G1 X128.691 Y128.722 Z7.6
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4215
M204 S6000
G1 X129.483 Y128.618 E.02651
G1 X130.824 Y138.799 E.34062
G1 X126.394 Y139.382 E.14822
G1 X125.053 Y129.201 E.34062
G1 X127.453 Y128.885 E.08029
G1 X128.632 Y128.73 E.03943
M204 S10000
G1 X128.744 Y129.126 F42000
G1 F4215
M204 S6000
G1 X129.133 Y129.075 E.01301
G1 X130.367 Y138.448 E.31361
G1 X126.744 Y138.925 E.12121
G1 X125.51 Y129.552 E.31361
G1 X127.506 Y129.289 E.06679
G1 X128.685 Y129.134 E.03943
M204 S250
G1 X128.795 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4215
M204 S5000
M73 P65 R6
G1 X129.927 Y138.111 E.26641
G1 X127.082 Y138.485 E.08819
G1 X125.95 Y129.889 E.2664
G1 X127.558 Y129.678 E.04982
G1 X128.736 Y129.523 E.03652
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.011 Y131.504 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.55 Y123.89 Z7.8 F42000
G1 X130.031 Y117.097 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4215
M204 S6000
G1 X130.824 Y117.201 E.02651
G1 X129.483 Y127.382 E.34062
G1 X125.053 Y126.799 E.14822
G1 X125.642 Y122.331 E.14949
G1 X126.394 Y116.618 E.19113
G1 X129.972 Y117.089 E.11972
M204 S10000
G1 X129.978 Y117.501 F42000
G1 F4215
M204 S6000
G1 X130.367 Y117.552 E.01301
G1 X129.133 Y126.925 E.31361
G1 X125.51 Y126.448 E.12121
G1 X126.045 Y122.384 E.13598
G1 X126.744 Y117.075 E.17763
G1 X129.919 Y117.493 E.10622
M204 S250
G1 X129.927 Y117.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4215
M204 S5000
G1 X128.795 Y126.485 E.2664
G1 X125.95 Y126.111 E.08819
G1 X126.434 Y122.435 E.11391
G1 X127.082 Y117.515 E.15249
G1 X129.868 Y117.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.62 Y119.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.975 Y127.49 Z7.8 F42000
G1 X130.016 Y128.376 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4215
M204 S6000
G1 X130.019 Y128.417 E.00138
G1 X131.515 Y139.788 E.38043
G1 X125.982 Y140.517 E.18516
G1 X124.487 Y129.168 E.37969
G3 X124.487 Y126.832 I9.912 J-1.168 E.07768
G1 X125.982 Y115.483 E.37969
G1 X131.515 Y116.212 E.18516
G1 X130.019 Y127.583 E.38043
G2 X130.003 Y128 I5.577 J.417 E.01385
G1 X130.014 Y128.316 E.01048
M204 S10000
G1 X130.421 Y128.348 F42000
G1 F4215
M204 S6000
G1 X130.423 Y128.369 E.00069
G1 X131.972 Y140.138 E.39378
G1 X125.631 Y140.973 E.21216
G1 X124.083 Y129.217 E.39334
G3 X124.083 Y126.783 I10.361 J-1.217 E.08092
G1 X125.631 Y115.027 E.39334
G1 X131.972 Y115.862 E.21216
G1 X130.423 Y127.631 E.39377
G2 X130.409 Y128 I4.967 J.369 E.01224
G1 X130.419 Y128.288 E.00957
M204 S250
G1 X130.803 Y128.184 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4215
M204 S5000
G1 X130.812 Y128.322 E.00427
G1 X132.386 Y140.28 E.3706
G3 X132.228 Y140.5 I-.19 J.03 E.00924
G1 X125.489 Y141.387 E.20884
G3 X125.268 Y141.216 I-.029 J-.192 E.00964
G1 X123.694 Y129.264 E.37041
G3 X123.694 Y126.736 I10.793 J-1.264 E.07785
G1 X125.267 Y114.785 E.37038
G3 X125.488 Y114.612 I.193 J.019 E.00964
G1 X132.23 Y115.501 E.20895
G3 X132.386 Y115.723 I-.037 J.192 E.00921
G1 X130.812 Y127.678 E.37052
G2 X130.8 Y128 I4.38 J.322 E.00991
G1 X130.802 Y128.124 E.0038
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.812 Y128.322 E-.07553
G1 X131.047 Y130.108 E-.68447
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.8
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z7.8 F4000
            G39.3 S1
            G0 Z7.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X129.807 Y128.37 F42000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192524
G1 F4215
M204 S6000
G1 X129.743 Y128.454 E.00129
G1 X131.126 Y138.964 E.12923
M204 S10000
G1 X126.355 Y140.03 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50534
G1 F4215
M204 S6000
G1 X126.537 Y140.004 E.00693
; LINE_WIDTH: 0.532073
G1 X126.6 Y139.97 E.00283
; LINE_WIDTH: 0.582058
G1 X126.663 Y139.937 E.00312
; LINE_WIDTH: 0.632043
G1 X126.725 Y139.904 E.00341
; LINE_WIDTH: 0.706406
G1 X126.788 Y139.87 E.00384
G1 X130.569 Y139.372 E.20618
; LINE_WIDTH: 0.686352
G1 X130.632 Y139.384 E.00338
; LINE_WIDTH: 0.645656
G1 X130.696 Y139.397 E.00317
; LINE_WIDTH: 0.60496
G1 X130.759 Y139.409 E.00295
; LINE_WIDTH: 0.564264
G1 X130.822 Y139.421 E.00274
; LINE_WIDTH: 0.51202
G2 X130.969 Y139.422 I.075 J-.221 E.00572
M204 S10000
G1 X126.144 Y139.62 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.191512
G1 F4215
M204 S6000
G1 X124.752 Y129.036 E.12926
M204 S10000
G1 X125.561 Y127.963 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F4215
M204 S6000
G1 X125.497 Y128 E.00204
G1 X125.546 Y128.028 E.00155
M204 S10000
G1 X128.286 Y128 F42000
; LINE_WIDTH: 0.41999
G1 F4215
M204 S6000
G1 X125.368 Y127.616 E.09045
G1 X125.325 Y127.682 E.00243
G1 X125.193 Y127.712 E.00417
G1 X125.195 Y128.289 E.01773
G1 X125.326 Y128.318 E.00411
G1 X125.368 Y128.384 E.00242
G1 X128.227 Y128.008 E.0886
M204 S10000
G1 X129.21 Y127.741 F42000
G1 F4215
M204 S6000
G1 X125.211 Y127.215 E.12392
G1 X125.123 Y127.364 E.00532
G3 X124.83 Y127.37 I-.154 J-.4 E.00919
G2 X124.835 Y128.63 I6.678 J.607 E.03876
G3 X125.123 Y128.636 I.136 J.4 E.00906
G1 X125.226 Y128.783 E.00551
G1 X129.325 Y128.244 E.12704
G1 X129.496 Y127.984 E.00955
G1 X129.313 Y127.945 E.00576
G3 X129.224 Y127.799 I.086 J-.152 E.00546
M204 S10000
G1 X129.734 Y127.62 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.193363
G1 F4215
M204 S6000
G1 X131.126 Y117.036 E.13087
M204 S10000
G1 X126.355 Y115.97 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.5036
G1 F4215
M204 S6000
G1 X126.498 Y115.989 E.0054
; LINE_WIDTH: 0.523924
G1 X126.556 Y116.017 E.00253
; LINE_WIDTH: 0.564612
G1 X126.614 Y116.045 E.00274
; LINE_WIDTH: 0.6053
G1 X126.672 Y116.074 E.00296
; LINE_WIDTH: 0.645988
G1 X126.73 Y116.102 E.00317
; LINE_WIDTH: 0.706534
G1 X126.788 Y116.13 E.00349
G1 X130.568 Y116.628 E.2062
; LINE_WIDTH: 0.686374
G1 X130.632 Y116.616 E.00338
; LINE_WIDTH: 0.645682
G1 X130.695 Y116.603 E.00317
; LINE_WIDTH: 0.60499
G1 X130.758 Y116.591 E.00295
; LINE_WIDTH: 0.564298
G1 X130.822 Y116.579 E.00274
; LINE_WIDTH: 0.512025
G3 X130.969 Y116.578 I.075 J.222 E.00574
M204 S10000
G1 X126.144 Y116.38 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.191495
G1 F4215
M204 S6000
G1 X124.752 Y126.964 E.12924
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X125.013 Y124.981 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/73
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z7.8 I-.868 J.853 P1  F42000
G1 X128.691 Y128.722 Z7.8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4215
M204 S6000
G1 X129.483 Y128.618 E.02651
G1 X130.824 Y138.799 E.34062
G1 X126.394 Y139.382 E.14822
G1 X125.053 Y129.201 E.34062
G1 X127.4 Y128.892 E.07853
G1 X128.632 Y128.73 E.04119
M204 S10000
G1 X128.744 Y129.126 F42000
G1 F4215
M204 S6000
G1 X129.133 Y129.075 E.01301
G1 X130.367 Y138.448 E.31361
G1 X126.744 Y138.925 E.12121
G1 X125.51 Y129.552 E.31361
G1 X127.454 Y129.296 E.06502
G1 X128.685 Y129.134 E.04119
M204 S250
G1 X128.795 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4215
M204 S5000
G1 X129.927 Y138.111 E.2664
G1 X127.082 Y138.485 E.08819
G1 X125.95 Y129.889 E.2664
G1 X127.505 Y129.685 E.04818
G1 X128.736 Y129.523 E.03816
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.011 Y131.504 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.55 Y123.89 Z8 F42000
G1 X130.031 Y117.097 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4215
M204 S6000
G1 X130.824 Y117.201 E.02651
G1 X129.483 Y127.382 E.34062
G1 X125.053 Y126.799 E.14822
G1 X125.618 Y122.509 E.14354
G1 X126.394 Y116.618 E.19708
G1 X129.972 Y117.089 E.11972
M204 S10000
G1 X129.978 Y117.501 F42000
G1 F4215
M204 S6000
G1 X130.367 Y117.552 E.01301
G1 X129.133 Y126.925 E.31361
G1 X125.51 Y126.448 E.12121
G1 X126.022 Y122.562 E.13003
G1 X126.744 Y117.075 E.18358
G1 X129.919 Y117.493 E.10622
M204 S250
G1 X129.927 Y117.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4215
M204 S5000
G1 X128.795 Y126.485 E.2664
G1 X125.95 Y126.111 E.08819
G1 X126.41 Y122.613 E.1084
G1 X127.082 Y117.515 E.158
G1 X129.868 Y117.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.62 Y119.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.975 Y127.49 Z8 F42000
G1 X130.016 Y128.376 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P66 R6
G1 F4215
M204 S6000
G1 X130.019 Y128.417 E.00138
G1 X131.515 Y139.788 E.38043
G1 X125.982 Y140.517 E.18516
G1 X124.487 Y129.168 E.3797
G3 X124.487 Y126.832 I9.913 J-1.168 E.07768
G1 X125.982 Y115.483 E.37969
G1 X131.515 Y116.212 E.18516
G1 X130.018 Y127.59 E.38066
G2 X130.001 Y128.004 I4.961 J.408 E.01375
G1 X130.013 Y128.316 E.01036
M204 S10000
G1 X130.421 Y128.348 F42000
G1 F4215
M204 S6000
G1 X130.423 Y128.369 E.00069
G1 X131.972 Y140.138 E.39377
G1 X125.631 Y140.973 E.21216
G1 X124.083 Y129.217 E.39334
G3 X124.083 Y126.783 I10.362 J-1.217 E.08092
G1 X125.631 Y115.027 E.39334
G1 X131.972 Y115.862 E.21216
G1 X130.422 Y127.635 E.39391
G2 X130.407 Y128.002 I4.371 J.363 E.01218
G1 X130.419 Y128.288 E.00949
M204 S250
G1 X130.803 Y128.186 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4215
M204 S5000
G1 X130.812 Y128.322 E.00419
G1 X132.386 Y140.28 E.3706
G3 X132.23 Y140.499 I-.192 J.028 E.00914
G1 X125.49 Y141.387 E.20891
G3 X125.267 Y141.214 I-.029 J-.192 E.00969
G1 X123.694 Y129.264 E.37037
G3 X123.694 Y126.736 I10.793 J-1.264 E.07785
G1 X125.267 Y114.785 E.37038
G3 X125.489 Y114.613 I.194 J.02 E.00964
G1 X132.249 Y115.505 E.20951
G3 X132.386 Y115.722 I-.053 J.186 E.00867
G1 X130.812 Y127.679 E.37057
G2 X130.798 Y128.001 I3.803 J.32 E.00989
G1 X130.802 Y128.126 E.00385
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.812 Y128.322 E-.07466
G1 X131.047 Y130.11 E-.68534
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z8 F4000
            G39.3 S1
            G0 Z8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X129.808 Y128.37 F42000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192511
G1 F4215
M204 S6000
G1 X129.743 Y128.454 E.0013
G1 X131.126 Y138.964 E.12922
M204 S10000
G1 X126.355 Y140.03 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50536
G1 F4215
M204 S6000
G1 X126.537 Y140.004 E.00693
; LINE_WIDTH: 0.53209
G1 X126.6 Y139.97 E.00283
; LINE_WIDTH: 0.58207
G1 X126.663 Y139.937 E.00312
; LINE_WIDTH: 0.63205
G1 X126.725 Y139.904 E.00341
; LINE_WIDTH: 0.706396
G1 X126.788 Y139.87 E.00384
G1 X130.569 Y139.372 E.20618
; LINE_WIDTH: 0.686336
G1 X130.632 Y139.384 E.00338
; LINE_WIDTH: 0.645648
G1 X130.696 Y139.397 E.00317
; LINE_WIDTH: 0.60496
G1 X130.759 Y139.409 E.00295
; LINE_WIDTH: 0.564272
G1 X130.822 Y139.421 E.00274
; LINE_WIDTH: 0.512033
G2 X130.969 Y139.422 I.075 J-.221 E.00572
M204 S10000
G1 X126.144 Y139.62 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.19151
G1 F4215
M204 S6000
G1 X124.752 Y129.036 E.12926
M204 S10000
G1 X125.561 Y127.963 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F4215
M204 S6000
G1 X125.497 Y128 E.00204
G1 X125.546 Y128.028 E.00155
M204 S10000
G1 X128.287 Y128 F42000
; LINE_WIDTH: 0.41999
G1 F4215
M204 S6000
G1 X125.368 Y127.616 E.09045
G1 X125.326 Y127.682 E.00243
G1 X125.193 Y127.712 E.00417
G1 X125.195 Y128.289 E.01773
G1 X125.326 Y128.318 E.00411
G1 X125.368 Y128.384 E.00242
G1 X128.227 Y128.008 E.0886
M204 S10000
G1 X129.21 Y127.741 F42000
G1 F4215
M204 S6000
G1 X125.211 Y127.215 E.12393
G1 X125.123 Y127.364 E.00532
G3 X124.83 Y127.37 I-.154 J-.4 E.00919
G2 X124.835 Y128.63 I6.68 J.607 E.03876
G3 X125.123 Y128.636 I.136 J.4 E.00906
G1 X125.226 Y128.783 E.00551
G1 X129.305 Y128.246 E.12642
G1 X129.49 Y127.983 E.00988
G1 X129.296 Y127.933 E.00616
G3 X129.224 Y127.799 I.101 J-.14 E.00483
M204 S10000
G1 X129.734 Y127.62 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.19376
G1 F4215
M204 S6000
G1 X131.126 Y117.036 E.13121
M204 S10000
G1 X126.355 Y115.97 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50359
G1 F4215
M204 S6000
G1 X126.498 Y115.989 E.0054
; LINE_WIDTH: 0.523924
G1 X126.556 Y116.017 E.00253
; LINE_WIDTH: 0.564612
G1 X126.614 Y116.045 E.00274
; LINE_WIDTH: 0.6053
G1 X126.672 Y116.074 E.00296
; LINE_WIDTH: 0.645988
G1 X126.73 Y116.102 E.00317
; LINE_WIDTH: 0.706534
G1 X126.788 Y116.13 E.00349
G1 X130.568 Y116.628 E.20619
; LINE_WIDTH: 0.68638
G1 X130.632 Y116.616 E.00338
; LINE_WIDTH: 0.6457
G1 X130.695 Y116.603 E.00317
; LINE_WIDTH: 0.60502
G1 X130.758 Y116.591 E.00295
; LINE_WIDTH: 0.56434
G1 X130.822 Y116.579 E.00274
; LINE_WIDTH: 0.512065
G3 X130.969 Y116.578 I.075 J.222 E.00575
M204 S10000
G1 X126.144 Y116.38 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.191493
G1 F4215
M204 S6000
G1 X124.752 Y126.964 E.12924
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X125.013 Y124.981 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/73
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z8 I-.868 J.853 P1  F42000
G1 X128.691 Y128.722 Z8
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4215
M204 S6000
G1 X129.483 Y128.618 E.02651
G1 X130.824 Y138.799 E.34062
G1 X126.394 Y139.382 E.14822
G1 X125.053 Y129.201 E.34062
G1 X127.348 Y128.899 E.07676
G1 X128.632 Y128.73 E.04296
M204 S10000
G1 X128.744 Y129.126 F42000
G1 F4215
M204 S6000
G1 X129.133 Y129.075 E.01301
G1 X130.367 Y138.448 E.31361
G1 X126.744 Y138.925 E.12121
G1 X125.51 Y129.552 E.31361
G1 X127.401 Y129.303 E.06326
G1 X128.685 Y129.134 E.04296
M204 S250
G1 X128.795 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4215
M204 S5000
G1 X129.927 Y138.111 E.2664
G1 X127.082 Y138.485 E.08819
G1 X125.95 Y129.889 E.2664
G1 X127.452 Y129.692 E.04655
G1 X128.736 Y129.523 E.0398
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.011 Y131.504 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.55 Y123.89 Z8.2 F42000
G1 X130.031 Y117.097 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4215
M204 S6000
G1 X130.824 Y117.201 E.02651
G1 X129.483 Y127.382 E.34062
G1 X125.053 Y126.799 E.14822
G1 X125.595 Y122.686 E.13759
G1 X126.394 Y116.618 E.20303
G1 X129.972 Y117.089 E.11972
M204 S10000
G1 X129.978 Y117.501 F42000
G1 F4215
M204 S6000
G1 X130.367 Y117.552 E.01301
G1 X129.133 Y126.925 E.31361
G1 X125.51 Y126.448 E.12121
G1 X125.998 Y122.739 E.12408
G1 X126.744 Y117.075 E.18953
G1 X129.919 Y117.493 E.10622
M204 S250
G1 X129.927 Y117.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4215
M204 S5000
G1 X128.795 Y126.485 E.2664
G1 X125.95 Y126.111 E.08819
G1 X126.387 Y122.791 E.10289
G1 X127.082 Y117.515 E.16351
G1 X129.868 Y117.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.62 Y119.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.975 Y127.49 Z8.2 F42000
G1 X130.016 Y128.376 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4215
M204 S6000
G1 X130.019 Y128.417 E.00139
G1 X131.515 Y139.788 E.38043
G1 X125.982 Y140.517 E.18516
G1 X124.487 Y129.168 E.37969
G3 X124.487 Y126.832 I9.914 J-1.168 E.07768
G1 X125.982 Y115.483 E.37969
G1 X131.515 Y116.212 E.18516
G1 X130.019 Y127.583 E.38043
G2 X130.003 Y128 I5.583 J.417 E.01385
G1 X130.014 Y128.316 E.01047
M204 S10000
G1 X130.421 Y128.348 F42000
G1 F4215
M204 S6000
G1 X130.423 Y128.369 E.00069
G1 X131.972 Y140.138 E.39377
G1 X125.631 Y140.973 E.21216
G1 X124.083 Y129.217 E.39334
G3 X124.083 Y126.783 I10.363 J-1.217 E.08092
G1 X125.631 Y115.027 E.39334
G1 X131.972 Y115.862 E.21216
G1 X130.423 Y127.631 E.39377
G2 X130.409 Y128 I4.972 J.369 E.01225
G1 X130.419 Y128.288 E.00956
M204 S250
G1 X130.803 Y128.188 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4215
M204 S5000
G1 X130.812 Y128.322 E.00413
G1 X132.386 Y140.28 E.3706
G3 X132.23 Y140.499 I-.191 J.029 E.00915
G1 X125.49 Y141.387 E.20891
G3 X125.268 Y141.215 I-.029 J-.193 E.00964
G1 X123.694 Y129.264 E.37041
G3 X123.694 Y126.736 I10.795 J-1.264 E.07785
G1 X125.268 Y114.784 E.37041
G3 X125.488 Y114.612 I.192 J.019 E.00962
G1 X132.23 Y115.501 E.20895
G3 X132.386 Y115.722 I-.038 J.193 E.00919
G1 X130.812 Y127.678 E.37052
G2 X130.8 Y128 I4.385 J.322 E.00991
G1 X130.802 Y128.128 E.00394
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.812 Y128.322 E-.07383
G1 X131.048 Y130.112 E-.68617
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.2
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z8.2 F4000
            G39.3 S1
            G0 Z8.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X129.808 Y128.37 F42000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.1925
G1 F4215
M204 S6000
G1 X129.743 Y128.454 E.0013
G1 X131.126 Y138.964 E.12921
M204 S10000
M73 P67 R6
G1 X126.355 Y140.03 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50534
G1 F4215
M204 S6000
G1 X126.537 Y140.004 E.00693
; LINE_WIDTH: 0.53207
G1 X126.6 Y139.97 E.00283
; LINE_WIDTH: 0.58205
G1 X126.663 Y139.937 E.00312
; LINE_WIDTH: 0.63203
G1 X126.725 Y139.904 E.00341
; LINE_WIDTH: 0.706406
G1 X126.788 Y139.87 E.00384
G1 X130.569 Y139.372 E.20618
; LINE_WIDTH: 0.686376
G1 X130.632 Y139.384 E.00338
; LINE_WIDTH: 0.645688
G1 X130.696 Y139.397 E.00317
; LINE_WIDTH: 0.605
G1 X130.759 Y139.409 E.00295
; LINE_WIDTH: 0.564312
G1 X130.822 Y139.421 E.00274
; LINE_WIDTH: 0.512068
G2 X130.969 Y139.422 I.075 J-.221 E.00572
M204 S10000
G1 X126.144 Y139.62 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.191501
G1 F4215
M204 S6000
G1 X124.752 Y129.036 E.12925
M204 S10000
G1 X125.561 Y127.963 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F4215
M204 S6000
G1 X125.497 Y128 E.00204
G1 X125.546 Y128.028 E.00155
M204 S10000
G1 X128.287 Y128 F42000
; LINE_WIDTH: 0.41999
G1 F4215
M204 S6000
G1 X125.368 Y127.616 E.09045
G1 X125.325 Y127.682 E.00243
G1 X125.193 Y127.712 E.00417
G1 X125.195 Y128.289 E.01773
G1 X125.326 Y128.318 E.00411
G1 X125.368 Y128.384 E.00242
G1 X128.227 Y128.008 E.0886
M204 S10000
G1 X129.21 Y127.741 F42000
G1 F4215
M204 S6000
G1 X125.211 Y127.215 E.12392
G1 X125.123 Y127.364 E.00532
G3 X124.83 Y127.37 I-.154 J-.4 E.00919
G2 X124.835 Y128.63 I6.68 J.607 E.03876
G3 X125.123 Y128.636 I.136 J.4 E.00906
G1 X125.226 Y128.783 E.00551
G1 X129.305 Y128.246 E.12642
G1 X129.49 Y127.983 E.00988
G1 X129.296 Y127.933 E.00616
G3 X129.224 Y127.799 I.101 J-.141 E.00483
M204 S10000
G1 X129.734 Y127.62 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.193362
G1 F4215
M204 S6000
G1 X131.126 Y117.036 E.13087
M204 S10000
G1 X126.355 Y115.97 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50359
G1 F4215
M204 S6000
G1 X126.498 Y115.989 E.0054
; LINE_WIDTH: 0.523924
G1 X126.556 Y116.017 E.00253
; LINE_WIDTH: 0.564612
G1 X126.614 Y116.045 E.00274
; LINE_WIDTH: 0.6053
G1 X126.672 Y116.074 E.00296
; LINE_WIDTH: 0.645988
G1 X126.73 Y116.102 E.00317
; LINE_WIDTH: 0.706534
G1 X126.788 Y116.13 E.00349
G1 X130.568 Y116.628 E.2062
; LINE_WIDTH: 0.686376
G1 X130.632 Y116.616 E.00338
; LINE_WIDTH: 0.645688
G1 X130.695 Y116.603 E.00317
; LINE_WIDTH: 0.605
G1 X130.758 Y116.591 E.00295
; LINE_WIDTH: 0.564312
G1 X130.822 Y116.579 E.00274
; LINE_WIDTH: 0.512045
G3 X130.969 Y116.578 I.075 J.222 E.00574
M204 S10000
G1 X126.144 Y116.38 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.191493
G1 F4215
M204 S6000
G1 X124.752 Y126.964 E.12924
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X125.013 Y124.981 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/73
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z8.2 I-.868 J.853 P1  F42000
G1 X128.691 Y128.722 Z8.2
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4215
M204 S6000
G1 X129.483 Y128.618 E.02651
G1 X130.824 Y138.799 E.34062
G1 X126.394 Y139.382 E.14822
G1 X125.053 Y129.201 E.34062
G1 X127.295 Y128.906 E.07499
G1 X128.632 Y128.73 E.04473
M204 S10000
G1 X128.744 Y129.126 F42000
G1 F4215
M204 S6000
G1 X129.133 Y129.075 E.01301
G1 X130.367 Y138.448 E.31361
G1 X126.744 Y138.925 E.12121
G1 X125.51 Y129.552 E.31361
G1 X127.348 Y129.31 E.06149
G1 X128.685 Y129.134 E.04473
M204 S250
G1 X128.795 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4215
M204 S5000
G1 X129.927 Y138.111 E.2664
G1 X127.082 Y138.485 E.08819
G1 X125.95 Y129.889 E.2664
G1 X127.399 Y129.699 E.04491
G1 X128.736 Y129.523 E.04143
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.011 Y131.504 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.55 Y123.89 Z8.4 F42000
G1 X130.031 Y117.097 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4215
M204 S6000
G1 X130.824 Y117.201 E.02651
G1 X129.483 Y127.382 E.34062
G1 X125.053 Y126.799 E.14822
G1 X125.571 Y122.864 E.13164
G1 X126.394 Y116.618 E.20898
G1 X129.972 Y117.089 E.11972
M204 S10000
G1 X129.978 Y117.501 F42000
G1 F4215
M204 S6000
G1 X130.367 Y117.552 E.01301
G1 X129.133 Y126.925 E.31361
G1 X125.51 Y126.448 E.12121
G1 X125.975 Y122.917 E.11813
G1 X126.744 Y117.075 E.19548
G1 X129.919 Y117.493 E.10622
M204 S250
G1 X129.927 Y117.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4215
M204 S5000
G1 X128.795 Y126.485 E.2664
G1 X125.95 Y126.111 E.08819
G1 X126.364 Y122.968 E.09738
G1 X127.082 Y117.515 E.16902
G1 X129.868 Y117.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.62 Y119.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.974 Y127.49 Z8.4 F42000
G1 X130.015 Y128.37 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4215
M204 S6000
G1 X130.017 Y128.407 E.0012
G1 X131.515 Y139.788 E.38079
G1 X125.982 Y140.517 E.18516
G1 X124.487 Y129.168 E.37969
G3 X124.487 Y126.832 I9.913 J-1.168 E.07768
G1 X125.982 Y115.483 E.37969
G1 X131.515 Y116.212 E.18516
G1 X130.017 Y127.593 E.38079
G2 X129.995 Y128 I3.731 J.407 E.01351
G1 X130.012 Y128.311 E.01032
M204 S10000
G1 X130.421 Y128.345 F42000
G1 F4215
M204 S6000
G1 X130.422 Y128.362 E.00058
G1 X131.972 Y140.138 E.39399
G1 X125.631 Y140.973 E.21216
G1 X124.083 Y129.217 E.39334
G3 X124.083 Y126.783 I10.362 J-1.217 E.08092
G1 X125.631 Y115.027 E.39334
G1 X131.972 Y115.862 E.21216
G1 X130.422 Y127.638 E.39399
G2 X130.402 Y128 I3.247 J.362 E.01205
G1 X130.417 Y128.285 E.00946
M204 S250
G1 X130.803 Y128.19 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4215
M204 S5000
G1 X130.812 Y128.32 E.00398
G1 X132.386 Y140.28 E.37068
G3 X132.229 Y140.5 I-.191 J.029 E.00919
G1 X125.489 Y141.387 E.20888
G3 X125.268 Y141.217 I-.028 J-.193 E.00958
G1 X123.694 Y129.264 E.37046
G3 X123.694 Y126.736 I10.793 J-1.264 E.07785
G1 X125.267 Y114.785 E.37038
G3 X125.489 Y114.612 I.192 J.018 E.00966
G1 X132.23 Y115.501 E.20895
G3 X132.386 Y115.722 I-.036 J.191 E.00922
G1 X130.812 Y127.68 E.37059
G2 X130.793 Y128 I2.785 J.32 E.00985
G1 X130.8 Y128.131 E.00402
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.812 Y128.32 E-.07208
G1 X131.048 Y130.115 E-.68792
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.4
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z8.4 F4000
            G39.3 S1
            G0 Z8.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X129.808 Y128.37 F42000
G1 Z8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192281
G1 F4215
M204 S6000
G1 X129.743 Y128.454 E.0013
G1 X131.126 Y138.964 E.12902
M204 S10000
G1 X126.355 Y140.03 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50536
G1 F4215
M204 S6000
G1 X126.537 Y140.004 E.00693
; LINE_WIDTH: 0.53209
G1 X126.6 Y139.97 E.00283
; LINE_WIDTH: 0.58207
G1 X126.663 Y139.937 E.00312
; LINE_WIDTH: 0.63205
G1 X126.725 Y139.904 E.00341
; LINE_WIDTH: 0.706416
G1 X126.788 Y139.87 E.00384
G1 X130.569 Y139.372 E.20619
; LINE_WIDTH: 0.686374
G1 X130.632 Y139.384 E.00338
; LINE_WIDTH: 0.645682
G1 X130.696 Y139.397 E.00317
; LINE_WIDTH: 0.60499
G1 X130.759 Y139.409 E.00295
; LINE_WIDTH: 0.564298
G1 X130.822 Y139.421 E.00274
; LINE_WIDTH: 0.512059
G2 X130.969 Y139.422 I.075 J-.221 E.00572
M204 S10000
G1 X126.144 Y139.62 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.19151
G1 F4215
M204 S6000
G1 X124.752 Y129.036 E.12926
M204 S10000
G1 X125.561 Y127.963 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F4215
M204 S6000
G1 X125.497 Y128 E.00204
G1 X125.546 Y128.028 E.00155
M204 S10000
G1 X128.286 Y128 F42000
; LINE_WIDTH: 0.41999
G1 F4215
M204 S6000
G1 X125.368 Y127.616 E.09045
G1 X125.325 Y127.682 E.00243
G1 X125.193 Y127.712 E.00417
G1 X125.195 Y128.289 E.01773
G1 X125.326 Y128.318 E.00411
G1 X125.368 Y128.384 E.00242
G1 X128.227 Y128.008 E.0886
M204 S10000
G1 X129.309 Y127.754 F42000
G1 F4215
M204 S6000
G1 X125.211 Y127.215 E.12699
G1 X125.123 Y127.364 E.00532
G3 X124.83 Y127.37 I-.154 J-.4 E.00919
G2 X124.835 Y128.63 I6.68 J.607 E.03876
G3 X125.123 Y128.636 I.136 J.4 E.00906
G1 X125.226 Y128.783 E.00551
G1 X129.322 Y128.244 E.12696
M73 P68 R6
G1 X129.477 Y128.017 E.00844
G1 X129.341 Y127.805 E.00773
M204 S10000
G1 X129.808 Y127.63 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192273
G1 F4215
M204 S6000
G1 X129.743 Y127.546 E.0013
G1 X131.126 Y117.036 E.12901
M204 S10000
G1 X126.355 Y115.97 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50359
G1 F4215
M204 S6000
G1 X126.498 Y115.989 E.0054
; LINE_WIDTH: 0.523924
G1 X126.556 Y116.017 E.00253
; LINE_WIDTH: 0.564612
G1 X126.614 Y116.045 E.00274
; LINE_WIDTH: 0.6053
G1 X126.672 Y116.074 E.00296
; LINE_WIDTH: 0.645988
G1 X126.73 Y116.102 E.00317
; LINE_WIDTH: 0.706534
G1 X126.788 Y116.13 E.00349
G1 X130.569 Y116.628 E.20623
; LINE_WIDTH: 0.686374
G1 X130.632 Y116.616 E.00338
; LINE_WIDTH: 0.645682
G1 X130.696 Y116.603 E.00317
; LINE_WIDTH: 0.60499
G1 X130.759 Y116.591 E.00295
; LINE_WIDTH: 0.564298
G1 X130.822 Y116.579 E.00274
; LINE_WIDTH: 0.512066
G3 X130.969 Y116.578 I.075 J.221 E.00572
M204 S10000
G1 X126.144 Y116.38 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.191493
G1 F4215
M204 S6000
G1 X124.752 Y126.964 E.12924
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X125.013 Y124.981 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/73
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z8.4 I-.868 J.853 P1  F42000
G1 X128.691 Y128.722 Z8.4
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4215
M204 S6000
G1 X129.483 Y128.618 E.02651
G1 X130.824 Y138.799 E.34062
G1 X126.394 Y139.382 E.14822
G1 X125.053 Y129.201 E.34062
G1 X127.242 Y128.913 E.07323
G1 X128.632 Y128.73 E.04649
M204 S10000
G1 X128.744 Y129.126 F42000
G1 F4215
M204 S6000
G1 X129.133 Y129.075 E.01301
G1 X130.367 Y138.448 E.31361
G1 X126.744 Y138.925 E.12121
G1 X125.51 Y129.552 E.31361
G1 X127.295 Y129.317 E.05972
G1 X128.685 Y129.134 E.04649
M204 S250
G1 X128.795 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4215
M204 S5000
G1 X129.927 Y138.111 E.2664
G1 X127.082 Y138.485 E.08819
G1 X125.95 Y129.889 E.2664
G1 X127.346 Y129.706 E.04328
G1 X128.736 Y129.523 E.04307
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.011 Y131.504 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.55 Y123.89 Z8.6 F42000
G1 X130.031 Y117.097 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4215
M204 S6000
G1 X130.824 Y117.201 E.02651
G1 X129.483 Y127.382 E.34062
G1 X125.053 Y126.799 E.14822
G1 X125.548 Y123.042 E.12569
G1 X126.394 Y116.618 E.21493
G1 X129.972 Y117.089 E.11972
M204 S10000
G1 X129.978 Y117.501 F42000
G1 F4215
M204 S6000
G1 X130.367 Y117.552 E.01301
G1 X129.133 Y126.925 E.31361
G1 X125.51 Y126.448 E.12121
G1 X125.952 Y123.095 E.11219
G1 X126.744 Y117.075 E.20142
G1 X129.919 Y117.493 E.10622
M204 S250
G1 X129.927 Y117.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4215
M204 S5000
G1 X128.795 Y126.485 E.2664
G1 X125.95 Y126.111 E.08819
G1 X126.34 Y123.146 E.09187
G1 X127.082 Y117.515 E.17453
G1 X129.868 Y117.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.62 Y119.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.975 Y127.49 Z8.6 F42000
G1 X130.016 Y128.376 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4215
M204 S6000
G1 X130.019 Y128.417 E.00138
G1 X131.515 Y139.788 E.38043
G1 X125.981 Y140.517 E.18516
G1 X124.487 Y129.168 E.37969
G3 X124.487 Y126.832 I9.078 J-1.168 E.07771
G1 X125.982 Y115.483 E.37969
G1 X131.515 Y116.212 E.18516
G1 X130.018 Y127.59 E.38068
G2 X130.001 Y128.004 I4.911 J.408 E.01375
G1 X130.013 Y128.316 E.01034
M204 S10000
G1 X130.421 Y128.348 F42000
G1 F4215
M204 S6000
G1 X130.423 Y128.369 E.00069
G1 X131.972 Y140.138 E.39377
G1 X125.631 Y140.973 E.21216
G1 X124.083 Y129.217 E.39334
G3 X124.083 Y126.783 I9.483 J-1.217 E.08096
G1 X125.631 Y115.027 E.39334
G1 X131.972 Y115.862 E.21216
G1 X130.422 Y127.636 E.39392
G2 X130.407 Y128.003 I4.325 J.363 E.01218
G1 X130.419 Y128.288 E.00948
M204 S250
G1 X130.803 Y128.192 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4215
M204 S5000
G1 X130.812 Y128.322 E.00401
G1 X132.386 Y140.28 E.3706
G3 X132.23 Y140.499 I-.192 J.028 E.00914
G1 X125.489 Y141.387 E.20892
G3 X125.268 Y141.217 I-.028 J-.193 E.00958
G1 X123.694 Y129.264 E.37045
G3 X123.694 Y126.736 I9.873 J-1.264 E.07789
G1 X125.268 Y114.784 E.37041
G3 X125.488 Y114.612 I.193 J.02 E.00961
G1 X132.23 Y115.501 E.20895
G3 X132.386 Y115.722 I-.039 J.193 E.00919
G1 X130.812 Y127.679 E.37058
G2 X130.798 Y128.001 I3.76 J.32 E.00989
G1 X130.802 Y128.132 E.00403
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.812 Y128.322 E-.07234
G1 X131.048 Y130.116 E-.68766
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.6
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z8.6 F4000
            G39.3 S1
            G0 Z8.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X129.808 Y128.37 F42000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192511
G1 F4215
M204 S6000
G1 X129.743 Y128.454 E.0013
G1 X131.126 Y138.964 E.12921
M204 S10000
G1 X126.355 Y140.03 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50534
G1 F4215
M204 S6000
G1 X126.537 Y140.004 E.00693
; LINE_WIDTH: 0.532073
G1 X126.6 Y139.97 E.00283
; LINE_WIDTH: 0.582058
G1 X126.663 Y139.937 E.00312
; LINE_WIDTH: 0.632043
G1 X126.725 Y139.904 E.00341
; LINE_WIDTH: 0.706406
G1 X126.788 Y139.87 E.00384
G1 X130.569 Y139.372 E.20618
; LINE_WIDTH: 0.686356
G1 X130.632 Y139.384 E.00338
; LINE_WIDTH: 0.645668
G1 X130.696 Y139.397 E.00317
; LINE_WIDTH: 0.60498
G1 X130.759 Y139.409 E.00295
; LINE_WIDTH: 0.564292
G1 X130.822 Y139.421 E.00274
; LINE_WIDTH: 0.512048
G2 X130.969 Y139.422 I.075 J-.221 E.00572
M204 S10000
G1 X126.144 Y139.62 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.191522
G1 F4215
M204 S6000
G1 X124.752 Y129.036 E.12927
M204 S10000
G1 X125.561 Y127.963 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38294
G1 F4215
M204 S6000
G1 X125.497 Y128 E.00204
G1 X125.546 Y128.028 E.00155
M204 S10000
G1 X128.286 Y128 F42000
; LINE_WIDTH: 0.41999
G1 F4215
M204 S6000
G1 X125.368 Y127.616 E.09045
G1 X125.325 Y127.682 E.00243
G1 X125.193 Y127.712 E.00417
G1 X125.195 Y128.289 E.01773
G1 X125.326 Y128.318 E.00411
G1 X125.368 Y128.384 E.00242
G1 X128.227 Y128.008 E.0886
M204 S10000
G1 X129.21 Y127.741 F42000
G1 F4215
M204 S6000
G1 X125.211 Y127.215 E.12392
G1 X125.123 Y127.364 E.00532
G3 X124.83 Y127.37 I-.154 J-.4 E.00919
G2 X124.835 Y128.63 I6.68 J.607 E.03876
G3 X125.123 Y128.636 I.136 J.4 E.00906
G1 X125.226 Y128.783 E.00551
G1 X129.305 Y128.246 E.12642
G1 X129.49 Y127.983 E.00988
G1 X129.296 Y127.933 E.00616
G3 X129.224 Y127.799 I.101 J-.141 E.00483
M204 S10000
G1 X129.734 Y127.62 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.19377
G1 F4215
M204 S6000
G1 X131.126 Y117.036 E.13122
M204 S10000
G1 X126.355 Y115.97 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50359
G1 F4215
M204 S6000
G1 X126.498 Y115.989 E.0054
; LINE_WIDTH: 0.523922
G1 X126.556 Y116.017 E.00253
; LINE_WIDTH: 0.564606
G1 X126.614 Y116.045 E.00274
; LINE_WIDTH: 0.60529
G1 X126.672 Y116.074 E.00296
; LINE_WIDTH: 0.645974
G1 X126.73 Y116.102 E.00317
; LINE_WIDTH: 0.706514
G1 X126.788 Y116.13 E.00349
G1 X130.568 Y116.628 E.20618
; LINE_WIDTH: 0.686358
M73 P68 R5
G1 X130.632 Y116.616 E.00338
; LINE_WIDTH: 0.645674
G1 X130.695 Y116.603 E.00317
; LINE_WIDTH: 0.60499
G1 X130.758 Y116.591 E.00295
; LINE_WIDTH: 0.564306
G1 X130.822 Y116.579 E.00274
; LINE_WIDTH: 0.512023
G3 X130.969 Y116.578 I.076 J.222 E.00575
M204 S10000
G1 X126.144 Y116.38 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.191493
G1 F4215
M204 S6000
G1 X124.752 Y126.964 E.12924
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X125.013 Y124.981 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 42/73
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z8.6 I-.868 J.853 P1  F42000
G1 X128.691 Y128.722 Z8.6
G1 Z8.4
M73 P69 R5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4216
M204 S6000
G1 X129.483 Y128.618 E.02651
G1 X130.824 Y138.799 E.34062
G1 X126.394 Y139.382 E.14822
G1 X125.053 Y129.201 E.34062
G1 X127.189 Y128.92 E.07146
G1 X128.632 Y128.73 E.04826
M204 S10000
G1 X128.744 Y129.126 F42000
G1 F4216
M204 S6000
G1 X129.133 Y129.075 E.01301
G1 X130.367 Y138.448 E.31361
G1 X126.744 Y138.925 E.12121
G1 X125.51 Y129.552 E.31361
G1 X127.242 Y129.324 E.05796
G1 X128.685 Y129.134 E.04826
M204 S250
G1 X128.795 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4216
M204 S5000
G1 X129.927 Y138.111 E.2664
G1 X127.082 Y138.485 E.08819
G1 X125.95 Y129.889 E.2664
G1 X127.294 Y129.713 E.04164
G1 X128.736 Y129.523 E.0447
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.011 Y131.504 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.55 Y123.89 Z8.8 F42000
G1 X130.031 Y117.097 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4216
M204 S6000
G1 X130.824 Y117.201 E.02651
G1 X129.483 Y127.382 E.34062
G1 X125.053 Y126.799 E.14822
G1 X125.525 Y123.22 E.11974
G1 X126.394 Y116.618 E.22088
G1 X129.972 Y117.089 E.11972
M204 S10000
G1 X129.978 Y117.501 F42000
G1 F4216
M204 S6000
G1 X130.367 Y117.552 E.01301
G1 X129.133 Y126.925 E.31361
G1 X125.51 Y126.448 E.12121
G1 X125.928 Y123.273 E.10624
G1 X126.744 Y117.075 E.20737
G1 X129.919 Y117.493 E.10622
M204 S250
G1 X129.927 Y117.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4216
M204 S5000
G1 X128.795 Y126.485 E.2664
G1 X125.95 Y126.111 E.08819
G1 X126.317 Y123.324 E.08636
G1 X127.082 Y117.515 E.18004
G1 X129.868 Y117.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.62 Y119.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.975 Y127.49 Z8.8 F42000
G1 X130.016 Y128.375 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4216
M204 S6000
G1 X130.019 Y128.417 E.00139
G1 X131.515 Y139.788 E.38043
G1 X125.982 Y140.517 E.18516
G1 X124.487 Y129.168 E.37969
G3 X124.487 Y126.832 I9.078 J-1.168 E.07771
G1 X125.982 Y115.483 E.37969
G1 X131.515 Y116.212 E.18516
G1 X130.019 Y127.583 E.38043
G2 X130.003 Y128 I5.582 J.417 E.01385
G1 X130.014 Y128.315 E.01047
M204 S10000
G1 X130.421 Y128.348 F42000
G1 F4216
M204 S6000
G1 X130.423 Y128.369 E.00069
G1 X131.972 Y140.138 E.39378
G1 X125.631 Y140.973 E.21216
G1 X124.083 Y129.217 E.39334
G3 X124.083 Y126.783 I9.483 J-1.217 E.08096
G1 X125.631 Y115.027 E.39334
G1 X131.972 Y115.862 E.21216
G1 X130.423 Y127.631 E.39377
G2 X130.409 Y128 I4.97 J.369 E.01225
G1 X130.419 Y128.288 E.00956
M204 S250
G1 X130.804 Y128.194 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4216
M204 S5000
G1 X130.812 Y128.322 E.00394
G1 X132.386 Y140.28 E.3706
G3 X132.228 Y140.5 I-.191 J.029 E.00923
G1 X125.49 Y141.387 E.20883
G3 X125.268 Y141.217 I-.029 J-.193 E.00959
G1 X123.694 Y129.264 E.37046
G3 X123.694 Y126.736 I9.872 J-1.264 E.07789
G1 X125.267 Y114.785 E.37038
G3 X125.488 Y114.612 I.194 J.02 E.00963
G1 X132.249 Y115.505 E.20952
G3 X132.386 Y115.723 I-.053 J.186 E.00867
G1 X130.812 Y127.678 E.37052
G2 X130.8 Y128 I4.382 J.322 E.00991
G1 X130.803 Y128.134 E.00412
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.812 Y128.322 E-.07157
G1 X131.048 Y130.118 E-.68843
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.8
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z8.8 F4000
            G39.3 S1
            G0 Z8.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X129.808 Y128.37 F42000
G1 Z8.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192511
G1 F4216
M204 S6000
G1 X129.743 Y128.454 E.0013
G1 X131.126 Y138.964 E.12922
M204 S10000
G1 X126.355 Y140.03 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50534
G1 F4216
M204 S6000
G1 X126.537 Y140.004 E.00693
; LINE_WIDTH: 0.53207
G1 X126.6 Y139.97 E.00283
; LINE_WIDTH: 0.58205
G1 X126.663 Y139.937 E.00312
; LINE_WIDTH: 0.63203
G1 X126.725 Y139.904 E.00341
; LINE_WIDTH: 0.706386
G1 X126.788 Y139.87 E.00384
G1 X130.569 Y139.372 E.20618
; LINE_WIDTH: 0.686334
G1 X130.632 Y139.384 E.00338
; LINE_WIDTH: 0.645642
G1 X130.696 Y139.397 E.00317
; LINE_WIDTH: 0.60495
G1 X130.759 Y139.409 E.00295
; LINE_WIDTH: 0.564258
G1 X130.822 Y139.421 E.00274
; LINE_WIDTH: 0.512019
G2 X130.969 Y139.422 I.075 J-.221 E.00572
M204 S10000
G1 X126.144 Y139.62 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.191522
G1 F4216
M204 S6000
G1 X124.752 Y129.036 E.12927
M204 S10000
G1 X125.561 Y127.963 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38294
G1 F4216
M204 S6000
G1 X125.497 Y128 E.00204
G1 X125.546 Y128.028 E.00155
M204 S10000
G1 X128.287 Y128 F42000
; LINE_WIDTH: 0.41999
G1 F4216
M204 S6000
G1 X125.368 Y127.616 E.09045
G1 X125.325 Y127.682 E.00243
G1 X125.193 Y127.712 E.00417
G1 X125.195 Y128.289 E.01774
G1 X125.326 Y128.318 E.00411
G1 X125.368 Y128.384 E.00242
G1 X128.227 Y128.008 E.08861
M204 S10000
G1 X129.21 Y127.741 F42000
G1 F4216
M204 S6000
G1 X125.211 Y127.215 E.12392
G1 X125.123 Y127.364 E.00532
G3 X124.83 Y127.37 I-.154 J-.4 E.00919
G2 X124.835 Y128.63 I6.68 J.607 E.03876
G3 X125.123 Y128.636 I.136 J.4 E.00906
G1 X125.226 Y128.783 E.00551
G1 X129.325 Y128.244 E.12705
G1 X129.497 Y127.984 E.00956
G1 X129.313 Y127.945 E.00578
G3 X129.224 Y127.799 I.086 J-.152 E.00547
M204 S10000
G1 X129.734 Y127.62 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.193362
G1 F4216
M204 S6000
G1 X131.126 Y117.036 E.13087
M204 S10000
G1 X126.355 Y115.97 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50359
G1 F4216
M204 S6000
G1 X126.498 Y115.989 E.0054
; LINE_WIDTH: 0.523924
G1 X126.556 Y116.017 E.00253
; LINE_WIDTH: 0.564612
G1 X126.614 Y116.045 E.00274
; LINE_WIDTH: 0.6053
G1 X126.672 Y116.074 E.00296
; LINE_WIDTH: 0.645988
G1 X126.73 Y116.102 E.00317
; LINE_WIDTH: 0.706534
G1 X126.788 Y116.13 E.00349
G1 X130.568 Y116.628 E.2062
; LINE_WIDTH: 0.686376
G1 X130.632 Y116.616 E.00338
; LINE_WIDTH: 0.645688
G1 X130.695 Y116.603 E.00317
; LINE_WIDTH: 0.605
G1 X130.758 Y116.591 E.00295
; LINE_WIDTH: 0.564312
G1 X130.822 Y116.579 E.00274
; LINE_WIDTH: 0.512045
G3 X130.969 Y116.578 I.075 J.222 E.00574
M204 S10000
G1 X126.144 Y116.38 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.191493
G1 F4216
M204 S6000
G1 X124.752 Y126.964 E.12924
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15000
G1 X125.013 Y124.981 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 43/73
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z8.8 I-.868 J.853 P1  F42000
G1 X128.691 Y128.722 Z8.8
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4417
M204 S6000
G1 X129.483 Y128.618 E.02651
G1 X130.824 Y138.799 E.34062
G1 X126.394 Y139.382 E.14822
G1 X125.053 Y129.201 E.34062
G1 X127.136 Y128.927 E.06969
G1 X128.632 Y128.73 E.05003
M204 S10000
G1 X128.744 Y129.126 F42000
G1 F4417
M204 S6000
G1 X129.133 Y129.075 E.01301
G1 X130.367 Y138.448 E.31361
G1 X126.744 Y138.925 E.12121
G1 X125.51 Y129.552 E.31361
G1 X127.19 Y129.331 E.05619
G1 X128.685 Y129.134 E.05003
M204 S250
G1 X128.795 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4417
M204 S5000
G1 X129.927 Y138.111 E.2664
G1 X127.082 Y138.485 E.08819
G1 X125.95 Y129.889 E.2664
G1 X127.241 Y129.719 E.04
G1 X128.736 Y129.523 E.04634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.011 Y131.504 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.55 Y123.89 Z9 F42000
G1 X130.031 Y117.097 Z9
G1 Z8.6
M73 P70 R5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4417
M204 S6000
G1 X130.824 Y117.201 E.02651
G1 X129.483 Y127.382 E.34062
G1 X125.053 Y126.799 E.14822
G1 X125.501 Y123.398 E.11379
G1 X126.394 Y116.618 E.22683
G1 X129.972 Y117.089 E.11972
M204 S10000
G1 X129.978 Y117.501 F42000
G1 F4417
M204 S6000
G1 X130.367 Y117.552 E.01301
G1 X129.133 Y126.925 E.31361
G1 X125.51 Y126.448 E.12121
G1 X125.905 Y123.451 E.10029
G1 X126.744 Y117.075 E.21332
G1 X129.919 Y117.493 E.10622
M204 S250
G1 X129.927 Y117.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4417
M204 S5000
G1 X128.795 Y126.485 E.2664
G1 X125.95 Y126.111 E.08819
G1 X126.293 Y123.502 E.08085
G1 X127.082 Y117.515 E.18556
G1 X129.868 Y117.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.62 Y119.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.975 Y127.49 Z9 F42000
G1 X130.016 Y128.375 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4417
M204 S6000
G1 X130.019 Y128.417 E.00139
G1 X131.515 Y139.788 E.38043
G1 X125.982 Y140.517 E.18516
G1 X124.487 Y129.168 E.37969
G3 X124.487 Y126.832 I9.913 J-1.168 E.07768
G1 X125.982 Y115.483 E.37969
G1 X131.515 Y116.212 E.18516
G1 X130.018 Y127.591 E.38069
G2 X130.001 Y128.005 I4.877 J.407 E.01375
G1 X130.013 Y128.315 E.01032
M204 S10000
G1 X130.421 Y128.348 F42000
G1 F4417
M204 S6000
G1 X130.423 Y128.369 E.00069
G1 X131.972 Y140.138 E.39378
G1 X125.631 Y140.973 E.21216
G1 X124.083 Y129.217 E.39334
G3 X124.083 Y126.783 I10.362 J-1.217 E.08092
G1 X125.631 Y115.027 E.39334
G1 X131.972 Y115.862 E.21216
G1 X130.422 Y127.636 E.39393
G2 X130.407 Y128.003 I4.291 J.363 E.01219
G1 X130.419 Y128.288 E.00947
M204 S250
G1 X130.804 Y128.196 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4417
M204 S5000
G1 X130.812 Y128.322 E.00388
G1 X132.386 Y140.28 E.3706
G3 X132.23 Y140.499 I-.191 J.029 E.00915
G1 X125.49 Y141.387 E.20891
G3 X125.267 Y141.215 I-.029 J-.193 E.00967
G1 X123.694 Y129.264 E.37038
G3 X123.694 Y126.736 I10.793 J-1.264 E.07785
G1 X125.267 Y114.785 E.37038
G3 X125.488 Y114.612 I.194 J.02 E.00963
G1 X132.23 Y115.501 E.20894
G3 X132.386 Y115.722 I-.037 J.192 E.00921
G1 X130.812 Y127.68 E.37058
G2 X130.798 Y128.001 I3.726 J.32 E.00989
G1 X130.802 Y128.136 E.00416
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.812 Y128.322 E-.07078
G1 X131.049 Y130.12 E-.68922
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z9 F4000
            G39.3 S1
            G0 Z9 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X129.807 Y128.37 F42000
G1 Z8.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192524
G1 F4417
M204 S6000
G1 X129.743 Y128.454 E.00129
G1 X131.126 Y138.964 E.12923
M204 S10000
G1 X130.852 Y139.651 F42000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F4417
M204 S2000
G1 X130.294 Y139.093 E.02425
G1 X129.823 Y139.155
G1 X130.381 Y139.713 E.02425
G1 X129.909 Y139.775
G1 X129.351 Y139.217 E.02425
G1 X128.88 Y139.279
G1 X129.438 Y139.837 E.02425
G1 X128.967 Y139.899
G1 X128.409 Y139.341 E.02425
G1 X127.938 Y139.403
G1 X128.496 Y139.961 E.02426
G1 X128.025 Y140.023
G1 X127.466 Y139.465 E.02426
G1 X126.995 Y139.527
G1 X127.554 Y140.085 E.02426
G1 X127.082 Y140.147
G1 X126.524 Y139.589 E.02426
G1 X126.287 Y139.885
G1 X126.611 Y140.209 E.0141
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.287 Y139.885 E-.17442
G1 X126.524 Y139.589 E-.14414
G1 X127.082 Y140.147 E-.30002
G1 X127.451 Y140.099 E-.14142
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.25 Y139.613 Z9 F42000
G1 Z8.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.195204
G1 F4417
M204 S6000
G1 X130.577 Y139.036 E.011
M204 S10000
G1 X126.144 Y139.62 F42000
; LINE_WIDTH: 0.191512
G1 F4417
M204 S6000
G1 X124.752 Y129.036 E.12926
; WIPE_START
G1 F15000
G1 X125.013 Y131.019 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.752 Y126.964 Z9 F42000
G1 Z8.6
G1 E.8 F1800
; LINE_WIDTH: 0.191503
G1 F4417
M204 S6000
G1 X126.144 Y116.38 E.12925
M204 S10000
G1 X126.355 Y115.97 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50359
G1 F4417
M204 S6000
G1 X126.498 Y115.989 E.0054
; LINE_WIDTH: 0.523924
G1 X126.556 Y116.017 E.00253
; LINE_WIDTH: 0.564612
G1 X126.614 Y116.045 E.00274
; LINE_WIDTH: 0.6053
G1 X126.672 Y116.074 E.00296
; LINE_WIDTH: 0.645988
G1 X126.73 Y116.102 E.00317
; LINE_WIDTH: 0.706534
G1 X126.788 Y116.13 E.00349
G1 X130.568 Y116.628 E.20619
; LINE_WIDTH: 0.68638
G1 X130.632 Y116.616 E.00338
; LINE_WIDTH: 0.6457
G1 X130.695 Y116.603 E.00317
; LINE_WIDTH: 0.60502
G1 X130.758 Y116.591 E.00295
; LINE_WIDTH: 0.56434
G1 X130.822 Y116.579 E.00274
; LINE_WIDTH: 0.512064
G3 X130.969 Y116.578 I.076 J.222 E.00575
M204 S10000
G1 X131.126 Y117.036 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.193779
G1 F4417
M204 S6000
G1 X129.734 Y127.62 E.13123
M204 S10000
G1 X129.535 Y128.202 F42000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F4417
M204 S2000
G1 X128.857 Y127.524 E.02947
G1 X128.314 Y127.514
G1 X129.227 Y128.428 E.03969
G1 X128.756 Y128.49
G1 X127.628 Y127.362 E.04901
G1 X127.014 Y127.281
G1 X128.285 Y128.552 E.05521
G1 X127.814 Y128.614
G1 X126.4 Y127.2 E.06142
G1 X125.786 Y127.119
G1 X127.343 Y128.676 E.06763
G1 X126.871 Y128.738
G1 X125.172 Y127.039 E.07384
G1 X124.794 Y127.194
G1 X126.4 Y128.8 E.06978
G1 X125.929 Y128.862
G1 X124.651 Y127.584 E.05552
G1 X124.638 Y128.104
G1 X125.458 Y128.924 E.03564
M204 S10000
G1 X125.057 Y128.996 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.160595
G1 F4417
M204 S6000
G1 X124.934 Y128.747 E.00266
G1 X124.642 Y128.497 E.00369
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.934 Y128.747 E-.44165
G1 X125.057 Y128.996 E-.31835
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 44/73
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z9 I.172 J1.205 P1  F42000
G1 X129.971 Y128.296 Z9
G1 Z8.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4506
M204 S5000
G1 X124.499 Y129.016 E.16961
G1 X124.339 Y127.807 E.03749
G1 X129.507 Y127.127 E.16015
G1 X129.812 Y127.086 E.00947
G1 X129.964 Y128.236 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.984 Y128.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.356 Y121.011 Z9.2 F42000
G1 X129.927 Y117.889 Z9.2
G1 Z8.8
G1 E.8 F1800
G1 F4506
M204 S5000
G1 X128.795 Y126.485 E.2664
M73 P71 R5
G1 X125.95 Y126.111 E.08819
G1 X126.27 Y123.68 E.07534
G1 X127.082 Y117.515 E.19107
G1 X129.868 Y117.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.62 Y119.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.197 Y126.23 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4506
M204 S6000
G1 X129.625 Y126.305 E.01912
G1 X130.824 Y117.201 E.30458
G1 X126.394 Y116.618 E.14822
G1 X125.039 Y126.909 E.3443
G1 X124.467 Y126.984 E.01912
G1 X125.982 Y115.483 E.38478
G1 X131.515 Y116.212 E.18516
G1 X130.205 Y126.17 E.33317
; WIPE_START
G1 F8843.478
G1 X129.625 Y126.305 E-.226
G1 X129.809 Y124.912 E-.534
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.458 Y127.362 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
G1 F4506
M204 S6000
G1 X130.244 Y127.362 E.0071
G1 X130.15 Y126.646 E.02395
G1 X129.152 Y126.778 E.03337
G1 X130.367 Y117.552 E.30868
G1 X126.744 Y117.075 E.12121
G1 X125.51 Y126.448 E.31361
G1 X127.769 Y126.746 E.07559
G1 X127.769 Y126.96 E.0071
G1 X124.021 Y127.453 E.1254
G3 X124.083 Y126.783 I7.699 J.373 E.02234
G1 X125.631 Y115.027 E.39334
G1 X131.972 Y115.862 E.21216
G1 X130.466 Y127.303 E.38279
; WIPE_START
G1 F8843.478
G1 X130.244 Y127.362 E-.08734
G1 X130.15 Y126.646 E-.27439
G1 X129.152 Y126.778 E-.38225
G1 X129.158 Y126.736 E-.01602
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.744 Y129.126 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
G1 F4506
M204 S6000
G1 X129.133 Y129.075 E.01301
G1 X130.367 Y138.448 E.31361
G1 X126.744 Y138.925 E.12121
G1 X125.51 Y129.552 E.31361
G1 X127.137 Y129.338 E.05442
G1 X128.685 Y129.134 E.05179
M204 S250
G1 X128.795 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4506
M204 S5000
G1 X129.927 Y138.111 E.2664
G1 X127.082 Y138.485 E.08819
G1 X125.95 Y129.889 E.2664
G1 X127.188 Y129.726 E.03837
G1 X128.736 Y129.523 E.04798
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.011 Y131.504 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.158 Y129.994 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4506
M204 S6000
G1 X126.323 Y138.843 E.29609
G1 X125.771 Y138.916 E.01847
G1 X124.572 Y129.813 E.30457
G1 X125.124 Y129.74 E.01847
G1 X125.15 Y129.934 E.0065
; WIPE_START
G1 F8843.478
G1 X125.411 Y131.917 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.328 Y137.755 Z9.2 F42000
G1 X130.753 Y138.26 Z9.2
G1 Z8.8
G1 E.8 F1800
G1 F4506
M204 S6000
G1 X129.554 Y129.157 E.30457
G1 X130.106 Y129.084 E.01847
G1 X131.305 Y138.187 E.30457
G1 X130.812 Y138.252 E.01648
; WIPE_START
G1 F8843.478
G1 X130.538 Y136.271 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.855 Y139.315 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
G1 F4506
M204 S6000
G1 X125.42 Y139.373 E.01453
G1 X124.116 Y129.462 E.33158
G1 X130.457 Y128.627 E.21216
G1 X131.761 Y138.538 E.33158
G1 X125.914 Y139.308 E.19564
M204 S250
G1 X125.906 Y139.704 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4506
M204 S5000
G1 X131.073 Y139.024 E.16015
G1 X131.378 Y138.984 E.00947
G1 X131.538 Y140.193 E.03749
G1 X126.065 Y140.914 E.16961
G1 X125.914 Y139.764 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.893 Y139.48 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.386 Y140.28 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
G1 F4506
M204 S5000
G3 X132.229 Y140.5 I-.19 J.03 E.00922
G1 X125.489 Y141.387 E.20887
G3 X125.268 Y141.217 I-.03 J-.191 E.00961
G1 X123.694 Y129.264 E.37045
G3 X123.694 Y126.736 I10.795 J-1.264 E.07785
G1 X125.267 Y114.785 E.37038
G3 X125.488 Y114.612 I.193 J.019 E.00964
G1 X132.23 Y115.501 E.20895
G3 X132.386 Y115.722 I-.038 J.193 E.00919
G1 X130.812 Y127.678 E.37053
G2 X130.812 Y128.322 I4.389 J.322 E.01982
G1 X132.378 Y140.221 E.36876
; WIPE_START
G1 F9547.055
M204 S6000
G1 X132.384 Y140.349 E-.04898
G1 X132.358 Y140.415 E-.02666
G1 X132.294 Y140.476 E-.03404
G1 X132.229 Y140.5 E-.02624
G1 X130.6 Y140.714 E-.62408
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.2
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z9.2 F4000
            G39.3 S1
            G0 Z9.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X131.975 Y140.335 F42000
G1 Z8.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.480851
G1 F4506
M204 S6000
G1 X131.764 Y138.735 E.05759
; WIPE_START
G1 F8220.487
G1 X131.975 Y140.335 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.002 Y138.022 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
; LINE_WIDTH: 0.192587
G1 F4506
M204 S6000
G1 X129.857 Y129.322 E.10702
; WIPE_START
G1 F15000
G1 X130.118 Y131.305 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.945 Y126.853 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
; LINE_WIDTH: 0.410074
G1 F4506
M204 S6000
G1 X128.618 Y126.853 E.00976
; LINE_WIDTH: 0.458945
G1 X128.292 Y126.853 E.01106
; LINE_WIDTH: 0.507815
G1 X127.966 Y126.853 E.01236
; WIPE_START
G1 F7743.687
G1 X128.292 Y126.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.844 Y126.853 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
; LINE_WIDTH: 0.119094
G1 F4506
M204 S6000
G1 X126.645 Y126.853 E.00124
; LINE_WIDTH: 0.163435
G1 X126.446 Y126.853 E.00195
; LINE_WIDTH: 0.207775
G1 X126.247 Y126.853 E.00267
; LINE_WIDTH: 0.252116
G1 X126.048 Y126.853 E.00339
; LINE_WIDTH: 0.296457
G1 X125.849 Y126.853 E.00411
; LINE_WIDTH: 0.340797
G1 X125.65 Y126.853 E.00483
; LINE_WIDTH: 0.385138
G1 X125.451 Y126.853 E.00555
; LINE_WIDTH: 0.429479
G1 X125.252 Y126.853 E.00627
M204 S10000
G1 X124.781 Y126.737 F42000
; LINE_WIDTH: 0.192592
G1 F4506
M204 S6000
G1 X126.144 Y116.38 E.12741
M204 S10000
G1 X126.355 Y115.97 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50361
G1 F4506
M204 S6000
G1 X126.498 Y115.989 E.00542
; LINE_WIDTH: 0.523942
G1 X126.556 Y116.017 E.00253
; LINE_WIDTH: 0.564626
G1 X126.614 Y116.045 E.00274
; LINE_WIDTH: 0.60531
G1 X126.672 Y116.074 E.00296
; LINE_WIDTH: 0.645994
G1 X126.73 Y116.102 E.00317
; LINE_WIDTH: 0.706534
G1 X126.788 Y116.13 E.00349
G1 X130.569 Y116.628 E.20619
; LINE_WIDTH: 0.686376
G1 X130.632 Y116.616 E.00338
; LINE_WIDTH: 0.645688
G1 X130.695 Y116.603 E.00317
; LINE_WIDTH: 0.605
G1 X130.759 Y116.591 E.00295
; LINE_WIDTH: 0.564312
G1 X130.822 Y116.579 E.00274
; LINE_WIDTH: 0.512069
G3 X130.969 Y116.578 I.075 J.221 E.00573
M204 S10000
G1 X131.126 Y117.036 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192592
G1 F4506
M204 S6000
G1 X129.938 Y126.058 E.11099
; WIPE_START
G1 F15000
G1 X130.199 Y124.075 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.968 Y127.658 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
; LINE_WIDTH: 0.387809
G1 F4506
M204 S6000
G1 X123.986 Y128 E.00962
; LINE_WIDTH: 0.42332
G1 X124.017 Y128.404 E.01256
; LINE_WIDTH: 0.466959
G2 X124.113 Y129.265 I18.699 J-1.638 E.02993
; WIPE_START
G1 F8489.788
G1 X124.017 Y128.404 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.875 Y129.978 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4506
M204 S6000
G1 X126.02 Y138.678 E.10701
; WIPE_START
G1 F15000
G1 X125.759 Y136.695 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.469 Y139.564 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
; LINE_WIDTH: 0.480841
G1 F4506
M204 S6000
G1 X125.679 Y141.165 E.05761
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.669
G1 X125.469 Y139.564 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 45/73
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z9.2 I1.13 J.452 P1  F42000
G1 X129.971 Y128.296 Z9.2
G1 Z9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4522
M204 S5000
G1 X124.499 Y129.016 E.16961
G1 X124.339 Y127.807 E.03749
G1 X129.312 Y127.152 E.15412
G1 X129.812 Y127.086 E.01549
G1 X129.964 Y128.236 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.984 Y128.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.356 Y121.011 Z9.4 F42000
G1 X129.927 Y117.889 Z9.4
G1 Z9
G1 E.8 F1800
G1 F4522
M204 S5000
G1 X128.795 Y126.485 E.2664
G1 X125.95 Y126.111 E.08819
G1 X126.247 Y123.858 E.06983
G1 X127.082 Y117.515 E.19658
G1 X129.868 Y117.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.62 Y119.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.197 Y126.23 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4522
M204 S6000
G1 X129.625 Y126.305 E.01912
G1 X130.824 Y117.201 E.30458
G1 X126.394 Y116.618 E.14822
G1 X125.039 Y126.909 E.3443
G1 X124.467 Y126.984 E.01912
G1 X125.982 Y115.483 E.38478
M73 P72 R5
G1 X131.515 Y116.212 E.18516
G1 X130.204 Y126.17 E.33317
; WIPE_START
G1 F8843.478
G1 X129.625 Y126.305 E-.226
G1 X129.809 Y124.912 E-.534
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.458 Y127.362 Z9.4 F42000
G1 Z9
G1 E.8 F1800
G1 F4522
M204 S6000
G1 X130.244 Y127.362 E.0071
G1 X130.15 Y126.646 E.02395
G1 X129.152 Y126.778 E.03337
G1 X130.367 Y117.552 E.30868
G1 X126.744 Y117.075 E.12121
G1 X125.51 Y126.448 E.31361
G1 X127.769 Y126.746 E.07559
G1 X127.769 Y126.96 E.0071
G1 X124.021 Y127.453 E.1254
G3 X124.083 Y126.783 I7.698 J.373 E.02234
G1 X125.631 Y115.027 E.39334
G1 X131.972 Y115.862 E.21216
G1 X130.466 Y127.303 E.38279
; WIPE_START
G1 F8843.478
G1 X130.244 Y127.362 E-.08734
G1 X130.15 Y126.646 E-.27438
G1 X129.152 Y126.778 E-.38224
G1 X129.158 Y126.736 E-.01604
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.744 Y129.126 Z9.4 F42000
G1 Z9
G1 E.8 F1800
G1 F4522
M204 S6000
G1 X129.133 Y129.075 E.01301
G1 X130.367 Y138.448 E.31361
G1 X126.744 Y138.925 E.12121
G1 X125.51 Y129.552 E.31361
G1 X127.084 Y129.345 E.05266
G1 X128.685 Y129.134 E.05356
M204 S250
G1 X128.795 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4522
M204 S5000
G1 X129.927 Y138.111 E.2664
G1 X127.082 Y138.485 E.08819
G1 X125.95 Y129.889 E.2664
G1 X127.135 Y129.733 E.03673
G1 X128.736 Y129.523 E.04961
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.011 Y131.504 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.158 Y129.994 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4522
M204 S6000
G1 X126.323 Y138.843 E.29609
G1 X125.771 Y138.916 E.01847
G1 X124.572 Y129.813 E.30457
G1 X125.124 Y129.74 E.01847
G1 X125.15 Y129.934 E.0065
; WIPE_START
G1 F8843.478
G1 X125.411 Y131.917 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.328 Y137.755 Z9.4 F42000
G1 X130.753 Y138.26 Z9.4
G1 Z9
G1 E.8 F1800
G1 F4522
M204 S6000
G1 X129.554 Y129.157 E.30458
G1 X130.106 Y129.084 E.01847
G1 X131.305 Y138.187 E.30457
G1 X130.812 Y138.252 E.01648
; WIPE_START
G1 F8843.478
G1 X130.538 Y136.271 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.855 Y139.315 Z9.4 F42000
G1 Z9
G1 E.8 F1800
G1 F4522
M204 S6000
G1 X125.42 Y139.373 E.01453
G1 X124.116 Y129.462 E.33158
G1 X130.457 Y128.627 E.21216
G1 X131.761 Y138.538 E.33158
G1 X125.914 Y139.308 E.19564
M204 S250
G1 X125.906 Y139.704 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4522
M204 S5000
G1 X130.879 Y139.049 E.15412
G1 X131.378 Y138.984 E.01549
G1 X131.538 Y140.193 E.03749
G1 X126.065 Y140.914 E.16961
G1 X125.914 Y139.764 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.893 Y139.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.386 Y140.28 Z9.4 F42000
G1 Z9
G1 E.8 F1800
G1 F4522
M204 S5000
G3 X132.228 Y140.5 I-.19 J.03 E.00924
G1 X125.489 Y141.387 E.20884
G3 X125.267 Y141.215 I-.028 J-.193 E.00965
G1 X123.694 Y129.264 E.37038
G3 X123.694 Y126.736 I10.793 J-1.264 E.07785
G1 X125.267 Y114.786 E.37037
G3 X125.488 Y114.612 I.192 J.018 E.00965
G1 X132.249 Y115.505 E.20953
G3 X132.386 Y115.722 I-.053 J.186 E.00867
G1 X130.812 Y127.678 E.37052
G2 X130.812 Y128.32 I3.322 J.323 E.01976
G1 X132.378 Y140.221 E.36883
; WIPE_START
G1 F9547.055
M204 S6000
G1 X132.386 Y140.341 E-.04574
G1 X132.358 Y140.415 E-.03001
G1 X132.294 Y140.476 E-.03395
G1 X132.228 Y140.5 E-.02661
G1 X130.6 Y140.714 E-.62369
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.4
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z9.4 F4000
            G39.3 S1
            G0 Z9.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X131.975 Y140.335 F42000
G1 Z9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.48085
G1 F4522
M204 S6000
G1 X131.764 Y138.735 E.0576
; WIPE_START
G1 F8220.492
G1 X131.975 Y140.335 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.002 Y138.022 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.192587
G1 F4522
M204 S6000
G1 X129.857 Y129.322 E.10701
; WIPE_START
G1 F15000
G1 X130.118 Y131.305 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.945 Y126.853 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.410076
G1 F4522
M204 S6000
G1 X128.618 Y126.853 E.00976
; LINE_WIDTH: 0.458947
G1 X128.292 Y126.853 E.01106
; LINE_WIDTH: 0.507818
G1 X127.966 Y126.853 E.01236
; WIPE_START
G1 F7743.648
G1 X128.292 Y126.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.844 Y126.853 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.119096
G1 F4522
M204 S6000
G1 X126.645 Y126.853 E.00124
; LINE_WIDTH: 0.163441
G1 X126.446 Y126.853 E.00195
; LINE_WIDTH: 0.207786
G1 X126.247 Y126.853 E.00267
; LINE_WIDTH: 0.252131
G1 X126.048 Y126.853 E.00339
; LINE_WIDTH: 0.296476
G1 X125.849 Y126.853 E.00411
; LINE_WIDTH: 0.340821
G1 X125.65 Y126.853 E.00483
; LINE_WIDTH: 0.385166
G1 X125.451 Y126.853 E.00555
; LINE_WIDTH: 0.429511
G1 X125.252 Y126.853 E.00627
M204 S10000
G1 X124.781 Y126.737 F42000
; LINE_WIDTH: 0.192592
G1 F4522
M204 S6000
G1 X126.144 Y116.38 E.12741
M204 S10000
G1 X126.355 Y115.97 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50361
G1 F4522
M204 S6000
G1 X126.498 Y115.989 E.00542
; LINE_WIDTH: 0.52394
G1 X126.556 Y116.017 E.00253
; LINE_WIDTH: 0.56462
G1 X126.614 Y116.046 E.00274
; LINE_WIDTH: 0.6053
G1 X126.672 Y116.074 E.00296
; LINE_WIDTH: 0.64598
G1 X126.73 Y116.102 E.00317
; LINE_WIDTH: 0.706524
G1 X126.788 Y116.13 E.00349
G1 X130.569 Y116.628 E.20619
; LINE_WIDTH: 0.686374
G1 X130.632 Y116.616 E.00338
; LINE_WIDTH: 0.645682
G1 X130.695 Y116.603 E.00317
; LINE_WIDTH: 0.60499
G1 X130.759 Y116.591 E.00295
; LINE_WIDTH: 0.564298
G1 X130.822 Y116.579 E.00274
; LINE_WIDTH: 0.512056
G3 X130.969 Y116.578 I.075 J.221 E.00573
M204 S10000
G1 X131.126 Y117.036 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192583
G1 F4522
M204 S6000
G1 X129.938 Y126.058 E.11098
; WIPE_START
G1 F15000
G1 X130.199 Y124.075 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.968 Y127.658 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.387799
G1 F4522
M204 S6000
G1 X123.986 Y128 E.00962
; LINE_WIDTH: 0.423322
G1 X124.017 Y128.404 E.01256
; LINE_WIDTH: 0.466958
G2 X124.113 Y129.265 I18.719 J-1.641 E.02993
; WIPE_START
G1 F8489.81
G1 X124.017 Y128.404 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.875 Y129.978 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4522
M204 S6000
G1 X126.02 Y138.678 E.10701
; WIPE_START
G1 F15000
G1 X125.759 Y136.695 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.469 Y139.564 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.480856
G1 F4522
M204 S6000
G1 X125.679 Y141.165 E.05761
; CHANGE_LAYER
; Z_HEIGHT: 9.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.388
G1 X125.469 Y139.564 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 46/73
; update layer progress
M73 L46
M991 S0 P45 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z9.4 I1.13 J.452 P1  F42000
G1 X129.971 Y128.296 Z9.4
G1 Z9.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4522
M204 S5000
G1 X124.499 Y129.016 E.16961
G1 X124.339 Y127.807 E.03749
G1 X129.118 Y127.178 E.14809
G1 X129.812 Y127.086 E.02152
G1 X129.964 Y128.236 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.984 Y128.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.356 Y121.011 Z9.6 F42000
G1 X129.927 Y117.889 Z9.6
G1 Z9.2
G1 E.8 F1800
G1 F4522
M204 S5000
G1 X128.795 Y126.485 E.2664
G1 X125.95 Y126.111 E.08819
G1 X126.223 Y124.035 E.06432
G1 X127.082 Y117.515 E.20209
G1 X129.868 Y117.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.62 Y119.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.197 Y126.23 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4522
M204 S6000
G1 X129.625 Y126.305 E.01912
G1 X130.824 Y117.201 E.30458
G1 X126.394 Y116.618 E.14822
G1 X125.039 Y126.909 E.3443
G1 X124.467 Y126.984 E.01912
G1 X125.982 Y115.483 E.38478
G1 X131.515 Y116.212 E.18516
G1 X130.205 Y126.17 E.33317
; WIPE_START
G1 F8843.478
G1 X129.625 Y126.305 E-.226
G1 X129.809 Y124.912 E-.534
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.458 Y127.362 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
G1 F4522
M204 S6000
G1 X130.244 Y127.362 E.0071
G1 X130.15 Y126.646 E.02395
G1 X129.152 Y126.778 E.03337
G1 X130.367 Y117.552 E.30868
G1 X126.744 Y117.075 E.12121
G1 X125.51 Y126.448 E.31361
G1 X127.769 Y126.746 E.07559
G1 X127.769 Y126.96 E.0071
G1 X124.021 Y127.453 E.1254
G3 X124.083 Y126.783 I7.706 J.374 E.02234
G1 X125.631 Y115.027 E.39334
G1 X131.972 Y115.862 E.21216
G1 X130.466 Y127.303 E.38279
; WIPE_START
G1 F8843.478
G1 X130.244 Y127.362 E-.08734
G1 X130.15 Y126.646 E-.27439
G1 X129.152 Y126.778 E-.38224
G1 X129.158 Y126.736 E-.01603
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.744 Y129.126 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
G1 F4522
M204 S6000
G1 X129.133 Y129.075 E.01301
G1 X130.367 Y138.448 E.31361
G1 X126.744 Y138.925 E.12121
G1 X125.51 Y129.552 E.31361
G1 X127.031 Y129.352 E.05089
G1 X128.685 Y129.134 E.05533
M204 S250
G1 X128.795 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4522
M204 S5000
G1 X129.927 Y138.111 E.2664
G1 X127.082 Y138.485 E.08819
G1 X125.95 Y129.889 E.2664
G1 X127.082 Y129.74 E.03509
G1 X128.736 Y129.523 E.05125
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.011 Y131.504 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.158 Y129.994 Z9.6 F42000
G1 Z9.2
M73 P73 R5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4522
M204 S6000
G1 X126.323 Y138.843 E.29609
G1 X125.771 Y138.916 E.01847
G1 X124.572 Y129.813 E.30457
G1 X125.124 Y129.74 E.01847
G1 X125.15 Y129.934 E.0065
; WIPE_START
G1 F8843.478
G1 X125.411 Y131.917 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.328 Y137.755 Z9.6 F42000
G1 X130.753 Y138.26 Z9.6
G1 Z9.2
G1 E.8 F1800
G1 F4522
M204 S6000
G1 X129.554 Y129.157 E.30457
G1 X130.106 Y129.084 E.01847
G1 X131.305 Y138.187 E.30457
G1 X130.812 Y138.252 E.01648
; WIPE_START
G1 F8843.478
G1 X130.538 Y136.271 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.855 Y139.315 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
G1 F4522
M204 S6000
G1 X125.42 Y139.373 E.01453
G1 X124.116 Y129.462 E.33158
G1 X130.457 Y128.627 E.21216
G1 X131.761 Y138.538 E.33158
G1 X125.914 Y139.308 E.19564
M204 S250
G1 X125.906 Y139.704 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4522
M204 S5000
G1 X130.684 Y139.075 E.14809
G1 X131.378 Y138.984 E.02152
G1 X131.538 Y140.193 E.03749
G1 X126.065 Y140.914 E.16961
G1 X125.914 Y139.764 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.893 Y139.478 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.386 Y140.28 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
G1 F4522
M204 S5000
G3 X132.228 Y140.5 I-.191 J.03 E.00924
G1 X125.489 Y141.387 E.20884
G3 X125.267 Y141.215 I-.029 J-.191 E.00967
G1 X123.694 Y129.264 E.37038
G3 X123.694 Y126.736 I10.795 J-1.264 E.07785
G1 X125.267 Y114.785 E.37038
G3 X125.488 Y114.612 I.193 J.019 E.00963
G1 X132.249 Y115.505 E.20953
G3 X132.386 Y115.723 I-.053 J.186 E.00867
G1 X130.812 Y127.68 E.37058
G2 X130.812 Y128.322 I3.684 J.32 E.01977
G1 X132.378 Y140.22 E.36875
; WIPE_START
G1 F9547.055
M204 S6000
G1 X132.384 Y140.35 E-.04921
G1 X132.344 Y140.434 E-.03564
G1 X132.293 Y140.477 E-.02531
G1 X132.228 Y140.5 E-.02611
G1 X130.6 Y140.714 E-.62373
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.6
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z9.6 F4000
            G39.3 S1
            G0 Z9.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X131.975 Y140.335 F42000
G1 Z9.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.480847
G1 F4522
M204 S6000
G1 X131.764 Y138.735 E.05759
; WIPE_START
G1 F8220.548
G1 X131.975 Y140.335 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.002 Y138.022 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4522
M204 S6000
G1 X129.857 Y129.322 E.10701
; WIPE_START
G1 F15000
G1 X130.118 Y131.305 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.945 Y126.853 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
; LINE_WIDTH: 0.410058
G1 F4522
M204 S6000
G1 X128.618 Y126.853 E.00976
; LINE_WIDTH: 0.458935
G1 X128.292 Y126.853 E.01106
; LINE_WIDTH: 0.507812
G1 X127.966 Y126.853 E.01236
; WIPE_START
G1 F7743.733
G1 X128.292 Y126.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.844 Y126.853 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
; LINE_WIDTH: 0.119095
G1 F4522
M204 S6000
G1 X126.645 Y126.853 E.00124
; LINE_WIDTH: 0.163437
G1 X126.446 Y126.853 E.00195
; LINE_WIDTH: 0.20778
G1 X126.247 Y126.853 E.00267
; LINE_WIDTH: 0.252123
G1 X126.048 Y126.853 E.00339
; LINE_WIDTH: 0.296465
G1 X125.849 Y126.853 E.00411
; LINE_WIDTH: 0.340808
G1 X125.65 Y126.853 E.00483
; LINE_WIDTH: 0.385151
G1 X125.451 Y126.853 E.00555
; LINE_WIDTH: 0.429493
G1 X125.252 Y126.853 E.00627
M204 S10000
G1 X124.781 Y126.737 F42000
; LINE_WIDTH: 0.192591
G1 F4522
M204 S6000
G1 X126.144 Y116.38 E.12741
M204 S10000
G1 X126.355 Y115.97 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50361
G1 F4522
M204 S6000
G1 X126.498 Y115.989 E.00542
; LINE_WIDTH: 0.52394
G1 X126.556 Y116.017 E.00253
; LINE_WIDTH: 0.56462
G1 X126.614 Y116.045 E.00274
; LINE_WIDTH: 0.6053
G1 X126.672 Y116.074 E.00296
; LINE_WIDTH: 0.64598
G1 X126.73 Y116.102 E.00317
; LINE_WIDTH: 0.706524
G1 X126.788 Y116.13 E.00349
G1 X130.569 Y116.628 E.20619
; LINE_WIDTH: 0.686374
G1 X130.632 Y116.616 E.00338
; LINE_WIDTH: 0.645682
G1 X130.695 Y116.603 E.00317
; LINE_WIDTH: 0.60499
G1 X130.759 Y116.591 E.00295
; LINE_WIDTH: 0.564298
G1 X130.822 Y116.579 E.00274
; LINE_WIDTH: 0.512055
G3 X130.969 Y116.578 I.075 J.221 E.00573
M204 S10000
G1 X131.126 Y117.036 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192592
G1 F4522
M204 S6000
G1 X129.938 Y126.058 E.11099
; WIPE_START
G1 F15000
G1 X130.199 Y124.075 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.968 Y127.658 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
; LINE_WIDTH: 0.387806
G1 F4522
M204 S6000
G1 X123.986 Y128 E.00962
; LINE_WIDTH: 0.423318
G1 X124.017 Y128.404 E.01256
; LINE_WIDTH: 0.466949
G2 X124.113 Y129.265 I18.684 J-1.636 E.02993
; WIPE_START
G1 F8489.996
G1 X124.017 Y128.404 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.875 Y129.978 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4522
M204 S6000
G1 X126.02 Y138.678 E.10701
; WIPE_START
G1 F15000
G1 X125.759 Y136.695 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.469 Y139.564 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
; LINE_WIDTH: 0.480842
G1 F4522
M204 S6000
G1 X125.679 Y141.165 E.05761
; CHANGE_LAYER
; Z_HEIGHT: 9.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.657
G1 X125.469 Y139.564 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 47/73
; update layer progress
M73 L47
M991 S0 P46 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z9.6 I1.13 J.452 P1  F42000
G1 X129.971 Y128.296 Z9.6
G1 Z9.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4522
M204 S5000
G1 X124.499 Y129.016 E.16961
G1 X124.339 Y127.807 E.03749
G1 X128.923 Y127.203 E.14207
G1 X129.812 Y127.086 E.02755
G1 X129.964 Y128.236 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.984 Y128.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.356 Y121.011 Z9.8 F42000
G1 X129.927 Y117.889 Z9.8
G1 Z9.4
G1 E.8 F1800
G1 F4522
M204 S5000
G1 X128.795 Y126.485 E.2664
G1 X125.95 Y126.111 E.08819
G1 X126.2 Y124.213 E.05881
G1 X127.082 Y117.515 E.2076
G1 X129.868 Y117.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.62 Y119.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.197 Y126.23 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4522
M204 S6000
G1 X129.625 Y126.305 E.01912
G1 X130.824 Y117.201 E.30459
G1 X126.394 Y116.618 E.14822
G1 X125.039 Y126.909 E.3443
G1 X124.467 Y126.984 E.01912
G1 X125.982 Y115.483 E.38478
G1 X131.515 Y116.212 E.18516
G1 X130.205 Y126.17 E.33317
; WIPE_START
G1 F8843.478
G1 X129.625 Y126.305 E-.226
G1 X129.809 Y124.912 E-.534
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.458 Y127.362 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
G1 F4522
M204 S6000
G1 X130.244 Y127.362 E.0071
G1 X130.15 Y126.646 E.02395
G1 X129.152 Y126.778 E.03337
G1 X130.367 Y117.552 E.30868
G1 X126.744 Y117.075 E.12121
G1 X125.51 Y126.448 E.31361
G1 X127.769 Y126.746 E.07559
G1 X127.769 Y126.96 E.0071
G1 X124.021 Y127.453 E.1254
G3 X124.083 Y126.783 I7.699 J.373 E.02234
G1 X125.631 Y115.027 E.39334
G1 X131.972 Y115.862 E.21216
G1 X130.466 Y127.303 E.38279
; WIPE_START
G1 F8843.478
G1 X130.244 Y127.362 E-.08734
G1 X130.15 Y126.646 E-.27438
G1 X129.152 Y126.778 E-.38225
G1 X129.158 Y126.736 E-.01604
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.744 Y129.126 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
G1 F4522
M204 S6000
G1 X129.133 Y129.075 E.01301
G1 X130.367 Y138.448 E.31361
G1 X126.744 Y138.925 E.12121
G1 X125.51 Y129.552 E.31361
G1 X126.978 Y129.359 E.04912
G1 X128.685 Y129.134 E.05709
M204 S250
G1 X128.795 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4522
M204 S5000
G1 X129.927 Y138.111 E.2664
G1 X127.082 Y138.485 E.08819
G1 X125.95 Y129.889 E.2664
G1 X127.029 Y129.747 E.03346
G1 X128.736 Y129.523 E.05289
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.011 Y131.504 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.158 Y129.994 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4522
M204 S6000
G1 X126.323 Y138.843 E.29609
G1 X125.771 Y138.916 E.01847
G1 X124.572 Y129.813 E.30457
G1 X125.124 Y129.74 E.01847
G1 X125.15 Y129.934 E.0065
; WIPE_START
G1 F8843.478
G1 X125.411 Y131.917 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.328 Y137.755 Z9.8 F42000
G1 X130.753 Y138.26 Z9.8
G1 Z9.4
G1 E.8 F1800
G1 F4522
M204 S6000
G1 X129.554 Y129.157 E.30457
G1 X130.106 Y129.084 E.01847
G1 X131.305 Y138.187 E.30457
G1 X130.812 Y138.252 E.01648
; WIPE_START
G1 F8843.478
G1 X130.538 Y136.271 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.855 Y139.315 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
G1 F4522
M204 S6000
G1 X125.42 Y139.373 E.01453
G1 X124.116 Y129.462 E.33158
G1 X130.457 Y128.627 E.21216
G1 X131.761 Y138.538 E.33158
G1 X125.914 Y139.308 E.19564
M204 S250
G1 X125.906 Y139.704 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4522
M204 S5000
G1 X130.49 Y139.101 E.14207
M73 P74 R5
G1 X131.378 Y138.984 E.02755
G1 X131.538 Y140.193 E.03749
G1 X126.065 Y140.914 E.16961
G1 X125.914 Y139.764 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.893 Y139.477 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.386 Y140.28 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
G1 F4522
M204 S5000
G3 X132.228 Y140.5 I-.192 J.028 E.00922
G1 X125.49 Y141.387 E.20883
G3 X125.268 Y141.215 I-.03 J-.191 E.00966
G1 X123.694 Y129.264 E.3704
G3 X123.694 Y126.736 I9.872 J-1.264 E.07789
G1 X125.267 Y114.785 E.37038
G3 X125.488 Y114.612 I.192 J.018 E.00965
G1 X132.23 Y115.501 E.20896
G3 X132.386 Y115.723 I-.037 J.191 E.00921
G1 X130.812 Y127.678 E.37052
G2 X130.812 Y128.322 I4.385 J.322 E.01982
G1 X132.378 Y140.221 E.36876
; WIPE_START
G1 F9547.055
M204 S6000
G1 X132.383 Y140.355 E-.05108
G1 X132.343 Y140.435 E-.03398
G1 X132.294 Y140.476 E-.02454
M73 P74 R4
G1 X132.228 Y140.5 E-.02666
G1 X130.6 Y140.714 E-.62374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.8
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z9.8 F4000
            G39.3 S1
            G0 Z9.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X131.975 Y140.335 F42000
G1 Z9.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.480851
G1 F4522
M204 S6000
G1 X131.764 Y138.735 E.05759
; WIPE_START
G1 F8220.487
G1 X131.975 Y140.335 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.002 Y138.022 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4522
M204 S6000
G1 X129.857 Y129.322 E.10701
; WIPE_START
G1 F15000
G1 X130.118 Y131.305 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.945 Y126.853 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
; LINE_WIDTH: 0.41006
G1 F4522
M204 S6000
G1 X128.618 Y126.853 E.00976
; LINE_WIDTH: 0.458937
G1 X128.292 Y126.853 E.01106
; LINE_WIDTH: 0.507814
G1 X127.966 Y126.853 E.01236
; WIPE_START
G1 F7743.708
G1 X128.292 Y126.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.844 Y126.853 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
; LINE_WIDTH: 0.119095
G1 F4522
M204 S6000
G1 X126.645 Y126.853 E.00124
; LINE_WIDTH: 0.163438
G1 X126.446 Y126.853 E.00195
; LINE_WIDTH: 0.207781
G1 X126.247 Y126.853 E.00267
; LINE_WIDTH: 0.252124
G1 X126.048 Y126.853 E.00339
; LINE_WIDTH: 0.296467
G1 X125.849 Y126.853 E.00411
; LINE_WIDTH: 0.34081
G1 X125.65 Y126.853 E.00483
; LINE_WIDTH: 0.385152
G1 X125.451 Y126.853 E.00555
; LINE_WIDTH: 0.429495
G1 X125.252 Y126.853 E.00627
M204 S10000
G1 X124.781 Y126.737 F42000
; LINE_WIDTH: 0.192591
G1 F4522
M204 S6000
G1 X126.144 Y116.38 E.12741
M204 S10000
G1 X126.355 Y115.97 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50363
G1 F4522
M204 S6000
G1 X126.498 Y115.989 E.00542
; LINE_WIDTH: 0.52396
G1 X126.556 Y116.017 E.00253
; LINE_WIDTH: 0.56464
G1 X126.614 Y116.045 E.00274
; LINE_WIDTH: 0.60532
G1 X126.672 Y116.074 E.00296
; LINE_WIDTH: 0.646
G1 X126.73 Y116.102 E.00317
; LINE_WIDTH: 0.706534
G1 X126.788 Y116.13 E.00349
G1 X130.569 Y116.628 E.20619
; LINE_WIDTH: 0.686376
G1 X130.632 Y116.616 E.00338
; LINE_WIDTH: 0.645688
G1 X130.695 Y116.603 E.00317
; LINE_WIDTH: 0.605
G1 X130.759 Y116.591 E.00295
; LINE_WIDTH: 0.564312
G1 X130.822 Y116.579 E.00274
; LINE_WIDTH: 0.51207
G3 X130.969 Y116.578 I.075 J.221 E.00573
M204 S10000
G1 X131.126 Y117.036 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192582
G1 F4522
M204 S6000
G1 X129.938 Y126.058 E.11098
; WIPE_START
G1 F15000
G1 X130.199 Y124.075 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.968 Y127.658 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
; LINE_WIDTH: 0.387809
G1 F4522
M204 S6000
G1 X123.986 Y128 E.00962
; LINE_WIDTH: 0.42333
G1 X124.017 Y128.404 E.01256
; LINE_WIDTH: 0.466969
G2 X124.113 Y129.265 I18.693 J-1.638 E.02993
; WIPE_START
G1 F8489.6
G1 X124.017 Y128.404 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.875 Y129.978 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4522
M204 S6000
G1 X126.02 Y138.678 E.10701
; WIPE_START
G1 F15000
G1 X125.759 Y136.695 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.469 Y139.564 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
; LINE_WIDTH: 0.480844
G1 F4522
M204 S6000
G1 X125.679 Y141.165 E.05761
; CHANGE_LAYER
; Z_HEIGHT: 9.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F8220.606
G1 X125.469 Y139.564 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 48/73
; update layer progress
M73 L48
M991 S0 P47 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z9.8 I1.13 J.452 P1  F42000
G1 X129.971 Y128.296 Z9.8
G1 Z9.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4522
M204 S5000
G1 X124.499 Y129.016 E.16961
G1 X124.339 Y127.807 E.03749
G1 X128.729 Y127.229 E.13604
G1 X129.812 Y127.086 E.03358
G1 X129.964 Y128.236 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.984 Y128.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.356 Y121.011 Z10 F42000
G1 X129.927 Y117.889 Z10
G1 Z9.6
G1 E.8 F1800
G1 F4522
M204 S5000
G1 X128.795 Y126.485 E.2664
G1 X125.95 Y126.111 E.08819
G1 X126.176 Y124.391 E.0533
G1 X127.082 Y117.515 E.21311
G1 X129.868 Y117.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.62 Y119.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.197 Y126.23 Z10 F42000
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4522
M204 S6000
G1 X129.625 Y126.305 E.01912
G1 X130.824 Y117.201 E.30458
G1 X126.394 Y116.618 E.14822
G1 X125.039 Y126.909 E.3443
G1 X124.467 Y126.984 E.01912
G1 X125.982 Y115.483 E.38478
G1 X131.515 Y116.212 E.18516
G1 X130.204 Y126.17 E.33317
; WIPE_START
G1 F8843.478
G1 X129.625 Y126.305 E-.22599
G1 X129.809 Y124.912 E-.53401
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.458 Y127.362 Z10 F42000
G1 Z9.6
G1 E.8 F1800
G1 F4522
M204 S6000
G1 X130.244 Y127.362 E.0071
G1 X130.15 Y126.646 E.02395
G1 X129.152 Y126.778 E.03337
G1 X130.367 Y117.552 E.30868
G1 X126.744 Y117.075 E.12121
G1 X125.51 Y126.448 E.31361
G1 X127.769 Y126.746 E.07559
G1 X127.769 Y126.96 E.0071
G1 X124.021 Y127.453 E.1254
G3 X124.083 Y126.783 I7.706 J.374 E.02234
G1 X125.631 Y115.027 E.39334
G1 X131.972 Y115.862 E.21216
G1 X130.466 Y127.303 E.38279
; WIPE_START
G1 F8843.478
G1 X130.244 Y127.362 E-.08734
G1 X130.15 Y126.646 E-.27436
G1 X129.152 Y126.778 E-.38225
G1 X129.158 Y126.736 E-.01604
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.744 Y129.126 Z10 F42000
G1 Z9.6
G1 E.8 F1800
G1 F4522
M204 S6000
G1 X129.133 Y129.075 E.01301
G1 X130.367 Y138.448 E.31361
G1 X126.744 Y138.925 E.12121
G1 X125.51 Y129.552 E.31361
G1 X126.926 Y129.366 E.04736
G1 X128.685 Y129.134 E.05886
M204 S250
G1 X128.795 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4522
M204 S5000
G1 X129.927 Y138.111 E.2664
G1 X127.082 Y138.485 E.08819
G1 X125.95 Y129.889 E.2664
G1 X126.977 Y129.754 E.03182
G1 X128.736 Y129.523 E.05452
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.011 Y131.504 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.158 Y129.994 Z10 F42000
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4522
M204 S6000
G1 X126.323 Y138.843 E.29609
G1 X125.771 Y138.916 E.01847
G1 X124.572 Y129.813 E.30457
G1 X125.124 Y129.74 E.01847
G1 X125.15 Y129.934 E.0065
; WIPE_START
G1 F8843.478
G1 X125.411 Y131.917 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.328 Y137.755 Z10 F42000
G1 X130.753 Y138.26 Z10
G1 Z9.6
G1 E.8 F1800
G1 F4522
M204 S6000
G1 X129.554 Y129.157 E.30457
G1 X130.106 Y129.084 E.01847
G1 X131.305 Y138.187 E.30457
G1 X130.812 Y138.252 E.01648
; WIPE_START
G1 F8843.478
G1 X130.538 Y136.271 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.855 Y139.315 Z10 F42000
G1 Z9.6
G1 E.8 F1800
G1 F4522
M204 S6000
G1 X125.42 Y139.373 E.01453
G1 X124.116 Y129.462 E.33158
G1 X130.457 Y128.627 E.21216
G1 X131.761 Y138.538 E.33158
G1 X125.914 Y139.308 E.19564
M204 S250
G1 X125.906 Y139.704 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4522
M204 S5000
G1 X130.295 Y139.126 E.13604
G1 X131.378 Y138.984 E.03358
G1 X131.538 Y140.193 E.03749
G1 X126.065 Y140.914 E.16961
G1 X125.914 Y139.764 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.893 Y139.476 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.386 Y140.28 Z10 F42000
G1 Z9.6
G1 E.8 F1800
G1 F4522
M204 S5000
G3 X132.23 Y140.499 I-.192 J.028 E.00913
G1 X125.49 Y141.387 E.20891
G3 X125.267 Y141.215 I-.029 J-.193 E.00965
G1 X123.694 Y129.264 E.3704
G3 X123.694 Y126.736 I9.872 J-1.264 E.07789
G1 X125.267 Y114.785 E.3704
G3 X125.488 Y114.612 I.192 J.018 E.00963
G1 X132.23 Y115.501 E.20895
G3 X132.386 Y115.722 I-.037 J.191 E.00921
G1 X130.812 Y127.678 E.37053
G2 X130.812 Y128.322 I4.385 J.322 E.01982
G1 X132.378 Y140.221 E.36876
; WIPE_START
G1 F9547.055
M204 S6000
G1 X132.384 Y140.35 E-.04934
G1 X132.343 Y140.435 E-.0357
G1 X132.23 Y140.499 E-.04935
M73 P75 R4
G1 X130.598 Y140.714 E-.62561
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z10
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z10 F4000
            G39.3 S1
            G0 Z10 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X131.975 Y140.335 F42000
G1 Z9.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.480853
G1 F4522
M204 S6000
G1 X131.764 Y138.735 E.05759
; WIPE_START
G1 F8220.436
G1 X131.975 Y140.335 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.002 Y138.022 Z10 F42000
G1 Z9.6
G1 E.8 F1800
; LINE_WIDTH: 0.192587
G1 F4522
M204 S6000
G1 X129.857 Y129.322 E.10702
; WIPE_START
G1 F15000
G1 X130.118 Y131.305 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.945 Y126.853 Z10 F42000
G1 Z9.6
G1 E.8 F1800
; LINE_WIDTH: 0.410072
G1 F4522
M204 S6000
G1 X128.618 Y126.853 E.00976
; LINE_WIDTH: 0.458943
G1 X128.292 Y126.853 E.01106
; LINE_WIDTH: 0.507813
G1 X127.966 Y126.853 E.01236
; WIPE_START
G1 F7743.722
G1 X128.292 Y126.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.844 Y126.853 Z10 F42000
G1 Z9.6
G1 E.8 F1800
; LINE_WIDTH: 0.119095
G1 F4522
M204 S6000
G1 X126.645 Y126.853 E.00124
; LINE_WIDTH: 0.163438
G1 X126.446 Y126.853 E.00195
; LINE_WIDTH: 0.207781
G1 X126.247 Y126.853 E.00267
; LINE_WIDTH: 0.252124
G1 X126.048 Y126.853 E.00339
; LINE_WIDTH: 0.296467
G1 X125.849 Y126.853 E.00411
; LINE_WIDTH: 0.340809
G1 X125.65 Y126.853 E.00483
; LINE_WIDTH: 0.385152
G1 X125.451 Y126.853 E.00555
; LINE_WIDTH: 0.429495
G1 X125.252 Y126.853 E.00627
M204 S10000
G1 X124.781 Y126.737 F42000
; LINE_WIDTH: 0.192591
G1 F4522
M204 S6000
G1 X126.144 Y116.38 E.12741
M204 S10000
G1 X126.355 Y115.97 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50363
G1 F4522
M204 S6000
G1 X126.498 Y115.989 E.00542
; LINE_WIDTH: 0.52396
G1 X126.556 Y116.017 E.00253
; LINE_WIDTH: 0.56464
G1 X126.614 Y116.045 E.00274
; LINE_WIDTH: 0.60532
G1 X126.672 Y116.074 E.00296
; LINE_WIDTH: 0.646
G1 X126.73 Y116.102 E.00317
; LINE_WIDTH: 0.706534
G1 X126.788 Y116.13 E.00349
G1 X130.569 Y116.628 E.20619
; LINE_WIDTH: 0.686378
G1 X130.632 Y116.616 E.00338
; LINE_WIDTH: 0.645694
G1 X130.695 Y116.603 E.00317
; LINE_WIDTH: 0.60501
G1 X130.759 Y116.591 E.00295
; LINE_WIDTH: 0.564326
G1 X130.822 Y116.579 E.00274
; LINE_WIDTH: 0.512097
G3 X130.969 Y116.578 I.075 J.221 E.00573
M204 S10000
G1 X131.126 Y117.036 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192575
G1 F4522
M204 S6000
G1 X129.938 Y126.058 E.11098
; WIPE_START
G1 F15000
G1 X130.199 Y124.075 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.968 Y127.658 Z10 F42000
G1 Z9.6
G1 E.8 F1800
; LINE_WIDTH: 0.387806
G1 F4522
M204 S6000
G1 X123.986 Y128 E.00962
; LINE_WIDTH: 0.423319
G1 X124.017 Y128.404 E.01256
; LINE_WIDTH: 0.466957
G2 X124.113 Y129.265 I18.705 J-1.639 E.02993
; WIPE_START
G1 F8489.832
G1 X124.017 Y128.404 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.875 Y129.978 Z10 F42000
G1 Z9.6
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4522
M204 S6000
G1 X126.02 Y138.678 E.10701
; WIPE_START
G1 F15000
G1 X125.759 Y136.695 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.469 Y139.564 Z10 F42000
G1 Z9.6
G1 E.8 F1800
; LINE_WIDTH: 0.480844
G1 F4522
M204 S6000
G1 X125.679 Y141.165 E.05761
; CHANGE_LAYER
; Z_HEIGHT: 9.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.606
G1 X125.469 Y139.564 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 49/73
; update layer progress
M73 L49
M991 S0 P48 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z10 I1.13 J.452 P1  F42000
G1 X129.971 Y128.296 Z10
G1 Z9.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4522
M204 S5000
G1 X124.499 Y129.016 E.16961
G1 X124.339 Y127.807 E.03749
G1 X128.534 Y127.255 E.13001
G1 X129.812 Y127.086 E.0396
G1 X129.964 Y128.236 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.984 Y128.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.356 Y121.011 Z10.2 F42000
G1 X129.927 Y117.889 Z10.2
G1 Z9.8
G1 E.8 F1800
G1 F4522
M204 S5000
G1 X128.795 Y126.485 E.2664
G1 X125.95 Y126.111 E.08819
G1 X126.153 Y124.569 E.04778
G1 X127.082 Y117.515 E.21862
G1 X129.868 Y117.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.62 Y119.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.197 Y126.23 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4522
M204 S6000
G1 X129.625 Y126.305 E.01912
G1 X130.824 Y117.201 E.30458
G1 X126.394 Y116.618 E.14822
G1 X125.039 Y126.909 E.3443
G1 X124.467 Y126.984 E.01912
G1 X125.982 Y115.483 E.38478
G1 X131.515 Y116.212 E.18516
G1 X130.205 Y126.17 E.33317
; WIPE_START
G1 F8843.478
G1 X129.625 Y126.305 E-.226
G1 X129.809 Y124.912 E-.534
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.458 Y127.362 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
G1 F4522
M204 S6000
G1 X130.244 Y127.362 E.0071
G1 X130.15 Y126.646 E.02395
G1 X129.152 Y126.778 E.03337
G1 X130.367 Y117.552 E.30868
G1 X126.744 Y117.075 E.12121
G1 X125.51 Y126.448 E.31361
G1 X127.769 Y126.746 E.07559
G1 X127.769 Y126.96 E.0071
G1 X124.021 Y127.453 E.1254
G3 X124.083 Y126.783 I7.706 J.374 E.02234
G1 X125.631 Y115.027 E.39334
G1 X131.972 Y115.862 E.21216
G1 X130.466 Y127.303 E.38279
; WIPE_START
G1 F8843.478
G1 X130.244 Y127.362 E-.08734
G1 X130.15 Y126.646 E-.27437
G1 X129.152 Y126.778 E-.38225
G1 X129.158 Y126.736 E-.01603
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.744 Y129.126 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
G1 F4522
M204 S6000
G1 X129.133 Y129.075 E.01301
G1 X130.367 Y138.448 E.31361
G1 X126.744 Y138.925 E.12121
G1 X125.51 Y129.552 E.31361
G1 X126.873 Y129.372 E.04559
G1 X128.685 Y129.134 E.06063
M204 S250
G1 X128.795 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4522
M204 S5000
G1 X129.927 Y138.111 E.2664
G1 X127.082 Y138.485 E.08819
G1 X125.95 Y129.889 E.2664
G1 X126.924 Y129.761 E.03018
G1 X128.736 Y129.523 E.05616
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.011 Y131.504 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.158 Y129.994 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4522
M204 S6000
G1 X126.323 Y138.843 E.29609
G1 X125.771 Y138.916 E.01847
G1 X124.572 Y129.813 E.30457
G1 X125.124 Y129.74 E.01847
G1 X125.15 Y129.934 E.0065
; WIPE_START
G1 F8843.478
G1 X125.411 Y131.917 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.328 Y137.755 Z10.2 F42000
G1 X130.753 Y138.26 Z10.2
G1 Z9.8
G1 E.8 F1800
G1 F4522
M204 S6000
G1 X129.554 Y129.157 E.30458
G1 X130.106 Y129.084 E.01847
G1 X131.305 Y138.187 E.30457
G1 X130.812 Y138.252 E.01648
; WIPE_START
G1 F8843.478
G1 X130.538 Y136.271 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.855 Y139.315 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
G1 F4522
M204 S6000
G1 X125.42 Y139.373 E.01453
G1 X124.116 Y129.462 E.33158
G1 X130.457 Y128.627 E.21216
G1 X131.761 Y138.538 E.33158
G1 X125.914 Y139.308 E.19564
M204 S250
G1 X125.906 Y139.704 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4522
M204 S5000
G1 X130.101 Y139.152 E.13001
G1 X131.378 Y138.984 E.0396
G1 X131.538 Y140.193 E.03749
G1 X126.065 Y140.914 E.16961
G1 X125.914 Y139.764 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.893 Y139.474 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.386 Y140.28 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
G1 F4522
M204 S5000
G3 X132.229 Y140.5 I-.191 J.03 E.00921
G1 X125.49 Y141.387 E.20886
G3 X125.267 Y141.215 I-.029 J-.193 E.00965
G1 X123.694 Y129.264 E.3704
G3 X123.694 Y126.736 I9.873 J-1.264 E.07789
G1 X125.267 Y114.785 E.3704
G3 X125.488 Y114.612 I.194 J.021 E.0096
G1 X132.276 Y115.514 E.2104
G3 X132.386 Y115.722 I-.088 J.18 E.00774
G1 X130.812 Y127.678 E.37053
G2 X130.812 Y128.32 I3.323 J.323 E.01976
G1 X132.378 Y140.221 E.36883
; WIPE_START
G1 F9547.055
M204 S6000
G1 X132.384 Y140.35 E-.04939
G1 X132.344 Y140.434 E-.03507
G1 X132.295 Y140.476 E-.0248
G1 X132.229 Y140.5 E-.02663
G1 X130.6 Y140.714 E-.6241
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z10.2
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z10.2 F4000
            G39.3 S1
            G0 Z10.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X131.975 Y140.335 F42000
G1 Z9.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.48085
G1 F4522
M204 S6000
G1 X131.764 Y138.735 E.05759
; WIPE_START
G1 F8220.499
G1 X131.975 Y140.335 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.002 Y138.022 Z10.2 F42000
G1 Z9.8
M73 P76 R4
G1 E.8 F1800
; LINE_WIDTH: 0.192587
G1 F4522
M204 S6000
G1 X129.857 Y129.322 E.10701
; WIPE_START
G1 F15000
G1 X130.118 Y131.305 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.945 Y126.853 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
; LINE_WIDTH: 0.410075
G1 F4522
M204 S6000
G1 X128.618 Y126.853 E.00976
; LINE_WIDTH: 0.458944
G1 X128.292 Y126.853 E.01106
; LINE_WIDTH: 0.507814
G1 X127.966 Y126.853 E.01236
; WIPE_START
G1 F7743.714
G1 X128.292 Y126.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.844 Y126.853 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
; LINE_WIDTH: 0.119094
G1 F4522
M204 S6000
G1 X126.645 Y126.853 E.00124
; LINE_WIDTH: 0.163435
G1 X126.446 Y126.853 E.00195
; LINE_WIDTH: 0.207775
G1 X126.247 Y126.853 E.00267
; LINE_WIDTH: 0.252116
G1 X126.048 Y126.853 E.00339
; LINE_WIDTH: 0.296457
G1 X125.849 Y126.853 E.00411
; LINE_WIDTH: 0.340797
G1 X125.65 Y126.853 E.00483
; LINE_WIDTH: 0.385138
G1 X125.451 Y126.853 E.00555
; LINE_WIDTH: 0.429479
G1 X125.252 Y126.853 E.00627
M204 S10000
G1 X124.781 Y126.737 F42000
; LINE_WIDTH: 0.192591
G1 F4522
M204 S6000
G1 X126.144 Y116.38 E.12741
M204 S10000
G1 X126.355 Y115.97 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50361
G1 F4522
M204 S6000
G1 X126.498 Y115.989 E.00542
; LINE_WIDTH: 0.523942
G1 X126.556 Y116.017 E.00253
; LINE_WIDTH: 0.564626
G1 X126.614 Y116.045 E.00274
; LINE_WIDTH: 0.60531
G1 X126.672 Y116.074 E.00296
; LINE_WIDTH: 0.645994
G1 X126.73 Y116.102 E.00317
; LINE_WIDTH: 0.706534
G1 X126.788 Y116.13 E.00349
G1 X130.569 Y116.628 E.20619
; LINE_WIDTH: 0.686376
G1 X130.632 Y116.616 E.00338
; LINE_WIDTH: 0.645688
G1 X130.695 Y116.603 E.00317
; LINE_WIDTH: 0.605
G1 X130.759 Y116.591 E.00295
; LINE_WIDTH: 0.564312
G1 X130.822 Y116.579 E.00274
; LINE_WIDTH: 0.51207
G3 X130.969 Y116.578 I.075 J.221 E.00573
M204 S10000
G1 X131.126 Y117.036 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192592
G1 F4522
M204 S6000
G1 X129.938 Y126.058 E.11099
; WIPE_START
G1 F15000
G1 X130.199 Y124.075 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.968 Y127.658 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
; LINE_WIDTH: 0.387806
G1 F4522
M204 S6000
G1 X123.986 Y128 E.00962
; LINE_WIDTH: 0.423318
G1 X124.017 Y128.404 E.01256
; LINE_WIDTH: 0.466957
G2 X124.113 Y129.265 I18.696 J-1.638 E.02993
; WIPE_START
G1 F8489.841
G1 X124.017 Y128.404 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.875 Y129.978 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4522
M204 S6000
G1 X126.02 Y138.678 E.10701
; WIPE_START
G1 F15000
G1 X125.759 Y136.695 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.469 Y139.564 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
; LINE_WIDTH: 0.480841
G1 F4522
M204 S6000
G1 X125.679 Y141.165 E.05761
; CHANGE_LAYER
; Z_HEIGHT: 10
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.663
G1 X125.469 Y139.564 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 50/73
; update layer progress
M73 L50
M991 S0 P49 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z10.2 I1.13 J.452 P1  F42000
G1 X129.971 Y128.296 Z10.2
G1 Z10
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4522
M204 S5000
G1 X124.499 Y129.016 E.16961
G1 X124.339 Y127.807 E.03749
G1 X128.34 Y127.28 E.12398
G1 X129.812 Y127.086 E.04563
G1 X129.964 Y128.236 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.984 Y128.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.356 Y121.011 Z10.4 F42000
G1 X129.927 Y117.889 Z10.4
G1 Z10
G1 E.8 F1800
G1 F4522
M204 S5000
G1 X128.795 Y126.485 E.2664
G1 X125.95 Y126.111 E.08819
G1 X126.13 Y124.747 E.04227
G1 X127.082 Y117.515 E.22413
G1 X129.868 Y117.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.62 Y119.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.197 Y126.23 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4522
M204 S6000
G1 X129.625 Y126.305 E.01912
G1 X130.824 Y117.201 E.30458
G1 X126.394 Y116.618 E.14822
G1 X125.039 Y126.909 E.3443
G1 X124.467 Y126.984 E.01912
G1 X125.982 Y115.483 E.38478
G1 X131.515 Y116.212 E.18516
G1 X130.204 Y126.17 E.33317
; WIPE_START
G1 F8843.478
G1 X129.625 Y126.305 E-.226
G1 X129.809 Y124.912 E-.534
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.458 Y127.362 Z10.4 F42000
G1 Z10
G1 E.8 F1800
G1 F4522
M204 S6000
G1 X130.244 Y127.362 E.0071
G1 X130.15 Y126.646 E.02395
G1 X129.152 Y126.778 E.03337
G1 X130.367 Y117.552 E.30868
G1 X126.744 Y117.075 E.12121
G1 X125.51 Y126.448 E.31361
G1 X127.769 Y126.746 E.07559
G1 X127.769 Y126.96 E.0071
G1 X124.021 Y127.453 E.1254
G3 X124.083 Y126.783 I7.699 J.373 E.02234
G1 X125.631 Y115.027 E.39334
G1 X131.972 Y115.862 E.21216
G1 X130.466 Y127.303 E.38279
; WIPE_START
G1 F8843.478
G1 X130.244 Y127.362 E-.08734
G1 X130.15 Y126.646 E-.27437
G1 X129.152 Y126.778 E-.38225
G1 X129.158 Y126.736 E-.01604
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.744 Y129.126 Z10.4 F42000
G1 Z10
G1 E.8 F1800
G1 F4522
M204 S6000
G1 X129.133 Y129.075 E.01301
G1 X130.367 Y138.448 E.31361
G1 X126.744 Y138.925 E.12121
G1 X125.51 Y129.552 E.31361
G1 X126.82 Y129.379 E.04382
G1 X128.685 Y129.134 E.0624
M204 S250
G1 X128.795 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4522
M204 S5000
G1 X129.927 Y138.111 E.2664
G1 X127.082 Y138.485 E.08819
G1 X125.95 Y129.889 E.2664
G1 X126.871 Y129.768 E.02855
G1 X128.736 Y129.523 E.0578
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.011 Y131.504 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.158 Y129.994 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4522
M204 S6000
G1 X126.323 Y138.843 E.29609
G1 X125.771 Y138.916 E.01847
G1 X124.572 Y129.813 E.30457
G1 X125.124 Y129.74 E.01847
G1 X125.15 Y129.934 E.0065
; WIPE_START
G1 F8843.478
G1 X125.411 Y131.917 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.328 Y137.755 Z10.4 F42000
G1 X130.753 Y138.26 Z10.4
G1 Z10
G1 E.8 F1800
G1 F4522
M204 S6000
G1 X129.554 Y129.157 E.30457
G1 X130.106 Y129.084 E.01847
G1 X131.305 Y138.187 E.30457
G1 X130.812 Y138.252 E.01648
; WIPE_START
G1 F8843.478
G1 X130.538 Y136.271 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.855 Y139.315 Z10.4 F42000
G1 Z10
G1 E.8 F1800
G1 F4522
M204 S6000
G1 X125.42 Y139.373 E.01453
G1 X124.116 Y129.462 E.33158
G1 X130.457 Y128.627 E.21216
G1 X131.761 Y138.538 E.33158
G1 X125.914 Y139.308 E.19564
M204 S250
G1 X125.906 Y139.704 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4522
M204 S5000
G1 X129.906 Y139.177 E.12398
G1 X131.378 Y138.984 E.04563
G1 X131.538 Y140.193 E.03749
G1 X126.065 Y140.914 E.16961
G1 X125.914 Y139.764 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.892 Y139.473 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.386 Y140.28 Z10.4 F42000
G1 Z10
G1 E.8 F1800
G1 F4522
M204 S5000
G3 X132.228 Y140.5 I-.19 J.03 E.00925
G1 X125.489 Y141.387 E.20884
G3 X125.267 Y141.215 I-.029 J-.191 E.00966
G1 X123.694 Y129.264 E.3704
G3 X123.694 Y126.736 I10.793 J-1.264 E.07785
G1 X125.267 Y114.785 E.37038
G3 X125.488 Y114.612 I.194 J.02 E.00961
G1 X132.23 Y115.501 E.20896
G3 X132.386 Y115.723 I-.037 J.191 E.00921
G1 X130.812 Y127.68 E.37059
G2 X130.812 Y128.321 I3.154 J.32 E.01973
G1 X132.378 Y140.22 E.36878
; WIPE_START
G1 F9547.055
M204 S6000
G1 X132.384 Y140.351 E-.04957
G1 X132.358 Y140.414 E-.02619
G1 X132.291 Y140.478 E-.03493
G1 X132.228 Y140.5 E-.02561
G1 X130.601 Y140.714 E-.6237
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z10.4
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z10.4 F4000
            G39.3 S1
            G0 Z10.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X131.975 Y140.335 F42000
G1 Z10
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.480854
G1 F4522
M204 S6000
G1 X131.764 Y138.735 E.05759
; WIPE_START
G1 F8220.418
G1 X131.975 Y140.335 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.002 Y138.022 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4522
M204 S6000
G1 X129.857 Y129.322 E.10701
; WIPE_START
G1 F15000
G1 X130.118 Y131.305 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.945 Y126.853 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.410058
G1 F4522
M204 S6000
G1 X128.618 Y126.853 E.00976
; LINE_WIDTH: 0.458935
G1 X128.292 Y126.853 E.01106
; LINE_WIDTH: 0.507812
G1 X127.966 Y126.853 E.01236
; WIPE_START
M73 P77 R4
G1 F7743.733
G1 X128.292 Y126.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.844 Y126.853 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.119096
G1 F4522
M204 S6000
G1 X126.645 Y126.853 E.00124
; LINE_WIDTH: 0.163441
G1 X126.446 Y126.853 E.00195
; LINE_WIDTH: 0.207786
G1 X126.247 Y126.853 E.00267
; LINE_WIDTH: 0.252131
G1 X126.048 Y126.853 E.00339
; LINE_WIDTH: 0.296476
G1 X125.849 Y126.853 E.00411
; LINE_WIDTH: 0.340821
G1 X125.65 Y126.853 E.00483
; LINE_WIDTH: 0.385165
G1 X125.451 Y126.853 E.00555
; LINE_WIDTH: 0.42951
G1 X125.252 Y126.853 E.00627
M204 S10000
G1 X124.781 Y126.737 F42000
; LINE_WIDTH: 0.192592
G1 F4522
M204 S6000
G1 X126.144 Y116.38 E.12741
M204 S10000
G1 X126.355 Y115.97 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50359
G1 F4522
M204 S6000
G1 X126.498 Y115.989 E.00542
; LINE_WIDTH: 0.523922
G1 X126.556 Y116.017 E.00253
; LINE_WIDTH: 0.564606
G1 X126.614 Y116.045 E.00274
; LINE_WIDTH: 0.60529
G1 X126.672 Y116.074 E.00296
; LINE_WIDTH: 0.645974
G1 X126.73 Y116.102 E.00317
; LINE_WIDTH: 0.706524
G1 X126.788 Y116.13 E.00349
G1 X130.569 Y116.628 E.20619
; LINE_WIDTH: 0.686378
G1 X130.632 Y116.616 E.00338
; LINE_WIDTH: 0.645694
G1 X130.695 Y116.603 E.00317
; LINE_WIDTH: 0.60501
G1 X130.759 Y116.591 E.00295
; LINE_WIDTH: 0.564326
G1 X130.822 Y116.579 E.00274
; LINE_WIDTH: 0.51209
G3 X130.969 Y116.578 I.075 J.221 E.00573
M204 S10000
G1 X131.126 Y117.036 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192583
G1 F4522
M204 S6000
G1 X129.938 Y126.058 E.11098
; WIPE_START
G1 F15000
G1 X130.199 Y124.075 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.968 Y127.658 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.387807
G1 F4522
M204 S6000
G1 X123.986 Y128 E.00962
; LINE_WIDTH: 0.423319
G1 X124.017 Y128.404 E.01256
; LINE_WIDTH: 0.466952
G2 X124.113 Y129.265 I18.696 J-1.638 E.02993
; WIPE_START
G1 F8489.923
G1 X124.017 Y128.404 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.875 Y129.978 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4522
M204 S6000
G1 X126.02 Y138.678 E.10701
; WIPE_START
G1 F15000
G1 X125.759 Y136.695 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.469 Y139.564 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.480844
G1 F4522
M204 S6000
G1 X125.679 Y141.165 E.05761
; CHANGE_LAYER
; Z_HEIGHT: 10.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.606
G1 X125.469 Y139.564 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 51/73
; update layer progress
M73 L51
M991 S0 P50 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z10.4 I1.13 J.452 P1  F42000
G1 X129.971 Y128.296 Z10.4
G1 Z10.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4522
M204 S5000
G1 X124.499 Y129.016 E.16961
G1 X124.339 Y127.807 E.03749
G1 X128.145 Y127.306 E.11796
G1 X129.812 Y127.086 E.05166
G1 X129.964 Y128.236 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.984 Y128.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.356 Y121.011 Z10.6 F42000
G1 X129.927 Y117.889 Z10.6
G1 Z10.2
G1 E.8 F1800
G1 F4522
M204 S5000
G1 X128.795 Y126.485 E.2664
G1 X125.95 Y126.111 E.08819
G1 X126.106 Y124.924 E.03676
G1 X127.082 Y117.515 E.22964
G1 X129.868 Y117.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.62 Y119.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.197 Y126.23 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4522
M204 S6000
G1 X129.625 Y126.305 E.01912
G1 X130.824 Y117.201 E.30458
G1 X126.394 Y116.618 E.14822
G1 X125.039 Y126.909 E.3443
G1 X124.467 Y126.984 E.01912
G1 X125.982 Y115.483 E.38478
G1 X131.515 Y116.212 E.18516
G1 X130.205 Y126.17 E.33317
; WIPE_START
G1 F8843.478
G1 X129.625 Y126.305 E-.226
G1 X129.809 Y124.912 E-.534
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.458 Y127.362 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
G1 F4522
M204 S6000
G1 X130.244 Y127.362 E.0071
G1 X130.15 Y126.646 E.02395
G1 X129.152 Y126.778 E.03337
G1 X130.367 Y117.552 E.30868
G1 X126.744 Y117.075 E.12121
G1 X125.51 Y126.448 E.31361
G1 X127.769 Y126.746 E.07559
G1 X127.769 Y126.96 E.0071
G1 X124.021 Y127.453 E.1254
G3 X124.083 Y126.783 I7.706 J.374 E.02234
G1 X125.631 Y115.027 E.39334
G1 X131.972 Y115.862 E.21216
G1 X130.466 Y127.303 E.38279
; WIPE_START
G1 F8843.478
G1 X130.244 Y127.362 E-.08734
G1 X130.15 Y126.646 E-.2744
G1 X129.152 Y126.778 E-.38224
G1 X129.158 Y126.736 E-.01602
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.744 Y129.126 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
G1 F4522
M204 S6000
G1 X129.133 Y129.075 E.01301
G1 X130.367 Y138.448 E.31361
G1 X126.744 Y138.925 E.12121
G1 X125.51 Y129.552 E.31361
G1 X126.767 Y129.386 E.04206
G1 X128.685 Y129.134 E.06416
M204 S250
G1 X128.795 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4522
M204 S5000
G1 X129.927 Y138.111 E.2664
G1 X127.082 Y138.485 E.08819
G1 X125.95 Y129.889 E.2664
G1 X126.818 Y129.775 E.02691
G1 X128.736 Y129.523 E.05943
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.011 Y131.504 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.158 Y129.994 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4522
M204 S6000
G1 X126.323 Y138.843 E.29609
G1 X125.771 Y138.916 E.01847
G1 X124.572 Y129.813 E.30457
G1 X125.124 Y129.74 E.01847
G1 X125.15 Y129.934 E.0065
; WIPE_START
G1 F8843.478
G1 X125.411 Y131.917 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.328 Y137.755 Z10.6 F42000
G1 X130.753 Y138.26 Z10.6
G1 Z10.2
G1 E.8 F1800
G1 F4522
M204 S6000
G1 X129.554 Y129.157 E.30457
G1 X130.106 Y129.084 E.01847
G1 X131.305 Y138.187 E.30457
G1 X130.812 Y138.252 E.01648
; WIPE_START
G1 F8843.478
G1 X130.538 Y136.271 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.855 Y139.315 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
G1 F4522
M204 S6000
G1 X125.42 Y139.373 E.01453
G1 X124.116 Y129.462 E.33158
G1 X130.457 Y128.627 E.21216
G1 X131.761 Y138.538 E.33158
G1 X125.914 Y139.308 E.19564
M204 S250
G1 X125.906 Y139.704 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4522
M204 S5000
G1 X129.712 Y139.203 E.11796
G1 X131.378 Y138.984 E.05166
G1 X131.538 Y140.193 E.03749
G1 X126.065 Y140.914 E.16961
G1 X125.914 Y139.764 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.892 Y139.472 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.386 Y140.28 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
G1 F4522
M204 S5000
G3 X132.228 Y140.5 I-.192 J.028 E.0092
G1 X125.489 Y141.387 E.20886
G3 X125.267 Y141.215 I-.03 J-.191 E.00967
G1 X123.694 Y129.264 E.37039
G3 X123.694 Y126.736 I10.793 J-1.264 E.07785
G1 X125.267 Y114.785 E.37037
G3 X125.488 Y114.612 I.192 J.018 E.00964
G1 X132.23 Y115.501 E.20897
G3 X132.386 Y115.723 I-.037 J.191 E.00921
G1 X130.812 Y127.68 E.37058
G2 X130.812 Y128.322 I3.609 J.32 E.01977
G1 X132.378 Y140.221 E.36876
; WIPE_START
G1 F9547.055
M204 S6000
G1 X132.375 Y140.381 E-.06118
G1 X132.343 Y140.435 E-.02384
G1 X132.228 Y140.5 E-.04989
G1 X130.597 Y140.715 E-.62508
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z10.6
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z10.6 F4000
            G39.3 S1
            G0 Z10.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X131.975 Y140.335 F42000
G1 Z10.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.480841
G1 F4522
M204 S6000
G1 X131.764 Y138.735 E.05759
; WIPE_START
G1 F8220.672
G1 X131.975 Y140.335 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.002 Y138.022 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4522
M204 S6000
G1 X129.857 Y129.322 E.10701
; WIPE_START
G1 F15000
G1 X130.118 Y131.305 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.945 Y126.853 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
; LINE_WIDTH: 0.410072
G1 F4522
M204 S6000
G1 X128.618 Y126.853 E.00976
; LINE_WIDTH: 0.458943
G1 X128.292 Y126.853 E.01106
; LINE_WIDTH: 0.507813
G1 X127.966 Y126.853 E.01236
; WIPE_START
G1 F7743.722
G1 X128.292 Y126.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.844 Y126.853 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
; LINE_WIDTH: 0.119095
G1 F4522
M204 S6000
G1 X126.645 Y126.853 E.00124
; LINE_WIDTH: 0.163438
G1 X126.446 Y126.853 E.00195
; LINE_WIDTH: 0.207781
G1 X126.247 Y126.853 E.00267
; LINE_WIDTH: 0.252124
G1 X126.048 Y126.853 E.00339
; LINE_WIDTH: 0.296467
G1 X125.849 Y126.853 E.00411
; LINE_WIDTH: 0.340809
G1 X125.65 Y126.853 E.00483
; LINE_WIDTH: 0.385152
G1 X125.451 Y126.853 E.00555
; LINE_WIDTH: 0.429495
G1 X125.252 Y126.853 E.00627
M204 S10000
G1 X124.781 Y126.737 F42000
; LINE_WIDTH: 0.192601
G1 F4522
M204 S6000
G1 X126.144 Y116.38 E.12742
M204 S10000
G1 X126.355 Y115.97 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50359
G1 F4522
M204 S6000
G1 X126.498 Y115.989 E.00542
; LINE_WIDTH: 0.523922
G1 X126.556 Y116.017 E.00253
; LINE_WIDTH: 0.564606
G1 X126.614 Y116.045 E.00274
; LINE_WIDTH: 0.60529
G1 X126.672 Y116.074 E.00296
; LINE_WIDTH: 0.645974
M73 P78 R4
G1 X126.73 Y116.102 E.00317
; LINE_WIDTH: 0.706514
G1 X126.788 Y116.13 E.00349
G1 X130.569 Y116.628 E.20619
; LINE_WIDTH: 0.686356
G1 X130.632 Y116.616 E.00338
; LINE_WIDTH: 0.645668
G1 X130.695 Y116.603 E.00317
; LINE_WIDTH: 0.60498
G1 X130.759 Y116.591 E.00295
; LINE_WIDTH: 0.564292
G1 X130.822 Y116.579 E.00274
; LINE_WIDTH: 0.512049
G3 X130.969 Y116.578 I.075 J.221 E.00573
M204 S10000
G1 X131.126 Y117.036 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192582
G1 F4522
M204 S6000
G1 X129.938 Y126.058 E.11098
; WIPE_START
G1 F15000
G1 X130.199 Y124.075 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.968 Y127.658 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
; LINE_WIDTH: 0.387806
G1 F4522
M204 S6000
G1 X123.986 Y128 E.00962
; LINE_WIDTH: 0.42332
G1 X124.017 Y128.404 E.01256
; LINE_WIDTH: 0.466953
G2 X124.113 Y129.265 I18.696 J-1.638 E.02993
; WIPE_START
G1 F8489.914
G1 X124.017 Y128.404 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.875 Y129.978 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4522
M204 S6000
G1 X126.02 Y138.678 E.10701
; WIPE_START
G1 F15000
G1 X125.759 Y136.695 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.469 Y139.564 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
; LINE_WIDTH: 0.480853
G1 F4522
M204 S6000
G1 X125.679 Y141.165 E.05761
; CHANGE_LAYER
; Z_HEIGHT: 10.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.445
G1 X125.469 Y139.564 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 52/73
; update layer progress
M73 L52
M991 S0 P51 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z10.6 I1.13 J.452 P1  F42000
G1 X129.971 Y128.296 Z10.6
G1 Z10.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4526
M204 S5000
G1 X124.499 Y129.016 E.16961
G1 X124.339 Y127.807 E.03749
G1 X127.951 Y127.331 E.11193
G1 X129.812 Y127.086 E.05768
G1 X129.964 Y128.236 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.984 Y128.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.36 Y120.912 Z10.8 F42000
G1 X127.082 Y117.515 Z10.8
G1 Z10.4
G1 E.8 F1800
G1 F4526
M204 S5000
G1 X129.927 Y117.889 E.08819
G1 X128.795 Y126.485 E.2664
G1 X125.95 Y126.111 E.08819
G1 X126.083 Y125.102 E.03125
G1 X127.074 Y117.574 E.23331
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.062 Y117.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.079 Y125.358 Z10.8 F42000
G1 X130.197 Y126.23 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4526
M204 S6000
G1 X129.625 Y126.305 E.01912
G1 X130.824 Y117.201 E.30458
G1 X126.394 Y116.618 E.14822
G1 X125.039 Y126.909 E.3443
G1 X124.467 Y126.984 E.01912
G1 X125.982 Y115.483 E.38478
G1 X131.515 Y116.212 E.18516
G1 X130.205 Y126.17 E.33317
; WIPE_START
G1 F8843.478
G1 X129.625 Y126.305 E-.226
G1 X129.809 Y124.912 E-.534
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.458 Y127.362 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
G1 F4526
M204 S6000
G1 X130.244 Y127.362 E.0071
G1 X130.15 Y126.646 E.02395
G1 X129.152 Y126.778 E.03337
G1 X130.367 Y117.552 E.30868
G1 X126.744 Y117.075 E.12121
G1 X125.51 Y126.448 E.31361
G1 X127.769 Y126.746 E.07559
G1 X127.769 Y126.96 E.0071
G1 X124.021 Y127.453 E.1254
G3 X124.083 Y126.783 I7.699 J.373 E.02234
G1 X125.631 Y115.027 E.39334
G1 X131.972 Y115.862 E.21216
G1 X130.466 Y127.303 E.38279
; WIPE_START
G1 F8843.478
G1 X130.244 Y127.362 E-.08734
G1 X130.15 Y126.646 E-.27437
G1 X129.152 Y126.778 E-.38225
G1 X129.158 Y126.736 E-.01604
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.744 Y129.126 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
G1 F4526
M204 S6000
G1 X129.133 Y129.075 E.01301
G1 X130.367 Y138.448 E.31361
G1 X126.744 Y138.925 E.12121
G1 X125.51 Y129.552 E.31361
G1 X126.714 Y129.393 E.04029
G1 X128.685 Y129.134 E.06593
M204 S250
G1 X128.795 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4526
M204 S5000
G1 X129.927 Y138.111 E.2664
G1 X127.082 Y138.485 E.08819
G1 X125.95 Y129.889 E.2664
G1 X126.765 Y129.782 E.02527
G1 X128.736 Y129.523 E.06107
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.011 Y131.504 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.158 Y129.994 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4526
M204 S6000
G1 X126.323 Y138.843 E.29609
G1 X125.771 Y138.916 E.01847
G1 X124.572 Y129.813 E.30457
G1 X125.124 Y129.74 E.01847
G1 X125.15 Y129.934 E.0065
; WIPE_START
G1 F8843.478
G1 X125.411 Y131.917 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.328 Y137.755 Z10.8 F42000
G1 X130.753 Y138.26 Z10.8
G1 Z10.4
G1 E.8 F1800
G1 F4526
M204 S6000
G1 X129.554 Y129.157 E.30457
G1 X130.106 Y129.084 E.01847
G1 X131.305 Y138.187 E.30457
G1 X130.812 Y138.252 E.01648
; WIPE_START
G1 F8843.478
G1 X130.538 Y136.271 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.855 Y139.315 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
G1 F4526
M204 S6000
G1 X125.42 Y139.373 E.01453
G1 X124.116 Y129.462 E.33158
G1 X130.457 Y128.627 E.21216
G1 X131.761 Y138.538 E.33158
G1 X125.914 Y139.308 E.19564
M204 S250
G1 X125.906 Y139.704 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4526
M204 S5000
G1 X129.517 Y139.229 E.11193
G1 X131.378 Y138.984 E.05768
G1 X131.538 Y140.193 E.03749
G1 X126.065 Y140.914 E.16961
G1 X125.914 Y139.764 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.892 Y139.47 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.386 Y140.28 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
G1 F4526
M204 S5000
G3 X132.23 Y140.499 I-.19 J.03 E.00916
G1 X125.49 Y141.387 E.20891
G3 X125.267 Y141.215 I-.029 J-.192 E.00965
G1 X123.694 Y129.264 E.3704
G3 X123.694 Y126.736 I10.795 J-1.264 E.07785
G1 X125.267 Y114.785 E.37039
G3 X125.488 Y114.612 I.192 J.018 E.00962
G1 X132.249 Y115.505 E.20954
G3 X132.386 Y115.722 I-.053 J.186 E.00867
G1 X130.812 Y127.68 E.3706
G2 X130.812 Y128.322 I3.32 J.319 E.01976
G1 X132.378 Y140.221 E.36876
; WIPE_START
G1 F9547.055
M204 S6000
G1 X132.384 Y140.351 E-.04965
G1 X132.358 Y140.414 E-.02599
G1 X132.296 Y140.475 E-.03311
G1 X132.23 Y140.499 E-.02652
G1 X130.6 Y140.714 E-.62474
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z10.8
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z10.8 F4000
            G39.3 S1
            G0 Z10.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X131.975 Y140.335 F42000
G1 Z10.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.480849
G1 F4526
M204 S6000
G1 X131.764 Y138.735 E.05759
; WIPE_START
G1 F8220.525
G1 X131.975 Y140.335 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.002 Y138.022 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4526
M204 S6000
G1 X129.857 Y129.322 E.10701
; WIPE_START
G1 F15000
G1 X130.118 Y131.305 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.945 Y126.853 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
; LINE_WIDTH: 0.410058
G1 F4526
M204 S6000
G1 X128.618 Y126.853 E.00976
; LINE_WIDTH: 0.458935
G1 X128.292 Y126.853 E.01106
; LINE_WIDTH: 0.507811
G1 X127.966 Y126.853 E.01236
; WIPE_START
G1 F7743.759
G1 X128.292 Y126.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.844 Y126.853 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
; LINE_WIDTH: 0.119095
G1 F4526
M204 S6000
G1 X126.645 Y126.853 E.00124
; LINE_WIDTH: 0.163438
G1 X126.446 Y126.853 E.00195
; LINE_WIDTH: 0.207781
G1 X126.247 Y126.853 E.00267
; LINE_WIDTH: 0.252124
G1 X126.048 Y126.853 E.00339
; LINE_WIDTH: 0.296467
G1 X125.849 Y126.853 E.00411
; LINE_WIDTH: 0.34081
G1 X125.65 Y126.853 E.00483
; LINE_WIDTH: 0.385152
G1 X125.451 Y126.853 E.00555
; LINE_WIDTH: 0.429495
G1 X125.252 Y126.853 E.00627
M204 S10000
G1 X124.781 Y126.737 F42000
; LINE_WIDTH: 0.192601
G1 F4526
M204 S6000
G1 X126.144 Y116.38 E.12742
M204 S10000
G1 X126.355 Y115.97 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50357
G1 F4526
M204 S6000
G1 X126.498 Y115.989 E.00542
; LINE_WIDTH: 0.523902
G1 X126.556 Y116.017 E.00253
; LINE_WIDTH: 0.564586
G1 X126.614 Y116.045 E.00274
; LINE_WIDTH: 0.60527
G1 X126.672 Y116.074 E.00296
; LINE_WIDTH: 0.645954
G1 X126.73 Y116.102 E.00317
; LINE_WIDTH: 0.706514
G1 X126.788 Y116.13 E.00349
G1 X130.569 Y116.628 E.20619
; LINE_WIDTH: 0.686378
G1 X130.632 Y116.616 E.00338
; LINE_WIDTH: 0.645694
G1 X130.695 Y116.603 E.00317
; LINE_WIDTH: 0.60501
G1 X130.759 Y116.591 E.00295
; LINE_WIDTH: 0.564326
G1 X130.822 Y116.579 E.00274
; LINE_WIDTH: 0.51209
G3 X130.969 Y116.578 I.075 J.221 E.00573
M204 S10000
G1 X131.126 Y117.036 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192592
G1 F4526
M204 S6000
G1 X129.938 Y126.058 E.11099
; WIPE_START
G1 F15000
G1 X130.199 Y124.075 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.968 Y127.658 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
; LINE_WIDTH: 0.387808
G1 F4526
M204 S6000
G1 X123.986 Y128 E.00962
; LINE_WIDTH: 0.42332
G1 X124.017 Y128.404 E.01256
; LINE_WIDTH: 0.46696
G2 X124.113 Y129.265 I18.702 J-1.639 E.02993
; WIPE_START
G1 F8489.763
G1 X124.017 Y128.404 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.875 Y129.978 Z10.8 F42000
G1 Z10.4
M73 P79 R4
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4526
M204 S6000
G1 X126.02 Y138.678 E.10701
; WIPE_START
G1 F15000
G1 X125.759 Y136.695 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.469 Y139.564 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
; LINE_WIDTH: 0.480854
G1 F4526
M204 S6000
G1 X125.679 Y141.165 E.05761
; CHANGE_LAYER
; Z_HEIGHT: 10.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F8220.43
G1 X125.469 Y139.564 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 53/73
; update layer progress
M73 L53
M991 S0 P52 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z10.8 I1.13 J.452 P1  F42000
G1 X129.971 Y128.296 Z10.8
G1 Z10.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4522
M204 S5000
G1 X124.499 Y129.016 E.16961
G1 X124.339 Y127.807 E.03749
G1 X127.756 Y127.357 E.1059
G1 X129.812 Y127.086 E.06371
G1 X129.964 Y128.236 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.984 Y128.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.356 Y121.011 Z11 F42000
G1 X129.927 Y117.889 Z11
G1 Z10.6
G1 E.8 F1800
G1 F4522
M204 S5000
G1 X128.795 Y126.485 E.26641
G1 X125.95 Y126.111 E.08819
G1 X126.059 Y125.28 E.02574
G1 X127.082 Y117.515 E.24066
G1 X129.868 Y117.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.62 Y119.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.197 Y126.23 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4522
M204 S6000
G1 X129.625 Y126.305 E.01912
G1 X130.824 Y117.201 E.30459
G1 X126.394 Y116.618 E.14822
G1 X125.039 Y126.909 E.3443
G1 X124.467 Y126.984 E.01912
G1 X125.982 Y115.483 E.38478
M73 P79 R3
G1 X131.515 Y116.212 E.18516
G1 X130.205 Y126.17 E.33317
; WIPE_START
G1 F8843.478
G1 X129.625 Y126.305 E-.226
G1 X129.809 Y124.912 E-.534
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.458 Y127.362 Z11 F42000
G1 Z10.6
G1 E.8 F1800
G1 F4522
M204 S6000
G1 X130.244 Y127.362 E.0071
G1 X130.15 Y126.646 E.02395
G1 X129.152 Y126.778 E.03337
G1 X130.367 Y117.552 E.30868
G1 X126.744 Y117.075 E.12121
G1 X125.51 Y126.448 E.31361
G1 X127.769 Y126.746 E.07559
G1 X127.769 Y126.96 E.0071
G1 X124.021 Y127.453 E.1254
G3 X124.083 Y126.783 I7.699 J.373 E.02234
G1 X125.631 Y115.027 E.39334
G1 X131.972 Y115.862 E.21216
G1 X130.466 Y127.303 E.38279
; WIPE_START
G1 F8843.478
G1 X130.244 Y127.362 E-.08734
G1 X130.15 Y126.646 E-.2744
G1 X129.152 Y126.778 E-.38224
G1 X129.158 Y126.736 E-.01602
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.744 Y129.126 Z11 F42000
G1 Z10.6
G1 E.8 F1800
G1 F4522
M204 S6000
G1 X129.133 Y129.075 E.01301
G1 X130.367 Y138.448 E.31361
G1 X126.744 Y138.925 E.12121
G1 X125.51 Y129.552 E.31361
G1 X126.661 Y129.4 E.03852
G1 X128.685 Y129.134 E.0677
M204 S250
G1 X128.795 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4522
M204 S5000
G1 X129.927 Y138.111 E.2664
G1 X127.082 Y138.485 E.08819
G1 X125.95 Y129.889 E.2664
G1 X126.713 Y129.789 E.02364
G1 X128.736 Y129.523 E.06271
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.011 Y131.504 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.158 Y129.994 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4522
M204 S6000
G1 X126.323 Y138.843 E.29609
G1 X125.771 Y138.916 E.01847
G1 X124.572 Y129.813 E.30457
G1 X125.124 Y129.74 E.01847
G1 X125.15 Y129.934 E.0065
; WIPE_START
G1 F8843.478
G1 X125.411 Y131.917 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.328 Y137.755 Z11 F42000
G1 X130.753 Y138.26 Z11
G1 Z10.6
G1 E.8 F1800
G1 F4522
M204 S6000
G1 X129.554 Y129.157 E.30457
G1 X130.106 Y129.084 E.01847
G1 X131.305 Y138.187 E.30457
G1 X130.812 Y138.252 E.01648
; WIPE_START
G1 F8843.478
G1 X130.538 Y136.271 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.855 Y139.315 Z11 F42000
G1 Z10.6
G1 E.8 F1800
G1 F4522
M204 S6000
G1 X125.42 Y139.373 E.01453
G1 X124.116 Y129.462 E.33158
G1 X130.457 Y128.627 E.21216
G1 X131.761 Y138.538 E.33158
G1 X125.914 Y139.308 E.19564
M204 S250
G1 X125.906 Y139.704 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4522
M204 S5000
G1 X129.323 Y139.254 E.1059
G1 X131.378 Y138.984 E.06371
G1 X131.538 Y140.193 E.03749
G1 X126.065 Y140.914 E.16961
G1 X125.914 Y139.764 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.892 Y139.468 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.386 Y140.28 Z11 F42000
G1 Z10.6
G1 E.8 F1800
G1 F4522
M204 S5000
G3 X132.228 Y140.5 I-.19 J.03 E.00922
G1 X125.49 Y141.387 E.20885
G3 X125.267 Y141.215 I-.03 J-.191 E.00968
G1 X123.694 Y129.264 E.37039
G3 X123.694 Y126.736 I9.872 J-1.264 E.07789
G1 X125.267 Y114.786 E.37037
G3 X125.488 Y114.612 I.192 J.018 E.00964
G1 X132.23 Y115.501 E.20897
G3 X132.386 Y115.722 I-.037 J.191 E.00921
G1 X130.812 Y127.68 E.37059
G2 X130.812 Y128.322 I3.581 J.32 E.01977
G1 X132.378 Y140.221 E.36876
; WIPE_START
G1 F9547.055
M204 S6000
G1 X132.384 Y140.351 E-.04974
G1 X132.358 Y140.415 E-.02599
G1 X132.294 Y140.476 E-.03399
G1 X132.228 Y140.5 E-.02629
G1 X130.6 Y140.714 E-.624
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z11
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z11 F4000
            G39.3 S1
            G0 Z11 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X131.975 Y140.335 F42000
G1 Z10.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.480855
G1 F4522
M204 S6000
G1 X131.764 Y138.735 E.05759
; WIPE_START
G1 F8220.411
G1 X131.975 Y140.335 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.002 Y138.022 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4522
M204 S6000
G1 X129.857 Y129.322 E.10701
; WIPE_START
G1 F15000
G1 X130.118 Y131.305 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.945 Y126.853 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; LINE_WIDTH: 0.410056
G1 F4522
M204 S6000
G1 X128.618 Y126.853 E.00976
; LINE_WIDTH: 0.458934
G1 X128.292 Y126.853 E.01106
; LINE_WIDTH: 0.507811
G1 X127.966 Y126.853 E.01236
; WIPE_START
G1 F7743.749
G1 X128.292 Y126.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.844 Y126.853 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; LINE_WIDTH: 0.119096
G1 F4522
M204 S6000
G1 X126.645 Y126.853 E.00124
; LINE_WIDTH: 0.163441
G1 X126.446 Y126.853 E.00195
; LINE_WIDTH: 0.207785
G1 X126.247 Y126.853 E.00267
; LINE_WIDTH: 0.25213
G1 X126.048 Y126.853 E.00339
; LINE_WIDTH: 0.296475
G1 X125.849 Y126.853 E.00411
; LINE_WIDTH: 0.340819
G1 X125.65 Y126.853 E.00483
; LINE_WIDTH: 0.385164
G1 X125.451 Y126.853 E.00555
; LINE_WIDTH: 0.429509
G1 X125.252 Y126.853 E.00627
M204 S10000
G1 X124.781 Y126.737 F42000
; LINE_WIDTH: 0.192592
G1 F4522
M204 S6000
G1 X126.144 Y116.38 E.12741
M204 S10000
G1 X126.355 Y115.97 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50363
G1 F4522
M204 S6000
G1 X126.498 Y115.989 E.00542
; LINE_WIDTH: 0.52396
G1 X126.556 Y116.017 E.00253
; LINE_WIDTH: 0.56464
G1 X126.614 Y116.045 E.00274
; LINE_WIDTH: 0.60532
G1 X126.672 Y116.074 E.00296
; LINE_WIDTH: 0.646
G1 X126.73 Y116.102 E.00317
; LINE_WIDTH: 0.706525
G1 X126.788 Y116.13 E.00349
G1 X130.569 Y116.628 E.20619
; LINE_WIDTH: 0.686354
G1 X130.632 Y116.616 E.00338
; LINE_WIDTH: 0.645662
G1 X130.696 Y116.603 E.00317
; LINE_WIDTH: 0.60497
G1 X130.759 Y116.591 E.00295
; LINE_WIDTH: 0.564278
G1 X130.822 Y116.579 E.00274
; LINE_WIDTH: 0.512036
G3 X130.969 Y116.578 I.075 J.221 E.00573
M204 S10000
G1 X131.126 Y117.036 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192592
G1 F4522
M204 S6000
G1 X129.938 Y126.058 E.11099
; WIPE_START
G1 F15000
G1 X130.199 Y124.075 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.968 Y127.658 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; LINE_WIDTH: 0.387807
G1 F4522
M204 S6000
G1 X123.986 Y128 E.00962
; LINE_WIDTH: 0.423319
G1 X124.017 Y128.404 E.01256
; LINE_WIDTH: 0.466958
G2 X124.113 Y129.265 I18.754 J-1.644 E.02993
; WIPE_START
G1 F8489.82
G1 X124.017 Y128.404 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.875 Y129.978 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4522
M204 S6000
G1 X126.02 Y138.678 E.10701
; WIPE_START
G1 F15000
G1 X125.759 Y136.695 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.469 Y139.564 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; LINE_WIDTH: 0.480855
G1 F4522
M204 S6000
G1 X125.679 Y141.165 E.05761
; CHANGE_LAYER
; Z_HEIGHT: 10.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.395
G1 X125.469 Y139.564 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 54/73
; update layer progress
M73 L54
M991 S0 P53 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z11 I1.13 J.452 P1  F42000
G1 X129.971 Y128.296 Z11
G1 Z10.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4522
M204 S5000
M73 P80 R3
G1 X124.499 Y129.016 E.16961
G1 X124.339 Y127.807 E.03749
G1 X127.562 Y127.383 E.09988
G1 X129.812 Y127.086 E.06974
G1 X129.964 Y128.236 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.984 Y128.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.356 Y121.011 Z11.2 F42000
G1 X129.927 Y117.889 Z11.2
G1 Z10.8
G1 E.8 F1800
G1 F4522
M204 S5000
G1 X128.795 Y126.485 E.26641
G1 X125.95 Y126.111 E.08819
G1 X126.036 Y125.458 E.02023
G1 X127.082 Y117.515 E.24617
G1 X129.868 Y117.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.62 Y119.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.197 Y126.23 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4522
M204 S6000
G1 X129.625 Y126.305 E.01912
G1 X130.824 Y117.201 E.30459
G1 X126.394 Y116.618 E.14822
G1 X125.039 Y126.909 E.3443
G1 X124.467 Y126.984 E.01912
G1 X125.981 Y115.486 E.38471
G1 X131.515 Y116.213 E.18516
G1 X130.205 Y126.17 E.33316
; WIPE_START
G1 F8843.478
G1 X129.625 Y126.305 E-.226
G1 X129.809 Y124.912 E-.534
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.458 Y127.362 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
G1 F4522
M204 S6000
G1 X130.244 Y127.362 E.0071
G1 X130.15 Y126.646 E.02395
G1 X129.152 Y126.778 E.03337
G1 X130.367 Y117.552 E.30868
G1 X126.744 Y117.075 E.12121
G1 X125.51 Y126.448 E.31361
G1 X127.769 Y126.746 E.07559
G1 X127.769 Y126.96 E.0071
G1 X124.021 Y127.453 E.1254
G3 X124.083 Y126.783 I7.699 J.373 E.02234
G1 X125.631 Y115.029 E.39326
G1 X131.972 Y115.862 E.21216
G1 X130.466 Y127.303 E.38278
; WIPE_START
G1 F8843.478
G1 X130.244 Y127.362 E-.08734
G1 X130.15 Y126.646 E-.27437
G1 X129.152 Y126.778 E-.38225
G1 X129.158 Y126.736 E-.01604
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.744 Y129.126 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
G1 F4522
M204 S6000
G1 X129.133 Y129.075 E.01301
G1 X130.367 Y138.448 E.31361
G1 X126.744 Y138.925 E.12121
G1 X125.51 Y129.552 E.31361
G1 X126.609 Y129.407 E.03676
G1 X128.685 Y129.134 E.06946
M204 S250
G1 X128.795 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4522
M204 S5000
G1 X129.927 Y138.111 E.2664
G1 X127.082 Y138.485 E.08819
G1 X125.95 Y129.889 E.2664
G1 X126.66 Y129.796 E.022
G1 X128.736 Y129.523 E.06434
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.011 Y131.504 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.158 Y129.994 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4522
M204 S6000
G1 X126.323 Y138.843 E.29609
G1 X125.771 Y138.916 E.01847
G1 X124.572 Y129.813 E.30457
G1 X125.124 Y129.74 E.01847
G1 X125.15 Y129.934 E.0065
; WIPE_START
G1 F8843.478
G1 X125.411 Y131.917 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.328 Y137.755 Z11.2 F42000
G1 X130.753 Y138.26 Z11.2
G1 Z10.8
G1 E.8 F1800
G1 F4522
M204 S6000
G1 X129.554 Y129.157 E.30457
G1 X130.106 Y129.084 E.01847
G1 X131.305 Y138.187 E.30457
G1 X130.812 Y138.252 E.01648
; WIPE_START
G1 F8843.478
G1 X130.538 Y136.271 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.855 Y139.315 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
G1 F4522
M204 S6000
G1 X125.42 Y139.373 E.01453
G1 X124.116 Y129.462 E.33158
G1 X130.457 Y128.627 E.21216
G1 X131.761 Y138.538 E.33158
G1 X125.914 Y139.308 E.19564
M204 S250
G1 X125.906 Y139.704 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4522
M204 S5000
G1 X129.128 Y139.28 E.09988
G1 X131.378 Y138.984 E.06974
G1 X131.538 Y140.193 E.03749
G1 X126.065 Y140.914 E.16961
G1 X125.914 Y139.764 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.891 Y139.466 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.386 Y140.28 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
G1 F4522
M204 S5000
G3 X132.228 Y140.5 I-.19 J.03 E.00924
G1 X125.49 Y141.387 E.20883
G3 X125.267 Y141.215 I-.03 J-.191 E.00968
G1 X123.694 Y129.264 E.37039
G3 X123.694 Y126.736 I9.873 J-1.264 E.07789
G1 X125.267 Y114.785 E.37037
G3 X125.459 Y114.611 I.197 J.024 E.00868
G1 X132.23 Y115.501 E.20984
G3 X132.386 Y115.722 I-.038 J.193 E.00919
G1 X130.812 Y127.68 E.3706
G2 X130.812 Y128.322 I3.322 J.319 E.01976
G1 X132.378 Y140.221 E.36876
; WIPE_START
G1 F9547.055
M204 S6000
G1 X132.384 Y140.352 E-.04982
G1 X132.358 Y140.415 E-.02584
G1 X132.294 Y140.476 E-.03403
G1 X132.228 Y140.5 E-.02653
G1 X130.6 Y140.714 E-.62378
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z11.2
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z11.2 F4000
            G39.3 S1
            G0 Z11.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X131.975 Y140.335 F42000
G1 Z10.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.480841
G1 F4522
M204 S6000
G1 X131.764 Y138.735 E.05759
; WIPE_START
G1 F8220.672
G1 X131.975 Y140.335 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.002 Y138.022 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4522
M204 S6000
G1 X129.857 Y129.322 E.10701
; WIPE_START
G1 F15000
G1 X130.118 Y131.305 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.945 Y126.853 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
; LINE_WIDTH: 0.410074
G1 F4522
M204 S6000
G1 X128.618 Y126.853 E.00976
; LINE_WIDTH: 0.458945
G1 X128.292 Y126.853 E.01106
; LINE_WIDTH: 0.507815
G1 X127.966 Y126.853 E.01236
; WIPE_START
G1 F7743.687
G1 X128.292 Y126.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.844 Y126.853 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
; LINE_WIDTH: 0.119094
G1 F4522
M204 S6000
G1 X126.645 Y126.853 E.00124
; LINE_WIDTH: 0.163434
G1 X126.446 Y126.853 E.00195
; LINE_WIDTH: 0.207775
G1 X126.247 Y126.853 E.00267
; LINE_WIDTH: 0.252116
G1 X126.048 Y126.853 E.00339
; LINE_WIDTH: 0.296456
G1 X125.849 Y126.853 E.00411
; LINE_WIDTH: 0.340797
G1 X125.65 Y126.853 E.00483
; LINE_WIDTH: 0.385138
G1 X125.451 Y126.853 E.00555
; LINE_WIDTH: 0.429478
G1 X125.252 Y126.853 E.00627
M204 S10000
G1 X124.781 Y126.737 F42000
; LINE_WIDTH: 0.192592
G1 F4522
M204 S6000
G1 X126.144 Y116.38 E.12741
M204 S10000
G1 X126.354 Y115.971 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50158
G1 F4522
M204 S6000
G1 X126.498 Y115.99 E.00544
; LINE_WIDTH: 0.52195
G1 X126.556 Y116.018 E.00251
; LINE_WIDTH: 0.56265
G1 X126.614 Y116.046 E.00273
; LINE_WIDTH: 0.60335
G1 X126.672 Y116.075 E.00294
; LINE_WIDTH: 0.64405
G1 X126.73 Y116.103 E.00315
; LINE_WIDTH: 0.705294
G1 X126.788 Y116.131 E.00348
G1 X130.569 Y116.628 E.20585
; LINE_WIDTH: 0.68585
G1 X130.632 Y116.616 E.00338
; LINE_WIDTH: 0.64519
G1 X130.696 Y116.604 E.00316
; LINE_WIDTH: 0.60453
G1 X130.759 Y116.591 E.00295
; LINE_WIDTH: 0.56387
G1 X130.822 Y116.579 E.00274
; LINE_WIDTH: 0.511661
G3 X130.97 Y116.578 I.075 J.221 E.00573
M204 S10000
G1 X131.126 Y117.036 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192592
G1 F4522
M204 S6000
G1 X129.938 Y126.058 E.11099
; WIPE_START
G1 F15000
G1 X130.199 Y124.075 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.968 Y127.658 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
; LINE_WIDTH: 0.387807
G1 F4522
M204 S6000
G1 X123.986 Y128 E.00962
; LINE_WIDTH: 0.423327
G1 X124.017 Y128.404 E.01256
; LINE_WIDTH: 0.466955
G2 X124.113 Y129.265 I18.679 J-1.636 E.02993
; WIPE_START
G1 F8489.871
G1 X124.017 Y128.404 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.875 Y129.978 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4522
M204 S6000
G1 X126.02 Y138.678 E.10701
; WIPE_START
G1 F15000
G1 X125.759 Y136.695 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.469 Y139.564 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
; LINE_WIDTH: 0.480842
G1 F4522
M204 S6000
G1 X125.679 Y141.165 E.05761
; CHANGE_LAYER
; Z_HEIGHT: 11
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.657
G1 X125.469 Y139.564 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 55/73
; update layer progress
M73 L55
M991 S0 P54 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z11.2 I1.13 J.452 P1  F42000
G1 X129.971 Y128.296 Z11.2
G1 Z11
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4522
M204 S5000
G1 X124.499 Y129.016 E.16961
G1 X124.339 Y127.807 E.03749
G1 X127.367 Y127.408 E.09385
G1 X129.812 Y127.086 E.07577
G1 X129.964 Y128.236 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.984 Y128.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.356 Y121.011 Z11.4 F42000
G1 X129.927 Y117.889 Z11.4
G1 Z11
G1 E.8 F1800
G1 F4522
M204 S5000
G1 X128.795 Y126.485 E.2664
G1 X125.95 Y126.111 E.08819
G1 X126.013 Y125.636 E.01472
G1 X127.082 Y117.515 E.25169
G1 X129.868 Y117.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.62 Y119.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.197 Y126.23 Z11.4 F42000
M73 P81 R3
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4522
M204 S6000
G1 X129.625 Y126.305 E.01912
G1 X130.824 Y117.201 E.30458
G1 X126.394 Y116.618 E.14822
G1 X125.039 Y126.909 E.3443
G1 X124.467 Y126.984 E.01912
G1 X125.981 Y115.486 E.38471
G1 X131.515 Y116.213 E.18516
G1 X130.205 Y126.17 E.33316
; WIPE_START
G1 F8843.478
G1 X129.625 Y126.305 E-.226
G1 X129.809 Y124.912 E-.534
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.458 Y127.362 Z11.4 F42000
G1 Z11
G1 E.8 F1800
G1 F4522
M204 S6000
G1 X130.244 Y127.362 E.0071
G1 X130.15 Y126.646 E.02395
G1 X129.152 Y126.778 E.03337
G1 X130.367 Y117.552 E.30868
G1 X126.744 Y117.075 E.12121
G1 X125.51 Y126.448 E.31361
G1 X127.769 Y126.746 E.07559
G1 X127.769 Y126.96 E.0071
G1 X124.021 Y127.453 E.1254
G3 X124.083 Y126.783 I7.706 J.374 E.02233
G1 X125.631 Y115.029 E.39326
G1 X131.972 Y115.862 E.21216
G1 X130.466 Y127.303 E.38278
; WIPE_START
G1 F8843.478
G1 X130.244 Y127.362 E-.08734
G1 X130.15 Y126.646 E-.27437
G1 X129.152 Y126.778 E-.38225
G1 X129.158 Y126.736 E-.01604
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.744 Y129.126 Z11.4 F42000
G1 Z11
G1 E.8 F1800
G1 F4522
M204 S6000
G1 X129.133 Y129.075 E.01301
G1 X130.367 Y138.448 E.31361
G1 X126.744 Y138.925 E.12121
G1 X125.51 Y129.552 E.31361
G1 X126.556 Y129.414 E.03499
G1 X128.685 Y129.134 E.07123
M204 S250
G1 X128.795 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4522
M204 S5000
G1 X129.927 Y138.111 E.2664
G1 X127.082 Y138.485 E.08819
G1 X125.95 Y129.889 E.2664
G1 X126.607 Y129.803 E.02036
G1 X128.736 Y129.523 E.06598
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.011 Y131.504 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.158 Y129.994 Z11.4 F42000
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4522
M204 S6000
G1 X126.323 Y138.843 E.29609
G1 X125.771 Y138.916 E.01847
G1 X124.572 Y129.813 E.30457
G1 X125.124 Y129.74 E.01847
G1 X125.15 Y129.934 E.0065
; WIPE_START
G1 F8843.478
G1 X125.411 Y131.917 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.328 Y137.755 Z11.4 F42000
G1 X130.753 Y138.26 Z11.4
G1 Z11
G1 E.8 F1800
G1 F4522
M204 S6000
G1 X129.554 Y129.157 E.30457
G1 X130.106 Y129.084 E.01847
G1 X131.305 Y138.187 E.30457
G1 X130.812 Y138.252 E.01648
; WIPE_START
G1 F8843.478
G1 X130.538 Y136.271 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.855 Y139.315 Z11.4 F42000
G1 Z11
G1 E.8 F1800
G1 F4522
M204 S6000
G1 X125.42 Y139.373 E.01453
G1 X124.116 Y129.462 E.33158
G1 X130.457 Y128.627 E.21216
G1 X131.761 Y138.538 E.33158
G1 X125.914 Y139.308 E.19564
M204 S250
G1 X125.906 Y139.704 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4522
M204 S5000
G1 X128.934 Y139.305 E.09385
G1 X131.378 Y138.984 E.07577
G1 X131.538 Y140.193 E.03749
G1 X126.065 Y140.914 E.16961
G1 X125.914 Y139.764 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.891 Y139.464 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.386 Y140.28 Z11.4 F42000
G1 Z11
G1 E.8 F1800
G1 F4522
M204 S5000
G3 X132.228 Y140.5 I-.192 J.029 E.00922
G1 X125.489 Y141.387 E.20884
G3 X125.267 Y141.215 I-.029 J-.191 E.00966
G1 X123.694 Y129.264 E.37039
G3 X123.694 Y126.736 I9.873 J-1.264 E.07789
G1 X125.267 Y114.785 E.37038
G3 X125.459 Y114.611 I.195 J.022 E.0087
G1 X132.23 Y115.501 E.20984
G3 X132.386 Y115.723 I-.037 J.191 E.00922
G1 X130.812 Y127.68 E.37059
G2 X130.812 Y128.32 I2.783 J.32 E.0197
G1 X132.378 Y140.22 E.36882
; WIPE_START
G1 F9547.055
M204 S6000
G1 X132.384 Y140.352 E-.05002
G1 X132.342 Y140.437 E-.03613
G1 X132.228 Y140.5 E-.04937
G1 X130.599 Y140.714 E-.62448
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z11.4
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z11.4 F4000
            G39.3 S1
            G0 Z11.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X131.975 Y140.335 F42000
G1 Z11
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.480849
G1 F4522
M204 S6000
G1 X131.764 Y138.735 E.05759
; WIPE_START
G1 F8220.525
G1 X131.975 Y140.335 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.002 Y138.022 Z11.4 F42000
G1 Z11
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4522
M204 S6000
G1 X129.857 Y129.322 E.10701
; WIPE_START
G1 F15000
G1 X130.118 Y131.305 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.945 Y126.853 Z11.4 F42000
G1 Z11
G1 E.8 F1800
; LINE_WIDTH: 0.410057
G1 F4522
M204 S6000
G1 X128.618 Y126.853 E.00976
; LINE_WIDTH: 0.458935
G1 X128.292 Y126.853 E.01106
; LINE_WIDTH: 0.507812
G1 X127.966 Y126.853 E.01236
; WIPE_START
G1 F7743.733
G1 X128.292 Y126.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.844 Y126.853 Z11.4 F42000
G1 Z11
G1 E.8 F1800
; LINE_WIDTH: 0.119094
G1 F4522
M204 S6000
G1 X126.645 Y126.853 E.00124
; LINE_WIDTH: 0.163437
G1 X126.446 Y126.853 E.00195
; LINE_WIDTH: 0.207779
G1 X126.247 Y126.853 E.00267
; LINE_WIDTH: 0.252122
G1 X126.048 Y126.853 E.00339
; LINE_WIDTH: 0.296465
G1 X125.849 Y126.853 E.00411
; LINE_WIDTH: 0.340807
G1 X125.65 Y126.853 E.00483
; LINE_WIDTH: 0.38515
G1 X125.451 Y126.853 E.00555
; LINE_WIDTH: 0.429492
G1 X125.252 Y126.853 E.00627
M204 S10000
G1 X124.781 Y126.737 F42000
; LINE_WIDTH: 0.192592
G1 F4522
M204 S6000
G1 X126.144 Y116.38 E.12741
M204 S10000
G1 X126.354 Y115.971 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.5016
G1 F4522
M204 S6000
G1 X126.498 Y115.99 E.00544
; LINE_WIDTH: 0.52197
G1 X126.556 Y116.018 E.00251
; LINE_WIDTH: 0.56267
G1 X126.614 Y116.046 E.00273
; LINE_WIDTH: 0.60337
G1 X126.672 Y116.075 E.00294
; LINE_WIDTH: 0.64407
G1 X126.73 Y116.103 E.00315
; LINE_WIDTH: 0.705313
G1 X126.788 Y116.131 E.00348
G1 X130.569 Y116.628 E.20586
; LINE_WIDTH: 0.685868
G1 X130.632 Y116.616 E.00338
; LINE_WIDTH: 0.645204
G1 X130.696 Y116.604 E.00316
; LINE_WIDTH: 0.60454
G1 X130.759 Y116.592 E.00295
; LINE_WIDTH: 0.563876
G1 X130.822 Y116.579 E.00274
; LINE_WIDTH: 0.511662
G3 X130.97 Y116.578 I.075 J.221 E.00573
M204 S10000
G1 X131.126 Y117.036 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192592
G1 F4522
M204 S6000
G1 X129.938 Y126.058 E.11099
; WIPE_START
G1 F15000
G1 X130.199 Y124.075 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.968 Y127.658 Z11.4 F42000
G1 Z11
G1 E.8 F1800
; LINE_WIDTH: 0.387788
G1 F4522
M204 S6000
G1 X123.986 Y128 E.00962
; LINE_WIDTH: 0.423332
G1 X124.017 Y128.404 E.01257
; LINE_WIDTH: 0.466972
G2 X124.113 Y129.265 I18.703 J-1.639 E.02992
; WIPE_START
G1 F8489.53
G1 X124.017 Y128.404 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.875 Y129.978 Z11.4 F42000
G1 Z11
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4522
M204 S6000
G1 X126.02 Y138.678 E.10701
; WIPE_START
G1 F15000
G1 X125.759 Y136.695 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.469 Y139.564 Z11.4 F42000
G1 Z11
G1 E.8 F1800
; LINE_WIDTH: 0.480854
G1 F4522
M204 S6000
G1 X125.679 Y141.165 E.05761
; CHANGE_LAYER
; Z_HEIGHT: 11.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.42
G1 X125.469 Y139.564 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 56/73
; update layer progress
M73 L56
M991 S0 P55 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z11.4 I1.13 J.452 P1  F42000
G1 X129.971 Y128.296 Z11.4
G1 Z11.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4522
M204 S5000
G1 X124.499 Y129.016 E.16961
G1 X124.339 Y127.807 E.03749
G1 X127.173 Y127.434 E.08782
G1 X129.812 Y127.086 E.08179
G1 X129.964 Y128.236 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.984 Y128.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.356 Y121.011 Z11.6 F42000
G1 X129.927 Y117.889 Z11.6
G1 Z11.2
G1 E.8 F1800
G1 F4522
M204 S5000
G1 X128.795 Y126.485 E.2664
G1 X125.95 Y126.111 E.08819
G1 X125.989 Y125.813 E.00921
G1 X127.082 Y117.515 E.2572
G1 X129.868 Y117.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.62 Y119.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.197 Y126.23 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4522
M204 S6000
G1 X129.625 Y126.305 E.01912
G1 X130.824 Y117.201 E.30458
G1 X126.394 Y116.618 E.14822
G1 X125.039 Y126.909 E.3443
G1 X124.467 Y126.984 E.01912
G1 X125.981 Y115.486 E.38471
G1 X131.515 Y116.213 E.18516
G1 X130.204 Y126.17 E.33316
; WIPE_START
G1 F8843.478
G1 X129.625 Y126.305 E-.226
G1 X129.809 Y124.912 E-.534
; WIPE_END
M73 P82 R3
G1 E-.04 F1800
M204 S10000
G1 X130.458 Y127.362 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
G1 F4522
M204 S6000
G1 X130.244 Y127.362 E.0071
G1 X130.15 Y126.646 E.02395
G1 X129.152 Y126.778 E.03337
G1 X130.367 Y117.552 E.30868
G1 X126.744 Y117.075 E.12121
G1 X125.51 Y126.448 E.31361
G1 X127.769 Y126.746 E.07559
G1 X127.769 Y126.96 E.0071
G1 X124.021 Y127.453 E.1254
G3 X124.083 Y126.783 I7.706 J.374 E.02233
G1 X125.631 Y115.029 E.39326
G1 X131.972 Y115.862 E.21216
G1 X130.466 Y127.303 E.38279
; WIPE_START
G1 F8843.478
G1 X130.244 Y127.362 E-.08734
G1 X130.15 Y126.646 E-.2744
G1 X129.152 Y126.778 E-.38224
G1 X129.158 Y126.736 E-.01602
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.744 Y129.126 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
G1 F4522
M204 S6000
G1 X129.133 Y129.075 E.01301
G1 X130.367 Y138.448 E.31361
G1 X126.744 Y138.925 E.12121
G1 X125.51 Y129.552 E.31361
G1 X126.503 Y129.421 E.03322
G1 X128.685 Y129.134 E.073
M204 S250
G1 X128.795 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4522
M204 S5000
G1 X129.927 Y138.111 E.2664
G1 X127.082 Y138.485 E.08819
G1 X125.95 Y129.889 E.2664
G1 X126.554 Y129.81 E.01873
G1 X128.736 Y129.523 E.06762
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.011 Y131.504 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.158 Y129.994 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4522
M204 S6000
G1 X126.323 Y138.843 E.29609
G1 X125.771 Y138.916 E.01847
G1 X124.572 Y129.813 E.30457
G1 X125.124 Y129.74 E.01847
G1 X125.15 Y129.934 E.0065
; WIPE_START
G1 F8843.478
G1 X125.411 Y131.917 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.328 Y137.755 Z11.6 F42000
G1 X130.753 Y138.26 Z11.6
G1 Z11.2
G1 E.8 F1800
G1 F4522
M204 S6000
G1 X129.554 Y129.157 E.30457
G1 X130.106 Y129.084 E.01847
G1 X131.305 Y138.187 E.30457
G1 X130.812 Y138.252 E.01648
; WIPE_START
G1 F8843.478
G1 X130.538 Y136.271 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.855 Y139.315 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
G1 F4522
M204 S6000
G1 X125.42 Y139.373 E.01453
G1 X124.116 Y129.462 E.33158
G1 X130.457 Y128.627 E.21216
G1 X131.761 Y138.538 E.33158
G1 X125.914 Y139.308 E.19564
M204 S250
G1 X125.906 Y139.704 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4522
M204 S5000
G1 X128.739 Y139.331 E.08782
G1 X131.378 Y138.984 E.08179
G1 X131.538 Y140.193 E.03749
G1 X126.065 Y140.914 E.16961
G1 X125.914 Y139.764 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.891 Y139.461 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.386 Y140.28 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
G1 F4522
M204 S5000
G3 X132.228 Y140.5 I-.19 J.03 E.00922
G1 X125.489 Y141.387 E.20886
G3 X125.268 Y141.217 I-.03 J-.19 E.00961
G1 X123.694 Y129.264 E.37045
G3 X123.694 Y126.736 I10.795 J-1.264 E.07785
G1 X125.267 Y114.785 E.37039
G3 X125.46 Y114.611 I.197 J.024 E.00868
G1 X132.23 Y115.501 E.20983
G3 X132.386 Y115.723 I-.038 J.192 E.0092
G1 X130.812 Y127.68 E.37058
G2 X130.812 Y128.32 I2.904 J.32 E.01971
G1 X132.378 Y140.221 E.36883
; WIPE_START
G1 F9547.055
M204 S6000
G1 X132.36 Y140.412 E-.07305
G1 X132.294 Y140.476 E-.03488
G1 X132.228 Y140.5 E-.02659
G1 X130.596 Y140.715 E-.62548
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z11.6
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z11.6 F4000
            G39.3 S1
            G0 Z11.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X131.975 Y140.335 F42000
G1 Z11.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.480843
G1 F4522
M204 S6000
G1 X131.764 Y138.735 E.05759
; WIPE_START
G1 F8220.621
G1 X131.975 Y140.335 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.002 Y138.022 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4522
M204 S6000
G1 X129.857 Y129.322 E.10701
; WIPE_START
G1 F15000
G1 X130.118 Y131.305 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.945 Y126.853 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; LINE_WIDTH: 0.410056
G1 F4522
M204 S6000
G1 X128.618 Y126.853 E.00976
; LINE_WIDTH: 0.458934
G1 X128.292 Y126.853 E.01106
; LINE_WIDTH: 0.507812
G1 X127.966 Y126.853 E.01236
; WIPE_START
G1 F7743.741
G1 X128.292 Y126.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.844 Y126.853 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; LINE_WIDTH: 0.119097
G1 F4522
M204 S6000
G1 X126.645 Y126.853 E.00124
; LINE_WIDTH: 0.163444
G1 X126.446 Y126.853 E.00195
; LINE_WIDTH: 0.207791
G1 X126.247 Y126.853 E.00267
; LINE_WIDTH: 0.252138
G1 X126.048 Y126.853 E.00339
; LINE_WIDTH: 0.296485
G1 X125.849 Y126.853 E.00411
; LINE_WIDTH: 0.340832
G1 X125.65 Y126.853 E.00483
; LINE_WIDTH: 0.385179
G1 X125.451 Y126.853 E.00555
; LINE_WIDTH: 0.429526
G1 X125.252 Y126.853 E.00627
M204 S10000
G1 X124.781 Y126.737 F42000
; LINE_WIDTH: 0.192574
G1 F4522
M204 S6000
G1 X126.144 Y116.38 E.1274
M204 S10000
G1 X126.354 Y115.971 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50158
G1 F4522
M204 S6000
G1 X126.498 Y115.99 E.00544
; LINE_WIDTH: 0.521952
G1 X126.556 Y116.018 E.00251
; LINE_WIDTH: 0.562656
G1 X126.614 Y116.046 E.00273
; LINE_WIDTH: 0.60336
G1 X126.672 Y116.075 E.00294
; LINE_WIDTH: 0.644064
G1 X126.73 Y116.103 E.00315
; LINE_WIDTH: 0.705323
G1 X126.788 Y116.131 E.00348
G1 X130.569 Y116.628 E.20586
; LINE_WIDTH: 0.685886
G1 X130.632 Y116.616 E.00338
; LINE_WIDTH: 0.645218
G1 X130.696 Y116.604 E.00316
; LINE_WIDTH: 0.60455
G1 X130.759 Y116.592 E.00295
; LINE_WIDTH: 0.563882
G1 X130.822 Y116.579 E.00274
; LINE_WIDTH: 0.511665
G3 X130.97 Y116.578 I.075 J.221 E.00573
M204 S10000
G1 X131.126 Y117.036 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192583
G1 F4522
M204 S6000
G1 X129.938 Y126.058 E.11098
; WIPE_START
G1 F15000
G1 X130.199 Y124.075 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.968 Y127.658 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; LINE_WIDTH: 0.387787
G1 F4522
M204 S6000
G1 X123.986 Y128 E.00962
; LINE_WIDTH: 0.423318
G1 X124.017 Y128.404 E.01257
; LINE_WIDTH: 0.46696
G2 X124.113 Y129.265 I18.689 J-1.637 E.02992
; WIPE_START
G1 F8489.775
G1 X124.017 Y128.404 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.875 Y129.978 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4522
M204 S6000
G1 X126.02 Y138.678 E.10701
; WIPE_START
G1 F15000
G1 X125.759 Y136.695 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.469 Y139.564 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; LINE_WIDTH: 0.480841
G1 F4522
M204 S6000
G1 X125.679 Y141.165 E.05761
; CHANGE_LAYER
; Z_HEIGHT: 11.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.663
G1 X125.469 Y139.564 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 57/73
; update layer progress
M73 L57
M991 S0 P56 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z11.6 I1.13 J.452 P1  F42000
G1 X129.971 Y128.296 Z11.6
G1 Z11.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7246
M204 S5000
G1 X124.499 Y129.016 E.16961
G1 X124.339 Y127.807 E.03749
G1 X126.979 Y127.459 E.08179
G1 X129.812 Y127.086 E.08782
G1 X129.964 Y128.236 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.984 Y128.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.59 Y136.023 Z11.8 F42000
G1 X125.906 Y139.704 Z11.8
G1 Z11.4
G1 E.8 F1800
G1 F7246
M204 S5000
G1 X128.545 Y139.357 E.08179
G1 X131.378 Y138.984 E.08782
G1 X131.538 Y140.193 E.03749
G1 X126.065 Y140.914 E.16961
G1 X125.914 Y139.764 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.89 Y139.458 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.519 Y131.851 Z11.8 F42000
G1 X128.744 Y129.126 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7246
M204 S6000
G1 X129.133 Y129.075 E.01301
G1 X130.367 Y138.448 E.31361
G1 X126.744 Y138.925 E.12121
G1 X125.51 Y129.552 E.31361
G1 X126.45 Y129.428 E.03146
G1 X128.685 Y129.134 E.07476
M204 S250
G1 X128.795 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7246
M204 S5000
G1 X129.927 Y138.111 E.2664
G1 X127.082 Y138.485 E.08819
G1 X125.95 Y129.889 E.26641
G1 X126.501 Y129.817 E.01709
G1 X128.736 Y129.523 E.06925
; WIPE_START
M73 P83 R3
G1 F9547.055
M204 S6000
G1 X129.011 Y131.504 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.158 Y129.994 Z11.8 F42000
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7246
M204 S6000
G1 X126.323 Y138.843 E.29609
G1 X125.771 Y138.916 E.01847
G1 X124.572 Y129.813 E.30457
G1 X125.124 Y129.74 E.01847
G1 X125.15 Y129.934 E.0065
; WIPE_START
G1 F8843.478
G1 X125.411 Y131.917 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.328 Y137.755 Z11.8 F42000
G1 X130.753 Y138.26 Z11.8
G1 Z11.4
G1 E.8 F1800
G1 F7246
M204 S6000
G1 X129.554 Y129.157 E.30457
G1 X130.106 Y129.084 E.01847
G1 X131.305 Y138.187 E.30457
G1 X130.812 Y138.252 E.01648
; WIPE_START
G1 F8843.478
G1 X130.538 Y136.271 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.855 Y139.315 Z11.8 F42000
G1 Z11.4
G1 E.8 F1800
G1 F7246
M204 S6000
G1 X125.42 Y139.373 E.01453
G1 X124.116 Y129.462 E.33158
G1 X130.457 Y128.627 E.21216
G1 X131.761 Y138.538 E.33158
G1 X125.914 Y139.308 E.19564
; WIPE_START
G1 F8843.478
G1 X125.42 Y139.373 E-.18923
G1 X125.224 Y137.883 E-.57077
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.22 Y130.863 Z11.8 F42000
G1 X130.197 Y126.23 Z11.8
G1 Z11.4
G1 E.8 F1800
G1 F7246
M204 S6000
G1 X128.777 Y126.417 E.04751
G1 X128.631 Y126.436 E.00488
G1 X124.467 Y126.984 E.1393
G1 X125.981 Y115.486 E.38471
G1 X131.515 Y116.213 E.18516
G1 X130.205 Y126.17 E.33316
; WIPE_START
G1 F8843.478
G1 X128.777 Y126.417 E-.55057
G1 X128.631 Y126.436 E-.05594
G1 X128.23 Y126.489 E-.15349
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.458 Y127.362 Z11.8 F42000
G1 Z11.4
G1 E.8 F1800
G1 F7246
M204 S6000
G1 X130.244 Y127.362 E.0071
G1 X130.15 Y126.646 E.02395
G1 X124.021 Y127.453 E.20504
G3 X124.083 Y126.783 I7.698 J.373 E.02234
G1 X125.631 Y115.029 E.39326
G1 X131.972 Y115.862 E.21216
G1 X130.466 Y127.303 E.38278
; WIPE_START
G1 F8843.478
G1 X130.244 Y127.362 E-.08734
G1 X130.15 Y126.646 E-.27437
G1 X129.111 Y126.783 E-.39829
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.911 Y134.2 Z11.8 F42000
G1 X132.386 Y140.28 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7246
M204 S5000
G3 X132.228 Y140.5 I-.192 J.028 E.0092
G1 X125.49 Y141.387 E.20885
G3 X125.267 Y141.215 I-.028 J-.193 E.00966
G1 X123.694 Y129.264 E.37039
G3 X123.694 Y126.736 I10.795 J-1.264 E.07785
G1 X125.267 Y114.785 E.37038
G3 X125.46 Y114.611 I.201 J.028 E.00866
G1 X132.233 Y115.501 E.20991
G1 X132.248 Y115.505 E.00049
G3 X132.386 Y115.723 I-.053 J.186 E.00868
G1 X130.812 Y127.68 E.37058
G2 X130.812 Y128.322 I3.523 J.32 E.01976
G1 X132.378 Y140.221 E.36876
; WIPE_START
G1 F9547.055
M204 S6000
G1 X132.384 Y140.352 E-.05004
G1 X132.343 Y140.435 E-.03515
G1 X132.228 Y140.5 E-.04999
G1 X130.598 Y140.714 E-.62482
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z11.8
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z11.8 F4000
            G39.3 S1
            G0 Z11.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X131.975 Y140.335 F42000
G1 Z11.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.480849
G1 F7246
M204 S6000
G1 X131.764 Y138.735 E.05759
; WIPE_START
G1 F8220.511
G1 X131.975 Y140.335 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.002 Y138.022 Z11.8 F42000
G1 Z11.4
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F7246
M204 S6000
G1 X129.857 Y129.322 E.10701
; WIPE_START
G1 F15000
G1 X130.118 Y131.305 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.875 Y129.978 Z11.8 F42000
G1 Z11.4
G1 E.8 F1800
; LINE_WIDTH: 0.192587
G1 F7246
M204 S6000
G1 X126.02 Y138.678 E.10702
; WIPE_START
G1 F15000
G1 X125.759 Y136.695 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.469 Y139.564 Z11.8 F42000
G1 Z11.4
G1 E.8 F1800
; LINE_WIDTH: 0.480855
G1 F7246
M204 S6000
G1 X125.679 Y141.165 E.05761
; WIPE_START
G1 F8220.402
G1 X125.469 Y139.564 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.472 Y131.997 Z11.8 F42000
G1 X124.113 Y129.265 Z11.8
G1 Z11.4
G1 E.8 F1800
; LINE_WIDTH: 0.466966
G1 F7246
M204 S6000
G3 X124.017 Y128.404 I18.606 J-2.499 E.02993
; LINE_WIDTH: 0.423319
G1 X123.986 Y128 E.01256
; LINE_WIDTH: 0.38781
G1 X123.968 Y127.658 E.00962
; WIPE_START
G1 F10438.136
G1 X123.986 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.73 Y126.245 Z11.8 F42000
G1 Z11.4
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.42742
M106 S255
G1 F3000
M204 S6000
G1 X126.127 Y126.429 E.04417
G1 X127.6 Y126.235 E.04655
G1 X124.948 Y125.886 E.08381
G1 X124.998 Y125.505 E.01205
G1 X129.073 Y126.041 E.12877
G1 X129.9 Y125.933 E.02612
G1 X129.922 Y125.765 E.00529
G1 X125.048 Y125.124 E.154
G1 X125.099 Y124.743 E.01205
G1 X129.972 Y125.384 E.154
G1 X130.022 Y125.003 E.01205
G1 X125.149 Y124.361 E.154
G1 X125.199 Y123.98 E.01205
G1 X130.072 Y124.622 E.154
G1 X130.122 Y124.241 E.01205
G1 X125.249 Y123.599 E.154
G1 X125.299 Y123.218 E.01205
G1 X130.173 Y123.859 E.154
G1 X130.223 Y123.478 E.01205
G1 X125.35 Y122.837 E.154
G1 X125.4 Y122.455 E.01205
G1 X130.273 Y123.097 E.154
G1 X130.323 Y122.716 E.01205
G1 X125.45 Y122.074 E.154
G1 X125.5 Y121.693 E.01205
G1 X130.373 Y122.334 E.154
G1 X130.423 Y121.953 E.01205
G1 X125.55 Y121.312 E.154
G1 X125.601 Y120.93 E.01205
G1 X130.474 Y121.572 E.154
G1 X130.524 Y121.191 E.01205
G1 X125.651 Y120.549 E.154
G1 X125.701 Y120.168 E.01205
G1 X130.574 Y120.81 E.154
G1 X130.624 Y120.428 E.01205
G1 X125.751 Y119.787 E.154
G1 X125.801 Y119.406 E.01205
G1 X130.674 Y120.047 E.154
G1 X130.724 Y119.666 E.01205
G1 X125.851 Y119.024 E.154
G1 X125.902 Y118.643 E.01205
G1 X130.775 Y119.285 E.154
G1 X130.825 Y118.904 E.01205
G1 X125.952 Y118.262 E.15399
G1 X126.002 Y117.881 E.01205
G1 X130.875 Y118.522 E.15399
G1 X130.925 Y118.141 E.01205
G1 X126.052 Y117.5 E.15399
G1 X126.102 Y117.118 E.01205
G1 X130.975 Y117.76 E.15399
G1 X131.025 Y117.379 E.01205
G1 X126.153 Y116.737 E.15399
G1 X126.203 Y116.356 E.01205
G1 X126.272 Y116.365 E.00217
G1 X126.398 Y116.53 E.0065
G1 X126.517 Y116.599 E.00432
G1 X130.709 Y117.151 E.13247
G1 X130.842 Y117.115 E.00433
G1 X131.007 Y116.988 E.00651
G1 X131.244 Y117.02 E.00749
M106 S201.45
M204 S10000
G1 X126.345 Y115.96 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.496165
G1 F7246
M204 S6000
G1 X126.45 Y115.989 E.00403
; LINE_WIDTH: 0.526175
G1 X126.556 Y116.018 E.0043
; LINE_WIDTH: 0.565107
G1 F6894.087
G1 X126.617 Y116.05 E.00293
; LINE_WIDTH: 0.61296
G1 F6315.347
G1 X126.678 Y116.082 E.0032
; LINE_WIDTH: 0.684847
G1 F5608.116
G1 X126.739 Y116.114 E.00361
G1 X130.621 Y116.625 E.20481
; LINE_WIDTH: 0.66547
G1 F5782.668
G1 X130.693 Y116.614 E.0037
; LINE_WIDTH: 0.62481
G1 F6186.737
G1 X130.765 Y116.603 E.00345
; LINE_WIDTH: 0.58415
G1 F6651.517
G1 X130.837 Y116.593 E.00321
; LINE_WIDTH: 0.54349
G1 F7191.802
G1 X130.909 Y116.582 E.00297
; LINE_WIDTH: 0.50283
G1 F7246
G1 X130.981 Y116.571 E.00273
; CHANGE_LAYER
; Z_HEIGHT: 11.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F7827.619
G1 X130.909 Y116.582 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 58/73
; update layer progress
M73 L58
M991 S0 P57 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z11.8 I-1.213 J-.097 P1  F42000
G1 X129.971 Y128.296 Z11.8
G1 Z11.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5095
M204 S5000
G1 X124.499 Y129.016 E.16961
G1 X124.339 Y127.807 E.03749
G1 X126.784 Y127.485 E.07577
G1 X129.812 Y127.086 E.09385
G1 X129.964 Y128.236 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.984 Y128.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.59 Y136.023 Z12 F42000
G1 X125.906 Y139.704 Z12
G1 Z11.6
G1 E.8 F1800
G1 F5095
M204 S5000
G1 X128.35 Y139.382 E.07577
G1 X131.378 Y138.984 E.09385
G1 X131.538 Y140.193 E.03749
G1 X126.065 Y140.914 E.16961
G1 X125.914 Y139.764 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.89 Y139.454 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.519 Y131.848 Z12 F42000
G1 X128.744 Y129.126 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5095
M204 S6000
G1 X129.133 Y129.075 E.01301
G1 X130.367 Y138.448 E.31361
G1 X126.744 Y138.925 E.12121
G1 X125.51 Y129.552 E.31361
G1 X126.397 Y129.435 E.02969
G1 X128.685 Y129.134 E.07653
M204 S250
G1 X128.795 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5095
M204 S5000
G1 X129.927 Y138.111 E.2664
G1 X127.082 Y138.485 E.08819
G1 X125.95 Y129.889 E.26641
G1 X126.449 Y129.824 E.01545
G1 X128.736 Y129.523 E.07089
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.011 Y131.504 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.158 Y129.994 Z12 F42000
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5095
M204 S6000
G1 X126.323 Y138.843 E.29609
G1 X125.771 Y138.916 E.01847
G1 X124.572 Y129.813 E.30457
G1 X125.124 Y129.74 E.01847
G1 X125.15 Y129.934 E.0065
; WIPE_START
G1 F8843.478
G1 X125.411 Y131.917 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.328 Y137.755 Z12 F42000
G1 X130.753 Y138.26 Z12
G1 Z11.6
G1 E.8 F1800
G1 F5095
M204 S6000
G1 X129.554 Y129.157 E.30457
G1 X130.106 Y129.084 E.01847
G1 X131.305 Y138.187 E.30457
G1 X130.812 Y138.252 E.01648
; WIPE_START
G1 F8843.478
G1 X130.538 Y136.271 E-.76
; WIPE_END
M73 P84 R3
G1 E-.04 F1800
M204 S10000
G1 X125.855 Y139.315 Z12 F42000
G1 Z11.6
G1 E.8 F1800
G1 F5095
M204 S6000
G1 X125.42 Y139.373 E.01453
G1 X124.116 Y129.462 E.33158
G1 X130.457 Y128.627 E.21216
G1 X131.761 Y138.538 E.33158
G1 X125.914 Y139.308 E.19564
; WIPE_START
G1 F8843.478
G1 X125.42 Y139.373 E-.18923
G1 X125.224 Y137.883 E-.57077
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.22 Y130.863 Z12 F42000
G1 X130.197 Y126.23 Z12
G1 Z11.6
G1 E.8 F1800
G1 F5095
M204 S6000
G1 X124.467 Y126.984 E.19169
G1 X125.981 Y115.486 E.38471
G1 X131.515 Y116.213 E.18516
G1 X130.205 Y126.17 E.33316
; WIPE_START
G1 F8843.478
G1 X128.224 Y126.451 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.458 Y127.362 Z12 F42000
G1 Z11.6
G1 E.8 F1800
G1 F5095
M204 S6000
G1 X130.244 Y127.362 E.0071
G1 X130.15 Y126.646 E.02395
G1 X124.021 Y127.453 E.20504
G3 X124.083 Y126.783 I7.706 J.374 E.02234
G1 X125.631 Y115.029 E.39327
G1 X131.972 Y115.862 E.21216
G1 X130.466 Y127.303 E.38279
; WIPE_START
G1 F8843.478
G1 X130.244 Y127.362 E-.08734
G1 X130.15 Y126.646 E-.27441
G1 X129.111 Y126.783 E-.39825
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.911 Y134.2 Z12 F42000
G1 X132.386 Y140.28 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5095
M204 S5000
G3 X132.228 Y140.5 I-.19 J.03 E.00923
G1 X125.49 Y141.387 E.20884
G3 X125.267 Y141.215 I-.029 J-.193 E.00966
G1 X123.694 Y129.264 E.37039
G3 X123.694 Y126.736 I10.793 J-1.264 E.07785
G1 X125.267 Y114.785 E.37038
G3 X125.46 Y114.611 I.195 J.022 E.00873
G1 X132.23 Y115.501 E.20982
G3 X132.386 Y115.723 I-.036 J.191 E.00922
G1 X130.812 Y127.68 E.37058
G2 X130.812 Y128.322 I3.511 J.32 E.01976
G1 X132.378 Y140.221 E.36876
; WIPE_START
G1 F9547.055
M204 S6000
G1 X132.383 Y140.355 E-.05109
G1 X132.358 Y140.414 E-.02456
G1 X132.294 Y140.476 E-.03381
G1 X132.228 Y140.5 E-.02664
G1 X130.6 Y140.714 E-.6239
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z12
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z12 F4000
            G39.3 S1
            G0 Z12 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X131.975 Y140.335 F42000
G1 Z11.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.480854
G1 F5095
M204 S6000
G1 X131.764 Y138.735 E.0576
; WIPE_START
G1 F8220.424
G1 X131.975 Y140.335 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.002 Y138.022 Z12 F42000
G1 Z11.6
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F5095
M204 S6000
G1 X129.857 Y129.322 E.10701
; WIPE_START
G1 F15000
G1 X130.118 Y131.305 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.875 Y129.978 Z12 F42000
G1 Z11.6
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F5095
M204 S6000
G1 X126.02 Y138.678 E.10701
; WIPE_START
G1 F15000
G1 X125.759 Y136.695 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.469 Y139.564 Z12 F42000
G1 Z11.6
G1 E.8 F1800
; LINE_WIDTH: 0.480841
G1 F5095
M204 S6000
G1 X125.679 Y141.165 E.05761
; WIPE_START
G1 F8220.674
G1 X125.469 Y139.564 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.472 Y131.997 Z12 F42000
G1 X124.113 Y129.265 Z12
G1 Z11.6
G1 E.8 F1800
; LINE_WIDTH: 0.466953
G1 F5095
M204 S6000
G3 X124.017 Y128.404 I18.601 J-2.499 E.02993
; LINE_WIDTH: 0.42332
G1 X123.986 Y128 E.01256
; LINE_WIDTH: 0.387806
G1 X123.968 Y127.658 E.00962
; WIPE_START
G1 F10438.245
G1 X123.986 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12 I.935 J.779 P1  F42000
G1 X126.675 Y124.777 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F5095
M204 S6000
G1 X128.503 Y124.536 E.05666
G1 X129.383 Y117.849 E.20723
G1 X127.617 Y117.617 E.05473
G1 X126.683 Y124.717 E.22004
M204 S10000
G1 X127.113 Y124.339 F42000
G1 F5095
M204 S6000
G1 X128.167 Y124.2 E.03267
G1 X128.96 Y118.174 E.18675
G1 X127.942 Y118.04 E.03155
G1 X127.121 Y124.279 E.19335
M204 S10000
G1 X127.52 Y123.931 F42000
; LINE_WIDTH: 0.36784
G1 F5095
M204 S6000
G1 X127.854 Y123.887 E.00891
G1 X128.566 Y118.476 E.1445
G1 X128.244 Y118.434 E.0086
G1 X127.528 Y123.871 E.14521
M204 S10000
G1 X128.839 Y124.872 F42000
; LINE_WIDTH: 0.41999
G1 F5095
M204 S6000
G1 X129.806 Y117.524 E.22771
G1 X127.293 Y117.194 E.0779
G1 X126.237 Y125.215 E.24856
G1 X128.779 Y124.88 E.0788
M204 S10000
G1 X129.175 Y125.208 F42000
G1 F5095
M204 S6000
G1 X130.229 Y117.2 E.24819
G1 X126.968 Y116.771 E.10107
G1 X125.799 Y125.653 E.27524
G1 X129.116 Y125.216 E.10279
M204 S10000
G1 X129.511 Y125.544 F42000
G1 F5095
M204 S6000
G1 X130.652 Y116.875 E.26867
G1 X126.643 Y116.348 E.12424
M73 P84 R2
G1 X125.361 Y126.091 E.30193
G1 X129.452 Y125.552 E.12678
M204 S10000
G1 X129.847 Y125.88 F42000
G1 F5095
M204 S6000
G1 X131.076 Y116.55 E.28915
G1 X126.319 Y115.925 E.14741
G1 X124.923 Y126.529 E.32861
G1 X129.788 Y125.888 E.15077
; CHANGE_LAYER
; Z_HEIGHT: 11.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X127.805 Y126.149 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 59/73
; update layer progress
M73 L59
M991 S0 P58 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z12 I-.857 J.864 P1  F42000
G1 X129.971 Y128.296 Z12
G1 Z11.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5085
M204 S5000
G1 X124.499 Y129.016 E.16961
G1 X124.339 Y127.807 E.03749
G1 X126.59 Y127.511 E.06974
G1 X129.812 Y127.086 E.09988
G1 X129.964 Y128.236 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.984 Y128.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.59 Y136.023 Z12.2 F42000
G1 X125.906 Y139.704 Z12.2
G1 Z11.8
G1 E.8 F1800
G1 F5085
M204 S5000
G1 X128.156 Y139.408 E.06974
G1 X131.378 Y138.984 E.09988
G1 X131.538 Y140.193 E.03749
G1 X126.065 Y140.914 E.16961
G1 X125.914 Y139.764 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.889 Y139.45 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.519 Y131.844 Z12.2 F42000
G1 X128.744 Y129.126 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5085
M204 S6000
G1 X129.133 Y129.075 E.01301
G1 X130.367 Y138.448 E.31361
G1 X126.744 Y138.925 E.12121
G1 X125.51 Y129.552 E.31361
G1 X126.345 Y129.442 E.02792
G1 X128.685 Y129.134 E.0783
M204 S250
G1 X128.795 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5085
M204 S5000
G1 X129.927 Y138.111 E.2664
G1 X127.082 Y138.485 E.08819
G1 X125.95 Y129.889 E.26641
G1 X126.396 Y129.831 E.01382
G1 X128.736 Y129.523 E.07253
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.011 Y131.504 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.158 Y129.994 Z12.2 F42000
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5085
M204 S6000
G1 X126.323 Y138.843 E.29609
G1 X125.771 Y138.916 E.01847
G1 X124.572 Y129.813 E.30457
G1 X125.124 Y129.74 E.01847
G1 X125.15 Y129.934 E.0065
; WIPE_START
G1 F8843.478
G1 X125.411 Y131.917 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.328 Y137.755 Z12.2 F42000
G1 X130.753 Y138.26 Z12.2
G1 Z11.8
G1 E.8 F1800
G1 F5085
M204 S6000
G1 X129.554 Y129.157 E.30457
G1 X130.106 Y129.084 E.01847
G1 X131.305 Y138.187 E.30457
G1 X130.812 Y138.252 E.01648
; WIPE_START
G1 F8843.478
G1 X130.538 Y136.271 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.855 Y139.315 Z12.2 F42000
G1 Z11.8
G1 E.8 F1800
G1 F5085
M204 S6000
G1 X125.42 Y139.373 E.01453
G1 X124.116 Y129.462 E.33158
G1 X130.457 Y128.627 E.21216
G1 X131.761 Y138.538 E.33158
G1 X125.914 Y139.308 E.19564
; WIPE_START
G1 F8843.478
G1 X125.42 Y139.373 E-.18923
G1 X125.224 Y137.883 E-.57077
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.22 Y130.863 Z12.2 F42000
G1 X130.197 Y126.23 Z12.2
G1 Z11.8
G1 E.8 F1800
G1 F5085
M204 S6000
G1 X124.467 Y126.984 E.19169
G1 X125.981 Y115.486 E.38471
G1 X131.515 Y116.213 E.18516
G1 X130.205 Y126.17 E.33316
; WIPE_START
G1 F8843.478
G1 X128.224 Y126.451 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.458 Y127.362 Z12.2 F42000
G1 Z11.8
G1 E.8 F1800
G1 F5085
M204 S6000
G1 X130.244 Y127.362 E.0071
G1 X130.15 Y126.646 E.02395
G1 X124.021 Y127.453 E.20504
G3 X124.083 Y126.783 I7.706 J.374 E.02234
M73 P85 R2
G1 X125.631 Y115.029 E.39327
G1 X131.972 Y115.862 E.21216
G1 X130.466 Y127.303 E.38278
; WIPE_START
G1 F8843.478
G1 X130.244 Y127.362 E-.08734
G1 X130.15 Y126.646 E-.27437
G1 X129.111 Y126.783 E-.3983
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.911 Y134.2 Z12.2 F42000
G1 X132.386 Y140.28 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5085
M204 S5000
G3 X132.228 Y140.5 I-.19 J.03 E.00923
G1 X125.489 Y141.387 E.20885
G3 X125.267 Y141.215 I-.028 J-.193 E.00965
G1 X123.694 Y129.264 E.37039
G3 X123.694 Y126.736 I9.872 J-1.264 E.07789
G1 X125.267 Y114.785 E.37038
G3 X125.461 Y114.611 I.197 J.024 E.00872
G1 X132.233 Y115.501 E.20989
G1 X132.249 Y115.505 E.00049
G3 X132.386 Y115.722 I-.053 J.186 E.00867
G1 X130.812 Y127.68 E.37059
G2 X130.812 Y128.322 I3.322 J.32 E.01976
G1 X132.378 Y140.221 E.36876
; WIPE_START
G1 F9547.055
M204 S6000
G1 X132.383 Y140.355 E-.05101
G1 X132.344 Y140.433 E-.03332
G1 X132.294 Y140.476 E-.02536
G1 X132.228 Y140.5 E-.02642
G1 X130.6 Y140.714 E-.6239
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z12.2
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z12.2 F4000
            G39.3 S1
            G0 Z12.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X131.975 Y140.335 F42000
G1 Z11.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.480851
G1 F5085
M204 S6000
G1 X131.764 Y138.735 E.05759
; WIPE_START
G1 F8220.475
G1 X131.975 Y140.335 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.002 Y138.022 Z12.2 F42000
G1 Z11.8
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F5085
M204 S6000
G1 X129.857 Y129.322 E.10701
; WIPE_START
G1 F15000
G1 X130.118 Y131.305 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.875 Y129.978 Z12.2 F42000
G1 Z11.8
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F5085
M204 S6000
G1 X126.02 Y138.678 E.10701
; WIPE_START
G1 F15000
G1 X125.759 Y136.695 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.469 Y139.564 Z12.2 F42000
G1 Z11.8
G1 E.8 F1800
; LINE_WIDTH: 0.480843
G1 F5085
M204 S6000
G1 X125.679 Y141.165 E.05761
; WIPE_START
G1 F8220.638
G1 X125.469 Y139.564 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.472 Y131.997 Z12.2 F42000
G1 X124.113 Y129.265 Z12.2
G1 Z11.8
G1 E.8 F1800
; LINE_WIDTH: 0.466956
G1 F5085
M204 S6000
G3 X124.017 Y128.404 I18.626 J-2.501 E.02993
; LINE_WIDTH: 0.42333
G1 X123.986 Y128 E.01256
; LINE_WIDTH: 0.387806
G1 X123.968 Y127.658 E.00962
; WIPE_START
G1 F10438.245
G1 X123.986 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.675 Y124.777 Z12.2 F42000
G1 Z11.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F5085
M204 S6000
G1 X128.503 Y124.536 E.05666
G1 X129.383 Y117.849 E.20723
G1 X127.617 Y117.617 E.05473
G1 X126.683 Y124.717 E.22004
M204 S10000
G1 X127.113 Y124.339 F42000
G1 F5085
M204 S6000
G1 X128.167 Y124.2 E.03267
G1 X128.96 Y118.174 E.18675
G1 X127.942 Y118.04 E.03155
G1 X127.121 Y124.279 E.19336
M204 S10000
G1 X127.52 Y123.931 F42000
; LINE_WIDTH: 0.36785
G1 F5085
M204 S6000
G1 X127.854 Y123.887 E.00891
G1 X128.566 Y118.476 E.1445
G1 X128.244 Y118.434 E.0086
G1 X127.528 Y123.871 E.14522
M204 S10000
G1 X128.839 Y124.872 F42000
; LINE_WIDTH: 0.41999
G1 F5085
M204 S6000
G1 X129.806 Y117.524 E.22771
G1 X127.293 Y117.194 E.0779
G1 X126.237 Y125.215 E.24856
G1 X128.779 Y124.88 E.0788
M204 S10000
G1 X129.175 Y125.208 F42000
G1 F5085
M204 S6000
G1 X130.229 Y117.2 E.24819
G1 X126.968 Y116.771 E.10107
G1 X125.799 Y125.653 E.27525
G1 X129.116 Y125.216 E.10279
M204 S10000
G1 X129.511 Y125.544 F42000
G1 F5085
M204 S6000
G1 X130.652 Y116.875 E.26867
G1 X126.643 Y116.348 E.12424
G1 X125.361 Y126.091 E.30193
G1 X129.452 Y125.552 E.12678
M204 S10000
G1 X129.847 Y125.88 F42000
G1 F5085
M204 S6000
G1 X131.076 Y116.55 E.28915
G1 X126.319 Y115.925 E.14741
G1 X124.923 Y126.529 E.32861
G1 X129.788 Y125.888 E.15077
; CHANGE_LAYER
; Z_HEIGHT: 12
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X127.805 Y126.149 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 60/73
; update layer progress
M73 L60
M991 S0 P59 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z12.2 I-.857 J.864 P1  F42000
G1 X129.971 Y128.296 Z12.2
G1 Z12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5085
M204 S5000
G1 X124.499 Y129.016 E.16961
G1 X124.339 Y127.807 E.03749
G1 X126.395 Y127.536 E.06371
G1 X129.812 Y127.086 E.1059
G1 X129.964 Y128.236 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.984 Y128.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.59 Y136.023 Z12.4 F42000
G1 X125.906 Y139.704 Z12.4
G1 Z12
G1 E.8 F1800
G1 F5085
M204 S5000
G1 X127.961 Y139.433 E.06371
G1 X131.378 Y138.984 E.1059
G1 X131.538 Y140.193 E.03749
G1 X126.065 Y140.914 E.16961
G1 X125.914 Y139.764 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.888 Y139.445 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.519 Y131.839 Z12.4 F42000
G1 X128.744 Y129.126 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5085
M204 S6000
G1 X129.133 Y129.075 E.01301
G1 X130.367 Y138.448 E.31361
G1 X126.744 Y138.925 E.12121
G1 X125.51 Y129.552 E.31361
G1 X126.292 Y129.449 E.02615
G1 X128.685 Y129.134 E.08006
M204 S250
G1 X128.795 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5085
M204 S5000
G1 X129.927 Y138.111 E.26641
G1 X127.082 Y138.485 E.08819
G1 X125.95 Y129.889 E.2664
G1 X126.343 Y129.838 E.01218
G1 X128.736 Y129.523 E.07416
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.011 Y131.504 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.158 Y129.994 Z12.4 F42000
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5085
M204 S6000
G1 X126.323 Y138.843 E.29609
G1 X125.771 Y138.916 E.01847
G1 X124.572 Y129.813 E.30457
G1 X125.124 Y129.74 E.01847
G1 X125.15 Y129.934 E.0065
; WIPE_START
G1 F8843.478
G1 X125.411 Y131.917 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.328 Y137.755 Z12.4 F42000
G1 X130.753 Y138.26 Z12.4
G1 Z12
G1 E.8 F1800
G1 F5085
M204 S6000
G1 X129.554 Y129.157 E.30457
G1 X130.106 Y129.084 E.01847
G1 X131.305 Y138.187 E.30457
G1 X130.812 Y138.252 E.01648
; WIPE_START
G1 F8843.478
G1 X130.538 Y136.271 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.855 Y139.315 Z12.4 F42000
G1 Z12
G1 E.8 F1800
G1 F5085
M204 S6000
G1 X125.42 Y139.373 E.01453
G1 X124.116 Y129.462 E.33158
G1 X130.457 Y128.627 E.21216
G1 X131.761 Y138.538 E.33158
G1 X125.914 Y139.308 E.19564
; WIPE_START
G1 F8843.478
G1 X125.42 Y139.373 E-.18922
G1 X125.224 Y137.883 E-.57078
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.22 Y130.863 Z12.4 F42000
G1 X130.197 Y126.23 Z12.4
G1 Z12
G1 E.8 F1800
G1 F5085
M204 S6000
G1 X124.467 Y126.984 E.19169
G1 X125.981 Y115.486 E.38471
G1 X131.515 Y116.213 E.18516
G1 X130.205 Y126.17 E.33316
; WIPE_START
G1 F8843.478
G1 X128.224 Y126.451 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.458 Y127.362 Z12.4 F42000
G1 Z12
G1 E.8 F1800
G1 F5085
M204 S6000
G1 X130.244 Y127.362 E.0071
G1 X130.15 Y126.646 E.02395
G1 X124.021 Y127.453 E.20504
G3 X124.083 Y126.783 I7.698 J.373 E.02234
G1 X125.631 Y115.029 E.39327
G1 X131.972 Y115.862 E.21216
G1 X130.466 Y127.303 E.38278
; WIPE_START
G1 F8843.478
G1 X130.244 Y127.362 E-.08734
G1 X130.15 Y126.646 E-.27437
G1 X129.111 Y126.783 E-.39829
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.911 Y134.2 Z12.4 F42000
G1 X132.386 Y140.28 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5085
M204 S5000
G3 X132.228 Y140.5 I-.19 J.03 E.00923
G1 X125.49 Y141.387 E.20884
G3 X125.267 Y141.215 I-.028 J-.193 E.00966
G1 X123.694 Y129.264 E.37039
G3 X123.694 Y126.736 I9.873 J-1.264 E.07789
M73 P86 R2
G1 X125.267 Y114.785 E.37038
G3 X125.461 Y114.611 I.197 J.024 E.00872
G1 X132.23 Y115.501 E.2098
G3 X132.386 Y115.723 I-.036 J.191 E.00922
G1 X130.812 Y127.68 E.37058
G2 X130.812 Y128.322 I3.482 J.32 E.01976
G1 X132.378 Y140.221 E.36876
; WIPE_START
G1 F9547.055
M204 S6000
G1 X132.386 Y140.341 E-.04571
G1 X132.358 Y140.415 E-.02998
G1 X132.294 Y140.476 E-.03385
G1 X132.228 Y140.5 E-.02661
G1 X130.6 Y140.714 E-.62385
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z12.4
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z12.4 F4000
            G39.3 S1
            G0 Z12.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X131.975 Y140.335 F42000
G1 Z12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.48085
G1 F5085
M204 S6000
G1 X131.764 Y138.735 E.05759
; WIPE_START
G1 F8220.499
G1 X131.975 Y140.335 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.002 Y138.022 Z12.4 F42000
G1 Z12
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F5085
M204 S6000
G1 X129.857 Y129.322 E.10701
; WIPE_START
G1 F15000
G1 X130.118 Y131.305 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.875 Y129.978 Z12.4 F42000
G1 Z12
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F5085
M204 S6000
G1 X126.02 Y138.678 E.10701
; WIPE_START
G1 F15000
G1 X125.759 Y136.695 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.469 Y139.564 Z12.4 F42000
G1 Z12
G1 E.8 F1800
; LINE_WIDTH: 0.480854
G1 F5085
M204 S6000
G1 X125.679 Y141.165 E.05761
; WIPE_START
G1 F8220.42
G1 X125.469 Y139.564 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.472 Y131.997 Z12.4 F42000
G1 X124.113 Y129.265 Z12.4
G1 Z12
G1 E.8 F1800
; LINE_WIDTH: 0.466975
G1 F5085
M204 S6000
G3 X124.017 Y128.404 I18.612 J-2.5 E.02993
; LINE_WIDTH: 0.423331
G1 X123.986 Y128 E.01256
; LINE_WIDTH: 0.38781
G1 X123.968 Y127.658 E.00962
; WIPE_START
G1 F10438.136
G1 X123.986 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.675 Y124.777 Z12.4 F42000
G1 Z12
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F5085
M204 S6000
G1 X128.503 Y124.536 E.05666
G1 X129.383 Y117.849 E.20723
G1 X127.617 Y117.617 E.05473
G1 X126.683 Y124.717 E.22004
M204 S10000
G1 X127.113 Y124.339 F42000
G1 F5085
M204 S6000
G1 X128.167 Y124.2 E.03267
G1 X128.96 Y118.174 E.18675
G1 X127.942 Y118.04 E.03155
G1 X127.121 Y124.279 E.19336
M204 S10000
G1 X127.52 Y123.931 F42000
; LINE_WIDTH: 0.36784
G1 F5085
M204 S6000
G1 X127.854 Y123.887 E.00891
G1 X128.566 Y118.476 E.1445
G1 X128.244 Y118.434 E.0086
G1 X127.528 Y123.871 E.14521
M204 S10000
G1 X128.839 Y124.872 F42000
; LINE_WIDTH: 0.41999
G1 F5085
M204 S6000
G1 X129.806 Y117.524 E.22771
G1 X127.293 Y117.194 E.0779
G1 X126.237 Y125.215 E.24856
G1 X128.779 Y124.88 E.0788
M204 S10000
G1 X129.175 Y125.208 F42000
G1 F5085
M204 S6000
G1 X130.229 Y117.2 E.24819
G1 X126.968 Y116.771 E.10107
G1 X125.799 Y125.653 E.27525
G1 X129.116 Y125.216 E.10279
M204 S10000
G1 X129.511 Y125.544 F42000
G1 F5085
M204 S6000
G1 X130.652 Y116.875 E.26867
G1 X126.643 Y116.348 E.12424
G1 X125.361 Y126.091 E.30193
G1 X129.452 Y125.552 E.12678
M204 S10000
G1 X129.847 Y125.88 F42000
G1 F5085
M204 S6000
G1 X131.076 Y116.55 E.28915
G1 X126.319 Y115.925 E.14741
G1 X124.923 Y126.529 E.32861
G1 X129.788 Y125.888 E.15077
; CHANGE_LAYER
; Z_HEIGHT: 12.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X127.805 Y126.149 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 61/73
; update layer progress
M73 L61
M991 S0 P60 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z12.4 I-.857 J.864 P1  F42000
G1 X129.971 Y128.296 Z12.4
G1 Z12.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4507
M204 S5000
G1 X124.499 Y129.016 E.16961
G1 X124.339 Y127.807 E.03749
G1 X126.201 Y127.562 E.05768
G1 X129.812 Y127.086 E.11193
G1 X129.964 Y128.236 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.984 Y128.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.59 Y136.023 Z12.6 F42000
G1 X125.906 Y139.704 Z12.6
G1 Z12.2
G1 E.8 F1800
G1 F4507
M204 S5000
G1 X127.767 Y139.459 E.05768
G1 X131.378 Y138.984 E.11193
G1 X131.538 Y140.193 E.03749
G1 X126.065 Y140.914 E.16961
G1 X125.914 Y139.764 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.767 Y139.459 E-.71373
G1 X127.888 Y139.443 E-.04627
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.519 Y131.837 Z12.6 F42000
G1 X128.744 Y129.126 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4507
M204 S6000
G1 X129.133 Y129.075 E.01301
G1 X130.367 Y138.448 E.31361
G1 X126.744 Y138.925 E.12121
G1 X125.51 Y129.552 E.31361
G1 X126.239 Y129.456 E.02439
G1 X128.685 Y129.134 E.08183
M204 S250
G1 X128.795 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4507
M204 S5000
G1 X129.927 Y138.111 E.2664
G1 X127.082 Y138.485 E.08819
G1 X125.95 Y129.889 E.26641
G1 X126.29 Y129.845 E.01054
G1 X128.736 Y129.523 E.0758
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.011 Y131.504 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.158 Y129.994 Z12.6 F42000
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4507
M204 S6000
G1 X126.323 Y138.843 E.29609
G1 X125.771 Y138.916 E.01847
G1 X124.572 Y129.813 E.30458
G1 X125.124 Y129.74 E.01847
G1 X125.15 Y129.934 E.0065
; WIPE_START
G1 F8843.478
G1 X125.411 Y131.917 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.328 Y137.755 Z12.6 F42000
G1 X130.753 Y138.26 Z12.6
G1 Z12.2
G1 E.8 F1800
G1 F4507
M204 S6000
G1 X129.554 Y129.157 E.30457
G1 X130.106 Y129.084 E.01847
G1 X131.305 Y138.187 E.30457
G1 X130.812 Y138.252 E.01648
; WIPE_START
G1 F8843.478
G1 X130.538 Y136.271 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.855 Y139.315 Z12.6 F42000
G1 Z12.2
G1 E.8 F1800
G1 F4507
M204 S6000
G1 X125.42 Y139.373 E.01453
G1 X124.116 Y129.462 E.33158
G1 X130.457 Y128.627 E.21216
G1 X131.761 Y138.538 E.33158
G1 X125.914 Y139.308 E.19564
; WIPE_START
G1 F8843.478
G1 X125.42 Y139.373 E-.18923
G1 X125.224 Y137.883 E-.57077
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.22 Y130.863 Z12.6 F42000
G1 X130.197 Y126.23 Z12.6
G1 Z12.2
G1 E.8 F1800
G1 F4507
M204 S6000
G1 X124.467 Y126.984 E.19169
G1 X125.981 Y115.485 E.38472
G1 X131.515 Y116.213 E.18516
G1 X130.205 Y126.17 E.33316
; WIPE_START
G1 F8843.478
G1 X128.224 Y126.451 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.458 Y127.362 Z12.6 F42000
G1 Z12.2
G1 E.8 F1800
G1 F4507
M204 S6000
G1 X130.244 Y127.362 E.0071
G1 X130.15 Y126.646 E.02395
G1 X124.021 Y127.453 E.20504
G3 X124.083 Y126.783 I7.706 J.374 E.02234
G1 X125.631 Y115.029 E.39327
G1 X131.972 Y115.862 E.21216
G1 X130.466 Y127.303 E.38279
; WIPE_START
G1 F8843.478
G1 X130.244 Y127.362 E-.08734
G1 X130.15 Y126.646 E-.27441
G1 X129.111 Y126.783 E-.39825
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.911 Y134.2 Z12.6 F42000
G1 X132.386 Y140.28 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4507
M204 S5000
G3 X132.228 Y140.5 I-.19 J.03 E.00923
G1 X125.489 Y141.387 E.20885
G3 X125.267 Y141.215 I-.03 J-.191 E.00968
G1 X123.694 Y129.264 E.37039
G3 X123.694 Y126.736 I11.109 J-1.264 E.07784
G1 X125.267 Y114.785 E.37038
G3 X125.461 Y114.611 I.201 J.028 E.00869
G1 X132.23 Y115.501 E.20979
G3 X132.386 Y115.723 I-.038 J.192 E.00919
G1 X130.812 Y127.68 E.37059
G2 X130.812 Y128.322 I3.468 J.32 E.01976
G1 X132.378 Y140.221 E.36876
; WIPE_START
G1 F9547.055
M204 S6000
G1 X132.384 Y140.353 E-.05039
M73 P87 R2
G1 X132.359 Y140.413 E-.02456
G1 X132.294 Y140.476 E-.0346
G1 X132.228 Y140.5 E-.02657
G1 X130.6 Y140.714 E-.62388
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z12.6
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z12.6 F4000
            G39.3 S1
            G0 Z12.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X131.975 Y140.335 F42000
G1 Z12.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.480843
G1 F4507
M204 S6000
G1 X131.764 Y138.735 E.05759
; WIPE_START
G1 F8220.634
G1 X131.975 Y140.335 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.002 Y138.022 Z12.6 F42000
G1 Z12.2
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4507
M204 S6000
G1 X129.857 Y129.322 E.10701
; WIPE_START
G1 F15000
G1 X130.118 Y131.305 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.968 Y127.658 Z12.6 F42000
G1 Z12.2
G1 E.8 F1800
; LINE_WIDTH: 0.387655
G1 F4507
M204 S6000
G1 X123.986 Y127.998 E.00957
; LINE_WIDTH: 0.42529
G1 X124.024 Y128.468 E.01468
; LINE_WIDTH: 0.468515
G2 X124.113 Y129.265 I17.324 J-1.535 E.02782
; WIPE_START
G1 F8458.756
G1 X124.024 Y128.468 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.875 Y129.978 Z12.6 F42000
G1 Z12.2
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4507
M204 S6000
G1 X126.02 Y138.678 E.10701
; WIPE_START
G1 F15000
G1 X125.759 Y136.695 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.469 Y139.564 Z12.6 F42000
G1 Z12.2
G1 E.8 F1800
; LINE_WIDTH: 0.480845
G1 F4507
M204 S6000
G1 X125.679 Y141.165 E.05761
; WIPE_START
G1 F8220.593
G1 X125.469 Y139.564 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.504 Y132.002 Z12.6 F42000
G1 X128.475 Y117.606 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4507
M204 S6000
G1 X129.791 Y117.779 E.04402
G1 X129.974 Y118.018 E.00999
G1 X130.621 Y118.121 E.02171
G1 X130.892 Y118.283 E.01047
G1 X130.563 Y120.776 E.08341
G2 X129.523 Y121.662 I.754 J1.94 E.04618
G1 X129.259 Y123.663 E.06697
G3 X130.231 Y123.3 I.778 J.6 E.03625
G1 X130.019 Y124.915 E.05401
M204 S10000
G1 X127.56 Y124.875 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42656
G1 F4507
M204 S6000
G1 X128.309 Y119.184 E.17944
M204 S10000
G1 X127.887 Y125.302 F42000
; LINE_WIDTH: 0.41999
G1 F4507
M204 S6000
G1 X128.744 Y118.797 E.20159
G1 X127.99 Y118.698 E.02337
G1 X127.133 Y125.203 E.20159
G1 X127.828 Y125.294 E.02153
M204 S10000
G1 X128.175 Y125.72 F42000
G1 F4507
M204 S6000
G1 X128.218 Y125.682 E.00177
G1 X129.167 Y118.473 E.22342
G1 X127.665 Y118.275 E.04655
G1 X126.71 Y125.527 E.22476
G1 X128.115 Y125.712 E.04354
M204 S10000
G1 X128.175 Y126.1 F42000
G1 F4507
M204 S6000
G1 X128.55 Y126.051 E.01162
G1 X129.588 Y118.159 E.24457
G1 X127.352 Y117.853 E.06937
G1 X126.289 Y125.841 E.24758
G1 X128.115 Y126.093 E.05665
M204 S10000
G1 X126.168 Y126.409 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4507
M204 S6000
G1 X124.872 Y126.579 E.04338
G1 X124.914 Y126.261 E.01064
G3 X125.885 Y125.902 I.934 J1.033 E.03519
G1 X126.15 Y123.892 E.06728
G1 X126.035 Y123.754 E.00595
G1 X125.297 Y123.349 E.0279
G1 X125.646 Y120.699 E.08867
G3 X126.548 Y120.868 I.309 J.842 E.03194
G1 X126.749 Y119.342 E.05104
G1 X125.941 Y118.457 E.03974
G1 X126.281 Y115.876 E.08635
G1 X126.868 Y115.953 E.01964
G2 X128.655 Y117.018 I1.959 J-1.254 E.07155
G2 X129.612 Y116.314 I-.344 J-1.47 E.04052
G1 X131.125 Y116.513 E.0506
G1 X131.111 Y116.615 E.00341
; CHANGE_LAYER
; Z_HEIGHT: 12.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X131.125 Y116.513 E-.03908
G1 X129.612 Y116.314 E-.57968
G1 X129.373 Y116.599 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 62/73
; update layer progress
M73 L62
M991 S0 P61 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z12.6 I-1.215 J.062 P1  F42000
G1 X129.971 Y128.296 Z12.6
G1 Z12.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3946
M204 S5000
G1 X124.499 Y129.016 E.16961
G1 X124.339 Y127.807 E.03749
G1 X126.006 Y127.587 E.05166
G1 X129.812 Y127.086 E.11796
G1 X129.964 Y128.236 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.984 Y128.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.59 Y136.023 Z12.8 F42000
G1 X125.906 Y139.704 Z12.8
G1 Z12.4
G1 E.8 F1800
G1 F3946
M204 S5000
G1 X127.572 Y139.485 E.05166
G1 X131.378 Y138.984 E.11796
G1 X131.538 Y140.193 E.03749
G1 X126.065 Y140.914 E.16961
G1 X125.914 Y139.764 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.572 Y139.485 E-.63924
G1 X127.888 Y139.443 E-.12076
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.519 Y131.837 Z12.8 F42000
G1 X128.744 Y129.126 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3946
M204 S6000
G1 X129.133 Y129.075 E.01301
G1 X130.367 Y138.448 E.31361
G1 X126.744 Y138.925 E.12121
G1 X125.51 Y129.552 E.31361
G1 X126.186 Y129.463 E.02262
G1 X128.685 Y129.134 E.08359
M204 S250
G1 X128.795 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3946
M204 S5000
G1 X129.927 Y138.111 E.2664
G1 X127.082 Y138.485 E.08819
G1 X125.95 Y129.889 E.26641
G1 X126.237 Y129.852 E.00891
G1 X128.736 Y129.523 E.07744
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.011 Y131.504 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.158 Y129.994 Z12.8 F42000
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3946
M204 S6000
G1 X126.323 Y138.843 E.29609
G1 X125.771 Y138.916 E.01847
G1 X124.572 Y129.813 E.30457
G1 X125.124 Y129.74 E.01847
G1 X125.15 Y129.934 E.0065
; WIPE_START
G1 F8843.478
G1 X125.411 Y131.917 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.328 Y137.755 Z12.8 F42000
G1 X130.753 Y138.26 Z12.8
G1 Z12.4
G1 E.8 F1800
G1 F3946
M204 S6000
G1 X129.554 Y129.157 E.30457
G1 X130.106 Y129.084 E.01847
G1 X131.305 Y138.187 E.30457
G1 X130.812 Y138.252 E.01648
; WIPE_START
G1 F8843.478
G1 X130.538 Y136.271 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.855 Y139.315 Z12.8 F42000
G1 Z12.4
G1 E.8 F1800
G1 F3946
M204 S6000
G1 X125.42 Y139.373 E.01453
G1 X124.116 Y129.462 E.33158
G1 X130.457 Y128.627 E.21216
G1 X131.761 Y138.538 E.33158
G1 X125.914 Y139.308 E.19564
; WIPE_START
G1 F8843.478
G1 X125.42 Y139.373 E-.18923
G1 X125.224 Y137.883 E-.57077
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.22 Y130.863 Z12.8 F42000
G1 X130.197 Y126.23 Z12.8
G1 Z12.4
G1 E.8 F1800
G1 F3946
M204 S6000
G1 X124.467 Y126.984 E.19169
G1 X125.981 Y115.485 E.38472
G1 X131.515 Y116.213 E.18516
G1 X130.205 Y126.17 E.33316
; WIPE_START
G1 F8843.478
G1 X128.224 Y126.451 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.458 Y127.362 Z12.8 F42000
G1 Z12.4
G1 E.8 F1800
G1 F3946
M204 S6000
G1 X130.244 Y127.362 E.0071
G1 X130.15 Y126.646 E.02395
G1 X124.021 Y127.453 E.20504
G3 X124.083 Y126.783 I7.706 J.374 E.02234
G1 X125.631 Y115.029 E.39327
G1 X131.972 Y115.862 E.21216
G1 X130.466 Y127.303 E.38278
; WIPE_START
G1 F8843.478
G1 X130.244 Y127.362 E-.08734
G1 X130.15 Y126.646 E-.27437
G1 X129.111 Y126.783 E-.39829
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.911 Y134.2 Z12.8 F42000
G1 X132.386 Y140.28 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3946
M204 S5000
G3 X132.228 Y140.5 I-.19 J.03 E.00922
G1 X125.49 Y141.387 E.20885
G3 X125.267 Y141.215 I-.029 J-.193 E.00966
G1 X123.694 Y129.264 E.37038
G3 X123.694 Y126.736 I10.793 J-1.264 E.07785
G1 X125.267 Y114.785 E.37038
G3 X125.461 Y114.611 I.2 J.028 E.0087
G1 X132.23 Y115.501 E.20978
G3 X132.386 Y115.723 I-.036 J.191 E.00922
G1 X130.812 Y127.68 E.37058
G2 X130.812 Y128.322 I3.454 J.32 E.01976
G1 X132.378 Y140.221 E.36876
; WIPE_START
G1 F9547.055
M204 S6000
G1 X132.384 Y140.353 E-.05043
G1 X132.359 Y140.413 E-.02461
G1 X132.294 Y140.476 E-.03464
G1 X132.228 Y140.5 E-.02638
G1 X130.6 Y140.714 E-.62393
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z12.8
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z12.8 F4000
            G39.3 S1
            G0 Z12.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X131.975 Y140.335 F42000
G1 Z12.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.48085
G1 F3946
M204 S6000
M73 P88 R2
G1 X131.764 Y138.735 E.05759
; WIPE_START
G1 F8220.493
G1 X131.975 Y140.335 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.002 Y138.022 Z12.8 F42000
G1 Z12.4
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F3946
M204 S6000
G1 X129.857 Y129.322 E.10701
; WIPE_START
G1 F15000
G1 X130.118 Y131.305 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.604 Y126.088 Z12.8 F42000
G1 Z12.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3946
M204 S6000
G1 X126.99 Y126.301 E.05401
G1 X126.69 Y125.773 E.02013
G1 X126.362 Y125.609 E.01215
G2 X124.908 Y126.302 I.37 J2.648 E.05426
G1 X125.308 Y123.266 E.10157
G1 X126.035 Y123.833 E.03056
G1 X126.69 Y124.986 E.04399
G1 X127.017 Y125.15 E.01215
G2 X128.655 Y124.305 I-.417 J-2.819 E.06225
G1 X129.31 Y123.152 E.04399
G3 X130.251 Y123.151 I.471 J.736 E.03294
G1 X130.572 Y120.714 E.08154
G1 X129.966 Y121.212 E.02604
G1 X129.31 Y122.366 E.04399
G1 X128.983 Y122.529 E.01215
G3 X127.345 Y121.685 I.417 J-2.819 E.06225
G1 X126.69 Y120.532 E.04399
G2 X125.664 Y120.563 I-.489 J.798 E.03603
G1 X125.934 Y118.509 E.06872
G1 X126.035 Y118.592 E.0043
G1 X126.69 Y119.745 E.04399
G1 X127.017 Y119.909 E.01215
G2 X128.655 Y119.064 I-.417 J-2.819 E.06225
G1 X129.31 Y117.911 E.04399
G1 X129.638 Y117.747 E.01215
G3 X130.892 Y118.276 I-.356 J2.597 E.04569
G1 X131.125 Y116.513 E.05901
G1 X129.76 Y116.333 E.04567
G1 X129.31 Y117.124 E.03018
G1 X128.983 Y117.288 E.01215
G3 X127.345 Y116.443 I.417 J-2.819 E.06225
G1 X127.082 Y115.981 E.01763
G1 X126.281 Y115.876 E.02681
G1 X126.174 Y116.689 E.02721
; WIPE_START
G1 F8843.478
G1 X126.281 Y115.876 E-.31167
G1 X127.082 Y115.981 E-.3071
G1 X127.266 Y116.305 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.137 Y123.634 Z12.8 F42000
G1 X123.968 Y127.658 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.387806
G1 F3946
M204 S6000
G1 X123.986 Y128 E.00962
; LINE_WIDTH: 0.423318
G1 X124.017 Y128.404 E.01256
; LINE_WIDTH: 0.466952
G2 X124.113 Y129.265 I18.706 J-1.639 E.02993
; WIPE_START
G1 F8489.931
G1 X124.017 Y128.404 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.875 Y129.978 Z12.8 F42000
G1 Z12.4
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F3946
M204 S6000
G1 X126.02 Y138.678 E.10701
; WIPE_START
G1 F15000
G1 X125.759 Y136.695 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.469 Y139.564 Z12.8 F42000
G1 Z12.4
G1 E.8 F1800
; LINE_WIDTH: 0.480857
G1 F3946
M204 S6000
G1 X125.679 Y141.165 E.05761
; CHANGE_LAYER
; Z_HEIGHT: 12.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F8220.374
G1 X125.469 Y139.564 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 63/73
; update layer progress
M73 L63
M991 S0 P62 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z12.8 I1.13 J.452 P1  F42000
G1 X129.971 Y128.296 Z12.8
G1 Z12.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4099
M204 S5000
G1 X124.499 Y129.016 E.16961
G1 X124.339 Y127.807 E.03749
G1 X125.812 Y127.613 E.04563
G1 X129.812 Y127.086 E.12398
G1 X129.964 Y128.236 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.984 Y128.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.795 Y129.515 Z13 F42000
G1 Z12.6
G1 E.8 F1800
G1 F4099
M204 S5000
G1 X129.927 Y138.111 E.2664
G1 X127.082 Y138.485 E.08819
G1 X125.95 Y129.889 E.2664
G1 X128.736 Y129.523 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.011 Y131.504 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.308 Y138.642 Z13 F42000
G1 X125.906 Y139.704 Z13
G1 Z12.6
G1 E.8 F1800
G1 F4099
M204 S5000
G1 X127.378 Y139.51 E.04563
G1 X131.378 Y138.984 E.12398
G1 X131.538 Y140.193 E.03749
G1 X126.065 Y140.914 E.16961
G1 X125.914 Y139.764 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.378 Y139.51 E-.56475
G1 X127.887 Y139.443 E-.19525
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.201 Y131.925 Z13 F42000
G1 X130.197 Y126.23 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4099
M204 S6000
G1 X124.467 Y126.984 E.19169
G1 X125.981 Y115.485 E.38472
G1 X131.515 Y116.213 E.18516
G1 X130.204 Y126.17 E.33316
; WIPE_START
G1 F8843.478
G1 X128.224 Y126.451 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.474 Y127.239 Z13 F42000
G1 Z12.6
G1 E.8 F1800
G1 F4099
M204 S6000
G1 X130.232 Y127.271 E.00811
G1 X130.15 Y126.646 E.0209
G1 X124.021 Y127.453 E.20504
G3 X124.083 Y126.783 I7.706 J.374 E.02234
G1 X125.631 Y115.029 E.39327
G1 X131.972 Y115.862 E.21216
G1 X130.482 Y127.18 E.37867
; WIPE_START
G1 F8843.478
G1 X130.232 Y127.271 E-.10122
G1 X130.15 Y126.646 E-.23942
G1 X129.056 Y126.79 E-.41936
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.885 Y134.2 Z13 F42000
G1 X132.386 Y140.28 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4099
M204 S5000
G3 X132.228 Y140.5 I-.19 J.03 E.00924
G1 X125.49 Y141.387 E.20883
G3 X125.268 Y141.217 I-.029 J-.193 E.00959
G1 X123.694 Y129.264 E.37045
G3 X123.694 Y126.736 I10.795 J-1.264 E.07785
G1 X125.267 Y114.785 E.37038
G3 X125.462 Y114.611 I.2 J.028 E.00871
G1 X132.23 Y115.501 E.20977
G3 X132.386 Y115.723 I-.036 J.191 E.00922
G1 X130.812 Y127.68 E.37058
G2 X130.812 Y128.322 I3.44 J.32 E.01976
G1 X132.378 Y140.221 E.36876
; WIPE_START
G1 F9547.055
M204 S6000
G1 X132.384 Y140.353 E-.05053
G1 X132.358 Y140.415 E-.02515
G1 X132.294 Y140.476 E-.03404
G1 X132.228 Y140.5 E-.02647
G1 X130.6 Y140.714 E-.62381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z13
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z13 F4000
            G39.3 S1
            G0 Z13 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X130.103 Y127.703 F42000
G1 Z12.6
G1 E.8 F1800
; FEATURE: Top surface
G1 F4099
M204 S2000
G1 X130.592 Y128.192 E.02126
G1 X130.666 Y128.799
G1 X130.183 Y128.317 E.02096
G1 X129.854 Y128.521
G1 X130.747 Y129.413 E.0388
G1 X130.827 Y130.028
G1 X129.382 Y128.583 E.06279
G1 X128.911 Y128.645
G1 X130.908 Y130.642 E.08678
G1 X130.989 Y131.256
G1 X128.44 Y128.707 E.11077
G1 X128.539 Y129.339
G1 X127.969 Y128.769 E.0248
G1 X127.498 Y128.831
G1 X128.068 Y129.401 E.0248
G1 X127.597 Y129.463
G1 X127.026 Y128.893 E.0248
G1 X126.555 Y128.955
G1 X127.126 Y129.525 E.0248
G1 X126.654 Y129.587
G1 X126.084 Y129.017 E.0248
G1 X125.613 Y129.079
G1 X126.183 Y129.65 E.0248
G1 X125.718 Y129.718
G1 X125.141 Y129.141 E.02507
G1 X124.67 Y129.203
G1 X125.799 Y130.332 E.04906
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.67 Y129.203 E-.60668
G1 X125.07 Y129.15 E-.15332
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.26 Y128.793 Z13 F42000
G1 Z12.6
G1 E.8 F1800
G1 F4099
M204 S2000
G1 X123.824 Y128.357 E.01895
G1 X123.866 Y128.932
G1 X125.88 Y130.946 E.0875
G1 X125.961 Y131.56
G1 X123.939 Y129.539 E.08784
G1 X124.02 Y130.153
G1 X126.042 Y132.174 E.08784
G1 X126.122 Y132.788
G1 X124.101 Y130.767 E.08784
G1 X124.182 Y131.381
G1 X126.203 Y133.402 E.08784
G1 X126.284 Y134.016
G1 X124.263 Y131.995 E.08784
G1 X124.344 Y132.609
G1 X126.365 Y134.631 E.08784
G1 X126.446 Y135.245
G1 X124.424 Y133.223 E.08784
G1 X124.505 Y133.837
G1 X126.527 Y135.859 E.08784
G1 X126.608 Y136.473
G1 X124.586 Y134.452 E.08784
G1 X124.667 Y135.066
G1 X126.688 Y137.087 E.08784
G1 X126.769 Y137.701
G1 X124.748 Y135.68 E.08784
G1 X124.829 Y136.294
G1 X126.85 Y138.315 E.08784
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.436 Y136.901 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.07 Y131.87 Z13 F42000
G1 Z12.6
G1 E.8 F1800
G1 F4099
M204 S2000
G1 X129.049 Y129.849 E.08784
G1 X129.129 Y130.463
G1 X131.151 Y132.484 E.08784
G1 X131.232 Y133.098
G1 X129.21 Y131.077 E.08784
G1 X129.291 Y131.691
M73 P89 R2
G1 X131.312 Y133.712 E.08784
G1 X131.393 Y134.326
G1 X129.372 Y132.305 E.08784
G1 X129.453 Y132.919
G1 X131.474 Y134.94 E.08784
G1 X131.555 Y135.555
G1 X129.534 Y133.533 E.08784
G1 X129.614 Y134.147
G1 X131.636 Y136.169 E.08784
G1 X131.717 Y136.783
G1 X129.695 Y134.761 E.08784
G1 X129.776 Y135.375
G1 X131.798 Y137.397 E.08784
G1 X131.878 Y138.011
G1 X129.857 Y135.99 E.08784
G1 X129.938 Y136.604
G1 X131.959 Y138.625 E.08784
G1 X131.558 Y138.757
G1 X132.04 Y139.239 E.02096
G1 X131.552 Y138.752
G1 X130.019 Y137.218 E.06665
G1 X130.1 Y137.832
G1 X131.081 Y138.814 E.04266
G1 X130.61 Y138.876
G1 X130.039 Y138.305 E.0248
G1 X129.568 Y138.367
G1 X130.139 Y138.938 E.0248
G1 X129.668 Y139
G1 X129.097 Y138.429 E.0248
G1 X128.626 Y138.491
G1 X129.196 Y139.062 E.0248
G1 X128.725 Y139.124
G1 X128.155 Y138.553 E.0248
G1 X127.683 Y138.615
G1 X128.254 Y139.186 E.0248
G1 X127.783 Y139.248
G1 X127.212 Y138.677 E.0248
G1 X127.312 Y139.31
G1 X124.91 Y136.908 E.10437
G1 X124.99 Y137.522
G1 X126.84 Y139.372 E.08038
G1 X126.369 Y139.434
G1 X125.071 Y138.136 E.05639
G1 X125.152 Y138.75
G1 X125.898 Y139.496 E.0324
G1 X125.715 Y139.847
G1 X125.233 Y139.364 E.02096
G1 X125.314 Y139.979
G1 X125.796 Y140.461 E.02096
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.314 Y139.979 E-.25919
G1 X125.233 Y139.364 E-.23538
G1 X125.715 Y139.847 E-.2592
G1 X125.723 Y139.832 E-.00623
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.753 Y132.2 Z13 F42000
G1 X125.762 Y129.907 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0974524
G1 F4099
M204 S6000
G1 X125.727 Y129.938 E.00021
; LINE_WIDTH: 0.12371
G1 X125.623 Y129.813 E.00107
; WIPE_START
G1 F15000
G1 X125.727 Y129.938 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.01 Y136.256 Z13 F42000
G1 X132.066 Y139.29 Z13
G1 Z12.6
G1 E.8 F1800
; LINE_WIDTH: 0.271486
G1 F4099
M204 S6000
G1 X132.022 Y139.371 E.00171
; LINE_WIDTH: 0.309649
G1 X131.978 Y139.451 E.002
; LINE_WIDTH: 0.347812
G1 X131.934 Y139.532 E.00228
; LINE_WIDTH: 0.381244
G1 X131.821 Y139.53 E.00312
G1 X131.589 Y139.135 E.01264
M204 S10000
G1 X130.665 Y129.065 F42000
; LINE_WIDTH: 0.0908357
G1 F4099
M204 S6000
G1 X130.665 Y128.8 E.00104
M204 S10000
G1 X130.638 Y127.509 F42000
; LINE_WIDTH: 0.152372
G1 F4099
M204 S6000
G1 X130.062 Y127.54 E.00514
M204 S10000
G1 X130.416 Y127.452 F42000
; LINE_WIDTH: 0.105697
G1 F4099
M204 S6000
G1 X130.602 Y127.936 E.00265
; WIPE_START
G1 F15000
G1 X130.416 Y127.452 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.062 Y124.581 Z13 F42000
G1 Z12.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4099
M204 S6000
G1 X130.275 Y122.966 E.05401
G3 X129.713 Y122.104 I.45 J-.908 E.03583
G3 X130.584 Y120.621 I2.372 J.397 E.05832
G1 X130.905 Y118.184 E.08155
G1 X129.987 Y117.518 E.03763
G3 X129.849 Y116.345 I.69 J-.675 E.04214
G1 X127.209 Y115.998 E.08831
G1 X127.264 Y116.207 E.00717
G1 X127.724 Y116.862 E.02655
G1 X128.634 Y117.518 E.0372
G3 X128.908 Y118.173 I-.409 J.555 E.02474
G3 X128.276 Y119.483 I-2.083 J-.197 E.04928
G1 X127.366 Y120.138 E.0372
G2 X127.092 Y120.793 I.409 J.555 E.02474
G2 X127.724 Y122.104 I2.083 J-.197 E.04928
G1 X128.634 Y122.759 E.0372
G3 X128.908 Y123.414 I-.409 J.555 E.02474
G3 X128.276 Y124.724 I-2.083 J-.197 E.04928
G1 X127.366 Y125.38 E.0372
G2 X127.156 Y126.279 I.551 J.602 E.03255
G1 X124.872 Y126.579 E.07643
G3 X125.103 Y126.035 I.638 J-.051 E.02041
G1 X126.013 Y125.38 E.0372
G2 X126.287 Y124.724 I-.409 J-.555 E.02474
G2 X125.32 Y123.173 I-2.35 J.387 E.06223
G1 X125.689 Y120.372 E.09373
G2 X126.287 Y119.483 I-.44 J-.941 E.03732
G1 X126.115 Y118.828 E.02247
G1 X125.928 Y118.561 E.01082
G1 X126.14 Y116.946 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X125.928 Y118.561 E-.61876
G1 X126.115 Y118.828 E-.12399
G1 X126.127 Y118.872 E-.01725
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 64/73
; update layer progress
M73 L64
M991 S0 P63 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z13 I-1.127 J.46 P1  F42000
G1 X129.971 Y128.296 Z13
G1 Z12.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2752
M204 S5000
G1 X124.499 Y129.016 E.16961
G1 X124.339 Y127.807 E.03749
G1 X125.617 Y127.639 E.0396
G1 X129.812 Y127.086 E.13001
G1 X129.964 Y128.236 E.03564
M204 S250
G1 X129.889 Y128.438 F42000
G1 F2752
M204 S5000
G1 X131.262 Y138.868 E.32325
G1 X125.988 Y139.562 E.16347
G1 X124.615 Y129.132 E.32325
G1 X125.183 Y129.057 E.01761
G1 X129.83 Y128.446 E.14402
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.102 Y130.427 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.956 Y137.381 Z13.2 F42000
G1 X125.906 Y139.704 Z13.2
G1 Z12.8
M73 P89 R1
G1 E.8 F1800
G1 F2752
M204 S5000
G1 X127.184 Y139.536 E.0396
G1 X131.378 Y138.984 E.13001
G1 X131.538 Y140.193 E.03749
G1 X126.065 Y140.914 E.16961
G1 X125.914 Y139.764 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.184 Y139.536 E-.49029
G1 X127.887 Y139.443 E-.26971
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.201 Y131.925 Z13.2 F42000
G1 X130.197 Y126.23 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2752
M204 S6000
G1 X124.467 Y126.984 E.19169
G1 X125.981 Y115.485 E.38472
G1 X131.515 Y116.213 E.18516
G1 X130.204 Y126.17 E.33316
; WIPE_START
G1 F8843.478
G1 X128.224 Y126.451 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.458 Y127.362 Z13.2 F42000
G1 Z12.8
G1 E.8 F1800
G1 F2752
M204 S6000
G1 X130.244 Y127.362 E.0071
G1 X130.15 Y126.646 E.02395
G1 X124.021 Y127.453 E.20504
G3 X124.083 Y126.783 I7.706 J.374 E.02234
G1 X125.631 Y115.029 E.39327
G1 X131.972 Y115.862 E.21216
G1 X130.466 Y127.303 E.38278
; WIPE_START
G1 F8843.478
G1 X130.244 Y127.362 E-.08734
G1 X130.15 Y126.646 E-.27436
G1 X129.111 Y126.783 E-.3983
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.911 Y134.2 Z13.2 F42000
G1 X132.386 Y140.28 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2752
M204 S5000
G3 X132.23 Y140.499 I-.19 J.03 E.00916
G1 X125.489 Y141.387 E.20892
G3 X125.267 Y141.215 I-.03 J-.191 E.00968
G1 X123.694 Y129.264 E.37038
G3 X123.694 Y126.736 I10.795 J-1.264 E.07786
G1 X125.267 Y114.785 E.37038
G3 X125.462 Y114.611 I.2 J.028 E.00872
G1 X132.23 Y115.501 E.20977
G3 X132.386 Y115.723 I-.036 J.191 E.00922
G1 X130.812 Y127.68 E.37059
G2 X130.812 Y128.32 I2.786 J.32 E.0197
G1 X132.378 Y140.221 E.36883
; WIPE_START
G1 F9547.055
M204 S6000
G1 X132.383 Y140.355 E-.05101
G1 X132.358 Y140.414 E-.02461
G1 X132.296 Y140.475 E-.03312
G1 X132.23 Y140.499 E-.02652
G1 X130.6 Y140.714 E-.62473
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z13.2
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z13.2 F4000
            G39.3 S1
            G0 Z13.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X131.975 Y140.335 F42000
G1 Z12.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.480855
G1 F2752
M204 S6000
G1 X131.764 Y138.735 E.0576
; LINE_WIDTH: 0.505842
G1 X131.726 Y138.635 E.00406
; LINE_WIDTH: 0.555833
G1 X131.687 Y138.534 E.0045
M204 S10000
G1 X131.443 Y138.742 F42000
; LINE_WIDTH: 0.267032
G1 F2752
M204 S6000
G1 X131.478 Y138.712 E.00084
; LINE_WIDTH: 0.315311
G1 X131.513 Y138.682 E.00102
; LINE_WIDTH: 0.36359
G1 X131.548 Y138.653 E.0012
; LINE_WIDTH: 0.411869
G1 X131.583 Y138.623 E.00138
; LINE_WIDTH: 0.460148
G1 X131.618 Y138.593 E.00156
; LINE_WIDTH: 0.508428
G1 X131.653 Y138.564 E.00174
; LINE_WIDTH: 0.556707
G1 X131.687 Y138.534 E.00192
; LINE_WIDTH: 0.580579
G1 X130.386 Y128.65 E.43678
G1 X130.397 Y128.543 E.00471
; LINE_WIDTH: 0.505856
G1 X130.408 Y128.436 E.00406
; LINE_WIDTH: 0.484582
G1 X130.375 Y128.141 E.01069
; LINE_WIDTH: 0.520729
G1 X130.349 Y127.558 E.0227
; WIPE_START
G1 F7534.405
G1 X130.375 Y128.141 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.089 Y124.379 Z13.2 F42000
G1 Z12.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2752
M204 S6000
G1 X130.302 Y122.765 E.05401
G3 X129.937 Y121.449 I.911 J-.961 E.04761
G3 X130.604 Y120.465 I1.683 J.423 E.04023
G1 X130.914 Y118.109 E.07881
G3 X130.02 Y117.19 I3.727 J-4.52 E.04263
G3 X129.929 Y116.355 I.919 J-.523 E.02864
G1 X127.306 Y116.011 E.08777
G1 X127.317 Y116.207 E.00653
G1 X127.64 Y116.862 E.02424
G3 X128.601 Y117.845 I-3.981 J4.852 E.04567
G1 X128.721 Y118.173 E.01157
G3 X128.36 Y119.483 I-1.723 J.231 E.04632
G2 X127.399 Y120.466 I3.982 J4.852 E.04567
G1 X127.279 Y120.793 E.01157
G2 X127.64 Y122.104 I1.723 J.231 E.04632
G3 X128.601 Y123.086 I-3.981 J4.851 E.04567
G1 X128.721 Y123.414 E.01157
G3 X128.36 Y124.724 I-1.723 J.23 E.04632
G2 X127.399 Y125.707 I3.982 J4.852 E.04567
G2 X127.292 Y126.261 I.586 J.401 E.01924
G1 X124.872 Y126.579 E.08098
G3 X125.019 Y126.035 I.875 J-.055 E.01906
G2 X125.98 Y125.052 I-3.981 J-4.851 E.04567
G1 X126.1 Y124.724 E.01157
G2 X125.339 Y123.032 I-2.048 J-.097 E.06389
G1 X125.723 Y120.117 E.09751
G2 X126.063 Y118.828 I-.845 J-.912 E.04667
G1 X125.928 Y118.556 E.01007
G1 X126.141 Y116.941 E.05401
; WIPE_START
G1 F8843.478
G1 X125.928 Y118.556 E-.61876
G1 X126.063 Y118.828 E-.11537
G1 X126.067 Y118.896 E-.02587
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.289 Y126.318 Z13.2 F42000
G1 X123.968 Y127.658 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.387788
G1 F2752
M204 S6000
G1 X123.986 Y128 E.00961
; LINE_WIDTH: 0.423316
G1 X124.017 Y128.404 E.01257
; LINE_WIDTH: 0.467592
G2 X124.106 Y129.214 I18.601 J-1.629 E.02821
; LINE_WIDTH: 0.497815
M73 P90 R1
G2 X124.151 Y129.365 I.339 J-.019 E.0059
; LINE_WIDTH: 0.55585
G1 X124.19 Y129.466 E.0045
; LINE_WIDTH: 0.556707
G1 X124.225 Y129.436 E.00192
; LINE_WIDTH: 0.508428
G1 X124.259 Y129.407 E.00174
; LINE_WIDTH: 0.460148
G1 X124.294 Y129.377 E.00156
; LINE_WIDTH: 0.411869
G1 X124.329 Y129.347 E.00138
; LINE_WIDTH: 0.36359
G1 X124.364 Y129.318 E.0012
; LINE_WIDTH: 0.315311
G1 X124.399 Y129.288 E.00102
; LINE_WIDTH: 0.267032
G1 X124.434 Y129.258 E.00084
M204 S10000
G1 X124.19 Y129.466 F42000
; LINE_WIDTH: 0.580838
G1 F2752
M204 S6000
G1 X125.491 Y139.35 E.43699
; LINE_WIDTH: 0.556695
G1 X125.532 Y139.37 E.00192
; LINE_WIDTH: 0.508421
G1 X125.574 Y139.389 E.00174
; LINE_WIDTH: 0.460146
G1 X125.615 Y139.409 E.00156
; LINE_WIDTH: 0.411872
G1 X125.656 Y139.428 E.00138
; LINE_WIDTH: 0.363597
G1 X125.698 Y139.448 E.0012
; LINE_WIDTH: 0.315323
G1 X125.739 Y139.468 E.00102
; LINE_WIDTH: 0.267048
G1 X125.78 Y139.487 E.00084
M204 S10000
G1 X125.491 Y139.35 F42000
; LINE_WIDTH: 0.55584
G1 F2752
M204 S6000
G1 X125.48 Y139.457 E.0045
; LINE_WIDTH: 0.505842
G1 X125.469 Y139.564 E.00406
; LINE_WIDTH: 0.480829
G1 X125.679 Y141.165 E.05761
; CHANGE_LAYER
; Z_HEIGHT: 13
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.89
G1 X125.469 Y139.564 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 65/73
; update layer progress
M73 L65
M991 S0 P64 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z13.2 I1.131 J.449 P1  F42000
G1 X129.889 Y128.438 Z13.2
G1 Z13
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2771
M204 S5000
G1 X131.262 Y138.868 E.32325
G1 X125.988 Y139.562 E.16347
G1 X124.615 Y129.132 E.32325
G1 X125.903 Y128.963 E.03991
G1 X129.83 Y128.446 E.12171
M204 S250
G1 X129.971 Y128.296 F42000
G1 F2771
M204 S5000
G1 X124.499 Y129.016 E.16961
G1 X124.339 Y127.807 E.03749
G1 X125.423 Y127.664 E.03357
G1 X129.812 Y127.086 E.13604
G1 X129.964 Y128.236 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.984 Y128.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.59 Y136.023 Z13.4 F42000
G1 X125.906 Y139.704 Z13.4
G1 Z13
G1 E.8 F1800
G1 F2771
M204 S5000
G1 X126.989 Y139.562 E.03357
G1 X131.378 Y138.984 E.13604
G1 X131.538 Y140.193 E.03749
G1 X126.065 Y140.914 E.16961
G1 X125.914 Y139.764 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.989 Y139.562 E-.41584
G1 X127.887 Y139.443 E-.34417
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.201 Y131.925 Z13.4 F42000
G1 X130.197 Y126.23 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2771
M204 S6000
G1 X124.467 Y126.984 E.19169
G1 X125.981 Y115.485 E.38472
G1 X131.515 Y116.213 E.18516
G1 X130.205 Y126.17 E.33316
; WIPE_START
G1 F8843.478
G1 X128.224 Y126.451 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.458 Y127.362 Z13.4 F42000
G1 Z13
G1 E.8 F1800
G1 F2771
M204 S6000
G1 X130.244 Y127.362 E.0071
G1 X130.15 Y126.646 E.02395
G1 X124.021 Y127.453 E.20504
G3 X124.083 Y126.783 I7.706 J.374 E.02234
G1 X125.631 Y115.029 E.39327
G1 X131.972 Y115.862 E.21216
G1 X130.466 Y127.303 E.38278
; WIPE_START
G1 F8843.478
G1 X130.244 Y127.362 E-.08734
G1 X130.15 Y126.646 E-.27437
G1 X129.111 Y126.783 E-.3983
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.911 Y134.2 Z13.4 F42000
G1 X132.386 Y140.28 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2771
M204 S5000
G3 X132.228 Y140.5 I-.192 J.028 E.00921
G1 X125.49 Y141.387 E.20884
G3 X125.268 Y141.217 I-.028 J-.193 E.00958
G1 X123.694 Y129.264 E.37045
G3 X123.694 Y126.736 I10.795 J-1.264 E.07786
G1 X125.267 Y114.785 E.37038
G3 X125.462 Y114.611 I.201 J.028 E.00873
G1 X132.233 Y115.501 E.20983
G1 X132.249 Y115.505 E.0005
G3 X132.386 Y115.723 I-.053 J.186 E.00868
G1 X130.812 Y127.68 E.37058
G2 X130.812 Y128.322 I3.412 J.32 E.01976
G1 X132.378 Y140.221 E.36876
; WIPE_START
G1 F9547.055
M204 S6000
G1 X132.383 Y140.355 E-.05101
G1 X132.342 Y140.437 E-.035
G1 X132.228 Y140.5 E-.04935
G1 X130.598 Y140.714 E-.62464
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z13.4
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z13.4 F4000
            G39.3 S1
            G0 Z13.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X131.975 Y140.335 F42000
G1 Z13
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.480857
G1 F2771
M204 S6000
G1 X131.764 Y138.735 E.0576
; LINE_WIDTH: 0.505843
G1 X131.726 Y138.635 E.00406
; LINE_WIDTH: 0.555835
G1 X131.687 Y138.534 E.0045
; LINE_WIDTH: 0.580579
G1 X130.386 Y128.65 E.43678
G1 X130.397 Y128.543 E.00471
; LINE_WIDTH: 0.505856
G1 X130.408 Y128.436 E.00406
; LINE_WIDTH: 0.488372
G1 X130.364 Y128.014 E.01541
; LINE_WIDTH: 0.527877
G1 X130.35 Y127.558 E.018
; WIPE_START
G1 F7423.348
G1 X130.364 Y128.014 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.123 Y124.122 Z13.4 F42000
G1 Z13
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2771
M204 S6000
G1 X130.335 Y122.507 E.05401
G1 X130.044 Y122.104 E.01651
G3 X130.633 Y120.245 I1.784 J-.457 E.06815
G1 X130.929 Y117.999 E.07514
G3 X130.044 Y116.862 I6.363 J-5.863 E.04784
G1 X129.982 Y116.362 E.01672
G1 X127.365 Y116.018 E.08754
G1 X127.342 Y116.207 E.00631
G1 X127.543 Y116.862 E.02274
G3 X128.576 Y118.173 I-7.328 J6.839 E.05541
G3 X127.896 Y120.138 I-1.862 J.456 E.07292
G1 X127.424 Y120.793 E.02679
G2 X128.104 Y122.759 I1.862 J.456 E.07292
G1 X128.576 Y123.414 E.02679
G3 X127.896 Y125.38 I-1.862 J.456 E.07292
G1 X127.424 Y126.035 E.02679
G1 X127.397 Y126.247 E.0071
G1 X124.872 Y126.579 E.08449
G1 X124.948 Y126.006 E.01919
G2 X125.956 Y124.724 I-7.165 J-6.674 E.05415
G2 X125.362 Y122.86 I-1.788 J-.457 E.06842
G1 X125.773 Y119.737 E.10449
G1 X125.956 Y119.483 E.01037
G1 X126.038 Y118.828 E.0219
G1 X125.936 Y118.497 E.01147
G1 X126.149 Y116.883 E.05401
; WIPE_START
G1 F8843.478
G1 X125.936 Y118.497 E-.61876
G1 X126.038 Y118.828 E-.1314
G1 X126.035 Y118.854 E-.00985
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.29 Y126.284 Z13.4 F42000
G1 X123.968 Y127.658 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.387834
G1 F2771
M204 S6000
G1 X123.986 Y128 E.00962
; LINE_WIDTH: 0.423336
G1 X124.017 Y128.404 E.01256
; LINE_WIDTH: 0.45864
G1 X124.057 Y128.807 E.01371
; LINE_WIDTH: 0.479641
G1 X124.106 Y129.214 E.01461
G2 X124.138 Y129.332 I.262 J-.009 E.00438
; LINE_WIDTH: 0.530845
G1 X124.164 Y129.399 E.00285
; LINE_WIDTH: 0.564179
G1 X124.19 Y129.466 E.00305
; LINE_WIDTH: 0.556722
G1 X124.225 Y129.436 E.00192
; LINE_WIDTH: 0.508448
G1 X124.259 Y129.407 E.00174
; LINE_WIDTH: 0.460173
G1 X124.294 Y129.377 E.00156
; LINE_WIDTH: 0.411898
G1 X124.329 Y129.347 E.00138
; LINE_WIDTH: 0.363624
G1 X124.364 Y129.318 E.0012
; LINE_WIDTH: 0.315349
G1 X124.399 Y129.288 E.00102
; LINE_WIDTH: 0.267075
G1 X124.434 Y129.258 E.00084
M204 S10000
G1 X124.19 Y129.466 F42000
; LINE_WIDTH: 0.580846
G1 F2771
M204 S6000
G1 X125.491 Y139.35 E.437
; LINE_WIDTH: 0.555851
G1 X125.48 Y139.457 E.0045
; LINE_WIDTH: 0.505871
G1 X125.469 Y139.564 E.00406
; LINE_WIDTH: 0.480848
G1 X125.679 Y141.165 E.05761
M204 S10000
G1 X125.78 Y139.487 F42000
; LINE_WIDTH: 0.266993
G1 F2771
M204 S6000
G1 X125.739 Y139.468 E.00084
; LINE_WIDTH: 0.315278
G1 X125.698 Y139.448 E.00102
; LINE_WIDTH: 0.363562
G1 X125.656 Y139.428 E.0012
; LINE_WIDTH: 0.411846
G1 X125.615 Y139.409 E.00138
; LINE_WIDTH: 0.46013
G1 X125.574 Y139.389 E.00156
; LINE_WIDTH: 0.508414
G1 X125.532 Y139.37 E.00174
; LINE_WIDTH: 0.556698
G1 X125.491 Y139.35 E.00192
; WIPE_START
G1 F7006.916
G1 X125.532 Y139.37 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.443 Y138.742 Z13.4 F42000
G1 Z13
G1 E.8 F1800
; LINE_WIDTH: 0.267032
G1 F2771
M204 S6000
G1 X131.478 Y138.712 E.00084
; LINE_WIDTH: 0.315311
G1 X131.513 Y138.682 E.00102
; LINE_WIDTH: 0.36359
G1 X131.548 Y138.653 E.0012
; LINE_WIDTH: 0.411869
G1 X131.583 Y138.623 E.00138
; LINE_WIDTH: 0.460148
G1 X131.618 Y138.593 E.00156
; LINE_WIDTH: 0.508428
G1 X131.653 Y138.564 E.00174
; LINE_WIDTH: 0.556707
G1 X131.687 Y138.534 E.00192
; CHANGE_LAYER
; Z_HEIGHT: 13.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7006.803
G1 X131.653 Y138.564 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 66/73
; update layer progress
M73 L66
M991 S0 P65 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z13.4 I1.199 J-.209 P1  F42000
M73 P91 R1
G1 X129.889 Y128.438 Z13.4
G1 Z13.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2739
M204 S5000
G1 X131.262 Y138.868 E.32325
G1 X125.988 Y139.562 E.16347
G1 X124.615 Y129.132 E.32325
G1 X126.622 Y128.868 E.06222
G1 X129.83 Y128.446 E.09941
M204 S250
G1 X129.971 Y128.296 F42000
G1 F2739
M204 S5000
G1 X124.499 Y129.016 E.16961
G1 X124.339 Y127.807 E.03749
G1 X125.228 Y127.69 E.02755
G1 X129.812 Y127.086 E.14207
G1 X129.964 Y128.236 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.984 Y128.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.59 Y136.023 Z13.6 F42000
G1 X125.906 Y139.704 Z13.6
G1 Z13.2
G1 E.8 F1800
G1 F2739
M204 S5000
G1 X126.795 Y139.587 E.02755
G1 X131.378 Y138.984 E.14207
G1 X131.538 Y140.193 E.03749
G1 X126.065 Y140.914 E.16961
G1 X125.914 Y139.764 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.795 Y139.587 E-.34144
G1 X127.887 Y139.443 E-.41856
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.201 Y131.925 Z13.6 F42000
G1 X130.197 Y126.23 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2739
M204 S6000
G1 X124.467 Y126.984 E.19169
G1 X125.981 Y115.485 E.38472
G1 X131.515 Y116.213 E.18516
G1 X130.204 Y126.17 E.33316
; WIPE_START
G1 F8843.478
G1 X128.224 Y126.451 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.458 Y127.362 Z13.6 F42000
G1 Z13.2
G1 E.8 F1800
G1 F2739
M204 S6000
G1 X130.244 Y127.362 E.0071
G1 X130.15 Y126.646 E.02395
G1 X124.021 Y127.453 E.20504
G3 X124.083 Y126.783 I7.699 J.373 E.02234
G1 X125.631 Y115.029 E.39328
G1 X131.972 Y115.862 E.21216
G1 X130.466 Y127.303 E.38279
; WIPE_START
G1 F8843.478
G1 X130.244 Y127.362 E-.08734
G1 X130.15 Y126.646 E-.27439
G1 X129.111 Y126.783 E-.39827
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.911 Y134.2 Z13.6 F42000
G1 X132.386 Y140.28 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2739
M204 S5000
G3 X132.228 Y140.5 I-.19 J.03 E.00923
G1 X125.49 Y141.387 E.20884
G3 X125.267 Y141.215 I-.03 J-.191 E.00969
G1 X123.694 Y129.264 E.37038
G3 X123.694 Y126.736 I10.795 J-1.264 E.07786
G1 X125.267 Y114.785 E.37038
G3 X125.463 Y114.611 I.2 J.028 E.00874
G1 X132.23 Y115.501 E.20974
G3 X132.386 Y115.723 I-.036 J.191 E.00923
G1 X130.812 Y127.68 E.37059
G2 X130.812 Y128.32 I2.785 J.32 E.0197
G1 X132.378 Y140.221 E.36883
; WIPE_START
G1 F9547.055
M204 S6000
G1 X132.384 Y140.354 E-.05079
G1 X132.358 Y140.415 E-.02488
G1 X132.294 Y140.476 E-.03395
G1 X132.228 Y140.5 E-.02652
G1 X130.6 Y140.714 E-.62386
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z13.6
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z13.6 F4000
            G39.3 S1
            G0 Z13.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X131.975 Y140.335 F42000
G1 Z13.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.480849
G1 F2739
M204 S6000
G1 X131.764 Y138.735 E.0576
; LINE_WIDTH: 0.505843
G1 X131.726 Y138.635 E.00406
; LINE_WIDTH: 0.555836
G1 X131.687 Y138.534 E.0045
; LINE_WIDTH: 0.556707
G1 X131.653 Y138.564 E.00192
; LINE_WIDTH: 0.508428
G1 X131.618 Y138.593 E.00174
; LINE_WIDTH: 0.460148
G1 X131.583 Y138.623 E.00156
; LINE_WIDTH: 0.411869
G1 X131.548 Y138.653 E.00138
; LINE_WIDTH: 0.36359
G1 X131.513 Y138.682 E.0012
; LINE_WIDTH: 0.315311
G1 X131.478 Y138.712 E.00102
; LINE_WIDTH: 0.267032
G1 X131.443 Y138.742 E.00084
M204 S10000
G1 X131.687 Y138.534 F42000
; LINE_WIDTH: 0.580726
G1 F2739
M204 S6000
G1 X130.386 Y128.65 E.4369
G1 X130.394 Y128.579 E.00314
; LINE_WIDTH: 0.530838
G1 X130.401 Y128.507 E.00285
; LINE_WIDTH: 0.497503
G1 X130.408 Y128.436 E.00266
; LINE_WIDTH: 0.484581
G1 X130.375 Y128.141 E.01069
; LINE_WIDTH: 0.520712
G1 X130.349 Y127.558 E.0227
; WIPE_START
G1 F7534.664
G1 X130.375 Y128.141 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.145 Y123.95 Z13.6 F42000
G1 Z13.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2739
M204 S6000
G1 X130.358 Y122.336 E.05401
G1 X130.161 Y122.104 E.0101
G3 X130.523 Y120.138 I1.498 J-.74 E.07107
G1 X130.67 Y119.966 E.00751
G1 X130.95 Y117.838 E.07119
G2 X130.161 Y116.862 I-6.638 J4.566 E.04167
G1 X130.011 Y116.366 E.0172
G1 X127.398 Y116.023 E.08742
G1 X127.342 Y116.207 E.00639
G1 X127.428 Y116.862 E.02192
G2 X128.46 Y118.173 I8.9 J-5.949 E.05539
G3 X128.097 Y120.138 I-1.498 J.74 E.07107
G1 X127.54 Y120.793 E.02854
G2 X127.903 Y122.759 I1.498 J.74 E.07107
G1 X128.46 Y123.414 E.02854
G3 X128.097 Y125.38 I-1.498 J.74 E.07107
G1 X127.54 Y126.035 E.02854
G1 X127.479 Y126.236 E.00698
G1 X124.872 Y126.579 E.08723
G1 X124.974 Y125.805 E.02592
G3 X125.839 Y124.724 I7.346 J4.998 E.04596
G2 X125.477 Y122.759 I-1.498 J-.74 E.07107
G1 X125.389 Y122.655 E.00451
G1 X125.8 Y119.529 E.10459
G1 X126.037 Y118.828 E.02456
G1 X125.965 Y118.277 E.01845
G1 X126.178 Y116.662 E.05401
; WIPE_START
G1 F8843.478
G1 X125.965 Y118.277 E-.61876
G1 X126.013 Y118.645 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.324 Y126.088 Z13.6 F42000
G1 X123.968 Y127.658 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.387788
G1 F2739
M204 S6000
G1 X123.986 Y128 E.00961
; LINE_WIDTH: 0.423317
G1 X124.017 Y128.404 E.01257
; LINE_WIDTH: 0.467591
G2 X124.106 Y129.214 I18.601 J-1.629 E.02821
; LINE_WIDTH: 0.497815
G2 X124.151 Y129.365 I.339 J-.019 E.0059
; LINE_WIDTH: 0.55585
G1 X124.19 Y129.466 E.0045
; LINE_WIDTH: 0.556707
G1 X124.225 Y129.436 E.00192
; LINE_WIDTH: 0.508428
G1 X124.259 Y129.407 E.00174
; LINE_WIDTH: 0.460148
G1 X124.294 Y129.377 E.00156
; LINE_WIDTH: 0.411869
G1 X124.329 Y129.347 E.00138
; LINE_WIDTH: 0.36359
G1 X124.364 Y129.318 E.0012
; LINE_WIDTH: 0.315311
G1 X124.399 Y129.288 E.00102
; LINE_WIDTH: 0.267032
G1 X124.434 Y129.258 E.00084
M204 S10000
G1 X124.19 Y129.466 F42000
; LINE_WIDTH: 0.580845
G1 F2739
M204 S6000
G1 X125.491 Y139.35 E.437
; LINE_WIDTH: 0.564173
G1 X125.484 Y139.421 E.00305
; LINE_WIDTH: 0.530839
G1 X125.476 Y139.493 E.00285
; LINE_WIDTH: 0.481559
G1 X125.469 Y139.564 E.00256
G1 X125.679 Y141.165 E.05771
M204 S10000
G1 X125.78 Y139.487 F42000
; LINE_WIDTH: 0.267048
G1 F2739
M204 S6000
G1 X125.739 Y139.468 E.00084
; LINE_WIDTH: 0.315323
G1 X125.698 Y139.448 E.00102
; LINE_WIDTH: 0.363597
G1 X125.656 Y139.428 E.0012
; LINE_WIDTH: 0.411872
G1 X125.615 Y139.409 E.00138
; LINE_WIDTH: 0.460146
G1 X125.574 Y139.389 E.00156
; LINE_WIDTH: 0.508421
G1 X125.532 Y139.37 E.00174
; LINE_WIDTH: 0.556696
G1 X125.491 Y139.35 E.00192
; CHANGE_LAYER
; Z_HEIGHT: 13.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7006.956
G1 X125.532 Y139.37 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 67/73
; update layer progress
M73 L67
M991 S0 P66 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z13.6 I1.13 J.451 P1  F42000
G1 X129.889 Y128.438 Z13.6
G1 Z13.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2747
M204 S5000
G1 X131.262 Y138.868 E.32325
G1 X125.988 Y139.562 E.16347
G1 X124.615 Y129.132 E.32325
G1 X127.342 Y128.773 E.08452
G1 X129.83 Y128.446 E.0771
M204 S250
G1 X129.971 Y128.296 F42000
G1 F2747
M204 S5000
G1 X124.499 Y129.016 E.16961
G1 X124.339 Y127.807 E.03749
G1 X125.034 Y127.715 E.02152
G1 X129.812 Y127.086 E.14809
G1 X129.964 Y128.236 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.984 Y128.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.59 Y136.023 Z13.8 F42000
G1 X125.906 Y139.704 Z13.8
G1 Z13.4
G1 E.8 F1800
G1 F2747
M204 S5000
G1 X126.6 Y139.613 E.02152
G1 X131.378 Y138.984 E.14809
G1 X131.538 Y140.193 E.03749
G1 X126.065 Y140.914 E.16961
G1 X125.914 Y139.764 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.6 Y139.613 E-.26712
G1 X127.886 Y139.443 E-.49289
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.201 Y131.925 Z13.8 F42000
G1 X130.197 Y126.23 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P92 R1
G1 F2747
M204 S6000
G1 X124.467 Y126.984 E.19169
G1 X125.981 Y115.485 E.38472
G1 X131.515 Y116.213 E.18516
G1 X130.205 Y126.17 E.33316
; WIPE_START
G1 F8843.478
G1 X128.224 Y126.451 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.458 Y127.362 Z13.8 F42000
G1 Z13.4
G1 E.8 F1800
G1 F2747
M204 S6000
G1 X130.244 Y127.362 E.0071
G1 X130.15 Y126.646 E.02395
G1 X124.021 Y127.453 E.20504
G3 X124.083 Y126.783 I7.708 J.374 E.02233
G1 X125.631 Y115.029 E.39328
G1 X131.972 Y115.862 E.21216
G1 X130.466 Y127.303 E.38278
; WIPE_START
G1 F8843.478
G1 X130.244 Y127.362 E-.08734
G1 X130.15 Y126.646 E-.27437
G1 X129.111 Y126.783 E-.3983
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.911 Y134.2 Z13.8 F42000
G1 X132.386 Y140.28 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2747
M204 S5000
G3 X132.228 Y140.5 I-.19 J.03 E.00924
G1 X125.49 Y141.387 E.20883
G3 X125.267 Y141.215 I-.028 J-.193 E.00967
G1 X123.694 Y129.264 E.37038
G3 X123.694 Y126.736 I10.928 J-1.264 E.07785
G1 X125.267 Y114.785 E.37038
G3 X125.463 Y114.611 I.2 J.028 E.00876
G1 X132.23 Y115.501 E.20973
G3 X132.386 Y115.723 I-.036 J.191 E.00922
G1 X130.812 Y127.68 E.37059
G2 X130.812 Y128.322 I3.384 J.32 E.01975
G1 X132.378 Y140.221 E.36877
; WIPE_START
G1 F9547.055
M204 S6000
G1 X132.383 Y140.355 E-.05106
G1 X132.358 Y140.415 E-.0246
G1 X132.294 Y140.477 E-.03408
G1 X132.228 Y140.5 E-.02649
G1 X130.6 Y140.714 E-.62377
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z13.8
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z13.8 F4000
            G39.3 S1
            G0 Z13.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X131.975 Y140.335 F42000
G1 Z13.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.480859
G1 F2747
M204 S6000
G1 X131.764 Y138.735 E.0576
; LINE_WIDTH: 0.505843
G1 X131.726 Y138.635 E.00406
; LINE_WIDTH: 0.555837
G1 X131.687 Y138.534 E.0045
M204 S10000
G1 X131.443 Y138.742 F42000
; LINE_WIDTH: 0.267032
G1 F2747
M204 S6000
G1 X131.478 Y138.712 E.00084
; LINE_WIDTH: 0.315311
G1 X131.513 Y138.682 E.00102
; LINE_WIDTH: 0.36359
G1 X131.548 Y138.653 E.0012
; LINE_WIDTH: 0.411869
G1 X131.583 Y138.623 E.00138
; LINE_WIDTH: 0.460148
G1 X131.618 Y138.593 E.00156
; LINE_WIDTH: 0.508428
G1 X131.653 Y138.564 E.00174
; LINE_WIDTH: 0.556707
G1 X131.687 Y138.534 E.00192
; LINE_WIDTH: 0.580578
G1 X130.386 Y128.65 E.43678
G1 X130.397 Y128.543 E.00471
; LINE_WIDTH: 0.505858
G1 X130.408 Y128.436 E.00406
; LINE_WIDTH: 0.488369
G1 X130.365 Y128.014 E.0154
; LINE_WIDTH: 0.527682
G1 X130.35 Y127.558 E.01801
; WIPE_START
G1 F7426.323
G1 X130.365 Y128.014 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.161 Y123.83 Z13.8 F42000
G1 Z13.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2747
M204 S6000
G1 X130.374 Y122.215 E.05401
G1 X130.258 Y122.104 E.00534
G3 X130.028 Y120.466 I1.423 J-1.035 E.05712
G3 X130.697 Y119.759 I3.693 J2.826 E.03237
G1 X130.985 Y117.573 E.07312
G2 X130.258 Y116.862 I-3.738 J3.096 E.03379
G1 X130.016 Y116.367 E.01829
G1 X127.407 Y116.024 E.08729
G1 X127.318 Y116.207 E.00676
G1 X127.285 Y116.862 E.02176
G2 X127.682 Y117.518 I1.119 J-.231 E.02593
G1 X128.363 Y118.173 E.03133
G3 X128.593 Y119.811 I-1.423 J1.035 E.05712
G3 X127.637 Y120.793 I-5.143 J-4.047 E.04556
G2 X127.407 Y122.431 I1.423 J1.035 E.05712
G2 X128.363 Y123.414 I5.144 J-4.047 E.04556
G3 X128.593 Y125.052 I-1.423 J1.035 E.05712
G3 X127.637 Y126.035 I-5.143 J-4.046 E.04556
G1 X127.543 Y126.228 E.00712
G1 X124.872 Y126.579 E.08937
G1 X125.024 Y125.425 E.03864
G3 X125.742 Y124.724 I3.684 J3.061 E.03333
G2 X125.972 Y123.086 I-1.423 J-1.035 E.05712
G2 X125.411 Y122.484 I-3.143 J2.364 E.02737
G1 X125.83 Y119.303 E.10642
G2 X126.009 Y117.943 I-1.42 J-.879 E.0469
G1 X126.222 Y116.329 E.05401
; WIPE_START
G1 F8843.478
G1 X126.009 Y117.943 E-.61876
G1 X126.095 Y118.173 E-.0932
G1 X126.088 Y118.299 E-.04805
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.402 Y125.743 Z13.8 F42000
G1 X123.968 Y127.658 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.387757
G1 F2747
M204 S6000
G1 X123.986 Y127.999 E.0096
; LINE_WIDTH: 0.424178
G1 X124.02 Y128.431 E.01347
; LINE_WIDTH: 0.469077
G2 X124.113 Y129.265 I25.655 J-2.433 E.02913
; LINE_WIDTH: 0.505842
G1 X124.151 Y129.365 E.00406
; LINE_WIDTH: 0.555838
G1 X124.19 Y129.466 E.0045
; LINE_WIDTH: 0.556706
G1 X124.225 Y129.436 E.00192
; LINE_WIDTH: 0.508434
G1 X124.259 Y129.407 E.00174
; LINE_WIDTH: 0.460162
G1 X124.294 Y129.377 E.00156
; LINE_WIDTH: 0.41189
G1 X124.329 Y129.347 E.00138
; LINE_WIDTH: 0.363618
G1 X124.364 Y129.318 E.0012
; LINE_WIDTH: 0.315346
G1 X124.399 Y129.288 E.00102
; LINE_WIDTH: 0.267073
G1 X124.434 Y129.258 E.00084
M204 S10000
G1 X124.19 Y129.466 F42000
; LINE_WIDTH: 0.580843
G1 F2747
M204 S6000
G1 X125.491 Y139.35 E.437
; LINE_WIDTH: 0.556714
G1 X125.532 Y139.37 E.00192
; LINE_WIDTH: 0.508436
G1 X125.574 Y139.389 E.00174
; LINE_WIDTH: 0.460159
G1 X125.615 Y139.409 E.00156
; LINE_WIDTH: 0.411882
G1 X125.656 Y139.428 E.00138
; LINE_WIDTH: 0.363604
G1 X125.698 Y139.448 E.0012
; LINE_WIDTH: 0.315327
G1 X125.739 Y139.468 E.00102
; LINE_WIDTH: 0.267049
G1 X125.78 Y139.487 E.00084
M204 S10000
G1 X125.491 Y139.35 F42000
; LINE_WIDTH: 0.564187
G1 F2747
M204 S6000
G1 X125.484 Y139.421 E.00305
; LINE_WIDTH: 0.530852
G1 X125.476 Y139.493 E.00285
; LINE_WIDTH: 0.481559
G1 X125.469 Y139.564 E.00256
G1 X125.679 Y141.165 E.05771
; CHANGE_LAYER
; Z_HEIGHT: 13.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F8207.213
G1 X125.469 Y139.564 E-.72767
G1 X125.476 Y139.493 E-.03233
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 68/73
; update layer progress
M73 L68
M991 S0 P67 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z13.8 I1.13 J.451 P1  F42000
G1 X129.889 Y128.438 Z13.8
G1 Z13.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2998
M204 S5000
G1 X131.262 Y138.868 E.32325
G1 X125.988 Y139.562 E.16347
G1 X124.615 Y129.132 E.32325
G1 X128.062 Y128.678 E.10683
G1 X129.83 Y128.446 E.0548
M204 S250
G1 X129.971 Y128.296 F42000
G1 F2998
M204 S5000
G1 X124.499 Y129.016 E.16961
G1 X124.339 Y127.807 E.03749
G1 X124.839 Y127.741 E.01549
G1 X129.812 Y127.086 E.15412
G1 X129.964 Y128.236 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.984 Y128.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.59 Y136.023 Z14 F42000
G1 X125.906 Y139.704 Z14
G1 Z13.6
G1 E.8 F1800
G1 F2998
M204 S5000
G1 X126.406 Y139.638 E.01549
G1 X131.378 Y138.984 E.15412
G1 X131.538 Y140.193 E.03749
G1 X126.065 Y140.914 E.16961
G1 X125.914 Y139.764 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.406 Y139.638 E-.19295
G1 X127.885 Y139.444 E-.56705
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.2 Y131.925 Z14 F42000
G1 X130.197 Y126.23 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2998
M204 S6000
G1 X124.467 Y126.984 E.19169
G1 X125.981 Y115.485 E.38472
G1 X131.515 Y116.213 E.18516
G1 X130.204 Y126.17 E.33316
; WIPE_START
G1 F8843.478
G1 X128.224 Y126.451 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.458 Y127.362 Z14 F42000
G1 Z13.6
G1 E.8 F1800
G1 F2998
M204 S6000
G1 X130.244 Y127.362 E.0071
G1 X130.15 Y126.646 E.02395
G1 X124.021 Y127.453 E.20504
G3 X124.083 Y126.783 I7.698 J.373 E.02233
G1 X125.631 Y115.029 E.39328
G1 X131.972 Y115.862 E.21216
M73 P93 R1
G1 X130.466 Y127.303 E.38278
; WIPE_START
G1 F8843.478
G1 X130.244 Y127.362 E-.08734
G1 X130.15 Y126.646 E-.27437
G1 X129.111 Y126.783 E-.3983
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.911 Y134.2 Z14 F42000
G1 X132.386 Y140.28 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2998
M204 S5000
G3 X132.228 Y140.5 I-.192 J.028 E.00921
G1 X125.49 Y141.387 E.20883
G3 X125.268 Y141.217 I-.028 J-.193 E.00959
G1 X123.694 Y129.264 E.37045
G3 X123.694 Y126.736 I10.795 J-1.264 E.07786
G1 X125.267 Y114.785 E.37038
G3 X125.463 Y114.611 I.201 J.028 E.00876
G1 X132.23 Y115.501 E.20973
G3 X132.386 Y115.723 I-.038 J.193 E.0092
G1 X130.812 Y127.68 E.37059
G2 X130.812 Y128.322 I3.37 J.32 E.01976
G1 X132.378 Y140.221 E.36876
; WIPE_START
G1 F9547.055
M204 S6000
G1 X132.383 Y140.355 E-.05097
G1 X132.342 Y140.437 E-.03499
G1 X132.228 Y140.5 E-.04949
G1 X130.598 Y140.714 E-.62455
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z14
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z14 F4000
            G39.3 S1
            G0 Z14 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X131.975 Y140.335 F42000
G1 Z13.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.480849
G1 F2998
M204 S6000
G1 X131.764 Y138.735 E.0576
; LINE_WIDTH: 0.505843
G1 X131.726 Y138.635 E.00406
; LINE_WIDTH: 0.555836
G1 X131.687 Y138.534 E.0045
; LINE_WIDTH: 0.556707
G1 X131.653 Y138.564 E.00192
; LINE_WIDTH: 0.508428
G1 X131.618 Y138.593 E.00174
; LINE_WIDTH: 0.460148
G1 X131.583 Y138.623 E.00156
; LINE_WIDTH: 0.411869
G1 X131.548 Y138.653 E.00138
; LINE_WIDTH: 0.36359
G1 X131.513 Y138.682 E.0012
; LINE_WIDTH: 0.315311
G1 X131.478 Y138.712 E.00102
; LINE_WIDTH: 0.267032
G1 X131.443 Y138.742 E.00084
M204 S10000
G1 X131.687 Y138.534 F42000
; LINE_WIDTH: 0.580722
G1 F2998
M204 S6000
G1 X130.386 Y128.65 E.4369
G1 X130.394 Y128.579 E.00314
; LINE_WIDTH: 0.53085
G1 X130.401 Y128.507 E.00285
; LINE_WIDTH: 0.497514
G1 X130.408 Y128.436 E.00266
; LINE_WIDTH: 0.488349
G1 X130.365 Y128.014 E.0154
; LINE_WIDTH: 0.527588
G1 X130.349 Y127.558 E.01801
; WIPE_START
G1 F7427.763
G1 X130.365 Y128.014 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.849 Y123.314 Z14 F42000
G1 Z13.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2998
M204 S6000
G1 X130.061 Y121.699 E.05401
G1 X129.887 Y121.449 E.01013
G1 X129.72 Y120.793 E.02243
G3 X130.295 Y119.923 I1.041 J.063 E.03624
G1 X130.662 Y117.139 E.09316
G3 X130.287 Y116.783 I.505 J-.908 E.01733
G1 X127.222 Y116.38 E.10252
G2 X127.379 Y117.518 I.824 J.466 E.04093
G1 X128.279 Y118.173 E.03692
G3 X128.865 Y119.811 I-1.503 J1.462 E.05951
G1 X128.621 Y120.138 E.01356
G1 X127.721 Y120.793 E.03692
G2 X127.135 Y122.431 I1.503 J1.462 E.05951
G1 X127.379 Y122.759 E.01356
G1 X128.279 Y123.414 E.03692
G3 X128.865 Y125.052 I-1.503 J1.462 E.05951
G3 X128.075 Y125.777 I-1.566 J-.913 E.03613
G1 X125.31 Y126.141 E.0925
G1 X125.48 Y124.854 E.04306
G1 X125.658 Y124.724 E.00733
G2 X126.245 Y123.086 I-1.503 J-1.462 E.05951
G2 X125.777 Y122.596 I-1.025 J.51 E.02282
G1 X125.989 Y120.982 E.05401
M204 S10000
G1 X125.094 Y126.536 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.396875
G1 F2998
M204 S6000
G1 X125.014 Y126.527 E.00233
; LINE_WIDTH: 0.415482
G1 X124.934 Y126.518 E.00246
G1 X124.916 Y126.357 E.00491
; LINE_WIDTH: 0.383262
G1 X126.273 Y116.05 E.28832
G1 X126.317 Y115.923 E.00373
G1 X126.451 Y115.913 E.00373
G1 X130.951 Y116.504 E.12585
G1 X131.078 Y116.548 E.00374
G3 X131.088 Y116.683 I-.322 J.091 E.00376
G1 X129.889 Y125.785 E.25462
G1 X129.857 Y125.89 E.00304
G1 X129.752 Y125.922 E.00304
G1 X125.154 Y126.528 E.12863
; WIPE_START
G1 F10577.604
G1 X127.137 Y126.267 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.968 Y127.658 Z14 F42000
G1 Z13.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.387809
G1 F2998
M204 S6000
G1 X123.986 Y128 E.00962
; LINE_WIDTH: 0.423314
G1 X124.017 Y128.404 E.01256
; LINE_WIDTH: 0.467587
G2 X124.106 Y129.214 I18.606 J-1.629 E.02821
; LINE_WIDTH: 0.497816
G2 X124.151 Y129.365 I.339 J-.019 E.0059
; LINE_WIDTH: 0.555855
G1 X124.19 Y129.466 E.0045
; LINE_WIDTH: 0.556715
G1 X124.225 Y129.436 E.00192
; LINE_WIDTH: 0.508431
G1 X124.259 Y129.407 E.00174
; LINE_WIDTH: 0.460147
G1 X124.294 Y129.377 E.00156
; LINE_WIDTH: 0.411863
G1 X124.329 Y129.347 E.00138
; LINE_WIDTH: 0.36358
G1 X124.364 Y129.318 E.0012
; LINE_WIDTH: 0.315296
G1 X124.399 Y129.288 E.00102
; LINE_WIDTH: 0.267012
G1 X124.434 Y129.258 E.00084
M204 S10000
G1 X124.19 Y129.466 F42000
; LINE_WIDTH: 0.580842
G1 F2998
M204 S6000
G1 X125.491 Y139.35 E.437
; LINE_WIDTH: 0.564187
G1 X125.484 Y139.421 E.00305
; LINE_WIDTH: 0.530853
G1 X125.476 Y139.493 E.00285
; LINE_WIDTH: 0.481559
G1 X125.469 Y139.564 E.00256
G1 X125.679 Y141.165 E.05771
M204 S10000
G1 X125.78 Y139.487 F42000
; LINE_WIDTH: 0.267049
G1 F2998
M204 S6000
G1 X125.739 Y139.468 E.00084
; LINE_WIDTH: 0.315327
G1 X125.698 Y139.448 E.00102
; LINE_WIDTH: 0.363604
G1 X125.656 Y139.428 E.0012
; LINE_WIDTH: 0.411882
G1 X125.615 Y139.409 E.00138
; LINE_WIDTH: 0.460159
G1 X125.574 Y139.389 E.00156
; LINE_WIDTH: 0.508436
G1 X125.532 Y139.37 E.00174
; LINE_WIDTH: 0.556714
G1 X125.491 Y139.35 E.00192
; CHANGE_LAYER
; Z_HEIGHT: 13.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7006.708
G1 X125.532 Y139.37 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 69/73
; update layer progress
M73 L69
M991 S0 P68 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z14 I1.13 J.451 P1  F42000
G1 X129.889 Y128.438 Z14
G1 Z13.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4126
M204 S5000
G1 X131.262 Y138.868 E.32325
G1 X125.988 Y139.562 E.16347
G1 X124.615 Y129.132 E.32325
G1 X128.781 Y128.584 E.12913
G1 X129.83 Y128.446 E.03249
M204 S250
G1 X129.971 Y128.296 F42000
G1 F4126
M204 S5000
G1 X124.499 Y129.016 E.16961
G1 X124.339 Y127.807 E.03749
G1 X124.645 Y127.767 E.00947
G1 X129.812 Y127.086 E.16015
G1 X129.964 Y128.236 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.984 Y128.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.59 Y136.023 Z14.2 F42000
G1 X125.906 Y139.704 Z14.2
G1 Z13.8
G1 E.8 F1800
G1 F4126
M204 S5000
G1 X126.211 Y139.664 E.00947
G1 X131.378 Y138.984 E.16015
G1 X131.538 Y140.193 E.03749
G1 X126.065 Y140.914 E.16961
G1 X125.914 Y139.764 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.211 Y139.664 E-.11926
G1 X127.883 Y139.444 E-.64074
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.199 Y131.926 Z14.2 F42000
G1 X130.197 Y126.23 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4126
M204 S6000
G1 X124.467 Y126.984 E.19169
G1 X125.981 Y115.485 E.38472
G1 X131.515 Y116.213 E.18516
G1 X130.205 Y126.17 E.33316
; WIPE_START
G1 F8843.478
G1 X128.224 Y126.451 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.458 Y127.362 Z14.2 F42000
G1 Z13.8
G1 E.8 F1800
G1 F4126
M204 S6000
G1 X130.244 Y127.362 E.0071
G1 X130.15 Y126.646 E.02395
G1 X124.021 Y127.453 E.20504
G3 X124.083 Y126.783 I7.697 J.373 E.02234
G1 X125.631 Y115.029 E.39328
G1 X131.972 Y115.862 E.21216
G1 X130.466 Y127.303 E.38278
; WIPE_START
G1 F8843.478
G1 X130.244 Y127.362 E-.08734
G1 X130.15 Y126.646 E-.27438
G1 X129.111 Y126.783 E-.39829
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.911 Y134.2 Z14.2 F42000
G1 X132.386 Y140.28 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4126
M204 S5000
G3 X132.228 Y140.5 I-.19 J.03 E.00924
G1 X125.489 Y141.387 E.20884
G3 X125.268 Y141.217 I-.028 J-.193 E.00958
G1 X123.694 Y129.264 E.37046
G3 X123.694 Y126.736 I10.795 J-1.264 E.07785
G1 X125.267 Y114.786 E.37037
G3 X125.463 Y114.611 I.197 J.024 E.00881
G1 X132.23 Y115.501 E.20973
G1 X132.275 Y115.514 E.00142
G3 X132.386 Y115.722 I-.087 J.18 E.00777
G1 X130.812 Y127.68 E.3706
G2 X130.812 Y128.32 I2.805 J.32 E.0197
G1 X132.378 Y140.221 E.36883
; WIPE_START
G1 F9547.055
M204 S6000
G1 X132.383 Y140.355 E-.051
G1 X132.358 Y140.415 E-.02469
G1 X132.294 Y140.476 E-.034
G1 X132.228 Y140.5 E-.02653
G1 X130.6 Y140.714 E-.62377
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z14.2
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z14.2 F4000
            G39.3 S1
            G0 Z14.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X131.975 Y140.335 F42000
G1 Z13.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.480849
G1 F4126
M204 S6000
G1 X131.764 Y138.735 E.0576
; LINE_WIDTH: 0.505843
G1 X131.726 Y138.635 E.00406
; LINE_WIDTH: 0.555836
G1 X131.687 Y138.534 E.0045
M204 S10000
G1 X131.443 Y138.742 F42000
; LINE_WIDTH: 0.267032
M73 P94 R1
G1 F4126
M204 S6000
G1 X131.478 Y138.712 E.00084
; LINE_WIDTH: 0.315311
G1 X131.513 Y138.682 E.00102
; LINE_WIDTH: 0.36359
G1 X131.548 Y138.653 E.0012
; LINE_WIDTH: 0.411869
G1 X131.583 Y138.623 E.00138
; LINE_WIDTH: 0.460149
G1 X131.618 Y138.593 E.00156
; LINE_WIDTH: 0.508428
G1 X131.653 Y138.564 E.00174
; LINE_WIDTH: 0.556707
G1 X131.687 Y138.534 E.00192
; LINE_WIDTH: 0.580579
G1 X130.386 Y128.65 E.43678
G1 X130.397 Y128.543 E.00471
; LINE_WIDTH: 0.505858
G1 X130.408 Y128.436 E.00406
; LINE_WIDTH: 0.484588
G1 X130.375 Y128.141 E.01069
; LINE_WIDTH: 0.520893
G1 X130.349 Y127.558 E.02271
; WIPE_START
G1 F7531.809
G1 X130.375 Y128.141 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.387 Y120.509 Z14.2 F42000
G1 X130.393 Y116.234 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40424
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X131.035 Y117.028 E.0534
G1 X130.953 Y117.65 E.03278
G1 X129.925 Y116.376 E.08559
G1 X129.271 Y116.291 E.03446
G1 X130.872 Y118.271 E.13315
G1 X130.79 Y118.893 E.03278
G1 X128.618 Y116.205 E.1807
G1 X127.965 Y116.119 E.03446
G1 X130.708 Y119.514 E.22825
G1 X130.626 Y120.136 E.03278
G1 X127.311 Y116.033 E.27581
G1 X126.658 Y115.947 E.03446
G1 X130.544 Y120.757 E.32336
G1 X130.462 Y121.379 E.03278
G1 X126.263 Y116.181 E.34945
G1 X126.181 Y116.802 E.03278
G1 X130.381 Y122 E.34945
G1 X130.299 Y122.622 E.03278
G1 X126.099 Y117.424 E.34945
G1 X126.017 Y118.045 E.03278
G1 X130.217 Y123.243 E.34945
G1 X130.135 Y123.865 E.03278
G1 X125.935 Y118.667 E.34945
G1 X125.854 Y119.288 E.03278
G1 X130.053 Y124.486 E.34945
G1 X129.971 Y125.108 E.03278
G1 X125.772 Y119.91 E.34945
G1 X125.69 Y120.531 E.03278
G1 X129.89 Y125.729 E.34945
G1 X129.867 Y125.9 E.009
G1 X129.484 Y125.951 E.0202
G1 X125.608 Y121.153 E.32253
G1 X125.526 Y121.774 E.03278
G1 X128.956 Y126.02 E.28542
G1 X128.429 Y126.09 E.02784
G1 X125.444 Y122.396 E.24831
G1 X125.363 Y123.017 E.03278
G1 X127.901 Y126.159 E.2112
G1 X127.373 Y126.228 E.02784
G1 X125.281 Y123.639 E.17409
G1 X125.199 Y124.26 E.03278
G1 X126.845 Y126.298 E.13697
G1 X126.317 Y126.367 E.02784
G1 X125.117 Y124.882 E.09986
G1 X125.035 Y125.503 E.03278
G1 X125.789 Y126.437 E.06275
G1 X125.262 Y126.506 E.02784
G1 X124.778 Y125.908 E.04026
M106 S201.45
; WIPE_START
G1 X125.262 Y126.506 E-.29255
G1 X125.789 Y126.437 E-.2023
G1 X125.351 Y125.894 E-.26515
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.968 Y127.658 Z14.2 F42000
G1 Z13.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.3878
; LAYER_HEIGHT: 0.2
G1 F4126
M204 S6000
G1 X123.986 Y128 E.00961
; LINE_WIDTH: 0.423325
G1 X124.017 Y128.404 E.01258
; LINE_WIDTH: 0.467592
G2 X124.106 Y129.214 I18.572 J-1.625 E.0282
; LINE_WIDTH: 0.497796
G2 X124.151 Y129.365 I.339 J-.019 E.0059
; LINE_WIDTH: 0.555836
G1 X124.19 Y129.466 E.0045
; LINE_WIDTH: 0.556707
G1 X124.225 Y129.436 E.00192
; LINE_WIDTH: 0.508428
G1 X124.259 Y129.407 E.00174
; LINE_WIDTH: 0.460149
G1 X124.294 Y129.377 E.00156
; LINE_WIDTH: 0.411869
G1 X124.329 Y129.347 E.00138
; LINE_WIDTH: 0.36359
G1 X124.364 Y129.318 E.0012
; LINE_WIDTH: 0.315311
G1 X124.399 Y129.288 E.00102
; LINE_WIDTH: 0.267032
G1 X124.434 Y129.258 E.00084
M204 S10000
G1 X124.19 Y129.466 F42000
; LINE_WIDTH: 0.580842
G1 F4126
M204 S6000
G1 X125.491 Y139.35 E.437
; LINE_WIDTH: 0.55671
G1 X125.532 Y139.37 E.00192
; LINE_WIDTH: 0.508429
G1 X125.574 Y139.389 E.00174
; LINE_WIDTH: 0.460149
G1 X125.615 Y139.409 E.00156
; LINE_WIDTH: 0.411869
G1 X125.656 Y139.428 E.00138
; LINE_WIDTH: 0.363589
G1 X125.698 Y139.448 E.0012
; LINE_WIDTH: 0.315309
G1 X125.739 Y139.468 E.00102
; LINE_WIDTH: 0.267028
G1 X125.78 Y139.487 E.00084
M204 S10000
G1 X125.491 Y139.35 F42000
; LINE_WIDTH: 0.564187
G1 F4126
M204 S6000
G1 X125.484 Y139.421 E.00305
; LINE_WIDTH: 0.530853
G1 X125.476 Y139.493 E.00285
; LINE_WIDTH: 0.481559
G1 X125.469 Y139.564 E.00256
G1 X125.679 Y141.165 E.05771
; CHANGE_LAYER
; Z_HEIGHT: 14
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8207.213
G1 X125.469 Y139.564 E-.72767
G1 X125.476 Y139.493 E-.03233
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 70/73
; update layer progress
M73 L70
M991 S0 P69 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z14.2 I1.13 J.451 P1  F42000
G1 X129.889 Y128.438 Z14.2
G1 Z14
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4754
M204 S5000
G1 X131.262 Y138.868 E.32325
G1 X125.988 Y139.562 E.16347
G1 X124.615 Y129.132 E.32325
G1 X129.501 Y128.489 E.15144
G1 X129.83 Y128.446 E.01019
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.102 Y130.427 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.096 Y137.994 Z14.4 F42000
G1 X131.262 Y139.263 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M106 S255
G1 F1320
M204 S6000
G1 X131.385 Y139.247 E.00412
M106 S201.45
G1 F4702.91
G1 X131.847 Y139.186 E.01544
G1 F4754
G1 X131.899 Y139.583 E.01327
G1 X131.971 Y140.132 E.01836
G1 X125.63 Y140.967 E.21216
G1 X125.558 Y140.418 E.01837
G1 X125.506 Y140.021 E.01327
G1 F4702.734
G1 X125.967 Y139.96 E.01544
M106 S255
G1 F1320
G1 X131.203 Y139.271 E.17518
M106 S201.45
; WIPE_START
G1 X131.385 Y139.247 E-.06996
G1 X131.847 Y139.186 E-.17686
G1 X131.899 Y139.583 E-.152
G1 X131.971 Y140.132 E-.21029
G1 X131.578 Y140.183 E-.15089
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.497 Y132.628 Z14.4 F42000
G1 X129.785 Y127.646 Z14.4
G1 Z14
G1 E.8 F1800
M106 S255
M204 S6000
G1 X129.478 Y127.686 E.01028
M106 S201.45
; FEATURE: Overhang wall
M106 S255
G1 F600
M204 S5000
G1 X124.818 Y128.299 E.15591
M106 S201.45
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X124.439 Y128.349 E.01269
M106 S201.45
G1 F3245.208
G1 X124.418 Y128.352 E.00068
G1 X124.414 Y128.163 E.00628
G1 F4660.132
G1 X124.41 Y128 E.00541
G1 F4754
G1 X124.414 Y127.825 E.00581
G1 X124.446 Y127.227 E.01985
G3 X124.487 Y126.832 I9.528 J.803 E.01319
G1 X125.981 Y115.49 E.37948
G1 X131.515 Y116.219 E.18516
G1 X130.119 Y126.822 E.35476
G1 X130.066 Y127.219 E.01327
G1 X130.014 Y127.615 E.01327
G1 F2854.521
G1 X129.857 Y127.636 E.00527
M106 S255
G1 F1800
G1 X129.844 Y127.638 E.00042
M106 S201.45
M204 S10000
G1 X130.399 Y127.975 F42000
G1 F4754
M204 S6000
G1 X129.91 Y128.04 E.01637
M106 S255
G1 F1320
G1 X124.492 Y128.753 E.18128
M106 S201.45
G1 F4620.86
G1 X124.039 Y128.813 E.01515
G1 F4754
G1 X124.013 Y128.404 E.01356
G3 X124.083 Y126.783 I9.67 J-.396 E.0539
G1 X125.63 Y115.033 E.39312
G1 X131.971 Y115.868 E.21216
G1 X130.422 Y127.637 E.39377
G2 X130.4 Y127.915 I2.611 J.344 E.00925
M204 S250
G1 X130.811 Y128.31 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4754
M204 S5000
G1 X130.812 Y128.32 E.00031
G1 X132.384 Y140.263 E.37016
G3 X132.228 Y140.493 I-.193 J.037 E.00949
G1 X125.489 Y141.381 E.20885
G3 X125.266 Y141.204 I-.029 J-.192 E.0098
G1 X123.694 Y129.264 E.37005
G3 X123.694 Y126.736 I10.795 J-1.264 E.07785
G1 X125.266 Y114.796 E.37006
G3 X125.488 Y114.619 I.194 J.016 E.00976
G1 X132.229 Y115.507 E.20894
G3 X132.384 Y115.735 I-.038 J.193 E.00938
G1 X130.812 Y127.68 E.37022
G2 X130.794 Y128 I2.796 J.32 E.00985
G1 X130.808 Y128.25 E.00769
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.812 Y128.32 E-.02665
G1 X131.064 Y130.233 E-.73335
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z14.4
M73 P94 R0
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z14.4 F4000
            G39.3 S1
            G0 Z14.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X130.325 Y128.183 F42000
G1 Z14
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.580844
G1 F4754
M204 S6000
G1 X131.749 Y139.001 E.47831
M204 S10000
G1 X131.707 Y139.685 F42000
; LINE_WIDTH: 0.589463
G1 F4754
M204 S6000
G1 X125.77 Y140.467 E.26672
M204 S10000
G1 X125.552 Y139.817 F42000
; LINE_WIDTH: 0.580824
G1 F4754
M204 S6000
G1 X124.128 Y128.999 E.47829
; WIPE_START
G1 F6692.648
G1 X124.389 Y130.982 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.582 Y127.965 Z14.4 F42000
G1 Z14
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.47845
M106 S255
G1 F3000
M204 S6000
G1 X129.721 Y127.288 E.18396
G1 X129.78 Y126.841 E.016
G1 X124.763 Y127.502 E.17958
G1 X124.802 Y127.057 E.01583
G1 X129.839 Y126.394 E.18029
G1 X129.898 Y125.947 E.016
G1 X124.853 Y126.611 E.1806
G1 X124.911 Y126.164 E.016
G1 X130.131 Y125.477 E.18683
M106 S201.45
M204 S10000
G1 X129.368 Y125.168 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F4754
M204 S6000
G3 X129.936 Y125.206 I.177 J1.579 E.01757
G1 X131.075 Y116.556 E.26808
G1 X126.318 Y115.93 E.14741
G1 X125.027 Y125.739 E.30401
G1 X129.309 Y125.176 E.13271
M204 S10000
G1 X129.319 Y124.794 F42000
G1 F4754
M204 S6000
G1 X129.611 Y124.783 E.00898
G1 X130.652 Y116.881 E.2449
G1 X126.643 Y116.353 E.12424
G1 X125.465 Y125.301 E.27733
G1 X129.26 Y124.802 E.11761
M204 S10000
G1 X127.624 Y123.142 F42000
; LINE_WIDTH: 0.36784
G1 F4754
M204 S6000
G1 X127.958 Y123.098 E.00891
G1 X128.566 Y118.482 E.12328
G1 X128.243 Y118.439 E.0086
G1 X127.632 Y123.082 E.124
M204 S10000
G1 X127.217 Y123.549 F42000
; LINE_WIDTH: 0.41999
G1 F4754
M204 S6000
G1 X128.271 Y123.411 E.03267
G1 X128.959 Y118.179 E.16212
G1 X127.941 Y118.045 E.03155
G1 X127.225 Y123.49 E.16874
M204 S10000
G1 X126.779 Y123.987 F42000
G1 F4754
M204 S6000
G1 X128.607 Y123.747 E.05666
G1 X129.382 Y117.855 E.1826
G1 X127.617 Y117.622 E.05473
G1 X126.787 Y123.928 E.19542
M204 S10000
G1 X126.341 Y124.425 F42000
G1 F4754
M204 S6000
G1 X128.943 Y124.083 E.08065
G1 X129.806 Y117.53 E.20307
M73 P95 R0
G1 X127.292 Y117.199 E.0779
G1 X126.349 Y124.366 E.22211
M204 S10000
G1 X125.903 Y124.863 F42000
G1 F4754
M204 S6000
G1 X129.28 Y124.41 E.10471
G1 X130.229 Y117.206 E.22327
G1 X126.967 Y116.776 E.10107
G1 X125.911 Y124.804 E.2488
; CHANGE_LAYER
; Z_HEIGHT: 14.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X126.172 Y122.821 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 71/73
; update layer progress
M73 L71
M991 S0 P70 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z14.4 I-1.031 J.646 P1  F42000
G1 X129.623 Y128.33 Z14.4
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4752
M204 S6000
G1 X130.012 Y128.278 E.01301
G1 X131.422 Y138.99 E.35839
G1 X125.866 Y139.722 E.1859
G1 X124.455 Y129.01 E.35839
G1 X128.408 Y128.49 E.13225
G1 X129.563 Y128.337 E.03866
M204 S250
G1 X129.674 Y128.718 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1560
M204 S5000
G1 X130.982 Y138.653 E.30789
G1 X126.203 Y139.282 E.14811
G1 X124.895 Y129.347 E.30789
G1 X128.459 Y128.878 E.11045
G1 X129.614 Y128.726 E.03581
M106 S201.45
; WIPE_START
M204 S6000
G1 X129.887 Y130.707 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.25 Y138.217 Z14.6 F42000
G1 X131.464 Y139.395 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4752
M204 S6000
G1 X131.508 Y139.73 E.01119
G1 X125.974 Y140.458 E.18514
G1 X125.93 Y140.124 E.0112
G1 X131.404 Y139.403 E.18315
; WIPE_START
G1 F8843.478
G1 X131.508 Y139.73 E-.13017
G1 X129.865 Y139.946 E-.62984
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.393 Y132.332 Z14.6 F42000
G1 X131.508 Y116.271 Z14.6
G1 Z14.2
G1 E.8 F1800
G1 F4752
M204 S6000
G1 X130.019 Y127.583 E.37848
G2 X129.997 Y127.87 I2.168 J.31 E.00956
G1 X124.433 Y128.602 E.18615
G3 X124.487 Y126.832 I9.064 J-.607 E.05884
G1 X125.974 Y115.542 E.37773
G1 X131.448 Y116.263 E.18315
M204 S10000
G1 X131.965 Y115.92 F42000
G1 F4752
M204 S6000
G1 X130.423 Y127.631 E.39183
G2 X130.422 Y128.362 I3.848 J.37 E.02429
G1 X131.965 Y140.08 E.39205
G1 X125.624 Y140.915 E.21215
G1 X124.083 Y129.217 E.3914
G3 X124.083 Y126.783 I10.362 J-1.217 E.08092
G1 X125.624 Y115.086 E.39138
G1 X131.905 Y115.912 E.21016
M204 S250
G1 X132.376 Y115.729 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4752
M204 S5000
G3 X132.369 Y115.854 I-.236 J.049 E.00388
G1 X130.812 Y127.678 E.36645
G2 X130.812 Y128.32 I3.323 J.323 E.01976
G1 X132.368 Y140.14 E.36635
G3 X132.219 Y140.442 I-.215 J.082 E.0116
G1 X125.482 Y141.329 E.20879
G3 X125.254 Y141.11 I-.014 J-.214 E.01095
G1 X123.694 Y129.264 E.36712
G3 X123.694 Y126.736 I10.794 J-1.264 E.07785
G1 X125.254 Y114.891 E.36712
G3 X125.468 Y114.67 I.225 J.004 E.01042
G1 X132.222 Y115.559 E.20931
G1 X132.263 Y115.571 E.00131
G3 X132.356 Y115.672 I-.123 J.207 E.00429
; WIPE_START
G1 F9547.055
M204 S6000
G1 X132.369 Y115.854 E-.06911
G1 X132.131 Y117.656 E-.69089
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z14.6
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z14.6 F4000
            G39.3 S1
            G0 Z14.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X127.638 Y125.529 F42000
G1 Z14.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.367724
G1 F4752
M204 S6000
G1 X128.559 Y118.533 E.18676
G1 X128.237 Y118.491 E.0086
G1 X127.304 Y125.573 E.18906
G1 X127.578 Y125.537 E.00731
M204 S10000
G1 X127.951 Y125.842 F42000
; LINE_WIDTH: 0.41999
G1 F4752
M204 S6000
G1 X128.953 Y118.231 E.23587
G1 X127.935 Y118.097 E.03154
G1 X126.897 Y125.981 E.24432
G1 X127.891 Y125.85 E.03082
M204 S10000
G1 X128.287 Y126.178 F42000
G1 F4752
M204 S6000
G1 X129.376 Y117.907 E.25635
G1 X127.61 Y117.674 E.05471
G1 X126.459 Y126.419 E.27101
G1 X128.227 Y126.186 E.05481
M204 S10000
G1 X128.623 Y126.514 F42000
G1 F4752
M204 S6000
G1 X129.799 Y117.582 E.27682
G1 X127.286 Y117.251 E.07788
G1 X126.021 Y126.857 E.29769
G1 X128.563 Y126.522 E.0788
M204 S10000
G1 X128.959 Y126.85 F42000
G1 F4752
M204 S6000
G1 X130.222 Y117.257 E.2973
G1 X126.961 Y116.828 E.10106
G1 X125.627 Y126.957 E.31391
G1 X125.598 Y127.293 E.01036
G1 X128.899 Y126.858 E.10233
M204 S10000
G1 X129.295 Y127.186 F42000
G1 F4752
M204 S6000
G1 X130.645 Y116.933 E.31778
G1 X126.636 Y116.405 E.12423
G1 X125.252 Y126.916 E.32574
G1 X125.189 Y127.727 E.025
G1 X129.235 Y127.194 E.12542
M204 S10000
G1 X129.631 Y127.522 F42000
G1 F4752
M204 S6000
G1 X131.068 Y116.608 E.33825
G1 X126.312 Y115.982 E.1474
G1 X124.877 Y126.875 E.33758
G2 X124.815 Y128.157 I6.673 J.967 E.03949
G1 X129.572 Y127.53 E.14741
; CHANGE_LAYER
; Z_HEIGHT: 14.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X127.589 Y127.791 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 72/73
; update layer progress
M73 L72
M991 S0 P71 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z14.6 I-.311 J1.176 P1  F42000
G1 X129.623 Y128.33 Z14.6
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3992
M204 S6000
G1 X130.012 Y128.278 E.01301
G1 X131.422 Y138.99 E.35839
G1 X125.866 Y139.722 E.1859
G1 X124.455 Y129.01 E.35839
G1 X127.066 Y128.666 E.08734
G1 X129.563 Y128.337 E.08357
M204 S250
G1 X129.674 Y128.718 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3992
M204 S5000
G1 X130.982 Y138.653 E.30789
G1 X126.203 Y139.282 E.14811
G1 X124.895 Y129.347 E.30789
G1 X127.117 Y129.055 E.06885
G1 X129.615 Y128.726 E.07741
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.887 Y130.707 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.731 Y123.122 Z14.8 F42000
G1 X131.48 Y116.385 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3992
M204 S6000
G1 X129.98 Y127.872 E.38427
G1 X124.446 Y128.601 E.18517
G3 X124.5 Y126.834 I9.055 J-.605 E.05874
G1 X125.971 Y115.661 E.37381
G1 X131.42 Y116.377 E.18231
M204 S10000
G1 X131.937 Y116.035 F42000
G1 F3992
M204 S6000
G1 X130.409 Y127.636 E.38815
G2 X130.409 Y128.365 I3.352 J.364 E.02423
G1 X131.937 Y139.965 E.38813
G1 X125.621 Y140.795 E.21131
G1 X124.096 Y129.215 E.38744
G3 X124.096 Y126.785 I10.647 J-1.215 E.0808
G1 X125.621 Y115.205 E.38745
G1 X131.877 Y116.027 E.20932
M204 S250
G1 X132.33 Y115.86 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3992
M204 S5000
G3 X132.322 Y116.111 I-.453 J.111 E.0078
G1 X130.799 Y127.678 E.35852
G2 X130.799 Y128.322 I2.879 J.322 E.01981
G1 X132.322 Y139.89 E.35851
G3 X132.251 Y140.305 I-.441 J.138 E.01346
G3 X132.201 Y140.326 I-.07 J-.098 E.00167
G1 X125.439 Y141.214 E.20955
G1 X125.375 Y141.19 E.00211
G3 X125.233 Y140.851 I.382 J-.359 E.01157
G1 X123.707 Y129.262 E.35915
G3 X123.707 Y126.738 I11.086 J-1.262 E.07774
G1 X125.232 Y115.154 E.359
G3 X125.385 Y114.803 I.506 J.012 E.01206
G1 X125.443 Y114.786 E.00185
G1 X132.204 Y115.674 E.20955
G1 X132.254 Y115.697 E.00169
G3 X132.312 Y115.803 I-.377 J.274 E.00371
; WIPE_START
G1 F9547.055
M204 S6000
G1 X132.322 Y116.111 E-.11694
G1 X132.101 Y117.788 E-.64306
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z14.8
G1 X0 Y128.001 F18000 ; move to safe pos
M73 P96 R0
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z14.8 F4000
            G39.3 S1
            G0 Z14.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X127.639 Y125.533 F42000
G1 Z14.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.358262
G1 F3992
M204 S6000
G1 X128.54 Y118.644 E.17853
G1 X128.229 Y118.603 E.00805
G1 X127.313 Y125.576 E.18071
G1 X127.579 Y125.541 E.0069
M204 S10000
G1 X127.948 Y125.842 F42000
; LINE_WIDTH: 0.41999
G1 F3992
M204 S6000
G1 X128.927 Y118.347 E.23227
G1 X127.932 Y118.216 E.03084
G1 X126.91 Y125.979 E.24059
G1 X127.889 Y125.85 E.03034
M204 S10000
G1 X128.285 Y126.178 F42000
G1 F3992
M204 S6000
G1 X129.35 Y118.022 E.25275
G1 X127.607 Y117.793 E.054
G1 X126.472 Y126.417 E.26728
G1 X128.225 Y126.186 E.05434
M204 S10000
G1 X128.621 Y126.514 F42000
G1 F3992
M204 S6000
G1 X129.772 Y117.697 E.27322
G1 X127.283 Y117.37 E.07716
G1 X126.034 Y126.855 E.29396
G1 X128.561 Y126.522 E.07834
M204 S10000
G1 X128.957 Y126.851 F42000
G1 F3992
M204 S6000
G1 X130.195 Y117.372 E.2937
G1 X126.958 Y116.947 E.10032
G1 X125.64 Y126.958 E.31027
G1 X125.611 Y127.291 E.01026
G1 X128.898 Y126.858 E.10188
M204 S10000
G1 X129.294 Y127.187 F42000
G1 F3992
M204 S6000
G1 X130.618 Y117.048 E.31417
G1 X126.633 Y116.524 E.12348
G1 X125.265 Y126.917 E.32211
G1 X125.201 Y127.725 E.0249
G1 X129.234 Y127.194 E.12499
M204 S10000
G1 X129.63 Y127.523 F42000
G1 F3992
M204 S6000
G1 X131.04 Y116.723 E.33465
G1 X126.309 Y116.101 E.14664
G1 X124.89 Y126.876 E.33394
G2 X124.828 Y128.155 I6.658 J.965 E.03939
G1 X129.571 Y127.53 E.14699
; WIPE_START
G1 F9547.299
G1 X127.588 Y127.791 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.103 Y134.998 Z14.8 F42000
G1 X131.667 Y139.479 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.668961
G1 F3992
M204 S6000
G1 X125.755 Y140.257 E.3042
; CHANGE_LAYER
; Z_HEIGHT: 14.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F5750.428
G1 X127.738 Y139.996 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 73/73
; update layer progress
M73 L73
M991 S0 P72 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z14.8 I1.199 J.206 P1  F42000
G1 X129.674 Y128.718 Z14.8
G1 Z14.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4549
M204 S5000
G1 X130.982 Y138.653 E.30789
G1 X126.203 Y139.282 E.14811
G1 X124.895 Y129.347 E.30789
G1 X125.775 Y129.232 E.02725
G1 X129.614 Y128.726 E.11901
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.887 Y130.707 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.061 Y123.166 Z15 F42000
G1 X132.186 Y115.938 Z15
G1 Z14.6
G1 E.8 F1800
G1 F4549
M204 S5000
G3 X132.2 Y116.1 I-.316 J.108 E.00505
G1 X130.677 Y127.662 E.35834
G2 X130.678 Y128.34 I3.505 J.337 E.02085
G1 X132.2 Y139.903 E.35837
G3 X132.154 Y140.093 I-.145 J.066 E.00648
G1 X125.432 Y140.977 E.20833
G1 X125.393 Y140.939 E.00169
G3 X125.35 Y140.805 I.345 J-.185 E.00435
G1 X123.828 Y129.246 E.35822
G3 X123.828 Y126.754 I9.734 J-1.246 E.07679
G1 X125.35 Y115.195 E.35822
G3 X125.436 Y115.023 I.195 J-.01 E.00619
G1 X132.14 Y115.905 E.20777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X132.2 Y116.1 E-.07756
G1 X131.965 Y117.881 E-.68244
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z15 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z15
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z15 F4000
            G39.3 S1
            G0 Z15 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X131.186 Y115.989 F42000
G1 Z14.6
G1 E.8 F1800
; FEATURE: Top surface
G1 F4549
M204 S2000
G1 X131.91 Y116.712 E.03144
G1 X131.848 Y117.183
G1 X130.572 Y115.908 E.05543
G1 X129.958 Y115.827
G1 X131.786 Y117.654 E.07941
G1 X131.724 Y118.126
G1 X129.344 Y115.746 E.1034
G1 X128.73 Y115.665
G1 X131.662 Y118.597 E.12739
G1 X131.6 Y119.068
G1 X128.116 Y115.585 E.15137
G1 X127.502 Y115.504
G1 X131.538 Y119.539 E.17536
G1 X131.476 Y120.011
G1 X126.888 Y115.423 E.19935
G1 X126.274 Y115.342
G1 X131.413 Y120.482 E.22333
G1 X131.351 Y120.953
G1 X125.66 Y115.262 E.24732
G1 X125.504 Y115.639
G1 X131.289 Y121.424 E.25141
G1 X131.227 Y121.895
G1 X125.442 Y116.11 E.25142
G1 X125.379 Y116.581
G1 X131.165 Y122.367 E.25142
G1 X131.103 Y122.838
G1 X125.317 Y117.052 E.25143
G1 X125.255 Y117.523
G1 X131.041 Y123.309 E.25143
G1 X130.979 Y123.78
G1 X125.193 Y117.994 E.25144
G1 X125.131 Y118.465
G1 X130.917 Y124.252 E.25144
G1 X130.855 Y124.723
G1 X125.069 Y118.936 E.25145
G1 X125.007 Y119.408
G1 X130.793 Y125.194 E.25145
G1 X130.731 Y125.665
G1 X124.944 Y119.879 E.25146
G1 X124.882 Y120.35
G1 X130.669 Y126.136 E.25146
G1 X130.607 Y126.608
G1 X124.82 Y120.821 E.25146
G1 X124.758 Y121.292
G1 X130.545 Y127.079 E.25147
G1 X130.483 Y127.55
G1 X124.696 Y121.763 E.25147
G1 X124.634 Y122.234
G1 X130.451 Y128.051 E.25278
G1 X130.508 Y128.642
G1 X124.572 Y122.705 E.25797
G1 X124.51 Y123.176
G1 X129.823 Y128.49 E.23088
G1 X129.351 Y128.552
G1 X124.447 Y123.648 E.2131
G1 X124.385 Y124.119
G1 X128.88 Y128.614 E.19533
G1 X128.409 Y128.676
G1 X124.323 Y124.59 E.17755
M73 P97 R0
G1 X124.261 Y125.061
G1 X127.938 Y128.738 E.15977
G1 X127.467 Y128.8
G1 X124.199 Y125.532 E.142
G1 X124.137 Y126.003
G1 X126.995 Y128.862 E.12422
G1 X126.524 Y128.924
G1 X124.075 Y126.474 E.10645
G1 X124.016 Y126.949
G1 X126.053 Y128.986 E.08852
G1 X125.582 Y129.048
G1 X123.979 Y127.445 E.06966
G1 X123.956 Y127.956
G1 X125.11 Y129.11 E.05016
G1 X124.667 Y129.199
G1 X123.977 Y128.509 E.02999
G1 X124.019 Y129.086
G1 X124.747 Y129.813 E.03163
G1 X124.828 Y130.428
G1 X124.097 Y129.696 E.03178
G1 X124.178 Y130.31
G1 X124.909 Y131.042 E.03178
G1 X124.99 Y131.656
G1 X124.259 Y130.924 E.03178
G1 X124.339 Y131.538
G1 X125.071 Y132.27 E.03178
G1 X125.152 Y132.884
G1 X124.42 Y132.153 E.03178
G1 X124.501 Y132.767
G1 X125.233 Y133.498 E.03178
G1 X125.313 Y134.112
G1 X124.582 Y133.381 E.03178
G1 X124.663 Y133.995
G1 X125.394 Y134.726 E.03178
G1 X125.475 Y135.34
G1 X124.744 Y134.609 E.03178
G1 X124.825 Y135.223
G1 X125.556 Y135.955 E.03178
G1 X125.637 Y136.569
G1 X124.905 Y135.837 E.03178
G1 X124.986 Y136.451
G1 X125.718 Y137.183 E.03178
G1 X125.798 Y137.797
G1 X125.067 Y137.065 E.03178
G1 X125.148 Y137.68
G1 X125.879 Y138.411 E.03178
G1 X125.96 Y139.025
G1 X125.229 Y138.294 E.03178
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.96 Y139.025 E-.39306
G1 X125.879 Y138.411 E-.23537
G1 X125.634 Y138.166 E-.13157
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.344 Y131.496 Z15 F42000
G1 X130.589 Y129.256 Z15
G1 Z14.6
G1 E.8 F1800
G1 F4549
M204 S2000
G1 X129.858 Y128.525 E.03178
G1 X129.939 Y129.139
G1 X130.67 Y129.87 E.03178
G1 X130.751 Y130.484
G1 X130.019 Y129.753 E.03178
G1 X130.1 Y130.367
G1 X130.832 Y131.098 E.03178
G1 X130.912 Y131.712
G1 X130.181 Y130.981 E.03178
G1 X130.262 Y131.595
G1 X130.993 Y132.327 E.03178
G1 X131.074 Y132.941
G1 X130.343 Y132.209 E.03178
G1 X130.424 Y132.823
G1 X131.155 Y133.555 E.03178
G1 X131.236 Y134.169
G1 X130.504 Y133.437 E.03178
G1 X130.585 Y134.052
G1 X131.317 Y134.783 E.03178
G1 X131.398 Y135.397
G1 X130.666 Y134.666 E.03178
G1 X130.747 Y135.28
G1 X131.478 Y136.011 E.03178
G1 X131.559 Y136.625
G1 X130.828 Y135.894 E.03178
G1 X130.909 Y136.508
G1 X131.64 Y137.239 E.03178
G1 X131.721 Y137.853
G1 X130.99 Y137.122 E.03178
G1 X131.07 Y137.736
G1 X131.802 Y138.468 E.03178
G1 X131.883 Y139.082
G1 X131.151 Y138.35 E.03178
G1 X131.112 Y138.845
G1 X131.963 Y139.696 E.03699
G1 X131.681 Y139.946
G1 X130.641 Y138.907 E.04518
G1 X130.17 Y138.969
G1 X131.21 Y140.008 E.04518
G1 X130.738 Y140.07
G1 X129.699 Y139.031 E.04518
G1 X129.227 Y139.093
G1 X130.267 Y140.132 E.04517
G1 X129.796 Y140.194
G1 X128.756 Y139.155 E.04517
G1 X128.285 Y139.217
G1 X129.324 Y140.256 E.04517
G1 X128.853 Y140.318
G1 X127.814 Y139.279 E.04517
G1 X127.342 Y139.341
G1 X128.382 Y140.38 E.04516
G1 X127.91 Y140.442
G1 X126.871 Y139.403 E.04516
G1 X126.4 Y139.465
G1 X127.439 Y140.504 E.04516
G1 X126.968 Y140.566
G1 X125.31 Y138.908 E.07206
G1 X125.39 Y139.522
G1 X126.497 Y140.628 E.04807
G1 X126.025 Y140.69
G1 X125.471 Y140.136 E.02408
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.025 Y140.69 E-.29775
G1 X126.497 Y140.628 E-.18063
G1 X125.973 Y140.104 E-.28162
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.436 Y132.88 Z15 F42000
G1 X129.973 Y128.374 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0924678
G1 F4549
M204 S6000
G1 X129.837 Y128.51 E.00078
; WIPE_START
G1 F15000
G1 X129.973 Y128.374 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.71 Y129.387 Z15 F42000
G1 Z14.6
G1 E.8 F1800
; LINE_WIDTH: 0.0724658
G1 F4549
M204 S6000
G1 X124.691 Y129.399 E.00006
; LINE_WIDTH: 0.128066
G1 X124.671 Y129.411 E.00016
G1 X124.582 Y129.284 E.00107
; WIPE_START
G1 F15000
G1 X124.671 Y129.411 E-.66153
G1 X124.691 Y129.399 E-.09847
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.483 Y127.571 Z15 F42000
G1 Z14.6
M73 P98 R0
G1 E.8 F1800
; LINE_WIDTH: 0.123182
G1 F4549
M204 S6000
G1 X130.404 Y127.737 E.00121
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F15000
G1 X130.483 Y127.571 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z15 I1.217 J0 P1  F42000
M106 S0
M981 S0 P20000 ; close spaghetti detector
; FEATURE: Custom
; MACHINE_END_GCODE_START
; filament end gcode 

;===== date: 20260513 =====================
G392 S0 ;turn off nozzle clog detect

M400 ; wait for buffer to clear
G92 E0 ; zero the extruder
G90
G1 Z15 F900 ; lower z a little
G1 X0 Y128.001 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos

M1002 judge_flag timelapse_record_flag
M622 J1
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M991 S0 P-1 ;end timelapse at safe pos
M623


M140 S0 ; turn off bed
M106 S0 ; turn off fan
M106 P2 S0 ; turn off remote part cooling fan
M106 P3 S0 ; turn off chamber cooling fan

;G1 X27 F15000 ; wipe

; pull back filament to AMS
M620 S255
G1 X267 F15000
T255
G1 X-28.5 F18000
G1 X-48.2 F3000
G1 X-28.5 F18000
G1 X-48.2 F3000
M621 S255

M104 S0 ; turn off hotend

M400 ; wait all motion done
M17 S
M17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom

    G1 Z114.6 F600
    G1 Z112.6

M400 P100
M17 R ; restore z current

G90
G1 X-48 Y180 F3600

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

;=====printer finish  sound=========
M17
M400 S1
M1006 S1
M1006 A0 B20 L100 C37 D20 M40 E42 F20 N60
M1006 A0 B10 L100 C44 D10 M60 E44 F10 N60
M1006 A0 B10 L100 C46 D10 M80 E46 F10 N80
M1006 A44 B20 L100 C39 D20 M60 E48 F20 N60
M1006 A0 B10 L100 C44 D10 M60 E44 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A0 B10 L100 C39 D10 M60 E39 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A0 B10 L100 C44 D10 M60 E44 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A0 B10 L100 C39 D10 M60 E39 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A0 B10 L100 C48 D10 M60 E44 F10 N80
M1006 A0 B10 L100 C0 D10 M60 E0 F10  N80
M1006 A44 B20 L100 C49 D20 M80 E41 F20 N80
M1006 A0 B20 L100 C0 D20 M60 E0 F20 N80
M1006 A0 B20 L100 C37 D20 M30 E37 F20 N60
M1006 W
;=====printer finish  sound=========

;M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power
M400
M18 X Y Z

M73 P100 R0
; EXECUTABLE_BLOCK_END

