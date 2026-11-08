; HEADER_BLOCK_START
; BambuStudio 02.08.02.61
; model printing time: 12m 14s; total estimated time: 18m 31s
; total layer number: 68
; total filament length [mm] : 802.92
; total filament volume [cm^3] : 1931.26
; total filament weight [g] : 2.39
; filament_density: 1.24
; filament_diameter: 1.75
; max_z_height: 13.60
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
M73 P0 R18
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
M73 P3 R17
G1 E-0.5 F300

G1 X-28.5 F30000
M73 P4 R17
G1 X-48.2 F3000
M73 P5 R17
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
M73 P6 R17
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
    
M73 P8 R17
    G1 X-48.2 F3000
    M400
    M984 A0.1 E1 S1 F5 H0.4
    M106 P1 S178
    M400 S7
M73 P8 R16
    G1 X-28.5 F18000
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
M73 P32 R12
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
M73 P33 R12
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
    G29 A1 X123.401 Y114.4 I9.19783 J27.1999
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
; layer num/total_layer_count: 1/68
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
; OBJECT_ID: 394
G1 X129.954 Y138.208 F42000
M204 S6000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X125.145 Y137.573 E.18067
G1 X126.36 Y128.315 E.34779
G1 X131.217 Y127.676 E.18245
G1 X131.224 Y128 E.01208
G3 X131.15 Y129.122 I-9.618 J-.072 E.04192
G1 X129.961 Y138.148 E.33909
M204 S6000
G1 X130.347 Y138.721 F42000
G1 F3000
M204 S500
G1 X124.632 Y137.967 E.21471
G1 X125.89 Y128.408 E.35908
G2 X125.921 Y127.912 I-3.777 J-.484 E.01854
G1 X131.643 Y127.159 E.21496
G1 X131.673 Y127.609 E.01682
G3 X131.604 Y129.177 I-9.548 J.366 E.05852
G1 X130.355 Y138.661 E.3563
; WIPE_START
G1 X128.37 Y138.42 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X126.912 Y130.928 Z.6 F42000
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
M73 P34 R12
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
G1 X124.475 Y116.842 E-.15859
G1 X124.418 Y116.411 E-.16516
G1 X125.557 Y116.261 E-.43625
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X127.237 Y123.706 Z.6 F42000
G1 X130.741 Y139.234 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X124.119 Y138.36 E.24876
G1 X125.437 Y128.354 E.37592
G2 X125.437 Y127.65 I-3.659 J-.354 E.02625
G1 X123.915 Y116.085 E.43446
G3 X123.913 Y116.014 I.319 J-.041 E.00267
G1 X130.52 Y115.147 E.24819
G3 X130.536 Y115.214 I-.27 J.101 E.00257
G1 X132.057 Y126.768 E.43407
G3 X132.057 Y129.232 I-9.62 J1.232 E.09203
G1 X130.748 Y139.174 E.37351
; WIPE_START
G1 X128.763 Y138.931 E-.76
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X130.207 Y127.993 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.51406
G1 F3541
M204 S500
G1 X130.809 Y128.595 E.03268
G3 X130.748 Y129.2 I-8.847 J-.591 E.02335
G1 X129.802 Y128.254 E.05136
G1 X129.213 Y128.332 E.0228
G1 X130.67 Y129.789 E.07912
G1 X130.593 Y130.378 E.0228
G1 X128.624 Y128.409 E.10688
G1 X128.035 Y128.487 E.0228
G1 X130.515 Y130.966 E.13464
G1 X130.438 Y131.555 E.0228
G1 X127.447 Y128.564 E.1624
G1 X126.858 Y128.642 E.0228
G1 X130.36 Y132.144 E.19016
G1 X130.283 Y132.733 E.0228
G1 X126.649 Y129.099 E.19727
G1 X126.572 Y129.688 E.02281
G1 X130.205 Y133.321 E.19726
G1 X130.128 Y133.91 E.0228
G1 X126.495 Y130.277 E.19725
G1 X126.417 Y130.866 E.02281
G1 X130.05 Y134.499 E.19724
G1 X129.973 Y135.088 E.0228
G1 X126.34 Y131.455 E.19723
G1 X126.263 Y132.044 E.02281
G1 X129.895 Y135.677 E.19722
G1 X129.818 Y136.265 E.0228
G1 X126.185 Y132.633 E.19721
G1 X126.108 Y133.222 E.02281
G1 X129.74 Y136.854 E.1972
G1 X129.663 Y137.443 E.0228
G1 X126.031 Y133.811 E.19719
G1 X125.953 Y134.4 E.02281
G1 X129.281 Y137.727 E.18065
G1 X128.513 Y137.626 E.02973
G1 X125.876 Y134.989 E.14318
G1 X125.799 Y135.578 E.02281
G1 X127.745 Y137.525 E.1057
G1 X126.978 Y137.423 E.02973
G1 X125.721 Y136.167 E.06822
G1 X125.644 Y136.756 E.02281
G1 X126.449 Y137.561 E.04372
; WIPE_START
G1 F6300
G1 X125.644 Y136.756 E-.43273
G1 X125.721 Y136.167 E-.22573
G1 X125.91 Y136.356 E-.10154
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X125.86 Y128.723 Z.6 F42000
G1 X125.853 Y127.69 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.400278
G1 F3000
M204 S500
G1 X124.456 Y117.075 E.31179
; WIPE_START
G1 X124.717 Y119.058 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X130.27 Y116.31 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.400282
G1 F3000
M204 S500
G1 X131.667 Y126.925 E.31179
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
G1 X131.406 Y124.942 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/68
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S201.45
; open powerlost recovery
M1003 S1
; OBJECT_ID: 394
M204 S10000
G17
G3 Z.6 I-1.213 J-.102 P1  F42000
G1 X130.257 Y138.604 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3824
M204 S6000
G1 X124.749 Y137.879 E.18431
G1 X125.994 Y128.419 E.31651
G2 X126.016 Y128.129 I-2.206 J-.313 E.00966
G1 X131.554 Y127.399 E.18529
G1 X131.564 Y127.553 E.00511
G3 X131.499 Y129.169 I-10.989 J.368 E.05371
G1 X130.265 Y138.545 E.31368
; WIPE_START
G1 F8843.478
G1 X128.28 Y138.305 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P35 R12
G1 X126.936 Y130.792 Z.8 F42000
G1 X126.377 Y127.67 Z.8
G1 Z.4
G1 E.8 F1800
G1 F3824
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
G1 F3824
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
G1 X128.481 Y132.548 Z.8 F42000
G1 X130.608 Y139.061 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3824
M204 S6000
G1 X124.292 Y138.229 E.21132
G1 X125.59 Y128.37 E.32985
G2 X125.59 Y127.631 I-4.815 J-.371 E.02455
G1 X124.063 Y116.035 E.38799
G1 X130.379 Y115.203 E.21131
G1 X131.904 Y126.785 E.38752
G3 X131.904 Y129.217 I-10.645 J1.215 E.08085
G1 X130.616 Y139.001 E.32737
M204 S250
G1 X130.97 Y139.316 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3824
M204 S5000
G3 X130.949 Y139.384 I-.207 J-.026 E.00221
G1 X130.932 Y139.41 E.00095
G1 X130.91 Y139.433 E.00097
G1 X130.884 Y139.453 E.00101
G3 X130.829 Y139.475 I-.088 J-.142 E.00183
G1 X130.788 Y139.478 E.00127
G3 X124.622 Y138.668 I80.524 J-636.468 E.1911
G1 X124.027 Y138.59 E.01844
G3 X123.891 Y138.489 I.028 J-.18 E.00541
G3 X123.877 Y138.38 I.215 J-.083 E.0034
G1 X125.122 Y128.919 E.29322
G2 X125.214 Y127.8 I-4.981 J-.969 E.03455
G1 X125.201 Y127.677 E.00381
G1 X123.756 Y116.705 E.34005
M73 P35 R11
G1 X123.719 Y116.417 E.00892
G1 X123.669 Y116.02 E.01229
G1 F3462.007
G1 X123.665 Y115.945 E.00229
G1 F2880
G1 X123.668 Y115.88 E.00201
G1 F2640
G1 X123.679 Y115.812 E.00212
G1 F2400
G1 X123.695 Y115.767 E.00147
G1 F2160
G1 X123.711 Y115.737 E.00105
G1 F1920
G1 X123.731 Y115.711 E.001
M106 S255
G1 F1800
G1 X123.766 Y115.685 E.00134
M106 S201.45
M106 S255
G1 F1680
G1 X130.574 Y114.787 E.21102
M106 S201.45
M106 S255
G1 F1800
G1 X130.617 Y114.805 E.00142
M106 S201.45
G1 F1920
G1 X130.646 Y114.826 E.00109
G1 F2040
G1 X130.658 Y114.838 E.00052
G1 F2160
G1 X130.673 Y114.858 E.00078
G1 F2400
G1 X130.702 Y114.906 E.0017
G1 F2760
G1 X130.731 Y114.979 E.00242
G1 F3000
G1 X130.753 Y115.064 E.00271
G1 F3824
G1 X130.807 Y115.461 E.01229
G1 X130.846 Y115.749 E.00893
G1 X132.215 Y126.143 E.32214
G3 X132.363 Y127.516 I-15.683 J2.383 E.04245
G1 X132.376 Y128.001 E.0149
G3 X132.344 Y128.778 I-8.932 J.015 E.02392
G1 X132.293 Y129.263 E.01496
G1 X130.978 Y139.256 E.30972
; WIPE_START
G1 F4800
M204 S6000
G1 X130.949 Y139.384 E-.04986
G1 X130.932 Y139.41 E-.01174
G1 X130.91 Y139.433 E-.01201
G1 X130.884 Y139.453 E-.01246
G1 X130.829 Y139.475 E-.02252
G1 X130.788 Y139.478 E-.01576
G1 X129.129 Y139.26 E-.63565
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X128.37 Y130.463 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.355075
G1 F3824
M204 S6000
G1 X127.691 Y135.621 E.13234
G1 X128 Y135.662 E.00794
G1 X128.69 Y130.421 E.13446
G1 X128.429 Y130.455 E.00669
M204 S10000
G1 X128.062 Y130.156 F42000
; LINE_WIDTH: 0.41999
G1 F3824
M204 S6000
G1 X127.304 Y135.918 E.17857
G1 X128.297 Y136.049 E.03077
G1 X129.09 Y130.021 E.18681
G1 X128.122 Y130.148 E.03001
M204 S10000
G1 X127.726 Y129.82 F42000
G1 F3824
M204 S6000
G1 X126.881 Y136.243 E.19904
G1 X128.621 Y136.472 E.05394
G1 X129.528 Y129.583 E.2135
G1 X127.786 Y129.812 E.054
M204 S10000
G1 X127.39 Y129.484 F42000
G1 F3824
M204 S6000
G1 X126.458 Y136.567 E.21952
G1 X128.946 Y136.895 E.07711
G1 X129.966 Y129.145 E.24019
G1 X127.45 Y129.476 E.07799
M204 S10000
G1 X127.054 Y129.148 F42000
G1 F3824
M204 S6000
G1 X126.035 Y136.892 E.24
G1 X129.271 Y137.318 E.10029
G1 X130.36 Y129.044 E.25641
G1 X130.389 Y128.709 E.01035
G1 X127.114 Y129.14 E.10152
M204 S10000
G1 X126.718 Y128.812 F42000
G1 F3824
M204 S6000
G1 X125.612 Y137.216 E.26047
G1 X129.595 Y137.741 E.12346
G1 X130.735 Y129.086 E.26825
G1 X130.799 Y128.275 E.02499
G1 X126.778 Y128.804 E.12462
M204 S10000
G1 X126.382 Y128.476 F42000
G1 F3824
M204 S6000
G1 X125.189 Y137.541 E.28095
G1 X129.92 Y138.164 E.14663
G1 X131.11 Y129.127 E.28009
G1 X131.176 Y128.37 E.02335
G1 X131.174 Y127.845 E.01612
G1 X126.442 Y128.468 E.14666
; WIPE_START
G1 F9547.299
G1 X128.424 Y128.207 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.902 Y121.003 Z.8 F42000
G1 X124.333 Y116.521 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.670189
G1 F3824
M204 S6000
G1 X130.245 Y115.742 E.3048
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5739.165
G1 X128.262 Y116.003 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/68
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z.8 I-1.212 J.108 P1  F42000
G1 X130.268 Y138.618 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3790
M204 S6000
G1 X124.734 Y137.889 E.18516
G1 X125.981 Y128.417 E.31693
G2 X126.003 Y128.13 I-2.166 J-.309 E.00955
G1 X131.567 Y127.398 E.18615
G1 X131.581 Y127.613 E.00717
G3 X131.513 Y129.168 I-11.821 J.257 E.05166
G1 X130.276 Y138.559 E.3142
; WIPE_START
G1 F8843.478
G1 X128.291 Y138.319 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.941 Y130.807 Z1 F42000
G1 X126.377 Y127.67 Z1
G1 Z.6
G1 E.8 F1800
G1 F3790
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
G1 F3790
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
G1 F3790
M204 S6000
G1 X124.536 Y116.605 E.01264
M73 P36 R11
G1 X124.492 Y116.27 E.01119
G1 X130.026 Y115.542 E.18516
G1 X130.07 Y115.876 E.0112
G1 X124.973 Y116.547 E.17053
; WIPE_START
G1 F8843.478
G1 X124.536 Y116.605 E-.16756
G1 X124.492 Y116.27 E-.12815
G1 X125.704 Y116.111 E-.46429
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.301 Y123.574 Z1 F42000
G1 X130.619 Y139.075 Z1
G1 Z.6
G1 E.8 F1800
G1 F3790
M204 S6000
G1 X124.278 Y138.24 E.21216
G1 X125.577 Y128.369 E.33027
G2 X125.577 Y127.631 I-4.973 J-.369 E.0245
G1 X124.035 Y115.92 E.39182
G1 X130.377 Y115.085 E.21216
G1 X131.917 Y126.783 E.3914
G3 X131.917 Y129.217 I-10.372 J1.217 E.08092
G1 X130.627 Y139.016 E.32785
M204 S250
G1 X130.982 Y139.319 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3790
M204 S5000
G3 X130.76 Y139.489 I-.193 J-.022 E.00959
G1 X123.975 Y138.588 E.21034
G3 X123.863 Y138.384 I.08 J-.176 E.00765
G1 X125.188 Y128.322 E.31185
G2 X125.188 Y127.677 I-4.384 J-.322 E.01983
G1 X123.631 Y115.852 E.36648
G1 X123.631 Y115.852 E.00001
G1 X123.626 Y115.788 E.00196
G1 X123.628 Y115.744 E.00138
G1 X123.639 Y115.688 E.00174
G1 X123.65 Y115.661 E.00088
G1 X123.674 Y115.622 E.00141
G3 X123.722 Y115.579 I.142 J.112 E.002
G3 X123.781 Y115.558 I.085 J.144 E.00193
G1 X129.923 Y114.749 E.19035
G3 X130.549 Y114.669 I.817 J3.907 E.01941
G1 X130.585 Y114.674 E.00113
G3 X130.648 Y114.703 I-.043 J.173 E.00214
G1 X130.672 Y114.725 E.001
G1 X130.702 Y114.763 E.00148
G1 X130.717 Y114.792 E.00102
G1 X130.738 Y114.854 E.00201
G1 X130.75 Y114.915 E.00189
G1 X130.75 Y114.917 E.00005
G1 X132.306 Y126.736 E.36632
G3 X132.306 Y129.264 I-10.807 J1.264 E.07785
G1 X130.99 Y139.259 E.30978
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.96 Y139.391 E-.05117
G1 X130.922 Y139.44 E-.02371
G1 X130.833 Y139.487 E-.03823
G1 X130.76 Y139.489 E-.0275
G1 X129.145 Y139.275 E-.61939
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
G1 X0 Y127.189 F18000 ; move to safe pos
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
; LINE_WIDTH: 0.36784
G1 F3790
M204 S6000
G1 X127.683 Y135.627 E.13769
G1 X128.006 Y135.669 E.0086
G1 X128.696 Y130.427 E.14
G1 X128.422 Y130.463 E.00732
M204 S10000
G1 X128.049 Y130.158 F42000
; LINE_WIDTH: 0.41999
G1 F3790
M204 S6000
G1 X127.29 Y135.929 E.17885
G1 X128.308 Y136.063 E.03155
G1 X129.103 Y130.019 E.18731
G1 X128.109 Y130.15 E.03082
M204 S10000
G1 X127.713 Y129.822 F42000
G1 F3790
M204 S6000
G1 X126.867 Y136.254 E.19933
G1 X128.632 Y136.486 E.05473
G1 X129.541 Y129.581 E.214
G1 X127.773 Y129.814 E.05481
M204 S10000
G1 X127.377 Y129.486 F42000
G1 F3790
M204 S6000
G1 X126.443 Y136.578 E.2198
G1 X128.957 Y136.909 E.0779
G1 X129.979 Y129.143 E.24068
G1 X127.437 Y129.478 E.0788
M204 S10000
G1 X127.041 Y129.15 F42000
G1 F3790
M204 S6000
G1 X126.02 Y136.903 E.24028
G1 X129.282 Y137.332 E.10107
G1 X130.373 Y129.043 E.25689
G1 X130.402 Y128.707 E.01036
G1 X127.101 Y129.142 E.10233
M204 S10000
G1 X126.705 Y128.814 F42000
G1 F3790
M204 S6000
G1 X125.597 Y137.227 E.26076
G1 X129.606 Y137.755 E.12424
G1 X130.748 Y129.084 E.26873
G1 X130.812 Y128.273 E.02501
G1 X126.765 Y128.806 E.12543
M204 S10000
G1 X126.369 Y128.478 F42000
G1 F3790
M204 S6000
G1 X125.174 Y137.552 E.28123
G1 X129.931 Y138.178 E.14741
G1 X131.123 Y129.125 E.28057
G1 X131.189 Y128.372 E.02323
G1 X131.189 Y127.843 E.01626
G1 X126.428 Y128.47 E.14754
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X128.411 Y128.209 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/68
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z1 I-1.198 J.214 P1  F42000
G1 X130.268 Y138.618 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3590
M204 S6000
G1 X124.734 Y137.889 E.18515
G1 X125.986 Y128.385 E.31801
G1 X131.582 Y127.648 E.18724
G1 X131.59 Y128 E.01168
G3 X131.513 Y129.168 I-10.036 J-.075 E.03886
G1 X130.276 Y138.559 E.3142
M204 S10000
G1 X130.619 Y139.075 F42000
G1 F3590
M204 S6000
G1 X124.278 Y138.24 E.21216
G1 X125.577 Y128.369 E.33027
G2 X125.601 Y128.025 I-2.616 J-.349 E.01144
G1 X131.961 Y127.187 E.21281
G1 X131.988 Y127.596 E.01357
G3 X131.917 Y129.217 I-12.353 J.27 E.05388
G1 X130.627 Y139.016 E.32784
; WIPE_START
G1 F8843.478
G1 X128.641 Y138.773 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.961 Y131.328 Z1.2 F42000
G1 X126.111 Y127.562 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3590
M204 S5000
G1 X124.738 Y117.132 E.32325
G1 X129.624 Y116.489 E.15144
G1 X130.012 Y116.438 E.01203
G1 X131.385 Y126.868 E.32325
G1 X126.17 Y127.554 E.16163
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.898 Y125.573 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.86 Y118.011 Z1.2 F42000
G1 X124.686 Y116.743 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3590
M204 S6000
G1 X124.153 Y116.814 E.01785
G1 X124.029 Y115.868 E.03162
G1 X130.37 Y115.033 E.21216
G1 X130.494 Y115.979 E.03164
M73 P37 R11
G1 X124.746 Y116.736 E.19233
; WIPE_START
G1 F8843.478
G1 X124.153 Y116.814 E-.22723
G1 X124.029 Y115.868 E-.36228
G1 X124.473 Y115.81 E-.17049
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.51 Y123.166 Z1.2 F42000
G1 X130.982 Y139.319 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3590
M204 S5000
G3 X130.76 Y139.489 I-.193 J-.022 E.00958
G1 X123.974 Y138.588 E.21036
G3 X123.863 Y138.384 I.08 J-.176 E.00764
G1 X125.188 Y128.322 E.31184
G2 X125.188 Y127.677 I-4.356 J-.322 E.01983
G1 X123.616 Y115.734 E.37015
G3 X123.635 Y115.607 I.285 J-.021 E.004
G1 X123.659 Y115.572 E.00129
G1 X123.684 Y115.546 E.0011
G3 X123.738 Y115.516 I.115 J.141 E.00192
G1 X123.772 Y115.507 E.00107
G1 X130.51 Y114.619 E.20883
G3 X130.582 Y114.621 I.03 J.212 E.00223
G1 X130.618 Y114.633 E.00117
G1 X130.653 Y114.653 E.00122
G1 X130.681 Y114.678 E.00118
G1 X130.69 Y114.688 E.00038
G3 X130.734 Y114.795 I-.202 J.146 E.00361
G1 X132.306 Y126.736 E.37007
G3 X132.306 Y129.264 I-10.794 J1.264 E.07786
G1 X130.99 Y139.259 E.30978
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.955 Y139.399 E-.05448
G1 X130.915 Y139.446 E-.02366
G1 X130.862 Y139.478 E-.0236
G1 X130.76 Y139.489 E-.03875
G1 X129.144 Y139.275 E-.61951
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X126.632 Y130.832 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F3590
M204 S6000
G3 X126.064 Y130.793 I-.177 J-1.579 E.01757
G1 X125.174 Y137.552 E.20946
G1 X129.931 Y138.178 E.14741
G1 X130.973 Y130.261 E.24539
G1 X126.691 Y130.824 E.13271
M204 S10000
G1 X126.681 Y131.206 F42000
G1 F3590
M204 S6000
G1 X126.389 Y131.217 E.00898
G1 X125.597 Y137.227 E.18628
G1 X129.606 Y137.755 E.12424
G1 X130.535 Y130.699 E.2187
G1 X126.74 Y131.198 E.11761
M204 S10000
G1 X128.376 Y132.858 F42000
; LINE_WIDTH: 0.36783
G1 F3590
M204 S6000
G1 X128.042 Y132.902 E.00891
G1 X127.683 Y135.627 E.07276
G1 X128.006 Y135.669 E.0086
G1 X128.368 Y132.918 E.07348
M204 S10000
G1 X128.783 Y132.45 F42000
; LINE_WIDTH: 0.41999
G1 F3590
M204 S6000
G1 X127.729 Y132.589 E.03267
G1 X127.29 Y135.929 E.1035
G1 X128.308 Y136.063 E.03155
G1 X128.775 Y132.51 E.11012
M204 S10000
G1 X129.221 Y132.012 F42000
G1 F3590
M204 S6000
G1 X127.393 Y132.253 E.05666
G1 X126.867 Y136.254 E.12398
G1 X128.632 Y136.486 E.05472
G1 X129.213 Y132.072 E.1368
M204 S10000
G1 X129.659 Y131.575 F42000
G1 F3590
M204 S6000
G1 X127.057 Y131.917 E.08065
G1 X126.443 Y136.578 E.14445
G1 X128.957 Y136.909 E.0779
G1 X129.651 Y131.634 E.16349
M204 S10000
G1 X130.097 Y131.137 F42000
G1 F3590
M204 S6000
G1 X126.72 Y131.59 E.10471
G1 X126.02 Y136.903 E.16465
G1 X129.282 Y137.332 E.10107
G1 X130.089 Y131.196 E.19017
M204 S10000
G1 X130.406 Y130.126 F42000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F3590
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
G1 X126.118 Y129.082 E-.30338
G1 X126.037 Y129.696 E-.23538
G1 X126.449 Y129.284 E-.22124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.675 Y127.817 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.580838
G1 F3590
M204 S6000
G1 X124.251 Y116.999 E.47831
M204 S10000
G1 X124.293 Y116.315 F42000
; LINE_WIDTH: 0.589451
G1 F3590
M204 S6000
G1 X130.23 Y115.533 E.26671
M204 S10000
G1 X130.448 Y116.183 F42000
; LINE_WIDTH: 0.580848
G1 F3590
M204 S6000
G1 X131.872 Y127.001 E.47831
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6692.35
G1 X131.611 Y125.018 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/68
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z1.2 I-.528 J-1.097 P1  F42000
G1 X126.029 Y127.704 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3464
M204 S5000
G1 X131.196 Y127.024 E.16015
G1 X131.501 Y126.984 E.00947
G1 X131.661 Y128.193 E.03749
G1 X126.188 Y128.914 E.16961
G1 X126.036 Y127.764 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.016 Y127.48 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.529 Y134.961 Z1.4 F42000
G1 X130.268 Y138.618 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3464
M204 S6000
G1 X124.734 Y137.889 E.18516
G1 X125.803 Y129.77 E.27165
G1 X131.533 Y129.016 E.19169
G1 X130.276 Y138.559 E.31928
M204 S10000
G1 X130.619 Y139.075 F42000
G1 F3464
M204 S6000
G1 X124.278 Y138.24 E.21216
G1 X125.542 Y128.638 E.32127
G1 X125.756 Y128.638 E.0071
G1 X125.85 Y129.354 E.02395
G1 X131.979 Y128.547 E.20504
G1 X131.961 Y128.808 E.0087
G1 X130.627 Y139.016 E.34148
; WIPE_START
G1 F8843.478
G1 X128.641 Y138.773 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.286 Y131.262 Z1.4 F42000
G1 X124.738 Y117.132 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3464
M204 S5000
G1 X128.904 Y116.584 E.12913
G1 X130.012 Y116.438 E.03433
G1 X131.385 Y126.868 E.32325
G1 X126.111 Y127.562 E.16347
G1 X124.745 Y117.192 E.32141
M204 S250
G1 X124.622 Y117.016 F42000
G1 F3464
M204 S5000
G1 X124.462 Y115.807 E.03749
G1 X129.63 Y115.127 E.16015
G1 X129.935 Y115.086 E.00947
G1 X130.094 Y116.296 E.03749
G1 X124.681 Y117.009 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.462 Y115.807 E-.46416
G1 X125.234 Y115.705 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.04 Y123.121 Z1.4 F42000
G1 X130.982 Y139.317 Z1.4
G1 Z1
G1 E.8 F1800
G1 F3464
M204 S5000
G3 X130.761 Y139.489 I-.192 J-.018 E.00968
G1 X123.974 Y138.587 E.21038
G3 X123.863 Y138.384 I.081 J-.176 E.00763
G1 X125.188 Y128.32 E.3119
G2 X125.188 Y127.678 I-3.361 J-.32 E.01975
G1 X123.612 Y115.694 E.37141
G3 X123.772 Y115.5 I.195 J-.002 E.00839
G1 X130.511 Y114.613 E.20884
G3 X130.585 Y114.616 I.029 J.218 E.00231
G1 X130.61 Y114.623 E.00078
G3 X130.733 Y114.785 I-.085 J.192 E.00654
G1 X132.306 Y126.736 E.37038
M73 P38 R11
G3 X132.306 Y129.264 I-10.873 J1.264 E.07786
G1 X130.99 Y139.257 E.30971
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.962 Y139.387 E-.05035
G1 X130.903 Y139.456 E-.0347
G1 X130.833 Y139.487 E-.02906
G1 X130.761 Y139.489 E-.02743
G1 X129.147 Y139.275 E-.61846
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
G1 X0 Y127.189 F18000 ; move to safe pos
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
G1 F3464
M204 S6000
G1 X127.497 Y131.464 E.05666
G1 X126.867 Y136.254 E.14843
G1 X128.632 Y136.486 E.05473
G1 X129.317 Y131.283 E.16126
M204 S10000
G1 X128.887 Y131.661 F42000
G1 F3464
M204 S6000
G1 X127.833 Y131.8 E.03267
G1 X127.29 Y135.929 E.12796
G1 X128.308 Y136.063 E.03155
G1 X128.879 Y131.721 E.13457
M204 S10000
G1 X128.48 Y132.069 F42000
; LINE_WIDTH: 0.367835
G1 F3464
M204 S6000
G1 X128.146 Y132.113 E.00891
G1 X127.683 Y135.627 E.09383
G1 X128.006 Y135.669 E.0086
G1 X128.472 Y132.129 E.09455
M204 S10000
G1 X127.161 Y131.128 F42000
; LINE_WIDTH: 0.41999
G1 F3464
M204 S6000
G1 X126.443 Y136.578 E.16891
G1 X128.957 Y136.909 E.0779
G1 X129.763 Y130.785 E.18979
G1 X127.221 Y131.12 E.0788
M204 S10000
G1 X126.825 Y130.792 F42000
G1 F3464
M204 S6000
G1 X126.02 Y136.903 E.18938
G1 X129.282 Y137.332 E.10107
G1 X130.201 Y130.347 E.21647
G1 X126.884 Y130.784 E.10279
M204 S10000
G1 X126.489 Y130.456 F42000
G1 F3464
M204 S6000
G1 X125.597 Y137.227 E.20986
G1 X129.606 Y137.755 E.12424
G1 X130.639 Y129.909 E.24316
G1 X126.548 Y130.448 E.12678
M204 S10000
G1 X126.153 Y130.12 F42000
G1 F3464
M204 S6000
G1 X125.174 Y137.552 E.23033
G1 X129.931 Y138.178 E.14741
G1 X131.077 Y129.471 E.26984
G1 X126.212 Y130.112 E.15077
; WIPE_START
G1 F9547.299
G1 X128.195 Y129.851 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.651 Y128.442 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.533874
G1 F3464
M204 S6000
G1 X125.644 Y128.147 E.01179
; LINE_WIDTH: 0.49747
G1 X125.637 Y128.001 E.0054
G3 X125.603 Y127.457 I3.691 J-.503 E.02022
; LINE_WIDTH: 0.555805
G1 X125.614 Y127.35 E.0045
; LINE_WIDTH: 0.556661
G1 X125.655 Y127.37 E.00192
; LINE_WIDTH: 0.508392
G1 X125.697 Y127.389 E.00174
; LINE_WIDTH: 0.460122
G1 X125.738 Y127.409 E.00156
; LINE_WIDTH: 0.411853
G1 X125.779 Y127.428 E.00138
; LINE_WIDTH: 0.363584
G1 X125.821 Y127.448 E.0012
; LINE_WIDTH: 0.315315
G1 X125.862 Y127.468 E.00102
; LINE_WIDTH: 0.267045
G1 X125.903 Y127.487 E.00084
M204 S10000
G1 X125.614 Y127.35 F42000
; LINE_WIDTH: 0.58002
G1 F3464
M204 S6000
G1 X124.313 Y117.465 E.43635
; LINE_WIDTH: 0.562572
G1 X124.288 Y117.398 E.00303
; LINE_WIDTH: 0.529228
G1 X124.262 Y117.332 E.00284
; LINE_WIDTH: 0.479833
G1 X124.236 Y117.265 E.00255
G1 X124.026 Y115.665 E.05746
M204 S10000
G1 X124.556 Y117.258 F42000
; LINE_WIDTH: 0.266916
G1 F3464
M204 S6000
G1 X124.522 Y117.288 E.00083
; LINE_WIDTH: 0.314965
G1 X124.487 Y117.317 E.00101
; LINE_WIDTH: 0.363012
G1 X124.452 Y117.347 E.00119
; LINE_WIDTH: 0.411061
G1 X124.418 Y117.377 E.00137
; LINE_WIDTH: 0.459109
G1 X124.383 Y117.406 E.00155
; LINE_WIDTH: 0.507157
G1 X124.348 Y117.436 E.00173
; LINE_WIDTH: 0.555205
G1 X124.313 Y117.465 E.00191
; WIPE_START
G1 F7027.35
G1 X124.348 Y117.436 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.321 Y114.835 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.480839
G1 F3464
M204 S6000
G1 X130.531 Y116.436 E.05761
; LINE_WIDTH: 0.505844
G1 X130.52 Y116.543 E.00406
; LINE_WIDTH: 0.555841
G1 X130.509 Y116.65 E.0045
; LINE_WIDTH: 0.580839
G1 X131.81 Y126.534 E.43699
M204 S10000
G1 X131.566 Y126.742 F42000
; LINE_WIDTH: 0.267053
G1 F3464
M204 S6000
G1 X131.601 Y126.712 E.00084
; LINE_WIDTH: 0.31533
G1 X131.636 Y126.682 E.00102
; LINE_WIDTH: 0.363607
G1 X131.671 Y126.653 E.0012
; LINE_WIDTH: 0.411884
G1 X131.706 Y126.623 E.00138
; LINE_WIDTH: 0.460161
G1 X131.741 Y126.593 E.00156
; LINE_WIDTH: 0.508438
G1 X131.775 Y126.564 E.00174
; LINE_WIDTH: 0.556714
G1 X131.81 Y126.534 E.00192
; LINE_WIDTH: 0.564183
G1 X131.836 Y126.601 E.00305
; LINE_WIDTH: 0.530848
G1 X131.862 Y126.668 E.00285
; LINE_WIDTH: 0.497514
G1 X131.887 Y126.735 E.00266
; LINE_WIDTH: 0.468353
G3 X131.983 Y127.596 I-25.793 J3.296 E.03004
; LINE_WIDTH: 0.423344
G1 X132.014 Y127.999 E.01254
; LINE_WIDTH: 0.38765
G1 X132.032 Y128.342 E.00964
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10442.959
G1 X132.014 Y127.999 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/68
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z1.4 I.06 J-1.215 P1  F42000
G1 X126.029 Y127.704 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2551
M204 S5000
G1 X131.001 Y127.049 E.15412
G1 X131.501 Y126.984 E.01549
G1 X131.661 Y128.193 E.03749
G1 X126.188 Y128.914 E.16961
G1 X126.036 Y127.764 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.016 Y127.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.529 Y134.96 Z1.6 F42000
G1 X130.268 Y138.618 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2551
M204 S6000
G1 X124.734 Y137.889 E.18516
G1 X125.803 Y129.77 E.27165
G1 X131.533 Y129.016 E.19169
G1 X130.276 Y138.559 E.31928
M204 S10000
G1 X130.619 Y139.075 F42000
G1 F2551
M204 S6000
G1 X124.278 Y138.24 E.21216
G1 X125.542 Y128.638 E.32127
G1 X125.756 Y128.638 E.0071
G1 X125.85 Y129.354 E.02395
G1 X131.979 Y128.547 E.20504
G1 X131.961 Y128.808 E.00869
G1 X130.627 Y139.016 E.34148
; WIPE_START
G1 F8843.478
G1 X128.641 Y138.773 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.286 Y131.262 Z1.6 F42000
G1 X124.738 Y117.132 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2551
M204 S5000
G1 X128.185 Y116.678 E.10683
G1 X130.012 Y116.438 E.05664
G1 X131.385 Y126.868 E.32325
G1 X126.111 Y127.562 E.16347
G1 X124.745 Y117.192 E.32141
M204 S250
G1 X124.622 Y117.016 F42000
G1 F2551
M204 S5000
G1 X124.462 Y115.807 E.03749
G1 X129.435 Y115.152 E.15412
G1 X129.935 Y115.086 E.01549
G1 X130.094 Y116.296 E.03749
G1 X124.681 Y117.009 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.462 Y115.807 E-.46416
G1 X125.234 Y115.705 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.04 Y123.121 Z1.6 F42000
G1 X130.982 Y139.316 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F2551
M204 S5000
G3 X130.76 Y139.489 I-.194 J-.02 E.00967
G1 X123.973 Y138.587 E.21039
G3 X123.863 Y138.384 I.082 J-.175 E.00758
G1 X125.188 Y128.32 E.31192
G2 X125.188 Y127.678 I-3.374 J-.32 E.01976
G1 X123.612 Y115.694 E.37141
G3 X123.77 Y115.5 I.203 J.005 E.00826
G1 X130.51 Y114.613 E.20889
G3 X130.585 Y114.615 I.029 J.217 E.0023
G3 X130.733 Y114.785 I-.045 J.188 E.00739
G1 X132.306 Y126.736 E.37038
G3 X132.306 Y129.264 I-10.904 J1.264 E.07785
G1 X130.99 Y139.257 E.30971
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.956 Y139.398 E-.05508
G1 X130.916 Y139.446 E-.02372
G1 X130.83 Y139.487 E-.0361
G1 X130.76 Y139.489 E-.02666
G1 X129.147 Y139.275 E-.61844
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


M73 P39 R11
G1 X125.677 Y137.662 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2551
M204 S6000
G1 X125.125 Y137.59 E.01846
G1 X125.265 Y136.527 E.03555
G1 X125.379 Y136.513 E.00382
G1 X126.035 Y136.719 E.02278
G1 X126.69 Y137.284 E.02868
G2 X128.655 Y137.625 I1.209 J-1.133 E.07101
G3 X129.966 Y136.591 I6.437 J6.811 E.05544
G1 X130.187 Y136.565 E.00741
G1 X130.536 Y133.92 E.08851
G1 X129.966 Y134.099 E.01982
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
G1 X125.651 Y128.442 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.534024
G1 F2551
M204 S6000
G1 X125.644 Y128.149 E.01173
; LINE_WIDTH: 0.497555
G1 X125.637 Y128.002 E.00545
G3 X125.603 Y127.457 I3.69 J-.503 E.02023
; LINE_WIDTH: 0.555819
G1 X125.614 Y127.35 E.0045
; LINE_WIDTH: 0.556679
G1 X125.655 Y127.37 E.00192
; LINE_WIDTH: 0.508407
G1 X125.697 Y127.389 E.00174
; LINE_WIDTH: 0.460135
G1 X125.738 Y127.409 E.00156
; LINE_WIDTH: 0.411863
G1 X125.779 Y127.428 E.00138
; LINE_WIDTH: 0.363591
G1 X125.821 Y127.448 E.0012
; LINE_WIDTH: 0.315319
G1 X125.862 Y127.468 E.00102
; LINE_WIDTH: 0.267047
G1 X125.903 Y127.487 E.00084
M204 S10000
G1 X125.614 Y127.35 F42000
; LINE_WIDTH: 0.580003
G1 F2551
M204 S6000
G1 X124.313 Y117.465 E.43633
; LINE_WIDTH: 0.562529
G1 X124.288 Y117.398 E.00303
; LINE_WIDTH: 0.529194
G1 X124.262 Y117.332 E.00284
; LINE_WIDTH: 0.479788
G1 X124.236 Y117.265 E.00255
G1 X124.026 Y115.665 E.05746
M204 S10000
G1 X124.556 Y117.258 F42000
; LINE_WIDTH: 0.266894
G1 F2551
M204 S6000
G1 X124.522 Y117.288 E.00083
; LINE_WIDTH: 0.314943
G1 X124.487 Y117.317 E.00101
; LINE_WIDTH: 0.362992
G1 X124.452 Y117.347 E.00119
; LINE_WIDTH: 0.411041
G1 X124.418 Y117.377 E.00137
; LINE_WIDTH: 0.45909
G1 X124.383 Y117.406 E.00155
; LINE_WIDTH: 0.507138
G1 X124.348 Y117.436 E.00173
; LINE_WIDTH: 0.555187
G1 X124.313 Y117.465 E.0019
; WIPE_START
G1 F7027.59
G1 X124.348 Y117.436 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.321 Y114.835 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.481537
G1 F2551
M204 S6000
G1 X130.531 Y116.436 E.0577
G1 X130.524 Y116.507 E.00256
; LINE_WIDTH: 0.530823
G1 X130.516 Y116.579 E.00285
; LINE_WIDTH: 0.564158
G1 X130.509 Y116.65 E.00305
; LINE_WIDTH: 0.580827
G1 X131.81 Y126.534 E.43699
M204 S10000
G1 X131.566 Y126.742 F42000
; LINE_WIDTH: 0.267031
G1 F2551
M204 S6000
G1 X131.601 Y126.712 E.00084
; LINE_WIDTH: 0.315309
G1 X131.636 Y126.682 E.00102
; LINE_WIDTH: 0.363586
G1 X131.671 Y126.653 E.0012
; LINE_WIDTH: 0.411864
G1 X131.706 Y126.623 E.00138
; LINE_WIDTH: 0.460142
G1 X131.741 Y126.593 E.00156
; LINE_WIDTH: 0.508419
G1 X131.775 Y126.564 E.00174
; LINE_WIDTH: 0.556697
G1 X131.81 Y126.534 E.00192
; LINE_WIDTH: 0.555845
G1 X131.849 Y126.635 E.0045
; LINE_WIDTH: 0.505846
G1 X131.887 Y126.735 E.00406
; LINE_WIDTH: 0.468967
G3 X131.98 Y127.573 I-25.623 J3.275 E.02928
; LINE_WIDTH: 0.424028
G1 X132.014 Y128.001 E.01331
; LINE_WIDTH: 0.387755
G1 X132.032 Y128.342 E.0096
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10439.796
G1 X132.014 Y128.001 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/68
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z1.6 I.06 J-1.215 P1  F42000
G1 X126.029 Y127.704 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2719
M204 S5000
G1 X130.807 Y127.075 E.14809
G1 X131.501 Y126.984 E.02152
G1 X131.661 Y128.193 E.03749
G1 X126.188 Y128.914 E.16961
G1 X126.036 Y127.764 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.016 Y127.478 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.528 Y134.959 Z1.8 F42000
G1 X130.268 Y138.618 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2719
M204 S6000
G1 X124.734 Y137.89 E.18516
G1 X125.803 Y129.77 E.27165
G1 X131.533 Y129.016 E.19169
G1 X130.276 Y138.559 E.31928
M204 S10000
G1 X130.619 Y139.075 F42000
G1 F2719
M204 S6000
G1 X124.278 Y138.24 E.21216
G1 X125.542 Y128.638 E.32127
G1 X125.756 Y128.638 E.0071
G1 X125.85 Y129.354 E.02395
G1 X131.979 Y128.547 E.20504
G1 X131.961 Y128.808 E.00869
G1 X130.627 Y139.016 E.34148
; WIPE_START
G1 F8843.478
G1 X128.641 Y138.773 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.286 Y131.262 Z1.8 F42000
G1 X124.738 Y117.132 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2719
M204 S5000
G1 X127.465 Y116.773 E.08452
G1 X130.012 Y116.438 E.07895
G1 X131.385 Y126.868 E.32325
G1 X126.111 Y127.562 E.16347
G1 X124.745 Y117.192 E.32141
M204 S250
G1 X124.622 Y117.016 F42000
G1 F2719
M204 S5000
G1 X124.462 Y115.807 E.03749
G1 X129.241 Y115.178 E.14809
G1 X129.935 Y115.086 E.02152
G1 X130.094 Y116.296 E.03749
G1 X124.681 Y117.009 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.462 Y115.807 E-.46416
G1 X125.234 Y115.705 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.04 Y123.121 Z1.8 F42000
G1 X130.982 Y139.317 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F2719
M204 S5000
G3 X130.76 Y139.489 I-.193 J-.019 E.00968
G1 X123.972 Y138.587 E.21041
G3 X123.863 Y138.385 I.082 J-.175 E.00756
G1 X125.188 Y128.32 E.31193
G2 X125.188 Y127.678 I-3.322 J-.319 E.01976
G1 X123.612 Y115.694 E.37141
G3 X123.772 Y115.5 I.198 J.001 E.00835
G1 X130.51 Y114.613 E.20884
G3 X130.583 Y114.615 I.029 J.211 E.00225
G3 X130.732 Y114.783 I-.046 J.191 E.00734
G1 X132.306 Y126.736 E.37045
G3 X132.306 Y129.264 I-10.793 J1.264 E.07785
G1 X130.99 Y139.257 E.30971
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.961 Y139.388 E-.05112
G1 X130.896 Y139.46 E-.03694
G1 X130.833 Y139.487 E-.02605
G1 X130.76 Y139.489 E-.02752
G1 X129.147 Y139.275 E-.61836
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X129.978 Y135.263 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2719
M204 S6000
G1 X129.766 Y136.877 E.05401
G3 X128.732 Y137.684 I-6.096 J-6.748 E.04356
G1 X127.157 Y137.477 E.05269
G2 X126.035 Y136.605 I-6.591 J7.322 E.04718
G1 X125.642 Y136.551 E.01313
G1 X125.969 Y134.068 E.08305
G1 X126.69 Y134.642 E.03055
G2 X128.655 Y135.015 I1.234 J-1.136 E.0711
G3 X129.966 Y133.984 I7.786 J8.544 E.05536
G1 X130.15 Y133.959 E.00618
G1 X130.499 Y131.309 E.08864
G1 X129.966 Y131.467 E.01845
G1 X129.31 Y132.021 E.02846
G3 X127.345 Y132.395 I-1.234 J-1.136 E.0711
G2 X126.3 Y131.557 I-6.318 J6.807 E.04448
G1 X126.45 Y130.417 E.03813
G1 X126.925 Y130.354 E.01588
M204 S10000
G1 X126.143 Y130.11 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.383092
G1 F2719
M204 S6000
G1 X126.248 Y130.078 E.00304
G1 X130.906 Y129.464 E.13023
; LINE_WIDTH: 0.396875
G1 X130.986 Y129.473 E.00233
; LINE_WIDTH: 0.416067
G1 X131.066 Y129.482 E.00246
G1 X131.087 Y129.615 E.00409
; LINE_WIDTH: 0.383363
G1 X129.977 Y138.054 E.2361
G1 X129.933 Y138.181 E.00374
G1 X129.798 Y138.191 E.00374
G1 X125.299 Y137.598 E.12589
M73 P40 R11
G1 X125.172 Y137.554 E.00374
G1 X125.162 Y137.419 E.00374
G1 X126.125 Y130.167 E.20295
; WIPE_START
G1 F10574.454
G1 X125.862 Y132.15 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.614 Y127.35 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.556661
G1 F2719
M204 S6000
G1 X125.655 Y127.37 E.00192
; LINE_WIDTH: 0.508392
G1 X125.697 Y127.389 E.00174
; LINE_WIDTH: 0.460123
G1 X125.738 Y127.409 E.00156
; LINE_WIDTH: 0.411853
G1 X125.779 Y127.428 E.00138
; LINE_WIDTH: 0.363584
G1 X125.821 Y127.448 E.0012
; LINE_WIDTH: 0.315315
G1 X125.862 Y127.468 E.00102
; LINE_WIDTH: 0.267045
G1 X125.903 Y127.487 E.00084
M204 S10000
G1 X125.651 Y128.442 F42000
; LINE_WIDTH: 0.533465
G1 F2719
M204 S6000
G1 X125.644 Y128.143 E.01196
; LINE_WIDTH: 0.497258
G1 X125.637 Y128.001 E.00526
G3 X125.603 Y127.457 I3.68 J-.502 E.02019
; LINE_WIDTH: 0.555806
G1 X125.614 Y127.35 E.0045
; LINE_WIDTH: 0.580023
G1 X124.313 Y117.465 E.43635
M204 S10000
G1 X124.556 Y117.258 F42000
; LINE_WIDTH: 0.266959
G1 F2719
M204 S6000
G1 X124.522 Y117.288 E.00083
; LINE_WIDTH: 0.315003
G1 X124.487 Y117.317 E.00101
; LINE_WIDTH: 0.363046
G1 X124.452 Y117.347 E.00119
; LINE_WIDTH: 0.41109
G1 X124.418 Y117.377 E.00137
; LINE_WIDTH: 0.459133
G1 X124.383 Y117.406 E.00155
; LINE_WIDTH: 0.507177
G1 X124.348 Y117.436 E.00173
; LINE_WIDTH: 0.55522
G1 X124.313 Y117.465 E.00191
; LINE_WIDTH: 0.562554
G1 X124.288 Y117.398 E.00303
; LINE_WIDTH: 0.529209
G1 X124.262 Y117.332 E.00284
; LINE_WIDTH: 0.479814
G1 X124.236 Y117.265 E.00255
G1 X124.026 Y115.665 E.05746
M204 S10000
G1 X130.321 Y114.835 F42000
; LINE_WIDTH: 0.48086
G1 F2719
M204 S6000
G1 X130.531 Y116.436 E.05762
; LINE_WIDTH: 0.505855
G1 X130.52 Y116.543 E.00406
; LINE_WIDTH: 0.555855
G1 X130.509 Y116.65 E.0045
; LINE_WIDTH: 0.580843
G1 X131.81 Y126.534 E.437
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
; LINE_WIDTH: 0.555834
G1 F2719
M204 S6000
G1 X131.849 Y126.635 E.0045
; LINE_WIDTH: 0.505843
G1 X131.887 Y126.735 E.00406
; LINE_WIDTH: 0.46837
G3 X131.983 Y127.596 I-25.825 J3.3 E.03003
; LINE_WIDTH: 0.423344
G1 X132.014 Y128 E.01256
; LINE_WIDTH: 0.387808
G1 X132.032 Y128.342 E.00962
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10438.197
G1 X132.014 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/68
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z1.8 I.06 J-1.215 P1  F42000
G1 X126.029 Y127.704 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3316
M204 S5000
G1 X130.613 Y127.101 E.14207
G1 X131.501 Y126.984 E.02755
G1 X131.661 Y128.193 E.03749
G1 X126.188 Y128.914 E.16961
G1 X126.036 Y127.764 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.016 Y127.477 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.528 Y134.958 Z2 F42000
G1 X130.268 Y138.618 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3316
M204 S6000
G1 X124.734 Y137.89 E.18516
G1 X125.803 Y129.77 E.27165
G1 X131.533 Y129.016 E.19169
G1 X130.276 Y138.559 E.31929
M204 S10000
G1 X130.619 Y139.075 F42000
G1 F3316
M204 S6000
G1 X124.278 Y138.24 E.21216
G1 X125.542 Y128.638 E.32127
G1 X125.756 Y128.638 E.0071
G1 X125.85 Y129.354 E.02395
G1 X131.979 Y128.547 E.20504
G1 X131.961 Y128.808 E.00869
G1 X130.627 Y139.016 E.34148
; WIPE_START
G1 F8843.478
G1 X128.641 Y138.773 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.286 Y131.262 Z2 F42000
G1 X124.738 Y117.132 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3316
M204 S5000
G1 X126.745 Y116.868 E.06222
G1 X130.012 Y116.438 E.10125
G1 X131.385 Y126.868 E.32325
G1 X126.111 Y127.562 E.16347
G1 X124.745 Y117.192 E.32141
M204 S250
G1 X124.622 Y117.016 F42000
G1 F3316
M204 S5000
G1 X124.462 Y115.807 E.03749
G1 X129.046 Y115.203 E.14207
G1 X129.935 Y115.086 E.02755
G1 X130.094 Y116.296 E.03749
G1 X124.681 Y117.009 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.462 Y115.807 E-.46416
G1 X125.234 Y115.705 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.04 Y123.121 Z2 F42000
G1 X130.982 Y139.317 Z2
G1 Z1.6
G1 E.8 F1800
G1 F3316
M204 S5000
G3 X130.761 Y139.489 I-.193 J-.019 E.00966
G1 X123.972 Y138.586 E.21044
G3 X123.863 Y138.385 I.083 J-.174 E.00754
G1 X125.188 Y128.32 E.31192
G2 X125.188 Y127.678 I-3.402 J-.32 E.01976
G1 X123.612 Y115.693 E.37142
G3 X123.773 Y115.5 I.198 J.001 E.00836
G1 X130.51 Y114.613 E.20881
G3 X130.583 Y114.615 I.029 J.212 E.00226
G3 X130.733 Y114.785 I-.043 J.188 E.00743
G1 X132.306 Y126.736 E.37038
G3 X132.306 Y129.264 I-10.792 J1.264 E.07785
G1 X130.99 Y139.257 E.30971
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.962 Y139.386 E-.05018
G1 X130.914 Y139.447 E-.0293
G1 X130.861 Y139.478 E-.02375
G1 X130.761 Y139.489 E-.03825
G1 X129.147 Y139.275 E-.61852
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X129.287 Y138.32 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.42274
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X130.036 Y137.549 E.06152
G1 X130.14 Y136.764 E.04529
G1 X128.879 Y138.062 E.10353
G1 X128.294 Y137.985 E.0337
M73 P40 R10
G1 X130.243 Y135.978 E.15997
G1 X130.346 Y135.193 E.04529
G1 X127.71 Y137.909 E.21642
G1 X127.126 Y137.832 E.0337
G1 X130.45 Y134.408 E.27286
G1 X130.553 Y133.623 E.04528
G1 X126.542 Y137.755 E.32931
G1 X125.958 Y137.678 E.0337
G1 X130.656 Y132.838 E.38575
G1 X130.76 Y132.053 E.04528
G1 X125.373 Y137.601 E.4422
G1 X125.149 Y137.571 E.01293
G1 X125.213 Y137.087 E.02791
G1 X130.863 Y131.268 E.46386
G1 X130.967 Y130.483 E.04529
G1 X125.316 Y136.302 E.46386
G1 X125.42 Y135.517 E.04529
G1 X131.07 Y129.698 E.46386
G1 X131.103 Y129.446 E.01454
G1 X130.59 Y129.513 E.02959
G1 X125.523 Y134.732 E.41599
G1 X125.626 Y133.947 E.04528
G1 X129.835 Y129.613 E.34548
G1 X129.079 Y129.712 E.04358
G1 X125.73 Y133.162 E.27498
G1 X125.833 Y132.377 E.04528
G1 X128.324 Y129.811 E.20447
G1 X127.568 Y129.911 E.04358
G1 X125.936 Y131.592 E.13397
G1 X126.04 Y130.807 E.04529
G1 X127.04 Y129.776 E.08213
M106 S201.45
; WIPE_START
G1 X126.04 Y130.807 E-.54572
G1 X125.966 Y131.366 E-.21428
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.65 Y128.442 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.534358
; LAYER_HEIGHT: 0.2
G1 F3316
M204 S6000
M73 P41 R10
G1 X125.644 Y128.152 E.01158
; LINE_WIDTH: 0.497738
G1 X125.637 Y128.002 E.00558
G3 X125.603 Y127.457 I3.699 J-.504 E.02026
; LINE_WIDTH: 0.555806
G1 X125.614 Y127.35 E.0045
; LINE_WIDTH: 0.556661
G1 X125.655 Y127.37 E.00192
; LINE_WIDTH: 0.508392
G1 X125.697 Y127.389 E.00174
; LINE_WIDTH: 0.460122
G1 X125.738 Y127.409 E.00156
; LINE_WIDTH: 0.411853
G1 X125.779 Y127.428 E.00138
; LINE_WIDTH: 0.363584
G1 X125.821 Y127.448 E.0012
; LINE_WIDTH: 0.315315
G1 X125.862 Y127.468 E.00102
; LINE_WIDTH: 0.267045
G1 X125.903 Y127.487 E.00084
M204 S10000
G1 X125.614 Y127.35 F42000
; LINE_WIDTH: 0.579999
G1 F3316
M204 S6000
G1 X124.313 Y117.465 E.43633
M204 S10000
G1 X124.556 Y117.258 F42000
; LINE_WIDTH: 0.266914
G1 F3316
M204 S6000
G1 X124.522 Y117.288 E.00083
; LINE_WIDTH: 0.314956
G1 X124.487 Y117.317 E.00101
; LINE_WIDTH: 0.362999
G1 X124.452 Y117.347 E.00119
; LINE_WIDTH: 0.411042
G1 X124.418 Y117.377 E.00137
; LINE_WIDTH: 0.459084
G1 X124.383 Y117.406 E.00155
; LINE_WIDTH: 0.507127
G1 X124.348 Y117.436 E.00173
; LINE_WIDTH: 0.555169
G1 X124.313 Y117.465 E.0019
; LINE_WIDTH: 0.562535
G1 X124.288 Y117.398 E.00303
; LINE_WIDTH: 0.52919
G1 X124.262 Y117.332 E.00284
; LINE_WIDTH: 0.47979
G1 X124.236 Y117.265 E.00255
G1 X124.026 Y115.664 E.05746
M204 S10000
G1 X130.321 Y114.835 F42000
; LINE_WIDTH: 0.482423
G1 F3316
M204 S6000
G1 X130.531 Y116.436 E.05782
G1 X130.52 Y116.543 E.00385
; LINE_WIDTH: 0.555855
G1 X130.509 Y116.65 E.0045
; LINE_WIDTH: 0.580846
G1 X131.81 Y126.534 E.437
M204 S10000
G1 X131.566 Y126.742 F42000
; LINE_WIDTH: 0.267032
G1 F3316
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
; LINE_WIDTH: 0.555848
G1 X131.849 Y126.635 E.0045
; LINE_WIDTH: 0.50586
G1 X131.887 Y126.735 E.00406
; LINE_WIDTH: 0.468366
G3 X131.983 Y127.596 I-25.885 J3.306 E.03003
; LINE_WIDTH: 0.423322
G1 X132.014 Y128 E.01257
; LINE_WIDTH: 0.3878
G1 X132.032 Y128.342 E.00962
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10438.425
G1 X132.014 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/68
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z2 I.06 J-1.215 P1  F42000
G1 X126.029 Y127.704 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3424
M204 S5000
G1 X130.418 Y127.126 E.13604
G1 X131.501 Y126.984 E.03358
G1 X131.661 Y128.193 E.03749
G1 X126.188 Y128.914 E.16961
G1 X126.036 Y127.764 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.016 Y127.476 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.528 Y134.957 Z2.2 F42000
G1 X130.268 Y138.618 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3424
M204 S6000
G1 X124.734 Y137.89 E.18516
G1 X125.803 Y129.77 E.27165
G1 X131.533 Y129.016 E.19169
G1 X130.276 Y138.559 E.31928
M204 S10000
G1 X130.619 Y139.075 F42000
G1 F3424
M204 S6000
G1 X124.278 Y138.24 E.21216
G1 X125.542 Y128.638 E.32127
G1 X125.756 Y128.638 E.0071
G1 X125.85 Y129.354 E.02395
G1 X131.979 Y128.547 E.20504
G1 X131.961 Y128.808 E.0087
G1 X130.627 Y139.016 E.34148
; WIPE_START
G1 F8843.478
G1 X128.641 Y138.773 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.286 Y131.262 Z2.2 F42000
G1 X124.738 Y117.132 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3424
M204 S5000
G1 X126.025 Y116.963 E.03991
G1 X130.012 Y116.438 E.12356
G1 X131.385 Y126.868 E.32325
G1 X126.111 Y127.562 E.16347
G1 X124.745 Y117.192 E.32141
M204 S250
G1 X124.622 Y117.016 F42000
G1 F3424
M204 S5000
G1 X124.462 Y115.807 E.03749
G1 X128.852 Y115.229 E.13604
G1 X129.935 Y115.086 E.03358
G1 X130.094 Y116.296 E.03749
G1 X124.681 Y117.009 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.462 Y115.807 E-.46416
G1 X125.234 Y115.705 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.039 Y123.121 Z2.2 F42000
G1 X130.982 Y139.319 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F3424
M204 S5000
G3 X130.761 Y139.489 I-.192 J-.021 E.0096
G1 X124.023 Y138.602 E.20882
G1 X123.948 Y138.573 E.00247
G1 X123.881 Y138.497 E.00311
G3 X123.863 Y138.385 I.309 J-.105 E.00352
G1 X125.188 Y128.32 E.31192
G2 X125.188 Y127.678 I-3.42 J-.32 E.01976
G1 X123.612 Y115.693 E.37141
G3 X123.771 Y115.5 I.199 J.001 E.00831
G1 X130.51 Y114.613 E.20887
G3 X130.582 Y114.615 I.029 J.211 E.00222
G3 X130.733 Y114.785 I-.041 J.188 E.00746
G1 X132.306 Y126.736 E.37038
G3 X132.352 Y128.842 I-9.988 J1.273 E.06486
G1 X130.99 Y139.259 E.32281
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.96 Y139.39 E-.05073
G1 X130.898 Y139.459 E-.03528
G1 X130.833 Y139.487 E-.0271
G1 X130.761 Y139.489 E-.02744
G1 X129.144 Y139.276 E-.61946
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X129.325 Y131.223 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F3424
M204 S6000
G1 X127.497 Y131.464 E.05666
G1 X126.867 Y136.254 E.14843
G1 X128.632 Y136.486 E.05473
G1 X129.317 Y131.283 E.16126
M204 S10000
G1 X128.887 Y131.661 F42000
G1 F3424
M204 S6000
G1 X127.833 Y131.8 E.03267
G1 X127.29 Y135.929 E.12796
G1 X128.308 Y136.063 E.03155
G1 X128.879 Y131.721 E.13457
M204 S10000
G1 X128.48 Y132.069 F42000
; LINE_WIDTH: 0.367835
G1 F3424
M204 S6000
G1 X128.146 Y132.113 E.00891
G1 X127.683 Y135.627 E.09384
G1 X128.006 Y135.669 E.0086
G1 X128.472 Y132.129 E.09455
M204 S10000
G1 X127.161 Y131.128 F42000
; LINE_WIDTH: 0.41999
G1 F3424
M204 S6000
G1 X126.443 Y136.578 E.16891
G1 X128.957 Y136.909 E.0779
G1 X129.763 Y130.785 E.18979
G1 X127.221 Y131.12 E.0788
M204 S10000
G1 X126.825 Y130.792 F42000
G1 F3424
M204 S6000
G1 X126.02 Y136.903 E.18939
G1 X129.282 Y137.332 E.10107
G1 X130.201 Y130.347 E.21647
G1 X126.884 Y130.784 E.10279
M204 S10000
G1 X126.489 Y130.456 F42000
G1 F3424
M204 S6000
G1 X125.597 Y137.227 E.20986
G1 X129.606 Y137.755 E.12424
G1 X130.639 Y129.909 E.24316
G1 X126.548 Y130.448 E.12678
M204 S10000
G1 X126.153 Y130.12 F42000
G1 F3424
M204 S6000
G1 X125.174 Y137.552 E.23034
G1 X129.931 Y138.179 E.14741
G1 X131.077 Y129.471 E.26985
G1 X126.212 Y130.112 E.15077
; WIPE_START
G1 F9547.299
G1 X128.195 Y129.851 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.65 Y128.442 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.534537
G1 F3424
M204 S6000
G1 X125.644 Y128.154 E.01152
; LINE_WIDTH: 0.497846
G1 X125.637 Y128.002 E.00563
G3 X125.603 Y127.457 I3.694 J-.504 E.02028
; LINE_WIDTH: 0.555818
G1 X125.614 Y127.35 E.0045
; LINE_WIDTH: 0.556664
G1 X125.655 Y127.37 E.00192
; LINE_WIDTH: 0.508385
G1 X125.697 Y127.389 E.00174
; LINE_WIDTH: 0.460106
G1 X125.738 Y127.409 E.00156
; LINE_WIDTH: 0.411827
G1 X125.779 Y127.428 E.00138
; LINE_WIDTH: 0.363549
G1 X125.821 Y127.448 E.0012
; LINE_WIDTH: 0.31527
G1 X125.862 Y127.468 E.00102
; LINE_WIDTH: 0.266991
G1 X125.903 Y127.487 E.00084
M204 S10000
G1 X125.614 Y127.35 F42000
; LINE_WIDTH: 0.579998
G1 F3424
M204 S6000
G1 X124.313 Y117.465 E.43633
M204 S10000
G1 X124.556 Y117.258 F42000
; LINE_WIDTH: 0.266956
G1 F3424
M204 S6000
G1 X124.522 Y117.288 E.00083
; LINE_WIDTH: 0.314994
G1 X124.487 Y117.317 E.00101
; LINE_WIDTH: 0.363033
G1 X124.452 Y117.347 E.00119
; LINE_WIDTH: 0.411071
G1 X124.418 Y117.377 E.00137
; LINE_WIDTH: 0.459109
G1 X124.383 Y117.406 E.00155
; LINE_WIDTH: 0.507147
G1 X124.348 Y117.436 E.00173
; LINE_WIDTH: 0.555185
G1 X124.313 Y117.465 E.0019
; LINE_WIDTH: 0.562534
G1 X124.288 Y117.398 E.00303
; LINE_WIDTH: 0.529189
G1 X124.262 Y117.332 E.00284
; LINE_WIDTH: 0.479783
G1 X124.236 Y117.265 E.00255
M73 P42 R10
G1 X124.026 Y115.665 E.05746
M204 S10000
G1 X130.321 Y114.835 F42000
; LINE_WIDTH: 0.482421
G1 F3424
M204 S6000
G1 X130.531 Y116.436 E.05782
G1 X130.52 Y116.543 E.00385
; LINE_WIDTH: 0.555843
G1 X130.509 Y116.65 E.0045
; LINE_WIDTH: 0.580851
G1 X131.81 Y126.534 E.43701
M204 S10000
G1 X131.566 Y126.742 F42000
; LINE_WIDTH: 0.267032
G1 F3424
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
; LINE_WIDTH: 0.555836
G1 X131.849 Y126.635 E.0045
; LINE_WIDTH: 0.505843
G1 X131.887 Y126.735 E.00406
; LINE_WIDTH: 0.468365
G3 X131.983 Y127.596 I-25.839 J3.301 E.03003
; LINE_WIDTH: 0.423329
G1 X132.014 Y128 E.01256
; LINE_WIDTH: 0.387819
G1 X132.032 Y128.342 E.00962
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10437.847
G1 X132.014 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/68
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z2.2 I.06 J-1.215 P1  F42000
G1 X126.029 Y127.704 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3424
M204 S5000
G1 X130.224 Y127.152 E.13001
G1 X131.501 Y126.984 E.0396
G1 X131.661 Y128.193 E.03749
G1 X126.188 Y128.914 E.16961
G1 X126.036 Y127.764 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.015 Y127.474 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.528 Y134.956 Z2.4 F42000
G1 X130.268 Y138.618 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3424
M204 S6000
G1 X124.734 Y137.89 E.18516
G1 X125.803 Y129.77 E.27165
G1 X131.533 Y129.016 E.19169
G1 X130.276 Y138.559 E.31928
M204 S10000
G1 X130.619 Y139.075 F42000
G1 F3424
M204 S6000
G1 X124.278 Y138.24 E.21216
G1 X125.542 Y128.638 E.32127
G1 X125.756 Y128.638 E.0071
G1 X125.85 Y129.354 E.02395
G1 X131.979 Y128.547 E.20504
G1 X131.961 Y128.808 E.00869
G1 X130.627 Y139.016 E.34148
; WIPE_START
G1 F8843.478
G1 X128.641 Y138.773 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.286 Y131.262 Z2.4 F42000
G1 X124.738 Y117.132 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3424
M204 S5000
G1 X125.306 Y117.057 E.01761
G1 X130.012 Y116.438 E.14586
G1 X131.385 Y126.868 E.32325
G1 X126.111 Y127.562 E.16347
G1 X124.745 Y117.192 E.32141
M204 S250
G1 X124.622 Y117.016 F42000
G1 F3424
M204 S5000
G1 X124.462 Y115.807 E.03749
G1 X128.657 Y115.255 E.13001
G1 X129.935 Y115.086 E.0396
G1 X130.094 Y116.296 E.03749
G1 X124.681 Y117.009 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.462 Y115.807 E-.46416
G1 X125.234 Y115.705 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.04 Y123.121 Z2.4 F42000
G1 X130.983 Y139.316 Z2.4
G1 Z2
G1 E.8 F1800
G1 F3424
M204 S5000
G3 X130.761 Y139.489 I-.192 J-.018 E.00969
G1 X124.023 Y138.602 E.20882
G1 X123.948 Y138.573 E.00248
G1 X123.881 Y138.497 E.00311
G3 X123.863 Y138.384 I.309 J-.105 E.00352
G1 X125.188 Y128.32 E.31192
G2 X125.188 Y127.678 I-3.434 J-.32 E.01976
G1 X123.612 Y115.693 E.37142
G3 X123.771 Y115.5 I.198 J.002 E.00832
G1 X130.51 Y114.613 E.20885
G3 X130.583 Y114.615 I.029 J.211 E.00226
G3 X130.733 Y114.785 I-.043 J.188 E.00742
G1 X132.306 Y126.736 E.37039
G3 X132.306 Y129.264 I-10.791 J1.264 E.07785
G1 X130.99 Y139.257 E.30971
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.962 Y139.386 E-.05022
G1 X130.913 Y139.448 E-.02993
G1 X130.859 Y139.479 E-.02362
G1 X130.761 Y139.489 E-.03778
G1 X129.147 Y139.277 E-.61844
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X129.325 Y131.223 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F3424
M204 S6000
G1 X127.497 Y131.464 E.05666
G1 X126.867 Y136.254 E.14844
G1 X128.632 Y136.486 E.05473
G1 X129.317 Y131.283 E.16126
M204 S10000
G1 X128.887 Y131.661 F42000
G1 F3424
M204 S6000
G1 X127.833 Y131.8 E.03267
G1 X127.29 Y135.929 E.12796
G1 X128.308 Y136.063 E.03155
G1 X128.879 Y131.721 E.13457
M204 S10000
G1 X128.48 Y132.069 F42000
; LINE_WIDTH: 0.36784
G1 F3424
M204 S6000
G1 X128.146 Y132.113 E.00891
G1 X127.683 Y135.627 E.09384
G1 X128.006 Y135.669 E.0086
G1 X128.472 Y132.129 E.09456
M204 S10000
G1 X127.161 Y131.128 F42000
; LINE_WIDTH: 0.41999
G1 F3424
M204 S6000
G1 X126.443 Y136.578 E.16891
G1 X128.957 Y136.909 E.0779
G1 X129.763 Y130.785 E.18979
G1 X127.221 Y131.12 E.0788
M204 S10000
G1 X126.825 Y130.792 F42000
G1 F3424
M204 S6000
G1 X126.02 Y136.903 E.18939
G1 X129.282 Y137.332 E.10107
G1 X130.201 Y130.347 E.21647
G1 X126.884 Y130.784 E.10279
M204 S10000
G1 X126.489 Y130.456 F42000
G1 F3424
M204 S6000
G1 X125.597 Y137.227 E.20986
G1 X129.606 Y137.755 E.12424
G1 X130.639 Y129.909 E.24316
G1 X126.548 Y130.448 E.12678
M204 S10000
G1 X126.153 Y130.12 F42000
G1 F3424
M204 S6000
G1 X125.174 Y137.552 E.23034
G1 X129.931 Y138.179 E.14741
G1 X131.077 Y129.471 E.26985
G1 X126.212 Y130.112 E.15077
; WIPE_START
G1 F9547.299
G1 X128.195 Y129.851 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.65 Y128.442 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.534678
G1 F3424
M204 S6000
G1 X125.644 Y128.156 E.01145
; LINE_WIDTH: 0.497909
G1 X125.637 Y128.003 E.00569
G3 X125.603 Y127.457 I3.695 J-.504 E.02029
; LINE_WIDTH: 0.555806
G1 X125.614 Y127.35 E.0045
; LINE_WIDTH: 0.556661
G1 X125.655 Y127.37 E.00192
; LINE_WIDTH: 0.508392
G1 X125.697 Y127.389 E.00174
; LINE_WIDTH: 0.460122
G1 X125.738 Y127.409 E.00156
; LINE_WIDTH: 0.411853
G1 X125.779 Y127.428 E.00138
; LINE_WIDTH: 0.363584
G1 X125.821 Y127.448 E.0012
; LINE_WIDTH: 0.315315
G1 X125.862 Y127.468 E.00102
; LINE_WIDTH: 0.267045
G1 X125.903 Y127.487 E.00084
M204 S10000
G1 X125.614 Y127.35 F42000
; LINE_WIDTH: 0.58
G1 F3424
M204 S6000
G1 X124.313 Y117.465 E.43633
M204 S10000
G1 X124.556 Y117.258 F42000
; LINE_WIDTH: 0.266914
G1 F3424
M204 S6000
G1 X124.522 Y117.288 E.00083
; LINE_WIDTH: 0.314956
G1 X124.487 Y117.317 E.00101
; LINE_WIDTH: 0.362999
G1 X124.452 Y117.347 E.00119
; LINE_WIDTH: 0.411042
G1 X124.418 Y117.377 E.00137
; LINE_WIDTH: 0.459084
G1 X124.383 Y117.406 E.00155
; LINE_WIDTH: 0.507127
G1 X124.348 Y117.436 E.00173
; LINE_WIDTH: 0.555169
G1 X124.313 Y117.465 E.0019
; LINE_WIDTH: 0.562526
G1 X124.288 Y117.398 E.00303
; LINE_WIDTH: 0.529185
G1 X124.262 Y117.332 E.00284
; LINE_WIDTH: 0.479776
G1 X124.236 Y117.265 E.00255
G1 X124.026 Y115.665 E.05745
M204 S10000
G1 X130.321 Y114.835 F42000
; LINE_WIDTH: 0.482411
G1 F3424
M204 S6000
G1 X130.531 Y116.436 E.05782
G1 X130.52 Y116.543 E.00385
; LINE_WIDTH: 0.555845
G1 X130.509 Y116.65 E.0045
; LINE_WIDTH: 0.580845
G1 X131.81 Y126.534 E.437
M204 S10000
G1 X131.566 Y126.742 F42000
; LINE_WIDTH: 0.267032
G1 F3424
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
; LINE_WIDTH: 0.555846
G1 X131.849 Y126.635 E.0045
; LINE_WIDTH: 0.50586
G1 X131.887 Y126.735 E.00406
; LINE_WIDTH: 0.468359
G3 X131.983 Y127.596 I-25.883 J3.306 E.03004
; LINE_WIDTH: 0.423341
G1 X132.014 Y128 E.01256
; LINE_WIDTH: 0.387809
G1 X132.032 Y128.342 E.00962
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10438.159
G1 X132.014 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/68
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
M106 S198.9
; OBJECT_ID: 394
M204 S10000
G17
G3 Z2.4 I.214 J-1.198 P1  F42000
G1 X125.924 Y126.912 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X125.894 Y126.916 E.00102
G1 X124.801 Y118.606 E.27804
G1 X124.749 Y118.209 E.01327
G1 F6561.101
G1 X124.697 Y117.812 E.01327
G1 F2839.591
G1 X124.852 Y117.792 E.0052
M106 S255
G1 F1800
G1 X125.231 Y117.742 E.01269
M106 S198.9
; FEATURE: Overhang wall
M106 S255
G1 F600
M204 S5000
G1 X125.247 Y117.74 E.00053
G1 X126.446 Y126.843 E.30458
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
G1 F2218.209
G1 X125.984 Y126.904 E.00224
; WIPE_START
G1 X125.894 Y126.916 E-.03452
G1 X125.645 Y125.023 E-.72548
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
G1 F2851.298
G1 X130.229 Y117.084 E.00525
G1 F6578.891
G1 X130.281 Y117.481 E.01327
G1 F8843.478
M73 P43 R10
G1 X130.334 Y117.877 E.01327
G1 X131.323 Y125.394 E.2515
G1 X131.375 Y125.791 E.01327
G1 F6579.002
G1 X131.428 Y126.187 E.01327
G1 F2851.372
G1 X131.271 Y126.208 E.00525
M106 S255
G1 F1800
G1 X130.951 Y126.25 E.0107
M106 S198.9
; WIPE_START
G1 X130.876 Y126.26 E-.02883
G1 X130.625 Y124.352 E-.73117
; WIPE_END
G1 E-.04
M204 S10000
G17
G3 Z2.6 I.981 J-.72 P1  F42000
G1 X125.633 Y117.552 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Overhang wall
M106 S255
G1 F600
M204 S5000
G1 X129.256 Y117.075 E.12121
G1 X130.49 Y126.448 E.31361
G1 X126.867 Y126.925 E.12121
G1 X125.641 Y117.611 E.31162
M106 S198.9
M204 S250
G1 X126.073 Y117.889 F42000
M106 S255
G1 F600
M204 S5000
G1 X128.918 Y117.515 E.0952
G1 X130.05 Y126.111 E.2876
G1 X127.205 Y126.485 E.0952
G1 X126.081 Y117.949 E.28561
M106 S198.9
; WIPE_START
M204 S6000
G1 X128.058 Y117.646 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.6 I-1.19 J-.256 P1  F42000
G1 X125.977 Y127.315 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X125.543 Y127.373 E.01453
G1 X124.292 Y117.859 E.31831
G1 X124.24 Y117.462 E.01327
G1 F5683.92
G1 X124.799 Y117.388 E.0187
M106 S255
G1 F1320
G1 X130.019 Y116.701 E.17465
M106 S198.9
G1 F5701.115
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
G1 F1681.444
G1 X126.037 Y127.308 E.00224
M204 S250
G1 X126.029 Y127.704 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X130.029 Y127.177 E.12398
G1 X131.501 Y126.984 E.04563
G1 X131.661 Y128.193 E.03749
G1 X126.188 Y128.914 E.16961
G1 X126.036 Y127.764 E.03564
; WIPE_START
M204 S6000
G1 X128.015 Y127.473 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.528 Y134.954 Z2.6 F42000
G1 X130.268 Y138.618 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X124.734 Y137.89 E.18516
G1 X125.803 Y129.77 E.27165
G1 X131.533 Y129.016 E.19169
G1 X130.276 Y138.559 E.31929
M204 S10000
G1 X130.619 Y139.075 F42000
G1 F8843.478
M204 S6000
G1 X124.278 Y138.24 E.21216
G1 X125.542 Y128.638 E.32128
G1 X125.756 Y128.638 E.0071
G1 X125.85 Y129.354 E.02395
G1 X131.979 Y128.547 E.20504
G1 X131.961 Y128.808 E.00869
G1 X130.627 Y139.016 E.34148
; WIPE_START
G1 X128.641 Y138.773 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.255 Y131.268 Z2.6 F42000
G1 X124.622 Y117.016 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X124.462 Y115.807 E.03749
G1 X129.935 Y115.086 E.16961
G1 X130.094 Y116.296 E.03749
G1 X124.681 Y117.009 E.16777
; WIPE_START
M204 S6000
G1 X124.462 Y115.807 E-.46416
G1 X125.234 Y115.705 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.6 I-1.182 J.288 P1  F42000
G1 X130.982 Y139.317 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G3 X130.76 Y139.489 I-.192 J-.018 E.00968
G1 X124.023 Y138.602 E.2088
G3 X123.863 Y138.384 I.03 J-.189 E.00921
G1 X125.188 Y128.32 E.31192
G2 X125.188 Y127.678 I-3.449 J-.32 E.01976
G1 X123.612 Y115.693 E.37142
G3 X123.771 Y115.5 I.198 J.001 E.00831
G1 X130.51 Y114.613 E.20886
G3 X130.584 Y114.615 I.029 J.213 E.00228
G3 X130.733 Y114.785 I-.043 J.188 E.00742
G1 X132.306 Y126.736 E.37038
G3 X132.306 Y129.264 I-10.793 J1.264 E.07785
G1 X130.99 Y139.257 E.30971
; WIPE_START
M204 S6000
G1 X130.962 Y139.386 E-.05007
G1 X130.915 Y139.446 E-.02921
G1 X130.859 Y139.479 E-.02452
G1 X130.76 Y139.489 E-.03769
G1 X129.147 Y139.277 E-.61851
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X129.325 Y131.223 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X127.497 Y131.464 E.05666
G1 X126.867 Y136.254 E.14844
G1 X128.632 Y136.486 E.05473
G1 X129.317 Y131.283 E.16126
M204 S10000
G1 X128.887 Y131.661 F42000
G1 F9547.299
M204 S6000
G1 X127.833 Y131.8 E.03267
G1 X127.29 Y135.929 E.12796
G1 X128.308 Y136.063 E.03155
G1 X128.879 Y131.721 E.13457
M204 S10000
G1 X128.48 Y132.069 F42000
; LINE_WIDTH: 0.36784
G1 F11079.65
M204 S6000
G1 X128.146 Y132.113 E.00891
G1 X127.683 Y135.627 E.09384
G1 X128.006 Y135.669 E.0086
G1 X128.472 Y132.129 E.09456
M204 S10000
G1 X127.161 Y131.128 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X126.443 Y136.578 E.16891
G1 X128.957 Y136.909 E.0779
G1 X129.763 Y130.785 E.18979
G1 X127.221 Y131.12 E.0788
M204 S10000
G1 X126.825 Y130.792 F42000
G1 F9547.299
M204 S6000
G1 X126.02 Y136.903 E.18939
G1 X129.282 Y137.332 E.10107
G1 X130.201 Y130.347 E.21647
G1 X126.884 Y130.784 E.10279
M204 S10000
G1 X126.489 Y130.456 F42000
G1 F9547.299
M204 S6000
G1 X125.597 Y137.227 E.20986
G1 X129.606 Y137.755 E.12424
G1 X130.639 Y129.909 E.24316
G1 X126.548 Y130.448 E.12678
M204 S10000
G1 X126.153 Y130.12 F42000
G1 F9547.299
M204 S6000
M73 P44 R10
G1 X125.174 Y137.552 E.23034
G1 X129.931 Y138.179 E.14741
G1 X131.077 Y129.471 E.26985
G1 X126.212 Y130.112 E.15077
; WIPE_START
G1 X128.195 Y129.851 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.143 Y126.678 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.191737
G1 F15000
M204 S6000
G1 X124.999 Y117.978 E.10641
; WIPE_START
G1 X125.259 Y119.961 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y117.265 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.479038
G1 F8254.646
M204 S6000
G1 X124.026 Y115.665 E.05735
M204 S10000
G1 X130.321 Y114.835 F42000
; LINE_WIDTH: 0.480833
G1 F8220.817
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
; LINE_WIDTH: 0.467127
G1 F8486.428
M204 S6000
G3 X131.983 Y127.596 I-19.642 J2.601 E.02994
; LINE_WIDTH: 0.423329
G1 F9463.517
G1 X132.014 Y128 E.01256
; LINE_WIDTH: 0.387809
G1 F10438.166
G1 X132.032 Y128.342 E.00962
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10438.166
G1 X132.014 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/68
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
M106 S201.45
; OBJECT_ID: 394
M204 S10000
G17
G3 Z2.6 I.06 J-1.215 P1  F42000
G1 X126.029 Y127.704 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5051
M204 S5000
G1 X129.835 Y127.203 E.11796
G1 X131.501 Y126.984 E.05166
G1 X131.661 Y128.193 E.03749
G1 X126.188 Y128.914 E.16961
G1 X126.036 Y127.764 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.015 Y127.472 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I.587 J-1.066 P1  F42000
G1 X126.412 Y126.59 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5051
M204 S6000
G1 X126.446 Y126.843 E.00849
G1 X125.894 Y126.916 E.01846
G1 X124.697 Y117.812 E.30457
G1 X125.247 Y117.74 E.01841
G1 X126.404 Y126.53 E.2941
; WIPE_START
G1 F8843.478
G1 X126.446 Y126.843 E-.12003
G1 X125.894 Y126.916 E-.21152
G1 X125.747 Y125.798 E-.42845
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I-.109 J1.212 P1  F42000
G1 X130.876 Y126.26 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F5051
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
G1 F5051
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
G1 F5051
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
G3 Z2.8 I-.864 J.857 P1  F42000
G1 X129.343 Y126.872 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5051
M204 S6000
G1 X125.543 Y127.373 E.12715
G1 X124.24 Y117.462 E.33158
G1 X130.58 Y116.627 E.21211
G1 X131.884 Y126.538 E.33158
G1 X129.403 Y126.864 E.08302
; WIPE_START
G1 F8843.478
G1 X127.42 Y127.125 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.394 Y134.498 Z2.8 F42000
G1 X130.619 Y139.075 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F5051
M204 S6000
G1 X129.973 Y138.99 E.02159
G1 X131.298 Y128.932 E.33653
G1 X130.988 Y128.891 E.01035
G1 X130.988 Y128.677 E.0071
G1 X131.979 Y128.547 E.03313
G1 X131.961 Y128.808 E.00869
G1 X130.627 Y139.016 E.34149
; WIPE_START
G1 F8843.478
G1 X129.973 Y138.99 E-.24838
G1 X130.149 Y137.655 E-.51162
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.806 Y130.794 Z2.8 F42000
G1 X125.756 Y128.638 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F5051
M204 S6000
G1 X125.85 Y129.354 E.02395
G1 X126.109 Y129.32 E.00864
G1 X124.923 Y138.325 E.30131
G1 X124.278 Y138.24 E.02159
G1 X125.542 Y128.638 E.32128
G1 X125.696 Y128.638 E.00511
; WIPE_START
G1 F8843.478
G1 X125.85 Y129.354 E-.27831
G1 X126.109 Y129.32 E-.09902
G1 X125.977 Y130.318 E-.38268
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.203 Y122.725 Z2.8 F42000
G1 X124.622 Y117.016 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5051
M204 S5000
G1 X124.462 Y115.807 E.03749
G1 X128.268 Y115.306 E.11796
G1 X129.935 Y115.086 E.05166
G1 X130.094 Y116.296 E.03749
G1 X124.681 Y117.009 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.462 Y115.807 E-.46416
G1 X125.234 Y115.705 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I-1.182 J.288 P1  F42000
G1 X130.982 Y139.319 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F5051
M204 S5000
G3 X130.76 Y139.489 I-.192 J-.021 E.00961
G1 X124.024 Y138.602 E.20878
G3 X123.863 Y138.384 I.029 J-.19 E.00922
G1 X125.188 Y128.32 E.31192
G2 X125.188 Y127.678 I-3.464 J-.32 E.01976
G1 X123.612 Y115.693 E.37142
G3 X123.772 Y115.5 I.199 J.002 E.00832
G1 X130.511 Y114.613 E.20888
G3 X130.584 Y114.615 I.028 J.213 E.00225
G3 X130.733 Y114.785 I-.043 J.188 E.0074
G1 X132.306 Y126.736 E.37039
G3 X132.306 Y129.264 I-10.793 J1.264 E.07785
G1 X130.99 Y139.26 E.30979
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.961 Y139.388 E-.05006
G1 X130.914 Y139.447 E-.02872
G1 X130.859 Y139.479 E-.02387
G1 X130.76 Y139.489 E-.0379
G1 X129.144 Y139.276 E-.61945
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X129.781 Y138.751 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Top surface
G1 F5051
M204 S2000
G1 X129.427 Y139.104 E.01536
G1 X128.956 Y139.042
G1 X129.861 Y138.137 E.03935
G1 X129.942 Y137.523
G1 X128.485 Y138.98 E.06334
G1 X128.013 Y138.918
G1 X130.023 Y136.909 E.08733
G1 X130.104 Y136.295
G1 X127.542 Y138.856 E.11132
G1 X127.071 Y138.794
G1 X130.185 Y135.68 E.13531
G1 X130.266 Y135.066
G1 X126.6 Y138.732 E.1593
G1 X126.129 Y138.67
G1 X130.346 Y134.452 E.18329
G1 X130.427 Y133.838
G1 X125.657 Y138.608 E.20728
G1 X125.186 Y138.546
G1 X130.508 Y133.224 E.23127
G1 X130.589 Y132.61
G1 X125.189 Y138.01 E.23466
G1 X125.27 Y137.396
G1 X130.67 Y131.996 E.23466
G1 X130.751 Y131.382
G1 X125.351 Y136.782 E.23466
G1 X125.431 Y136.168
G1 X130.832 Y130.768 E.23466
G1 X130.912 Y130.153
G1 X125.512 Y135.554 E.23466
G1 X125.593 Y134.939
G1 X130.993 Y129.539 E.23466
G1 X130.896 Y129.104
G1 X125.674 Y134.325 E.22691
G1 X125.755 Y133.711
G1 X130.425 Y129.042 E.20292
G1 X129.953 Y128.979
G1 X125.836 Y133.097 E.17893
G1 X125.917 Y132.483
G1 X129.482 Y128.917 E.15494
M73 P45 R10
G1 X129.011 Y128.855
G1 X125.997 Y131.869 E.13095
G1 X126.078 Y131.255
G1 X128.517 Y128.816 E.10597
G1 X127.903 Y128.897
G1 X126.159 Y130.641 E.07577
G1 X126.24 Y130.027
G1 X127.289 Y128.978 E.04557
M204 S10000
G1 X130.658 Y129.075 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.122947
G1 F5051
M204 S6000
G1 X130.458 Y129.075 E.00131
M204 S10000
G1 X130.792 Y128.784 F42000
; LINE_WIDTH: 0.508087
G1 F5051
M204 S6000
G1 X130.577 Y128.784 E.00817
; LINE_WIDTH: 0.459715
G1 X130.361 Y128.784 E.00732
; LINE_WIDTH: 0.411343
G1 X130.146 Y128.784 E.00647
; LINE_WIDTH: 0.362971
G1 X129.93 Y128.784 E.00562
; LINE_WIDTH: 0.314598
G1 X129.715 Y128.784 E.00477
; LINE_WIDTH: 0.266226
G1 X129.499 Y128.784 E.00392
; LINE_WIDTH: 0.217854
G1 X129.284 Y128.784 E.00307
; LINE_WIDTH: 0.169482
G1 X129.068 Y128.784 E.00222
; LINE_WIDTH: 0.12111
G1 X128.853 Y128.784 E.00137
; WIPE_START
G1 F15000
G1 X129.068 Y128.784 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I1.136 J-.437 P1  F42000
G1 X124.026 Y115.664 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.479034
G1 F5051
M204 S6000
G1 X124.236 Y117.265 E.05736
; WIPE_START
G1 F8254.737
G1 X124.026 Y115.664 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.999 Y117.978 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.191725
G1 F5051
M204 S6000
G1 X126.143 Y126.678 E.1064
; WIPE_START
G1 F15000
G1 X125.882 Y124.695 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.747 Y129.572 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.286807
G1 F5051
M204 S6000
G1 X124.627 Y138.081 E.17055
; WIPE_START
G1 F14760.969
G1 X124.888 Y136.098 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.323 Y138.831 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.28667
G1 F5051
M204 S6000
G1 X131.64 Y128.797 E.20101
M204 S10000
G1 X132.032 Y128.342 F42000
; LINE_WIDTH: 0.387818
G1 F5051
M204 S6000
G1 X132.014 Y128 E.00962
; LINE_WIDTH: 0.423322
G1 X131.983 Y127.596 E.01255
; LINE_WIDTH: 0.467128
G2 X131.888 Y126.735 I-19.736 J1.74 E.02995
; WIPE_START
G1 F8486.401
G1 X131.983 Y127.596 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.125 Y126.022 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F5051
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
; LINE_WIDTH: 0.48084
G1 F5051
M204 S6000
G1 X130.321 Y114.835 E.05761
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.685
G1 X130.531 Y116.436 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/68
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z2.8 I-1.13 J-.452 P1  F42000
G1 X126.029 Y127.704 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4445
M204 S5000
G1 X129.64 Y127.229 E.11193
G1 X131.501 Y126.984 E.05768
G1 X131.661 Y128.193 E.03749
G1 X126.188 Y128.914 E.16961
G1 X126.036 Y127.764 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.015 Y127.47 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I.586 J-1.067 P1  F42000
G1 X126.412 Y126.59 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4445
M204 S6000
G1 X126.446 Y126.843 E.00849
G1 X125.894 Y126.916 E.01846
G1 X124.697 Y117.812 E.30458
G1 X125.247 Y117.74 E.01841
G1 X126.404 Y126.53 E.2941
; WIPE_START
G1 F8843.478
G1 X126.446 Y126.843 E-.12004
G1 X125.894 Y126.916 E-.21152
G1 X125.747 Y125.798 E-.42845
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I-.109 J1.212 P1  F42000
G1 X130.876 Y126.26 Z3
G1 Z2.6
G1 E.8 F1800
G1 F4445
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
G1 F4445
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
G1 F4445
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
G3 Z3 I-.864 J.857 P1  F42000
G1 X129.343 Y126.872 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4445
M204 S6000
G1 X125.543 Y127.373 E.12714
G1 X124.24 Y117.462 E.33158
G1 X130.58 Y116.627 E.21211
G1 X131.884 Y126.538 E.33158
G1 X129.403 Y126.864 E.08303
; WIPE_START
G1 F8843.478
G1 X127.42 Y127.126 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.254 Y134.534 Z3 F42000
G1 X130.267 Y138.626 Z3
G1 Z2.6
G1 E.8 F1800
G1 F4445
M204 S6000
G1 X129.715 Y138.553 E.01847
G1 X130.961 Y129.091 E.31658
G1 X131.533 Y129.016 E.01912
G1 X130.275 Y138.566 E.31954
M204 S10000
G1 X130.618 Y139.083 F42000
G1 F4445
M204 S6000
G1 X129.259 Y138.904 E.04547
G1 X130.49 Y129.552 E.31289
G1 X128.231 Y129.254 E.07559
G1 X128.231 Y129.04 E.0071
G1 X131.979 Y128.547 E.1254
G1 X131.961 Y128.808 E.00869
G1 X130.626 Y139.023 E.34173
; WIPE_START
G1 F8843.478
G1 X129.259 Y138.904 E-.5214
G1 X129.341 Y138.281 E-.2386
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.849 Y131.067 Z3 F42000
G1 X126.375 Y129.695 Z3
G1 Z2.6
G1 E.8 F1800
G1 F4445
M204 S6000
G1 X125.32 Y137.709 E.26813
G1 X125.285 Y137.97 E.00873
G1 X124.733 Y137.897 E.01847
G1 X125.803 Y129.77 E.27191
G1 X126.315 Y129.703 E.01713
; WIPE_START
G1 F8843.478
G1 X126.069 Y131.688 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.756 Y128.638 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F4445
M204 S6000
G1 X125.85 Y129.354 E.02395
G1 X126.848 Y129.222 E.03337
G1 X125.636 Y138.427 E.30796
G1 X124.277 Y138.248 E.04547
G1 X125.542 Y128.638 E.32153
G1 X125.696 Y128.638 E.00511
; WIPE_START
G1 F8843.478
G1 X125.85 Y129.354 E-.27826
G1 X126.848 Y129.222 E-.38226
G1 X126.813 Y129.482 E-.09948
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.05 Y129.889 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4445
M204 S5000
G1 X128.918 Y138.485 E.26641
G1 X126.073 Y138.111 E.08819
G1 X126.112 Y137.813 E.00921
G1 X127.205 Y129.515 E.2572
G1 X129.991 Y129.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.743 Y131.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I1.15 J-.397 P1  F42000
G1 X124.622 Y117.016 Z3
G1 Z2.6
G1 E.8 F1800
G1 F4445
M204 S5000
G1 X124.462 Y115.807 E.03749
G1 X128.074 Y115.331 E.11193
G1 X129.935 Y115.086 E.05768
G1 X130.094 Y116.296 E.03749
G1 X124.681 Y117.009 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.462 Y115.807 E-.46416
G1 X125.234 Y115.705 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I-1.182 J.288 P1  F42000
G1 X130.982 Y139.319 Z3
G1 Z2.6
G1 E.8 F1800
G1 F4445
M204 S5000
G3 X130.756 Y139.491 I-.194 J-.02 E.00978
G1 X124.212 Y138.635 E.20279
G3 X123.89 Y138.518 I-.021 J-.443 E.01081
G1 X123.879 Y138.497 E.00072
G3 X123.864 Y138.381 I.23 J-.089 E.00364
G1 X125.188 Y128.322 E.31174
G2 X125.188 Y127.678 I-4.381 J-.322 E.01982
G1 X123.612 Y115.693 E.37142
G3 X123.771 Y115.501 I.199 J.002 E.00828
G1 X130.51 Y114.613 E.20887
G3 X130.584 Y114.615 I.029 J.214 E.00229
G3 X130.733 Y114.785 I-.044 J.188 E.00741
G1 X132.306 Y126.736 E.37038
G3 X132.306 Y129.264 I-10.791 J1.264 E.07785
G1 X130.99 Y139.26 E.3098
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.954 Y139.402 E-.05574
G1 X130.907 Y139.456 E-.02713
G1 X130.847 Y139.486 E-.02553
G1 X130.756 Y139.491 E-.03455
G1 X129.146 Y139.281 E-.61706
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X129.063 Y138.889 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.413377
G1 F4445
M204 S6000
G1 X125.829 Y138.463 E.09847
; WIPE_START
G1 F9717.735
M73 P46 R10
G1 X127.812 Y138.724 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.11 Y137.742 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.192379
G1 F4445
M204 S6000
G1 X125.046 Y137.658 E.00129
G1 X126.062 Y129.942 E.09478
; WIPE_START
G1 F15000
G1 X125.801 Y131.925 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.055 Y129.147 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.41008
G1 F4445
M204 S6000
G1 X127.382 Y129.147 E.00976
; LINE_WIDTH: 0.458955
G1 X127.708 Y129.147 E.01106
; LINE_WIDTH: 0.507831
G1 X128.034 Y129.147 E.01236
; WIPE_START
G1 F7743.432
M73 P46 R9
G1 X127.708 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.156 Y129.147 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.119094
G1 F4445
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
; LINE_WIDTH: 0.192585
G1 F4445
M204 S6000
G1 X130.018 Y138.388 E.11225
; WIPE_START
G1 F15000
G1 X130.279 Y136.405 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.076 Y129.097 Z3 F42000
G1 X124.026 Y115.665 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.479032
G1 F4445
M204 S6000
G1 X124.236 Y117.265 E.05735
; WIPE_START
G1 F8254.77
G1 X124.026 Y115.665 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.999 Y117.978 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.191725
G1 F4445
M204 S6000
G1 X126.143 Y126.678 E.1064
; WIPE_START
G1 F15000
G1 X125.882 Y124.695 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I-.621 J1.047 P1  F42000
G1 X132.032 Y128.342 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.387809
G1 F4445
M204 S6000
G1 X132.014 Y128 E.00962
; LINE_WIDTH: 0.423336
G1 X131.983 Y127.596 E.01255
; LINE_WIDTH: 0.467123
G2 X131.888 Y126.735 I-19.778 J1.745 E.02995
; WIPE_START
G1 F8486.509
G1 X131.983 Y127.596 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.125 Y126.022 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4445
M204 S6000
G1 X129.98 Y117.322 E.10701
; WIPE_START
G1 F15000
G1 X130.241 Y119.305 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.531 Y116.436 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.480857
G1 F4445
M204 S6000
G1 X130.321 Y114.835 E.05761
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.374
G1 X130.531 Y116.436 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/68
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z3 I-1.13 J-.452 P1  F42000
G1 X126.029 Y127.704 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4383
M204 S5000
G1 X129.446 Y127.254 E.1059
G1 X131.501 Y126.984 E.06371
G1 X131.661 Y128.193 E.03749
G1 X126.188 Y128.914 E.16961
G1 X126.036 Y127.764 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.014 Y127.468 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y126.59 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4383
M204 S6000
G1 X126.446 Y126.843 E.00849
G1 X125.894 Y126.916 E.01846
G1 X124.697 Y117.812 E.30457
G1 X125.247 Y117.74 E.01841
G1 X126.404 Y126.53 E.2941
; WIPE_START
G1 F8843.478
G1 X126.446 Y126.843 E-.12002
G1 X125.894 Y126.916 E-.21152
G1 X125.747 Y125.798 E-.42846
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.876 Y126.26 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F4383
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
G1 F4383
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
G1 F4383
M204 S5000
G1 X126.073 Y117.889 E.2664
G1 X126.466 Y117.838 E.01218
G1 X128.918 Y117.515 E.07601
G1 X130.05 Y126.111 E.2664
G1 X127.264 Y126.477 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.989 Y124.496 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.339 Y126.873 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4383
M204 S6000
G1 X125.543 Y127.373 E.127
G1 X124.24 Y117.462 E.33158
G1 X130.58 Y116.627 E.21211
G1 X131.884 Y126.538 E.33158
G1 X129.399 Y126.865 E.08317
; WIPE_START
G1 F8843.478
G1 X127.416 Y127.126 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.249 Y134.535 Z3.2 F42000
G1 X130.265 Y138.641 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F4383
M204 S6000
G1 X129.713 Y138.568 E.01847
G1 X130.961 Y129.091 E.31708
G1 X131.533 Y129.016 E.01912
G1 X130.273 Y138.581 E.32004
M204 S10000
G1 X130.616 Y139.098 F42000
G1 F4383
M204 S6000
G1 X129.257 Y138.919 E.04547
G1 X130.49 Y129.552 E.3134
G1 X128.231 Y129.254 E.07559
G1 X128.231 Y129.04 E.0071
G1 X131.979 Y128.547 E.1254
G1 X131.961 Y128.808 E.00869
G1 X130.624 Y139.038 E.34224
; WIPE_START
G1 F8843.478
G1 X129.257 Y138.919 E-.52141
G1 X129.339 Y138.296 E-.23859
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.852 Y131.08 Z3.2 F42000
G1 X126.375 Y129.695 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F4383
M204 S6000
G1 X125.343 Y137.531 E.26219
G1 X125.283 Y137.985 E.01519
G1 X124.731 Y137.913 E.01847
G1 X125.803 Y129.77 E.27243
G1 X126.315 Y129.703 E.01713
; WIPE_START
G1 F8843.478
G1 X126.069 Y131.688 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.756 Y128.638 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F4383
M204 S6000
G1 X125.85 Y129.354 E.02395
G1 X126.848 Y129.222 E.03337
G1 X125.634 Y138.442 E.30847
G1 X124.275 Y138.263 E.04547
G1 X125.542 Y128.638 E.32205
G1 X125.696 Y128.638 E.00511
; WIPE_START
G1 F8843.478
G1 X125.85 Y129.354 E-.27828
G1 X126.848 Y129.222 E-.38224
G1 X126.813 Y129.482 E-.09948
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.05 Y129.889 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4383
M204 S5000
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.135 Y137.636 E.01472
G1 X127.205 Y129.515 E.25169
G1 X129.99 Y129.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.743 Y131.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.255 Y124.651 Z3.2 F42000
G1 X124.622 Y117.016 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F4383
M204 S5000
G1 X124.462 Y115.807 E.03749
G1 X127.879 Y115.357 E.1059
G1 X129.935 Y115.086 E.06371
G1 X130.094 Y116.296 E.03749
G1 X124.681 Y117.009 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.462 Y115.807 E-.46416
G1 X125.234 Y115.705 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.037 Y123.122 Z3.2 F42000
G1 X130.98 Y139.336 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F4383
M204 S5000
G3 X130.755 Y139.511 I-.196 J-.019 E.00979
G1 X124.033 Y138.627 E.20832
G3 X123.861 Y138.398 I.02 J-.194 E.00987
G1 X125.188 Y128.322 E.31227
G2 X125.188 Y127.678 I-4.381 J-.322 E.01982
G1 X123.612 Y115.693 E.37143
G3 X123.77 Y115.501 I.199 J.002 E.00827
G1 X130.51 Y114.613 E.20889
G3 X130.581 Y114.615 I.029 J.211 E.0022
G3 X130.733 Y114.785 I-.041 J.189 E.00748
G1 X132.306 Y126.736 E.37038
G3 X132.306 Y129.264 I-10.793 J1.264 E.07785
G1 X130.988 Y139.277 E.31032
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.956 Y139.413 E-.05312
G1 X130.894 Y139.482 E-.03539
G1 X130.84 Y139.507 E-.02241
G1 X130.755 Y139.511 E-.03234
G1 X129.146 Y139.3 E-.61675
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X129.062 Y138.896 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.428678
G1 F4383
M204 S6000
G1 X125.828 Y138.471 E.10253
; WIPE_START
G1 F9332.283
G1 X127.811 Y138.732 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P47 R9
G1 X125.034 Y137.747 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.192597
G1 F4383
M204 S6000
G1 X126.062 Y129.942 E.09602
; WIPE_START
G1 F15000
G1 X125.801 Y131.925 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.055 Y129.147 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.410076
G1 F4383
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
G1 X129.156 Y129.147 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.119094
G1 F4383
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
; LINE_WIDTH: 0.340797
G1 X130.35 Y129.147 E.00483
; LINE_WIDTH: 0.385138
G1 X130.549 Y129.147 E.00555
; LINE_WIDTH: 0.429479
G1 X130.748 Y129.147 E.00627
M204 S10000
G1 X131.219 Y129.263 F42000
; LINE_WIDTH: 0.192592
G1 F4383
M204 S6000
G1 X130.016 Y138.403 E.11244
; WIPE_START
G1 F15000
G1 X130.277 Y136.42 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.076 Y129.112 Z3.2 F42000
G1 X124.026 Y115.665 Z3.2
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.479014
G1 F4383
M204 S6000
G1 X124.237 Y117.265 E.05735
; WIPE_START
G1 F8255.105
G1 X124.026 Y115.665 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.999 Y117.978 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.191713
G1 F4383
M204 S6000
G1 X126.143 Y126.678 E.10639
; WIPE_START
G1 F15000
G1 X125.882 Y124.695 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.032 Y128.342 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.387808
G1 F4383
M204 S6000
G1 X132.014 Y128 E.00962
; LINE_WIDTH: 0.42333
G1 X131.983 Y127.596 E.01256
; LINE_WIDTH: 0.467126
G2 X131.888 Y126.735 I-19.758 J1.743 E.02995
; WIPE_START
G1 F8486.448
G1 X131.983 Y127.596 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.125 Y126.022 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4383
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
; LINE_WIDTH: 0.480841
G1 F4383
M204 S6000
G1 X130.321 Y114.835 E.05761
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.664
G1 X130.531 Y116.436 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/68
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z3.2 I-1.13 J-.452 P1  F42000
G1 X126.029 Y127.704 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4393
M204 S5000
G1 X129.251 Y127.28 E.09988
G1 X131.501 Y126.984 E.06974
G1 X131.661 Y128.193 E.03749
G1 X126.188 Y128.914 E.16961
G1 X126.036 Y127.764 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.014 Y127.466 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y126.59 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4393
M204 S6000
G1 X126.446 Y126.843 E.00849
G1 X125.894 Y126.916 E.01846
G1 X124.697 Y117.812 E.30457
G1 X125.247 Y117.74 E.01841
G1 X126.404 Y126.53 E.2941
; WIPE_START
G1 F8843.478
G1 X126.446 Y126.843 E-.12002
G1 X125.894 Y126.916 E-.21152
G1 X125.747 Y125.798 E-.42846
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.876 Y126.26 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F4393
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
G1 F4393
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
G1 F4393
M204 S5000
G1 X126.073 Y117.889 E.2664
G1 X126.519 Y117.831 E.01382
G1 X128.918 Y117.515 E.07437
G1 X130.05 Y126.111 E.2664
G1 X127.264 Y126.477 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.989 Y124.496 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.33 Y126.874 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4393
M204 S6000
G1 X125.543 Y127.373 E.12671
G1 X124.24 Y117.462 E.33158
G1 X130.58 Y116.627 E.21211
G1 X131.884 Y126.538 E.33158
G1 X129.39 Y126.866 E.08346
; WIPE_START
G1 F8843.478
G1 X127.407 Y127.127 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.236 Y134.537 Z3.4 F42000
G1 X130.26 Y138.683 Z3.4
G1 Z3
G1 E.8 F1800
G1 F4393
M204 S6000
G1 X129.708 Y138.612 E.01847
G1 X130.961 Y129.091 E.31856
G1 X131.533 Y129.016 E.01912
G1 X130.268 Y138.624 E.32145
M204 S10000
G1 X130.61 Y139.138 F42000
G1 F4393
M204 S6000
G3 X129.251 Y138.964 I22.01 J-176.509 E.04547
G1 X130.49 Y129.552 E.3149
G1 X128.231 Y129.254 E.07559
G1 X128.231 Y129.04 E.0071
G1 X131.979 Y128.547 E.1254
G1 X131.961 Y128.808 E.00869
G1 X130.618 Y139.079 E.3436
; WIPE_START
G1 F8843.478
G1 X129.251 Y138.964 E-.52147
G1 X129.333 Y138.341 E-.23853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.862 Y131.12 Z3.4 F42000
G1 X126.375 Y129.695 Z3.4
G1 Z3
G1 E.8 F1800
G1 F4393
M204 S6000
G1 X125.367 Y137.354 E.25624
G1 X125.278 Y138.03 E.02262
G3 X124.726 Y137.957 I18.099 J-139.818 E.01847
G1 X125.803 Y129.77 E.27391
G1 X126.315 Y129.703 E.01713
; WIPE_START
G1 F8843.478
G1 X126.069 Y131.688 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.756 Y128.638 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F4393
M204 S6000
G1 X125.85 Y129.354 E.02395
G1 X126.848 Y129.222 E.03337
G1 X125.628 Y138.486 E.30995
G3 X124.269 Y138.307 I41.768 J-322.077 E.04547
G1 X125.542 Y128.638 E.32351
G1 X125.696 Y128.638 E.00511
; WIPE_START
G1 F8843.478
G1 X125.85 Y129.354 E-.27826
G1 X126.848 Y129.222 E-.38225
G1 X126.813 Y129.482 E-.09949
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.05 Y129.889 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4393
M204 S5000
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.159 Y137.458 E.02023
G1 X127.205 Y129.515 E.24618
G1 X129.991 Y129.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.743 Y131.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.255 Y124.651 Z3.4 F42000
G1 X124.622 Y117.016 Z3.4
G1 Z3
G1 E.8 F1800
G1 F4393
M204 S5000
G1 X124.462 Y115.807 E.03749
G1 X127.685 Y115.383 E.09987
G1 X129.935 Y115.086 E.06974
G1 X130.094 Y116.296 E.03749
G1 X124.681 Y117.009 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.462 Y115.807 E-.46416
G1 X125.234 Y115.705 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.034 Y123.122 Z3.4 F42000
G1 X130.975 Y139.37 Z3.4
G1 Z3
G1 E.8 F1800
G1 F4393
M204 S5000
G3 X130.749 Y139.551 I-.201 J-.019 E.00995
G1 X130.597 Y139.532 E.0047
G1 X129.402 Y139.379 E.03702
G1 X127.239 Y139.094 E.06705
G3 X126.284 Y138.964 I6.832 J-54.075 E.02962
G1 X126.241 Y138.959 E.00133
G3 X125.35 Y138.845 I8.142 J-67.471 E.0276
G1 X124.755 Y138.767 E.01844
G3 X124.057 Y138.671 I1.711 J-15.03 E.02165
G1 X124.031 Y138.667 E.00082
G3 X123.857 Y138.432 I.022 J-.198 E.01009
G1 X125.188 Y128.322 E.31333
G2 X125.188 Y127.678 I-4.389 J-.322 E.01982
G1 X123.612 Y115.693 E.37143
G3 X123.772 Y115.5 I.199 J.002 E.00833
G1 X130.51 Y114.613 E.20881
G3 X130.584 Y114.616 I.029 J.213 E.0023
G3 X130.733 Y114.785 I-.044 J.188 E.00738
G1 X132.306 Y126.736 E.37039
G3 X132.306 Y129.264 I-10.793 J1.264 E.07785
G1 X130.983 Y139.31 E.31136
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.917 Y139.496 E-.07482
G1 X130.831 Y139.546 E-.03793
G1 X130.749 Y139.551 E-.03124
G1 X130.597 Y139.532 E-.05812
G1 X129.402 Y139.379 E-.45778
G1 X129.141 Y139.345 E-.10011
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X129.059 Y138.919 F42000
M73 P48 R9
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.472667
G1 F4393
M204 S6000
G2 X125.825 Y138.493 I-113.922 J852.355 E.11423
; WIPE_START
G1 F8377.039
G1 X127.808 Y138.754 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.028 Y137.792 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.192581
G1 F4393
M204 S6000
G1 X126.062 Y129.942 E.09656
; WIPE_START
G1 F15000
G1 X125.801 Y131.925 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.055 Y129.147 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.410075
G1 F4393
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
G1 X129.156 Y129.147 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.119093
G1 F4393
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
; LINE_WIDTH: 0.192578
G1 F4393
M204 S6000
G1 X130.01 Y138.446 E.11296
; WIPE_START
G1 F15000
G1 X130.271 Y136.463 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.076 Y129.153 Z3.4 F42000
G1 X124.026 Y115.664 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.479018
G1 F4393
M204 S6000
G1 X124.237 Y117.265 E.05736
; WIPE_START
G1 F8255.04
G1 X124.026 Y115.664 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.999 Y117.978 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.191713
G1 F4393
M204 S6000
G1 X126.143 Y126.678 E.10639
; WIPE_START
G1 F15000
G1 X125.882 Y124.695 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.032 Y128.342 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.387818
G1 F4393
M204 S6000
G1 X132.014 Y128 E.00962
; LINE_WIDTH: 0.423322
G1 X131.983 Y127.596 E.01255
; LINE_WIDTH: 0.467128
G2 X131.888 Y126.735 I-19.736 J1.74 E.02995
; WIPE_START
G1 F8486.401
G1 X131.983 Y127.596 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.125 Y126.022 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.192587
G1 F4393
M204 S6000
G1 X129.98 Y117.322 E.10702
; WIPE_START
G1 F15000
G1 X130.241 Y119.305 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.531 Y116.436 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.480851
G1 F4393
M204 S6000
G1 X130.321 Y114.835 E.05761
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.48
G1 X130.531 Y116.436 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/68
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z3.4 I-1.13 J-.452 P1  F42000
G1 X126.029 Y127.704 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4403
M204 S5000
G1 X129.057 Y127.305 E.09385
G1 X131.501 Y126.984 E.07577
G1 X131.661 Y128.193 E.03749
G1 X126.188 Y128.914 E.16961
G1 X126.036 Y127.764 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.014 Y127.464 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y126.59 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4403
M204 S6000
G1 X126.446 Y126.843 E.00849
G1 X125.894 Y126.916 E.01846
G1 X124.697 Y117.812 E.30457
G1 X125.247 Y117.74 E.01841
G1 X126.404 Y126.53 E.2941
; WIPE_START
G1 F8843.478
G1 X126.446 Y126.843 E-.12003
G1 X125.894 Y126.916 E-.21152
G1 X125.747 Y125.798 E-.42845
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.876 Y126.26 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
G1 F4403
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
G1 F4403
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
G1 F4403
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
G1 X129.317 Y126.876 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4403
M204 S6000
G1 X125.543 Y127.373 E.12627
G1 X124.24 Y117.462 E.33158
G1 X130.58 Y116.627 E.21211
G1 X131.884 Y126.538 E.33158
G1 X129.377 Y126.868 E.0839
; WIPE_START
G1 F8843.478
G1 X127.394 Y127.129 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.218 Y134.54 Z3.6 F42000
G1 X130.252 Y138.741 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F4403
M204 S6000
G1 X129.7 Y138.668 E.01847
G1 X130.961 Y129.091 E.32042
G1 X131.533 Y129.016 E.01912
G1 X130.26 Y138.681 E.32338
M204 S10000
G1 X130.603 Y139.198 F42000
G1 F4403
M204 S6000
G2 X129.243 Y139.024 I-7.071 J50.037 E.04548
G1 X130.49 Y129.552 E.31693
G1 X128.231 Y129.254 E.07559
G1 X128.231 Y129.04 E.0071
G1 X131.979 Y128.547 E.1254
G1 X131.961 Y128.808 E.00869
G1 X130.61 Y139.138 E.34559
; WIPE_START
G1 F8843.478
G1 X129.243 Y139.024 E-.5215
G1 X129.325 Y138.402 E-.2385
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.876 Y131.173 Z3.6 F42000
G1 X126.375 Y129.695 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F4403
M204 S6000
G1 X125.39 Y137.176 E.25029
G1 X125.27 Y138.083 E.03037
G3 X124.718 Y138.015 I1.018 J-10.465 E.01847
G1 X125.803 Y129.77 E.27585
G1 X126.315 Y129.703 E.01713
; WIPE_START
G1 F8843.478
G1 X126.07 Y131.688 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.756 Y128.638 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
G1 F4403
M204 S6000
G1 X125.85 Y129.354 E.02395
G1 X126.848 Y129.222 E.03337
G1 X125.62 Y138.545 E.31192
G3 X124.261 Y138.364 I17.372 J-135.562 E.04547
G1 X125.542 Y128.638 E.32542
G1 X125.696 Y128.638 E.00511
; WIPE_START
G1 F8843.478
G1 X125.85 Y129.354 E-.27826
G1 X126.848 Y129.222 E-.38225
G1 X126.813 Y129.482 E-.09948
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.05 Y129.889 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4403
M204 S5000
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.182 Y137.28 E.02574
G1 X127.205 Y129.515 E.24066
G1 X129.991 Y129.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.743 Y131.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.255 Y124.651 Z3.6 F42000
G1 X124.622 Y117.016 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F4403
M204 S5000
G1 X124.462 Y115.807 E.03749
G1 X127.49 Y115.408 E.09385
G1 X129.935 Y115.086 E.07577
G1 X130.094 Y116.296 E.03749
G1 X124.681 Y117.009 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.462 Y115.807 E-.46416
G1 X125.234 Y115.705 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.028 Y123.124 Z3.6 F42000
G1 X130.969 Y139.42 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F4403
M204 S5000
G3 X130.899 Y139.562 I-.25 J-.035 E.00494
G1 X130.893 Y139.568 E.00027
G1 X130.854 Y139.593 E.00142
G1 X130.819 Y139.607 E.00117
G1 X130.783 Y139.613 E.0011
G1 X130.741 Y139.611 E.00129
G2 X129.287 Y139.424 I-7.629 J53.538 E.04506
G1 X128.646 Y139.341 E.01985
G3 X128.348 Y139.301 I.093 J-1.864 E.00927
G2 X126.809 Y139.103 I-12.58 J91.596 E.04767
G1 X126.697 Y139.083 E.0035
G1 X126.393 Y139.046 E.00939
G1 X126.191 Y139.013 E.00631
G3 X124.021 Y138.727 I20.314 J-162.613 E.06724
G1 X123.98 Y138.717 E.0013
G1 X123.947 Y138.702 E.0011
G1 X123.916 Y138.679 E.00118
G1 X123.886 Y138.645 E.00141
G1 X123.878 Y138.632 E.00046
G1 X123.855 Y138.577 E.00185
G3 X123.85 Y138.483 I.253 J-.059 E.00291
G1 X125.188 Y128.322 E.3149
G2 X125.188 Y127.679 I-4.136 J-.323 E.0198
G1 X123.612 Y115.693 E.37146
G3 X123.77 Y115.501 I.199 J.002 E.00826
G1 X130.51 Y114.613 E.20888
G3 X130.584 Y114.616 I.029 J.214 E.00232
G3 X130.733 Y114.785 I-.044 J.188 E.00739
G1 X132.306 Y126.736 E.37039
G3 X132.306 Y129.264 I-10.791 J1.264 E.07785
G1 X130.977 Y139.361 E.31292
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.942 Y139.505 E-.0566
G1 X130.899 Y139.562 E-.02696
G1 X130.893 Y139.568 E-.00331
G1 X130.854 Y139.593 E-.01761
G1 X130.819 Y139.607 E-.01444
G1 X130.783 Y139.613 E-.01359
G1 X130.741 Y139.611 E-.01599
M73 P49 R9
G1 X129.287 Y139.424 E-.55729
G1 X129.145 Y139.406 E-.0542
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X129.055 Y138.949 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.534103
G1 F4403
M204 S6000
G1 X128.69 Y138.901 E.01475
G3 X125.821 Y138.522 I221.454 J-1686.683 E.11581
; WIPE_START
G1 F7329.242
G1 X127.804 Y138.784 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.02 Y137.85 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.192581
G1 F4403
M204 S6000
G1 X126.062 Y129.942 E.09728
; WIPE_START
G1 F15000
G1 X125.801 Y131.925 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.055 Y129.147 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.410076
G1 F4403
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
G1 X129.156 Y129.147 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.119094
G1 F4403
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
; LINE_WIDTH: 0.192597
G1 F4403
M204 S6000
G1 X130.003 Y138.503 E.11367
; WIPE_START
G1 F15000
G1 X130.264 Y136.52 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.077 Y129.207 Z3.6 F42000
G1 X124.026 Y115.665 Z3.6
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.478999
G1 F4403
M204 S6000
G1 X124.236 Y117.265 E.05735
; WIPE_START
G1 F8255.398
G1 X124.026 Y115.665 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.999 Y117.978 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.191714
G1 F4403
M204 S6000
G1 X126.143 Y126.678 E.10639
; WIPE_START
G1 F15000
G1 X125.882 Y124.695 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.032 Y128.342 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.387819
G1 F4403
M204 S6000
G1 X132.014 Y128 E.00962
; LINE_WIDTH: 0.423332
G1 X131.983 Y127.596 E.01255
; LINE_WIDTH: 0.467132
G2 X131.888 Y126.735 I-19.739 J1.741 E.02995
; WIPE_START
G1 F8486.323
G1 X131.983 Y127.596 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.125 Y126.022 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4403
M204 S6000
G1 X129.98 Y117.322 E.10701
; WIPE_START
G1 F15000
G1 X130.241 Y119.305 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.531 Y116.436 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.480867
G1 F4403
M204 S6000
G1 X130.321 Y114.835 E.05761
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.188
G1 X130.531 Y116.436 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/68
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z3.6 I-1.13 J-.452 P1  F42000
G1 X126.029 Y127.704 Z3.6
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4417
M204 S5000
G1 X128.862 Y127.331 E.08782
G1 X131.501 Y126.984 E.08179
G1 X131.661 Y128.193 E.03749
G1 X126.188 Y128.914 E.16961
G1 X126.036 Y127.764 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.013 Y127.461 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y126.59 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4417
M204 S6000
G1 X126.446 Y126.843 E.00849
G1 X125.894 Y126.916 E.01846
G1 X124.697 Y117.812 E.30457
G1 X125.247 Y117.74 E.01841
G1 X126.404 Y126.53 E.2941
; WIPE_START
G1 F8843.478
G1 X126.446 Y126.843 E-.12003
G1 X125.894 Y126.916 E-.21151
G1 X125.747 Y125.798 E-.42846
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.876 Y126.26 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F4417
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
G1 F4417
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
G1 F4417
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
G1 X129.3 Y126.878 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4417
M204 S6000
G1 X125.543 Y127.373 E.12569
G1 X124.24 Y117.462 E.33158
G1 X130.58 Y116.627 E.21211
G1 X131.884 Y126.538 E.33158
G1 X129.359 Y126.87 E.08448
; WIPE_START
G1 F8843.478
G1 X127.377 Y127.131 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.192 Y134.545 Z3.8 F42000
G1 X130.241 Y138.828 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F4417
M204 S6000
G1 X129.69 Y138.75 E.01847
G1 X130.961 Y129.091 E.32316
G1 X131.533 Y129.016 E.01912
G1 X130.249 Y138.768 E.32629
M204 S10000
G1 X130.592 Y139.28 F42000
G1 F4417
M204 S6000
G3 X129.233 Y139.098 I10.739 J-85.397 E.04547
G1 X130.49 Y129.552 E.3194
G1 X128.231 Y129.254 E.07559
G1 X128.231 Y129.04 E.0071
G1 X131.979 Y128.547 E.1254
G1 X131.961 Y128.808 E.00869
G1 X130.6 Y139.221 E.34834
; WIPE_START
G1 F8843.478
G1 X129.233 Y139.098 E-.52136
G1 X129.315 Y138.476 E-.23864
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.891 Y131.238 Z3.8 F42000
G1 X126.375 Y129.695 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F4417
M204 S6000
G1 X125.413 Y136.998 E.24434
G1 X125.259 Y138.168 E.03915
G1 X124.707 Y138.098 E.01847
G1 X125.803 Y129.77 E.27862
G1 X126.315 Y129.703 E.01713
; WIPE_START
G1 F8843.478
G1 X126.07 Y131.688 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.756 Y128.638 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F4417
M204 S6000
G1 X125.85 Y129.354 E.02395
G1 X126.848 Y129.222 E.03337
G1 X125.61 Y138.623 E.31453
G3 X124.251 Y138.445 I5.453 J-46.951 E.04548
G1 X125.542 Y128.638 E.32813
G1 X125.696 Y128.638 E.00511
; WIPE_START
G1 F8843.478
G1 X125.85 Y129.354 E-.27829
G1 X126.848 Y129.222 E-.38224
G1 X126.813 Y129.482 E-.09947
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.05 Y129.889 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4417
M204 S5000
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.206 Y137.102 E.03125
G1 X127.205 Y129.515 E.23515
G1 X129.991 Y129.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.743 Y131.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.255 Y124.651 Z3.8 F42000
G1 X124.622 Y117.016 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F4417
M204 S5000
G1 X124.462 Y115.807 E.03749
G1 X127.296 Y115.434 E.08782
G1 X129.935 Y115.086 E.08179
G1 X130.094 Y116.296 E.03749
G1 X124.681 Y117.009 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.462 Y115.807 E-.46416
G1 X125.234 Y115.705 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.021 Y123.126 Z3.8 F42000
G1 X130.96 Y139.487 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F4417
M204 S5000
G3 X130.917 Y139.601 I-.272 J-.038 E.00375
G1 X130.904 Y139.621 E.00075
G1 X130.896 Y139.63 E.00038
G1 X130.854 Y139.665 E.00167
G1 X130.845 Y139.671 E.00035
G1 X130.811 Y139.685 E.00114
G1 X130.793 Y139.69 E.00056
G3 X130.729 Y139.691 I-.035 J-.181 E.00196
G3 X129.321 Y139.505 I3.37 J-30.963 E.04366
G1 X128.903 Y139.45 E.01295
G3 X128.071 Y139.341 I.262 J-5.194 E.0258
G1 X127.253 Y139.234 E.02537
G3 X126.228 Y139.107 I16.971 J-141.325 E.03172
G2 X124.556 Y138.884 I-6.239 J40.368 E.05184
G1 X123.971 Y138.797 E.01818
G1 X123.939 Y138.782 E.00109
G1 X123.909 Y138.759 E.00117
G1 X123.881 Y138.727 E.00129
G1 X123.857 Y138.684 E.00152
G1 X123.85 Y138.665 E.00061
G3 X123.841 Y138.55 I.331 J-.082 E.00356
G1 X125.188 Y128.32 E.31706
G2 X125.188 Y127.678 I-3.543 J-.32 E.01977
G1 X123.612 Y115.693 E.37144
G3 X123.77 Y115.501 I.199 J.003 E.00825
G1 X130.51 Y114.613 E.20888
G3 X130.581 Y114.615 I.03 J.211 E.0022
G3 X130.733 Y114.785 I-.04 J.189 E.0075
G1 X132.306 Y126.736 E.37039
G3 X132.306 Y129.264 I-10.792 J1.264 E.07785
G1 X130.968 Y139.428 E.315
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.917 Y139.601 E-.06838
G1 X130.904 Y139.621 E-.00922
G1 X130.896 Y139.63 E-.00466
G1 X130.854 Y139.665 E-.02062
G1 X130.845 Y139.671 E-.00439
G1 X130.811 Y139.685 E-.01405
G1 X130.793 Y139.69 E-.00693
G1 X130.729 Y139.691 E-.02413
G1 X129.321 Y139.505 E-.53986
M73 P50 R9
G1 X129.144 Y139.482 E-.06779
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X129.05 Y138.984 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.615768
G1 F4417
M204 S6000
G3 X125.816 Y138.561 I44.404 J-351.977 E.15226
; WIPE_START
G1 F6284.388
G1 X127.799 Y138.821 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.01 Y137.931 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.192596
G1 F4417
M204 S6000
G1 X126.062 Y129.942 E.09829
; WIPE_START
G1 F15000
G1 X125.801 Y131.925 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.055 Y129.147 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.410076
G1 F4417
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
G1 X129.156 Y129.147 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.119094
G1 F4417
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
; LINE_WIDTH: 0.192593
G1 F4417
M204 S6000
G1 X129.992 Y138.587 E.11471
; WIPE_START
G1 F15000
G1 X130.253 Y136.604 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.077 Y129.288 Z3.8 F42000
G1 X124.026 Y115.665 Z3.8
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.479014
G1 F4417
M204 S6000
G1 X124.237 Y117.265 E.05735
; WIPE_START
G1 F8255.117
G1 X124.026 Y115.665 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.999 Y117.978 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.191703
G1 F4417
M204 S6000
G1 X126.143 Y126.678 E.10638
; WIPE_START
G1 F15000
G1 X125.882 Y124.695 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.032 Y128.342 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.387815
G1 F4417
M204 S6000
G1 X132.014 Y128 E.00962
; LINE_WIDTH: 0.42334
G1 X131.983 Y127.596 E.01256
; LINE_WIDTH: 0.467125
G2 X131.888 Y126.735 I-19.766 J1.743 E.02995
; WIPE_START
G1 F8486.464
G1 X131.983 Y127.596 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.125 Y126.022 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4417
M204 S6000
G1 X129.98 Y117.322 E.10701
; WIPE_START
G1 F15000
G1 X130.241 Y119.305 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.531 Y116.436 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.480851
G1 F4417
M204 S6000
G1 X130.321 Y114.835 E.05761
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.472
G1 X130.531 Y116.436 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/68
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z3.8 I-1.13 J-.452 P1  F42000
G1 X126.029 Y127.704 Z3.8
G1 Z3.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4358
M204 S5000
G1 X128.668 Y127.357 E.08179
G1 X131.501 Y126.984 E.08782
G1 X131.661 Y128.193 E.03749
G1 X126.188 Y128.914 E.16961
G1 X126.036 Y127.764 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.013 Y127.458 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y126.59 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4358
M204 S6000
G1 X126.446 Y126.843 E.00849
G1 X125.894 Y126.916 E.01846
G1 X124.697 Y117.812 E.30457
G1 X125.247 Y117.74 E.01841
G1 X126.404 Y126.53 E.2941
; WIPE_START
G1 F8843.478
G1 X126.446 Y126.843 E-.12002
G1 X125.894 Y126.916 E-.21151
G1 X125.747 Y125.798 E-.42846
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.876 Y126.26 Z4 F42000
G1 Z3.6
G1 E.8 F1800
G1 F4358
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
G1 F4358
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
G1 F4358
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
G1 X129.278 Y126.881 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4358
M204 S6000
G1 X125.543 Y127.373 E.12496
G1 X124.24 Y117.462 E.33158
G1 X130.58 Y116.627 E.21211
G1 X131.884 Y126.538 E.33158
G1 X129.338 Y126.873 E.08521
; WIPE_START
G1 F8843.478
G1 X127.355 Y127.134 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.375 Y129.695 Z4 F42000
G1 Z3.6
G1 E.8 F1800
G1 F4358
M204 S6000
G1 X125.437 Y136.82 E.23839
G1 X125.246 Y138.27 E.0485
G1 X124.694 Y138.199 E.01847
G1 X125.803 Y129.77 E.28202
G1 X126.315 Y129.703 E.01713
; WIPE_START
G1 F8843.478
G1 X126.07 Y131.688 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.872 Y138.306 Z4 F42000
G1 X130.228 Y138.926 Z4
G1 Z3.6
G1 E.8 F1800
G1 F4358
M204 S6000
G1 X129.676 Y138.852 E.01847
G1 X130.961 Y129.091 E.32657
G1 X131.533 Y129.016 E.01912
G1 X130.236 Y138.867 E.32958
M204 S10000
G1 X130.579 Y139.379 F42000
G1 F4358
M204 S6000
G3 X124.238 Y138.545 I91.738 J-722.092 E.21216
G1 X125.542 Y128.638 E.33147
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
G1 X130.587 Y139.319 E.35164
; WIPE_START
G1 F8843.478
G1 X129 Y139.186 E-.60493
G1 X128.616 Y139.119 E-.14807
G1 X128.598 Y139.117 E-.007
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.784 Y131.577 Z4 F42000
G1 X130.05 Y129.889 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4358
M204 S5000
G1 X128.918 Y138.485 E.26641
G1 X126.073 Y138.111 E.08819
G1 X126.229 Y136.924 E.03676
G1 X127.205 Y129.515 E.22964
G1 X129.991 Y129.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.743 Y131.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.255 Y124.651 Z4 F42000
G1 X124.622 Y117.016 Z4
G1 Z3.6
G1 E.8 F1800
G1 F4358
M204 S5000
G1 X124.462 Y115.807 E.03749
G1 X127.101 Y115.459 E.08179
G1 X129.935 Y115.086 E.08782
G1 X130.094 Y116.296 E.03749
G1 X124.681 Y117.009 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.462 Y115.807 E-.46416
G1 X125.234 Y115.705 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.011 Y123.128 Z4 F42000
G1 X130.949 Y139.572 Z4
G1 Z3.6
G1 E.8 F1800
G1 F4358
M204 S5000
G3 X130.923 Y139.661 I-.271 J-.031 E.00289
G1 X130.919 Y139.669 E.00026
G1 X130.89 Y139.715 E.00167
G1 X130.878 Y139.73 E.00059
G1 X130.865 Y139.742 E.00055
G1 X130.825 Y139.77 E.00149
G1 X130.79 Y139.785 E.00117
G3 X130.716 Y139.79 I-.049 J-.172 E.0023
G1 X130.17 Y139.725 E.0169
G1 X129.598 Y139.648 E.01772
G1 X129.202 Y139.594 E.01229
G1 X128.952 Y139.575 E.0077
G1 X128.557 Y139.507 E.01231
G1 X128.44 Y139.491 E.00363
G1 X128.008 Y139.451 E.01332
G1 X127.771 Y139.406 E.00742
G1 X127.374 Y139.354 E.01229
G1 X127.14 Y139.324 E.00725
G1 X126.744 Y139.271 E.01229
G1 X125.877 Y139.155 E.02687
G1 X125.535 Y139.112 E.0106
G1 X125.138 Y139.061 E.01229
G3 X123.999 Y138.906 I3.324 J-28.547 E.03531
G3 X123.929 Y138.881 I.023 J-.182 E.00232
G1 X123.899 Y138.858 E.00117
G1 X123.867 Y138.821 E.00149
G1 X123.861 Y138.81 E.00039
G1 X123.838 Y138.756 E.0018
G1 X123.834 Y138.741 E.00047
G1 X123.832 Y138.724 E.00052
G3 X123.83 Y138.634 I.258 J-.05 E.00278
G1 X125.188 Y128.32 E.31965
G2 X125.188 Y127.678 I-3.556 J-.32 E.01977
G1 X123.612 Y115.693 E.37144
G3 X123.773 Y115.5 I.199 J.003 E.00834
G1 X130.51 Y114.613 E.20879
G3 X130.585 Y114.616 I.029 J.214 E.00232
G3 X130.733 Y114.785 I-.045 J.188 E.00737
G1 X132.306 Y126.736 E.37039
G3 X132.306 Y129.264 I-10.793 J1.264 E.07785
G1 X130.957 Y139.512 E.31762
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.923 Y139.661 E-.05814
G1 X130.919 Y139.669 E-.00321
G1 X130.89 Y139.715 E-.02069
M73 P51 R9
G1 X130.878 Y139.73 E-.00724
G1 X130.865 Y139.742 E-.00675
G1 X130.825 Y139.77 E-.0184
G1 X130.79 Y139.785 E-.01453
G1 X130.716 Y139.79 E-.02825
G1 X130.17 Y139.725 E-.20903
G1 X129.598 Y139.648 E-.21917
G1 X129.202 Y139.594 E-.152
G1 X129.142 Y139.59 E-.0226
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X129.979 Y138.687 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192575
G1 F4358
M204 S6000
G1 X131.219 Y129.263 E.11592
M204 S10000
G1 X130.748 Y129.147 F42000
; LINE_WIDTH: 0.429479
G1 F4358
M204 S6000
G1 X130.549 Y129.147 E.00627
; LINE_WIDTH: 0.385138
G1 X130.35 Y129.147 E.00555
; LINE_WIDTH: 0.340798
G1 X130.151 Y129.147 E.00483
; LINE_WIDTH: 0.296457
G1 X129.952 Y129.147 E.00411
; LINE_WIDTH: 0.252116
G1 X129.753 Y129.147 E.00339
; LINE_WIDTH: 0.207775
G1 X129.554 Y129.147 E.00267
; LINE_WIDTH: 0.163435
G1 X129.355 Y129.147 E.00195
; LINE_WIDTH: 0.119094
G1 X129.156 Y129.147 E.00124
; WIPE_START
G1 F15000
G1 X129.355 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.034 Y129.147 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.50783
G1 F4358
M204 S6000
G1 X127.708 Y129.147 E.01236
; LINE_WIDTH: 0.458954
G1 X127.382 Y129.147 E.01106
; LINE_WIDTH: 0.410078
G1 X127.055 Y129.147 E.00976
; WIPE_START
G1 F9805.058
G1 X127.382 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.062 Y129.942 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.192603
G1 F4358
M204 S6000
G1 X124.996 Y138.033 E.09954
; WIPE_START
G1 F15000
G1 X125.257 Y136.05 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.797 Y128.431 Z4 F42000
G1 X124.026 Y115.664 Z4
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.478997
G1 F4358
M204 S6000
G1 X124.237 Y117.265 E.05735
; WIPE_START
G1 F8255.431
G1 X124.026 Y115.664 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.999 Y117.978 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.191703
G1 F4358
M204 S6000
G1 X126.143 Y126.678 E.10638
; WIPE_START
G1 F15000
G1 X125.882 Y124.695 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.032 Y128.342 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.387819
G1 F4358
M204 S6000
G1 X132.014 Y128 E.00962
; LINE_WIDTH: 0.423333
G1 X131.983 Y127.596 E.01256
; LINE_WIDTH: 0.467128
G2 X131.888 Y126.735 I-19.78 J1.745 E.02994
; WIPE_START
G1 F8486.413
G1 X131.983 Y127.596 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.125 Y126.022 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4358
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
G1 F4358
M204 S6000
G1 X130.321 Y114.835 E.05761
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.395
G1 X130.531 Y116.436 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/68
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z4 I-1.13 J-.452 P1  F42000
G1 X126.029 Y127.704 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4371
M204 S5000
G1 X128.473 Y127.382 E.07577
G1 X131.501 Y126.984 E.09385
G1 X131.661 Y128.193 E.03749
G1 X126.188 Y128.914 E.16961
G1 X126.036 Y127.764 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.012 Y127.454 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y126.59 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4371
M204 S6000
G1 X126.446 Y126.843 E.00849
G1 X125.894 Y126.916 E.01846
G1 X124.697 Y117.812 E.30457
G1 X125.247 Y117.74 E.01841
G1 X126.404 Y126.53 E.2941
; WIPE_START
G1 F8843.478
G1 X126.446 Y126.843 E-.12002
G1 X125.894 Y126.916 E-.21151
G1 X125.747 Y125.798 E-.42846
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.876 Y126.26 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
G1 F4371
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
G1 X127.256 Y126.874 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
G1 F4371
M204 S6000
G1 X126.867 Y126.925 E.01301
G1 X125.633 Y117.552 E.31361
G1 X126.679 Y117.414 E.03499
G1 X129.256 Y117.075 E.08623
G1 X130.49 Y126.448 E.31361
M73 P51 R8
G1 X127.315 Y126.866 E.10622
M204 S250
G1 X127.205 Y126.485 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4371
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
G1 X129.252 Y126.884 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4371
M204 S6000
G1 X125.543 Y127.373 E.12409
G1 X124.24 Y117.462 E.33158
G1 X130.58 Y116.627 E.21211
G1 X131.884 Y126.538 E.33158
G1 X129.312 Y126.876 E.08608
; WIPE_START
G1 F8843.478
G1 X127.329 Y127.138 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.375 Y129.695 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
G1 F4371
M204 S6000
G1 X125.46 Y136.642 E.23244
G1 X125.231 Y138.383 E.05823
G2 X124.679 Y138.308 I-6.623 J47.011 E.01847
G1 X125.803 Y129.77 E.28566
G1 X126.315 Y129.703 E.01713
; WIPE_START
G1 F8843.478
G1 X126.071 Y131.688 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.818 Y138.337 Z4.2 F42000
G1 X130.213 Y139.038 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F4371
M204 S6000
G1 X129.661 Y138.967 E.01847
G1 X130.961 Y129.091 E.33042
G1 X131.533 Y129.016 E.01912
G1 X130.221 Y138.979 E.33333
M204 S10000
G1 X130.564 Y139.494 F42000
G1 F4371
M204 S6000
G1 X129.257 Y139.325 E.04372
G3 X124.223 Y138.659 I44.243 J-353.563 E.16845
G1 X125.542 Y128.638 E.33529
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
G1 X130.571 Y139.434 E.35549
; WIPE_START
G1 F8843.478
G1 X129.257 Y139.325 E-.50136
G1 X128.581 Y139.243 E-.25865
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.765 Y131.703 Z4.2 F42000
G1 X130.05 Y129.889 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4371
M204 S5000
G1 X128.918 Y138.485 E.26641
G1 X126.073 Y138.111 E.08819
G1 X126.252 Y136.747 E.04227
G1 X127.205 Y129.515 E.22413
G1 X129.991 Y129.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.743 Y131.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.255 Y124.651 Z4.2 F42000
G1 X124.622 Y117.016 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F4371
M204 S5000
G1 X124.462 Y115.807 E.03749
G1 X126.907 Y115.485 E.07577
G1 X129.935 Y115.086 E.09385
G1 X130.094 Y116.296 E.03749
G1 X124.681 Y117.009 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.462 Y115.807 E-.46416
G1 X125.234 Y115.705 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.001 Y123.13 Z4.2 F42000
G1 X130.936 Y139.672 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F4371
M204 S5000
G3 X130.916 Y139.748 I-.238 J-.022 E.00241
G1 X130.904 Y139.778 E.00097
G1 X130.874 Y139.827 E.00177
G1 X130.861 Y139.843 E.00064
G1 X130.847 Y139.856 E.00059
G1 X130.807 Y139.886 E.00154
G1 X130.772 Y139.901 E.00117
G1 X130.74 Y139.907 E.00099
G1 X130.701 Y139.907 E.0012
G1 X130.305 Y139.856 E.01229
G1 X129.614 Y139.767 E.0214
G1 X129.217 Y139.716 E.01229
G1 X128.987 Y139.698 E.00708
G1 X128.741 Y139.655 E.00768
G1 X128.224 Y139.587 E.01603
G1 X127.951 Y139.562 E.00842
G1 X127.156 Y139.452 E.02465
G1 X126.76 Y139.398 E.01229
G1 X126.165 Y139.317 E.01844
G1 X125.769 Y139.263 E.01229
G1 X125.308 Y139.2 E.01431
G1 X124.911 Y139.147 E.01229
G1 X124.38 Y139.076 E.01646
G1 X123.984 Y139.023 E.01229
G1 X123.946 Y139.013 E.0012
G1 X123.916 Y138.999 E.00103
G1 X123.883 Y138.972 E.00132
G1 X123.873 Y138.961 E.00044
G1 X123.846 Y138.919 E.00154
G1 X123.825 Y138.866 E.00174
G1 X123.821 Y138.85 E.00052
G1 X123.816 Y138.809 E.00126
G1 X123.817 Y138.736 E.00225
G1 X125.188 Y128.32 E.32281
G2 X125.188 Y127.68 I-2.783 J-.32 E.0197
G1 X123.612 Y115.692 E.37152
G3 X123.773 Y115.5 I.199 J.003 E.00834
G1 X130.51 Y114.613 E.20879
G3 X130.585 Y114.616 I.029 J.214 E.00232
G3 X130.733 Y114.785 I-.045 J.188 E.00738
G1 X132.306 Y126.736 E.37038
G3 X132.306 Y129.264 I-10.793 J1.264 E.07785
G1 X130.943 Y139.613 E.32074
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.916 Y139.748 E-.05243
G1 X130.904 Y139.778 E-.012
G1 X130.874 Y139.827 E-.02192
G1 X130.861 Y139.843 E-.00788
G1 X130.847 Y139.856 E-.00727
G1 X130.807 Y139.886 E-.019
G1 X130.772 Y139.901 E-.0145
G1 X130.74 Y139.907 E-.01227
G1 X130.701 Y139.907 E-.01487
G1 X130.305 Y139.856 E-.152
M73 P52 R8
G1 X129.614 Y139.767 E-.26471
G1 X129.217 Y139.716 E-.152
G1 X129.14 Y139.71 E-.02915
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X129.964 Y138.801 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192573
G1 F4371
M204 S6000
G1 X131.219 Y129.263 E.11732
M204 S10000
G1 X130.748 Y129.147 F42000
; LINE_WIDTH: 0.429479
G1 F4371
M204 S6000
G1 X130.549 Y129.147 E.00627
; LINE_WIDTH: 0.385138
G1 X130.35 Y129.147 E.00555
; LINE_WIDTH: 0.340798
G1 X130.151 Y129.147 E.00483
; LINE_WIDTH: 0.296457
G1 X129.952 Y129.147 E.00411
; LINE_WIDTH: 0.252116
G1 X129.753 Y129.147 E.00339
; LINE_WIDTH: 0.207775
G1 X129.554 Y129.147 E.00267
; LINE_WIDTH: 0.163435
G1 X129.355 Y129.147 E.00195
; LINE_WIDTH: 0.119094
G1 X129.156 Y129.147 E.00124
; WIPE_START
G1 F15000
G1 X129.355 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.034 Y129.147 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.50783
G1 F4371
M204 S6000
G1 X127.708 Y129.147 E.01236
; LINE_WIDTH: 0.458954
G1 X127.382 Y129.147 E.01106
; LINE_WIDTH: 0.410078
G1 X127.055 Y129.147 E.00976
; WIPE_START
G1 F9805.05
G1 X127.382 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.062 Y129.942 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.192604
G1 F4371
M204 S6000
G1 X124.982 Y138.143 E.1009
; WIPE_START
G1 F15000
G1 X125.243 Y136.16 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.791 Y128.541 Z4.2 F42000
G1 X124.026 Y115.664 Z4.2
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.478977
G1 F4371
M204 S6000
G1 X124.237 Y117.265 E.05735
; WIPE_START
G1 F8255.815
G1 X124.026 Y115.664 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.999 Y117.978 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.191691
G1 F4371
M204 S6000
G1 X126.143 Y126.678 E.10637
; WIPE_START
G1 F15000
G1 X125.882 Y124.695 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.032 Y128.342 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.387815
G1 F4371
M204 S6000
G1 X132.014 Y128 E.00962
; LINE_WIDTH: 0.42333
G1 X131.983 Y127.596 E.01256
; LINE_WIDTH: 0.467127
G2 X131.888 Y126.735 I-19.758 J1.743 E.02995
; WIPE_START
G1 F8486.426
G1 X131.983 Y127.596 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.125 Y126.022 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4371
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
; LINE_WIDTH: 0.480851
G1 F4371
M204 S6000
G1 X130.321 Y114.835 E.05761
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.473
G1 X130.531 Y116.436 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/68
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z4.2 I-1.13 J-.452 P1  F42000
G1 X126.029 Y127.704 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4461
M204 S5000
G1 X128.279 Y127.408 E.06974
G1 X131.501 Y126.984 E.09988
G1 X131.661 Y128.193 E.03749
G1 X126.188 Y128.914 E.16961
G1 X126.036 Y127.764 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.012 Y127.45 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y126.59 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4461
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
G1 F4461
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
G1 X126.816 Y126.536 Z4.4 F42000
G1 Z4
G1 E.8 F1800
G1 F4461
M204 S6000
G1 X125.633 Y117.552 E.3006
G1 X126.732 Y117.407 E.03676
G1 X129.256 Y117.075 E.08446
G1 X130.49 Y126.448 E.31361
G1 X126.867 Y126.925 E.12121
G1 X126.824 Y126.596 E.01102
M204 S250
G1 X127.205 Y126.485 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4461
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
G1 X129.201 Y126.891 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4461
M204 S6000
G1 X125.543 Y127.373 E.12238
G1 X124.239 Y117.462 E.33158
G1 X130.58 Y116.627 E.21216
G1 X131.884 Y126.538 E.33158
G1 X129.261 Y126.883 E.08779
; WIPE_START
G1 F8843.478
G1 X127.278 Y127.144 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.375 Y129.695 Z4.4 F42000
G1 Z4
G1 E.8 F1800
G1 F4461
M204 S6000
G1 X125.484 Y136.464 E.22649
G1 X125.213 Y138.518 E.06869
G1 X124.661 Y138.45 E.01847
G1 X125.803 Y129.77 E.29042
G1 X126.315 Y129.703 E.01713
; WIPE_START
G1 F8843.478
G1 X126.071 Y131.688 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.754 Y138.373 Z4.4 F42000
G1 X130.195 Y139.175 Z4.4
G1 Z4
G1 E.8 F1800
G1 F4461
M204 S6000
G1 X129.644 Y139.099 E.01847
G1 X130.961 Y129.091 E.33483
G1 X131.533 Y129.016 E.01912
G1 X130.203 Y139.115 E.33789
M204 S10000
G1 X130.546 Y139.629 F42000
G1 F4461
M204 S6000
G3 X129.155 Y139.443 I4.246 J-37.02 E.04656
G3 X124.205 Y138.794 I51.213 J-409.747 E.16561
G1 X125.542 Y128.638 E.33979
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
G1 X130.554 Y139.569 E.36001
; WIPE_START
G1 F8843.478
G1 X129.155 Y139.443 E-.53372
G1 X128.564 Y139.365 E-.22628
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.747 Y131.825 Z4.4 F42000
G1 X130.05 Y129.889 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4461
M204 S5000
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.276 Y136.569 E.04778
G1 X127.205 Y129.515 E.21862
G1 X129.991 Y129.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.743 Y131.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.255 Y124.651 Z4.4 F42000
G1 X124.622 Y117.016 Z4.4
G1 Z4
G1 E.8 F1800
G1 F4461
M204 S5000
G1 X124.462 Y115.807 E.03749
G1 X126.712 Y115.511 E.06974
G1 X129.935 Y115.086 E.09988
G1 X130.094 Y116.296 E.03749
G1 X124.681 Y117.009 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.462 Y115.807 E-.46416
G1 X125.234 Y115.705 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.98 Y123.135 Z4.4 F42000
G1 X130.907 Y139.851 Z4.4
G1 Z4
G1 E.8 F1800
G1 F4461
M204 S5000
G1 X130.899 Y139.875 E.00078
G1 X130.88 Y139.917 E.00141
G1 X130.845 Y139.968 E.0019
G1 F4131.2
G1 X130.824 Y139.99 E.00096
G1 F3858.381
G1 X130.8 Y140.01 E.00096
G1 F3595.129
G1 X130.774 Y140.025 E.00093
G1 F3348.549
G1 X130.752 Y140.034 E.00071
G1 F3165.739
G1 X130.731 Y140.039 E.00066
G1 F3000
G1 X130.712 Y140.041 E.00061
G3 X129.103 Y139.831 I3.73 J-34.829 E.04985
G1 F4461
G1 X128.706 Y139.779 E.01229
G1 X126.503 Y139.489 E.06829
G1 X126.106 Y139.437 E.01229
G1 F3900
G1 X125.908 Y139.411 E.00615
G1 X125.511 Y139.359 E.01229
G1 F3000
G1 X124.356 Y139.218 E.03576
G3 X123.93 Y139.147 I3.21 J-20.434 E.01329
G1 F3240.388
G1 X123.902 Y139.133 E.00095
G1 F3410.292
G1 X123.885 Y139.121 E.00065
G1 F3515.637
G1 X123.875 Y139.112 E.0004
G1 F4002.557
G1 X123.84 Y139.067 E.00176
G1 F4155.128
G1 X123.831 Y139.052 E.00053
G1 F4461
G1 X123.814 Y139.009 E.00141
G1 X123.805 Y138.972 E.00117
G1 X123.798 Y138.914 E.0018
G1 X123.798 Y138.911 E.00009
G1 X123.851 Y138.514 E.01229
G1 X125.188 Y128.32 E.31592
G2 X125.188 Y127.68 I-2.929 J-.32 E.01971
G1 X123.614 Y115.719 E.37069
G3 X123.773 Y115.5 I.19 J-.029 E.00925
G1 X130.51 Y114.613 E.20877
G3 X130.585 Y114.616 I.03 J.215 E.00234
G3 X130.733 Y114.785 I-.045 J.188 E.00736
G1 X132.306 Y126.736 E.37039
G3 X132.352 Y128.842 I-9.988 J1.273 E.06485
G1 X130.915 Y139.791 E.33932
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.899 Y139.875 E-.03231
G1 X130.88 Y139.917 E-.01743
G1 X130.845 Y139.968 E-.02344
G1 X130.824 Y139.99 E-.01184
G1 X130.8 Y140.01 E-.01183
G1 X130.774 Y140.025 E-.01148
G1 X130.752 Y140.034 E-.00879
G1 X130.731 Y140.039 E-.00819
G1 X130.712 Y140.041 E-.00754
G1 X129.103 Y139.831 E-.61648
G1 X129.075 Y139.828 E-.01067
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X129.423 Y139.213 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.163992
G1 F4461
M204 S6000
G1 X125.397 Y138.684 E.04006
M204 S10000
G1 X124.964 Y138.282 F42000
; LINE_WIDTH: 0.192588
G1 F4461
M204 S6000
G1 X126.062 Y129.942 E.1026
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
G1 F4461
M204 S6000
G1 X127.382 Y129.147 E.00976
; LINE_WIDTH: 0.458948
G1 X127.708 Y129.147 E.01106
; LINE_WIDTH: 0.50782
G1 X128.034 Y129.147 E.01236
; WIPE_START
G1 F7743.603
G1 X127.708 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.156 Y129.147 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.119093
G1 F4461
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
M73 P53 R8
G1 X130.748 Y129.147 E.00627
M204 S10000
G1 X131.219 Y129.263 F42000
; LINE_WIDTH: 0.192597
G1 F4461
M204 S6000
G1 X129.946 Y138.935 E.11899
; WIPE_START
G1 F15000
G1 X130.207 Y136.952 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.078 Y129.622 Z4.4 F42000
G1 X124.025 Y115.665 Z4.4
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.480841
G1 F4461
M204 S6000
G1 X124.236 Y117.265 E.0576
; WIPE_START
G1 F8220.676
G1 X124.025 Y115.665 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.998 Y117.978 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4461
M204 S6000
G1 X126.143 Y126.678 E.10701
; WIPE_START
G1 F15000
G1 X125.882 Y124.695 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.032 Y128.342 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.387815
G1 F4461
M204 S6000
G1 X132.014 Y128 E.00962
; LINE_WIDTH: 0.42334
G1 X131.983 Y127.596 E.01256
; LINE_WIDTH: 0.467122
G2 X131.888 Y126.735 I-19.778 J1.745 E.02995
; WIPE_START
G1 F8486.537
G1 X131.983 Y127.596 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.125 Y126.022 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4461
M204 S6000
G1 X129.98 Y117.322 E.10701
; WIPE_START
G1 F15000
G1 X130.241 Y119.305 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.531 Y116.436 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.480851
G1 F4461
M204 S6000
G1 X130.321 Y114.835 E.05761
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.48
G1 X130.531 Y116.436 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/68
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z4.4 I-1.13 J-.452 P1  F42000
G1 X126.029 Y127.704 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4510
M204 S5000
G1 X128.084 Y127.433 E.06371
G1 X131.501 Y126.984 E.1059
G1 X131.661 Y128.193 E.03749
G1 X126.188 Y128.914 E.16961
G1 X126.036 Y127.764 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.011 Y127.445 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y126.59 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4510
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
G1 F4510
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
G1 X126.816 Y126.536 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F4510
M204 S6000
G1 X125.633 Y117.552 E.30061
G1 X126.784 Y117.4 E.03852
G1 X129.256 Y117.075 E.08269
G1 X130.49 Y126.448 E.31361
G1 X126.867 Y126.925 E.12121
G1 X126.824 Y126.596 E.01102
M204 S250
G1 X127.205 Y126.485 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4510
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
G1 X129.173 Y126.895 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4510
M204 S6000
G1 X125.543 Y127.373 E.12144
G1 X124.239 Y117.462 E.33158
G1 X130.58 Y116.627 E.21216
G1 X131.884 Y126.538 E.33158
G1 X129.232 Y126.887 E.08873
; WIPE_START
G1 F8843.478
G1 X127.249 Y127.148 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.375 Y129.695 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F4510
M204 S6000
G1 X125.507 Y136.287 E.22054
G1 X125.193 Y138.669 E.07971
G2 X124.641 Y138.597 I-1.597 J10.025 E.01847
G1 X125.803 Y129.77 E.29531
G1 X126.315 Y129.703 E.01713
; WIPE_START
G1 F8843.478
G1 X126.072 Y131.688 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.685 Y138.411 Z4.6 F42000
G1 X130.176 Y139.323 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F4510
M204 S6000
G2 X129.623 Y139.253 I-1.771 J11.843 E.01847
G1 X130.961 Y129.091 E.34
G1 X131.533 Y129.016 E.01912
G1 X130.183 Y139.263 E.34286
M204 S10000
G1 X130.526 Y139.782 F42000
G1 F4510
M204 S6000
G2 X124.184 Y138.951 I-164.061 J1227.597 E.21216
G1 X125.542 Y128.638 E.34506
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
G1 X130.534 Y139.722 E.36513
; WIPE_START
G1 F8843.478
G1 X128.548 Y139.481 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.729 Y131.941 Z4.6 F42000
G1 X130.05 Y129.889 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4510
M204 S5000
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.299 Y136.391 E.0533
G1 X127.205 Y129.515 E.21311
G1 X129.991 Y129.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.743 Y131.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.255 Y124.651 Z4.6 F42000
G1 X124.622 Y117.016 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F4510
M204 S5000
G1 X124.462 Y115.807 E.03749
G1 X126.518 Y115.536 E.06371
G1 X129.935 Y115.086 E.1059
G1 X130.094 Y116.296 E.03749
G1 X124.681 Y117.009 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.462 Y115.807 E-.46416
G1 X125.234 Y115.705 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.968 Y123.138 Z4.6 F42000
G1 X130.894 Y139.969 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F4510
M204 S5000
G1 X130.884 Y140.004 E.00113
G1 X130.869 Y140.042 E.00125
G1 X130.85 Y140.077 E.00122
G1 F4237.969
G1 X130.827 Y140.108 E.00119
G1 F3895.128
G1 X130.803 Y140.135 E.00111
G1 F3587.817
G1 X130.781 Y140.153 E.00087
G1 F3355.524
G1 X130.741 Y140.176 E.0014
G1 F3000
G1 X130.706 Y140.187 E.00112
G1 F2880
G3 X129.792 Y140.077 I.522 J-8.213 E.02832
G1 F2760
G3 X124.894 Y139.432 I103.651 J-806.512 E.15179
G1 F2880
G1 X124.158 Y139.343 E.02278
G1 F2760
G1 X123.952 Y139.304 E.00642
G1 F2880
G1 X123.916 Y139.294 E.00117
G1 F3000
G3 X123.854 Y139.254 I.056 J-.153 E.00228
G1 F3179.385
G1 X123.839 Y139.236 E.00072
G1 F3369.037
G1 X123.826 Y139.216 E.00074
G1 F3548.481
G1 X123.815 Y139.197 E.00068
G1 F4127.699
G1 X123.792 Y139.134 E.00207
G1 F4317.419
G1 X123.787 Y139.113 E.00065
G1 F4510
G1 X123.781 Y139.049 E.002
G1 X123.781 Y139.037 E.00036
G1 X123.833 Y138.64 E.01229
G1 X125.188 Y128.322 E.31977
G2 X125.188 Y127.679 I-4.049 J-.322 E.01979
G1 X123.614 Y115.719 E.37065
G3 X123.769 Y115.501 I.191 J-.029 E.00911
G1 X130.51 Y114.613 E.20891
G3 X130.585 Y114.616 I.029 J.215 E.00234
G3 X130.733 Y114.785 I-.045 J.188 E.00735
G1 X132.306 Y126.736 E.37039
G3 X132.306 Y129.264 I-10.793 J1.264 E.07785
G1 X130.902 Y139.909 E.32993
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.884 Y140.004 E-.03666
G1 X130.869 Y140.042 E-.01542
G1 X130.85 Y140.077 E-.01514
G1 X130.827 Y140.108 E-.01475
G1 X130.803 Y140.135 E-.01378
G1 X130.781 Y140.153 E-.01081
G1 X130.741 Y140.176 E-.0173
G1 X130.706 Y140.187 E-.01389
G1 X129.792 Y140.077 E-.35009
G1 X129.082 Y139.983 E-.27216
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X129.413 Y139.293 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.319934
G1 F4510
M204 S6000
G1 X125.386 Y138.762 E.09167
M204 S10000
G1 X124.944 Y138.428 F42000
; LINE_WIDTH: 0.192589
G1 F4510
M204 S6000
G1 X126.062 Y129.942 E.1044
; WIPE_START
G1 F15000
G1 X125.801 Y131.925 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.055 Y129.147 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.410076
G1 F4510
M204 S6000
G1 X127.382 Y129.147 E.00976
; LINE_WIDTH: 0.458948
G1 X127.708 Y129.147 E.01106
; LINE_WIDTH: 0.50782
G1 X128.034 Y129.147 E.01236
; WIPE_START
G1 F7743.603
G1 X127.708 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.156 Y129.147 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.119093
G1 F4510
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
; LINE_WIDTH: 0.19259
G1 F4510
M204 S6000
G1 X129.926 Y139.084 E.12082
; WIPE_START
G1 F15000
G1 X130.187 Y137.101 E-.76
; WIPE_END
M73 P54 R8
G1 E-.04 F1800
M204 S10000
G1 X128.079 Y129.766 Z4.6 F42000
G1 X124.025 Y115.665 Z4.6
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.480851
G1 F4510
M204 S6000
G1 X124.236 Y117.265 E.05759
; WIPE_START
G1 F8220.488
G1 X124.025 Y115.665 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.998 Y117.978 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4510
M204 S6000
G1 X126.143 Y126.678 E.10701
; WIPE_START
G1 F15000
G1 X125.882 Y124.695 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.032 Y128.342 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.387807
G1 F4510
M204 S6000
G1 X132.014 Y128 E.00962
; LINE_WIDTH: 0.423323
G1 X131.983 Y127.596 E.01256
; LINE_WIDTH: 0.467125
G2 X131.888 Y126.735 I-19.738 J1.741 E.02994
; WIPE_START
G1 F8486.466
G1 X131.983 Y127.596 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.125 Y126.022 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4510
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
; LINE_WIDTH: 0.480847
G1 F4510
M204 S6000
G1 X130.321 Y114.835 E.05761
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.56
G1 X130.531 Y116.436 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/68
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z4.6 I-1.13 J-.452 P1  F42000
G1 X126.029 Y127.704 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4534
M204 S5000
G1 X127.89 Y127.459 E.05768
G1 X131.501 Y126.984 E.11193
G1 X131.661 Y128.193 E.03749
G1 X126.188 Y128.914 E.16961
G1 X126.036 Y127.764 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.89 Y127.459 E-.71374
G1 X128.011 Y127.443 E-.04626
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y126.59 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4534
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
G1 X130.876 Y126.26 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F4534
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
G1 X126.816 Y126.536 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F4534
M204 S6000
G1 X125.633 Y117.552 E.30061
G1 X126.837 Y117.393 E.04029
G1 X129.256 Y117.075 E.08093
G1 X130.49 Y126.448 E.31361
G1 X126.867 Y126.925 E.12121
G1 X126.824 Y126.596 E.01102
M204 S250
G1 X127.205 Y126.485 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4534
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
G1 X129.137 Y126.899 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4534
M204 S6000
G1 X125.543 Y127.373 E.12023
G1 X124.239 Y117.462 E.33158
G1 X130.58 Y116.627 E.21216
G1 X131.884 Y126.538 E.33158
G1 X129.196 Y126.892 E.08994
; WIPE_START
G1 F8843.478
G1 X127.213 Y127.153 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.375 Y129.695 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F4534
M204 S6000
G1 X125.53 Y136.109 E.21459
G1 X125.171 Y138.837 E.09127
G1 X124.621 Y138.754 E.01847
G1 X125.803 Y129.77 E.30059
G1 X126.315 Y129.703 E.01713
; WIPE_START
G1 F8843.478
G1 X126.072 Y131.688 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.613 Y138.45 Z4.8 F42000
G1 X130.154 Y139.484 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F4534
M204 S6000
G1 X129.601 Y139.421 E.01847
G1 X130.961 Y129.091 E.3456
G1 X131.533 Y129.016 E.01912
G1 X130.162 Y139.425 E.34825
M204 S10000
G1 X130.506 Y139.934 F42000
G1 F4534
M204 S6000
G3 X125.981 Y139.344 I33.067 J-270.975 E.15136
G3 X124.165 Y139.098 I3.423 J-32.119 E.06082
G1 X125.542 Y128.638 E.34997
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
G1 X130.514 Y139.875 E.37023
; WIPE_START
G1 F8843.478
G1 X129.577 Y139.828 E-.35633
G1 X128.524 Y139.686 E-.40367
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.699 Y132.144 Z4.8 F42000
G1 X130.05 Y129.889 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4534
M204 S5000
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.323 Y136.213 E.05881
G1 X127.205 Y129.515 E.2076
G1 X129.991 Y129.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.743 Y131.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.255 Y124.651 Z4.8 F42000
G1 X124.622 Y117.016 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F4534
M204 S5000
G1 X124.462 Y115.807 E.03749
G1 X126.324 Y115.562 E.05768
G1 X129.935 Y115.086 E.11193
G1 X130.094 Y116.296 E.03749
G1 X124.681 Y117.009 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.462 Y115.807 E-.46416
G1 X125.234 Y115.705 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.953 Y123.142 Z4.8 F42000
G1 X130.876 Y140.11 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F4534
M204 S5000
G1 X130.876 Y140.113 E.00008
G1 X130.864 Y140.153 E.00129
G1 X130.849 Y140.19 E.00121
G1 F4250.05
G1 X130.816 Y140.248 E.00205
G1 F3667.665
G1 X130.794 Y140.275 E.00109
G1 F3377.258
G1 X130.759 Y140.309 E.00148
G1 F3000
G1 X130.728 Y140.329 E.00114
G1 F2880
G1 X130.708 Y140.338 E.00068
G1 F2760
G1 X130.688 Y140.344 E.00064
G3 X130.629 Y140.343 I-.028 J-.182 E.00184
G1 F2640
G1 X129.527 Y140.217 E.03408
G1 F2760
G2 X125.932 Y139.733 I-40.125 J284.466 E.11146
G1 F2640
G1 X125.038 Y139.625 E.02767
G1 F2760
G3 X123.864 Y139.437 I1.219 J-11.398 E.03653
G1 F2880
G1 X123.845 Y139.422 E.00076
G1 F3000
G1 X123.825 Y139.4 E.00092
G1 F3218.412
G1 X123.809 Y139.377 E.00087
G1 F3444.035
G1 X123.796 Y139.352 E.00087
G1 F4027.4
G1 X123.772 Y139.287 E.00212
G1 F4231.479
G1 X123.768 Y139.264 E.0007
G1 F4534
G1 X123.761 Y139.197 E.00209
G1 X123.763 Y139.173 E.00072
G1 X123.815 Y138.777 E.01229
G1 X125.188 Y128.322 E.32399
G2 X125.188 Y127.679 I-4.034 J-.322 E.01979
G1 X123.614 Y115.72 E.37064
G3 X123.774 Y115.5 I.191 J-.029 E.00927
G1 X130.51 Y114.613 E.20877
G3 X130.585 Y114.616 I.029 J.215 E.00233
G3 X130.733 Y114.785 I-.045 J.188 E.00735
G1 X132.306 Y126.736 E.37039
G3 X132.306 Y129.264 I-10.793 J1.264 E.07786
G1 X130.884 Y140.051 E.33431
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.876 Y140.113 E-.02373
G1 X130.864 Y140.153 E-.01599
G1 X130.849 Y140.19 E-.01496
G1 X130.816 Y140.248 E-.0254
G1 X130.794 Y140.275 E-.01342
G1 X130.759 Y140.309 E-.01833
G1 X130.728 Y140.329 E-.01414
G1 X130.708 Y140.338 E-.0084
G1 X130.688 Y140.344 E-.00787
G1 X130.629 Y140.343 E-.02266
G1 X129.527 Y140.217 E-.42142
G1 X129.074 Y140.156 E-.17368
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X129.402 Y139.373 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.479204
G1 F4534
M204 S6000
G1 X125.376 Y138.843 E.14437
M204 S10000
G1 X124.923 Y138.594 F42000
; LINE_WIDTH: 0.192591
G1 F4534
M204 S6000
G1 X126.062 Y129.942 E.10643
; WIPE_START
G1 F15000
G1 X125.801 Y131.925 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.055 Y129.147 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.410076
G1 F4534
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
G1 X129.156 Y129.147 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.119094
G1 F4534
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
; LINE_WIDTH: 0.192598
G1 F4534
M204 S6000
G1 X129.904 Y139.251 E.12287
; WIPE_START
G1 F15000
G1 X130.165 Y137.268 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.079 Y129.926 Z4.8 F42000
M73 P55 R8
G1 X124.025 Y115.665 Z4.8
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.480855
G1 F4534
M204 S6000
G1 X124.236 Y117.265 E.0576
; WIPE_START
G1 F8220.406
G1 X124.025 Y115.665 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.998 Y117.978 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4534
M204 S6000
G1 X126.143 Y126.678 E.10701
; WIPE_START
G1 F15000
G1 X125.882 Y124.695 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.032 Y128.342 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.387815
G1 F4534
M204 S6000
G1 X132.014 Y128 E.00962
; LINE_WIDTH: 0.42333
G1 X131.983 Y127.596 E.01256
; LINE_WIDTH: 0.467127
G2 X131.888 Y126.735 I-19.765 J1.743 E.02994
; WIPE_START
G1 F8486.438
G1 X131.983 Y127.596 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.125 Y126.022 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4534
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
; LINE_WIDTH: 0.480851
G1 F4534
M204 S6000
G1 X130.321 Y114.835 E.05761
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.48
G1 X130.531 Y116.436 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/68
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z4.8 I-1.13 J-.452 P1  F42000
G1 X126.029 Y127.704 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4557
M204 S5000
G1 X127.695 Y127.485 E.05166
G1 X131.501 Y126.984 E.11796
G1 X131.661 Y128.193 E.03749
G1 X126.188 Y128.914 E.16961
G1 X126.036 Y127.764 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.695 Y127.485 E-.63924
G1 X128.01 Y127.443 E-.12076
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y126.59 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4557
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
G1 X130.876 Y126.26 Z5 F42000
G1 Z4.6
G1 E.8 F1800
G1 F4557
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
G1 F4557
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
G1 F4557
M204 S5000
G1 X126.073 Y117.889 E.2664
G1 X126.941 Y117.775 E.02691
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
G1 X129.098 Y126.905 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4557
M204 S6000
G1 X125.543 Y127.373 E.11892
G1 X124.239 Y117.462 E.33158
G1 X130.58 Y116.627 E.21216
G1 X131.884 Y126.538 E.33158
G1 X129.157 Y126.897 E.09125
; WIPE_START
G1 F8843.478
G1 X127.174 Y127.158 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.375 Y129.695 Z5 F42000
G1 Z4.6
G1 E.8 F1800
G1 F4557
M204 S6000
G1 X125.554 Y135.931 E.20864
G1 X125.15 Y138.996 E.10253
G3 X124.598 Y138.922 I1.02 J-9.766 E.01847
G1 X125.803 Y129.77 E.3062
G1 X126.315 Y129.703 E.01713
; WIPE_START
G1 F8843.478
G1 X126.073 Y131.688 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.54 Y138.488 Z5 F42000
G1 X130.132 Y139.651 Z5
G1 Z4.6
G1 E.8 F1800
G1 F4557
M204 S6000
G3 X129.58 Y139.579 I.888 J-9.07 E.01847
G1 X130.961 Y129.091 E.35091
G1 X131.533 Y129.016 E.01912
G1 X130.14 Y139.591 E.35382
M204 S10000
G1 X130.484 Y140.099 F42000
G1 F4557
M204 S6000
G3 X126.144 Y139.525 I43.417 J-344.936 E.14522
G3 X124.143 Y139.265 I3.578 J-35.379 E.06695
G1 X125.542 Y128.638 E.35558
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
G1 X130.492 Y140.04 E.37576
; WIPE_START
G1 F8843.478
G1 X129.832 Y140.027 E-.25075
G1 X128.504 Y139.846 E-.50925
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.675 Y132.304 Z5 F42000
G1 X130.05 Y129.889 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4557
M204 S5000
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.346 Y136.035 E.06432
G1 X127.205 Y129.515 E.20209
G1 X129.991 Y129.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.743 Y131.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.255 Y124.651 Z5 F42000
G1 X124.622 Y117.016 Z5
G1 Z4.6
G1 E.8 F1800
G1 F4557
M204 S5000
G1 X124.462 Y115.807 E.03749
G1 X126.129 Y115.587 E.05166
G1 X129.935 Y115.086 E.11796
G1 X130.094 Y116.296 E.03749
G1 X124.681 Y117.009 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.462 Y115.807 E-.46416
G1 X125.234 Y115.705 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.937 Y123.145 Z5 F42000
G1 X130.856 Y140.261 Z5
G1 Z4.6
G1 E.8 F1800
G1 F4557
M204 S5000
G1 X130.853 Y140.278 E.00055
G1 X130.845 Y140.303 E.00078
G1 X130.836 Y140.33 E.00088
G1 X130.818 Y140.371 E.00137
G1 F3792.262
G1 X130.781 Y140.429 E.00211
G1 F3228.46
G1 X130.762 Y140.451 E.00091
G1 F3000
G1 X130.713 Y140.49 E.00191
G1 F2760
G1 X130.686 Y140.503 E.00094
G1 F2640
G3 X130.637 Y140.511 I-.045 J-.126 E.00154
G1 X129.783 Y140.416 E.0264
G1 F2760
G1 X128.98 Y140.301 E.0249
G1 F2640
G1 X128.386 Y140.216 E.01844
G1 F2760
G1 X126.095 Y139.914 E.071
G1 F2640
G1 X125.327 Y139.822 E.02379
G3 X123.846 Y139.605 I1.804 J-17.457 E.04599
G1 F2760
G1 X123.826 Y139.588 E.0008
G1 F2880
G1 X123.806 Y139.566 E.00091
G1 F3000
G1 X123.796 Y139.553 E.00049
G1 F3456.183
G1 X123.769 Y139.502 E.00178
G1 F3702.983
G1 X123.759 Y139.474 E.00091
G1 F4411.395
G1 X123.743 Y139.395 E.00247
G1 F4557
G1 X123.741 Y139.331 E.00199
G1 X123.742 Y139.322 E.00027
G1 X123.794 Y138.925 E.01229
G1 X125.188 Y128.322 E.32861
G2 X125.188 Y127.678 I-4.388 J-.322 E.01982
G1 X123.614 Y115.72 E.37059
G3 X123.774 Y115.5 I.192 J-.029 E.00929
G1 X130.51 Y114.613 E.20875
G3 X130.585 Y114.616 I.03 J.215 E.00234
G3 X130.733 Y114.785 I-.045 J.188 E.00736
G1 X132.306 Y126.736 E.37039
G3 X132.306 Y129.264 I-10.792 J1.264 E.07785
G1 X130.864 Y140.201 E.33899
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.853 Y140.278 E-.02957
G1 X130.845 Y140.303 E-.00968
G1 X130.836 Y140.33 E-.01089
G1 X130.818 Y140.371 E-.01696
G1 X130.781 Y140.429 E-.02612
G1 X130.762 Y140.451 E-.01123
G1 X130.713 Y140.49 E-.02363
G1 X130.686 Y140.503 E-.01157
G1 X130.637 Y140.511 E-.01891
G1 X129.783 Y140.416 E-.32654
G1 X129.066 Y140.313 E-.27492
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X129.392 Y139.453 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.638549
G1 F4557
M204 S6000
G1 X125.365 Y138.923 E.1971
M204 S10000
G1 X124.901 Y138.76 F42000
; LINE_WIDTH: 0.19259
G1 F4557
M204 S6000
G1 X126.062 Y129.942 E.10848
; WIPE_START
G1 F15000
G1 X125.801 Y131.925 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.055 Y129.147 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.410076
G1 F4557
M204 S6000
G1 X127.382 Y129.147 E.00976
; LINE_WIDTH: 0.458947
G1 X127.708 Y129.147 E.01106
; LINE_WIDTH: 0.507818
G1 X128.034 Y129.147 E.01236
; WIPE_START
G1 F7743.646
G1 X127.708 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.156 Y129.147 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.119094
G1 F4557
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
; LINE_WIDTH: 0.192587
G1 F4557
M204 S6000
G1 X129.883 Y139.416 E.1249
; WIPE_START
G1 F15000
G1 X130.144 Y137.433 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.078 Y130.086 Z5 F42000
G1 X124.025 Y115.665 Z5
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.480839
G1 F4557
M204 S6000
G1 X124.236 Y117.265 E.0576
; WIPE_START
G1 F8220.705
M73 P56 R8
G1 X124.025 Y115.665 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.998 Y117.978 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4557
M204 S6000
G1 X126.143 Y126.678 E.10701
; WIPE_START
G1 F15000
G1 X125.882 Y124.695 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.032 Y128.342 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.387825
G1 F4557
M204 S6000
G1 X132.014 Y128 E.00962
; LINE_WIDTH: 0.423332
G1 X131.983 Y127.596 E.01255
; LINE_WIDTH: 0.467122
G2 X131.888 Y126.735 I-19.78 J1.745 E.02995
; WIPE_START
G1 F8486.523
G1 X131.983 Y127.596 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.125 Y126.022 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4557
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
; LINE_WIDTH: 0.480856
G1 F4557
M204 S6000
G1 X130.321 Y114.835 E.05761
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.392
G1 X130.531 Y116.436 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/68
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z5 I-1.13 J-.452 P1  F42000
G1 X126.029 Y127.704 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4522
M204 S5000
G1 X127.501 Y127.51 E.04563
G1 X131.501 Y126.984 E.12398
G1 X131.661 Y128.193 E.03749
G1 X126.188 Y128.914 E.16961
G1 X126.036 Y127.764 E.03564
M204 S10000
G1 X125.924 Y126.912 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4522
M204 S6000
G1 X125.894 Y126.916 E.00103
G1 X124.695 Y117.813 E.30457
G1 X125.247 Y117.74 E.01847
G1 X126.446 Y126.843 E.30457
G1 X125.984 Y126.904 E.01545
; WIPE_START
G1 F8843.478
G1 X125.894 Y126.916 E-.03454
G1 X125.644 Y125.023 E-.72546
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.876 Y126.26 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F4522
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
G1 X127.256 Y126.874 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F4522
M204 S6000
G1 X126.867 Y126.925 E.01301
G1 X125.633 Y117.552 E.31361
G1 X126.943 Y117.379 E.04382
G1 X129.256 Y117.075 E.07739
G1 X130.49 Y126.448 E.31361
G1 X127.315 Y126.866 E.10622
M204 S250
G1 X127.205 Y126.485 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4522
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
G1 X129.058 Y126.91 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4522
M204 S6000
G1 X125.543 Y127.373 E.11759
G1 X124.239 Y117.462 E.33158
G1 X130.58 Y116.627 E.21216
G1 X131.884 Y126.538 E.33158
G1 X129.117 Y126.902 E.09259
; WIPE_START
G1 F8843.478
G1 X127.134 Y127.163 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.882 Y134.593 Z5.2 F42000
G1 X130.111 Y139.817 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F4522
M204 S6000
G2 X124.577 Y139.088 I-34.636 J241.513 E.18516
G1 X125.803 Y129.77 E.31176
G1 X126.375 Y129.695 E.01912
G1 X125.176 Y138.799 E.30459
G1 X129.606 Y139.382 E.14822
G1 X130.961 Y129.091 E.3443
G1 X131.533 Y129.016 E.01912
G1 X130.118 Y139.758 E.3594
M204 S10000
G1 X130.462 Y140.268 F42000
G1 F4522
M204 S6000
G3 X128.842 Y140.045 I2.786 J-26.185 E.05424
G2 X124.121 Y139.433 I-52.286 J385.189 E.15794
G1 X125.542 Y128.638 E.36119
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
G1 X130.47 Y140.208 E.38139
; WIPE_START
G1 F8843.478
G1 X128.842 Y140.045 E-.62147
G1 X128.481 Y139.998 E-.13853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.652 Y132.456 Z5.2 F42000
G1 X130.05 Y129.889 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4522
M204 S5000
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.37 Y135.858 E.06983
G1 X127.205 Y129.515 E.19658
G1 X129.991 Y129.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.743 Y131.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.255 Y124.651 Z5.2 F42000
G1 X124.622 Y117.016 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F4522
M204 S5000
G1 X124.462 Y115.807 E.03749
G1 X125.935 Y115.613 E.04563
G1 X129.935 Y115.086 E.12398
G1 X130.094 Y116.296 E.03749
G1 X124.681 Y117.009 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.462 Y115.807 E-.46416
G1 X125.234 Y115.705 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.921 Y123.149 Z5.2 F42000
G1 X130.836 Y140.418 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F4522
M204 S5000
G1 X130.833 Y140.435 E.00051
G1 X130.821 Y140.478 E.00138
G1 F4498.274
G1 X130.806 Y140.516 E.00126
G1 F4124.08
G1 X130.766 Y140.587 E.00251
G1 F3428.892
G1 X130.741 Y140.618 E.00119
G1 F3121.081
G1 X130.718 Y140.64 E.00098
G1 F2880
G1 X130.696 Y140.656 E.00085
G1 F2760
G1 X130.669 Y140.671 E.00096
G1 F2640
G3 X130.601 Y140.678 I-.048 J-.117 E.00211
G1 X130.039 Y140.614 E.01739
G1 F2760
G1 X128.788 Y140.433 E.03884
G1 F2640
G1 X125.692 Y140.025 E.09595
G1 F2760
G1 X124.424 Y139.875 E.03924
G1 F2640
G3 X123.854 Y139.789 I.607 J-5.924 E.0177
G1 X123.815 Y139.766 E.00141
G1 F2760
G1 X123.791 Y139.744 E.00099
G1 F2880
G1 X123.781 Y139.732 E.00048
G1 F3000
G1 X123.762 Y139.702 E.0011
G1 F3256.679
G1 X123.748 Y139.672 E.00102
G1 F3603.243
G1 X123.734 Y139.631 E.00131
G1 F4194.833
G1 X123.721 Y139.564 E.0021
G1 F4522
G1 X123.719 Y139.496 E.0021
G1 X123.72 Y139.486 E.00028
G1 X123.772 Y139.09 E.01229
G1 X125.188 Y128.322 E.33371
G2 X125.188 Y127.678 I-4.389 J-.322 E.01982
G1 X123.614 Y115.72 E.3706
G3 X123.774 Y115.5 I.19 J-.03 E.00931
G1 X130.51 Y114.613 E.20874
G3 X130.586 Y114.616 I.029 J.216 E.00235
G3 X130.733 Y114.785 I-.046 J.188 E.00734
M73 P56 R7
G1 X132.306 Y126.736 E.37039
G3 X132.306 Y129.264 I-10.792 J1.264 E.07785
G1 X130.844 Y140.359 E.34386
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.833 Y140.435 E-.02913
G1 X130.821 Y140.478 E-.01707
G1 X130.806 Y140.516 E-.01563
G1 X130.766 Y140.587 E-.03106
G1 X130.741 Y140.618 E-.01475
G1 X130.718 Y140.64 E-.01207
G1 X130.696 Y140.656 E-.01049
G1 X130.669 Y140.671 E-.01186
G1 X130.601 Y140.678 E-.0258
G1 X130.039 Y140.614 E-.21505
G1 X129.057 Y140.472 E-.37709
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X129.862 Y139.576 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192591
G1 F4522
M204 S6000
G1 X131.219 Y129.263 E.12687
M204 S10000
G1 X130.748 Y129.147 F42000
; LINE_WIDTH: 0.429479
G1 F4522
M204 S6000
G1 X130.549 Y129.147 E.00627
; LINE_WIDTH: 0.385138
G1 X130.35 Y129.147 E.00555
; LINE_WIDTH: 0.340798
G1 X130.151 Y129.147 E.00483
; LINE_WIDTH: 0.296457
G1 X129.952 Y129.147 E.00411
; LINE_WIDTH: 0.252116
G1 X129.753 Y129.147 E.00339
; LINE_WIDTH: 0.207775
G1 X129.554 Y129.147 E.00267
; LINE_WIDTH: 0.163435
G1 X129.355 Y129.147 E.00195
; LINE_WIDTH: 0.119094
G1 X129.156 Y129.147 E.00124
; WIPE_START
G1 F15000
G1 X129.355 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.034 Y129.147 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.507818
G1 F4522
M204 S6000
G1 X127.708 Y129.147 E.01236
; LINE_WIDTH: 0.458947
G1 X127.382 Y129.147 E.01106
; LINE_WIDTH: 0.410076
G1 X127.055 Y129.147 E.00976
; WIPE_START
G1 F9805.108
G1 X127.382 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.062 Y129.942 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.192604
G1 F4522
M204 S6000
G1 X124.88 Y138.919 E.11045
; WIPE_START
G1 F15000
G1 X125.141 Y136.936 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.741 Y129.314 Z5.2 F42000
G1 X124.025 Y115.664 Z5.2
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.48085
G1 F4522
M204 S6000
G1 X124.236 Y117.265 E.0576
; WIPE_START
G1 F8220.495
G1 X124.025 Y115.664 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.998 Y117.978 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4522
M204 S6000
G1 X126.143 Y126.678 E.10701
; WIPE_START
M73 P57 R7
G1 F15000
G1 X125.882 Y124.695 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.032 Y128.342 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.387819
G1 F4522
M204 S6000
G1 X132.014 Y128 E.00962
; LINE_WIDTH: 0.423334
G1 X131.983 Y127.596 E.01255
; LINE_WIDTH: 0.467134
G2 X131.888 Y126.735 I-19.741 J1.741 E.02995
; WIPE_START
G1 F8486.298
G1 X131.983 Y127.596 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.125 Y126.022 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4522
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
; LINE_WIDTH: 0.480854
G1 F4522
M204 S6000
G1 X130.321 Y114.835 E.05761
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.427
G1 X130.531 Y116.436 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/68
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z5.2 I-1.13 J-.452 P1  F42000
G1 X126.029 Y127.704 Z5.2
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4598
M204 S5000
G1 X127.306 Y127.536 E.0396
G1 X131.501 Y126.984 E.13001
G1 X131.661 Y128.193 E.03749
G1 X126.188 Y128.914 E.16961
G1 X126.036 Y127.764 E.03564
M204 S10000
G1 X125.924 Y126.912 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4598
M204 S6000
G1 X125.894 Y126.916 E.00103
G1 X124.695 Y117.813 E.30457
G1 X125.247 Y117.74 E.01847
G1 X126.446 Y126.843 E.30458
G1 X125.984 Y126.904 E.01545
; WIPE_START
G1 F8843.478
G1 X125.894 Y126.916 E-.03454
G1 X125.645 Y125.023 E-.72546
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.876 Y126.26 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F4598
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
G1 X127.256 Y126.874 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F4598
M204 S6000
G1 X126.867 Y126.925 E.01301
G1 X125.633 Y117.552 E.31361
G1 X126.996 Y117.372 E.04559
G1 X129.256 Y117.075 E.07562
G1 X130.49 Y126.448 E.31361
G1 X127.315 Y126.866 E.10622
M204 S250
G1 X127.205 Y126.485 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4598
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
G1 X129.015 Y126.916 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4598
M204 S6000
G1 X125.543 Y127.373 E.11615
G1 X124.239 Y117.462 E.33158
G1 X130.58 Y116.627 E.21216
G1 X131.884 Y126.538 E.33158
G1 X129.074 Y126.908 E.09402
; WIPE_START
G1 F8843.478
G1 X127.091 Y127.169 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.831 Y134.6 Z5.4 F42000
G1 X130.09 Y139.977 Z5.4
G1 Z5
G1 E.8 F1800
G1 F4598
M204 S6000
G2 X124.556 Y139.248 I-39.177 J276.12 E.18516
G1 X125.803 Y129.77 E.31711
G1 X126.375 Y129.695 E.01912
G1 X125.176 Y138.799 E.30459
G1 X129.606 Y139.382 E.14822
G1 X130.961 Y129.091 E.3443
G1 X131.533 Y129.016 E.01912
G1 X130.097 Y139.917 E.36474
M204 S10000
G1 X130.439 Y140.438 F42000
G1 F4598
M204 S6000
G2 X124.098 Y139.603 I-39.545 J275.714 E.21217
G1 X125.542 Y128.638 E.36687
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
G1 X130.447 Y140.379 E.38708
; WIPE_START
G1 F8843.478
G1 X129.276 Y140.266 E-.44698
G1 X128.46 Y140.159 E-.31302
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.628 Y132.616 Z5.4 F42000
G1 X130.05 Y129.889 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4598
M204 S5000
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.393 Y135.68 E.07534
G1 X127.205 Y129.515 E.19107
G1 X129.991 Y129.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.743 Y131.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.255 Y124.651 Z5.4 F42000
G1 X124.622 Y117.016 Z5.4
G1 Z5
G1 E.8 F1800
G1 F4598
M204 S5000
G1 X124.462 Y115.807 E.03749
G1 X125.74 Y115.639 E.0396
G1 X129.935 Y115.086 E.13001
G1 X130.094 Y116.296 E.03749
G1 X124.681 Y117.009 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.462 Y115.807 E-.46416
G1 X125.234 Y115.705 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.905 Y123.153 Z5.4 F42000
G1 X130.814 Y140.585 Z5.4
G1 Z5
G1 E.8 F1800
G1 F4598
M204 S5000
G1 X130.811 Y140.604 E.0006
G1 X130.799 Y140.648 E.0014
G1 F4571.762
G1 X130.784 Y140.686 E.00126
G1 F4194.216
G1 X130.769 Y140.717 E.00103
G1 F3898.815
G1 X130.731 Y140.772 E.00207
G1 F3338.564
G1 X130.689 Y140.814 E.00182
G1 F2880
G1 X130.676 Y140.825 E.00053
G1 F2760
G1 X130.636 Y140.843 E.00133
G1 F2640
G3 X130.579 Y140.846 I-.034 J-.116 E.00178
G1 X130.294 Y140.813 E.00881
G1 F2760
G3 X129.221 Y140.654 I6.389 J-46.818 E.03335
G1 F2640
G1 X125.213 Y140.127 E.12421
G1 F2760
G1 X124.771 Y140.079 E.01364
G1 F2640
G3 X123.8 Y139.942 I.641 J-8.032 E.03018
G1 F2760
G1 X123.786 Y139.931 E.00054
G1 F2880
G1 X123.756 Y139.897 E.00137
G1 F3402.793
G1 X123.724 Y139.838 E.00207
G1 F3615.246
G1 X123.716 Y139.814 E.0008
G1 F4126.076
G1 X123.702 Y139.756 E.00182
G1 F4523.262
G1 X123.697 Y139.713 E.00134
G1 F4598
G1 X123.697 Y139.667 E.0014
G1 X123.698 Y139.652 E.00045
G1 X123.75 Y139.256 E.01229
G1 X125.188 Y128.322 E.33885
G2 X125.188 Y127.678 I-4.389 J-.322 E.01982
G1 X123.614 Y115.72 E.3706
G3 X123.775 Y115.5 I.192 J-.029 E.0093
G1 X130.509 Y114.613 E.20872
G3 X130.586 Y114.616 I.03 J.216 E.00237
G3 X130.733 Y114.785 I-.046 J.188 E.00734
G1 X132.306 Y126.736 E.37039
G3 X132.306 Y129.264 I-10.794 J1.264 E.07786
G1 X130.822 Y140.525 E.34901
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.811 Y140.604 E-.03027
G1 X130.799 Y140.648 E-.01737
G1 X130.784 Y140.686 E-.01564
G1 X130.769 Y140.717 E-.01274
G1 X130.731 Y140.772 E-.02556
G1 X130.689 Y140.814 E-.02257
G1 X130.676 Y140.825 E-.00655
G1 X130.636 Y140.843 E-.0165
G1 X130.579 Y140.846 E-.02176
G1 X130.294 Y140.813 E-.10899
G1 X129.221 Y140.654 E-.41238
G1 X129.039 Y140.63 E-.06967
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X129.774 Y139.667 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192513
G1 F4598
M204 S6000
G1 X129.847 Y139.656 E.00089
G1 X129.856 Y139.62 E.00045
G1 X131.219 Y129.263 E.12734
M204 S10000
G1 X130.748 Y129.147 F42000
; LINE_WIDTH: 0.429464
G1 F4598
M204 S6000
G1 X130.549 Y129.147 E.00627
; LINE_WIDTH: 0.385126
G1 X130.35 Y129.147 E.00555
; LINE_WIDTH: 0.340787
G1 X130.151 Y129.147 E.00483
; LINE_WIDTH: 0.296448
G1 X129.952 Y129.147 E.00411
; LINE_WIDTH: 0.252109
G1 X129.753 Y129.147 E.00339
; LINE_WIDTH: 0.20777
G1 X129.554 Y129.147 E.00267
; LINE_WIDTH: 0.163432
G1 X129.355 Y129.147 E.00195
; LINE_WIDTH: 0.119093
G1 X129.156 Y129.147 E.00124
; WIPE_START
G1 F15000
G1 X129.355 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.034 Y129.147 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.507818
G1 F4598
M204 S6000
G1 X127.708 Y129.147 E.01236
; LINE_WIDTH: 0.458947
G1 X127.382 Y129.147 E.01106
; LINE_WIDTH: 0.410075
G1 X127.055 Y129.147 E.00976
; WIPE_START
G1 F9805.121
G1 X127.382 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.062 Y129.942 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.192508
G1 F4598
M204 S6000
G1 X124.874 Y138.964 E.11093
G1 X124.873 Y139.001 E.00045
G1 X124.94 Y139.03 E.00089
; LINE_WIDTH: 0.149414
G1 X129.774 Y139.667 E.04231
; WIPE_START
G1 F15000
G1 X127.791 Y139.406 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.595 Y131.868 Z5.4 F42000
G1 X124.025 Y115.664 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.48085
G1 F4598
M204 S6000
G1 X124.236 Y117.265 E.0576
; WIPE_START
G1 F8220.498
G1 X124.025 Y115.664 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.998 Y117.978 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.192565
G1 F4598
M204 S6000
G1 X126.143 Y126.678 E.107
; WIPE_START
G1 F15000
G1 X125.882 Y124.695 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.032 Y128.342 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.387818
G1 F4598
M204 S6000
G1 X132.014 Y128 E.00962
; LINE_WIDTH: 0.423323
G1 X131.983 Y127.596 E.01255
; LINE_WIDTH: 0.467128
G2 X131.888 Y126.735 I-19.76 J1.743 E.02995
; WIPE_START
G1 F8486.412
G1 X131.983 Y127.596 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P58 R7
G1 X131.125 Y126.022 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4598
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
; LINE_WIDTH: 0.480839
G1 F4598
M204 S6000
G1 X130.321 Y114.835 E.05761
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.697
G1 X130.531 Y116.436 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/68
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z5.4 I-1.13 J-.452 P1  F42000
G1 X126.029 Y127.704 Z5.4
G1 Z5.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4604
M204 S5000
G1 X127.112 Y127.562 E.03358
G1 X131.501 Y126.984 E.13604
G1 X131.661 Y128.193 E.03749
G1 X126.188 Y128.914 E.16961
G1 X126.036 Y127.764 E.03564
M204 S10000
G1 X125.924 Y126.912 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4604
M204 S6000
G1 X125.894 Y126.916 E.00103
G1 X124.695 Y117.813 E.30457
G1 X125.247 Y117.74 E.01847
G1 X126.446 Y126.843 E.30458
G1 X125.984 Y126.904 E.01545
; WIPE_START
G1 F8843.478
G1 X125.894 Y126.916 E-.03454
G1 X125.645 Y125.023 E-.72546
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.876 Y126.26 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F4604
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
G1 X126.816 Y126.536 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F4604
M204 S6000
G1 X125.633 Y117.552 E.3006
G1 X127.048 Y117.366 E.04736
G1 X129.256 Y117.075 E.07386
G1 X130.49 Y126.448 E.31361
G1 X126.867 Y126.925 E.12121
G1 X126.824 Y126.596 E.01102
M204 S250
G1 X127.205 Y126.485 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4604
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
G1 X128.978 Y126.92 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4604
M204 S6000
G1 X125.543 Y127.373 E.11491
G1 X124.239 Y117.462 E.33158
G1 X130.58 Y116.627 E.21216
G1 X131.884 Y126.538 E.33158
G1 X129.037 Y126.913 E.09527
; WIPE_START
G1 F8843.478
G1 X127.054 Y127.174 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.784 Y134.608 Z5.6 F42000
G1 X130.069 Y140.131 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F4604
M204 S6000
G1 X124.535 Y139.403 E.18516
G1 X125.803 Y129.77 E.32229
G1 X126.375 Y129.695 E.01912
G1 X125.176 Y138.799 E.30459
G1 X129.606 Y139.382 E.14822
G1 X130.961 Y129.091 E.3443
G1 X131.533 Y129.016 E.01912
G1 X130.077 Y140.072 E.36991
M204 S10000
G1 X130.418 Y140.597 F42000
G1 F4604
M204 S6000
G1 X129.708 Y140.487 E.02384
G1 X124.781 Y139.839 E.16483
G1 X124.077 Y139.763 E.0235
G1 X125.542 Y128.638 E.37224
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
G1 X130.426 Y140.538 E.39241
; WIPE_START
G1 F8843.478
G1 X129.708 Y140.487 E-.27357
G1 X128.439 Y140.32 E-.48643
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.604 Y132.777 Z5.6 F42000
G1 X130.05 Y129.889 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4604
M204 S5000
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.416 Y135.502 E.08085
G1 X127.205 Y129.515 E.18556
G1 X129.991 Y129.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.743 Y131.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.255 Y124.651 Z5.6 F42000
G1 X124.622 Y117.016 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F4604
M204 S5000
G1 X124.462 Y115.807 E.03749
G1 X125.546 Y115.664 E.03358
G1 X129.935 Y115.086 E.13604
G1 X130.094 Y116.296 E.03749
G1 X124.681 Y117.009 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.462 Y115.807 E-.46416
G1 X125.234 Y115.705 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.89 Y123.156 Z5.6 F42000
G1 X130.794 Y140.728 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F4604
M204 S5000
G1 X130.79 Y140.758 E.00094
G1 X130.783 Y140.795 E.00114
G1 F4572.254
G1 X130.759 Y140.862 E.00219
G1 F3929.676
G1 X130.744 Y140.89 E.00097
G1 F3658.961
G1 X130.708 Y140.943 E.00197
G1 F3141.378
G1 X130.695 Y140.956 E.00057
G1 F3000
G1 X130.65 Y140.993 E.0018
G1 F2760
G1 X130.621 Y141.007 E.00098
G1 F2640
G3 X130.389 Y140.99 I-.084 J-.439 E.00724
G1 F2760
G2 X129.058 Y140.797 I-4.931 J29.452 E.04134
G1 X125.33 Y140.307 E.11553
G2 X124.06 Y140.156 I-3.817 J26.697 E.03929
G1 F2640
G3 X123.773 Y140.104 I-.046 J-.573 E.00906
G1 F2760
G1 X123.761 Y140.095 E.00048
G1 F2880
G1 X123.75 Y140.084 E.00045
G1 F3000
G1 X123.722 Y140.046 E.00146
G1 F3320.417
G1 X123.703 Y140.009 E.00126
G1 F3542.849
G1 X123.694 Y139.984 E.00084
G1 F4199.623
G1 X123.678 Y139.909 E.00234
G1 F4604
G1 X123.675 Y139.833 E.00233
G1 X123.676 Y139.822 E.00033
G1 X123.728 Y139.426 E.01229
G1 X125.188 Y128.322 E.34412
G2 X125.188 Y127.678 I-4.378 J-.322 E.01982
G1 X123.614 Y115.72 E.3706
G3 X123.775 Y115.5 I.191 J-.03 E.00932
G1 X130.509 Y114.613 E.20872
G3 X130.586 Y114.616 I.03 J.216 E.00236
G3 X130.733 Y114.785 I-.046 J.188 E.00734
G1 X132.306 Y126.736 E.37039
G3 X132.306 Y129.264 I-10.793 J1.264 E.07785
G1 X130.802 Y140.669 E.35346
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.79 Y140.758 E-.03442
G1 X130.783 Y140.795 E-.01406
G1 X130.759 Y140.862 E-.02705
G1 X130.744 Y140.89 E-.01205
G1 X130.708 Y140.943 E-.02436
G1 X130.695 Y140.956 E-.007
G1 X130.65 Y140.993 E-.02222
G1 X130.621 Y141.007 E-.0121
G1 X130.389 Y140.99 E-.08855
G1 X129.058 Y140.797 E-.51118
G1 X129.039 Y140.795 E-.00702
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X129.778 Y139.746 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.313779
G1 F4604
M204 S6000
G1 X124.93 Y139.108 E.10791
G1 X124.902 Y139.059 E.00125
; LINE_WIDTH: 0.25362
G1 X124.888 Y139.011 E.00085
; LINE_WIDTH: 0.212941
G1 X124.874 Y138.964 E.00068
; LINE_WIDTH: 0.192585
G1 X126.062 Y129.942 E.11099
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
G1 F4604
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
G1 F4604
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
; LINE_WIDTH: 0.192685
G1 F4604
M204 S6000
G1 X129.856 Y139.62 E.12749
G1 X129.83 Y139.662 E.0006
; LINE_WIDTH: 0.253654
G1 X129.804 Y139.704 E.00085
; LINE_WIDTH: 0.294363
G1 X129.778 Y139.746 E.00101
; WIPE_START
G1 F14317.38
G1 X129.804 Y139.704 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.02 Y132.283 Z5.6 F42000
G1 X124.025 Y115.664 Z5.6
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.48084
G1 F4604
M204 S6000
G1 X124.236 Y117.265 E.0576
; WIPE_START
G1 F8220.687
G1 X124.025 Y115.664 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.998 Y117.978 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.192565
G1 F4604
M204 S6000
G1 X126.143 Y126.678 E.107
; WIPE_START
G1 F15000
G1 X125.882 Y124.695 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.032 Y128.342 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.387819
G1 F4604
M204 S6000
G1 X132.014 Y128 E.00962
; LINE_WIDTH: 0.423333
G1 X131.983 Y127.596 E.01256
; LINE_WIDTH: 0.467128
G2 X131.888 Y126.735 I-19.78 J1.745 E.02994
; WIPE_START
G1 F8486.409
G1 X131.983 Y127.596 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.125 Y126.022 Z5.6 F42000
M73 P59 R7
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4604
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
; LINE_WIDTH: 0.480854
G1 F4604
M204 S6000
G1 X130.321 Y114.835 E.05761
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.423
G1 X130.531 Y116.436 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/68
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z5.6 I-1.13 J-.452 P1  F42000
G1 X126.029 Y127.704 Z5.6
G1 Z5.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4632
M204 S5000
G1 X126.917 Y127.587 E.02755
G1 X131.501 Y126.984 E.14207
G1 X131.661 Y128.193 E.03749
G1 X126.188 Y128.914 E.16961
G1 X126.036 Y127.764 E.03564
M204 S10000
G1 X125.924 Y126.912 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4632
M204 S6000
G1 X125.894 Y126.916 E.00103
G1 X124.695 Y117.813 E.30457
G1 X125.247 Y117.74 E.01847
G1 X126.446 Y126.843 E.30458
G1 X125.984 Y126.904 E.01545
; WIPE_START
G1 F8843.478
G1 X125.894 Y126.916 E-.03455
G1 X125.644 Y125.023 E-.72545
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.876 Y126.26 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
G1 F4632
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
G1 X126.816 Y126.536 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
G1 F4632
M204 S6000
G1 X125.633 Y117.552 E.30061
G1 X127.101 Y117.359 E.04912
G1 X129.256 Y117.075 E.07209
G1 X130.49 Y126.448 E.31361
G1 X126.867 Y126.925 E.12121
G1 X126.824 Y126.596 E.01102
M204 S250
G1 X127.205 Y126.485 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4632
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
G1 X128.924 Y126.927 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4632
M204 S6000
G1 X125.543 Y127.373 E.11312
G1 X124.239 Y117.462 E.33158
G1 X130.58 Y116.627 E.21216
G1 X131.884 Y126.538 E.33158
G1 X128.984 Y126.92 E.09705
; WIPE_START
G1 F8843.478
G1 X127.001 Y127.181 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.73 Y134.615 Z5.8 F42000
G1 X130.049 Y140.286 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F4632
M204 S6000
G1 X124.515 Y139.558 E.18516
G1 X125.803 Y129.77 E.32747
G1 X126.375 Y129.695 E.01912
G1 X125.176 Y138.799 E.30459
G1 X129.606 Y139.382 E.14822
G1 X130.961 Y129.091 E.3443
G1 X131.533 Y129.016 E.01912
G1 X130.057 Y140.227 E.37509
M204 S10000
G1 X130.398 Y140.749 F42000
G1 F4632
M204 S6000
G1 X124.057 Y139.915 E.21216
G1 X125.542 Y128.638 E.37733
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
G1 X130.406 Y140.689 E.39748
; WIPE_START
G1 F8843.478
G1 X128.421 Y140.447 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.585 Y132.904 Z5.8 F42000
G1 X130.05 Y129.889 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4632
M204 S5000
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.44 Y135.324 E.08636
G1 X127.205 Y129.515 E.18004
G1 X129.991 Y129.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.743 Y131.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.255 Y124.651 Z5.8 F42000
G1 X124.622 Y117.016 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F4632
M204 S5000
G1 X124.462 Y115.807 E.03749
G1 X125.351 Y115.69 E.02755
G1 X129.935 Y115.086 E.14207
G1 X130.094 Y116.296 E.03749
G1 X124.681 Y117.009 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.462 Y115.807 E-.46416
G1 X125.234 Y115.705 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.87 Y123.16 Z5.8 F42000
G1 X130.767 Y140.928 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F4632
M204 S5000
G1 X130.761 Y140.96 E.001
G1 X130.737 Y141.026 E.00215
G1 F4063.229
G1 X130.725 Y141.05 E.00085
G1 F3823.236
G1 X130.693 Y141.098 E.00176
G1 F3348.227
G1 X130.68 Y141.114 E.00064
G1 F3183.486
G1 X130.663 Y141.131 E.00073
G1 F3000
G1 X130.638 Y141.152 E.00099
G1 F2880
G1 X130.618 Y141.165 E.00073
G1 F2760
G1 X130.592 Y141.175 E.00085
G1 F2640
G1 X130.583 Y141.176 E.00029
G1 F2760
G2 X123.754 Y140.273 I-37.144 J254.51 E.21166
G1 X123.724 Y140.244 E.00127
G1 F2880
G1 X123.712 Y140.229 E.0006
G1 F3092.475
G1 X123.697 Y140.205 E.00086
G1 F3292.942
G1 X123.685 Y140.182 E.00079
G1 F3677.975
G1 X123.669 Y140.138 E.00145
G1 F4056.09
G1 X123.659 Y140.096 E.00135
G1 F4512.284
G1 X123.653 Y140.046 E.00155
G1 F4632
G1 X123.652 Y140.006 E.00123
G1 X123.654 Y139.992 E.00042
G1 X123.706 Y139.595 E.01229
G1 X125.188 Y128.322 E.34937
G2 X125.188 Y127.678 I-4.378 J-.322 E.01982
G1 X123.614 Y115.72 E.3706
G3 X123.775 Y115.5 I.191 J-.029 E.00932
G1 X130.509 Y114.613 E.20871
G3 X130.586 Y114.616 I.03 J.216 E.00237
G3 X130.733 Y114.785 I-.046 J.188 E.00734
G1 X132.306 Y126.736 E.37039
G3 X132.306 Y129.264 I-9.871 J1.264 E.07789
G1 X130.775 Y140.869 E.35967
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.761 Y140.96 E-.03517
G1 X130.737 Y141.026 E-.02656
G1 X130.725 Y141.05 E-.01048
G1 X130.693 Y141.098 E-.02177
G1 X130.68 Y141.114 E-.00791
G1 X130.663 Y141.131 E-.00905
G1 X130.638 Y141.152 E-.01228
G1 X130.618 Y141.165 E-.00907
G1 X130.592 Y141.175 E-.01055
G1 X130.583 Y141.176 E-.00353
G1 X130.084 Y141.097 E-.19188
G1 X128.984 Y140.954 E-.42174
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X129.585 Y140.02 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.317297
G1 F4632
M204 S6000
G1 X129.675 Y139.887 E.0036
; LINE_WIDTH: 0.267412
G1 X129.766 Y139.753 E.00294
; LINE_WIDTH: 0.217527
G1 X129.856 Y139.62 E.00229
; LINE_WIDTH: 0.192589
G1 X131.219 Y129.263 E.12741
M204 S10000
G1 X130.748 Y129.147 F42000
; LINE_WIDTH: 0.429464
G1 F4632
M204 S6000
G1 X130.549 Y129.147 E.00627
; LINE_WIDTH: 0.385125
G1 X130.35 Y129.147 E.00555
; LINE_WIDTH: 0.340787
G1 X130.151 Y129.147 E.00483
; LINE_WIDTH: 0.296448
G1 X129.952 Y129.147 E.00411
; LINE_WIDTH: 0.252109
G1 X129.753 Y129.147 E.00339
; LINE_WIDTH: 0.20777
G1 X129.554 Y129.147 E.00267
; LINE_WIDTH: 0.163432
G1 X129.355 Y129.147 E.00195
; LINE_WIDTH: 0.119093
G1 X129.156 Y129.147 E.00124
; WIPE_START
G1 F15000
G1 X129.355 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.034 Y129.147 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.507829
G1 F4632
M204 S6000
G1 X127.708 Y129.147 E.01236
; LINE_WIDTH: 0.458953
G1 X127.382 Y129.147 E.01106
; LINE_WIDTH: 0.410077
G1 X127.055 Y129.147 E.00976
; WIPE_START
G1 F9805.069
G1 X127.382 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.062 Y129.942 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.192586
G1 F4632
M204 S6000
G1 X124.874 Y138.964 E.11099
; LINE_WIDTH: 0.217529
G1 X124.926 Y139.116 E.00229
; LINE_WIDTH: 0.267423
G1 X124.979 Y139.268 E.00294
; LINE_WIDTH: 0.317317
G1 X125.031 Y139.42 E.0036
M204 S10000
G1 X124.771 Y139.168 F42000
; LINE_WIDTH: 0.47481
G1 F4632
M204 S6000
G1 X129.902 Y139.844 E.18211
; WIPE_START
G1 F8335.46
G1 X127.919 Y139.583 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.692 Y132.049 Z5.8 F42000
G1 X124.025 Y115.664 Z5.8
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.480845
G1 F4632
M204 S6000
G1 X124.236 Y117.265 E.0576
; WIPE_START
G1 F8220.593
G1 X124.025 Y115.664 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.998 Y117.978 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.192565
G1 F4632
M204 S6000
G1 X126.143 Y126.678 E.107
; WIPE_START
G1 F15000
G1 X125.882 Y124.695 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.032 Y128.342 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.387818
G1 F4632
M204 S6000
G1 X132.014 Y128 E.00962
; LINE_WIDTH: 0.423332
G1 X131.983 Y127.596 E.01255
; LINE_WIDTH: 0.467122
G2 X131.888 Y126.735 I-19.78 J1.745 E.02995
; WIPE_START
G1 F8486.523
G1 X131.983 Y127.596 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.125 Y126.022 Z5.8 F42000
M73 P60 R7
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4632
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
; LINE_WIDTH: 0.48084
G1 F4632
M204 S6000
G1 X130.321 Y114.835 E.05761
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.691
G1 X130.531 Y116.436 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/68
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z5.8 I-1.13 J-.452 P1  F42000
G1 X126.029 Y127.704 Z5.8
G1 Z5.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4657
M204 S5000
G1 X126.723 Y127.613 E.02152
G1 X131.501 Y126.984 E.14809
G1 X131.661 Y128.193 E.03749
G1 X126.188 Y128.914 E.16961
G1 X126.036 Y127.764 E.03564
M204 S10000
G1 X125.924 Y126.912 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4657
M204 S6000
G1 X125.894 Y126.916 E.00103
G1 X124.695 Y117.813 E.30457
G1 X125.247 Y117.74 E.01847
G1 X126.446 Y126.843 E.30457
G1 X125.984 Y126.904 E.01545
; WIPE_START
G1 F8843.478
G1 X125.894 Y126.916 E-.03454
G1 X125.644 Y125.023 E-.72546
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.876 Y126.26 Z6 F42000
G1 Z5.6
G1 E.8 F1800
G1 F4657
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
G1 X126.816 Y126.536 Z6 F42000
G1 Z5.6
G1 E.8 F1800
G1 F4657
M204 S6000
G1 X125.633 Y117.552 E.30061
G1 X127.154 Y117.352 E.05089
G1 X129.256 Y117.075 E.07032
G1 X130.49 Y126.448 E.31361
G1 X126.867 Y126.925 E.12121
G1 X126.824 Y126.596 E.01102
M204 S250
G1 X127.205 Y126.485 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4657
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
G1 X128.882 Y126.933 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4657
M204 S6000
G1 X125.543 Y127.373 E.11169
G1 X124.239 Y117.462 E.33158
G1 X130.58 Y116.627 E.21216
G1 X131.884 Y126.538 E.33158
G1 X128.941 Y126.925 E.09848
; WIPE_START
G1 F8843.478
G1 X126.958 Y127.186 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.679 Y134.622 Z6 F42000
G1 X130.028 Y140.447 Z6
G1 Z5.6
G1 E.8 F1800
G1 F4657
M204 S6000
G1 X124.494 Y139.719 E.18516
G1 X125.803 Y129.77 E.33285
G1 X126.375 Y129.695 E.01912
G1 X125.176 Y138.799 E.30459
G1 X129.606 Y139.382 E.14822
G1 X130.961 Y129.091 E.3443
G1 X131.533 Y129.016 E.01912
G1 X130.035 Y140.388 E.38048
M204 S10000
G1 X130.378 Y140.904 F42000
G1 F4657
M204 S6000
G1 X124.037 Y140.069 E.21216
G1 X125.542 Y128.638 E.38247
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
G1 X130.386 Y140.845 E.40267
; WIPE_START
G1 F8843.478
G1 X128.401 Y140.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.562 Y133.058 Z6 F42000
G1 X130.05 Y129.889 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4657
M204 S5000
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.463 Y135.146 E.09187
G1 X127.205 Y129.515 E.17453
G1 X129.991 Y129.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.743 Y131.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.255 Y124.651 Z6 F42000
G1 X124.622 Y117.016 Z6
G1 Z5.6
G1 E.8 F1800
G1 F4657
M204 S5000
G1 X124.462 Y115.807 E.03749
G1 X125.157 Y115.715 E.02152
G1 X129.935 Y115.086 E.14809
G1 X130.094 Y116.296 E.03749
G1 X124.681 Y117.009 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.462 Y115.807 E-.46416
G1 X125.157 Y115.715 E-.26614
G1 X125.234 Y115.705 E-.0297
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.853 Y123.164 Z6 F42000
G1 X130.746 Y141.093 Z6
G1 Z5.6
G1 E.8 F1800
G1 F4657
M204 S5000
G1 X130.741 Y141.117 E.00077
G1 X130.73 Y141.152 E.0011
G1 F4545.215
G1 X130.71 Y141.199 E.00157
G1 F4079.925
G1 X130.687 Y141.24 E.00146
G1 F3670.14
G1 X130.651 Y141.288 E.00182
G1 F3188.71
G1 X130.633 Y141.304 E.00075
G1 F3000
G1 X130.616 Y141.314 E.00062
G1 F2880
G1 X130.501 Y141.316 E.00354
G1 F2760
G1 X123.784 Y140.431 E.20815
G1 F2880
G1 X123.706 Y140.407 E.00253
G1 F3000
G1 X123.682 Y140.383 E.00103
G1 F3043.158
G1 X123.679 Y140.379 E.00017
G1 F3750.325
G1 X123.647 Y140.297 E.00269
G1 F4437.869
G1 X123.633 Y140.22 E.00238
G1 F4657
G1 X123.631 Y140.17 E.00155
G1 X123.632 Y140.157 E.00041
G1 X123.684 Y139.76 E.01229
G1 X125.188 Y128.322 E.35449
G2 X125.188 Y127.679 I-3.929 J-.323 E.01978
G1 X123.614 Y115.72 E.37064
G3 X123.775 Y115.5 I.191 J-.03 E.00934
G1 X130.509 Y114.613 E.20869
G3 X130.586 Y114.616 I.03 J.217 E.00238
G3 X130.733 Y114.785 I-.046 J.188 E.00733
G1 X132.306 Y126.736 E.37039
G3 X132.306 Y129.264 I-10.794 J1.264 E.07786
G1 X130.754 Y141.033 E.36477
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.741 Y141.117 E-.03233
G1 X130.73 Y141.152 E-.01356
G1 X130.71 Y141.199 E-.01944
G1 X130.687 Y141.24 E-.01806
G1 X130.651 Y141.288 E-.02256
G1 X130.633 Y141.304 E-.0093
G1 X130.616 Y141.314 E-.00767
G1 X130.501 Y141.316 E-.04374
G1 X128.952 Y141.112 E-.59334
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X129.484 Y140.17 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.317336
G1 F4657
M204 S6000
G1 X129.608 Y139.987 E.00495
; LINE_WIDTH: 0.267444
G1 X129.732 Y139.803 E.00405
; LINE_WIDTH: 0.217551
G1 X129.856 Y139.62 E.00315
; LINE_WIDTH: 0.192599
G1 X131.219 Y129.263 E.12742
M204 S10000
G1 X130.748 Y129.147 F42000
; LINE_WIDTH: 0.429479
G1 F4657
M204 S6000
G1 X130.549 Y129.147 E.00627
; LINE_WIDTH: 0.385138
G1 X130.35 Y129.147 E.00555
; LINE_WIDTH: 0.340798
G1 X130.151 Y129.147 E.00483
; LINE_WIDTH: 0.296457
G1 X129.952 Y129.147 E.00411
; LINE_WIDTH: 0.252116
G1 X129.753 Y129.147 E.00339
; LINE_WIDTH: 0.207775
G1 X129.554 Y129.147 E.00267
; LINE_WIDTH: 0.163435
G1 X129.355 Y129.147 E.00195
; LINE_WIDTH: 0.119094
G1 X129.156 Y129.147 E.00124
; WIPE_START
G1 F15000
G1 X129.355 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.034 Y129.147 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.507818
G1 F4657
M204 S6000
G1 X127.708 Y129.147 E.01236
; LINE_WIDTH: 0.458947
G1 X127.382 Y129.147 E.01106
; LINE_WIDTH: 0.410076
G1 X127.055 Y129.147 E.00976
; WIPE_START
G1 F9805.108
G1 X127.382 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.062 Y129.942 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.192599
G1 F4657
M204 S6000
G1 X124.874 Y138.964 E.111
; LINE_WIDTH: 0.21753
G1 X124.946 Y139.173 E.00315
; LINE_WIDTH: 0.267426
G1 X125.018 Y139.383 E.00405
; LINE_WIDTH: 0.317323
G1 X125.091 Y139.592 E.00495
M204 S10000
G1 X124.761 Y139.249 F42000
; LINE_WIDTH: 0.637102
G1 F4657
M204 S6000
G1 X129.891 Y139.924 E.25055
; WIPE_START
G1 F6058.756
G1 X127.908 Y139.663 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.689 Y132.129 Z6 F42000
G1 X124.025 Y115.664 Z6
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.480847
G1 F4657
M204 S6000
G1 X124.236 Y117.265 E.0576
; WIPE_START
G1 F8220.546
G1 X124.025 Y115.664 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.998 Y117.978 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4657
M204 S6000
G1 X126.143 Y126.678 E.10701
; WIPE_START
G1 F15000
G1 X125.882 Y124.695 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.032 Y128.342 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.387835
G1 F4657
M204 S6000
G1 X132.014 Y128 E.00962
; LINE_WIDTH: 0.423347
G1 X131.983 Y127.596 E.01256
; LINE_WIDTH: 0.467125
G2 X131.888 Y126.735 I-19.738 J1.74 E.02994
; WIPE_START
G1 F8486.474
G1 X131.983 Y127.596 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.125 Y126.022 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.192576
M73 P61 R7
G1 F4657
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
G1 F4657
M204 S6000
G1 X130.321 Y114.835 E.05761
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.399
G1 X130.531 Y116.436 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/68
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z6 I-1.13 J-.452 P1  F42000
G1 X126.029 Y127.704 Z6
G1 Z5.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4571
M204 S5000
G1 X126.529 Y127.638 E.01549
G1 X131.501 Y126.984 E.15412
G1 X131.661 Y128.193 E.03749
G1 X126.188 Y128.914 E.16961
G1 X126.036 Y127.764 E.03564
M204 S10000
G1 X125.924 Y126.912 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4571
M204 S6000
G1 X125.894 Y126.916 E.00103
G1 X124.695 Y117.813 E.30457
G1 X125.247 Y117.74 E.01847
G1 X126.446 Y126.843 E.30458
G1 X125.984 Y126.904 E.01545
; WIPE_START
G1 F8843.478
G1 X125.894 Y126.916 E-.03456
G1 X125.644 Y125.023 E-.72544
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.876 Y126.26 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
G1 F4571
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
G1 X127.256 Y126.874 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
G1 F4571
M204 S6000
G1 X126.867 Y126.925 E.01301
G1 X125.633 Y117.552 E.31361
G1 X127.207 Y117.345 E.05266
G1 X129.256 Y117.075 E.06856
G1 X130.49 Y126.448 E.31361
G1 X127.315 Y126.866 E.10622
M204 S250
G1 X127.205 Y126.485 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4571
M204 S5000
G1 X126.073 Y117.889 E.2664
G1 X127.258 Y117.733 E.03673
G1 X128.918 Y117.515 E.05146
G1 X130.05 Y126.111 E.26641
G1 X127.264 Y126.477 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.989 Y124.496 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.857 Y126.936 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4571
M204 S6000
G1 X125.543 Y127.373 E.11087
G1 X124.239 Y117.462 E.33158
G1 X130.58 Y116.627 E.21216
G1 X131.884 Y126.538 E.33158
G1 X128.916 Y126.928 E.0993
; WIPE_START
G1 F8843.478
G1 X126.934 Y127.19 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.655 Y134.625 Z6.2 F42000
G1 X130.019 Y140.514 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F4571
M204 S6000
G1 X124.485 Y139.787 E.18516
G1 X125.803 Y129.77 E.33513
G1 X126.375 Y129.695 E.01912
G1 X125.176 Y138.799 E.30459
G1 X129.606 Y139.382 E.14822
G1 X130.961 Y129.091 E.3443
G1 X131.533 Y129.016 E.01912
G1 X130.027 Y140.454 E.38269
M204 S10000
G1 X130.369 Y140.97 F42000
G1 F4571
M204 S6000
G1 X124.028 Y140.137 E.21216
G1 X125.542 Y128.638 E.38476
G1 X125.756 Y128.638 E.0071
G1 X125.85 Y129.354 E.02395
G1 X126.848 Y129.222 E.03337
G1 X125.633 Y138.448 E.30868
G1 X129.256 Y138.925 E.12121
G1 X130.49 Y129.552 E.31361
G1 X128.231 Y129.254 E.07559
G1 X128.231 Y129.04 E.0071
G1 X131.979 Y128.547 E.1254
G1 X131.961 Y128.808 E.0087
G1 X130.377 Y140.911 E.40488
; WIPE_START
G1 F8843.478
G1 X128.392 Y140.669 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.552 Y133.125 Z6.2 F42000
G1 X130.05 Y129.889 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4571
M204 S5000
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.487 Y134.968 E.09738
G1 X127.205 Y129.515 E.16902
G1 X129.991 Y129.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.743 Y131.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.255 Y124.651 Z6.2 F42000
G1 X124.622 Y117.016 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F4571
M204 S5000
G1 X124.462 Y115.807 E.03749
G1 X124.962 Y115.741 E.01549
G1 X129.935 Y115.086 E.15412
G1 X130.094 Y116.296 E.03749
G1 X124.681 Y117.009 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.462 Y115.807 E-.46416
G1 X124.962 Y115.741 E-.19161
G1 X125.234 Y115.705 E-.10423
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.844 Y123.166 Z6.2 F42000
G1 X130.735 Y141.2 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F4571
M204 S5000
G3 X130.718 Y141.267 I-.188 J-.011 E.00215
G1 X130.709 Y141.289 E.00073
G3 X130.639 Y141.362 I-.181 J-.105 E.00314
G1 X130.607 Y141.377 E.00106
G1 X130.583 Y141.383 E.00077
G1 X129.942 Y141.31 E.01983
G1 X124.378 Y140.579 E.17245
G3 X123.758 Y140.496 I.394 J-5.305 E.01924
G1 X123.726 Y140.485 E.00102
G1 X123.701 Y140.472 E.00086
G1 X123.678 Y140.455 E.00089
G1 X123.659 Y140.436 E.00083
G3 X123.619 Y140.361 I.172 J-.14 E.00264
G1 X123.613 Y140.322 E.00121
G1 X125.188 Y128.322 E.37188
G2 X125.188 Y127.679 I-3.912 J-.323 E.01978
G1 X123.614 Y115.72 E.37064
G3 X123.775 Y115.5 I.192 J-.029 E.00932
G1 X130.509 Y114.613 E.2087
G3 X130.587 Y114.616 I.03 J.217 E.0024
G3 X130.733 Y114.785 I-.047 J.188 E.00732
G1 X132.306 Y126.736 E.37039
G3 X132.306 Y129.264 I-9.872 J1.264 E.07789
G1 X130.742 Y141.14 E.36807
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.718 Y141.267 E-.04921
G1 X130.709 Y141.289 E-.00909
G1 X130.639 Y141.362 E-.03839
G1 X130.607 Y141.377 E-.01313
G1 X130.583 Y141.383 E-.00949
G1 X129.942 Y141.31 E-.24521
G1 X128.91 Y141.174 E-.3955
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X129.856 Y139.62 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192583
G1 F4571
M204 S6000
G1 X131.219 Y129.263 E.1274
M204 S10000
G1 X130.748 Y129.147 F42000
; LINE_WIDTH: 0.429479
G1 F4571
M204 S6000
G1 X130.549 Y129.147 E.00627
; LINE_WIDTH: 0.385138
G1 X130.35 Y129.147 E.00555
; LINE_WIDTH: 0.340798
G1 X130.151 Y129.147 E.00483
; LINE_WIDTH: 0.296457
G1 X129.952 Y129.147 E.00411
; LINE_WIDTH: 0.252116
G1 X129.753 Y129.147 E.00339
; LINE_WIDTH: 0.207775
G1 X129.554 Y129.147 E.00267
; LINE_WIDTH: 0.163435
G1 X129.355 Y129.147 E.00195
; LINE_WIDTH: 0.119094
G1 X129.156 Y129.147 E.00124
; WIPE_START
G1 F15000
G1 X129.355 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.034 Y129.147 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.507818
G1 F4571
M204 S6000
G1 X127.708 Y129.147 E.01236
; LINE_WIDTH: 0.458947
G1 X127.382 Y129.147 E.01106
; LINE_WIDTH: 0.410076
G1 X127.055 Y129.147 E.00976
; WIPE_START
G1 F9805.108
G1 X127.382 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.062 Y129.942 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.1926
G1 F4571
M204 S6000
G1 X124.874 Y138.964 E.11099
M204 S10000
G1 X124.971 Y139.414 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.5041
G1 F4571
M204 S6000
G1 X125.154 Y139.436 E.00696
; LINE_WIDTH: 0.530798
G1 X125.224 Y139.42 E.00282
; LINE_WIDTH: 0.580753
G1 X125.293 Y139.404 E.00311
; LINE_WIDTH: 0.630708
G1 X125.362 Y139.388 E.0034
; LINE_WIDTH: 0.704585
G1 X125.431 Y139.372 E.00383
G1 X129.213 Y139.869 E.20565
; LINE_WIDTH: 0.684066
G1 X129.27 Y139.897 E.00336
; LINE_WIDTH: 0.643358
G1 X129.328 Y139.925 E.00315
; LINE_WIDTH: 0.60265
G1 X129.386 Y139.953 E.00294
; LINE_WIDTH: 0.561942
G1 X129.444 Y139.981 E.00272
; LINE_WIDTH: 0.509593
G2 X129.587 Y140.021 I.13 J-.195 E.00574
; WIPE_START
G1 F7714.19
G1 X129.444 Y139.981 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.784 Y132.532 Z6.2 F42000
G1 X124.025 Y115.664 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.480841
G1 F4571
M204 S6000
G1 X124.236 Y117.265 E.0576
; WIPE_START
G1 F8220.672
G1 X124.025 Y115.664 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.998 Y117.978 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.192573
G1 F4571
M204 S6000
G1 X126.143 Y126.678 E.10701
; WIPE_START
G1 F15000
G1 X125.882 Y124.695 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.032 Y128.342 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.387818
G1 F4571
M204 S6000
G1 X132.014 Y128 E.00962
; LINE_WIDTH: 0.423332
G1 X131.983 Y127.596 E.01256
; LINE_WIDTH: 0.467125
G2 X131.888 Y126.735 I-19.718 J1.738 E.02994
; WIPE_START
G1 F8486.479
G1 X131.983 Y127.596 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.125 Y126.022 Z6.2 F42000
M73 P62 R7
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4571
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
G1 F4571
M204 S6000
G1 X130.321 Y114.835 E.05761
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.399
G1 X130.531 Y116.436 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/68
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z6.2 I-1.13 J-.452 P1  F42000
G1 X126.029 Y127.704 Z6.2
G1 Z6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4570
M204 S5000
G1 X126.334 Y127.664 E.00947
G1 X131.501 Y126.984 E.16015
G1 X131.661 Y128.193 E.03749
G1 X126.188 Y128.914 E.16961
G1 X126.036 Y127.764 E.03564
M204 S10000
G1 X125.924 Y126.912 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4570
M204 S6000
G1 X125.894 Y126.916 E.00103
G1 X124.695 Y117.813 E.30457
G1 X125.247 Y117.74 E.01847
G1 X126.446 Y126.843 E.30458
G1 X125.984 Y126.904 E.01545
; WIPE_START
G1 F8843.478
G1 X125.894 Y126.916 E-.03456
G1 X125.645 Y125.023 E-.72544
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.876 Y126.26 Z6.4 F42000
G1 Z6
G1 E.8 F1800
G1 F4570
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
G1 X127.256 Y126.874 Z6.4 F42000
G1 Z6
G1 E.8 F1800
G1 F4570
M204 S6000
G1 X126.867 Y126.925 E.01301
G1 X125.633 Y117.552 E.31361
G1 X127.26 Y117.338 E.05442
G1 X129.256 Y117.075 E.06679
G1 X130.49 Y126.448 E.31361
G1 X127.315 Y126.866 E.10622
M204 S250
G1 X127.205 Y126.485 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4570
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
G1 X128.853 Y126.937 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4570
M204 S6000
G1 X125.543 Y127.373 E.11074
G1 X124.239 Y117.462 E.33158
G1 X130.58 Y116.627 E.21216
G1 X131.884 Y126.538 E.33158
G1 X128.912 Y126.929 E.09944
; WIPE_START
G1 F8843.478
G1 X126.93 Y127.19 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.653 Y134.625 Z6.4 F42000
G1 X130.018 Y140.517 Z6.4
G1 Z6
G1 E.8 F1800
G1 F4570
M204 S6000
G1 X124.485 Y139.788 E.18516
G1 X125.803 Y129.77 E.33517
G1 X126.375 Y129.695 E.01912
G1 X125.176 Y138.799 E.30459
G1 X129.606 Y139.382 E.14822
G1 X130.961 Y129.091 E.3443
G1 X131.533 Y129.016 E.01912
G1 X130.026 Y140.457 E.38279
M204 S10000
G1 X130.369 Y140.973 F42000
G1 F4570
M204 S6000
G1 X124.028 Y140.138 E.21216
G1 X125.542 Y128.638 E.38479
G1 X125.756 Y128.638 E.0071
G1 X125.85 Y129.354 E.02395
M73 P62 R6
G1 X126.848 Y129.222 E.03337
G1 X125.633 Y138.448 E.30868
G1 X129.256 Y138.925 E.12121
G1 X130.49 Y129.552 E.31361
G1 X128.231 Y129.254 E.07559
G1 X128.231 Y129.04 E.0071
G1 X131.979 Y128.547 E.1254
G1 X131.961 Y128.808 E.0087
G1 X130.377 Y140.914 E.40498
; WIPE_START
G1 F8843.478
G1 X128.391 Y140.671 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.552 Y133.128 Z6.4 F42000
G1 X130.05 Y129.889 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4570
M204 S5000
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.51 Y134.791 E.10289
G1 X127.205 Y129.515 E.16351
G1 X129.991 Y129.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.743 Y131.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.255 Y124.651 Z6.4 F42000
G1 X124.622 Y117.016 Z6.4
G1 Z6
G1 E.8 F1800
G1 F4570
M204 S5000
G1 X124.462 Y115.807 E.03749
G1 X124.768 Y115.767 E.00947
G1 X129.935 Y115.086 E.16015
G1 X130.094 Y116.296 E.03749
G1 X124.681 Y117.009 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.462 Y115.807 E-.46415
G1 X124.768 Y115.767 E-.11707
G1 X125.234 Y115.705 E-.17878
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.842 Y123.166 Z6.4 F42000
G1 X130.733 Y141.215 Z6.4
G1 Z6
G1 E.8 F1800
G1 F4570
M204 S5000
G3 X130.512 Y141.388 I-.193 J-.02 E.00959
G1 X123.776 Y140.501 E.20879
G3 X123.614 Y140.277 I.031 J-.193 E.00939
G1 X125.188 Y128.322 E.37052
G2 X125.188 Y127.679 I-3.895 J-.323 E.01978
G1 X123.614 Y115.72 E.37064
G3 X123.776 Y115.5 I.191 J-.029 E.00934
G1 X130.509 Y114.613 E.20869
G3 X130.586 Y114.616 I.03 J.217 E.00239
G3 X130.733 Y114.785 I-.047 J.188 E.00731
G1 X132.306 Y126.736 E.3704
G3 X132.306 Y129.264 I-9.87 J1.264 E.07789
G1 X130.74 Y141.156 E.36856
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.711 Y141.287 E-.05125
G1 X130.665 Y141.344 E-.02761
G1 X130.609 Y141.377 E-.02491
G1 X130.512 Y141.388 E-.03681
G1 X128.896 Y141.175 E-.61942
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X129.856 Y139.62 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192592
G1 F4570
M204 S6000
G1 X131.219 Y129.263 E.12741
M204 S10000
G1 X130.748 Y129.147 F42000
; LINE_WIDTH: 0.429479
G1 F4570
M204 S6000
G1 X130.549 Y129.147 E.00627
; LINE_WIDTH: 0.385138
G1 X130.35 Y129.147 E.00555
; LINE_WIDTH: 0.340798
G1 X130.151 Y129.147 E.00483
; LINE_WIDTH: 0.296457
G1 X129.952 Y129.147 E.00411
; LINE_WIDTH: 0.252116
G1 X129.753 Y129.147 E.00339
; LINE_WIDTH: 0.207775
G1 X129.554 Y129.147 E.00267
; LINE_WIDTH: 0.163435
G1 X129.355 Y129.147 E.00195
; LINE_WIDTH: 0.119094
G1 X129.156 Y129.147 E.00124
; WIPE_START
G1 F15000
G1 X129.355 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.034 Y129.147 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.507818
G1 F4570
M204 S6000
G1 X127.708 Y129.147 E.01236
; LINE_WIDTH: 0.458947
G1 X127.382 Y129.147 E.01106
; LINE_WIDTH: 0.410076
G1 X127.055 Y129.147 E.00976
; WIPE_START
G1 F9805.108
G1 X127.382 Y129.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.062 Y129.942 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.19259
G1 F4570
M204 S6000
G1 X124.874 Y138.964 E.11099
M204 S10000
G1 X124.971 Y139.414 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50525
G1 F4570
M204 S6000
G1 X125.154 Y139.437 E.00695
; LINE_WIDTH: 0.531993
G1 X125.224 Y139.421 E.00283
; LINE_WIDTH: 0.581978
G1 X125.293 Y139.405 E.00312
; LINE_WIDTH: 0.631963
G1 X125.362 Y139.388 E.00341
; LINE_WIDTH: 0.681948
G1 X125.431 Y139.372 E.0037
; LINE_WIDTH: 0.70702
G1 X129.212 Y139.87 E.20634
; LINE_WIDTH: 0.68676
G1 X129.27 Y139.898 E.00339
; LINE_WIDTH: 0.64608
G1 X129.328 Y139.926 E.00317
; LINE_WIDTH: 0.6054
G1 X129.386 Y139.955 E.00296
; LINE_WIDTH: 0.56472
G1 X129.444 Y139.983 E.00274
; LINE_WIDTH: 0.512508
G2 X129.585 Y140.022 I.13 J-.194 E.00572
; WIPE_START
G1 F7666.296
G1 X129.444 Y139.983 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.784 Y132.533 Z6.4 F42000
G1 X124.025 Y115.664 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.480844
G1 F4570
M204 S6000
G1 X124.236 Y117.265 E.0576
; WIPE_START
G1 F8220.613
G1 X124.025 Y115.664 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.998 Y117.978 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.192572
G1 F4570
M204 S6000
G1 X126.143 Y126.678 E.107
; WIPE_START
G1 F15000
G1 X125.882 Y124.695 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.032 Y128.342 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.387838
G1 F4570
M204 S6000
G1 X132.014 Y128 E.00963
; LINE_WIDTH: 0.423351
G1 X131.983 Y127.596 E.01255
; LINE_WIDTH: 0.467125
G2 X131.888 Y126.735 I-19.775 J1.744 E.02994
; WIPE_START
G1 F8486.471
G1 X131.983 Y127.596 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.125 Y126.022 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.192576
G1 F4570
M204 S6000
M73 P63 R6
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
; LINE_WIDTH: 0.480842
G1 F4570
M204 S6000
G1 X130.321 Y114.835 E.05761
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8220.648
G1 X130.531 Y116.436 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/68
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z6.4 I-1.217 J.028 P1  F42000
G1 X130.842 Y129.994 Z6.4
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4893
M204 S6000
G1 X129.606 Y139.382 E.31411
G1 X125.176 Y138.799 E.14822
G1 X125.741 Y134.509 E.14354
G1 X126.382 Y129.64 E.1629
G1 X126.434 Y129.243 E.01327
G1 X126.486 Y128.847 E.01327
G1 F2880
G1 X126.517 Y128.618 E.00764
G1 X127.369 Y128.73 E.02853
G1 F4893
G1 X127.766 Y128.783 E.01327
G1 X128.162 Y128.835 E.01327
G1 X130.947 Y129.201 E.09316
G1 X130.85 Y129.934 E.02452
M204 S10000
G1 X130.101 Y129.501 F42000
G1 F4893
M204 S6000
G1 X130.49 Y129.552 E.01301
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.145 Y134.562 E.13003
G1 X126.867 Y129.075 E.18358
G1 X130.042 Y129.493 E.10622
M204 S250
G1 X130.05 Y129.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4893
M204 S5000
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.533 Y134.613 E.1084
G1 X127.205 Y129.515 E.158
G1 X129.991 Y129.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.743 Y131.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.6 I1.075 J-.57 P1  F42000
G1 X127.309 Y127.278 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4893
M204 S6000
G1 X126.517 Y127.382 E.02651
G1 X125.176 Y117.201 E.34062
G1 X127.259 Y116.927 E.06969
G1 X129.606 Y116.618 E.07853
G1 X130.947 Y126.799 E.34062
G1 X127.368 Y127.27 E.11972
M204 S10000
G1 X127.256 Y126.874 F42000
G1 F4893
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
G1 F4893
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
G1 X126.006 Y128.05 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4893
M204 S6000
G1 X126.009 Y128 E.00167
G2 X125.982 Y127.583 I-3.182 J0 E.01387
G1 X124.641 Y117.402 E.34064
G1 X124.589 Y117.005 E.01327
G1 X124.537 Y116.609 E.01327
G1 F3164.163
G1 X124.485 Y116.212 E.01327
G1 F814.422
G1 X124.542 Y116.205 E.00194
M106 S255
G1 F600
G1 X129.961 Y115.491 E.18128
M106 S201.45
G1 F814.472
G1 X130.018 Y115.483 E.00194
G1 F3164.261
G1 X130.071 Y115.88 E.01327
G1 F4893
G1 X130.123 Y116.277 E.01327
G1 X130.175 Y116.673 E.01327
G1 X131.512 Y126.832 E.33988
G3 X131.586 Y127.837 I-9.491 J1.199 E.03346
G1 X131.59 Y128 E.0054
G1 X131.586 Y128.175 E.00582
G3 X131.513 Y129.168 I-9.565 J-.206 E.03304
G1 X130.018 Y140.517 E.37969
G1 X124.485 Y139.788 E.18516
G1 X125.982 Y128.417 E.38045
G1 X126.002 Y128.11 E.01021
M204 S10000
G1 X125.6 Y128.026 F42000
G1 F4893
M204 S6000
G1 X125.591 Y128 E.0009
G2 X125.577 Y127.631 I-4.997 J0 E.01224
G1 X124.028 Y115.862 E.39379
G1 X130.369 Y115.027 E.21216
G1 X131.917 Y126.783 E.39334
G3 X131.917 Y129.217 I-10.361 J1.217 E.08093
G1 X130.369 Y140.973 E.39334
G1 X124.028 Y140.138 E.21216
G1 X125.577 Y128.369 E.39379
G1 X125.596 Y128.086 E.00941
M204 S250
G1 X125.201 Y127.874 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4893
M204 S5000
G1 X125.188 Y127.678 E.00604
G1 X123.614 Y115.72 E.37059
G3 X123.776 Y115.499 I.191 J-.03 E.00936
G1 X130.509 Y114.613 E.20867
G3 X130.587 Y114.616 I.03 J.217 E.0024
G3 X130.733 Y114.785 I-.047 J.188 E.00731
G1 X132.306 Y126.736 E.37039
G3 X132.306 Y129.264 I-10.794 J1.264 E.07786
G1 X130.733 Y141.215 E.3704
G3 X130.512 Y141.388 I-.193 J-.02 E.00961
G1 X123.775 Y140.5 E.20878
G3 X123.614 Y140.277 I.032 J-.193 E.00939
G1 X125.188 Y128.322 E.37052
G2 X125.2 Y128 I-4.389 J-.322 E.00991
G1 X125.2 Y127.934 E.00203
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.188 Y127.678 E-.0975
G1 X124.96 Y125.949 E-.6625
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X126.266 Y127.62 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.193375
G1 F4893
M204 S6000
G1 X124.874 Y117.036 E.13088
M204 S10000
G1 X129.58 Y116.279 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.4338
M106 S255
G1 F3000
M204 S6000
G1 X125.282 Y116.845 E.13808
G1 X125.257 Y116.65 E.00627
G1 X125.178 Y116.66 E.00252
G1 X125.163 Y116.543 E.00375
G1 X124.965 Y116.569 E.00636
G1 X124.955 Y116.493 E.00243
G1 X129.805 Y115.855 E.15583
M106 S201.45
M204 S10000
G1 X129.856 Y116.38 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192599
G1 F4893
M204 S6000
G1 X131.248 Y126.964 E.1302
; WIPE_START
G1 F15000
G1 X130.987 Y124.981 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.6 I-1.214 J.078 P1  F42000
G1 X131.248 Y129.036 Z6.6
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.191502
G1 F4893
M204 S6000
G1 X129.856 Y139.62 E.12925
M204 S10000
G1 X124.971 Y139.414 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50527
G1 F4893
M204 S6000
G1 X125.155 Y139.437 E.00697
; LINE_WIDTH: 0.532013
G1 X125.224 Y139.421 E.00283
; LINE_WIDTH: 0.581998
G1 X125.293 Y139.405 E.00312
; LINE_WIDTH: 0.631983
G1 X125.362 Y139.388 E.00341
; LINE_WIDTH: 0.681968
G1 X125.432 Y139.372 E.0037
; LINE_WIDTH: 0.70702
G1 X129.212 Y139.87 E.20635
; LINE_WIDTH: 0.686736
G1 X129.27 Y139.898 E.00338
; LINE_WIDTH: 0.646048
G1 X129.328 Y139.926 E.00317
; LINE_WIDTH: 0.60536
G1 X129.386 Y139.955 E.00296
; LINE_WIDTH: 0.564672
G1 X129.444 Y139.983 E.00274
; LINE_WIDTH: 0.512511
G2 X129.585 Y140.022 I.129 J-.192 E.00569
M204 S10000
G1 X124.874 Y138.964 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.193363
G1 F4893
M204 S6000
G1 X126.266 Y128.38 E.13087
M204 S10000
G1 X126.544 Y127.737 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.46436
M106 S255
G1 F3000
M204 S6000
G1 X130.842 Y127.171 E.14886
G1 X130.865 Y127.346 E.00606
G1 X130.944 Y127.336 E.00272
G1 X130.959 Y127.457 E.00418
G1 X131.158 Y127.431 E.00688
G1 X131.174 Y127.552 E.0042
G1 X126.732 Y128.137 E.15387
G1 X126.71 Y128.307 E.00591
G1 X127.224 Y128.375 E.01782
G1 X128.191 Y128.248 E.03348
G1 X128.191 Y128.37 E.00419
G1 X131.229 Y127.97 E.10525
G1 X131.253 Y128.079 E.00384
G1 X131.239 Y128.394 E.01081
G1 X128.652 Y128.734 E.0896
M106 S201.45
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
G1 X130.635 Y128.473 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/68
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z6.6 I-1.206 J.164 P1  F42000
G1 X130.842 Y129.994 Z6.6
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4195
M204 S6000
G1 X129.606 Y139.382 E.31411
G1 X125.176 Y138.799 E.14822
G1 X125.765 Y134.331 E.14949
G1 X126.517 Y128.618 E.19113
G1 X130.947 Y129.201 E.14822
G1 X130.85 Y129.934 E.02452
M204 S10000
G1 X130.101 Y129.501 F42000
G1 F4195
M204 S6000
G1 X130.49 Y129.552 E.01301
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.168 Y134.384 E.13598
G1 X126.867 Y129.075 E.17763
G1 X130.042 Y129.493 E.10622
M204 S250
G1 X130.05 Y129.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4195
M204 S5000
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.557 Y134.435 E.11391
G1 X127.205 Y129.515 E.15249
G1 X129.991 Y129.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.743 Y131.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.8 I1.029 J-.65 P1  F42000
G1 X126.412 Y126.59 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4195
M204 S6000
G1 X125.176 Y117.201 E.31411
G1 X127.312 Y116.92 E.07146
G1 X129.606 Y116.618 E.07676
G1 X130.947 Y126.799 E.34062
G1 X126.517 Y127.382 E.14822
M73 P64 R6
G1 X126.42 Y126.649 E.02452
M204 S10000
G1 X126.816 Y126.536 F42000
G1 F4195
M204 S6000
G1 X125.633 Y117.552 E.30061
G1 X127.365 Y117.324 E.05796
G1 X129.256 Y117.075 E.06326
G1 X130.49 Y126.448 E.31361
G1 X126.867 Y126.925 E.12121
G1 X126.824 Y126.596 E.01102
M204 S250
G1 X127.205 Y126.485 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4195
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
G1 X126.005 Y128.044 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4195
M204 S6000
G1 X126.001 Y127.989 E.00183
G2 X125.982 Y127.583 I-4.417 J.013 E.01349
G1 X124.485 Y116.212 E.38044
G1 X130.018 Y115.483 E.18516
G1 X131.512 Y126.832 E.37969
G3 X131.513 Y129.168 I-9.912 J1.168 E.07769
G1 X130.018 Y140.517 E.37969
G1 X124.485 Y139.788 E.18516
G1 X125.983 Y128.407 E.3808
G1 X126.001 Y128.104 E.01006
M204 S10000
G1 X125.599 Y128.022 F42000
G1 F4195
M204 S6000
G1 X125.595 Y127.993 E.00096
G2 X125.577 Y127.631 I-3.865 J.008 E.01203
G1 X124.028 Y115.862 E.39378
G1 X130.369 Y115.027 E.21216
G1 X131.917 Y126.783 E.39334
G3 X131.917 Y129.217 I-10.361 J1.217 E.08093
G1 X130.369 Y140.973 E.39334
G1 X124.028 Y140.138 E.21216
G1 X125.578 Y128.362 E.394
G1 X125.596 Y128.082 E.00933
M204 S250
G1 X125.201 Y127.877 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4195
M204 S5000
G1 X125.188 Y127.678 E.00614
G1 X123.614 Y115.72 E.3706
G3 X123.776 Y115.499 I.191 J-.03 E.00936
G1 X130.509 Y114.613 E.20868
G3 X130.587 Y114.616 I.03 J.216 E.00239
G3 X130.733 Y114.785 I-.047 J.188 E.00732
G1 X132.306 Y126.736 E.37038
G3 X132.306 Y129.264 I-10.794 J1.264 E.07786
G1 X130.733 Y141.215 E.3704
G3 X130.512 Y141.388 I-.193 J-.02 E.00961
G1 X123.775 Y140.5 E.20878
G3 X123.614 Y140.278 I.032 J-.193 E.00937
G1 X125.188 Y128.32 E.37061
G2 X125.204 Y127.998 I-3.322 J-.32 E.00992
G1 X125.202 Y127.937 E.00186
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.188 Y127.678 E-.09869
G1 X124.961 Y125.952 E-.66131
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X126.266 Y127.62 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.193364
G1 F4195
M204 S6000
G1 X124.874 Y117.036 E.13087
M204 S10000
G1 X124.971 Y116.586 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50345
G1 F4195
M204 S6000
G1 X125.115 Y116.567 E.00544
; LINE_WIDTH: 0.523806
G1 X125.178 Y116.579 E.00253
; LINE_WIDTH: 0.564498
G1 X125.242 Y116.591 E.00274
; LINE_WIDTH: 0.60519
G1 X125.305 Y116.603 E.00296
; LINE_WIDTH: 0.645882
G1 X125.368 Y116.615 E.00317
; LINE_WIDTH: 0.706661
G1 X125.432 Y116.628 E.00349
G1 X129.212 Y116.13 E.20621
; LINE_WIDTH: 0.686738
G1 X129.27 Y116.102 E.00338
; LINE_WIDTH: 0.646054
G1 X129.328 Y116.074 E.00317
; LINE_WIDTH: 0.60537
G1 X129.386 Y116.045 E.00296
; LINE_WIDTH: 0.564686
G1 X129.444 Y116.017 E.00274
; LINE_WIDTH: 0.512474
G3 X129.585 Y115.978 I.13 J.194 E.00572
M204 S10000
G1 X129.856 Y116.38 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192597
G1 F4195
M204 S6000
G1 X131.248 Y126.964 E.1302
M204 S10000
G1 X130.482 Y127.963 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.3829
G1 F4195
M204 S6000
G1 X130.418 Y128 E.00204
G1 X130.466 Y128.028 E.00155
M204 S10000
G1 X127.713 Y128 F42000
; LINE_WIDTH: 0.41999
G1 F4195
M204 S6000
G1 X130.632 Y128.384 E.09045
G1 X130.674 Y128.318 E.00243
G1 X130.807 Y128.288 E.00417
G2 X130.802 Y127.709 I-3.009 J-.266 E.01783
G1 X130.675 Y127.68 E.00401
G1 X130.634 Y127.616 E.00236
G1 X127.773 Y127.992 E.08866
M204 S10000
G1 X126.758 Y127.869 F42000
; LINE_WIDTH: 0.419232
G1 F4195
M204 S6000
G1 X126.697 Y127.939 E.00285
G1 X126.424 Y127.945 E.00835
G1 X126.691 Y128.246 E.01234
G1 X130.789 Y128.785 E.12673
G1 X130.877 Y128.636 E.00531
G3 X131.17 Y128.63 I.154 J.4 E.00917
G2 X131.16 Y127.37 I-9.092 J-.564 E.03869
G1 X130.876 Y127.361 E.00872
G1 X130.777 Y127.216 E.00538
G1 X126.776 Y127.743 E.12376
G1 X126.766 Y127.81 E.00206
M204 S10000
G1 X126.192 Y128.37 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192274
G1 F4195
M204 S6000
G1 X126.257 Y128.454 E.0013
G1 X124.874 Y138.964 E.12901
M204 S10000
G1 X124.971 Y139.414 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50527
G1 F4195
M204 S6000
G1 X125.154 Y139.437 E.00695
; LINE_WIDTH: 0.532013
G1 X125.223 Y139.421 E.00283
; LINE_WIDTH: 0.581998
G1 X125.293 Y139.404 E.00312
; LINE_WIDTH: 0.631983
G1 X125.362 Y139.388 E.00341
; LINE_WIDTH: 0.681968
G1 X125.431 Y139.372 E.0037
; LINE_WIDTH: 0.70702
G1 X129.212 Y139.87 E.20638
; LINE_WIDTH: 0.686736
G1 X129.27 Y139.898 E.00338
; LINE_WIDTH: 0.646048
G1 X129.328 Y139.926 E.00317
; LINE_WIDTH: 0.60536
G1 X129.386 Y139.955 E.00296
; LINE_WIDTH: 0.564672
G1 X129.444 Y139.983 E.00274
; LINE_WIDTH: 0.51251
G2 X129.585 Y140.022 I.129 J-.192 E.00569
M204 S10000
G1 X129.856 Y139.62 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.191512
G1 F4195
M204 S6000
G1 X131.248 Y129.036 E.12926
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X130.987 Y131.019 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/68
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z6.8 I1.117 J-.484 P1  F42000
G1 X130.154 Y129.097 Z6.8
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4173
M204 S6000
G1 X130.947 Y129.201 E.02651
G1 X129.606 Y139.382 E.34062
G1 X125.176 Y138.799 E.14822
G1 X125.788 Y134.153 E.15544
G1 X126.517 Y128.618 E.18518
G1 X130.095 Y129.089 E.11972
M204 S10000
G1 X130.101 Y129.501 F42000
G1 F4173
M204 S6000
G1 X130.49 Y129.552 E.01301
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.191 Y134.206 E.14193
G1 X126.867 Y129.075 E.17168
G1 X130.042 Y129.493 E.10622
M204 S250
G1 X130.05 Y129.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4173
M204 S5000
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.58 Y134.257 E.11943
G1 X127.205 Y129.515 E.14698
G1 X129.991 Y129.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.743 Y131.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7 I1.029 J-.65 P1  F42000
G1 X126.412 Y126.59 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4173
M204 S6000
G1 X125.176 Y117.201 E.31411
G1 X127.365 Y116.913 E.07323
G1 X129.606 Y116.618 E.07499
G1 X130.947 Y126.799 E.34062
G1 X126.517 Y127.382 E.14822
G1 X126.42 Y126.649 E.02452
M204 S10000
G1 X126.816 Y126.536 F42000
G1 F4173
M204 S6000
G1 X125.633 Y117.552 E.30061
G1 X127.418 Y117.317 E.05972
G1 X129.256 Y117.075 E.06149
G1 X130.49 Y126.448 E.31361
G1 X126.867 Y126.925 E.12121
G1 X126.824 Y126.596 E.01102
M204 S250
G1 X127.205 Y126.485 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4173
M204 S5000
G1 X126.073 Y117.889 E.2664
G1 X127.469 Y117.706 E.04328
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
G1 X126.005 Y127.953 Z7 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4173
M204 S6000
G1 X125.983 Y127.593 E.01195
G1 X124.485 Y116.212 E.38079
G1 X130.018 Y115.483 E.18516
G1 X131.513 Y126.832 E.37969
G3 X131.513 Y129.168 I-9.909 J1.168 E.07768
G1 X130.018 Y140.517 E.37969
G1 X124.485 Y139.788 E.18516
G1 X125.983 Y128.407 E.38079
G2 X126.005 Y128.013 I-3.733 J-.407 E.01308
M204 S10000
G1 X125.6 Y127.976 F42000
G1 F4173
M204 S6000
G1 X125.578 Y127.638 E.01124
G1 X124.028 Y115.862 E.394
G1 X130.369 Y115.027 E.21216
G1 X131.917 Y126.783 E.39334
G3 X131.917 Y129.217 I-10.36 J1.217 E.08093
G1 X130.369 Y140.973 E.39334
G1 X124.028 Y140.138 E.21216
G1 X125.578 Y128.362 E.39399
G2 X125.598 Y128.036 I-3.249 J-.362 E.01086
M204 S250
G1 X125.201 Y127.88 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4173
M204 S5000
G1 X125.188 Y127.68 E.00614
G1 X123.614 Y115.72 E.37066
G3 X123.776 Y115.499 I.191 J-.029 E.00936
G1 X130.509 Y114.613 E.20866
G3 X130.587 Y114.616 I.03 J.217 E.00241
G3 X130.733 Y114.785 I-.047 J.188 E.0073
G1 X132.306 Y126.736 E.3704
G3 X132.306 Y129.264 I-10.792 J1.264 E.07785
G1 X130.733 Y141.215 E.3704
M73 P65 R6
G3 X130.512 Y141.388 I-.193 J-.02 E.0096
G1 X123.775 Y140.5 E.2088
G3 X123.614 Y140.277 I.032 J-.193 E.00938
G1 X125.188 Y128.32 E.37059
G2 X125.207 Y128 I-2.787 J-.32 E.00985
G1 X125.204 Y127.94 E.00186
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.188 Y127.68 E-.09877
G1 X124.961 Y125.955 E-.66123
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X126.192 Y127.63 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192276
G1 F4173
M204 S6000
G1 X126.257 Y127.546 E.0013
G1 X124.874 Y117.036 E.12901
M204 S10000
G1 X124.971 Y116.586 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50345
G1 F4173
M204 S6000
G1 X125.114 Y116.567 E.00542
; LINE_WIDTH: 0.523788
G1 X125.178 Y116.579 E.00253
; LINE_WIDTH: 0.564484
G1 X125.241 Y116.591 E.00274
; LINE_WIDTH: 0.60518
G1 X125.304 Y116.603 E.00296
; LINE_WIDTH: 0.645876
G1 X125.368 Y116.616 E.00317
; LINE_WIDTH: 0.706661
G1 X125.431 Y116.628 E.00349
G1 X129.212 Y116.13 E.20624
; LINE_WIDTH: 0.68674
G1 X129.27 Y116.102 E.00338
; LINE_WIDTH: 0.64606
G1 X129.328 Y116.074 E.00317
; LINE_WIDTH: 0.60538
G1 X129.386 Y116.045 E.00296
; LINE_WIDTH: 0.5647
G1 X129.444 Y116.017 E.00274
; LINE_WIDTH: 0.512493
G3 X129.585 Y115.978 I.13 J.194 E.00572
M204 S10000
G1 X129.856 Y116.38 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192599
G1 F4173
M204 S6000
G1 X131.248 Y126.964 E.1302
M204 S10000
G1 X130.475 Y127.963 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38134
G1 F4173
M204 S6000
G1 X130.412 Y128 E.00202
G1 X130.46 Y128.028 E.00153
M204 S10000
G1 X127.713 Y128 F42000
; LINE_WIDTH: 0.41999
G1 F4173
M204 S6000
G1 X130.631 Y128.384 E.09043
G1 X130.673 Y128.318 E.00239
G1 X130.812 Y128.272 E.0045
G1 X130.812 Y127.727 E.01676
G1 X130.674 Y127.68 E.00447
G1 X130.633 Y127.616 E.00233
G1 X127.773 Y127.992 E.08865
M204 S10000
G1 X126.691 Y127.754 F42000
G1 F4173
M204 S6000
G1 X126.534 Y128 E.00896
G1 X126.691 Y128.246 E.00898
G1 X130.789 Y128.785 E.12699
G1 X130.876 Y128.636 E.00531
G3 X131.169 Y128.63 I.155 J.398 E.00918
G2 X131.166 Y127.369 I-8.584 J-.611 E.03879
G1 X130.959 Y127.389 E.00639
G1 X130.876 Y127.361 E.0027
G1 X130.777 Y127.216 E.00539
G1 X126.751 Y127.746 E.12477
M204 S10000
G1 X126.192 Y128.37 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192265
G1 F4173
M204 S6000
G1 X126.257 Y128.454 E.0013
G1 X124.874 Y138.964 E.129
M204 S10000
G1 X124.971 Y139.414 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50521
G1 F4173
M204 S6000
G1 X125.154 Y139.437 E.00695
; LINE_WIDTH: 0.531953
G1 X125.223 Y139.421 E.00283
; LINE_WIDTH: 0.581938
G1 X125.293 Y139.404 E.00312
; LINE_WIDTH: 0.631923
G1 X125.362 Y139.388 E.00341
; LINE_WIDTH: 0.681908
G1 X125.431 Y139.372 E.0037
; LINE_WIDTH: 0.70699
G1 X129.212 Y139.87 E.20637
; LINE_WIDTH: 0.686738
G1 X129.27 Y139.898 E.00338
; LINE_WIDTH: 0.646054
G1 X129.328 Y139.926 E.00317
; LINE_WIDTH: 0.60537
G1 X129.386 Y139.955 E.00296
; LINE_WIDTH: 0.564686
G1 X129.444 Y139.983 E.00274
; LINE_WIDTH: 0.51253
G2 X129.585 Y140.022 I.129 J-.192 E.00569
M204 S10000
G1 X129.856 Y139.62 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.191503
G1 F4173
M204 S6000
G1 X131.248 Y129.036 E.12925
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X130.987 Y131.019 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/68
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z7 I1.117 J-.484 P1  F42000
G1 X130.154 Y129.097 Z7
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4167
M204 S6000
G1 X130.947 Y129.201 E.02651
G1 X129.606 Y139.382 E.34062
G1 X125.176 Y138.799 E.14822
G1 X125.811 Y133.975 E.16139
G1 X126.517 Y128.618 E.17923
G1 X130.095 Y129.089 E.11972
M204 S10000
G1 X130.101 Y129.501 F42000
G1 F4167
M204 S6000
G1 X130.49 Y129.552 E.01301
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.215 Y134.028 E.14788
G1 X126.867 Y129.075 E.16573
G1 X130.042 Y129.493 E.10622
M204 S250
G1 X130.05 Y129.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4167
M204 S5000
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.604 Y134.079 E.12494
G1 X127.205 Y129.515 E.14147
G1 X129.991 Y129.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.743 Y131.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.309 Y127.278 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4167
M204 S6000
G1 X126.517 Y127.382 E.02651
G1 X125.176 Y117.201 E.34062
G1 X127.418 Y116.906 E.07499
G1 X129.606 Y116.618 E.07323
G1 X130.947 Y126.799 E.34062
G1 X127.368 Y127.27 E.11972
M204 S10000
G1 X127.256 Y126.874 F42000
G1 F4167
M204 S6000
G1 X126.867 Y126.925 E.01301
G1 X125.633 Y117.552 E.31361
G1 X127.471 Y117.31 E.06149
G1 X129.256 Y117.075 E.05972
G1 X130.49 Y126.448 E.31361
G1 X127.315 Y126.866 E.10622
M204 S250
G1 X127.205 Y126.485 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4167
M204 S5000
G1 X126.073 Y117.889 E.2664
G1 X127.522 Y117.699 E.04491
G1 X128.918 Y117.515 E.04328
G1 X130.05 Y126.111 E.26641
G1 X127.264 Y126.477 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.989 Y124.496 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.006 Y128.047 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4167
M204 S6000
G1 X125.999 Y127.996 E.00169
G2 X125.981 Y127.583 I-4.982 J.006 E.01374
G1 X124.485 Y116.212 E.38043
G1 X130.018 Y115.483 E.18516
G1 X131.513 Y126.832 E.37969
G3 X131.513 Y129.168 I-9.075 J1.168 E.07772
G1 X130.018 Y140.517 E.37969
G1 X124.485 Y139.788 E.18516
G1 X125.982 Y128.411 E.38066
G1 X126.002 Y128.107 E.0101
M204 S10000
G1 X125.6 Y128.023 F42000
G1 F4167
M204 S6000
G1 X125.593 Y127.998 E.00088
G2 X125.577 Y127.631 I-4.392 J.003 E.01217
G1 X124.028 Y115.862 E.39378
G1 X130.369 Y115.027 E.21216
G1 X131.917 Y126.783 E.39334
G3 X131.917 Y129.217 I-9.48 J1.217 E.08096
G1 X130.369 Y140.973 E.39334
G1 X124.028 Y140.138 E.21216
G1 X125.578 Y128.365 E.39392
G1 X125.596 Y128.083 E.00936
M204 S250
G1 X125.201 Y127.882 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4167
M204 S5000
G1 X125.188 Y127.678 E.0063
G1 X123.614 Y115.72 E.37061
G3 X123.777 Y115.499 I.191 J-.029 E.00936
G1 X130.509 Y114.613 E.20865
G3 X130.587 Y114.616 I.03 J.217 E.00242
G3 X130.733 Y114.785 I-.048 J.188 E.0073
G1 X132.306 Y126.736 E.37039
G3 X132.306 Y129.264 I-9.871 J1.264 E.07789
G1 X130.733 Y141.215 E.3704
G3 X130.512 Y141.388 I-.193 J-.02 E.0096
G1 X123.775 Y140.5 E.2088
G3 X123.614 Y140.277 I.032 J-.193 E.00937
G1 X125.188 Y128.321 E.37056
G2 X125.202 Y127.999 I-3.807 J-.32 E.00989
G1 X125.202 Y127.942 E.00175
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.188 Y127.678 E-.10063
G1 X124.961 Y125.957 E-.65937
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X126.266 Y127.62 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.193374
G1 F4167
M204 S6000
G1 X124.874 Y117.036 E.13088
M204 S10000
G1 X124.971 Y116.586 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.5035
G1 F4167
M204 S6000
G1 X125.115 Y116.567 E.00544
; LINE_WIDTH: 0.523846
G1 X125.178 Y116.579 E.00253
; LINE_WIDTH: 0.564538
G1 X125.242 Y116.591 E.00274
; LINE_WIDTH: 0.60523
G1 X125.305 Y116.603 E.00296
; LINE_WIDTH: 0.645922
G1 X125.368 Y116.615 E.00317
; LINE_WIDTH: 0.706691
G1 X125.432 Y116.628 E.00349
G1 X129.212 Y116.13 E.20621
; LINE_WIDTH: 0.686758
M73 P66 R6
G1 X129.27 Y116.102 E.00338
; LINE_WIDTH: 0.646074
G1 X129.328 Y116.074 E.00317
; LINE_WIDTH: 0.60539
G1 X129.386 Y116.045 E.00296
; LINE_WIDTH: 0.564706
G1 X129.444 Y116.017 E.00274
; LINE_WIDTH: 0.512494
G3 X129.585 Y115.978 I.13 J.194 E.00572
M204 S10000
G1 X129.856 Y116.38 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192586
G1 F4167
M204 S6000
G1 X131.248 Y126.964 E.13019
M204 S10000
G1 X130.482 Y127.963 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.3829
G1 F4167
M204 S6000
G1 X130.418 Y128 E.00204
G1 X130.466 Y128.028 E.00155
M204 S10000
G1 X127.713 Y128 F42000
; LINE_WIDTH: 0.41999
G1 F4167
M204 S6000
G1 X130.632 Y128.384 E.09045
G1 X130.674 Y128.318 E.00243
G1 X130.807 Y128.288 E.00417
G2 X130.802 Y127.709 I-3.009 J-.266 E.01783
G1 X130.675 Y127.68 E.00401
G1 X130.634 Y127.616 E.00236
G1 X127.773 Y127.992 E.08866
M204 S10000
G1 X126.79 Y128.259 F42000
G1 F4167
M204 S6000
G1 X130.789 Y128.785 E.12392
G1 X130.877 Y128.636 E.00532
G3 X131.17 Y128.63 I.154 J.4 E.00919
G2 X131.16 Y127.37 I-9.095 J-.564 E.03877
G1 X130.876 Y127.361 E.00873
G1 X130.777 Y127.216 E.0054
G1 X126.776 Y127.743 E.12401
G1 X126.758 Y127.869 E.00391
G1 X126.615 Y127.969 E.00537
G1 X126.392 Y128 E.00693
G1 X126.615 Y128.031 E.00693
G1 X126.758 Y128.131 E.00536
G1 X126.776 Y128.201 E.00221
M204 S10000
G1 X126.266 Y128.38 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.193742
G1 F4167
M204 S6000
G1 X124.874 Y138.964 E.1312
M204 S10000
G1 X124.971 Y139.414 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50524
G1 F4167
M204 S6000
G1 X125.155 Y139.437 E.00698
; LINE_WIDTH: 0.531993
G1 X125.224 Y139.421 E.00283
; LINE_WIDTH: 0.581978
G1 X125.293 Y139.405 E.00312
; LINE_WIDTH: 0.631963
G1 X125.363 Y139.388 E.00341
; LINE_WIDTH: 0.681948
G1 X125.432 Y139.372 E.0037
; LINE_WIDTH: 0.70701
G1 X129.212 Y139.87 E.20633
; LINE_WIDTH: 0.686738
G1 X129.27 Y139.898 E.00338
; LINE_WIDTH: 0.646054
G1 X129.328 Y139.926 E.00317
; LINE_WIDTH: 0.60537
G1 X129.386 Y139.955 E.00296
; LINE_WIDTH: 0.564686
G1 X129.444 Y139.983 E.00274
; LINE_WIDTH: 0.51253
G2 X129.585 Y140.022 I.129 J-.192 E.00569
M204 S10000
G1 X129.856 Y139.62 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.191503
G1 F4167
M204 S6000
G1 X131.248 Y129.036 E.12925
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X130.987 Y131.019 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/68
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z7.2 I1.117 J-.484 P1  F42000
G1 X130.154 Y129.097 Z7.2
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4167
M204 S6000
G1 X130.947 Y129.201 E.02651
G1 X129.606 Y139.382 E.34062
G1 X125.176 Y138.799 E.14822
G1 X125.835 Y133.797 E.16733
G1 X126.517 Y128.618 E.17328
G1 X130.095 Y129.089 E.11972
M204 S10000
G1 X130.101 Y129.501 F42000
G1 F4167
M204 S6000
G1 X130.49 Y129.552 E.01301
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.238 Y133.85 E.15383
G1 X126.867 Y129.075 E.15978
G1 X130.042 Y129.493 E.10622
M204 S250
G1 X130.05 Y129.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4167
M204 S5000
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.627 Y133.902 E.13045
G1 X127.205 Y129.515 E.13596
G1 X129.991 Y129.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.743 Y131.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.309 Y127.278 Z7.4 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4167
M204 S6000
G1 X126.517 Y127.382 E.02651
G1 X125.176 Y117.201 E.34062
G1 X127.471 Y116.899 E.07676
G1 X129.606 Y116.618 E.07146
G1 X130.947 Y126.799 E.34062
G1 X127.368 Y127.27 E.11972
M204 S10000
G1 X127.256 Y126.874 F42000
G1 F4167
M204 S6000
G1 X126.867 Y126.925 E.01301
G1 X125.633 Y117.552 E.31361
G1 X127.524 Y117.303 E.06326
G1 X129.256 Y117.075 E.05796
G1 X130.49 Y126.448 E.31361
G1 X127.315 Y126.866 E.10622
M204 S250
G1 X127.205 Y126.485 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4167
M204 S5000
G1 X126.073 Y117.889 E.2664
G1 X127.575 Y117.692 E.04655
G1 X128.918 Y117.515 E.04164
G1 X130.05 Y126.111 E.26641
G1 X127.264 Y126.477 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.989 Y124.496 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.006 Y128.049 Z7.4 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4167
M204 S6000
G1 X126.009 Y128 E.00162
G2 X125.982 Y127.583 I-3.182 J0 E.01387
G1 X124.485 Y116.212 E.38044
G1 X130.018 Y115.483 E.18516
G1 X131.512 Y126.832 E.37969
G3 X131.513 Y129.168 I-9.912 J1.168 E.07769
G1 X130.018 Y140.517 E.37969
G1 X124.485 Y139.788 E.18516
G1 X125.982 Y128.417 E.38044
G1 X126.002 Y128.109 E.01025
M204 S10000
G1 X125.6 Y128.024 F42000
G1 F4167
M204 S6000
G1 X125.591 Y128 E.00086
G2 X125.577 Y127.631 I-4.997 J0 E.01224
G1 X124.028 Y115.862 E.39379
G1 X130.369 Y115.027 E.21216
G1 X131.917 Y126.783 E.39334
G3 X131.917 Y129.217 I-10.361 J1.217 E.08093
G1 X130.369 Y140.973 E.39334
G1 X124.028 Y140.138 E.21216
G1 X125.577 Y128.369 E.39379
G1 X125.596 Y128.084 E.00945
M204 S250
G1 X125.202 Y127.885 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4167
M204 S5000
G1 X125.188 Y127.678 E.00637
G1 X123.614 Y115.72 E.3706
G3 X123.777 Y115.499 I.191 J-.03 E.00938
G1 X130.509 Y114.613 E.20865
G3 X130.587 Y114.616 I.03 J.217 E.00241
G3 X130.733 Y114.785 I-.048 J.188 E.00729
G1 X132.306 Y126.736 E.37039
G3 X132.306 Y129.264 I-10.794 J1.264 E.07786
G1 X130.733 Y141.215 E.37039
G3 X130.512 Y141.388 I-.193 J-.02 E.00962
G1 X123.775 Y140.5 E.2088
G3 X123.614 Y140.278 I.033 J-.193 E.00934
G1 X125.188 Y128.322 E.37054
G2 X125.2 Y128 I-4.389 J-.322 E.00991
G1 X125.201 Y127.945 E.0017
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.188 Y127.678 E-.10147
G1 X124.962 Y125.96 E-.65853
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X126.266 Y127.62 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.193375
G1 F4167
M204 S6000
G1 X124.874 Y117.036 E.13088
M204 S10000
G1 X124.971 Y116.586 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.5035
G1 F4167
M204 S6000
G1 X125.115 Y116.567 E.00544
; LINE_WIDTH: 0.523848
G1 X125.178 Y116.579 E.00253
; LINE_WIDTH: 0.564544
G1 X125.242 Y116.591 E.00274
; LINE_WIDTH: 0.60524
G1 X125.305 Y116.603 E.00296
; LINE_WIDTH: 0.645936
G1 X125.368 Y116.615 E.00317
; LINE_WIDTH: 0.706691
G1 X125.432 Y116.628 E.00349
G1 X129.212 Y116.13 E.20621
; LINE_WIDTH: 0.68674
G1 X129.27 Y116.102 E.00338
; LINE_WIDTH: 0.64606
G1 X129.328 Y116.074 E.00317
; LINE_WIDTH: 0.60538
G1 X129.386 Y116.045 E.00296
; LINE_WIDTH: 0.5647
G1 X129.444 Y116.017 E.00274
; LINE_WIDTH: 0.512494
G3 X129.585 Y115.978 I.13 J.194 E.00572
M204 S10000
G1 X129.856 Y116.38 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192598
G1 F4167
M204 S6000
G1 X131.248 Y126.964 E.1302
M204 S10000
G1 X130.482 Y127.963 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.3829
G1 F4167
M204 S6000
G1 X130.418 Y128 E.00204
G1 X130.466 Y128.028 E.00155
M204 S10000
G1 X127.713 Y128 F42000
; LINE_WIDTH: 0.41999
G1 F4167
M204 S6000
G1 X130.632 Y128.384 E.09045
G1 X130.674 Y128.318 E.00243
G1 X130.807 Y128.288 E.00417
G2 X130.802 Y127.709 I-3.009 J-.266 E.01783
G1 X130.675 Y127.68 E.00401
G1 X130.634 Y127.616 E.00236
G1 X127.773 Y127.992 E.08866
M204 S10000
G1 X126.79 Y128.259 F42000
G1 F4167
M204 S6000
G1 X130.789 Y128.785 E.12392
G1 X130.877 Y128.636 E.00532
G3 X131.17 Y128.63 I.154 J.4 E.00919
G2 X131.16 Y127.37 I-9.093 J-.564 E.03877
G1 X130.876 Y127.361 E.00873
G1 X130.777 Y127.216 E.00539
G1 X126.776 Y127.743 E.12401
G1 X126.758 Y127.869 E.0039
G1 X126.615 Y127.969 E.00537
M73 P67 R6
G1 X126.392 Y128 E.00693
G1 X126.615 Y128.031 E.00693
G1 X126.758 Y128.131 E.00537
G1 X126.776 Y128.201 E.00221
M204 S10000
G1 X126.266 Y128.38 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.193352
G1 F4167
M204 S6000
G1 X124.874 Y138.964 E.13086
M204 S10000
G1 X124.971 Y139.414 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50524
G1 F4167
M204 S6000
G1 X125.155 Y139.437 E.00697
; LINE_WIDTH: 0.531988
G1 X125.224 Y139.421 E.00283
; LINE_WIDTH: 0.581963
G1 X125.293 Y139.405 E.00312
; LINE_WIDTH: 0.631938
G1 X125.362 Y139.388 E.00341
; LINE_WIDTH: 0.681913
G1 X125.432 Y139.372 E.0037
; LINE_WIDTH: 0.70699
G1 X129.212 Y139.87 E.20634
; LINE_WIDTH: 0.68674
G1 X129.27 Y139.898 E.00338
; LINE_WIDTH: 0.64606
G1 X129.328 Y139.926 E.00317
; LINE_WIDTH: 0.60538
G1 X129.386 Y139.955 E.00296
; LINE_WIDTH: 0.5647
G1 X129.444 Y139.983 E.00274
; LINE_WIDTH: 0.512543
G2 X129.585 Y140.022 I.129 J-.192 E.00569
M204 S10000
G1 X129.856 Y139.62 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.191503
G1 F4167
M204 S6000
G1 X131.248 Y129.036 E.12925
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X130.987 Y131.019 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/68
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z7.4 I1.205 J-.17 P1  F42000
G1 X130.842 Y129.994 Z7.4
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4165
M204 S6000
G1 X129.606 Y139.382 E.31411
G1 X125.176 Y138.799 E.14822
G1 X125.858 Y133.619 E.17328
G1 X126.517 Y128.618 E.16733
G1 X130.947 Y129.201 E.14822
G1 X130.85 Y129.934 E.02452
M204 S10000
G1 X130.101 Y129.501 F42000
G1 F4165
M204 S6000
G1 X130.49 Y129.552 E.01301
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.262 Y133.673 E.15978
G1 X126.867 Y129.075 E.15383
G1 X130.042 Y129.493 E.10622
M204 S250
G1 X130.05 Y129.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4165
M204 S5000
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.65 Y133.724 E.13596
G1 X127.205 Y129.515 E.13045
G1 X129.991 Y129.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.743 Y131.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.309 Y127.278 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4165
M204 S6000
G1 X126.517 Y127.382 E.02651
G1 X125.176 Y117.201 E.34062
G1 X127.523 Y116.892 E.07853
G1 X129.606 Y116.618 E.06969
G1 X130.947 Y126.799 E.34062
G1 X127.368 Y127.27 E.11972
M204 S10000
G1 X127.256 Y126.874 F42000
G1 F4165
M204 S6000
G1 X126.867 Y126.925 E.01301
G1 X125.633 Y117.552 E.31361
G1 X127.576 Y117.296 E.06502
G1 X129.256 Y117.075 E.05619
G1 X130.49 Y126.448 E.31361
G1 X127.315 Y126.866 E.10622
M204 S250
G1 X127.205 Y126.485 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4165
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
G1 X126.006 Y127.954 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4165
M204 S6000
G1 X125.982 Y127.59 E.0121
G1 X124.485 Y116.212 E.38067
G1 X130.018 Y115.483 E.18516
G1 X131.512 Y126.832 E.37969
G3 X131.513 Y129.168 I-9.074 J1.168 E.07772
G1 X130.018 Y140.517 E.3797
G1 X124.485 Y139.788 E.18516
G1 X125.982 Y128.417 E.38044
G2 X125.999 Y128.013 I-4.956 J-.419 E.0134
M204 S10000
G1 X125.6 Y127.977 F42000
G1 F4165
M204 S6000
G1 X125.578 Y127.635 E.01136
G1 X124.028 Y115.862 E.39393
G1 X130.369 Y115.027 E.21216
G1 X131.917 Y126.783 E.39334
G3 X131.917 Y129.217 I-9.48 J1.217 E.08096
G1 X130.369 Y140.973 E.39334
G1 X124.028 Y140.138 E.21216
G1 X125.577 Y128.369 E.39379
G2 X125.593 Y128.036 I-4.366 J-.37 E.01104
M204 S250
G1 X125.202 Y127.887 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4165
M204 S5000
G1 X125.188 Y127.679 E.00638
G1 X123.614 Y115.72 E.37065
G3 X123.775 Y115.5 I.191 J-.029 E.00932
G1 X130.509 Y114.613 E.2087
G3 X130.588 Y114.616 I.03 J.217 E.00243
G3 X130.732 Y114.784 I-.048 J.188 E.00727
G1 X132.306 Y126.736 E.37041
G3 X132.306 Y129.264 I-9.87 J1.264 E.07789
G1 X130.733 Y141.215 E.3704
G3 X130.512 Y141.388 I-.193 J-.02 E.00961
G1 X123.775 Y140.5 E.2088
G3 X123.614 Y140.277 I.032 J-.193 E.00936
G1 X125.188 Y128.322 E.37052
G2 X125.202 Y128.001 I-3.796 J-.323 E.00989
G1 X125.202 Y127.947 E.00167
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.188 Y127.679 E-.10165
G1 X124.962 Y125.962 E-.65835
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X126.266 Y127.62 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.193751
M73 P67 R5
G1 F4165
M204 S6000
G1 X124.874 Y117.036 E.13121
M204 S10000
G1 X124.971 Y116.586 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50351
G1 F4165
M204 S6000
G1 X125.115 Y116.567 E.00545
; LINE_WIDTH: 0.523862
G1 X125.178 Y116.579 E.00253
; LINE_WIDTH: 0.564546
G1 X125.242 Y116.591 E.00274
; LINE_WIDTH: 0.60523
G1 X125.305 Y116.603 E.00296
; LINE_WIDTH: 0.645914
G1 X125.368 Y116.615 E.00317
; LINE_WIDTH: 0.706681
G1 X125.432 Y116.628 E.00349
G1 X129.212 Y116.13 E.2062
; LINE_WIDTH: 0.686758
G1 X129.27 Y116.102 E.00339
; LINE_WIDTH: 0.646074
G1 X129.328 Y116.074 E.00317
; LINE_WIDTH: 0.60539
G1 X129.386 Y116.045 E.00296
; LINE_WIDTH: 0.564706
G1 X129.444 Y116.017 E.00274
; LINE_WIDTH: 0.512495
G3 X129.585 Y115.978 I.13 J.194 E.00572
M204 S10000
G1 X129.856 Y116.38 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192584
G1 F4165
M204 S6000
G1 X131.248 Y126.964 E.13019
M204 S10000
G1 X130.482 Y127.963 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38288
G1 F4165
M204 S6000
G1 X130.418 Y128 E.00204
G1 X130.466 Y128.028 E.00155
M204 S10000
G1 X127.713 Y128 F42000
; LINE_WIDTH: 0.41999
G1 F4165
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
G1 F4165
M204 S6000
G1 X130.789 Y128.785 E.12392
G1 X130.877 Y128.636 E.00532
G3 X131.17 Y128.63 I.154 J.4 E.00919
G2 X131.16 Y127.37 I-9.095 J-.564 E.03876
G1 X130.876 Y127.361 E.00873
G1 X130.777 Y127.216 E.0054
G1 X126.775 Y127.743 E.12401
G1 X126.758 Y127.869 E.0039
G1 X126.615 Y127.97 E.00537
G1 X126.392 Y128 E.00693
G1 X126.615 Y128.031 E.00693
G1 X126.758 Y128.131 E.00537
G1 X126.776 Y128.201 E.00221
M204 S10000
G1 X126.266 Y128.38 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.193363
G1 F4165
M204 S6000
G1 X124.874 Y138.964 E.13087
M204 S10000
G1 X124.971 Y139.414 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50521
G1 F4165
M204 S6000
G1 X125.155 Y139.437 E.00697
; LINE_WIDTH: 0.531973
G1 X125.224 Y139.421 E.00283
; LINE_WIDTH: 0.581958
G1 X125.293 Y139.405 E.00312
; LINE_WIDTH: 0.631943
G1 X125.362 Y139.388 E.00341
; LINE_WIDTH: 0.681928
G1 X125.432 Y139.372 E.0037
; LINE_WIDTH: 0.707
G1 X129.212 Y139.87 E.20634
; LINE_WIDTH: 0.686736
G1 X129.27 Y139.898 E.00338
; LINE_WIDTH: 0.646048
G1 X129.328 Y139.926 E.00317
; LINE_WIDTH: 0.60536
G1 X129.386 Y139.955 E.00296
; LINE_WIDTH: 0.564672
G1 X129.444 Y139.983 E.00274
; LINE_WIDTH: 0.51251
M73 P68 R5
G2 X129.585 Y140.022 I.129 J-.192 E.00569
M204 S10000
G1 X129.856 Y139.62 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.191512
G1 F4165
M204 S6000
G1 X131.248 Y129.036 E.12926
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X130.987 Y131.019 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/68
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z7.6 I1.205 J-.17 P1  F42000
G1 X130.842 Y129.994 Z7.6
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4164
M204 S6000
G1 X129.606 Y139.382 E.31411
G1 X125.176 Y138.799 E.14822
G1 X125.882 Y133.442 E.17923
G1 X126.517 Y128.618 E.16138
G1 X130.947 Y129.201 E.14822
G1 X130.85 Y129.934 E.02452
M204 S10000
G1 X130.101 Y129.501 F42000
G1 F4164
M204 S6000
G1 X130.49 Y129.552 E.01301
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.285 Y133.495 E.16573
G1 X126.867 Y129.075 E.14788
G1 X130.042 Y129.493 E.10622
M204 S250
G1 X130.05 Y129.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4164
M204 S5000
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.674 Y133.546 E.14147
G1 X127.205 Y129.515 E.12494
G1 X129.991 Y129.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.743 Y131.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y126.59 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4164
M204 S6000
G1 X125.176 Y117.201 E.31411
G1 X127.576 Y116.885 E.08029
G1 X129.606 Y116.618 E.06793
G1 X130.947 Y126.799 E.34062
G1 X126.517 Y127.382 E.14822
G1 X126.42 Y126.649 E.02452
M204 S10000
G1 X126.816 Y126.536 F42000
G1 F4164
M204 S6000
G1 X125.633 Y117.552 E.30061
G1 X127.629 Y117.289 E.06679
G1 X129.256 Y117.075 E.05442
G1 X130.49 Y126.448 E.31361
G1 X126.867 Y126.925 E.12121
G1 X126.824 Y126.596 E.01102
M204 S250
G1 X127.205 Y126.485 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4164
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
G1 X126.006 Y127.954 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4164
M204 S6000
G1 X125.982 Y127.59 E.0121
G1 X124.485 Y116.212 E.38069
G1 X130.018 Y115.483 E.18516
G1 X131.512 Y126.832 E.37969
G3 X131.513 Y129.168 I-9.911 J1.168 E.07768
G1 X130.018 Y140.517 E.37969
G1 X124.485 Y139.788 E.18516
G1 X125.981 Y128.418 E.38042
G2 X125.999 Y128.014 I-4.934 J-.42 E.01341
M204 S10000
G1 X125.6 Y127.978 F42000
G1 F4164
M204 S6000
G1 X125.578 Y127.636 E.01136
G1 X124.028 Y115.862 E.39393
G1 X130.369 Y115.027 E.21216
G1 X131.917 Y126.783 E.39334
G3 X131.917 Y129.217 I-10.361 J1.217 E.08093
G1 X130.369 Y140.973 E.39334
G1 X124.028 Y140.138 E.21216
G1 X125.577 Y128.369 E.39377
G2 X125.593 Y128.037 I-4.349 J-.37 E.01104
M204 S250
G1 X125.202 Y127.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4164
M204 S5000
G1 X125.188 Y127.679 E.00644
G1 X123.614 Y115.72 E.37066
G3 X123.777 Y115.499 I.191 J-.029 E.00938
G1 X130.509 Y114.613 E.20862
G3 X130.587 Y114.616 I.031 J.217 E.00243
G3 X130.733 Y114.785 I-.048 J.188 E.00728
G1 X132.306 Y126.736 E.3704
G3 X132.306 Y129.264 I-10.793 J1.264 E.07785
G1 X130.733 Y141.215 E.37039
G3 X130.512 Y141.388 I-.193 J-.02 E.00962
G1 X123.774 Y140.5 E.20881
G1 X123.698 Y140.471 E.00251
G3 X123.614 Y140.277 I.108 J-.162 E.00687
G1 X125.188 Y128.322 E.37052
G2 X125.202 Y128.001 I-3.782 J-.323 E.00989
G1 X125.202 Y127.949 E.00161
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.188 Y127.679 E-.10241
G1 X124.962 Y125.964 E-.65759
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X126.266 Y127.62 F42000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.193753
G1 F4164
M204 S6000
G1 X124.874 Y117.036 E.13121
M204 S10000
G1 X124.971 Y116.586 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50352
G1 F4164
M204 S6000
G1 X125.115 Y116.567 E.00545
; LINE_WIDTH: 0.523866
G1 X125.178 Y116.579 E.00253
; LINE_WIDTH: 0.564558
G1 X125.242 Y116.591 E.00274
; LINE_WIDTH: 0.60525
G1 X125.305 Y116.603 E.00296
; LINE_WIDTH: 0.645942
G1 X125.369 Y116.615 E.00317
; LINE_WIDTH: 0.706701
G1 X125.432 Y116.628 E.00349
G1 X129.212 Y116.13 E.20621
; LINE_WIDTH: 0.686758
G1 X129.27 Y116.102 E.00339
; LINE_WIDTH: 0.646074
G1 X129.328 Y116.074 E.00317
; LINE_WIDTH: 0.60539
G1 X129.386 Y116.045 E.00296
; LINE_WIDTH: 0.564706
G1 X129.444 Y116.017 E.00274
; LINE_WIDTH: 0.512495
G3 X129.585 Y115.978 I.13 J.194 E.00572
M204 S10000
G1 X129.856 Y116.38 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192575
G1 F4164
M204 S6000
G1 X131.248 Y126.964 E.13018
M204 S10000
G1 X130.482 Y127.963 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38288
G1 F4164
M204 S6000
G1 X130.418 Y128 E.00204
G1 X130.466 Y128.028 E.00155
M204 S10000
G1 X127.714 Y128 F42000
; LINE_WIDTH: 0.41999
G1 F4164
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
G1 F4164
M204 S6000
G1 X130.789 Y128.785 E.12392
G1 X130.877 Y128.636 E.00532
G3 X131.17 Y128.63 I.154 J.4 E.00919
G2 X131.16 Y127.37 I-9.096 J-.564 E.03876
G1 X130.876 Y127.361 E.00873
G1 X130.777 Y127.216 E.0054
G1 X126.775 Y127.743 E.12401
G1 X126.758 Y127.869 E.0039
G1 X126.615 Y127.97 E.00537
G1 X126.392 Y128 E.00693
G1 X126.615 Y128.031 E.00693
G1 X126.758 Y128.131 E.00537
G1 X126.776 Y128.201 E.00221
M204 S10000
G1 X126.266 Y128.38 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.193362
G1 F4164
M204 S6000
G1 X124.874 Y138.964 E.13087
M204 S10000
G1 X124.971 Y139.414 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50522
G1 F4164
M204 S6000
G1 X125.155 Y139.437 E.00697
; LINE_WIDTH: 0.531973
G1 X125.224 Y139.421 E.00283
; LINE_WIDTH: 0.581958
G1 X125.293 Y139.405 E.00312
; LINE_WIDTH: 0.631943
G1 X125.362 Y139.388 E.00341
; LINE_WIDTH: 0.681928
G1 X125.432 Y139.372 E.0037
; LINE_WIDTH: 0.70701
G1 X129.212 Y139.87 E.20634
; LINE_WIDTH: 0.686754
G1 X129.27 Y139.898 E.00339
; LINE_WIDTH: 0.646062
G1 X129.328 Y139.926 E.00317
; LINE_WIDTH: 0.60537
G1 X129.386 Y139.955 E.00296
; LINE_WIDTH: 0.564678
G1 X129.444 Y139.983 E.00274
; LINE_WIDTH: 0.512517
G2 X129.585 Y140.022 I.129 J-.192 E.00569
M204 S10000
G1 X129.856 Y139.62 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.191511
G1 F4164
M204 S6000
G1 X131.248 Y129.036 E.12926
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X130.987 Y131.019 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/68
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z7.8 I1.205 J-.17 P1  F42000
G1 X130.842 Y129.994 Z7.8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4449
M204 S6000
G1 X129.606 Y139.382 E.31411
G1 X125.176 Y138.799 E.14822
G1 X125.905 Y133.264 E.18518
G1 X126.517 Y128.618 E.15543
G1 X130.947 Y129.201 E.14822
G1 X130.85 Y129.934 E.02452
M204 S10000
G1 X130.101 Y129.501 F42000
G1 F4449
M204 S6000
G1 X130.49 Y129.552 E.01301
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.309 Y133.317 E.17168
G1 X126.867 Y129.075 E.14193
G1 X130.042 Y129.493 E.10622
M204 S250
G1 X130.05 Y129.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P69 R5
G1 F4449
M204 S5000
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.697 Y133.368 E.14698
G1 X127.205 Y129.515 E.11942
G1 X129.991 Y129.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.743 Y131.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y126.59 Z8 F42000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4449
M204 S6000
G1 X125.176 Y117.201 E.31411
G1 X127.629 Y116.879 E.08206
G1 X129.606 Y116.618 E.06616
G1 X130.947 Y126.799 E.34062
G1 X126.517 Y127.382 E.14822
G1 X126.42 Y126.649 E.02452
M204 S10000
G1 X126.816 Y126.536 F42000
G1 F4449
M204 S6000
G1 X125.633 Y117.552 E.30061
G1 X127.682 Y117.282 E.06856
G1 X129.256 Y117.075 E.05266
G1 X130.49 Y126.448 E.31361
G1 X126.867 Y126.925 E.12121
G1 X126.824 Y126.596 E.01102
M204 S250
G1 X127.205 Y126.485 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4449
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
G1 X126.006 Y127.954 Z8 F42000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4449
M204 S6000
G1 X125.982 Y127.59 E.01209
G1 X124.485 Y116.212 E.38068
G1 X130.018 Y115.483 E.18516
G1 X131.512 Y126.832 E.37969
G3 X131.513 Y129.168 I-9.911 J1.168 E.07769
G1 X130.018 Y140.517 E.37969
G1 X124.485 Y139.788 E.18516
G1 X125.982 Y128.411 E.38065
G2 X126.001 Y128.013 I-4.521 J-.411 E.0132
M204 S10000
G1 X125.6 Y127.977 F42000
G1 F4449
M204 S6000
G1 X125.578 Y127.636 E.01135
G1 X124.028 Y115.862 E.39393
G1 X130.369 Y115.027 E.21216
G1 X131.917 Y126.783 E.39334
G3 X131.917 Y129.217 I-10.361 J1.217 E.08093
G1 X130.369 Y140.973 E.39334
G1 X124.028 Y140.138 E.21216
G1 X125.578 Y128.365 E.39391
G2 X125.594 Y128.037 I-3.958 J-.365 E.01091
M204 S250
G1 X125.202 Y127.891 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4449
M204 S5000
G1 X125.188 Y127.679 E.0065
G1 X123.614 Y115.72 E.37065
G3 X123.775 Y115.499 I.191 J-.029 E.00933
G1 X130.509 Y114.613 E.20868
G3 X130.588 Y114.616 I.031 J.217 E.00244
G3 X130.733 Y114.785 I-.048 J.188 E.00727
G1 X132.306 Y126.736 E.3704
G3 X132.306 Y129.264 I-10.793 J1.264 E.07786
G1 X130.733 Y141.215 E.37039
G3 X130.511 Y141.387 I-.193 J-.02 E.00962
G1 X123.774 Y140.5 E.20881
G3 X123.614 Y140.277 I.033 J-.193 E.00934
G1 X125.188 Y128.321 E.37056
G2 X125.203 Y128 I-3.417 J-.321 E.00986
G1 X125.203 Y127.951 E.00153
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.188 Y127.679 E-.10317
G1 X124.963 Y125.966 E-.65683
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X126.266 Y127.62 F42000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.193764
G1 F4449
M204 S6000
G1 X124.874 Y117.036 E.13122
M204 S10000
G1 X124.971 Y116.586 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50353
G1 F4449
M204 S6000
G1 X125.115 Y116.567 E.00545
; LINE_WIDTH: 0.523884
G1 X125.178 Y116.579 E.00253
; LINE_WIDTH: 0.564572
G1 X125.242 Y116.591 E.00274
; LINE_WIDTH: 0.60526
G1 X125.305 Y116.603 E.00296
; LINE_WIDTH: 0.645948
G1 X125.369 Y116.615 E.00317
; LINE_WIDTH: 0.706701
G1 X125.432 Y116.628 E.00349
G1 X129.212 Y116.13 E.20621
; LINE_WIDTH: 0.68676
G1 X129.27 Y116.102 E.00339
; LINE_WIDTH: 0.64608
G1 X129.328 Y116.074 E.00317
; LINE_WIDTH: 0.6054
G1 X129.386 Y116.045 E.00296
; LINE_WIDTH: 0.56472
G1 X129.444 Y116.017 E.00274
; LINE_WIDTH: 0.512509
G3 X129.585 Y115.978 I.13 J.194 E.00572
M204 S10000
G1 X129.856 Y116.38 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192585
G1 F4449
M204 S6000
G1 X131.248 Y126.964 E.13019
; WIPE_START
G1 F15000
G1 X130.987 Y124.981 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.248 Y129.036 Z8 F42000
G1 Z7.6
G1 E.8 F1800
; LINE_WIDTH: 0.191512
G1 F4449
M204 S6000
G1 X129.856 Y139.62 E.12926
M204 S10000
G1 X129.389 Y140.209 F42000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F4449
M204 S2000
G1 X129.713 Y139.885 E.01411
G1 X129.476 Y139.589
G1 X128.918 Y140.147 E.02426
G1 X128.446 Y140.085
G1 X129.005 Y139.527 E.02426
G1 X128.533 Y139.465
G1 X127.975 Y140.023 E.02426
G1 X127.504 Y139.961
G1 X128.062 Y139.403 E.02426
G1 X127.591 Y139.341
G1 X127.033 Y139.899 E.02426
G1 X126.561 Y139.837
G1 X127.12 Y139.279 E.02426
G1 X126.649 Y139.217
G1 X126.09 Y139.775 E.02426
G1 X125.619 Y139.713
G1 X126.177 Y139.155 E.02426
G1 X125.706 Y139.093
G1 X125.148 Y139.651 E.02426
M204 S10000
G1 X125.424 Y139.036 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.194604
G1 F4449
M204 S6000
G1 X124.75 Y139.614 E.01096
M204 S10000
G1 X124.874 Y138.964 F42000
; LINE_WIDTH: 0.193707
G1 F4449
M204 S6000
G1 X126.266 Y128.38 E.13117
M204 S10000
G1 X130.542 Y128.924 F42000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F4449
M204 S2000
G1 X131.362 Y128.104 E.03564
G1 X131.355 Y127.578
G1 X130.071 Y128.862 E.05578
G1 X129.6 Y128.8
G1 X131.207 Y127.193 E.06982
G1 X130.828 Y127.039
G1 X129.129 Y128.738 E.07384
G1 X128.657 Y128.676
G1 X130.214 Y127.119 E.06763
G1 X129.6 Y127.2
G1 X128.186 Y128.614 E.06142
G1 X127.715 Y128.552
G1 X128.986 Y127.281 E.05521
G1 X128.371 Y127.362
G1 X127.244 Y128.49 E.049
G1 X126.772 Y128.428
G1 X127.686 Y127.514 E.03969
G1 X127.143 Y127.524
G1 X126.483 Y128.184 E.02871
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.143 Y127.524 E-.35501
G1 X127.686 Y127.514 E-.20623
G1 X127.316 Y127.884 E-.19876
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.358 Y128.497 Z8 F42000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.162366
G1 F4449
M204 S6000
G1 X131.066 Y128.747 E.00374
G1 X131.039 Y128.803 E.0006
; WIPE_START
G1 F15000
G1 X131.066 Y128.747 E-.10551
G1 X131.358 Y128.497 E-.65449
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.93 Y127.536 Z8 F42000
G1 Z7.6
G1 E.8 F1800
; LINE_WIDTH: 0.104771
G1 F4449
M204 S6000
G1 X127.753 Y127.536 E.00089
G1 X127.707 Y127.513 E.00026
; WIPE_START
M73 P70 R5
G1 F15000
G1 X127.753 Y127.536 E-.17187
G1 X127.93 Y127.536 E-.58813
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.34 Y127.816 Z8 F42000
G1 Z7.6
G1 E.8 F1800
; LINE_WIDTH: 0.129355
G1 F4449
M204 S6000
G1 X126.314 Y128.077 E.00185
G1 X126.392 Y128.12 E.00063
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X126.314 Y128.077 E-.19239
G1 X126.34 Y127.816 E-.56761
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/68
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
; OBJECT_ID: 394
M204 S250
M204 S10000
G17
G3 Z8 I1.191 J-.248 P1  F42000
G1 X126.188 Y127.086 Z8
M204 S10000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4449
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
G1 X126.412 Y129.41 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4449
M204 S6000
G1 X125.247 Y138.26 E.29609
G1 X124.695 Y138.187 E.01847
G1 X125.894 Y129.084 E.30457
G1 X126.446 Y129.157 E.01847
G1 X126.42 Y129.351 E.0065
; WIPE_START
G1 F8843.478
G1 X126.159 Y131.334 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.101 Y129.501 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
G1 F4449
M204 S6000
G1 X130.49 Y129.552 E.01301
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.332 Y133.139 E.17763
G1 X126.867 Y129.075 E.13598
G1 X130.042 Y129.493 E.10622
M204 S250
G1 X130.05 Y129.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4449
M204 S5000
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.721 Y133.19 E.15249
G1 X127.205 Y129.515 E.11391
G1 X129.991 Y129.882 E.08634
M204 S10000
G1 X130.876 Y129.74 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4449
M204 S6000
G1 X131.428 Y129.813 E.01847
G1 X130.229 Y138.916 E.30458
G1 X129.677 Y138.843 E.01847
G1 X130.868 Y129.799 E.30258
; WIPE_START
G1 F8843.478
G1 X131.428 Y129.813 E-.21279
G1 X131.24 Y131.24 E-.54721
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.543 Y128.627 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
G1 F4449
M204 S6000
G1 X131.884 Y129.462 E.21216
G1 X130.58 Y139.373 E.33158
G1 X124.239 Y138.538 E.21216
G1 X125.535 Y128.687 E.32959
; WIPE_START
G1 F8843.478
G1 X127.521 Y128.929 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.803 Y126.23 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
G1 F4449
M204 S6000
G1 X124.485 Y116.212 E.33517
G1 X130.018 Y115.483 E.18516
G1 X131.533 Y126.984 E.38478
G1 X130.961 Y126.909 E.01912
G1 X129.606 Y116.618 E.3443
G1 X125.176 Y117.201 E.14822
G1 X126.375 Y126.305 E.30458
G1 X125.863 Y126.237 E.01713
; WIPE_START
G1 F8843.478
G1 X125.59 Y124.256 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.542 Y127.362 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
G1 F4449
M204 S6000
G1 X124.028 Y115.862 E.38479
G1 X130.369 Y115.027 E.21216
G1 X131.917 Y126.783 E.39334
G3 X131.979 Y127.453 I-7.647 J1.044 E.02233
G1 X128.231 Y126.96 E.1254
G1 X128.231 Y126.746 E.0071
G1 X130.49 Y126.448 E.07559
G1 X129.256 Y117.075 E.31361
G1 X125.633 Y117.552 E.12121
G1 X126.848 Y126.778 E.30868
G1 X125.85 Y126.646 E.03337
G1 X125.756 Y127.362 E.02395
G1 X125.602 Y127.362 E.00511
; WIPE_START
G1 F8843.478
G1 X125.331 Y125.381 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.073 Y117.889 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4449
M204 S5000
G1 X127.786 Y117.664 E.05309
G1 X128.918 Y117.515 E.03509
G1 X130.05 Y126.111 E.2664
G1 X127.205 Y126.485 E.08819
G1 X126.081 Y117.949 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.786 Y117.664 E-.65701
G1 X128.055 Y117.628 E-.10299
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.843 Y125.164 Z8.2 F42000
G1 X124.622 Y138.984 Z8.2
G1 Z7.8
G1 E.8 F1800
G1 F4449
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
G1 X125.67 Y131.707 Z8.2 F42000
G1 X125.202 Y127.893 Z8.2
G1 Z7.8
G1 E.8 F1800
G1 F4449
M204 S5000
G1 X125.188 Y127.678 E.00661
G1 X123.614 Y115.72 E.3706
G3 X123.778 Y115.499 I.191 J-.029 E.00941
G1 X130.509 Y114.613 E.20862
G3 X130.588 Y114.616 I.03 J.218 E.00244
G3 X130.733 Y114.785 I-.049 J.188 E.00726
G1 X132.306 Y126.736 E.3704
G3 X132.364 Y127.338 I-6.869 J.966 E.01858
G3 X132.306 Y129.264 I-9.865 J.667 E.05931
G1 X130.733 Y141.215 E.3704
G3 X130.512 Y141.388 I-.193 J-.02 E.00961
G1 X123.774 Y140.5 E.20882
G1 X123.698 Y140.471 E.0025
G3 X123.614 Y140.277 I.111 J-.163 E.00686
G1 X125.188 Y128.32 E.37059
G2 X125.204 Y127.998 I-3.324 J-.32 E.00992
G1 X125.203 Y127.953 E.00139
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.188 Y127.678 E-.10456
G1 X124.963 Y125.968 E-.65544
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X126.062 Y126.058 F42000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192595
G1 F4449
M204 S6000
G1 X124.874 Y117.036 E.11099
M204 S10000
G1 X124.971 Y116.586 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.5035
G1 F4449
M204 S6000
G1 X125.114 Y116.567 E.00542
; LINE_WIDTH: 0.523846
G1 X125.178 Y116.579 E.00253
; LINE_WIDTH: 0.564538
G1 X125.241 Y116.591 E.00274
; LINE_WIDTH: 0.60523
G1 X125.305 Y116.603 E.00296
; LINE_WIDTH: 0.645922
G1 X125.368 Y116.616 E.00317
; LINE_WIDTH: 0.706691
G1 X125.431 Y116.628 E.00349
G1 X129.212 Y116.13 E.20624
; LINE_WIDTH: 0.686758
G1 X129.27 Y116.102 E.00339
; LINE_WIDTH: 0.646074
G1 X129.328 Y116.074 E.00317
; LINE_WIDTH: 0.60539
G1 X129.386 Y116.045 E.00296
; LINE_WIDTH: 0.564706
G1 X129.444 Y116.017 E.00274
; LINE_WIDTH: 0.512495
G3 X129.585 Y115.978 I.13 J.194 E.00572
M204 S10000
G1 X129.856 Y116.38 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192595
G1 F4449
M204 S6000
G1 X131.219 Y126.737 E.12741
M204 S10000
G1 X130.748 Y126.853 F42000
; LINE_WIDTH: 0.429479
G1 F4449
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
G1 X128.034 Y126.853 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
; LINE_WIDTH: 0.507814
G1 F4449
M204 S6000
G1 X127.708 Y126.853 E.01236
; LINE_WIDTH: 0.458941
G1 X127.382 Y126.853 E.01106
; LINE_WIDTH: 0.410067
G1 X127.055 Y126.853 E.00976
; WIPE_START
G1 F9805.352
G1 X127.382 Y126.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.143 Y129.322 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
; LINE_WIDTH: 0.192586
G1 F4449
M204 S6000
G1 X124.998 Y138.022 E.10701
; WIPE_START
G1 F15000
G1 X125.259 Y136.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y138.735 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
; LINE_WIDTH: 0.480839
G1 F4449
M204 S6000
G1 X124.025 Y140.336 E.0576
M204 S10000
G1 X130.321 Y141.165 F42000
; LINE_WIDTH: 0.480862
G1 F4449
M204 S6000
G1 X130.531 Y139.564 E.05761
; WIPE_START
G1 F8220.28
G1 X130.321 Y141.165 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.98 Y138.678 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
; LINE_WIDTH: 0.192587
G1 F4449
M204 S6000
G1 X131.125 Y129.978 E.10702
; WIPE_START
G1 F15000
G1 X130.864 Y131.961 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.887 Y129.265 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
; LINE_WIDTH: 0.466953
G1 F4449
M204 S6000
G2 X131.983 Y128.404 I-18.594 J-2.498 E.02993
; LINE_WIDTH: 0.423322
G1 X132.014 Y128 E.01256
; LINE_WIDTH: 0.387796
G1 X132.032 Y127.658 E.00962
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10438.55
G1 X132.014 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/68
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z8.2 I.189 J-1.202 P1  F42000
G1 X126.188 Y127.086 Z8.2
G1 Z8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4455
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
G1 X126.412 Y129.41 Z8.4 F42000
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4455
M204 S6000
M73 P71 R5
G1 X125.247 Y138.26 E.29609
G1 X124.695 Y138.187 E.01847
G1 X125.894 Y129.084 E.30457
G1 X126.446 Y129.157 E.01847
G1 X126.42 Y129.351 E.0065
; WIPE_START
G1 F8843.478
G1 X126.159 Y131.334 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.101 Y129.501 Z8.4 F42000
G1 Z8
G1 E.8 F1800
G1 F4455
M204 S6000
G1 X130.49 Y129.552 E.01301
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.355 Y132.961 E.18358
G1 X126.867 Y129.075 E.13003
G1 X130.042 Y129.493 E.10622
M204 S250
G1 X130.05 Y129.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4455
M204 S5000
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.744 Y133.013 E.158
G1 X127.205 Y129.515 E.1084
G1 X129.991 Y129.882 E.08634
M204 S10000
G1 X130.876 Y129.74 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4455
M204 S6000
G1 X131.428 Y129.813 E.01847
G1 X130.229 Y138.916 E.30458
G1 X129.677 Y138.843 E.01847
G1 X130.868 Y129.799 E.30258
; WIPE_START
G1 F8843.478
G1 X131.428 Y129.813 E-.21279
G1 X131.24 Y131.24 E-.54721
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.543 Y128.627 Z8.4 F42000
G1 Z8
G1 E.8 F1800
G1 F4455
M204 S6000
G1 X131.884 Y129.462 E.21216
G1 X130.58 Y139.373 E.33158
G1 X124.239 Y138.538 E.21216
G1 X125.535 Y128.687 E.32959
; WIPE_START
G1 F8843.478
G1 X127.521 Y128.929 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.803 Y126.23 Z8.4 F42000
G1 Z8
G1 E.8 F1800
G1 F4455
M204 S6000
G1 X124.485 Y116.213 E.33513
G1 X130.019 Y115.487 E.18516
G1 X131.533 Y126.984 E.38468
G1 X130.961 Y126.909 E.01912
G1 X129.606 Y116.618 E.3443
G1 X125.176 Y117.201 E.14822
G1 X126.375 Y126.305 E.30458
G1 X125.863 Y126.237 E.01713
; WIPE_START
G1 F8843.478
G1 X125.59 Y124.256 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.542 Y127.362 Z8.4 F42000
G1 Z8
G1 E.8 F1800
G1 F4455
M204 S6000
G1 X124.028 Y115.863 E.38476
G1 X130.369 Y115.03 E.21216
G1 X131.917 Y126.783 E.39323
G3 X131.979 Y127.453 I-7.642 J1.044 E.02233
G1 X128.231 Y126.96 E.1254
G1 X128.231 Y126.746 E.0071
G1 X130.49 Y126.448 E.07559
G1 X129.256 Y117.075 E.31361
G1 X125.633 Y117.552 E.12121
G1 X126.848 Y126.778 E.30868
G1 X125.85 Y126.646 E.03337
G1 X125.756 Y127.362 E.02395
G1 X125.602 Y127.362 E.00511
; WIPE_START
G1 F8843.478
G1 X125.331 Y125.381 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.073 Y117.889 Z8.4 F42000
G1 Z8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4455
M204 S5000
G1 X127.839 Y117.657 E.05473
G1 X128.918 Y117.515 E.03346
G1 X130.05 Y126.111 E.2664
G1 X127.205 Y126.485 E.08819
G1 X126.081 Y117.949 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.839 Y117.657 E-.67723
G1 X128.055 Y117.628 E-.08277
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.843 Y125.164 Z8.4 F42000
G1 X124.622 Y138.984 Z8.4
G1 Z8
G1 E.8 F1800
G1 F4455
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
G1 X125.67 Y131.707 Z8.4 F42000
G1 X125.202 Y127.895 Z8.4
G1 Z8
G1 E.8 F1800
G1 F4455
M204 S5000
G1 X125.188 Y127.678 E.00668
G1 X123.616 Y115.738 E.37004
G3 X123.783 Y115.499 I.19 J-.045 E.01012
G1 X130.583 Y114.617 E.2107
G3 X130.734 Y114.799 I-.055 J.199 E.00773
G1 X132.306 Y126.736 E.36997
G3 X132.306 Y129.264 I-10.793 J1.264 E.07785
G1 X130.733 Y141.215 E.37039
G3 X130.51 Y141.387 I-.193 J-.02 E.00966
G1 X123.775 Y140.5 E.20873
G3 X123.614 Y140.28 I.03 J-.191 E.00933
G1 X125.188 Y128.322 E.37059
G2 X125.2 Y128 I-4.38 J-.322 E.00991
G1 X125.201 Y127.955 E.00139
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.188 Y127.678 E-.10532
G1 X124.963 Y125.97 E-.65468
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X126.062 Y126.058 F42000
G1 Z8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192595
G1 F4455
M204 S6000
G1 X124.874 Y117.036 E.11099
M204 S10000
G1 X124.971 Y116.586 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50237
G1 F4455
M204 S6000
G1 X125.115 Y116.567 E.00543
; LINE_WIDTH: 0.522672
G1 X125.178 Y116.58 E.00252
; LINE_WIDTH: 0.563336
G1 X125.241 Y116.592 E.00273
; LINE_WIDTH: 0.604
G1 X125.304 Y116.604 E.00295
; LINE_WIDTH: 0.644664
G1 X125.368 Y116.616 E.00316
; LINE_WIDTH: 0.704654
G1 X125.431 Y116.628 E.00347
G1 X129.213 Y116.131 E.20568
; LINE_WIDTH: 0.683948
G1 X129.27 Y116.103 E.00336
; LINE_WIDTH: 0.643244
G1 X129.328 Y116.075 E.00315
; LINE_WIDTH: 0.60254
G1 X129.386 Y116.047 E.00293
; LINE_WIDTH: 0.561836
G1 X129.444 Y116.019 E.00272
; LINE_WIDTH: 0.509469
G3 X129.587 Y115.979 I.13 J.195 E.00574
M204 S10000
G1 X129.856 Y116.38 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192584
G1 F4455
M204 S6000
G1 X131.219 Y126.737 E.1274
M204 S10000
G1 X130.748 Y126.853 F42000
; LINE_WIDTH: 0.429479
G1 F4455
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
G1 X128.034 Y126.853 Z8.4 F42000
G1 Z8
G1 E.8 F1800
; LINE_WIDTH: 0.507814
G1 F4455
M204 S6000
G1 X127.708 Y126.853 E.01236
; LINE_WIDTH: 0.458941
G1 X127.382 Y126.853 E.01106
; LINE_WIDTH: 0.410067
G1 X127.055 Y126.853 E.00976
; WIPE_START
G1 F9805.352
G1 X127.382 Y126.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.143 Y129.322 Z8.4 F42000
G1 Z8
G1 E.8 F1800
; LINE_WIDTH: 0.192577
G1 F4455
M204 S6000
G1 X124.998 Y138.022 E.10701
; WIPE_START
G1 F15000
G1 X125.259 Y136.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y138.735 Z8.4 F42000
G1 Z8
G1 E.8 F1800
; LINE_WIDTH: 0.480846
G1 F4455
M204 S6000
G1 X124.025 Y140.336 E.0576
M204 S10000
G1 X130.321 Y141.165 F42000
; LINE_WIDTH: 0.480853
G1 F4455
M204 S6000
G1 X130.531 Y139.564 E.05761
; WIPE_START
G1 F8220.439
G1 X130.321 Y141.165 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.98 Y138.678 Z8.4 F42000
G1 Z8
G1 E.8 F1800
; LINE_WIDTH: 0.192587
G1 F4455
M204 S6000
G1 X131.125 Y129.978 E.10702
; WIPE_START
G1 F15000
G1 X130.864 Y131.961 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.887 Y129.265 Z8.4 F42000
G1 Z8
G1 E.8 F1800
; LINE_WIDTH: 0.46696
G1 F4455
M204 S6000
G2 X131.983 Y128.404 I-18.57 J-2.496 E.02993
; LINE_WIDTH: 0.423334
G1 X132.014 Y128 E.01255
; LINE_WIDTH: 0.387814
G1 X132.032 Y127.658 E.00963
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10438.015
G1 X132.014 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/68
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z8.4 I.189 J-1.202 P1  F42000
G1 X126.188 Y127.086 Z8.4
G1 Z8.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4429
M204 S5000
G1 X131.661 Y127.807 E.16961
G1 X131.501 Y129.016 E.03749
G1 X126.029 Y128.296 E.16961
G1 X126.15 Y127.371 E.02867
G1 X126.18 Y127.146 E.00697
M204 S10000
G1 X125.803 Y126.23 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4429
M204 S6000
G1 X124.494 Y116.282 E.33282
G1 X130.028 Y115.553 E.18516
G1 X131.533 Y126.984 E.38246
G1 X130.961 Y126.909 E.01912
G1 X129.606 Y116.618 E.3443
G1 X125.176 Y117.201 E.14822
G1 X126.375 Y126.305 E.30458
G1 X125.863 Y126.237 E.01713
; WIPE_START
G1 F8843.478
M73 P72 R5
G1 X125.59 Y124.256 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.542 Y127.362 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
G1 F4429
M204 S6000
G1 X124.037 Y115.932 E.38244
G1 X130.378 Y115.096 E.21216
G1 X131.917 Y126.783 E.39103
G3 X131.979 Y127.453 I-7.661 J1.046 E.02233
G1 X128.231 Y126.96 E.1254
G1 X128.231 Y126.746 E.0071
G1 X130.49 Y126.448 E.07559
G1 X129.256 Y117.075 E.31361
G1 X125.633 Y117.552 E.12121
G1 X126.848 Y126.778 E.30868
G1 X125.85 Y126.646 E.03337
G1 X125.756 Y127.362 E.02395
G1 X125.602 Y127.362 E.00511
; WIPE_START
G1 F8843.478
G1 X125.331 Y125.381 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y129.41 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
G1 F4429
M204 S6000
G1 X125.247 Y138.26 E.29609
G1 X124.695 Y138.187 E.01847
G1 X125.894 Y129.084 E.30457
G1 X126.446 Y129.157 E.01847
G1 X126.42 Y129.351 E.0065
; WIPE_START
G1 F8843.478
G1 X126.159 Y131.334 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.101 Y129.501 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
G1 F4429
M204 S6000
G1 X130.49 Y129.552 E.01301
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.379 Y132.784 E.18953
G1 X126.867 Y129.075 E.12408
G1 X130.042 Y129.493 E.10622
M204 S250
G1 X130.05 Y129.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4429
M204 S5000
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.767 Y132.835 E.16351
G1 X127.205 Y129.515 E.10289
G1 X129.991 Y129.882 E.08634
M204 S10000
G1 X130.876 Y129.74 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4429
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
G1 X125.543 Y128.627 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
G1 F4429
M204 S6000
G1 X131.884 Y129.462 E.21216
G1 X130.58 Y139.373 E.33158
G1 X124.239 Y138.538 E.21216
G1 X125.535 Y128.687 E.32959
; WIPE_START
G1 F8843.478
G1 X127.521 Y128.929 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.406 Y136.263 Z8.6 F42000
G1 X124.621 Y138.984 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4429
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
G1 X126.412 Y131.652 Z8.6 F42000
G1 X126.073 Y117.889 Z8.6
G1 Z8.2
G1 E.8 F1800
G1 F4429
M204 S5000
G1 X127.892 Y117.65 E.05637
G1 X128.918 Y117.515 E.03182
G1 X130.05 Y126.111 E.2664
G1 X127.205 Y126.485 E.08819
G1 X126.081 Y117.949 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.892 Y117.65 E-.69746
G1 X128.055 Y117.628 E-.06254
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.012 Y124.982 Z8.6 F42000
G1 X125.202 Y127.897 Z8.6
G1 Z8.2
G1 E.8 F1800
G1 F4429
M204 S5000
G1 X125.188 Y127.68 E.00668
G1 X123.636 Y115.888 E.36547
G3 X123.724 Y115.583 I.303 J-.077 E.01022
G1 X130.5 Y114.684 E.21003
G3 X130.591 Y114.68 I.059 J.256 E.00279
G3 X130.754 Y114.95 I-.166 J.285 E.01014
G1 X132.306 Y126.736 E.36527
G3 X132.363 Y127.324 I-6.715 J.949 E.01817
G3 X132.306 Y129.264 I-9.87 J.68 E.05972
G1 X130.733 Y141.215 E.37039
G3 X130.511 Y141.387 I-.193 J-.02 E.00963
G1 X123.721 Y140.484 E.21047
G3 X123.614 Y140.277 I.092 J-.179 E.00765
G1 X125.188 Y128.32 E.37059
G2 X125.207 Y128 I-2.787 J-.32 E.00985
G1 X125.205 Y127.957 E.00132
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.188 Y127.68 E-.1054
G1 X124.963 Y125.972 E-.6546
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X126.062 Y126.058 F42000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.193177
G1 F4429
M204 S6000
G1 X124.874 Y117.036 E.11142
G1 X124.946 Y116.827 E.00271
; LINE_WIDTH: 0.26744
G1 X125.018 Y116.618 E.00405
; LINE_WIDTH: 0.317335
G1 X125.09 Y116.409 E.00494
M204 S10000
G1 X124.761 Y116.752 F42000
; LINE_WIDTH: 0.636634
G1 F4429
M204 S6000
G1 X129.891 Y116.076 E.25035
M204 S10000
G1 X129.484 Y115.83 F42000
; LINE_WIDTH: 0.317289
G1 F4429
M204 S6000
G1 X129.608 Y116.013 E.00495
; LINE_WIDTH: 0.267406
G1 X129.732 Y116.197 E.00405
; LINE_WIDTH: 0.217523
G1 X129.856 Y116.38 E.00315
; LINE_WIDTH: 0.192596
G1 X131.219 Y126.737 E.12742
M204 S10000
G1 X130.748 Y126.853 F42000
; LINE_WIDTH: 0.429478
G1 F4429
M204 S6000
G1 X130.549 Y126.853 E.00627
; LINE_WIDTH: 0.385138
G1 X130.35 Y126.853 E.00555
; LINE_WIDTH: 0.340797
G1 X130.151 Y126.853 E.00483
; LINE_WIDTH: 0.296456
G1 X129.952 Y126.853 E.00411
; LINE_WIDTH: 0.252116
G1 X129.753 Y126.853 E.00339
; LINE_WIDTH: 0.207775
G1 X129.554 Y126.853 E.00267
; LINE_WIDTH: 0.163434
G1 X129.355 Y126.853 E.00195
; LINE_WIDTH: 0.119094
G1 X129.156 Y126.853 E.00124
; WIPE_START
G1 F15000
G1 X129.355 Y126.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.034 Y126.853 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
; LINE_WIDTH: 0.507827
G1 F4429
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
G1 X126.143 Y129.322 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
; LINE_WIDTH: 0.192586
G1 F4429
M204 S6000
G1 X124.998 Y138.022 E.10701
; WIPE_START
G1 F15000
G1 X125.259 Y136.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y138.735 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
; LINE_WIDTH: 0.480826
G1 F4429
M204 S6000
G1 X124.025 Y140.336 E.0576
M204 S10000
G1 X130.321 Y141.165 F42000
; LINE_WIDTH: 0.480842
G1 F4429
M204 S6000
G1 X130.531 Y139.564 E.05761
; WIPE_START
G1 F8220.646
G1 X130.321 Y141.165 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.98 Y138.678 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
; LINE_WIDTH: 0.192587
G1 F4429
M204 S6000
G1 X131.125 Y129.978 E.10702
; WIPE_START
G1 F15000
G1 X130.864 Y131.961 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.887 Y129.265 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
; LINE_WIDTH: 0.466964
G1 F4429
M204 S6000
G2 X131.983 Y128.404 I-18.576 J-2.496 E.02993
; LINE_WIDTH: 0.423335
G1 X132.014 Y128 E.01256
; LINE_WIDTH: 0.387835
G1 X132.032 Y127.658 E.00962
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10437.374
G1 X132.014 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 42/68
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z8.6 I.189 J-1.202 P1  F42000
G1 X126.188 Y127.086 Z8.6
G1 Z8.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4414
M204 S5000
G1 X131.661 Y127.807 E.16961
G1 X131.501 Y129.016 E.03749
G1 X126.029 Y128.296 E.16961
G1 X126.146 Y127.401 E.02773
G1 X126.18 Y127.146 E.00792
M204 S10000
G1 X125.803 Y126.23 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4414
M204 S6000
G1 X124.515 Y116.442 E.32747
G1 X130.049 Y115.714 E.18516
G1 X131.533 Y126.984 E.37708
G1 X130.961 Y126.909 E.01912
G1 X129.606 Y116.618 E.3443
G1 X125.176 Y117.201 E.14822
G1 X126.375 Y126.305 E.30459
G1 X125.863 Y126.237 E.01713
; WIPE_START
G1 F8843.478
G1 X125.59 Y124.256 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.542 Y127.362 Z8.8 F42000
G1 Z8.4
G1 E.8 F1800
G1 F4414
M204 S6000
G1 X124.057 Y116.085 E.37733
G1 X130.398 Y115.251 E.21216
G1 X131.917 Y126.783 E.38583
G3 X131.979 Y127.453 I-7.669 J1.047 E.02233
G1 X128.231 Y126.96 E.1254
G1 X128.231 Y126.746 E.0071
G1 X130.49 Y126.448 E.07559
G1 X129.256 Y117.075 E.31361
G1 X125.633 Y117.552 E.12121
G1 X126.848 Y126.778 E.30868
G1 X125.85 Y126.646 E.03337
G1 X125.756 Y127.362 E.02395
G1 X125.602 Y127.362 E.00511
; WIPE_START
G1 F8843.478
G1 X125.33 Y125.381 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y129.41 Z8.8 F42000
G1 Z8.4
G1 E.8 F1800
G1 F4414
M204 S6000
G1 X125.247 Y138.26 E.29609
G1 X124.695 Y138.187 E.01847
G1 X125.894 Y129.084 E.30457
G1 X126.446 Y129.157 E.01847
G1 X126.42 Y129.351 E.0065
; WIPE_START
G1 F8843.478
G1 X126.159 Y131.334 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.101 Y129.501 Z8.8 F42000
M73 P73 R5
G1 Z8.4
G1 E.8 F1800
G1 F4414
M204 S6000
G1 X130.49 Y129.552 E.01301
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.402 Y132.606 E.19548
G1 X126.867 Y129.075 E.11813
G1 X130.042 Y129.493 E.10622
M204 S250
G1 X130.05 Y129.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4414
M204 S5000
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.791 Y132.657 E.16902
G1 X127.205 Y129.515 E.09738
G1 X129.991 Y129.882 E.08634
M204 S10000
G1 X130.876 Y129.74 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4414
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
G1 X125.543 Y128.627 Z8.8 F42000
M73 P73 R4
G1 Z8.4
G1 E.8 F1800
G1 F4414
M204 S6000
G1 X131.884 Y129.462 E.21216
G1 X130.58 Y139.373 E.33158
G1 X124.239 Y138.538 E.21216
G1 X125.535 Y128.687 E.32959
; WIPE_START
G1 F8843.478
G1 X127.521 Y128.929 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.406 Y136.263 Z8.8 F42000
G1 X124.622 Y138.984 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4414
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
G1 X126.412 Y131.652 Z8.8 F42000
G1 X126.073 Y117.889 Z8.8
G1 Z8.4
G1 E.8 F1800
G1 F4414
M204 S5000
G1 X127.944 Y117.643 E.058
G1 X128.918 Y117.515 E.03018
G1 X130.05 Y126.111 E.2664
G1 X127.205 Y126.485 E.08819
G1 X126.081 Y117.949 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.944 Y117.643 E-.71769
G1 X128.055 Y117.628 E-.04231
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.013 Y124.983 Z8.8 F42000
G1 X125.202 Y127.899 Z8.8
G1 Z8.4
G1 E.8 F1800
G1 F4414
M204 S5000
G1 X125.188 Y127.68 E.00677
G1 X123.657 Y116.045 E.36057
G3 X123.776 Y115.719 I.32 J-.068 E.01124
G1 X124.257 Y115.67 E.01485
G1 X130.084 Y114.903 E.18061
G3 X130.595 Y114.826 I1.132 J5.777 E.01589
G1 X130.617 Y114.835 E.00072
G3 X130.776 Y115.112 I-.213 J.306 E.01015
G1 X132.306 Y126.736 E.36025
G3 X132.363 Y127.318 I-6.64 J.941 E.01796
G3 X132.306 Y129.264 I-9.873 J.687 E.05993
G1 X130.733 Y141.215 E.37039
G3 X130.511 Y141.387 I-.193 J-.02 E.00963
G1 X123.773 Y140.5 E.20884
G1 X123.698 Y140.471 E.00246
G3 X123.614 Y140.277 I.108 J-.162 E.00687
G1 X125.188 Y128.322 E.37052
G2 X125.202 Y128.001 I-3.696 J-.323 E.00988
G1 X125.202 Y127.959 E.00128
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.188 Y127.68 E-.1065
G1 X124.964 Y125.975 E-.6535
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X126.062 Y126.058 F42000
G1 Z8.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.19303
G1 F4414
M204 S6000
G1 X124.874 Y117.036 E.11131
G1 X124.926 Y116.884 E.00197
; LINE_WIDTH: 0.267426
G1 X124.979 Y116.732 E.00294
; LINE_WIDTH: 0.317317
G1 X125.031 Y116.58 E.0036
M204 S10000
G1 X124.771 Y116.832 F42000
; LINE_WIDTH: 0.47481
G1 F4414
M204 S6000
G1 X129.902 Y116.156 E.18211
M204 S10000
G1 X129.585 Y115.98 F42000
; LINE_WIDTH: 0.317325
G1 F4414
M204 S6000
G1 X129.675 Y116.113 E.0036
; LINE_WIDTH: 0.267436
G1 X129.766 Y116.247 E.00294
; LINE_WIDTH: 0.217546
G1 X129.856 Y116.38 E.00229
; LINE_WIDTH: 0.192597
G1 X131.219 Y126.737 E.12742
M204 S10000
G1 X130.748 Y126.853 F42000
; LINE_WIDTH: 0.42948
G1 F4414
M204 S6000
G1 X130.549 Y126.853 E.00627
; LINE_WIDTH: 0.385139
G1 X130.35 Y126.853 E.00555
; LINE_WIDTH: 0.340799
G1 X130.151 Y126.853 E.00483
; LINE_WIDTH: 0.296458
G1 X129.952 Y126.853 E.00411
; LINE_WIDTH: 0.252117
G1 X129.753 Y126.853 E.00339
; LINE_WIDTH: 0.207776
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
G1 X128.034 Y126.853 Z8.8 F42000
G1 Z8.4
G1 E.8 F1800
; LINE_WIDTH: 0.507817
G1 F4414
M204 S6000
G1 X127.708 Y126.853 E.01236
; LINE_WIDTH: 0.458951
G1 X127.382 Y126.853 E.01106
; LINE_WIDTH: 0.410085
G1 X127.055 Y126.853 E.00976
; WIPE_START
G1 F9804.866
G1 X127.382 Y126.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.143 Y129.322 Z8.8 F42000
G1 Z8.4
G1 E.8 F1800
; LINE_WIDTH: 0.192587
G1 F4414
M204 S6000
G1 X124.998 Y138.022 E.10701
; WIPE_START
G1 F15000
G1 X125.259 Y136.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y138.735 Z8.8 F42000
G1 Z8.4
G1 E.8 F1800
; LINE_WIDTH: 0.480844
G1 F4414
M204 S6000
G1 X124.025 Y140.336 E.0576
M204 S10000
G1 X130.321 Y141.165 F42000
; LINE_WIDTH: 0.480845
G1 F4414
M204 S6000
G1 X130.531 Y139.564 E.05761
; WIPE_START
G1 F8220.597
G1 X130.321 Y141.165 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.98 Y138.678 Z8.8 F42000
G1 Z8.4
G1 E.8 F1800
; LINE_WIDTH: 0.192577
G1 F4414
M204 S6000
G1 X131.125 Y129.978 E.10701
; WIPE_START
G1 F15000
G1 X130.864 Y131.961 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.887 Y129.265 Z8.8 F42000
G1 Z8.4
G1 E.8 F1800
; LINE_WIDTH: 0.466963
G1 F4414
M204 S6000
G2 X131.983 Y128.404 I-18.593 J-2.498 E.02993
; LINE_WIDTH: 0.423328
G1 X132.014 Y128 E.01256
; LINE_WIDTH: 0.38782
G1 X132.032 Y127.658 E.00962
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F10437.812
G1 X132.014 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 43/68
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z8.8 I.189 J-1.202 P1  F42000
G1 X126.188 Y127.086 Z8.8
G1 Z8.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4391
M204 S5000
G1 X131.661 Y127.807 E.16961
G1 X131.501 Y129.016 E.03749
G1 X126.029 Y128.296 E.16961
G1 X126.142 Y127.432 E.02678
G1 X126.18 Y127.146 E.00886
M204 S10000
G1 X125.803 Y126.23 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4391
M204 S6000
G1 X124.535 Y116.597 E.32229
G1 X130.069 Y115.869 E.18516
G1 X131.533 Y126.984 E.37188
G1 X130.961 Y126.909 E.01912
G1 X129.606 Y116.618 E.3443
G1 X125.176 Y117.201 E.14822
G1 X126.375 Y126.305 E.30458
G1 X125.863 Y126.237 E.01713
; WIPE_START
G1 F8843.478
G1 X125.59 Y124.256 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.542 Y127.362 Z9 F42000
G1 Z8.6
G1 E.8 F1800
G1 F4391
M204 S6000
G1 X124.077 Y116.237 E.37224
G1 X124.781 Y116.161 E.0235
G1 X129.708 Y115.513 E.16482
G1 X130.419 Y115.404 E.02386
G1 X131.917 Y126.783 E.38071
G3 X131.979 Y127.453 I-7.642 J1.044 E.02233
G1 X128.231 Y126.96 E.1254
G1 X128.231 Y126.746 E.0071
G1 X130.49 Y126.448 E.07559
G1 X129.256 Y117.075 E.31361
G1 X125.633 Y117.552 E.12121
G1 X126.848 Y126.778 E.30868
G1 X125.85 Y126.646 E.03337
G1 X125.756 Y127.362 E.02395
G1 X125.602 Y127.362 E.00511
; WIPE_START
G1 F8843.478
G1 X125.33 Y125.381 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y129.41 Z9 F42000
G1 Z8.6
G1 E.8 F1800
G1 F4391
M204 S6000
G1 X125.247 Y138.26 E.29609
G1 X124.695 Y138.187 E.01846
G1 X125.894 Y129.084 E.30457
G1 X126.446 Y129.157 E.01847
G1 X126.42 Y129.351 E.0065
; WIPE_START
G1 F8843.478
G1 X126.159 Y131.334 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.101 Y129.501 Z9 F42000
G1 Z8.6
G1 E.8 F1800
G1 F4391
M204 S6000
G1 X130.49 Y129.552 E.01301
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.426 Y132.428 E.20143
G1 X126.867 Y129.075 E.11219
G1 X130.042 Y129.493 E.10622
M204 S250
G1 X130.05 Y129.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4391
M204 S5000
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.814 Y132.479 E.17453
G1 X127.205 Y129.515 E.09187
G1 X129.991 Y129.882 E.08634
M204 S10000
G1 X130.876 Y129.74 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4391
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
G1 X125.543 Y128.627 Z9 F42000
M73 P74 R4
G1 Z8.6
G1 E.8 F1800
G1 F4391
M204 S6000
G1 X131.884 Y129.462 E.21216
G1 X130.58 Y139.373 E.33158
G1 X124.239 Y138.538 E.21215
G1 X125.535 Y128.687 E.32959
; WIPE_START
G1 F8843.478
G1 X127.521 Y128.929 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.406 Y136.263 Z9 F42000
G1 X124.622 Y138.984 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4391
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
G1 X126.412 Y131.652 Z9 F42000
G1 X126.073 Y117.889 Z9
G1 Z8.6
G1 E.8 F1800
G1 F4391
M204 S5000
G1 X127.997 Y117.636 E.05964
G1 X128.918 Y117.515 E.02855
G1 X130.05 Y126.111 E.2664
G1 X127.205 Y126.485 E.08819
G1 X126.081 Y117.949 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.997 Y117.636 E-.73792
G1 X128.055 Y117.628 E-.02208
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.013 Y124.983 Z9 F42000
G1 X125.203 Y127.902 Z9
G1 Z8.6
G1 E.8 F1800
G1 F4391
M204 S5000
G1 X125.188 Y127.678 E.00691
G1 X123.678 Y116.211 E.35538
G3 X123.832 Y115.872 I.266 J-.084 E.01253
G2 X130.587 Y114.992 I-50.016 J-409.997 E.20931
G1 X130.655 Y115.01 E.00217
G3 X130.797 Y115.277 I-.261 J.311 E.00953
G1 X132.306 Y126.736 E.35515
G3 X132.362 Y128.689 I-9.819 J1.26 E.06013
G3 X132.306 Y129.264 I-6.623 J-.358 E.01775
G1 X130.732 Y141.218 E.37049
G3 X130.525 Y141.389 I-.192 J-.022 E.00913
G1 X123.784 Y140.502 E.20891
G3 X123.613 Y140.291 I.021 J-.192 E.00926
G1 X125.188 Y128.322 E.37094
G2 X125.2 Y128 I-4.389 J-.322 E.00991
G1 X125.201 Y127.962 E.00117
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.188 Y127.678 E-.10812
G1 X124.964 Y125.977 E-.65188
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X126.062 Y126.058 F42000
G1 Z8.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192695
G1 F4391
M204 S6000
G1 X124.874 Y117.036 E.11107
G1 X124.888 Y116.989 E.0006
; LINE_WIDTH: 0.253622
G1 X124.902 Y116.941 E.00085
; LINE_WIDTH: 0.294296
G1 X124.917 Y116.894 E.00101
; LINE_WIDTH: 0.313678
G1 X129.764 Y116.256 E.10787
G1 X129.804 Y116.296 E.00125
; LINE_WIDTH: 0.253558
G1 X129.83 Y116.338 E.00085
; LINE_WIDTH: 0.212907
G1 X129.856 Y116.38 E.00068
; LINE_WIDTH: 0.192584
G1 X131.219 Y126.737 E.1274
M204 S10000
G1 X130.748 Y126.853 F42000
; LINE_WIDTH: 0.429479
G1 F4391
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
G1 X128.034 Y126.853 Z9 F42000
G1 Z8.6
G1 E.8 F1800
; LINE_WIDTH: 0.507827
G1 F4391
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
G1 X126.143 Y129.322 Z9 F42000
G1 Z8.6
G1 E.8 F1800
; LINE_WIDTH: 0.192456
G1 F4391
M204 S6000
G1 X124.998 Y138.022 E.10692
; WIPE_START
G1 F15000
G1 X125.259 Y136.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y138.735 Z9 F42000
G1 Z8.6
G1 E.8 F1800
; LINE_WIDTH: 0.480553
G1 F4391
M204 S6000
G1 X124.025 Y140.336 E.05757
M204 S10000
G1 X130.321 Y141.164 F42000
; LINE_WIDTH: 0.480833
G1 F4391
M204 S6000
G1 X130.531 Y139.564 E.05759
; WIPE_START
G1 F8220.827
G1 X130.321 Y141.164 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.98 Y138.678 Z9 F42000
G1 Z8.6
G1 E.8 F1800
; LINE_WIDTH: 0.192587
G1 F4391
M204 S6000
G1 X131.125 Y129.978 E.10702
; WIPE_START
G1 F15000
G1 X130.864 Y131.961 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.887 Y129.265 Z9 F42000
G1 Z8.6
G1 E.8 F1800
; LINE_WIDTH: 0.466955
G1 F4391
M204 S6000
G2 X131.983 Y128.404 I-18.625 J-2.501 E.02993
; LINE_WIDTH: 0.423347
G1 X132.014 Y128 E.01255
; LINE_WIDTH: 0.387835
G1 X132.032 Y127.658 E.00963
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10437.378
G1 X132.014 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 44/68
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z9 I-.06 J-1.215 P1  F42000
G1 X126.029 Y128.296 Z9
G1 Z8.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4422
M204 S5000
G1 X126.138 Y127.462 E.02583
G1 X126.188 Y127.086 E.01165
G1 X131.661 Y127.807 E.16961
G1 X131.501 Y129.016 E.03749
G1 X126.088 Y128.304 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.138 Y127.462 E-.32031
G1 X126.188 Y127.086 E-.14411
G1 X126.959 Y127.188 E-.29559
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.803 Y126.23 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4422
M204 S6000
G1 X124.556 Y116.752 E.31711
G2 X130.09 Y116.023 I-33.643 J-276.849 E.18516
G1 X131.533 Y126.984 E.36673
G1 X130.961 Y126.909 E.01912
G1 X129.606 Y116.618 E.3443
G1 X125.176 Y117.201 E.14822
G1 X126.375 Y126.305 E.30458
G1 X125.863 Y126.237 E.01713
; WIPE_START
G1 F8843.478
G1 X125.59 Y124.256 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.542 Y127.362 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
G1 F4422
M204 S6000
G1 X124.098 Y116.397 E.36687
G2 X130.439 Y115.562 I-33.204 J-276.549 E.21217
G1 X131.917 Y126.783 E.37544
G3 X131.979 Y127.453 I-7.644 J1.044 E.02233
G1 X128.231 Y126.96 E.1254
G1 X128.231 Y126.746 E.0071
G1 X130.49 Y126.448 E.07559
G1 X129.256 Y117.075 E.31361
G1 X125.633 Y117.552 E.12121
G1 X126.848 Y126.778 E.30868
G1 X125.85 Y126.646 E.03337
G1 X125.756 Y127.362 E.02395
G1 X125.602 Y127.362 E.00511
; WIPE_START
G1 F8843.478
G1 X125.33 Y125.381 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y129.41 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
G1 F4422
M204 S6000
G1 X125.247 Y138.26 E.29609
G1 X124.695 Y138.187 E.01846
G1 X125.894 Y129.084 E.30457
G1 X126.446 Y129.157 E.01847
G1 X126.42 Y129.351 E.0065
; WIPE_START
G1 F8843.478
G1 X126.159 Y131.334 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.101 Y129.501 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
G1 F4422
M204 S6000
G1 X130.49 Y129.552 E.01301
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.449 Y132.25 E.20737
G1 X126.867 Y129.075 E.10624
G1 X130.042 Y129.493 E.10622
M204 S250
G1 X130.05 Y129.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4422
M204 S5000
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.838 Y132.301 E.18004
G1 X127.205 Y129.515 E.08636
G1 X129.991 Y129.882 E.08634
M204 S10000
G1 X130.876 Y129.74 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4422
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
G1 X125.543 Y128.627 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
G1 F4422
M204 S6000
G1 X131.884 Y129.462 E.21216
G1 X130.58 Y139.373 E.33158
G1 X124.239 Y138.538 E.21215
G1 X125.535 Y128.687 E.32959
; WIPE_START
G1 F8843.478
G1 X127.521 Y128.929 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.406 Y136.263 Z9.2 F42000
G1 X124.622 Y138.984 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4422
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
G1 X126.412 Y131.652 Z9.2 F42000
M73 P75 R4
G1 X126.073 Y117.889 Z9.2
G1 Z8.8
G1 E.8 F1800
G1 F4422
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
G1 X126.014 Y124.983 Z9.2 F42000
G1 X125.203 Y127.905 Z9.2
G1 Z8.8
G1 E.8 F1800
G1 F4422
M204 S5000
G1 X125.188 Y127.678 E.007
G1 X123.701 Y116.383 E.35004
G3 X123.83 Y116.044 I.293 J-.083 E.01194
G2 X130.618 Y115.153 I-72.821 J-580.762 E.21037
G1 X130.636 Y115.156 E.00057
G1 X130.676 Y115.175 E.00136
G3 X130.819 Y115.443 I-.268 J.316 E.00955
G1 X132.306 Y126.736 E.35
G3 X132.306 Y129.264 I-10.792 J1.264 E.07785
G1 X130.732 Y141.217 E.37046
G3 X130.524 Y141.389 I-.192 J-.021 E.00916
G1 X123.784 Y140.502 E.20889
G3 X123.613 Y140.29 I.02 J-.192 E.0093
G1 X125.188 Y128.322 E.37091
G2 X125.2 Y128 I-4.388 J-.322 E.00991
G1 X125.201 Y127.965 E.00107
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.188 Y127.678 E-.10926
G1 X124.964 Y125.98 E-.65074
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X126.062 Y126.058 F42000
G1 Z8.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192509
G1 F4422
M204 S6000
G1 X124.874 Y117.036 E.11093
G1 X124.873 Y116.999 E.00045
G1 X124.94 Y116.97 E.00089
; LINE_WIDTH: 0.14943
G1 X129.774 Y116.333 E.04231
; LINE_WIDTH: 0.192518
G1 X129.847 Y116.344 E.00089
G1 X129.856 Y116.38 E.00045
G1 X131.219 Y126.737 E.12735
M204 S10000
G1 X130.748 Y126.853 F42000
; LINE_WIDTH: 0.429479
G1 F4422
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
G1 X128.034 Y126.853 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
; LINE_WIDTH: 0.507814
G1 F4422
M204 S6000
G1 X127.708 Y126.853 E.01236
; LINE_WIDTH: 0.458941
G1 X127.382 Y126.853 E.01106
; LINE_WIDTH: 0.410067
G1 X127.055 Y126.853 E.00976
; WIPE_START
G1 F9805.352
G1 X127.382 Y126.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.143 Y129.322 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
; LINE_WIDTH: 0.192437
G1 F4422
M204 S6000
G1 X124.998 Y138.022 E.10691
; WIPE_START
G1 F15000
G1 X125.259 Y136.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y138.735 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
; LINE_WIDTH: 0.480541
G1 F4422
M204 S6000
G1 X124.025 Y140.336 E.05757
M204 S10000
G1 X130.321 Y141.164 F42000
; LINE_WIDTH: 0.480844
G1 F4422
M204 S6000
G1 X130.531 Y139.564 E.05759
; WIPE_START
G1 F8220.605
G1 X130.321 Y141.164 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.98 Y138.678 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
; LINE_WIDTH: 0.192587
G1 F4422
M204 S6000
G1 X131.125 Y129.978 E.10702
; WIPE_START
G1 F15000
G1 X130.864 Y131.961 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.887 Y129.265 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
; LINE_WIDTH: 0.46697
G1 F4422
M204 S6000
G2 X131.983 Y128.404 I-18.557 J-2.494 E.02992
; LINE_WIDTH: 0.423335
G1 X132.014 Y128 E.01256
; LINE_WIDTH: 0.387824
G1 X132.032 Y127.658 E.00962
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10437.684
G1 X132.014 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 45/68
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z9.2 I.189 J-1.202 P1  F42000
G1 X126.188 Y127.086 Z9.2
G1 Z9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4319
M204 S5000
G1 X131.661 Y127.807 E.16961
G1 X131.501 Y129.016 E.03749
G1 X126.029 Y128.296 E.16961
G1 X126.134 Y127.493 E.02489
G1 X126.18 Y127.146 E.01075
M204 S10000
G1 X125.803 Y126.23 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4319
M204 S6000
G1 X124.577 Y116.912 E.31176
G2 X130.111 Y116.183 I-29.122 J-242.391 E.18516
G1 X131.533 Y126.984 E.36139
G1 X130.961 Y126.909 E.01912
G1 X129.606 Y116.618 E.3443
G1 X125.176 Y117.201 E.14822
G1 X126.375 Y126.305 E.30458
G1 X125.863 Y126.237 E.01713
; WIPE_START
G1 F8843.478
G1 X125.59 Y124.256 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.542 Y127.362 Z9.4 F42000
G1 Z9
G1 E.8 F1800
G1 F4319
M204 S6000
G1 X124.121 Y116.567 E.36119
G3 X125.74 Y116.364 I4.162 J26.625 E.05416
G2 X130.462 Y115.732 I-48.9 J-383.44 E.15802
G1 X131.917 Y126.783 E.36974
G3 X131.979 Y127.453 I-7.636 J1.043 E.02234
G1 X128.231 Y126.96 E.1254
G1 X128.231 Y126.746 E.0071
G1 X130.49 Y126.448 E.07559
G1 X129.256 Y117.075 E.31361
G1 X125.633 Y117.552 E.12121
G1 X126.848 Y126.778 E.30868
G1 X125.85 Y126.646 E.03337
G1 X125.756 Y127.362 E.02395
G1 X125.602 Y127.362 E.00511
; WIPE_START
G1 F8843.478
G1 X125.33 Y125.381 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y129.41 Z9.4 F42000
G1 Z9
G1 E.8 F1800
G1 F4319
M204 S6000
G1 X125.247 Y138.26 E.29609
G1 X124.695 Y138.187 E.01846
G1 X125.894 Y129.084 E.30457
G1 X126.446 Y129.157 E.01847
G1 X126.42 Y129.351 E.0065
; WIPE_START
G1 F8843.478
G1 X126.159 Y131.334 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.101 Y129.501 Z9.4 F42000
G1 Z9
G1 E.8 F1800
G1 F4319
M204 S6000
G1 X130.49 Y129.552 E.01301
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.472 Y132.072 E.21332
G1 X126.867 Y129.075 E.10029
G1 X130.042 Y129.493 E.10622
M204 S250
G1 X130.05 Y129.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4319
M204 S5000
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.861 Y132.123 E.18556
G1 X127.205 Y129.515 E.08085
G1 X129.991 Y129.882 E.08634
M204 S10000
G1 X130.876 Y129.74 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4319
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
G1 X125.543 Y128.627 Z9.4 F42000
G1 Z9
G1 E.8 F1800
G1 F4319
M204 S6000
G1 X131.884 Y129.462 E.21216
G1 X130.58 Y139.373 E.33158
G1 X124.239 Y138.538 E.21215
G1 X125.535 Y128.687 E.32959
; WIPE_START
G1 F8843.478
G1 X127.521 Y128.929 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.406 Y136.263 Z9.4 F42000
G1 X124.622 Y138.984 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4319
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
G1 X126.412 Y131.652 Z9.4 F42000
G1 X126.073 Y117.889 Z9.4
G1 Z9
G1 E.8 F1800
G1 F4319
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
G1 X126.014 Y124.984 Z9.4 F42000
G1 X125.203 Y127.909 Z9.4
G1 Z9
G1 E.8 F1800
G1 F4319
M204 S5000
M73 P76 R4
G1 X125.188 Y127.68 E.00705
G1 X123.723 Y116.551 E.34491
G3 X123.88 Y116.207 I.276 J-.082 E.01267
G3 X128.788 Y115.567 I96.084 J718.417 E.1521
G3 X130.634 Y115.321 I4.26 J24.962 E.05725
G1 X130.669 Y115.329 E.00108
G1 X130.696 Y115.344 E.00096
G3 X130.841 Y115.608 I-.304 J.338 E.00943
G1 X132.306 Y126.736 E.34488
G3 X132.306 Y129.264 I-10.794 J1.264 E.07786
G1 X130.732 Y141.217 E.37046
G3 X130.524 Y141.389 I-.192 J-.021 E.00916
G1 X123.784 Y140.502 E.2089
G3 X123.613 Y140.29 I.021 J-.192 E.00929
G1 X125.188 Y128.321 E.37095
G2 X125.203 Y128.001 I-3.409 J-.321 E.00986
G1 X125.203 Y127.969 E.00099
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.188 Y127.68 E-.10993
G1 X124.965 Y125.984 E-.65007
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X126.062 Y126.058 F42000
G1 Z9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.19259
G1 F4319
M204 S6000
G1 X124.88 Y117.081 E.11044
M204 S10000
G1 X129.862 Y116.424 F42000
; LINE_WIDTH: 0.192594
G1 F4319
M204 S6000
G1 X131.219 Y126.737 E.12687
M204 S10000
G1 X130.748 Y126.853 F42000
; LINE_WIDTH: 0.429475
G1 F4319
M204 S6000
G1 X130.549 Y126.853 E.00627
; LINE_WIDTH: 0.385135
G1 X130.35 Y126.853 E.00555
; LINE_WIDTH: 0.340794
G1 X130.151 Y126.853 E.00483
; LINE_WIDTH: 0.296454
G1 X129.952 Y126.853 E.00411
; LINE_WIDTH: 0.252114
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
G1 X128.034 Y126.853 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.507828
G1 F4319
M204 S6000
G1 X127.708 Y126.853 E.01236
; LINE_WIDTH: 0.458948
G1 X127.382 Y126.853 E.01106
; LINE_WIDTH: 0.410069
G1 X127.055 Y126.853 E.00976
; WIPE_START
G1 F9805.298
G1 X127.382 Y126.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.143 Y129.322 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.192437
G1 F4319
M204 S6000
G1 X124.998 Y138.022 E.10691
; WIPE_START
G1 F15000
G1 X125.259 Y136.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y138.735 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.480555
G1 F4319
M204 S6000
G1 X124.025 Y140.336 E.05757
M204 S10000
G1 X130.321 Y141.164 F42000
; LINE_WIDTH: 0.480852
G1 F4319
M204 S6000
G1 X130.531 Y139.564 E.05759
; WIPE_START
G1 F8220.466
G1 X130.321 Y141.164 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.98 Y138.678 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.192577
G1 F4319
M204 S6000
G1 X131.125 Y129.978 E.10701
; WIPE_START
G1 F15000
G1 X130.864 Y131.961 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.887 Y129.265 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.466963
G1 F4319
M204 S6000
G2 X131.983 Y128.404 I-18.559 J-2.495 E.02993
; LINE_WIDTH: 0.423328
G1 X132.014 Y128 E.01256
; LINE_WIDTH: 0.387814
G1 X132.032 Y127.658 E.00962
; CHANGE_LAYER
; Z_HEIGHT: 9.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10437.992
G1 X132.014 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 46/68
; update layer progress
M73 L46
M991 S0 P45 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z9.4 I.189 J-1.202 P1  F42000
G1 X126.188 Y127.086 Z9.4
G1 Z9.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4305
M204 S5000
G1 X131.661 Y127.807 E.16961
G1 X131.501 Y129.016 E.03749
G1 X126.029 Y128.296 E.16961
G1 X126.13 Y127.523 E.02394
G1 X126.18 Y127.146 E.0117
M204 S10000
G1 X126.292 Y126.294 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4305
M204 S6000
G1 X125.803 Y126.23 E.01635
G1 X124.599 Y117.078 E.3062
G3 X125.15 Y117.004 I1.571 J9.69 E.01847
G1 X126.375 Y126.305 E.31117
G1 X126.352 Y126.302 E.00077
; WIPE_START
G1 F8843.478
G1 X125.803 Y126.23 E-.21016
G1 X125.614 Y124.795 E-.54984
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.961 Y126.909 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
G1 F4305
M204 S6000
G1 X129.58 Y116.421 E.35091
G3 X130.132 Y116.349 I1.526 J9.603 E.01847
G1 X131.533 Y126.984 E.35582
G1 X131.021 Y126.917 E.01713
; WIPE_START
G1 F8843.478
G1 X130.749 Y124.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.542 Y127.362 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
G1 F4305
M204 S6000
G1 X124.143 Y116.735 E.35558
G3 X128.44 Y116.172 I54.012 J396.094 E.14377
G3 X130.484 Y115.899 I5.776 J35.469 E.0684
G1 X131.917 Y126.783 E.36414
G3 X131.979 Y127.453 I-7.642 J1.044 E.02234
G1 X128.231 Y126.96 E.1254
G1 X128.231 Y126.746 E.0071
G1 X130.49 Y126.448 E.07559
G1 X129.256 Y117.075 E.31361
G1 X125.633 Y117.552 E.12121
G1 X126.848 Y126.778 E.30868
G1 X125.85 Y126.646 E.03337
G1 X125.756 Y127.362 E.02395
G1 X125.602 Y127.362 E.00511
; WIPE_START
G1 F8843.478
G1 X125.33 Y125.381 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y129.41 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
G1 F4305
M204 S6000
G1 X125.247 Y138.26 E.29609
G1 X124.695 Y138.187 E.01846
G1 X125.894 Y129.084 E.30457
G1 X126.446 Y129.157 E.01847
G1 X126.42 Y129.351 E.0065
; WIPE_START
G1 F8843.478
G1 X126.159 Y131.334 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.101 Y129.501 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
G1 F4305
M204 S6000
G1 X130.49 Y129.552 E.01301
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.496 Y131.894 E.21927
G1 X126.867 Y129.075 E.09434
G1 X130.042 Y129.493 E.10622
M204 S250
G1 X130.05 Y129.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4305
M204 S5000
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.885 Y131.946 E.19107
G1 X127.205 Y129.515 E.07534
G1 X129.991 Y129.882 E.08634
M204 S10000
G1 X130.876 Y129.74 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4305
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
G1 X125.543 Y128.627 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
G1 F4305
M204 S6000
G1 X131.884 Y129.462 E.21216
G1 X130.58 Y139.373 E.33158
G1 X124.239 Y138.538 E.21215
G1 X125.535 Y128.687 E.32959
; WIPE_START
G1 F8843.478
G1 X127.521 Y128.929 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.406 Y136.263 Z9.6 F42000
G1 X124.622 Y138.984 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4305
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
G1 X126.412 Y131.652 Z9.6 F42000
G1 X126.073 Y117.889 Z9.6
G1 Z9.2
G1 E.8 F1800
G1 F4305
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
G1 X126.015 Y124.986 Z9.6 F42000
G1 X125.203 Y127.912 Z9.6
G1 Z9.2
G1 E.8 F1800
G1 F4305
M204 S5000
G1 X125.188 Y127.68 E.00715
G1 X123.745 Y116.716 E.3398
G3 X123.909 Y116.373 I.265 J-.084 E.01287
G3 X128.386 Y115.784 I43.299 J311.734 E.13875
G3 X130.651 Y115.49 I5.816 J35.942 E.0702
G3 X130.863 Y115.775 I-.103 J.297 E.01159
G1 X132.306 Y126.736 E.3397
G3 X132.306 Y129.264 I-10.794 J1.264 E.07786
G1 X130.732 Y141.217 E.37045
G3 X130.524 Y141.389 I-.191 J-.02 E.00919
G1 X123.784 Y140.502 E.20889
G3 X123.613 Y140.29 I.021 J-.192 E.00928
G1 X125.188 Y128.32 E.37099
G2 X125.207 Y128 I-2.783 J-.32 E.00985
G1 X125.206 Y127.972 E.00085
; WIPE_START
M73 P77 R4
G1 F9547.055
M204 S6000
G1 X125.188 Y127.68 E-.11124
G1 X124.965 Y125.987 E-.64876
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X126.062 Y126.058 F42000
G1 Z9.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192588
G1 F4305
M204 S6000
G1 X124.91 Y117.314 E.10757
; LINE_WIDTH: 0.174671
G1 X124.869 Y117.282 E.00056
; LINE_WIDTH: 0.138807
G1 X124.827 Y117.25 E.00041
M204 S10000
G1 X125.365 Y117.077 F42000
; LINE_WIDTH: 0.638552
G1 F4305
M204 S6000
G1 X129.392 Y116.547 E.19711
M204 S10000
G1 X129.955 Y116.574 F42000
; LINE_WIDTH: 0.150832
G1 F4305
M204 S6000
G1 X129.924 Y116.616 E.00046
; LINE_WIDTH: 0.178661
G1 X129.892 Y116.657 E.00058
; LINE_WIDTH: 0.192596
G1 X131.219 Y126.737 E.12401
M204 S10000
G1 X130.748 Y126.853 F42000
; LINE_WIDTH: 0.429475
G1 F4305
M204 S6000
G1 X130.549 Y126.853 E.00627
; LINE_WIDTH: 0.385135
G1 X130.35 Y126.853 E.00555
; LINE_WIDTH: 0.340794
G1 X130.151 Y126.853 E.00483
; LINE_WIDTH: 0.296454
G1 X129.952 Y126.853 E.00411
; LINE_WIDTH: 0.252114
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
G1 X128.034 Y126.853 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
; LINE_WIDTH: 0.507827
G1 F4305
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
; LINE_WIDTH: 0.192437
G1 F4305
M204 S6000
G1 X124.998 Y138.022 E.10691
; WIPE_START
G1 F15000
G1 X125.259 Y136.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y138.735 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
; LINE_WIDTH: 0.480531
G1 F4305
M204 S6000
G1 X124.025 Y140.336 E.05757
M204 S10000
G1 X130.321 Y141.164 F42000
; LINE_WIDTH: 0.480843
G1 F4305
M204 S6000
G1 X130.531 Y139.564 E.05759
; WIPE_START
G1 F8220.635
G1 X130.321 Y141.164 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.98 Y138.678 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
; LINE_WIDTH: 0.192587
G1 F4305
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
G1 F4305
M204 S6000
G2 X131.983 Y128.404 I-18.593 J-2.498 E.02993
; LINE_WIDTH: 0.423328
G1 X132.014 Y128 E.01256
; LINE_WIDTH: 0.38782
G1 X132.032 Y127.658 E.00962
; CHANGE_LAYER
; Z_HEIGHT: 9.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10437.812
G1 X132.014 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 47/68
; update layer progress
M73 L47
M991 S0 P46 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z9.6 I.189 J-1.202 P1  F42000
G1 X126.188 Y127.086 Z9.6
G1 Z9.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4286
M204 S5000
G1 X131.661 Y127.807 E.16961
G1 X131.501 Y129.016 E.03749
G1 X126.029 Y128.296 E.16961
G1 X126.126 Y127.554 E.023
G1 X126.18 Y127.146 E.01265
M204 S10000
G1 X126.292 Y126.294 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4286
M204 S6000
G1 X125.803 Y126.23 E.01636
G1 X124.621 Y117.246 E.30059
G1 X125.171 Y117.163 E.01847
G1 X126.375 Y126.305 E.30586
G1 X126.352 Y126.302 E.00077
; WIPE_START
G1 F8843.478
G1 X125.803 Y126.23 E-.21016
G1 X125.614 Y124.795 E-.54984
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.961 Y126.909 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
G1 F4286
M204 S6000
G1 X129.601 Y116.579 E.3456
G1 X130.154 Y116.516 E.01847
G1 X131.533 Y126.984 E.35024
G1 X131.021 Y126.917 E.01713
; WIPE_START
G1 F8843.478
G1 X130.748 Y124.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.542 Y127.362 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
G1 F4286
M204 S6000
G1 X124.165 Y116.902 E.34997
G3 X128.684 Y116.3 I46.056 J328.429 E.15123
G3 X130.506 Y116.066 I5.095 J32.405 E.06094
G1 X131.917 Y126.783 E.35858
G3 X131.979 Y127.453 I-7.642 J1.044 E.02233
G1 X128.231 Y126.96 E.1254
G1 X128.231 Y126.746 E.0071
G1 X130.49 Y126.448 E.07559
G1 X129.256 Y117.075 E.31361
G1 X125.633 Y117.552 E.12121
G1 X126.848 Y126.778 E.30868
G1 X125.85 Y126.646 E.03337
G1 X125.756 Y127.362 E.02395
G1 X125.602 Y127.362 E.00511
; WIPE_START
G1 F8843.478
G1 X125.33 Y125.381 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y129.41 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
G1 F4286
M204 S6000
G1 X125.247 Y138.26 E.29609
G1 X124.695 Y138.187 E.01846
G1 X125.894 Y129.084 E.30457
G1 X126.446 Y129.157 E.01847
G1 X126.42 Y129.351 E.0065
; WIPE_START
G1 F8843.478
G1 X126.159 Y131.334 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.101 Y129.501 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
G1 F4286
M204 S6000
G1 X130.49 Y129.552 E.01301
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.519 Y131.717 E.22522
G1 X126.867 Y129.075 E.08839
G1 X130.042 Y129.493 E.10622
M204 S250
G1 X130.05 Y129.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4286
M204 S5000
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.908 Y131.768 E.19658
G1 X127.205 Y129.515 E.06983
G1 X129.991 Y129.882 E.08634
M204 S10000
G1 X130.876 Y129.74 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4286
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
G1 X125.543 Y128.627 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
G1 F4286
M204 S6000
G1 X131.884 Y129.462 E.21216
G1 X130.58 Y139.373 E.33158
G1 X124.239 Y138.538 E.21215
G1 X125.535 Y128.687 E.32959
; WIPE_START
G1 F8843.478
G1 X127.521 Y128.929 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.406 Y136.263 Z9.8 F42000
G1 X124.622 Y138.984 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4286
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
G1 X126.412 Y131.652 Z9.8 F42000
G1 X126.073 Y117.889 Z9.8
G1 Z9.4
G1 E.8 F1800
G1 F4286
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
G1 X126.016 Y124.988 Z9.8 F42000
G1 X125.204 Y127.917 Z9.8
G1 Z9.4
G1 E.8 F1800
G1 F4286
M204 S5000
G1 X125.188 Y127.678 E.00735
G1 X123.765 Y116.872 E.33489
G3 X123.899 Y116.546 I.286 J-.074 E.01162
G3 X125.932 Y116.267 I7.258 J45.428 E.06306
G1 X128.216 Y115.966 E.07079
G3 X130.626 Y115.657 I11.78 J82.299 E.07467
G3 X130.712 Y115.664 I.03 J.178 E.00267
G3 X130.884 Y115.932 I-.152 J.286 E.01022
G1 X132.306 Y126.736 E.33484
G3 X132.306 Y129.264 I-10.792 J1.264 E.07785
G1 X130.732 Y141.217 E.37046
G3 X130.524 Y141.389 I-.192 J-.021 E.00916
G1 X123.784 Y140.502 E.2089
G3 X123.613 Y140.29 I.021 J-.192 E.00927
G1 X125.188 Y128.322 E.37092
G2 X125.2 Y128 I-4.375 J-.322 E.00991
G1 X125.201 Y127.976 E.00072
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.188 Y127.678 E-.11359
G1 X124.966 Y125.991 E-.64641
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
G1 X0 Y127.189 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
M73 P78 R4
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


G1 X126.062 Y126.058 F42000
G1 Z9.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192598
G1 F4286
M204 S6000
G1 X124.923 Y117.406 E.10644
M204 S10000
G1 X125.376 Y117.157 F42000
; LINE_WIDTH: 0.479207
G1 F4286
M204 S6000
G1 X129.402 Y116.627 E.14438
M204 S10000
G1 X129.904 Y116.749 F42000
; LINE_WIDTH: 0.192593
G1 F4286
M204 S6000
G1 X131.219 Y126.737 E.12287
M204 S10000
G1 X130.748 Y126.853 F42000
; LINE_WIDTH: 0.429494
G1 F4286
M204 S6000
G1 X130.549 Y126.853 E.00627
; LINE_WIDTH: 0.385152
G1 X130.35 Y126.853 E.00555
; LINE_WIDTH: 0.340809
G1 X130.151 Y126.853 E.00483
; LINE_WIDTH: 0.296466
G1 X129.952 Y126.853 E.00411
; LINE_WIDTH: 0.252123
G1 X129.753 Y126.853 E.00339
; LINE_WIDTH: 0.20778
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
G1 X128.034 Y126.853 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
; LINE_WIDTH: 0.507827
G1 F4286
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
G1 X126.143 Y129.322 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
; LINE_WIDTH: 0.192437
G1 F4286
M204 S6000
G1 X124.998 Y138.022 E.10691
; WIPE_START
G1 F15000
G1 X125.259 Y136.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y138.735 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
; LINE_WIDTH: 0.480541
G1 F4286
M204 S6000
G1 X124.025 Y140.336 E.05757
M204 S10000
G1 X130.321 Y141.164 F42000
; LINE_WIDTH: 0.480841
G1 F4286
M204 S6000
G1 X130.531 Y139.564 E.05759
; WIPE_START
G1 F8220.669
G1 X130.321 Y141.164 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.98 Y138.678 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
; LINE_WIDTH: 0.192577
G1 F4286
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
; LINE_WIDTH: 0.46696
G1 F4286
M204 S6000
G2 X131.983 Y128.404 I-18.593 J-2.498 E.02993
; LINE_WIDTH: 0.423323
G1 X132.014 Y128 E.01256
; LINE_WIDTH: 0.387816
G1 X132.032 Y127.658 E.00962
; CHANGE_LAYER
; Z_HEIGHT: 9.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F10437.949
G1 X132.014 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 48/68
; update layer progress
M73 L48
M991 S0 P47 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z9.8 I.189 J-1.202 P1  F42000
G1 X126.188 Y127.086 Z9.8
G1 Z9.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4270
M204 S5000
G1 X131.661 Y127.807 E.16961
G1 X131.501 Y129.016 E.03749
G1 X126.029 Y128.296 E.16961
G1 X126.122 Y127.584 E.02205
G1 X126.18 Y127.146 E.01359
M204 S10000
G1 X126.292 Y126.294 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4270
M204 S6000
G1 X125.803 Y126.23 E.01636
G1 X124.641 Y117.403 E.29531
G2 X125.193 Y117.331 I-1.045 J-10.097 E.01847
G1 X126.375 Y126.305 E.30025
G1 X126.352 Y126.302 E.00077
; WIPE_START
G1 F8843.478
G1 X125.803 Y126.23 E-.21016
G1 X125.614 Y124.795 E-.54984
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.961 Y126.909 Z10 F42000
G1 Z9.6
G1 E.8 F1800
G1 F4270
M204 S6000
G1 X129.623 Y116.747 E.34
G2 X130.176 Y116.677 I-1.217 J-11.898 E.01847
G1 X131.533 Y126.984 E.34485
G1 X131.021 Y126.917 E.01713
; WIPE_START
G1 F8843.478
G1 X130.748 Y124.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.542 Y127.362 Z10 F42000
G1 Z9.6
G1 E.8 F1800
G1 F4270
M204 S6000
G1 X124.184 Y117.049 E.34506
G2 X130.526 Y116.218 I-157.72 J-1228.427 E.21216
G1 X131.917 Y126.783 E.35348
G3 X131.979 Y127.453 I-7.635 J1.043 E.02234
G1 X128.231 Y126.96 E.1254
M73 P78 R3
G1 X128.231 Y126.746 E.0071
G1 X130.49 Y126.448 E.07559
G1 X129.256 Y117.075 E.31361
G1 X125.633 Y117.552 E.12121
G1 X126.848 Y126.778 E.30868
G1 X125.85 Y126.646 E.03337
G1 X125.756 Y127.362 E.02395
G1 X125.602 Y127.362 E.00511
; WIPE_START
G1 F8843.478
G1 X125.33 Y125.381 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y129.41 Z10 F42000
G1 Z9.6
G1 E.8 F1800
G1 F4270
M204 S6000
G1 X125.247 Y138.26 E.29609
G1 X124.696 Y138.187 E.01846
G1 X125.894 Y129.084 E.30457
G1 X126.446 Y129.157 E.01847
G1 X126.42 Y129.351 E.0065
; WIPE_START
G1 F8843.478
G1 X126.159 Y131.334 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.101 Y129.501 Z10 F42000
G1 Z9.6
G1 E.8 F1800
G1 F4270
M204 S6000
G1 X130.49 Y129.552 E.01301
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.543 Y131.539 E.23117
G1 X126.867 Y129.075 E.08244
G1 X130.042 Y129.493 E.10622
M204 S250
G1 X130.05 Y129.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4270
M204 S5000
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.931 Y131.59 E.20209
G1 X127.205 Y129.515 E.06432
G1 X129.991 Y129.882 E.08634
M204 S10000
G1 X130.876 Y129.74 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4270
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
G1 X125.543 Y128.627 Z10 F42000
G1 Z9.6
G1 E.8 F1800
G1 F4270
M204 S6000
G1 X131.884 Y129.462 E.21216
G1 X130.58 Y139.373 E.33158
G1 X124.239 Y138.538 E.21215
G1 X125.535 Y128.687 E.32959
; WIPE_START
G1 F8843.478
G1 X127.521 Y128.929 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.528 Y121.362 Z10 F42000
G1 X126.073 Y117.889 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4270
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
G1 X126.844 Y125.17 Z10 F42000
G1 X124.622 Y138.984 Z10
G1 Z9.6
G1 E.8 F1800
G1 F4270
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
G1 X125.669 Y131.707 Z10 F42000
G1 X125.204 Y127.921 Z10
G1 Z9.6
G1 E.8 F1800
G1 F4270
M204 S5000
G1 X125.188 Y127.678 E.0075
G1 X123.784 Y117.015 E.33047
G3 X123.952 Y116.696 I.259 J-.067 E.01216
G3 X130.707 Y115.813 I44.936 J317.558 E.2093
G1 X130.776 Y115.843 E.00234
G3 X130.903 Y116.077 I-.227 J.273 E.00836
G1 X132.306 Y126.736 E.33036
G3 X132.306 Y129.264 I-10.794 J1.264 E.07786
G1 X130.732 Y141.217 E.37046
G3 X130.524 Y141.389 I-.191 J-.02 E.00918
G1 X123.784 Y140.502 E.20888
G3 X123.613 Y140.291 I.02 J-.192 E.00927
G1 X125.188 Y128.321 E.37096
G2 X125.201 Y128 I-4.043 J-.321 E.00989
G1 X125.202 Y127.981 E.00057
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.188 Y127.678 E-.11541
G1 X124.967 Y125.996 E-.64459
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X126.062 Y126.058 F42000
G1 Z9.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192588
G1 F4270
M204 S6000
G1 X124.944 Y117.572 E.1044
M204 S10000
G1 X125.386 Y117.238 F42000
; LINE_WIDTH: 0.319932
G1 F4270
M204 S6000
G1 X129.413 Y116.707 E.09167
M204 S10000
G1 X129.926 Y116.916 F42000
; LINE_WIDTH: 0.192601
G1 F4270
M204 S6000
G1 X131.219 Y126.737 E.12083
M204 S10000
G1 X130.748 Y126.853 F42000
; LINE_WIDTH: 0.429475
G1 F4270
M204 S6000
G1 X130.549 Y126.853 E.00627
; LINE_WIDTH: 0.385135
G1 X130.35 Y126.853 E.00555
; LINE_WIDTH: 0.340794
G1 X130.151 Y126.853 E.00483
; LINE_WIDTH: 0.296454
M73 P79 R3
G1 X129.952 Y126.853 E.00411
; LINE_WIDTH: 0.252114
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
G1 X128.034 Y126.853 Z10 F42000
G1 Z9.6
G1 E.8 F1800
; LINE_WIDTH: 0.507828
G1 F4270
M204 S6000
G1 X127.708 Y126.853 E.01236
; LINE_WIDTH: 0.458948
G1 X127.382 Y126.853 E.01106
; LINE_WIDTH: 0.410069
G1 X127.055 Y126.853 E.00976
; WIPE_START
G1 F9805.298
G1 X127.382 Y126.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.143 Y129.322 Z10 F42000
G1 Z9.6
G1 E.8 F1800
; LINE_WIDTH: 0.192429
G1 F4270
M204 S6000
G1 X124.998 Y138.022 E.1069
; WIPE_START
G1 F15000
G1 X125.259 Y136.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y138.735 Z10 F42000
G1 Z9.6
G1 E.8 F1800
; LINE_WIDTH: 0.480528
G1 F4270
M204 S6000
G1 X124.025 Y140.336 E.05757
M204 S10000
G1 X130.321 Y141.164 F42000
; LINE_WIDTH: 0.480838
G1 F4270
M204 S6000
G1 X130.531 Y139.564 E.05759
; WIPE_START
G1 F8220.725
G1 X130.321 Y141.164 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.98 Y138.678 Z10 F42000
G1 Z9.6
G1 E.8 F1800
; LINE_WIDTH: 0.192577
G1 F4270
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
; LINE_WIDTH: 0.466963
G1 F4270
M204 S6000
G2 X131.983 Y128.404 I-18.593 J-2.498 E.02993
; LINE_WIDTH: 0.423328
G1 X132.014 Y128 E.01256
; LINE_WIDTH: 0.38782
G1 X132.032 Y127.658 E.00962
; CHANGE_LAYER
; Z_HEIGHT: 9.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10437.812
G1 X132.014 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 49/68
; update layer progress
M73 L49
M991 S0 P48 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z10 I.189 J-1.202 P1  F42000
G1 X126.188 Y127.086 Z10
G1 Z9.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4253
M204 S5000
G1 X131.661 Y127.807 E.16961
G1 X131.501 Y129.016 E.03749
G1 X126.029 Y128.296 E.16961
G1 X126.118 Y127.615 E.02111
G1 X126.18 Y127.146 E.01454
M204 S10000
G1 X126.292 Y126.294 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4253
M204 S6000
G1 X125.803 Y126.23 E.01635
G1 X124.661 Y117.55 E.29042
G1 X125.213 Y117.482 E.01847
G1 X126.375 Y126.305 E.29518
G1 X126.352 Y126.302 E.00077
; WIPE_START
G1 F8843.478
G1 X125.803 Y126.23 E-.21016
G1 X125.614 Y124.795 E-.54984
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.961 Y126.909 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
G1 F4253
M204 S6000
G1 X129.644 Y116.901 E.33483
G1 X130.195 Y116.825 E.01847
G1 X131.533 Y126.984 E.33988
G1 X131.021 Y126.917 E.01713
; WIPE_START
G1 F8843.478
G1 X130.748 Y124.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.542 Y127.362 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
G1 F4253
M204 S6000
G1 X124.205 Y117.206 E.33979
G1 X124.414 Y117.17 E.00705
G2 X130.546 Y116.371 I-175.846 J-1374.688 E.20512
G1 X131.917 Y126.783 E.34835
G3 X131.979 Y127.453 I-7.642 J1.044 E.02234
G1 X128.231 Y126.96 E.1254
G1 X128.231 Y126.746 E.0071
G1 X130.49 Y126.448 E.07559
G1 X129.256 Y117.075 E.31361
G1 X125.633 Y117.552 E.12121
G1 X126.848 Y126.778 E.30868
G1 X125.85 Y126.646 E.03337
G1 X125.756 Y127.362 E.02395
G1 X125.602 Y127.362 E.00511
; WIPE_START
G1 F8843.478
G1 X125.329 Y125.381 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y129.41 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
G1 F4253
M204 S6000
G1 X125.247 Y138.26 E.29609
G1 X124.696 Y138.187 E.01846
G1 X125.894 Y129.084 E.30457
G1 X126.446 Y129.157 E.01847
G1 X126.42 Y129.351 E.0065
; WIPE_START
G1 F8843.478
G1 X126.159 Y131.334 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.101 Y129.501 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
G1 F4253
M204 S6000
G1 X130.49 Y129.552 E.01301
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.566 Y131.361 E.23712
G1 X126.867 Y129.075 E.07649
G1 X130.042 Y129.493 E.10622
M204 S250
G1 X130.05 Y129.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4253
M204 S5000
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.955 Y131.412 E.2076
G1 X127.205 Y129.515 E.05881
G1 X129.991 Y129.882 E.08634
M204 S10000
G1 X130.876 Y129.74 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4253
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
G1 X125.543 Y128.627 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
G1 F4253
M204 S6000
G1 X131.884 Y129.462 E.21216
G1 X130.58 Y139.373 E.33158
G1 X124.239 Y138.538 E.21215
G1 X125.535 Y128.687 E.32959
; WIPE_START
G1 F8843.478
G1 X127.521 Y128.929 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.528 Y121.362 Z10.2 F42000
G1 X126.073 Y117.889 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4253
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
G1 X126.844 Y125.171 Z10.2 F42000
G1 X124.622 Y138.984 Z10.2
G1 Z9.8
G1 E.8 F1800
G1 F4253
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
G1 X125.669 Y131.707 Z10.2 F42000
G1 X125.204 Y127.926 Z10.2
G1 Z9.8
G1 E.8 F1800
G1 F4253
M204 S5000
G1 X125.188 Y127.678 E.00765
G1 X123.802 Y117.147 E.32638
G3 X123.968 Y116.843 I.24 J-.066 E.01176
G3 X130.716 Y115.959 I175.199 J1311.548 E.20914
G3 X130.92 Y116.211 I-.059 J.256 E.01074
G1 X132.306 Y126.736 E.32618
G3 X132.306 Y129.264 I-10.792 J1.264 E.07786
G1 X130.732 Y141.217 E.37046
G3 X130.524 Y141.389 I-.192 J-.022 E.00917
G1 X123.784 Y140.502 E.20888
G3 X123.613 Y140.291 I.02 J-.192 E.00927
G1 X125.188 Y128.32 E.37101
G2 X125.204 Y127.998 I-3.322 J-.319 E.00992
G1 X125.204 Y127.986 E.00035
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.188 Y127.678 E-.11736
G1 X124.967 Y126.001 E-.64264
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X126.062 Y126.058 F42000
G1 Z9.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192587
G1 F4253
M204 S6000
G1 X124.964 Y117.718 E.1026
M204 S10000
G1 X125.397 Y117.316 F42000
; LINE_WIDTH: 0.163985
G1 F4253
M204 S6000
G1 X129.423 Y116.787 E.04006
M204 S10000
G1 X129.946 Y117.065 F42000
; LINE_WIDTH: 0.1926
G1 F4253
M204 S6000
G1 X131.219 Y126.737 E.11899
M204 S10000
G1 X130.748 Y126.853 F42000
; LINE_WIDTH: 0.429479
G1 F4253
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
; LINE_WIDTH: 0.507828
G1 F4253
M204 S6000
G1 X127.708 Y126.853 E.01236
; LINE_WIDTH: 0.458948
G1 X127.382 Y126.853 E.01106
; LINE_WIDTH: 0.410069
G1 X127.055 Y126.853 E.00976
; WIPE_START
G1 F9805.298
G1 X127.382 Y126.853 E-.76
; WIPE_END
M73 P80 R3
G1 E-.04 F1800
M204 S10000
G1 X126.143 Y129.322 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
; LINE_WIDTH: 0.192429
G1 F4253
M204 S6000
G1 X124.998 Y138.022 E.1069
; WIPE_START
G1 F15000
G1 X125.259 Y136.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y138.735 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
; LINE_WIDTH: 0.480511
G1 F4253
M204 S6000
G1 X124.025 Y140.336 E.05757
M204 S10000
G1 X130.321 Y141.164 F42000
; LINE_WIDTH: 0.480853
G1 F4253
M204 S6000
G1 X130.531 Y139.564 E.05759
; WIPE_START
G1 F8220.437
G1 X130.321 Y141.164 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.98 Y138.678 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
; LINE_WIDTH: 0.192587
G1 F4253
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
G1 F4253
M204 S6000
G2 X131.983 Y128.404 I-18.572 J-2.496 E.02993
; LINE_WIDTH: 0.423327
G1 X132.014 Y128 E.01257
; LINE_WIDTH: 0.387802
G1 X132.032 Y127.658 E.00962
; CHANGE_LAYER
; Z_HEIGHT: 10
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10438.354
G1 X132.014 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 50/68
; update layer progress
M73 L50
M991 S0 P49 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z10.2 I.189 J-1.202 P1  F42000
G1 X126.188 Y127.086 Z10.2
G1 Z10
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4232
M204 S5000
G1 X131.661 Y127.807 E.16961
G1 X131.501 Y129.016 E.03749
G1 X126.029 Y128.296 E.16961
G1 X126.114 Y127.645 E.02016
G1 X126.18 Y127.146 E.01548
M204 S10000
G1 X126.292 Y126.294 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4232
M204 S6000
G1 X125.803 Y126.23 E.01636
G1 X124.679 Y117.692 E.28566
G2 X125.231 Y117.617 I-6.164 J-47.764 E.01847
G1 X126.375 Y126.305 E.29067
G1 X126.352 Y126.302 E.00077
; WIPE_START
G1 F8843.478
G1 X125.803 Y126.23 E-.21016
G1 X125.614 Y124.795 E-.54984
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.961 Y126.909 Z10.4 F42000
G1 Z10
G1 E.8 F1800
G1 F4232
M204 S6000
G1 X129.661 Y117.032 E.33044
G1 X130.213 Y116.962 E.01847
G1 X131.533 Y126.984 E.33533
G1 X131.021 Y126.917 E.01713
; WIPE_START
G1 F8843.478
G1 X130.748 Y124.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.542 Y127.362 Z10.4 F42000
G1 Z10
G1 E.8 F1800
G1 F4232
M204 S6000
G1 X124.223 Y117.341 E.33529
G3 X130.564 Y116.506 I107.255 J790.289 E.21216
G1 X131.917 Y126.783 E.34384
G3 X131.979 Y127.453 I-7.642 J1.044 E.02234
G1 X128.231 Y126.96 E.1254
G1 X128.231 Y126.746 E.0071
G1 X130.49 Y126.448 E.07559
G1 X129.256 Y117.075 E.31361
G1 X125.633 Y117.552 E.12121
G1 X126.848 Y126.778 E.30868
G1 X125.85 Y126.646 E.03337
G1 X125.756 Y127.362 E.02395
G1 X125.602 Y127.362 E.00511
; WIPE_START
G1 F8843.478
G1 X125.329 Y125.381 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y129.41 Z10.4 F42000
G1 Z10
G1 E.8 F1800
G1 F4232
M204 S6000
G1 X125.247 Y138.26 E.29609
G1 X124.696 Y138.187 E.01846
G1 X125.894 Y129.084 E.30457
G1 X126.446 Y129.157 E.01847
G1 X126.42 Y129.351 E.0065
; WIPE_START
G1 F8843.478
G1 X126.159 Y131.334 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.101 Y129.501 Z10.4 F42000
G1 Z10
G1 E.8 F1800
G1 F4232
M204 S6000
G1 X130.49 Y129.552 E.01301
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.589 Y131.183 E.24307
G1 X126.867 Y129.075 E.07054
G1 X130.042 Y129.493 E.10622
M204 S250
G1 X130.05 Y129.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4232
M204 S5000
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X126.978 Y131.234 E.21311
G1 X127.205 Y129.515 E.05329
G1 X129.991 Y129.882 E.08634
M204 S10000
G1 X130.876 Y129.74 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4232
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
G1 X125.977 Y128.685 Z10.4 F42000
G1 Z10
G1 E.8 F1800
G1 F4232
M204 S6000
G1 X131.884 Y129.462 E.19764
G1 X130.58 Y139.373 E.33158
G1 X124.239 Y138.538 E.21215
G1 X125.543 Y128.627 E.33158
G1 X125.918 Y128.677 E.01254
; WIPE_START
G1 F8843.478
G1 X127.901 Y128.938 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.655 Y121.408 Z10.4 F42000
G1 X126.073 Y117.889 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4232
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
G1 X126.844 Y125.172 Z10.4 F42000
G1 X124.622 Y138.984 Z10.4
G1 Z10
G1 E.8 F1800
G1 F4232
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
G1 X125.668 Y131.707 Z10.4 F42000
G1 X125.205 Y127.932 Z10.4
G1 Z10
G1 E.8 F1800
G1 F4232
M204 S5000
G1 X125.188 Y127.68 E.00776
G1 X123.817 Y117.264 E.3228
G3 X123.984 Y116.977 I.229 J-.059 E.01132
G3 X130.742 Y116.093 I97.456 J718.93 E.20943
G3 X130.936 Y116.327 I-.058 J.245 E.01003
G1 X132.306 Y126.736 E.32258
G3 X132.352 Y128.842 I-9.987 J1.273 E.06486
G1 X130.732 Y141.217 E.38348
G3 X130.524 Y141.389 I-.192 J-.021 E.00918
G1 X123.784 Y140.502 E.20888
G3 X123.613 Y140.291 I.02 J-.192 E.00926
G1 X125.188 Y128.322 E.37094
G2 X125.202 Y128.001 I-3.572 J-.323 E.00987
G1 X125.203 Y127.992 E.00029
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.188 Y127.68 E-.1187
G1 X124.968 Y126.007 E-.6413
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X126.062 Y126.058 F42000
G1 Z10
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.19259
G1 F4232
M204 S6000
G1 X124.982 Y117.857 E.10089
; WIPE_START
G1 F15000
G1 X125.243 Y119.84 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.964 Y117.199 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.192591
G1 F4232
M204 S6000
G1 X131.219 Y126.737 E.11734
M204 S10000
G1 X130.748 Y126.853 F42000
; LINE_WIDTH: 0.429476
G1 F4232
M204 S6000
G1 X130.549 Y126.853 E.00627
; LINE_WIDTH: 0.385135
G1 X130.35 Y126.853 E.00555
; LINE_WIDTH: 0.340795
G1 X130.151 Y126.853 E.00483
; LINE_WIDTH: 0.296455
G1 X129.952 Y126.853 E.00411
; LINE_WIDTH: 0.252114
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
G1 X128.034 Y126.853 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.507827
G1 F4232
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
G1 X126.143 Y129.322 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.19243
G1 F4232
M204 S6000
G1 X124.998 Y138.022 E.1069
; WIPE_START
G1 F15000
M73 P81 R3
G1 X125.259 Y136.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y138.735 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.480512
G1 F4232
M204 S6000
G1 X124.025 Y140.336 E.05757
M204 S10000
G1 X130.321 Y141.164 F42000
; LINE_WIDTH: 0.480842
G1 F4232
M204 S6000
G1 X130.531 Y139.564 E.05759
; WIPE_START
G1 F8220.649
G1 X130.321 Y141.164 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.98 Y138.678 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.192577
G1 F4232
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
; LINE_WIDTH: 0.466956
G1 F4232
M204 S6000
G2 X131.983 Y128.404 I-18.597 J-2.498 E.02993
; LINE_WIDTH: 0.423324
G1 X132.014 Y128 E.01256
; LINE_WIDTH: 0.38782
G1 X132.032 Y127.658 E.00962
; CHANGE_LAYER
; Z_HEIGHT: 10.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10437.812
G1 X132.014 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 51/68
; update layer progress
M73 L51
M991 S0 P50 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z10.4 I.189 J-1.202 P1  F42000
G1 X126.188 Y127.086 Z10.4
G1 Z10.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4222
M204 S5000
G1 X131.661 Y127.807 E.16961
G1 X131.501 Y129.016 E.03749
G1 X126.029 Y128.296 E.16961
G1 X126.11 Y127.676 E.01922
G1 X126.18 Y127.146 E.01643
M204 S10000
G1 X126.292 Y126.294 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4222
M204 S6000
G1 X125.803 Y126.23 E.01635
G1 X124.694 Y117.801 E.28202
G1 X125.246 Y117.73 E.01847
G1 X126.375 Y126.305 E.28689
G1 X126.352 Y126.302 E.00077
; WIPE_START
G1 F8843.478
G1 X125.803 Y126.23 E-.21016
G1 X125.614 Y124.795 E-.54984
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.961 Y126.909 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
G1 F4222
M204 S6000
G1 X129.676 Y117.148 E.32656
G1 X130.228 Y117.074 E.01847
G1 X131.533 Y126.984 E.33157
G1 X131.021 Y126.917 E.01713
; WIPE_START
G1 F8843.478
G1 X130.748 Y124.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.542 Y127.362 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
G1 F4222
M204 S6000
G1 X124.238 Y117.455 E.33147
G3 X126.524 Y117.158 I8.587 J57.011 E.07649
G3 X130.579 Y116.621 I61.139 J446.735 E.13568
G1 X131.917 Y126.783 E.33999
G3 X131.979 Y127.453 I-7.647 J1.044 E.02233
G1 X128.231 Y126.96 E.1254
G1 X128.231 Y126.746 E.0071
G1 X130.49 Y126.448 E.07559
G1 X129.256 Y117.075 E.31361
G1 X125.633 Y117.552 E.12121
G1 X126.848 Y126.778 E.30868
G1 X125.85 Y126.646 E.03337
G1 X125.756 Y127.362 E.02395
G1 X125.602 Y127.362 E.00511
; WIPE_START
G1 F8843.478
G1 X125.329 Y125.381 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y129.41 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
G1 F4222
M204 S6000
G1 X125.247 Y138.26 E.29609
G1 X124.696 Y138.187 E.01846
G1 X125.894 Y129.084 E.30457
G1 X126.446 Y129.157 E.01847
G1 X126.42 Y129.351 E.0065
; WIPE_START
G1 F8843.478
G1 X126.159 Y131.334 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.101 Y129.501 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
G1 F4222
M204 S6000
G1 X130.49 Y129.552 E.01301
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.613 Y131.005 E.24902
G1 X126.867 Y129.075 E.06459
G1 X130.042 Y129.493 E.10622
M204 S250
G1 X130.05 Y129.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4222
M204 S5000
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X127.002 Y131.057 E.21862
G1 X127.205 Y129.515 E.04778
G1 X129.991 Y129.882 E.08634
M204 S10000
G1 X130.876 Y129.74 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4222
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
G1 X125.543 Y128.627 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
G1 F4222
M204 S6000
G1 X131.884 Y129.462 E.21216
G1 X130.58 Y139.373 E.33158
G1 X124.239 Y138.538 E.21215
G1 X125.535 Y128.687 E.32959
; WIPE_START
G1 F8843.478
G1 X127.521 Y128.929 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.528 Y121.362 Z10.6 F42000
G1 X126.073 Y117.889 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4222
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
G1 X126.844 Y125.173 Z10.6 F42000
G1 X124.622 Y138.984 Z10.6
G1 Z10.2
G1 E.8 F1800
G1 F4222
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
G1 X125.668 Y131.707 Z10.6 F42000
G1 X125.205 Y127.937 Z10.6
G1 Z10.2
G1 E.8 F1800
G1 F4222
M204 S5000
G1 X125.188 Y127.68 E.00794
G1 X123.83 Y117.366 E.31966
G3 X123.999 Y117.094 I.217 J-.053 E.01095
G2 X130.17 Y116.275 I-201.74 J-1543.694 E.19125
G3 X130.757 Y116.209 I.648 J3.117 E.0182
G1 X130.776 Y116.213 E.00059
G3 X130.949 Y116.428 I-.065 J.229 E.00905
G1 X132.306 Y126.736 E.31946
G3 X132.306 Y129.264 I-10.793 J1.264 E.07785
G1 X130.732 Y141.217 E.37046
G3 X130.524 Y141.389 I-.192 J-.022 E.00918
G1 X123.784 Y140.502 E.20887
G3 X123.613 Y140.291 I.02 J-.192 E.00926
G1 X125.188 Y128.322 E.37095
G2 X125.203 Y128.001 I-3.556 J-.323 E.00987
G1 X125.203 Y127.997 E.00012
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.188 Y127.68 E-.12084
G1 X124.969 Y126.012 E-.63916
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X126.062 Y126.058 F42000
G1 Z10.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192589
G1 F4222
M204 S6000
G1 X124.996 Y117.967 E.09953
; WIPE_START
G1 F15000
G1 X125.257 Y119.95 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.979 Y117.313 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
; LINE_WIDTH: 0.192587
G1 F4222
M204 S6000
G1 X131.219 Y126.737 E.11593
M204 S10000
G1 X130.748 Y126.853 F42000
; LINE_WIDTH: 0.429476
G1 F4222
M204 S6000
G1 X130.549 Y126.853 E.00627
; LINE_WIDTH: 0.385135
G1 X130.35 Y126.853 E.00555
; LINE_WIDTH: 0.340795
G1 X130.151 Y126.853 E.00483
; LINE_WIDTH: 0.296455
G1 X129.952 Y126.853 E.00411
; LINE_WIDTH: 0.252114
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
; LINE_WIDTH: 0.507827
G1 F4222
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
G1 X126.143 Y129.322 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
; LINE_WIDTH: 0.192429
G1 F4222
M204 S6000
G1 X124.998 Y138.022 E.1069
; WIPE_START
G1 F15000
G1 X125.259 Y136.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y138.735 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
; LINE_WIDTH: 0.480512
G1 F4222
M204 S6000
G1 X124.025 Y140.336 E.05757
M204 S10000
G1 X130.321 Y141.164 F42000
; LINE_WIDTH: 0.480863
G1 F4222
M204 S6000
G1 X130.531 Y139.564 E.0576
; WIPE_START
G1 F8220.26
G1 X130.321 Y141.164 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.98 Y138.678 Z10.6 F42000
M73 P82 R3
G1 Z10.2
G1 E.8 F1800
; LINE_WIDTH: 0.192586
G1 F4222
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
G1 F4222
M204 S6000
G2 X131.983 Y128.404 I-18.593 J-2.498 E.02993
; LINE_WIDTH: 0.423328
G1 X132.014 Y128 E.01256
; LINE_WIDTH: 0.387819
G1 X132.032 Y127.658 E.00962
; CHANGE_LAYER
; Z_HEIGHT: 10.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10437.85
G1 X132.014 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 52/68
; update layer progress
M73 L52
M991 S0 P51 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z10.6 I.348 J-1.166 P1  F42000
G1 X126.292 Y126.294 Z10.6
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4309
M204 S6000
G1 X125.803 Y126.23 E.01636
G1 X124.707 Y117.902 E.27862
G1 X125.259 Y117.832 E.01847
G1 X126.375 Y126.305 E.28349
G1 X126.352 Y126.302 E.00077
; WIPE_START
G1 F8843.478
G1 X125.803 Y126.23 E-.21016
G1 X125.614 Y124.795 E-.54984
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.684 Y117.941 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
G1 F4309
M204 S6000
G1 X126.848 Y126.778 E.29567
G1 X125.85 Y126.646 E.03337
G1 X125.756 Y127.362 E.02395
G1 X125.542 Y127.362 E.0071
G1 X124.251 Y117.555 E.32813
G3 X125.61 Y117.377 I6.813 J46.773 E.04548
G1 X125.676 Y117.881 E.01686
; WIPE_START
G1 F8843.478
G1 X125.937 Y119.864 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.188 Y127.086 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4309
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
G1 X130.961 Y126.909 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4309
M204 S6000
G1 X129.689 Y117.249 E.32318
G1 X130.241 Y117.172 E.01847
G1 X131.533 Y126.984 E.32828
G1 X131.021 Y126.917 E.01713
; WIPE_START
G1 F8843.478
G1 X130.748 Y124.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.231 Y126.96 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
G1 F4309
M204 S6000
G1 X128.231 Y126.746 E.0071
G1 X130.49 Y126.448 E.07559
G1 X129.232 Y116.895 E.31963
G3 X130.592 Y116.72 I9.482 J68.25 E.04548
G1 X131.917 Y126.783 E.33669
G3 X131.979 Y127.453 I-7.642 J1.044 E.02234
G1 X128.29 Y126.968 E.12341
; WIPE_START
G1 F8843.478
G1 X128.231 Y126.746 E-.08734
G1 X129.986 Y126.515 E-.67266
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y129.41 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
G1 F4309
M204 S6000
G1 X125.247 Y138.26 E.29609
G1 X124.696 Y138.187 E.01846
G1 X125.894 Y129.084 E.30457
G1 X126.446 Y129.157 E.01847
G1 X126.42 Y129.351 E.0065
; WIPE_START
G1 F8843.478
G1 X126.159 Y131.334 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.101 Y129.501 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
G1 F4309
M204 S6000
G1 X130.49 Y129.552 E.01301
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.636 Y130.828 E.25497
G1 X126.867 Y129.075 E.05864
G1 X130.042 Y129.493 E.10622
M204 S250
G1 X130.05 Y129.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4309
M204 S5000
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X127.025 Y130.879 E.22413
G1 X127.205 Y129.515 E.04227
G1 X129.991 Y129.882 E.08634
M204 S10000
G1 X130.876 Y129.74 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4309
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
G1 X125.543 Y128.627 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
G1 F4309
M204 S6000
G1 X131.884 Y129.462 E.21216
G1 X130.58 Y139.373 E.33158
G1 X124.239 Y138.538 E.21215
G1 X125.535 Y128.687 E.32959
; WIPE_START
G1 F8843.478
G1 X127.521 Y128.929 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.528 Y121.362 Z10.8 F42000
G1 X126.073 Y117.889 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4309
M204 S5000
G1 X128.473 Y117.573 E.07437
G1 X128.918 Y117.515 E.01382
G1 X130.05 Y126.111 E.2664
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
G1 F4309
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
G1 X125.668 Y131.707 Z10.8 F42000
G1 X125.205 Y127.943 Z10.8
G1 Z10.4
G1 E.8 F1800
G1 F4309
M204 S5000
G1 X125.188 Y127.68 E.00812
G1 X123.841 Y117.45 E.31706
G3 X124.012 Y117.193 I.215 J-.042 E.0105
G3 X130.774 Y116.308 I100.159 J738.86 E.20956
G1 X130.814 Y116.316 E.00125
G3 X130.96 Y116.513 I-.082 J.213 E.00793
G1 X132.306 Y126.736 E.31684
G3 X132.306 Y129.264 I-10.794 J1.264 E.07786
G1 X130.732 Y141.217 E.37045
G3 X130.523 Y141.389 I-.191 J-.02 E.00921
G1 X123.784 Y140.502 E.20887
G3 X123.613 Y140.29 I.02 J-.191 E.0093
G1 X125.188 Y128.322 E.37091
G2 X125.203 Y128.003 I-3.543 J-.323 E.00981
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.188 Y127.68 E-.12308
G1 X124.969 Y126.018 E-.63692
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X126.062 Y126.058 F42000
G1 Z10.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192578
G1 F4309
M204 S6000
G1 X125.01 Y118.069 E.09827
; WIPE_START
G1 F15000
G1 X125.271 Y120.052 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.816 Y117.439 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
; LINE_WIDTH: 0.613386
G1 F4309
M204 S6000
G3 X127.306 Y117.243 I8.974 J62.433 E.06987
G1 X129.05 Y117.011 E.08176
; WIPE_START
G1 F6310.633
G1 X127.306 Y117.243 E-.66836
G1 X127.067 Y117.274 E-.09164
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.992 Y117.413 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
; LINE_WIDTH: 0.192595
G1 F4309
M204 S6000
G1 X131.219 Y126.737 E.11471
M204 S10000
G1 X130.748 Y126.853 F42000
; LINE_WIDTH: 0.429475
G1 F4309
M204 S6000
G1 X130.549 Y126.853 E.00627
; LINE_WIDTH: 0.385135
G1 X130.35 Y126.853 E.00555
; LINE_WIDTH: 0.340794
G1 X130.151 Y126.853 E.00483
; LINE_WIDTH: 0.296454
G1 X129.952 Y126.853 E.00411
; LINE_WIDTH: 0.252114
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
; LINE_WIDTH: 0.507827
G1 F4309
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
G1 X126.143 Y129.322 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
; LINE_WIDTH: 0.192418
G1 F4309
M204 S6000
G1 X124.998 Y138.022 E.10689
; WIPE_START
G1 F15000
G1 X125.259 Y136.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y138.735 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
; LINE_WIDTH: 0.480494
G1 F4309
M204 S6000
G1 X124.025 Y140.336 E.05756
M204 S10000
G1 X130.321 Y141.164 F42000
; LINE_WIDTH: 0.480862
G1 F4309
M204 S6000
G1 X130.531 Y139.564 E.0576
; WIPE_START
G1 F8220.279
G1 X130.321 Y141.164 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.98 Y138.678 Z10.8 F42000
M73 P83 R3
G1 Z10.4
G1 E.8 F1800
; LINE_WIDTH: 0.192586
G1 F4309
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
; LINE_WIDTH: 0.466961
G1 F4309
M204 S6000
G2 X131.983 Y128.404 I-18.593 J-2.498 E.02993
; LINE_WIDTH: 0.423323
G1 X132.014 Y128 E.01256
; LINE_WIDTH: 0.387812
G1 X132.032 Y127.658 E.00962
; CHANGE_LAYER
; Z_HEIGHT: 10.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F10438.056
G1 X132.014 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 53/68
; update layer progress
M73 L53
M991 S0 P52 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z10.8 I.348 J-1.166 P1  F42000
G1 X126.292 Y126.294 Z10.8
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4296
M204 S6000
G1 X125.803 Y126.23 E.01636
G1 X124.718 Y117.985 E.27585
G3 X125.27 Y117.917 I1.569 J10.384 E.01847
G1 X126.375 Y126.305 E.28066
G1 X126.352 Y126.302 E.00077
; WIPE_START
G1 F8843.478
G1 X125.803 Y126.23 E-.21016
G1 X125.614 Y124.795 E-.54984
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.684 Y117.941 Z11 F42000
G1 Z10.6
G1 E.8 F1800
G1 F4296
M204 S6000
G1 X126.848 Y126.778 E.29567
G1 X125.85 Y126.646 E.03337
G1 X125.756 Y127.362 E.02395
G1 X125.542 Y127.362 E.0071
G1 X124.261 Y117.636 E.32542
G3 X125.62 Y117.455 I18.658 J134.815 E.04547
G1 X125.676 Y117.881 E.01425
; WIPE_START
G1 F8843.478
G1 X125.937 Y119.864 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.188 Y127.086 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4296
M204 S5000
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
G1 X130.961 Y126.909 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4296
M204 S6000
G1 X129.7 Y117.332 E.32041
G1 X130.252 Y117.257 E.01847
G1 X131.533 Y126.984 E.32545
G1 X131.021 Y126.917 E.01713
; WIPE_START
G1 F8843.478
G1 X130.748 Y124.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.231 Y126.96 Z11 F42000
G1 Z10.6
G1 E.8 F1800
G1 F4296
M204 S6000
G1 X128.231 Y126.746 E.0071
G1 X130.49 Y126.448 E.07559
G1 X129.243 Y116.98 E.3168
G2 X130.603 Y116.801 I-117.817 J-904.122 E.04547
G1 X131.917 Y126.783 E.33396
G3 X131.979 Y127.453 I-7.636 J1.043 E.02234
G1 X128.29 Y126.968 E.12341
; WIPE_START
G1 F8843.478
G1 X128.231 Y126.746 E-.08734
G1 X129.986 Y126.515 E-.67266
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y129.41 Z11 F42000
G1 Z10.6
G1 E.8 F1800
G1 F4296
M204 S6000
G1 X125.247 Y138.26 E.29609
G1 X124.696 Y138.187 E.01846
G1 X125.894 Y129.084 E.30457
G1 X126.446 Y129.157 E.01847
G1 X126.42 Y129.351 E.0065
; WIPE_START
G1 F8843.478
G1 X126.159 Y131.334 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.101 Y129.501 Z11 F42000
G1 Z10.6
G1 E.8 F1800
G1 F4296
M204 S6000
G1 X130.49 Y129.552 E.01301
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.66 Y130.65 E.26092
G1 X126.867 Y129.075 E.05269
G1 X130.042 Y129.493 E.10622
M204 S250
G1 X130.05 Y129.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4296
M204 S5000
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X127.048 Y130.701 E.22964
G1 X127.205 Y129.515 E.03676
G1 X129.991 Y129.882 E.08634
M204 S10000
G1 X130.876 Y129.74 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4296
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
G1 X125.543 Y128.627 Z11 F42000
G1 Z10.6
G1 E.8 F1800
G1 F4296
M204 S6000
G1 X131.884 Y129.462 E.21216
G1 X130.58 Y139.373 E.33158
G1 X124.239 Y138.538 E.21215
G1 X125.535 Y128.687 E.32959
; WIPE_START
G1 F8843.478
G1 X127.521 Y128.929 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.528 Y121.362 Z11 F42000
G1 X126.073 Y117.889 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4296
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
G1 F4296
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
G1 X125.668 Y131.707 Z11 F42000
G1 X125.206 Y127.95 Z11
G1 Z10.6
G1 E.8 F1800
G1 F4296
M204 S5000
G1 X125.188 Y127.678 E.00837
G1 X123.85 Y117.517 E.3149
G3 X124.021 Y117.273 I.201 J-.041 E.01025
G3 X130.793 Y116.389 I108.026 J801.203 E.20986
G3 X130.969 Y116.58 I-.033 J.206 E.0086
G1 X132.306 Y126.736 E.31476
G3 X132.306 Y129.264 I-10.794 J1.264 E.07786
G1 X130.732 Y141.217 E.37045
G3 X130.523 Y141.389 I-.192 J-.022 E.00919
G1 X123.784 Y140.502 E.20887
G3 X123.613 Y140.292 I.02 J-.191 E.00923
G1 X125.188 Y128.322 E.37097
G2 X125.2 Y128.009 I-4.385 J-.322 E.00962
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.188 Y127.678 E-.12604
G1 X124.97 Y126.024 E-.63396
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X126.062 Y126.058 F42000
G1 Z10.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192579
G1 F4296
M204 S6000
G1 X125.02 Y118.15 E.09728
; WIPE_START
G1 F15000
G1 X125.281 Y120.133 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.821 Y117.478 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; LINE_WIDTH: 0.533073
G1 F4296
M204 S6000
G3 X127.079 Y117.312 I25.016 J184.068 E.05067
G1 X129.055 Y117.052 E.07961
; WIPE_START
G1 F7344.648
G1 X127.079 Y117.312 E-.75742
G1 X127.072 Y117.313 E-.00258
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.003 Y117.496 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; LINE_WIDTH: 0.19259
G1 F4296
M204 S6000
G1 X131.219 Y126.737 E.11368
M204 S10000
G1 X130.748 Y126.853 F42000
; LINE_WIDTH: 0.429475
G1 F4296
M204 S6000
G1 X130.549 Y126.853 E.00627
; LINE_WIDTH: 0.385135
G1 X130.35 Y126.853 E.00555
; LINE_WIDTH: 0.340794
G1 X130.151 Y126.853 E.00483
; LINE_WIDTH: 0.296454
G1 X129.952 Y126.853 E.00411
; LINE_WIDTH: 0.252114
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
G1 X128.034 Y126.853 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; LINE_WIDTH: 0.507828
G1 F4296
M204 S6000
G1 X127.708 Y126.853 E.01236
; LINE_WIDTH: 0.458948
G1 X127.382 Y126.853 E.01106
; LINE_WIDTH: 0.410069
M73 P83 R2
G1 X127.055 Y126.853 E.00976
; WIPE_START
G1 F9805.298
G1 X127.382 Y126.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.143 Y129.322 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; LINE_WIDTH: 0.19241
G1 F4296
M204 S6000
G1 X124.998 Y138.022 E.10689
; WIPE_START
G1 F15000
G1 X125.259 Y136.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y138.735 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; LINE_WIDTH: 0.480486
G1 F4296
M204 S6000
G1 X124.025 Y140.336 E.05756
M204 S10000
G1 X130.321 Y141.164 F42000
; LINE_WIDTH: 0.480859
G1 F4296
M204 S6000
G1 X130.531 Y139.564 E.0576
; WIPE_START
G1 F8220.329
G1 X130.321 Y141.164 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.98 Y138.678 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; LINE_WIDTH: 0.192577
G1 F4296
M204 S6000
G1 X131.125 Y129.978 E.10701
; WIPE_START
G1 F15000
G1 X130.864 Y131.961 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.887 Y129.265 Z11 F42000
M73 P84 R2
G1 Z10.6
G1 E.8 F1800
; LINE_WIDTH: 0.466963
G1 F4296
M204 S6000
G2 X131.983 Y128.404 I-18.593 J-2.498 E.02993
; LINE_WIDTH: 0.423328
G1 X132.014 Y128 E.01256
; LINE_WIDTH: 0.387819
G1 X132.032 Y127.658 E.00962
; CHANGE_LAYER
; Z_HEIGHT: 10.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10437.85
G1 X132.014 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 54/68
; update layer progress
M73 L54
M991 S0 P53 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z11 I.348 J-1.166 P1  F42000
G1 X126.292 Y126.294 Z11
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4287
M204 S6000
G1 X125.803 Y126.23 E.01635
G1 X124.726 Y118.043 E.27391
G3 X125.278 Y117.97 I14.334 J106.783 E.01847
G1 X126.375 Y126.305 E.27886
G1 X126.352 Y126.302 E.00077
; WIPE_START
G1 F8843.478
G1 X125.803 Y126.23 E-.21015
G1 X125.614 Y124.795 E-.54985
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.684 Y117.941 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
G1 F4287
M204 S6000
G1 X126.848 Y126.778 E.29567
G1 X125.85 Y126.646 E.03337
G1 X125.756 Y127.362 E.02395
G1 X125.542 Y127.362 E.0071
G1 X124.269 Y117.693 E.32352
G3 X125.628 Y117.514 I44.412 J331.648 E.04547
G1 X125.676 Y117.881 E.01229
; WIPE_START
G1 F8843.478
G1 X125.937 Y119.864 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.188 Y127.086 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4287
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
G1 X130.961 Y126.909 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4287
M204 S6000
G1 X129.708 Y117.389 E.31851
G1 X130.26 Y117.317 E.01847
G1 X131.533 Y126.984 E.32345
G1 X131.021 Y126.917 E.01713
; WIPE_START
G1 F8843.478
G1 X130.748 Y124.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.231 Y126.96 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
G1 F4287
M204 S6000
G1 X128.231 Y126.746 E.0071
G1 X130.49 Y126.448 E.07559
G1 X129.251 Y117.038 E.31483
G3 X130.61 Y116.861 I24.785 J185.11 E.04547
G1 X131.917 Y126.783 E.33196
G3 X131.979 Y127.453 I-7.645 J1.044 E.02233
G1 X128.29 Y126.968 E.12341
; WIPE_START
G1 F8843.478
G1 X128.231 Y126.746 E-.08734
G1 X129.986 Y126.515 E-.67266
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y129.41 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
G1 F4287
M204 S6000
G1 X125.247 Y138.26 E.29609
G1 X124.696 Y138.187 E.01846
G1 X125.894 Y129.084 E.30457
G1 X126.446 Y129.157 E.01847
G1 X126.42 Y129.351 E.0065
; WIPE_START
G1 F8843.478
G1 X126.159 Y131.334 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.101 Y129.501 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
G1 F4287
M204 S6000
G1 X130.49 Y129.552 E.01301
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.683 Y130.472 E.26687
G1 X126.867 Y129.075 E.04674
G1 X130.042 Y129.493 E.10622
M204 S250
G1 X130.05 Y129.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4287
M204 S5000
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X127.072 Y130.523 E.23515
G1 X127.205 Y129.515 E.03125
G1 X129.991 Y129.882 E.08634
M204 S10000
G1 X130.876 Y129.74 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4287
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
G1 X125.543 Y128.627 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
G1 F4287
M204 S6000
G1 X131.884 Y129.462 E.21216
G1 X130.58 Y139.373 E.33158
G1 X124.239 Y138.538 E.21215
G1 X125.535 Y128.687 E.32959
; WIPE_START
G1 F8843.478
G1 X127.521 Y128.929 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.528 Y121.362 Z11.2 F42000
G1 X126.073 Y117.889 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4287
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
G1 F4287
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
G1 X125.667 Y131.707 Z11.2 F42000
G1 X125.206 Y127.956 Z11.2
G1 Z10.8
G1 E.8 F1800
G1 F4287
M204 S5000
G1 X125.188 Y127.68 E.00849
G1 X123.857 Y117.568 E.3134
G3 X124.031 Y117.333 I.196 J-.037 E.01009
G3 X130.792 Y116.447 I130.061 J966.626 E.20954
G1 X130.822 Y116.452 E.00093
G1 X130.924 Y116.512 E.00363
G3 X130.976 Y116.63 I-.193 J.154 E.00402
G1 X132.306 Y126.736 E.3132
G3 X132.306 Y129.264 I-10.793 J1.264 E.07785
G1 X130.732 Y141.217 E.37046
G3 X130.523 Y141.389 I-.192 J-.022 E.00918
G1 X123.784 Y140.502 E.20886
G3 X123.612 Y140.292 I.02 J-.192 E.00923
G1 X125.188 Y128.322 E.37098
G2 X125.204 Y128.016 I-3.322 J-.323 E.00943
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.188 Y127.68 E-.12769
G1 X124.971 Y126.03 E-.63231
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X126.062 Y126.058 F42000
G1 Z10.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192586
G1 F4287
M204 S6000
G1 X125.028 Y118.208 E.09656
; WIPE_START
G1 F15000
G1 X125.289 Y120.191 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.825 Y117.507 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
; LINE_WIDTH: 0.472047
G1 F4287
M204 S6000
G2 X129.059 Y117.082 I-136.202 J-1048.726 E.11406
; WIPE_START
G1 F8389.137
G1 X127.076 Y117.343 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.01 Y117.555 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
; LINE_WIDTH: 0.192578
G1 F4287
M204 S6000
G1 X131.219 Y126.737 E.11295
M204 S10000
G1 X130.748 Y126.853 F42000
; LINE_WIDTH: 0.429478
G1 F4287
M204 S6000
G1 X130.549 Y126.853 E.00627
; LINE_WIDTH: 0.385138
G1 X130.35 Y126.853 E.00555
; LINE_WIDTH: 0.340797
G1 X130.151 Y126.853 E.00483
; LINE_WIDTH: 0.296456
G1 X129.952 Y126.853 E.00411
; LINE_WIDTH: 0.252116
G1 X129.753 Y126.853 E.00339
; LINE_WIDTH: 0.207775
G1 X129.554 Y126.853 E.00267
; LINE_WIDTH: 0.163434
G1 X129.355 Y126.853 E.00195
; LINE_WIDTH: 0.119094
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
; LINE_WIDTH: 0.507818
G1 F4287
M204 S6000
G1 X127.708 Y126.853 E.01236
; LINE_WIDTH: 0.45895
G1 X127.382 Y126.853 E.01106
; LINE_WIDTH: 0.410083
G1 X127.055 Y126.853 E.00976
; WIPE_START
G1 F9804.926
G1 X127.382 Y126.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.143 Y129.322 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
; LINE_WIDTH: 0.192419
G1 F4287
M204 S6000
G1 X124.998 Y138.022 E.10689
; WIPE_START
G1 F15000
G1 X125.259 Y136.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y138.735 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
; LINE_WIDTH: 0.480475
G1 F4287
M204 S6000
G1 X124.025 Y140.336 E.05756
M204 S10000
G1 X130.321 Y141.164 F42000
; LINE_WIDTH: 0.480843
G1 F4287
M204 S6000
G1 X130.531 Y139.564 E.05759
; WIPE_START
G1 F8220.629
G1 X130.321 Y141.164 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.98 Y138.678 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
; LINE_WIDTH: 0.192587
G1 F4287
M204 S6000
G1 X131.125 Y129.978 E.10702
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
G1 F4287
M204 S6000
G2 X131.983 Y128.404 I-18.593 J-2.498 E.02993
; LINE_WIDTH: 0.423328
G1 X132.014 Y128 E.01256
; LINE_WIDTH: 0.387819
G1 X132.032 Y127.658 E.00962
; CHANGE_LAYER
; Z_HEIGHT: 11
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10437.85
G1 X132.014 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 55/68
; update layer progress
M73 L55
M991 S0 P54 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
M73 P85 R2
G3 Z11.2 I.348 J-1.166 P1  F42000
G1 X126.292 Y126.294 Z11.2
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4280
M204 S6000
G1 X125.803 Y126.23 E.01635
G1 X124.731 Y118.087 E.27243
G1 X125.283 Y118.015 E.01847
G1 X126.375 Y126.305 E.27737
G1 X126.352 Y126.302 E.00077
; WIPE_START
G1 F8843.478
G1 X125.803 Y126.23 E-.21016
G1 X125.614 Y124.795 E-.54984
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.684 Y117.941 Z11.4 F42000
G1 Z11
G1 E.8 F1800
G1 F4280
M204 S6000
G1 X126.848 Y126.778 E.29567
G1 X125.85 Y126.646 E.03337
G1 X125.756 Y127.362 E.02395
G1 X125.542 Y127.362 E.0071
G1 X124.275 Y117.737 E.32205
G1 X125.634 Y117.558 E.04547
G1 X125.676 Y117.881 E.01081
; WIPE_START
G1 F8843.478
G1 X125.937 Y119.864 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.188 Y127.086 Z11.4 F42000
G1 Z11
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4280
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
G1 X130.961 Y126.909 Z11.4 F42000
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4280
M204 S6000
G1 X129.713 Y117.432 E.31708
G1 X130.265 Y117.359 E.01847
G1 X131.533 Y126.984 E.32203
G1 X131.021 Y126.917 E.01713
; WIPE_START
G1 F8843.478
G1 X130.748 Y124.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.231 Y126.96 Z11.4 F42000
G1 Z11
G1 E.8 F1800
G1 F4280
M204 S6000
G1 X128.231 Y126.746 E.0071
G1 X130.49 Y126.448 E.07559
G1 X129.257 Y117.081 E.3134
G1 X130.616 Y116.902 E.04547
G1 X131.917 Y126.783 E.33058
G3 X131.979 Y127.453 I-7.642 J1.044 E.02234
G1 X128.29 Y126.968 E.12341
; WIPE_START
G1 F8843.478
G1 X128.231 Y126.746 E-.08734
G1 X129.986 Y126.515 E-.67266
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y129.41 Z11.4 F42000
G1 Z11
G1 E.8 F1800
G1 F4280
M204 S6000
G1 X125.247 Y138.26 E.29609
G1 X124.696 Y138.187 E.01846
G1 X125.894 Y129.084 E.30457
G1 X126.446 Y129.157 E.01847
G1 X126.42 Y129.351 E.0065
; WIPE_START
G1 F8843.478
G1 X126.159 Y131.334 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.101 Y129.501 Z11.4 F42000
G1 Z11
G1 E.8 F1800
G1 F4280
M204 S6000
G1 X130.49 Y129.552 E.01301
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.707 Y130.294 E.27282
G1 X126.867 Y129.075 E.04079
G1 X130.042 Y129.493 E.10622
M204 S250
G1 X130.05 Y129.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4280
M204 S5000
G1 X128.918 Y138.485 E.26641
G1 X126.073 Y138.111 E.08819
G1 X127.095 Y130.345 E.24066
G1 X127.205 Y129.515 E.02574
G1 X129.991 Y129.882 E.08634
M204 S10000
G1 X130.876 Y129.74 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4280
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
G1 X125.543 Y128.627 Z11.4 F42000
G1 Z11
G1 E.8 F1800
G1 F4280
M204 S6000
G1 X131.884 Y129.462 E.21216
G1 X130.58 Y139.373 E.33158
G1 X124.239 Y138.538 E.21215
G1 X125.535 Y128.687 E.32959
; WIPE_START
G1 F8843.478
G1 X127.521 Y128.929 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.528 Y121.362 Z11.4 F42000
G1 X126.073 Y117.889 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4280
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
G1 F4280
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
G1 X125.667 Y131.707 Z11.4 F42000
G1 X125.207 Y127.963 Z11.4
G1 Z11
G1 E.8 F1800
G1 F4280
M204 S5000
G1 X125.188 Y127.678 E.00877
G1 X123.861 Y117.601 E.31231
G3 X124.033 Y117.373 I.2 J-.028 E.00974
G1 X130.755 Y116.489 E.20832
G3 X130.835 Y116.493 I.029 J.212 E.00248
G3 X130.98 Y116.664 I-.053 J.191 E.00732
G1 X132.306 Y126.736 E.31216
G3 X132.306 Y129.264 I-10.794 J1.264 E.07786
G1 X130.732 Y141.217 E.37046
G3 X130.523 Y141.389 I-.193 J-.022 E.00919
G1 X123.784 Y140.502 E.20886
G3 X123.612 Y140.292 I.02 J-.191 E.00923
G1 X125.188 Y128.321 E.371
G2 X125.2 Y128.022 I-4.171 J-.321 E.00921
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.188 Y127.678 E-.13087
G1 X124.972 Y126.036 E-.62913
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X126.062 Y126.058 F42000
G1 Z11
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192595
G1 F4280
M204 S6000
G1 X125.034 Y118.253 E.09602
; WIPE_START
G1 F15000
G1 X125.295 Y120.236 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.828 Y117.529 Z11.4 F42000
G1 Z11
G1 E.8 F1800
; LINE_WIDTH: 0.428665
G1 F4280
M204 S6000
G1 X129.062 Y117.104 E.10253
; WIPE_START
G1 F9332.593
G1 X127.079 Y117.365 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.016 Y117.597 Z11.4 F42000
G1 Z11
G1 E.8 F1800
; LINE_WIDTH: 0.192595
G1 F4280
M204 S6000
G1 X131.219 Y126.737 E.11244
M204 S10000
G1 X130.748 Y126.853 F42000
; LINE_WIDTH: 0.429479
G1 F4280
M204 S6000
G1 X130.549 Y126.853 E.00627
; LINE_WIDTH: 0.385138
G1 X130.35 Y126.853 E.00555
; LINE_WIDTH: 0.340798
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
G1 X128.034 Y126.853 Z11.4 F42000
G1 Z11
G1 E.8 F1800
; LINE_WIDTH: 0.507814
G1 F4280
M204 S6000
G1 X127.708 Y126.853 E.01236
; LINE_WIDTH: 0.458941
G1 X127.382 Y126.853 E.01106
; LINE_WIDTH: 0.410067
G1 X127.055 Y126.853 E.00976
; WIPE_START
G1 F9805.352
G1 X127.382 Y126.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.143 Y129.322 Z11.4 F42000
G1 Z11
G1 E.8 F1800
; LINE_WIDTH: 0.192411
G1 F4280
M204 S6000
G1 X124.998 Y138.022 E.10689
; WIPE_START
G1 F15000
G1 X125.259 Y136.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y138.735 Z11.4 F42000
G1 Z11
G1 E.8 F1800
; LINE_WIDTH: 0.480482
G1 F4280
M204 S6000
G1 X124.025 Y140.336 E.05756
M204 S10000
G1 X130.321 Y141.164 F42000
; LINE_WIDTH: 0.480849
G1 F4280
M204 S6000
G1 X130.531 Y139.564 E.05759
; WIPE_START
G1 F8220.518
G1 X130.321 Y141.164 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.98 Y138.678 Z11.4 F42000
G1 Z11
G1 E.8 F1800
; LINE_WIDTH: 0.192587
G1 F4280
M204 S6000
G1 X131.125 Y129.978 E.10702
; WIPE_START
G1 F15000
G1 X130.864 Y131.961 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.887 Y129.265 Z11.4 F42000
G1 Z11
G1 E.8 F1800
; LINE_WIDTH: 0.466963
G1 F4280
M204 S6000
G2 X131.983 Y128.404 I-18.593 J-2.498 E.02993
; LINE_WIDTH: 0.423328
G1 X132.014 Y128 E.01256
; LINE_WIDTH: 0.38782
G1 X132.032 Y127.658 E.00962
; CHANGE_LAYER
; Z_HEIGHT: 11.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10437.812
G1 X132.014 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 56/68
; update layer progress
M73 L56
M991 S0 P55 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z11.4 I.348 J-1.166 P1  F42000
G1 X126.292 Y126.294 Z11.4
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4321
M204 S6000
G1 X125.803 Y126.23 E.01635
G1 X124.733 Y118.103 E.27191
M73 P86 R2
G1 X125.285 Y118.03 E.01847
G1 X126.375 Y126.305 E.27686
G1 X126.352 Y126.302 E.00077
; WIPE_START
G1 F8843.478
G1 X125.803 Y126.23 E-.21015
G1 X125.614 Y124.795 E-.54985
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.684 Y117.941 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
G1 F4321
M204 S6000
G1 X126.848 Y126.778 E.29567
G1 X125.85 Y126.646 E.03337
G1 X125.756 Y127.362 E.02395
G1 X125.542 Y127.362 E.0071
G1 X124.277 Y117.752 E.32153
G1 X125.636 Y117.573 E.04547
G1 X125.676 Y117.881 E.0103
; WIPE_START
G1 F8843.478
G1 X125.937 Y119.864 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.188 Y127.086 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4321
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
G1 X130.961 Y126.909 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4321
M204 S6000
G1 X129.715 Y117.447 E.31658
G1 X130.267 Y117.374 E.01847
G1 X131.533 Y126.984 E.32153
G1 X131.021 Y126.917 E.01713
; WIPE_START
G1 F8843.478
G1 X130.748 Y124.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.231 Y126.96 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
G1 F4321
M204 S6000
G1 X128.231 Y126.746 E.0071
G1 X130.49 Y126.448 E.07559
G1 X129.259 Y117.096 E.31289
G1 X130.618 Y116.917 E.04547
G1 X131.917 Y126.783 E.33008
G3 X131.979 Y127.453 I-7.642 J1.044 E.02234
G1 X128.29 Y126.968 E.12341
; WIPE_START
G1 F8843.478
G1 X128.231 Y126.746 E-.08734
G1 X129.986 Y126.515 E-.67266
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y129.41 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
G1 F4321
M204 S6000
G1 X125.247 Y138.26 E.29609
G1 X124.696 Y138.187 E.01846
G1 X125.894 Y129.084 E.30457
G1 X126.446 Y129.157 E.01847
G1 X126.42 Y129.351 E.0065
; WIPE_START
G1 F8843.478
G1 X126.159 Y131.334 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.101 Y129.501 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
G1 F4321
M204 S6000
G1 X130.49 Y129.552 E.01301
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.73 Y130.116 E.27877
G1 X126.867 Y129.075 E.03484
G1 X130.042 Y129.493 E.10622
M204 S250
G1 X130.05 Y129.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4321
M204 S5000
G1 X128.918 Y138.485 E.26641
G1 X126.073 Y138.111 E.08819
G1 X127.119 Y130.168 E.24618
G1 X127.205 Y129.515 E.02023
G1 X129.991 Y129.882 E.08634
M204 S10000
G1 X130.876 Y129.74 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4321
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
G1 X125.543 Y128.627 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
G1 F4321
M204 S6000
G1 X131.884 Y129.462 E.21216
G1 X130.58 Y139.373 E.33158
G1 X124.239 Y138.538 E.21215
G1 X125.535 Y128.687 E.32959
; WIPE_START
G1 F8843.478
G1 X127.521 Y128.929 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.406 Y136.263 Z11.6 F42000
G1 X124.622 Y138.984 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4321
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
G1 X126.412 Y131.652 Z11.6 F42000
G1 X126.073 Y117.889 Z11.6
G1 Z11.2
G1 E.8 F1800
G1 F4321
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
G1 X126.026 Y125.004 Z11.6 F42000
G1 X125.207 Y127.969 Z11.6
G1 Z11.2
G1 E.8 F1800
G1 F4321
M204 S5000
G1 X125.188 Y127.678 E.00897
G1 X123.864 Y117.619 E.31174
G3 X124.034 Y117.393 I.199 J-.027 E.00965
G1 X130.58 Y116.527 E.20288
G3 X130.846 Y116.514 I.168 J.703 E.00823
G1 X130.887 Y116.531 E.00136
G3 X130.982 Y116.681 I-.101 J.17 E.00565
G1 X132.306 Y126.736 E.31164
G3 X132.306 Y129.264 I-10.794 J1.264 E.07786
G1 X130.732 Y141.217 E.37046
G3 X130.523 Y141.388 I-.193 J-.022 E.0092
G1 X123.784 Y140.502 E.20884
G3 X123.612 Y140.292 I.02 J-.191 E.00923
G1 X125.188 Y128.322 E.37098
G2 X125.2 Y128.028 I-4.381 J-.322 E.00904
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.188 Y127.678 E-.13328
G1 X124.973 Y126.043 E-.62672
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X126.062 Y126.058 F42000
G1 Z11.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192584
G1 F4321
M204 S6000
G1 X125.036 Y118.268 E.09583
; WIPE_START
G1 F15000
G1 X125.297 Y120.251 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.829 Y117.537 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; LINE_WIDTH: 0.413376
G1 F4321
M204 S6000
G1 X129.063 Y117.111 E.09847
; WIPE_START
G1 F9717.769
G1 X127.08 Y117.372 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.018 Y117.612 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; LINE_WIDTH: 0.192584
G1 F4321
M204 S6000
G1 X131.219 Y126.737 E.11225
M204 S10000
G1 X130.748 Y126.853 F42000
; LINE_WIDTH: 0.429495
G1 F4321
M204 S6000
G1 X130.549 Y126.853 E.00627
; LINE_WIDTH: 0.385152
G1 X130.35 Y126.853 E.00555
; LINE_WIDTH: 0.340809
G1 X130.151 Y126.853 E.00483
; LINE_WIDTH: 0.296466
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
; LINE_WIDTH: 0.507828
G1 F4321
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
G1 X125.928 Y127.558 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; LINE_WIDTH: 0.491173
G1 F4321
M204 S6000
G1 X125.787 Y127.682 E.00687
; LINE_WIDTH: 0.522069
G1 X125.645 Y127.806 E.00734
G1 X125.636 Y128.01 E.00796
; LINE_WIDTH: 0.495269
G1 X125.618 Y128.216 E.00761
; LINE_WIDTH: 0.473633
G1 X125.605 Y128.227 E.0006
; LINE_WIDTH: 0.448381
G1 X125.592 Y128.238 E.00057
; LINE_WIDTH: 0.42121
G1 X125.381 Y128.408 E.00835
; WIPE_START
G1 F9516.517
G1 X125.592 Y128.238 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.143 Y129.322 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; LINE_WIDTH: 0.192392
G1 F4321
M204 S6000
G1 X124.998 Y138.022 E.10688
; WIPE_START
G1 F15000
G1 X125.259 Y136.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y138.735 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; LINE_WIDTH: 0.480464
G1 F4321
M204 S6000
G1 X124.025 Y140.336 E.05756
M204 S10000
G1 X130.321 Y141.164 F42000
; LINE_WIDTH: 0.480836
G1 F4321
M204 S6000
G1 X130.531 Y139.564 E.05759
; WIPE_START
G1 F8220.765
G1 X130.321 Y141.164 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.98 Y138.678 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; LINE_WIDTH: 0.192587
G1 F4321
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
; LINE_WIDTH: 0.466963
G1 F4321
M204 S6000
G2 X131.983 Y128.404 I-18.593 J-2.498 E.02993
; LINE_WIDTH: 0.423328
G1 X132.014 Y128 E.01256
; LINE_WIDTH: 0.387819
G1 X132.032 Y127.658 E.00962
; CHANGE_LAYER
; Z_HEIGHT: 11.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10437.85
G1 X132.014 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 57/68
; update layer progress
M73 L57
M991 S0 P56 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z11.6 I.189 J-1.202 P1  F42000
G1 X126.188 Y127.086 Z11.6
G1 Z11.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5564
M204 S5000
M73 P87 R2
G1 X131.661 Y127.807 E.16961
G1 X131.501 Y129.016 E.03749
G1 X126.029 Y128.296 E.16961
G1 X126.086 Y127.859 E.01354
G1 X126.18 Y127.146 E.0221
M204 S10000
G1 X125.803 Y126.23 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5564
M204 S6000
G1 X124.734 Y118.11 E.27166
G1 X126.106 Y117.93 E.04589
G1 X128.897 Y117.562 E.09338
G1 X130.268 Y117.382 E.04589
G1 X131.533 Y126.984 E.32128
G1 X127.369 Y126.436 E.1393
G1 X127.223 Y126.417 E.00488
G1 X125.863 Y126.237 E.04552
; WIPE_START
G1 F8843.478
G1 X125.588 Y124.256 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.542 Y127.362 Z11.8 F42000
G1 Z11.4
G1 E.8 F1800
G1 F5564
M204 S6000
G1 X124.278 Y117.76 E.32128
G1 X130.619 Y116.925 E.21216
G1 X131.917 Y126.783 E.32983
G3 X131.979 Y127.453 I-7.636 J1.043 E.02234
G1 X125.85 Y126.646 E.20504
G1 X125.756 Y127.362 E.02395
G1 X125.602 Y127.362 E.00511
; WIPE_START
G1 F8843.478
G1 X125.329 Y125.381 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.412 Y129.41 Z11.8 F42000
G1 Z11.4
G1 E.8 F1800
G1 F5564
M204 S6000
G1 X125.247 Y138.26 E.29609
G1 X124.696 Y138.187 E.01846
G1 X125.894 Y129.084 E.30458
G1 X126.446 Y129.157 E.01847
G1 X126.42 Y129.351 E.0065
; WIPE_START
G1 F8843.478
G1 X126.159 Y131.334 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.101 Y129.501 Z11.8 F42000
G1 Z11.4
G1 E.8 F1800
G1 F5564
M204 S6000
G1 X130.49 Y129.552 E.01301
G1 X129.256 Y138.925 E.31361
G1 X125.633 Y138.448 E.12121
G1 X126.753 Y129.939 E.28472
G1 X126.867 Y129.075 E.0289
G1 X130.042 Y129.493 E.10622
M204 S250
G1 X130.05 Y129.889 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5564
M204 S5000
G1 X128.918 Y138.485 E.26641
G1 X126.073 Y138.111 E.08819
G1 X127.142 Y129.99 E.25169
G1 X127.205 Y129.515 E.01472
G1 X129.991 Y129.882 E.08634
M204 S10000
G1 X130.876 Y129.74 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5564
M204 S6000
G1 X131.428 Y129.813 E.01847
G1 X130.229 Y138.916 E.30457
G1 X129.677 Y138.843 E.01847
G1 X130.868 Y129.8 E.30258
; WIPE_START
G1 F8843.478
G1 X131.428 Y129.813 E-.21278
G1 X131.24 Y131.24 E-.54722
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.543 Y128.627 Z11.8 F42000
G1 Z11.4
G1 E.8 F1800
G1 F5564
M204 S6000
G1 X131.884 Y129.462 E.21216
G1 X130.58 Y139.373 E.33158
G1 X124.239 Y138.538 E.21215
G1 X125.535 Y128.687 E.32959
; WIPE_START
G1 F8843.478
G1 X127.521 Y128.929 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.406 Y136.263 Z11.8 F42000
G1 X124.622 Y138.984 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5564
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
G1 X125.667 Y131.707 Z11.8 F42000
G1 X125.207 Y127.976 Z11.8
G1 Z11.4
G1 E.8 F1800
G1 F5564
M204 S5000
G1 X125.188 Y127.68 E.0091
G1 X123.864 Y117.62 E.31177
G3 X124.024 Y117.398 I.193 J-.03 E.00933
G1 X130.76 Y116.511 E.20878
G3 X130.833 Y116.513 I.029 J.211 E.00224
G3 X130.982 Y116.683 I-.045 J.191 E.00742
G1 X132.306 Y126.736 E.31156
G3 X132.306 Y129.264 I-10.794 J1.264 E.07786
G1 X130.732 Y141.217 E.37046
G3 X130.523 Y141.389 I-.193 J-.022 E.00919
G1 X123.784 Y140.502 E.20886
G3 X123.612 Y140.293 I.02 J-.191 E.00922
G1 X125.188 Y128.322 E.37099
G2 X125.203 Y128.035 I-3.464 J-.323 E.00883
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.188 Y127.68 E-.13511
G1 X124.974 Y126.05 E-.62489
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X125.928 Y127.558 F42000
G1 Z11.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.529025
G1 F5564
M204 S6000
G1 X125.645 Y127.806 E.01489
G1 X125.636 Y128.013 E.00821
; LINE_WIDTH: 0.495118
G1 X125.618 Y128.216 E.00749
; LINE_WIDTH: 0.473617
G1 X125.605 Y128.227 E.0006
; LINE_WIDTH: 0.448335
G1 X125.592 Y128.238 E.00057
; LINE_WIDTH: 0.421175
G1 X125.381 Y128.408 E.00835
; WIPE_START
G1 F9517.41
G1 X125.592 Y128.238 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.143 Y129.322 Z11.8 F42000
G1 Z11.4
G1 E.8 F1800
; LINE_WIDTH: 0.192393
G1 F5564
M204 S6000
G1 X124.998 Y138.022 E.10688
; WIPE_START
G1 F15000
G1 X125.259 Y136.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.236 Y138.735 Z11.8 F42000
G1 Z11.4
G1 E.8 F1800
; LINE_WIDTH: 0.480449
G1 F5564
M204 S6000
G1 X124.025 Y140.336 E.05756
M204 S10000
G1 X130.321 Y141.164 F42000
; LINE_WIDTH: 0.48084
G1 F5564
M204 S6000
G1 X130.531 Y139.564 E.05759
; WIPE_START
G1 F8220.687
G1 X130.321 Y141.164 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.98 Y138.678 Z11.8 F42000
G1 Z11.4
G1 E.8 F1800
; LINE_WIDTH: 0.192587
G1 F5564
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
; LINE_WIDTH: 0.466962
G1 F5564
M204 S6000
G2 X131.983 Y128.404 I-18.596 J-2.498 E.02993
; LINE_WIDTH: 0.423328
G1 X132.014 Y128 E.01256
; LINE_WIDTH: 0.387818
G1 X132.032 Y127.658 E.00962
; WIPE_START
G1 F10437.894
G1 X132.014 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.194 Y126.511 Z11.8 F42000
G1 Z11.4
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.43253
M106 S255
G1 F3000
M204 S6000
G1 X131.101 Y126.26 E.06108
G1 X131.05 Y125.874 E.01237
G1 X128.351 Y126.229 E.08643
G1 X126.859 Y126.032 E.04779
G1 X130.999 Y125.487 E.13259
G1 X130.949 Y125.101 E.01237
G1 X126.075 Y125.743 E.15605
G1 X126.024 Y125.356 E.01237
G1 X130.898 Y124.715 E.15605
G1 X130.847 Y124.328 E.01237
G1 X125.974 Y124.97 E.15605
G1 X125.923 Y124.584 E.01237
G1 X130.796 Y123.942 E.15605
G1 X130.745 Y123.556 E.01237
G1 X125.872 Y124.198 E.15605
G1 X125.821 Y123.811 E.01237
G1 X130.694 Y123.17 E.15605
G1 X130.643 Y122.783 E.01237
G1 X125.77 Y123.425 E.15605
G1 X125.719 Y123.039 E.01237
G1 X130.593 Y122.397 E.15605
G1 X130.542 Y122.011 E.01237
G1 X125.668 Y122.652 E.15605
G1 X125.618 Y122.266 E.01237
G1 X130.491 Y121.625 E.15605
G1 X130.44 Y121.238 E.01237
G1 X125.567 Y121.88 E.15605
G1 X125.516 Y121.494 E.01237
G1 X130.389 Y120.852 E.15605
G1 X130.338 Y120.466 E.01237
G1 X125.465 Y121.107 E.15605
G1 X125.414 Y120.721 E.01237
G1 X130.287 Y120.079 E.15605
G1 X130.237 Y119.693 E.01237
G1 X125.363 Y120.335 E.15605
G1 X125.313 Y119.948 E.01237
G1 X130.186 Y119.307 E.15605
G1 X130.135 Y118.921 E.01237
G1 X125.262 Y119.562 E.15605
G1 X125.211 Y119.176 E.01237
G1 X130.084 Y118.534 E.15605
G1 X130.033 Y118.148 E.01237
G1 X125.16 Y118.79 E.15605
G1 X125.109 Y118.403 E.01237
G1 X130.151 Y117.74 E.16144
M106 S201.45
; CHANGE_LAYER
; Z_HEIGHT: 11.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F3000
G1 X128.168 Y118.001 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 58/68
; update layer progress
M73 L58
M991 S0 P57 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z11.8 I-1.189 J-.259 P1  F42000
G1 X126.188 Y127.086 Z11.8
G1 Z11.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4841
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
G1 X130.05 Y129.889 Z12 F42000
G1 Z11.6
G1 E.8 F1800
G1 F4841
M204 S5000
G1 X128.918 Y138.485 E.2664
G1 X126.073 Y138.111 E.08819
G1 X127.165 Y129.812 E.2572
G1 X127.205 Y129.515 E.00921
G1 X129.991 Y129.882 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.743 Y131.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.803 Y126.23 Z12 F42000
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4841
M204 S6000
G1 X124.734 Y118.11 E.27166
G1 X130.268 Y117.382 E.18516
M73 P88 R2
G1 X131.533 Y126.984 E.32127
G1 X125.863 Y126.237 E.1897
; WIPE_START
G1 F8843.478
G1 X125.588 Y124.257 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.526 Y127.239 Z12 F42000
G1 Z11.6
G1 E.8 F1800
G1 F4841
M204 S6000
G1 X124.278 Y117.76 E.31716
G1 X130.619 Y116.925 E.21216
G1 X131.916 Y126.782 E.32979
G3 X131.979 Y127.453 I-8.697 J1.143 E.02238
G1 X125.85 Y126.646 E.20504
G1 X125.768 Y127.271 E.0209
G1 X125.585 Y127.247 E.00612
; WIPE_START
G1 F8843.478
G1 X125.312 Y125.266 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.928 Y132.889 Z12 F42000
G1 X124.622 Y138.984 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4841
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
G1 X125.667 Y131.707 Z12 F42000
G1 X125.208 Y127.982 Z12
G1 Z11.6
G1 E.8 F1800
G1 F4841
M204 S5000
G1 X125.188 Y127.68 E.00931
G1 X123.864 Y117.62 E.31177
G3 X124.023 Y117.398 I.193 J-.03 E.00932
G1 X130.76 Y116.511 E.20878
G3 X130.832 Y116.513 I.029 J.213 E.00224
G3 X130.982 Y116.683 I-.042 J.188 E.00745
G1 X132.306 Y126.736 E.31154
G3 X132.306 Y129.264 I-10.793 J1.264 E.07787
G1 X130.732 Y141.217 E.37045
G3 X130.523 Y141.389 I-.193 J-.022 E.0092
G1 X123.784 Y140.502 E.20886
G3 X123.612 Y140.293 I.02 J-.191 E.00921
G1 X125.188 Y128.322 E.37101
G2 X125.203 Y128.042 I-3.368 J-.322 E.00862
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.188 Y127.68 E-.13759
G1 X124.974 Y126.056 E-.62241
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X129.325 Y124.777 F42000
G1 Z11.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F4841
M204 S6000
G1 X128.632 Y119.514 E.1631
G1 X126.867 Y119.746 E.05473
G1 X127.497 Y124.536 E.14843
G1 X129.266 Y124.769 E.05481
M204 S10000
G1 X128.887 Y124.339 F42000
G1 F4841
M204 S6000
G1 X128.308 Y119.937 E.13642
G1 X127.29 Y120.071 E.03155
G1 X127.833 Y124.2 E.12796
G1 X128.828 Y124.331 E.03082
M204 S10000
G1 X128.48 Y123.931 F42000
; LINE_WIDTH: 0.36784
G1 F4841
M204 S6000
G1 X128.006 Y120.331 E.09614
G1 X127.683 Y120.373 E.0086
G1 X128.146 Y123.887 E.09384
G1 X128.42 Y123.923 E.00732
M204 S10000
G1 X127.161 Y124.872 F42000
; LINE_WIDTH: 0.41999
G1 F4841
M204 S6000
G1 X129.763 Y125.215 E.08065
G1 X128.957 Y119.091 E.18979
G1 X126.443 Y119.422 E.0779
G1 X127.153 Y124.812 E.16707
M204 S10000
G1 X126.825 Y125.208 F42000
G1 F4841
M204 S6000
G1 X130.201 Y125.653 E.10464
G1 X129.282 Y118.668 E.21647
G1 X126.02 Y119.097 E.10107
G1 X126.817 Y125.149 E.18754
M204 S10000
G1 X126.489 Y125.544 F42000
G1 F4841
M204 S6000
G1 X130.639 Y126.091 E.12863
G1 X129.606 Y118.245 E.24316
G1 X125.597 Y118.773 E.12424
G1 X126.481 Y125.485 E.20802
M204 S10000
G1 X126.153 Y125.88 F42000
G1 F4841
M204 S6000
G1 X131.077 Y126.529 E.15261
G1 X129.931 Y117.821 E.26985
G1 X125.174 Y118.448 E.14741
G1 X126.145 Y125.821 E.22849
; WIPE_START
G1 F9547.299
G1 X125.884 Y123.838 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.804 Y131.225 Z12 F42000
G1 X130.204 Y140.461 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F4841
M204 S2000
G1 X130.686 Y139.978 E.02096
G1 X130.767 Y139.364
G1 X130.285 Y139.847 E.02096
G1 X130.102 Y139.496
G1 X130.848 Y138.75 E.03241
G1 X130.929 Y138.136
G1 X129.631 Y139.434 E.0564
G1 X129.16 Y139.372
G1 X131.01 Y137.522 E.08039
G1 X131.09 Y136.908
G1 X128.688 Y139.31 E.10438
G1 X128.788 Y138.677
G1 X128.217 Y139.248 E.0248
G1 X127.746 Y139.186
G1 X128.317 Y138.615 E.0248
G1 X127.845 Y138.553
G1 X127.275 Y139.124 E.0248
G1 X126.804 Y139.062
G1 X127.374 Y138.491 E.0248
G1 X126.903 Y138.429
G1 X126.332 Y139 E.0248
G1 X125.861 Y138.938
G1 X126.432 Y138.367 E.0248
G1 X125.96 Y138.305
G1 X125.39 Y138.876 E.0248
G1 X124.919 Y138.814
G1 X125.9 Y137.832 E.04266
G1 X125.981 Y137.218
G1 X124.447 Y138.752 E.06665
G1 X124.442 Y138.757
G1 X123.96 Y139.239 E.02094
G1 X124.041 Y138.624
G1 X126.062 Y136.604 E.08782
G1 X126.143 Y135.989
G1 X124.122 Y138.01 E.08782
G1 X124.203 Y137.396
G1 X126.224 Y135.375 E.08782
G1 X126.305 Y134.761
G1 X124.284 Y136.782 E.08782
G1 X124.364 Y136.168
G1 X126.386 Y134.147 E.08782
G1 X126.466 Y133.533
G1 X124.445 Y135.554 E.08783
G1 X124.526 Y134.94
G1 X126.547 Y132.919 E.08783
G1 X126.628 Y132.305
G1 X124.607 Y134.326 E.08783
G1 X124.688 Y133.712
G1 X126.709 Y131.691 E.08783
G1 X126.79 Y131.077
G1 X124.769 Y133.098 E.08783
G1 X124.849 Y132.484
G1 X126.871 Y130.462 E.08783
G1 X126.951 Y129.848
G1 X124.93 Y131.87 E.08783
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.344 Y130.455 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.171 Y136.294 Z12 F42000
G1 Z11.6
G1 E.8 F1800
G1 F4841
M204 S2000
G1 X129.15 Y138.315 E.08784
G1 X129.231 Y137.701
G1 X131.252 Y135.68 E.08784
G1 X131.333 Y135.065
G1 X129.312 Y137.087 E.08784
G1 X129.392 Y136.473
G1 X131.414 Y134.451 E.08784
G1 X131.495 Y133.837
G1 X129.473 Y135.859 E.08784
G1 X129.554 Y135.245
G1 X131.576 Y133.223 E.08784
G1 X131.656 Y132.609
G1 X129.635 Y134.63 E.08784
G1 X129.716 Y134.016
G1 X131.737 Y131.995 E.08784
G1 X131.818 Y131.381
G1 X129.797 Y133.402 E.08784
G1 X129.878 Y132.788
G1 X131.899 Y130.767 E.08784
G1 X131.98 Y130.153
G1 X129.958 Y132.174 E.08784
G1 X130.039 Y131.56
G1 X132.061 Y129.539 E.08784
G1 X132.134 Y128.932
G1 X130.12 Y130.946 E.0875
G1 X130.201 Y130.332
G1 X131.33 Y129.203 E.04905
G1 X130.858 Y129.141
G1 X130.282 Y129.718 E.02506
G1 X129.817 Y129.649
G1 X130.387 Y129.079 E.0248
G1 X129.916 Y129.017
G1 X129.345 Y129.587 E.0248
G1 X128.874 Y129.525
G1 X129.445 Y128.955 E.0248
G1 X128.974 Y128.893
G1 X128.403 Y129.463 E.0248
G1 X127.932 Y129.401
G1 X128.502 Y128.831 E.0248
G1 X128.031 Y128.769
G1 X127.461 Y129.339 E.0248
G1 X127.56 Y128.707
G1 X125.011 Y131.256 E.11076
G1 X125.092 Y130.641
G1 X127.089 Y128.645 E.08677
G1 X126.617 Y128.583
G1 X125.173 Y130.027 E.06278
G1 X125.254 Y129.413
G1 X126.146 Y128.521 E.03879
G1 X125.817 Y128.317
M73 P89 R2
G1 X125.334 Y128.799 E.02096
G1 X125.409 Y128.192
G1 X125.897 Y127.703 E.02124
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.409 Y128.192 E-.26273
G1 X125.334 Y128.799 E-.23257
G1 X125.817 Y128.317 E-.25918
G1 X125.829 Y128.325 E-.00551
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.74 Y128.793 Z12 F42000
G1 Z11.6
G1 E.8 F1800
G1 F4841
M204 S2000
G1 X132.176 Y128.357 E.01895
; WIPE_START
G1 F9547.055
M204 S6000
G1 X131.74 Y128.793 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.377 Y129.813 Z12 F42000
G1 Z11.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.12368
G1 F4841
M204 S6000
G1 X130.273 Y129.938 E.00107
; LINE_WIDTH: 0.0975299
G1 X130.238 Y129.907 E.00021
; WIPE_START
G1 F15000
G1 X130.273 Y129.938 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.171 Y136.375 Z12 F42000
G1 X124.411 Y139.136 Z12
G1 Z11.6
G1 E.8 F1800
; LINE_WIDTH: 0.381257
G1 F4841
M204 S6000
G1 X124.179 Y139.53 E.01262
G1 X124.066 Y139.532 E.0031
; LINE_WIDTH: 0.34831
G1 X124.022 Y139.451 E.00229
; LINE_WIDTH: 0.309944
G1 X123.979 Y139.37 E.002
; LINE_WIDTH: 0.271577
G1 X123.935 Y139.29 E.00171
M204 S10000
G1 X125.58 Y127.452 F42000
; LINE_WIDTH: 0.106707
G1 F4841
M204 S6000
G1 X125.399 Y127.935 E.00268
M204 S10000
G1 X125.938 Y127.54 F42000
; LINE_WIDTH: 0.152202
G1 F4841
M204 S6000
G1 X125.362 Y127.509 E.00513
; CHANGE_LAYER
; Z_HEIGHT: 11.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X125.938 Y127.54 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 59/68
; update layer progress
M73 L59
M991 S0 P58 ;notify layer change
; OBJECT_ID: 394
M204 S250
M204 S10000
G17
G3 Z12 I1.066 J.587 P1  F42000
G1 X126.188 Y127.086 Z12
M204 S10000
G1 Z11.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3407
M204 S5000
G1 X131.661 Y127.807 E.16961
G1 X131.501 Y129.016 E.03749
G1 X126.029 Y128.296 E.16961
G1 X126.078 Y127.92 E.01165
G1 X126.18 Y127.146 E.02399
M204 S10000
G1 X125.803 Y126.23 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3407
M204 S6000
G1 X124.734 Y118.11 E.27165
G1 X130.268 Y117.382 E.18516
G1 X131.533 Y126.984 E.32127
G1 X125.863 Y126.237 E.1897
; WIPE_START
G1 F8843.478
G1 X125.588 Y124.256 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.542 Y127.362 Z12.2 F42000
G1 Z11.8
G1 E.8 F1800
G1 F3407
M204 S6000
G1 X124.278 Y117.76 E.32127
G1 X130.619 Y116.925 E.21216
M73 P89 R1
G1 X131.917 Y126.783 E.32983
G3 X131.979 Y127.453 I-7.636 J1.043 E.02234
G1 X125.85 Y126.646 E.20504
G1 X125.756 Y127.362 E.02395
G1 X125.602 Y127.362 E.00511
; WIPE_START
G1 F8843.478
G1 X125.329 Y125.381 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.385 Y129.132 Z12.2 F42000
G1 Z11.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3407
M204 S5000
G1 X130.012 Y139.562 E.32325
G1 X124.738 Y138.868 E.16347
G1 X124.863 Y137.918 E.02944
G1 X126.111 Y128.438 E.29381
G1 X131.326 Y129.124 E.16162
; WIPE_START
G1 F9547.055
M204 S6000
G1 X131.076 Y131.109 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.238 Y137.012 Z12.2 F42000
G1 X124.622 Y138.984 Z12.2
G1 Z11.8
G1 E.8 F1800
G1 F3407
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
G1 X125.666 Y131.707 Z12.2 F42000
G1 X125.208 Y127.989 Z12.2
G1 Z11.8
G1 E.8 F1800
G1 F3407
M204 S5000
G1 X125.188 Y127.68 E.00951
G1 X123.864 Y117.62 E.31177
G3 X124.023 Y117.398 I.195 J-.029 E.00928
G1 X130.76 Y116.511 E.20879
G3 X130.832 Y116.513 I.029 J.214 E.00224
G3 X130.982 Y116.683 I-.042 J.189 E.00744
G1 X132.306 Y126.736 E.31157
G3 X132.306 Y129.264 I-10.794 J1.264 E.07786
G1 X130.732 Y141.217 E.37046
G3 X130.523 Y141.388 I-.193 J-.022 E.00921
G1 X123.784 Y140.502 E.20885
G3 X123.612 Y140.293 I.022 J-.193 E.00917
G1 X125.188 Y128.322 E.37101
G2 X125.203 Y128.048 I-3.434 J-.323 E.00845
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.188 Y127.68 E-.1399
G1 X124.975 Y126.062 E-.6201
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X125.65 Y127.558 F42000
G1 Z11.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.528008
G1 F3407
M204 S6000
G1 X125.636 Y128.014 E.018
; LINE_WIDTH: 0.488375
G1 X125.592 Y128.436 E.01542
; LINE_WIDTH: 0.505843
G1 X125.603 Y128.543 E.00406
; LINE_WIDTH: 0.555836
G1 X125.614 Y128.65 E.0045
M204 S10000
G1 X125.903 Y128.513 F42000
; LINE_WIDTH: 0.267062
G1 F3407
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
; LINE_WIDTH: 0.580653
G1 X124.313 Y138.534 E.43685
M204 S10000
G1 X124.556 Y138.742 F42000
; LINE_WIDTH: 0.267003
G1 F3407
M204 S6000
G1 X124.522 Y138.712 E.00083
; LINE_WIDTH: 0.315227
G1 X124.487 Y138.682 E.00101
; LINE_WIDTH: 0.363452
G1 X124.452 Y138.653 E.00119
; LINE_WIDTH: 0.411676
G1 X124.417 Y138.623 E.00137
; LINE_WIDTH: 0.4599
G1 X124.382 Y138.594 E.00155
; LINE_WIDTH: 0.508124
G1 X124.348 Y138.564 E.00173
; LINE_WIDTH: 0.556349
G1 X124.313 Y138.534 E.00191
; LINE_WIDTH: 0.555457
G1 X124.274 Y138.635 E.00449
; LINE_WIDTH: 0.505463
G1 X124.236 Y138.735 E.00405
; LINE_WIDTH: 0.480438
G1 X124.025 Y140.336 E.05756
M204 S10000
G1 X130.321 Y141.164 F42000
; LINE_WIDTH: 0.480845
G1 F3407
M204 S6000
G1 X130.531 Y139.564 E.0576
; LINE_WIDTH: 0.505846
G1 X130.52 Y139.457 E.00406
; LINE_WIDTH: 0.555845
G1 X130.509 Y139.35 E.0045
; LINE_WIDTH: 0.58084
G1 X131.81 Y129.466 E.437
; LINE_WIDTH: 0.555849
G1 X131.849 Y129.365 E.0045
; LINE_WIDTH: 0.505854
G1 X131.887 Y129.265 E.00406
; LINE_WIDTH: 0.468362
G2 X131.983 Y128.404 I-25.857 J-3.303 E.03003
; LINE_WIDTH: 0.42333
G1 X132.014 Y128 E.01256
; LINE_WIDTH: 0.387819
G1 X132.032 Y127.658 E.00962
M204 S10000
G1 X131.566 Y129.258 F42000
; LINE_WIDTH: 0.267031
G1 F3407
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
G1 F7006.775
G1 X131.775 Y129.436 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.325 Y124.777 Z12.2 F42000
G1 Z11.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F3407
M204 S6000
G1 X128.632 Y119.514 E.1631
G1 X126.867 Y119.746 E.05473
G1 X127.497 Y124.536 E.14843
G1 X129.266 Y124.769 E.05481
M204 S10000
G1 X128.887 Y124.339 F42000
G1 F3407
M204 S6000
G1 X128.308 Y119.937 E.13642
G1 X127.29 Y120.071 E.03155
G1 X127.833 Y124.2 E.12796
G1 X128.828 Y124.331 E.03082
M204 S10000
G1 X128.48 Y123.931 F42000
; LINE_WIDTH: 0.36785
G1 F3407
M204 S6000
G1 X128.006 Y120.331 E.09615
G1 X127.683 Y120.373 E.0086
G1 X128.146 Y123.887 E.09384
G1 X128.42 Y123.923 E.00732
M204 S10000
G1 X127.161 Y124.872 F42000
; LINE_WIDTH: 0.41999
G1 F3407
M204 S6000
G1 X129.763 Y125.215 E.08065
G1 X128.957 Y119.091 E.18979
G1 X126.443 Y119.422 E.0779
G1 X127.153 Y124.812 E.16707
M204 S10000
G1 X126.825 Y125.208 F42000
G1 F3407
M204 S6000
G1 X130.201 Y125.653 E.10464
G1 X129.282 Y118.668 E.21647
G1 X126.02 Y119.097 E.10107
G1 X126.817 Y125.149 E.18754
M204 S10000
G1 X126.489 Y125.544 F42000
G1 F3407
M204 S6000
G1 X130.639 Y126.091 E.12863
G1 X129.606 Y118.245 E.24316
G1 X125.597 Y118.773 E.12424
G1 X126.481 Y125.485 E.20802
M204 S10000
G1 X126.153 Y125.88 F42000
G1 F3407
M204 S6000
G1 X131.077 Y126.529 E.15261
G1 X129.931 Y117.821 E.26985
G1 X125.174 Y118.448 E.14741
G1 X126.145 Y125.821 E.22849
; CHANGE_LAYER
; Z_HEIGHT: 12
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X125.884 Y123.838 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 60/68
; update layer progress
M73 L60
M991 S0 P59 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z12.2 I-1.212 J.113 P1  F42000
G1 X126.188 Y127.086 Z12.2
G1 Z12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3441
M204 S5000
G1 X131.661 Y127.807 E.16961
G1 X131.501 Y129.016 E.03749
G1 X126.029 Y128.296 E.16961
G1 X126.074 Y127.95 E.01071
G1 X126.18 Y127.146 E.02494
M204 S10000
G1 X125.803 Y126.23 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3441
M204 S6000
G1 X124.734 Y118.11 E.27165
G1 X130.268 Y117.382 E.18516
G1 X131.533 Y126.984 E.32127
G1 X125.863 Y126.237 E.1897
; WIPE_START
G1 F8843.478
G1 X125.588 Y124.257 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.542 Y127.362 Z12.4 F42000
G1 Z12
G1 E.8 F1800
G1 F3441
M204 S6000
G1 X124.278 Y117.76 E.32128
G1 X130.619 Y116.925 E.21216
G1 X131.917 Y126.783 E.32983
G3 X131.979 Y127.453 I-7.636 J1.043 E.02233
G1 X125.85 Y126.646 E.20504
G1 X125.756 Y127.362 E.02395
G1 X125.602 Y127.362 E.00511
; WIPE_START
G1 F8843.478
G1 X125.329 Y125.381 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.385 Y129.132 Z12.4 F42000
G1 Z12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P90 R1
G1 F3441
M204 S5000
G1 X130.012 Y139.562 E.32325
G1 X124.738 Y138.868 E.16347
G1 X125.058 Y136.434 E.07542
G1 X126.111 Y128.438 E.24783
G1 X131.326 Y129.124 E.16163
; WIPE_START
G1 F9547.055
M204 S6000
G1 X131.076 Y131.109 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.238 Y137.012 Z12.4 F42000
G1 X124.622 Y138.984 Z12.4
G1 Z12
G1 E.8 F1800
G1 F3441
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
G1 X125.666 Y131.707 Z12.4 F42000
G1 X125.209 Y127.996 Z12.4
G1 Z12
G1 E.8 F1800
G1 F3441
M204 S5000
G1 X125.188 Y127.678 E.0098
G1 X123.864 Y117.621 E.3117
G3 X124.023 Y117.398 I.195 J-.029 E.00928
G1 X130.759 Y116.511 E.20878
G3 X130.832 Y116.513 I.03 J.215 E.00225
G3 X130.982 Y116.683 I-.045 J.191 E.00743
G1 X132.306 Y126.736 E.31157
G3 X132.306 Y129.264 I-10.793 J1.264 E.07787
G1 X130.732 Y141.217 E.37045
G3 X130.523 Y141.388 I-.191 J-.02 E.00923
G1 X123.784 Y140.502 E.20885
G3 X123.613 Y140.291 I.022 J-.193 E.00923
G1 X125.188 Y128.322 E.37094
G2 X125.2 Y128.05 I-4.377 J-.322 E.00837
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.188 Y127.678 E-.14151
G1 X124.976 Y126.064 E-.61849
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X125.656 Y127.558 F42000
G1 Z12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.526773
G1 F3441
M204 S6000
G1 X125.636 Y128.01 E.01782
; LINE_WIDTH: 0.488495
G1 X125.592 Y128.436 E.01555
; LINE_WIDTH: 0.497496
G1 X125.599 Y128.507 E.00266
; LINE_WIDTH: 0.53083
G1 X125.606 Y128.579 E.00285
; LINE_WIDTH: 0.564163
G1 X125.614 Y128.65 E.00305
M204 S10000
G1 X125.903 Y128.513 F42000
; LINE_WIDTH: 0.26706
G1 F3441
M204 S6000
G1 X125.862 Y128.532 E.00084
; LINE_WIDTH: 0.315331
G1 X125.821 Y128.552 E.00102
; LINE_WIDTH: 0.363603
G1 X125.779 Y128.572 E.0012
; LINE_WIDTH: 0.411875
G1 X125.738 Y128.591 E.00138
; LINE_WIDTH: 0.460146
G1 X125.696 Y128.611 E.00156
; LINE_WIDTH: 0.508418
G1 X125.655 Y128.63 E.00174
; LINE_WIDTH: 0.556689
G1 X125.614 Y128.65 E.00192
; LINE_WIDTH: 0.580647
G1 X124.313 Y138.534 E.43684
; LINE_WIDTH: 0.555458
G1 X124.274 Y138.635 E.00449
; LINE_WIDTH: 0.505466
G1 X124.236 Y138.735 E.00405
; LINE_WIDTH: 0.480429
G1 X124.025 Y140.336 E.05756
M204 S10000
G1 X124.556 Y138.742 F42000
; LINE_WIDTH: 0.267003
G1 F3441
M204 S6000
G1 X124.522 Y138.712 E.00083
; LINE_WIDTH: 0.315227
G1 X124.487 Y138.682 E.00101
; LINE_WIDTH: 0.363451
G1 X124.452 Y138.653 E.00119
; LINE_WIDTH: 0.411676
G1 X124.417 Y138.623 E.00137
; LINE_WIDTH: 0.4599
G1 X124.382 Y138.594 E.00155
; LINE_WIDTH: 0.508124
G1 X124.348 Y138.564 E.00173
; LINE_WIDTH: 0.556348
G1 X124.313 Y138.534 E.00191
; WIPE_START
G1 F7011.696
G1 X124.348 Y138.564 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.321 Y141.164 Z12.4 F42000
G1 Z12
G1 E.8 F1800
; LINE_WIDTH: 0.482418
G1 F3441
M204 S6000
G1 X130.531 Y139.564 E.0578
G1 X130.52 Y139.457 E.00385
; LINE_WIDTH: 0.555839
G1 X130.509 Y139.35 E.0045
; LINE_WIDTH: 0.580844
G1 X131.81 Y129.466 E.437
M204 S10000
G1 X131.566 Y129.258 F42000
; LINE_WIDTH: 0.267029
G1 F3441
M204 S6000
G1 X131.601 Y129.288 E.00084
; LINE_WIDTH: 0.315306
G1 X131.636 Y129.318 E.00102
; LINE_WIDTH: 0.363583
G1 X131.671 Y129.347 E.0012
; LINE_WIDTH: 0.41186
G1 X131.706 Y129.377 E.00138
; LINE_WIDTH: 0.460137
G1 X131.741 Y129.407 E.00156
; LINE_WIDTH: 0.508414
G1 X131.775 Y129.436 E.00174
; LINE_WIDTH: 0.55669
G1 X131.81 Y129.466 E.00192
; LINE_WIDTH: 0.555838
G1 X131.849 Y129.365 E.0045
; LINE_WIDTH: 0.505843
G1 X131.887 Y129.265 E.00406
; LINE_WIDTH: 0.467912
G2 X131.983 Y128.404 I-29.559 J-3.714 E.03
; LINE_WIDTH: 0.42333
G1 X132.014 Y128 E.01256
; LINE_WIDTH: 0.387819
G1 X132.032 Y127.658 E.00962
; WIPE_START
G1 F10437.86
G1 X132.014 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.325 Y124.777 Z12.4 F42000
G1 Z12
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F3441
M204 S6000
G1 X128.632 Y119.514 E.1631
G1 X126.867 Y119.746 E.05473
G1 X127.497 Y124.536 E.14843
G1 X129.266 Y124.769 E.05481
M204 S10000
G1 X128.887 Y124.339 F42000
G1 F3441
M204 S6000
G1 X128.308 Y119.937 E.13642
G1 X127.29 Y120.071 E.03155
G1 X127.833 Y124.2 E.12796
G1 X128.828 Y124.331 E.03082
M204 S10000
G1 X128.48 Y123.931 F42000
; LINE_WIDTH: 0.367845
G1 F3441
M204 S6000
G1 X128.006 Y120.331 E.09615
G1 X127.683 Y120.373 E.0086
G1 X128.146 Y123.887 E.09384
G1 X128.42 Y123.923 E.00732
M204 S10000
G1 X127.161 Y124.872 F42000
; LINE_WIDTH: 0.41999
G1 F3441
M204 S6000
G1 X129.763 Y125.215 E.08065
G1 X128.957 Y119.091 E.18979
G1 X126.443 Y119.422 E.0779
G1 X127.153 Y124.812 E.16707
M204 S10000
G1 X126.825 Y125.208 F42000
G1 F3441
M204 S6000
G1 X130.201 Y125.653 E.10464
G1 X129.282 Y118.668 E.21647
G1 X126.02 Y119.097 E.10107
G1 X126.817 Y125.149 E.18754
M204 S10000
G1 X126.489 Y125.544 F42000
G1 F3441
M204 S6000
G1 X130.639 Y126.091 E.12862
G1 X129.606 Y118.245 E.24316
G1 X125.597 Y118.773 E.12424
G1 X126.481 Y125.485 E.20802
M204 S10000
G1 X126.153 Y125.88 F42000
G1 F3441
M204 S6000
G1 X131.077 Y126.529 E.15261
G1 X129.931 Y117.821 E.26985
G1 X125.174 Y118.448 E.14741
G1 X126.145 Y125.821 E.22849
; CHANGE_LAYER
; Z_HEIGHT: 12.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X125.884 Y123.838 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 61/68
; update layer progress
M73 L61
M991 S0 P60 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z12.4 I-1.212 J.113 P1  F42000
G1 X126.188 Y127.086 Z12.4
G1 Z12.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3457
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
G1 X131.533 Y126.984 Z12.6 F42000
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3457
M204 S6000
G1 X125.803 Y126.23 E.19169
G1 X124.734 Y118.11 E.27165
G1 X130.268 Y117.382 E.18516
G1 X131.525 Y126.924 E.31928
M204 S10000
G1 X131.979 Y127.453 F42000
G1 F3457
M204 S6000
G1 X125.85 Y126.646 E.20504
G1 X125.756 Y127.362 E.02395
G1 X125.542 Y127.362 E.0071
G1 X124.278 Y117.76 E.32127
G1 X130.619 Y116.925 E.21216
G1 X131.917 Y126.783 E.32983
G3 X131.975 Y127.393 I-7.636 J1.043 E.02035
; WIPE_START
G1 F8843.478
G1 X129.99 Y127.151 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.111 Y128.438 Z12.6 F42000
M73 P91 R1
G1 Z12.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3457
M204 S5000
G1 X131.385 Y129.132 E.16347
G1 X130.012 Y139.562 E.32325
G1 X124.738 Y138.868 E.16347
G1 X125.253 Y134.951 E.1214
G1 X126.103 Y128.497 E.20001
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.089 Y128.736 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.643 Y135.966 Z12.6 F42000
G1 X124.622 Y138.984 Z12.6
G1 Z12.2
G1 E.8 F1800
G1 F3457
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
G1 X130.732 Y141.217 Z12.6 F42000
G1 Z12.2
G1 E.8 F1800
G1 F3457
M204 S5000
G3 X130.525 Y141.389 I-.191 J-.02 E.00917
G1 X123.784 Y140.502 E.20891
G3 X123.612 Y140.293 I.022 J-.193 E.00917
G1 X125.188 Y128.322 E.37103
G2 X125.188 Y127.678 I-4.281 J-.322 E.01981
G1 X123.864 Y117.621 E.3117
G3 X124.022 Y117.398 I.193 J-.03 E.00927
G1 X130.759 Y116.511 E.2088
G3 X130.832 Y116.513 I.03 J.216 E.00226
G3 X130.982 Y116.683 I-.041 J.188 E.00747
G1 X132.306 Y126.736 E.31155
G3 X132.306 Y129.264 I-10.794 J1.264 E.07786
G1 X130.74 Y141.158 E.36861
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.71 Y141.288 E-.05091
G1 X130.671 Y141.34 E-.02458
G1 X130.592 Y141.383 E-.03412
G1 X130.525 Y141.389 E-.02564
G1 X128.895 Y141.174 E-.62474
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X130.321 Y141.164 F42000
G1 Z12.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.480845
G1 F3457
M204 S6000
G1 X130.531 Y139.564 E.0576
; LINE_WIDTH: 0.505846
G1 X130.52 Y139.457 E.00406
; LINE_WIDTH: 0.555844
G1 X130.509 Y139.35 E.0045
; LINE_WIDTH: 0.580839
G1 X131.81 Y129.466 E.43699
; LINE_WIDTH: 0.555848
G1 X131.849 Y129.365 E.0045
; LINE_WIDTH: 0.505852
G1 X131.887 Y129.265 E.00406
; LINE_WIDTH: 0.468361
G2 X131.983 Y128.404 I-25.867 J-3.304 E.03003
; LINE_WIDTH: 0.42333
G1 X132.014 Y128 E.01256
; LINE_WIDTH: 0.387807
G1 X132.032 Y127.658 E.00962
M204 S10000
G1 X131.566 Y129.258 F42000
; LINE_WIDTH: 0.267031
G1 F3457
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
G1 F7006.775
G1 X131.775 Y129.436 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.325 Y124.777 Z12.6 F42000
G1 Z12.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F3457
M204 S6000
G1 X128.632 Y119.514 E.1631
G1 X126.867 Y119.746 E.05473
G1 X127.497 Y124.536 E.14843
G1 X129.266 Y124.769 E.05481
M204 S10000
G1 X128.887 Y124.339 F42000
G1 F3457
M204 S6000
G1 X128.308 Y119.937 E.13641
G1 X127.29 Y120.071 E.03155
G1 X127.833 Y124.2 E.12796
G1 X128.828 Y124.331 E.03082
M204 S10000
G1 X128.48 Y123.931 F42000
; LINE_WIDTH: 0.36784
G1 F3457
M204 S6000
G1 X128.006 Y120.331 E.09614
G1 X127.683 Y120.373 E.0086
G1 X128.146 Y123.887 E.09384
G1 X128.42 Y123.923 E.00732
M204 S10000
G1 X127.161 Y124.872 F42000
; LINE_WIDTH: 0.41999
G1 F3457
M204 S6000
G1 X129.763 Y125.215 E.08065
G1 X128.957 Y119.091 E.18979
G1 X126.443 Y119.422 E.0779
G1 X127.153 Y124.812 E.16707
M204 S10000
G1 X126.825 Y125.208 F42000
G1 F3457
M204 S6000
G1 X130.201 Y125.653 E.10464
G1 X129.282 Y118.668 E.21647
G1 X126.02 Y119.097 E.10107
G1 X126.817 Y125.149 E.18754
M204 S10000
G1 X126.489 Y125.544 F42000
G1 F3457
M204 S6000
G1 X130.639 Y126.091 E.12862
G1 X129.606 Y118.245 E.24316
G1 X125.597 Y118.773 E.12424
G1 X126.481 Y125.485 E.20802
M204 S10000
G1 X126.153 Y125.88 F42000
G1 F3457
M204 S6000
G1 X131.077 Y126.529 E.15261
G1 X129.931 Y117.821 E.26985
G1 X125.174 Y118.448 E.14741
G1 X126.145 Y125.821 E.22849
; WIPE_START
G1 F9547.299
G1 X125.884 Y123.838 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.614 Y128.65 Z12.6 F42000
G1 Z12.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.556715
G1 F3457
M204 S6000
G1 X125.655 Y128.63 E.00192
; LINE_WIDTH: 0.508437
G1 X125.696 Y128.611 E.00174
; LINE_WIDTH: 0.460159
G1 X125.738 Y128.591 E.00156
; LINE_WIDTH: 0.41188
G1 X125.779 Y128.572 E.00138
; LINE_WIDTH: 0.363602
G1 X125.821 Y128.552 E.0012
; LINE_WIDTH: 0.315324
G1 X125.862 Y128.532 E.00102
; LINE_WIDTH: 0.267046
G1 X125.903 Y128.513 E.00084
M204 S10000
G1 X125.656 Y127.558 F42000
; LINE_WIDTH: 0.525326
G1 F3457
M204 S6000
G1 X125.636 Y128.01 E.01775
; LINE_WIDTH: 0.488534
G1 X125.592 Y128.436 E.01557
; LINE_WIDTH: 0.505862
G1 X125.603 Y128.543 E.00406
; LINE_WIDTH: 0.555854
G1 X125.614 Y128.65 E.0045
; LINE_WIDTH: 0.580666
G1 X124.313 Y138.534 E.43686
M204 S10000
G1 X124.556 Y138.742 F42000
; LINE_WIDTH: 0.266985
G1 F3457
M204 S6000
G1 X124.522 Y138.712 E.00083
; LINE_WIDTH: 0.315212
G1 X124.487 Y138.682 E.00101
; LINE_WIDTH: 0.363439
G1 X124.452 Y138.653 E.00119
; LINE_WIDTH: 0.411666
G1 X124.417 Y138.623 E.00137
; LINE_WIDTH: 0.459893
G1 X124.382 Y138.594 E.00155
; LINE_WIDTH: 0.50812
G1 X124.348 Y138.564 E.00173
; LINE_WIDTH: 0.556347
G1 X124.313 Y138.534 E.00191
; LINE_WIDTH: 0.555471
G1 X124.274 Y138.635 E.00449
; LINE_WIDTH: 0.505484
G1 X124.236 Y138.735 E.00405
; LINE_WIDTH: 0.480472
G1 X124.025 Y140.336 E.05756
; CHANGE_LAYER
; Z_HEIGHT: 12.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8227.592
G1 X124.236 Y138.735 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 62/68
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
G1 F2653
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
G1 X126.111 Y128.438 Z12.8 F42000
G1 Z12.4
G1 E.8 F1800
G1 F2653
M204 S5000
G1 X131.385 Y129.132 E.16347
G1 X130.012 Y139.562 E.32325
G1 X124.738 Y138.868 E.16347
G1 X125.449 Y133.467 E.16737
G1 X126.103 Y128.497 E.15403
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.089 Y128.736 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.643 Y135.966 Z12.8 F42000
G1 X124.622 Y138.984 Z12.8
G1 Z12.4
G1 E.8 F1800
G1 F2653
M204 S5000
G1 X130.094 Y139.704 E.16961
G1 X129.935 Y140.914 E.03749
G1 X124.462 Y140.193 E.16961
G1 X124.5 Y139.909 E.00882
G1 X124.614 Y139.043 E.02683
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.599 Y139.283 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.441 Y132.199 Z12.8 F42000
G1 X131.533 Y126.984 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2653
M204 S6000
G1 X125.803 Y126.23 E.19169
G1 X124.734 Y118.11 E.27165
G1 X130.268 Y117.382 E.18516
G1 X131.525 Y126.924 E.31928
M204 S10000
G1 X131.979 Y127.453 F42000
G1 F2653
M204 S6000
G1 X125.85 Y126.646 E.20504
G1 X125.756 Y127.362 E.02395
G1 X125.542 Y127.362 E.0071
G1 X124.278 Y117.76 E.32127
G1 X130.619 Y116.925 E.21216
G1 X131.917 Y126.783 E.32983
G3 X131.975 Y127.393 I-7.636 J1.043 E.02035
; WIPE_START
G1 F8843.478
G1 X129.99 Y127.151 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.392 Y134.773 Z12.8 F42000
G1 X130.732 Y141.217 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2653
M204 S5000
G3 X130.522 Y141.388 I-.191 J-.02 E.00925
G1 X123.784 Y140.502 E.20884
G3 X123.613 Y140.292 I.02 J-.191 E.00925
G1 X125.188 Y128.322 E.37097
G2 X125.188 Y127.68 I-3.281 J-.322 E.01975
G1 X123.864 Y117.621 E.31177
G3 X124.022 Y117.398 I.194 J-.03 E.00926
G1 X130.759 Y116.511 E.20881
G3 X130.831 Y116.513 I.03 J.215 E.00224
G3 X130.982 Y116.683 I-.043 J.19 E.00747
G1 X132.306 Y126.736 E.31155
G3 X132.306 Y129.264 I-10.792 J1.264 E.07785
G1 X130.74 Y141.157 E.3686
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.71 Y141.288 E-.05101
G1 X130.671 Y141.34 E-.02467
G1 X130.59 Y141.383 E-.03494
M73 P92 R1
G1 X130.522 Y141.388 E-.02568
G1 X128.895 Y141.174 E-.6237
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X130.321 Y141.164 F42000
G1 Z12.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.482421
G1 F2653
M204 S6000
G1 X130.531 Y139.564 E.05781
G1 X130.52 Y139.457 E.00385
; LINE_WIDTH: 0.555844
G1 X130.509 Y139.35 E.0045
; LINE_WIDTH: 0.580847
G1 X131.81 Y129.466 E.437
; LINE_WIDTH: 0.556709
G1 X131.775 Y129.436 E.00192
; LINE_WIDTH: 0.508429
G1 X131.741 Y129.407 E.00174
; LINE_WIDTH: 0.460149
G1 X131.706 Y129.377 E.00156
; LINE_WIDTH: 0.41187
G1 X131.671 Y129.347 E.00138
; LINE_WIDTH: 0.36359
G1 X131.636 Y129.318 E.0012
; LINE_WIDTH: 0.31531
G1 X131.601 Y129.288 E.00102
; LINE_WIDTH: 0.267031
G1 X131.566 Y129.258 E.00084
M204 S10000
G1 X131.81 Y129.466 F42000
; LINE_WIDTH: 0.555848
G1 F2653
M204 S6000
G1 X131.849 Y129.365 E.0045
; LINE_WIDTH: 0.505851
G1 X131.887 Y129.265 E.00406
; LINE_WIDTH: 0.468368
G2 X131.983 Y128.404 I-25.885 J-3.306 E.03003
; LINE_WIDTH: 0.423336
G1 X132.014 Y128 E.01257
; LINE_WIDTH: 0.387804
G1 X132.032 Y127.658 E.00962
; WIPE_START
G1 F10438.292
G1 X132.014 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.38 Y126.218 Z12.8 F42000
G1 Z12.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2653
M204 S6000
G1 X129.994 Y126.43 E.05401
G1 X130.621 Y125.914 E.02692
G1 X131.02 Y125.76 E.01421
G1 X130.705 Y123.363 E.08021
G1 X129.966 Y123.04 E.02674
G2 X129.31 Y123.152 I-.249 J.514 E.02353
G1 X128.655 Y124.305 E.04399
G3 X127.345 Y125.098 I-1.853 J-1.584 E.05167
G3 X126.69 Y124.986 I-.249 J-.514 E.02353
G1 X126.035 Y123.833 E.04399
G1 X125.815 Y123.653 E.00942
G1 X126.079 Y125.654 E.06697
G3 X126.864 Y126.018 I.17 J.662 E.0311
G1 X128.38 Y126.218 E.05071
; WIPE_START
G1 F8843.478
G1 X126.864 Y126.018 E-.58087
G1 X126.69 Y125.773 E-.11436
G1 X126.537 Y125.697 E-.06477
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.614 Y128.65 Z12.8 F42000
G1 Z12.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.556696
G1 F2653
M204 S6000
G1 X125.655 Y128.63 E.00192
; LINE_WIDTH: 0.508399
G1 X125.696 Y128.611 E.00174
; LINE_WIDTH: 0.460101
G1 X125.738 Y128.591 E.00156
; LINE_WIDTH: 0.411804
G1 X125.779 Y128.572 E.00138
; LINE_WIDTH: 0.363507
G1 X125.821 Y128.552 E.0012
; LINE_WIDTH: 0.31521
G1 X125.862 Y128.532 E.00102
; LINE_WIDTH: 0.266912
G1 X125.903 Y128.513 E.00083
M204 S10000
G1 X125.651 Y127.558 F42000
; LINE_WIDTH: 0.527288
G1 F2653
M204 S6000
G1 X125.635 Y128.014 E.018
; LINE_WIDTH: 0.488399
G1 X125.592 Y128.436 E.0154
; LINE_WIDTH: 0.505919
G1 X125.603 Y128.543 E.00406
; LINE_WIDTH: 0.555874
G1 X125.614 Y128.65 E.00449
; LINE_WIDTH: 0.580649
G1 X124.313 Y138.534 E.43685
M204 S10000
G1 X124.556 Y138.742 F42000
; LINE_WIDTH: 0.267002
G1 F2653
M204 S6000
G1 X124.522 Y138.712 E.00083
; LINE_WIDTH: 0.315223
G1 X124.487 Y138.682 E.00101
; LINE_WIDTH: 0.363444
G1 X124.452 Y138.653 E.00119
; LINE_WIDTH: 0.411666
G1 X124.417 Y138.623 E.00137
; LINE_WIDTH: 0.459887
G1 X124.382 Y138.594 E.00155
; LINE_WIDTH: 0.508108
G1 X124.348 Y138.564 E.00173
; LINE_WIDTH: 0.55633
G1 X124.313 Y138.534 E.00191
; LINE_WIDTH: 0.563776
G1 X124.287 Y138.601 E.00304
; LINE_WIDTH: 0.530442
G1 X124.261 Y138.668 E.00285
; LINE_WIDTH: 0.481164
G1 X124.236 Y138.735 E.00256
G1 X124.025 Y140.336 E.05766
; WIPE_START
G1 F8214.614
G1 X124.236 Y138.735 E-.72769
G1 X124.261 Y138.668 E-.03231
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.482 Y131.366 Z12.8 F42000
G1 X130.164 Y119.259 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2653
M204 S6000
G1 X130.377 Y120.874 E.05401
G1 X129.966 Y121.212 E.01767
G1 X129.31 Y122.365 E.04399
G3 X128.655 Y122.477 I-.406 J-.402 E.02353
G3 X127.345 Y121.685 I.543 J-2.377 E.05167
G1 X126.69 Y120.532 E.04399
G2 X126.035 Y120.42 I-.406 J.402 E.02353
G1 X125.421 Y120.657 E.02182
G1 X125.125 Y118.41 E.07517
G1 X125.719 Y118.332 E.01987
G1 X126.035 Y118.592 E.01355
G1 X126.69 Y119.745 E.04399
G2 X127.345 Y119.857 I.406 J-.402 E.02353
G2 X128.655 Y119.064 I-.543 J-2.377 E.05167
G1 X129.31 Y117.911 E.04399
G1 X129.451 Y117.841 E.00522
G1 X127.837 Y118.053 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F8843.478
G1 X129.451 Y117.841 E-.61876
G1 X129.31 Y117.911 E-.05982
G1 X129.205 Y118.097 E-.08142
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 63/68
; update layer progress
M73 L63
M991 S0 P62 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z12.8 I-1.154 J-.387 P1  F42000
G1 X126.188 Y127.086 Z12.8
G1 Z12.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2787
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
G1 X126.111 Y128.438 Z13 F42000
G1 Z12.6
G1 E.8 F1800
G1 F2787
M204 S5000
G1 X131.385 Y129.132 E.16347
G1 X130.012 Y139.562 E.32325
G1 X124.738 Y138.868 E.16347
G1 X125.644 Y131.984 E.21335
G1 X126.103 Y128.497 E.10806
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.089 Y128.736 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.533 Y126.984 Z13 F42000
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2787
M204 S6000
G1 X125.803 Y126.23 E.19169
G1 X124.734 Y118.111 E.27165
G1 X130.268 Y117.382 E.18516
G1 X131.525 Y126.924 E.31928
M204 S10000
G1 X131.979 Y127.453 F42000
G1 F2787
M204 S6000
G1 X125.85 Y126.646 E.20504
G1 X125.756 Y127.362 E.02395
G1 X125.542 Y127.362 E.0071
G1 X124.278 Y117.76 E.32127
G1 X130.619 Y116.925 E.21216
G1 X131.917 Y126.782 E.3298
G3 X131.975 Y127.393 I-8.084 J1.086 E.02038
; WIPE_START
G1 F8843.478
G1 X129.99 Y127.151 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.836 Y134.102 Z13 F42000
G1 X124.622 Y138.984 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2787
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
G1 X130.732 Y141.217 Z13 F42000
G1 Z12.6
G1 E.8 F1800
G1 F2787
M204 S5000
G3 X130.522 Y141.388 I-.191 J-.02 E.00924
G1 X123.783 Y140.502 E.20886
G3 X123.612 Y140.294 I.023 J-.193 E.00913
G1 X125.188 Y128.322 E.37104
G2 X125.188 Y127.678 I-4.385 J-.322 E.01981
G1 X123.864 Y117.621 E.3117
G3 X124.021 Y117.398 I.194 J-.03 E.00924
G1 X130.758 Y116.511 E.20881
G3 X130.831 Y116.513 I.031 J.215 E.00225
G3 X130.983 Y116.684 I-.043 J.191 E.00748
G1 X132.306 Y126.736 E.31154
G3 X132.306 Y129.264 I-10.79 J1.264 E.07787
G1 X130.74 Y141.158 E.36861
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.716 Y141.276 E-.0458
G1 X130.671 Y141.339 E-.02971
G1 X130.592 Y141.383 E-.03421
G1 X130.522 Y141.388 E-.02656
G1 X128.895 Y141.174 E-.62372
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X130.321 Y141.164 F42000
G1 Z12.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.480841
G1 F2787
M204 S6000
G1 X130.531 Y139.564 E.0576
; LINE_WIDTH: 0.505846
G1 X130.52 Y139.457 E.00406
; LINE_WIDTH: 0.555844
G1 X130.509 Y139.35 E.0045
; LINE_WIDTH: 0.580839
G1 X131.81 Y129.466 E.43699
; LINE_WIDTH: 0.555841
G1 X131.849 Y129.365 E.0045
; LINE_WIDTH: 0.505852
G1 X131.887 Y129.265 E.00406
; LINE_WIDTH: 0.468129
G2 X131.983 Y128.404 I-27.852 J-3.525 E.03001
; LINE_WIDTH: 0.423342
G1 X132.014 Y128 E.01256
; LINE_WIDTH: 0.387804
G1 X132.032 Y127.658 E.00962
M204 S10000
G1 X131.566 Y129.258 F42000
; LINE_WIDTH: 0.267029
G1 F2787
M204 S6000
G1 X131.601 Y129.288 E.00084
; LINE_WIDTH: 0.315306
G1 X131.636 Y129.318 E.00102
; LINE_WIDTH: 0.363583
M73 P93 R1
G1 X131.671 Y129.347 E.0012
; LINE_WIDTH: 0.41186
G1 X131.706 Y129.377 E.00138
; LINE_WIDTH: 0.460137
G1 X131.741 Y129.407 E.00156
; LINE_WIDTH: 0.508414
G1 X131.775 Y129.436 E.00174
; LINE_WIDTH: 0.55669
G1 X131.81 Y129.466 E.00192
; WIPE_START
G1 F7007.026
G1 X131.775 Y129.436 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.293 Y121.949 Z13 F42000
G1 X129.83 Y119.61 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2787
M204 S6000
G1 X130.043 Y121.224 E.05401
G1 X129.885 Y121.448 E.0091
G1 X129.713 Y122.104 E.02247
G2 X130.272 Y122.964 I1.01 J-.044 E.03569
G1 X130.642 Y125.777 E.09412
G2 X130.305 Y126.091 I.459 J.83 E.01542
G1 X127.148 Y125.675 E.10565
G1 X127.366 Y125.379 E.01219
G1 X128.276 Y124.724 E.0372
G2 X128.876 Y123.086 I-1.515 J-1.484 E.05963
G1 X128.634 Y122.759 E.01351
G1 X127.724 Y122.104 E.0372
G3 X127.124 Y120.466 I1.515 J-1.484 E.05963
G1 X127.366 Y120.138 E.01351
G1 X128.276 Y119.483 E.0372
G1 X128.736 Y118.828 E.02655
G1 X128.875 Y118.297 E.01821
G1 X126.008 Y118.675 E.09595
G1 X126.115 Y118.828 E.00621
G1 X126.287 Y119.483 E.02247
G3 X125.757 Y120.323 I-.991 J-.038 E.03449
G1 X125.97 Y121.937 E.05401
M204 S10000
G1 X126.111 Y125.785 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.383347
G1 F2787
M204 S6000
G1 X125.162 Y118.581 E.20159
G1 X125.172 Y118.446 E.00374
G1 X125.299 Y118.402 E.00374
G1 X129.798 Y117.809 E.12589
G1 X129.933 Y117.819 E.00374
G1 X129.977 Y117.946 E.00374
G1 X131.084 Y126.357 E.23532
; LINE_WIDTH: 0.396875
G1 X131.075 Y126.437 E.00233
; LINE_WIDTH: 0.416066
G1 X131.066 Y126.518 E.00246
G1 X130.933 Y126.538 E.00409
; LINE_WIDTH: 0.383166
G1 X126.248 Y125.922 E.13102
G1 X126.143 Y125.89 E.00304
G1 X126.128 Y125.843 E.00138
; WIPE_START
G1 F10580.596
G1 X126.143 Y125.89 E-.01885
G1 X126.248 Y125.922 E-.04166
G1 X128.073 Y126.162 E-.69949
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.614 Y128.65 Z13 F42000
G1 Z12.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.556702
G1 F2787
M204 S6000
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
G1 X125.656 Y127.558 F42000
; LINE_WIDTH: 0.522143
G1 F2787
M204 S6000
G3 X125.636 Y128.01 I-10.453 J-.241 E.01765
; LINE_WIDTH: 0.488501
G1 X125.592 Y128.436 E.01555
; LINE_WIDTH: 0.505845
G1 X125.603 Y128.543 E.00406
; LINE_WIDTH: 0.555841
G1 X125.614 Y128.65 E.0045
; LINE_WIDTH: 0.580632
G1 X124.313 Y138.534 E.43683
M204 S10000
G1 X124.556 Y138.742 F42000
; LINE_WIDTH: 0.267002
G1 F2787
M204 S6000
G1 X124.522 Y138.712 E.00083
; LINE_WIDTH: 0.315223
G1 X124.487 Y138.682 E.00101
; LINE_WIDTH: 0.363445
G1 X124.452 Y138.653 E.00119
; LINE_WIDTH: 0.411666
G1 X124.417 Y138.623 E.00137
; LINE_WIDTH: 0.459887
G1 X124.382 Y138.594 E.00155
; LINE_WIDTH: 0.508109
G1 X124.348 Y138.564 E.00173
; LINE_WIDTH: 0.55633
G1 X124.313 Y138.534 E.00191
; LINE_WIDTH: 0.563776
G1 X124.287 Y138.601 E.00304
; LINE_WIDTH: 0.530442
G1 X124.261 Y138.668 E.00285
; LINE_WIDTH: 0.48112
G1 X124.236 Y138.735 E.00256
G1 X124.025 Y140.336 E.05765
; CHANGE_LAYER
; Z_HEIGHT: 12.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8215.44
G1 X124.236 Y138.735 E-.72769
G1 X124.261 Y138.668 E-.03231
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 64/68
; update layer progress
M73 L64
M991 S0 P63 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z13 I1.2 J.2 P1  F42000
G1 X126.188 Y127.086 Z13
G1 Z12.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3412
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
G1 X126.111 Y128.438 Z13.2 F42000
G1 Z12.8
G1 E.8 F1800
G1 F3412
M204 S5000
G1 X131.385 Y129.132 E.16347
G1 X130.012 Y139.562 E.32325
G1 X124.738 Y138.868 E.16347
G1 X125.839 Y130.5 E.25933
G1 X126.103 Y128.497 E.06208
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
G1 F3412
M204 S6000
G1 X125.803 Y126.23 E.19169
G1 X124.734 Y118.111 E.27165
G1 X130.268 Y117.382 E.18516
G1 X131.525 Y126.924 E.31928
M204 S10000
G1 X131.979 Y127.453 F42000
G1 F3412
M204 S6000
G1 X125.85 Y126.646 E.20504
G1 X125.756 Y127.362 E.02395
G1 X125.542 Y127.362 E.0071
G1 X124.278 Y117.76 E.32127
G1 X130.619 Y116.925 E.21216
G1 X131.917 Y126.783 E.32983
G3 X131.975 Y127.393 I-7.938 J1.071 E.02035
; WIPE_START
G1 F8843.478
G1 X129.99 Y127.151 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.836 Y134.102 Z13.2 F42000
G1 X124.622 Y138.984 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3412
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
G1 X130.732 Y141.217 Z13.2 F42000
G1 Z12.8
G1 E.8 F1800
G1 F3412
M204 S5000
G3 X130.522 Y141.388 I-.193 J-.022 E.00921
G1 X123.784 Y140.502 E.20884
G3 X123.612 Y140.294 I.022 J-.193 E.00914
G1 X125.188 Y128.322 E.37105
G2 X125.188 Y127.678 I-4.392 J-.322 E.01981
G1 X123.864 Y117.621 E.31169
G3 X124.021 Y117.399 I.194 J-.03 E.00923
G1 X130.758 Y116.511 E.20883
G3 X130.831 Y116.513 I.031 J.213 E.00224
G3 X130.982 Y116.683 I-.043 J.191 E.00748
G1 X132.306 Y126.736 E.31155
G3 X132.306 Y129.264 I-10.794 J1.264 E.07786
G1 X130.74 Y141.158 E.36861
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.695 Y141.312 E-.06118
G1 X130.648 Y141.357 E-.02463
G1 X130.522 Y141.388 E-.04934
G1 X128.892 Y141.174 E-.62485
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X130.321 Y141.164 F42000
G1 Z12.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.48085
G1 F3412
M204 S6000
G1 X130.531 Y139.564 E.0576
; LINE_WIDTH: 0.505864
G1 X130.52 Y139.457 E.00406
; LINE_WIDTH: 0.555858
G1 X130.509 Y139.35 E.0045
; LINE_WIDTH: 0.580837
G1 X131.81 Y129.466 E.43699
; LINE_WIDTH: 0.555847
G1 X131.849 Y129.365 E.0045
; LINE_WIDTH: 0.505849
G1 X131.887 Y129.265 E.00406
; LINE_WIDTH: 0.46836
G2 X131.983 Y128.404 I-25.836 J-3.301 E.03003
; LINE_WIDTH: 0.42333
G1 X132.014 Y128 E.01256
; LINE_WIDTH: 0.387819
G1 X132.032 Y127.658 E.00962
M204 S10000
G1 X131.566 Y129.258 F42000
; LINE_WIDTH: 0.267031
G1 F3412
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
G1 X130.723 Y121.877 Z13.2 F42000
G1 X130.152 Y117.779 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.41757
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G2 X125.149 Y118.429 I33.601 J278.069 E.28149
G1 X125.205 Y118.856 E.02403
G1 X130.012 Y118.267 E.2702
G1 X130.073 Y118.73 E.02609
G1 X125.267 Y119.319 E.27019
G1 X125.328 Y119.783 E.02609
G1 X130.134 Y119.194 E.2702
G1 X130.195 Y119.658 E.02609
G1 X125.389 Y120.247 E.27019
G1 X125.45 Y120.71 E.02609
G1 X130.256 Y120.121 E.27019
G1 X130.317 Y120.585 E.02609
G1 X125.511 Y121.174 E.27019
G1 X125.572 Y121.637 E.02609
G1 X130.378 Y121.048 E.27019
G1 X130.439 Y121.512 E.02609
G1 X125.633 Y122.101 E.27019
G1 X125.694 Y122.565 E.02609
G1 X130.5 Y121.975 E.27019
G1 X130.561 Y122.439 E.02609
G1 X125.755 Y123.028 E.2702
G1 X125.816 Y123.492 E.02609
G1 X130.622 Y122.903 E.27019
G1 X130.683 Y123.366 E.02609
G1 X125.877 Y123.955 E.27019
G1 X125.938 Y124.419 E.02609
G1 X130.744 Y123.83 E.27019
G1 X130.805 Y124.293 E.02609
G1 X125.999 Y124.882 E.27019
G1 X126.06 Y125.346 E.02609
G1 X130.866 Y124.757 E.27019
G1 X130.927 Y125.221 E.02609
G1 X126.121 Y125.81 E.27019
G1 X126.133 Y125.9 E.00509
G1 X127.624 Y126.096 E.08394
G1 X130.989 Y125.684 E.18911
G1 X131.05 Y126.148 E.02609
G1 X128.674 Y126.439 E.13354
M106 S201.45
; WIPE_START
G1 X130.659 Y126.196 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.614 Y128.65 Z13.2 F42000
G1 Z12.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.556689
; LAYER_HEIGHT: 0.2
G1 F3412
M204 S6000
G1 X125.655 Y128.63 E.00192
; LINE_WIDTH: 0.508415
G1 X125.696 Y128.611 E.00174
; LINE_WIDTH: 0.46014
G1 X125.738 Y128.591 E.00156
; LINE_WIDTH: 0.411866
G1 X125.779 Y128.572 E.00138
; LINE_WIDTH: 0.363592
G1 X125.821 Y128.552 E.0012
; LINE_WIDTH: 0.315318
G1 X125.862 Y128.532 E.00102
; LINE_WIDTH: 0.267044
G1 X125.903 Y128.513 E.00084
M204 S10000
G1 X125.656 Y127.558 F42000
; LINE_WIDTH: 0.522152
M73 P94 R1
G1 F3412
M204 S6000
G3 X125.636 Y128.01 I-10.446 J-.24 E.01765
; LINE_WIDTH: 0.488495
G1 X125.592 Y128.436 E.01555
; LINE_WIDTH: 0.505841
G1 X125.603 Y128.543 E.00406
; LINE_WIDTH: 0.555828
G1 X125.614 Y128.65 E.0045
; LINE_WIDTH: 0.580632
G1 X124.313 Y138.534 E.43683
M204 S10000
G1 X124.556 Y138.742 F42000
; LINE_WIDTH: 0.266982
G1 F3412
M204 S6000
G1 X124.522 Y138.712 E.00083
; LINE_WIDTH: 0.315203
G1 X124.487 Y138.682 E.00101
; LINE_WIDTH: 0.363424
G1 X124.452 Y138.653 E.00119
; LINE_WIDTH: 0.411645
G1 X124.417 Y138.623 E.00137
; LINE_WIDTH: 0.459866
G1 X124.382 Y138.594 E.00155
; LINE_WIDTH: 0.508087
G1 X124.348 Y138.564 E.00173
; LINE_WIDTH: 0.556308
G1 X124.313 Y138.534 E.00191
; LINE_WIDTH: 0.555428
G1 X124.274 Y138.635 E.00449
; LINE_WIDTH: 0.505432
G1 X124.236 Y138.735 E.00405
; LINE_WIDTH: 0.480411
G1 X124.025 Y140.336 E.05756
; CHANGE_LAYER
; Z_HEIGHT: 13
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8228.741
G1 X124.236 Y138.735 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 65/68
; update layer progress
M73 L65
M991 S0 P64 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z13.2 I1.197 J.218 P1  F42000
G1 X126.111 Y128.438 Z13.2
G1 Z13
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3960
M204 S5000
G1 X131.385 Y129.132 E.16347
G1 X130.012 Y139.562 E.32325
G1 X124.738 Y138.868 E.16347
G1 X126.035 Y129.017 E.3053
G1 X126.103 Y128.497 E.0161
M204 S10000
G1 X125.986 Y127.615 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3960
M204 S6000
G1 X124.734 Y118.111 E.31801
G1 X130.268 Y117.382 E.18516
G1 X131.512 Y126.832 E.31618
G3 X131.554 Y127.227 I-9.483 J1.199 E.01319
G1 X131.586 Y127.825 E.01985
G1 X131.59 Y128 E.00582
G1 X131.586 Y128.163 E.0054
G1 F3245.762
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
G1 F2427.708
G1 X126.045 Y127.623 E.00328
M204 S10000
G1 X125.601 Y127.975 F42000
G1 F3960
M204 S6000
G2 X125.577 Y127.631 I-2.642 J.006 E.01144
G1 X124.278 Y117.76 E.33027
G1 X130.619 Y116.925 E.21216
G1 X131.917 Y126.783 E.32983
G3 X131.987 Y128.404 I-9.598 J1.226 E.05389
G1 X131.961 Y128.813 E.01357
G1 X131.508 Y128.753 E.01515
M106 S255
G1 F1320
G1 X126.09 Y128.04 E.18128
M106 S201.45
G1 F3960
G1 X125.66 Y127.983 E.01439
; WIPE_START
G1 F4406.961
G1 X125.577 Y127.631 E-.13729
G1 X125.363 Y126.007 E-.62271
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.974 Y133.629 Z13.4 F42000
G1 X124.686 Y139.257 Z13.4
G1 Z13
G1 E.8 F1800
M106 S255
G1 F1320
M204 S6000
G1 X130.033 Y139.96 E.17888
M106 S201.45
G1 F3960
G1 X130.494 Y140.021 E.01544
G1 X130.442 Y140.418 E.01327
G1 X130.37 Y140.966 E.01836
G1 X124.029 Y140.132 E.21215
G1 X124.101 Y139.583 E.01837
G1 X124.154 Y139.186 E.01327
G1 X124.615 Y139.247 E.01543
M106 S255
G1 F1320
G1 X124.627 Y139.249 E.00042
M106 S201.45
; WIPE_START
G1 X126.61 Y139.51 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.614 Y140.28 Z13.4 F42000
G1 Z13
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3960
M204 S5000
G1 X125.188 Y128.322 E.37059
G2 X125.188 Y127.678 I-4.357 J-.322 E.01982
G1 X123.864 Y117.621 E.3117
G3 X124.02 Y117.399 I.194 J-.029 E.00921
G1 X130.758 Y116.511 E.20883
G3 X130.831 Y116.513 I.031 J.212 E.00224
G3 X130.982 Y116.683 I-.043 J.191 E.00749
G1 X132.306 Y126.736 E.31155
G3 X132.352 Y128.842 I-9.987 J1.273 E.06486
G1 X130.734 Y141.205 E.3831
G3 X130.525 Y141.382 I-.196 J-.019 E.00931
G1 X123.785 Y140.495 E.2089
G3 X123.617 Y140.341 I.023 J-.194 E.0075
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.876 Y138.357 E-.76
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X124.251 Y139.001 F42000
G1 Z13
M73 P94 R0
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.580636
G1 F3960
M204 S6000
G1 X125.675 Y128.183 E.47813
; WIPE_START
G1 F6694.987
G1 X125.414 Y130.166 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.105 Y127.265 Z13.4 F42000
G1 Z13
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.47845
M106 S255
G1 F3000
M204 S6000
G1 X131.241 Y127.941 E.18386
G1 X131.248 Y127.898 E.00156
G2 X131.237 Y127.502 I-2.291 J-.133 E.0141
G1 X126.22 Y126.841 E.17958
G1 X126.161 Y126.394 E.016
G1 X131.198 Y127.057 E.18029
G2 X131.147 Y126.611 I-5.174 J.359 E.01593
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
G1 X131.872 Y128.999 Z13.4 F42000
G1 Z13
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.580834
G1 F3960
M204 S6000
G1 X130.448 Y139.817 E.4783
M204 S10000
G1 X130.23 Y140.467 F42000
; LINE_WIDTH: 0.589466
G1 F3960
M204 S6000
G1 X124.293 Y139.686 E.2667
; WIPE_START
G1 F6586.821
G1 X126.276 Y139.947 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.42 Y132.316 Z13.4 F42000
G1 X126.556 Y125.161 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F3960
M204 S6000
G1 X130.973 Y125.74 E.13689
G1 X129.931 Y117.821 E.24539
G1 X125.174 Y118.448 E.14741
G1 X126.063 Y125.197 E.20917
G1 X126.496 Y125.166 E.01334
M204 S10000
G1 X126.605 Y124.788 F42000
G1 F3960
M204 S6000
G1 X130.535 Y125.302 E.1218
G1 X129.606 Y118.245 E.21872
G1 X125.597 Y118.773 E.12424
G1 X126.39 Y124.792 E.18656
G1 X126.545 Y124.789 E.00476
M204 S10000
G1 X128.376 Y123.144 F42000
; LINE_WIDTH: 0.367855
G1 F3960
M204 S6000
G1 X128.006 Y120.331 E.07514
G1 X127.683 Y120.373 E.0086
G1 X128.042 Y123.101 E.07284
G1 X128.316 Y123.136 E.00732
M204 S10000
G1 X128.784 Y123.552 F42000
; LINE_WIDTH: 0.41999
G1 F3960
M204 S6000
G1 X128.308 Y119.937 E.11202
G1 X127.29 Y120.071 E.03155
G1 X127.73 Y123.414 E.10359
G1 X128.724 Y123.544 E.03082
M204 S10000
G1 X129.222 Y123.989 F42000
G1 F3960
M204 S6000
G1 X128.632 Y119.514 E.1387
G1 X126.867 Y119.746 E.05473
G1 X127.394 Y123.75 E.12408
G1 X129.162 Y123.981 E.0548
M204 S10000
G1 X129.659 Y124.427 F42000
G1 F3960
M204 S6000
G1 X128.957 Y119.091 E.16537
G1 X126.443 Y119.422 E.0779
G1 X127.058 Y124.086 E.14456
G1 X129.6 Y124.419 E.07879
M204 S10000
G1 X130.097 Y124.864 F42000
G1 F3960
M204 S6000
G1 X129.282 Y118.668 E.19205
G1 X126.02 Y119.097 E.10107
G1 X126.722 Y124.423 E.16504
G1 X130.038 Y124.857 E.10277
; CHANGE_LAYER
; Z_HEIGHT: 13.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X128.055 Y124.597 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 66/68
; update layer progress
M73 L66
M991 S0 P65 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z13.4 I-1.031 J-.646 P1  F42000
G1 X126.003 Y127.87 Z13.4
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4252
M204 S6000
G2 X125.981 Y127.583 I-2.194 J.023 E.00955
G1 X124.734 Y118.111 E.31693
G1 X130.268 Y117.382 E.18516
G1 X131.513 Y126.832 E.31619
G3 X131.567 Y128.602 I-9.009 J1.163 E.05884
G1 X126.063 Y127.878 E.18416
M204 S10000
G1 X126.377 Y128.33 F42000
G1 F4252
M204 S6000
G1 X131.545 Y129.01 E.17289
G1 X130.134 Y139.722 E.35839
G1 X124.578 Y138.99 E.1859
G1 X124.946 Y136.197 E.09346
G1 X125.988 Y128.278 E.26493
G1 X126.318 Y128.322 E.01102
M204 S250
G1 X126.326 Y128.718 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1560
M204 S5000
G1 X131.105 Y129.347 E.14811
G1 X129.797 Y139.282 E.30789
G1 X125.018 Y138.653 E.1481
G1 X125.335 Y136.248 E.07453
G1 X126.318 Y128.778 E.23152
M106 S201.45
; WIPE_START
M204 S6000
G1 X128.304 Y129.014 E-.76
; WIPE_END
M73 P95 R0
G1 E-.04 F1800
M204 S10000
G1 X125.945 Y136.273 Z13.6 F42000
G1 X124.914 Y139.445 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4252
M204 S6000
G1 X130.07 Y140.124 E.17252
G1 X130.026 Y140.458 E.01119
G1 X124.493 Y139.73 E.18514
G1 X124.537 Y139.395 E.0112
G1 X124.854 Y139.437 E.01063
; WIPE_START
G1 F8843.478
G1 X126.837 Y139.698 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.036 Y140.08 Z13.6 F42000
G1 Z13.2
G1 E.8 F1800
G1 F4252
M204 S6000
G1 X125.578 Y128.362 E.39207
G2 X125.577 Y127.631 I-3.846 J-.361 E.02428
G1 X124.278 Y117.76 E.33027
G1 X130.619 Y116.925 E.21216
G1 X131.917 Y126.783 E.32985
G3 X131.917 Y129.217 I-10.359 J1.217 E.0809
G1 X130.377 Y140.915 E.39139
G1 X124.095 Y140.088 E.21016
M204 S250
G1 X123.624 Y140.273 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4252
M204 S5000
G3 X123.628 Y140.172 I.213 J-.042 E.00314
G1 X125.188 Y128.32 E.36734
G2 X125.188 Y127.678 I-3.322 J-.319 E.01975
G1 X123.864 Y117.621 E.3117
G3 X124.02 Y117.399 I.194 J-.029 E.0092
G1 X130.758 Y116.511 E.20883
G3 X130.83 Y116.513 I.032 J.211 E.00224
G3 X130.982 Y116.681 I-.04 J.189 E.00745
G1 X132.306 Y126.736 E.31164
G3 X132.306 Y129.264 I-10.792 J1.264 E.07783
G1 X130.751 Y141.078 E.36616
G3 X130.529 Y141.33 I-.228 J.023 E.01156
G1 X123.792 Y140.444 E.20879
G3 X123.644 Y140.331 I.044 J-.212 E.00593
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.628 Y140.172 E-.06042
G1 X123.869 Y138.347 E-.69958
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X128.362 Y125.529 F42000
G1 Z13.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.36784
G1 F4252
M204 S6000
G1 X128.696 Y125.573 E.00891
G1 X128.006 Y120.331 E.14
G1 X127.683 Y120.373 E.0086
G1 X128.354 Y125.47 E.13611
M204 S10000
G1 X128.049 Y125.842 F42000
; LINE_WIDTH: 0.41999
G1 F4252
M204 S6000
G1 X129.103 Y125.981 E.03267
G1 X128.308 Y119.937 E.18731
G1 X127.29 Y120.071 E.03155
G1 X128.042 Y125.783 E.17701
M204 S10000
G1 X127.713 Y126.178 F42000
G1 F4252
M204 S6000
G1 X129.541 Y126.419 E.05666
G1 X128.632 Y119.514 E.214
G1 X126.867 Y119.746 E.05473
G1 X127.705 Y126.119 E.19749
M204 S10000
G1 X127.377 Y126.514 F42000
G1 F4252
M204 S6000
G1 X129.979 Y126.857 E.08064
G1 X128.957 Y119.091 E.24068
G1 X126.443 Y119.422 E.0779
G1 X127.369 Y126.455 E.21796
M204 S10000
G1 X127.041 Y126.85 F42000
G1 F4252
M204 S6000
G1 X130.402 Y127.293 E.10417
G1 X130.372 Y126.951 E.01054
G1 X129.282 Y118.668 E.25672
G1 X126.02 Y119.097 E.10107
G1 X127.033 Y126.791 E.23844
M204 S10000
G1 X126.705 Y127.186 F42000
G1 F4252
M204 S6000
G1 X130.811 Y127.727 E.12726
G1 X130.812 Y127.65 E.00235
G2 X130.746 Y126.902 I-16.661 J1.092 E.02309
G1 X129.606 Y118.245 E.26831
G1 X125.597 Y118.773 E.12424
G1 X126.697 Y127.127 E.25891
M204 S10000
G1 X126.369 Y127.522 F42000
G1 F4252
M204 S6000
G1 X131.185 Y128.157 E.14926
G2 X131.12 Y126.853 I-11.795 J-.063 E.04013
G1 X129.931 Y117.822 E.27989
G1 X125.174 Y118.448 E.14741
G1 X126.361 Y127.463 E.27939
; CHANGE_LAYER
; Z_HEIGHT: 13.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X126.1 Y125.48 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 67/68
; update layer progress
M73 L67
M991 S0 P66 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z13.6 I-1.216 J-.04 P1  F42000
G1 X126.021 Y127.872 Z13.6
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3646
M204 S6000
G1 X124.749 Y118.121 E.32619
G1 X130.257 Y117.396 E.18431
G1 X131.499 Y126.831 E.31567
G3 X131.554 Y128.601 I-9 J1.165 E.05883
G1 X126.08 Y127.88 E.18316
M204 S10000
G1 X126.377 Y128.33 F42000
G1 F3646
M204 S6000
G1 X131.545 Y129.01 E.17289
G1 X130.134 Y139.722 E.35839
G1 X124.578 Y138.99 E.1859
G1 X125.332 Y133.268 E.19144
G1 X125.988 Y128.278 E.16695
G1 X126.318 Y128.322 E.01102
M204 S250
G1 X126.326 Y128.718 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3646
M204 S5000
G1 X131.105 Y129.347 E.14811
G1 X129.797 Y139.282 E.30789
G1 X125.018 Y138.653 E.1481
G1 X125.72 Y133.319 E.16529
G1 X126.318 Y128.778 E.14075
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.304 Y129.014 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.548 Y136.132 Z13.8 F42000
G1 X124.064 Y139.964 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3646
M204 S6000
G1 X125.591 Y128.365 E.38808
G2 X125.591 Y127.635 I-3.452 J-.365 E.02424
G1 X124.292 Y117.771 E.33004
G1 X130.608 Y116.939 E.21132
G1 X131.904 Y126.783 E.32936
G3 X131.904 Y129.215 I-10.646 J1.217 E.08085
G1 X130.379 Y140.797 E.38749
G1 X124.124 Y139.971 E.2093
M204 S250
G1 X123.724 Y140.282 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3646
M204 S5000
G3 X123.673 Y139.935 I.453 J-.244 E.011
G1 X125.201 Y128.322 E.35992
G2 X125.201 Y127.678 I-2.964 J-.322 E.01981
G1 X123.877 Y117.62 E.31173
G3 X124.027 Y117.41 I.181 J-.029 E.00879
G1 X130.763 Y116.523 E.20877
G3 X130.828 Y116.525 I.026 J.207 E.00202
G3 X130.97 Y116.684 I-.04 J.178 E.00699
G1 X132.293 Y126.737 E.31156
G3 X132.293 Y129.262 I-11.086 J1.263 E.07775
G1 X130.771 Y140.823 E.35829
G3 X130.595 Y141.206 I-.458 J.021 E.01348
G3 X130.541 Y141.214 I-.043 J-.114 E.00167
G1 X123.78 Y140.322 E.20955
G1 X123.773 Y140.316 E.00027
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.668 Y140.12 E-.08446
G1 X123.673 Y139.935 E-.07051
G1 X123.88 Y138.356 E-.60502
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X124.333 Y139.478 F42000
G1 Z13.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.668976
G1 F3646
M204 S6000
G1 X130.245 Y140.258 E.30419
; WIPE_START
G1 F5750.285
G1 X128.262 Y139.996 E-.76
; WIPE_END
M73 P96 R0
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.8 I1.217 J.008 P1  F42000
G1 X128.362 Y125.533 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.358216
G1 F3646
M204 S6000
G1 X128.687 Y125.576 E.00843
G1 X127.999 Y120.339 E.13572
G1 X127.688 Y120.38 E.00806
G1 X128.354 Y125.474 E.13199
M204 S10000
G1 X128.053 Y125.842 F42000
; LINE_WIDTH: 0.41999
G1 F3646
M204 S6000
G1 X129.09 Y125.979 E.03216
G1 X128.297 Y119.951 E.18681
G1 X127.301 Y120.082 E.03085
G1 X128.045 Y125.783 E.17665
M204 S10000
G1 X127.716 Y126.179 F42000
G1 F3646
M204 S6000
G1 X129.528 Y126.417 E.05616
G1 X128.621 Y119.528 E.2135
G1 X126.879 Y119.758 E.05401
G1 X127.708 Y126.119 E.19712
M204 S10000
G1 X127.38 Y126.515 F42000
G1 F3646
M204 S6000
G1 X129.966 Y126.855 E.08016
G1 X128.946 Y119.105 E.24019
G1 X126.456 Y119.433 E.07717
G1 X127.372 Y126.455 E.21759
M204 S10000
G1 X127.043 Y126.851 F42000
G1 F3646
M204 S6000
G1 X130.389 Y127.291 E.1037
G1 X130.359 Y126.95 E.01053
G1 X129.271 Y118.682 E.25624
G1 X126.033 Y119.108 E.10033
G1 X127.035 Y126.791 E.23806
M204 S10000
G1 X126.707 Y127.187 F42000
G1 F3646
M204 S6000
G1 X130.799 Y127.725 E.12681
G1 X130.799 Y127.651 E.00229
G2 X130.733 Y126.901 I-16.97 J1.121 E.02314
G1 X129.595 Y118.259 E.26782
G1 X125.611 Y118.784 E.12349
G1 X126.699 Y127.127 E.25854
M204 S10000
G1 X126.37 Y127.523 F42000
G1 F3646
M204 S6000
G1 X131.172 Y128.155 E.14882
G2 X131.107 Y126.851 I-6.935 J-.304 E.04016
G1 X129.92 Y117.836 E.27941
G1 X125.188 Y118.459 E.14664
G1 X126.363 Y127.463 E.27901
; CHANGE_LAYER
; Z_HEIGHT: 13.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F9547.299
G1 X126.104 Y125.48 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 68/68
; update layer progress
M73 L68
M991 S0 P67 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z13.8 I-1.214 J.083 P1  F42000
G1 X126.326 Y128.718 Z13.8
G1 Z13.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4210
M204 S5000
G1 X131.105 Y129.347 E.14811
G1 X129.797 Y139.282 E.30789
G1 X125.018 Y138.653 E.14811
G1 X126.106 Y130.391 E.25605
G1 X126.318 Y128.778 E.04999
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.304 Y129.014 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.452 Y136.094 Z14 F42000
G1 X123.841 Y140.093 Z14
G1 Z13.6
G1 E.8 F1800
G1 F4210
M204 S5000
G1 X123.807 Y140.043 E.00182
G3 X123.8 Y139.903 I.381 J-.09 E.00434
G1 X125.322 Y128.34 E.35837
G2 X125.322 Y127.66 I-4.637 J-.34 E.02091
G1 X124.001 Y117.567 E.31277
G1 X124.052 Y117.531 E.00194
G1 X130.8 Y116.645 E.20913
G1 X130.833 Y116.663 E.00116
G1 X130.847 Y116.697 E.00113
G1 X132.172 Y126.754 E.31169
G3 X132.225 Y128.716 I-9.708 J1.244 E.06041
G3 X132.172 Y129.246 I-6.116 J-.344 E.01639
G1 X130.65 Y140.802 E.35813
G3 X130.556 Y140.977 I-.162 J.026 E.00656
G1 X123.9 Y140.1 E.2063
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.807 Y140.043 E-.04138
G1 X123.8 Y139.903 E-.05343
G1 X124.029 Y138.167 E-.6652
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
G1 X0 Y127.189 F18000 ; move to safe pos
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


G1 X130.521 Y140.143 F42000
G1 Z13.6
G1 E.8 F1800
; FEATURE: Top surface
G1 F4210
M204 S2000
G1 X129.974 Y140.691 E.0238
G1 X129.503 Y140.629
G1 X130.603 Y139.529 E.04781
G1 X130.684 Y138.914
G1 X129.031 Y140.567 E.07181
G1 X128.56 Y140.505
G1 X129.6 Y139.465 E.04518
G1 X129.129 Y139.403
G1 X128.089 Y140.443 E.04518
G1 X127.618 Y140.381
G1 X128.657 Y139.341 E.04518
G1 X128.186 Y139.279
G1 X127.147 Y140.318 E.04518
G1 X126.675 Y140.256
G1 X127.715 Y139.217 E.04518
G1 X127.244 Y139.155
G1 X126.204 Y140.194 E.04518
G1 X125.733 Y140.132
G1 X126.773 Y139.093 E.04517
G1 X126.301 Y139.031
G1 X125.262 Y140.07 E.04517
G1 X124.791 Y140.008
G1 X125.83 Y138.969 E.04517
G1 X125.359 Y138.907
G1 X124.319 Y139.946 E.04517
G1 X124.037 Y139.696
G1 X124.888 Y138.845 E.03699
G1 X124.849 Y138.35
G1 X124.117 Y139.082 E.03178
G1 X124.198 Y138.467
G1 X124.93 Y137.736 E.03178
G1 X125.01 Y137.122
G1 X124.279 Y137.853 E.03178
G1 X124.36 Y137.239
G1 X125.091 Y136.508 E.03178
G1 X125.172 Y135.894
G1 X124.441 Y136.625 E.03178
G1 X124.522 Y136.011
G1 X125.253 Y135.28 E.03178
G1 X125.334 Y134.666
G1 X124.602 Y135.397 E.03178
G1 X124.683 Y134.783
G1 X125.415 Y134.051 E.03178
G1 X125.496 Y133.437
G1 X124.764 Y134.169 E.03178
G1 X124.845 Y133.555
M73 P97 R0
G1 X125.576 Y132.823 E.03178
G1 X125.657 Y132.209
G1 X124.926 Y132.941 E.03178
G1 X125.007 Y132.326
G1 X125.738 Y131.595 E.03178
G1 X125.819 Y130.981
G1 X125.088 Y131.712 E.03178
G1 X125.168 Y131.098
G1 X125.9 Y130.367 E.03178
G1 X125.981 Y129.753
G1 X125.249 Y130.484 E.03178
G1 X125.33 Y129.87
G1 X126.062 Y129.139 E.03178
G1 X126.142 Y128.524
G1 X125.411 Y129.256 E.03178
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.142 Y128.524 E-.39307
G1 X126.062 Y129.139 E-.23537
G1 X125.817 Y129.383 E-.13156
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.52 Y136.057 Z14 F42000
G1 X130.765 Y138.3 Z14
G1 Z13.6
G1 E.8 F1800
G1 F4210
M204 S2000
G1 X130.04 Y139.025 E.03152
G1 X130.121 Y138.411
G1 X130.846 Y137.685 E.03154
G1 X130.928 Y137.071
G1 X130.202 Y137.797 E.03155
G1 X130.282 Y137.183
G1 X131.009 Y136.456 E.03157
G1 X131.09 Y135.842
G1 X130.363 Y136.568 E.03159
G1 X130.444 Y135.954
G1 X131.171 Y135.227 E.03161
G1 X131.253 Y134.612
G1 X130.525 Y135.34 E.03163
G1 X130.606 Y134.726
G1 X131.334 Y133.998 E.03164
G1 X131.415 Y133.383
G1 X130.687 Y134.112 E.03166
G1 X130.768 Y133.498
G1 X131.497 Y132.769 E.03168
G1 X131.578 Y132.154
G1 X130.848 Y132.884 E.0317
G1 X130.929 Y132.27
G1 X131.659 Y131.54 E.03171
G1 X131.74 Y130.925
G1 X131.01 Y131.656 E.03173
G1 X131.091 Y131.042
G1 X131.822 Y130.311 E.03175
G1 X131.903 Y129.696
G1 X131.172 Y130.427 E.03177
G1 X131.253 Y129.813
G1 X131.979 Y129.087 E.03157
G1 X132.025 Y128.507
G1 X131.333 Y129.199 E.03007
G1 X130.889 Y129.11
G1 X132.044 Y127.956 E.05016
G1 X132.021 Y127.445
G1 X130.418 Y129.048 E.06967
G1 X129.947 Y128.986
G1 X131.984 Y126.949 E.08853
G1 X131.926 Y126.474
G1 X129.476 Y128.924 E.10645
G1 X129.005 Y128.862
G1 X131.864 Y126.003 E.12423
G1 X131.801 Y125.532
G1 X128.533 Y128.8 E.14202
G1 X128.062 Y128.738
G1 X131.739 Y125.06 E.1598
G1 X131.677 Y124.589
G1 X127.591 Y128.676 E.17758
G1 X127.12 Y128.614
G1 X131.615 Y124.118 E.19536
G1 X131.553 Y123.647
G1 X126.648 Y128.552 E.21314
G1 X126.177 Y128.49
G1 X131.491 Y123.176 E.23092
G1 X131.429 Y122.704
G1 X125.492 Y128.642 E.25801
G1 X125.549 Y128.051
G1 X131.367 Y122.233 E.25282
G1 X131.305 Y121.762
G1 X125.517 Y127.55 E.25152
G1 X125.455 Y127.078
G1 X131.243 Y121.291 E.25151
G1 X131.181 Y120.819
G1 X125.394 Y126.607 E.25149
G1 X125.332 Y126.135
G1 X131.119 Y120.348 E.25148
G1 X131.057 Y119.877
G1 X125.27 Y125.664 E.25147
G1 X125.208 Y125.192
G1 X130.995 Y119.406 E.25146
G1 X130.933 Y118.935
G1 X125.147 Y124.721 E.25144
G1 X125.085 Y124.249
G1 X130.871 Y118.463 E.25143
G1 X130.809 Y117.992
G1 X125.023 Y123.778 E.25142
G1 X124.961 Y123.306
G1 X130.747 Y117.521 E.25141
G1 X130.685 Y117.05
G1 X124.9 Y122.835 E.2514
G1 X124.838 Y122.363
G1 X130.279 Y116.923 E.23643
G1 X129.665 Y117.003
G1 X124.776 Y121.892 E.21244
G1 X124.714 Y121.42
G1 X129.051 Y117.084 E.18845
G1 X128.437 Y117.164
G1 X124.653 Y120.949 E.16446
G1 X124.591 Y120.477
G1 X127.823 Y117.245 E.14047
G1 X127.209 Y117.325
G1 X124.529 Y120.006 E.11648
G1 X124.467 Y119.534
G1 X126.596 Y117.406 E.09249
G1 X125.982 Y117.487
G1 X124.406 Y119.063 E.0685
G1 X124.344 Y118.591
G1 X125.368 Y117.567 E.04451
G1 X124.754 Y117.648
G1 X124.282 Y118.12 E.02052
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.754 Y117.648 E-.25374
G1 X125.368 Y117.567 E-.23525
G1 X124.864 Y118.071 E-.27101
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.807 Y125.645 Z14 F42000
G1 X126.163 Y128.51 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0922764
G1 F4210
M204 S6000
G1 X126.027 Y128.374 E.00078
; WIPE_START
G1 F15000
G1 X126.163 Y128.51 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.418 Y129.283 Z14 F42000
G1 Z13.6
G1 E.8 F1800
; LINE_WIDTH: 0.130853
G1 F4210
M204 S6000
G1 X131.329 Y129.41 E.00111
; LINE_WIDTH: 0.108949
G1 X131.309 Y129.398 E.00012
; LINE_WIDTH: 0.0725733
G1 X131.29 Y129.386 E.00006
; WIPE_START
G1 F15000
G1 X131.309 Y129.398 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.928 Y121.776 Z14 F42000
G1 X130.683 Y116.889 Z14
G1 Z13.6
G1 E.8 F1800
; LINE_WIDTH: 0.099534
G1 F4210
M204 S6000
G1 X130.268 Y116.912 E.00192
; WIPE_START
G1 F15000
G1 X130.683 Y116.889 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.442 Y123.8 Z14 F42000
G1 X125.596 Y127.737 Z14
G1 Z13.6
G1 E.8 F1800
; LINE_WIDTH: 0.121617
G1 F4210
M204 S6000
G1 X125.517 Y127.57 E.00118
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F15000
G1 X125.596 Y127.737 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14 I1.217 J0 P1  F42000
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
G1 Z14 F900 ; lower z a little
G1 X0 Y127.189 F18000 ; move to safe pos
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

    G1 Z113.6 F600
    G1 Z111.6

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

