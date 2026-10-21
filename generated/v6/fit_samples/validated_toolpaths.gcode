; HEADER_BLOCK_START
; BambuStudio 02.08.02.61
; model printing time: 15m 41s; total estimated time: 21m 58s
; total layer number: 73
; total filament length [mm] : 1481.97
; total filament volume [cm^3] : 3564.55
; total filament weight [g] : 4.42
; model label id: 394,405,416
; object max height: 14.60,14.60,14.60
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
M73 P0 R21
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
M73 P2 R21
G1 E-0.5 F300

G1 X-28.5 F30000
M73 P3 R21
G1 X-48.2 F3000
M73 P4 R20
G1 X-28.5 F30000 ;wipe and shake
M73 P5 R20
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
M73 P6 R20
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
M73 P7 R20
    G1 X-48.2 F3000
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
M73 P27 R16
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
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
M73 P27 R15
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
    G29 A1 X104.6 Y120.8 I46.8 J14.4
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
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M73 P28 R15
G1 X145.15 Y133.05 F42000
M204 S6000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X145.15 Y122.95 E.37619
G1 X150.05 Y122.95 E.18251
G1 X150.05 Y133.05 E.37619
G1 X145.21 Y133.05 E.18027
; WIPE_START
G1 X145.198 Y131.05 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X144.794 Y123.428 Z.6 F42000
G1 X144.718 Y121.995 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X150.482 Y121.996 E.21471
G1 X150.482 Y122.493 E.01852
G1 X144.718 Y122.493 E.21471
G1 X144.718 Y122.055 E.0163
; WIPE_START
G1 X146.718 Y122.035 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X145.407 Y129.554 Z.6 F42000
G1 X144.718 Y133.507 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X150.482 Y133.507 E.21471
G1 X150.482 Y134.002 E.01845
G1 X144.718 Y134.005 E.21471
G1 X144.718 Y133.567 E.0163
; WIPE_START
G1 X146.718 Y133.546 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X145.192 Y126.068 Z.6 F42000
G1 X144.269 Y121.538 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X144.687 Y121.538 E.01557
G1 X150.932 Y121.541 E.23262
G3 X150.939 Y121.609 I-.282 J.065 E.00258
G1 X150.939 Y134.391 E.47606
G3 X150.931 Y134.462 I-.325 J-.001 E.00268
G1 X144.269 Y134.462 E.24815
G3 X144.261 Y134.386 I.237 J-.064 E.00285
G1 X144.261 Y121.609 E.47589
G3 X144.261 Y121.598 I.328 J.002 E.00043
; WIPE_START
G1 X144.687 Y121.538 E-.1634
G1 X146.257 Y121.539 E-.5966
; WIPE_END
G1 E-.04 F1800
M204 S6000
G17
G3 Z.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 1 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.6
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer1 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X144.705 Y122.722 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.47529
G1 F3000
M204 S500
G1 X144.705 Y133.278 E.37195
; WIPE_START
G1 X144.705 Y131.278 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X150.495 Y133.278 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X150.495 Y122.722 E.37195
; OBJECT_ID: 405
; WIPE_START
G1 X150.495 Y124.722 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S6000
G1 X143.259 Y127.152 Z.6 F42000
G1 X125.475 Y133.125 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X125.475 Y122.875 E.38177
G1 X130.525 Y122.875 E.18809
G1 X130.525 Y133.125 E.38177
G1 X125.535 Y133.125 E.18586
; WIPE_START
G1 X125.523 Y131.125 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
M73 P29 R15
G1 X125.184 Y123.5 Z.6 F42000
G1 X125.118 Y121.995 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X130.882 Y121.996 E.21471
G1 X130.882 Y122.418 E.01572
G1 X125.118 Y122.418 E.21471
G1 X125.118 Y122.055 E.01351
; WIPE_START
G1 X127.118 Y122.035 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X125.815 Y129.555 Z.6 F42000
G1 X125.118 Y133.582 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X130.882 Y133.582 E.21471
G1 X130.882 Y134.002 E.01566
G1 X125.118 Y134.005 E.21471
G1 X125.118 Y133.642 E.0135
; WIPE_START
G1 X127.118 Y133.621 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X125.602 Y126.141 Z.6 F42000
G1 X124.669 Y121.538 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X125.087 Y121.538 E.01557
G1 X131.332 Y121.541 E.23262
G3 X131.339 Y121.609 I-.282 J.065 E.00258
G1 X131.339 Y134.391 E.47606
G3 X131.331 Y134.462 I-.325 J-.001 E.00268
G1 X124.669 Y134.462 E.24815
G3 X124.661 Y134.386 I.237 J-.064 E.00285
G1 X124.661 Y121.609 E.47589
G3 X124.661 Y121.598 I.328 J.002 E.00043
; WIPE_START
G1 X125.087 Y121.538 E-.1634
G1 X126.657 Y121.539 E-.5966
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X125.068 Y122.647 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.40029
G1 F3000
M204 S500
G1 X125.068 Y133.353 E.3118
; WIPE_START
G1 X125.068 Y131.353 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X130.932 Y133.353 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X130.932 Y122.647 E.3118
; OBJECT_ID: 394
; WIPE_START
G1 X130.932 Y124.647 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S6000
G1 X123.707 Y127.106 Z.6 F42000
G1 X105.8 Y133.2 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X105.8 Y122.8 E.38736
G1 X111 Y122.8 E.19368
G1 X111 Y133.2 E.38736
G1 X105.86 Y133.2 E.19145
; WIPE_START
G1 X105.848 Y131.2 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X105.574 Y123.572 Z.6 F42000
G1 X105.518 Y121.995 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X111.282 Y121.996 E.21471
G1 X111.282 Y122.343 E.01293
G1 X105.518 Y122.343 E.21471
G1 X105.518 Y122.055 E.01072
; WIPE_START
G1 X107.518 Y122.035 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X106.223 Y129.557 Z.6 F42000
G1 X105.518 Y133.657 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X111.282 Y133.657 E.21471
G1 X111.282 Y134.002 E.01286
G1 X105.518 Y134.005 E.21471
G1 X105.518 Y133.717 E.01071
; WIPE_START
G1 X107.518 Y133.696 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X106.011 Y126.214 Z.6 F42000
G1 X105.069 Y121.538 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X105.487 Y121.538 E.01557
G1 X111.732 Y121.541 E.23262
G3 X111.739 Y121.609 I-.282 J.065 E.00258
G1 X111.739 Y134.391 E.47606
G3 X111.731 Y134.462 I-.325 J-.001 E.00268
G1 X105.069 Y134.462 E.24815
G3 X105.061 Y134.386 I.237 J-.064 E.00285
G1 X105.061 Y121.609 E.47589
G3 X105.061 Y121.598 I.328 J.002 E.00043
; WIPE_START
G1 X105.487 Y121.538 E-.1634
G1 X107.057 Y121.539 E-.5966
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X105.43 Y122.572 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.32529
G1 F3000
M204 S500
G1 X105.43 Y133.428 E.24981
; WIPE_START
G1 X105.43 Y131.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X111.37 Y133.428 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X111.37 Y122.572 E.24981
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
G1 X111.37 Y124.572 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 2/73
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S201.45
; open powerlost recovery
M1003 S1
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z.6 I-.295 J1.181 P1  F42000
G1 X144.873 Y132.935 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7306
M204 S6000
G1 X144.873 Y122.673 E.34041
G1 X150.327 Y122.673 E.18092
G1 X150.327 Y133.327 E.35342
G1 X144.873 Y133.327 E.18092
G1 X144.873 Y132.995 E.01102
M204 S250
G1 X145.265 Y132.935 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7306
M204 S5000
G1 X145.265 Y123.065 E.30328
G1 X149.935 Y123.065 E.1435
G1 X149.935 Y132.935 E.30328
G1 X145.325 Y132.935 E.14165
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.313 Y130.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.895 Y123.314 Z.8 F42000
G1 X144.822 Y121.985 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7306
M204 S6000
G1 X150.377 Y121.985 E.18429
G1 X150.377 Y122.266 E.00931
G1 X144.822 Y122.266 E.18429
G1 X144.822 Y122.045 E.00732
; WIPE_START
G1 F8843.478
G1 X146.822 Y122.024 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.537 Y129.547 Z.8 F42000
G1 X144.822 Y133.734 Z.8
G1 Z.4
G1 E.8 F1800
G1 F7306
M204 S6000
G1 X150.378 Y133.734 E.1843
G1 X150.378 Y134.015 E.00932
G1 X144.822 Y134.015 E.1843
G1 X144.822 Y133.794 E.00733
; WIPE_START
G1 F8843.478
G1 X146.822 Y133.773 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.344 Y126.285 Z.8 F42000
G1 X144.415 Y121.578 Z.8
G1 Z.4
G1 E.8 F1800
G1 F7306
M204 S6000
G1 X150.784 Y121.578 E.21129
G1 X150.785 Y134.422 E.42606
G1 X144.415 Y134.422 E.21131
G1 X144.415 Y121.638 E.42407
M204 S250
G1 X144.027 Y121.488 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X144.037 Y121.401 E.00268
G1 F2760
G1 X144.055 Y121.331 E.00223
G1 F2400
G1 X144.075 Y121.281 E.00165
G1 F2280
G1 X144.086 Y121.261 E.00071
G1 F2160
G1 X144.105 Y121.236 E.00096
G1 F1920
G1 X144.134 Y121.209 E.00121
M106 S255
G1 F1800
G1 X144.171 Y121.19 E.00128
M106 S201.45
M106 S255
G1 F1680
G1 X151.003 Y121.186 E.20993
M106 S201.45
M106 S255
G1 X151.026 Y121.19 E.00071
M106 S201.45
M106 S255
G1 F1800
G1 X151.065 Y121.208 E.00131
M106 S201.45
G1 F1920
G1 X151.084 Y121.223 E.00075
G1 F2040
G1 X151.113 Y121.261 E.00145
G1 F2280
G1 X151.137 Y121.308 E.00165
G1 F2640
G1 X151.157 Y121.373 E.00207
G1 F2880
G1 X151.169 Y121.446 E.00227
G1 F3771.801
G1 X151.177 Y121.558 E.00344
G1 F5700
G1 X151.177 Y121.958 E.01229
G1 X151.177 Y122.158 E.00615
G1 F4800
G1 X151.177 Y133.796 E.35762
G1 X151.175 Y134.111 E.00969
G1 X151.173 Y134.511 E.01229
G1 F3000
G1 X151.163 Y134.599 E.0027
G1 F2760
M73 P30 R15
G1 X151.145 Y134.669 E.00222
G1 F2400
G1 X151.125 Y134.719 E.00167
G1 F2280
G1 X151.114 Y134.739 E.0007
G1 F2160
G1 X151.095 Y134.764 E.00097
G1 F1920
G1 X151.069 Y134.789 E.00112
M106 S255
G1 F1800
G1 X151.042 Y134.805 E.00094
M106 S201.45
M106 S255
G1 F1680
G1 X144.171 Y134.809 E.21113
M106 S201.45
M106 S255
G1 F1800
G1 X144.134 Y134.791 E.00127
M106 S201.45
G1 F1920
G1 X144.113 Y134.773 E.00086
G1 F2040
G1 X144.091 Y134.746 E.00105
G1 F2280
G1 X144.07 Y134.708 E.00134
G1 F2520
G1 X144.049 Y134.651 E.00188
G1 F2760
G1 X144.038 Y134.6 E.00159
G1 F3000
G1 X144.027 Y134.511 E.00278
G1 F4800
G1 X144.024 Y134.111 E.01229
G1 X144.023 Y133.82 E.00892
G1 X144.023 Y122.204 E.35693
G3 X144.025 Y121.548 I10.241 J-.3 E.02016
; OBJECT_ID: 405
; WIPE_START
M204 S6000
G1 X144.037 Y121.401 E-.05594
G1 X144.055 Y121.331 E-.02762
G1 X144.075 Y121.281 E-.02043
G1 X144.086 Y121.261 E-.00882
G1 X144.105 Y121.236 E-.0119
G1 X144.134 Y121.209 E-.01502
G1 X144.171 Y121.19 E-.01577
G1 X145.762 Y121.189 E-.60451
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X139.233 Y125.142 Z.8 F42000
G1 X125.59 Y133.402 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7306
M204 S6000
G1 X125.198 Y133.402 E.01301
G1 X125.198 Y122.598 E.35839
G1 X130.802 Y122.598 E.1859
G1 X130.802 Y133.402 E.35839
G1 X125.65 Y133.402 E.1709
M204 S250
G1 X125.59 Y133.01 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7306
M204 S5000
G1 X125.59 Y122.99 E.30789
G1 X130.41 Y122.99 E.14811
G1 X130.41 Y133.01 E.30789
G1 X125.65 Y133.01 E.14626
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.638 Y131.01 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.974 Y123.406 Z.8 F42000
G1 X124.815 Y121.578 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7306
M204 S6000
G1 X131.184 Y121.578 E.21129
G1 X131.185 Y134.422 E.42606
G1 X124.815 Y134.422 E.21131
G1 X124.815 Y121.638 E.42407
M204 S250
G1 X124.427 Y121.488 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X124.437 Y121.401 E.00268
G1 F2760
G1 X124.455 Y121.331 E.00223
G1 F2400
G1 X124.475 Y121.281 E.00165
G1 F2280
G1 X124.486 Y121.261 E.00071
G1 F2160
G1 X124.505 Y121.236 E.00096
G1 F1920
G1 X124.534 Y121.209 E.00121
M106 S255
G1 F1800
G1 X124.571 Y121.19 E.00128
M106 S201.45
M106 S255
G1 F1680
G1 X131.403 Y121.186 E.20993
M106 S201.45
M106 S255
G1 X131.426 Y121.19 E.00071
M106 S201.45
M106 S255
G1 F1800
G1 X131.465 Y121.208 E.00131
M106 S201.45
G1 F1920
G1 X131.484 Y121.223 E.00075
G1 F2040
G1 X131.513 Y121.261 E.00145
G1 F2280
G1 X131.537 Y121.308 E.00165
G1 F2640
G1 X131.557 Y121.373 E.00207
G1 F2880
G1 X131.569 Y121.446 E.00227
G1 F3771.801
G1 X131.577 Y121.558 E.00344
G1 F5700
G1 X131.577 Y121.958 E.01229
G1 X131.577 Y122.158 E.00615
G1 F4800
G1 X131.577 Y133.796 E.35762
G1 X131.575 Y134.111 E.00969
G1 X131.573 Y134.511 E.01229
G1 F3000
G1 X131.563 Y134.599 E.0027
G1 F2760
G1 X131.545 Y134.669 E.00222
G1 F2400
G1 X131.525 Y134.719 E.00167
G1 F2280
G1 X131.514 Y134.739 E.0007
G1 F2160
G1 X131.495 Y134.764 E.00097
G1 F1920
G1 X131.469 Y134.789 E.00112
M106 S255
G1 F1800
G1 X131.442 Y134.805 E.00094
M106 S201.45
M106 S255
G1 F1680
G1 X124.571 Y134.809 E.21113
M106 S201.45
M106 S255
G1 F1800
G1 X124.534 Y134.791 E.00127
M106 S201.45
G1 F1920
G1 X124.513 Y134.773 E.00086
G1 F2040
G1 X124.491 Y134.746 E.00105
G1 F2280
G1 X124.47 Y134.708 E.00134
G1 F2520
G1 X124.449 Y134.651 E.00188
G1 F2760
G1 X124.438 Y134.6 E.00159
G1 F3000
G1 X124.427 Y134.511 E.00278
G1 F4800
G1 X124.424 Y134.111 E.01229
G1 X124.423 Y133.82 E.00892
G1 X124.423 Y122.204 E.35693
G3 X124.425 Y121.548 I10.241 J-.3 E.02016
; WIPE_START
M204 S6000
G1 X124.437 Y121.401 E-.05594
G1 X124.455 Y121.331 E-.02762
G1 X124.475 Y121.281 E-.02043
G1 X124.486 Y121.261 E-.00882
G1 X124.505 Y121.236 E-.0119
G1 X124.534 Y121.209 E-.01502
G1 X124.571 Y121.19 E-.01577
G1 X126.162 Y121.189 E-.60451
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 405
M625
; object ids of layer 2 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.8
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer2 end: 394,405,416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
G1 X125.018 Y122.088 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.65554
G1 F5876.405
M204 S6000
G1 X130.981 Y122.088 E.29766
M204 S10000
G1 X130.982 Y133.912 F42000
; LINE_WIDTH: 0.65599
G1 F5872.086
M204 S6000
G1 X125.019 Y133.912 E.2979
; OBJECT_ID: 394
; WIPE_START
G1 X127.019 Y133.912 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X119.388 Y133.755 Z.8 F42000
G1 X105.915 Y133.477 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7306
M204 S6000
G1 X105.523 Y133.477 E.01301
G1 X105.523 Y122.523 E.36337
G1 X111.277 Y122.523 E.19088
G1 X111.277 Y133.477 E.36337
G1 X105.975 Y133.477 E.17588
M204 S250
G1 X105.915 Y133.085 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7306
M204 S5000
G1 X105.915 Y122.915 E.3125
G1 X110.885 Y122.915 E.15271
G1 X110.885 Y133.085 E.3125
G1 X105.975 Y133.085 E.15087
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.963 Y131.085 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.364 Y123.476 Z.8 F42000
G1 X105.215 Y121.578 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7306
M204 S6000
G1 X111.585 Y121.578 E.21129
G1 X111.585 Y134.422 E.42606
G1 X105.215 Y134.422 E.21131
G1 X105.215 Y121.638 E.42407
M204 S250
G1 X104.827 Y121.488 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X104.837 Y121.401 E.00268
G1 F2760
G1 X104.855 Y121.331 E.00223
G1 F2400
G1 X104.875 Y121.281 E.00165
G1 F2280
G1 X104.886 Y121.261 E.00071
G1 F2160
G1 X104.905 Y121.236 E.00096
G1 F1920
G1 X104.934 Y121.209 E.00121
M106 S255
G1 F1800
G1 X104.971 Y121.19 E.00128
M106 S201.45
M106 S255
G1 F1680
G1 X111.803 Y121.186 E.20993
M106 S201.45
M106 S255
G1 X111.826 Y121.19 E.00071
M106 S201.45
M106 S255
G1 F1800
G1 X111.865 Y121.208 E.00131
M106 S201.45
G1 F1920
G1 X111.884 Y121.223 E.00075
G1 F2040
G1 X111.913 Y121.261 E.00145
G1 F2280
G1 X111.937 Y121.308 E.00165
G1 F2640
G1 X111.957 Y121.373 E.00207
G1 F2880
G1 X111.969 Y121.446 E.00227
G1 F3771.801
G1 X111.977 Y121.558 E.00344
G1 F5700
G1 X111.977 Y121.958 E.01229
G1 X111.977 Y122.158 E.00615
G1 F4800
G1 X111.977 Y133.796 E.35762
G1 X111.975 Y134.111 E.00969
G1 X111.973 Y134.511 E.01229
G1 F3000
G1 X111.963 Y134.599 E.0027
G1 F2760
G1 X111.945 Y134.669 E.00222
G1 F2400
G1 X111.925 Y134.719 E.00167
G1 F2280
G1 X111.914 Y134.739 E.0007
G1 F2160
G1 X111.895 Y134.764 E.00097
G1 F1920
G1 X111.869 Y134.789 E.00112
M106 S255
G1 F1800
G1 X111.842 Y134.805 E.00094
M106 S201.45
M106 S255
G1 F1680
G1 X104.971 Y134.809 E.21113
M106 S201.45
M106 S255
G1 F1800
G1 X104.934 Y134.791 E.00127
M106 S201.45
G1 F1920
G1 X104.913 Y134.773 E.00086
G1 F2040
G1 X104.891 Y134.746 E.00105
G1 F2280
G1 X104.87 Y134.708 E.00134
G1 F2520
G1 X104.849 Y134.651 E.00188
G1 F2760
G1 X104.838 Y134.6 E.00159
G1 F3000
G1 X104.827 Y134.511 E.00278
G1 F4800
G1 X104.825 Y134.111 E.01229
G1 X104.823 Y133.82 E.00892
G1 X104.823 Y122.204 E.35693
G3 X104.825 Y121.548 I10.241 J-.3 E.02016
M204 S10000
G1 X105.418 Y122.051 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.58054
G1 F6696.185
M204 S6000
G1 X111.381 Y122.051 E.26122
M204 S10000
G1 X111.382 Y133.95 F42000
; LINE_WIDTH: 0.58099
G1 F6690.58
M204 S6000
G1 X105.419 Y133.95 E.26146
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6690.58
G1 X107.419 Y133.95 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 3/73
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z.8 I.033 J1.217 P1  F42000
G1 X144.873 Y132.935 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6055
M204 S6000
G1 X144.873 Y122.673 E.34041
G1 X150.327 Y122.673 E.18092
G1 X150.327 Y133.327 E.35342
G1 X144.873 Y133.327 E.18092
G1 X144.873 Y132.995 E.01102
M204 S250
G1 X145.265 Y132.935 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6055
M204 S5000
G1 X145.265 Y123.065 E.30328
G1 X149.935 Y123.065 E.1435
G1 X149.935 Y132.935 E.30328
G1 X145.325 Y132.935 E.14165
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.313 Y130.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.271 Y123.303 Z1 F42000
G1 X145.265 Y122.266 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6055
M204 S6000
G1 X144.809 Y122.266 E.01512
G1 X144.809 Y121.868 E.01319
G1 X150.39 Y121.868 E.18514
G1 X150.39 Y122.266 E.01319
G1 X145.325 Y122.266 E.16803
; WIPE_START
G1 F8843.478
G1 X144.809 Y122.266 E-.19603
G1 X144.809 Y121.868 E-.15113
G1 X145.896 Y121.868 E-.41284
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.2 Y129.469 Z1 F42000
G1 X144.809 Y133.734 Z1
G1 Z.6
G1 E.8 F1800
G1 F6055
M204 S6000
G1 X150.391 Y133.734 E.18515
G1 X150.391 Y134.132 E.01319
G1 X144.809 Y134.132 E.18516
G1 X144.809 Y133.794 E.01122
; WIPE_START
G1 F8843.478
G1 X146.809 Y133.773 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.345 Y126.282 Z1 F42000
G1 X144.402 Y121.461 Z1
G1 Z.6
G1 E.8 F1800
G1 F6055
M204 S6000
G1 X150.797 Y121.461 E.21215
G1 X150.798 Y134.539 E.43382
G1 X144.402 Y134.539 E.21216
G1 X144.402 Y121.521 E.43184
M204 S250
G1 X144.01 Y121.341 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6055
M204 S5000
G1 X144.01 Y121.34 E.00004
G1 X144.012 Y121.288 E.00159
G1 X144.018 Y121.244 E.00137
G1 X144.026 Y121.215 E.00093
G1 X144.038 Y121.182 E.00108
G1 X144.055 Y121.152 E.00106
G1 X144.067 Y121.136 E.00061
G1 X144.083 Y121.118 E.00075
G1 X144.126 Y121.087 E.00161
G1 X144.194 Y121.069 E.00218
G1 F5700
G1 X151.003 Y121.069 E.20922
G1 F6003.307
G1 X151.032 Y121.073 E.00088
G1 F6055
G1 X151.066 Y121.084 E.00112
G1 X151.097 Y121.102 E.00111
G1 X151.126 Y121.128 E.00118
G1 X151.15 Y121.162 E.00128
G1 X151.17 Y121.205 E.00147
G1 X151.185 Y121.263 E.00182
G1 X151.19 Y121.317 E.00166
G1 X151.19 Y121.34 E.00072
G1 X151.19 Y134.659 E.40926
G1 X151.19 Y134.66 E.00004
G1 X151.188 Y134.712 E.00159
G1 X151.182 Y134.756 E.00136
G1 X151.174 Y134.785 E.00094
G1 X151.162 Y134.818 E.00108
G1 X151.145 Y134.848 E.00107
G1 X151.133 Y134.864 E.0006
G1 X151.117 Y134.882 E.00075
G1 X151.074 Y134.913 E.00161
G1 X151.037 Y134.927 E.00123
G1 F5700
G1 X144.805 Y134.931 E.19147
G3 X144.185 Y134.93 I-.3 J-5.836 E.01906
G1 X144.161 Y134.926 E.00075
G1 F6055
G1 X144.123 Y134.911 E.00126
G3 X144.081 Y134.88 I.08 J-.153 E.00163
G1 X144.061 Y134.857 E.00093
G1 X144.044 Y134.828 E.00102
G1 X144.029 Y134.795 E.00112
G1 X144.018 Y134.754 E.0013
G1 X144.012 Y134.712 E.00132
G1 X144.01 Y134.664 E.00148
G1 X144.01 Y121.401 E.40752
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.01 Y121.34 E-.02335
G1 X144.012 Y121.288 E-.01963
G1 X144.018 Y121.244 E-.01689
G1 X144.026 Y121.215 E-.01154
G1 X144.038 Y121.182 E-.01335
G1 X144.055 Y121.152 E-.01311
G1 X144.067 Y121.136 E-.00751
G1 X144.083 Y121.118 E-.00926
G1 X144.126 Y121.087 E-.01988
G1 X144.194 Y121.069 E-.02697
G1 X145.769 Y121.069 E-.59851
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 3 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1
G1 X0 Y128 F18000 ; move to safe pos
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
; object ids of this layer3 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X144.637 Y122.469 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.10672
G1 F6055
M204 S6000
G1 X144.637 Y133.531 E.05751
M204 S10000
G1 X150.562 Y133.531 F42000
; LINE_WIDTH: 0.106481
G1 F6055
M204 S6000
G1 X150.562 Y122.469 E.05729
; OBJECT_ID: 405
; WIPE_START
G1 F15000
G1 X150.562 Y124.469 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X143.376 Y127.04 Z1 F42000
G1 X125.59 Y133.402 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6055
M204 S6000
G1 X125.198 Y133.402 E.01301
G1 X125.198 Y122.598 E.35839
G1 X130.802 Y122.598 E.1859
G1 X130.802 Y133.402 E.35839
G1 X125.65 Y133.402 E.1709
M204 S250
G1 X125.59 Y133.01 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6055
M204 S5000
G1 X125.59 Y122.99 E.30789
M73 P31 R15
G1 X130.41 Y122.99 E.14811
G1 X130.41 Y133.01 E.30789
G1 X125.65 Y133.01 E.14626
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.638 Y131.01 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.596 Y123.378 Z1 F42000
G1 X125.59 Y122.191 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6055
M204 S6000
G1 X125.209 Y122.191 E.01263
G1 X125.209 Y121.868 E.0107
G1 X130.79 Y121.868 E.18514
G1 X130.79 Y122.191 E.01071
G1 X125.65 Y122.191 E.17052
; WIPE_START
G1 F8843.478
G1 X125.209 Y122.191 E-.16753
G1 X125.209 Y121.868 E-.12263
G1 X126.446 Y121.868 E-.46984
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.659 Y129.46 Z1 F42000
G1 X125.209 Y133.809 Z1
G1 Z.6
G1 E.8 F1800
G1 F6055
M204 S6000
G1 X130.791 Y133.809 E.18516
G1 X130.791 Y134.132 E.01071
G1 X125.209 Y134.132 E.18516
G1 X125.209 Y133.869 E.00873
; WIPE_START
G1 F8843.478
G1 X127.209 Y133.848 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.753 Y126.355 Z1 F42000
G1 X124.802 Y121.461 Z1
G1 Z.6
G1 E.8 F1800
G1 F6055
M204 S6000
G1 X131.197 Y121.461 E.21215
G1 X131.198 Y134.539 E.43382
G1 X124.802 Y134.539 E.21216
G1 X124.802 Y121.521 E.43184
M204 S250
G1 X124.41 Y121.341 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6055
M204 S5000
G1 X124.41 Y121.34 E.00004
G1 X124.412 Y121.288 E.00159
G1 X124.418 Y121.244 E.00137
G1 X124.426 Y121.215 E.00093
G1 X124.438 Y121.182 E.00108
G1 X124.455 Y121.152 E.00106
G1 X124.467 Y121.136 E.00061
G1 X124.483 Y121.118 E.00075
G1 X124.526 Y121.087 E.00161
G1 X124.594 Y121.069 E.00218
G1 F5700
G1 X131.403 Y121.069 E.20922
G1 F6003.307
G1 X131.432 Y121.073 E.00088
G1 F6055
G1 X131.466 Y121.084 E.00112
G1 X131.497 Y121.102 E.00111
G1 X131.526 Y121.128 E.00118
G1 X131.55 Y121.162 E.00128
G1 X131.57 Y121.205 E.00147
G1 X131.585 Y121.263 E.00182
G1 X131.59 Y121.317 E.00166
G1 X131.59 Y121.34 E.00072
G1 X131.59 Y134.659 E.40926
G1 X131.59 Y134.66 E.00004
G1 X131.588 Y134.712 E.00159
G1 X131.582 Y134.756 E.00136
G1 X131.574 Y134.785 E.00094
G1 X131.562 Y134.818 E.00108
G1 X131.545 Y134.848 E.00107
G1 X131.533 Y134.864 E.0006
G1 X131.517 Y134.882 E.00075
G1 X131.474 Y134.913 E.00161
G1 X131.437 Y134.927 E.00123
G1 F5700
G1 X125.205 Y134.931 E.19147
G3 X124.585 Y134.93 I-.3 J-5.836 E.01906
G1 X124.561 Y134.926 E.00075
G1 F6055
G1 X124.523 Y134.911 E.00126
G3 X124.481 Y134.88 I.08 J-.153 E.00163
G1 X124.461 Y134.857 E.00093
G1 X124.444 Y134.828 E.00102
G1 X124.429 Y134.795 E.00112
G1 X124.418 Y134.754 E.0013
G1 X124.412 Y134.712 E.00132
G1 X124.41 Y134.664 E.00148
G1 X124.41 Y121.401 E.40752
; OBJECT_ID: 394
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.41 Y121.34 E-.02335
G1 X124.412 Y121.288 E-.01963
G1 X124.418 Y121.244 E-.01689
G1 X124.426 Y121.215 E-.01154
G1 X124.438 Y121.182 E-.01335
G1 X124.455 Y121.152 E-.01311
G1 X124.467 Y121.136 E-.00751
G1 X124.483 Y121.118 E-.00926
G1 X124.526 Y121.087 E-.01989
G1 X124.594 Y121.069 E-.02697
G1 X126.169 Y121.069 E-.59851
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X119.661 Y125.056 Z1 F42000
G1 X105.915 Y133.477 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6055
M204 S6000
G1 X105.523 Y133.477 E.01301
G1 X105.523 Y122.523 E.36337
G1 X111.277 Y122.523 E.19088
G1 X111.277 Y133.477 E.36337
G1 X105.975 Y133.477 E.17588
M204 S250
G1 X105.915 Y133.085 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6055
M204 S5000
G1 X105.915 Y122.915 E.3125
G1 X110.885 Y122.915 E.15271
G1 X110.885 Y133.085 E.3125
G1 X105.975 Y133.085 E.15087
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.963 Y131.085 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.922 Y123.453 Z1 F42000
G1 X105.915 Y122.116 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6055
M204 S6000
G1 X105.609 Y122.116 E.01015
G1 X105.609 Y121.868 E.00822
G1 X111.19 Y121.868 E.18514
G1 X111.19 Y122.116 E.00822
G1 X105.975 Y122.116 E.173
; WIPE_START
G1 F8843.478
G1 X105.609 Y122.116 E-.13904
G1 X105.609 Y121.868 E-.09413
G1 X106.996 Y121.868 E-.52684
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.121 Y129.45 Z1 F42000
G1 X105.609 Y133.884 Z1
G1 Z.6
G1 E.8 F1800
G1 F6055
M204 S6000
G1 X111.191 Y133.884 E.18516
G1 X111.191 Y134.132 E.00822
G1 X105.609 Y134.132 E.18516
G1 X105.609 Y133.944 E.00624
; WIPE_START
G1 F8843.478
G1 X107.609 Y133.923 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.162 Y126.429 Z1 F42000
G1 X105.202 Y121.461 Z1
G1 Z.6
G1 E.8 F1800
G1 F6055
M204 S6000
G1 X111.597 Y121.461 E.21215
G1 X111.598 Y134.539 E.43382
G1 X105.202 Y134.539 E.21216
G1 X105.202 Y121.521 E.43184
M204 S250
G1 X104.81 Y121.341 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6055
M204 S5000
G1 X104.81 Y121.34 E.00004
G1 X104.812 Y121.288 E.00159
G1 X104.818 Y121.244 E.00137
G1 X104.826 Y121.215 E.00093
G1 X104.838 Y121.182 E.00108
G1 X104.855 Y121.152 E.00106
G1 X104.867 Y121.136 E.00061
G1 X104.883 Y121.118 E.00075
G1 X104.926 Y121.087 E.00161
G1 X104.994 Y121.069 E.00218
G1 F5700
G1 X111.803 Y121.069 E.20922
G1 F6003.307
G1 X111.832 Y121.073 E.00088
G1 F6055
G1 X111.866 Y121.084 E.00112
G1 X111.897 Y121.102 E.00111
G1 X111.926 Y121.128 E.00118
G1 X111.95 Y121.162 E.00128
G1 X111.97 Y121.205 E.00147
G1 X111.985 Y121.263 E.00182
G1 X111.99 Y121.317 E.00166
G1 X111.99 Y121.34 E.00072
G1 X111.99 Y134.659 E.40926
G1 X111.99 Y134.66 E.00004
G1 X111.988 Y134.712 E.00159
G1 X111.982 Y134.756 E.00136
G1 X111.974 Y134.785 E.00094
G1 X111.962 Y134.818 E.00108
G1 X111.945 Y134.848 E.00107
G1 X111.933 Y134.864 E.0006
G1 X111.917 Y134.882 E.00075
G1 X111.874 Y134.913 E.00161
G1 X111.837 Y134.927 E.00123
G1 F5700
G1 X105.605 Y134.931 E.19147
G3 X104.985 Y134.93 I-.3 J-5.836 E.01906
G1 X104.961 Y134.926 E.00075
G1 F6055
G1 X104.923 Y134.911 E.00126
G3 X104.881 Y134.88 I.08 J-.153 E.00163
G1 X104.861 Y134.857 E.00093
G1 X104.844 Y134.828 E.00102
G1 X104.829 Y134.795 E.00112
G1 X104.818 Y134.754 E.0013
G1 X104.812 Y134.712 E.00132
G1 X104.81 Y134.664 E.00148
G1 X104.81 Y121.401 E.40752
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.81 Y121.34 E-.02335
G1 X104.812 Y121.288 E-.01963
G1 X104.818 Y121.244 E-.01689
G1 X104.826 Y121.215 E-.01154
G1 X104.838 Y121.182 E-.01335
G1 X104.855 Y121.152 E-.01311
G1 X104.867 Y121.136 E-.00751
G1 X104.883 Y121.118 E-.00926
G1 X104.926 Y121.087 E-.01988
G1 X104.994 Y121.069 E-.02697
G1 X106.569 Y121.069 E-.59851
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 4/73
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z1 I-.368 J1.16 P1  F42000
G1 X144.94 Y133.26 Z1
G1 Z.8
G1 E.8 F1800
G1 F4787
M204 S5000
G1 X144.94 Y122.74 E.32325
G1 X150.26 Y122.74 E.16347
G1 X150.26 Y133.26 E.32325
G1 X145 Y133.26 E.16163
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.989 Y131.26 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.947 Y123.628 Z1.2 F42000
G1 X144.94 Y122.348 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4787
M204 S6000
G1 X144.402 Y122.348 E.01784
G1 X144.402 Y121.409 E.03114
G1 X150.798 Y121.409 E.21215
G1 X150.798 Y122.348 E.03115
G1 X145 Y122.348 E.19231
; WIPE_START
G1 F8843.478
G1 X144.402 Y122.348 E-.22722
G1 X144.402 Y121.409 E-.35677
G1 X144.865 Y121.409 E-.17601
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.577 Y129.036 Z1.2 F42000
G1 X144.402 Y133.652 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F4787
M204 S6000
G1 X150.798 Y133.652 E.21216
G1 X150.798 Y134.591 E.03114
G1 X144.402 Y134.591 E.21216
G1 X144.402 Y133.712 E.02917
; WIPE_START
G1 F8843.478
G1 X146.402 Y133.693 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.969 Y126.197 Z1.2 F42000
G1 X144.012 Y121.189 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4787
M204 S5000
G3 X144.05 Y121.093 I.341 J.08 E.00318
G1 X144.061 Y121.078 E.00059
G1 X144.095 Y121.049 E.00137
G3 X144.193 Y121.017 I.124 J.212 E.00317
G1 X144.793 Y121.017 E.01844
G1 X150.999 Y121.017 E.19071
G1 X151.035 Y121.021 E.00112
G1 X151.072 Y121.032 E.00117
G3 X151.133 Y121.073 I-.072 J.173 E.00227
G1 X151.151 Y121.095 E.00088
G1 X151.156 Y121.102 E.00027
G3 X151.19 Y121.207 I-.205 J.123 E.0034
G1 X151.189 Y134.805 E.41784
G3 X151.15 Y134.907 I-.319 J-.063 E.00337
G1 X151.138 Y134.923 E.00061
G1 X151.103 Y134.952 E.00142
G1 X151.091 Y134.96 E.00042
G3 X151.007 Y134.983 I-.099 J-.193 E.00271
G1 X144.212 Y134.983 E.20879
G3 X144.095 Y134.951 I-.003 J-.213 E.00376
G1 X144.074 Y134.934 E.00085
G1 X144.05 Y134.907 E.00111
G1 X144.019 Y134.848 E.00202
G3 X144.01 Y134.779 I.233 J-.067 E.00214
G1 X144.012 Y121.249 E.41575
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.05 Y121.093 E-.06093
G1 X144.061 Y121.078 E-.0073
G1 X144.095 Y121.049 E-.01697
G1 X144.193 Y121.017 E-.03897
G1 X144.793 Y121.017 E-.228
G1 X145.866 Y121.017 E-.40784
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 4 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.2
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer4 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X144.606 Y121.878 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.574838
G1 F4787
M204 S6000
G1 X150.594 Y121.878 E.25956
M204 S10000
G1 X150.725 Y122.544 F42000
; LINE_WIDTH: 0.580649
G1 F4787
M204 S6000
G1 X150.725 Y133.456 E.47814
M204 S10000
G1 X150.594 Y134.122 F42000
; LINE_WIDTH: 0.57497
G1 F4787
M204 S6000
G1 X144.606 Y134.122 E.25965
M204 S10000
G1 X144.475 Y133.456 F42000
; LINE_WIDTH: 0.58086
G1 F4787
M204 S6000
G1 X144.475 Y122.544 E.47833
; OBJECT_ID: 405
; WIPE_START
G1 F6692.197
G1 X144.475 Y124.544 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.529 Y127.708 Z1.2 F42000
G1 X125.34 Y133.26 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4787
M204 S5000
G1 X125.34 Y122.74 E.32325
G1 X130.66 Y122.74 E.16347
G1 X130.66 Y133.26 E.32325
G1 X125.4 Y133.26 E.16163
; WIPE_START
M73 P31 R14
G1 F9547.055
M204 S6000
G1 X125.389 Y131.26 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.347 Y123.628 Z1.2 F42000
G1 X125.34 Y122.348 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4787
M204 S6000
G1 X124.802 Y122.348 E.01784
G1 X124.802 Y121.409 E.03114
G1 X131.198 Y121.409 E.21215
G1 X131.198 Y122.348 E.03115
G1 X125.4 Y122.348 E.19231
; WIPE_START
G1 F8843.478
G1 X124.802 Y122.348 E-.22722
G1 X124.802 Y121.409 E-.35677
G1 X125.265 Y121.409 E-.17601
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P32 R14
G1 X124.977 Y129.036 Z1.2 F42000
G1 X124.802 Y133.652 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F4787
M204 S6000
G1 X131.198 Y133.652 E.21216
G1 X131.198 Y134.591 E.03114
G1 X124.802 Y134.591 E.21216
G1 X124.802 Y133.712 E.02917
; WIPE_START
G1 F8843.478
G1 X126.802 Y133.693 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.369 Y126.197 Z1.2 F42000
G1 X124.412 Y121.189 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4787
M204 S5000
G3 X124.45 Y121.093 I.341 J.08 E.00318
G1 X124.461 Y121.078 E.00059
G1 X124.495 Y121.049 E.00137
G3 X124.593 Y121.017 I.124 J.212 E.00317
G1 X125.193 Y121.017 E.01844
G1 X131.399 Y121.017 E.19071
G1 X131.435 Y121.021 E.00112
G1 X131.472 Y121.032 E.00117
G3 X131.533 Y121.073 I-.072 J.173 E.00227
G1 X131.551 Y121.095 E.00088
G1 X131.556 Y121.102 E.00027
G3 X131.59 Y121.207 I-.205 J.123 E.0034
G1 X131.589 Y134.805 E.41784
G3 X131.55 Y134.907 I-.319 J-.063 E.00337
G1 X131.538 Y134.923 E.00061
G1 X131.503 Y134.952 E.00142
G1 X131.491 Y134.96 E.00042
G3 X131.407 Y134.983 I-.099 J-.193 E.00271
G1 X124.612 Y134.983 E.20879
G3 X124.495 Y134.951 I-.003 J-.213 E.00376
G1 X124.474 Y134.934 E.00085
G1 X124.45 Y134.907 E.00111
G1 X124.419 Y134.848 E.00202
G3 X124.41 Y134.779 I.233 J-.067 E.00214
G1 X124.412 Y121.249 E.41575
M204 S10000
G1 X125.006 Y121.878 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.574838
G1 F4787
M204 S6000
G1 X130.994 Y121.878 E.25956
M204 S10000
G1 X131.125 Y122.544 F42000
; LINE_WIDTH: 0.580649
G1 F4787
M204 S6000
G1 X131.125 Y133.456 E.47814
M204 S10000
G1 X130.994 Y134.122 F42000
; LINE_WIDTH: 0.57497
G1 F4787
M204 S6000
G1 X125.006 Y134.122 E.25965
M204 S10000
G1 X124.875 Y133.456 F42000
; LINE_WIDTH: 0.58086
G1 F4787
M204 S6000
G1 X124.875 Y122.544 E.47833
; OBJECT_ID: 394
; WIPE_START
G1 F6692.197
G1 X124.875 Y124.544 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X117.929 Y127.708 Z1.2 F42000
G1 X105.74 Y133.26 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4787
M204 S5000
G1 X105.74 Y122.74 E.32325
G1 X111.06 Y122.74 E.16347
G1 X111.06 Y133.26 E.32325
G1 X105.8 Y133.26 E.16163
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.789 Y131.26 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.747 Y123.628 Z1.2 F42000
G1 X105.74 Y122.348 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4787
M204 S6000
G1 X105.202 Y122.348 E.01784
G1 X105.202 Y121.409 E.03114
G1 X111.598 Y121.409 E.21215
G1 X111.598 Y122.348 E.03115
G1 X105.8 Y122.348 E.19231
; WIPE_START
G1 F8843.478
G1 X105.202 Y122.348 E-.22722
G1 X105.202 Y121.409 E-.35677
G1 X105.665 Y121.409 E-.17601
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.377 Y129.036 Z1.2 F42000
G1 X105.202 Y133.652 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F4787
M204 S6000
G1 X111.598 Y133.652 E.21216
G1 X111.598 Y134.591 E.03114
G1 X105.202 Y134.591 E.21216
G1 X105.202 Y133.712 E.02917
; WIPE_START
G1 F8843.478
G1 X107.202 Y133.693 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.769 Y126.197 Z1.2 F42000
G1 X104.812 Y121.189 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4787
M204 S5000
G3 X104.85 Y121.093 I.341 J.08 E.00318
G1 X104.861 Y121.078 E.00059
G1 X104.895 Y121.049 E.00137
G3 X104.993 Y121.017 I.124 J.212 E.00317
G1 X105.593 Y121.017 E.01844
G1 X111.799 Y121.017 E.19071
G1 X111.835 Y121.021 E.00112
G1 X111.872 Y121.032 E.00117
G3 X111.933 Y121.073 I-.072 J.173 E.00227
G1 X111.951 Y121.095 E.00088
G1 X111.956 Y121.102 E.00027
G3 X111.99 Y121.207 I-.205 J.123 E.0034
G1 X111.989 Y134.805 E.41784
G3 X111.95 Y134.907 I-.319 J-.063 E.00337
G1 X111.938 Y134.923 E.00061
G1 X111.903 Y134.952 E.00142
G1 X111.891 Y134.96 E.00042
G3 X111.807 Y134.983 I-.099 J-.193 E.00271
G1 X105.012 Y134.983 E.20879
G3 X104.895 Y134.951 I-.003 J-.213 E.00376
G1 X104.874 Y134.934 E.00085
G1 X104.85 Y134.907 E.00111
G1 X104.819 Y134.848 E.00202
G3 X104.81 Y134.779 I.233 J-.067 E.00214
G1 X104.812 Y121.249 E.41575
M204 S10000
G1 X105.406 Y121.878 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.574838
G1 F4787
M204 S6000
G1 X111.394 Y121.878 E.25956
M204 S10000
G1 X111.525 Y122.544 F42000
; LINE_WIDTH: 0.580649
G1 F4787
M204 S6000
G1 X111.525 Y133.456 E.47814
M204 S10000
G1 X111.394 Y134.122 F42000
; LINE_WIDTH: 0.57497
G1 F4787
M204 S6000
G1 X105.406 Y134.122 E.25965
M204 S10000
G1 X105.275 Y133.456 F42000
; LINE_WIDTH: 0.58086
G1 F4787
M204 S6000
G1 X105.275 Y122.544 E.47833
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6692.197
G1 X105.275 Y124.544 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 5/73
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z1.2 I-.231 J1.195 P1  F42000
G1 X150.26 Y133.26 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4572
M204 S5000
G1 X144.94 Y133.26 E.16347
G1 X144.94 Y122.74 E.32325
G1 X150.26 Y122.74 E.16347
G1 X150.26 Y133.2 E.32141
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.26 Y133.223 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.742 Y125.735 Z1.4 F42000
G1 X150.36 Y122.61 Z1.4
G1 Z1
G1 E.8 F1800
G1 F4572
M204 S5000
G1 X144.84 Y122.61 E.16961
G1 X144.84 Y121.39 E.03749
G1 X150.36 Y121.39 E.16961
G1 X150.36 Y122.55 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.36 Y122.572 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.998 Y129.83 Z1.4 F42000
G1 X144.84 Y133.39 Z1.4
G1 Z1
G1 E.8 F1800
G1 F4572
M204 S5000
G1 X150.36 Y133.39 E.16961
G1 X150.36 Y134.61 E.03749
G1 X144.84 Y134.61 E.16961
G1 X144.84 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X146.84 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.118 Y125.993 Z1.4 F42000
G1 X144.01 Y121.211 Z1.4
G1 Z1
G1 E.8 F1800
G1 F4572
M204 S5000
G3 X144.193 Y121.01 I.192 J-.008 E.00925
G1 X151.046 Y121.017 E.21056
G3 X151.19 Y121.21 I-.051 J.188 E.00799
G1 X151.189 Y134.816 E.41807
G3 X151.009 Y134.99 I-.193 J-.02 E.00834
G1 X144.147 Y134.982 E.21085
G3 X144.01 Y134.792 I.056 J-.185 E.00775
G1 X144.01 Y121.271 E.41548
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.052 Y121.082 E-.07352
G1 X144.108 Y121.034 E-.02812
G1 X144.193 Y121.01 E-.03349
G1 X145.838 Y121.012 E-.62488
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 5 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.4
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer5 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X144.425 Y121.206 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.482436
G1 F4572
M204 S6000
G1 X144.425 Y122.806 E.05729
G1 X144.45 Y122.911 E.00385
; LINE_WIDTH: 0.55586
G1 X144.475 Y123.015 E.0045
; LINE_WIDTH: 0.58075
G1 X144.475 Y132.985 E.43692
G1 X144.513 Y133.01 E.00201
; LINE_WIDTH: 0.508445
G1 X144.552 Y133.034 E.00174
; LINE_WIDTH: 0.460168
G1 X144.59 Y133.059 E.00156
; LINE_WIDTH: 0.41189
G1 X144.629 Y133.084 E.00138
; LINE_WIDTH: 0.363613
G1 X144.667 Y133.109 E.0012
; LINE_WIDTH: 0.315336
G1 X144.706 Y133.134 E.00102
; LINE_WIDTH: 0.267059
G1 X144.744 Y133.159 E.00084
M204 S10000
G1 X144.475 Y132.985 F42000
; LINE_WIDTH: 0.55586
G1 F4572
M204 S6000
G1 X144.45 Y133.089 E.0045
; LINE_WIDTH: 0.482435
G1 X144.425 Y133.194 E.00385
G1 X144.425 Y134.794 E.0573
M204 S10000
G1 X150.775 Y134.793 F42000
; LINE_WIDTH: 0.48086
G1 F4572
M204 S6000
G1 X150.775 Y133.194 E.05708
; LINE_WIDTH: 0.50586
G1 X150.75 Y133.089 E.00406
; LINE_WIDTH: 0.580593
G1 X150.725 Y132.985 E.00471
G1 X150.725 Y123.015 E.4368
; LINE_WIDTH: 0.55586
G1 X150.75 Y122.911 E.0045
; LINE_WIDTH: 0.482436
G1 X150.775 Y122.806 E.00385
G1 X150.775 Y121.206 E.05729
; WIPE_START
G1 F8190.836
G1 X150.775 Y122.806 E-.7121
G1 X150.75 Y122.911 E-.0479
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.744 Y122.841 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.267059
G1 F4572
M204 S6000
G1 X144.706 Y122.866 E.00084
; LINE_WIDTH: 0.315336
G1 X144.667 Y122.891 E.00102
; LINE_WIDTH: 0.363613
G1 X144.629 Y122.916 E.0012
; LINE_WIDTH: 0.41189
G1 X144.59 Y122.941 E.00138
; LINE_WIDTH: 0.460167
G1 X144.552 Y122.966 E.00156
; LINE_WIDTH: 0.508444
G1 X144.513 Y122.99 E.00174
; LINE_WIDTH: 0.556722
G1 X144.475 Y123.015 E.00192
; OBJECT_ID: 405
; WIPE_START
G1 F7006.601
G1 X144.513 Y122.99 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X136.882 Y122.891 Z1.4 F42000
G1 X125.34 Y122.74 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4572
M204 S5000
G1 X130.66 Y122.74 E.16347
G1 X130.66 Y133.26 E.32325
G1 X125.34 Y133.26 E.16347
G1 X125.34 Y122.8 E.32141
M204 S250
G1 X125.24 Y122.61 F42000
G1 F4572
M204 S5000
G1 X125.24 Y121.39 E.03749
G1 X130.76 Y121.39 E.16961
G1 X130.76 Y122.61 E.03749
G1 X125.3 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.24 Y121.39 E-.46416
G1 X126.019 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.524 Y129.006 Z1.4 F42000
G1 X125.24 Y133.39 Z1.4
G1 Z1
G1 E.8 F1800
G1 F4572
M204 S5000
G1 X130.76 Y133.39 E.16961
G1 X130.76 Y134.61 E.03749
G1 X125.24 Y134.61 E.16961
G1 X125.24 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.24 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.518 Y125.993 Z1.4 F42000
G1 X124.41 Y121.211 Z1.4
G1 Z1
G1 E.8 F1800
G1 F4572
M204 S5000
G3 X124.593 Y121.01 I.192 J-.008 E.00925
G1 X131.446 Y121.017 E.21056
G3 X131.59 Y121.21 I-.051 J.188 E.00799
G1 X131.589 Y134.816 E.41807
G3 X131.409 Y134.99 I-.193 J-.02 E.00834
G1 X124.547 Y134.982 E.21085
G3 X124.41 Y134.792 I.056 J-.185 E.00775
G1 X124.41 Y121.271 E.41548
M204 S10000
G1 X124.825 Y121.206 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.482436
G1 F4572
M204 S6000
G1 X124.825 Y122.806 E.05729
G1 X124.85 Y122.911 E.00385
; LINE_WIDTH: 0.55586
G1 X124.875 Y123.015 E.0045
; LINE_WIDTH: 0.58075
G1 X124.875 Y132.985 E.43692
G1 X124.913 Y133.01 E.00201
; LINE_WIDTH: 0.508445
G1 X124.952 Y133.034 E.00174
; LINE_WIDTH: 0.460168
G1 X124.99 Y133.059 E.00156
; LINE_WIDTH: 0.41189
G1 X125.029 Y133.084 E.00138
; LINE_WIDTH: 0.363613
G1 X125.067 Y133.109 E.0012
; LINE_WIDTH: 0.315336
G1 X125.106 Y133.134 E.00102
; LINE_WIDTH: 0.267059
G1 X125.144 Y133.159 E.00084
M204 S10000
G1 X124.875 Y132.985 F42000
; LINE_WIDTH: 0.55586
G1 F4572
M204 S6000
G1 X124.85 Y133.089 E.0045
; LINE_WIDTH: 0.482435
G1 X124.825 Y133.194 E.00385
G1 X124.825 Y134.794 E.0573
M204 S10000
G1 X131.175 Y134.793 F42000
; LINE_WIDTH: 0.48086
G1 F4572
M204 S6000
G1 X131.175 Y133.194 E.05708
; LINE_WIDTH: 0.50586
G1 X131.15 Y133.089 E.00406
; LINE_WIDTH: 0.580593
G1 X131.125 Y132.985 E.00471
G1 X131.125 Y123.015 E.4368
; LINE_WIDTH: 0.55586
G1 X131.15 Y122.911 E.0045
; LINE_WIDTH: 0.482436
G1 X131.175 Y122.806 E.00385
G1 X131.175 Y121.206 E.05729
; WIPE_START
G1 F8190.836
G1 X131.175 Y122.806 E-.7121
G1 X131.15 Y122.911 E-.0479
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.144 Y122.841 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.267059
G1 F4572
M204 S6000
G1 X125.106 Y122.866 E.00084
; LINE_WIDTH: 0.315336
G1 X125.067 Y122.891 E.00102
; LINE_WIDTH: 0.363613
G1 X125.029 Y122.916 E.0012
; LINE_WIDTH: 0.41189
G1 X124.99 Y122.941 E.00138
; LINE_WIDTH: 0.460167
G1 X124.952 Y122.966 E.00156
; LINE_WIDTH: 0.508444
G1 X124.913 Y122.99 E.00174
; LINE_WIDTH: 0.556722
G1 X124.875 Y123.015 E.00192
; OBJECT_ID: 394
; WIPE_START
G1 F7006.601
G1 X124.913 Y122.99 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X118.185 Y126.594 Z1.4 F42000
G1 X105.74 Y133.26 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4572
M204 S5000
M73 P33 R14
G1 X105.74 Y122.74 E.32325
G1 X111.06 Y122.74 E.16347
G1 X111.06 Y133.26 E.32325
G1 X105.8 Y133.26 E.16163
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.789 Y131.26 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.658 Y123.629 Z1.4 F42000
G1 X105.64 Y122.61 Z1.4
G1 Z1
G1 E.8 F1800
G1 F4572
M204 S5000
G1 X105.64 Y121.39 E.03749
G1 X111.16 Y121.39 E.16961
G1 X111.16 Y122.61 E.03749
G1 X105.7 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.64 Y121.39 E-.46416
G1 X106.419 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.924 Y129.006 Z1.4 F42000
G1 X105.64 Y133.39 Z1.4
G1 Z1
G1 E.8 F1800
G1 F4572
M204 S5000
G1 X111.16 Y133.39 E.16961
G1 X111.16 Y134.61 E.03749
G1 X105.64 Y134.61 E.16961
G1 X105.64 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X107.64 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.918 Y125.993 Z1.4 F42000
G1 X104.81 Y121.211 Z1.4
G1 Z1
G1 E.8 F1800
G1 F4572
M204 S5000
G3 X104.993 Y121.01 I.192 J-.008 E.00925
G1 X111.846 Y121.017 E.21056
G3 X111.99 Y121.21 I-.051 J.188 E.00799
G1 X111.989 Y134.816 E.41807
G3 X111.809 Y134.99 I-.193 J-.02 E.00834
G1 X104.947 Y134.982 E.21085
G3 X104.81 Y134.792 I.056 J-.185 E.00775
G1 X104.81 Y121.271 E.41548
M204 S10000
G1 X105.225 Y121.206 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.482436
G1 F4572
M204 S6000
G1 X105.225 Y122.806 E.05729
G1 X105.25 Y122.911 E.00385
; LINE_WIDTH: 0.55586
G1 X105.275 Y123.015 E.0045
; LINE_WIDTH: 0.58075
G1 X105.275 Y132.985 E.43692
G1 X105.313 Y133.01 E.00201
; LINE_WIDTH: 0.508445
G1 X105.352 Y133.034 E.00174
; LINE_WIDTH: 0.460168
G1 X105.39 Y133.059 E.00156
; LINE_WIDTH: 0.41189
G1 X105.429 Y133.084 E.00138
; LINE_WIDTH: 0.363613
G1 X105.467 Y133.109 E.0012
; LINE_WIDTH: 0.315336
G1 X105.506 Y133.134 E.00102
; LINE_WIDTH: 0.267059
G1 X105.544 Y133.159 E.00084
M204 S10000
G1 X105.275 Y132.985 F42000
; LINE_WIDTH: 0.55586
G1 F4572
M204 S6000
G1 X105.25 Y133.089 E.0045
; LINE_WIDTH: 0.482435
G1 X105.225 Y133.194 E.00385
G1 X105.225 Y134.794 E.0573
M204 S10000
G1 X111.575 Y134.793 F42000
; LINE_WIDTH: 0.48086
G1 F4572
M204 S6000
G1 X111.575 Y133.194 E.05708
; LINE_WIDTH: 0.50586
G1 X111.55 Y133.089 E.00406
; LINE_WIDTH: 0.580593
G1 X111.525 Y132.985 E.00471
G1 X111.525 Y123.015 E.4368
; LINE_WIDTH: 0.55586
G1 X111.55 Y122.911 E.0045
; LINE_WIDTH: 0.482436
G1 X111.575 Y122.806 E.00385
G1 X111.575 Y121.206 E.05729
; WIPE_START
G1 F8190.836
G1 X111.575 Y122.806 E-.7121
G1 X111.55 Y122.911 E-.0479
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.544 Y122.841 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.267059
G1 F4572
M204 S6000
G1 X105.506 Y122.866 E.00084
; LINE_WIDTH: 0.315336
G1 X105.467 Y122.891 E.00102
; LINE_WIDTH: 0.363613
G1 X105.429 Y122.916 E.0012
; LINE_WIDTH: 0.41189
G1 X105.39 Y122.941 E.00138
; LINE_WIDTH: 0.460167
G1 X105.352 Y122.966 E.00156
; LINE_WIDTH: 0.508444
G1 X105.313 Y122.99 E.00174
; LINE_WIDTH: 0.556722
G1 X105.275 Y123.015 E.00192
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7006.601
G1 X105.313 Y122.99 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 6/73
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z1.4 I-.271 J1.186 P1  F42000
G1 X150.26 Y133.26 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4553
M204 S5000
G1 X144.94 Y133.26 E.16347
G1 X144.94 Y122.74 E.32325
G1 X150.26 Y122.74 E.16347
G1 X150.26 Y133.2 E.32141
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.26 Y133.223 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.742 Y125.735 Z1.6 F42000
G1 X150.36 Y122.61 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F4553
M204 S5000
G1 X144.84 Y122.61 E.16961
G1 X144.84 Y121.39 E.03749
G1 X150.36 Y121.39 E.16961
G1 X150.36 Y122.55 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.36 Y122.572 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.998 Y129.83 Z1.6 F42000
G1 X144.84 Y133.39 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F4553
M204 S5000
G1 X150.36 Y133.39 E.16961
G1 X150.36 Y134.61 E.03749
G1 X144.84 Y134.61 E.16961
G1 X144.84 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X146.84 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.122 Y125.992 Z1.6 F42000
G1 X144.011 Y121.184 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F4553
M204 S5000
G3 X144.191 Y121.01 I.196 J.023 E.00832
G1 X151.006 Y121.01 E.20941
G3 X151.19 Y121.21 I-.018 J.201 E.00914
G1 X151.189 Y134.816 E.41808
G3 X151.007 Y134.99 I-.193 J-.021 E.0084
G1 X144.21 Y134.99 E.20884
G3 X144.01 Y134.792 I-.007 J-.193 E.00969
G1 X144.011 Y121.244 E.4163
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.03 Y121.117 E-.04889
G1 X144.073 Y121.06 E-.02705
G1 X144.191 Y121.01 E-.04873
G1 X145.863 Y121.01 E-.63534
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 6 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.6
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer6 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X144.425 Y121.206 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.482436
G1 F4553
M204 S6000
G1 X144.425 Y122.806 E.05729
G1 X144.45 Y122.911 E.00385
; LINE_WIDTH: 0.55586
G1 X144.475 Y123.015 E.0045
; LINE_WIDTH: 0.58075
G1 X144.475 Y132.985 E.43692
G1 X144.513 Y133.01 E.00201
; LINE_WIDTH: 0.508445
G1 X144.552 Y133.034 E.00174
; LINE_WIDTH: 0.460168
G1 X144.59 Y133.059 E.00156
; LINE_WIDTH: 0.41189
G1 X144.629 Y133.084 E.00138
; LINE_WIDTH: 0.363613
G1 X144.667 Y133.109 E.0012
; LINE_WIDTH: 0.315336
G1 X144.706 Y133.134 E.00102
; LINE_WIDTH: 0.267059
G1 X144.744 Y133.159 E.00084
M204 S10000
G1 X144.475 Y132.985 F42000
; LINE_WIDTH: 0.55586
G1 F4553
M204 S6000
G1 X144.45 Y133.089 E.0045
; LINE_WIDTH: 0.482435
G1 X144.425 Y133.194 E.00385
G1 X144.425 Y134.794 E.0573
M204 S10000
G1 X150.775 Y134.794 F42000
; LINE_WIDTH: 0.48086
G1 F4553
M204 S6000
G1 X150.775 Y133.194 E.05708
; LINE_WIDTH: 0.50586
G1 X150.75 Y133.089 E.00406
; LINE_WIDTH: 0.580593
G1 X150.725 Y132.985 E.00471
G1 X150.725 Y123.015 E.4368
; LINE_WIDTH: 0.55586
G1 X150.75 Y122.911 E.0045
; LINE_WIDTH: 0.482436
G1 X150.775 Y122.806 E.00385
G1 X150.775 Y121.206 E.05729
; WIPE_START
G1 F8190.836
G1 X150.775 Y122.806 E-.7121
G1 X150.75 Y122.911 E-.0479
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.744 Y122.841 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.267059
G1 F4553
M204 S6000
G1 X144.706 Y122.866 E.00084
; LINE_WIDTH: 0.315336
G1 X144.667 Y122.891 E.00102
; LINE_WIDTH: 0.363613
G1 X144.629 Y122.916 E.0012
; LINE_WIDTH: 0.41189
G1 X144.59 Y122.941 E.00138
; LINE_WIDTH: 0.460167
G1 X144.552 Y122.966 E.00156
; LINE_WIDTH: 0.508444
G1 X144.513 Y122.99 E.00174
; LINE_WIDTH: 0.556722
G1 X144.475 Y123.015 E.00192
; OBJECT_ID: 405
; WIPE_START
G1 F7006.601
G1 X144.513 Y122.99 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X136.882 Y122.891 Z1.6 F42000
G1 X125.34 Y122.74 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4553
M204 S5000
G1 X130.66 Y122.74 E.16347
G1 X130.66 Y133.26 E.32325
G1 X125.34 Y133.26 E.16347
G1 X125.34 Y122.8 E.32141
M204 S250
G1 X125.24 Y122.61 F42000
G1 F4553
M204 S5000
G1 X125.24 Y121.39 E.03749
G1 X130.76 Y121.39 E.16961
G1 X130.76 Y122.61 E.03749
G1 X125.3 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.24 Y121.39 E-.46416
G1 X126.019 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.524 Y129.006 Z1.6 F42000
G1 X125.24 Y133.39 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F4553
M204 S5000
G1 X130.76 Y133.39 E.16961
G1 X130.76 Y134.61 E.03749
G1 X125.24 Y134.61 E.16961
G1 X125.24 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.24 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.522 Y125.992 Z1.6 F42000
G1 X124.411 Y121.184 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F4553
M204 S5000
G3 X124.591 Y121.01 I.196 J.023 E.00832
G1 X131.406 Y121.01 E.20941
G3 X131.59 Y121.21 I-.018 J.201 E.00914
G1 X131.589 Y134.816 E.41808
G3 X131.407 Y134.99 I-.193 J-.021 E.0084
G1 X124.61 Y134.99 E.20884
G3 X124.41 Y134.792 I-.007 J-.193 E.00969
G1 X124.411 Y121.244 E.4163
M204 S10000
G1 X124.825 Y121.206 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.482436
G1 F4553
M204 S6000
G1 X124.825 Y122.806 E.05729
G1 X124.85 Y122.911 E.00385
; LINE_WIDTH: 0.55586
G1 X124.875 Y123.015 E.0045
; LINE_WIDTH: 0.58075
G1 X124.875 Y132.985 E.43692
G1 X124.913 Y133.01 E.00201
; LINE_WIDTH: 0.508445
G1 X124.952 Y133.034 E.00174
; LINE_WIDTH: 0.460168
G1 X124.99 Y133.059 E.00156
; LINE_WIDTH: 0.41189
G1 X125.029 Y133.084 E.00138
; LINE_WIDTH: 0.363613
G1 X125.067 Y133.109 E.0012
; LINE_WIDTH: 0.315336
G1 X125.106 Y133.134 E.00102
; LINE_WIDTH: 0.267059
G1 X125.144 Y133.159 E.00084
M204 S10000
G1 X124.875 Y132.985 F42000
; LINE_WIDTH: 0.55586
G1 F4553
M204 S6000
G1 X124.85 Y133.089 E.0045
; LINE_WIDTH: 0.482435
G1 X124.825 Y133.194 E.00385
G1 X124.825 Y134.794 E.0573
M204 S10000
G1 X131.175 Y134.794 F42000
; LINE_WIDTH: 0.48086
G1 F4553
M204 S6000
G1 X131.175 Y133.194 E.05708
; LINE_WIDTH: 0.50586
G1 X131.15 Y133.089 E.00406
; LINE_WIDTH: 0.580593
G1 X131.125 Y132.985 E.00471
G1 X131.125 Y123.015 E.4368
; LINE_WIDTH: 0.55586
G1 X131.15 Y122.911 E.0045
; LINE_WIDTH: 0.482436
G1 X131.175 Y122.806 E.00385
G1 X131.175 Y121.206 E.05729
; WIPE_START
G1 F8190.836
G1 X131.175 Y122.806 E-.7121
G1 X131.15 Y122.911 E-.0479
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.144 Y122.841 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.267059
G1 F4553
M204 S6000
G1 X125.106 Y122.866 E.00084
; LINE_WIDTH: 0.315336
G1 X125.067 Y122.891 E.00102
; LINE_WIDTH: 0.363613
G1 X125.029 Y122.916 E.0012
; LINE_WIDTH: 0.41189
G1 X124.99 Y122.941 E.00138
; LINE_WIDTH: 0.460167
G1 X124.952 Y122.966 E.00156
; LINE_WIDTH: 0.508444
G1 X124.913 Y122.99 E.00174
; LINE_WIDTH: 0.556722
G1 X124.875 Y123.015 E.00192
; OBJECT_ID: 394
; WIPE_START
G1 F7006.601
G1 X124.913 Y122.99 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X118.185 Y126.594 Z1.6 F42000
G1 X105.74 Y133.26 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4553
M204 S5000
G1 X105.74 Y122.74 E.32325
G1 X111.06 Y122.74 E.16347
G1 X111.06 Y133.26 E.32325
G1 X105.8 Y133.26 E.16163
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.789 Y131.26 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.658 Y123.629 Z1.6 F42000
G1 X105.64 Y122.61 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F4553
M204 S5000
G1 X105.64 Y121.39 E.03749
G1 X111.16 Y121.39 E.16961
G1 X111.16 Y122.61 E.03749
G1 X105.7 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.64 Y121.39 E-.46416
G1 X106.419 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.924 Y129.006 Z1.6 F42000
G1 X105.64 Y133.39 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F4553
M204 S5000
G1 X111.16 Y133.39 E.16961
G1 X111.16 Y134.61 E.03749
G1 X105.64 Y134.61 E.16961
G1 X105.64 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X107.64 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.922 Y125.992 Z1.6 F42000
G1 X104.811 Y121.184 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F4553
M204 S5000
G3 X104.991 Y121.01 I.196 J.023 E.00832
G1 X111.806 Y121.01 E.20941
G3 X111.99 Y121.21 I-.018 J.201 E.00914
G1 X111.989 Y134.816 E.41808
G3 X111.807 Y134.99 I-.193 J-.021 E.0084
G1 X105.01 Y134.99 E.20884
G3 X104.81 Y134.792 I-.007 J-.193 E.00969
G1 X104.811 Y121.244 E.4163
M204 S10000
G1 X105.225 Y121.206 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.482436
G1 F4553
M204 S6000
G1 X105.225 Y122.806 E.05729
G1 X105.25 Y122.911 E.00385
; LINE_WIDTH: 0.55586
G1 X105.275 Y123.015 E.0045
; LINE_WIDTH: 0.58075
G1 X105.275 Y132.985 E.43692
G1 X105.313 Y133.01 E.00201
; LINE_WIDTH: 0.508445
G1 X105.352 Y133.034 E.00174
; LINE_WIDTH: 0.460168
G1 X105.39 Y133.059 E.00156
; LINE_WIDTH: 0.41189
G1 X105.429 Y133.084 E.00138
; LINE_WIDTH: 0.363613
G1 X105.467 Y133.109 E.0012
; LINE_WIDTH: 0.315336
G1 X105.506 Y133.134 E.00102
; LINE_WIDTH: 0.267059
G1 X105.544 Y133.159 E.00084
M204 S10000
G1 X105.275 Y132.985 F42000
; LINE_WIDTH: 0.55586
G1 F4553
M204 S6000
G1 X105.25 Y133.089 E.0045
; LINE_WIDTH: 0.482435
G1 X105.225 Y133.194 E.00385
G1 X105.225 Y134.794 E.0573
M204 S10000
G1 X111.575 Y134.794 F42000
; LINE_WIDTH: 0.48086
G1 F4553
M204 S6000
G1 X111.575 Y133.194 E.05708
; LINE_WIDTH: 0.50586
G1 X111.55 Y133.089 E.00406
; LINE_WIDTH: 0.580593
G1 X111.525 Y132.985 E.00471
G1 X111.525 Y123.015 E.4368
; LINE_WIDTH: 0.55586
G1 X111.55 Y122.911 E.0045
; LINE_WIDTH: 0.482436
G1 X111.575 Y122.806 E.00385
G1 X111.575 Y121.206 E.05729
; WIPE_START
G1 F8190.836
M73 P34 R14
G1 X111.575 Y122.806 E-.7121
G1 X111.55 Y122.911 E-.0479
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.544 Y122.841 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.267059
G1 F4553
M204 S6000
G1 X105.506 Y122.866 E.00084
; LINE_WIDTH: 0.315336
G1 X105.467 Y122.891 E.00102
; LINE_WIDTH: 0.363613
G1 X105.429 Y122.916 E.0012
; LINE_WIDTH: 0.41189
G1 X105.39 Y122.941 E.00138
; LINE_WIDTH: 0.460167
G1 X105.352 Y122.966 E.00156
; LINE_WIDTH: 0.508444
G1 X105.313 Y122.99 E.00174
; LINE_WIDTH: 0.556722
G1 X105.275 Y123.015 E.00192
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7006.601
G1 X105.313 Y122.99 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 7/73
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z1.6 I-.271 J1.186 P1  F42000
G1 X150.26 Y133.26 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4436
M204 S5000
G1 X144.94 Y133.26 E.16347
G1 X144.94 Y122.74 E.32325
G1 X150.26 Y122.74 E.16347
G1 X150.26 Y133.2 E.32141
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.26 Y133.223 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.742 Y125.735 Z1.8 F42000
G1 X150.36 Y122.61 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F4436
M204 S5000
G1 X144.84 Y122.61 E.16961
G1 X144.84 Y121.39 E.03749
G1 X150.36 Y121.39 E.16961
G1 X150.36 Y122.55 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.36 Y122.572 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.998 Y129.83 Z1.8 F42000
G1 X144.84 Y133.39 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F4436
M204 S5000
G1 X150.36 Y133.39 E.16961
G1 X150.36 Y134.61 E.03749
G1 X144.84 Y134.61 E.16961
G1 X144.84 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X146.84 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.131 Y125.99 Z1.8 F42000
G1 X144.018 Y121.147 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F4436
M204 S5000
G3 X144.191 Y121.01 I.185 J.056 E.00723
G1 X151.006 Y121.01 E.2094
G3 X151.19 Y121.21 I-.018 J.201 E.00913
G1 X151.189 Y134.816 E.41809
G3 X151.007 Y134.99 I-.193 J-.02 E.00841
G1 X144.211 Y134.99 E.20883
G3 X144.01 Y134.792 I-.008 J-.193 E.00971
G1 X144.018 Y121.207 E.41742
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.073 Y121.06 E-.05987
G1 X144.191 Y121.01 E-.04878
G1 X145.905 Y121.01 E-.65135
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 7 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.8
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer7 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X144.425 Y121.206 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.482436
G1 F4436
M204 S6000
G1 X144.425 Y122.806 E.05729
G1 X144.45 Y122.911 E.00385
; LINE_WIDTH: 0.55586
G1 X144.475 Y123.015 E.0045
; LINE_WIDTH: 0.556722
G1 X144.513 Y122.99 E.00192
; LINE_WIDTH: 0.508444
G1 X144.552 Y122.966 E.00174
; LINE_WIDTH: 0.460167
G1 X144.59 Y122.941 E.00156
; LINE_WIDTH: 0.41189
G1 X144.629 Y122.916 E.00138
; LINE_WIDTH: 0.363613
G1 X144.667 Y122.891 E.0012
; LINE_WIDTH: 0.315336
G1 X144.706 Y122.866 E.00102
; LINE_WIDTH: 0.267059
G1 X144.744 Y122.841 E.00084
M204 S10000
G1 X144.475 Y123.015 F42000
; LINE_WIDTH: 0.58075
G1 F4436
M204 S6000
G1 X144.475 Y132.985 E.43692
G1 X144.513 Y133.01 E.00201
; LINE_WIDTH: 0.508445
G1 X144.552 Y133.034 E.00174
; LINE_WIDTH: 0.460168
G1 X144.59 Y133.059 E.00156
; LINE_WIDTH: 0.41189
G1 X144.629 Y133.084 E.00138
; LINE_WIDTH: 0.363613
G1 X144.667 Y133.109 E.0012
; LINE_WIDTH: 0.315336
G1 X144.706 Y133.134 E.00102
; LINE_WIDTH: 0.267059
G1 X144.744 Y133.159 E.00084
M204 S10000
G1 X144.475 Y132.985 F42000
; LINE_WIDTH: 0.55586
G1 F4436
M204 S6000
G1 X144.45 Y133.089 E.0045
; LINE_WIDTH: 0.482435
G1 X144.425 Y133.194 E.00385
G1 X144.425 Y134.794 E.0573
M204 S10000
G1 X150.775 Y134.793 F42000
; LINE_WIDTH: 0.480858
G1 F4436
M204 S6000
G1 X150.775 Y133.194 E.05708
; LINE_WIDTH: 0.505859
G1 X150.75 Y133.089 E.00406
; LINE_WIDTH: 0.580586
G1 X150.725 Y132.985 E.00471
G1 X150.725 Y123.015 E.43679
; LINE_WIDTH: 0.56418
G1 X150.742 Y122.946 E.00305
; LINE_WIDTH: 0.530846
G1 X150.758 Y122.876 E.00285
; LINE_WIDTH: 0.481556
G1 X150.775 Y122.806 E.00256
G1 X150.775 Y121.206 E.05717
; OBJECT_ID: 405
; WIPE_START
G1 F8207.265
G1 X150.775 Y122.806 E-.72738
G1 X150.758 Y122.876 E-.03262
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X143.126 Y122.835 Z1.8 F42000
G1 X125.34 Y122.74 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4436
M204 S5000
G1 X130.66 Y122.74 E.16347
G1 X130.66 Y133.26 E.32325
G1 X125.34 Y133.26 E.16347
G1 X125.34 Y122.8 E.32141
M204 S250
G1 X125.24 Y122.61 F42000
G1 F4436
M204 S5000
G1 X125.24 Y121.39 E.03749
G1 X130.76 Y121.39 E.16961
G1 X130.76 Y122.61 E.03749
G1 X125.3 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.24 Y121.39 E-.46416
G1 X126.019 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.524 Y129.006 Z1.8 F42000
G1 X125.24 Y133.39 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F4436
M204 S5000
G1 X130.76 Y133.39 E.16961
G1 X130.76 Y134.61 E.03749
G1 X125.24 Y134.61 E.16961
G1 X125.24 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.24 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.531 Y125.99 Z1.8 F42000
G1 X124.418 Y121.147 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F4436
M204 S5000
G3 X124.591 Y121.01 I.185 J.056 E.00723
G1 X131.406 Y121.01 E.2094
G3 X131.59 Y121.21 I-.018 J.201 E.00913
G1 X131.589 Y134.816 E.41809
G3 X131.407 Y134.99 I-.193 J-.02 E.00841
G1 X124.611 Y134.99 E.20883
G3 X124.41 Y134.792 I-.008 J-.193 E.00971
G1 X124.418 Y121.207 E.41742
M204 S10000
G1 X124.825 Y121.206 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.482436
G1 F4436
M204 S6000
G1 X124.825 Y122.806 E.05729
G1 X124.85 Y122.911 E.00385
; LINE_WIDTH: 0.55586
G1 X124.875 Y123.015 E.0045
; LINE_WIDTH: 0.556722
G1 X124.913 Y122.99 E.00192
; LINE_WIDTH: 0.508444
G1 X124.952 Y122.966 E.00174
; LINE_WIDTH: 0.460167
G1 X124.99 Y122.941 E.00156
; LINE_WIDTH: 0.41189
G1 X125.029 Y122.916 E.00138
; LINE_WIDTH: 0.363613
G1 X125.067 Y122.891 E.0012
; LINE_WIDTH: 0.315336
G1 X125.106 Y122.866 E.00102
; LINE_WIDTH: 0.267059
G1 X125.144 Y122.841 E.00084
M204 S10000
G1 X124.875 Y123.015 F42000
; LINE_WIDTH: 0.58075
G1 F4436
M204 S6000
G1 X124.875 Y132.985 E.43692
G1 X124.913 Y133.01 E.00201
; LINE_WIDTH: 0.508445
G1 X124.952 Y133.034 E.00174
; LINE_WIDTH: 0.460168
G1 X124.99 Y133.059 E.00156
; LINE_WIDTH: 0.41189
G1 X125.029 Y133.084 E.00138
; LINE_WIDTH: 0.363613
G1 X125.067 Y133.109 E.0012
; LINE_WIDTH: 0.315336
G1 X125.106 Y133.134 E.00102
; LINE_WIDTH: 0.267059
G1 X125.144 Y133.159 E.00084
M204 S10000
G1 X124.875 Y132.985 F42000
; LINE_WIDTH: 0.55586
G1 F4436
M204 S6000
G1 X124.85 Y133.089 E.0045
; LINE_WIDTH: 0.482435
G1 X124.825 Y133.194 E.00385
G1 X124.825 Y134.794 E.0573
M204 S10000
G1 X131.175 Y134.793 F42000
; LINE_WIDTH: 0.480858
G1 F4436
M204 S6000
G1 X131.175 Y133.194 E.05708
; LINE_WIDTH: 0.505859
G1 X131.15 Y133.089 E.00406
; LINE_WIDTH: 0.580586
G1 X131.125 Y132.985 E.00471
G1 X131.125 Y123.015 E.43679
; LINE_WIDTH: 0.56418
G1 X131.142 Y122.946 E.00305
; LINE_WIDTH: 0.530846
G1 X131.158 Y122.876 E.00285
; LINE_WIDTH: 0.481556
G1 X131.175 Y122.806 E.00256
G1 X131.175 Y121.206 E.05717
; OBJECT_ID: 394
; WIPE_START
G1 F8207.265
G1 X131.175 Y122.806 E-.72738
G1 X131.158 Y122.876 E-.03262
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X124.093 Y125.762 Z1.8 F42000
G1 X105.74 Y133.26 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4436
M204 S5000
G1 X105.74 Y122.74 E.32325
G1 X111.06 Y122.74 E.16347
G1 X111.06 Y133.26 E.32325
G1 X105.8 Y133.26 E.16163
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.789 Y131.26 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.658 Y123.629 Z1.8 F42000
G1 X105.64 Y122.61 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F4436
M204 S5000
G1 X105.64 Y121.39 E.03749
G1 X111.16 Y121.39 E.16961
G1 X111.16 Y122.61 E.03749
G1 X105.7 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.64 Y121.39 E-.46416
G1 X106.419 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.924 Y129.006 Z1.8 F42000
G1 X105.64 Y133.39 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F4436
M204 S5000
G1 X111.16 Y133.39 E.16961
G1 X111.16 Y134.61 E.03749
G1 X105.64 Y134.61 E.16961
G1 X105.64 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X107.64 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.931 Y125.99 Z1.8 F42000
G1 X104.818 Y121.147 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F4436
M204 S5000
G3 X104.991 Y121.01 I.185 J.056 E.00723
G1 X111.806 Y121.01 E.2094
G3 X111.99 Y121.21 I-.018 J.201 E.00913
G1 X111.989 Y134.816 E.41809
G3 X111.807 Y134.99 I-.193 J-.02 E.00841
G1 X105.011 Y134.99 E.20883
G3 X104.81 Y134.792 I-.008 J-.193 E.00971
G1 X104.818 Y121.207 E.41742
M204 S10000
G1 X105.225 Y121.206 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.482436
G1 F4436
M204 S6000
G1 X105.225 Y122.806 E.05729
G1 X105.25 Y122.911 E.00385
; LINE_WIDTH: 0.55586
G1 X105.275 Y123.015 E.0045
; LINE_WIDTH: 0.556722
G1 X105.313 Y122.99 E.00192
; LINE_WIDTH: 0.508444
G1 X105.352 Y122.966 E.00174
; LINE_WIDTH: 0.460167
G1 X105.39 Y122.941 E.00156
; LINE_WIDTH: 0.41189
G1 X105.429 Y122.916 E.00138
; LINE_WIDTH: 0.363613
G1 X105.467 Y122.891 E.0012
; LINE_WIDTH: 0.315336
G1 X105.506 Y122.866 E.00102
; LINE_WIDTH: 0.267059
G1 X105.544 Y122.841 E.00084
M204 S10000
G1 X105.275 Y123.015 F42000
; LINE_WIDTH: 0.58075
G1 F4436
M204 S6000
G1 X105.275 Y132.985 E.43692
G1 X105.313 Y133.01 E.00201
; LINE_WIDTH: 0.508445
G1 X105.352 Y133.034 E.00174
; LINE_WIDTH: 0.460168
G1 X105.39 Y133.059 E.00156
; LINE_WIDTH: 0.41189
G1 X105.429 Y133.084 E.00138
; LINE_WIDTH: 0.363613
G1 X105.467 Y133.109 E.0012
; LINE_WIDTH: 0.315336
G1 X105.506 Y133.134 E.00102
; LINE_WIDTH: 0.267059
G1 X105.544 Y133.159 E.00084
M204 S10000
G1 X105.275 Y132.985 F42000
; LINE_WIDTH: 0.55586
G1 F4436
M204 S6000
G1 X105.25 Y133.089 E.0045
; LINE_WIDTH: 0.482435
G1 X105.225 Y133.194 E.00385
G1 X105.225 Y134.794 E.0573
M204 S10000
G1 X111.575 Y134.793 F42000
; LINE_WIDTH: 0.480858
G1 F4436
M204 S6000
G1 X111.575 Y133.194 E.05708
; LINE_WIDTH: 0.505859
G1 X111.55 Y133.089 E.00406
; LINE_WIDTH: 0.580586
G1 X111.525 Y132.985 E.00471
G1 X111.525 Y123.015 E.43679
; LINE_WIDTH: 0.56418
G1 X111.542 Y122.946 E.00305
; LINE_WIDTH: 0.530846
G1 X111.558 Y122.876 E.00285
; LINE_WIDTH: 0.481556
G1 X111.575 Y122.806 E.00256
G1 X111.575 Y121.206 E.05717
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8207.265
G1 X111.575 Y122.806 E-.72738
G1 X111.558 Y122.876 E-.03262
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 8/73
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z1.8 I-.315 J1.175 P1  F42000
G1 X150.26 Y133.26 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4545
M204 S5000
G1 X144.94 Y133.26 E.16347
G1 X144.94 Y122.74 E.32325
G1 X150.26 Y122.74 E.16347
G1 X150.26 Y133.2 E.32141
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.26 Y133.223 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.742 Y125.735 Z2 F42000
G1 X150.36 Y122.61 Z2
G1 Z1.6
G1 E.8 F1800
G1 F4545
M204 S5000
G1 X144.84 Y122.61 E.16961
G1 X144.84 Y121.39 E.03749
G1 X150.36 Y121.39 E.16961
G1 X150.36 Y122.55 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.36 Y122.572 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.998 Y129.83 Z2 F42000
G1 X144.84 Y133.39 Z2
G1 Z1.6
G1 E.8 F1800
G1 F4545
M204 S5000
G1 X150.36 Y133.39 E.16961
G1 X150.36 Y134.61 E.03749
G1 X144.84 Y134.61 E.16961
G1 X144.84 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X146.84 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.135 Y125.989 Z2 F42000
G1 X144.023 Y121.134 Z2
G1 Z1.6
G1 E.8 F1800
G1 F4545
M204 S5000
G3 X144.193 Y121.01 I.18 J.069 E.00685
G1 X151.035 Y121.014 E.21021
G3 X151.19 Y121.21 I-.04 J.191 E.00835
G1 X151.189 Y134.816 E.41807
G3 X151.007 Y134.99 I-.193 J-.02 E.00841
G1 X144.21 Y134.99 E.20884
G3 X144.01 Y134.792 I-.007 J-.193 E.00969
G1 X144.01 Y121.21 E.41734
G3 X144.01 Y121.193 I.192 J-.008 E.00054
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.052 Y121.081 E-.04536
G1 X144.108 Y121.034 E-.02785
G1 X144.193 Y121.01 E-.03353
G1 X145.912 Y121.011 E-.65327
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 8 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer8 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X144.425 Y121.206 F42000
M73 P35 R14
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.482436
G1 F4545
M204 S6000
G1 X144.425 Y122.806 E.05729
G1 X144.45 Y122.911 E.00385
; LINE_WIDTH: 0.55586
G1 X144.475 Y123.015 E.0045
; LINE_WIDTH: 0.58075
G1 X144.475 Y132.985 E.43692
G1 X144.513 Y133.01 E.00201
; LINE_WIDTH: 0.508445
G1 X144.552 Y133.034 E.00174
; LINE_WIDTH: 0.460168
G1 X144.59 Y133.059 E.00156
; LINE_WIDTH: 0.41189
G1 X144.629 Y133.084 E.00138
; LINE_WIDTH: 0.363613
G1 X144.667 Y133.109 E.0012
; LINE_WIDTH: 0.315336
G1 X144.706 Y133.134 E.00102
; LINE_WIDTH: 0.267059
G1 X144.744 Y133.159 E.00084
M204 S10000
G1 X144.475 Y132.985 F42000
; LINE_WIDTH: 0.55586
G1 F4545
M204 S6000
G1 X144.45 Y133.089 E.0045
; LINE_WIDTH: 0.482435
G1 X144.425 Y133.194 E.00385
G1 X144.425 Y134.794 E.0573
M204 S10000
G1 X150.775 Y134.793 F42000
; LINE_WIDTH: 0.48086
G1 F4545
M204 S6000
G1 X150.775 Y133.194 E.05708
; LINE_WIDTH: 0.50586
G1 X150.75 Y133.089 E.00406
; LINE_WIDTH: 0.580593
G1 X150.725 Y132.985 E.00471
G1 X150.725 Y123.015 E.4368
; LINE_WIDTH: 0.55586
G1 X150.75 Y122.911 E.0045
; LINE_WIDTH: 0.482436
G1 X150.775 Y122.806 E.00385
G1 X150.775 Y121.206 E.05729
; WIPE_START
G1 F8190.837
G1 X150.775 Y122.806 E-.7121
G1 X150.75 Y122.911 E-.0479
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.744 Y122.841 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.267059
G1 F4545
M204 S6000
G1 X144.706 Y122.866 E.00084
; LINE_WIDTH: 0.315336
G1 X144.667 Y122.891 E.00102
; LINE_WIDTH: 0.363613
G1 X144.629 Y122.916 E.0012
; LINE_WIDTH: 0.41189
G1 X144.59 Y122.941 E.00138
; LINE_WIDTH: 0.460167
G1 X144.552 Y122.966 E.00156
; LINE_WIDTH: 0.508444
G1 X144.513 Y122.99 E.00174
; LINE_WIDTH: 0.556722
G1 X144.475 Y123.015 E.00192
; OBJECT_ID: 405
; WIPE_START
G1 F7006.601
G1 X144.513 Y122.99 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X136.882 Y122.891 Z2 F42000
G1 X125.34 Y122.74 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4545
M204 S5000
G1 X130.66 Y122.74 E.16347
G1 X130.66 Y133.26 E.32325
G1 X125.34 Y133.26 E.16347
G1 X125.34 Y122.8 E.32141
M204 S250
G1 X125.24 Y122.61 F42000
G1 F4545
M204 S5000
G1 X125.24 Y121.39 E.03749
G1 X130.76 Y121.39 E.16961
G1 X130.76 Y122.61 E.03749
G1 X125.3 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.24 Y121.39 E-.46416
G1 X126.019 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.524 Y129.006 Z2 F42000
G1 X125.24 Y133.39 Z2
G1 Z1.6
G1 E.8 F1800
G1 F4545
M204 S5000
G1 X130.76 Y133.39 E.16961
G1 X130.76 Y134.61 E.03749
G1 X125.24 Y134.61 E.16961
G1 X125.24 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.24 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.535 Y125.989 Z2 F42000
G1 X124.423 Y121.134 Z2
G1 Z1.6
G1 E.8 F1800
G1 F4545
M204 S5000
G3 X124.593 Y121.01 I.18 J.069 E.00685
G1 X131.435 Y121.014 E.21021
G3 X131.59 Y121.21 I-.04 J.191 E.00835
G1 X131.589 Y134.816 E.41807
G3 X131.407 Y134.99 I-.193 J-.02 E.00841
G1 X124.61 Y134.99 E.20884
G3 X124.41 Y134.792 I-.007 J-.193 E.00969
G1 X124.41 Y121.21 E.41734
G3 X124.41 Y121.193 I.192 J-.008 E.00054
M204 S10000
G1 X124.825 Y121.206 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.482436
G1 F4545
M204 S6000
G1 X124.825 Y122.806 E.05729
G1 X124.85 Y122.911 E.00385
; LINE_WIDTH: 0.55586
G1 X124.875 Y123.015 E.0045
; LINE_WIDTH: 0.58075
G1 X124.875 Y132.985 E.43692
G1 X124.913 Y133.01 E.00201
; LINE_WIDTH: 0.508445
G1 X124.952 Y133.034 E.00174
; LINE_WIDTH: 0.460168
G1 X124.99 Y133.059 E.00156
; LINE_WIDTH: 0.41189
G1 X125.029 Y133.084 E.00138
; LINE_WIDTH: 0.363613
G1 X125.067 Y133.109 E.0012
; LINE_WIDTH: 0.315336
G1 X125.106 Y133.134 E.00102
; LINE_WIDTH: 0.267059
G1 X125.144 Y133.159 E.00084
M204 S10000
G1 X124.875 Y132.985 F42000
; LINE_WIDTH: 0.55586
G1 F4545
M204 S6000
G1 X124.85 Y133.089 E.0045
; LINE_WIDTH: 0.482435
G1 X124.825 Y133.194 E.00385
G1 X124.825 Y134.794 E.0573
M204 S10000
G1 X131.175 Y134.793 F42000
; LINE_WIDTH: 0.48086
G1 F4545
M204 S6000
G1 X131.175 Y133.194 E.05708
; LINE_WIDTH: 0.50586
G1 X131.15 Y133.089 E.00406
; LINE_WIDTH: 0.580593
G1 X131.125 Y132.985 E.00471
G1 X131.125 Y123.015 E.4368
; LINE_WIDTH: 0.55586
G1 X131.15 Y122.911 E.0045
; LINE_WIDTH: 0.482436
G1 X131.175 Y122.806 E.00385
G1 X131.175 Y121.206 E.05729
; WIPE_START
G1 F8190.837
G1 X131.175 Y122.806 E-.7121
G1 X131.15 Y122.911 E-.0479
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.144 Y122.841 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.267059
G1 F4545
M204 S6000
G1 X125.106 Y122.866 E.00084
; LINE_WIDTH: 0.315336
G1 X125.067 Y122.891 E.00102
; LINE_WIDTH: 0.363613
G1 X125.029 Y122.916 E.0012
; LINE_WIDTH: 0.41189
G1 X124.99 Y122.941 E.00138
; LINE_WIDTH: 0.460167
G1 X124.952 Y122.966 E.00156
; LINE_WIDTH: 0.508444
G1 X124.913 Y122.99 E.00174
; LINE_WIDTH: 0.556722
G1 X124.875 Y123.015 E.00192
; OBJECT_ID: 394
; WIPE_START
G1 F7006.601
G1 X124.913 Y122.99 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X118.185 Y126.594 Z2 F42000
G1 X105.74 Y133.26 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4545
M204 S5000
G1 X105.74 Y122.74 E.32325
G1 X111.06 Y122.74 E.16347
G1 X111.06 Y133.26 E.32325
G1 X105.8 Y133.26 E.16163
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.789 Y131.26 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.658 Y123.629 Z2 F42000
G1 X105.64 Y122.61 Z2
G1 Z1.6
G1 E.8 F1800
G1 F4545
M204 S5000
G1 X105.64 Y121.39 E.03749
G1 X111.16 Y121.39 E.16961
G1 X111.16 Y122.61 E.03749
G1 X105.7 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.64 Y121.39 E-.46416
G1 X106.419 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.924 Y129.006 Z2 F42000
G1 X105.64 Y133.39 Z2
G1 Z1.6
G1 E.8 F1800
G1 F4545
M204 S5000
G1 X111.16 Y133.39 E.16961
G1 X111.16 Y134.61 E.03749
G1 X105.64 Y134.61 E.16961
G1 X105.64 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X107.64 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.935 Y125.989 Z2 F42000
G1 X104.823 Y121.134 Z2
G1 Z1.6
G1 E.8 F1800
G1 F4545
M204 S5000
G3 X104.993 Y121.01 I.18 J.069 E.00685
G1 X111.835 Y121.014 E.21021
G3 X111.99 Y121.21 I-.039 J.191 E.00835
G1 X111.989 Y134.816 E.41807
G3 X111.807 Y134.99 I-.193 J-.02 E.00841
G1 X105.01 Y134.99 E.20884
G3 X104.81 Y134.792 I-.007 J-.193 E.00969
G1 X104.81 Y121.21 E.41734
G3 X104.81 Y121.193 I.192 J-.008 E.00054
M204 S10000
G1 X105.225 Y121.206 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.482436
G1 F4545
M204 S6000
G1 X105.225 Y122.806 E.05729
G1 X105.25 Y122.911 E.00385
; LINE_WIDTH: 0.55586
G1 X105.275 Y123.015 E.0045
; LINE_WIDTH: 0.58075
G1 X105.275 Y132.985 E.43692
G1 X105.313 Y133.01 E.00201
; LINE_WIDTH: 0.508445
G1 X105.352 Y133.034 E.00174
; LINE_WIDTH: 0.460168
G1 X105.39 Y133.059 E.00156
; LINE_WIDTH: 0.41189
G1 X105.429 Y133.084 E.00138
; LINE_WIDTH: 0.363613
G1 X105.467 Y133.109 E.0012
; LINE_WIDTH: 0.315336
G1 X105.506 Y133.134 E.00102
; LINE_WIDTH: 0.267059
G1 X105.544 Y133.159 E.00084
M204 S10000
G1 X105.275 Y132.985 F42000
; LINE_WIDTH: 0.55586
G1 F4545
M204 S6000
G1 X105.25 Y133.089 E.0045
; LINE_WIDTH: 0.482435
G1 X105.225 Y133.194 E.00385
G1 X105.225 Y134.794 E.0573
M204 S10000
G1 X111.575 Y134.793 F42000
; LINE_WIDTH: 0.48086
G1 F4545
M204 S6000
G1 X111.575 Y133.194 E.05708
; LINE_WIDTH: 0.50586
G1 X111.55 Y133.089 E.00406
; LINE_WIDTH: 0.580593
G1 X111.525 Y132.985 E.00471
G1 X111.525 Y123.015 E.4368
; LINE_WIDTH: 0.55586
G1 X111.55 Y122.911 E.0045
; LINE_WIDTH: 0.482436
G1 X111.575 Y122.806 E.00385
G1 X111.575 Y121.206 E.05729
; WIPE_START
G1 F8190.837
G1 X111.575 Y122.806 E-.7121
G1 X111.55 Y122.911 E-.0479
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.544 Y122.841 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.267059
G1 F4545
M204 S6000
G1 X105.506 Y122.866 E.00084
; LINE_WIDTH: 0.315336
G1 X105.467 Y122.891 E.00102
; LINE_WIDTH: 0.363613
G1 X105.429 Y122.916 E.0012
; LINE_WIDTH: 0.41189
G1 X105.39 Y122.941 E.00138
; LINE_WIDTH: 0.460167
G1 X105.352 Y122.966 E.00156
; LINE_WIDTH: 0.508444
G1 X105.313 Y122.99 E.00174
; LINE_WIDTH: 0.556722
G1 X105.275 Y123.015 E.00192
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7006.601
G1 X105.313 Y122.99 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 9/73
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z2 I-.271 J1.186 P1  F42000
G1 X150.26 Y133.26 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4425
M204 S5000
G1 X144.94 Y133.26 E.16347
G1 X144.94 Y122.74 E.32325
G1 X150.26 Y122.74 E.16347
G1 X150.26 Y133.2 E.32141
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.26 Y133.223 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.742 Y125.735 Z2.2 F42000
G1 X150.36 Y122.61 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F4425
M204 S5000
G1 X144.84 Y122.61 E.16961
G1 X144.84 Y121.39 E.03749
G1 X150.36 Y121.39 E.16961
G1 X150.36 Y122.55 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.36 Y122.572 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.998 Y129.83 Z2.2 F42000
G1 X144.84 Y133.39 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F4425
M204 S5000
G1 X150.36 Y133.39 E.16961
G1 X150.36 Y134.61 E.03749
G1 X144.84 Y134.61 E.16961
G1 X144.84 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X146.84 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.135 Y125.989 Z2.2 F42000
G1 X144.023 Y121.134 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F4425
M204 S5000
G3 X144.193 Y121.01 I.18 J.069 E.00685
G1 X151.034 Y121.014 E.21022
G3 X151.19 Y121.209 I-.039 J.191 E.00832
G1 X151.189 Y134.816 E.41811
G3 X151.007 Y134.99 I-.195 J-.023 E.00838
G1 X144.211 Y134.99 E.20883
G3 X144.01 Y134.792 I-.008 J-.193 E.00971
G1 X144.01 Y121.211 E.41732
G3 X144.01 Y121.193 I.192 J-.008 E.00054
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.053 Y121.081 E-.04558
G1 X144.119 Y121.029 E-.03211
G1 X144.193 Y121.01 E-.02898
G1 X145.912 Y121.011 E-.65332
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 9 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.2
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer9 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X144.425 Y121.206 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.482436
G1 F4425
M204 S6000
G1 X144.425 Y122.806 E.05729
G1 X144.45 Y122.911 E.00385
; LINE_WIDTH: 0.55586
G1 X144.475 Y123.015 E.0045
; LINE_WIDTH: 0.556722
G1 X144.513 Y122.99 E.00192
; LINE_WIDTH: 0.508444
G1 X144.552 Y122.966 E.00174
; LINE_WIDTH: 0.460167
G1 X144.59 Y122.941 E.00156
; LINE_WIDTH: 0.41189
G1 X144.629 Y122.916 E.00138
; LINE_WIDTH: 0.363613
G1 X144.667 Y122.891 E.0012
; LINE_WIDTH: 0.315336
G1 X144.706 Y122.866 E.00102
; LINE_WIDTH: 0.267059
G1 X144.744 Y122.841 E.00084
M204 S10000
G1 X144.475 Y123.015 F42000
; LINE_WIDTH: 0.58075
G1 F4425
M204 S6000
G1 X144.475 Y132.985 E.43692
G1 X144.513 Y133.01 E.00201
; LINE_WIDTH: 0.508445
G1 X144.552 Y133.034 E.00174
; LINE_WIDTH: 0.460168
G1 X144.59 Y133.059 E.00156
; LINE_WIDTH: 0.41189
G1 X144.629 Y133.084 E.00138
; LINE_WIDTH: 0.363613
G1 X144.667 Y133.109 E.0012
; LINE_WIDTH: 0.315336
G1 X144.706 Y133.134 E.00102
; LINE_WIDTH: 0.267059
G1 X144.744 Y133.159 E.00084
M204 S10000
G1 X144.475 Y132.985 F42000
; LINE_WIDTH: 0.55586
G1 F4425
M204 S6000
G1 X144.45 Y133.089 E.0045
; LINE_WIDTH: 0.482435
G1 X144.425 Y133.194 E.00385
G1 X144.425 Y134.794 E.0573
M204 S10000
G1 X150.775 Y134.793 F42000
; LINE_WIDTH: 0.480857
G1 F4425
M204 S6000
G1 X150.775 Y133.194 E.05708
; LINE_WIDTH: 0.505858
G1 X150.75 Y133.089 E.00406
; LINE_WIDTH: 0.580578
G1 X150.725 Y132.985 E.00471
G1 X150.725 Y123.015 E.43678
; LINE_WIDTH: 0.564165
G1 X150.742 Y122.946 E.00305
; LINE_WIDTH: 0.53083
G1 X150.758 Y122.876 E.00285
; LINE_WIDTH: 0.481546
M73 P36 R14
G1 X150.775 Y122.806 E.00256
G1 X150.775 Y121.206 E.05717
; OBJECT_ID: 405
; WIPE_START
G1 F8207.455
G1 X150.775 Y122.806 E-.72738
G1 X150.758 Y122.876 E-.03262
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X143.126 Y122.835 Z2.2 F42000
G1 X125.34 Y122.74 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4425
M204 S5000
G1 X130.66 Y122.74 E.16347
G1 X130.66 Y133.26 E.32325
G1 X125.34 Y133.26 E.16347
G1 X125.34 Y122.8 E.32141
M204 S250
G1 X125.24 Y122.61 F42000
G1 F4425
M204 S5000
G1 X125.24 Y121.39 E.03749
G1 X130.76 Y121.39 E.16961
G1 X130.76 Y122.61 E.03749
G1 X125.3 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.24 Y121.39 E-.46416
G1 X126.019 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.524 Y129.006 Z2.2 F42000
G1 X125.24 Y133.39 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F4425
M204 S5000
G1 X130.76 Y133.39 E.16961
G1 X130.76 Y134.61 E.03749
G1 X125.24 Y134.61 E.16961
G1 X125.24 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.24 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.535 Y125.989 Z2.2 F42000
G1 X124.423 Y121.134 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F4425
M204 S5000
G3 X124.593 Y121.01 I.18 J.069 E.00685
G1 X131.434 Y121.014 E.21022
G3 X131.59 Y121.209 I-.039 J.191 E.00832
G1 X131.589 Y134.816 E.41811
G3 X131.407 Y134.99 I-.195 J-.023 E.00838
G1 X124.611 Y134.99 E.20883
G3 X124.41 Y134.792 I-.008 J-.193 E.00971
G1 X124.41 Y121.211 E.41732
G3 X124.41 Y121.193 I.192 J-.008 E.00054
M204 S10000
G1 X124.825 Y121.206 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.482436
G1 F4425
M204 S6000
G1 X124.825 Y122.806 E.05729
G1 X124.85 Y122.911 E.00385
; LINE_WIDTH: 0.55586
G1 X124.875 Y123.015 E.0045
; LINE_WIDTH: 0.556722
G1 X124.913 Y122.99 E.00192
; LINE_WIDTH: 0.508444
G1 X124.952 Y122.966 E.00174
; LINE_WIDTH: 0.460167
G1 X124.99 Y122.941 E.00156
; LINE_WIDTH: 0.41189
G1 X125.029 Y122.916 E.00138
; LINE_WIDTH: 0.363613
G1 X125.067 Y122.891 E.0012
; LINE_WIDTH: 0.315336
G1 X125.106 Y122.866 E.00102
; LINE_WIDTH: 0.267059
G1 X125.144 Y122.841 E.00084
M204 S10000
G1 X124.875 Y123.015 F42000
; LINE_WIDTH: 0.58075
G1 F4425
M204 S6000
G1 X124.875 Y132.985 E.43692
G1 X124.913 Y133.01 E.00201
; LINE_WIDTH: 0.508445
G1 X124.952 Y133.034 E.00174
; LINE_WIDTH: 0.460168
G1 X124.99 Y133.059 E.00156
; LINE_WIDTH: 0.41189
G1 X125.029 Y133.084 E.00138
; LINE_WIDTH: 0.363613
G1 X125.067 Y133.109 E.0012
; LINE_WIDTH: 0.315336
G1 X125.106 Y133.134 E.00102
; LINE_WIDTH: 0.267059
G1 X125.144 Y133.159 E.00084
M204 S10000
G1 X124.875 Y132.985 F42000
; LINE_WIDTH: 0.55586
G1 F4425
M204 S6000
G1 X124.85 Y133.089 E.0045
; LINE_WIDTH: 0.482435
G1 X124.825 Y133.194 E.00385
G1 X124.825 Y134.794 E.0573
M204 S10000
G1 X131.175 Y134.793 F42000
; LINE_WIDTH: 0.480857
G1 F4425
M204 S6000
G1 X131.175 Y133.194 E.05708
; LINE_WIDTH: 0.505858
G1 X131.15 Y133.089 E.00406
; LINE_WIDTH: 0.580578
G1 X131.125 Y132.985 E.00471
G1 X131.125 Y123.015 E.43678
; LINE_WIDTH: 0.564165
G1 X131.142 Y122.946 E.00305
; LINE_WIDTH: 0.53083
G1 X131.158 Y122.876 E.00285
; LINE_WIDTH: 0.481546
G1 X131.175 Y122.806 E.00256
G1 X131.175 Y121.206 E.05717
; OBJECT_ID: 394
; WIPE_START
G1 F8207.455
G1 X131.175 Y122.806 E-.72738
G1 X131.158 Y122.876 E-.03262
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X124.093 Y125.762 Z2.2 F42000
G1 X105.74 Y133.26 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4425
M204 S5000
G1 X105.74 Y122.74 E.32325
G1 X111.06 Y122.74 E.16347
G1 X111.06 Y133.26 E.32325
G1 X105.8 Y133.26 E.16163
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.789 Y131.26 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.658 Y123.629 Z2.2 F42000
G1 X105.64 Y122.61 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F4425
M204 S5000
G1 X105.64 Y121.39 E.03749
G1 X111.16 Y121.39 E.16961
G1 X111.16 Y122.61 E.03749
G1 X105.7 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.64 Y121.39 E-.46416
G1 X106.419 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.924 Y129.006 Z2.2 F42000
G1 X105.64 Y133.39 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F4425
M204 S5000
G1 X111.16 Y133.39 E.16961
G1 X111.16 Y134.61 E.03749
M73 P36 R13
G1 X105.64 Y134.61 E.16961
G1 X105.64 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X107.64 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.935 Y125.989 Z2.2 F42000
G1 X104.823 Y121.134 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F4425
M204 S5000
G3 X104.993 Y121.01 I.18 J.069 E.00685
G1 X111.834 Y121.014 E.21022
G3 X111.99 Y121.209 I-.039 J.191 E.00832
G1 X111.989 Y134.816 E.41811
G3 X111.807 Y134.99 I-.195 J-.023 E.00838
G1 X105.011 Y134.99 E.20883
G3 X104.81 Y134.792 I-.008 J-.193 E.00971
G1 X104.81 Y121.211 E.41732
G3 X104.81 Y121.193 I.192 J-.008 E.00054
M204 S10000
G1 X105.225 Y121.206 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.482436
G1 F4425
M204 S6000
G1 X105.225 Y122.806 E.05729
G1 X105.25 Y122.911 E.00385
; LINE_WIDTH: 0.55586
G1 X105.275 Y123.015 E.0045
; LINE_WIDTH: 0.556722
G1 X105.313 Y122.99 E.00192
; LINE_WIDTH: 0.508444
G1 X105.352 Y122.966 E.00174
; LINE_WIDTH: 0.460167
G1 X105.39 Y122.941 E.00156
; LINE_WIDTH: 0.41189
G1 X105.429 Y122.916 E.00138
; LINE_WIDTH: 0.363613
G1 X105.467 Y122.891 E.0012
; LINE_WIDTH: 0.315336
G1 X105.506 Y122.866 E.00102
; LINE_WIDTH: 0.267059
G1 X105.544 Y122.841 E.00084
M204 S10000
G1 X105.275 Y123.015 F42000
; LINE_WIDTH: 0.58075
G1 F4425
M204 S6000
G1 X105.275 Y132.985 E.43692
G1 X105.313 Y133.01 E.00201
; LINE_WIDTH: 0.508445
G1 X105.352 Y133.034 E.00174
; LINE_WIDTH: 0.460168
G1 X105.39 Y133.059 E.00156
; LINE_WIDTH: 0.41189
G1 X105.429 Y133.084 E.00138
; LINE_WIDTH: 0.363613
G1 X105.467 Y133.109 E.0012
; LINE_WIDTH: 0.315336
G1 X105.506 Y133.134 E.00102
; LINE_WIDTH: 0.267059
G1 X105.544 Y133.159 E.00084
M204 S10000
G1 X105.275 Y132.985 F42000
; LINE_WIDTH: 0.55586
G1 F4425
M204 S6000
G1 X105.25 Y133.089 E.0045
; LINE_WIDTH: 0.482435
G1 X105.225 Y133.194 E.00385
G1 X105.225 Y134.794 E.0573
M204 S10000
G1 X111.575 Y134.793 F42000
; LINE_WIDTH: 0.480857
G1 F4425
M204 S6000
G1 X111.575 Y133.194 E.05708
; LINE_WIDTH: 0.505858
G1 X111.55 Y133.089 E.00406
; LINE_WIDTH: 0.580578
G1 X111.525 Y132.985 E.00471
G1 X111.525 Y123.015 E.43678
; LINE_WIDTH: 0.564165
G1 X111.542 Y122.946 E.00305
; LINE_WIDTH: 0.53083
G1 X111.558 Y122.876 E.00285
; LINE_WIDTH: 0.481546
G1 X111.575 Y122.806 E.00256
G1 X111.575 Y121.206 E.05717
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8207.455
G1 X111.575 Y122.806 E-.72738
G1 X111.558 Y122.876 E-.03262
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 10/73
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z2.2 I-.315 J1.175 P1  F42000
G1 X150.26 Y133.26 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4427
M204 S5000
G1 X144.94 Y133.26 E.16347
G1 X144.94 Y122.74 E.32325
G1 X150.26 Y122.74 E.16347
G1 X150.26 Y133.2 E.32141
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.26 Y133.223 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.742 Y125.735 Z2.4 F42000
G1 X150.36 Y122.61 Z2.4
G1 Z2
G1 E.8 F1800
G1 F4427
M204 S5000
G1 X144.84 Y122.61 E.16961
G1 X144.84 Y121.39 E.03749
G1 X150.36 Y121.39 E.16961
G1 X150.36 Y122.55 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.36 Y122.572 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.998 Y129.83 Z2.4 F42000
G1 X144.84 Y133.39 Z2.4
G1 Z2
G1 E.8 F1800
G1 F4427
M204 S5000
G1 X150.36 Y133.39 E.16961
G1 X150.36 Y134.61 E.03749
G1 X144.84 Y134.61 E.16961
G1 X144.84 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X146.84 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.135 Y125.989 Z2.4 F42000
G1 X144.022 Y121.135 Z2.4
G1 Z2
G1 E.8 F1800
G1 F4427
M204 S5000
G3 X144.193 Y121.01 I.18 J.068 E.00688
G1 X151.035 Y121.014 E.21022
G3 X151.19 Y121.209 I-.04 J.191 E.00831
G1 X151.182 Y134.854 E.41927
G3 X151.007 Y134.99 I-.184 J-.057 E.00725
G1 X144.211 Y134.99 E.20883
G3 X144.01 Y134.792 I-.009 J-.192 E.00973
G1 X144.01 Y121.211 E.41732
G3 X144.01 Y121.194 I.192 J-.008 E.00051
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.052 Y121.081 E-.04596
G1 X144.119 Y121.029 E-.03212
G1 X144.193 Y121.01 E-.029
G1 X145.911 Y121.011 E-.65293
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 10 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.4
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer10 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X144.425 Y121.206 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.482436
G1 F4427
M204 S6000
G1 X144.425 Y122.806 E.05729
G1 X144.45 Y122.911 E.00385
; LINE_WIDTH: 0.55586
G1 X144.475 Y123.015 E.0045
; LINE_WIDTH: 0.556722
G1 X144.513 Y122.99 E.00192
; LINE_WIDTH: 0.508444
G1 X144.552 Y122.966 E.00174
; LINE_WIDTH: 0.460167
G1 X144.59 Y122.941 E.00156
; LINE_WIDTH: 0.41189
G1 X144.629 Y122.916 E.00138
; LINE_WIDTH: 0.363613
G1 X144.667 Y122.891 E.0012
; LINE_WIDTH: 0.315336
G1 X144.706 Y122.866 E.00102
; LINE_WIDTH: 0.267059
G1 X144.744 Y122.841 E.00084
M204 S10000
G1 X144.475 Y123.015 F42000
; LINE_WIDTH: 0.58075
G1 F4427
M204 S6000
G1 X144.475 Y132.985 E.43692
G1 X144.513 Y133.01 E.00201
; LINE_WIDTH: 0.508445
G1 X144.552 Y133.034 E.00174
; LINE_WIDTH: 0.460168
G1 X144.59 Y133.059 E.00156
; LINE_WIDTH: 0.41189
G1 X144.629 Y133.084 E.00138
; LINE_WIDTH: 0.363613
G1 X144.667 Y133.109 E.0012
; LINE_WIDTH: 0.315336
G1 X144.706 Y133.134 E.00102
; LINE_WIDTH: 0.267059
G1 X144.744 Y133.159 E.00084
M204 S10000
G1 X144.475 Y132.985 F42000
; LINE_WIDTH: 0.55586
G1 F4427
M204 S6000
G1 X144.45 Y133.089 E.0045
; LINE_WIDTH: 0.482435
G1 X144.425 Y133.194 E.00385
G1 X144.425 Y134.794 E.0573
M204 S10000
G1 X150.775 Y134.794 F42000
; LINE_WIDTH: 0.480856
G1 F4427
M204 S6000
G1 X150.775 Y133.194 E.05708
; LINE_WIDTH: 0.505858
G1 X150.75 Y133.089 E.00406
; LINE_WIDTH: 0.580579
G1 X150.725 Y132.985 E.00471
G1 X150.725 Y123.015 E.43678
; LINE_WIDTH: 0.555822
G1 X150.75 Y122.911 E.0045
; LINE_WIDTH: 0.505827
G1 X150.775 Y122.806 E.00406
; LINE_WIDTH: 0.480821
G1 X150.775 Y121.206 E.05708
; OBJECT_ID: 405
; WIPE_START
G1 F8221.042
G1 X150.775 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X143.143 Y122.786 Z2.4 F42000
G1 X125.34 Y122.74 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4427
M204 S5000
G1 X130.66 Y122.74 E.16347
G1 X130.66 Y133.26 E.32325
G1 X125.34 Y133.26 E.16347
G1 X125.34 Y122.8 E.32141
M204 S250
G1 X125.24 Y122.61 F42000
G1 F4427
M204 S5000
G1 X125.24 Y121.39 E.03749
G1 X130.76 Y121.39 E.16961
G1 X130.76 Y122.61 E.03749
G1 X125.3 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.24 Y121.39 E-.46416
G1 X126.019 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.524 Y129.006 Z2.4 F42000
G1 X125.24 Y133.39 Z2.4
G1 Z2
G1 E.8 F1800
G1 F4427
M204 S5000
G1 X130.76 Y133.39 E.16961
G1 X130.76 Y134.61 E.03749
G1 X125.24 Y134.61 E.16961
G1 X125.24 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.24 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.535 Y125.989 Z2.4 F42000
G1 X124.422 Y121.135 Z2.4
G1 Z2
G1 E.8 F1800
G1 F4427
M204 S5000
G3 X124.593 Y121.01 I.18 J.068 E.00688
G1 X131.435 Y121.014 E.21022
G3 X131.59 Y121.209 I-.04 J.191 E.00831
G1 X131.582 Y134.854 E.41927
G3 X131.407 Y134.99 I-.184 J-.057 E.00725
G1 X124.611 Y134.99 E.20883
G3 X124.41 Y134.792 I-.009 J-.192 E.00973
G1 X124.41 Y121.211 E.41732
G3 X124.41 Y121.194 I.192 J-.008 E.00051
M204 S10000
G1 X124.825 Y121.206 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.482436
G1 F4427
M204 S6000
G1 X124.825 Y122.806 E.05729
G1 X124.85 Y122.911 E.00385
; LINE_WIDTH: 0.55586
G1 X124.875 Y123.015 E.0045
; LINE_WIDTH: 0.556722
G1 X124.913 Y122.99 E.00192
; LINE_WIDTH: 0.508444
G1 X124.952 Y122.966 E.00174
; LINE_WIDTH: 0.460167
G1 X124.99 Y122.941 E.00156
; LINE_WIDTH: 0.41189
G1 X125.029 Y122.916 E.00138
; LINE_WIDTH: 0.363613
M73 P37 R13
G1 X125.067 Y122.891 E.0012
; LINE_WIDTH: 0.315336
G1 X125.106 Y122.866 E.00102
; LINE_WIDTH: 0.267059
G1 X125.144 Y122.841 E.00084
M204 S10000
G1 X124.875 Y123.015 F42000
; LINE_WIDTH: 0.58075
G1 F4427
M204 S6000
G1 X124.875 Y132.985 E.43692
G1 X124.913 Y133.01 E.00201
; LINE_WIDTH: 0.508445
G1 X124.952 Y133.034 E.00174
; LINE_WIDTH: 0.460168
G1 X124.99 Y133.059 E.00156
; LINE_WIDTH: 0.41189
G1 X125.029 Y133.084 E.00138
; LINE_WIDTH: 0.363613
G1 X125.067 Y133.109 E.0012
; LINE_WIDTH: 0.315336
G1 X125.106 Y133.134 E.00102
; LINE_WIDTH: 0.267059
G1 X125.144 Y133.159 E.00084
M204 S10000
G1 X124.875 Y132.985 F42000
; LINE_WIDTH: 0.55586
G1 F4427
M204 S6000
G1 X124.85 Y133.089 E.0045
; LINE_WIDTH: 0.482435
G1 X124.825 Y133.194 E.00385
G1 X124.825 Y134.794 E.0573
M204 S10000
G1 X131.175 Y134.794 F42000
; LINE_WIDTH: 0.480856
G1 F4427
M204 S6000
G1 X131.175 Y133.194 E.05708
; LINE_WIDTH: 0.505858
G1 X131.15 Y133.089 E.00406
; LINE_WIDTH: 0.580579
G1 X131.125 Y132.985 E.00471
G1 X131.125 Y123.015 E.43678
; LINE_WIDTH: 0.555822
G1 X131.15 Y122.911 E.0045
; LINE_WIDTH: 0.505827
G1 X131.175 Y122.806 E.00406
; LINE_WIDTH: 0.480821
G1 X131.175 Y121.206 E.05708
; OBJECT_ID: 394
; WIPE_START
G1 F8221.042
G1 X131.175 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X124.116 Y125.707 Z2.4 F42000
G1 X105.74 Y133.26 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4427
M204 S5000
G1 X105.74 Y122.74 E.32325
G1 X111.06 Y122.74 E.16347
G1 X111.06 Y133.26 E.32325
G1 X105.8 Y133.26 E.16163
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.789 Y131.26 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.658 Y123.629 Z2.4 F42000
G1 X105.64 Y122.61 Z2.4
G1 Z2
G1 E.8 F1800
G1 F4427
M204 S5000
G1 X105.64 Y121.39 E.03749
G1 X111.16 Y121.39 E.16961
G1 X111.16 Y122.61 E.03749
G1 X105.7 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.64 Y121.39 E-.46416
G1 X106.419 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.924 Y129.006 Z2.4 F42000
G1 X105.64 Y133.39 Z2.4
G1 Z2
G1 E.8 F1800
G1 F4427
M204 S5000
G1 X111.16 Y133.39 E.16961
G1 X111.16 Y134.61 E.03749
G1 X105.64 Y134.61 E.16961
G1 X105.64 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X107.64 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.935 Y125.989 Z2.4 F42000
G1 X104.822 Y121.135 Z2.4
G1 Z2
G1 E.8 F1800
G1 F4427
M204 S5000
G3 X104.993 Y121.01 I.18 J.068 E.00688
G1 X111.835 Y121.014 E.21022
G3 X111.99 Y121.209 I-.04 J.191 E.00831
G1 X111.982 Y134.854 E.41927
G3 X111.807 Y134.99 I-.184 J-.057 E.00725
G1 X105.011 Y134.99 E.20883
G3 X104.81 Y134.792 I-.009 J-.192 E.00973
G1 X104.81 Y121.211 E.41732
G3 X104.81 Y121.194 I.192 J-.008 E.00051
M204 S10000
G1 X105.225 Y121.206 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.482436
G1 F4427
M204 S6000
G1 X105.225 Y122.806 E.05729
G1 X105.25 Y122.911 E.00385
; LINE_WIDTH: 0.55586
G1 X105.275 Y123.015 E.0045
; LINE_WIDTH: 0.556722
G1 X105.313 Y122.99 E.00192
; LINE_WIDTH: 0.508444
G1 X105.352 Y122.966 E.00174
; LINE_WIDTH: 0.460167
G1 X105.39 Y122.941 E.00156
; LINE_WIDTH: 0.41189
G1 X105.429 Y122.916 E.00138
; LINE_WIDTH: 0.363613
G1 X105.467 Y122.891 E.0012
; LINE_WIDTH: 0.315336
G1 X105.506 Y122.866 E.00102
; LINE_WIDTH: 0.267059
G1 X105.544 Y122.841 E.00084
M204 S10000
G1 X105.275 Y123.015 F42000
; LINE_WIDTH: 0.58075
G1 F4427
M204 S6000
G1 X105.275 Y132.985 E.43692
G1 X105.313 Y133.01 E.00201
; LINE_WIDTH: 0.508445
G1 X105.352 Y133.034 E.00174
; LINE_WIDTH: 0.460168
G1 X105.39 Y133.059 E.00156
; LINE_WIDTH: 0.41189
G1 X105.429 Y133.084 E.00138
; LINE_WIDTH: 0.363613
G1 X105.467 Y133.109 E.0012
; LINE_WIDTH: 0.315336
G1 X105.506 Y133.134 E.00102
; LINE_WIDTH: 0.267059
G1 X105.544 Y133.159 E.00084
M204 S10000
G1 X105.275 Y132.985 F42000
; LINE_WIDTH: 0.55586
G1 F4427
M204 S6000
G1 X105.25 Y133.089 E.0045
; LINE_WIDTH: 0.482435
G1 X105.225 Y133.194 E.00385
G1 X105.225 Y134.794 E.0573
M204 S10000
G1 X111.575 Y134.794 F42000
; LINE_WIDTH: 0.480856
G1 F4427
M204 S6000
G1 X111.575 Y133.194 E.05708
; LINE_WIDTH: 0.505858
G1 X111.55 Y133.089 E.00406
; LINE_WIDTH: 0.580579
G1 X111.525 Y132.985 E.00471
G1 X111.525 Y123.015 E.43678
; LINE_WIDTH: 0.555822
G1 X111.55 Y122.911 E.0045
; LINE_WIDTH: 0.505827
G1 X111.575 Y122.806 E.00406
; LINE_WIDTH: 0.480821
G1 X111.575 Y121.206 E.05708
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8221.042
G1 X111.575 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 11/73
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
M106 S186.15
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z2.4 I-.015 J1.217 P1  F42000
G1 X149.427 Y123.273 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
M204 S5000
G1 X149.427 Y132.727 E.31361
G1 X145.773 Y132.727 E.12121
G1 X145.773 Y123.273 E.31361
G1 X149.367 Y123.273 E.11922
M106 S186.15
M204 S250
G1 X149.035 Y123.665 F42000
M106 S255
G1 F600
M204 S5000
G1 X149.035 Y132.335 E.2876
G1 X146.165 Y132.335 E.0952
G1 X146.165 Y123.665 E.2876
G1 X148.975 Y123.665 E.09321
M106 S186.15
; WIPE_START
M204 S6000
G1 X148.989 Y125.665 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.6 I-1.044 J-.625 P1  F42000
G1 X144.84 Y132.591 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X144.809 Y132.591 E.00102
G1 X144.809 Y124.209 E.27804
G1 X144.809 Y123.809 E.01327
G1 F6579.062
G1 X144.809 Y123.409 E.01327
G1 F2851.411
G1 X144.967 Y123.409 E.00525
M106 S255
G1 F1800
G1 X145.35 Y123.409 E.01269
M106 S186.15
; FEATURE: Overhang wall
M106 S255
G1 F600
M204 S5000
G1 X145.366 Y123.409 E.00053
G1 X145.366 Y132.591 E.30458
M106 S186.15
M106 S255
G1 F3000
G1 X145.35 Y132.591 E.00053
M106 S186.15
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X144.967 Y132.591 E.01269
M106 S186.15
G1 F2218.622
G1 X144.9 Y132.591 E.00224
; WIPE_START
G1 X144.809 Y132.591 E-.03453
G1 X144.809 Y130.682 E-.72547
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.6 I-.431 J1.138 P1  F42000
G1 X149.85 Y132.591 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Overhang wall
M106 S255
G1 F600
M204 S5000
G1 X149.834 Y132.591 E.00053
G1 X149.834 Y123.409 E.30458
G1 X149.85 Y123.409 E.00053
M106 S186.15
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X150.232 Y123.409 E.01269
M106 S186.15
G1 F2851.115
G1 X150.391 Y123.409 E.00525
G1 F6578.612
G1 X150.391 Y123.809 E.01327
G1 F8843.478
G1 X150.391 Y124.209 E.01327
G1 X150.391 Y131.791 E.2515
G1 X150.391 Y132.191 E.01327
G1 F6579.062
G1 X150.391 Y132.591 E.01327
G1 F2851.411
G1 X150.232 Y132.591 E.00525
M106 S255
G1 F1800
G1 X149.91 Y132.591 E.0107
M106 S186.15
; WIPE_START
G1 X149.834 Y132.591 E-.02883
G1 X149.834 Y130.667 E-.73117
; WIPE_END
G1 E-.04
M204 S10000
G17
G3 Z2.6 I-.515 J-1.103 P1  F42000
G1 X144.84 Y132.998 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X144.402 Y132.998 E.01453
G1 X144.402 Y123.402 E.31831
G1 X144.402 Y123.002 E.01327
G1 F5701.252
G1 X144.967 Y123.002 E.01876
M106 S255
G1 F1320
G1 X150.232 Y123.002 E.17465
M106 S186.15
G1 F5700.834
G1 X150.798 Y123.002 E.01876
G1 F8843.478
G1 X150.798 Y123.402 E.01327
G1 X150.798 Y132.598 E.30504
G1 X150.798 Y132.998 E.01327
G1 F5701.252
G1 X150.232 Y132.998 E.01876
M106 S255
G1 F1320
G1 X144.967 Y132.998 E.17465
M106 S186.15
G1 F1681.627
G1 X144.9 Y132.998 E.00224
M204 S250
G1 X144.84 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X150.36 Y133.39 E.16961
G1 X150.36 Y134.61 E.03749
G1 X144.84 Y134.61 E.16961
G1 X144.84 Y133.45 E.03564
; WIPE_START
M204 S6000
G1 X146.84 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.6 I1.157 J.377 P1  F42000
G1 X150.36 Y122.61 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X144.84 Y122.61 E.16961
G1 X144.84 Y121.39 E.03749
G1 X150.36 Y121.39 E.16961
G1 X150.36 Y122.55 E.03564
; WIPE_START
M204 S6000
G1 X148.36 Y122.572 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.022 Y121.134 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
M73 P38 R13
G1 F9547.055
M204 S5000
G3 X144.193 Y121.01 I.179 J.068 E.00687
G1 X151.035 Y121.014 E.21022
G3 X151.19 Y121.209 I-.04 J.191 E.00829
G1 X151.19 Y134.789 E.4173
G3 X151.009 Y134.99 I-.191 J.009 E.00921
G1 X144.208 Y134.99 E.20898
G1 X144.104 Y134.963 E.00331
G3 X144.01 Y134.792 I.102 J-.167 E.00627
G1 X144.01 Y121.21 E.41733
G3 X144.01 Y121.193 I.191 J-.009 E.00054
; WIPE_START
M204 S6000
G1 X144.061 Y121.071 E-.05022
G1 X144.108 Y121.034 E-.02288
G1 X144.193 Y121.01 E-.03351
G1 X145.913 Y121.011 E-.65339
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 11 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.6
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer11 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X144.425 Y121.206 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X144.425 Y122.806 E.05708
; WIPE_START
G1 X144.425 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.087 Y123.613 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F15000
M204 S6000
G1 X145.087 Y132.387 E.10701
; WIPE_START
G1 X145.087 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.425 Y133.194 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X144.425 Y134.794 E.05709
M204 S10000
G1 X150.775 Y134.794 F42000
G1 F8220.304
M204 S6000
G1 X150.775 Y133.194 E.05708
; WIPE_START
G1 X150.775 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.112 Y132.387 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.192561
G1 F15000
M204 S6000
G1 X150.112 Y123.613 E.107
; WIPE_START
G1 X150.112 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.775 Y122.806 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.48082
G1 F8221.055
M204 S6000
G1 X150.775 Y121.206 E.05707
; OBJECT_ID: 405
; WIPE_START
G1 X150.775 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X143.144 Y122.951 Z2.6 F42000
G1 X126.173 Y123.273 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
M204 S5000
G1 X129.827 Y123.273 E.12121
G1 X129.827 Y132.727 E.31361
G1 X126.173 Y132.727 E.12121
G1 X126.173 Y123.333 E.31162
M106 S186.15
M204 S250
G1 X126.565 Y123.665 F42000
M106 S255
G1 F600
M204 S5000
G1 X129.435 Y123.665 E.0952
G1 X129.435 Y132.335 E.2876
G1 X126.565 Y132.335 E.0952
G1 X126.565 Y123.725 E.28561
M106 S186.15
; WIPE_START
M204 S6000
G1 X128.565 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.6 I-1.14 J-.426 P1  F42000
G1 X125.24 Y132.591 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X125.209 Y132.591 E.00102
G1 X125.209 Y124.209 E.27804
G1 X125.209 Y123.809 E.01327
G1 F6579.062
G1 X125.209 Y123.409 E.01327
G1 F2851.411
G1 X125.367 Y123.409 E.00525
M106 S255
G1 F1800
G1 X125.75 Y123.409 E.01269
M106 S186.15
; FEATURE: Overhang wall
M106 S255
G1 F600
M204 S5000
G1 X125.766 Y123.409 E.00053
G1 X125.766 Y132.591 E.30458
M106 S186.15
M106 S255
G1 F3000
G1 X125.75 Y132.591 E.00053
M106 S186.15
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X125.367 Y132.591 E.01269
M106 S186.15
G1 F2218.622
G1 X125.3 Y132.591 E.00224
; WIPE_START
G1 X125.209 Y132.591 E-.03453
G1 X125.209 Y130.682 E-.72547
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.6 I-.431 J1.138 P1  F42000
G1 X130.25 Y132.591 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Overhang wall
M106 S255
G1 F600
M204 S5000
G1 X130.234 Y132.591 E.00053
G1 X130.234 Y123.409 E.30458
G1 X130.25 Y123.409 E.00053
M106 S186.15
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X130.632 Y123.409 E.01269
M106 S186.15
G1 F2851.115
G1 X130.791 Y123.409 E.00525
G1 F6578.612
G1 X130.791 Y123.809 E.01327
G1 F8843.478
G1 X130.791 Y124.209 E.01327
G1 X130.791 Y131.791 E.2515
G1 X130.791 Y132.191 E.01327
G1 F6579.062
G1 X130.791 Y132.591 E.01327
G1 F2851.411
G1 X130.632 Y132.591 E.00525
M106 S255
G1 F1800
G1 X130.31 Y132.591 E.0107
M106 S186.15
; WIPE_START
G1 X130.234 Y132.591 E-.02883
G1 X130.234 Y130.667 E-.73117
; WIPE_END
G1 E-.04
M204 S10000
G17
G3 Z2.6 I-.515 J-1.103 P1  F42000
G1 X125.24 Y132.998 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X124.802 Y132.998 E.01453
G1 X124.802 Y123.402 E.31831
G1 X124.802 Y123.002 E.01327
G1 F5701.252
G1 X125.367 Y123.002 E.01876
M106 S255
G1 F1320
G1 X130.632 Y123.002 E.17465
M106 S186.15
G1 F5700.834
G1 X131.198 Y123.002 E.01876
G1 F8843.478
G1 X131.198 Y123.402 E.01327
G1 X131.198 Y132.598 E.30504
G1 X131.198 Y132.998 E.01327
G1 F5701.252
G1 X130.632 Y132.998 E.01876
M106 S255
G1 F1320
G1 X125.367 Y132.998 E.17465
M106 S186.15
G1 F1681.627
G1 X125.3 Y132.998 E.00224
M204 S250
G1 X125.24 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X130.76 Y133.39 E.16961
G1 X130.76 Y134.61 E.03749
G1 X125.24 Y134.61 E.16961
G1 X125.24 Y133.45 E.03564
; WIPE_START
M204 S6000
G1 X127.24 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.852 Y125.923 Z2.6 F42000
G1 X125.24 Y122.61 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X125.24 Y121.39 E.03749
G1 X130.76 Y121.39 E.16961
G1 X130.76 Y122.61 E.03749
G1 X125.3 Y122.61 E.16777
; WIPE_START
M204 S6000
G1 X125.24 Y121.39 E-.46416
G1 X126.019 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.422 Y121.134 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G3 X124.593 Y121.01 I.179 J.068 E.00687
G1 X131.435 Y121.014 E.21022
G3 X131.59 Y121.209 I-.04 J.191 E.00829
G1 X131.59 Y134.789 E.4173
G3 X131.409 Y134.99 I-.191 J.009 E.00921
G1 X124.608 Y134.99 E.20898
G1 X124.504 Y134.963 E.00331
G3 X124.41 Y134.792 I.102 J-.167 E.00627
M73 P39 R13
G1 X124.41 Y121.21 E.41733
G3 X124.41 Y121.193 I.191 J-.009 E.00054
M204 S10000
G1 X124.825 Y121.206 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X124.825 Y122.806 E.05708
; WIPE_START
G1 X124.825 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.487 Y123.613 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F15000
M204 S6000
G1 X125.487 Y132.387 E.10701
; WIPE_START
G1 X125.487 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.825 Y133.194 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X124.825 Y134.794 E.05709
M204 S10000
G1 X131.175 Y134.794 F42000
G1 F8220.304
M204 S6000
G1 X131.175 Y133.194 E.05708
; WIPE_START
G1 X131.175 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.512 Y132.387 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.192561
G1 F15000
M204 S6000
G1 X130.512 Y123.613 E.107
; WIPE_START
G1 X130.512 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.175 Y122.806 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.48082
G1 F8221.055
M204 S6000
G1 X131.175 Y121.206 E.05707
; OBJECT_ID: 394
; WIPE_START
G1 X131.175 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X123.544 Y122.951 Z2.6 F42000
G1 X106.573 Y123.273 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
M204 S5000
G1 X110.227 Y123.273 E.12121
G1 X110.227 Y132.727 E.31361
G1 X106.573 Y132.727 E.12121
G1 X106.573 Y123.333 E.31162
M106 S186.15
M204 S250
G1 X106.965 Y123.665 F42000
M106 S255
G1 F600
M204 S5000
G1 X109.835 Y123.665 E.0952
G1 X109.835 Y132.335 E.2876
G1 X106.965 Y132.335 E.0952
G1 X106.965 Y123.725 E.28561
M106 S186.15
; WIPE_START
M204 S6000
G1 X108.965 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.6 I-1.14 J-.426 P1  F42000
G1 X105.64 Y132.591 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X105.609 Y132.591 E.00102
G1 X105.609 Y124.209 E.27804
G1 X105.609 Y123.809 E.01327
G1 F6579.062
G1 X105.609 Y123.409 E.01327
G1 F2851.411
G1 X105.768 Y123.409 E.00525
M106 S255
G1 F1800
G1 X106.15 Y123.409 E.01269
M106 S186.15
; FEATURE: Overhang wall
M106 S255
G1 F600
M204 S5000
G1 X106.166 Y123.409 E.00053
G1 X106.166 Y132.591 E.30458
M106 S186.15
M106 S255
G1 F3000
G1 X106.15 Y132.591 E.00053
M106 S186.15
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X105.768 Y132.591 E.01269
M106 S186.15
G1 F2218.622
G1 X105.7 Y132.591 E.00224
; WIPE_START
G1 X105.609 Y132.591 E-.03453
G1 X105.609 Y130.682 E-.72547
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.6 I-.431 J1.138 P1  F42000
G1 X110.65 Y132.591 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Overhang wall
M106 S255
G1 F600
M204 S5000
G1 X110.634 Y132.591 E.00053
G1 X110.634 Y123.409 E.30458
G1 X110.65 Y123.409 E.00053
M106 S186.15
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X111.033 Y123.409 E.01269
M106 S186.15
G1 F2851.115
G1 X111.191 Y123.409 E.00525
G1 F6578.612
G1 X111.191 Y123.809 E.01327
G1 F8843.478
G1 X111.191 Y124.209 E.01327
G1 X111.191 Y131.791 E.2515
G1 X111.191 Y132.191 E.01327
G1 F6579.062
G1 X111.191 Y132.591 E.01327
G1 F2851.411
G1 X111.033 Y132.591 E.00525
M106 S255
G1 F1800
G1 X110.71 Y132.591 E.0107
M106 S186.15
; WIPE_START
G1 X110.634 Y132.591 E-.02883
G1 X110.634 Y130.667 E-.73117
; WIPE_END
G1 E-.04
M204 S10000
G17
G3 Z2.6 I-.515 J-1.103 P1  F42000
G1 X105.64 Y132.998 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X105.202 Y132.998 E.01453
G1 X105.202 Y123.402 E.31831
G1 X105.202 Y123.002 E.01327
G1 F5701.252
G1 X105.768 Y123.002 E.01876
M106 S255
G1 F1320
G1 X111.033 Y123.002 E.17465
M106 S186.15
G1 F5700.834
G1 X111.598 Y123.002 E.01876
G1 F8843.478
G1 X111.598 Y123.402 E.01327
G1 X111.598 Y132.598 E.30504
G1 X111.598 Y132.998 E.01327
G1 F5701.252
G1 X111.033 Y132.998 E.01876
M106 S255
G1 F1320
G1 X105.768 Y132.998 E.17465
M106 S186.15
G1 F1681.627
G1 X105.7 Y132.998 E.00224
M204 S250
G1 X105.64 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X111.16 Y133.39 E.16961
G1 X111.16 Y134.61 E.03749
G1 X105.64 Y134.61 E.16961
G1 X105.64 Y133.45 E.03564
; WIPE_START
M204 S6000
G1 X107.64 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.252 Y125.923 Z2.6 F42000
G1 X105.64 Y122.61 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X105.64 Y121.39 E.03749
G1 X111.16 Y121.39 E.16961
G1 X111.16 Y122.61 E.03749
G1 X105.7 Y122.61 E.16777
; WIPE_START
M204 S6000
G1 X105.64 Y121.39 E-.46416
G1 X106.419 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.822 Y121.134 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G3 X104.993 Y121.01 I.179 J.068 E.00687
G1 X111.835 Y121.014 E.21022
G3 X111.99 Y121.209 I-.04 J.191 E.00829
G1 X111.99 Y134.789 E.4173
G3 X111.809 Y134.99 I-.191 J.009 E.00921
G1 X105.008 Y134.99 E.20898
G1 X104.904 Y134.963 E.00331
G3 X104.81 Y134.792 I.102 J-.167 E.00627
G1 X104.81 Y121.21 E.41733
G3 X104.81 Y121.193 I.191 J-.009 E.00054
M204 S10000
G1 X105.225 Y121.206 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X105.225 Y122.806 E.05708
; WIPE_START
G1 X105.225 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.887 Y123.613 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F15000
M204 S6000
G1 X105.887 Y132.387 E.10701
; WIPE_START
G1 X105.887 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.225 Y133.194 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X105.225 Y134.794 E.05709
M204 S10000
G1 X111.575 Y134.794 F42000
G1 F8220.304
M204 S6000
G1 X111.575 Y133.194 E.05708
; WIPE_START
G1 X111.575 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.913 Y132.387 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.192561
G1 F15000
M204 S6000
G1 X110.912 Y123.613 E.107
; WIPE_START
G1 X110.912 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.575 Y122.806 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.48082
G1 F8221.055
M204 S6000
G1 X111.575 Y121.206 E.05707
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8221.055
G1 X111.575 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 12/73
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
M106 S201.45
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z2.6 I-.016 J1.217 P1  F42000
G1 X146.165 Y123.273 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8605
M204 S6000
G1 X149.427 Y123.273 E.10821
G1 X149.427 Y132.727 E.31361
G1 X145.773 Y132.727 E.12121
G1 X145.773 Y123.273 E.31361
G1 X146.105 Y123.273 E.01102
M204 S250
G1 X146.165 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8605
M204 S5000
G1 X149.035 Y123.665 E.08819
G1 X149.035 Y132.335 E.2664
G1 X146.165 Y132.335 E.08819
G1 X146.165 Y123.725 E.26456
M204 S10000
G1 X145.366 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8605
M204 S6000
G1 X145.366 Y132.591 E.29609
G1 X144.809 Y132.591 E.01847
G1 X144.809 Y123.409 E.30458
G1 X145.366 Y123.409 E.01847
G1 X145.366 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X145.366 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I-1.025 J.656 P1  F42000
G1 X149.834 Y132.591 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F8605
M204 S6000
G1 X149.834 Y123.409 E.30458
G1 X150.391 Y123.409 E.01847
G1 X150.391 Y132.591 E.30458
M73 P40 R13
G1 X149.894 Y132.591 E.01648
; WIPE_START
G1 F8843.478
G1 X149.881 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I-.524 J-1.098 P1  F42000
G1 X144.84 Y132.998 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F8605
M204 S6000
G1 X144.402 Y132.998 E.01453
G1 X144.402 Y123.002 E.33158
G1 X150.798 Y123.002 E.21216
G1 X150.798 Y132.998 E.33158
G1 X144.9 Y132.998 E.19565
M204 S250
G1 X144.84 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8605
M204 S5000
G1 X150.36 Y133.39 E.16961
G1 X150.36 Y134.61 E.03749
G1 X144.84 Y134.61 E.16961
G1 X144.84 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X146.84 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I1.157 J.377 P1  F42000
G1 X150.36 Y122.61 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F8605
M204 S5000
G1 X144.84 Y122.61 E.16961
G1 X144.84 Y121.39 E.03749
G1 X150.36 Y121.39 E.16961
G1 X150.36 Y122.55 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.36 Y122.572 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.023 Y121.134 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F8605
M204 S5000
G3 X144.193 Y121.01 I.18 J.069 E.00685
G1 X151.035 Y121.014 E.21021
G3 X151.19 Y121.21 I-.04 J.191 E.00835
G1 X151.189 Y134.816 E.41807
G3 X151.007 Y134.99 I-.193 J-.021 E.00841
G1 X144.211 Y134.99 E.20882
G3 X144.01 Y134.792 I-.008 J-.193 E.00971
G1 X144.01 Y121.211 E.41732
G3 X144.01 Y121.193 I.192 J-.008 E.00055
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.06 Y121.073 E-.04935
G1 X144.11 Y121.033 E-.02429
G1 X144.193 Y121.01 E-.03295
G1 X145.913 Y121.011 E-.65341
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 12 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.8
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer12 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X144.425 Y121.206 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X144.425 Y122.806 E.05708
; WIPE_START
G1 X144.425 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.087 Y123.613 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8605
M204 S6000
G1 X145.087 Y132.387 E.10701
; WIPE_START
G1 F15000
G1 X145.087 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.425 Y133.194 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X144.425 Y134.794 E.05709
M204 S10000
G1 X150.775 Y134.794 F42000
G1 F8220.304
M204 S6000
G1 X150.775 Y133.194 E.05708
; WIPE_START
G1 X150.775 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.113 Y132.387 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8605
M204 S6000
G1 X150.113 Y123.613 E.10701
; WIPE_START
G1 F15000
G1 X150.113 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.775 Y122.806 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X150.775 Y121.206 E.05708
; OBJECT_ID: 405
; WIPE_START
G1 X150.775 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X143.144 Y122.953 Z2.8 F42000
G1 X126.565 Y123.273 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8605
M204 S6000
G1 X129.827 Y123.273 E.10821
G1 X129.827 Y132.727 E.31361
G1 X126.173 Y132.727 E.12121
G1 X126.173 Y123.273 E.31361
G1 X126.505 Y123.273 E.01102
M204 S250
G1 X126.565 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8605
M204 S5000
G1 X129.435 Y123.665 E.08819
G1 X129.435 Y132.335 E.2664
G1 X126.565 Y132.335 E.08819
G1 X126.565 Y123.725 E.26456
M204 S10000
G1 X125.766 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8605
M204 S6000
G1 X125.766 Y132.591 E.29609
G1 X125.209 Y132.591 E.01847
G1 X125.209 Y123.409 E.30458
G1 X125.766 Y123.409 E.01847
G1 X125.766 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X125.766 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I-1.025 J.656 P1  F42000
G1 X130.234 Y132.591 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F8605
M204 S6000
G1 X130.234 Y123.409 E.30458
G1 X130.791 Y123.409 E.01847
G1 X130.791 Y132.591 E.30458
G1 X130.294 Y132.591 E.01648
; WIPE_START
G1 F8843.478
G1 X130.281 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I-.524 J-1.098 P1  F42000
G1 X125.24 Y132.998 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F8605
M204 S6000
G1 X124.802 Y132.998 E.01453
G1 X124.802 Y123.002 E.33158
G1 X131.198 Y123.002 E.21216
G1 X131.198 Y132.998 E.33158
G1 X125.3 Y132.998 E.19565
M204 S250
G1 X125.24 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8605
M204 S5000
G1 X130.76 Y133.39 E.16961
G1 X130.76 Y134.61 E.03749
G1 X125.24 Y134.61 E.16961
G1 X125.24 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.24 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.852 Y125.923 Z2.8 F42000
G1 X125.24 Y122.61 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F8605
M204 S5000
G1 X125.24 Y121.39 E.03749
G1 X130.76 Y121.39 E.16961
G1 X130.76 Y122.61 E.03749
G1 X125.3 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.24 Y121.39 E-.46416
G1 X126.019 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.423 Y121.134 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F8605
M204 S5000
G3 X124.593 Y121.01 I.18 J.069 E.00685
G1 X131.435 Y121.014 E.21021
G3 X131.59 Y121.21 I-.04 J.191 E.00835
G1 X131.589 Y134.816 E.41807
G3 X131.407 Y134.99 I-.193 J-.021 E.00841
G1 X124.611 Y134.99 E.20882
G3 X124.41 Y134.792 I-.008 J-.193 E.00971
G1 X124.41 Y121.211 E.41732
G3 X124.41 Y121.193 I.192 J-.008 E.00055
M204 S10000
G1 X124.825 Y121.206 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X124.825 Y122.806 E.05708
; WIPE_START
G1 X124.825 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.487 Y123.613 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8605
M204 S6000
G1 X125.487 Y132.387 E.10701
; WIPE_START
G1 F15000
G1 X125.487 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.825 Y133.194 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X124.825 Y134.794 E.05709
M204 S10000
G1 X131.175 Y134.794 F42000
G1 F8220.304
M204 S6000
G1 X131.175 Y133.194 E.05708
; WIPE_START
G1 X131.175 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.513 Y132.387 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8605
M204 S6000
G1 X130.513 Y123.613 E.10701
; WIPE_START
G1 F15000
G1 X130.513 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.175 Y122.806 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X131.175 Y121.206 E.05708
; OBJECT_ID: 394
; WIPE_START
G1 X131.175 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X123.544 Y122.953 Z2.8 F42000
G1 X106.965 Y123.273 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8605
M204 S6000
G1 X110.227 Y123.273 E.10821
G1 X110.227 Y132.727 E.31361
G1 X106.573 Y132.727 E.12121
G1 X106.573 Y123.273 E.31361
G1 X106.905 Y123.273 E.01102
M204 S250
G1 X106.965 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8605
M204 S5000
G1 X109.835 Y123.665 E.08819
G1 X109.835 Y132.335 E.2664
G1 X106.965 Y132.335 E.08819
G1 X106.965 Y123.725 E.26456
M204 S10000
G1 X106.166 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8605
M204 S6000
G1 X106.166 Y132.591 E.29609
G1 X105.609 Y132.591 E.01847
G1 X105.609 Y123.409 E.30458
G1 X106.166 Y123.409 E.01847
G1 X106.166 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X106.166 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I-1.025 J.656 P1  F42000
G1 X110.634 Y132.591 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F8605
M204 S6000
G1 X110.634 Y123.409 E.30458
G1 X111.191 Y123.409 E.01847
G1 X111.191 Y132.591 E.30458
G1 X110.694 Y132.591 E.01648
; WIPE_START
G1 F8843.478
G1 X110.681 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I-.524 J-1.098 P1  F42000
G1 X105.64 Y132.998 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F8605
M204 S6000
G1 X105.202 Y132.998 E.01453
G1 X105.202 Y123.002 E.33158
G1 X111.598 Y123.002 E.21216
G1 X111.598 Y132.998 E.33158
G1 X105.7 Y132.998 E.19565
M204 S250
G1 X105.64 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8605
M204 S5000
G1 X111.16 Y133.39 E.16961
G1 X111.16 Y134.61 E.03749
G1 X105.64 Y134.61 E.16961
G1 X105.64 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X107.64 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.252 Y125.923 Z2.8 F42000
G1 X105.64 Y122.61 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F8605
M204 S5000
G1 X105.64 Y121.39 E.03749
G1 X111.16 Y121.39 E.16961
G1 X111.16 Y122.61 E.03749
G1 X105.7 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.64 Y121.39 E-.46416
G1 X106.419 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.823 Y121.134 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F8605
M204 S5000
G3 X104.993 Y121.01 I.18 J.069 E.00685
G1 X111.835 Y121.014 E.21021
G3 X111.99 Y121.21 I-.04 J.191 E.00835
G1 X111.989 Y134.816 E.41807
G3 X111.807 Y134.99 I-.193 J-.021 E.00841
G1 X105.011 Y134.99 E.20882
G3 X104.81 Y134.792 I-.008 J-.193 E.00971
G1 X104.81 Y121.211 E.41732
G3 X104.81 Y121.193 I.192 J-.008 E.00055
M204 S10000
G1 X105.225 Y121.206 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X105.225 Y122.806 E.05708
; WIPE_START
G1 X105.225 Y121.206 E-.76
; WIPE_END
M73 P40 R12
G1 E-.04 F1800
M204 S10000
G1 X105.887 Y123.613 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8605
M204 S6000
G1 X105.887 Y132.387 E.10701
; WIPE_START
G1 F15000
G1 X105.887 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.225 Y133.194 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X105.225 Y134.794 E.05709
M204 S10000
G1 X111.575 Y134.794 F42000
G1 F8220.304
M204 S6000
G1 X111.575 Y133.194 E.05708
; WIPE_START
G1 X111.575 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.913 Y132.387 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8605
M204 S6000
G1 X110.913 Y123.613 E.10701
; WIPE_START
G1 F15000
G1 X110.913 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.575 Y122.806 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X111.575 Y121.206 E.05708
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.304
G1 X111.575 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 13/73
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
M73 P41 R12
G3 Z2.8 I-.016 J1.217 P1  F42000
G1 X146.165 Y123.273 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8622
M204 S6000
G1 X149.427 Y123.273 E.10821
G1 X149.427 Y132.727 E.31361
G1 X145.773 Y132.727 E.12121
G1 X145.773 Y123.273 E.31361
G1 X146.105 Y123.273 E.01102
M204 S250
G1 X146.165 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8622
M204 S5000
G1 X149.035 Y123.665 E.08819
G1 X149.035 Y132.335 E.2664
G1 X146.165 Y132.335 E.08819
G1 X146.165 Y123.725 E.26456
M204 S10000
G1 X145.366 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8622
M204 S6000
G1 X145.366 Y132.591 E.29609
G1 X144.809 Y132.591 E.01847
G1 X144.809 Y123.409 E.30458
G1 X145.366 Y123.409 E.01847
G1 X145.366 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X145.366 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I-1.025 J.656 P1  F42000
G1 X149.834 Y132.591 Z3
G1 Z2.6
G1 E.8 F1800
G1 F8622
M204 S6000
G1 X149.834 Y123.409 E.30458
G1 X150.391 Y123.409 E.01847
G1 X150.391 Y132.591 E.30458
G1 X149.894 Y132.591 E.01648
; WIPE_START
G1 F8843.478
G1 X149.881 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I-.524 J-1.098 P1  F42000
G1 X144.84 Y132.998 Z3
G1 Z2.6
G1 E.8 F1800
G1 F8622
M204 S6000
G1 X144.402 Y132.998 E.01453
G1 X144.402 Y123.002 E.33158
G1 X150.798 Y123.002 E.21216
G1 X150.798 Y132.998 E.33158
G1 X144.9 Y132.998 E.19564
M204 S250
G1 X144.84 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8622
M204 S5000
G1 X150.36 Y133.39 E.16961
G1 X150.36 Y134.61 E.03749
G1 X144.84 Y134.61 E.16961
G1 X144.84 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X146.84 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I1.157 J.377 P1  F42000
G1 X150.36 Y122.61 Z3
G1 Z2.6
G1 E.8 F1800
G1 F8622
M204 S5000
G1 X144.84 Y122.61 E.16961
G1 X144.84 Y121.39 E.03749
G1 X150.36 Y121.39 E.16961
G1 X150.36 Y122.55 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.36 Y122.572 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.018 Y121.147 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F8622
M204 S5000
G3 X144.191 Y121.01 I.185 J.056 E.00721
G1 X151.035 Y121.014 E.2103
G3 X151.19 Y121.208 I-.04 J.191 E.00828
G1 X151.189 Y134.816 E.41814
G3 X151.009 Y134.99 I-.194 J-.021 E.00834
G1 X144.182 Y134.989 E.20976
G3 X144.01 Y134.792 I.025 J-.195 E.00879
G1 X144.018 Y121.207 E.41741
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.073 Y121.06 E-.05988
G1 X144.191 Y121.01 E-.04861
G1 X145.905 Y121.011 E-.65151
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 13 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer13 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X144.425 Y121.206 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X144.425 Y122.806 E.05708
; WIPE_START
G1 X144.425 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.087 Y123.613 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8622
M204 S6000
G1 X145.087 Y132.387 E.10701
; WIPE_START
G1 F15000
G1 X145.087 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.425 Y133.194 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X144.425 Y134.794 E.05709
M204 S10000
G1 X150.775 Y134.794 F42000
; LINE_WIDTH: 0.480852
G1 F8220.466
M204 S6000
G1 X150.775 Y133.194 E.05708
; WIPE_START
G1 X150.775 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.112 Y132.387 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.192541
G1 F8622
M204 S6000
G1 X150.112 Y123.613 E.10698
; WIPE_START
G1 F15000
G1 X150.112 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.775 Y122.806 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.480802
G1 F8221.404
M204 S6000
G1 X150.775 Y121.206 E.05707
; OBJECT_ID: 405
; WIPE_START
G1 X150.775 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X143.144 Y122.953 Z3 F42000
G1 X126.565 Y123.273 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8622
M204 S6000
G1 X129.827 Y123.273 E.10821
G1 X129.827 Y132.727 E.31361
G1 X126.173 Y132.727 E.12121
G1 X126.173 Y123.273 E.31361
G1 X126.505 Y123.273 E.01102
M204 S250
G1 X126.565 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8622
M204 S5000
G1 X129.435 Y123.665 E.08819
G1 X129.435 Y132.335 E.2664
G1 X126.565 Y132.335 E.08819
G1 X126.565 Y123.725 E.26456
M204 S10000
G1 X125.766 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8622
M204 S6000
G1 X125.766 Y132.591 E.29609
G1 X125.209 Y132.591 E.01847
G1 X125.209 Y123.409 E.30458
G1 X125.766 Y123.409 E.01847
G1 X125.766 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X125.766 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I-1.025 J.656 P1  F42000
G1 X130.234 Y132.591 Z3
G1 Z2.6
G1 E.8 F1800
G1 F8622
M204 S6000
G1 X130.234 Y123.409 E.30458
G1 X130.791 Y123.409 E.01847
G1 X130.791 Y132.591 E.30458
G1 X130.294 Y132.591 E.01648
; WIPE_START
G1 F8843.478
G1 X130.281 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I-.524 J-1.098 P1  F42000
G1 X125.24 Y132.998 Z3
G1 Z2.6
G1 E.8 F1800
G1 F8622
M204 S6000
G1 X124.802 Y132.998 E.01453
G1 X124.802 Y123.002 E.33158
G1 X131.198 Y123.002 E.21216
G1 X131.198 Y132.998 E.33158
G1 X125.3 Y132.998 E.19564
M204 S250
G1 X125.24 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8622
M204 S5000
G1 X130.76 Y133.39 E.16961
G1 X130.76 Y134.61 E.03749
G1 X125.24 Y134.61 E.16961
G1 X125.24 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.24 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.852 Y125.923 Z3 F42000
G1 X125.24 Y122.61 Z3
G1 Z2.6
G1 E.8 F1800
G1 F8622
M204 S5000
G1 X125.24 Y121.39 E.03749
G1 X130.76 Y121.39 E.16961
G1 X130.76 Y122.61 E.03749
G1 X125.3 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.24 Y121.39 E-.46416
G1 X126.019 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.418 Y121.147 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F8622
M204 S5000
G3 X124.591 Y121.01 I.185 J.056 E.00721
G1 X131.435 Y121.014 E.2103
G3 X131.59 Y121.208 I-.04 J.191 E.00828
G1 X131.589 Y134.816 E.41814
G3 X131.409 Y134.99 I-.194 J-.021 E.00834
G1 X124.582 Y134.989 E.20976
G3 X124.41 Y134.792 I.025 J-.195 E.00879
G1 X124.418 Y121.207 E.41741
M204 S10000
G1 X124.825 Y121.206 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X124.825 Y122.806 E.05708
; WIPE_START
G1 X124.825 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.487 Y123.613 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8622
M204 S6000
G1 X125.487 Y132.387 E.10701
; WIPE_START
G1 F15000
G1 X125.487 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.825 Y133.194 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X124.825 Y134.794 E.05709
M204 S10000
G1 X131.175 Y134.794 F42000
; LINE_WIDTH: 0.480852
G1 F8220.466
M204 S6000
G1 X131.175 Y133.194 E.05708
; WIPE_START
G1 X131.175 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.512 Y132.387 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.192541
G1 F8622
M204 S6000
G1 X130.512 Y123.613 E.10698
; WIPE_START
G1 F15000
G1 X130.512 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.175 Y122.806 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.480802
G1 F8221.404
M204 S6000
G1 X131.175 Y121.206 E.05707
; OBJECT_ID: 394
; WIPE_START
G1 X131.175 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X123.544 Y122.953 Z3 F42000
G1 X106.965 Y123.273 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8622
M204 S6000
G1 X110.227 Y123.273 E.10821
G1 X110.227 Y132.727 E.31361
G1 X106.573 Y132.727 E.12121
G1 X106.573 Y123.273 E.31361
G1 X106.905 Y123.273 E.01102
M204 S250
G1 X106.965 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8622
M204 S5000
G1 X109.835 Y123.665 E.08819
G1 X109.835 Y132.335 E.2664
G1 X106.965 Y132.335 E.08819
G1 X106.965 Y123.725 E.26456
M204 S10000
G1 X106.166 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8622
M204 S6000
G1 X106.166 Y132.591 E.29609
G1 X105.609 Y132.591 E.01847
G1 X105.609 Y123.409 E.30458
G1 X106.166 Y123.409 E.01847
G1 X106.166 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X106.166 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I-1.025 J.656 P1  F42000
G1 X110.634 Y132.591 Z3
G1 Z2.6
G1 E.8 F1800
G1 F8622
M204 S6000
G1 X110.634 Y123.409 E.30458
G1 X111.191 Y123.409 E.01847
G1 X111.191 Y132.591 E.30458
G1 X110.694 Y132.591 E.01648
; WIPE_START
G1 F8843.478
G1 X110.681 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I-.524 J-1.098 P1  F42000
G1 X105.64 Y132.998 Z3
G1 Z2.6
G1 E.8 F1800
G1 F8622
M204 S6000
G1 X105.202 Y132.998 E.01453
G1 X105.202 Y123.002 E.33158
G1 X111.598 Y123.002 E.21216
G1 X111.598 Y132.998 E.33158
G1 X105.7 Y132.998 E.19564
M204 S250
G1 X105.64 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8622
M204 S5000
G1 X111.16 Y133.39 E.16961
G1 X111.16 Y134.61 E.03749
G1 X105.64 Y134.61 E.16961
G1 X105.64 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X107.64 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.252 Y125.923 Z3 F42000
G1 X105.64 Y122.61 Z3
G1 Z2.6
G1 E.8 F1800
G1 F8622
M204 S5000
G1 X105.64 Y121.39 E.03749
G1 X111.16 Y121.39 E.16961
G1 X111.16 Y122.61 E.03749
G1 X105.7 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.64 Y121.39 E-.46416
G1 X106.419 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.818 Y121.147 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F8622
M204 S5000
G3 X104.991 Y121.01 I.185 J.056 E.00721
G1 X111.835 Y121.014 E.2103
G3 X111.99 Y121.208 I-.04 J.191 E.00828
G1 X111.989 Y134.816 E.41814
G3 X111.809 Y134.99 I-.194 J-.021 E.00834
G1 X104.982 Y134.989 E.20976
G3 X104.81 Y134.792 I.025 J-.195 E.00879
G1 X104.818 Y121.207 E.41741
M204 S10000
G1 X105.225 Y121.206 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X105.225 Y122.806 E.05708
; WIPE_START
G1 X105.225 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.887 Y123.613 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8622
M204 S6000
G1 X105.887 Y132.387 E.10701
; WIPE_START
G1 F15000
G1 X105.887 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.225 Y133.194 Z3 F42000
G1 Z2.6
M73 P42 R12
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X105.225 Y134.794 E.05709
M204 S10000
G1 X111.575 Y134.794 F42000
; LINE_WIDTH: 0.480852
G1 F8220.466
M204 S6000
G1 X111.575 Y133.194 E.05708
; WIPE_START
G1 X111.575 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.912 Y132.387 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.192541
G1 F8622
M204 S6000
G1 X110.912 Y123.613 E.10698
; WIPE_START
G1 F15000
G1 X110.912 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.575 Y122.806 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.480802
G1 F8221.404
M204 S6000
G1 X111.575 Y121.206 E.05707
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8221.404
G1 X111.575 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 14/73
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z3 I-.016 J1.217 P1  F42000
G1 X146.165 Y123.273 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8460
M204 S6000
G1 X149.427 Y123.273 E.10821
G1 X149.427 Y132.727 E.31361
G1 X145.773 Y132.727 E.12121
G1 X145.773 Y123.273 E.31361
G1 X146.105 Y123.273 E.01102
M204 S250
G1 X146.165 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8460
M204 S5000
G1 X149.035 Y123.665 E.08819
G1 X149.035 Y132.335 E.2664
G1 X146.165 Y132.335 E.08819
G1 X146.165 Y123.725 E.26456
M204 S10000
G1 X145.366 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8460
M204 S6000
G1 X145.366 Y132.591 E.29609
G1 X144.809 Y132.591 E.01847
G1 X144.809 Y123.409 E.30458
G1 X145.366 Y123.409 E.01847
G1 X145.366 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X145.366 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.478 Y132.035 Z3.2 F42000
G1 X149.834 Y132.591 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F8460
M204 S6000
G1 X149.834 Y123.409 E.30458
G1 X150.391 Y123.409 E.01847
G1 X150.391 Y132.591 E.30458
G1 X149.894 Y132.591 E.01648
; WIPE_START
G1 F8843.478
G1 X149.881 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.84 Y132.998 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F8460
M204 S6000
G1 X144.402 Y132.998 E.01453
G1 X144.402 Y123.002 E.33158
G1 X150.798 Y123.002 E.21216
G1 X150.798 Y132.998 E.33158
G1 X144.9 Y132.998 E.19564
M204 S250
G1 X144.84 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8460
M204 S5000
G1 X150.36 Y133.39 E.16961
G1 X150.36 Y134.61 E.03749
G1 X144.84 Y134.61 E.16961
G1 X144.84 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X146.84 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.201 Y126.17 Z3.2 F42000
G1 X150.36 Y122.61 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F8460
M204 S5000
G1 X144.84 Y122.61 E.16961
G1 X144.84 Y121.39 E.03749
G1 X150.36 Y121.39 E.16961
G1 X150.36 Y122.55 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.36 Y122.572 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.022 Y121.134 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F8460
M204 S5000
G3 X144.193 Y121.01 I.179 J.068 E.00687
G1 X151.035 Y121.014 E.21022
G3 X151.19 Y121.208 I-.039 J.191 E.00827
G1 X151.189 Y134.816 E.41815
G3 X151.007 Y134.99 I-.196 J-.023 E.00838
G1 X144.211 Y134.99 E.20882
G3 X144.01 Y134.792 I-.008 J-.193 E.00972
G1 X144.01 Y121.211 E.41731
G3 X144.01 Y121.193 I.191 J-.009 E.00055
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.061 Y121.071 E-.05019
G1 X144.121 Y121.028 E-.02814
G1 X144.193 Y121.01 E-.02831
G1 X145.913 Y121.011 E-.65336
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 14 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.2
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer14 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X144.425 Y121.206 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X144.425 Y122.806 E.05708
; WIPE_START
G1 X144.425 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.087 Y123.613 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8460
M204 S6000
G1 X145.087 Y132.387 E.10701
; WIPE_START
G1 F15000
G1 X145.087 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.425 Y133.194 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X144.425 Y134.794 E.05709
M204 S10000
G1 X150.775 Y134.794 F42000
; LINE_WIDTH: 0.480852
G1 F8220.466
M204 S6000
G1 X150.775 Y133.194 E.05708
; WIPE_START
G1 X150.775 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.112 Y132.387 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.192541
G1 F8460
M204 S6000
G1 X150.112 Y123.613 E.10698
; WIPE_START
G1 F15000
G1 X150.112 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.775 Y122.806 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.480792
G1 F8221.592
M204 S6000
G1 X150.775 Y121.206 E.05707
; OBJECT_ID: 405
; WIPE_START
G1 X150.775 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X143.144 Y122.953 Z3.2 F42000
G1 X126.565 Y123.273 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8460
M204 S6000
G1 X129.827 Y123.273 E.10821
G1 X129.827 Y132.727 E.31361
G1 X126.173 Y132.727 E.12121
G1 X126.173 Y123.273 E.31361
G1 X126.505 Y123.273 E.01102
M204 S250
G1 X126.565 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8460
M204 S5000
G1 X129.435 Y123.665 E.08819
G1 X129.435 Y132.335 E.2664
G1 X126.565 Y132.335 E.08819
G1 X126.565 Y123.725 E.26456
M204 S10000
G1 X125.766 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8460
M204 S6000
G1 X125.766 Y132.591 E.29609
G1 X125.209 Y132.591 E.01847
G1 X125.209 Y123.409 E.30458
G1 X125.766 Y123.409 E.01847
G1 X125.766 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X125.766 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.878 Y132.035 Z3.2 F42000
G1 X130.234 Y132.591 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F8460
M204 S6000
G1 X130.234 Y123.409 E.30458
G1 X130.791 Y123.409 E.01847
G1 X130.791 Y132.591 E.30458
G1 X130.294 Y132.591 E.01648
; WIPE_START
G1 F8843.478
G1 X130.281 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.24 Y132.998 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F8460
M204 S6000
G1 X124.802 Y132.998 E.01453
G1 X124.802 Y123.002 E.33158
G1 X131.198 Y123.002 E.21216
G1 X131.198 Y132.998 E.33158
G1 X125.3 Y132.998 E.19564
M204 S250
G1 X125.24 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8460
M204 S5000
G1 X130.76 Y133.39 E.16961
G1 X130.76 Y134.61 E.03749
G1 X125.24 Y134.61 E.16961
G1 X125.24 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.24 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.852 Y125.923 Z3.2 F42000
G1 X125.24 Y122.61 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F8460
M204 S5000
G1 X125.24 Y121.39 E.03749
G1 X130.76 Y121.39 E.16961
G1 X130.76 Y122.61 E.03749
G1 X125.3 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.24 Y121.39 E-.46416
G1 X126.019 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.422 Y121.134 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F8460
M204 S5000
G3 X124.593 Y121.01 I.179 J.068 E.00687
G1 X131.435 Y121.014 E.21022
G3 X131.59 Y121.208 I-.039 J.191 E.00827
G1 X131.589 Y134.816 E.41815
G3 X131.407 Y134.99 I-.196 J-.023 E.00838
G1 X124.611 Y134.99 E.20882
G3 X124.41 Y134.792 I-.008 J-.193 E.00972
G1 X124.41 Y121.211 E.41731
G3 X124.41 Y121.193 I.191 J-.009 E.00055
M204 S10000
G1 X124.825 Y121.206 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X124.825 Y122.806 E.05708
; WIPE_START
G1 X124.825 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.487 Y123.613 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8460
M204 S6000
G1 X125.487 Y132.387 E.10701
; WIPE_START
G1 F15000
G1 X125.487 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.825 Y133.194 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X124.825 Y134.794 E.05709
M204 S10000
G1 X131.175 Y134.794 F42000
; LINE_WIDTH: 0.480852
G1 F8220.466
M204 S6000
G1 X131.175 Y133.194 E.05708
; WIPE_START
G1 X131.175 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.512 Y132.387 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.192541
G1 F8460
M204 S6000
G1 X130.512 Y123.613 E.10698
; WIPE_START
G1 F15000
G1 X130.512 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.175 Y122.806 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.480792
G1 F8221.592
M204 S6000
G1 X131.175 Y121.206 E.05707
; OBJECT_ID: 394
; WIPE_START
G1 X131.175 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X123.544 Y122.953 Z3.2 F42000
G1 X106.965 Y123.273 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8460
M204 S6000
G1 X110.227 Y123.273 E.10821
G1 X110.227 Y132.727 E.31361
G1 X106.573 Y132.727 E.12121
G1 X106.573 Y123.273 E.31361
G1 X106.905 Y123.273 E.01102
M204 S250
G1 X106.965 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8460
M204 S5000
G1 X109.835 Y123.665 E.08819
G1 X109.835 Y132.335 E.2664
G1 X106.965 Y132.335 E.08819
G1 X106.965 Y123.725 E.26456
M204 S10000
G1 X106.166 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8460
M204 S6000
G1 X106.166 Y132.591 E.29609
G1 X105.609 Y132.591 E.01847
G1 X105.609 Y123.409 E.30458
G1 X106.166 Y123.409 E.01847
G1 X106.166 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X106.166 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.278 Y132.035 Z3.2 F42000
G1 X110.634 Y132.591 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F8460
M204 S6000
G1 X110.634 Y123.409 E.30458
G1 X111.191 Y123.409 E.01847
G1 X111.191 Y132.591 E.30458
G1 X110.694 Y132.591 E.01648
; WIPE_START
G1 F8843.478
G1 X110.681 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.64 Y132.998 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F8460
M204 S6000
G1 X105.202 Y132.998 E.01453
G1 X105.202 Y123.002 E.33158
G1 X111.598 Y123.002 E.21216
G1 X111.598 Y132.998 E.33158
G1 X105.7 Y132.998 E.19564
M204 S250
G1 X105.64 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8460
M204 S5000
G1 X111.16 Y133.39 E.16961
G1 X111.16 Y134.61 E.03749
G1 X105.64 Y134.61 E.16961
G1 X105.64 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X107.64 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.252 Y125.923 Z3.2 F42000
G1 X105.64 Y122.61 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F8460
M204 S5000
G1 X105.64 Y121.39 E.03749
G1 X111.16 Y121.39 E.16961
G1 X111.16 Y122.61 E.03749
G1 X105.7 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.64 Y121.39 E-.46416
G1 X106.419 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.822 Y121.134 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F8460
M204 S5000
G3 X104.993 Y121.01 I.179 J.068 E.00687
G1 X111.835 Y121.014 E.21022
G3 X111.99 Y121.208 I-.039 J.191 E.00827
G1 X111.989 Y134.816 E.41815
G3 X111.807 Y134.99 I-.196 J-.023 E.00838
G1 X105.011 Y134.99 E.20882
G3 X104.81 Y134.792 I-.008 J-.193 E.00972
G1 X104.81 Y121.211 E.41731
G3 X104.81 Y121.193 I.191 J-.009 E.00055
M204 S10000
M73 P43 R12
G1 X105.225 Y121.206 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X105.225 Y122.806 E.05708
; WIPE_START
G1 X105.225 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.887 Y123.613 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8460
M204 S6000
G1 X105.887 Y132.387 E.10701
; WIPE_START
G1 F15000
G1 X105.887 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.225 Y133.194 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X105.225 Y134.794 E.05709
M204 S10000
G1 X111.575 Y134.794 F42000
; LINE_WIDTH: 0.480852
G1 F8220.466
M204 S6000
G1 X111.575 Y133.194 E.05708
; WIPE_START
G1 X111.575 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.912 Y132.387 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.192541
G1 F8460
M204 S6000
G1 X110.912 Y123.613 E.10698
; WIPE_START
G1 F15000
G1 X110.912 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.575 Y122.806 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.480792
G1 F8221.592
M204 S6000
G1 X111.575 Y121.206 E.05707
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8221.592
G1 X111.575 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 15/73
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z3.2 I-.016 J1.217 P1  F42000
G1 X146.165 Y123.273 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8476
M204 S6000
G1 X149.427 Y123.273 E.10821
G1 X149.427 Y132.727 E.31361
G1 X145.773 Y132.727 E.12121
G1 X145.773 Y123.273 E.31361
G1 X146.105 Y123.273 E.01102
M204 S250
G1 X146.165 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8476
M204 S5000
G1 X149.035 Y123.665 E.08819
G1 X149.035 Y132.335 E.2664
G1 X146.165 Y132.335 E.08819
G1 X146.165 Y123.725 E.26456
M204 S10000
G1 X145.366 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8476
M204 S6000
G1 X145.366 Y132.591 E.29609
G1 X144.809 Y132.591 E.01847
G1 X144.809 Y123.409 E.30458
G1 X145.366 Y123.409 E.01847
G1 X145.366 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X145.366 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.478 Y132.035 Z3.4 F42000
G1 X149.834 Y132.591 Z3.4
G1 Z3
G1 E.8 F1800
G1 F8476
M204 S6000
G1 X149.834 Y123.409 E.30458
G1 X150.391 Y123.409 E.01847
G1 X150.391 Y132.591 E.30458
G1 X149.894 Y132.591 E.01648
; WIPE_START
G1 F8843.478
G1 X149.881 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.84 Y132.998 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F8476
M204 S6000
G1 X144.402 Y132.998 E.01453
G1 X144.402 Y123.002 E.33158
G1 X150.798 Y123.002 E.21216
G1 X150.798 Y132.998 E.33158
G1 X144.9 Y132.998 E.19564
M204 S250
G1 X144.84 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8476
M204 S5000
G1 X150.36 Y133.39 E.16961
G1 X150.36 Y134.61 E.03749
G1 X144.84 Y134.61 E.16961
G1 X144.84 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X146.84 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.201 Y126.17 Z3.4 F42000
G1 X150.36 Y122.61 Z3.4
G1 Z3
G1 E.8 F1800
G1 F8476
M204 S5000
G1 X144.84 Y122.61 E.16961
G1 X144.84 Y121.39 E.03749
G1 X150.36 Y121.39 E.16961
G1 X150.36 Y122.55 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.36 Y122.572 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.011 Y121.182 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F8476
M204 S5000
G3 X144.193 Y121.01 I.193 J.022 E.00835
G1 X151.035 Y121.014 E.21022
G3 X151.19 Y121.207 I-.04 J.191 E.00825
G1 X151.189 Y134.816 E.41816
G3 X151.007 Y134.99 I-.193 J-.021 E.0084
G1 X144.182 Y134.989 E.20971
G3 X144.01 Y134.792 I.025 J-.195 E.00877
G1 X144.011 Y121.242 E.41636
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.071 Y121.061 E-.07223
G1 X144.193 Y121.01 E-.05046
G1 X145.871 Y121.011 E-.63732
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 15 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.4
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer15 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X144.425 Y121.206 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X144.425 Y122.806 E.05708
; WIPE_START
G1 X144.425 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.087 Y123.613 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8476
M204 S6000
G1 X145.087 Y132.387 E.10701
; WIPE_START
G1 F15000
G1 X145.087 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.425 Y133.194 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X144.425 Y134.794 E.05709
M204 S10000
G1 X150.775 Y134.794 F42000
; LINE_WIDTH: 0.480852
G1 F8220.466
M204 S6000
G1 X150.775 Y133.194 E.05708
; WIPE_START
G1 X150.775 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.112 Y132.387 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.192541
G1 F8476
M204 S6000
G1 X150.112 Y123.613 E.10698
; WIPE_START
G1 F15000
G1 X150.112 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.775 Y122.806 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.480792
G1 F8221.592
M204 S6000
G1 X150.775 Y121.206 E.05707
; OBJECT_ID: 405
; WIPE_START
G1 X150.775 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X143.144 Y122.953 Z3.4 F42000
G1 X126.565 Y123.273 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8476
M204 S6000
G1 X129.827 Y123.273 E.10821
G1 X129.827 Y132.727 E.31361
G1 X126.173 Y132.727 E.12121
G1 X126.173 Y123.273 E.31361
G1 X126.505 Y123.273 E.01102
M204 S250
G1 X126.565 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8476
M204 S5000
G1 X129.435 Y123.665 E.08819
G1 X129.435 Y132.335 E.2664
G1 X126.565 Y132.335 E.08819
G1 X126.565 Y123.725 E.26456
M204 S10000
G1 X125.766 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8476
M204 S6000
G1 X125.766 Y132.591 E.29609
G1 X125.209 Y132.591 E.01847
G1 X125.209 Y123.409 E.30458
G1 X125.766 Y123.409 E.01847
G1 X125.766 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X125.766 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.878 Y132.035 Z3.4 F42000
G1 X130.234 Y132.591 Z3.4
G1 Z3
G1 E.8 F1800
G1 F8476
M204 S6000
G1 X130.234 Y123.409 E.30458
G1 X130.791 Y123.409 E.01847
G1 X130.791 Y132.591 E.30458
G1 X130.294 Y132.591 E.01648
; WIPE_START
G1 F8843.478
G1 X130.281 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.24 Y132.998 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F8476
M204 S6000
G1 X124.802 Y132.998 E.01453
G1 X124.802 Y123.002 E.33158
G1 X131.198 Y123.002 E.21216
G1 X131.198 Y132.998 E.33158
G1 X125.3 Y132.998 E.19564
M204 S250
G1 X125.24 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8476
M204 S5000
G1 X130.76 Y133.39 E.16961
G1 X130.76 Y134.61 E.03749
G1 X125.24 Y134.61 E.16961
G1 X125.24 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.24 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.852 Y125.923 Z3.4 F42000
G1 X125.24 Y122.61 Z3.4
G1 Z3
G1 E.8 F1800
G1 F8476
M204 S5000
G1 X125.24 Y121.39 E.03749
G1 X130.76 Y121.39 E.16961
G1 X130.76 Y122.61 E.03749
G1 X125.3 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.24 Y121.39 E-.46416
G1 X126.019 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.411 Y121.182 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F8476
M204 S5000
G3 X124.593 Y121.01 I.193 J.022 E.00835
G1 X131.435 Y121.014 E.21022
G3 X131.59 Y121.207 I-.04 J.191 E.00825
G1 X131.589 Y134.816 E.41816
G3 X131.407 Y134.99 I-.193 J-.021 E.0084
G1 X124.582 Y134.989 E.20971
G3 X124.41 Y134.792 I.025 J-.195 E.00877
G1 X124.411 Y121.242 E.41636
M204 S10000
G1 X124.825 Y121.206 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X124.825 Y122.806 E.05708
; WIPE_START
G1 X124.825 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.487 Y123.613 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8476
M204 S6000
G1 X125.487 Y132.387 E.10701
; WIPE_START
G1 F15000
G1 X125.487 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.825 Y133.194 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X124.825 Y134.794 E.05709
M204 S10000
G1 X131.175 Y134.794 F42000
; LINE_WIDTH: 0.480852
G1 F8220.466
M204 S6000
G1 X131.175 Y133.194 E.05708
; WIPE_START
G1 X131.175 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.512 Y132.387 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.192541
G1 F8476
M204 S6000
G1 X130.512 Y123.613 E.10698
; WIPE_START
G1 F15000
G1 X130.512 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.175 Y122.806 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.480792
G1 F8221.592
M204 S6000
G1 X131.175 Y121.206 E.05707
; OBJECT_ID: 394
; WIPE_START
G1 X131.175 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X123.544 Y122.953 Z3.4 F42000
G1 X106.965 Y123.273 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8476
M204 S6000
G1 X110.227 Y123.273 E.10821
G1 X110.227 Y132.727 E.31361
G1 X106.573 Y132.727 E.12121
G1 X106.573 Y123.273 E.31361
G1 X106.905 Y123.273 E.01102
M204 S250
G1 X106.965 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8476
M204 S5000
G1 X109.835 Y123.665 E.08819
G1 X109.835 Y132.335 E.2664
G1 X106.965 Y132.335 E.08819
G1 X106.965 Y123.725 E.26456
M204 S10000
G1 X106.166 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8476
M204 S6000
G1 X106.166 Y132.591 E.29609
G1 X105.609 Y132.591 E.01847
G1 X105.609 Y123.409 E.30458
G1 X106.166 Y123.409 E.01847
G1 X106.166 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X106.166 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.278 Y132.035 Z3.4 F42000
G1 X110.634 Y132.591 Z3.4
G1 Z3
G1 E.8 F1800
G1 F8476
M204 S6000
G1 X110.634 Y123.409 E.30458
G1 X111.191 Y123.409 E.01847
G1 X111.191 Y132.591 E.30458
G1 X110.694 Y132.591 E.01648
; WIPE_START
G1 F8843.478
G1 X110.681 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.64 Y132.998 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F8476
M204 S6000
G1 X105.202 Y132.998 E.01453
G1 X105.202 Y123.002 E.33158
G1 X111.598 Y123.002 E.21216
G1 X111.598 Y132.998 E.33158
G1 X105.7 Y132.998 E.19564
M204 S250
G1 X105.64 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8476
M204 S5000
G1 X111.16 Y133.39 E.16961
G1 X111.16 Y134.61 E.03749
G1 X105.64 Y134.61 E.16961
G1 X105.64 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X107.64 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.252 Y125.923 Z3.4 F42000
G1 X105.64 Y122.61 Z3.4
G1 Z3
G1 E.8 F1800
G1 F8476
M204 S5000
G1 X105.64 Y121.39 E.03749
G1 X111.16 Y121.39 E.16961
M73 P44 R12
G1 X111.16 Y122.61 E.03749
G1 X105.7 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.64 Y121.39 E-.46416
G1 X106.419 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.811 Y121.182 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F8476
M204 S5000
G3 X104.993 Y121.01 I.193 J.022 E.00835
G1 X111.835 Y121.014 E.21022
G3 X111.99 Y121.207 I-.04 J.191 E.00825
G1 X111.989 Y134.816 E.41816
G3 X111.807 Y134.99 I-.193 J-.021 E.0084
G1 X104.982 Y134.989 E.20971
G3 X104.81 Y134.792 I.025 J-.195 E.00877
G1 X104.811 Y121.242 E.41636
M204 S10000
G1 X105.225 Y121.206 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X105.225 Y122.806 E.05708
; WIPE_START
G1 X105.225 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.887 Y123.613 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8476
M204 S6000
G1 X105.887 Y132.387 E.10701
; WIPE_START
G1 F15000
G1 X105.887 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.225 Y133.194 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X105.225 Y134.794 E.05709
M204 S10000
G1 X111.575 Y134.794 F42000
; LINE_WIDTH: 0.480852
G1 F8220.466
M204 S6000
G1 X111.575 Y133.194 E.05708
; WIPE_START
G1 X111.575 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.912 Y132.387 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.192541
G1 F8476
M204 S6000
G1 X110.912 Y123.613 E.10698
; WIPE_START
G1 F15000
G1 X110.912 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.575 Y122.806 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.480792
G1 F8221.592
M204 S6000
G1 X111.575 Y121.206 E.05707
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8221.592
G1 X111.575 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 16/73
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z3.4 I-.016 J1.217 P1  F42000
G1 X146.165 Y123.273 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8476
M204 S6000
G1 X149.427 Y123.273 E.10821
G1 X149.427 Y132.727 E.31361
G1 X145.773 Y132.727 E.12121
G1 X145.773 Y123.273 E.31361
G1 X146.105 Y123.273 E.01102
M204 S250
G1 X146.165 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8476
M204 S5000
G1 X149.035 Y123.665 E.08819
G1 X149.035 Y132.335 E.2664
G1 X146.165 Y132.335 E.08819
G1 X146.165 Y123.725 E.26456
M204 S10000
G1 X145.366 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8476
M204 S6000
G1 X145.366 Y132.591 E.29609
G1 X144.809 Y132.591 E.01847
G1 X144.809 Y123.409 E.30458
G1 X145.366 Y123.409 E.01847
G1 X145.366 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X145.366 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.478 Y132.035 Z3.6 F42000
G1 X149.834 Y132.591 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F8476
M204 S6000
G1 X149.834 Y123.409 E.30458
G1 X150.391 Y123.409 E.01847
G1 X150.391 Y132.591 E.30458
G1 X149.894 Y132.591 E.01648
; WIPE_START
G1 F8843.478
G1 X149.881 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.84 Y132.998 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
G1 F8476
M204 S6000
G1 X144.402 Y132.998 E.01453
G1 X144.402 Y123.002 E.33158
G1 X150.798 Y123.002 E.21216
G1 X150.798 Y132.998 E.33158
G1 X144.9 Y132.998 E.19565
M204 S250
G1 X144.84 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8476
M204 S5000
G1 X150.36 Y133.39 E.16961
G1 X150.36 Y134.61 E.03749
G1 X144.84 Y134.61 E.16961
G1 X144.84 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X146.84 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.201 Y126.17 Z3.6 F42000
G1 X150.36 Y122.61 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F8476
M204 S5000
G1 X144.84 Y122.61 E.16961
G1 X144.84 Y121.39 E.03749
G1 X150.36 Y121.39 E.16961
G1 X150.36 Y122.55 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.36 Y122.572 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.01 Y121.21 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
G1 F8476
M204 S5000
G3 X144.193 Y121.01 I.192 J-.008 E.00925
G1 X151.035 Y121.014 E.21022
G3 X151.19 Y121.21 I-.04 J.191 E.00834
G1 X151.185 Y134.842 E.41885
G3 X151.007 Y134.99 I-.187 J-.044 E.00763
G1 X144.159 Y134.985 E.21042
G3 X144.01 Y134.792 I.044 J-.188 E.00811
G1 X144.01 Y121.27 E.41549
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.021 Y121.136 E-.05118
G1 X144.053 Y121.08 E-.02459
G1 X144.121 Y121.028 E-.03237
G1 X144.193 Y121.01 E-.02835
G1 X145.834 Y121.011 E-.62351
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 16 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.6
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer16 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X144.425 Y121.206 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X144.425 Y122.806 E.05708
; WIPE_START
G1 X144.425 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.087 Y123.613 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8476
M204 S6000
G1 X145.087 Y132.387 E.10701
; WIPE_START
G1 F15000
G1 X145.087 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.425 Y133.194 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X144.425 Y134.794 E.05709
M204 S10000
G1 X150.775 Y134.794 F42000
G1 F8220.304
M204 S6000
G1 X150.775 Y133.194 E.05708
; WIPE_START
G1 X150.775 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.113 Y132.387 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8476
M204 S6000
G1 X150.113 Y123.613 E.10701
; WIPE_START
G1 F15000
G1 X150.113 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.775 Y122.806 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X150.775 Y121.206 E.05708
; OBJECT_ID: 405
; WIPE_START
G1 X150.775 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X143.144 Y122.953 Z3.6 F42000
G1 X126.565 Y123.273 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8476
M204 S6000
G1 X129.827 Y123.273 E.10821
G1 X129.827 Y132.727 E.31361
G1 X126.173 Y132.727 E.12121
G1 X126.173 Y123.273 E.31361
G1 X126.505 Y123.273 E.01102
M204 S250
G1 X126.565 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8476
M204 S5000
G1 X129.435 Y123.665 E.08819
G1 X129.435 Y132.335 E.2664
G1 X126.565 Y132.335 E.08819
G1 X126.565 Y123.725 E.26456
M204 S10000
G1 X125.766 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8476
M204 S6000
G1 X125.766 Y132.591 E.29609
G1 X125.209 Y132.591 E.01847
G1 X125.209 Y123.409 E.30458
G1 X125.766 Y123.409 E.01847
G1 X125.766 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X125.766 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.878 Y132.035 Z3.6 F42000
G1 X130.234 Y132.591 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F8476
M204 S6000
G1 X130.234 Y123.409 E.30458
G1 X130.791 Y123.409 E.01847
G1 X130.791 Y132.591 E.30458
G1 X130.294 Y132.591 E.01648
; WIPE_START
G1 F8843.478
G1 X130.281 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.24 Y132.998 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
G1 F8476
M204 S6000
G1 X124.802 Y132.998 E.01453
G1 X124.802 Y123.002 E.33158
G1 X131.198 Y123.002 E.21216
G1 X131.198 Y132.998 E.33158
G1 X125.3 Y132.998 E.19565
M204 S250
G1 X125.24 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8476
M204 S5000
G1 X130.76 Y133.39 E.16961
G1 X130.76 Y134.61 E.03749
G1 X125.24 Y134.61 E.16961
G1 X125.24 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.24 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.852 Y125.923 Z3.6 F42000
G1 X125.24 Y122.61 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F8476
M204 S5000
G1 X125.24 Y121.39 E.03749
G1 X130.76 Y121.39 E.16961
G1 X130.76 Y122.61 E.03749
G1 X125.3 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.24 Y121.39 E-.46416
G1 X126.019 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.41 Y121.21 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
G1 F8476
M204 S5000
G3 X124.593 Y121.01 I.192 J-.008 E.00925
G1 X131.435 Y121.014 E.21022
G3 X131.59 Y121.21 I-.04 J.191 E.00834
G1 X131.585 Y134.842 E.41885
G3 X131.407 Y134.99 I-.187 J-.044 E.00763
G1 X124.559 Y134.985 E.21042
G3 X124.41 Y134.792 I.044 J-.188 E.00811
G1 X124.41 Y121.27 E.41549
M204 S10000
G1 X124.825 Y121.206 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X124.825 Y122.806 E.05708
; WIPE_START
G1 X124.825 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.487 Y123.613 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8476
M204 S6000
G1 X125.487 Y132.387 E.10701
; WIPE_START
G1 F15000
G1 X125.487 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.825 Y133.194 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X124.825 Y134.794 E.05709
M204 S10000
G1 X131.175 Y134.794 F42000
G1 F8220.304
M204 S6000
G1 X131.175 Y133.194 E.05708
; WIPE_START
G1 X131.175 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.513 Y132.387 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8476
M204 S6000
G1 X130.513 Y123.613 E.10701
; WIPE_START
G1 F15000
G1 X130.513 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.175 Y122.806 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X131.175 Y121.206 E.05708
; OBJECT_ID: 394
; WIPE_START
G1 X131.175 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X123.544 Y122.953 Z3.6 F42000
G1 X106.965 Y123.273 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8476
M204 S6000
G1 X110.227 Y123.273 E.10821
G1 X110.227 Y132.727 E.31361
G1 X106.573 Y132.727 E.12121
G1 X106.573 Y123.273 E.31361
G1 X106.905 Y123.273 E.01102
M204 S250
G1 X106.965 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8476
M204 S5000
G1 X109.835 Y123.665 E.08819
G1 X109.835 Y132.335 E.2664
G1 X106.965 Y132.335 E.08819
G1 X106.965 Y123.725 E.26456
M204 S10000
G1 X106.166 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8476
M204 S6000
G1 X106.166 Y132.591 E.29609
G1 X105.609 Y132.591 E.01847
G1 X105.609 Y123.409 E.30458
G1 X106.166 Y123.409 E.01847
G1 X106.166 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X106.166 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.278 Y132.035 Z3.6 F42000
G1 X110.634 Y132.591 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F8476
M204 S6000
G1 X110.634 Y123.409 E.30458
G1 X111.191 Y123.409 E.01847
G1 X111.191 Y132.591 E.30458
G1 X110.694 Y132.591 E.01648
; WIPE_START
G1 F8843.478
G1 X110.681 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.64 Y132.998 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
G1 F8476
M204 S6000
G1 X105.202 Y132.998 E.01453
G1 X105.202 Y123.002 E.33158
G1 X111.598 Y123.002 E.21216
G1 X111.598 Y132.998 E.33158
M73 P45 R12
G1 X105.7 Y132.998 E.19565
M204 S250
G1 X105.64 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8476
M204 S5000
G1 X111.16 Y133.39 E.16961
G1 X111.16 Y134.61 E.03749
G1 X105.64 Y134.61 E.16961
G1 X105.64 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X107.64 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.252 Y125.923 Z3.6 F42000
G1 X105.64 Y122.61 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F8476
M204 S5000
G1 X105.64 Y121.39 E.03749
G1 X111.16 Y121.39 E.16961
G1 X111.16 Y122.61 E.03749
G1 X105.7 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.64 Y121.39 E-.46416
G1 X106.419 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.81 Y121.21 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
G1 F8476
M204 S5000
G3 X104.993 Y121.01 I.192 J-.008 E.00925
G1 X111.835 Y121.014 E.21022
G3 X111.99 Y121.21 I-.04 J.191 E.00834
G1 X111.985 Y134.842 E.41885
G3 X111.807 Y134.99 I-.187 J-.044 E.00763
G1 X104.959 Y134.985 E.21042
G3 X104.81 Y134.792 I.044 J-.188 E.00811
G1 X104.81 Y121.27 E.41549
M204 S10000
G1 X105.225 Y121.206 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X105.225 Y122.806 E.05708
; WIPE_START
G1 X105.225 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.887 Y123.613 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8476
M204 S6000
G1 X105.887 Y132.387 E.10701
; WIPE_START
G1 F15000
G1 X105.887 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.225 Y133.194 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X105.225 Y134.794 E.05709
M204 S10000
G1 X111.575 Y134.794 F42000
G1 F8220.304
M204 S6000
G1 X111.575 Y133.194 E.05708
; WIPE_START
G1 X111.575 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.913 Y132.387 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8476
M204 S6000
G1 X110.913 Y123.613 E.10701
; WIPE_START
G1 F15000
G1 X110.913 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.575 Y122.806 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X111.575 Y121.206 E.05708
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.304
G1 X111.575 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 17/73
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z3.6 I-.016 J1.217 P1  F42000
G1 X146.165 Y123.273 Z3.6
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8476
M204 S6000
G1 X149.427 Y123.273 E.10821
G1 X149.427 Y132.727 E.31361
G1 X145.773 Y132.727 E.12121
G1 X145.773 Y123.273 E.31361
G1 X146.105 Y123.273 E.01102
M204 S250
G1 X146.165 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8476
M204 S5000
G1 X149.035 Y123.665 E.08819
G1 X149.035 Y132.335 E.2664
G1 X146.165 Y132.335 E.08819
G1 X146.165 Y123.725 E.26456
M204 S10000
G1 X145.366 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8476
M204 S6000
G1 X145.366 Y132.591 E.29609
G1 X144.809 Y132.591 E.01847
G1 X144.809 Y123.409 E.30458
G1 X145.366 Y123.409 E.01847
G1 X145.366 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X145.366 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.478 Y132.035 Z3.8 F42000
G1 X149.834 Y132.591 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F8476
M204 S6000
G1 X149.834 Y123.409 E.30458
G1 X150.391 Y123.409 E.01847
G1 X150.391 Y132.591 E.30458
G1 X149.894 Y132.591 E.01648
; WIPE_START
G1 F8843.478
G1 X149.881 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.84 Y132.998 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F8476
M204 S6000
G1 X144.402 Y132.998 E.01453
G1 X144.402 Y123.002 E.33158
G1 X150.798 Y123.002 E.21216
G1 X150.798 Y132.998 E.33158
G1 X144.9 Y132.998 E.19564
M204 S250
G1 X144.84 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8476
M204 S5000
G1 X150.36 Y133.39 E.16961
G1 X150.36 Y134.61 E.03749
G1 X144.84 Y134.61 E.16961
G1 X144.84 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X146.84 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.201 Y126.17 Z3.8 F42000
G1 X150.36 Y122.61 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F8476
M204 S5000
G1 X144.84 Y122.61 E.16961
G1 X144.84 Y121.39 E.03749
G1 X150.36 Y121.39 E.16961
G1 X150.36 Y122.55 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.36 Y122.572 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.01 Y121.211 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F8476
M204 S5000
G3 X144.191 Y121.01 I.192 J-.008 E.00919
G1 X151.035 Y121.014 E.21031
G3 X151.19 Y121.207 I-.04 J.191 E.00823
G1 X151.189 Y134.816 E.41818
G3 X151.007 Y134.99 I-.196 J-.024 E.00837
G1 X144.211 Y134.99 E.20882
G3 X144.01 Y134.795 I-.008 J-.193 E.00964
G1 X144.01 Y121.271 E.41554
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.022 Y121.134 E-.05229
G1 X144.054 Y121.08 E-.02383
G1 X144.119 Y121.029 E-.03151
G1 X144.191 Y121.01 E-.0281
G1 X145.833 Y121.011 E-.62427
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 17 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.8
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer17 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X144.425 Y121.206 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X144.425 Y122.806 E.05708
; WIPE_START
G1 X144.425 Y121.206 E-.76
; WIPE_END
M73 P45 R11
G1 E-.04 F1800
M204 S10000
G1 X145.087 Y123.613 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8476
M204 S6000
G1 X145.087 Y132.387 E.10701
; WIPE_START
G1 F15000
G1 X145.087 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.425 Y133.194 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X144.425 Y134.794 E.05709
M204 S10000
G1 X150.775 Y134.794 F42000
; LINE_WIDTH: 0.480852
G1 F8220.466
M204 S6000
G1 X150.775 Y133.194 E.05708
; WIPE_START
G1 X150.775 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.112 Y132.387 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.192531
G1 F8476
M204 S6000
G1 X150.112 Y123.613 E.10698
; WIPE_START
G1 F15000
G1 X150.112 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.775 Y122.806 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.480772
G1 F8221.968
M204 S6000
G1 X150.775 Y121.206 E.05707
; OBJECT_ID: 405
; WIPE_START
G1 X150.775 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X143.144 Y122.953 Z3.8 F42000
G1 X126.565 Y123.273 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8476
M204 S6000
G1 X129.827 Y123.273 E.10821
G1 X129.827 Y132.727 E.31361
G1 X126.173 Y132.727 E.12121
G1 X126.173 Y123.273 E.31361
G1 X126.505 Y123.273 E.01102
M204 S250
G1 X126.565 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8476
M204 S5000
G1 X129.435 Y123.665 E.08819
G1 X129.435 Y132.335 E.2664
G1 X126.565 Y132.335 E.08819
G1 X126.565 Y123.725 E.26456
M204 S10000
G1 X125.766 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8476
M204 S6000
G1 X125.766 Y132.591 E.29609
G1 X125.209 Y132.591 E.01847
G1 X125.209 Y123.409 E.30458
G1 X125.766 Y123.409 E.01847
G1 X125.766 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X125.766 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.878 Y132.035 Z3.8 F42000
G1 X130.234 Y132.591 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F8476
M204 S6000
G1 X130.234 Y123.409 E.30458
G1 X130.791 Y123.409 E.01847
G1 X130.791 Y132.591 E.30458
G1 X130.294 Y132.591 E.01648
; WIPE_START
G1 F8843.478
G1 X130.281 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.24 Y132.998 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F8476
M204 S6000
G1 X124.802 Y132.998 E.01453
G1 X124.802 Y123.002 E.33158
G1 X131.198 Y123.002 E.21216
G1 X131.198 Y132.998 E.33158
G1 X125.3 Y132.998 E.19564
M204 S250
G1 X125.24 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8476
M204 S5000
G1 X130.76 Y133.39 E.16961
G1 X130.76 Y134.61 E.03749
G1 X125.24 Y134.61 E.16961
G1 X125.24 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.24 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.852 Y125.923 Z3.8 F42000
G1 X125.24 Y122.61 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F8476
M204 S5000
G1 X125.24 Y121.39 E.03749
G1 X130.76 Y121.39 E.16961
G1 X130.76 Y122.61 E.03749
G1 X125.3 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.24 Y121.39 E-.46416
G1 X126.019 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.41 Y121.211 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F8476
M204 S5000
G3 X124.591 Y121.01 I.192 J-.008 E.00919
G1 X131.435 Y121.014 E.21031
G3 X131.59 Y121.207 I-.04 J.191 E.00823
G1 X131.589 Y134.816 E.41818
G3 X131.407 Y134.99 I-.196 J-.024 E.00837
G1 X124.611 Y134.99 E.20882
G3 X124.41 Y134.795 I-.008 J-.193 E.00964
G1 X124.41 Y121.271 E.41554
M204 S10000
G1 X124.825 Y121.206 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X124.825 Y122.806 E.05708
; WIPE_START
G1 X124.825 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.487 Y123.613 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8476
M204 S6000
G1 X125.487 Y132.387 E.10701
; WIPE_START
G1 F15000
G1 X125.487 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.825 Y133.194 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X124.825 Y134.794 E.05709
M204 S10000
G1 X131.175 Y134.794 F42000
; LINE_WIDTH: 0.480852
G1 F8220.466
M204 S6000
G1 X131.175 Y133.194 E.05708
; WIPE_START
G1 X131.175 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.512 Y132.387 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.192531
G1 F8476
M204 S6000
G1 X130.512 Y123.613 E.10698
; WIPE_START
G1 F15000
G1 X130.512 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.175 Y122.806 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.480772
G1 F8221.968
M204 S6000
G1 X131.175 Y121.206 E.05707
; OBJECT_ID: 394
; WIPE_START
G1 X131.175 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X123.544 Y122.953 Z3.8 F42000
G1 X106.965 Y123.273 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8476
M204 S6000
G1 X110.227 Y123.273 E.10821
G1 X110.227 Y132.727 E.31361
G1 X106.573 Y132.727 E.12121
G1 X106.573 Y123.273 E.31361
G1 X106.905 Y123.273 E.01102
M204 S250
G1 X106.965 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8476
M204 S5000
G1 X109.835 Y123.665 E.08819
G1 X109.835 Y132.335 E.2664
G1 X106.965 Y132.335 E.08819
G1 X106.965 Y123.725 E.26456
M204 S10000
G1 X106.166 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8476
M204 S6000
G1 X106.166 Y132.591 E.29609
G1 X105.609 Y132.591 E.01847
G1 X105.609 Y123.409 E.30458
M73 P46 R11
G1 X106.166 Y123.409 E.01847
G1 X106.166 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X106.166 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.278 Y132.035 Z3.8 F42000
G1 X110.634 Y132.591 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F8476
M204 S6000
G1 X110.634 Y123.409 E.30458
G1 X111.191 Y123.409 E.01847
G1 X111.191 Y132.591 E.30458
G1 X110.694 Y132.591 E.01648
; WIPE_START
G1 F8843.478
G1 X110.681 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.64 Y132.998 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F8476
M204 S6000
G1 X105.202 Y132.998 E.01453
G1 X105.202 Y123.002 E.33158
G1 X111.598 Y123.002 E.21216
G1 X111.598 Y132.998 E.33158
G1 X105.7 Y132.998 E.19564
M204 S250
G1 X105.64 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8476
M204 S5000
G1 X111.16 Y133.39 E.16961
G1 X111.16 Y134.61 E.03749
G1 X105.64 Y134.61 E.16961
G1 X105.64 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X107.64 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.252 Y125.923 Z3.8 F42000
G1 X105.64 Y122.61 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F8476
M204 S5000
G1 X105.64 Y121.39 E.03749
G1 X111.16 Y121.39 E.16961
G1 X111.16 Y122.61 E.03749
G1 X105.7 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.64 Y121.39 E-.46416
G1 X106.419 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.81 Y121.211 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F8476
M204 S5000
G3 X104.991 Y121.01 I.192 J-.008 E.00919
G1 X111.835 Y121.014 E.21031
G3 X111.99 Y121.207 I-.04 J.191 E.00823
G1 X111.989 Y134.816 E.41818
G3 X111.807 Y134.99 I-.196 J-.024 E.00837
G1 X105.011 Y134.99 E.20882
G3 X104.81 Y134.795 I-.008 J-.193 E.00964
G1 X104.81 Y121.271 E.41554
M204 S10000
G1 X105.225 Y121.206 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X105.225 Y122.806 E.05708
; WIPE_START
G1 X105.225 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.887 Y123.613 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8476
M204 S6000
G1 X105.887 Y132.387 E.10701
; WIPE_START
G1 F15000
G1 X105.887 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.225 Y133.194 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X105.225 Y134.794 E.05709
M204 S10000
G1 X111.575 Y134.794 F42000
; LINE_WIDTH: 0.480852
G1 F8220.466
M204 S6000
G1 X111.575 Y133.194 E.05708
; WIPE_START
G1 X111.575 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.912 Y132.387 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.192531
G1 F8476
M204 S6000
G1 X110.912 Y123.613 E.10698
; WIPE_START
G1 F15000
G1 X110.912 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.575 Y122.806 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.480772
G1 F8221.968
M204 S6000
G1 X111.575 Y121.206 E.05707
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8221.968
G1 X111.575 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 18/73
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z3.8 I-.016 J1.217 P1  F42000
G1 X146.165 Y123.273 Z3.8
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8476
M204 S6000
G1 X149.427 Y123.273 E.10821
G1 X149.427 Y132.727 E.31361
G1 X145.773 Y132.727 E.12121
G1 X145.773 Y123.273 E.31361
G1 X146.105 Y123.273 E.01102
M204 S250
G1 X146.165 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8476
M204 S5000
G1 X149.035 Y123.665 E.08819
G1 X149.035 Y132.335 E.2664
G1 X146.165 Y132.335 E.08819
G1 X146.165 Y123.725 E.26456
M204 S10000
G1 X145.366 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8476
M204 S6000
G1 X145.366 Y132.591 E.29609
G1 X144.809 Y132.591 E.01847
G1 X144.809 Y123.409 E.30458
G1 X145.366 Y123.409 E.01847
G1 X145.366 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X145.366 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.478 Y132.035 Z4 F42000
G1 X149.834 Y132.591 Z4
G1 Z3.6
G1 E.8 F1800
G1 F8476
M204 S6000
G1 X149.834 Y123.409 E.30458
G1 X150.391 Y123.409 E.01846
G1 X150.391 Y132.591 E.30458
G1 X149.894 Y132.591 E.01648
; WIPE_START
G1 F8843.478
G1 X149.881 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.84 Y132.998 Z4 F42000
G1 Z3.6
G1 E.8 F1800
G1 F8476
M204 S6000
G1 X144.402 Y132.998 E.01453
G1 X144.402 Y123.002 E.33158
G1 X150.798 Y123.002 E.21216
G1 X150.798 Y132.998 E.33158
G1 X144.9 Y132.998 E.19564
M204 S250
G1 X144.84 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8476
M204 S5000
G1 X150.36 Y133.39 E.16961
G1 X150.36 Y134.61 E.03749
G1 X144.84 Y134.61 E.16961
G1 X144.84 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X146.84 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.201 Y126.17 Z4 F42000
G1 X150.36 Y122.61 Z4
G1 Z3.6
G1 E.8 F1800
G1 F8476
M204 S5000
G1 X144.84 Y122.61 E.16961
G1 X144.84 Y121.39 E.03749
G1 X150.36 Y121.39 E.16961
G1 X150.36 Y122.55 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.36 Y122.572 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.01 Y121.211 Z4 F42000
G1 Z3.6
G1 E.8 F1800
G1 F8476
M204 S5000
G3 X144.193 Y121.01 I.192 J-.008 E.00926
G1 X151.035 Y121.014 E.21024
G3 X151.19 Y121.207 I-.04 J.19 E.00823
G1 X151.189 Y134.816 E.41819
G3 X151.007 Y134.99 I-.193 J-.021 E.0084
G1 X144.211 Y134.99 E.20881
G3 X144.01 Y134.792 I-.008 J-.193 E.00972
G1 X144.01 Y121.271 E.41546
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.022 Y121.134 E-.05226
G1 X144.052 Y121.082 E-.02291
G1 X144.119 Y121.029 E-.03245
G1 X144.193 Y121.01 E-.02897
G1 X145.833 Y121.011 E-.62342
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 18 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer18 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X144.425 Y121.206 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X144.425 Y122.806 E.05708
; WIPE_START
G1 X144.425 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.087 Y123.613 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8476
M204 S6000
G1 X145.087 Y132.387 E.10701
; WIPE_START
G1 F15000
G1 X145.087 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.425 Y133.194 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X144.425 Y134.794 E.05709
M204 S10000
G1 X150.775 Y134.794 F42000
; LINE_WIDTH: 0.480852
G1 F8220.466
M204 S6000
G1 X150.775 Y133.194 E.05708
; WIPE_START
G1 X150.775 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.112 Y132.387 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.192521
G1 F8476
M204 S6000
G1 X150.112 Y123.613 E.10697
; WIPE_START
G1 F15000
G1 X150.112 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.775 Y122.806 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.480762
G1 F8222.156
M204 S6000
G1 X150.775 Y121.206 E.05707
; OBJECT_ID: 405
; WIPE_START
G1 X150.775 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X143.144 Y122.953 Z4 F42000
G1 X126.565 Y123.273 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8476
M204 S6000
G1 X129.827 Y123.273 E.10821
G1 X129.827 Y132.727 E.31361
G1 X126.173 Y132.727 E.12121
G1 X126.173 Y123.273 E.31361
G1 X126.505 Y123.273 E.01102
M204 S250
G1 X126.565 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8476
M204 S5000
G1 X129.435 Y123.665 E.08819
G1 X129.435 Y132.335 E.2664
G1 X126.565 Y132.335 E.08819
G1 X126.565 Y123.725 E.26456
M204 S10000
G1 X125.766 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8476
M204 S6000
G1 X125.766 Y132.591 E.29609
G1 X125.209 Y132.591 E.01847
G1 X125.209 Y123.409 E.30458
G1 X125.766 Y123.409 E.01847
G1 X125.766 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X125.766 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.878 Y132.035 Z4 F42000
G1 X130.234 Y132.591 Z4
G1 Z3.6
G1 E.8 F1800
G1 F8476
M204 S6000
G1 X130.234 Y123.409 E.30458
G1 X130.791 Y123.409 E.01846
G1 X130.791 Y132.591 E.30458
G1 X130.294 Y132.591 E.01648
; WIPE_START
G1 F8843.478
G1 X130.281 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.24 Y132.998 Z4 F42000
G1 Z3.6
G1 E.8 F1800
G1 F8476
M204 S6000
G1 X124.802 Y132.998 E.01453
G1 X124.802 Y123.002 E.33158
G1 X131.198 Y123.002 E.21216
G1 X131.198 Y132.998 E.33158
G1 X125.3 Y132.998 E.19564
M204 S250
G1 X125.24 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8476
M204 S5000
G1 X130.76 Y133.39 E.16961
G1 X130.76 Y134.61 E.03749
G1 X125.24 Y134.61 E.16961
G1 X125.24 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.24 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.852 Y125.923 Z4 F42000
G1 X125.24 Y122.61 Z4
G1 Z3.6
G1 E.8 F1800
G1 F8476
M204 S5000
G1 X125.24 Y121.39 E.03749
G1 X130.76 Y121.39 E.16961
G1 X130.76 Y122.61 E.03749
G1 X125.3 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.24 Y121.39 E-.46416
G1 X126.019 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.41 Y121.211 Z4 F42000
G1 Z3.6
G1 E.8 F1800
G1 F8476
M204 S5000
G3 X124.593 Y121.01 I.192 J-.008 E.00926
G1 X131.435 Y121.014 E.21024
G3 X131.59 Y121.207 I-.04 J.19 E.00823
G1 X131.589 Y134.816 E.41819
G3 X131.407 Y134.99 I-.193 J-.021 E.0084
G1 X124.611 Y134.99 E.20881
G3 X124.41 Y134.792 I-.008 J-.193 E.00972
G1 X124.41 Y121.271 E.41546
M204 S10000
G1 X124.825 Y121.206 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X124.825 Y122.806 E.05708
; WIPE_START
G1 X124.825 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.487 Y123.613 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8476
M204 S6000
G1 X125.487 Y132.387 E.10701
; WIPE_START
G1 F15000
G1 X125.487 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.825 Y133.194 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X124.825 Y134.794 E.05709
M204 S10000
G1 X131.175 Y134.794 F42000
; LINE_WIDTH: 0.480852
G1 F8220.466
M204 S6000
G1 X131.175 Y133.194 E.05708
; WIPE_START
G1 X131.175 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.512 Y132.387 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.192521
G1 F8476
M204 S6000
G1 X130.512 Y123.613 E.10697
; WIPE_START
G1 F15000
G1 X130.512 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.175 Y122.806 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.480762
G1 F8222.156
M204 S6000
G1 X131.175 Y121.206 E.05707
; OBJECT_ID: 394
; WIPE_START
G1 X131.175 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X123.544 Y122.953 Z4 F42000
G1 X106.965 Y123.273 Z4
M73 P47 R11
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8476
M204 S6000
G1 X110.227 Y123.273 E.10821
G1 X110.227 Y132.727 E.31361
G1 X106.573 Y132.727 E.12121
G1 X106.573 Y123.273 E.31361
G1 X106.905 Y123.273 E.01102
M204 S250
G1 X106.965 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8476
M204 S5000
G1 X109.835 Y123.665 E.08819
G1 X109.835 Y132.335 E.2664
G1 X106.965 Y132.335 E.08819
G1 X106.965 Y123.725 E.26456
M204 S10000
G1 X106.166 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8476
M204 S6000
G1 X106.166 Y132.591 E.29609
G1 X105.609 Y132.591 E.01847
G1 X105.609 Y123.409 E.30458
G1 X106.166 Y123.409 E.01847
G1 X106.166 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X106.166 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.278 Y132.035 Z4 F42000
G1 X110.634 Y132.591 Z4
G1 Z3.6
G1 E.8 F1800
G1 F8476
M204 S6000
G1 X110.634 Y123.409 E.30458
G1 X111.191 Y123.409 E.01846
G1 X111.191 Y132.591 E.30458
G1 X110.694 Y132.591 E.01648
; WIPE_START
G1 F8843.478
G1 X110.681 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.64 Y132.998 Z4 F42000
G1 Z3.6
G1 E.8 F1800
G1 F8476
M204 S6000
G1 X105.202 Y132.998 E.01453
G1 X105.202 Y123.002 E.33158
G1 X111.598 Y123.002 E.21216
G1 X111.598 Y132.998 E.33158
G1 X105.7 Y132.998 E.19564
M204 S250
G1 X105.64 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8476
M204 S5000
G1 X111.16 Y133.39 E.16961
G1 X111.16 Y134.61 E.03749
G1 X105.64 Y134.61 E.16961
G1 X105.64 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X107.64 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.252 Y125.923 Z4 F42000
G1 X105.64 Y122.61 Z4
G1 Z3.6
G1 E.8 F1800
G1 F8476
M204 S5000
G1 X105.64 Y121.39 E.03749
G1 X111.16 Y121.39 E.16961
G1 X111.16 Y122.61 E.03749
G1 X105.7 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.64 Y121.39 E-.46416
G1 X106.419 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.81 Y121.211 Z4 F42000
G1 Z3.6
G1 E.8 F1800
G1 F8476
M204 S5000
G3 X104.993 Y121.01 I.192 J-.008 E.00926
G1 X111.835 Y121.014 E.21024
G3 X111.99 Y121.207 I-.04 J.19 E.00823
G1 X111.989 Y134.816 E.41819
G3 X111.807 Y134.99 I-.193 J-.021 E.0084
G1 X105.011 Y134.99 E.20881
G3 X104.81 Y134.792 I-.008 J-.193 E.00972
G1 X104.81 Y121.271 E.41546
M204 S10000
G1 X105.225 Y121.206 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X105.225 Y122.806 E.05708
; WIPE_START
G1 X105.225 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.887 Y123.613 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8476
M204 S6000
G1 X105.887 Y132.387 E.10701
; WIPE_START
G1 F15000
G1 X105.887 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.225 Y133.194 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X105.225 Y134.794 E.05709
M204 S10000
G1 X111.575 Y134.794 F42000
; LINE_WIDTH: 0.480852
G1 F8220.466
M204 S6000
G1 X111.575 Y133.194 E.05708
; WIPE_START
G1 X111.575 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.912 Y132.387 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.192521
G1 F8476
M204 S6000
G1 X110.912 Y123.613 E.10697
; WIPE_START
G1 F15000
G1 X110.912 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.575 Y122.806 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.480762
G1 F8222.156
M204 S6000
G1 X111.575 Y121.206 E.05707
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8222.156
G1 X111.575 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 19/73
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z4 I-.016 J1.217 P1  F42000
G1 X146.165 Y123.273 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8475
M204 S6000
G1 X149.427 Y123.273 E.10821
G1 X149.427 Y132.727 E.31361
G1 X145.773 Y132.727 E.12121
G1 X145.773 Y123.273 E.31361
G1 X146.105 Y123.273 E.01102
M204 S250
G1 X146.165 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8475
M204 S5000
G1 X149.035 Y123.665 E.08819
G1 X149.035 Y132.335 E.2664
G1 X146.165 Y132.335 E.08819
G1 X146.165 Y123.725 E.26456
M204 S10000
G1 X145.366 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8475
M204 S6000
G1 X145.366 Y132.591 E.29609
G1 X144.809 Y132.591 E.01847
G1 X144.809 Y123.409 E.30458
G1 X145.366 Y123.409 E.01847
G1 X145.366 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X145.366 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.478 Y132.035 Z4.2 F42000
G1 X149.834 Y132.591 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F8475
M204 S6000
G1 X149.834 Y123.409 E.30458
G1 X150.39 Y123.409 E.01845
G1 X150.391 Y132.591 E.30458
G1 X149.894 Y132.591 E.01647
; WIPE_START
G1 F8843.478
G1 X149.881 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.84 Y132.998 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
G1 F8475
M204 S6000
G1 X144.402 Y132.998 E.01453
G1 X144.402 Y123.002 E.33158
G1 X150.798 Y123.002 E.21215
G1 X150.798 Y132.998 E.33158
G1 X144.9 Y132.998 E.19564
M204 S250
G1 X144.84 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8475
M204 S5000
G1 X150.36 Y133.39 E.16961
G1 X150.36 Y134.61 E.03749
G1 X144.84 Y134.61 E.16961
G1 X144.84 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X146.84 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.201 Y126.17 Z4.2 F42000
G1 X150.36 Y122.61 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F8475
M204 S5000
G1 X144.84 Y122.61 E.16961
G1 X144.84 Y121.39 E.03749
G1 X150.36 Y121.39 E.16961
G1 X150.36 Y122.55 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.36 Y122.572 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.01 Y121.211 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
G1 F8475
M204 S5000
G3 X144.191 Y121.01 I.192 J-.008 E.0092
G1 X151.035 Y121.014 E.2103
G3 X151.19 Y121.196 I-.039 J.19 E.00789
G1 X151.189 Y134.816 E.41852
G3 X151.007 Y134.99 I-.194 J-.021 E.00839
G1 X144.159 Y134.985 E.21041
G3 X144.01 Y134.792 I.044 J-.188 E.00811
G1 X144.01 Y121.271 E.41546
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.022 Y121.134 E-.05224
G1 X144.054 Y121.079 E-.02402
G1 X144.119 Y121.029 E-.03134
G1 X144.191 Y121.01 E-.02818
G1 X145.834 Y121.011 E-.62422
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 19 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.2
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer19 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X144.425 Y121.206 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X144.425 Y122.806 E.05708
; WIPE_START
G1 X144.425 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.087 Y123.613 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8475
M204 S6000
G1 X145.087 Y132.387 E.10701
; WIPE_START
G1 F15000
G1 X145.087 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.425 Y133.194 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X144.425 Y134.794 E.05709
M204 S10000
G1 X150.775 Y134.794 F42000
; LINE_WIDTH: 0.480839
G1 F8220.713
M204 S6000
G1 X150.775 Y133.194 E.05708
; WIPE_START
G1 X150.775 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.112 Y132.387 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.192343
G1 F8475
M204 S6000
G1 X150.112 Y123.613 E.10684
; WIPE_START
G1 F15000
G1 X150.112 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.775 Y122.806 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.480419
G1 F8228.605
M204 S6000
G1 X150.775 Y121.206 E.05702
; OBJECT_ID: 405
; WIPE_START
G1 X150.775 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X143.144 Y122.953 Z4.2 F42000
G1 X126.565 Y123.273 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8475
M204 S6000
G1 X129.827 Y123.273 E.10821
G1 X129.827 Y132.727 E.31361
G1 X126.173 Y132.727 E.12121
G1 X126.173 Y123.273 E.31361
G1 X126.505 Y123.273 E.01102
M204 S250
G1 X126.565 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8475
M204 S5000
G1 X129.435 Y123.665 E.08819
G1 X129.435 Y132.335 E.2664
G1 X126.565 Y132.335 E.08819
G1 X126.565 Y123.725 E.26456
M204 S10000
G1 X125.766 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8475
M204 S6000
G1 X125.766 Y132.591 E.29609
G1 X125.209 Y132.591 E.01847
G1 X125.209 Y123.409 E.30458
G1 X125.766 Y123.409 E.01847
G1 X125.766 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X125.766 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.878 Y132.035 Z4.2 F42000
G1 X130.234 Y132.591 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F8475
M204 S6000
G1 X130.234 Y123.409 E.30458
G1 X130.79 Y123.409 E.01845
G1 X130.791 Y132.591 E.30458
G1 X130.294 Y132.591 E.01647
; WIPE_START
G1 F8843.478
G1 X130.281 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.24 Y132.998 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
G1 F8475
M204 S6000
G1 X124.802 Y132.998 E.01453
G1 X124.802 Y123.002 E.33158
G1 X131.198 Y123.002 E.21215
G1 X131.198 Y132.998 E.33158
G1 X125.3 Y132.998 E.19564
M204 S250
G1 X125.24 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8475
M204 S5000
G1 X130.76 Y133.39 E.16961
G1 X130.76 Y134.61 E.03749
G1 X125.24 Y134.61 E.16961
G1 X125.24 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.24 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.852 Y125.923 Z4.2 F42000
G1 X125.24 Y122.61 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F8475
M204 S5000
G1 X125.24 Y121.39 E.03749
G1 X130.76 Y121.39 E.16961
G1 X130.76 Y122.61 E.03749
G1 X125.3 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.24 Y121.39 E-.46416
G1 X126.019 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.41 Y121.211 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
G1 F8475
M204 S5000
G3 X124.591 Y121.01 I.192 J-.008 E.0092
G1 X131.435 Y121.014 E.2103
G3 X131.59 Y121.196 I-.039 J.19 E.00789
G1 X131.589 Y134.816 E.41852
G3 X131.407 Y134.99 I-.194 J-.021 E.00839
G1 X124.559 Y134.985 E.21041
G3 X124.41 Y134.792 I.044 J-.188 E.00811
G1 X124.41 Y121.271 E.41546
M204 S10000
G1 X124.825 Y121.206 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X124.825 Y122.806 E.05708
; WIPE_START
G1 X124.825 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.487 Y123.613 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8475
M204 S6000
G1 X125.487 Y132.387 E.10701
; WIPE_START
G1 F15000
G1 X125.487 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.825 Y133.194 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X124.825 Y134.794 E.05709
M204 S10000
G1 X131.175 Y134.794 F42000
; LINE_WIDTH: 0.480839
G1 F8220.713
M204 S6000
G1 X131.175 Y133.194 E.05708
; WIPE_START
G1 X131.175 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P48 R11
G1 X130.512 Y132.387 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.192343
G1 F8475
M204 S6000
G1 X130.512 Y123.613 E.10684
; WIPE_START
G1 F15000
G1 X130.512 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.175 Y122.806 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.480419
G1 F8228.605
M204 S6000
G1 X131.175 Y121.206 E.05702
; OBJECT_ID: 394
; WIPE_START
G1 X131.175 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X123.544 Y122.953 Z4.2 F42000
G1 X106.965 Y123.273 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8475
M204 S6000
G1 X110.227 Y123.273 E.10821
G1 X110.227 Y132.727 E.31361
G1 X106.573 Y132.727 E.12121
G1 X106.573 Y123.273 E.31361
G1 X106.905 Y123.273 E.01102
M204 S250
G1 X106.965 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8475
M204 S5000
G1 X109.835 Y123.665 E.08819
G1 X109.835 Y132.335 E.2664
G1 X106.965 Y132.335 E.08819
G1 X106.965 Y123.725 E.26456
M204 S10000
G1 X106.166 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8475
M204 S6000
G1 X106.166 Y132.591 E.29609
G1 X105.609 Y132.591 E.01847
G1 X105.609 Y123.409 E.30458
G1 X106.166 Y123.409 E.01847
G1 X106.166 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X106.166 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.278 Y132.035 Z4.2 F42000
G1 X110.634 Y132.591 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F8475
M204 S6000
G1 X110.634 Y123.409 E.30458
G1 X111.19 Y123.409 E.01845
G1 X111.191 Y132.591 E.30458
G1 X110.694 Y132.591 E.01647
; WIPE_START
G1 F8843.478
G1 X110.681 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.64 Y132.998 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
G1 F8475
M204 S6000
G1 X105.202 Y132.998 E.01453
G1 X105.202 Y123.002 E.33158
G1 X111.598 Y123.002 E.21215
G1 X111.598 Y132.998 E.33158
G1 X105.7 Y132.998 E.19564
M204 S250
G1 X105.64 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8475
M204 S5000
G1 X111.16 Y133.39 E.16961
G1 X111.16 Y134.61 E.03749
G1 X105.64 Y134.61 E.16961
G1 X105.64 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X107.64 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.252 Y125.923 Z4.2 F42000
G1 X105.64 Y122.61 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F8475
M204 S5000
G1 X105.64 Y121.39 E.03749
G1 X111.16 Y121.39 E.16961
G1 X111.16 Y122.61 E.03749
G1 X105.7 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.64 Y121.39 E-.46416
G1 X106.419 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.81 Y121.211 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
G1 F8475
M204 S5000
G3 X104.991 Y121.01 I.192 J-.008 E.0092
G1 X111.835 Y121.014 E.2103
G3 X111.99 Y121.196 I-.039 J.19 E.00789
G1 X111.989 Y134.816 E.41852
G3 X111.807 Y134.99 I-.194 J-.021 E.00839
G1 X104.959 Y134.985 E.21041
G3 X104.81 Y134.792 I.044 J-.188 E.00811
G1 X104.81 Y121.271 E.41546
M204 S10000
G1 X105.225 Y121.206 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X105.225 Y122.806 E.05708
; WIPE_START
G1 X105.225 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.887 Y123.613 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8475
M204 S6000
G1 X105.887 Y132.387 E.10701
; WIPE_START
G1 F15000
G1 X105.887 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.225 Y133.194 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X105.225 Y134.794 E.05709
M204 S10000
G1 X111.575 Y134.794 F42000
; LINE_WIDTH: 0.480839
G1 F8220.713
M204 S6000
G1 X111.575 Y133.194 E.05708
; WIPE_START
G1 X111.575 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.912 Y132.387 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.192343
G1 F8475
M204 S6000
G1 X110.912 Y123.613 E.10684
; WIPE_START
G1 F15000
G1 X110.912 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.575 Y122.806 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.480419
G1 F8228.605
M204 S6000
G1 X111.575 Y121.206 E.05702
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8228.605
G1 X111.575 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 20/73
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z4.2 I-.016 J1.217 P1  F42000
G1 X146.165 Y123.273 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8476
M204 S6000
G1 X149.427 Y123.273 E.10821
G1 X149.427 Y132.727 E.31361
G1 X145.773 Y132.727 E.12121
G1 X145.773 Y123.273 E.31361
G1 X146.105 Y123.273 E.01102
M204 S250
G1 X146.165 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8476
M204 S5000
G1 X149.035 Y123.665 E.08819
G1 X149.035 Y132.335 E.2664
G1 X146.165 Y132.335 E.08819
G1 X146.165 Y123.725 E.26456
M204 S10000
G1 X145.366 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8476
M204 S6000
G1 X145.366 Y132.591 E.29609
G1 X144.809 Y132.591 E.01847
G1 X144.809 Y123.409 E.30458
G1 X145.366 Y123.409 E.01847
G1 X145.366 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X145.366 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.478 Y132.035 Z4.4 F42000
G1 X149.834 Y132.591 Z4.4
G1 Z4
G1 E.8 F1800
G1 F8476
M204 S6000
G1 X149.834 Y123.409 E.30458
G1 X150.391 Y123.409 E.01846
G1 X150.391 Y132.591 E.30458
G1 X149.894 Y132.591 E.01648
; WIPE_START
G1 F8843.478
G1 X149.881 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.84 Y132.998 Z4.4 F42000
G1 Z4
G1 E.8 F1800
G1 F8476
M204 S6000
G1 X144.402 Y132.998 E.01453
G1 X144.402 Y123.002 E.33158
G1 X150.798 Y123.002 E.21216
G1 X150.798 Y132.998 E.33158
G1 X144.9 Y132.998 E.19564
M204 S250
G1 X144.84 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8476
M204 S5000
G1 X150.36 Y133.39 E.16961
G1 X150.36 Y134.61 E.03749
G1 X144.84 Y134.61 E.16961
G1 X144.84 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X146.84 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.201 Y126.17 Z4.4 F42000
G1 X150.36 Y122.61 Z4.4
G1 Z4
G1 E.8 F1800
G1 F8476
M204 S5000
G1 X144.84 Y122.61 E.16961
G1 X144.84 Y121.39 E.03749
G1 X150.36 Y121.39 E.16961
G1 X150.36 Y122.55 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.36 Y122.572 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.01 Y121.21 Z4.4 F42000
G1 Z4
G1 E.8 F1800
G1 F8476
M204 S5000
G3 X144.193 Y121.01 I.192 J-.008 E.00926
G1 X151.035 Y121.014 E.21023
G3 X151.19 Y121.206 I-.04 J.19 E.00821
G1 X151.189 Y134.817 E.41821
G3 X151.008 Y134.99 I-.194 J-.022 E.00834
G1 X144.184 Y134.989 E.20969
G3 X144.01 Y134.792 I.023 J-.196 E.00884
G1 X144.01 Y121.27 E.41548
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.022 Y121.134 E-.05216
G1 X144.054 Y121.079 E-.024
G1 X144.121 Y121.028 E-.03195
G1 X144.193 Y121.01 E-.02841
G1 X145.834 Y121.011 E-.62349
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 20 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.4
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer20 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X144.425 Y121.206 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X144.425 Y122.806 E.05708
; WIPE_START
G1 X144.425 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.087 Y123.613 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8476
M204 S6000
G1 X145.087 Y132.387 E.10701
; WIPE_START
G1 F15000
G1 X145.087 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.425 Y133.194 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X144.425 Y134.794 E.05709
M204 S10000
G1 X150.775 Y134.794 F42000
; LINE_WIDTH: 0.480852
G1 F8220.466
M204 S6000
G1 X150.775 Y133.194 E.05708
; WIPE_START
G1 X150.775 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.112 Y132.387 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.192521
G1 F8476
M204 S6000
G1 X150.112 Y123.613 E.10697
; WIPE_START
G1 F15000
G1 X150.112 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.775 Y122.806 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.480762
G1 F8222.156
M204 S6000
G1 X150.775 Y121.206 E.05707
; OBJECT_ID: 405
; WIPE_START
G1 X150.775 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X143.144 Y122.953 Z4.4 F42000
G1 X126.565 Y123.273 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8476
M204 S6000
G1 X129.827 Y123.273 E.10821
G1 X129.827 Y132.727 E.31361
G1 X126.173 Y132.727 E.12121
G1 X126.173 Y123.273 E.31361
G1 X126.505 Y123.273 E.01102
M204 S250
G1 X126.565 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8476
M204 S5000
G1 X129.435 Y123.665 E.08819
G1 X129.435 Y132.335 E.2664
G1 X126.565 Y132.335 E.08819
G1 X126.565 Y123.725 E.26456
M204 S10000
G1 X125.766 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8476
M204 S6000
G1 X125.766 Y132.591 E.29609
G1 X125.209 Y132.591 E.01847
G1 X125.209 Y123.409 E.30458
G1 X125.766 Y123.409 E.01847
G1 X125.766 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X125.766 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.878 Y132.035 Z4.4 F42000
G1 X130.234 Y132.591 Z4.4
G1 Z4
G1 E.8 F1800
G1 F8476
M204 S6000
G1 X130.234 Y123.409 E.30458
G1 X130.791 Y123.409 E.01846
G1 X130.791 Y132.591 E.30458
G1 X130.294 Y132.591 E.01648
; WIPE_START
G1 F8843.478
G1 X130.281 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.24 Y132.998 Z4.4 F42000
G1 Z4
G1 E.8 F1800
G1 F8476
M204 S6000
G1 X124.802 Y132.998 E.01453
G1 X124.802 Y123.002 E.33158
G1 X131.198 Y123.002 E.21216
G1 X131.198 Y132.998 E.33158
G1 X125.3 Y132.998 E.19564
M204 S250
G1 X125.24 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8476
M204 S5000
G1 X130.76 Y133.39 E.16961
G1 X130.76 Y134.61 E.03749
G1 X125.24 Y134.61 E.16961
G1 X125.24 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.24 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.852 Y125.923 Z4.4 F42000
G1 X125.24 Y122.61 Z4.4
G1 Z4
G1 E.8 F1800
G1 F8476
M204 S5000
G1 X125.24 Y121.39 E.03749
G1 X130.76 Y121.39 E.16961
G1 X130.76 Y122.61 E.03749
G1 X125.3 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.24 Y121.39 E-.46416
G1 X126.019 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.41 Y121.21 Z4.4 F42000
G1 Z4
G1 E.8 F1800
G1 F8476
M204 S5000
G3 X124.593 Y121.01 I.192 J-.008 E.00926
G1 X131.435 Y121.014 E.21023
G3 X131.59 Y121.206 I-.04 J.19 E.00821
G1 X131.589 Y134.817 E.41821
G3 X131.408 Y134.99 I-.194 J-.022 E.00834
G1 X124.584 Y134.989 E.20969
G3 X124.41 Y134.792 I.023 J-.196 E.00884
G1 X124.41 Y121.27 E.41548
M204 S10000
G1 X124.825 Y121.206 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
M73 P49 R11
G1 X124.825 Y122.806 E.05708
; WIPE_START
G1 X124.825 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.487 Y123.613 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8476
M204 S6000
G1 X125.487 Y132.387 E.10701
; WIPE_START
G1 F15000
G1 X125.487 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.825 Y133.194 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X124.825 Y134.794 E.05709
M204 S10000
G1 X131.175 Y134.794 F42000
; LINE_WIDTH: 0.480852
G1 F8220.466
M204 S6000
G1 X131.175 Y133.194 E.05708
; WIPE_START
G1 X131.175 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.512 Y132.387 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.192521
G1 F8476
M204 S6000
G1 X130.512 Y123.613 E.10697
; WIPE_START
G1 F15000
G1 X130.512 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.175 Y122.806 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.480762
G1 F8222.156
M204 S6000
G1 X131.175 Y121.206 E.05707
; OBJECT_ID: 394
; WIPE_START
G1 X131.175 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X123.544 Y122.953 Z4.4 F42000
G1 X106.965 Y123.273 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8476
M204 S6000
G1 X110.227 Y123.273 E.10821
G1 X110.227 Y132.727 E.31361
G1 X106.573 Y132.727 E.12121
G1 X106.573 Y123.273 E.31361
G1 X106.905 Y123.273 E.01102
M204 S250
G1 X106.965 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8476
M204 S5000
G1 X109.835 Y123.665 E.08819
G1 X109.835 Y132.335 E.2664
G1 X106.965 Y132.335 E.08819
G1 X106.965 Y123.725 E.26456
M204 S10000
G1 X106.166 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8476
M204 S6000
G1 X106.166 Y132.591 E.29609
G1 X105.609 Y132.591 E.01847
G1 X105.609 Y123.409 E.30458
G1 X106.166 Y123.409 E.01847
G1 X106.166 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X106.166 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.278 Y132.035 Z4.4 F42000
G1 X110.634 Y132.591 Z4.4
G1 Z4
G1 E.8 F1800
G1 F8476
M204 S6000
G1 X110.634 Y123.409 E.30458
G1 X111.191 Y123.409 E.01846
G1 X111.191 Y132.591 E.30458
G1 X110.694 Y132.591 E.01648
; WIPE_START
G1 F8843.478
G1 X110.681 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.64 Y132.998 Z4.4 F42000
G1 Z4
G1 E.8 F1800
G1 F8476
M204 S6000
G1 X105.202 Y132.998 E.01453
G1 X105.202 Y123.002 E.33158
G1 X111.598 Y123.002 E.21216
G1 X111.598 Y132.998 E.33158
G1 X105.7 Y132.998 E.19564
M204 S250
G1 X105.64 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8476
M204 S5000
G1 X111.16 Y133.39 E.16961
G1 X111.16 Y134.61 E.03749
G1 X105.64 Y134.61 E.16961
G1 X105.64 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X107.64 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.252 Y125.923 Z4.4 F42000
G1 X105.64 Y122.61 Z4.4
G1 Z4
G1 E.8 F1800
G1 F8476
M204 S5000
G1 X105.64 Y121.39 E.03749
G1 X111.16 Y121.39 E.16961
G1 X111.16 Y122.61 E.03749
G1 X105.7 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.64 Y121.39 E-.46416
G1 X106.419 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.81 Y121.21 Z4.4 F42000
G1 Z4
G1 E.8 F1800
G1 F8476
M204 S5000
G3 X104.993 Y121.01 I.192 J-.008 E.00926
G1 X111.835 Y121.014 E.21023
G3 X111.99 Y121.206 I-.04 J.19 E.00821
G1 X111.989 Y134.817 E.41821
G3 X111.808 Y134.99 I-.194 J-.022 E.00834
G1 X104.984 Y134.989 E.20969
G3 X104.81 Y134.792 I.023 J-.196 E.00884
G1 X104.81 Y121.27 E.41548
M204 S10000
G1 X105.225 Y121.206 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X105.225 Y122.806 E.05708
; WIPE_START
G1 X105.225 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.887 Y123.613 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8476
M204 S6000
G1 X105.887 Y132.387 E.10701
; WIPE_START
G1 F15000
G1 X105.887 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.225 Y133.194 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X105.225 Y134.794 E.05709
M204 S10000
G1 X111.575 Y134.794 F42000
; LINE_WIDTH: 0.480852
G1 F8220.466
M204 S6000
G1 X111.575 Y133.194 E.05708
; WIPE_START
G1 X111.575 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.912 Y132.387 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.192521
G1 F8476
M204 S6000
G1 X110.912 Y123.613 E.10697
; WIPE_START
G1 F15000
G1 X110.912 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.575 Y122.806 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.480762
G1 F8222.156
M204 S6000
G1 X111.575 Y121.206 E.05707
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8222.156
G1 X111.575 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 21/73
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z4.4 I-.016 J1.217 P1  F42000
G1 X146.165 Y123.273 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8476
M204 S6000
G1 X149.427 Y123.273 E.10821
G1 X149.427 Y132.727 E.31361
G1 X145.773 Y132.727 E.12121
G1 X145.773 Y123.273 E.31361
G1 X146.105 Y123.273 E.01102
M204 S250
G1 X146.165 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8476
M204 S5000
G1 X149.035 Y123.665 E.08819
G1 X149.035 Y132.335 E.2664
G1 X146.165 Y132.335 E.08819
G1 X146.165 Y123.725 E.26456
M204 S10000
G1 X145.366 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8476
M204 S6000
G1 X145.366 Y132.591 E.29609
G1 X144.809 Y132.591 E.01847
G1 X144.809 Y123.409 E.30458
G1 X145.366 Y123.409 E.01847
G1 X145.366 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X145.366 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.478 Y132.035 Z4.6 F42000
G1 X149.834 Y132.591 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F8476
M204 S6000
G1 X149.834 Y123.409 E.30458
G1 X150.39 Y123.409 E.01845
G1 X150.391 Y132.591 E.30458
G1 X149.894 Y132.591 E.01647
; WIPE_START
G1 F8843.478
G1 X149.881 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.84 Y132.998 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F8476
M204 S6000
G1 X144.402 Y132.998 E.01453
G1 X144.402 Y123.002 E.33158
G1 X150.798 Y123.002 E.21215
G1 X150.798 Y132.998 E.33158
G1 X144.9 Y132.998 E.19564
M204 S250
G1 X144.84 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8476
M204 S5000
G1 X150.36 Y133.39 E.16961
G1 X150.36 Y134.61 E.03749
G1 X144.84 Y134.61 E.16961
G1 X144.84 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X146.84 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.201 Y126.17 Z4.6 F42000
G1 X150.36 Y122.61 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F8476
M204 S5000
G1 X144.84 Y122.61 E.16961
G1 X144.84 Y121.39 E.03749
G1 X150.36 Y121.39 E.16961
G1 X150.36 Y122.55 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.36 Y122.572 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.015 Y121.159 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F8476
M204 S5000
G3 X144.193 Y121.01 I.187 J.044 E.00764
G1 X151.035 Y121.014 E.21025
G3 X151.19 Y121.196 I-.04 J.19 E.00789
G1 X151.189 Y134.817 E.41853
G3 X151.009 Y134.99 I-.196 J-.024 E.00832
G1 X144.211 Y134.99 E.20886
G3 X144.01 Y134.795 I-.008 J-.193 E.00965
G1 X144.015 Y121.219 E.41714
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.072 Y121.06 E-.06418
G1 X144.193 Y121.01 E-.04953
G1 X145.894 Y121.011 E-.64629
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 21 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.6
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer21 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X144.425 Y121.206 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X144.425 Y122.806 E.05708
; WIPE_START
G1 X144.425 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.087 Y123.613 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8476
M204 S6000
G1 X145.087 Y132.387 E.10701
; WIPE_START
G1 F15000
G1 X145.087 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.425 Y133.194 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X144.425 Y134.794 E.05709
M204 S10000
G1 X150.775 Y134.794 F42000
; LINE_WIDTH: 0.480839
G1 F8220.713
M204 S6000
G1 X150.775 Y133.194 E.05708
; WIPE_START
G1 X150.775 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.112 Y132.387 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.192343
G1 F8476
M204 S6000
G1 X150.112 Y123.613 E.10684
; WIPE_START
G1 F15000
G1 X150.112 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.775 Y122.806 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.480419
G1 F8228.605
M204 S6000
G1 X150.775 Y121.206 E.05702
; OBJECT_ID: 405
; WIPE_START
G1 X150.775 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X143.144 Y122.953 Z4.6 F42000
G1 X126.565 Y123.273 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8476
M204 S6000
G1 X129.827 Y123.273 E.10821
G1 X129.827 Y132.727 E.31361
G1 X126.173 Y132.727 E.12121
G1 X126.173 Y123.273 E.31361
G1 X126.505 Y123.273 E.01102
M204 S250
G1 X126.565 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8476
M204 S5000
G1 X129.435 Y123.665 E.08819
G1 X129.435 Y132.335 E.2664
G1 X126.565 Y132.335 E.08819
G1 X126.565 Y123.725 E.26456
M204 S10000
G1 X125.766 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8476
M204 S6000
G1 X125.766 Y132.591 E.29609
G1 X125.209 Y132.591 E.01847
G1 X125.209 Y123.409 E.30458
G1 X125.766 Y123.409 E.01847
G1 X125.766 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X125.766 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.878 Y132.035 Z4.6 F42000
G1 X130.234 Y132.591 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F8476
M204 S6000
G1 X130.234 Y123.409 E.30458
G1 X130.79 Y123.409 E.01845
G1 X130.791 Y132.591 E.30458
G1 X130.294 Y132.591 E.01647
; WIPE_START
G1 F8843.478
G1 X130.281 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.24 Y132.998 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F8476
M204 S6000
G1 X124.802 Y132.998 E.01453
G1 X124.802 Y123.002 E.33158
G1 X131.198 Y123.002 E.21215
G1 X131.198 Y132.998 E.33158
G1 X125.3 Y132.998 E.19564
M204 S250
G1 X125.24 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8476
M204 S5000
G1 X130.76 Y133.39 E.16961
G1 X130.76 Y134.61 E.03749
G1 X125.24 Y134.61 E.16961
G1 X125.24 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.24 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.852 Y125.923 Z4.6 F42000
G1 X125.24 Y122.61 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F8476
M204 S5000
G1 X125.24 Y121.39 E.03749
G1 X130.76 Y121.39 E.16961
G1 X130.76 Y122.61 E.03749
G1 X125.3 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.24 Y121.39 E-.46416
M73 P49 R10
G1 X126.019 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.415 Y121.159 Z4.6 F42000
M73 P50 R10
G1 Z4.2
G1 E.8 F1800
G1 F8476
M204 S5000
G3 X124.593 Y121.01 I.187 J.044 E.00764
G1 X131.435 Y121.014 E.21025
G3 X131.59 Y121.196 I-.04 J.19 E.00789
G1 X131.589 Y134.817 E.41853
G3 X131.409 Y134.99 I-.196 J-.024 E.00832
G1 X124.611 Y134.99 E.20886
G3 X124.41 Y134.795 I-.008 J-.193 E.00965
G1 X124.415 Y121.219 E.41714
M204 S10000
G1 X124.825 Y121.206 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X124.825 Y122.806 E.05708
; WIPE_START
G1 X124.825 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.487 Y123.613 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8476
M204 S6000
G1 X125.487 Y132.387 E.10701
; WIPE_START
G1 F15000
G1 X125.487 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.825 Y133.194 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X124.825 Y134.794 E.05709
M204 S10000
G1 X131.175 Y134.794 F42000
; LINE_WIDTH: 0.480839
G1 F8220.713
M204 S6000
G1 X131.175 Y133.194 E.05708
; WIPE_START
G1 X131.175 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.512 Y132.387 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.192343
G1 F8476
M204 S6000
G1 X130.512 Y123.613 E.10684
; WIPE_START
G1 F15000
G1 X130.512 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.175 Y122.806 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.480419
G1 F8228.605
M204 S6000
G1 X131.175 Y121.206 E.05702
; OBJECT_ID: 394
; WIPE_START
G1 X131.175 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X123.544 Y122.953 Z4.6 F42000
G1 X106.965 Y123.273 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8476
M204 S6000
G1 X110.227 Y123.273 E.10821
G1 X110.227 Y132.727 E.31361
G1 X106.573 Y132.727 E.12121
G1 X106.573 Y123.273 E.31361
G1 X106.905 Y123.273 E.01102
M204 S250
G1 X106.965 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8476
M204 S5000
G1 X109.835 Y123.665 E.08819
G1 X109.835 Y132.335 E.2664
G1 X106.965 Y132.335 E.08819
G1 X106.965 Y123.725 E.26456
M204 S10000
G1 X106.166 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8476
M204 S6000
G1 X106.166 Y132.591 E.29609
G1 X105.609 Y132.591 E.01847
G1 X105.609 Y123.409 E.30458
G1 X106.166 Y123.409 E.01847
G1 X106.166 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X106.166 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.278 Y132.035 Z4.6 F42000
G1 X110.634 Y132.591 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F8476
M204 S6000
G1 X110.634 Y123.409 E.30458
G1 X111.19 Y123.409 E.01845
G1 X111.191 Y132.591 E.30458
G1 X110.694 Y132.591 E.01647
; WIPE_START
G1 F8843.478
G1 X110.681 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.64 Y132.998 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F8476
M204 S6000
G1 X105.202 Y132.998 E.01453
G1 X105.202 Y123.002 E.33158
G1 X111.598 Y123.002 E.21215
G1 X111.598 Y132.998 E.33158
G1 X105.7 Y132.998 E.19564
M204 S250
G1 X105.64 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8476
M204 S5000
G1 X111.16 Y133.39 E.16961
G1 X111.16 Y134.61 E.03749
G1 X105.64 Y134.61 E.16961
G1 X105.64 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X107.64 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.252 Y125.923 Z4.6 F42000
G1 X105.64 Y122.61 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F8476
M204 S5000
G1 X105.64 Y121.39 E.03749
G1 X111.16 Y121.39 E.16961
G1 X111.16 Y122.61 E.03749
G1 X105.7 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.64 Y121.39 E-.46416
G1 X106.419 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.815 Y121.159 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F8476
M204 S5000
G3 X104.993 Y121.01 I.187 J.044 E.00764
G1 X111.835 Y121.014 E.21025
G3 X111.99 Y121.196 I-.04 J.19 E.00789
G1 X111.989 Y134.817 E.41853
G3 X111.809 Y134.99 I-.196 J-.024 E.00832
G1 X105.011 Y134.99 E.20886
G3 X104.81 Y134.795 I-.008 J-.193 E.00965
G1 X104.815 Y121.219 E.41714
M204 S10000
G1 X105.225 Y121.206 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X105.225 Y122.806 E.05708
; WIPE_START
G1 X105.225 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.887 Y123.613 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8476
M204 S6000
G1 X105.887 Y132.387 E.10701
; WIPE_START
G1 F15000
G1 X105.887 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.225 Y133.194 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X105.225 Y134.794 E.05709
M204 S10000
G1 X111.575 Y134.794 F42000
; LINE_WIDTH: 0.480839
G1 F8220.713
M204 S6000
G1 X111.575 Y133.194 E.05708
; WIPE_START
G1 X111.575 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.912 Y132.387 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.192343
G1 F8476
M204 S6000
G1 X110.912 Y123.613 E.10684
; WIPE_START
G1 F15000
G1 X110.912 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.575 Y122.806 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.480419
G1 F8228.605
M204 S6000
G1 X111.575 Y121.206 E.05702
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8228.605
G1 X111.575 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 22/73
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z4.6 I-.016 J1.217 P1  F42000
G1 X146.165 Y123.273 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8460
M204 S6000
G1 X149.427 Y123.273 E.10821
G1 X149.427 Y132.727 E.31361
G1 X145.773 Y132.727 E.12121
G1 X145.773 Y123.273 E.31361
G1 X146.105 Y123.273 E.01102
M204 S250
G1 X146.165 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8460
M204 S5000
G1 X149.035 Y123.665 E.08819
G1 X149.035 Y132.335 E.2664
G1 X146.165 Y132.335 E.08819
G1 X146.165 Y123.725 E.26456
M204 S10000
G1 X145.366 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8460
M204 S6000
G1 X145.366 Y132.591 E.29609
G1 X144.809 Y132.591 E.01847
G1 X144.809 Y123.409 E.30458
G1 X145.366 Y123.409 E.01847
G1 X145.366 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X145.366 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.478 Y132.035 Z4.8 F42000
G1 X149.834 Y132.591 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F8460
M204 S6000
G1 X149.834 Y123.409 E.30458
G1 X150.39 Y123.409 E.01845
G1 X150.391 Y132.591 E.30458
G1 X149.894 Y132.591 E.01647
; WIPE_START
G1 F8843.478
G1 X149.881 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.84 Y132.998 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F8460
M204 S6000
G1 X144.402 Y132.998 E.01453
G1 X144.402 Y123.002 E.33158
G1 X150.798 Y123.002 E.21215
G1 X150.798 Y132.998 E.33158
G1 X144.9 Y132.998 E.19564
M204 S250
G1 X144.84 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8460
M204 S5000
G1 X150.36 Y133.39 E.16961
G1 X150.36 Y134.61 E.03749
G1 X144.84 Y134.61 E.16961
G1 X144.84 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X146.84 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.201 Y126.17 Z4.8 F42000
G1 X150.36 Y122.61 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F8460
M204 S5000
G1 X144.84 Y122.61 E.16961
G1 X144.84 Y121.39 E.03749
G1 X150.36 Y121.39 E.16961
G1 X150.36 Y122.55 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.36 Y122.572 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.022 Y121.134 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F8460
M204 S5000
G3 X144.193 Y121.01 I.18 J.069 E.00686
G1 X151.035 Y121.014 E.21024
G3 X151.19 Y121.196 I-.04 J.19 E.00789
G1 X151.19 Y134.789 E.41769
G3 X151.009 Y134.99 I-.191 J.009 E.00919
G1 X144.211 Y134.99 E.20888
G3 X144.01 Y134.792 I-.008 J-.193 E.00973
G1 X144.01 Y121.211 E.4173
G3 X144.01 Y121.193 I.192 J-.008 E.00055
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.052 Y121.082 E-.04523
G1 X144.121 Y121.028 E-.0332
G1 X144.193 Y121.01 E-.02843
G1 X145.912 Y121.011 E-.65314
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 22 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.8
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer22 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X144.425 Y121.206 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X144.425 Y122.806 E.05708
; WIPE_START
G1 X144.425 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.087 Y123.613 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8460
M204 S6000
G1 X145.087 Y132.387 E.10701
; WIPE_START
G1 F15000
G1 X145.087 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.425 Y133.194 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X144.425 Y134.794 E.05709
M204 S10000
G1 X150.775 Y134.794 F42000
; LINE_WIDTH: 0.480839
G1 F8220.713
M204 S6000
G1 X150.775 Y133.194 E.05708
; WIPE_START
G1 X150.775 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.112 Y132.387 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.192343
G1 F8460
M204 S6000
G1 X150.112 Y123.613 E.10684
; WIPE_START
G1 F15000
G1 X150.112 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.775 Y122.806 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.480419
G1 F8228.605
M204 S6000
G1 X150.775 Y121.206 E.05702
; OBJECT_ID: 405
; WIPE_START
G1 X150.775 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X143.144 Y122.953 Z4.8 F42000
G1 X126.565 Y123.273 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8460
M204 S6000
G1 X129.827 Y123.273 E.10821
G1 X129.827 Y132.727 E.31361
G1 X126.173 Y132.727 E.12121
G1 X126.173 Y123.273 E.31361
G1 X126.505 Y123.273 E.01102
M204 S250
G1 X126.565 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8460
M204 S5000
G1 X129.435 Y123.665 E.08819
G1 X129.435 Y132.335 E.2664
G1 X126.565 Y132.335 E.08819
G1 X126.565 Y123.725 E.26456
M204 S10000
G1 X125.766 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8460
M204 S6000
G1 X125.766 Y132.591 E.29609
G1 X125.209 Y132.591 E.01847
G1 X125.209 Y123.409 E.30458
G1 X125.766 Y123.409 E.01847
G1 X125.766 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X125.766 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.878 Y132.035 Z4.8 F42000
G1 X130.234 Y132.591 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F8460
M204 S6000
G1 X130.234 Y123.409 E.30458
G1 X130.79 Y123.409 E.01845
G1 X130.791 Y132.591 E.30458
G1 X130.294 Y132.591 E.01647
; WIPE_START
G1 F8843.478
G1 X130.281 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.24 Y132.998 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F8460
M204 S6000
G1 X124.802 Y132.998 E.01453
G1 X124.802 Y123.002 E.33158
G1 X131.198 Y123.002 E.21215
G1 X131.198 Y132.998 E.33158
G1 X125.3 Y132.998 E.19564
M204 S250
M73 P51 R10
G1 X125.24 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8460
M204 S5000
G1 X130.76 Y133.39 E.16961
G1 X130.76 Y134.61 E.03749
G1 X125.24 Y134.61 E.16961
G1 X125.24 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.24 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.852 Y125.923 Z4.8 F42000
G1 X125.24 Y122.61 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F8460
M204 S5000
G1 X125.24 Y121.39 E.03749
G1 X130.76 Y121.39 E.16961
G1 X130.76 Y122.61 E.03749
G1 X125.3 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.24 Y121.39 E-.46416
G1 X126.019 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.422 Y121.134 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F8460
M204 S5000
G3 X124.593 Y121.01 I.18 J.069 E.00686
G1 X131.435 Y121.014 E.21024
G3 X131.59 Y121.196 I-.04 J.19 E.00789
G1 X131.59 Y134.789 E.41769
G3 X131.409 Y134.99 I-.191 J.009 E.00919
G1 X124.611 Y134.99 E.20888
G3 X124.41 Y134.792 I-.008 J-.193 E.00973
G1 X124.41 Y121.211 E.4173
G3 X124.41 Y121.193 I.192 J-.008 E.00055
M204 S10000
G1 X124.825 Y121.206 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X124.825 Y122.806 E.05708
; WIPE_START
G1 X124.825 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.487 Y123.613 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8460
M204 S6000
G1 X125.487 Y132.387 E.10701
; WIPE_START
G1 F15000
G1 X125.487 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.825 Y133.194 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X124.825 Y134.794 E.05709
M204 S10000
G1 X131.175 Y134.794 F42000
; LINE_WIDTH: 0.480839
G1 F8220.713
M204 S6000
G1 X131.175 Y133.194 E.05708
; WIPE_START
G1 X131.175 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.512 Y132.387 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.192343
G1 F8460
M204 S6000
G1 X130.512 Y123.613 E.10684
; WIPE_START
G1 F15000
G1 X130.512 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.175 Y122.806 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.480419
G1 F8228.605
M204 S6000
G1 X131.175 Y121.206 E.05702
; OBJECT_ID: 394
; WIPE_START
G1 X131.175 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X123.544 Y122.953 Z4.8 F42000
G1 X106.965 Y123.273 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8460
M204 S6000
G1 X110.227 Y123.273 E.10821
G1 X110.227 Y132.727 E.31361
G1 X106.573 Y132.727 E.12121
G1 X106.573 Y123.273 E.31361
G1 X106.905 Y123.273 E.01102
M204 S250
G1 X106.965 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8460
M204 S5000
G1 X109.835 Y123.665 E.08819
G1 X109.835 Y132.335 E.2664
G1 X106.965 Y132.335 E.08819
G1 X106.965 Y123.725 E.26456
M204 S10000
G1 X106.166 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8460
M204 S6000
G1 X106.166 Y132.591 E.29609
G1 X105.609 Y132.591 E.01847
G1 X105.609 Y123.409 E.30458
G1 X106.166 Y123.409 E.01847
G1 X106.166 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X106.166 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.278 Y132.035 Z4.8 F42000
G1 X110.634 Y132.591 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F8460
M204 S6000
G1 X110.634 Y123.409 E.30458
G1 X111.19 Y123.409 E.01845
G1 X111.191 Y132.591 E.30458
G1 X110.694 Y132.591 E.01647
; WIPE_START
G1 F8843.478
G1 X110.681 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.64 Y132.998 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F8460
M204 S6000
G1 X105.202 Y132.998 E.01453
G1 X105.202 Y123.002 E.33158
G1 X111.598 Y123.002 E.21215
G1 X111.598 Y132.998 E.33158
G1 X105.7 Y132.998 E.19564
M204 S250
G1 X105.64 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8460
M204 S5000
G1 X111.16 Y133.39 E.16961
G1 X111.16 Y134.61 E.03749
G1 X105.64 Y134.61 E.16961
G1 X105.64 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X107.64 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.252 Y125.923 Z4.8 F42000
G1 X105.64 Y122.61 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F8460
M204 S5000
G1 X105.64 Y121.39 E.03749
G1 X111.16 Y121.39 E.16961
G1 X111.16 Y122.61 E.03749
G1 X105.7 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.64 Y121.39 E-.46416
G1 X106.419 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.822 Y121.134 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F8460
M204 S5000
G3 X104.993 Y121.01 I.18 J.069 E.00686
G1 X111.835 Y121.014 E.21024
G3 X111.99 Y121.196 I-.04 J.19 E.00789
G1 X111.99 Y134.789 E.41769
G3 X111.809 Y134.99 I-.191 J.009 E.00919
G1 X105.011 Y134.99 E.20888
G3 X104.81 Y134.792 I-.008 J-.193 E.00973
G1 X104.81 Y121.211 E.4173
G3 X104.81 Y121.193 I.192 J-.008 E.00055
M204 S10000
G1 X105.225 Y121.206 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X105.225 Y122.806 E.05708
; WIPE_START
G1 X105.225 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.887 Y123.613 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8460
M204 S6000
G1 X105.887 Y132.387 E.10701
; WIPE_START
G1 F15000
G1 X105.887 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.225 Y133.194 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X105.225 Y134.794 E.05709
M204 S10000
G1 X111.575 Y134.794 F42000
; LINE_WIDTH: 0.480839
G1 F8220.713
M204 S6000
G1 X111.575 Y133.194 E.05708
; WIPE_START
G1 X111.575 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.912 Y132.387 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.192343
G1 F8460
M204 S6000
G1 X110.912 Y123.613 E.10684
; WIPE_START
G1 F15000
G1 X110.912 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.575 Y122.806 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.480419
G1 F8228.605
M204 S6000
G1 X111.575 Y121.206 E.05702
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8228.605
G1 X111.575 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 23/73
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z4.8 I-.016 J1.217 P1  F42000
G1 X146.165 Y123.273 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8460
M204 S6000
G1 X149.427 Y123.273 E.10821
G1 X149.427 Y132.727 E.31361
G1 X145.773 Y132.727 E.12121
G1 X145.773 Y123.273 E.31361
G1 X146.105 Y123.273 E.01102
M204 S250
G1 X146.165 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8460
M204 S5000
G1 X149.035 Y123.665 E.08819
G1 X149.035 Y132.335 E.2664
G1 X146.165 Y132.335 E.08819
G1 X146.165 Y123.725 E.26456
M204 S10000
G1 X145.366 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8460
M204 S6000
G1 X145.366 Y132.591 E.29609
G1 X144.809 Y132.591 E.01847
G1 X144.809 Y123.409 E.30458
G1 X145.366 Y123.409 E.01847
G1 X145.366 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X145.366 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.478 Y132.035 Z5 F42000
G1 X149.834 Y132.591 Z5
G1 Z4.6
G1 E.8 F1800
G1 F8460
M204 S6000
G1 X149.834 Y123.409 E.30458
G1 X150.39 Y123.409 E.01845
G1 X150.391 Y132.591 E.30458
G1 X149.894 Y132.591 E.01647
; WIPE_START
G1 F8843.478
G1 X149.881 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.84 Y132.998 Z5 F42000
G1 Z4.6
G1 E.8 F1800
G1 F8460
M204 S6000
G1 X144.402 Y132.998 E.01453
G1 X144.402 Y123.002 E.33158
G1 X150.798 Y123.002 E.21215
G1 X150.798 Y132.998 E.33158
G1 X144.9 Y132.998 E.19564
M204 S250
G1 X144.84 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8460
M204 S5000
G1 X150.36 Y133.39 E.16961
G1 X150.36 Y134.61 E.03749
G1 X144.84 Y134.61 E.16961
G1 X144.84 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X146.84 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.201 Y126.17 Z5 F42000
G1 X150.36 Y122.61 Z5
G1 Z4.6
G1 E.8 F1800
G1 F8460
M204 S5000
G1 X144.84 Y122.61 E.16961
G1 X144.84 Y121.39 E.03749
G1 X150.36 Y121.39 E.16961
G1 X150.36 Y122.55 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.36 Y122.572 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.031 Y121.117 Z5 F42000
G1 Z4.6
G1 E.8 F1800
G1 F8460
M204 S5000
G3 X144.191 Y121.01 I.174 J.087 E.00619
G1 X151.035 Y121.014 E.21031
G3 X151.19 Y121.196 I-.04 J.19 E.00789
G1 X151.189 Y134.817 E.41852
G3 X151.008 Y134.99 I-.193 J-.021 E.00835
G1 X144.211 Y134.99 E.20886
G3 X144.01 Y134.792 I-.008 J-.193 E.00973
G1 X144.012 Y121.18 E.41826
G3 X144.012 Y121.174 I.193 J.024 E.00017
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.082 Y121.052 E-.05352
G1 X144.191 Y121.01 E-.04436
G1 X145.933 Y121.011 E-.66212
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 23 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer23 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X144.425 Y121.206 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X144.425 Y122.806 E.05708
; WIPE_START
G1 X144.425 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.087 Y123.613 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8460
M204 S6000
G1 X145.087 Y132.387 E.10701
; WIPE_START
G1 F15000
G1 X145.087 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.425 Y133.194 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X144.425 Y134.794 E.05709
M204 S10000
G1 X150.775 Y134.794 F42000
; LINE_WIDTH: 0.480839
G1 F8220.713
M204 S6000
G1 X150.775 Y133.194 E.05708
; WIPE_START
G1 X150.775 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.112 Y132.387 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.192343
G1 F8460
M204 S6000
G1 X150.112 Y123.613 E.10684
; WIPE_START
G1 F15000
G1 X150.112 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.775 Y122.806 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.480419
G1 F8228.605
M204 S6000
G1 X150.775 Y121.206 E.05702
; OBJECT_ID: 405
; WIPE_START
G1 X150.775 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X143.144 Y122.953 Z5 F42000
G1 X126.565 Y123.273 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8460
M204 S6000
G1 X129.827 Y123.273 E.10821
G1 X129.827 Y132.727 E.31361
G1 X126.173 Y132.727 E.12121
G1 X126.173 Y123.273 E.31361
G1 X126.505 Y123.273 E.01102
M204 S250
G1 X126.565 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8460
M204 S5000
G1 X129.435 Y123.665 E.08819
G1 X129.435 Y132.335 E.2664
G1 X126.565 Y132.335 E.08819
G1 X126.565 Y123.725 E.26456
M204 S10000
G1 X125.766 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8460
M204 S6000
G1 X125.766 Y132.591 E.29609
G1 X125.209 Y132.591 E.01847
G1 X125.209 Y123.409 E.30458
G1 X125.766 Y123.409 E.01847
G1 X125.766 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X125.766 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.878 Y132.035 Z5 F42000
G1 X130.234 Y132.591 Z5
G1 Z4.6
M73 P52 R10
G1 E.8 F1800
G1 F8460
M204 S6000
G1 X130.234 Y123.409 E.30458
G1 X130.79 Y123.409 E.01845
G1 X130.791 Y132.591 E.30458
G1 X130.294 Y132.591 E.01647
; WIPE_START
G1 F8843.478
G1 X130.281 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.24 Y132.998 Z5 F42000
G1 Z4.6
G1 E.8 F1800
G1 F8460
M204 S6000
G1 X124.802 Y132.998 E.01453
G1 X124.802 Y123.002 E.33158
G1 X131.198 Y123.002 E.21215
G1 X131.198 Y132.998 E.33158
G1 X125.3 Y132.998 E.19564
M204 S250
G1 X125.24 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8460
M204 S5000
G1 X130.76 Y133.39 E.16961
G1 X130.76 Y134.61 E.03749
G1 X125.24 Y134.61 E.16961
G1 X125.24 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.24 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.852 Y125.923 Z5 F42000
G1 X125.24 Y122.61 Z5
G1 Z4.6
G1 E.8 F1800
G1 F8460
M204 S5000
G1 X125.24 Y121.39 E.03749
G1 X130.76 Y121.39 E.16961
G1 X130.76 Y122.61 E.03749
G1 X125.3 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.24 Y121.39 E-.46416
G1 X126.019 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.431 Y121.117 Z5 F42000
G1 Z4.6
G1 E.8 F1800
G1 F8460
M204 S5000
G3 X124.591 Y121.01 I.174 J.087 E.00619
G1 X131.435 Y121.014 E.21031
G3 X131.59 Y121.196 I-.04 J.19 E.00789
G1 X131.589 Y134.817 E.41852
G3 X131.408 Y134.99 I-.193 J-.021 E.00835
G1 X124.611 Y134.99 E.20886
G3 X124.41 Y134.792 I-.008 J-.193 E.00973
G1 X124.412 Y121.18 E.41826
G3 X124.412 Y121.174 I.193 J.024 E.00017
M204 S10000
G1 X124.825 Y121.206 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X124.825 Y122.806 E.05708
; WIPE_START
G1 X124.825 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.487 Y123.613 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8460
M204 S6000
G1 X125.487 Y132.387 E.10701
; WIPE_START
G1 F15000
G1 X125.487 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.825 Y133.194 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X124.825 Y134.794 E.05709
M204 S10000
G1 X131.175 Y134.794 F42000
; LINE_WIDTH: 0.480839
G1 F8220.713
M204 S6000
G1 X131.175 Y133.194 E.05708
; WIPE_START
G1 X131.175 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.512 Y132.387 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.192343
G1 F8460
M204 S6000
G1 X130.512 Y123.613 E.10684
; WIPE_START
G1 F15000
G1 X130.512 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.175 Y122.806 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.480419
G1 F8228.605
M204 S6000
G1 X131.175 Y121.206 E.05702
; OBJECT_ID: 394
; WIPE_START
G1 X131.175 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X123.544 Y122.953 Z5 F42000
G1 X106.965 Y123.273 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8460
M204 S6000
G1 X110.227 Y123.273 E.10821
G1 X110.227 Y132.727 E.31361
G1 X106.573 Y132.727 E.12121
G1 X106.573 Y123.273 E.31361
G1 X106.905 Y123.273 E.01102
M204 S250
G1 X106.965 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8460
M204 S5000
G1 X109.835 Y123.665 E.08819
G1 X109.835 Y132.335 E.2664
G1 X106.965 Y132.335 E.08819
G1 X106.965 Y123.725 E.26456
M204 S10000
G1 X106.166 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8460
M204 S6000
G1 X106.166 Y132.591 E.29609
G1 X105.609 Y132.591 E.01847
G1 X105.609 Y123.409 E.30458
G1 X106.166 Y123.409 E.01847
G1 X106.166 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X106.166 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.278 Y132.035 Z5 F42000
G1 X110.634 Y132.591 Z5
G1 Z4.6
G1 E.8 F1800
G1 F8460
M204 S6000
G1 X110.634 Y123.409 E.30458
G1 X111.19 Y123.409 E.01845
G1 X111.191 Y132.591 E.30458
G1 X110.694 Y132.591 E.01647
; WIPE_START
G1 F8843.478
G1 X110.681 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.64 Y132.998 Z5 F42000
G1 Z4.6
G1 E.8 F1800
G1 F8460
M204 S6000
G1 X105.202 Y132.998 E.01453
G1 X105.202 Y123.002 E.33158
G1 X111.598 Y123.002 E.21215
G1 X111.598 Y132.998 E.33158
G1 X105.7 Y132.998 E.19564
M204 S250
G1 X105.64 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8460
M204 S5000
G1 X111.16 Y133.39 E.16961
G1 X111.16 Y134.61 E.03749
G1 X105.64 Y134.61 E.16961
G1 X105.64 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X107.64 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.252 Y125.923 Z5 F42000
G1 X105.64 Y122.61 Z5
G1 Z4.6
G1 E.8 F1800
G1 F8460
M204 S5000
G1 X105.64 Y121.39 E.03749
G1 X111.16 Y121.39 E.16961
G1 X111.16 Y122.61 E.03749
G1 X105.7 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.64 Y121.39 E-.46416
G1 X106.419 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.831 Y121.117 Z5 F42000
G1 Z4.6
G1 E.8 F1800
G1 F8460
M204 S5000
G3 X104.991 Y121.01 I.174 J.087 E.00619
G1 X111.835 Y121.014 E.21031
G3 X111.99 Y121.196 I-.04 J.19 E.00789
G1 X111.989 Y134.817 E.41852
G3 X111.808 Y134.99 I-.193 J-.021 E.00835
G1 X105.011 Y134.99 E.20886
G3 X104.81 Y134.792 I-.008 J-.193 E.00973
G1 X104.812 Y121.18 E.41826
G3 X104.812 Y121.174 I.193 J.024 E.00017
M204 S10000
G1 X105.225 Y121.206 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X105.225 Y122.806 E.05708
; WIPE_START
G1 X105.225 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.887 Y123.613 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8460
M204 S6000
G1 X105.887 Y132.387 E.10701
; WIPE_START
G1 F15000
G1 X105.887 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.225 Y133.194 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X105.225 Y134.794 E.05709
M204 S10000
G1 X111.575 Y134.794 F42000
; LINE_WIDTH: 0.480839
G1 F8220.713
M204 S6000
G1 X111.575 Y133.194 E.05708
; WIPE_START
G1 X111.575 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.912 Y132.387 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.192343
G1 F8460
M204 S6000
G1 X110.912 Y123.613 E.10684
; WIPE_START
G1 F15000
G1 X110.912 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.575 Y122.806 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.480419
G1 F8228.605
M204 S6000
G1 X111.575 Y121.206 E.05702
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8228.605
G1 X111.575 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 24/73
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z5 I-.016 J1.217 P1  F42000
G1 X146.165 Y123.273 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8460
M204 S6000
G1 X149.427 Y123.273 E.10821
G1 X149.427 Y132.727 E.31361
G1 X145.773 Y132.727 E.12121
G1 X145.773 Y123.273 E.31361
G1 X146.105 Y123.273 E.01102
M204 S250
G1 X146.165 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8460
M204 S5000
G1 X149.035 Y123.665 E.08819
G1 X149.035 Y132.335 E.2664
G1 X146.165 Y132.335 E.08819
G1 X146.165 Y123.725 E.26456
M204 S10000
G1 X145.366 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8460
M204 S6000
G1 X145.366 Y132.591 E.29609
G1 X144.809 Y132.591 E.01847
G1 X144.809 Y123.409 E.30458
G1 X145.366 Y123.409 E.01847
G1 X145.366 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X145.366 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.478 Y132.035 Z5.2 F42000
G1 X149.834 Y132.591 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F8460
M204 S6000
G1 X149.834 Y123.409 E.30458
G1 X150.391 Y123.409 E.01846
G1 X150.391 Y132.591 E.30458
G1 X149.894 Y132.591 E.01648
; WIPE_START
G1 F8843.478
G1 X149.881 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.84 Y132.998 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F8460
M204 S6000
G1 X144.402 Y132.998 E.01453
G1 X144.402 Y123.002 E.33158
G1 X150.798 Y123.002 E.21216
G1 X150.798 Y132.998 E.33158
G1 X144.9 Y132.998 E.19564
M204 S250
G1 X144.84 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8460
M204 S5000
G1 X150.36 Y133.39 E.16961
G1 X150.36 Y134.61 E.03749
G1 X144.84 Y134.61 E.16961
G1 X144.84 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X146.84 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.201 Y126.17 Z5.2 F42000
G1 X150.36 Y122.61 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F8460
M204 S5000
G1 X144.84 Y122.61 E.16961
G1 X144.84 Y121.39 E.03749
G1 X150.36 Y121.39 E.16961
G1 X150.36 Y122.55 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.36 Y122.572 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.021 Y121.138 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F8460
M204 S5000
G3 X144.193 Y121.01 I.181 J.065 E.00697
G1 X151.035 Y121.014 E.21026
G3 X151.19 Y121.205 I-.04 J.19 E.00817
G1 X151.19 Y134.789 E.41741
G3 X151.007 Y134.99 I-.192 J.008 E.00926
G1 X144.184 Y134.989 E.20964
G3 X144.01 Y134.792 I.022 J-.195 E.00885
G1 X144.01 Y121.21 E.41732
G3 X144.01 Y121.197 I.192 J-.008 E.00041
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.055 Y121.078 E-.04819
G1 X144.119 Y121.029 E-.0309
G1 X144.193 Y121.01 E-.02885
G1 X145.909 Y121.011 E-.65206
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 24 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.2
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer24 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X144.425 Y121.206 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X144.425 Y122.806 E.05708
; WIPE_START
G1 X144.425 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.087 Y123.613 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8460
M204 S6000
G1 X145.087 Y132.387 E.10701
; WIPE_START
G1 F15000
G1 X145.087 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.425 Y133.194 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X144.425 Y134.794 E.05709
M204 S10000
G1 X150.775 Y134.794 F42000
; LINE_WIDTH: 0.480853
G1 F8220.44
M204 S6000
G1 X150.775 Y133.194 E.05708
; WIPE_START
G1 X150.775 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.112 Y132.387 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.192511
G1 F8460
M204 S6000
G1 X150.112 Y123.613 E.10696
; WIPE_START
G1 F15000
G1 X150.112 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.775 Y122.806 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.480733
G1 F8222.694
M204 S6000
G1 X150.775 Y121.206 E.05707
; OBJECT_ID: 405
; WIPE_START
G1 X150.775 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X143.144 Y122.953 Z5.2 F42000
G1 X126.565 Y123.273 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8460
M204 S6000
G1 X129.827 Y123.273 E.10821
G1 X129.827 Y132.727 E.31361
G1 X126.173 Y132.727 E.12121
G1 X126.173 Y123.273 E.31361
G1 X126.505 Y123.273 E.01102
M204 S250
G1 X126.565 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8460
M204 S5000
G1 X129.435 Y123.665 E.08819
G1 X129.435 Y132.335 E.2664
G1 X126.565 Y132.335 E.08819
G1 X126.565 Y123.725 E.26456
M204 S10000
G1 X125.766 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8460
M204 S6000
G1 X125.766 Y132.591 E.29609
G1 X125.209 Y132.591 E.01847
G1 X125.209 Y123.409 E.30458
G1 X125.766 Y123.409 E.01847
G1 X125.766 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X125.766 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.878 Y132.035 Z5.2 F42000
M73 P53 R10
G1 X130.234 Y132.591 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F8460
M204 S6000
G1 X130.234 Y123.409 E.30458
G1 X130.791 Y123.409 E.01846
G1 X130.791 Y132.591 E.30458
G1 X130.294 Y132.591 E.01648
; WIPE_START
G1 F8843.478
G1 X130.281 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.24 Y132.998 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F8460
M204 S6000
G1 X124.802 Y132.998 E.01453
G1 X124.802 Y123.002 E.33158
G1 X131.198 Y123.002 E.21216
G1 X131.198 Y132.998 E.33158
G1 X125.3 Y132.998 E.19564
M204 S250
G1 X125.24 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8460
M204 S5000
G1 X130.76 Y133.39 E.16961
G1 X130.76 Y134.61 E.03749
G1 X125.24 Y134.61 E.16961
G1 X125.24 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.24 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.852 Y125.923 Z5.2 F42000
G1 X125.24 Y122.61 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F8460
M204 S5000
G1 X125.24 Y121.39 E.03749
G1 X130.76 Y121.39 E.16961
G1 X130.76 Y122.61 E.03749
G1 X125.3 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.24 Y121.39 E-.46416
G1 X126.019 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.421 Y121.138 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F8460
M204 S5000
G3 X124.593 Y121.01 I.181 J.065 E.00697
G1 X131.435 Y121.014 E.21026
G3 X131.59 Y121.205 I-.04 J.19 E.00817
G1 X131.59 Y134.789 E.41741
G3 X131.407 Y134.99 I-.192 J.008 E.00926
G1 X124.584 Y134.989 E.20964
G3 X124.41 Y134.792 I.022 J-.195 E.00885
G1 X124.41 Y121.21 E.41732
G3 X124.41 Y121.197 I.192 J-.008 E.00041
M204 S10000
G1 X124.825 Y121.206 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X124.825 Y122.806 E.05708
; WIPE_START
G1 X124.825 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.487 Y123.613 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8460
M204 S6000
G1 X125.487 Y132.387 E.10701
; WIPE_START
G1 F15000
G1 X125.487 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.825 Y133.194 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X124.825 Y134.794 E.05709
M204 S10000
G1 X131.175 Y134.794 F42000
; LINE_WIDTH: 0.480853
G1 F8220.44
M204 S6000
G1 X131.175 Y133.194 E.05708
; WIPE_START
G1 X131.175 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.512 Y132.387 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.192511
G1 F8460
M204 S6000
G1 X130.512 Y123.613 E.10696
; WIPE_START
G1 F15000
G1 X130.512 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.175 Y122.806 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.480733
G1 F8222.694
M204 S6000
G1 X131.175 Y121.206 E.05707
; OBJECT_ID: 394
; WIPE_START
G1 X131.175 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X123.544 Y122.953 Z5.2 F42000
G1 X106.965 Y123.273 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8460
M204 S6000
G1 X110.227 Y123.273 E.10821
G1 X110.227 Y132.727 E.31361
G1 X106.573 Y132.727 E.12121
G1 X106.573 Y123.273 E.31361
G1 X106.905 Y123.273 E.01102
M204 S250
G1 X106.965 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8460
M204 S5000
G1 X109.835 Y123.665 E.08819
G1 X109.835 Y132.335 E.2664
G1 X106.965 Y132.335 E.08819
G1 X106.965 Y123.725 E.26456
M204 S10000
G1 X106.166 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8460
M204 S6000
G1 X106.166 Y132.591 E.29609
G1 X105.609 Y132.591 E.01847
G1 X105.609 Y123.409 E.30458
G1 X106.166 Y123.409 E.01847
G1 X106.166 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X106.166 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.278 Y132.035 Z5.2 F42000
G1 X110.634 Y132.591 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F8460
M204 S6000
G1 X110.634 Y123.409 E.30458
G1 X111.191 Y123.409 E.01846
G1 X111.191 Y132.591 E.30458
G1 X110.694 Y132.591 E.01648
; WIPE_START
G1 F8843.478
G1 X110.681 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.64 Y132.998 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F8460
M204 S6000
G1 X105.202 Y132.998 E.01453
G1 X105.202 Y123.002 E.33158
G1 X111.598 Y123.002 E.21216
G1 X111.598 Y132.998 E.33158
G1 X105.7 Y132.998 E.19564
M204 S250
G1 X105.64 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8460
M204 S5000
G1 X111.16 Y133.39 E.16961
G1 X111.16 Y134.61 E.03749
G1 X105.64 Y134.61 E.16961
G1 X105.64 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X107.64 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.252 Y125.923 Z5.2 F42000
G1 X105.64 Y122.61 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F8460
M204 S5000
G1 X105.64 Y121.39 E.03749
G1 X111.16 Y121.39 E.16961
G1 X111.16 Y122.61 E.03749
G1 X105.7 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.64 Y121.39 E-.46416
G1 X106.419 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.821 Y121.138 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F8460
M204 S5000
G3 X104.993 Y121.01 I.181 J.065 E.00697
G1 X111.835 Y121.014 E.21026
G3 X111.99 Y121.205 I-.04 J.19 E.00817
G1 X111.99 Y134.789 E.41741
G3 X111.807 Y134.99 I-.192 J.008 E.00926
G1 X104.984 Y134.989 E.20964
G3 X104.81 Y134.792 I.022 J-.195 E.00885
G1 X104.81 Y121.21 E.41732
G3 X104.81 Y121.197 I.192 J-.008 E.00041
M204 S10000
G1 X105.225 Y121.206 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X105.225 Y122.806 E.05708
; WIPE_START
G1 X105.225 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.887 Y123.613 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8460
M204 S6000
G1 X105.887 Y132.387 E.10701
; WIPE_START
G1 F15000
G1 X105.887 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.225 Y133.194 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X105.225 Y134.794 E.05709
M204 S10000
G1 X111.575 Y134.794 F42000
; LINE_WIDTH: 0.480853
G1 F8220.44
M204 S6000
G1 X111.575 Y133.194 E.05708
; WIPE_START
G1 X111.575 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.912 Y132.387 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.192511
G1 F8460
M204 S6000
G1 X110.912 Y123.613 E.10696
; WIPE_START
G1 F15000
G1 X110.912 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.575 Y122.806 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.480733
G1 F8222.694
M204 S6000
G1 X111.575 Y121.206 E.05707
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8222.694
G1 X111.575 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 25/73
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z5.2 I-.016 J1.217 P1  F42000
G1 X146.165 Y123.273 Z5.2
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8476
M204 S6000
G1 X149.427 Y123.273 E.10821
G1 X149.427 Y132.727 E.31361
G1 X145.773 Y132.727 E.12121
G1 X145.773 Y123.273 E.31361
G1 X146.105 Y123.273 E.01102
M204 S250
G1 X146.165 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8476
M204 S5000
G1 X149.035 Y123.665 E.08819
G1 X149.035 Y132.335 E.2664
G1 X146.165 Y132.335 E.08819
G1 X146.165 Y123.725 E.26456
M204 S10000
G1 X145.366 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8476
M204 S6000
G1 X145.366 Y132.591 E.29609
G1 X144.809 Y132.591 E.01847
G1 X144.809 Y123.409 E.30458
G1 X145.366 Y123.409 E.01847
G1 X145.366 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X145.366 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.478 Y132.035 Z5.4 F42000
G1 X149.834 Y132.591 Z5.4
G1 Z5
G1 E.8 F1800
G1 F8476
M204 S6000
G1 X149.834 Y123.409 E.30458
G1 X150.39 Y123.409 E.01845
G1 X150.391 Y132.591 E.30458
G1 X149.894 Y132.591 E.01647
; WIPE_START
G1 F8843.478
G1 X149.881 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.84 Y132.998 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F8476
M204 S6000
G1 X144.402 Y132.998 E.01453
G1 X144.402 Y123.002 E.33158
G1 X150.798 Y123.002 E.21215
G1 X150.798 Y132.998 E.33158
G1 X144.9 Y132.998 E.19564
M204 S250
G1 X144.84 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8476
M204 S5000
G1 X150.36 Y133.39 E.16961
G1 X150.36 Y134.61 E.03749
G1 X144.84 Y134.61 E.16961
G1 X144.84 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X146.84 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.201 Y126.17 Z5.4 F42000
G1 X150.36 Y122.61 Z5.4
G1 Z5
G1 E.8 F1800
G1 F8476
M204 S5000
G1 X144.84 Y122.61 E.16961
G1 X144.84 Y121.39 E.03749
G1 X150.36 Y121.39 E.16961
G1 X150.36 Y122.55 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.36 Y122.572 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.018 Y121.147 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F8476
M204 S5000
G3 X144.193 Y121.01 I.185 J.056 E.00729
G1 X151.035 Y121.014 E.21023
G3 X151.19 Y121.196 I-.039 J.19 E.00788
G1 X151.189 Y134.817 E.41853
G3 X151.007 Y134.99 I-.196 J-.024 E.00836
G1 X144.211 Y134.99 E.20883
G1 X144.101 Y134.962 E.00348
G3 X144.01 Y134.792 I.105 J-.165 E.00618
G1 X144.018 Y121.207 E.41741
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.097 Y121.041 E-.07004
G1 X144.193 Y121.01 E-.03847
G1 X145.908 Y121.011 E-.65149
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 25 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.4
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer25 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X144.425 Y121.206 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X144.425 Y122.806 E.05708
; WIPE_START
G1 X144.425 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.087 Y123.613 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8476
M204 S6000
G1 X145.087 Y132.387 E.10701
; WIPE_START
G1 F15000
G1 X145.087 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.425 Y133.194 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X144.425 Y134.794 E.05709
M204 S10000
G1 X150.775 Y134.794 F42000
; LINE_WIDTH: 0.480839
G1 F8220.713
M204 S6000
G1 X150.775 Y133.194 E.05708
; WIPE_START
G1 X150.775 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.112 Y132.387 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.192343
G1 F8476
M204 S6000
G1 X150.112 Y123.613 E.10684
; WIPE_START
G1 F15000
G1 X150.112 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.775 Y122.806 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.480419
G1 F8228.605
M204 S6000
G1 X150.775 Y121.206 E.05703
; OBJECT_ID: 405
; WIPE_START
G1 X150.775 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X143.144 Y122.953 Z5.4 F42000
G1 X126.565 Y123.273 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8476
M204 S6000
G1 X129.827 Y123.273 E.10821
G1 X129.827 Y132.727 E.31361
G1 X126.173 Y132.727 E.12121
G1 X126.173 Y123.273 E.31361
G1 X126.505 Y123.273 E.01102
M204 S250
G1 X126.565 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8476
M204 S5000
G1 X129.435 Y123.665 E.08819
G1 X129.435 Y132.335 E.2664
G1 X126.565 Y132.335 E.08819
G1 X126.565 Y123.725 E.26456
M204 S10000
G1 X125.766 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8476
M204 S6000
G1 X125.766 Y132.591 E.29609
G1 X125.209 Y132.591 E.01847
G1 X125.209 Y123.409 E.30458
G1 X125.766 Y123.409 E.01847
G1 X125.766 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X125.766 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.878 Y132.035 Z5.4 F42000
G1 X130.234 Y132.591 Z5.4
M73 P54 R10
G1 Z5
G1 E.8 F1800
G1 F8476
M204 S6000
G1 X130.234 Y123.409 E.30458
G1 X130.79 Y123.409 E.01845
G1 X130.791 Y132.591 E.30458
G1 X130.294 Y132.591 E.01647
; WIPE_START
G1 F8843.478
G1 X130.281 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.24 Y132.998 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F8476
M204 S6000
G1 X124.802 Y132.998 E.01453
G1 X124.802 Y123.002 E.33158
G1 X131.198 Y123.002 E.21215
G1 X131.198 Y132.998 E.33158
G1 X125.3 Y132.998 E.19564
M204 S250
G1 X125.24 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8476
M204 S5000
G1 X130.76 Y133.39 E.16961
G1 X130.76 Y134.61 E.03749
G1 X125.24 Y134.61 E.16961
G1 X125.24 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.24 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.852 Y125.923 Z5.4 F42000
G1 X125.24 Y122.61 Z5.4
G1 Z5
G1 E.8 F1800
G1 F8476
M204 S5000
G1 X125.24 Y121.39 E.03749
G1 X130.76 Y121.39 E.16961
G1 X130.76 Y122.61 E.03749
G1 X125.3 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.24 Y121.39 E-.46416
G1 X126.019 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.418 Y121.147 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F8476
M204 S5000
G3 X124.593 Y121.01 I.185 J.056 E.00729
G1 X131.435 Y121.014 E.21023
G3 X131.59 Y121.196 I-.039 J.19 E.00788
G1 X131.589 Y134.817 E.41853
G3 X131.407 Y134.99 I-.196 J-.024 E.00836
G1 X124.611 Y134.99 E.20883
G1 X124.501 Y134.962 E.00348
G3 X124.41 Y134.792 I.105 J-.165 E.00618
G1 X124.418 Y121.207 E.41741
M204 S10000
G1 X124.825 Y121.206 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X124.825 Y122.806 E.05708
; WIPE_START
G1 X124.825 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.487 Y123.613 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8476
M204 S6000
G1 X125.487 Y132.387 E.10701
; WIPE_START
G1 F15000
G1 X125.487 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.825 Y133.194 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X124.825 Y134.794 E.05709
M204 S10000
G1 X131.175 Y134.794 F42000
; LINE_WIDTH: 0.480839
G1 F8220.713
M204 S6000
G1 X131.175 Y133.194 E.05708
; WIPE_START
G1 X131.175 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.512 Y132.387 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.192343
G1 F8476
M204 S6000
G1 X130.512 Y123.613 E.10684
; WIPE_START
G1 F15000
G1 X130.512 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.175 Y122.806 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.480419
G1 F8228.605
M204 S6000
G1 X131.175 Y121.206 E.05703
; OBJECT_ID: 394
; WIPE_START
G1 X131.175 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X123.544 Y122.953 Z5.4 F42000
G1 X106.965 Y123.273 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8476
M204 S6000
G1 X110.227 Y123.273 E.10821
G1 X110.227 Y132.727 E.31361
G1 X106.573 Y132.727 E.12121
G1 X106.573 Y123.273 E.31361
G1 X106.905 Y123.273 E.01102
M204 S250
G1 X106.965 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8476
M204 S5000
G1 X109.835 Y123.665 E.08819
G1 X109.835 Y132.335 E.2664
G1 X106.965 Y132.335 E.08819
G1 X106.965 Y123.725 E.26456
M204 S10000
G1 X106.166 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8476
M204 S6000
G1 X106.166 Y132.591 E.29609
G1 X105.609 Y132.591 E.01847
G1 X105.609 Y123.409 E.30458
G1 X106.166 Y123.409 E.01847
G1 X106.166 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X106.166 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.278 Y132.035 Z5.4 F42000
G1 X110.634 Y132.591 Z5.4
G1 Z5
G1 E.8 F1800
G1 F8476
M204 S6000
G1 X110.634 Y123.409 E.30458
G1 X111.19 Y123.409 E.01845
G1 X111.191 Y132.591 E.30458
G1 X110.694 Y132.591 E.01647
; WIPE_START
G1 F8843.478
G1 X110.681 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.64 Y132.998 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F8476
M204 S6000
G1 X105.202 Y132.998 E.01453
G1 X105.202 Y123.002 E.33158
G1 X111.598 Y123.002 E.21215
G1 X111.598 Y132.998 E.33158
G1 X105.7 Y132.998 E.19564
M204 S250
G1 X105.64 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8476
M204 S5000
G1 X111.16 Y133.39 E.16961
G1 X111.16 Y134.61 E.03749
G1 X105.64 Y134.61 E.16961
G1 X105.64 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X107.64 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.252 Y125.923 Z5.4 F42000
G1 X105.64 Y122.61 Z5.4
G1 Z5
G1 E.8 F1800
G1 F8476
M204 S5000
G1 X105.64 Y121.39 E.03749
G1 X111.16 Y121.39 E.16961
G1 X111.16 Y122.61 E.03749
G1 X105.7 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.64 Y121.39 E-.46416
G1 X106.419 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.818 Y121.147 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F8476
M204 S5000
G3 X104.993 Y121.01 I.185 J.056 E.00729
G1 X111.835 Y121.014 E.21023
G3 X111.99 Y121.196 I-.039 J.19 E.00788
G1 X111.989 Y134.817 E.41853
G3 X111.807 Y134.99 I-.196 J-.024 E.00836
G1 X105.011 Y134.99 E.20883
G1 X104.901 Y134.962 E.00348
G3 X104.81 Y134.792 I.105 J-.165 E.00618
G1 X104.818 Y121.207 E.41741
M204 S10000
G1 X105.225 Y121.206 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X105.225 Y122.806 E.05708
; WIPE_START
G1 X105.225 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.887 Y123.613 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8476
M204 S6000
G1 X105.887 Y132.387 E.10701
; WIPE_START
G1 F15000
M73 P54 R9
G1 X105.887 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.225 Y133.194 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X105.225 Y134.794 E.05709
M204 S10000
G1 X111.575 Y134.794 F42000
; LINE_WIDTH: 0.480839
G1 F8220.713
M204 S6000
G1 X111.575 Y133.194 E.05708
; WIPE_START
G1 X111.575 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.912 Y132.387 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.192343
G1 F8476
M204 S6000
G1 X110.912 Y123.613 E.10684
; WIPE_START
G1 F15000
G1 X110.912 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.575 Y122.806 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.480419
G1 F8228.605
M204 S6000
G1 X111.575 Y121.206 E.05703
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8228.605
G1 X111.575 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 26/73
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z5.4 I-.016 J1.217 P1  F42000
G1 X146.165 Y123.273 Z5.4
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8460
M204 S6000
G1 X149.427 Y123.273 E.10821
G1 X149.427 Y132.727 E.31361
G1 X145.773 Y132.727 E.12121
G1 X145.773 Y123.273 E.31361
G1 X146.105 Y123.273 E.01102
M204 S250
G1 X146.165 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8460
M204 S5000
G1 X149.035 Y123.665 E.08819
G1 X149.035 Y132.335 E.2664
G1 X146.165 Y132.335 E.08819
G1 X146.165 Y123.725 E.26456
M204 S10000
G1 X145.366 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8460
M204 S6000
G1 X145.366 Y132.591 E.29609
G1 X144.809 Y132.591 E.01847
G1 X144.809 Y123.409 E.30458
G1 X145.366 Y123.409 E.01847
G1 X145.366 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X145.366 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.478 Y132.035 Z5.6 F42000
G1 X149.834 Y132.591 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F8460
M204 S6000
G1 X149.834 Y123.409 E.30458
G1 X150.39 Y123.409 E.01845
G1 X150.391 Y132.591 E.30458
G1 X149.894 Y132.591 E.01647
; WIPE_START
G1 F8843.478
G1 X149.881 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.84 Y132.998 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F8460
M204 S6000
G1 X144.402 Y132.998 E.01453
G1 X144.402 Y123.002 E.33158
G1 X150.798 Y123.002 E.21215
G1 X150.798 Y132.998 E.33158
G1 X144.9 Y132.998 E.19564
M204 S250
G1 X144.84 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8460
M204 S5000
G1 X150.36 Y133.39 E.16961
G1 X150.36 Y134.61 E.03749
G1 X144.84 Y134.61 E.16961
G1 X144.84 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X146.84 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.201 Y126.17 Z5.6 F42000
G1 X150.36 Y122.61 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F8460
M204 S5000
G1 X144.84 Y122.61 E.16961
G1 X144.84 Y121.39 E.03749
G1 X150.36 Y121.39 E.16961
G1 X150.36 Y122.55 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.36 Y122.572 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.022 Y121.134 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F8460
M204 S5000
G3 X144.193 Y121.01 I.18 J.068 E.00687
G1 X151.035 Y121.014 E.21024
G3 X151.19 Y121.196 I-.039 J.189 E.00789
G1 X151.189 Y134.817 E.41853
G3 X151.007 Y134.99 I-.194 J-.022 E.00838
G1 X144.212 Y134.99 E.2088
G3 X144.01 Y134.792 I-.009 J-.193 E.00974
G1 X144.01 Y121.212 E.41729
G3 X144.01 Y121.193 I.192 J-.009 E.00055
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.054 Y121.08 E-.04625
G1 X144.12 Y121.028 E-.0321
G1 X144.193 Y121.01 E-.02854
G1 X145.912 Y121.011 E-.65311
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 26 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.6
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer26 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X144.425 Y121.206 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X144.425 Y122.806 E.05708
; WIPE_START
G1 X144.425 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.087 Y123.613 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8460
M204 S6000
G1 X145.087 Y132.387 E.10701
; WIPE_START
G1 F15000
G1 X145.087 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.425 Y133.194 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X144.425 Y134.794 E.05709
M204 S10000
G1 X150.775 Y134.794 F42000
; LINE_WIDTH: 0.480839
G1 F8220.713
M204 S6000
G1 X150.775 Y133.194 E.05708
; WIPE_START
G1 X150.775 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.112 Y132.387 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.192343
G1 F8460
M204 S6000
G1 X150.112 Y123.613 E.10684
; WIPE_START
G1 F15000
G1 X150.112 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.775 Y122.806 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.480419
G1 F8228.605
M204 S6000
G1 X150.775 Y121.206 E.05703
; OBJECT_ID: 405
; WIPE_START
G1 X150.775 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X143.144 Y122.953 Z5.6 F42000
G1 X126.565 Y123.273 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8460
M204 S6000
G1 X129.827 Y123.273 E.10821
G1 X129.827 Y132.727 E.31361
G1 X126.173 Y132.727 E.12121
G1 X126.173 Y123.273 E.31361
G1 X126.505 Y123.273 E.01102
M204 S250
G1 X126.565 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8460
M204 S5000
G1 X129.435 Y123.665 E.08819
G1 X129.435 Y132.335 E.2664
G1 X126.565 Y132.335 E.08819
G1 X126.565 Y123.725 E.26456
M204 S10000
G1 X125.766 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8460
M204 S6000
G1 X125.766 Y132.591 E.29609
G1 X125.209 Y132.591 E.01847
M73 P55 R9
G1 X125.209 Y123.409 E.30458
G1 X125.766 Y123.409 E.01847
G1 X125.766 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X125.766 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.878 Y132.035 Z5.6 F42000
G1 X130.234 Y132.591 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F8460
M204 S6000
G1 X130.234 Y123.409 E.30458
G1 X130.79 Y123.409 E.01845
G1 X130.791 Y132.591 E.30458
G1 X130.294 Y132.591 E.01647
; WIPE_START
G1 F8843.478
G1 X130.281 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.24 Y132.998 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F8460
M204 S6000
G1 X124.802 Y132.998 E.01453
G1 X124.802 Y123.002 E.33158
G1 X131.198 Y123.002 E.21215
G1 X131.198 Y132.998 E.33158
G1 X125.3 Y132.998 E.19564
M204 S250
G1 X125.24 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8460
M204 S5000
G1 X130.76 Y133.39 E.16961
G1 X130.76 Y134.61 E.03749
G1 X125.24 Y134.61 E.16961
G1 X125.24 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.24 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.852 Y125.923 Z5.6 F42000
G1 X125.24 Y122.61 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F8460
M204 S5000
G1 X125.24 Y121.39 E.03749
G1 X130.76 Y121.39 E.16961
G1 X130.76 Y122.61 E.03749
G1 X125.3 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.24 Y121.39 E-.46416
G1 X126.019 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.422 Y121.134 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F8460
M204 S5000
G3 X124.593 Y121.01 I.18 J.068 E.00687
G1 X131.435 Y121.014 E.21024
G3 X131.59 Y121.196 I-.039 J.189 E.00789
G1 X131.589 Y134.817 E.41853
G3 X131.407 Y134.99 I-.194 J-.022 E.00838
G1 X124.612 Y134.99 E.2088
G3 X124.41 Y134.792 I-.009 J-.193 E.00974
G1 X124.41 Y121.212 E.41729
G3 X124.41 Y121.193 I.192 J-.009 E.00055
M204 S10000
G1 X124.825 Y121.206 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X124.825 Y122.806 E.05708
; WIPE_START
G1 X124.825 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.487 Y123.613 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8460
M204 S6000
G1 X125.487 Y132.387 E.10701
; WIPE_START
G1 F15000
G1 X125.487 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.825 Y133.194 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X124.825 Y134.794 E.05709
M204 S10000
G1 X131.175 Y134.794 F42000
; LINE_WIDTH: 0.480839
G1 F8220.713
M204 S6000
G1 X131.175 Y133.194 E.05708
; WIPE_START
G1 X131.175 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.512 Y132.387 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.192343
G1 F8460
M204 S6000
G1 X130.512 Y123.613 E.10684
; WIPE_START
G1 F15000
G1 X130.512 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.175 Y122.806 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.480419
G1 F8228.605
M204 S6000
G1 X131.175 Y121.206 E.05703
; OBJECT_ID: 394
; WIPE_START
G1 X131.175 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X123.544 Y122.953 Z5.6 F42000
G1 X106.965 Y123.273 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8460
M204 S6000
G1 X110.227 Y123.273 E.10821
G1 X110.227 Y132.727 E.31361
G1 X106.573 Y132.727 E.12121
G1 X106.573 Y123.273 E.31361
G1 X106.905 Y123.273 E.01102
M204 S250
G1 X106.965 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8460
M204 S5000
G1 X109.835 Y123.665 E.08819
G1 X109.835 Y132.335 E.2664
G1 X106.965 Y132.335 E.08819
G1 X106.965 Y123.725 E.26456
M204 S10000
G1 X106.166 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8460
M204 S6000
G1 X106.166 Y132.591 E.29609
G1 X105.609 Y132.591 E.01847
G1 X105.609 Y123.409 E.30458
G1 X106.166 Y123.409 E.01847
G1 X106.166 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X106.166 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.278 Y132.035 Z5.6 F42000
G1 X110.634 Y132.591 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F8460
M204 S6000
G1 X110.634 Y123.409 E.30458
G1 X111.19 Y123.409 E.01845
G1 X111.191 Y132.591 E.30458
G1 X110.694 Y132.591 E.01647
; WIPE_START
G1 F8843.478
G1 X110.681 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.64 Y132.998 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F8460
M204 S6000
G1 X105.202 Y132.998 E.01453
G1 X105.202 Y123.002 E.33158
G1 X111.598 Y123.002 E.21215
G1 X111.598 Y132.998 E.33158
G1 X105.7 Y132.998 E.19564
M204 S250
G1 X105.64 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8460
M204 S5000
G1 X111.16 Y133.39 E.16961
G1 X111.16 Y134.61 E.03749
G1 X105.64 Y134.61 E.16961
G1 X105.64 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X107.64 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.252 Y125.923 Z5.6 F42000
G1 X105.64 Y122.61 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F8460
M204 S5000
G1 X105.64 Y121.39 E.03749
G1 X111.16 Y121.39 E.16961
G1 X111.16 Y122.61 E.03749
G1 X105.7 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.64 Y121.39 E-.46416
G1 X106.419 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.822 Y121.134 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F8460
M204 S5000
G3 X104.993 Y121.01 I.18 J.068 E.00687
G1 X111.835 Y121.014 E.21024
G3 X111.99 Y121.196 I-.039 J.189 E.00789
G1 X111.989 Y134.817 E.41853
G3 X111.807 Y134.99 I-.194 J-.022 E.00838
G1 X105.012 Y134.99 E.2088
G3 X104.81 Y134.792 I-.009 J-.193 E.00974
G1 X104.81 Y121.212 E.41729
G3 X104.81 Y121.193 I.192 J-.009 E.00055
M204 S10000
G1 X105.225 Y121.206 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X105.225 Y122.806 E.05708
; WIPE_START
G1 X105.225 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.887 Y123.613 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8460
M204 S6000
G1 X105.887 Y132.387 E.10701
; WIPE_START
G1 F15000
G1 X105.887 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.225 Y133.194 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X105.225 Y134.794 E.05709
M204 S10000
G1 X111.575 Y134.794 F42000
; LINE_WIDTH: 0.480839
G1 F8220.713
M204 S6000
G1 X111.575 Y133.194 E.05708
; WIPE_START
G1 X111.575 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.912 Y132.387 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.192343
G1 F8460
M204 S6000
G1 X110.912 Y123.613 E.10684
; WIPE_START
G1 F15000
G1 X110.912 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.575 Y122.806 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.480419
G1 F8228.605
M204 S6000
G1 X111.575 Y121.206 E.05703
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8228.605
G1 X111.575 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 27/73
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z5.6 I-.016 J1.217 P1  F42000
G1 X146.165 Y123.273 Z5.6
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8460
M204 S6000
G1 X149.427 Y123.273 E.10821
G1 X149.427 Y132.727 E.31361
G1 X145.773 Y132.727 E.12121
G1 X145.773 Y123.273 E.31361
G1 X146.105 Y123.273 E.01102
M204 S250
G1 X146.165 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8460
M204 S5000
G1 X149.035 Y123.665 E.08819
G1 X149.035 Y132.335 E.2664
G1 X146.165 Y132.335 E.08819
G1 X146.165 Y123.725 E.26456
M204 S10000
G1 X145.366 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8460
M204 S6000
G1 X145.366 Y132.591 E.29609
G1 X144.809 Y132.591 E.01847
G1 X144.809 Y123.409 E.30458
G1 X145.366 Y123.409 E.01847
G1 X145.366 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X145.366 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.478 Y132.035 Z5.8 F42000
G1 X149.834 Y132.591 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F8460
M204 S6000
G1 X149.834 Y123.409 E.30458
G1 X150.39 Y123.409 E.01845
G1 X150.391 Y132.591 E.30458
G1 X149.894 Y132.591 E.01647
; WIPE_START
G1 F8843.478
G1 X149.881 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.84 Y132.998 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
G1 F8460
M204 S6000
G1 X144.402 Y132.998 E.01453
G1 X144.402 Y123.002 E.33158
G1 X150.798 Y123.002 E.21215
G1 X150.798 Y132.998 E.33158
G1 X144.9 Y132.998 E.19564
M204 S250
G1 X144.84 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8460
M204 S5000
G1 X150.36 Y133.39 E.16961
G1 X150.36 Y134.61 E.03749
G1 X144.84 Y134.61 E.16961
G1 X144.84 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X146.84 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.201 Y126.17 Z5.8 F42000
G1 X150.36 Y122.61 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F8460
M204 S5000
G1 X144.84 Y122.61 E.16961
G1 X144.84 Y121.39 E.03749
G1 X150.36 Y121.39 E.16961
G1 X150.36 Y122.55 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.36 Y122.572 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.022 Y121.134 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
G1 F8460
M204 S5000
G3 X144.193 Y121.01 I.18 J.068 E.00685
G1 X151.035 Y121.014 E.21026
G3 X151.19 Y121.196 I-.04 J.19 E.00788
G1 X151.185 Y134.841 E.41928
G3 X151.009 Y134.99 I-.188 J-.044 E.00758
G1 X144.211 Y134.99 E.20888
G3 X144.01 Y134.792 I-.008 J-.193 E.00973
G1 X144.01 Y121.211 E.4173
G3 X144.01 Y121.194 I.192 J-.008 E.00054
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.052 Y121.082 E-.04537
G1 X144.119 Y121.029 E-.03252
G1 X144.193 Y121.01 E-.02883
G1 X145.912 Y121.011 E-.65328
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 27 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.8
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer27 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X144.425 Y121.206 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X144.425 Y122.806 E.05708
; WIPE_START
G1 X144.425 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.087 Y123.613 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8460
M204 S6000
G1 X145.087 Y132.387 E.10701
; WIPE_START
G1 F15000
G1 X145.087 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.425 Y133.194 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X144.425 Y134.794 E.05709
M204 S10000
G1 X150.775 Y134.794 F42000
; LINE_WIDTH: 0.480839
G1 F8220.713
M204 S6000
G1 X150.775 Y133.194 E.05708
; WIPE_START
G1 X150.775 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.112 Y132.387 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.192343
G1 F8460
M204 S6000
G1 X150.112 Y123.613 E.10684
; WIPE_START
G1 F15000
G1 X150.112 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.775 Y122.806 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.480419
G1 F8228.605
M204 S6000
G1 X150.775 Y121.206 E.05703
; OBJECT_ID: 405
; WIPE_START
G1 X150.775 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X143.144 Y122.953 Z5.8 F42000
M73 P56 R9
G1 X126.565 Y123.273 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8460
M204 S6000
G1 X129.827 Y123.273 E.10821
G1 X129.827 Y132.727 E.31361
G1 X126.173 Y132.727 E.12121
G1 X126.173 Y123.273 E.31361
G1 X126.505 Y123.273 E.01102
M204 S250
G1 X126.565 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8460
M204 S5000
G1 X129.435 Y123.665 E.08819
G1 X129.435 Y132.335 E.2664
G1 X126.565 Y132.335 E.08819
G1 X126.565 Y123.725 E.26456
M204 S10000
G1 X125.766 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8460
M204 S6000
G1 X125.766 Y132.591 E.29609
G1 X125.209 Y132.591 E.01847
G1 X125.209 Y123.409 E.30458
G1 X125.766 Y123.409 E.01847
G1 X125.766 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X125.766 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.878 Y132.035 Z5.8 F42000
G1 X130.234 Y132.591 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F8460
M204 S6000
G1 X130.234 Y123.409 E.30458
G1 X130.79 Y123.409 E.01845
G1 X130.791 Y132.591 E.30458
G1 X130.294 Y132.591 E.01647
; WIPE_START
G1 F8843.478
G1 X130.281 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.24 Y132.998 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
G1 F8460
M204 S6000
G1 X124.802 Y132.998 E.01453
G1 X124.802 Y123.002 E.33158
G1 X131.198 Y123.002 E.21215
G1 X131.198 Y132.998 E.33158
G1 X125.3 Y132.998 E.19564
M204 S250
G1 X125.24 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8460
M204 S5000
G1 X130.76 Y133.39 E.16961
G1 X130.76 Y134.61 E.03749
G1 X125.24 Y134.61 E.16961
G1 X125.24 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.24 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.852 Y125.923 Z5.8 F42000
G1 X125.24 Y122.61 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F8460
M204 S5000
G1 X125.24 Y121.39 E.03749
G1 X130.76 Y121.39 E.16961
G1 X130.76 Y122.61 E.03749
G1 X125.3 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.24 Y121.39 E-.46416
G1 X126.019 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.422 Y121.134 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
G1 F8460
M204 S5000
G3 X124.593 Y121.01 I.18 J.068 E.00685
G1 X131.435 Y121.014 E.21026
G3 X131.59 Y121.196 I-.04 J.19 E.00788
G1 X131.585 Y134.841 E.41928
G3 X131.409 Y134.99 I-.188 J-.044 E.00758
G1 X124.611 Y134.99 E.20888
G3 X124.41 Y134.792 I-.008 J-.193 E.00973
G1 X124.41 Y121.211 E.4173
G3 X124.41 Y121.194 I.192 J-.008 E.00054
M204 S10000
G1 X124.825 Y121.206 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X124.825 Y122.806 E.05708
; WIPE_START
G1 X124.825 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.487 Y123.613 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8460
M204 S6000
G1 X125.487 Y132.387 E.10701
; WIPE_START
G1 F15000
G1 X125.487 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.825 Y133.194 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X124.825 Y134.794 E.05709
M204 S10000
G1 X131.175 Y134.794 F42000
; LINE_WIDTH: 0.480839
G1 F8220.713
M204 S6000
G1 X131.175 Y133.194 E.05708
; WIPE_START
G1 X131.175 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.512 Y132.387 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.192343
G1 F8460
M204 S6000
G1 X130.512 Y123.613 E.10684
; WIPE_START
G1 F15000
G1 X130.512 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.175 Y122.806 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.480419
G1 F8228.605
M204 S6000
G1 X131.175 Y121.206 E.05703
; OBJECT_ID: 394
; WIPE_START
G1 X131.175 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X123.544 Y122.953 Z5.8 F42000
G1 X106.965 Y123.273 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8460
M204 S6000
G1 X110.227 Y123.273 E.10821
G1 X110.227 Y132.727 E.31361
G1 X106.573 Y132.727 E.12121
G1 X106.573 Y123.273 E.31361
G1 X106.905 Y123.273 E.01102
M204 S250
G1 X106.965 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8460
M204 S5000
G1 X109.835 Y123.665 E.08819
G1 X109.835 Y132.335 E.2664
G1 X106.965 Y132.335 E.08819
G1 X106.965 Y123.725 E.26456
M204 S10000
G1 X106.166 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8460
M204 S6000
G1 X106.166 Y132.591 E.29609
G1 X105.609 Y132.591 E.01847
G1 X105.609 Y123.409 E.30458
G1 X106.166 Y123.409 E.01847
G1 X106.166 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X106.166 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.278 Y132.035 Z5.8 F42000
G1 X110.634 Y132.591 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F8460
M204 S6000
G1 X110.634 Y123.409 E.30458
G1 X111.19 Y123.409 E.01845
G1 X111.191 Y132.591 E.30458
G1 X110.694 Y132.591 E.01647
; WIPE_START
G1 F8843.478
G1 X110.681 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.64 Y132.998 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
G1 F8460
M204 S6000
G1 X105.202 Y132.998 E.01453
G1 X105.202 Y123.002 E.33158
G1 X111.598 Y123.002 E.21215
G1 X111.598 Y132.998 E.33158
G1 X105.7 Y132.998 E.19564
M204 S250
G1 X105.64 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8460
M204 S5000
G1 X111.16 Y133.39 E.16961
G1 X111.16 Y134.61 E.03749
G1 X105.64 Y134.61 E.16961
G1 X105.64 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X107.64 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.252 Y125.923 Z5.8 F42000
G1 X105.64 Y122.61 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F8460
M204 S5000
G1 X105.64 Y121.39 E.03749
G1 X111.16 Y121.39 E.16961
G1 X111.16 Y122.61 E.03749
G1 X105.7 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.64 Y121.39 E-.46416
G1 X106.419 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.822 Y121.134 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
G1 F8460
M204 S5000
G3 X104.993 Y121.01 I.18 J.068 E.00685
G1 X111.835 Y121.014 E.21026
G3 X111.99 Y121.196 I-.04 J.19 E.00788
G1 X111.985 Y134.841 E.41928
G3 X111.809 Y134.99 I-.188 J-.044 E.00758
G1 X105.011 Y134.99 E.20888
G3 X104.81 Y134.792 I-.008 J-.193 E.00973
G1 X104.81 Y121.211 E.4173
G3 X104.81 Y121.194 I.192 J-.008 E.00054
M204 S10000
G1 X105.225 Y121.206 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X105.225 Y122.806 E.05708
; WIPE_START
G1 X105.225 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.887 Y123.613 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8460
M204 S6000
G1 X105.887 Y132.387 E.10701
; WIPE_START
G1 F15000
G1 X105.887 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.225 Y133.194 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X105.225 Y134.794 E.05709
M204 S10000
G1 X111.575 Y134.794 F42000
; LINE_WIDTH: 0.480839
G1 F8220.713
M204 S6000
G1 X111.575 Y133.194 E.05708
; WIPE_START
G1 X111.575 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.912 Y132.387 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.192343
G1 F8460
M204 S6000
G1 X110.912 Y123.613 E.10684
; WIPE_START
G1 F15000
G1 X110.912 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.575 Y122.806 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.480419
G1 F8228.605
M204 S6000
G1 X111.575 Y121.206 E.05703
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8228.605
G1 X111.575 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 28/73
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z5.8 I-.016 J1.217 P1  F42000
G1 X146.165 Y123.273 Z5.8
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8460
M204 S6000
G1 X149.427 Y123.273 E.10821
G1 X149.427 Y132.727 E.31361
G1 X145.773 Y132.727 E.12121
G1 X145.773 Y123.273 E.31361
G1 X146.105 Y123.273 E.01102
M204 S250
G1 X146.165 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8460
M204 S5000
G1 X149.035 Y123.665 E.08819
G1 X149.035 Y132.335 E.2664
G1 X146.165 Y132.335 E.08819
G1 X146.165 Y123.725 E.26456
M204 S10000
G1 X145.366 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8460
M204 S6000
G1 X145.366 Y132.591 E.29609
G1 X144.809 Y132.591 E.01847
G1 X144.809 Y123.409 E.30458
G1 X145.366 Y123.409 E.01847
G1 X145.366 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X145.366 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.478 Y132.035 Z6 F42000
G1 X149.834 Y132.591 Z6
G1 Z5.6
G1 E.8 F1800
G1 F8460
M204 S6000
G1 X149.834 Y123.409 E.30458
G1 X150.391 Y123.409 E.01846
G1 X150.391 Y132.591 E.30458
G1 X149.894 Y132.591 E.01648
; WIPE_START
G1 F8843.478
G1 X149.881 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.84 Y132.998 Z6 F42000
G1 Z5.6
G1 E.8 F1800
G1 F8460
M204 S6000
G1 X144.402 Y132.998 E.01453
G1 X144.402 Y123.002 E.33158
G1 X150.798 Y123.002 E.21216
G1 X150.798 Y132.998 E.33158
G1 X144.9 Y132.998 E.19564
M204 S250
G1 X144.84 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8460
M204 S5000
G1 X150.36 Y133.39 E.16961
G1 X150.36 Y134.61 E.03749
G1 X144.84 Y134.61 E.16961
G1 X144.84 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X146.84 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.201 Y126.17 Z6 F42000
G1 X150.36 Y122.61 Z6
G1 Z5.6
G1 E.8 F1800
G1 F8460
M204 S5000
G1 X144.84 Y122.61 E.16961
G1 X144.84 Y121.39 E.03749
G1 X150.36 Y121.39 E.16961
G1 X150.36 Y122.55 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.36 Y122.572 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.022 Y121.134 Z6 F42000
G1 Z5.6
G1 E.8 F1800
G1 F8460
M204 S5000
G3 X144.193 Y121.01 I.18 J.068 E.00687
G1 X151.035 Y121.014 E.21024
G3 X151.19 Y121.204 I-.04 J.19 E.00813
G1 X151.189 Y134.817 E.41828
G3 X151.007 Y134.99 I-.194 J-.022 E.00838
G1 X144.179 Y134.988 E.2098
G3 X144.01 Y134.792 I.029 J-.195 E.00868
G1 X144.01 Y121.212 E.41729
G3 X144.01 Y121.194 I.192 J-.009 E.00055
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.055 Y121.078 E-.04725
G1 X144.113 Y121.032 E-.02811
G1 X144.193 Y121.01 E-.03154
G1 X145.912 Y121.011 E-.6531
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 28 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer28 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X144.425 Y121.206 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X144.425 Y122.806 E.05708
; WIPE_START
G1 X144.425 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.087 Y123.613 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8460
M204 S6000
G1 X145.087 Y132.387 E.10701
; WIPE_START
G1 F15000
G1 X145.087 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.425 Y133.194 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X144.425 Y134.794 E.05709
M204 S10000
G1 X150.775 Y134.794 F42000
; LINE_WIDTH: 0.480853
G1 F8220.44
M204 S6000
G1 X150.775 Y133.194 E.05708
; WIPE_START
G1 X150.775 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P57 R9
G1 X150.112 Y132.387 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.192491
G1 F8460
M204 S6000
G1 X150.112 Y123.613 E.10695
; WIPE_START
G1 F15000
G1 X150.112 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.775 Y122.806 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.480693
G1 F8223.445
M204 S6000
G1 X150.775 Y121.206 E.05706
; OBJECT_ID: 405
; WIPE_START
G1 X150.775 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X143.144 Y122.953 Z6 F42000
G1 X126.565 Y123.273 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8460
M204 S6000
G1 X129.827 Y123.273 E.10821
G1 X129.827 Y132.727 E.31361
G1 X126.173 Y132.727 E.12121
G1 X126.173 Y123.273 E.31361
G1 X126.505 Y123.273 E.01102
M204 S250
G1 X126.565 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8460
M204 S5000
G1 X129.435 Y123.665 E.08819
G1 X129.435 Y132.335 E.2664
G1 X126.565 Y132.335 E.08819
G1 X126.565 Y123.725 E.26456
M204 S10000
G1 X125.766 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8460
M204 S6000
G1 X125.766 Y132.591 E.29609
G1 X125.209 Y132.591 E.01847
G1 X125.209 Y123.409 E.30458
G1 X125.766 Y123.409 E.01847
G1 X125.766 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X125.766 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.878 Y132.035 Z6 F42000
G1 X130.234 Y132.591 Z6
G1 Z5.6
G1 E.8 F1800
G1 F8460
M204 S6000
G1 X130.234 Y123.409 E.30458
G1 X130.791 Y123.409 E.01846
G1 X130.791 Y132.591 E.30458
G1 X130.294 Y132.591 E.01648
; WIPE_START
G1 F8843.478
G1 X130.281 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.24 Y132.998 Z6 F42000
G1 Z5.6
G1 E.8 F1800
G1 F8460
M204 S6000
G1 X124.802 Y132.998 E.01453
G1 X124.802 Y123.002 E.33158
G1 X131.198 Y123.002 E.21216
G1 X131.198 Y132.998 E.33158
G1 X125.3 Y132.998 E.19564
M204 S250
G1 X125.24 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8460
M204 S5000
G1 X130.76 Y133.39 E.16961
G1 X130.76 Y134.61 E.03749
G1 X125.24 Y134.61 E.16961
G1 X125.24 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.24 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.852 Y125.923 Z6 F42000
G1 X125.24 Y122.61 Z6
G1 Z5.6
G1 E.8 F1800
G1 F8460
M204 S5000
G1 X125.24 Y121.39 E.03749
G1 X130.76 Y121.39 E.16961
G1 X130.76 Y122.61 E.03749
G1 X125.3 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.24 Y121.39 E-.46416
G1 X126.019 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.422 Y121.134 Z6 F42000
G1 Z5.6
G1 E.8 F1800
G1 F8460
M204 S5000
G3 X124.593 Y121.01 I.18 J.068 E.00687
G1 X131.435 Y121.014 E.21024
G3 X131.59 Y121.204 I-.04 J.19 E.00813
G1 X131.589 Y134.817 E.41828
G3 X131.407 Y134.99 I-.194 J-.022 E.00838
G1 X124.579 Y134.988 E.2098
G3 X124.41 Y134.792 I.029 J-.195 E.00868
G1 X124.41 Y121.212 E.41729
G3 X124.41 Y121.194 I.192 J-.009 E.00055
M204 S10000
G1 X124.825 Y121.206 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X124.825 Y122.806 E.05708
; WIPE_START
G1 X124.825 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.487 Y123.613 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8460
M204 S6000
G1 X125.487 Y132.387 E.10701
; WIPE_START
G1 F15000
G1 X125.487 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.825 Y133.194 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X124.825 Y134.794 E.05709
M204 S10000
G1 X131.175 Y134.794 F42000
; LINE_WIDTH: 0.480853
G1 F8220.44
M204 S6000
G1 X131.175 Y133.194 E.05708
; WIPE_START
G1 X131.175 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.512 Y132.387 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.192491
G1 F8460
M204 S6000
G1 X130.512 Y123.613 E.10695
; WIPE_START
G1 F15000
G1 X130.512 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.175 Y122.806 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.480693
G1 F8223.445
M204 S6000
G1 X131.175 Y121.206 E.05706
; OBJECT_ID: 394
; WIPE_START
G1 X131.175 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X123.544 Y122.953 Z6 F42000
G1 X106.965 Y123.273 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8460
M204 S6000
G1 X110.227 Y123.273 E.10821
G1 X110.227 Y132.727 E.31361
G1 X106.573 Y132.727 E.12121
G1 X106.573 Y123.273 E.31361
G1 X106.905 Y123.273 E.01102
M204 S250
G1 X106.965 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8460
M204 S5000
G1 X109.835 Y123.665 E.08819
G1 X109.835 Y132.335 E.2664
G1 X106.965 Y132.335 E.08819
G1 X106.965 Y123.725 E.26456
M204 S10000
G1 X106.166 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8460
M204 S6000
G1 X106.166 Y132.591 E.29609
G1 X105.609 Y132.591 E.01847
G1 X105.609 Y123.409 E.30458
G1 X106.166 Y123.409 E.01847
G1 X106.166 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X106.166 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.278 Y132.035 Z6 F42000
G1 X110.634 Y132.591 Z6
G1 Z5.6
G1 E.8 F1800
G1 F8460
M204 S6000
G1 X110.634 Y123.409 E.30458
G1 X111.191 Y123.409 E.01846
G1 X111.191 Y132.591 E.30458
G1 X110.694 Y132.591 E.01648
; WIPE_START
G1 F8843.478
G1 X110.681 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.64 Y132.998 Z6 F42000
G1 Z5.6
G1 E.8 F1800
G1 F8460
M204 S6000
G1 X105.202 Y132.998 E.01453
G1 X105.202 Y123.002 E.33158
G1 X111.598 Y123.002 E.21216
G1 X111.598 Y132.998 E.33158
G1 X105.7 Y132.998 E.19564
M204 S250
G1 X105.64 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8460
M204 S5000
G1 X111.16 Y133.39 E.16961
G1 X111.16 Y134.61 E.03749
G1 X105.64 Y134.61 E.16961
G1 X105.64 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X107.64 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.252 Y125.923 Z6 F42000
G1 X105.64 Y122.61 Z6
G1 Z5.6
G1 E.8 F1800
G1 F8460
M204 S5000
G1 X105.64 Y121.39 E.03749
G1 X111.16 Y121.39 E.16961
G1 X111.16 Y122.61 E.03749
G1 X105.7 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.64 Y121.39 E-.46416
G1 X106.419 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.822 Y121.134 Z6 F42000
G1 Z5.6
G1 E.8 F1800
G1 F8460
M204 S5000
G3 X104.993 Y121.01 I.18 J.068 E.00687
G1 X111.835 Y121.014 E.21024
G3 X111.99 Y121.204 I-.04 J.19 E.00813
G1 X111.989 Y134.817 E.41828
G3 X111.807 Y134.99 I-.194 J-.022 E.00838
G1 X104.979 Y134.988 E.2098
G3 X104.81 Y134.792 I.029 J-.195 E.00868
G1 X104.81 Y121.212 E.41729
G3 X104.81 Y121.194 I.192 J-.009 E.00055
M204 S10000
G1 X105.225 Y121.206 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X105.225 Y122.806 E.05708
; WIPE_START
G1 X105.225 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.887 Y123.613 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8460
M204 S6000
G1 X105.887 Y132.387 E.10701
; WIPE_START
G1 F15000
G1 X105.887 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.225 Y133.194 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X105.225 Y134.794 E.05709
M204 S10000
G1 X111.575 Y134.794 F42000
; LINE_WIDTH: 0.480853
G1 F8220.44
M204 S6000
G1 X111.575 Y133.194 E.05708
; WIPE_START
G1 X111.575 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.912 Y132.387 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.192491
G1 F8460
M204 S6000
G1 X110.912 Y123.613 E.10695
; WIPE_START
G1 F15000
G1 X110.912 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.575 Y122.806 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.480693
G1 F8223.445
M204 S6000
G1 X111.575 Y121.206 E.05706
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8223.445
G1 X111.575 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 29/73
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z6 I-.016 J1.217 P1  F42000
G1 X146.165 Y123.273 Z6
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8460
M204 S6000
G1 X149.427 Y123.273 E.10821
G1 X149.427 Y132.727 E.31361
G1 X145.773 Y132.727 E.12121
G1 X145.773 Y123.273 E.31361
G1 X146.105 Y123.273 E.01102
M204 S250
G1 X146.165 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8460
M204 S5000
G1 X149.035 Y123.665 E.08819
G1 X149.035 Y132.335 E.2664
G1 X146.165 Y132.335 E.08819
G1 X146.165 Y123.725 E.26456
M204 S10000
G1 X145.366 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8460
M204 S6000
G1 X145.366 Y132.591 E.29609
G1 X144.809 Y132.591 E.01847
G1 X144.809 Y123.409 E.30458
G1 X145.366 Y123.409 E.01847
G1 X145.366 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X145.366 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.478 Y132.035 Z6.2 F42000
G1 X149.834 Y132.591 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F8460
M204 S6000
G1 X149.834 Y123.409 E.30458
G1 X150.391 Y123.409 E.01846
G1 X150.391 Y132.591 E.30458
G1 X149.894 Y132.591 E.01648
; WIPE_START
G1 F8843.478
G1 X149.881 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.84 Y132.998 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
G1 F8460
M204 S6000
G1 X144.402 Y132.998 E.01453
G1 X144.402 Y123.002 E.33158
G1 X150.798 Y123.002 E.21216
G1 X150.798 Y132.998 E.33158
G1 X144.9 Y132.998 E.19564
M204 S250
G1 X144.84 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8460
M204 S5000
G1 X150.36 Y133.39 E.16961
G1 X150.36 Y134.61 E.03749
G1 X144.84 Y134.61 E.16961
G1 X144.84 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X146.84 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.201 Y126.17 Z6.2 F42000
G1 X150.36 Y122.61 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F8460
M204 S5000
G1 X144.84 Y122.61 E.16961
G1 X144.84 Y121.39 E.03749
G1 X150.36 Y121.39 E.16961
G1 X150.36 Y122.55 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.36 Y122.572 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.031 Y121.117 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
G1 F8460
M204 S5000
G3 X144.193 Y121.01 I.175 J.089 E.00624
G1 X151.046 Y121.017 E.21056
G3 X151.19 Y121.204 I-.05 J.188 E.0078
G1 X151.19 Y134.789 E.41745
G3 X151.007 Y134.99 I-.191 J.009 E.00926
G1 X144.179 Y134.988 E.20981
G3 X144.01 Y134.795 I.028 J-.195 E.0086
G1 X144.011 Y121.184 E.41822
G3 X144.012 Y121.174 I.195 J.022 E.00029
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.072 Y121.06 E-.04903
G1 X144.193 Y121.01 E-.04974
G1 X145.933 Y121.012 E-.66122
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 29 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.2
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer29 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X144.425 Y121.206 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X144.425 Y122.806 E.05708
; WIPE_START
G1 X144.425 Y121.206 E-.76
; WIPE_END
M73 P58 R9
G1 E-.04 F1800
M204 S10000
G1 X145.087 Y123.613 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8460
M204 S6000
G1 X145.087 Y132.387 E.10701
; WIPE_START
G1 F15000
G1 X145.087 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.425 Y133.194 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X144.425 Y134.794 E.05709
M204 S10000
G1 X150.775 Y134.794 F42000
; LINE_WIDTH: 0.480853
G1 F8220.44
M204 S6000
G1 X150.775 Y133.194 E.05708
; WIPE_START
G1 X150.775 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.112 Y132.387 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.192481
G1 F8460
M204 S6000
G1 X150.112 Y123.613 E.10694
; WIPE_START
G1 F15000
G1 X150.112 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.775 Y122.806 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.480693
G1 F8223.445
M204 S6000
G1 X150.775 Y121.206 E.05706
; OBJECT_ID: 405
; WIPE_START
G1 X150.775 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X143.144 Y122.953 Z6.2 F42000
G1 X126.565 Y123.273 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8460
M204 S6000
G1 X129.827 Y123.273 E.10821
G1 X129.827 Y132.727 E.31361
G1 X126.173 Y132.727 E.12121
G1 X126.173 Y123.273 E.31361
G1 X126.505 Y123.273 E.01102
M204 S250
G1 X126.565 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8460
M204 S5000
G1 X129.435 Y123.665 E.08819
G1 X129.435 Y132.335 E.2664
G1 X126.565 Y132.335 E.08819
G1 X126.565 Y123.725 E.26456
M204 S10000
G1 X125.766 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8460
M204 S6000
G1 X125.766 Y132.591 E.29609
G1 X125.209 Y132.591 E.01847
G1 X125.209 Y123.409 E.30458
G1 X125.766 Y123.409 E.01847
G1 X125.766 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X125.766 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.878 Y132.035 Z6.2 F42000
G1 X130.234 Y132.591 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F8460
M204 S6000
G1 X130.234 Y123.409 E.30458
G1 X130.791 Y123.409 E.01846
G1 X130.791 Y132.591 E.30458
G1 X130.294 Y132.591 E.01648
; WIPE_START
G1 F8843.478
G1 X130.281 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.24 Y132.998 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
G1 F8460
M204 S6000
G1 X124.802 Y132.998 E.01453
G1 X124.802 Y123.002 E.33158
G1 X131.198 Y123.002 E.21216
G1 X131.198 Y132.998 E.33158
G1 X125.3 Y132.998 E.19564
M204 S250
G1 X125.24 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8460
M204 S5000
G1 X130.76 Y133.39 E.16961
G1 X130.76 Y134.61 E.03749
G1 X125.24 Y134.61 E.16961
G1 X125.24 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.24 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.852 Y125.923 Z6.2 F42000
G1 X125.24 Y122.61 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F8460
M204 S5000
G1 X125.24 Y121.39 E.03749
G1 X130.76 Y121.39 E.16961
G1 X130.76 Y122.61 E.03749
G1 X125.3 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.24 Y121.39 E-.46416
G1 X126.019 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.431 Y121.117 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
G1 F8460
M204 S5000
G3 X124.593 Y121.01 I.175 J.089 E.00624
G1 X131.446 Y121.017 E.21056
G3 X131.59 Y121.204 I-.05 J.188 E.0078
G1 X131.59 Y134.789 E.41745
G3 X131.407 Y134.99 I-.191 J.009 E.00926
G1 X124.579 Y134.988 E.20981
G3 X124.41 Y134.795 I.028 J-.195 E.0086
G1 X124.411 Y121.184 E.41822
G3 X124.412 Y121.174 I.195 J.022 E.00029
M204 S10000
G1 X124.825 Y121.206 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X124.825 Y122.806 E.05708
; WIPE_START
G1 X124.825 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.487 Y123.613 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8460
M204 S6000
G1 X125.487 Y132.387 E.10701
; WIPE_START
G1 F15000
G1 X125.487 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.825 Y133.194 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X124.825 Y134.794 E.05709
M204 S10000
G1 X131.175 Y134.794 F42000
; LINE_WIDTH: 0.480853
G1 F8220.44
M204 S6000
G1 X131.175 Y133.194 E.05708
; WIPE_START
G1 X131.175 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.512 Y132.387 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.192481
G1 F8460
M204 S6000
G1 X130.512 Y123.613 E.10694
; WIPE_START
G1 F15000
G1 X130.512 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.175 Y122.806 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.480693
G1 F8223.445
M204 S6000
G1 X131.175 Y121.206 E.05706
; OBJECT_ID: 394
; WIPE_START
G1 X131.175 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X123.544 Y122.953 Z6.2 F42000
G1 X106.965 Y123.273 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8460
M204 S6000
G1 X110.227 Y123.273 E.10821
G1 X110.227 Y132.727 E.31361
G1 X106.573 Y132.727 E.12121
G1 X106.573 Y123.273 E.31361
G1 X106.905 Y123.273 E.01102
M204 S250
G1 X106.965 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8460
M204 S5000
G1 X109.835 Y123.665 E.08819
G1 X109.835 Y132.335 E.2664
G1 X106.965 Y132.335 E.08819
G1 X106.965 Y123.725 E.26456
M204 S10000
G1 X106.166 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8460
M204 S6000
G1 X106.166 Y132.591 E.29609
G1 X105.609 Y132.591 E.01847
G1 X105.609 Y123.409 E.30458
G1 X106.166 Y123.409 E.01847
G1 X106.166 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X106.166 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.278 Y132.035 Z6.2 F42000
G1 X110.634 Y132.591 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F8460
M204 S6000
G1 X110.634 Y123.409 E.30458
G1 X111.191 Y123.409 E.01846
G1 X111.191 Y132.591 E.30458
G1 X110.694 Y132.591 E.01648
; WIPE_START
G1 F8843.478
G1 X110.681 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.64 Y132.998 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
G1 F8460
M204 S6000
G1 X105.202 Y132.998 E.01453
G1 X105.202 Y123.002 E.33158
G1 X111.598 Y123.002 E.21216
G1 X111.598 Y132.998 E.33158
G1 X105.7 Y132.998 E.19564
M204 S250
G1 X105.64 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8460
M204 S5000
G1 X111.16 Y133.39 E.16961
G1 X111.16 Y134.61 E.03749
G1 X105.64 Y134.61 E.16961
G1 X105.64 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X107.64 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.252 Y125.923 Z6.2 F42000
G1 X105.64 Y122.61 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F8460
M204 S5000
G1 X105.64 Y121.39 E.03749
G1 X111.16 Y121.39 E.16961
G1 X111.16 Y122.61 E.03749
G1 X105.7 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.64 Y121.39 E-.46416
G1 X106.419 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.831 Y121.117 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
G1 F8460
M204 S5000
G3 X104.993 Y121.01 I.175 J.089 E.00624
G1 X111.846 Y121.017 E.21056
G3 X111.99 Y121.204 I-.05 J.188 E.0078
G1 X111.99 Y134.789 E.41745
G3 X111.807 Y134.99 I-.191 J.009 E.00926
G1 X104.979 Y134.988 E.20981
G3 X104.81 Y134.795 I.028 J-.195 E.0086
G1 X104.811 Y121.184 E.41822
G3 X104.812 Y121.174 I.195 J.022 E.00029
M204 S10000
G1 X105.225 Y121.206 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X105.225 Y122.806 E.05708
; WIPE_START
G1 X105.225 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.887 Y123.613 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8460
M204 S6000
G1 X105.887 Y132.387 E.10701
; WIPE_START
G1 F15000
G1 X105.887 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.225 Y133.194 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X105.225 Y134.794 E.05709
M204 S10000
G1 X111.575 Y134.794 F42000
; LINE_WIDTH: 0.480853
G1 F8220.44
M204 S6000
G1 X111.575 Y133.194 E.05708
; WIPE_START
G1 X111.575 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.912 Y132.387 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.192481
G1 F8460
M204 S6000
G1 X110.912 Y123.613 E.10694
; WIPE_START
G1 F15000
G1 X110.912 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.575 Y122.806 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.480693
G1 F8223.445
M204 S6000
G1 X111.575 Y121.206 E.05706
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8223.445
G1 X111.575 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 30/73
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z6.2 I-.016 J1.217 P1  F42000
G1 X146.165 Y123.273 Z6.2
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8460
M204 S6000
G1 X149.427 Y123.273 E.10821
G1 X149.427 Y132.727 E.31361
G1 X145.773 Y132.727 E.12121
G1 X145.773 Y123.273 E.31361
G1 X146.105 Y123.273 E.01102
M204 S250
G1 X146.165 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8460
M204 S5000
G1 X149.035 Y123.665 E.08819
G1 X149.035 Y132.335 E.2664
G1 X146.165 Y132.335 E.08819
G1 X146.165 Y123.725 E.26456
M204 S10000
G1 X145.366 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8460
M204 S6000
G1 X145.366 Y132.591 E.29609
G1 X144.809 Y132.591 E.01847
G1 X144.809 Y123.409 E.30458
G1 X145.366 Y123.409 E.01847
G1 X145.366 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X145.366 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.478 Y132.035 Z6.4 F42000
G1 X149.834 Y132.591 Z6.4
G1 Z6
G1 E.8 F1800
G1 F8460
M204 S6000
G1 X149.834 Y123.409 E.30458
G1 X150.39 Y123.409 E.01845
G1 X150.391 Y132.591 E.30458
G1 X149.894 Y132.591 E.01647
; WIPE_START
G1 F8843.478
G1 X149.881 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.84 Y132.998 Z6.4 F42000
G1 Z6
G1 E.8 F1800
G1 F8460
M204 S6000
G1 X144.402 Y132.998 E.01453
G1 X144.402 Y123.002 E.33158
G1 X150.798 Y123.002 E.21215
G1 X150.798 Y132.998 E.33158
G1 X144.9 Y132.998 E.19564
M204 S250
G1 X144.84 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8460
M204 S5000
G1 X150.36 Y133.39 E.16961
G1 X150.36 Y134.61 E.03749
G1 X144.84 Y134.61 E.16961
G1 X144.84 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X146.84 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.201 Y126.17 Z6.4 F42000
G1 X150.36 Y122.61 Z6.4
G1 Z6
G1 E.8 F1800
G1 F8460
M204 S5000
G1 X144.84 Y122.61 E.16961
G1 X144.84 Y121.39 E.03749
G1 X150.36 Y121.39 E.16961
G1 X150.36 Y122.55 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.36 Y122.572 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.022 Y121.134 Z6.4 F42000
G1 Z6
G1 E.8 F1800
G1 F8460
M204 S5000
G3 X144.193 Y121.01 I.18 J.068 E.00688
G1 X151.036 Y121.014 E.21024
G3 X151.19 Y121.196 I-.04 J.19 E.00788
G1 X151.189 Y134.817 E.41853
G3 X151.007 Y134.99 I-.194 J-.022 E.00838
G1 X144.211 Y134.99 E.20883
G3 X144.01 Y134.792 I-.008 J-.193 E.00971
G1 X144.01 Y121.212 E.41729
G3 X144.01 Y121.194 I.192 J-.009 E.00055
; WIPE_START
G1 F9547.055
M204 S6000
M73 P59 R9
G1 X144.055 Y121.077 E-.0474
G1 X144.108 Y121.034 E-.02609
G1 X144.193 Y121.01 E-.03342
G1 X145.912 Y121.011 E-.65309
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 30 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.4
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer30 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X144.425 Y121.206 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X144.425 Y122.806 E.05708
; WIPE_START
G1 X144.425 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.087 Y123.613 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8460
M204 S6000
G1 X145.087 Y132.387 E.10701
; WIPE_START
G1 F15000
G1 X145.087 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.425 Y133.194 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X144.425 Y134.794 E.05709
M204 S10000
G1 X150.775 Y134.794 F42000
; LINE_WIDTH: 0.480839
G1 F8220.713
M204 S6000
G1 X150.775 Y133.194 E.05708
; WIPE_START
G1 X150.775 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P59 R8
G1 X150.112 Y132.387 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.192343
G1 F8460
M204 S6000
G1 X150.112 Y123.613 E.10684
; WIPE_START
G1 F15000
G1 X150.112 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.775 Y122.806 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.480419
G1 F8228.605
M204 S6000
G1 X150.775 Y121.206 E.05703
; OBJECT_ID: 405
; WIPE_START
G1 X150.775 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X143.144 Y122.953 Z6.4 F42000
G1 X126.565 Y123.273 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8460
M204 S6000
G1 X129.827 Y123.273 E.10821
G1 X129.827 Y132.727 E.31361
G1 X126.173 Y132.727 E.12121
G1 X126.173 Y123.273 E.31361
G1 X126.505 Y123.273 E.01102
M204 S250
G1 X126.565 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8460
M204 S5000
G1 X129.435 Y123.665 E.08819
G1 X129.435 Y132.335 E.2664
G1 X126.565 Y132.335 E.08819
G1 X126.565 Y123.725 E.26456
M204 S10000
G1 X125.766 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8460
M204 S6000
G1 X125.766 Y132.591 E.29609
G1 X125.209 Y132.591 E.01847
G1 X125.209 Y123.409 E.30458
G1 X125.766 Y123.409 E.01847
G1 X125.766 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X125.766 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.878 Y132.035 Z6.4 F42000
G1 X130.234 Y132.591 Z6.4
G1 Z6
G1 E.8 F1800
G1 F8460
M204 S6000
G1 X130.234 Y123.409 E.30458
G1 X130.79 Y123.409 E.01845
G1 X130.791 Y132.591 E.30458
G1 X130.294 Y132.591 E.01647
; WIPE_START
G1 F8843.478
G1 X130.281 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.24 Y132.998 Z6.4 F42000
G1 Z6
G1 E.8 F1800
G1 F8460
M204 S6000
G1 X124.802 Y132.998 E.01453
G1 X124.802 Y123.002 E.33158
G1 X131.198 Y123.002 E.21215
G1 X131.198 Y132.998 E.33158
G1 X125.3 Y132.998 E.19564
M204 S250
G1 X125.24 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8460
M204 S5000
G1 X130.76 Y133.39 E.16961
G1 X130.76 Y134.61 E.03749
G1 X125.24 Y134.61 E.16961
G1 X125.24 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.24 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.852 Y125.923 Z6.4 F42000
G1 X125.24 Y122.61 Z6.4
G1 Z6
G1 E.8 F1800
G1 F8460
M204 S5000
G1 X125.24 Y121.39 E.03749
G1 X130.76 Y121.39 E.16961
G1 X130.76 Y122.61 E.03749
G1 X125.3 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.24 Y121.39 E-.46416
G1 X126.019 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.422 Y121.134 Z6.4 F42000
G1 Z6
G1 E.8 F1800
G1 F8460
M204 S5000
G3 X124.593 Y121.01 I.18 J.068 E.00688
G1 X131.436 Y121.014 E.21024
G3 X131.59 Y121.196 I-.04 J.19 E.00788
G1 X131.589 Y134.817 E.41853
G3 X131.407 Y134.99 I-.194 J-.022 E.00838
G1 X124.611 Y134.99 E.20883
G3 X124.41 Y134.792 I-.008 J-.193 E.00971
G1 X124.41 Y121.212 E.41729
G3 X124.41 Y121.194 I.192 J-.009 E.00055
M204 S10000
G1 X124.825 Y121.206 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X124.825 Y122.806 E.05708
; WIPE_START
G1 X124.825 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.487 Y123.613 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8460
M204 S6000
G1 X125.487 Y132.387 E.10701
; WIPE_START
G1 F15000
G1 X125.487 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.825 Y133.194 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X124.825 Y134.794 E.05709
M204 S10000
G1 X131.175 Y134.794 F42000
; LINE_WIDTH: 0.480839
G1 F8220.713
M204 S6000
G1 X131.175 Y133.194 E.05708
; WIPE_START
G1 X131.175 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.512 Y132.387 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.192343
G1 F8460
M204 S6000
G1 X130.512 Y123.613 E.10684
; WIPE_START
G1 F15000
G1 X130.512 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.175 Y122.806 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.480419
G1 F8228.605
M204 S6000
G1 X131.175 Y121.206 E.05703
; OBJECT_ID: 394
; WIPE_START
G1 X131.175 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X123.544 Y122.953 Z6.4 F42000
G1 X106.965 Y123.273 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8460
M204 S6000
G1 X110.227 Y123.273 E.10821
G1 X110.227 Y132.727 E.31361
G1 X106.573 Y132.727 E.12121
G1 X106.573 Y123.273 E.31361
G1 X106.905 Y123.273 E.01102
M204 S250
G1 X106.965 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8460
M204 S5000
G1 X109.835 Y123.665 E.08819
G1 X109.835 Y132.335 E.2664
G1 X106.965 Y132.335 E.08819
G1 X106.965 Y123.725 E.26456
M204 S10000
G1 X106.166 Y123.665 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8460
M204 S6000
G1 X106.166 Y132.591 E.29609
G1 X105.609 Y132.591 E.01847
G1 X105.609 Y123.409 E.30458
G1 X106.166 Y123.409 E.01847
G1 X106.166 Y123.605 E.0065
; WIPE_START
G1 F8843.478
G1 X106.166 Y125.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.278 Y132.035 Z6.4 F42000
G1 X110.634 Y132.591 Z6.4
G1 Z6
G1 E.8 F1800
G1 F8460
M204 S6000
G1 X110.634 Y123.409 E.30458
G1 X111.19 Y123.409 E.01845
G1 X111.191 Y132.591 E.30458
G1 X110.694 Y132.591 E.01647
; WIPE_START
G1 F8843.478
G1 X110.681 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.64 Y132.998 Z6.4 F42000
G1 Z6
G1 E.8 F1800
G1 F8460
M204 S6000
G1 X105.202 Y132.998 E.01453
G1 X105.202 Y123.002 E.33158
G1 X111.598 Y123.002 E.21215
G1 X111.598 Y132.998 E.33158
G1 X105.7 Y132.998 E.19564
M204 S250
G1 X105.64 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8460
M204 S5000
G1 X111.16 Y133.39 E.16961
G1 X111.16 Y134.61 E.03749
G1 X105.64 Y134.61 E.16961
G1 X105.64 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X107.64 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.252 Y125.923 Z6.4 F42000
G1 X105.64 Y122.61 Z6.4
G1 Z6
G1 E.8 F1800
G1 F8460
M204 S5000
G1 X105.64 Y121.39 E.03749
G1 X111.16 Y121.39 E.16961
G1 X111.16 Y122.61 E.03749
G1 X105.7 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.64 Y121.39 E-.46416
G1 X106.419 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.822 Y121.134 Z6.4 F42000
G1 Z6
G1 E.8 F1800
G1 F8460
M204 S5000
G3 X104.993 Y121.01 I.18 J.068 E.00688
G1 X111.836 Y121.014 E.21024
G3 X111.99 Y121.196 I-.04 J.19 E.00788
G1 X111.989 Y134.817 E.41853
G3 X111.807 Y134.99 I-.194 J-.022 E.00838
G1 X105.011 Y134.99 E.20883
G3 X104.81 Y134.792 I-.008 J-.193 E.00971
G1 X104.81 Y121.212 E.41729
G3 X104.81 Y121.194 I.192 J-.009 E.00055
M204 S10000
G1 X105.225 Y121.206 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X105.225 Y122.806 E.05708
; WIPE_START
G1 X105.225 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.887 Y123.613 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.19258
G1 F8460
M204 S6000
G1 X105.887 Y132.387 E.10701
; WIPE_START
G1 F15000
G1 X105.887 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.225 Y133.194 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F8220.304
M204 S6000
G1 X105.225 Y134.794 E.05709
M204 S10000
G1 X111.575 Y134.794 F42000
; LINE_WIDTH: 0.480839
G1 F8220.713
M204 S6000
G1 X111.575 Y133.194 E.05708
; WIPE_START
G1 X111.575 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.912 Y132.387 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.192343
G1 F8460
M204 S6000
G1 X110.912 Y123.613 E.10684
; WIPE_START
G1 F15000
G1 X110.912 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.575 Y122.806 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.480419
G1 F8228.605
M204 S6000
G1 X111.575 Y121.206 E.05703
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8228.605
G1 X111.575 Y122.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 31/73
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z6.4 I-.002 J1.217 P1  F42000
G1 X146.165 Y122.866 Z6.4
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8520
M204 S6000
G1 X149.834 Y122.866 E.12171
G1 X149.834 Y133.134 E.34062
G1 X145.366 Y133.134 E.14822
G1 X145.366 Y122.866 E.34062
G1 X146.105 Y122.866 E.02452
M204 S10000
G1 X146.165 Y123.273 F42000
G1 F8520
M204 S6000
G1 X149.427 Y123.273 E.10821
G1 X149.427 Y132.727 E.31361
G1 X145.773 Y132.727 E.12121
G1 X145.773 Y123.273 E.31361
G1 X146.105 Y123.273 E.01102
M204 S250
G1 X146.165 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8520
M204 S5000
G1 X149.035 Y123.665 E.08819
G1 X149.035 Y132.335 E.2664
G1 X146.165 Y132.335 E.08819
G1 X146.165 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.165 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.843 Y130.954 Z6.6 F42000
G1 X144.809 Y134.191 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8520
M204 S6000
G1 X144.809 Y122.61 E.38417
G1 X144.809 Y122.21 E.01327
G1 F5503.149
G1 X144.809 Y121.81 E.01327
G1 F2159.498
G1 X144.867 Y121.81 E.00194
M106 S255
G1 F1800
G1 X145.25 Y121.81 E.01269
M106 S201.45
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X149.95 Y121.809 E.15591
M106 S201.45
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X150.332 Y121.809 E.01269
M106 S201.45
G1 F2156.601
G1 X150.39 Y121.809 E.00192
G1 F5498.524
G1 X150.39 Y122.209 E.01327
G1 F8520
G1 X150.39 Y122.609 E.01327
G1 X150.391 Y133.39 E.35763
G1 X150.391 Y133.79 E.01327
G1 F5502.841
G1 X150.391 Y134.19 E.01327
G1 F2159.305
G1 X150.332 Y134.19 E.00194
M106 S255
G1 F1800
G1 X149.95 Y134.19 E.01269
M106 S201.45
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X145.25 Y134.191 E.15591
M106 S201.45
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X144.869 Y134.191 E.01263
M106 S201.45
M204 S10000
M73 P60 R8
G1 X144.402 Y134.598 F42000
G1 F8520
M204 S6000
G1 X144.402 Y121.403 E.43772
G1 X150.797 Y121.402 E.21215
G1 X150.798 Y134.597 E.43771
G1 X144.462 Y134.598 E.21017
M204 S250
G1 X144.01 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8520
M204 S5000
G1 X144.01 Y121.211 E.41729
G3 X144.193 Y121.01 I.192 J-.009 E.00929
G1 X151.036 Y121.014 E.21024
G3 X151.19 Y121.196 I-.04 J.19 E.00788
G1 X151.189 Y134.817 E.41853
G3 X151.007 Y134.99 I-.194 J-.022 E.00838
G1 X144.211 Y134.99 E.2088
G3 X144.018 Y134.852 I-.009 J-.192 E.00788
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.017 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 31 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.6
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer31 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X145.087 Y133.338 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.193133
G1 F8520
M204 S6000
G1 X145.087 Y122.662 E.13067
G1 X145.196 Y122.446 E.00296
; LINE_WIDTH: 0.26741
G1 X145.304 Y122.23 E.00443
; LINE_WIDTH: 0.317297
G1 X145.412 Y122.013 E.00541
M204 S10000
G1 X145.013 Y122.338 F42000
; LINE_WIDTH: 0.692189
G1 F5544.704
M204 S6000
G1 X150.187 Y122.338 E.27375
M204 S10000
G1 X149.788 Y122.013 F42000
; LINE_WIDTH: 0.316522
G1 F8520
M204 S6000
G1 X149.896 Y122.229 E.0054
; LINE_WIDTH: 0.266777
G1 X150.004 Y122.446 E.00441
; LINE_WIDTH: 0.217033
G1 X150.112 Y122.662 E.00343
; LINE_WIDTH: 0.192342
G1 X150.112 Y133.338 E.12998
; LINE_WIDTH: 0.217451
G1 X150.004 Y133.554 E.00344
; LINE_WIDTH: 0.267319
G1 X149.896 Y133.771 E.00442
; LINE_WIDTH: 0.317186
G1 X149.788 Y133.987 E.00541
M204 S10000
G1 X150.187 Y133.662 F42000
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X145.013 Y133.662 E.27384
M204 S10000
G1 X145.087 Y133.338 F42000
; LINE_WIDTH: 0.217524
G1 F8520
M204 S6000
G1 X145.196 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X145.304 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X145.412 Y133.987 E.00541
; OBJECT_ID: 405
; WIPE_START
G1 F13120.648
G1 X145.304 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z6.6 I.612 J-1.052 P1  F42000
G1 X126.565 Y122.866 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8520
M204 S6000
G1 X130.234 Y122.866 E.12171
G1 X130.234 Y133.134 E.34062
G1 X125.766 Y133.134 E.14822
G1 X125.766 Y122.866 E.34062
G1 X126.505 Y122.866 E.02452
M204 S10000
G1 X126.565 Y123.273 F42000
G1 F8520
M204 S6000
G1 X129.827 Y123.273 E.10821
G1 X129.827 Y132.727 E.31361
G1 X126.173 Y132.727 E.12121
G1 X126.173 Y123.273 E.31361
G1 X126.505 Y123.273 E.01102
M204 S250
G1 X126.565 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8520
M204 S5000
G1 X129.435 Y123.665 E.08819
G1 X129.435 Y132.335 E.2664
G1 X126.565 Y132.335 E.08819
G1 X126.565 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.565 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.243 Y130.954 Z6.6 F42000
G1 X125.209 Y134.191 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8520
M204 S6000
G1 X125.209 Y122.61 E.38417
G1 X125.209 Y122.21 E.01327
G1 F5503.149
G1 X125.209 Y121.81 E.01327
G1 F2159.498
G1 X125.267 Y121.81 E.00194
M106 S255
G1 F1800
G1 X125.65 Y121.81 E.01269
M106 S201.45
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X130.35 Y121.809 E.15591
M106 S201.45
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X130.732 Y121.809 E.01269
M106 S201.45
G1 F2156.601
G1 X130.79 Y121.809 E.00192
G1 F5498.524
G1 X130.79 Y122.209 E.01327
G1 F8520
G1 X130.79 Y122.609 E.01327
G1 X130.791 Y133.39 E.35763
G1 X130.791 Y133.79 E.01327
G1 F5502.841
G1 X130.791 Y134.19 E.01327
G1 F2159.305
G1 X130.732 Y134.19 E.00194
M106 S255
G1 F1800
G1 X130.35 Y134.19 E.01269
M106 S201.45
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X125.65 Y134.191 E.15591
M106 S201.45
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X125.269 Y134.191 E.01263
M106 S201.45
M204 S10000
G1 X124.802 Y134.598 F42000
G1 F8520
M204 S6000
G1 X124.802 Y121.403 E.43772
G1 X131.197 Y121.402 E.21215
G1 X131.198 Y134.597 E.43771
G1 X124.862 Y134.598 E.21017
M204 S250
G1 X124.41 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8520
M204 S5000
G1 X124.41 Y121.211 E.41729
G3 X124.593 Y121.01 I.192 J-.009 E.00929
G1 X131.436 Y121.014 E.21024
G3 X131.59 Y121.196 I-.04 J.19 E.00788
G1 X131.589 Y134.817 E.41853
G3 X131.407 Y134.99 I-.194 J-.022 E.00838
G1 X124.611 Y134.99 E.2088
G3 X124.418 Y134.852 I-.009 J-.192 E.00788
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.417 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.413 Y133.662 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X130.587 Y133.662 E.27384
M204 S10000
G1 X130.188 Y133.987 F42000
; LINE_WIDTH: 0.317186
G1 F8520
M204 S6000
G1 X130.296 Y133.771 E.00541
; LINE_WIDTH: 0.267319
G1 X130.404 Y133.554 E.00442
; LINE_WIDTH: 0.217451
G1 X130.512 Y133.338 E.00344
; LINE_WIDTH: 0.192342
G1 X130.512 Y122.662 E.12998
; LINE_WIDTH: 0.217033
G1 X130.404 Y122.446 E.00343
; LINE_WIDTH: 0.266777
G1 X130.296 Y122.229 E.00441
; LINE_WIDTH: 0.316522
G1 X130.188 Y122.013 E.0054
M204 S10000
G1 X130.587 Y122.338 F42000
; LINE_WIDTH: 0.692189
G1 F5544.704
M204 S6000
G1 X125.413 Y122.338 E.27375
M204 S10000
G1 X125.812 Y122.013 F42000
; LINE_WIDTH: 0.317297
G1 F8520
M204 S6000
G1 X125.704 Y122.23 E.00541
; LINE_WIDTH: 0.26741
G1 X125.596 Y122.446 E.00443
; LINE_WIDTH: 0.193133
G1 X125.487 Y122.662 E.00296
G1 X125.487 Y133.338 E.13067
; LINE_WIDTH: 0.217524
G1 X125.596 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X125.704 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X125.812 Y133.987 E.00541
; OBJECT_ID: 394
; WIPE_START
G1 F13120.648
G1 X125.704 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z6.6 I.612 J-1.052 P1  F42000
G1 X106.965 Y122.866 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8520
M204 S6000
G1 X110.634 Y122.866 E.12171
G1 X110.634 Y133.134 E.34062
G1 X106.166 Y133.134 E.14822
G1 X106.166 Y122.866 E.34062
G1 X106.905 Y122.866 E.02452
M204 S10000
G1 X106.965 Y123.273 F42000
G1 F8520
M204 S6000
G1 X110.227 Y123.273 E.10821
G1 X110.227 Y132.727 E.31361
G1 X106.573 Y132.727 E.12121
G1 X106.573 Y123.273 E.31361
G1 X106.905 Y123.273 E.01102
M204 S250
G1 X106.965 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8520
M204 S5000
G1 X109.835 Y123.665 E.08819
G1 X109.835 Y132.335 E.2664
G1 X106.965 Y132.335 E.08819
G1 X106.965 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X108.965 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.643 Y130.954 Z6.6 F42000
G1 X105.609 Y134.191 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8520
M204 S6000
G1 X105.609 Y122.61 E.38417
G1 X105.609 Y122.21 E.01327
G1 F5503.149
G1 X105.609 Y121.81 E.01327
G1 F2159.498
G1 X105.668 Y121.81 E.00194
M106 S255
G1 F1800
G1 X106.05 Y121.81 E.01269
M106 S201.45
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X110.75 Y121.809 E.15591
M106 S201.45
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X111.133 Y121.809 E.01269
M106 S201.45
G1 F2156.601
G1 X111.19 Y121.809 E.00192
G1 F5498.524
G1 X111.19 Y122.209 E.01327
G1 F8520
G1 X111.19 Y122.609 E.01327
G1 X111.191 Y133.39 E.35763
G1 X111.191 Y133.79 E.01327
G1 F5502.841
G1 X111.191 Y134.19 E.01327
G1 F2159.305
G1 X111.133 Y134.19 E.00194
M106 S255
G1 F1800
G1 X110.75 Y134.19 E.01269
M106 S201.45
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X106.05 Y134.191 E.15591
M106 S201.45
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X105.669 Y134.191 E.01263
M106 S201.45
M204 S10000
G1 X105.202 Y134.598 F42000
G1 F8520
M204 S6000
G1 X105.202 Y121.403 E.43772
G1 X111.597 Y121.402 E.21215
G1 X111.598 Y134.597 E.43771
G1 X105.262 Y134.598 E.21017
M204 S250
G1 X104.81 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8520
M204 S5000
G1 X104.81 Y121.211 E.41729
G3 X104.993 Y121.01 I.192 J-.009 E.00929
G1 X111.836 Y121.014 E.21024
G3 X111.99 Y121.196 I-.04 J.19 E.00788
G1 X111.989 Y134.817 E.41853
G3 X111.807 Y134.99 I-.194 J-.022 E.00838
G1 X105.011 Y134.99 E.2088
G3 X104.818 Y134.852 I-.009 J-.192 E.00788
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.817 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.813 Y133.662 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X110.987 Y133.662 E.27384
M204 S10000
G1 X110.588 Y133.987 F42000
; LINE_WIDTH: 0.317186
G1 F8520
M204 S6000
G1 X110.696 Y133.771 E.00541
; LINE_WIDTH: 0.267319
G1 X110.804 Y133.554 E.00442
; LINE_WIDTH: 0.217451
G1 X110.912 Y133.338 E.00344
; LINE_WIDTH: 0.192342
G1 X110.912 Y122.662 E.12998
; LINE_WIDTH: 0.217033
G1 X110.804 Y122.446 E.00343
; LINE_WIDTH: 0.266777
G1 X110.696 Y122.229 E.00441
; LINE_WIDTH: 0.316522
G1 X110.588 Y122.013 E.0054
M204 S10000
G1 X110.987 Y122.338 F42000
; LINE_WIDTH: 0.692189
G1 F5544.704
M204 S6000
G1 X105.813 Y122.338 E.27375
M204 S10000
G1 X106.212 Y122.013 F42000
; LINE_WIDTH: 0.317297
G1 F8520
M204 S6000
G1 X106.104 Y122.23 E.00541
; LINE_WIDTH: 0.26741
G1 X105.996 Y122.446 E.00443
; LINE_WIDTH: 0.193133
G1 X105.887 Y122.662 E.00296
G1 X105.887 Y133.338 E.13067
; LINE_WIDTH: 0.217524
G1 X105.996 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X106.104 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X106.212 Y133.987 E.00541
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F13120.648
G1 X106.104 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 32/73
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z6.6 I.32 J1.174 P1  F42000
G1 X146.165 Y122.866 Z6.6
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7612
M204 S6000
G1 X149.834 Y122.866 E.12171
G1 X149.834 Y133.134 E.34062
G1 X145.366 Y133.134 E.14822
G1 X145.366 Y122.866 E.34062
G1 X146.105 Y122.866 E.02452
M204 S10000
G1 X146.165 Y123.273 F42000
G1 F7612
M204 S6000
G1 X149.427 Y123.273 E.10821
G1 X149.427 Y132.727 E.31361
G1 X145.773 Y132.727 E.12121
G1 X145.773 Y123.273 E.31361
G1 X146.105 Y123.273 E.01102
M204 S250
G1 X146.165 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7612
M204 S5000
G1 X149.035 Y123.665 E.08819
G1 X149.035 Y132.335 E.2664
G1 X146.165 Y132.335 E.08819
G1 X146.165 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.165 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.843 Y130.954 Z6.8 F42000
G1 X144.809 Y134.191 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7612
M204 S6000
G1 X144.809 Y121.81 E.41071
G1 X150.39 Y121.809 E.18514
G1 X150.391 Y134.19 E.4107
G1 X144.869 Y134.191 E.18317
M204 S10000
G1 X144.402 Y134.598 F42000
G1 F7612
M204 S6000
G1 X144.402 Y121.403 E.43772
G1 X150.797 Y121.402 E.21215
G1 X150.798 Y134.597 E.43771
G1 X144.462 Y134.598 E.21017
M204 S250
G1 X144.01 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7612
M204 S5000
G1 X144.018 Y121.147 E.41926
G3 X144.193 Y121.01 I.185 J.056 E.00729
G1 X151.036 Y121.014 E.21025
G3 X151.19 Y121.196 I-.04 J.19 E.00788
G1 X151.189 Y134.816 E.41851
G3 X151.008 Y134.99 I-.194 J-.022 E.00836
G1 X144.184 Y134.989 E.20968
G3 X144.019 Y134.851 I.023 J-.196 E.00699
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.019 Y132.851 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 32 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.8
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer32 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X145.087 Y133.338 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.193133
G1 F7612
M204 S6000
G1 X145.087 Y122.662 E.13067
G1 X145.196 Y122.446 E.00296
; LINE_WIDTH: 0.26741
G1 X145.304 Y122.23 E.00443
; LINE_WIDTH: 0.317297
G1 X145.412 Y122.013 E.00541
M204 S10000
G1 X145.013 Y122.338 F42000
; LINE_WIDTH: 0.692199
G1 F5544.614
M204 S6000
G1 X150.187 Y122.338 E.27376
M204 S10000
G1 X149.788 Y122.013 F42000
; LINE_WIDTH: 0.316522
G1 F7612
M204 S6000
G1 X149.896 Y122.229 E.0054
; LINE_WIDTH: 0.266777
G1 X150.004 Y122.446 E.00441
; LINE_WIDTH: 0.217033
G1 X150.112 Y122.662 E.00343
; LINE_WIDTH: 0.192342
G1 X150.112 Y133.338 E.12998
; LINE_WIDTH: 0.217451
G1 X150.004 Y133.554 E.00344
; LINE_WIDTH: 0.267319
G1 X149.896 Y133.771 E.00442
; LINE_WIDTH: 0.317186
G1 X149.788 Y133.987 E.00541
M204 S10000
G1 X150.187 Y133.662 F42000
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X145.013 Y133.662 E.27384
M204 S10000
G1 X145.087 Y133.338 F42000
; LINE_WIDTH: 0.217524
G1 F7612
M204 S6000
G1 X145.196 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X145.304 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X145.412 Y133.987 E.00541
; OBJECT_ID: 405
; WIPE_START
G1 F13120.648
G1 X145.304 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z6.8 I.612 J-1.052 P1  F42000
G1 X126.565 Y122.866 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7612
M204 S6000
G1 X130.234 Y122.866 E.12171
G1 X130.234 Y133.134 E.34062
G1 X125.766 Y133.134 E.14822
G1 X125.766 Y122.866 E.34062
G1 X126.505 Y122.866 E.02452
M204 S10000
G1 X126.565 Y123.273 F42000
G1 F7612
M204 S6000
G1 X129.827 Y123.273 E.10821
G1 X129.827 Y132.727 E.31361
G1 X126.173 Y132.727 E.12121
G1 X126.173 Y123.273 E.31361
G1 X126.505 Y123.273 E.01102
M204 S250
M73 P61 R8
G1 X126.565 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7612
M204 S5000
G1 X129.435 Y123.665 E.08819
G1 X129.435 Y132.335 E.2664
G1 X126.565 Y132.335 E.08819
G1 X126.565 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.565 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.243 Y130.954 Z6.8 F42000
G1 X125.209 Y134.191 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7612
M204 S6000
G1 X125.209 Y121.81 E.41071
G1 X130.79 Y121.809 E.18514
G1 X130.791 Y134.19 E.4107
G1 X125.269 Y134.191 E.18317
M204 S10000
G1 X124.802 Y134.598 F42000
G1 F7612
M204 S6000
G1 X124.802 Y121.403 E.43772
G1 X131.197 Y121.402 E.21215
G1 X131.198 Y134.597 E.43771
G1 X124.862 Y134.598 E.21017
M204 S250
G1 X124.41 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7612
M204 S5000
G1 X124.418 Y121.147 E.41926
G3 X124.593 Y121.01 I.185 J.056 E.00729
G1 X131.436 Y121.014 E.21025
G3 X131.59 Y121.196 I-.04 J.19 E.00788
G1 X131.589 Y134.816 E.41851
G3 X131.408 Y134.99 I-.194 J-.022 E.00836
G1 X124.584 Y134.989 E.20968
G3 X124.419 Y134.851 I.023 J-.196 E.00699
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.419 Y132.851 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.413 Y133.662 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X130.587 Y133.662 E.27384
M204 S10000
G1 X130.188 Y133.987 F42000
; LINE_WIDTH: 0.317186
G1 F7612
M204 S6000
G1 X130.296 Y133.771 E.00541
; LINE_WIDTH: 0.267319
G1 X130.404 Y133.554 E.00442
; LINE_WIDTH: 0.217451
G1 X130.512 Y133.338 E.00344
; LINE_WIDTH: 0.192342
G1 X130.512 Y122.662 E.12998
; LINE_WIDTH: 0.217033
G1 X130.404 Y122.446 E.00343
; LINE_WIDTH: 0.266777
G1 X130.296 Y122.229 E.00441
; LINE_WIDTH: 0.316522
G1 X130.188 Y122.013 E.0054
M204 S10000
G1 X130.587 Y122.338 F42000
; LINE_WIDTH: 0.692199
G1 F5544.614
M204 S6000
G1 X125.413 Y122.338 E.27376
M204 S10000
G1 X125.812 Y122.013 F42000
; LINE_WIDTH: 0.317297
G1 F7612
M204 S6000
G1 X125.704 Y122.23 E.00541
; LINE_WIDTH: 0.26741
G1 X125.596 Y122.446 E.00443
; LINE_WIDTH: 0.193133
G1 X125.487 Y122.662 E.00296
G1 X125.487 Y133.338 E.13067
; LINE_WIDTH: 0.217524
G1 X125.596 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X125.704 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X125.812 Y133.987 E.00541
; OBJECT_ID: 394
; WIPE_START
G1 F13120.648
G1 X125.704 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z6.8 I.612 J-1.052 P1  F42000
G1 X106.965 Y122.866 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7612
M204 S6000
G1 X110.634 Y122.866 E.12171
G1 X110.634 Y133.134 E.34062
G1 X106.166 Y133.134 E.14822
G1 X106.166 Y122.866 E.34062
G1 X106.905 Y122.866 E.02452
M204 S10000
G1 X106.965 Y123.273 F42000
G1 F7612
M204 S6000
G1 X110.227 Y123.273 E.10821
G1 X110.227 Y132.727 E.31361
G1 X106.573 Y132.727 E.12121
G1 X106.573 Y123.273 E.31361
G1 X106.905 Y123.273 E.01102
M204 S250
G1 X106.965 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7612
M204 S5000
G1 X109.835 Y123.665 E.08819
G1 X109.835 Y132.335 E.2664
G1 X106.965 Y132.335 E.08819
G1 X106.965 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X108.965 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.643 Y130.954 Z6.8 F42000
G1 X105.609 Y134.191 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7612
M204 S6000
G1 X105.609 Y121.81 E.41071
G1 X111.19 Y121.809 E.18514
G1 X111.191 Y134.19 E.4107
G1 X105.669 Y134.191 E.18317
M204 S10000
G1 X105.202 Y134.598 F42000
G1 F7612
M204 S6000
G1 X105.202 Y121.403 E.43772
G1 X111.597 Y121.402 E.21215
G1 X111.598 Y134.597 E.43771
G1 X105.262 Y134.598 E.21017
M204 S250
G1 X104.81 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7612
M204 S5000
G1 X104.818 Y121.147 E.41926
G3 X104.993 Y121.01 I.185 J.056 E.00729
G1 X111.836 Y121.014 E.21025
G3 X111.99 Y121.196 I-.04 J.19 E.00788
G1 X111.989 Y134.816 E.41851
G3 X111.808 Y134.99 I-.194 J-.022 E.00836
G1 X104.984 Y134.989 E.20968
G3 X104.819 Y134.851 I.023 J-.196 E.00699
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.819 Y132.851 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.813 Y133.662 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X110.987 Y133.662 E.27384
M204 S10000
G1 X110.588 Y133.987 F42000
; LINE_WIDTH: 0.317186
G1 F7612
M204 S6000
G1 X110.696 Y133.771 E.00541
; LINE_WIDTH: 0.267319
G1 X110.804 Y133.554 E.00442
; LINE_WIDTH: 0.217451
G1 X110.912 Y133.338 E.00344
; LINE_WIDTH: 0.192342
G1 X110.912 Y122.662 E.12998
; LINE_WIDTH: 0.217033
G1 X110.804 Y122.446 E.00343
; LINE_WIDTH: 0.266777
G1 X110.696 Y122.229 E.00441
; LINE_WIDTH: 0.316522
G1 X110.588 Y122.013 E.0054
M204 S10000
G1 X110.987 Y122.338 F42000
; LINE_WIDTH: 0.692199
G1 F5544.614
M204 S6000
G1 X105.813 Y122.338 E.27376
M204 S10000
G1 X106.212 Y122.013 F42000
; LINE_WIDTH: 0.317297
G1 F7612
M204 S6000
G1 X106.104 Y122.23 E.00541
; LINE_WIDTH: 0.26741
G1 X105.996 Y122.446 E.00443
; LINE_WIDTH: 0.193133
G1 X105.887 Y122.662 E.00296
G1 X105.887 Y133.338 E.13067
; LINE_WIDTH: 0.217524
G1 X105.996 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X106.104 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X106.212 Y133.987 E.00541
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F13120.648
G1 X106.104 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 33/73
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z6.8 I.32 J1.174 P1  F42000
G1 X146.165 Y122.866 Z6.8
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7612
M204 S6000
G1 X149.834 Y122.866 E.12171
G1 X149.834 Y133.134 E.34062
G1 X145.366 Y133.134 E.14822
G1 X145.366 Y122.866 E.34062
G1 X146.105 Y122.866 E.02452
M204 S10000
G1 X146.165 Y123.273 F42000
G1 F7612
M204 S6000
G1 X149.427 Y123.273 E.10821
G1 X149.427 Y132.727 E.31361
G1 X145.773 Y132.727 E.12121
G1 X145.773 Y123.273 E.31361
G1 X146.105 Y123.273 E.01102
M204 S250
G1 X146.165 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7612
M204 S5000
G1 X149.035 Y123.665 E.08819
G1 X149.035 Y132.335 E.2664
G1 X146.165 Y132.335 E.08819
G1 X146.165 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.165 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.843 Y130.954 Z7 F42000
G1 X144.809 Y134.191 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7612
M204 S6000
G1 X144.809 Y121.81 E.41071
G1 X150.39 Y121.809 E.18514
G1 X150.391 Y134.19 E.4107
G1 X144.869 Y134.191 E.18317
M204 S10000
G1 X144.402 Y134.598 F42000
G1 F7612
M204 S6000
G1 X144.402 Y121.403 E.43772
G1 X150.797 Y121.402 E.21215
G1 X150.798 Y134.597 E.43771
G1 X144.462 Y134.598 E.21017
M204 S250
G1 X144.01 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7612
M204 S5000
G1 X144.01 Y121.212 E.41728
G3 X144.192 Y121.01 I.192 J-.009 E.00927
G1 X151.036 Y121.014 E.21027
G3 X151.19 Y121.196 I-.04 J.19 E.00787
G1 X151.189 Y134.817 E.41854
G3 X151.007 Y134.99 I-.194 J-.023 E.00837
G1 X144.212 Y134.99 E.20879
G3 X144.018 Y134.852 I-.009 J-.193 E.00788
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.017 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 33 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer33 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X145.087 Y133.338 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.193133
G1 F7612
M204 S6000
G1 X145.087 Y122.662 E.13067
G1 X145.196 Y122.446 E.00296
; LINE_WIDTH: 0.26741
G1 X145.304 Y122.229 E.00443
; LINE_WIDTH: 0.317297
G1 X145.412 Y122.013 E.00541
M204 S10000
G1 X145.013 Y122.338 F42000
; LINE_WIDTH: 0.692208
G1 F5544.534
M204 S6000
G1 X150.187 Y122.338 E.27376
M204 S10000
G1 X149.788 Y122.013 F42000
; LINE_WIDTH: 0.316522
G1 F7612
M204 S6000
G1 X149.896 Y122.229 E.0054
; LINE_WIDTH: 0.266777
G1 X150.004 Y122.446 E.00441
; LINE_WIDTH: 0.217033
G1 X150.112 Y122.662 E.00343
; LINE_WIDTH: 0.192342
G1 X150.112 Y133.338 E.12998
; LINE_WIDTH: 0.217451
G1 X150.004 Y133.554 E.00344
; LINE_WIDTH: 0.267319
G1 X149.896 Y133.771 E.00442
; LINE_WIDTH: 0.317186
G1 X149.788 Y133.987 E.00541
M204 S10000
G1 X150.187 Y133.662 F42000
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X145.013 Y133.662 E.27384
M204 S10000
G1 X145.087 Y133.338 F42000
; LINE_WIDTH: 0.217524
G1 F7612
M204 S6000
G1 X145.196 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X145.304 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X145.412 Y133.987 E.00541
; OBJECT_ID: 405
; WIPE_START
G1 F13120.648
G1 X145.304 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z7 I.612 J-1.052 P1  F42000
G1 X126.565 Y122.866 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7612
M204 S6000
G1 X130.234 Y122.866 E.12171
G1 X130.234 Y133.134 E.34062
G1 X125.766 Y133.134 E.14822
G1 X125.766 Y122.866 E.34062
G1 X126.505 Y122.866 E.02452
M204 S10000
G1 X126.565 Y123.273 F42000
G1 F7612
M204 S6000
G1 X129.827 Y123.273 E.10821
G1 X129.827 Y132.727 E.31361
G1 X126.173 Y132.727 E.12121
G1 X126.173 Y123.273 E.31361
G1 X126.505 Y123.273 E.01102
M204 S250
G1 X126.565 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7612
M204 S5000
G1 X129.435 Y123.665 E.08819
G1 X129.435 Y132.335 E.2664
G1 X126.565 Y132.335 E.08819
G1 X126.565 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.565 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.243 Y130.954 Z7 F42000
G1 X125.209 Y134.191 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7612
M204 S6000
G1 X125.209 Y121.81 E.41071
G1 X130.79 Y121.809 E.18514
G1 X130.791 Y134.19 E.4107
G1 X125.269 Y134.191 E.18317
M204 S10000
G1 X124.802 Y134.598 F42000
G1 F7612
M204 S6000
G1 X124.802 Y121.403 E.43772
G1 X131.197 Y121.402 E.21215
G1 X131.198 Y134.597 E.43771
G1 X124.862 Y134.598 E.21017
M204 S250
G1 X124.41 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7612
M204 S5000
G1 X124.41 Y121.212 E.41728
G3 X124.592 Y121.01 I.192 J-.009 E.00927
G1 X131.436 Y121.014 E.21027
G3 X131.59 Y121.196 I-.04 J.19 E.00787
G1 X131.589 Y134.817 E.41854
G3 X131.407 Y134.99 I-.194 J-.023 E.00837
G1 X124.612 Y134.99 E.20879
G3 X124.418 Y134.852 I-.009 J-.193 E.00788
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.417 Y132.852 E-.76
; WIPE_END
M73 P62 R8
G1 E-.04 F1800
M204 S10000
G1 X125.413 Y133.662 Z7 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X130.587 Y133.662 E.27384
M204 S10000
G1 X130.188 Y133.987 F42000
; LINE_WIDTH: 0.317186
G1 F7612
M204 S6000
G1 X130.296 Y133.771 E.00541
; LINE_WIDTH: 0.267319
G1 X130.404 Y133.554 E.00442
; LINE_WIDTH: 0.217451
G1 X130.512 Y133.338 E.00344
; LINE_WIDTH: 0.192342
G1 X130.512 Y122.662 E.12998
; LINE_WIDTH: 0.217033
G1 X130.404 Y122.446 E.00343
; LINE_WIDTH: 0.266777
G1 X130.296 Y122.229 E.00441
; LINE_WIDTH: 0.316522
G1 X130.188 Y122.013 E.0054
M204 S10000
G1 X130.587 Y122.338 F42000
; LINE_WIDTH: 0.692208
G1 F5544.534
M204 S6000
G1 X125.413 Y122.338 E.27376
M204 S10000
G1 X125.812 Y122.013 F42000
; LINE_WIDTH: 0.317297
G1 F7612
M204 S6000
G1 X125.704 Y122.229 E.00541
; LINE_WIDTH: 0.26741
G1 X125.596 Y122.446 E.00443
; LINE_WIDTH: 0.193133
G1 X125.487 Y122.662 E.00296
G1 X125.487 Y133.338 E.13067
; LINE_WIDTH: 0.217524
G1 X125.596 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X125.704 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X125.812 Y133.987 E.00541
; OBJECT_ID: 394
; WIPE_START
G1 F13120.648
G1 X125.704 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z7 I.612 J-1.052 P1  F42000
G1 X106.965 Y122.866 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7612
M204 S6000
G1 X110.634 Y122.866 E.12171
G1 X110.634 Y133.134 E.34062
G1 X106.166 Y133.134 E.14822
G1 X106.166 Y122.866 E.34062
G1 X106.905 Y122.866 E.02452
M204 S10000
G1 X106.965 Y123.273 F42000
G1 F7612
M204 S6000
G1 X110.227 Y123.273 E.10821
G1 X110.227 Y132.727 E.31361
G1 X106.573 Y132.727 E.12121
G1 X106.573 Y123.273 E.31361
G1 X106.905 Y123.273 E.01102
M204 S250
G1 X106.965 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7612
M204 S5000
G1 X109.835 Y123.665 E.08819
G1 X109.835 Y132.335 E.2664
G1 X106.965 Y132.335 E.08819
G1 X106.965 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X108.965 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.643 Y130.954 Z7 F42000
G1 X105.609 Y134.191 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7612
M204 S6000
G1 X105.609 Y121.81 E.41071
G1 X111.19 Y121.809 E.18514
G1 X111.191 Y134.19 E.4107
G1 X105.669 Y134.191 E.18317
M204 S10000
G1 X105.202 Y134.598 F42000
G1 F7612
M204 S6000
G1 X105.202 Y121.403 E.43772
G1 X111.597 Y121.402 E.21215
G1 X111.598 Y134.597 E.43771
G1 X105.262 Y134.598 E.21017
M204 S250
G1 X104.81 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7612
M204 S5000
G1 X104.81 Y121.212 E.41728
G3 X104.992 Y121.01 I.192 J-.009 E.00927
G1 X111.836 Y121.014 E.21027
G3 X111.99 Y121.196 I-.04 J.19 E.00787
G1 X111.989 Y134.817 E.41854
G3 X111.807 Y134.99 I-.194 J-.023 E.00837
G1 X105.012 Y134.99 E.20879
G3 X104.818 Y134.852 I-.009 J-.193 E.00788
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.817 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.813 Y133.662 Z7 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X110.987 Y133.662 E.27384
M204 S10000
G1 X110.588 Y133.987 F42000
; LINE_WIDTH: 0.317186
G1 F7612
M204 S6000
G1 X110.696 Y133.771 E.00541
; LINE_WIDTH: 0.267319
G1 X110.804 Y133.554 E.00442
; LINE_WIDTH: 0.217451
G1 X110.912 Y133.338 E.00344
; LINE_WIDTH: 0.192342
G1 X110.912 Y122.662 E.12998
; LINE_WIDTH: 0.217033
G1 X110.804 Y122.446 E.00343
; LINE_WIDTH: 0.266777
G1 X110.696 Y122.229 E.00441
; LINE_WIDTH: 0.316522
G1 X110.588 Y122.013 E.0054
M204 S10000
G1 X110.987 Y122.338 F42000
; LINE_WIDTH: 0.692208
G1 F5544.534
M204 S6000
G1 X105.813 Y122.338 E.27376
M204 S10000
G1 X106.212 Y122.013 F42000
; LINE_WIDTH: 0.317297
G1 F7612
M204 S6000
G1 X106.104 Y122.229 E.00541
; LINE_WIDTH: 0.26741
G1 X105.996 Y122.446 E.00443
; LINE_WIDTH: 0.193133
G1 X105.887 Y122.662 E.00296
G1 X105.887 Y133.338 E.13067
; LINE_WIDTH: 0.217524
G1 X105.996 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X106.104 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X106.212 Y133.987 E.00541
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F13120.648
G1 X106.104 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 34/73
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z7 I.32 J1.174 P1  F42000
G1 X146.165 Y122.866 Z7
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X149.834 Y122.866 E.12171
G1 X149.834 Y133.134 E.34062
G1 X145.366 Y133.134 E.14822
G1 X145.366 Y122.866 E.34062
G1 X146.105 Y122.866 E.02452
M204 S10000
G1 X146.165 Y123.273 F42000
G1 F7581
M204 S6000
G1 X149.427 Y123.273 E.10821
G1 X149.427 Y132.727 E.31361
G1 X145.773 Y132.727 E.12121
G1 X145.773 Y123.273 E.31361
G1 X146.105 Y123.273 E.01102
M204 S250
G1 X146.165 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X149.035 Y123.665 E.08819
G1 X149.035 Y132.335 E.2664
G1 X146.165 Y132.335 E.08819
G1 X146.165 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.165 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.843 Y130.954 Z7.2 F42000
G1 X144.809 Y134.191 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X144.809 Y121.81 E.41071
G1 X150.39 Y121.809 E.18514
G1 X150.391 Y134.19 E.4107
G1 X144.869 Y134.191 E.18317
M204 S10000
G1 X144.402 Y134.598 F42000
G1 F7581
M204 S6000
G1 X144.402 Y121.403 E.43772
G1 X150.797 Y121.402 E.21215
G1 X150.798 Y134.597 E.43771
G1 X144.462 Y134.598 E.21017
M204 S250
G1 X144.01 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X144.018 Y121.147 E.41926
G3 X144.193 Y121.01 I.185 J.056 E.00729
G1 X151.036 Y121.014 E.21025
G3 X151.19 Y121.196 I-.04 J.19 E.00787
G1 X151.182 Y134.853 E.41963
G3 X151.007 Y134.99 I-.185 J-.056 E.00729
G1 X144.184 Y134.989 E.20965
G3 X144.019 Y134.851 I.022 J-.195 E.007
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.018 Y132.851 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 34 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.2
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer34 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X145.087 Y133.338 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.193133
G1 F7581
M204 S6000
G1 X145.087 Y122.662 E.13067
G1 X145.196 Y122.446 E.00296
; LINE_WIDTH: 0.26741
G1 X145.304 Y122.229 E.00443
; LINE_WIDTH: 0.317297
G1 X145.412 Y122.013 E.00541
M204 S10000
G1 X145.013 Y122.338 F42000
; LINE_WIDTH: 0.692219
G1 F5544.443
M204 S6000
G1 X150.187 Y122.338 E.27377
M204 S10000
G1 X149.788 Y122.013 F42000
; LINE_WIDTH: 0.316522
G1 F7581
M204 S6000
G1 X149.896 Y122.229 E.0054
; LINE_WIDTH: 0.266777
G1 X150.004 Y122.446 E.00441
; LINE_WIDTH: 0.217033
G1 X150.112 Y122.662 E.00343
; LINE_WIDTH: 0.192342
G1 X150.112 Y133.338 E.12998
; LINE_WIDTH: 0.217451
G1 X150.004 Y133.554 E.00344
; LINE_WIDTH: 0.267319
G1 X149.896 Y133.771 E.00442
; LINE_WIDTH: 0.317186
G1 X149.788 Y133.987 E.00541
M204 S10000
G1 X150.187 Y133.662 F42000
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X145.013 Y133.662 E.27384
M204 S10000
G1 X145.087 Y133.338 F42000
; LINE_WIDTH: 0.217524
G1 F7581
M204 S6000
G1 X145.196 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X145.304 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X145.412 Y133.987 E.00541
; OBJECT_ID: 405
; WIPE_START
G1 F13120.648
G1 X145.304 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X138.707 Y129.932 Z7.2 F42000
G1 X126.565 Y122.866 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X130.234 Y122.866 E.12171
G1 X130.234 Y133.134 E.34062
G1 X125.766 Y133.134 E.14822
G1 X125.766 Y122.866 E.34062
G1 X126.505 Y122.866 E.02452
M204 S10000
G1 X126.565 Y123.273 F42000
G1 F7581
M204 S6000
G1 X129.827 Y123.273 E.10821
G1 X129.827 Y132.727 E.31361
G1 X126.173 Y132.727 E.12121
G1 X126.173 Y123.273 E.31361
G1 X126.505 Y123.273 E.01102
M204 S250
G1 X126.565 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X129.435 Y123.665 E.08819
G1 X129.435 Y132.335 E.2664
G1 X126.565 Y132.335 E.08819
G1 X126.565 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.565 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.243 Y130.954 Z7.2 F42000
G1 X125.209 Y134.191 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X125.209 Y121.81 E.41071
G1 X130.79 Y121.809 E.18514
G1 X130.791 Y134.19 E.4107
G1 X125.269 Y134.191 E.18317
M204 S10000
G1 X124.802 Y134.598 F42000
G1 F7581
M204 S6000
G1 X124.802 Y121.403 E.43772
G1 X131.197 Y121.402 E.21215
G1 X131.198 Y134.597 E.43771
G1 X124.862 Y134.598 E.21017
M204 S250
G1 X124.41 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X124.418 Y121.147 E.41926
G3 X124.593 Y121.01 I.185 J.056 E.00729
G1 X131.436 Y121.014 E.21025
G3 X131.59 Y121.196 I-.04 J.19 E.00787
G1 X131.582 Y134.853 E.41963
G3 X131.407 Y134.99 I-.185 J-.056 E.00729
G1 X124.584 Y134.989 E.20965
G3 X124.419 Y134.851 I.022 J-.195 E.007
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.418 Y132.851 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.413 Y133.662 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692334
M73 P63 R8
G1 F5543.461
M204 S6000
G1 X130.587 Y133.662 E.27384
M204 S10000
G1 X130.188 Y133.987 F42000
; LINE_WIDTH: 0.317186
G1 F7581
M204 S6000
G1 X130.296 Y133.771 E.00541
; LINE_WIDTH: 0.267319
G1 X130.404 Y133.554 E.00442
; LINE_WIDTH: 0.217451
G1 X130.512 Y133.338 E.00344
; LINE_WIDTH: 0.192342
G1 X130.512 Y122.662 E.12998
; LINE_WIDTH: 0.217033
G1 X130.404 Y122.446 E.00343
; LINE_WIDTH: 0.266777
G1 X130.296 Y122.229 E.00441
; LINE_WIDTH: 0.316522
G1 X130.188 Y122.013 E.0054
M204 S10000
G1 X130.587 Y122.338 F42000
; LINE_WIDTH: 0.692219
G1 F5544.443
M204 S6000
G1 X125.413 Y122.338 E.27377
M204 S10000
G1 X125.812 Y122.013 F42000
; LINE_WIDTH: 0.317297
G1 F7581
M204 S6000
G1 X125.704 Y122.229 E.00541
; LINE_WIDTH: 0.26741
G1 X125.596 Y122.446 E.00443
; LINE_WIDTH: 0.193133
G1 X125.487 Y122.662 E.00296
G1 X125.487 Y133.338 E.13067
; LINE_WIDTH: 0.217524
G1 X125.596 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X125.704 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X125.812 Y133.987 E.00541
; OBJECT_ID: 394
; WIPE_START
G1 F13120.648
G1 X125.704 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X119.107 Y129.932 Z7.2 F42000
G1 X106.965 Y122.866 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X110.634 Y122.866 E.12171
G1 X110.634 Y133.134 E.34062
G1 X106.166 Y133.134 E.14822
G1 X106.166 Y122.866 E.34062
G1 X106.905 Y122.866 E.02452
M204 S10000
G1 X106.965 Y123.273 F42000
G1 F7581
M204 S6000
G1 X110.227 Y123.273 E.10821
G1 X110.227 Y132.727 E.31361
G1 X106.573 Y132.727 E.12121
G1 X106.573 Y123.273 E.31361
G1 X106.905 Y123.273 E.01102
M204 S250
G1 X106.965 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X109.835 Y123.665 E.08819
G1 X109.835 Y132.335 E.2664
G1 X106.965 Y132.335 E.08819
G1 X106.965 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X108.965 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.643 Y130.954 Z7.2 F42000
G1 X105.609 Y134.191 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X105.609 Y121.81 E.41071
G1 X111.19 Y121.809 E.18514
G1 X111.191 Y134.19 E.4107
G1 X105.669 Y134.191 E.18317
M204 S10000
G1 X105.202 Y134.598 F42000
G1 F7581
M204 S6000
G1 X105.202 Y121.403 E.43772
G1 X111.597 Y121.402 E.21215
G1 X111.598 Y134.597 E.43771
G1 X105.262 Y134.598 E.21017
M204 S250
G1 X104.81 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X104.818 Y121.147 E.41926
G3 X104.993 Y121.01 I.185 J.056 E.00729
G1 X111.836 Y121.014 E.21025
G3 X111.99 Y121.196 I-.04 J.19 E.00787
G1 X111.982 Y134.853 E.41963
G3 X111.807 Y134.99 I-.185 J-.056 E.00729
G1 X104.984 Y134.989 E.20965
G3 X104.819 Y134.851 I.022 J-.195 E.007
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.818 Y132.851 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.813 Y133.662 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X110.987 Y133.662 E.27384
M204 S10000
G1 X110.588 Y133.987 F42000
; LINE_WIDTH: 0.317186
G1 F7581
M204 S6000
G1 X110.696 Y133.771 E.00541
; LINE_WIDTH: 0.267319
G1 X110.804 Y133.554 E.00442
; LINE_WIDTH: 0.217451
G1 X110.912 Y133.338 E.00344
; LINE_WIDTH: 0.192342
G1 X110.912 Y122.662 E.12998
; LINE_WIDTH: 0.217033
G1 X110.804 Y122.446 E.00343
; LINE_WIDTH: 0.266777
G1 X110.696 Y122.229 E.00441
; LINE_WIDTH: 0.316522
G1 X110.588 Y122.013 E.0054
M204 S10000
G1 X110.987 Y122.338 F42000
; LINE_WIDTH: 0.692219
G1 F5544.443
M204 S6000
G1 X105.813 Y122.338 E.27377
M204 S10000
G1 X106.212 Y122.013 F42000
; LINE_WIDTH: 0.317297
G1 F7581
M204 S6000
G1 X106.104 Y122.229 E.00541
; LINE_WIDTH: 0.26741
G1 X105.996 Y122.446 E.00443
; LINE_WIDTH: 0.193133
G1 X105.887 Y122.662 E.00296
G1 X105.887 Y133.338 E.13067
; LINE_WIDTH: 0.217524
G1 X105.996 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X106.104 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X106.212 Y133.987 E.00541
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F13120.648
G1 X106.104 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 35/73
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z7.2 I.32 J1.174 P1  F42000
G1 X146.165 Y122.866 Z7.2
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X149.834 Y122.866 E.12171
G1 X149.834 Y133.134 E.34062
G1 X145.366 Y133.134 E.14822
G1 X145.366 Y122.866 E.34062
G1 X146.105 Y122.866 E.02452
M204 S10000
G1 X146.165 Y123.273 F42000
G1 F7581
M204 S6000
G1 X149.427 Y123.273 E.10821
G1 X149.427 Y132.727 E.31361
G1 X145.773 Y132.727 E.12121
G1 X145.773 Y123.273 E.31361
G1 X146.105 Y123.273 E.01102
M204 S250
G1 X146.165 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X149.035 Y123.665 E.08819
G1 X149.035 Y132.335 E.2664
G1 X146.165 Y132.335 E.08819
G1 X146.165 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.165 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.843 Y130.954 Z7.4 F42000
G1 X144.809 Y134.191 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X144.809 Y121.81 E.41071
G1 X150.39 Y121.809 E.18514
G1 X150.391 Y134.19 E.4107
G1 X144.869 Y134.191 E.18317
M204 S10000
G1 X144.402 Y134.598 F42000
G1 F7581
M204 S6000
G1 X144.402 Y121.403 E.43772
G1 X150.797 Y121.402 E.21215
G1 X150.798 Y134.597 E.43771
G1 X144.462 Y134.598 E.21017
M204 S250
G1 X144.01 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X144.01 Y121.212 E.41729
G3 X144.193 Y121.01 I.191 J-.01 E.00931
G1 X151.036 Y121.014 E.21025
G3 X151.19 Y121.196 I-.04 J.19 E.00787
G1 X151.189 Y134.816 E.41851
G3 X151.008 Y134.99 I-.194 J-.022 E.00836
G1 X144.212 Y134.99 E.20883
G3 X144.018 Y134.852 I-.007 J-.194 E.00785
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.017 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 35 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.4
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer35 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X145.087 Y133.338 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.193133
G1 F7581
M204 S6000
G1 X145.087 Y122.662 E.13067
G1 X145.196 Y122.446 E.00296
; LINE_WIDTH: 0.26741
G1 X145.304 Y122.229 E.00443
; LINE_WIDTH: 0.317297
G1 X145.412 Y122.013 E.00541
M204 S10000
G1 X145.013 Y122.338 F42000
; LINE_WIDTH: 0.692208
G1 F5544.534
M204 S6000
G1 X150.187 Y122.338 E.27376
M204 S10000
G1 X149.788 Y122.013 F42000
; LINE_WIDTH: 0.316522
G1 F7581
M204 S6000
G1 X149.896 Y122.229 E.0054
; LINE_WIDTH: 0.266777
G1 X150.004 Y122.446 E.00441
; LINE_WIDTH: 0.217033
G1 X150.112 Y122.662 E.00343
; LINE_WIDTH: 0.192342
G1 X150.112 Y133.338 E.12998
; LINE_WIDTH: 0.217451
G1 X150.004 Y133.554 E.00344
; LINE_WIDTH: 0.267319
G1 X149.896 Y133.771 E.00442
; LINE_WIDTH: 0.317186
G1 X149.788 Y133.987 E.00541
M204 S10000
G1 X150.187 Y133.662 F42000
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X145.013 Y133.662 E.27384
M204 S10000
G1 X145.087 Y133.338 F42000
; LINE_WIDTH: 0.217524
G1 F7581
M204 S6000
G1 X145.196 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X145.304 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X145.412 Y133.987 E.00541
; OBJECT_ID: 405
; WIPE_START
G1 F13120.648
G1 X145.304 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X138.707 Y129.932 Z7.4 F42000
G1 X126.565 Y122.866 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X130.234 Y122.866 E.12171
G1 X130.234 Y133.134 E.34062
G1 X125.766 Y133.134 E.14822
G1 X125.766 Y122.866 E.34062
G1 X126.505 Y122.866 E.02452
M204 S10000
G1 X126.565 Y123.273 F42000
G1 F7581
M204 S6000
G1 X129.827 Y123.273 E.10821
G1 X129.827 Y132.727 E.31361
G1 X126.173 Y132.727 E.12121
G1 X126.173 Y123.273 E.31361
G1 X126.505 Y123.273 E.01102
M204 S250
G1 X126.565 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X129.435 Y123.665 E.08819
G1 X129.435 Y132.335 E.2664
G1 X126.565 Y132.335 E.08819
G1 X126.565 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.565 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.243 Y130.954 Z7.4 F42000
G1 X125.209 Y134.191 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X125.209 Y121.81 E.41071
M73 P63 R7
G1 X130.79 Y121.809 E.18514
G1 X130.791 Y134.19 E.4107
G1 X125.269 Y134.191 E.18317
M204 S10000
G1 X124.802 Y134.598 F42000
G1 F7581
M204 S6000
G1 X124.802 Y121.403 E.43772
G1 X131.197 Y121.402 E.21215
G1 X131.198 Y134.597 E.43771
G1 X124.862 Y134.598 E.21017
M204 S250
G1 X124.41 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X124.41 Y121.212 E.41729
G3 X124.593 Y121.01 I.191 J-.01 E.00931
G1 X131.436 Y121.014 E.21025
G3 X131.59 Y121.196 I-.04 J.19 E.00787
G1 X131.589 Y134.816 E.41851
G3 X131.408 Y134.99 I-.194 J-.022 E.00836
G1 X124.612 Y134.99 E.20883
G3 X124.418 Y134.852 I-.007 J-.194 E.00785
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.417 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.413 Y133.662 Z7.4 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X130.587 Y133.662 E.27384
M204 S10000
G1 X130.188 Y133.987 F42000
; LINE_WIDTH: 0.317186
G1 F7581
M204 S6000
G1 X130.296 Y133.771 E.00541
; LINE_WIDTH: 0.267319
G1 X130.404 Y133.554 E.00442
; LINE_WIDTH: 0.217451
G1 X130.512 Y133.338 E.00344
; LINE_WIDTH: 0.192342
G1 X130.512 Y122.662 E.12998
; LINE_WIDTH: 0.217033
G1 X130.404 Y122.446 E.00343
; LINE_WIDTH: 0.266777
G1 X130.296 Y122.229 E.00441
; LINE_WIDTH: 0.316522
G1 X130.188 Y122.013 E.0054
M204 S10000
G1 X130.587 Y122.338 F42000
; LINE_WIDTH: 0.692208
G1 F5544.534
M204 S6000
G1 X125.413 Y122.338 E.27376
M204 S10000
G1 X125.812 Y122.013 F42000
; LINE_WIDTH: 0.317297
G1 F7581
M204 S6000
G1 X125.704 Y122.229 E.00541
; LINE_WIDTH: 0.26741
G1 X125.596 Y122.446 E.00443
; LINE_WIDTH: 0.193133
G1 X125.487 Y122.662 E.00296
G1 X125.487 Y133.338 E.13067
; LINE_WIDTH: 0.217524
G1 X125.596 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X125.704 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X125.812 Y133.987 E.00541
; OBJECT_ID: 394
; WIPE_START
G1 F13120.648
G1 X125.704 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X119.107 Y129.932 Z7.4 F42000
G1 X106.965 Y122.866 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X110.634 Y122.866 E.12171
G1 X110.634 Y133.134 E.34062
G1 X106.166 Y133.134 E.14822
G1 X106.166 Y122.866 E.34062
G1 X106.905 Y122.866 E.02452
M204 S10000
G1 X106.965 Y123.273 F42000
G1 F7581
M204 S6000
G1 X110.227 Y123.273 E.10821
G1 X110.227 Y132.727 E.31361
G1 X106.573 Y132.727 E.12121
G1 X106.573 Y123.273 E.31361
G1 X106.905 Y123.273 E.01102
M204 S250
G1 X106.965 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X109.835 Y123.665 E.08819
G1 X109.835 Y132.335 E.2664
G1 X106.965 Y132.335 E.08819
G1 X106.965 Y123.725 E.26456
; WIPE_START
M73 P64 R7
G1 F9547.055
M204 S6000
G1 X108.965 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.643 Y130.954 Z7.4 F42000
G1 X105.609 Y134.191 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X105.609 Y121.81 E.41071
G1 X111.19 Y121.809 E.18514
G1 X111.191 Y134.19 E.4107
G1 X105.669 Y134.191 E.18317
M204 S10000
G1 X105.202 Y134.598 F42000
G1 F7581
M204 S6000
G1 X105.202 Y121.403 E.43772
G1 X111.597 Y121.402 E.21215
G1 X111.598 Y134.597 E.43771
G1 X105.262 Y134.598 E.21017
M204 S250
G1 X104.81 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X104.81 Y121.212 E.41729
G3 X104.993 Y121.01 I.191 J-.01 E.00931
G1 X111.836 Y121.014 E.21025
G3 X111.99 Y121.196 I-.04 J.19 E.00787
G1 X111.989 Y134.816 E.41851
G3 X111.808 Y134.99 I-.194 J-.022 E.00836
G1 X105.012 Y134.99 E.20883
G3 X104.818 Y134.852 I-.007 J-.194 E.00785
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.817 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.813 Y133.662 Z7.4 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X110.987 Y133.662 E.27384
M204 S10000
G1 X110.588 Y133.987 F42000
; LINE_WIDTH: 0.317186
G1 F7581
M204 S6000
G1 X110.696 Y133.771 E.00541
; LINE_WIDTH: 0.267319
G1 X110.804 Y133.554 E.00442
; LINE_WIDTH: 0.217451
G1 X110.912 Y133.338 E.00344
; LINE_WIDTH: 0.192342
G1 X110.912 Y122.662 E.12998
; LINE_WIDTH: 0.217033
G1 X110.804 Y122.446 E.00343
; LINE_WIDTH: 0.266777
G1 X110.696 Y122.229 E.00441
; LINE_WIDTH: 0.316522
G1 X110.588 Y122.013 E.0054
M204 S10000
G1 X110.987 Y122.338 F42000
; LINE_WIDTH: 0.692208
G1 F5544.534
M204 S6000
G1 X105.813 Y122.338 E.27376
M204 S10000
G1 X106.212 Y122.013 F42000
; LINE_WIDTH: 0.317297
G1 F7581
M204 S6000
G1 X106.104 Y122.229 E.00541
; LINE_WIDTH: 0.26741
G1 X105.996 Y122.446 E.00443
; LINE_WIDTH: 0.193133
G1 X105.887 Y122.662 E.00296
G1 X105.887 Y133.338 E.13067
; LINE_WIDTH: 0.217524
G1 X105.996 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X106.104 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X106.212 Y133.987 E.00541
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F13120.648
G1 X106.104 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 36/73
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z7.4 I.32 J1.174 P1  F42000
G1 X146.165 Y122.866 Z7.4
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7580
M204 S6000
G1 X149.834 Y122.866 E.12171
G1 X149.834 Y133.134 E.34062
G1 X145.366 Y133.134 E.14822
G1 X145.366 Y122.866 E.34062
G1 X146.105 Y122.866 E.02452
M204 S10000
G1 X146.165 Y123.273 F42000
G1 F7580
M204 S6000
G1 X149.427 Y123.273 E.10821
G1 X149.427 Y132.727 E.31361
G1 X145.773 Y132.727 E.12121
G1 X145.773 Y123.273 E.31361
G1 X146.105 Y123.273 E.01102
M204 S250
G1 X146.165 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7580
M204 S5000
G1 X149.035 Y123.665 E.08819
G1 X149.035 Y132.335 E.2664
G1 X146.165 Y132.335 E.08819
G1 X146.165 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.165 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.843 Y130.954 Z7.6 F42000
G1 X144.809 Y134.191 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7580
M204 S6000
G1 X144.809 Y121.81 E.41071
G1 X150.39 Y121.809 E.18514
G1 X150.391 Y134.19 E.4107
G1 X144.869 Y134.191 E.18317
M204 S10000
G1 X144.402 Y134.598 F42000
G1 F7580
M204 S6000
G1 X144.402 Y121.403 E.43772
G1 X150.797 Y121.402 E.21215
G1 X150.798 Y134.597 E.43771
G1 X144.462 Y134.598 E.21017
M204 S250
G1 X144.01 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7580
M204 S5000
G1 X144.01 Y121.212 E.41728
G3 X144.192 Y121.01 I.196 J-.006 E.00923
G1 X151.036 Y121.014 E.21028
G3 X151.19 Y121.196 I-.04 J.19 E.00787
G1 X151.19 Y134.788 E.41765
G3 X151.007 Y134.99 I-.196 J.005 E.00925
G1 X144.212 Y134.99 E.20879
G3 X144.019 Y134.852 I-.005 J-.197 E.00784
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.017 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 36 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.6
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer36 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X145.087 Y133.338 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.193133
G1 F7580
M204 S6000
G1 X145.087 Y122.662 E.13067
G1 X145.196 Y122.446 E.00296
; LINE_WIDTH: 0.26741
G1 X145.304 Y122.229 E.00443
; LINE_WIDTH: 0.317297
G1 X145.412 Y122.013 E.00541
M204 S10000
G1 X145.013 Y122.338 F42000
; LINE_WIDTH: 0.69222
G1 F5544.438
M204 S6000
G1 X150.187 Y122.338 E.27377
M204 S10000
G1 X149.788 Y122.013 F42000
; LINE_WIDTH: 0.316522
G1 F7580
M204 S6000
G1 X149.896 Y122.229 E.0054
; LINE_WIDTH: 0.266777
G1 X150.004 Y122.446 E.00441
; LINE_WIDTH: 0.217033
G1 X150.112 Y122.662 E.00343
; LINE_WIDTH: 0.192342
G1 X150.112 Y133.338 E.12998
; LINE_WIDTH: 0.217451
G1 X150.004 Y133.554 E.00344
; LINE_WIDTH: 0.267319
G1 X149.896 Y133.771 E.00442
; LINE_WIDTH: 0.317186
G1 X149.788 Y133.987 E.00541
M204 S10000
G1 X150.187 Y133.662 F42000
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X145.013 Y133.662 E.27384
M204 S10000
G1 X145.087 Y133.338 F42000
; LINE_WIDTH: 0.217524
G1 F7580
M204 S6000
G1 X145.196 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X145.304 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X145.412 Y133.987 E.00541
; OBJECT_ID: 405
; WIPE_START
G1 F13120.648
G1 X145.304 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X138.707 Y129.932 Z7.6 F42000
G1 X126.565 Y122.866 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7580
M204 S6000
G1 X130.234 Y122.866 E.12171
G1 X130.234 Y133.134 E.34062
G1 X125.766 Y133.134 E.14822
G1 X125.766 Y122.866 E.34062
G1 X126.505 Y122.866 E.02452
M204 S10000
G1 X126.565 Y123.273 F42000
G1 F7580
M204 S6000
G1 X129.827 Y123.273 E.10821
G1 X129.827 Y132.727 E.31361
G1 X126.173 Y132.727 E.12121
G1 X126.173 Y123.273 E.31361
G1 X126.505 Y123.273 E.01102
M204 S250
G1 X126.565 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7580
M204 S5000
G1 X129.435 Y123.665 E.08819
G1 X129.435 Y132.335 E.2664
G1 X126.565 Y132.335 E.08819
G1 X126.565 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.565 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.243 Y130.954 Z7.6 F42000
G1 X125.209 Y134.191 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7580
M204 S6000
G1 X125.209 Y121.81 E.41071
G1 X130.79 Y121.809 E.18514
G1 X130.791 Y134.19 E.4107
G1 X125.269 Y134.191 E.18317
M204 S10000
G1 X124.802 Y134.598 F42000
G1 F7580
M204 S6000
G1 X124.802 Y121.403 E.43772
G1 X131.197 Y121.402 E.21215
G1 X131.198 Y134.597 E.43771
G1 X124.862 Y134.598 E.21017
M204 S250
G1 X124.41 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7580
M204 S5000
G1 X124.41 Y121.212 E.41728
G3 X124.592 Y121.01 I.196 J-.006 E.00923
G1 X131.436 Y121.014 E.21028
G3 X131.59 Y121.196 I-.04 J.19 E.00787
G1 X131.59 Y134.788 E.41765
G3 X131.407 Y134.99 I-.196 J.005 E.00925
G1 X124.612 Y134.99 E.20879
G3 X124.419 Y134.852 I-.005 J-.197 E.00784
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.417 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.413 Y133.662 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X130.587 Y133.662 E.27384
M204 S10000
G1 X130.188 Y133.987 F42000
; LINE_WIDTH: 0.317186
G1 F7580
M204 S6000
G1 X130.296 Y133.771 E.00541
; LINE_WIDTH: 0.267319
G1 X130.404 Y133.554 E.00442
; LINE_WIDTH: 0.217451
G1 X130.512 Y133.338 E.00344
; LINE_WIDTH: 0.192342
G1 X130.512 Y122.662 E.12998
; LINE_WIDTH: 0.217033
G1 X130.404 Y122.446 E.00343
; LINE_WIDTH: 0.266777
G1 X130.296 Y122.229 E.00441
; LINE_WIDTH: 0.316522
G1 X130.188 Y122.013 E.0054
M204 S10000
G1 X130.587 Y122.338 F42000
; LINE_WIDTH: 0.69222
G1 F5544.438
M204 S6000
G1 X125.413 Y122.338 E.27377
M204 S10000
G1 X125.812 Y122.013 F42000
; LINE_WIDTH: 0.317297
G1 F7580
M204 S6000
G1 X125.704 Y122.229 E.00541
; LINE_WIDTH: 0.26741
G1 X125.596 Y122.446 E.00443
; LINE_WIDTH: 0.193133
G1 X125.487 Y122.662 E.00296
G1 X125.487 Y133.338 E.13067
; LINE_WIDTH: 0.217524
G1 X125.596 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X125.704 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X125.812 Y133.987 E.00541
; OBJECT_ID: 394
; WIPE_START
G1 F13120.648
G1 X125.704 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X119.107 Y129.932 Z7.6 F42000
G1 X106.965 Y122.866 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7580
M204 S6000
G1 X110.634 Y122.866 E.12171
G1 X110.634 Y133.134 E.34062
G1 X106.166 Y133.134 E.14822
G1 X106.166 Y122.866 E.34062
G1 X106.905 Y122.866 E.02452
M204 S10000
G1 X106.965 Y123.273 F42000
G1 F7580
M204 S6000
G1 X110.227 Y123.273 E.10821
G1 X110.227 Y132.727 E.31361
G1 X106.573 Y132.727 E.12121
G1 X106.573 Y123.273 E.31361
G1 X106.905 Y123.273 E.01102
M204 S250
G1 X106.965 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7580
M204 S5000
G1 X109.835 Y123.665 E.08819
G1 X109.835 Y132.335 E.2664
G1 X106.965 Y132.335 E.08819
G1 X106.965 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X108.965 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.643 Y130.954 Z7.6 F42000
G1 X105.609 Y134.191 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7580
M204 S6000
G1 X105.609 Y121.81 E.41071
G1 X111.19 Y121.809 E.18514
G1 X111.191 Y134.19 E.4107
G1 X105.669 Y134.191 E.18317
M204 S10000
G1 X105.202 Y134.598 F42000
G1 F7580
M204 S6000
G1 X105.202 Y121.403 E.43772
G1 X111.597 Y121.402 E.21215
G1 X111.598 Y134.597 E.43771
G1 X105.262 Y134.598 E.21017
M204 S250
G1 X104.81 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7580
M204 S5000
G1 X104.81 Y121.212 E.41728
G3 X104.992 Y121.01 I.196 J-.006 E.00923
G1 X111.836 Y121.014 E.21028
G3 X111.99 Y121.196 I-.04 J.19 E.00787
G1 X111.99 Y134.788 E.41765
G3 X111.807 Y134.99 I-.196 J.005 E.00925
G1 X105.012 Y134.99 E.20879
G3 X104.819 Y134.852 I-.005 J-.197 E.00784
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.818 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.813 Y133.662 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X110.987 Y133.662 E.27384
M204 S10000
M73 P65 R7
G1 X110.588 Y133.987 F42000
; LINE_WIDTH: 0.317186
G1 F7580
M204 S6000
G1 X110.696 Y133.771 E.00541
; LINE_WIDTH: 0.267319
G1 X110.804 Y133.554 E.00442
; LINE_WIDTH: 0.217451
G1 X110.912 Y133.338 E.00344
; LINE_WIDTH: 0.192342
G1 X110.912 Y122.662 E.12998
; LINE_WIDTH: 0.217033
G1 X110.804 Y122.446 E.00343
; LINE_WIDTH: 0.266777
G1 X110.696 Y122.229 E.00441
; LINE_WIDTH: 0.316522
G1 X110.588 Y122.013 E.0054
M204 S10000
G1 X110.987 Y122.338 F42000
; LINE_WIDTH: 0.69222
G1 F5544.438
M204 S6000
G1 X105.813 Y122.338 E.27377
M204 S10000
G1 X106.212 Y122.013 F42000
; LINE_WIDTH: 0.317297
G1 F7580
M204 S6000
G1 X106.104 Y122.229 E.00541
; LINE_WIDTH: 0.26741
G1 X105.996 Y122.446 E.00443
; LINE_WIDTH: 0.193133
G1 X105.887 Y122.662 E.00296
G1 X105.887 Y133.338 E.13067
; LINE_WIDTH: 0.217524
G1 X105.996 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X106.104 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X106.212 Y133.987 E.00541
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F13120.648
G1 X106.104 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 37/73
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z7.6 I.32 J1.174 P1  F42000
G1 X146.165 Y122.866 Z7.6
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X149.834 Y122.866 E.12171
G1 X149.834 Y133.134 E.34062
G1 X145.366 Y133.134 E.14822
G1 X145.366 Y122.866 E.34062
G1 X146.105 Y122.866 E.02452
M204 S10000
G1 X146.165 Y123.273 F42000
G1 F7581
M204 S6000
G1 X149.427 Y123.273 E.10821
G1 X149.427 Y132.727 E.31361
G1 X145.773 Y132.727 E.12121
G1 X145.773 Y123.273 E.31361
G1 X146.105 Y123.273 E.01102
M204 S250
G1 X146.165 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X149.035 Y123.665 E.08819
G1 X149.035 Y132.335 E.2664
G1 X146.165 Y132.335 E.08819
G1 X146.165 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.165 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.843 Y130.954 Z7.8 F42000
G1 X144.809 Y134.191 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X144.809 Y121.81 E.41071
G1 X150.39 Y121.809 E.18514
G1 X150.391 Y134.19 E.4107
G1 X144.869 Y134.191 E.18317
M204 S10000
G1 X144.402 Y134.598 F42000
G1 F7581
M204 S6000
G1 X144.402 Y121.403 E.43772
G1 X150.797 Y121.402 E.21215
G1 X150.798 Y134.597 E.43771
G1 X144.462 Y134.598 E.21017
M204 S250
G1 X144.01 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X144.01 Y121.21 E.41732
G3 X144.192 Y121.01 I.192 J-.008 E.00922
G1 X151.036 Y121.014 E.21028
G3 X151.19 Y121.196 I-.04 J.19 E.00787
G1 X151.19 Y134.79 E.41769
G3 X151.007 Y134.99 I-.192 J.008 E.00925
G1 X144.21 Y134.99 E.20883
G3 X144.018 Y134.852 I-.008 J-.193 E.00784
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.017 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 37 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.8
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer37 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X145.087 Y133.338 F42000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.193133
G1 F7581
M204 S6000
G1 X145.087 Y122.662 E.13067
G1 X145.196 Y122.446 E.00296
; LINE_WIDTH: 0.26741
G1 X145.304 Y122.229 E.00443
; LINE_WIDTH: 0.317297
G1 X145.412 Y122.013 E.00541
M204 S10000
G1 X145.013 Y122.338 F42000
; LINE_WIDTH: 0.69221
G1 F5544.518
M204 S6000
G1 X150.187 Y122.338 E.27376
M204 S10000
G1 X149.788 Y122.013 F42000
; LINE_WIDTH: 0.316522
G1 F7581
M204 S6000
G1 X149.896 Y122.229 E.0054
; LINE_WIDTH: 0.266777
G1 X150.004 Y122.446 E.00441
; LINE_WIDTH: 0.217033
G1 X150.112 Y122.662 E.00343
; LINE_WIDTH: 0.192342
G1 X150.112 Y133.338 E.12998
; LINE_WIDTH: 0.217451
G1 X150.004 Y133.554 E.00344
; LINE_WIDTH: 0.267319
G1 X149.896 Y133.771 E.00442
; LINE_WIDTH: 0.317186
G1 X149.788 Y133.987 E.00541
M204 S10000
G1 X150.187 Y133.662 F42000
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X145.013 Y133.662 E.27384
M204 S10000
G1 X145.087 Y133.338 F42000
; LINE_WIDTH: 0.217524
G1 F7581
M204 S6000
G1 X145.196 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X145.304 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X145.412 Y133.987 E.00541
; OBJECT_ID: 405
; WIPE_START
G1 F13120.648
G1 X145.304 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X138.707 Y129.932 Z7.8 F42000
G1 X126.565 Y122.866 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X130.234 Y122.866 E.12171
G1 X130.234 Y133.134 E.34062
G1 X125.766 Y133.134 E.14822
G1 X125.766 Y122.866 E.34062
G1 X126.505 Y122.866 E.02452
M204 S10000
G1 X126.565 Y123.273 F42000
G1 F7581
M204 S6000
G1 X129.827 Y123.273 E.10821
G1 X129.827 Y132.727 E.31361
G1 X126.173 Y132.727 E.12121
G1 X126.173 Y123.273 E.31361
G1 X126.505 Y123.273 E.01102
M204 S250
G1 X126.565 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X129.435 Y123.665 E.08819
G1 X129.435 Y132.335 E.2664
G1 X126.565 Y132.335 E.08819
G1 X126.565 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.565 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.243 Y130.954 Z7.8 F42000
G1 X125.209 Y134.191 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X125.209 Y121.81 E.41071
G1 X130.79 Y121.809 E.18514
G1 X130.791 Y134.19 E.4107
G1 X125.269 Y134.191 E.18317
M204 S10000
G1 X124.802 Y134.598 F42000
G1 F7581
M204 S6000
G1 X124.802 Y121.403 E.43772
G1 X131.197 Y121.402 E.21215
G1 X131.198 Y134.597 E.43771
G1 X124.862 Y134.598 E.21017
M204 S250
G1 X124.41 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X124.41 Y121.21 E.41732
G3 X124.592 Y121.01 I.192 J-.008 E.00922
G1 X131.436 Y121.014 E.21028
G3 X131.59 Y121.196 I-.04 J.19 E.00787
G1 X131.59 Y134.79 E.41769
G3 X131.407 Y134.99 I-.192 J.008 E.00925
G1 X124.61 Y134.99 E.20883
G3 X124.418 Y134.852 I-.008 J-.193 E.00784
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.417 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.413 Y133.662 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X130.587 Y133.662 E.27384
M204 S10000
G1 X130.188 Y133.987 F42000
; LINE_WIDTH: 0.317186
G1 F7581
M204 S6000
G1 X130.296 Y133.771 E.00541
; LINE_WIDTH: 0.267319
G1 X130.404 Y133.554 E.00442
; LINE_WIDTH: 0.217451
G1 X130.512 Y133.338 E.00344
; LINE_WIDTH: 0.192342
G1 X130.512 Y122.662 E.12998
; LINE_WIDTH: 0.217033
G1 X130.404 Y122.446 E.00343
; LINE_WIDTH: 0.266777
G1 X130.296 Y122.229 E.00441
; LINE_WIDTH: 0.316522
G1 X130.188 Y122.013 E.0054
M204 S10000
G1 X130.587 Y122.338 F42000
; LINE_WIDTH: 0.69221
G1 F5544.518
M204 S6000
G1 X125.413 Y122.338 E.27376
M204 S10000
G1 X125.812 Y122.013 F42000
; LINE_WIDTH: 0.317297
G1 F7581
M204 S6000
G1 X125.704 Y122.229 E.00541
; LINE_WIDTH: 0.26741
G1 X125.596 Y122.446 E.00443
; LINE_WIDTH: 0.193133
G1 X125.487 Y122.662 E.00296
G1 X125.487 Y133.338 E.13067
; LINE_WIDTH: 0.217524
G1 X125.596 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X125.704 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X125.812 Y133.987 E.00541
; OBJECT_ID: 394
; WIPE_START
G1 F13120.648
G1 X125.704 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X119.107 Y129.932 Z7.8 F42000
G1 X106.965 Y122.866 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X110.634 Y122.866 E.12171
G1 X110.634 Y133.134 E.34062
G1 X106.166 Y133.134 E.14822
G1 X106.166 Y122.866 E.34062
G1 X106.905 Y122.866 E.02452
M204 S10000
G1 X106.965 Y123.273 F42000
G1 F7581
M204 S6000
G1 X110.227 Y123.273 E.10821
G1 X110.227 Y132.727 E.31361
G1 X106.573 Y132.727 E.12121
G1 X106.573 Y123.273 E.31361
G1 X106.905 Y123.273 E.01102
M204 S250
G1 X106.965 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X109.835 Y123.665 E.08819
G1 X109.835 Y132.335 E.2664
G1 X106.965 Y132.335 E.08819
G1 X106.965 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X108.965 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.643 Y130.954 Z7.8 F42000
G1 X105.609 Y134.191 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X105.609 Y121.81 E.41071
G1 X111.19 Y121.809 E.18514
G1 X111.191 Y134.19 E.4107
G1 X105.669 Y134.191 E.18317
M204 S10000
G1 X105.202 Y134.598 F42000
G1 F7581
M204 S6000
G1 X105.202 Y121.403 E.43772
G1 X111.597 Y121.402 E.21215
G1 X111.598 Y134.597 E.43771
G1 X105.262 Y134.598 E.21017
M204 S250
G1 X104.81 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X104.81 Y121.21 E.41732
G3 X104.992 Y121.01 I.192 J-.008 E.00922
G1 X111.836 Y121.014 E.21028
G3 X111.99 Y121.196 I-.04 J.19 E.00787
G1 X111.99 Y134.79 E.41769
G3 X111.807 Y134.99 I-.192 J.008 E.00925
G1 X105.01 Y134.99 E.20883
G3 X104.818 Y134.852 I-.008 J-.193 E.00784
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.817 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.813 Y133.662 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X110.987 Y133.662 E.27384
M204 S10000
G1 X110.588 Y133.987 F42000
; LINE_WIDTH: 0.317186
G1 F7581
M204 S6000
G1 X110.696 Y133.771 E.00541
; LINE_WIDTH: 0.267319
G1 X110.804 Y133.554 E.00442
; LINE_WIDTH: 0.217451
G1 X110.912 Y133.338 E.00344
; LINE_WIDTH: 0.192342
G1 X110.912 Y122.662 E.12998
; LINE_WIDTH: 0.217033
G1 X110.804 Y122.446 E.00343
; LINE_WIDTH: 0.266777
G1 X110.696 Y122.229 E.00441
; LINE_WIDTH: 0.316522
G1 X110.588 Y122.013 E.0054
M204 S10000
G1 X110.987 Y122.338 F42000
; LINE_WIDTH: 0.69221
G1 F5544.518
M204 S6000
G1 X105.813 Y122.338 E.27376
M204 S10000
G1 X106.212 Y122.013 F42000
; LINE_WIDTH: 0.317297
G1 F7581
M204 S6000
G1 X106.104 Y122.229 E.00541
; LINE_WIDTH: 0.26741
G1 X105.996 Y122.446 E.00443
; LINE_WIDTH: 0.193133
G1 X105.887 Y122.662 E.00296
G1 X105.887 Y133.338 E.13067
; LINE_WIDTH: 0.217524
G1 X105.996 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X106.104 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X106.212 Y133.987 E.00541
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F13120.648
G1 X106.104 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 38/73
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z7.8 I.32 J1.174 P1  F42000
G1 X146.165 Y122.866 Z7.8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7580
M204 S6000
G1 X149.834 Y122.866 E.12171
G1 X149.834 Y133.134 E.34062
G1 X145.366 Y133.134 E.14822
G1 X145.366 Y122.866 E.34062
G1 X146.105 Y122.866 E.02452
M204 S10000
G1 X146.165 Y123.273 F42000
G1 F7580
M204 S6000
G1 X149.427 Y123.273 E.10821
G1 X149.427 Y132.727 E.31361
G1 X145.773 Y132.727 E.12121
G1 X145.773 Y123.273 E.31361
G1 X146.105 Y123.273 E.01102
M204 S250
G1 X146.165 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7580
M204 S5000
G1 X149.035 Y123.665 E.08819
G1 X149.035 Y132.335 E.2664
G1 X146.165 Y132.335 E.08819
G1 X146.165 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.165 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.843 Y130.954 Z8 F42000
G1 X144.809 Y134.191 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7580
M204 S6000
G1 X144.809 Y121.81 E.41071
G1 X150.39 Y121.809 E.18514
G1 X150.391 Y134.19 E.4107
G1 X144.869 Y134.191 E.18317
M204 S10000
M73 P66 R7
G1 X144.402 Y134.598 F42000
G1 F7580
M204 S6000
G1 X144.402 Y121.403 E.43772
G1 X150.797 Y121.402 E.21215
G1 X150.798 Y134.597 E.43771
G1 X144.462 Y134.598 E.21017
M204 S250
G1 X144.01 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7580
M204 S5000
G1 X144.01 Y121.212 E.41728
G3 X144.193 Y121.01 I.196 J-.005 E.00925
G1 X151.036 Y121.014 E.21025
G3 X151.19 Y121.196 I-.04 J.19 E.00787
G1 X151.19 Y134.788 E.41765
G3 X151.008 Y134.99 I-.196 J.006 E.00923
G1 X144.212 Y134.99 E.20881
G3 X144.018 Y134.852 I-.007 J-.194 E.00786
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.017 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 38 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer38 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X145.087 Y133.338 F42000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.193133
G1 F7580
M204 S6000
G1 X145.087 Y122.662 E.13067
G1 X145.196 Y122.446 E.00296
; LINE_WIDTH: 0.26741
G1 X145.304 Y122.229 E.00443
; LINE_WIDTH: 0.317297
G1 X145.412 Y122.013 E.00541
M204 S10000
G1 X145.013 Y122.338 F42000
; LINE_WIDTH: 0.692221
G1 F5544.427
M204 S6000
G1 X150.187 Y122.338 E.27377
M204 S10000
G1 X149.788 Y122.013 F42000
; LINE_WIDTH: 0.316522
G1 F7580
M204 S6000
G1 X149.896 Y122.229 E.0054
; LINE_WIDTH: 0.266777
G1 X150.004 Y122.446 E.00441
; LINE_WIDTH: 0.217033
G1 X150.112 Y122.662 E.00343
; LINE_WIDTH: 0.192342
G1 X150.112 Y133.338 E.12998
; LINE_WIDTH: 0.217451
G1 X150.004 Y133.554 E.00344
; LINE_WIDTH: 0.267319
G1 X149.896 Y133.771 E.00442
; LINE_WIDTH: 0.317186
G1 X149.788 Y133.987 E.00541
M204 S10000
G1 X150.187 Y133.662 F42000
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X145.013 Y133.662 E.27384
M204 S10000
G1 X145.087 Y133.338 F42000
; LINE_WIDTH: 0.217524
G1 F7580
M204 S6000
G1 X145.196 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X145.304 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X145.412 Y133.987 E.00541
; OBJECT_ID: 405
; WIPE_START
G1 F13120.648
G1 X145.304 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X138.707 Y129.932 Z8 F42000
G1 X126.565 Y122.866 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7580
M204 S6000
G1 X130.234 Y122.866 E.12171
G1 X130.234 Y133.134 E.34062
G1 X125.766 Y133.134 E.14822
G1 X125.766 Y122.866 E.34062
G1 X126.505 Y122.866 E.02452
M204 S10000
G1 X126.565 Y123.273 F42000
G1 F7580
M204 S6000
G1 X129.827 Y123.273 E.10821
G1 X129.827 Y132.727 E.31361
G1 X126.173 Y132.727 E.12121
G1 X126.173 Y123.273 E.31361
G1 X126.505 Y123.273 E.01102
M204 S250
G1 X126.565 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7580
M204 S5000
G1 X129.435 Y123.665 E.08819
G1 X129.435 Y132.335 E.2664
G1 X126.565 Y132.335 E.08819
G1 X126.565 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.565 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.243 Y130.954 Z8 F42000
G1 X125.209 Y134.191 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7580
M204 S6000
G1 X125.209 Y121.81 E.41071
G1 X130.79 Y121.809 E.18514
G1 X130.791 Y134.19 E.4107
G1 X125.269 Y134.191 E.18317
M204 S10000
G1 X124.802 Y134.598 F42000
G1 F7580
M204 S6000
G1 X124.802 Y121.403 E.43772
G1 X131.197 Y121.402 E.21215
G1 X131.198 Y134.597 E.43771
G1 X124.862 Y134.598 E.21017
M204 S250
G1 X124.41 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7580
M204 S5000
G1 X124.41 Y121.212 E.41728
G3 X124.593 Y121.01 I.196 J-.005 E.00925
G1 X131.436 Y121.014 E.21025
G3 X131.59 Y121.196 I-.04 J.19 E.00787
G1 X131.59 Y134.788 E.41765
G3 X131.408 Y134.99 I-.196 J.006 E.00923
G1 X124.612 Y134.99 E.20881
G3 X124.418 Y134.852 I-.007 J-.194 E.00786
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.417 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.413 Y133.662 Z8 F42000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X130.587 Y133.662 E.27384
M204 S10000
G1 X130.188 Y133.987 F42000
; LINE_WIDTH: 0.317186
G1 F7580
M204 S6000
G1 X130.296 Y133.771 E.00541
; LINE_WIDTH: 0.267319
G1 X130.404 Y133.554 E.00442
; LINE_WIDTH: 0.217451
G1 X130.512 Y133.338 E.00344
; LINE_WIDTH: 0.192342
G1 X130.512 Y122.662 E.12998
; LINE_WIDTH: 0.217033
G1 X130.404 Y122.446 E.00343
; LINE_WIDTH: 0.266777
G1 X130.296 Y122.229 E.00441
; LINE_WIDTH: 0.316522
G1 X130.188 Y122.013 E.0054
M204 S10000
G1 X130.587 Y122.338 F42000
; LINE_WIDTH: 0.692221
G1 F5544.427
M204 S6000
G1 X125.413 Y122.338 E.27377
M204 S10000
G1 X125.812 Y122.013 F42000
; LINE_WIDTH: 0.317297
G1 F7580
M204 S6000
G1 X125.704 Y122.229 E.00541
; LINE_WIDTH: 0.26741
G1 X125.596 Y122.446 E.00443
; LINE_WIDTH: 0.193133
G1 X125.487 Y122.662 E.00296
G1 X125.487 Y133.338 E.13067
; LINE_WIDTH: 0.217524
G1 X125.596 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X125.704 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X125.812 Y133.987 E.00541
; OBJECT_ID: 394
; WIPE_START
G1 F13120.648
G1 X125.704 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X119.107 Y129.932 Z8 F42000
G1 X106.965 Y122.866 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7580
M204 S6000
G1 X110.634 Y122.866 E.12171
G1 X110.634 Y133.134 E.34062
G1 X106.166 Y133.134 E.14822
G1 X106.166 Y122.866 E.34062
G1 X106.905 Y122.866 E.02452
M204 S10000
G1 X106.965 Y123.273 F42000
G1 F7580
M204 S6000
G1 X110.227 Y123.273 E.10821
G1 X110.227 Y132.727 E.31361
G1 X106.573 Y132.727 E.12121
G1 X106.573 Y123.273 E.31361
G1 X106.905 Y123.273 E.01102
M204 S250
G1 X106.965 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7580
M204 S5000
G1 X109.835 Y123.665 E.08819
G1 X109.835 Y132.335 E.2664
G1 X106.965 Y132.335 E.08819
G1 X106.965 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X108.965 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.643 Y130.954 Z8 F42000
G1 X105.609 Y134.191 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7580
M204 S6000
G1 X105.609 Y121.81 E.41071
G1 X111.19 Y121.809 E.18514
G1 X111.191 Y134.19 E.4107
G1 X105.669 Y134.191 E.18317
M204 S10000
G1 X105.202 Y134.598 F42000
G1 F7580
M204 S6000
G1 X105.202 Y121.403 E.43772
G1 X111.597 Y121.402 E.21215
G1 X111.598 Y134.597 E.43771
G1 X105.262 Y134.598 E.21017
M204 S250
G1 X104.81 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7580
M204 S5000
G1 X104.81 Y121.212 E.41728
G3 X104.993 Y121.01 I.196 J-.005 E.00925
G1 X111.836 Y121.014 E.21025
G3 X111.99 Y121.196 I-.04 J.19 E.00787
G1 X111.99 Y134.788 E.41765
G3 X111.808 Y134.99 I-.196 J.006 E.00923
G1 X105.012 Y134.99 E.20881
G3 X104.818 Y134.852 I-.007 J-.194 E.00786
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.817 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.813 Y133.662 Z8 F42000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X110.987 Y133.662 E.27384
M204 S10000
G1 X110.588 Y133.987 F42000
; LINE_WIDTH: 0.317186
G1 F7580
M204 S6000
G1 X110.696 Y133.771 E.00541
; LINE_WIDTH: 0.267319
G1 X110.804 Y133.554 E.00442
; LINE_WIDTH: 0.217451
G1 X110.912 Y133.338 E.00344
; LINE_WIDTH: 0.192342
G1 X110.912 Y122.662 E.12998
; LINE_WIDTH: 0.217033
G1 X110.804 Y122.446 E.00343
; LINE_WIDTH: 0.266777
G1 X110.696 Y122.229 E.00441
; LINE_WIDTH: 0.316522
G1 X110.588 Y122.013 E.0054
M204 S10000
G1 X110.987 Y122.338 F42000
; LINE_WIDTH: 0.692221
G1 F5544.427
M204 S6000
G1 X105.813 Y122.338 E.27377
M204 S10000
G1 X106.212 Y122.013 F42000
; LINE_WIDTH: 0.317297
G1 F7580
M204 S6000
G1 X106.104 Y122.229 E.00541
; LINE_WIDTH: 0.26741
G1 X105.996 Y122.446 E.00443
; LINE_WIDTH: 0.193133
G1 X105.887 Y122.662 E.00296
G1 X105.887 Y133.338 E.13067
; LINE_WIDTH: 0.217524
G1 X105.996 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X106.104 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X106.212 Y133.987 E.00541
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F13120.648
G1 X106.104 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 39/73
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z8 I.32 J1.174 P1  F42000
G1 X146.165 Y122.866 Z8
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X149.834 Y122.866 E.12171
G1 X149.834 Y133.134 E.34062
G1 X145.366 Y133.134 E.14822
G1 X145.366 Y122.866 E.34062
G1 X146.105 Y122.866 E.02452
M204 S10000
G1 X146.165 Y123.273 F42000
G1 F7581
M204 S6000
G1 X149.427 Y123.273 E.10821
G1 X149.427 Y132.727 E.31361
G1 X145.773 Y132.727 E.12121
G1 X145.773 Y123.273 E.31361
G1 X146.105 Y123.273 E.01102
M204 S250
G1 X146.165 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X149.035 Y123.665 E.08819
G1 X149.035 Y132.335 E.2664
G1 X146.165 Y132.335 E.08819
G1 X146.165 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.165 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.843 Y130.954 Z8.2 F42000
G1 X144.809 Y134.191 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X144.809 Y121.81 E.41071
G1 X150.39 Y121.809 E.18514
G1 X150.391 Y134.19 E.4107
G1 X144.869 Y134.191 E.18317
M204 S10000
G1 X144.402 Y134.598 F42000
G1 F7581
M204 S6000
G1 X144.402 Y121.403 E.43772
G1 X150.797 Y121.402 E.21215
G1 X150.798 Y134.597 E.43771
G1 X144.462 Y134.598 E.21017
M204 S250
G1 X144.01 Y134.793 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X144.011 Y121.184 E.41818
G3 X144.192 Y121.01 I.194 J.022 E.00836
G1 X151.036 Y121.014 E.21029
G3 X151.19 Y121.196 I-.04 J.19 E.00787
G1 X151.19 Y134.788 E.41766
G3 X151.007 Y134.99 I-.191 J.01 E.00931
G1 X144.212 Y134.99 E.20879
G3 X144.019 Y134.853 I-.005 J-.197 E.0078
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.018 Y132.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 39 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.2
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer39 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X145.087 Y133.338 F42000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.193133
G1 F7581
M204 S6000
G1 X145.087 Y122.662 E.13067
G1 X145.196 Y122.446 E.00296
; LINE_WIDTH: 0.26741
G1 X145.304 Y122.229 E.00443
; LINE_WIDTH: 0.317297
G1 X145.412 Y122.013 E.00541
M204 S10000
G1 X145.013 Y122.338 F42000
; LINE_WIDTH: 0.69221
G1 F5544.518
M204 S6000
G1 X150.187 Y122.338 E.27376
M204 S10000
G1 X149.788 Y122.013 F42000
; LINE_WIDTH: 0.316522
G1 F7581
M204 S6000
G1 X149.896 Y122.229 E.0054
; LINE_WIDTH: 0.266777
G1 X150.004 Y122.446 E.00441
; LINE_WIDTH: 0.217033
G1 X150.112 Y122.662 E.00343
; LINE_WIDTH: 0.192342
G1 X150.112 Y133.338 E.12998
; LINE_WIDTH: 0.217451
G1 X150.004 Y133.554 E.00344
; LINE_WIDTH: 0.267319
G1 X149.896 Y133.771 E.00442
; LINE_WIDTH: 0.317186
G1 X149.788 Y133.987 E.00541
M204 S10000
M73 P67 R7
G1 X150.187 Y133.662 F42000
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X145.013 Y133.662 E.27384
M204 S10000
G1 X145.087 Y133.338 F42000
; LINE_WIDTH: 0.217524
G1 F7581
M204 S6000
G1 X145.196 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X145.304 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X145.412 Y133.987 E.00541
; OBJECT_ID: 405
; WIPE_START
G1 F13120.648
G1 X145.304 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X138.707 Y129.932 Z8.2 F42000
G1 X126.565 Y122.866 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X130.234 Y122.866 E.12171
G1 X130.234 Y133.134 E.34062
G1 X125.766 Y133.134 E.14822
G1 X125.766 Y122.866 E.34062
G1 X126.505 Y122.866 E.02452
M204 S10000
G1 X126.565 Y123.273 F42000
G1 F7581
M204 S6000
G1 X129.827 Y123.273 E.10821
G1 X129.827 Y132.727 E.31361
G1 X126.173 Y132.727 E.12121
G1 X126.173 Y123.273 E.31361
G1 X126.505 Y123.273 E.01102
M204 S250
G1 X126.565 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X129.435 Y123.665 E.08819
G1 X129.435 Y132.335 E.2664
G1 X126.565 Y132.335 E.08819
G1 X126.565 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.565 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.243 Y130.954 Z8.2 F42000
G1 X125.209 Y134.191 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X125.209 Y121.81 E.41071
G1 X130.79 Y121.809 E.18514
G1 X130.791 Y134.19 E.4107
G1 X125.269 Y134.191 E.18317
M204 S10000
G1 X124.802 Y134.598 F42000
G1 F7581
M204 S6000
G1 X124.802 Y121.403 E.43772
G1 X131.197 Y121.402 E.21215
G1 X131.198 Y134.597 E.43771
G1 X124.862 Y134.598 E.21017
M204 S250
G1 X124.41 Y134.793 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X124.411 Y121.184 E.41818
G3 X124.592 Y121.01 I.194 J.022 E.00836
G1 X131.436 Y121.014 E.21029
G3 X131.59 Y121.196 I-.04 J.19 E.00787
G1 X131.59 Y134.788 E.41766
G3 X131.407 Y134.99 I-.191 J.01 E.00931
G1 X124.612 Y134.99 E.20879
G3 X124.419 Y134.853 I-.005 J-.197 E.0078
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.418 Y132.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.413 Y133.662 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X130.587 Y133.662 E.27384
M204 S10000
G1 X130.188 Y133.987 F42000
; LINE_WIDTH: 0.317186
G1 F7581
M204 S6000
G1 X130.296 Y133.771 E.00541
; LINE_WIDTH: 0.267319
G1 X130.404 Y133.554 E.00442
; LINE_WIDTH: 0.217451
G1 X130.512 Y133.338 E.00344
; LINE_WIDTH: 0.192342
G1 X130.512 Y122.662 E.12998
; LINE_WIDTH: 0.217033
G1 X130.404 Y122.446 E.00343
; LINE_WIDTH: 0.266777
G1 X130.296 Y122.229 E.00441
; LINE_WIDTH: 0.316522
G1 X130.188 Y122.013 E.0054
M204 S10000
G1 X130.587 Y122.338 F42000
; LINE_WIDTH: 0.69221
G1 F5544.518
M204 S6000
G1 X125.413 Y122.338 E.27376
M204 S10000
G1 X125.812 Y122.013 F42000
; LINE_WIDTH: 0.317297
G1 F7581
M204 S6000
G1 X125.704 Y122.229 E.00541
; LINE_WIDTH: 0.26741
G1 X125.596 Y122.446 E.00443
; LINE_WIDTH: 0.193133
G1 X125.487 Y122.662 E.00296
G1 X125.487 Y133.338 E.13067
; LINE_WIDTH: 0.217524
G1 X125.596 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X125.704 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X125.812 Y133.987 E.00541
; OBJECT_ID: 394
; WIPE_START
G1 F13120.648
G1 X125.704 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X119.107 Y129.932 Z8.2 F42000
G1 X106.965 Y122.866 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X110.634 Y122.866 E.12171
G1 X110.634 Y133.134 E.34062
G1 X106.166 Y133.134 E.14822
G1 X106.166 Y122.866 E.34062
G1 X106.905 Y122.866 E.02452
M204 S10000
G1 X106.965 Y123.273 F42000
G1 F7581
M204 S6000
G1 X110.227 Y123.273 E.10821
G1 X110.227 Y132.727 E.31361
G1 X106.573 Y132.727 E.12121
G1 X106.573 Y123.273 E.31361
G1 X106.905 Y123.273 E.01102
M204 S250
G1 X106.965 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X109.835 Y123.665 E.08819
G1 X109.835 Y132.335 E.2664
G1 X106.965 Y132.335 E.08819
G1 X106.965 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X108.965 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.643 Y130.954 Z8.2 F42000
G1 X105.609 Y134.191 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X105.609 Y121.81 E.41071
G1 X111.19 Y121.809 E.18514
G1 X111.191 Y134.19 E.4107
G1 X105.669 Y134.191 E.18317
M204 S10000
G1 X105.202 Y134.598 F42000
G1 F7581
M204 S6000
G1 X105.202 Y121.403 E.43772
G1 X111.597 Y121.402 E.21215
G1 X111.598 Y134.597 E.43771
G1 X105.262 Y134.598 E.21017
M204 S250
G1 X104.81 Y134.793 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X104.811 Y121.184 E.41818
G3 X104.992 Y121.01 I.194 J.022 E.00836
G1 X111.836 Y121.014 E.21029
G3 X111.99 Y121.196 I-.04 J.19 E.00787
G1 X111.99 Y134.788 E.41766
G3 X111.807 Y134.99 I-.191 J.01 E.00931
G1 X105.012 Y134.99 E.20879
G3 X104.819 Y134.853 I-.005 J-.197 E.0078
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.818 Y132.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.813 Y133.662 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X110.987 Y133.662 E.27384
M204 S10000
G1 X110.588 Y133.987 F42000
; LINE_WIDTH: 0.317186
G1 F7581
M204 S6000
G1 X110.696 Y133.771 E.00541
; LINE_WIDTH: 0.267319
G1 X110.804 Y133.554 E.00442
; LINE_WIDTH: 0.217451
G1 X110.912 Y133.338 E.00344
; LINE_WIDTH: 0.192342
G1 X110.912 Y122.662 E.12998
; LINE_WIDTH: 0.217033
G1 X110.804 Y122.446 E.00343
; LINE_WIDTH: 0.266777
G1 X110.696 Y122.229 E.00441
; LINE_WIDTH: 0.316522
G1 X110.588 Y122.013 E.0054
M204 S10000
G1 X110.987 Y122.338 F42000
; LINE_WIDTH: 0.69221
G1 F5544.518
M204 S6000
G1 X105.813 Y122.338 E.27376
M204 S10000
G1 X106.212 Y122.013 F42000
; LINE_WIDTH: 0.317297
G1 F7581
M204 S6000
G1 X106.104 Y122.229 E.00541
; LINE_WIDTH: 0.26741
G1 X105.996 Y122.446 E.00443
; LINE_WIDTH: 0.193133
G1 X105.887 Y122.662 E.00296
G1 X105.887 Y133.338 E.13067
; LINE_WIDTH: 0.217524
G1 X105.996 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X106.104 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X106.212 Y133.987 E.00541
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F13120.648
G1 X106.104 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 40/73
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z8.2 I.32 J1.174 P1  F42000
G1 X146.165 Y122.866 Z8.2
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X149.834 Y122.866 E.12171
G1 X149.834 Y133.134 E.34062
G1 X145.366 Y133.134 E.14822
G1 X145.366 Y122.866 E.34062
G1 X146.105 Y122.866 E.02452
M204 S10000
G1 X146.165 Y123.273 F42000
G1 F7581
M204 S6000
G1 X149.427 Y123.273 E.10821
G1 X149.427 Y132.727 E.31361
G1 X145.773 Y132.727 E.12121
G1 X145.773 Y123.273 E.31361
G1 X146.105 Y123.273 E.01102
M204 S250
G1 X146.165 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X149.035 Y123.665 E.08819
G1 X149.035 Y132.335 E.2664
G1 X146.165 Y132.335 E.08819
G1 X146.165 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.165 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.843 Y130.954 Z8.4 F42000
G1 X144.809 Y134.191 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X144.809 Y121.81 E.41071
G1 X150.39 Y121.809 E.18514
G1 X150.391 Y134.19 E.4107
G1 X144.869 Y134.191 E.18317
M204 S10000
G1 X144.402 Y134.598 F42000
G1 F7581
M204 S6000
G1 X144.402 Y121.403 E.43772
G1 X150.797 Y121.402 E.21215
G1 X150.798 Y134.597 E.43771
G1 X144.462 Y134.598 E.21017
M204 S250
G1 X144.01 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X144.018 Y121.147 E.41926
G3 X144.193 Y121.01 I.185 J.056 E.00729
G1 X151.036 Y121.014 E.21025
G3 X151.19 Y121.196 I-.04 J.19 E.00787
G1 X151.182 Y134.853 E.41963
G3 X151.007 Y134.99 I-.185 J-.056 E.00729
G1 X144.183 Y134.989 E.20967
G3 X144.019 Y134.851 I.024 J-.196 E.00697
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.019 Y132.851 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 40 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.4
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer40 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X145.087 Y133.338 F42000
G1 Z8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.193133
G1 F7581
M204 S6000
G1 X145.087 Y122.662 E.13067
G1 X145.196 Y122.446 E.00296
; LINE_WIDTH: 0.26741
G1 X145.304 Y122.229 E.00443
; LINE_WIDTH: 0.317297
G1 X145.412 Y122.013 E.00541
M204 S10000
G1 X145.013 Y122.338 F42000
; LINE_WIDTH: 0.692222
G1 F5544.422
M204 S6000
G1 X150.187 Y122.338 E.27377
M204 S10000
G1 X149.788 Y122.013 F42000
; LINE_WIDTH: 0.316522
G1 F7581
M204 S6000
G1 X149.896 Y122.229 E.0054
; LINE_WIDTH: 0.266777
G1 X150.004 Y122.446 E.00441
; LINE_WIDTH: 0.217033
G1 X150.112 Y122.662 E.00343
; LINE_WIDTH: 0.192342
G1 X150.112 Y133.338 E.12998
; LINE_WIDTH: 0.217451
G1 X150.004 Y133.554 E.00344
; LINE_WIDTH: 0.267319
G1 X149.896 Y133.771 E.00442
; LINE_WIDTH: 0.317186
G1 X149.788 Y133.987 E.00541
M204 S10000
G1 X150.187 Y133.662 F42000
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X145.013 Y133.662 E.27384
M204 S10000
G1 X145.087 Y133.338 F42000
; LINE_WIDTH: 0.217524
G1 F7581
M204 S6000
G1 X145.196 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X145.304 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X145.412 Y133.987 E.00541
; OBJECT_ID: 405
; WIPE_START
G1 F13120.648
G1 X145.304 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X138.707 Y129.932 Z8.4 F42000
G1 X126.565 Y122.866 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X130.234 Y122.866 E.12171
G1 X130.234 Y133.134 E.34062
G1 X125.766 Y133.134 E.14822
G1 X125.766 Y122.866 E.34062
G1 X126.505 Y122.866 E.02452
M204 S10000
G1 X126.565 Y123.273 F42000
G1 F7581
M204 S6000
G1 X129.827 Y123.273 E.10821
G1 X129.827 Y132.727 E.31361
G1 X126.173 Y132.727 E.12121
G1 X126.173 Y123.273 E.31361
G1 X126.505 Y123.273 E.01102
M204 S250
G1 X126.565 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X129.435 Y123.665 E.08819
G1 X129.435 Y132.335 E.2664
G1 X126.565 Y132.335 E.08819
G1 X126.565 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.565 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.243 Y130.954 Z8.4 F42000
G1 X125.209 Y134.191 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X125.209 Y121.81 E.41071
G1 X130.79 Y121.809 E.18514
G1 X130.791 Y134.19 E.4107
G1 X125.269 Y134.191 E.18317
M204 S10000
G1 X124.802 Y134.598 F42000
G1 F7581
M204 S6000
G1 X124.802 Y121.403 E.43772
G1 X131.197 Y121.402 E.21215
G1 X131.198 Y134.597 E.43771
M73 P68 R7
G1 X124.862 Y134.598 E.21017
M204 S250
G1 X124.41 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X124.418 Y121.147 E.41926
G3 X124.593 Y121.01 I.185 J.056 E.00729
G1 X131.436 Y121.014 E.21025
G3 X131.59 Y121.196 I-.04 J.19 E.00787
G1 X131.582 Y134.853 E.41963
G3 X131.407 Y134.99 I-.185 J-.056 E.00729
G1 X124.583 Y134.989 E.20967
G3 X124.419 Y134.851 I.024 J-.196 E.00697
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.419 Y132.851 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.413 Y133.662 Z8.4 F42000
G1 Z8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X130.587 Y133.662 E.27384
M204 S10000
G1 X130.188 Y133.987 F42000
; LINE_WIDTH: 0.317186
G1 F7581
M204 S6000
G1 X130.296 Y133.771 E.00541
; LINE_WIDTH: 0.267319
G1 X130.404 Y133.554 E.00442
; LINE_WIDTH: 0.217451
G1 X130.512 Y133.338 E.00344
; LINE_WIDTH: 0.192342
G1 X130.512 Y122.662 E.12998
; LINE_WIDTH: 0.217033
G1 X130.404 Y122.446 E.00343
; LINE_WIDTH: 0.266777
G1 X130.296 Y122.229 E.00441
; LINE_WIDTH: 0.316522
G1 X130.188 Y122.013 E.0054
M204 S10000
M73 P68 R6
G1 X130.587 Y122.338 F42000
; LINE_WIDTH: 0.692222
G1 F5544.422
M204 S6000
G1 X125.413 Y122.338 E.27377
M204 S10000
G1 X125.812 Y122.013 F42000
; LINE_WIDTH: 0.317297
G1 F7581
M204 S6000
G1 X125.704 Y122.229 E.00541
; LINE_WIDTH: 0.26741
G1 X125.596 Y122.446 E.00443
; LINE_WIDTH: 0.193133
G1 X125.487 Y122.662 E.00296
G1 X125.487 Y133.338 E.13067
; LINE_WIDTH: 0.217524
G1 X125.596 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X125.704 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X125.812 Y133.987 E.00541
; OBJECT_ID: 394
; WIPE_START
G1 F13120.648
G1 X125.704 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X119.107 Y129.932 Z8.4 F42000
G1 X106.965 Y122.866 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X110.634 Y122.866 E.12171
G1 X110.634 Y133.134 E.34062
G1 X106.166 Y133.134 E.14822
G1 X106.166 Y122.866 E.34062
G1 X106.905 Y122.866 E.02452
M204 S10000
G1 X106.965 Y123.273 F42000
G1 F7581
M204 S6000
G1 X110.227 Y123.273 E.10821
G1 X110.227 Y132.727 E.31361
G1 X106.573 Y132.727 E.12121
G1 X106.573 Y123.273 E.31361
G1 X106.905 Y123.273 E.01102
M204 S250
G1 X106.965 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X109.835 Y123.665 E.08819
G1 X109.835 Y132.335 E.2664
G1 X106.965 Y132.335 E.08819
G1 X106.965 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X108.965 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.643 Y130.954 Z8.4 F42000
G1 X105.609 Y134.191 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X105.609 Y121.81 E.41071
G1 X111.19 Y121.809 E.18514
G1 X111.191 Y134.19 E.4107
G1 X105.669 Y134.191 E.18317
M204 S10000
G1 X105.202 Y134.598 F42000
G1 F7581
M204 S6000
G1 X105.202 Y121.403 E.43772
G1 X111.597 Y121.402 E.21215
G1 X111.598 Y134.597 E.43771
G1 X105.262 Y134.598 E.21017
M204 S250
G1 X104.81 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X104.818 Y121.147 E.41926
G3 X104.993 Y121.01 I.185 J.056 E.00729
G1 X111.836 Y121.014 E.21025
G3 X111.99 Y121.196 I-.04 J.19 E.00787
G1 X111.982 Y134.853 E.41963
G3 X111.807 Y134.99 I-.185 J-.056 E.00729
G1 X104.983 Y134.989 E.20967
G3 X104.819 Y134.851 I.024 J-.196 E.00697
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.819 Y132.851 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.813 Y133.662 Z8.4 F42000
G1 Z8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X110.987 Y133.662 E.27384
M204 S10000
G1 X110.588 Y133.987 F42000
; LINE_WIDTH: 0.317186
G1 F7581
M204 S6000
G1 X110.696 Y133.771 E.00541
; LINE_WIDTH: 0.267319
G1 X110.804 Y133.554 E.00442
; LINE_WIDTH: 0.217451
G1 X110.912 Y133.338 E.00344
; LINE_WIDTH: 0.192342
G1 X110.912 Y122.662 E.12998
; LINE_WIDTH: 0.217033
G1 X110.804 Y122.446 E.00343
; LINE_WIDTH: 0.266777
G1 X110.696 Y122.229 E.00441
; LINE_WIDTH: 0.316522
G1 X110.588 Y122.013 E.0054
M204 S10000
G1 X110.987 Y122.338 F42000
; LINE_WIDTH: 0.692222
G1 F5544.422
M204 S6000
G1 X105.813 Y122.338 E.27377
M204 S10000
G1 X106.212 Y122.013 F42000
; LINE_WIDTH: 0.317297
G1 F7581
M204 S6000
G1 X106.104 Y122.229 E.00541
; LINE_WIDTH: 0.26741
G1 X105.996 Y122.446 E.00443
; LINE_WIDTH: 0.193133
G1 X105.887 Y122.662 E.00296
G1 X105.887 Y133.338 E.13067
; LINE_WIDTH: 0.217524
G1 X105.996 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X106.104 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X106.212 Y133.987 E.00541
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F13120.648
G1 X106.104 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 41/73
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z8.4 I.32 J1.174 P1  F42000
G1 X146.165 Y122.866 Z8.4
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X149.834 Y122.866 E.12171
G1 X149.834 Y133.134 E.34062
G1 X145.366 Y133.134 E.14822
G1 X145.366 Y122.866 E.34062
G1 X146.105 Y122.866 E.02452
M204 S10000
G1 X146.165 Y123.273 F42000
G1 F7581
M204 S6000
G1 X149.427 Y123.273 E.10821
G1 X149.427 Y132.727 E.31361
G1 X145.773 Y132.727 E.12121
G1 X145.773 Y123.273 E.31361
G1 X146.105 Y123.273 E.01102
M204 S250
G1 X146.165 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X149.035 Y123.665 E.08819
G1 X149.035 Y132.335 E.2664
G1 X146.165 Y132.335 E.08819
G1 X146.165 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.165 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.843 Y130.954 Z8.6 F42000
G1 X144.809 Y134.191 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X144.809 Y121.81 E.41071
G1 X150.39 Y121.809 E.18514
G1 X150.391 Y134.19 E.4107
G1 X144.869 Y134.191 E.18317
M204 S10000
G1 X144.402 Y134.598 F42000
G1 F7581
M204 S6000
G1 X144.402 Y121.403 E.43772
G1 X150.797 Y121.402 E.21215
G1 X150.798 Y134.597 E.43771
G1 X144.462 Y134.598 E.21017
M204 S250
G1 X144.01 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X144.011 Y121.183 E.41817
G3 X144.193 Y121.01 I.194 J.023 E.00837
G1 X151.036 Y121.014 E.21026
G3 X151.19 Y121.196 I-.039 J.188 E.00787
G1 X151.19 Y134.788 E.41766
G3 X151.008 Y134.99 I-.192 J.009 E.00927
G1 X144.183 Y134.989 E.2097
G3 X144.018 Y134.852 I.021 J-.193 E.00699
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.017 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 41 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.6
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer41 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X145.087 Y133.338 F42000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.193133
G1 F7581
M204 S6000
G1 X145.087 Y122.662 E.13067
G1 X145.196 Y122.446 E.00296
; LINE_WIDTH: 0.26741
G1 X145.304 Y122.229 E.00443
; LINE_WIDTH: 0.317297
G1 X145.412 Y122.013 E.00541
M204 S10000
G1 X145.013 Y122.338 F42000
; LINE_WIDTH: 0.692232
G1 F5544.331
M204 S6000
G1 X150.187 Y122.338 E.27377
M204 S10000
G1 X149.788 Y122.013 F42000
; LINE_WIDTH: 0.316522
G1 F7581
M204 S6000
G1 X149.896 Y122.229 E.0054
; LINE_WIDTH: 0.266777
G1 X150.004 Y122.446 E.00441
; LINE_WIDTH: 0.217033
G1 X150.112 Y122.662 E.00343
; LINE_WIDTH: 0.192342
G1 X150.112 Y133.338 E.12998
; LINE_WIDTH: 0.217451
G1 X150.004 Y133.554 E.00344
; LINE_WIDTH: 0.267319
G1 X149.896 Y133.771 E.00442
; LINE_WIDTH: 0.317186
G1 X149.788 Y133.987 E.00541
M204 S10000
G1 X150.187 Y133.662 F42000
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X145.013 Y133.662 E.27384
M204 S10000
G1 X145.087 Y133.338 F42000
; LINE_WIDTH: 0.217524
G1 F7581
M204 S6000
G1 X145.196 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X145.304 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X145.412 Y133.987 E.00541
; OBJECT_ID: 405
; WIPE_START
G1 F13120.648
G1 X145.304 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X138.707 Y129.932 Z8.6 F42000
G1 X126.565 Y122.866 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X130.234 Y122.866 E.12171
G1 X130.234 Y133.134 E.34062
G1 X125.766 Y133.134 E.14822
G1 X125.766 Y122.866 E.34062
G1 X126.505 Y122.866 E.02452
M204 S10000
G1 X126.565 Y123.273 F42000
G1 F7581
M204 S6000
G1 X129.827 Y123.273 E.10821
G1 X129.827 Y132.727 E.31361
G1 X126.173 Y132.727 E.12121
G1 X126.173 Y123.273 E.31361
G1 X126.505 Y123.273 E.01102
M204 S250
G1 X126.565 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X129.435 Y123.665 E.08819
G1 X129.435 Y132.335 E.2664
G1 X126.565 Y132.335 E.08819
G1 X126.565 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.565 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.243 Y130.954 Z8.6 F42000
G1 X125.209 Y134.191 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X125.209 Y121.81 E.41071
G1 X130.79 Y121.809 E.18514
G1 X130.791 Y134.19 E.4107
G1 X125.269 Y134.191 E.18317
M204 S10000
G1 X124.802 Y134.598 F42000
G1 F7581
M204 S6000
G1 X124.802 Y121.403 E.43772
G1 X131.197 Y121.402 E.21215
G1 X131.198 Y134.597 E.43771
G1 X124.862 Y134.598 E.21017
M204 S250
G1 X124.41 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X124.411 Y121.183 E.41817
G3 X124.593 Y121.01 I.194 J.023 E.00837
G1 X131.436 Y121.014 E.21026
G3 X131.59 Y121.196 I-.039 J.188 E.00787
G1 X131.59 Y134.788 E.41766
G3 X131.408 Y134.99 I-.192 J.009 E.00927
G1 X124.583 Y134.989 E.2097
G3 X124.418 Y134.852 I.021 J-.193 E.00699
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.417 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.413 Y133.662 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X130.587 Y133.662 E.27384
M204 S10000
G1 X130.188 Y133.987 F42000
; LINE_WIDTH: 0.317186
G1 F7581
M204 S6000
G1 X130.296 Y133.771 E.00541
; LINE_WIDTH: 0.267319
G1 X130.404 Y133.554 E.00442
; LINE_WIDTH: 0.217451
G1 X130.512 Y133.338 E.00344
; LINE_WIDTH: 0.192342
G1 X130.512 Y122.662 E.12998
; LINE_WIDTH: 0.217033
G1 X130.404 Y122.446 E.00343
; LINE_WIDTH: 0.266777
G1 X130.296 Y122.229 E.00441
; LINE_WIDTH: 0.316522
G1 X130.188 Y122.013 E.0054
M204 S10000
G1 X130.587 Y122.338 F42000
; LINE_WIDTH: 0.692232
M73 P69 R6
G1 F5544.331
M204 S6000
G1 X125.413 Y122.338 E.27377
M204 S10000
G1 X125.812 Y122.013 F42000
; LINE_WIDTH: 0.317297
G1 F7581
M204 S6000
G1 X125.704 Y122.229 E.00541
; LINE_WIDTH: 0.26741
G1 X125.596 Y122.446 E.00443
; LINE_WIDTH: 0.193133
G1 X125.487 Y122.662 E.00296
G1 X125.487 Y133.338 E.13067
; LINE_WIDTH: 0.217524
G1 X125.596 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X125.704 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X125.812 Y133.987 E.00541
; OBJECT_ID: 394
; WIPE_START
G1 F13120.648
G1 X125.704 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X119.107 Y129.932 Z8.6 F42000
G1 X106.965 Y122.866 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X110.634 Y122.866 E.12171
G1 X110.634 Y133.134 E.34062
G1 X106.166 Y133.134 E.14822
G1 X106.166 Y122.866 E.34062
G1 X106.905 Y122.866 E.02452
M204 S10000
G1 X106.965 Y123.273 F42000
G1 F7581
M204 S6000
G1 X110.227 Y123.273 E.10821
G1 X110.227 Y132.727 E.31361
G1 X106.573 Y132.727 E.12121
G1 X106.573 Y123.273 E.31361
G1 X106.905 Y123.273 E.01102
M204 S250
G1 X106.965 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X109.835 Y123.665 E.08819
G1 X109.835 Y132.335 E.2664
G1 X106.965 Y132.335 E.08819
G1 X106.965 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X108.965 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.643 Y130.954 Z8.6 F42000
G1 X105.609 Y134.191 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X105.609 Y121.81 E.41071
G1 X111.19 Y121.809 E.18514
G1 X111.191 Y134.19 E.4107
G1 X105.669 Y134.191 E.18317
M204 S10000
G1 X105.202 Y134.598 F42000
G1 F7581
M204 S6000
G1 X105.202 Y121.403 E.43772
G1 X111.597 Y121.402 E.21215
G1 X111.598 Y134.597 E.43771
G1 X105.262 Y134.598 E.21017
M204 S250
G1 X104.81 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X104.811 Y121.183 E.41817
G3 X104.993 Y121.01 I.194 J.023 E.00837
G1 X111.836 Y121.014 E.21026
G3 X111.99 Y121.196 I-.039 J.188 E.00787
G1 X111.99 Y134.788 E.41766
G3 X111.808 Y134.99 I-.192 J.009 E.00927
G1 X104.983 Y134.989 E.2097
G3 X104.818 Y134.852 I.021 J-.193 E.00699
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.817 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.813 Y133.662 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X110.987 Y133.662 E.27384
M204 S10000
G1 X110.588 Y133.987 F42000
; LINE_WIDTH: 0.317186
G1 F7581
M204 S6000
G1 X110.696 Y133.771 E.00541
; LINE_WIDTH: 0.267319
G1 X110.804 Y133.554 E.00442
; LINE_WIDTH: 0.217451
G1 X110.912 Y133.338 E.00344
; LINE_WIDTH: 0.192342
G1 X110.912 Y122.662 E.12998
; LINE_WIDTH: 0.217033
G1 X110.804 Y122.446 E.00343
; LINE_WIDTH: 0.266777
G1 X110.696 Y122.229 E.00441
; LINE_WIDTH: 0.316522
G1 X110.588 Y122.013 E.0054
M204 S10000
G1 X110.987 Y122.338 F42000
; LINE_WIDTH: 0.692232
G1 F5544.331
M204 S6000
G1 X105.813 Y122.338 E.27377
M204 S10000
G1 X106.212 Y122.013 F42000
; LINE_WIDTH: 0.317297
G1 F7581
M204 S6000
G1 X106.104 Y122.229 E.00541
; LINE_WIDTH: 0.26741
G1 X105.996 Y122.446 E.00443
; LINE_WIDTH: 0.193133
G1 X105.887 Y122.662 E.00296
G1 X105.887 Y133.338 E.13067
; LINE_WIDTH: 0.217524
G1 X105.996 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X106.104 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X106.212 Y133.987 E.00541
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F13120.648
G1 X106.104 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 42/73
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z8.6 I.32 J1.174 P1  F42000
G1 X146.165 Y122.866 Z8.6
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7580
M204 S6000
G1 X149.834 Y122.866 E.12171
G1 X149.834 Y133.134 E.34062
G1 X145.366 Y133.134 E.14822
G1 X145.366 Y122.866 E.34062
G1 X146.105 Y122.866 E.02452
M204 S10000
G1 X146.165 Y123.273 F42000
G1 F7580
M204 S6000
G1 X149.427 Y123.273 E.10821
G1 X149.427 Y132.727 E.31361
G1 X145.773 Y132.727 E.12121
G1 X145.773 Y123.273 E.31361
G1 X146.105 Y123.273 E.01102
M204 S250
G1 X146.165 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7580
M204 S5000
G1 X149.035 Y123.665 E.08819
G1 X149.035 Y132.335 E.2664
G1 X146.165 Y132.335 E.08819
G1 X146.165 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.165 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.843 Y130.954 Z8.8 F42000
G1 X144.809 Y134.191 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7580
M204 S6000
G1 X144.809 Y121.81 E.41071
G1 X150.39 Y121.809 E.18514
G1 X150.391 Y134.19 E.4107
G1 X144.869 Y134.191 E.18317
M204 S10000
G1 X144.402 Y134.598 F42000
G1 F7580
M204 S6000
G1 X144.402 Y121.403 E.43772
G1 X150.797 Y121.402 E.21215
G1 X150.798 Y134.597 E.43771
G1 X144.462 Y134.598 E.21017
M204 S250
G1 X144.01 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7580
M204 S5000
G1 X144.011 Y121.184 E.41814
G3 X144.192 Y121.01 I.194 J.022 E.00836
G1 X151.036 Y121.014 E.21029
G3 X151.19 Y121.196 I-.04 J.19 E.00786
G1 X151.182 Y134.853 E.41963
G3 X151.007 Y134.99 I-.185 J-.056 E.00729
G1 X144.183 Y134.989 E.20967
G3 X144.019 Y134.852 I.024 J-.196 E.00694
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.018 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 42 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.8
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer42 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X145.087 Y133.338 F42000
G1 Z8.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.193133
G1 F7580
M204 S6000
G1 X145.087 Y122.662 E.13067
G1 X145.196 Y122.446 E.00296
; LINE_WIDTH: 0.26741
G1 X145.304 Y122.23 E.00443
; LINE_WIDTH: 0.317297
G1 X145.412 Y122.013 E.00541
M204 S10000
G1 X145.013 Y122.338 F42000
; LINE_WIDTH: 0.692235
G1 F5544.305
M204 S6000
G1 X150.187 Y122.338 E.27377
M204 S10000
G1 X149.788 Y122.013 F42000
; LINE_WIDTH: 0.316522
G1 F7580
M204 S6000
G1 X149.896 Y122.229 E.0054
; LINE_WIDTH: 0.266777
G1 X150.004 Y122.446 E.00441
; LINE_WIDTH: 0.217033
G1 X150.112 Y122.662 E.00343
; LINE_WIDTH: 0.192342
G1 X150.112 Y133.338 E.12998
; LINE_WIDTH: 0.217451
G1 X150.004 Y133.554 E.00344
; LINE_WIDTH: 0.267319
G1 X149.896 Y133.771 E.00442
; LINE_WIDTH: 0.317186
G1 X149.788 Y133.987 E.00541
M204 S10000
G1 X150.187 Y133.662 F42000
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X145.013 Y133.662 E.27384
M204 S10000
G1 X145.087 Y133.338 F42000
; LINE_WIDTH: 0.217524
G1 F7580
M204 S6000
G1 X145.196 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X145.304 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X145.412 Y133.987 E.00541
; OBJECT_ID: 405
; WIPE_START
G1 F13120.648
G1 X145.304 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X138.707 Y129.932 Z8.8 F42000
G1 X126.565 Y122.866 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7580
M204 S6000
G1 X130.234 Y122.866 E.12171
G1 X130.234 Y133.134 E.34062
G1 X125.766 Y133.134 E.14822
G1 X125.766 Y122.866 E.34062
G1 X126.505 Y122.866 E.02452
M204 S10000
G1 X126.565 Y123.273 F42000
G1 F7580
M204 S6000
G1 X129.827 Y123.273 E.10821
G1 X129.827 Y132.727 E.31361
G1 X126.173 Y132.727 E.12121
G1 X126.173 Y123.273 E.31361
G1 X126.505 Y123.273 E.01102
M204 S250
G1 X126.565 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7580
M204 S5000
G1 X129.435 Y123.665 E.08819
G1 X129.435 Y132.335 E.2664
G1 X126.565 Y132.335 E.08819
G1 X126.565 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.565 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.243 Y130.954 Z8.8 F42000
G1 X125.209 Y134.191 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7580
M204 S6000
G1 X125.209 Y121.81 E.41071
G1 X130.79 Y121.809 E.18514
G1 X130.791 Y134.19 E.4107
G1 X125.269 Y134.191 E.18317
M204 S10000
G1 X124.802 Y134.598 F42000
G1 F7580
M204 S6000
G1 X124.802 Y121.403 E.43772
G1 X131.197 Y121.402 E.21215
G1 X131.198 Y134.597 E.43771
G1 X124.862 Y134.598 E.21017
M204 S250
G1 X124.41 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7580
M204 S5000
G1 X124.411 Y121.184 E.41814
G3 X124.592 Y121.01 I.194 J.022 E.00836
G1 X131.436 Y121.014 E.21029
G3 X131.59 Y121.196 I-.04 J.19 E.00786
G1 X131.582 Y134.853 E.41963
G3 X131.407 Y134.99 I-.185 J-.056 E.00729
G1 X124.583 Y134.989 E.20967
G3 X124.419 Y134.852 I.024 J-.196 E.00694
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.418 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.413 Y133.662 Z8.8 F42000
G1 Z8.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X130.587 Y133.662 E.27384
M204 S10000
G1 X130.188 Y133.987 F42000
; LINE_WIDTH: 0.317186
G1 F7580
M204 S6000
G1 X130.296 Y133.771 E.00541
; LINE_WIDTH: 0.267319
G1 X130.404 Y133.554 E.00442
; LINE_WIDTH: 0.217451
G1 X130.512 Y133.338 E.00344
; LINE_WIDTH: 0.192342
G1 X130.512 Y122.662 E.12998
; LINE_WIDTH: 0.217033
G1 X130.404 Y122.446 E.00343
; LINE_WIDTH: 0.266777
G1 X130.296 Y122.229 E.00441
; LINE_WIDTH: 0.316522
G1 X130.188 Y122.013 E.0054
M204 S10000
G1 X130.587 Y122.338 F42000
; LINE_WIDTH: 0.692235
G1 F5544.305
M204 S6000
G1 X125.413 Y122.338 E.27377
M204 S10000
G1 X125.812 Y122.013 F42000
; LINE_WIDTH: 0.317297
G1 F7580
M204 S6000
G1 X125.704 Y122.23 E.00541
; LINE_WIDTH: 0.26741
G1 X125.596 Y122.446 E.00443
; LINE_WIDTH: 0.193133
G1 X125.487 Y122.662 E.00296
M73 P70 R6
G1 X125.487 Y133.338 E.13067
; LINE_WIDTH: 0.217524
G1 X125.596 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X125.704 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X125.812 Y133.987 E.00541
; OBJECT_ID: 394
; WIPE_START
G1 F13120.648
G1 X125.704 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X119.107 Y129.932 Z8.8 F42000
G1 X106.965 Y122.866 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7580
M204 S6000
G1 X110.634 Y122.866 E.12171
G1 X110.634 Y133.134 E.34062
G1 X106.166 Y133.134 E.14822
G1 X106.166 Y122.866 E.34062
G1 X106.905 Y122.866 E.02452
M204 S10000
G1 X106.965 Y123.273 F42000
G1 F7580
M204 S6000
G1 X110.227 Y123.273 E.10821
G1 X110.227 Y132.727 E.31361
G1 X106.573 Y132.727 E.12121
G1 X106.573 Y123.273 E.31361
G1 X106.905 Y123.273 E.01102
M204 S250
G1 X106.965 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7580
M204 S5000
G1 X109.835 Y123.665 E.08819
G1 X109.835 Y132.335 E.2664
G1 X106.965 Y132.335 E.08819
G1 X106.965 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X108.965 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.643 Y130.954 Z8.8 F42000
G1 X105.609 Y134.191 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7580
M204 S6000
G1 X105.609 Y121.81 E.41071
G1 X111.19 Y121.809 E.18514
G1 X111.191 Y134.19 E.4107
G1 X105.669 Y134.191 E.18317
M204 S10000
G1 X105.202 Y134.598 F42000
G1 F7580
M204 S6000
G1 X105.202 Y121.403 E.43772
G1 X111.597 Y121.402 E.21215
G1 X111.598 Y134.597 E.43771
G1 X105.262 Y134.598 E.21017
M204 S250
G1 X104.81 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7580
M204 S5000
G1 X104.811 Y121.184 E.41814
G3 X104.992 Y121.01 I.194 J.022 E.00836
G1 X111.836 Y121.014 E.21029
G3 X111.99 Y121.196 I-.04 J.19 E.00786
G1 X111.982 Y134.853 E.41963
G3 X111.807 Y134.99 I-.185 J-.056 E.00729
G1 X104.983 Y134.989 E.20967
G3 X104.819 Y134.852 I.024 J-.196 E.00694
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.818 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.813 Y133.662 Z8.8 F42000
G1 Z8.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X110.987 Y133.662 E.27384
M204 S10000
G1 X110.588 Y133.987 F42000
; LINE_WIDTH: 0.317186
G1 F7580
M204 S6000
G1 X110.696 Y133.771 E.00541
; LINE_WIDTH: 0.267319
G1 X110.804 Y133.554 E.00442
; LINE_WIDTH: 0.217451
G1 X110.912 Y133.338 E.00344
; LINE_WIDTH: 0.192342
G1 X110.912 Y122.662 E.12998
; LINE_WIDTH: 0.217033
G1 X110.804 Y122.446 E.00343
; LINE_WIDTH: 0.266777
G1 X110.696 Y122.229 E.00441
; LINE_WIDTH: 0.316522
G1 X110.588 Y122.013 E.0054
M204 S10000
G1 X110.987 Y122.338 F42000
; LINE_WIDTH: 0.692235
G1 F5544.305
M204 S6000
G1 X105.813 Y122.338 E.27377
M204 S10000
G1 X106.212 Y122.013 F42000
; LINE_WIDTH: 0.317297
G1 F7580
M204 S6000
G1 X106.104 Y122.23 E.00541
; LINE_WIDTH: 0.26741
G1 X105.996 Y122.446 E.00443
; LINE_WIDTH: 0.193133
G1 X105.887 Y122.662 E.00296
G1 X105.887 Y133.338 E.13067
; LINE_WIDTH: 0.217524
G1 X105.996 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X106.104 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X106.212 Y133.987 E.00541
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F13120.648
G1 X106.104 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 43/73
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z8.8 I.32 J1.174 P1  F42000
G1 X146.165 Y122.866 Z8.8
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X149.834 Y122.866 E.12171
G1 X149.834 Y133.134 E.34062
G1 X145.366 Y133.134 E.14822
G1 X145.366 Y122.866 E.34062
G1 X146.105 Y122.866 E.02452
M204 S10000
G1 X146.165 Y123.273 F42000
G1 F7581
M204 S6000
G1 X149.427 Y123.273 E.10821
G1 X149.427 Y132.727 E.31361
G1 X145.773 Y132.727 E.12121
G1 X145.773 Y123.273 E.31361
G1 X146.105 Y123.273 E.01102
M204 S250
G1 X146.165 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X149.035 Y123.665 E.08819
G1 X149.035 Y132.335 E.2664
G1 X146.165 Y132.335 E.08819
G1 X146.165 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.165 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.843 Y130.954 Z9 F42000
G1 X144.809 Y134.191 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X144.809 Y121.81 E.41071
G1 X150.39 Y121.809 E.18514
G1 X150.391 Y134.19 E.4107
G1 X144.869 Y134.191 E.18317
M204 S10000
G1 X144.402 Y134.598 F42000
G1 F7581
M204 S6000
G1 X144.402 Y121.403 E.43772
G1 X150.797 Y121.402 E.21215
G1 X150.798 Y134.597 E.43771
G1 X144.462 Y134.598 E.21017
M204 S250
G1 X144.01 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X144.011 Y121.183 E.41816
G3 X144.193 Y121.01 I.194 J.022 E.00838
G1 X151.036 Y121.014 E.21026
G3 X151.19 Y121.196 I-.038 J.188 E.00788
G1 X151.19 Y134.789 E.41766
G3 X151.007 Y134.99 I-.192 J.009 E.00929
G1 X144.175 Y134.988 E.2099
G3 X144.019 Y134.851 I.032 J-.195 E.00673
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.018 Y132.851 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 43 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer43 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X145.087 Y133.338 F42000
G1 Z8.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.193133
G1 F7581
M204 S6000
G1 X145.087 Y122.662 E.13067
G1 X145.196 Y122.446 E.00296
; LINE_WIDTH: 0.26741
G1 X145.304 Y122.229 E.00443
; LINE_WIDTH: 0.317297
G1 X145.412 Y122.013 E.00541
M204 S10000
G1 X145.013 Y122.338 F42000
; LINE_WIDTH: 0.692232
G1 F5544.331
M204 S6000
G1 X150.187 Y122.338 E.27377
M204 S10000
G1 X149.788 Y122.013 F42000
; LINE_WIDTH: 0.316522
G1 F7581
M204 S6000
G1 X149.896 Y122.229 E.0054
; LINE_WIDTH: 0.266777
G1 X150.004 Y122.446 E.00441
; LINE_WIDTH: 0.217033
G1 X150.112 Y122.662 E.00343
; LINE_WIDTH: 0.192342
G1 X150.112 Y133.338 E.12998
; LINE_WIDTH: 0.217451
G1 X150.004 Y133.554 E.00344
; LINE_WIDTH: 0.267319
G1 X149.896 Y133.771 E.00442
; LINE_WIDTH: 0.317186
G1 X149.788 Y133.987 E.00541
M204 S10000
G1 X150.187 Y133.662 F42000
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X145.013 Y133.662 E.27384
M204 S10000
G1 X145.087 Y133.338 F42000
; LINE_WIDTH: 0.217524
G1 F7581
M204 S6000
G1 X145.196 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X145.304 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X145.412 Y133.987 E.00541
; OBJECT_ID: 405
; WIPE_START
G1 F13120.648
G1 X145.304 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X138.707 Y129.932 Z9 F42000
G1 X126.565 Y122.866 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X130.234 Y122.866 E.12171
G1 X130.234 Y133.134 E.34062
G1 X125.766 Y133.134 E.14822
G1 X125.766 Y122.866 E.34062
G1 X126.505 Y122.866 E.02452
M204 S10000
G1 X126.565 Y123.273 F42000
G1 F7581
M204 S6000
G1 X129.827 Y123.273 E.10821
G1 X129.827 Y132.727 E.31361
G1 X126.173 Y132.727 E.12121
G1 X126.173 Y123.273 E.31361
G1 X126.505 Y123.273 E.01102
M204 S250
G1 X126.565 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X129.435 Y123.665 E.08819
G1 X129.435 Y132.335 E.2664
G1 X126.565 Y132.335 E.08819
G1 X126.565 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.565 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.243 Y130.954 Z9 F42000
G1 X125.209 Y134.191 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X125.209 Y121.81 E.41071
G1 X130.79 Y121.809 E.18514
G1 X130.791 Y134.19 E.4107
G1 X125.269 Y134.191 E.18317
M204 S10000
G1 X124.802 Y134.598 F42000
G1 F7581
M204 S6000
G1 X124.802 Y121.403 E.43772
G1 X131.197 Y121.402 E.21215
G1 X131.198 Y134.597 E.43771
G1 X124.862 Y134.598 E.21017
M204 S250
G1 X124.41 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X124.411 Y121.183 E.41816
G3 X124.593 Y121.01 I.194 J.022 E.00838
G1 X131.436 Y121.014 E.21026
G3 X131.59 Y121.196 I-.038 J.188 E.00788
G1 X131.59 Y134.789 E.41766
G3 X131.407 Y134.99 I-.192 J.009 E.00929
G1 X124.575 Y134.988 E.2099
G3 X124.419 Y134.851 I.032 J-.195 E.00673
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.418 Y132.851 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.413 Y133.662 Z9 F42000
G1 Z8.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X130.587 Y133.662 E.27384
M204 S10000
G1 X130.188 Y133.987 F42000
; LINE_WIDTH: 0.317186
G1 F7581
M204 S6000
G1 X130.296 Y133.771 E.00541
; LINE_WIDTH: 0.267319
G1 X130.404 Y133.554 E.00442
; LINE_WIDTH: 0.217451
G1 X130.512 Y133.338 E.00344
; LINE_WIDTH: 0.192342
G1 X130.512 Y122.662 E.12998
; LINE_WIDTH: 0.217033
G1 X130.404 Y122.446 E.00343
; LINE_WIDTH: 0.266777
G1 X130.296 Y122.229 E.00441
; LINE_WIDTH: 0.316522
G1 X130.188 Y122.013 E.0054
M204 S10000
G1 X130.587 Y122.338 F42000
; LINE_WIDTH: 0.692232
G1 F5544.331
M204 S6000
G1 X125.413 Y122.338 E.27377
M204 S10000
G1 X125.812 Y122.013 F42000
; LINE_WIDTH: 0.317297
G1 F7581
M204 S6000
G1 X125.704 Y122.229 E.00541
; LINE_WIDTH: 0.26741
G1 X125.596 Y122.446 E.00443
; LINE_WIDTH: 0.193133
G1 X125.487 Y122.662 E.00296
G1 X125.487 Y133.338 E.13067
; LINE_WIDTH: 0.217524
G1 X125.596 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X125.704 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X125.812 Y133.987 E.00541
; OBJECT_ID: 394
; WIPE_START
G1 F13120.648
G1 X125.704 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X119.107 Y129.932 Z9 F42000
G1 X106.965 Y122.866 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X110.634 Y122.866 E.12171
G1 X110.634 Y133.134 E.34062
G1 X106.166 Y133.134 E.14822
G1 X106.166 Y122.866 E.34062
G1 X106.905 Y122.866 E.02452
M204 S10000
G1 X106.965 Y123.273 F42000
G1 F7581
M204 S6000
G1 X110.227 Y123.273 E.10821
G1 X110.227 Y132.727 E.31361
G1 X106.573 Y132.727 E.12121
G1 X106.573 Y123.273 E.31361
G1 X106.905 Y123.273 E.01102
M204 S250
G1 X106.965 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X109.835 Y123.665 E.08819
G1 X109.835 Y132.335 E.2664
G1 X106.965 Y132.335 E.08819
G1 X106.965 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X108.965 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.643 Y130.954 Z9 F42000
G1 X105.609 Y134.191 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X105.609 Y121.81 E.41071
G1 X111.19 Y121.809 E.18514
G1 X111.191 Y134.19 E.4107
G1 X105.669 Y134.191 E.18317
M204 S10000
G1 X105.202 Y134.598 F42000
G1 F7581
M204 S6000
G1 X105.202 Y121.403 E.43772
G1 X111.597 Y121.402 E.21215
G1 X111.598 Y134.597 E.43771
G1 X105.262 Y134.598 E.21017
M204 S250
G1 X104.81 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X104.811 Y121.183 E.41816
G3 X104.993 Y121.01 I.194 J.022 E.00838
M73 P71 R6
G1 X111.836 Y121.014 E.21026
G3 X111.99 Y121.196 I-.038 J.188 E.00788
G1 X111.99 Y134.789 E.41766
G3 X111.807 Y134.99 I-.192 J.009 E.00929
G1 X104.975 Y134.988 E.2099
G3 X104.819 Y134.851 I.032 J-.195 E.00673
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.818 Y132.851 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.813 Y133.662 Z9 F42000
G1 Z8.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X110.987 Y133.662 E.27384
M204 S10000
G1 X110.588 Y133.987 F42000
; LINE_WIDTH: 0.317186
G1 F7581
M204 S6000
G1 X110.696 Y133.771 E.00541
; LINE_WIDTH: 0.267319
G1 X110.804 Y133.554 E.00442
; LINE_WIDTH: 0.217451
G1 X110.912 Y133.338 E.00344
; LINE_WIDTH: 0.192342
G1 X110.912 Y122.662 E.12998
; LINE_WIDTH: 0.217033
G1 X110.804 Y122.446 E.00343
; LINE_WIDTH: 0.266777
G1 X110.696 Y122.229 E.00441
; LINE_WIDTH: 0.316522
G1 X110.588 Y122.013 E.0054
M204 S10000
G1 X110.987 Y122.338 F42000
; LINE_WIDTH: 0.692232
G1 F5544.331
M204 S6000
G1 X105.813 Y122.338 E.27377
M204 S10000
G1 X106.212 Y122.013 F42000
; LINE_WIDTH: 0.317297
G1 F7581
M204 S6000
G1 X106.104 Y122.229 E.00541
; LINE_WIDTH: 0.26741
G1 X105.996 Y122.446 E.00443
; LINE_WIDTH: 0.193133
G1 X105.887 Y122.662 E.00296
G1 X105.887 Y133.338 E.13067
; LINE_WIDTH: 0.217524
G1 X105.996 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X106.104 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X106.212 Y133.987 E.00541
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F13120.648
G1 X106.104 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 44/73
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z9 I.32 J1.174 P1  F42000
G1 X146.165 Y122.866 Z9
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X149.834 Y122.866 E.12171
G1 X149.834 Y133.134 E.34062
G1 X145.366 Y133.134 E.14822
G1 X145.366 Y122.866 E.34062
G1 X146.105 Y122.866 E.02452
M204 S10000
G1 X146.165 Y123.273 F42000
G1 F7581
M204 S6000
G1 X149.427 Y123.273 E.10821
G1 X149.427 Y132.727 E.31361
G1 X145.773 Y132.727 E.12121
G1 X145.773 Y123.273 E.31361
G1 X146.105 Y123.273 E.01102
M204 S250
G1 X146.165 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X149.035 Y123.665 E.08819
G1 X149.035 Y132.335 E.2664
G1 X146.165 Y132.335 E.08819
G1 X146.165 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.165 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.843 Y130.954 Z9.2 F42000
G1 X144.809 Y134.191 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X144.809 Y121.81 E.41071
G1 X150.39 Y121.809 E.18514
G1 X150.391 Y134.19 E.4107
G1 X144.869 Y134.191 E.18317
M204 S10000
G1 X144.402 Y134.598 F42000
G1 F7581
M204 S6000
G1 X144.402 Y121.403 E.43772
G1 X150.797 Y121.402 E.21215
G1 X150.798 Y134.597 E.43771
G1 X144.462 Y134.598 E.21017
M204 S250
G1 X144.01 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X144.011 Y121.183 E.41816
G3 X144.193 Y121.01 I.194 J.022 E.00838
G1 X151.036 Y121.014 E.21026
G3 X151.19 Y121.196 I-.04 J.19 E.00786
G1 X151.19 Y134.788 E.41766
G3 X151.007 Y134.99 I-.192 J.009 E.00929
G1 X144.183 Y134.989 E.20966
G3 X144.019 Y134.851 I.024 J-.196 E.00697
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.018 Y132.851 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 44 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.2
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer44 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X145.087 Y133.338 F42000
G1 Z8.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.193133
G1 F7581
M204 S6000
G1 X145.087 Y122.662 E.13067
G1 X145.196 Y122.446 E.00296
; LINE_WIDTH: 0.26741
G1 X145.304 Y122.23 E.00443
; LINE_WIDTH: 0.317297
G1 X145.412 Y122.013 E.00541
M204 S10000
G1 X145.013 Y122.338 F42000
; LINE_WIDTH: 0.692246
G1 F5544.213
M204 S6000
G1 X150.187 Y122.338 E.27378
M204 S10000
G1 X149.788 Y122.013 F42000
; LINE_WIDTH: 0.316522
G1 F7581
M204 S6000
G1 X149.896 Y122.229 E.0054
; LINE_WIDTH: 0.266777
G1 X150.004 Y122.446 E.00442
; LINE_WIDTH: 0.217033
G1 X150.112 Y122.662 E.00343
; LINE_WIDTH: 0.192342
G1 X150.112 Y133.338 E.12998
; LINE_WIDTH: 0.217451
G1 X150.004 Y133.554 E.00344
; LINE_WIDTH: 0.267319
G1 X149.896 Y133.771 E.00442
; LINE_WIDTH: 0.317186
G1 X149.788 Y133.987 E.00541
M204 S10000
G1 X150.187 Y133.662 F42000
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X145.013 Y133.662 E.27384
M204 S10000
G1 X145.087 Y133.338 F42000
; LINE_WIDTH: 0.217524
G1 F7581
M204 S6000
G1 X145.196 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X145.304 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X145.412 Y133.987 E.00541
; OBJECT_ID: 405
; WIPE_START
G1 F13120.648
G1 X145.304 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X138.707 Y129.932 Z9.2 F42000
G1 X126.565 Y122.866 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X130.234 Y122.866 E.12171
G1 X130.234 Y133.134 E.34062
G1 X125.766 Y133.134 E.14822
G1 X125.766 Y122.866 E.34062
G1 X126.505 Y122.866 E.02452
M204 S10000
G1 X126.565 Y123.273 F42000
G1 F7581
M204 S6000
G1 X129.827 Y123.273 E.10821
G1 X129.827 Y132.727 E.31361
G1 X126.173 Y132.727 E.12121
G1 X126.173 Y123.273 E.31361
G1 X126.505 Y123.273 E.01102
M204 S250
G1 X126.565 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X129.435 Y123.665 E.08819
G1 X129.435 Y132.335 E.2664
G1 X126.565 Y132.335 E.08819
G1 X126.565 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.565 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.243 Y130.954 Z9.2 F42000
G1 X125.209 Y134.191 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X125.209 Y121.81 E.41071
G1 X130.79 Y121.809 E.18514
G1 X130.791 Y134.19 E.4107
G1 X125.269 Y134.191 E.18317
M204 S10000
G1 X124.802 Y134.598 F42000
G1 F7581
M204 S6000
G1 X124.802 Y121.403 E.43772
G1 X131.197 Y121.402 E.21215
G1 X131.198 Y134.597 E.43771
G1 X124.862 Y134.598 E.21017
M204 S250
G1 X124.41 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X124.411 Y121.183 E.41816
G3 X124.593 Y121.01 I.194 J.022 E.00838
G1 X131.436 Y121.014 E.21026
G3 X131.59 Y121.196 I-.04 J.19 E.00786
G1 X131.59 Y134.788 E.41766
G3 X131.407 Y134.99 I-.192 J.009 E.00929
G1 X124.583 Y134.989 E.20966
G3 X124.419 Y134.851 I.024 J-.196 E.00697
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.418 Y132.851 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.413 Y133.662 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X130.587 Y133.662 E.27384
M204 S10000
G1 X130.188 Y133.987 F42000
; LINE_WIDTH: 0.317186
G1 F7581
M204 S6000
G1 X130.296 Y133.771 E.00541
; LINE_WIDTH: 0.267319
G1 X130.404 Y133.554 E.00442
; LINE_WIDTH: 0.217451
G1 X130.512 Y133.338 E.00344
; LINE_WIDTH: 0.192342
G1 X130.512 Y122.662 E.12998
; LINE_WIDTH: 0.217033
G1 X130.404 Y122.446 E.00343
; LINE_WIDTH: 0.266777
G1 X130.296 Y122.229 E.00442
; LINE_WIDTH: 0.316522
G1 X130.188 Y122.013 E.0054
M204 S10000
G1 X130.587 Y122.338 F42000
; LINE_WIDTH: 0.692246
G1 F5544.213
M204 S6000
G1 X125.413 Y122.338 E.27378
M204 S10000
G1 X125.812 Y122.013 F42000
; LINE_WIDTH: 0.317297
G1 F7581
M204 S6000
G1 X125.704 Y122.23 E.00541
; LINE_WIDTH: 0.26741
G1 X125.596 Y122.446 E.00443
; LINE_WIDTH: 0.193133
G1 X125.487 Y122.662 E.00296
G1 X125.487 Y133.338 E.13067
; LINE_WIDTH: 0.217524
G1 X125.596 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X125.704 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X125.812 Y133.987 E.00541
; OBJECT_ID: 394
; WIPE_START
G1 F13120.648
G1 X125.704 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X119.107 Y129.932 Z9.2 F42000
G1 X106.965 Y122.866 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X110.634 Y122.866 E.12171
G1 X110.634 Y133.134 E.34062
G1 X106.166 Y133.134 E.14822
G1 X106.166 Y122.866 E.34062
G1 X106.905 Y122.866 E.02452
M204 S10000
G1 X106.965 Y123.273 F42000
G1 F7581
M204 S6000
G1 X110.227 Y123.273 E.10821
G1 X110.227 Y132.727 E.31361
G1 X106.573 Y132.727 E.12121
G1 X106.573 Y123.273 E.31361
G1 X106.905 Y123.273 E.01102
M204 S250
G1 X106.965 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X109.835 Y123.665 E.08819
G1 X109.835 Y132.335 E.2664
G1 X106.965 Y132.335 E.08819
G1 X106.965 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X108.965 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.643 Y130.954 Z9.2 F42000
G1 X105.609 Y134.191 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X105.609 Y121.81 E.41071
G1 X111.19 Y121.809 E.18514
G1 X111.191 Y134.19 E.4107
G1 X105.669 Y134.191 E.18317
M204 S10000
G1 X105.202 Y134.598 F42000
G1 F7581
M204 S6000
G1 X105.202 Y121.403 E.43772
G1 X111.597 Y121.402 E.21215
G1 X111.598 Y134.597 E.43771
G1 X105.262 Y134.598 E.21017
M204 S250
G1 X104.81 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X104.811 Y121.183 E.41816
G3 X104.993 Y121.01 I.194 J.022 E.00838
G1 X111.836 Y121.014 E.21026
G3 X111.99 Y121.196 I-.04 J.19 E.00786
G1 X111.99 Y134.788 E.41766
G3 X111.807 Y134.99 I-.192 J.009 E.00929
G1 X104.983 Y134.989 E.20966
G3 X104.819 Y134.851 I.024 J-.196 E.00697
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.818 Y132.851 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.813 Y133.662 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X110.987 Y133.662 E.27384
M204 S10000
G1 X110.588 Y133.987 F42000
; LINE_WIDTH: 0.317186
G1 F7581
M204 S6000
G1 X110.696 Y133.771 E.00541
; LINE_WIDTH: 0.267319
G1 X110.804 Y133.554 E.00442
; LINE_WIDTH: 0.217451
G1 X110.912 Y133.338 E.00344
; LINE_WIDTH: 0.192342
G1 X110.912 Y122.662 E.12998
; LINE_WIDTH: 0.217033
G1 X110.804 Y122.446 E.00343
; LINE_WIDTH: 0.266777
G1 X110.696 Y122.229 E.00442
; LINE_WIDTH: 0.316522
G1 X110.588 Y122.013 E.0054
M204 S10000
G1 X110.987 Y122.338 F42000
; LINE_WIDTH: 0.692246
G1 F5544.213
M204 S6000
G1 X105.813 Y122.338 E.27378
M204 S10000
G1 X106.212 Y122.013 F42000
; LINE_WIDTH: 0.317297
G1 F7581
M204 S6000
G1 X106.104 Y122.23 E.00541
; LINE_WIDTH: 0.26741
G1 X105.996 Y122.446 E.00443
; LINE_WIDTH: 0.193133
G1 X105.887 Y122.662 E.00296
G1 X105.887 Y133.338 E.13067
; LINE_WIDTH: 0.217524
G1 X105.996 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X106.104 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X106.212 Y133.987 E.00541
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F13120.648
G1 X106.104 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 45/73
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z9.2 I.32 J1.174 P1  F42000
M73 P72 R6
G1 X146.165 Y122.866 Z9.2
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X149.834 Y122.866 E.12171
G1 X149.834 Y133.134 E.34062
G1 X145.366 Y133.134 E.14822
G1 X145.366 Y122.866 E.34062
G1 X146.105 Y122.866 E.02452
M204 S10000
G1 X146.165 Y123.273 F42000
G1 F7581
M204 S6000
G1 X149.427 Y123.273 E.10821
G1 X149.427 Y132.727 E.31361
G1 X145.773 Y132.727 E.12121
G1 X145.773 Y123.273 E.31361
G1 X146.105 Y123.273 E.01102
M204 S250
G1 X146.165 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X149.035 Y123.665 E.08819
G1 X149.035 Y132.335 E.2664
G1 X146.165 Y132.335 E.08819
G1 X146.165 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.165 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.843 Y130.954 Z9.4 F42000
G1 X144.809 Y134.191 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X144.809 Y121.81 E.41071
G1 X150.39 Y121.809 E.18514
G1 X150.391 Y134.19 E.4107
G1 X144.869 Y134.191 E.18317
M204 S10000
G1 X144.402 Y134.598 F42000
G1 F7581
M204 S6000
G1 X144.402 Y121.403 E.43772
G1 X150.797 Y121.402 E.21215
G1 X150.798 Y134.597 E.43771
G1 X144.462 Y134.598 E.21017
M204 S250
G1 X144.01 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X144.01 Y121.21 E.41732
G3 X144.193 Y121.01 I.191 J-.009 E.00926
G1 X151.036 Y121.014 E.21026
G3 X151.19 Y121.196 I-.04 J.19 E.00786
G1 X151.189 Y134.816 E.41851
G3 X151.007 Y134.99 I-.195 J-.022 E.00839
G1 X144.175 Y134.988 E.20992
G3 X144.019 Y134.852 I.031 J-.193 E.0067
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.017 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 45 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.4
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer45 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X145.087 Y133.338 F42000
G1 Z9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.193133
G1 F7581
M204 S6000
G1 X145.087 Y122.662 E.13067
G1 X145.196 Y122.446 E.00296
; LINE_WIDTH: 0.26741
G1 X145.304 Y122.23 E.00443
; LINE_WIDTH: 0.317297
G1 X145.412 Y122.013 E.00541
M204 S10000
G1 X145.013 Y122.338 F42000
; LINE_WIDTH: 0.692247
G1 F5544.208
M204 S6000
G1 X150.187 Y122.338 E.27378
M204 S10000
G1 X149.788 Y122.013 F42000
; LINE_WIDTH: 0.316522
G1 F7581
M204 S6000
G1 X149.896 Y122.229 E.0054
; LINE_WIDTH: 0.266777
G1 X150.004 Y122.446 E.00442
; LINE_WIDTH: 0.217033
G1 X150.112 Y122.662 E.00343
; LINE_WIDTH: 0.192342
G1 X150.112 Y133.338 E.12998
; LINE_WIDTH: 0.217451
G1 X150.004 Y133.554 E.00344
; LINE_WIDTH: 0.267319
G1 X149.896 Y133.771 E.00442
; LINE_WIDTH: 0.317186
G1 X149.788 Y133.987 E.00541
M204 S10000
G1 X150.187 Y133.662 F42000
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X145.013 Y133.662 E.27384
M204 S10000
G1 X145.087 Y133.338 F42000
; LINE_WIDTH: 0.217524
G1 F7581
M204 S6000
G1 X145.196 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X145.304 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X145.412 Y133.987 E.00541
; OBJECT_ID: 405
; WIPE_START
G1 F13120.648
G1 X145.304 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X138.707 Y129.932 Z9.4 F42000
G1 X126.565 Y122.866 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X130.234 Y122.866 E.12171
G1 X130.234 Y133.134 E.34062
G1 X125.766 Y133.134 E.14822
G1 X125.766 Y122.866 E.34062
G1 X126.505 Y122.866 E.02452
M204 S10000
G1 X126.565 Y123.273 F42000
G1 F7581
M204 S6000
G1 X129.827 Y123.273 E.10821
G1 X129.827 Y132.727 E.31361
G1 X126.173 Y132.727 E.12121
G1 X126.173 Y123.273 E.31361
G1 X126.505 Y123.273 E.01102
M204 S250
G1 X126.565 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X129.435 Y123.665 E.08819
G1 X129.435 Y132.335 E.2664
G1 X126.565 Y132.335 E.08819
G1 X126.565 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.565 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.243 Y130.954 Z9.4 F42000
G1 X125.209 Y134.191 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X125.209 Y121.81 E.41071
G1 X130.79 Y121.809 E.18514
G1 X130.791 Y134.19 E.4107
G1 X125.269 Y134.191 E.18317
M204 S10000
G1 X124.802 Y134.598 F42000
G1 F7581
M204 S6000
G1 X124.802 Y121.403 E.43772
G1 X131.197 Y121.402 E.21215
G1 X131.198 Y134.597 E.43771
G1 X124.862 Y134.598 E.21017
M204 S250
G1 X124.41 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X124.41 Y121.21 E.41732
G3 X124.593 Y121.01 I.191 J-.009 E.00926
G1 X131.436 Y121.014 E.21026
G3 X131.59 Y121.196 I-.04 J.19 E.00786
G1 X131.589 Y134.816 E.41851
G3 X131.407 Y134.99 I-.195 J-.022 E.00839
G1 X124.575 Y134.988 E.20992
G3 X124.419 Y134.852 I.031 J-.193 E.0067
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.417 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.413 Y133.662 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X130.587 Y133.662 E.27384
M204 S10000
G1 X130.188 Y133.987 F42000
; LINE_WIDTH: 0.317186
G1 F7581
M204 S6000
G1 X130.296 Y133.771 E.00541
; LINE_WIDTH: 0.267319
G1 X130.404 Y133.554 E.00442
; LINE_WIDTH: 0.217451
G1 X130.512 Y133.338 E.00344
; LINE_WIDTH: 0.192342
G1 X130.512 Y122.662 E.12998
; LINE_WIDTH: 0.217033
G1 X130.404 Y122.446 E.00343
; LINE_WIDTH: 0.266777
G1 X130.296 Y122.229 E.00442
; LINE_WIDTH: 0.316522
G1 X130.188 Y122.013 E.0054
M204 S10000
G1 X130.587 Y122.338 F42000
; LINE_WIDTH: 0.692247
G1 F5544.208
M204 S6000
G1 X125.413 Y122.338 E.27378
M204 S10000
G1 X125.812 Y122.013 F42000
; LINE_WIDTH: 0.317297
G1 F7581
M204 S6000
G1 X125.704 Y122.23 E.00541
; LINE_WIDTH: 0.26741
G1 X125.596 Y122.446 E.00443
; LINE_WIDTH: 0.193133
G1 X125.487 Y122.662 E.00296
G1 X125.487 Y133.338 E.13067
; LINE_WIDTH: 0.217524
G1 X125.596 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X125.704 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X125.812 Y133.987 E.00541
; OBJECT_ID: 394
; WIPE_START
G1 F13120.648
G1 X125.704 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X119.107 Y129.932 Z9.4 F42000
G1 X106.965 Y122.866 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X110.634 Y122.866 E.12171
G1 X110.634 Y133.134 E.34062
G1 X106.166 Y133.134 E.14822
G1 X106.166 Y122.866 E.34062
G1 X106.905 Y122.866 E.02452
M204 S10000
G1 X106.965 Y123.273 F42000
G1 F7581
M204 S6000
G1 X110.227 Y123.273 E.10821
G1 X110.227 Y132.727 E.31361
G1 X106.573 Y132.727 E.12121
G1 X106.573 Y123.273 E.31361
G1 X106.905 Y123.273 E.01102
M204 S250
G1 X106.965 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X109.835 Y123.665 E.08819
G1 X109.835 Y132.335 E.2664
G1 X106.965 Y132.335 E.08819
G1 X106.965 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X108.965 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.643 Y130.954 Z9.4 F42000
G1 X105.609 Y134.191 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X105.609 Y121.81 E.41071
G1 X111.19 Y121.809 E.18514
G1 X111.191 Y134.19 E.4107
G1 X105.669 Y134.191 E.18317
M204 S10000
G1 X105.202 Y134.598 F42000
G1 F7581
M204 S6000
G1 X105.202 Y121.403 E.43772
G1 X111.597 Y121.402 E.21215
G1 X111.598 Y134.597 E.43771
G1 X105.262 Y134.598 E.21017
M204 S250
G1 X104.81 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X104.81 Y121.21 E.41732
G3 X104.993 Y121.01 I.191 J-.009 E.00926
G1 X111.836 Y121.014 E.21026
M73 P72 R5
G3 X111.99 Y121.196 I-.04 J.19 E.00786
G1 X111.989 Y134.816 E.41851
G3 X111.807 Y134.99 I-.195 J-.022 E.00839
G1 X104.975 Y134.988 E.20992
G3 X104.819 Y134.852 I.031 J-.193 E.0067
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.817 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.813 Y133.662 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X110.987 Y133.662 E.27384
M204 S10000
G1 X110.588 Y133.987 F42000
; LINE_WIDTH: 0.317186
G1 F7581
M204 S6000
G1 X110.696 Y133.771 E.00541
; LINE_WIDTH: 0.267319
G1 X110.804 Y133.554 E.00442
; LINE_WIDTH: 0.217451
G1 X110.912 Y133.338 E.00344
; LINE_WIDTH: 0.192342
G1 X110.912 Y122.662 E.12998
; LINE_WIDTH: 0.217033
G1 X110.804 Y122.446 E.00343
; LINE_WIDTH: 0.266777
G1 X110.696 Y122.229 E.00442
; LINE_WIDTH: 0.316522
G1 X110.588 Y122.013 E.0054
M204 S10000
G1 X110.987 Y122.338 F42000
; LINE_WIDTH: 0.692247
G1 F5544.208
M204 S6000
G1 X105.813 Y122.338 E.27378
M204 S10000
G1 X106.212 Y122.013 F42000
; LINE_WIDTH: 0.317297
G1 F7581
M204 S6000
G1 X106.104 Y122.23 E.00541
; LINE_WIDTH: 0.26741
G1 X105.996 Y122.446 E.00443
; LINE_WIDTH: 0.193133
G1 X105.887 Y122.662 E.00296
G1 X105.887 Y133.338 E.13067
; LINE_WIDTH: 0.217524
G1 X105.996 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X106.104 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X106.212 Y133.987 E.00541
; CHANGE_LAYER
; Z_HEIGHT: 9.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F13120.648
G1 X106.104 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 46/73
; update layer progress
M73 L46
M991 S0 P45 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z9.4 I.32 J1.174 P1  F42000
G1 X146.165 Y122.866 Z9.4
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X149.834 Y122.866 E.12171
G1 X149.834 Y133.134 E.34062
G1 X145.366 Y133.134 E.14822
G1 X145.366 Y122.866 E.34062
G1 X146.105 Y122.866 E.02452
M204 S10000
G1 X146.165 Y123.273 F42000
G1 F7581
M204 S6000
G1 X149.427 Y123.273 E.10821
G1 X149.427 Y132.727 E.31361
G1 X145.773 Y132.727 E.12121
G1 X145.773 Y123.273 E.31361
G1 X146.105 Y123.273 E.01102
M204 S250
G1 X146.165 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X149.035 Y123.665 E.08819
G1 X149.035 Y132.335 E.2664
G1 X146.165 Y132.335 E.08819
G1 X146.165 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.165 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.843 Y130.954 Z9.6 F42000
G1 X144.809 Y134.191 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X144.809 Y121.81 E.41071
G1 X150.39 Y121.809 E.18514
G1 X150.391 Y134.19 E.4107
G1 X144.869 Y134.191 E.18317
M204 S10000
G1 X144.402 Y134.598 F42000
G1 F7581
M204 S6000
G1 X144.402 Y121.403 E.43772
G1 X150.797 Y121.402 E.21215
G1 X150.798 Y134.597 E.43771
G1 X144.462 Y134.598 E.21017
M204 S250
G1 X144.01 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X144.011 Y121.183 E.41816
G3 X144.193 Y121.01 I.194 J.022 E.00838
G1 X151.036 Y121.014 E.21026
G3 X151.19 Y121.196 I-.04 J.19 E.00786
G1 X151.19 Y134.788 E.41766
G3 X151.007 Y134.99 I-.192 J.009 E.00929
G1 X144.183 Y134.989 E.20967
G3 X144.019 Y134.852 I.022 J-.194 E.00696
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.018 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 46 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.6
M73 P73 R5
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer46 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X145.087 Y133.338 F42000
G1 Z9.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.193133
G1 F7581
M204 S6000
G1 X145.087 Y122.662 E.13067
G1 X145.196 Y122.446 E.00296
; LINE_WIDTH: 0.26741
G1 X145.304 Y122.229 E.00443
; LINE_WIDTH: 0.317297
G1 X145.412 Y122.013 E.00541
M204 S10000
G1 X145.013 Y122.338 F42000
; LINE_WIDTH: 0.692267
G1 F5544.037
M204 S6000
G1 X150.187 Y122.338 E.27379
M204 S10000
G1 X149.788 Y122.013 F42000
; LINE_WIDTH: 0.316522
G1 F7581
M204 S6000
G1 X149.896 Y122.229 E.0054
; LINE_WIDTH: 0.266777
G1 X150.004 Y122.446 E.00442
; LINE_WIDTH: 0.217033
G1 X150.112 Y122.662 E.00343
; LINE_WIDTH: 0.192342
G1 X150.112 Y133.338 E.12998
; LINE_WIDTH: 0.217451
G1 X150.004 Y133.554 E.00344
; LINE_WIDTH: 0.267319
G1 X149.896 Y133.771 E.00442
; LINE_WIDTH: 0.317186
G1 X149.788 Y133.987 E.00541
M204 S10000
G1 X150.187 Y133.662 F42000
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X145.013 Y133.662 E.27384
M204 S10000
G1 X145.087 Y133.338 F42000
; LINE_WIDTH: 0.217524
G1 F7581
M204 S6000
G1 X145.196 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X145.304 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X145.412 Y133.987 E.00541
; OBJECT_ID: 405
; WIPE_START
G1 F13120.648
G1 X145.304 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X138.707 Y129.932 Z9.6 F42000
G1 X126.565 Y122.866 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X130.234 Y122.866 E.12171
G1 X130.234 Y133.134 E.34062
G1 X125.766 Y133.134 E.14822
G1 X125.766 Y122.866 E.34062
G1 X126.505 Y122.866 E.02452
M204 S10000
G1 X126.565 Y123.273 F42000
G1 F7581
M204 S6000
G1 X129.827 Y123.273 E.10821
G1 X129.827 Y132.727 E.31361
G1 X126.173 Y132.727 E.12121
G1 X126.173 Y123.273 E.31361
G1 X126.505 Y123.273 E.01102
M204 S250
G1 X126.565 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X129.435 Y123.665 E.08819
G1 X129.435 Y132.335 E.2664
G1 X126.565 Y132.335 E.08819
G1 X126.565 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.565 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.243 Y130.954 Z9.6 F42000
G1 X125.209 Y134.191 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X125.209 Y121.81 E.41071
G1 X130.79 Y121.809 E.18514
G1 X130.791 Y134.19 E.4107
G1 X125.269 Y134.191 E.18317
M204 S10000
G1 X124.802 Y134.598 F42000
G1 F7581
M204 S6000
G1 X124.802 Y121.403 E.43772
G1 X131.197 Y121.402 E.21215
G1 X131.198 Y134.597 E.43771
G1 X124.862 Y134.598 E.21017
M204 S250
G1 X124.41 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X124.411 Y121.183 E.41816
G3 X124.593 Y121.01 I.194 J.022 E.00838
G1 X131.436 Y121.014 E.21026
G3 X131.59 Y121.196 I-.04 J.19 E.00786
G1 X131.59 Y134.788 E.41766
G3 X131.407 Y134.99 I-.192 J.009 E.00929
G1 X124.583 Y134.989 E.20967
G3 X124.419 Y134.852 I.022 J-.194 E.00696
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.418 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.413 Y133.662 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X130.587 Y133.662 E.27384
M204 S10000
G1 X130.188 Y133.987 F42000
; LINE_WIDTH: 0.317186
G1 F7581
M204 S6000
G1 X130.296 Y133.771 E.00541
; LINE_WIDTH: 0.267319
G1 X130.404 Y133.554 E.00442
; LINE_WIDTH: 0.217451
G1 X130.512 Y133.338 E.00344
; LINE_WIDTH: 0.192342
G1 X130.512 Y122.662 E.12998
; LINE_WIDTH: 0.217033
G1 X130.404 Y122.446 E.00343
; LINE_WIDTH: 0.266777
G1 X130.296 Y122.229 E.00442
; LINE_WIDTH: 0.316522
G1 X130.188 Y122.013 E.0054
M204 S10000
G1 X130.587 Y122.338 F42000
; LINE_WIDTH: 0.692267
G1 F5544.037
M204 S6000
G1 X125.413 Y122.338 E.27379
M204 S10000
G1 X125.812 Y122.013 F42000
; LINE_WIDTH: 0.317297
G1 F7581
M204 S6000
G1 X125.704 Y122.229 E.00541
; LINE_WIDTH: 0.26741
G1 X125.596 Y122.446 E.00443
; LINE_WIDTH: 0.193133
G1 X125.487 Y122.662 E.00296
G1 X125.487 Y133.338 E.13067
; LINE_WIDTH: 0.217524
G1 X125.596 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X125.704 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X125.812 Y133.987 E.00541
; OBJECT_ID: 394
; WIPE_START
G1 F13120.648
G1 X125.704 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X119.107 Y129.932 Z9.6 F42000
G1 X106.965 Y122.866 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X110.634 Y122.866 E.12171
G1 X110.634 Y133.134 E.34062
G1 X106.166 Y133.134 E.14822
G1 X106.166 Y122.866 E.34062
G1 X106.905 Y122.866 E.02452
M204 S10000
G1 X106.965 Y123.273 F42000
G1 F7581
M204 S6000
G1 X110.227 Y123.273 E.10821
G1 X110.227 Y132.727 E.31361
G1 X106.573 Y132.727 E.12121
G1 X106.573 Y123.273 E.31361
G1 X106.905 Y123.273 E.01102
M204 S250
G1 X106.965 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X109.835 Y123.665 E.08819
G1 X109.835 Y132.335 E.2664
G1 X106.965 Y132.335 E.08819
G1 X106.965 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X108.965 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.643 Y130.954 Z9.6 F42000
G1 X105.609 Y134.191 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X105.609 Y121.81 E.41071
G1 X111.19 Y121.809 E.18514
G1 X111.191 Y134.19 E.4107
G1 X105.669 Y134.191 E.18317
M204 S10000
G1 X105.202 Y134.598 F42000
G1 F7581
M204 S6000
G1 X105.202 Y121.403 E.43772
G1 X111.597 Y121.402 E.21215
G1 X111.598 Y134.597 E.43771
G1 X105.262 Y134.598 E.21017
M204 S250
G1 X104.81 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X104.811 Y121.183 E.41816
G3 X104.993 Y121.01 I.194 J.022 E.00838
G1 X111.836 Y121.014 E.21026
G3 X111.99 Y121.196 I-.04 J.19 E.00786
G1 X111.99 Y134.788 E.41766
G3 X111.807 Y134.99 I-.192 J.009 E.00929
G1 X104.983 Y134.989 E.20967
G3 X104.819 Y134.852 I.022 J-.194 E.00696
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.818 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.813 Y133.662 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X110.987 Y133.662 E.27384
M204 S10000
G1 X110.588 Y133.987 F42000
; LINE_WIDTH: 0.317186
G1 F7581
M204 S6000
G1 X110.696 Y133.771 E.00541
; LINE_WIDTH: 0.267319
G1 X110.804 Y133.554 E.00442
; LINE_WIDTH: 0.217451
G1 X110.912 Y133.338 E.00344
; LINE_WIDTH: 0.192342
G1 X110.912 Y122.662 E.12998
; LINE_WIDTH: 0.217033
G1 X110.804 Y122.446 E.00343
; LINE_WIDTH: 0.266777
G1 X110.696 Y122.229 E.00442
; LINE_WIDTH: 0.316522
G1 X110.588 Y122.013 E.0054
M204 S10000
G1 X110.987 Y122.338 F42000
; LINE_WIDTH: 0.692267
G1 F5544.037
M204 S6000
G1 X105.813 Y122.338 E.27379
M204 S10000
G1 X106.212 Y122.013 F42000
; LINE_WIDTH: 0.317297
G1 F7581
M204 S6000
G1 X106.104 Y122.229 E.00541
; LINE_WIDTH: 0.26741
G1 X105.996 Y122.446 E.00443
; LINE_WIDTH: 0.193133
G1 X105.887 Y122.662 E.00296
G1 X105.887 Y133.338 E.13067
; LINE_WIDTH: 0.217524
G1 X105.996 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X106.104 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X106.212 Y133.987 E.00541
; CHANGE_LAYER
; Z_HEIGHT: 9.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F13120.648
G1 X106.104 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 47/73
; update layer progress
M73 L47
M991 S0 P46 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z9.6 I.32 J1.174 P1  F42000
G1 X146.165 Y122.866 Z9.6
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X149.834 Y122.866 E.12171
G1 X149.834 Y133.134 E.34062
G1 X145.366 Y133.134 E.14822
G1 X145.366 Y122.866 E.34062
G1 X146.105 Y122.866 E.02452
M204 S10000
G1 X146.165 Y123.273 F42000
G1 F7581
M204 S6000
G1 X149.427 Y123.273 E.10821
G1 X149.427 Y132.727 E.31361
G1 X145.773 Y132.727 E.12121
G1 X145.773 Y123.273 E.31361
G1 X146.105 Y123.273 E.01102
M204 S250
G1 X146.165 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X149.035 Y123.665 E.08819
G1 X149.035 Y132.335 E.2664
G1 X146.165 Y132.335 E.08819
G1 X146.165 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.165 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.843 Y130.954 Z9.8 F42000
G1 X144.809 Y134.191 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X144.809 Y121.81 E.41071
G1 X150.39 Y121.809 E.18514
G1 X150.391 Y134.19 E.4107
G1 X144.869 Y134.191 E.18317
M204 S10000
G1 X144.402 Y134.598 F42000
G1 F7581
M204 S6000
G1 X144.402 Y121.403 E.43772
G1 X150.797 Y121.402 E.21215
G1 X150.798 Y134.597 E.43771
G1 X144.462 Y134.598 E.21017
M204 S250
G1 X144.01 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X144.015 Y121.159 E.4189
G3 X144.191 Y121.01 I.188 J.044 E.00758
G1 X151.036 Y121.014 E.21035
G3 X151.19 Y121.196 I-.037 J.187 E.00788
G1 X151.19 Y134.789 E.41767
G3 X151.007 Y134.99 I-.192 J.008 E.00926
G1 X144.159 Y134.985 E.21043
G3 X144.018 Y134.852 I.044 J-.188 E.00623
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.018 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 47 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.8
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer47 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X145.087 Y133.338 F42000
G1 Z9.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.193133
G1 F7581
M204 S6000
G1 X145.087 Y122.662 E.13067
G1 X145.196 Y122.446 E.00296
; LINE_WIDTH: 0.26741
G1 X145.304 Y122.23 E.00443
; LINE_WIDTH: 0.317297
G1 X145.412 Y122.013 E.00541
M204 S10000
G1 X145.013 Y122.338 F42000
; LINE_WIDTH: 0.692247
G1 F5544.208
M204 S6000
G1 X150.187 Y122.338 E.27378
M204 S10000
G1 X149.788 Y122.013 F42000
; LINE_WIDTH: 0.316522
G1 F7581
M204 S6000
G1 X149.896 Y122.229 E.0054
; LINE_WIDTH: 0.266777
G1 X150.004 Y122.446 E.00442
; LINE_WIDTH: 0.217033
G1 X150.112 Y122.662 E.00343
; LINE_WIDTH: 0.192342
G1 X150.112 Y133.338 E.12998
; LINE_WIDTH: 0.217451
G1 X150.004 Y133.554 E.00344
; LINE_WIDTH: 0.267319
G1 X149.896 Y133.771 E.00442
; LINE_WIDTH: 0.317186
G1 X149.788 Y133.987 E.00541
M204 S10000
G1 X150.187 Y133.662 F42000
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X145.013 Y133.662 E.27384
M204 S10000
G1 X145.087 Y133.338 F42000
; LINE_WIDTH: 0.217524
G1 F7581
M204 S6000
G1 X145.196 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X145.304 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X145.412 Y133.987 E.00541
; OBJECT_ID: 405
; WIPE_START
G1 F13120.648
G1 X145.304 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X138.707 Y129.932 Z9.8 F42000
G1 X126.565 Y122.866 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X130.234 Y122.866 E.12171
G1 X130.234 Y133.134 E.34062
G1 X125.766 Y133.134 E.14822
G1 X125.766 Y122.866 E.34062
G1 X126.505 Y122.866 E.02452
M204 S10000
G1 X126.565 Y123.273 F42000
G1 F7581
M204 S6000
M73 P74 R5
G1 X129.827 Y123.273 E.10821
G1 X129.827 Y132.727 E.31361
G1 X126.173 Y132.727 E.12121
G1 X126.173 Y123.273 E.31361
G1 X126.505 Y123.273 E.01102
M204 S250
G1 X126.565 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X129.435 Y123.665 E.08819
G1 X129.435 Y132.335 E.2664
G1 X126.565 Y132.335 E.08819
G1 X126.565 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.565 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.243 Y130.954 Z9.8 F42000
G1 X125.209 Y134.191 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X125.209 Y121.81 E.41071
G1 X130.79 Y121.809 E.18514
G1 X130.791 Y134.19 E.4107
G1 X125.269 Y134.191 E.18317
M204 S10000
G1 X124.802 Y134.598 F42000
G1 F7581
M204 S6000
G1 X124.802 Y121.403 E.43772
G1 X131.197 Y121.402 E.21215
G1 X131.198 Y134.597 E.43771
G1 X124.862 Y134.598 E.21017
M204 S250
G1 X124.41 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X124.415 Y121.159 E.4189
G3 X124.591 Y121.01 I.188 J.044 E.00758
G1 X131.436 Y121.014 E.21035
G3 X131.59 Y121.196 I-.037 J.187 E.00788
G1 X131.59 Y134.789 E.41767
G3 X131.407 Y134.99 I-.192 J.008 E.00926
G1 X124.559 Y134.985 E.21043
G3 X124.418 Y134.852 I.044 J-.188 E.00623
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.418 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.413 Y133.662 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X130.587 Y133.662 E.27384
M204 S10000
G1 X130.188 Y133.987 F42000
; LINE_WIDTH: 0.317186
G1 F7581
M204 S6000
G1 X130.296 Y133.771 E.00541
; LINE_WIDTH: 0.267319
G1 X130.404 Y133.554 E.00442
; LINE_WIDTH: 0.217451
G1 X130.512 Y133.338 E.00344
; LINE_WIDTH: 0.192342
G1 X130.512 Y122.662 E.12998
; LINE_WIDTH: 0.217033
G1 X130.404 Y122.446 E.00343
; LINE_WIDTH: 0.266777
G1 X130.296 Y122.229 E.00442
; LINE_WIDTH: 0.316522
G1 X130.188 Y122.013 E.0054
M204 S10000
G1 X130.587 Y122.338 F42000
; LINE_WIDTH: 0.692247
G1 F5544.208
M204 S6000
G1 X125.413 Y122.338 E.27378
M204 S10000
G1 X125.812 Y122.013 F42000
; LINE_WIDTH: 0.317297
G1 F7581
M204 S6000
G1 X125.704 Y122.23 E.00541
; LINE_WIDTH: 0.26741
G1 X125.596 Y122.446 E.00443
; LINE_WIDTH: 0.193133
G1 X125.487 Y122.662 E.00296
G1 X125.487 Y133.338 E.13067
; LINE_WIDTH: 0.217524
G1 X125.596 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X125.704 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X125.812 Y133.987 E.00541
; OBJECT_ID: 394
; WIPE_START
G1 F13120.648
G1 X125.704 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X119.107 Y129.932 Z9.8 F42000
G1 X106.965 Y122.866 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X110.634 Y122.866 E.12171
G1 X110.634 Y133.134 E.34062
G1 X106.166 Y133.134 E.14822
G1 X106.166 Y122.866 E.34062
G1 X106.905 Y122.866 E.02452
M204 S10000
G1 X106.965 Y123.273 F42000
G1 F7581
M204 S6000
G1 X110.227 Y123.273 E.10821
G1 X110.227 Y132.727 E.31361
G1 X106.573 Y132.727 E.12121
G1 X106.573 Y123.273 E.31361
G1 X106.905 Y123.273 E.01102
M204 S250
G1 X106.965 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X109.835 Y123.665 E.08819
G1 X109.835 Y132.335 E.2664
G1 X106.965 Y132.335 E.08819
G1 X106.965 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X108.965 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.643 Y130.954 Z9.8 F42000
G1 X105.609 Y134.191 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X105.609 Y121.81 E.41071
G1 X111.19 Y121.809 E.18514
G1 X111.191 Y134.19 E.4107
G1 X105.669 Y134.191 E.18317
M204 S10000
G1 X105.202 Y134.598 F42000
G1 F7581
M204 S6000
G1 X105.202 Y121.403 E.43772
G1 X111.597 Y121.402 E.21215
G1 X111.598 Y134.597 E.43771
G1 X105.262 Y134.598 E.21017
M204 S250
G1 X104.81 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X104.815 Y121.159 E.4189
G3 X104.991 Y121.01 I.188 J.044 E.00758
G1 X111.836 Y121.014 E.21035
G3 X111.99 Y121.196 I-.037 J.187 E.00788
G1 X111.99 Y134.789 E.41767
G3 X111.807 Y134.99 I-.192 J.008 E.00926
G1 X104.959 Y134.985 E.21043
G3 X104.818 Y134.852 I.044 J-.188 E.00623
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.818 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.813 Y133.662 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X110.987 Y133.662 E.27384
M204 S10000
G1 X110.588 Y133.987 F42000
; LINE_WIDTH: 0.317186
G1 F7581
M204 S6000
G1 X110.696 Y133.771 E.00541
; LINE_WIDTH: 0.267319
G1 X110.804 Y133.554 E.00442
; LINE_WIDTH: 0.217451
G1 X110.912 Y133.338 E.00344
; LINE_WIDTH: 0.192342
G1 X110.912 Y122.662 E.12998
; LINE_WIDTH: 0.217033
G1 X110.804 Y122.446 E.00343
; LINE_WIDTH: 0.266777
G1 X110.696 Y122.229 E.00442
; LINE_WIDTH: 0.316522
G1 X110.588 Y122.013 E.0054
M204 S10000
G1 X110.987 Y122.338 F42000
; LINE_WIDTH: 0.692247
G1 F5544.208
M204 S6000
G1 X105.813 Y122.338 E.27378
M204 S10000
G1 X106.212 Y122.013 F42000
; LINE_WIDTH: 0.317297
G1 F7581
M204 S6000
G1 X106.104 Y122.23 E.00541
; LINE_WIDTH: 0.26741
G1 X105.996 Y122.446 E.00443
; LINE_WIDTH: 0.193133
G1 X105.887 Y122.662 E.00296
G1 X105.887 Y133.338 E.13067
; LINE_WIDTH: 0.217524
G1 X105.996 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X106.104 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X106.212 Y133.987 E.00541
; CHANGE_LAYER
; Z_HEIGHT: 9.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F13120.648
G1 X106.104 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 48/73
; update layer progress
M73 L48
M991 S0 P47 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z9.8 I.32 J1.174 P1  F42000
G1 X146.165 Y122.866 Z9.8
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X149.834 Y122.866 E.12171
G1 X149.834 Y133.134 E.34062
G1 X145.366 Y133.134 E.14822
G1 X145.366 Y122.866 E.34062
G1 X146.105 Y122.866 E.02452
M204 S10000
G1 X146.165 Y123.273 F42000
G1 F7581
M204 S6000
G1 X149.427 Y123.273 E.10821
G1 X149.427 Y132.727 E.31361
G1 X145.773 Y132.727 E.12121
G1 X145.773 Y123.273 E.31361
G1 X146.105 Y123.273 E.01102
M204 S250
G1 X146.165 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X149.035 Y123.665 E.08819
G1 X149.035 Y132.335 E.2664
G1 X146.165 Y132.335 E.08819
G1 X146.165 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.165 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.843 Y130.954 Z10 F42000
G1 X144.809 Y134.191 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X144.809 Y121.81 E.41071
G1 X150.39 Y121.809 E.18514
G1 X150.391 Y134.19 E.4107
G1 X144.869 Y134.191 E.18317
M204 S10000
G1 X144.402 Y134.598 F42000
G1 F7581
M204 S6000
G1 X144.402 Y121.403 E.43772
G1 X150.797 Y121.402 E.21215
G1 X150.798 Y134.597 E.43771
G1 X144.462 Y134.598 E.21017
M204 S250
G1 X144.01 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X144.011 Y121.183 E.41816
G3 X144.193 Y121.01 I.194 J.022 E.00838
G1 X151.036 Y121.014 E.21026
G3 X151.19 Y121.196 I-.04 J.19 E.00786
G1 X151.19 Y134.788 E.41766
G3 X151.007 Y134.99 I-.192 J.009 E.00928
G1 X144.183 Y134.989 E.20966
G3 X144.019 Y134.852 I.022 J-.194 E.00696
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.017 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 48 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z10
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer48 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X145.087 Y133.338 F42000
G1 Z9.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.193133
G1 F7581
M204 S6000
G1 X145.087 Y122.662 E.13067
G1 X145.196 Y122.446 E.00296
; LINE_WIDTH: 0.26741
G1 X145.304 Y122.229 E.00443
; LINE_WIDTH: 0.317297
G1 X145.412 Y122.013 E.00541
M204 S10000
G1 X145.013 Y122.338 F42000
; LINE_WIDTH: 0.692267
G1 F5544.037
M204 S6000
G1 X150.187 Y122.338 E.27379
M204 S10000
G1 X149.788 Y122.013 F42000
; LINE_WIDTH: 0.316522
G1 F7581
M204 S6000
G1 X149.896 Y122.229 E.0054
; LINE_WIDTH: 0.266777
G1 X150.004 Y122.446 E.00442
; LINE_WIDTH: 0.217033
G1 X150.112 Y122.662 E.00343
; LINE_WIDTH: 0.192342
G1 X150.112 Y133.338 E.12998
; LINE_WIDTH: 0.217451
G1 X150.004 Y133.554 E.00344
; LINE_WIDTH: 0.267319
G1 X149.896 Y133.771 E.00442
; LINE_WIDTH: 0.317186
G1 X149.788 Y133.987 E.00541
M204 S10000
G1 X150.187 Y133.662 F42000
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X145.013 Y133.662 E.27384
M204 S10000
G1 X145.087 Y133.338 F42000
; LINE_WIDTH: 0.217524
G1 F7581
M204 S6000
G1 X145.196 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X145.304 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X145.412 Y133.987 E.00541
; OBJECT_ID: 405
; WIPE_START
G1 F13120.648
G1 X145.304 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X138.707 Y129.932 Z10 F42000
G1 X126.565 Y122.866 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X130.234 Y122.866 E.12171
G1 X130.234 Y133.134 E.34062
G1 X125.766 Y133.134 E.14822
G1 X125.766 Y122.866 E.34062
G1 X126.505 Y122.866 E.02452
M204 S10000
G1 X126.565 Y123.273 F42000
G1 F7581
M204 S6000
G1 X129.827 Y123.273 E.10821
G1 X129.827 Y132.727 E.31361
G1 X126.173 Y132.727 E.12121
G1 X126.173 Y123.273 E.31361
G1 X126.505 Y123.273 E.01102
M204 S250
G1 X126.565 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X129.435 Y123.665 E.08819
G1 X129.435 Y132.335 E.2664
G1 X126.565 Y132.335 E.08819
G1 X126.565 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.565 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.243 Y130.954 Z10 F42000
G1 X125.209 Y134.191 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X125.209 Y121.81 E.41071
G1 X130.79 Y121.809 E.18514
G1 X130.791 Y134.19 E.4107
G1 X125.269 Y134.191 E.18317
M204 S10000
G1 X124.802 Y134.598 F42000
G1 F7581
M204 S6000
G1 X124.802 Y121.403 E.43772
G1 X131.197 Y121.402 E.21215
G1 X131.198 Y134.597 E.43771
G1 X124.862 Y134.598 E.21017
M204 S250
G1 X124.41 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X124.411 Y121.183 E.41816
G3 X124.593 Y121.01 I.194 J.022 E.00838
G1 X131.436 Y121.014 E.21026
G3 X131.59 Y121.196 I-.04 J.19 E.00786
G1 X131.59 Y134.788 E.41766
G3 X131.407 Y134.99 I-.192 J.009 E.00928
G1 X124.583 Y134.989 E.20966
G3 X124.419 Y134.852 I.022 J-.194 E.00696
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.417 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.413 Y133.662 Z10 F42000
G1 Z9.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X130.587 Y133.662 E.27384
M204 S10000
M73 P75 R5
G1 X130.188 Y133.987 F42000
; LINE_WIDTH: 0.317186
G1 F7581
M204 S6000
G1 X130.296 Y133.771 E.00541
; LINE_WIDTH: 0.267319
G1 X130.404 Y133.554 E.00442
; LINE_WIDTH: 0.217451
G1 X130.512 Y133.338 E.00344
; LINE_WIDTH: 0.192342
G1 X130.512 Y122.662 E.12998
; LINE_WIDTH: 0.217033
G1 X130.404 Y122.446 E.00343
; LINE_WIDTH: 0.266777
G1 X130.296 Y122.229 E.00442
; LINE_WIDTH: 0.316522
G1 X130.188 Y122.013 E.0054
M204 S10000
G1 X130.587 Y122.338 F42000
; LINE_WIDTH: 0.692267
G1 F5544.037
M204 S6000
G1 X125.413 Y122.338 E.27379
M204 S10000
G1 X125.812 Y122.013 F42000
; LINE_WIDTH: 0.317297
G1 F7581
M204 S6000
G1 X125.704 Y122.229 E.00541
; LINE_WIDTH: 0.26741
G1 X125.596 Y122.446 E.00443
; LINE_WIDTH: 0.193133
G1 X125.487 Y122.662 E.00296
G1 X125.487 Y133.338 E.13067
; LINE_WIDTH: 0.217524
G1 X125.596 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X125.704 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X125.812 Y133.987 E.00541
; OBJECT_ID: 394
; WIPE_START
G1 F13120.648
G1 X125.704 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X119.107 Y129.932 Z10 F42000
G1 X106.965 Y122.866 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X110.634 Y122.866 E.12171
G1 X110.634 Y133.134 E.34062
G1 X106.166 Y133.134 E.14822
G1 X106.166 Y122.866 E.34062
G1 X106.905 Y122.866 E.02452
M204 S10000
G1 X106.965 Y123.273 F42000
G1 F7581
M204 S6000
G1 X110.227 Y123.273 E.10821
G1 X110.227 Y132.727 E.31361
G1 X106.573 Y132.727 E.12121
G1 X106.573 Y123.273 E.31361
G1 X106.905 Y123.273 E.01102
M204 S250
G1 X106.965 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X109.835 Y123.665 E.08819
G1 X109.835 Y132.335 E.2664
G1 X106.965 Y132.335 E.08819
G1 X106.965 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X108.965 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.643 Y130.954 Z10 F42000
G1 X105.609 Y134.191 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X105.609 Y121.81 E.41071
G1 X111.19 Y121.809 E.18514
G1 X111.191 Y134.19 E.4107
G1 X105.669 Y134.191 E.18317
M204 S10000
G1 X105.202 Y134.598 F42000
G1 F7581
M204 S6000
G1 X105.202 Y121.403 E.43772
G1 X111.597 Y121.402 E.21215
G1 X111.598 Y134.597 E.43771
G1 X105.262 Y134.598 E.21017
M204 S250
G1 X104.81 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X104.811 Y121.183 E.41816
G3 X104.993 Y121.01 I.194 J.022 E.00838
G1 X111.836 Y121.014 E.21026
G3 X111.99 Y121.196 I-.04 J.19 E.00786
G1 X111.99 Y134.788 E.41766
G3 X111.807 Y134.99 I-.192 J.009 E.00928
G1 X104.983 Y134.989 E.20966
G3 X104.819 Y134.852 I.022 J-.194 E.00696
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.817 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.813 Y133.662 Z10 F42000
G1 Z9.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X110.987 Y133.662 E.27384
M204 S10000
G1 X110.588 Y133.987 F42000
; LINE_WIDTH: 0.317186
G1 F7581
M204 S6000
G1 X110.696 Y133.771 E.00541
; LINE_WIDTH: 0.267319
G1 X110.804 Y133.554 E.00442
; LINE_WIDTH: 0.217451
G1 X110.912 Y133.338 E.00344
; LINE_WIDTH: 0.192342
G1 X110.912 Y122.662 E.12998
; LINE_WIDTH: 0.217033
G1 X110.804 Y122.446 E.00343
; LINE_WIDTH: 0.266777
G1 X110.696 Y122.229 E.00442
; LINE_WIDTH: 0.316522
G1 X110.588 Y122.013 E.0054
M204 S10000
G1 X110.987 Y122.338 F42000
; LINE_WIDTH: 0.692267
G1 F5544.037
M204 S6000
G1 X105.813 Y122.338 E.27379
M204 S10000
G1 X106.212 Y122.013 F42000
; LINE_WIDTH: 0.317297
G1 F7581
M204 S6000
G1 X106.104 Y122.229 E.00541
; LINE_WIDTH: 0.26741
G1 X105.996 Y122.446 E.00443
; LINE_WIDTH: 0.193133
G1 X105.887 Y122.662 E.00296
G1 X105.887 Y133.338 E.13067
; LINE_WIDTH: 0.217524
G1 X105.996 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X106.104 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X106.212 Y133.987 E.00541
; CHANGE_LAYER
; Z_HEIGHT: 9.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F13120.648
G1 X106.104 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 49/73
; update layer progress
M73 L49
M991 S0 P48 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z10 I.32 J1.174 P1  F42000
G1 X146.165 Y122.866 Z10
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X149.834 Y122.866 E.12171
G1 X149.834 Y133.134 E.34062
G1 X145.366 Y133.134 E.14822
G1 X145.366 Y122.866 E.34062
G1 X146.105 Y122.866 E.02452
M204 S10000
G1 X146.165 Y123.273 F42000
G1 F7581
M204 S6000
G1 X149.427 Y123.273 E.10821
G1 X149.427 Y132.727 E.31361
G1 X145.773 Y132.727 E.12121
G1 X145.773 Y123.273 E.31361
G1 X146.105 Y123.273 E.01102
M204 S250
G1 X146.165 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X149.035 Y123.665 E.08819
G1 X149.035 Y132.335 E.2664
G1 X146.165 Y132.335 E.08819
G1 X146.165 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.165 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.843 Y130.954 Z10.2 F42000
G1 X144.809 Y134.191 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X144.809 Y121.81 E.41071
G1 X150.39 Y121.809 E.18514
G1 X150.391 Y134.19 E.4107
G1 X144.869 Y134.191 E.18317
M204 S10000
G1 X144.402 Y134.598 F42000
G1 F7581
M204 S6000
G1 X144.402 Y121.403 E.43772
G1 X150.797 Y121.402 E.21215
G1 X150.798 Y134.597 E.43771
G1 X144.462 Y134.598 E.21017
M204 S250
G1 X144.01 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X144.011 Y121.183 E.41816
G3 X144.193 Y121.01 I.196 J.024 E.00836
G1 X151.036 Y121.014 E.21027
G3 X151.19 Y121.196 I-.04 J.19 E.00785
G1 X151.182 Y134.853 E.41963
G3 X151.007 Y134.99 I-.185 J-.056 E.00729
G1 X144.183 Y134.989 E.20966
G3 X144.019 Y134.851 I.024 J-.196 E.00697
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.018 Y132.851 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 49 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z10.2
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer49 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X145.087 Y133.338 F42000
G1 Z9.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.193133
G1 F7581
M204 S6000
G1 X145.087 Y122.662 E.13067
G1 X145.196 Y122.446 E.00296
; LINE_WIDTH: 0.26741
G1 X145.304 Y122.229 E.00443
; LINE_WIDTH: 0.317297
G1 X145.412 Y122.013 E.00541
M204 S10000
G1 X145.013 Y122.338 F42000
; LINE_WIDTH: 0.692266
G1 F5544.043
M204 S6000
G1 X150.187 Y122.338 E.27379
M204 S10000
G1 X149.788 Y122.013 F42000
; LINE_WIDTH: 0.316522
G1 F7581
M204 S6000
G1 X149.896 Y122.229 E.0054
; LINE_WIDTH: 0.266777
G1 X150.004 Y122.446 E.00442
; LINE_WIDTH: 0.217033
G1 X150.112 Y122.662 E.00343
; LINE_WIDTH: 0.192342
G1 X150.112 Y133.338 E.12998
; LINE_WIDTH: 0.217451
G1 X150.004 Y133.554 E.00344
; LINE_WIDTH: 0.267319
G1 X149.896 Y133.771 E.00442
; LINE_WIDTH: 0.317186
G1 X149.788 Y133.987 E.00541
M204 S10000
G1 X150.187 Y133.662 F42000
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X145.013 Y133.662 E.27384
M204 S10000
G1 X145.087 Y133.338 F42000
; LINE_WIDTH: 0.217524
G1 F7581
M204 S6000
G1 X145.196 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X145.304 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X145.412 Y133.987 E.00541
; OBJECT_ID: 405
; WIPE_START
G1 F13120.648
G1 X145.304 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X138.707 Y129.932 Z10.2 F42000
G1 X126.565 Y122.866 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X130.234 Y122.866 E.12171
G1 X130.234 Y133.134 E.34062
G1 X125.766 Y133.134 E.14822
G1 X125.766 Y122.866 E.34062
G1 X126.505 Y122.866 E.02452
M204 S10000
G1 X126.565 Y123.273 F42000
G1 F7581
M204 S6000
G1 X129.827 Y123.273 E.10821
G1 X129.827 Y132.727 E.31361
G1 X126.173 Y132.727 E.12121
G1 X126.173 Y123.273 E.31361
G1 X126.505 Y123.273 E.01102
M204 S250
G1 X126.565 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X129.435 Y123.665 E.08819
G1 X129.435 Y132.335 E.2664
G1 X126.565 Y132.335 E.08819
G1 X126.565 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.565 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.243 Y130.954 Z10.2 F42000
G1 X125.209 Y134.191 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X125.209 Y121.81 E.41071
G1 X130.79 Y121.809 E.18514
G1 X130.791 Y134.19 E.4107
G1 X125.269 Y134.191 E.18317
M204 S10000
G1 X124.802 Y134.598 F42000
G1 F7581
M204 S6000
G1 X124.802 Y121.403 E.43772
G1 X131.197 Y121.402 E.21215
G1 X131.198 Y134.597 E.43771
G1 X124.862 Y134.598 E.21017
M204 S250
G1 X124.41 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X124.411 Y121.183 E.41816
G3 X124.593 Y121.01 I.196 J.024 E.00836
G1 X131.436 Y121.014 E.21027
G3 X131.59 Y121.196 I-.04 J.19 E.00785
G1 X131.582 Y134.853 E.41963
G3 X131.407 Y134.99 I-.185 J-.056 E.00729
G1 X124.583 Y134.989 E.20966
G3 X124.419 Y134.851 I.024 J-.196 E.00697
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.418 Y132.851 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.413 Y133.662 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X130.587 Y133.662 E.27384
M204 S10000
G1 X130.188 Y133.987 F42000
; LINE_WIDTH: 0.317186
G1 F7581
M204 S6000
G1 X130.296 Y133.771 E.00541
; LINE_WIDTH: 0.267319
G1 X130.404 Y133.554 E.00442
; LINE_WIDTH: 0.217451
G1 X130.512 Y133.338 E.00344
; LINE_WIDTH: 0.192342
G1 X130.512 Y122.662 E.12998
; LINE_WIDTH: 0.217033
G1 X130.404 Y122.446 E.00343
; LINE_WIDTH: 0.266777
G1 X130.296 Y122.229 E.00442
; LINE_WIDTH: 0.316522
G1 X130.188 Y122.013 E.0054
M204 S10000
G1 X130.587 Y122.338 F42000
; LINE_WIDTH: 0.692266
G1 F5544.043
M204 S6000
G1 X125.413 Y122.338 E.27379
M204 S10000
G1 X125.812 Y122.013 F42000
; LINE_WIDTH: 0.317297
G1 F7581
M204 S6000
G1 X125.704 Y122.229 E.00541
; LINE_WIDTH: 0.26741
G1 X125.596 Y122.446 E.00443
; LINE_WIDTH: 0.193133
G1 X125.487 Y122.662 E.00296
G1 X125.487 Y133.338 E.13067
; LINE_WIDTH: 0.217524
G1 X125.596 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X125.704 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X125.812 Y133.987 E.00541
; OBJECT_ID: 394
; WIPE_START
G1 F13120.648
G1 X125.704 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X119.107 Y129.932 Z10.2 F42000
G1 X106.965 Y122.866 Z10.2
G1 Z9.8
M73 P76 R5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X110.634 Y122.866 E.12171
G1 X110.634 Y133.134 E.34062
G1 X106.166 Y133.134 E.14822
G1 X106.166 Y122.866 E.34062
G1 X106.905 Y122.866 E.02452
M204 S10000
G1 X106.965 Y123.273 F42000
G1 F7581
M204 S6000
G1 X110.227 Y123.273 E.10821
G1 X110.227 Y132.727 E.31361
G1 X106.573 Y132.727 E.12121
G1 X106.573 Y123.273 E.31361
G1 X106.905 Y123.273 E.01102
M204 S250
G1 X106.965 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X109.835 Y123.665 E.08819
G1 X109.835 Y132.335 E.2664
G1 X106.965 Y132.335 E.08819
G1 X106.965 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X108.965 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.643 Y130.954 Z10.2 F42000
G1 X105.609 Y134.191 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X105.609 Y121.81 E.41071
G1 X111.19 Y121.809 E.18514
G1 X111.191 Y134.19 E.4107
G1 X105.669 Y134.191 E.18317
M204 S10000
G1 X105.202 Y134.598 F42000
G1 F7581
M204 S6000
G1 X105.202 Y121.403 E.43772
G1 X111.597 Y121.402 E.21215
G1 X111.598 Y134.597 E.43771
G1 X105.262 Y134.598 E.21017
M204 S250
G1 X104.81 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X104.811 Y121.183 E.41816
G3 X104.993 Y121.01 I.196 J.024 E.00836
G1 X111.836 Y121.014 E.21027
G3 X111.99 Y121.196 I-.04 J.19 E.00785
G1 X111.982 Y134.853 E.41963
G3 X111.807 Y134.99 I-.185 J-.056 E.00729
G1 X104.983 Y134.989 E.20966
G3 X104.819 Y134.851 I.024 J-.196 E.00697
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.818 Y132.851 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.813 Y133.662 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X110.987 Y133.662 E.27384
M204 S10000
G1 X110.588 Y133.987 F42000
; LINE_WIDTH: 0.317186
G1 F7581
M204 S6000
G1 X110.696 Y133.771 E.00541
; LINE_WIDTH: 0.267319
G1 X110.804 Y133.554 E.00442
; LINE_WIDTH: 0.217451
G1 X110.912 Y133.338 E.00344
; LINE_WIDTH: 0.192342
G1 X110.912 Y122.662 E.12998
; LINE_WIDTH: 0.217033
G1 X110.804 Y122.446 E.00343
; LINE_WIDTH: 0.266777
G1 X110.696 Y122.229 E.00442
; LINE_WIDTH: 0.316522
G1 X110.588 Y122.013 E.0054
M204 S10000
G1 X110.987 Y122.338 F42000
; LINE_WIDTH: 0.692266
G1 F5544.043
M204 S6000
G1 X105.813 Y122.338 E.27379
M204 S10000
G1 X106.212 Y122.013 F42000
; LINE_WIDTH: 0.317297
G1 F7581
M204 S6000
G1 X106.104 Y122.229 E.00541
; LINE_WIDTH: 0.26741
G1 X105.996 Y122.446 E.00443
; LINE_WIDTH: 0.193133
G1 X105.887 Y122.662 E.00296
G1 X105.887 Y133.338 E.13067
; LINE_WIDTH: 0.217524
G1 X105.996 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X106.104 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X106.212 Y133.987 E.00541
; CHANGE_LAYER
; Z_HEIGHT: 10
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F13120.648
G1 X106.104 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 50/73
; update layer progress
M73 L50
M991 S0 P49 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z10.2 I.32 J1.174 P1  F42000
G1 X146.165 Y122.866 Z10.2
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X149.834 Y122.866 E.12171
G1 X149.834 Y133.134 E.34062
G1 X145.366 Y133.134 E.14822
G1 X145.366 Y122.866 E.34062
G1 X146.105 Y122.866 E.02452
M204 S10000
G1 X146.165 Y123.273 F42000
G1 F7581
M204 S6000
G1 X149.427 Y123.273 E.10821
G1 X149.427 Y132.727 E.31361
G1 X145.773 Y132.727 E.12121
G1 X145.773 Y123.273 E.31361
G1 X146.105 Y123.273 E.01102
M204 S250
G1 X146.165 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X149.035 Y123.665 E.08819
G1 X149.035 Y132.335 E.2664
G1 X146.165 Y132.335 E.08819
G1 X146.165 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.165 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.843 Y130.954 Z10.4 F42000
G1 X144.809 Y134.191 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X144.809 Y121.81 E.41071
G1 X150.39 Y121.809 E.18514
G1 X150.391 Y134.19 E.4107
G1 X144.869 Y134.191 E.18317
M204 S10000
G1 X144.402 Y134.598 F42000
G1 F7581
M204 S6000
G1 X144.402 Y121.403 E.43772
G1 X150.797 Y121.402 E.21215
G1 X150.798 Y134.597 E.43771
G1 X144.462 Y134.598 E.21017
M204 S250
G1 X144.01 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X144.01 Y121.211 E.41732
G3 X144.193 Y121.01 I.192 J-.008 E.00926
G1 X151.036 Y121.014 E.21027
G3 X151.19 Y121.196 I-.037 J.187 E.00787
G1 X151.19 Y134.789 E.41769
G3 X151.007 Y134.99 I-.192 J.008 E.00924
G1 X144.184 Y134.989 E.20966
G3 X144.019 Y134.851 I.023 J-.196 E.00699
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.017 Y132.851 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 50 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z10.4
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer50 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X145.087 Y133.338 F42000
G1 Z10
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.193133
G1 F7581
M204 S6000
G1 X145.087 Y122.662 E.13067
G1 X145.196 Y122.446 E.00296
; LINE_WIDTH: 0.26741
G1 X145.304 Y122.229 E.00443
; LINE_WIDTH: 0.317297
G1 X145.412 Y122.013 E.00541
M204 S10000
G1 X145.013 Y122.338 F42000
; LINE_WIDTH: 0.692267
G1 F5544.037
M204 S6000
G1 X150.187 Y122.338 E.27379
M204 S10000
G1 X149.788 Y122.013 F42000
; LINE_WIDTH: 0.316522
G1 F7581
M204 S6000
G1 X149.896 Y122.229 E.0054
; LINE_WIDTH: 0.266777
G1 X150.004 Y122.446 E.00442
; LINE_WIDTH: 0.217033
G1 X150.112 Y122.662 E.00343
; LINE_WIDTH: 0.192342
G1 X150.112 Y133.338 E.12998
; LINE_WIDTH: 0.217451
G1 X150.004 Y133.554 E.00344
; LINE_WIDTH: 0.267319
G1 X149.896 Y133.771 E.00442
; LINE_WIDTH: 0.317186
G1 X149.788 Y133.987 E.00541
M204 S10000
G1 X150.187 Y133.662 F42000
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X145.013 Y133.662 E.27384
M204 S10000
G1 X145.087 Y133.338 F42000
; LINE_WIDTH: 0.217524
G1 F7581
M204 S6000
G1 X145.196 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X145.304 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X145.412 Y133.987 E.00541
; OBJECT_ID: 405
; WIPE_START
G1 F13120.648
G1 X145.304 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X138.707 Y129.932 Z10.4 F42000
G1 X126.565 Y122.866 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X130.234 Y122.866 E.12171
G1 X130.234 Y133.134 E.34062
G1 X125.766 Y133.134 E.14822
G1 X125.766 Y122.866 E.34062
G1 X126.505 Y122.866 E.02452
M204 S10000
G1 X126.565 Y123.273 F42000
G1 F7581
M204 S6000
G1 X129.827 Y123.273 E.10821
G1 X129.827 Y132.727 E.31361
G1 X126.173 Y132.727 E.12121
G1 X126.173 Y123.273 E.31361
G1 X126.505 Y123.273 E.01102
M204 S250
G1 X126.565 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X129.435 Y123.665 E.08819
G1 X129.435 Y132.335 E.2664
G1 X126.565 Y132.335 E.08819
G1 X126.565 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.565 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.243 Y130.954 Z10.4 F42000
G1 X125.209 Y134.191 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X125.209 Y121.81 E.41071
G1 X130.79 Y121.809 E.18514
G1 X130.791 Y134.19 E.4107
G1 X125.269 Y134.191 E.18317
M204 S10000
G1 X124.802 Y134.598 F42000
G1 F7581
M204 S6000
G1 X124.802 Y121.403 E.43772
G1 X131.197 Y121.402 E.21215
G1 X131.198 Y134.597 E.43771
G1 X124.862 Y134.598 E.21017
M204 S250
G1 X124.41 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X124.41 Y121.211 E.41732
G3 X124.593 Y121.01 I.192 J-.008 E.00926
G1 X131.436 Y121.014 E.21027
G3 X131.59 Y121.196 I-.037 J.187 E.00787
G1 X131.59 Y134.789 E.41769
G3 X131.407 Y134.99 I-.192 J.008 E.00924
G1 X124.584 Y134.989 E.20966
G3 X124.419 Y134.851 I.023 J-.196 E.00699
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.417 Y132.851 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.413 Y133.662 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X130.587 Y133.662 E.27384
M204 S10000
G1 X130.188 Y133.987 F42000
; LINE_WIDTH: 0.317186
G1 F7581
M204 S6000
G1 X130.296 Y133.771 E.00541
; LINE_WIDTH: 0.267319
G1 X130.404 Y133.554 E.00442
; LINE_WIDTH: 0.217451
G1 X130.512 Y133.338 E.00344
; LINE_WIDTH: 0.192342
G1 X130.512 Y122.662 E.12998
; LINE_WIDTH: 0.217033
G1 X130.404 Y122.446 E.00343
; LINE_WIDTH: 0.266777
G1 X130.296 Y122.229 E.00442
; LINE_WIDTH: 0.316522
G1 X130.188 Y122.013 E.0054
M204 S10000
G1 X130.587 Y122.338 F42000
; LINE_WIDTH: 0.692267
G1 F5544.037
M204 S6000
G1 X125.413 Y122.338 E.27379
M204 S10000
G1 X125.812 Y122.013 F42000
; LINE_WIDTH: 0.317297
G1 F7581
M204 S6000
G1 X125.704 Y122.229 E.00541
; LINE_WIDTH: 0.26741
G1 X125.596 Y122.446 E.00443
; LINE_WIDTH: 0.193133
G1 X125.487 Y122.662 E.00296
G1 X125.487 Y133.338 E.13067
; LINE_WIDTH: 0.217524
G1 X125.596 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X125.704 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X125.812 Y133.987 E.00541
; OBJECT_ID: 394
; WIPE_START
G1 F13120.648
G1 X125.704 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X119.107 Y129.932 Z10.4 F42000
G1 X106.965 Y122.866 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X110.634 Y122.866 E.12171
G1 X110.634 Y133.134 E.34062
G1 X106.166 Y133.134 E.14822
G1 X106.166 Y122.866 E.34062
M73 P77 R5
G1 X106.905 Y122.866 E.02452
M204 S10000
G1 X106.965 Y123.273 F42000
G1 F7581
M204 S6000
G1 X110.227 Y123.273 E.10821
G1 X110.227 Y132.727 E.31361
G1 X106.573 Y132.727 E.12121
G1 X106.573 Y123.273 E.31361
G1 X106.905 Y123.273 E.01102
M204 S250
G1 X106.965 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X109.835 Y123.665 E.08819
G1 X109.835 Y132.335 E.2664
G1 X106.965 Y132.335 E.08819
G1 X106.965 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X108.965 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.643 Y130.954 Z10.4 F42000
G1 X105.609 Y134.191 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X105.609 Y121.81 E.41071
G1 X111.19 Y121.809 E.18514
G1 X111.191 Y134.19 E.4107
G1 X105.669 Y134.191 E.18317
M204 S10000
G1 X105.202 Y134.598 F42000
G1 F7581
M204 S6000
G1 X105.202 Y121.403 E.43772
G1 X111.597 Y121.402 E.21215
G1 X111.598 Y134.597 E.43771
G1 X105.262 Y134.598 E.21017
M204 S250
G1 X104.81 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X104.81 Y121.211 E.41732
G3 X104.993 Y121.01 I.192 J-.008 E.00926
G1 X111.836 Y121.014 E.21027
G3 X111.99 Y121.196 I-.037 J.187 E.00787
G1 X111.99 Y134.789 E.41769
G3 X111.807 Y134.99 I-.192 J.008 E.00924
G1 X104.984 Y134.989 E.20966
G3 X104.819 Y134.851 I.023 J-.196 E.00699
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.817 Y132.851 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.813 Y133.662 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X110.987 Y133.662 E.27384
M204 S10000
G1 X110.588 Y133.987 F42000
; LINE_WIDTH: 0.317186
G1 F7581
M204 S6000
G1 X110.696 Y133.771 E.00541
; LINE_WIDTH: 0.267319
G1 X110.804 Y133.554 E.00442
; LINE_WIDTH: 0.217451
G1 X110.912 Y133.338 E.00344
; LINE_WIDTH: 0.192342
G1 X110.912 Y122.662 E.12998
; LINE_WIDTH: 0.217033
G1 X110.804 Y122.446 E.00343
; LINE_WIDTH: 0.266777
G1 X110.696 Y122.229 E.00442
; LINE_WIDTH: 0.316522
G1 X110.588 Y122.013 E.0054
M204 S10000
G1 X110.987 Y122.338 F42000
; LINE_WIDTH: 0.692267
G1 F5544.037
M204 S6000
G1 X105.813 Y122.338 E.27379
M204 S10000
G1 X106.212 Y122.013 F42000
; LINE_WIDTH: 0.317297
G1 F7581
M204 S6000
G1 X106.104 Y122.229 E.00541
; LINE_WIDTH: 0.26741
G1 X105.996 Y122.446 E.00443
; LINE_WIDTH: 0.193133
G1 X105.887 Y122.662 E.00296
G1 X105.887 Y133.338 E.13067
; LINE_WIDTH: 0.217524
G1 X105.996 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X106.104 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X106.212 Y133.987 E.00541
; CHANGE_LAYER
; Z_HEIGHT: 10.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F13120.648
G1 X106.104 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 51/73
; update layer progress
M73 L51
M991 S0 P50 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z10.4 I.32 J1.174 P1  F42000
G1 X146.165 Y122.866 Z10.4
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X149.834 Y122.866 E.12171
G1 X149.834 Y133.134 E.34062
G1 X145.366 Y133.134 E.14822
G1 X145.366 Y122.866 E.34062
G1 X146.105 Y122.866 E.02452
M204 S10000
G1 X146.165 Y123.273 F42000
G1 F7581
M204 S6000
G1 X149.427 Y123.273 E.10821
G1 X149.427 Y132.727 E.31361
G1 X145.773 Y132.727 E.12121
G1 X145.773 Y123.273 E.31361
G1 X146.105 Y123.273 E.01102
M204 S250
G1 X146.165 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X149.035 Y123.665 E.08819
G1 X149.035 Y132.335 E.2664
G1 X146.165 Y132.335 E.08819
G1 X146.165 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.165 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.843 Y130.954 Z10.6 F42000
G1 X144.809 Y134.191 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X144.809 Y121.81 E.41071
G1 X150.391 Y121.809 E.18515
G1 X150.391 Y134.191 E.41071
G1 X144.869 Y134.191 E.18317
M204 S10000
G1 X144.402 Y134.598 F42000
G1 F7581
M204 S6000
G1 X144.402 Y121.403 E.43772
G1 X150.798 Y121.402 E.21215
G1 X150.798 Y134.598 E.43772
G1 X144.462 Y134.598 E.21017
M204 S250
G1 X144.01 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
M73 P77 R4
G1 X144.011 Y121.183 E.41815
G3 X144.192 Y121.01 I.193 J.021 E.00835
G1 X151.036 Y121.014 E.21032
G3 X151.19 Y121.198 I-.04 J.19 E.00792
G1 X151.188 Y134.82 E.41857
G3 X151.005 Y134.99 I-.192 J-.024 E.00835
G1 X144.183 Y134.989 E.20959
G3 X144.019 Y134.851 I.024 J-.196 E.00698
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.018 Y132.851 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 51 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z10.6
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer51 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X145.087 Y133.338 F42000
G1 Z10.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.193133
G1 F7581
M204 S6000
G1 X145.087 Y122.662 E.13067
G1 X145.196 Y122.446 E.00296
; LINE_WIDTH: 0.26741
G1 X145.304 Y122.229 E.00443
; LINE_WIDTH: 0.317297
G1 X145.412 Y122.013 E.00541
M204 S10000
G1 X145.013 Y122.338 F42000
; LINE_WIDTH: 0.692267
G1 F5544.037
M204 S6000
G1 X150.187 Y122.338 E.27379
M204 S10000
G1 X149.788 Y122.013 F42000
; LINE_WIDTH: 0.316751
G1 F7581
M204 S6000
G1 X149.896 Y122.229 E.0054
; LINE_WIDTH: 0.266962
G1 X150.004 Y122.446 E.00442
; LINE_WIDTH: 0.217174
G1 X150.112 Y122.662 E.00344
; LINE_WIDTH: 0.192416
G1 X150.112 Y133.338 E.13005
; LINE_WIDTH: 0.217487
G1 X150.004 Y133.554 E.00344
; LINE_WIDTH: 0.267365
G1 X149.896 Y133.771 E.00443
; LINE_WIDTH: 0.317242
G1 X149.788 Y133.987 E.00541
M204 S10000
G1 X150.187 Y133.662 F42000
; LINE_WIDTH: 0.692416
G1 F5542.762
M204 S6000
G1 X145.013 Y133.662 E.27387
M204 S10000
G1 X145.087 Y133.338 F42000
; LINE_WIDTH: 0.217524
G1 F7581
M204 S6000
G1 X145.196 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X145.304 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X145.412 Y133.987 E.00541
; OBJECT_ID: 405
; WIPE_START
G1 F13120.648
G1 X145.304 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X138.707 Y129.932 Z10.6 F42000
G1 X126.565 Y122.866 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X130.234 Y122.866 E.12171
G1 X130.234 Y133.134 E.34062
G1 X125.766 Y133.134 E.14822
G1 X125.766 Y122.866 E.34062
G1 X126.505 Y122.866 E.02452
M204 S10000
G1 X126.565 Y123.273 F42000
G1 F7581
M204 S6000
G1 X129.827 Y123.273 E.10821
G1 X129.827 Y132.727 E.31361
G1 X126.173 Y132.727 E.12121
G1 X126.173 Y123.273 E.31361
G1 X126.505 Y123.273 E.01102
M204 S250
G1 X126.565 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X129.435 Y123.665 E.08819
G1 X129.435 Y132.335 E.2664
G1 X126.565 Y132.335 E.08819
G1 X126.565 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.565 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.243 Y130.954 Z10.6 F42000
G1 X125.209 Y134.191 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X125.209 Y121.81 E.41071
G1 X130.791 Y121.809 E.18515
G1 X130.791 Y134.191 E.41071
G1 X125.269 Y134.191 E.18317
M204 S10000
G1 X124.802 Y134.598 F42000
G1 F7581
M204 S6000
G1 X124.802 Y121.403 E.43772
G1 X131.198 Y121.402 E.21215
G1 X131.198 Y134.598 E.43772
G1 X124.862 Y134.598 E.21017
M204 S250
G1 X124.41 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X124.411 Y121.183 E.41815
G3 X124.592 Y121.01 I.193 J.021 E.00835
G1 X131.436 Y121.014 E.21032
G3 X131.59 Y121.198 I-.04 J.19 E.00792
G1 X131.588 Y134.82 E.41857
G3 X131.405 Y134.99 I-.192 J-.024 E.00835
G1 X124.583 Y134.989 E.20959
G3 X124.419 Y134.851 I.024 J-.196 E.00698
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.418 Y132.851 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.413 Y133.662 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692416
G1 F5542.762
M204 S6000
G1 X130.587 Y133.662 E.27387
M204 S10000
G1 X130.188 Y133.987 F42000
; LINE_WIDTH: 0.317242
G1 F7581
M204 S6000
G1 X130.296 Y133.771 E.00541
; LINE_WIDTH: 0.267365
G1 X130.404 Y133.554 E.00443
; LINE_WIDTH: 0.217487
G1 X130.512 Y133.338 E.00344
; LINE_WIDTH: 0.192416
G1 X130.512 Y122.662 E.13005
; LINE_WIDTH: 0.217174
G1 X130.404 Y122.446 E.00344
; LINE_WIDTH: 0.266962
G1 X130.296 Y122.229 E.00442
; LINE_WIDTH: 0.316751
G1 X130.188 Y122.013 E.0054
M204 S10000
G1 X130.587 Y122.338 F42000
; LINE_WIDTH: 0.692267
G1 F5544.037
M204 S6000
G1 X125.413 Y122.338 E.27379
M204 S10000
G1 X125.812 Y122.013 F42000
; LINE_WIDTH: 0.317297
G1 F7581
M204 S6000
G1 X125.704 Y122.229 E.00541
; LINE_WIDTH: 0.26741
G1 X125.596 Y122.446 E.00443
; LINE_WIDTH: 0.193133
G1 X125.487 Y122.662 E.00296
G1 X125.487 Y133.338 E.13067
; LINE_WIDTH: 0.217524
G1 X125.596 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X125.704 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X125.812 Y133.987 E.00541
; OBJECT_ID: 394
; WIPE_START
G1 F13120.648
G1 X125.704 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X119.107 Y129.932 Z10.6 F42000
G1 X106.965 Y122.866 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X110.634 Y122.866 E.12171
G1 X110.634 Y133.134 E.34062
G1 X106.166 Y133.134 E.14822
G1 X106.166 Y122.866 E.34062
G1 X106.905 Y122.866 E.02452
M204 S10000
G1 X106.965 Y123.273 F42000
G1 F7581
M204 S6000
G1 X110.227 Y123.273 E.10821
G1 X110.227 Y132.727 E.31361
G1 X106.573 Y132.727 E.12121
G1 X106.573 Y123.273 E.31361
G1 X106.905 Y123.273 E.01102
M204 S250
G1 X106.965 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X109.835 Y123.665 E.08819
G1 X109.835 Y132.335 E.2664
G1 X106.965 Y132.335 E.08819
G1 X106.965 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X108.965 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.643 Y130.954 Z10.6 F42000
G1 X105.609 Y134.191 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X105.609 Y121.81 E.41071
G1 X111.191 Y121.809 E.18515
G1 X111.191 Y134.191 E.41071
G1 X105.669 Y134.191 E.18317
M204 S10000
G1 X105.202 Y134.598 F42000
G1 F7581
M204 S6000
G1 X105.202 Y121.403 E.43772
G1 X111.598 Y121.402 E.21215
G1 X111.598 Y134.598 E.43772
G1 X105.262 Y134.598 E.21017
M204 S250
G1 X104.81 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X104.811 Y121.183 E.41815
G3 X104.992 Y121.01 I.193 J.021 E.00835
G1 X111.836 Y121.014 E.21032
G3 X111.99 Y121.198 I-.04 J.19 E.00792
G1 X111.988 Y134.82 E.41857
G3 X111.805 Y134.99 I-.192 J-.024 E.00835
G1 X104.983 Y134.989 E.20959
G3 X104.819 Y134.851 I.024 J-.196 E.00698
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.818 Y132.851 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.813 Y133.662 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692416
G1 F5542.762
M204 S6000
G1 X110.987 Y133.662 E.27387
M204 S10000
G1 X110.588 Y133.987 F42000
; LINE_WIDTH: 0.317242
G1 F7581
M204 S6000
G1 X110.696 Y133.771 E.00541
; LINE_WIDTH: 0.267365
G1 X110.804 Y133.554 E.00443
; LINE_WIDTH: 0.217487
G1 X110.912 Y133.338 E.00344
; LINE_WIDTH: 0.192416
M73 P78 R4
G1 X110.912 Y122.662 E.13005
; LINE_WIDTH: 0.217174
G1 X110.804 Y122.446 E.00344
; LINE_WIDTH: 0.266962
G1 X110.696 Y122.229 E.00442
; LINE_WIDTH: 0.316751
G1 X110.588 Y122.013 E.0054
M204 S10000
G1 X110.987 Y122.338 F42000
; LINE_WIDTH: 0.692267
G1 F5544.037
M204 S6000
G1 X105.813 Y122.338 E.27379
M204 S10000
G1 X106.212 Y122.013 F42000
; LINE_WIDTH: 0.317297
G1 F7581
M204 S6000
G1 X106.104 Y122.229 E.00541
; LINE_WIDTH: 0.26741
G1 X105.996 Y122.446 E.00443
; LINE_WIDTH: 0.193133
G1 X105.887 Y122.662 E.00296
G1 X105.887 Y133.338 E.13067
; LINE_WIDTH: 0.217524
G1 X105.996 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X106.104 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X106.212 Y133.987 E.00541
; CHANGE_LAYER
; Z_HEIGHT: 10.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F13120.648
G1 X106.104 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 52/73
; update layer progress
M73 L52
M991 S0 P51 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z10.6 I.32 J1.174 P1  F42000
G1 X146.165 Y122.866 Z10.6
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X149.834 Y122.866 E.12171
G1 X149.834 Y133.134 E.34062
G1 X145.366 Y133.134 E.14822
G1 X145.366 Y122.866 E.34062
G1 X146.105 Y122.866 E.02452
M204 S10000
G1 X146.165 Y123.273 F42000
G1 F7581
M204 S6000
G1 X149.427 Y123.273 E.10821
G1 X149.427 Y132.727 E.31361
G1 X145.773 Y132.727 E.12121
G1 X145.773 Y123.273 E.31361
G1 X146.105 Y123.273 E.01102
M204 S250
G1 X146.165 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X149.035 Y123.665 E.08819
G1 X149.035 Y132.335 E.2664
G1 X146.165 Y132.335 E.08819
G1 X146.165 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.165 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.843 Y130.954 Z10.8 F42000
G1 X144.809 Y134.191 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X144.809 Y121.81 E.41071
G1 X150.39 Y121.809 E.18514
G1 X150.391 Y134.19 E.41071
G1 X144.869 Y134.191 E.18317
M204 S10000
G1 X144.402 Y134.598 F42000
G1 F7581
M204 S6000
G1 X144.402 Y121.403 E.43772
G1 X150.797 Y121.402 E.21215
G1 X150.798 Y134.597 E.43771
G1 X144.462 Y134.598 E.21017
M204 S250
G1 X144.01 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X144.01 Y121.211 E.41732
G3 X144.191 Y121.01 I.191 J-.009 E.00919
G1 X151.036 Y121.014 E.21035
G3 X151.19 Y121.196 I-.038 J.188 E.00787
G1 X151.19 Y134.789 E.41767
G3 X151.007 Y134.99 I-.192 J.008 E.00927
G1 X144.147 Y134.982 E.21077
G3 X144.018 Y134.852 I.055 J-.184 E.00588
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.017 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 52 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z10.8
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer52 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X145.087 Y133.338 F42000
G1 Z10.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.193133
G1 F7581
M204 S6000
G1 X145.087 Y122.662 E.13067
G1 X145.196 Y122.446 E.00296
; LINE_WIDTH: 0.26741
G1 X145.304 Y122.229 E.00443
; LINE_WIDTH: 0.317297
G1 X145.412 Y122.013 E.00541
M204 S10000
G1 X145.013 Y122.338 F42000
; LINE_WIDTH: 0.692277
G1 F5543.946
M204 S6000
G1 X150.187 Y122.338 E.27379
M204 S10000
G1 X149.788 Y122.013 F42000
; LINE_WIDTH: 0.316522
G1 F7581
M204 S6000
G1 X149.896 Y122.229 E.0054
; LINE_WIDTH: 0.266777
G1 X150.004 Y122.446 E.00442
; LINE_WIDTH: 0.217033
G1 X150.112 Y122.662 E.00343
; LINE_WIDTH: 0.192342
G1 X150.112 Y133.338 E.12998
; LINE_WIDTH: 0.217451
G1 X150.004 Y133.554 E.00344
; LINE_WIDTH: 0.267319
G1 X149.896 Y133.771 E.00442
; LINE_WIDTH: 0.317186
G1 X149.788 Y133.987 E.00541
M204 S10000
G1 X150.187 Y133.662 F42000
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X145.013 Y133.662 E.27384
M204 S10000
G1 X145.087 Y133.338 F42000
; LINE_WIDTH: 0.217524
G1 F7581
M204 S6000
G1 X145.196 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X145.304 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X145.412 Y133.987 E.00541
; OBJECT_ID: 405
; WIPE_START
G1 F13120.648
G1 X145.304 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X138.707 Y129.932 Z10.8 F42000
G1 X126.565 Y122.866 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X130.234 Y122.866 E.12171
G1 X130.234 Y133.134 E.34062
G1 X125.766 Y133.134 E.14822
G1 X125.766 Y122.866 E.34062
G1 X126.505 Y122.866 E.02452
M204 S10000
G1 X126.565 Y123.273 F42000
G1 F7581
M204 S6000
G1 X129.827 Y123.273 E.10821
G1 X129.827 Y132.727 E.31361
G1 X126.173 Y132.727 E.12121
G1 X126.173 Y123.273 E.31361
G1 X126.505 Y123.273 E.01102
M204 S250
G1 X126.565 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X129.435 Y123.665 E.08819
G1 X129.435 Y132.335 E.2664
G1 X126.565 Y132.335 E.08819
G1 X126.565 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.565 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.243 Y130.954 Z10.8 F42000
G1 X125.209 Y134.191 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X125.209 Y121.81 E.41071
G1 X130.79 Y121.809 E.18514
G1 X130.791 Y134.19 E.41071
G1 X125.269 Y134.191 E.18317
M204 S10000
G1 X124.802 Y134.598 F42000
G1 F7581
M204 S6000
G1 X124.802 Y121.403 E.43772
G1 X131.197 Y121.402 E.21215
G1 X131.198 Y134.597 E.43771
G1 X124.862 Y134.598 E.21017
M204 S250
G1 X124.41 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X124.41 Y121.211 E.41732
G3 X124.591 Y121.01 I.191 J-.009 E.00919
G1 X131.436 Y121.014 E.21035
G3 X131.59 Y121.196 I-.038 J.188 E.00787
G1 X131.59 Y134.789 E.41767
G3 X131.407 Y134.99 I-.192 J.008 E.00927
G1 X124.547 Y134.982 E.21077
G3 X124.418 Y134.852 I.055 J-.184 E.00588
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.417 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.413 Y133.662 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X130.587 Y133.662 E.27384
M204 S10000
G1 X130.188 Y133.987 F42000
; LINE_WIDTH: 0.317186
G1 F7581
M204 S6000
G1 X130.296 Y133.771 E.00541
; LINE_WIDTH: 0.267319
G1 X130.404 Y133.554 E.00442
; LINE_WIDTH: 0.217451
G1 X130.512 Y133.338 E.00344
; LINE_WIDTH: 0.192342
G1 X130.512 Y122.662 E.12998
; LINE_WIDTH: 0.217033
G1 X130.404 Y122.446 E.00343
; LINE_WIDTH: 0.266777
G1 X130.296 Y122.229 E.00442
; LINE_WIDTH: 0.316522
G1 X130.188 Y122.013 E.0054
M204 S10000
G1 X130.587 Y122.338 F42000
; LINE_WIDTH: 0.692277
G1 F5543.946
M204 S6000
G1 X125.413 Y122.338 E.27379
M204 S10000
G1 X125.812 Y122.013 F42000
; LINE_WIDTH: 0.317297
G1 F7581
M204 S6000
G1 X125.704 Y122.229 E.00541
; LINE_WIDTH: 0.26741
G1 X125.596 Y122.446 E.00443
; LINE_WIDTH: 0.193133
G1 X125.487 Y122.662 E.00296
G1 X125.487 Y133.338 E.13067
; LINE_WIDTH: 0.217524
G1 X125.596 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X125.704 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X125.812 Y133.987 E.00541
; OBJECT_ID: 394
; WIPE_START
G1 F13120.648
G1 X125.704 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X119.107 Y129.932 Z10.8 F42000
G1 X106.965 Y122.866 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X110.634 Y122.866 E.12171
G1 X110.634 Y133.134 E.34062
G1 X106.166 Y133.134 E.14822
G1 X106.166 Y122.866 E.34062
G1 X106.905 Y122.866 E.02452
M204 S10000
G1 X106.965 Y123.273 F42000
G1 F7581
M204 S6000
G1 X110.227 Y123.273 E.10821
G1 X110.227 Y132.727 E.31361
G1 X106.573 Y132.727 E.12121
G1 X106.573 Y123.273 E.31361
G1 X106.905 Y123.273 E.01102
M204 S250
G1 X106.965 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X109.835 Y123.665 E.08819
G1 X109.835 Y132.335 E.2664
G1 X106.965 Y132.335 E.08819
G1 X106.965 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X108.965 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.643 Y130.954 Z10.8 F42000
G1 X105.609 Y134.191 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X105.609 Y121.81 E.41071
G1 X111.19 Y121.809 E.18514
G1 X111.191 Y134.19 E.41071
G1 X105.669 Y134.191 E.18317
M204 S10000
G1 X105.202 Y134.598 F42000
G1 F7581
M204 S6000
G1 X105.202 Y121.403 E.43772
G1 X111.597 Y121.402 E.21215
G1 X111.598 Y134.597 E.43771
G1 X105.262 Y134.598 E.21017
M204 S250
G1 X104.81 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X104.81 Y121.211 E.41732
G3 X104.991 Y121.01 I.191 J-.009 E.00919
G1 X111.836 Y121.014 E.21035
G3 X111.99 Y121.196 I-.038 J.188 E.00787
G1 X111.99 Y134.789 E.41767
G3 X111.807 Y134.99 I-.192 J.008 E.00927
G1 X104.947 Y134.982 E.21077
G3 X104.818 Y134.852 I.055 J-.184 E.00588
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.817 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.813 Y133.662 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X110.987 Y133.662 E.27384
M204 S10000
G1 X110.588 Y133.987 F42000
; LINE_WIDTH: 0.317186
G1 F7581
M204 S6000
G1 X110.696 Y133.771 E.00541
; LINE_WIDTH: 0.267319
G1 X110.804 Y133.554 E.00442
; LINE_WIDTH: 0.217451
G1 X110.912 Y133.338 E.00344
; LINE_WIDTH: 0.192342
G1 X110.912 Y122.662 E.12998
; LINE_WIDTH: 0.217033
G1 X110.804 Y122.446 E.00343
; LINE_WIDTH: 0.266777
G1 X110.696 Y122.229 E.00442
; LINE_WIDTH: 0.316522
G1 X110.588 Y122.013 E.0054
M204 S10000
G1 X110.987 Y122.338 F42000
; LINE_WIDTH: 0.692277
G1 F5543.946
M204 S6000
G1 X105.813 Y122.338 E.27379
M204 S10000
G1 X106.212 Y122.013 F42000
; LINE_WIDTH: 0.317297
G1 F7581
M204 S6000
G1 X106.104 Y122.229 E.00541
; LINE_WIDTH: 0.26741
G1 X105.996 Y122.446 E.00443
; LINE_WIDTH: 0.193133
G1 X105.887 Y122.662 E.00296
G1 X105.887 Y133.338 E.13067
; LINE_WIDTH: 0.217524
G1 X105.996 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X106.104 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X106.212 Y133.987 E.00541
; CHANGE_LAYER
; Z_HEIGHT: 10.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F13120.648
G1 X106.104 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 53/73
; update layer progress
M73 L53
M991 S0 P52 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z10.8 I.32 J1.174 P1  F42000
G1 X146.165 Y122.866 Z10.8
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X149.834 Y122.866 E.12171
G1 X149.834 Y133.134 E.34062
G1 X145.366 Y133.134 E.14822
G1 X145.366 Y122.866 E.34062
G1 X146.105 Y122.866 E.02452
M204 S10000
G1 X146.165 Y123.273 F42000
G1 F7581
M204 S6000
G1 X149.427 Y123.273 E.10821
G1 X149.427 Y132.727 E.31361
G1 X145.773 Y132.727 E.12121
G1 X145.773 Y123.273 E.31361
G1 X146.105 Y123.273 E.01102
M204 S250
G1 X146.165 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X149.035 Y123.665 E.08819
G1 X149.035 Y132.335 E.2664
G1 X146.165 Y132.335 E.08819
G1 X146.165 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.165 Y123.683 E-.76
; WIPE_END
M73 P79 R4
G1 E-.04 F1800
M204 S10000
G1 X145.843 Y130.954 Z11 F42000
G1 X144.809 Y134.191 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X144.809 Y121.81 E.41071
G1 X150.39 Y121.809 E.18514
G1 X150.391 Y134.19 E.41071
G1 X144.869 Y134.191 E.18317
M204 S10000
G1 X144.402 Y134.598 F42000
G1 F7581
M204 S6000
G1 X144.402 Y121.403 E.43772
G1 X150.797 Y121.402 E.21215
G1 X150.798 Y134.597 E.43771
G1 X144.462 Y134.598 E.21017
M204 S250
G1 X144.01 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X144.011 Y121.183 E.41815
G3 X144.191 Y121.01 I.196 J.024 E.00832
G1 X151.036 Y121.014 E.21032
G3 X151.19 Y121.196 I-.04 J.19 E.00786
G1 X151.185 Y134.841 E.41928
G3 X151.007 Y134.99 I-.187 J-.044 E.00764
G1 X144.184 Y134.989 E.20966
G3 X144.019 Y134.851 I.023 J-.196 E.00699
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.018 Y132.851 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 53 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z11
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer53 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X145.087 Y133.338 F42000
G1 Z10.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.193133
G1 F7581
M204 S6000
G1 X145.087 Y122.662 E.13067
G1 X145.196 Y122.446 E.00296
; LINE_WIDTH: 0.26741
G1 X145.304 Y122.229 E.00443
; LINE_WIDTH: 0.317297
G1 X145.412 Y122.013 E.00541
M204 S10000
G1 X145.013 Y122.338 F42000
; LINE_WIDTH: 0.692278
G1 F5543.941
M204 S6000
G1 X150.187 Y122.338 E.27379
M204 S10000
G1 X149.788 Y122.013 F42000
; LINE_WIDTH: 0.316522
G1 F7581
M204 S6000
G1 X149.896 Y122.229 E.0054
; LINE_WIDTH: 0.266777
G1 X150.004 Y122.446 E.00442
; LINE_WIDTH: 0.217033
G1 X150.112 Y122.662 E.00343
; LINE_WIDTH: 0.192342
G1 X150.112 Y133.338 E.12998
; LINE_WIDTH: 0.217451
G1 X150.004 Y133.554 E.00344
; LINE_WIDTH: 0.267319
G1 X149.896 Y133.771 E.00442
; LINE_WIDTH: 0.317186
G1 X149.788 Y133.987 E.00541
M204 S10000
G1 X150.187 Y133.662 F42000
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X145.013 Y133.662 E.27384
M204 S10000
G1 X145.087 Y133.338 F42000
; LINE_WIDTH: 0.217524
G1 F7581
M204 S6000
G1 X145.196 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X145.304 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X145.412 Y133.987 E.00541
; OBJECT_ID: 405
; WIPE_START
G1 F13120.648
G1 X145.304 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X138.707 Y129.932 Z11 F42000
G1 X126.565 Y122.866 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X130.234 Y122.866 E.12171
G1 X130.234 Y133.134 E.34062
G1 X125.766 Y133.134 E.14822
G1 X125.766 Y122.866 E.34062
G1 X126.505 Y122.866 E.02452
M204 S10000
G1 X126.565 Y123.273 F42000
G1 F7581
M204 S6000
G1 X129.827 Y123.273 E.10821
G1 X129.827 Y132.727 E.31361
G1 X126.173 Y132.727 E.12121
G1 X126.173 Y123.273 E.31361
G1 X126.505 Y123.273 E.01102
M204 S250
G1 X126.565 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X129.435 Y123.665 E.08819
G1 X129.435 Y132.335 E.2664
G1 X126.565 Y132.335 E.08819
G1 X126.565 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.565 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.243 Y130.954 Z11 F42000
G1 X125.209 Y134.191 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X125.209 Y121.81 E.41071
G1 X130.79 Y121.809 E.18514
G1 X130.791 Y134.19 E.41071
G1 X125.269 Y134.191 E.18317
M204 S10000
G1 X124.802 Y134.598 F42000
G1 F7581
M204 S6000
G1 X124.802 Y121.403 E.43772
G1 X131.197 Y121.402 E.21215
G1 X131.198 Y134.597 E.43771
G1 X124.862 Y134.598 E.21017
M204 S250
G1 X124.41 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X124.411 Y121.183 E.41815
G3 X124.591 Y121.01 I.196 J.024 E.00832
G1 X131.436 Y121.014 E.21032
G3 X131.59 Y121.196 I-.04 J.19 E.00786
G1 X131.585 Y134.841 E.41928
G3 X131.407 Y134.99 I-.187 J-.044 E.00764
G1 X124.584 Y134.989 E.20966
G3 X124.419 Y134.851 I.023 J-.196 E.00699
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.418 Y132.851 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.413 Y133.662 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X130.587 Y133.662 E.27384
M204 S10000
G1 X130.188 Y133.987 F42000
; LINE_WIDTH: 0.317186
G1 F7581
M204 S6000
G1 X130.296 Y133.771 E.00541
; LINE_WIDTH: 0.267319
G1 X130.404 Y133.554 E.00442
; LINE_WIDTH: 0.217451
G1 X130.512 Y133.338 E.00344
; LINE_WIDTH: 0.192342
G1 X130.512 Y122.662 E.12998
; LINE_WIDTH: 0.217033
G1 X130.404 Y122.446 E.00343
; LINE_WIDTH: 0.266777
G1 X130.296 Y122.229 E.00442
; LINE_WIDTH: 0.316522
G1 X130.188 Y122.013 E.0054
M204 S10000
G1 X130.587 Y122.338 F42000
; LINE_WIDTH: 0.692278
G1 F5543.941
M204 S6000
G1 X125.413 Y122.338 E.27379
M204 S10000
G1 X125.812 Y122.013 F42000
; LINE_WIDTH: 0.317297
G1 F7581
M204 S6000
G1 X125.704 Y122.229 E.00541
; LINE_WIDTH: 0.26741
G1 X125.596 Y122.446 E.00443
; LINE_WIDTH: 0.193133
G1 X125.487 Y122.662 E.00296
G1 X125.487 Y133.338 E.13067
; LINE_WIDTH: 0.217524
G1 X125.596 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X125.704 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X125.812 Y133.987 E.00541
; OBJECT_ID: 394
; WIPE_START
G1 F13120.648
G1 X125.704 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X119.107 Y129.932 Z11 F42000
G1 X106.965 Y122.866 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X110.634 Y122.866 E.12171
G1 X110.634 Y133.134 E.34062
G1 X106.166 Y133.134 E.14822
G1 X106.166 Y122.866 E.34062
G1 X106.905 Y122.866 E.02452
M204 S10000
G1 X106.965 Y123.273 F42000
G1 F7581
M204 S6000
G1 X110.227 Y123.273 E.10821
G1 X110.227 Y132.727 E.31361
G1 X106.573 Y132.727 E.12121
G1 X106.573 Y123.273 E.31361
G1 X106.905 Y123.273 E.01102
M204 S250
G1 X106.965 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X109.835 Y123.665 E.08819
G1 X109.835 Y132.335 E.2664
G1 X106.965 Y132.335 E.08819
G1 X106.965 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X108.965 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.643 Y130.954 Z11 F42000
G1 X105.609 Y134.191 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X105.609 Y121.81 E.41071
G1 X111.19 Y121.809 E.18514
G1 X111.191 Y134.19 E.41071
G1 X105.669 Y134.191 E.18317
M204 S10000
G1 X105.202 Y134.598 F42000
G1 F7581
M204 S6000
G1 X105.202 Y121.403 E.43772
G1 X111.597 Y121.402 E.21215
G1 X111.598 Y134.597 E.43771
G1 X105.262 Y134.598 E.21017
M204 S250
G1 X104.81 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X104.811 Y121.183 E.41815
G3 X104.991 Y121.01 I.196 J.024 E.00832
G1 X111.836 Y121.014 E.21032
G3 X111.99 Y121.196 I-.04 J.19 E.00786
G1 X111.985 Y134.841 E.41928
G3 X111.807 Y134.99 I-.187 J-.044 E.00764
G1 X104.984 Y134.989 E.20966
G3 X104.819 Y134.851 I.023 J-.196 E.00699
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.818 Y132.851 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.813 Y133.662 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X110.987 Y133.662 E.27384
M204 S10000
G1 X110.588 Y133.987 F42000
; LINE_WIDTH: 0.317186
G1 F7581
M204 S6000
G1 X110.696 Y133.771 E.00541
; LINE_WIDTH: 0.267319
G1 X110.804 Y133.554 E.00442
; LINE_WIDTH: 0.217451
G1 X110.912 Y133.338 E.00344
; LINE_WIDTH: 0.192342
G1 X110.912 Y122.662 E.12998
; LINE_WIDTH: 0.217033
G1 X110.804 Y122.446 E.00343
; LINE_WIDTH: 0.266777
G1 X110.696 Y122.229 E.00442
; LINE_WIDTH: 0.316522
G1 X110.588 Y122.013 E.0054
M204 S10000
G1 X110.987 Y122.338 F42000
; LINE_WIDTH: 0.692278
G1 F5543.941
M204 S6000
G1 X105.813 Y122.338 E.27379
M204 S10000
G1 X106.212 Y122.013 F42000
; LINE_WIDTH: 0.317297
G1 F7581
M204 S6000
G1 X106.104 Y122.229 E.00541
; LINE_WIDTH: 0.26741
G1 X105.996 Y122.446 E.00443
; LINE_WIDTH: 0.193133
G1 X105.887 Y122.662 E.00296
G1 X105.887 Y133.338 E.13067
; LINE_WIDTH: 0.217524
G1 X105.996 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X106.104 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X106.212 Y133.987 E.00541
; CHANGE_LAYER
; Z_HEIGHT: 10.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F13120.648
G1 X106.104 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 54/73
; update layer progress
M73 L54
M991 S0 P53 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z11 I.32 J1.174 P1  F42000
G1 X146.165 Y122.866 Z11
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X149.834 Y122.866 E.12171
G1 X149.834 Y133.134 E.34062
G1 X145.366 Y133.134 E.14822
G1 X145.366 Y122.866 E.34062
G1 X146.105 Y122.866 E.02452
M204 S10000
G1 X146.165 Y123.273 F42000
G1 F7581
M204 S6000
G1 X149.427 Y123.273 E.10821
G1 X149.427 Y132.727 E.31361
G1 X145.773 Y132.727 E.12121
G1 X145.773 Y123.273 E.31361
G1 X146.105 Y123.273 E.01102
M204 S250
G1 X146.165 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X149.035 Y123.665 E.08819
G1 X149.035 Y132.335 E.2664
G1 X146.165 Y132.335 E.08819
G1 X146.165 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.165 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.843 Y130.954 Z11.2 F42000
G1 X144.809 Y134.191 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X144.809 Y121.81 E.41071
G1 X150.39 Y121.809 E.18514
G1 X150.391 Y134.19 E.41071
G1 X144.869 Y134.191 E.18317
M204 S10000
G1 X144.402 Y134.598 F42000
G1 F7581
M204 S6000
G1 X144.402 Y121.403 E.43772
G1 X150.797 Y121.402 E.21215
G1 X150.798 Y134.597 E.43771
G1 X144.462 Y134.598 E.21017
M204 S250
G1 X144.01 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X144.011 Y121.183 E.41815
G3 X144.192 Y121.01 I.194 J.022 E.00834
G1 X151.036 Y121.014 E.21032
G3 X151.19 Y121.196 I-.04 J.19 E.00785
G1 X151.19 Y134.79 E.41769
G3 X151.007 Y134.99 I-.192 J.008 E.00925
G1 X144.211 Y134.99 E.20883
G3 X144.018 Y134.852 I-.009 J-.192 E.00787
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.017 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 54 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z11.2
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer54 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X145.087 Y133.338 F42000
G1 Z10.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.193133
G1 F7581
M204 S6000
G1 X145.087 Y122.662 E.13067
G1 X145.196 Y122.446 E.00296
; LINE_WIDTH: 0.26741
G1 X145.304 Y122.229 E.00443
; LINE_WIDTH: 0.317297
G1 X145.412 Y122.013 E.00541
M204 S10000
G1 X145.013 Y122.338 F42000
; LINE_WIDTH: 0.692289
G1 F5543.85
M204 S6000
G1 X150.187 Y122.338 E.2738
M204 S10000
G1 X149.788 Y122.013 F42000
; LINE_WIDTH: 0.316522
G1 F7581
M204 S6000
G1 X149.896 Y122.229 E.0054
; LINE_WIDTH: 0.266777
G1 X150.004 Y122.446 E.00442
; LINE_WIDTH: 0.217033
G1 X150.112 Y122.662 E.00343
; LINE_WIDTH: 0.192342
G1 X150.112 Y133.338 E.12998
; LINE_WIDTH: 0.217451
G1 X150.004 Y133.554 E.00344
; LINE_WIDTH: 0.267319
M73 P80 R4
G1 X149.896 Y133.771 E.00442
; LINE_WIDTH: 0.317186
G1 X149.788 Y133.987 E.00541
M204 S10000
G1 X150.187 Y133.662 F42000
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X145.013 Y133.662 E.27384
M204 S10000
G1 X145.087 Y133.338 F42000
; LINE_WIDTH: 0.217524
G1 F7581
M204 S6000
G1 X145.196 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X145.304 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X145.412 Y133.987 E.00541
; OBJECT_ID: 405
; WIPE_START
G1 F13120.648
G1 X145.304 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X138.707 Y129.932 Z11.2 F42000
G1 X126.565 Y122.866 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X130.234 Y122.866 E.12171
G1 X130.234 Y133.134 E.34062
G1 X125.766 Y133.134 E.14822
G1 X125.766 Y122.866 E.34062
G1 X126.505 Y122.866 E.02452
M204 S10000
G1 X126.565 Y123.273 F42000
G1 F7581
M204 S6000
G1 X129.827 Y123.273 E.10821
G1 X129.827 Y132.727 E.31361
G1 X126.173 Y132.727 E.12121
G1 X126.173 Y123.273 E.31361
G1 X126.505 Y123.273 E.01102
M204 S250
G1 X126.565 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X129.435 Y123.665 E.08819
G1 X129.435 Y132.335 E.2664
G1 X126.565 Y132.335 E.08819
G1 X126.565 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.565 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.243 Y130.954 Z11.2 F42000
G1 X125.209 Y134.191 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X125.209 Y121.81 E.41071
G1 X130.79 Y121.809 E.18514
G1 X130.791 Y134.19 E.41071
G1 X125.269 Y134.191 E.18317
M204 S10000
G1 X124.802 Y134.598 F42000
G1 F7581
M204 S6000
G1 X124.802 Y121.403 E.43772
G1 X131.197 Y121.402 E.21215
G1 X131.198 Y134.597 E.43771
G1 X124.862 Y134.598 E.21017
M204 S250
G1 X124.41 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X124.411 Y121.183 E.41815
G3 X124.592 Y121.01 I.194 J.022 E.00834
G1 X131.436 Y121.014 E.21032
G3 X131.59 Y121.196 I-.04 J.19 E.00785
G1 X131.59 Y134.79 E.41769
G3 X131.407 Y134.99 I-.192 J.008 E.00925
G1 X124.611 Y134.99 E.20883
G3 X124.418 Y134.852 I-.009 J-.192 E.00787
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.417 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.413 Y133.662 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X130.587 Y133.662 E.27384
M204 S10000
G1 X130.188 Y133.987 F42000
; LINE_WIDTH: 0.317186
G1 F7581
M204 S6000
G1 X130.296 Y133.771 E.00541
; LINE_WIDTH: 0.267319
G1 X130.404 Y133.554 E.00442
; LINE_WIDTH: 0.217451
G1 X130.512 Y133.338 E.00344
; LINE_WIDTH: 0.192342
G1 X130.512 Y122.662 E.12998
; LINE_WIDTH: 0.217033
G1 X130.404 Y122.446 E.00343
; LINE_WIDTH: 0.266777
G1 X130.296 Y122.229 E.00442
; LINE_WIDTH: 0.316522
G1 X130.188 Y122.013 E.0054
M204 S10000
G1 X130.587 Y122.338 F42000
; LINE_WIDTH: 0.692289
G1 F5543.85
M204 S6000
G1 X125.413 Y122.338 E.2738
M204 S10000
G1 X125.812 Y122.013 F42000
; LINE_WIDTH: 0.317297
G1 F7581
M204 S6000
G1 X125.704 Y122.229 E.00541
; LINE_WIDTH: 0.26741
G1 X125.596 Y122.446 E.00443
; LINE_WIDTH: 0.193133
G1 X125.487 Y122.662 E.00296
G1 X125.487 Y133.338 E.13067
; LINE_WIDTH: 0.217524
G1 X125.596 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X125.704 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X125.812 Y133.987 E.00541
; OBJECT_ID: 394
; WIPE_START
G1 F13120.648
G1 X125.704 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X119.107 Y129.932 Z11.2 F42000
G1 X106.965 Y122.866 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X110.634 Y122.866 E.12171
G1 X110.634 Y133.134 E.34062
G1 X106.166 Y133.134 E.14822
G1 X106.166 Y122.866 E.34062
G1 X106.905 Y122.866 E.02452
M204 S10000
G1 X106.965 Y123.273 F42000
G1 F7581
M204 S6000
G1 X110.227 Y123.273 E.10821
G1 X110.227 Y132.727 E.31361
G1 X106.573 Y132.727 E.12121
G1 X106.573 Y123.273 E.31361
G1 X106.905 Y123.273 E.01102
M204 S250
G1 X106.965 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X109.835 Y123.665 E.08819
G1 X109.835 Y132.335 E.2664
G1 X106.965 Y132.335 E.08819
G1 X106.965 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X108.965 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.643 Y130.954 Z11.2 F42000
G1 X105.609 Y134.191 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X105.609 Y121.81 E.41071
G1 X111.19 Y121.809 E.18514
G1 X111.191 Y134.19 E.41071
G1 X105.669 Y134.191 E.18317
M204 S10000
G1 X105.202 Y134.598 F42000
G1 F7581
M204 S6000
G1 X105.202 Y121.403 E.43772
G1 X111.597 Y121.402 E.21215
G1 X111.598 Y134.597 E.43771
G1 X105.262 Y134.598 E.21017
M204 S250
G1 X104.81 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X104.811 Y121.183 E.41815
G3 X104.992 Y121.01 I.194 J.022 E.00834
G1 X111.836 Y121.014 E.21032
G3 X111.99 Y121.196 I-.04 J.19 E.00785
G1 X111.99 Y134.79 E.41769
G3 X111.807 Y134.99 I-.192 J.008 E.00925
G1 X105.011 Y134.99 E.20883
G3 X104.818 Y134.852 I-.009 J-.192 E.00787
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.817 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.813 Y133.662 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X110.987 Y133.662 E.27384
M204 S10000
G1 X110.588 Y133.987 F42000
; LINE_WIDTH: 0.317186
G1 F7581
M204 S6000
G1 X110.696 Y133.771 E.00541
; LINE_WIDTH: 0.267319
G1 X110.804 Y133.554 E.00442
; LINE_WIDTH: 0.217451
G1 X110.912 Y133.338 E.00344
; LINE_WIDTH: 0.192342
G1 X110.912 Y122.662 E.12998
; LINE_WIDTH: 0.217033
G1 X110.804 Y122.446 E.00343
; LINE_WIDTH: 0.266777
G1 X110.696 Y122.229 E.00442
; LINE_WIDTH: 0.316522
G1 X110.588 Y122.013 E.0054
M204 S10000
G1 X110.987 Y122.338 F42000
; LINE_WIDTH: 0.692289
G1 F5543.85
M204 S6000
G1 X105.813 Y122.338 E.2738
M204 S10000
G1 X106.212 Y122.013 F42000
; LINE_WIDTH: 0.317297
G1 F7581
M204 S6000
G1 X106.104 Y122.229 E.00541
; LINE_WIDTH: 0.26741
G1 X105.996 Y122.446 E.00443
; LINE_WIDTH: 0.193133
G1 X105.887 Y122.662 E.00296
G1 X105.887 Y133.338 E.13067
; LINE_WIDTH: 0.217524
G1 X105.996 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X106.104 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X106.212 Y133.987 E.00541
; CHANGE_LAYER
; Z_HEIGHT: 11
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F13120.648
G1 X106.104 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 55/73
; update layer progress
M73 L55
M991 S0 P54 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z11.2 I.32 J1.174 P1  F42000
G1 X146.165 Y122.866 Z11.2
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X149.834 Y122.866 E.12171
G1 X149.834 Y133.134 E.34062
G1 X145.366 Y133.134 E.14822
G1 X145.366 Y122.866 E.34062
G1 X146.105 Y122.866 E.02452
M204 S10000
G1 X146.165 Y123.273 F42000
G1 F7581
M204 S6000
G1 X149.427 Y123.273 E.10821
G1 X149.427 Y132.727 E.31361
G1 X145.773 Y132.727 E.12121
G1 X145.773 Y123.273 E.31361
G1 X146.105 Y123.273 E.01102
M204 S250
G1 X146.165 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X149.035 Y123.665 E.08819
G1 X149.035 Y132.335 E.2664
G1 X146.165 Y132.335 E.08819
G1 X146.165 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.165 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.843 Y130.954 Z11.4 F42000
G1 X144.809 Y134.191 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X144.809 Y121.81 E.41071
G1 X150.391 Y121.809 E.18515
G1 X150.391 Y134.191 E.41071
G1 X144.869 Y134.191 E.18317
M204 S10000
G1 X144.402 Y134.598 F42000
G1 F7581
M204 S6000
G1 X144.402 Y121.403 E.43772
G1 X150.798 Y121.402 E.21215
G1 X150.798 Y134.598 E.43772
G1 X144.462 Y134.598 E.21017
M204 S250
G1 X144.01 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X144.011 Y121.184 E.41815
G3 X144.193 Y121.01 I.194 J.021 E.00839
G1 X151.036 Y121.015 E.21027
G3 X151.19 Y121.197 I-.041 J.19 E.00788
G1 X151.19 Y134.789 E.41765
G3 X151.006 Y134.99 I-.192 J.008 E.0093
G1 X144.147 Y134.982 E.21073
G3 X144.018 Y134.852 I.056 J-.185 E.00587
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.017 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 55 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z11.4
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer55 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X145.087 Y133.338 F42000
G1 Z11
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.193133
G1 F7581
M204 S6000
G1 X145.087 Y122.662 E.13067
G1 X145.196 Y122.446 E.00296
; LINE_WIDTH: 0.26741
G1 X145.304 Y122.229 E.00443
; LINE_WIDTH: 0.317297
G1 X145.412 Y122.013 E.00541
M204 S10000
G1 X145.013 Y122.338 F42000
; LINE_WIDTH: 0.692289
G1 F5543.85
M204 S6000
G1 X150.187 Y122.338 E.2738
M204 S10000
G1 X149.788 Y122.013 F42000
; LINE_WIDTH: 0.316715
G1 F7581
M204 S6000
G1 X149.896 Y122.229 E.0054
; LINE_WIDTH: 0.266933
G1 X150.004 Y122.446 E.00442
; LINE_WIDTH: 0.217151
G1 X150.112 Y122.662 E.00344
; LINE_WIDTH: 0.192407
G1 X150.112 Y133.338 E.13004
; LINE_WIDTH: 0.217467
G1 X150.004 Y133.554 E.00344
; LINE_WIDTH: 0.267344
G1 X149.896 Y133.771 E.00443
; LINE_WIDTH: 0.317222
G1 X149.788 Y133.987 E.00541
M204 S10000
G1 X150.187 Y133.662 F42000
; LINE_WIDTH: 0.692398
G1 F5542.917
M204 S6000
G1 X145.013 Y133.662 E.27386
M204 S10000
G1 X145.087 Y133.338 F42000
; LINE_WIDTH: 0.217524
G1 F7581
M204 S6000
G1 X145.196 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X145.304 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X145.412 Y133.987 E.00541
; OBJECT_ID: 405
; WIPE_START
G1 F13120.648
G1 X145.304 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X138.707 Y129.932 Z11.4 F42000
G1 X126.565 Y122.866 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X130.234 Y122.866 E.12171
G1 X130.234 Y133.134 E.34062
G1 X125.766 Y133.134 E.14822
G1 X125.766 Y122.866 E.34062
G1 X126.505 Y122.866 E.02452
M204 S10000
G1 X126.565 Y123.273 F42000
G1 F7581
M204 S6000
G1 X129.827 Y123.273 E.10821
G1 X129.827 Y132.727 E.31361
G1 X126.173 Y132.727 E.12121
G1 X126.173 Y123.273 E.31361
G1 X126.505 Y123.273 E.01102
M204 S250
G1 X126.565 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X129.435 Y123.665 E.08819
G1 X129.435 Y132.335 E.2664
G1 X126.565 Y132.335 E.08819
G1 X126.565 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.565 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.243 Y130.954 Z11.4 F42000
G1 X125.209 Y134.191 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X125.209 Y121.81 E.41071
G1 X130.791 Y121.809 E.18515
G1 X130.791 Y134.191 E.41071
G1 X125.269 Y134.191 E.18317
M204 S10000
G1 X124.802 Y134.598 F42000
G1 F7581
M204 S6000
G1 X124.802 Y121.403 E.43772
G1 X131.198 Y121.402 E.21215
G1 X131.198 Y134.598 E.43772
G1 X124.862 Y134.598 E.21017
M204 S250
M73 P81 R4
G1 X124.41 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X124.411 Y121.184 E.41815
G3 X124.593 Y121.01 I.194 J.021 E.00839
G1 X131.436 Y121.015 E.21027
G3 X131.59 Y121.197 I-.041 J.19 E.00788
G1 X131.59 Y134.789 E.41765
G3 X131.406 Y134.99 I-.192 J.008 E.0093
G1 X124.547 Y134.982 E.21073
G3 X124.418 Y134.852 I.056 J-.185 E.00587
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.417 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.413 Y133.662 Z11.4 F42000
G1 Z11
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692398
G1 F5542.917
M204 S6000
G1 X130.587 Y133.662 E.27386
M204 S10000
G1 X130.188 Y133.987 F42000
; LINE_WIDTH: 0.317222
G1 F7581
M204 S6000
G1 X130.296 Y133.771 E.00541
; LINE_WIDTH: 0.267344
G1 X130.404 Y133.554 E.00443
; LINE_WIDTH: 0.217467
G1 X130.512 Y133.338 E.00344
; LINE_WIDTH: 0.192407
G1 X130.512 Y122.662 E.13004
; LINE_WIDTH: 0.217151
G1 X130.404 Y122.446 E.00344
; LINE_WIDTH: 0.266933
G1 X130.296 Y122.229 E.00442
; LINE_WIDTH: 0.316715
G1 X130.188 Y122.013 E.0054
M204 S10000
G1 X130.587 Y122.338 F42000
; LINE_WIDTH: 0.692289
G1 F5543.85
M204 S6000
G1 X125.413 Y122.338 E.2738
M204 S10000
G1 X125.812 Y122.013 F42000
; LINE_WIDTH: 0.317297
G1 F7581
M204 S6000
G1 X125.704 Y122.229 E.00541
; LINE_WIDTH: 0.26741
G1 X125.596 Y122.446 E.00443
; LINE_WIDTH: 0.193133
G1 X125.487 Y122.662 E.00296
G1 X125.487 Y133.338 E.13067
; LINE_WIDTH: 0.217524
G1 X125.596 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X125.704 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X125.812 Y133.987 E.00541
; OBJECT_ID: 394
; WIPE_START
G1 F13120.648
G1 X125.704 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X119.107 Y129.932 Z11.4 F42000
G1 X106.965 Y122.866 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X110.634 Y122.866 E.12171
G1 X110.634 Y133.134 E.34062
G1 X106.166 Y133.134 E.14822
G1 X106.166 Y122.866 E.34062
G1 X106.905 Y122.866 E.02452
M204 S10000
G1 X106.965 Y123.273 F42000
G1 F7581
M204 S6000
G1 X110.227 Y123.273 E.10821
G1 X110.227 Y132.727 E.31361
G1 X106.573 Y132.727 E.12121
G1 X106.573 Y123.273 E.31361
G1 X106.905 Y123.273 E.01102
M204 S250
G1 X106.965 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X109.835 Y123.665 E.08819
G1 X109.835 Y132.335 E.2664
G1 X106.965 Y132.335 E.08819
G1 X106.965 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X108.965 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.643 Y130.954 Z11.4 F42000
G1 X105.609 Y134.191 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X105.609 Y121.81 E.41071
G1 X111.191 Y121.809 E.18515
G1 X111.191 Y134.191 E.41071
G1 X105.669 Y134.191 E.18317
M204 S10000
G1 X105.202 Y134.598 F42000
G1 F7581
M204 S6000
G1 X105.202 Y121.403 E.43772
G1 X111.598 Y121.402 E.21215
G1 X111.598 Y134.598 E.43772
G1 X105.262 Y134.598 E.21017
M204 S250
G1 X104.81 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X104.811 Y121.184 E.41815
G3 X104.993 Y121.01 I.194 J.021 E.00839
G1 X111.836 Y121.015 E.21027
G3 X111.99 Y121.197 I-.041 J.19 E.00788
G1 X111.99 Y134.789 E.41765
G3 X111.806 Y134.99 I-.192 J.008 E.0093
G1 X104.947 Y134.982 E.21073
G3 X104.818 Y134.852 I.056 J-.185 E.00587
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.817 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.813 Y133.662 Z11.4 F42000
G1 Z11
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692398
G1 F5542.917
M204 S6000
G1 X110.987 Y133.662 E.27386
M204 S10000
G1 X110.588 Y133.987 F42000
; LINE_WIDTH: 0.317222
G1 F7581
M204 S6000
G1 X110.696 Y133.771 E.00541
; LINE_WIDTH: 0.267344
G1 X110.804 Y133.554 E.00443
; LINE_WIDTH: 0.217467
G1 X110.912 Y133.338 E.00344
; LINE_WIDTH: 0.192407
G1 X110.912 Y122.662 E.13004
; LINE_WIDTH: 0.217151
G1 X110.804 Y122.446 E.00344
; LINE_WIDTH: 0.266933
G1 X110.696 Y122.229 E.00442
; LINE_WIDTH: 0.316715
G1 X110.588 Y122.013 E.0054
M204 S10000
G1 X110.987 Y122.338 F42000
; LINE_WIDTH: 0.692289
G1 F5543.85
M204 S6000
G1 X105.813 Y122.338 E.2738
M204 S10000
G1 X106.212 Y122.013 F42000
; LINE_WIDTH: 0.317297
G1 F7581
M204 S6000
G1 X106.104 Y122.229 E.00541
; LINE_WIDTH: 0.26741
G1 X105.996 Y122.446 E.00443
; LINE_WIDTH: 0.193133
G1 X105.887 Y122.662 E.00296
G1 X105.887 Y133.338 E.13067
; LINE_WIDTH: 0.217524
G1 X105.996 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X106.104 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X106.212 Y133.987 E.00541
; CHANGE_LAYER
; Z_HEIGHT: 11.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F13120.648
G1 X106.104 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 56/73
; update layer progress
M73 L56
M991 S0 P55 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z11.4 I.32 J1.174 P1  F42000
G1 X146.165 Y122.866 Z11.4
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X149.834 Y122.866 E.12171
G1 X149.834 Y133.134 E.34062
G1 X145.366 Y133.134 E.14822
G1 X145.366 Y122.866 E.34062
G1 X146.105 Y122.866 E.02452
M204 S10000
G1 X146.165 Y123.273 F42000
G1 F7581
M204 S6000
G1 X149.427 Y123.273 E.10821
G1 X149.427 Y132.727 E.31361
G1 X145.773 Y132.727 E.12121
G1 X145.773 Y123.273 E.31361
G1 X146.105 Y123.273 E.01102
M204 S250
G1 X146.165 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X149.035 Y123.665 E.08819
G1 X149.035 Y132.335 E.2664
G1 X146.165 Y132.335 E.08819
G1 X146.165 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.165 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.843 Y130.954 Z11.6 F42000
G1 X144.809 Y134.191 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X144.809 Y121.81 E.41071
G1 X150.39 Y121.809 E.18514
G1 X150.391 Y134.19 E.41071
G1 X144.869 Y134.191 E.18317
M204 S10000
G1 X144.402 Y134.598 F42000
G1 F7581
M204 S6000
G1 X144.402 Y121.403 E.43772
G1 X150.797 Y121.402 E.21215
G1 X150.798 Y134.597 E.43771
G1 X144.462 Y134.598 E.21017
M204 S250
G1 X144.01 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X144.011 Y121.184 E.41815
G3 X144.193 Y121.01 I.193 J.021 E.0084
G1 X151.037 Y121.015 E.21027
G3 X151.19 Y121.196 I-.038 J.187 E.00786
G1 X151.19 Y134.789 E.41768
G3 X151.007 Y134.99 I-.192 J.008 E.00926
G1 X144.184 Y134.989 E.20966
G3 X144.018 Y134.852 I.02 J-.193 E.00699
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.017 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 56 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z11.6
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer56 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X145.087 Y133.338 F42000
G1 Z11.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.193133
G1 F7581
M204 S6000
G1 X145.087 Y122.662 E.13067
G1 X145.196 Y122.446 E.00296
; LINE_WIDTH: 0.26741
G1 X145.304 Y122.229 E.00443
; LINE_WIDTH: 0.317297
G1 X145.412 Y122.013 E.00541
M204 S10000
G1 X145.013 Y122.338 F42000
; LINE_WIDTH: 0.692289
G1 F5543.845
M204 S6000
G1 X150.187 Y122.338 E.2738
M204 S10000
G1 X149.788 Y122.013 F42000
; LINE_WIDTH: 0.316522
G1 F7581
M204 S6000
G1 X149.896 Y122.229 E.0054
; LINE_WIDTH: 0.266777
G1 X150.004 Y122.446 E.00442
; LINE_WIDTH: 0.217033
G1 X150.112 Y122.662 E.00343
; LINE_WIDTH: 0.192342
G1 X150.112 Y133.338 E.12998
; LINE_WIDTH: 0.217451
G1 X150.004 Y133.554 E.00344
; LINE_WIDTH: 0.267319
G1 X149.896 Y133.771 E.00442
; LINE_WIDTH: 0.317186
G1 X149.788 Y133.987 E.00541
M204 S10000
G1 X150.187 Y133.662 F42000
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X145.013 Y133.662 E.27384
M204 S10000
G1 X145.087 Y133.338 F42000
; LINE_WIDTH: 0.217524
G1 F7581
M204 S6000
G1 X145.196 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X145.304 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X145.412 Y133.987 E.00541
; OBJECT_ID: 405
; WIPE_START
G1 F13120.648
G1 X145.304 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X138.707 Y129.932 Z11.6 F42000
G1 X126.565 Y122.866 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X130.234 Y122.866 E.12171
G1 X130.234 Y133.134 E.34062
G1 X125.766 Y133.134 E.14822
G1 X125.766 Y122.866 E.34062
G1 X126.505 Y122.866 E.02452
M204 S10000
G1 X126.565 Y123.273 F42000
G1 F7581
M204 S6000
G1 X129.827 Y123.273 E.10821
G1 X129.827 Y132.727 E.31361
G1 X126.173 Y132.727 E.12121
G1 X126.173 Y123.273 E.31361
G1 X126.505 Y123.273 E.01102
M204 S250
G1 X126.565 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P81 R3
G1 F7581
M204 S5000
G1 X129.435 Y123.665 E.08819
G1 X129.435 Y132.335 E.2664
G1 X126.565 Y132.335 E.08819
G1 X126.565 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.565 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.243 Y130.954 Z11.6 F42000
G1 X125.209 Y134.191 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X125.209 Y121.81 E.41071
G1 X130.79 Y121.809 E.18514
G1 X130.791 Y134.19 E.41071
G1 X125.269 Y134.191 E.18317
M204 S10000
G1 X124.802 Y134.598 F42000
G1 F7581
M204 S6000
G1 X124.802 Y121.403 E.43772
G1 X131.197 Y121.402 E.21215
G1 X131.198 Y134.597 E.43771
G1 X124.862 Y134.598 E.21017
M204 S250
G1 X124.41 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X124.411 Y121.184 E.41815
G3 X124.593 Y121.01 I.193 J.021 E.0084
G1 X131.437 Y121.015 E.21027
G3 X131.59 Y121.196 I-.038 J.187 E.00786
G1 X131.59 Y134.789 E.41768
G3 X131.407 Y134.99 I-.192 J.008 E.00926
G1 X124.584 Y134.989 E.20966
G3 X124.418 Y134.852 I.02 J-.193 E.00699
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.417 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.413 Y133.662 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X130.587 Y133.662 E.27384
M204 S10000
G1 X130.188 Y133.987 F42000
; LINE_WIDTH: 0.317186
G1 F7581
M204 S6000
G1 X130.296 Y133.771 E.00541
; LINE_WIDTH: 0.267319
G1 X130.404 Y133.554 E.00442
; LINE_WIDTH: 0.217451
G1 X130.512 Y133.338 E.00344
; LINE_WIDTH: 0.192342
G1 X130.512 Y122.662 E.12998
; LINE_WIDTH: 0.217033
G1 X130.404 Y122.446 E.00343
; LINE_WIDTH: 0.266777
G1 X130.296 Y122.229 E.00442
; LINE_WIDTH: 0.316522
G1 X130.188 Y122.013 E.0054
M204 S10000
G1 X130.587 Y122.338 F42000
; LINE_WIDTH: 0.692289
G1 F5543.845
M204 S6000
G1 X125.413 Y122.338 E.2738
M204 S10000
G1 X125.812 Y122.013 F42000
; LINE_WIDTH: 0.317297
G1 F7581
M204 S6000
G1 X125.704 Y122.229 E.00541
; LINE_WIDTH: 0.26741
G1 X125.596 Y122.446 E.00443
; LINE_WIDTH: 0.193133
G1 X125.487 Y122.662 E.00296
G1 X125.487 Y133.338 E.13067
; LINE_WIDTH: 0.217524
M73 P82 R3
G1 X125.596 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X125.704 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X125.812 Y133.987 E.00541
; OBJECT_ID: 394
; WIPE_START
G1 F13120.648
G1 X125.704 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X119.107 Y129.932 Z11.6 F42000
G1 X106.965 Y122.866 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X110.634 Y122.866 E.12171
G1 X110.634 Y133.134 E.34062
G1 X106.166 Y133.134 E.14822
G1 X106.166 Y122.866 E.34062
G1 X106.905 Y122.866 E.02452
M204 S10000
G1 X106.965 Y123.273 F42000
G1 F7581
M204 S6000
G1 X110.227 Y123.273 E.10821
G1 X110.227 Y132.727 E.31361
G1 X106.573 Y132.727 E.12121
G1 X106.573 Y123.273 E.31361
G1 X106.905 Y123.273 E.01102
M204 S250
G1 X106.965 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X109.835 Y123.665 E.08819
G1 X109.835 Y132.335 E.2664
G1 X106.965 Y132.335 E.08819
G1 X106.965 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X108.965 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.643 Y130.954 Z11.6 F42000
G1 X105.609 Y134.191 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7581
M204 S6000
G1 X105.609 Y121.81 E.41071
G1 X111.19 Y121.809 E.18514
G1 X111.191 Y134.19 E.41071
G1 X105.669 Y134.191 E.18317
M204 S10000
G1 X105.202 Y134.598 F42000
G1 F7581
M204 S6000
G1 X105.202 Y121.403 E.43772
G1 X111.597 Y121.402 E.21215
G1 X111.598 Y134.597 E.43771
G1 X105.262 Y134.598 E.21017
M204 S250
G1 X104.81 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7581
M204 S5000
G1 X104.811 Y121.184 E.41815
G3 X104.993 Y121.01 I.193 J.021 E.0084
G1 X111.837 Y121.015 E.21027
G3 X111.99 Y121.196 I-.038 J.187 E.00786
G1 X111.99 Y134.789 E.41768
G3 X111.807 Y134.99 I-.192 J.008 E.00926
G1 X104.984 Y134.989 E.20966
G3 X104.818 Y134.852 I.02 J-.193 E.00699
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.817 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.813 Y133.662 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692334
G1 F5543.461
M204 S6000
G1 X110.987 Y133.662 E.27384
M204 S10000
G1 X110.588 Y133.987 F42000
; LINE_WIDTH: 0.317186
G1 F7581
M204 S6000
G1 X110.696 Y133.771 E.00541
; LINE_WIDTH: 0.267319
G1 X110.804 Y133.554 E.00442
; LINE_WIDTH: 0.217451
G1 X110.912 Y133.338 E.00344
; LINE_WIDTH: 0.192342
G1 X110.912 Y122.662 E.12998
; LINE_WIDTH: 0.217033
G1 X110.804 Y122.446 E.00343
; LINE_WIDTH: 0.266777
G1 X110.696 Y122.229 E.00442
; LINE_WIDTH: 0.316522
G1 X110.588 Y122.013 E.0054
M204 S10000
G1 X110.987 Y122.338 F42000
; LINE_WIDTH: 0.692289
G1 F5543.845
M204 S6000
G1 X105.813 Y122.338 E.2738
M204 S10000
G1 X106.212 Y122.013 F42000
; LINE_WIDTH: 0.317297
G1 F7581
M204 S6000
G1 X106.104 Y122.229 E.00541
; LINE_WIDTH: 0.26741
G1 X105.996 Y122.446 E.00443
; LINE_WIDTH: 0.193133
G1 X105.887 Y122.662 E.00296
G1 X105.887 Y133.338 E.13067
; LINE_WIDTH: 0.217524
G1 X105.996 Y133.554 E.00344
; LINE_WIDTH: 0.26741
G1 X106.104 Y133.771 E.00443
; LINE_WIDTH: 0.317297
G1 X106.212 Y133.987 E.00541
; CHANGE_LAYER
; Z_HEIGHT: 11.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F13120.648
G1 X106.104 Y133.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 57/73
; update layer progress
M73 L57
M991 S0 P56 ;notify layer change
M106 S198.9
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z11.6 I-.013 J1.217 P1  F42000
G1 X144.809 Y134.191 Z11.6
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X144.809 Y121.81 E.41071
G1 X150.39 Y121.809 E.18514
G1 X150.391 Y134.19 E.41071
G1 X144.869 Y134.191 E.18317
M204 S10000
G1 X144.402 Y134.598 F42000
G1 F8843.478
M204 S6000
G1 X144.402 Y121.403 E.43772
G1 X150.797 Y121.402 E.21215
G1 X150.798 Y134.597 E.43771
G1 X144.462 Y134.598 E.21017
M204 S250
G1 X144.01 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X144.011 Y121.184 E.41815
G3 X144.193 Y121.01 I.196 J.024 E.00837
G1 X151.037 Y121.015 E.21028
G3 X151.19 Y121.196 I-.041 J.19 E.00784
G1 X151.19 Y134.789 E.41768
G3 X151.009 Y134.99 I-.192 J.008 E.00919
G1 X144.184 Y134.989 E.20973
G3 X144.018 Y134.852 I.021 J-.194 E.00698
; WIPE_START
M204 S6000
G1 X144.017 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 57 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z11.8
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer57 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X145.181 Y133.804 F42000
G1 Z11.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F10588.235
M204 S6000
G1 X145.117 Y133.84 E.00204
G1 X145.166 Y133.869 E.00155
M204 S10000
G1 X145.494 Y133.857 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.42079
M106 S255
G1 F3000
M204 S6000
G1 X149.234 Y133.857 E.11516
G1 X149.367 Y133.814 E.00429
G2 X149.995 Y133.479 I-.605 J-1.893 E.02204
G1 X145.205 Y133.479 E.1475
G1 X145.142 Y133.426 E.00252
G1 X145.142 Y133.101 E.01001
G1 X150.058 Y133.101 E.15135
G1 X150.058 Y132.723 E.01164
G1 X145.142 Y132.723 E.15135
G1 X145.142 Y132.346 E.01164
G1 X150.058 Y132.346 E.15134
G1 X150.057 Y131.968 E.01164
G1 X145.142 Y131.968 E.15134
G1 X145.142 Y131.59 E.01164
G1 X150.057 Y131.59 E.15134
G1 X150.057 Y131.212 E.01164
G1 X145.142 Y131.212 E.15134
G1 X145.142 Y130.834 E.01164
G1 X150.057 Y130.834 E.15134
G1 X150.057 Y130.456 E.01164
G1 X145.142 Y130.456 E.15134
G1 X145.142 Y130.078 E.01164
G1 X150.057 Y130.078 E.15134
G1 X150.057 Y129.7 E.01164
G1 X145.142 Y129.7 E.15134
G1 X145.142 Y129.323 E.01164
G1 X150.057 Y129.323 E.15134
G1 X150.057 Y128.945 E.01164
G1 X145.142 Y128.945 E.15134
G1 X145.142 Y128.567 E.01164
G1 X150.057 Y128.567 E.15134
G1 X150.057 Y128.189 E.01164
G1 X145.142 Y128.189 E.15134
G1 X145.142 Y127.811 E.01164
G1 X150.057 Y127.811 E.15134
G1 X150.057 Y127.433 E.01164
G1 X145.142 Y127.433 E.15134
G1 X145.142 Y127.055 E.01164
G1 X150.057 Y127.055 E.15134
G1 X150.057 Y126.678 E.01164
G1 X145.142 Y126.678 E.15134
G1 X145.142 Y126.3 E.01164
G1 X150.057 Y126.3 E.15134
G1 X150.057 Y125.922 E.01164
G1 X145.142 Y125.922 E.15134
G1 X145.142 Y125.544 E.01164
G1 X150.057 Y125.544 E.15134
G1 X150.057 Y125.166 E.01164
G1 X145.142 Y125.166 E.15134
G1 X145.142 Y124.788 E.01164
G1 X150.057 Y124.788 E.15134
G1 X150.057 Y124.41 E.01164
G1 X145.142 Y124.41 E.15134
G1 X145.142 Y124.032 E.01164
G1 X150.057 Y124.032 E.15134
G1 X150.057 Y123.655 E.01164
G1 X145.142 Y123.655 E.15134
G1 X145.142 Y123.277 E.01164
G1 X150.057 Y123.277 E.15134
G1 X150.057 Y122.899 E.01164
G1 X145.142 Y122.899 E.15133
G1 X145.142 Y122.574 E.01001
G1 X145.205 Y122.521 E.00251
G1 X149.995 Y122.521 E.14751
G1 X149.649 Y122.303 E.01259
G2 X149.235 Y122.143 I-1.134 J2.313 E.0137
G1 X145.494 Y122.143 E.11518
M106 S198.9
M204 S10000
G1 X145.177 Y122.119 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F10588.235
M204 S6000
G1 X145.113 Y122.156 E.00204
G1 X145.162 Y122.184 E.00155
M204 S10000
G1 X150.062 Y122.123 F42000
G1 F10588.235
M204 S6000
G1 X149.998 Y122.159 E.00204
G1 X150.046 Y122.188 E.00155
M204 S10000
G1 X150.066 Y133.807 F42000
G1 F10588.235
M204 S6000
G1 X150.002 Y133.844 E.00204
G1 X150.05 Y133.872 E.00155
; OBJECT_ID: 405
; WIPE_START
G1 X150.002 Y133.844 E-.32873
G1 X150.066 Y133.807 E-.43127
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X142.434 Y133.925 Z11.8 F42000
G1 X125.209 Y134.191 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X125.209 Y121.81 E.41071
G1 X130.79 Y121.809 E.18514
G1 X130.791 Y134.19 E.41071
G1 X125.269 Y134.191 E.18317
M204 S10000
G1 X124.802 Y134.598 F42000
G1 F8843.478
M204 S6000
G1 X124.802 Y121.403 E.43772
G1 X131.197 Y121.402 E.21215
G1 X131.198 Y134.597 E.43771
G1 X124.862 Y134.598 E.21017
M204 S250
G1 X124.41 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X124.411 Y121.184 E.41815
G3 X124.593 Y121.01 I.196 J.024 E.00837
G1 X131.437 Y121.015 E.21028
G3 X131.59 Y121.196 I-.041 J.19 E.00784
G1 X131.59 Y134.789 E.41768
G3 X131.409 Y134.99 I-.192 J.008 E.00919
G1 X124.584 Y134.989 E.20973
G3 X124.418 Y134.852 I.021 J-.194 E.00698
; WIPE_START
M204 S6000
G1 X124.417 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.581 Y133.804 Z11.8 F42000
G1 Z11.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F10588.235
M204 S6000
G1 X125.517 Y133.84 E.00204
G1 X125.566 Y133.869 E.00155
M204 S10000
G1 X125.894 Y133.857 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.42079
M106 S255
G1 F3000
M204 S6000
G1 X129.634 Y133.857 E.11516
G1 X129.767 Y133.814 E.00429
G2 X130.395 Y133.479 I-.605 J-1.893 E.02204
G1 X125.605 Y133.479 E.1475
G1 X125.542 Y133.426 E.00252
G1 X125.542 Y133.101 E.01001
G1 X130.458 Y133.101 E.15135
G1 X130.458 Y132.723 E.01164
G1 X125.542 Y132.723 E.15135
G1 X125.542 Y132.346 E.01164
G1 X130.458 Y132.346 E.15134
G1 X130.457 Y131.968 E.01164
M73 P83 R3
G1 X125.542 Y131.968 E.15134
G1 X125.542 Y131.59 E.01164
G1 X130.457 Y131.59 E.15134
G1 X130.457 Y131.212 E.01164
G1 X125.542 Y131.212 E.15134
G1 X125.542 Y130.834 E.01164
G1 X130.457 Y130.834 E.15134
G1 X130.457 Y130.456 E.01164
G1 X125.542 Y130.456 E.15134
G1 X125.542 Y130.078 E.01164
G1 X130.457 Y130.078 E.15134
G1 X130.457 Y129.7 E.01164
G1 X125.542 Y129.7 E.15134
G1 X125.542 Y129.323 E.01164
G1 X130.457 Y129.323 E.15134
G1 X130.457 Y128.945 E.01164
G1 X125.542 Y128.945 E.15134
G1 X125.542 Y128.567 E.01164
G1 X130.457 Y128.567 E.15134
G1 X130.457 Y128.189 E.01164
G1 X125.542 Y128.189 E.15134
G1 X125.542 Y127.811 E.01164
G1 X130.457 Y127.811 E.15134
G1 X130.457 Y127.433 E.01164
G1 X125.542 Y127.433 E.15134
G1 X125.542 Y127.055 E.01164
G1 X130.457 Y127.055 E.15134
G1 X130.457 Y126.678 E.01164
G1 X125.542 Y126.678 E.15134
G1 X125.542 Y126.3 E.01164
G1 X130.457 Y126.3 E.15134
G1 X130.457 Y125.922 E.01164
G1 X125.542 Y125.922 E.15134
G1 X125.542 Y125.544 E.01164
G1 X130.457 Y125.544 E.15134
G1 X130.457 Y125.166 E.01164
G1 X125.542 Y125.166 E.15134
G1 X125.542 Y124.788 E.01164
G1 X130.457 Y124.788 E.15134
G1 X130.457 Y124.41 E.01164
G1 X125.542 Y124.41 E.15134
G1 X125.542 Y124.032 E.01164
G1 X130.457 Y124.032 E.15134
G1 X130.457 Y123.655 E.01164
G1 X125.542 Y123.655 E.15134
G1 X125.542 Y123.277 E.01164
G1 X130.457 Y123.277 E.15134
G1 X130.457 Y122.899 E.01164
G1 X125.542 Y122.899 E.15133
G1 X125.542 Y122.574 E.01001
G1 X125.605 Y122.521 E.00251
G1 X130.395 Y122.521 E.14751
G1 X130.049 Y122.303 E.01259
G2 X129.635 Y122.143 I-1.134 J2.313 E.0137
G1 X125.894 Y122.143 E.11518
M106 S198.9
M204 S10000
G1 X125.577 Y122.119 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F10588.235
M204 S6000
G1 X125.513 Y122.156 E.00204
G1 X125.562 Y122.184 E.00155
M204 S10000
G1 X130.462 Y122.123 F42000
G1 F10588.235
M204 S6000
G1 X130.398 Y122.159 E.00204
G1 X130.446 Y122.188 E.00155
M204 S10000
G1 X130.466 Y133.807 F42000
G1 F10588.235
M204 S6000
G1 X130.402 Y133.844 E.00204
G1 X130.45 Y133.872 E.00155
; OBJECT_ID: 394
; WIPE_START
G1 X130.402 Y133.844 E-.32873
G1 X130.466 Y133.807 E-.43127
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X122.834 Y133.925 Z11.8 F42000
G1 X105.609 Y134.191 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X105.609 Y121.81 E.41071
G1 X111.19 Y121.809 E.18514
G1 X111.191 Y134.19 E.41071
G1 X105.669 Y134.191 E.18317
M204 S10000
G1 X105.202 Y134.598 F42000
G1 F8843.478
M204 S6000
G1 X105.202 Y121.403 E.43772
G1 X111.597 Y121.402 E.21215
G1 X111.598 Y134.597 E.43771
G1 X105.262 Y134.598 E.21017
M204 S250
G1 X104.81 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X104.811 Y121.184 E.41815
G3 X104.993 Y121.01 I.196 J.024 E.00837
G1 X111.837 Y121.015 E.21028
G3 X111.99 Y121.196 I-.041 J.19 E.00784
G1 X111.99 Y134.789 E.41768
G3 X111.809 Y134.99 I-.192 J.008 E.00919
G1 X104.984 Y134.989 E.20973
G3 X104.819 Y134.852 I.021 J-.194 E.00698
; WIPE_START
M204 S6000
G1 X104.817 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.981 Y133.804 Z11.8 F42000
G1 Z11.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F10588.235
M204 S6000
G1 X105.917 Y133.84 E.00204
G1 X105.966 Y133.869 E.00155
M204 S10000
G1 X106.294 Y133.857 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.42079
M106 S255
G1 F3000
M204 S6000
G1 X110.034 Y133.857 E.11516
G1 X110.167 Y133.814 E.00429
G2 X110.795 Y133.479 I-.605 J-1.893 E.02204
G1 X106.005 Y133.479 E.1475
G1 X105.942 Y133.426 E.00252
G1 X105.942 Y133.101 E.01001
G1 X110.858 Y133.101 E.15135
G1 X110.858 Y132.723 E.01164
G1 X105.942 Y132.723 E.15135
G1 X105.942 Y132.346 E.01164
G1 X110.858 Y132.346 E.15134
G1 X110.858 Y131.968 E.01164
G1 X105.942 Y131.968 E.15134
G1 X105.942 Y131.59 E.01164
G1 X110.857 Y131.59 E.15134
G1 X110.857 Y131.212 E.01164
G1 X105.942 Y131.212 E.15134
G1 X105.942 Y130.834 E.01164
G1 X110.857 Y130.834 E.15134
G1 X110.857 Y130.456 E.01164
G1 X105.942 Y130.456 E.15134
G1 X105.942 Y130.078 E.01164
G1 X110.857 Y130.078 E.15134
G1 X110.857 Y129.7 E.01164
G1 X105.942 Y129.7 E.15134
G1 X105.942 Y129.323 E.01164
G1 X110.857 Y129.323 E.15134
G1 X110.857 Y128.945 E.01164
G1 X105.942 Y128.945 E.15134
G1 X105.942 Y128.567 E.01164
G1 X110.857 Y128.567 E.15134
G1 X110.857 Y128.189 E.01164
G1 X105.942 Y128.189 E.15134
G1 X105.942 Y127.811 E.01164
G1 X110.857 Y127.811 E.15134
G1 X110.857 Y127.433 E.01164
G1 X105.942 Y127.433 E.15134
G1 X105.942 Y127.055 E.01164
G1 X110.857 Y127.055 E.15134
G1 X110.857 Y126.678 E.01164
G1 X105.942 Y126.678 E.15134
G1 X105.942 Y126.3 E.01164
G1 X110.857 Y126.3 E.15134
G1 X110.857 Y125.922 E.01164
G1 X105.942 Y125.922 E.15134
G1 X105.942 Y125.544 E.01164
G1 X110.857 Y125.544 E.15134
G1 X110.857 Y125.166 E.01164
G1 X105.942 Y125.166 E.15134
G1 X105.942 Y124.788 E.01164
G1 X110.857 Y124.788 E.15134
G1 X110.857 Y124.41 E.01164
G1 X105.942 Y124.41 E.15134
G1 X105.942 Y124.032 E.01164
G1 X110.857 Y124.032 E.15134
G1 X110.857 Y123.655 E.01164
G1 X105.942 Y123.655 E.15134
G1 X105.942 Y123.277 E.01164
G1 X110.857 Y123.277 E.15134
G1 X110.857 Y122.899 E.01164
G1 X105.942 Y122.899 E.15133
G1 X105.942 Y122.574 E.01001
G1 X106.005 Y122.521 E.00251
G1 X110.795 Y122.521 E.14751
G1 X110.449 Y122.303 E.01259
G2 X110.035 Y122.143 I-1.134 J2.313 E.0137
G1 X106.294 Y122.143 E.11518
M106 S198.9
M204 S10000
G1 X105.977 Y122.119 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F10588.235
M204 S6000
G1 X105.913 Y122.156 E.00204
G1 X105.962 Y122.184 E.00155
M204 S10000
G1 X110.862 Y122.123 F42000
G1 F10588.235
M204 S6000
G1 X110.798 Y122.159 E.00204
G1 X110.846 Y122.188 E.00155
M204 S10000
G1 X110.866 Y133.807 F42000
G1 F10588.235
M204 S6000
G1 X110.802 Y133.844 E.00204
G1 X110.85 Y133.872 E.00155
; CHANGE_LAYER
; Z_HEIGHT: 11.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F10588.235
G1 X110.802 Y133.844 E-.32873
G1 X110.866 Y133.807 E-.43127
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 58/73
; update layer progress
M73 L58
M991 S0 P57 ;notify layer change
M106 S201.45
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z11.8 I-.014 J1.217 P1  F42000
G1 X144.809 Y134.191 Z11.8
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X144.809 Y121.81 E.41071
G1 X150.39 Y121.809 E.18514
G1 X150.391 Y134.19 E.41071
G1 X144.869 Y134.191 E.18317
M204 S10000
G1 X144.402 Y134.598 F42000
G1 F8843.478
M204 S6000
G1 X144.402 Y121.403 E.43772
G1 X150.797 Y121.402 E.21215
G1 X150.798 Y134.597 E.43771
G1 X144.462 Y134.598 E.21017
M204 S250
G1 X144.01 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9059
M204 S5000
G1 X144.015 Y121.158 E.41893
G3 X144.193 Y121.01 I.187 J.044 E.00763
G1 X151.036 Y121.015 E.21027
G3 X151.19 Y121.196 I-.041 J.19 E.00785
G1 X151.19 Y134.79 E.4177
G3 X151.007 Y134.99 I-.192 J.008 E.00925
G1 X144.158 Y134.985 E.21043
G3 X144.018 Y134.853 I.044 J-.188 E.0062
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.018 Y132.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 58 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z12
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer58 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X147.762 Y124.6 F42000
G1 Z11.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.367714
G1 F9059
M204 S6000
G1 X147.762 Y124.438 E.0043
G1 X147.437 Y124.438 E.0086
G1 X147.438 Y131.562 E.18856
G1 X147.762 Y131.562 E.0086
G1 X147.762 Y124.66 E.18268
M204 S10000
G1 X148.113 Y124.6 F42000
; LINE_WIDTH: 0.41999
G1 F9059
M204 S6000
G1 X148.113 Y124.087 E.01577
G1 X147.087 Y124.087 E.03154
G1 X147.087 Y131.913 E.24048
G1 X148.113 Y131.913 E.03155
G1 X148.113 Y124.66 E.22286
M204 S10000
G1 X148.49 Y124.6 F42000
G1 F9059
M204 S6000
G1 X148.49 Y123.71 E.02736
G1 X146.709 Y123.71 E.05471
G1 X146.709 Y132.29 E.26365
G1 X148.49 Y132.29 E.05472
G1 X148.49 Y124.66 E.23445
M204 S10000
G1 X148.867 Y124.6 F42000
G1 F9059
M204 S6000
G1 X148.867 Y123.333 E.03894
G1 X146.332 Y123.333 E.07789
G1 X146.332 Y132.667 E.28682
G1 X148.868 Y132.667 E.07789
G1 X148.867 Y124.66 E.24603
M204 S10000
G1 X149.244 Y124.6 F42000
G1 F9059
M204 S6000
G1 X149.244 Y122.956 E.05053
G1 X145.955 Y122.956 E.10106
G1 X145.955 Y133.045 E.30999
G1 X149.245 Y133.044 E.10107
G1 X149.244 Y124.66 E.25762
M204 S10000
G1 X149.621 Y124.6 F42000
G1 F9059
M204 S6000
G1 X149.621 Y122.578 E.06212
G1 X145.578 Y122.579 E.12423
G1 X145.578 Y133.422 E.33317
G1 X149.622 Y133.421 E.12424
G1 X149.621 Y124.66 E.2692
M204 S10000
G1 X149.998 Y124.6 F42000
G1 F9059
M204 S6000
G1 X149.998 Y122.201 E.0737
G1 X145.201 Y122.202 E.1474
G1 X145.201 Y133.799 E.35634
G1 X149.999 Y133.798 E.14741
G1 X149.998 Y124.66 E.28079
; OBJECT_ID: 405
; WIPE_START
G1 F9547.299
G1 X149.999 Y126.66 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z12 I-.354 J-1.164 P1  F42000
G1 X125.209 Y134.191 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X125.209 Y121.81 E.41071
G1 X130.79 Y121.809 E.18514
G1 X130.791 Y134.19 E.41071
G1 X125.269 Y134.191 E.18317
M204 S10000
M73 P84 R3
G1 X124.802 Y134.598 F42000
G1 F8843.478
M204 S6000
G1 X124.802 Y121.403 E.43772
G1 X131.197 Y121.402 E.21215
G1 X131.198 Y134.597 E.43771
G1 X124.862 Y134.598 E.21017
M204 S250
G1 X124.41 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9059
M204 S5000
G1 X124.415 Y121.158 E.41893
G3 X124.593 Y121.01 I.187 J.044 E.00763
G1 X131.436 Y121.015 E.21027
G3 X131.59 Y121.196 I-.041 J.19 E.00785
G1 X131.59 Y134.79 E.4177
G3 X131.407 Y134.99 I-.192 J.008 E.00925
G1 X124.558 Y134.985 E.21043
G3 X124.418 Y134.853 I.044 J-.188 E.0062
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.418 Y132.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12 I1.108 J.503 P1  F42000
G1 X128.162 Y124.6 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.367714
G1 F9059
M204 S6000
G1 X128.162 Y124.438 E.0043
G1 X127.837 Y124.438 E.0086
G1 X127.838 Y131.562 E.18856
G1 X128.162 Y131.562 E.0086
G1 X128.162 Y124.66 E.18268
M204 S10000
G1 X128.513 Y124.6 F42000
; LINE_WIDTH: 0.41999
G1 F9059
M204 S6000
G1 X128.513 Y124.087 E.01577
G1 X127.487 Y124.087 E.03154
G1 X127.487 Y131.913 E.24048
G1 X128.513 Y131.913 E.03155
G1 X128.513 Y124.66 E.22286
M204 S10000
G1 X128.89 Y124.6 F42000
G1 F9059
M204 S6000
G1 X128.89 Y123.71 E.02736
G1 X127.109 Y123.71 E.05471
G1 X127.109 Y132.29 E.26365
G1 X128.89 Y132.29 E.05472
G1 X128.89 Y124.66 E.23445
M204 S10000
G1 X129.267 Y124.6 F42000
G1 F9059
M204 S6000
G1 X129.267 Y123.333 E.03894
G1 X126.732 Y123.333 E.07789
G1 X126.732 Y132.667 E.28682
G1 X129.268 Y132.667 E.07789
G1 X129.267 Y124.66 E.24603
M204 S10000
G1 X129.644 Y124.6 F42000
G1 F9059
M204 S6000
G1 X129.644 Y122.956 E.05053
G1 X126.355 Y122.956 E.10106
G1 X126.355 Y133.045 E.30999
G1 X129.645 Y133.044 E.10107
G1 X129.644 Y124.66 E.25762
M204 S10000
G1 X130.021 Y124.6 F42000
G1 F9059
M204 S6000
G1 X130.021 Y122.578 E.06212
G1 X125.978 Y122.579 E.12423
G1 X125.978 Y133.422 E.33317
G1 X130.022 Y133.421 E.12424
G1 X130.021 Y124.66 E.2692
M204 S10000
G1 X130.398 Y124.6 F42000
G1 F9059
M204 S6000
G1 X130.398 Y122.201 E.0737
G1 X125.601 Y122.202 E.1474
G1 X125.601 Y133.799 E.35634
G1 X130.399 Y133.798 E.14741
G1 X130.398 Y124.66 E.28079
; OBJECT_ID: 394
; WIPE_START
G1 F9547.299
G1 X130.399 Y126.66 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z12 I-.354 J-1.164 P1  F42000
G1 X105.609 Y134.191 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X105.609 Y121.81 E.41071
G1 X111.19 Y121.809 E.18514
G1 X111.191 Y134.19 E.41071
G1 X105.669 Y134.191 E.18317
M204 S10000
G1 X105.202 Y134.598 F42000
G1 F8843.478
M204 S6000
G1 X105.202 Y121.403 E.43772
G1 X111.597 Y121.402 E.21215
G1 X111.598 Y134.597 E.43771
G1 X105.262 Y134.598 E.21017
M204 S250
G1 X104.81 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9059
M204 S5000
G1 X104.815 Y121.158 E.41893
G3 X104.993 Y121.01 I.187 J.044 E.00763
G1 X111.836 Y121.015 E.21027
G3 X111.99 Y121.196 I-.041 J.19 E.00785
G1 X111.99 Y134.79 E.4177
G3 X111.807 Y134.99 I-.192 J.008 E.00925
G1 X104.958 Y134.985 E.21043
G3 X104.818 Y134.853 I.044 J-.188 E.0062
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.818 Y132.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12 I1.108 J.503 P1  F42000
G1 X108.562 Y124.6 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.367714
G1 F9059
M204 S6000
G1 X108.562 Y124.438 E.0043
G1 X108.237 Y124.438 E.0086
G1 X108.238 Y131.562 E.18856
G1 X108.562 Y131.562 E.0086
G1 X108.562 Y124.66 E.18268
M204 S10000
G1 X108.913 Y124.6 F42000
; LINE_WIDTH: 0.41999
G1 F9059
M204 S6000
G1 X108.913 Y124.087 E.01577
G1 X107.887 Y124.087 E.03154
G1 X107.887 Y131.913 E.24048
G1 X108.913 Y131.913 E.03155
G1 X108.913 Y124.66 E.22286
M204 S10000
G1 X109.29 Y124.6 F42000
G1 F9059
M204 S6000
G1 X109.29 Y123.71 E.02736
G1 X107.509 Y123.71 E.05471
G1 X107.509 Y132.29 E.26365
G1 X109.29 Y132.29 E.05472
G1 X109.29 Y124.66 E.23445
M204 S10000
G1 X109.667 Y124.6 F42000
G1 F9059
M204 S6000
G1 X109.667 Y123.333 E.03894
G1 X107.132 Y123.333 E.07789
G1 X107.132 Y132.667 E.28682
G1 X109.668 Y132.667 E.07789
G1 X109.667 Y124.66 E.24603
M204 S10000
G1 X110.044 Y124.6 F42000
G1 F9059
M204 S6000
G1 X110.044 Y122.956 E.05053
G1 X106.755 Y122.956 E.10106
G1 X106.755 Y133.045 E.30999
G1 X110.045 Y133.044 E.10107
G1 X110.044 Y124.66 E.25762
M204 S10000
G1 X110.421 Y124.6 F42000
G1 F9059
M204 S6000
G1 X110.421 Y122.578 E.06212
G1 X106.378 Y122.579 E.12423
G1 X106.378 Y133.422 E.33317
G1 X110.422 Y133.421 E.12424
G1 X110.421 Y124.66 E.2692
M204 S10000
G1 X110.798 Y124.6 F42000
G1 F9059
M204 S6000
G1 X110.798 Y122.201 E.0737
G1 X106.001 Y122.202 E.1474
G1 X106.001 Y133.799 E.35634
G1 X110.799 Y133.798 E.14741
G1 X110.798 Y124.66 E.28079
; CHANGE_LAYER
; Z_HEIGHT: 11.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X110.799 Y126.66 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 59/73
; update layer progress
M73 L59
M991 S0 P58 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z12 I-.263 J1.188 P1  F42000
G1 X144.809 Y134.191 Z12
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X144.809 Y121.81 E.41071
G1 X150.39 Y121.809 E.18514
G1 X150.391 Y134.19 E.41071
G1 X144.869 Y134.191 E.18317
M204 S10000
G1 X144.402 Y134.598 F42000
G1 F8843.478
M204 S6000
G1 X144.402 Y121.403 E.43772
G1 X150.798 Y121.402 E.21215
G1 X150.798 Y134.598 E.43772
G1 X144.462 Y134.598 E.21017
M204 S250
G1 X144.01 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8991
M204 S5000
G1 X144.011 Y121.184 E.41815
G3 X144.193 Y121.01 I.193 J.021 E.0084
G1 X151.037 Y121.015 E.21027
G3 X151.19 Y121.196 I-.041 J.19 E.00785
G1 X151.189 Y134.818 E.41857
G3 X151.007 Y134.99 I-.193 J-.022 E.00835
G1 X144.184 Y134.989 E.20965
G3 X144.018 Y134.852 I.021 J-.194 E.00697
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.017 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 59 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z12.2
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer59 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X149.999 Y124.6 F42000
G1 Z11.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F8991
M204 S6000
G1 X149.998 Y122.201 E.0737
G1 X145.201 Y122.202 E.1474
G1 X145.201 Y133.799 E.35634
G1 X149.999 Y133.798 E.14741
G1 X149.999 Y124.66 E.28079
M204 S10000
G1 X149.621 Y124.6 F42000
G1 F8991
M204 S6000
G1 X149.621 Y122.578 E.06212
G1 X145.578 Y122.579 E.12423
G1 X145.578 Y133.422 E.33317
G1 X149.622 Y133.421 E.12424
G1 X149.621 Y124.66 E.2692
M204 S10000
G1 X149.244 Y124.6 F42000
G1 F8991
M204 S6000
G1 X149.244 Y122.956 E.05053
G1 X145.955 Y122.956 E.10106
G1 X145.955 Y133.045 E.30999
G1 X149.245 Y133.044 E.10107
G1 X149.244 Y124.66 E.25762
M204 S10000
G1 X148.867 Y124.6 F42000
G1 F8991
M204 S6000
G1 X148.867 Y123.333 E.03895
G1 X146.332 Y123.333 E.07789
G1 X146.332 Y132.667 E.28682
G1 X148.868 Y132.667 E.07789
G1 X148.867 Y124.66 E.24603
M204 S10000
G1 X148.49 Y124.6 F42000
G1 F8991
M204 S6000
G1 X148.49 Y123.71 E.02736
G1 X146.709 Y123.71 E.05472
G1 X146.709 Y132.29 E.26365
G1 X148.49 Y132.29 E.05472
G1 X148.49 Y124.66 E.23445
M204 S10000
G1 X148.113 Y124.6 F42000
G1 F8991
M204 S6000
G1 X148.113 Y124.087 E.01577
G1 X147.087 Y124.087 E.03154
G1 X147.087 Y131.913 E.24048
G1 X148.113 Y131.913 E.03155
G1 X148.113 Y124.66 E.22286
M204 S10000
G1 X147.762 Y124.6 F42000
; LINE_WIDTH: 0.367734
G1 F8991
M204 S6000
G1 X147.762 Y124.438 E.0043
G1 X147.437 Y124.438 E.0086
G1 X147.438 Y131.562 E.18857
G1 X147.762 Y131.562 E.0086
G1 X147.762 Y124.66 E.18269
; OBJECT_ID: 405
; WIPE_START
G1 F11083.265
G1 X147.762 Y126.66 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X140.523 Y129.077 Z12.2 F42000
G1 X125.209 Y134.191 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X125.209 Y121.81 E.41071
G1 X130.79 Y121.809 E.18514
G1 X130.791 Y134.19 E.41071
G1 X125.269 Y134.191 E.18317
M204 S10000
G1 X124.802 Y134.598 F42000
G1 F8843.478
M204 S6000
G1 X124.802 Y121.403 E.43772
G1 X131.198 Y121.402 E.21215
G1 X131.198 Y134.598 E.43772
G1 X124.862 Y134.598 E.21017
M204 S250
G1 X124.41 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8991
M204 S5000
G1 X124.411 Y121.184 E.41815
G3 X124.593 Y121.01 I.193 J.021 E.0084
G1 X131.437 Y121.015 E.21027
G3 X131.59 Y121.196 I-.041 J.19 E.00785
G1 X131.589 Y134.818 E.41857
G3 X131.407 Y134.99 I-.193 J-.022 E.00835
G1 X124.584 Y134.989 E.20965
G3 X124.418 Y134.852 I.021 J-.194 E.00697
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.417 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.897 Y126.672 Z12.2 F42000
G1 X130.399 Y124.6 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F8991
M204 S6000
G1 X130.398 Y122.201 E.0737
M73 P85 R3
G1 X125.601 Y122.202 E.1474
G1 X125.601 Y133.799 E.35634
G1 X130.399 Y133.798 E.14741
G1 X130.399 Y124.66 E.28079
M204 S10000
G1 X130.021 Y124.6 F42000
G1 F8991
M204 S6000
G1 X130.021 Y122.578 E.06212
G1 X125.978 Y122.579 E.12423
G1 X125.978 Y133.422 E.33317
G1 X130.022 Y133.421 E.12424
G1 X130.021 Y124.66 E.2692
M204 S10000
G1 X129.644 Y124.6 F42000
G1 F8991
M204 S6000
G1 X129.644 Y122.956 E.05053
G1 X126.355 Y122.956 E.10106
G1 X126.355 Y133.045 E.30999
G1 X129.645 Y133.044 E.10107
G1 X129.644 Y124.66 E.25762
M204 S10000
G1 X129.267 Y124.6 F42000
G1 F8991
M204 S6000
G1 X129.267 Y123.333 E.03895
G1 X126.732 Y123.333 E.07789
G1 X126.732 Y132.667 E.28682
G1 X129.268 Y132.667 E.07789
G1 X129.267 Y124.66 E.24603
M204 S10000
G1 X128.89 Y124.6 F42000
G1 F8991
M204 S6000
G1 X128.89 Y123.71 E.02736
G1 X127.109 Y123.71 E.05472
G1 X127.109 Y132.29 E.26365
G1 X128.89 Y132.29 E.05472
G1 X128.89 Y124.66 E.23445
M204 S10000
G1 X128.513 Y124.6 F42000
G1 F8991
M204 S6000
G1 X128.513 Y124.087 E.01577
G1 X127.487 Y124.087 E.03154
G1 X127.487 Y131.913 E.24048
G1 X128.513 Y131.913 E.03155
G1 X128.513 Y124.66 E.22286
M204 S10000
G1 X128.162 Y124.6 F42000
; LINE_WIDTH: 0.367734
G1 F8991
M204 S6000
G1 X128.162 Y124.438 E.0043
G1 X127.837 Y124.438 E.0086
G1 X127.838 Y131.562 E.18857
G1 X128.162 Y131.562 E.0086
G1 X128.162 Y124.66 E.18269
; OBJECT_ID: 394
; WIPE_START
G1 F11083.265
G1 X128.162 Y126.66 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X120.923 Y129.077 Z12.2 F42000
G1 X105.609 Y134.191 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X105.609 Y121.81 E.41071
G1 X111.191 Y121.809 E.18514
G1 X111.191 Y134.19 E.41071
G1 X105.669 Y134.191 E.18317
M204 S10000
G1 X105.202 Y134.598 F42000
G1 F8843.478
M204 S6000
G1 X105.202 Y121.403 E.43772
G1 X111.598 Y121.402 E.21215
G1 X111.598 Y134.598 E.43772
G1 X105.262 Y134.598 E.21017
M204 S250
G1 X104.81 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8991
M204 S5000
G1 X104.811 Y121.184 E.41815
G3 X104.993 Y121.01 I.193 J.021 E.0084
G1 X111.837 Y121.015 E.21027
G3 X111.99 Y121.196 I-.041 J.19 E.00785
G1 X111.989 Y134.818 E.41857
G3 X111.807 Y134.99 I-.193 J-.022 E.00835
G1 X104.984 Y134.989 E.20965
G3 X104.819 Y134.852 I.021 J-.194 E.00697
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.817 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.297 Y126.672 Z12.2 F42000
G1 X110.799 Y124.6 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F8991
M204 S6000
G1 X110.798 Y122.201 E.0737
G1 X106.001 Y122.202 E.1474
G1 X106.001 Y133.799 E.35634
G1 X110.799 Y133.798 E.14741
G1 X110.799 Y124.66 E.28079
M204 S10000
G1 X110.421 Y124.6 F42000
G1 F8991
M204 S6000
G1 X110.421 Y122.578 E.06212
G1 X106.378 Y122.579 E.12423
G1 X106.378 Y133.422 E.33317
G1 X110.422 Y133.421 E.12424
G1 X110.421 Y124.66 E.2692
M204 S10000
G1 X110.044 Y124.6 F42000
G1 F8991
M204 S6000
G1 X110.044 Y122.956 E.05053
G1 X106.755 Y122.956 E.10106
G1 X106.755 Y133.045 E.30999
G1 X110.045 Y133.044 E.10107
G1 X110.044 Y124.66 E.25762
M204 S10000
G1 X109.667 Y124.6 F42000
G1 F8991
M204 S6000
G1 X109.667 Y123.333 E.03895
G1 X107.132 Y123.333 E.07789
G1 X107.132 Y132.667 E.28682
G1 X109.668 Y132.667 E.07789
G1 X109.667 Y124.66 E.24603
M204 S10000
G1 X109.29 Y124.6 F42000
G1 F8991
M204 S6000
G1 X109.29 Y123.71 E.02736
G1 X107.509 Y123.71 E.05472
G1 X107.509 Y132.29 E.26365
G1 X109.29 Y132.29 E.05472
G1 X109.29 Y124.66 E.23445
M204 S10000
G1 X108.913 Y124.6 F42000
G1 F8991
M204 S6000
G1 X108.913 Y124.087 E.01577
G1 X107.887 Y124.087 E.03154
G1 X107.887 Y131.913 E.24048
G1 X108.913 Y131.913 E.03155
G1 X108.913 Y124.66 E.22286
M204 S10000
G1 X108.562 Y124.6 F42000
; LINE_WIDTH: 0.367734
G1 F8991
M204 S6000
G1 X108.562 Y124.438 E.0043
G1 X108.237 Y124.438 E.0086
G1 X108.238 Y131.562 E.18857
G1 X108.562 Y131.562 E.0086
G1 X108.562 Y124.66 E.18269
; CHANGE_LAYER
; Z_HEIGHT: 12
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11083.265
G1 X108.562 Y126.66 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 60/73
; update layer progress
M73 L60
M991 S0 P59 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z12.2 I-.248 J1.192 P1  F42000
G1 X144.809 Y134.191 Z12.2
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X144.809 Y121.81 E.41071
G1 X150.39 Y121.809 E.18514
G1 X150.391 Y134.19 E.41071
G1 X144.869 Y134.191 E.18317
M204 S10000
G1 X144.402 Y134.598 F42000
G1 F8843.478
M204 S6000
G1 X144.402 Y121.403 E.43772
G1 X150.797 Y121.402 E.21215
G1 X150.798 Y134.597 E.43771
G1 X144.462 Y134.598 E.21017
M204 S250
G1 X144.01 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8998
M204 S5000
G1 X144.011 Y121.184 E.41815
G3 X144.193 Y121.01 I.196 J.023 E.00838
G1 X151.037 Y121.015 E.21027
G3 X151.19 Y121.196 I-.041 J.189 E.00784
G1 X151.19 Y134.789 E.41768
G3 X151.007 Y134.99 I-.191 J.009 E.00928
G1 X144.147 Y134.982 E.21076
G3 X144.018 Y134.852 I.056 J-.185 E.00587
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.017 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 60 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z12.4
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer60 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X147.762 Y124.6 F42000
G1 Z12
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.367714
G1 F8998
M204 S6000
G1 X147.762 Y124.438 E.0043
G1 X147.437 Y124.438 E.0086
G1 X147.438 Y131.562 E.18856
G1 X147.762 Y131.562 E.0086
G1 X147.762 Y124.66 E.18268
M204 S10000
G1 X148.113 Y124.6 F42000
; LINE_WIDTH: 0.41999
G1 F8998
M204 S6000
G1 X148.113 Y124.087 E.01577
G1 X147.087 Y124.087 E.03154
G1 X147.087 Y131.913 E.24048
G1 X148.113 Y131.913 E.03155
G1 X148.113 Y124.66 E.22286
M204 S10000
G1 X148.49 Y124.6 F42000
G1 F8998
M204 S6000
G1 X148.49 Y123.71 E.02736
G1 X146.709 Y123.71 E.05471
G1 X146.709 Y132.29 E.26365
G1 X148.49 Y132.29 E.05472
G1 X148.49 Y124.66 E.23445
M204 S10000
G1 X148.867 Y124.6 F42000
G1 F8998
M204 S6000
G1 X148.867 Y123.333 E.03894
G1 X146.332 Y123.333 E.07789
G1 X146.332 Y132.667 E.28682
G1 X148.868 Y132.667 E.07789
G1 X148.867 Y124.66 E.24603
M204 S10000
G1 X149.244 Y124.6 F42000
G1 F8998
M204 S6000
G1 X149.244 Y122.956 E.05053
G1 X145.955 Y122.956 E.10106
G1 X145.955 Y133.045 E.30999
G1 X149.245 Y133.044 E.10107
G1 X149.244 Y124.66 E.25762
M204 S10000
G1 X149.621 Y124.6 F42000
G1 F8998
M204 S6000
G1 X149.621 Y122.578 E.06212
G1 X145.578 Y122.579 E.12423
G1 X145.578 Y133.422 E.33317
G1 X149.622 Y133.421 E.12424
G1 X149.621 Y124.66 E.2692
M204 S10000
G1 X149.998 Y124.6 F42000
G1 F8998
M204 S6000
G1 X149.998 Y122.201 E.0737
G1 X145.201 Y122.202 E.1474
G1 X145.201 Y133.799 E.35634
G1 X149.999 Y133.798 E.14741
G1 X149.998 Y124.66 E.28079
; OBJECT_ID: 405
; WIPE_START
G1 F9547.299
G1 X149.999 Y126.66 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X142.696 Y128.879 Z12.4 F42000
G1 X125.209 Y134.191 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X125.209 Y121.81 E.41071
G1 X130.79 Y121.809 E.18514
G1 X130.791 Y134.19 E.41071
G1 X125.269 Y134.191 E.18317
M204 S10000
G1 X124.802 Y134.598 F42000
G1 F8843.478
M204 S6000
G1 X124.802 Y121.403 E.43772
G1 X131.197 Y121.402 E.21215
G1 X131.198 Y134.597 E.43771
G1 X124.862 Y134.598 E.21017
M204 S250
G1 X124.41 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8998
M204 S5000
G1 X124.411 Y121.184 E.41815
G3 X124.593 Y121.01 I.196 J.023 E.00838
G1 X131.437 Y121.015 E.21027
G3 X131.59 Y121.196 I-.041 J.189 E.00784
G1 X131.59 Y134.789 E.41768
G3 X131.407 Y134.99 I-.191 J.009 E.00928
G1 X124.547 Y134.982 E.21076
G3 X124.418 Y134.852 I.056 J-.185 E.00587
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.417 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.571 Y125.902 Z12.4 F42000
G1 X128.162 Y124.6 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.367714
G1 F8998
M204 S6000
G1 X128.162 Y124.438 E.0043
G1 X127.837 Y124.438 E.0086
G1 X127.838 Y131.562 E.18856
G1 X128.162 Y131.562 E.0086
G1 X128.162 Y124.66 E.18268
M204 S10000
G1 X128.513 Y124.6 F42000
; LINE_WIDTH: 0.41999
G1 F8998
M204 S6000
G1 X128.513 Y124.087 E.01577
G1 X127.487 Y124.087 E.03154
G1 X127.487 Y131.913 E.24048
G1 X128.513 Y131.913 E.03155
G1 X128.513 Y124.66 E.22286
M204 S10000
G1 X128.89 Y124.6 F42000
G1 F8998
M204 S6000
G1 X128.89 Y123.71 E.02736
G1 X127.109 Y123.71 E.05471
G1 X127.109 Y132.29 E.26365
G1 X128.89 Y132.29 E.05472
G1 X128.89 Y124.66 E.23445
M204 S10000
G1 X129.267 Y124.6 F42000
G1 F8998
M204 S6000
G1 X129.267 Y123.333 E.03894
G1 X126.732 Y123.333 E.07789
G1 X126.732 Y132.667 E.28682
M73 P86 R3
G1 X129.268 Y132.667 E.07789
G1 X129.267 Y124.66 E.24603
M204 S10000
G1 X129.644 Y124.6 F42000
G1 F8998
M204 S6000
G1 X129.644 Y122.956 E.05053
G1 X126.355 Y122.956 E.10106
G1 X126.355 Y133.045 E.30999
G1 X129.645 Y133.044 E.10107
G1 X129.644 Y124.66 E.25762
M204 S10000
G1 X130.021 Y124.6 F42000
G1 F8998
M204 S6000
G1 X130.021 Y122.578 E.06212
G1 X125.978 Y122.579 E.12423
G1 X125.978 Y133.422 E.33317
G1 X130.022 Y133.421 E.12424
G1 X130.021 Y124.66 E.2692
M204 S10000
G1 X130.398 Y124.6 F42000
G1 F8998
M204 S6000
G1 X130.398 Y122.201 E.0737
G1 X125.601 Y122.202 E.1474
G1 X125.601 Y133.799 E.35634
G1 X130.399 Y133.798 E.14741
G1 X130.398 Y124.66 E.28079
; OBJECT_ID: 394
; WIPE_START
G1 F9547.299
G1 X130.399 Y126.66 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X123.096 Y128.879 Z12.4 F42000
G1 X105.609 Y134.191 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X105.609 Y121.81 E.41071
G1 X111.19 Y121.809 E.18514
G1 X111.191 Y134.19 E.41071
G1 X105.669 Y134.191 E.18317
M204 S10000
G1 X105.202 Y134.598 F42000
G1 F8843.478
M204 S6000
G1 X105.202 Y121.403 E.43772
G1 X111.597 Y121.402 E.21215
G1 X111.598 Y134.597 E.43771
G1 X105.262 Y134.598 E.21017
M204 S250
G1 X104.81 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8998
M204 S5000
G1 X104.811 Y121.184 E.41815
G3 X104.993 Y121.01 I.196 J.023 E.00838
G1 X111.837 Y121.015 E.21027
G3 X111.99 Y121.196 I-.041 J.189 E.00784
G1 X111.99 Y134.789 E.41768
G3 X111.807 Y134.99 I-.191 J.009 E.00928
G1 X104.947 Y134.982 E.21076
G3 X104.818 Y134.852 I.056 J-.185 E.00587
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.817 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.971 Y125.902 Z12.4 F42000
G1 X108.562 Y124.6 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.367714
G1 F8998
M204 S6000
G1 X108.562 Y124.438 E.0043
G1 X108.237 Y124.438 E.0086
G1 X108.238 Y131.562 E.18856
G1 X108.562 Y131.562 E.0086
G1 X108.562 Y124.66 E.18268
M204 S10000
G1 X108.913 Y124.6 F42000
; LINE_WIDTH: 0.41999
G1 F8998
M204 S6000
G1 X108.913 Y124.087 E.01577
G1 X107.887 Y124.087 E.03154
G1 X107.887 Y131.913 E.24048
G1 X108.913 Y131.913 E.03155
G1 X108.913 Y124.66 E.22286
M204 S10000
G1 X109.29 Y124.6 F42000
G1 F8998
M204 S6000
G1 X109.29 Y123.71 E.02736
G1 X107.509 Y123.71 E.05471
G1 X107.509 Y132.29 E.26365
G1 X109.29 Y132.29 E.05472
G1 X109.29 Y124.66 E.23445
M204 S10000
G1 X109.667 Y124.6 F42000
M73 P86 R2
G1 F8998
M204 S6000
G1 X109.667 Y123.333 E.03894
G1 X107.132 Y123.333 E.07789
G1 X107.132 Y132.667 E.28682
G1 X109.668 Y132.667 E.07789
G1 X109.667 Y124.66 E.24603
M204 S10000
G1 X110.044 Y124.6 F42000
G1 F8998
M204 S6000
G1 X110.044 Y122.956 E.05053
G1 X106.755 Y122.956 E.10106
G1 X106.755 Y133.045 E.30999
G1 X110.045 Y133.044 E.10107
G1 X110.044 Y124.66 E.25762
M204 S10000
G1 X110.421 Y124.6 F42000
G1 F8998
M204 S6000
G1 X110.421 Y122.578 E.06212
G1 X106.378 Y122.579 E.12423
G1 X106.378 Y133.422 E.33317
G1 X110.422 Y133.421 E.12424
G1 X110.421 Y124.66 E.2692
M204 S10000
G1 X110.798 Y124.6 F42000
G1 F8998
M204 S6000
G1 X110.798 Y122.201 E.0737
G1 X106.001 Y122.202 E.1474
G1 X106.001 Y133.799 E.35634
G1 X110.799 Y133.798 E.14741
G1 X110.798 Y124.66 E.28079
; CHANGE_LAYER
; Z_HEIGHT: 12.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X110.799 Y126.66 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 61/73
; update layer progress
M73 L61
M991 S0 P60 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z12.4 I-.263 J1.188 P1  F42000
G1 X144.809 Y134.191 Z12.4
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6924
M204 S6000
G1 X144.809 Y121.81 E.41071
G1 X150.39 Y121.809 E.18514
G1 X150.391 Y134.19 E.41071
G1 X144.869 Y134.191 E.18317
M204 S10000
G1 X144.402 Y134.598 F42000
G1 F6924
M204 S6000
G1 X144.402 Y121.403 E.43772
G1 X150.797 Y121.402 E.21215
G1 X150.798 Y134.597 E.43771
G1 X144.462 Y134.598 E.21017
M204 S250
G1 X144.01 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6924
M204 S5000
G1 X144.011 Y121.184 E.41814
G3 X144.191 Y121.01 I.194 J.021 E.00834
G1 X151.037 Y121.015 E.21034
G3 X151.19 Y121.196 I-.041 J.189 E.00784
G1 X151.182 Y134.853 E.41963
G3 X151.009 Y134.99 I-.185 J-.056 E.00721
G1 X144.184 Y134.989 E.20973
G3 X144.018 Y134.851 I.021 J-.194 E.00701
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.017 Y132.851 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 61 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z12.6
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer61 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X146.073 Y131.83 F42000
G1 Z12.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6924
M204 S6000
G2 X146.314 Y132.427 I.419 J.178 E.0237
G1 X147.247 Y132.427 E.03092
G2 X148.583 Y132.661 I.936 J-1.408 E.04631
G1 X148.886 Y132.427 E.01271
G1 X149.127 Y132.14 E.01242
G3 X150.042 Y131.331 I1.622 J.913 E.0413
G1 X150.043 Y133.817 E.08245
G2 X149.212 Y133.842 I-.382 J1.09 E.0282
G1 X145.157 Y133.843 E.1345
G1 X145.157 Y131.196 E.08779
G3 X146.073 Y131.29 I.371 J.892 E.03184
G1 X146.073 Y129.519 E.05875
G2 X145.157 Y128.71 I-1.622 J.914 E.04131
G1 X145.157 Y125.955 E.0914
G3 X146.073 Y126.049 I.371 J.892 E.03184
G1 X146.073 Y124.278 E.05875
G2 X145.157 Y123.469 I-1.622 J.913 E.04131
G1 X145.157 Y122.158 E.04349
G1 X147.615 Y122.158 E.08152
G1 X148.255 Y122.26 E.02151
G2 X148.609 Y122.158 I.067 J-.431 E.01262
G1 X150.042 Y122.158 E.04753
G1 X150.042 Y123.334 E.03902
G2 X148.913 Y123.601 I-.374 J.943 E.04099
G1 X147.296 Y123.573 E.05365
M204 S10000
G1 X150.042 Y124.461 F42000
G1 F6924
M204 S6000
G1 X150.042 Y126.09 E.05401
G2 X149.127 Y126.899 I.706 J1.722 E.0413
G1 X149.127 Y128.67 E.05875
G3 X150.042 Y128.575 I.545 J.797 E.03183
G1 X150.042 Y130.204 E.05401
M204 S10000
G1 X147.6 Y130.9 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42656
G1 F6924
M204 S6000
G1 X147.6 Y125.16 E.17944
M204 S10000
G1 X147.98 Y131.28 F42000
; LINE_WIDTH: 0.41999
G1 F6924
M204 S6000
G1 X147.98 Y124.72 E.20159
G1 X147.22 Y124.72 E.02337
G1 X147.22 Y131.28 E.20159
G1 X147.92 Y131.28 E.02153
M204 S10000
G1 X148.357 Y131.657 F42000
G1 F6924
M204 S6000
G1 X148.357 Y124.343 E.22476
G1 X146.843 Y124.343 E.04655
G1 X146.843 Y131.657 E.22476
G1 X148.297 Y131.657 E.0447
M204 S10000
G1 X148.734 Y132.015 F42000
G1 F6924
M204 S6000
G1 X148.734 Y123.985 E.24674
G1 X148.715 Y123.965 E.00084
G1 X146.477 Y123.965 E.06877
G1 X146.465 Y132.023 E.24758
G1 X148.686 Y132.034 E.06822
; OBJECT_ID: 405
; WIPE_START
G1 F9547.299
G1 X146.686 Y132.024 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X139.092 Y132.79 Z12.6 F42000
G1 X125.209 Y134.191 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6924
M204 S6000
G1 X125.209 Y121.81 E.41071
G1 X130.79 Y121.809 E.18514
G1 X130.791 Y134.19 E.41071
G1 X125.269 Y134.191 E.18317
M204 S10000
G1 X124.802 Y134.598 F42000
G1 F6924
M204 S6000
G1 X124.802 Y121.403 E.43772
G1 X131.197 Y121.402 E.21215
G1 X131.198 Y134.597 E.43771
G1 X124.862 Y134.598 E.21017
M204 S250
G1 X124.41 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6924
M204 S5000
G1 X124.411 Y121.184 E.41814
G3 X124.591 Y121.01 I.194 J.021 E.00834
G1 X131.437 Y121.015 E.21034
G3 X131.59 Y121.196 I-.041 J.189 E.00784
G1 X131.582 Y134.853 E.41963
G3 X131.409 Y134.99 I-.185 J-.056 E.00721
G1 X124.584 Y134.989 E.20973
G3 X124.418 Y134.851 I.021 J-.194 E.00701
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.417 Y132.851 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.473 Y131.83 Z12.6 F42000
G1 Z12.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6924
M204 S6000
G2 X126.714 Y132.427 I.419 J.178 E.0237
G1 X127.647 Y132.427 E.03092
G2 X128.983 Y132.661 I.936 J-1.408 E.04631
G1 X129.286 Y132.427 E.01271
G1 X129.527 Y132.14 E.01242
G3 X130.442 Y131.331 I1.622 J.913 E.0413
G1 X130.443 Y133.817 E.08245
G2 X129.612 Y133.842 I-.382 J1.09 E.0282
G1 X125.557 Y133.843 E.1345
G1 X125.557 Y131.196 E.08779
G3 X126.473 Y131.29 I.371 J.892 E.03184
G1 X126.473 Y129.519 E.05875
G2 X125.557 Y128.71 I-1.622 J.914 E.04131
G1 X125.557 Y125.955 E.0914
G3 X126.473 Y126.049 I.371 J.892 E.03184
G1 X126.473 Y124.278 E.05875
G2 X125.557 Y123.469 I-1.622 J.913 E.04131
G1 X125.557 Y122.158 E.04349
G1 X128.015 Y122.158 E.08152
G1 X128.655 Y122.26 E.02151
G2 X129.009 Y122.158 I.067 J-.431 E.01262
G1 X130.442 Y122.158 E.04753
G1 X130.442 Y123.334 E.03902
G2 X129.313 Y123.601 I-.374 J.943 E.04099
G1 X127.696 Y123.573 E.05365
M204 S10000
G1 X130.442 Y124.461 F42000
G1 F6924
M204 S6000
G1 X130.442 Y126.09 E.05401
G2 X129.527 Y126.899 I.706 J1.722 E.0413
G1 X129.527 Y128.67 E.05875
G3 X130.442 Y128.575 I.545 J.797 E.03183
G1 X130.442 Y130.204 E.05401
M204 S10000
G1 X128 Y130.9 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42656
G1 F6924
M204 S6000
M73 P87 R2
G1 X128 Y125.16 E.17944
M204 S10000
G1 X128.38 Y131.28 F42000
; LINE_WIDTH: 0.41999
G1 F6924
M204 S6000
G1 X128.38 Y124.72 E.20159
G1 X127.62 Y124.72 E.02337
G1 X127.62 Y131.28 E.20159
G1 X128.32 Y131.28 E.02153
M204 S10000
G1 X128.757 Y131.657 F42000
G1 F6924
M204 S6000
G1 X128.757 Y124.343 E.22476
G1 X127.243 Y124.343 E.04655
G1 X127.243 Y131.657 E.22476
G1 X128.697 Y131.657 E.0447
M204 S10000
G1 X129.134 Y132.015 F42000
G1 F6924
M204 S6000
G1 X129.134 Y123.985 E.24674
G1 X129.115 Y123.965 E.00084
G1 X126.877 Y123.965 E.06877
G1 X126.865 Y132.023 E.24758
G1 X129.086 Y132.034 E.06822
; OBJECT_ID: 394
; WIPE_START
G1 F9547.299
G1 X127.086 Y132.024 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X119.492 Y132.79 Z12.6 F42000
G1 X105.609 Y134.191 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6924
M204 S6000
G1 X105.609 Y121.81 E.41071
G1 X111.19 Y121.809 E.18514
G1 X111.191 Y134.19 E.41071
G1 X105.669 Y134.191 E.18317
M204 S10000
G1 X105.202 Y134.598 F42000
G1 F6924
M204 S6000
G1 X105.202 Y121.403 E.43772
G1 X111.597 Y121.402 E.21215
G1 X111.598 Y134.597 E.43771
G1 X105.262 Y134.598 E.21017
M204 S250
G1 X104.81 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6924
M204 S5000
G1 X104.811 Y121.184 E.41814
G3 X104.991 Y121.01 I.194 J.021 E.00834
G1 X111.837 Y121.015 E.21034
G3 X111.99 Y121.196 I-.041 J.189 E.00784
G1 X111.982 Y134.853 E.41963
G3 X111.809 Y134.99 I-.185 J-.056 E.00721
G1 X104.984 Y134.989 E.20973
G3 X104.818 Y134.851 I.021 J-.194 E.00701
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.817 Y132.851 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.873 Y131.83 Z12.6 F42000
G1 Z12.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6924
M204 S6000
G2 X107.114 Y132.427 I.419 J.178 E.0237
G1 X108.047 Y132.427 E.03092
G2 X109.383 Y132.661 I.936 J-1.408 E.04631
G1 X109.686 Y132.427 E.01271
G1 X109.927 Y132.14 E.01242
G3 X110.842 Y131.331 I1.622 J.913 E.0413
G1 X110.843 Y133.817 E.08245
G2 X110.012 Y133.842 I-.382 J1.09 E.0282
G1 X105.957 Y133.843 E.1345
G1 X105.957 Y131.196 E.08779
G3 X106.873 Y131.29 I.371 J.892 E.03184
G1 X106.873 Y129.519 E.05875
G2 X105.957 Y128.71 I-1.622 J.914 E.04131
G1 X105.957 Y125.955 E.0914
G3 X106.873 Y126.049 I.371 J.892 E.03184
G1 X106.873 Y124.278 E.05875
G2 X105.957 Y123.469 I-1.622 J.913 E.04131
G1 X105.957 Y122.158 E.04349
G1 X108.415 Y122.158 E.08152
G1 X109.055 Y122.26 E.02151
G2 X109.409 Y122.158 I.067 J-.431 E.01262
G1 X110.842 Y122.158 E.04753
G1 X110.842 Y123.334 E.03902
G2 X109.713 Y123.601 I-.374 J.943 E.04099
G1 X108.096 Y123.573 E.05365
M204 S10000
G1 X110.842 Y124.461 F42000
G1 F6924
M204 S6000
G1 X110.842 Y126.09 E.05401
G2 X109.927 Y126.899 I.706 J1.722 E.0413
G1 X109.927 Y128.67 E.05875
G3 X110.842 Y128.575 I.545 J.797 E.03183
G1 X110.842 Y130.204 E.05401
M204 S10000
G1 X108.4 Y130.9 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42656
G1 F6924
M204 S6000
G1 X108.4 Y125.16 E.17944
M204 S10000
G1 X108.78 Y131.28 F42000
; LINE_WIDTH: 0.41999
G1 F6924
M204 S6000
G1 X108.78 Y124.72 E.20159
G1 X108.02 Y124.72 E.02337
G1 X108.02 Y131.28 E.20159
G1 X108.72 Y131.28 E.02153
M204 S10000
G1 X109.157 Y131.657 F42000
G1 F6924
M204 S6000
G1 X109.157 Y124.343 E.22476
G1 X107.643 Y124.343 E.04655
G1 X107.643 Y131.657 E.22476
G1 X109.097 Y131.657 E.0447
M204 S10000
G1 X109.535 Y132.015 F42000
G1 F6924
M204 S6000
G1 X109.535 Y123.985 E.24674
G1 X109.515 Y123.965 E.00084
G1 X107.277 Y123.965 E.06877
G1 X107.266 Y132.023 E.24758
G1 X109.486 Y132.034 E.06822
; CHANGE_LAYER
; Z_HEIGHT: 12.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X107.486 Y132.024 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 62/73
; update layer progress
M73 L62
M991 S0 P61 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z12.6 I-.071 J1.215 P1  F42000
G1 X144.809 Y134.191 Z12.6
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5111
M204 S6000
G1 X144.809 Y121.81 E.41071
G1 X150.39 Y121.809 E.18514
G1 X150.391 Y134.19 E.41071
G1 X144.869 Y134.191 E.18317
M204 S10000
G1 X144.402 Y134.598 F42000
G1 F5111
M204 S6000
G1 X144.402 Y121.403 E.43772
G1 X150.797 Y121.402 E.21215
G1 X150.798 Y134.597 E.43771
G1 X144.462 Y134.598 E.21017
M204 S250
G1 X144.01 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5111
M204 S5000
G1 X144.011 Y121.184 E.41815
G3 X144.193 Y121.01 I.193 J.021 E.00841
G1 X151.037 Y121.015 E.21028
G3 X151.19 Y121.196 I-.038 J.187 E.00786
G1 X151.19 Y134.789 E.41769
G3 X151.007 Y134.99 I-.192 J.008 E.00926
G1 X144.184 Y134.989 E.20964
G3 X144.019 Y134.852 I.023 J-.196 E.00698
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.018 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 62 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z12.8
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer62 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X147.042 Y133.842 F42000
G1 Z12.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5111
M204 S6000
G1 X148.67 Y133.842 E.05401
G3 X149.238 Y133.471 I1.013 J.929 E.02273
G3 X150.043 Y133.708 I-.148 J1.989 E.02803
G1 X150.042 Y131.302 E.07978
G1 X149.566 Y131.695 E.02049
G1 X148.91 Y132.848 E.04399
G3 X148.255 Y132.96 I-.406 J-.402 E.02353
G3 X146.945 Y132.167 I.543 J-2.377 E.05167
G1 X146.29 Y131.014 E.04399
G2 X145.635 Y130.902 I-.406 J.402 E.02353
G1 X145.157 Y131.087 E.01697
G1 X145.157 Y128.682 E.07979
G1 X145.635 Y129.074 E.0205
G1 X146.29 Y130.227 E.04399
G2 X146.945 Y130.339 I.406 J-.402 E.02353
G2 X148.255 Y129.547 I-.543 J-2.377 E.05167
G1 X148.91 Y128.393 E.04399
G3 X149.566 Y128.282 I.406 J.402 E.02353
G1 X150.042 Y128.466 E.01696
G1 X150.042 Y126.061 E.07977
G1 X149.566 Y126.454 E.02048
G1 X148.91 Y127.607 E.04399
G3 X148.255 Y127.719 I-.406 J-.402 E.02353
G3 X146.945 Y126.926 I.543 J-2.377 E.05167
G1 X146.29 Y125.773 E.04399
G2 X145.635 Y125.661 I-.406 J.402 E.02353
G1 X145.157 Y125.846 E.01697
G1 X145.157 Y123.44 E.07979
G1 X145.635 Y123.833 E.0205
G1 X146.29 Y124.986 E.04399
G2 X146.945 Y125.098 I.406 J-.402 E.02353
G2 X148.255 Y124.305 I-.543 J-2.377 E.05167
G1 X148.91 Y123.152 E.04399
G3 X149.566 Y123.04 I.406 J.402 E.02353
G1 X150.042 Y123.225 E.01695
G1 X150.042 Y122.158 E.0354
G1 X149.028 Y122.158 E.03363
G3 X148.255 Y122.477 I-.562 J-.265 E.03045
G1 X147.52 Y122.158 E.0266
G1 X145.891 Y122.158 E.05401
; OBJECT_ID: 405
; WIPE_START
G1 F8843.478
G1 X147.52 Y122.158 E-.61876
G1 X147.861 Y122.306 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X141.102 Y125.852 Z12.8 F42000
G1 X125.209 Y134.191 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5111
M204 S6000
G1 X125.209 Y121.81 E.41071
G1 X130.79 Y121.809 E.18514
G1 X130.791 Y134.19 E.41071
G1 X125.269 Y134.191 E.18317
M204 S10000
G1 X124.802 Y134.598 F42000
G1 F5111
M204 S6000
G1 X124.802 Y121.403 E.43772
G1 X131.197 Y121.402 E.21215
G1 X131.198 Y134.597 E.43771
G1 X124.862 Y134.598 E.21017
M204 S250
G1 X124.41 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5111
M204 S5000
G1 X124.411 Y121.184 E.41815
G3 X124.593 Y121.01 I.193 J.021 E.00841
G1 X131.437 Y121.015 E.21028
G3 X131.59 Y121.196 I-.038 J.187 E.00786
G1 X131.59 Y134.789 E.41769
G3 X131.407 Y134.99 I-.192 J.008 E.00926
G1 X124.584 Y134.989 E.20964
G3 X124.419 Y134.852 I.023 J-.196 E.00698
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.418 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.442 Y133.842 Z12.8 F42000
G1 Z12.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5111
M204 S6000
G1 X129.07 Y133.842 E.05401
G3 X129.638 Y133.471 I1.013 J.929 E.02273
G3 X130.443 Y133.708 I-.148 J1.989 E.02803
G1 X130.442 Y131.302 E.07978
G1 X129.966 Y131.695 E.02049
G1 X129.31 Y132.848 E.04399
G3 X128.655 Y132.96 I-.406 J-.402 E.02353
G3 X127.345 Y132.167 I.543 J-2.377 E.05167
G1 X126.69 Y131.014 E.04399
G2 X126.035 Y130.902 I-.406 J.402 E.02353
G1 X125.557 Y131.087 E.01697
G1 X125.557 Y128.682 E.07979
G1 X126.035 Y129.074 E.0205
G1 X126.69 Y130.227 E.04399
G2 X127.345 Y130.339 I.406 J-.402 E.02353
G2 X128.655 Y129.547 I-.543 J-2.377 E.05167
G1 X129.31 Y128.393 E.04399
G3 X129.966 Y128.282 I.406 J.402 E.02353
G1 X130.442 Y128.466 E.01696
G1 X130.442 Y126.061 E.07977
G1 X129.966 Y126.454 E.02048
G1 X129.31 Y127.607 E.04399
G3 X128.655 Y127.719 I-.406 J-.402 E.02353
G3 X127.345 Y126.926 I.543 J-2.377 E.05167
G1 X126.69 Y125.773 E.04399
G2 X126.035 Y125.661 I-.406 J.402 E.02353
G1 X125.557 Y125.846 E.01697
G1 X125.557 Y123.44 E.07979
G1 X126.035 Y123.833 E.0205
G1 X126.69 Y124.986 E.04399
G2 X127.345 Y125.098 I.406 J-.402 E.02353
G2 X128.655 Y124.305 I-.543 J-2.377 E.05167
G1 X129.31 Y123.152 E.04399
G3 X129.966 Y123.04 I.406 J.402 E.02353
G1 X130.442 Y123.225 E.01695
G1 X130.442 Y122.158 E.0354
G1 X129.428 Y122.158 E.03363
G3 X128.655 Y122.477 I-.562 J-.265 E.03045
G1 X127.92 Y122.158 E.0266
G1 X126.291 Y122.158 E.05401
; OBJECT_ID: 394
; WIPE_START
G1 F8843.478
G1 X127.92 Y122.158 E-.61876
G1 X128.261 Y122.306 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X121.502 Y125.852 Z12.8 F42000
G1 X105.609 Y134.191 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5111
M204 S6000
G1 X105.609 Y121.81 E.41071
G1 X111.19 Y121.809 E.18514
G1 X111.191 Y134.19 E.41071
G1 X105.669 Y134.191 E.18317
M204 S10000
G1 X105.202 Y134.598 F42000
G1 F5111
M204 S6000
G1 X105.202 Y121.403 E.43772
G1 X111.597 Y121.402 E.21215
G1 X111.598 Y134.597 E.43771
G1 X105.262 Y134.598 E.21017
M204 S250
G1 X104.81 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5111
M204 S5000
G1 X104.811 Y121.184 E.41815
G3 X104.993 Y121.01 I.193 J.021 E.00841
M73 P88 R2
G1 X111.837 Y121.015 E.21028
G3 X111.99 Y121.196 I-.038 J.187 E.00786
G1 X111.99 Y134.789 E.41769
G3 X111.807 Y134.99 I-.192 J.008 E.00926
G1 X104.984 Y134.989 E.20964
G3 X104.819 Y134.852 I.023 J-.196 E.00698
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.818 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.842 Y133.842 Z12.8 F42000
G1 Z12.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5111
M204 S6000
G1 X109.47 Y133.842 E.05401
G3 X110.038 Y133.471 I1.013 J.929 E.02273
G3 X110.843 Y133.708 I-.148 J1.989 E.02803
G1 X110.842 Y131.302 E.07978
G1 X110.366 Y131.695 E.02049
G1 X109.71 Y132.848 E.04399
G3 X109.055 Y132.96 I-.406 J-.402 E.02353
G3 X107.745 Y132.167 I.543 J-2.377 E.05167
G1 X107.09 Y131.014 E.04399
G2 X106.435 Y130.902 I-.406 J.402 E.02353
G1 X105.957 Y131.087 E.01697
G1 X105.957 Y128.682 E.07979
G1 X106.435 Y129.074 E.0205
G1 X107.09 Y130.227 E.04399
G2 X107.745 Y130.339 I.406 J-.402 E.02353
G2 X109.055 Y129.547 I-.543 J-2.377 E.05167
G1 X109.71 Y128.393 E.04399
G3 X110.366 Y128.282 I.406 J.402 E.02353
G1 X110.842 Y128.466 E.01696
G1 X110.842 Y126.061 E.07977
G1 X110.366 Y126.454 E.02048
G1 X109.71 Y127.607 E.04399
G3 X109.055 Y127.719 I-.406 J-.402 E.02353
G3 X107.745 Y126.926 I.543 J-2.377 E.05167
G1 X107.09 Y125.773 E.04399
G2 X106.435 Y125.661 I-.406 J.402 E.02353
G1 X105.957 Y125.846 E.01697
G1 X105.957 Y123.44 E.07979
G1 X106.435 Y123.833 E.0205
G1 X107.09 Y124.986 E.04399
G2 X107.745 Y125.098 I.406 J-.402 E.02353
G2 X109.055 Y124.305 I-.543 J-2.377 E.05167
G1 X109.71 Y123.152 E.04399
G3 X110.366 Y123.04 I.406 J.402 E.02353
G1 X110.842 Y123.225 E.01695
G1 X110.842 Y122.158 E.0354
G1 X109.828 Y122.158 E.03363
G3 X109.055 Y122.477 I-.562 J-.265 E.03045
G1 X108.32 Y122.158 E.0266
G1 X106.691 Y122.158 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F8843.478
G1 X108.32 Y122.158 E-.61876
G1 X108.661 Y122.306 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 63/73
; update layer progress
M73 L63
M991 S0 P62 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z12.8 I-.38 J1.156 P1  F42000
G1 X144.809 Y134.191 Z12.8
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5071
M204 S6000
G1 X144.809 Y121.81 E.41071
G1 X150.39 Y121.809 E.18514
G1 X150.391 Y134.19 E.41071
G1 X144.869 Y134.191 E.18317
M204 S10000
G1 X144.402 Y134.598 F42000
G1 F5071
M204 S6000
G1 X144.402 Y121.403 E.43772
G1 X150.798 Y121.402 E.21215
G1 X150.798 Y134.598 E.43772
G1 X144.462 Y134.598 E.21017
M204 S250
G1 X144.01 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5071
M204 S5000
G1 X144.01 Y121.211 E.41732
G3 X144.191 Y121.01 I.191 J-.009 E.00921
G1 X151.037 Y121.015 E.21034
G3 X151.19 Y121.195 I-.041 J.19 E.00781
G1 X151.19 Y134.79 E.41773
G3 X151.008 Y134.99 I-.191 J.009 E.00924
G1 X144.184 Y134.989 E.20968
G3 X144.018 Y134.851 I.021 J-.194 E.007
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.017 Y132.851 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 63 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z13
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer63 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X145.157 Y132.577 F42000
G1 Z12.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5071
M204 S6000
G1 X145.157 Y130.949 E.05401
G2 X145.887 Y129.966 I-.413 J-1.069 E.04286
G2 X145.157 Y128.585 I-2.591 J.486 E.0526
G1 X145.157 Y125.708 E.09543
G2 X145.887 Y124.724 I-.413 J-1.069 E.04286
G2 X145.157 Y123.343 I-2.591 J.486 E.0526
G1 X145.157 Y122.158 E.03933
G1 X145.6 Y122.158 E.01469
M204 S10000
G1 X149.522 Y122.158 F42000
G1 F5071
M204 S6000
G1 X150.042 Y122.157 E.01727
G1 X150.042 Y123.087 E.03083
G3 X149.318 Y122.158 I.413 J-1.069 E.04104
G1 X147.399 Y122.158 E.06366
G1 X148.234 Y122.759 E.03413
G1 X148.476 Y123.086 E.01351
G3 X147.876 Y124.724 I-2.115 J.154 E.05963
G1 X146.966 Y125.379 E.0372
G1 X146.724 Y125.707 E.01351
G2 X147.324 Y127.345 I2.115 J.154 E.05963
G1 X148.234 Y128 E.0372
G1 X148.476 Y128.328 E.01351
G3 X147.876 Y129.966 I-2.115 J.154 E.05963
G1 X146.966 Y130.621 E.0372
G1 X146.724 Y130.948 E.01351
G2 X147.324 Y132.586 I2.115 J.154 E.05963
G1 X148.234 Y133.241 E.0372
G3 X148.503 Y133.842 I-.366 J.524 E.02293
G1 X150.043 Y133.842 E.05108
G1 X150.043 Y133.57 E.00904
G3 X149.344 Y132.914 I.674 J-1.416 E.03229
G3 X149.945 Y131.276 I2.115 J-.154 E.05963
G1 X150.042 Y131.191 E.00429
G1 X150.042 Y128.328 E.09497
G3 X149.344 Y127.673 I.674 J-1.416 E.03228
G3 X149.945 Y126.035 I2.115 J-.154 E.05963
G1 X150.042 Y125.95 E.00429
G1 X150.042 Y124.322 E.05401
; OBJECT_ID: 405
; WIPE_START
G1 F8843.478
G1 X150.042 Y125.95 E-.61876
G1 X149.945 Y126.035 E-.04911
G1 X149.805 Y126.233 E-.09214
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X142.544 Y128.583 Z13 F42000
G1 X125.209 Y134.191 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5071
M204 S6000
G1 X125.209 Y121.81 E.41071
G1 X130.79 Y121.809 E.18514
G1 X130.791 Y134.19 E.41071
G1 X125.269 Y134.191 E.18317
M204 S10000
G1 X124.802 Y134.598 F42000
G1 F5071
M204 S6000
G1 X124.802 Y121.403 E.43772
G1 X131.198 Y121.402 E.21215
G1 X131.198 Y134.598 E.43772
G1 X124.862 Y134.598 E.21017
M204 S250
G1 X124.41 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5071
M204 S5000
G1 X124.41 Y121.211 E.41732
G3 X124.591 Y121.01 I.191 J-.009 E.00921
G1 X131.437 Y121.015 E.21034
G3 X131.59 Y121.195 I-.041 J.19 E.00781
G1 X131.59 Y134.79 E.41773
G3 X131.408 Y134.99 I-.191 J.009 E.00924
G1 X124.584 Y134.989 E.20968
G3 X124.418 Y134.851 I.021 J-.194 E.007
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.417 Y132.851 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.557 Y132.577 Z13 F42000
G1 Z12.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5071
M204 S6000
G1 X125.557 Y130.949 E.05401
G2 X126.287 Y129.966 I-.413 J-1.069 E.04286
G2 X125.557 Y128.585 I-2.591 J.486 E.0526
G1 X125.557 Y125.708 E.09543
G2 X126.287 Y124.724 I-.413 J-1.069 E.04286
G2 X125.557 Y123.343 I-2.591 J.486 E.0526
G1 X125.557 Y122.158 E.03933
G1 X126 Y122.158 E.01469
M204 S10000
G1 X129.922 Y122.158 F42000
G1 F5071
M204 S6000
G1 X130.442 Y122.157 E.01727
G1 X130.442 Y123.087 E.03083
G3 X129.718 Y122.158 I.413 J-1.069 E.04104
G1 X127.799 Y122.158 E.06366
G1 X128.634 Y122.759 E.03413
G1 X128.876 Y123.086 E.01351
G3 X128.276 Y124.724 I-2.115 J.154 E.05963
G1 X127.366 Y125.379 E.0372
G1 X127.124 Y125.707 E.01351
G2 X127.724 Y127.345 I2.115 J.154 E.05963
G1 X128.634 Y128 E.0372
G1 X128.876 Y128.328 E.01351
G3 X128.276 Y129.966 I-2.115 J.154 E.05963
G1 X127.366 Y130.621 E.0372
G1 X127.124 Y130.948 E.01351
G2 X127.724 Y132.586 I2.116 J.154 E.05963
G1 X128.634 Y133.241 E.0372
G3 X128.903 Y133.842 I-.366 J.524 E.02293
G1 X130.443 Y133.842 E.05108
G1 X130.443 Y133.57 E.00904
G3 X129.744 Y132.914 I.674 J-1.416 E.03229
G3 X130.345 Y131.276 I2.115 J-.154 E.05963
G1 X130.442 Y131.191 E.00429
G1 X130.442 Y128.328 E.09497
G3 X129.744 Y127.673 I.674 J-1.416 E.03228
G3 X130.345 Y126.035 I2.115 J-.154 E.05963
G1 X130.442 Y125.95 E.00429
G1 X130.442 Y124.322 E.05401
; OBJECT_ID: 394
; WIPE_START
G1 F8843.478
G1 X130.442 Y125.95 E-.61876
G1 X130.345 Y126.035 E-.04911
G1 X130.205 Y126.233 E-.09214
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X122.944 Y128.583 Z13 F42000
G1 X105.609 Y134.191 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5071
M204 S6000
G1 X105.609 Y121.81 E.41071
G1 X111.19 Y121.809 E.18514
G1 X111.191 Y134.19 E.41071
G1 X105.669 Y134.191 E.18317
M204 S10000
G1 X105.202 Y134.598 F42000
G1 F5071
M204 S6000
G1 X105.202 Y121.403 E.43772
G1 X111.598 Y121.402 E.21215
G1 X111.598 Y134.598 E.43772
G1 X105.262 Y134.598 E.21017
M204 S250
G1 X104.81 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5071
M204 S5000
G1 X104.81 Y121.211 E.41732
G3 X104.991 Y121.01 I.191 J-.009 E.00921
G1 X111.837 Y121.015 E.21034
G3 X111.99 Y121.195 I-.041 J.19 E.00781
G1 X111.99 Y134.79 E.41773
G3 X111.808 Y134.99 I-.191 J.009 E.00924
G1 X104.984 Y134.989 E.20968
G3 X104.818 Y134.851 I.021 J-.194 E.007
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.817 Y132.851 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.957 Y132.577 Z13 F42000
G1 Z12.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5071
M204 S6000
G1 X105.957 Y130.949 E.05401
G2 X106.687 Y129.966 I-.413 J-1.069 E.04286
G2 X105.957 Y128.585 I-2.591 J.486 E.0526
G1 X105.957 Y125.708 E.09543
G2 X106.687 Y124.724 I-.413 J-1.069 E.04286
G2 X105.957 Y123.343 I-2.591 J.486 E.0526
G1 X105.957 Y122.158 E.03933
G1 X106.4 Y122.158 E.01469
M204 S10000
G1 X110.322 Y122.158 F42000
G1 F5071
M204 S6000
G1 X110.842 Y122.157 E.01727
G1 X110.842 Y123.087 E.03083
G3 X110.118 Y122.158 I.413 J-1.069 E.04104
G1 X108.199 Y122.158 E.06366
G1 X109.034 Y122.759 E.03413
G1 X109.276 Y123.086 E.01351
G3 X108.676 Y124.724 I-2.115 J.154 E.05963
G1 X107.766 Y125.379 E.0372
G1 X107.524 Y125.707 E.01351
G2 X108.124 Y127.345 I2.115 J.154 E.05963
G1 X109.034 Y128 E.0372
G1 X109.276 Y128.328 E.01351
G3 X108.676 Y129.966 I-2.115 J.154 E.05963
G1 X107.766 Y130.621 E.0372
G1 X107.524 Y130.948 E.01351
G2 X108.124 Y132.586 I2.115 J.154 E.05963
G1 X109.034 Y133.241 E.0372
G3 X109.303 Y133.842 I-.366 J.524 E.02293
G1 X110.843 Y133.842 E.05108
G1 X110.843 Y133.57 E.00904
G3 X110.144 Y132.914 I.674 J-1.416 E.03229
G3 X110.745 Y131.276 I2.115 J-.154 E.05963
G1 X110.842 Y131.191 E.00429
G1 X110.842 Y128.328 E.09497
G3 X110.144 Y127.673 I.674 J-1.416 E.03228
G3 X110.745 Y126.035 I2.115 J-.154 E.05963
G1 X110.842 Y125.95 E.00429
G1 X110.842 Y124.322 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X110.842 Y125.95 E-.61876
G1 X110.745 Y126.035 E-.04911
G1 X110.605 Y126.233 E-.09214
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 64/73
; update layer progress
M73 L64
M991 S0 P63 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
M73 P89 R2
G3 Z13 I-.276 J1.185 P1  F42000
G1 X144.809 Y134.191 Z13
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5020
M204 S6000
G1 X144.809 Y121.81 E.41071
G1 X150.39 Y121.809 E.18514
G1 X150.391 Y134.19 E.41071
G1 X144.869 Y134.191 E.18317
M204 S10000
G1 X144.402 Y134.598 F42000
G1 F5020
M204 S6000
G1 X144.402 Y121.403 E.43772
G1 X150.797 Y121.402 E.21215
G1 X150.798 Y134.597 E.43771
G1 X144.462 Y134.598 E.21017
M204 S250
G1 X144.01 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5020
M204 S5000
G1 X144.018 Y121.146 E.4193
G3 X144.193 Y121.01 I.184 J.057 E.00725
G1 X151.037 Y121.015 E.21028
G3 X151.19 Y121.196 I-.041 J.189 E.00784
G1 X151.19 Y134.789 E.41769
G3 X151.007 Y134.99 I-.192 J.008 E.00925
G1 X144.211 Y134.99 E.20883
G3 X144.018 Y134.852 I-.008 J-.193 E.00783
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.018 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 64 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z13.2
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer64 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X145.157 Y132.39 F42000
G1 Z12.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5020
M204 S6000
G1 X145.157 Y130.762 E.05401
G2 X145.7 Y129.966 I-1.173 J-1.382 E.03235
G2 X145.157 Y128.481 I-2.022 J-.102 E.05385
G1 X145.157 Y125.521 E.09822
G2 X145.7 Y124.724 I-1.172 J-1.382 E.03235
G2 X145.157 Y123.24 I-2.022 J-.102 E.05385
G1 X145.157 Y122.158 E.0359
G1 X145.703 Y122.158 E.01811
M204 S10000
G1 X150.042 Y124.233 F42000
G1 F5020
M204 S6000
G1 X150.042 Y125.861 E.05401
G1 X149.861 Y126.035 E.00833
G2 X149.62 Y127.673 I1.42 J1.045 E.05716
G2 X150.042 Y128.141 I2.337 J-1.683 E.02096
G1 X150.042 Y131.102 E.09824
G1 X149.861 Y131.276 E.00834
G2 X149.62 Y132.914 I1.42 J1.045 E.05716
G2 X150.043 Y133.382 I2.337 J-1.683 E.02097
G1 X150.043 Y133.842 E.01526
G1 X148.301 Y133.842 E.05778
G2 X147.926 Y133.241 I-1.019 J.218 E.02398
G1 X147.24 Y132.586 E.03145
G3 X147 Y130.948 I1.42 J-1.045 E.05716
G3 X147.96 Y129.966 I4.942 J3.87 E.04567
G2 X148.201 Y128.328 I-1.42 J-1.045 E.05716
G2 X147.24 Y127.345 I-4.941 J3.868 E.04567
G3 X147 Y125.707 I1.42 J-1.045 E.05716
G3 X147.96 Y124.724 I4.942 J3.869 E.04567
G2 X148.201 Y123.086 I-1.42 J-1.045 E.05716
G2 X147.297 Y122.158 I-4.668 J3.639 E.04308
G1 X149.52 Y122.158 E.07375
G2 X150.042 Y122.899 I1.691 J-.636 E.03042
G1 X150.042 Y124.233 E.04423
; OBJECT_ID: 405
; WIPE_START
G1 F8843.478
G1 X150.042 Y122.899 E-.50673
G1 X149.62 Y122.431 E-.23951
G1 X149.608 Y122.397 E-.01377
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X142.736 Y125.719 Z13.2 F42000
G1 X125.209 Y134.191 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5020
M204 S6000
G1 X125.209 Y121.81 E.41071
G1 X130.79 Y121.809 E.18514
G1 X130.791 Y134.19 E.41071
G1 X125.269 Y134.191 E.18317
M204 S10000
G1 X124.802 Y134.598 F42000
G1 F5020
M204 S6000
G1 X124.802 Y121.403 E.43772
G1 X131.197 Y121.402 E.21215
G1 X131.198 Y134.597 E.43771
G1 X124.862 Y134.598 E.21017
M204 S250
G1 X124.41 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5020
M204 S5000
G1 X124.418 Y121.146 E.4193
G3 X124.593 Y121.01 I.184 J.057 E.00725
G1 X131.437 Y121.015 E.21028
G3 X131.59 Y121.196 I-.041 J.189 E.00784
G1 X131.59 Y134.789 E.41769
G3 X131.407 Y134.99 I-.192 J.008 E.00925
G1 X124.611 Y134.99 E.20883
G3 X124.418 Y134.852 I-.008 J-.193 E.00783
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.418 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.557 Y132.39 Z13.2 F42000
G1 Z12.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5020
M204 S6000
G1 X125.557 Y130.762 E.05401
G2 X126.1 Y129.966 I-1.173 J-1.382 E.03235
G2 X125.557 Y128.481 I-2.022 J-.102 E.05385
G1 X125.557 Y125.521 E.09822
G2 X126.1 Y124.724 I-1.172 J-1.382 E.03235
G2 X125.557 Y123.24 I-2.022 J-.102 E.05385
G1 X125.557 Y122.158 E.0359
G1 X126.103 Y122.158 E.01811
M204 S10000
G1 X130.442 Y124.233 F42000
G1 F5020
M204 S6000
G1 X130.442 Y125.861 E.05401
G1 X130.261 Y126.035 E.00833
G2 X130.02 Y127.673 I1.42 J1.045 E.05716
G2 X130.442 Y128.141 I2.337 J-1.683 E.02096
G1 X130.442 Y131.102 E.09824
G1 X130.261 Y131.276 E.00834
G2 X130.02 Y132.914 I1.42 J1.045 E.05716
G2 X130.443 Y133.382 I2.337 J-1.683 E.02097
G1 X130.443 Y133.842 E.01526
G1 X128.701 Y133.842 E.05778
G2 X128.326 Y133.241 I-1.019 J.218 E.02398
G1 X127.64 Y132.586 E.03145
G3 X127.4 Y130.948 I1.42 J-1.045 E.05716
G3 X128.36 Y129.966 I4.942 J3.87 E.04567
G2 X128.601 Y128.328 I-1.42 J-1.045 E.05716
G2 X127.64 Y127.345 I-4.941 J3.868 E.04567
G3 X127.4 Y125.707 I1.42 J-1.045 E.05716
G3 X128.36 Y124.724 I4.942 J3.869 E.04567
G2 X128.601 Y123.086 I-1.42 J-1.045 E.05716
G2 X127.697 Y122.158 I-4.668 J3.639 E.04308
G1 X129.92 Y122.158 E.07375
G2 X130.442 Y122.899 I1.691 J-.636 E.03042
G1 X130.442 Y124.233 E.04423
; OBJECT_ID: 394
; WIPE_START
G1 F8843.478
G1 X130.442 Y122.899 E-.50673
G1 X130.02 Y122.431 E-.23951
G1 X130.008 Y122.397 E-.01377
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X123.136 Y125.719 Z13.2 F42000
G1 X105.609 Y134.191 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5020
M204 S6000
G1 X105.609 Y121.81 E.41071
G1 X111.19 Y121.809 E.18514
G1 X111.191 Y134.19 E.41071
G1 X105.669 Y134.191 E.18317
M204 S10000
G1 X105.202 Y134.598 F42000
G1 F5020
M204 S6000
G1 X105.202 Y121.403 E.43772
G1 X111.597 Y121.402 E.21215
G1 X111.598 Y134.597 E.43771
G1 X105.262 Y134.598 E.21017
M204 S250
G1 X104.81 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5020
M204 S5000
G1 X104.818 Y121.146 E.4193
G3 X104.993 Y121.01 I.184 J.057 E.00725
G1 X111.837 Y121.015 E.21028
G3 X111.99 Y121.196 I-.041 J.189 E.00784
G1 X111.99 Y134.789 E.41769
G3 X111.807 Y134.99 I-.192 J.008 E.00925
G1 X105.011 Y134.99 E.20883
G3 X104.818 Y134.852 I-.008 J-.193 E.00783
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.818 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.957 Y132.39 Z13.2 F42000
G1 Z12.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5020
M204 S6000
G1 X105.957 Y130.762 E.05401
G2 X106.5 Y129.966 I-1.173 J-1.382 E.03235
G2 X105.957 Y128.481 I-2.022 J-.102 E.05385
G1 X105.957 Y125.521 E.09822
G2 X106.5 Y124.724 I-1.172 J-1.382 E.03235
G2 X105.957 Y123.24 I-2.022 J-.102 E.05385
G1 X105.957 Y122.158 E.0359
G1 X106.503 Y122.158 E.01811
M204 S10000
G1 X110.842 Y124.233 F42000
G1 F5020
M204 S6000
G1 X110.842 Y125.861 E.05401
G1 X110.661 Y126.035 E.00833
G2 X110.42 Y127.673 I1.42 J1.045 E.05716
G2 X110.842 Y128.141 I2.337 J-1.683 E.02096
G1 X110.842 Y131.102 E.09824
G1 X110.661 Y131.276 E.00834
G2 X110.42 Y132.914 I1.42 J1.045 E.05716
G2 X110.843 Y133.382 I2.337 J-1.683 E.02097
G1 X110.843 Y133.842 E.01526
G1 X109.101 Y133.842 E.05778
G2 X108.726 Y133.241 I-1.019 J.218 E.02398
G1 X108.04 Y132.586 E.03145
G3 X107.8 Y130.948 I1.42 J-1.045 E.05716
G3 X108.76 Y129.966 I4.942 J3.87 E.04567
G2 X109.001 Y128.328 I-1.42 J-1.045 E.05716
G2 X108.04 Y127.345 I-4.941 J3.868 E.04567
G3 X107.8 Y125.707 I1.42 J-1.045 E.05716
G3 X108.76 Y124.724 I4.942 J3.869 E.04567
G2 X109.001 Y123.086 I-1.42 J-1.045 E.05716
G2 X108.097 Y122.158 I-4.668 J3.639 E.04308
G1 X110.32 Y122.158 E.07375
G2 X110.842 Y122.899 I1.691 J-.636 E.03042
G1 X110.842 Y124.233 E.04423
; CHANGE_LAYER
; Z_HEIGHT: 13
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X110.842 Y122.899 E-.50673
G1 X110.42 Y122.431 E-.23951
G1 X110.408 Y122.397 E-.01377
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 65/73
; update layer progress
M73 L65
M991 S0 P64 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z13.2 I-.395 J1.151 P1  F42000
G1 X144.809 Y134.191 Z13.2
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5119
M204 S6000
G1 X144.809 Y121.81 E.41071
G1 X150.39 Y121.809 E.18514
G1 X150.391 Y134.19 E.41071
G1 X144.869 Y134.191 E.18317
M204 S10000
G1 X144.402 Y134.598 F42000
G1 F5119
M204 S6000
G1 X144.402 Y121.403 E.43772
G1 X150.797 Y121.402 E.21215
G1 X150.798 Y134.597 E.43771
G1 X144.462 Y134.598 E.21017
M204 S250
G1 X144.01 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5119
M204 S5000
G1 X144.011 Y121.184 E.41815
G3 X144.193 Y121.01 I.193 J.021 E.00841
G1 X151.037 Y121.015 E.21027
G3 X151.19 Y121.196 I-.038 J.187 E.00787
G1 X151.19 Y134.789 E.41769
G3 X151.007 Y134.99 I-.192 J.008 E.00925
G1 X144.184 Y134.989 E.20965
G3 X144.019 Y134.852 I.021 J-.194 E.00698
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.017 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 65 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z13.4
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer65 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X147.018 Y133.842 F42000
G1 Z13
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5119
M204 S6000
G1 X145.39 Y133.843 E.05401
G1 X145.157 Y133.571 E.01185
G1 X145.157 Y130.518 E.10127
G1 X145.556 Y129.966 E.0226
G2 X145.157 Y128.33 I-1.671 J-.46 E.05832
G1 X145.157 Y125.277 E.10127
G1 X145.556 Y124.724 E.02259
G2 X145.157 Y123.088 I-1.671 J-.46 E.05832
G1 X145.157 Y122.158 E.03087
G1 X145.855 Y122.158 E.02315
M204 S10000
G1 X150.042 Y124.081 F42000
G1 F5119
M204 S6000
G1 X150.042 Y122.655 E.04729
G1 X149.683 Y122.158 E.02036
G1 X147.19 Y122.158 E.08272
G1 X147.704 Y122.759 E.02625
G3 X148.057 Y124.724 I-1.134 J1.218 E.07104
G1 X147.496 Y125.379 E.0286
G2 X147.143 Y127.345 I1.134 J1.218 E.07104
G1 X147.704 Y128 E.0286
G3 X148.057 Y129.966 I-1.134 J1.218 E.07104
G1 X147.496 Y130.621 E.02861
G2 X147.143 Y132.586 I1.134 J1.218 E.07104
G3 X148.137 Y133.842 I-7.022 J6.577 E.05319
G1 X150.043 Y133.842 E.0632
G1 X150.043 Y133.139 E.02334
G3 X149.764 Y131.276 I1.019 J-1.104 E.06752
G1 X150.042 Y130.951 E.0142
G1 X150.042 Y127.897 E.10129
G3 X149.764 Y126.035 I1.019 J-1.104 E.06751
G1 X150.042 Y125.71 E.01419
G1 X150.042 Y124.081 E.05401
; OBJECT_ID: 405
; WIPE_START
G1 F8843.478
G1 X150.042 Y125.71 E-.61876
G1 X149.801 Y125.992 E-.14125
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X142.56 Y128.406 Z13.4 F42000
G1 X125.209 Y134.191 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5119
M204 S6000
G1 X125.209 Y121.81 E.41071
G1 X130.79 Y121.809 E.18514
G1 X130.791 Y134.19 E.41071
G1 X125.269 Y134.191 E.18317
M204 S10000
G1 X124.802 Y134.598 F42000
G1 F5119
M204 S6000
M73 P90 R2
G1 X124.802 Y121.403 E.43772
G1 X131.197 Y121.402 E.21215
G1 X131.198 Y134.597 E.43771
G1 X124.862 Y134.598 E.21017
M204 S250
G1 X124.41 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5119
M204 S5000
G1 X124.411 Y121.184 E.41815
G3 X124.593 Y121.01 I.193 J.021 E.00841
G1 X131.437 Y121.015 E.21027
G3 X131.59 Y121.196 I-.038 J.187 E.00787
G1 X131.59 Y134.789 E.41769
G3 X131.407 Y134.99 I-.192 J.008 E.00925
G1 X124.584 Y134.989 E.20965
G3 X124.419 Y134.852 I.021 J-.194 E.00698
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.417 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.418 Y133.842 Z13.4 F42000
G1 Z13
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5119
M204 S6000
G1 X125.79 Y133.843 E.05401
G1 X125.557 Y133.571 E.01185
G1 X125.557 Y130.518 E.10127
G1 X125.956 Y129.966 E.0226
G2 X125.557 Y128.33 I-1.671 J-.46 E.05832
G1 X125.557 Y125.277 E.10127
G1 X125.956 Y124.724 E.02259
G2 X125.557 Y123.088 I-1.671 J-.46 E.05832
G1 X125.557 Y122.158 E.03087
G1 X126.255 Y122.158 E.02315
M204 S10000
G1 X130.442 Y124.081 F42000
G1 F5119
M204 S6000
G1 X130.442 Y122.655 E.04729
G1 X130.083 Y122.158 E.02036
G1 X127.59 Y122.158 E.08272
G1 X128.104 Y122.759 E.02625
G3 X128.457 Y124.724 I-1.134 J1.218 E.07104
G1 X127.896 Y125.379 E.0286
G2 X127.543 Y127.345 I1.134 J1.218 E.07104
G1 X128.104 Y128 E.0286
G3 X128.457 Y129.966 I-1.134 J1.218 E.07104
G1 X127.896 Y130.621 E.02861
G2 X127.543 Y132.586 I1.134 J1.218 E.07104
G3 X128.537 Y133.842 I-7.022 J6.577 E.05319
G1 X130.443 Y133.842 E.0632
G1 X130.443 Y133.139 E.02334
G3 X130.164 Y131.276 I1.019 J-1.104 E.06752
G1 X130.442 Y130.951 E.0142
G1 X130.442 Y127.897 E.10129
G3 X130.164 Y126.035 I1.019 J-1.104 E.06751
G1 X130.442 Y125.71 E.01419
G1 X130.442 Y124.081 E.05401
; OBJECT_ID: 394
; WIPE_START
G1 F8843.478
G1 X130.442 Y125.71 E-.61876
G1 X130.201 Y125.992 E-.14125
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X122.96 Y128.406 Z13.4 F42000
G1 X105.609 Y134.191 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5119
M204 S6000
G1 X105.609 Y121.81 E.41071
G1 X111.19 Y121.809 E.18514
G1 X111.191 Y134.19 E.41071
G1 X105.669 Y134.191 E.18317
M204 S10000
G1 X105.202 Y134.598 F42000
G1 F5119
M204 S6000
G1 X105.202 Y121.403 E.43772
G1 X111.597 Y121.402 E.21215
G1 X111.598 Y134.597 E.43771
G1 X105.262 Y134.598 E.21017
M204 S250
G1 X104.81 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5119
M204 S5000
G1 X104.811 Y121.184 E.41815
G3 X104.993 Y121.01 I.193 J.021 E.00841
G1 X111.837 Y121.015 E.21027
G3 X111.99 Y121.196 I-.038 J.187 E.00787
G1 X111.99 Y134.789 E.41769
G3 X111.807 Y134.99 I-.192 J.008 E.00925
G1 X104.984 Y134.989 E.20965
G3 X104.819 Y134.852 I.021 J-.194 E.00698
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.817 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.818 Y133.842 Z13.4 F42000
G1 Z13
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5119
M204 S6000
G1 X106.19 Y133.843 E.05401
G1 X105.957 Y133.571 E.01185
G1 X105.957 Y130.518 E.10127
G1 X106.356 Y129.966 E.0226
G2 X105.957 Y128.33 I-1.671 J-.46 E.05832
G1 X105.957 Y125.277 E.10127
G1 X106.356 Y124.724 E.02259
G2 X105.957 Y123.088 I-1.671 J-.46 E.05832
G1 X105.957 Y122.158 E.03087
G1 X106.655 Y122.158 E.02315
M204 S10000
G1 X110.842 Y124.081 F42000
G1 F5119
M204 S6000
G1 X110.842 Y122.655 E.04729
G1 X110.483 Y122.158 E.02036
G1 X107.99 Y122.158 E.08272
G1 X108.504 Y122.759 E.02625
G3 X108.857 Y124.724 I-1.134 J1.218 E.07104
G1 X108.296 Y125.379 E.0286
G2 X107.943 Y127.345 I1.134 J1.218 E.07104
G1 X108.504 Y128 E.0286
G3 X108.857 Y129.966 I-1.134 J1.218 E.07104
G1 X108.296 Y130.621 E.02861
G2 X107.943 Y132.586 I1.134 J1.218 E.07104
G3 X108.937 Y133.842 I-7.022 J6.577 E.05319
G1 X110.843 Y133.842 E.0632
G1 X110.843 Y133.139 E.02334
G3 X110.564 Y131.276 I1.019 J-1.104 E.06752
G1 X110.842 Y130.951 E.0142
G1 X110.842 Y127.897 E.10129
G3 X110.564 Y126.035 I1.019 J-1.104 E.06751
G1 X110.842 Y125.71 E.01419
G1 X110.842 Y124.081 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 13.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X110.842 Y125.71 E-.61876
G1 X110.601 Y125.992 E-.14125
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 66/73
; update layer progress
M73 L66
M991 S0 P65 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z13.4 I-.284 J1.183 P1  F42000
G1 X144.809 Y134.191 Z13.4
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5131
M204 S6000
G1 X144.809 Y121.81 E.41071
G1 X150.391 Y121.81 E.18516
G1 X150.391 Y134.19 E.41069
G1 X144.869 Y134.191 E.18317
M204 S10000
G1 X144.402 Y134.598 F42000
G1 F5131
M204 S6000
G1 X144.402 Y121.403 E.43771
G1 X150.798 Y121.403 E.21216
G1 X150.798 Y134.597 E.4377
G1 X144.462 Y134.598 E.21017
M204 S250
G1 X144.01 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5131
M204 S5000
G1 X144.011 Y121.184 E.41815
G3 X144.193 Y121.01 I.193 J.02 E.00841
G1 X151.046 Y121.017 E.21056
G3 X151.19 Y121.21 I-.051 J.188 E.008
G1 X151.19 Y134.79 E.41726
G3 X151.007 Y134.99 I-.192 J.008 E.00925
G1 X144.184 Y134.989 E.20964
G3 X144.018 Y134.853 I.021 J-.193 E.00698
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.017 Y132.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 66 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z13.6
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer66 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X145.157 Y131.724 F42000
G1 Z13.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5131
M204 S6000
G1 X145.157 Y133.353 E.05401
G1 X145.512 Y133.843 E.02007
G1 X148.014 Y133.842 E.08298
G1 X147.503 Y133.241 E.02617
G3 X147.14 Y131.276 I1.135 J-1.226 E.07107
G1 X147.697 Y130.621 E.02854
G2 X148.06 Y128.655 I-1.135 J-1.226 E.07107
G1 X147.503 Y128 E.02854
G3 X147.14 Y126.035 I1.135 J-1.226 E.07107
G1 X147.697 Y125.379 E.02854
G2 X148.06 Y123.414 I-1.135 J-1.226 E.07107
G3 X147.067 Y122.158 I7.541 J-6.981 E.05317
G1 X145.157 Y122.158 E.06335
G1 X145.157 Y122.87 E.02362
G3 X145.439 Y124.724 I-1.019 J1.104 E.06719
G1 X145.157 Y125.056 E.01444
G1 X145.157 Y128.111 E.10136
G3 X145.439 Y129.966 I-1.019 J1.104 E.06719
G1 X145.157 Y130.297 E.01444
G1 X145.157 Y128.669 E.05401
M204 S10000
G1 X149.339 Y133.842 F42000
G1 F5131
M204 S6000
G1 X150.043 Y133.842 E.02335
G1 X150.043 Y132.918 E.03067
G3 X149.649 Y131.276 I1.268 J-1.172 E.05852
G1 X150.043 Y130.732 E.02227
G1 X150.043 Y127.676 E.10137
G3 X149.649 Y126.035 I1.268 J-1.172 E.05852
G1 X150.043 Y125.491 E.02227
G1 X150.043 Y122.435 E.10137
G1 X149.807 Y122.158 E.01207
G1 X148.178 Y122.158 E.05401
; OBJECT_ID: 405
; WIPE_START
G1 F8843.478
G1 X149.807 Y122.158 E-.61876
G1 X150.043 Y122.435 E-.13827
G1 X150.043 Y122.443 E-.00297
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X143.143 Y125.707 Z13.6 F42000
G1 X125.209 Y134.191 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5131
M204 S6000
G1 X125.209 Y121.81 E.41071
G1 X130.791 Y121.81 E.18516
G1 X130.791 Y134.19 E.41069
G1 X125.269 Y134.191 E.18317
M204 S10000
G1 X124.802 Y134.598 F42000
G1 F5131
M204 S6000
G1 X124.802 Y121.403 E.43771
G1 X131.198 Y121.403 E.21216
G1 X131.198 Y134.597 E.4377
G1 X124.862 Y134.598 E.21017
M204 S250
G1 X124.41 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5131
M204 S5000
G1 X124.411 Y121.184 E.41815
G3 X124.593 Y121.01 I.193 J.02 E.00841
G1 X131.446 Y121.017 E.21056
G3 X131.59 Y121.21 I-.051 J.188 E.008
G1 X131.59 Y134.79 E.41726
G3 X131.407 Y134.99 I-.192 J.008 E.00925
G1 X124.584 Y134.989 E.20964
G3 X124.418 Y134.853 I.021 J-.193 E.00698
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.417 Y132.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.557 Y131.724 Z13.6 F42000
G1 Z13.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5131
M204 S6000
G1 X125.557 Y133.353 E.05401
G1 X125.912 Y133.843 E.02007
G1 X128.414 Y133.842 E.08298
G1 X127.903 Y133.241 E.02617
G3 X127.54 Y131.276 I1.135 J-1.226 E.07107
G1 X128.097 Y130.621 E.02854
G2 X128.46 Y128.655 I-1.135 J-1.226 E.07107
G1 X127.903 Y128 E.02854
G3 X127.54 Y126.035 I1.135 J-1.226 E.07107
G1 X128.097 Y125.379 E.02854
G2 X128.46 Y123.414 I-1.135 J-1.226 E.07107
G3 X127.467 Y122.158 I7.541 J-6.981 E.05317
G1 X125.557 Y122.158 E.06335
G1 X125.557 Y122.87 E.02362
G3 X125.839 Y124.724 I-1.019 J1.104 E.06719
G1 X125.557 Y125.056 E.01444
G1 X125.557 Y128.111 E.10136
G3 X125.839 Y129.966 I-1.019 J1.104 E.06719
G1 X125.557 Y130.297 E.01444
G1 X125.557 Y128.669 E.05401
M204 S10000
G1 X129.739 Y133.842 F42000
G1 F5131
M204 S6000
G1 X130.443 Y133.842 E.02335
M73 P90 R1
G1 X130.443 Y132.918 E.03067
G3 X130.049 Y131.276 I1.268 J-1.172 E.05852
G1 X130.443 Y130.732 E.02227
G1 X130.443 Y127.676 E.10137
G3 X130.049 Y126.035 I1.268 J-1.172 E.05852
G1 X130.443 Y125.491 E.02227
G1 X130.443 Y122.435 E.10137
G1 X130.207 Y122.158 E.01207
G1 X128.578 Y122.158 E.05401
; OBJECT_ID: 394
; WIPE_START
G1 F8843.478
G1 X130.207 Y122.158 E-.61876
G1 X130.443 Y122.435 E-.13827
G1 X130.443 Y122.443 E-.00297
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X123.543 Y125.707 Z13.6 F42000
G1 X105.609 Y134.191 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5131
M204 S6000
G1 X105.609 Y121.81 E.41071
G1 X111.191 Y121.81 E.18516
G1 X111.191 Y134.19 E.41069
G1 X105.669 Y134.191 E.18317
M204 S10000
G1 X105.202 Y134.598 F42000
G1 F5131
M204 S6000
G1 X105.202 Y121.403 E.43771
G1 X111.598 Y121.403 E.21216
G1 X111.598 Y134.597 E.4377
G1 X105.262 Y134.598 E.21017
M204 S250
M73 P91 R1
G1 X104.81 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5131
M204 S5000
G1 X104.811 Y121.184 E.41815
G3 X104.993 Y121.01 I.193 J.02 E.00841
G1 X111.846 Y121.017 E.21056
G3 X111.99 Y121.21 I-.051 J.188 E.008
G1 X111.99 Y134.79 E.41726
G3 X111.807 Y134.99 I-.192 J.008 E.00925
G1 X104.984 Y134.989 E.20964
G3 X104.818 Y134.853 I.021 J-.193 E.00698
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.817 Y132.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.957 Y131.724 Z13.6 F42000
G1 Z13.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5131
M204 S6000
G1 X105.957 Y133.353 E.05401
G1 X106.312 Y133.843 E.02007
G1 X108.814 Y133.842 E.08298
G1 X108.303 Y133.241 E.02617
G3 X107.94 Y131.276 I1.135 J-1.226 E.07107
G1 X108.497 Y130.621 E.02854
G2 X108.86 Y128.655 I-1.135 J-1.226 E.07107
G1 X108.303 Y128 E.02854
G3 X107.94 Y126.035 I1.135 J-1.226 E.07107
G1 X108.497 Y125.379 E.02854
G2 X108.86 Y123.414 I-1.135 J-1.226 E.07107
G3 X107.867 Y122.158 I7.541 J-6.981 E.05317
G1 X105.957 Y122.158 E.06335
G1 X105.957 Y122.87 E.02362
G3 X106.239 Y124.724 I-1.019 J1.104 E.06719
G1 X105.957 Y125.056 E.01444
G1 X105.957 Y128.111 E.10136
G3 X106.239 Y129.966 I-1.019 J1.104 E.06719
G1 X105.957 Y130.297 E.01444
G1 X105.957 Y128.669 E.05401
M204 S10000
G1 X110.139 Y133.842 F42000
G1 F5131
M204 S6000
G1 X110.843 Y133.842 E.02335
G1 X110.843 Y132.918 E.03067
G3 X110.449 Y131.276 I1.268 J-1.172 E.05852
G1 X110.843 Y130.732 E.02227
G1 X110.843 Y127.676 E.10137
G3 X110.449 Y126.035 I1.268 J-1.172 E.05852
G1 X110.843 Y125.491 E.02227
G1 X110.843 Y122.435 E.10137
G1 X110.607 Y122.158 E.01207
G1 X108.978 Y122.158 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 13.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X110.607 Y122.158 E-.61876
G1 X110.843 Y122.435 E-.13827
G1 X110.843 Y122.443 E-.00297
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 67/73
; update layer progress
M73 L67
M991 S0 P66 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z13.6 I-.398 J1.15 P1  F42000
G1 X144.809 Y134.191 Z13.6
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5037
M204 S6000
G1 X144.809 Y121.81 E.41071
G1 X150.39 Y121.809 E.18514
G1 X150.391 Y134.19 E.41071
G1 X144.869 Y134.191 E.18317
M204 S10000
G1 X144.402 Y134.598 F42000
G1 F5037
M204 S6000
G1 X144.402 Y121.403 E.43772
G1 X150.797 Y121.402 E.21215
G1 X150.798 Y134.597 E.43772
G1 X144.462 Y134.598 E.21017
M204 S250
G1 X144.01 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5037
M204 S5000
G1 X144.011 Y121.184 E.41815
G3 X144.193 Y121.01 I.193 J.02 E.00841
G1 X151.037 Y121.015 E.21029
G3 X151.19 Y121.197 I-.038 J.187 E.00787
G1 X151.182 Y134.853 E.41962
G3 X151.009 Y134.99 I-.185 J-.056 E.00723
G1 X144.211 Y134.99 E.20889
G3 X144.018 Y134.852 I-.008 J-.193 E.00784
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.017 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 67 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z13.8
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer67 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X145.157 Y131.479 F42000
G1 Z13.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5037
M204 S6000
G1 X145.157 Y133.107 E.05401
G3 X145.675 Y133.842 I-1.197 J1.391 E.03013
G1 X147.907 Y133.842 E.07404
G3 X147.007 Y132.914 I3.958 J-4.735 E.04296
G3 X147.237 Y131.276 I1.653 J-.603 E.05712
G2 X148.193 Y130.293 I-4.187 J-5.029 E.04556
G2 X147.963 Y128.655 I-1.653 J-.603 E.05712
G3 X147.007 Y127.673 I4.188 J-5.03 E.04556
G3 X147.237 Y126.035 I1.653 J-.603 E.05712
G2 X148.193 Y125.052 I-4.187 J-5.03 E.04556
G2 X147.963 Y123.414 I-1.653 J-.603 E.05712
G1 X147.283 Y122.759 E.03133
G3 X146.905 Y122.158 I.655 J-.831 E.02401
G1 X145.157 Y122.158 E.05797
G1 X145.157 Y122.624 E.01548
G3 X145.572 Y123.086 I-1.986 J2.202 E.02064
G3 X145.342 Y124.724 I-1.653 J.603 E.05712
G1 X145.157 Y124.902 E.00851
G1 X145.157 Y127.866 E.0983
G3 X145.572 Y128.328 I-1.986 J2.202 E.02064
G3 X145.342 Y129.966 I-1.653 J.603 E.05712
G1 X145.157 Y130.144 E.00851
G1 X145.157 Y128.515 E.05401
M204 S10000
G1 X149.492 Y133.842 F42000
G1 F5037
M204 S6000
G1 X150.043 Y133.842 E.01825
G1 X150.043 Y132.764 E.03576
G3 X149.505 Y131.276 I1.471 J-1.372 E.05394
G3 X150.042 Y130.487 I1.738 J.605 E.03204
G1 X150.042 Y127.523 E.09832
G3 X149.505 Y126.035 I1.471 J-1.372 E.05393
G3 X150.042 Y125.246 I1.738 J.605 E.03203
G1 X150.042 Y123.617 E.05401
; OBJECT_ID: 405
; WIPE_START
G1 F8843.478
G1 X150.042 Y125.246 E-.61876
G1 X149.794 Y125.522 E-.14125
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X142.596 Y128.06 Z13.8 F42000
G1 X125.209 Y134.191 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5037
M204 S6000
G1 X125.209 Y121.81 E.41071
G1 X130.79 Y121.809 E.18514
G1 X130.791 Y134.19 E.41071
G1 X125.269 Y134.191 E.18317
M204 S10000
G1 X124.802 Y134.598 F42000
G1 F5037
M204 S6000
G1 X124.802 Y121.403 E.43772
G1 X131.197 Y121.402 E.21215
G1 X131.198 Y134.597 E.43772
G1 X124.862 Y134.598 E.21017
M204 S250
G1 X124.41 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5037
M204 S5000
G1 X124.411 Y121.184 E.41815
G3 X124.593 Y121.01 I.193 J.02 E.00841
G1 X131.437 Y121.015 E.21029
G3 X131.59 Y121.197 I-.038 J.187 E.00787
G1 X131.582 Y134.853 E.41962
G3 X131.409 Y134.99 I-.185 J-.056 E.00723
G1 X124.611 Y134.99 E.20889
G3 X124.418 Y134.852 I-.008 J-.193 E.00784
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.417 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.557 Y131.479 Z13.8 F42000
G1 Z13.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5037
M204 S6000
G1 X125.557 Y133.107 E.05401
G3 X126.075 Y133.842 I-1.197 J1.391 E.03013
G1 X128.307 Y133.842 E.07404
G3 X127.407 Y132.914 I3.958 J-4.735 E.04296
G3 X127.637 Y131.276 I1.653 J-.603 E.05712
G2 X128.593 Y130.293 I-4.187 J-5.029 E.04556
G2 X128.363 Y128.655 I-1.653 J-.603 E.05712
G3 X127.407 Y127.673 I4.188 J-5.03 E.04556
G3 X127.637 Y126.035 I1.653 J-.603 E.05712
G2 X128.593 Y125.052 I-4.187 J-5.03 E.04556
G2 X128.363 Y123.414 I-1.653 J-.603 E.05712
G1 X127.683 Y122.759 E.03133
G3 X127.305 Y122.158 I.655 J-.831 E.02401
G1 X125.557 Y122.158 E.05797
G1 X125.557 Y122.624 E.01548
G3 X125.972 Y123.086 I-1.986 J2.202 E.02064
G3 X125.742 Y124.724 I-1.653 J.603 E.05712
G1 X125.557 Y124.902 E.00851
G1 X125.557 Y127.866 E.0983
G3 X125.972 Y128.328 I-1.986 J2.202 E.02064
G3 X125.742 Y129.966 I-1.653 J.603 E.05712
G1 X125.557 Y130.144 E.00851
G1 X125.557 Y128.515 E.05401
M204 S10000
G1 X129.892 Y133.842 F42000
G1 F5037
M204 S6000
G1 X130.443 Y133.842 E.01825
G1 X130.443 Y132.764 E.03576
G3 X129.905 Y131.276 I1.471 J-1.372 E.05394
G3 X130.442 Y130.487 I1.738 J.605 E.03204
G1 X130.442 Y127.523 E.09832
G3 X129.905 Y126.035 I1.471 J-1.372 E.05393
G3 X130.442 Y125.246 I1.738 J.605 E.03203
G1 X130.442 Y123.617 E.05401
; OBJECT_ID: 394
; WIPE_START
G1 F8843.478
G1 X130.442 Y125.246 E-.61876
G1 X130.194 Y125.522 E-.14125
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X122.996 Y128.06 Z13.8 F42000
G1 X105.609 Y134.191 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5037
M204 S6000
G1 X105.609 Y121.81 E.41071
G1 X111.19 Y121.809 E.18514
G1 X111.191 Y134.19 E.41071
G1 X105.669 Y134.191 E.18317
M204 S10000
G1 X105.202 Y134.598 F42000
G1 F5037
M204 S6000
G1 X105.202 Y121.403 E.43772
G1 X111.597 Y121.402 E.21215
G1 X111.598 Y134.597 E.43772
G1 X105.262 Y134.598 E.21017
M204 S250
G1 X104.81 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5037
M204 S5000
G1 X104.811 Y121.184 E.41815
G3 X104.993 Y121.01 I.193 J.02 E.00841
G1 X111.837 Y121.015 E.21029
G3 X111.99 Y121.197 I-.038 J.187 E.00787
G1 X111.982 Y134.853 E.41962
G3 X111.809 Y134.99 I-.185 J-.056 E.00723
G1 X105.011 Y134.99 E.20889
G3 X104.818 Y134.852 I-.008 J-.193 E.00784
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.817 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.957 Y131.479 Z13.8 F42000
G1 Z13.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5037
M204 S6000
G1 X105.957 Y133.107 E.05401
G3 X106.475 Y133.842 I-1.197 J1.391 E.03013
G1 X108.707 Y133.842 E.07404
G3 X107.807 Y132.914 I3.958 J-4.735 E.04296
G3 X108.037 Y131.276 I1.653 J-.603 E.05712
G2 X108.993 Y130.293 I-4.187 J-5.029 E.04556
G2 X108.763 Y128.655 I-1.653 J-.603 E.05712
G3 X107.807 Y127.673 I4.188 J-5.03 E.04556
G3 X108.037 Y126.035 I1.653 J-.603 E.05712
G2 X108.993 Y125.052 I-4.187 J-5.03 E.04556
G2 X108.763 Y123.414 I-1.653 J-.603 E.05712
M73 P92 R1
G1 X108.083 Y122.759 E.03133
G3 X107.705 Y122.158 I.655 J-.831 E.02401
G1 X105.957 Y122.158 E.05797
G1 X105.957 Y122.624 E.01548
G3 X106.373 Y123.086 I-1.986 J2.202 E.02064
G3 X106.142 Y124.724 I-1.653 J.603 E.05712
G1 X105.957 Y124.902 E.00851
G1 X105.957 Y127.866 E.0983
G3 X106.373 Y128.328 I-1.986 J2.202 E.02064
G3 X106.142 Y129.966 I-1.653 J.603 E.05712
G1 X105.957 Y130.144 E.00851
G1 X105.957 Y128.515 E.05401
M204 S10000
G1 X110.292 Y133.842 F42000
G1 F5037
M204 S6000
G1 X110.843 Y133.842 E.01825
G1 X110.843 Y132.764 E.03576
G3 X110.305 Y131.276 I1.471 J-1.372 E.05394
G3 X110.842 Y130.487 I1.738 J.605 E.03204
G1 X110.842 Y127.523 E.09832
G3 X110.305 Y126.035 I1.471 J-1.372 E.05393
G3 X110.842 Y125.246 I1.738 J.605 E.03203
G1 X110.842 Y123.617 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 13.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F8843.478
G1 X110.842 Y125.246 E-.61876
G1 X110.594 Y125.522 E-.14125
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 68/73
; update layer progress
M73 L68
M991 S0 P67 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z13.8 I-.299 J1.18 P1  F42000
G1 X144.809 Y134.191 Z13.8
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5940
M204 S6000
G1 X144.809 Y121.81 E.41071
G1 X150.39 Y121.809 E.18514
G1 X150.391 Y134.19 E.41071
G1 X144.869 Y134.191 E.18317
M204 S10000
G1 X144.402 Y134.598 F42000
G1 F5940
M204 S6000
G1 X144.402 Y121.403 E.43772
G1 X150.797 Y121.402 E.21215
G1 X150.798 Y134.597 E.43772
G1 X144.462 Y134.598 E.21017
M204 S250
G1 X144.01 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5940
M204 S5000
G1 X144.011 Y121.184 E.41816
G3 X144.193 Y121.01 I.193 J.02 E.00841
G1 X151.037 Y121.015 E.21028
G3 X151.19 Y121.196 I-.041 J.189 E.00785
G1 X151.189 Y134.816 E.4185
G3 X151.009 Y134.99 I-.196 J-.023 E.00832
G1 X144.184 Y134.989 E.20971
G3 X144.018 Y134.852 I.021 J-.193 E.00699
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.017 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 68 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z14
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer68 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X145.535 Y131.565 F42000
G1 Z13.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5940
M204 S6000
G1 X145.535 Y133.194 E.05401
G3 X145.767 Y133.465 I-.322 J.511 E.01205
G1 X147.286 Y133.465 E.05039
G3 X146.735 Y132.914 I.614 J-1.166 E.02627
G3 X147.321 Y131.276 I2.089 J-.176 E.05951
G1 X148.221 Y130.621 E.03692
G1 X148.465 Y130.293 E.01356
G2 X147.879 Y128.655 I-2.089 J-.176 E.05951
G1 X146.979 Y128 E.03692
G1 X146.735 Y127.673 E.01356
G3 X147.321 Y126.035 I2.089 J-.176 E.05951
G1 X148.221 Y125.379 E.03692
G1 X148.465 Y125.052 E.01356
G2 X147.879 Y123.414 I-2.089 J-.176 E.05951
G1 X146.979 Y122.759 E.03692
G1 X146.812 Y122.535 E.00926
G1 X145.535 Y122.535 E.04238
G1 X145.535 Y122.711 E.00584
G3 X145.88 Y123.414 I-.624 J.743 E.02675
G1 X145.713 Y124.069 E.02243
G1 X145.535 Y124.326 E.01037
G1 X145.535 Y127.952 E.12029
G3 X145.88 Y128.655 I-.624 J.743 E.02675
G1 X145.713 Y129.31 E.02243
G1 X145.535 Y129.567 E.01037
G1 X145.535 Y131.196 E.05401
M204 S10000
G1 X149.869 Y133.828 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.383463
G1 F5940
M204 S6000
G1 X150.001 Y133.8 E.00374
G1 X150.028 Y133.669 E.00374
G1 X150.028 Y122.331 E.31461
G1 X150 Y122.199 E.00374
G1 X149.869 Y122.172 E.00374
G1 X145.331 Y122.172 E.12592
G1 X145.199 Y122.2 E.00374
G1 X145.172 Y122.331 E.00374
G1 X145.172 Y133.669 E.31461
G1 X145.199 Y133.801 E.00374
G1 X145.331 Y133.828 E.00374
G1 X149.809 Y133.828 E.12426
M204 S10000
G1 X149.263 Y133.465 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5940
M204 S6000
G1 X149.665 Y133.465 E.01334
G1 X149.665 Y132.239 E.04067
G3 X149.32 Y131.276 I1.536 J-1.094 E.03436
G1 X149.355 Y130.948 E.01093
G2 X149.665 Y130.46 I-.785 J-.84 E.0194
G1 X149.665 Y126.997 E.11486
G3 X149.32 Y126.035 I1.535 J-1.094 E.03435
G1 X149.355 Y125.707 E.01093
G2 X149.665 Y125.219 I-.784 J-.84 E.01939
G1 X149.665 Y123.591 E.05401
; OBJECT_ID: 405
; WIPE_START
G1 F8843.478
G1 X149.665 Y125.219 E-.61876
G1 X149.466 Y125.533 E-.14125
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X142.278 Y128.098 Z14 F42000
G1 X125.209 Y134.191 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5940
M204 S6000
G1 X125.209 Y121.81 E.41071
G1 X130.79 Y121.809 E.18514
G1 X130.791 Y134.19 E.41071
G1 X125.269 Y134.191 E.18317
M204 S10000
G1 X124.802 Y134.598 F42000
G1 F5940
M204 S6000
G1 X124.802 Y121.403 E.43772
G1 X131.197 Y121.402 E.21215
G1 X131.198 Y134.597 E.43772
G1 X124.862 Y134.598 E.21017
M204 S250
G1 X124.41 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5940
M204 S5000
G1 X124.411 Y121.184 E.41816
G3 X124.593 Y121.01 I.193 J.02 E.00841
G1 X131.437 Y121.015 E.21028
G3 X131.59 Y121.196 I-.041 J.189 E.00785
G1 X131.589 Y134.816 E.4185
G3 X131.409 Y134.99 I-.196 J-.023 E.00832
G1 X124.584 Y134.989 E.20971
G3 X124.418 Y134.852 I.021 J-.193 E.00699
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.417 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.935 Y131.565 Z14 F42000
G1 Z13.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5940
M204 S6000
G1 X125.935 Y133.194 E.05401
G3 X126.167 Y133.465 I-.322 J.511 E.01205
G1 X127.686 Y133.465 E.05039
G3 X127.135 Y132.914 I.614 J-1.166 E.02627
G3 X127.721 Y131.276 I2.089 J-.176 E.05951
G1 X128.621 Y130.621 E.03692
G1 X128.865 Y130.293 E.01356
G2 X128.279 Y128.655 I-2.089 J-.176 E.05951
G1 X127.379 Y128 E.03692
G1 X127.135 Y127.673 E.01356
G3 X127.721 Y126.035 I2.089 J-.176 E.05951
G1 X128.621 Y125.379 E.03692
G1 X128.865 Y125.052 E.01356
G2 X128.279 Y123.414 I-2.089 J-.176 E.05951
G1 X127.379 Y122.759 E.03692
G1 X127.212 Y122.535 E.00926
G1 X125.935 Y122.535 E.04238
G1 X125.935 Y122.711 E.00584
G3 X126.28 Y123.414 I-.624 J.743 E.02675
G1 X126.113 Y124.069 E.02243
G1 X125.935 Y124.326 E.01037
G1 X125.935 Y127.952 E.12029
G3 X126.28 Y128.655 I-.624 J.743 E.02675
G1 X126.113 Y129.31 E.02243
G1 X125.935 Y129.567 E.01037
G1 X125.935 Y131.196 E.05401
M204 S10000
G1 X130.269 Y133.828 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.383463
G1 F5940
M204 S6000
G1 X130.401 Y133.8 E.00374
G1 X130.428 Y133.669 E.00374
G1 X130.428 Y122.331 E.31461
G1 X130.4 Y122.199 E.00374
G1 X130.269 Y122.172 E.00374
G1 X125.731 Y122.172 E.12592
G1 X125.599 Y122.2 E.00374
G1 X125.572 Y122.331 E.00374
G1 X125.572 Y133.669 E.31461
G1 X125.599 Y133.801 E.00374
G1 X125.731 Y133.828 E.00374
G1 X130.209 Y133.828 E.12426
M204 S10000
G1 X129.663 Y133.465 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5940
M204 S6000
G1 X130.065 Y133.465 E.01334
G1 X130.065 Y132.239 E.04067
G3 X129.72 Y131.276 I1.536 J-1.094 E.03436
G1 X129.755 Y130.948 E.01093
G2 X130.065 Y130.46 I-.785 J-.84 E.0194
G1 X130.065 Y126.997 E.11486
G3 X129.72 Y126.035 I1.535 J-1.094 E.03435
G1 X129.755 Y125.707 E.01093
G2 X130.065 Y125.219 I-.784 J-.84 E.01939
G1 X130.065 Y123.591 E.05401
; OBJECT_ID: 394
; WIPE_START
G1 F8843.478
G1 X130.065 Y125.219 E-.61876
G1 X129.866 Y125.533 E-.14125
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X122.678 Y128.098 Z14 F42000
G1 X105.609 Y134.191 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5940
M204 S6000
G1 X105.609 Y121.81 E.41071
G1 X111.19 Y121.809 E.18514
G1 X111.191 Y134.19 E.41071
G1 X105.669 Y134.191 E.18317
M204 S10000
G1 X105.202 Y134.598 F42000
G1 F5940
M204 S6000
G1 X105.202 Y121.403 E.43772
G1 X111.597 Y121.402 E.21215
G1 X111.598 Y134.597 E.43772
G1 X105.262 Y134.598 E.21017
M204 S250
G1 X104.81 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5940
M204 S5000
G1 X104.811 Y121.184 E.41816
G3 X104.993 Y121.01 I.193 J.02 E.00841
G1 X111.837 Y121.015 E.21028
G3 X111.99 Y121.196 I-.041 J.189 E.00785
G1 X111.989 Y134.816 E.4185
G3 X111.809 Y134.99 I-.196 J-.023 E.00832
G1 X104.984 Y134.989 E.20971
G3 X104.818 Y134.852 I.021 J-.193 E.00699
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.817 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.335 Y131.565 Z14 F42000
G1 Z13.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5940
M204 S6000
G1 X106.335 Y133.194 E.05401
G3 X106.567 Y133.465 I-.322 J.511 E.01205
G1 X108.086 Y133.465 E.05039
G3 X107.535 Y132.914 I.614 J-1.166 E.02627
G3 X108.121 Y131.276 I2.089 J-.176 E.05951
G1 X109.021 Y130.621 E.03692
G1 X109.265 Y130.293 E.01356
G2 X108.679 Y128.655 I-2.089 J-.176 E.05951
G1 X107.779 Y128 E.03692
G1 X107.535 Y127.673 E.01356
G3 X108.121 Y126.035 I2.089 J-.176 E.05951
G1 X109.021 Y125.379 E.03692
G1 X109.265 Y125.052 E.01356
G2 X108.679 Y123.414 I-2.089 J-.176 E.05951
G1 X107.779 Y122.759 E.03692
G1 X107.612 Y122.535 E.00926
G1 X106.335 Y122.535 E.04238
G1 X106.335 Y122.711 E.00584
G3 X106.68 Y123.414 I-.624 J.743 E.02675
G1 X106.513 Y124.069 E.02243
G1 X106.335 Y124.326 E.01037
G1 X106.335 Y127.952 E.12029
G3 X106.68 Y128.655 I-.624 J.743 E.02675
G1 X106.513 Y129.31 E.02243
G1 X106.335 Y129.567 E.01037
G1 X106.335 Y131.196 E.05401
M204 S10000
G1 X110.669 Y133.828 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.383463
G1 F5940
M204 S6000
G1 X110.801 Y133.8 E.00374
G1 X110.828 Y133.669 E.00374
G1 X110.828 Y122.331 E.31461
G1 X110.8 Y122.199 E.00374
G1 X110.669 Y122.172 E.00374
G1 X106.131 Y122.172 E.12592
G1 X105.999 Y122.2 E.00374
G1 X105.972 Y122.331 E.00374
G1 X105.972 Y133.669 E.31461
G1 X105.999 Y133.801 E.00374
G1 X106.131 Y133.828 E.00374
G1 X110.609 Y133.828 E.12426
M204 S10000
G1 X110.063 Y133.465 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5940
M204 S6000
G1 X110.465 Y133.465 E.01334
G1 X110.465 Y132.239 E.04067
G3 X110.12 Y131.276 I1.536 J-1.094 E.03436
G1 X110.155 Y130.948 E.01093
G2 X110.465 Y130.46 I-.785 J-.84 E.0194
G1 X110.465 Y126.997 E.11486
G3 X110.12 Y126.035 I1.535 J-1.094 E.03435
G1 X110.155 Y125.707 E.01093
M73 P93 R1
G2 X110.465 Y125.219 I-.784 J-.84 E.01939
G1 X110.465 Y123.591 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 13.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X110.465 Y125.219 E-.61876
G1 X110.266 Y125.533 E-.14125
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 69/73
; update layer progress
M73 L69
M991 S0 P68 ;notify layer change
M106 S198.9
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z14 I-.296 J1.18 P1  F42000
G1 X144.809 Y134.191 Z14
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X144.809 Y121.81 E.41071
G1 X150.391 Y121.81 E.18516
G1 X150.391 Y134.19 E.41069
G1 X144.869 Y134.191 E.18317
M204 S10000
G1 X144.402 Y134.598 F42000
G1 F8843.478
M204 S6000
G1 X144.402 Y121.403 E.43771
G1 X150.798 Y121.403 E.21216
G1 X150.798 Y134.597 E.4377
G1 X144.462 Y134.598 E.21017
M204 S250
G1 X144.01 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X144.011 Y121.184 E.41815
G3 X144.191 Y121.01 I.193 J.02 E.00834
G1 X151.046 Y121.017 E.21064
G3 X151.19 Y121.211 I-.051 J.188 E.008
G1 X151.182 Y134.853 E.41918
G3 X151.007 Y134.99 I-.185 J-.056 E.00729
G1 X144.147 Y134.982 E.21077
G3 X144.018 Y134.853 I.056 J-.185 E.00586
; WIPE_START
M204 S6000
G1 X144.017 Y132.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 69 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z14.2
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer69 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X149.417 Y134.023 F42000
G1 Z13.8
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40585
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X150.021 Y133.193 E.05413
G1 X150.021 Y132.419 E.04081
G1 X149 Y133.821 E.09142
G1 X148.436 Y133.821 E.02973
G1 X150.021 Y131.644 E.14191
G1 X150.021 Y130.87 E.04081
G1 X147.872 Y133.821 E.1924
G1 X147.308 Y133.821 E.02973
G1 X150.021 Y130.096 E.2429
G1 X150.021 Y129.322 E.04081
G1 X146.744 Y133.821 E.29339
G1 X146.18 Y133.821 E.02973
G1 X150.021 Y128.547 E.34388
G1 X150.021 Y127.773 E.04081
G1 X145.616 Y133.821 E.39437
G1 X145.179 Y133.821 E.02306
G1 X145.179 Y133.647 E.00916
G1 X150.021 Y126.999 E.43354
G1 X150.021 Y126.224 E.04081
G1 X145.179 Y132.873 E.43354
G1 X145.179 Y132.099 E.04081
G1 X150.021 Y125.45 E.43354
G1 X150.021 Y124.676 E.04081
G1 X145.179 Y131.324 E.43354
G1 X145.179 Y130.55 E.04081
G1 X150.021 Y123.901 E.43354
G1 X150.021 Y123.127 E.04081
G1 X145.179 Y129.776 E.43354
G1 X145.179 Y129.001 E.04081
G1 X150.021 Y122.353 E.43354
G1 X150.021 Y122.179 E.00914
G1 X149.583 Y122.179 E.02307
G1 X145.179 Y128.227 E.39435
G1 X145.179 Y127.453 E.04081
G1 X149.02 Y122.179 E.34386
G1 X148.456 Y122.179 E.02972
G1 X145.179 Y126.679 E.29337
G1 X145.179 Y125.904 E.04081
G1 X147.892 Y122.179 E.24288
G1 X147.328 Y122.179 E.02972
G1 X145.179 Y125.13 E.19239
G1 X145.179 Y124.356 E.04081
G1 X146.764 Y122.179 E.1419
G1 X146.2 Y122.179 E.02972
G1 X145.179 Y123.581 E.09141
G1 X145.179 Y122.807 E.04081
G1 X145.783 Y121.977 E.05412
M106 S198.9
; OBJECT_ID: 405
; WIPE_START
G1 X145.179 Y122.807 E-.39021
G1 X145.179 Y123.581 E-.29424
G1 X145.296 Y123.421 E-.07555
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X138.569 Y127.027 Z14.2 F42000
G1 X125.209 Y134.191 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8843.478
M204 S6000
G1 X125.209 Y121.81 E.41071
G1 X130.791 Y121.81 E.18516
G1 X130.791 Y134.19 E.41069
G1 X125.269 Y134.191 E.18317
M204 S10000
G1 X124.802 Y134.598 F42000
G1 F8843.478
M204 S6000
G1 X124.802 Y121.403 E.43771
G1 X131.198 Y121.403 E.21216
G1 X131.198 Y134.597 E.4377
G1 X124.862 Y134.598 E.21017
M204 S250
G1 X124.41 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X124.411 Y121.184 E.41815
G3 X124.591 Y121.01 I.193 J.02 E.00834
G1 X131.446 Y121.017 E.21064
G3 X131.59 Y121.211 I-.051 J.188 E.008
G1 X131.582 Y134.853 E.41918
G3 X131.407 Y134.99 I-.185 J-.056 E.00729
G1 X124.547 Y134.982 E.21077
G3 X124.418 Y134.853 I.056 J-.185 E.00586
; WIPE_START
M204 S6000
G1 X124.417 Y132.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.817 Y134.023 Z14.2 F42000
G1 Z13.8
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40585
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X130.421 Y133.193 E.05413
G1 X130.421 Y132.419 E.04081
G1 X129.4 Y133.821 E.09142
G1 X128.836 Y133.821 E.02973
G1 X130.421 Y131.644 E.14191
G1 X130.421 Y130.87 E.04081
G1 X128.272 Y133.821 E.1924
G1 X127.708 Y133.821 E.02973
G1 X130.421 Y130.096 E.2429
G1 X130.421 Y129.322 E.04081
G1 X127.144 Y133.821 E.29339
G1 X126.58 Y133.821 E.02973
G1 X130.421 Y128.547 E.34388
G1 X130.421 Y127.773 E.04081
G1 X126.016 Y133.821 E.39437
G1 X125.579 Y133.821 E.02306
G1 X125.579 Y133.647 E.00916
G1 X130.421 Y126.999 E.43354
G1 X130.421 Y126.224 E.04081
G1 X125.579 Y132.873 E.43354
G1 X125.579 Y132.099 E.04081
G1 X130.421 Y125.45 E.43354
G1 X130.421 Y124.676 E.04081
G1 X125.579 Y131.324 E.43354
G1 X125.579 Y130.55 E.04081
G1 X130.421 Y123.901 E.43354
G1 X130.421 Y123.127 E.04081
G1 X125.579 Y129.776 E.43354
G1 X125.579 Y129.001 E.04081
G1 X130.421 Y122.353 E.43354
G1 X130.421 Y122.179 E.00914
G1 X129.983 Y122.179 E.02307
G1 X125.579 Y128.227 E.39435
G1 X125.579 Y127.453 E.04081
G1 X129.42 Y122.179 E.34386
G1 X128.856 Y122.179 E.02972
G1 X125.579 Y126.679 E.29337
G1 X125.579 Y125.904 E.04081
G1 X128.292 Y122.179 E.24288
G1 X127.728 Y122.179 E.02972
G1 X125.579 Y125.13 E.19239
G1 X125.579 Y124.356 E.04081
G1 X127.164 Y122.179 E.1419
G1 X126.6 Y122.179 E.02972
G1 X125.579 Y123.581 E.09141
G1 X125.579 Y122.807 E.04081
G1 X126.183 Y121.977 E.05412
M106 S198.9
; OBJECT_ID: 394
; WIPE_START
G1 X125.579 Y122.807 E-.39021
G1 X125.579 Y123.581 E-.29424
G1 X125.696 Y123.421 E-.07555
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X118.969 Y127.027 Z14.2 F42000
G1 X105.609 Y134.191 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8843.478
M204 S6000
G1 X105.609 Y121.81 E.41071
G1 X111.191 Y121.81 E.18516
G1 X111.191 Y134.19 E.41069
G1 X105.669 Y134.191 E.18317
M204 S10000
G1 X105.202 Y134.598 F42000
G1 F8843.478
M204 S6000
G1 X105.202 Y121.403 E.43771
G1 X111.598 Y121.403 E.21216
G1 X111.598 Y134.597 E.4377
G1 X105.262 Y134.598 E.21017
M204 S250
G1 X104.81 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X104.811 Y121.184 E.41815
G3 X104.991 Y121.01 I.193 J.02 E.00834
G1 X111.846 Y121.017 E.21064
G3 X111.99 Y121.211 I-.051 J.188 E.008
G1 X111.982 Y134.853 E.41918
G3 X111.807 Y134.99 I-.185 J-.056 E.00729
G1 X104.947 Y134.982 E.21077
G3 X104.818 Y134.853 I.056 J-.185 E.00586
; WIPE_START
M204 S6000
G1 X104.817 Y132.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.217 Y134.023 Z14.2 F42000
G1 Z13.8
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40585
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X110.821 Y133.193 E.05413
G1 X110.821 Y132.419 E.04081
G1 X109.8 Y133.821 E.09142
G1 X109.236 Y133.821 E.02973
G1 X110.821 Y131.644 E.14191
G1 X110.821 Y130.87 E.04081
G1 X108.672 Y133.821 E.1924
G1 X108.108 Y133.821 E.02973
G1 X110.821 Y130.096 E.2429
G1 X110.821 Y129.322 E.04081
G1 X107.544 Y133.821 E.29339
G1 X106.98 Y133.821 E.02973
G1 X110.821 Y128.547 E.34388
G1 X110.821 Y127.773 E.04081
G1 X106.416 Y133.821 E.39437
G1 X105.979 Y133.821 E.02306
G1 X105.979 Y133.647 E.00916
G1 X110.821 Y126.999 E.43354
G1 X110.821 Y126.224 E.04081
G1 X105.979 Y132.873 E.43354
G1 X105.979 Y132.099 E.04081
G1 X110.821 Y125.45 E.43354
G1 X110.821 Y124.676 E.04081
G1 X105.979 Y131.324 E.43354
G1 X105.979 Y130.55 E.04081
G1 X110.821 Y123.901 E.43354
G1 X110.821 Y123.127 E.04081
G1 X105.979 Y129.776 E.43354
G1 X105.979 Y129.001 E.04081
G1 X110.821 Y122.353 E.43354
G1 X110.821 Y122.179 E.00914
G1 X110.383 Y122.179 E.02307
G1 X105.979 Y128.227 E.39435
G1 X105.979 Y127.453 E.04081
G1 X109.82 Y122.179 E.34386
G1 X109.256 Y122.179 E.02972
G1 X105.979 Y126.679 E.29337
G1 X105.979 Y125.904 E.04081
G1 X108.692 Y122.179 E.24288
G1 X108.128 Y122.179 E.02972
G1 X105.979 Y125.13 E.19239
G1 X105.979 Y124.356 E.04081
G1 X107.564 Y122.179 E.1419
G1 X107 Y122.179 E.02972
G1 X105.979 Y123.581 E.09141
G1 X105.979 Y122.807 E.04081
G1 X106.583 Y121.977 E.05412
M106 S198.9
; CHANGE_LAYER
; Z_HEIGHT: 14
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
G1 X105.979 Y122.807 E-.39021
G1 X105.979 Y123.581 E-.29424
G1 X106.096 Y123.421 E-.07555
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 70/73
; update layer progress
M73 L70
M991 S0 P69 ;notify layer change
M106 S201.45
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z14.2 I-.326 J1.172 P1  F42000
G1 X144.809 Y134.184 Z14.2
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X144.809 Y121.816 E.41028
G1 X150.39 Y121.816 E.18514
G1 X150.391 Y134.184 E.41027
G1 X144.869 Y134.184 E.18317
M204 S10000
G1 X144.402 Y134.591 F42000
G1 F8843.478
M204 S6000
G1 X144.402 Y121.409 E.43728
G1 X150.797 Y121.409 E.21215
G1 X150.798 Y134.591 E.43728
G1 X144.462 Y134.591 E.21017
M204 S250
G1 X144.01 Y134.78 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9060
M204 S5000
G1 X144.011 Y121.195 E.41742
G3 X144.193 Y121.017 I.194 J.016 E.00854
G1 X151.036 Y121.021 E.21024
G3 X151.19 Y121.208 I-.042 J.192 E.00801
G1 X151.189 Y134.805 E.41782
G3 X151.007 Y134.983 I-.194 J-.017 E.0085
M73 P94 R1
G1 X144.184 Y134.982 E.20966
G3 X144.018 Y134.839 I.025 J-.198 E.00714
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.017 Y132.839 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 70 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z14.4
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer70 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X147.762 Y124.607 F42000
G1 Z14
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.367714
G1 F9060
M204 S6000
G1 X147.762 Y124.444 E.0043
G1 X147.437 Y124.444 E.0086
G1 X147.438 Y131.556 E.18822
G1 X147.762 Y131.556 E.0086
G1 X147.762 Y124.667 E.18233
M204 S10000
G1 X148.113 Y124.607 F42000
; LINE_WIDTH: 0.41999
G1 F9060
M204 S6000
G1 X148.113 Y124.093 E.01577
G1 X147.087 Y124.093 E.03154
G1 X147.087 Y131.907 E.24007
G1 X148.113 Y131.907 E.03155
G1 X148.113 Y124.667 E.22246
M204 S10000
G1 X148.49 Y124.607 F42000
G1 F9060
M204 S6000
G1 X148.49 Y123.716 E.02736
G1 X146.709 Y123.716 E.05471
G1 X146.709 Y132.284 E.26325
G1 X148.49 Y132.284 E.05472
G1 X148.49 Y124.667 E.23404
M204 S10000
G1 X148.867 Y124.607 F42000
G1 F9060
M204 S6000
G1 X148.867 Y123.339 E.03894
G1 X146.332 Y123.339 E.07789
G1 X146.332 Y132.661 E.28642
G1 X148.868 Y132.661 E.07789
G1 X148.867 Y124.667 E.24563
M204 S10000
G1 X149.244 Y124.607 F42000
G1 F9060
M204 S6000
G1 X149.244 Y122.962 E.05053
G1 X145.955 Y122.962 E.10106
G1 X145.955 Y133.038 E.30959
G1 X149.245 Y133.038 E.10107
G1 X149.244 Y124.667 E.25722
M204 S10000
G1 X149.621 Y124.607 F42000
G1 F9060
M204 S6000
G1 X149.621 Y122.585 E.06212
G1 X145.578 Y122.585 E.12423
G1 X145.578 Y133.415 E.33276
G1 X149.622 Y133.415 E.12424
G1 X149.621 Y124.667 E.2688
M204 S10000
G1 X149.998 Y124.607 F42000
G1 F9060
M204 S6000
G1 X149.998 Y122.208 E.0737
G1 X145.201 Y122.208 E.1474
G1 X145.201 Y133.792 E.35594
G1 X149.999 Y133.792 E.14741
G1 X149.998 Y124.667 E.28039
; OBJECT_ID: 405
; WIPE_START
G1 F9547.299
G1 X149.999 Y126.667 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X142.695 Y128.882 Z14.4 F42000
G1 X125.209 Y134.184 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X125.209 Y121.816 E.41028
G1 X130.79 Y121.816 E.18514
G1 X130.791 Y134.184 E.41027
G1 X125.269 Y134.184 E.18317
M204 S10000
G1 X124.802 Y134.591 F42000
G1 F8843.478
M204 S6000
G1 X124.802 Y121.409 E.43728
G1 X131.197 Y121.409 E.21215
G1 X131.198 Y134.591 E.43728
G1 X124.862 Y134.591 E.21017
M204 S250
G1 X124.41 Y134.78 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9060
M204 S5000
G1 X124.411 Y121.195 E.41742
G3 X124.593 Y121.017 I.194 J.016 E.00854
G1 X131.436 Y121.021 E.21024
G3 X131.59 Y121.208 I-.042 J.192 E.00801
G1 X131.589 Y134.805 E.41782
G3 X131.407 Y134.983 I-.194 J-.017 E.0085
G1 X124.584 Y134.982 E.20966
G3 X124.418 Y134.839 I.026 J-.198 E.00714
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.417 Y132.839 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.577 Y125.892 Z14.4 F42000
G1 X128.162 Y124.607 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.367714
G1 F9060
M204 S6000
G1 X128.162 Y124.444 E.0043
G1 X127.837 Y124.444 E.0086
G1 X127.838 Y131.556 E.18822
G1 X128.162 Y131.556 E.0086
G1 X128.162 Y124.667 E.18233
M204 S10000
G1 X128.513 Y124.607 F42000
; LINE_WIDTH: 0.41999
G1 F9060
M204 S6000
G1 X128.513 Y124.093 E.01577
G1 X127.487 Y124.093 E.03154
G1 X127.487 Y131.907 E.24007
G1 X128.513 Y131.907 E.03155
G1 X128.513 Y124.667 E.22246
M204 S10000
G1 X128.89 Y124.607 F42000
G1 F9060
M204 S6000
G1 X128.89 Y123.716 E.02736
G1 X127.109 Y123.716 E.05471
G1 X127.109 Y132.284 E.26325
G1 X128.89 Y132.284 E.05472
G1 X128.89 Y124.667 E.23404
M204 S10000
G1 X129.267 Y124.607 F42000
G1 F9060
M204 S6000
G1 X129.267 Y123.339 E.03894
G1 X126.732 Y123.339 E.07789
G1 X126.732 Y132.661 E.28642
G1 X129.268 Y132.661 E.07789
G1 X129.267 Y124.667 E.24563
M204 S10000
G1 X129.644 Y124.607 F42000
G1 F9060
M204 S6000
G1 X129.644 Y122.962 E.05053
G1 X126.355 Y122.962 E.10106
G1 X126.355 Y133.038 E.30959
G1 X129.645 Y133.038 E.10107
G1 X129.644 Y124.667 E.25722
M204 S10000
G1 X130.021 Y124.607 F42000
G1 F9060
M204 S6000
G1 X130.021 Y122.585 E.06212
G1 X125.978 Y122.585 E.12423
G1 X125.978 Y133.415 E.33276
G1 X130.022 Y133.415 E.12424
G1 X130.021 Y124.667 E.2688
M204 S10000
G1 X130.398 Y124.607 F42000
G1 F9060
M204 S6000
G1 X130.398 Y122.208 E.0737
G1 X125.601 Y122.208 E.1474
G1 X125.601 Y133.792 E.35594
G1 X130.399 Y133.792 E.14741
G1 X130.398 Y124.667 E.28039
; OBJECT_ID: 394
; WIPE_START
G1 F9547.299
G1 X130.399 Y126.667 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X123.095 Y128.882 Z14.4 F42000
G1 X105.609 Y134.184 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X105.609 Y121.816 E.41028
G1 X111.19 Y121.816 E.18514
G1 X111.191 Y134.184 E.41027
G1 X105.669 Y134.184 E.18317
M204 S10000
G1 X105.202 Y134.591 F42000
G1 F8843.478
M204 S6000
G1 X105.202 Y121.409 E.43728
G1 X111.597 Y121.409 E.21215
G1 X111.598 Y134.591 E.43728
G1 X105.262 Y134.591 E.21017
M204 S250
G1 X104.81 Y134.78 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9060
M204 S5000
G1 X104.811 Y121.195 E.41742
G3 X104.993 Y121.017 I.194 J.016 E.00854
G1 X111.836 Y121.021 E.21024
G3 X111.99 Y121.208 I-.042 J.192 E.00801
G1 X111.989 Y134.805 E.41782
G3 X111.807 Y134.983 I-.194 J-.017 E.0085
G1 X104.984 Y134.982 E.20966
G3 X104.818 Y134.839 I.026 J-.198 E.00714
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.817 Y132.839 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.977 Y125.892 Z14.4 F42000
G1 X108.562 Y124.607 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.367714
G1 F9060
M204 S6000
G1 X108.562 Y124.444 E.0043
G1 X108.237 Y124.444 E.0086
G1 X108.238 Y131.556 E.18822
G1 X108.562 Y131.556 E.0086
G1 X108.562 Y124.667 E.18233
M204 S10000
G1 X108.913 Y124.607 F42000
; LINE_WIDTH: 0.41999
G1 F9060
M204 S6000
G1 X108.913 Y124.093 E.01577
G1 X107.887 Y124.093 E.03154
G1 X107.887 Y131.907 E.24007
G1 X108.913 Y131.907 E.03155
G1 X108.913 Y124.667 E.22246
M204 S10000
G1 X109.29 Y124.607 F42000
G1 F9060
M204 S6000
G1 X109.29 Y123.716 E.02736
G1 X107.509 Y123.716 E.05471
G1 X107.509 Y132.284 E.26325
G1 X109.29 Y132.284 E.05472
G1 X109.29 Y124.667 E.23404
M204 S10000
G1 X109.667 Y124.607 F42000
G1 F9060
M204 S6000
G1 X109.667 Y123.339 E.03894
G1 X107.132 Y123.339 E.07789
G1 X107.132 Y132.661 E.28642
G1 X109.668 Y132.661 E.07789
G1 X109.667 Y124.667 E.24563
M204 S10000
G1 X110.044 Y124.607 F42000
G1 F9060
M204 S6000
G1 X110.044 Y122.962 E.05053
G1 X106.755 Y122.962 E.10106
G1 X106.755 Y133.038 E.30959
G1 X110.045 Y133.038 E.10107
G1 X110.044 Y124.667 E.25722
M204 S10000
G1 X110.421 Y124.607 F42000
G1 F9060
M204 S6000
G1 X110.421 Y122.585 E.06212
G1 X106.378 Y122.585 E.12423
G1 X106.378 Y133.415 E.33276
G1 X110.422 Y133.415 E.12424
G1 X110.421 Y124.667 E.2688
M204 S10000
G1 X110.798 Y124.607 F42000
G1 F9060
M204 S6000
G1 X110.798 Y122.208 E.0737
M73 P95 R1
G1 X106.001 Y122.208 E.1474
G1 X106.001 Y133.792 E.35594
G1 X110.799 Y133.792 E.14741
G1 X110.798 Y124.667 E.28039
; CHANGE_LAYER
; Z_HEIGHT: 14.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X110.799 Y126.667 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 71/73
; update layer progress
M73 L71
M991 S0 P70 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z14.4 I-.261 J1.189 P1  F42000
G1 X144.809 Y134.132 Z14.4
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X144.809 Y121.868 E.40683
G1 X150.39 Y121.868 E.18514
G1 X150.391 Y134.132 E.40682
G1 X144.869 Y134.132 E.18317
M204 S10000
G1 X144.402 Y134.539 F42000
G1 F8843.478
M204 S6000
G1 X144.402 Y121.461 E.43383
G1 X150.797 Y121.461 E.21215
G1 X150.798 Y134.539 E.43383
G1 X144.462 Y134.539 E.21017
M204 S250
G1 X144.014 Y134.761 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8894
M204 S5000
G3 X144.01 Y134.659 I.228 J-.059 E.00315
G1 X144.01 Y121.34 E.40927
G3 X144.194 Y121.069 I.222 J-.047 E.01125
G1 X151.033 Y121.073 E.21014
G3 X151.19 Y121.316 I-.072 J.218 E.00961
G1 X151.19 Y134.66 E.41002
G3 X151.006 Y134.931 I-.222 J.047 E.01125
G1 X144.186 Y134.93 E.20957
G3 X144.036 Y134.817 I.056 J-.229 E.00593
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.01 Y134.659 E-.06077
G1 X144.01 Y132.819 E-.69923
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 71 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z14.6
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer71 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X147.762 Y124.659 F42000
G1 Z14.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.367714
G1 F8894
M204 S6000
G1 X147.762 Y124.496 E.0043
G1 X147.437 Y124.496 E.0086
G1 X147.438 Y131.504 E.18546
G1 X147.762 Y131.504 E.0086
G1 X147.762 Y124.719 E.17958
M204 S10000
G1 X148.113 Y124.659 F42000
; LINE_WIDTH: 0.41999
G1 F8894
M204 S6000
G1 X148.113 Y124.145 E.01577
G1 X147.087 Y124.145 E.03154
G1 X147.087 Y131.855 E.23688
G1 X148.113 Y131.855 E.03155
G1 X148.113 Y124.719 E.21926
M204 S10000
G1 X148.49 Y124.659 F42000
G1 F8894
M204 S6000
G1 X148.49 Y123.768 E.02736
G1 X146.709 Y123.768 E.05471
G1 X146.709 Y132.232 E.26005
G1 X148.49 Y132.232 E.05472
G1 X148.49 Y124.719 E.23085
M204 S10000
G1 X148.867 Y124.659 F42000
G1 F8894
M204 S6000
G1 X148.867 Y123.391 E.03894
G1 X146.332 Y123.391 E.07789
G1 X146.332 Y132.609 E.28322
G1 X148.868 Y132.609 E.07789
G1 X148.867 Y124.719 E.24243
M204 S10000
G1 X149.244 Y124.659 F42000
G1 F8894
M204 S6000
G1 X149.244 Y123.014 E.05053
G1 X145.955 Y123.014 E.10106
G1 X145.955 Y132.986 E.3064
G1 X149.245 Y132.986 E.10107
G1 X149.244 Y124.719 E.25402
M204 S10000
G1 X149.621 Y124.659 F42000
G1 F8894
M204 S6000
G1 X149.621 Y122.637 E.06212
G1 X145.578 Y122.637 E.12423
G1 X145.578 Y133.363 E.32957
G1 X149.622 Y133.363 E.12424
G1 X149.621 Y124.719 E.26561
M204 S10000
G1 X149.998 Y124.659 F42000
G1 F8894
M204 S6000
G1 X149.998 Y122.26 E.0737
G1 X145.201 Y122.26 E.1474
G1 X145.201 Y133.74 E.35274
G1 X149.999 Y133.74 E.14741
G1 X149.998 Y124.719 E.27719
; OBJECT_ID: 405
; WIPE_START
G1 F9547.299
G1 X149.999 Y126.719 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X142.686 Y128.905 Z14.6 F42000
G1 X125.209 Y134.132 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X125.209 Y121.868 E.40683
G1 X130.79 Y121.868 E.18514
G1 X130.791 Y134.132 E.40682
G1 X125.269 Y134.132 E.18317
M204 S10000
G1 X124.802 Y134.539 F42000
G1 F8843.478
M204 S6000
G1 X124.802 Y121.461 E.43383
G1 X131.197 Y121.461 E.21215
G1 X131.198 Y134.539 E.43383
G1 X124.862 Y134.539 E.21017
M204 S250
G1 X124.414 Y134.761 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8894
M204 S5000
G3 X124.41 Y134.659 I.228 J-.059 E.00315
G1 X124.41 Y121.34 E.40927
G3 X124.594 Y121.069 I.222 J-.047 E.01125
G1 X131.433 Y121.073 E.21014
G3 X131.59 Y121.316 I-.072 J.218 E.00961
G1 X131.59 Y134.66 E.41002
G3 X131.406 Y134.931 I-.222 J.047 E.01125
G1 X124.586 Y134.93 E.20957
G3 X124.436 Y134.817 I.056 J-.229 E.00593
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.41 Y134.659 E-.06077
G1 X124.41 Y132.819 E-.69923
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.599 Y125.885 Z14.6 F42000
G1 X128.162 Y124.659 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.367714
G1 F8894
M204 S6000
G1 X128.162 Y124.496 E.0043
G1 X127.837 Y124.496 E.0086
G1 X127.838 Y131.504 E.18546
G1 X128.162 Y131.504 E.0086
G1 X128.162 Y124.719 E.17958
M204 S10000
G1 X128.513 Y124.659 F42000
; LINE_WIDTH: 0.41999
G1 F8894
M204 S6000
G1 X128.513 Y124.145 E.01577
G1 X127.487 Y124.145 E.03154
G1 X127.487 Y131.855 E.23688
G1 X128.513 Y131.855 E.03155
G1 X128.513 Y124.719 E.21926
M204 S10000
G1 X128.89 Y124.659 F42000
G1 F8894
M204 S6000
G1 X128.89 Y123.768 E.02736
G1 X127.109 Y123.768 E.05471
G1 X127.109 Y132.232 E.26005
G1 X128.89 Y132.232 E.05472
G1 X128.89 Y124.719 E.23085
M204 S10000
G1 X129.267 Y124.659 F42000
G1 F8894
M204 S6000
G1 X129.267 Y123.391 E.03894
G1 X126.732 Y123.391 E.07789
G1 X126.732 Y132.609 E.28322
G1 X129.268 Y132.609 E.07789
G1 X129.267 Y124.719 E.24243
M204 S10000
G1 X129.644 Y124.659 F42000
G1 F8894
M204 S6000
G1 X129.644 Y123.014 E.05053
G1 X126.355 Y123.014 E.10106
G1 X126.355 Y132.986 E.3064
G1 X129.645 Y132.986 E.10107
G1 X129.644 Y124.719 E.25402
M204 S10000
M73 P95 R0
G1 X130.021 Y124.659 F42000
G1 F8894
M204 S6000
G1 X130.021 Y122.637 E.06212
G1 X125.978 Y122.637 E.12423
G1 X125.978 Y133.363 E.32957
G1 X130.022 Y133.363 E.12424
G1 X130.021 Y124.719 E.26561
M204 S10000
G1 X130.398 Y124.659 F42000
G1 F8894
M204 S6000
G1 X130.398 Y122.26 E.0737
G1 X125.601 Y122.26 E.1474
G1 X125.601 Y133.74 E.35274
G1 X130.399 Y133.74 E.14741
G1 X130.398 Y124.719 E.27719
; OBJECT_ID: 394
; WIPE_START
G1 F9547.299
G1 X130.399 Y126.719 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X123.086 Y128.905 Z14.6 F42000
G1 X105.609 Y134.132 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X105.609 Y121.868 E.40683
G1 X111.19 Y121.868 E.18514
G1 X111.191 Y134.132 E.40682
G1 X105.669 Y134.132 E.18317
M204 S10000
G1 X105.202 Y134.539 F42000
G1 F8843.478
M204 S6000
G1 X105.202 Y121.461 E.43383
G1 X111.597 Y121.461 E.21215
G1 X111.598 Y134.539 E.43383
G1 X105.262 Y134.539 E.21017
M204 S250
G1 X104.814 Y134.761 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8894
M204 S5000
G3 X104.81 Y134.659 I.228 J-.059 E.00315
G1 X104.81 Y121.34 E.40927
G3 X104.994 Y121.069 I.222 J-.047 E.01125
G1 X111.833 Y121.073 E.21014
G3 X111.99 Y121.316 I-.072 J.218 E.00961
G1 X111.99 Y134.66 E.41002
G3 X111.806 Y134.931 I-.222 J.047 E.01125
G1 X104.986 Y134.93 E.20957
G3 X104.836 Y134.817 I.056 J-.229 E.00593
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.81 Y134.659 E-.06077
G1 X104.81 Y132.819 E-.69923
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.999 Y125.885 Z14.6 F42000
G1 X108.562 Y124.659 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.367714
G1 F8894
M204 S6000
G1 X108.562 Y124.496 E.0043
G1 X108.237 Y124.496 E.0086
G1 X108.238 Y131.504 E.18546
G1 X108.562 Y131.504 E.0086
G1 X108.562 Y124.719 E.17958
M204 S10000
G1 X108.913 Y124.659 F42000
; LINE_WIDTH: 0.41999
G1 F8894
M204 S6000
G1 X108.913 Y124.145 E.01577
G1 X107.887 Y124.145 E.03154
G1 X107.887 Y131.855 E.23688
G1 X108.913 Y131.855 E.03155
G1 X108.913 Y124.719 E.21926
M204 S10000
G1 X109.29 Y124.659 F42000
G1 F8894
M204 S6000
G1 X109.29 Y123.768 E.02736
G1 X107.509 Y123.768 E.05471
G1 X107.509 Y132.232 E.26005
G1 X109.29 Y132.232 E.05472
G1 X109.29 Y124.719 E.23085
M204 S10000
G1 X109.667 Y124.659 F42000
G1 F8894
M204 S6000
G1 X109.667 Y123.391 E.03894
G1 X107.132 Y123.391 E.07789
G1 X107.132 Y132.609 E.28322
G1 X109.668 Y132.609 E.07789
G1 X109.667 Y124.719 E.24243
M204 S10000
G1 X110.044 Y124.659 F42000
G1 F8894
M204 S6000
G1 X110.044 Y123.014 E.05053
G1 X106.755 Y123.014 E.10106
G1 X106.755 Y132.986 E.3064
G1 X110.045 Y132.986 E.10107
G1 X110.044 Y124.719 E.25402
M204 S10000
G1 X110.421 Y124.659 F42000
G1 F8894
M204 S6000
G1 X110.421 Y122.637 E.06212
G1 X106.378 Y122.637 E.12423
G1 X106.378 Y133.363 E.32957
G1 X110.422 Y133.363 E.12424
G1 X110.421 Y124.719 E.26561
M204 S10000
G1 X110.798 Y124.659 F42000
G1 F8894
M204 S6000
G1 X110.798 Y122.26 E.0737
G1 X106.001 Y122.26 E.1474
G1 X106.001 Y133.74 E.35274
G1 X110.799 Y133.74 E.14741
G1 X110.798 Y124.719 E.27719
; CHANGE_LAYER
; Z_HEIGHT: 14.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X110.799 Y126.719 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 72/73
; update layer progress
M73 L72
M991 S0 P71 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z14.6 I-.255 J1.19 P1  F42000
G1 X144.822 Y134.015 Z14.6
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8710
M204 S6000
G1 X144.822 Y121.985 E.39906
G1 X150.377 Y121.985 E.18429
G1 X150.378 Y134.015 E.39906
G1 X144.882 Y134.015 E.18231
M204 S10000
G1 X144.415 Y134.422 F42000
M73 P96 R0
G1 F8710
M204 S6000
G1 X144.415 Y121.578 E.42607
G1 X150.784 Y121.578 E.21129
G1 X150.785 Y134.422 E.42607
G1 X144.475 Y134.422 E.20932
M204 S250
G1 X144.065 Y134.711 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8710
M204 S5000
G3 X144.038 Y134.6 I.182 J-.103 E.00356
G3 X144.023 Y134.42 I1.124 J-.182 E.00556
G1 X144.023 Y121.604 E.3938
G3 X144.131 Y121.211 I.539 J-.063 E.01286
G1 X144.206 Y121.186 E.00241
G1 X151.031 Y121.191 E.20973
G1 X151.095 Y121.235 E.00236
G3 X151.177 Y121.558 I-.429 J.281 E.01043
G1 X151.177 Y134.396 E.39448
G3 X151.055 Y134.798 I-.509 J.065 E.01332
G1 X150.99 Y134.814 E.00204
G1 X144.213 Y134.814 E.20825
G3 X144.102 Y134.759 I.033 J-.206 E.00388
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.038 Y134.6 E-.06491
G1 X144.023 Y134.42 E-.06871
G1 X144.023 Y132.772 E-.62638
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 72 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z14.8
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer72 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X149.986 Y124.763 F42000
G1 Z14.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F8710
M204 S6000
G1 X149.985 Y122.377 E.0733
G1 X145.214 Y122.377 E.14661
G1 X145.214 Y133.623 E.34555
G1 X149.986 Y133.623 E.14662
G1 X149.986 Y124.823 E.2704
M204 S10000
G1 X149.608 Y124.763 F42000
G1 F8710
M204 S6000
G1 X149.608 Y122.754 E.06172
G1 X145.591 Y122.754 E.12344
G1 X145.591 Y133.246 E.32238
G1 X149.609 Y133.246 E.12345
G1 X149.608 Y124.823 E.25882
M204 S10000
G1 X149.231 Y124.763 F42000
G1 F8710
M204 S6000
G1 X149.231 Y123.131 E.05013
G1 X145.968 Y123.131 E.10027
G1 X145.968 Y132.869 E.29921
G1 X149.232 Y132.869 E.10028
G1 X149.231 Y124.823 E.24723
M204 S10000
G1 X148.854 Y124.763 F42000
G1 F8710
M204 S6000
G1 X148.854 Y123.508 E.03855
G1 X146.345 Y123.508 E.07709
G1 X146.345 Y132.492 E.27603
G1 X148.855 Y132.492 E.07711
G1 X148.854 Y124.823 E.23564
M204 S10000
G1 X148.477 Y124.763 F42000
G1 F8710
M204 S6000
G1 X148.477 Y123.885 E.02696
G1 X146.722 Y123.885 E.05392
G1 X146.722 Y132.115 E.25286
G1 X148.478 Y132.115 E.05393
G1 X148.477 Y124.823 E.22406
M204 S10000
G1 X148.1 Y124.763 F42000
G1 F8710
M204 S6000
G1 X148.1 Y124.262 E.01538
G1 X147.099 Y124.262 E.03075
G1 X147.099 Y131.738 E.22969
G1 X148.101 Y131.738 E.03076
G1 X148.1 Y124.823 E.21247
M204 S10000
G1 X147.756 Y124.763 F42000
; LINE_WIDTH: 0.354859
G1 F8710
M204 S6000
G1 X147.756 Y124.607 E.00396
G1 X147.444 Y124.607 E.00793
G1 X147.444 Y131.393 E.1725
G1 X147.756 Y131.393 E.00793
G1 X147.756 Y124.823 E.16701
; OBJECT_ID: 405
; WIPE_START
G1 F11540.738
G1 X147.756 Y126.823 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X140.485 Y129.144 Z14.8 F42000
G1 X125.222 Y134.015 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8710
M204 S6000
G1 X125.222 Y121.985 E.39906
G1 X130.777 Y121.985 E.18429
G1 X130.778 Y134.015 E.39906
G1 X125.282 Y134.015 E.18231
M204 S10000
G1 X124.815 Y134.422 F42000
G1 F8710
M204 S6000
G1 X124.815 Y121.578 E.42607
G1 X131.184 Y121.578 E.21129
G1 X131.185 Y134.422 E.42607
G1 X124.875 Y134.422 E.20932
M204 S250
G1 X124.465 Y134.711 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8710
M204 S5000
G3 X124.438 Y134.6 I.182 J-.103 E.00356
G3 X124.423 Y134.42 I1.124 J-.182 E.00556
G1 X124.423 Y121.604 E.3938
G3 X124.531 Y121.211 I.539 J-.063 E.01286
G1 X124.606 Y121.186 E.00241
G1 X131.431 Y121.191 E.20973
G1 X131.495 Y121.235 E.00236
G3 X131.577 Y121.558 I-.429 J.281 E.01043
G1 X131.577 Y134.396 E.39448
G3 X131.455 Y134.798 I-.509 J.065 E.01332
G1 X131.39 Y134.814 E.00204
G1 X124.613 Y134.814 E.20825
G3 X124.502 Y134.759 I.033 J-.206 E.00388
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.438 Y134.6 E-.06491
G1 X124.423 Y134.42 E-.06871
G1 X124.423 Y132.772 E-.62638
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.981 Y126.65 Z14.8 F42000
G1 X130.386 Y124.763 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F8710
M204 S6000
G1 X130.385 Y122.377 E.0733
G1 X125.614 Y122.377 E.14661
G1 X125.614 Y133.623 E.34555
G1 X130.386 Y133.623 E.14662
G1 X130.386 Y124.823 E.2704
M204 S10000
G1 X130.008 Y124.763 F42000
G1 F8710
M204 S6000
G1 X130.008 Y122.754 E.06172
G1 X125.991 Y122.754 E.12344
G1 X125.991 Y133.246 E.32238
G1 X130.009 Y133.246 E.12345
G1 X130.008 Y124.823 E.25882
M204 S10000
G1 X129.631 Y124.763 F42000
G1 F8710
M204 S6000
G1 X129.631 Y123.131 E.05013
G1 X126.368 Y123.131 E.10027
G1 X126.368 Y132.869 E.29921
G1 X129.632 Y132.869 E.10028
G1 X129.631 Y124.823 E.24723
M204 S10000
G1 X129.254 Y124.763 F42000
G1 F8710
M204 S6000
G1 X129.254 Y123.508 E.03855
G1 X126.745 Y123.508 E.07709
G1 X126.745 Y132.492 E.27603
G1 X129.255 Y132.492 E.07711
G1 X129.254 Y124.823 E.23564
M204 S10000
G1 X128.877 Y124.763 F42000
G1 F8710
M204 S6000
G1 X128.877 Y123.885 E.02696
G1 X127.122 Y123.885 E.05392
G1 X127.122 Y132.115 E.25286
G1 X128.878 Y132.115 E.05393
G1 X128.877 Y124.823 E.22406
M204 S10000
G1 X128.5 Y124.763 F42000
G1 F8710
M204 S6000
G1 X128.5 Y124.262 E.01538
G1 X127.499 Y124.262 E.03075
G1 X127.499 Y131.738 E.22969
G1 X128.501 Y131.738 E.03076
G1 X128.5 Y124.823 E.21247
M204 S10000
G1 X128.156 Y124.763 F42000
; LINE_WIDTH: 0.354859
G1 F8710
M204 S6000
G1 X128.156 Y124.607 E.00396
G1 X127.844 Y124.607 E.00793
G1 X127.844 Y131.393 E.1725
G1 X128.156 Y131.393 E.00793
G1 X128.156 Y124.823 E.16701
; OBJECT_ID: 394
; WIPE_START
G1 F11540.738
G1 X128.156 Y126.823 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X120.885 Y129.144 Z14.8 F42000
G1 X105.622 Y134.015 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8710
M204 S6000
G1 X105.622 Y121.985 E.39906
G1 X111.177 Y121.985 E.18429
G1 X111.178 Y134.015 E.39906
G1 X105.682 Y134.015 E.18231
M204 S10000
G1 X105.215 Y134.422 F42000
G1 F8710
M204 S6000
G1 X105.215 Y121.578 E.42607
G1 X111.585 Y121.578 E.21129
G1 X111.585 Y134.422 E.42607
G1 X105.275 Y134.422 E.20932
M204 S250
G1 X104.865 Y134.711 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8710
M204 S5000
G3 X104.838 Y134.6 I.182 J-.103 E.00356
G3 X104.823 Y134.42 I1.124 J-.182 E.00556
G1 X104.823 Y121.604 E.3938
G3 X104.931 Y121.211 I.539 J-.063 E.01286
G1 X105.006 Y121.186 E.00241
G1 X111.831 Y121.191 E.20973
G1 X111.895 Y121.235 E.00236
G3 X111.977 Y121.558 I-.429 J.281 E.01043
G1 X111.977 Y134.396 E.39448
G3 X111.855 Y134.798 I-.509 J.065 E.01332
G1 X111.79 Y134.814 E.00204
G1 X105.013 Y134.814 E.20825
G3 X104.902 Y134.759 I.033 J-.206 E.00388
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.838 Y134.6 E-.06491
G1 X104.823 Y134.42 E-.06871
G1 X104.823 Y132.772 E-.62638
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.381 Y126.65 Z14.8 F42000
G1 X110.786 Y124.763 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F8710
M204 S6000
G1 X110.785 Y122.377 E.0733
G1 X106.014 Y122.377 E.14661
G1 X106.014 Y133.623 E.34555
G1 X110.786 Y133.623 E.14662
G1 X110.786 Y124.823 E.2704
M204 S10000
G1 X110.408 Y124.763 F42000
G1 F8710
M204 S6000
G1 X110.408 Y122.754 E.06172
G1 X106.391 Y122.754 E.12344
G1 X106.391 Y133.246 E.32238
G1 X110.409 Y133.246 E.12345
G1 X110.408 Y124.823 E.25882
M204 S10000
G1 X110.031 Y124.763 F42000
G1 F8710
M204 S6000
G1 X110.031 Y123.131 E.05013
G1 X106.768 Y123.131 E.10027
G1 X106.768 Y132.869 E.29921
G1 X110.032 Y132.869 E.10028
G1 X110.031 Y124.823 E.24723
M204 S10000
G1 X109.654 Y124.763 F42000
G1 F8710
M204 S6000
G1 X109.654 Y123.508 E.03855
G1 X107.145 Y123.508 E.07709
G1 X107.145 Y132.492 E.27603
G1 X109.655 Y132.492 E.07711
G1 X109.654 Y124.823 E.23564
M204 S10000
G1 X109.277 Y124.763 F42000
G1 F8710
M204 S6000
G1 X109.277 Y123.885 E.02696
G1 X107.522 Y123.885 E.05392
G1 X107.522 Y132.115 E.25286
G1 X109.278 Y132.115 E.05393
G1 X109.277 Y124.823 E.22406
M204 S10000
G1 X108.9 Y124.763 F42000
G1 F8710
M204 S6000
G1 X108.9 Y124.262 E.01538
G1 X107.899 Y124.262 E.03075
G1 X107.899 Y131.738 E.22969
G1 X108.901 Y131.738 E.03076
G1 X108.9 Y124.823 E.21247
M204 S10000
G1 X108.556 Y124.763 F42000
; LINE_WIDTH: 0.354859
G1 F8710
M204 S6000
G1 X108.556 Y124.607 E.00396
G1 X108.244 Y124.607 E.00793
G1 X108.244 Y131.393 E.1725
G1 X108.556 Y131.393 E.00793
G1 X108.556 Y124.823 E.16701
; CHANGE_LAYER
; Z_HEIGHT: 14.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F11540.738
G1 X108.556 Y126.823 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 73/73
; update layer progress
M73 L73
M991 S0 P72 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z14.8 I-.259 J1.189 P1  F42000
G1 X144.216 Y134.577 Z14.8
G1 Z14.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9346
M204 S5000
G1 X144.17 Y134.531 E.00197
G3 X144.146 Y134.391 I.361 J-.136 E.00441
G1 X144.146 Y121.606 E.39284
G3 X144.216 Y121.423 I.152 J-.047 E.00649
G1 X150.989 Y121.423 E.20812
G1 X150.999 Y121.426 E.00034
G3 X151.054 Y121.606 I-.204 J.161 E.00591
G1 X151.054 Y134.394 E.39293
G3 X150.984 Y134.577 I-.152 J.047 E.00649
G1 X144.276 Y134.577 E.20614
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.17 Y134.531 E-.04358
G1 X144.146 Y134.391 E-.05421
G1 X144.146 Y132.648 E-.66222
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z15 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
M625
; object ids of layer 73 start: 394,405,416
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z15
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer73 end: 394,405,416
M625
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X150.847 Y122.448 F42000
G1 Z14.6
G1 E.8 F1800
; FEATURE: Top surface
G1 F9346
M204 S2000
G1 X150.029 Y121.631 E.03553
G1 X149.496 Y121.631
M73 P97 R0
G1 X150.847 Y122.982 E.0587
G1 X150.847 Y123.515
G1 X148.963 Y121.631 E.08188
G1 X148.43 Y121.631
G1 X150.847 Y124.048 E.10505
G1 X150.847 Y124.581
G1 X147.896 Y121.631 E.12823
G1 X147.363 Y121.631
G1 X150.847 Y125.115 E.1514
G1 X150.847 Y125.648
G1 X146.83 Y121.631 E.17457
G1 X146.296 Y121.631
G1 X150.847 Y126.181 E.19775
G1 X150.847 Y126.714
G1 X145.763 Y121.631 E.22092
G1 X145.23 Y121.631
G1 X150.847 Y127.248 E.24409
G1 X150.847 Y127.781
G1 X144.697 Y121.63 E.26727
G1 X144.353 Y121.82
G1 X150.847 Y128.314 E.2822
G1 X150.847 Y128.847
G1 X144.353 Y122.353 E.2822
G1 X144.353 Y122.887
G1 X150.847 Y129.381 E.2822
G1 X150.847 Y129.914
G1 X144.353 Y123.42 E.2822
G1 X144.353 Y123.953
G1 X150.847 Y130.447 E.2822
G1 X150.847 Y130.98
G1 X144.353 Y124.486 E.2822
G1 X144.353 Y125.02
G1 X150.847 Y131.514 E.2822
G1 X150.847 Y132.047
G1 X144.353 Y125.553 E.2822
G1 X144.353 Y126.086
G1 X150.847 Y132.58 E.2822
G1 X150.847 Y133.114
G1 X144.353 Y126.619 E.2822
G1 X144.353 Y127.153
G1 X150.847 Y133.647 E.2822
G1 X150.847 Y134.18
G1 X144.353 Y127.686 E.2822
G1 X144.353 Y128.219
G1 X150.503 Y134.369 E.26726
G1 X149.97 Y134.369
G1 X144.353 Y128.752 E.24408
G1 X144.353 Y129.286
G1 X149.436 Y134.369 E.2209
G1 X148.903 Y134.369
G1 X144.353 Y129.819 E.19772
G1 X144.353 Y130.352
G1 X148.369 Y134.369 E.17454
G1 X147.836 Y134.369
G1 X144.353 Y130.885 E.15136
G1 X144.353 Y131.419
G1 X147.303 Y134.368 E.12818
G1 X146.769 Y134.368
G1 X144.353 Y131.952 E.105
G1 X144.353 Y132.485
G1 X146.236 Y134.368 E.08182
G1 X145.702 Y134.368
G1 X144.353 Y133.018 E.05864
G1 X144.353 Y133.552
G1 X145.169 Y134.368 E.03546
; WIPE_START
G1 F9547.055
M204 S6000
G1 X144.353 Y133.552 E-.4385
G1 X144.353 Y133.018 E-.20264
G1 X144.574 Y133.24 E-.11887
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.866 Y134.344 Z15 F42000
G1 Z14.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.13064
G1 F9346
M204 S6000
G1 X150.528 Y134.344 E.00241
; OBJECT_ID: 405
; WIPE_START
G1 F15000
G1 X150.866 Y134.344 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X143.234 Y134.412 Z15 F42000
G1 X124.616 Y134.577 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9346
M204 S5000
G1 X124.57 Y134.531 E.00197
G3 X124.546 Y134.391 I.361 J-.136 E.00441
G1 X124.546 Y121.606 E.39284
G3 X124.616 Y121.423 I.152 J-.047 E.00649
G1 X131.389 Y121.423 E.20812
G1 X131.399 Y121.426 E.00034
G3 X131.454 Y121.606 I-.204 J.161 E.00591
G1 X131.454 Y134.394 E.39293
G3 X131.384 Y134.577 I-.152 J.047 E.00649
G1 X124.676 Y134.577 E.20614
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.57 Y134.531 E-.04358
G1 X124.546 Y134.391 E-.05421
G1 X124.546 Y132.648 E-.66222
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.737 Y126.269 Z15 F42000
G1 X131.247 Y122.448 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Top surface
G1 F9346
M204 S2000
G1 X130.429 Y121.631 E.03553
G1 X129.896 Y121.631
G1 X131.247 Y122.982 E.0587
G1 X131.247 Y123.515
G1 X129.363 Y121.631 E.08188
G1 X128.83 Y121.631
G1 X131.247 Y124.048 E.10505
G1 X131.247 Y124.581
G1 X128.296 Y121.631 E.12823
G1 X127.763 Y121.631
G1 X131.247 Y125.115 E.1514
G1 X131.247 Y125.648
G1 X127.23 Y121.631 E.17457
G1 X126.696 Y121.631
G1 X131.247 Y126.181 E.19775
G1 X131.247 Y126.714
G1 X126.163 Y121.631 E.22092
G1 X125.63 Y121.631
G1 X131.247 Y127.248 E.24409
G1 X131.247 Y127.781
G1 X125.097 Y121.63 E.26727
G1 X124.753 Y121.82
G1 X131.247 Y128.314 E.2822
G1 X131.247 Y128.847
G1 X124.753 Y122.353 E.2822
G1 X124.753 Y122.887
G1 X131.247 Y129.381 E.2822
G1 X131.247 Y129.914
G1 X124.753 Y123.42 E.2822
G1 X124.753 Y123.953
G1 X131.247 Y130.447 E.2822
G1 X131.247 Y130.98
G1 X124.753 Y124.486 E.2822
G1 X124.753 Y125.02
G1 X131.247 Y131.514 E.2822
G1 X131.247 Y132.047
G1 X124.753 Y125.553 E.2822
G1 X124.753 Y126.086
G1 X131.247 Y132.58 E.2822
G1 X131.247 Y133.114
G1 X124.753 Y126.619 E.2822
G1 X124.753 Y127.153
G1 X131.247 Y133.647 E.2822
G1 X131.247 Y134.18
G1 X124.753 Y127.686 E.2822
G1 X124.753 Y128.219
G1 X130.903 Y134.369 E.26726
G1 X130.37 Y134.369
G1 X124.753 Y128.752 E.24408
G1 X124.753 Y129.286
G1 X129.836 Y134.369 E.2209
G1 X129.303 Y134.369
G1 X124.753 Y129.819 E.19772
G1 X124.753 Y130.352
G1 X128.769 Y134.369 E.17454
G1 X128.236 Y134.369
G1 X124.753 Y130.885 E.15136
G1 X124.753 Y131.419
G1 X127.703 Y134.368 E.12818
G1 X127.169 Y134.368
G1 X124.753 Y131.952 E.105
G1 X124.753 Y132.485
G1 X126.636 Y134.368 E.08182
G1 X126.102 Y134.368
G1 X124.753 Y133.018 E.05864
G1 X124.753 Y133.552
G1 X125.569 Y134.368 E.03546
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.753 Y133.552 E-.4385
G1 X124.753 Y133.018 E-.20264
G1 X124.974 Y133.24 E-.11887
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.266 Y134.344 Z15 F42000
G1 Z14.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.13064
G1 F9346
M204 S6000
G1 X130.928 Y134.344 E.00241
; OBJECT_ID: 394
; WIPE_START
G1 F15000
G1 X131.266 Y134.344 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X123.634 Y134.412 Z15 F42000
G1 X105.016 Y134.577 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9346
M204 S5000
G1 X104.97 Y134.531 E.00197
G3 X104.946 Y134.391 I.361 J-.136 E.00441
G1 X104.946 Y121.606 E.39284
G3 X105.016 Y121.423 I.152 J-.047 E.00649
G1 X111.789 Y121.423 E.20812
G1 X111.799 Y121.426 E.00034
G3 X111.854 Y121.606 I-.204 J.161 E.00591
G1 X111.854 Y134.394 E.39293
G3 X111.784 Y134.577 I-.152 J.047 E.00649
G1 X105.076 Y134.577 E.20614
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.97 Y134.531 E-.04358
G1 X104.946 Y134.391 E-.05421
G1 X104.946 Y132.648 E-.66222
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.137 Y126.269 Z15 F42000
G1 X111.647 Y122.448 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Top surface
G1 F9346
M204 S2000
G1 X110.829 Y121.631 E.03553
G1 X110.296 Y121.631
G1 X111.647 Y122.982 E.0587
G1 X111.647 Y123.515
G1 X109.763 Y121.631 E.08188
G1 X109.23 Y121.631
G1 X111.647 Y124.048 E.10505
G1 X111.647 Y124.581
G1 X108.696 Y121.631 E.12823
G1 X108.163 Y121.631
G1 X111.647 Y125.115 E.1514
G1 X111.647 Y125.648
G1 X107.63 Y121.631 E.17457
G1 X107.096 Y121.631
G1 X111.647 Y126.181 E.19775
G1 X111.647 Y126.714
G1 X106.563 Y121.631 E.22092
G1 X106.03 Y121.631
G1 X111.647 Y127.248 E.24409
G1 X111.647 Y127.781
G1 X105.497 Y121.63 E.26727
G1 X105.153 Y121.82
G1 X111.647 Y128.314 E.2822
G1 X111.647 Y128.847
G1 X105.153 Y122.353 E.2822
G1 X105.153 Y122.887
G1 X111.647 Y129.381 E.2822
G1 X111.647 Y129.914
G1 X105.153 Y123.42 E.2822
G1 X105.153 Y123.953
G1 X111.647 Y130.447 E.2822
G1 X111.647 Y130.98
G1 X105.153 Y124.486 E.2822
G1 X105.153 Y125.02
G1 X111.647 Y131.514 E.2822
G1 X111.647 Y132.047
G1 X105.153 Y125.553 E.2822
G1 X105.153 Y126.086
G1 X111.647 Y132.58 E.2822
G1 X111.647 Y133.114
G1 X105.153 Y126.619 E.2822
G1 X105.153 Y127.153
G1 X111.647 Y133.647 E.2822
G1 X111.647 Y134.18
G1 X105.153 Y127.686 E.2822
G1 X105.153 Y128.219
G1 X111.303 Y134.369 E.26726
G1 X110.77 Y134.369
G1 X105.153 Y128.752 E.24408
G1 X105.153 Y129.286
G1 X110.236 Y134.369 E.2209
G1 X109.703 Y134.369
G1 X105.153 Y129.819 E.19772
G1 X105.153 Y130.352
G1 X109.169 Y134.369 E.17454
G1 X108.636 Y134.369
G1 X105.153 Y130.885 E.15136
G1 X105.153 Y131.419
G1 X108.103 Y134.368 E.12818
G1 X107.569 Y134.368
G1 X105.153 Y131.952 E.105
G1 X105.153 Y132.485
G1 X107.036 Y134.368 E.08182
G1 X106.502 Y134.368
G1 X105.153 Y133.018 E.05864
G1 X105.153 Y133.552
G1 X105.969 Y134.368 E.03546
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.153 Y133.552 E-.4385
G1 X105.153 Y133.018 E-.20264
G1 X105.374 Y133.24 E-.11887
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P98 R0
G1 X111.666 Y134.344 Z15 F42000
G1 Z14.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.13064
G1 F9346
M204 S6000
G1 X111.328 Y134.344 E.00241
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F15000
G1 X111.666 Y134.344 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z15 I1.217 J0 P1  F42000
; stop printing object, unique label id: 394
M625
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
G1 X0 Y128 F18000 ; move to safe pos
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

