; HEADER_BLOCK_START
; BambuStudio 02.08.02.61
; model printing time: 13m 2s; total estimated time: 19m 19s
; total layer number: 73
; total filament length [mm] : 898.14
; total filament volume [cm^3] : 2160.28
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
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
M73 P31 R13
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
G1 X124.931 Y139.198 F42000
M204 S6000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
M73 P32 R13
G1 F3000
M204 S500
G1 X126.358 Y128.315 E.40879
G1 X131.217 Y127.676 E.18253
G1 X131.224 Y128 E.01208
G3 X131.15 Y129.122 I-9.619 J-.072 E.04192
G1 X129.74 Y139.829 E.40222
G1 X124.99 Y139.206 E.17843
M204 S6000
G1 X124.418 Y139.591 F42000
G1 F3000
M204 S500
G1 X125.891 Y128.401 E.42039
G2 X125.92 Y127.912 I-4.093 J-.483 E.01825
G1 X131.643 Y127.159 E.21501
G1 X131.673 Y127.609 E.01682
G3 X131.604 Y129.177 I-11.935 J.26 E.0585
G1 X130.134 Y140.342 E.41942
G1 X124.478 Y139.599 E.21248
; WIPE_START
G1 X124.728 Y137.615 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X125.837 Y130.064 Z.6 F42000
G1 X126.227 Y127.411 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X124.889 Y117.248 E.38177
G1 X129.112 Y116.692 E.15865
G1 X129.896 Y116.589 E.02944
G1 X131.234 Y126.752 E.38177
G1 X126.286 Y127.403 E.18586
; WIPE_START
G1 X126.014 Y125.422 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X124.976 Y117.86 Z.6 F42000
G1 X124.829 Y116.795 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X124.475 Y116.842 E.01331
G1 X124.418 Y116.411 E.01619
G1 X130.134 Y115.659 E.21471
G1 X130.191 Y116.089 E.01619
G1 X124.889 Y116.787 E.19917
; WIPE_START
G1 X124.475 Y116.842 E-.1586
G1 X124.418 Y116.411 E-.16516
G1 X125.557 Y116.261 E-.43625
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X125.029 Y123.875 Z.6 F42000
G1 X123.913 Y139.986 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X123.915 Y139.91 I.243 J-.033 E.00285
M73 P32 R12
G1 X125.437 Y128.351 E.43426
G2 X125.437 Y127.646 I-3.958 J-.35 E.02627
G1 X123.914 Y116.085 E.43433
G3 X123.913 Y116.014 I.32 J-.041 E.00266
G1 X130.52 Y115.147 E.24819
G3 X130.536 Y115.214 I-.271 J.101 E.00257
G1 X132.057 Y126.768 E.43407
G3 X132.057 Y129.232 I-10.517 J1.232 E.09199
G1 X130.536 Y140.787 E.43407
G3 X130.519 Y140.855 I-.275 J-.032 E.00263
G1 X123.973 Y139.994 E.24593
; WIPE_START
G1 X123.915 Y139.91 E-.03873
G1 X124.163 Y138.028 E-.72127
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


G1 X125.852 Y127.69 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.401321
G1 F3000
M204 S500
G1 X124.456 Y117.075 E.3127
; WIPE_START
G1 X124.716 Y119.058 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X130.27 Y116.31 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.400272
G1 F3000
M204 S500
G1 X131.667 Y126.925 E.31178
; WIPE_START
G1 X131.406 Y124.942 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X131.003 Y128.78 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50969
M73 P33 R12
G1 F4717
M204 S500
G1 X130.399 Y128.175 E.03253
G1 X129.815 Y128.252 E.02238
G1 X130.75 Y129.186 E.05025
G1 X130.673 Y129.77 E.02238
G1 X129.232 Y128.329 E.07749
G1 X128.649 Y128.406 E.02238
G1 X130.596 Y130.353 E.10474
G1 X130.519 Y130.936 E.02238
G1 X128.065 Y128.483 E.13199
G1 X127.482 Y128.559 E.02238
G1 X130.442 Y131.52 E.15923
G1 X130.366 Y132.103 E.02238
G1 X126.899 Y128.636 E.18648
G1 X126.704 Y128.662 E.00745
G1 X126.653 Y129.051 E.01493
G1 X130.289 Y132.686 E.19555
G1 X130.212 Y133.27 E.02238
G1 X126.577 Y129.635 E.19553
G1 X126.5 Y130.218 E.02239
G1 X130.135 Y133.853 E.19552
G1 X130.058 Y134.436 E.02238
G1 X126.424 Y130.802 E.1955
G1 X126.347 Y131.385 E.02239
G1 X129.982 Y135.02 E.19549
G1 X129.905 Y135.603 E.02238
G1 X126.271 Y131.969 E.19547
G1 X126.194 Y132.552 E.02239
G1 X129.828 Y136.186 E.19546
G1 X129.751 Y136.769 E.02238
G1 X126.118 Y133.136 E.19545
G1 X126.041 Y133.72 E.02239
G1 X129.674 Y137.353 E.19543
G1 X129.598 Y137.936 E.02238
G1 X125.965 Y134.303 E.19542
G1 X125.888 Y134.887 E.02239
G1 X129.521 Y138.519 E.1954
G1 X129.444 Y139.103 E.02238
G1 X125.812 Y135.47 E.19539
G1 X125.735 Y136.054 E.02239
G1 X129.024 Y139.343 E.17693
G1 X128.264 Y139.243 E.02915
G1 X125.659 Y136.638 E.14017
G1 X125.582 Y137.221 E.02239
G1 X127.505 Y139.144 E.10342
G1 X126.745 Y139.044 E.02915
G1 X125.505 Y137.805 E.06666
G1 X125.429 Y138.388 E.02239
G1 X126.224 Y139.183 E.04275
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6300
G1 X125.429 Y138.388 E-.4271
G1 X125.505 Y137.805 E-.22366
G1 X125.709 Y138.008 E-.10924
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
G3 Z.6 I-.978 J-.724 P1  F42000
G1 X124.52 Y139.615 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4280
M204 S6000
G1 X126.02 Y128.128 E.38427
G1 X131.554 Y127.399 E.18517
G1 X131.564 Y127.553 E.00511
G3 X131.5 Y129.166 I-11.287 J.357 E.05361
G1 X130.029 Y140.338 E.37379
G1 X124.58 Y139.622 E.18231
; WIPE_START
G1 F8843.478
G1 X124.828 Y137.638 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126 Y130.096 Z.8 F42000
G1 X126.377 Y127.67 Z.8
G1 Z.4
G1 E.8 F1800
G1 F4280
M204 S6000
G1 X125.988 Y127.722 E.01301
G1 X124.578 Y117.01 E.35839
G1 X127.189 Y116.666 E.08734
G1 X130.134 Y116.278 E.09856
G1 X131.545 Y126.99 E.35839
G1 X126.437 Y127.663 E.1709
M204 S250
G1 X126.326 Y127.282 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4280
M204 S5000
G1 X125.018 Y117.347 E.30789
G1 X127.24 Y117.055 E.06885
G1 X129.797 Y116.718 E.07925
G1 X131.105 Y126.653 E.30789
G1 X126.385 Y127.274 E.14626
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.113 Y125.293 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.057 Y132.852 Z.8 F42000
G1 X124.063 Y139.965 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4280
M204 S6000
G1 X125.591 Y128.364 E.38815
G2 X125.591 Y127.636 I-3.263 J-.364 E.0242
G1 X124.063 Y116.035 E.38816
G1 X130.379 Y115.203 E.21131
G1 X131.904 Y126.785 E.38751
G3 X131.904 Y129.215 I-10.647 J1.215 E.0808
G1 X130.379 Y140.795 E.38744
G1 X124.123 Y139.973 E.20932
M204 S250
G1 X123.667 Y140.003 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4280
M204 S5000
G3 X123.756 Y139.295 I10.396 J.951 E.02194
G1 X125.123 Y128.916 E.32164
G2 X125.222 Y128 I-6.419 J-1.158 E.02835
G1 X125.219 Y127.889 E.00342
G2 X125.123 Y127.084 I-9.276 J.706 E.02492
G1 X123.756 Y116.705 E.32166
G1 X123.719 Y116.417 E.00892
G1 X123.669 Y116.02 E.01229
G1 F3461.189
G1 X123.665 Y115.946 E.00229
G1 F2880
G1 X123.668 Y115.88 E.00201
G1 F2640
G1 X123.68 Y115.812 E.00213
G1 F2280
G1 X123.695 Y115.767 E.00146
G1 F2160
G1 X123.711 Y115.737 E.00103
G1 F1920
G1 X123.731 Y115.711 E.00101
M106 S255
G1 F1800
G1 X123.766 Y115.685 E.00133
M106 S201.45
M106 S255
G1 F1680
G1 X130.574 Y114.787 E.21102
M106 S201.45
M106 S255
G1 F1800
G1 X130.617 Y114.805 E.00143
M106 S201.45
G1 F1920
G1 X130.646 Y114.826 E.0011
G1 F2040
G1 X130.658 Y114.838 E.00052
G1 F2160
G1 X130.673 Y114.858 E.00078
G1 F2400
G1 X130.702 Y114.906 E.0017
G1 F2760
G1 X130.73 Y114.979 E.0024
G1 F3000
G1 X130.752 Y115.064 E.00271
G1 F4280
G1 X130.807 Y115.46 E.01229
G1 X130.846 Y115.749 E.00895
G1 X132.215 Y126.143 E.32214
G3 X132.363 Y127.516 I-15.69 J2.384 E.04245
G1 X132.376 Y128.001 E.0149
G3 X132.215 Y129.857 I-16.005 J-.454 E.05729
G1 X130.846 Y140.251 E.32213
G1 X130.803 Y140.559 E.00956
G1 X130.748 Y140.955 E.01229
G1 F2880
G1 X130.723 Y141.044 E.00282
G1 F2640
G1 X130.692 Y141.112 E.00229
G1 F2400
G1 X130.666 Y141.151 E.00145
G1 F2160
G1 X130.639 Y141.18 E.00122
G1 F1920
G1 X130.615 Y141.197 E.00091
M106 S255
G1 F1800
G1 X130.574 Y141.213 E.00135
M106 S201.45
M106 S255
G1 F1680
G1 X123.765 Y140.315 E.21104
M106 S201.45
M106 S255
G1 F1800
G1 X123.74 Y140.298 E.00092
M106 S201.45
G1 F1920
G1 X123.71 Y140.263 E.00142
G1 F2040
M73 P34 R12
G1 X123.7 Y140.245 E.00064
G1 F2160
G1 X123.689 Y140.22 E.00086
G1 F2400
G1 X123.679 Y140.189 E.00097
G1 F2520
G1 X123.67 Y140.14 E.00153
G1 F2880
G1 X123.665 Y140.067 E.00225
G1 F3000
G1 X123.666 Y140.063 E.00014
; WIPE_START
M204 S6000
G1 X123.756 Y139.295 E-.29396
G1 X123.916 Y138.079 E-.46604
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


G1 X128.361 Y130.467 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.358267
G1 F4280
M204 S6000
G1 X127.46 Y137.356 E.17853
G1 X127.771 Y137.396 E.00805
G1 X128.687 Y130.424 E.18071
G1 X128.421 Y130.459 E.0069
M204 S10000
G1 X128.052 Y130.158 F42000
; LINE_WIDTH: 0.41999
G1 F4280
M204 S6000
G1 X127.073 Y137.653 E.23226
G1 X128.068 Y137.784 E.03084
G1 X129.09 Y130.021 E.24059
G1 X128.111 Y130.15 E.03034
M204 S10000
G1 X127.715 Y129.822 F42000
G1 F4280
M204 S6000
G1 X126.65 Y137.978 E.25274
G1 X128.393 Y138.207 E.054
G1 X129.528 Y129.583 E.26727
G1 X127.775 Y129.814 E.05434
M204 S10000
G1 X127.379 Y129.486 F42000
G1 F4280
M204 S6000
G1 X126.228 Y138.303 E.27322
G1 X128.717 Y138.63 E.07716
G1 X129.966 Y129.145 E.29395
G1 X127.439 Y129.478 E.07834
M204 S10000
G1 X127.043 Y129.149 F42000
G1 F4280
M204 S6000
G1 X125.805 Y138.627 E.2937
G1 X129.042 Y139.053 E.10032
G1 X130.36 Y129.042 E.31026
G1 X130.389 Y128.709 E.01026
G1 X127.102 Y129.142 E.10188
M204 S10000
G1 X126.706 Y128.813 F42000
G1 F4280
M204 S6000
G1 X125.382 Y138.952 E.31417
G1 X129.367 Y139.476 E.12348
G1 X130.735 Y129.083 E.3221
G1 X130.799 Y128.275 E.0249
G1 X126.766 Y128.806 E.12499
M204 S10000
G1 X126.37 Y128.477 F42000
G1 F4280
M204 S6000
G1 X124.96 Y139.277 E.33465
G1 X129.691 Y139.899 E.14664
G1 X131.11 Y129.124 E.33393
G1 X131.176 Y128.37 E.02326
G1 X131.174 Y127.845 E.01613
G1 X126.429 Y128.47 E.14704
; WIPE_START
G1 F9547.299
G1 X128.412 Y128.209 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.897 Y121.002 Z.8 F42000
G1 X124.333 Y116.521 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.670189
G1 F4280
M204 S6000
G1 X130.245 Y115.742 E.3048
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5739.169
G1 X128.262 Y116.003 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/73
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z.8 I-1.202 J-.191 P1  F42000
G1 X124.492 Y139.729 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4160
M204 S6000
G1 X125.981 Y128.417 E.37848
G2 X126.003 Y128.13 I-2.169 J-.31 E.00956
G1 X131.567 Y127.398 E.18615
G1 X131.581 Y127.613 E.00717
G3 X131.513 Y129.168 I-11.806 J.258 E.05166
G1 X130.026 Y140.457 E.3777
G1 X124.552 Y139.737 E.18315
; WIPE_START
G1 F8843.478
G1 X124.802 Y137.753 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.98 Y130.212 Z1 F42000
G1 X126.377 Y127.67 Z1
G1 Z.6
G1 E.8 F1800
G1 F4160
M204 S6000
G1 X125.988 Y127.722 E.01301
G1 X124.578 Y117.01 E.35839
G1 X128.531 Y116.49 E.13225
G1 X130.134 Y116.278 E.05365
G1 X131.545 Y126.99 E.35839
G1 X126.437 Y127.663 E.1709
M204 S250
G1 X126.326 Y127.282 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4160
M204 S5000
G1 X125.018 Y117.347 E.30789
G1 X128.582 Y116.878 E.11045
G1 X129.797 Y116.718 E.03765
G1 X131.105 Y126.653 E.30789
G1 X126.385 Y127.274 E.14626
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.113 Y125.293 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.075 Y117.731 Z1 F42000
G1 X124.914 Y116.555 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4160
M204 S6000
G1 X124.536 Y116.605 E.01264
G1 X124.492 Y116.27 E.01119
G1 X130.026 Y115.542 E.18516
G1 X130.07 Y115.876 E.0112
G1 X124.973 Y116.547 E.17053
; WIPE_START
G1 F8843.478
G1 X124.536 Y116.605 E-.16755
G1 X124.492 Y116.27 E-.12815
G1 X125.704 Y116.111 E-.4643
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.174 Y123.725 Z1 F42000
G1 X124.035 Y140.08 Z1
G1 Z.6
G1 E.8 F1800
G1 F4160
M204 S6000
G1 X125.577 Y128.369 E.39183
G2 X125.578 Y127.638 I-3.849 J-.37 E.02429
G1 X124.035 Y115.92 E.39205
G1 X130.377 Y115.085 E.21216
G1 X131.917 Y126.783 E.3914
G3 X131.917 Y129.217 I-10.362 J1.217 E.08092
G1 X130.376 Y140.913 E.39134
G1 X124.095 Y140.088 E.21016
M204 S250
G1 X123.629 Y140.264 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4160
M204 S5000
G1 X123.626 Y140.232 E.001
G1 X123.631 Y140.153 E.00243
G1 X125.188 Y128.322 E.36665
G2 X125.188 Y127.68 I-3.324 J-.323 E.01975
G1 X123.631 Y115.852 E.36658
G1 X123.626 Y115.775 E.00238
G1 X123.63 Y115.727 E.00148
G1 X123.639 Y115.691 E.00114
G1 X123.65 Y115.661 E.00096
G1 X123.674 Y115.622 E.00141
G3 X123.722 Y115.579 I.142 J.113 E.002
G3 X123.781 Y115.558 I.085 J.144 E.00193
G1 X129.923 Y114.749 E.19035
G3 X130.549 Y114.669 I.82 J3.924 E.01941
G1 X130.585 Y114.674 E.00113
G3 X130.648 Y114.703 I-.043 J.173 E.00214
G1 X130.672 Y114.725 E.001
G1 X130.702 Y114.763 E.00149
G1 X130.718 Y114.794 E.00107
G1 X130.734 Y114.839 E.00147
G1 X130.75 Y114.916 E.00243
G1 X130.75 Y114.916 E0
G1 X132.306 Y126.736 E.36631
G3 X132.306 Y129.264 I-10.794 J1.264 E.07786
G1 X130.749 Y141.085 E.36636
G1 X130.746 Y141.109 E.00076
G1 X130.734 Y141.162 E.00165
G1 X130.712 Y141.217 E.00183
G1 X130.686 Y141.26 E.00154
G1 X130.666 Y141.282 E.0009
G1 X130.645 Y141.299 E.00083
G1 X130.61 Y141.318 E.00122
G3 X130.543 Y141.331 I-.063 J-.148 E.00213
G1 X123.749 Y140.434 E.21056
G1 X123.713 Y140.415 E.00127
G3 X123.672 Y140.376 I.104 J-.15 E.00173
G1 X123.647 Y140.333 E.00151
G1 X123.643 Y140.322 E.00037
; WIPE_START
G1 F7478.782
M204 S6000
G1 X123.626 Y140.232 E-.03498
G1 X123.631 Y140.153 E-.03004
G1 X123.87 Y138.339 E-.69498
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
G1 X128.362 Y130.471 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.367729
G1 F4160
M204 S6000
G1 X127.441 Y137.466 E.18675
G1 X127.763 Y137.508 E.0086
G1 X128.696 Y130.427 E.18905
G1 X128.422 Y130.463 E.00731
M204 S10000
G1 X128.049 Y130.158 F42000
; LINE_WIDTH: 0.41999
G1 F4160
M204 S6000
G1 X127.047 Y137.768 E.23585
G1 X128.065 Y137.902 E.03154
G1 X129.103 Y130.019 E.2443
G1 X128.109 Y130.15 E.03082
M204 S10000
G1 X127.713 Y129.822 F42000
G1 F4160
M204 S6000
G1 X126.624 Y138.093 E.25633
G1 X128.39 Y138.325 E.05471
G1 X129.541 Y129.581 E.27098
G1 X127.773 Y129.814 E.05481
M204 S10000
G1 X127.377 Y129.486 F42000
G1 F4160
M204 S6000
G1 X126.201 Y138.418 E.27681
M73 P35 R12
G1 X128.715 Y138.748 E.07789
G1 X129.979 Y129.143 E.29767
G1 X127.437 Y129.478 E.0788
M204 S10000
G1 X127.041 Y129.15 F42000
G1 F4160
M204 S6000
G1 X125.778 Y138.742 E.29729
G1 X129.039 Y139.171 E.10106
G1 X130.373 Y129.043 E.31388
G1 X130.402 Y128.707 E.01036
G1 X127.101 Y129.142 E.10233
M204 S10000
G1 X126.705 Y128.814 F42000
G1 F4160
M204 S6000
G1 X125.355 Y139.067 E.31777
G1 X129.364 Y139.594 E.12423
G1 X130.748 Y129.084 E.32571
G1 X130.812 Y128.273 E.025
G1 X126.765 Y128.806 E.12544
M204 S10000
G1 X126.369 Y128.478 F42000
G1 F4160
M204 S6000
G1 X124.932 Y139.392 E.33825
G1 X129.688 Y140.017 E.1474
G1 X131.123 Y129.125 E.33755
G1 X131.189 Y128.369 E.02332
G1 X131.189 Y127.843 E.01618
G1 X126.428 Y128.47 E.14754
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X128.411 Y128.209 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/73
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z1 I-1.152 J-.391 P1  F42000
G1 X124.485 Y139.781 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3971
M204 S6000
G1 X125.986 Y128.385 E.3813
G1 X131.582 Y127.648 E.18723
G1 X131.59 Y128 E.01168
G3 X131.513 Y129.168 I-10.035 J-.075 E.03886
G1 X130.019 Y140.51 E.37948
G1 X124.545 Y139.789 E.18317
M204 S10000
G1 X124.029 Y140.132 F42000
G1 F3971
M204 S6000
G1 X125.578 Y128.362 E.39377
G2 X125.601 Y128.025 I-2.567 J-.34 E.01123
G1 X131.961 Y127.187 E.21281
G1 X131.988 Y127.596 E.01357
G3 X131.917 Y129.217 I-12.355 J.269 E.05387
G1 X130.37 Y140.967 E.39312
G1 X124.088 Y140.139 E.21017
; WIPE_START
G1 F8843.478
G1 X124.339 Y138.155 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.463 Y130.524 Z1.2 F42000
G1 X124.687 Y116.743 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F3971
M204 S6000
G1 X124.153 Y116.814 E.01785
G1 X124.029 Y115.868 E.03162
G1 X130.37 Y115.033 E.21216
G1 X130.494 Y115.979 E.03164
G1 X124.746 Y116.736 E.19233
; WIPE_START
G1 F8843.478
G1 X124.153 Y116.814 E-.22725
G1 X124.029 Y115.868 E-.36227
G1 X124.473 Y115.81 E-.17048
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.527 Y123.369 Z1.2 F42000
G1 X126.111 Y127.562 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3971
M204 S5000
G1 X124.738 Y117.132 E.32325
G1 X125.126 Y117.081 E.01203
G1 X130.012 Y116.438 E.15144
G1 X131.385 Y126.868 E.32325
G1 X126.17 Y127.554 E.16163
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.898 Y125.573 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.726 Y133.115 Z1.2 F42000
G1 X123.616 Y140.265 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F3971
M204 S5000
G1 X125.188 Y128.32 E.37021
G2 X125.188 Y127.678 I-3.331 J-.32 E.01975
G1 X123.616 Y115.739 E.37003
G3 X123.634 Y115.608 I.288 J-.026 E.00408
G1 X123.659 Y115.572 E.00134
G1 X123.687 Y115.544 E.00121
G3 X123.738 Y115.516 I.111 J.141 E.00181
G1 X123.772 Y115.507 E.00107
G1 X130.51 Y114.619 E.20883
G3 X130.582 Y114.621 I.03 J.212 E.00223
G1 X130.618 Y114.633 E.00117
G1 X130.653 Y114.653 E.00122
G1 X130.681 Y114.678 E.00119
G1 X130.69 Y114.688 E.00039
G3 X130.734 Y114.796 I-.202 J.145 E.00362
G1 X132.306 Y126.736 E.37005
G3 X132.306 Y129.264 I-10.795 J1.264 E.07786
G1 X130.734 Y141.203 E.37
G3 X130.68 Y141.323 I-.27 J-.049 E.00412
G1 X130.643 Y141.354 E.00146
G1 X130.607 Y141.371 E.00122
G3 X130.544 Y141.383 I-.064 J-.176 E.00199
G3 X124.365 Y140.571 I52.527 J-423.895 E.19148
G1 X123.771 Y140.493 E.01844
G3 X123.692 Y140.46 I.042 J-.209 E.00263
G3 X123.651 Y140.42 I.114 J-.158 E.00177
G1 X123.638 Y140.398 E.00079
G1 X123.629 Y140.381 E.00059
G3 X123.616 Y140.326 I.238 J-.086 E.00175
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.876 Y138.342 E-.76
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


G1 X126.631 Y130.832 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F3971
M204 S6000
G3 X126.064 Y130.793 I-.177 J-1.579 E.01756
G1 X124.925 Y139.444 E.26808
G1 X129.682 Y140.07 E.14741
G1 X130.973 Y130.261 E.30401
G1 X126.691 Y130.824 E.13272
M204 S10000
G1 X126.68 Y131.206 F42000
G1 F3971
M204 S6000
G1 X126.389 Y131.217 E.00897
G1 X125.348 Y139.119 E.2449
G1 X129.357 Y139.647 E.12424
G1 X130.535 Y130.699 E.27733
G1 X126.74 Y131.198 E.11762
M204 S10000
G1 X128.376 Y132.858 F42000
; LINE_WIDTH: 0.36785
G1 F3971
M204 S6000
G1 X128.042 Y132.902 E.00891
G1 X127.434 Y137.518 E.12328
G1 X127.757 Y137.561 E.0086
G1 X128.368 Y132.918 E.124
M204 S10000
G1 X128.783 Y132.45 F42000
; LINE_WIDTH: 0.41999
G1 F3971
M204 S6000
G1 X127.729 Y132.589 E.03267
G1 X127.041 Y137.821 E.16213
G1 X128.059 Y137.955 E.03155
G1 X128.776 Y132.51 E.16874
M204 S10000
G1 X129.221 Y132.013 F42000
G1 F3971
M204 S6000
G1 X127.393 Y132.253 E.05666
G1 X126.617 Y138.145 E.1826
G1 X128.383 Y138.378 E.05473
G1 X129.213 Y132.072 E.19543
M204 S10000
G1 X129.659 Y131.575 F42000
G1 F3971
M204 S6000
G1 X127.057 Y131.917 E.08065
M73 P36 R12
G1 X126.194 Y138.47 E.20308
G1 X128.708 Y138.801 E.0779
G1 X129.651 Y131.634 E.22211
M204 S10000
G1 X130.097 Y131.137 F42000
G1 F3971
M204 S6000
G1 X126.72 Y131.59 E.10471
G1 X125.771 Y138.794 E.22329
G1 X129.033 Y139.224 E.10107
G1 X130.089 Y131.196 E.2488
M204 S10000
G1 X130.406 Y130.126 F42000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F3971
M204 S2000
G1 X131.277 Y129.256 E.03782
G1 X131.338 Y128.661
G1 X129.792 Y130.207 E.06717
G1 X129.178 Y130.288
G1 X131.362 Y128.104 E.09492
G1 X130.982 Y127.951
G1 X128.564 Y130.369 E.10505
G1 X127.95 Y130.45
G1 X130.367 Y128.032 E.10505
G1 X129.753 Y128.113
G1 X127.336 Y130.53 E.10505
G1 X126.722 Y130.611
G1 X129.139 Y128.194 E.10505
G1 X128.525 Y128.275
G1 X126.181 Y130.619 E.10187
G1 X125.957 Y130.31
G1 X127.911 Y128.356 E.08493
G1 X127.297 Y128.436
G1 X126.037 Y129.696 E.05473
G1 X126.118 Y129.082
G1 X126.683 Y128.517 E.02453
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.118 Y129.082 E-.30342
G1 X126.037 Y129.696 E-.23537
G1 X126.449 Y129.284 E-.22122
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.675 Y127.817 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.580844
G1 F3971
M204 S6000
G1 X124.251 Y116.999 E.47831
M204 S10000
G1 X124.293 Y116.314 F42000
; LINE_WIDTH: 0.589449
G1 F3971
M204 S6000
G1 X130.23 Y115.533 E.26671
M204 S10000
G1 X130.448 Y116.183 F42000
; LINE_WIDTH: 0.580837
G1 F3971
M204 S6000
G1 X131.872 Y127.001 E.47831
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6692.489
G1 X131.611 Y125.019 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/73
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z1.2 I-.71 J-.988 P1  F42000
G1 X126.188 Y128.914 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3815
M204 S5000
G1 X126.029 Y127.704 E.03749
G1 X126.334 Y127.664 E.00947
G1 X131.501 Y126.984 E.16015
G1 X131.661 Y128.193 E.03749
G1 X126.247 Y128.906 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.029 Y127.704 E-.46417
G1 X126.334 Y127.664 E-.11707
G1 X126.8 Y127.603 E-.17877
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.375 Y135.101 Z1.4 F42000
G1 X124.485 Y139.788 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3815
M204 S6000
G1 X125.803 Y129.77 E.33516
G1 X131.533 Y129.016 E.19169
G1 X130.018 Y140.517 E.38478
G1 X124.544 Y139.795 E.18317
M204 S10000
G1 X124.028 Y140.138 F42000
G1 F3815
M204 S6000
G1 X125.542 Y128.638 E.38478
G1 X125.756 Y128.638 E.0071
G1 X125.85 Y129.354 E.02395
G1 X131.979 Y128.547 E.20504
G1 X131.961 Y128.808 E.00869
G1 X130.369 Y140.973 E.40698
G1 X124.087 Y140.146 E.21017
; WIPE_START
G1 F8843.478
G1 X124.338 Y138.162 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.267 Y130.777 Z1.4 F42000
G1 X130.012 Y116.438 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3815
M204 S5000
G1 X131.385 Y126.868 E.32325
G1 X126.111 Y127.562 E.16347
G1 X124.738 Y117.132 E.32325
G1 X125.845 Y116.986 E.03433
G1 X129.953 Y116.446 E.12729
M204 S250
G1 X130.094 Y116.296 F42000
G1 F3815
M204 S5000
G1 X124.622 Y117.016 E.16961
G1 X124.462 Y115.807 E.03749
G1 X124.768 Y115.767 E.00947
G1 X129.935 Y115.086 E.16015
G1 X130.086 Y116.236 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.107 Y116.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.688 Y124.019 Z1.4 F42000
G1 X123.614 Y140.278 Z1.4
G1 Z1
G1 E.8 F1800
G1 F3815
M204 S5000
G1 X125.188 Y128.32 E.3706
G2 X125.188 Y127.68 I-2.805 J-.32 E.0197
G1 X123.614 Y115.72 E.37068
G3 X123.772 Y115.5 I.19 J-.03 E.00924
G1 X130.508 Y114.613 E.20876
G3 X130.594 Y114.618 I.031 J.22 E.00268
G1 X130.618 Y114.626 E.00077
G3 X130.733 Y114.785 I-.097 J.19 E.00626
G1 X132.306 Y126.736 E.37038
G3 X132.306 Y129.264 I-10.795 J1.264 E.07785
G1 X130.732 Y141.217 E.37046
G3 X130.511 Y141.387 I-.193 J-.022 E.00958
G1 X123.725 Y140.486 E.21033
G3 X123.615 Y140.338 I.087 J-.18 E.0059
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.874 Y138.355 E-.76
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


G1 X129.325 Y131.223 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F3815
M204 S6000
G1 X127.497 Y131.464 E.05666
G1 X126.617 Y138.152 E.20726
G1 X128.382 Y138.384 E.05473
G1 X129.317 Y131.283 E.22008
M204 S10000
G1 X128.887 Y131.661 F42000
G1 F3815
M204 S6000
G1 X127.833 Y131.8 E.03267
G1 X127.04 Y137.827 E.18678
G1 X128.058 Y137.961 E.03155
G1 X128.879 Y131.721 E.1934
M204 S10000
G1 X128.48 Y132.069 F42000
; LINE_WIDTH: 0.36785
G1 F3815
M204 S6000
G1 X128.146 Y132.113 E.00891
G1 X127.434 Y137.525 E.14453
G1 X127.756 Y137.567 E.0086
G1 X128.472 Y132.129 E.14525
M204 S10000
G1 X127.161 Y131.128 F42000
; LINE_WIDTH: 0.41999
G1 F3815
M204 S6000
G1 X126.194 Y138.476 E.22773
G1 X128.707 Y138.807 E.0779
G1 X129.763 Y130.785 E.24861
G1 X127.221 Y131.12 E.0788
M204 S10000
G1 X126.825 Y130.792 F42000
G1 F3815
M204 S6000
G1 X125.771 Y138.801 E.24821
G1 X129.032 Y139.23 E.10107
G1 X130.201 Y130.347 E.2753
G1 X126.884 Y130.784 E.10279
M204 S10000
G1 X126.489 Y130.456 F42000
G1 F3815
M204 S6000
G1 X125.347 Y139.125 E.26868
G1 X129.356 Y139.654 E.12424
G1 X130.639 Y129.909 E.30198
G1 X126.548 Y130.448 E.12678
M204 S10000
G1 X126.153 Y130.12 F42000
G1 F3815
M204 S6000
G1 X124.924 Y139.45 E.28916
G1 X129.681 Y140.077 E.14741
G1 X131.077 Y129.471 E.32867
G1 X126.212 Y130.112 E.15077
; WIPE_START
G1 F9547.299
G1 X128.195 Y129.851 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.65 Y128.442 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.533832
G1 F3815
M204 S6000
G1 X125.644 Y128.146 E.01181
; LINE_WIDTH: 0.496095
G1 X125.644 Y128.131 E.00058
G3 X125.599 Y127.493 I15.048 J-1.371 E.02363
; LINE_WIDTH: 0.530851
G1 X125.606 Y127.421 E.00285
; LINE_WIDTH: 0.564186
G1 X125.614 Y127.35 E.00305
; LINE_WIDTH: 0.556708
G1 X125.655 Y127.37 E.00192
; LINE_WIDTH: 0.508431
G1 X125.696 Y127.389 E.00174
; LINE_WIDTH: 0.460154
G1 X125.738 Y127.409 E.00156
; LINE_WIDTH: 0.411877
G1 X125.779 Y127.428 E.00138
; LINE_WIDTH: 0.363601
G1 X125.821 Y127.448 E.0012
; LINE_WIDTH: 0.315324
G1 X125.862 Y127.468 E.00102
; LINE_WIDTH: 0.267047
G1 X125.903 Y127.487 E.00084
M204 S10000
M73 P37 R12
G1 X125.614 Y127.35 F42000
; LINE_WIDTH: 0.580853
G1 F3815
M204 S6000
G1 X124.313 Y117.466 E.437
; LINE_WIDTH: 0.556707
G1 X124.347 Y117.436 E.00192
; LINE_WIDTH: 0.508428
G1 X124.382 Y117.407 E.00174
; LINE_WIDTH: 0.460149
G1 X124.417 Y117.377 E.00156
; LINE_WIDTH: 0.41187
G1 X124.452 Y117.347 E.00138
; LINE_WIDTH: 0.36359
G1 X124.487 Y117.318 E.0012
; LINE_WIDTH: 0.315311
G1 X124.522 Y117.288 E.00102
; LINE_WIDTH: 0.267032
G1 X124.557 Y117.258 E.00084
M204 S10000
G1 X124.313 Y117.466 F42000
; LINE_WIDTH: 0.555834
G1 F3815
M204 S6000
G1 X124.274 Y117.365 E.0045
; LINE_WIDTH: 0.482418
G1 X124.236 Y117.265 E.00385
G1 X124.025 Y115.665 E.0578
M204 S10000
G1 X130.321 Y114.835 F42000
; LINE_WIDTH: 0.480849
G1 F3815
M204 S6000
G1 X130.531 Y116.436 E.05761
; LINE_WIDTH: 0.505857
G1 X130.52 Y116.543 E.00406
; LINE_WIDTH: 0.555846
G1 X130.509 Y116.65 E.0045
; LINE_WIDTH: 0.580847
G1 X131.81 Y126.534 E.437
M204 S10000
G1 X131.566 Y126.742 F42000
; LINE_WIDTH: 0.267032
G1 F3815
M204 S6000
G1 X131.601 Y126.712 E.00084
; LINE_WIDTH: 0.315311
G1 X131.636 Y126.682 E.00102
; LINE_WIDTH: 0.36359
G1 X131.671 Y126.653 E.0012
; LINE_WIDTH: 0.411869
G1 X131.706 Y126.623 E.00138
; LINE_WIDTH: 0.460148
G1 X131.741 Y126.593 E.00156
; LINE_WIDTH: 0.508428
G1 X131.775 Y126.564 E.00174
; LINE_WIDTH: 0.556707
G1 X131.81 Y126.534 E.00192
; LINE_WIDTH: 0.555838
G1 X131.849 Y126.635 E.0045
; LINE_WIDTH: 0.505844
G1 X131.887 Y126.735 E.00406
; LINE_WIDTH: 0.468363
G3 X131.983 Y127.596 I-25.794 J3.296 E.03003
; LINE_WIDTH: 0.423343
G1 X132.014 Y128 E.01255
; LINE_WIDTH: 0.387826
G1 X132.032 Y128.342 E.00963
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10437.63
G1 X132.014 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/73
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z1.4 I-.189 J-1.202 P1  F42000
G1 X126.188 Y128.914 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2720
M204 S5000
G1 X126.029 Y127.704 E.03749
G1 X126.529 Y127.638 E.01549
G1 X131.501 Y126.984 E.15412
G1 X131.661 Y128.193 E.03749
G1 X126.247 Y128.906 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.029 Y127.704 E-.46415
G1 X126.529 Y127.638 E-.19161
G1 X126.8 Y127.603 E-.10425
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.375 Y135.101 Z1.6 F42000
G1 X124.485 Y139.788 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2720
M204 S6000
G1 X125.803 Y129.77 E.33516
G1 X131.533 Y129.016 E.19169
G1 X130.019 Y140.517 E.38478
G1 X124.544 Y139.795 E.18317
M204 S10000
G1 X124.028 Y140.138 F42000
G1 F2720
M204 S6000
G1 X125.542 Y128.638 E.38478
G1 X125.756 Y128.638 E.0071
G1 X125.85 Y129.354 E.02395
G1 X131.979 Y128.547 E.20504
G1 X131.961 Y128.808 E.00869
G1 X130.369 Y140.973 E.40698
G1 X124.087 Y140.146 E.21017
; WIPE_START
G1 F8843.478
G1 X124.338 Y138.162 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.267 Y130.777 Z1.6 F42000
G1 X130.012 Y116.438 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2720
M204 S5000
G1 X131.385 Y126.868 E.32325
G1 X126.111 Y127.562 E.16347
G1 X124.738 Y117.132 E.32325
G1 X126.565 Y116.892 E.05664
G1 X129.953 Y116.446 E.10498
M204 S250
G1 X130.094 Y116.296 F42000
G1 F2720
M204 S5000
G1 X124.622 Y117.016 E.16961
G1 X124.462 Y115.807 E.03749
G1 X124.962 Y115.741 E.01549
G1 X129.935 Y115.086 E.15412
G1 X130.086 Y116.236 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.107 Y116.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.688 Y124.019 Z1.6 F42000
G1 X123.614 Y140.277 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F2720
M204 S5000
G1 X125.188 Y128.32 E.37059
G2 X125.188 Y127.678 I-3.371 J-.32 E.01976
G1 X123.614 Y115.72 E.3706
G3 X123.772 Y115.5 I.192 J-.028 E.00921
G1 X130.511 Y114.613 E.20884
G3 X130.583 Y114.615 I.028 J.21 E.00223
G3 X130.732 Y114.783 I-.042 J.188 E.00738
G1 X132.306 Y126.736 E.37045
G3 X132.306 Y129.264 I-10.795 J1.264 E.07786
G1 X130.732 Y141.217 E.37045
G3 X130.511 Y141.387 I-.192 J-.02 E.00961
G1 X123.77 Y140.499 E.20892
G3 X123.614 Y140.338 I.036 J-.191 E.00736
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.874 Y138.355 E-.76
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


G1 X130.016 Y137.865 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2720
M204 S6000
G1 X129.804 Y139.479 E.05401
G3 X129.113 Y140.046 I-3.515 J-3.583 E.02968
G1 X126.752 Y139.735 E.079
G1 X126.69 Y139.682 E.00271
G2 X124.902 Y139.284 I-1.175 J1.068 E.06475
G1 X125.265 Y136.527 E.09224
G1 X125.379 Y136.513 E.00382
G1 X126.035 Y136.719 E.02278
G1 X126.69 Y137.284 E.02868
G2 X128.655 Y137.625 I1.209 J-1.133 E.07101
G3 X129.966 Y136.591 I6.437 J6.811 E.05544
G1 X130.187 Y136.565 E.00741
G1 X130.536 Y133.92 E.08851
G1 X129.966 Y134.099 E.01983
G1 X129.31 Y134.663 E.02868
G3 X127.345 Y135.005 I-1.209 J-1.133 E.07101
G2 X126.035 Y133.971 I-6.437 J6.811 E.05544
G1 X125.608 Y133.92 E.01424
G1 X125.934 Y131.446 E.08276
G1 X126.69 Y132.042 E.03193
G2 X128.655 Y132.384 I1.209 J-1.133 E.07101
G3 X129.966 Y131.35 I6.438 J6.813 E.05544
G1 X130.621 Y131.272 E.02189
G1 X130.874 Y131.352 E.0088
G1 X131.128 Y129.421 E.06461
G1 X128.903 Y129.714 E.07444
G1 X128.655 Y129.891 E.01011
G1 X128 Y129.969 E.02189
G1 X127.693 Y129.873 E.01066
G1 X126.109 Y130.115 E.05317
; WIPE_START
G1 F8843.478
G1 X127.693 Y129.873 E-.60904
G1 X128 Y129.969 E-.12214
G1 X128.075 Y129.96 E-.02882
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.614 Y127.35 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.556717
G1 F2720
M204 S6000
G1 X125.655 Y127.37 E.00192
; LINE_WIDTH: 0.508445
G1 X125.696 Y127.389 E.00174
; LINE_WIDTH: 0.460174
G1 X125.738 Y127.409 E.00156
; LINE_WIDTH: 0.411903
G1 X125.779 Y127.428 E.00138
; LINE_WIDTH: 0.363631
G1 X125.821 Y127.448 E.0012
; LINE_WIDTH: 0.31536
G1 X125.862 Y127.468 E.00102
; LINE_WIDTH: 0.267089
G1 X125.903 Y127.487 E.00084
M204 S10000
G1 X125.651 Y128.442 F42000
; LINE_WIDTH: 0.533995
G1 F2720
M204 S6000
G1 X125.644 Y128.148 E.01175
; LINE_WIDTH: 0.496178
G3 X125.599 Y127.493 I26.91 J-2.185 E.02427
; LINE_WIDTH: 0.530846
G1 X125.606 Y127.421 E.00285
; LINE_WIDTH: 0.564184
G1 X125.614 Y127.35 E.00305
; LINE_WIDTH: 0.580837
G1 X124.313 Y117.466 E.43699
; LINE_WIDTH: 0.556697
G1 X124.347 Y117.436 E.00192
; LINE_WIDTH: 0.508419
G1 X124.382 Y117.407 E.00174
; LINE_WIDTH: 0.460142
G1 X124.417 Y117.377 E.00156
; LINE_WIDTH: 0.411864
G1 X124.452 Y117.347 E.00138
; LINE_WIDTH: 0.363587
G1 X124.487 Y117.318 E.0012
; LINE_WIDTH: 0.315309
G1 X124.522 Y117.288 E.00102
; LINE_WIDTH: 0.267031
G1 X124.557 Y117.258 E.00084
M204 S10000
G1 X124.313 Y117.466 F42000
; LINE_WIDTH: 0.555847
G1 F2720
M204 S6000
G1 X124.274 Y117.365 E.0045
; LINE_WIDTH: 0.482425
G1 X124.236 Y117.265 E.00385
G1 X124.025 Y115.665 E.05781
M204 S10000
G1 X130.321 Y114.835 F42000
; LINE_WIDTH: 0.482432
G1 F2720
M204 S6000
G1 X130.531 Y116.436 E.05782
G1 X130.52 Y116.543 E.00385
; LINE_WIDTH: 0.555855
G1 X130.509 Y116.65 E.0045
; LINE_WIDTH: 0.580855
G1 X131.81 Y126.534 E.43701
M204 S10000
G1 X131.566 Y126.742 F42000
; LINE_WIDTH: 0.267032
G1 F2720
M204 S6000
G1 X131.601 Y126.712 E.00084
; LINE_WIDTH: 0.315311
G1 X131.636 Y126.682 E.00102
; LINE_WIDTH: 0.36359
G1 X131.671 Y126.653 E.0012
; LINE_WIDTH: 0.411869
G1 X131.706 Y126.623 E.00138
; LINE_WIDTH: 0.460148
G1 X131.741 Y126.593 E.00156
; LINE_WIDTH: 0.508428
G1 X131.775 Y126.564 E.00174
; LINE_WIDTH: 0.556707
G1 X131.81 Y126.534 E.00192
; LINE_WIDTH: 0.555856
G1 X131.849 Y126.635 E.0045
; LINE_WIDTH: 0.505863
G1 X131.887 Y126.735 E.00406
; LINE_WIDTH: 0.468358
G3 X131.983 Y127.596 I-25.775 J3.294 E.03003
; LINE_WIDTH: 0.423323
G1 X132.014 Y128 E.01255
; LINE_WIDTH: 0.387807
G1 X132.032 Y128.342 E.00963
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10438.198
G1 X132.014 Y128 E-.76
; WIPE_END
M73 P37 R11
G1 E-.04 F1800
; layer num/total_layer_count: 7/73
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z1.6 I-.189 J-1.202 P1  F42000
G1 X126.188 Y128.914 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2701
M204 S5000
G1 X126.029 Y127.704 E.03749
G1 X126.723 Y127.613 E.02152
G1 X131.501 Y126.984 E.14809
G1 X131.661 Y128.193 E.03749
G1 X126.247 Y128.906 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.029 Y127.704 E-.46416
G1 X126.723 Y127.613 E-.26615
G1 X126.8 Y127.603 E-.0297
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.375 Y135.101 Z1.8 F42000
G1 X124.485 Y139.788 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2701
M204 S6000
G1 X125.803 Y129.77 E.33516
G1 X131.533 Y129.016 E.19169
G1 X130.018 Y140.517 E.38478
G1 X124.544 Y139.795 E.18317
M204 S10000
G1 X124.028 Y140.138 F42000
G1 F2701
M204 S6000
G1 X125.542 Y128.638 E.38478
G1 X125.756 Y128.638 E.0071
G1 X125.85 Y129.354 E.02395
G1 X131.979 Y128.547 E.20504
G1 X131.961 Y128.808 E.00869
G1 X130.369 Y140.973 E.40698
G1 X124.087 Y140.146 E.21017
; WIPE_START
G1 F8843.478
G1 X124.338 Y138.162 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.267 Y130.777 Z1.8 F42000
G1 X130.012 Y116.438 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2701
M204 S5000
M73 P38 R11
G1 X131.385 Y126.868 E.32325
G1 X126.111 Y127.562 E.16347
G1 X124.738 Y117.132 E.32325
G1 X127.285 Y116.797 E.07895
G1 X129.953 Y116.446 E.08268
M204 S250
G1 X130.094 Y116.296 F42000
G1 F2701
M204 S5000
G1 X124.622 Y117.016 E.16961
G1 X124.462 Y115.807 E.03749
G1 X125.157 Y115.715 E.02152
G1 X129.935 Y115.086 E.14809
G1 X130.086 Y116.236 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.107 Y116.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.688 Y124.019 Z1.8 F42000
G1 X123.614 Y140.277 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F2701
M204 S5000
G1 X125.188 Y128.32 E.37059
G2 X125.188 Y127.678 I-3.384 J-.32 E.01975
G1 X123.614 Y115.72 E.37061
G3 X123.772 Y115.5 I.19 J-.03 E.00924
G1 X130.51 Y114.613 E.20883
G3 X130.585 Y114.615 I.029 J.217 E.0023
G3 X130.732 Y114.783 I-.044 J.188 E.00732
G1 X132.306 Y126.736 E.37045
G3 X132.306 Y129.264 I-10.928 J1.264 E.07785
G1 X130.732 Y141.217 E.37046
G3 X130.51 Y141.387 I-.193 J-.022 E.00959
G1 X123.77 Y140.499 E.20891
G3 X123.614 Y140.338 I.036 J-.191 E.00735
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.874 Y138.355 E-.76
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


G1 X125.126 Y137.585 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2701
M204 S6000
G1 X124.913 Y139.199 E.05401
G3 X126.471 Y139.698 I.329 J1.654 E.05663
G1 X128.933 Y140.022 E.08237
G3 X129.824 Y139.329 I5.24 J5.814 E.03748
G1 X130.177 Y136.646 E.08976
G1 X129.966 Y136.708 E.00731
G1 X129.31 Y137.262 E.02846
G3 X127.345 Y137.636 I-1.234 J-1.136 E.07111
G2 X126.035 Y136.605 I-7.786 J8.544 E.05536
G1 X125.379 Y136.515 E.02194
G1 X125.262 Y136.549 E.00406
G1 X125.603 Y133.96 E.08663
G1 X126.035 Y134.088 E.01493
G1 X126.69 Y134.642 E.02846
G2 X128.655 Y135.015 I1.234 J-1.136 E.0711
G3 X129.966 Y133.984 I7.786 J8.544 E.05536
G1 X130.538 Y133.905 E.01915
G1 X130.879 Y131.309 E.08688
G1 X130.621 Y131.273 E.00866
G1 X129.966 Y131.467 E.02266
G1 X129.31 Y132.021 E.02846
G3 X127.345 Y132.395 I-1.234 J-1.136 E.0711
G2 X126.035 Y131.363 I-7.786 J8.544 E.05536
G1 X125.946 Y131.351 E.00295
G1 X126.114 Y130.081 E.04251
G1 X127.496 Y129.899 E.04626
G1 X128 Y129.968 E.01687
G1 X128.694 Y129.741 E.02423
G1 X130.309 Y129.528 E.05401
; WIPE_START
G1 F8843.478
G1 X128.694 Y129.741 E-.61876
G1 X128.341 Y129.856 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.032 Y128.342 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.387731
G1 F2701
M204 S6000
G1 X132.014 Y128.001 E.0096
; LINE_WIDTH: 0.424173
G1 X131.98 Y127.569 E.01347
; LINE_WIDTH: 0.469086
G2 X131.887 Y126.735 I-25.672 J2.435 E.02913
; LINE_WIDTH: 0.505861
G1 X131.849 Y126.635 E.00406
; LINE_WIDTH: 0.55585
G1 X131.81 Y126.534 E.0045
; LINE_WIDTH: 0.556707
G1 X131.775 Y126.564 E.00192
; LINE_WIDTH: 0.508428
G1 X131.741 Y126.593 E.00174
; LINE_WIDTH: 0.460148
G1 X131.706 Y126.623 E.00156
; LINE_WIDTH: 0.411869
G1 X131.671 Y126.653 E.00138
; LINE_WIDTH: 0.36359
G1 X131.636 Y126.682 E.0012
; LINE_WIDTH: 0.315311
G1 X131.601 Y126.712 E.00102
; LINE_WIDTH: 0.267032
G1 X131.566 Y126.742 E.00084
M204 S10000
G1 X131.81 Y126.534 F42000
; LINE_WIDTH: 0.580848
G1 F2701
M204 S6000
G1 X130.509 Y116.65 E.437
; LINE_WIDTH: 0.555846
G1 X130.52 Y116.543 E.0045
; LINE_WIDTH: 0.505859
G1 X130.531 Y116.436 E.00406
; LINE_WIDTH: 0.480849
G1 X130.321 Y114.835 E.05761
M204 S10000
G1 X124.025 Y115.665 F42000
; LINE_WIDTH: 0.481564
G1 F2701
M204 S6000
G1 X124.236 Y117.265 E.05769
G1 X124.261 Y117.332 E.00256
; LINE_WIDTH: 0.530847
G1 X124.287 Y117.399 E.00285
; LINE_WIDTH: 0.564183
G1 X124.313 Y117.466 E.00305
; LINE_WIDTH: 0.556697
G1 X124.347 Y117.436 E.00192
; LINE_WIDTH: 0.508426
G1 X124.382 Y117.407 E.00174
; LINE_WIDTH: 0.460155
G1 X124.417 Y117.377 E.00156
; LINE_WIDTH: 0.411885
G1 X124.452 Y117.347 E.00138
; LINE_WIDTH: 0.363614
G1 X124.487 Y117.318 E.0012
; LINE_WIDTH: 0.315343
G1 X124.522 Y117.288 E.00102
; LINE_WIDTH: 0.267073
G1 X124.557 Y117.258 E.00084
M204 S10000
G1 X124.313 Y117.466 F42000
; LINE_WIDTH: 0.580836
G1 F2701
M204 S6000
G1 X125.614 Y127.35 E.43699
; LINE_WIDTH: 0.556714
G1 X125.655 Y127.37 E.00192
; LINE_WIDTH: 0.508436
G1 X125.696 Y127.389 E.00174
; LINE_WIDTH: 0.460159
G1 X125.738 Y127.409 E.00156
; LINE_WIDTH: 0.411882
G1 X125.779 Y127.428 E.00138
; LINE_WIDTH: 0.363604
G1 X125.821 Y127.448 E.0012
; LINE_WIDTH: 0.315327
G1 X125.862 Y127.468 E.00102
; LINE_WIDTH: 0.267049
G1 X125.903 Y127.487 E.00084
M204 S10000
G1 X125.614 Y127.35 F42000
; LINE_WIDTH: 0.555855
G1 F2701
M204 S6000
G1 X125.603 Y127.457 E.0045
; LINE_WIDTH: 0.505856
G1 X125.592 Y127.564 E.00406
; LINE_WIDTH: 0.496119
G1 X125.644 Y128.15 E.02173
; LINE_WIDTH: 0.534139
G1 X125.65 Y128.442 E.01168
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7328.712
G1 X125.644 Y128.15 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/73
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; OBJECT_ID: 394
M204 S250
M204 S10000
G17
G3 Z1.8 I-.991 J.706 P1  F42000
G1 X126.188 Y128.914 Z1.8
M204 S10000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2698
M204 S5000
G1 X126.029 Y127.704 E.03749
G1 X126.917 Y127.587 E.02755
G1 X131.501 Y126.984 E.14207
G1 X131.661 Y128.193 E.03749
G1 X126.247 Y128.906 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.029 Y127.704 E-.46416
G1 X126.8 Y127.603 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.375 Y135.101 Z2 F42000
G1 X124.485 Y139.788 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2698
M204 S6000
G1 X125.803 Y129.77 E.33516
G1 X131.533 Y129.016 E.19169
G1 X130.018 Y140.517 E.38478
G1 X124.544 Y139.795 E.18317
M204 S10000
G1 X124.028 Y140.138 F42000
G1 F2698
M204 S6000
G1 X125.542 Y128.638 E.38478
G1 X125.756 Y128.638 E.0071
G1 X125.85 Y129.354 E.02395
G1 X131.979 Y128.547 E.20504
G1 X131.961 Y128.808 E.00869
G1 X130.369 Y140.973 E.40698
G1 X124.087 Y140.146 E.21017
; WIPE_START
G1 F8843.478
G1 X124.338 Y138.162 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.267 Y130.777 Z2 F42000
G1 X130.012 Y116.438 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2698
M204 S5000
G1 X131.385 Y126.868 E.32325
G1 X126.111 Y127.562 E.16347
G1 X124.738 Y117.132 E.32325
G1 X128.005 Y116.702 E.10125
G1 X129.953 Y116.446 E.06037
M204 S250
G1 X130.094 Y116.296 F42000
G1 F2698
M204 S5000
G1 X124.622 Y117.016 E.16961
G1 X124.462 Y115.807 E.03749
G1 X125.351 Y115.69 E.02755
G1 X129.935 Y115.086 E.14207
G1 X130.086 Y116.236 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.107 Y116.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.688 Y124.019 Z2 F42000
G1 X123.614 Y140.277 Z2
G1 Z1.6
G1 E.8 F1800
G1 F2698
M204 S5000
G1 X125.188 Y128.32 E.37059
G2 X125.188 Y127.68 I-2.785 J-.32 E.0197
G1 X123.614 Y115.72 E.37068
G3 X123.772 Y115.5 I.19 J-.03 E.00923
G1 X130.51 Y114.613 E.20884
G3 X130.582 Y114.615 I.029 J.211 E.00223
G3 X130.732 Y114.783 I-.042 J.188 E.00739
G1 X132.306 Y126.736 E.37045
G3 X132.352 Y128.842 I-9.99 J1.273 E.06486
G1 X130.733 Y141.215 E.38341
M73 P39 R11
G3 X130.511 Y141.387 I-.194 J-.02 E.00966
G1 X123.725 Y140.486 E.21034
G3 X123.615 Y140.338 I.087 J-.18 E.0059
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.874 Y138.355 E-.76
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


G1 X125.14 Y137.478 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2698
M204 S6000
G1 X124.927 Y139.092 E.05401
G1 X125.379 Y139.112 E.01501
G1 X126.035 Y139.427 E.02411
G1 X126.272 Y139.672 E.01132
G1 X128.804 Y140.005 E.08472
G3 X129.85 Y139.127 I2.239 J1.604 E.04578
G1 X130.169 Y136.709 E.08092
G1 X129.966 Y136.806 E.00747
G3 X128.983 Y137.757 I-5.238 J-4.429 E.04544
G3 X127.345 Y137.538 I-.614 J-1.645 E.05707
G1 X126.69 Y136.863 E.0312
G2 X126.035 Y136.463 I-.9 J.735 E.02597
G1 X125.379 Y136.491 E.02175
G1 X125.262 Y136.548 E.00431
G1 X125.601 Y133.977 E.08601
G1 X126.035 Y134.186 E.01597
G2 X127.017 Y135.137 I5.239 J-4.43 E.04544
G2 X128.655 Y134.918 I.614 J-1.645 E.05707
G1 X129.31 Y134.243 E.0312
G3 X130.543 Y133.867 I.92 J.809 E.04499
G1 X130.889 Y131.238 E.08796
G1 X130.621 Y131.25 E.0089
G1 X129.966 Y131.565 E.02411
G3 X128.983 Y132.516 I-5.239 J-4.43 E.04544
G3 X127.345 Y132.297 I-.614 J-1.645 E.05707
G1 X126.69 Y131.622 E.0312
G2 X125.963 Y131.224 I-.897 J.776 E.02807
G1 X126.114 Y130.081 E.03827
G1 X127.147 Y129.945 E.03457
G2 X128.455 Y129.773 I.453 J-1.613 E.04499
G1 X130.069 Y129.56 E.05401
; WIPE_START
G1 F8843.478
G1 X128.455 Y129.773 E-.61876
G1 X128.12 Y129.933 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.032 Y128.342 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.387807
G1 F2698
M204 S6000
G1 X132.014 Y128 E.00962
; LINE_WIDTH: 0.423334
G1 X131.983 Y127.596 E.01256
; LINE_WIDTH: 0.468369
G2 X131.887 Y126.735 I-25.867 J2.432 E.03003
; LINE_WIDTH: 0.505862
G1 X131.849 Y126.635 E.00406
; LINE_WIDTH: 0.555853
G1 X131.81 Y126.534 E.0045
M204 S10000
G1 X131.566 Y126.742 F42000
; LINE_WIDTH: 0.267011
G1 F2698
M204 S6000
G1 X131.601 Y126.712 E.00084
; LINE_WIDTH: 0.315292
G1 X131.636 Y126.682 E.00102
; LINE_WIDTH: 0.363573
G1 X131.671 Y126.653 E.0012
; LINE_WIDTH: 0.411855
G1 X131.706 Y126.623 E.00138
; LINE_WIDTH: 0.460136
G1 X131.741 Y126.593 E.00156
; LINE_WIDTH: 0.508418
G1 X131.775 Y126.564 E.00174
; LINE_WIDTH: 0.556699
G1 X131.81 Y126.534 E.00192
; LINE_WIDTH: 0.580845
G1 X130.509 Y116.65 E.437
; LINE_WIDTH: 0.555856
G1 X130.52 Y116.543 E.0045
; LINE_WIDTH: 0.482423
G1 X130.531 Y116.436 E.00385
G1 X130.321 Y114.835 E.05782
M204 S10000
G1 X124.025 Y115.665 F42000
; LINE_WIDTH: 0.482419
G1 F2698
M204 S6000
G1 X124.236 Y117.265 E.0578
G1 X124.274 Y117.365 E.00385
; LINE_WIDTH: 0.555836
G1 X124.313 Y117.466 E.0045
; LINE_WIDTH: 0.556707
G1 X124.347 Y117.436 E.00192
; LINE_WIDTH: 0.508428
G1 X124.382 Y117.407 E.00174
; LINE_WIDTH: 0.460148
G1 X124.417 Y117.377 E.00156
; LINE_WIDTH: 0.411869
G1 X124.452 Y117.347 E.00138
; LINE_WIDTH: 0.36359
G1 X124.487 Y117.318 E.0012
; LINE_WIDTH: 0.315311
G1 X124.522 Y117.288 E.00102
; LINE_WIDTH: 0.267032
G1 X124.557 Y117.258 E.00084
M204 S10000
G1 X124.313 Y117.466 F42000
; LINE_WIDTH: 0.580843
G1 F2698
M204 S6000
G1 X125.614 Y127.35 E.437
; LINE_WIDTH: 0.556696
G1 X125.655 Y127.37 E.00192
; LINE_WIDTH: 0.508419
G1 X125.696 Y127.389 E.00174
; LINE_WIDTH: 0.460141
G1 X125.738 Y127.409 E.00156
; LINE_WIDTH: 0.411863
G1 X125.779 Y127.428 E.00138
; LINE_WIDTH: 0.363585
G1 X125.821 Y127.448 E.0012
; LINE_WIDTH: 0.315308
G1 X125.862 Y127.468 E.00102
; LINE_WIDTH: 0.26703
G1 X125.903 Y127.487 E.00084
M204 S10000
G1 X125.614 Y127.35 F42000
; LINE_WIDTH: 0.555844
G1 F2698
M204 S6000
G1 X125.603 Y127.457 E.0045
; LINE_WIDTH: 0.505852
G1 X125.592 Y127.564 E.00406
; LINE_WIDTH: 0.495681
G1 X125.644 Y128.143 E.02143
; LINE_WIDTH: 0.533468
G1 X125.651 Y128.442 E.01196
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7338.737
G1 X125.644 Y128.143 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/73
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; OBJECT_ID: 394
M204 S250
M204 S10000
G17
G3 Z2 I-.995 J.701 P1  F42000
G1 X126.188 Y128.914 Z2
M204 S10000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2780
M204 S5000
G1 X126.029 Y127.704 E.03749
G1 X127.112 Y127.562 E.03357
G1 X131.501 Y126.984 E.13604
G1 X131.661 Y128.193 E.03749
G1 X126.247 Y128.906 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.029 Y127.704 E-.46415
G1 X126.801 Y127.603 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.375 Y135.101 Z2.2 F42000
G1 X124.485 Y139.788 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2780
M204 S6000
G1 X125.803 Y129.77 E.33516
G1 X131.533 Y129.016 E.19169
G1 X130.018 Y140.517 E.38478
G1 X124.544 Y139.795 E.18317
M204 S10000
G1 X124.028 Y140.138 F42000
G1 F2780
M204 S6000
G1 X125.542 Y128.638 E.38478
G1 X125.756 Y128.638 E.0071
G1 X125.85 Y129.354 E.02395
G1 X131.979 Y128.547 E.20504
G1 X131.961 Y128.808 E.00869
G1 X130.369 Y140.973 E.40698
G1 X124.087 Y140.146 E.21017
; WIPE_START
G1 F8843.478
G1 X124.338 Y138.162 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.267 Y130.777 Z2.2 F42000
G1 X130.012 Y116.438 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2780
M204 S5000
G1 X131.385 Y126.868 E.32325
G1 X126.111 Y127.562 E.16347
G1 X124.738 Y117.132 E.32325
G1 X128.724 Y116.607 E.12356
G1 X129.953 Y116.446 E.03807
M204 S250
G1 X130.094 Y116.296 F42000
G1 F2780
M204 S5000
G1 X124.622 Y117.016 E.16961
G1 X124.462 Y115.807 E.03749
G1 X125.546 Y115.664 E.03358
G1 X129.935 Y115.086 E.13604
G1 X130.086 Y116.236 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.107 Y116.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.688 Y124.019 Z2.2 F42000
G1 X123.614 Y140.277 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F2780
M204 S5000
G1 X125.188 Y128.32 E.37058
G2 X125.188 Y127.678 I-3.412 J-.32 E.01976
G1 X123.614 Y115.72 E.37061
G3 X123.772 Y115.5 I.192 J-.028 E.00921
G1 X130.51 Y114.613 E.20884
G3 X130.583 Y114.615 I.029 J.212 E.00224
G3 X130.733 Y114.785 I-.045 J.191 E.00742
G1 X132.306 Y126.736 E.37038
G3 X132.306 Y129.264 I-10.795 J1.264 E.07786
G1 X130.732 Y141.217 E.37045
G3 X130.511 Y141.387 I-.193 J-.022 E.00958
G1 X123.77 Y140.499 E.20891
G3 X123.614 Y140.338 I.036 J-.191 E.00736
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.874 Y138.355 E-.76
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


G1 X124.919 Y139.156 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2780
M204 S6000
G1 X124.875 Y139.488 E.01109
G1 X126.14 Y139.654 E.04231
G1 X126.035 Y139.511 E.00589
G1 X125.379 Y139.062 E.02636
G1 X124.946 Y138.954 E.01483
G1 X125.266 Y136.519 E.08149
G1 X125.379 Y136.441 E.00456
G1 X126.035 Y136.279 E.02239
G3 X126.69 Y136.565 I.081 J.709 E.02484
G1 X127.345 Y137.454 E.03662
G2 X128.983 Y138.026 I1.44 J-1.49 E.05938
G1 X129.31 Y137.779 E.0136
G1 X129.966 Y136.891 E.03662
G1 X130.162 Y136.756 E.00792
G1 X129.879 Y138.91 E.07208
G2 X129.31 Y139.186 I-.046 J.628 E.02194
G1 X128.715 Y139.994 E.03329
G1 X127.1 Y139.781 E.05401
; WIPE_START
G1 F8843.478
G1 X128.715 Y139.994 E-.61876
G1 X128.935 Y139.694 E-.14124
; WIPE_END
M73 P40 R11
G1 E-.04 F1800
M204 S10000
G1 X127.407 Y132.216 Z2.2 F42000
G1 X124.025 Y115.665 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.482421
G1 F2780
M204 S6000
G1 X124.236 Y117.265 E.0578
G1 X124.274 Y117.365 E.00385
; LINE_WIDTH: 0.555842
G1 X124.313 Y117.466 E.0045
; LINE_WIDTH: 0.556699
G1 X124.347 Y117.436 E.00192
; LINE_WIDTH: 0.508418
G1 X124.382 Y117.407 E.00174
; LINE_WIDTH: 0.460136
G1 X124.417 Y117.377 E.00156
; LINE_WIDTH: 0.411855
G1 X124.452 Y117.347 E.00138
; LINE_WIDTH: 0.363573
G1 X124.487 Y117.318 E.0012
; LINE_WIDTH: 0.315292
G1 X124.522 Y117.288 E.00102
; LINE_WIDTH: 0.267011
G1 X124.557 Y117.258 E.00084
M204 S10000
G1 X124.313 Y117.466 F42000
; LINE_WIDTH: 0.580841
G1 F2780
M204 S6000
G1 X125.614 Y127.35 E.437
M204 S10000
G1 X125.903 Y127.487 F42000
; LINE_WIDTH: 0.266993
G1 F2780
M204 S6000
G1 X125.862 Y127.468 E.00084
; LINE_WIDTH: 0.315278
G1 X125.821 Y127.448 E.00102
; LINE_WIDTH: 0.363562
G1 X125.779 Y127.428 E.0012
; LINE_WIDTH: 0.411846
G1 X125.738 Y127.409 E.00138
; LINE_WIDTH: 0.46013
G1 X125.696 Y127.389 E.00156
; LINE_WIDTH: 0.508414
G1 X125.655 Y127.37 E.00174
; LINE_WIDTH: 0.556698
G1 X125.614 Y127.35 E.00192
; LINE_WIDTH: 0.555851
G1 X125.603 Y127.457 E.0045
; LINE_WIDTH: 0.497805
G2 X125.637 Y128.002 I3.733 J.041 E.02027
G1 X125.644 Y128.153 E.00561
; LINE_WIDTH: 0.534447
G1 X125.65 Y128.442 E.01155
; WIPE_START
G1 F7324.117
G1 X125.644 Y128.153 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.814 Y132.358 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2780
M204 S6000
G1 X125.601 Y133.973 E.05401
G1 X126.035 Y134.27 E.01743
G1 X126.69 Y135.159 E.03662
G1 X127.017 Y135.405 E.0136
G2 X128.655 Y134.833 I.198 J-2.062 E.05938
G1 X129.31 Y133.944 E.03662
G1 X129.638 Y133.698 E.0136
G3 X130.551 Y133.803 I.318 J1.256 E.03117
G1 X130.903 Y131.13 E.08944
G1 X130.621 Y131.2 E.00964
G1 X129.966 Y131.65 E.02636
G1 X129.31 Y132.538 E.03662
G1 X128.983 Y132.785 E.0136
G3 X127.345 Y132.212 I-.198 J-2.062 E.05938
G1 X126.69 Y131.324 E.03662
G2 X125.986 Y131.05 I-.629 J.573 E.02595
G1 X126.114 Y130.081 E.03242
G1 X126.789 Y129.992 E.02258
G1 X127.017 Y130.164 E.00949
G2 X128.377 Y129.783 I.211 J-1.863 E.04802
G1 X129.991 Y129.57 E.05401
; WIPE_START
G1 F8843.478
G1 X128.377 Y129.783 E-.61876
G1 X128.07 Y129.993 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.81 Y126.534 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.556707
G1 F2780
M204 S6000
G1 X131.775 Y126.564 E.00192
; LINE_WIDTH: 0.508428
G1 X131.741 Y126.593 E.00174
; LINE_WIDTH: 0.460148
G1 X131.706 Y126.623 E.00156
; LINE_WIDTH: 0.411869
G1 X131.671 Y126.653 E.00138
; LINE_WIDTH: 0.36359
G1 X131.636 Y126.682 E.0012
; LINE_WIDTH: 0.315311
G1 X131.601 Y126.712 E.00102
; LINE_WIDTH: 0.267032
G1 X131.566 Y126.742 E.00084
M204 S10000
G1 X132.032 Y128.342 F42000
; LINE_WIDTH: 0.387806
G1 F2780
M204 S6000
G1 X132.014 Y128 E.00962
; LINE_WIDTH: 0.423322
G1 X131.983 Y127.596 E.01256
; LINE_WIDTH: 0.468361
G2 X131.887 Y126.735 I-25.871 J2.433 E.03003
; LINE_WIDTH: 0.505863
G1 X131.849 Y126.635 E.00406
; LINE_WIDTH: 0.555855
G1 X131.81 Y126.534 E.0045
; LINE_WIDTH: 0.580849
G1 X130.509 Y116.65 E.437
; LINE_WIDTH: 0.555841
G1 X130.52 Y116.543 E.0045
; LINE_WIDTH: 0.482411
G1 X130.531 Y116.436 E.00385
G1 X130.321 Y114.835 E.05782
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8191.294
G1 X130.531 Y116.436 E-.71252
G1 X130.52 Y116.543 E-.04748
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/73
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z2.2 I-1.149 J-.402 P1  F42000
G1 X126.188 Y128.914 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2784
M204 S5000
G1 X126.029 Y127.704 E.03749
G1 X127.306 Y127.536 E.0396
G1 X131.501 Y126.984 E.13001
G1 X131.661 Y128.193 E.03749
G1 X126.247 Y128.906 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.029 Y127.704 E-.46416
G1 X126.8 Y127.603 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.375 Y135.101 Z2.4 F42000
G1 X124.485 Y139.788 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2784
M204 S6000
G1 X125.803 Y129.77 E.33516
G1 X131.533 Y129.016 E.19169
G1 X130.019 Y140.517 E.38478
G1 X124.544 Y139.795 E.18317
M204 S10000
G1 X124.028 Y140.138 F42000
G1 F2784
M204 S6000
G1 X125.542 Y128.638 E.38478
G1 X125.756 Y128.638 E.0071
G1 X125.85 Y129.354 E.02395
G1 X131.979 Y128.547 E.20504
G1 X131.961 Y128.808 E.00869
G1 X130.369 Y140.973 E.40698
G1 X124.087 Y140.146 E.21017
; WIPE_START
G1 F8843.478
G1 X124.338 Y138.162 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.267 Y130.777 Z2.4 F42000
G1 X130.012 Y116.438 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2784
M204 S5000
G1 X131.385 Y126.868 E.32325
G1 X126.111 Y127.562 E.16347
G1 X124.738 Y117.132 E.32325
G1 X129.444 Y116.513 E.14586
G1 X129.953 Y116.446 E.01576
M204 S250
G1 X130.094 Y116.296 F42000
G1 F2784
M204 S5000
G1 X124.622 Y117.016 E.16961
G1 X124.462 Y115.807 E.03749
G1 X125.74 Y115.639 E.0396
G1 X129.935 Y115.086 E.13001
G1 X130.086 Y116.236 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.107 Y116.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.688 Y124.019 Z2.4 F42000
G1 X123.614 Y140.277 Z2.4
G1 Z2
G1 E.8 F1800
G1 F2784
M204 S5000
G1 X125.188 Y128.32 E.37059
G2 X125.188 Y127.68 I-2.786 J-.32 E.0197
G1 X123.614 Y115.72 E.37068
G3 X123.77 Y115.501 I.19 J-.03 E.00916
G1 X130.51 Y114.613 E.20891
G3 X130.583 Y114.615 I.029 J.211 E.00224
G3 X130.732 Y114.783 I-.045 J.191 E.00737
G1 X132.306 Y126.736 E.37044
G3 X132.306 Y129.264 I-10.794 J1.264 E.07786
G1 X130.732 Y141.217 E.37044
G3 X130.511 Y141.387 I-.193 J-.022 E.0096
G1 X123.725 Y140.486 E.21034
G3 X123.615 Y140.338 I.087 J-.18 E.00589
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.874 Y138.355 E-.76
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


G1 X129.601 Y140.11 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2784
M204 S6000
G1 X129.719 Y140.126 E.00395
G1 X129.916 Y138.629 E.05006
G3 X129.508 Y138.155 I.092 J-.492 E.02243
G3 X130.157 Y136.794 I2.765 J.484 E.05066
G1 X130.56 Y133.738 E.10225
G1 X129.645 Y133.241 E.03451
G1 X129.508 Y132.914 E.01179
G3 X130.39 Y131.276 I2.986 J.551 E.06272
G1 X130.922 Y130.987 E.02009
G1 X131.128 Y129.421 E.0524
G1 X128.386 Y129.782 E.09176
G1 X128.231 Y129.965 E.00796
G1 X127.025 Y130.621 E.04554
G1 X126.887 Y130.948 E.01179
G2 X127.769 Y132.586 I2.986 J-.551 E.06272
G1 X128.976 Y133.241 E.04554
G1 X129.113 Y133.569 E.01179
G3 X128.231 Y135.207 I-2.986 J-.551 E.06272
G1 X127.025 Y135.862 E.04554
G1 X126.887 Y136.19 E.01179
G2 X127.769 Y137.827 I2.986 J-.551 E.06272
G1 X128.976 Y138.483 E.04554
G1 X129.113 Y138.81 E.01179
G3 X128.781 Y139.793 I-2.832 J-.409 E.0346
G1 X128.623 Y139.981 E.00816
G1 X126.032 Y139.64 E.08668
G2 X124.967 Y138.789 I-1.615 J.927 E.04631
G1 X125.275 Y136.448 E.07831
G1 X126.355 Y135.862 E.04074
G1 X126.493 Y135.534 E.01179
G2 X125.611 Y133.897 I-2.985 J.551 E.06268
G1 X126.019 Y130.803 E.10352
G2 X126.44 Y130.038 I-.143 J-.578 E.03255
G1 X127.76 Y129.864 E.04416
; WIPE_START
G1 F8843.478
M73 P41 R11
G1 X126.44 Y130.038 E-.50584
G1 X126.493 Y130.293 E-.09903
G1 X126.355 Y130.621 E-.13504
G1 X126.308 Y130.646 E-.02009
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.651 Y128.442 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.533489
G1 F2784
M204 S6000
G1 X125.644 Y128.143 E.01196
; LINE_WIDTH: 0.495682
G1 X125.592 Y127.564 E.02143
; LINE_WIDTH: 0.505854
G1 X125.603 Y127.457 E.00406
; LINE_WIDTH: 0.555845
G1 X125.614 Y127.35 E.0045
; LINE_WIDTH: 0.556696
G1 X125.655 Y127.37 E.00192
; LINE_WIDTH: 0.508419
G1 X125.696 Y127.389 E.00174
; LINE_WIDTH: 0.460141
G1 X125.738 Y127.409 E.00156
; LINE_WIDTH: 0.411863
G1 X125.779 Y127.428 E.00138
; LINE_WIDTH: 0.363585
G1 X125.821 Y127.448 E.0012
; LINE_WIDTH: 0.315308
G1 X125.862 Y127.468 E.00102
; LINE_WIDTH: 0.26703
G1 X125.903 Y127.487 E.00084
M204 S10000
G1 X125.614 Y127.35 F42000
; LINE_WIDTH: 0.580845
G1 F2784
M204 S6000
G1 X124.313 Y117.466 E.437
; LINE_WIDTH: 0.556707
G1 X124.347 Y117.436 E.00192
; LINE_WIDTH: 0.508428
G1 X124.382 Y117.407 E.00174
; LINE_WIDTH: 0.460148
G1 X124.417 Y117.377 E.00156
; LINE_WIDTH: 0.411869
G1 X124.452 Y117.347 E.00138
; LINE_WIDTH: 0.36359
G1 X124.487 Y117.318 E.0012
; LINE_WIDTH: 0.315311
G1 X124.522 Y117.288 E.00102
; LINE_WIDTH: 0.267032
G1 X124.557 Y117.258 E.00084
M204 S10000
G1 X124.313 Y117.466 F42000
; LINE_WIDTH: 0.555833
G1 F2784
M204 S6000
G1 X124.274 Y117.365 E.0045
; LINE_WIDTH: 0.482417
G1 X124.236 Y117.265 E.00385
G1 X124.025 Y115.665 E.0578
M204 S10000
G1 X130.321 Y114.835 F42000
; LINE_WIDTH: 0.48086
G1 F2784
M204 S6000
G1 X130.531 Y116.436 E.05762
; LINE_WIDTH: 0.50586
G1 X130.52 Y116.543 E.00406
; LINE_WIDTH: 0.555857
G1 X130.509 Y116.65 E.0045
; LINE_WIDTH: 0.580846
G1 X131.81 Y126.534 E.437
M204 S10000
G1 X131.566 Y126.742 F42000
; LINE_WIDTH: 0.267032
G1 F2784
M204 S6000
G1 X131.601 Y126.712 E.00084
; LINE_WIDTH: 0.315311
G1 X131.636 Y126.682 E.00102
; LINE_WIDTH: 0.36359
G1 X131.671 Y126.653 E.0012
; LINE_WIDTH: 0.411869
G1 X131.706 Y126.623 E.00138
; LINE_WIDTH: 0.460148
G1 X131.741 Y126.593 E.00156
; LINE_WIDTH: 0.508428
G1 X131.775 Y126.564 E.00174
; LINE_WIDTH: 0.556707
G1 X131.81 Y126.534 E.00192
; LINE_WIDTH: 0.555851
G1 X131.849 Y126.635 E.0045
; LINE_WIDTH: 0.505861
G1 X131.887 Y126.735 E.00406
; LINE_WIDTH: 0.468367
G3 X131.983 Y127.596 I-25.857 J3.303 E.03003
; LINE_WIDTH: 0.423323
G1 X132.014 Y128 E.01256
; LINE_WIDTH: 0.387806
G1 X132.032 Y128.342 E.00962
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10438.236
G1 X132.014 Y128 E-.76
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
G3 Z2.4 I-.189 J-1.202 P1  F42000
G1 X126.188 Y128.914 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X126.029 Y127.704 E.03749
G1 X127.501 Y127.51 E.04563
G1 X131.501 Y126.984 E.12398
G1 X131.661 Y128.193 E.03749
G1 X126.247 Y128.906 E.16777
; WIPE_START
M204 S6000
G1 X126.029 Y127.704 E-.46416
G1 X126.8 Y127.603 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.924 Y126.912 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X125.894 Y126.916 E.00103
G1 X124.8 Y118.606 E.27804
G1 X124.747 Y118.209 E.01327
G1 F6579.099
G1 X124.695 Y117.813 E.01327
G1 F2851.435
G1 X124.852 Y117.792 E.00525
M106 S255
G1 F1800
G1 X125.231 Y117.742 E.01269
M106 S198.9
; FEATURE: Overhang wall
M106 S255
G1 F600
M204 S5000
G1 X125.247 Y117.74 E.00053
G1 X126.446 Y126.843 E.30457
M106 S198.9
M106 S255
G1 F3000
G1 X126.43 Y126.845 E.00053
M106 S198.9
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X126.051 Y126.895 E.01269
M106 S198.9
G1 F2217.683
G1 X125.984 Y126.904 E.00223
; WIPE_START
G1 X125.894 Y126.916 E-.03459
G1 X125.645 Y125.023 E-.72541
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.6 I-.279 J1.185 P1  F42000
G1 X130.891 Y126.258 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Overhang wall
M106 S255
G1 F600
M204 S5000
G1 X130.876 Y126.26 E.00053
G1 X129.677 Y117.157 E.30457
G1 X129.693 Y117.155 E.00053
M106 S198.9
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X130.072 Y117.105 E.01269
M106 S198.9
G1 F2851.372
G1 X130.229 Y117.084 E.00525
G1 F6579.002
G1 X130.281 Y117.481 E.01327
G1 F8843.478
G1 X130.334 Y117.877 E.01327
G1 X131.323 Y125.394 E.2515
G1 X131.375 Y125.791 E.01327
G1 F6579.017
G1 X131.428 Y126.187 E.01327
G1 F2851.381
G1 X131.271 Y126.208 E.00525
M106 S255
G1 F1800
G1 X130.951 Y126.25 E.0107
M106 S198.9
; WIPE_START
G1 X130.876 Y126.26 E-.02882
G1 X130.625 Y124.352 E-.73118
; WIPE_END
G1 E-.04
M204 S10000
G17
G3 Z2.6 I1.196 J-.225 P1  F42000
G1 X129.256 Y117.075 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Overhang wall
M106 S255
G1 F600
M204 S5000
G1 X130.49 Y126.448 E.31361
G1 X126.867 Y126.925 E.12121
G1 X125.633 Y117.552 E.31361
G1 X129.196 Y117.083 E.11922
M106 S198.9
M204 S250
G1 X128.918 Y117.515 F42000
M106 S255
G1 F600
M204 S5000
G1 X130.05 Y126.111 E.2876
G1 X127.205 Y126.485 E.0952
G1 X126.073 Y117.889 E.2876
G1 X128.859 Y117.523 E.09321
M106 S198.9
; WIPE_START
M204 S6000
G1 X129.134 Y119.504 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.6 I-1.128 J-.456 P1  F42000
G1 X125.977 Y127.315 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X125.543 Y127.373 E.01453
G1 X124.291 Y117.859 E.31831
G1 X124.239 Y117.462 E.01327
G1 F5701.219
G1 X124.799 Y117.388 E.01876
M106 S255
G1 F1320
G1 X130.019 Y116.701 E.17465
M106 S198.9
G1 F5701.233
G1 X130.58 Y116.627 E.01876
G1 F8843.478
G1 X130.632 Y117.024 E.01327
G1 X131.832 Y126.141 E.30504
G1 X131.884 Y126.538 E.01327
G1 F5701.129
G1 X131.324 Y126.612 E.01876
M106 S255
G1 F1320
G1 X126.104 Y127.299 E.17465
M106 S198.9
G1 F1681.388
G1 X126.037 Y127.308 E.00224
; WIPE_START
G1 X125.543 Y127.373 E-.18924
G1 X125.347 Y125.883 E-.57076
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.875 Y133.501 Z2.6 F42000
G1 X124.485 Y139.788 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X125.803 Y129.77 E.33516
G1 X131.533 Y129.016 E.19169
G1 X130.018 Y140.517 E.38478
G1 X124.544 Y139.795 E.18317
M204 S10000
G1 X124.028 Y140.138 F42000
G1 F8843.478
M204 S6000
G1 X125.542 Y128.638 E.38478
G1 X125.756 Y128.638 E.0071
G1 X125.85 Y129.354 E.02395
G1 X131.979 Y128.547 E.20504
G1 X131.961 Y128.808 E.00869
G1 X130.369 Y140.973 E.40698
G1 X124.087 Y140.146 E.21017
; WIPE_START
G1 X124.338 Y138.162 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.281 Y130.781 Z2.6 F42000
G1 X130.094 Y116.296 Z2.6
M73 P42 R11
G1 Z2.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X124.622 Y117.016 E.16961
G1 X124.462 Y115.807 E.03749
G1 X125.935 Y115.613 E.04563
G1 X129.935 Y115.086 E.12398
G1 X130.086 Y116.236 E.03564
; WIPE_START
M204 S6000
G1 X128.107 Y116.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.6 I-1.196 J-.226 P1  F42000
G1 X123.614 Y140.277 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X125.188 Y128.32 E.37058
G2 X125.188 Y127.678 I-3.44 J-.32 E.01976
G1 X123.614 Y115.72 E.3706
G3 X123.772 Y115.5 I.19 J-.03 E.00924
G1 X130.51 Y114.613 E.20882
G3 X130.583 Y114.615 I.029 J.212 E.00224
G3 X130.732 Y114.783 I-.045 J.191 E.00736
G1 X132.306 Y126.736 E.37045
G3 X132.306 Y129.264 I-10.795 J1.264 E.07785
G1 X130.733 Y141.215 E.37038
G3 X130.511 Y141.387 I-.194 J-.02 E.00966
G1 X123.77 Y140.499 E.20892
G3 X123.614 Y140.338 I.038 J-.193 E.00734
; WIPE_START
M204 S6000
G1 X123.874 Y138.355 E-.76
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


G1 X129.75 Y139.884 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X129.963 Y138.27 E.05401
G3 X130.162 Y136.762 I1.208 J-.608 E.05358
G1 X130.577 Y133.606 E.10558
G3 X129.797 Y132.586 I.719 J-1.359 E.04395
G3 X130.953 Y130.748 I2.394 J.224 E.07474
G1 X131.128 Y129.421 E.04442
G1 X128.425 Y129.776 E.09043
G1 X128.31 Y129.965 E.00735
G2 X127.251 Y130.948 I1.788 J2.987 E.04827
G2 X127.691 Y132.586 I1.859 J.379 E.05832
G3 X128.749 Y133.569 I-1.787 J2.987 E.04827
G3 X128.31 Y135.207 I-1.859 J.379 E.05832
G2 X127.251 Y136.19 I1.787 J2.987 E.04827
G2 X127.691 Y137.827 I1.859 J.379 E.05832
G1 X128.488 Y138.483 E.03423
G3 X128.824 Y139.138 I-.511 J.676 E.02527
G1 X128.711 Y139.793 E.02206
G1 X128.597 Y139.978 E.0072
G1 X125.993 Y139.635 E.08713
G1 X125.689 Y139.138 E.01934
G1 X124.996 Y138.569 E.02974
G1 X125.29 Y136.336 E.07469
G2 X126.129 Y135.534 I-1.471 J-2.377 E.03876
G2 X125.689 Y133.896 I-1.859 J-.379 E.05832
G1 X125.619 Y133.839 E.003
G1 X125.832 Y132.225 E.05401
; WIPE_START
G1 X125.619 Y133.839 E-.61876
G1 X125.689 Y133.896 E-.03438
G1 X125.836 Y134.136 E-.10686
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.143 Y126.678 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192576
G1 F15000
M204 S6000
G1 X124.998 Y117.978 E.10701
; WIPE_START
G1 X125.259 Y119.961 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y117.265 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.480853
G1 F8220.45
M204 S6000
G1 X124.025 Y115.665 E.05759
M204 S10000
G1 X130.321 Y114.835 F42000
; LINE_WIDTH: 0.480831
G1 F8220.851
M204 S6000
G1 X130.531 Y116.436 E.05761
; WIPE_START
G1 X130.321 Y114.835 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.98 Y117.322 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F15000
M204 S6000
G1 X131.125 Y126.022 E.10701
; WIPE_START
G1 X130.864 Y124.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.888 Y126.735 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.467119
G1 F8486.592
M204 S6000
G3 X131.983 Y127.596 I-19.671 J2.604 E.02994
; LINE_WIDTH: 0.42334
G1 F9463.237
G1 X132.014 Y128 E.01255
; LINE_WIDTH: 0.387817
G1 F10437.906
G1 X132.032 Y128.342 E.00963
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10437.906
G1 X132.014 Y128 E-.76
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
G3 Z2.6 I-.189 J-1.202 P1  F42000
G1 X126.188 Y128.914 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4145
M204 S5000
G1 X126.029 Y127.704 E.03749
G1 X127.695 Y127.485 E.05166
G1 X131.501 Y126.984 E.11796
G1 X131.661 Y128.193 E.03749
G1 X126.247 Y128.906 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.029 Y127.704 E-.46416
G1 X126.8 Y127.603 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I1.136 J-.436 P1  F42000
G1 X126.412 Y126.59 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4145
M204 S6000
G1 X126.446 Y126.843 E.00849
G1 X125.894 Y126.916 E.01847
G1 X124.695 Y117.813 E.30457
G1 X125.247 Y117.74 E.01847
G1 X126.404 Y126.53 E.2941
; WIPE_START
G1 F8843.478
G1 X126.446 Y126.843 E-.12002
G1 X125.894 Y126.916 E-.21155
G1 X125.747 Y125.798 E-.42843
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I-.109 J1.212 P1  F42000
G1 X130.876 Y126.26 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F4145
M204 S6000
G1 X129.677 Y117.157 E.30457
G1 X130.229 Y117.084 E.01847
G1 X131.428 Y126.187 E.30457
G1 X130.935 Y126.252 E.01648
; WIPE_START
G1 F8843.478
G1 X130.661 Y124.271 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I-.739 J-.967 P1  F42000
G1 X127.256 Y126.874 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F4145
M204 S6000
G1 X126.867 Y126.925 E.01301
G1 X125.633 Y117.552 E.31361
G1 X126.309 Y117.463 E.02262
G1 X129.256 Y117.075 E.09859
G1 X130.49 Y126.448 E.31361
G1 X127.315 Y126.866 E.10622
M204 S250
G1 X127.205 Y126.485 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4145
M204 S5000
G1 X126.073 Y117.889 E.26641
G1 X126.36 Y117.852 E.00891
G1 X128.918 Y117.515 E.07928
G1 X130.05 Y126.111 E.2664
G1 X127.264 Y126.477 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.989 Y124.496 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I-1.087 J-.547 P1  F42000
G1 X125.543 Y127.373 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4145
M204 S6000
G1 X124.239 Y117.462 E.33158
G1 X130.58 Y116.627 E.21216
G1 X131.884 Y126.538 E.33158
G1 X125.603 Y127.365 E.21017
; WIPE_START
G1 F8843.478
G1 X125.33 Y125.383 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.883 Y133.003 Z2.8 F42000
G1 X124.485 Y139.788 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F4145
M204 S6000
G1 X125.803 Y129.77 E.33516
G1 X131.533 Y129.016 E.19169
G1 X130.018 Y140.517 E.38478
G1 X124.544 Y139.795 E.18317
M204 S10000
G1 X124.028 Y140.138 F42000
G1 F4145
M204 S6000
G1 X125.542 Y128.638 E.38478
G1 X125.756 Y128.638 E.0071
G1 X125.85 Y129.354 E.02395
G1 X131.979 Y128.547 E.20504
G1 X131.961 Y128.808 E.00869
G1 X130.369 Y140.973 E.40698
G1 X124.087 Y140.146 E.21017
; WIPE_START
G1 F8843.478
G1 X124.338 Y138.162 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.281 Y130.781 Z2.8 F42000
G1 X130.094 Y116.296 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4145
M204 S5000
G1 X124.622 Y117.016 E.16961
G1 X124.462 Y115.807 E.03749
G1 X126.129 Y115.587 E.05166
G1 X129.935 Y115.086 E.11796
G1 X130.086 Y116.236 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.107 Y116.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I-1.196 J-.226 P1  F42000
G1 X123.614 Y140.277 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F4145
M204 S5000
G1 X125.188 Y128.32 E.37058
G2 X125.188 Y127.678 I-3.454 J-.32 E.01976
G1 X123.614 Y115.72 E.3706
G3 X123.772 Y115.5 I.19 J-.03 E.00922
G1 X130.51 Y114.613 E.20883
G3 X130.583 Y114.615 I.029 J.212 E.00225
G3 X130.732 Y114.783 I-.042 J.188 E.00738
G1 X132.306 Y126.736 E.37045
G3 X132.306 Y129.264 I-10.793 J1.264 E.07785
G1 X130.733 Y141.215 E.37038
G3 X130.51 Y141.387 I-.194 J-.02 E.00967
G1 X123.77 Y140.499 E.20891
G3 X123.614 Y140.338 I.036 J-.191 E.00736
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.874 Y138.355 E-.76
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


G1 X124.985 Y138.769 F42000
G1 Z2.4
G1 E.8 F1800
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X125.292 Y136.436 E.06519
; Slow Down End
M204 S10000
G1 X125.57 Y134.324 F42000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X126.047 Y130.697 E.10135
; Slow Down End
M204 S10000
G1 X126.879 Y129.995 F42000
G1 F4145
M204 S6000
G1 X130.905 Y129.465 E.11252
; LINE_WIDTH: 0.396905
G1 X130.986 Y129.473 E.00233
; LINE_WIDTH: 0.415552
G1 X131.066 Y129.482 E.00246
G1 X131.084 Y129.643 E.00491
; LINE_WIDTH: 0.38292
G1 X130.834 Y131.546 E.05318
M204 S10000
G1 X130.052 Y134.707 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4145
M204 S6000
G1 X130.264 Y133.093 E.05401
G3 X129.951 Y131.931 I.958 J-.882 E.0415
M73 P43 R11
G3 X130.548 Y130.936 I1.582 J.273 E.0394
G1 X130.69 Y129.859 E.03603
G1 X128.185 Y130.188 E.08381
G2 X127.343 Y131.276 I2.004 J2.42 E.04599
G2 X127.602 Y132.586 I1.623 J.36 E.04559
G3 X128.657 Y133.896 I-2.343 J2.966 E.05627
G3 X128.398 Y135.207 I-1.623 J.36 E.04559
G2 X127.343 Y136.517 I2.343 J2.966 E.05627
G2 X127.602 Y137.827 I1.623 J.36 E.04559
G3 X128.657 Y139.138 I-2.342 J2.965 E.05627
G1 X128.67 Y139.793 E.02174
G1 X128.593 Y139.978 E.00663
G1 X127.206 Y139.795 E.04641
G1 X127.622 Y139.469 E.01752
G1 X125.816 Y139.231 E.06043
G1 X125.359 Y138.701 E.02323
G1 X125.756 Y135.691 E.10071
G2 X126.049 Y134.552 I-.973 J-.858 E.0405
G1 X125.94 Y134.288 E.00947
G1 X126.153 Y132.674 E.05401
M204 S10000
G1 X130.107 Y137.063 F42000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
M73 P43 R10
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X130.628 Y133.109 E.11051
; Slow Down End
; WIPE_START
G1 X130.367 Y135.092 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.032 Y128.342 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.387806
G1 F4145
M204 S6000
G1 X132.014 Y128 E.00962
; LINE_WIDTH: 0.423322
G1 X131.983 Y127.596 E.01256
; LINE_WIDTH: 0.467119
G2 X131.888 Y126.735 I-19.777 J1.744 E.02994
; WIPE_START
G1 F8486.587
G1 X131.983 Y127.596 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.125 Y126.022 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4145
M204 S6000
G1 X129.98 Y117.322 E.10701
; WIPE_START
G1 F15000
G1 X130.241 Y119.305 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.531 Y116.436 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.480841
G1 F4145
M204 S6000
G1 X130.321 Y114.835 E.05761
; WIPE_START
G1 F8220.669
G1 X130.531 Y116.436 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I-.327 J-1.172 P1  F42000
G1 X124.998 Y117.978 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4145
M204 S6000
G1 X126.143 Y126.678 E.10701
; WIPE_START
G1 F15000
G1 X125.882 Y124.695 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y117.265 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.480851
G1 F4145
M204 S6000
G1 X124.025 Y115.665 E.05759
; WIPE_START
G1 F8220.487
G1 X124.236 Y117.265 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.647 Y124.886 Z2.8 F42000
G1 X125.438 Y139.547 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F4145
M204 S6000
G1 X126.659 Y139.708 E.03412
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10588.235
G1 X125.438 Y139.547 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/73
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z2.8 I1.214 J.086 P1  F42000
G1 X126.188 Y128.914 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5983
M204 S5000
G1 X126.029 Y127.704 E.03749
G1 X127.89 Y127.459 E.05768
G1 X131.501 Y126.984 E.11193
G1 X131.661 Y128.193 E.03749
G1 X126.247 Y128.906 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.029 Y127.704 E-.46416
G1 X126.8 Y127.603 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I1.136 J-.436 P1  F42000
G1 X126.412 Y126.59 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5983
M204 S6000
G1 X126.446 Y126.843 E.00849
G1 X125.894 Y126.916 E.01847
G1 X124.695 Y117.813 E.30457
G1 X125.247 Y117.74 E.01847
G1 X126.404 Y126.53 E.2941
; WIPE_START
G1 F8843.478
G1 X126.446 Y126.843 E-.12002
G1 X125.894 Y126.916 E-.21155
G1 X125.747 Y125.798 E-.42842
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I-.109 J1.212 P1  F42000
G1 X130.876 Y126.26 Z3
G1 Z2.6
G1 E.8 F1800
G1 F5983
M204 S6000
G1 X129.677 Y117.157 E.30457
G1 X130.229 Y117.084 E.01847
G1 X131.428 Y126.187 E.30457
G1 X130.935 Y126.252 E.01648
; WIPE_START
G1 F8843.478
G1 X130.661 Y124.271 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I-.739 J-.967 P1  F42000
G1 X127.256 Y126.874 Z3
G1 Z2.6
G1 E.8 F1800
G1 F5983
M204 S6000
G1 X126.867 Y126.925 E.01301
G1 X125.633 Y117.552 E.31361
G1 X126.362 Y117.456 E.02439
G1 X129.256 Y117.075 E.09682
G1 X130.49 Y126.448 E.31361
G1 X127.315 Y126.866 E.10622
M204 S250
G1 X127.205 Y126.485 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5983
M204 S5000
G1 X126.073 Y117.889 E.26641
G1 X126.413 Y117.845 E.01054
G1 X128.918 Y117.515 E.07764
G1 X130.05 Y126.111 E.2664
G1 X127.264 Y126.477 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.989 Y124.496 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I-1.087 J-.547 P1  F42000
G1 X125.543 Y127.373 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5983
M204 S6000
G1 X124.239 Y117.462 E.33158
G1 X130.58 Y116.627 E.21216
G1 X131.884 Y126.538 E.33158
G1 X125.603 Y127.365 E.21017
; WIPE_START
G1 F8843.478
G1 X125.33 Y125.383 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.883 Y133.003 Z3 F42000
G1 X124.485 Y139.788 Z3
G1 Z2.6
G1 E.8 F1800
G1 F5983
M204 S6000
G1 X125.803 Y129.77 E.33516
G1 X131.533 Y129.016 E.19169
G1 X130.018 Y140.517 E.38478
G1 X124.544 Y139.795 E.18317
M204 S10000
G1 X124.028 Y140.138 F42000
G1 F5983
M204 S6000
G1 X125.542 Y128.638 E.38478
G1 X125.756 Y128.638 E.0071
G1 X125.85 Y129.354 E.02395
G1 X131.979 Y128.547 E.20504
G1 X131.961 Y128.808 E.00869
G1 X130.369 Y140.973 E.40698
G1 X124.087 Y140.146 E.21017
; WIPE_START
G1 F8843.478
G1 X124.338 Y138.162 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.281 Y130.781 Z3 F42000
G1 X130.094 Y116.296 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5983
M204 S5000
G1 X124.622 Y117.016 E.16961
G1 X124.462 Y115.807 E.03749
G1 X126.324 Y115.562 E.05768
G1 X129.935 Y115.086 E.11193
G1 X130.086 Y116.236 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.107 Y116.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I-1.196 J-.226 P1  F42000
G1 X123.614 Y140.277 Z3
G1 Z2.6
G1 E.8 F1800
G1 F5983
M204 S5000
G1 X125.188 Y128.32 E.37059
G2 X125.188 Y127.678 I-3.468 J-.32 E.01976
G1 X123.614 Y115.72 E.37061
G3 X123.772 Y115.5 I.19 J-.03 E.00923
G1 X130.51 Y114.613 E.20883
G3 X130.583 Y114.615 I.029 J.213 E.00224
G3 X130.732 Y114.783 I-.045 J.191 E.00736
G1 X132.306 Y126.736 E.37045
G3 X132.306 Y129.264 I-11.109 J1.264 E.07784
G1 X130.732 Y141.217 E.37045
G3 X130.511 Y141.387 I-.193 J-.022 E.00959
G1 X123.77 Y140.499 E.20892
G3 X123.614 Y140.338 I.036 J-.191 E.00734
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.874 Y138.355 E-.76
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


G1 X126.402 Y139.871 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.41324
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X130.113 Y136.966 E.25753
G1 X130.199 Y136.311 E.03615
G1 X125.982 Y139.612 E.29266
G1 X125.507 Y139.549 E.02621
G1 X125.566 Y139.35 E.01138
G1 X130.286 Y135.655 E.32756
G1 X130.372 Y134.999 E.03615
G1 X125.344 Y138.935 E.34895
G1 X125.157 Y138.74 E.01473
G1 X125 Y138.704 E.00882
G1 X125.013 Y138.606 E.00545
G1 X130.458 Y134.343 E.37789
G1 X130.545 Y133.687 E.03615
G1 X125.099 Y137.95 E.37789
G1 X125.186 Y137.294 E.03615
G1 X130.551 Y133.094 E.37231
G1 X129.998 Y132.938 E.03137
G1 X125.272 Y136.638 E.32797
G1 X125.29 Y136.504 E.00739
G1 X125.868 Y135.694 E.05437
G1 X125.883 Y135.571 E.00675
G1 X130.45 Y131.996 E.31693
G1 X130.835 Y131.484 E.03502
G1 X130.89 Y131.063 E.02317
G1 X125.951 Y134.93 E.34276
G1 X125.827 Y134.439 E.02768
G1 X130.976 Y130.407 E.35737
G1 X131.063 Y129.752 E.03615
G1 X125.618 Y134.014 E.37789
G1 X125.704 Y133.358 E.03615
G1 X130.621 Y129.509 E.34125
G1 X129.718 Y129.628 E.04979
G1 X125.79 Y132.703 E.27256
G1 X125.877 Y132.047 E.03615
G1 X128.814 Y129.747 E.20387
G1 X127.911 Y129.866 E.04979
G1 X125.963 Y131.391 E.13518
G1 X126.049 Y130.735 E.03615
G1 X127.321 Y129.739 E.08826
M106 S201.45
; WIPE_START
G1 X126.049 Y130.735 E-.61375
G1 X125.999 Y131.116 E-.14625
; WIPE_END
M73 P44 R10
G1 E-.04 F1800
M204 S10000
G1 X126.143 Y126.678 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192576
; LAYER_HEIGHT: 0.2
G1 F5983
M204 S6000
G1 X124.998 Y117.978 E.10701
; WIPE_START
G1 F15000
G1 X125.259 Y119.961 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y117.265 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.48084
G1 F5983
M204 S6000
G1 X124.025 Y115.665 E.05759
; WIPE_START
G1 F8220.679
G1 X124.236 Y117.265 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I-.012 J1.217 P1  F42000
G1 X129.98 Y117.322 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F5983
M204 S6000
G1 X131.125 Y126.022 E.10701
; WIPE_START
G1 F15000
G1 X130.864 Y124.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.888 Y126.735 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.468712
G1 F5983
M204 S6000
G3 X131.976 Y127.532 I-18.258 J2.434 E.02783
; LINE_WIDTH: 0.425297
G1 X132.014 Y128.002 E.01468
; LINE_WIDTH: 0.387657
G1 X132.032 Y128.342 E.00957
; WIPE_START
G1 F10442.764
G1 X132.014 Y128.002 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.303 Y135.137 Z3 F42000
G1 X127.678 Y139.414 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.432364
G1 F5983
M204 S6000
G1 X127.249 Y139.75 E.01731
G1 X129.676 Y140.07 E.07768
G1 X129.729 Y139.665 E.01296
G1 X129.533 Y139.658 E.00621
G1 X127.738 Y139.422 E.05747
; WIPE_START
G1 F9243.968
G1 X129.533 Y139.658 E-.68819
G1 X129.722 Y139.664 E-.07181
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.988 Y132.037 Z3 F42000
G1 X130.531 Y116.436 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.480866
G1 F5983
M204 S6000
G1 X130.321 Y114.835 E.05761
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.191
G1 X130.531 Y116.436 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/73
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z3 I-1.149 J-.4 P1  F42000
G1 X126.188 Y128.914 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4997
M204 S5000
G1 X126.029 Y127.704 E.03749
G1 X128.084 Y127.433 E.06371
G1 X131.501 Y126.984 E.1059
G1 X131.661 Y128.193 E.03749
G1 X126.247 Y128.906 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.029 Y127.704 E-.46416
G1 X126.8 Y127.603 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y126.59 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4997
M204 S6000
G1 X126.446 Y126.843 E.00849
G1 X125.894 Y126.916 E.01847
G1 X124.695 Y117.813 E.30457
G1 X125.247 Y117.74 E.01847
G1 X126.404 Y126.53 E.2941
; WIPE_START
G1 F8843.478
G1 X126.446 Y126.843 E-.12002
G1 X125.894 Y126.916 E-.21155
G1 X125.747 Y125.798 E-.42843
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.876 Y126.26 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F4997
M204 S6000
G1 X129.677 Y117.157 E.30457
G1 X130.229 Y117.084 E.01847
G1 X131.428 Y126.187 E.30457
G1 X130.935 Y126.252 E.01648
; WIPE_START
G1 F8843.478
G1 X130.661 Y124.271 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.256 Y126.874 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F4997
M204 S6000
G1 X126.867 Y126.925 E.01301
G1 X125.633 Y117.552 E.31361
G1 X126.415 Y117.449 E.02615
G1 X129.256 Y117.075 E.09506
G1 X130.49 Y126.448 E.31361
G1 X127.315 Y126.866 E.10622
M204 S250
G1 X127.205 Y126.485 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4997
M204 S5000
G1 X126.073 Y117.889 E.2664
G1 X126.466 Y117.838 E.01218
G1 X128.918 Y117.515 E.07601
G1 X130.05 Y126.111 E.26641
G1 X127.264 Y126.477 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.989 Y124.496 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.543 Y127.373 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4997
M204 S6000
G1 X124.239 Y117.462 E.33158
G1 X130.58 Y116.627 E.21216
G1 X131.884 Y126.538 E.33158
G1 X125.603 Y127.365 E.21017
; WIPE_START
G1 F8843.478
G1 X125.33 Y125.383 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.883 Y133.003 Z3.2 F42000
G1 X124.485 Y139.788 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F4997
M204 S6000
G1 X125.803 Y129.77 E.33516
G1 X131.533 Y129.016 E.19169
G1 X130.019 Y140.517 E.38478
G1 X124.544 Y139.795 E.18317
M204 S10000
G1 X124.028 Y140.138 F42000
G1 F4997
M204 S6000
G1 X125.542 Y128.638 E.38478
G1 X125.756 Y128.638 E.0071
G1 X125.85 Y129.354 E.02395
G1 X131.979 Y128.547 E.20504
G1 X131.961 Y128.808 E.00869
G1 X130.369 Y140.973 E.40698
G1 X124.087 Y140.146 E.21017
; WIPE_START
G1 F8843.478
G1 X124.338 Y138.162 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.281 Y130.781 Z3.2 F42000
G1 X130.094 Y116.296 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4997
M204 S5000
G1 X124.622 Y117.016 E.16961
G1 X124.462 Y115.807 E.03749
G1 X126.518 Y115.536 E.06371
G1 X129.935 Y115.086 E.1059
G1 X130.086 Y116.236 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.107 Y116.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.688 Y124.019 Z3.2 F42000
G1 X123.614 Y140.277 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F4997
M204 S5000
G1 X125.188 Y128.32 E.37058
G2 X125.188 Y127.678 I-3.482 J-.32 E.01976
G1 X123.614 Y115.72 E.3706
G3 X123.772 Y115.5 I.19 J-.03 E.00923
G1 X130.51 Y114.613 E.20883
G3 X130.583 Y114.615 I.029 J.212 E.00224
G3 X130.732 Y114.783 I-.045 J.191 E.00737
G1 X132.306 Y126.736 E.37044
G3 X132.306 Y129.264 I-9.873 J1.264 E.07789
G1 X130.732 Y141.217 E.37044
G3 X130.511 Y141.387 I-.194 J-.022 E.0096
G1 X123.77 Y140.499 E.20892
G3 X123.614 Y140.338 I.036 J-.191 E.00736
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.874 Y138.355 E-.76
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


G1 X124.924 Y139.45 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F4997
M204 S6000
G1 X129.681 Y140.077 E.14741
G1 X131.077 Y129.471 E.32867
G1 X126.153 Y130.12 E.15261
G1 X124.932 Y139.391 E.28732
M204 S10000
G1 X130.295 Y132.522 F42000
G1 F4997
M204 S6000
G1 X130.639 Y129.909 E.08096
G1 X126.489 Y130.456 E.12862
G1 X125.347 Y139.125 E.26868
G1 X129.356 Y139.654 E.12424
G1 X130.287 Y132.581 E.21918
M204 S10000
G1 X129.921 Y132.472 F42000
G1 F4997
M204 S6000
G1 X130.201 Y130.347 E.06586
G1 X126.825 Y130.792 E.10464
G1 X125.771 Y138.801 E.24821
G1 X129.032 Y139.23 E.10107
G1 X129.914 Y132.532 E.2076
M204 S10000
G1 X129.548 Y132.423 F42000
G1 F4997
M204 S6000
G1 X129.763 Y130.785 E.05076
G1 X127.161 Y131.128 E.08065
G1 X126.194 Y138.476 E.22773
G1 X128.707 Y138.807 E.0779
G1 X129.54 Y132.483 E.19601
M204 S10000
G1 X129.174 Y132.374 F42000
G1 F4997
M204 S6000
G1 X129.325 Y131.223 E.03566
G1 X127.497 Y131.464 E.05666
G1 X126.617 Y138.152 E.20726
G1 X128.382 Y138.384 E.05473
G1 X129.166 Y132.434 E.18442
M204 S10000
G1 X128.8 Y132.325 F42000
G1 F4997
M204 S6000
G1 X128.887 Y131.661 E.02056
G1 X127.833 Y131.8 E.03267
G1 X127.04 Y137.827 E.18678
G1 X128.058 Y137.961 E.03155
G1 X128.792 Y132.384 E.17283
M204 S10000
G1 X128.452 Y132.279 F42000
; LINE_WIDTH: 0.367845
G1 F4997
M204 S6000
G1 X128.48 Y132.069 E.00561
G1 X128.146 Y132.113 E.00891
M73 P45 R10
G1 X127.434 Y137.525 E.14453
G1 X127.756 Y137.567 E.0086
G1 X128.444 Y132.339 E.13964
; WIPE_START
G1 F11079.484
G1 X128.183 Y134.321 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.032 Y128.342 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.387806
G1 F4997
M204 S6000
G1 X132.014 Y128 E.00962
; LINE_WIDTH: 0.423331
G1 X131.983 Y127.596 E.01256
; LINE_WIDTH: 0.467127
G2 X131.888 Y126.735 I-19.76 J1.743 E.02994
; WIPE_START
G1 F8486.429
G1 X131.983 Y127.596 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.125 Y126.022 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4997
M204 S6000
G1 X129.98 Y117.322 E.10701
; WIPE_START
G1 F15000
G1 X130.241 Y119.305 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.531 Y116.436 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.480857
G1 F4997
M204 S6000
G1 X130.321 Y114.835 E.05761
M204 S10000
G1 X124.025 Y115.665 F42000
; LINE_WIDTH: 0.480853
G1 F4997
M204 S6000
G1 X124.236 Y117.265 E.05759
; WIPE_START
G1 F8220.443
G1 X124.025 Y115.665 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.998 Y117.978 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4997
M204 S6000
G1 X126.143 Y126.678 E.10701
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X125.882 Y124.695 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/73
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z3.2 I-1.214 J.088 P1  F42000
G1 X126.188 Y128.914 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4975
M204 S5000
G1 X126.029 Y127.704 E.03749
G1 X128.279 Y127.408 E.06974
G1 X131.501 Y126.984 E.09988
G1 X131.661 Y128.193 E.03749
G1 X126.247 Y128.906 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.029 Y127.704 E-.46416
G1 X126.8 Y127.603 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y126.59 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4975
M204 S6000
G1 X126.446 Y126.843 E.00849
G1 X125.894 Y126.916 E.01847
G1 X124.695 Y117.813 E.30457
G1 X125.247 Y117.74 E.01847
G1 X126.404 Y126.53 E.2941
; WIPE_START
G1 F8843.478
G1 X126.446 Y126.843 E-.12002
G1 X125.894 Y126.916 E-.21155
G1 X125.747 Y125.798 E-.42843
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.876 Y126.26 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F4975
M204 S6000
G1 X129.677 Y117.157 E.30457
G1 X130.229 Y117.084 E.01847
G1 X131.428 Y126.187 E.30457
G1 X130.935 Y126.252 E.01648
; WIPE_START
G1 F8843.478
G1 X130.661 Y124.271 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.256 Y126.874 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F4975
M204 S6000
G1 X126.867 Y126.925 E.01301
G1 X125.633 Y117.552 E.31361
G1 X126.468 Y117.442 E.02792
G1 X129.256 Y117.075 E.09329
G1 X130.49 Y126.448 E.31361
G1 X127.315 Y126.866 E.10622
M204 S250
G1 X127.205 Y126.485 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4975
M204 S5000
G1 X126.073 Y117.889 E.2664
G1 X126.519 Y117.831 E.01382
G1 X128.918 Y117.515 E.07437
G1 X130.05 Y126.111 E.26641
G1 X127.264 Y126.477 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.989 Y124.496 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.543 Y127.373 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4975
M204 S6000
G1 X124.239 Y117.462 E.33158
G1 X130.58 Y116.627 E.21216
G1 X131.884 Y126.538 E.33158
G1 X125.603 Y127.365 E.21017
; WIPE_START
G1 F8843.478
G1 X125.33 Y125.383 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.883 Y133.003 Z3.4 F42000
G1 X124.485 Y139.788 Z3.4
G1 Z3
G1 E.8 F1800
G1 F4975
M204 S6000
G1 X125.803 Y129.77 E.33516
G1 X131.533 Y129.016 E.19169
G1 X130.018 Y140.517 E.38478
G1 X124.544 Y139.795 E.18317
M204 S10000
G1 X124.028 Y140.138 F42000
G1 F4975
M204 S6000
G1 X125.542 Y128.638 E.38478
G1 X125.756 Y128.638 E.0071
G1 X125.85 Y129.354 E.02395
G1 X131.979 Y128.547 E.20504
G1 X131.961 Y128.808 E.00869
G1 X130.369 Y140.973 E.40698
G1 X124.087 Y140.146 E.21017
; WIPE_START
G1 F8843.478
G1 X124.338 Y138.162 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.281 Y130.781 Z3.4 F42000
G1 X130.094 Y116.296 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4975
M204 S5000
G1 X124.622 Y117.016 E.16961
G1 X124.462 Y115.807 E.03749
G1 X126.712 Y115.511 E.06974
G1 X129.935 Y115.086 E.09988
G1 X130.086 Y116.236 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.107 Y116.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.688 Y124.019 Z3.4 F42000
G1 X123.614 Y140.278 Z3.4
G1 Z3
G1 E.8 F1800
G1 F4975
M204 S5000
G1 X125.188 Y128.32 E.37059
G2 X125.188 Y127.678 I-3.322 J-.32 E.01976
G1 X123.614 Y115.72 E.3706
G3 X123.772 Y115.5 I.19 J-.03 E.00923
G1 X130.51 Y114.613 E.20883
G3 X130.583 Y114.615 I.029 J.212 E.00224
G3 X130.732 Y114.783 I-.042 J.188 E.00739
G1 X132.306 Y126.736 E.37044
G3 X132.306 Y129.264 I-9.872 J1.264 E.07789
G1 X130.732 Y141.217 E.37045
G3 X130.511 Y141.387 I-.193 J-.022 E.00959
G1 X123.77 Y140.499 E.20892
G3 X123.614 Y140.338 I.036 J-.191 E.00734
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.874 Y138.355 E-.76
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


G1 X129.325 Y131.223 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F4975
M204 S6000
G1 X127.497 Y131.464 E.05666
G1 X126.617 Y138.152 E.20726
G1 X128.382 Y138.384 E.05473
G1 X129.317 Y131.283 E.22008
M204 S10000
G1 X128.887 Y131.661 F42000
G1 F4975
M204 S6000
G1 X127.833 Y131.8 E.03267
G1 X127.04 Y137.827 E.18678
G1 X128.058 Y137.961 E.03155
G1 X128.879 Y131.721 E.1934
M204 S10000
G1 X128.48 Y132.069 F42000
; LINE_WIDTH: 0.36785
G1 F4975
M204 S6000
G1 X128.146 Y132.113 E.00891
G1 X127.434 Y137.525 E.14453
G1 X127.756 Y137.567 E.0086
G1 X128.472 Y132.129 E.14525
M204 S10000
G1 X127.161 Y131.128 F42000
; LINE_WIDTH: 0.41999
G1 F4975
M204 S6000
G1 X126.194 Y138.476 E.22773
G1 X128.707 Y138.807 E.0779
G1 X129.763 Y130.785 E.24861
G1 X127.221 Y131.12 E.0788
M204 S10000
G1 X126.825 Y130.792 F42000
G1 F4975
M204 S6000
G1 X125.771 Y138.801 E.24821
G1 X129.032 Y139.23 E.10107
G1 X130.201 Y130.347 E.2753
G1 X126.884 Y130.784 E.10279
M204 S10000
G1 X126.489 Y130.456 F42000
G1 F4975
M204 S6000
G1 X125.347 Y139.125 E.26868
G1 X129.356 Y139.654 E.12424
G1 X130.639 Y129.909 E.30198
G1 X126.548 Y130.448 E.12678
M204 S10000
G1 X126.153 Y130.12 F42000
G1 F4975
M204 S6000
G1 X124.924 Y139.45 E.28916
G1 X129.681 Y140.077 E.14741
G1 X131.077 Y129.471 E.32867
G1 X126.212 Y130.112 E.15077
; WIPE_START
G1 F9547.299
G1 X128.195 Y129.851 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.143 Y126.678 Z3.4 F42000
G1 Z3
M73 P46 R10
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192576
G1 F4975
M204 S6000
G1 X124.998 Y117.978 E.10701
; WIPE_START
G1 F15000
G1 X125.259 Y119.961 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y117.265 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.480841
G1 F4975
M204 S6000
G1 X124.025 Y115.665 E.05759
M204 S10000
G1 X130.321 Y114.835 F42000
; LINE_WIDTH: 0.48084
G1 F4975
M204 S6000
G1 X130.531 Y116.436 E.05761
; WIPE_START
G1 F8220.677
G1 X130.321 Y114.835 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.98 Y117.322 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4975
M204 S6000
G1 X131.125 Y126.022 E.10701
; WIPE_START
G1 F15000
G1 X130.864 Y124.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.888 Y126.735 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.467122
G1 F4975
M204 S6000
G3 X131.983 Y127.596 I-19.662 J2.603 E.02994
; LINE_WIDTH: 0.42333
G1 X132.014 Y128 E.01256
; LINE_WIDTH: 0.387806
G1 X132.032 Y128.342 E.00962
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10438.253
G1 X132.014 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/73
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z3.4 I-.189 J-1.202 P1  F42000
G1 X126.188 Y128.914 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4972
M204 S5000
G1 X126.029 Y127.704 E.03749
G1 X128.473 Y127.382 E.07577
G1 X131.501 Y126.984 E.09385
G1 X131.661 Y128.193 E.03749
G1 X126.247 Y128.906 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.029 Y127.704 E-.46416
G1 X126.8 Y127.603 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y126.59 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4972
M204 S6000
G1 X126.446 Y126.843 E.00849
G1 X125.894 Y126.916 E.01847
G1 X124.695 Y117.813 E.30457
G1 X125.247 Y117.74 E.01847
G1 X126.404 Y126.53 E.2941
; WIPE_START
G1 F8843.478
G1 X126.446 Y126.843 E-.12002
G1 X125.894 Y126.916 E-.21155
G1 X125.747 Y125.798 E-.42842
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.876 Y126.26 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
G1 F4972
M204 S6000
G1 X129.677 Y117.157 E.30457
G1 X130.229 Y117.084 E.01847
G1 X131.428 Y126.187 E.30457
G1 X130.935 Y126.252 E.01648
; WIPE_START
G1 F8843.478
G1 X130.661 Y124.271 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.256 Y126.874 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
G1 F4972
M204 S6000
G1 X126.867 Y126.925 E.01301
G1 X125.633 Y117.552 E.31361
G1 X126.52 Y117.435 E.02969
G1 X129.256 Y117.075 E.09153
G1 X130.49 Y126.448 E.31361
G1 X127.315 Y126.866 E.10622
M204 S250
G1 X127.205 Y126.485 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4972
M204 S5000
G1 X126.073 Y117.889 E.2664
G1 X126.572 Y117.824 E.01545
G1 X128.918 Y117.515 E.07273
G1 X130.05 Y126.111 E.2664
G1 X127.264 Y126.477 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.989 Y124.496 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.543 Y127.373 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4972
M204 S6000
G1 X124.239 Y117.462 E.33158
G1 X130.58 Y116.627 E.21216
G1 X131.884 Y126.538 E.33158
G1 X125.603 Y127.365 E.21017
; WIPE_START
G1 F8843.478
G1 X125.33 Y125.383 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.883 Y133.003 Z3.6 F42000
G1 X124.485 Y139.788 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F4972
M204 S6000
G1 X125.803 Y129.77 E.33516
G1 X131.533 Y129.016 E.19169
G1 X130.018 Y140.517 E.38478
G1 X124.544 Y139.795 E.18317
M204 S10000
G1 X124.028 Y140.138 F42000
G1 F4972
M204 S6000
G1 X125.542 Y128.638 E.38478
G1 X125.756 Y128.638 E.0071
G1 X125.85 Y129.354 E.02395
G1 X131.979 Y128.547 E.20504
G1 X131.961 Y128.808 E.00869
G1 X130.369 Y140.973 E.40698
G1 X124.087 Y140.146 E.21017
; WIPE_START
G1 F8843.478
G1 X124.338 Y138.162 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.281 Y130.781 Z3.6 F42000
G1 X130.094 Y116.296 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4972
M204 S5000
G1 X124.622 Y117.016 E.16961
G1 X124.462 Y115.807 E.03749
G1 X126.907 Y115.485 E.07577
G1 X129.935 Y115.086 E.09385
G1 X130.086 Y116.236 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.107 Y116.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.688 Y124.019 Z3.6 F42000
G1 X123.614 Y140.277 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F4972
M204 S5000
G1 X125.188 Y128.32 E.37058
G2 X125.188 Y127.678 I-3.511 J-.32 E.01976
G1 X123.614 Y115.72 E.37061
G3 X123.772 Y115.5 I.19 J-.03 E.00923
G1 X130.51 Y114.613 E.20883
G3 X130.583 Y114.615 I.029 J.213 E.00225
G3 X130.732 Y114.784 I-.044 J.19 E.00738
G1 X132.306 Y126.736 E.37044
G3 X132.306 Y129.264 I-10.793 J1.264 E.07785
G1 X130.732 Y141.217 E.37045
G3 X130.511 Y141.387 I-.192 J-.02 E.00961
G1 X123.77 Y140.499 E.20892
G3 X123.614 Y140.338 I.036 J-.191 E.00735
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.874 Y138.355 E-.76
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


G1 X129.325 Y131.223 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F4972
M204 S6000
G1 X127.497 Y131.464 E.05666
G1 X126.617 Y138.152 E.20726
G1 X128.382 Y138.384 E.05473
G1 X129.317 Y131.283 E.22008
M204 S10000
G1 X128.887 Y131.661 F42000
G1 F4972
M204 S6000
G1 X127.833 Y131.8 E.03267
G1 X127.04 Y137.827 E.18678
G1 X128.058 Y137.961 E.03155
G1 X128.879 Y131.721 E.1934
M204 S10000
G1 X128.48 Y132.069 F42000
; LINE_WIDTH: 0.36785
G1 F4972
M204 S6000
G1 X128.146 Y132.113 E.00891
G1 X127.434 Y137.525 E.14453
G1 X127.756 Y137.567 E.0086
G1 X128.472 Y132.129 E.14525
M204 S10000
G1 X127.161 Y131.128 F42000
; LINE_WIDTH: 0.41999
G1 F4972
M204 S6000
G1 X126.194 Y138.476 E.22773
G1 X128.707 Y138.807 E.0779
G1 X129.763 Y130.785 E.24861
G1 X127.221 Y131.12 E.0788
M204 S10000
G1 X126.825 Y130.792 F42000
G1 F4972
M204 S6000
G1 X125.771 Y138.801 E.24821
G1 X129.032 Y139.23 E.10107
G1 X130.201 Y130.347 E.2753
G1 X126.884 Y130.784 E.10279
M204 S10000
G1 X126.489 Y130.456 F42000
G1 F4972
M204 S6000
G1 X125.347 Y139.125 E.26868
G1 X129.356 Y139.654 E.12424
G1 X130.639 Y129.909 E.30198
G1 X126.548 Y130.448 E.12678
M204 S10000
G1 X126.153 Y130.12 F42000
G1 F4972
M204 S6000
G1 X124.924 Y139.45 E.28916
G1 X129.681 Y140.077 E.14741
G1 X131.077 Y129.471 E.32867
G1 X126.212 Y130.112 E.15077
; WIPE_START
G1 F9547.299
G1 X128.195 Y129.851 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.143 Y126.678 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192576
G1 F4972
M204 S6000
G1 X124.998 Y117.978 E.10701
; WIPE_START
G1 F15000
G1 X125.259 Y119.961 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y117.265 Z3.6 F42000
G1 Z3.2
M73 P47 R10
G1 E.8 F1800
; LINE_WIDTH: 0.48085
G1 F4972
M204 S6000
G1 X124.025 Y115.665 E.05759
M204 S10000
G1 X130.321 Y114.835 F42000
; LINE_WIDTH: 0.480855
G1 F4972
M204 S6000
G1 X130.531 Y116.436 E.05761
; WIPE_START
G1 F8220.414
G1 X130.321 Y114.835 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.98 Y117.322 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4972
M204 S6000
G1 X131.125 Y126.022 E.10701
; WIPE_START
G1 F15000
G1 X130.864 Y124.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.888 Y126.735 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.467132
G1 F4972
M204 S6000
G3 X131.983 Y127.596 I-19.671 J2.604 E.02994
; LINE_WIDTH: 0.423335
G1 X132.014 Y128 E.01256
; LINE_WIDTH: 0.387808
G1 X132.032 Y128.342 E.00962
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10438.192
G1 X132.014 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/73
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z3.6 I-.189 J-1.202 P1  F42000
G1 X126.188 Y128.914 Z3.6
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5404
M204 S5000
G1 X126.029 Y127.704 E.03749
G1 X128.668 Y127.357 E.08179
G1 X131.501 Y126.984 E.08782
G1 X131.661 Y128.193 E.03749
G1 X126.247 Y128.906 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.029 Y127.704 E-.46416
G1 X126.8 Y127.603 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y126.59 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5404
M204 S6000
G1 X126.446 Y126.843 E.00849
G1 X125.894 Y126.916 E.01847
G1 X124.695 Y117.813 E.30457
G1 X125.247 Y117.74 E.01847
G1 X126.404 Y126.53 E.2941
; WIPE_START
G1 F8843.478
G1 X126.446 Y126.843 E-.12002
G1 X125.894 Y126.916 E-.21155
G1 X125.747 Y125.798 E-.42843
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.876 Y126.26 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F5404
M204 S6000
G1 X129.677 Y117.157 E.30457
G1 X130.229 Y117.084 E.01847
G1 X131.428 Y126.187 E.30457
G1 X130.935 Y126.252 E.01648
; WIPE_START
G1 F8843.478
G1 X130.661 Y124.271 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.256 Y126.874 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F5404
M204 S6000
G1 X126.867 Y126.925 E.01301
G1 X125.633 Y117.552 E.31361
G1 X126.573 Y117.428 E.03146
G1 X129.256 Y117.075 E.08976
G1 X130.49 Y126.448 E.31361
G1 X127.315 Y126.866 E.10622
M204 S250
G1 X127.205 Y126.485 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5404
M204 S5000
G1 X126.073 Y117.889 E.2664
G1 X126.624 Y117.817 E.01709
G1 X128.918 Y117.515 E.0711
G1 X130.05 Y126.111 E.2664
G1 X127.264 Y126.477 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.989 Y124.496 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.543 Y127.373 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5404
M204 S6000
G1 X124.239 Y117.462 E.33158
G1 X130.58 Y116.627 E.21216
G1 X131.884 Y126.538 E.33158
G1 X125.603 Y127.365 E.21017
; WIPE_START
G1 F8843.478
G1 X125.33 Y125.383 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.883 Y133.003 Z3.8 F42000
G1 X124.485 Y139.788 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F5404
M204 S6000
G1 X124.53 Y139.44 E.01164
G1 X130.064 Y140.168 E.18516
G1 X130.018 Y140.517 E.01165
G1 X124.544 Y139.795 E.18317
M204 S10000
G1 X124.028 Y140.138 F42000
G1 F5404
M204 S6000
G1 X125.542 Y128.638 E.38478
G1 X125.756 Y128.638 E.0071
G1 X125.85 Y129.354 E.02395
G1 X126.109 Y129.32 E.00864
G1 X124.825 Y139.068 E.32616
G1 X129.876 Y139.733 E.16898
G1 X131.298 Y128.932 E.36137
G1 X130.988 Y128.891 E.01035
G1 X130.988 Y128.677 E.0071
G1 X131.979 Y128.547 E.03313
G1 X131.961 Y128.808 E.00869
G1 X130.369 Y140.973 E.40698
G1 X124.087 Y140.146 E.21017
; WIPE_START
G1 F8843.478
G1 X124.338 Y138.162 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.281 Y130.781 Z3.8 F42000
G1 X130.094 Y116.296 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5404
M204 S5000
G1 X124.622 Y117.016 E.16961
G1 X124.462 Y115.807 E.03749
G1 X127.101 Y115.459 E.08179
G1 X129.935 Y115.086 E.08782
G1 X130.086 Y116.236 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.107 Y116.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.688 Y124.019 Z3.8 F42000
G1 X123.614 Y140.277 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F5404
M204 S5000
G1 X125.188 Y128.32 E.37058
G2 X125.188 Y127.678 I-3.523 J-.32 E.01976
G1 X123.614 Y115.72 E.3706
G3 X123.772 Y115.5 I.192 J-.028 E.0092
G1 X130.51 Y114.613 E.20883
G3 X130.582 Y114.615 I.029 J.214 E.00225
G3 X130.732 Y114.784 I-.045 J.191 E.00738
G1 X132.306 Y126.736 E.37044
G3 X132.306 Y129.264 I-10.795 J1.264 E.07785
G1 X130.732 Y141.217 E.37046
G3 X130.51 Y141.387 I-.193 J-.022 E.00959
G1 X123.77 Y140.499 E.20891
G3 X123.614 Y140.338 I.036 J-.191 E.00734
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.874 Y138.355 E-.76
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


G1 X124.476 Y139.227 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.28678
G1 F5404
M204 S6000
G1 X125.747 Y129.572 E.19351
; WIPE_START
G1 F14762.587
G1 X125.486 Y131.555 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.143 Y126.678 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F5404
M204 S6000
G1 X124.998 Y117.978 E.10701
; WIPE_START
G1 F15000
G1 X125.259 Y119.961 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y117.265 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.480843
G1 F5404
M204 S6000
G1 X124.025 Y115.665 E.05759
; WIPE_START
G1 F8220.621
G1 X124.236 Y117.265 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.98 Y117.322 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F5404
M204 S6000
G1 X131.125 Y126.022 E.10701
; WIPE_START
G1 F15000
G1 X130.864 Y124.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.888 Y126.735 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.467118
G1 F5404
M204 S6000
G3 X131.983 Y127.596 I-19.656 J2.602 E.02994
; LINE_WIDTH: 0.423321
G1 X132.014 Y128 E.01256
; LINE_WIDTH: 0.387806
G1 X132.032 Y128.342 E.00962
M204 S10000
G1 X131.639 Y128.797 F42000
; LINE_WIDTH: 0.286682
G1 F5404
M204 S6000
G1 X130.172 Y139.977 E.22399
; WIPE_START
G1 F14768.529
G1 X130.432 Y137.994 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.377 Y130.362 Z3.8 F42000
G1 X130.367 Y129.034 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5404
M204 S2000
G1 X130.979 Y129.646 E.0266
G1 X130.917 Y130.117
G1 X129.753 Y128.953 E.05059
G1 X129.139 Y128.872
G1 X130.855 Y130.589 E.07458
G1 X130.793 Y131.06
G1 X128.546 Y128.812 E.09766
G1 X128.075 Y128.874
G1 X130.731 Y131.531 E.11544
G1 X130.669 Y132.002
G1 X127.603 Y128.937 E.13322
G1 X127.132 Y128.999
G1 X130.607 Y132.473 E.151
G1 X130.545 Y132.945
G1 X126.661 Y129.061 E.16878
G1 X126.339 Y129.272
G1 X130.483 Y133.416 E.18006
G1 X130.421 Y133.887
G1 X126.277 Y129.743 E.18006
G1 X126.215 Y130.215
G1 X130.359 Y134.358 E.18006
G1 X130.297 Y134.83
G1 X126.153 Y130.686 E.18006
G1 X126.091 Y131.157
G1 X130.235 Y135.301 E.18006
G1 X130.173 Y135.772
G1 X126.029 Y131.628 E.18006
G1 X125.967 Y132.1
G1 X130.111 Y136.243 E.18006
G1 X130.049 Y136.714
G1 X125.905 Y132.571 E.18006
G1 X125.843 Y133.042
G1 X129.987 Y137.186 E.18006
G1 X129.925 Y137.657
G1 X125.781 Y133.513 E.18006
G1 X125.719 Y133.984
G1 X129.863 Y138.128 E.18006
G1 X129.801 Y138.599
G1 X125.657 Y134.456 E.18006
G1 X125.595 Y134.927
G1 X129.738 Y139.071 E.18006
G1 X129.608 Y139.473
G1 X125.533 Y135.398 E.17708
G1 X125.471 Y135.869
G1 X128.994 Y139.392 E.15309
G1 X128.38 Y139.312
G1 X125.409 Y136.341 E.1291
G1 X125.347 Y136.812
M73 P48 R10
G1 X127.766 Y139.231 E.10511
G1 X127.151 Y139.15
G1 X125.285 Y137.283 E.08112
G1 X125.223 Y137.754
G1 X126.537 Y139.069 E.05713
G1 X125.923 Y138.988
G1 X125.161 Y138.225 E.03314
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.923 Y138.988 E-.40987
G1 X126.537 Y139.069 E-.23538
G1 X126.324 Y138.855 E-.11476
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.183 Y131.453 Z3.8 F42000
G1 X128.853 Y128.784 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.121108
G1 F5404
M204 S6000
G1 X129.068 Y128.784 E.00137
; LINE_WIDTH: 0.169478
G1 X129.284 Y128.784 E.00222
; LINE_WIDTH: 0.217848
G1 X129.499 Y128.784 E.00307
; LINE_WIDTH: 0.266218
G1 X129.715 Y128.784 E.00392
; LINE_WIDTH: 0.314587
G1 X129.93 Y128.784 E.00477
; LINE_WIDTH: 0.362957
G1 X130.146 Y128.784 E.00562
; LINE_WIDTH: 0.411327
G1 X130.361 Y128.784 E.00647
; LINE_WIDTH: 0.459697
G1 X130.577 Y128.784 E.00732
; LINE_WIDTH: 0.508067
G1 X130.792 Y128.784 E.00817
; WIPE_START
G1 F7739.502
G1 X130.577 Y128.784 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.549 Y121.152 Z3.8 F42000
G1 X130.531 Y116.436 Z3.8
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.480841
G1 F5404
M204 S6000
G1 X130.321 Y114.835 E.05761
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.669
G1 X130.531 Y116.436 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/73
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z3.8 I-1.149 J-.4 P1  F42000
G1 X126.188 Y128.914 Z3.8
G1 Z3.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4587
M204 S5000
G1 X126.029 Y127.704 E.03749
G1 X128.862 Y127.331 E.08782
G1 X131.501 Y126.984 E.08179
G1 X131.661 Y128.193 E.03749
G1 X126.247 Y128.906 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.029 Y127.704 E-.46416
G1 X126.8 Y127.603 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y126.59 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4587
M204 S6000
G1 X126.446 Y126.843 E.00849
G1 X125.894 Y126.916 E.01847
G1 X124.695 Y117.813 E.30457
G1 X125.247 Y117.74 E.01847
G1 X126.404 Y126.53 E.2941
; WIPE_START
G1 F8843.478
G1 X126.446 Y126.843 E-.12002
G1 X125.894 Y126.916 E-.21155
G1 X125.747 Y125.798 E-.42843
; WIPE_END
M73 P48 R9
G1 E-.04 F1800
M204 S10000
G1 X130.876 Y126.26 Z4 F42000
G1 Z3.6
G1 E.8 F1800
G1 F4587
M204 S6000
G1 X129.677 Y117.157 E.30457
G1 X130.229 Y117.084 E.01847
G1 X131.428 Y126.187 E.30457
G1 X130.935 Y126.252 E.01648
; WIPE_START
G1 F8843.478
G1 X130.661 Y124.271 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.256 Y126.874 Z4 F42000
G1 Z3.6
G1 E.8 F1800
G1 F4587
M204 S6000
G1 X126.867 Y126.925 E.01301
G1 X125.633 Y117.552 E.31361
G1 X126.626 Y117.421 E.03322
G1 X129.256 Y117.075 E.08799
G1 X130.49 Y126.448 E.31361
G1 X127.315 Y126.866 E.10622
M204 S250
G1 X127.205 Y126.485 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4587
M204 S5000
G1 X126.073 Y117.889 E.2664
G1 X126.677 Y117.81 E.01873
G1 X128.918 Y117.515 E.06946
G1 X130.05 Y126.111 E.2664
G1 X127.264 Y126.477 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.989 Y124.496 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.543 Y127.373 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4587
M204 S6000
G1 X124.239 Y117.462 E.33158
G1 X130.58 Y116.627 E.21216
G1 X131.884 Y126.538 E.33158
G1 X125.603 Y127.365 E.21017
; WIPE_START
G1 F8843.478
G1 X125.33 Y125.383 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.883 Y133.003 Z4 F42000
G1 X124.485 Y139.788 Z4
G1 Z3.6
G1 E.8 F1800
G1 F4587
M204 S6000
G1 X125.803 Y129.77 E.33516
G1 X126.375 Y129.695 E.01912
G1 X125.176 Y138.799 E.30459
G1 X129.606 Y139.382 E.14822
G1 X130.961 Y129.091 E.3443
G1 X131.533 Y129.016 E.01912
G1 X130.018 Y140.517 E.38478
G1 X124.544 Y139.795 E.18317
M204 S10000
G1 X124.028 Y140.138 F42000
G1 F4587
M204 S6000
G1 X125.542 Y128.638 E.38478
G1 X125.756 Y128.638 E.0071
G1 X125.85 Y129.354 E.02395
G1 X126.848 Y129.222 E.03337
G1 X125.633 Y138.448 E.30868
G1 X129.256 Y138.925 E.12122
G1 X130.49 Y129.552 E.31361
G1 X128.231 Y129.254 E.07559
G1 X128.231 Y129.04 E.0071
G1 X131.979 Y128.547 E.1254
G1 X131.961 Y128.808 E.00869
G1 X130.369 Y140.973 E.40698
G1 X124.087 Y140.146 E.21017
; WIPE_START
G1 F8843.478
G1 X124.338 Y138.162 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.74 Y130.917 Z4 F42000
G1 X127.205 Y129.515 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4587
M204 S5000
G1 X130.05 Y129.889 E.08819
G1 X128.918 Y138.485 E.26641
G1 X126.073 Y138.111 E.08819
G1 X126.112 Y137.813 E.00921
G1 X127.197 Y129.574 E.25535
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.185 Y129.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.698 Y122.179 Z4 F42000
G1 X130.094 Y116.296 Z4
G1 Z3.6
G1 E.8 F1800
G1 F4587
M204 S5000
G1 X124.622 Y117.016 E.16961
G1 X124.462 Y115.807 E.03749
G1 X127.296 Y115.434 E.08782
G1 X129.935 Y115.086 E.08179
G1 X130.086 Y116.236 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.107 Y116.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.688 Y124.019 Z4 F42000
G1 X123.614 Y140.277 Z4
G1 Z3.6
G1 E.8 F1800
G1 F4587
M204 S5000
G1 X125.188 Y128.32 E.37058
G2 X125.188 Y127.68 I-2.904 J-.32 E.01971
G1 X123.614 Y115.72 E.37067
G3 X123.772 Y115.5 I.19 J-.03 E.00922
G1 X130.51 Y114.613 E.20883
G3 X130.582 Y114.615 I.029 J.213 E.00224
G3 X130.732 Y114.784 I-.045 J.191 E.00739
G1 X132.306 Y126.736 E.37043
G3 X132.306 Y129.264 I-10.793 J1.264 E.07785
G1 X130.733 Y141.215 E.37037
G3 X130.51 Y141.387 I-.194 J-.02 E.00967
G1 X123.77 Y140.499 E.20891
G3 X123.614 Y140.338 I.038 J-.193 E.00733
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.874 Y138.355 E-.76
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


G1 X124.874 Y138.964 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192582
G1 F4587
M204 S6000
G1 X126.062 Y129.942 E.11098
; WIPE_START
G1 F15000
G1 X125.801 Y131.925 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.055 Y129.147 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.410056
G1 F4587
M204 S6000
G1 X127.382 Y129.147 E.00976
; LINE_WIDTH: 0.458935
G1 X127.708 Y129.147 E.01106
; LINE_WIDTH: 0.507813
G1 X128.034 Y129.147 E.01236
; WIPE_START
G1 F7743.723
G1 X127.708 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.156 Y129.147 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.119094
G1 F4587
M204 S6000
G1 X129.355 Y129.147 E.00124
; LINE_WIDTH: 0.163434
G1 X129.554 Y129.147 E.00195
; LINE_WIDTH: 0.207775
G1 X129.753 Y129.147 E.00267
; LINE_WIDTH: 0.252116
G1 X129.952 Y129.147 E.00339
; LINE_WIDTH: 0.296456
G1 X130.151 Y129.147 E.00411
; LINE_WIDTH: 0.340797
G1 X130.35 Y129.147 E.00483
; LINE_WIDTH: 0.385138
G1 X130.549 Y129.147 E.00555
; LINE_WIDTH: 0.429478
G1 X130.748 Y129.147 E.00627
M204 S10000
G1 X131.219 Y129.263 F42000
; LINE_WIDTH: 0.192592
G1 F4587
M204 S6000
G1 X129.856 Y139.62 E.12741
M204 S10000
G1 X124.971 Y139.414 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50504
G1 F4587
M204 S6000
G1 X125.154 Y139.437 E.00695
; LINE_WIDTH: 0.531793
G1 X125.224 Y139.42 E.00283
; LINE_WIDTH: 0.581778
G1 X125.293 Y139.404 E.00312
; LINE_WIDTH: 0.631763
G1 X125.362 Y139.388 E.00341
; LINE_WIDTH: 0.681748
G1 X125.431 Y139.372 E.0037
; LINE_WIDTH: 0.70688
G1 X129.212 Y139.87 E.2063
; LINE_WIDTH: 0.686678
G1 X129.27 Y139.898 E.00338
; LINE_WIDTH: 0.645994
G1 X129.328 Y139.926 E.00317
; LINE_WIDTH: 0.60531
G1 X129.386 Y139.954 E.00296
; LINE_WIDTH: 0.564626
G1 X129.444 Y139.983 E.00274
; LINE_WIDTH: 0.512419
G2 X129.585 Y140.022 I.13 J-.194 E.00572
; WIPE_START
G1 F7667.757
G1 X129.444 Y139.983 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.1 Y132.532 Z4 F42000
G1 X132.032 Y128.342 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.387808
G1 F4587
M204 S6000
G1 X132.014 Y128 E.00962
; LINE_WIDTH: 0.423315
M73 P49 R9
G1 X131.983 Y127.596 E.01256
; LINE_WIDTH: 0.467123
G2 X131.888 Y126.735 I-19.763 J1.743 E.02994
; WIPE_START
G1 F8486.507
G1 X131.983 Y127.596 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.125 Y126.022 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4587
M204 S6000
G1 X129.98 Y117.322 E.10701
; WIPE_START
G1 F15000
G1 X130.241 Y119.305 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.531 Y116.436 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.480855
G1 F4587
M204 S6000
G1 X130.321 Y114.835 E.05761
; WIPE_START
G1 F8220.395
G1 X130.531 Y116.436 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.998 Y117.978 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4587
M204 S6000
G1 X126.143 Y126.678 E.10701
; WIPE_START
G1 F15000
G1 X125.882 Y124.695 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y117.265 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.48085
G1 F4587
M204 S6000
G1 X124.025 Y115.665 E.05759
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.505
G1 X124.236 Y117.265 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/73
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z4 I-1.2 J.201 P1  F42000
G1 X126.188 Y128.914 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4585
M204 S5000
G1 X126.029 Y127.704 E.03749
G1 X129.057 Y127.305 E.09385
G1 X131.501 Y126.984 E.07577
G1 X131.661 Y128.193 E.03749
G1 X126.247 Y128.906 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.029 Y127.704 E-.46416
G1 X126.8 Y127.603 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y126.59 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4585
M204 S6000
G1 X126.446 Y126.843 E.00849
G1 X125.894 Y126.916 E.01847
G1 X124.695 Y117.813 E.30457
G1 X125.247 Y117.74 E.01847
G1 X126.404 Y126.53 E.2941
; WIPE_START
G1 F8843.478
G1 X126.446 Y126.843 E-.12002
G1 X125.894 Y126.916 E-.21155
G1 X125.747 Y125.798 E-.42843
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.876 Y126.26 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
G1 F4585
M204 S6000
G1 X129.677 Y117.157 E.30457
G1 X130.229 Y117.084 E.01847
G1 X131.428 Y126.187 E.30457
G1 X130.935 Y126.252 E.01648
; WIPE_START
G1 F8843.478
G1 X130.661 Y124.271 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.816 Y126.536 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
G1 F4585
M204 S6000
G1 X125.633 Y117.552 E.3006
G1 X126.679 Y117.414 E.03499
G1 X129.256 Y117.075 E.08623
G1 X130.49 Y126.448 E.31361
G1 X126.867 Y126.925 E.12121
G1 X126.824 Y126.596 E.01102
M204 S250
G1 X127.205 Y126.485 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4585
M204 S5000
G1 X126.073 Y117.889 E.2664
G1 X126.73 Y117.803 E.02036
G1 X128.918 Y117.515 E.06782
G1 X130.05 Y126.111 E.2664
G1 X127.264 Y126.477 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.989 Y124.496 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.543 Y127.373 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4585
M204 S6000
G1 X124.239 Y117.462 E.33158
G1 X130.58 Y116.627 E.21216
G1 X131.884 Y126.538 E.33158
G1 X125.603 Y127.365 E.21017
; WIPE_START
G1 F8843.478
G1 X125.33 Y125.383 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.883 Y133.003 Z4.2 F42000
G1 X124.485 Y139.788 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F4585
M204 S6000
G1 X125.803 Y129.77 E.33516
G1 X126.375 Y129.695 E.01912
G1 X125.176 Y138.799 E.30459
G1 X129.606 Y139.382 E.14822
G1 X130.961 Y129.091 E.3443
G1 X131.533 Y129.016 E.01912
G1 X130.018 Y140.517 E.38478
G1 X124.544 Y139.795 E.18317
M204 S10000
G1 X124.028 Y140.138 F42000
G1 F4585
M204 S6000
G1 X125.542 Y128.638 E.38478
G1 X125.756 Y128.638 E.0071
G1 X125.85 Y129.354 E.02395
G1 X126.848 Y129.222 E.03337
G1 X125.633 Y138.448 E.30868
G1 X129.256 Y138.925 E.12121
G1 X130.49 Y129.552 E.31361
G1 X128.231 Y129.254 E.07559
G1 X128.231 Y129.04 E.0071
G1 X131.979 Y128.547 E.1254
G1 X131.961 Y128.808 E.00869
G1 X130.369 Y140.973 E.40698
G1 X124.087 Y140.146 E.21017
; WIPE_START
G1 F8843.478
G1 X124.338 Y138.162 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.74 Y130.917 Z4.2 F42000
G1 X127.205 Y129.515 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4585
M204 S5000
G1 X130.05 Y129.889 E.08819
G1 X128.918 Y138.485 E.26641
G1 X126.073 Y138.111 E.08819
G1 X126.135 Y137.636 E.01472
G1 X127.197 Y129.574 E.24984
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.185 Y129.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.698 Y122.179 Z4.2 F42000
G1 X130.094 Y116.296 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F4585
M204 S5000
G1 X124.622 Y117.016 E.16961
G1 X124.462 Y115.807 E.03749
G1 X127.49 Y115.408 E.09385
G1 X129.935 Y115.086 E.07577
G1 X130.086 Y116.236 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.107 Y116.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.688 Y124.019 Z4.2 F42000
G1 X123.614 Y140.277 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F4585
M204 S5000
G1 X125.188 Y128.32 E.37059
G2 X125.188 Y127.68 I-2.783 J-.32 E.0197
G1 X123.614 Y115.72 E.37067
G3 X123.772 Y115.5 I.192 J-.029 E.00922
G1 X130.51 Y114.613 E.20882
G3 X130.582 Y114.615 I.029 J.214 E.00224
G3 X130.733 Y114.785 I-.041 J.188 E.00746
G1 X132.306 Y126.736 E.37038
G3 X132.306 Y129.264 I-9.872 J1.264 E.07789
G1 X130.732 Y141.217 E.37044
G3 X130.511 Y141.387 I-.194 J-.022 E.0096
G1 X123.751 Y140.495 E.20949
G3 X123.613 Y140.338 I.053 J-.186 E.0068
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.873 Y138.355 E-.76
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


G1 X124.874 Y138.964 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.1926
G1 F4585
M204 S6000
G1 X126.062 Y129.942 E.11099
; WIPE_START
G1 F15000
G1 X125.801 Y131.925 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.055 Y129.147 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.410076
G1 F4585
M204 S6000
G1 X127.382 Y129.147 E.00976
; LINE_WIDTH: 0.458948
G1 X127.708 Y129.147 E.01106
; LINE_WIDTH: 0.50782
G1 X128.034 Y129.147 E.01236
; WIPE_START
G1 F7743.612
G1 X127.708 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.156 Y129.147 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.119094
G1 F4585
M204 S6000
G1 X129.355 Y129.147 E.00124
; LINE_WIDTH: 0.163435
G1 X129.554 Y129.147 E.00195
; LINE_WIDTH: 0.207776
G1 X129.753 Y129.147 E.00267
; LINE_WIDTH: 0.252117
G1 X129.952 Y129.147 E.00339
; LINE_WIDTH: 0.296458
G1 X130.151 Y129.147 E.00411
; LINE_WIDTH: 0.340799
G1 X130.35 Y129.147 E.00483
; LINE_WIDTH: 0.385141
G1 X130.549 Y129.147 E.00555
; LINE_WIDTH: 0.429482
G1 X130.748 Y129.147 E.00627
M204 S10000
G1 X131.219 Y129.263 F42000
; LINE_WIDTH: 0.192592
G1 F4585
M204 S6000
G1 X129.856 Y139.62 E.12741
M204 S10000
G1 X124.971 Y139.414 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50502
G1 F4585
M204 S6000
G1 X125.154 Y139.437 E.00695
; LINE_WIDTH: 0.531775
G1 X125.224 Y139.42 E.00283
; LINE_WIDTH: 0.581765
G1 X125.293 Y139.404 E.00312
; LINE_WIDTH: 0.631755
G1 X125.362 Y139.388 E.00341
; LINE_WIDTH: 0.681745
G1 X125.431 Y139.372 E.0037
; LINE_WIDTH: 0.70688
G1 X129.212 Y139.87 E.2063
; LINE_WIDTH: 0.686678
G1 X129.27 Y139.898 E.00338
; LINE_WIDTH: 0.645994
G1 X129.328 Y139.926 E.00317
; LINE_WIDTH: 0.60531
G1 X129.386 Y139.954 E.00296
; LINE_WIDTH: 0.564626
G1 X129.444 Y139.983 E.00274
; LINE_WIDTH: 0.512419
G2 X129.585 Y140.022 I.13 J-.194 E.00572
; WIPE_START
G1 F7667.757
G1 X129.444 Y139.983 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.1 Y132.532 Z4.2 F42000
G1 X132.032 Y128.342 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.387806
G1 F4585
M204 S6000
G1 X132.014 Y128 E.00962
; LINE_WIDTH: 0.423329
G1 X131.983 Y127.596 E.01256
; LINE_WIDTH: 0.467122
G2 X131.888 Y126.735 I-19.756 J1.742 E.02994
; WIPE_START
G1 F8486.532
M73 P50 R9
G1 X131.983 Y127.596 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.125 Y126.022 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4585
M204 S6000
G1 X129.98 Y117.322 E.10701
; WIPE_START
G1 F15000
G1 X130.241 Y119.305 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.531 Y116.436 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.480842
G1 F4585
M204 S6000
G1 X130.321 Y114.835 E.05761
; WIPE_START
G1 F8220.657
G1 X130.531 Y116.436 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.998 Y117.978 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4585
M204 S6000
G1 X126.143 Y126.678 E.10701
; WIPE_START
G1 F15000
G1 X125.882 Y124.695 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y117.265 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.480842
G1 F4585
M204 S6000
G1 X124.025 Y115.665 E.05759
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.654
G1 X124.236 Y117.265 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/73
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z4.2 I-1.2 J.201 P1  F42000
G1 X126.188 Y128.914 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4585
M204 S5000
G1 X126.029 Y127.704 E.03749
G1 X129.251 Y127.28 E.09987
G1 X131.501 Y126.984 E.06974
G1 X131.661 Y128.193 E.03749
G1 X126.247 Y128.906 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.029 Y127.704 E-.46416
G1 X126.8 Y127.603 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y126.59 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4585
M204 S6000
G1 X126.446 Y126.843 E.00849
G1 X125.894 Y126.916 E.01847
G1 X124.695 Y117.813 E.30457
G1 X125.247 Y117.74 E.01847
G1 X126.404 Y126.53 E.2941
; WIPE_START
G1 F8843.478
G1 X126.446 Y126.843 E-.12002
G1 X125.894 Y126.916 E-.21155
G1 X125.747 Y125.798 E-.42843
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.876 Y126.26 Z4.4 F42000
G1 Z4
G1 E.8 F1800
G1 F4585
M204 S6000
G1 X129.677 Y117.157 E.30457
G1 X130.229 Y117.084 E.01847
G1 X131.428 Y126.187 E.30457
G1 X130.935 Y126.252 E.01648
; WIPE_START
G1 F8843.478
G1 X130.661 Y124.271 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.256 Y126.874 Z4.4 F42000
G1 Z4
G1 E.8 F1800
G1 F4585
M204 S6000
G1 X126.867 Y126.925 E.01301
G1 X125.633 Y117.552 E.31361
G1 X126.732 Y117.407 E.03676
G1 X129.256 Y117.075 E.08446
G1 X130.49 Y126.448 E.31361
G1 X127.315 Y126.866 E.10622
M204 S250
G1 X127.205 Y126.485 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4585
M204 S5000
G1 X126.073 Y117.889 E.2664
G1 X126.783 Y117.796 E.022
G1 X128.918 Y117.515 E.06619
G1 X130.05 Y126.111 E.2664
G1 X127.264 Y126.477 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.989 Y124.496 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.543 Y127.373 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4585
M204 S6000
G1 X124.239 Y117.462 E.33158
G1 X130.58 Y116.627 E.21216
G1 X131.884 Y126.538 E.33158
G1 X125.603 Y127.365 E.21017
; WIPE_START
G1 F8843.478
G1 X125.33 Y125.383 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.883 Y133.003 Z4.4 F42000
G1 X124.485 Y139.788 Z4.4
G1 Z4
G1 E.8 F1800
G1 F4585
M204 S6000
G1 X125.803 Y129.77 E.33516
G1 X126.375 Y129.695 E.01912
G1 X125.176 Y138.799 E.30459
G1 X129.606 Y139.382 E.14822
G1 X130.961 Y129.091 E.3443
G1 X131.533 Y129.016 E.01912
G1 X130.018 Y140.517 E.38478
G1 X124.544 Y139.795 E.18317
M204 S10000
G1 X124.028 Y140.138 F42000
G1 F4585
M204 S6000
G1 X125.542 Y128.638 E.38478
G1 X125.756 Y128.638 E.0071
G1 X125.85 Y129.354 E.02395
G1 X126.848 Y129.222 E.03337
G1 X125.633 Y138.448 E.30868
G1 X129.256 Y138.925 E.12121
G1 X130.49 Y129.552 E.31361
G1 X128.231 Y129.254 E.07559
G1 X128.231 Y129.04 E.0071
G1 X131.979 Y128.547 E.1254
G1 X131.961 Y128.808 E.00869
G1 X130.369 Y140.973 E.40698
G1 X124.087 Y140.146 E.21017
; WIPE_START
G1 F8843.478
G1 X124.338 Y138.162 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.74 Y130.917 Z4.4 F42000
G1 X127.205 Y129.515 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4585
M204 S5000
G1 X130.05 Y129.889 E.08819
G1 X128.918 Y138.485 E.26641
G1 X126.073 Y138.111 E.08819
G1 X126.159 Y137.458 E.02023
G1 X127.197 Y129.574 E.24433
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.185 Y129.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.698 Y122.179 Z4.4 F42000
G1 X130.094 Y116.296 Z4.4
G1 Z4
G1 E.8 F1800
G1 F4585
M204 S5000
G1 X124.622 Y117.016 E.16961
G1 X124.462 Y115.807 E.03749
G1 X127.685 Y115.383 E.09987
G1 X129.935 Y115.086 E.06974
G1 X130.086 Y116.236 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.107 Y116.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.688 Y124.019 Z4.4 F42000
G1 X123.614 Y140.278 Z4.4
G1 Z4
G1 E.8 F1800
G1 F4585
M204 S5000
G1 X125.188 Y128.32 E.3706
G2 X125.188 Y127.678 I-3.322 J-.319 E.01976
G1 X123.614 Y115.72 E.3706
G3 X123.772 Y115.5 I.19 J-.03 E.00924
G1 X130.51 Y114.613 E.20882
G3 X130.582 Y114.615 I.029 J.214 E.00224
G3 X130.733 Y114.785 I-.045 J.191 E.00744
G1 X132.306 Y126.736 E.37038
G3 X132.306 Y129.264 I-9.873 J1.264 E.07789
G1 X130.732 Y141.216 E.37043
G3 X130.511 Y141.387 I-.192 J-.02 E.00963
G1 X123.77 Y140.499 E.20891
G3 X123.614 Y140.338 I.038 J-.192 E.00734
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.874 Y138.355 E-.76
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


G1 X124.874 Y138.964 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192601
G1 F4585
M204 S6000
G1 X126.062 Y129.942 E.111
; WIPE_START
G1 F15000
G1 X125.801 Y131.925 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.055 Y129.147 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.410076
G1 F4585
M204 S6000
G1 X127.382 Y129.147 E.00976
; LINE_WIDTH: 0.458947
G1 X127.708 Y129.147 E.01106
; LINE_WIDTH: 0.507818
G1 X128.034 Y129.147 E.01236
; WIPE_START
G1 F7743.648
G1 X127.708 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.156 Y129.147 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.119093
G1 F4585
M204 S6000
G1 X129.355 Y129.147 E.00124
; LINE_WIDTH: 0.163432
G1 X129.554 Y129.147 E.00195
; LINE_WIDTH: 0.207771
G1 X129.753 Y129.147 E.00267
; LINE_WIDTH: 0.25211
G1 X129.952 Y129.147 E.00339
; LINE_WIDTH: 0.296448
G1 X130.151 Y129.147 E.00411
; LINE_WIDTH: 0.340787
G1 X130.35 Y129.147 E.00483
; LINE_WIDTH: 0.385126
G1 X130.549 Y129.147 E.00555
; LINE_WIDTH: 0.429465
G1 X130.748 Y129.147 E.00627
M204 S10000
G1 X131.219 Y129.263 F42000
; LINE_WIDTH: 0.192592
G1 F4585
M204 S6000
G1 X129.856 Y139.62 E.12741
M204 S10000
G1 X124.971 Y139.414 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50506
G1 F4585
M204 S6000
G1 X125.154 Y139.437 E.00695
; LINE_WIDTH: 0.531813
G1 X125.224 Y139.42 E.00283
; LINE_WIDTH: 0.581798
G1 X125.293 Y139.404 E.00312
; LINE_WIDTH: 0.631783
G1 X125.362 Y139.388 E.00341
; LINE_WIDTH: 0.681768
G1 X125.431 Y139.372 E.0037
; LINE_WIDTH: 0.70689
G1 X129.212 Y139.87 E.2063
; LINE_WIDTH: 0.68668
G1 X129.27 Y139.898 E.00338
; LINE_WIDTH: 0.646
G1 X129.328 Y139.926 E.00317
; LINE_WIDTH: 0.60532
G1 X129.386 Y139.955 E.00296
; LINE_WIDTH: 0.56464
G1 X129.444 Y139.983 E.00274
; LINE_WIDTH: 0.512432
G2 X129.585 Y140.022 I.13 J-.194 E.00572
; WIPE_START
G1 F7667.535
G1 X129.444 Y139.983 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.1 Y132.532 Z4.4 F42000
G1 X132.032 Y128.342 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.387806
G1 F4585
M204 S6000
G1 X132.014 Y128 E.00962
; LINE_WIDTH: 0.423331
G1 X131.983 Y127.596 E.01256
; LINE_WIDTH: 0.467123
G2 X131.888 Y126.735 I-19.743 J1.741 E.02994
; WIPE_START
G1 F8486.503
G1 X131.983 Y127.596 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.125 Y126.022 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4585
M204 S6000
G1 X129.98 Y117.322 E.10701
; WIPE_START
G1 F15000
G1 X130.241 Y119.305 E-.76
; WIPE_END
M73 P51 R9
G1 E-.04 F1800
M204 S10000
G1 X130.531 Y116.436 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.480841
G1 F4585
M204 S6000
G1 X130.321 Y114.835 E.05761
; WIPE_START
G1 F8220.669
G1 X130.531 Y116.436 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.998 Y117.978 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4585
M204 S6000
G1 X126.143 Y126.678 E.10701
; WIPE_START
G1 F15000
G1 X125.882 Y124.695 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y117.265 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.480851
G1 F4585
M204 S6000
G1 X124.025 Y115.665 E.05759
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.487
G1 X124.236 Y117.265 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/73
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z4.4 I-1.2 J.201 P1  F42000
G1 X126.188 Y128.914 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4585
M204 S5000
G1 X126.029 Y127.704 E.03749
G1 X129.446 Y127.254 E.1059
G1 X131.501 Y126.984 E.06371
G1 X131.661 Y128.193 E.03749
G1 X126.247 Y128.906 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.029 Y127.704 E-.46416
G1 X126.8 Y127.603 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y126.59 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4585
M204 S6000
G1 X126.446 Y126.843 E.00849
G1 X125.894 Y126.916 E.01847
G1 X124.695 Y117.813 E.30457
G1 X125.247 Y117.74 E.01847
G1 X126.404 Y126.53 E.2941
; WIPE_START
G1 F8843.478
G1 X126.446 Y126.843 E-.12002
G1 X125.894 Y126.916 E-.21155
G1 X125.747 Y125.798 E-.42843
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.876 Y126.26 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F4585
M204 S6000
G1 X129.677 Y117.157 E.30457
G1 X130.229 Y117.084 E.01847
G1 X131.428 Y126.187 E.30457
G1 X130.935 Y126.252 E.01648
; WIPE_START
G1 F8843.478
G1 X130.661 Y124.271 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.256 Y126.874 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F4585
M204 S6000
G1 X126.867 Y126.925 E.01301
G1 X125.633 Y117.552 E.31361
G1 X126.784 Y117.4 E.03852
G1 X129.256 Y117.075 E.08269
G1 X130.49 Y126.448 E.31361
G1 X127.315 Y126.866 E.10622
M204 S250
G1 X127.205 Y126.485 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4585
M204 S5000
G1 X126.073 Y117.889 E.2664
G1 X126.836 Y117.789 E.02364
G1 X128.918 Y117.515 E.06455
G1 X130.05 Y126.111 E.2664
G1 X127.264 Y126.477 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.989 Y124.496 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.543 Y127.373 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4585
M204 S6000
G1 X124.239 Y117.462 E.33158
G1 X130.58 Y116.627 E.21216
G1 X131.884 Y126.538 E.33158
G1 X125.603 Y127.365 E.21017
; WIPE_START
G1 F8843.478
G1 X125.33 Y125.383 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.883 Y133.003 Z4.6 F42000
G1 X124.485 Y139.788 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F4585
M204 S6000
G1 X125.803 Y129.77 E.33516
G1 X126.375 Y129.695 E.01912
G1 X125.176 Y138.799 E.30459
G1 X129.606 Y139.382 E.14822
G1 X130.961 Y129.091 E.3443
G1 X131.533 Y129.016 E.01912
G1 X130.018 Y140.517 E.38478
G1 X124.544 Y139.795 E.18317
M204 S10000
G1 X124.028 Y140.138 F42000
G1 F4585
M204 S6000
G1 X125.542 Y128.638 E.38478
G1 X125.756 Y128.638 E.0071
G1 X125.85 Y129.354 E.02395
G1 X126.848 Y129.222 E.03337
G1 X125.633 Y138.448 E.30868
G1 X129.256 Y138.925 E.12121
G1 X130.49 Y129.552 E.31361
G1 X128.231 Y129.254 E.07559
G1 X128.231 Y129.04 E.0071
G1 X131.979 Y128.547 E.1254
G1 X131.961 Y128.808 E.00869
G1 X130.369 Y140.973 E.40698
G1 X124.087 Y140.146 E.21017
; WIPE_START
G1 F8843.478
G1 X124.338 Y138.162 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.74 Y130.917 Z4.6 F42000
G1 X127.205 Y129.515 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4585
M204 S5000
G1 X130.05 Y129.889 E.08819
G1 X128.918 Y138.485 E.26641
G1 X126.073 Y138.111 E.08819
G1 X126.182 Y137.28 E.02574
G1 X127.197 Y129.574 E.23882
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.185 Y129.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.698 Y122.179 Z4.6 F42000
G1 X130.094 Y116.296 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F4585
M204 S5000
G1 X124.622 Y117.016 E.16961
G1 X124.462 Y115.807 E.03749
G1 X127.879 Y115.357 E.1059
G1 X129.935 Y115.086 E.06371
G1 X130.086 Y116.236 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.107 Y116.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.688 Y124.019 Z4.6 F42000
G1 X123.614 Y140.278 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F4585
M204 S5000
G1 X125.188 Y128.32 E.37059
G2 X125.188 Y127.678 I-3.581 J-.32 E.01977
G1 X123.614 Y115.72 E.3706
G3 X123.772 Y115.5 I.19 J-.03 E.00922
G1 X130.509 Y114.613 E.20882
G3 X130.582 Y114.615 I.03 J.214 E.00225
G3 X130.732 Y114.784 I-.045 J.191 E.00738
G1 X132.306 Y126.736 E.37044
G3 X132.306 Y129.264 I-9.872 J1.264 E.07789
G1 X130.733 Y141.215 E.37038
G3 X130.51 Y141.387 I-.194 J-.02 E.00967
G1 X123.77 Y140.499 E.20891
G3 X123.614 Y140.338 I.039 J-.192 E.00732
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.874 Y138.355 E-.76
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


G1 X124.874 Y138.964 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192595
G1 F4585
M204 S6000
G1 X126.062 Y129.942 E.11099
; WIPE_START
G1 F15000
G1 X125.801 Y131.925 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.055 Y129.147 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.410092
G1 F4585
M204 S6000
G1 X127.382 Y129.147 E.00976
; LINE_WIDTH: 0.458956
G1 X127.708 Y129.147 E.01106
; LINE_WIDTH: 0.50782
G1 X128.034 Y129.147 E.01236
; WIPE_START
G1 F7743.602
G1 X127.708 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.156 Y129.147 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.119094
G1 F4585
M204 S6000
G1 X129.355 Y129.147 E.00124
; LINE_WIDTH: 0.163435
G1 X129.554 Y129.147 E.00195
; LINE_WIDTH: 0.207776
G1 X129.753 Y129.147 E.00267
; LINE_WIDTH: 0.252117
G1 X129.952 Y129.147 E.00339
; LINE_WIDTH: 0.296459
G1 X130.151 Y129.147 E.00411
; LINE_WIDTH: 0.3408
G1 X130.35 Y129.147 E.00483
; LINE_WIDTH: 0.385141
G1 X130.549 Y129.147 E.00555
; LINE_WIDTH: 0.429482
G1 X130.748 Y129.147 E.00627
M204 S10000
G1 X131.219 Y129.263 F42000
; LINE_WIDTH: 0.192582
G1 F4585
M204 S6000
G1 X129.856 Y139.62 E.1274
M204 S10000
G1 X124.971 Y139.414 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.505
G1 F4585
M204 S6000
G1 X125.154 Y139.437 E.00695
; LINE_WIDTH: 0.531753
G1 X125.224 Y139.42 E.00283
; LINE_WIDTH: 0.581738
G1 X125.293 Y139.404 E.00312
; LINE_WIDTH: 0.631723
G1 X125.362 Y139.388 E.00341
; LINE_WIDTH: 0.681708
G1 X125.431 Y139.372 E.0037
; LINE_WIDTH: 0.70686
G1 X129.212 Y139.87 E.20629
; LINE_WIDTH: 0.68668
G1 X129.27 Y139.898 E.00338
; LINE_WIDTH: 0.646
G1 X129.328 Y139.926 E.00317
; LINE_WIDTH: 0.60532
G1 X129.386 Y139.954 E.00296
; LINE_WIDTH: 0.56464
G1 X129.444 Y139.983 E.00274
; LINE_WIDTH: 0.512432
G2 X129.585 Y140.022 I.13 J-.194 E.00572
; WIPE_START
G1 F7667.535
G1 X129.444 Y139.983 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.1 Y132.532 Z4.6 F42000
G1 X132.032 Y128.342 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.387808
G1 F4585
M204 S6000
G1 X132.014 Y128 E.00962
; LINE_WIDTH: 0.423325
G1 X131.983 Y127.596 E.01256
; LINE_WIDTH: 0.467124
G2 X131.888 Y126.735 I-19.748 J1.741 E.02994
; WIPE_START
G1 F8486.5
G1 X131.983 Y127.596 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.125 Y126.022 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4585
M204 S6000
G1 X129.98 Y117.322 E.10701
; WIPE_START
G1 F15000
G1 X130.241 Y119.305 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.531 Y116.436 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.480855
G1 F4585
M204 S6000
G1 X130.321 Y114.835 E.05761
; WIPE_START
G1 F8220.395
G1 X130.531 Y116.436 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.998 Y117.978 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4585
M204 S6000
G1 X126.143 Y126.678 E.10701
; WIPE_START
G1 F15000
G1 X125.882 Y124.695 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y117.265 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.480842
G1 F4585
M204 S6000
G1 X124.025 Y115.665 E.05759
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.648
G1 X124.236 Y117.265 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/73
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z4.6 I-1.2 J.201 P1  F42000
G1 X126.188 Y128.914 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4585
M204 S5000
G1 X126.029 Y127.704 E.03749
G1 X129.64 Y127.229 E.11193
G1 X131.501 Y126.984 E.05768
G1 X131.661 Y128.193 E.03749
G1 X126.247 Y128.906 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.029 Y127.704 E-.46416
G1 X126.8 Y127.603 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y126.59 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4585
M204 S6000
G1 X126.446 Y126.843 E.00849
G1 X125.894 Y126.916 E.01847
G1 X124.695 Y117.813 E.30457
G1 X125.247 Y117.74 E.01847
M73 P52 R9
G1 X126.404 Y126.53 E.2941
; WIPE_START
G1 F8843.478
G1 X126.446 Y126.843 E-.12002
G1 X125.894 Y126.916 E-.21155
G1 X125.747 Y125.798 E-.42843
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.876 Y126.26 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F4585
M204 S6000
G1 X129.677 Y117.157 E.30457
G1 X130.229 Y117.084 E.01847
G1 X131.428 Y126.187 E.30457
G1 X130.935 Y126.252 E.01648
; WIPE_START
G1 F8843.478
G1 X130.661 Y124.271 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.256 Y126.874 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F4585
M204 S6000
G1 X126.867 Y126.925 E.01301
G1 X125.633 Y117.552 E.31361
G1 X126.837 Y117.393 E.04029
G1 X129.256 Y117.075 E.08093
G1 X130.49 Y126.448 E.31361
G1 X127.315 Y126.866 E.10622
M204 S250
G1 X127.205 Y126.485 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4585
M204 S5000
G1 X126.073 Y117.889 E.2664
G1 X126.888 Y117.782 E.02527
G1 X128.918 Y117.515 E.06291
G1 X130.05 Y126.111 E.2664
G1 X127.264 Y126.477 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.989 Y124.496 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.543 Y127.373 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4585
M204 S6000
G1 X124.239 Y117.462 E.33158
G1 X130.58 Y116.627 E.21216
G1 X131.884 Y126.538 E.33158
G1 X125.603 Y127.365 E.21017
; WIPE_START
G1 F8843.478
G1 X125.33 Y125.383 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.883 Y133.003 Z4.8 F42000
G1 X124.485 Y139.788 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F4585
M204 S6000
G1 X125.803 Y129.77 E.33516
G1 X126.375 Y129.695 E.01912
G1 X125.176 Y138.799 E.30459
G1 X129.606 Y139.382 E.14822
G1 X130.961 Y129.091 E.3443
G1 X131.533 Y129.016 E.01912
G1 X130.018 Y140.517 E.38478
G1 X124.544 Y139.795 E.18317
M204 S10000
G1 X124.028 Y140.138 F42000
G1 F4585
M204 S6000
G1 X125.542 Y128.638 E.38478
G1 X125.756 Y128.638 E.0071
G1 X125.85 Y129.354 E.02395
G1 X126.848 Y129.222 E.03337
G1 X125.633 Y138.448 E.30868
G1 X129.256 Y138.925 E.12121
G1 X130.49 Y129.552 E.31361
G1 X128.231 Y129.254 E.07559
G1 X128.231 Y129.04 E.0071
G1 X131.979 Y128.547 E.1254
G1 X131.961 Y128.808 E.00869
G1 X130.369 Y140.973 E.40698
G1 X124.087 Y140.146 E.21017
; WIPE_START
G1 F8843.478
G1 X124.338 Y138.162 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.74 Y130.917 Z4.8 F42000
G1 X127.205 Y129.515 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4585
M204 S5000
G1 X130.05 Y129.889 E.08819
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.206 Y137.102 E.03125
G1 X127.197 Y129.574 E.23331
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.185 Y129.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.698 Y122.179 Z4.8 F42000
G1 X130.094 Y116.296 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F4585
M204 S5000
G1 X124.622 Y117.016 E.16961
G1 X124.462 Y115.807 E.03749
G1 X128.074 Y115.331 E.11193
G1 X129.935 Y115.086 E.05768
G1 X130.086 Y116.236 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.106 Y116.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.688 Y124.019 Z4.8 F42000
G1 X123.614 Y140.278 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F4585
M204 S5000
G1 X125.188 Y128.32 E.3706
G2 X125.188 Y127.678 I-3.32 J-.319 E.01976
G1 X123.614 Y115.72 E.3706
G3 X123.77 Y115.501 I.19 J-.03 E.00916
G1 X130.509 Y114.613 E.20888
G3 X130.582 Y114.615 I.03 J.214 E.00225
G3 X130.732 Y114.784 I-.045 J.191 E.00739
G1 X132.306 Y126.736 E.37043
G3 X132.306 Y129.264 I-10.795 J1.264 E.07785
G1 X130.732 Y141.216 E.37043
G3 X130.51 Y141.387 I-.194 J-.022 E.00961
G1 X123.751 Y140.495 E.20948
G3 X123.613 Y140.338 I.053 J-.185 E.0068
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.873 Y138.355 E-.76
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


G1 X124.874 Y138.964 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192586
G1 F4585
M204 S6000
G1 X126.062 Y129.942 E.11098
; WIPE_START
G1 F15000
G1 X125.801 Y131.925 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.055 Y129.147 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.410092
G1 F4585
M204 S6000
G1 X127.382 Y129.147 E.00976
; LINE_WIDTH: 0.458956
G1 X127.708 Y129.147 E.01106
; LINE_WIDTH: 0.50782
G1 X128.034 Y129.147 E.01236
; WIPE_START
G1 F7743.602
G1 X127.708 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.156 Y129.147 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.119094
G1 F4585
M204 S6000
G1 X129.355 Y129.147 E.00124
; LINE_WIDTH: 0.163435
G1 X129.554 Y129.147 E.00195
; LINE_WIDTH: 0.207776
G1 X129.753 Y129.147 E.00267
; LINE_WIDTH: 0.252117
G1 X129.952 Y129.147 E.00339
; LINE_WIDTH: 0.296459
G1 X130.151 Y129.147 E.00411
; LINE_WIDTH: 0.3408
G1 X130.35 Y129.147 E.00483
; LINE_WIDTH: 0.385141
G1 X130.549 Y129.147 E.00555
; LINE_WIDTH: 0.429482
G1 X130.748 Y129.147 E.00627
M204 S10000
G1 X131.219 Y129.263 F42000
; LINE_WIDTH: 0.192592
G1 F4585
M204 S6000
G1 X129.856 Y139.62 E.12741
M204 S10000
G1 X124.971 Y139.414 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50502
G1 F4585
M204 S6000
G1 X125.154 Y139.437 E.00695
; LINE_WIDTH: 0.531775
G1 X125.224 Y139.42 E.00283
; LINE_WIDTH: 0.581765
G1 X125.293 Y139.404 E.00312
; LINE_WIDTH: 0.631755
G1 X125.362 Y139.388 E.00341
; LINE_WIDTH: 0.681745
G1 X125.431 Y139.372 E.0037
; LINE_WIDTH: 0.70688
G1 X129.212 Y139.87 E.2063
; LINE_WIDTH: 0.686678
G1 X129.27 Y139.898 E.00338
; LINE_WIDTH: 0.645994
G1 X129.328 Y139.926 E.00317
; LINE_WIDTH: 0.60531
G1 X129.386 Y139.954 E.00296
; LINE_WIDTH: 0.564626
G1 X129.444 Y139.983 E.00274
; LINE_WIDTH: 0.512419
G2 X129.585 Y140.022 I.13 J-.194 E.00572
; WIPE_START
G1 F7667.757
G1 X129.444 Y139.983 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.1 Y132.532 Z4.8 F42000
G1 X132.032 Y128.342 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.387806
G1 F4585
M204 S6000
G1 X132.014 Y128 E.00962
; LINE_WIDTH: 0.42332
G1 X131.983 Y127.596 E.01256
; LINE_WIDTH: 0.467116
G2 X131.888 Y126.735 I-19.754 J1.742 E.02994
; WIPE_START
G1 F8486.647
G1 X131.983 Y127.596 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.125 Y126.022 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4585
M204 S6000
G1 X129.98 Y117.322 E.10701
; WIPE_START
G1 F15000
G1 X130.241 Y119.305 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.531 Y116.436 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.480845
G1 F4585
M204 S6000
G1 X130.321 Y114.835 E.05761
; WIPE_START
G1 F8220.596
G1 X130.531 Y116.436 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.998 Y117.978 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4585
M204 S6000
G1 X126.143 Y126.678 E.10701
; WIPE_START
G1 F15000
G1 X125.882 Y124.695 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y117.265 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.480841
G1 F4585
M204 S6000
G1 X124.025 Y115.665 E.05759
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.674
G1 X124.236 Y117.265 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/73
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z4.8 I-1.2 J.201 P1  F42000
G1 X126.188 Y128.914 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4585
M204 S5000
G1 X126.029 Y127.704 E.03749
G1 X129.835 Y127.203 E.11796
G1 X131.501 Y126.984 E.05166
G1 X131.661 Y128.193 E.03749
G1 X126.247 Y128.906 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.029 Y127.704 E-.46416
G1 X126.8 Y127.603 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y126.59 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4585
M204 S6000
G1 X126.446 Y126.843 E.00849
G1 X125.894 Y126.916 E.01847
G1 X124.695 Y117.813 E.30457
G1 X125.247 Y117.74 E.01847
G1 X126.404 Y126.53 E.2941
; WIPE_START
G1 F8843.478
G1 X126.446 Y126.843 E-.12002
G1 X125.894 Y126.916 E-.21155
G1 X125.747 Y125.798 E-.42843
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.876 Y126.26 Z5 F42000
G1 Z4.6
G1 E.8 F1800
G1 F4585
M204 S6000
G1 X129.677 Y117.157 E.30457
G1 X130.229 Y117.084 E.01847
G1 X131.428 Y126.187 E.30457
G1 X130.935 Y126.252 E.01648
; WIPE_START
G1 F8843.478
G1 X130.661 Y124.271 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.256 Y126.874 Z5 F42000
G1 Z4.6
G1 E.8 F1800
G1 F4585
M204 S6000
G1 X126.867 Y126.925 E.01301
G1 X125.633 Y117.552 E.31361
G1 X126.89 Y117.386 E.04206
G1 X129.256 Y117.075 E.07916
G1 X130.49 Y126.448 E.31361
G1 X127.315 Y126.866 E.10622
M204 S250
G1 X127.205 Y126.485 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4585
M204 S5000
G1 X126.073 Y117.889 E.2664
G1 X126.941 Y117.775 E.02691
M73 P53 R9
G1 X128.918 Y117.515 E.06128
G1 X130.05 Y126.111 E.2664
G1 X127.264 Y126.477 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.989 Y124.496 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.543 Y127.373 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4585
M204 S6000
G1 X124.239 Y117.462 E.33158
G1 X130.58 Y116.627 E.21216
G1 X131.884 Y126.538 E.33158
G1 X125.603 Y127.365 E.21017
; WIPE_START
G1 F8843.478
G1 X125.33 Y125.383 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.883 Y133.003 Z5 F42000
G1 X124.485 Y139.788 Z5
G1 Z4.6
G1 E.8 F1800
G1 F4585
M204 S6000
G1 X125.803 Y129.77 E.33516
G1 X126.375 Y129.695 E.01912
G1 X125.176 Y138.799 E.30459
G1 X129.606 Y139.382 E.14822
G1 X130.961 Y129.091 E.3443
G1 X131.533 Y129.016 E.01912
G1 X130.018 Y140.517 E.38478
G1 X124.544 Y139.795 E.18317
M204 S10000
G1 X124.028 Y140.138 F42000
G1 F4585
M204 S6000
G1 X125.542 Y128.638 E.38478
G1 X125.756 Y128.638 E.0071
G1 X125.85 Y129.354 E.02395
G1 X126.848 Y129.222 E.03337
G1 X125.633 Y138.448 E.30868
G1 X129.256 Y138.925 E.12121
G1 X130.49 Y129.552 E.31361
G1 X128.231 Y129.254 E.07559
G1 X128.231 Y129.04 E.0071
G1 X131.979 Y128.547 E.1254
G1 X131.961 Y128.808 E.00869
G1 X130.369 Y140.973 E.40698
G1 X124.087 Y140.146 E.21017
; WIPE_START
G1 F8843.478
G1 X124.338 Y138.162 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.74 Y130.917 Z5 F42000
G1 X127.205 Y129.515 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4585
M204 S5000
G1 X130.05 Y129.889 E.08819
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.229 Y136.924 E.03676
G1 X127.197 Y129.574 E.2278
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.185 Y129.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.698 Y122.179 Z5 F42000
G1 X130.094 Y116.296 Z5
G1 Z4.6
G1 E.8 F1800
G1 F4585
M204 S5000
G1 X124.622 Y117.016 E.16961
G1 X124.462 Y115.807 E.03749
G1 X128.268 Y115.306 E.11796
G1 X129.935 Y115.086 E.05166
G1 X130.086 Y116.236 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.107 Y116.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.688 Y124.019 Z5 F42000
G1 X123.614 Y140.277 Z5
G1 Z4.6
G1 E.8 F1800
G1 F4585
M204 S5000
G1 X125.188 Y128.32 E.37058
G2 X125.188 Y127.678 I-3.609 J-.32 E.01977
G1 X123.614 Y115.72 E.3706
G3 X123.772 Y115.5 I.192 J-.028 E.0092
G1 X130.509 Y114.613 E.20882
G3 X130.582 Y114.615 I.03 J.214 E.00225
G3 X130.732 Y114.783 I-.045 J.191 E.00737
G1 X132.306 Y126.736 E.37046
G3 X132.306 Y129.264 I-10.793 J1.264 E.07785
G1 X130.733 Y141.215 E.37038
G3 X130.51 Y141.387 I-.193 J-.019 E.00968
G1 X123.724 Y140.486 E.21035
G3 X123.615 Y140.338 I.087 J-.18 E.00587
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.874 Y138.355 E-.76
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


G1 X124.874 Y138.964 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192595
G1 F4585
M204 S6000
G1 X126.062 Y129.942 E.11099
; WIPE_START
G1 F15000
G1 X125.801 Y131.925 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.055 Y129.147 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.410072
G1 F4585
M204 S6000
G1 X127.382 Y129.147 E.00976
; LINE_WIDTH: 0.458943
G1 X127.708 Y129.147 E.01106
; LINE_WIDTH: 0.507814
G1 X128.034 Y129.147 E.01236
; WIPE_START
G1 F7743.713
G1 X127.708 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.156 Y129.147 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.119094
M73 P53 R8
G1 F4585
M204 S6000
G1 X129.355 Y129.147 E.00124
; LINE_WIDTH: 0.163435
G1 X129.554 Y129.147 E.00195
; LINE_WIDTH: 0.207776
G1 X129.753 Y129.147 E.00267
; LINE_WIDTH: 0.252117
G1 X129.952 Y129.147 E.00339
; LINE_WIDTH: 0.296457
G1 X130.151 Y129.147 E.00411
; LINE_WIDTH: 0.340798
G1 X130.35 Y129.147 E.00483
; LINE_WIDTH: 0.385139
G1 X130.549 Y129.147 E.00555
; LINE_WIDTH: 0.42948
G1 X130.748 Y129.147 E.00627
M204 S10000
G1 X131.219 Y129.263 F42000
; LINE_WIDTH: 0.192591
G1 F4585
M204 S6000
G1 X129.856 Y139.62 E.12741
M204 S10000
G1 X124.971 Y139.414 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.505
G1 F4585
M204 S6000
G1 X125.154 Y139.437 E.00695
; LINE_WIDTH: 0.531753
G1 X125.224 Y139.42 E.00283
; LINE_WIDTH: 0.581738
G1 X125.293 Y139.404 E.00312
; LINE_WIDTH: 0.631723
G1 X125.362 Y139.388 E.00341
; LINE_WIDTH: 0.681708
G1 X125.431 Y139.372 E.0037
; LINE_WIDTH: 0.70686
G1 X129.212 Y139.87 E.20629
; LINE_WIDTH: 0.686678
G1 X129.27 Y139.898 E.00338
; LINE_WIDTH: 0.645994
G1 X129.328 Y139.926 E.00317
; LINE_WIDTH: 0.60531
G1 X129.386 Y139.954 E.00296
; LINE_WIDTH: 0.564626
G1 X129.444 Y139.983 E.00274
; LINE_WIDTH: 0.512419
G2 X129.585 Y140.022 I.13 J-.194 E.00572
; WIPE_START
G1 F7667.757
G1 X129.444 Y139.983 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.1 Y132.532 Z5 F42000
G1 X132.032 Y128.342 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.387806
G1 F4585
M204 S6000
G1 X132.014 Y128 E.00962
; LINE_WIDTH: 0.423321
G1 X131.983 Y127.596 E.01256
; LINE_WIDTH: 0.467121
G2 X131.888 Y126.735 I-19.763 J1.743 E.02994
; WIPE_START
G1 F8486.545
G1 X131.983 Y127.596 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.125 Y126.022 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4585
M204 S6000
G1 X129.98 Y117.322 E.10701
; WIPE_START
G1 F15000
G1 X130.241 Y119.305 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.531 Y116.436 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.480855
G1 F4585
M204 S6000
G1 X130.321 Y114.835 E.05761
; WIPE_START
G1 F8220.409
G1 X130.531 Y116.436 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.998 Y117.978 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4585
M204 S6000
G1 X126.143 Y126.678 E.10701
; WIPE_START
G1 F15000
G1 X125.882 Y124.695 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y117.265 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.480841
G1 F4585
M204 S6000
G1 X124.025 Y115.665 E.05759
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.672
G1 X124.236 Y117.265 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/73
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z5 I-1.2 J.201 P1  F42000
G1 X126.188 Y128.914 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4585
M204 S5000
G1 X126.029 Y127.704 E.03749
G1 X130.029 Y127.177 E.12398
G1 X131.501 Y126.984 E.04563
G1 X131.661 Y128.193 E.03749
G1 X126.247 Y128.906 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.029 Y127.704 E-.46416
G1 X126.8 Y127.603 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y126.59 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4585
M204 S6000
G1 X126.446 Y126.843 E.00849
G1 X125.894 Y126.916 E.01847
G1 X124.695 Y117.813 E.30457
G1 X125.247 Y117.74 E.01847
G1 X126.404 Y126.53 E.2941
; WIPE_START
G1 F8843.478
G1 X126.446 Y126.843 E-.12002
G1 X125.894 Y126.916 E-.21155
G1 X125.747 Y125.798 E-.42843
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.876 Y126.26 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F4585
M204 S6000
G1 X129.677 Y117.157 E.30457
G1 X130.229 Y117.084 E.01847
G1 X131.428 Y126.187 E.30457
G1 X130.935 Y126.252 E.01648
; WIPE_START
G1 F8843.478
G1 X130.661 Y124.271 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.816 Y126.536 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F4585
M204 S6000
G1 X125.633 Y117.552 E.3006
G1 X126.943 Y117.379 E.04382
G1 X129.256 Y117.075 E.07739
G1 X130.49 Y126.448 E.31361
G1 X126.867 Y126.925 E.12121
G1 X126.824 Y126.596 E.01102
M204 S250
G1 X127.205 Y126.485 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4585
M204 S5000
G1 X126.073 Y117.889 E.2664
G1 X126.994 Y117.768 E.02855
G1 X128.918 Y117.515 E.05964
G1 X130.05 Y126.111 E.2664
G1 X127.264 Y126.477 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.989 Y124.496 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.543 Y127.373 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4585
M204 S6000
G1 X124.239 Y117.462 E.33158
G1 X130.58 Y116.627 E.21216
G1 X131.884 Y126.538 E.33158
G1 X125.603 Y127.365 E.21017
; WIPE_START
G1 F8843.478
G1 X125.33 Y125.383 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.883 Y133.003 Z5.2 F42000
G1 X124.485 Y139.788 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F4585
M204 S6000
G1 X125.803 Y129.77 E.33516
G1 X126.375 Y129.695 E.01912
M73 P54 R8
G1 X125.176 Y138.799 E.30459
G1 X129.606 Y139.382 E.14822
G1 X130.961 Y129.091 E.3443
G1 X131.533 Y129.016 E.01912
G1 X130.018 Y140.517 E.38478
G1 X124.544 Y139.795 E.18317
M204 S10000
G1 X124.028 Y140.138 F42000
G1 F4585
M204 S6000
G1 X125.542 Y128.638 E.38478
G1 X125.756 Y128.638 E.0071
G1 X125.85 Y129.354 E.02395
G1 X126.848 Y129.222 E.03337
G1 X125.633 Y138.448 E.30868
G1 X129.256 Y138.925 E.12121
G1 X130.49 Y129.552 E.31361
G1 X128.231 Y129.254 E.07559
G1 X128.231 Y129.04 E.0071
G1 X131.979 Y128.547 E.1254
G1 X131.961 Y128.808 E.00869
G1 X130.369 Y140.973 E.40698
G1 X124.087 Y140.146 E.21017
; WIPE_START
G1 F8843.478
G1 X124.338 Y138.162 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.74 Y130.917 Z5.2 F42000
G1 X127.205 Y129.515 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4585
M204 S5000
G1 X130.05 Y129.889 E.08819
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.252 Y136.747 E.04227
G1 X127.197 Y129.574 E.22229
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.185 Y129.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.698 Y122.179 Z5.2 F42000
G1 X130.094 Y116.296 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F4585
M204 S5000
G1 X124.622 Y117.016 E.16961
G1 X124.462 Y115.807 E.03749
G1 X128.463 Y115.28 E.12398
G1 X129.935 Y115.086 E.04563
G1 X130.086 Y116.236 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.106 Y116.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.688 Y124.019 Z5.2 F42000
G1 X123.614 Y140.277 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F4585
M204 S5000
G1 X125.188 Y128.32 E.37059
G2 X125.188 Y127.679 I-3.154 J-.32 E.01973
G1 X123.614 Y115.72 E.37063
G3 X123.772 Y115.5 I.19 J-.03 E.00925
G1 X130.51 Y114.613 E.20881
G3 X130.582 Y114.615 I.029 J.214 E.00224
G3 X130.732 Y114.784 I-.045 J.191 E.0074
G1 X132.306 Y126.736 E.37043
G3 X132.306 Y129.264 I-10.793 J1.264 E.07785
G1 X130.732 Y141.216 E.37043
G3 X130.511 Y141.387 I-.192 J-.019 E.00964
G1 X123.77 Y140.499 E.20892
G3 X123.614 Y140.338 I.037 J-.191 E.00734
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.874 Y138.355 E-.76
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


G1 X124.874 Y138.964 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192595
G1 F4585
M204 S6000
G1 X126.062 Y129.942 E.11099
; WIPE_START
G1 F15000
G1 X125.801 Y131.925 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.055 Y129.147 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.410072
G1 F4585
M204 S6000
G1 X127.382 Y129.147 E.00976
; LINE_WIDTH: 0.458943
G1 X127.708 Y129.147 E.01106
; LINE_WIDTH: 0.507814
G1 X128.034 Y129.147 E.01236
; WIPE_START
G1 F7743.713
G1 X127.708 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.156 Y129.147 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.119094
G1 F4585
M204 S6000
G1 X129.355 Y129.147 E.00124
; LINE_WIDTH: 0.163435
G1 X129.554 Y129.147 E.00195
; LINE_WIDTH: 0.207776
G1 X129.753 Y129.147 E.00267
; LINE_WIDTH: 0.252117
G1 X129.952 Y129.147 E.00339
; LINE_WIDTH: 0.296457
G1 X130.151 Y129.147 E.00411
; LINE_WIDTH: 0.340798
G1 X130.35 Y129.147 E.00483
; LINE_WIDTH: 0.385139
G1 X130.549 Y129.147 E.00555
; LINE_WIDTH: 0.42948
G1 X130.748 Y129.147 E.00627
M204 S10000
G1 X131.219 Y129.263 F42000
; LINE_WIDTH: 0.192601
G1 F4585
M204 S6000
G1 X129.856 Y139.62 E.12742
M204 S10000
G1 X124.971 Y139.414 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50504
G1 F4585
M204 S6000
G1 X125.154 Y139.437 E.00695
; LINE_WIDTH: 0.531793
G1 X125.224 Y139.42 E.00283
; LINE_WIDTH: 0.581778
G1 X125.293 Y139.404 E.00312
; LINE_WIDTH: 0.631763
G1 X125.362 Y139.388 E.00341
; LINE_WIDTH: 0.681748
G1 X125.431 Y139.372 E.0037
; LINE_WIDTH: 0.70689
G1 X129.212 Y139.87 E.2063
; LINE_WIDTH: 0.686698
G1 X129.27 Y139.898 E.00338
; LINE_WIDTH: 0.646014
G1 X129.328 Y139.926 E.00317
; LINE_WIDTH: 0.60533
G1 X129.386 Y139.955 E.00296
; LINE_WIDTH: 0.564646
G1 X129.444 Y139.983 E.00274
; LINE_WIDTH: 0.512433
G2 X129.585 Y140.022 I.13 J-.194 E.00572
; WIPE_START
G1 F7667.522
G1 X129.444 Y139.983 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.1 Y132.532 Z5.2 F42000
G1 X132.032 Y128.342 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.387824
G1 F4585
M204 S6000
G1 X132.014 Y128 E.00962
; LINE_WIDTH: 0.423324
G1 X131.983 Y127.596 E.01256
; LINE_WIDTH: 0.467121
G2 X131.888 Y126.735 I-19.766 J1.743 E.02994
; WIPE_START
G1 F8486.541
G1 X131.983 Y127.596 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.125 Y126.022 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4585
M204 S6000
G1 X129.98 Y117.322 E.10701
; WIPE_START
G1 F15000
G1 X130.241 Y119.305 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.531 Y116.436 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.480845
G1 F4585
M204 S6000
G1 X130.321 Y114.835 E.05761
; WIPE_START
G1 F8220.599
G1 X130.531 Y116.436 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.998 Y117.978 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4585
M204 S6000
G1 X126.143 Y126.678 E.10701
; WIPE_START
G1 F15000
G1 X125.882 Y124.695 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y117.265 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.48084
G1 F4585
M204 S6000
G1 X124.025 Y115.665 E.05759
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.679
G1 X124.236 Y117.265 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/73
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z5.2 I-1.2 J.201 P1  F42000
G1 X126.188 Y128.914 Z5.2
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4584
M204 S5000
G1 X126.029 Y127.704 E.03749
G1 X130.224 Y127.152 E.13001
G1 X131.501 Y126.984 E.0396
G1 X131.661 Y128.193 E.03749
G1 X126.247 Y128.906 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.029 Y127.704 E-.46416
G1 X126.8 Y127.603 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y126.59 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4584
M204 S6000
G1 X126.446 Y126.843 E.00849
G1 X125.894 Y126.916 E.01847
G1 X124.695 Y117.813 E.30457
G1 X125.247 Y117.74 E.01847
G1 X126.404 Y126.53 E.2941
; WIPE_START
G1 F8843.478
G1 X126.446 Y126.843 E-.12002
G1 X125.894 Y126.916 E-.21155
G1 X125.747 Y125.798 E-.42843
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.876 Y126.26 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F4584
M204 S6000
G1 X129.677 Y117.157 E.30457
G1 X130.229 Y117.084 E.01847
G1 X131.428 Y126.187 E.30457
G1 X130.935 Y126.252 E.01648
; WIPE_START
G1 F8843.478
G1 X130.661 Y124.271 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.816 Y126.536 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F4584
M204 S6000
G1 X125.633 Y117.552 E.3006
G1 X126.996 Y117.372 E.04559
G1 X129.256 Y117.075 E.07563
G1 X130.49 Y126.448 E.31361
G1 X126.867 Y126.925 E.12121
G1 X126.824 Y126.596 E.01102
M204 S250
G1 X127.205 Y126.485 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4584
M204 S5000
G1 X126.073 Y117.889 E.2664
G1 X127.047 Y117.761 E.03018
G1 X128.918 Y117.515 E.058
G1 X130.05 Y126.111 E.2664
G1 X127.264 Y126.477 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.989 Y124.496 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.543 Y127.373 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4584
M204 S6000
G1 X124.239 Y117.462 E.33158
G1 X130.58 Y116.627 E.21216
G1 X131.884 Y126.538 E.33158
G1 X125.603 Y127.365 E.21017
; WIPE_START
G1 F8843.478
G1 X125.33 Y125.383 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.883 Y133.003 Z5.4 F42000
G1 X124.485 Y139.788 Z5.4
G1 Z5
G1 E.8 F1800
G1 F4584
M204 S6000
G1 X125.803 Y129.77 E.33516
G1 X126.375 Y129.695 E.01912
G1 X125.176 Y138.799 E.30458
G1 X129.606 Y139.382 E.14822
G1 X130.961 Y129.091 E.3443
G1 X131.533 Y129.016 E.01912
G1 X130.018 Y140.517 E.38478
G1 X124.544 Y139.795 E.18317
M204 S10000
G1 X124.028 Y140.138 F42000
G1 F4584
M204 S6000
G1 X125.542 Y128.638 E.38478
G1 X125.756 Y128.638 E.0071
G1 X125.85 Y129.354 E.02395
G1 X126.848 Y129.222 E.03337
G1 X125.633 Y138.448 E.30868
G1 X129.256 Y138.925 E.12121
G1 X130.49 Y129.552 E.31361
G1 X128.231 Y129.254 E.07559
G1 X128.231 Y129.04 E.0071
G1 X131.979 Y128.547 E.1254
G1 X131.961 Y128.808 E.00869
G1 X130.369 Y140.973 E.40698
G1 X124.087 Y140.146 E.21017
; WIPE_START
G1 F8843.478
G1 X124.338 Y138.162 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P55 R8
G1 X126.74 Y130.917 Z5.4 F42000
G1 X127.205 Y129.515 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4584
M204 S5000
G1 X130.05 Y129.889 E.08819
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.276 Y136.569 E.04778
G1 X127.197 Y129.574 E.21678
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.185 Y129.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.698 Y122.179 Z5.4 F42000
G1 X130.094 Y116.296 Z5.4
G1 Z5
G1 E.8 F1800
G1 F4584
M204 S5000
G1 X124.622 Y117.016 E.16961
G1 X124.462 Y115.807 E.03749
G1 X128.657 Y115.255 E.13001
G1 X129.935 Y115.086 E.0396
G1 X130.086 Y116.236 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.107 Y116.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.688 Y124.019 Z5.4 F42000
G1 X123.614 Y140.278 Z5.4
G1 Z5
G1 E.8 F1800
G1 F4584
M204 S5000
G1 X125.188 Y128.322 E.37053
G2 X125.188 Y127.68 I-3.323 J-.323 E.01976
G1 X123.614 Y115.72 E.37068
G3 X123.771 Y115.5 I.191 J-.029 E.0092
G1 X130.51 Y114.613 E.20883
G3 X130.582 Y114.615 I.029 J.214 E.00224
G3 X130.732 Y114.784 I-.045 J.191 E.0074
G1 X132.306 Y126.736 E.37043
G3 X132.306 Y129.264 I-9.873 J1.264 E.07789
G1 X130.732 Y141.216 E.37042
G3 X130.51 Y141.387 I-.194 J-.021 E.00962
G1 X123.77 Y140.499 E.20891
G3 X123.614 Y140.338 I.039 J-.193 E.00732
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.874 Y138.355 E-.76
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


G1 X124.874 Y138.964 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192589
G1 F4584
M204 S6000
G1 X126.062 Y129.942 E.11099
; WIPE_START
G1 F15000
G1 X125.801 Y131.925 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.055 Y129.147 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.410074
G1 F4584
M204 S6000
G1 X127.382 Y129.147 E.00976
; LINE_WIDTH: 0.458945
G1 X127.708 Y129.147 E.01106
; LINE_WIDTH: 0.507815
G1 X128.034 Y129.147 E.01236
; WIPE_START
G1 F7743.687
G1 X127.708 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.156 Y129.147 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.119094
G1 F4584
M204 S6000
G1 X129.355 Y129.147 E.00124
; LINE_WIDTH: 0.163434
G1 X129.554 Y129.147 E.00195
; LINE_WIDTH: 0.207775
G1 X129.753 Y129.147 E.00267
; LINE_WIDTH: 0.252116
G1 X129.952 Y129.147 E.00339
; LINE_WIDTH: 0.296456
G1 X130.151 Y129.147 E.00411
; LINE_WIDTH: 0.340797
G1 X130.35 Y129.147 E.00483
; LINE_WIDTH: 0.385138
G1 X130.549 Y129.147 E.00555
; LINE_WIDTH: 0.429478
G1 X130.748 Y129.147 E.00627
M204 S10000
G1 X131.219 Y129.263 F42000
; LINE_WIDTH: 0.192591
G1 F4584
M204 S6000
G1 X129.856 Y139.62 E.12741
M204 S10000
G1 X124.971 Y139.414 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50502
G1 F4584
M204 S6000
G1 X125.154 Y139.437 E.00695
; LINE_WIDTH: 0.531775
G1 X125.224 Y139.42 E.00283
; LINE_WIDTH: 0.581765
G1 X125.293 Y139.404 E.00312
; LINE_WIDTH: 0.631755
G1 X125.362 Y139.388 E.00341
; LINE_WIDTH: 0.681745
G1 X125.431 Y139.372 E.0037
; LINE_WIDTH: 0.70688
G1 X129.212 Y139.87 E.2063
; LINE_WIDTH: 0.686678
G1 X129.27 Y139.898 E.00338
; LINE_WIDTH: 0.645994
G1 X129.328 Y139.926 E.00317
; LINE_WIDTH: 0.60531
G1 X129.386 Y139.954 E.00296
; LINE_WIDTH: 0.564626
G1 X129.444 Y139.983 E.00274
; LINE_WIDTH: 0.512419
G2 X129.585 Y140.022 I.13 J-.194 E.00572
; WIPE_START
G1 F7667.757
G1 X129.444 Y139.983 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.1 Y132.532 Z5.4 F42000
G1 X132.032 Y128.342 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.387806
G1 F4584
M204 S6000
G1 X132.014 Y128 E.00962
; LINE_WIDTH: 0.42332
G1 X131.983 Y127.596 E.01256
; LINE_WIDTH: 0.467125
G2 X131.888 Y126.735 I-19.753 J1.742 E.02994
; WIPE_START
G1 F8486.461
G1 X131.983 Y127.596 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.125 Y126.022 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4584
M204 S6000
G1 X129.98 Y117.322 E.10701
; WIPE_START
G1 F15000
G1 X130.241 Y119.305 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.531 Y116.436 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.480842
G1 F4584
M204 S6000
G1 X130.321 Y114.835 E.05761
; WIPE_START
G1 F8220.65
G1 X130.531 Y116.436 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.998 Y117.978 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4584
M204 S6000
G1 X126.143 Y126.678 E.10701
; WIPE_START
G1 F15000
G1 X125.882 Y124.695 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y117.265 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.480852
G1 F4584
M204 S6000
G1 X124.025 Y115.665 E.05759
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.469
G1 X124.236 Y117.265 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/73
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z5.4 I-1.2 J.201 P1  F42000
G1 X126.188 Y128.914 Z5.4
G1 Z5.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4585
M204 S5000
G1 X126.029 Y127.704 E.03749
G1 X130.418 Y127.126 E.13604
G1 X131.501 Y126.984 E.03358
G1 X131.661 Y128.193 E.03749
G1 X126.247 Y128.906 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.029 Y127.704 E-.46416
G1 X126.8 Y127.603 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y126.59 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4585
M204 S6000
G1 X126.446 Y126.843 E.00849
G1 X125.894 Y126.916 E.01847
G1 X124.695 Y117.813 E.30457
G1 X125.247 Y117.74 E.01847
G1 X126.404 Y126.53 E.2941
; WIPE_START
G1 F8843.478
G1 X126.446 Y126.843 E-.12002
G1 X125.894 Y126.916 E-.21155
G1 X125.747 Y125.798 E-.42843
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.876 Y126.26 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F4585
M204 S6000
G1 X129.677 Y117.157 E.30457
G1 X130.229 Y117.084 E.01847
G1 X131.428 Y126.187 E.30457
G1 X130.935 Y126.252 E.01648
; WIPE_START
G1 F8843.478
G1 X130.661 Y124.271 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.256 Y126.874 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F4585
M204 S6000
G1 X126.867 Y126.925 E.01301
G1 X125.633 Y117.552 E.31361
G1 X127.048 Y117.366 E.04736
G1 X129.256 Y117.075 E.07386
G1 X130.49 Y126.448 E.31361
G1 X127.315 Y126.866 E.10622
M204 S250
G1 X127.205 Y126.485 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4585
M204 S5000
G1 X126.073 Y117.889 E.2664
G1 X127.1 Y117.754 E.03182
G1 X128.918 Y117.515 E.05637
G1 X130.05 Y126.111 E.2664
G1 X127.264 Y126.477 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.989 Y124.496 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.543 Y127.373 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4585
M204 S6000
G1 X124.239 Y117.462 E.33158
G1 X130.58 Y116.627 E.21216
G1 X131.884 Y126.538 E.33158
G1 X125.603 Y127.365 E.21017
; WIPE_START
G1 F8843.478
G1 X125.33 Y125.383 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.883 Y133.003 Z5.6 F42000
G1 X124.485 Y139.788 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F4585
M204 S6000
G1 X125.803 Y129.77 E.33516
G1 X126.375 Y129.695 E.01912
G1 X125.176 Y138.799 E.30459
G1 X129.606 Y139.382 E.14822
G1 X130.961 Y129.091 E.3443
G1 X131.533 Y129.016 E.01912
G1 X130.018 Y140.517 E.38478
G1 X124.544 Y139.795 E.18317
M204 S10000
G1 X124.028 Y140.138 F42000
G1 F4585
M204 S6000
G1 X125.542 Y128.638 E.38478
G1 X125.756 Y128.638 E.0071
G1 X125.85 Y129.354 E.02395
G1 X126.848 Y129.222 E.03337
G1 X125.633 Y138.448 E.30868
G1 X129.256 Y138.925 E.12121
G1 X130.49 Y129.552 E.31361
G1 X128.231 Y129.254 E.07559
G1 X128.231 Y129.04 E.0071
G1 X131.979 Y128.547 E.1254
G1 X131.961 Y128.808 E.00869
G1 X130.369 Y140.973 E.40698
G1 X124.087 Y140.146 E.21017
; WIPE_START
G1 F8843.478
G1 X124.338 Y138.162 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.74 Y130.917 Z5.6 F42000
G1 X127.205 Y129.515 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4585
M204 S5000
G1 X130.05 Y129.889 E.08819
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.299 Y136.391 E.0533
G1 X127.197 Y129.574 E.21127
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.185 Y129.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.698 Y122.179 Z5.6 F42000
G1 X130.094 Y116.296 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F4585
M204 S5000
G1 X124.622 Y117.016 E.16961
M73 P56 R8
G1 X124.462 Y115.807 E.03749
G1 X128.852 Y115.229 E.13604
G1 X129.935 Y115.086 E.03358
G1 X130.086 Y116.236 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.106 Y116.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.688 Y124.019 Z5.6 F42000
G1 X123.614 Y140.278 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F4585
M204 S5000
G1 X125.188 Y128.322 E.37053
G2 X125.188 Y127.678 I-4.385 J-.322 E.01982
G1 X123.614 Y115.72 E.3706
G3 X123.77 Y115.501 I.19 J-.03 E.00916
G1 X130.509 Y114.613 E.20888
G3 X130.582 Y114.615 I.03 J.214 E.00225
G3 X130.732 Y114.784 I-.041 J.188 E.00743
G1 X132.306 Y126.736 E.37042
G3 X132.306 Y129.264 I-9.872 J1.264 E.07789
G1 X130.732 Y141.216 E.37042
G3 X130.51 Y141.387 I-.193 J-.02 E.00964
G1 X123.77 Y140.499 E.20891
G3 X123.614 Y140.338 I.037 J-.191 E.00734
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.874 Y138.355 E-.76
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


G1 X124.874 Y138.964 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192584
G1 F4585
M204 S6000
G1 X126.062 Y129.942 E.11098
; WIPE_START
G1 F15000
G1 X125.801 Y131.925 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.055 Y129.147 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.410076
G1 F4585
M204 S6000
G1 X127.382 Y129.147 E.00976
; LINE_WIDTH: 0.458947
G1 X127.708 Y129.147 E.01106
; LINE_WIDTH: 0.507818
G1 X128.034 Y129.147 E.01236
; WIPE_START
G1 F7743.648
G1 X127.708 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.156 Y129.147 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.119094
G1 F4585
M204 S6000
G1 X129.355 Y129.147 E.00124
; LINE_WIDTH: 0.163435
G1 X129.554 Y129.147 E.00195
; LINE_WIDTH: 0.207776
G1 X129.753 Y129.147 E.00267
; LINE_WIDTH: 0.252116
G1 X129.952 Y129.147 E.00339
; LINE_WIDTH: 0.296457
G1 X130.151 Y129.147 E.00411
; LINE_WIDTH: 0.340798
G1 X130.35 Y129.147 E.00483
; LINE_WIDTH: 0.385139
G1 X130.549 Y129.147 E.00555
; LINE_WIDTH: 0.429479
G1 X130.748 Y129.147 E.00627
M204 S10000
G1 X131.219 Y129.263 F42000
; LINE_WIDTH: 0.192591
G1 F4585
M204 S6000
G1 X129.856 Y139.62 E.12741
M204 S10000
G1 X124.971 Y139.414 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.505
G1 F4585
M204 S6000
G1 X125.154 Y139.437 E.00695
; LINE_WIDTH: 0.531753
G1 X125.224 Y139.42 E.00283
; LINE_WIDTH: 0.581738
G1 X125.293 Y139.404 E.00312
; LINE_WIDTH: 0.631723
G1 X125.362 Y139.388 E.00341
; LINE_WIDTH: 0.681708
G1 X125.431 Y139.372 E.0037
; LINE_WIDTH: 0.70686
G1 X129.212 Y139.87 E.20629
; LINE_WIDTH: 0.686678
G1 X129.27 Y139.898 E.00338
; LINE_WIDTH: 0.645994
G1 X129.328 Y139.926 E.00317
; LINE_WIDTH: 0.60531
G1 X129.386 Y139.954 E.00296
; LINE_WIDTH: 0.564626
G1 X129.444 Y139.983 E.00274
; LINE_WIDTH: 0.512419
G2 X129.585 Y140.022 I.13 J-.194 E.00572
; WIPE_START
G1 F7667.757
G1 X129.444 Y139.983 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.1 Y132.532 Z5.6 F42000
G1 X132.032 Y128.342 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.387824
G1 F4585
M204 S6000
G1 X132.014 Y128 E.00962
; LINE_WIDTH: 0.423333
G1 X131.983 Y127.596 E.01256
; LINE_WIDTH: 0.467123
G2 X131.888 Y126.735 I-19.748 J1.741 E.02994
; WIPE_START
G1 F8486.518
G1 X131.983 Y127.596 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.125 Y126.022 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4585
M204 S6000
G1 X129.98 Y117.322 E.10701
; WIPE_START
G1 F15000
G1 X130.241 Y119.305 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.531 Y116.436 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.480845
G1 F4585
M204 S6000
G1 X130.321 Y114.835 E.05761
; WIPE_START
G1 F8220.599
G1 X130.531 Y116.436 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.998 Y117.978 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4585
M204 S6000
G1 X126.143 Y126.678 E.10701
; WIPE_START
G1 F15000
G1 X125.882 Y124.695 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y117.265 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.48084
G1 F4585
M204 S6000
G1 X124.025 Y115.665 E.05759
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.679
G1 X124.236 Y117.265 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/73
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z5.6 I-1.2 J.201 P1  F42000
G1 X126.188 Y128.914 Z5.6
G1 Z5.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4585
M204 S5000
G1 X126.029 Y127.704 E.03749
G1 X130.612 Y127.101 E.14207
G1 X131.501 Y126.984 E.02755
G1 X131.661 Y128.193 E.03749
G1 X126.247 Y128.906 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.029 Y127.704 E-.46416
G1 X126.8 Y127.603 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y126.59 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4585
M204 S6000
G1 X126.446 Y126.843 E.00849
G1 X125.894 Y126.916 E.01847
G1 X124.695 Y117.813 E.30457
G1 X125.247 Y117.74 E.01847
G1 X126.404 Y126.53 E.2941
; WIPE_START
G1 F8843.478
G1 X126.446 Y126.843 E-.12002
G1 X125.894 Y126.916 E-.21155
G1 X125.747 Y125.798 E-.42843
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.876 Y126.26 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
G1 F4585
M204 S6000
G1 X129.677 Y117.157 E.30458
G1 X130.229 Y117.084 E.01847
G1 X131.428 Y126.187 E.30458
G1 X130.935 Y126.252 E.01648
; WIPE_START
G1 F8843.478
G1 X130.661 Y124.271 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.256 Y126.874 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
G1 F4585
M204 S6000
G1 X126.867 Y126.925 E.01301
G1 X125.633 Y117.552 E.31361
G1 X127.101 Y117.359 E.04912
G1 X129.256 Y117.075 E.07209
G1 X130.49 Y126.448 E.31361
G1 X127.315 Y126.866 E.10622
M204 S250
G1 X127.205 Y126.485 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4585
M204 S5000
G1 X126.073 Y117.889 E.2664
G1 X127.152 Y117.747 E.03346
G1 X128.918 Y117.515 E.05473
G1 X130.05 Y126.111 E.2664
G1 X127.264 Y126.477 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.989 Y124.496 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.543 Y127.373 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4585
M204 S6000
G1 X124.239 Y117.462 E.33158
G1 X130.58 Y116.627 E.21216
G1 X131.884 Y126.538 E.33158
G1 X125.603 Y127.365 E.21017
; WIPE_START
G1 F8843.478
G1 X125.33 Y125.383 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.883 Y133.003 Z5.8 F42000
G1 X124.485 Y139.788 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F4585
M204 S6000
G1 X125.803 Y129.77 E.33516
G1 X126.375 Y129.695 E.01912
G1 X125.176 Y138.799 E.30459
G1 X129.606 Y139.382 E.14822
G1 X130.961 Y129.091 E.3443
G1 X131.533 Y129.016 E.01912
G1 X130.018 Y140.517 E.38478
G1 X124.544 Y139.795 E.18317
M204 S10000
G1 X124.028 Y140.138 F42000
G1 F4585
M204 S6000
G1 X125.542 Y128.638 E.38478
G1 X125.756 Y128.638 E.0071
G1 X125.85 Y129.354 E.02395
G1 X126.848 Y129.222 E.03337
G1 X125.633 Y138.448 E.30868
G1 X129.256 Y138.925 E.12121
G1 X130.49 Y129.552 E.31361
G1 X128.231 Y129.254 E.07559
G1 X128.231 Y129.04 E.0071
G1 X131.979 Y128.547 E.1254
G1 X131.961 Y128.808 E.00869
G1 X130.369 Y140.973 E.40698
G1 X124.087 Y140.146 E.21017
; WIPE_START
G1 F8843.478
G1 X124.338 Y138.162 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.74 Y130.917 Z5.8 F42000
G1 X127.205 Y129.515 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4585
M204 S5000
G1 X130.05 Y129.889 E.08819
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.323 Y136.213 E.05881
G1 X127.197 Y129.574 E.20576
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.185 Y129.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.698 Y122.179 Z5.8 F42000
G1 X130.094 Y116.296 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F4585
M204 S5000
G1 X124.622 Y117.016 E.16961
G1 X124.462 Y115.807 E.03749
G1 X129.046 Y115.203 E.14207
G1 X129.935 Y115.086 E.02755
G1 X130.086 Y116.236 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.107 Y116.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.688 Y124.019 Z5.8 F42000
G1 X123.614 Y140.277 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F4585
M204 S5000
G1 X125.188 Y128.322 E.37052
G2 X125.188 Y127.678 I-4.385 J-.322 E.01982
G1 X123.614 Y115.72 E.3706
G3 X123.772 Y115.5 I.192 J-.028 E.00922
M73 P57 R8
G1 X130.509 Y114.613 E.20879
G3 X130.582 Y114.615 I.03 J.215 E.00225
G3 X130.732 Y114.784 I-.041 J.188 E.00743
G1 X132.306 Y126.736 E.37042
G3 X132.306 Y129.264 I-9.872 J1.264 E.07789
G1 X130.733 Y141.215 E.37038
G3 X130.51 Y141.387 I-.194 J-.02 E.00967
G1 X123.77 Y140.499 E.20891
G3 X123.614 Y140.338 I.037 J-.191 E.00734
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.874 Y138.355 E-.76
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


G1 X124.874 Y138.964 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192597
G1 F4585
M204 S6000
G1 X126.062 Y129.942 E.11099
; WIPE_START
G1 F15000
G1 X125.801 Y131.925 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.055 Y129.147 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.410075
G1 F4585
M204 S6000
G1 X127.382 Y129.147 E.00976
; LINE_WIDTH: 0.458947
G1 X127.708 Y129.147 E.01106
; LINE_WIDTH: 0.507818
G1 X128.034 Y129.147 E.01236
; WIPE_START
G1 F7743.638
G1 X127.708 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.156 Y129.147 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.119093
G1 F4585
M204 S6000
G1 X129.355 Y129.147 E.00124
; LINE_WIDTH: 0.163432
G1 X129.554 Y129.147 E.00195
; LINE_WIDTH: 0.20777
G1 X129.753 Y129.147 E.00267
; LINE_WIDTH: 0.252109
G1 X129.952 Y129.147 E.00339
; LINE_WIDTH: 0.296448
G1 X130.151 Y129.147 E.00411
; LINE_WIDTH: 0.340787
G1 X130.35 Y129.147 E.00483
; LINE_WIDTH: 0.385126
G1 X130.549 Y129.147 E.00555
; LINE_WIDTH: 0.429464
G1 X130.748 Y129.147 E.00627
M204 S10000
G1 X131.219 Y129.263 F42000
; LINE_WIDTH: 0.192591
G1 F4585
M204 S6000
G1 X129.856 Y139.62 E.12741
M204 S10000
G1 X124.971 Y139.414 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50502
G1 F4585
M204 S6000
G1 X125.154 Y139.437 E.00695
; LINE_WIDTH: 0.531775
G1 X125.224 Y139.42 E.00283
; LINE_WIDTH: 0.581765
G1 X125.293 Y139.404 E.00312
; LINE_WIDTH: 0.631755
G1 X125.362 Y139.388 E.00341
; LINE_WIDTH: 0.681745
G1 X125.431 Y139.372 E.0037
; LINE_WIDTH: 0.70688
G1 X129.212 Y139.87 E.2063
; LINE_WIDTH: 0.686678
G1 X129.27 Y139.898 E.00338
; LINE_WIDTH: 0.645994
G1 X129.328 Y139.926 E.00317
; LINE_WIDTH: 0.60531
G1 X129.386 Y139.954 E.00296
; LINE_WIDTH: 0.564626
G1 X129.444 Y139.983 E.00274
; LINE_WIDTH: 0.512419
G2 X129.585 Y140.022 I.13 J-.194 E.00572
; WIPE_START
G1 F7667.757
G1 X129.444 Y139.983 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.1 Y132.532 Z5.8 F42000
G1 X132.032 Y128.342 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.387806
G1 F4585
M204 S6000
G1 X132.014 Y128 E.00962
; LINE_WIDTH: 0.423321
G1 X131.983 Y127.596 E.01256
; LINE_WIDTH: 0.467126
G2 X131.888 Y126.735 I-19.768 J1.744 E.02994
; WIPE_START
G1 F8486.459
G1 X131.983 Y127.596 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.125 Y126.022 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4585
M204 S6000
G1 X129.98 Y117.322 E.10701
; WIPE_START
G1 F15000
G1 X130.241 Y119.305 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.531 Y116.436 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.480855
G1 F4585
M204 S6000
G1 X130.321 Y114.835 E.05761
; WIPE_START
G1 F8220.395
G1 X130.531 Y116.436 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.998 Y117.978 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4585
M204 S6000
G1 X126.143 Y126.678 E.10701
; WIPE_START
G1 F15000
G1 X125.882 Y124.695 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y117.265 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.480843
G1 F4585
M204 S6000
G1 X124.025 Y115.665 E.05759
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.627
G1 X124.236 Y117.265 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/73
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z5.8 I-1.2 J.201 P1  F42000
G1 X126.188 Y128.914 Z5.8
G1 Z5.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4585
M204 S5000
G1 X126.029 Y127.704 E.03749
G1 X130.807 Y127.075 E.14809
G1 X131.501 Y126.984 E.02152
G1 X131.661 Y128.193 E.03749
G1 X126.247 Y128.906 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.029 Y127.704 E-.46416
G1 X126.8 Y127.603 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y126.59 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4585
M204 S6000
G1 X126.446 Y126.843 E.00849
G1 X125.894 Y126.916 E.01847
G1 X124.695 Y117.813 E.30457
G1 X125.247 Y117.74 E.01847
G1 X126.404 Y126.53 E.2941
; WIPE_START
G1 F8843.478
G1 X126.446 Y126.843 E-.12002
G1 X125.894 Y126.916 E-.21155
G1 X125.747 Y125.798 E-.42843
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.876 Y126.26 Z6 F42000
G1 Z5.6
G1 E.8 F1800
G1 F4585
M204 S6000
G1 X129.677 Y117.157 E.30457
G1 X130.229 Y117.084 E.01847
G1 X131.428 Y126.187 E.30457
G1 X130.935 Y126.252 E.01648
; WIPE_START
G1 F8843.478
G1 X130.661 Y124.271 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.256 Y126.874 Z6 F42000
G1 Z5.6
G1 E.8 F1800
G1 F4585
M204 S6000
G1 X126.867 Y126.925 E.01301
G1 X125.633 Y117.552 E.31361
G1 X127.154 Y117.352 E.05089
G1 X129.256 Y117.075 E.07032
G1 X130.49 Y126.448 E.31361
G1 X127.315 Y126.866 E.10622
M204 S250
G1 X127.205 Y126.485 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4585
M204 S5000
G1 X126.073 Y117.889 E.2664
G1 X127.205 Y117.74 E.03509
G1 X128.918 Y117.515 E.05309
G1 X130.05 Y126.111 E.2664
G1 X127.264 Y126.477 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.989 Y124.496 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.543 Y127.373 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4585
M204 S6000
G1 X124.239 Y117.462 E.33158
G1 X130.58 Y116.627 E.21216
G1 X131.884 Y126.538 E.33158
G1 X125.603 Y127.365 E.21017
; WIPE_START
G1 F8843.478
G1 X125.33 Y125.383 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.883 Y133.003 Z6 F42000
G1 X124.485 Y139.788 Z6
G1 Z5.6
G1 E.8 F1800
G1 F4585
M204 S6000
G1 X125.803 Y129.77 E.33516
G1 X126.375 Y129.695 E.01912
G1 X125.176 Y138.799 E.30459
G1 X129.606 Y139.382 E.14822
G1 X130.961 Y129.091 E.3443
G1 X131.533 Y129.016 E.01912
G1 X130.018 Y140.517 E.38478
G1 X124.544 Y139.795 E.18317
M204 S10000
G1 X124.028 Y140.138 F42000
G1 F4585
M204 S6000
G1 X125.542 Y128.638 E.38478
G1 X125.756 Y128.638 E.0071
G1 X125.85 Y129.354 E.02395
G1 X126.848 Y129.222 E.03337
G1 X125.633 Y138.448 E.30868
G1 X129.256 Y138.925 E.12121
G1 X130.49 Y129.552 E.31361
G1 X128.231 Y129.254 E.07559
G1 X128.231 Y129.04 E.0071
G1 X131.979 Y128.547 E.1254
G1 X131.961 Y128.808 E.00869
G1 X130.369 Y140.973 E.40698
G1 X124.087 Y140.146 E.21017
; WIPE_START
G1 F8843.478
G1 X124.338 Y138.162 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.74 Y130.917 Z6 F42000
G1 X127.205 Y129.515 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4585
M204 S5000
G1 X130.05 Y129.889 E.08819
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.346 Y136.035 E.06432
G1 X127.197 Y129.574 E.20024
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.185 Y129.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.698 Y122.179 Z6 F42000
G1 X130.094 Y116.296 Z6
G1 Z5.6
G1 E.8 F1800
G1 F4585
M204 S5000
G1 X124.622 Y117.016 E.16961
G1 X124.462 Y115.807 E.03749
G1 X129.241 Y115.178 E.14809
G1 X129.935 Y115.086 E.02152
G1 X130.086 Y116.236 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.107 Y116.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.688 Y124.019 Z6 F42000
G1 X123.614 Y140.277 Z6
G1 Z5.6
G1 E.8 F1800
G1 F4585
M204 S5000
G1 X125.188 Y128.32 E.37058
G2 X125.188 Y127.678 I-3.684 J-.32 E.01977
G1 X123.614 Y115.72 E.3706
G3 X123.772 Y115.5 I.191 J-.03 E.00924
G1 X130.509 Y114.613 E.2088
G3 X130.582 Y114.615 I.03 J.214 E.00225
G3 X130.732 Y114.784 I-.043 J.19 E.00741
G1 X132.306 Y126.736 E.37042
G3 X132.306 Y129.264 I-10.795 J1.264 E.07785
G1 X130.732 Y141.216 E.37042
G3 X130.51 Y141.387 I-.194 J-.021 E.00962
G1 X123.751 Y140.495 E.20948
G3 X123.613 Y140.338 I.053 J-.186 E.0068
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.873 Y138.355 E-.76
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
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
M73 P58 R8
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


G1 X124.874 Y138.964 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192604
G1 F4585
M204 S6000
G1 X126.062 Y129.942 E.111
; WIPE_START
G1 F15000
G1 X125.801 Y131.925 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.055 Y129.147 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.410076
G1 F4585
M204 S6000
G1 X127.382 Y129.147 E.00976
; LINE_WIDTH: 0.458948
G1 X127.708 Y129.147 E.01106
; LINE_WIDTH: 0.50782
G1 X128.034 Y129.147 E.01236
; WIPE_START
G1 F7743.612
G1 X127.708 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.156 Y129.147 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.119093
G1 F4585
M204 S6000
G1 X129.355 Y129.147 E.00124
; LINE_WIDTH: 0.163432
G1 X129.554 Y129.147 E.00195
; LINE_WIDTH: 0.207771
G1 X129.753 Y129.147 E.00267
; LINE_WIDTH: 0.252109
G1 X129.952 Y129.147 E.00339
; LINE_WIDTH: 0.296448
G1 X130.151 Y129.147 E.00411
; LINE_WIDTH: 0.340787
G1 X130.35 Y129.147 E.00483
; LINE_WIDTH: 0.385126
G1 X130.549 Y129.147 E.00555
; LINE_WIDTH: 0.429465
G1 X130.748 Y129.147 E.00627
M204 S10000
G1 X131.219 Y129.263 F42000
; LINE_WIDTH: 0.192591
G1 F4585
M204 S6000
G1 X129.856 Y139.62 E.12741
M204 S10000
G1 X124.971 Y139.414 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50502
G1 F4585
M204 S6000
G1 X125.154 Y139.437 E.00695
; LINE_WIDTH: 0.531775
G1 X125.224 Y139.42 E.00283
; LINE_WIDTH: 0.581765
G1 X125.293 Y139.404 E.00312
; LINE_WIDTH: 0.631755
G1 X125.362 Y139.388 E.00341
; LINE_WIDTH: 0.681745
G1 X125.431 Y139.372 E.0037
; LINE_WIDTH: 0.70688
G1 X129.212 Y139.87 E.2063
; LINE_WIDTH: 0.686678
G1 X129.27 Y139.898 E.00338
; LINE_WIDTH: 0.645994
G1 X129.328 Y139.926 E.00317
; LINE_WIDTH: 0.60531
G1 X129.386 Y139.954 E.00296
; LINE_WIDTH: 0.564626
G1 X129.444 Y139.983 E.00274
; LINE_WIDTH: 0.512419
G2 X129.585 Y140.022 I.13 J-.194 E.00572
; WIPE_START
G1 F7667.757
G1 X129.444 Y139.983 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.1 Y132.532 Z6 F42000
G1 X132.032 Y128.342 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.387824
G1 F4585
M204 S6000
G1 X132.014 Y128 E.00962
; LINE_WIDTH: 0.423324
G1 X131.983 Y127.596 E.01256
; LINE_WIDTH: 0.467118
G2 X131.888 Y126.735 I-19.776 J1.744 E.02994
; WIPE_START
G1 F8486.61
G1 X131.983 Y127.596 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.125 Y126.022 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4585
M204 S6000
G1 X129.98 Y117.322 E.10701
; WIPE_START
G1 F15000
G1 X130.241 Y119.305 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.531 Y116.436 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.480855
G1 F4585
M204 S6000
G1 X130.321 Y114.835 E.05761
; WIPE_START
G1 F8220.402
G1 X130.531 Y116.436 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.998 Y117.978 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.192587
G1 F4585
M204 S6000
G1 X126.143 Y126.678 E.10702
; WIPE_START
G1 F15000
G1 X125.882 Y124.695 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y117.265 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.480852
G1 F4585
M204 S6000
G1 X124.025 Y115.665 E.05759
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.462
G1 X124.236 Y117.265 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/73
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z6 I-1.2 J.201 P1  F42000
G1 X126.188 Y128.914 Z6
G1 Z5.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4584
M204 S5000
G1 X126.029 Y127.704 E.03749
G1 X131.001 Y127.049 E.15412
G1 X131.501 Y126.984 E.01549
G1 X131.661 Y128.193 E.03749
G1 X126.247 Y128.906 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.029 Y127.704 E-.46415
G1 X126.8 Y127.603 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y126.59 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4584
M204 S6000
G1 X126.446 Y126.843 E.00849
G1 X125.894 Y126.916 E.01847
G1 X124.695 Y117.813 E.30458
G1 X125.247 Y117.74 E.01847
G1 X126.404 Y126.53 E.2941
; WIPE_START
G1 F8843.478
G1 X126.446 Y126.843 E-.12003
G1 X125.894 Y126.916 E-.21155
G1 X125.747 Y125.798 E-.42842
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.876 Y126.26 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
G1 F4584
M204 S6000
G1 X129.677 Y117.157 E.30457
G1 X130.229 Y117.084 E.01847
G1 X131.428 Y126.187 E.30457
G1 X130.935 Y126.252 E.01648
; WIPE_START
G1 F8843.478
G1 X130.661 Y124.271 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.816 Y126.536 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
G1 F4584
M204 S6000
G1 X125.633 Y117.552 E.3006
G1 X127.207 Y117.345 E.05266
G1 X129.256 Y117.075 E.06856
G1 X130.49 Y126.448 E.31361
G1 X126.867 Y126.925 E.12121
G1 X126.824 Y126.596 E.01102
M204 S250
G1 X127.205 Y126.485 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4584
M204 S5000
G1 X126.073 Y117.889 E.2664
G1 X127.258 Y117.733 E.03673
G1 X128.918 Y117.515 E.05146
G1 X130.05 Y126.111 E.2664
M73 P58 R7
G1 X127.264 Y126.477 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.989 Y124.496 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.543 Y127.373 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4584
M204 S6000
G1 X124.239 Y117.462 E.33158
G1 X130.58 Y116.627 E.21216
G1 X131.884 Y126.538 E.33158
G1 X125.603 Y127.365 E.21017
; WIPE_START
G1 F8843.478
G1 X125.33 Y125.383 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.883 Y133.003 Z6.2 F42000
G1 X124.485 Y139.788 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F4584
M204 S6000
G1 X125.803 Y129.77 E.33516
G1 X126.375 Y129.695 E.01912
G1 X125.176 Y138.799 E.30458
G1 X129.606 Y139.382 E.14822
G1 X130.961 Y129.091 E.3443
G1 X131.533 Y129.016 E.01912
G1 X130.018 Y140.517 E.38478
G1 X124.544 Y139.795 E.18317
M204 S10000
G1 X124.028 Y140.138 F42000
G1 F4584
M204 S6000
G1 X125.542 Y128.638 E.38478
G1 X125.756 Y128.638 E.0071
G1 X125.85 Y129.354 E.02395
G1 X126.848 Y129.222 E.03337
G1 X125.633 Y138.448 E.30868
G1 X129.256 Y138.925 E.12121
G1 X130.49 Y129.552 E.31361
G1 X128.231 Y129.254 E.07559
G1 X128.231 Y129.04 E.0071
G1 X131.979 Y128.547 E.1254
G1 X131.961 Y128.808 E.00869
G1 X130.369 Y140.973 E.40698
G1 X124.087 Y140.146 E.21017
; WIPE_START
G1 F8843.478
G1 X124.338 Y138.162 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.74 Y130.917 Z6.2 F42000
G1 X127.205 Y129.515 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4584
M204 S5000
G1 X130.05 Y129.889 E.08819
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.37 Y135.858 E.06983
G1 X127.197 Y129.574 E.19473
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.185 Y129.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.698 Y122.179 Z6.2 F42000
G1 X130.094 Y116.296 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F4584
M204 S5000
G1 X124.622 Y117.016 E.16961
G1 X124.462 Y115.807 E.03749
G1 X129.435 Y115.152 E.15412
G1 X129.935 Y115.086 E.01549
G1 X130.086 Y116.236 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.107 Y116.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.688 Y124.019 Z6.2 F42000
G1 X123.614 Y140.277 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F4584
M204 S5000
G1 X125.188 Y128.322 E.37052
G2 X125.188 Y127.68 I-3.322 J-.323 E.01976
G1 X123.614 Y115.72 E.37068
G3 X123.772 Y115.5 I.19 J-.03 E.00924
G1 X130.509 Y114.613 E.2088
G3 X130.582 Y114.615 I.03 J.214 E.00224
G3 X130.732 Y114.784 I-.043 J.19 E.00742
G1 X132.306 Y126.736 E.37042
G3 X132.306 Y129.264 I-10.793 J1.264 E.07785
G1 X130.732 Y141.216 E.37042
G3 X130.51 Y141.387 I-.194 J-.021 E.00963
G1 X123.77 Y140.499 E.20891
G3 X123.614 Y140.338 I.038 J-.192 E.00734
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.874 Y138.355 E-.76
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


G1 X124.874 Y138.964 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192589
G1 F4584
M204 S6000
G1 X126.062 Y129.942 E.11099
; WIPE_START
G1 F15000
G1 X125.801 Y131.925 E-.76
; WIPE_END
M73 P59 R7
G1 E-.04 F1800
M204 S10000
G1 X127.055 Y129.147 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.410078
G1 F4584
M204 S6000
G1 X127.382 Y129.147 E.00976
; LINE_WIDTH: 0.458949
G1 X127.708 Y129.147 E.01106
; LINE_WIDTH: 0.507821
G1 X128.034 Y129.147 E.01236
; WIPE_START
G1 F7743.595
G1 X127.708 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.156 Y129.147 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.119095
G1 F4584
M204 S6000
G1 X129.355 Y129.147 E.00124
; LINE_WIDTH: 0.163435
G1 X129.554 Y129.147 E.00195
; LINE_WIDTH: 0.207776
G1 X129.753 Y129.147 E.00267
; LINE_WIDTH: 0.252117
G1 X129.952 Y129.147 E.00339
; LINE_WIDTH: 0.296458
G1 X130.151 Y129.147 E.00411
; LINE_WIDTH: 0.340799
G1 X130.35 Y129.147 E.00483
; LINE_WIDTH: 0.38514
G1 X130.549 Y129.147 E.00555
; LINE_WIDTH: 0.429481
G1 X130.748 Y129.147 E.00627
M204 S10000
G1 X131.219 Y129.263 F42000
; LINE_WIDTH: 0.192591
G1 F4584
M204 S6000
G1 X129.856 Y139.62 E.12741
M204 S10000
G1 X124.971 Y139.414 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50504
G1 F4584
M204 S6000
G1 X125.154 Y139.437 E.00695
; LINE_WIDTH: 0.531793
G1 X125.224 Y139.42 E.00283
; LINE_WIDTH: 0.581778
G1 X125.293 Y139.404 E.00312
; LINE_WIDTH: 0.631763
G1 X125.362 Y139.388 E.00341
; LINE_WIDTH: 0.681748
G1 X125.431 Y139.372 E.0037
; LINE_WIDTH: 0.70688
G1 X129.212 Y139.87 E.2063
; LINE_WIDTH: 0.68668
G1 X129.27 Y139.898 E.00338
; LINE_WIDTH: 0.646
G1 X129.328 Y139.926 E.00317
; LINE_WIDTH: 0.60532
G1 X129.386 Y139.954 E.00296
; LINE_WIDTH: 0.56464
G1 X129.444 Y139.983 E.00274
; LINE_WIDTH: 0.512432
G2 X129.585 Y140.022 I.13 J-.194 E.00572
; WIPE_START
G1 F7667.535
G1 X129.444 Y139.983 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.1 Y132.532 Z6.2 F42000
G1 X132.032 Y128.342 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.387809
G1 F4584
M204 S6000
G1 X132.014 Y128 E.00962
; LINE_WIDTH: 0.423333
G1 X131.983 Y127.596 E.01256
; LINE_WIDTH: 0.467133
G2 X131.888 Y126.735 I-19.763 J1.743 E.02994
; WIPE_START
G1 F8486.318
G1 X131.983 Y127.596 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.125 Y126.022 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4584
M204 S6000
G1 X129.98 Y117.322 E.10701
; WIPE_START
G1 F15000
G1 X130.241 Y119.305 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.531 Y116.436 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.480855
G1 F4584
M204 S6000
G1 X130.321 Y114.835 E.05761
; WIPE_START
G1 F8220.395
G1 X130.531 Y116.436 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.998 Y117.978 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4584
M204 S6000
G1 X126.143 Y126.678 E.10701
; WIPE_START
G1 F15000
G1 X125.882 Y124.695 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y117.265 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.480833
G1 F4584
M204 S6000
G1 X124.025 Y115.665 E.05759
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.813
G1 X124.236 Y117.265 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/73
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z6.2 I-1.2 J.201 P1  F42000
G1 X126.188 Y128.914 Z6.2
G1 Z6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4584
M204 S5000
G1 X126.029 Y127.704 E.03749
G1 X131.196 Y127.024 E.16015
G1 X131.501 Y126.984 E.00947
G1 X131.661 Y128.193 E.03749
G1 X126.247 Y128.906 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.029 Y127.704 E-.46416
G1 X126.8 Y127.603 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y126.59 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4584
M204 S6000
G1 X126.446 Y126.843 E.00849
G1 X125.894 Y126.916 E.01847
G1 X124.695 Y117.813 E.30457
G1 X125.247 Y117.74 E.01847
G1 X126.404 Y126.53 E.2941
; WIPE_START
G1 F8843.478
G1 X126.446 Y126.843 E-.12002
G1 X125.894 Y126.916 E-.21155
G1 X125.747 Y125.798 E-.42843
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.876 Y126.26 Z6.4 F42000
G1 Z6
G1 E.8 F1800
G1 F4584
M204 S6000
G1 X129.677 Y117.157 E.30457
G1 X130.229 Y117.084 E.01847
G1 X131.428 Y126.187 E.30457
G1 X130.935 Y126.252 E.01648
; WIPE_START
G1 F8843.478
G1 X130.661 Y124.271 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.816 Y126.536 Z6.4 F42000
G1 Z6
G1 E.8 F1800
G1 F4584
M204 S6000
G1 X125.633 Y117.552 E.3006
G1 X127.26 Y117.338 E.05442
G1 X129.256 Y117.075 E.06679
G1 X130.49 Y126.448 E.31361
G1 X126.867 Y126.925 E.12121
G1 X126.824 Y126.596 E.01102
M204 S250
G1 X127.205 Y126.485 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4584
M204 S5000
G1 X126.073 Y117.889 E.2664
G1 X127.311 Y117.726 E.03837
G1 X128.918 Y117.515 E.04982
G1 X130.05 Y126.111 E.2664
G1 X127.264 Y126.477 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.989 Y124.496 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.543 Y127.373 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4584
M204 S6000
G1 X124.239 Y117.462 E.33158
G1 X130.58 Y116.627 E.21216
G1 X131.884 Y126.538 E.33158
G1 X125.603 Y127.365 E.21017
; WIPE_START
G1 F8843.478
G1 X125.33 Y125.383 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.883 Y133.003 Z6.4 F42000
G1 X124.485 Y139.788 Z6.4
G1 Z6
G1 E.8 F1800
G1 F4584
M204 S6000
G1 X125.803 Y129.77 E.33516
G1 X126.375 Y129.695 E.01912
G1 X125.176 Y138.799 E.30459
G1 X129.606 Y139.382 E.14822
G1 X130.961 Y129.091 E.3443
G1 X131.533 Y129.016 E.01912
G1 X130.018 Y140.517 E.38478
G1 X124.544 Y139.795 E.18317
M204 S10000
G1 X124.028 Y140.138 F42000
G1 F4584
M204 S6000
G1 X125.542 Y128.638 E.38478
G1 X125.756 Y128.638 E.0071
G1 X125.85 Y129.354 E.02395
G1 X126.848 Y129.222 E.03337
G1 X125.633 Y138.448 E.30868
G1 X129.256 Y138.925 E.12121
G1 X130.49 Y129.552 E.31361
G1 X128.231 Y129.254 E.07559
G1 X128.231 Y129.04 E.0071
G1 X131.979 Y128.547 E.1254
G1 X131.961 Y128.808 E.00869
G1 X130.369 Y140.973 E.40698
G1 X124.087 Y140.146 E.21017
; WIPE_START
G1 F8843.478
G1 X124.338 Y138.162 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.74 Y130.917 Z6.4 F42000
G1 X127.205 Y129.515 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4584
M204 S5000
G1 X130.05 Y129.889 E.08819
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.393 Y135.68 E.07534
G1 X127.197 Y129.574 E.18922
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.185 Y129.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.698 Y122.179 Z6.4 F42000
G1 X130.094 Y116.296 Z6.4
G1 Z6
G1 E.8 F1800
G1 F4584
M204 S5000
G1 X124.622 Y117.016 E.16961
G1 X124.462 Y115.807 E.03749
G1 X129.63 Y115.127 E.16015
G1 X129.935 Y115.086 E.00947
G1 X130.086 Y116.236 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.107 Y116.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.688 Y124.019 Z6.4 F42000
G1 X123.614 Y140.278 Z6.4
G1 Z6
G1 E.8 F1800
G1 F4584
M204 S5000
G1 X125.188 Y128.322 E.37053
G2 X125.188 Y127.678 I-4.389 J-.322 E.01982
G1 X123.614 Y115.72 E.3706
G3 X123.771 Y115.5 I.19 J-.03 E.00922
G1 X130.509 Y114.613 E.20882
G3 X130.582 Y114.615 I.03 J.215 E.00224
G3 X130.732 Y114.784 I-.045 J.191 E.00741
G1 X132.306 Y126.736 E.37042
G3 X132.306 Y129.264 I-10.795 J1.264 E.07785
G1 X130.732 Y141.216 E.37042
G3 X130.51 Y141.387 I-.192 J-.019 E.00965
G1 X123.77 Y140.499 E.20891
G3 X123.614 Y140.338 I.036 J-.191 E.00736
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.874 Y138.355 E-.76
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


G1 X124.874 Y138.964 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192602
G1 F4584
M204 S6000
G1 X126.062 Y129.942 E.111
; WIPE_START
G1 F15000
G1 X125.801 Y131.924 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.055 Y129.147 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.410095
G1 F4584
M204 S6000
G1 X127.382 Y129.147 E.00976
; LINE_WIDTH: 0.458965
G1 X127.708 Y129.147 E.01106
; LINE_WIDTH: 0.507835
G1 X128.034 Y129.147 E.01236
; WIPE_START
G1 F7743.361
G1 X127.708 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.156 Y129.147 Z6.4 F42000
G1 Z6
M73 P60 R7
G1 E.8 F1800
; LINE_WIDTH: 0.119094
G1 F4584
M204 S6000
G1 X129.355 Y129.147 E.00124
; LINE_WIDTH: 0.163435
G1 X129.554 Y129.147 E.00195
; LINE_WIDTH: 0.207775
G1 X129.753 Y129.147 E.00267
; LINE_WIDTH: 0.252116
G1 X129.952 Y129.147 E.00339
; LINE_WIDTH: 0.296457
G1 X130.151 Y129.147 E.00411
; LINE_WIDTH: 0.340798
G1 X130.35 Y129.147 E.00483
; LINE_WIDTH: 0.385138
G1 X130.549 Y129.147 E.00555
; LINE_WIDTH: 0.429479
G1 X130.748 Y129.147 E.00627
M204 S10000
G1 X131.219 Y129.263 F42000
; LINE_WIDTH: 0.192591
G1 F4584
M204 S6000
G1 X129.856 Y139.62 E.12741
M204 S10000
G1 X124.971 Y139.414 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50506
G1 F4584
M204 S6000
G1 X125.154 Y139.437 E.00695
; LINE_WIDTH: 0.531813
G1 X125.224 Y139.42 E.00283
; LINE_WIDTH: 0.581798
G1 X125.293 Y139.404 E.00312
; LINE_WIDTH: 0.631783
G1 X125.362 Y139.388 E.00341
; LINE_WIDTH: 0.681768
G1 X125.431 Y139.372 E.0037
; LINE_WIDTH: 0.70689
G1 X129.212 Y139.87 E.2063
; LINE_WIDTH: 0.686678
G1 X129.27 Y139.898 E.00338
; LINE_WIDTH: 0.645994
G1 X129.328 Y139.926 E.00317
; LINE_WIDTH: 0.60531
G1 X129.386 Y139.954 E.00296
; LINE_WIDTH: 0.564626
G1 X129.444 Y139.983 E.00274
; LINE_WIDTH: 0.512419
G2 X129.585 Y140.022 I.13 J-.194 E.00572
; WIPE_START
G1 F7667.757
G1 X129.444 Y139.983 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.1 Y132.532 Z6.4 F42000
G1 X132.032 Y128.342 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.387815
G1 F4584
M204 S6000
G1 X132.014 Y128 E.00962
; LINE_WIDTH: 0.423328
G1 X131.983 Y127.596 E.01256
; LINE_WIDTH: 0.467122
G2 X131.888 Y126.735 I-19.74 J1.74 E.02994
; WIPE_START
G1 F8486.522
G1 X131.983 Y127.596 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.125 Y126.022 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.192587
G1 F4584
M204 S6000
G1 X129.98 Y117.322 E.10701
; WIPE_START
G1 F15000
G1 X130.241 Y119.305 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.531 Y116.436 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.480854
G1 F4584
M204 S6000
G1 X130.321 Y114.835 E.05761
; WIPE_START
G1 F8220.42
G1 X130.531 Y116.436 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.998 Y117.978 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4584
M204 S6000
G1 X126.143 Y126.678 E.10701
; WIPE_START
G1 F15000
G1 X125.882 Y124.695 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y117.265 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.480842
G1 F4584
M204 S6000
G1 X124.025 Y115.665 E.05759
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.654
G1 X124.236 Y117.265 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/73
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z6.4 I-1.198 J.215 P1  F42000
G1 X126.412 Y129.41 Z6.4
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4835
M204 S6000
G1 X126.486 Y128.847 E.01886
G1 F2880
G1 X126.517 Y128.618 E.00764
G1 X127.369 Y128.73 E.02853
G1 F4835
G1 X127.766 Y128.783 E.01327
G1 X128.162 Y128.835 E.01327
G1 X130.947 Y129.201 E.09316
G1 X129.606 Y139.382 E.34062
G1 X125.176 Y138.799 E.14822
G1 X125.624 Y135.398 E.11379
G1 X126.404 Y129.47 E.19833
M204 S10000
G1 X126.816 Y129.464 F42000
G1 F4835
M204 S6000
G1 X126.867 Y129.075 E.01301
G1 X130.49 Y129.552 E.12121
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.028 Y135.451 E.10029
G1 X126.808 Y129.523 E.19833
M204 S250
G1 X127.205 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4835
M204 S5000
G1 X130.05 Y129.889 E.08819
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.416 Y135.502 E.08085
G1 X127.197 Y129.574 E.18371
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.185 Y129.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.6 I.976 J-.727 P1  F42000
G1 X127.309 Y127.278 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4835
M204 S6000
G1 X126.517 Y127.382 E.02651
G1 X125.176 Y117.201 E.34062
G1 X127.259 Y116.927 E.06969
G1 X129.606 Y116.618 E.07853
G1 X130.947 Y126.799 E.34062
G1 X127.368 Y127.27 E.11972
M204 S10000
G1 X127.256 Y126.874 F42000
G1 F4835
M204 S6000
G1 X126.867 Y126.925 E.01301
G1 X125.633 Y117.552 E.31361
G1 X127.312 Y117.331 E.05619
G1 X129.256 Y117.075 E.06502
G1 X130.49 Y126.448 E.31361
G1 X127.315 Y126.866 E.10622
M204 S250
G1 X127.205 Y126.485 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4835
M204 S5000
G1 X126.073 Y117.889 E.2664
G1 X127.364 Y117.719 E.04
G1 X128.918 Y117.515 E.04819
G1 X130.05 Y126.111 E.2664
G1 X127.264 Y126.477 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.989 Y124.496 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.6 I-1.201 J-.197 P1  F42000
G1 X124.485 Y139.788 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4835
M204 S6000
G1 X125.982 Y128.409 E.38069
G2 X125.981 Y127.583 I-4.877 J-.407 E.02746
G1 X124.641 Y117.402 E.34062
G1 X124.589 Y117.006 E.01327
G1 X124.537 Y116.609 E.01327
G1 F3164.173
G1 X124.485 Y116.212 E.01327
G1 F814.427
G1 X124.542 Y116.205 E.00194
M106 S255
G1 F600
G1 X129.961 Y115.491 E.18128
M106 S201.45
G1 F814.472
G1 X130.018 Y115.483 E.00194
G1 F3164.261
G1 X130.071 Y115.88 E.01327
G1 F4835
G1 X130.123 Y116.277 E.01327
G1 X130.175 Y116.673 E.01327
G1 X131.513 Y126.832 E.33989
G3 X131.586 Y127.837 I-9.49 J1.199 E.03345
G1 X131.59 Y128 E.0054
G1 X131.586 Y128.175 E.00582
G3 X131.513 Y129.168 I-9.561 J-.206 E.03304
G1 X130.018 Y140.517 E.37969
G1 X124.544 Y139.795 E.18317
M204 S10000
G1 X124.028 Y140.138 F42000
G1 F4835
M204 S6000
G1 X125.578 Y128.364 E.39393
G2 X125.577 Y127.631 I-4.291 J-.363 E.02434
G1 X124.028 Y115.862 E.39378
G1 X130.369 Y115.027 E.21216
G1 X131.917 Y126.783 E.39334
G3 X131.961 Y128.808 I-9.593 J1.225 E.06732
G1 X130.369 Y140.973 E.40698
G1 X124.087 Y140.146 E.21017
M204 S250
G1 X123.614 Y140.278 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4835
M204 S5000
G1 X125.188 Y128.32 E.37058
G2 X125.188 Y127.678 I-3.726 J-.32 E.01977
G1 X123.614 Y115.72 E.3706
G3 X123.77 Y115.501 I.191 J-.029 E.00915
G1 X130.509 Y114.613 E.20887
G3 X130.582 Y114.615 I.03 J.215 E.00225
G3 X130.732 Y114.784 I-.043 J.19 E.00742
G1 X132.306 Y126.736 E.37042
G3 X132.306 Y129.264 I-10.793 J1.264 E.07785
G1 X130.732 Y141.216 E.37042
G3 X130.51 Y141.387 I-.192 J-.019 E.00965
G1 X123.77 Y140.499 E.20891
G3 X123.614 Y140.338 I.038 J-.193 E.00733
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.874 Y138.355 E-.76
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


G1 X124.874 Y138.964 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.19376
G1 F4835
M204 S6000
G1 X126.266 Y128.38 E.13121
M204 S10000
G1 X126.266 Y127.62 F42000
; LINE_WIDTH: 0.193363
G1 F4835
M204 S6000
G1 X124.874 Y117.036 E.13087
M204 S10000
G1 X129.58 Y116.279 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.43377
M106 S255
G1 F3000
M204 S6000
G1 X125.282 Y116.845 E.13806
G1 X125.257 Y116.65 E.00627
G1 X125.178 Y116.66 E.00252
G1 X125.163 Y116.543 E.00375
G1 X124.965 Y116.569 E.00636
G1 X124.955 Y116.494 E.00242
G1 X129.805 Y115.855 E.15582
M106 S201.45
M204 S10000
G1 X129.856 Y116.38 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192582
G1 F4835
M204 S6000
G1 X131.248 Y126.964 E.13019
M204 S10000
G1 X131.01 Y127.149 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.46436
M106 S255
G1 F3000
M204 S6000
G1 X126.713 Y127.715 E.14886
G1 X126.736 Y127.894 E.00623
G1 X126.658 Y127.905 E.00272
G1 X126.673 Y128.021 E.00405
G1 X126.476 Y128.047 E.00683
G1 X126.479 Y128.072 E.00085
G1 X126.736 Y128.106 E.0089
G1 X126.732 Y128.137 E.00108
G1 X131.174 Y127.552 E.15387
G1 X131.229 Y127.97 E.01447
G1 X128.191 Y128.37 E.10525
G1 X128.191 Y128.502 E.00454
G1 X129.303 Y128.649 E.03852
G1 X131.41 Y128.371 E.07299
M106 S201.45
M204 S10000
G1 X131.248 Y129.036 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.191504
G1 F4835
M204 S6000
G1 X129.856 Y139.62 E.12925
M204 S10000
G1 X124.971 Y139.414 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50502
G1 F4835
M204 S6000
G1 X125.155 Y139.437 E.00698
; LINE_WIDTH: 0.53177
G1 X125.224 Y139.421 E.00283
; LINE_WIDTH: 0.58175
G1 X125.293 Y139.404 E.00312
; LINE_WIDTH: 0.63173
G1 X125.363 Y139.388 E.00341
; LINE_WIDTH: 0.68171
G1 X125.432 Y139.372 E.0037
; LINE_WIDTH: 0.70685
G1 X129.212 Y139.87 E.20629
; LINE_WIDTH: 0.686658
G1 X129.27 Y139.898 E.00338
; LINE_WIDTH: 0.645974
G1 X129.328 Y139.926 E.00317
; LINE_WIDTH: 0.60529
G1 X129.386 Y139.955 E.00296
; LINE_WIDTH: 0.564606
G1 X129.444 Y139.983 E.00274
; LINE_WIDTH: 0.512454
G2 X129.585 Y140.022 I.129 J-.192 E.00569
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7667.189
G1 X129.444 Y139.983 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/73
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z6.6 I1.17 J-.335 P1  F42000
G1 X126.412 Y129.41 Z6.6
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P61 R7
G1 F4209
M204 S6000
G1 X126.517 Y128.618 E.02651
G1 X130.947 Y129.201 E.14822
G1 X129.606 Y139.382 E.34062
G1 X125.176 Y138.799 E.14822
G1 X125.647 Y135.22 E.11974
G1 X126.404 Y129.47 E.19238
M204 S10000
G1 X126.816 Y129.464 F42000
G1 F4209
M204 S6000
G1 X126.867 Y129.075 E.01301
G1 X130.49 Y129.552 E.12121
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.051 Y135.273 E.10624
G1 X126.808 Y129.523 E.19238
M204 S250
G1 X127.205 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4209
M204 S5000
G1 X130.05 Y129.889 E.08819
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.44 Y135.324 E.08636
G1 X127.197 Y129.574 E.1782
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.185 Y129.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.8 I.976 J-.727 P1  F42000
G1 X127.309 Y127.278 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4209
M204 S6000
G1 X126.517 Y127.382 E.02651
G1 X125.176 Y117.201 E.34062
G1 X127.312 Y116.92 E.07146
G1 X129.606 Y116.618 E.07676
G1 X130.947 Y126.799 E.34062
G1 X127.368 Y127.27 E.11972
M204 S10000
G1 X127.256 Y126.874 F42000
G1 F4209
M204 S6000
G1 X126.867 Y126.925 E.01301
G1 X125.633 Y117.552 E.31361
G1 X127.365 Y117.324 E.05796
G1 X129.256 Y117.075 E.06326
G1 X130.49 Y126.448 E.31361
G1 X127.315 Y126.866 E.10622
M204 S250
G1 X127.205 Y126.485 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4209
M204 S5000
G1 X126.073 Y117.889 E.2664
G1 X127.416 Y117.713 E.04164
G1 X128.918 Y117.515 E.04655
G1 X130.05 Y126.111 E.2664
G1 X127.264 Y126.477 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.989 Y124.496 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.8 I-1.201 J-.197 P1  F42000
G1 X124.485 Y139.788 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4209
M204 S6000
G1 X125.981 Y128.417 E.38043
G2 X125.981 Y127.583 I-5.582 J-.417 E.0277
G1 X124.485 Y116.212 E.38043
G1 X130.018 Y115.483 E.18516
G1 X131.513 Y126.832 E.37969
G3 X131.513 Y129.168 I-9.078 J1.168 E.07772
G1 X130.018 Y140.517 E.37969
G1 X124.544 Y139.795 E.18317
M204 S10000
G1 X124.028 Y140.138 F42000
G1 F4209
M204 S6000
G1 X125.577 Y128.369 E.39377
G2 X125.577 Y127.631 I-4.97 J-.369 E.02449
G1 X124.028 Y115.862 E.39378
G1 X130.369 Y115.027 E.21216
G1 X131.917 Y126.783 E.39334
G3 X131.917 Y129.217 I-9.483 J1.217 E.08096
G1 X130.369 Y140.973 E.39334
G1 X124.087 Y140.146 E.21017
M204 S250
G1 X123.614 Y140.277 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4209
M204 S5000
G1 X125.188 Y128.322 E.37052
G2 X125.188 Y127.678 I-4.382 J-.322 E.01982
G1 X123.614 Y115.72 E.3706
G3 X123.772 Y115.5 I.191 J-.029 E.00923
G1 X130.509 Y114.613 E.20879
G3 X130.582 Y114.615 I.03 J.215 E.00225
G3 X130.732 Y114.784 I-.045 J.191 E.00741
G1 X132.306 Y126.736 E.37042
G3 X132.306 Y129.264 I-9.872 J1.264 E.07789
G1 X130.733 Y141.215 E.37038
G3 X130.51 Y141.387 I-.192 J-.018 E.0097
G1 X123.77 Y140.499 E.20891
G3 X123.614 Y140.338 I.038 J-.192 E.00734
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.874 Y138.355 E-.76
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


G1 X124.874 Y138.964 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.193353
G1 F4209
M204 S6000
G1 X126.266 Y128.38 E.13086
M204 S10000
G1 X126.266 Y127.62 F42000
; LINE_WIDTH: 0.193364
G1 F4209
M204 S6000
G1 X124.874 Y117.036 E.13087
M204 S10000
G1 X124.971 Y116.586 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50325
G1 F4209
M204 S6000
G1 X125.115 Y116.567 E.00544
; LINE_WIDTH: 0.523608
G1 X125.178 Y116.579 E.00253
; LINE_WIDTH: 0.564304
G1 X125.242 Y116.591 E.00274
; LINE_WIDTH: 0.605
G1 X125.305 Y116.603 E.00295
; LINE_WIDTH: 0.645696
G1 X125.368 Y116.616 E.00317
; LINE_WIDTH: 0.70654
G1 X125.432 Y116.628 E.00349
G1 X129.212 Y116.13 E.20617
; LINE_WIDTH: 0.68668
G1 X129.27 Y116.102 E.00338
; LINE_WIDTH: 0.646
G1 X129.328 Y116.074 E.00317
; LINE_WIDTH: 0.60532
G1 X129.386 Y116.045 E.00296
; LINE_WIDTH: 0.56464
G1 X129.444 Y116.017 E.00274
; LINE_WIDTH: 0.512432
G3 X129.585 Y115.978 I.13 J.194 E.00572
M204 S10000
G1 X129.856 Y116.38 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192597
G1 F4209
M204 S6000
G1 X131.248 Y126.964 E.1302
M204 S10000
G1 X130.482 Y127.963 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.3829
G1 F4209
M204 S6000
G1 X130.418 Y128 E.00204
G1 X130.466 Y128.028 E.00155
M204 S10000
G1 X127.713 Y128 F42000
; LINE_WIDTH: 0.41999
G1 F4209
M204 S6000
G1 X130.632 Y128.384 E.09045
G1 X130.674 Y128.318 E.00243
G1 X130.807 Y128.288 E.00417
G2 X130.802 Y127.709 I-3.007 J-.266 E.01783
G1 X130.675 Y127.68 E.00401
G1 X130.634 Y127.616 E.00236
G1 X127.773 Y127.992 E.08866
M204 S10000
G1 X126.79 Y128.259 F42000
G1 F4209
M204 S6000
G1 X130.789 Y128.785 E.12392
G1 X130.877 Y128.636 E.00532
G3 X131.17 Y128.63 I.154 J.4 E.00919
G2 X131.16 Y127.37 I-9.095 J-.564 E.03876
G1 X130.876 Y127.361 E.00873
G1 X130.777 Y127.216 E.0054
G1 X126.776 Y127.743 E.12401
G1 X126.758 Y127.869 E.0039
G1 X126.615 Y127.969 E.00537
G1 X126.392 Y128 E.00693
G1 X126.615 Y128.031 E.00693
G1 X126.758 Y128.131 E.00537
G1 X126.776 Y128.201 E.00221
M204 S10000
G1 X131.248 Y129.036 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.191503
G1 F4209
M204 S6000
G1 X129.856 Y139.62 E.12925
M204 S10000
G1 X124.971 Y139.414 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50503
G1 F4209
M204 S6000
G1 X125.155 Y139.437 E.00697
; LINE_WIDTH: 0.531788
G1 X125.224 Y139.421 E.00283
; LINE_WIDTH: 0.581763
G1 X125.293 Y139.404 E.00312
; LINE_WIDTH: 0.631738
G1 X125.362 Y139.388 E.00341
; LINE_WIDTH: 0.681713
G1 X125.432 Y139.372 E.0037
; LINE_WIDTH: 0.70686
G1 X129.212 Y139.87 E.2063
; LINE_WIDTH: 0.686678
G1 X129.27 Y139.898 E.00338
; LINE_WIDTH: 0.645994
G1 X129.328 Y139.926 E.00317
; LINE_WIDTH: 0.60531
G1 X129.386 Y139.955 E.00296
; LINE_WIDTH: 0.564626
G1 X129.444 Y139.983 E.00274
; LINE_WIDTH: 0.512467
G2 X129.585 Y140.022 I.129 J-.192 E.00569
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7666.964
G1 X129.444 Y139.983 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/73
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z6.8 I1.17 J-.335 P1  F42000
G1 X126.412 Y129.41 Z6.8
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4209
M204 S6000
G1 X126.517 Y128.618 E.02651
G1 X130.947 Y129.201 E.14822
G1 X129.606 Y139.382 E.34062
G1 X125.176 Y138.799 E.14822
G1 X125.671 Y135.042 E.12569
G1 X126.404 Y129.47 E.18643
M204 S10000
M73 P62 R7
G1 X126.816 Y129.464 F42000
G1 F4209
M204 S6000
G1 X126.867 Y129.075 E.01301
G1 X130.49 Y129.552 E.12121
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.074 Y135.095 E.11219
G1 X126.808 Y129.523 E.18643
M204 S250
G1 X127.205 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4209
M204 S5000
G1 X130.05 Y129.889 E.08819
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.463 Y135.146 E.09187
G1 X127.197 Y129.574 E.17269
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.185 Y129.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7 I.976 J-.727 P1  F42000
G1 X127.309 Y127.278 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4209
M204 S6000
G1 X126.517 Y127.382 E.02651
G1 X125.176 Y117.201 E.34062
G1 X127.365 Y116.913 E.07323
G1 X129.606 Y116.618 E.07499
G1 X130.947 Y126.799 E.34062
G1 X127.368 Y127.27 E.11972
M204 S10000
G1 X127.256 Y126.874 F42000
G1 F4209
M204 S6000
G1 X126.867 Y126.925 E.01301
G1 X125.633 Y117.552 E.31361
G1 X127.418 Y117.317 E.05972
G1 X129.256 Y117.075 E.06149
G1 X130.49 Y126.448 E.31361
G1 X127.315 Y126.866 E.10622
M204 S250
G1 X127.205 Y126.485 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4209
M204 S5000
G1 X126.073 Y117.889 E.2664
G1 X127.469 Y117.706 E.04327
G1 X128.918 Y117.515 E.04491
G1 X130.05 Y126.111 E.2664
G1 X127.264 Y126.477 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.989 Y124.496 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7 I-1.201 J-.197 P1  F42000
G1 X124.485 Y139.788 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4209
M204 S6000
G1 X125.982 Y128.41 E.38068
G2 X125.981 Y127.583 I-4.911 J-.408 E.02747
G1 X124.485 Y116.212 E.38043
G1 X130.018 Y115.483 E.18516
G1 X131.513 Y126.832 E.37969
G3 X131.513 Y129.168 I-9.078 J1.168 E.07771
G1 X130.018 Y140.517 E.37969
G1 X124.544 Y139.795 E.18317
M204 S10000
G1 X124.028 Y140.138 F42000
G1 F4209
M204 S6000
G1 X125.578 Y128.364 E.39392
G2 X125.577 Y127.631 I-4.325 J-.363 E.02435
G1 X124.028 Y115.862 E.39377
G1 X130.369 Y115.027 E.21216
G1 X131.917 Y126.783 E.39334
G3 X131.917 Y129.217 I-9.483 J1.217 E.08096
G1 X130.369 Y140.973 E.39334
G1 X124.087 Y140.146 E.21017
M204 S250
G1 X123.614 Y140.277 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4209
M204 S5000
G1 X125.188 Y128.321 E.37058
G2 X125.188 Y127.678 I-3.76 J-.32 E.01977
G1 X123.614 Y115.72 E.37061
G3 X123.77 Y115.501 I.192 J-.028 E.00913
G1 X130.509 Y114.613 E.20887
G3 X130.582 Y114.615 I.03 J.215 E.00225
G3 X130.732 Y114.784 I-.041 J.188 E.00744
G1 X132.306 Y126.736 E.37042
G3 X132.306 Y129.264 I-9.873 J1.264 E.07789
G1 X130.733 Y141.215 E.37038
G3 X130.51 Y141.387 I-.194 J-.02 E.00967
G1 X123.77 Y140.499 E.20892
G3 X123.614 Y140.338 I.037 J-.192 E.00733
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.874 Y138.355 E-.76
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


G1 X124.874 Y138.964 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.193769
G1 F4209
M204 S6000
G1 X126.266 Y128.38 E.13122
M204 S10000
G1 X126.266 Y127.62 F42000
; LINE_WIDTH: 0.193364
G1 F4209
M204 S6000
G1 X124.874 Y117.036 E.13087
M204 S10000
G1 X124.971 Y116.586 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50328
G1 F4209
M204 S6000
G1 X125.115 Y116.567 E.00544
; LINE_WIDTH: 0.523626
G1 X125.178 Y116.579 E.00253
; LINE_WIDTH: 0.564318
G1 X125.242 Y116.591 E.00274
; LINE_WIDTH: 0.60501
G1 X125.305 Y116.603 E.00295
; LINE_WIDTH: 0.645702
G1 X125.368 Y116.616 E.00317
; LINE_WIDTH: 0.70654
G1 X125.432 Y116.628 E.00349
G1 X129.212 Y116.13 E.20617
; LINE_WIDTH: 0.68668
G1 X129.27 Y116.102 E.00338
; LINE_WIDTH: 0.646
G1 X129.328 Y116.074 E.00317
; LINE_WIDTH: 0.60532
G1 X129.386 Y116.045 E.00296
; LINE_WIDTH: 0.56464
G1 X129.444 Y116.017 E.00274
; LINE_WIDTH: 0.512425
G3 X129.585 Y115.978 I.13 J.194 E.00573
M204 S10000
G1 X129.856 Y116.38 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192592
G1 F4209
M204 S6000
G1 X131.248 Y126.964 E.1302
M204 S10000
G1 X130.482 Y127.963 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38288
G1 F4209
M204 S6000
G1 X130.418 Y128 E.00204
G1 X130.466 Y128.028 E.00155
M204 S10000
G1 X127.713 Y128 F42000
; LINE_WIDTH: 0.41999
G1 F4209
M204 S6000
G1 X130.632 Y128.384 E.09045
G1 X130.674 Y128.318 E.00243
G1 X130.807 Y128.288 E.00417
G2 X130.802 Y127.709 I-3.006 J-.266 E.01783
G1 X130.675 Y127.68 E.00401
G1 X130.634 Y127.616 E.00236
G1 X127.773 Y127.992 E.08866
M204 S10000
G1 X126.79 Y128.259 F42000
G1 F4209
M204 S6000
G1 X130.789 Y128.785 E.12392
G1 X130.877 Y128.636 E.00532
G3 X131.17 Y128.63 I.154 J.4 E.00919
G2 X131.16 Y127.37 I-9.094 J-.564 E.03876
G1 X130.876 Y127.361 E.00873
G1 X130.777 Y127.216 E.0054
G1 X126.776 Y127.743 E.124
G1 X126.758 Y127.869 E.00391
G1 X126.615 Y127.969 E.00537
G1 X126.392 Y128 E.00693
G1 X126.615 Y128.031 E.00693
G1 X126.758 Y128.131 E.00536
G1 X126.776 Y128.201 E.00221
M204 S10000
G1 X131.248 Y129.036 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.191511
G1 F4209
M204 S6000
G1 X129.856 Y139.62 E.12926
M204 S10000
G1 X124.971 Y139.414 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50505
G1 F4209
M204 S6000
G1 X125.155 Y139.437 E.00698
; LINE_WIDTH: 0.53181
G1 X125.224 Y139.421 E.00283
; LINE_WIDTH: 0.58179
G1 X125.293 Y139.404 E.00312
; LINE_WIDTH: 0.63177
G1 X125.363 Y139.388 E.00341
; LINE_WIDTH: 0.68175
G1 X125.432 Y139.372 E.0037
; LINE_WIDTH: 0.70688
G1 X129.212 Y139.87 E.2063
; LINE_WIDTH: 0.686678
G1 X129.27 Y139.898 E.00338
; LINE_WIDTH: 0.645994
G1 X129.328 Y139.926 E.00317
; LINE_WIDTH: 0.60531
G1 X129.386 Y139.955 E.00296
; LINE_WIDTH: 0.564626
G1 X129.444 Y139.983 E.00274
; LINE_WIDTH: 0.512467
G2 X129.585 Y140.022 I.129 J-.192 E.00569
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7666.975
G1 X129.444 Y139.983 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/73
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z7 I1.17 J-.335 P1  F42000
G1 X126.412 Y129.41 Z7
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4190
M204 S6000
G1 X126.517 Y128.618 E.02651
G1 X130.947 Y129.201 E.14822
G1 X129.606 Y139.382 E.34062
G1 X125.176 Y138.799 E.14822
G1 X125.694 Y134.864 E.13164
G1 X126.404 Y129.47 E.18048
M204 S10000
G1 X126.816 Y129.464 F42000
G1 F4190
M204 S6000
G1 X126.867 Y129.075 E.01301
G1 X130.49 Y129.552 E.12121
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.098 Y134.917 E.11814
G1 X126.808 Y129.523 E.18048
M204 S250
G1 X127.205 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4190
M204 S5000
G1 X130.05 Y129.889 E.08819
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
M73 P63 R7
G1 X126.487 Y134.968 E.09738
G1 X127.197 Y129.574 E.16718
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.185 Y129.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y126.59 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4190
M204 S6000
G1 X125.176 Y117.201 E.31411
G1 X127.418 Y116.906 E.07499
G1 X129.606 Y116.618 E.07323
G1 X130.947 Y126.799 E.34062
G1 X126.517 Y127.382 E.14822
G1 X126.42 Y126.649 E.02452
M204 S10000
G1 X126.816 Y126.536 F42000
G1 F4190
M204 S6000
G1 X125.633 Y117.552 E.3006
G1 X127.471 Y117.31 E.06149
G1 X129.256 Y117.075 E.05972
G1 X130.49 Y126.448 E.31361
G1 X126.867 Y126.925 E.12121
G1 X126.824 Y126.596 E.01102
M204 S250
G1 X127.205 Y126.485 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4190
M204 S5000
G1 X126.073 Y117.889 E.2664
G1 X127.522 Y117.699 E.04491
G1 X128.918 Y117.515 E.04328
G1 X130.05 Y126.111 E.2664
G1 X127.264 Y126.477 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.989 Y124.496 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.756 Y132.028 Z7.2 F42000
G1 X124.485 Y139.788 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4190
M204 S6000
G1 X125.983 Y128.407 E.38079
G2 X125.983 Y127.593 I-3.731 J-.407 E.02702
G1 X124.485 Y116.212 E.38079
G1 X130.018 Y115.483 E.18516
G1 X131.513 Y126.832 E.37969
G3 X131.556 Y128.773 I-9.179 J1.176 E.06452
G1 X130.018 Y140.517 E.39288
G1 X124.544 Y139.795 E.18317
M204 S10000
G1 X124.028 Y140.138 F42000
G1 F4190
M204 S6000
G1 X125.578 Y128.362 E.39399
G2 X125.578 Y127.638 I-3.247 J-.362 E.02409
G1 X124.028 Y115.862 E.39399
G1 X130.369 Y115.027 E.21216
G1 X131.917 Y126.783 E.39334
G3 X131.961 Y128.808 I-9.593 J1.225 E.06732
G1 X130.369 Y140.973 E.40698
G1 X124.087 Y140.146 E.21017
M204 S250
G1 X123.614 Y140.277 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4190
M204 S5000
G1 X125.188 Y128.32 E.37059
G2 X125.188 Y127.68 I-2.785 J-.32 E.0197
G1 X123.614 Y115.72 E.37068
G3 X123.771 Y115.5 I.191 J-.029 E.00919
G1 X130.509 Y114.613 E.20883
G3 X130.582 Y114.615 I.03 J.215 E.00224
G3 X130.732 Y114.784 I-.044 J.191 E.00742
G1 X132.306 Y126.736 E.37042
G3 X132.306 Y129.264 I-10.793 J1.264 E.07785
G1 X130.732 Y141.216 E.37041
G3 X130.511 Y141.387 I-.194 J-.021 E.00962
G1 X123.77 Y140.499 E.20893
G3 X123.614 Y140.338 I.038 J-.192 E.00734
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.874 Y138.355 E-.76
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


G1 X124.874 Y138.964 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192282
G1 F4190
M204 S6000
G1 X126.257 Y128.454 E.12902
G1 X126.192 Y128.37 E.0013
M204 S10000
G1 X126.192 Y127.63 F42000
; LINE_WIDTH: 0.192287
G1 F4190
M204 S6000
G1 X126.257 Y127.546 E.0013
G1 X124.874 Y117.036 E.12902
M204 S10000
G1 X124.971 Y116.586 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50327
G1 F4190
M204 S6000
G1 X125.114 Y116.567 E.00542
; LINE_WIDTH: 0.523626
G1 X125.178 Y116.579 E.00253
; LINE_WIDTH: 0.564318
G1 X125.241 Y116.591 E.00274
; LINE_WIDTH: 0.60501
G1 X125.304 Y116.603 E.00295
; LINE_WIDTH: 0.645702
G1 X125.368 Y116.616 E.00317
; LINE_WIDTH: 0.70654
G1 X125.431 Y116.628 E.00349
G1 X129.212 Y116.13 E.2062
; LINE_WIDTH: 0.686678
G1 X129.27 Y116.102 E.00338
; LINE_WIDTH: 0.645994
G1 X129.328 Y116.074 E.00317
; LINE_WIDTH: 0.60531
G1 X129.386 Y116.045 E.00296
; LINE_WIDTH: 0.564626
G1 X129.444 Y116.017 E.00274
; LINE_WIDTH: 0.512411
G3 X129.585 Y115.978 I.13 J.194 E.00572
M204 S10000
G1 X129.856 Y116.38 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192593
G1 F4190
M204 S6000
G1 X131.248 Y126.964 E.1302
M204 S10000
G1 X130.482 Y127.963 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38288
G1 F4190
M204 S6000
G1 X130.418 Y128 E.00204
G1 X130.466 Y128.028 E.00155
M204 S10000
G1 X127.714 Y128 F42000
; LINE_WIDTH: 0.41999
G1 F4190
M204 S6000
G1 X130.632 Y128.384 E.09045
G1 X130.674 Y128.318 E.00243
G1 X130.807 Y128.288 E.00417
G2 X130.802 Y127.709 I-3.006 J-.266 E.01783
G1 X130.675 Y127.68 E.00401
G1 X130.634 Y127.616 E.00236
G1 X127.773 Y127.992 E.08866
M204 S10000
G1 X126.691 Y127.754 F42000
G1 F4190
M204 S6000
G1 X126.534 Y128 E.00896
G1 X126.691 Y128.246 E.00897
G1 X130.789 Y128.785 E.12699
G1 X130.877 Y128.636 E.00532
G3 X131.17 Y128.63 I.154 J.4 E.00919
G2 X131.16 Y127.37 I-9.096 J-.564 E.03876
G1 X130.876 Y127.361 E.00873
G1 X130.777 Y127.216 E.0054
G1 X126.751 Y127.746 E.12477
M204 S10000
G1 X131.248 Y129.036 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.191511
G1 F4190
M204 S6000
G1 X129.856 Y139.62 E.12926
M204 S10000
G1 X124.971 Y139.414 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50504
G1 F4190
M204 S6000
G1 X125.154 Y139.437 E.00695
; LINE_WIDTH: 0.53179
G1 X125.223 Y139.42 E.00283
; LINE_WIDTH: 0.58177
G1 X125.293 Y139.404 E.00312
; LINE_WIDTH: 0.63175
G1 X125.362 Y139.388 E.00341
; LINE_WIDTH: 0.68173
G1 X125.431 Y139.372 E.0037
; LINE_WIDTH: 0.70687
G1 X129.212 Y139.87 E.20634
; LINE_WIDTH: 0.686678
G1 X129.27 Y139.898 E.00338
; LINE_WIDTH: 0.645994
G1 X129.328 Y139.926 E.00317
; LINE_WIDTH: 0.60531
G1 X129.386 Y139.955 E.00296
; LINE_WIDTH: 0.564626
G1 X129.444 Y139.983 E.00274
; LINE_WIDTH: 0.512467
G2 X129.585 Y140.022 I.129 J-.192 E.00569
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7666.975
G1 X129.444 Y139.983 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/73
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z7.2 I1.17 J-.335 P1  F42000
G1 X126.412 Y129.41 Z7.2
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4192
M204 S6000
G1 X126.517 Y128.618 E.02651
G1 X130.947 Y129.201 E.14822
G1 X129.606 Y139.382 E.34062
G1 X125.176 Y138.799 E.14822
G1 X125.718 Y134.686 E.13759
G1 X126.404 Y129.47 E.17453
M204 S10000
G1 X126.816 Y129.464 F42000
G1 F4192
M204 S6000
G1 X126.867 Y129.075 E.01301
G1 X130.49 Y129.552 E.12121
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.121 Y134.739 E.12408
G1 X126.808 Y129.523 E.17453
M204 S250
G1 X127.205 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4192
M204 S5000
M73 P63 R6
G1 X130.05 Y129.889 E.08819
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.51 Y134.791 E.10289
G1 X127.197 Y129.574 E.16167
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.185 Y129.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y126.59 Z7.4 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4192
M204 S6000
G1 X125.176 Y117.201 E.31411
G1 X127.471 Y116.899 E.07676
G1 X129.606 Y116.618 E.07146
G1 X130.947 Y126.799 E.34062
G1 X126.517 Y127.382 E.14822
G1 X126.42 Y126.649 E.02452
M204 S10000
G1 X126.816 Y126.536 F42000
G1 F4192
M204 S6000
G1 X125.633 Y117.552 E.3006
G1 X127.524 Y117.303 E.06326
G1 X129.256 Y117.075 E.05796
G1 X130.49 Y126.448 E.31361
G1 X126.867 Y126.925 E.12121
G1 X126.824 Y126.596 E.01102
M204 S250
G1 X127.205 Y126.485 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4192
M204 S5000
G1 X126.073 Y117.889 E.2664
G1 X127.575 Y117.692 E.04655
G1 X128.918 Y117.515 E.04164
G1 X130.05 Y126.111 E.2664
G1 X127.264 Y126.477 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.989 Y124.496 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.756 Y132.028 Z7.4 F42000
G1 X124.485 Y139.788 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4192
M204 S6000
G1 X125.981 Y128.417 E.38043
G2 X125.981 Y127.583 I-5.583 J-.417 E.02771
G1 X124.485 Y116.212 E.38043
G1 X130.018 Y115.483 E.18516
G1 X131.513 Y126.832 E.37969
G3 X131.556 Y128.773 I-9.179 J1.176 E.06452
G1 X130.018 Y140.517 E.39288
G1 X124.544 Y139.795 E.18317
M204 S10000
G1 X124.028 Y140.138 F42000
G1 F4192
M204 S6000
G1 X125.577 Y128.369 E.39377
G2 X125.577 Y127.631 I-4.972 J-.369 E.02449
G1 X124.028 Y115.862 E.39377
G1 X130.369 Y115.027 E.21216
G1 X131.917 Y126.783 E.39334
G3 X131.961 Y128.808 I-9.592 J1.225 E.06732
G1 X130.369 Y140.973 E.40698
G1 X124.087 Y140.146 E.21017
M204 S250
G1 X123.614 Y140.278 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4192
M204 S5000
G1 X125.188 Y128.322 E.37052
G2 X125.188 Y127.678 I-4.385 J-.322 E.01982
G1 X123.614 Y115.72 E.3706
G3 X123.77 Y115.501 I.191 J-.029 E.00915
G1 X130.509 Y114.613 E.20888
G3 X130.582 Y114.615 I.03 J.214 E.00224
G3 X130.732 Y114.784 I-.045 J.191 E.00742
G1 X132.306 Y126.736 E.37042
G3 X132.306 Y129.264 I-10.795 J1.264 E.07785
G1 X130.733 Y141.215 E.37038
G3 X130.51 Y141.387 I-.192 J-.018 E.00969
G1 X123.77 Y140.499 E.20891
G3 X123.614 Y140.338 I.037 J-.192 E.00733
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.874 Y138.355 E-.76
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


G1 X124.874 Y138.964 F42000
G1 Z7
M73 P64 R6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.193353
G1 F4192
M204 S6000
G1 X126.266 Y128.38 E.13086
M204 S10000
G1 X126.266 Y127.62 F42000
; LINE_WIDTH: 0.193364
G1 F4192
M204 S6000
G1 X124.874 Y117.036 E.13087
M204 S10000
G1 X124.971 Y116.586 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50327
G1 F4192
M204 S6000
G1 X125.115 Y116.567 E.00544
; LINE_WIDTH: 0.523628
G1 X125.178 Y116.579 E.00253
; LINE_WIDTH: 0.564324
G1 X125.242 Y116.591 E.00274
; LINE_WIDTH: 0.60502
G1 X125.305 Y116.603 E.00295
; LINE_WIDTH: 0.645716
G1 X125.368 Y116.616 E.00317
; LINE_WIDTH: 0.70655
G1 X125.432 Y116.628 E.00349
G1 X129.212 Y116.13 E.20618
; LINE_WIDTH: 0.68668
G1 X129.27 Y116.102 E.00338
; LINE_WIDTH: 0.646
G1 X129.328 Y116.074 E.00317
; LINE_WIDTH: 0.60532
G1 X129.386 Y116.045 E.00296
; LINE_WIDTH: 0.56464
G1 X129.444 Y116.017 E.00274
; LINE_WIDTH: 0.512425
G3 X129.585 Y115.978 I.13 J.194 E.00572
M204 S10000
G1 X129.856 Y116.38 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192595
G1 F4192
M204 S6000
G1 X131.248 Y126.964 E.1302
M204 S10000
G1 X130.482 Y127.963 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.3829
G1 F4192
M204 S6000
G1 X130.418 Y128 E.00204
G1 X130.466 Y128.028 E.00155
M204 S10000
G1 X127.714 Y128 F42000
; LINE_WIDTH: 0.41999
G1 F4192
M204 S6000
G1 X130.632 Y128.384 E.09045
G1 X130.674 Y128.318 E.00243
G1 X130.807 Y128.288 E.00417
G2 X130.802 Y127.709 I-3.006 J-.266 E.01783
G1 X130.675 Y127.68 E.00401
G1 X130.634 Y127.616 E.00236
G1 X127.773 Y127.992 E.08865
M204 S10000
G1 X126.79 Y128.259 F42000
G1 F4192
M204 S6000
G1 X130.789 Y128.785 E.12392
G1 X130.877 Y128.636 E.00532
G3 X131.17 Y128.63 I.154 J.4 E.00919
G2 X131.16 Y127.37 I-9.096 J-.564 E.03876
G1 X130.876 Y127.361 E.00873
G1 X130.777 Y127.216 E.0054
G1 X126.776 Y127.743 E.12401
G1 X126.758 Y127.869 E.0039
G1 X126.615 Y127.969 E.00537
G1 X126.392 Y128 E.00693
G1 X126.615 Y128.031 E.00693
G1 X126.758 Y128.131 E.00537
G1 X126.776 Y128.201 E.00221
M204 S10000
G1 X131.248 Y129.036 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.191511
G1 F4192
M204 S6000
G1 X129.856 Y139.62 E.12926
M204 S10000
G1 X124.971 Y139.414 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50506
G1 F4192
M204 S6000
G1 X125.155 Y139.437 E.00697
; LINE_WIDTH: 0.53181
G1 X125.224 Y139.421 E.00283
; LINE_WIDTH: 0.58179
G1 X125.293 Y139.404 E.00312
; LINE_WIDTH: 0.63177
G1 X125.362 Y139.388 E.00341
; LINE_WIDTH: 0.68175
G1 X125.432 Y139.372 E.0037
; LINE_WIDTH: 0.70687
G1 X129.212 Y139.87 E.20631
; LINE_WIDTH: 0.68666
G1 X129.27 Y139.898 E.00338
; LINE_WIDTH: 0.64598
G1 X129.328 Y139.926 E.00317
; LINE_WIDTH: 0.6053
G1 X129.386 Y139.955 E.00296
; LINE_WIDTH: 0.56462
G1 X129.444 Y139.983 E.00274
; LINE_WIDTH: 0.512466
G2 X129.585 Y140.022 I.129 J-.192 E.00569
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7666.989
G1 X129.444 Y139.983 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/73
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z7.4 I1.17 J-.335 P1  F42000
G1 X126.412 Y129.41 Z7.4
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4192
M204 S6000
G1 X126.517 Y128.618 E.02651
G1 X130.947 Y129.201 E.14822
G1 X129.606 Y139.382 E.34062
G1 X125.176 Y138.799 E.14822
G1 X125.741 Y134.509 E.14354
G1 X126.404 Y129.47 E.16858
M204 S10000
G1 X126.816 Y129.464 F42000
G1 F4192
M204 S6000
G1 X126.867 Y129.075 E.01301
G1 X130.49 Y129.552 E.12121
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.145 Y134.562 E.13003
G1 X126.808 Y129.523 E.16858
M204 S250
G1 X127.205 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4192
M204 S5000
G1 X130.05 Y129.889 E.08819
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.533 Y134.613 E.1084
G1 X127.197 Y129.574 E.15616
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.185 Y129.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y126.59 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4192
M204 S6000
G1 X125.176 Y117.201 E.31411
G1 X127.523 Y116.892 E.07853
G1 X129.606 Y116.618 E.06969
G1 X130.947 Y126.799 E.34062
G1 X126.517 Y127.382 E.14822
G1 X126.42 Y126.649 E.02452
M204 S10000
G1 X126.816 Y126.536 F42000
G1 F4192
M204 S6000
G1 X125.633 Y117.552 E.30061
G1 X127.576 Y117.296 E.06502
G1 X129.256 Y117.075 E.05619
G1 X130.49 Y126.448 E.31361
G1 X126.867 Y126.925 E.12121
G1 X126.824 Y126.596 E.01102
M204 S250
G1 X127.205 Y126.485 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4192
M204 S5000
G1 X126.073 Y117.889 E.2664
G1 X127.628 Y117.685 E.04818
G1 X128.918 Y117.515 E.04
G1 X130.05 Y126.111 E.2664
G1 X127.264 Y126.477 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.989 Y124.496 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.756 Y132.028 Z7.6 F42000
G1 X124.485 Y139.788 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4192
M204 S6000
G1 X125.982 Y128.41 E.38066
G2 X125.981 Y127.583 I-4.961 J-.408 E.02748
G1 X124.485 Y116.212 E.38043
G1 X130.018 Y115.483 E.18516
G1 X131.513 Y126.832 E.37969
G3 X131.513 Y129.168 I-9.914 J1.168 E.07768
G1 X130.018 Y140.517 E.37969
G1 X124.544 Y139.795 E.18317
M204 S10000
G1 X124.028 Y140.138 F42000
G1 F4192
M204 S6000
G1 X125.578 Y128.365 E.39391
G2 X125.577 Y127.631 I-4.371 J-.363 E.02436
G1 X124.028 Y115.862 E.39377
G1 X130.369 Y115.027 E.21216
G1 X131.917 Y126.783 E.39334
G3 X131.917 Y129.217 I-10.363 J1.217 E.08092
G1 X130.369 Y140.973 E.39334
G1 X124.087 Y140.146 E.21017
M204 S250
G1 X123.614 Y140.278 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4192
M204 S5000
G1 X125.188 Y128.321 E.37057
G2 X125.188 Y127.678 I-3.803 J-.32 E.01977
G1 X123.614 Y115.72 E.3706
G3 X123.77 Y115.501 I.192 J-.028 E.00914
G1 X130.509 Y114.613 E.20887
G3 X130.582 Y114.615 I.03 J.215 E.00224
G3 X130.733 Y114.785 I-.044 J.191 E.00746
G1 X132.306 Y126.736 E.37038
G3 X132.306 Y129.264 I-10.795 J1.264 E.07785
G1 X130.732 Y141.216 E.37041
G3 X130.51 Y141.387 I-.194 J-.021 E.00963
G1 X123.77 Y140.499 E.20891
G3 X123.614 Y140.338 I.037 J-.192 E.00733
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.874 Y138.355 E-.76
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


G1 X124.874 Y138.964 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.19375
G1 F4192
M204 S6000
G1 X126.266 Y128.38 E.13121
M204 S10000
G1 X126.266 Y127.62 F42000
; LINE_WIDTH: 0.193364
G1 F4192
M204 S6000
G1 X124.874 Y117.036 E.13087
M204 S10000
G1 X124.971 Y116.586 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50327
G1 F4192
M204 S6000
G1 X125.115 Y116.567 E.00544
; LINE_WIDTH: 0.523628
G1 X125.178 Y116.579 E.00253
; LINE_WIDTH: 0.564324
G1 X125.242 Y116.591 E.00274
; LINE_WIDTH: 0.60502
G1 X125.305 Y116.603 E.00295
; LINE_WIDTH: 0.645716
G1 X125.368 Y116.616 E.00317
; LINE_WIDTH: 0.70655
G1 X125.432 Y116.628 E.00349
G1 X129.212 Y116.13 E.20618
; LINE_WIDTH: 0.68668
G1 X129.27 Y116.102 E.00338
; LINE_WIDTH: 0.646
G1 X129.328 Y116.074 E.00317
; LINE_WIDTH: 0.60532
G1 X129.386 Y116.045 E.00296
; LINE_WIDTH: 0.56464
G1 X129.444 Y116.017 E.00274
; LINE_WIDTH: 0.512425
G3 X129.585 Y115.978 I.13 J.194 E.00572
M204 S10000
G1 X129.856 Y116.38 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192582
G1 F4192
M204 S6000
G1 X131.248 Y126.964 E.13019
M204 S10000
G1 X130.482 Y127.963 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.3829
G1 F4192
M204 S6000
G1 X130.418 Y128 E.00204
G1 X130.466 Y128.028 E.00155
M204 S10000
G1 X127.713 Y128 F42000
; LINE_WIDTH: 0.41999
G1 F4192
M204 S6000
G1 X130.632 Y128.384 E.09045
G1 X130.674 Y128.318 E.00243
G1 X130.807 Y128.288 E.00417
G2 X130.802 Y127.709 I-3.007 J-.266 E.01783
G1 X130.675 Y127.68 E.00401
G1 X130.634 Y127.616 E.00236
G1 X127.773 Y127.992 E.08866
M204 S10000
G1 X126.79 Y128.259 F42000
M73 P65 R6
G1 F4192
M204 S6000
G1 X130.789 Y128.785 E.12392
G1 X130.877 Y128.636 E.00532
G3 X131.17 Y128.63 I.154 J.4 E.00919
G2 X131.16 Y127.37 I-9.091 J-.564 E.03876
G1 X130.876 Y127.361 E.00873
G1 X130.777 Y127.216 E.0054
G1 X126.776 Y127.743 E.124
G1 X126.758 Y127.869 E.00391
G1 X126.615 Y127.969 E.00537
G1 X126.392 Y128 E.00693
G1 X126.615 Y128.031 E.00693
G1 X126.758 Y128.131 E.00536
G1 X126.776 Y128.201 E.00221
M204 S10000
G1 X131.248 Y129.036 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.191512
G1 F4192
M204 S6000
G1 X129.856 Y139.62 E.12926
M204 S10000
G1 X124.971 Y139.414 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50502
G1 F4192
M204 S6000
G1 X125.155 Y139.437 E.00698
; LINE_WIDTH: 0.53177
G1 X125.224 Y139.421 E.00283
; LINE_WIDTH: 0.58175
G1 X125.293 Y139.404 E.00312
; LINE_WIDTH: 0.63173
G1 X125.363 Y139.388 E.00341
; LINE_WIDTH: 0.68171
G1 X125.432 Y139.372 E.0037
; LINE_WIDTH: 0.70686
G1 X129.212 Y139.87 E.20629
; LINE_WIDTH: 0.68668
G1 X129.27 Y139.898 E.00338
; LINE_WIDTH: 0.646
G1 X129.328 Y139.926 E.00317
; LINE_WIDTH: 0.60532
G1 X129.386 Y139.955 E.00296
; LINE_WIDTH: 0.56464
G1 X129.444 Y139.983 E.00274
; LINE_WIDTH: 0.512481
G2 X129.585 Y140.022 I.129 J-.192 E.00569
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7666.743
G1 X129.444 Y139.983 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/73
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z7.6 I1.17 J-.335 P1  F42000
G1 X126.412 Y129.41 Z7.6
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4193
M204 S6000
G1 X126.517 Y128.618 E.02651
G1 X130.947 Y129.201 E.14822
G1 X129.606 Y139.382 E.34062
G1 X125.176 Y138.799 E.14822
G1 X125.764 Y134.331 E.14949
G1 X126.404 Y129.47 E.16263
M204 S10000
G1 X126.816 Y129.464 F42000
G1 F4193
M204 S6000
G1 X126.867 Y129.075 E.01301
G1 X130.49 Y129.552 E.12121
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.168 Y134.384 E.13598
G1 X126.808 Y129.523 E.16263
M204 S250
G1 X127.205 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4193
M204 S5000
G1 X130.05 Y129.889 E.08819
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.557 Y134.435 E.11391
G1 X127.197 Y129.574 E.15065
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.185 Y129.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.309 Y127.278 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4193
M204 S6000
G1 X126.517 Y127.382 E.02651
G1 X125.176 Y117.201 E.34062
G1 X127.576 Y116.885 E.08029
G1 X129.606 Y116.618 E.06793
G1 X130.947 Y126.799 E.34062
G1 X127.368 Y127.27 E.11972
M204 S10000
G1 X127.256 Y126.874 F42000
G1 F4193
M204 S6000
G1 X126.867 Y126.925 E.01301
G1 X125.633 Y117.552 E.31361
G1 X127.629 Y117.289 E.06679
G1 X129.256 Y117.075 E.05442
G1 X130.49 Y126.448 E.31361
G1 X127.315 Y126.866 E.10622
M204 S250
G1 X127.205 Y126.485 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4193
M204 S5000
G1 X126.073 Y117.889 E.2664
G1 X127.68 Y117.678 E.04982
G1 X128.918 Y117.515 E.03837
G1 X130.05 Y126.111 E.2664
G1 X127.264 Y126.477 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.989 Y124.496 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.756 Y132.028 Z7.8 F42000
G1 X124.485 Y139.788 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4193
M204 S6000
G1 X125.981 Y128.417 E.38043
G2 X125.981 Y127.583 I-5.577 J-.417 E.02771
G1 X124.485 Y116.212 E.38043
G1 X130.018 Y115.483 E.18516
G1 X131.513 Y126.832 E.37969
G3 X131.513 Y129.168 I-9.912 J1.168 E.07768
G1 X130.018 Y140.517 E.37969
G1 X124.544 Y139.795 E.18317
M204 S10000
G1 X124.028 Y140.138 F42000
G1 F4193
M204 S6000
G1 X125.577 Y128.369 E.39377
G2 X125.577 Y127.631 I-4.967 J-.369 E.02449
G1 X124.028 Y115.862 E.39378
G1 X130.369 Y115.027 E.21216
G1 X131.917 Y126.783 E.39334
G3 X131.917 Y129.217 I-10.361 J1.217 E.08092
G1 X130.369 Y140.973 E.39334
G1 X124.087 Y140.146 E.21017
M204 S250
G1 X123.614 Y140.277 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4193
M204 S5000
G1 X125.188 Y128.322 E.37052
G2 X125.188 Y127.678 I-4.38 J-.322 E.01982
G1 X123.614 Y115.72 E.3706
G3 X123.772 Y115.5 I.192 J-.028 E.00921
G1 X130.509 Y114.613 E.2088
G3 X130.582 Y114.615 I.03 J.215 E.00224
G3 X130.732 Y114.784 I-.043 J.19 E.00744
G1 X132.306 Y126.736 E.37041
G3 X132.306 Y129.264 I-10.793 J1.264 E.07785
G1 X130.732 Y141.216 E.37041
G3 X130.511 Y141.387 I-.192 J-.019 E.00965
G1 X123.77 Y140.499 E.20892
G3 X123.614 Y140.338 I.038 J-.192 E.00733
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.874 Y138.355 E-.76
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


G1 X124.874 Y138.964 F42000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.193362
G1 F4193
M204 S6000
G1 X126.266 Y128.38 E.13087
M204 S10000
G1 X126.266 Y127.62 F42000
; LINE_WIDTH: 0.193376
G1 F4193
M204 S6000
G1 X124.874 Y117.036 E.13088
M204 S10000
G1 X124.971 Y116.586 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50326
G1 F4193
M204 S6000
G1 X125.115 Y116.567 E.00544
; LINE_WIDTH: 0.523604
G1 X125.178 Y116.579 E.00253
; LINE_WIDTH: 0.564292
G1 X125.242 Y116.591 E.00274
; LINE_WIDTH: 0.60498
G1 X125.305 Y116.603 E.00295
; LINE_WIDTH: 0.645668
G1 X125.368 Y116.616 E.00317
; LINE_WIDTH: 0.706519
G1 X125.432 Y116.628 E.00349
G1 X129.212 Y116.13 E.20617
; LINE_WIDTH: 0.686678
G1 X129.27 Y116.102 E.00338
; LINE_WIDTH: 0.645994
G1 X129.328 Y116.074 E.00317
; LINE_WIDTH: 0.60531
G1 X129.386 Y116.045 E.00296
; LINE_WIDTH: 0.564626
G1 X129.444 Y116.017 E.00274
; LINE_WIDTH: 0.512411
G3 X129.585 Y115.978 I.13 J.194 E.00573
M204 S10000
G1 X129.856 Y116.38 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192593
G1 F4193
M204 S6000
G1 X131.248 Y126.964 E.1302
M204 S10000
G1 X130.482 Y127.963 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.3829
G1 F4193
M204 S6000
G1 X130.418 Y128 E.00204
G1 X130.466 Y128.028 E.00155
M204 S10000
G1 X127.713 Y128 F42000
; LINE_WIDTH: 0.41999
G1 F4193
M204 S6000
G1 X130.632 Y128.384 E.09045
G1 X130.674 Y128.318 E.00243
G1 X130.807 Y128.288 E.00417
G2 X130.802 Y127.709 I-3.007 J-.266 E.01783
G1 X130.675 Y127.68 E.00401
G1 X130.634 Y127.616 E.00236
G1 X127.773 Y127.992 E.08866
M204 S10000
G1 X126.79 Y128.259 F42000
G1 F4193
M204 S6000
G1 X130.789 Y128.785 E.12392
G1 X130.877 Y128.636 E.00532
G3 X131.17 Y128.63 I.154 J.4 E.00919
G2 X131.16 Y127.37 I-9.092 J-.564 E.03876
G1 X130.876 Y127.361 E.00873
G1 X130.777 Y127.216 E.0054
G1 X126.776 Y127.743 E.12401
G1 X126.758 Y127.869 E.0039
G1 X126.615 Y127.969 E.00537
G1 X126.392 Y128 E.00693
G1 X126.615 Y128.031 E.00693
G1 X126.758 Y128.131 E.00537
G1 X126.776 Y128.201 E.00221
M204 S10000
G1 X131.248 Y129.036 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.191503
G1 F4193
M204 S6000
G1 X129.856 Y139.62 E.12925
M204 S10000
G1 X124.971 Y139.414 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50496
G1 F4193
M204 S6000
G1 X125.155 Y139.437 E.00697
; LINE_WIDTH: 0.531718
G1 X125.224 Y139.421 E.00283
; LINE_WIDTH: 0.581713
G1 X125.293 Y139.404 E.00312
; LINE_WIDTH: 0.631708
G1 X125.362 Y139.388 E.00341
; LINE_WIDTH: 0.681703
G1 X125.432 Y139.372 E.0037
; LINE_WIDTH: 0.70685
G1 X129.212 Y139.87 E.2063
; LINE_WIDTH: 0.68666
G1 X129.27 Y139.898 E.00338
; LINE_WIDTH: 0.64598
G1 X129.328 Y139.926 E.00317
; LINE_WIDTH: 0.6053
G1 X129.386 Y139.955 E.00296
; LINE_WIDTH: 0.56462
M73 P66 R6
G1 X129.444 Y139.983 E.00274
; LINE_WIDTH: 0.512467
G2 X129.585 Y140.022 I.129 J-.192 E.00569
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7666.969
G1 X129.444 Y139.983 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/73
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z7.8 I1.17 J-.335 P1  F42000
G1 X126.412 Y129.41 Z7.8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4193
M204 S6000
G1 X126.517 Y128.618 E.02651
G1 X130.947 Y129.201 E.14822
G1 X129.606 Y139.382 E.34062
G1 X125.176 Y138.799 E.14822
G1 X125.788 Y134.153 E.15544
G1 X126.404 Y129.47 E.15668
M204 S10000
G1 X126.816 Y129.464 F42000
G1 F4193
M204 S6000
G1 X126.867 Y129.075 E.01301
G1 X130.49 Y129.552 E.12121
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.191 Y134.206 E.14193
G1 X126.808 Y129.523 E.15668
M204 S250
G1 X127.205 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4193
M204 S5000
G1 X130.05 Y129.889 E.08819
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.58 Y134.257 E.11943
G1 X127.197 Y129.574 E.14514
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.185 Y129.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.309 Y127.278 Z8 F42000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4193
M204 S6000
G1 X126.517 Y127.382 E.02651
G1 X125.176 Y117.201 E.34062
G1 X127.629 Y116.879 E.08206
G1 X129.606 Y116.618 E.06616
G1 X130.947 Y126.799 E.34062
G1 X127.368 Y127.27 E.11972
M204 S10000
G1 X127.256 Y126.874 F42000
G1 F4193
M204 S6000
G1 X126.867 Y126.925 E.01301
G1 X125.633 Y117.552 E.31361
G1 X127.682 Y117.282 E.06856
G1 X129.256 Y117.075 E.05266
G1 X130.49 Y126.448 E.31361
G1 X127.315 Y126.866 E.10622
M204 S250
G1 X127.205 Y126.485 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4193
M204 S5000
G1 X126.073 Y117.889 E.2664
G1 X127.733 Y117.671 E.05146
G1 X128.918 Y117.515 E.03673
G1 X130.05 Y126.111 E.2664
G1 X127.264 Y126.477 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.989 Y124.496 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.756 Y132.028 Z8 F42000
G1 X124.485 Y139.788 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4193
M204 S6000
G1 X125.981 Y128.417 E.38043
G2 X125.981 Y127.583 I-5.583 J-.417 E.02771
G1 X124.485 Y116.212 E.38043
G1 X130.018 Y115.483 E.18516
G1 X131.513 Y126.832 E.37969
G3 X131.513 Y129.168 I-9.077 J1.168 E.07772
G1 X130.018 Y140.517 E.37969
G1 X124.544 Y139.795 E.18317
M204 S10000
G1 X124.028 Y140.138 F42000
G1 F4193
M204 S6000
G1 X125.577 Y128.369 E.39377
G2 X125.577 Y127.631 I-4.972 J-.369 E.02449
G1 X124.028 Y115.862 E.39377
G1 X130.369 Y115.027 E.21216
G1 X131.917 Y126.783 E.39334
G3 X131.917 Y129.217 I-9.483 J1.217 E.08096
G1 X130.369 Y140.973 E.39334
G1 X124.087 Y140.146 E.21017
M204 S250
G1 X123.614 Y140.278 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4193
M204 S5000
G1 X125.188 Y128.322 E.37052
G2 X125.188 Y127.678 I-4.385 J-.322 E.01982
G1 X123.614 Y115.72 E.37059
G3 X123.772 Y115.5 I.191 J-.029 E.00924
G1 X130.509 Y114.613 E.20878
G3 X130.582 Y114.615 I.03 J.215 E.00225
G3 X130.732 Y114.784 I-.044 J.191 E.00743
G1 X132.306 Y126.736 E.37041
G3 X132.306 Y129.264 I-9.873 J1.264 E.07789
G1 X130.733 Y141.215 E.37038
G3 X130.51 Y141.387 I-.193 J-.019 E.00968
G1 X123.77 Y140.499 E.20891
G3 X123.614 Y140.338 I.037 J-.192 E.00734
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.874 Y138.355 E-.76
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


G1 X124.874 Y138.964 F42000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.193362
G1 F4193
M204 S6000
G1 X126.266 Y128.38 E.13087
M204 S10000
G1 X126.266 Y127.62 F42000
; LINE_WIDTH: 0.193364
G1 F4193
M204 S6000
G1 X124.874 Y117.036 E.13087
M204 S10000
G1 X124.971 Y116.586 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50328
G1 F4193
M204 S6000
G1 X125.115 Y116.567 E.00544
; LINE_WIDTH: 0.523626
G1 X125.178 Y116.579 E.00253
; LINE_WIDTH: 0.564318
G1 X125.242 Y116.591 E.00274
; LINE_WIDTH: 0.60501
G1 X125.305 Y116.603 E.00295
; LINE_WIDTH: 0.645702
G1 X125.368 Y116.616 E.00317
; LINE_WIDTH: 0.70654
G1 X125.432 Y116.628 E.00349
G1 X129.212 Y116.13 E.20617
; LINE_WIDTH: 0.68668
G1 X129.27 Y116.102 E.00338
; LINE_WIDTH: 0.646
G1 X129.328 Y116.074 E.00317
; LINE_WIDTH: 0.60532
G1 X129.386 Y116.045 E.00296
; LINE_WIDTH: 0.56464
G1 X129.444 Y116.017 E.00274
; LINE_WIDTH: 0.512425
G3 X129.585 Y115.978 I.13 J.194 E.00572
M204 S10000
G1 X129.856 Y116.38 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192597
G1 F4193
M204 S6000
G1 X131.248 Y126.964 E.1302
M204 S10000
G1 X130.482 Y127.963 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38288
G1 F4193
M204 S6000
G1 X130.418 Y128 E.00204
G1 X130.466 Y128.028 E.00155
M204 S10000
G1 X127.713 Y128 F42000
; LINE_WIDTH: 0.41999
G1 F4193
M204 S6000
G1 X130.632 Y128.384 E.09045
G1 X130.674 Y128.318 E.00243
G1 X130.807 Y128.288 E.00417
G2 X130.802 Y127.709 I-3.006 J-.266 E.01783
G1 X130.675 Y127.68 E.00401
G1 X130.634 Y127.616 E.00236
G1 X127.773 Y127.992 E.08866
M204 S10000
G1 X126.79 Y128.259 F42000
G1 F4193
M204 S6000
G1 X130.789 Y128.785 E.12392
G1 X130.877 Y128.636 E.00532
G3 X131.17 Y128.63 I.154 J.4 E.00919
G2 X131.16 Y127.37 I-9.097 J-.564 E.03876
G1 X130.876 Y127.361 E.00873
G1 X130.777 Y127.216 E.0054
G1 X126.776 Y127.743 E.12401
G1 X126.758 Y127.869 E.0039
G1 X126.615 Y127.969 E.00537
G1 X126.392 Y128 E.00693
G1 X126.615 Y128.031 E.00693
G1 X126.758 Y128.131 E.00537
G1 X126.776 Y128.201 E.00221
M204 S10000
G1 X131.248 Y129.036 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.191511
G1 F4193
M204 S6000
G1 X129.856 Y139.62 E.12926
M204 S10000
G1 X124.971 Y139.414 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.505
G1 F4193
M204 S6000
G1 X125.155 Y139.437 E.00697
; LINE_WIDTH: 0.531753
G1 X125.224 Y139.421 E.00283
; LINE_WIDTH: 0.581738
G1 X125.293 Y139.404 E.00312
; LINE_WIDTH: 0.631723
G1 X125.362 Y139.388 E.00341
; LINE_WIDTH: 0.681708
G1 X125.432 Y139.372 E.0037
; LINE_WIDTH: 0.70686
G1 X129.212 Y139.87 E.2063
; LINE_WIDTH: 0.68668
G1 X129.27 Y139.898 E.00338
; LINE_WIDTH: 0.646
G1 X129.328 Y139.926 E.00317
; LINE_WIDTH: 0.60532
G1 X129.386 Y139.955 E.00296
; LINE_WIDTH: 0.56464
G1 X129.444 Y139.983 E.00274
; LINE_WIDTH: 0.512481
G2 X129.585 Y140.022 I.129 J-.192 E.00569
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7666.743
G1 X129.444 Y139.983 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/73
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z8 I1.17 J-.335 P1  F42000
G1 X126.412 Y129.41 Z8
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4192
M204 S6000
G1 X126.517 Y128.618 E.02651
G1 X130.947 Y129.201 E.14822
G1 X129.606 Y139.382 E.34062
G1 X125.176 Y138.799 E.14822
G1 X125.811 Y133.975 E.16138
G1 X126.404 Y129.47 E.15073
M204 S10000
G1 X126.816 Y129.464 F42000
G1 F4192
M204 S6000
G1 X126.867 Y129.075 E.01301
G1 X130.49 Y129.552 E.12121
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.215 Y134.028 E.14788
G1 X126.808 Y129.523 E.15073
M204 S250
G1 X127.205 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4192
M204 S5000
G1 X130.05 Y129.889 E.08819
M73 P67 R6
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.604 Y134.079 E.12494
G1 X127.197 Y129.574 E.13963
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.185 Y129.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y126.59 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4192
M204 S6000
G1 X125.176 Y117.201 E.31411
G1 X127.682 Y116.872 E.08383
G1 X129.606 Y116.618 E.06439
G1 X130.947 Y126.799 E.34062
G1 X126.517 Y127.382 E.14822
G1 X126.42 Y126.649 E.02452
M204 S10000
G1 X126.816 Y126.536 F42000
G1 F4192
M204 S6000
G1 X125.633 Y117.552 E.3006
G1 X127.735 Y117.275 E.07032
G1 X129.256 Y117.075 E.05089
G1 X130.49 Y126.448 E.31361
G1 X126.867 Y126.925 E.12121
G1 X126.824 Y126.596 E.01102
M204 S250
G1 X127.205 Y126.485 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4192
M204 S5000
G1 X126.073 Y117.889 E.2664
G1 X127.786 Y117.664 E.05309
G1 X128.918 Y117.515 E.03509
G1 X130.05 Y126.111 E.2664
G1 X127.264 Y126.477 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.989 Y124.496 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.756 Y132.028 Z8.2 F42000
G1 X124.485 Y139.788 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4192
M204 S6000
G1 X125.982 Y128.417 E.38044
G2 X125.982 Y127.583 I-3.155 J-.417 E.02775
G1 X124.485 Y116.212 E.38043
G1 X130.018 Y115.483 E.18516
G1 X131.513 Y126.832 E.37969
G3 X131.513 Y129.168 I-9.078 J1.168 E.07771
G1 X130.018 Y140.517 E.37969
G1 X124.544 Y139.795 E.18317
M204 S10000
G1 X124.028 Y140.138 F42000
G1 F4192
M204 S6000
G1 X125.577 Y128.369 E.39378
G2 X125.577 Y127.631 I-4.977 J-.369 E.02449
G1 X124.028 Y115.862 E.39378
G1 X130.369 Y115.027 E.21216
G1 X131.917 Y126.783 E.39334
G3 X131.917 Y129.217 I-9.483 J1.217 E.08096
G1 X130.369 Y140.973 E.39334
G1 X124.087 Y140.146 E.21017
M204 S250
G1 X123.614 Y140.278 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4192
M204 S5000
G1 X125.188 Y128.322 E.37053
G2 X125.188 Y127.678 I-4.385 J-.322 E.01982
G1 X123.614 Y115.72 E.3706
G3 X123.772 Y115.5 I.19 J-.03 E.00924
G1 X130.509 Y114.613 E.20878
G3 X130.582 Y114.615 I.03 J.215 E.00225
G3 X130.732 Y114.784 I-.044 J.191 E.00743
G1 X132.306 Y126.736 E.37041
G3 X132.306 Y129.264 I-9.873 J1.264 E.07789
G1 X130.732 Y141.216 E.37041
G3 X130.511 Y141.387 I-.194 J-.021 E.00962
G1 X123.77 Y140.499 E.20892
G3 X123.614 Y140.338 I.036 J-.191 E.00734
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.874 Y138.355 E-.76
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


G1 X124.874 Y138.964 F42000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.19337
G1 F4192
M204 S6000
G1 X126.266 Y128.38 E.13087
M204 S10000
G1 X126.266 Y127.62 F42000
; LINE_WIDTH: 0.193364
G1 F4192
M204 S6000
G1 X124.874 Y117.036 E.13087
M204 S10000
G1 X124.971 Y116.586 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50327
G1 F4192
M204 S6000
G1 X125.115 Y116.567 E.00544
; LINE_WIDTH: 0.52363
G1 X125.178 Y116.579 E.00253
; LINE_WIDTH: 0.56433
G1 X125.242 Y116.591 E.00274
; LINE_WIDTH: 0.60503
G1 X125.305 Y116.603 E.00295
; LINE_WIDTH: 0.64573
G1 X125.368 Y116.616 E.00317
; LINE_WIDTH: 0.70656
G1 X125.432 Y116.628 E.00349
G1 X129.212 Y116.13 E.20618
; LINE_WIDTH: 0.68668
G1 X129.27 Y116.102 E.00338
; LINE_WIDTH: 0.646
G1 X129.328 Y116.074 E.00317
; LINE_WIDTH: 0.60532
G1 X129.386 Y116.045 E.00296
; LINE_WIDTH: 0.56464
G1 X129.444 Y116.017 E.00274
; LINE_WIDTH: 0.512426
G3 X129.585 Y115.978 I.13 J.194 E.00572
M204 S10000
G1 X129.856 Y116.38 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192589
G1 F4192
M204 S6000
G1 X131.248 Y126.964 E.13019
M204 S10000
G1 X130.482 Y127.963 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.3829
G1 F4192
M204 S6000
G1 X130.418 Y128 E.00204
G1 X130.466 Y128.028 E.00155
M204 S10000
G1 X127.714 Y128 F42000
; LINE_WIDTH: 0.41999
G1 F4192
M204 S6000
G1 X130.632 Y128.384 E.09045
G1 X130.674 Y128.318 E.00243
G1 X130.807 Y128.288 E.00417
G2 X130.802 Y127.709 I-3.006 J-.266 E.01783
G1 X130.675 Y127.68 E.00401
G1 X130.634 Y127.616 E.00235
G1 X127.773 Y127.992 E.08866
M204 S10000
G1 X126.79 Y128.259 F42000
G1 F4192
M204 S6000
G1 X130.789 Y128.785 E.12392
G1 X130.877 Y128.636 E.00532
G3 X131.17 Y128.63 I.154 J.4 E.00919
G2 X131.16 Y127.37 I-9.097 J-.564 E.03876
G1 X130.876 Y127.361 E.00873
G1 X130.777 Y127.216 E.00539
G1 X126.776 Y127.743 E.12401
G1 X126.758 Y127.869 E.0039
G1 X126.615 Y127.969 E.00537
G1 X126.392 Y128 E.00693
G1 X126.615 Y128.031 E.00693
G1 X126.758 Y128.131 E.00537
G1 X126.776 Y128.201 E.00221
M204 S10000
G1 X131.248 Y129.036 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.191512
G1 F4192
M204 S6000
G1 X129.856 Y139.62 E.12926
M204 S10000
G1 X124.971 Y139.414 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50504
G1 F4192
M204 S6000
G1 X125.155 Y139.437 E.00697
; LINE_WIDTH: 0.531793
G1 X125.224 Y139.421 E.00283
; LINE_WIDTH: 0.581778
G1 X125.293 Y139.404 E.00312
; LINE_WIDTH: 0.631763
G1 X125.362 Y139.388 E.00341
; LINE_WIDTH: 0.681748
G1 X125.432 Y139.372 E.0037
; LINE_WIDTH: 0.70688
G1 X129.212 Y139.87 E.20631
; LINE_WIDTH: 0.686678
G1 X129.27 Y139.898 E.00338
; LINE_WIDTH: 0.645994
G1 X129.328 Y139.926 E.00317
; LINE_WIDTH: 0.60531
G1 X129.386 Y139.955 E.00296
; LINE_WIDTH: 0.564626
G1 X129.444 Y139.983 E.00274
; LINE_WIDTH: 0.512467
G2 X129.585 Y140.022 I.129 J-.192 E.00569
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7666.964
G1 X129.444 Y139.983 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/73
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z8.2 I1.17 J-.335 P1  F42000
G1 X126.412 Y129.41 Z8.2
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4193
M204 S6000
G1 X126.517 Y128.618 E.02651
G1 X130.947 Y129.201 E.14822
G1 X129.606 Y139.382 E.34062
G1 X125.176 Y138.799 E.14822
G1 X125.835 Y133.797 E.16733
G1 X126.404 Y129.47 E.14478
M204 S10000
G1 X126.816 Y129.464 F42000
G1 F4193
M204 S6000
G1 X126.867 Y129.075 E.01301
G1 X130.49 Y129.552 E.12121
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.238 Y133.85 E.15383
G1 X126.808 Y129.523 E.14478
M204 S250
G1 X127.205 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4193
M204 S5000
G1 X130.05 Y129.889 E.08819
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.627 Y133.902 E.13045
G1 X127.197 Y129.574 E.13411
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.185 Y129.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P68 R6
G1 X126.412 Y126.59 Z8.4 F42000
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4193
M204 S6000
G1 X125.176 Y117.201 E.31411
G1 X127.735 Y116.865 E.08559
G1 X129.606 Y116.618 E.06263
G1 X130.947 Y126.799 E.34062
G1 X126.517 Y127.382 E.14822
G1 X126.42 Y126.649 E.02452
M204 S10000
G1 X126.816 Y126.536 F42000
G1 F4193
M204 S6000
G1 X125.633 Y117.552 E.3006
G1 X127.788 Y117.268 E.07209
G1 X129.256 Y117.075 E.04912
G1 X130.49 Y126.448 E.31361
G1 X126.867 Y126.925 E.12121
G1 X126.824 Y126.596 E.01102
M204 S250
G1 X127.205 Y126.485 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4193
M204 S5000
G1 X126.073 Y117.889 E.2664
G1 X127.839 Y117.657 E.05473
G1 X128.918 Y117.515 E.03346
G1 X130.05 Y126.111 E.2664
G1 X127.264 Y126.477 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.989 Y124.496 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.756 Y132.028 Z8.4 F42000
G1 X124.485 Y139.788 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4193
M204 S6000
G1 X125.981 Y128.417 E.38043
G2 X125.983 Y127.593 I-4.392 J-.419 E.02737
G1 X124.485 Y116.212 E.38079
G1 X130.018 Y115.483 E.18516
G1 X131.513 Y126.832 E.37969
G3 X131.556 Y128.773 I-9.179 J1.176 E.06452
G1 X130.018 Y140.517 E.39288
G1 X124.544 Y139.795 E.18317
M204 S10000
G1 X124.028 Y140.138 F42000
G1 F4193
M204 S6000
G1 X125.577 Y128.369 E.39377
G2 X125.578 Y127.638 I-3.847 J-.37 E.02429
G1 X124.028 Y115.862 E.39399
G1 X130.369 Y115.027 E.21216
G1 X131.917 Y126.783 E.39334
G3 X131.961 Y128.808 I-9.593 J1.225 E.06732
G1 X130.369 Y140.973 E.40698
G1 X124.087 Y140.146 E.21017
M204 S250
G1 X123.614 Y140.278 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4193
M204 S5000
G1 X125.188 Y128.322 E.37053
G2 X125.188 Y127.68 I-3.321 J-.323 E.01976
G1 X123.614 Y115.72 E.37067
G3 X123.771 Y115.5 I.192 J-.028 E.00917
G1 X130.509 Y114.613 E.20883
G3 X130.582 Y114.615 I.03 J.215 E.00224
G3 X130.732 Y114.784 I-.043 J.19 E.00745
G1 X132.306 Y126.736 E.37041
G3 X132.306 Y129.264 I-10.793 J1.264 E.07785
G1 X130.733 Y141.215 E.37038
G3 X130.51 Y141.387 I-.194 J-.02 E.00966
G1 X123.77 Y140.499 E.20892
G3 X123.614 Y140.338 I.037 J-.192 E.00734
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.874 Y138.355 E-.76
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


G1 X124.874 Y138.964 F42000
G1 Z8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.193363
G1 F4193
M204 S6000
G1 X126.266 Y128.38 E.13087
M204 S10000
G1 X126.192 Y127.63 F42000
; LINE_WIDTH: 0.19228
G1 F4193
M204 S6000
G1 X126.257 Y127.546 E.0013
G1 X124.874 Y117.036 E.12901
M204 S10000
G1 X124.971 Y116.586 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50327
G1 F4193
M204 S6000
G1 X125.114 Y116.567 E.00542
; LINE_WIDTH: 0.523626
G1 X125.178 Y116.579 E.00253
; LINE_WIDTH: 0.564318
G1 X125.241 Y116.591 E.00274
; LINE_WIDTH: 0.60501
G1 X125.304 Y116.603 E.00295
; LINE_WIDTH: 0.645702
G1 X125.368 Y116.616 E.00317
; LINE_WIDTH: 0.70654
G1 X125.431 Y116.628 E.00349
G1 X129.212 Y116.13 E.2062
; LINE_WIDTH: 0.686678
G1 X129.27 Y116.102 E.00338
; LINE_WIDTH: 0.645994
G1 X129.328 Y116.074 E.00317
; LINE_WIDTH: 0.60531
G1 X129.386 Y116.045 E.00296
; LINE_WIDTH: 0.564626
G1 X129.444 Y116.017 E.00274
; LINE_WIDTH: 0.512411
G3 X129.585 Y115.978 I.13 J.194 E.00572
M204 S10000
G1 X129.856 Y116.38 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192593
G1 F4193
M204 S6000
G1 X131.248 Y126.964 E.1302
M204 S10000
G1 X130.482 Y127.963 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38288
G1 F4193
M204 S6000
G1 X130.418 Y128 E.00204
G1 X130.466 Y128.028 E.00155
M204 S10000
G1 X127.713 Y128 F42000
; LINE_WIDTH: 0.41999
G1 F4193
M204 S6000
G1 X130.632 Y128.384 E.09045
G1 X130.674 Y128.318 E.00243
G1 X130.807 Y128.288 E.00417
G2 X130.802 Y127.709 I-3.006 J-.266 E.01783
G1 X130.675 Y127.68 E.00401
G1 X130.634 Y127.616 E.00236
G1 X127.773 Y127.992 E.08866
M204 S10000
G1 X126.79 Y128.259 F42000
; LINE_WIDTH: 0.418617
G1 F4193
M204 S6000
G1 X130.789 Y128.785 E.12347
G1 X130.877 Y128.636 E.0053
G3 X131.17 Y128.63 I.154 J.4 E.00915
G2 X131.16 Y127.37 I-9.096 J-.564 E.03862
G1 X130.876 Y127.361 E.0087
G1 X130.777 Y127.216 E.00538
G1 X126.691 Y127.754 E.12615
G1 X126.421 Y128.054 E.01235
G1 X126.322 Y128.084 E.00317
G1 X126.697 Y128.061 E.01149
G3 X126.776 Y128.201 I-.095 J.146 E.00509
M204 S10000
G1 X131.248 Y129.036 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.191511
G1 F4193
M204 S6000
G1 X129.856 Y139.62 E.12926
M204 S10000
G1 X124.971 Y139.414 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.505
G1 F4193
M204 S6000
G1 X125.155 Y139.437 E.00697
; LINE_WIDTH: 0.531753
G1 X125.224 Y139.421 E.00283
; LINE_WIDTH: 0.581738
G1 X125.293 Y139.404 E.00312
; LINE_WIDTH: 0.631723
G1 X125.362 Y139.388 E.00341
; LINE_WIDTH: 0.681708
G1 X125.432 Y139.372 E.0037
; LINE_WIDTH: 0.70685
G1 X129.212 Y139.87 E.2063
; LINE_WIDTH: 0.68666
G1 X129.27 Y139.898 E.00338
; LINE_WIDTH: 0.64598
G1 X129.328 Y139.926 E.00317
; LINE_WIDTH: 0.6053
G1 X129.386 Y139.955 E.00296
; LINE_WIDTH: 0.56462
G1 X129.444 Y139.983 E.00274
; LINE_WIDTH: 0.512466
G2 X129.585 Y140.022 I.129 J-.192 E.00569
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7666.989
G1 X129.444 Y139.983 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/73
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z8.4 I1.17 J-.335 P1  F42000
G1 X126.412 Y129.41 Z8.4
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4189
M204 S6000
G1 X126.517 Y128.618 E.02651
G1 X130.947 Y129.201 E.14822
G1 X129.606 Y139.382 E.34062
G1 X125.176 Y138.799 E.14822
G1 X125.858 Y133.619 E.17328
G1 X126.404 Y129.47 E.13884
M204 S10000
G1 X126.816 Y129.464 F42000
G1 F4189
M204 S6000
G1 X126.867 Y129.075 E.01301
G1 X130.49 Y129.552 E.12121
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.262 Y133.673 E.15978
G1 X126.808 Y129.523 E.13884
M204 S250
G1 X127.205 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4189
M204 S5000
G1 X130.05 Y129.889 E.08819
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.65 Y133.724 E.13596
G1 X127.197 Y129.574 E.1286
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.185 Y129.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y126.59 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4189
M204 S6000
G1 X125.176 Y117.201 E.31411
G1 X127.787 Y116.858 E.08736
G1 X129.606 Y116.618 E.06086
G1 X130.947 Y126.799 E.34062
G1 X126.517 Y127.382 E.14822
G1 X126.42 Y126.649 E.02452
M204 S10000
G1 X126.816 Y126.536 F42000
G1 F4189
M204 S6000
G1 X125.633 Y117.552 E.30061
G1 X127.84 Y117.261 E.07386
G1 X129.256 Y117.075 E.04736
G1 X130.49 Y126.448 E.31361
G1 X126.867 Y126.925 E.12121
G1 X126.824 Y126.596 E.01102
M204 S250
G1 X127.205 Y126.485 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4189
M204 S5000
G1 X126.073 Y117.889 E.2664
G1 X127.892 Y117.65 E.05637
G1 X128.918 Y117.515 E.03182
G1 X130.05 Y126.111 E.2664
G1 X127.264 Y126.477 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.989 Y124.496 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.756 Y132.028 Z8.6 F42000
G1 X124.485 Y139.788 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4189
M204 S6000
G1 X125.983 Y128.407 E.38077
G2 X125.983 Y127.593 I-3.728 J-.407 E.02705
G1 X124.485 Y116.212 E.38077
G1 X130.018 Y115.483 E.18516
G1 X131.513 Y126.832 E.37969
G3 X131.556 Y128.773 I-9.179 J1.176 E.06452
G1 X130.018 Y140.517 E.39288
G1 X124.544 Y139.795 E.18317
M204 S10000
G1 X124.028 Y140.138 F42000
G1 F4189
M204 S6000
G1 X125.578 Y128.363 E.39398
G2 X125.578 Y127.637 I-3.245 J-.363 E.02411
G1 X124.028 Y115.862 E.39398
G1 X130.369 Y115.027 E.21216
G1 X131.917 Y126.783 E.39334
G3 X131.961 Y128.808 I-9.592 J1.225 E.06732
G1 X130.369 Y140.973 E.40698
G1 X124.087 Y140.146 E.21017
M204 S250
G1 X123.614 Y140.278 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4189
M204 S5000
G1 X125.188 Y128.32 E.3706
G2 X125.188 Y127.68 I-2.784 J-.32 E.0197
G1 X123.614 Y115.72 E.37067
G3 X123.771 Y115.5 I.192 J-.028 E.00917
G1 X130.509 Y114.613 E.20883
G3 X130.582 Y114.615 I.03 J.214 E.00224
G3 X130.732 Y114.784 I-.042 J.19 E.00745
G1 X132.306 Y126.736 E.37041
G3 X132.306 Y129.264 I-10.795 J1.264 E.07785
G1 X130.733 Y141.215 E.37038
G3 X130.51 Y141.387 I-.193 J-.019 E.00968
G1 X123.77 Y140.499 E.20892
G3 X123.614 Y140.338 I.038 J-.192 E.00733
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.874 Y138.355 E-.76
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


G1 X124.874 Y138.964 F42000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192298
G1 F4189
M204 S6000
G1 X126.257 Y128.454 E.12903
M73 P68 R5
G1 X126.192 Y128.37 E.0013
M204 S10000
G1 X126.192 Y127.63 F42000
; LINE_WIDTH: 0.192293
M73 P69 R5
G1 F4189
M204 S6000
G1 X126.257 Y127.546 E.0013
G1 X124.874 Y117.036 E.12903
M204 S10000
G1 X124.971 Y116.586 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50328
G1 F4189
M204 S6000
G1 X125.114 Y116.567 E.00542
; LINE_WIDTH: 0.523626
G1 X125.178 Y116.579 E.00253
; LINE_WIDTH: 0.564318
G1 X125.241 Y116.591 E.00274
; LINE_WIDTH: 0.60501
G1 X125.304 Y116.603 E.00295
; LINE_WIDTH: 0.645702
G1 X125.368 Y116.616 E.00317
; LINE_WIDTH: 0.70654
G1 X125.431 Y116.628 E.00349
G1 X129.212 Y116.13 E.2062
; LINE_WIDTH: 0.68668
G1 X129.27 Y116.102 E.00338
; LINE_WIDTH: 0.646
G1 X129.328 Y116.074 E.00317
; LINE_WIDTH: 0.60532
G1 X129.386 Y116.045 E.00296
; LINE_WIDTH: 0.56464
G1 X129.444 Y116.017 E.00274
; LINE_WIDTH: 0.512425
G3 X129.585 Y115.978 I.13 J.194 E.00573
M204 S10000
G1 X129.856 Y116.38 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192594
G1 F4189
M204 S6000
G1 X131.248 Y126.964 E.1302
M204 S10000
G1 X130.482 Y127.963 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F4189
M204 S6000
G1 X130.418 Y128 E.00204
G1 X130.466 Y128.028 E.00155
M204 S10000
G1 X127.713 Y128 F42000
; LINE_WIDTH: 0.41999
G1 F4189
M204 S6000
G1 X130.632 Y128.384 E.09045
G1 X130.674 Y128.318 E.00243
G1 X130.807 Y128.288 E.00417
G2 X130.802 Y127.709 I-3.007 J-.266 E.01783
G1 X130.675 Y127.68 E.00401
G1 X130.634 Y127.616 E.00236
G1 X127.773 Y127.992 E.08866
M204 S10000
G1 X126.691 Y127.754 F42000
G1 F4189
M204 S6000
G1 X126.534 Y128 E.00897
G1 X126.691 Y128.246 E.00897
G1 X130.789 Y128.785 E.12699
G1 X130.877 Y128.636 E.00532
G3 X131.17 Y128.63 I.154 J.4 E.00919
G2 X131.16 Y127.37 I-9.096 J-.564 E.03876
G1 X130.876 Y127.361 E.00873
G1 X130.777 Y127.216 E.0054
G1 X126.751 Y127.746 E.12477
M204 S10000
G1 X131.248 Y129.036 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.191503
G1 F4189
M204 S6000
G1 X129.856 Y139.62 E.12925
M204 S10000
G1 X124.971 Y139.414 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.505
G1 F4189
M204 S6000
G1 X125.154 Y139.437 E.00695
; LINE_WIDTH: 0.531753
G1 X125.223 Y139.42 E.00283
; LINE_WIDTH: 0.581738
G1 X125.293 Y139.404 E.00312
; LINE_WIDTH: 0.631723
G1 X125.362 Y139.388 E.00341
; LINE_WIDTH: 0.681708
G1 X125.431 Y139.372 E.0037
; LINE_WIDTH: 0.70685
G1 X129.212 Y139.87 E.20633
; LINE_WIDTH: 0.68666
G1 X129.27 Y139.898 E.00338
; LINE_WIDTH: 0.64598
G1 X129.328 Y139.926 E.00317
; LINE_WIDTH: 0.6053
G1 X129.386 Y139.955 E.00296
; LINE_WIDTH: 0.56462
G1 X129.444 Y139.983 E.00274
; LINE_WIDTH: 0.512467
G2 X129.585 Y140.022 I.129 J-.192 E.00569
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7666.977
G1 X129.444 Y139.983 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 42/73
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z8.6 I1.17 J-.335 P1  F42000
G1 X126.412 Y129.41 Z8.6
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4191
M204 S6000
G1 X126.517 Y128.618 E.02651
G1 X130.947 Y129.201 E.14822
G1 X129.606 Y139.382 E.34062
G1 X125.176 Y138.799 E.14822
G1 X125.882 Y133.442 E.17923
G1 X126.404 Y129.47 E.13289
M204 S10000
G1 X126.816 Y129.464 F42000
G1 F4191
M204 S6000
G1 X126.867 Y129.075 E.01301
G1 X130.49 Y129.552 E.12121
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.285 Y133.495 E.16573
G1 X126.808 Y129.523 E.13289
M204 S250
G1 X127.205 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4191
M204 S5000
G1 X130.05 Y129.889 E.08819
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.674 Y133.546 E.14147
G1 X127.197 Y129.574 E.12309
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.185 Y129.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y126.59 Z8.8 F42000
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4191
M204 S6000
G1 X125.176 Y117.201 E.31411
G1 X127.84 Y116.851 E.08913
G1 X129.606 Y116.618 E.05909
G1 X130.947 Y126.799 E.34062
G1 X126.517 Y127.382 E.14822
G1 X126.42 Y126.649 E.02452
M204 S10000
G1 X126.816 Y126.536 F42000
G1 F4191
M204 S6000
G1 X125.633 Y117.552 E.30061
G1 X127.893 Y117.254 E.07562
G1 X129.256 Y117.075 E.04559
G1 X130.49 Y126.448 E.31361
G1 X126.867 Y126.925 E.12121
G1 X126.824 Y126.596 E.01102
M204 S250
G1 X127.205 Y126.485 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4191
M204 S5000
G1 X126.073 Y117.889 E.2664
G1 X127.944 Y117.643 E.058
G1 X128.918 Y117.515 E.03018
G1 X130.05 Y126.111 E.2664
G1 X127.264 Y126.477 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.989 Y124.496 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.756 Y132.028 Z8.8 F42000
G1 X124.485 Y139.788 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4191
M204 S6000
G1 X125.981 Y128.417 E.38043
G2 X125.981 Y127.583 I-5.588 J-.417 E.0277
G1 X124.485 Y116.212 E.38043
G1 X130.018 Y115.483 E.18516
G1 X131.513 Y126.832 E.37969
G3 X131.556 Y128.773 I-9.179 J1.176 E.06452
G1 X130.018 Y140.517 E.39288
G1 X124.544 Y139.795 E.18317
M204 S10000
G1 X124.028 Y140.138 F42000
G1 F4191
M204 S6000
G1 X125.577 Y128.369 E.39378
G2 X125.577 Y127.631 I-4.976 J-.369 E.02449
G1 X124.028 Y115.862 E.39377
G1 X130.369 Y115.027 E.21216
G1 X131.917 Y126.783 E.39334
G3 X131.961 Y128.808 I-9.593 J1.225 E.06732
G1 X130.369 Y140.973 E.40698
G1 X124.087 Y140.146 E.21017
M204 S250
G1 X123.614 Y140.277 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4191
M204 S5000
G1 X125.188 Y128.322 E.37052
G2 X125.188 Y127.678 I-4.389 J-.322 E.01982
G1 X123.614 Y115.72 E.3706
G3 X123.772 Y115.5 I.191 J-.029 E.00923
G1 X130.509 Y114.613 E.20878
G3 X130.581 Y114.615 I.03 J.215 E.00225
G3 X130.733 Y114.785 I-.042 J.19 E.00748
G1 X132.306 Y126.736 E.37038
G3 X132.306 Y129.264 I-10.793 J1.264 E.07785
G1 X130.733 Y141.215 E.37038
G3 X130.51 Y141.387 I-.194 J-.02 E.00966
G1 X123.77 Y140.499 E.20892
G3 X123.614 Y140.338 I.036 J-.191 E.00735
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.874 Y138.355 E-.76
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


G1 X124.874 Y138.964 F42000
G1 Z8.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.19337
G1 F4191
M204 S6000
G1 X126.266 Y128.38 E.13087
M204 S10000
G1 X126.266 Y127.62 F42000
; LINE_WIDTH: 0.193364
G1 F4191
M204 S6000
G1 X124.874 Y117.036 E.13087
M204 S10000
G1 X124.971 Y116.586 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50328
G1 F4191
M204 S6000
G1 X125.115 Y116.567 E.00544
; LINE_WIDTH: 0.523626
G1 X125.178 Y116.579 E.00253
; LINE_WIDTH: 0.564318
G1 X125.242 Y116.591 E.00274
; LINE_WIDTH: 0.60501
G1 X125.305 Y116.603 E.00295
; LINE_WIDTH: 0.645702
G1 X125.368 Y116.616 E.00317
; LINE_WIDTH: 0.70654
G1 X125.432 Y116.628 E.00349
G1 X129.212 Y116.13 E.20617
; LINE_WIDTH: 0.68668
G1 X129.27 Y116.102 E.00338
; LINE_WIDTH: 0.646
G1 X129.328 Y116.074 E.00317
; LINE_WIDTH: 0.60532
G1 X129.386 Y116.045 E.00296
; LINE_WIDTH: 0.56464
G1 X129.444 Y116.017 E.00274
; LINE_WIDTH: 0.512431
G3 X129.585 Y115.978 I.13 J.194 E.00572
M204 S10000
G1 X129.856 Y116.38 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192591
G1 F4191
M204 S6000
G1 X131.248 Y126.964 E.1302
M204 S10000
G1 X130.482 Y127.963 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.3829
G1 F4191
M204 S6000
G1 X130.418 Y128 E.00204
G1 X130.466 Y128.028 E.00155
M204 S10000
G1 X127.713 Y128 F42000
; LINE_WIDTH: 0.41999
G1 F4191
M204 S6000
G1 X130.632 Y128.384 E.09045
G1 X130.674 Y128.318 E.00243
G1 X130.807 Y128.288 E.00417
G2 X130.802 Y127.709 I-3.006 J-.266 E.01783
G1 X130.675 Y127.68 E.00401
G1 X130.634 Y127.616 E.00236
G1 X127.773 Y127.992 E.08866
M204 S10000
G1 X126.79 Y128.259 F42000
G1 F4191
M204 S6000
G1 X130.789 Y128.785 E.12392
G1 X130.877 Y128.636 E.00532
G3 X131.17 Y128.63 I.154 J.4 E.00919
M73 P70 R5
G2 X131.16 Y127.37 I-9.096 J-.564 E.03876
G1 X130.876 Y127.361 E.00873
G1 X130.777 Y127.216 E.0054
G1 X126.776 Y127.743 E.124
G1 X126.758 Y127.869 E.0039
G1 X126.615 Y127.969 E.00537
G1 X126.392 Y128 E.00693
G1 X126.615 Y128.031 E.00693
G1 X126.758 Y128.131 E.00537
G1 X126.776 Y128.201 E.00221
M204 S10000
G1 X131.248 Y129.036 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.191503
G1 F4191
M204 S6000
G1 X129.856 Y139.62 E.12925
M204 S10000
G1 X124.971 Y139.414 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50498
G1 F4191
M204 S6000
G1 X125.155 Y139.437 E.00697
; LINE_WIDTH: 0.531733
G1 X125.224 Y139.421 E.00283
; LINE_WIDTH: 0.581718
G1 X125.293 Y139.404 E.00312
; LINE_WIDTH: 0.631703
G1 X125.362 Y139.388 E.00341
; LINE_WIDTH: 0.681688
G1 X125.432 Y139.372 E.0037
; LINE_WIDTH: 0.70685
G1 X129.212 Y139.87 E.2063
; LINE_WIDTH: 0.686678
G1 X129.27 Y139.898 E.00338
; LINE_WIDTH: 0.645994
G1 X129.328 Y139.926 E.00317
; LINE_WIDTH: 0.60531
G1 X129.386 Y139.955 E.00296
; LINE_WIDTH: 0.564626
G1 X129.444 Y139.983 E.00274
; LINE_WIDTH: 0.512467
G2 X129.585 Y140.022 I.129 J-.192 E.00569
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F7666.964
G1 X129.444 Y139.983 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 43/73
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z8.8 I1.17 J-.335 P1  F42000
G1 X126.412 Y129.41 Z8.8
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4386
M204 S6000
G1 X126.517 Y128.618 E.02651
G1 X130.947 Y129.201 E.14822
G1 X129.606 Y139.382 E.34062
G1 X125.176 Y138.799 E.14822
G1 X125.905 Y133.264 E.18518
G1 X126.404 Y129.47 E.12694
M204 S10000
G1 X126.816 Y129.464 F42000
G1 F4386
M204 S6000
G1 X126.867 Y129.075 E.01301
G1 X130.49 Y129.552 E.12121
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.309 Y133.317 E.17168
G1 X126.808 Y129.523 E.12694
M204 S250
G1 X127.205 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4386
M204 S5000
G1 X130.05 Y129.889 E.08819
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.697 Y133.368 E.14698
G1 X127.197 Y129.574 E.11758
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.185 Y129.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.309 Y127.278 Z9 F42000
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4386
M204 S6000
G1 X126.517 Y127.382 E.02651
G1 X125.176 Y117.201 E.34062
G1 X127.893 Y116.844 E.09089
G1 X129.606 Y116.618 E.05733
G1 X130.947 Y126.799 E.34062
G1 X127.368 Y127.27 E.11972
M204 S10000
G1 X127.256 Y126.874 F42000
G1 F4386
M204 S6000
G1 X126.867 Y126.925 E.01301
G1 X125.633 Y117.552 E.31361
G1 X127.946 Y117.247 E.07739
G1 X129.256 Y117.075 E.04382
G1 X130.49 Y126.448 E.31361
G1 X127.315 Y126.866 E.10622
M204 S250
G1 X127.205 Y126.485 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4386
M204 S5000
G1 X126.073 Y117.889 E.2664
G1 X127.997 Y117.636 E.05964
G1 X128.918 Y117.515 E.02855
G1 X130.05 Y126.111 E.2664
G1 X127.264 Y126.477 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.989 Y124.496 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.756 Y132.028 Z9 F42000
G1 X124.485 Y139.788 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4386
M204 S6000
G1 X125.981 Y128.417 E.38043
G2 X125.983 Y127.594 I-4.389 J-.419 E.02737
G1 X124.485 Y116.212 E.38079
G1 X130.018 Y115.483 E.18516
G1 X131.513 Y126.832 E.37969
G3 X131.513 Y129.168 I-9.914 J1.168 E.07768
G1 X130.018 Y140.517 E.37969
G1 X124.544 Y139.795 E.18317
M204 S10000
G1 X124.028 Y140.138 F42000
G1 F4386
M204 S6000
G1 X125.577 Y128.369 E.39378
G2 X125.578 Y127.638 I-3.844 J-.37 E.02429
G1 X124.028 Y115.862 E.39399
G1 X130.369 Y115.027 E.21216
G1 X131.917 Y126.783 E.39334
G3 X131.917 Y129.217 I-10.363 J1.217 E.08092
G1 X130.369 Y140.973 E.39334
G1 X124.087 Y140.146 E.21017
M204 S250
G1 X123.614 Y140.278 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4386
M204 S5000
G1 X125.188 Y128.322 E.37053
G2 X125.188 Y127.68 I-3.321 J-.323 E.01976
G1 X123.614 Y115.72 E.37067
G3 X123.771 Y115.5 I.19 J-.03 E.00921
G1 X130.509 Y114.613 E.20882
G3 X130.581 Y114.615 I.031 J.215 E.00225
G3 X130.732 Y114.784 I-.044 J.191 E.00744
G1 X132.306 Y126.736 E.37041
G3 X132.306 Y129.264 I-10.794 J1.264 E.07785
G1 X130.733 Y141.215 E.37038
G3 X130.51 Y141.387 I-.194 J-.02 E.00966
G1 X123.77 Y140.499 E.20891
G3 X123.614 Y140.338 I.038 J-.192 E.00733
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.874 Y138.355 E-.76
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


G1 X124.874 Y138.964 F42000
G1 Z8.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.193362
G1 F4386
M204 S6000
G1 X126.266 Y128.38 E.13087
M204 S10000
G1 X126.192 Y127.63 F42000
; LINE_WIDTH: 0.192286
G1 F4386
M204 S6000
G1 X126.257 Y127.546 E.0013
G1 X124.874 Y117.036 E.12902
M204 S10000
G1 X124.971 Y116.586 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50327
G1 F4386
M204 S6000
G1 X125.114 Y116.567 E.00542
; LINE_WIDTH: 0.523626
G1 X125.178 Y116.579 E.00253
; LINE_WIDTH: 0.564318
G1 X125.241 Y116.591 E.00274
; LINE_WIDTH: 0.60501
G1 X125.304 Y116.603 E.00295
; LINE_WIDTH: 0.645702
G1 X125.368 Y116.616 E.00317
; LINE_WIDTH: 0.70654
G1 X125.431 Y116.628 E.00349
G1 X129.212 Y116.13 E.2062
; LINE_WIDTH: 0.68668
G1 X129.27 Y116.102 E.00338
; LINE_WIDTH: 0.646
G1 X129.328 Y116.074 E.00317
; LINE_WIDTH: 0.60532
G1 X129.386 Y116.045 E.00296
; LINE_WIDTH: 0.56464
G1 X129.444 Y116.017 E.00274
; LINE_WIDTH: 0.512425
G3 X129.585 Y115.978 I.13 J.194 E.00572
M204 S10000
G1 X129.856 Y116.38 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192595
G1 F4386
M204 S6000
G1 X131.248 Y126.964 E.1302
M204 S10000
G1 X130.542 Y127.076 F42000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F4386
M204 S2000
G1 X131.365 Y127.899 E.03575
G1 X131.349 Y128.416
G1 X130.071 Y127.138 E.05552
G1 X129.6 Y127.2
G1 X131.137 Y128.738 E.06681
G1 X130.828 Y128.961
G1 X129.129 Y127.262 E.07384
G1 X128.657 Y127.324
G1 X130.214 Y128.881 E.06763
G1 X129.6 Y128.8
G1 X128.186 Y127.386 E.06142
G1 X127.795 Y127.529
G1 X128.986 Y128.719 E.05172
G1 X128.371 Y128.638
G1 X127.244 Y127.51 E.049
G1 X126.772 Y127.572
G1 X127.757 Y128.557 E.0428
G1 X127.143 Y128.476
G1 X126.463 Y127.796 E.02956
M204 S10000
G1 X126.698 Y127.647 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.148233
G1 F4386
M204 S6000
G2 X126.606 Y127.62 I-.145 J.322 E.00083
; LINE_WIDTH: 0.101809
G2 X126.518 Y127.712 I.12 J.201 E.00062
M204 S10000
G1 X126.517 Y128.208 F42000
; LINE_WIDTH: 0.111887
G1 F4386
M204 S6000
G1 X126.496 Y128.146 E.00037
G1 X126.336 Y127.959 E.00138
; WIPE_START
G1 F15000
G1 X126.496 Y128.146 E-.59987
G1 X126.517 Y128.208 E-.16013
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.275 Y128.49 Z9 F42000
G1 Z8.6
G1 E.8 F1800
; LINE_WIDTH: 0.133139
G1 F4386
M204 S6000
G1 X131.303 Y128.572 E.00064
G1 X131.292 Y128.777 E.00151
M204 S10000
G1 X131.248 Y129.036 F42000
; LINE_WIDTH: 0.191503
G1 F4386
M204 S6000
G1 X129.856 Y139.62 E.12925
M204 S10000
G1 X129.799 Y140.197 F42000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F4386
M204 S2000
G1 X129.147 Y139.546 E.02832
G1 X128.533 Y139.465
G1 X129.261 Y140.192 E.03162
G1 X128.646 Y140.111
G1 X127.919 Y139.384 E.03161
G1 X127.305 Y139.303
M73 P71 R5
G1 X128.032 Y140.031 E.03161
G1 X127.418 Y139.95
G1 X126.691 Y139.222 E.03161
G1 X126.077 Y139.141
G1 X126.804 Y139.869 E.03161
G1 X126.19 Y139.788
G1 X125.462 Y139.061 E.0316
G1 X125.085 Y139.216
G1 X125.576 Y139.707 E.02133
M204 S10000
G1 X125.077 Y139.224 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.195479
G1 F4386
M204 S6000
G1 X124.875 Y139.314 E.00275
; LINE_WIDTH: 0.229708
G1 X124.887 Y139.635 E.0049
; WIPE_START
G1 F15000
G1 X124.875 Y139.314 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.01 Y139.208 Z9 F42000
G1 Z8.6
G1 E.8 F1800
; LINE_WIDTH: 0.09477
G1 F4386
M204 S6000
G1 X125.791 Y139.1 E.00103
M204 S10000
G1 X127.238 Y139.37 F42000
; LINE_WIDTH: 0.0901437
G1 F4386
M204 S6000
G1 X127.019 Y139.262 E.00094
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X127.238 Y139.37 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 44/73
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z9 I1.213 J-.104 P1  F42000
G1 X126.188 Y127.086 Z9
G1 Z8.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4473
M204 S5000
G1 X131.661 Y127.807 E.16961
G1 X131.501 Y129.016 E.03749
G1 X126.029 Y128.296 E.16961
G1 X126.18 Y127.146 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.166 Y127.385 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y129.41 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4473
M204 S6000
G1 X125.247 Y138.26 E.29609
G1 X124.695 Y138.187 E.01847
G1 X125.894 Y129.084 E.30458
G1 X126.446 Y129.157 E.01847
G1 X126.42 Y129.351 E.0065
M204 S10000
G1 X126.816 Y129.464 F42000
G1 F4473
M204 S6000
G1 X126.867 Y129.075 E.01301
G1 X130.49 Y129.552 E.12121
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.332 Y133.139 E.17763
G1 X126.808 Y129.523 E.12099
M204 S250
G1 X127.205 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4473
M204 S5000
G1 X130.05 Y129.889 E.08819
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.721 Y133.19 E.15249
G1 X127.197 Y129.574 E.11207
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.185 Y129.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.876 Y129.74 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4473
M204 S6000
G1 X131.428 Y129.813 E.01847
G1 X130.229 Y138.916 E.30457
G1 X129.677 Y138.843 E.01847
G1 X130.868 Y129.8 E.30258
; WIPE_START
G1 F8843.478
G1 X131.428 Y129.813 E-.21279
G1 X131.24 Y131.24 E-.54721
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.622 Y138.848 Z9.2 F42000
G1 X130.58 Y139.373 Z9.2
G1 Z8.8
G1 E.8 F1800
G1 F4473
M204 S6000
G1 X124.239 Y138.538 E.21216
G1 X125.543 Y128.627 E.33158
G1 X131.884 Y129.462 E.21216
G1 X130.587 Y139.313 E.32959
; WIPE_START
G1 F8843.478
G1 X128.602 Y139.071 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.401 Y131.653 Z9.2 F42000
G1 X131.533 Y126.984 Z9.2
G1 Z8.8
G1 E.8 F1800
G1 F4473
M204 S6000
G1 X130.961 Y126.909 E.01912
G1 X129.606 Y116.618 E.3443
G1 X125.176 Y117.201 E.14822
G1 X126.375 Y126.305 E.30458
G1 X125.803 Y126.23 E.01912
G1 X124.485 Y116.212 E.33516
G1 X130.018 Y115.483 E.18516
G1 X131.525 Y126.924 E.38279
M204 S10000
G1 X131.979 Y127.453 F42000
G1 F4473
M204 S6000
G1 X128.231 Y126.96 E.1254
G1 X128.231 Y126.746 E.0071
G1 X130.49 Y126.448 E.07559
G1 X129.256 Y117.075 E.31361
G1 X125.633 Y117.552 E.12121
G1 X126.848 Y126.778 E.30868
G1 X125.85 Y126.646 E.03337
G1 X125.756 Y127.362 E.02395
G1 X125.542 Y127.362 E.0071
G1 X124.028 Y115.862 E.38478
G1 X130.369 Y115.027 E.21216
G1 X131.917 Y126.783 E.39334
G3 X131.975 Y127.393 I-7.644 J1.044 E.02034
; WIPE_START
G1 F8843.478
G1 X129.989 Y127.163 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.02 Y120.132 Z9.2 F42000
G1 X126.073 Y117.889 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4473
M204 S5000
G1 X128.05 Y117.629 E.06128
G1 X128.918 Y117.515 E.02691
G1 X130.05 Y126.111 E.2664
G1 X127.205 Y126.485 E.08819
G1 X126.081 Y117.949 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.05 Y117.629 E-.75815
G1 X128.055 Y117.628 E-.00185
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.843 Y125.164 Z9.2 F42000
G1 X124.622 Y138.984 Z9.2
G1 Z8.8
G1 E.8 F1800
G1 F4473
M204 S5000
G1 X130.094 Y139.704 E.16961
G1 X129.935 Y140.914 E.03749
G1 X124.462 Y140.193 E.16961
G1 X124.614 Y139.043 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.599 Y139.283 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.51 Y141.387 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
G1 F4473
M204 S5000
G1 X123.77 Y140.499 E.2089
G3 X123.614 Y140.278 I.036 J-.191 E.00922
G1 X125.188 Y128.322 E.37052
G2 X125.188 Y127.678 I-4.382 J-.322 E.01982
G1 X123.614 Y115.72 E.3706
G3 X123.77 Y115.501 I.19 J-.03 E.00916
G1 X130.509 Y114.613 E.20887
G3 X130.581 Y114.615 I.03 J.215 E.00224
G3 X130.733 Y114.785 I-.042 J.19 E.00748
G1 X132.306 Y126.736 E.37038
G3 X132.306 Y129.264 I-9.873 J1.264 E.07789
G1 X130.733 Y141.215 E.37038
G3 X130.571 Y141.387 I-.194 J-.02 E.0078
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.588 Y141.128 E-.76
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


G1 X130.321 Y141.165 F42000
G1 Z8.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.480847
G1 F4473
M204 S6000
G1 X130.531 Y139.564 E.05761
; WIPE_START
G1 F8220.551
G1 X130.321 Y141.165 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.98 Y138.678 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
; LINE_WIDTH: 0.192577
G1 F4473
M204 S6000
G1 X131.125 Y129.978 E.10701
; WIPE_START
G1 F15000
G1 X130.864 Y131.961 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.887 Y129.265 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
; LINE_WIDTH: 0.466962
G1 F4473
M204 S6000
G2 X131.983 Y128.404 I-18.596 J-2.498 E.02993
; LINE_WIDTH: 0.423327
G1 X132.014 Y128 E.01256
; LINE_WIDTH: 0.387805
G1 X132.032 Y127.658 E.00962
; WIPE_START
G1 F10438.288
G1 X132.014 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.062 Y126.058 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
; LINE_WIDTH: 0.192595
G1 F4473
M204 S6000
G1 X124.874 Y117.036 E.11099
M204 S10000
G1 X124.971 Y116.586 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50329
G1 F4473
M204 S6000
G1 X125.114 Y116.567 E.00542
; LINE_WIDTH: 0.523646
G1 X125.178 Y116.579 E.00253
; LINE_WIDTH: 0.564338
G1 X125.241 Y116.591 E.00274
; LINE_WIDTH: 0.60503
G1 X125.305 Y116.603 E.00295
; LINE_WIDTH: 0.645722
G1 X125.368 Y116.616 E.00317
; LINE_WIDTH: 0.706569
G1 X125.431 Y116.628 E.00349
G1 X129.212 Y116.13 E.2062
; LINE_WIDTH: 0.68672
G1 X129.27 Y116.102 E.00338
; LINE_WIDTH: 0.64604
G1 X129.328 Y116.074 E.00317
; LINE_WIDTH: 0.60536
G1 X129.386 Y116.046 E.00296
; LINE_WIDTH: 0.56468
G1 X129.444 Y116.017 E.00274
; LINE_WIDTH: 0.512477
G3 X129.585 Y115.978 I.13 J.194 E.00572
M204 S10000
G1 X129.856 Y116.38 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192606
G1 F4473
M204 S6000
G1 X131.219 Y126.737 E.12742
M204 S10000
G1 X130.748 Y126.853 F42000
; LINE_WIDTH: 0.429477
G1 F4473
M204 S6000
G1 X130.549 Y126.853 E.00627
; LINE_WIDTH: 0.385137
G1 X130.35 Y126.853 E.00555
; LINE_WIDTH: 0.340796
G1 X130.151 Y126.853 E.00483
; LINE_WIDTH: 0.296456
G1 X129.952 Y126.853 E.00411
; LINE_WIDTH: 0.252115
G1 X129.753 Y126.853 E.00339
; LINE_WIDTH: 0.207775
G1 X129.554 Y126.853 E.00267
; LINE_WIDTH: 0.163434
G1 X129.355 Y126.853 E.00195
; LINE_WIDTH: 0.119093
G1 X129.156 Y126.853 E.00124
; WIPE_START
G1 F15000
G1 X129.355 Y126.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.034 Y126.853 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
; LINE_WIDTH: 0.507827
G1 F4473
M204 S6000
G1 X127.708 Y126.853 E.01236
; LINE_WIDTH: 0.458948
G1 X127.382 Y126.853 E.01106
; LINE_WIDTH: 0.410069
G1 X127.055 Y126.853 E.00976
; WIPE_START
G1 F9805.301
G1 X127.382 Y126.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.143 Y129.322 Z9.2 F42000
M73 P72 R5
G1 Z8.8
G1 E.8 F1800
; LINE_WIDTH: 0.192586
G1 F4473
M204 S6000
G1 X124.998 Y138.022 E.10701
; WIPE_START
G1 F15000
G1 X125.259 Y136.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y138.735 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
; LINE_WIDTH: 0.480857
G1 F4473
M204 S6000
G1 X124.025 Y140.335 E.05759
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.376
G1 X124.236 Y138.735 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 45/73
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z9.2 I1.2 J.201 P1  F42000
G1 X126.188 Y127.086 Z9.2
G1 Z9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4482
M204 S5000
G1 X131.661 Y127.807 E.16961
G1 X131.501 Y129.016 E.03749
G1 X126.029 Y128.296 E.16961
G1 X126.18 Y127.146 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.166 Y127.385 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y129.41 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4482
M204 S6000
G1 X125.247 Y138.26 E.29609
G1 X124.695 Y138.187 E.01847
G1 X125.894 Y129.084 E.30457
G1 X126.446 Y129.157 E.01847
G1 X126.42 Y129.351 E.0065
M204 S10000
G1 X126.816 Y129.464 F42000
G1 F4482
M204 S6000
G1 X126.867 Y129.075 E.01301
G1 X130.49 Y129.552 E.12121
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.355 Y132.961 E.18358
G1 X126.808 Y129.523 E.11504
M204 S250
G1 X127.205 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4482
M204 S5000
G1 X130.05 Y129.889 E.08819
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.744 Y133.013 E.158
G1 X127.197 Y129.574 E.10656
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.185 Y129.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.876 Y129.74 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4482
M204 S6000
G1 X131.428 Y129.813 E.01847
G1 X130.229 Y138.916 E.30457
G1 X129.677 Y138.843 E.01847
G1 X130.868 Y129.799 E.30258
; WIPE_START
G1 F8843.478
G1 X131.428 Y129.813 E-.21279
G1 X131.24 Y131.24 E-.54721
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.622 Y138.848 Z9.4 F42000
G1 X130.58 Y139.373 Z9.4
G1 Z9
G1 E.8 F1800
G1 F4482
M204 S6000
G1 X124.239 Y138.538 E.21216
G1 X125.543 Y128.627 E.33158
G1 X131.884 Y129.462 E.21216
G1 X130.587 Y139.313 E.32959
; WIPE_START
G1 F8843.478
G1 X128.602 Y139.071 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.401 Y131.653 Z9.4 F42000
G1 X131.533 Y126.984 Z9.4
G1 Z9
G1 E.8 F1800
G1 F4482
M204 S6000
G1 X130.961 Y126.909 E.01912
G1 X129.606 Y116.618 E.3443
G1 X125.176 Y117.201 E.14822
G1 X126.375 Y126.305 E.30458
G1 X125.803 Y126.23 E.01912
G1 X124.485 Y116.212 E.33516
G1 X130.018 Y115.483 E.18516
G1 X131.525 Y126.924 E.38279
M204 S10000
G1 X131.979 Y127.453 F42000
G1 F4482
M204 S6000
G1 X128.231 Y126.96 E.1254
G1 X128.231 Y126.746 E.0071
G1 X130.49 Y126.448 E.07559
G1 X129.256 Y117.075 E.31361
G1 X125.633 Y117.552 E.12121
G1 X126.848 Y126.778 E.30868
G1 X125.85 Y126.646 E.03337
G1 X125.756 Y127.362 E.02395
G1 X125.542 Y127.362 E.0071
G1 X124.028 Y115.862 E.38478
G1 X130.369 Y115.027 E.21216
G1 X131.917 Y126.783 E.39334
G3 X131.975 Y127.393 I-7.645 J1.044 E.02034
; WIPE_START
G1 F8843.478
G1 X129.989 Y127.163 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.02 Y120.132 Z9.4 F42000
G1 X126.073 Y117.889 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4482
M204 S5000
G1 X128.103 Y117.622 E.06291
G1 X128.918 Y117.515 E.02527
G1 X130.05 Y126.111 E.2664
G1 X127.205 Y126.485 E.08819
G1 X126.081 Y117.949 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.055 Y117.63 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.843 Y125.166 Z9.4 F42000
G1 X124.622 Y138.984 Z9.4
G1 Z9
G1 E.8 F1800
G1 F4482
M204 S5000
G1 X130.094 Y139.704 E.16961
G1 X129.935 Y140.914 E.03749
G1 X124.462 Y140.193 E.16961
G1 X124.614 Y139.043 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.599 Y139.283 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.511 Y141.387 Z9.4 F42000
G1 Z9
G1 E.8 F1800
G1 F4482
M204 S5000
G1 X123.77 Y140.499 E.20892
G3 X123.614 Y140.278 I.038 J-.193 E.0092
G1 X125.188 Y128.321 E.37056
G2 X125.188 Y127.68 I-3.115 J-.321 E.01972
G1 X123.614 Y115.72 E.37067
G3 X123.771 Y115.5 I.191 J-.029 E.00918
G1 X130.509 Y114.613 E.20883
G3 X130.581 Y114.615 I.03 J.214 E.00224
G3 X130.733 Y114.785 I-.044 J.191 E.00747
G1 X132.306 Y126.736 E.37038
G3 X132.306 Y129.264 I-9.872 J1.264 E.07789
G1 X130.733 Y141.215 E.3704
G3 X130.571 Y141.387 I-.192 J-.018 E.0078
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.588 Y141.128 E-.76
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


G1 X130.321 Y141.165 F42000
G1 Z9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.480856
G1 F4482
M204 S6000
G1 X130.531 Y139.564 E.05761
; WIPE_START
G1 F8220.388
G1 X130.321 Y141.165 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.98 Y138.678 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.192587
G1 F4482
M204 S6000
G1 X131.125 Y129.978 E.10702
; WIPE_START
G1 F15000
G1 X130.864 Y131.961 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.887 Y129.265 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.466962
G1 F4482
M204 S6000
G2 X131.983 Y128.404 I-18.559 J-2.495 E.02993
; LINE_WIDTH: 0.423326
G1 X132.014 Y128 E.01256
; LINE_WIDTH: 0.387794
G1 X132.032 Y127.658 E.00962
; WIPE_START
G1 F10438.614
G1 X132.014 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.062 Y126.058 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.192584
G1 F4482
M204 S6000
G1 X124.874 Y117.036 E.11098
M204 S10000
G1 X124.971 Y116.586 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50325
G1 F4482
M204 S6000
G1 X125.115 Y116.567 E.00542
; LINE_WIDTH: 0.523608
G1 X125.178 Y116.579 E.00253
; LINE_WIDTH: 0.564304
G1 X125.241 Y116.591 E.00274
; LINE_WIDTH: 0.605
G1 X125.305 Y116.603 E.00295
; LINE_WIDTH: 0.645696
G1 X125.368 Y116.616 E.00317
; LINE_WIDTH: 0.70653
G1 X125.431 Y116.628 E.00349
G1 X129.212 Y116.13 E.20619
; LINE_WIDTH: 0.686662
G1 X129.27 Y116.102 E.00338
; LINE_WIDTH: 0.645986
G1 X129.328 Y116.074 E.00317
; LINE_WIDTH: 0.60531
G1 X129.386 Y116.045 E.00296
; LINE_WIDTH: 0.564634
G1 X129.444 Y116.017 E.00274
; LINE_WIDTH: 0.512429
G3 X129.585 Y115.978 I.13 J.194 E.00572
M204 S10000
G1 X129.856 Y116.38 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192584
G1 F4482
M204 S6000
G1 X131.219 Y126.737 E.1274
M204 S10000
G1 X130.748 Y126.853 F42000
; LINE_WIDTH: 0.429509
G1 F4482
M204 S6000
G1 X130.549 Y126.853 E.00627
; LINE_WIDTH: 0.385164
G1 X130.35 Y126.853 E.00555
; LINE_WIDTH: 0.34082
G1 X130.151 Y126.853 E.00483
; LINE_WIDTH: 0.296475
G1 X129.952 Y126.853 E.00411
; LINE_WIDTH: 0.25213
G1 X129.753 Y126.853 E.00339
; LINE_WIDTH: 0.207785
G1 X129.554 Y126.853 E.00267
; LINE_WIDTH: 0.163441
G1 X129.355 Y126.853 E.00195
; LINE_WIDTH: 0.119096
G1 X129.156 Y126.853 E.00124
; WIPE_START
G1 F15000
G1 X129.355 Y126.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.034 Y126.853 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.507812
G1 F4482
M204 S6000
G1 X127.708 Y126.853 E.01236
; LINE_WIDTH: 0.458939
G1 X127.382 Y126.853 E.01106
; LINE_WIDTH: 0.410066
G1 X127.055 Y126.853 E.00976
; WIPE_START
G1 F9805.372
G1 X127.382 Y126.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.143 Y129.322 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.192587
G1 F4482
M204 S6000
G1 X124.998 Y138.022 E.10701
; WIPE_START
G1 F15000
G1 X125.259 Y136.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y138.735 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.48086
G1 F4482
M204 S6000
G1 X124.025 Y140.335 E.0576
; CHANGE_LAYER
; Z_HEIGHT: 9.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.303
G1 X124.236 Y138.735 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 46/73
; update layer progress
M73 L46
M991 S0 P45 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z9.4 I.975 J.729 P1  F42000
G1 X131.501 Y129.016 Z9.4
G1 Z9.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4442
M204 S5000
G1 X126.029 Y128.296 E.16961
G1 X126.15 Y127.371 E.02867
M73 P73 R5
G1 X126.188 Y127.086 E.00882
G1 X131.661 Y127.807 E.16961
G1 X131.509 Y128.957 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.524 Y128.717 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.533 Y126.984 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4442
M204 S6000
G1 X130.961 Y126.909 E.01912
G1 X129.606 Y116.618 E.3443
G1 X125.176 Y117.201 E.14822
G1 X126.375 Y126.305 E.30458
G1 X125.803 Y126.23 E.01912
G1 X124.485 Y116.212 E.33516
G1 X130.018 Y115.483 E.18516
G1 X131.525 Y126.924 E.38279
M204 S10000
G1 X131.979 Y127.453 F42000
G1 F4442
M204 S6000
G1 X128.231 Y126.96 E.1254
G1 X128.231 Y126.746 E.0071
G1 X130.49 Y126.448 E.07559
G1 X129.256 Y117.075 E.31361
G1 X125.633 Y117.552 E.12121
G1 X126.848 Y126.778 E.30868
G1 X125.85 Y126.646 E.03337
G1 X125.756 Y127.362 E.02395
G1 X125.542 Y127.362 E.0071
G1 X124.028 Y115.862 E.38478
G1 X130.369 Y115.027 E.21216
G1 X131.917 Y126.783 E.39334
G3 X131.975 Y127.393 I-7.646 J1.044 E.02035
; WIPE_START
G1 F8843.478
G1 X129.989 Y127.163 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y129.41 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
G1 F4442
M204 S6000
G1 X125.247 Y138.26 E.29609
G1 X124.695 Y138.187 E.01847
G1 X125.894 Y129.084 E.30457
G1 X126.446 Y129.157 E.01847
G1 X126.42 Y129.351 E.0065
M204 S10000
G1 X126.816 Y129.464 F42000
G1 F4442
M204 S6000
G1 X126.867 Y129.075 E.01301
G1 X130.49 Y129.552 E.12121
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.379 Y132.784 E.18953
G1 X126.808 Y129.523 E.10909
M204 S250
G1 X127.205 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4442
M204 S5000
G1 X130.05 Y129.889 E.08819
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.767 Y132.835 E.16351
G1 X127.197 Y129.574 E.10105
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.185 Y129.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.397 Y129.809 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4442
M204 S6000
G1 X131.428 Y129.813 E.00102
G1 X130.229 Y138.916 E.30457
G1 X129.677 Y138.843 E.01847
G1 X130.876 Y129.74 E.30457
G1 X131.338 Y129.801 E.01545
M204 S10000
G1 X131.45 Y129.405 F42000
G1 F4442
M204 S6000
G1 X131.884 Y129.462 E.01453
G1 X130.58 Y139.373 E.33158
G1 X124.239 Y138.538 E.21216
G1 X125.543 Y128.627 E.33158
G1 X131.391 Y129.397 E.19564
; WIPE_START
G1 F8843.478
G1 X131.884 Y129.462 E-.18922
G1 X131.688 Y130.951 E-.57078
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.647 Y136.682 Z9.6 F42000
G1 X124.621 Y138.984 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4442
M204 S5000
G1 X130.094 Y139.704 E.16961
G1 X129.935 Y140.914 E.03749
G1 X124.462 Y140.193 E.16961
G1 X124.584 Y139.268 E.02867
G1 X124.614 Y139.043 E.00697
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.599 Y139.283 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y131.652 Z9.6 F42000
G1 X126.073 Y117.889 Z9.6
G1 Z9.2
G1 E.8 F1800
G1 F4442
M204 S5000
G1 X128.156 Y117.615 E.06455
G1 X128.918 Y117.515 E.02364
G1 X130.05 Y126.111 E.2664
G1 X127.205 Y126.485 E.08819
G1 X126.081 Y117.949 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.055 Y117.631 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.84 Y125.223 Z9.6 F42000
G1 X130.51 Y141.387 Z9.6
G1 Z9.2
G1 E.8 F1800
G1 F4442
M204 S5000
G1 X123.77 Y140.499 E.20892
G3 X123.614 Y140.278 I.039 J-.193 E.00919
G1 X125.188 Y128.322 E.37053
G2 X125.188 Y127.68 I-3.684 J-.323 E.01977
G1 X123.614 Y115.72 E.37066
G3 X123.772 Y115.5 I.19 J-.03 E.00925
G1 X130.509 Y114.613 E.20878
G3 X130.581 Y114.615 I.031 J.215 E.00224
G3 X130.733 Y114.785 I-.044 J.192 E.00747
G1 X132.306 Y126.736 E.37038
G3 X132.352 Y128.842 I-9.992 J1.273 E.06486
G1 X130.733 Y141.215 E.38343
G3 X130.571 Y141.387 I-.192 J-.019 E.00781
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.588 Y141.128 E-.76
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


G1 X130.321 Y141.165 F42000
G1 Z9.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.480851
G1 F4442
M204 S6000
G1 X130.531 Y139.564 E.05761
; WIPE_START
G1 F8220.473
G1 X130.321 Y141.165 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.98 Y138.678 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
; LINE_WIDTH: 0.192587
G1 F4442
M204 S6000
G1 X131.125 Y129.978 E.10702
; WIPE_START
G1 F15000
G1 X130.864 Y131.961 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.887 Y129.265 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
; LINE_WIDTH: 0.466963
G1 F4442
M204 S6000
G2 X131.983 Y128.404 I-18.576 J-2.496 E.02993
; LINE_WIDTH: 0.423334
G1 X132.014 Y128 E.01256
; LINE_WIDTH: 0.387819
G1 X132.032 Y127.658 E.00962
; WIPE_START
G1 F10437.841
G1 X132.014 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.062 Y126.058 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
; LINE_WIDTH: 0.192584
G1 F4442
M204 S6000
G1 X124.874 Y117.036 E.11098
M204 S10000
G1 X124.971 Y116.586 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50326
G1 F4442
M204 S6000
G1 X125.115 Y116.567 E.00542
; LINE_WIDTH: 0.523608
G1 X125.178 Y116.579 E.00253
; LINE_WIDTH: 0.564304
G1 X125.241 Y116.591 E.00274
; LINE_WIDTH: 0.605
G1 X125.305 Y116.603 E.00295
; LINE_WIDTH: 0.645696
G1 X125.368 Y116.616 E.00317
; LINE_WIDTH: 0.70654
G1 X125.431 Y116.628 E.00349
G1 X129.212 Y116.13 E.20619
; LINE_WIDTH: 0.68668
G1 X129.27 Y116.102 E.00338
; LINE_WIDTH: 0.646
G1 X129.328 Y116.074 E.00317
; LINE_WIDTH: 0.60532
G1 X129.386 Y116.045 E.00296
; LINE_WIDTH: 0.56464
G1 X129.444 Y116.017 E.00274
; LINE_WIDTH: 0.51243
G3 X129.585 Y115.978 I.13 J.194 E.00573
M204 S10000
G1 X129.856 Y116.38 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192606
G1 F4442
M204 S6000
G1 X131.219 Y126.737 E.12742
M204 S10000
G1 X130.748 Y126.853 F42000
; LINE_WIDTH: 0.429479
G1 F4442
M204 S6000
G1 X130.549 Y126.853 E.00627
; LINE_WIDTH: 0.385138
G1 X130.35 Y126.853 E.00555
; LINE_WIDTH: 0.340797
G1 X130.151 Y126.853 E.00483
; LINE_WIDTH: 0.296457
G1 X129.952 Y126.853 E.00411
; LINE_WIDTH: 0.252116
G1 X129.753 Y126.853 E.00339
; LINE_WIDTH: 0.207775
G1 X129.554 Y126.853 E.00267
; LINE_WIDTH: 0.163435
G1 X129.355 Y126.853 E.00195
; LINE_WIDTH: 0.119094
G1 X129.156 Y126.853 E.00124
; WIPE_START
G1 F15000
G1 X129.355 Y126.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.034 Y126.853 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
; LINE_WIDTH: 0.507827
G1 F4442
M204 S6000
G1 X127.708 Y126.853 E.01236
; LINE_WIDTH: 0.458948
G1 X127.382 Y126.853 E.01106
; LINE_WIDTH: 0.410069
G1 X127.055 Y126.853 E.00976
; WIPE_START
G1 F9805.301
G1 X127.382 Y126.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.143 Y129.322 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
; LINE_WIDTH: 0.192587
G1 F4442
M204 S6000
G1 X124.998 Y138.022 E.10702
; WIPE_START
G1 F15000
G1 X125.259 Y136.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y138.735 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
; LINE_WIDTH: 0.480822
G1 F4442
M204 S6000
G1 X124.025 Y140.335 E.05759
; CHANGE_LAYER
; Z_HEIGHT: 9.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8221.028
G1 X124.236 Y138.735 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 47/73
; update layer progress
M73 L47
M991 S0 P46 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z9.6 I1.2 J.201 P1  F42000
G1 X126.188 Y127.086 Z9.6
G1 Z9.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4491
M204 S5000
G1 X131.661 Y127.807 E.16961
G1 X131.501 Y129.016 E.03749
G1 X126.029 Y128.296 E.16961
G1 X126.146 Y127.401 E.02773
G1 X126.18 Y127.146 E.00792
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.166 Y127.385 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.533 Y126.984 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4491
M204 S6000
G1 X130.961 Y126.909 E.01912
G1 X129.606 Y116.618 E.3443
G1 X125.176 Y117.201 E.14822
G1 X126.375 Y126.305 E.30459
G1 X125.803 Y126.23 E.01912
G1 X124.485 Y116.212 E.33516
M73 P74 R5
G1 X130.018 Y115.483 E.18516
G1 X131.525 Y126.924 E.38279
M204 S10000
G1 X131.979 Y127.453 F42000
G1 F4491
M204 S6000
G1 X128.231 Y126.96 E.1254
G1 X128.231 Y126.746 E.0071
G1 X130.49 Y126.448 E.07559
G1 X129.256 Y117.075 E.31361
G1 X125.633 Y117.552 E.12121
M73 P74 R4
G1 X126.848 Y126.778 E.30868
G1 X125.85 Y126.646 E.03337
G1 X125.756 Y127.362 E.02395
G1 X125.542 Y127.362 E.0071
G1 X124.028 Y115.862 E.38478
G1 X130.369 Y115.027 E.21216
G1 X131.917 Y126.783 E.39334
G3 X131.975 Y127.393 I-7.644 J1.044 E.02035
; WIPE_START
G1 F8843.478
G1 X129.989 Y127.163 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y129.41 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
G1 F4491
M204 S6000
G1 X125.247 Y138.26 E.29609
G1 X124.695 Y138.187 E.01847
G1 X125.894 Y129.084 E.30457
G1 X126.446 Y129.157 E.01847
G1 X126.42 Y129.351 E.0065
M204 S10000
G1 X126.816 Y129.464 F42000
G1 F4491
M204 S6000
G1 X126.867 Y129.075 E.01301
G1 X130.49 Y129.552 E.12121
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.402 Y132.606 E.19548
G1 X126.808 Y129.523 E.10314
M204 S250
G1 X127.205 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4491
M204 S5000
G1 X130.05 Y129.889 E.08819
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.791 Y132.657 E.16902
G1 X127.197 Y129.574 E.09554
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.185 Y129.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.876 Y129.74 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4491
M204 S6000
G1 X131.428 Y129.813 E.01847
G1 X130.229 Y138.916 E.30457
G1 X129.677 Y138.843 E.01847
G1 X130.868 Y129.799 E.30258
; WIPE_START
G1 F8843.478
G1 X131.428 Y129.813 E-.21279
G1 X131.24 Y131.24 E-.54721
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.977 Y128.685 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
G1 F4491
M204 S6000
G1 X131.884 Y129.462 E.19764
G1 X130.58 Y139.373 E.33158
G1 X124.239 Y138.538 E.21216
G1 X125.543 Y128.627 E.33158
G1 X125.918 Y128.677 E.01254
; WIPE_START
G1 F8843.478
G1 X127.901 Y128.938 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.532 Y136.193 Z9.8 F42000
G1 X124.622 Y138.984 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4491
M204 S5000
G1 X130.094 Y139.704 E.16961
G1 X129.935 Y140.914 E.03749
G1 X124.462 Y140.193 E.16961
G1 X124.58 Y139.299 E.02773
G1 X124.614 Y139.043 E.00792
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.599 Y139.283 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y131.652 Z9.8 F42000
G1 X126.073 Y117.889 Z9.8
G1 Z9.4
G1 E.8 F1800
G1 F4491
M204 S5000
G1 X128.208 Y117.608 E.06619
G1 X128.918 Y117.515 E.022
G1 X130.05 Y126.111 E.2664
G1 X127.205 Y126.485 E.08819
G1 X126.081 Y117.949 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.056 Y117.633 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.84 Y125.225 Z9.8 F42000
G1 X130.51 Y141.387 Z9.8
G1 Z9.4
G1 E.8 F1800
G1 F4491
M204 S5000
G1 X123.77 Y140.499 E.20891
G3 X123.614 Y140.277 I.039 J-.193 E.00919
G1 X125.188 Y128.322 E.37052
G2 X125.188 Y127.678 I-4.385 J-.322 E.01982
G1 X123.614 Y115.72 E.3706
G3 X123.772 Y115.5 I.191 J-.029 E.00923
G1 X130.509 Y114.613 E.20877
G3 X130.581 Y114.615 I.031 J.215 E.00225
G3 X130.733 Y114.785 I-.044 J.192 E.00747
G1 X132.306 Y126.736 E.37038
G3 X132.352 Y128.842 I-9.99 J1.273 E.06486
G1 X130.732 Y141.217 E.38349
G3 X130.571 Y141.387 I-.192 J-.021 E.00773
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.588 Y141.128 E-.76
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


G1 X130.321 Y141.165 F42000
G1 Z9.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.480853
G1 F4491
M204 S6000
G1 X130.531 Y139.564 E.05761
; WIPE_START
G1 F8220.439
G1 X130.321 Y141.165 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.98 Y138.678 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
; LINE_WIDTH: 0.192577
G1 F4491
M204 S6000
G1 X131.125 Y129.978 E.10701
; WIPE_START
G1 F15000
G1 X130.864 Y131.961 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.887 Y129.265 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
; LINE_WIDTH: 0.466963
G1 F4491
M204 S6000
G2 X131.983 Y128.404 I-18.559 J-2.495 E.02993
; LINE_WIDTH: 0.423328
G1 X132.014 Y128 E.01256
; LINE_WIDTH: 0.387796
G1 X132.032 Y127.658 E.00962
; WIPE_START
G1 F10438.558
G1 X132.014 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.062 Y126.058 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
; LINE_WIDTH: 0.192584
G1 F4491
M204 S6000
G1 X124.874 Y117.036 E.11098
M204 S10000
G1 X124.971 Y116.586 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50325
G1 F4491
M204 S6000
G1 X125.115 Y116.567 E.00542
; LINE_WIDTH: 0.523604
G1 X125.178 Y116.579 E.00253
; LINE_WIDTH: 0.564292
G1 X125.241 Y116.591 E.00274
; LINE_WIDTH: 0.60498
G1 X125.305 Y116.603 E.00295
; LINE_WIDTH: 0.645668
G1 X125.368 Y116.616 E.00317
; LINE_WIDTH: 0.706509
G1 X125.431 Y116.628 E.00349
G1 X129.212 Y116.13 E.20618
; LINE_WIDTH: 0.68666
G1 X129.27 Y116.102 E.00338
; LINE_WIDTH: 0.64598
G1 X129.328 Y116.074 E.00317
; LINE_WIDTH: 0.6053
G1 X129.386 Y116.045 E.00296
; LINE_WIDTH: 0.56462
G1 X129.444 Y116.017 E.00274
; LINE_WIDTH: 0.512408
G3 X129.585 Y115.978 I.13 J.194 E.00573
M204 S10000
G1 X129.856 Y116.38 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192606
G1 F4491
M204 S6000
G1 X131.219 Y126.737 E.12742
M204 S10000
G1 X130.748 Y126.853 F42000
; LINE_WIDTH: 0.429498
G1 F4491
M204 S6000
G1 X130.549 Y126.853 E.00627
; LINE_WIDTH: 0.385155
G1 X130.35 Y126.853 E.00555
; LINE_WIDTH: 0.340812
G1 X130.151 Y126.853 E.00483
; LINE_WIDTH: 0.296468
G1 X129.952 Y126.853 E.00411
; LINE_WIDTH: 0.252125
G1 X129.753 Y126.853 E.00339
; LINE_WIDTH: 0.207782
G1 X129.554 Y126.853 E.00267
; LINE_WIDTH: 0.163439
G1 X129.355 Y126.853 E.00195
; LINE_WIDTH: 0.119096
G1 X129.156 Y126.853 E.00124
; WIPE_START
G1 F15000
G1 X129.355 Y126.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.034 Y126.853 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
; LINE_WIDTH: 0.507828
G1 F4491
M204 S6000
G1 X127.708 Y126.853 E.01236
; LINE_WIDTH: 0.458949
G1 X127.382 Y126.853 E.01106
; LINE_WIDTH: 0.410069
G1 X127.055 Y126.853 E.00976
; WIPE_START
G1 F9805.287
G1 X127.382 Y126.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.143 Y129.322 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
; LINE_WIDTH: 0.192587
G1 F4491
M204 S6000
G1 X124.998 Y138.022 E.10701
; WIPE_START
G1 F15000
G1 X125.259 Y136.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y138.735 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
; LINE_WIDTH: 0.480844
G1 F4491
M204 S6000
G1 X124.025 Y140.335 E.05759
; CHANGE_LAYER
; Z_HEIGHT: 9.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F8220.613
G1 X124.236 Y138.735 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 48/73
; update layer progress
M73 L48
M991 S0 P47 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z9.8 I1.2 J.201 P1  F42000
G1 X126.188 Y127.086 Z9.8
G1 Z9.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4488
M204 S5000
G1 X131.661 Y127.807 E.16961
G1 X131.501 Y129.016 E.03749
G1 X126.029 Y128.296 E.16961
G1 X126.142 Y127.432 E.02678
G1 X126.18 Y127.146 E.00886
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.166 Y127.385 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.533 Y126.984 Z10 F42000
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4488
M204 S6000
G1 X130.961 Y126.909 E.01912
G1 X129.606 Y116.618 E.3443
G1 X125.176 Y117.201 E.14822
G1 X126.375 Y126.305 E.30459
G1 X125.803 Y126.23 E.01912
G1 X124.485 Y116.212 E.33516
G1 X130.019 Y115.483 E.18516
G1 X131.525 Y126.924 E.38279
M204 S10000
G1 X131.979 Y127.453 F42000
M73 P75 R4
G1 F4488
M204 S6000
G1 X128.231 Y126.96 E.1254
G1 X128.231 Y126.746 E.0071
G1 X130.49 Y126.448 E.07559
G1 X129.256 Y117.075 E.31361
G1 X125.633 Y117.552 E.12121
G1 X126.848 Y126.778 E.30868
G1 X125.85 Y126.646 E.03337
G1 X125.756 Y127.362 E.02395
G1 X125.542 Y127.362 E.0071
G1 X124.028 Y115.862 E.38478
G1 X130.369 Y115.027 E.21216
G1 X131.917 Y126.783 E.39334
G3 X131.975 Y127.393 I-7.644 J1.044 E.02035
; WIPE_START
G1 F8843.478
G1 X129.989 Y127.163 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y129.41 Z10 F42000
G1 Z9.6
G1 E.8 F1800
G1 F4488
M204 S6000
G1 X125.247 Y138.26 E.29609
G1 X124.695 Y138.187 E.01847
G1 X125.894 Y129.084 E.30457
G1 X126.446 Y129.157 E.01847
G1 X126.42 Y129.351 E.0065
M204 S10000
G1 X126.816 Y129.464 F42000
G1 F4488
M204 S6000
G1 X126.867 Y129.075 E.01301
G1 X130.49 Y129.552 E.12121
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.426 Y132.428 E.20143
G1 X126.808 Y129.523 E.09719
M204 S250
G1 X127.205 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4488
M204 S5000
G1 X130.05 Y129.889 E.08819
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.814 Y132.479 E.17453
G1 X127.197 Y129.574 E.09003
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.185 Y129.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.876 Y129.74 Z10 F42000
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4488
M204 S6000
G1 X131.428 Y129.813 E.01847
G1 X130.229 Y138.916 E.30457
G1 X129.677 Y138.843 E.01847
G1 X130.868 Y129.8 E.30258
; WIPE_START
G1 F8843.478
G1 X131.428 Y129.813 E-.21279
G1 X131.24 Y131.24 E-.54721
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.622 Y138.848 Z10 F42000
G1 X130.58 Y139.373 Z10
G1 Z9.6
G1 E.8 F1800
G1 F4488
M204 S6000
G1 X124.239 Y138.538 E.21216
G1 X125.543 Y128.627 E.33158
G1 X131.884 Y129.462 E.21216
G1 X130.587 Y139.313 E.32959
; WIPE_START
G1 F8843.478
G1 X128.602 Y139.071 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.622 Y138.984 Z10 F42000
G1 Z9.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4488
M204 S5000
G1 X130.094 Y139.704 E.16961
G1 X129.935 Y140.914 E.03749
G1 X124.462 Y140.193 E.16961
G1 X124.576 Y139.329 E.02678
G1 X124.614 Y139.043 E.00886
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.599 Y139.283 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y131.652 Z10 F42000
G1 X126.073 Y117.889 Z10
G1 Z9.6
G1 E.8 F1800
G1 F4488
M204 S5000
G1 X128.261 Y117.601 E.06782
G1 X128.918 Y117.515 E.02036
G1 X130.05 Y126.111 E.2664
G1 X127.205 Y126.485 E.08819
G1 X126.081 Y117.949 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.056 Y117.634 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.84 Y125.226 Z10 F42000
G1 X130.51 Y141.387 Z10
G1 Z9.6
G1 E.8 F1800
G1 F4488
M204 S5000
G1 X123.725 Y140.486 E.21032
G3 X123.614 Y140.277 I.087 J-.18 E.00777
G1 X125.188 Y128.321 E.37056
G2 X125.188 Y127.68 I-3.409 J-.321 E.01974
G1 X123.614 Y115.72 E.37065
G3 X123.771 Y115.5 I.19 J-.03 E.0092
G1 X130.508 Y114.613 E.20882
G3 X130.581 Y114.615 I.031 J.214 E.00225
G3 X130.733 Y114.785 I-.044 J.192 E.00746
G1 X132.306 Y126.736 E.3704
G3 X132.306 Y129.264 I-10.795 J1.264 E.07786
G1 X130.733 Y141.215 E.3704
G3 X130.571 Y141.387 I-.192 J-.018 E.0078
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.588 Y141.126 E-.76
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


G1 X130.321 Y141.165 F42000
G1 Z9.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.480856
G1 F4488
M204 S6000
G1 X130.531 Y139.564 E.05761
; WIPE_START
G1 F8220.388
G1 X130.321 Y141.165 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.98 Y138.678 Z10 F42000
G1 Z9.6
G1 E.8 F1800
; LINE_WIDTH: 0.192577
G1 F4488
M204 S6000
G1 X131.125 Y129.978 E.10701
; WIPE_START
G1 F15000
G1 X130.864 Y131.961 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.887 Y129.265 Z10 F42000
G1 Z9.6
G1 E.8 F1800
; LINE_WIDTH: 0.46697
G1 F4488
M204 S6000
G2 X131.983 Y128.404 I-18.576 J-2.496 E.02992
; LINE_WIDTH: 0.423324
G1 X132.014 Y128 E.01257
; LINE_WIDTH: 0.387806
G1 X132.032 Y127.658 E.00962
; WIPE_START
G1 F10438.253
G1 X132.014 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.062 Y126.058 Z10 F42000
G1 Z9.6
G1 E.8 F1800
; LINE_WIDTH: 0.192595
G1 F4488
M204 S6000
G1 X124.874 Y117.036 E.11099
M204 S10000
G1 X124.971 Y116.586 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50325
G1 F4488
M204 S6000
G1 X125.115 Y116.567 E.00542
; LINE_WIDTH: 0.523604
G1 X125.178 Y116.579 E.00253
; LINE_WIDTH: 0.564292
G1 X125.241 Y116.591 E.00274
; LINE_WIDTH: 0.60498
G1 X125.305 Y116.603 E.00295
; LINE_WIDTH: 0.645668
G1 X125.368 Y116.616 E.00317
; LINE_WIDTH: 0.706509
G1 X125.431 Y116.628 E.00349
G1 X129.212 Y116.13 E.20619
; LINE_WIDTH: 0.68666
G1 X129.27 Y116.102 E.00338
; LINE_WIDTH: 0.64598
G1 X129.328 Y116.074 E.00317
; LINE_WIDTH: 0.6053
G1 X129.386 Y116.045 E.00296
; LINE_WIDTH: 0.56462
G1 X129.444 Y116.017 E.00274
; LINE_WIDTH: 0.512408
G3 X129.585 Y115.978 I.13 J.194 E.00573
M204 S10000
G1 X129.856 Y116.38 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192606
G1 F4488
M204 S6000
G1 X131.219 Y126.737 E.12742
M204 S10000
G1 X130.748 Y126.853 F42000
; LINE_WIDTH: 0.429495
G1 F4488
M204 S6000
G1 X130.549 Y126.853 E.00627
; LINE_WIDTH: 0.385152
G1 X130.35 Y126.853 E.00555
; LINE_WIDTH: 0.340809
G1 X130.151 Y126.853 E.00483
; LINE_WIDTH: 0.296467
G1 X129.952 Y126.853 E.00411
; LINE_WIDTH: 0.252124
G1 X129.753 Y126.853 E.00339
; LINE_WIDTH: 0.207781
G1 X129.554 Y126.853 E.00267
; LINE_WIDTH: 0.163438
G1 X129.355 Y126.853 E.00195
; LINE_WIDTH: 0.119095
G1 X129.156 Y126.853 E.00124
; WIPE_START
G1 F15000
G1 X129.355 Y126.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.034 Y126.853 Z10 F42000
G1 Z9.6
G1 E.8 F1800
; LINE_WIDTH: 0.507827
G1 F4488
M204 S6000
G1 X127.708 Y126.853 E.01236
; LINE_WIDTH: 0.458948
G1 X127.382 Y126.853 E.01106
; LINE_WIDTH: 0.410069
G1 X127.055 Y126.853 E.00976
; WIPE_START
G1 F9805.295
G1 X127.382 Y126.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.143 Y129.322 Z10 F42000
G1 Z9.6
G1 E.8 F1800
; LINE_WIDTH: 0.192587
G1 F4488
M204 S6000
G1 X124.998 Y138.022 E.10702
; WIPE_START
G1 F15000
G1 X125.259 Y136.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y138.735 Z10 F42000
G1 Z9.6
G1 E.8 F1800
; LINE_WIDTH: 0.480851
G1 F4488
M204 S6000
G1 X124.025 Y140.335 E.05759
; CHANGE_LAYER
; Z_HEIGHT: 9.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.474
G1 X124.236 Y138.735 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 49/73
; update layer progress
M73 L49
M991 S0 P48 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z10 I1.2 J.201 P1  F42000
G1 X126.188 Y127.086 Z10
G1 Z9.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4491
M204 S5000
G1 X131.661 Y127.807 E.16961
G1 X131.501 Y129.016 E.03749
G1 X126.029 Y128.296 E.16961
G1 X126.138 Y127.462 E.02583
G1 X126.18 Y127.146 E.00981
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.166 Y127.385 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.533 Y126.984 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4491
M204 S6000
G1 X130.961 Y126.909 E.01912
G1 X129.606 Y116.618 E.3443
G1 X125.176 Y117.201 E.14822
G1 X126.375 Y126.305 E.30458
G1 X125.803 Y126.23 E.01912
G1 X124.485 Y116.212 E.33516
G1 X130.018 Y115.483 E.18516
G1 X131.525 Y126.924 E.38279
M204 S10000
G1 X131.979 Y127.453 F42000
G1 F4491
M204 S6000
G1 X128.231 Y126.96 E.1254
G1 X128.231 Y126.746 E.0071
G1 X130.49 Y126.448 E.07559
G1 X129.256 Y117.075 E.31361
G1 X125.633 Y117.552 E.12121
G1 X126.848 Y126.778 E.30868
G1 X125.85 Y126.646 E.03337
G1 X125.756 Y127.362 E.02395
G1 X125.542 Y127.362 E.0071
M73 P76 R4
G1 X124.028 Y115.862 E.38478
G1 X130.369 Y115.027 E.21216
G1 X131.917 Y126.783 E.39334
G3 X131.975 Y127.393 I-7.646 J1.044 E.02035
; WIPE_START
G1 F8843.478
G1 X129.989 Y127.163 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y129.41 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
G1 F4491
M204 S6000
G1 X125.247 Y138.26 E.29609
G1 X124.695 Y138.187 E.01847
G1 X125.894 Y129.084 E.30457
G1 X126.446 Y129.157 E.01847
G1 X126.42 Y129.351 E.0065
M204 S10000
G1 X126.816 Y129.464 F42000
G1 F4491
M204 S6000
G1 X126.867 Y129.075 E.01301
G1 X130.49 Y129.552 E.12121
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.449 Y132.25 E.20737
G1 X126.808 Y129.523 E.09124
M204 S250
G1 X127.205 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4491
M204 S5000
G1 X130.05 Y129.889 E.08819
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.838 Y132.301 E.18005
G1 X127.197 Y129.574 E.08452
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.185 Y129.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.876 Y129.74 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4491
M204 S6000
G1 X131.428 Y129.813 E.01847
G1 X130.229 Y138.916 E.30457
G1 X129.677 Y138.843 E.01847
G1 X130.868 Y129.8 E.30258
; WIPE_START
G1 F8843.478
G1 X131.428 Y129.813 E-.21279
G1 X131.24 Y131.24 E-.54721
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.977 Y128.685 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
G1 F4491
M204 S6000
G1 X131.884 Y129.462 E.19764
G1 X130.58 Y139.373 E.33158
G1 X124.239 Y138.538 E.21216
G1 X125.543 Y128.627 E.33158
G1 X125.918 Y128.677 E.01254
; WIPE_START
G1 F8843.478
G1 X127.901 Y128.938 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.532 Y136.193 Z10.2 F42000
G1 X124.622 Y138.984 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4491
M204 S5000
G1 X130.094 Y139.704 E.16961
G1 X129.935 Y140.914 E.03749
G1 X124.462 Y140.193 E.16961
G1 X124.572 Y139.36 E.02583
G1 X124.614 Y139.043 E.00981
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.599 Y139.283 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y131.652 Z10.2 F42000
G1 X126.073 Y117.889 Z10.2
G1 Z9.8
G1 E.8 F1800
G1 F4491
M204 S5000
G1 X128.314 Y117.594 E.06946
G1 X128.918 Y117.515 E.01873
G1 X130.05 Y126.111 E.2664
G1 X127.205 Y126.485 E.08819
G1 X126.081 Y117.949 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.056 Y117.635 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.84 Y125.227 Z10.2 F42000
G1 X130.51 Y141.387 Z10.2
G1 Z9.8
G1 E.8 F1800
G1 F4491
M204 S5000
G1 X123.769 Y140.499 E.20892
G3 X123.614 Y140.278 I.037 J-.191 E.00921
G1 X125.188 Y128.32 E.3706
G2 X125.188 Y127.68 I-2.785 J-.32 E.0197
G1 X123.614 Y115.72 E.37068
G3 X123.772 Y115.5 I.19 J-.03 E.00924
G1 X130.508 Y114.613 E.20877
G3 X130.581 Y114.615 I.031 J.214 E.00225
G3 X130.733 Y114.785 I-.044 J.192 E.00746
G1 X132.306 Y126.736 E.3704
G3 X132.352 Y128.842 I-9.992 J1.273 E.06486
G1 X130.733 Y141.215 E.38343
G3 X130.571 Y141.387 I-.194 J-.021 E.00777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.588 Y141.128 E-.76
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


G1 X130.321 Y141.165 F42000
G1 Z9.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.480843
G1 F4491
M204 S6000
G1 X130.531 Y139.564 E.05761
; WIPE_START
G1 F8220.629
G1 X130.321 Y141.165 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.98 Y138.678 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
; LINE_WIDTH: 0.192587
G1 F4491
M204 S6000
G1 X131.125 Y129.978 E.10702
; WIPE_START
G1 F15000
G1 X130.864 Y131.961 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.887 Y129.265 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
; LINE_WIDTH: 0.466962
G1 F4491
M204 S6000
G2 X131.983 Y128.404 I-18.596 J-2.498 E.02993
; LINE_WIDTH: 0.423328
G1 X132.014 Y128 E.01256
; LINE_WIDTH: 0.387805
G1 X132.032 Y127.658 E.00962
; WIPE_START
G1 F10438.259
G1 X132.014 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.062 Y126.058 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
; LINE_WIDTH: 0.192595
G1 F4491
M204 S6000
G1 X124.874 Y117.036 E.11099
M204 S10000
G1 X124.971 Y116.586 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50328
G1 F4491
M204 S6000
G1 X125.114 Y116.567 E.00542
; LINE_WIDTH: 0.523626
G1 X125.178 Y116.579 E.00253
; LINE_WIDTH: 0.564318
G1 X125.241 Y116.591 E.00274
; LINE_WIDTH: 0.60501
G1 X125.305 Y116.603 E.00295
; LINE_WIDTH: 0.645702
G1 X125.368 Y116.616 E.00317
; LINE_WIDTH: 0.70654
G1 X125.431 Y116.628 E.00349
G1 X129.212 Y116.13 E.20619
; LINE_WIDTH: 0.686678
G1 X129.27 Y116.102 E.00338
; LINE_WIDTH: 0.645994
G1 X129.328 Y116.074 E.00317
; LINE_WIDTH: 0.60531
G1 X129.386 Y116.045 E.00296
; LINE_WIDTH: 0.564626
G1 X129.444 Y116.017 E.00274
; LINE_WIDTH: 0.51241
G3 X129.585 Y115.978 I.13 J.194 E.00573
M204 S10000
G1 X129.856 Y116.38 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192606
G1 F4491
M204 S6000
G1 X131.219 Y126.737 E.12742
M204 S10000
G1 X130.748 Y126.853 F42000
; LINE_WIDTH: 0.429479
G1 F4491
M204 S6000
G1 X130.549 Y126.853 E.00627
; LINE_WIDTH: 0.385138
G1 X130.35 Y126.853 E.00555
; LINE_WIDTH: 0.340797
G1 X130.151 Y126.853 E.00483
; LINE_WIDTH: 0.296457
G1 X129.952 Y126.853 E.00411
; LINE_WIDTH: 0.252116
G1 X129.753 Y126.853 E.00339
; LINE_WIDTH: 0.207775
G1 X129.554 Y126.853 E.00267
; LINE_WIDTH: 0.163435
G1 X129.355 Y126.853 E.00195
; LINE_WIDTH: 0.119094
G1 X129.156 Y126.853 E.00124
; WIPE_START
G1 F15000
G1 X129.355 Y126.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.034 Y126.853 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
; LINE_WIDTH: 0.507827
G1 F4491
M204 S6000
G1 X127.708 Y126.853 E.01236
; LINE_WIDTH: 0.458948
G1 X127.382 Y126.853 E.01106
; LINE_WIDTH: 0.410069
G1 X127.055 Y126.853 E.00976
; WIPE_START
G1 F9805.292
G1 X127.382 Y126.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.143 Y129.322 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
; LINE_WIDTH: 0.192587
G1 F4491
M204 S6000
G1 X124.998 Y138.022 E.10702
; WIPE_START
G1 F15000
G1 X125.259 Y136.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y138.735 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
; LINE_WIDTH: 0.480844
G1 F4491
M204 S6000
G1 X124.025 Y140.335 E.05759
; CHANGE_LAYER
; Z_HEIGHT: 10
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.613
G1 X124.236 Y138.735 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 50/73
; update layer progress
M73 L50
M991 S0 P49 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z10.2 I1.2 J.201 P1  F42000
G1 X126.188 Y127.086 Z10.2
G1 Z10
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4491
M204 S5000
G1 X131.661 Y127.807 E.16961
G1 X131.501 Y129.016 E.03749
G1 X126.029 Y128.296 E.16961
G1 X126.134 Y127.493 E.02489
G1 X126.18 Y127.146 E.01075
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.166 Y127.385 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.533 Y126.984 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4491
M204 S6000
G1 X130.961 Y126.909 E.01912
G1 X129.606 Y116.618 E.3443
G1 X125.176 Y117.201 E.14822
G1 X126.375 Y126.305 E.30458
G1 X125.803 Y126.23 E.01912
G1 X124.485 Y116.212 E.33516
G1 X130.018 Y115.483 E.18516
G1 X131.525 Y126.924 E.38279
M204 S10000
G1 X131.979 Y127.453 F42000
G1 F4491
M204 S6000
G1 X128.231 Y126.96 E.1254
G1 X128.231 Y126.746 E.0071
G1 X130.49 Y126.448 E.07559
G1 X129.256 Y117.075 E.31361
G1 X125.633 Y117.552 E.12121
G1 X126.848 Y126.778 E.30868
G1 X125.85 Y126.646 E.03337
G1 X125.756 Y127.362 E.02395
G1 X125.542 Y127.362 E.0071
G1 X124.028 Y115.862 E.38478
G1 X130.369 Y115.027 E.21216
G1 X131.917 Y126.783 E.39334
G3 X131.975 Y127.393 I-7.637 J1.043 E.02035
; WIPE_START
G1 F8843.478
G1 X129.989 Y127.163 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y129.41 Z10.4 F42000
G1 Z10
G1 E.8 F1800
G1 F4491
M204 S6000
G1 X125.247 Y138.26 E.29609
G1 X124.695 Y138.187 E.01847
G1 X125.894 Y129.084 E.30457
G1 X126.446 Y129.157 E.01847
G1 X126.42 Y129.351 E.0065
M204 S10000
G1 X126.816 Y129.464 F42000
G1 F4491
M204 S6000
G1 X126.867 Y129.075 E.01301
G1 X130.49 Y129.552 E.12121
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.472 Y132.072 E.21332
G1 X126.808 Y129.523 E.08529
M204 S250
G1 X127.205 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4491
M204 S5000
G1 X130.05 Y129.889 E.08819
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.861 Y132.123 E.18556
G1 X127.197 Y129.574 E.07901
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.185 Y129.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.876 Y129.74 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4491
M204 S6000
G1 X131.428 Y129.813 E.01847
G1 X130.229 Y138.916 E.30457
G1 X129.677 Y138.843 E.01847
G1 X130.868 Y129.799 E.30258
; WIPE_START
G1 F8843.478
G1 X131.428 Y129.813 E-.21279
G1 X131.24 Y131.24 E-.54721
; WIPE_END
M73 P77 R4
G1 E-.04 F1800
M204 S10000
G1 X125.977 Y128.685 Z10.4 F42000
G1 Z10
G1 E.8 F1800
G1 F4491
M204 S6000
G1 X131.884 Y129.462 E.19764
G1 X130.58 Y139.373 E.33158
G1 X124.239 Y138.538 E.21216
G1 X125.543 Y128.627 E.33158
G1 X125.918 Y128.677 E.01254
; WIPE_START
G1 F8843.478
G1 X127.901 Y128.938 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.532 Y136.193 Z10.4 F42000
G1 X124.622 Y138.984 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4491
M204 S5000
G1 X130.094 Y139.704 E.16961
G1 X129.935 Y140.914 E.03749
G1 X124.462 Y140.193 E.16961
G1 X124.568 Y139.39 E.02489
G1 X124.614 Y139.043 E.01075
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.599 Y139.283 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y131.652 Z10.4 F42000
G1 X126.073 Y117.889 Z10.4
G1 Z10
G1 E.8 F1800
G1 F4491
M204 S5000
G1 X128.367 Y117.587 E.0711
G1 X128.918 Y117.515 E.01709
G1 X130.05 Y126.111 E.26641
G1 X127.205 Y126.485 E.08819
G1 X126.081 Y117.949 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.056 Y117.637 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.841 Y125.229 Z10.4 F42000
G1 X130.51 Y141.387 Z10.4
G1 Z10
G1 E.8 F1800
G1 F4491
M204 S5000
G1 X123.77 Y140.499 E.20892
G3 X123.614 Y140.278 I.038 J-.192 E.0092
G1 X125.188 Y128.322 E.37052
G2 X125.188 Y127.68 I-3.322 J-.323 E.01976
G1 X123.614 Y115.72 E.37067
G3 X123.772 Y115.5 I.191 J-.029 E.00922
G1 X130.509 Y114.613 E.20878
G3 X130.581 Y114.615 I.031 J.214 E.00224
G3 X130.733 Y114.785 I-.044 J.192 E.00746
G1 X132.306 Y126.736 E.3704
G3 X132.352 Y128.842 I-9.99 J1.273 E.06486
G1 X130.733 Y141.215 E.38343
G3 X130.571 Y141.387 I-.194 J-.021 E.00777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.588 Y141.128 E-.76
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


G1 X130.321 Y141.165 F42000
G1 Z10
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.480853
G1 F4491
M204 S6000
G1 X130.531 Y139.564 E.05761
; WIPE_START
G1 F8220.439
G1 X130.321 Y141.165 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.98 Y138.678 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.192577
G1 F4491
M204 S6000
G1 X131.125 Y129.978 E.10701
; WIPE_START
G1 F15000
G1 X130.864 Y131.961 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.887 Y129.265 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.466962
G1 F4491
M204 S6000
G2 X131.983 Y128.404 I-18.559 J-2.495 E.02993
; LINE_WIDTH: 0.423327
G1 X132.014 Y128 E.01256
; LINE_WIDTH: 0.387795
G1 X132.032 Y127.658 E.00962
; WIPE_START
G1 F10438.587
G1 X132.014 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.062 Y126.058 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.192595
G1 F4491
M204 S6000
G1 X124.874 Y117.036 E.11099
M204 S10000
G1 X124.971 Y116.586 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50328
G1 F4491
M204 S6000
G1 X125.114 Y116.567 E.00542
; LINE_WIDTH: 0.523628
G1 X125.178 Y116.579 E.00253
; LINE_WIDTH: 0.564324
G1 X125.241 Y116.591 E.00274
; LINE_WIDTH: 0.60502
G1 X125.305 Y116.603 E.00295
; LINE_WIDTH: 0.645716
G1 X125.368 Y116.616 E.00317
; LINE_WIDTH: 0.70654
G1 X125.431 Y116.628 E.00349
G1 X129.212 Y116.13 E.20619
; LINE_WIDTH: 0.686658
G1 X129.27 Y116.102 E.00338
; LINE_WIDTH: 0.645974
G1 X129.328 Y116.074 E.00317
; LINE_WIDTH: 0.60529
G1 X129.386 Y116.045 E.00296
; LINE_WIDTH: 0.564606
G1 X129.444 Y116.017 E.00274
; LINE_WIDTH: 0.512388
G3 X129.585 Y115.978 I.13 J.194 E.00573
M204 S10000
G1 X129.856 Y116.38 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192605
G1 F4491
M204 S6000
G1 X131.219 Y126.737 E.12742
M204 S10000
G1 X130.748 Y126.853 F42000
; LINE_WIDTH: 0.429493
G1 F4491
M204 S6000
G1 X130.549 Y126.853 E.00627
; LINE_WIDTH: 0.38515
G1 X130.35 Y126.853 E.00555
; LINE_WIDTH: 0.340808
G1 X130.151 Y126.853 E.00483
; LINE_WIDTH: 0.296465
G1 X129.952 Y126.853 E.00411
; LINE_WIDTH: 0.252122
G1 X129.753 Y126.853 E.00339
; LINE_WIDTH: 0.20778
G1 X129.554 Y126.853 E.00267
; LINE_WIDTH: 0.163437
G1 X129.355 Y126.853 E.00195
; LINE_WIDTH: 0.119094
G1 X129.156 Y126.853 E.00124
; WIPE_START
G1 F15000
G1 X129.355 Y126.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.034 Y126.853 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.507829
G1 F4491
M204 S6000
G1 X127.708 Y126.853 E.01236
; LINE_WIDTH: 0.458957
G1 X127.382 Y126.853 E.01106
; LINE_WIDTH: 0.410086
G1 X127.055 Y126.853 E.00976
; WIPE_START
G1 F9804.848
G1 X127.382 Y126.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.143 Y129.322 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.192587
G1 F4491
M204 S6000
G1 X124.998 Y138.022 E.10701
; WIPE_START
G1 F15000
G1 X125.259 Y136.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y138.735 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.480834
G1 F4491
M204 S6000
G1 X124.025 Y140.335 E.05759
; CHANGE_LAYER
; Z_HEIGHT: 10.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.794
G1 X124.236 Y138.735 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 51/73
; update layer progress
M73 L51
M991 S0 P50 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z10.4 I1.2 J.201 P1  F42000
G1 X126.188 Y127.086 Z10.4
G1 Z10.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4491
M204 S5000
G1 X131.661 Y127.807 E.16961
G1 X131.501 Y129.016 E.03749
G1 X126.029 Y128.296 E.16961
G1 X126.13 Y127.523 E.02394
G1 X126.18 Y127.146 E.0117
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.166 Y127.385 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.533 Y126.984 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4491
M204 S6000
G1 X130.961 Y126.909 E.01912
G1 X129.606 Y116.618 E.3443
G1 X125.176 Y117.201 E.14822
G1 X126.375 Y126.305 E.30458
G1 X125.803 Y126.23 E.01912
G1 X124.485 Y116.212 E.33516
G1 X130.018 Y115.483 E.18516
G1 X131.525 Y126.924 E.38279
M204 S10000
G1 X131.979 Y127.453 F42000
G1 F4491
M204 S6000
G1 X128.231 Y126.96 E.1254
G1 X128.231 Y126.746 E.0071
G1 X130.49 Y126.448 E.07559
G1 X129.256 Y117.075 E.31361
G1 X125.633 Y117.552 E.12121
G1 X126.848 Y126.778 E.30868
G1 X125.85 Y126.646 E.03337
G1 X125.756 Y127.362 E.02395
G1 X125.542 Y127.362 E.0071
G1 X124.028 Y115.862 E.38478
G1 X130.369 Y115.027 E.21216
G1 X131.917 Y126.783 E.39334
G3 X131.975 Y127.393 I-7.646 J1.044 E.02035
; WIPE_START
G1 F8843.478
G1 X129.989 Y127.163 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y129.41 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
G1 F4491
M204 S6000
G1 X125.247 Y138.26 E.29609
G1 X124.695 Y138.187 E.01847
G1 X125.894 Y129.084 E.30457
G1 X126.446 Y129.157 E.01847
G1 X126.42 Y129.351 E.0065
M204 S10000
G1 X126.816 Y129.464 F42000
G1 F4491
M204 S6000
G1 X126.867 Y129.075 E.01301
G1 X130.49 Y129.552 E.12121
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.496 Y131.894 E.21927
G1 X126.808 Y129.523 E.07934
M204 S250
G1 X127.205 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4491
M204 S5000
G1 X130.05 Y129.889 E.08819
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.885 Y131.946 E.19107
G1 X127.197 Y129.574 E.07349
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.185 Y129.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.876 Y129.74 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4491
M204 S6000
G1 X131.428 Y129.813 E.01847
G1 X130.229 Y138.916 E.30457
G1 X129.677 Y138.843 E.01847
G1 X130.868 Y129.799 E.30258
; WIPE_START
G1 F8843.478
G1 X131.428 Y129.813 E-.21279
G1 X131.24 Y131.24 E-.54721
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.977 Y128.685 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
G1 F4491
M204 S6000
G1 X131.884 Y129.462 E.19764
G1 X130.58 Y139.373 E.33158
G1 X124.239 Y138.538 E.21216
G1 X125.543 Y128.627 E.33158
G1 X125.918 Y128.677 E.01254
; WIPE_START
G1 F8843.478
G1 X127.901 Y128.938 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.532 Y136.193 Z10.6 F42000
G1 X124.622 Y138.984 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4491
M204 S5000
G1 X130.094 Y139.704 E.16961
G1 X129.935 Y140.914 E.03749
G1 X124.462 Y140.193 E.16961
G1 X124.564 Y139.421 E.02394
G1 X124.614 Y139.043 E.0117
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.599 Y139.283 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y131.652 Z10.6 F42000
G1 X126.073 Y117.889 Z10.6
G1 Z10.2
G1 E.8 F1800
G1 F4491
M204 S5000
G1 X128.42 Y117.58 E.07273
G1 X128.918 Y117.515 E.01545
G1 X130.05 Y126.111 E.26641
G1 X127.205 Y126.485 E.08819
G1 X126.081 Y117.949 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.056 Y117.638 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.841 Y125.23 Z10.6 F42000
G1 X130.51 Y141.387 Z10.6
G1 Z10.2
G1 E.8 F1800
G1 F4491
M204 S5000
G1 X123.77 Y140.499 E.20891
G3 X123.614 Y140.277 I.039 J-.193 E.0092
G1 X125.188 Y128.32 E.37059
G2 X125.188 Y127.68 I-2.94 J-.32 E.01971
G1 X123.614 Y115.72 E.37066
M73 P78 R4
G3 X123.77 Y115.5 I.19 J-.03 E.00919
G1 X130.509 Y114.613 E.20883
G3 X130.581 Y114.615 I.031 J.214 E.00224
G3 X130.733 Y114.785 I-.044 J.192 E.00746
G1 X132.306 Y126.736 E.37039
G3 X132.352 Y128.842 I-9.992 J1.273 E.06486
G1 X130.733 Y141.215 E.38342
G3 X130.571 Y141.387 I-.192 J-.018 E.00782
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.588 Y141.128 E-.76
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


G1 X130.321 Y141.165 F42000
G1 Z10.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.480864
G1 F4491
M204 S6000
G1 X130.531 Y139.564 E.05761
; WIPE_START
G1 F8220.227
G1 X130.321 Y141.165 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.98 Y138.678 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
; LINE_WIDTH: 0.192577
G1 F4491
M204 S6000
G1 X131.125 Y129.978 E.10701
; WIPE_START
G1 F15000
G1 X130.864 Y131.961 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.887 Y129.265 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
; LINE_WIDTH: 0.466963
G1 F4491
M204 S6000
G2 X131.983 Y128.404 I-18.593 J-2.498 E.02993
; LINE_WIDTH: 0.423328
G1 X132.014 Y128 E.01256
; LINE_WIDTH: 0.387806
G1 X132.032 Y127.658 E.00962
; WIPE_START
G1 F10438.251
G1 X132.014 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.062 Y126.058 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
; LINE_WIDTH: 0.192606
G1 F4491
M204 S6000
G1 X124.874 Y117.036 E.111
M204 S10000
G1 X124.971 Y116.586 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50329
G1 F4491
M204 S6000
G1 X125.115 Y116.567 E.00543
; LINE_WIDTH: 0.523644
G1 X125.178 Y116.579 E.00253
; LINE_WIDTH: 0.564332
G1 X125.241 Y116.591 E.00274
; LINE_WIDTH: 0.60502
G1 X125.305 Y116.603 E.00295
; LINE_WIDTH: 0.645708
G1 X125.368 Y116.616 E.00317
; LINE_WIDTH: 0.70653
G1 X125.431 Y116.628 E.00349
G1 X129.212 Y116.13 E.20619
; LINE_WIDTH: 0.686658
G1 X129.27 Y116.102 E.00338
; LINE_WIDTH: 0.645974
G1 X129.328 Y116.074 E.00317
; LINE_WIDTH: 0.60529
G1 X129.386 Y116.045 E.00296
; LINE_WIDTH: 0.564606
G1 X129.444 Y116.017 E.00274
; LINE_WIDTH: 0.512389
G3 X129.585 Y115.978 I.13 J.194 E.00573
M204 S10000
G1 X129.856 Y116.38 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192595
G1 F4491
M204 S6000
G1 X131.219 Y126.737 E.12741
M204 S10000
G1 X130.748 Y126.853 F42000
; LINE_WIDTH: 0.429476
G1 F4491
M204 S6000
G1 X130.549 Y126.853 E.00627
; LINE_WIDTH: 0.385136
G1 X130.35 Y126.853 E.00555
; LINE_WIDTH: 0.340796
G1 X130.151 Y126.853 E.00483
; LINE_WIDTH: 0.296455
G1 X129.952 Y126.853 E.00411
; LINE_WIDTH: 0.252115
G1 X129.753 Y126.853 E.00339
; LINE_WIDTH: 0.207774
G1 X129.554 Y126.853 E.00267
; LINE_WIDTH: 0.163434
G1 X129.355 Y126.853 E.00195
; LINE_WIDTH: 0.119093
G1 X129.156 Y126.853 E.00124
; WIPE_START
G1 F15000
G1 X129.355 Y126.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.034 Y126.853 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
; LINE_WIDTH: 0.507829
G1 F4491
M204 S6000
G1 X127.708 Y126.853 E.01236
; LINE_WIDTH: 0.458957
G1 X127.382 Y126.853 E.01106
; LINE_WIDTH: 0.410085
G1 X127.055 Y126.853 E.00976
; WIPE_START
G1 F9804.859
G1 X127.382 Y126.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.143 Y129.322 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
; LINE_WIDTH: 0.192587
G1 F4491
M204 S6000
G1 X124.998 Y138.022 E.10701
; WIPE_START
G1 F15000
G1 X125.259 Y136.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y138.735 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
; LINE_WIDTH: 0.480833
G1 F4491
M204 S6000
G1 X124.025 Y140.335 E.05759
; CHANGE_LAYER
; Z_HEIGHT: 10.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.819
G1 X124.236 Y138.735 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 52/73
; update layer progress
M73 L52
M991 S0 P51 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z10.6 I1.2 J.201 P1  F42000
G1 X126.188 Y127.086 Z10.6
G1 Z10.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4469
M204 S5000
G1 X131.661 Y127.807 E.16961
G1 X131.501 Y129.016 E.03749
G1 X126.029 Y128.296 E.16961
G1 X126.126 Y127.554 E.023
G1 X126.18 Y127.146 E.01265
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.166 Y127.385 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.533 Y126.984 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4469
M204 S6000
G1 X130.961 Y126.909 E.01912
G1 X129.606 Y116.618 E.3443
G1 X125.176 Y117.201 E.14822
G1 X126.375 Y126.305 E.30458
G1 X125.803 Y126.23 E.01912
G1 X124.485 Y116.212 E.33516
G1 X130.018 Y115.483 E.18516
G1 X131.525 Y126.924 E.38279
M204 S10000
G1 X131.979 Y127.453 F42000
G1 F4469
M204 S6000
G1 X128.231 Y126.96 E.1254
G1 X128.231 Y126.746 E.0071
G1 X130.49 Y126.448 E.07559
G1 X129.256 Y117.075 E.31361
G1 X125.633 Y117.552 E.12121
G1 X126.848 Y126.778 E.30868
G1 X125.85 Y126.646 E.03337
G1 X125.756 Y127.362 E.02395
G1 X125.542 Y127.362 E.0071
G1 X124.028 Y115.862 E.38478
G1 X130.369 Y115.027 E.21216
G1 X131.917 Y126.783 E.39334
G3 X131.975 Y127.393 I-7.646 J1.044 E.02035
; WIPE_START
G1 F8843.478
G1 X129.989 Y127.163 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y129.41 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
G1 F4469
M204 S6000
G1 X125.247 Y138.26 E.29609
G1 X124.695 Y138.187 E.01847
G1 X125.894 Y129.084 E.30457
G1 X126.446 Y129.157 E.01847
G1 X126.42 Y129.351 E.0065
M204 S10000
G1 X126.816 Y129.464 F42000
G1 F4469
M204 S6000
G1 X126.867 Y129.075 E.01301
G1 X130.49 Y129.552 E.12121
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.519 Y131.717 E.22522
G1 X126.808 Y129.523 E.07339
M204 S250
G1 X127.205 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4469
M204 S5000
G1 X130.05 Y129.889 E.08819
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.908 Y131.768 E.19658
G1 X127.197 Y129.574 E.06798
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.185 Y129.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.876 Y129.74 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4469
M204 S6000
G1 X131.428 Y129.813 E.01847
G1 X130.229 Y138.916 E.30457
G1 X129.677 Y138.843 E.01847
G1 X130.868 Y129.799 E.30258
; WIPE_START
G1 F8843.478
G1 X131.428 Y129.813 E-.21279
G1 X131.24 Y131.24 E-.54721
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.977 Y128.685 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
G1 F4469
M204 S6000
G1 X131.884 Y129.462 E.19764
G1 X130.58 Y139.373 E.33158
G1 X124.239 Y138.538 E.21216
G1 X125.543 Y128.627 E.33158
G1 X125.918 Y128.677 E.01254
; WIPE_START
G1 F8843.478
G1 X127.901 Y128.938 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.655 Y121.408 Z10.8 F42000
G1 X126.073 Y117.889 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4469
M204 S5000
G1 X128.473 Y117.573 E.07437
G1 X128.918 Y117.515 E.01382
G1 X130.05 Y126.111 E.26641
G1 X127.205 Y126.485 E.08819
G1 X126.081 Y117.949 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.057 Y117.639 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.844 Y125.174 Z10.8 F42000
G1 X124.622 Y138.984 Z10.8
G1 Z10.4
G1 E.8 F1800
G1 F4469
M204 S5000
G1 X130.094 Y139.704 E.16961
G1 X129.935 Y140.914 E.03749
G1 X124.462 Y140.193 E.16961
G1 X124.56 Y139.451 E.023
G1 X124.614 Y139.043 E.01265
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.599 Y139.283 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.51 Y141.387 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
G1 F4469
M204 S5000
G1 X123.77 Y140.499 E.20891
G3 X123.614 Y140.278 I.038 J-.192 E.0092
G1 X125.188 Y128.322 E.37053
G2 X125.188 Y127.68 I-3.323 J-.323 E.01976
G1 X123.614 Y115.72 E.37067
G3 X123.77 Y115.501 I.19 J-.03 E.00917
G1 X130.508 Y114.613 E.20885
G3 X130.581 Y114.615 I.031 J.214 E.00224
G3 X130.733 Y114.785 I-.042 J.189 E.0075
G1 X132.306 Y126.736 E.37038
G3 X132.352 Y128.842 I-9.992 J1.273 E.06486
G1 X130.733 Y141.215 E.38342
G3 X130.571 Y141.387 I-.194 J-.02 E.00778
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.588 Y141.128 E-.76
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


G1 X130.321 Y141.165 F42000
G1 Z10.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.480845
G1 F4469
M204 S6000
M73 P79 R4
G1 X130.531 Y139.564 E.05761
; WIPE_START
G1 F8220.593
G1 X130.321 Y141.165 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.98 Y138.678 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
; LINE_WIDTH: 0.192577
G1 F4469
M204 S6000
G1 X131.125 Y129.978 E.10701
; WIPE_START
G1 F15000
G1 X130.864 Y131.961 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.887 Y129.265 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
; LINE_WIDTH: 0.466963
G1 F4469
M204 S6000
G2 X131.983 Y128.404 I-18.559 J-2.495 E.02993
; LINE_WIDTH: 0.423328
G1 X132.014 Y128 E.01256
; LINE_WIDTH: 0.38779
G1 X132.032 Y127.658 E.00962
; WIPE_START
G1 F10438.734
G1 X132.014 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.062 Y126.058 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
; LINE_WIDTH: 0.192595
G1 F4469
M204 S6000
G1 X124.874 Y117.036 E.11099
M204 S10000
G1 X124.971 Y116.586 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.5033
G1 F4469
M204 S6000
G1 X125.114 Y116.567 E.00542
; LINE_WIDTH: 0.523646
G1 X125.178 Y116.579 E.00253
; LINE_WIDTH: 0.564338
G1 X125.241 Y116.591 E.00274
; LINE_WIDTH: 0.60503
G1 X125.305 Y116.603 E.00295
; LINE_WIDTH: 0.645722
G1 X125.368 Y116.616 E.00317
; LINE_WIDTH: 0.70653
G1 X125.431 Y116.628 E.00349
G1 X129.212 Y116.13 E.20619
; LINE_WIDTH: 0.68664
G1 X129.27 Y116.102 E.00338
; LINE_WIDTH: 0.64596
G1 X129.328 Y116.074 E.00317
; LINE_WIDTH: 0.60528
G1 X129.386 Y116.045 E.00296
; LINE_WIDTH: 0.5646
G1 X129.444 Y116.017 E.00274
; LINE_WIDTH: 0.512388
G3 X129.585 Y115.978 I.13 J.194 E.00572
M204 S10000
G1 X129.856 Y116.38 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192595
G1 F4469
M204 S6000
G1 X131.219 Y126.737 E.12741
M204 S10000
G1 X130.748 Y126.853 F42000
; LINE_WIDTH: 0.429476
G1 F4469
M204 S6000
G1 X130.549 Y126.853 E.00627
; LINE_WIDTH: 0.385136
G1 X130.35 Y126.853 E.00555
; LINE_WIDTH: 0.340796
G1 X130.151 Y126.853 E.00483
; LINE_WIDTH: 0.296455
G1 X129.952 Y126.853 E.00411
; LINE_WIDTH: 0.252115
G1 X129.753 Y126.853 E.00339
; LINE_WIDTH: 0.207774
G1 X129.554 Y126.853 E.00267
; LINE_WIDTH: 0.163434
G1 X129.355 Y126.853 E.00195
; LINE_WIDTH: 0.119093
G1 X129.156 Y126.853 E.00124
; WIPE_START
G1 F15000
G1 X129.355 Y126.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.034 Y126.853 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
; LINE_WIDTH: 0.507829
G1 F4469
M204 S6000
G1 X127.708 Y126.853 E.01236
; LINE_WIDTH: 0.458957
G1 X127.382 Y126.853 E.01106
; LINE_WIDTH: 0.410085
G1 X127.055 Y126.853 E.00976
; WIPE_START
G1 F9804.859
G1 X127.382 Y126.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.143 Y129.322 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
; LINE_WIDTH: 0.192587
G1 F4469
M204 S6000
G1 X124.998 Y138.022 E.10702
; WIPE_START
G1 F15000
G1 X125.259 Y136.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y138.735 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
; LINE_WIDTH: 0.480858
G1 F4469
M204 S6000
G1 X124.025 Y140.335 E.0576
; CHANGE_LAYER
; Z_HEIGHT: 10.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F8220.341
G1 X124.236 Y138.735 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 53/73
; update layer progress
M73 L53
M991 S0 P52 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z10.8 I1.2 J.201 P1  F42000
M73 P79 R3
G1 X126.188 Y127.086 Z10.8
G1 Z10.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4469
M204 S5000
G1 X131.661 Y127.807 E.16961
G1 X131.501 Y129.016 E.03749
G1 X126.029 Y128.296 E.16961
G1 X126.122 Y127.584 E.02205
G1 X126.18 Y127.146 E.01359
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.166 Y127.385 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.533 Y126.984 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4469
M204 S6000
G1 X130.961 Y126.909 E.01912
G1 X129.606 Y116.618 E.3443
G1 X125.176 Y117.201 E.14822
G1 X126.375 Y126.305 E.30458
G1 X125.803 Y126.23 E.01912
G1 X124.485 Y116.212 E.33516
G1 X130.018 Y115.483 E.18516
G1 X131.525 Y126.924 E.38279
M204 S10000
G1 X131.979 Y127.453 F42000
G1 F4469
M204 S6000
G1 X128.231 Y126.96 E.1254
G1 X128.231 Y126.746 E.0071
G1 X130.49 Y126.448 E.07559
G1 X129.256 Y117.075 E.31361
G1 X125.633 Y117.552 E.12121
G1 X126.848 Y126.778 E.30868
G1 X125.85 Y126.646 E.03337
G1 X125.756 Y127.362 E.02395
G1 X125.542 Y127.362 E.0071
G1 X124.028 Y115.862 E.38478
G1 X130.369 Y115.027 E.21216
G1 X131.917 Y126.783 E.39334
G3 X131.975 Y127.393 I-7.644 J1.044 E.02035
; WIPE_START
G1 F8843.478
G1 X129.989 Y127.163 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y129.41 Z11 F42000
G1 Z10.6
G1 E.8 F1800
G1 F4469
M204 S6000
G1 X125.247 Y138.26 E.29609
G1 X124.695 Y138.187 E.01847
G1 X125.894 Y129.084 E.30457
G1 X126.446 Y129.157 E.01847
G1 X126.42 Y129.351 E.0065
M204 S10000
G1 X126.816 Y129.464 F42000
G1 F4469
M204 S6000
G1 X126.867 Y129.075 E.01301
G1 X130.49 Y129.552 E.12121
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.543 Y131.539 E.23117
G1 X126.808 Y129.523 E.06744
M204 S250
G1 X127.205 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4469
M204 S5000
G1 X130.05 Y129.889 E.08819
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.931 Y131.59 E.20209
G1 X127.197 Y129.574 E.06247
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.185 Y129.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.876 Y129.74 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4469
M204 S6000
G1 X131.428 Y129.813 E.01847
G1 X130.229 Y138.916 E.30457
G1 X129.677 Y138.843 E.01847
G1 X130.868 Y129.799 E.30258
; WIPE_START
G1 F8843.478
G1 X131.428 Y129.813 E-.21279
G1 X131.24 Y131.24 E-.54721
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.977 Y128.685 Z11 F42000
G1 Z10.6
G1 E.8 F1800
G1 F4469
M204 S6000
G1 X131.884 Y129.462 E.19764
G1 X130.58 Y139.373 E.33158
G1 X124.239 Y138.538 E.21216
G1 X125.543 Y128.627 E.33158
G1 X125.918 Y128.677 E.01254
; WIPE_START
G1 F8843.478
G1 X127.901 Y128.938 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.655 Y121.408 Z11 F42000
G1 X126.073 Y117.889 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4469
M204 S5000
G1 X128.525 Y117.567 E.07601
G1 X128.918 Y117.515 E.01218
G1 X130.05 Y126.111 E.2664
G1 X127.205 Y126.485 E.08819
G1 X126.081 Y117.949 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.057 Y117.64 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.844 Y125.175 Z11 F42000
G1 X124.622 Y138.984 Z11
G1 Z10.6
G1 E.8 F1800
G1 F4469
M204 S5000
G1 X130.094 Y139.704 E.16961
G1 X129.935 Y140.914 E.03749
G1 X124.462 Y140.193 E.16961
G1 X124.556 Y139.482 E.02205
G1 X124.614 Y139.043 E.01359
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.599 Y139.283 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.51 Y141.387 Z11 F42000
G1 Z10.6
G1 E.8 F1800
G1 F4469
M204 S5000
G1 X123.77 Y140.499 E.20891
G3 X123.614 Y140.277 I.038 J-.192 E.00919
G1 X125.188 Y128.322 E.37052
G2 X125.188 Y127.678 I-4.385 J-.322 E.01982
G1 X123.614 Y115.72 E.37059
G3 X123.77 Y115.501 I.192 J-.029 E.00915
G1 X130.508 Y114.613 E.20885
G3 X130.581 Y114.615 I.031 J.214 E.00225
G3 X130.733 Y114.785 I-.041 J.189 E.00749
G1 X132.306 Y126.736 E.37039
G3 X132.352 Y128.842 I-9.99 J1.273 E.06486
G1 X130.733 Y141.215 E.38342
G3 X130.571 Y141.387 I-.194 J-.02 E.00778
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.588 Y141.128 E-.76
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


G1 X130.321 Y141.165 F42000
G1 Z10.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.480862
G1 F4469
M204 S6000
G1 X130.531 Y139.564 E.05761
; WIPE_START
G1 F8220.277
G1 X130.321 Y141.165 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.98 Y138.678 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; LINE_WIDTH: 0.192577
G1 F4469
M204 S6000
G1 X131.125 Y129.978 E.10701
; WIPE_START
G1 F15000
G1 X130.864 Y131.961 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.887 Y129.265 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; LINE_WIDTH: 0.466963
G1 F4469
M204 S6000
M73 P80 R3
G2 X131.983 Y128.404 I-18.593 J-2.498 E.02993
; LINE_WIDTH: 0.423328
G1 X132.014 Y128 E.01256
; LINE_WIDTH: 0.387811
G1 X132.032 Y127.658 E.00962
; WIPE_START
G1 F10438.082
G1 X132.014 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.062 Y126.058 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; LINE_WIDTH: 0.192584
G1 F4469
M204 S6000
G1 X124.874 Y117.036 E.11098
M204 S10000
G1 X124.971 Y116.586 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50326
G1 F4469
M204 S6000
G1 X125.114 Y116.567 E.00542
; LINE_WIDTH: 0.523606
G1 X125.178 Y116.579 E.00253
; LINE_WIDTH: 0.564298
G1 X125.241 Y116.591 E.00274
; LINE_WIDTH: 0.60499
G1 X125.304 Y116.603 E.00295
; LINE_WIDTH: 0.645682
G1 X125.368 Y116.616 E.00317
; LINE_WIDTH: 0.706549
G1 X125.431 Y116.628 E.00349
G1 X129.212 Y116.13 E.2062
; LINE_WIDTH: 0.68672
G1 X129.27 Y116.102 E.00338
; LINE_WIDTH: 0.64604
G1 X129.328 Y116.074 E.00317
; LINE_WIDTH: 0.60536
G1 X129.386 Y116.046 E.00296
; LINE_WIDTH: 0.56468
G1 X129.444 Y116.017 E.00274
; LINE_WIDTH: 0.512466
G3 X129.585 Y115.978 I.13 J.194 E.00573
M204 S10000
G1 X129.856 Y116.38 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192606
G1 F4469
M204 S6000
G1 X131.219 Y126.737 E.12742
M204 S10000
G1 X130.748 Y126.853 F42000
; LINE_WIDTH: 0.429495
G1 F4469
M204 S6000
G1 X130.549 Y126.853 E.00627
; LINE_WIDTH: 0.385152
G1 X130.35 Y126.853 E.00555
; LINE_WIDTH: 0.340809
G1 X130.151 Y126.853 E.00483
; LINE_WIDTH: 0.296467
G1 X129.952 Y126.853 E.00411
; LINE_WIDTH: 0.252124
G1 X129.753 Y126.853 E.00339
; LINE_WIDTH: 0.207781
G1 X129.554 Y126.853 E.00267
; LINE_WIDTH: 0.163438
G1 X129.355 Y126.853 E.00195
; LINE_WIDTH: 0.119095
G1 X129.156 Y126.853 E.00124
; WIPE_START
G1 F15000
G1 X129.355 Y126.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.034 Y126.853 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; LINE_WIDTH: 0.507826
G1 F4469
M204 S6000
G1 X127.708 Y126.853 E.01236
; LINE_WIDTH: 0.458948
G1 X127.382 Y126.853 E.01106
; LINE_WIDTH: 0.410069
G1 X127.055 Y126.853 E.00976
; WIPE_START
G1 F9805.288
G1 X127.382 Y126.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.143 Y129.322 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; LINE_WIDTH: 0.192587
G1 F4469
M204 S6000
G1 X124.998 Y138.022 E.10701
; WIPE_START
G1 F15000
G1 X125.259 Y136.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y138.735 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; LINE_WIDTH: 0.480858
G1 F4469
M204 S6000
G1 X124.025 Y140.335 E.05759
; CHANGE_LAYER
; Z_HEIGHT: 10.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.351
G1 X124.236 Y138.735 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 54/73
; update layer progress
M73 L54
M991 S0 P53 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z11 I1.2 J.201 P1  F42000
G1 X126.188 Y127.086 Z11
G1 Z10.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4469
M204 S5000
G1 X131.661 Y127.807 E.16961
G1 X131.501 Y129.016 E.03749
G1 X126.029 Y128.296 E.16961
G1 X126.118 Y127.615 E.02111
G1 X126.18 Y127.146 E.01454
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.166 Y127.385 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.533 Y126.984 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4469
M204 S6000
G1 X130.961 Y126.909 E.01912
G1 X129.606 Y116.618 E.3443
G1 X125.176 Y117.201 E.14822
G1 X126.375 Y126.305 E.30459
G1 X125.803 Y126.23 E.01912
G1 X124.485 Y116.212 E.33516
G1 X130.018 Y115.483 E.18516
G1 X131.525 Y126.924 E.38279
M204 S10000
G1 X131.979 Y127.453 F42000
G1 F4469
M204 S6000
G1 X128.231 Y126.96 E.1254
G1 X128.231 Y126.746 E.0071
G1 X130.49 Y126.448 E.07559
G1 X129.256 Y117.075 E.31361
G1 X125.633 Y117.552 E.12121
G1 X126.848 Y126.778 E.30868
G1 X125.85 Y126.646 E.03337
G1 X125.756 Y127.362 E.02395
G1 X125.542 Y127.362 E.0071
G1 X124.028 Y115.862 E.38478
G1 X130.369 Y115.027 E.21216
G1 X131.917 Y126.783 E.39334
G3 X131.975 Y127.393 I-7.646 J1.044 E.02035
; WIPE_START
G1 F8843.478
G1 X129.989 Y127.163 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y129.41 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
G1 F4469
M204 S6000
G1 X125.247 Y138.26 E.29609
G1 X124.695 Y138.187 E.01847
G1 X125.894 Y129.084 E.30457
G1 X126.446 Y129.157 E.01847
G1 X126.42 Y129.351 E.0065
M204 S10000
G1 X126.816 Y129.464 F42000
G1 F4469
M204 S6000
G1 X126.867 Y129.075 E.01301
G1 X130.49 Y129.552 E.12121
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.566 Y131.361 E.23712
G1 X126.808 Y129.523 E.06149
M204 S250
G1 X127.205 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4469
M204 S5000
G1 X130.05 Y129.889 E.08819
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.955 Y131.412 E.2076
G1 X127.197 Y129.574 E.05696
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.185 Y129.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.876 Y129.74 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4469
M204 S6000
G1 X131.428 Y129.813 E.01847
G1 X130.229 Y138.916 E.30457
G1 X129.677 Y138.843 E.01847
G1 X130.868 Y129.799 E.30258
; WIPE_START
G1 F8843.478
G1 X131.428 Y129.813 E-.21279
G1 X131.24 Y131.24 E-.54721
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.977 Y128.685 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
G1 F4469
M204 S6000
G1 X131.884 Y129.462 E.19764
G1 X130.58 Y139.373 E.33158
G1 X124.239 Y138.538 E.21216
G1 X125.543 Y128.627 E.33158
G1 X125.918 Y128.677 E.01254
; WIPE_START
G1 F8843.478
G1 X127.901 Y128.938 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.655 Y121.408 Z11.2 F42000
G1 X126.073 Y117.889 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4469
M204 S5000
G1 X128.578 Y117.56 E.07764
G1 X128.918 Y117.515 E.01054
G1 X130.05 Y126.111 E.2664
G1 X127.205 Y126.485 E.08819
G1 X126.081 Y117.949 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.057 Y117.641 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.844 Y125.176 Z11.2 F42000
G1 X124.622 Y138.984 Z11.2
G1 Z10.8
G1 E.8 F1800
G1 F4469
M204 S5000
G1 X130.094 Y139.704 E.16961
G1 X129.935 Y140.914 E.03749
G1 X124.462 Y140.193 E.16961
G1 X124.552 Y139.512 E.02111
G1 X124.614 Y139.043 E.01454
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.599 Y139.283 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.51 Y141.387 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
G1 F4469
M204 S5000
G1 X123.77 Y140.499 E.20891
G3 X123.614 Y140.278 I.038 J-.192 E.0092
G1 X125.188 Y128.322 E.37052
G2 X125.188 Y127.68 I-3.321 J-.323 E.01976
G1 X123.614 Y115.72 E.37068
G3 X123.77 Y115.5 I.19 J-.03 E.00919
G1 X130.508 Y114.613 E.20882
G3 X130.581 Y114.615 I.031 J.214 E.00225
G3 X130.733 Y114.785 I-.042 J.189 E.0075
G1 X132.306 Y126.736 E.37037
G3 X132.352 Y128.842 I-9.992 J1.273 E.06486
G1 X130.733 Y141.215 E.38342
G3 X130.571 Y141.387 I-.194 J-.02 E.00779
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.587 Y141.128 E-.76
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


G1 X130.321 Y141.165 F42000
G1 Z10.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.480847
G1 F4469
M204 S6000
G1 X130.531 Y139.564 E.05761
; WIPE_START
G1 F8220.551
G1 X130.321 Y141.165 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.98 Y138.678 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
; LINE_WIDTH: 0.192577
G1 F4469
M204 S6000
G1 X131.125 Y129.978 E.10701
; WIPE_START
G1 F15000
G1 X130.864 Y131.961 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.887 Y129.265 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
; LINE_WIDTH: 0.466963
G1 F4469
M204 S6000
G2 X131.983 Y128.404 I-18.593 J-2.498 E.02993
; LINE_WIDTH: 0.423328
G1 X132.014 Y128 E.01256
; LINE_WIDTH: 0.387806
G1 X132.032 Y127.658 E.00962
; WIPE_START
G1 F10438.251
G1 X132.014 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.062 Y126.058 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
; LINE_WIDTH: 0.192584
G1 F4469
M204 S6000
G1 X124.874 Y117.036 E.11098
M204 S10000
G1 X124.971 Y116.586 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50325
G1 F4469
M204 S6000
G1 X125.114 Y116.567 E.00542
; LINE_WIDTH: 0.523606
G1 X125.178 Y116.579 E.00253
; LINE_WIDTH: 0.564298
G1 X125.241 Y116.591 E.00274
; LINE_WIDTH: 0.60499
G1 X125.305 Y116.603 E.00295
; LINE_WIDTH: 0.645682
G1 X125.368 Y116.616 E.00317
; LINE_WIDTH: 0.706529
G1 X125.431 Y116.628 E.00349
G1 X129.212 Y116.13 E.20619
; LINE_WIDTH: 0.68668
G1 X129.27 Y116.102 E.00338
; LINE_WIDTH: 0.646
G1 X129.328 Y116.074 E.00317
; LINE_WIDTH: 0.60532
G1 X129.386 Y116.045 E.00296
; LINE_WIDTH: 0.56464
G1 X129.444 Y116.017 E.00274
; LINE_WIDTH: 0.51243
G3 X129.585 Y115.978 I.13 J.194 E.00573
M204 S10000
G1 X129.856 Y116.38 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192606
G1 F4469
M204 S6000
M73 P81 R3
G1 X131.219 Y126.737 E.12742
M204 S10000
G1 X130.748 Y126.853 F42000
; LINE_WIDTH: 0.429476
G1 F4469
M204 S6000
G1 X130.549 Y126.853 E.00627
; LINE_WIDTH: 0.385136
G1 X130.35 Y126.853 E.00555
; LINE_WIDTH: 0.340795
G1 X130.151 Y126.853 E.00483
; LINE_WIDTH: 0.296455
G1 X129.952 Y126.853 E.00411
; LINE_WIDTH: 0.252115
G1 X129.753 Y126.853 E.00339
; LINE_WIDTH: 0.207774
G1 X129.554 Y126.853 E.00267
; LINE_WIDTH: 0.163434
G1 X129.355 Y126.853 E.00195
; LINE_WIDTH: 0.119093
G1 X129.156 Y126.853 E.00124
; WIPE_START
G1 F15000
G1 X129.355 Y126.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.034 Y126.853 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
; LINE_WIDTH: 0.507829
G1 F4469
M204 S6000
G1 X127.708 Y126.853 E.01236
; LINE_WIDTH: 0.458957
G1 X127.382 Y126.853 E.01106
; LINE_WIDTH: 0.410086
G1 X127.055 Y126.853 E.00976
; WIPE_START
G1 F9804.848
G1 X127.382 Y126.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.143 Y129.322 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
; LINE_WIDTH: 0.192587
G1 F4469
M204 S6000
G1 X124.998 Y138.022 E.10702
; WIPE_START
G1 F15000
G1 X125.259 Y136.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y138.735 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
; LINE_WIDTH: 0.480858
G1 F4469
M204 S6000
G1 X124.025 Y140.335 E.05759
; CHANGE_LAYER
; Z_HEIGHT: 11
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.351
G1 X124.236 Y138.735 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 55/73
; update layer progress
M73 L55
M991 S0 P54 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z11.2 I1.2 J.201 P1  F42000
G1 X126.188 Y127.086 Z11.2
G1 Z11
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4485
M204 S5000
G1 X131.661 Y127.807 E.16961
G1 X131.501 Y129.016 E.03749
G1 X126.029 Y128.296 E.16961
G1 X126.114 Y127.645 E.02016
G1 X126.18 Y127.146 E.01548
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.166 Y127.385 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.533 Y126.984 Z11.4 F42000
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4485
M204 S6000
G1 X130.961 Y126.909 E.01912
G1 X129.606 Y116.618 E.3443
G1 X125.176 Y117.201 E.14822
G1 X126.375 Y126.305 E.30458
G1 X125.803 Y126.23 E.01912
G1 X124.485 Y116.212 E.33516
G1 X130.018 Y115.483 E.18516
G1 X131.525 Y126.924 E.38279
M204 S10000
G1 X131.979 Y127.453 F42000
G1 F4485
M204 S6000
G1 X128.231 Y126.96 E.1254
G1 X128.231 Y126.746 E.0071
G1 X130.49 Y126.448 E.07559
G1 X129.256 Y117.075 E.31361
G1 X125.633 Y117.552 E.12121
G1 X126.848 Y126.778 E.30868
G1 X125.85 Y126.646 E.03337
G1 X125.756 Y127.362 E.02395
G1 X125.542 Y127.362 E.0071
G1 X124.028 Y115.862 E.38478
G1 X130.369 Y115.027 E.21216
G1 X131.917 Y126.783 E.39334
G3 X131.975 Y127.393 I-7.644 J1.044 E.02035
; WIPE_START
G1 F8843.478
G1 X129.989 Y127.163 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y129.41 Z11.4 F42000
G1 Z11
G1 E.8 F1800
G1 F4485
M204 S6000
G1 X125.247 Y138.26 E.29609
G1 X124.695 Y138.187 E.01847
G1 X125.894 Y129.084 E.30457
G1 X126.446 Y129.157 E.01847
G1 X126.42 Y129.351 E.0065
M204 S10000
G1 X126.816 Y129.464 F42000
G1 F4485
M204 S6000
G1 X126.867 Y129.075 E.01301
G1 X130.49 Y129.552 E.12121
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.589 Y131.183 E.24307
G1 X126.808 Y129.523 E.05555
M204 S250
G1 X127.205 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4485
M204 S5000
G1 X130.05 Y129.889 E.08819
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.978 Y131.234 E.21311
G1 X127.197 Y129.574 E.05145
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.185 Y129.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.876 Y129.74 Z11.4 F42000
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4485
M204 S6000
G1 X131.428 Y129.813 E.01847
G1 X130.229 Y138.916 E.30457
G1 X129.677 Y138.843 E.01847
G1 X130.868 Y129.799 E.30258
; WIPE_START
G1 F8843.478
G1 X131.428 Y129.813 E-.21279
G1 X131.24 Y131.24 E-.54721
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.622 Y138.848 Z11.4 F42000
G1 X130.58 Y139.373 Z11.4
G1 Z11
G1 E.8 F1800
G1 F4485
M204 S6000
G1 X124.239 Y138.538 E.21216
G1 X125.543 Y128.627 E.33158
G1 X131.884 Y129.462 E.21216
G1 X130.587 Y139.313 E.32959
; WIPE_START
G1 F8843.478
G1 X128.602 Y139.071 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.697 Y131.492 Z11.4 F42000
G1 X126.073 Y117.889 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4485
M204 S5000
G1 X128.631 Y117.553 E.07928
G1 X128.918 Y117.515 E.00891
G1 X130.05 Y126.111 E.26641
G1 X127.205 Y126.485 E.08819
G1 X126.081 Y117.949 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.057 Y117.642 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.844 Y125.177 Z11.4 F42000
G1 X124.622 Y138.984 Z11.4
G1 Z11
G1 E.8 F1800
G1 F4485
M204 S5000
G1 X130.094 Y139.704 E.16961
G1 X129.935 Y140.914 E.03749
G1 X124.462 Y140.193 E.16961
G1 X124.548 Y139.543 E.02016
G1 X124.614 Y139.043 E.01548
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.599 Y139.283 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.511 Y141.387 Z11.4 F42000
G1 Z11
G1 E.8 F1800
G1 F4485
M204 S5000
G1 X123.77 Y140.499 E.20892
G3 X123.614 Y140.278 I.039 J-.193 E.00919
G1 X125.188 Y128.322 E.37053
G2 X125.188 Y127.68 I-3.551 J-.323 E.01976
G1 X123.614 Y115.72 E.37066
G3 X123.772 Y115.5 I.192 J-.028 E.00922
G1 X130.509 Y114.613 E.20878
G3 X130.581 Y114.615 I.031 J.214 E.00224
G3 X130.733 Y114.785 I-.044 J.192 E.00747
G1 X132.306 Y126.736 E.37039
G3 X132.306 Y129.264 I-10.795 J1.264 E.07786
G1 X130.733 Y141.215 E.37039
G3 X130.571 Y141.387 I-.193 J-.02 E.00779
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.588 Y141.128 E-.76
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


G1 X130.321 Y141.165 F42000
G1 Z11
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.480853
G1 F4485
M204 S6000
G1 X130.531 Y139.564 E.05761
; WIPE_START
G1 F8220.439
G1 X130.321 Y141.165 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.98 Y138.678 Z11.4 F42000
G1 Z11
G1 E.8 F1800
; LINE_WIDTH: 0.192577
G1 F4485
M204 S6000
G1 X131.125 Y129.978 E.10701
; WIPE_START
G1 F15000
G1 X130.864 Y131.961 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.887 Y129.265 Z11.4 F42000
G1 Z11
G1 E.8 F1800
; LINE_WIDTH: 0.466985
G1 F4485
M204 S6000
G2 X131.983 Y128.404 I-18.594 J-2.498 E.02992
; LINE_WIDTH: 0.423328
G1 X132.014 Y128 E.01257
; LINE_WIDTH: 0.387797
G1 X132.032 Y127.658 E.00962
; WIPE_START
G1 F10438.528
G1 X132.014 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.062 Y126.058 Z11.4 F42000
G1 Z11
G1 E.8 F1800
; LINE_WIDTH: 0.192595
G1 F4485
M204 S6000
G1 X124.874 Y117.036 E.11099
M204 S10000
G1 X124.971 Y116.586 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50329
G1 F4485
M204 S6000
G1 X125.114 Y116.567 E.00542
; LINE_WIDTH: 0.523646
G1 X125.178 Y116.579 E.00253
; LINE_WIDTH: 0.564338
G1 X125.241 Y116.591 E.00274
; LINE_WIDTH: 0.60503
G1 X125.305 Y116.603 E.00295
; LINE_WIDTH: 0.645722
G1 X125.368 Y116.616 E.00317
; LINE_WIDTH: 0.70654
G1 X125.431 Y116.628 E.00349
G1 X129.212 Y116.13 E.20619
; LINE_WIDTH: 0.686658
G1 X129.27 Y116.102 E.00338
; LINE_WIDTH: 0.645974
G1 X129.328 Y116.074 E.00317
; LINE_WIDTH: 0.60529
G1 X129.386 Y116.045 E.00296
; LINE_WIDTH: 0.564606
G1 X129.444 Y116.017 E.00274
; LINE_WIDTH: 0.512389
G3 X129.585 Y115.978 I.13 J.194 E.00573
M204 S10000
G1 X129.856 Y116.38 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192595
G1 F4485
M204 S6000
G1 X131.219 Y126.737 E.12741
M204 S10000
G1 X130.748 Y126.853 F42000
; LINE_WIDTH: 0.429495
G1 F4485
M204 S6000
G1 X130.549 Y126.853 E.00627
; LINE_WIDTH: 0.385153
G1 X130.35 Y126.853 E.00555
; LINE_WIDTH: 0.34081
G1 X130.151 Y126.853 E.00483
; LINE_WIDTH: 0.296467
G1 X129.952 Y126.853 E.00411
; LINE_WIDTH: 0.252124
G1 X129.753 Y126.853 E.00339
; LINE_WIDTH: 0.207781
G1 X129.554 Y126.853 E.00267
; LINE_WIDTH: 0.163438
G1 X129.355 Y126.853 E.00195
; LINE_WIDTH: 0.119095
G1 X129.156 Y126.853 E.00124
; WIPE_START
G1 F15000
G1 X129.355 Y126.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.034 Y126.853 Z11.4 F42000
G1 Z11
G1 E.8 F1800
; LINE_WIDTH: 0.507818
G1 F4485
M204 S6000
G1 X127.708 Y126.853 E.01236
; LINE_WIDTH: 0.458952
G1 X127.382 Y126.853 E.01106
; LINE_WIDTH: 0.410086
G1 X127.055 Y126.853 E.00976
; WIPE_START
G1 F9804.843
G1 X127.382 Y126.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.143 Y129.322 Z11.4 F42000
G1 Z11
G1 E.8 F1800
; LINE_WIDTH: 0.192587
M73 P82 R3
G1 F4485
M204 S6000
G1 X124.998 Y138.022 E.10702
; WIPE_START
G1 F15000
G1 X125.259 Y136.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y138.735 Z11.4 F42000
G1 Z11
G1 E.8 F1800
; LINE_WIDTH: 0.480858
G1 F4485
M204 S6000
G1 X124.025 Y140.335 E.05759
; CHANGE_LAYER
; Z_HEIGHT: 11.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.351
G1 X124.236 Y138.735 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 56/73
; update layer progress
M73 L56
M991 S0 P55 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z11.4 I1.2 J.201 P1  F42000
G1 X126.188 Y127.086 Z11.4
G1 Z11.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4487
M204 S5000
G1 X131.661 Y127.807 E.16961
G1 X131.501 Y129.016 E.03749
G1 X126.029 Y128.296 E.16961
G1 X126.11 Y127.676 E.01922
G1 X126.18 Y127.146 E.01643
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.166 Y127.385 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.533 Y126.984 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4487
M204 S6000
G1 X130.961 Y126.909 E.01912
G1 X129.606 Y116.618 E.3443
G1 X125.176 Y117.201 E.14822
G1 X126.375 Y126.305 E.30458
G1 X125.803 Y126.23 E.01912
G1 X124.485 Y116.212 E.33516
G1 X130.018 Y115.483 E.18516
G1 X131.525 Y126.924 E.38279
M204 S10000
G1 X131.979 Y127.453 F42000
G1 F4487
M204 S6000
G1 X128.231 Y126.96 E.1254
G1 X128.231 Y126.746 E.0071
G1 X130.49 Y126.448 E.07559
G1 X129.256 Y117.075 E.31361
G1 X125.633 Y117.552 E.12121
G1 X126.848 Y126.778 E.30868
G1 X125.85 Y126.646 E.03337
G1 X125.756 Y127.362 E.02395
G1 X125.542 Y127.362 E.0071
G1 X124.028 Y115.862 E.38478
G1 X130.369 Y115.027 E.21216
G1 X131.917 Y126.783 E.39334
G3 X131.975 Y127.393 I-7.644 J1.044 E.02035
; WIPE_START
G1 F8843.478
G1 X129.989 Y127.163 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y129.41 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
G1 F4487
M204 S6000
G1 X125.247 Y138.26 E.29609
G1 X124.695 Y138.187 E.01847
G1 X125.894 Y129.084 E.30457
G1 X126.446 Y129.157 E.01847
G1 X126.42 Y129.351 E.0065
M204 S10000
G1 X126.816 Y129.464 F42000
G1 F4487
M204 S6000
G1 X126.867 Y129.075 E.01301
G1 X130.49 Y129.552 E.12121
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.613 Y131.005 E.24902
G1 X126.808 Y129.523 E.0496
M204 S250
G1 X127.205 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4487
M204 S5000
G1 X130.05 Y129.889 E.08819
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X127.002 Y131.057 E.21862
G1 X127.197 Y129.574 E.04594
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.185 Y129.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.876 Y129.74 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4487
M204 S6000
G1 X131.428 Y129.813 E.01847
G1 X130.229 Y138.916 E.30457
G1 X129.677 Y138.843 E.01847
G1 X130.868 Y129.799 E.30258
; WIPE_START
G1 F8843.478
G1 X131.428 Y129.813 E-.21279
G1 X131.24 Y131.24 E-.54721
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.622 Y138.848 Z11.6 F42000
G1 X130.58 Y139.373 Z11.6
G1 Z11.2
G1 E.8 F1800
G1 F4487
M204 S6000
G1 X124.239 Y138.538 E.21216
G1 X125.543 Y128.627 E.33158
G1 X131.884 Y129.462 E.21216
G1 X130.587 Y139.313 E.32959
; WIPE_START
G1 F8843.478
G1 X128.602 Y139.071 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.622 Y138.984 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4487
M204 S5000
G1 X130.094 Y139.704 E.16961
G1 X129.935 Y140.914 E.03749
G1 X124.462 Y140.193 E.16961
G1 X124.544 Y139.573 E.01922
G1 X124.614 Y139.043 E.01643
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.599 Y139.283 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y131.652 Z11.6 F42000
G1 X126.073 Y117.889 Z11.6
G1 Z11.2
G1 E.8 F1800
G1 F4487
M204 S5000
G1 X128.918 Y117.515 E.08819
G1 X130.05 Y126.111 E.2664
G1 X127.205 Y126.485 E.08819
G1 X126.081 Y117.949 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.058 Y117.646 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.842 Y125.238 Z11.6 F42000
G1 X130.511 Y141.387 Z11.6
G1 Z11.2
G1 E.8 F1800
G1 F4487
M204 S5000
G1 X123.77 Y140.499 E.20892
G3 X123.614 Y140.278 I.036 J-.191 E.00921
G1 X125.188 Y128.32 E.37059
G2 X125.188 Y127.68 I-2.786 J-.32 E.0197
G1 X123.614 Y115.72 E.37067
G3 X123.772 Y115.5 I.19 J-.03 E.00924
G1 X130.508 Y114.613 E.20877
G3 X130.581 Y114.615 I.031 J.213 E.00224
G3 X130.733 Y114.785 I-.044 J.192 E.00747
G1 X132.306 Y126.736 E.37039
G3 X132.306 Y129.264 I-10.795 J1.264 E.07786
G1 X130.733 Y141.215 E.37038
G3 X130.571 Y141.387 I-.192 J-.018 E.00783
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.588 Y141.128 E-.76
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


G1 X130.321 Y141.165 F42000
G1 Z11.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.480864
G1 F4487
M204 S6000
G1 X130.531 Y139.564 E.05761
; WIPE_START
G1 F8220.227
G1 X130.321 Y141.165 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.98 Y138.678 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; LINE_WIDTH: 0.192577
G1 F4487
M204 S6000
G1 X131.125 Y129.978 E.10701
; WIPE_START
G1 F15000
G1 X130.864 Y131.961 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.887 Y129.265 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; LINE_WIDTH: 0.46697
G1 F4487
M204 S6000
G2 X131.983 Y128.404 I-18.594 J-2.498 E.02992
; LINE_WIDTH: 0.423319
G1 X132.014 Y128 E.01257
; LINE_WIDTH: 0.387801
G1 X132.032 Y127.658 E.00962
; WIPE_START
G1 F10438.398
G1 X132.014 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.062 Y126.058 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; LINE_WIDTH: 0.192584
G1 F4487
M204 S6000
G1 X124.874 Y117.036 E.11098
M204 S10000
G1 X124.971 Y116.586 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50327
G1 F4487
M204 S6000
G1 X125.115 Y116.567 E.00542
; LINE_WIDTH: 0.523626
G1 X125.178 Y116.579 E.00253
; LINE_WIDTH: 0.564318
G1 X125.241 Y116.591 E.00274
; LINE_WIDTH: 0.60501
G1 X125.305 Y116.603 E.00295
; LINE_WIDTH: 0.645702
G1 X125.368 Y116.616 E.00317
; LINE_WIDTH: 0.70652
G1 X125.431 Y116.628 E.00349
G1 X129.212 Y116.13 E.20619
; LINE_WIDTH: 0.68664
G1 X129.27 Y116.102 E.00338
; LINE_WIDTH: 0.64596
G1 X129.328 Y116.074 E.00317
; LINE_WIDTH: 0.60528
G1 X129.386 Y116.045 E.00296
; LINE_WIDTH: 0.5646
G1 X129.444 Y116.017 E.00274
; LINE_WIDTH: 0.512388
G3 X129.585 Y115.978 I.13 J.194 E.00573
M204 S10000
G1 X129.856 Y116.38 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192606
G1 F4487
M204 S6000
G1 X131.219 Y126.737 E.12742
M204 S10000
G1 X130.748 Y126.853 F42000
; LINE_WIDTH: 0.429495
G1 F4487
M204 S6000
G1 X130.549 Y126.853 E.00627
; LINE_WIDTH: 0.385152
G1 X130.35 Y126.853 E.00555
; LINE_WIDTH: 0.340809
G1 X130.151 Y126.853 E.00483
; LINE_WIDTH: 0.296467
G1 X129.952 Y126.853 E.00411
; LINE_WIDTH: 0.252124
G1 X129.753 Y126.853 E.00339
; LINE_WIDTH: 0.207781
G1 X129.554 Y126.853 E.00267
; LINE_WIDTH: 0.163438
G1 X129.355 Y126.853 E.00195
; LINE_WIDTH: 0.119095
G1 X129.156 Y126.853 E.00124
; WIPE_START
G1 F15000
G1 X129.355 Y126.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.034 Y126.853 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; LINE_WIDTH: 0.507826
G1 F4487
M204 S6000
G1 X127.708 Y126.853 E.01236
; LINE_WIDTH: 0.458948
G1 X127.382 Y126.853 E.01106
; LINE_WIDTH: 0.410069
G1 X127.055 Y126.853 E.00976
; WIPE_START
G1 F9805.288
G1 X127.382 Y126.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.143 Y129.322 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; LINE_WIDTH: 0.192587
G1 F4487
M204 S6000
G1 X124.998 Y138.022 E.10702
; WIPE_START
G1 F15000
G1 X125.259 Y136.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y138.735 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; LINE_WIDTH: 0.480848
G1 F4487
M204 S6000
G1 X124.025 Y140.335 E.05759
; CHANGE_LAYER
; Z_HEIGHT: 11.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.534
G1 X124.236 Y138.735 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 57/73
; update layer progress
M73 L57
M991 S0 P56 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z11.6 I1.2 J.201 P1  F42000
G1 X126.188 Y127.086 Z11.6
G1 Z11.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6808
M204 S5000
G1 X131.661 Y127.807 E.16961
G1 X131.501 Y129.016 E.03749
G1 X126.029 Y128.296 E.16961
G1 X126.106 Y127.706 E.01827
G1 X126.18 Y127.146 E.01737
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.166 Y127.385 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.533 Y126.984 Z11.8 F42000
M73 P83 R3
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6808
M204 S6000
G1 X127.369 Y126.436 E.1393
G1 X127.223 Y126.417 E.00488
G1 X125.803 Y126.23 E.04751
G1 X124.485 Y116.212 E.33516
G1 X130.018 Y115.483 E.18516
G1 X131.525 Y126.924 E.38279
M204 S10000
G1 X131.979 Y127.453 F42000
G1 F6808
M204 S6000
G1 X125.85 Y126.646 E.20504
G1 X125.756 Y127.362 E.02395
G1 X125.542 Y127.362 E.0071
G1 X124.028 Y115.862 E.38478
G1 X130.369 Y115.027 E.21216
G1 X131.917 Y126.783 E.39334
G3 X131.975 Y127.393 I-7.646 J1.044 E.02035
; WIPE_START
G1 F8843.478
G1 X129.99 Y127.151 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y129.41 Z11.8 F42000
G1 Z11.4
G1 E.8 F1800
G1 F6808
M204 S6000
G1 X125.247 Y138.26 E.29609
G1 X124.695 Y138.187 E.01847
G1 X125.894 Y129.084 E.30457
G1 X126.446 Y129.157 E.01847
G1 X126.42 Y129.351 E.0065
M204 S10000
G1 X126.816 Y129.464 F42000
G1 F6808
M204 S6000
G1 X126.867 Y129.075 E.01301
G1 X130.49 Y129.552 E.12121
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.636 Y130.828 E.25497
G1 X126.808 Y129.523 E.04365
M204 S250
G1 X127.205 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6808
M204 S5000
G1 X130.05 Y129.889 E.08819
G1 X128.918 Y138.485 E.26641
G1 X126.073 Y138.111 E.08819
G1 X127.025 Y130.879 E.22413
G1 X127.197 Y129.574 E.04043
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.185 Y129.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.876 Y129.74 Z11.8 F42000
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6808
M204 S6000
G1 X131.428 Y129.813 E.01847
G1 X130.229 Y138.916 E.30457
G1 X129.677 Y138.843 E.01847
G1 X130.868 Y129.799 E.30258
; WIPE_START
G1 F8843.478
G1 X131.428 Y129.813 E-.21279
G1 X131.24 Y131.24 E-.54721
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.622 Y138.848 Z11.8 F42000
G1 X130.58 Y139.373 Z11.8
G1 Z11.4
G1 E.8 F1800
G1 F6808
M204 S6000
G1 X124.239 Y138.538 E.21216
G1 X125.543 Y128.627 E.33158
G1 X131.884 Y129.462 E.21216
G1 X130.587 Y139.313 E.32959
; WIPE_START
G1 F8843.478
G1 X128.602 Y139.071 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.622 Y138.984 Z11.8 F42000
G1 Z11.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6808
M204 S5000
G1 X130.094 Y139.704 E.16961
G1 X129.935 Y140.914 E.03749
G1 X124.462 Y140.193 E.16961
G1 X124.54 Y139.604 E.01827
G1 X124.614 Y139.043 E.01737
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.599 Y139.283 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.51 Y141.387 Z11.8 F42000
G1 Z11.4
G1 E.8 F1800
G1 F6808
M204 S5000
G1 X123.77 Y140.499 E.20892
G3 X123.614 Y140.277 I.038 J-.192 E.00919
G1 X125.188 Y128.32 E.37059
G2 X125.188 Y127.68 I-2.783 J-.32 E.0197
G1 X123.614 Y115.72 E.37067
G3 X123.77 Y115.5 I.19 J-.03 E.00918
G1 X130.508 Y114.613 E.20883
G3 X130.581 Y114.615 I.031 J.213 E.00224
G3 X130.733 Y114.785 I-.044 J.192 E.00748
G1 X132.306 Y126.736 E.37039
G3 X132.306 Y129.264 I-10.795 J1.264 E.07786
G1 X130.733 Y141.215 E.37039
G3 X130.571 Y141.387 I-.194 J-.02 E.00779
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.588 Y141.128 E-.76
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


G1 X130.321 Y141.165 F42000
G1 Z11.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.480845
G1 F6808
M204 S6000
G1 X130.531 Y139.564 E.05761
; WIPE_START
G1 F8220.6
G1 X130.321 Y141.165 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.98 Y138.678 Z11.8 F42000
G1 Z11.4
G1 E.8 F1800
; LINE_WIDTH: 0.192587
G1 F6808
M204 S6000
G1 X131.125 Y129.978 E.10701
; WIPE_START
G1 F15000
G1 X130.864 Y131.961 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.887 Y129.265 Z11.8 F42000
G1 Z11.4
G1 E.8 F1800
; LINE_WIDTH: 0.46697
G1 F6808
M204 S6000
G2 X131.983 Y128.404 I-18.581 J-2.497 E.02993
; LINE_WIDTH: 0.423313
G1 X132.014 Y128 E.01257
; LINE_WIDTH: 0.387777
G1 X132.032 Y127.658 E.00962
; WIPE_START
G1 F10439.106
G1 X132.014 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.223 Y126.515 Z11.8 F42000
G1 Z11.4
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.42742
M106 S255
G1 F3000
M204 S6000
G1 X131.102 Y126.267 E.05939
G1 X131.052 Y125.886 E.01205
G1 X128.4 Y126.235 E.08381
G1 X126.927 Y126.041 E.04655
G1 X131.002 Y125.505 E.12877
G1 X130.952 Y125.124 E.01205
G1 X126.078 Y125.765 E.154
G1 X126.028 Y125.384 E.01205
G1 X130.901 Y124.743 E.154
G1 X130.851 Y124.361 E.01205
G1 X125.978 Y125.003 E.154
G1 X125.928 Y124.622 E.01205
G1 X130.801 Y123.98 E.154
G1 X130.751 Y123.599 E.01205
G1 X125.878 Y124.241 E.154
G1 X125.827 Y123.859 E.01205
G1 X130.701 Y123.218 E.154
G1 X130.65 Y122.837 E.01205
G1 X125.777 Y123.478 E.154
G1 X125.727 Y123.097 E.01205
G1 X130.6 Y122.455 E.154
G1 X130.55 Y122.074 E.01205
G1 X125.677 Y122.716 E.154
G1 X125.627 Y122.334 E.01205
G1 X130.5 Y121.693 E.154
G1 X130.45 Y121.312 E.01205
G1 X125.576 Y121.953 E.154
G1 X125.526 Y121.572 E.01205
G1 X130.399 Y120.93 E.154
G1 X130.349 Y120.549 E.01205
G1 X125.476 Y121.191 E.154
G1 X125.426 Y120.81 E.01205
G1 X130.299 Y120.168 E.154
G1 X130.249 Y119.787 E.01205
G1 X125.376 Y120.428 E.154
G1 X125.326 Y120.047 E.01205
G1 X130.199 Y119.406 E.154
G1 X130.149 Y119.024 E.01205
G1 X125.275 Y119.666 E.154
G1 X125.225 Y119.285 E.01205
G1 X130.098 Y118.643 E.154
G1 X130.048 Y118.262 E.01205
G1 X125.175 Y118.904 E.154
G1 X125.125 Y118.522 E.01205
G1 X129.998 Y117.881 E.154
G1 X129.948 Y117.5 E.01205
G1 X125.075 Y118.141 E.154
G1 X125.024 Y117.76 E.01205
G1 X129.898 Y117.118 E.154
G1 X129.847 Y116.737 E.01205
G1 X124.974 Y117.379 E.154
G1 X124.924 Y116.998 E.01205
G1 X124.993 Y116.988 E.00217
G1 X125.158 Y117.115 E.00651
G1 X125.291 Y117.151 E.00432
G1 X126.974 Y116.929 E.05318
G1 X129.482 Y116.599 E.07928
G1 X129.602 Y116.53 E.00432
G1 X129.728 Y116.365 E.00651
G1 X129.965 Y116.334 E.00749
M106 S201.45
M204 S10000
G1 X124.96 Y116.577 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.497875
G1 F6808
M204 S6000
G1 X125.069 Y116.578 E.00404
; LINE_WIDTH: 0.527945
G1 X125.178 Y116.579 E.00431
; LINE_WIDTH: 0.566874
G1 X125.245 Y116.594 E.00294
; LINE_WIDTH: 0.61466
G1 F6296.569
G1 X125.312 Y116.609 E.00321
; LINE_WIDTH: 0.686045
G1 F5597.67
G1 X125.379 Y116.624 E.00361
G1 X129.261 Y116.113 E.20516
; LINE_WIDTH: 0.666242
G1 F5775.507
G1 X129.327 Y116.084 E.0037
; LINE_WIDTH: 0.625566
G1 F6178.709
G1 X129.394 Y116.055 E.00346
; LINE_WIDTH: 0.58489
G1 F6642.434
G1 X129.461 Y116.026 E.00322
; LINE_WIDTH: 0.544214
G1 F6808
G1 X129.528 Y115.997 E.00297
; LINE_WIDTH: 0.503538
G1 X129.595 Y115.968 E.00273
; WIPE_START
G1 F7815.586
G1 X129.528 Y115.997 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.8 I-1.18 J-.3 P1  F42000
G1 X126.143 Y129.322 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192587
G1 F6808
M204 S6000
G1 X124.998 Y138.022 E.10702
; WIPE_START
G1 F15000
G1 X125.259 Y136.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y138.735 Z11.8 F42000
G1 Z11.4
G1 E.8 F1800
; LINE_WIDTH: 0.480857
G1 F6808
M204 S6000
G1 X124.025 Y140.335 E.05759
; CHANGE_LAYER
; Z_HEIGHT: 11.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F8220.376
G1 X124.236 Y138.735 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 58/73
; update layer progress
M73 L58
M991 S0 P57 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z11.8 I1.2 J.201 P1  F42000
G1 X126.188 Y127.086 Z11.8
G1 Z11.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4945
M204 S5000
M73 P84 R3
G1 X131.661 Y127.807 E.16961
G1 X131.501 Y129.016 E.03749
G1 X126.029 Y128.296 E.16961
G1 X126.102 Y127.737 E.01733
G1 X126.18 Y127.146 E.01832
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.166 Y127.385 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.533 Y126.984 Z12 F42000
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4945
M204 S6000
G1 X125.803 Y126.23 E.19169
G1 X124.485 Y116.212 E.33516
G1 X130.018 Y115.483 E.18516
G1 X131.525 Y126.924 E.38279
M204 S10000
G1 X131.979 Y127.453 F42000
G1 F4945
M204 S6000
G1 X125.85 Y126.646 E.20504
G1 X125.756 Y127.362 E.02395
G1 X125.542 Y127.362 E.0071
G1 X124.028 Y115.862 E.38478
G1 X130.369 Y115.027 E.21216
G1 X131.917 Y126.783 E.39334
G3 X131.975 Y127.393 I-7.644 J1.044 E.02035
; WIPE_START
G1 F8843.478
G1 X129.99 Y127.151 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y129.41 Z12 F42000
G1 Z11.6
G1 E.8 F1800
G1 F4945
M204 S6000
G1 X125.247 Y138.26 E.29609
G1 X124.695 Y138.187 E.01847
G1 X125.894 Y129.084 E.30457
G1 X126.446 Y129.157 E.01847
G1 X126.42 Y129.351 E.0065
M204 S10000
G1 X126.816 Y129.464 F42000
G1 F4945
M204 S6000
G1 X126.867 Y129.075 E.01301
G1 X130.49 Y129.552 E.12121
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.66 Y130.65 E.26092
G1 X126.808 Y129.523 E.0377
M204 S250
G1 X127.205 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4945
M204 S5000
G1 X130.05 Y129.889 E.08819
G1 X128.918 Y138.485 E.26641
G1 X126.073 Y138.111 E.08819
G1 X127.048 Y130.701 E.22964
G1 X127.197 Y129.574 E.03492
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.185 Y129.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.876 Y129.74 Z12 F42000
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4945
M204 S6000
G1 X131.428 Y129.813 E.01847
G1 X130.229 Y138.916 E.30457
G1 X129.677 Y138.843 E.01847
G1 X130.868 Y129.799 E.30258
; WIPE_START
G1 F8843.478
G1 X131.428 Y129.813 E-.21279
G1 X131.24 Y131.24 E-.54721
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.977 Y128.685 Z12 F42000
G1 Z11.6
G1 E.8 F1800
G1 F4945
M204 S6000
G1 X131.884 Y129.462 E.19764
G1 X130.58 Y139.373 E.33158
G1 X124.239 Y138.538 E.21216
G1 X125.543 Y128.627 E.33158
G1 X125.918 Y128.677 E.01254
; WIPE_START
G1 F8843.478
G1 X127.901 Y128.938 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.532 Y136.193 Z12 F42000
G1 X124.622 Y138.984 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4945
M204 S5000
G1 X130.094 Y139.704 E.16961
G1 X129.935 Y140.914 E.03749
G1 X124.462 Y140.193 E.16961
G1 X124.536 Y139.634 E.01733
G1 X124.614 Y139.043 E.01832
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.599 Y139.283 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.51 Y141.387 Z12 F42000
G1 Z11.6
G1 E.8 F1800
G1 F4945
M204 S5000
G1 X123.723 Y140.485 E.21039
G3 X123.614 Y140.277 I.089 J-.179 E.0077
G1 X125.188 Y128.322 E.37052
G2 X125.188 Y127.68 I-3.51 J-.322 E.01976
G1 X123.614 Y115.72 E.37066
G3 X123.77 Y115.5 I.192 J-.029 E.00916
G1 X130.508 Y114.613 E.20882
G3 X130.581 Y114.615 I.031 J.213 E.00225
G3 X130.733 Y114.785 I-.044 J.192 E.00748
G1 X132.306 Y126.736 E.37039
G3 X132.352 Y128.842 I-9.99 J1.273 E.06486
G1 X130.733 Y141.215 E.38342
G3 X130.571 Y141.387 I-.194 J-.02 E.00779
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.588 Y141.126 E-.76
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


G1 X130.321 Y141.165 F42000
G1 Z11.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.480853
G1 F4945
M204 S6000
G1 X130.531 Y139.564 E.05761
; WIPE_START
G1 F8220.439
G1 X130.321 Y141.165 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.98 Y138.678 Z12 F42000
G1 Z11.6
G1 E.8 F1800
; LINE_WIDTH: 0.192587
G1 F4945
M204 S6000
G1 X131.125 Y129.978 E.10701
; WIPE_START
G1 F15000
G1 X130.864 Y131.961 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.887 Y129.265 Z12 F42000
G1 Z11.6
G1 E.8 F1800
; LINE_WIDTH: 0.466963
G1 F4945
M204 S6000
G2 X131.983 Y128.404 I-18.593 J-2.498 E.02993
; LINE_WIDTH: 0.423328
G1 X132.014 Y128 E.01256
; LINE_WIDTH: 0.387811
G1 X132.032 Y127.658 E.00962
; WIPE_START
G1 F10438.082
G1 X132.014 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12 I.935 J-.779 P1  F42000
G1 X129.325 Y124.777 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F4945
M204 S6000
G1 X128.382 Y117.616 E.22193
G1 X126.617 Y117.848 E.05473
G1 X127.497 Y124.536 E.20726
G1 X129.266 Y124.769 E.05481
M204 S10000
G1 X128.887 Y124.339 F42000
G1 F4945
M204 S6000
G1 X128.058 Y118.039 E.19524
G1 X127.04 Y118.173 E.03155
G1 X127.833 Y124.2 E.18678
G1 X128.828 Y124.331 E.03082
M204 S10000
M73 P84 R2
G1 X128.48 Y123.931 F42000
; LINE_WIDTH: 0.367845
G1 F4945
M204 S6000
G1 X127.756 Y118.433 E.14683
G1 X127.434 Y118.475 E.0086
G1 X128.146 Y123.887 E.14453
G1 X128.42 Y123.923 E.00732
M204 S10000
G1 X127.161 Y124.872 F42000
; LINE_WIDTH: 0.41999
G1 F4945
M204 S6000
G1 X129.763 Y125.215 E.08065
G1 X128.707 Y117.193 E.24861
G1 X126.194 Y117.524 E.0779
G1 X127.153 Y124.812 E.22589
M204 S10000
G1 X126.825 Y125.208 F42000
G1 F4945
M204 S6000
G1 X130.201 Y125.653 E.10464
G1 X129.032 Y116.77 E.2753
G1 X125.771 Y117.199 E.10107
G1 X126.817 Y125.149 E.24636
M204 S10000
G1 X126.489 Y125.544 F42000
G1 F4945
M204 S6000
G1 X130.639 Y126.091 E.12863
G1 X129.356 Y116.346 E.30198
G1 X125.347 Y116.875 E.12424
G1 X126.481 Y125.485 E.26684
M204 S10000
G1 X126.153 Y125.88 F42000
G1 F4945
M204 S6000
G1 X131.077 Y126.529 E.15261
G1 X129.681 Y115.923 E.32867
G1 X124.924 Y116.55 E.14741
G1 X126.145 Y125.821 E.28732
; WIPE_START
G1 F9547.299
G1 X125.884 Y123.838 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.143 Y129.322 Z12 F42000
G1 Z11.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192587
G1 F4945
M204 S6000
G1 X124.998 Y138.022 E.10701
; WIPE_START
G1 F15000
G1 X125.259 Y136.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y138.735 Z12 F42000
G1 Z11.6
G1 E.8 F1800
; LINE_WIDTH: 0.480844
G1 F4945
M204 S6000
G1 X124.025 Y140.335 E.05759
; CHANGE_LAYER
; Z_HEIGHT: 11.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.609
G1 X124.236 Y138.735 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 59/73
; update layer progress
M73 L59
M991 S0 P58 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z12 I1.2 J.201 P1  F42000
G1 X126.188 Y127.086 Z12
G1 Z11.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4932
M204 S5000
G1 X131.661 Y127.807 E.16961
G1 X131.501 Y129.016 E.03749
G1 X126.029 Y128.296 E.16961
G1 X126.098 Y127.767 E.01638
G1 X126.18 Y127.146 E.01926
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.166 Y127.385 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.533 Y126.984 Z12.2 F42000
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4932
M204 S6000
G1 X125.803 Y126.23 E.19169
G1 X124.485 Y116.212 E.33516
G1 X130.018 Y115.483 E.18516
G1 X131.525 Y126.924 E.38279
M204 S10000
G1 X131.979 Y127.453 F42000
G1 F4932
M204 S6000
G1 X125.85 Y126.646 E.20504
G1 X125.756 Y127.362 E.02395
G1 X125.542 Y127.362 E.0071
G1 X124.028 Y115.862 E.38477
G1 X130.369 Y115.027 E.21216
G1 X131.917 Y126.783 E.39334
G3 X131.975 Y127.393 I-7.646 J1.044 E.02035
; WIPE_START
G1 F8843.478
G1 X129.99 Y127.151 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y129.41 Z12.2 F42000
G1 Z11.8
G1 E.8 F1800
G1 F4932
M204 S6000
G1 X125.247 Y138.26 E.29609
G1 X124.695 Y138.187 E.01847
G1 X125.894 Y129.084 E.30457
G1 X126.446 Y129.157 E.01847
G1 X126.42 Y129.351 E.0065
M204 S10000
G1 X127.256 Y129.126 F42000
G1 F4932
M204 S6000
G1 X130.49 Y129.552 E.10821
G1 X129.256 Y138.925 E.31361
M73 P85 R2
G1 X125.633 Y138.448 E.12121
G1 X126.683 Y130.472 E.26687
G1 X126.867 Y129.075 E.04674
G1 X127.196 Y129.118 E.01102
M204 S250
G1 X127.205 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4932
M204 S5000
G1 X130.05 Y129.889 E.08819
G1 X128.918 Y138.485 E.26641
G1 X126.073 Y138.111 E.08819
G1 X127.072 Y130.523 E.23515
G1 X127.197 Y129.574 E.02941
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.185 Y129.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.876 Y129.74 Z12.2 F42000
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4932
M204 S6000
G1 X131.428 Y129.813 E.01847
G1 X130.229 Y138.916 E.30457
G1 X129.677 Y138.843 E.01847
G1 X130.868 Y129.799 E.30258
; WIPE_START
G1 F8843.478
G1 X131.428 Y129.813 E-.21279
G1 X131.24 Y131.24 E-.54721
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.622 Y138.848 Z12.2 F42000
G1 X130.58 Y139.373 Z12.2
G1 Z11.8
G1 E.8 F1800
G1 F4932
M204 S6000
G1 X124.239 Y138.538 E.21216
G1 X125.543 Y128.627 E.33158
G1 X131.884 Y129.462 E.21216
G1 X130.588 Y139.313 E.32959
; WIPE_START
G1 F8843.478
G1 X128.602 Y139.071 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.622 Y138.984 Z12.2 F42000
G1 Z11.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4932
M204 S5000
G1 X130.094 Y139.704 E.16961
G1 X129.935 Y140.914 E.03749
G1 X124.462 Y140.193 E.16961
G1 X124.532 Y139.665 E.01638
G1 X124.614 Y139.043 E.01926
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.599 Y139.283 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.511 Y141.387 Z12.2 F42000
G1 Z11.8
G1 E.8 F1800
G1 F4932
M204 S5000
G1 X123.77 Y140.499 E.20892
G3 X123.614 Y140.277 I.036 J-.191 E.00922
G1 X125.188 Y128.32 E.37059
G2 X125.188 Y127.68 I-2.787 J-.32 E.0197
G1 X123.614 Y115.72 E.37067
G3 X123.772 Y115.5 I.19 J-.03 E.00924
G1 X130.508 Y114.613 E.20877
G3 X130.581 Y114.615 I.031 J.212 E.00224
G3 X130.733 Y114.785 I-.044 J.192 E.00748
G1 X132.306 Y126.736 E.37039
G3 X132.306 Y129.264 I-10.795 J1.264 E.07786
G1 X130.733 Y141.215 E.37039
G3 X130.571 Y141.387 I-.194 J-.02 E.00779
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.588 Y141.128 E-.76
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


G1 X130.321 Y141.165 F42000
G1 Z11.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.480848
G1 F4932
M204 S6000
G1 X130.531 Y139.564 E.05761
; WIPE_START
G1 F8220.537
G1 X130.321 Y141.165 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.98 Y138.678 Z12.2 F42000
G1 Z11.8
G1 E.8 F1800
; LINE_WIDTH: 0.192585
G1 F4932
M204 S6000
G1 X131.125 Y129.978 E.10701
; WIPE_START
G1 F15000
G1 X130.864 Y131.961 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.887 Y129.265 Z12.2 F42000
G1 Z11.8
G1 E.8 F1800
; LINE_WIDTH: 0.466963
G1 F4932
M204 S6000
G2 X131.983 Y128.404 I-18.593 J-2.498 E.02993
; LINE_WIDTH: 0.423328
G1 X132.014 Y128 E.01256
; LINE_WIDTH: 0.387802
G1 X132.032 Y127.658 E.00962
; WIPE_START
G1 F10438.362
G1 X132.014 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.325 Y124.777 Z12.2 F42000
G1 Z11.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F4932
M204 S6000
G1 X128.382 Y117.616 E.22193
G1 X126.617 Y117.848 E.05473
G1 X127.497 Y124.536 E.20726
G1 X129.266 Y124.769 E.05481
M204 S10000
G1 X128.887 Y124.339 F42000
G1 F4932
M204 S6000
G1 X128.058 Y118.039 E.19524
G1 X127.04 Y118.173 E.03155
G1 X127.833 Y124.2 E.18678
G1 X128.828 Y124.331 E.03082
M204 S10000
G1 X128.48 Y123.931 F42000
; LINE_WIDTH: 0.367845
G1 F4932
M204 S6000
G1 X127.756 Y118.433 E.14683
G1 X127.434 Y118.475 E.0086
G1 X128.146 Y123.887 E.14453
G1 X128.42 Y123.923 E.00732
M204 S10000
G1 X127.161 Y124.872 F42000
; LINE_WIDTH: 0.41999
G1 F4932
M204 S6000
G1 X129.763 Y125.215 E.08065
G1 X128.707 Y117.193 E.24861
G1 X126.194 Y117.524 E.0779
G1 X127.153 Y124.812 E.22589
M204 S10000
G1 X126.825 Y125.208 F42000
G1 F4932
M204 S6000
G1 X130.201 Y125.653 E.10464
G1 X129.032 Y116.77 E.2753
G1 X125.771 Y117.199 E.10107
G1 X126.817 Y125.149 E.24637
M204 S10000
G1 X126.489 Y125.544 F42000
G1 F4932
M204 S6000
G1 X130.639 Y126.091 E.12862
G1 X129.356 Y116.346 E.30198
G1 X125.347 Y116.875 E.12424
G1 X126.481 Y125.485 E.26684
M204 S10000
G1 X126.153 Y125.88 F42000
G1 F4932
M204 S6000
G1 X131.077 Y126.529 E.15261
G1 X129.681 Y115.923 E.32867
G1 X124.924 Y116.55 E.14741
G1 X126.145 Y125.821 E.28732
; WIPE_START
G1 F9547.299
G1 X125.884 Y123.838 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.143 Y129.322 Z12.2 F42000
G1 Z11.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192585
G1 F4932
M204 S6000
G1 X124.998 Y138.022 E.10701
; WIPE_START
G1 F15000
G1 X125.259 Y136.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y138.735 Z12.2 F42000
G1 Z11.8
G1 E.8 F1800
; LINE_WIDTH: 0.480855
G1 F4932
M204 S6000
G1 X124.025 Y140.335 E.05759
; CHANGE_LAYER
; Z_HEIGHT: 12
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.402
G1 X124.236 Y138.735 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 60/73
; update layer progress
M73 L60
M991 S0 P59 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z12.2 I1.2 J.201 P1  F42000
G1 X126.188 Y127.086 Z12.2
G1 Z12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4932
M204 S5000
G1 X131.661 Y127.807 E.16961
G1 X131.501 Y129.016 E.03749
G1 X126.029 Y128.296 E.16961
G1 X126.094 Y127.798 E.01543
G1 X126.18 Y127.146 E.02021
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.166 Y127.385 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.533 Y126.984 Z12.4 F42000
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4932
M204 S6000
G1 X125.803 Y126.23 E.19169
G1 X124.485 Y116.212 E.33516
G1 X130.018 Y115.483 E.18516
G1 X131.525 Y126.924 E.38279
M204 S10000
G1 X131.979 Y127.453 F42000
G1 F4932
M204 S6000
G1 X125.85 Y126.646 E.20504
G1 X125.756 Y127.362 E.02395
G1 X125.542 Y127.362 E.0071
G1 X124.028 Y115.862 E.38478
G1 X130.369 Y115.027 E.21216
G1 X131.917 Y126.783 E.39334
G3 X131.975 Y127.393 I-7.646 J1.044 E.02035
; WIPE_START
G1 F8843.478
G1 X129.99 Y127.151 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y129.41 Z12.4 F42000
G1 Z12
G1 E.8 F1800
G1 F4932
M204 S6000
G1 X125.247 Y138.26 E.29609
G1 X124.695 Y138.187 E.01847
G1 X125.894 Y129.084 E.30457
G1 X126.446 Y129.157 E.01847
G1 X126.42 Y129.351 E.0065
M204 S10000
G1 X127.256 Y129.126 F42000
G1 F4932
M204 S6000
G1 X130.49 Y129.552 E.10821
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.707 Y130.294 E.27282
G1 X126.867 Y129.075 E.04079
G1 X127.196 Y129.118 E.01102
M204 S250
G1 X127.205 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4932
M204 S5000
G1 X130.05 Y129.889 E.08819
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X127.095 Y130.345 E.24066
G1 X127.197 Y129.574 E.0239
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.185 Y129.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.876 Y129.74 Z12.4 F42000
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4932
M204 S6000
G1 X131.428 Y129.813 E.01847
G1 X130.229 Y138.916 E.30457
G1 X129.677 Y138.843 E.01847
G1 X130.868 Y129.799 E.30258
; WIPE_START
M73 P86 R2
G1 F8843.478
G1 X131.428 Y129.813 E-.21278
G1 X131.24 Y131.24 E-.54722
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.622 Y138.848 Z12.4 F42000
G1 X130.58 Y139.373 Z12.4
G1 Z12
G1 E.8 F1800
G1 F4932
M204 S6000
G1 X124.239 Y138.538 E.21216
G1 X125.543 Y128.627 E.33158
G1 X131.884 Y129.462 E.21216
G1 X130.587 Y139.313 E.32959
; WIPE_START
G1 F8843.478
G1 X128.602 Y139.071 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.622 Y138.984 Z12.4 F42000
G1 Z12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4932
M204 S5000
G1 X130.094 Y139.704 E.16961
G1 X129.935 Y140.914 E.03749
G1 X124.462 Y140.193 E.16961
G1 X124.528 Y139.695 E.01543
G1 X124.614 Y139.043 E.02021
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.599 Y139.283 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.51 Y141.387 Z12.4 F42000
G1 Z12
G1 E.8 F1800
G1 F4932
M204 S5000
G1 X123.77 Y140.499 E.20891
G3 X123.614 Y140.278 I.038 J-.193 E.00919
G1 X125.188 Y128.321 E.37055
G2 X125.188 Y127.68 I-3.377 J-.322 E.01974
G1 X123.614 Y115.72 E.37066
G3 X123.77 Y115.5 I.19 J-.03 E.00918
G1 X130.508 Y114.613 E.20883
G3 X130.581 Y114.615 I.031 J.213 E.00225
G3 X130.733 Y114.785 I-.044 J.192 E.00748
G1 X132.306 Y126.736 E.37039
G3 X132.306 Y129.264 I-10.795 J1.264 E.07786
G1 X130.733 Y141.215 E.37037
G3 X130.571 Y141.387 I-.194 J-.02 E.0078
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.588 Y141.128 E-.76
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


G1 X130.321 Y141.165 F42000
G1 Z12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.480853
G1 F4932
M204 S6000
G1 X130.531 Y139.564 E.05761
; WIPE_START
G1 F8220.439
G1 X130.321 Y141.165 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.98 Y138.678 Z12.4 F42000
G1 Z12
G1 E.8 F1800
; LINE_WIDTH: 0.192587
G1 F4932
M204 S6000
G1 X131.125 Y129.978 E.10701
; WIPE_START
G1 F15000
G1 X130.864 Y131.961 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.887 Y129.265 Z12.4 F42000
G1 Z12
G1 E.8 F1800
; LINE_WIDTH: 0.46697
G1 F4932
M204 S6000
G2 X131.983 Y128.404 I-18.579 J-2.497 E.02993
; LINE_WIDTH: 0.423312
G1 X132.014 Y128 E.01257
; LINE_WIDTH: 0.387779
G1 X132.032 Y127.658 E.00962
; WIPE_START
G1 F10439.07
G1 X132.014 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.325 Y124.777 Z12.4 F42000
G1 Z12
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F4932
M204 S6000
G1 X128.382 Y117.616 E.22193
G1 X126.617 Y117.848 E.05473
G1 X127.497 Y124.536 E.20726
G1 X129.266 Y124.769 E.05481
M204 S10000
G1 X128.887 Y124.339 F42000
G1 F4932
M204 S6000
G1 X128.058 Y118.039 E.19524
G1 X127.04 Y118.173 E.03155
G1 X127.833 Y124.2 E.18678
G1 X128.828 Y124.331 E.03082
M204 S10000
G1 X128.48 Y123.931 F42000
; LINE_WIDTH: 0.367845
G1 F4932
M204 S6000
G1 X127.756 Y118.433 E.14683
G1 X127.434 Y118.475 E.0086
G1 X128.146 Y123.887 E.14453
G1 X128.42 Y123.923 E.00732
M204 S10000
G1 X127.161 Y124.872 F42000
; LINE_WIDTH: 0.41999
G1 F4932
M204 S6000
G1 X129.763 Y125.215 E.08065
G1 X128.707 Y117.193 E.24861
G1 X126.194 Y117.524 E.0779
G1 X127.153 Y124.812 E.22589
M204 S10000
G1 X126.825 Y125.208 F42000
G1 F4932
M204 S6000
G1 X130.201 Y125.653 E.10464
G1 X129.032 Y116.77 E.2753
G1 X125.771 Y117.199 E.10107
G1 X126.817 Y125.149 E.24636
M204 S10000
G1 X126.489 Y125.544 F42000
G1 F4932
M204 S6000
G1 X130.639 Y126.091 E.12863
G1 X129.356 Y116.346 E.30198
G1 X125.347 Y116.875 E.12424
G1 X126.481 Y125.485 E.26684
M204 S10000
G1 X126.153 Y125.88 F42000
G1 F4932
M204 S6000
G1 X131.077 Y126.529 E.15261
G1 X129.681 Y115.923 E.32867
G1 X124.924 Y116.55 E.14741
G1 X126.145 Y125.821 E.28732
; WIPE_START
G1 F9547.299
G1 X125.884 Y123.838 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.143 Y129.322 Z12.4 F42000
G1 Z12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192595
G1 F4932
M204 S6000
G1 X124.998 Y138.022 E.10702
; WIPE_START
G1 F15000
G1 X125.259 Y136.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y138.735 Z12.4 F42000
G1 Z12
G1 E.8 F1800
; LINE_WIDTH: 0.48087
G1 F4932
M204 S6000
G1 X124.025 Y140.335 E.0576
; CHANGE_LAYER
; Z_HEIGHT: 12.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.132
G1 X124.236 Y138.735 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 61/73
; update layer progress
M73 L61
M991 S0 P60 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z12.4 I1.2 J.201 P1  F42000
G1 X126.188 Y127.086 Z12.4
G1 Z12.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4412
M204 S5000
G1 X131.661 Y127.807 E.16961
G1 X131.501 Y129.016 E.03749
G1 X126.029 Y128.296 E.16961
G1 X126.09 Y127.828 E.01449
G1 X126.18 Y127.146 E.02115
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.166 Y127.385 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.533 Y126.984 Z12.6 F42000
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4412
M204 S6000
G1 X125.803 Y126.23 E.19169
G1 X124.485 Y116.212 E.33516
G1 X130.018 Y115.483 E.18516
G1 X131.525 Y126.924 E.38279
M204 S10000
G1 X131.979 Y127.453 F42000
G1 F4412
M204 S6000
G1 X125.85 Y126.646 E.20504
G1 X125.756 Y127.362 E.02395
G1 X125.542 Y127.362 E.0071
G1 X124.028 Y115.862 E.38478
G1 X130.369 Y115.027 E.21216
G1 X131.917 Y126.783 E.39334
G3 X131.975 Y127.393 I-7.644 J1.044 E.02035
; WIPE_START
G1 F8843.478
G1 X129.99 Y127.151 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y129.41 Z12.6 F42000
G1 Z12.2
G1 E.8 F1800
G1 F4412
M204 S6000
G1 X125.247 Y138.26 E.29609
G1 X124.695 Y138.187 E.01847
G1 X125.894 Y129.084 E.30457
G1 X126.446 Y129.157 E.01847
G1 X126.42 Y129.351 E.0065
M204 S10000
G1 X127.256 Y129.126 F42000
G1 F4412
M204 S6000
G1 X130.49 Y129.552 E.10821
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.73 Y130.116 E.27877
G1 X126.867 Y129.075 E.03484
G1 X127.196 Y129.118 E.01102
M204 S250
G1 X127.205 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4412
M204 S5000
G1 X130.05 Y129.889 E.08819
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X127.119 Y130.168 E.24618
G1 X127.197 Y129.574 E.01839
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.185 Y129.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.876 Y129.74 Z12.6 F42000
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4412
M204 S6000
G1 X131.428 Y129.813 E.01847
G1 X130.229 Y138.916 E.30457
G1 X129.677 Y138.843 E.01847
G1 X130.868 Y129.799 E.30258
; WIPE_START
G1 F8843.478
G1 X131.428 Y129.813 E-.21278
G1 X131.24 Y131.24 E-.54722
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.622 Y138.848 Z12.6 F42000
G1 X130.58 Y139.373 Z12.6
G1 Z12.2
G1 E.8 F1800
G1 F4412
M204 S6000
G1 X124.239 Y138.538 E.21216
G1 X125.543 Y128.627 E.33158
G1 X131.884 Y129.462 E.21216
G1 X130.587 Y139.313 E.32959
; WIPE_START
G1 F8843.478
G1 X128.602 Y139.071 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.622 Y138.984 Z12.6 F42000
G1 Z12.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4412
M204 S5000
G1 X130.094 Y139.704 E.16961
G1 X129.935 Y140.914 E.03749
G1 X124.462 Y140.193 E.16961
G1 X124.524 Y139.726 E.01449
G1 X124.614 Y139.043 E.02115
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.599 Y139.283 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.51 Y141.387 Z12.6 F42000
G1 Z12.2
G1 E.8 F1800
G1 F4412
M204 S5000
G1 X123.77 Y140.499 E.20891
G3 X123.614 Y140.277 I.036 J-.191 E.00922
G1 X125.188 Y128.322 E.37053
M73 P87 R2
G2 X125.188 Y127.68 I-3.322 J-.322 E.01976
G1 X123.614 Y115.72 E.37067
G3 X123.772 Y115.5 I.192 J-.028 E.00921
G1 X130.508 Y114.613 E.20877
G3 X130.581 Y114.615 I.031 J.212 E.00224
G3 X130.733 Y114.785 I-.041 J.189 E.0075
G1 X132.306 Y126.736 E.37039
G3 X132.306 Y129.264 I-10.794 J1.264 E.07786
G1 X130.733 Y141.215 E.37038
G3 X130.571 Y141.387 I-.192 J-.018 E.00783
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.587 Y141.128 E-.76
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


G1 X130.321 Y141.165 F42000
G1 Z12.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.480861
G1 F4412
M204 S6000
G1 X130.531 Y139.564 E.05761
; WIPE_START
G1 F8220.284
G1 X130.321 Y141.165 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.98 Y138.678 Z12.6 F42000
G1 Z12.2
G1 E.8 F1800
; LINE_WIDTH: 0.192587
G1 F4412
M204 S6000
G1 X131.125 Y129.978 E.10702
; WIPE_START
G1 F15000
G1 X130.864 Y131.961 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.887 Y129.265 Z12.6 F42000
G1 Z12.2
G1 E.8 F1800
; LINE_WIDTH: 0.466963
G1 F4412
M204 S6000
G2 X131.983 Y128.404 I-18.592 J-2.498 E.02993
; LINE_WIDTH: 0.423327
G1 X132.014 Y128 E.01256
; LINE_WIDTH: 0.38781
G1 X132.032 Y127.658 E.00962
; WIPE_START
G1 F10438.118
G1 X132.014 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.971 Y126.147 Z12.6 F42000
G1 Z12.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4412
M204 S6000
G1 X129.914 Y126.221 E.00311
G1 X129.159 Y126.32 E.02524
G1 X129.927 Y126.421 E.02567
G1 X130.621 Y125.983 E.02723
G1 X131.041 Y125.916 E.01411
G1 X130.712 Y123.417 E.08362
G1 X129.966 Y123.258 E.0253
G1 X129.773 Y123.305 E.00658
G1 X129.552 Y121.627 E.05616
G3 X130.379 Y120.887 I1.479 J.819 E.0375
G1 X130.166 Y119.272 E.05401
M204 S10000
G1 X127.683 Y119.125 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42656
G1 F4412
M204 S6000
G1 X128.432 Y124.816 E.17944
M204 S10000
G1 X128.113 Y125.302 F42000
; LINE_WIDTH: 0.41999
G1 F4412
M204 S6000
G1 X128.867 Y125.203 E.02337
G1 X128.01 Y118.698 E.20159
G1 X127.256 Y118.797 E.02337
G1 X128.105 Y125.242 E.19975
M204 S10000
G1 X127.787 Y125.715 F42000
G1 F4412
M204 S6000
G2 X129.29 Y125.527 I-6.253 J-56.189 E.04655
G1 X128.335 Y118.275 E.22476
G1 X126.833 Y118.473 E.04655
G1 X127.779 Y125.656 E.22261
M204 S10000
G1 X127.88 Y126.093 F42000
G1 F4412
M204 S6000
G1 X129.702 Y125.853 E.05644
G1 X129.71 Y125.833 E.00069
G1 X128.661 Y117.863 E.24698
G1 X128.64 Y117.854 E.00069
G1 X126.421 Y118.147 E.06877
G1 X126.413 Y118.167 E.00069
G1 X127.45 Y126.051 E.24433
G1 X127.821 Y126.087 E.01143
M204 S10000
G1 X126.797 Y126.009 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4412
M204 S6000
G1 X127.054 Y126.043 E.00858
G1 X126.875 Y124.685 E.04543
G1 X126.035 Y123.754 E.04161
G1 X125.811 Y123.621 E.00864
G1 X125.431 Y120.734 E.09659
G1 X126.035 Y120.637 E.02027
G1 X126.353 Y120.716 E.01087
G1 X126.068 Y118.552 E.07238
G1 X125.379 Y118.121 E.02695
G1 X125.081 Y118.074 E.01003
G1 X124.875 Y116.512 E.05224
G1 X127.092 Y116.22 E.07416
G1 X127.345 Y116.522 E.01307
G2 X128.983 Y116.938 I1.23 J-1.413 E.05815
G2 X129.754 Y116.144 I-1.615 J-2.342 E.03694
G1 X130.001 Y118.022 E.06284
G2 X129.148 Y118.555 I.174 J1.229 E.03438
G1 X129.029 Y117.651 E.03026
G2 X128.386 Y117.492 I-.401 J.242 E.02439
; WIPE_START
G1 F8843.478
G1 X128.758 Y117.443 E-.14262
G1 X129.029 Y117.651 E-.12954
G1 X129.148 Y118.555 E-.3466
G1 X129.419 Y118.302 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.726 Y125.443 Z12.6 F42000
G1 X125.928 Y127.558 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.491154
G1 F4412
M204 S6000
G1 X125.787 Y127.682 E.00687
; LINE_WIDTH: 0.52138
G1 X125.645 Y127.806 E.00733
G1 X125.635 Y128.014 E.00812
; LINE_WIDTH: 0.495083
G1 X125.618 Y128.216 E.00745
; LINE_WIDTH: 0.473669
G1 X125.605 Y128.227 E.0006
; LINE_WIDTH: 0.448511
G1 X125.592 Y128.238 E.00056
; LINE_WIDTH: 0.421377
G1 X125.381 Y128.408 E.00836
; WIPE_START
G1 F9512.324
G1 X125.592 Y128.238 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.143 Y129.322 Z12.6 F42000
G1 Z12.2
G1 E.8 F1800
; LINE_WIDTH: 0.192585
G1 F4412
M204 S6000
G1 X124.998 Y138.022 E.10701
; WIPE_START
G1 F15000
G1 X125.259 Y136.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y138.735 Z12.6 F42000
G1 Z12.2
G1 E.8 F1800
; LINE_WIDTH: 0.480848
G1 F4412
M204 S6000
G1 X124.025 Y140.335 E.05759
; CHANGE_LAYER
; Z_HEIGHT: 12.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.534
G1 X124.236 Y138.735 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 62/73
; update layer progress
M73 L62
M991 S0 P61 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z12.6 I1.2 J.201 P1  F42000
G1 X126.188 Y127.086 Z12.6
G1 Z12.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3874
M204 S5000
G1 X131.661 Y127.807 E.16961
G1 X131.501 Y129.016 E.03749
G1 X126.029 Y128.296 E.16961
G1 X126.086 Y127.859 E.01354
G1 X126.18 Y127.146 E.0221
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.166 Y127.385 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.533 Y126.984 Z12.8 F42000
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3874
M204 S6000
G1 X125.803 Y126.23 E.19169
G1 X124.485 Y116.212 E.33516
G1 X130.018 Y115.483 E.18516
G1 X131.525 Y126.924 E.38279
M204 S10000
G1 X131.979 Y127.453 F42000
G1 F3874
M204 S6000
G1 X125.85 Y126.646 E.20504
G1 X125.756 Y127.362 E.02395
G1 X125.542 Y127.362 E.0071
G1 X124.028 Y115.862 E.38478
G1 X130.369 Y115.027 E.21216
G1 X131.916 Y126.782 E.3933
G3 X131.975 Y127.393 I-8.71 J1.144 E.02039
; WIPE_START
G1 F8843.478
G1 X129.99 Y127.151 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y129.41 Z12.8 F42000
G1 Z12.4
G1 E.8 F1800
G1 F3874
M204 S6000
G1 X125.247 Y138.26 E.29609
G1 X124.695 Y138.187 E.01847
G1 X125.894 Y129.084 E.30457
G1 X126.446 Y129.157 E.01847
G1 X126.42 Y129.351 E.0065
M204 S10000
G1 X126.816 Y129.464 F42000
G1 F3874
M204 S6000
G1 X126.867 Y129.075 E.01301
G1 X130.49 Y129.552 E.12121
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.753 Y129.939 E.28472
G1 X126.808 Y129.523 E.0139
M204 S250
G1 X127.205 Y129.515 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3874
M204 S5000
G1 X130.05 Y129.889 E.08819
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X127.142 Y129.99 E.25169
G1 X127.197 Y129.574 E.01288
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.185 Y129.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.876 Y129.74 Z12.8 F42000
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3874
M204 S6000
G1 X131.428 Y129.813 E.01847
G1 X130.229 Y138.916 E.30457
G1 X129.677 Y138.843 E.01847
G1 X130.868 Y129.799 E.30258
; WIPE_START
G1 F8843.478
G1 X131.428 Y129.813 E-.21278
G1 X131.24 Y131.24 E-.54722
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.622 Y138.848 Z12.8 F42000
G1 X130.58 Y139.373 Z12.8
G1 Z12.4
G1 E.8 F1800
G1 F3874
M204 S6000
G1 X124.239 Y138.538 E.21216
G1 X125.543 Y128.627 E.33158
G1 X131.884 Y129.462 E.21216
G1 X130.587 Y139.313 E.32959
; WIPE_START
G1 F8843.478
G1 X128.602 Y139.071 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.622 Y138.984 Z12.8 F42000
G1 Z12.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3874
M204 S5000
G1 X130.094 Y139.704 E.16961
G1 X129.935 Y140.914 E.03749
G1 X124.462 Y140.193 E.16961
G1 X124.52 Y139.756 E.01354
G1 X124.614 Y139.043 E.0221
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.599 Y139.283 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P88 R2
G1 X130.51 Y141.387 Z12.8 F42000
G1 Z12.4
G1 E.8 F1800
G1 F3874
M204 S5000
G1 X123.769 Y140.499 E.20892
G3 X123.614 Y140.277 I.036 J-.191 E.00921
G1 X125.188 Y128.322 E.37052
G2 X125.188 Y127.68 I-3.454 J-.323 E.01976
G1 X123.614 Y115.72 E.37066
G3 X123.772 Y115.5 I.192 J-.029 E.00922
G1 X130.508 Y114.613 E.20876
G3 X130.581 Y114.615 I.031 J.212 E.00224
G3 X130.733 Y114.785 I-.041 J.189 E.00751
G1 X132.306 Y126.736 E.37038
G3 X132.306 Y129.264 I-10.793 J1.264 E.07786
G1 X130.733 Y141.215 E.37039
G3 X130.571 Y141.387 I-.194 J-.02 E.0078
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.587 Y141.128 E-.76
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


G1 X130.321 Y141.165 F42000
G1 Z12.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.480846
G1 F3874
M204 S6000
G1 X130.531 Y139.564 E.05761
; WIPE_START
G1 F8220.575
G1 X130.321 Y141.165 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.98 Y138.678 Z12.8 F42000
G1 Z12.4
G1 E.8 F1800
; LINE_WIDTH: 0.192587
G1 F3874
M204 S6000
G1 X131.125 Y129.978 E.10701
; WIPE_START
G1 F15000
G1 X130.864 Y131.961 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.887 Y129.265 Z12.8 F42000
G1 Z12.4
G1 E.8 F1800
; LINE_WIDTH: 0.466958
G1 F3874
M204 S6000
G2 X131.983 Y128.404 I-18.599 J-2.499 E.02993
; LINE_WIDTH: 0.423318
G1 X132.014 Y128 E.01257
; LINE_WIDTH: 0.387802
G1 X132.032 Y127.658 E.00962
; WIPE_START
G1 F10438.362
G1 X132.014 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.38 Y126.218 Z12.8 F42000
G1 Z12.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3874
M204 S6000
G1 X126.826 Y126.013 E.05198
G2 X126.079 Y125.654 I-.571 J.231 E.03017
G1 X125.815 Y123.653 E.06697
G1 X126.035 Y123.833 E.00942
G1 X126.69 Y124.986 E.04399
G2 X127.345 Y125.098 I.406 J-.402 E.02353
G2 X128.655 Y124.305 I-.543 J-2.377 E.05167
G1 X129.31 Y123.152 E.04399
G3 X129.966 Y123.04 I.406 J.402 E.02353
G1 X130.705 Y123.363 E.02674
G1 X131.02 Y125.76 E.0802
G1 X130.621 Y125.915 E.01421
G1 X129.994 Y126.43 E.02691
G1 X128.38 Y126.218 E.05401
; WIPE_START
G1 F8843.478
G1 X129.994 Y126.43 E-.61876
G1 X130.281 Y126.194 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.143 Y129.322 Z12.8 F42000
G1 Z12.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192587
G1 F3874
M204 S6000
G1 X124.998 Y138.022 E.10702
; WIPE_START
G1 F15000
G1 X125.259 Y136.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y138.735 Z12.8 F42000
G1 Z12.4
G1 E.8 F1800
; LINE_WIDTH: 0.480869
G1 F3874
M204 S6000
G1 X124.025 Y140.335 E.0576
; WIPE_START
G1 F8220.146
G1 X124.236 Y138.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.458 Y131.434 Z12.8 F42000
G1 X130.164 Y119.26 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3874
M204 S6000
G1 X130.377 Y120.874 E.05401
G1 X129.966 Y121.212 E.01767
G1 X129.31 Y122.366 E.04399
G3 X128.655 Y122.477 I-.406 J-.402 E.02353
G3 X127.345 Y121.685 I.543 J-2.377 E.05167
G1 X126.69 Y120.532 E.04399
G2 X126.035 Y120.42 I-.406 J.402 E.02353
G1 X125.421 Y120.657 E.02182
G1 X125.062 Y117.93 E.09125
G1 X125.379 Y118.053 E.01129
G1 X126.035 Y118.592 E.02814
G1 X126.69 Y119.745 E.04399
G2 X127.345 Y119.857 I.406 J-.402 E.02353
G2 X128.655 Y119.064 I-.543 J-2.377 E.05167
G1 X129.31 Y117.911 E.04399
G3 X129.972 Y117.802 I.447 J.649 E.02299
G1 X129.775 Y116.306 E.05006
G1 X129.31 Y117.124 E.03123
G3 X128.655 Y117.236 I-.406 J-.402 E.02353
G3 X127.209 Y116.205 I.722 J-2.542 E.06008
G1 X125.595 Y116.417 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F8843.478
G1 X127.209 Y116.205 E-.61876
G1 X127.345 Y116.443 E-.1043
G1 X127.42 Y116.505 E-.03694
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 63/73
; update layer progress
M73 L63
M991 S0 P62 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z12.8 I-1.209 J-.141 P1  F42000
G1 X126.188 Y127.086 Z12.8
G1 Z12.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4035
M204 S5000
G1 X131.661 Y127.807 E.16961
G1 X131.501 Y129.016 E.03749
G1 X126.029 Y128.296 E.16961
G1 X126.082 Y127.889 E.0126
G1 X126.18 Y127.146 E.02305
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.166 Y127.385 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.205 Y129.515 Z13 F42000
G1 Z12.6
G1 E.8 F1800
G1 F4035
M204 S5000
G1 X130.05 Y129.889 E.08819
G1 X128.918 Y138.485 E.26641
G1 X126.073 Y138.111 E.08819
G1 X127.165 Y129.812 E.2572
G1 X127.197 Y129.574 E.00736
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.185 Y129.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.533 Y126.984 Z13 F42000
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4035
M204 S6000
G1 X125.803 Y126.23 E.19169
G1 X124.485 Y116.212 E.33516
G1 X130.018 Y115.483 E.18516
G1 X131.525 Y126.924 E.38279
M204 S10000
G1 X131.979 Y127.453 F42000
G1 F4035
M204 S6000
G1 X125.85 Y126.646 E.20504
G1 X125.768 Y127.271 E.0209
G1 X125.526 Y127.239 E.00811
G1 X124.028 Y115.862 E.38066
G1 X130.369 Y115.027 E.21216
G1 X131.917 Y126.783 E.39334
G3 X131.975 Y127.393 I-7.646 J1.044 E.02035
; WIPE_START
G1 F8843.478
G1 X129.99 Y127.151 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.837 Y134.102 Z13 F42000
G1 X124.622 Y138.984 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4035
M204 S5000
G1 X130.094 Y139.704 E.16961
G1 X129.935 Y140.914 E.03749
G1 X124.462 Y140.193 E.16961
G1 X124.516 Y139.787 E.0126
G1 X124.614 Y139.043 E.02305
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.599 Y139.283 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.51 Y141.387 Z13 F42000
G1 Z12.6
G1 E.8 F1800
G1 F4035
M204 S5000
G1 X123.77 Y140.499 E.20891
G3 X123.614 Y140.277 I.038 J-.193 E.0092
G1 X125.188 Y128.322 E.37054
G2 X125.188 Y127.68 I-3.363 J-.322 E.01975
G1 X123.614 Y115.72 E.37066
G3 X123.77 Y115.501 I.192 J-.029 E.00915
G1 X130.508 Y114.613 E.20883
G3 X130.581 Y114.615 I.032 J.211 E.00224
G3 X130.733 Y114.785 I-.04 J.189 E.00752
G1 X132.306 Y126.736 E.37038
G3 X132.306 Y129.264 I-10.795 J1.264 E.07786
G1 X130.733 Y141.215 E.37038
G3 X130.571 Y141.387 I-.194 J-.02 E.0078
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.588 Y141.128 E-.76
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


G1 X131.8 Y128.334 F42000
G1 Z12.6
G1 E.8 F1800
; FEATURE: Top surface
G1 F4035
M204 S2000
G1 X132.154 Y128.688 E.01538
G1 X132.107 Y129.174
G1 X131.738 Y128.805 E.01603
G1 X131.644 Y129.244
G1 X132.046 Y129.647 E.01749
G1 X131.984 Y130.118
G1 X131.03 Y129.163 E.04148
G1 X130.416 Y129.083
G1 X131.922 Y130.589 E.06547
G1 X131.86 Y131.06
G1 X129.802 Y129.002 E.08946
G1 X129.931 Y129.665
G1 X129.188 Y128.921 E.03232
G1 X128.573 Y128.84
G1 X129.317 Y129.584 E.03232
G1 X128.703 Y129.503
G1 X127.959 Y128.759 E.03232
G1 X127.345 Y128.678
G1 X128.089 Y129.422 E.03232
G1 X127.475 Y129.341
G1 X126.731 Y128.598 E.03232
G1 X126.117 Y128.517
G1 X127.009 Y129.409 E.03877
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.117 Y128.517 E-.47952
G1 X126.731 Y128.598 E-.23537
G1 X126.815 Y128.681 E-.04511
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.828 Y128.228 Z13 F42000
G1 Z12.6
G1 E.8 F1800
G1 F4035
M204 S2000
G1 X125.408 Y127.807 E.01828
G1 X125.396 Y128.329
G1 X126.947 Y129.88 E.06742
G1 X126.885 Y130.351
G1 X125.334 Y128.8 E.0674
G1 X125.272 Y129.272
G1 X126.823 Y130.823 E.0674
G1 X126.761 Y131.294
G1 X125.21 Y129.743 E.0674
G1 X125.148 Y130.214
G1 X126.699 Y131.765 E.0674
G1 X126.637 Y132.236
G1 X125.086 Y130.685 E.0674
G1 X125.024 Y131.156
G1 X126.575 Y132.708 E.0674
G1 X126.513 Y133.179
G1 X124.962 Y131.628 E.0674
G1 X124.9 Y132.099
G1 X126.451 Y133.65 E.0674
G1 X126.389 Y134.121
G1 X124.838 Y132.57 E.0674
G1 X124.776 Y133.041
G1 X126.327 Y134.592 E.0674
G1 X126.265 Y135.064
G1 X124.714 Y133.513 E.0674
G1 X124.652 Y133.984
G1 X126.203 Y135.535 E.0674
G1 X126.141 Y136.006
G1 X124.59 Y134.455 E.0674
G1 X124.528 Y134.926
G1 X126.079 Y136.477 E.0674
G1 X126.017 Y136.949
G1 X124.466 Y135.397 E.0674
G1 X124.404 Y135.869
G1 X125.955 Y137.42 E.0674
M73 P89 R2
G1 X125.893 Y137.891
G1 X124.342 Y136.34 E.0674
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.756 Y137.754 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.073 Y132.279 Z13 F42000
G1 X131.798 Y131.532 Z13
G1 Z12.6
G1 E.8 F1800
G1 F4035
M204 S2000
G1 X130.247 Y129.981 E.0674
G1 X130.185 Y130.452
G1 X131.736 Y132.003 E.0674
G1 X131.674 Y132.474
G1 X130.123 Y130.923 E.0674
G1 X130.061 Y131.394
G1 X131.612 Y132.945 E.0674
G1 X131.55 Y133.417
G1 X129.999 Y131.865 E.0674
G1 X129.937 Y132.337
G1 X131.488 Y133.888 E.0674
G1 X131.426 Y134.359
G1 X129.875 Y132.808 E.0674
G1 X129.813 Y133.279
G1 X131.364 Y134.83 E.0674
G1 X131.302 Y135.301
G1 X129.751 Y133.75 E.0674
G1 X129.689 Y134.222
G1 X131.24 Y135.773 E.0674
G1 X131.178 Y136.244
G1 X129.627 Y134.693 E.0674
G1 X129.565 Y135.164
G1 X131.116 Y136.715 E.0674
G1 X131.054 Y137.186
G1 X129.503 Y135.635 E.0674
G1 X129.441 Y136.106
G1 X130.992 Y137.657 E.0674
G1 X130.93 Y138.129
G1 X129.379 Y136.578 E.0674
G1 X129.317 Y137.049
G1 X130.868 Y138.6 E.0674
G1 X130.806 Y139.071
G1 X129.255 Y137.52 E.0674
G1 X129.193 Y137.991
G1 X130.744 Y139.542 E.0674
G1 X130.311 Y139.643
G1 X130.682 Y140.014 E.01608
G1 X130.62 Y140.485
G1 X130.249 Y140.115 E.01608
G1 X130.173 Y139.505
G1 X129.131 Y138.463 E.04532
G1 X128.816 Y138.681
G1 X129.559 Y139.425 E.03232
G1 X128.945 Y139.344
G1 X128.201 Y138.6 E.03231
G1 X127.587 Y138.519
G1 X128.331 Y139.263 E.03231
G1 X127.717 Y139.182
G1 X126.973 Y138.438 E.03231
G1 X126.359 Y138.357
G1 X127.103 Y139.101 E.03231
G1 X126.489 Y139.02
G1 X124.28 Y136.811 E.096
G1 X124.218 Y137.282
G1 X125.875 Y138.939 E.07201
G1 X125.26 Y138.859
G1 X124.155 Y137.754 E.04802
G1 X124.093 Y138.225
G1 X124.646 Y138.778 E.02403
G1 X124.401 Y139.066
G1 X124.031 Y138.696 E.01608
G1 X123.969 Y139.167
G1 X124.339 Y139.537 E.01608
M204 S10000
G1 X124.338 Y139.696 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0935246
G1 F4035
M204 S6000
G1 X123.884 Y139.671 E.00187
M204 S10000
G1 X125.926 Y127.632 F42000
; LINE_WIDTH: 0.290953
G1 F4035
M204 S6000
G1 X125.49 Y127.563 E.00892
; LINE_WIDTH: 0.26478
G1 X125.387 Y127.782 E.00438
; WIPE_START
G1 F15000
G1 X125.49 Y127.563 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.19 Y129.657 Z13 F42000
G1 Z12.6
G1 E.8 F1800
; LINE_WIDTH: 0.113954
G1 F4035
M204 S6000
G1 X130.137 Y129.667 E.00031
G3 X129.991 Y129.672 I-.11 J-.97 E.00085
M204 S10000
G1 X129.742 Y128.994 F42000
; LINE_WIDTH: 0.113881
G1 F4035
M204 S6000
G2 X129.544 Y129.01 I-.048 J.634 E.00116
M204 S10000
G1 X131.572 Y129.316 F42000
; LINE_WIDTH: 0.0884157
G1 F4035
M204 S6000
G2 X131.358 Y129.203 I-1.551 J2.676 E.0009
M204 S10000
G1 X131.458 Y129.201 F42000
; LINE_WIDTH: 0.069741
G1 F4035
M204 S6000
G1 X131.447 Y129.221 E.00005
; LINE_WIDTH: 0.130309
G1 X131.437 Y129.242 E.00016
G1 X131.563 Y129.325 E.00107
M204 S10000
G1 X130.312 Y139.378 F42000
; LINE_WIDTH: 0.0865266
G1 F4035
M204 S6000
G3 X130.216 Y139.485 I-.17 J-.057 E.00053
; WIPE_START
G1 F15000
G1 X130.312 Y139.378 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.24 Y131.821 Z13 F42000
G1 X128.447 Y126.226 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4035
M204 S6000
G1 X130.061 Y126.439 E.05401
G1 X130.345 Y126.035 E.01638
G1 X130.995 Y125.567 E.02657
G1 X130.692 Y123.267 E.07696
G1 X129.987 Y122.759 E.02882
G1 X129.745 Y122.431 E.01351
G3 X130.345 Y120.793 I2.115 J-.154 E.05963
G1 X129.924 Y117.433 E.11236
G3 X129.803 Y116.518 I.618 J-.546 E.03247
G1 X129.719 Y115.874 E.02154
G1 X127.262 Y116.198 E.0822
G1 X127.724 Y116.862 E.02685
G1 X128.634 Y117.518 E.0372
G1 X128.876 Y117.845 E.01351
G3 X128.276 Y119.483 I-2.115 J.154 E.05963
G1 X127.366 Y120.138 E.0372
G1 X127.124 Y120.466 E.01351
G2 X127.724 Y122.104 I2.115 J.154 E.05963
G1 X128.634 Y122.759 E.0372
G1 X128.876 Y123.086 E.01351
G3 X128.276 Y124.724 I-2.115 J.154 E.05963
G1 X127.366 Y125.38 E.0372
G2 X127.096 Y126.049 I.624 J.641 E.02463
G1 X126.114 Y125.919 E.03287
G1 X126.038 Y125.346 E.01918
G1 X126.256 Y125.052 E.01213
G2 X125.814 Y123.639 I-1.94 J-.168 E.05036
G1 X125.41 Y120.573 E.10261
G2 X126.256 Y119.811 I-.766 J-1.7 E.03838
G2 X125.035 Y117.726 I-2.148 J-.142 E.08507
G1 X124.875 Y116.512 E.04061
G1 X125.276 Y116.46 E.0134
; CHANGE_LAYER
; Z_HEIGHT: 12.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X124.875 Y116.512 E-.1535
G1 X125.035 Y117.726 E-.46526
G1 X125.337 Y117.943 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 64/73
; update layer progress
M73 L64
M991 S0 P63 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z13 I-1.212 J.113 P1  F42000
G1 X126.188 Y127.086 Z13
G1 Z12.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2770
M204 S5000
G1 X131.661 Y127.807 E.16961
G1 X131.501 Y129.016 E.03749
G1 X126.029 Y128.296 E.16961
G1 X126.078 Y127.92 E.01165
M73 P89 R1
G1 X126.18 Y127.146 E.02399
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.166 Y127.385 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.111 Y128.438 Z13.2 F42000
G1 Z12.8
G1 E.8 F1800
G1 F2770
M204 S5000
G1 X131.385 Y129.132 E.16347
G1 X130.012 Y139.562 E.32325
G1 X124.738 Y138.868 E.16347
G1 X125.986 Y129.388 E.29381
G1 X126.103 Y128.497 E.0276
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.089 Y128.736 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.533 Y126.984 Z13.2 F42000
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2770
M204 S6000
G1 X125.803 Y126.23 E.19169
G1 X124.485 Y116.212 E.33516
G1 X130.018 Y115.483 E.18516
G1 X131.525 Y126.924 E.38279
M204 S10000
G1 X131.979 Y127.453 F42000
G1 F2770
M204 S6000
G1 X125.85 Y126.646 E.20504
G1 X125.756 Y127.362 E.02395
G1 X125.542 Y127.362 E.0071
G1 X124.028 Y115.862 E.38478
G1 X130.369 Y115.027 E.21216
G1 X131.917 Y126.783 E.39334
G3 X131.975 Y127.393 I-7.646 J1.044 E.02035
; WIPE_START
G1 F8843.478
G1 X129.99 Y127.151 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.837 Y134.102 Z13.2 F42000
G1 X124.622 Y138.984 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2770
M204 S5000
G1 X130.094 Y139.704 E.16961
G1 X129.935 Y140.914 E.03749
G1 X124.462 Y140.193 E.16961
G1 X124.512 Y139.817 E.01165
G1 X124.614 Y139.043 E.02399
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.599 Y139.283 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.511 Y141.387 Z13.2 F42000
G1 Z12.8
G1 E.8 F1800
G1 F2770
M204 S5000
G1 X123.77 Y140.499 E.20892
G3 X123.614 Y140.278 I.036 J-.191 E.00922
G1 X125.188 Y128.32 E.3706
G2 X125.188 Y127.68 I-2.786 J-.32 E.0197
G1 X123.614 Y115.72 E.37067
G3 X123.77 Y115.501 I.19 J-.03 E.00917
G1 X130.508 Y114.613 E.20883
G3 X130.581 Y114.615 I.031 J.211 E.00224
G3 X130.733 Y114.785 I-.044 J.192 E.00749
G1 X132.306 Y126.736 E.37038
G3 X132.306 Y129.264 I-10.795 J1.264 E.07786
G1 X130.733 Y141.215 E.37038
G3 X130.571 Y141.387 I-.192 J-.018 E.00782
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.588 Y141.128 E-.76
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


G1 X130.321 Y141.165 F42000
G1 Z12.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.481568
G1 F2770
M204 S6000
G1 X130.531 Y139.564 E.05771
G1 X130.524 Y139.493 E.00256
; LINE_WIDTH: 0.530855
G1 X130.516 Y139.421 E.00285
; LINE_WIDTH: 0.564194
G1 X130.509 Y139.35 E.00305
; LINE_WIDTH: 0.580848
G1 X131.81 Y129.466 E.437
M204 S10000
G1 X131.566 Y129.258 F42000
; LINE_WIDTH: 0.267031
G1 F2770
M204 S6000
G1 X131.601 Y129.288 E.00084
; LINE_WIDTH: 0.315311
G1 X131.636 Y129.318 E.00102
; LINE_WIDTH: 0.36359
G1 X131.671 Y129.347 E.0012
; LINE_WIDTH: 0.41187
G1 X131.706 Y129.377 E.00138
; LINE_WIDTH: 0.46015
G1 X131.741 Y129.407 E.00156
; LINE_WIDTH: 0.508429
G1 X131.775 Y129.436 E.00174
; LINE_WIDTH: 0.556709
G1 X131.81 Y129.466 E.00192
; LINE_WIDTH: 0.555849
G1 X131.849 Y129.365 E.0045
; LINE_WIDTH: 0.505854
G1 X131.887 Y129.265 E.00406
; LINE_WIDTH: 0.46837
G2 X131.983 Y128.404 I-25.851 J-3.302 E.03003
; LINE_WIDTH: 0.423316
G1 X132.014 Y128 E.01257
; LINE_WIDTH: 0.387783
G1 X132.032 Y127.658 E.00962
; WIPE_START
G1 F10438.935
G1 X132.014 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.293 Y121.336 Z13.2 F42000
G1 X125.55 Y116.423 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2770
M204 S6000
G1 X124.875 Y116.512 E.02256
G1 X124.999 Y117.452 E.03145
G2 X125.739 Y118.173 I3.642 J-3.002 E.03434
G3 X125.98 Y119.811 I-1.42 J1.045 E.05716
G3 X125.392 Y120.437 I-3.139 J-2.356 E.02856
G1 X125.8 Y123.537 E.10372
G3 X125.994 Y125.013 I-1.405 J.935 E.05112
G1 X126.114 Y125.919 E.03033
G1 X127.282 Y126.073 E.03907
G3 X127.675 Y125.38 I1.244 J.247 E.02689
G1 X128.36 Y124.724 E.03145
G2 X128.601 Y123.086 I-1.42 J-1.045 E.05716
G2 X127.64 Y122.104 I-4.941 J3.868 E.04567
G3 X127.4 Y120.466 I1.42 J-1.045 E.05716
G3 X128.36 Y119.483 I4.942 J3.869 E.04567
G2 X128.601 Y117.845 I-1.42 J-1.045 E.05716
G2 X127.64 Y116.862 I-4.942 J3.869 E.04567
G1 X127.316 Y116.191 E.02474
G1 X129.719 Y115.874 E.0804
G1 X130.354 Y120.704 E.16159
G1 X130.261 Y120.793 E.0043
G2 X130.02 Y122.431 I1.42 J1.045 E.05716
G2 X130.673 Y123.12 I3.451 J-2.618 E.03152
M73 P90 R1
G1 X130.967 Y125.355 E.0748
G3 X130.261 Y126.035 I-3.437 J-2.864 E.03257
G1 X130.061 Y126.439 E.01495
G1 X128.447 Y126.226 E.05401
; WIPE_START
G1 F8843.478
G1 X130.061 Y126.439 E-.61876
G1 X130.226 Y126.106 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.651 Y127.558 Z13.2 F42000
G1 Z12.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.520731
G1 F2770
M204 S6000
G1 X125.625 Y128.141 E.0227
; LINE_WIDTH: 0.484603
G1 X125.592 Y128.436 E.01069
; LINE_WIDTH: 0.505858
G1 X125.603 Y128.543 E.00406
; LINE_WIDTH: 0.555845
G1 X125.614 Y128.65 E.0045
M204 S10000
G1 X125.903 Y128.513 F42000
; LINE_WIDTH: 0.266997
G1 F2770
M204 S6000
G1 X125.862 Y128.532 E.00084
; LINE_WIDTH: 0.315281
G1 X125.821 Y128.552 E.00102
; LINE_WIDTH: 0.363565
G1 X125.779 Y128.572 E.0012
; LINE_WIDTH: 0.411848
G1 X125.738 Y128.591 E.00138
; LINE_WIDTH: 0.460132
G1 X125.696 Y128.611 E.00156
; LINE_WIDTH: 0.508416
G1 X125.655 Y128.63 E.00174
; LINE_WIDTH: 0.5567
G1 X125.614 Y128.65 E.00192
; LINE_WIDTH: 0.580844
G1 X124.313 Y138.534 E.437
; LINE_WIDTH: 0.555849
G1 X124.274 Y138.635 E.0045
; LINE_WIDTH: 0.482437
G1 X124.236 Y138.735 E.00385
G1 X124.025 Y140.335 E.05781
M204 S10000
G1 X124.557 Y138.742 F42000
; LINE_WIDTH: 0.267031
G1 F2770
M204 S6000
G1 X124.522 Y138.712 E.00084
; LINE_WIDTH: 0.31531
G1 X124.487 Y138.682 E.00102
; LINE_WIDTH: 0.36359
G1 X124.452 Y138.653 E.0012
; LINE_WIDTH: 0.41187
G1 X124.417 Y138.623 E.00138
; LINE_WIDTH: 0.460149
G1 X124.382 Y138.593 E.00156
; LINE_WIDTH: 0.508429
G1 X124.347 Y138.564 E.00174
; LINE_WIDTH: 0.556709
G1 X124.313 Y138.534 E.00192
; CHANGE_LAYER
; Z_HEIGHT: 13
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7006.775
G1 X124.347 Y138.564 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 65/73
; update layer progress
M73 L65
M991 S0 P64 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z13.2 I1.202 J.193 P1  F42000
G1 X126.188 Y127.086 Z13.2
G1 Z13
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2725
M204 S5000
G1 X131.661 Y127.807 E.16961
G1 X131.501 Y129.016 E.03749
G1 X126.029 Y128.296 E.16961
G1 X126.074 Y127.95 E.01071
G1 X126.18 Y127.146 E.02494
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.166 Y127.385 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.111 Y128.438 Z13.4 F42000
G1 Z13
G1 E.8 F1800
G1 F2725
M204 S5000
G1 X131.385 Y129.132 E.16347
G1 X130.012 Y139.562 E.32325
G1 X124.738 Y138.868 E.16347
G1 X125.79 Y130.871 E.24783
G1 X126.103 Y128.497 E.07357
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.089 Y128.736 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.533 Y126.984 Z13.4 F42000
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2725
M204 S6000
G1 X125.803 Y126.23 E.19169
G1 X124.485 Y116.212 E.33516
G1 X130.018 Y115.483 E.18516
G1 X131.525 Y126.924 E.38279
M204 S10000
G1 X131.979 Y127.453 F42000
G1 F2725
M204 S6000
G1 X125.85 Y126.646 E.20504
G1 X125.756 Y127.362 E.02395
G1 X125.542 Y127.362 E.0071
G1 X124.028 Y115.862 E.38478
G1 X130.369 Y115.027 E.21216
G1 X131.917 Y126.783 E.39334
G3 X131.975 Y127.393 I-7.646 J1.044 E.02035
; WIPE_START
G1 F8843.478
G1 X129.99 Y127.151 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.837 Y134.102 Z13.4 F42000
G1 X124.622 Y138.984 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2725
M204 S5000
G1 X130.094 Y139.704 E.16961
G1 X129.935 Y140.914 E.03749
G1 X124.462 Y140.193 E.16961
G1 X124.508 Y139.848 E.01071
G1 X124.614 Y139.043 E.02494
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.599 Y139.283 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.51 Y141.387 Z13.4 F42000
G1 Z13
G1 E.8 F1800
G1 F2725
M204 S5000
G1 X123.77 Y140.499 E.20892
G3 X123.614 Y140.278 I.039 J-.193 E.00919
G1 X125.188 Y128.322 E.37052
G2 X125.188 Y127.68 I-3.412 J-.323 E.01976
G1 X123.614 Y115.72 E.37066
G3 X123.77 Y115.5 I.192 J-.029 E.00916
G1 X130.508 Y114.613 E.20883
G3 X130.581 Y114.615 I.032 J.211 E.00224
G3 X130.733 Y114.785 I-.04 J.189 E.00751
G1 X132.306 Y126.736 E.37038
G3 X132.306 Y129.264 I-10.795 J1.264 E.07786
G1 X130.732 Y141.217 E.37045
G3 X130.571 Y141.387 I-.193 J-.022 E.00772
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.588 Y141.128 E-.76
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


G1 X130.321 Y141.165 F42000
G1 Z13
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.482405
G1 F2725
M204 S6000
G1 X130.531 Y139.564 E.05782
G1 X130.52 Y139.457 E.00385
; LINE_WIDTH: 0.555845
G1 X130.509 Y139.35 E.0045
; LINE_WIDTH: 0.580839
G1 X131.81 Y129.466 E.43699
M204 S10000
G1 X131.566 Y129.258 F42000
; LINE_WIDTH: 0.267031
G1 F2725
M204 S6000
G1 X131.601 Y129.288 E.00084
; LINE_WIDTH: 0.31531
G1 X131.636 Y129.318 E.00102
; LINE_WIDTH: 0.36359
G1 X131.671 Y129.347 E.0012
; LINE_WIDTH: 0.41187
G1 X131.706 Y129.377 E.00138
; LINE_WIDTH: 0.460149
G1 X131.741 Y129.407 E.00156
; LINE_WIDTH: 0.508429
G1 X131.775 Y129.436 E.00174
; LINE_WIDTH: 0.556709
G1 X131.81 Y129.466 E.00192
; LINE_WIDTH: 0.555849
G1 X131.849 Y129.365 E.0045
; LINE_WIDTH: 0.505854
G1 X131.887 Y129.265 E.00406
; LINE_WIDTH: 0.46836
G2 X131.983 Y128.404 I-25.854 J-3.303 E.03003
; LINE_WIDTH: 0.423324
G1 X132.014 Y128 E.01256
; LINE_WIDTH: 0.387787
G1 X132.032 Y127.658 E.00962
; WIPE_START
G1 F10438.807
G1 X132.014 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.541 Y122.68 Z13.4 F42000
G1 X125.562 Y121.728 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2725
M204 S6000
G1 X125.774 Y123.342 E.05401
G3 X125.956 Y124.721 I-1.705 J.926 E.0472
G1 X126.114 Y125.919 E.04008
G1 X127.417 Y126.091 E.0436
G1 X127.896 Y125.38 E.02845
G2 X128.576 Y123.414 I-1.182 J-1.51 E.07292
G1 X128.104 Y122.759 E.02679
G3 X127.424 Y120.793 I1.182 J-1.51 E.07292
G1 X127.896 Y120.138 E.02679
G2 X128.576 Y118.173 I-1.182 J-1.51 E.07292
G2 X127.543 Y116.862 I-8.361 J5.528 E.05541
G1 X127.344 Y116.187 E.02336
G1 X124.875 Y116.512 E.08261
G2 X125.275 Y117.518 I1.134 J.131 E.03739
G3 X125.956 Y119.483 I-1.182 J1.51 E.07293
G3 X125.37 Y120.271 I-5.006 J-3.11 E.0326
G1 X125.158 Y118.656 E.05401
M204 S10000
G1 X130.127 Y118.974 F42000
G1 F2725
M204 S6000
G1 X130.339 Y120.589 E.05401
G1 X130.164 Y120.793 E.00894
G2 X130.517 Y122.759 I1.487 J.748 E.07104
G1 X130.645 Y122.909 E.00653
G1 X130.932 Y125.092 E.07305
G3 X130.164 Y126.035 I-6.028 J-4.126 E.04039
G1 X130.04 Y126.436 E.01394
G1 X128.426 Y126.224 E.05401
; WIPE_START
G1 F8843.478
G1 X130.04 Y126.436 E-.61876
G1 X130.15 Y126.081 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.614 Y128.65 Z13.4 F42000
G1 Z13
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.55669
G1 F2725
M204 S6000
G1 X125.655 Y128.63 E.00192
; LINE_WIDTH: 0.508421
G1 X125.696 Y128.611 E.00174
; LINE_WIDTH: 0.460152
G1 X125.738 Y128.591 E.00156
; LINE_WIDTH: 0.411883
G1 X125.779 Y128.572 E.00138
; LINE_WIDTH: 0.363614
G1 X125.821 Y128.552 E.0012
; LINE_WIDTH: 0.315345
G1 X125.862 Y128.532 E.00102
; LINE_WIDTH: 0.267076
G1 X125.903 Y128.513 E.00084
M204 S10000
G1 X125.65 Y127.558 F42000
; LINE_WIDTH: 0.527862
G1 F2725
M204 S6000
G1 X125.635 Y128.014 E.018
; LINE_WIDTH: 0.488352
G1 X125.592 Y128.436 E.01541
; LINE_WIDTH: 0.497497
G1 X125.599 Y128.507 E.00266
; LINE_WIDTH: 0.530837
G1 X125.606 Y128.579 E.00285
; LINE_WIDTH: 0.564177
G1 X125.614 Y128.65 E.00305
; LINE_WIDTH: 0.58084
G1 X124.313 Y138.534 E.43699
; LINE_WIDTH: 0.55585
G1 X124.274 Y138.635 E.0045
; LINE_WIDTH: 0.505858
G1 X124.236 Y138.735 E.00406
; LINE_WIDTH: 0.480859
G1 X124.025 Y140.335 E.0576
M204 S10000
G1 X124.557 Y138.742 F42000
; LINE_WIDTH: 0.267031
G1 F2725
M204 S6000
G1 X124.522 Y138.712 E.00084
; LINE_WIDTH: 0.31531
G1 X124.487 Y138.682 E.00102
; LINE_WIDTH: 0.36359
G1 X124.452 Y138.653 E.0012
; LINE_WIDTH: 0.41187
G1 X124.417 Y138.623 E.00138
; LINE_WIDTH: 0.460149
G1 X124.382 Y138.593 E.00156
; LINE_WIDTH: 0.508429
G1 X124.347 Y138.564 E.00174
; LINE_WIDTH: 0.556709
G1 X124.313 Y138.534 E.00192
; CHANGE_LAYER
; Z_HEIGHT: 13.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7006.776
G1 X124.347 Y138.564 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 66/73
; update layer progress
M73 L66
M991 S0 P65 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z13.4 I1.202 J.193 P1  F42000
G1 X126.188 Y127.086 Z13.4
G1 Z13.2
M73 P91 R1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2729
M204 S5000
G1 X131.661 Y127.807 E.16961
G1 X131.501 Y129.016 E.03749
G1 X126.029 Y128.296 E.16961
G1 X126.07 Y127.981 E.00976
G1 X126.18 Y127.146 E.02588
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.166 Y127.385 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.111 Y128.438 Z13.6 F42000
G1 Z13.2
G1 E.8 F1800
G1 F2729
M204 S5000
G1 X131.385 Y129.132 E.16347
G1 X130.012 Y139.562 E.32325
G1 X124.738 Y138.868 E.16347
G1 X125.595 Y132.355 E.20186
G1 X126.103 Y128.497 E.11955
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.089 Y128.736 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.643 Y135.966 Z13.6 F42000
G1 X124.622 Y138.984 Z13.6
G1 Z13.2
G1 E.8 F1800
G1 F2729
M204 S5000
G1 X130.094 Y139.704 E.16961
G1 X129.935 Y140.914 E.03749
G1 X124.462 Y140.193 E.16961
G1 X124.504 Y139.878 E.00976
G1 X124.614 Y139.043 E.02588
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.599 Y139.283 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.441 Y132.199 Z13.6 F42000
G1 X131.533 Y126.984 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2729
M204 S6000
G1 X125.803 Y126.23 E.19169
G1 X124.485 Y116.212 E.33516
G1 X130.018 Y115.483 E.18516
G1 X131.525 Y126.924 E.38279
M204 S10000
G1 X131.979 Y127.453 F42000
G1 F2729
M204 S6000
G1 X125.85 Y126.646 E.20504
G1 X125.756 Y127.362 E.02395
G1 X125.542 Y127.362 E.0071
G1 X124.028 Y115.862 E.38478
G1 X130.369 Y115.027 E.21216
G1 X131.917 Y126.783 E.39334
G3 X131.975 Y127.393 I-7.644 J1.044 E.02035
; WIPE_START
G1 F8843.478
G1 X129.99 Y127.151 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.269 Y134.779 Z13.6 F42000
G1 X130.51 Y141.387 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2729
M204 S5000
G1 X123.77 Y140.499 E.20892
G3 X123.614 Y140.277 I.036 J-.191 E.00922
G1 X125.188 Y128.32 E.3706
G2 X125.188 Y127.68 I-2.787 J-.32 E.0197
G1 X123.614 Y115.72 E.37067
G3 X123.772 Y115.5 I.19 J-.03 E.00924
G1 X130.508 Y114.613 E.20876
G3 X130.58 Y114.615 I.032 J.21 E.00224
G3 X130.733 Y114.785 I-.043 J.192 E.0075
G1 X132.306 Y126.736 E.37038
G3 X132.306 Y129.264 I-10.795 J1.264 E.07786
G1 X130.733 Y141.215 E.37038
G3 X130.571 Y141.387 I-.192 J-.018 E.00782
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.588 Y141.128 E-.76
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


G1 X130.321 Y141.165 F42000
G1 Z13.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.482424
G1 F2729
M204 S6000
G1 X130.531 Y139.564 E.05782
G1 X130.52 Y139.457 E.00385
; LINE_WIDTH: 0.555845
G1 X130.509 Y139.35 E.0045
; LINE_WIDTH: 0.580849
G1 X131.81 Y129.466 E.437
M204 S10000
G1 X131.566 Y129.258 F42000
; LINE_WIDTH: 0.267031
G1 F2729
M204 S6000
G1 X131.601 Y129.288 E.00084
; LINE_WIDTH: 0.31531
G1 X131.636 Y129.318 E.00102
; LINE_WIDTH: 0.36359
G1 X131.671 Y129.347 E.0012
; LINE_WIDTH: 0.41187
G1 X131.706 Y129.377 E.00138
; LINE_WIDTH: 0.460149
G1 X131.741 Y129.407 E.00156
; LINE_WIDTH: 0.508429
G1 X131.775 Y129.436 E.00174
; LINE_WIDTH: 0.556709
G1 X131.81 Y129.466 E.00192
; LINE_WIDTH: 0.555849
G1 X131.849 Y129.365 E.0045
; LINE_WIDTH: 0.505854
G1 X131.887 Y129.265 E.00406
; LINE_WIDTH: 0.468369
G2 X131.983 Y128.404 I-25.858 J-3.303 E.03003
; LINE_WIDTH: 0.423319
G1 X132.014 Y128 E.01257
; LINE_WIDTH: 0.387802
G1 X132.032 Y127.658 E.00962
; WIPE_START
G1 F10438.371
G1 X132.014 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.462 Y120.527 Z13.6 F42000
G1 X130.105 Y118.808 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2729
M204 S6000
G1 X130.317 Y120.422 E.05401
G1 X130.049 Y120.793 E.0152
G2 X130.608 Y122.629 I1.757 J.468 E.06707
G1 X130.91 Y124.925 E.0768
G2 X130.049 Y126.035 I6.673 J6.069 E.04665
G1 X129.997 Y126.43 E.01324
G1 X127.519 Y126.104 E.0829
G1 X128.097 Y125.38 E.03076
G2 X128.46 Y123.414 I-1.135 J-1.226 E.07107
G1 X127.903 Y122.759 E.02854
G3 X127.54 Y120.793 I1.135 J-1.226 E.07107
G1 X128.097 Y120.138 E.02854
G2 X128.46 Y118.173 I-1.135 J-1.226 E.07107
G3 X127.428 Y116.862 I7.868 J-7.259 E.05539
G1 X127.348 Y116.186 E.02258
G1 X124.875 Y116.512 E.08275
G1 X124.922 Y116.865 E.01181
G1 X125.477 Y117.518 E.02841
G3 X125.839 Y119.483 I-1.135 J1.226 E.07107
G1 X125.343 Y120.066 E.0254
G1 X125.747 Y123.131 E.10255
G1 X125.952 Y123.414 E.01158
G1 X126.037 Y124.069 E.02192
G1 X125.921 Y124.455 E.01336
G1 X126.114 Y125.919 E.049
G1 X126.264 Y125.939 E.00501
; WIPE_START
G1 F8843.478
G1 X126.114 Y125.919 E-.05745
G1 X125.921 Y124.455 E-.56132
G1 X126.028 Y124.099 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.651 Y127.558 Z13.6 F42000
G1 Z13.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.52072
G1 F2729
M204 S6000
G1 X125.625 Y128.141 E.0227
; LINE_WIDTH: 0.484575
G1 X125.592 Y128.436 E.01069
; LINE_WIDTH: 0.505845
G1 X125.603 Y128.543 E.00406
; LINE_WIDTH: 0.555842
G1 X125.614 Y128.65 E.0045
; LINE_WIDTH: 0.556702
G1 X125.655 Y128.63 E.00192
; LINE_WIDTH: 0.508425
G1 X125.696 Y128.611 E.00174
; LINE_WIDTH: 0.460149
G1 X125.738 Y128.591 E.00156
; LINE_WIDTH: 0.411873
G1 X125.779 Y128.572 E.00138
; LINE_WIDTH: 0.363597
G1 X125.821 Y128.552 E.0012
; LINE_WIDTH: 0.315321
G1 X125.862 Y128.532 E.00102
; LINE_WIDTH: 0.267045
G1 X125.903 Y128.513 E.00084
M204 S10000
G1 X125.614 Y128.65 F42000
; LINE_WIDTH: 0.580833
G1 F2729
M204 S6000
G1 X124.313 Y138.534 E.43699
; LINE_WIDTH: 0.56418
G1 X124.287 Y138.601 E.00305
; LINE_WIDTH: 0.530846
G1 X124.261 Y138.668 E.00285
; LINE_WIDTH: 0.481584
G1 X124.236 Y138.735 E.00256
G1 X124.025 Y140.335 E.05769
M204 S10000
G1 X124.557 Y138.742 F42000
; LINE_WIDTH: 0.267031
G1 F2729
M204 S6000
G1 X124.522 Y138.712 E.00084
; LINE_WIDTH: 0.31531
G1 X124.487 Y138.682 E.00102
; LINE_WIDTH: 0.36359
G1 X124.452 Y138.653 E.0012
; LINE_WIDTH: 0.41187
G1 X124.417 Y138.623 E.00138
; LINE_WIDTH: 0.460149
G1 X124.382 Y138.593 E.00156
; LINE_WIDTH: 0.508429
G1 X124.347 Y138.564 E.00174
; LINE_WIDTH: 0.556709
G1 X124.313 Y138.534 E.00192
; CHANGE_LAYER
; Z_HEIGHT: 13.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7006.775
G1 X124.347 Y138.564 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 67/73
; update layer progress
M73 L67
M991 S0 P66 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z13.6 I1.202 J.193 P1  F42000
G1 X126.188 Y127.086 Z13.6
G1 Z13.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2736
M204 S5000
G1 X131.661 Y127.807 E.16961
G1 X131.501 Y129.016 E.03749
G1 X126.029 Y128.296 E.16961
G1 X126.066 Y128.011 E.00882
G1 X126.18 Y127.146 E.02683
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.166 Y127.385 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.111 Y128.438 Z13.8 F42000
G1 Z13.4
G1 E.8 F1800
G1 F2736
M204 S5000
G1 X131.385 Y129.132 E.16347
G1 X130.012 Y139.562 E.32325
G1 X124.738 Y138.868 E.16347
G1 X125.4 Y133.838 E.15588
G1 X126.103 Y128.497 E.16553
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.089 Y128.736 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.643 Y135.966 Z13.8 F42000
G1 X124.622 Y138.984 Z13.8
G1 Z13.4
G1 E.8 F1800
G1 F2736
M204 S5000
G1 X130.094 Y139.704 E.16961
G1 X129.935 Y140.914 E.03749
G1 X124.462 Y140.193 E.16961
M73 P92 R1
G1 X124.5 Y139.909 E.00882
G1 X124.614 Y139.043 E.02683
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.599 Y139.283 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.441 Y132.199 Z13.8 F42000
G1 X131.533 Y126.984 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2736
M204 S6000
G1 X125.803 Y126.23 E.19169
G1 X124.485 Y116.212 E.33516
G1 X130.018 Y115.483 E.18516
G1 X131.525 Y126.924 E.38279
M204 S10000
G1 X131.979 Y127.453 F42000
G1 F2736
M204 S6000
G1 X125.85 Y126.646 E.20504
G1 X125.756 Y127.362 E.02395
G1 X125.542 Y127.362 E.0071
G1 X124.028 Y115.862 E.38478
G1 X130.369 Y115.027 E.21216
G1 X131.917 Y126.783 E.39334
G3 X131.975 Y127.393 I-7.628 J1.042 E.02034
; WIPE_START
G1 F8843.478
G1 X129.99 Y127.151 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.269 Y134.779 Z13.8 F42000
G1 X130.51 Y141.387 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2736
M204 S5000
G1 X123.77 Y140.499 E.20891
G3 X123.614 Y140.278 I.039 J-.193 E.00919
G1 X125.188 Y128.32 E.3706
G2 X125.188 Y127.68 I-2.82 J-.32 E.0197
G1 X123.614 Y115.72 E.37067
G3 X123.772 Y115.5 I.192 J-.029 E.00922
G1 X130.508 Y114.613 E.20876
G3 X130.58 Y114.615 I.032 J.211 E.00224
G3 X130.733 Y114.785 I-.04 J.189 E.00752
G1 X132.306 Y126.736 E.37038
G3 X132.306 Y129.264 I-10.795 J1.264 E.07786
G1 X130.733 Y141.215 E.37037
G3 X130.571 Y141.387 I-.194 J-.02 E.0078
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.588 Y141.128 E-.76
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


G1 X130.321 Y141.165 F42000
G1 Z13.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.482424
G1 F2736
M204 S6000
G1 X130.531 Y139.564 E.05782
G1 X130.52 Y139.457 E.00385
; LINE_WIDTH: 0.555845
G1 X130.509 Y139.35 E.0045
; LINE_WIDTH: 0.580849
G1 X131.81 Y129.466 E.437
M204 S10000
G1 X131.566 Y129.258 F42000
; LINE_WIDTH: 0.267031
G1 F2736
M204 S6000
G1 X131.601 Y129.288 E.00084
; LINE_WIDTH: 0.31531
G1 X131.636 Y129.318 E.00102
; LINE_WIDTH: 0.36359
G1 X131.671 Y129.347 E.0012
; LINE_WIDTH: 0.41187
G1 X131.706 Y129.377 E.00138
; LINE_WIDTH: 0.460149
G1 X131.741 Y129.407 E.00156
; LINE_WIDTH: 0.508429
G1 X131.775 Y129.436 E.00174
; LINE_WIDTH: 0.556709
G1 X131.81 Y129.466 E.00192
; LINE_WIDTH: 0.555849
G1 X131.849 Y129.365 E.0045
; LINE_WIDTH: 0.505854
G1 X131.887 Y129.265 E.00406
; LINE_WIDTH: 0.468369
G2 X131.983 Y128.404 I-25.861 J-3.303 E.03003
; LINE_WIDTH: 0.423321
G1 X132.014 Y128 E.01257
; LINE_WIDTH: 0.387784
G1 X132.032 Y127.658 E.00962
; WIPE_START
G1 F10438.898
G1 X132.014 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.477 Y120.524 Z13.8 F42000
G1 X130.071 Y118.548 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2736
M204 S6000
G1 X130.283 Y120.162 E.05401
G1 X130.028 Y120.466 E.01317
G2 X130.58 Y122.413 I1.519 J.622 E.07236
G1 X130.895 Y124.81 E.08017
G1 X130.303 Y125.38 E.02725
G2 X129.925 Y126.421 I.709 J.847 E.0385
G1 X127.598 Y126.115 E.07785
G3 X128.593 Y125.052 I105.353 J97.632 E.04829
G2 X128.363 Y123.414 I-1.653 J-.603 E.05712
G3 X127.407 Y122.431 I4.188 J-5.03 E.04556
G3 X127.637 Y120.793 I1.653 J-.603 E.05712
G2 X128.593 Y119.811 I-4.187 J-5.029 E.04556
G2 X128.363 Y118.173 I-1.653 J-.603 E.05712
G1 X127.683 Y117.518 E.03133
G3 X127.285 Y116.862 I.721 J-.886 E.02593
G1 X127.327 Y116.189 E.02237
G1 X124.875 Y116.512 E.08202
G2 X125.017 Y116.862 I.594 J-.036 E.01275
G3 X125.973 Y117.845 I-4.189 J5.031 E.04556
G3 X125.32 Y119.89 I-1.631 J.606 E.07672
G1 X125.698 Y122.76 E.09603
G3 X126.095 Y123.414 I-.72 J.884 E.02589
G1 X126.062 Y124.069 E.02176
G1 X125.911 Y124.378 E.01141
G1 X126.114 Y125.919 E.05155
G1 X126.187 Y125.929 E.00246
; WIPE_START
G1 F8843.478
G1 X126.114 Y125.919 E-.02818
G1 X125.911 Y124.378 E-.59059
G1 X126.062 Y124.069 E-.13069
G1 X126.063 Y124.041 E-.01055
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.614 Y128.65 Z13.8 F42000
G1 Z13.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.556683
G1 F2736
M204 S6000
G1 X125.655 Y128.63 E.00192
; LINE_WIDTH: 0.508387
G1 X125.697 Y128.611 E.00174
; LINE_WIDTH: 0.460092
G1 X125.738 Y128.591 E.00156
; LINE_WIDTH: 0.411797
G1 X125.779 Y128.572 E.00138
; LINE_WIDTH: 0.363502
G1 X125.821 Y128.552 E.0012
; LINE_WIDTH: 0.315207
G1 X125.862 Y128.532 E.00102
; LINE_WIDTH: 0.266911
G1 X125.903 Y128.513 E.00083
M204 S10000
G1 X125.65 Y127.558 F42000
; LINE_WIDTH: 0.52105
G1 F2736
M204 S6000
G1 X125.625 Y128.141 E.02271
; LINE_WIDTH: 0.484631
G1 X125.592 Y128.436 E.0107
; LINE_WIDTH: 0.505883
G1 X125.603 Y128.543 E.00406
; LINE_WIDTH: 0.555847
G1 X125.614 Y128.65 E.00449
; LINE_WIDTH: 0.580829
G1 X124.313 Y138.534 E.43699
M204 S10000
G1 X124.557 Y138.742 F42000
; LINE_WIDTH: 0.267031
G1 F2736
M204 S6000
G1 X124.522 Y138.712 E.00084
; LINE_WIDTH: 0.31531
G1 X124.487 Y138.682 E.00102
; LINE_WIDTH: 0.36359
G1 X124.452 Y138.653 E.0012
; LINE_WIDTH: 0.41187
G1 X124.417 Y138.623 E.00138
; LINE_WIDTH: 0.460149
G1 X124.382 Y138.593 E.00156
; LINE_WIDTH: 0.508429
G1 X124.347 Y138.564 E.00174
; LINE_WIDTH: 0.556709
G1 X124.313 Y138.534 E.00192
; LINE_WIDTH: 0.555851
G1 X124.274 Y138.635 E.0045
; LINE_WIDTH: 0.482435
G1 X124.236 Y138.735 E.00385
G1 X124.025 Y140.335 E.05781
; CHANGE_LAYER
; Z_HEIGHT: 13.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F8190.861
G1 X124.236 Y138.735 E-.71251
G1 X124.274 Y138.635 E-.04749
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 68/73
; update layer progress
M73 L68
M991 S0 P67 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z13.8 I1.201 J.199 P1  F42000
G1 X126.188 Y127.086 Z13.8
G1 Z13.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3007
M204 S5000
G1 X131.661 Y127.807 E.16961
G1 X131.501 Y129.016 E.03749
G1 X126.029 Y128.296 E.16961
G1 X126.18 Y127.146 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.166 Y127.385 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.533 Y126.984 Z14 F42000
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3007
M204 S6000
G1 X125.803 Y126.23 E.19169
G1 X124.485 Y116.212 E.33516
G1 X130.018 Y115.483 E.18516
G1 X131.525 Y126.924 E.38279
M204 S10000
G1 X131.979 Y127.453 F42000
G1 F3007
M204 S6000
G1 X125.85 Y126.646 E.20504
G1 X125.756 Y127.362 E.02395
G1 X125.542 Y127.362 E.0071
G1 X124.028 Y115.862 E.38478
G1 X130.369 Y115.027 E.21216
G1 X131.917 Y126.783 E.39334
G3 X131.975 Y127.393 I-7.628 J1.042 E.02034
; WIPE_START
G1 F8843.478
G1 X129.99 Y127.151 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.111 Y128.438 Z14 F42000
G1 Z13.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3007
M204 S5000
G1 X131.385 Y129.132 E.16347
G1 X130.012 Y139.562 E.32325
G1 X124.738 Y138.868 E.16347
G1 X125.204 Y135.322 E.1099
G1 X126.103 Y128.497 E.21151
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.089 Y128.736 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.643 Y135.966 Z14 F42000
G1 X124.622 Y138.984 Z14
G1 Z13.6
G1 E.8 F1800
G1 F3007
M204 S5000
G1 X130.094 Y139.704 E.16961
G1 X129.935 Y140.914 E.03749
G1 X124.462 Y140.193 E.16961
G1 X124.614 Y139.043 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.599 Y139.283 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P93 R1
G1 X130.51 Y141.387 Z14 F42000
G1 Z13.6
G1 E.8 F1800
G1 F3007
M204 S5000
G1 X123.725 Y140.486 E.21033
G3 X123.614 Y140.277 I.087 J-.18 E.00776
G1 X125.188 Y128.322 E.37052
G2 X125.188 Y127.68 I-3.322 J-.323 E.01976
G1 X123.614 Y115.72 E.37067
G3 X123.77 Y115.501 I.19 J-.03 E.00917
G1 X130.508 Y114.613 E.20883
G3 X130.594 Y114.618 I.031 J.22 E.00268
G1 X130.618 Y114.626 E.00078
G3 X130.733 Y114.785 I-.097 J.19 E.00626
G1 X132.306 Y126.736 E.37038
G3 X132.306 Y129.264 I-10.795 J1.264 E.07786
G1 X130.732 Y141.217 E.37045
G3 X130.571 Y141.387 I-.193 J-.022 E.00772
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.588 Y141.126 E-.76
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


G1 X130.321 Y141.165 F42000
G1 Z13.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.481562
G1 F3007
M204 S6000
G1 X130.531 Y139.564 E.05771
G1 X130.524 Y139.493 E.00256
; LINE_WIDTH: 0.530847
G1 X130.516 Y139.421 E.00285
; LINE_WIDTH: 0.564181
G1 X130.509 Y139.35 E.00305
; LINE_WIDTH: 0.580842
G1 X131.81 Y129.466 E.437
; LINE_WIDTH: 0.555851
G1 X131.849 Y129.365 E.0045
; LINE_WIDTH: 0.505859
G1 X131.887 Y129.265 E.00406
; LINE_WIDTH: 0.468359
G2 X131.983 Y128.404 I-25.778 J-3.294 E.03003
; LINE_WIDTH: 0.423312
G1 X132.014 Y128 E.01256
; LINE_WIDTH: 0.387795
G1 X132.032 Y127.658 E.00962
M204 S10000
G1 X131.566 Y129.258 F42000
; LINE_WIDTH: 0.267031
G1 F3007
M204 S6000
G1 X131.601 Y129.288 E.00084
; LINE_WIDTH: 0.31531
G1 X131.636 Y129.318 E.00102
; LINE_WIDTH: 0.36359
G1 X131.671 Y129.347 E.0012
; LINE_WIDTH: 0.41187
G1 X131.706 Y129.377 E.00138
; LINE_WIDTH: 0.460149
G1 X131.741 Y129.407 E.00156
; LINE_WIDTH: 0.508429
G1 X131.775 Y129.436 E.00174
; LINE_WIDTH: 0.556709
G1 X131.81 Y129.466 E.00192
; WIPE_START
G1 F7006.776
G1 X131.775 Y129.436 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.903 Y128.513 Z14 F42000
G1 Z13.6
G1 E.8 F1800
; LINE_WIDTH: 0.267062
G1 F3007
M204 S6000
G1 X125.862 Y128.532 E.00084
; LINE_WIDTH: 0.315337
G1 X125.821 Y128.552 E.00102
; LINE_WIDTH: 0.363613
G1 X125.779 Y128.572 E.0012
; LINE_WIDTH: 0.411889
G1 X125.738 Y128.591 E.00138
; LINE_WIDTH: 0.460164
G1 X125.696 Y128.611 E.00156
; LINE_WIDTH: 0.50844
G1 X125.655 Y128.63 E.00174
; LINE_WIDTH: 0.556716
G1 X125.614 Y128.65 E.00192
; LINE_WIDTH: 0.580842
G1 X124.313 Y138.534 E.437
; LINE_WIDTH: 0.55669
G1 X124.347 Y138.564 E.00192
; LINE_WIDTH: 0.508413
G1 X124.382 Y138.593 E.00174
; LINE_WIDTH: 0.460137
G1 X124.417 Y138.623 E.00156
; LINE_WIDTH: 0.41186
G1 X124.452 Y138.653 E.00138
; LINE_WIDTH: 0.363583
G1 X124.487 Y138.682 E.0012
; LINE_WIDTH: 0.315306
G1 X124.522 Y138.712 E.00102
; LINE_WIDTH: 0.267029
G1 X124.557 Y138.742 E.00084
M204 S10000
G1 X124.274 Y138.635 F42000
; LINE_WIDTH: 0.505843
G1 F3007
M204 S6000
G1 X124.236 Y138.735 E.00406
; LINE_WIDTH: 0.480839
G1 X124.025 Y140.335 E.0576
M204 S10000
G1 X124.274 Y138.635 F42000
; LINE_WIDTH: 0.555838
G1 F3007
M204 S6000
G1 X124.313 Y138.534 E.0045
M204 S10000
G1 X125.614 Y128.65 F42000
; LINE_WIDTH: 0.555838
G1 F3007
M204 S6000
G1 X125.603 Y128.543 E.0045
; LINE_WIDTH: 0.505844
G1 X125.592 Y128.436 E.00406
; LINE_WIDTH: 0.488333
G1 X125.635 Y128.014 E.01538
; LINE_WIDTH: 0.52725
G1 X125.651 Y127.558 E.01801
; WIPE_START
G1 F7432.955
G1 X125.635 Y128.014 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.143 Y125.89 Z14 F42000
G1 Z13.6
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.383313
G1 F3007
M204 S6000
G1 X126.111 Y125.785 E.00304
G1 X124.912 Y116.683 E.25467
G1 X124.922 Y116.548 E.00374
G1 X125.049 Y116.504 E.00374
G1 X129.548 Y115.911 E.12587
G1 X129.683 Y115.921 E.00374
G1 X129.727 Y116.048 E.00374
G1 X131.084 Y126.357 E.2884
; LINE_WIDTH: 0.396875
G1 X131.075 Y126.437 E.00233
; LINE_WIDTH: 0.416066
G1 X131.066 Y126.518 E.00246
G1 X130.933 Y126.538 E.00409
; LINE_WIDTH: 0.382999
G1 X126.2 Y125.908 E.13232
M204 S10000
G1 X126.416 Y125.328 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3007
M204 S6000
G1 X126.204 Y123.713 E.05401
G2 X126.095 Y122.885 I-.719 J-.326 E.02919
G1 X125.658 Y119.483 E.11379
G2 X126.245 Y117.845 I-1.503 J-1.462 E.05951
G1 X126 Y117.518 E.01356
G1 X125.323 Y117.024 E.02779
G1 X125.298 Y116.837 E.00627
G1 X127.169 Y116.591 E.06258
G2 X127.379 Y117.518 I.771 J.312 E.03356
G1 X128.279 Y118.173 E.03692
G3 X128.865 Y119.811 I-1.503 J1.462 E.05951
G1 X128.621 Y120.138 E.01356
G1 X127.721 Y120.793 E.03692
G2 X127.135 Y122.431 I1.503 J1.462 E.05951
G1 X127.379 Y122.759 E.01356
G1 X128.279 Y123.414 E.03692
G3 X128.865 Y125.052 I-1.503 J1.462 E.05951
G3 X128.052 Y125.794 I-1.604 J-.941 E.03708
G1 X129.722 Y126.014 E.05589
G3 X130 Y125.38 I.676 J-.082 E.02409
G1 X130.538 Y124.988 E.02209
G1 X130.115 Y121.777 E.10741
G3 X129.755 Y120.466 I1.51 J-1.12 E.04615
G1 X129.915 Y120.252 E.00883
G1 X129.702 Y118.638 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 13.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X129.915 Y120.252 E-.61876
G1 X129.755 Y120.466 E-.10117
G1 X129.744 Y120.571 E-.04007
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 69/73
; update layer progress
M73 L69
M991 S0 P68 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z14 I-1.068 J-.583 P1  F42000
G1 X126.188 Y127.086 Z14
G1 Z13.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4042
M204 S5000
G1 X131.661 Y127.807 E.16961
G1 X131.501 Y129.016 E.03749
G1 X126.029 Y128.296 E.16961
G1 X126.18 Y127.146 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.166 Y127.385 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.533 Y126.984 Z14.2 F42000
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4042
M204 S6000
G1 X125.803 Y126.23 E.19169
G1 X124.485 Y116.212 E.33516
G1 X130.018 Y115.483 E.18516
G1 X131.525 Y126.924 E.38279
M204 S10000
G1 X131.979 Y127.453 F42000
G1 F4042
M204 S6000
G1 X125.85 Y126.646 E.20504
G1 X125.756 Y127.362 E.02395
G1 X125.542 Y127.362 E.0071
G1 X124.028 Y115.862 E.38478
G1 X130.369 Y115.027 E.21216
G1 X131.917 Y126.783 E.39334
G3 X131.975 Y127.393 I-7.644 J1.044 E.02035
; WIPE_START
G1 F8843.478
G1 X129.99 Y127.151 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.111 Y128.438 Z14.2 F42000
G1 Z13.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4042
M204 S5000
G1 X131.385 Y129.132 E.16347
G1 X130.012 Y139.562 E.32325
G1 X124.738 Y138.868 E.16347
G1 X125.009 Y136.805 E.06392
G1 X126.103 Y128.497 E.25748
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.089 Y128.736 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.643 Y135.966 Z14.2 F42000
G1 X124.622 Y138.984 Z14.2
G1 Z13.8
G1 E.8 F1800
G1 F4042
M204 S5000
G1 X130.094 Y139.704 E.16961
G1 X129.935 Y140.914 E.03749
G1 X124.462 Y140.193 E.16961
G1 X124.614 Y139.043 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.599 Y139.283 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.511 Y141.387 Z14.2 F42000
G1 Z13.8
G1 E.8 F1800
G1 F4042
M204 S5000
G1 X123.77 Y140.499 E.20892
G3 X123.614 Y140.277 I.038 J-.193 E.00919
G1 X125.188 Y128.32 E.3706
G2 X125.188 Y127.68 I-2.805 J-.32 E.0197
G1 X123.614 Y115.72 E.37067
G3 X123.772 Y115.5 I.19 J-.03 E.00924
G1 X130.508 Y114.613 E.20876
G3 X130.594 Y114.618 I.031 J.219 E.00266
G3 X130.733 Y114.785 I-.058 J.189 E.00707
G1 X132.306 Y126.736 E.37038
G3 X132.306 Y129.264 I-10.795 J1.264 E.07786
G1 X130.733 Y141.214 E.37037
G3 X130.571 Y141.387 I-.192 J-.018 E.00783
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.588 Y141.128 E-.76
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


G1 X130.321 Y141.165 F42000
G1 Z13.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.482421
G1 F4042
M204 S6000
G1 X130.531 Y139.564 E.05782
G1 X130.52 Y139.457 E.00385
; LINE_WIDTH: 0.555841
M73 P94 R1
G1 X130.509 Y139.35 E.0045
; LINE_WIDTH: 0.580848
G1 X131.81 Y129.466 E.437
M204 S10000
G1 X131.566 Y129.258 F42000
; LINE_WIDTH: 0.267031
G1 F4042
M204 S6000
G1 X131.601 Y129.288 E.00084
; LINE_WIDTH: 0.31531
G1 X131.636 Y129.318 E.00102
; LINE_WIDTH: 0.36359
G1 X131.671 Y129.347 E.0012
; LINE_WIDTH: 0.41187
G1 X131.706 Y129.377 E.00138
; LINE_WIDTH: 0.460149
G1 X131.741 Y129.407 E.00156
; LINE_WIDTH: 0.508429
G1 X131.775 Y129.436 E.00174
; LINE_WIDTH: 0.556709
G1 X131.81 Y129.466 E.00192
; LINE_WIDTH: 0.555848
G1 X131.849 Y129.365 E.0045
; LINE_WIDTH: 0.505852
G1 X131.887 Y129.265 E.00406
; LINE_WIDTH: 0.468368
G2 X131.983 Y128.404 I-25.869 J-3.304 E.03003
; LINE_WIDTH: 0.42332
G1 X132.014 Y128 E.01258
; LINE_WIDTH: 0.387787
G1 X132.032 Y127.658 E.00961
; WIPE_START
G1 F10438.811
G1 X132.014 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.594 Y126.692 Z14.2 F42000
G1 Z13.8
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.41395
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X131.04 Y126.078 E.04159
G1 X130.953 Y125.411 E.03691
G1 X130.206 Y126.436 E.06955
G1 X129.682 Y126.367 E.02897
G1 X130.865 Y124.744 E.11015
G1 X130.777 Y124.076 E.03691
G1 X129.158 Y126.298 E.15074
G1 X128.635 Y126.229 E.02897
G1 X130.689 Y123.409 E.19134
G1 X130.601 Y122.741 E.03691
G1 X128.111 Y126.161 E.23194
G1 X127.587 Y126.092 E.02897
G1 X130.513 Y122.074 E.27254
G1 X130.425 Y121.406 E.03691
G1 X127.063 Y126.023 E.31313
G1 X126.54 Y125.954 E.02897
G1 X130.337 Y120.739 E.35373
G1 X130.25 Y120.072 E.03691
G1 X126.113 Y125.751 E.38527
G1 X126.025 Y125.084 E.03691
G1 X130.162 Y119.404 E.38527
G1 X130.074 Y118.737 E.03691
G1 X125.938 Y124.416 E.38527
G1 X125.85 Y123.749 E.03691
G1 X129.986 Y118.069 E.38527
G1 X129.898 Y117.402 E.03691
G1 X125.762 Y123.081 E.38527
G1 X125.674 Y122.414 E.03691
G1 X129.81 Y116.734 E.38527
G1 X129.722 Y116.067 E.03691
G1 X125.586 Y121.747 E.38527
G1 X125.498 Y121.079 E.03691
G1 X129.226 Y115.961 E.3472
G1 X128.591 Y116.044 E.03511
G1 X125.41 Y120.412 E.29625
G1 X125.322 Y119.744 E.03691
G1 X127.956 Y116.128 E.2453
G1 X127.321 Y116.212 E.03511
G1 X125.235 Y119.077 E.19435
G1 X125.147 Y118.409 E.03691
G1 X126.686 Y116.295 E.14341
G1 X126.051 Y116.379 E.03511
G1 X125.059 Y117.742 E.09246
G1 X124.971 Y117.075 E.03691
G1 X125.581 Y116.237 E.05684
M106 S201.45
; WIPE_START
G1 X124.971 Y117.075 E-.39389
G1 X125.059 Y117.742 E-.25581
G1 X125.23 Y117.507 E-.1103
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.549 Y125.133 Z14.2 F42000
G1 X125.651 Y127.558 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.520888
; LAYER_HEIGHT: 0.2
G1 F4042
M204 S6000
G1 X125.625 Y128.141 E.02271
; LINE_WIDTH: 0.484573
G1 X125.592 Y128.436 E.01069
; LINE_WIDTH: 0.505844
G1 X125.603 Y128.543 E.00406
; LINE_WIDTH: 0.555838
G1 X125.614 Y128.65 E.0045
; LINE_WIDTH: 0.556688
G1 X125.655 Y128.63 E.00192
; LINE_WIDTH: 0.508411
G1 X125.697 Y128.611 E.00174
; LINE_WIDTH: 0.460134
G1 X125.738 Y128.591 E.00156
; LINE_WIDTH: 0.411858
G1 X125.779 Y128.572 E.00138
; LINE_WIDTH: 0.363581
G1 X125.821 Y128.552 E.0012
; LINE_WIDTH: 0.315304
G1 X125.862 Y128.532 E.00102
; LINE_WIDTH: 0.267028
G1 X125.903 Y128.513 E.00084
M204 S10000
G1 X125.614 Y128.65 F42000
; LINE_WIDTH: 0.580823
G1 F4042
M204 S6000
G1 X124.313 Y138.534 E.43698
; LINE_WIDTH: 0.555837
G1 X124.274 Y138.635 E.0045
; LINE_WIDTH: 0.50584
G1 X124.236 Y138.735 E.00406
; LINE_WIDTH: 0.480839
G1 X124.025 Y140.335 E.0576
M204 S10000
G1 X124.557 Y138.742 F42000
; LINE_WIDTH: 0.267029
G1 F4042
M204 S6000
G1 X124.522 Y138.712 E.00084
; LINE_WIDTH: 0.315306
G1 X124.487 Y138.682 E.00102
; LINE_WIDTH: 0.363583
G1 X124.452 Y138.653 E.0012
; LINE_WIDTH: 0.41186
G1 X124.417 Y138.623 E.00138
; LINE_WIDTH: 0.460137
G1 X124.382 Y138.593 E.00156
; LINE_WIDTH: 0.508413
G1 X124.347 Y138.564 E.00174
; LINE_WIDTH: 0.55669
G1 X124.313 Y138.534 E.00192
; CHANGE_LAYER
; Z_HEIGHT: 14
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7007.027
G1 X124.347 Y138.564 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 70/73
; update layer progress
M73 L70
M991 S0 P69 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z14.2 I1.204 J.18 P1  F42000
G1 X125.986 Y127.615 Z14.2
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4537
M204 S6000
G1 X124.485 Y116.219 E.3813
G1 X130.019 Y115.49 E.18516
G1 X131.512 Y126.832 E.37947
G3 X131.554 Y127.227 I-9.484 J1.199 E.01319
G1 X131.586 Y127.825 E.01985
G1 X131.59 Y128 E.00581
G1 X131.586 Y128.163 E.00541
G1 F3245.208
G1 X131.582 Y128.352 E.00628
G1 X131.561 Y128.349 E.00068
M106 S255
G1 F1800
G1 X131.182 Y128.299 E.01269
M106 S201.45
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X126.522 Y127.686 E.15591
M106 S201.45
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X126.143 Y127.636 E.01269
M106 S201.45
G1 F2427.64
G1 X126.045 Y127.623 E.00328
M204 S10000
G1 X125.601 Y127.975 F42000
G1 F4537
M204 S6000
G2 X125.578 Y127.638 I-2.633 J.006 E.01123
G1 X124.029 Y115.868 E.39377
G1 X130.37 Y115.033 E.21216
G1 X131.917 Y126.783 E.39312
G3 X131.987 Y128.404 I-9.599 J1.226 E.0539
G1 X131.961 Y128.813 E.01356
G1 X131.508 Y128.753 E.01515
M106 S255
G1 F1320
G1 X126.09 Y128.04 E.18128
M106 S201.45
G1 F4405.57
G1 X125.66 Y127.983 E.01438
; WIPE_START
G1 X125.578 Y127.638 E-.13495
G1 X125.363 Y126.007 E-.62505
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.974 Y133.629 Z14.4 F42000
G1 X124.686 Y139.257 Z14.4
G1 Z14
G1 E.8 F1800
M106 S255
G1 F1320
M204 S6000
G1 X130.033 Y139.96 E.17888
M106 S201.45
G1 F4537
G1 X130.494 Y140.021 E.01544
G1 X130.442 Y140.418 E.01327
G1 X130.37 Y140.967 E.01837
G1 X124.029 Y140.132 E.21216
G1 X124.101 Y139.583 E.01836
G1 X124.153 Y139.186 E.01327
G1 X124.615 Y139.247 E.01544
M106 S255
G1 F1320
G1 X124.627 Y139.249 E.00042
M106 S201.45
; WIPE_START
G1 X126.61 Y139.51 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.266 Y131.885 Z14.4 F42000
G1 X126.111 Y128.438 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4537
M204 S5000
G1 X131.385 Y129.132 E.16347
G1 X130.012 Y139.562 E.32325
G1 X124.738 Y138.868 E.16347
G1 X124.814 Y138.289 E.01795
G1 X126.103 Y128.497 E.30346
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.089 Y128.736 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.328 Y135.852 Z14.4 F42000
G1 X123.616 Y140.265 Z14.4
G1 Z14
G1 E.8 F1800
G1 F4537
M204 S5000
G1 X125.188 Y128.322 E.37014
G2 X125.188 Y127.68 I-3.331 J-.322 E.01975
G1 X123.615 Y115.733 E.37028
G3 X123.771 Y115.507 I.192 J-.034 E.00933
G1 X130.51 Y114.619 E.20888
G3 X130.582 Y114.622 I.029 J.212 E.00223
G3 X130.734 Y114.798 I-.046 J.194 E.00763
G1 X132.306 Y126.736 E.37
G3 X132.306 Y129.264 I-10.794 J1.264 E.07786
G1 X130.734 Y141.204 E.37006
G3 X130.511 Y141.381 I-.194 J-.016 E.00979
G1 X123.771 Y140.493 E.20891
G3 X123.614 Y140.325 I.038 J-.192 E.00753
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.874 Y138.342 E-.76
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


G1 X124.251 Y139.001 F42000
G1 Z14
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.580858
G1 F4537
M204 S6000
G1 X125.675 Y128.183 E.47832
; WIPE_START
G1 F6692.22
G1 X125.414 Y130.166 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P94 R0
G1 X126.105 Y127.265 Z14.4 F42000
G1 Z14
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.47845
M106 S255
G1 F3000
M204 S6000
G1 X131.241 Y127.941 E.18386
G1 X131.248 Y127.898 E.00155
G2 X131.237 Y127.502 I-2.293 J-.133 E.0141
G1 X126.22 Y126.841 E.17958
G1 X126.161 Y126.394 E.016
G1 X131.198 Y127.057 E.18029
G2 X131.147 Y126.611 I-5.161 J.358 E.01593
G1 X126.102 Y125.947 E.1806
G1 X126.053 Y125.576 E.01327
G1 X126.338 Y125.539 E.01019
G1 X131.263 Y126.187 E.17628
M106 S201.45
; WIPE_START
G1 X129.28 Y125.926 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.872 Y128.999 Z14.4 F42000
G1 Z14
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.580817
G1 F4537
M204 S6000
G1 X130.448 Y139.817 E.47829
M204 S10000
G1 X130.23 Y140.467 F42000
; LINE_WIDTH: 0.589453
G1 F4537
M204 S6000
G1 X124.293 Y139.685 E.26671
; WIPE_START
G1 F6586.981
G1 X126.276 Y139.947 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.42 Y132.316 Z14.4 F42000
G1 X126.556 Y125.162 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F4537
M204 S6000
G1 X130.973 Y125.74 E.13689
G1 X129.682 Y115.93 E.30402
G1 X124.925 Y116.556 E.14741
G1 X126.063 Y125.197 E.26779
G1 X126.496 Y125.166 E.01334
M204 S10000
G1 X126.605 Y124.788 F42000
G1 F4537
M204 S6000
G1 X130.535 Y125.302 E.1218
G1 X129.357 Y116.353 E.27734
G1 X125.348 Y116.881 E.12424
G1 X126.39 Y124.792 E.24519
G1 X126.545 Y124.789 E.00476
M204 S10000
G1 X128.376 Y123.144 F42000
; LINE_WIDTH: 0.36784
G1 F4537
M204 S6000
G1 X127.757 Y118.439 E.12565
G1 X127.434 Y118.482 E.0086
G1 X128.042 Y123.101 E.12335
G1 X128.316 Y123.136 E.00732
M204 S10000
G1 X128.784 Y123.552 F42000
; LINE_WIDTH: 0.41999
G1 F4537
M204 S6000
G1 X128.059 Y118.045 E.17065
G1 X127.041 Y118.179 E.03155
G1 X127.73 Y123.414 E.16222
G1 X128.724 Y123.544 E.03082
M204 S10000
M73 P95 R0
G1 X129.222 Y123.989 F42000
G1 F4537
M204 S6000
G1 X128.383 Y117.622 E.19732
G1 X126.618 Y117.855 E.05473
G1 X127.394 Y123.75 E.1827
G1 X129.162 Y123.981 E.0548
M204 S10000
G1 X129.659 Y124.427 F42000
G1 F4537
M204 S6000
G1 X128.708 Y117.199 E.224
G1 X126.194 Y117.53 E.0779
G1 X127.058 Y124.086 E.20318
G1 X129.6 Y124.419 E.07879
M204 S10000
G1 X130.097 Y124.864 F42000
G1 F4537
M204 S6000
G1 X129.033 Y116.776 E.25067
G1 X125.771 Y117.206 E.10107
G1 X126.722 Y124.423 E.22367
G1 X130.038 Y124.857 E.10277
; CHANGE_LAYER
; Z_HEIGHT: 14.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X128.055 Y124.597 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 71/73
; update layer progress
M73 L71
M991 S0 P70 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z14.4 I-1.031 J-.646 P1  F42000
G1 X126.003 Y127.87 Z14.4
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4708
M204 S6000
G2 X125.981 Y127.583 I-2.19 J.023 E.00956
G1 X124.492 Y116.27 E.37849
G1 X130.026 Y115.542 E.18514
G1 X131.513 Y126.832 E.37775
G3 X131.567 Y128.602 I-9.01 J1.163 E.05885
G1 X126.063 Y127.878 E.18416
M204 S10000
G1 X126.377 Y128.33 F42000
G1 F4708
M204 S6000
G1 X131.545 Y129.01 E.17289
G1 X130.134 Y139.722 E.35839
G1 X124.578 Y138.99 E.1859
G1 X125.621 Y131.072 E.26493
G1 X125.988 Y128.278 E.09346
G1 X126.318 Y128.322 E.01102
M204 S250
G1 X126.326 Y128.718 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1560
M204 S5000
G1 X131.105 Y129.347 E.1481
G1 X129.797 Y139.282 E.30789
G1 X125.018 Y138.653 E.14811
G1 X126.009 Y131.123 E.23336
G1 X126.318 Y128.778 E.07268
M106 S201.45
; WIPE_START
M204 S6000
G1 X128.304 Y129.014 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.945 Y136.273 Z14.6 F42000
G1 X124.914 Y139.445 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4708
M204 S6000
G1 X130.07 Y140.124 E.1725
G1 X130.026 Y140.457 E.01114
G1 X124.492 Y139.729 E.18514
G1 X124.536 Y139.395 E.01118
G1 X124.854 Y139.437 E.01065
; WIPE_START
G1 F8843.478
G1 X126.837 Y139.698 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.035 Y140.08 Z14.6 F42000
G1 Z14.2
G1 E.8 F1800
G1 F4708
M204 S6000
G1 X125.578 Y128.362 E.39205
G2 X125.577 Y127.631 I-3.849 J-.361 E.02429
G1 X124.035 Y115.92 E.39183
G1 X130.376 Y115.085 E.21215
G1 X131.917 Y126.783 E.3914
G3 X131.917 Y129.217 I-10.361 J1.217 E.08092
G1 X130.376 Y140.913 E.39134
G1 X124.095 Y140.088 E.21016
M204 S250
G1 X123.623 Y140.265 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4708
M204 S5000
G3 X123.631 Y140.146 I.231 J-.043 E.00372
G1 X125.188 Y128.32 E.36651
G2 X125.188 Y127.678 I-3.323 J-.319 E.01976
G1 X123.631 Y115.854 E.36645
G3 X123.781 Y115.558 I.214 J-.077 E.0114
G1 X130.517 Y114.671 E.20879
G3 X130.585 Y114.674 I.025 J.181 E.00209
G3 X130.746 Y114.891 I-.083 J.229 E.00879
G1 X132.306 Y126.736 E.36711
G3 X132.306 Y129.264 I-10.793 J1.264 E.07786
G1 X130.746 Y141.11 E.36712
G3 X130.543 Y141.331 I-.23 J-.008 E.01004
G1 X123.76 Y140.437 E.21022
G3 X123.641 Y140.322 I.094 J-.215 E.00518
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.631 Y140.146 E-.06726
G1 X123.869 Y138.338 E-.69274
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


G1 X128.362 Y125.529 F42000
G1 Z14.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.367724
G1 F4708
M204 S6000
G1 X128.696 Y125.573 E.0089
G1 X127.763 Y118.491 E.18907
G1 X127.441 Y118.533 E.0086
G1 X128.354 Y125.47 E.18518
M204 S10000
G1 X128.049 Y125.842 F42000
; LINE_WIDTH: 0.41999
G1 F4708
M204 S6000
G1 X129.103 Y125.981 E.03266
G1 X128.065 Y118.097 E.24434
G1 X127.047 Y118.231 E.03154
G1 X128.042 Y125.783 E.23404
M204 S10000
G1 X127.713 Y126.178 F42000
G1 F4708
M204 S6000
G1 X129.541 Y126.419 E.05665
G1 X128.39 Y117.674 E.27102
G1 X126.624 Y117.906 E.05471
G1 X127.705 Y126.119 E.25451
M204 S10000
G1 X127.377 Y126.514 F42000
G1 F4708
M204 S6000
G1 X129.979 Y126.857 E.08064
G1 X128.714 Y117.251 E.29771
G1 X126.201 Y117.582 E.07788
G1 X127.369 Y126.455 E.27499
M204 S10000
G1 X127.041 Y126.85 F42000
G1 F4708
M204 S6000
G1 X130.402 Y127.293 E.10417
G1 X130.372 Y126.951 E.01054
G1 X129.039 Y116.828 E.31374
G1 X125.778 Y117.257 E.10106
G1 X127.033 Y126.791 E.29546
M204 S10000
G1 X126.705 Y127.186 F42000
G1 F4708
M204 S6000
G1 X130.811 Y127.727 E.12726
G1 X130.812 Y127.65 E.00236
G2 X130.746 Y126.902 I-16.725 J1.097 E.02308
G1 X129.364 Y116.405 E.32533
G1 X125.355 Y116.933 E.12423
G1 X126.697 Y127.127 E.31594
M204 S10000
G1 X126.369 Y127.522 F42000
G1 F4708
M204 S6000
G1 X131.185 Y128.157 E.14926
G2 X131.12 Y126.853 I-11.794 J-.063 E.04013
G1 X129.688 Y115.981 E.33692
G1 X124.932 Y116.608 E.1474
G1 X126.361 Y127.463 E.33641
; CHANGE_LAYER
; Z_HEIGHT: 14.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X126.1 Y125.48 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 72/73
; update layer progress
M73 L72
M991 S0 P71 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z14.6 I-1.216 J-.043 P1  F42000
G1 X126.016 Y127.871 Z14.6
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3997
M204 S6000
G2 X125.994 Y127.581 I-2.23 J.023 E.00966
G1 X124.52 Y116.385 E.3746
G1 X130.029 Y115.659 E.1843
G1 X131.5 Y126.834 E.37387
G3 X131.554 Y128.601 I-8.998 J1.162 E.05874
G1 X126.076 Y127.879 E.1833
M204 S10000
G1 X126.377 Y128.33 F42000
G1 F3997
M204 S6000
G1 X131.545 Y129.01 E.17289
G1 X130.134 Y139.722 E.35839
G1 X124.578 Y138.99 E.1859
G1 X125.235 Y134 E.16695
G1 X125.988 Y128.278 E.19144
G1 X126.318 Y128.322 E.01102
M204 S250
G1 X126.326 Y128.718 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3997
M204 S5000
G1 X131.105 Y129.347 E.1481
G1 X129.797 Y139.282 E.30789
G1 X125.018 Y138.653 E.14811
G1 X125.624 Y134.051 E.1426
G1 X126.318 Y128.778 E.16344
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.304 Y129.014 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.548 Y136.132 Z14.8 F42000
G1 X124.063 Y139.965 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3997
M204 S6000
G1 X125.59 Y128.371 E.38794
G2 X125.59 Y127.63 I-4.998 J-.371 E.0246
G1 X124.063 Y116.035 E.38794
G1 X130.379 Y115.203 E.21131
G1 X131.904 Y126.785 E.38751
G3 X131.904 Y129.215 I-10.347 J1.215 E.08081
G1 X130.379 Y140.795 E.38744
G1 X124.123 Y139.973 E.20932
M204 S250
G1 X123.694 Y140.218 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3997
M204 S5000
G3 X123.678 Y139.889 I.441 J-.185 E.01031
G1 X125.201 Y128.324 E.35844
G2 X125.201 Y127.676 I-4.407 J-.324 E.01992
G1 X123.678 Y116.11 E.35846
G3 X123.749 Y115.695 I.441 J-.138 E.01344
G3 X123.799 Y115.674 I.071 J.099 E.00167
G1 X130.58 Y114.79 E.21012
G1 X130.625 Y114.809 E.00152
G3 X130.768 Y115.154 I-.395 J.366 E.0117
G1 X132.293 Y126.738 E.35901
G3 X132.293 Y129.262 I-10.778 J1.262 E.07775
G1 X130.767 Y140.85 E.35915
M73 P96 R0
G3 X130.615 Y141.197 I-.494 J-.011 E.01194
G1 X130.561 Y141.214 E.00174
G1 X123.796 Y140.326 E.20965
G1 X123.732 Y140.291 E.00222
G3 X123.72 Y140.271 I.402 J-.259 E.00071
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.67 Y140.14 E-.05328
G1 X123.678 Y139.889 E-.09541
G1 X123.888 Y138.295 E-.6113
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


G1 X124.333 Y139.479 F42000
G1 Z14.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.668967
G1 F3997
M204 S6000
G1 X130.245 Y140.257 E.3042
; WIPE_START
G1 F5750.368
G1 X128.262 Y139.996 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.8 I1.217 J.009 P1  F42000
G1 X128.37 Y125.537 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.35503
G1 F3997
M204 S6000
G1 X128.69 Y125.579 E.00822
G1 X127.771 Y118.601 E.17899
G1 X127.462 Y118.642 E.00794
G1 X128.362 Y125.477 E.17533
M204 S10000
G1 X128.062 Y125.844 F42000
; LINE_WIDTH: 0.41999
G1 F3997
M204 S6000
G1 X129.09 Y125.979 E.03185
G1 X128.068 Y118.215 E.24063
G1 X127.075 Y118.346 E.03076
G1 X128.055 Y125.784 E.23054
M204 S10000
G1 X127.726 Y126.18 F42000
G1 F3997
M204 S6000
G1 X129.528 Y126.417 E.05584
G1 X128.393 Y117.792 E.26732
G1 X126.652 Y118.021 E.05394
G1 X127.719 Y126.12 E.25101
M204 S10000
G1 X127.39 Y126.516 F42000
G1 F3997
M204 S6000
G1 X129.966 Y126.855 E.07983
G1 X128.717 Y117.369 E.294
G1 X126.229 Y117.696 E.07711
G1 X127.382 Y126.456 E.27149
M204 S10000
G1 X127.054 Y126.852 F42000
G1 F3997
M204 S6000
G1 X130.389 Y127.291 E.10336
G1 X130.359 Y126.953 E.01044
G1 X129.042 Y116.946 E.31014
G1 X125.806 Y117.372 E.10028
G1 X127.046 Y126.793 E.29196
M204 S10000
G1 X126.718 Y127.188 F42000
G1 F3997
M204 S6000
G1 X130.799 Y127.725 E.12646
G1 X130.799 Y127.651 E.00229
G2 X130.733 Y126.904 I-16.86 J1.11 E.02305
G1 X129.366 Y116.522 E.32173
G1 X125.383 Y117.047 E.12345
G1 X126.71 Y127.129 E.31244
M204 S10000
G1 X126.382 Y127.524 F42000
G1 F3997
M204 S6000
G1 X131.172 Y128.155 E.14846
G2 X131.107 Y126.854 I-11.789 J-.061 E.04003
G1 X129.691 Y116.099 E.33332
G1 X124.96 Y116.723 E.14662
G1 X126.374 Y127.465 E.33292
; CHANGE_LAYER
; Z_HEIGHT: 14.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F9547.299
G1 X126.113 Y125.482 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 73/73
; update layer progress
M73 L73
M991 S0 P72 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z14.8 I-1.214 J.08 P1  F42000
G1 X126.326 Y128.718 Z14.8
G1 Z14.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4422
M204 S5000
G1 X131.105 Y129.347 E.14811
G1 X129.797 Y139.282 E.30789
G1 X125.018 Y138.653 E.14811
G1 X125.238 Y136.98 E.05183
G1 X126.318 Y128.778 E.25421
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.304 Y129.014 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.452 Y136.094 Z15 F42000
G1 X123.841 Y140.093 Z15
G1 Z14.6
G1 E.8 F1800
G1 F4422
M204 S5000
G1 X123.814 Y140.062 E.00125
G3 X123.8 Y139.9 I.316 J-.108 E.00504
G1 X125.322 Y128.34 E.35827
G2 X125.323 Y127.662 I-3.504 J-.34 E.02085
G1 X123.8 Y116.097 E.35844
G3 X123.846 Y115.907 I.145 J-.066 E.00647
G1 X130.576 Y115.027 E.20857
G1 X130.607 Y115.061 E.0014
G3 X130.65 Y115.195 I-.343 J.185 E.00435
G1 X132.172 Y126.754 E.35822
G3 X132.172 Y129.246 I-10.642 J1.246 E.07676
G1 X130.65 Y140.805 E.35822
G3 X130.568 Y140.977 I-.204 J.008 E.00611
G1 X123.9 Y140.1 E.20664
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.814 Y140.062 E-.0358
G1 X123.8 Y139.9 E-.06174
G1 X124.028 Y138.171 E-.66247
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


G1 X130.529 Y115.864 F42000
G1 Z14.6
G1 E.8 F1800
; FEATURE: Top surface
G1 F4422
M204 S2000
G1 X129.979 Y115.314 E.02389
G1 X129.507 Y115.376
G1 X130.61 Y116.478 E.0479
G1 X130.69 Y117.092
G1 X129.036 Y115.438 E.07191
G1 X128.564 Y115.499
G1 X130.771 Y117.707 E.09591
G1 X130.852 Y118.321
G1 X128.092 Y115.561 E.11992
G1 X127.621 Y115.623
G1 X130.933 Y118.935 E.14393
G1 X131.014 Y119.549
G1 X127.149 Y115.684 E.16794
G1 X126.678 Y115.746
G1 X131.095 Y120.163 E.19194
G1 X131.176 Y120.777
G1 X126.206 Y115.807 E.21595
G1 X125.734 Y115.869
G1 X131.256 Y121.391 E.23996
G1 X131.337 Y122.005
G1 X125.263 Y115.931 E.26397
G1 X124.791 Y115.992
G1 X131.418 Y122.619 E.28798
G1 X131.499 Y123.233
G1 X124.319 Y116.054 E.31198
G1 X124.037 Y116.304
G1 X131.58 Y123.848 E.32779
G1 X131.661 Y124.462
G1 X124.117 Y116.918 E.32779
G1 X124.198 Y117.533
G1 X131.741 Y125.076 E.32779
G1 X131.822 Y125.69
G1 X124.279 Y118.147 E.32779
G1 X124.36 Y118.761
G1 X131.903 Y126.304 E.32779
G1 X131.981 Y126.915
G1 X124.441 Y119.375 E.32764
G1 X124.522 Y119.989
G1 X132.024 Y127.491 E.32599
G1 X132.044 Y128.044
G1 X124.602 Y120.603 E.32336
G1 X124.683 Y121.217
G1 X132.021 Y128.555 E.31888
M73 P97 R0
G1 X131.984 Y129.051
G1 X124.764 Y121.831 E.31375
G1 X124.845 Y122.445
G1 X131.925 Y129.526 E.30768
G1 X131.302 Y129.436
G1 X131.863 Y129.997 E.02438
G1 X131.801 Y130.468
G1 X131.24 Y129.907 E.02438
G1 X131.178 Y130.378
G1 X131.739 Y130.939 E.02437
G1 X131.677 Y131.41
G1 X131.116 Y130.85 E.02437
G1 X131.054 Y131.321
G1 X131.615 Y131.881 E.02436
G1 X131.553 Y132.353
G1 X130.992 Y131.792 E.02436
G1 X130.93 Y132.263
G1 X131.49 Y132.824 E.02435
G1 X131.428 Y133.295
G1 X130.868 Y132.734 E.02435
G1 X130.806 Y133.206
G1 X131.366 Y133.766 E.02434
G1 X131.304 Y134.237
G1 X130.744 Y133.677 E.02434
G1 X130.682 Y134.148
G1 X131.242 Y134.708 E.02433
G1 X131.18 Y135.179
G1 X130.62 Y134.619 E.02433
G1 X130.558 Y135.091
G1 X131.118 Y135.65 E.02433
G1 X131.055 Y136.121
G1 X130.496 Y135.562 E.02432
G1 X130.434 Y136.033
G1 X130.993 Y136.593 E.02432
G1 X130.931 Y137.064
G1 X130.372 Y136.504 E.02431
G1 X130.31 Y136.975
G1 X130.869 Y137.535 E.02431
G1 X130.807 Y138.006
G1 X130.248 Y137.447 E.0243
G1 X130.186 Y137.918
G1 X130.745 Y138.477 E.0243
G1 X130.683 Y138.948
G1 X130.124 Y138.389 E.02429
G1 X130.062 Y138.86
G1 X130.621 Y139.419 E.02429
G1 X130.558 Y139.89
G1 X129.999 Y139.332 E.02429
G1 X129.6 Y139.465
G1 X130.496 Y140.362 E.03896
G1 X130.339 Y140.738
G1 X128.985 Y139.384 E.05884
G1 X128.371 Y139.303
G1 X129.725 Y140.657 E.05884
G1 X129.111 Y140.576
G1 X127.757 Y139.222 E.05884
G1 X127.143 Y139.141
G1 X128.497 Y140.496 E.05884
G1 X127.883 Y140.415
G1 X126.529 Y139.061 E.05884
G1 X125.915 Y138.98
G1 X127.269 Y140.334 E.05885
G1 X126.655 Y140.253
G1 X125.301 Y138.899 E.05885
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.655 Y140.253 E-.72775
G1 X126.739 Y140.264 E-.03225
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.46 Y133.133 Z15 F42000
G1 X130.989 Y129.123 Z15
G1 Z14.6
G1 E.8 F1800
G1 F4422
M204 S2000
G1 X124.926 Y123.059 E.26349
G1 X125.007 Y123.674
G1 X130.375 Y129.042 E.23329
G1 X129.761 Y128.961
G1 X125.088 Y124.288 E.20309
G1 X125.168 Y124.902
G1 X129.147 Y128.881 E.1729
G1 X128.533 Y128.8
G1 X125.249 Y125.516 E.1427
G1 X125.33 Y126.13
G1 X127.919 Y128.719 E.1125
G1 X127.305 Y128.638
G1 X125.411 Y126.744 E.0823
G1 X125.492 Y127.358
G1 X126.691 Y128.557 E.0521
G1 X126.14 Y128.54
G1 X125.549 Y127.949 E.0257
G1 X125.517 Y128.45
G1 X126.078 Y129.011 E.02439
G1 X126.016 Y129.482
G1 X125.455 Y128.921 E.02439
G1 X125.393 Y129.392
G1 X125.954 Y129.954 E.02439
G1 X125.892 Y130.425
G1 X125.331 Y129.864 E.02439
G1 X125.269 Y130.335
G1 X125.83 Y130.896 E.02439
G1 X125.768 Y131.367
G1 X125.207 Y130.806 E.02439
G1 X125.145 Y131.277
G1 X125.706 Y131.839 E.02439
G1 X125.644 Y132.31
G1 X125.083 Y131.749 E.02439
G1 X125.021 Y132.22
G1 X125.582 Y132.781 E.02439
G1 X125.52 Y133.252
G1 X124.959 Y132.691 E.02439
G1 X124.897 Y133.162
G1 X125.458 Y133.723 E.02439
G1 X125.396 Y134.195
G1 X124.835 Y133.633 E.02439
G1 X124.773 Y134.105
G1 X125.334 Y134.666 E.02439
G1 X125.272 Y135.137
G1 X124.711 Y134.576 E.02439
G1 X124.649 Y135.047
G1 X125.21 Y135.608 E.02439
G1 X125.148 Y136.08
G1 X124.586 Y135.518 E.02439
G1 X124.524 Y135.99
G1 X125.086 Y136.551 E.02439
G1 X125.024 Y137.022
G1 X124.462 Y136.461 E.02439
G1 X124.4 Y136.932
G1 X124.962 Y137.493 E.02439
G1 X124.9 Y137.964
G1 X124.338 Y137.403 E.02439
G1 X124.276 Y137.874
G1 X124.838 Y138.436 E.02439
G1 X124.214 Y138.346
G1 X126.041 Y140.172 E.07938
G1 X125.427 Y140.092
G1 X124.152 Y138.817 E.05539
G1 X124.09 Y139.288
G1 X124.813 Y140.011 E.0314
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.09 Y139.288 E-.38835
G1 X124.152 Y138.817 E-.18061
G1 X124.508 Y139.172 E-.19104
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.317 Y138.883 Z15 F42000
G1 Z14.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0943869
G1 F4422
M204 S6000
G1 X125.093 Y138.957 E.00099
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F15000
G1 X125.317 Y138.883 E-.76
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
M73 P98 R0
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

