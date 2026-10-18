; HEADER_BLOCK_START
; BambuStudio 02.08.02.61
; model printing time: 14m 12s; total estimated time: 20m 29s
; total layer number: 75
; total filament length [mm] : 1112.37
; total filament volume [cm^3] : 2675.57
; total filament weight [g] : 3.32
; filament_density: 1.24
; filament_diameter: 1.75
; max_z_height: 15.00
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
M73 P0 R20
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
M73 P2 R19
G1 E-0.5 F300

G1 X-28.5 F30000
M73 P4 R19
G1 X-48.2 F3000
M73 P5 R19
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
M73 P6 R19
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
    
M73 P7 R18
    G1 X-48.2 F3000
    M400
    M984 A0.1 E1 S1 F5 H0.4
    M106 P1 S178
    M400 S7
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
M73 P29 R14
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
    G29 A1 X122.507 Y113 I10.9867 J30
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
M73 P30 R14
G1 E-.8 F1800
; layer num/total_layer_count: 1/75
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
; OBJECT_ID: 394
G1 X124.055 Y127.45 F42000
M204 S6000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X124.055 Y115.55 E.44323
G1 X130.355 Y115.55 E.23465
G1 X130.355 Y127.45 E.44323
G1 X124.115 Y127.45 E.23242
; WIPE_START
G1 X124.105 Y125.45 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X123.604 Y117.834 Z.6 F42000
G1 X123.424 Y115.093 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X123.424 Y114.195 E.03345
G1 X130.989 Y114.195 E.28177
G1 X130.989 Y115.093 E.03344
G1 X123.484 Y115.093 E.27953
; WIPE_START
G1 X123.424 Y114.195 E-.34205
G1 X124.524 Y114.195 E-.41795
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X124.343 Y121.825 Z.6 F42000
G1 X123.881 Y141.348 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X123.881 Y128.364 E.4836
G1 X130.532 Y128.364 E.24772
G1 X130.532 Y141.348 E.48359
G1 X123.941 Y141.348 E.24548
M204 S6000
G1 X123.424 Y141.805 F42000
G1 F3000
M204 S500
G1 X123.424 Y127.907 E.51765
G1 X130.989 Y127.907 E.28177
G1 X130.989 Y141.805 E.51764
G1 X123.484 Y141.805 E.27953
M204 S6000
G1 X122.977 Y142.262 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X122.967 Y142.188 I.283 J-.074 E.0028
G1 X122.967 Y113.812 E1.05689
G3 X122.977 Y113.738 I.291 J0 E.0028
G1 X123.385 Y113.738 E.01519
G1 X131.436 Y113.738 E.29989
G3 X131.446 Y113.814 I-.304 J.079 E.00285
G1 X131.446 Y142.186 E1.05676
G3 X131.436 Y142.262 I-.313 J-.003 E.00285
G1 X123.037 Y142.262 E.31284
; WIPE_START
G1 X122.967 Y142.188 E-.0387
G1 X122.967 Y140.29 E-.7213
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


G1 X123.511 Y127.678 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.67389
G1 F3000
M204 S500
G1 X123.511 Y115.322 E.63534
M204 S6000
M73 P31 R14
G1 X123.653 Y114.644 F42000
; LINE_WIDTH: 0.483811
G1 F3000
M204 S500
G1 X130.761 Y114.644 E.25537
M204 S6000
G1 X130.901 Y115.322 F42000
; LINE_WIDTH: 0.67693
G1 F3000
M204 S500
G1 X130.901 Y127.678 E.6384
; WIPE_START
G1 X130.901 Y125.678 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X130.349 Y129.484 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50607
G1 F6300
M204 S500
G1 X129.618 Y128.753 E.03902
G1 X128.963 Y128.753 E.02472
G1 X130.144 Y129.933 E.06301
G1 X130.144 Y130.588 E.02472
G1 X128.308 Y128.753 E.09797
G1 X127.653 Y128.753 E.02472
G1 X130.144 Y131.243 E.13292
G1 X130.144 Y131.898 E.02472
G1 X126.998 Y128.753 E.16788
G1 X126.343 Y128.753 E.02472
G1 X130.144 Y132.553 E.20284
G1 X130.144 Y133.208 E.02472
G1 X125.688 Y128.753 E.2378
G1 X125.033 Y128.753 E.02472
G1 X130.144 Y133.863 E.27276
G1 X130.144 Y134.518 E.02472
G1 X124.378 Y128.753 E.30772
G1 X124.27 Y128.753 E.00409
G1 X124.27 Y129.299 E.02063
G1 X130.144 Y135.173 E.31351
G1 X130.144 Y135.828 E.02472
G1 X124.27 Y129.954 E.31351
G1 X124.27 Y130.609 E.02472
G1 X130.144 Y136.483 E.31351
G1 X130.144 Y137.138 E.02472
G1 X124.27 Y131.264 E.31351
G1 X124.27 Y131.919 E.02472
G1 X130.144 Y137.793 E.31351
G1 X130.144 Y138.448 E.02472
G1 X124.27 Y132.574 E.31351
G1 X124.27 Y133.229 E.02472
G1 X130.144 Y139.103 E.31351
G1 X130.144 Y139.758 E.02472
G1 X124.27 Y133.884 E.31351
G1 X124.27 Y134.539 E.02472
G1 X130.144 Y140.413 E.31351
G1 X130.144 Y140.959 E.02062
G1 X130.035 Y140.959 E.0041
G1 X124.27 Y135.194 E.30771
G1 X124.27 Y135.849 E.02472
G1 X129.38 Y140.959 E.27275
G1 X128.725 Y140.959 E.02472
G1 X124.27 Y136.504 E.23779
G1 X124.27 Y137.159 E.02472
G1 X128.07 Y140.959 E.20283
G1 X127.415 Y140.959 E.02472
G1 X124.27 Y137.814 E.16788
G1 X124.27 Y138.469 E.02472
G1 X126.76 Y140.959 E.13292
G1 X126.105 Y140.96 E.02472
G1 X124.27 Y139.124 E.09796
G1 X124.27 Y139.779 E.02472
G1 X125.45 Y140.96 E.063
G1 X124.795 Y140.96 E.02472
G1 X124.064 Y140.228 E.03902
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6300
G1 X124.795 Y140.96 E-.39291
G1 X125.45 Y140.96 E-.24888
M73 P31 R13
G1 X125.23 Y140.74 E-.11821
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/75
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S201.45
; open powerlost recovery
M1003 S1
; OBJECT_ID: 394
M204 S10000
G17
G3 Z.6 I1.213 J-.099 P1  F42000
G1 X124.17 Y127.727 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6455
M204 S6000
G1 X123.778 Y127.727 E.01301
G1 X123.778 Y115.273 E.41313
G1 X130.632 Y115.273 E.22736
G1 X130.632 Y127.727 E.41313
G1 X124.23 Y127.727 E.21237
M204 S250
G1 X124.17 Y127.335 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6455
M204 S5000
G1 X124.17 Y115.665 E.35859
G1 X130.24 Y115.665 E.18651
G1 X130.24 Y127.335 E.35859
G1 X124.23 Y127.335 E.18467
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.22 Y125.335 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.717 Y117.719 Z.8 F42000
G1 X123.529 Y114.866 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6455
M204 S6000
G1 X123.529 Y114.185 E.02259
G1 X130.885 Y114.185 E.24403
G1 X130.885 Y114.866 E.02259
G1 X123.589 Y114.866 E.24204
; WIPE_START
G1 F8843.478
G1 X123.529 Y114.185 E-.25979
G1 X124.845 Y114.185 E-.50021
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.482 Y121.809 Z.8 F42000
G1 X123.529 Y141.815 Z.8
G1 Z.4
G1 E.8 F1800
G1 F6455
M204 S6000
G1 X123.529 Y128.134 E.45383
G1 X130.885 Y128.134 E.24403
G1 X130.885 Y141.815 E.45382
M73 P32 R13
G1 X123.589 Y141.815 E.24204
M204 S10000
G1 X123.121 Y142.222 F42000
G1 F6455
M204 S6000
G1 X123.121 Y113.778 E.94356
G1 X131.292 Y113.778 E.27103
G1 X131.292 Y142.222 E.94356
G1 X123.181 Y142.222 E.26904
M204 S250
G1 X122.742 Y142.383 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X122.734 Y142.303 E.00249
G1 F4800
G1 X122.731 Y141.903 E.01229
G1 X122.729 Y141.596 E.00944
G1 X122.729 Y114.404 E.83552
G1 X122.731 Y114.097 E.00943
G1 X122.734 Y113.697 E.01229
G1 F3000
G1 X122.741 Y113.621 E.00236
G1 F2760
G1 X122.759 Y113.54 E.00253
G1 F2520
G1 X122.778 Y113.49 E.00164
G1 F2280
G1 X122.798 Y113.455 E.00125
G1 F2040
G1 X122.819 Y113.428 E.00105
G1 F1920
G1 X122.861 Y113.398 E.00159
M106 S255
G1 F1800
G1 X122.876 Y113.391 E.00049
M106 S201.45
M106 S255
G1 F1680
G1 X122.892 Y113.387 E.00052
G3 X130.9 Y113.386 I4.177 J742.52 E.24607
G3 X131.524 Y113.387 I.3 J4.141 E.01918
M106 S201.45
M106 S255
G1 X131.536 Y113.39 E.00039
M106 S201.45
M106 S255
G1 F1800
G1 X131.576 Y113.411 E.00139
M106 S201.45
G1 F1920
G1 X131.595 Y113.428 E.00077
G1 F2040
G1 X131.616 Y113.454 E.00102
G1 F2280
G1 X131.636 Y113.488 E.00121
G1 F2520
G1 X131.654 Y113.537 E.00164
G1 F2640
G1 X131.665 Y113.578 E.00128
G1 F3000
G1 X131.679 Y113.687 E.00337
G1 F4800
G1 X131.682 Y114.087 E.01229
G1 X131.684 Y114.404 E.00976
G1 X131.684 Y141.596 E.83551
G1 X131.682 Y141.908 E.00961
G1 X131.68 Y142.308 E.01229
G1 F3000
G1 X131.674 Y142.367 E.00181
G1 F2880
G1 X131.67 Y142.397 E.00094
G1 F2760
G1 X131.654 Y142.464 E.00209
G1 F2400
G1 X131.636 Y142.512 E.00159
G1 F2280
G1 X131.616 Y142.546 E.00121
G1 F2040
G1 X131.596 Y142.572 E.001
G1 F1920
G1 X131.576 Y142.589 E.00078
M106 S255
G1 F1800
G1 X131.539 Y142.609 E.00129
M106 S201.45
M106 S255
G1 F1680
G1 X131.523 Y142.613 E.00051
G3 X123.516 Y142.614 I-4.181 J-785.643 E.24604
G3 X122.892 Y142.613 I-.3 J-4.07 E.01918
G1 X122.876 Y142.609 E.00053
M106 S201.45
M106 S255
G1 F1800
G1 X122.839 Y142.588 E.00129
M106 S201.45
G1 F1920
G1 X122.818 Y142.57 E.00085
G1 F2040
G1 X122.798 Y142.545 E.00099
G1 F2280
G1 X122.778 Y142.51 E.00124
G1 F2520
G1 X122.759 Y142.459 E.00166
G1 F2760
G1 X122.755 Y142.442 E.00054
; WIPE_START
M204 S6000
G1 X122.734 Y142.303 E-.05346
G1 X122.731 Y141.903 E-.152
G1 X122.729 Y141.596 E-.11678
G1 X122.729 Y140.444 E-.43776
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


G1 X129.951 Y141.652 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42361
G1 F6455
M204 S6000
G1 X130.552 Y141.051 E.02633
G1 X130.552 Y140.513 E.0167
G1 X129.583 Y141.482 E.04251
G1 X129.044 Y141.482 E.0167
G1 X130.552 Y139.975 E.06613
G1 X130.552 Y139.436 E.0167
G1 X128.506 Y141.482 E.08975
G1 X127.968 Y141.482 E.0167
G1 X130.552 Y138.898 E.11337
G1 X130.552 Y138.359 E.0167
G1 X127.429 Y141.482 E.13699
G1 X126.891 Y141.482 E.0167
G1 X130.552 Y137.821 E.16061
G1 X130.552 Y137.283 E.0167
G1 X126.352 Y141.482 E.18423
G1 X125.814 Y141.482 E.0167
G1 X130.552 Y136.744 E.20785
G1 X130.552 Y136.206 E.0167
G1 X125.276 Y141.482 E.23147
G1 X124.737 Y141.482 E.0167
G1 X130.552 Y135.668 E.25509
G1 X130.552 Y135.129 E.0167
G1 X124.199 Y141.482 E.27871
G1 X123.862 Y141.482 E.01046
G1 X123.862 Y141.281 E.00624
G1 X130.552 Y134.591 E.29349
G1 X130.552 Y134.052 E.0167
G1 X123.862 Y140.742 E.29349
G1 X123.862 Y140.204 E.0167
G1 X130.552 Y133.514 E.29349
G1 X130.552 Y132.976 E.0167
G1 X123.862 Y139.666 E.29349
G1 X123.862 Y139.127 E.0167
G1 X130.552 Y132.437 E.29349
G1 X130.552 Y131.899 E.0167
G1 X123.862 Y138.589 E.29349
G1 X123.862 Y138.05 E.0167
G1 X130.552 Y131.361 E.29349
G1 X130.552 Y130.822 E.0167
G1 X123.862 Y137.512 E.29349
G1 X123.862 Y136.974 E.0167
G1 X130.552 Y130.284 E.29349
G1 X130.552 Y129.745 E.0167
G1 X123.862 Y136.435 E.29349
G1 X123.862 Y135.897 E.0167
G1 X130.552 Y129.207 E.29349
G1 X130.552 Y128.669 E.0167
G1 X123.862 Y135.359 E.29349
G1 X123.862 Y134.82 E.0167
G1 X130.215 Y128.467 E.2787
G1 X129.676 Y128.467 E.0167
G1 X123.862 Y134.282 E.25509
G1 X123.862 Y133.743 E.0167
G1 X129.138 Y128.467 E.23147
G1 X128.6 Y128.467 E.0167
G1 X123.862 Y133.205 E.20785
G1 X123.862 Y132.667 E.0167
G1 X128.061 Y128.467 E.18423
G1 X127.523 Y128.467 E.0167
G1 X123.862 Y132.128 E.16061
G1 X123.862 Y131.59 E.0167
G1 X126.984 Y128.467 E.13699
G1 X126.446 Y128.467 E.0167
G1 X123.862 Y131.052 E.11337
G1 X123.862 Y130.513 E.0167
G1 X125.908 Y128.467 E.08975
G1 X125.369 Y128.467 E.0167
G1 X123.862 Y129.975 E.06613
G1 X123.862 Y129.436 E.0167
G1 X124.831 Y128.467 E.04251
G1 X124.292 Y128.467 E.0167
G1 X123.692 Y129.068 E.02634
; WIPE_START
G1 F9456.513
G1 X124.292 Y128.467 E-.32263
G1 X124.831 Y128.467 E-.20458
G1 X124.398 Y128.901 E-.23278
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.45 Y127.93 Z.8 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.29254
G1 F6455
M204 S6000
G1 X123.45 Y115.069 E.2616
M204 S10000
G1 X123.732 Y114.525 F42000
; LINE_WIDTH: 0.316912
G1 F6455
M204 S6000
G1 X130.681 Y114.525 E.15516
M204 S10000
G1 X130.962 Y115.069 F42000
; LINE_WIDTH: 0.29563
G1 F6455
M204 S6000
G1 X130.962 Y127.93 E.26484
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F14245.578
G1 X130.962 Y125.93 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/75
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z.8 I-.311 J-1.177 P1  F42000
G1 X124.17 Y127.727 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5734
M204 S6000
G1 X123.778 Y127.727 E.01301
G1 X123.778 Y115.273 E.41313
G1 X130.632 Y115.273 E.22736
G1 X130.632 Y127.727 E.41313
G1 X124.23 Y127.727 E.21237
M204 S250
G1 X124.17 Y127.335 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5734
M204 S5000
G1 X124.17 Y115.665 E.35859
G1 X130.24 Y115.665 E.18651
G1 X130.24 Y127.335 E.35859
G1 X124.23 Y127.335 E.18467
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.22 Y125.335 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.184 Y117.703 Z1 F42000
G1 X124.17 Y114.866 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5734
M204 S6000
G1 X123.517 Y114.866 E.02169
G1 X123.517 Y114.068 E.02648
G1 X130.899 Y114.068 E.24488
G1 X130.899 Y114.866 E.02648
G1 X124.23 Y114.866 E.2212
; WIPE_START
G1 F8843.478
G1 X123.517 Y114.866 E-.27122
G1 X123.517 Y114.068 E-.3033
G1 X124.005 Y114.068 E-.18548
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.871 Y121.699 Z1 F42000
G1 X123.517 Y141.932 Z1
G1 Z.6
G1 E.8 F1800
G1 F5734
M204 S6000
G1 X123.517 Y128.134 E.45771
G1 X130.899 Y128.134 E.24488
G1 X130.899 Y141.932 E.45772
G1 X123.577 Y141.932 E.2429
M204 S10000
G1 X123.109 Y142.339 F42000
G1 F5734
M204 S6000
G1 X123.109 Y113.661 E.95133
G1 X131.306 Y113.661 E.27189
G1 X131.306 Y142.34 E.95133
G1 X123.169 Y142.339 E.26991
M204 S250
G1 X122.888 Y142.73 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5734
M204 S5000
G1 X122.849 Y142.719 E.00122
G1 X122.805 Y142.693 E.00159
G1 X122.781 Y142.669 E.00102
G1 X122.763 Y142.647 E.00087
G1 X122.748 Y142.62 E.00096
G1 X122.736 Y142.59 E.00099
G1 X122.724 Y142.538 E.00164
G1 X122.72 Y142.511 E.00085
G1 X122.718 Y142.462 E.00148
G1 X122.718 Y113.538 E.88877
G1 X122.72 Y113.489 E.0015
G1 X122.724 Y113.457 E.00101
G1 X122.736 Y113.411 E.00146
G1 X122.748 Y113.38 E.001
G1 X122.764 Y113.352 E.00098
G1 X122.781 Y113.331 E.00086
G1 X122.803 Y113.308 E.00097
G1 X122.847 Y113.281 E.00157
G1 X122.888 Y113.27 E.00131
G1 F5700
G3 X130.903 Y113.269 I4.173 J781.246 E.24627
G3 X131.53 Y113.27 I.3 J5.075 E.01929
M73 P33 R13
G1 F5734
G1 X131.595 Y113.294 E.00211
G1 X131.612 Y113.306 E.00064
G1 X131.635 Y113.328 E.00099
G1 X131.654 Y113.352 E.00095
G1 X131.668 Y113.377 E.00085
G1 X131.679 Y113.405 E.00093
G1 X131.691 Y113.457 E.00165
G1 X131.698 Y113.539 E.00254
G1 X131.698 Y113.542 E.00007
G1 X131.696 Y142.466 E.88875
G1 X131.695 Y142.52 E.00167
G1 X131.69 Y142.558 E.00118
G1 X131.681 Y142.592 E.00109
G1 X131.668 Y142.623 E.00104
G1 X131.653 Y142.65 E.00095
G1 X131.635 Y142.672 E.00087
G1 X131.616 Y142.691 E.00083
G1 X131.595 Y142.706 E.00078
G1 X131.53 Y142.73 E.00212
G1 F5700
G3 X123.515 Y142.731 I-4.153 J-737.537 E.24626
G3 X122.948 Y142.733 I-.3 J-5.115 E.01745
; WIPE_START
M204 S6000
G1 X122.849 Y142.719 E-.03773
G1 X122.805 Y142.693 E-.01968
G1 X122.781 Y142.669 E-.01267
G1 X122.763 Y142.647 E-.01082
G1 X122.748 Y142.62 E-.01193
G1 X122.736 Y142.59 E-.01221
G1 X122.724 Y142.538 E-.02031
G1 X122.72 Y142.511 E-.01056
G1 X122.718 Y142.462 E-.01836
G1 X122.718 Y140.868 E-.60574
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
G1 X124.456 Y141.769 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42627
G1 F5734
M204 S6000
G1 X123.85 Y141.163 E.02677
G1 X123.85 Y140.621 E.01694
G1 X124.828 Y141.599 E.04323
G1 X125.37 Y141.599 E.01694
G1 X123.85 Y140.078 E.06718
G1 X123.85 Y139.536 E.01694
G1 X125.913 Y141.599 E.09113
G1 X126.455 Y141.599 E.01694
G1 X123.85 Y138.994 E.11508
G1 X123.85 Y138.452 E.01694
G1 X126.997 Y141.599 E.13903
G1 X127.539 Y141.599 E.01694
G1 X123.85 Y137.91 E.16298
G1 X123.85 Y137.368 E.01694
G1 X128.081 Y141.599 E.18693
G1 X128.623 Y141.599 E.01694
G1 X123.85 Y136.826 E.21088
G1 X123.85 Y136.283 E.01694
G1 X129.165 Y141.599 E.23484
G1 X129.708 Y141.599 E.01694
G1 X123.85 Y135.741 E.25879
G1 X123.85 Y135.199 E.01694
G1 X130.25 Y141.599 E.28274
G1 X130.566 Y141.599 E.00987
G1 X130.566 Y141.373 E.00707
G1 X123.85 Y134.657 E.29669
G1 X123.85 Y134.115 E.01694
G1 X130.566 Y140.831 E.29669
G1 X130.566 Y140.289 E.01694
G1 X123.85 Y133.573 E.29669
G1 X123.85 Y133.031 E.01694
G1 X130.566 Y139.746 E.29669
G1 X130.566 Y139.204 E.01694
G1 X123.85 Y132.488 E.29669
G1 X123.85 Y131.946 E.01694
G1 X130.566 Y138.662 E.29669
G1 X130.566 Y138.12 E.01694
G1 X123.85 Y131.404 E.29669
G1 X123.85 Y130.862 E.01694
G1 X130.566 Y137.578 E.29669
G1 X130.566 Y137.036 E.01694
G1 X123.85 Y130.32 E.29669
G1 X123.85 Y129.778 E.01694
G1 X130.566 Y136.494 E.29669
G1 X130.566 Y135.951 E.01694
G1 X123.85 Y129.236 E.29669
G1 X123.85 Y128.693 E.01694
G1 X130.566 Y135.409 E.29669
G1 X130.566 Y134.867 E.01694
G1 X124.166 Y128.467 E.28273
G1 X124.708 Y128.467 E.01694
G1 X130.566 Y134.325 E.25878
G1 X130.566 Y133.783 E.01694
G1 X125.25 Y128.467 E.23483
G1 X125.792 Y128.467 E.01694
G1 X130.566 Y133.241 E.21088
G1 X130.566 Y132.699 E.01694
G1 X126.334 Y128.467 E.18693
G1 X126.876 Y128.467 E.01694
G1 X130.566 Y132.156 E.16297
G1 X130.566 Y131.614 E.01694
G1 X127.419 Y128.467 E.13902
G1 X127.961 Y128.467 E.01694
G1 X130.566 Y131.072 E.11507
G1 X130.566 Y130.53 E.01694
G1 X128.503 Y128.467 E.09112
G1 X129.045 Y128.467 E.01694
G1 X130.566 Y129.988 E.06717
G1 X130.566 Y129.446 E.01694
G1 X129.587 Y128.467 E.04322
G1 X130.129 Y128.467 E.01694
G1 X130.735 Y129.073 E.02677
; WIPE_START
G1 F9390.895
G1 X130.129 Y128.467 E-.32561
G1 X129.587 Y128.467 E-.20601
G1 X130.012 Y128.892 E-.22838
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.969 Y127.93 Z1 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.309332
G1 F5734
M204 S6000
G1 X130.969 Y115.069 E.2792
M204 S10000
G1 X130.695 Y114.467 F42000
; LINE_WIDTH: 0.434011
G1 F5734
M204 S6000
G1 X123.72 Y114.467 E.22229
M204 S10000
G1 X123.444 Y115.069 F42000
; LINE_WIDTH: 0.30458
G1 F5734
M204 S6000
G1 X123.444 Y127.93 E.27422
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F13758.313
G1 X123.444 Y125.93 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/75
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z1 I-1.206 J.161 P1  F42000
G1 X123.695 Y127.81 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5249
M204 S5000
G1 X123.695 Y115.19 E.38778
G1 X130.715 Y115.19 E.21571
G1 X130.715 Y127.81 E.38778
G1 X123.755 Y127.81 E.21386
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.746 Y125.81 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.594 Y118.179 Z1.2 F42000
G1 X123.519 Y114.391 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5249
M204 S6000
G1 X123.519 Y114.016 E.01245
G1 X130.901 Y114.016 E.24489
G1 X130.901 Y114.391 E.01245
G1 X123.579 Y114.391 E.2429
M204 S10000
G1 X123.111 Y114.798 F42000
G1 F5249
M204 S6000
G1 X123.111 Y113.608 E.03946
G1 X131.308 Y113.609 E.2719
G1 X131.308 Y114.798 E.03945
G1 X123.171 Y114.798 E.26991
; WIPE_START
G1 F8843.478
G1 X123.111 Y113.608 E-.45257
G1 X123.921 Y113.608 E-.30743
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.812 Y121.24 Z1.2 F42000
G1 X123.519 Y141.985 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F5249
M204 S6000
G1 X123.519 Y128.609 E.44369
G1 X130.901 Y128.609 E.2449
G1 X130.901 Y141.984 E.44368
G1 X123.579 Y141.985 E.24291
M204 S10000
G1 X123.111 Y142.392 F42000
G1 F5249
M204 S6000
G1 X123.111 Y128.202 E.47069
G1 X131.308 Y128.202 E.2719
G1 X131.308 Y142.391 E.47069
G1 X123.171 Y142.392 E.26992
M204 S250
G1 X122.891 Y142.775 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5249
M204 S5000
G1 X122.805 Y142.749 E.00278
G1 X122.776 Y142.726 E.00113
G1 X122.76 Y142.706 E.00077
G1 X122.735 Y142.663 E.00154
G3 X122.719 Y142.575 I.242 J-.088 E.00277
G1 X122.719 Y113.425 E.89568
G3 X122.761 Y113.293 I.193 J-.012 E.00435
G3 X122.801 Y113.253 I.136 J.098 E.00175
G1 X122.827 Y113.237 E.00093
G1 X122.863 Y113.224 E.0012
G3 X122.918 Y113.216 I.05 J.167 E.00173
G1 X130.901 Y113.216 E.24529
G1 X131.501 Y113.217 E.01844
G3 X131.581 Y113.233 I.004 J.183 E.00251
G3 X131.643 Y113.273 I-.056 J.155 E.0023
G1 X131.666 Y113.301 E.00112
G3 X131.7 Y113.423 I-.185 J.118 E.00394
G1 X131.701 Y142.505 E.89362
G3 X131.665 Y142.7 I-.28 J.05 E.00623
G1 X131.641 Y142.73 E.00117
G1 X131.626 Y142.743 E.00062
G3 X131.502 Y142.784 I-.14 J-.22 E.00403
G1 X130.902 Y142.784 E.01844
G1 X122.95 Y142.784 E.24436
; WIPE_START
G1 F9547.055
M204 S6000
G1 X122.805 Y142.749 E-.05677
G1 X122.776 Y142.726 E-.014
G1 X122.76 Y142.706 E-.0095
G1 X122.735 Y142.663 E-.01908
G1 X122.719 Y142.575 E-.03406
G1 X122.719 Y140.926 E-.6266
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


G1 X129.957 Y141.821 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42882
G1 F5249
M204 S6000
G1 X130.568 Y141.21 E.02719
G1 X130.568 Y140.664 E.01716
G1 X129.581 Y141.651 E.04391
G1 X129.035 Y141.651 E.01716
G1 X130.568 Y140.118 E.06818
M73 P34 R13
G1 X130.568 Y139.572 E.01716
G1 X128.489 Y141.651 E.09245
G1 X127.943 Y141.651 E.01716
G1 X130.568 Y139.027 E.11672
G1 X130.568 Y138.481 E.01716
G1 X127.398 Y141.651 E.14099
G1 X126.852 Y141.651 E.01716
G1 X130.568 Y137.935 E.16526
G1 X130.568 Y137.389 E.01716
G1 X126.306 Y141.651 E.18953
G1 X125.76 Y141.651 E.01716
G1 X130.568 Y136.844 E.2138
G1 X130.568 Y136.298 E.01716
G1 X125.215 Y141.651 E.23807
G1 X124.669 Y141.651 E.01716
G1 X130.568 Y135.752 E.26234
G1 X130.568 Y135.206 E.01716
G1 X124.123 Y141.651 E.28661
G1 X123.852 Y141.651 E.00853
G1 X123.852 Y141.377 E.00863
G1 X130.568 Y134.661 E.29868
G1 X130.568 Y134.115 E.01716
G1 X123.852 Y140.831 E.29868
G1 X123.852 Y140.285 E.01716
G1 X130.568 Y133.569 E.29868
G1 X130.568 Y133.023 E.01716
G1 X123.852 Y139.74 E.29868
G1 X123.852 Y139.194 E.01716
G1 X130.568 Y132.478 E.29868
G1 X130.568 Y131.932 E.01716
G1 X123.852 Y138.648 E.29868
G1 X123.852 Y138.102 E.01716
G1 X130.568 Y131.386 E.29868
G1 X130.568 Y131.12 E.00837
G1 X130.288 Y131.12 E.00879
G1 X123.852 Y137.557 E.28624
G1 X123.852 Y137.011 E.01716
G1 X129.743 Y131.12 E.26197
G1 X129.197 Y131.12 E.01716
G1 X123.852 Y136.465 E.2377
G1 X123.852 Y135.919 E.01716
G1 X128.651 Y131.12 E.21343
G1 X128.105 Y131.12 E.01716
G1 X123.852 Y135.374 E.18916
G1 X123.852 Y134.828 E.01716
G1 X127.56 Y131.12 E.16489
G1 X127.014 Y131.12 E.01716
G1 X123.852 Y134.282 E.14062
G1 X123.852 Y133.736 E.01716
G1 X126.468 Y131.12 E.11635
G1 X125.922 Y131.12 E.01716
G1 X123.852 Y133.191 E.09208
G1 X123.852 Y132.645 E.01716
G1 X125.377 Y131.12 E.06781
G1 X124.831 Y131.12 E.01716
G1 X123.852 Y132.099 E.04354
G1 X123.852 Y131.553 E.01716
G1 X124.455 Y130.95 E.02682
; WIPE_START
G1 F9328.842
G1 X123.852 Y131.553 E-.32406
G1 X123.852 Y132.099 E-.20738
G1 X124.277 Y131.674 E-.22856
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.207 Y128.006 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.62667
G1 F5249
M204 S6000
G1 X123.207 Y114.994 E.61895
M204 S10000
G1 X131.208 Y114.994 F42000
; LINE_WIDTH: 0.635923
G1 F5249
M204 S6000
G1 X131.208 Y128.006 E.62876
; WIPE_START
G1 F6070.796
G1 X131.208 Y126.006 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.153 Y130.913 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5249
M204 S2000
G1 X130.679 Y130.387 E.02285
G1 X130.679 Y129.854
G1 X129.62 Y130.913 E.04602
G1 X129.087 Y130.913
G1 X130.679 Y129.32 E.06919
G1 X130.635 Y128.832
G1 X128.553 Y130.913 E.09044
G1 X128.02 Y130.913
G1 X130.101 Y128.832 E.09044
G1 X129.568 Y128.832
G1 X127.487 Y130.913 E.09044
G1 X126.954 Y130.913
G1 X129.035 Y128.832 E.09044
G1 X128.502 Y128.832
G1 X126.42 Y130.913 E.09044
G1 X125.887 Y130.913
G1 X127.968 Y128.832 E.09044
G1 X127.435 Y128.832
G1 X125.354 Y130.913 E.09044
G1 X124.821 Y130.913
G1 X126.902 Y128.832 E.09044
G1 X126.369 Y128.832
G1 X124.287 Y130.913 E.09044
G1 X123.755 Y130.912
G1 X125.835 Y128.832 E.0904
G1 X125.302 Y128.832
G1 X123.741 Y130.393 E.06784
G1 X123.741 Y129.859
G1 X124.769 Y128.832 E.04466
G1 X124.235 Y128.832
G1 X123.741 Y129.326 E.02149
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.235 Y128.832 E-.26577
G1 X124.769 Y128.832 E-.20264
G1 X124.226 Y129.374 E-.29159
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/75
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z1.2 I1.114 J-.49 P1  F42000
G1 X123.595 Y127.94 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
G1 F4970
M204 S5000
G1 X130.815 Y127.94 E.22185
G1 X130.815 Y129.16 E.03749
G1 X123.595 Y129.16 E.22185
G1 X123.595 Y128 E.03564
M204 S250
G1 X123.695 Y127.81 F42000
G1 F4970
M204 S5000
G1 X123.695 Y115.19 E.38778
G1 X130.715 Y115.19 E.21571
G1 X130.715 Y127.81 E.38778
G1 X123.755 Y127.81 E.21386
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.746 Y125.81 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.639 Y118.178 Z1.4 F42000
G1 X123.595 Y115.06 Z1.4
G1 Z1
G1 E.8 F1800
G1 F4970
M204 S5000
G1 X123.595 Y113.84 E.03749
G1 X130.815 Y113.84 E.22185
G1 X130.815 Y115.06 E.03749
G1 X123.655 Y115.06 E.22001
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.595 Y113.84 E-.46416
G1 X124.374 Y113.84 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.143 Y121.469 Z1.4 F42000
G1 X123.523 Y141.991 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4970
M204 S6000
G1 X123.523 Y129.959 E.39911
G1 X130.907 Y129.959 E.24492
G1 X130.907 Y141.99 E.3991
G1 X123.583 Y141.991 E.24293
M204 S10000
G1 X123.116 Y142.398 F42000
G1 F4970
M204 S6000
G1 X123.116 Y129.552 E.42612
G1 X131.314 Y129.552 E.27192
G1 X131.314 Y142.398 E.42611
G1 X123.176 Y142.398 E.26993
M204 S250
G1 X122.866 Y142.783 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4970
M204 S5000
G3 X122.724 Y142.591 I.061 J-.193 E.00786
G1 X122.724 Y113.407 E.89672
G3 X122.908 Y113.21 I.199 J.002 E.00908
G1 X131.552 Y113.215 E.26562
G3 X131.706 Y113.41 I-.041 J.19 E.0083
G1 X131.699 Y142.648 E.89839
G3 X131.519 Y142.79 I-.188 J-.054 E.00752
G1 X122.926 Y142.783 E.26404
; WIPE_START
G1 F9547.055
M204 S6000
G1 X122.761 Y142.712 E-.06819
G1 X122.724 Y142.591 E-.04814
G1 X122.724 Y140.897 E-.64366
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


G1 X123.687 Y141.058 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42346
G1 F4970
M204 S6000
G1 X124.287 Y141.658 E.02631
G1 X124.825 Y141.658 E.01669
G1 X123.857 Y140.689 E.04247
G1 X123.857 Y140.151 E.01669
G1 X125.363 Y141.657 E.06607
G1 X125.901 Y141.657 E.01669
G1 X123.857 Y139.613 E.08967
G1 X123.857 Y139.075 E.01669
G1 X126.44 Y141.657 E.11327
G1 X126.978 Y141.657 E.01669
G1 X123.857 Y138.536 E.13687
G1 X123.857 Y137.998 E.01669
G1 X127.516 Y141.657 E.16047
G1 X128.054 Y141.657 E.01669
G1 X123.857 Y137.46 E.18407
G1 X123.857 Y136.922 E.01669
G1 X128.592 Y141.657 E.20767
G1 X129.13 Y141.657 E.01669
G1 X123.857 Y136.384 E.23127
G1 X123.857 Y135.846 E.01669
G1 X129.668 Y141.657 E.25487
G1 X130.207 Y141.657 E.01669
G1 X123.857 Y135.307 E.27846
G1 X123.857 Y134.769 E.01669
G1 X130.573 Y141.486 E.29455
M73 P35 R13
G1 X130.573 Y140.948 E.01669
G1 X123.857 Y134.231 E.29455
G1 X123.857 Y133.693 E.01669
G1 X130.573 Y140.41 E.29455
G1 X130.573 Y139.871 E.01669
G1 X123.857 Y133.155 E.29455
G1 X123.857 Y132.617 E.01669
G1 X130.573 Y139.333 E.29455
G1 X130.573 Y138.795 E.01669
G1 X123.857 Y132.078 E.29455
G1 X123.857 Y131.54 E.01669
G1 X130.573 Y138.257 E.29455
G1 X130.573 Y137.719 E.01669
G1 X123.857 Y131.002 E.29455
G1 X123.857 Y130.464 E.01669
G1 X130.573 Y137.181 E.29455
G1 X130.573 Y136.642 E.01669
G1 X124.223 Y130.292 E.27847
G1 X124.762 Y130.292 E.01669
G1 X130.573 Y136.104 E.25487
G1 X130.573 Y135.566 E.01669
G1 X125.3 Y130.292 E.23127
G1 X125.838 Y130.292 E.01669
G1 X130.573 Y135.028 E.20767
G1 X130.573 Y134.49 E.01669
G1 X126.376 Y130.292 E.18407
G1 X126.914 Y130.292 E.01669
G1 X130.573 Y133.952 E.16047
G1 X130.573 Y133.413 E.01669
G1 X127.452 Y130.292 E.13687
G1 X127.99 Y130.292 E.01669
G1 X130.573 Y132.875 E.11327
G1 X130.573 Y132.337 E.01669
G1 X128.529 Y130.292 E.08967
G1 X129.067 Y130.292 E.01669
G1 X130.573 Y131.799 E.06607
G1 X130.573 Y131.261 E.01669
G1 X129.605 Y130.292 E.04247
G1 X130.143 Y130.292 E.01669
G1 X130.743 Y130.892 E.02631
; WIPE_START
G1 F9460.24
G1 X130.143 Y130.292 E-.32241
G1 X129.605 Y130.292 E-.2045
G1 X130.039 Y130.726 E-.23309
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.261 Y129.356 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.54143
G1 F4970
M204 S6000
G1 X131.261 Y127.744 E.06548
; LINE_WIDTH: 0.55809
G1 X131.244 Y127.67 E.0032
; LINE_WIDTH: 0.59143
G1 X131.227 Y127.595 E.00341
; LINE_WIDTH: 0.62477
G1 X131.211 Y127.521 E.00362
; LINE_WIDTH: 0.616512
G1 X131.173 Y127.544 E.00206
; LINE_WIDTH: 0.5667
G1 X131.136 Y127.567 E.00188
; LINE_WIDTH: 0.516888
G1 X131.098 Y127.59 E.0017
; LINE_WIDTH: 0.467076
G1 X131.061 Y127.613 E.00152
; LINE_WIDTH: 0.417263
G1 X131.023 Y127.636 E.00134
; LINE_WIDTH: 0.367451
G1 X130.986 Y127.66 E.00116
; LINE_WIDTH: 0.317639
G1 X130.949 Y127.683 E.00098
; LINE_WIDTH: 0.267827
G1 X130.911 Y127.706 E.00081
M204 S10000
G1 X131.211 Y127.521 F42000
; LINE_WIDTH: 0.64143
G1 F4970
M204 S6000
G1 X131.211 Y115.479 E.58727
M204 S10000
G1 X130.911 Y115.294 F42000
; LINE_WIDTH: 0.267827
G1 F4970
M204 S6000
G1 X130.949 Y115.317 E.00081
; LINE_WIDTH: 0.317639
G1 X130.986 Y115.34 E.00098
; LINE_WIDTH: 0.367452
G1 X131.023 Y115.364 E.00116
; LINE_WIDTH: 0.417264
G1 X131.061 Y115.387 E.00134
; LINE_WIDTH: 0.467077
G1 X131.098 Y115.41 E.00152
; LINE_WIDTH: 0.516889
G1 X131.136 Y115.433 E.0017
; LINE_WIDTH: 0.566702
G1 X131.173 Y115.456 E.00188
; LINE_WIDTH: 0.616514
G1 X131.211 Y115.479 E.00206
; LINE_WIDTH: 0.616424
G1 X131.236 Y115.368 E.00535
; LINE_WIDTH: 0.543098
G1 X131.261 Y115.256 E.00466
G1 X131.261 Y113.655 E.06524
; LINE_WIDTH: 0.530077
G1 X131.249 Y113.644 E.00064
; LINE_WIDTH: 0.494947
G1 X131.202 Y113.62 E.00196
; LINE_WIDTH: 0.447361
G1 X131.154 Y113.596 E.00175
; LINE_WIDTH: 0.399774
G1 X131.106 Y113.573 E.00155
; LINE_WIDTH: 0.352188
G1 X131.059 Y113.549 E.00134
; LINE_WIDTH: 0.280782
G1 X131.011 Y113.525 E.00103
G1 X123.399 Y113.525 E.14754
; LINE_WIDTH: 0.304167
G1 X123.352 Y113.549 E.00113
; LINE_WIDTH: 0.35166
G1 X123.304 Y113.573 E.00134
; LINE_WIDTH: 0.399153
G1 X123.257 Y113.596 E.00154
; LINE_WIDTH: 0.446646
G1 X123.209 Y113.62 E.00175
; LINE_WIDTH: 0.494139
G1 X123.162 Y113.644 E.00195
; LINE_WIDTH: 0.521797
G1 X123.16 Y115.256 E.06291
; LINE_WIDTH: 0.5468
G1 X123.185 Y115.365 E.00461
; LINE_WIDTH: 0.5968
G1 X123.21 Y115.475 E.00507
; LINE_WIDTH: 0.621717
G1 X123.21 Y127.525 E.56835
G1 X123.246 Y127.548 E.00201
; LINE_WIDTH: 0.55076
G1 X123.282 Y127.571 E.00177
; LINE_WIDTH: 0.5034
G1 X123.318 Y127.593 E.0016
; LINE_WIDTH: 0.45604
G1 X123.354 Y127.616 E.00144
; LINE_WIDTH: 0.40868
G1 X123.391 Y127.639 E.00127
; LINE_WIDTH: 0.36132
G1 X123.427 Y127.661 E.00111
; LINE_WIDTH: 0.31396
G1 X123.463 Y127.684 E.00094
; LINE_WIDTH: 0.2666
G1 X123.499 Y127.707 E.00078
M204 S10000
G1 X123.21 Y127.525 F42000
; LINE_WIDTH: 0.596797
G1 F4970
M204 S6000
G1 X123.185 Y127.635 E.00507
; LINE_WIDTH: 0.523428
G1 X123.16 Y127.744 E.00439
G1 X123.16 Y129.356 E.06312
M204 S10000
G1 X123.21 Y115.475 F42000
; LINE_WIDTH: 0.598116
G1 F4970
M204 S6000
G1 X123.246 Y115.452 E.00193
; LINE_WIDTH: 0.550756
G1 X123.282 Y115.429 E.00177
; LINE_WIDTH: 0.503397
G1 X123.318 Y115.407 E.0016
; LINE_WIDTH: 0.456038
G1 X123.354 Y115.384 E.00144
; LINE_WIDTH: 0.408678
G1 X123.391 Y115.361 E.00127
; LINE_WIDTH: 0.361319
G1 X123.427 Y115.339 E.00111
; LINE_WIDTH: 0.313959
G1 X123.463 Y115.316 E.00094
; LINE_WIDTH: 0.2666
G1 X123.499 Y115.293 E.00078
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X123.463 Y115.316 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/75
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z1.4 I-1.075 J.571 P1  F42000
G1 X130.815 Y129.16 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3241
M204 S5000
G1 X123.595 Y129.16 E.22185
G1 X123.595 Y127.94 E.03749
G1 X130.815 Y127.94 E.22185
G1 X130.815 Y129.1 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.815 Y129.117 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.695 Y127.81 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
G1 F3241
M204 S5000
G1 X123.695 Y115.19 E.38778
G1 X130.715 Y115.19 E.21571
G1 X130.715 Y127.81 E.38778
G1 X123.755 Y127.81 E.21386
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.746 Y125.81 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.639 Y118.178 Z1.6 F42000
G1 X123.595 Y115.06 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F3241
M204 S5000
G1 X123.595 Y113.84 E.03749
G1 X130.815 Y113.84 E.22185
G1 X130.815 Y115.06 E.03749
G1 X123.655 Y115.06 E.22001
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.595 Y113.84 E-.46416
G1 X124.374 Y113.84 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.145 Y121.469 Z1.6 F42000
G1 X123.531 Y141.991 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3241
M204 S6000
G1 X123.531 Y129.959 E.39911
G1 X130.914 Y129.959 E.24493
G1 X130.914 Y141.99 E.3991
G1 X123.591 Y141.991 E.24294
M204 S10000
G1 X123.124 Y142.398 F42000
G1 F3241
M204 S6000
G1 X123.124 Y129.552 E.42612
G1 X131.322 Y129.552 E.27194
G1 X131.322 Y142.398 E.42611
G1 X123.184 Y142.398 E.26995
M204 S250
G1 X122.874 Y142.783 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3241
M204 S5000
G3 X122.732 Y142.59 I.061 J-.193 E.00789
G1 X122.732 Y113.408 E.89669
G3 X122.915 Y113.21 I.196 J-.001 E.00913
G1 X131.56 Y113.215 E.26562
G3 X131.714 Y113.41 I-.041 J.19 E.0083
G1 X131.707 Y142.648 E.89839
G3 X131.527 Y142.79 I-.188 J-.054 E.00752
G1 X122.934 Y142.783 E.26404
; WIPE_START
G1 F9547.055
M204 S6000
G1 X122.769 Y142.711 E-.06848
G1 X122.732 Y142.59 E-.0482
G1 X122.732 Y140.897 E-.64333
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


G1 X123.905 Y141.643 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3241
M204 S6000
G1 X123.879 Y140.04 E.05315
G1 X124.069 Y139.904 E.00775
G3 X126.035 Y139.212 I1.521 J1.184 E.07303
G1 X126.69 Y139.682 E.02674
G2 X128.655 Y140.374 I1.521 J-1.184 E.07303
G2 X129.966 Y139.34 I-5.127 J-7.846 E.05544
G1 X130.566 Y139.151 E.02089
G1 X130.566 Y136.52 E.08728
G1 X129.966 Y136.591 E.02007
G1 X129.31 Y137.061 E.02674
G3 X127.345 Y137.753 I-1.521 J-1.184 E.07303
G1 X126.69 Y137.284 E.02674
G2 X124.724 Y136.591 I-1.521 J1.184 E.07303
G2 X123.879 Y137.225 I3.118 J5.043 E.03507
G1 X123.879 Y134.799 E.08046
G1 X124.069 Y134.663 E.00775
G3 X126.035 Y133.971 I1.521 J1.184 E.07303
G1 X126.69 Y134.44 E.02674
G2 X128.655 Y135.132 I1.521 J-1.184 E.07303
G2 X129.966 Y134.099 I-5.127 J-7.846 E.05544
G1 X130.566 Y133.91 E.02089
G1 X130.566 Y131.279 E.08728
G1 X129.966 Y131.35 E.02007
G1 X129.31 Y131.82 E.02674
G3 X127.345 Y132.512 I-1.521 J-1.184 E.07303
G1 X126.69 Y132.042 E.02674
G2 X124.724 Y131.35 I-1.521 J1.184 E.07303
G2 X123.879 Y131.983 I3.118 J5.043 E.03507
M73 P36 R13
G1 X123.879 Y130.355 E.05401
; WIPE_START
G1 F8843.478
G1 X123.879 Y131.983 E-.61876
G1 X124.177 Y131.76 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.163 Y129.356 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.515104
G1 F3241
M204 S6000
G1 X123.163 Y127.744 E.06202
G1 X123.18 Y127.672 E.00286
; LINE_WIDTH: 0.564369
G1 X123.197 Y127.599 E.00316
; LINE_WIDTH: 0.597709
G1 X123.213 Y127.527 E.00336
M204 S10000
G1 X123.499 Y127.707 F42000
; LINE_WIDTH: 0.266137
G1 F3241
M204 S6000
G1 X123.463 Y127.685 E.00077
; LINE_WIDTH: 0.312569
G1 X123.428 Y127.662 E.00093
; LINE_WIDTH: 0.359002
G1 X123.392 Y127.639 E.00109
; LINE_WIDTH: 0.405434
G1 X123.356 Y127.617 E.00125
; LINE_WIDTH: 0.451867
G1 X123.321 Y127.594 E.00141
; LINE_WIDTH: 0.498299
G1 X123.285 Y127.572 E.00157
; LINE_WIDTH: 0.544732
G1 X123.249 Y127.549 E.00173
; LINE_WIDTH: 0.614289
G1 X123.213 Y127.527 E.00197
G1 X123.213 Y115.473 E.56121
; LINE_WIDTH: 0.591162
G1 X123.249 Y115.451 E.00189
; LINE_WIDTH: 0.54473
G1 X123.285 Y115.428 E.00173
; LINE_WIDTH: 0.498298
G1 X123.321 Y115.406 E.00157
; LINE_WIDTH: 0.451866
G1 X123.356 Y115.383 E.00141
; LINE_WIDTH: 0.405433
G1 X123.392 Y115.361 E.00125
; LINE_WIDTH: 0.359001
G1 X123.428 Y115.338 E.00109
; LINE_WIDTH: 0.312569
G1 X123.463 Y115.315 E.00093
; LINE_WIDTH: 0.266136
G1 X123.499 Y115.293 E.00077
M204 S10000
G1 X123.213 Y115.473 F42000
; LINE_WIDTH: 0.589365
G1 F3241
M204 S6000
G1 X123.188 Y115.365 E.00496
; LINE_WIDTH: 0.539375
G1 X123.163 Y115.256 E.00451
; LINE_WIDTH: 0.513632
G1 X123.163 Y113.642 E.0619
G1 X123.211 Y113.619 E.00202
; LINE_WIDTH: 0.444195
G1 X123.258 Y113.595 E.00172
; LINE_WIDTH: 0.397402
G1 X123.305 Y113.572 E.00152
; LINE_WIDTH: 0.350609
G1 X123.352 Y113.549 E.00132
; LINE_WIDTH: 0.303817
G1 X123.399 Y113.525 E.00112
; LINE_WIDTH: 0.28076
G1 X131.011 Y113.525 E.14753
G1 X131.059 Y113.549 E.00103
; LINE_WIDTH: 0.352158
G1 X131.106 Y113.573 E.00134
; LINE_WIDTH: 0.399736
G1 X131.154 Y113.596 E.00155
; LINE_WIDTH: 0.447314
G1 X131.202 Y113.62 E.00175
; LINE_WIDTH: 0.494891
G1 X131.249 Y113.644 E.00196
; LINE_WIDTH: 0.533967
G1 X131.264 Y113.659 E.00087
; LINE_WIDTH: 0.550015
G1 X131.264 Y115.256 E.06598
G1 X131.248 Y115.331 E.00318
; LINE_WIDTH: 0.59925
G1 X131.231 Y115.406 E.00348
; LINE_WIDTH: 0.63259
G1 X131.214 Y115.481 E.00369
; LINE_WIDTH: 0.64925
G1 X131.214 Y127.519 E.59477
; LINE_WIDTH: 0.624245
G1 X131.239 Y127.631 E.00546
; LINE_WIDTH: 0.574255
G1 X131.264 Y127.744 E.00499
; LINE_WIDTH: 0.54925
G1 X131.264 Y129.356 E.06651
M204 S10000
G1 X130.911 Y127.705 F42000
; LINE_WIDTH: 0.265495
G1 F3241
M204 S6000
G1 X130.945 Y127.685 E.00072
; LINE_WIDTH: 0.310644
G1 X130.979 Y127.664 E.00086
; LINE_WIDTH: 0.355793
G1 X131.012 Y127.643 E.00101
; LINE_WIDTH: 0.400941
G1 X131.046 Y127.623 E.00115
; LINE_WIDTH: 0.44609
G1 X131.08 Y127.602 E.0013
; LINE_WIDTH: 0.491239
G1 X131.113 Y127.581 E.00145
; LINE_WIDTH: 0.536388
G1 X131.147 Y127.56 E.00159
; LINE_WIDTH: 0.581537
G1 X131.181 Y127.54 E.00174
; LINE_WIDTH: 0.626686
G1 X131.214 Y127.519 E.00188
M204 S10000
G1 X131.214 Y115.481 F42000
G1 F3241
M204 S6000
G1 X131.181 Y115.46 E.00188
; LINE_WIDTH: 0.581537
G1 X131.147 Y115.44 E.00174
; LINE_WIDTH: 0.536388
G1 X131.113 Y115.419 E.00159
; LINE_WIDTH: 0.491239
G1 X131.08 Y115.398 E.00144
; LINE_WIDTH: 0.44609
G1 X131.046 Y115.377 E.0013
; LINE_WIDTH: 0.400941
G1 X131.012 Y115.357 E.00115
; LINE_WIDTH: 0.355793
G1 X130.979 Y115.336 E.00101
; LINE_WIDTH: 0.310644
G1 X130.945 Y115.315 E.00086
; LINE_WIDTH: 0.265495
G1 X130.911 Y115.294 E.00072
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X130.945 Y115.315 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/75
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z1.6 I-1.217 J-.011 P1  F42000
G1 X130.815 Y129.16 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3302
M204 S5000
G1 X123.595 Y129.16 E.22185
G1 X123.595 Y127.94 E.03749
G1 X130.815 Y127.94 E.22185
G1 X130.815 Y129.1 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.815 Y129.117 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.695 Y127.81 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
G1 F3302
M204 S5000
G1 X123.695 Y115.19 E.38778
G1 X130.715 Y115.19 E.21571
G1 X130.715 Y127.81 E.38778
G1 X123.755 Y127.81 E.21386
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.746 Y125.81 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.639 Y118.178 Z1.8 F42000
G1 X123.595 Y115.06 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3302
M204 S5000
G1 X123.595 Y113.84 E.03749
G1 X130.815 Y113.84 E.22185
G1 X130.815 Y115.06 E.03749
G1 X123.655 Y115.06 E.22001
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.595 Y113.84 E-.46416
G1 X124.374 Y113.84 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.147 Y121.469 Z1.8 F42000
G1 X123.538 Y141.991 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3302
M204 S6000
G1 X123.538 Y129.959 E.39911
G1 X130.922 Y129.959 E.24494
G1 X130.922 Y141.99 E.3991
G1 X123.598 Y141.991 E.24295
M204 S10000
G1 X123.131 Y142.398 F42000
G1 F3302
M204 S6000
G1 X123.131 Y129.552 E.42612
G1 X131.329 Y129.552 E.27195
G1 X131.329 Y142.398 E.42611
G1 X123.191 Y142.398 E.26996
M204 S250
G1 X122.881 Y142.783 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3302
M204 S5000
G3 X122.739 Y142.59 I.061 J-.194 E.00789
G1 X122.739 Y113.408 E.89668
G3 X122.923 Y113.21 I.199 J.001 E.00912
G1 X131.567 Y113.214 E.26559
G3 X131.721 Y113.41 I-.04 J.19 E.00832
G1 X131.715 Y142.648 E.8984
G3 X131.535 Y142.79 I-.189 J-.055 E.00751
G1 X122.941 Y142.783 E.26406
; WIPE_START
G1 F9547.055
M204 S6000
G1 X122.776 Y142.711 E-.06832
G1 X122.739 Y142.59 E-.04831
G1 X122.739 Y140.897 E-.64337
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


G1 X130.574 Y140.77 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3302
M204 S6000
G1 X130.574 Y139.142 E.05401
G1 X129.966 Y139.225 E.02037
G1 X129.31 Y139.703 E.02689
G3 X127.345 Y140.361 I-1.487 J-1.178 E.07274
G1 X126.69 Y139.883 E.02689
G2 X124.724 Y139.225 I-1.487 J1.178 E.07274
G2 X123.887 Y139.857 I3.948 J6.106 E.03483
G1 X123.887 Y137.395 E.08166
G1 X124.069 Y137.262 E.00749
G3 X126.035 Y136.605 I1.487 J1.178 E.07274
G1 X126.69 Y137.082 E.02689
G2 X128.655 Y137.74 I1.487 J-1.178 E.07274
G2 X129.966 Y136.708 I-6.475 J-9.575 E.05536
G1 X130.574 Y136.528 E.02105
G1 X130.574 Y133.9 E.08718
G1 X129.966 Y133.984 E.02037
G1 X129.31 Y134.461 E.02689
G3 X127.345 Y135.119 I-1.487 J-1.178 E.07274
M73 P36 R12
G1 X126.69 Y134.642 E.02689
G2 X124.724 Y133.984 I-1.487 J1.178 E.07274
G2 X123.887 Y134.616 I3.948 J6.106 E.03483
G1 X123.887 Y132.154 E.08166
G1 X124.069 Y132.021 E.00749
G3 X126.035 Y131.363 I1.487 J1.178 E.07274
G1 X126.69 Y131.841 E.02689
G2 X128.655 Y132.499 I1.487 J-1.178 E.07274
G2 X129.966 Y131.467 I-6.475 J-9.574 E.05536
G1 X130.574 Y131.287 E.02105
G1 X130.574 Y130.307 E.0325
G1 X129.926 Y130.307 E.02151
; WIPE_START
G1 F8843.478
G1 X130.574 Y130.307 E-.24644
G1 X130.574 Y131.287 E-.37232
G1 X130.218 Y131.393 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.268 Y129.356 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.55707
G1 F3302
M204 S6000
G1 X131.268 Y127.744 E.06754
; LINE_WIDTH: 0.57373
G1 X131.252 Y127.668 E.00335
; LINE_WIDTH: 0.60707
G1 X131.235 Y127.593 E.00356
; LINE_WIDTH: 0.64041
G1 X131.218 Y127.517 E.00377
; LINE_WIDTH: 0.65707
G1 X131.218 Y115.483 E.60227
M204 S10000
G1 X130.911 Y115.295 F42000
; LINE_WIDTH: 0.265928
G1 F3302
M204 S6000
G1 X130.945 Y115.316 E.00073
; LINE_WIDTH: 0.311944
G1 X130.98 Y115.337 E.00088
; LINE_WIDTH: 0.357959
G1 X131.014 Y115.357 E.00103
; LINE_WIDTH: 0.403975
G1 X131.048 Y115.378 E.00118
; LINE_WIDTH: 0.44999
G1 X131.082 Y115.399 E.00133
; LINE_WIDTH: 0.496006
G1 X131.116 Y115.42 E.00148
; LINE_WIDTH: 0.542021
G1 X131.15 Y115.441 E.00163
; LINE_WIDTH: 0.588037
G1 X131.184 Y115.462 E.00178
; LINE_WIDTH: 0.634053
G1 X131.218 Y115.483 E.00193
; LINE_WIDTH: 0.632069
G1 X131.243 Y115.369 E.00557
; LINE_WIDTH: 0.558769
G1 X131.268 Y115.256 E.00488
G1 X131.268 Y113.663 E.06695
; LINE_WIDTH: 0.537829
G1 X131.249 Y113.644 E.0011
; LINE_WIDTH: 0.494816
G1 X131.202 Y113.62 E.00196
; LINE_WIDTH: 0.447248
G1 X131.154 Y113.596 E.00175
; LINE_WIDTH: 0.399679
G1 X131.106 Y113.573 E.00155
; LINE_WIDTH: 0.352111
G1 X131.059 Y113.549 E.00134
; LINE_WIDTH: 0.280755
G1 X131.011 Y113.525 E.00103
G1 X123.399 Y113.525 E.14753
; LINE_WIDTH: 0.303096
G1 X123.353 Y113.548 E.00109
; LINE_WIDTH: 0.348408
G1 X123.306 Y113.571 E.00129
; LINE_WIDTH: 0.39372
G1 X123.26 Y113.593 E.00148
; LINE_WIDTH: 0.439032
G1 X123.214 Y113.616 E.00167
; LINE_WIDTH: 0.506232
G1 X123.167 Y113.638 E.00195
G1 X123.167 Y115.256 E.06107
; LINE_WIDTH: 0.531935
G1 X123.192 Y115.364 E.00441
; LINE_WIDTH: 0.581925
G1 X123.217 Y115.471 E.00486
; LINE_WIDTH: 0.606852
G1 X123.217 Y127.529 E.55406
G1 X123.252 Y127.551 E.00192
; LINE_WIDTH: 0.538687
G1 X123.288 Y127.573 E.00169
; LINE_WIDTH: 0.493184
G1 X123.323 Y127.596 E.00153
; LINE_WIDTH: 0.447682
G1 X123.358 Y127.618 E.00138
; LINE_WIDTH: 0.402179
G1 X123.393 Y127.64 E.00122
; LINE_WIDTH: 0.356677
G1 X123.429 Y127.663 E.00107
; LINE_WIDTH: 0.311174
G1 X123.464 Y127.685 E.00091
; LINE_WIDTH: 0.265672
G1 X123.499 Y127.707 E.00076
M204 S10000
G1 X123.217 Y127.529 F42000
; LINE_WIDTH: 0.590269
G1 F3302
M204 S6000
G1 X123.201 Y127.6 E.00329
; LINE_WIDTH: 0.556929
G1 X123.184 Y127.672 E.00309
; LINE_WIDTH: 0.507659
G1 X123.167 Y127.744 E.00279
G1 X123.167 Y129.356 E.06105
; WIPE_START
G1 F7746.292
G1 X123.167 Y127.744 E-.72677
G1 X123.184 Y127.672 E-.03323
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.816 Y127.705 Z1.8 F42000
G1 X130.911 Y127.705 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.265928
G1 F3302
M204 S6000
G1 X130.945 Y127.684 E.00073
; LINE_WIDTH: 0.311945
G1 X130.98 Y127.663 E.00088
; LINE_WIDTH: 0.357961
G1 X131.014 Y127.643 E.00103
; LINE_WIDTH: 0.403977
G1 X131.048 Y127.622 E.00118
; LINE_WIDTH: 0.449993
G1 X131.082 Y127.601 E.00133
; LINE_WIDTH: 0.496009
G1 X131.116 Y127.58 E.00148
; LINE_WIDTH: 0.542025
G1 X131.15 Y127.559 E.00163
; LINE_WIDTH: 0.588041
G1 X131.184 Y127.538 E.00178
; LINE_WIDTH: 0.634057
G1 X131.218 Y127.517 E.00193
; WIPE_START
G1 F6089.959
G1 X131.184 Y127.538 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.127 Y121.073 Z1.8 F42000
G1 X123.499 Y115.293 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.265671
G1 F3302
M204 S6000
G1 X123.464 Y115.315 E.00076
; LINE_WIDTH: 0.311174
G1 X123.429 Y115.337 E.00091
; LINE_WIDTH: 0.356676
G1 X123.393 Y115.36 E.00107
; LINE_WIDTH: 0.402178
G1 X123.358 Y115.382 E.00122
; LINE_WIDTH: 0.447681
G1 X123.323 Y115.404 E.00138
; LINE_WIDTH: 0.493183
G1 X123.288 Y115.427 E.00153
; LINE_WIDTH: 0.538685
G1 X123.252 Y115.449 E.00169
; LINE_WIDTH: 0.584187
G1 X123.217 Y115.471 E.00184
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6651.061
G1 X123.252 Y115.449 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/75
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z1.8 I-1.066 J.588 P1  F42000
G1 X130.815 Y129.16 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3279
M204 S5000
G1 X123.595 Y129.16 E.22185
G1 X123.595 Y127.94 E.03749
G1 X130.815 Y127.94 E.22185
G1 X130.815 Y129.1 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.815 Y129.117 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.695 Y127.81 Z2 F42000
G1 Z1.6
G1 E.8 F1800
G1 F3279
M204 S5000
G1 X123.695 Y115.19 E.38778
G1 X130.715 Y115.19 E.21571
G1 X130.715 Y127.81 E.38778
M73 P37 R12
G1 X123.755 Y127.81 E.21386
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.746 Y125.81 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.639 Y118.178 Z2 F42000
G1 X123.595 Y115.06 Z2
G1 Z1.6
G1 E.8 F1800
G1 F3279
M204 S5000
G1 X123.595 Y113.84 E.03749
G1 X130.815 Y113.84 E.22185
G1 X130.815 Y115.06 E.03749
G1 X123.655 Y115.06 E.22001
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.595 Y113.84 E-.46416
G1 X124.374 Y113.84 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.149 Y121.469 Z2 F42000
G1 X123.546 Y141.991 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3279
M204 S6000
G1 X123.546 Y129.959 E.39911
G1 X130.93 Y129.959 E.24495
G1 X130.93 Y141.99 E.3991
G1 X123.606 Y141.991 E.24296
M204 S10000
G1 X123.139 Y142.398 F42000
G1 F3279
M204 S6000
G1 X123.139 Y129.552 E.42612
G1 X131.337 Y129.552 E.27196
G1 X131.337 Y142.398 E.42611
G1 X123.199 Y142.398 E.26997
M204 S250
G1 X122.859 Y142.77 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3279
M204 S5000
G3 X122.747 Y142.59 I.087 J-.179 E.00687
G1 X122.747 Y113.408 E.89669
G3 X122.931 Y113.21 I.199 J.001 E.00913
G1 X131.574 Y113.214 E.26558
G3 X131.729 Y113.41 I-.039 J.19 E.00835
G1 X131.723 Y142.648 E.8984
G3 X131.543 Y142.79 I-.189 J-.055 E.00751
G1 X122.945 Y142.79 E.26419
G3 X122.916 Y142.788 I.001 J-.199 E.00087
; WIPE_START
G1 F9547.055
M204 S6000
G1 X122.805 Y142.736 E-.0468
G1 X122.758 Y142.663 E-.03285
G1 X122.747 Y142.59 E-.02811
G1 X122.747 Y140.874 E-.65224
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


G1 X130.582 Y140.739 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3279
M204 S6000
G1 X130.582 Y139.11 E.05401
G1 X129.966 Y139.083 E.02046
G1 X129.638 Y139.208 E.01163
G2 X128.655 Y140.159 I4.257 J5.381 E.04544
G3 X127.345 Y140.503 I-1.057 J-1.361 E.04618
G1 X127.017 Y140.378 E.01163
G3 X126.035 Y139.427 I4.256 J-5.381 E.04544
G2 X124.724 Y139.083 I-1.057 J1.361 E.04618
G2 X123.894 Y139.664 I.662 J1.83 E.03401
G1 X123.894 Y137.629 E.06752
G2 X124.724 Y136.806 I-3.69 J-4.555 E.03883
G3 X126.035 Y136.463 I1.057 J1.361 E.04618
G1 X126.362 Y136.587 E.01163
G3 X127.345 Y137.538 I-4.257 J5.382 E.04544
G2 X128.655 Y137.882 I1.057 J-1.361 E.04618
G1 X128.983 Y137.757 E.01163
G2 X129.966 Y136.806 I-4.255 J-5.38 E.04544
G1 X130.582 Y136.51 E.02268
G1 X130.582 Y133.869 E.08761
G1 X129.966 Y133.842 E.02046
G1 X129.638 Y133.967 E.01163
G2 X128.655 Y134.918 I4.256 J5.381 E.04544
G3 X127.345 Y135.261 I-1.057 J-1.361 E.04618
G1 X127.017 Y135.137 E.01163
G3 X126.035 Y134.186 I4.256 J-5.381 E.04544
G2 X124.724 Y133.842 I-1.057 J1.361 E.04618
G2 X123.894 Y134.423 I.662 J1.83 E.03401
G1 X123.894 Y132.387 E.06752
G2 X124.724 Y131.565 I-3.692 J-4.557 E.03883
G3 X126.035 Y131.221 I1.057 J1.361 E.04618
G1 X126.362 Y131.346 E.01163
G3 X127.345 Y132.297 I-4.256 J5.381 E.04544
G2 X128.655 Y132.641 I1.057 J-1.361 E.04618
G1 X128.983 Y132.516 E.01163
G2 X129.966 Y131.565 I-4.256 J-5.381 E.04544
G1 X130.582 Y131.269 E.02268
G1 X130.582 Y130.307 E.03189
G1 X129.915 Y130.307 E.02212
; WIPE_START
G1 F8843.478
G1 X130.582 Y130.307 E-.25343
G1 X130.582 Y131.269 E-.36534
G1 X130.247 Y131.43 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.272 Y129.356 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.56489
G1 F3279
M204 S6000
G1 X131.272 Y127.744 E.06856
; LINE_WIDTH: 0.589895
G1 X131.247 Y127.63 E.00521
; LINE_WIDTH: 0.639885
G1 X131.222 Y127.515 E.00569
; LINE_WIDTH: 0.66489
G1 X131.222 Y115.484 E.60976
; LINE_WIDTH: 0.648232
G1 X131.239 Y115.408 E.00384
; LINE_WIDTH: 0.614891
G1 X131.256 Y115.332 E.00363
; LINE_WIDTH: 0.56567
G1 X131.272 Y115.256 E.00332
G1 X131.272 Y113.667 E.06768
; LINE_WIDTH: 0.54171
G1 X131.249 Y113.644 E.00133
; LINE_WIDTH: 0.494739
G1 X131.202 Y113.62 E.00196
; LINE_WIDTH: 0.447175
G1 X131.154 Y113.596 E.00175
; LINE_WIDTH: 0.399612
G1 X131.106 Y113.573 E.00155
; LINE_WIDTH: 0.352049
G1 X131.059 Y113.549 E.00134
; LINE_WIDTH: 0.280752
G1 X131.011 Y113.525 E.00103
G1 X123.399 Y113.525 E.14752
; LINE_WIDTH: 0.302364
G1 X123.354 Y113.547 E.00107
; LINE_WIDTH: 0.346211
G1 X123.308 Y113.569 E.00125
; LINE_WIDTH: 0.390058
G1 X123.262 Y113.591 E.00143
; LINE_WIDTH: 0.433906
G1 X123.217 Y113.613 E.00161
; LINE_WIDTH: 0.498833
G1 X123.171 Y113.635 E.00188
G2 X123.171 Y115.256 I74.089 J.815 E.06023
; LINE_WIDTH: 0.524495
G1 X123.196 Y115.363 E.00431
; LINE_WIDTH: 0.574485
G1 X123.221 Y115.47 E.00475
M204 S10000
G1 X123.499 Y115.292 F42000
; LINE_WIDTH: 0.265206
G1 F3279
M204 S6000
G1 X123.464 Y115.314 E.00075
; LINE_WIDTH: 0.309777
G1 X123.43 Y115.337 E.0009
; LINE_WIDTH: 0.354348
G1 X123.395 Y115.359 E.00105
; LINE_WIDTH: 0.398919
G1 X123.36 Y115.381 E.0012
; LINE_WIDTH: 0.44349
G1 X123.325 Y115.403 E.00135
; LINE_WIDTH: 0.488061
G1 X123.29 Y115.425 E.0015
; LINE_WIDTH: 0.532632
G1 X123.256 Y115.448 E.00165
; LINE_WIDTH: 0.577204
G1 X123.221 Y115.47 E.0018
; LINE_WIDTH: 0.599414
G1 X123.221 Y127.53 E.54691
G1 X123.256 Y127.552 E.00187
; LINE_WIDTH: 0.532642
G1 X123.29 Y127.575 E.00165
; LINE_WIDTH: 0.488069
G1 X123.325 Y127.597 E.0015
; LINE_WIDTH: 0.443497
G1 X123.36 Y127.619 E.00135
; LINE_WIDTH: 0.398924
G1 X123.395 Y127.641 E.0012
; LINE_WIDTH: 0.354352
G1 X123.43 Y127.663 E.00105
; LINE_WIDTH: 0.309779
G1 X123.464 Y127.686 E.0009
; LINE_WIDTH: 0.265207
G1 X123.499 Y127.708 E.00075
M204 S10000
G1 X123.221 Y127.53 F42000
; LINE_WIDTH: 0.582821
G1 F3279
M204 S6000
G1 X123.204 Y127.602 E.00322
; LINE_WIDTH: 0.549485
G1 X123.188 Y127.673 E.00302
; LINE_WIDTH: 0.500223
G1 X123.171 Y127.744 E.00273
G1 X123.171 Y129.356 E.06007
; WIPE_START
G1 F7872.249
G1 X123.171 Y127.744 E-.72701
G1 X123.188 Y127.673 E-.03299
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.82 Y127.704 Z2 F42000
G1 X130.911 Y127.705 Z2
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.266364
G1 F3279
M204 S6000
G1 X130.946 Y127.684 E.00074
; LINE_WIDTH: 0.313251
G1 X130.98 Y127.663 E.00089
; LINE_WIDTH: 0.360138
G1 X131.015 Y127.642 E.00105
; LINE_WIDTH: 0.407024
G1 X131.049 Y127.621 E.0012
; LINE_WIDTH: 0.453911
G1 X131.084 Y127.6 E.00136
; LINE_WIDTH: 0.500798
G1 X131.119 Y127.579 E.00151
; LINE_WIDTH: 0.547685
G1 X131.153 Y127.558 E.00166
; LINE_WIDTH: 0.594572
G1 X131.188 Y127.537 E.00182
; LINE_WIDTH: 0.641459
G1 X131.222 Y127.515 E.00197
M204 S10000
G1 X131.222 Y115.484 F42000
; LINE_WIDTH: 0.641457
G1 F3279
M204 S6000
G1 X131.188 Y115.463 E.00197
; LINE_WIDTH: 0.59457
G1 X131.153 Y115.442 E.00182
; LINE_WIDTH: 0.547684
G1 X131.119 Y115.421 E.00166
; LINE_WIDTH: 0.500797
G1 X131.084 Y115.4 E.00151
; LINE_WIDTH: 0.45391
G1 X131.049 Y115.379 E.00136
; LINE_WIDTH: 0.407024
G1 X131.015 Y115.358 E.0012
; LINE_WIDTH: 0.360137
G1 X130.98 Y115.337 E.00105
; LINE_WIDTH: 0.31325
G1 X130.946 Y115.316 E.00089
; LINE_WIDTH: 0.266364
G1 X130.911 Y115.295 E.00074
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X130.946 Y115.316 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/75
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z2 I-1.217 J-.011 P1  F42000
G1 X130.815 Y129.16 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3359
M204 S5000
G1 X123.595 Y129.16 E.22185
G1 X123.595 Y127.94 E.03749
G1 X130.815 Y127.94 E.22185
G1 X130.815 Y129.1 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.815 Y129.117 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.695 Y127.81 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
G1 F3359
M204 S5000
G1 X123.695 Y115.19 E.38778
G1 X130.715 Y115.19 E.21571
G1 X130.715 Y127.81 E.38778
G1 X123.755 Y127.81 E.21386
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.746 Y125.81 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.639 Y118.178 Z2.2 F42000
G1 X123.595 Y115.06 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F3359
M204 S5000
G1 X123.595 Y113.84 E.03749
G1 X130.815 Y113.84 E.22185
G1 X130.815 Y115.06 E.03749
G1 X123.655 Y115.06 E.22001
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.595 Y113.84 E-.46416
G1 X124.374 Y113.84 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.151 Y121.469 Z2.2 F42000
G1 X123.553 Y141.991 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3359
M204 S6000
G1 X123.553 Y129.959 E.39911
G1 X130.938 Y129.959 E.24497
G1 X130.938 Y141.99 E.3991
G1 X123.613 Y141.991 E.24298
M204 S10000
G1 X123.146 Y142.398 F42000
G1 F3359
M204 S6000
G1 X123.146 Y129.552 E.42612
G1 X131.345 Y129.552 E.27197
G1 X131.345 Y142.398 E.42611
G1 X123.206 Y142.398 E.26998
M204 S250
G1 X122.896 Y142.783 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3359
M204 S5000
G3 X122.754 Y142.59 I.061 J-.194 E.00788
G1 X122.754 Y113.408 E.89669
G3 X122.939 Y113.21 I.197 J-.001 E.00915
G1 X131.587 Y113.215 E.26574
G3 X131.737 Y113.41 I-.044 J.189 E.00818
G1 X131.73 Y142.648 E.8984
G3 X131.55 Y142.79 I-.191 J-.058 E.00749
G1 X122.956 Y142.783 E.26408
; WIPE_START
G1 F9547.055
M204 S6000
G1 X122.791 Y142.711 E-.06835
G1 X122.754 Y142.59 E-.04825
G1 X122.754 Y140.897 E-.6434
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


G1 X123.913 Y141.643 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3359
M204 S6000
G1 X125.541 Y141.642 E.05401
G3 X126.472 Y141.642 I.465 J.827 E.03227
G1 X130.59 Y141.642 E.1366
G1 X130.59 Y139.054 E.08585
G1 X129.966 Y138.9 E.02133
G2 X129.31 Y139.186 I-.081 J.709 E.02484
M73 P38 R12
G1 X128.655 Y140.074 E.03662
G3 X127.345 Y140.686 I-1.47 J-1.44 E.04902
G3 X126.69 Y140.4 I-.081 J-.709 E.02484
G1 X126.035 Y139.511 E.03662
G2 X124.724 Y138.9 I-1.47 J1.44 E.04902
G2 X123.901 Y139.413 I.066 J1.021 E.03351
G1 X123.901 Y137.906 E.05001
G1 X124.069 Y137.779 E.00696
G1 X124.724 Y136.891 E.03662
G3 X126.035 Y136.279 I1.47 J1.44 E.04902
G3 X126.69 Y136.565 I.081 J.709 E.02484
G1 X127.345 Y137.454 E.03662
G2 X128.655 Y138.065 I1.47 J-1.44 E.04902
G2 X129.31 Y137.779 I.081 J-.709 E.02484
G1 X129.966 Y136.891 E.03662
G1 X130.59 Y136.462 E.02511
G1 X130.59 Y133.813 E.08789
G1 X129.966 Y133.658 E.02133
G2 X129.31 Y133.944 I-.081 J.709 E.02484
G1 X128.655 Y134.833 E.03662
G3 X127.345 Y135.445 I-1.47 J-1.44 E.04902
G3 X126.69 Y135.159 I-.081 J-.709 E.02484
G1 X126.035 Y134.27 E.03662
G2 X124.724 Y133.658 I-1.47 J1.44 E.04902
G2 X123.901 Y134.172 I.066 J1.021 E.03351
G1 X123.901 Y132.664 E.05001
G1 X124.069 Y132.538 E.00696
G1 X124.724 Y131.65 E.03662
G3 X126.035 Y131.038 I1.47 J1.44 E.04902
G3 X126.69 Y131.324 I.081 J.709 E.02484
G1 X127.345 Y132.212 E.03662
G2 X128.655 Y132.824 I1.47 J-1.44 E.04902
G2 X129.31 Y132.538 I.081 J-.709 E.02484
G1 X129.966 Y131.65 E.03662
G1 X130.59 Y131.221 E.02511
G1 X130.59 Y130.307 E.03031
G1 X129.875 Y130.307 E.02371
; WIPE_START
G1 F8843.478
G1 X130.59 Y130.307 E-.27156
G1 X130.59 Y131.221 E-.34721
G1 X130.283 Y131.431 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.276 Y129.356 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.57271
G1 F3359
M204 S6000
G1 X131.276 Y127.744 E.06959
; LINE_WIDTH: 0.58937
G1 X131.259 Y127.667 E.0035
; LINE_WIDTH: 0.62271
G1 X131.243 Y127.591 E.00371
; LINE_WIDTH: 0.65605
G1 X131.226 Y127.514 E.00392
; LINE_WIDTH: 0.648824
G1 X131.191 Y127.535 E.00202
; LINE_WIDTH: 0.601071
G1 X131.156 Y127.556 E.00186
; LINE_WIDTH: 0.553318
G1 X131.121 Y127.577 E.0017
; LINE_WIDTH: 0.505564
G1 X131.086 Y127.599 E.00154
; LINE_WIDTH: 0.457811
G1 X131.051 Y127.62 E.00138
; LINE_WIDTH: 0.410057
G1 X131.016 Y127.641 E.00122
; LINE_WIDTH: 0.362304
G1 X130.981 Y127.662 E.00106
; LINE_WIDTH: 0.31455
G1 X130.946 Y127.683 E.00091
; LINE_WIDTH: 0.266797
G1 X130.911 Y127.705 E.00075
M204 S10000
G1 X131.226 Y127.514 F42000
; LINE_WIDTH: 0.67271
G1 F3359
M204 S6000
G1 X131.226 Y115.486 E.61726
; LINE_WIDTH: 0.647706
G1 X131.251 Y115.371 E.0058
; LINE_WIDTH: 0.57444
G1 X131.276 Y115.256 E.0051
G1 X131.276 Y113.671 E.06865
; LINE_WIDTH: 0.559141
G1 X131.263 Y113.658 E.00081
; LINE_WIDTH: 0.532022
G1 X131.249 Y113.644 E.00076
; LINE_WIDTH: 0.494683
G1 X131.201 Y113.62 E.00196
; LINE_WIDTH: 0.447129
G1 X131.154 Y113.596 E.00175
; LINE_WIDTH: 0.399574
G1 X131.106 Y113.573 E.00155
; LINE_WIDTH: 0.35202
G1 X131.059 Y113.549 E.00134
; LINE_WIDTH: 0.28073
G1 X131.011 Y113.525 E.00103
G1 X123.399 Y113.525 E.14751
; LINE_WIDTH: 0.301656
G1 X123.354 Y113.546 E.00105
; LINE_WIDTH: 0.344046
G1 X123.309 Y113.568 E.00122
; LINE_WIDTH: 0.386437
G1 X123.265 Y113.589 E.00139
; LINE_WIDTH: 0.428828
G1 X123.22 Y113.61 E.00156
; LINE_WIDTH: 0.491434
G1 X123.175 Y113.631 E.00181
G2 X123.175 Y115.256 I54.646 J.819 E.05939
; LINE_WIDTH: 0.517055
G1 X123.2 Y115.362 E.00421
; LINE_WIDTH: 0.567045
G1 X123.225 Y115.468 E.00465
; LINE_WIDTH: 0.567123
G1 X123.264 Y115.443 E.00199
; LINE_WIDTH: 0.517246
G1 X123.303 Y115.418 E.0018
; LINE_WIDTH: 0.467368
G1 X123.342 Y115.393 E.00161
; LINE_WIDTH: 0.417491
G1 X123.382 Y115.367 E.00142
; LINE_WIDTH: 0.367614
G1 X123.421 Y115.342 E.00123
; LINE_WIDTH: 0.317736
G1 X123.46 Y115.317 E.00104
; LINE_WIDTH: 0.267859
G1 X123.499 Y115.292 E.00085
M204 S10000
G1 X123.225 Y115.468 F42000
; LINE_WIDTH: 0.591954
G1 F3359
M204 S6000
G1 X123.225 Y127.532 E.53974
G1 X123.264 Y127.557 E.00208
; LINE_WIDTH: 0.517245
G1 X123.303 Y127.582 E.0018
; LINE_WIDTH: 0.467368
G1 X123.342 Y127.607 E.00161
; LINE_WIDTH: 0.41749
G1 X123.382 Y127.633 E.00142
; LINE_WIDTH: 0.367613
G1 X123.421 Y127.658 E.00123
; LINE_WIDTH: 0.317736
G1 X123.46 Y127.683 E.00104
; LINE_WIDTH: 0.267859
G1 X123.499 Y127.708 E.00085
M204 S10000
G1 X123.225 Y127.532 F42000
; LINE_WIDTH: 0.575391
G1 F3359
M204 S6000
G1 X123.208 Y127.603 E.00315
; LINE_WIDTH: 0.542051
G1 X123.191 Y127.673 E.00295
; LINE_WIDTH: 0.492768
G1 X123.175 Y127.744 E.00266
G1 X123.175 Y129.356 E.05909
; WIPE_START
G1 F8002.707
G1 X123.175 Y127.744 E-.72725
G1 X123.191 Y127.673 E-.03275
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.392 Y121.301 Z2.2 F42000
G1 X131.226 Y115.486 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.648824
G1 F3359
M204 S6000
G1 X131.191 Y115.465 E.00202
; LINE_WIDTH: 0.60107
G1 X131.156 Y115.444 E.00186
; LINE_WIDTH: 0.553317
G1 X131.121 Y115.423 E.0017
; LINE_WIDTH: 0.505564
G1 X131.086 Y115.401 E.00154
; LINE_WIDTH: 0.45781
G1 X131.051 Y115.38 E.00138
; LINE_WIDTH: 0.410057
G1 X131.016 Y115.359 E.00122
; LINE_WIDTH: 0.362304
G1 X130.981 Y115.338 E.00106
; LINE_WIDTH: 0.31455
G1 X130.946 Y115.317 E.00091
; LINE_WIDTH: 0.266797
G1 X130.911 Y115.295 E.00075
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X130.946 Y115.317 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/75
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z2.2 I-1.217 J.016 P1  F42000
G1 X131.107 Y127.548 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3516
M204 S6000
G1 X131.107 Y115.452 E.40124
G1 X131.353 Y115.452 E.00815
G1 X131.353 Y127.548 E.40124
G1 X131.167 Y127.548 E.00615
; WIPE_START
G1 F8843.478
G1 X131.157 Y125.548 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.815 Y129.16 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3516
M204 S5000
G1 X123.595 Y129.16 E.22185
G1 X123.595 Y127.94 E.03749
G1 X130.815 Y127.94 E.22185
G1 X130.815 Y129.1 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.815 Y129.117 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.695 Y127.81 Z2.4 F42000
G1 Z2
G1 E.8 F1800
G1 F3516
M204 S5000
G1 X123.695 Y115.19 E.38778
G1 X130.715 Y115.19 E.21571
G1 X130.715 Y127.81 E.38778
G1 X123.755 Y127.81 E.21386
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.746 Y125.81 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.639 Y118.178 Z2.4 F42000
G1 X123.595 Y115.06 Z2.4
G1 Z2
G1 E.8 F1800
G1 F3516
M204 S5000
G1 X123.595 Y113.84 E.03749
G1 X130.815 Y113.84 E.22185
G1 X130.815 Y115.06 E.03749
G1 X123.655 Y115.06 E.22001
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.595 Y113.84 E-.46416
G1 X124.374 Y113.84 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.153 Y121.469 Z2.4 F42000
G1 X123.561 Y141.991 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3516
M204 S6000
G1 X123.561 Y129.959 E.39911
G1 X130.946 Y129.959 E.24498
G1 X130.946 Y141.99 E.3991
G1 X123.621 Y141.991 E.24299
M204 S10000
G1 X123.154 Y142.398 F42000
G1 F3516
M204 S6000
G1 X123.154 Y129.552 E.42612
G1 X131.353 Y129.552 E.27199
G1 X131.353 Y142.398 E.42611
G1 X123.214 Y142.398 E.27
M204 S250
G1 X122.903 Y142.783 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3516
M204 S5000
G3 X122.761 Y142.59 I.057 J-.191 E.00791
G1 X122.761 Y113.408 E.89669
G3 X122.946 Y113.21 I.197 J0 E.00915
G1 X131.595 Y113.215 E.26576
G3 X131.745 Y113.41 I-.044 J.189 E.00818
G1 X131.738 Y142.648 E.89841
G3 X131.558 Y142.79 I-.188 J-.054 E.00751
G1 X122.963 Y142.783 E.26409
; WIPE_START
G1 F9547.055
M204 S6000
G1 X122.8 Y142.714 E-.0675
G1 X122.761 Y142.59 E-.04925
G1 X122.761 Y140.897 E-.64326
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


G1 X123.909 Y141.467 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3516
M204 S6000
G1 X123.909 Y141.643 E.00582
G1 X125.362 Y141.642 E.0482
G1 X126.355 Y141.103 E.03749
G1 X126.493 Y140.776 E.01179
G2 X125.611 Y139.138 I-2.986 J.551 E.06272
G1 X124.404 Y138.483 E.04554
G1 X124.266 Y138.155 E.01179
G3 X125.148 Y136.517 I2.986 J.551 E.06272
G1 X126.355 Y135.862 E.04554
G1 X126.493 Y135.534 E.01179
G2 X125.611 Y133.896 I-2.986 J.551 E.06272
G1 X124.404 Y133.241 E.04554
G1 X124.266 Y132.914 E.01179
G3 X125.148 Y131.276 I2.986 J.551 E.06272
G1 X126.355 Y130.621 E.04554
G1 X126.487 Y130.307 E.01127
G1 X127.601 Y130.307 E.03698
G1 X127.025 Y130.621 E.02177
G1 X126.887 Y130.948 E.01179
G2 X127.769 Y132.586 I2.986 J-.551 E.06272
G1 X128.976 Y133.241 E.04554
G1 X129.113 Y133.569 E.01179
G3 X128.231 Y135.207 I-2.986 J-.551 E.06272
G1 X127.025 Y135.862 E.04554
M73 P39 R12
G1 X126.887 Y136.19 E.01179
G2 X127.769 Y137.827 I2.986 J-.551 E.06272
G1 X128.976 Y138.483 E.04554
G1 X129.113 Y138.81 E.01179
G3 X128.231 Y140.448 I-2.986 J-.551 E.06272
G1 X127.025 Y141.103 E.04554
G2 X126.93 Y141.642 I.347 J.339 E.01929
G1 X130.598 Y141.642 E.12165
G1 X130.598 Y139 E.08766
G1 X129.645 Y138.483 E.03595
G1 X129.508 Y138.155 E.01179
G3 X130.598 Y136.325 I3.196 J.665 E.07196
G1 X130.598 Y133.758 E.08516
G1 X129.645 Y133.241 E.03594
G1 X129.508 Y132.914 E.01179
G3 X130.598 Y131.084 I3.196 J.665 E.07196
G1 X130.598 Y130.307 E.02577
G1 X129.746 Y130.307 E.02825
; WIPE_START
G1 F8843.478
G1 X130.598 Y130.307 E-.32358
G1 X130.598 Y131.084 E-.29518
G1 X130.35 Y131.361 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.28 Y129.356 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.58053
G1 F3516
M204 S6000
G1 X131.28 Y127.744 E.07061
; WIPE_START
G1 F6696.304
G1 X131.28 Y129.356 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.648 Y129.356 Z2.4 F42000
G1 X123.178 Y129.356 Z2.4
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.485323
G1 F3516
M204 S6000
G1 X123.178 Y127.744 E.05811
G1 X123.195 Y127.674 E.0026
; LINE_WIDTH: 0.534605
G1 X123.212 Y127.604 E.00289
; LINE_WIDTH: 0.567942
G1 X123.228 Y127.534 E.00308
M204 S10000
G1 X123.499 Y127.708 F42000
; LINE_WIDTH: 0.267328
G1 F3516
M204 S6000
G1 X123.461 Y127.683 E.00084
; LINE_WIDTH: 0.316142
G1 X123.422 Y127.659 E.00102
; LINE_WIDTH: 0.364956
G1 X123.383 Y127.634 E.00121
; LINE_WIDTH: 0.41377
G1 X123.344 Y127.609 E.00139
; LINE_WIDTH: 0.462585
G1 X123.306 Y127.584 E.00157
; LINE_WIDTH: 0.511399
G1 X123.267 Y127.559 E.00176
; LINE_WIDTH: 0.584518
G1 X123.228 Y127.534 E.00203
G1 X123.228 Y115.466 E.53258
M204 S10000
G1 X123.499 Y115.292 F42000
; LINE_WIDTH: 0.267327
G1 F3516
M204 S6000
G1 X123.461 Y115.316 E.00084
; LINE_WIDTH: 0.31614
G1 X123.422 Y115.341 E.00102
; LINE_WIDTH: 0.364952
G1 X123.383 Y115.366 E.00121
; LINE_WIDTH: 0.413765
G1 X123.344 Y115.391 E.00139
; LINE_WIDTH: 0.462578
G1 X123.306 Y115.416 E.00157
; LINE_WIDTH: 0.511391
G1 X123.267 Y115.441 E.00176
; LINE_WIDTH: 0.560204
G1 X123.228 Y115.466 E.00194
; LINE_WIDTH: 0.559605
G1 X123.203 Y115.361 E.00455
; LINE_WIDTH: 0.509615
G1 X123.178 Y115.256 E.00411
; LINE_WIDTH: 0.484037
G3 X123.179 Y113.628 I43.049 J-.806 E.05854
G1 X123.223 Y113.607 E.00175
; LINE_WIDTH: 0.423786
G1 X123.267 Y113.587 E.00151
; LINE_WIDTH: 0.382836
G1 X123.311 Y113.566 E.00135
; LINE_WIDTH: 0.341886
G1 X123.355 Y113.546 E.00118
; LINE_WIDTH: 0.300935
G1 X123.399 Y113.525 E.00102
; LINE_WIDTH: 0.280717
G1 X131.011 Y113.525 E.1475
G1 X131.059 Y113.549 E.00103
; LINE_WIDTH: 0.351972
G1 X131.106 Y113.573 E.00134
; LINE_WIDTH: 0.399517
G1 X131.154 Y113.596 E.00154
; LINE_WIDTH: 0.447062
G1 X131.201 Y113.62 E.00175
; LINE_WIDTH: 0.494608
G1 X131.249 Y113.644 E.00196
; LINE_WIDTH: 0.533924
G1 X131.265 Y113.659 E.00088
; LINE_WIDTH: 0.565002
G1 X131.28 Y113.675 E.00093
; LINE_WIDTH: 0.58053
G1 X131.28 Y115.256 E.06926
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6696.304
G1 X131.28 Y113.675 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/75
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z2.4 I-1.217 J-.015 P1  F42000
G1 X131.107 Y127.548 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3633
M204 S6000
G1 X131.107 Y115.452 E.40124
G1 X131.361 Y115.452 E.0084
G1 X131.361 Y127.548 E.40124
G1 X131.167 Y127.548 E.00641
; WIPE_START
G1 F8843.478
G1 X131.157 Y125.548 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.815 Y129.16 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3633
M204 S5000
G1 X123.595 Y129.16 E.22185
G1 X123.595 Y127.94 E.03749
G1 X130.815 Y127.94 E.22185
G1 X130.815 Y129.1 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.815 Y129.117 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.695 Y127.81 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
G1 F3633
M204 S5000
G1 X123.695 Y115.19 E.38778
G1 X130.715 Y115.19 E.21571
G1 X130.715 Y127.81 E.38778
G1 X123.755 Y127.81 E.21386
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.746 Y125.81 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.639 Y118.178 Z2.6 F42000
G1 X123.595 Y115.06 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F3633
M204 S5000
G1 X123.595 Y113.84 E.03749
G1 X130.815 Y113.84 E.22185
G1 X130.815 Y115.06 E.03749
G1 X123.655 Y115.06 E.22001
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.595 Y113.84 E-.46416
G1 X124.374 Y113.84 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.155 Y121.469 Z2.6 F42000
G1 X123.568 Y141.991 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3633
M204 S6000
G1 X123.568 Y129.959 E.39911
G1 X130.954 Y129.959 E.24499
G1 X130.954 Y141.99 E.3991
G1 X123.628 Y141.991 E.243
M204 S10000
G1 X123.161 Y142.398 F42000
G1 F3633
M204 S6000
G1 X123.161 Y129.552 E.42612
G1 X131.361 Y129.552 E.272
G1 X131.361 Y142.398 E.42611
G1 X123.221 Y142.398 E.27001
M204 S250
G1 X122.911 Y142.783 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3633
M204 S5000
G3 X122.769 Y142.59 I.061 J-.194 E.00788
G1 X122.769 Y113.408 E.89669
G3 X122.954 Y113.21 I.198 J0 E.00915
G1 X131.604 Y113.216 E.26578
G3 X131.753 Y113.41 I-.045 J.189 E.00815
G1 X131.746 Y142.648 E.8984
G3 X131.566 Y142.79 I-.191 J-.058 E.0075
G1 X122.971 Y142.783 E.2641
; WIPE_START
G1 F9547.055
M204 S6000
G1 X122.806 Y142.711 E-.06836
G1 X122.769 Y142.59 E-.04822
G1 X122.769 Y140.897 E-.64342
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


G1 X123.916 Y141.309 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3633
M204 S6000
G1 X123.916 Y141.643 E.01107
G1 X125.211 Y141.642 E.04295
G2 X126.129 Y140.776 I-1.585 J-2.597 E.04218
G2 X125.689 Y139.138 I-1.859 J-.379 E.05832
G3 X124.63 Y138.155 I1.788 J-2.987 E.04827
G3 X125.07 Y136.517 I1.859 J-.379 E.05832
G2 X126.129 Y135.534 I-1.787 J-2.987 E.04827
G2 X125.689 Y133.896 I-1.859 J-.379 E.05832
G3 X124.63 Y132.914 I1.787 J-2.987 E.04827
G3 X125.07 Y131.276 I1.859 J-.379 E.05832
G1 X125.836 Y130.646 E.03289
G1 X127.461 Y130.684 E.05394
G1 X127.251 Y130.948 E.0112
G2 X127.691 Y132.586 I1.859 J.379 E.05832
G3 X128.749 Y133.569 I-1.787 J2.987 E.04827
G3 X128.309 Y135.207 I-1.859 J.379 E.05832
G2 X127.251 Y136.19 I1.787 J2.987 E.04827
G2 X127.691 Y137.827 I1.859 J.379 E.05832
G3 X128.749 Y138.81 I-1.787 J2.987 E.04827
G3 X128.309 Y140.448 I-1.859 J.379 E.05832
G1 X127.512 Y141.103 E.03423
G2 X127.203 Y141.642 I.404 J.591 E.02134
G1 X130.605 Y141.642 E.11288
G1 X130.605 Y138.871 E.09193
G3 X129.871 Y138.155 I1.321 J-2.088 E.03425
G3 X130.228 Y136.653 I1.757 J-.376 E.05294
G1 X130.228 Y134.029 E.08705
G1 X130.605 Y133.869 E.01358
G1 X130.605 Y133.629 E.00795
G3 X129.871 Y132.914 I1.32 J-2.088 E.03425
G3 X130.228 Y131.412 I1.757 J-.376 E.05294
G1 X130.236 Y130.685 E.02412
G1 X129.337 Y130.685 E.02981
; WIPE_START
G1 F8843.478
G1 X130.236 Y130.685 E-.34144
G1 X130.228 Y131.412 E-.27629
G1 X130.033 Y131.731 E-.14227
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.284 Y129.356 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.58835
M73 P40 R12
G1 F3633
M204 S6000
G1 X131.284 Y127.744 E.07164
; WIPE_START
G1 F6600.297
G1 X131.284 Y129.356 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.545 Y130.322 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.385126
G1 F3633
M204 S6000
G1 X130.439 Y130.322 E.10859
G1 X130.566 Y130.347 E.00359
G3 X130.591 Y131.029 I-8.044 J.638 E.01905
M204 S10000
G1 X130.591 Y136.088 F42000
; LINE_WIDTH: 0.38292
G1 F3633
M204 S6000
G2 X130.592 Y134.328 I-327.265 J-1.172 E.04877
; WIPE_START
G1 F10588.235
G1 X130.591 Y136.088 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.942 Y130.955 Z2.6 F42000
G1 X123.182 Y129.356 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.477877
G1 F3633
M204 S6000
G1 X123.182 Y127.744 E.05713
G1 X123.199 Y127.674 E.00253
; LINE_WIDTH: 0.527171
G1 X123.215 Y127.605 E.00282
; LINE_WIDTH: 0.560512
G1 X123.232 Y127.536 E.00301
M204 S10000
G1 X123.27 Y127.56 F42000
; LINE_WIDTH: 0.577081
G1 F3633
M204 S6000
G1 X123.232 Y127.536 E.00198
G1 X123.232 Y115.464 E.52543
; LINE_WIDTH: 0.552165
G1 X123.207 Y115.36 E.00445
; LINE_WIDTH: 0.502175
G1 X123.182 Y115.256 E.00401
; LINE_WIDTH: 0.476339
G3 X123.183 Y113.624 I35.426 J-.806 E.05765
G1 X123.237 Y113.599 E.0021
; LINE_WIDTH: 0.403985
G1 X123.291 Y113.575 E.00175
; LINE_WIDTH: 0.354583
G1 X123.345 Y113.55 E.00151
; LINE_WIDTH: 0.305181
G1 X123.399 Y113.525 E.00127
; LINE_WIDTH: 0.280713
G1 X131.011 Y113.525 E.1475
G1 X131.059 Y113.549 E.00103
; LINE_WIDTH: 0.351911
G1 X131.106 Y113.573 E.00134
; LINE_WIDTH: 0.399451
G1 X131.154 Y113.596 E.00154
; LINE_WIDTH: 0.446991
G1 X131.201 Y113.62 E.00175
; LINE_WIDTH: 0.49453
G1 X131.249 Y113.644 E.00196
; LINE_WIDTH: 0.535822
G1 X131.266 Y113.661 E.00099
; LINE_WIDTH: 0.570848
G1 X131.284 Y113.679 E.00107
; LINE_WIDTH: 0.58834
G1 X131.284 Y115.256 E.07009
; WIPE_START
G1 F6600.418
G1 X131.284 Y113.679 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.81 Y115.227 Z2.6 F42000
G1 X123.499 Y115.291 Z2.6
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.266796
G1 F3633
M204 S6000
G1 X123.461 Y115.316 E.00083
; LINE_WIDTH: 0.314548
G1 X123.423 Y115.341 E.00101
; LINE_WIDTH: 0.362299
G1 X123.385 Y115.365 E.00118
; LINE_WIDTH: 0.410051
G1 X123.347 Y115.39 E.00136
; LINE_WIDTH: 0.457803
G1 X123.308 Y115.415 E.00154
; LINE_WIDTH: 0.505554
G1 X123.27 Y115.44 E.00171
; LINE_WIDTH: 0.553306
G1 X123.232 Y115.464 E.00189
M204 S10000
G1 X123.27 Y127.56 F42000
; LINE_WIDTH: 0.505553
G1 F3633
M204 S6000
G1 X123.308 Y127.585 E.00171
; LINE_WIDTH: 0.457802
G1 X123.347 Y127.61 E.00154
; LINE_WIDTH: 0.41005
G1 X123.385 Y127.635 E.00136
; LINE_WIDTH: 0.362299
G1 X123.423 Y127.659 E.00118
; LINE_WIDTH: 0.314548
G1 X123.461 Y127.684 E.00101
; LINE_WIDTH: 0.266796
G1 X123.499 Y127.709 E.00083
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X123.461 Y127.684 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/75
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z2.6 I.022 J1.217 P1  F42000
G1 X131.107 Y127.548 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5122
M204 S6000
G1 X131.107 Y115.452 E.40124
G1 X131.368 Y115.452 E.00866
G1 X131.368 Y127.548 E.40124
G1 X131.167 Y127.548 E.00667
; WIPE_START
G1 F8843.478
G1 X131.157 Y125.548 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.815 Y129.16 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5122
M204 S5000
G1 X123.595 Y129.16 E.22185
G1 X123.595 Y127.94 E.03749
G1 X130.815 Y127.94 E.22185
G1 X130.815 Y129.1 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.815 Y129.117 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.695 Y127.81 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F5122
M204 S5000
G1 X123.695 Y115.19 E.38778
G1 X130.715 Y115.19 E.21571
G1 X130.715 Y127.81 E.38778
G1 X123.755 Y127.81 E.21386
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.746 Y125.81 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.639 Y118.178 Z2.8 F42000
G1 X123.595 Y115.06 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F5122
M204 S5000
G1 X123.595 Y113.84 E.03749
G1 X130.815 Y113.84 E.22185
G1 X130.815 Y115.06 E.03749
G1 X123.655 Y115.06 E.22001
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.595 Y113.84 E-.46416
G1 X124.374 Y113.84 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.157 Y121.469 Z2.8 F42000
G1 X123.575 Y141.991 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5122
M204 S6000
G1 X123.575 Y129.959 E.39911
G1 X130.961 Y129.959 E.245
G1 X130.961 Y141.99 E.3991
G1 X123.635 Y141.991 E.24301
M204 S10000
G1 X123.168 Y142.398 F42000
G1 F5122
M204 S6000
G1 X123.168 Y129.552 E.42612
G1 X131.368 Y129.552 E.27201
G1 X131.368 Y142.398 E.42611
G1 X123.228 Y142.398 E.27002
M204 S250
G1 X122.918 Y142.783 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5122
M204 S5000
G3 X122.776 Y142.59 I.061 J-.194 E.00788
G1 X122.776 Y113.408 E.89669
G3 X122.962 Y113.21 I.199 J.001 E.00914
G1 X131.612 Y113.216 E.26581
G3 X131.761 Y113.41 I-.045 J.188 E.00813
G1 X131.754 Y142.648 E.8984
G3 X131.574 Y142.79 I-.191 J-.058 E.00749
G1 X122.978 Y142.783 E.26412
; WIPE_START
G1 F9547.055
M204 S6000
G1 X122.813 Y142.711 E-.06835
G1 X122.776 Y142.59 E-.04818
G1 X122.776 Y140.897 E-.64347
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


G1 X123.938 Y141.189 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.383268
G1 F5122
M204 S6000
G1 X123.938 Y130.481 E.29699
G1 X123.966 Y130.349 E.00373
G1 X124.097 Y130.322 E.00373
G1 X125.89 Y130.322 E.04972
M204 S10000
G1 X124.687 Y131.597 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.41251
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X126.665 Y130.329 E.12798
G1 X127.522 Y130.329 E.04667
G1 X124.638 Y132.178 E.18657
G1 X124.513 Y132.437 E.01563
G1 X124.484 Y132.826 E.02126
G1 X128.379 Y130.329 E.25196
G1 X129.236 Y130.329 E.04667
G1 X124.688 Y133.244 E.29418
G2 X125.042 Y133.567 I2.543 J-2.439 E.0261
G1 X130.094 Y130.329 E.3267
G1 X130.592 Y130.329 E.02713
G1 X130.592 Y130.559 E.01253
G1 X125.401 Y133.886 E.33573
G1 X125.647 Y134.163 E.02018
G1 X125.697 Y134.246 E.00525
G1 X130.378 Y131.245 E.30277
G1 X130.068 Y131.625 E.02671
G1 X129.163 Y132.573 E.07138
G1 X125.924 Y134.649 E.20948
G1 X126.043 Y135.123 E.02657
G1 X128.783 Y133.367 E.17719
G1 X128.902 Y133.597 E.01415
G1 X128.881 Y133.853 E.01395
G1 X126.032 Y135.679 E.18425
G1 X126.031 Y135.773 E.00511
G1 X124.965 Y136.913 E.085
G1 X128.834 Y134.432 E.25028
G1 X128.787 Y135.012 E.03166
G1 X124.506 Y137.756 E.27689
G1 X124.496 Y138.205 E.02443
G1 X124.545 Y138.281 E.00493
G1 X130.592 Y134.405 E.39111
G1 X130.592 Y134.954 E.02991
G1 X124.845 Y138.638 E.37169
G2 X125.215 Y138.95 I5.727 J-6.409 E.02636
G1 X130.592 Y135.503 E.34776
G1 X130.592 Y135.959 E.02479
G1 X130.499 Y136.112 E.00975
G1 X125.544 Y139.289 E.32053
G3 X125.808 Y139.668 I-1.573 J1.379 E.02526
G1 X128.604 Y137.876 E.18079
G1 X128.336 Y138.121 E.01974
G1 X128.621 Y138.415 E.0223
G1 X125.879 Y140.172 E.17734
M106 S201.45
M204 S10000
G1 X125.029 Y139.352 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F5122
M204 S6000
G3 X125.916 Y140.665 I-3.853 J3.557 E.05275
G1 X125.949 Y140.644 E.00129
G3 X125.092 Y141.642 I-3.581 J-2.205 E.04382
G1 X127.395 Y141.642 E.07639
G3 X128.398 Y140.448 I3.554 J1.967 E.05206
G2 X128.577 Y138.959 I-1.524 J-.939 E.05133
G1 X129.299 Y138.497 E.02842
G1 X128.951 Y138.139 E.01653
G1 X129.952 Y137.226 E.04493
G2 X130.236 Y138.302 I1.228 J.251 E.03822
G1 X130.236 Y141.27 E.09847
G1 X130.613 Y141.267 E.01251
G1 X130.613 Y141.35 E.00277
G1 X130.334 Y141.642 E.01341
G1 X128.705 Y141.642 E.05401
M204 S10000
G1 X130.6 Y140.906 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F5122
M204 S6000
G2 X130.602 Y138.442 I-525.641 J-1.546 E.06826
M204 S10000
G1 X129.476 Y134.347 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5122
M204 S6000
G1 X130.613 Y133.866 E.04097
G1 X130.613 Y133.473 E.01305
G3 X129.964 Y132.586 I1.721 J-1.942 E.03673
G1 X129.959 Y132.36 E.00751
G2 X130.613 Y131.635 I-4.372 J-4.602 E.03241
G1 X130.613 Y132.287 E.02161
; WIPE_START
G1 F8843.478
G1 X130.613 Y131.635 E-.24761
G1 X129.959 Y132.36 E-.3709
G1 X129.964 Y132.586 E-.086
G1 X130.023 Y132.72 E-.05549
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.288 Y129.356 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.59617
G1 F5122
M204 S6000
G1 X131.288 Y127.744 E.07267
; WIPE_START
G1 F6507.004
G1 X131.288 Y129.356 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.655 Y129.356 Z2.8 F42000
G1 X123.186 Y129.356 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.470432
G1 F5122
M204 S6000
G1 X123.186 Y127.744 E.05616
G1 X123.202 Y127.675 E.00247
; LINE_WIDTH: 0.519725
G1 X123.219 Y127.606 E.00275
; LINE_WIDTH: 0.553062
G1 X123.236 Y127.537 E.00295
M204 S10000
G1 X123.499 Y127.709 F42000
; LINE_WIDTH: 0.266265
G1 F5122
M204 S6000
G1 X123.462 Y127.685 E.00082
; LINE_WIDTH: 0.312953
G1 X123.424 Y127.66 E.00099
; LINE_WIDTH: 0.359642
G1 X123.386 Y127.636 E.00116
; LINE_WIDTH: 0.40633
G1 X123.349 Y127.611 E.00133
; LINE_WIDTH: 0.453019
G1 X123.311 Y127.586 E.0015
; LINE_WIDTH: 0.499708
G1 X123.273 Y127.562 E.00167
; LINE_WIDTH: 0.569644
G1 X123.236 Y127.537 E.00193
G1 X123.236 Y115.463 E.51826
; LINE_WIDTH: 0.546387
G1 X123.273 Y115.438 E.00184
; LINE_WIDTH: 0.4997
G1 X123.311 Y115.414 E.00167
; LINE_WIDTH: 0.453013
G1 X123.349 Y115.389 E.0015
; LINE_WIDTH: 0.406325
G1 X123.386 Y115.364 E.00133
; LINE_WIDTH: 0.359638
G1 X123.424 Y115.34 E.00116
; LINE_WIDTH: 0.312951
G1 X123.462 Y115.315 E.00099
; LINE_WIDTH: 0.266264
G1 X123.499 Y115.291 E.00082
M204 S10000
G1 X123.236 Y115.463 F42000
; LINE_WIDTH: 0.544725
G1 F5122
M204 S6000
G1 X123.211 Y115.359 E.00435
; LINE_WIDTH: 0.494735
G1 X123.186 Y115.256 E.00391
; LINE_WIDTH: 0.468964
G3 X123.186 Y113.62 I29.566 J-.806 E.05679
G1 X123.24 Y113.597 E.00202
; LINE_WIDTH: 0.399572
G1 X123.293 Y113.573 E.00169
; LINE_WIDTH: 0.351935
G1 X123.346 Y113.549 E.00147
; LINE_WIDTH: 0.304299
G1 X123.399 Y113.525 E.00124
; LINE_WIDTH: 0.280907
G1 X131.011 Y113.525 E.14762
G1 X131.122 Y113.58 E.0024
; LINE_WIDTH: 0.351888
G1 X131.233 Y113.636 E.00311
; LINE_WIDTH: 0.399423
G1 X131.343 Y113.691 E.00359
; LINE_WIDTH: 0.446958
G1 X131.454 Y113.746 E.00407
; LINE_WIDTH: 0.494493
G1 X131.565 Y113.802 E.00455
M204 S10000
G1 X131.288 Y113.406 F42000
; LINE_WIDTH: 0.59617
G1 F5122
M204 S6000
G1 X131.288 Y115.256 E.08339
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6507.004
G1 X131.288 Y113.406 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/75
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
M73 P41 R12
G3 Z2.8 I-1.217 J-.016 P1  F42000
G1 X131.107 Y127.548 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5850
M204 S6000
G1 X131.107 Y115.452 E.40124
G1 X131.376 Y115.452 E.00892
G1 X131.376 Y127.548 E.40124
G1 X131.167 Y127.548 E.00693
; WIPE_START
G1 F8843.478
G1 X131.157 Y125.548 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.815 Y129.16 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5850
M204 S5000
G1 X123.595 Y129.16 E.22185
G1 X123.595 Y127.94 E.03749
G1 X130.815 Y127.94 E.22185
G1 X130.815 Y129.1 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.815 Y129.117 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.695 Y127.81 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F5850
M204 S5000
G1 X123.695 Y115.19 E.38778
G1 X130.715 Y115.19 E.21571
G1 X130.715 Y127.81 E.38778
G1 X123.755 Y127.81 E.21386
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.746 Y125.81 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.639 Y118.178 Z3 F42000
G1 X123.595 Y115.06 Z3
G1 Z2.6
G1 E.8 F1800
G1 F5850
M204 S5000
G1 X123.595 Y113.84 E.03749
G1 X130.815 Y113.84 E.22185
G1 X130.815 Y115.06 E.03749
G1 X123.655 Y115.06 E.22001
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.595 Y113.84 E-.46416
G1 X124.374 Y113.84 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.159 Y121.469 Z3 F42000
G1 X123.583 Y141.991 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5850
M204 S6000
G1 X123.583 Y129.959 E.39911
G1 X130.969 Y129.959 E.24502
G1 X130.969 Y141.99 E.3991
G1 X123.643 Y141.991 E.24303
M204 S10000
G1 X123.176 Y142.398 F42000
G1 F5850
M204 S6000
G1 X123.176 Y129.552 E.42612
G1 X131.376 Y129.552 E.27202
G1 X131.376 Y142.398 E.42611
G1 X123.236 Y142.398 E.27003
M204 S250
G1 X122.926 Y142.783 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5850
M204 S5000
G3 X122.784 Y142.59 I.061 J-.194 E.00789
G1 X122.784 Y113.408 E.8967
G3 X122.969 Y113.21 I.199 J.001 E.00915
G1 X131.624 Y113.217 E.26594
G3 X131.768 Y113.41 I-.049 J.187 E.008
G1 X131.762 Y142.648 E.89841
G3 X131.582 Y142.79 I-.191 J-.058 E.00749
G1 X122.986 Y142.783 E.26412
; WIPE_START
G1 F9547.055
M204 S6000
G1 X122.821 Y142.711 E-.06841
G1 X122.784 Y142.59 E-.04822
G1 X122.784 Y140.897 E-.64337
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


G1 X123.75 Y141.116 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.41858
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X125.559 Y141.099 E.10143
G1 X125.557 Y140.884 E.01209
G1 X130.599 Y140.838 E.28271
G1 X130.599 Y140.585 E.01418
G1 X123.953 Y140.645 E.37268
G1 X123.953 Y140.177 E.02627
G1 X130.6 Y140.117 E.37268
G1 X130.6 Y139.648 E.02627
G1 X123.953 Y139.708 E.37268
G1 X123.953 Y139.24 E.02627
G1 X125.778 Y139.223 E.10232
G2 X125.336 Y138.758 I-1.247 J.742 E.03622
G1 X123.953 Y138.771 E.07759
G1 X123.953 Y138.302 E.02627
G1 X124.794 Y138.295 E.04717
G1 X124.6 Y138.126 E.0144
G1 X124.72 Y137.827 E.01808
G1 X123.953 Y137.834 E.04302
G1 X123.953 Y137.365 E.02627
G1 X124.908 Y137.357 E.05358
G1 X124.946 Y137.262 E.00571
G1 X125.299 Y136.884 E.02898
G1 X123.953 Y136.897 E.07549
G1 X123.953 Y136.428 E.02627
G1 X125.741 Y136.412 E.10027
G1 X126.183 Y135.939 E.03628
G1 X123.953 Y135.959 E.12505
G1 X123.953 Y135.491 E.02627
G1 X126.261 Y135.47 E.12945
G1 X126.269 Y135.089 E.02138
G1 X126.247 Y135.001 E.00505
G1 X123.953 Y135.022 E.12862
G1 X123.953 Y134.554 E.02627
G1 X126.127 Y134.534 E.12192
G1 X126.12 Y134.505 E.0017
G1 X125.852 Y134.068 E.02871
G1 X123.953 Y134.085 E.10651
G1 X123.953 Y133.616 E.02627
G1 X125.441 Y133.603 E.08344
G3 X124.905 Y133.139 I3.142 J-4.175 E.03978
G1 X123.953 Y133.148 E.05338
M73 P41 R11
G1 X123.953 Y132.679 E.02627
G1 X124.721 Y132.672 E.04309
G1 X124.734 Y132.496 E.00992
G1 X124.876 Y132.202 E.01827
G1 X123.953 Y132.211 E.05176
G1 X123.953 Y131.742 E.02627
G1 X125.102 Y131.732 E.06446
G1 X125.2 Y131.528 E.01269
G1 X125.621 Y131.258 E.02799
G1 X123.953 Y131.273 E.09353
G1 X123.953 Y130.805 E.02627
G1 X126.362 Y130.783 E.13511
G1 X126.566 Y130.652 E.01357
G1 X126.471 Y130.329 E.0189
G2 X123.75 Y130.338 I-.855 J150.138 E.15257
M106 S201.45
; WIPE_START
G1 X125.75 Y130.331 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.19 Y129.356 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.462996
; LAYER_HEIGHT: 0.2
G1 F5850
M204 S6000
G1 X123.19 Y127.744 E.05518
G1 X123.206 Y127.676 E.00241
; LINE_WIDTH: 0.512292
G1 X123.223 Y127.607 E.00269
; LINE_WIDTH: 0.545633
G1 X123.24 Y127.539 E.00288
M204 S10000
G1 X123.277 Y127.564 F42000
; LINE_WIDTH: 0.493862
G1 F5850
M204 S6000
G1 X123.314 Y127.588 E.00163
; LINE_WIDTH: 0.448236
G1 X123.351 Y127.612 E.00147
; LINE_WIDTH: 0.40261
G1 X123.388 Y127.637 E.0013
; LINE_WIDTH: 0.356985
G1 X123.425 Y127.661 E.00114
; LINE_WIDTH: 0.311359
G1 X123.462 Y127.685 E.00097
; LINE_WIDTH: 0.265733
G1 X123.499 Y127.71 E.00081
M204 S10000
G1 X123.277 Y127.564 F42000
; LINE_WIDTH: 0.562207
G1 F5850
M204 S6000
G1 X123.24 Y127.539 E.00188
G1 X123.24 Y115.461 E.5111
; LINE_WIDTH: 0.537285
G1 X123.215 Y115.358 E.00425
; LINE_WIDTH: 0.487295
G1 X123.19 Y115.256 E.00382
; LINE_WIDTH: 0.461591
G1 X123.19 Y113.644 E.055
G1 X123.19 Y113.617 E.00092
G1 X123.243 Y113.594 E.00195
; LINE_WIDTH: 0.395202
G1 X123.295 Y113.571 E.00164
; LINE_WIDTH: 0.349321
G1 X123.347 Y113.548 E.00142
; LINE_WIDTH: 0.303441
G1 X123.399 Y113.525 E.00121
; LINE_WIDTH: 0.280909
G1 X131.011 Y113.525 E.14762
G1 X131.123 Y113.581 E.00243
; LINE_WIDTH: 0.351842
G1 X131.236 Y113.637 E.00316
; LINE_WIDTH: 0.399367
G1 X131.348 Y113.693 E.00364
; LINE_WIDTH: 0.446892
G1 X131.46 Y113.75 E.00413
; LINE_WIDTH: 0.494418
G1 X131.572 Y113.806 E.00462
M204 S10000
G1 X131.292 Y113.406 F42000
; LINE_WIDTH: 0.60399
G1 F5850
M204 S6000
G1 X131.292 Y115.256 E.08456
; WIPE_START
G1 F6416.312
G1 X131.292 Y113.406 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.873 Y115.2 Z3 F42000
G1 X123.499 Y115.29 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.265733
G1 F5850
M204 S6000
G1 X123.462 Y115.315 E.00081
; LINE_WIDTH: 0.31136
G1 X123.425 Y115.339 E.00097
; LINE_WIDTH: 0.356986
G1 X123.388 Y115.363 E.00114
; LINE_WIDTH: 0.402612
G1 X123.351 Y115.388 E.0013
; LINE_WIDTH: 0.448238
G1 X123.314 Y115.412 E.00147
; LINE_WIDTH: 0.493865
G1 X123.277 Y115.436 E.00163
; LINE_WIDTH: 0.539491
G1 X123.24 Y115.461 E.0018
; WIPE_START
G1 F7249.726
G1 X123.277 Y115.436 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.442 Y121.832 Z3 F42000
G1 X131.292 Y127.744 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.60399
G1 F5850
M204 S6000
G1 X131.292 Y129.356 E.0737
; WIPE_START
G1 F6416.312
G1 X131.292 Y127.744 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.459 Y130.435 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5850
M204 S6000
G1 X129.459 Y130.307 E.00424
G1 X130.621 Y130.307 E.03853
G1 X130.621 Y130.646 E.01124
G1 X130.119 Y131.276 E.02671
G2 X130.6 Y133.241 I1.63 J.643 E.07156
G1 X130.621 Y134.896 E.05489
M204 S10000
G1 X130.802 Y136.366 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.41858
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X129.917 Y136.374 E.04965
G1 X129.398 Y136.847 E.03937
G1 X130.253 Y136.839 E.04795
G1 X130.127 Y137.204 E.02165
G1 X130.129 Y137.309 E.00588
G1 X128.879 Y137.321 E.07006
G1 X128.36 Y137.794 E.03937
G1 X130.153 Y137.778 E.10052
G1 X130.302 Y138.245 E.0275
G1 X128.161 Y138.264 E.12003
G1 X128.272 Y138.378 E.00892
G1 X127.713 Y138.737 E.03725
G1 X130.6 Y138.711 E.16185
G1 X130.6 Y139.179 E.02627
G1 X126.591 Y139.216 E.22477
M106 S201.45
M204 S10000
G1 X126.179 Y141.307 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F5850
M204 S6000
G1 X127.808 Y141.292 E.05401
G2 X127.55 Y141.642 I.661 J.756 E.01454
G1 X130.199 Y141.642 E.08786
G3 X130.489 Y141.268 I1.063 J.523 E.01582
G1 X128.86 Y141.282 E.05401
M204 S10000
G1 X129.067 Y131.488 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F5850
M204 S6000
G1 X129.067 Y130.351 E.03492
G1 X126.909 Y130.351 E.06632
G1 X127.01 Y130.698 E.0111
G1 X126.986 Y130.856 E.00491
G3 X125.522 Y131.813 I-19.552 J-28.311 E.05374
G1 X125.141 Y132.605 E.02701
G1 X125.128 Y132.781 E.00543
G3 X126.123 Y133.738 I-4.53 J5.709 E.04251
G1 X126.49 Y134.318 E.02106
G1 X126.677 Y135.016 E.02221
G1 X126.666 Y135.958 E.02894
G1 X126.615 Y136.083 E.00415
G1 X125.301 Y137.488 E.0591
G1 X125.093 Y138.007 E.01719
G1 X125.799 Y138.603 E.02837
G1 X126.264 Y139.175 E.02264
G1 X127.623 Y138.303 E.04961
G1 X127.554 Y138.233 E.00303
G1 X127.508 Y138.052 E.00574
G1 X127.562 Y137.962 E.00324
G1 X129.067 Y136.589 E.06259
G1 X129.067 Y131.548 E.1549
M204 S10000
G1 X128.69 Y131.488 F42000
G1 F5850
M204 S6000
G1 X128.69 Y130.728 E.02334
G1 X127.351 Y130.728 E.04114
G1 X127.299 Y131.065 E.01048
G1 X127.135 Y131.227 E.00709
G1 X125.816 Y132.072 E.04814
G1 X125.538 Y132.65 E.01968
G3 X126.406 Y133.488 I-2.7 J3.662 E.03718
G1 X126.812 Y134.121 E.0231
G1 X127.042 Y134.922 E.02563
G1 X127.043 Y135.965 E.03203
G1 X126.89 Y136.34 E.01245
G1 X125.625 Y137.693 E.05693
G1 X125.543 Y137.899 E.00679
G1 X126.038 Y138.312 E.01982
G1 X126.35 Y138.671 E.01463
G1 X127.19 Y138.133 E.03066
G1 X127.144 Y137.953 E.00571
G1 X127.308 Y137.683 E.00971
G1 X128.69 Y136.423 E.05748
G1 X128.69 Y131.548 E.14978
M204 S10000
G1 X128.313 Y131.488 F42000
G1 F5850
M204 S6000
G1 X128.313 Y131.105 E.01175
G1 X127.639 Y131.105 E.02072
G1 X127.613 Y131.275 E.00528
G1 X127.338 Y131.544 E.01182
G1 X126.109 Y132.332 E.04485
G1 X126.003 Y132.553 E.00754
G3 X126.715 Y133.269 I-2.362 J3.064 E.03111
G1 X127.133 Y133.924 E.02389
G1 X127.243 Y134.183 E.00864
G1 X127.408 Y134.829 E.0205
G1 X127.437 Y135.081 E.00778
G1 X127.42 Y135.972 E.0274
; LINE_WIDTH: 0.438075
G1 X127.306 Y136.297 E.01109
; LINE_WIDTH: 0.477672
G1 X127.192 Y136.623 E.01221
G1 X126.741 Y137.086 E.02293
; LINE_WIDTH: 0.484318
G1 X126.522 Y137.346 E.01219
; LINE_WIDTH: 0.533236
G3 X126.113 Y137.809 I-4.648 J-3.692 E.02472
G1 X126.441 Y138.096 E.01738
G1 X126.74 Y137.904 E.01421
G1 X126.723 Y137.839 E.00269
; LINE_WIDTH: 0.519173
G1 X126.854 Y137.64 E.00922
; LINE_WIDTH: 0.479653
G1 X126.985 Y137.442 E.00845
G1 X127.508 Y136.942 E.02576
; LINE_WIDTH: 0.474245
G1 X127.837 Y136.666 E.01511
; LINE_WIDTH: 0.421448
G2 X128.313 Y136.256 I-4.632 J-5.861 E.01937
G1 X128.313 Y131.548 E.14523
M204 S10000
G1 X127.936 Y131.488 F42000
; LINE_WIDTH: 0.41999
G1 F5850
M204 S6000
G1 X127.542 Y131.862 E.01671
G1 X126.532 Y132.509 E.03684
G1 X126.97 Y132.987 E.01992
G1 X127.455 Y133.727 E.02718
; LINE_WIDTH: 0.440684
G1 X127.554 Y133.974 E.00864
; LINE_WIDTH: 0.482072
G1 X127.654 Y134.221 E.00953
; LINE_WIDTH: 0.523459
G1 X127.754 Y134.468 E.01043
; LINE_WIDTH: 0.564847
G1 X127.853 Y134.715 E.01133
G1 X127.874 Y134.549 E.00715
; LINE_WIDTH: 0.523459
G1 X127.895 Y134.382 E.00658
; LINE_WIDTH: 0.482072
G1 X127.915 Y134.215 E.00601
; LINE_WIDTH: 0.421294
G1 X127.936 Y134.048 E.00518
G1 X127.936 Y131.548 E.0771
M204 S10000
G1 X127.565 Y132.287 F42000
; LINE_WIDTH: 0.40734
G1 F5850
M204 S6000
G1 X127.105 Y132.582 E.01622
G1 X127.452 Y133.012 E.01639
G1 X127.565 Y133.197 E.00646
G1 X127.565 Y132.347 E.02525
M204 S10000
G1 X127.865 Y136.058 F42000
; LINE_WIDTH: 0.555334
G1 F5850
M204 S6000
G1 X127.875 Y135.089 E.04047
G1 X127.857 Y134.775 E.01312
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7025.572
G1 X127.875 Y135.089 E-.18605
G1 X127.865 Y136.058 E-.57395
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/75
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z3 I1.137 J.433 P1  F42000
G1 X131.107 Y127.548 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4899
M204 S6000
G1 X131.107 Y115.452 E.40124
G1 X131.384 Y115.452 E.00918
G1 X131.384 Y127.548 E.40124
G1 X131.167 Y127.548 E.00719
; WIPE_START
G1 F8843.478
G1 X131.157 Y125.548 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.815 Y129.16 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4899
M204 S5000
G1 X123.595 Y129.16 E.22185
G1 X123.595 Y127.94 E.03749
G1 X130.815 Y127.94 E.22185
G1 X130.815 Y129.1 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.815 Y129.117 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.695 Y127.81 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F4899
M204 S5000
G1 X123.695 Y115.19 E.38778
G1 X130.715 Y115.19 E.21571
G1 X130.715 Y127.81 E.38778
G1 X123.755 Y127.81 E.21386
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.746 Y125.81 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.639 Y118.178 Z3.2 F42000
G1 X123.595 Y115.06 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F4899
M204 S5000
G1 X123.595 Y113.84 E.03749
G1 X130.815 Y113.84 E.22185
G1 X130.815 Y115.06 E.03749
G1 X123.655 Y115.06 E.22001
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.595 Y113.84 E-.46416
G1 X124.374 Y113.84 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.161 Y121.469 Z3.2 F42000
G1 X123.59 Y141.991 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4899
M204 S6000
G1 X123.59 Y129.959 E.39911
G1 X130.977 Y129.959 E.24503
G1 X130.977 Y141.99 E.3991
G1 X123.65 Y141.991 E.24304
M204 S10000
G1 X123.183 Y142.398 F42000
G1 F4899
M204 S6000
G1 X123.183 Y129.552 E.42612
M73 P42 R11
G1 X131.384 Y129.552 E.27204
G1 X131.384 Y142.398 E.42611
G1 X123.243 Y142.398 E.27005
M204 S250
G1 X122.933 Y142.783 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4899
M204 S5000
G3 X122.791 Y142.59 I.061 J-.194 E.00789
G1 X122.791 Y113.408 E.89669
G3 X122.977 Y113.21 I.198 J0 E.00917
G1 X131.631 Y113.216 E.26591
G3 X131.776 Y113.41 I-.048 J.187 E.00803
G1 X131.769 Y142.648 E.89841
G3 X131.592 Y142.79 I-.191 J-.058 E.00741
G1 X122.993 Y142.783 E.26422
; WIPE_START
G1 F9547.055
M204 S6000
G1 X122.828 Y142.711 E-.06845
G1 X122.791 Y142.59 E-.04818
G1 X122.791 Y140.897 E-.64337
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


G1 X126.436 Y141.642 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4899
M204 S6000
G1 X124.808 Y141.643 E.05401
G3 X125.307 Y140.982 I2.436 J1.321 E.02758
G1 X128.29 Y140.982 E.09893
G3 X127.689 Y141.642 I-12.96 J-11.185 E.02963
G1 X130.05 Y141.642 E.07832
G3 X130.629 Y140.894 I2.707 J1.499 E.0315
G1 X130.629 Y138.291 E.08635
G3 X130.152 Y136.19 I.98 J-1.328 E.07791
G3 X130.629 Y135.653 I10.519 J8.877 E.02382
G1 X130.629 Y133.05 E.08635
G3 X130.152 Y130.948 I.98 J-1.328 E.07791
G2 X130.629 Y130.307 I-.824 J-1.112 E.02689
G1 X129.459 Y130.307 E.0388
G1 X129.459 Y130.662 E.01175
; WIPE_START
G1 F8843.478
G1 X129.459 Y130.307 E-.13463
G1 X130.629 Y130.307 E-.44444
G1 X130.629 Y130.412 E-.03969
G1 X130.382 Y130.69 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.296 Y129.356 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.61181
G1 F4899
M204 S6000
G1 X131.296 Y127.744 E.07472
; WIPE_START
G1 F6328.113
G1 X131.296 Y129.356 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.067 Y132.894 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F4899
M204 S6000
G1 X129.067 Y130.351 E.07812
G1 X123.982 Y130.351 E.15624
G1 X123.982 Y140.793 E.32084
G1 X124.438 Y140.793 E.01398
G1 X124.622 Y140.635 E.00747
G1 X124.745 Y140.59 E.00402
G1 X129.056 Y140.59 E.13246
G1 X129.067 Y132.954 E.23463
M204 S10000
G1 X128.69 Y132.894 F42000
G1 F4899
M204 S6000
G1 X128.69 Y130.728 E.06653
G1 X124.359 Y130.728 E.13306
G1 X124.36 Y140.363 E.29605
G1 X124.745 Y140.212 E.01271
G1 X128.69 Y140.212 E.12123
G1 X128.69 Y132.954 E.22304
M204 S10000
G1 X128.313 Y132.894 F42000
G1 F4899
M204 S6000
G1 X128.313 Y131.105 E.05495
G1 X124.737 Y131.105 E.10989
G1 X124.737 Y139.838 E.26834
G1 X128.313 Y139.835 E.10989
G1 X128.313 Y132.954 E.21145
M204 S10000
G1 X127.936 Y132.894 F42000
G1 F4899
M204 S6000
G1 X127.936 Y131.482 E.04336
G1 X125.114 Y131.482 E.08672
G1 X125.114 Y139.458 E.24507
G1 X127.936 Y139.458 E.08672
G1 X127.936 Y132.954 E.19987
M204 S10000
G1 X127.559 Y132.894 F42000
G1 F4899
M204 S6000
G1 X127.559 Y131.859 E.03177
G1 X125.491 Y131.859 E.06355
G1 X125.491 Y139.081 E.2219
G1 X127.559 Y139.081 E.06355
G1 X127.559 Y132.954 E.18828
M204 S10000
G1 X127.182 Y132.894 F42000
G1 F4899
M204 S6000
G1 X127.182 Y132.237 E.02019
G1 X125.868 Y132.237 E.04038
G1 X125.868 Y138.704 E.19873
G1 X127.182 Y138.704 E.04038
G1 X127.182 Y132.954 E.1767
M204 S10000
G1 X126.759 Y132.894 F42000
; LINE_WIDTH: 0.51139
G1 F4899
M204 S6000
G1 X126.759 Y132.659 E.00894
G1 X126.291 Y132.659 E.01788
G1 X126.291 Y138.281 E.21462
G1 X126.759 Y138.281 E.01788
G1 X126.759 Y132.954 E.20339
; WIPE_START
G1 F7684.591
G1 X126.759 Y134.954 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.193 Y129.356 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.456383
G1 F4899
M204 S6000
G1 X123.193 Y127.744 E.05431
G1 X123.218 Y127.642 E.00352
; LINE_WIDTH: 0.529857
G1 X123.243 Y127.541 E.00415
M204 S10000
G1 X123.499 Y127.71 F42000
; LINE_WIDTH: 0.265202
G1 F4899
M204 S6000
G1 X123.463 Y127.686 E.00079
; LINE_WIDTH: 0.309765
G1 X123.426 Y127.662 E.00095
; LINE_WIDTH: 0.354328
G1 X123.389 Y127.638 E.00111
; LINE_WIDTH: 0.39889
G1 X123.353 Y127.613 E.00127
; LINE_WIDTH: 0.443453
G1 X123.316 Y127.589 E.00143
; LINE_WIDTH: 0.488016
G1 X123.28 Y127.565 E.00159
; LINE_WIDTH: 0.55478
G1 X123.243 Y127.541 E.00183
G1 X123.243 Y115.459 E.50394
; LINE_WIDTH: 0.52986
G1 X123.218 Y115.357 E.00415
; LINE_WIDTH: 0.47986
G1 X123.193 Y115.256 E.00372
; LINE_WIDTH: 0.45423
G1 X123.193 Y113.644 E.05403
G1 X123.194 Y113.613 E.00102
G1 X123.246 Y113.591 E.00187
; LINE_WIDTH: 0.390896
G1 X123.297 Y113.569 E.00158
; LINE_WIDTH: 0.346746
G1 X123.348 Y113.547 E.00138
; LINE_WIDTH: 0.302595
G1 X123.399 Y113.525 E.00118
; LINE_WIDTH: 0.280902
G1 X131.011 Y113.525 E.14762
G1 X131.125 Y113.582 E.00247
; LINE_WIDTH: 0.351799
G1 X131.239 Y113.639 E.0032
; LINE_WIDTH: 0.39932
G1 X131.353 Y113.696 E.00369
; LINE_WIDTH: 0.44684
G1 X131.466 Y113.753 E.00419
; LINE_WIDTH: 0.49436
G1 X131.58 Y113.81 E.00468
M204 S10000
G1 X131.296 Y113.406 F42000
; LINE_WIDTH: 0.61181
G1 F4899
M204 S6000
G1 X131.296 Y115.256 E.08574
; WIPE_START
G1 F6328.113
G1 X131.296 Y113.406 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.877 Y115.199 Z3.2 F42000
G1 X123.499 Y115.29 Z3.2
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.265201
G1 F4899
M204 S6000
G1 X123.463 Y115.314 E.00079
; LINE_WIDTH: 0.309764
G1 X123.426 Y115.338 E.00095
; LINE_WIDTH: 0.354326
G1 X123.389 Y115.362 E.00111
; LINE_WIDTH: 0.398888
G1 X123.353 Y115.387 E.00127
; LINE_WIDTH: 0.44345
G1 X123.316 Y115.411 E.00143
; LINE_WIDTH: 0.488012
G1 X123.28 Y115.435 E.00159
; LINE_WIDTH: 0.532574
G1 X123.243 Y115.459 E.00175
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7352.129
G1 X123.28 Y115.435 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/75
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z3.2 I-1.022 J.661 P1  F42000
G1 X131.107 Y127.548 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4858
M204 S6000
G1 X131.107 Y115.452 E.40124
G1 X131.392 Y115.452 E.00944
G1 X131.392 Y127.548 E.40124
G1 X131.167 Y127.548 E.00745
; WIPE_START
G1 F8843.478
G1 X131.157 Y125.548 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.815 Y129.16 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4858
M204 S5000
G1 X123.595 Y129.16 E.22185
G1 X123.595 Y127.94 E.03749
G1 X130.815 Y127.94 E.22185
G1 X130.815 Y129.1 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.815 Y129.117 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.695 Y127.81 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F4858
M204 S5000
G1 X123.695 Y115.19 E.38778
G1 X130.715 Y115.19 E.21571
G1 X130.715 Y127.81 E.38778
G1 X123.755 Y127.81 E.21386
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.746 Y125.81 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.639 Y118.178 Z3.4 F42000
G1 X123.595 Y115.06 Z3.4
G1 Z3
G1 E.8 F1800
G1 F4858
M204 S5000
G1 X123.595 Y113.84 E.03749
G1 X130.815 Y113.84 E.22185
G1 X130.815 Y115.06 E.03749
G1 X123.655 Y115.06 E.22001
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.595 Y113.84 E-.46416
G1 X124.374 Y113.84 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.163 Y121.47 Z3.4 F42000
G1 X123.598 Y141.991 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4858
M204 S6000
G1 X123.598 Y129.959 E.39911
G1 X130.985 Y129.959 E.24504
G1 X130.985 Y141.99 E.3991
G1 X123.658 Y141.991 E.24305
M204 S10000
G1 X123.191 Y142.398 F42000
G1 F4858
M204 S6000
G1 X123.191 Y129.552 E.42612
G1 X131.392 Y129.552 E.27205
G1 X131.392 Y142.398 E.42611
G1 X123.251 Y142.398 E.27006
M204 S250
G1 X122.941 Y142.783 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4858
M204 S5000
G3 X122.799 Y142.59 I.061 J-.194 E.00788
G1 X122.799 Y113.408 E.8967
G3 X122.985 Y113.21 I.198 J.001 E.00917
G1 X131.596 Y113.21 E.26461
G3 X131.784 Y113.41 I-.01 J.198 E.0093
G1 X131.777 Y142.648 E.8984
G3 X131.597 Y142.79 I-.191 J-.058 E.00749
G1 X123.001 Y142.783 E.26415
; WIPE_START
G1 F9547.055
M204 S6000
G1 X122.836 Y142.711 E-.06841
G1 X122.799 Y142.59 E-.04817
G1 X122.799 Y140.897 E-.64342
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


G1 X126.255 Y141.642 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4858
M204 S6000
G1 X124.626 Y141.643 E.05401
G3 X125.093 Y140.982 I1.347 J.456 E.02721
G1 X128.525 Y140.982 E.11386
G3 X127.807 Y141.642 I-2.28 J-1.759 E.03254
G1 X129.868 Y141.642 E.06837
G3 X130.637 Y140.719 I1.715 J.646 E.04062
G1 X130.637 Y138.126 E.08601
G3 X129.927 Y136.19 I.961 J-1.45 E.07321
G3 X130.637 Y135.477 I2.425 J1.706 E.03351
G1 X130.637 Y132.884 E.08601
G3 X129.927 Y130.948 I.961 J-1.45 E.07321
G3 X130.555 Y130.307 I2.177 J1.503 E.02989
G1 X129.459 Y130.307 E.03633
G1 X129.459 Y130.84 E.01768
M204 S10000
G1 X129.067 Y132.89 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F4858
M204 S6000
G1 X129.067 Y130.351 E.078
M73 P43 R11
G1 X123.99 Y130.351 E.15601
G1 X123.99 Y140.793 E.32084
G1 X124.438 Y140.793 E.01376
G1 X124.622 Y140.635 E.00747
G1 X124.745 Y140.59 E.00402
G1 X129.056 Y140.59 E.13246
G1 X129.067 Y132.95 E.23474
M204 S10000
G1 X128.69 Y132.89 F42000
G1 F4858
M204 S6000
G1 X128.69 Y130.728 E.06642
G1 X124.367 Y130.728 E.13283
G1 X124.367 Y140.357 E.29586
G1 X124.745 Y140.212 E.01243
G1 X128.69 Y140.212 E.12123
G1 X128.69 Y132.95 E.22316
M204 S10000
G1 X128.313 Y132.89 F42000
G1 F4858
M204 S6000
G1 X128.313 Y131.105 E.05483
G1 X124.744 Y131.105 E.10966
G1 X124.745 Y139.835 E.26822
G1 X128.313 Y139.835 E.10964
G1 X128.313 Y132.95 E.21157
M204 S10000
G1 X127.936 Y132.89 F42000
G1 F4858
M204 S6000
G1 X127.936 Y131.482 E.04325
G1 X125.121 Y131.482 E.08649
G1 X125.121 Y139.458 E.24507
G1 X127.936 Y139.458 E.08649
G1 X127.936 Y132.95 E.19998
M204 S10000
G1 X127.559 Y132.89 F42000
G1 F4858
M204 S6000
G1 X127.559 Y131.859 E.03166
G1 X125.498 Y131.859 E.06332
G1 X125.498 Y139.081 E.2219
G1 X127.559 Y139.081 E.06332
G1 X127.559 Y132.95 E.1884
M204 S10000
G1 X127.182 Y132.89 F42000
G1 F4858
M204 S6000
G1 X127.182 Y132.237 E.02007
G1 X125.875 Y132.237 E.04015
G1 X125.875 Y138.704 E.19873
G1 X127.182 Y138.704 E.04015
G1 X127.182 Y132.95 E.17681
M204 S10000
G1 X126.761 Y132.89 F42000
; LINE_WIDTH: 0.50767
G1 F4858
M204 S6000
G1 X126.761 Y132.657 E.0088
G1 X126.296 Y132.657 E.0176
G1 X126.296 Y138.283 E.21306
G1 X126.761 Y138.283 E.0176
G1 X126.761 Y132.95 E.20198
; WIPE_START
G1 F7746.101
G1 X126.761 Y134.95 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.197 Y129.356 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.44893
G1 F4858
M204 S6000
G1 X123.197 Y127.744 E.05333
G1 X123.222 Y127.643 E.00343
; LINE_WIDTH: 0.522418
G1 X123.247 Y127.543 E.00405
M204 S10000
G1 X123.499 Y127.71 F42000
; LINE_WIDTH: 0.26467
G1 F4858
M204 S6000
G1 X123.463 Y127.686 E.00078
; LINE_WIDTH: 0.30817
G1 X123.427 Y127.663 E.00094
; LINE_WIDTH: 0.35167
G1 X123.391 Y127.639 E.00109
; LINE_WIDTH: 0.39517
G1 X123.355 Y127.615 E.00124
; LINE_WIDTH: 0.43867
G1 X123.319 Y127.591 E.0014
; LINE_WIDTH: 0.48217
G1 X123.283 Y127.567 E.00155
; LINE_WIDTH: 0.547343
G1 X123.247 Y127.543 E.00178
G1 X123.247 Y115.457 E.49677
; LINE_WIDTH: 0.52242
G1 X123.222 Y115.357 E.00405
; LINE_WIDTH: 0.47242
G1 X123.197 Y115.256 E.00363
; LINE_WIDTH: 0.44686
G1 X123.197 Y113.644 E.05306
G1 X123.198 Y113.61 E.00112
G1 X123.249 Y113.589 E.00179
; LINE_WIDTH: 0.386607
G1 X123.299 Y113.568 E.00153
; LINE_WIDTH: 0.344172
G1 X123.349 Y113.546 E.00134
; LINE_WIDTH: 0.301738
G1 X123.399 Y113.525 E.00115
; LINE_WIDTH: 0.280894
G1 X131.011 Y113.525 E.14761
G1 X131.127 Y113.583 E.0025
; LINE_WIDTH: 0.351752
G1 X131.242 Y113.641 E.00325
; LINE_WIDTH: 0.399263
G1 X131.357 Y113.698 E.00374
; LINE_WIDTH: 0.446774
G1 X131.473 Y113.756 E.00424
; LINE_WIDTH: 0.494285
G1 X131.588 Y113.814 E.00474
M204 S10000
G1 X131.3 Y113.406 F42000
; LINE_WIDTH: 0.61963
G1 F4858
M204 S6000
G1 X131.3 Y115.256 E.08692
; WIPE_START
G1 F6242.306
G1 X131.3 Y113.406 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.88 Y115.198 Z3.4 F42000
G1 X123.499 Y115.29 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.26467
G1 F4858
M204 S6000
G1 X123.463 Y115.314 E.00078
; LINE_WIDTH: 0.30817
G1 X123.427 Y115.337 E.00094
; LINE_WIDTH: 0.351669
G1 X123.391 Y115.361 E.00109
; LINE_WIDTH: 0.395169
G1 X123.355 Y115.385 E.00124
; LINE_WIDTH: 0.438668
G1 X123.319 Y115.409 E.00139
; LINE_WIDTH: 0.482168
G1 X123.283 Y115.433 E.00155
; LINE_WIDTH: 0.525668
G1 X123.247 Y115.457 E.0017
; WIPE_START
G1 F7457.318
G1 X123.283 Y115.433 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.448 Y121.829 Z3.4 F42000
G1 X131.3 Y127.744 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.61963
G1 F4858
M204 S6000
G1 X131.3 Y129.356 E.07575
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6242.306
G1 X131.3 Y127.744 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/75
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z3.4 I.869 J-.852 P1  F42000
G1 X131.107 Y127.548 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5058
M204 S6000
G1 X131.107 Y115.452 E.40124
G1 X131.402 Y115.452 E.00978
G1 X131.402 Y127.548 E.40124
G1 X131.167 Y127.548 E.00779
; WIPE_START
G1 F8843.478
G1 X131.157 Y125.548 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.815 Y129.16 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5058
M204 S5000
G1 X123.595 Y129.16 E.22185
G1 X123.595 Y127.94 E.03749
G1 X130.815 Y127.94 E.22185
G1 X130.815 Y129.1 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.815 Y129.117 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.695 Y127.81 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
G1 F5058
M204 S5000
G1 X123.695 Y115.19 E.38778
G1 X130.715 Y115.19 E.21571
G1 X130.715 Y127.81 E.38778
G1 X123.755 Y127.81 E.21386
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.746 Y125.81 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.639 Y118.178 Z3.6 F42000
G1 X123.595 Y115.06 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F5058
M204 S5000
G1 X123.595 Y113.84 E.03749
G1 X130.815 Y113.84 E.22185
G1 X130.815 Y115.06 E.03749
G1 X123.655 Y115.06 E.22001
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.595 Y113.84 E-.46416
G1 X124.374 Y113.84 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.165 Y121.47 Z3.6 F42000
G1 X123.605 Y141.991 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5058
M204 S6000
G1 X123.605 Y129.959 E.39911
G1 X130.995 Y129.959 E.24513
G1 X130.995 Y141.99 E.3991
G1 X123.665 Y141.991 E.24314
M204 S10000
G1 X123.198 Y142.398 F42000
G1 F5058
M204 S6000
G1 X123.198 Y129.552 E.42612
G1 X131.402 Y129.552 E.27214
G1 X131.402 Y142.398 E.42611
G1 X123.258 Y142.398 E.27015
M204 S250
G1 X122.948 Y142.783 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5058
M204 S5000
G3 X122.806 Y142.59 I.061 J-.194 E.00788
G1 X122.806 Y113.407 E.8967
G3 X122.992 Y113.21 I.199 J.001 E.00918
G1 X131.606 Y113.21 E.26467
G3 X131.794 Y113.41 I-.011 J.198 E.0093
G1 X131.787 Y142.648 E.8984
G3 X131.606 Y142.79 I-.192 J-.059 E.00752
G1 X123.008 Y142.783 E.26421
; WIPE_START
G1 F9547.055
M204 S6000
G1 X122.843 Y142.711 E-.06836
G1 X122.806 Y142.59 E-.04817
G1 X122.806 Y140.897 E-.64347
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


G1 X125.848 Y140.59 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F5058
M204 S6000
G1 X125.571 Y140.397 E.01037
G1 X125.237 Y139.972 E.01661
G1 X125.02 Y139.497 E.01604
G1 X124.896 Y138.921 E.01811
G1 X124.893 Y130.351 E.26332
G1 X123.997 Y130.351 E.02751
G1 X123.997 Y140.793 E.32084
G1 X124.438 Y140.793 E.01353
G1 X124.709 Y140.593 E.01036
G3 X125.788 Y140.59 I.925 J120.837 E.03317
M204 S10000
G1 X124.917 Y140.196 F42000
; LINE_WIDTH: 0.4523
G1 F5058
M204 S6000
G1 X124.663 Y139.661 E.01978
; LINE_WIDTH: 0.471407
G1 X124.595 Y139.459 E.00743
; LINE_WIDTH: 0.50962
G1 X124.528 Y139.257 E.00809
; LINE_WIDTH: 0.547834
G1 X124.46 Y139.055 E.00876
G1 X124.437 Y139.226 E.00707
; LINE_WIDTH: 0.50962
G1 X124.414 Y139.396 E.00653
; LINE_WIDTH: 0.454606
G1 X124.391 Y139.566 E.00576
G1 X124.391 Y140.325 E.02545
G1 X124.634 Y140.207 E.00907
G1 X124.857 Y140.199 E.00748
M204 S10000
G1 X124.445 Y130.799 F42000
; LINE_WIDTH: 0.563131
G1 F5058
M204 S6000
G1 X124.449 Y138.972 E.34647
M204 S10000
G1 X129.061 Y140.512 F42000
; LINE_WIDTH: 0.48124
G1 F5058
M204 S6000
G2 X129.056 Y140.606 I-.027 J.046 E.00786
M204 S10000
G1 X128.445 Y140.62 F42000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5058
M204 S2000
G1 X129.237 Y139.828 E.0344
G1 X129.237 Y139.295
G1 X127.772 Y140.759 E.06364
G1 X127.239 Y140.759
G1 X129.237 Y138.761 E.08681
G1 X129.237 Y138.228
M73 P44 R11
G1 X126.719 Y140.746 E.1094
G1 X126.318 Y140.614
G1 X129.237 Y137.695 E.12683
G1 X129.237 Y137.162
G1 X125.962 Y140.436 E.14229
G1 X125.663 Y140.202
G1 X129.237 Y136.628 E.15527
G1 X129.237 Y136.095
G1 X125.433 Y139.898 E.16527
G1 X125.261 Y139.538
G1 X129.237 Y135.562 E.17278
G1 X129.237 Y135.029
G1 X125.134 Y139.131 E.17827
G1 X125.1 Y138.632
G1 X129.237 Y134.495 E.17977
G1 X129.237 Y133.962
G1 X125.1 Y138.099 E.17977
G1 X125.1 Y137.566
G1 X129.237 Y133.429 E.17977
G1 X129.237 Y132.896
G1 X125.1 Y137.033 E.17977
G1 X125.1 Y136.499
G1 X129.237 Y132.362 E.17977
G1 X129.237 Y131.829
G1 X125.1 Y135.966 E.17977
G1 X125.1 Y135.433
G1 X129.237 Y131.296 E.17977
G1 X129.237 Y130.763
G1 X125.1 Y134.9 E.17977
G1 X125.1 Y134.366
G1 X129.237 Y130.229 E.17977
G1 X128.751 Y130.182
G1 X125.1 Y133.833 E.15868
G1 X125.1 Y133.3
G1 X128.218 Y130.182 E.13551
G1 X127.685 Y130.182
G1 X125.1 Y132.767 E.11233
G1 X125.1 Y132.233
G1 X127.139 Y130.194 E.08862
G1 X126.618 Y130.182
G1 X125.1 Y131.7 E.06599
G1 X125.1 Y131.167
G1 X126.085 Y130.182 E.04282
G1 X125.552 Y130.182
G1 X125.1 Y130.634 E.01964
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.552 Y130.182 E-.24292
G1 X126.085 Y130.182 E-.20264
G1 X125.5 Y130.767 E-.31444
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.663 Y138.086 Z3.6 F42000
G1 X128.397 Y140.572 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0962615
G1 F5058
M204 S6000
G1 X128.076 Y140.745 E.00159
M204 S10000
G1 X128.383 Y140.557 F42000
; LINE_WIDTH: 0.2069
G1 F5058
M204 S6000
G1 X128.082 Y140.758 E.00483
M204 S10000
G1 X126.004 Y141.642 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5058
M204 S6000
G1 X124.376 Y141.643 E.05401
G3 X124.592 Y141.185 I.361 J-.11 E.01838
G1 X124.795 Y140.982 E.00954
G1 X128.895 Y140.982 E.136
G1 X128.821 Y141.103 E.00472
G1 X127.943 Y141.642 E.03419
G1 X129.617 Y141.642 E.05556
G3 X129.8 Y141.103 I.469 J-.142 E.02014
G1 X130.647 Y140.583 E.03297
G1 X130.647 Y138.073 E.08327
G3 X129.601 Y136.19 I1.729 J-2.192 E.07337
G1 X129.8 Y135.862 E.0127
G1 X130.647 Y135.342 E.03297
G1 X130.647 Y132.832 E.08327
G3 X129.601 Y130.948 I1.729 J-2.192 E.07337
G1 X129.8 Y130.621 E.0127
G1 X130.31 Y130.307 E.01987
G1 X130.647 Y130.307 E.01117
G1 X130.647 Y131.599 E.04285
; WIPE_START
G1 F8843.478
G1 X130.647 Y130.307 E-.49082
G1 X130.31 Y130.307 E-.12793
G1 X129.993 Y130.502 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.305 Y129.356 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.62974
G1 F5058
M204 S6000
G1 X131.305 Y127.744 E.07708
; WIPE_START
G1 F6134.76
G1 X131.305 Y129.356 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.672 Y129.356 Z3.6 F42000
G1 X123.201 Y129.356 Z3.6
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.441478
G1 F5058
M204 S6000
G1 X123.201 Y127.744 E.05235
G1 X123.226 Y127.644 E.00334
; LINE_WIDTH: 0.514976
G1 X123.251 Y127.545 E.00395
M204 S10000
G1 X123.499 Y127.711 F42000
; LINE_WIDTH: 0.267675
G1 F5058
M204 S6000
G1 X123.458 Y127.683 E.00091
; LINE_WIDTH: 0.317185
G1 X123.416 Y127.655 E.00111
; LINE_WIDTH: 0.366695
G1 X123.375 Y127.628 E.00131
; LINE_WIDTH: 0.416205
G1 X123.334 Y127.6 E.00152
; LINE_WIDTH: 0.465715
G1 X123.292 Y127.572 E.00172
; LINE_WIDTH: 0.539879
G1 X123.251 Y127.545 E.00202
G1 X123.251 Y115.455 E.48957
M204 S10000
G1 X123.499 Y115.289 F42000
; LINE_WIDTH: 0.267675
G1 F5058
M204 S6000
G1 X123.458 Y115.317 E.00091
; LINE_WIDTH: 0.317184
G1 X123.416 Y115.345 E.00111
; LINE_WIDTH: 0.366693
G1 X123.375 Y115.372 E.00131
; LINE_WIDTH: 0.416202
G1 X123.334 Y115.4 E.00152
; LINE_WIDTH: 0.465711
G1 X123.292 Y115.428 E.00172
; LINE_WIDTH: 0.51522
G1 X123.251 Y115.455 E.00192
; LINE_WIDTH: 0.51498
G1 X123.226 Y115.356 E.00395
; LINE_WIDTH: 0.46498
G1 X123.201 Y115.256 E.00353
; LINE_WIDTH: 0.439492
G1 X123.201 Y113.644 E.05209
G1 X123.202 Y113.607 E.00121
G1 X123.252 Y113.586 E.00172
; LINE_WIDTH: 0.382387
G1 X123.301 Y113.566 E.00147
; LINE_WIDTH: 0.341649
G1 X123.35 Y113.546 E.0013
; LINE_WIDTH: 0.30091
G1 X123.399 Y113.525 E.00112
; LINE_WIDTH: 0.280888
G1 X131.011 Y113.525 E.14761
G1 X131.129 Y113.584 E.00254
; LINE_WIDTH: 0.351706
G1 X131.246 Y113.643 E.0033
; LINE_WIDTH: 0.399207
G1 X131.363 Y113.701 E.00381
; LINE_WIDTH: 0.446708
G1 X131.481 Y113.76 E.00432
; LINE_WIDTH: 0.49421
G1 X131.598 Y113.819 E.00483
M204 S10000
G1 X131.305 Y113.406 F42000
; LINE_WIDTH: 0.62974
G1 F5058
M204 S6000
G1 X131.305 Y115.256 E.08844
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6134.76
G1 X131.305 Y113.406 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/75
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
M106 S196.35
; OBJECT_ID: 394
M204 S10000
G17
G3 Z3.6 I-1.207 J-.159 P1  F42000
G1 X127.925 Y139.035 Z3.6
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X126.852 Y139.035 E.03296
G1 X126.852 Y129.965 E.2787
G1 X127.925 Y129.965 E.03296
G1 X127.925 Y138.975 E.27685
; WIPE_START
M204 S6000
G1 X126.852 Y139.035 E-.40822
G1 X126.852 Y138.109 E-.35179
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.524 Y130.841 Z3.8 F42000
G1 X123.595 Y127.94 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X130.815 Y127.94 E.22185
G1 X130.815 Y129.16 E.03749
G1 X123.595 Y129.16 E.22185
G1 X123.595 Y128 E.03564
; WIPE_START
M204 S6000
G1 X125.595 Y127.983 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.8 I1.214 J-.09 P1  F42000
G1 X124.721 Y116.166 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
M204 S5000
G1 X129.689 Y116.166 E.16481
G1 X129.689 Y126.834 E.35389
G1 X124.721 Y126.834 E.16481
G1 X124.721 Y116.226 E.3519
M106 S196.35
M204 S250
G1 X125.128 Y116.573 F42000
M106 S255
G1 F600
M204 S5000
G1 X129.282 Y116.573 E.1378
G1 X129.282 Y126.427 E.32688
G1 X125.128 Y126.427 E.1378
G1 X125.128 Y116.633 E.32489
M106 S196.35
M204 S250
G1 X125.52 Y116.965 F42000
M106 S255
G1 F600
M204 S5000
G1 X128.89 Y116.965 E.11179
G1 X128.89 Y126.035 E.30087
G1 X125.52 Y126.035 E.11179
G1 X125.52 Y117.025 E.29888
M106 S196.35
; WIPE_START
M204 S6000
G1 X127.52 Y116.989 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.8 I-1.136 J-.437 P1  F42000
G1 X123.613 Y127.141 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X123.613 Y116.659 E.3477
G1 X123.613 Y116.259 E.01327
G1 F6047.194
G1 X123.613 Y115.859 E.01327
G1 F2505.092
G1 X123.723 Y115.859 E.00365
M106 S255
G1 F1800
G1 X124.105 Y115.859 E.01269
M106 S196.35
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X130.305 Y115.859 E.20567
M106 S196.35
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X130.688 Y115.859 E.01269
M106 S196.35
G1 F4211.215
G1 X131.012 Y115.859 E.01076
G1 F8575.999
G1 X131.012 Y116.259 E.01327
G1 F8843.478
G1 X131.012 Y116.659 E.01327
G1 X131.012 Y126.341 E.32116
G1 X131.012 Y126.741 E.01327
G1 F8575.999
G1 X131.012 Y127.141 E.01327
G1 F4211.215
G1 X130.688 Y127.141 E.01076
M106 S255
G1 F1800
G1 X130.305 Y127.141 E.01269
M106 S196.35
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X124.105 Y127.141 E.20567
M106 S196.35
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X123.723 Y127.141 E.01269
M106 S196.35
G1 F2106.257
G1 X123.673 Y127.141 E.00166
M204 S10000
G1 X123.206 Y127.548 F42000
G1 F8843.478
M204 S6000
G1 X123.206 Y115.852 E.38797
G1 X123.206 Y115.452 E.01327
G1 F5206.911
G1 X123.723 Y115.452 E.01715
M106 S255
G1 F1320
M73 P45 R11
G1 X130.688 Y115.452 E.23104
M106 S196.35
G1 F4101.713
G1 X131.088 Y115.452 E.01327
G1 F7569.333
G1 X131.419 Y115.452 E.01099
G1 F8843.478
G1 X131.419 Y115.852 E.01327
G1 X131.419 Y127.148 E.3747
G1 X131.419 Y127.548 E.01327
G1 F7569.333
G1 X131.088 Y127.548 E.01099
G1 F4101.713
G1 X130.688 Y127.548 E.01327
M106 S255
G1 F1320
G1 X123.723 Y127.548 E.23104
M106 S196.35
G1 F4624.273
G1 X123.266 Y127.548 E.01516
; WIPE_START
G1 X123.255 Y125.548 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.421 Y133.179 Z3.8 F42000
G1 X123.613 Y141.991 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X123.613 Y129.959 E.39911
G1 X124.587 Y129.959 E.03232
G1 X124.587 Y140.554 E.35145
G1 X129.032 Y140.554 E.14744
G1 X129.032 Y129.959 E.35145
G1 X131.012 Y129.959 E.06569
G1 X131.012 Y141.99 E.3991
G1 X123.673 Y141.991 E.24346
; WIPE_START
G1 X123.663 Y139.991 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.625 Y139.035 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X128.625 Y129.552 E.31457
G1 X131.419 Y129.552 E.0927
G1 X131.419 Y142.398 E.42611
G1 X123.206 Y142.398 E.27246
G1 X123.206 Y129.552 E.42612
G1 X124.994 Y129.552 E.05933
G1 X124.994 Y140.147 E.35145
G1 X128.625 Y140.147 E.12043
G1 X128.625 Y139.095 E.0349
; WIPE_START
G1 X128.625 Y137.095 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.926 Y129.654 Z3.8 F42000
G1 X123.595 Y115.06 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X123.595 Y113.84 E.03749
G1 X130.815 Y113.84 E.22185
G1 X130.815 Y115.06 E.03749
G1 X123.655 Y115.06 E.22001
; WIPE_START
M204 S6000
G1 X123.595 Y113.84 E-.46416
G1 X124.374 Y113.84 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124 Y121.463 Z3.8 F42000
G1 X122.956 Y142.783 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F9547.055
M204 S5000
G3 X122.814 Y142.59 I.061 J-.194 E.00788
G1 X122.814 Y113.408 E.8967
G3 X123 Y113.21 I.199 J.001 E.00918
G1 X131.622 Y113.21 E.26492
G3 X131.811 Y113.41 I-.009 J.198 E.00934
G1 X131.804 Y142.648 E.89841
G3 X131.623 Y142.79 I-.189 J-.056 E.00754
G1 X123.016 Y142.783 E.26449
; WIPE_START
M204 S6000
G1 X122.851 Y142.711 E-.06845
G1 X122.814 Y142.59 E-.04809
G1 X122.814 Y140.897 E-.64345
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


G1 X124.1 Y140.758 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.61017
G1 F6346.408
M204 S6000
G1 X124.1 Y130.163 E.48973
; WIPE_START
G1 X124.1 Y132.163 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.204 Y129.356 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.43254
G1 F9239.772
M204 S6000
G1 X123.204 Y127.744 E.05118
; WIPE_START
G1 X123.204 Y129.356 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.8 I1.096 J.528 P1  F42000
G1 X124.35 Y126.977 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.4954
M106 S255
G1 F3000
M204 S6000
G1 X124.35 Y116.023 E.40391
M106 S196.35
; WIPE_START
G1 X124.35 Y118.023 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.8 I1.124 J-.466 P1  F42000
G1 X123.204 Y115.256 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.432125
G1 F9249.625
M204 S6000
G1 X123.204 Y113.644 E.05112
G1 X123.207 Y113.603 E.00129
G1 X123.255 Y113.584 E.00165
; LINE_WIDTH: 0.378201
G1 F10737.269
G1 X123.303 Y113.564 E.00142
; LINE_WIDTH: 0.339137
G1 F12153.274
G1 X123.351 Y113.545 E.00125
; LINE_WIDTH: 0.300073
G1 F13999.494
G1 X123.399 Y113.525 E.00109
; LINE_WIDTH: 0.280941
G1 F15000
G1 X131.011 Y113.525 E.14764
G1 X131.132 Y113.586 E.00262
; LINE_WIDTH: 0.35176
G1 F11656.525
G1 X131.253 Y113.646 E.0034
; LINE_WIDTH: 0.399275
G1 F10102.307
G1 X131.374 Y113.706 E.00392
; LINE_WIDTH: 0.446789
G1 F8913.792
G1 X131.494 Y113.767 E.00444
; LINE_WIDTH: 0.494303
G1 F7975.491
G1 X131.615 Y113.827 E.00497
M204 S10000
G1 X131.313 Y113.406 F42000
; LINE_WIDTH: 0.64678
G1 F5961.647
M204 S6000
G1 X131.313 Y115.256 E.09101
; WIPE_START
G1 X131.313 Y113.406 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.513 Y116.023 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.4954
M106 S255
G1 F3000
M204 S6000
G1 X130.513 Y126.808 E.39765
G1 X130.06 Y126.808 E.01668
G1 X130.06 Y116.023 E.39765
M106 S196.35
; WIPE_START
G1 X130.06 Y118.023 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.8 I-1.207 J.156 P1  F42000
G1 X131.313 Y127.744 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.64678
G1 F5961.647
M204 S6000
G1 X131.313 Y129.356 E.07932
; WIPE_START
G1 X131.313 Y127.744 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.977 Y130.307 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X129.38 Y130.307 E.0198
G1 X129.38 Y131.339 E.03422
G1 X129.966 Y132.196 E.03444
G1 X130.664 Y132.689 E.02835
G1 X130.664 Y135.265 E.08546
G1 X129.966 Y135.49 E.02433
G3 X129.38 Y135.295 I-.142 J-.551 E.02164
G1 X129.38 Y136.58 E.04265
G1 X129.966 Y137.437 E.03444
G1 X130.664 Y137.93 E.02835
G1 X130.664 Y140.507 E.08546
G1 X129.966 Y140.731 E.02433
G3 X129.38 Y140.536 I-.142 J-.551 E.02164
G1 X129.38 Y140.902 E.01216
G1 X124.753 Y140.902 E.15347
G1 X124.753 Y141.106 E.00675
G1 X123.961 Y141.106 E.02628
G1 X123.961 Y141.643 E.01781
G1 X128.088 Y141.642 E.1369
G1 X128.655 Y141.475 E.01961
G3 X129.201 Y141.642 I.143 J.506 E.02
M73 P46 R11
G1 X130.664 Y141.642 E.04854
G1 X130.664 Y141.477 E.00548
; WIPE_START
G1 X130.664 Y141.642 E-.06276
G1 X129.201 Y141.642 E-.556
G1 X128.983 Y141.489 E-.10126
G1 X128.878 Y141.484 E-.03999
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.299 Y139.821 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F10588.235
M204 S6000
G1 X128.344 Y139.354 E.013
M204 S10000
G1 X128.34 Y129.696 F42000
G1 F10588.235
M204 S6000
G1 X128.331 Y129.501 E.00539
M204 S10000
G1 X127.501 Y129.367 F42000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S2000
G1 X127.891 Y129.758 E.01696
G1 X127.358 Y129.758
G1 X126.968 Y129.367 E.01696
G1 X126.434 Y129.367
G1 X126.825 Y129.758 E.01696
G1 X126.645 Y130.111
G1 X125.901 Y129.367 E.03233
G1 X125.368 Y129.367
G1 X126.645 Y130.645 E.0555
G1 X126.645 Y131.178
G1 X125.217 Y129.749 E.06208
G1 X125.217 Y130.283
G1 X126.645 Y131.711 E.06208
G1 X126.645 Y132.244
G1 X125.217 Y130.816 E.06208
G1 X125.217 Y131.349
G1 X126.645 Y132.778 E.06208
G1 X126.645 Y133.311
G1 X125.217 Y131.882 E.06208
G1 X125.217 Y132.416
G1 X126.645 Y133.844 E.06208
G1 X126.645 Y134.377
G1 X125.217 Y132.949 E.06208
G1 X125.217 Y133.482
G1 X126.645 Y134.911 E.06208
G1 X126.645 Y135.444
G1 X125.217 Y134.015 E.06208
G1 X125.217 Y134.549
G1 X126.645 Y135.977 E.06208
G1 X126.645 Y136.51
G1 X125.217 Y135.082 E.06208
G1 X125.217 Y135.615
G1 X126.645 Y137.044 E.06208
G1 X126.645 Y137.577
G1 X125.217 Y136.148 E.06208
G1 X125.217 Y136.682
G1 X126.645 Y138.11 E.06208
G1 X126.645 Y138.643
G1 X125.217 Y137.215 E.06208
G1 X125.217 Y137.748
G1 X126.645 Y139.177 E.06208
G1 X127.777 Y139.242
G1 X128.212 Y139.677 E.01887
G1 X127.926 Y139.925
G1 X127.244 Y139.242 E.02964
G1 X126.711 Y139.242
G1 X127.393 Y139.925 E.02964
G1 X126.86 Y139.925
G1 X125.217 Y138.281 E.0714
G1 X125.217 Y138.815
G1 X126.326 Y139.925 E.04823
G1 X125.793 Y139.925
G1 X125.217 Y139.348 E.02505
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.793 Y139.925 E-.30984
G1 X126.326 Y139.925 E-.20264
G1 X125.866 Y139.464 E-.24753
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/75
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
M106 S201.45
; OBJECT_ID: 394
M204 S10000
G17
G3 Z3.8 I.242 J1.193 P1  F42000
G1 X127.979 Y139.035 Z3.8
G1 Z3.6
G1 E.8 F1800
; FEATURE: Outer wall
G1 F6354
M204 S5000
G1 X126.106 Y139.035 E.05754
G1 X126.106 Y129.965 E.2787
G1 X127.979 Y129.965 E.05754
G1 X127.979 Y138.975 E.27685
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.106 Y139.035 E-.71195
G1 X126.106 Y138.909 E-.04805
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.403 Y131.469 Z4 F42000
G1 X123.595 Y127.94 Z4
G1 Z3.6
G1 E.8 F1800
G1 F6354
M204 S5000
G1 X130.815 Y127.94 E.22185
G1 X130.815 Y129.16 E.03749
G1 X123.595 Y129.16 E.22185
G1 X123.595 Y128 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.595 Y127.983 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4 I1.214 J-.079 P1  F42000
G1 X125.52 Y126.834 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6354
M204 S6000
G1 X124.721 Y126.834 E.02651
G1 X124.721 Y116.166 E.35389
G1 X129.689 Y116.166 E.16481
G1 X129.689 Y126.834 E.35389
G1 X125.58 Y126.834 E.13631
M204 S10000
G1 X125.52 Y126.427 F42000
G1 F6354
M204 S6000
G1 X125.128 Y126.427 E.01301
G1 X125.128 Y116.573 E.32688
G1 X129.282 Y116.573 E.1378
G1 X129.282 Y126.427 E.32688
G1 X125.58 Y126.427 E.1228
M204 S250
G1 X125.52 Y126.035 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6354
M204 S5000
G1 X125.52 Y116.965 E.2787
G1 X128.89 Y116.965 E.10355
G1 X128.89 Y126.035 E.2787
G1 X125.58 Y126.035 E.10171
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.567 Y124.035 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4 I-1.031 J-.646 P1  F42000
G1 X123.62 Y127.141 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6354
M204 S6000
G1 X123.62 Y115.859 E.37424
G1 X131.029 Y115.859 E.24577
G1 X131.029 Y127.141 E.37424
G1 X123.68 Y127.141 E.24378
M204 S10000
G1 X123.213 Y127.548 F42000
G1 F6354
M204 S6000
G1 X123.213 Y115.452 E.40124
G1 X131.436 Y115.452 E.27277
G1 X131.436 Y127.548 E.40124
G1 X123.273 Y127.548 E.27078
; WIPE_START
G1 F8843.478
G1 X123.263 Y125.548 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.429 Y133.179 Z4 F42000
G1 X123.62 Y141.991 Z4
G1 Z3.6
G1 E.8 F1800
G1 F6354
M204 S6000
G1 X123.62 Y140.554 E.04766
G1 X128.285 Y140.554 E.15475
G1 X128.285 Y139.834 E.02388
M73 P46 R10
G1 X128.778 Y139.834 E.01634
G1 X128.778 Y129.959 E.32757
G1 X131.029 Y129.959 E.07468
G1 X131.029 Y141.99 E.3991
G1 X123.68 Y141.991 E.24378
; WIPE_START
G1 F8843.478
G1 X123.62 Y140.554 E-.54644
G1 X124.182 Y140.554 E-.21356
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.371 Y139.035 Z4 F42000
G1 Z3.6
G1 E.8 F1800
G1 F6354
M204 S6000
G1 X128.371 Y129.552 E.31457
G1 X131.436 Y129.552 E.10168
G1 X131.436 Y142.398 E.42611
G1 X123.213 Y142.398 E.27277
G1 X123.213 Y129.552 E.42612
G1 X124.248 Y129.552 E.03432
G1 X124.248 Y140.147 E.35145
G1 X127.878 Y140.147 E.12043
G1 X127.878 Y139.427 E.02388
G1 X128.371 Y139.427 E.01634
G1 X128.371 Y139.095 E.01102
; WIPE_START
G1 F8843.478
G1 X128.371 Y137.095 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.754 Y129.636 Z4 F42000
G1 X123.595 Y115.06 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6354
M204 S5000
G1 X123.595 Y113.84 E.03749
G1 X130.815 Y113.84 E.22185
G1 X130.815 Y115.06 E.03749
G1 X123.655 Y115.06 E.22001
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.595 Y113.84 E-.46416
G1 X124.374 Y113.84 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.002 Y121.463 Z4 F42000
G1 X122.963 Y142.783 Z4
G1 Z3.6
G1 E.8 F1800
G1 F6354
M204 S5000
G3 X122.821 Y142.59 I.061 J-.194 E.00788
G1 X122.821 Y113.407 E.8967
G3 X123.008 Y113.21 I.199 J.001 E.00919
G1 X131.638 Y113.21 E.26516
G3 X131.828 Y113.41 I-.008 J.198 E.00938
G1 X131.821 Y142.648 E.8984
G3 X131.64 Y142.79 I-.19 J-.056 E.00754
G1 X123.023 Y142.783 E.26479
; WIPE_START
G1 F9547.055
M204 S6000
G1 X122.858 Y142.711 E-.0684
G1 X122.821 Y142.59 E-.04821
G1 X122.821 Y140.897 E-.64338
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


G1 X123.73 Y140.35 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.67046
G1 F5736.686
M204 S6000
G1 X123.73 Y129.756 E.54178
M204 S10000
G1 X123.208 Y129.356 F42000
; LINE_WIDTH: 0.4251
G1 F6354
M204 S6000
G1 X123.208 Y127.744 E.0502
; WIPE_START
G1 F9419.645
G1 X123.208 Y129.356 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4 I1.115 J.488 P1  F42000
G1 X124.344 Y126.764 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38988
G1 F6354
M204 S6000
G1 X124.344 Y116.236 E.29765
G1 X123.997 Y116.236 E.00981
G1 X123.997 Y126.764 E.29765
G1 X124.284 Y126.764 E.00811
; WIPE_START
G1 F10375.836
G1 X123.997 Y126.764 E-.10904
G1 X123.997 Y125.051 E-.65096
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4 I-.962 J.745 P1  F42000
G1 X127.594 Y129.696 Z4
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.38292
G1 F6354
M204 S6000
G1 X127.585 Y129.501 E.00539
; WIPE_START
G1 F10588.235
G1 X127.594 Y129.696 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.645 Y130.307 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6354
M204 S6000
G1 X129.126 Y130.307 E.0172
G1 X129.126 Y131.417 E.03681
G3 X129.966 Y132.279 I-2.86 J3.626 E.04002
G1 X130.681 Y132.625 E.02636
G1 X130.681 Y135.209 E.08573
G1 X129.966 Y135.295 E.0239
G3 X129.126 Y134.713 I.516 J-1.641 E.03441
G1 X129.126 Y136.658 E.06453
G3 X129.966 Y137.52 I-2.86 J3.626 E.04002
G1 X130.681 Y137.866 E.02636
G1 X130.681 Y140.45 E.08573
G1 X129.966 Y140.537 E.0239
G3 X129.126 Y139.954 I.516 J-1.641 E.03441
G1 X129.126 Y140.182 E.00757
G1 X128.634 Y140.182 E.01634
G1 X128.634 Y140.902 E.02388
G1 X128.446 Y140.902 E.00623
; WIPE_START
G1 F8843.478
G1 X128.634 Y140.902 E-.07135
G1 X128.634 Y140.182 E-.27358
G1 X129.126 Y140.182 E-.18717
G1 X129.126 Y139.954 E-.08667
G1 X129.399 Y140.206 E-.14124
; WIPE_END
M73 P47 R10
G1 E-.04 F1800
M204 S10000
G1 X127.552 Y139.821 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F6354
M204 S6000
G1 X127.598 Y139.354 E.013
M204 S10000
G1 X127.525 Y139.407 F42000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6354
M204 S2000
G1 X127.007 Y139.925 E.02251
G1 X126.474 Y139.925
G1 X127.156 Y139.242 E.02964
G1 X126.623 Y139.242
G1 X125.941 Y139.925 E.02964
G1 X125.407 Y139.925
G1 X126.09 Y139.242 E.02964
G1 X125.899 Y138.9
G1 X124.874 Y139.925 E.04452
G1 X124.47 Y139.795
G1 X125.899 Y138.367 E.06208
G1 X125.899 Y137.833
G1 X124.47 Y139.262 E.06208
G1 X124.47 Y138.729
G1 X125.899 Y137.3 E.06208
G1 X125.899 Y136.767
G1 X124.47 Y138.195 E.06208
G1 X124.47 Y137.662
G1 X125.899 Y136.234 E.06208
G1 X125.899 Y135.7
G1 X124.47 Y137.129 E.06208
G1 X124.47 Y136.596
G1 X125.899 Y135.167 E.06208
G1 X125.899 Y134.634
G1 X124.47 Y136.062 E.06208
G1 X124.47 Y135.529
G1 X125.899 Y134.101 E.06208
G1 X125.899 Y133.567
G1 X124.47 Y134.996 E.06208
G1 X124.47 Y134.463
G1 X125.899 Y133.034 E.06208
G1 X125.899 Y132.501
G1 X124.47 Y133.929 E.06208
G1 X124.47 Y133.396
G1 X125.899 Y131.968 E.06208
G1 X125.899 Y131.434
G1 X124.47 Y132.863 E.06208
G1 X124.47 Y132.33
G1 X125.899 Y130.901 E.06208
G1 X125.899 Y130.368
G1 X124.47 Y131.796 E.06208
G1 X124.47 Y131.263
G1 X125.899 Y129.835 E.06208
G1 X127.042 Y129.758
G1 X127.432 Y129.367 E.01696
G1 X126.899 Y129.367
G1 X126.509 Y129.758 E.01696
G1 X125.976 Y129.758
G1 X126.366 Y129.367 E.01696
G1 X125.833 Y129.367
G1 X124.47 Y130.73 E.05921
G1 X124.47 Y130.197
G1 X125.299 Y129.367 E.03603
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.47 Y130.197 E-.44563
G1 X124.47 Y130.73 E-.20264
G1 X124.678 Y130.522 E-.11174
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.845 Y137.84 Z4 F42000
G1 X127.425 Y139.799 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.108188
G1 F6354
M204 S6000
G3 X127.323 Y139.943 I-1.898 J-1.24 E.00094
M204 S10000
G1 X127.537 Y139.253 F42000
; LINE_WIDTH: 0.101042
G1 F6354
M204 S6000
G1 X127.166 Y139.253 E.00175
; WIPE_START
G1 F15000
G1 X127.537 Y139.253 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.263 Y132.124 Z4 F42000
G1 X131.322 Y129.356 Z4
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.66382
G1 F5798.035
M204 S6000
G1 X131.322 Y127.744 E.08155
; WIPE_START
G1 X131.322 Y129.356 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4 I1.109 J-.5 P1  F42000
G1 X130.126 Y126.704 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50923
G1 F6354
M204 S6000
G1 X130.592 Y126.704 E.01772
G1 X130.592 Y116.296 E.3955
G1 X130.126 Y116.296 E.01772
G1 X130.126 Y126.644 E.39322
; WIPE_START
G1 F7720.186
G1 X130.126 Y124.644 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4 I1.207 J.154 P1  F42000
G1 X131.322 Y115.256 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.66382
G1 F5798.035
M204 S6000
G1 X131.322 Y113.406 E.09358
M204 S10000
G1 X131.26 Y113.649 F42000
; LINE_WIDTH: 0.399324
G1 F6354
M204 S6000
G1 X131.384 Y113.711 E.00403
; LINE_WIDTH: 0.446843
G1 X131.508 Y113.774 E.00457
; LINE_WIDTH: 0.494361
G1 X131.632 Y113.836 E.00511
M204 S10000
G1 X131.26 Y113.649 F42000
; LINE_WIDTH: 0.351805
G1 F6354
M204 S6000
G1 X131.135 Y113.587 E.00349
; LINE_WIDTH: 0.280973
G1 X131.011 Y113.525 E.00269
G1 X123.399 Y113.525 E.14766
; LINE_WIDTH: 0.305497
G1 X123.336 Y113.55 E.00145
; LINE_WIDTH: 0.355369
G1 X123.273 Y113.575 E.00172
; LINE_WIDTH: 0.424386
G1 X123.211 Y113.6 E.0021
G1 X123.208 Y113.644 E.00137
G1 X123.208 Y115.256 E.05011
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9437.283
G1 X123.208 Y113.644 E-.71075
G1 X123.211 Y113.6 E-.01944
G1 X123.273 Y113.575 E-.02981
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/75
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z4 I-1.196 J.224 P1  F42000
G1 X128.032 Y139.035 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6138
M204 S5000
G1 X125.36 Y139.035 E.08212
G1 X125.36 Y129.965 E.2787
G1 X128.032 Y129.965 E.08212
G1 X128.032 Y138.975 E.27685
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.033 Y139.02 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.393 Y131.566 Z4.2 F42000
G1 X123.595 Y127.94 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F6138
M204 S5000
G1 X130.815 Y127.94 E.22185
G1 X130.815 Y129.16 E.03749
G1 X123.595 Y129.16 E.22185
G1 X123.595 Y128 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.595 Y127.983 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.428 Y120.441 Z4.2 F42000
G1 X123.595 Y115.06 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F6138
M204 S5000
G1 X123.595 Y113.84 E.03749
G1 X130.815 Y113.84 E.22185
G1 X130.815 Y115.06 E.03749
G1 X123.655 Y115.06 E.22001
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.595 Y113.84 E-.46416
G1 X124.374 Y113.84 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.2 I-1.212 J.107 P1  F42000
G1 X125.52 Y126.834 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6138
M204 S6000
G1 X124.721 Y126.834 E.02651
G1 X124.721 Y116.166 E.35389
G1 X129.689 Y116.166 E.16481
G1 X129.689 Y126.834 E.35389
G1 X125.58 Y126.834 E.13631
M204 S10000
G1 X125.52 Y126.427 F42000
G1 F6138
M204 S6000
G1 X125.128 Y126.427 E.01301
G1 X125.128 Y116.573 E.32688
G1 X129.282 Y116.573 E.1378
G1 X129.282 Y126.427 E.32688
G1 X125.58 Y126.427 E.1228
M204 S250
G1 X125.52 Y126.035 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6138
M204 S5000
G1 X125.52 Y116.965 E.2787
G1 X128.89 Y116.965 E.10355
G1 X128.89 Y126.035 E.2787
G1 X125.58 Y126.035 E.10171
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.567 Y124.035 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.2 I-1.033 J-.643 P1  F42000
G1 X123.635 Y127.141 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6138
M204 S6000
G1 X123.635 Y115.859 E.37424
G1 X131.046 Y115.859 E.24585
G1 X131.046 Y127.141 E.37424
G1 X123.695 Y127.141 E.24386
; WIPE_START
G1 F8843.478
G1 X123.684 Y125.141 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.662 Y132.773 Z4.2 F42000
G1 X123.635 Y141.991 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F6138
M204 S6000
G1 X123.635 Y140.554 E.04766
G1 X127.539 Y140.554 E.12951
G1 X127.539 Y139.834 E.02388
G1 X128.831 Y139.834 E.04288
G1 X128.831 Y129.959 E.32757
G1 X131.046 Y129.959 E.07347
G1 X131.046 Y141.99 E.3991
G1 X123.695 Y141.991 E.24386
M204 S10000
G1 X123.228 Y142.398 F42000
G1 F6138
M204 S6000
G1 X123.228 Y129.552 E.42612
G1 X123.501 Y129.552 E.00908
G1 X123.501 Y140.147 E.35145
G1 X127.132 Y140.147 E.12043
G1 X127.132 Y139.427 E.02388
G1 X128.424 Y139.427 E.04288
G1 X128.424 Y129.552 E.32757
G1 X131.207 Y129.552 E.09232
G1 X131.207 Y127.548 E.06648
G1 X123.228 Y127.548 E.2647
G1 X123.228 Y115.452 E.40124
G1 X131.207 Y115.452 E.2647
G1 X131.207 Y113.602 E.06136
G1 X131.453 Y113.602 E.00816
G1 X131.453 Y142.398 E.95519
G1 X123.288 Y142.398 E.27087
M204 S250
G1 X122.978 Y142.783 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6138
M204 S5000
G3 X122.836 Y142.59 I.061 J-.194 E.00789
G1 X122.836 Y113.407 E.89671
G3 X123.023 Y113.21 I.199 J.002 E.00921
G1 X131.653 Y113.21 E.26516
G3 X131.845 Y113.41 I-.006 J.198 E.00943
G1 X131.839 Y142.648 E.8984
G3 X131.657 Y142.79 I-.19 J-.056 E.00753
G1 X123.038 Y142.783 E.26485
; WIPE_START
G1 F9547.055
M204 S6000
G1 X122.873 Y142.711 E-.06859
G1 X122.836 Y142.59 E-.04807
G1 X122.836 Y140.897 E-.64334
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


G1 X126.806 Y139.821 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F6138
M204 S6000
G1 X126.851 Y139.354 E.013
; WIPE_START
G1 F10588.235
G1 X126.806 Y139.821 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.923 Y140.182 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6138
M204 S6000
G1 X129.18 Y140.182 E.04169
G1 X129.18 Y139.811 E.01232
G2 X129.966 Y140.387 I3.094 J-3.394 E.03239
G1 X130.698 Y140.428 E.02433
G1 X130.698 Y137.825 E.08634
G1 X129.966 Y137.615 E.02527
G2 X129.18 Y136.948 I-3.518 J3.348 E.03426
G1 X129.18 Y134.57 E.07888
G2 X129.966 Y135.146 I3.094 J-3.394 E.03239
G1 X130.698 Y135.186 E.02433
G1 X130.698 Y132.584 E.08634
G1 X129.966 Y132.373 E.02527
G2 X129.18 Y131.706 I-3.518 J3.348 E.03426
G1 X129.18 Y130.307 E.0464
G1 X129.409 Y130.307 E.00761
; WIPE_START
G1 F8843.478
G1 X129.18 Y130.307 E-.0872
G1 X129.18 Y131.706 E-.53156
G1 X129.463 Y131.947 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.228 Y129.563 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.45586
G1 F6138
M204 S6000
G1 X126.936 Y129.563 E.04349
M204 S10000
G1 X126.847 Y129.696 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F6138
M204 S6000
G1 X126.838 Y129.501 E.00539
M204 S10000
G1 X126.291 Y129.758 F42000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6138
M204 S2000
G1 X125.901 Y129.367 E.01696
G1 X125.368 Y129.367
G1 X125.758 Y129.758 E.01696
G1 X125.225 Y129.758
G1 X124.835 Y129.367 E.01696
G1 X124.301 Y129.367
G1 X125.152 Y130.218 E.03698
G1 X125.152 Y130.752
G1 X123.768 Y129.367 E.06015
G1 X123.724 Y129.856
G1 X125.152 Y131.285 E.06208
G1 X125.152 Y131.818
G1 X123.724 Y130.39 E.06208
G1 X123.724 Y130.923
G1 X125.152 Y132.351 E.06208
M73 P48 R10
G1 X125.152 Y132.885
G1 X123.724 Y131.456 E.06208
G1 X123.724 Y131.989
G1 X125.152 Y133.418 E.06208
G1 X125.152 Y133.951
G1 X123.724 Y132.523 E.06208
G1 X123.724 Y133.056
G1 X125.152 Y134.484 E.06208
G1 X125.152 Y135.018
G1 X123.724 Y133.589 E.06208
G1 X123.724 Y134.122
G1 X125.152 Y135.551 E.06208
G1 X125.152 Y136.084
G1 X123.724 Y134.656 E.06208
G1 X123.724 Y135.189
G1 X125.152 Y136.617 E.06208
G1 X125.152 Y137.151
G1 X123.724 Y135.722 E.06208
G1 X123.724 Y136.255
G1 X125.152 Y137.684 E.06208
G1 X125.152 Y138.217
G1 X123.724 Y136.789 E.06208
G1 X123.724 Y137.322
G1 X125.152 Y138.75 E.06208
G1 X126.178 Y139.242
G1 X126.694 Y139.758 E.02242
G1 X126.326 Y139.925
G1 X125.644 Y139.242 E.02964
G1 X125.793 Y139.925
G1 X123.724 Y137.855 E.08992
G1 X123.724 Y138.388
G1 X125.26 Y139.925 E.06675
G1 X124.727 Y139.925
G1 X123.724 Y138.922 E.04358
G1 X123.724 Y139.455
G1 X124.193 Y139.925 E.02041
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.724 Y139.455 E-.25236
G1 X123.724 Y138.922 E-.20264
G1 X124.291 Y139.489 E-.305
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.708 Y131.989 Z4.2 F42000
G1 X126.207 Y129.349 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.387042
G1 F6138
M204 S6000
G1 X126.579 Y129.529 E.0116
G1 X126.596 Y129.604 E.00214
; LINE_WIDTH: 0.367563
G1 X126.54 Y129.647 E.00187
; LINE_WIDTH: 0.325768
G1 X126.484 Y129.69 E.00163
; LINE_WIDTH: 0.283973
G1 X126.428 Y129.733 E.00139
; LINE_WIDTH: 0.242178
G1 X126.372 Y129.776 E.00115
; WIPE_START
G1 F15000
G1 X126.428 Y129.733 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.721 Y137.333 Z4.2 F42000
G1 X125.543 Y139.244 Z4.2
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.0966961
G1 F6138
M204 S6000
G1 X125.436 Y139.255 E.00047
G1 X125.427 Y139.292 E.00016
M204 S10000
G1 X126.01 Y139.875 F42000
; LINE_WIDTH: 0.0966959
G1 F6138
M204 S6000
G1 X126.002 Y139.912 E.00016
G1 X125.894 Y139.923 E.00047
; WIPE_START
G1 F15000
G1 X126.002 Y139.912 E-.56393
G1 X126.01 Y139.875 E-.19607
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.05 Y132.498 Z4.2 F42000
G1 X123.215 Y129.356 Z4.2
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.41058
G1 F6138
M204 S6000
G1 X123.215 Y127.744 E.04829
; WIPE_START
G1 F9791.655
G1 X123.215 Y129.356 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.2 I1.115 J.488 P1  F42000
G1 X124.348 Y126.767 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38262
G1 F6138
M204 S6000
G1 X124.348 Y116.233 E.29162
G1 X124.008 Y116.233 E.0094
G1 X124.008 Y126.767 E.29162
G1 X124.288 Y126.767 E.00774
; WIPE_START
G1 F10597.587
G1 X124.008 Y126.767 E-.10628
G1 X124.008 Y125.047 E-.65372
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.2 I-.317 J1.175 P1  F42000
G1 X130.13 Y126.7 Z4.2
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.51775
G1 F6138
M204 S6000
G1 X130.605 Y126.7 E.01837
G1 X130.605 Y116.3 E.4024
G1 X130.13 Y116.3 E.01837
G1 X130.13 Y126.64 E.40008
; WIPE_START
G1 F7581.661
G1 X130.13 Y124.64 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.2 I1.213 J.096 P1  F42000
G1 X131.011 Y113.525 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.28057
G1 F6138
M204 S6000
G1 X123.399 Y113.525 E.14741
; LINE_WIDTH: 0.30338
G1 X123.339 Y113.548 E.00136
; LINE_WIDTH: 0.34902
G1 X123.279 Y113.571 E.0016
; LINE_WIDTH: 0.410088
G1 X123.219 Y113.594 E.00192
G1 X123.215 Y113.644 E.00151
G1 X123.215 Y115.256 E.04823
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9804.777
G1 X123.215 Y113.644 E-.70947
G1 X123.219 Y113.594 E-.02222
G1 X123.279 Y113.571 E-.02831
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/75
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z4.2 I-1.196 J.226 P1  F42000
G1 X128.086 Y139.035 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5508
M204 S5000
G1 X124.613 Y139.035 E.1067
G1 X124.613 Y129.965 E.2787
G1 X128.086 Y129.965 E.1067
G1 X128.086 Y138.975 E.27685
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.086 Y139.01 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.411 Y131.563 Z4.4 F42000
G1 X123.595 Y127.94 Z4.4
G1 Z4
G1 E.8 F1800
G1 F5508
M204 S5000
G1 X130.815 Y127.94 E.22185
G1 X130.815 Y129.16 E.03749
G1 X123.595 Y129.16 E.22185
G1 X123.595 Y128 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.595 Y127.983 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.428 Y120.441 Z4.4 F42000
G1 X123.595 Y115.06 Z4.4
G1 Z4
G1 E.8 F1800
G1 F5508
M204 S5000
G1 X123.595 Y113.84 E.03749
G1 X130.815 Y113.84 E.22185
G1 X130.815 Y115.06 E.03749
G1 X123.655 Y115.06 E.22001
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.595 Y113.84 E-.46416
G1 X124.374 Y113.84 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.045 Y121.443 Z4.4 F42000
G1 X125.52 Y126.834 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5508
M204 S6000
G1 X124.721 Y126.834 E.02651
G1 X124.721 Y116.166 E.35389
G1 X129.689 Y116.166 E.16481
G1 X129.689 Y126.834 E.35389
G1 X125.58 Y126.834 E.13631
M204 S10000
G1 X125.52 Y126.427 F42000
G1 F5508
M204 S6000
G1 X125.128 Y126.427 E.01301
G1 X125.128 Y116.573 E.32688
G1 X129.282 Y116.573 E.1378
G1 X129.282 Y126.427 E.32688
G1 X125.58 Y126.427 E.1228
M204 S250
G1 X125.52 Y126.035 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5508
M204 S5000
G1 X125.52 Y116.965 E.2787
G1 X128.89 Y116.965 E.10355
G1 X128.89 Y126.035 E.2787
G1 X125.58 Y126.035 E.10171
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.567 Y124.035 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.651 Y127.141 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5508
M204 S6000
G1 X123.651 Y115.859 E.37424
G1 X131.063 Y115.859 E.24586
G1 X131.063 Y127.141 E.37424
G1 X123.711 Y127.141 E.24387
; WIPE_START
G1 F8843.478
G1 X123.701 Y125.141 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.678 Y132.773 Z4.4 F42000
G1 X123.651 Y141.991 Z4.4
G1 Z4
G1 E.8 F1800
G1 F5508
M204 S6000
G1 X123.651 Y139.834 E.07154
G1 X128.885 Y139.834 E.1736
G1 X128.885 Y129.959 E.32757
G1 X131.063 Y129.959 E.07225
G1 X131.063 Y141.99 E.3991
G1 X123.711 Y141.991 E.24387
M204 S10000
G1 X123.244 Y142.398 F42000
G1 F5508
M204 S6000
G1 X123.244 Y129.552 E.42612
G1 X124.221 Y129.552 E.0324
G1 X124.221 Y139.427 E.32757
G1 X128.478 Y139.427 E.1412
G1 X128.478 Y129.552 E.32757
G1 X131.207 Y129.552 E.09054
G1 X131.207 Y127.548 E.06648
G1 X123.244 Y127.548 E.26414
G1 X123.244 Y115.452 E.40124
G1 X131.207 Y115.452 E.26414
G1 X131.207 Y113.602 E.06136
G1 X131.47 Y113.602 E.00872
G1 X131.47 Y142.398 E.95519
G1 X123.304 Y142.398 E.27087
M204 S250
G1 X122.995 Y142.783 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5508
M204 S5000
G3 X122.852 Y142.59 I.056 J-.191 E.00792
G1 X122.852 Y113.407 E.8967
G3 X123.04 Y113.21 I.199 J.002 E.00921
G1 X131.716 Y113.216 E.26659
G3 X131.862 Y113.41 I-.047 J.188 E.00805
G1 X131.856 Y142.648 E.8984
G3 X131.675 Y142.79 I-.19 J-.056 E.00753
G1 X123.055 Y142.783 E.26485
; WIPE_START
G1 F9547.055
M204 S6000
G1 X122.888 Y142.71 E-.06937
G1 X122.852 Y142.59 E-.04736
G1 X122.852 Y140.897 E-.64327
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


G1 X123.733 Y139.631 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.61262
G1 F5508
M204 S6000
G1 X123.733 Y129.756 E.45843
M204 S10000
G1 X123.224 Y129.356 F42000
; LINE_WIDTH: 0.39373
G1 F5508
M204 S6000
G1 X123.224 Y127.744 E.04608
; WIPE_START
G1 F10261.965
G1 X123.224 Y129.356 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.352 Y126.772 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.37419
G1 F5508
M204 S6000
G1 X124.352 Y116.228 E.28461
G1 X124.021 Y116.228 E.00894
G1 X124.021 Y126.772 E.28461
G1 X124.292 Y126.772 E.00732
; WIPE_START
G1 F10867.269
G1 X124.021 Y126.772 E-.10309
G1 X124.021 Y125.043 E-.65691
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.417 Y129.563 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.45586
G1 F5508
M204 S6000
G1 X128.282 Y129.563 E.13004
; WIPE_START
G1 F8717.973
G1 X126.282 Y129.563 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.715 Y130.933 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5508
M204 S6000
G1 X130.715 Y132.561 E.05401
G1 X129.966 Y132.486 E.02498
G3 X129.233 Y131.936 I4.588 J-6.877 E.03038
G1 X129.233 Y134.425 E.08257
G3 X129.966 Y135.026 I-5.053 J6.901 E.03145
G1 X130.715 Y135.194 E.02547
G1 X130.715 Y137.803 E.08655
G1 X129.966 Y137.727 E.02498
G3 X129.233 Y137.177 I4.588 J-6.877 E.03038
G1 X129.233 Y139.667 E.08257
G3 X129.966 Y140.268 I-5.052 J6.9 E.03145
G1 X130.715 Y140.435 E.02547
G1 X130.715 Y141.642 E.04005
G1 X130.294 Y141.642 E.01396
M204 S10000
G1 X129.071 Y140.223 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41318
G1 F5508
M204 S6000
G1 X124.745 Y140.223 E.13052
; LINE_WIDTH: 0.430134
G1 X124.527 Y140.24 E.0069
; LINE_WIDTH: 0.46404
G1 X124.309 Y140.257 E.0075
; LINE_WIDTH: 0.511264
G1 X124.091 Y140.274 E.00834
G1 X124.091 Y140.746 E.01801
G1 X124.42 Y140.746 E.01256
; LINE_WIDTH: 0.502118
G1 X124.514 Y140.682 E.00425
; LINE_WIDTH: 0.476573
M73 P49 R10
G1 X124.608 Y140.618 E.00401
; LINE_WIDTH: 0.451145
G1 X124.676 Y140.606 E.00232
; LINE_WIDTH: 0.413368
G1 X124.745 Y140.593 E.0021
G1 X129.057 Y140.593 E.13018
G1 X129.068 Y140.283 E.00937
; WIPE_START
G1 F9717.97
G1 X129.057 Y140.593 E-.11799
G1 X127.368 Y140.593 E-.64201
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.858 Y133.108 Z4.4 F42000
G1 X130.135 Y126.696 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.52627
G1 F5508
M204 S6000
G1 X130.618 Y126.696 E.01904
G1 X130.618 Y116.304 E.40928
G1 X130.135 Y116.304 E.01904
G1 X130.135 Y126.636 E.40692
; WIPE_START
G1 F7448.019
G1 X130.135 Y124.636 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.735 Y117.027 Z4.4 F42000
G1 X131.011 Y113.525 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280582
G1 F5508
M204 S6000
G1 X123.399 Y113.525 E.14742
; LINE_WIDTH: 0.301011
G1 X123.342 Y113.546 E.00127
; LINE_WIDTH: 0.341871
G1 X123.285 Y113.566 E.00147
; LINE_WIDTH: 0.393503
G1 X123.229 Y113.586 E.00173
G1 X123.224 Y113.644 E.00165
G1 X123.224 Y115.256 E.04605
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10268.611
G1 X123.224 Y113.644 E-.70809
G1 X123.229 Y113.586 E-.02536
G1 X123.285 Y113.566 E-.02656
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/75
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z4.4 I-1.217 J.026 P1  F42000
G1 X123.595 Y127.94 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5475
M204 S5000
G1 X130.815 Y127.94 E.22185
G1 X130.815 Y129.16 E.03749
G1 X123.595 Y129.16 E.22185
G1 X123.595 Y128 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.595 Y127.983 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.308 Y135.421 Z4.6 F42000
G1 X128.139 Y139.035 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F5475
M204 S5000
G1 X124.665 Y139.035 E.10675
G1 X124.665 Y138.994 E.00126
G1 X124.665 Y130.006 E.27618
G1 X124.665 Y129.965 E.00126
G1 X128.139 Y129.965 E.10675
G1 X128.139 Y138.975 E.27685
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.14 Y139.01 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.752 Y131.387 Z4.6 F42000
G1 X125.52 Y126.834 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5475
M204 S6000
G1 X124.721 Y126.834 E.02651
G1 X124.721 Y116.166 E.35389
G1 X129.689 Y116.166 E.16481
G1 X129.689 Y126.834 E.35389
G1 X125.58 Y126.834 E.13631
M204 S10000
G1 X125.52 Y126.427 F42000
G1 F5475
M204 S6000
G1 X125.128 Y126.427 E.01301
G1 X125.128 Y116.573 E.32688
G1 X129.282 Y116.573 E.1378
G1 X129.282 Y126.427 E.32688
G1 X125.58 Y126.427 E.1228
M204 S250
G1 X125.52 Y126.035 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5475
M204 S5000
G1 X125.52 Y116.965 E.2787
G1 X128.89 Y116.965 E.10355
G1 X128.89 Y126.035 E.2787
G1 X125.58 Y126.035 E.10171
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.567 Y124.035 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.668 Y127.141 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5475
M204 S6000
G1 X123.668 Y115.859 E.37424
G1 X131.08 Y115.859 E.24586
G1 X131.08 Y127.141 E.37424
G1 X123.728 Y127.141 E.24387
; WIPE_START
G1 F8843.478
G1 X123.718 Y125.141 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.695 Y132.773 Z4.6 F42000
G1 X123.668 Y141.991 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F5475
M204 S6000
G1 X123.668 Y139.834 E.07154
G1 X128.939 Y139.834 E.17482
G1 X128.939 Y129.959 E.32757
G1 X131.08 Y129.959 E.07104
G1 X131.08 Y141.99 E.3991
G1 X123.728 Y141.991 E.24387
M204 S10000
G1 X123.261 Y142.398 F42000
G1 F5475
M204 S6000
G1 X123.261 Y129.552 E.42612
G1 X124.273 Y129.552 E.03357
G1 X124.273 Y139.427 E.32757
G1 X128.532 Y139.427 E.14125
G1 X128.532 Y129.552 E.32757
G1 X131.207 Y129.552 E.08876
G1 X131.207 Y127.548 E.06648
G1 X123.261 Y127.548 E.26358
G1 X123.261 Y115.452 E.40124
G1 X131.207 Y115.452 E.26358
G1 X131.207 Y113.602 E.06136
G1 X131.487 Y113.602 E.00929
G1 X131.487 Y142.398 E.95519
G1 X123.321 Y142.398 E.27088
; WIPE_START
G1 F8843.478
G1 X123.312 Y140.398 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.397 Y132.766 Z4.6 F42000
G1 X123.595 Y115.06 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5475
M204 S5000
G1 X123.595 Y113.84 E.03749
G1 X130.815 Y113.84 E.22185
G1 X130.815 Y115.06 E.03749
G1 X123.655 Y115.06 E.22001
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.595 Y113.84 E-.46416
G1 X124.374 Y113.84 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.015 Y121.464 Z4.6 F42000
G1 X123.012 Y142.783 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F5475
M204 S5000
G3 X122.869 Y142.59 I.06 J-.193 E.0079
G1 X122.869 Y113.408 E.8967
G3 X123.057 Y113.21 I.2 J.002 E.00922
G1 X131.734 Y113.217 E.26661
G3 X131.879 Y113.41 I-.048 J.187 E.00804
G1 X131.873 Y142.648 E.8984
G3 X131.691 Y142.79 I-.19 J-.057 E.00754
G1 X123.072 Y142.783 E.26486
; WIPE_START
G1 F9547.055
M204 S6000
G1 X122.906 Y142.711 E-.06869
G1 X122.869 Y142.59 E-.04802
G1 X122.869 Y140.897 E-.64329
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


G1 X123.767 Y139.631 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.64789
G1 F5475
M204 S6000
G1 X123.767 Y129.756 E.48681
M204 S10000
G1 X123.232 Y129.356 F42000
; LINE_WIDTH: 0.37689
G1 F5475
M204 S6000
G1 X123.232 Y127.744 E.04387
; WIPE_START
G1 F10779.411
G1 X123.232 Y129.356 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.195 Y126.937 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.68861
G1 F5475
M204 S6000
G1 X124.195 Y116.063 E.57218
; WIPE_START
G1 F5575.431
G1 X124.195 Y118.063 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.232 Y115.256 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.376937
G1 F5475
M204 S6000
G1 X123.232 Y113.644 E.04387
G1 X123.238 Y113.58 E.00176
G1 X123.292 Y113.561 E.00154
; LINE_WIDTH: 0.334952
G1 X123.346 Y113.543 E.00135
; LINE_WIDTH: 0.298704
G1 X123.399 Y113.525 E.00118
; LINE_WIDTH: 0.280593
G1 X131.011 Y113.525 E.14742
; WIPE_START
G1 F15000
G1 X129.011 Y113.525 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.662 Y121.13 Z4.6 F42000
G1 X130.139 Y126.691 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.53479
G1 F5475
M204 S6000
G1 X130.631 Y126.691 E.01972
G1 X130.631 Y116.309 E.41615
G1 X130.139 Y116.309 E.01972
G1 X130.139 Y126.631 E.41375
; WIPE_START
G1 F7319.007
G1 X130.139 Y124.631 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.335 Y129.563 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.45586
G1 F5475
M204 S6000
G1 X124.469 Y129.563 E.13009
; WIPE_START
G1 F8717.973
G1 X126.469 Y129.563 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.732 Y130.929 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5475
M204 S6000
G1 X130.732 Y132.557 E.05401
G1 X130.621 Y132.608 E.00406
G1 X129.966 Y132.624 E.02174
G3 X129.287 Y132.192 I.665 J-1.792 E.0269
G1 X129.287 Y134.247 E.0682
M73 P50 R10
G3 X129.966 Y134.927 I-3.632 J4.306 E.0319
G1 X130.732 Y135.232 E.02736
G1 X130.732 Y137.798 E.08514
G1 X130.621 Y137.85 E.00406
G1 X129.966 Y137.866 E.02174
G3 X129.287 Y137.433 I.665 J-1.792 E.0269
G1 X129.287 Y139.489 E.0682
G3 X129.966 Y140.168 I-3.632 J4.306 E.0319
G1 X130.732 Y140.473 E.02736
G1 X130.732 Y141.642 E.03879
G1 X130.273 Y141.642 E.01523
M204 S10000
G1 X129.199 Y140.048 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.411955
G1 F5475
M204 S6000
G1 X129.142 Y140.133 E.00307
G1 X128.886 Y140.223 E.00818
G1 X124.745 Y140.223 E.12452
; LINE_WIDTH: 0.43786
G1 X124.426 Y140.247 E.0103
; LINE_WIDTH: 0.501899
G1 X124.106 Y140.272 E.01197
G1 X124.106 Y140.747 E.01776
G1 X124.421 Y140.747 E.01175
G1 X124.608 Y140.618 E.0085
; LINE_WIDTH: 0.451145
G1 X124.676 Y140.606 E.00232
; LINE_WIDTH: 0.412362
G1 X124.745 Y140.593 E.0021
G1 X129.057 Y140.593 E.12983
G1 X129.161 Y140.151 E.01366
; LINE_WIDTH: 0.387385
G1 X129.178 Y140.104 E.00142
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10450.989
G1 X129.161 Y140.151 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/75
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z4.6 I1.107 J-.505 P1  F42000
G1 X123.595 Y127.94 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5486
M204 S5000
G1 X130.815 Y127.94 E.22185
G1 X130.815 Y129.16 E.03749
G1 X123.595 Y129.16 E.22185
G1 X123.595 Y128 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.595 Y127.983 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.342 Y135.413 Z4.8 F42000
G1 X128.193 Y139.035 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F5486
M204 S5000
G1 X124.719 Y139.035 E.10675
G1 X124.719 Y138.994 E.00126
G1 X124.719 Y130.006 E.27618
G1 X124.719 Y129.965 E.00126
G1 X128.193 Y129.965 E.10675
G1 X128.193 Y138.975 E.27685
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.193 Y139.01 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.772 Y131.389 Z4.8 F42000
G1 X125.52 Y126.834 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5486
M204 S6000
G1 X124.721 Y126.834 E.02651
G1 X124.721 Y116.166 E.35389
G1 X129.689 Y116.166 E.16481
G1 X129.689 Y126.834 E.35389
G1 X125.58 Y126.834 E.13631
M204 S10000
G1 X125.52 Y126.427 F42000
G1 F5486
M204 S6000
G1 X125.128 Y126.427 E.01301
G1 X125.128 Y116.573 E.32688
G1 X129.282 Y116.573 E.1378
G1 X129.282 Y126.427 E.32688
G1 X125.58 Y126.427 E.1228
M204 S250
G1 X125.52 Y126.035 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5486
M204 S5000
G1 X125.52 Y116.965 E.2787
G1 X128.89 Y116.965 E.10355
G1 X128.89 Y126.035 E.2787
G1 X125.58 Y126.035 E.10171
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.567 Y124.035 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.685 Y127.141 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5486
M204 S6000
G1 X123.685 Y115.859 E.37424
G1 X131.097 Y115.859 E.24587
G1 X131.097 Y127.141 E.37424
G1 X123.745 Y127.141 E.24388
; WIPE_START
G1 F8843.478
G1 X123.735 Y125.141 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.712 Y132.773 Z4.8 F42000
G1 X123.685 Y141.991 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F5486
M204 S6000
G1 X123.685 Y139.834 E.07154
G1 X128.992 Y139.834 E.17604
G1 X128.992 Y129.959 E.32757
G1 X131.097 Y129.959 E.06983
G1 X131.097 Y141.99 E.3991
G1 X123.745 Y141.991 E.24388
M204 S10000
G1 X123.278 Y142.398 F42000
G1 F5486
M204 S6000
G1 X123.278 Y129.552 E.42612
G1 X124.327 Y129.552 E.03479
G1 X124.327 Y139.427 E.32757
G1 X128.585 Y139.427 E.14125
G1 X128.585 Y129.552 E.32757
G1 X131.207 Y129.552 E.08698
G1 X131.207 Y127.548 E.06648
G1 X123.278 Y127.548 E.26303
G1 X123.278 Y115.452 E.40124
G1 X131.207 Y115.452 E.26303
G1 X131.207 Y113.602 E.06136
G1 X131.504 Y113.602 E.00985
G1 X131.504 Y142.398 E.95519
G1 X123.338 Y142.398 E.27089
; WIPE_START
G1 F8843.478
G1 X123.329 Y140.398 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.409 Y132.766 Z4.8 F42000
G1 X123.595 Y115.06 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5486
M204 S5000
G1 X123.595 Y113.84 E.03749
G1 X130.815 Y113.84 E.22185
G1 X130.815 Y115.06 E.03749
G1 X123.655 Y115.06 E.22001
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.595 Y113.84 E-.46416
G1 X124.374 Y113.84 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.019 Y121.464 Z4.8 F42000
G1 X123.029 Y142.783 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F5486
M204 S5000
G3 X122.886 Y142.59 I.061 J-.194 E.00789
G1 X122.886 Y113.407 E.8967
G3 X123.074 Y113.21 I.199 J.002 E.00921
G1 X131.751 Y113.217 E.26662
G3 X131.896 Y113.41 I-.048 J.187 E.00803
G1 X131.89 Y142.648 E.8984
G3 X131.708 Y142.79 I-.192 J-.059 E.00753
G1 X123.089 Y142.783 E.26486
; WIPE_START
G1 F9547.055
M204 S6000
G1 X122.923 Y142.711 E-.06857
G1 X122.886 Y142.59 E-.04816
G1 X122.886 Y140.897 E-.64327
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


G1 X123.803 Y139.631 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.68463
G1 F5486
M204 S6000
G1 X123.803 Y129.756 E.51637
M204 S10000
G1 X123.241 Y129.356 F42000
; LINE_WIDTH: 0.36004
G1 F5486
M204 S6000
G1 X123.241 Y127.744 E.04165
; WIPE_START
G1 F11352.17
G1 X123.241 Y129.356 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.203 Y126.937 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.67176
G1 F5486
M204 S6000
G1 X124.203 Y116.063 E.55724
; WIPE_START
G1 F5724.827
G1 X124.203 Y118.063 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.241 Y115.256 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.36001
G1 F5486
M204 S6000
G1 X123.241 Y113.644 E.04165
G1 X123.249 Y113.573 E.00185
G1 X123.324 Y113.549 E.00204
; LINE_WIDTH: 0.304431
G1 X123.399 Y113.525 E.00168
; LINE_WIDTH: 0.280614
G1 X131.011 Y113.525 E.14744
; WIPE_START
G1 F15000
G1 X129.011 Y113.525 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.665 Y121.129 Z4.8 F42000
G1 X130.143 Y126.687 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.54331
G1 F5486
M204 S6000
G1 X130.644 Y126.687 E.0204
G1 X130.644 Y116.313 E.42302
G1 X130.143 Y116.313 E.0204
G1 X130.143 Y126.627 E.42057
; WIPE_START
G1 F7194.389
G1 X130.143 Y124.627 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.389 Y129.563 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.45586
G1 F5486
M204 S6000
G1 X124.523 Y129.563 E.13009
; WIPE_START
G1 F8717.973
G1 X126.523 Y129.563 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.749 Y130.942 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5486
M204 S6000
G1 X130.749 Y132.57 E.05401
G1 X130.621 Y132.656 E.00511
G1 X129.966 Y132.803 E.02227
G3 X129.34 Y132.523 I-.057 J-.711 E.0237
G1 X129.34 Y134.022 E.04975
G1 X129.966 Y134.841 E.03417
G1 X130.621 Y135.276 E.02608
G1 X130.749 Y135.305 E.00436
G1 X130.749 Y137.812 E.08315
G1 X130.621 Y137.897 E.00511
G1 X129.966 Y138.044 E.02227
G3 X129.34 Y137.764 I-.057 J-.711 E.0237
G1 X129.34 Y139.264 E.04975
G1 X129.966 Y140.083 E.03418
G1 X130.621 Y140.517 E.02608
G1 X130.749 Y140.546 E.00436
G1 X130.749 Y141.642 E.03635
G1 X127.792 Y141.642 E.09807
G2 X126.953 Y141.642 I-.42 J.892 E.02877
G1 X125.325 Y141.642 E.05401
M204 S10000
G1 X128.324 Y140.408 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41318
G1 F5486
M204 S6000
G1 X128.324 Y140.223 E.00559
M73 P51 R10
G1 X124.074 Y140.223 E.12824
G1 X124.074 Y140.593 E.01117
G1 X128.311 Y140.593 E.12784
G1 X128.32 Y140.468 E.00379
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9722.897
G1 X128.311 Y140.593 E-.04774
G1 X126.436 Y140.593 E-.71226
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/75
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z4.8 I1.187 J-.267 P1  F42000
G1 X123.595 Y127.94 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5649
M204 S5000
G1 X130.815 Y127.94 E.22185
G1 X130.815 Y129.16 E.03749
G1 X123.595 Y129.16 E.22185
G1 X123.595 Y128 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.595 Y127.983 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.376 Y135.405 Z5 F42000
G1 X128.247 Y139.035 Z5
G1 Z4.6
G1 E.8 F1800
G1 F5649
M204 S5000
G1 X124.773 Y139.035 E.10675
G1 X124.773 Y138.994 E.00126
G1 X124.773 Y130.006 E.27618
G1 X124.773 Y129.965 E.00126
G1 X128.247 Y129.965 E.10675
G1 X128.247 Y138.975 E.27685
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.247 Y139.01 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.792 Y131.391 Z5 F42000
G1 X125.52 Y126.834 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5649
M204 S6000
G1 X124.721 Y126.834 E.02651
G1 X124.721 Y116.166 E.35389
G1 X129.689 Y116.166 E.16481
G1 X129.689 Y126.834 E.35389
G1 X125.58 Y126.834 E.13631
M204 S10000
G1 X125.52 Y126.427 F42000
G1 F5649
M204 S6000
G1 X125.128 Y126.427 E.01301
G1 X125.128 Y116.573 E.32688
G1 X129.282 Y116.573 E.1378
G1 X129.282 Y126.427 E.32688
G1 X125.58 Y126.427 E.1228
M204 S250
G1 X125.52 Y126.035 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5649
M204 S5000
G1 X125.52 Y116.965 E.2787
G1 X128.89 Y116.965 E.10355
G1 X128.89 Y126.035 E.2787
G1 X125.58 Y126.035 E.10171
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.567 Y124.035 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.702 Y127.141 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5649
M204 S6000
G1 X123.702 Y115.859 E.37424
G1 X131.114 Y115.859 E.24588
G1 X131.114 Y127.141 E.37424
G1 X123.762 Y127.141 E.24389
; WIPE_START
G1 F8843.478
G1 X123.751 Y125.141 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.469 Y132.273 Z5 F42000
G1 X129.046 Y139.035 Z5
G1 Z4.6
G1 E.8 F1800
G1 F5649
M204 S6000
G1 X129.046 Y129.959 E.30106
G1 X131.114 Y129.959 E.06862
G1 X131.114 Y141.99 E.3991
G1 X123.702 Y141.991 E.24588
G1 X123.702 Y129.959 E.39911
G1 X123.973 Y129.959 E.009
G1 X123.973 Y139.834 E.32757
G1 X129.046 Y139.834 E.16826
G1 X129.046 Y139.095 E.02452
; WIPE_START
G1 F8843.478
G1 X129.046 Y137.095 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.435 Y142.269 Z5 F42000
G1 X123.295 Y142.398 Z5
G1 Z4.6
G1 E.8 F1800
G1 F5649
M204 S6000
G1 X123.295 Y129.552 E.42612
G1 X124.38 Y129.552 E.03601
G1 X124.38 Y139.427 E.32757
G1 X128.639 Y139.427 E.14125
G1 X128.639 Y129.552 E.32757
G1 X131.207 Y129.552 E.08521
G1 X131.207 Y127.548 E.06648
G1 X123.295 Y127.548 E.26247
G1 X123.295 Y115.452 E.40124
G1 X131.207 Y115.452 E.26247
G1 X131.207 Y113.602 E.06136
G1 X131.521 Y113.602 E.01042
G1 X131.521 Y142.398 E.95519
G1 X123.355 Y142.398 E.27089
; WIPE_START
M73 P51 R9
G1 F8843.478
G1 X123.346 Y140.398 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.421 Y132.766 Z5 F42000
G1 X123.595 Y115.06 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5649
M204 S5000
G1 X123.595 Y113.84 E.03749
G1 X130.815 Y113.84 E.22185
G1 X130.815 Y115.06 E.03749
G1 X123.655 Y115.06 E.22001
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.595 Y113.84 E-.46416
G1 X124.374 Y113.84 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.024 Y121.464 Z5 F42000
G1 X123.046 Y142.783 Z5
G1 Z4.6
G1 E.8 F1800
G1 F5649
M204 S5000
G3 X122.903 Y142.59 I.06 J-.194 E.0079
G1 X122.903 Y113.407 E.8967
G3 X123.091 Y113.21 I.199 J.002 E.00921
G1 X131.768 Y113.217 E.26663
G3 X131.913 Y113.41 I-.048 J.187 E.00803
G1 X131.907 Y142.648 E.8984
G3 X131.726 Y142.79 I-.189 J-.055 E.00752
G1 X123.106 Y142.783 E.26489
; WIPE_START
G1 F9547.055
M204 S6000
G1 X122.94 Y142.711 E-.06871
G1 X122.903 Y142.59 E-.04808
G1 X122.903 Y140.897 E-.64321
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


G1 X124.857 Y141.643 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5649
M204 S6000
G1 X126.486 Y141.642 E.05401
G2 X126.476 Y141.103 I-.514 J-.26 E.01862
G1 X126.199 Y140.982 E.01004
G1 X126.878 Y140.982 E.02252
G1 X126.904 Y141.103 E.00413
G3 X128.02 Y141.642 I-1.991 J5.55 E.04121
G1 X130.766 Y141.642 E.09108
G1 X130.766 Y140.659 E.03263
G3 X129.547 Y139.138 I1.422 J-2.388 E.06605
G3 X129.524 Y138.483 I.607 J-.35 E.02263
G2 X130.766 Y137.872 I-2.266 J-6.177 E.04599
G1 X130.766 Y135.417 E.08143
G3 X129.547 Y133.896 I1.422 J-2.388 E.06605
G3 X129.524 Y133.241 I.607 J-.35 E.02263
G2 X130.766 Y132.631 I-2.266 J-6.177 E.04599
G1 X130.766 Y131.002 E.05401
; WIPE_START
G1 F8843.478
G1 X130.766 Y132.631 E-.61876
G1 X130.432 Y132.795 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.443 Y129.563 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.45586
G1 F5649
M204 S6000
G1 X124.577 Y129.563 E.13009
M204 S10000
G1 X123.249 Y129.356 F42000
; LINE_WIDTH: 0.34319
G1 F5649
M204 S6000
G1 X123.249 Y127.744 E.03944
; WIPE_START
G1 F11989.21
G1 X123.249 Y129.356 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.212 Y126.937 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.65491
G1 F5649
M204 S6000
G1 X124.212 Y116.063 E.54231
; WIPE_START
G1 F5882.449
G1 X124.212 Y118.063 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.249 Y115.256 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.343607
G1 F5649
M204 S6000
G1 X123.249 Y113.644 E.0395
G1 X123.259 Y113.566 E.00191
G1 X123.329 Y113.546 E.00179
; LINE_WIDTH: 0.301237
G1 X123.399 Y113.525 E.00154
; LINE_WIDTH: 0.280635
G1 X131.011 Y113.525 E.14745
; WIPE_START
G1 F15000
G1 X129.011 Y113.525 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.668 Y121.129 Z5 F42000
G1 X130.147 Y126.683 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.55183
G1 F5649
M204 S6000
G1 X130.656 Y126.683 E.0211
G1 X130.656 Y116.317 E.42987
G1 X130.147 Y116.317 E.0211
G1 X130.147 Y126.623 E.42738
; WIPE_START
G1 F7073.942
G1 X130.147 Y124.623 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.921 Y132.156 Z5 F42000
G1 X127.578 Y140.408 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41318
G1 F5649
M204 S6000
G1 X127.578 Y140.223 E.00559
G1 X124.091 Y140.223 E.10521
G1 X124.091 Y140.593 E.01117
G1 X127.564 Y140.593 E.10481
G1 X127.573 Y140.468 E.00379
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9722.897
G1 X127.564 Y140.593 E-.04774
G1 X125.69 Y140.593 E-.71226
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/75
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z5 I1.201 J-.199 P1  F42000
G1 X123.595 Y127.94 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5645
M204 S5000
G1 X130.815 Y127.94 E.22185
G1 X130.815 Y129.16 E.03749
G1 X123.595 Y129.16 E.22185
G1 X123.595 Y128 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.595 Y127.983 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.41 Y135.397 Z5.2 F42000
G1 X128.3 Y139.035 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F5645
M204 S5000
G1 X124.826 Y139.035 E.10675
G1 X124.826 Y138.994 E.00126
G1 X124.826 Y130.006 E.27618
G1 X124.826 Y129.965 E.00126
G1 X128.3 Y129.965 E.10675
G1 X128.3 Y138.975 E.27685
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.301 Y139.01 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.812 Y131.393 Z5.2 F42000
G1 X125.52 Y126.834 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5645
M204 S6000
G1 X124.721 Y126.834 E.02651
G1 X124.721 Y116.166 E.35389
G1 X129.689 Y116.166 E.16481
G1 X129.689 Y126.834 E.35389
G1 X125.58 Y126.834 E.13631
M204 S10000
G1 X125.52 Y126.427 F42000
G1 F5645
M204 S6000
G1 X125.128 Y126.427 E.01301
G1 X125.128 Y116.573 E.32688
G1 X129.282 Y116.573 E.1378
G1 X129.282 Y126.427 E.32688
G1 X125.58 Y126.427 E.1228
M204 S250
G1 X125.52 Y126.035 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P52 R9
G1 F5645
M204 S5000
G1 X125.52 Y116.965 E.2787
G1 X128.89 Y116.965 E.10355
G1 X128.89 Y126.035 E.2787
G1 X125.58 Y126.035 E.10171
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.567 Y124.035 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.719 Y127.141 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5645
M204 S6000
G1 X123.719 Y115.859 E.37424
G1 X131.131 Y115.859 E.24588
G1 X131.131 Y127.141 E.37424
G1 X123.779 Y127.141 E.24389
; WIPE_START
G1 F8843.478
G1 X123.768 Y125.141 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.502 Y132.267 Z5.2 F42000
G1 X129.099 Y139.035 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F5645
M204 S6000
G1 X129.099 Y129.959 E.30106
G1 X131.131 Y129.959 E.0674
G1 X131.131 Y141.99 E.3991
G1 X123.719 Y141.991 E.24588
G1 X123.719 Y129.959 E.39911
G1 X124.027 Y129.959 E.01022
G1 X124.027 Y139.834 E.32757
G1 X129.099 Y139.834 E.16826
G1 X129.099 Y139.095 E.02452
; WIPE_START
G1 F8843.478
G1 X129.099 Y137.095 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.472 Y142.251 Z5.2 F42000
G1 X123.312 Y142.398 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F5645
M204 S6000
G1 X123.312 Y129.552 E.42612
G1 X124.434 Y129.552 E.03723
G1 X124.434 Y139.427 E.32757
G1 X128.692 Y139.427 E.14125
G1 X128.692 Y129.552 E.32757
G1 X131.207 Y129.552 E.08343
G1 X131.207 Y127.548 E.06648
G1 X123.312 Y127.548 E.26191
G1 X123.312 Y115.452 E.40124
G1 X131.207 Y115.452 E.26191
G1 X131.207 Y113.602 E.06136
G1 X131.538 Y113.602 E.01098
G1 X131.538 Y142.398 E.95519
G1 X123.372 Y142.398 E.2709
; WIPE_START
G1 F8843.478
G1 X123.362 Y140.398 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.433 Y132.766 Z5.2 F42000
G1 X123.595 Y115.06 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5645
M204 S5000
G1 X123.595 Y113.84 E.03749
G1 X130.815 Y113.84 E.22185
G1 X130.815 Y115.06 E.03749
G1 X123.655 Y115.06 E.22001
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.595 Y113.84 E-.46416
G1 X124.374 Y113.84 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.028 Y121.465 Z5.2 F42000
G1 X123.062 Y142.783 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F5645
M204 S5000
G3 X122.92 Y142.59 I.059 J-.193 E.0079
G1 X122.92 Y113.407 E.8967
G3 X123.108 Y113.21 I.199 J.002 E.00921
G1 X131.786 Y113.217 E.26665
G3 X131.93 Y113.41 I-.048 J.187 E.00802
G1 X131.924 Y142.648 E.8984
G3 X131.743 Y142.79 I-.192 J-.059 E.00753
G1 X123.122 Y142.783 E.26487
; WIPE_START
G1 F9547.055
M204 S6000
G1 X122.956 Y142.711 E-.06883
G1 X122.92 Y142.59 E-.04788
G1 X122.92 Y140.897 E-.64329
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


G1 X124.067 Y140.968 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5645
M204 S6000
G1 X124.067 Y140.182 E.02605
G1 X124.91 Y140.182 E.02796
G1 X125.078 Y140.448 E.01043
G1 X125.9 Y141.103 E.03486
G3 X126.2 Y141.642 I-.38 J.564 E.02125
G1 X128.155 Y141.642 E.06485
G3 X127.221 Y140.776 I1.378 J-2.422 E.04265
G3 X127.208 Y140.182 I.717 J-.313 E.02019
G1 X129.448 Y140.182 E.0743
G1 X129.448 Y130.307 E.32757
G1 X130.783 Y130.307 E.0443
G1 X130.783 Y132.697 E.07925
G2 X129.842 Y133.569 I1.387 J2.44 E.04295
G1 X129.777 Y133.896 E.01108
G2 X130.783 Y135.596 I2.386 J-.266 E.06751
G1 X130.783 Y137.938 E.0777
G2 X129.842 Y138.81 I1.387 J2.44 E.04295
G1 X129.777 Y139.138 E.01108
G2 X130.783 Y140.837 I2.386 J-.266 E.06751
G1 X130.783 Y141.642 E.02672
G1 X129.96 Y141.642 E.0273
; WIPE_START
G1 F8843.478
G1 X130.783 Y141.642 E-.31271
G1 X130.783 Y140.837 E-.30605
G1 X130.498 Y140.598 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.136 Y133.088 Z5.2 F42000
G1 X128.496 Y129.563 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.45586
G1 F5645
M204 S6000
G1 X124.63 Y129.563 E.13009
M204 S10000
G1 X123.257 Y129.356 F42000
; LINE_WIDTH: 0.32634
G1 F5645
M204 S6000
G1 X123.257 Y127.744 E.03723
; WIPE_START
G1 F12701.997
G1 X123.257 Y129.356 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.22 Y126.937 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.63806
G1 F5645
M204 S6000
G1 X124.22 Y116.063 E.52738
; WIPE_START
G1 F6048.997
G1 X124.22 Y118.063 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.257 Y115.256 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.3272
G1 F5645
M204 S6000
G1 X123.257 Y113.644 E.03734
G1 X123.27 Y113.56 E.00196
G1 X123.335 Y113.543 E.00155
; LINE_WIDTH: 0.298187
G1 X123.399 Y113.525 E.00139
; LINE_WIDTH: 0.280646
G1 X131.011 Y113.525 E.14746
; WIPE_START
G1 F15000
G1 X129.011 Y113.525 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.67 Y121.129 Z5.2 F42000
G1 X130.152 Y126.679 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.56035
G1 F5645
M204 S6000
G1 X130.669 Y126.679 E.02182
G1 X130.669 Y116.321 E.4367
G1 X130.152 Y116.321 E.02182
G1 X130.152 Y126.619 E.43417
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6957.463
G1 X130.152 Y124.619 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/75
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z5.2 I-.55 J-1.086 P1  F42000
G1 X123.595 Y127.94 Z5.2
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5641
M204 S5000
G1 X130.815 Y127.94 E.22185
G1 X130.815 Y129.16 E.03749
G1 X123.595 Y129.16 E.22185
G1 X123.595 Y128 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.595 Y127.983 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.444 Y135.389 Z5.4 F42000
G1 X128.354 Y139.035 Z5.4
G1 Z5
G1 E.8 F1800
G1 F5641
M204 S5000
G1 X124.88 Y139.035 E.10675
G1 X124.88 Y138.994 E.00126
G1 X124.88 Y130.006 E.27618
G1 X124.88 Y129.965 E.00126
G1 X128.354 Y129.965 E.10675
G1 X128.354 Y138.975 E.27685
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.354 Y139.01 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.833 Y131.395 Z5.4 F42000
G1 X125.52 Y126.834 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5641
M204 S6000
G1 X124.721 Y126.834 E.02651
G1 X124.721 Y116.166 E.35389
G1 X129.689 Y116.166 E.16481
G1 X129.689 Y126.834 E.35389
G1 X125.58 Y126.834 E.13631
M204 S10000
G1 X125.52 Y126.427 F42000
G1 F5641
M204 S6000
G1 X125.128 Y126.427 E.01301
G1 X125.128 Y116.573 E.32688
G1 X129.282 Y116.573 E.1378
G1 X129.282 Y126.427 E.32688
G1 X125.58 Y126.427 E.1228
M204 S250
G1 X125.52 Y126.035 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5641
M204 S5000
G1 X125.52 Y116.965 E.2787
G1 X128.89 Y116.965 E.10355
G1 X128.89 Y126.035 E.2787
G1 X125.58 Y126.035 E.10171
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.567 Y124.035 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.736 Y127.141 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5641
M204 S6000
G1 X123.736 Y115.859 E.37424
G1 X131.148 Y115.859 E.24589
G1 X131.148 Y127.141 E.37424
G1 X123.796 Y127.141 E.2439
; WIPE_START
G1 F8843.478
G1 X123.785 Y125.141 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.051 Y132.429 Z5.4 F42000
G1 X128.354 Y139.834 Z5.4
G1 Z5
G1 E.8 F1800
G1 F5641
M204 S6000
G1 X129.153 Y139.834 E.02651
G1 X129.153 Y129.959 E.32757
G1 X131.148 Y129.959 E.06619
G1 X131.148 Y141.99 E.3991
G1 X123.736 Y141.991 E.24589
G1 X123.736 Y129.959 E.39911
G1 X124.081 Y129.959 E.01144
G1 X124.081 Y139.834 E.32757
G1 X128.294 Y139.834 E.13976
; WIPE_START
G1 F8843.478
G1 X129.153 Y139.834 E-.32648
G1 X129.153 Y138.693 E-.43352
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.329 Y142.398 Z5.4 F42000
G1 Z5
G1 E.8 F1800
M73 P53 R9
G1 F5641
M204 S6000
G1 X123.329 Y129.552 E.42612
G1 X124.488 Y129.552 E.03845
G1 X124.488 Y139.427 E.32757
G1 X128.746 Y139.427 E.14125
G1 X128.746 Y129.552 E.32757
G1 X131.207 Y129.552 E.08165
G1 X131.207 Y127.548 E.06648
G1 X123.329 Y127.548 E.26135
G1 X123.329 Y115.452 E.40124
G1 X131.207 Y115.452 E.26135
G1 X131.207 Y113.602 E.06136
G1 X131.555 Y113.602 E.01155
G1 X131.555 Y142.398 E.9552
G1 X123.389 Y142.398 E.27091
; WIPE_START
G1 F8843.478
G1 X123.379 Y140.398 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.444 Y132.766 Z5.4 F42000
G1 X123.595 Y115.06 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5641
M204 S5000
G1 X123.595 Y113.84 E.03749
G1 X130.815 Y113.84 E.22185
G1 X130.815 Y115.06 E.03749
G1 X123.655 Y115.06 E.22001
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.595 Y113.84 E-.46416
G1 X124.374 Y113.84 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.033 Y121.465 Z5.4 F42000
G1 X123.079 Y142.783 Z5.4
G1 Z5
G1 E.8 F1800
G1 F5641
M204 S5000
G3 X122.937 Y142.59 I.058 J-.193 E.00791
G1 X122.937 Y113.407 E.8967
G3 X123.125 Y113.21 I.2 J.002 E.00921
G1 X131.785 Y113.212 E.2661
G1 X131.796 Y113.215 E.00036
G3 X131.947 Y113.41 I-.043 J.19 E.00823
G1 X131.941 Y142.648 E.8984
G3 X131.76 Y142.79 I-.192 J-.059 E.00751
G1 X123.139 Y142.783 E.26489
; WIPE_START
G1 F9547.055
M204 S6000
G1 X122.973 Y142.71 E-.06895
G1 X122.937 Y142.59 E-.04783
G1 X122.937 Y140.897 E-.64322
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


G1 X124.084 Y141.019 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5641
M204 S6000
G1 X124.084 Y140.182 E.02775
G1 X124.876 Y140.182 E.02626
G1 X124.991 Y140.448 E.00961
G3 X126.002 Y141.642 I-2.286 J2.96 E.05229
G1 X128.275 Y141.642 E.07539
G3 X127.328 Y140.448 I1.953 J-2.521 E.05105
G1 X127.328 Y140.182 E.00881
G1 X129.501 Y140.182 E.0721
G1 X129.501 Y130.307 E.32757
G1 X130.567 Y130.307 E.03534
G1 X130.8 Y130.546 E.01108
G1 X130.8 Y132.8 E.07476
G2 X129.949 Y133.896 I1.826 J2.297 E.0465
G2 X130.8 Y135.788 I2.076 J.202 E.072
G1 X130.8 Y138.041 E.07476
G2 X129.949 Y139.138 I1.826 J2.297 E.0465
G2 X130.8 Y141.029 I2.076 J.202 E.072
G1 X130.8 Y141.642 E.02035
G1 X129.785 Y141.642 E.03367
; WIPE_START
G1 F8843.478
G1 X130.8 Y141.642 E-.38568
G1 X130.8 Y141.029 E-.23308
G1 X130.54 Y140.763 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.205 Y133.248 Z5.4 F42000
G1 X128.55 Y129.563 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.45586
G1 F5641
M204 S6000
G1 X124.684 Y129.563 E.13009
M204 S10000
G1 X123.266 Y129.356 F42000
; LINE_WIDTH: 0.3095
G1 F5641
M204 S6000
G1 X123.266 Y127.744 E.03501
; WIPE_START
G1 F13504.389
G1 X123.266 Y129.356 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.228 Y126.937 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.62122
G1 F5641
M204 S6000
G1 X124.228 Y116.063 E.51246
; WIPE_START
G1 F6225.143
G1 X124.228 Y118.063 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.266 Y115.256 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.310798
G1 F5641
M204 S6000
G1 X123.266 Y113.644 E.03519
G1 X123.281 Y113.555 E.00198
G1 X123.34 Y113.54 E.00133
; LINE_WIDTH: 0.295302
G1 X123.399 Y113.525 E.00125
; LINE_WIDTH: 0.280667
G1 X131.011 Y113.525 E.14747
; WIPE_START
G1 F15000
G1 X129.011 Y113.525 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.673 Y121.129 Z5.4 F42000
G1 X130.156 Y126.674 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.56887
G1 F5641
M204 S6000
G1 X130.682 Y126.674 E.02254
G1 X130.682 Y116.326 E.44353
G1 X130.156 Y116.326 E.02254
G1 X130.156 Y126.614 E.44096
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6844.757
G1 X130.156 Y124.614 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/75
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z5.4 I-.55 J-1.085 P1  F42000
G1 X123.595 Y127.94 Z5.4
G1 Z5.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5759
M204 S5000
G1 X130.815 Y127.94 E.22185
G1 X130.815 Y129.16 E.03749
G1 X123.595 Y129.16 E.22185
G1 X123.595 Y128 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.595 Y127.983 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.477 Y135.38 Z5.6 F42000
G1 X128.407 Y139.035 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F5759
M204 S5000
G1 X124.933 Y139.035 E.10675
G1 X124.933 Y138.994 E.00126
G1 X124.933 Y130.006 E.27618
G1 X124.933 Y129.965 E.00126
G1 X128.407 Y129.965 E.10675
G1 X128.407 Y138.975 E.27685
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.408 Y139.01 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.853 Y131.397 Z5.6 F42000
G1 X125.52 Y126.834 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5759
M204 S6000
G1 X124.721 Y126.834 E.02651
G1 X124.721 Y116.166 E.35389
G1 X129.689 Y116.166 E.16481
G1 X129.689 Y126.834 E.35389
G1 X125.58 Y126.834 E.13631
M204 S10000
G1 X125.52 Y126.427 F42000
G1 F5759
M204 S6000
G1 X125.128 Y126.427 E.01301
G1 X125.128 Y116.573 E.32688
G1 X129.282 Y116.573 E.1378
G1 X129.282 Y126.427 E.32688
G1 X125.58 Y126.427 E.1228
M204 S250
G1 X125.52 Y126.035 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5759
M204 S5000
G1 X125.52 Y116.965 E.2787
G1 X128.89 Y116.965 E.10355
G1 X128.89 Y126.035 E.2787
G1 X125.58 Y126.035 E.10171
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.567 Y124.035 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.753 Y127.141 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5759
M204 S6000
G1 X123.753 Y115.859 E.37424
G1 X131.165 Y115.859 E.2459
G1 X131.165 Y127.141 E.37424
G1 X123.813 Y127.141 E.24391
; WIPE_START
G1 F8843.478
G1 X123.802 Y125.141 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.569 Y132.254 Z5.6 F42000
G1 X129.207 Y139.035 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F5759
M204 S6000
G1 X129.207 Y129.959 E.30106
G1 X131.165 Y129.959 E.06498
G1 X131.165 Y141.99 E.3991
G1 X123.753 Y141.991 E.2459
G1 X123.753 Y129.959 E.39911
G1 X124.134 Y129.959 E.01266
G1 X124.134 Y139.834 E.32757
G1 X129.207 Y139.834 E.16826
G1 X129.207 Y139.095 E.02452
; WIPE_START
G1 F8843.478
G1 X129.207 Y137.095 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.547 Y142.216 Z5.6 F42000
G1 X123.346 Y142.398 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F5759
M204 S6000
G1 X123.346 Y129.552 E.42612
G1 X124.541 Y129.552 E.03967
G1 X124.541 Y139.427 E.32757
G1 X128.799 Y139.427 E.14125
G1 X128.799 Y129.552 E.32757
G1 X131.207 Y129.552 E.07987
G1 X131.207 Y127.548 E.06648
G1 X123.346 Y127.548 E.26079
G1 X123.346 Y115.452 E.40124
G1 X131.207 Y115.452 E.26079
G1 X131.207 Y113.602 E.06137
G1 X131.572 Y113.602 E.01211
G1 X131.572 Y142.398 E.9552
G1 X123.406 Y142.398 E.27091
; WIPE_START
G1 F8843.478
G1 X123.396 Y140.398 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.456 Y132.766 Z5.6 F42000
G1 X123.595 Y115.06 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5759
M204 S5000
G1 X123.595 Y113.84 E.03749
G1 X130.815 Y113.84 E.22185
G1 X130.815 Y115.06 E.03749
G1 X123.655 Y115.06 E.22001
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.595 Y113.84 E-.46416
G1 X124.374 Y113.84 E-.29585
; WIPE_END
M73 P54 R9
G1 E-.04 F1800
M204 S10000
G1 X124.037 Y121.465 Z5.6 F42000
G1 X123.096 Y142.783 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F5759
M204 S5000
G3 X122.953 Y142.59 I.06 J-.194 E.0079
G1 X122.953 Y113.407 E.8967
G3 X123.141 Y113.21 I.2 J.002 E.00921
G1 X131.802 Y113.212 E.2661
G1 X131.813 Y113.215 E.00036
G3 X131.965 Y113.41 I-.043 J.19 E.00823
G1 X131.958 Y142.648 E.8984
G3 X131.777 Y142.79 I-.189 J-.056 E.00754
G1 X123.156 Y142.783 E.26488
; WIPE_START
G1 F9547.055
M204 S6000
G1 X122.99 Y142.711 E-.06868
G1 X122.953 Y142.59 E-.04813
G1 X122.953 Y140.897 E-.64319
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


G1 X124.101 Y141.089 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5759
M204 S6000
G1 X124.101 Y140.182 E.03009
G1 X124.822 Y140.182 E.02393
G1 X124.889 Y140.448 E.00909
G3 X125.829 Y141.642 I-17.586 J14.807 E.05043
G1 X128.396 Y141.642 E.08514
G3 X127.462 Y140.448 I17.573 J-14.701 E.05029
G1 X127.414 Y140.182 E.00895
G1 X129.555 Y140.182 E.071
G1 X129.555 Y130.307 E.32757
G1 X130.408 Y130.307 E.0283
G3 X130.817 Y130.852 I-2.76 J2.498 E.02264
G1 X130.817 Y132.942 E.06933
G2 X130.083 Y133.896 I19.85 J16.035 E.03994
G2 X130.662 Y135.862 I1.744 J.554 E.07214
G1 X130.817 Y136.094 E.00925
G1 X130.817 Y138.184 E.06933
G2 X130.083 Y139.138 I19.844 J16.03 E.03994
G2 X130.662 Y141.103 I1.744 J.554 E.07214
G1 X130.817 Y141.335 E.00925
G1 X130.817 Y139.707 E.05401
; WIPE_START
G1 F8843.478
G1 X130.817 Y141.335 E-.61876
G1 X130.662 Y141.103 E-.10594
G1 X130.604 Y141.031 E-.0353
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.292 Y133.512 Z5.6 F42000
G1 X128.603 Y129.563 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.45586
G1 F5759
M204 S6000
G1 X124.737 Y129.563 E.13009
M204 S10000
G1 X123.274 Y129.356 F42000
; LINE_WIDTH: 0.29265
G1 F5759
M204 S6000
G1 X123.274 Y127.744 E.0328
; WIPE_START
G1 F14415.568
G1 X123.274 Y129.356 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.237 Y126.937 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.60437
G1 F5759
M204 S6000
G1 X124.237 Y116.063 E.49753
; WIPE_START
G1 F6411.969
G1 X124.237 Y118.063 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.274 Y115.256 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.283317
G1 F5759
M204 S6000
G1 X123.274 Y113.644 E.03158
G1 X123.292 Y113.549 E.00189
G1 X123.399 Y113.525 E.00215
G1 X131.011 Y113.525 E.14911
; WIPE_START
G1 F14975.258
G1 X129.011 Y113.525 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.627 Y121.133 Z5.6 F42000
G1 X130.081 Y126.749 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F5759
M204 S6000
G1 X130.773 Y126.749 E.02126
G1 X130.773 Y116.251 E.32255
G1 X130.081 Y116.251 E.02126
G1 X130.081 Y126.689 E.32071
M204 S10000
G1 X130.427 Y126.403 F42000
; LINE_WIDTH: 0.35772
G1 F5759
M204 S6000
G1 X130.427 Y116.657 E.25
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11435.832
G1 X130.427 Y118.657 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/75
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z5.6 I-.98 J-.721 P1  F42000
G1 X123.595 Y127.94 Z5.6
G1 Z5.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5633
M204 S5000
G1 X130.815 Y127.94 E.22185
G1 X130.815 Y129.16 E.03749
G1 X123.595 Y129.16 E.22185
G1 X123.595 Y128 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.595 Y127.983 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.511 Y135.371 Z5.8 F42000
G1 X128.461 Y139.035 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F5633
M204 S5000
G1 X124.987 Y139.035 E.10675
G1 X124.987 Y138.994 E.00126
G1 X124.987 Y130.006 E.27618
G1 X124.987 Y129.965 E.00126
G1 X128.461 Y129.965 E.10675
G1 X128.461 Y138.975 E.27685
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.461 Y139.01 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.873 Y131.4 Z5.8 F42000
G1 X125.52 Y126.834 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5633
M204 S6000
G1 X124.721 Y126.834 E.02651
G1 X124.721 Y116.166 E.35389
G1 X129.689 Y116.166 E.16481
G1 X129.689 Y126.834 E.35389
G1 X125.58 Y126.834 E.13631
M204 S10000
G1 X125.52 Y126.427 F42000
G1 F5633
M204 S6000
G1 X125.128 Y126.427 E.01301
G1 X125.128 Y116.573 E.32688
G1 X129.282 Y116.573 E.1378
G1 X129.282 Y126.427 E.32688
G1 X125.58 Y126.427 E.1228
M204 S250
G1 X125.52 Y126.035 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5633
M204 S5000
G1 X125.52 Y116.965 E.2787
G1 X128.89 Y116.965 E.10355
G1 X128.89 Y126.035 E.2787
G1 X125.58 Y126.035 E.10171
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.567 Y124.035 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.769 Y127.141 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5633
M204 S6000
G1 X123.769 Y115.859 E.37424
G1 X131.182 Y115.859 E.2459
G1 X131.182 Y127.141 E.37424
G1 X123.829 Y127.141 E.24391
; WIPE_START
G1 F8843.478
G1 X123.819 Y125.141 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.602 Y132.248 Z5.8 F42000
G1 X129.26 Y139.035 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F5633
M204 S6000
G1 X129.26 Y129.959 E.30106
G1 X131.182 Y129.959 E.06377
G1 X131.182 Y141.99 E.3991
G1 X123.769 Y141.991 E.2459
G1 X123.769 Y129.959 E.39911
G1 X124.188 Y129.959 E.01388
G1 X124.188 Y139.834 E.32757
G1 X129.26 Y139.834 E.16826
G1 X129.26 Y139.095 E.02452
; WIPE_START
G1 F8843.478
G1 X129.26 Y137.095 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.585 Y142.198 Z5.8 F42000
G1 X123.362 Y142.398 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F5633
M204 S6000
G1 X123.362 Y129.552 E.42612
G1 X124.595 Y129.552 E.04088
G1 X124.595 Y139.427 E.32757
G1 X128.853 Y139.427 E.14125
G1 X128.853 Y129.552 E.32757
G1 X131.207 Y129.552 E.07809
G1 X131.207 Y127.548 E.06648
G1 X123.362 Y127.548 E.26023
G1 X123.362 Y115.452 E.40124
G1 X131.207 Y115.452 E.26023
G1 X131.207 Y113.602 E.06137
G1 X131.589 Y113.602 E.01268
G1 X131.589 Y142.398 E.9552
G1 X123.422 Y142.398 E.27092
; WIPE_START
G1 F8843.478
G1 X123.413 Y140.398 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.468 Y132.766 Z5.8 F42000
G1 X123.595 Y115.06 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5633
M204 S5000
G1 X123.595 Y113.84 E.03749
G1 X130.815 Y113.84 E.22185
G1 X130.815 Y115.06 E.03749
G1 X123.655 Y115.06 E.22001
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.595 Y113.84 E-.46416
G1 X124.374 Y113.84 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.042 Y121.465 Z5.8 F42000
G1 X123.113 Y142.783 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F5633
M204 S5000
G3 X122.97 Y142.59 I.057 J-.191 E.00792
G1 X122.97 Y113.407 E.8967
G3 X123.158 Y113.21 I.199 J.002 E.00921
G1 X131.83 Y113.215 E.26647
G1 X131.842 Y113.217 E.00037
G3 X131.982 Y113.41 I-.056 J.187 E.00786
G1 X131.975 Y142.648 E.8984
G3 X131.794 Y142.79 I-.189 J-.055 E.00754
G1 X123.173 Y142.783 E.2649
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.011 Y142.716 E-.06669
G1 X122.97 Y142.59 E-.05025
G1 X122.97 Y140.898 E-.64306
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


G1 X124.118 Y141.6 F42000
G1 Z5.4
M73 P55 R9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5633
M204 S6000
G1 X124.118 Y141.643 E.00142
G1 X125.703 Y141.642 E.0526
G3 X124.766 Y140.448 I3 J-3.317 E.0506
G1 X124.746 Y140.182 E.00884
G1 X127.477 Y140.182 E.09057
G1 X127.572 Y140.448 E.00936
G3 X128.555 Y141.642 I-3.638 J3.997 E.05149
G1 X130.834 Y141.642 E.07561
G1 X130.834 Y141.52 E.00406
G3 X130.008 Y140.448 I2.711 J-2.944 E.04511
G3 X130.782 Y138.483 I1.972 J-.358 E.07381
G1 X130.834 Y138.424 E.00261
G1 X130.834 Y136.279 E.07115
G3 X130.008 Y135.207 I2.71 J-2.944 E.04511
G3 X130.782 Y133.241 I1.972 J-.358 E.07381
G1 X130.834 Y133.182 E.00261
G1 X130.834 Y131.037 E.07115
G3 X130.184 Y130.307 I27.544 J-25.177 E.03242
G1 X129.608 Y130.307 E.01911
G1 X129.608 Y131.36 E.03491
; WIPE_START
G1 F8843.478
G1 X129.608 Y130.307 E-.3999
G1 X130.184 Y130.307 E-.21887
G1 X130.432 Y130.585 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.657 Y129.563 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.45586
G1 F5633
M204 S6000
G1 X124.791 Y129.563 E.13009
M204 S10000
G1 X123.283 Y129.356 F42000
; LINE_WIDTH: 0.2758
G1 F5633
M204 S6000
G1 X123.283 Y127.744 E.03059
; WIPE_START
G1 F15000
G1 X123.283 Y129.356 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.245 Y126.937 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.58752
G1 F5633
M204 S6000
G1 X124.245 Y116.063 E.4826
; WIPE_START
G1 F6610.356
G1 X124.245 Y118.063 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.283 Y115.256 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.280233
G1 F5633
M204 S6000
G1 X123.283 Y113.644 E.03117
G1 X123.304 Y113.544 E.00197
G1 X123.399 Y113.525 E.00187
G1 X131.011 Y113.525 E.1472
; WIPE_START
G1 F15000
G1 X129.011 Y113.525 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.627 Y121.133 Z5.8 F42000
G1 X130.081 Y126.749 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F5633
M204 S6000
G1 X130.79 Y126.749 E.02178
G1 X130.79 Y116.251 E.32255
G1 X130.081 Y116.251 E.02178
G1 X130.081 Y126.689 E.32071
M204 S10000
G1 X130.436 Y126.394 F42000
; LINE_WIDTH: 0.37476
G1 F5633
M204 S6000
G1 X130.436 Y116.666 E.26307
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10848.602
G1 X130.436 Y118.666 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/75
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z5.8 I-.979 J-.722 P1  F42000
G1 X123.595 Y127.94 Z5.8
G1 Z5.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5640
M204 S5000
G1 X130.815 Y127.94 E.22185
G1 X130.815 Y129.16 E.03749
G1 X123.595 Y129.16 E.22185
G1 X123.595 Y128 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.595 Y127.983 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.544 Y135.363 Z6 F42000
G1 X128.515 Y139.035 Z6
G1 Z5.6
G1 E.8 F1800
G1 F5640
M204 S5000
G1 X125.041 Y139.035 E.10675
G1 X125.041 Y138.994 E.00126
G1 X125.041 Y130.006 E.27618
G1 X125.041 Y129.965 E.00126
G1 X128.515 Y129.965 E.10675
G1 X128.515 Y138.975 E.27685
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.515 Y139.01 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.893 Y131.402 Z6 F42000
G1 X125.52 Y126.834 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5640
M204 S6000
G1 X124.721 Y126.834 E.02651
G1 X124.721 Y116.166 E.35389
G1 X129.689 Y116.166 E.16481
G1 X129.689 Y126.834 E.35389
G1 X125.58 Y126.834 E.13631
M204 S10000
G1 X125.52 Y126.427 F42000
G1 F5640
M204 S6000
G1 X125.128 Y126.427 E.01301
G1 X125.128 Y116.573 E.32688
G1 X129.282 Y116.573 E.1378
G1 X129.282 Y126.427 E.32688
G1 X125.58 Y126.427 E.1228
M204 S250
G1 X125.52 Y126.035 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5640
M204 S5000
G1 X125.52 Y116.965 E.2787
G1 X128.89 Y116.965 E.10355
G1 X128.89 Y126.035 E.2787
G1 X125.58 Y126.035 E.10171
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.567 Y124.035 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.786 Y127.141 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5640
M204 S6000
G1 X123.786 Y115.859 E.37424
G1 X131.209 Y115.859 E.24622
G1 X131.209 Y127.141 E.37424
G1 X123.846 Y127.141 E.24423
; WIPE_START
G1 F8843.478
G1 X123.836 Y125.141 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.635 Y132.241 Z6 F42000
G1 X129.314 Y139.035 Z6
G1 Z5.6
G1 E.8 F1800
G1 F5640
M204 S6000
G1 X129.314 Y129.959 E.30106
G1 X131.209 Y129.959 E.06286
G1 X131.209 Y141.99 E.3991
G1 X123.786 Y141.991 E.24622
G1 X123.786 Y129.959 E.39911
G1 X124.241 Y129.959 E.0151
G1 X124.241 Y139.834 E.32757
G1 X129.314 Y139.834 E.16826
G1 X129.314 Y139.095 E.02452
; WIPE_START
G1 F8843.478
G1 X129.314 Y137.095 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.622 Y142.181 Z6 F42000
G1 X123.379 Y142.398 Z6
G1 Z5.6
G1 E.8 F1800
G1 F5640
M204 S6000
G1 X123.379 Y129.552 E.42612
G1 X124.648 Y129.552 E.0421
G1 X124.648 Y139.427 E.32757
G1 X128.907 Y139.427 E.14125
G1 X128.907 Y129.552 E.32757
G1 X131.207 Y129.552 E.07632
G1 X131.207 Y127.548 E.06648
G1 X123.379 Y127.548 E.25967
G1 X123.379 Y115.452 E.40124
G1 X131.207 Y115.452 E.25967
G1 X131.207 Y113.602 E.06136
G1 X131.616 Y113.602 E.01355
G1 X131.616 Y142.398 E.95519
G1 X123.439 Y142.398 E.27123
; WIPE_START
G1 F8843.478
G1 X123.43 Y140.398 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.48 Y132.766 Z6 F42000
G1 X123.595 Y115.06 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5640
M204 S5000
G1 X123.595 Y113.84 E.03749
G1 X130.815 Y113.84 E.22185
G1 X130.815 Y115.06 E.03749
G1 X123.655 Y115.06 E.22001
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.595 Y113.84 E-.46416
G1 X124.374 Y113.84 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.046 Y121.465 Z6 F42000
G1 X123.13 Y142.783 Z6
G1 Z5.6
G1 E.8 F1800
G1 F5640
M204 S5000
G3 X122.987 Y142.59 I.061 J-.194 E.00789
G1 X122.987 Y113.407 E.8967
G3 X123.175 Y113.21 I.199 J.002 E.00922
G1 X131.817 Y113.21 E.26554
G3 X132.008 Y113.41 I-.009 J.2 E.00937
G1 X132.001 Y142.648 E.89839
G3 X131.818 Y142.79 I-.19 J-.057 E.00759
G1 X123.19 Y142.783 E.26513
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.024 Y142.711 E-.06858
G1 X122.987 Y142.59 E-.04813
G1 X122.987 Y140.897 E-.64329
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
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X124.135 Y141.465 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5640
M204 S6000
G1 X124.135 Y141.643 E.00589
G1 X125.585 Y141.642 E.04812
G3 X124.712 Y140.776 I2.378 J-3.268 E.04097
G3 X124.641 Y140.182 I.652 J-.379 E.02038
G1 X127.519 Y140.182 E.09545
G1 X127.664 Y140.448 E.01005
G3 X128.667 Y141.431 I-2.69 J3.748 E.04675
G1 X128.732 Y141.642 E.00734
G1 X130.826 Y141.642 E.06947
G3 X129.954 Y140.776 I2.378 J-3.267 E.04095
G1 X129.853 Y140.448 E.01136
G3 X130.86 Y138.624 I2.256 J.055 E.07186
G1 X130.86 Y136.431 E.07272
G3 X129.954 Y135.534 I2.46 J-3.394 E.04248
G1 X129.853 Y135.207 E.01136
G3 X130.86 Y133.382 I2.256 J.055 E.07186
G1 X130.86 Y131.19 E.07272
G3 X129.965 Y130.307 I2.42 J-3.349 E.04186
G1 X129.662 Y130.307 E.01007
G1 X129.662 Y131.632 E.04395
; WIPE_START
G1 F8843.478
G1 X129.662 Y130.307 E-.50345
G1 X129.965 Y130.307 E-.11531
G1 X130.202 Y130.594 E-.14124
; WIPE_END
M73 P56 R9
G1 E-.04 F1800
M204 S10000
G1 X128.711 Y129.563 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.45586
G1 F5640
M204 S6000
G1 X124.845 Y129.563 E.13009
M204 S10000
G1 X123.291 Y129.356 F42000
; LINE_WIDTH: 0.25896
G1 F5640
M204 S6000
G1 X123.291 Y127.744 E.02838
; WIPE_START
G1 F15000
G1 X123.291 Y129.356 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.254 Y126.937 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.57068
G1 F5640
M204 S6000
G1 X124.254 Y116.063 E.46767
; WIPE_START
G1 F6821.283
G1 X124.254 Y118.063 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.291 Y115.256 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.259367
G1 F5640
M204 S6000
G1 X123.291 Y113.644 E.02843
G1 X123.304 Y113.592 E.00095
; LINE_WIDTH: 0.296794
G1 X123.316 Y113.54 E.00111
; LINE_WIDTH: 0.280696
M73 P56 R8
G1 X123.399 Y113.525 E.00163
G1 X131.011 Y113.525 E.14749
; WIPE_START
G1 F15000
G1 X129.011 Y113.525 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.627 Y121.133 Z6 F42000
G1 X130.081 Y126.749 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F5640
M204 S6000
G1 X130.817 Y126.749 E.02259
G1 X130.817 Y116.251 E.32255
G1 X130.081 Y116.251 E.02259
G1 X130.081 Y126.689 E.32071
M204 S10000
G1 X130.449 Y126.381 F42000
; LINE_WIDTH: 0.40106
G1 F5640
M204 S6000
G1 X130.449 Y116.679 E.28315
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10051.934
G1 X130.449 Y118.679 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/75
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z6 I-.978 J-.724 P1  F42000
G1 X123.595 Y127.94 Z6
G1 Z5.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5882
M204 S5000
G1 X130.815 Y127.94 E.22185
G1 X130.815 Y129.16 E.03749
G1 X123.595 Y129.16 E.22185
G1 X123.595 Y128 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.595 Y127.983 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.578 Y135.354 Z6.2 F42000
G1 X128.568 Y139.035 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F5882
M204 S5000
G1 X125.094 Y139.035 E.10675
G1 X125.094 Y138.994 E.00126
G1 X125.094 Y130.006 E.27618
G1 X125.094 Y129.965 E.00126
G1 X128.568 Y129.965 E.10675
G1 X128.568 Y138.975 E.27685
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.568 Y139.01 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.914 Y131.405 Z6.2 F42000
G1 X125.52 Y126.834 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5882
M204 S6000
G1 X124.721 Y126.834 E.02651
G1 X124.721 Y116.166 E.35389
G1 X129.689 Y116.166 E.16481
G1 X129.689 Y126.834 E.35389
G1 X125.58 Y126.834 E.13631
M204 S10000
G1 X125.52 Y126.427 F42000
G1 F5882
M204 S6000
G1 X125.128 Y126.427 E.01301
G1 X125.128 Y116.573 E.32688
G1 X129.282 Y116.573 E.1378
G1 X129.282 Y126.427 E.32688
G1 X125.58 Y126.427 E.1228
M204 S250
G1 X125.52 Y126.035 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5882
M204 S5000
G1 X125.52 Y116.965 E.2787
G1 X128.89 Y116.965 E.10355
G1 X128.89 Y126.035 E.2787
G1 X125.58 Y126.035 E.10171
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.567 Y124.035 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.803 Y127.141 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5882
M204 S6000
G1 X123.803 Y115.859 E.37424
G1 X131.235 Y115.859 E.24653
G1 X131.235 Y127.141 E.37424
G1 X123.863 Y127.141 E.24454
; WIPE_START
G1 F8843.478
G1 X123.852 Y125.141 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.668 Y132.235 Z6.2 F42000
G1 X129.367 Y139.035 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F5882
M204 S6000
G1 X129.367 Y129.959 E.30106
G1 X131.235 Y129.959 E.06196
G1 X131.235 Y141.99 E.3991
G1 X123.803 Y141.991 E.24653
G1 X123.803 Y129.959 E.39911
G1 X124.295 Y129.959 E.01632
G1 X124.295 Y139.834 E.32757
G1 X129.367 Y139.834 E.16826
G1 X129.367 Y139.095 E.02452
; WIPE_START
G1 F8843.478
G1 X129.367 Y137.095 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.66 Y142.163 Z6.2 F42000
G1 X123.396 Y142.398 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F5882
M204 S6000
G1 X123.396 Y129.552 E.42612
G1 X124.702 Y129.552 E.04332
G1 X124.702 Y139.427 E.32757
G1 X128.96 Y139.427 E.14125
G1 X128.96 Y129.552 E.32757
G1 X131.207 Y129.552 E.07454
G1 X131.207 Y127.548 E.06648
G1 X123.396 Y127.548 E.25911
G1 X123.396 Y115.452 E.40124
G1 X131.207 Y115.452 E.25911
G1 X131.207 Y113.602 E.06136
G1 X131.642 Y113.602 E.01442
G1 X131.642 Y142.398 E.95519
G1 X123.456 Y142.398 E.27155
; WIPE_START
G1 F8843.478
G1 X123.447 Y140.398 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.491 Y132.766 Z6.2 F42000
G1 X123.595 Y115.06 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5882
M204 S5000
G1 X123.595 Y113.84 E.03749
G1 X130.815 Y113.84 E.22185
G1 X130.815 Y115.06 E.03749
G1 X123.655 Y115.06 E.22001
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.595 Y113.84 E-.46416
G1 X124.374 Y113.84 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.05 Y121.466 Z6.2 F42000
G1 X123.147 Y142.783 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F5882
M204 S5000
G3 X123.004 Y142.59 I.057 J-.191 E.00792
G1 X123.004 Y113.407 E.8967
G3 X123.192 Y113.21 I.199 J.002 E.00921
G1 X131.842 Y113.21 E.26579
G3 X132.034 Y113.41 I-.007 J.199 E.00942
G1 X132.027 Y142.648 E.8984
G3 X131.845 Y142.79 I-.19 J-.057 E.00759
G1 X123.207 Y142.783 E.26542
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.04 Y142.71 E-.06935
G1 X123.004 Y142.59 E-.04741
G1 X123.004 Y140.897 E-.64323
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


G1 X124.049 Y140.038 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.12769
G1 F5882
M204 S6000
G1 X124.049 Y130.163 E.06821
; WIPE_START
G1 F15000
G1 X124.049 Y132.163 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.898 Y129.563 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.45586
G1 F5882
M204 S6000
G1 X128.764 Y129.563 E.13009
; WIPE_START
G1 F8717.973
G1 X126.764 Y129.563 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.716 Y132.031 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5882
M204 S6000
G1 X129.716 Y130.403 E.05401
G1 X129.858 Y130.621 E.00864
G1 X130.887 Y131.309 E.04106
G1 X130.887 Y133.432 E.07041
G1 X130.366 Y133.896 E.02314
G2 X129.716 Y135.644 I1.308 J1.482 E.06443
G1 X129.858 Y135.862 E.00864
G1 X130.887 Y136.551 E.04106
G1 X130.887 Y138.673 E.07041
G1 X130.366 Y139.138 E.02314
G2 X129.651 Y140.448 I1.512 J1.676 E.05047
G2 X129.858 Y141.103 I.579 J.177 E.02424
G1 X130.695 Y141.642 E.03301
G1 X128.973 Y141.642 E.05713
G2 X128.762 Y141.103 I-.496 J-.117 E.02041
G1 X127.746 Y140.448 E.04012
G1 X127.542 Y140.182 E.0111
G1 X124.461 Y140.182 E.1022
G1 X124.461 Y140.386 E.00675
G2 X124.617 Y141.103 I.607 J.244 E.02585
G1 X125.454 Y141.642 E.03302
G1 X127.082 Y141.642 E.05401
; WIPE_START
G1 F8843.478
G1 X125.454 Y141.642 E-.61876
G1 X125.142 Y141.441 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.992 Y133.896 Z6.2 F42000
G1 X123.3 Y129.356 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.24211
G1 F5882
M204 S6000
M73 P57 R8
G1 X123.3 Y127.744 E.02616
; WIPE_START
G1 F15000
G1 X123.3 Y129.356 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.262 Y126.937 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.55383
G1 F5882
M204 S6000
G1 X124.262 Y116.063 E.45274
; WIPE_START
G1 F7046.251
G1 X124.262 Y118.063 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.3 Y115.256 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.242609
G1 F5882
M204 S6000
G1 X123.3 Y113.644 E.02623
G1 X123.314 Y113.59 E.00091
; LINE_WIDTH: 0.286435
G1 X123.329 Y113.535 E.00112
; LINE_WIDTH: 0.280644
G1 X131.011 Y113.525 E.14881
; WIPE_START
G1 F15000
G1 X129.011 Y113.528 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.627 Y121.135 Z6.2 F42000
G1 X130.081 Y126.749 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F5882
M204 S6000
G1 X130.843 Y126.749 E.0234
G1 X130.843 Y116.251 E.32255
G1 X130.081 Y116.251 E.0234
G1 X130.081 Y126.689 E.32071
M204 S10000
G1 X130.462 Y126.368 F42000
; LINE_WIDTH: 0.42738
G1 F5882
M204 S6000
G1 X130.462 Y116.692 E.30314
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9363.783
G1 X130.462 Y118.692 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/75
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z6.2 I-1.018 J-.668 P1  F42000
G1 X123.595 Y129.16 Z6.2
G1 Z6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5907
M204 S5000
G1 X123.595 Y127.94 E.03749
G1 X130.815 Y127.94 E.22185
G1 X130.815 Y129.16 E.03749
G1 X123.655 Y129.16 E.22001
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.595 Y127.94 E-.46416
G1 X124.374 Y127.94 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.103 Y135.068 Z6.4 F42000
G1 X128.622 Y139.035 Z6.4
G1 Z6
G1 E.8 F1800
G1 F5907
M204 S5000
G1 X125.148 Y139.035 E.10675
G1 X125.148 Y138.994 E.00126
G1 X125.148 Y130.006 E.27618
G1 X125.148 Y129.965 E.00126
G1 X128.622 Y129.965 E.10675
G1 X128.622 Y138.975 E.27685
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.622 Y139.01 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.934 Y131.408 Z6.4 F42000
G1 X125.52 Y126.834 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5907
M204 S6000
G1 X124.721 Y126.834 E.02651
G1 X124.721 Y116.166 E.35389
G1 X129.689 Y116.166 E.16481
G1 X129.689 Y126.834 E.35389
G1 X125.58 Y126.834 E.13631
M204 S10000
G1 X125.52 Y126.427 F42000
G1 F5907
M204 S6000
G1 X125.128 Y126.427 E.01301
G1 X125.128 Y116.573 E.32688
G1 X129.282 Y116.573 E.1378
G1 X129.282 Y126.427 E.32688
G1 X125.58 Y126.427 E.1228
M204 S250
G1 X125.52 Y126.035 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5907
M204 S5000
G1 X125.52 Y116.965 E.2787
G1 X128.89 Y116.965 E.10355
G1 X128.89 Y126.035 E.2787
G1 X125.58 Y126.035 E.10171
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.567 Y124.035 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.82 Y127.141 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5907
M204 S6000
G1 X123.82 Y115.859 E.37424
G1 X131.261 Y115.859 E.24685
G1 X131.261 Y127.141 E.37424
G1 X123.88 Y127.141 E.24485
; WIPE_START
G1 F8843.478
G1 X123.869 Y125.141 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.701 Y132.229 Z6.4 F42000
G1 X129.421 Y139.035 Z6.4
G1 Z6
G1 E.8 F1800
G1 F5907
M204 S6000
G1 X129.421 Y129.959 E.30106
G1 X131.261 Y129.959 E.06105
G1 X131.261 Y141.99 E.3991
G1 X123.82 Y141.991 E.24685
G1 X123.82 Y129.959 E.39911
G1 X124.349 Y129.959 E.01753
G1 X124.349 Y139.834 E.32757
G1 X129.421 Y139.834 E.16826
G1 X129.421 Y139.095 E.02452
; WIPE_START
G1 F8843.478
G1 X129.421 Y137.095 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.699 Y142.146 Z6.4 F42000
G1 X123.413 Y142.398 Z6.4
G1 Z6
G1 E.8 F1800
G1 F5907
M204 S6000
G1 X123.413 Y129.552 E.42612
G1 X124.756 Y129.552 E.04454
G1 X124.756 Y139.427 E.32757
G1 X129.014 Y139.427 E.14125
G1 X129.014 Y129.552 E.32757
G1 X131.207 Y129.552 E.07276
G1 X131.207 Y127.548 E.06648
G1 X123.413 Y127.548 E.25855
G1 X123.413 Y115.452 E.40124
G1 X131.207 Y115.452 E.25855
G1 X131.207 Y113.602 E.06136
G1 X131.668 Y113.602 E.0153
G1 X131.668 Y142.398 E.95519
G1 X123.473 Y142.398 E.27186
; WIPE_START
G1 F8843.478
G1 X123.464 Y140.398 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.503 Y132.766 Z6.4 F42000
G1 X123.595 Y115.06 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5907
M204 S5000
G1 X123.595 Y113.84 E.03749
G1 X130.815 Y113.84 E.22185
G1 X130.815 Y115.06 E.03749
G1 X123.655 Y115.06 E.22001
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.595 Y113.84 E-.46416
G1 X124.374 Y113.84 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.055 Y121.466 Z6.4 F42000
G1 X123.163 Y142.783 Z6.4
G1 Z6
G1 E.8 F1800
G1 F5907
M204 S5000
G3 X123.021 Y142.59 I.061 J-.194 E.00789
G1 X123.021 Y113.407 E.8967
G3 X123.209 Y113.21 I.199 J.002 E.00922
G1 X131.867 Y113.21 E.26604
G3 X132.061 Y113.41 I-.007 J.2 E.00945
G1 X132.054 Y142.648 E.8984
G3 X131.871 Y142.79 I-.191 J-.058 E.00758
G1 X123.223 Y142.783 E.26571
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.058 Y142.711 E-.06862
G1 X123.021 Y142.59 E-.04809
G1 X123.021 Y140.897 E-.64329
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


G1 X124.084 Y140.038 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.16443
G1 F5907
M204 S6000
G1 X124.084 Y130.163 E.09778
; WIPE_START
G1 F15000
G1 X124.084 Y132.163 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.952 Y129.563 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.45586
G1 F5907
M204 S6000
G1 X128.818 Y129.563 E.13009
; WIPE_START
G1 F8717.973
G1 X126.818 Y129.563 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.081 Y126.749 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F5907
M204 S6000
G1 X130.869 Y126.749 E.02421
G1 X130.869 Y116.251 E.32255
G1 X130.081 Y116.251 E.02421
G1 X130.081 Y126.689 E.32071
M204 S10000
G1 X130.475 Y126.355 F42000
; LINE_WIDTH: 0.45372
G1 F5907
M204 S6000
G1 X130.475 Y116.705 E.32302
; WIPE_START
G1 F8763.388
G1 X130.475 Y118.705 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.011 Y113.525 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.28062
G1 F5907
M204 S6000
G1 X123.342 Y113.532 E.14854
; LINE_WIDTH: 0.276901
G1 X123.325 Y113.588 E.00112
; LINE_WIDTH: 0.225864
G1 X123.308 Y113.644 E.00087
G1 X123.308 Y115.256 E.02403
; WIPE_START
G1 F15000
G1 X123.308 Y113.644 E-.73334
G1 X123.325 Y113.588 E-.02666
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.271 Y116.063 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.53698
G1 F5907
M204 S6000
G1 X124.271 Y126.937 E.43781
; WIPE_START
G1 F7286.565
G1 X124.271 Y124.937 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.308 Y127.744 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.22526
G1 F5907
M204 S6000
G1 X123.308 Y129.356 E.02395
; WIPE_START
G1 F15000
G1 X123.308 Y127.744 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.411 Y132.328 Z6.4 F42000
G1 X129.769 Y132.597 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5907
M204 S6000
G1 X129.769 Y130.968 E.05401
G3 X130.913 Y131.399 I-.163 J2.167 E.04111
G1 X130.913 Y133.705 E.0765
G1 X130.621 Y133.799 E.01018
G1 X129.966 Y134.294 E.02725
G1 X129.769 Y134.594 E.0119
G1 X129.769 Y136.21 E.05357
M73 P58 R8
G3 X130.913 Y136.641 I-.163 J2.167 E.04111
G1 X130.913 Y138.947 E.0765
G1 X130.621 Y139.04 E.01018
G1 X129.966 Y139.536 E.02725
G2 X129.769 Y140.182 I.396 J.473 E.02373
G1 X129.542 Y140.182 E.00753
G3 X128.983 Y140.756 I-.957 J-.373 E.02731
G3 X127.52 Y140.182 I.021 J-2.206 E.05331
G1 X124.515 Y140.182 E.09968
G1 X124.515 Y140.386 E.00675
G1 X124.168 Y140.386 E.0115
G1 X124.168 Y141.603 E.04038
G1 X124.397 Y141.45 E.00912
G3 X125.323 Y141.642 I.155 J1.578 E.03186
G1 X129.351 Y141.642 E.13364
G3 X129.966 Y141.452 I.447 J.358 E.02265
G2 X130.913 Y141.642 I.772 J-1.392 E.03257
G1 X130.913 Y140.364 E.0424
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X130.913 Y141.642 E-.48575
G1 X130.563 Y141.642 E-.13301
G1 X130.209 Y141.529 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/75
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z6.4 I1.167 J-.344 P1  F42000
G1 X129.474 Y139.035 Z6.4
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6268
M204 S6000
G1 X129.474 Y139.834 E.02651
G1 X124.402 Y139.834 E.16826
G1 X124.402 Y129.166 E.35389
G1 X129.474 Y129.166 E.16826
G1 X129.474 Y138.975 E.32539
M204 S10000
G1 X129.067 Y139.035 F42000
G1 F6268
M204 S6000
G1 X129.067 Y139.427 E.01301
G1 X124.809 Y139.427 E.14125
G1 X124.809 Y129.573 E.32688
G1 X129.067 Y129.573 E.14125
G1 X129.067 Y138.975 E.31188
M204 S250
G1 X128.675 Y139.035 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6268
M204 S5000
G1 X125.201 Y139.035 E.10675
G1 X125.201 Y138.994 E.00126
G1 X125.201 Y130.006 E.27618
G1 X125.201 Y129.965 E.00126
G1 X128.675 Y129.965 E.10675
G1 X128.675 Y138.975 E.27685
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.676 Y139.01 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.955 Y131.411 Z6.6 F42000
G1 X125.52 Y126.834 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6268
M204 S6000
G1 X124.721 Y126.834 E.02651
G1 X124.721 Y116.166 E.35389
G1 X129.689 Y116.166 E.16481
G1 X129.689 Y126.834 E.35389
G1 X125.58 Y126.834 E.13631
M204 S10000
G1 X125.52 Y126.427 F42000
G1 F6268
M204 S6000
G1 X125.128 Y126.427 E.01301
G1 X125.128 Y116.573 E.32688
G1 X129.282 Y116.573 E.1378
G1 X129.282 Y126.427 E.32688
G1 X125.58 Y126.427 E.1228
M204 S250
G1 X125.52 Y126.035 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6268
M204 S5000
G1 X125.52 Y116.965 E.2787
G1 X128.89 Y116.965 E.10355
G1 X128.89 Y126.035 E.2787
G1 X125.58 Y126.035 E.10171
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.567 Y124.035 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.6 I-1.211 J-.117 P1  F42000
G1 X123.837 Y141.991 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6268
M204 S6000
G1 X123.837 Y129.932 E.4
G1 X123.837 Y129.532 E.01327
G1 F4517.137
G1 X123.837 Y129.132 E.01327
M106 S255
G1 F1560
G1 X123.837 Y127.967 E.03865
M106 S201.45
G1 F4517.137
G1 X123.837 Y127.567 E.01327
G1 F6268
G1 X123.837 Y127.167 E.01327
G1 X123.837 Y115.832 E.376
G1 X123.837 Y115.432 E.01327
G1 F4517.137
G1 X123.837 Y115.032 E.01327
M106 S255
G1 F1560
G1 X123.837 Y114.009 E.03394
M106 S201.45
G1 F2520
G1 X124.237 Y114.009 E.01327
G1 X130.788 Y114.009 E.21731
G1 F6268
G1 X131.288 Y114.009 E.01658
G1 X131.288 Y114.409 E.01327
G1 X131.288 Y141.99 E.91491
G1 X123.897 Y141.991 E.24517
M204 S10000
G1 X123.43 Y142.398 F42000
G1 F6268
M204 S6000
G1 X123.43 Y113.602 E.9552
G1 X131.695 Y113.602 E.27417
G1 X131.695 Y142.398 E.95519
G1 X123.49 Y142.398 E.27218
M204 S250
G1 X123.18 Y142.783 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6268
M204 S5000
G3 X123.038 Y142.59 I.06 J-.194 E.0079
G1 X123.038 Y113.407 E.8967
G3 X123.226 Y113.21 I.199 J.002 E.00921
G1 X131.94 Y113.217 E.26776
G3 X132.087 Y113.41 I-.047 J.188 E.00808
G1 X132.08 Y142.648 E.89839
G3 X131.897 Y142.79 I-.193 J-.06 E.00757
G1 X123.24 Y142.783 E.266
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.075 Y142.711 E-.06864
G1 X123.038 Y142.59 E-.04815
G1 X123.038 Y140.897 E-.64321
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


G1 X124.119 Y140.038 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.20117
G1 F6268
M204 S6000
G1 X124.119 Y128.962 E.14282
; WIPE_START
G1 F15000
G1 X124.119 Y130.962 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.6 I1.216 J.049 P1  F42000
G1 X124.279 Y127.038 Z6.6
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.52013
G1 F6268
M204 S6000
G1 X124.279 Y115.962 E.43067
M204 S10000
G1 X131.124 Y115.508 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.42983
M106 S255
G1 F3000
M204 S6000
G1 X124.17 Y115.508 E.21925
G1 X124.17 Y115.121 E.0122
G1 X130.954 Y115.121 E.2139
G1 X130.954 Y114.735 E.0122
G1 X124.17 Y114.735 E.2139
G1 X124.17 Y114.348 E.0122
G1 X131.124 Y114.348 E.21925
M106 S201.45
M204 S10000
G1 X130.081 Y126.728 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F6268
M204 S6000
G1 X130.896 Y126.728 E.02502
G1 X130.896 Y116.272 E.3213
G1 X130.081 Y116.272 E.02502
G1 X130.081 Y126.668 E.31946
M204 S10000
G1 X130.489 Y126.321 F42000
; LINE_WIDTH: 0.48004
G1 F6268
M204 S6000
G1 X130.489 Y116.739 E.34133
M204 S10000
G1 X131.124 Y127.12 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.4606
M106 S255
G1 F3000
M204 S6000
G1 X130.023 Y127.12 E.03749
G1 X130.023 Y127.167 E.00161
G1 X124.872 Y127.167 E.17529
G1 X124.872 Y127.371 E.00692
G1 X124.17 Y127.371 E.0239
G1 X124.17 Y127.538 E.00568
G1 X130.954 Y127.538 E.23091
G1 X130.954 Y127.955 E.01422
G1 X124.17 Y127.955 E.23091
G1 X124.17 Y128.373 E.01422
G1 X130.954 Y128.373 E.23091
G1 X130.954 Y128.791 E.01422
G1 X129.729 Y128.791 E.04172
G1 X129.729 Y128.833 E.00142
G1 X129.808 Y128.833 E.00269
G1 X129.808 Y129.209 E.01279
G1 X130.954 Y129.209 E.03903
G1 X130.954 Y129.626 E.01422
G1 X129.638 Y129.626 E.0448
M106 S201.45
M204 S10000
G1 X129.823 Y132.843 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6268
M204 S6000
G1 X129.823 Y131.215 E.05401
G1 X129.966 Y131.17 E.00497
G1 X130.621 Y131.238 E.02185
G1 X130.939 Y131.41 E.01202
G1 X130.939 Y133.825 E.08011
G1 X130.621 Y133.858 E.01063
G1 X129.966 Y134.213 E.02471
G1 X129.823 Y134.371 E.00707
G1 X129.823 Y136.456 E.06915
G1 X129.966 Y136.411 E.00497
G1 X130.621 Y136.479 E.02185
G1 X130.939 Y136.652 E.01202
G1 X130.939 Y139.067 E.08011
G1 X130.621 Y139.1 E.01063
G1 X129.966 Y139.454 E.02471
G1 X129.823 Y139.613 E.00707
G1 X129.823 Y140.182 E.0189
G1 X129.308 Y140.182 E.01706
G3 X128.655 Y140.554 I-.785 J-.619 E.02556
G3 X127.439 Y140.182 I-.16 J-1.654 E.0433
G1 X125.811 Y140.182 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X127.439 Y140.182 E-.61876
G1 X127.766 Y140.359 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/75
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z6.6 I.731 J.973 P1  F42000
G1 X129.528 Y139.035 Z6.6
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5402
M204 S6000
G1 X129.528 Y139.834 E.02651
G1 X124.456 Y139.834 E.16826
G1 X124.456 Y129.166 E.35389
G1 X129.528 Y129.166 E.16826
M73 P59 R8
G1 X129.528 Y138.975 E.32539
M204 S10000
G1 X129.121 Y139.035 F42000
G1 F5402
M204 S6000
G1 X129.121 Y139.427 E.01301
G1 X124.863 Y139.427 E.14125
G1 X124.863 Y129.573 E.32688
G1 X129.121 Y129.573 E.14125
G1 X129.121 Y138.975 E.31188
M204 S250
G1 X128.729 Y139.035 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5402
M204 S5000
G1 X125.255 Y139.035 E.10675
G1 X125.255 Y138.994 E.00126
G1 X125.255 Y130.006 E.27618
G1 X125.255 Y129.965 E.00126
G1 X128.729 Y129.965 E.10675
G1 X128.729 Y138.975 E.27685
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.729 Y139.01 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.975 Y131.414 Z6.8 F42000
G1 X125.52 Y126.834 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5402
M204 S6000
G1 X124.721 Y126.834 E.02651
G1 X124.721 Y116.166 E.35389
G1 X129.689 Y116.166 E.16481
G1 X129.689 Y126.834 E.35389
G1 X125.58 Y126.834 E.13631
M204 S10000
G1 X125.52 Y126.427 F42000
G1 F5402
M204 S6000
G1 X125.128 Y126.427 E.01301
G1 X125.128 Y116.573 E.32688
G1 X129.282 Y116.573 E.1378
G1 X129.282 Y126.427 E.32688
G1 X125.58 Y126.427 E.1228
M204 S250
G1 X125.52 Y126.035 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5402
M204 S5000
G1 X125.52 Y116.965 E.2787
G1 X128.89 Y116.965 E.10355
G1 X128.89 Y126.035 E.2787
G1 X125.58 Y126.035 E.10171
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.567 Y124.035 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.8 I-1.211 J-.116 P1  F42000
G1 X123.854 Y141.991 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5402
M204 S6000
G1 X123.854 Y114.009 E.9282
G1 X131.314 Y114.009 E.24745
G1 X131.314 Y141.99 E.92818
G1 X123.914 Y141.991 E.24546
M204 S10000
G1 X123.447 Y142.398 F42000
G1 F5402
M204 S6000
G1 X123.447 Y113.602 E.9552
G1 X131.721 Y113.602 E.27446
G1 X131.721 Y142.398 E.95519
G1 X123.507 Y142.398 E.27247
M204 S250
G1 X123.199 Y142.783 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5402
M204 S5000
G3 X123.055 Y142.59 I.06 J-.195 E.00792
G1 X123.055 Y113.408 E.8967
G3 X123.245 Y113.21 I.2 J.003 E.00926
G1 X131.966 Y113.217 E.26798
G3 X132.113 Y113.41 I-.047 J.188 E.00807
G1 X132.106 Y142.648 E.89839
G3 X131.923 Y142.79 I-.19 J-.057 E.00759
G1 X123.259 Y142.783 E.26623
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.092 Y142.711 E-.06909
G1 X123.055 Y142.59 E-.04804
G1 X123.055 Y140.898 E-.64288
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


G1 X124.155 Y140.038 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.23724
G1 F5402
M204 S6000
G1 X124.155 Y128.962 E.17537
M204 S10000
G1 X124.288 Y127.038 F42000
; LINE_WIDTH: 0.50261
G1 F5402
M204 S6000
G1 X124.288 Y115.962 E.41486
M204 S10000
G1 X130.922 Y115.116 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F5402
M204 S6000
G1 X130.922 Y114.401 E.02195
G1 X124.246 Y114.401 E.20512
G1 X124.246 Y115.57 E.03592
G1 X124.765 Y115.572 E.01593
G1 X124.864 Y115.614 E.00331
G1 X124.946 Y115.774 E.00552
G1 X129.893 Y115.774 E.152
G1 X129.959 Y115.786 E.00205
G1 X130.081 Y115.962 E.00661
G1 X130.081 Y127.038 E.34031
G1 X129.932 Y127.222 E.00729
G1 X124.931 Y127.226 E.15366
G1 X124.859 Y127.39 E.0055
G1 X124.743 Y127.43 E.00377
G1 X124.246 Y127.43 E.01525
G1 X124.246 Y128.57 E.03505
G1 X124.569 Y128.594 E.00993
G1 X124.681 Y128.774 E.0065
G1 X129.732 Y128.774 E.1552
G1 X129.801 Y128.787 E.00217
G1 X129.92 Y128.962 E.00652
G1 X129.92 Y130.005 E.03204
G3 X130.922 Y129.995 I.751 J24.238 E.03079
G1 X130.922 Y115.176 E.45533
M204 S10000
G1 X130.47 Y115.116 F42000
; LINE_WIDTH: 0.542136
G1 F5402
M204 S6000
G1 X130.47 Y114.853 E.0107
G1 X129.893 Y114.839 E.0235
G1 X124.684 Y114.839 E.21191
G1 X124.684 Y115.133 E.01197
G1 X124.816 Y115.137 E.00538
G1 X125.144 Y115.279 E.01453
G1 X125.171 Y115.336 E.0026
G1 X129.893 Y115.336 E.19209
G1 X130.116 Y115.362 E.00913
; LINE_WIDTH: 0.553233
G1 X130.309 Y115.662 E.01483
; LINE_WIDTH: 0.532745
G1 X130.502 Y115.962 E.01424
G1 X130.473 Y115.176 E.03141
M204 S10000
G1 X130.497 Y127.144 F42000
; LINE_WIDTH: 0.506424
G1 F5402
M204 S6000
G1 X130.502 Y116.022 E.42005
M204 S10000
G1 X130.497 Y127.144 F42000
; LINE_WIDTH: 0.491698
G1 F5402
M204 S6000
G1 X130.254 Y127.367 E.01209
; LINE_WIDTH: 0.420671
G1 X130.01 Y127.591 E.01018
G1 X125.131 Y127.603 E.15018
G1 X125.09 Y127.687 E.00287
G1 X124.833 Y127.799 E.00864
G1 X124.623 Y127.807 E.00646
G1 X124.623 Y128.231 E.01307
G1 X124.838 Y128.323 E.00718
G1 X124.872 Y128.397 E.00251
G1 X129.732 Y128.397 E.14957
G1 X129.939 Y128.436 E.00651
; LINE_WIDTH: 0.403818
G1 X130.102 Y128.699 E.0091
; LINE_WIDTH: 0.357806
G1 X130.265 Y128.962 E.00794
G1 X130.265 Y129.65 E.01764
G1 X130.577 Y129.65 E.00802
G1 X130.577 Y128.962 E.01764
; LINE_WIDTH: 0.371473
G1 X130.561 Y128.493 E.01256
; LINE_WIDTH: 0.403818
G1 X130.545 Y128.024 E.0138
; LINE_WIDTH: 0.443893
G1 X130.523 Y127.614 E.01343
; LINE_WIDTH: 0.491698
G1 X130.5 Y127.204 E.01503
M204 S10000
G1 X125.334 Y128 F42000
; LINE_WIDTH: 0.45932
G1 F5402
M204 S6000
G1 X129.732 Y128 E.1492
; LINE_WIDTH: 0.482415
G1 X129.887 Y128.01 E.00557
; LINE_WIDTH: 0.528605
G1 X130.042 Y128.02 E.00616
M204 S10000
G1 X130.558 Y130.387 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5402
M204 S6000
G1 X130.004 Y130.387 E.01837
G1 X129.876 Y130.484 E.00533
G1 X129.876 Y131.385 E.02988
G1 X129.966 Y131.323 E.0036
G1 X130.621 Y131.269 E.02181
G1 X130.966 Y131.39 E.01213
G1 X130.966 Y133.918 E.08385
G1 X130.621 Y133.89 E.01149
G1 X129.876 Y134.2 E.02675
G1 X129.876 Y136.626 E.08048
G1 X129.966 Y136.564 E.0036
G1 X130.621 Y136.51 E.02181
G1 X130.966 Y136.631 E.01213
G1 X130.966 Y139.159 E.08385
G1 X130.621 Y139.131 E.01149
G1 X129.876 Y139.441 E.02675
G1 X129.876 Y140.182 E.0246
G1 X128.971 Y140.182 E.03004
G1 X128.655 Y140.401 E.01274
G3 X127.298 Y140.182 I-.454 J-1.506 E.04721
G1 X125.669 Y140.182 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X127.298 Y140.182 E-.61876
G1 X127.644 Y140.317 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/75
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z6.8 I.671 J1.015 P1  F42000
G1 X129.582 Y139.035 Z6.8
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5893
M204 S6000
G1 X129.582 Y139.834 E.02651
G1 X124.509 Y139.834 E.16826
G1 X124.509 Y129.166 E.35389
G1 X129.582 Y129.166 E.16826
G1 X129.582 Y138.975 E.32539
M204 S10000
G1 X129.175 Y139.035 F42000
G1 F5893
M204 S6000
G1 X129.175 Y139.427 E.01301
G1 X124.916 Y139.427 E.14125
G1 X124.916 Y129.573 E.32688
G1 X129.175 Y129.573 E.14125
G1 X129.175 Y138.975 E.31188
M204 S250
G1 X128.783 Y139.035 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5893
M204 S5000
G1 X125.308 Y139.035 E.10675
G1 X125.308 Y138.994 E.00126
G1 X125.308 Y130.006 E.27618
G1 X125.308 Y129.965 E.00126
G1 X128.783 Y129.965 E.10675
G1 X128.783 Y138.975 E.27685
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.783 Y139.01 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.996 Y131.418 Z7 F42000
G1 X125.52 Y126.834 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5893
M204 S6000
M73 P60 R8
G1 X124.721 Y126.834 E.02651
G1 X124.721 Y116.166 E.35389
G1 X129.689 Y116.166 E.16481
G1 X129.689 Y126.834 E.35389
G1 X125.58 Y126.834 E.13631
M204 S10000
G1 X125.52 Y126.427 F42000
G1 F5893
M204 S6000
G1 X125.128 Y126.427 E.01301
G1 X125.128 Y116.573 E.32688
G1 X129.282 Y116.573 E.1378
G1 X129.282 Y126.427 E.32688
G1 X125.58 Y126.427 E.1228
M204 S250
G1 X125.52 Y126.035 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5893
M204 S5000
G1 X125.52 Y116.965 E.2787
G1 X128.89 Y116.965 E.10355
G1 X128.89 Y126.035 E.2787
G1 X125.58 Y126.035 E.10171
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.567 Y124.035 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7 I-1.212 J-.114 P1  F42000
G1 X123.881 Y141.991 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5893
M204 S6000
G1 X123.881 Y114.009 E.9282
G1 X131.34 Y114.009 E.24745
G1 X131.34 Y141.99 E.92819
G1 X123.941 Y141.991 E.24546
M204 S10000
G1 X123.474 Y142.398 F42000
G1 F5893
M204 S6000
G1 X123.474 Y113.602 E.9552
G1 X131.747 Y113.602 E.27446
G1 X131.747 Y142.398 E.95519
G1 X123.534 Y142.398 E.27247
M204 S250
G1 X123.225 Y142.783 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5893
M204 S5000
G3 X123.082 Y142.59 I.06 J-.195 E.00791
G1 X123.082 Y113.408 E.8967
G3 X123.271 Y113.21 I.2 J.003 E.00926
G1 X131.993 Y113.217 E.26799
G3 X132.14 Y113.41 I-.047 J.188 E.00806
G1 X132.133 Y142.648 E.89839
G3 X131.95 Y142.79 I-.19 J-.057 E.00759
G1 X123.285 Y142.783 E.26623
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.119 Y142.711 E-.06908
G1 X123.082 Y142.59 E-.04792
G1 X123.082 Y140.898 E-.64301
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


G1 X124.195 Y140.038 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.2645
G1 F5893
M204 S6000
G1 X124.195 Y128.962 E.19997
M204 S10000
G1 X124.301 Y127.038 F42000
; LINE_WIDTH: 0.47628
G1 F5893
M204 S6000
G1 X124.301 Y115.962 E.3911
M204 S10000
G1 X130.948 Y115.12 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F5893
M204 S6000
G1 X130.948 Y114.401 E.02208
G1 X124.273 Y114.401 E.20512
G1 X124.273 Y115.57 E.03592
G1 X124.772 Y115.573 E.01533
G1 X124.864 Y115.614 E.0031
G1 X124.946 Y115.774 E.00552
G1 X129.893 Y115.774 E.152
G1 X129.963 Y115.787 E.00219
G1 X130.081 Y115.962 E.0065
G1 X130.081 Y127.038 E.34031
G1 X129.937 Y127.221 E.00716
G1 X124.931 Y127.226 E.15382
G1 X124.859 Y127.39 E.0055
G1 X124.743 Y127.43 E.00377
G1 X124.273 Y127.43 E.01444
G1 X124.273 Y128.57 E.03505
G1 X124.615 Y128.59 E.01054
G1 X124.734 Y128.774 E.00672
G1 X129.785 Y128.774 E.1552
G1 X129.85 Y128.785 E.00201
G1 X129.974 Y128.962 E.00664
G1 X129.974 Y140.038 E.34031
G1 X129.872 Y140.205 E.00603
G1 X129.785 Y140.226 E.00274
G1 X124.719 Y140.226 E.15565
G1 X124.616 Y140.409 E.00645
G1 X124.273 Y140.43 E.01058
G1 X124.273 Y141.599 E.03592
G1 X130.948 Y141.598 E.20512
G1 X130.948 Y115.18 E.81174
M204 S10000
G1 X130.495 Y115.12 F42000
; LINE_WIDTH: 0.543604
G1 F5893
M204 S6000
G1 X130.495 Y114.855 E.01081
G1 X129.893 Y114.839 E.02456
G1 X124.71 Y114.839 E.21146
G1 X124.71 Y115.133 E.012
G1 X124.839 Y115.14 E.00525
G1 X125.144 Y115.279 E.01368
G1 X125.171 Y115.336 E.00261
G1 X129.893 Y115.336 E.19265
G1 X130.131 Y115.366 E.0098
G1 X130.515 Y115.962 E.02892
G1 X130.496 Y115.18 E.03193
M204 S10000
G1 X130.51 Y127.146 F42000
; LINE_WIDTH: 0.532746
G1 F5893
M204 S6000
G1 X130.515 Y116.022 E.44399
M204 S10000
G1 X130.51 Y127.146 F42000
; LINE_WIDTH: 0.521765
G1 F5893
M204 S6000
G1 X130.349 Y127.293 E.00852
; LINE_WIDTH: 0.481055
G1 X130.187 Y127.44 E.0078
; LINE_WIDTH: 0.420377
G1 X130.026 Y127.587 E.00672
G1 X129.785 Y127.603 E.00742
G1 X125.131 Y127.603 E.14314
G1 X125.09 Y127.687 E.00287
G1 X124.848 Y127.797 E.00819
G1 X124.65 Y127.807 E.0061
G1 X124.65 Y128.221 E.01276
G1 X124.889 Y128.321 E.00799
G1 X124.925 Y128.397 E.00256
G1 X129.785 Y128.397 E.14949
G1 X129.979 Y128.431 E.00605
; LINE_WIDTH: 0.442033
G1 X130.075 Y128.537 E.00467
; LINE_WIDTH: 0.486119
G1 X130.172 Y128.643 E.00518
; LINE_WIDTH: 0.530205
G1 X130.268 Y128.75 E.0057
; LINE_WIDTH: 0.574291
G1 X130.365 Y128.856 E.00621
; LINE_WIDTH: 0.618377
G1 X130.461 Y128.962 E.00673
G1 X130.483 Y128.773 E.00893
; LINE_WIDTH: 0.574291
G1 X130.505 Y128.584 E.00825
; LINE_WIDTH: 0.530205
G1 X130.527 Y128.395 E.00756
; LINE_WIDTH: 0.486119
G1 X130.549 Y128.205 E.00688
; LINE_WIDTH: 0.442033
G1 X130.571 Y128.016 E.0062
; LINE_WIDTH: 0.440345
G1 X130.552 Y127.746 E.00877
; LINE_WIDTH: 0.481055
G1 X130.533 Y127.476 E.00967
; LINE_WIDTH: 0.521765
G1 X130.514 Y127.206 E.01057
M204 S10000
G1 X125.334 Y128 F42000
; LINE_WIDTH: 0.45932
G1 F5893
M204 S6000
G1 X129.785 Y128 E.15102
; LINE_WIDTH: 0.481605
G1 X129.928 Y128.007 E.0051
; LINE_WIDTH: 0.526175
G1 X130.07 Y128.013 E.00561
M204 S10000
G1 X130.461 Y128.962 F42000
; LINE_WIDTH: 0.64042
G1 F5893
M204 S6000
G1 X130.461 Y130.183 E.05944
; Slow Down Start
; LINE_WIDTH: 0.64551
G1 F3000;_EXTRUDE_SET_SPEED
G1 X130.458 Y140.095 E.48672
; Slow Down End
M204 S10000
G1 X130.456 Y140.155 F42000
; LINE_WIDTH: 0.636048
G1 F5893
M204 S6000
G1 X130.27 Y140.386 E.01431
; LINE_WIDTH: 0.606823
G1 X130.084 Y140.617 E.01361
; LINE_WIDTH: 0.57929
G1 X129.935 Y140.64 E.00662
; LINE_WIDTH: 0.540773
G1 X129.785 Y140.664 E.00614
G1 X124.959 Y140.664 E.19578
G1 X124.815 Y140.799 E.00803
G1 X124.71 Y140.824 E.00437
G1 X124.71 Y141.161 E.01368
G1 X129.785 Y141.161 E.20589
; LINE_WIDTH: 0.55345
G1 X130.135 Y141.148 E.01457
; LINE_WIDTH: 0.57929
G1 X130.485 Y141.135 E.01531
; LINE_WIDTH: 0.606823
G1 X130.471 Y140.675 E.02115
; LINE_WIDTH: 0.636048
G1 X130.458 Y140.215 E.02224
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6069.521
G1 X130.471 Y140.675 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/75
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z7 I1.084 J-.553 P1  F42000
G1 X129.635 Y139.035 Z7
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5882
M204 S6000
G1 X129.635 Y139.834 E.02651
G1 X124.563 Y139.834 E.16826
G1 X124.563 Y129.166 E.35389
G1 X129.635 Y129.166 E.16826
G1 X129.635 Y138.975 E.32539
M204 S10000
G1 X129.228 Y139.035 F42000
G1 F5882
M204 S6000
G1 X129.228 Y139.427 E.01301
G1 X124.97 Y139.427 E.14125
G1 X124.97 Y129.573 E.32688
G1 X129.228 Y129.573 E.14125
G1 X129.228 Y138.975 E.31188
M204 S250
G1 X128.836 Y139.035 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5882
M204 S5000
G1 X125.362 Y139.035 E.10675
G1 X125.362 Y138.994 E.00126
G1 X125.362 Y130.006 E.27618
G1 X125.362 Y129.965 E.00126
G1 X128.836 Y129.965 E.10675
G1 X128.836 Y138.975 E.27685
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.836 Y139.01 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.016 Y131.421 Z7.2 F42000
G1 X125.52 Y126.834 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5882
M204 S6000
G1 X124.721 Y126.834 E.02651
G1 X124.721 Y116.166 E.35389
G1 X129.689 Y116.166 E.16481
G1 X129.689 Y126.834 E.35389
G1 X125.58 Y126.834 E.13631
M204 S10000
G1 X125.52 Y126.427 F42000
G1 F5882
M204 S6000
G1 X125.128 Y126.427 E.01301
G1 X125.128 Y116.573 E.32688
G1 X129.282 Y116.573 E.1378
G1 X129.282 Y126.427 E.32688
G1 X125.58 Y126.427 E.1228
M204 S250
G1 X125.52 Y126.035 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5882
M204 S5000
G1 X125.52 Y116.965 E.2787
G1 X128.89 Y116.965 E.10355
G1 X128.89 Y126.035 E.2787
G1 X125.58 Y126.035 E.10171
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.567 Y124.035 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.864 Y131.635 Z7.2 F42000
G1 X123.907 Y141.991 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5882
M204 S6000
G1 X123.907 Y114.009 E.9282
G1 X131.367 Y114.009 E.24745
G1 X131.367 Y141.99 E.92819
G1 X123.967 Y141.991 E.24546
M204 S10000
G1 X123.5 Y142.398 F42000
G1 F5882
M204 S6000
G1 X123.5 Y113.602 E.9552
G1 X131.774 Y113.602 E.27446
G1 X131.774 Y142.398 E.95519
G1 X123.56 Y142.398 E.27247
M204 S250
G1 X123.309 Y142.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5882
M204 S5000
G3 X123.108 Y142.59 I0 J-.2 E.00968
G1 X123.108 Y113.407 E.8967
G3 X123.298 Y113.21 I.2 J.003 E.00926
G1 X132.019 Y113.217 E.26799
G3 X132.166 Y113.41 I-.047 J.188 E.00806
G1 X132.159 Y142.648 E.89839
G3 X131.976 Y142.79 I-.193 J-.06 E.00757
G1 X123.369 Y142.79 E.26448
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.22 Y142.772 E-.0569
G1 X123.166 Y142.735 E-.02466
G1 X123.119 Y142.66 E-.03377
G1 X123.108 Y142.59 E-.02708
G1 X123.108 Y140.965 E-.61759
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


G1 X124.235 Y140.038 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.29176
G1 F5882
M204 S6000
G1 X124.235 Y128.962 E.22457
M204 S10000
G1 X124.314 Y127.038 F42000
; LINE_WIDTH: 0.44995
G1 F5882
M204 S6000
G1 X124.314 Y115.962 E.36734
; WIPE_START
G1 F8844.556
G1 X124.314 Y117.962 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.362 Y125.315 Z7.2 F42000
G1 X130.496 Y140.153 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.613232
G1 F5882
M204 S6000
G1 X130.501 Y129.022 E.51728
M204 S10000
G1 X130.496 Y140.153 F42000
; LINE_WIDTH: 0.6051
G1 F5882
M204 S6000
M73 P61 R8
G1 X130.123 Y140.621 E.02743
; LINE_WIDTH: 0.542527
G1 X129.839 Y140.664 E.01169
M73 P61 R7
G1 X125.013 Y140.664 E.19647
G1 X124.986 Y140.721 E.0026
G1 X124.736 Y140.834 E.01114
G1 X124.736 Y141.161 E.01332
G1 X129.839 Y141.161 E.20773
G1 X130.514 Y141.138 E.02751
; LINE_WIDTH: 0.6051
G1 X130.497 Y140.213 E.04238
; WIPE_START
G1 F6403.643
G1 X130.514 Y141.138 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.715 Y134.037 Z7.2 F42000
G1 X125.334 Y128 Z7.2
G1 Z6.8
G1 E.8 F1800
; LINE_WIDTH: 0.45932
G1 F5882
M204 S6000
G1 X129.839 Y128 E.15284
; LINE_WIDTH: 0.4811
G1 X129.968 Y128.003 E.00462
; LINE_WIDTH: 0.52466
G1 X130.097 Y128.007 E.00508
M204 S10000
G1 X129.839 Y128.774 F42000
; LINE_WIDTH: 0.41999
G1 F5882
M204 S6000
G1 X129.898 Y128.784 E.00186
G1 X130.027 Y128.962 E.00677
G1 X130.027 Y140.038 E.34031
G1 X129.921 Y140.207 E.00614
G1 X129.839 Y140.226 E.0026
G1 X124.773 Y140.226 E.15565
G1 X124.705 Y140.386 E.00533
G1 X124.584 Y140.43 E.00395
G1 X124.299 Y140.43 E.00877
G1 X124.299 Y141.599 E.03592
G1 X130.975 Y141.598 E.20512
G1 X130.975 Y114.401 E.83567
G1 X124.299 Y114.401 E.20512
G1 X124.299 Y115.57 E.03592
G1 X124.778 Y115.574 E.01473
G1 X124.864 Y115.614 E.0029
G1 X124.946 Y115.774 E.00552
G1 X129.893 Y115.774 E.152
G1 X129.967 Y115.789 E.00233
G1 X130.081 Y115.962 E.00638
G1 X130.081 Y127.038 E.34031
G1 X129.942 Y127.22 E.00703
G1 X129.839 Y127.226 E.00319
G1 X124.931 Y127.226 E.15079
G1 X124.829 Y127.409 E.00644
G1 X124.299 Y127.43 E.01629
G1 X124.299 Y128.57 E.03505
G1 X124.662 Y128.587 E.01116
G1 X124.773 Y128.759 E.00629
G1 X125.334 Y128.774 E.01726
G1 X129.779 Y128.774 E.13656
M204 S10000
G1 X129.839 Y128.397 F42000
G1 F5882
M204 S6000
G1 X130.018 Y128.426 E.00557
; LINE_WIDTH: 0.444139
G1 X130.139 Y128.56 E.0059
; LINE_WIDTH: 0.492437
G1 X130.259 Y128.694 E.00661
; LINE_WIDTH: 0.540734
G1 X130.38 Y128.828 E.00732
; LINE_WIDTH: 0.589032
G1 X130.501 Y128.962 E.00803
G1 X130.525 Y128.724 E.01067
; LINE_WIDTH: 0.540734
G1 X130.549 Y128.485 E.00973
; LINE_WIDTH: 0.492437
G1 X130.573 Y128.247 E.00878
; LINE_WIDTH: 0.444139
G1 X130.598 Y128.008 E.00784
; LINE_WIDTH: 0.444769
G1 X130.573 Y127.722 E.00942
; LINE_WIDTH: 0.494325
G1 X130.548 Y127.435 E.01058
; LINE_WIDTH: 0.543882
G1 X130.523 Y127.148 E.01175
G1 X130.363 Y127.293 E.00883
; LINE_WIDTH: 0.494325
G1 X130.202 Y127.438 E.00796
; LINE_WIDTH: 0.420467
G1 X130.042 Y127.583 E.00666
G1 X129.839 Y127.603 E.00627
G1 X125.131 Y127.603 E.14482
G1 X125.09 Y127.687 E.00287
G1 X124.863 Y127.794 E.00772
G1 X124.676 Y127.807 E.00577
G1 X124.676 Y128.213 E.0125
G1 X124.941 Y128.32 E.00878
G1 X124.977 Y128.397 E.00263
G1 X129.779 Y128.397 E.14771
M204 S10000
G1 X130.523 Y127.148 F42000
; LINE_WIDTH: 0.559088
G1 F5882
M204 S6000
G1 X130.528 Y116.022 E.46797
M204 S10000
G1 X130.528 Y115.962 F42000
; LINE_WIDTH: 0.545609
G1 F5882
M204 S6000
G3 X130.519 Y114.857 I50.547 J-.972 E.04527
G1 X129.893 Y114.839 E.02565
G1 X124.736 Y114.839 E.21122
G1 X124.743 Y115.133 E.01205
G1 X124.861 Y115.144 E.00488
G1 X125.144 Y115.279 E.01281
G1 X125.171 Y115.336 E.00262
G1 X129.893 Y115.336 E.19342
G1 X130.146 Y115.37 E.01048
G1 X130.496 Y115.912 E.0264
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7161.494
G1 X130.146 Y115.37 E-.24494
G1 X129.893 Y115.336 E-.0972
G1 X128.793 Y115.336 E-.41786
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/75
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z7.2 I-1.216 J.046 P1  F42000
G1 X129.689 Y139.035 Z7.2
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5447
M204 S6000
G1 X129.689 Y139.834 E.02651
G1 X124.616 Y139.834 E.16826
G1 X124.616 Y129.166 E.35389
G1 X129.689 Y129.166 E.16826
G1 X129.689 Y138.975 E.32539
M204 S10000
G1 X129.282 Y139.035 F42000
G1 F5447
M204 S6000
G1 X129.282 Y139.427 E.01301
G1 X125.024 Y139.427 E.14125
G1 X125.024 Y129.573 E.32688
G1 X129.282 Y129.573 E.14125
G1 X129.282 Y138.975 E.31188
M204 S250
G1 X128.89 Y139.035 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5447
M204 S5000
G1 X125.416 Y139.035 E.10675
G1 X125.416 Y138.994 E.00126
G1 X125.416 Y130.006 E.27618
G1 X125.416 Y129.965 E.00126
G1 X128.89 Y129.965 E.10675
G1 X128.89 Y138.975 E.27685
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.89 Y139.01 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.037 Y131.425 Z7.4 F42000
G1 X125.52 Y126.834 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5447
M204 S6000
G1 X124.721 Y126.834 E.02651
G1 X124.721 Y116.166 E.35389
G1 X129.689 Y116.166 E.16481
G1 X129.689 Y126.834 E.35389
G1 X125.58 Y126.834 E.13631
M204 S10000
G1 X125.52 Y126.427 F42000
G1 F5447
M204 S6000
G1 X125.128 Y126.427 E.01301
G1 X125.128 Y116.573 E.32688
G1 X129.282 Y116.573 E.1378
G1 X129.282 Y126.427 E.32688
G1 X125.58 Y126.427 E.1228
M204 S250
G1 X125.52 Y126.035 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5447
M204 S5000
G1 X125.52 Y116.965 E.2787
G1 X128.89 Y116.965 E.10355
G1 X128.89 Y126.035 E.2787
G1 X125.58 Y126.035 E.10171
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.567 Y124.035 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.875 Y131.636 Z7.4 F42000
G1 X123.933 Y141.991 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5447
M204 S6000
G1 X123.933 Y114.009 E.9282
G1 X131.393 Y114.009 E.24745
G1 X131.393 Y141.99 E.92819
G1 X123.993 Y141.991 E.24546
M204 S10000
G1 X123.526 Y142.398 F42000
G1 F5447
M204 S6000
G1 X123.526 Y113.602 E.9552
G1 X131.8 Y113.602 E.27446
G1 X131.8 Y142.398 E.95519
G1 X123.586 Y142.398 E.27247
M204 S250
G1 X123.335 Y142.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5447
M204 S5000
G3 X123.134 Y142.59 I0 J-.2 E.00968
G1 X123.134 Y113.408 E.89669
G3 X123.324 Y113.21 I.2 J.003 E.00926
G1 X132.046 Y113.217 E.268
G3 X132.192 Y113.41 I-.047 J.188 E.00805
G1 X132.185 Y142.648 E.89839
G3 X132.003 Y142.79 I-.19 J-.056 E.0076
G1 X123.395 Y142.79 E.26448
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.246 Y142.772 E-.05691
G1 X123.193 Y142.735 E-.02466
G1 X123.145 Y142.661 E-.03352
G1 X123.134 Y142.59 E-.02731
G1 X123.134 Y140.965 E-.6176
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


G1 X124.275 Y140.038 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.31902
G1 F5447
M204 S6000
G1 X124.275 Y128.962 E.24918
; WIPE_START
G1 F13038.754
G1 X124.275 Y130.962 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.045 Y129.507 Z7.4 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5447
M204 S6000
G1 X131.045 Y131.135 E.05401
G1 X130.621 Y131.213 E.0143
G1 X130.037 Y131.587 E.023
G1 X130.037 Y133.715 E.0706
G3 X131.045 Y134.071 I-.137 J1.993 E.03588
G1 X131.045 Y136.377 E.07649
G1 X130.621 Y136.454 E.0143
G1 X130.037 Y136.828 E.023
G1 X130.037 Y138.956 E.0706
G3 X131.045 Y139.312 I-.137 J1.993 E.03588
G1 X131.045 Y137.684 E.05401
M204 S10000
G1 X130.065 Y140.091 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F5447
M204 S6000
G1 X129.971 Y140.209 E.00466
G1 X129.892 Y140.226 E.00247
G1 X124.827 Y140.226 E.15565
G1 X124.759 Y140.386 E.00533
G1 X124.638 Y140.43 E.00395
G1 X124.325 Y140.43 E.00961
G1 X124.325 Y141.599 E.03592
G1 X131.001 Y141.598 E.20512
G1 X131.001 Y140.105 E.04588
G1 X130.123 Y140.105 E.02697
M204 S10000
G1 X130.254 Y140.563 F42000
; LINE_WIDTH: 0.545165
G1 F5447
M204 S6000
G1 X130.161 Y140.626 E.00458
G1 X129.892 Y140.664 E.01111
G1 X125.066 Y140.664 E.19751
G1 X125.039 Y140.721 E.00262
G1 X124.763 Y140.843 E.01236
G1 X124.763 Y141.161 E.01304
G1 X129.892 Y141.161 E.20994
G1 X130.543 Y141.14 E.02664
G1 X130.543 Y140.563 E.02362
G1 X130.314 Y140.563 E.00936
; WIPE_START
G1 F7167.823
G1 X130.543 Y140.563 E-.08688
G1 X130.543 Y141.14 E-.21927
G1 X129.892 Y141.161 E-.24731
G1 X129.349 Y141.161 E-.20655
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.073 Y133.534 Z7.4 F42000
G1 X128.431 Y115.818 Z7.4
G1 Z7
M73 P62 R7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5447
M204 S6000
G1 X126.802 Y115.818 E.05401
G2 X126.035 Y115.356 I-.919 J.661 E.03055
G2 X124.887 Y115.805 I.003 J1.701 E.04181
G1 X124.887 Y115.614 E.00632
G1 X124.282 Y115.614 E.0201
G1 X124.282 Y115.152 E.01534
G1 X124.651 Y115.152 E.01226
M204 S10000
G1 X124.327 Y115.962 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.42362
G1 F5447
M204 S6000
G1 X124.327 Y127.038 E.34358
M204 S10000
G1 X125.334 Y128 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.45932
G1 F5447
M204 S6000
G1 X129.893 Y128 E.15468
; LINE_WIDTH: 0.480895
G1 X130.008 Y128 E.00412
; LINE_WIDTH: 0.524045
G1 X130.124 Y128 E.00453
M204 S10000
G1 X129.892 Y127.603 F42000
; LINE_WIDTH: 0.41999
G1 F5447
M204 S6000
G1 X125.131 Y127.603 E.14629
G1 X125.032 Y127.727 E.00486
G1 X124.702 Y127.807 E.01043
G1 X124.702 Y128.206 E.01226
G3 X124.992 Y128.318 I-.014 J.468 E.00971
G1 X125.03 Y128.397 E.0027
G1 X129.893 Y128.397 E.14942
G1 X130.182 Y128.476 E.00922
G1 X130.225 Y128.518 E.00183
G1 X130.624 Y128.518 E.01227
G1 X130.624 Y128 E.0159
; LINE_WIDTH: 0.441892
G1 X130.602 Y127.788 E.00694
; LINE_WIDTH: 0.485694
G1 X130.58 Y127.575 E.0077
; LINE_WIDTH: 0.529497
G1 X130.558 Y127.363 E.00847
; LINE_WIDTH: 0.573299
G1 X130.536 Y127.151 E.00923
G1 X130.416 Y127.258 E.00695
; LINE_WIDTH: 0.529497
G1 X130.296 Y127.365 E.00638
; LINE_WIDTH: 0.485694
G1 X130.177 Y127.472 E.0058
; LINE_WIDTH: 0.433186
G1 X130.057 Y127.579 E.00511
G1 X129.952 Y127.595 E.00337
M204 S10000
G1 X129.892 Y127.226 F42000
; LINE_WIDTH: 0.41999
G1 F5447
M204 S6000
G1 X124.931 Y127.226 E.15244
G1 X124.839 Y127.403 E.00612
G1 X124.325 Y127.43 E.01581
G1 X124.325 Y128.57 E.03505
G1 X124.708 Y128.584 E.01178
G1 X124.827 Y128.759 E.00649
G1 X125.334 Y128.774 E.01561
G1 X129.892 Y128.774 E.14005
G1 X129.989 Y128.8 E.00307
G1 X130.065 Y128.909 E.00409
G1 X131.001 Y128.895 E.02875
G1 X131.001 Y126.005 E.08878
G1 X130.081 Y126.005 E.02825
G1 X130.081 Y127.038 E.03172
G1 X129.95 Y127.215 E.00677
M204 S10000
G1 X130.536 Y127.151 F42000
; LINE_WIDTH: 0.59029
G1 F5447
M204 S6000
G1 X130.541 Y126.525 E.0279
M204 S10000
G1 X131.045 Y125.251 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5447
M204 S6000
G1 X131.045 Y123.623 E.05401
G2 X130.038 Y123.233 I-1.006 J1.101 E.03666
G1 X130.038 Y121.104 E.07061
G3 X131.045 Y120.644 I1.095 J1.066 E.03758
G1 X131.045 Y118.382 E.07506
G2 X130.038 Y117.992 I-1.006 J1.101 E.03666
G1 X130.038 Y115.863 E.07061
G3 X131.045 Y115.403 I1.095 J1.066 E.03758
G1 X131.045 Y114.358 E.03468
G1 X130.907 Y114.358 E.00458
G1 X130.907 Y114.802 E.01476
M204 S10000
G1 X130.505 Y114.764 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.410545
G1 F5447
M204 S6000
G2 X130.52 Y114.397 I-2.374 J-.276 E.01103
G1 X124.321 Y114.397 E.1857
G1 X124.321 Y114.764 E.01101
G1 X130.445 Y114.764 E.18348
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9792.606
G1 X128.445 Y114.764 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/75
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z7.4 I-1.215 J.065 P1  F42000
G1 X129.742 Y139.035 Z7.4
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5457
M204 S6000
G1 X129.742 Y139.834 E.02651
G1 X124.67 Y139.834 E.16826
G1 X124.67 Y129.166 E.35389
G1 X129.742 Y129.166 E.16826
G1 X129.742 Y138.975 E.32539
M204 S10000
G1 X129.335 Y139.035 F42000
G1 F5457
M204 S6000
G1 X129.335 Y139.427 E.01301
G1 X125.077 Y139.427 E.14125
G1 X125.077 Y129.573 E.32688
G1 X129.335 Y129.573 E.14125
G1 X129.335 Y138.975 E.31188
M204 S250
G1 X128.943 Y139.035 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5457
M204 S5000
G1 X125.469 Y139.035 E.10675
G1 X125.469 Y138.994 E.00126
G1 X125.469 Y130.006 E.27618
G1 X125.469 Y129.965 E.00126
G1 X128.943 Y129.965 E.10675
G1 X128.943 Y138.975 E.27685
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.944 Y139.01 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.057 Y131.429 Z7.6 F42000
G1 X125.52 Y126.834 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5457
M204 S6000
G1 X124.721 Y126.834 E.02651
G1 X124.721 Y116.166 E.35389
G1 X129.689 Y116.166 E.16481
G1 X129.689 Y126.834 E.35389
G1 X125.58 Y126.834 E.13631
M204 S10000
G1 X125.52 Y126.427 F42000
G1 F5457
M204 S6000
G1 X125.128 Y126.427 E.01301
G1 X125.128 Y116.573 E.32688
G1 X129.282 Y116.573 E.1378
G1 X129.282 Y126.427 E.32688
G1 X125.58 Y126.427 E.1228
M204 S250
G1 X125.52 Y126.035 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5457
M204 S5000
G1 X125.52 Y116.965 E.2787
G1 X128.89 Y116.965 E.10355
G1 X128.89 Y126.035 E.2787
G1 X125.58 Y126.035 E.10171
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.567 Y124.035 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.886 Y131.637 Z7.6 F42000
G1 X123.96 Y141.991 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5457
M204 S6000
G1 X123.96 Y114.009 E.9282
G1 X131.419 Y114.009 E.24745
G1 X131.419 Y141.99 E.92819
G1 X124.02 Y141.991 E.24546
M204 S10000
G1 X123.553 Y142.398 F42000
G1 F5457
M204 S6000
G1 X123.553 Y113.602 E.9552
G1 X131.826 Y113.602 E.27446
G1 X131.826 Y142.398 E.9552
G1 X123.613 Y142.398 E.27247
M204 S250
G1 X123.304 Y142.783 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5457
M204 S5000
G3 X123.161 Y142.59 I.059 J-.194 E.00792
G1 X123.161 Y113.407 E.8967
G3 X123.35 Y113.21 I.2 J.003 E.00926
G1 X132.054 Y113.212 E.26743
G1 X132.066 Y113.215 E.00038
G3 X132.219 Y113.41 I-.043 J.19 E.00825
G1 X132.212 Y142.648 E.89839
G3 X132.029 Y142.79 I-.19 J-.057 E.00759
G1 X123.364 Y142.783 E.26623
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.198 Y142.711 E-.06907
G1 X123.161 Y142.59 E-.04802
G1 X123.161 Y140.898 E-.64291
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


G1 X124.315 Y140.038 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.34628
G1 F5457
M204 S6000
G1 X124.315 Y128.962 E.27378
M204 S10000
G1 X125.334 Y128 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.45931
G1 F5457
M204 S6000
G1 X127.682 Y128 E.07964
M204 S10000
G1 X128.137 Y127.949 F42000
; LINE_WIDTH: 0.41999
G1 F5457
M204 S6000
G1 X128.135 Y127.603 E.01061
G1 X125.131 Y127.603 E.0923
G1 X125.063 Y127.707 E.00383
G3 X124.729 Y127.821 I-.406 J-.649 E.01094
G1 X124.729 Y128.2 E.01165
G3 X125.042 Y128.315 I-.009 J.509 E.01046
G1 X125.082 Y128.397 E.00278
G1 X128.221 Y128.397 E.09644
G1 X128.148 Y128.007 E.01217
M204 S10000
G1 X128.518 Y127.986 F42000
G1 F5457
M204 S6000
G1 X128.511 Y127.226 E.02334
G1 X124.931 Y127.226 E.10999
G1 X124.849 Y127.396 E.0058
G1 X124.743 Y127.43 E.00343
G1 X124.352 Y127.43 E.01201
G1 X124.352 Y128.57 E.03505
G1 X124.755 Y128.581 E.0124
G1 X124.809 Y128.611 E.00187
G1 X124.895 Y128.774 E.00566
G1 X128.753 Y128.774 E.11853
G1 X128.625 Y128.484 E.00973
G1 X128.531 Y128.044 E.01381
M204 S10000
G1 X130.402 Y129.064 F42000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5457
M204 S2000
G1 X131.197 Y128.269 E.03455
G1 X131.197 Y127.736
G1 X129.965 Y128.968 E.05354
G1 X129.456 Y128.943
G1 X131.197 Y127.203 E.07565
G1 X131.197 Y126.669
G1 X129.011 Y128.856 E.095
G1 X128.847 Y128.486
G1 X131.197 Y126.136 E.10213
G1 X130.964 Y125.836
G1 X129.912 Y126.888 E.04573
G1 X129.912 Y126.355
G1 X130.431 Y125.836 E.02255
M204 S10000
G1 X129.743 Y127.057 F42000
G1 F5457
M204 S2000
G1 X128.735 Y128.065 E.04383
G1 X128.717 Y127.549
G1 X129.21 Y127.057 E.02141
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.717 Y127.549 E-.26479
G1 X128.735 Y128.065 E-.19617
G1 X129.291 Y127.509 E-.29904
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.071 Y125.259 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5457
M204 S6000
G1 X131.071 Y123.631 E.05401
G2 X130.038 Y123.018 I-1.75 J1.775 E.04025
G1 X130.038 Y121.151 E.06194
G3 X131.071 Y120.456 I1.762 J1.504 E.04183
G1 X131.071 Y118.39 E.06855
G2 X130.038 Y117.777 I-1.75 J1.775 E.04025
G1 X130.038 Y115.91 E.06194
G3 X131.071 Y115.215 I1.762 J1.504 E.04183
M73 P63 R7
G1 X131.071 Y114.358 E.02844
G1 X128.033 Y114.358 E.10077
G3 X126.69 Y114.747 I-1.241 J-1.769 E.04725
G1 X126.53 Y114.358 E.01396
G1 X124.308 Y114.358 E.0737
G1 X124.308 Y115.614 E.04168
G1 X124.887 Y115.614 E.01922
G1 X124.887 Y115.813 E.0066
G3 X125.379 Y115.414 I1.17 J.938 E.02119
G3 X126.69 Y115.047 I1.171 J1.662 E.04602
G1 X127.007 Y115.818 E.02764
G1 X128.635 Y115.818 E.05401
M204 S10000
G1 X124.34 Y115.962 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.39729
G1 F5457
M204 S6000
G1 X124.34 Y127.038 E.31981
M204 S10000
G1 X131.071 Y129.314 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5457
M204 S6000
G1 X131.071 Y130.942 E.05401
G2 X130.091 Y131.577 I.678 J2.122 E.0392
G1 X130.091 Y133.524 E.06458
G3 X131.071 Y134.114 I-.738 J2.335 E.03831
G1 X131.071 Y136.184 E.06864
G2 X130.091 Y136.818 I.678 J2.121 E.0392
G1 X130.091 Y138.765 E.06458
G3 X131.071 Y139.356 I-.738 J2.335 E.03831
G1 X131.071 Y137.727 E.05401
; WIPE_START
G1 F8843.478
G1 X131.071 Y139.356 E-.61876
G1 X130.78 Y139.125 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.756 Y140.226 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F5457
M204 S6000
G1 X124.88 Y140.226 E.11909
G1 X124.813 Y140.386 E.00533
G1 X124.692 Y140.43 E.00395
G1 X124.352 Y140.43 E.01044
G1 X124.352 Y141.599 E.03592
G1 X128.511 Y141.599 E.1278
G1 X128.514 Y141.053 E.01677
G1 X128.632 Y140.498 E.01744
G3 X128.73 Y140.28 I1 J.32 E.00734
M204 S10000
G1 X128.148 Y140.664 F42000
; LINE_WIDTH: 0.540604
G1 F5457
M204 S6000
G1 X125.12 Y140.664 E.12278
G1 X125.093 Y140.721 E.00259
G1 X124.902 Y140.831 E.00891
G1 X124.789 Y140.85 E.00465
G1 X124.789 Y141.161 E.01262
G1 X128.076 Y141.161 E.1333
G1 X128.139 Y140.723 E.01796
M204 S10000
G1 X130.496 Y141.768 F42000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5457
M204 S2000
G1 X131.197 Y141.067 E.03046
G1 X131.197 Y140.534
G1 X129.963 Y141.768 E.05363
G1 X129.43 Y141.768
G1 X131.197 Y140.001 E.0768
G1 X130.729 Y139.936
G1 X128.896 Y141.768 E.07963
G1 X128.717 Y141.414
G1 X130.195 Y139.936 E.06423
G1 X129.541 Y140.057
G1 X128.751 Y140.847 E.03434
M204 S10000
G1 X129.163 Y140.038 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.190633
G1 F5457
M204 S6000
G2 X129.007 Y140.24 I2.733 J2.277 E.00308
; LINE_WIDTH: 0.152938
G1 X128.881 Y140.419 E.00196
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X129.007 Y140.24 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/75
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z7.6 I-.525 J1.098 P1  F42000
G1 X130.47 Y140.94 Z7.6
G1 Z7.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6322
M204 S5000
G1 X130.99 Y140.94 E.01597
G1 X130.99 Y142.16 E.03749
G1 X130.47 Y142.16 E.01597
G1 X130.47 Y141 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.99 Y140.94 E-.1988
G1 X130.99 Y142.16 E-.4636
G1 X130.733 Y142.16 E-.0976
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.407 Y134.535 Z7.8 F42000
G1 X130.078 Y126.84 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6322
M204 S6000
G1 X130.078 Y126.448 E.01301
G1 X131.382 Y126.448 E.04325
G1 X131.382 Y128.452 E.06648
G1 X130.078 Y128.452 E.04325
G1 X130.078 Y126.9 E.05148
M204 S250
G1 X130.47 Y126.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6322
M204 S5000
G1 X130.99 Y126.84 E.01597
G1 X130.99 Y128.06 E.03749
G1 X130.47 Y128.06 E.01597
G1 X130.47 Y126.9 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.99 Y126.84 E-.1988
G1 X130.99 Y128.06 E-.4636
G1 X130.733 Y128.06 E-.0976
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.084 Y135.665 Z7.8 F42000
G1 X129.796 Y139.035 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6322
M204 S6000
G1 X129.796 Y139.834 E.02651
G1 X124.724 Y139.834 E.16826
G1 X124.724 Y129.166 E.35389
G1 X129.796 Y129.166 E.16826
G1 X129.796 Y138.975 E.32539
M204 S10000
G1 X129.389 Y139.035 F42000
G1 F6322
M204 S6000
G1 X129.389 Y139.427 E.01301
G1 X125.131 Y139.427 E.14125
G1 X125.131 Y129.573 E.32688
G1 X129.389 Y129.573 E.14125
G1 X129.389 Y138.975 E.31188
M204 S250
G1 X128.997 Y139.035 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6322
M204 S5000
G1 X125.523 Y139.035 E.10675
G1 X125.523 Y138.994 E.00126
G1 X125.523 Y130.006 E.27618
G1 X125.523 Y129.965 E.00126
G1 X128.997 Y129.965 E.10675
G1 X128.997 Y138.975 E.27685
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.997 Y139.01 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.635 Y131.555 Z7.8 F42000
G1 X129.671 Y126.84 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6322
M204 S6000
G1 X129.671 Y128.859 E.06698
G1 X131.446 Y128.859 E.05887
G1 X131.446 Y140.141 E.37424
G1 X129.671 Y140.141 E.05887
G1 X129.671 Y141.991 E.06136
G1 X123.986 Y141.991 E.18858
G1 X123.986 Y114.009 E.9282
G1 X131.446 Y114.009 E.24745
G1 X131.446 Y126.041 E.39911
G1 X129.689 Y126.041 E.05826
G1 X129.689 Y116.166 E.32757
G1 X124.721 Y116.166 E.16481
G1 X124.721 Y126.834 E.35389
G1 X129.617 Y126.834 E.1624
; WIPE_START
G1 F8843.478
G1 X129.67 Y128.833 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.52 Y126.427 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
G1 F6322
M204 S6000
G1 X125.128 Y126.427 E.01301
G1 X125.128 Y116.573 E.32688
G1 X129.282 Y116.573 E.1378
G1 X129.282 Y126.427 E.32688
G1 X125.58 Y126.427 E.1228
M204 S250
G1 X125.52 Y126.035 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6322
M204 S5000
G1 X125.52 Y116.965 E.2787
G1 X128.89 Y116.965 E.10355
G1 X128.89 Y126.035 E.2787
G1 X125.58 Y126.035 E.10171
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.567 Y124.035 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.745 Y131.623 Z7.8 F42000
G1 X123.579 Y142.398 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6322
M204 S6000
G1 X123.579 Y113.602 E.9552
G1 X131.853 Y113.602 E.27446
G1 X131.853 Y142.398 E.9552
G1 X131.382 Y142.398 E.01562
G1 X131.382 Y140.548 E.06136
G1 X130.078 Y140.548 E.04325
G1 X130.078 Y142.398 E.06136
G1 X123.639 Y142.398 E.2136
M204 S250
G1 X123.331 Y142.783 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6322
M204 S5000
G3 X123.187 Y142.59 I.06 J-.195 E.00792
G1 X123.187 Y113.408 E.8967
G3 X123.377 Y113.21 I.2 J.003 E.00926
G1 X132.08 Y113.212 E.26744
G1 X132.092 Y113.215 E.00038
G3 X132.245 Y113.41 I-.043 J.19 E.00825
G1 X132.238 Y142.648 E.89838
G3 X132.055 Y142.79 I-.193 J-.06 E.00758
G1 X123.391 Y142.783 E.26623
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.224 Y142.711 E-.06909
G1 X123.187 Y142.59 E-.04799
G1 X123.187 Y140.898 E-.64292
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


G1 X124.355 Y140.038 F42000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.37353
G1 F6322
M204 S6000
G1 X124.355 Y128.962 E.29837
M204 S10000
G1 X125.337 Y128 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.45932
G1 F6322
M204 S6000
G1 X128.445 Y128 E.10546
M204 S10000
G1 X128.902 Y128 F42000
; LINE_WIDTH: 0.41999
G1 F6322
M204 S6000
G1 X128.902 Y127.603 E.01219
G1 X125.131 Y127.603 E.11585
G1 X125.091 Y127.687 E.00286
G3 X124.755 Y127.805 I-.339 J-.429 E.01113
G1 X124.755 Y128.195 E.01199
G3 X125.093 Y128.313 I-.003 J.55 E.0112
G1 X125.134 Y128.397 E.00287
G1 X128.902 Y128.397 E.11577
G1 X128.902 Y128.06 E.01035
M204 S10000
G1 X129.279 Y128 F42000
G1 F6322
M204 S6000
G1 X129.279 Y127.226 E.02378
G1 X124.931 Y127.226 E.13359
G1 X124.859 Y127.39 E.0055
G1 X124.743 Y127.43 E.00377
G1 X124.378 Y127.43 E.0112
G1 X124.378 Y128.57 E.03505
G1 X124.802 Y128.579 E.01304
G1 X124.861 Y128.61 E.00205
G1 X124.949 Y128.774 E.0057
G1 X129.279 Y128.774 E.13305
G1 X129.279 Y128.06 E.02193
; WIPE_START
G1 F9547.299
G1 X129.279 Y128.774 E-.27125
G1 X127.993 Y128.774 E-.48875
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.054 Y129.684 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
; Slow Down Start
; FEATURE: Floating vertical shell
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X131.054 Y139.749 E.30926
G1 X130.188 Y139.749 E.0266
G1 X130.188 Y129.251 E.32255
G1 X131.054 Y129.251 E.0266
G1 X131.054 Y129.624 E.01145
; Slow Down End
M204 S10000
G1 X130.621 Y139.316 F42000
; Slow Down Start
; LINE_WIDTH: 0.5314
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X130.621 Y129.744 E.38101
; Slow Down End
; WIPE_START
G1 X130.621 Y131.744 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.617 Y128.656 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.10676
G1 F6322
M204 S6000
G1 X131.617 Y126.244 E.01254
; WIPE_START
G1 F15000
G1 X131.617 Y128.244 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.038 Y124.758 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6322
M204 S6000
G1 X130.038 Y125.693 E.031
G1 X130.731 Y125.693 E.02302
G1 X131.097 Y125.382 E.01592
G1 X131.097 Y124.058 E.04391
G1 X130.913 Y123.414 E.02223
G1 X130.038 Y122.724 E.03698
G1 X130.038 Y121.236 E.04936
G1 X130.328 Y120.793 E.01757
G1 X131.097 Y120.141 E.03346
G1 X131.097 Y118.817 E.04391
G1 X130.913 Y118.173 E.02223
G1 X130.038 Y117.483 E.03698
G1 X130.038 Y115.995 E.04936
G1 X130.328 Y115.552 E.01757
G1 X131.097 Y114.9 E.03346
M73 P64 R7
G1 X131.097 Y114.357 E.01798
G1 X130.011 Y114.358 E.03603
M204 S10000
G1 X128.821 Y115.818 F42000
G1 F6322
M204 S6000
G1 X127.193 Y115.818 E.05401
G3 X127.19 Y115.225 I.742 J-.3 E.02015
G3 X128.143 Y114.358 I2.144 J1.398 E.04318
G1 X126.225 Y114.358 E.06362
G3 X125.935 Y114.897 I-.646 J.001 E.02115
G1 X125.087 Y115.552 E.03556
G1 X124.887 Y115.818 E.01102
G1 X124.887 Y115.614 E.00675
G1 X124.334 Y115.614 E.01835
G1 X124.334 Y114.768 E.02808
M204 S10000
G1 X124.354 Y115.962 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.37095
G1 F6322
M204 S6000
G1 X124.354 Y127.038 E.29604
; WIPE_START
G1 F10974.606
G1 X124.354 Y125.038 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.708 Y132.298 Z7.8 F42000
G1 X129.279 Y140.226 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F6322
M204 S6000
G1 X124.934 Y140.226 E.13351
G1 X124.866 Y140.386 E.00533
G1 X124.745 Y140.43 E.00395
G1 X124.378 Y140.43 E.01128
G1 X124.378 Y141.599 E.03592
G1 X129.279 Y141.599 E.15058
G1 X129.279 Y140.286 E.04032
M204 S10000
G1 X128.593 Y140.664 F42000
; LINE_WIDTH: 0.540599
G1 F6322
M204 S6000
G1 X125.174 Y140.664 E.13866
G1 X125.147 Y140.721 E.00259
G1 X124.931 Y140.839 E.00994
G1 X124.815 Y140.856 E.00476
G1 X124.815 Y141.161 E.01237
G1 X128.842 Y141.161 E.16327
G1 X128.842 Y140.664 E.02018
G1 X128.653 Y140.664 E.00766
; WIPE_START
G1 F7233.578
G1 X128.842 Y140.664 E-.07175
G1 X128.842 Y141.161 E-.1891
G1 X127.528 Y141.161 E-.49915
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.274 Y142.475 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280526
G1 F6322
M204 S6000
G1 X131.186 Y142.475 E.01765
M204 S10000
G1 X131.617 Y142.194 F42000
; LINE_WIDTH: 0.10676
G1 F6322
M204 S6000
G1 X131.617 Y140.345 E.00962
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X131.617 Y142.194 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/75
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z7.8 I1.107 J-.506 P1  F42000
G1 X131.043 Y140.94 Z7.8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5796
M204 S5000
G1 X131.043 Y142.16 E.03749
G1 X129.724 Y142.16 E.04055
G1 X129.724 Y140.94 E.03749
G1 X130.983 Y140.94 E.03871
; WIPE_START
G1 F9547.055
M204 S6000
G1 X131.043 Y142.16 E-.46416
G1 X130.265 Y142.16 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.761 Y134.544 Z8 F42000
G1 X129.332 Y128.06 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5796
M204 S6000
G1 X129.332 Y126.448 E.05347
G1 X131.435 Y126.448 E.06979
G1 X131.435 Y128.452 E.06648
G1 X129.332 Y128.452 E.06979
G1 X129.332 Y128.12 E.01102
M204 S250
G1 X129.724 Y128.06 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5796
M204 S5000
G1 X129.724 Y126.84 E.03749
G1 X131.043 Y126.84 E.04055
G1 X131.043 Y128.06 E.03749
G1 X129.784 Y128.06 E.03871
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.724 Y126.84 E-.46416
G1 X130.502 Y126.84 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.094 Y134.462 Z8 F42000
G1 X129.85 Y139.035 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5796
M204 S6000
G1 X129.85 Y139.834 E.02651
G1 X124.777 Y139.834 E.16826
G1 X124.777 Y129.166 E.35389
G1 X129.85 Y129.166 E.16826
G1 X129.85 Y138.975 E.32539
M204 S10000
G1 X129.443 Y139.035 F42000
G1 F5796
M204 S6000
G1 X129.443 Y139.427 E.01301
G1 X125.184 Y139.427 E.14125
G1 X125.184 Y129.573 E.32688
G1 X129.443 Y129.573 E.14125
G1 X129.443 Y138.975 E.31188
M204 S250
G1 X129.05 Y139.035 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5796
M204 S5000
G1 X125.576 Y139.035 E.10675
G1 X125.576 Y138.994 E.00126
G1 X125.576 Y130.006 E.27618
G1 X125.576 Y129.965 E.00126
G1 X129.05 Y129.965 E.10675
G1 X129.05 Y138.975 E.27685
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.051 Y139.01 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.338 Y131.486 Z8 F42000
G1 X128.925 Y128.06 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5796
M204 S6000
G1 X128.925 Y128.859 E.02651
G1 X131.472 Y128.859 E.08451
G1 X131.472 Y140.141 E.37424
G1 X128.925 Y140.141 E.08451
G1 X128.925 Y141.991 E.06136
G1 X124.012 Y141.991 E.16295
G1 X124.012 Y114.009 E.9282
G1 X131.472 Y114.009 E.24745
G1 X131.472 Y126.041 E.39911
G1 X129.689 Y126.041 E.05913
G1 X129.689 Y116.166 E.32757
G1 X124.721 Y116.166 E.16481
G1 X124.721 Y126.834 E.35389
G1 X128.925 Y126.834 E.13944
G1 X128.925 Y128 E.03867
; WIPE_START
G1 F8843.478
G1 X128.925 Y128.859 E-.32648
G1 X130.065 Y128.859 E-.43352
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.52 Y126.427 Z8 F42000
G1 Z7.6
G1 E.8 F1800
G1 F5796
M204 S6000
G1 X125.128 Y126.427 E.01301
G1 X125.128 Y116.573 E.32688
G1 X129.282 Y116.573 E.1378
G1 X129.282 Y126.427 E.32688
G1 X125.58 Y126.427 E.1228
M204 S250
G1 X125.52 Y126.035 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5796
M204 S5000
G1 X125.52 Y116.965 E.2787
G1 X128.89 Y116.965 E.10355
G1 X128.89 Y126.035 E.2787
G1 X125.58 Y126.035 E.10171
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.567 Y124.035 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.756 Y131.624 Z8 F42000
G1 X123.605 Y142.398 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5796
M204 S6000
G1 X123.605 Y113.602 E.9552
G1 X131.879 Y113.602 E.27446
G1 X131.879 Y142.398 E.9552
G1 X131.435 Y142.398 E.01472
G1 X131.435 Y140.548 E.06136
G1 X129.332 Y140.548 E.06979
G1 X129.332 Y142.398 E.06136
G1 X123.665 Y142.398 E.18796
M204 S250
G1 X123.357 Y142.783 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5796
M204 S5000
G3 X123.213 Y142.59 I.06 J-.194 E.00792
G1 X123.213 Y113.408 E.8967
G3 X123.403 Y113.21 I.2 J.003 E.00926
G1 X132.107 Y113.212 E.26744
G1 X132.118 Y113.215 E.00036
G3 X132.271 Y113.41 I-.042 J.191 E.00826
G1 X132.264 Y142.648 E.89839
G3 X132.081 Y142.79 I-.19 J-.057 E.0076
G1 X123.417 Y142.783 E.26623
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.25 Y142.711 E-.0691
G1 X123.213 Y142.59 E-.04795
G1 X123.213 Y140.898 E-.64295
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


G1 X124.395 Y140.038 F42000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.40079
G1 F5796
M204 S6000
G1 X124.395 Y128.962 E.32297
M204 S10000
G1 X125.391 Y128 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.45932
G1 F5796
M204 S6000
G1 X127.699 Y128 E.07832
M204 S10000
G1 X128.155 Y128 F42000
; LINE_WIDTH: 0.41999
G1 F5796
M204 S6000
G1 X128.155 Y127.603 E.01219
G1 X125.133 Y127.603 E.09287
G1 X125.094 Y127.685 E.00277
G3 X124.781 Y127.8 I-.322 J-.391 E.01042
G1 X124.799 Y128.193 E.0121
G1 X125.116 Y128.291 E.0102
G1 X125.188 Y128.397 E.00393
G1 X128.155 Y128.397 E.09119
G1 X128.155 Y128.06 E.01035
M204 S10000
G1 X128.532 Y128 F42000
G1 F5796
M204 S6000
G1 X128.532 Y127.226 E.02378
G1 X124.931 Y127.226 E.11065
G1 X124.86 Y127.389 E.00546
G1 X124.743 Y127.43 E.00381
G1 X124.404 Y127.43 E.01039
G1 X124.404 Y128.57 E.03505
G1 X124.849 Y128.577 E.01368
G1 X124.915 Y128.61 E.00225
G1 X125.002 Y128.774 E.0057
G1 X128.532 Y128.774 E.10847
G1 X128.532 Y128.06 E.02193
; WIPE_START
G1 F9547.299
G1 X128.532 Y128.774 E-.27125
G1 X127.246 Y128.774 E-.48875
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.242 Y129.251 Z8 F42000
G1 Z7.6
G1 E.8 F1800
G1 F5796
M204 S6000
G1 X130.242 Y139.749 E.32255
G1 X131.08 Y139.749 E.02576
G1 X131.08 Y129.251 E.32255
G1 X130.302 Y129.251 E.02391
M204 S10000
G1 X130.661 Y139.33 F42000
; LINE_WIDTH: 0.50414
G1 F5796
M204 S6000
G1 X130.661 Y129.73 E.36078
; WIPE_START
G1 F7805.385
G1 X130.661 Y131.73 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.038 Y124.61 Z8 F42000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5796
M204 S6000
G1 X130.038 Y125.693 E.0359
G1 X130.584 Y125.693 E.01812
G2 X131.124 Y125.112 I-3.331 J-3.641 E.02632
G1 X131.124 Y123.688 E.04725
G1 X130.999 Y123.414 E.00998
G3 X130.038 Y122.361 I3.06 J-3.761 E.04748
G1 X130.038 Y121.244 E.03707
G1 X130.242 Y120.793 E.0164
G2 X131.124 Y119.871 I-5.283 J-5.933 E.04237
G1 X131.124 Y118.447 E.04725
G1 X130.999 Y118.173 E.00998
G3 X130.038 Y117.12 I3.06 J-3.761 E.04748
G1 X130.038 Y116.002 E.03707
G1 X130.242 Y115.552 E.0164
G2 X131.124 Y114.63 I-5.283 J-5.933 E.04237
G1 X131.124 Y116.258 E.05401
M204 S10000
G1 X128.945 Y115.818 F42000
G1 F5796
M204 S6000
G1 X127.317 Y115.818 E.05401
G1 X127.312 Y115.552 E.00881
G3 X128.263 Y114.358 I2.716 J1.186 E.05123
G1 X126.02 Y114.358 E.0744
G3 X125.001 Y115.552 I-3.072 J-1.59 E.05255
G1 X124.887 Y115.802 E.0091
G1 X124.887 Y115.614 E.00622
G1 X124.361 Y115.614 E.01747
G1 X124.361 Y114.7 E.03032
M204 S10000
G1 X124.367 Y115.962 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.34462
G1 F5796
M204 S6000
G1 X124.367 Y127.038 E.27228
; WIPE_START
M73 P65 R7
G1 F11932.383
G1 X124.367 Y125.038 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.385 Y132.398 Z8 F42000
G1 X128.532 Y140.226 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F5796
M204 S6000
G1 X124.987 Y140.226 E.10893
G1 X124.92 Y140.386 E.00533
G1 X124.799 Y140.43 E.00395
G1 X124.404 Y140.43 E.01212
G1 X124.404 Y141.599 E.03592
G1 X128.532 Y141.599 E.12684
G1 X128.532 Y140.286 E.04032
M204 S10000
G1 X128.095 Y140.664 F42000
; LINE_WIDTH: 0.54061
G1 F5796
M204 S6000
G1 X125.227 Y140.664 E.11631
G1 X125.2 Y140.721 E.00259
G1 X124.961 Y140.846 E.01094
G1 X124.842 Y140.861 E.00487
G1 X124.842 Y141.161 E.01216
G1 X128.095 Y141.161 E.13194
G1 X128.095 Y140.724 E.01775
; WIPE_START
G1 F7233.429
G1 X128.095 Y141.161 E-.1663
G1 X126.533 Y141.161 E-.5937
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.528 Y142.475 Z8 F42000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280546
G1 F5796
M204 S6000
G1 X131.239 Y142.475 E.03314
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X129.528 Y142.475 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/75
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z8 I.851 J.87 P1  F42000
G1 X131.097 Y140.94 Z8
G1 Z7.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5749
M204 S5000
G1 X131.097 Y142.16 E.03749
G1 X128.977 Y142.16 E.06513
G1 X128.977 Y140.94 E.03749
G1 X131.037 Y140.94 E.06329
; WIPE_START
G1 F9547.055
M204 S6000
G1 X131.097 Y142.16 E-.46416
G1 X130.318 Y142.16 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.092 Y134.859 Z8.2 F42000
G1 X125.52 Y126.427 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5749
M204 S6000
G1 X125.128 Y126.427 E.01301
G1 X125.128 Y116.573 E.32688
G1 X129.282 Y116.573 E.1378
G1 X129.282 Y126.448 E.32757
G1 X131.489 Y126.448 E.0732
G1 X131.489 Y128.452 E.06648
G1 X128.585 Y128.452 E.09633
G1 X128.585 Y126.427 E.06717
G1 X125.58 Y126.427 E.09968
; WIPE_START
G1 F8843.478
G1 X125.128 Y126.427 E-.17179
G1 X125.128 Y124.879 E-.58821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.977 Y126.84 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5749
M204 S5000
G1 X131.097 Y126.84 E.06513
G1 X131.097 Y128.06 E.03749
G1 X128.977 Y128.06 E.06513
G1 X128.977 Y126.9 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.976 Y126.843 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.52 Y126.035 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
G1 F5749
M204 S5000
G1 X125.52 Y116.965 E.2787
G1 X128.89 Y116.965 E.10355
G1 X128.89 Y126.035 E.2787
G1 X125.58 Y126.035 E.10171
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.567 Y124.035 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.687 Y131.367 Z8.2 F42000
G1 X129.903 Y139.035 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5749
M204 S6000
G1 X129.903 Y139.834 E.02651
G1 X124.831 Y139.834 E.16826
G1 X124.831 Y129.166 E.35389
G1 X129.903 Y129.166 E.16826
G1 X129.903 Y138.975 E.32539
M204 S10000
G1 X129.496 Y139.035 F42000
G1 F5749
M204 S6000
G1 X129.496 Y139.427 E.01301
G1 X125.238 Y139.427 E.14125
G1 X125.238 Y129.573 E.32688
G1 X129.496 Y129.573 E.14125
G1 X129.496 Y138.975 E.31188
M204 S250
G1 X129.104 Y139.035 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5749
M204 S5000
G1 X125.63 Y139.035 E.10675
G1 X125.63 Y138.994 E.00126
G1 X125.63 Y130.006 E.27618
G1 X125.63 Y129.965 E.00126
G1 X129.104 Y129.965 E.10675
G1 X129.104 Y138.975 E.27685
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.104 Y139.01 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.039 Y141.991 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5749
M204 S6000
G1 X124.039 Y114.009 E.92819
G1 X131.506 Y114.01 E.2477
G1 X131.506 Y126.041 E.3991
G1 X129.689 Y126.041 E.06026
G1 X129.689 Y116.166 E.32757
G1 X124.721 Y116.166 E.16481
G1 X124.721 Y126.834 E.35389
G1 X128.178 Y126.834 E.11468
G1 X128.178 Y128.859 E.06717
G1 X131.506 Y128.859 E.11039
G1 X131.506 Y140.141 E.37424
G1 X128.178 Y140.141 E.11039
G1 X128.178 Y141.991 E.06136
G1 X124.099 Y141.991 E.13532
M204 S10000
G1 X123.632 Y142.398 F42000
G1 F5749
M204 S6000
G1 X123.632 Y113.602 E.9552
G1 X131.913 Y113.602 E.27471
G1 X131.913 Y142.398 E.95519
G1 X131.489 Y142.398 E.01406
G1 X131.489 Y140.548 E.06136
G1 X128.585 Y140.548 E.09633
G1 X128.585 Y142.398 E.06136
G1 X123.692 Y142.398 E.16233
M204 S250
G1 X123.383 Y142.783 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5749
M204 S5000
G3 X123.24 Y142.59 I.06 J-.194 E.00792
G1 X123.24 Y113.407 E.8967
G3 X123.429 Y113.21 I.2 J.003 E.00926
G1 X132.112 Y113.21 E.26679
G3 X132.305 Y113.41 I-.008 J.201 E.00943
G1 X132.298 Y142.647 E.89837
G3 X132.113 Y142.79 I-.192 J-.059 E.00767
G1 X123.443 Y142.783 E.26639
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.277 Y142.711 E-.06902
G1 X123.24 Y142.59 E-.04803
G1 X123.24 Y140.898 E-.64294
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


G1 X124.435 Y140.038 F42000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.42805
G1 F5749
M204 S6000
G1 X124.435 Y128.962 E.34757
M204 S10000
G1 X125.444 Y128 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.45932
G1 F5749
M204 S6000
G1 X126.952 Y128 E.05117
M204 S10000
G1 X127.409 Y128 F42000
; LINE_WIDTH: 0.41999
G1 F5749
M204 S6000
G1 X127.409 Y127.603 E.01219
G1 X125.135 Y127.603 E.06989
G1 X125.097 Y127.682 E.00269
G3 X124.808 Y127.794 I-.303 J-.355 E.0097
G1 X124.808 Y128.193 E.01227
G1 X124.986 Y128.209 E.0055
G1 X125.2 Y128.313 E.00731
G1 X125.241 Y128.397 E.00287
G1 X127.409 Y128.397 E.06661
G1 X127.409 Y128.06 E.01035
M204 S10000
G1 X127.786 Y128 F42000
G1 F5749
M204 S6000
G1 X127.786 Y127.226 E.02378
G1 X124.931 Y127.226 E.08772
G1 X124.861 Y127.388 E.00543
G1 X124.743 Y127.43 E.00384
G1 X124.431 Y127.43 E.00958
G1 X124.431 Y128.57 E.03505
G1 X124.948 Y128.596 E.01591
G1 X125.056 Y128.774 E.00638
G1 X127.786 Y128.774 E.08389
G1 X127.786 Y128.06 E.02193
; WIPE_START
G1 F9547.299
G1 X127.786 Y128.774 E-.27125
G1 X126.5 Y128.774 E-.48875
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.295 Y129.251 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
G1 F5749
M204 S6000
G1 X130.295 Y139.749 E.32255
G1 X131.114 Y139.749 E.02515
G1 X131.114 Y129.251 E.32255
G1 X130.355 Y129.251 E.02331
M204 S10000
G1 X130.705 Y139.34 F42000
; LINE_WIDTH: 0.4844
G1 F5749
M204 S6000
G1 X130.705 Y129.72 E.34605
; WIPE_START
G1 F8154.389
G1 X130.705 Y131.72 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.038 Y124.451 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5749
M204 S6000
G1 X130.038 Y125.693 E.04118
G1 X130.424 Y125.693 E.01283
G2 X131.158 Y124.742 I-9.183 J-7.844 E.03983
G1 X131.158 Y123.629 E.03694
G1 X131.099 Y123.414 E.00738
G3 X130.07 Y122.104 I12.66 J-11.001 E.05529
G3 X130.142 Y120.793 I3.32 J-.476 E.04381
G2 X131.158 Y119.501 I-12.484 J-10.856 E.05454
G1 X131.158 Y118.387 E.03694
G1 X131.099 Y118.173 E.00738
G3 X130.07 Y116.862 I12.658 J-11 E.05529
G3 X130.142 Y115.552 I3.32 J-.476 E.04381
G2 X131.085 Y114.358 I-11.533 J-10.071 E.05049
G1 X131.158 Y114.358 E.00242
G1 X131.158 Y115.913 E.05159
M204 S10000
G1 X129.035 Y115.818 F42000
G1 F5749
M204 S6000
G1 X127.407 Y115.818 E.05401
G1 X127.45 Y115.552 E.00892
G3 X128.383 Y114.358 I12.473 J8.785 E.0503
G1 X125.843 Y114.358 E.08425
G3 X124.901 Y115.552 I-12.478 J-8.879 E.05049
G1 X124.884 Y115.614 E.00213
G1 X124.387 Y115.614 E.01648
G1 X124.387 Y114.483 E.03753
M204 S10000
G1 X124.38 Y115.962 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.31829
G1 F5749
M204 S6000
G1 X124.38 Y127.038 E.24852
; WIPE_START
M73 P65 R6
G1 F13073.319
G1 X124.38 Y125.038 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.05 Y132.485 Z8.2 F42000
G1 X127.786 Y140.226 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F5749
M204 S6000
G1 X125.041 Y140.226 E.08435
G1 X124.973 Y140.386 E.00533
G1 X124.852 Y140.43 E.00395
G1 X124.431 Y140.43 E.01296
G1 X124.431 Y141.599 E.03592
G1 X127.786 Y141.599 E.1031
G1 X127.786 Y140.286 E.04033
M204 S10000
M73 P66 R6
G1 X127.349 Y140.664 F42000
; LINE_WIDTH: 0.540621
G1 F5749
M204 S6000
G1 X125.281 Y140.664 E.08387
G1 X125.254 Y140.721 E.00259
G1 X124.99 Y140.852 E.01191
G1 X124.868 Y140.865 E.00499
G1 X124.868 Y141.161 E.01201
G1 X127.349 Y141.161 E.1006
G1 X127.349 Y140.724 E.01775
; WIPE_START
G1 F7233.269
G1 X127.349 Y141.161 E-.16631
G1 X125.786 Y141.161 E-.59369
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.781 Y142.475 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280546
G1 F5749
M204 S6000
G1 X131.293 Y142.475 E.04863
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X129.293 Y142.475 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/75
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z8.2 I.775 J.938 P1  F42000
G1 X131.151 Y140.94 Z8.2
G1 Z8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5760
M204 S5000
G1 X131.151 Y142.16 E.03749
G1 X128.231 Y142.16 E.08971
G1 X128.231 Y140.94 E.03749
G1 X131.091 Y140.94 E.08787
; WIPE_START
G1 F9547.055
M204 S6000
G1 X131.151 Y142.16 E-.46416
G1 X130.372 Y142.16 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.123 Y134.866 Z8.4 F42000
G1 X125.52 Y126.427 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5760
M204 S6000
G1 X125.128 Y126.427 E.01301
G1 X125.128 Y116.573 E.32688
G1 X129.282 Y116.573 E.1378
G1 X129.282 Y126.448 E.32757
G1 X131.543 Y126.448 E.07498
G1 X131.543 Y128.452 E.06648
G1 X127.839 Y128.452 E.12286
G1 X127.839 Y126.427 E.06717
G1 X125.58 Y126.427 E.07492
; WIPE_START
G1 F8843.478
G1 X125.128 Y126.427 E-.17179
G1 X125.128 Y124.879 E-.58821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.231 Y128.06 Z8.4 F42000
G1 Z8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5760
M204 S5000
G1 X128.231 Y126.84 E.03749
G1 X131.151 Y126.84 E.08971
G1 X131.151 Y128.06 E.03749
G1 X128.291 Y128.06 E.08787
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.231 Y126.84 E-.46416
G1 X129.009 Y126.84 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.52 Y126.035 Z8.4 F42000
G1 Z8
G1 E.8 F1800
G1 F5760
M204 S5000
G1 X125.52 Y116.965 E.2787
G1 X128.89 Y116.965 E.10355
G1 X128.89 Y126.035 E.2787
G1 X125.58 Y126.035 E.10171
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.567 Y124.035 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.711 Y131.36 Z8.4 F42000
G1 X129.957 Y139.035 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5760
M204 S6000
G1 X129.957 Y139.834 E.02651
G1 X124.884 Y139.834 E.16826
G1 X124.884 Y129.166 E.35389
G1 X129.957 Y129.166 E.16826
G1 X129.957 Y138.975 E.32539
M204 S10000
G1 X129.55 Y139.035 F42000
G1 F5760
M204 S6000
G1 X129.55 Y139.427 E.01301
G1 X125.292 Y139.427 E.14125
G1 X125.292 Y129.573 E.32688
G1 X129.55 Y129.573 E.14125
G1 X129.55 Y138.975 E.31188
M204 S250
G1 X129.158 Y139.035 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5760
M204 S5000
G1 X125.684 Y139.035 E.10675
G1 X125.684 Y138.994 E.00126
G1 X125.684 Y130.006 E.27618
G1 X125.684 Y129.965 E.00126
G1 X129.158 Y129.965 E.10675
G1 X129.158 Y138.975 E.27685
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.158 Y139.01 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.065 Y141.991 Z8.4 F42000
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5760
M204 S6000
G1 X124.065 Y114.009 E.9282
G1 X131.542 Y114.009 E.24801
G1 X131.542 Y126.041 E.3991
G1 X129.689 Y126.041 E.06144
G1 X129.689 Y116.166 E.32757
G1 X124.721 Y116.166 E.16481
G1 X124.721 Y126.834 E.35389
G1 X127.432 Y126.834 E.08992
G1 X127.432 Y128.859 E.06717
G1 X131.542 Y128.859 E.13633
G1 X131.542 Y140.141 E.37424
G1 X127.432 Y140.141 E.13633
G1 X127.432 Y141.991 E.06136
G1 X124.125 Y141.991 E.10969
M204 S10000
G1 X123.658 Y142.398 F42000
G1 F5760
M204 S6000
G1 X123.658 Y113.602 E.9552
G1 X131.949 Y113.602 E.27502
G1 X131.949 Y142.398 E.95519
G1 X131.543 Y142.398 E.01347
G1 X131.543 Y140.548 E.06136
G1 X127.839 Y140.548 E.12286
G1 X127.839 Y142.398 E.06136
G1 X123.718 Y142.398 E.1367
M204 S250
G1 X123.41 Y142.783 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5760
M204 S5000
G3 X123.266 Y142.59 I.06 J-.195 E.00792
G1 X123.266 Y113.407 E.8967
G3 X123.456 Y113.21 I.2 J.003 E.00926
G1 X132.146 Y113.21 E.26704
G3 X132.341 Y113.41 I-.006 J.201 E.00947
G1 X132.334 Y142.647 E.89838
G3 X132.149 Y142.79 I-.193 J-.059 E.00766
G1 X123.47 Y142.783 E.26668
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.303 Y142.711 E-.06905
G1 X123.266 Y142.59 E-.04802
G1 X123.266 Y140.898 E-.64293
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


G1 X124.475 Y140.038 F42000
G1 Z8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.45531
G1 F5760
M204 S6000
G1 X124.475 Y128.962 E.37218
M204 S10000
G1 X125.498 Y128 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.45932
G1 F5760
M204 S6000
G1 X126.206 Y128 E.02403
M204 S10000
G1 X126.663 Y128 F42000
; LINE_WIDTH: 0.41999
G1 F5760
M204 S6000
G1 X126.663 Y127.603 E.01219
G1 X125.136 Y127.603 E.04691
G1 X125.099 Y127.68 E.00262
G1 X124.834 Y127.787 E.00878
G1 X124.834 Y128.193 E.01248
G1 X125.022 Y128.205 E.0058
G1 X125.254 Y128.313 E.00784
G1 X125.295 Y128.397 E.00287
G1 X126.663 Y128.397 E.04203
G1 X126.663 Y128.06 E.01035
M204 S10000
G1 X127.04 Y128 F42000
G1 F5760
M204 S6000
G1 X127.04 Y127.226 E.02378
G1 X124.931 Y127.226 E.06479
G1 X124.861 Y127.387 E.0054
G1 X124.743 Y127.43 E.00387
G1 X124.457 Y127.43 E.00878
G1 X124.457 Y128.57 E.03505
G1 X124.991 Y128.591 E.01642
G1 X125.109 Y128.774 E.0067
G1 X127.04 Y128.774 E.05931
G1 X127.04 Y128.06 E.02193
; WIPE_START
G1 F9547.299
G1 X127.04 Y128.774 E-.27125
G1 X125.753 Y128.774 E-.48875
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.035 Y126.437 Z8.4 F42000
G1 Z8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.45586
G1 F5760
M204 S6000
G1 X129.086 Y126.437 E.03537
; WIPE_START
G1 F8717.973
G1 X128.035 Y126.437 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.038 Y124.288 Z8.4 F42000
G1 Z8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5760
M204 S6000
G1 X130.038 Y125.693 E.04659
G1 X130.261 Y125.693 E.00742
G3 X131.059 Y124.724 I4.693 J3.055 E.04171
G1 X131.193 Y124.329 E.01384
G1 X131.193 Y123.376 E.03161
G2 X130.182 Y122.104 I-6.15 J3.849 E.05404
G1 X130.038 Y121.678 E.01491
G1 X130.038 Y120.771 E.0301
G3 X131.059 Y119.483 I6.221 J3.888 E.05464
G1 X131.193 Y119.088 E.01384
G1 X131.193 Y118.135 E.03161
G2 X130.182 Y116.862 I-6.15 J3.849 E.05404
G3 X130.038 Y115.818 I1.468 J-.735 E.03562
G1 X129.997 Y115.818 E.00136
G1 X130.022 Y115.552 E.00885
G3 X130.957 Y114.358 I5.765 J3.551 E.05043
G1 X128.518 Y114.358 E.08091
G3 X127.561 Y115.552 I-5.775 J-3.644 E.05086
G1 X127.471 Y115.818 E.0093
G1 X124.887 Y115.818 E.08571
G1 X124.887 Y115.614 E.00675
G1 X124.775 Y115.614 E.00374
G1 X124.78 Y115.552 E.00207
G3 X125.716 Y114.358 I5.765 J3.551 E.05043
G1 X124.413 Y114.358 E.0432
G1 X124.413 Y114.684 E.01081
M204 S10000
G1 X124.393 Y115.962 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.29196
G1 F5760
M204 S6000
G1 X124.393 Y127.038 E.22475
; WIPE_START
G1 F14455.509
G1 X124.393 Y125.038 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.349 Y129.251 Z8.4 F42000
G1 Z8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F5760
M204 S6000
G1 X130.349 Y139.749 E.32255
G1 X131.15 Y139.749 E.0246
G1 X131.15 Y129.251 E.32255
G1 X130.409 Y129.251 E.02276
M204 S10000
G1 X130.749 Y139.348 F42000
; LINE_WIDTH: 0.46654
G1 F5760
M204 S6000
G1 X130.749 Y129.712 E.33266
; WIPE_START
G1 F8498.182
G1 X130.749 Y131.712 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.701 Y138.709 Z8.4 F42000
G1 X127.04 Y140.226 Z8.4
G1 Z8
G1 E.8 F1800
; LINE_WIDTH: 0.41999
G1 F5760
M204 S6000
G1 X125.095 Y140.226 E.05977
M73 P67 R6
G1 X125.027 Y140.386 E.00533
G1 X124.906 Y140.43 E.00395
G1 X124.457 Y140.43 E.01379
G1 X124.457 Y141.599 E.03592
G1 X127.04 Y141.599 E.07935
G1 X127.04 Y140.286 E.04033
M204 S10000
G1 X126.602 Y140.664 F42000
; LINE_WIDTH: 0.540621
G1 F5760
M204 S6000
G1 X125.334 Y140.664 E.05142
G1 X125.307 Y140.721 E.00259
G1 X125.02 Y140.857 E.01287
G1 X124.894 Y140.879 E.00517
G1 X124.894 Y141.161 E.01147
G1 X126.602 Y141.161 E.06926
G1 X126.602 Y140.724 E.01775
; WIPE_START
G1 F7233.26
G1 X126.602 Y141.161 E-.16632
G1 X125.04 Y141.161 E-.59368
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.035 Y142.475 Z8.4 F42000
G1 Z8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280566
G1 F5760
M204 S6000
G1 X131.346 Y142.475 E.06413
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X129.346 Y142.475 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/75
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z8.4 I.775 J.938 P1  F42000
G1 X131.204 Y140.94 Z8.4
G1 Z8.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5737
M204 S5000
G1 X131.204 Y142.16 E.03749
G1 X127.484 Y142.16 E.1143
G1 X127.484 Y140.94 E.03749
G1 X131.144 Y140.94 E.11245
; WIPE_START
G1 F9547.055
M204 S6000
G1 X131.204 Y142.16 E-.46416
G1 X130.426 Y142.16 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.154 Y134.873 Z8.6 F42000
G1 X125.52 Y126.427 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5737
M204 S6000
G1 X125.128 Y126.427 E.01301
G1 X125.128 Y116.573 E.32688
G1 X129.282 Y116.573 E.1378
G1 X129.282 Y126.448 E.32757
G1 X131.596 Y126.448 E.07676
G1 X131.596 Y128.452 E.06648
G1 X127.092 Y128.452 E.1494
G1 X127.092 Y126.427 E.06717
G1 X125.58 Y126.427 E.05016
; WIPE_START
G1 F8843.478
G1 X125.128 Y126.427 E-.17179
G1 X125.128 Y124.879 E-.58821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.484 Y128.06 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5737
M204 S5000
G1 X127.484 Y126.84 E.03749
G1 X131.204 Y126.84 E.1143
G1 X131.204 Y128.06 E.03749
G1 X127.544 Y128.06 E.11245
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.484 Y126.84 E-.46416
G1 X128.263 Y126.84 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.52 Y126.035 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
G1 F5737
M204 S5000
G1 X125.52 Y116.965 E.2787
G1 X128.89 Y116.965 E.10355
G1 X128.89 Y126.035 E.2787
G1 X125.58 Y126.035 E.10171
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.567 Y124.035 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.735 Y131.353 Z8.6 F42000
G1 X130.01 Y139.035 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5737
M204 S6000
G1 X130.01 Y139.834 E.02651
G1 X124.938 Y139.834 E.16826
G1 X124.938 Y129.166 E.35389
G1 X130.01 Y129.166 E.16826
G1 X130.01 Y138.975 E.32539
M204 S10000
G1 X129.603 Y139.035 F42000
G1 F5737
M204 S6000
G1 X129.603 Y139.427 E.01301
G1 X125.345 Y139.427 E.14125
G1 X125.345 Y129.573 E.32688
G1 X129.603 Y129.573 E.14125
G1 X129.603 Y138.975 E.31188
M204 S250
G1 X129.211 Y139.035 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5737
M204 S5000
G1 X125.737 Y139.035 E.10675
G1 X125.737 Y138.994 E.00126
G1 X125.737 Y130.006 E.27618
G1 X125.737 Y129.965 E.00126
G1 X129.211 Y129.965 E.10675
G1 X129.211 Y138.975 E.27685
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.212 Y139.01 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.091 Y141.991 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5737
M204 S6000
G1 X124.091 Y114.009 E.9282
G1 X131.577 Y114.009 E.24833
G1 X131.577 Y126.041 E.3991
G1 X129.689 Y126.041 E.06263
G1 X129.689 Y116.166 E.32757
G1 X124.721 Y116.166 E.16481
G1 X124.721 Y126.834 E.35389
G1 X126.685 Y126.834 E.06516
G1 X126.685 Y128.859 E.06717
G1 X131.577 Y128.859 E.16228
G1 X131.577 Y140.141 E.37424
G1 X126.685 Y140.141 E.16228
G1 X126.685 Y141.991 E.06136
G1 X124.151 Y141.991 E.08406
M204 S10000
G1 X123.684 Y142.398 F42000
G1 F5737
M204 S6000
G1 X123.684 Y113.602 E.9552
G1 X131.984 Y113.602 E.27533
G1 X131.984 Y142.398 E.95519
G1 X131.596 Y142.398 E.01288
G1 X131.596 Y140.548 E.06136
G1 X127.092 Y140.548 E.1494
G1 X127.092 Y142.398 E.06136
G1 X123.744 Y142.398 E.11106
M204 S250
G1 X123.436 Y142.783 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5737
M204 S5000
G3 X123.292 Y142.59 I.058 J-.194 E.00793
G1 X123.292 Y113.407 E.8967
G3 X123.482 Y113.21 I.2 J.003 E.00926
G1 X132.181 Y113.21 E.26728
G3 X132.376 Y113.41 I-.005 J.201 E.00951
G1 X132.37 Y142.647 E.89838
G3 X132.184 Y142.79 I-.192 J-.059 E.00767
G1 X123.496 Y142.783 E.26696
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.329 Y142.71 E-.06923
G1 X123.292 Y142.59 E-.04785
G1 X123.292 Y140.898 E-.64292
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


G1 X124.515 Y140.038 F42000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.48257
G1 F5737
M204 S6000
G1 X124.515 Y128.962 E.39678
M204 S10000
G1 X124.406 Y127.038 F42000
; LINE_WIDTH: 0.26563
G1 F5737
M204 S6000
G1 X124.406 Y115.962 E.20099
M204 S10000
G1 X127.226 Y114.358 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5737
M204 S6000
G1 X125.598 Y114.358 E.05401
G1 X125.01 Y114.897 E.02646
G2 X124.635 Y115.614 I.726 J.835 E.02747
G1 X124.887 Y115.614 E.00836
G1 X124.887 Y115.818 E.00675
G1 X127.515 Y115.818 E.08717
G1 X127.656 Y115.552 E.00996
G1 X128.37 Y114.897 E.03215
G2 X128.711 Y114.358 I-.516 J-.705 E.02168
G1 X130.839 Y114.358 E.07057
G1 X130.251 Y114.897 E.02646
G2 X129.895 Y115.818 I.634 J.774 E.03424
G1 X130.038 Y115.818 E.00473
G2 X130.276 Y116.862 I1.109 J.296 E.03699
G3 X131.229 Y117.805 I-2.966 J3.951 E.0446
G1 X131.229 Y118.983 E.03908
G1 X130.965 Y119.483 E.01875
G2 X130.038 Y120.395 I2.866 J3.843 E.04329
G1 X130.038 Y121.652 E.04168
G1 X130.276 Y122.104 E.01695
G3 X131.229 Y123.046 I-2.965 J3.951 E.0446
G1 X131.229 Y124.225 E.03908
G1 X130.965 Y124.724 E.01875
G2 X130.038 Y125.637 I2.867 J3.843 E.04329
G1 X130.038 Y124.008 E.05401
; WIPE_START
G1 F8843.478
G1 X130.038 Y125.637 E-.61876
G1 X130.303 Y125.376 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.086 Y126.437 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.45586
G1 F5737
M204 S6000
G1 X127.288 Y126.437 E.06049
; WIPE_START
G1 F8717.973
G1 X129.086 Y126.437 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.293 Y127.992 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F5737
M204 S6000
G1 X126.293 Y127.226 E.02353
G1 X124.931 Y127.226 E.04185
G1 X124.827 Y127.41 E.00649
G1 X124.483 Y127.43 E.01056
G1 X124.483 Y128.57 E.03505
G1 X124.993 Y128.573 E.01566
G1 X125.077 Y128.611 E.00283
G1 X125.163 Y128.774 E.00565
G1 X126.293 Y128.774 E.03473
G1 X126.293 Y128.052 E.02218
M204 S10000
G1 X125.916 Y127.992 F42000
G1 F5737
M204 S6000
G1 X125.916 Y127.603 E.01194
G1 X125.137 Y127.603 E.02394
G1 X125.101 Y127.678 E.00255
G1 X124.86 Y127.779 E.00802
G1 X124.86 Y128.193 E.01273
G1 X125.181 Y128.239 E.00996
G1 X125.311 Y128.316 E.00464
G1 X125.35 Y128.397 E.00276
G1 X125.916 Y128.397 E.01739
G1 X125.916 Y128.052 E.01059
M204 S10000
G1 X125.552 Y127.949 F42000
; LINE_WIDTH: 0.44324
G1 F5737
M204 S6000
G2 X125.543 Y128.035 I-.025 J.041 E.00628
; WIPE_START
G1 F8992.805
G1 X125.502 Y128.035 E-.16018
G1 X125.477 Y127.992 E-.19995
G1 X125.502 Y127.949 E-.19995
G1 X125.552 Y127.949 E-.19993
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.402 Y129.251 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
; LINE_WIDTH: 0.41999
G1 F5737
M204 S6000
G1 X130.402 Y139.749 E.32255
G1 X131.185 Y139.749 E.02405
G1 X131.185 Y129.251 E.32255
G1 X130.462 Y129.251 E.02221
M204 S10000
G1 X130.794 Y139.357 F42000
; LINE_WIDTH: 0.44868
G1 F5737
M204 S6000
G1 X130.794 Y129.703 E.31923
; WIPE_START
G1 F8872.24
G1 X130.794 Y131.703 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.23 Y138.452 Z8.6 F42000
G1 X126.293 Y140.226 Z8.6
G1 Z8.2
G1 E.8 F1800
; LINE_WIDTH: 0.41999
G1 F5737
M204 S6000
G1 X125.148 Y140.226 E.03519
G1 X125.08 Y140.386 E.00533
G1 X124.96 Y140.43 E.00395
G1 X124.483 Y140.43 E.01463
G1 X124.483 Y141.599 E.03592
G1 X126.293 Y141.599 E.05561
G1 X126.293 Y140.286 E.04033
M204 S10000
G1 X125.856 Y140.664 F42000
; LINE_WIDTH: 0.54064
G1 F5737
M204 S6000
G1 X125.388 Y140.664 E.01898
G1 X125.361 Y140.721 E.00259
; LINE_WIDTH: 0.516233
G1 X125.16 Y140.77 E.00796
; LINE_WIDTH: 0.450354
G3 X124.872 Y140.818 I-.244 J-.574 E.0098
G1 X124.872 Y141.21 E.01301
; LINE_WIDTH: 0.467418
M73 P68 R6
G1 X125.196 Y141.186 E.01125
; LINE_WIDTH: 0.533414
G3 X125.856 Y141.161 I.492 J4.368 E.02641
G1 X125.856 Y140.724 E.01749
; WIPE_START
G1 F7339.542
G1 X125.856 Y141.161 E-.3029
G1 X125.52 Y141.161 E-.2321
G1 X125.196 Y141.186 E-.22501
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.288 Y142.475 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280586
G1 F5737
M204 S6000
G1 X131.4 Y142.475 E.07963
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X129.4 Y142.475 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 42/75
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z8.6 I.775 J.938 P1  F42000
G1 X131.258 Y140.94 Z8.6
G1 Z8.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5736
M204 S5000
G1 X131.258 Y142.16 E.03749
G1 X126.738 Y142.16 E.13888
G1 X126.738 Y140.94 E.03749
G1 X131.198 Y140.94 E.13703
; WIPE_START
G1 F9547.055
M204 S6000
G1 X131.258 Y142.16 E-.46416
G1 X130.479 Y142.16 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.064 Y139.035 Z8.8 F42000
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5736
M204 S6000
G1 X130.064 Y139.834 E.02651
G1 X124.992 Y139.834 E.16826
G1 X124.992 Y129.166 E.35389
G1 X130.064 Y129.166 E.16826
G1 X130.064 Y138.975 E.32539
M204 S10000
G1 X129.657 Y139.035 F42000
G1 F5736
M204 S6000
G1 X129.657 Y139.427 E.01301
G1 X125.399 Y139.427 E.14125
G1 X125.399 Y129.573 E.32688
G1 X129.657 Y129.573 E.14125
G1 X129.657 Y138.975 E.31188
M204 S250
G1 X129.265 Y139.035 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5736
M204 S5000
G1 X125.791 Y139.035 E.10675
G1 X125.791 Y138.994 E.00126
G1 X125.791 Y130.006 E.27618
G1 X125.791 Y129.965 E.00126
G1 X129.265 Y129.965 E.10675
G1 X129.265 Y138.975 E.27685
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.265 Y139.01 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.347 Y131.432 Z8.8 F42000
G1 X125.939 Y128.06 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5736
M204 S6000
G1 X125.939 Y128.859 E.02651
G1 X131.613 Y128.859 E.18822
G1 X131.613 Y140.141 E.37424
G1 X125.939 Y140.141 E.18822
G1 X125.939 Y141.991 E.06136
G1 X124.118 Y141.991 E.06041
G1 X124.118 Y114.009 E.9282
G1 X131.613 Y114.009 E.24864
G1 X131.613 Y126.041 E.39911
G1 X129.689 Y126.041 E.06381
G1 X129.689 Y116.166 E.32757
G1 X124.721 Y116.166 E.16481
G1 X124.721 Y126.834 E.35389
G1 X125.939 Y126.834 E.0404
G1 X125.939 Y128 E.03867
; WIPE_START
G1 F8843.478
G1 X125.939 Y128.859 E-.32648
G1 X127.08 Y128.859 E-.43352
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.52 Y126.427 Z8.8 F42000
G1 Z8.4
G1 E.8 F1800
G1 F5736
M204 S6000
G1 X125.128 Y126.427 E.01301
G1 X125.128 Y116.573 E.32688
G1 X129.282 Y116.573 E.1378
G1 X129.282 Y126.448 E.32757
G1 X131.65 Y126.448 E.07853
G1 X131.65 Y128.452 E.06648
G1 X126.346 Y128.452 E.17594
G1 X126.346 Y126.427 E.06717
G1 X125.58 Y126.427 E.0254
; WIPE_START
G1 F8843.478
G1 X125.128 Y126.427 E-.17179
G1 X125.128 Y124.879 E-.58821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.738 Y128.06 Z8.8 F42000
G1 Z8.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5736
M204 S5000
G1 X126.738 Y126.84 E.03749
G1 X131.258 Y126.84 E.13888
G1 X131.258 Y128.06 E.03749
G1 X126.798 Y128.06 E.13703
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.738 Y126.84 E-.46416
G1 X127.517 Y126.84 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.52 Y126.035 Z8.8 F42000
G1 Z8.4
G1 E.8 F1800
G1 F5736
M204 S5000
G1 X125.52 Y116.965 E.2787
G1 X128.89 Y116.965 E.10355
G1 X128.89 Y126.035 E.2787
G1 X125.58 Y126.035 E.10171
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.567 Y124.035 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.799 Y131.629 Z8.8 F42000
G1 X123.711 Y142.398 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5736
M204 S6000
G1 X123.711 Y113.602 E.9552
G1 X132.02 Y113.602 E.27564
G1 X132.02 Y142.398 E.95519
G1 X131.65 Y142.398 E.01229
G1 X131.65 Y140.548 E.06136
G1 X126.346 Y140.548 E.17594
G1 X126.346 Y142.398 E.06136
G1 X123.771 Y142.398 E.08543
M204 S250
G1 X123.52 Y142.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5736
M204 S5000
G3 X123.319 Y142.59 I-.001 J-.2 E.00969
G1 X123.319 Y113.408 E.8967
G3 X123.508 Y113.21 I.2 J.003 E.00926
G1 X132.263 Y113.217 E.26901
G3 X132.412 Y113.41 I-.045 J.189 E.00812
G1 X132.406 Y142.647 E.89838
G3 X132.22 Y142.79 I-.193 J-.06 E.00766
G1 X123.58 Y142.79 E.26549
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.431 Y142.772 E-.05689
G1 X123.377 Y142.735 E-.02477
G1 X123.33 Y142.662 E-.03306
G1 X123.319 Y142.59 E-.02785
G1 X123.319 Y140.965 E-.61744
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


G1 X124.555 Y140.038 F42000
G1 Z8.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.50983
G1 F5736
M204 S6000
G1 X124.555 Y128.962 E.42138
M204 S10000
G1 X125.547 Y127.598 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F5736
M204 S6000
G1 X125.547 Y127.226 E.01143
G1 X124.931 Y127.226 E.01892
G1 X124.888 Y127.361 E.00436
G1 X124.743 Y127.43 E.00493
G1 X124.51 Y127.43 E.00716
G1 X124.51 Y128.57 E.03505
G1 X125.017 Y128.57 E.01559
G1 X125.18 Y128.67 E.00586
G1 X125.217 Y128.774 E.00338
G1 X125.547 Y128.774 E.01015
G1 X125.547 Y127.658 E.03428
M204 S10000
G1 X125.193 Y128.321 F42000
; LINE_WIDTH: 0.37294
G1 F5736
M204 S6000
G1 X125.193 Y127.598 E.01943
G1 X125.16 Y127.586 E.00094
G1 X124.962 Y127.737 E.00671
G1 X124.863 Y127.758 E.0027
G1 X124.863 Y128.217 E.01235
G1 X125.025 Y128.217 E.00434
G1 X125.142 Y128.289 E.00371
M204 S10000
G1 X124.419 Y127.038 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.2393
G1 F5736
M204 S6000
G1 X124.419 Y115.962 E.17723
M204 S10000
G1 X127.098 Y114.358 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5736
M204 S6000
G1 X125.47 Y114.358 E.05401
G1 X124.669 Y114.897 E.03202
G2 X124.466 Y115.614 I.415 J.505 E.02631
G1 X124.887 Y115.614 E.01398
G1 X124.887 Y115.818 E.00675
G1 X127.541 Y115.818 E.08802
G1 X127.738 Y115.552 E.01096
G1 X128.71 Y114.897 E.03891
G2 X128.943 Y114.358 I-.294 J-.447 E.02063
G1 X130.711 Y114.358 E.05864
G1 X129.91 Y114.897 E.03202
G2 X129.755 Y115.818 I.573 J.57 E.03302
G1 X130.038 Y115.818 E.00938
G1 X130.038 Y116.43 E.02031
G1 X130.358 Y116.862 E.01786
G1 X131.265 Y117.473 E.03626
G1 X131.265 Y118.968 E.04959
G1 X130.883 Y119.483 E.02127
G1 X130.038 Y120.052 E.03381
G1 X130.038 Y121.671 E.05369
G1 X130.358 Y122.104 E.01786
G1 X131.265 Y122.714 E.03626
G1 X131.265 Y124.209 E.04959
G1 X130.883 Y124.724 E.02127
G1 X130.038 Y125.294 E.03381
G1 X130.038 Y123.665 E.05401
; WIPE_START
G1 F8843.478
G1 X130.038 Y125.294 E-.61876
G1 X130.346 Y125.086 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.086 Y126.437 Z8.8 F42000
G1 Z8.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.45586
G1 F5736
M204 S6000
G1 X126.542 Y126.437 E.08561
; WIPE_START
G1 F8717.973
G1 X128.542 Y126.437 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.456 Y129.251 Z8.8 F42000
G1 Z8.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F5736
M204 S6000
G1 X130.456 Y139.749 E.32255
G1 X131.221 Y139.749 E.02351
G1 X131.221 Y129.251 E.32255
G1 X130.516 Y129.251 E.02166
M204 S10000
G1 X130.839 Y139.366 F42000
; LINE_WIDTH: 0.43084
G1 F5736
M204 S6000
G1 X130.839 Y129.694 E.30576
; WIPE_START
G1 F9280.263
G1 X130.839 Y131.694 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.816 Y138.18 Z8.8 F42000
G1 X125.547 Y140.226 Z8.8
G1 Z8.4
G1 E.8 F1800
; LINE_WIDTH: 0.41999
G1 F5736
M204 S6000
G1 X125.202 Y140.241 E.01061
G1 X125.18 Y140.33 E.0028
G1 X125.013 Y140.43 E.00597
G1 X124.51 Y140.43 E.01547
G1 X124.51 Y141.599 E.03592
G1 X125.547 Y141.599 E.03187
G1 X125.547 Y140.286 E.04033
M204 S10000
G1 X125.193 Y140.679 F42000
; LINE_WIDTH: 0.37294
G1 F5736
M204 S6000
G1 X125.013 Y140.783 E.00559
G1 X124.863 Y140.783 E.00403
G1 X124.863 Y141.245 E.01242
G1 X125.193 Y141.245 E.00887
G1 X125.193 Y140.739 E.0136
; WIPE_START
G1 F10908.43
G1 X125.193 Y141.245 E-.23219
G1 X124.863 Y141.245 E-.15149
G1 X124.863 Y140.783 E-.21208
G1 X125.013 Y140.783 E-.06882
G1 X125.193 Y140.679 E-.09542
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.542 Y142.475 Z8.8 F42000
G1 Z8.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280596
G1 F5736
M204 S6000
G1 X131.454 Y142.475 E.09513
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15000
G1 X129.454 Y142.475 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 43/75
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z8.8 I.775 J.938 P1  F42000
G1 X131.311 Y140.94 Z8.8
G1 Z8.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5707
M204 S5000
G1 X131.311 Y142.16 E.03749
G1 X125.992 Y142.16 E.16346
G1 X125.992 Y140.94 E.03749
G1 X131.251 Y140.94 E.16162
; WIPE_START
G1 F9547.055
M204 S6000
G1 X131.311 Y142.16 E-.46416
G1 X130.533 Y142.16 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.118 Y139.035 Z9 F42000
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5707
M204 S6000
G1 X130.118 Y139.834 E.02651
G1 X125.045 Y139.834 E.16826
G1 X125.045 Y129.166 E.35389
G1 X130.118 Y129.166 E.16826
G1 X130.118 Y138.975 E.32539
M204 S10000
G1 X129.71 Y139.035 F42000
G1 F5707
M204 S6000
G1 X129.71 Y139.427 E.01301
G1 X125.452 Y139.427 E.14125
G1 X125.452 Y129.573 E.32688
G1 X129.71 Y129.573 E.14125
G1 X129.71 Y138.975 E.31188
M204 S250
G1 X129.318 Y139.035 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5707
M204 S5000
G1 X125.844 Y139.035 E.10675
G1 X125.844 Y138.994 E.00126
G1 X125.844 Y130.006 E.27618
G1 X125.844 Y129.965 E.00126
G1 X129.318 Y129.965 E.10675
G1 X129.318 Y138.975 E.27685
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.319 Y139.01 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.864 Y131.517 Z9 F42000
G1 X125.192 Y128.06 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5707
M204 S6000
G1 X125.192 Y128.859 E.02651
G1 X131.649 Y128.859 E.21417
G1 X131.649 Y140.141 E.37424
G1 X125.192 Y140.141 E.21417
G1 X125.192 Y141.991 E.06136
G1 X124.144 Y141.991 E.03478
G1 X124.144 Y114.009 E.9282
M73 P69 R6
G1 X131.649 Y114.009 E.24895
G1 X131.649 Y126.041 E.39911
G1 X129.689 Y126.041 E.065
G1 X129.689 Y116.166 E.32757
G1 X124.721 Y116.166 E.16481
G1 X124.721 Y126.834 E.35389
G1 X125.192 Y126.834 E.01564
G1 X125.192 Y128 E.03867
; WIPE_START
G1 F8843.478
G1 X125.192 Y128.859 E-.32648
G1 X126.333 Y128.859 E-.43353
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.52 Y126.427 Z9 F42000
G1 Z8.6
G1 E.8 F1800
G1 F5707
M204 S6000
G1 X125.128 Y126.427 E.01301
G1 X125.128 Y116.573 E.32688
G1 X129.282 Y116.573 E.1378
G1 X129.282 Y126.448 E.32757
G1 X131.703 Y126.448 E.08031
G1 X131.703 Y128.452 E.06648
G1 X125.6 Y128.452 E.20248
G1 X125.6 Y126.427 E.06717
G1 X125.58 Y126.427 E.00064
; WIPE_START
G1 F8843.478
G1 X125.128 Y126.427 E-.17179
G1 X125.128 Y124.879 E-.58821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.992 Y128.06 Z9 F42000
G1 Z8.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5707
M204 S5000
G1 X125.992 Y126.84 E.03749
G1 X131.311 Y126.84 E.16346
G1 X131.311 Y128.06 E.03749
G1 X126.052 Y128.06 E.16162
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.992 Y126.84 E-.46416
G1 X126.77 Y126.84 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.52 Y126.035 Z9 F42000
G1 Z8.6
G1 E.8 F1800
G1 F5707
M204 S5000
G1 X125.52 Y116.965 E.2787
G1 X128.89 Y116.965 E.10355
G1 X128.89 Y126.035 E.2787
G1 X125.58 Y126.035 E.10171
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.567 Y124.035 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.81 Y131.63 Z9 F42000
G1 X123.737 Y142.398 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5707
M204 S6000
G1 X123.737 Y113.602 E.9552
G1 X132.056 Y113.602 E.27596
G1 X132.056 Y142.398 E.95519
G1 X131.703 Y142.398 E.01169
G1 X131.703 Y140.548 E.06136
G1 X125.6 Y140.548 E.20248
G1 X125.6 Y142.398 E.06136
G1 X123.797 Y142.398 E.0598
M204 S250
G1 X123.489 Y142.783 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5707
M204 S5000
G3 X123.345 Y142.59 I.059 J-.195 E.00792
G1 X123.345 Y113.407 E.8967
G3 X123.535 Y113.21 I.2 J.003 E.00926
G1 X132.299 Y113.217 E.26931
G3 X132.448 Y113.41 I-.045 J.189 E.00811
G1 X132.441 Y142.647 E.89837
G3 X132.256 Y142.79 I-.193 J-.06 E.00766
G1 X123.549 Y142.783 E.26754
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.382 Y142.711 E-.0691
G1 X123.345 Y142.59 E-.048
G1 X123.345 Y140.898 E-.64289
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


G1 X124.668 Y140.307 F42000
G1 Z8.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.659556
G1 F5707
M204 S6000
G1 X124.714 Y140.275 E.00282
; LINE_WIDTH: 0.609997
G1 X124.76 Y140.243 E.00259
; LINE_WIDTH: 0.560437
G1 X124.806 Y140.21 E.00236
; LINE_WIDTH: 0.510878
G1 X124.851 Y140.178 E.00214
; LINE_WIDTH: 0.461319
G1 X124.897 Y140.146 E.00191
; LINE_WIDTH: 0.411759
G1 X124.943 Y140.113 E.00169
; LINE_WIDTH: 0.3622
G1 X124.989 Y140.081 E.00146
; WIPE_START
G1 F11275.38
G1 X124.943 Y140.113 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.507 Y142.475 Z9 F42000
G1 Z8.6
G1 E.8 F1800
; LINE_WIDTH: 0.280616
G1 F5707
M204 S6000
G1 X125.796 Y142.475 E.11063
; WIPE_START
G1 F15000
G1 X127.796 Y142.475 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.668 Y141.787 Z9 F42000
G1 Z8.6
G1 E.8 F1800
; LINE_WIDTH: 0.68434
G1 F5612.547
M204 S6000
G1 X124.668 Y140.307 E.07735
; LINE_WIDTH: 0.6598
G1 F5707
G1 X124.644 Y140.218 E.00469
; LINE_WIDTH: 0.61072
G1 X124.619 Y140.128 E.00431
; LINE_WIDTH: 0.56164
G1 X124.595 Y140.038 E.00394
; LINE_WIDTH: 0.537295
G1 X124.595 Y128.962 E.44617
G1 X124.619 Y128.872 E.00376
; LINE_WIDTH: 0.610708
G1 X124.644 Y128.782 E.00431
; LINE_WIDTH: 0.659793
G1 X124.668 Y128.693 E.00468
M204 S10000
G1 X124.989 Y128.919 F42000
; LINE_WIDTH: 0.3622
G1 F5707
M204 S6000
G1 X124.943 Y128.887 E.00146
; LINE_WIDTH: 0.41176
G1 X124.897 Y128.854 E.00169
; LINE_WIDTH: 0.46132
G1 X124.851 Y128.822 E.00191
; LINE_WIDTH: 0.51088
G1 X124.806 Y128.79 E.00214
; LINE_WIDTH: 0.56044
G1 X124.76 Y128.757 E.00237
; LINE_WIDTH: 0.61
G1 X124.714 Y128.725 E.00259
; LINE_WIDTH: 0.683528
G1 F5619.665
G1 X124.668 Y128.693 E.00293
G1 X124.668 Y127.038 E.08639
M204 S10000
G1 X124.518 Y127.208 F42000
; LINE_WIDTH: 0.361765
G1 F5707
M204 S6000
G1 X124.496 Y127.165 E.00123
; LINE_WIDTH: 0.319255
G1 X124.475 Y127.123 E.00107
; LINE_WIDTH: 0.276745
G1 X124.454 Y127.08 E.00091
; LINE_WIDTH: 0.213061
G1 X124.433 Y127.038 E.00066
G1 X124.433 Y115.962 E.15355
M204 S10000
G1 X131.301 Y115.277 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5707
M204 S6000
G1 X131.301 Y114.358 E.03049
G2 X129.966 Y114.573 I-.355 J2.051 E.04568
G3 X129.31 Y114.387 I-.196 J-.557 E.02408
G1 X125.35 Y114.358 E.13138
G3 X124.492 Y114.586 I-.835 J-1.412 E.02981
G1 X124.492 Y115.614 E.03411
G1 X124.887 Y115.614 E.01311
G1 X124.887 Y115.818 E.00675
G1 X127.525 Y115.818 E.08748
G3 X128.655 Y115.221 I1.429 J1.34 E.04319
G3 X129.567 Y115.818 I.113 J.822 E.03941
G1 X130.038 Y115.818 E.01562
G1 X130.038 Y116.513 E.02306
G2 X131.276 Y117.193 I1.605 J-1.454 E.04774
G1 X131.301 Y119.038 E.06119
G3 X130.038 Y119.789 I-1.659 J-1.351 E.04976
G1 X130.038 Y121.754 E.06518
G2 X131.276 Y122.435 I1.605 J-1.454 E.04774
G1 X131.301 Y124.279 E.06119
G3 X130.038 Y125.03 I-1.659 J-1.351 E.04976
G1 X130.038 Y125.693 E.02197
G1 X131.004 Y125.693 E.03205
; WIPE_START
G1 F8843.478
G1 X130.038 Y125.693 E-.36714
G1 X130.038 Y125.03 E-.25162
G1 X130.389 Y124.91 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.086 Y126.437 Z9 F42000
G1 Z8.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.45586
G1 F5707
M204 S6000
G1 X125.796 Y126.437 E.11072
; WIPE_START
G1 F8717.973
G1 X127.796 Y126.437 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.51 Y129.251 Z9 F42000
G1 Z8.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F5707
M204 S6000
G1 X130.51 Y139.749 E.32255
G1 X131.257 Y139.749 E.02296
G1 X131.257 Y129.251 E.32255
G1 X130.57 Y129.251 E.02111
M204 S10000
G1 X130.883 Y139.375 F42000
; LINE_WIDTH: 0.41298
G1 F5707
M204 S6000
G1 X130.883 Y129.685 E.29222
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9728.152
G1 X130.883 Y131.685 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 44/75
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z9 I-1.215 J.063 P1  F42000
G1 X131.365 Y140.94 Z9
G1 Z8.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5716
M204 S5000
G1 X131.365 Y142.16 E.03749
G1 X125.245 Y142.16 E.18804
G1 X125.245 Y140.94 E.03749
G1 X131.305 Y140.94 E.1862
; WIPE_START
G1 F9547.055
M204 S6000
G1 X131.365 Y142.16 E-.46416
G1 X130.586 Y142.16 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.685 Y135.101 Z9.2 F42000
G1 X125.245 Y129.166 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5716
M204 S6000
G1 X130.171 Y129.166 E.1634
G1 X130.171 Y139.834 E.35389
G1 X125.099 Y139.834 E.16826
G1 X125.099 Y129.166 E.35389
G1 X125.185 Y129.166 E.00287
; WIPE_START
G1 F8843.478
G1 X127.185 Y129.166 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.115 Y136.55 Z9.2 F42000
G1 X129.764 Y139.035 Z9.2
G1 Z8.8
G1 E.8 F1800
G1 F5716
M204 S6000
G1 X129.764 Y139.427 E.01301
G1 X125.506 Y139.427 E.14125
G1 X125.506 Y129.573 E.32688
G1 X129.764 Y129.573 E.14125
G1 X129.764 Y138.975 E.31188
M204 S250
G1 X129.372 Y139.035 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5716
M204 S5000
G1 X125.898 Y139.035 E.10675
G1 X125.898 Y138.994 E.00126
G1 X125.898 Y130.006 E.27618
G1 X125.898 Y129.965 E.00126
G1 X129.372 Y129.965 E.10675
G1 X129.372 Y138.975 E.27685
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.372 Y139.01 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.402 Y131.636 Z9.2 F42000
G1 X124.446 Y128.06 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5716
M204 S6000
G1 X124.446 Y128.859 E.02651
G1 X131.685 Y128.859 E.24011
G1 X131.685 Y140.141 E.37424
G1 X124.446 Y140.141 E.24011
G1 X124.446 Y141.991 E.06137
G1 X124.17 Y141.991 E.00915
G1 X124.17 Y114.009 E.9282
G1 X131.685 Y114.009 E.24926
G1 X131.685 Y126.041 E.39911
G1 X129.689 Y126.041 E.06618
G1 X129.689 Y116.166 E.32757
G1 X124.721 Y116.166 E.16481
G1 X124.721 Y126.041 E.32757
G1 X124.446 Y126.041 E.00912
G1 X124.446 Y128 E.06499
; WIPE_START
G1 F8843.478
G1 X124.446 Y128.859 E-.32648
G1 X125.587 Y128.859 E-.43352
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.128 Y126.035 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
G1 F5716
M204 S6000
G1 X125.128 Y116.573 E.31387
G1 X129.282 Y116.573 E.1378
G1 X129.282 Y126.448 E.32757
G1 X131.757 Y126.448 E.08209
G1 X131.757 Y128.452 E.06648
G1 X124.853 Y128.452 E.22901
G1 X124.853 Y126.448 E.06648
G1 X125.128 Y126.448 E.00912
G1 X125.128 Y126.095 E.01171
; WIPE_START
G1 F8843.478
G1 X125.128 Y124.095 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.245 Y128.06 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5716
M204 S5000
G1 X125.245 Y126.84 E.03749
G1 X131.365 Y126.84 E.18804
G1 X131.365 Y128.06 E.03749
G1 X125.305 Y128.06 E.1862
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.245 Y126.84 E-.46416
G1 X126.024 Y126.84 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.52 Y126.035 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
G1 F5716
M204 S5000
G1 X125.52 Y116.965 E.2787
G1 X128.89 Y116.965 E.10355
G1 X128.89 Y126.035 E.2787
G1 X125.58 Y126.035 E.10171
; WIPE_START
M73 P70 R6
G1 F9547.055
M204 S6000
G1 X125.567 Y124.035 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.821 Y131.631 Z9.2 F42000
G1 X123.763 Y142.398 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5716
M204 S6000
G1 X123.763 Y113.602 E.9552
G1 X132.092 Y113.602 E.27627
G1 X132.092 Y142.398 E.95519
G1 X131.757 Y142.398 E.0111
G1 X131.757 Y140.548 E.06135
G1 X124.853 Y140.548 E.22901
G1 X124.853 Y142.398 E.06137
G1 X123.823 Y142.398 E.03416
M204 S250
G1 X123.515 Y142.783 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5716
M204 S5000
G3 X123.371 Y142.59 I.059 J-.194 E.00793
G1 X123.371 Y113.407 E.8967
G3 X123.561 Y113.21 I.2 J.003 E.00926
G1 X132.335 Y113.217 E.2696
G3 X132.484 Y113.41 I-.046 J.189 E.0081
G1 X132.477 Y142.647 E.89838
G3 X132.292 Y142.79 I-.192 J-.059 E.00764
G1 X123.575 Y142.783 E.26786
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.408 Y142.711 E-.06914
G1 X123.371 Y142.59 E-.04797
G1 X123.371 Y140.898 E-.64289
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


G1 X124.635 Y139.937 F42000
G1 Z8.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.56435
G1 F5716
M204 S6000
G1 X124.635 Y129.063 E.46206
; WIPE_START
G1 F6904.091
G1 X124.635 Y131.063 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.324 Y126.437 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
; LINE_WIDTH: 0.45586
G1 F5716
M204 S6000
G1 X129.086 Y126.437 E.12658
; WIPE_START
G1 F8717.973
G1 X127.086 Y126.437 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.813 Y125.693 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5716
M204 S6000
G1 X130.038 Y125.693 E.02572
G1 X130.038 Y124.84 E.02829
G1 X130.621 Y124.767 E.01949
G1 X131.336 Y124.33 E.02782
G1 X131.336 Y122.21 E.07032
G1 X131.276 Y122.228 E.00209
G3 X130.038 Y121.819 I-.119 J-1.717 E.04437
G1 X130.038 Y119.598 E.07366
G1 X130.621 Y119.526 E.01949
G1 X131.336 Y119.089 E.02782
G1 X131.336 Y116.969 E.07032
G1 X131.276 Y116.987 E.00209
G3 X130.038 Y116.578 I-.119 J-1.717 E.04437
G1 X130.038 Y115.818 E.02521
G1 X129.334 Y115.818 E.02335
G2 X128.655 Y115.428 I-1.036 J1.017 E.02628
G2 X127.451 Y115.818 I-.126 J1.665 E.04305
G1 X125.823 Y115.818 E.05401
M204 S10000
G1 X124.446 Y115.962 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.18664
G1 F5716
M204 S6000
G1 X124.446 Y125.837 E.11565
; WIPE_START
G1 F15000
G1 X124.446 Y123.837 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.161 Y128.896 Z9.2 F42000
G1 X130.563 Y129.251 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F5716
M204 S6000
G1 X130.563 Y139.749 E.32255
G1 X131.292 Y139.749 E.02241
G1 X131.292 Y129.251 E.32255
G1 X130.623 Y129.251 E.02056
M204 S10000
G1 X130.928 Y139.384 F42000
; LINE_WIDTH: 0.39514
G1 F5716
M204 S6000
G1 X130.928 Y129.676 E.27864
; WIPE_START
G1 F10220.884
G1 X130.928 Y131.676 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.374 Y139.295 Z9.2 F42000
G1 X131.561 Y142.475 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280626
G1 F5716
M204 S6000
G1 X125.049 Y142.475 E.12613
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X127.049 Y142.475 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 45/75
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z9.2 I.403 J1.148 P1  F42000
G1 X131.419 Y140.94 Z9.2
G1 Z9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5612
M204 S5000
G1 X131.419 Y142.16 E.03749
G1 X124.499 Y142.16 E.21262
G1 X124.499 Y140.94 E.03749
G1 X131.359 Y140.94 E.21078
; WIPE_START
G1 F9547.055
M204 S6000
G1 X131.419 Y142.16 E-.46416
G1 X130.64 Y142.16 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.923 Y135.028 Z9.4 F42000
G1 X124.499 Y126.041 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5612
M204 S6000
G1 X124.197 Y126.041 E.01002
G1 X124.197 Y114.009 E.39911
G1 X131.72 Y114.009 E.24957
G1 X131.72 Y126.041 E.39911
G1 X129.689 Y126.041 E.06737
G1 X129.689 Y116.166 E.32757
G1 X124.721 Y116.166 E.16481
G1 X124.721 Y126.041 E.32757
G1 X124.559 Y126.041 E.00538
M204 S10000
G1 X125.128 Y126.035 F42000
G1 F5612
M204 S6000
G1 X125.128 Y116.573 E.31387
G1 X129.282 Y116.573 E.1378
G1 X129.282 Y126.448 E.32757
G1 X131.811 Y126.448 E.08387
G1 X131.811 Y128.452 E.06648
G1 X124.107 Y128.452 E.25555
G1 X124.107 Y126.448 E.06648
G1 X125.128 Y126.448 E.03388
G1 X125.128 Y126.095 E.01171
; WIPE_START
G1 F8843.478
G1 X125.128 Y124.095 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.499 Y128.06 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5612
M204 S5000
G1 X124.499 Y126.84 E.03749
G1 X131.419 Y126.84 E.21262
G1 X131.419 Y128.06 E.03749
G1 X124.559 Y128.06 E.21078
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.499 Y126.84 E-.46416
G1 X125.277 Y126.84 E-.29585
; WIPE_END
M73 P70 R5
G1 E-.04 F1800
M204 S10000
G1 X125.52 Y126.035 Z9.4 F42000
G1 Z9
G1 E.8 F1800
G1 F5612
M204 S5000
G1 X125.52 Y116.965 E.2787
G1 X128.89 Y116.965 E.10355
G1 X128.89 Y126.035 E.2787
G1 X125.58 Y126.035 E.10171
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.567 Y124.035 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.83 Y131.324 Z9.4 F42000
G1 X130.225 Y139.035 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5612
M204 S6000
G1 X130.225 Y139.834 E.02651
G1 X125.152 Y139.834 E.16826
G1 X125.152 Y129.166 E.35389
G1 X130.225 Y129.166 E.16826
G1 X130.225 Y138.975 E.32539
M204 S10000
G1 X129.818 Y139.035 F42000
G1 F5612
M204 S6000
G1 X129.818 Y139.427 E.01301
G1 X125.559 Y139.427 E.14125
G1 X125.559 Y129.573 E.32688
G1 X129.818 Y129.573 E.14125
G1 X129.818 Y138.975 E.31188
M204 S250
G1 X129.426 Y139.035 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5612
M204 S5000
G1 X125.952 Y139.035 E.10675
G1 X125.952 Y138.994 E.00126
G1 X125.952 Y130.006 E.27618
G1 X125.952 Y129.965 E.00126
G1 X129.426 Y129.965 E.10675
G1 X129.426 Y138.975 E.27685
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.426 Y139.01 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.418 Y140.141 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5612
M204 S6000
G1 X124.197 Y140.141 E.23956
G1 X124.197 Y128.859 E.37424
G1 X131.72 Y128.859 E.24957
G1 X131.72 Y140.141 E.37424
G1 X131.478 Y140.141 E.00802
; WIPE_START
G1 F8843.478
G1 X129.478 Y140.141 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.79 Y142.398 Z9.4 F42000
G1 Z9
G1 E.8 F1800
G1 F5612
M204 S6000
G1 X123.79 Y113.602 E.9552
G1 X132.127 Y113.602 E.27658
G1 X132.127 Y142.398 E.95519
G1 X131.811 Y142.398 E.01051
G1 X131.811 Y140.548 E.06135
G1 X124.107 Y140.548 E.25555
G1 X124.107 Y142.398 E.06137
G1 X123.85 Y142.398 E.00853
M204 S250
G1 X123.541 Y142.783 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5612
M204 S5000
G3 X123.397 Y142.59 I.06 J-.194 E.00791
G1 X123.397 Y113.407 E.8967
G3 X123.587 Y113.21 I.2 J.003 E.00925
G1 X132.371 Y113.217 E.2699
G3 X132.519 Y113.41 I-.046 J.189 E.0081
G1 X132.513 Y142.647 E.89838
G3 X132.328 Y142.79 I-.195 J-.063 E.0076
G1 X123.601 Y142.783 E.26817
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.435 Y142.711 E-.06896
G1 X123.397 Y142.59 E-.04802
G1 X123.397 Y140.898 E-.64302
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


M73 P71 R5
G1 X124.675 Y139.937 F42000
G1 Z9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.59161
G1 F5612
M204 S6000
G1 X124.675 Y129.063 E.48622
; WIPE_START
G1 F6561.082
G1 X124.675 Y131.063 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.324 Y126.437 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.45586
G1 F5612
M204 S6000
G1 X129.086 Y126.437 E.12658
; WIPE_START
G1 F8717.973
G1 X127.086 Y126.437 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.669 Y125.693 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5612
M204 S6000
G1 X130.038 Y125.693 E.02096
G1 X130.038 Y124.696 E.03305
G1 X130.621 Y124.733 E.01938
G1 X131.276 Y124.491 E.02318
G1 X131.372 Y124.403 E.00432
G1 X131.372 Y122.024 E.07892
G1 X131.276 Y122.071 E.00355
G3 X130.038 Y121.897 I-.423 J-1.479 E.04271
G1 X130.038 Y119.455 E.081
G1 X130.621 Y119.492 E.01938
G1 X131.276 Y119.249 E.02318
G1 X131.372 Y119.162 E.00432
G1 X131.372 Y116.783 E.07892
G1 X131.276 Y116.83 E.00355
G3 X130.038 Y116.655 I-.423 J-1.479 E.04271
G1 X130.038 Y115.818 E.02779
G1 X129.066 Y115.818 E.03224
G2 X128 Y115.543 I-.852 J1.103 E.03753
G1 X127.31 Y115.818 E.02463
G1 X125.682 Y115.818 E.05401
M204 S10000
G1 X124.459 Y115.962 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.16031
G1 F5612
M204 S6000
G1 X124.459 Y125.837 E.09446
; WIPE_START
G1 F15000
G1 X124.459 Y123.837 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.191 Y128.877 Z9.4 F42000
G1 X130.617 Y129.251 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F5612
M204 S6000
G1 X130.617 Y139.749 E.32255
G1 X131.328 Y139.749 E.02186
G1 X131.328 Y129.251 E.32255
G1 X130.677 Y129.251 E.02002
M204 S10000
G1 X130.973 Y139.393 F42000
; LINE_WIDTH: 0.37726
G1 F5612
M204 S6000
G1 X130.973 Y129.667 E.26499
; WIPE_START
G1 F10767.481
G1 X130.973 Y131.667 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.425 Y139.286 Z9.4 F42000
G1 X131.614 Y142.475 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280646
G1 F5612
M204 S6000
G1 X124.303 Y142.475 E.14164
; CHANGE_LAYER
; Z_HEIGHT: 9.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X126.303 Y142.475 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 46/75
; update layer progress
M73 L46
M991 S0 P45 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z9.4 I1.202 J-.191 P1  F42000
G1 X124.012 Y128.06 Z9.4
G1 Z9.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5818
M204 S5000
G1 X124.012 Y126.84 E.03749
G1 X131.472 Y126.84 E.22922
G1 X131.472 Y128.06 E.03749
G1 X124.072 Y128.06 E.22738
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.012 Y126.84 E-.46416
G1 X124.791 Y126.84 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.52 Y126.035 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
G1 F5818
M204 S5000
G1 X125.52 Y116.965 E.2787
G1 X128.89 Y116.965 E.10355
G1 X128.89 Y126.035 E.2787
G1 X125.58 Y126.035 E.10171
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.567 Y124.035 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.084 Y131.241 Z9.6 F42000
G1 X131.472 Y140.94 Z9.6
G1 Z9.2
G1 E.8 F1800
G1 F5818
M204 S5000
G1 X131.472 Y142.16 E.03749
G1 X124.012 Y142.16 E.22922
G1 X124.012 Y140.94 E.03749
G1 X131.412 Y140.94 E.22738
; WIPE_START
G1 F9547.055
M204 S6000
G1 X131.472 Y142.16 E-.46416
G1 X130.694 Y142.16 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.852 Y135.076 Z9.6 F42000
G1 X124.227 Y126.041 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5818
M204 S6000
G1 X124.227 Y114.009 E.39911
G1 X131.756 Y114.009 E.24974
G1 X131.756 Y126.041 E.39911
G1 X129.689 Y126.041 E.06855
G1 X129.689 Y116.166 E.32757
G1 X124.721 Y116.166 E.16481
G1 X124.721 Y126.041 E.32757
G1 X124.287 Y126.041 E.01439
; WIPE_START
G1 F8843.478
G1 X124.277 Y124.041 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.113 Y131.127 Z9.6 F42000
G1 X130.278 Y139.035 Z9.6
G1 Z9.2
G1 E.8 F1800
G1 F5818
M204 S6000
G1 X130.278 Y139.834 E.02651
G1 X125.206 Y139.834 E.16826
G1 X125.206 Y129.166 E.35389
G1 X130.278 Y129.166 E.16826
G1 X130.278 Y138.975 E.32539
M204 S10000
G1 X129.871 Y139.035 F42000
G1 F5818
M204 S6000
G1 X129.871 Y139.427 E.01301
G1 X125.613 Y139.427 E.14125
G1 X125.613 Y129.573 E.32688
G1 X129.871 Y129.573 E.14125
G1 X129.871 Y138.975 E.31188
M204 S250
G1 X129.479 Y139.035 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5818
M204 S5000
G1 X126.005 Y139.035 E.10675
G1 X126.005 Y138.994 E.00126
G1 X126.005 Y130.006 E.27618
G1 X126.005 Y129.965 E.00126
G1 X129.479 Y129.965 E.10675
G1 X129.479 Y138.975 E.27685
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.479 Y139.01 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.472 Y140.141 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5818
M204 S6000
G1 X124.227 Y140.141 E.24032
G1 X124.227 Y128.859 E.37424
G1 X131.756 Y128.859 E.24974
G1 X131.756 Y140.141 E.37424
G1 X131.532 Y140.141 E.00743
; WIPE_START
G1 F8843.478
G1 X129.532 Y140.141 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.82 Y140.548 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
G1 F5818
M204 S6000
G1 X123.82 Y128.452 E.40124
G1 X131.864 Y128.452 E.26683
G1 X131.864 Y126.448 E.06648
G1 X129.282 Y126.448 E.08565
G1 X129.282 Y116.573 E.32757
G1 X125.128 Y116.573 E.1378
G1 X125.128 Y126.448 E.32757
G1 X123.82 Y126.448 E.04338
G1 X123.82 Y113.602 E.42611
G1 X132.163 Y113.602 E.27675
G1 X132.163 Y142.398 E.95519
G1 X131.864 Y142.398 E.00992
G1 X131.864 Y140.548 E.06135
G1 X123.88 Y140.548 E.26484
; WIPE_START
G1 F8843.478
G1 X123.87 Y138.548 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.632 Y142.79 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5818
M204 S5000
G3 X123.428 Y142.59 I-.005 J-.2 E.00979
G1 X123.428 Y113.408 E.8967
G3 X123.621 Y113.21 I.202 J.004 E.00933
G1 X132.407 Y113.217 E.26996
G3 X132.555 Y113.41 I-.046 J.189 E.00809
G1 X132.548 Y142.647 E.89838
G3 X132.363 Y142.79 I-.194 J-.061 E.00765
G1 X123.692 Y142.79 E.26641
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.564 Y142.78 E-.04883
G1 X123.489 Y142.736 E-.03329
G1 X123.44 Y142.662 E-.03377
G1 X123.428 Y142.59 E-.02772
G1 X123.428 Y140.968 E-.61639
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


G1 X123.72 Y140.744 F42000
G1 Z9.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.235375
G1 F5818
M204 S6000
G1 X123.72 Y142.356 E.02528
G1 X123.736 Y142.411 E.0009
; LINE_WIDTH: 0.28237
G1 X123.752 Y142.466 E.00112
; LINE_WIDTH: 0.280739
G1 X131.668 Y142.475 E.15341
; WIPE_START
G1 F15000
G1 X129.668 Y142.473 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.717 Y139.937 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
; LINE_WIDTH: 0.61446
G1 F5818
M204 S6000
G1 X124.717 Y129.063 E.50647
; WIPE_START
G1 F6298.772
G1 X124.717 Y131.063 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.72 Y128.256 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
; LINE_WIDTH: 0.23483
G1 F5818
M204 S6000
G1 X123.72 Y126.644 E.02521
; WIPE_START
G1 F15000
G1 X123.72 Y128.256 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.67 Y129.251 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F5818
M204 S6000
G1 X130.67 Y139.749 E.32255
G1 X131.364 Y139.749 E.02131
G1 X131.364 Y129.251 E.32255
G1 X130.73 Y129.251 E.01947
M204 S10000
M73 P72 R5
G1 X131.017 Y139.402 F42000
; LINE_WIDTH: 0.35942
G1 F5818
M204 S6000
G1 X131.017 Y129.658 E.25131
; WIPE_START
G1 F11374.408
G1 X131.017 Y131.658 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.321 Y124.057 Z9.6 F42000
G1 X130.038 Y120.971 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5818
M204 S6000
G1 X130.038 Y119.343 E.05401
G2 X131.276 Y119.358 I.635 J-1.357 E.04235
G1 X131.408 Y119.256 E.00551
G1 X131.408 Y121.84 E.08571
G3 X130.038 Y121.992 I-.856 J-1.465 E.04709
G1 X130.038 Y124.584 E.08599
G2 X131.276 Y124.599 I.635 J-1.357 E.04235
G1 X131.408 Y124.498 E.00551
G1 X131.408 Y125.693 E.03963
G1 X130.974 Y125.693 E.01438
; WIPE_START
G1 F8843.478
G1 X131.408 Y125.693 E-.16474
G1 X131.408 Y124.498 E-.45402
G1 X131.276 Y124.599 E-.06314
G1 X131.074 Y124.638 E-.0781
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.086 Y126.437 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.45586
G1 F5818
M204 S6000
G1 X125.324 Y126.437 E.12658
; WIPE_START
G1 F8717.973
G1 X127.324 Y126.437 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.474 Y125.837 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
; LINE_WIDTH: 0.12957
G1 F5818
M204 S6000
G1 X124.474 Y115.962 E.06973
M204 S10000
G1 X125.534 Y115.818 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5818
M204 S6000
G1 X127.162 Y115.818 E.05401
G3 X128.655 Y115.71 I.836 J1.182 E.05219
G1 X128.79 Y115.818 E.00573
G1 X130.038 Y115.818 E.04139
G1 X130.038 Y116.751 E.03095
G2 X131.276 Y116.705 I.569 J-1.387 E.04237
G1 X131.408 Y116.599 E.00561
G1 X131.408 Y114.971 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 9.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X131.408 Y116.599 E-.61876
G1 X131.276 Y116.705 E-.06425
G1 X131.079 Y116.752 E-.077
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 47/75
; update layer progress
M73 L47
M991 S0 P46 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z9.6 I-1.034 J-.641 P1  F42000
G1 X124.066 Y128.06 Z9.6
G1 Z9.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5587
M204 S5000
G1 X124.066 Y128.019 E.00126
G1 X124.066 Y126.881 E.03497
G1 X124.066 Y126.84 E.00126
G1 X131.526 Y126.84 E.22922
G1 X131.526 Y128.06 E.03749
G1 X124.126 Y128.06 E.22738
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.066 Y128.019 E-.02761
G1 X124.066 Y126.881 E-.43244
G1 X124.066 Y126.84 E-.01558
G1 X124.814 Y126.84 E-.28437
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.52 Y126.035 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
G1 F5587
M204 S5000
G1 X125.52 Y116.965 E.2787
G1 X128.89 Y116.965 E.10355
G1 X128.89 Y126.035 E.2787
G1 X125.58 Y126.035 E.10171
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.567 Y124.035 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.104 Y131.233 Z9.8 F42000
G1 X131.526 Y140.94 Z9.8
G1 Z9.4
G1 E.8 F1800
G1 F5587
M204 S5000
G1 X131.526 Y142.16 E.03749
G1 X124.066 Y142.16 E.22922
G1 X124.066 Y142.119 E.00126
G1 X124.066 Y140.981 E.03497
G1 X124.066 Y140.94 E.00126
G1 X131.466 Y140.94 E.22738
; WIPE_START
G1 F9547.055
M204 S6000
G1 X131.526 Y142.16 E-.46416
G1 X130.747 Y142.16 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.899 Y135.079 Z9.8 F42000
G1 X124.263 Y126.041 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5587
M204 S6000
G1 X124.263 Y114.009 E.39911
G1 X131.792 Y114.009 E.24973
G1 X131.792 Y126.041 E.39911
G1 X129.689 Y126.041 E.06974
G1 X129.689 Y116.166 E.32757
G1 X124.721 Y116.166 E.16481
G1 X124.721 Y126.041 E.32757
G1 X124.323 Y126.041 E.0132
; WIPE_START
G1 F8843.478
G1 X124.313 Y124.041 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.156 Y131.124 Z9.8 F42000
G1 X130.332 Y139.035 Z9.8
G1 Z9.4
G1 E.8 F1800
G1 F5587
M204 S6000
G1 X130.332 Y139.834 E.02651
G1 X125.26 Y139.834 E.16826
G1 X125.26 Y129.166 E.35389
G1 X130.332 Y129.166 E.16826
G1 X130.332 Y138.975 E.32539
M204 S10000
G1 X129.925 Y139.035 F42000
G1 F5587
M204 S6000
G1 X129.925 Y139.427 E.01301
G1 X125.667 Y139.427 E.14125
G1 X125.667 Y129.573 E.32688
G1 X129.925 Y129.573 E.14125
G1 X129.925 Y138.975 E.31188
M204 S250
G1 X129.533 Y139.035 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5587
M204 S5000
G1 X126.059 Y139.035 E.10675
G1 X126.059 Y138.994 E.00126
G1 X126.059 Y130.006 E.27618
G1 X126.059 Y129.965 E.00126
G1 X129.533 Y129.965 E.10675
G1 X129.533 Y138.975 E.27685
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.533 Y139.01 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.526 Y140.141 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5587
M204 S6000
G1 X124.263 Y140.141 E.24091
G1 X124.263 Y128.859 E.37424
G1 X131.792 Y128.859 E.24973
G1 X131.792 Y140.141 E.37424
G1 X131.586 Y140.141 E.00684
; WIPE_START
G1 F8843.478
G1 X129.586 Y140.141 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.856 Y140.548 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
G1 F5587
M204 S6000
G1 X123.856 Y128.452 E.40124
G1 X131.918 Y128.452 E.26742
G1 X131.918 Y126.448 E.06648
G1 X129.282 Y126.448 E.08742
G1 X129.282 Y116.573 E.32757
G1 X125.128 Y116.573 E.1378
G1 X125.128 Y126.448 E.32757
G1 X123.856 Y126.448 E.04219
G1 X123.856 Y113.602 E.42611
G1 X132.199 Y113.602 E.27674
G1 X132.199 Y142.398 E.9552
G1 X131.918 Y142.398 E.00932
G1 X131.918 Y140.548 E.06135
G1 X123.916 Y140.548 E.26543
; WIPE_START
G1 F8843.478
G1 X123.906 Y138.548 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.668 Y142.79 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5587
M204 S5000
G3 X123.464 Y142.59 I-.005 J-.2 E.00979
G1 X123.464 Y113.408 E.89669
G3 X123.657 Y113.21 I.201 J.004 E.00933
G1 X132.443 Y113.217 E.26997
G3 X132.591 Y113.41 I-.046 J.189 E.00809
G1 X132.584 Y142.647 E.89838
G3 X132.401 Y142.79 I-.199 J-.067 E.00755
G1 X123.728 Y142.79 E.26649
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.57 Y142.768 E-.06067
G1 X123.516 Y142.727 E-.02586
G1 X123.476 Y142.662 E-.02909
G1 X123.464 Y142.59 E-.02782
G1 X123.464 Y140.967 E-.61656
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


G1 X123.765 Y140.744 F42000
G1 Z9.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.252933
G1 F5587
M204 S6000
G1 X123.765 Y142.356 E.02759
G1 X123.778 Y142.409 E.00094
; LINE_WIDTH: 0.292875
G1 X123.792 Y142.462 E.00112
; LINE_WIDTH: 0.280785
G1 X123.87 Y142.475 E.00153
G1 X131.722 Y142.475 E.15219
; WIPE_START
G1 F15000
G1 X129.722 Y142.475 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.761 Y139.937 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
; LINE_WIDTH: 0.63212
G1 F5587
M204 S6000
G1 X124.761 Y129.063 E.52212
; WIPE_START
G1 F6109.98
G1 X124.761 Y131.063 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.765 Y128.256 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
; LINE_WIDTH: 0.25249
G1 F5587
M204 S6000
G1 X123.765 Y126.644 E.02753
M204 S10000
G1 X125.324 Y126.437 F42000
; LINE_WIDTH: 0.45586
G1 F5587
M204 S6000
G1 X129.086 Y126.437 E.12658
; WIPE_START
G1 F8717.973
G1 X127.086 Y126.437 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.85 Y125.693 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5587
M204 S6000
G1 X131.443 Y125.693 E.01968
G1 X131.443 Y124.658 E.03433
G3 X130.038 Y124.494 I-.518 J-1.674 E.04833
G1 X130.038 Y122.112 E.07904
G1 X130.621 Y122.119 E.01934
G1 X131.276 Y121.843 E.02359
G1 X131.443 Y121.682 E.00772
G1 X131.443 Y119.416 E.07515
G3 X130.038 Y119.253 I-.518 J-1.674 E.04833
G1 X130.038 Y116.87 E.07904
G1 X130.621 Y116.878 E.01934
G1 X131.276 Y116.602 E.02359
G1 X131.443 Y116.44 E.00772
G1 X131.443 Y114.358 E.06909
G1 X124.612 Y114.358 E.22663
G1 X124.612 Y115.818 E.04843
G1 X126.868 Y115.818 E.07484
G1 X127.017 Y115.689 E.00654
G3 X128.655 Y115.813 I.704 J1.587 E.05675
G1 X130.038 Y115.818 E.04586
G1 X130.038 Y116.069 E.00833
; WIPE_START
G1 F8843.478
G1 X130.038 Y115.818 E-.09541
G1 X128.655 Y115.813 E-.52533
G1 X128.318 Y115.67 E-.13926
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.682 Y123.18 Z9.8 F42000
M73 P73 R5
G1 X130.799 Y129.326 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.56931
G1 F5587
M204 S6000
G1 X130.799 Y139.674 E.44388
G1 X131.325 Y139.674 E.02258
G1 X131.325 Y129.326 E.44388
G1 X130.859 Y129.326 E.02001
; CHANGE_LAYER
; Z_HEIGHT: 9.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F6839.036
G1 X131.325 Y129.326 E-.17723
G1 X131.325 Y130.859 E-.58277
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 48/75
; update layer progress
M73 L48
M991 S0 P47 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z9.8 I.441 J-1.134 P1  F42000
G1 X124.119 Y128.06 Z9.8
G1 Z9.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5578
M204 S5000
G1 X124.119 Y128.019 E.00126
G1 X124.119 Y126.881 E.03497
G1 X124.119 Y126.84 E.00126
G1 X131.579 Y126.84 E.22922
G1 X131.579 Y128.06 E.03749
G1 X124.179 Y128.06 E.22738
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.119 Y128.019 E-.02761
G1 X124.119 Y126.881 E-.43244
G1 X124.119 Y126.84 E-.01558
G1 X124.868 Y126.84 E-.28437
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.52 Y126.035 Z10 F42000
G1 Z9.6
G1 E.8 F1800
G1 F5578
M204 S5000
G1 X125.52 Y116.965 E.2787
G1 X128.89 Y116.965 E.10355
G1 X128.89 Y126.035 E.2787
G1 X125.58 Y126.035 E.10171
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.567 Y124.035 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.125 Y131.226 Z10 F42000
G1 X131.579 Y140.94 Z10
G1 Z9.6
G1 E.8 F1800
G1 F5578
M204 S5000
G1 X131.579 Y142.16 E.03749
G1 X124.119 Y142.16 E.22922
G1 X124.119 Y142.119 E.00126
G1 X124.119 Y140.981 E.03497
G1 X124.119 Y140.94 E.00126
G1 X131.519 Y140.94 E.22738
; WIPE_START
G1 F9547.055
M204 S6000
G1 X131.579 Y142.16 E-.46416
G1 X130.801 Y142.16 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.946 Y135.082 Z10 F42000
G1 X124.299 Y126.041 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5578
M204 S6000
G1 X124.299 Y114.009 E.39911
G1 X131.827 Y114.009 E.24973
G1 X131.827 Y126.041 E.39911
G1 X129.689 Y126.041 E.07093
G1 X129.689 Y116.166 E.32757
G1 X124.721 Y116.166 E.16481
G1 X124.721 Y126.041 E.32757
G1 X124.359 Y126.041 E.012
; WIPE_START
G1 F8843.478
G1 X124.349 Y124.041 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.2 Y131.121 Z10 F42000
G1 X130.386 Y139.035 Z10
G1 Z9.6
G1 E.8 F1800
G1 F5578
M204 S6000
G1 X130.386 Y139.834 E.02651
G1 X125.313 Y139.834 E.16826
G1 X125.313 Y129.166 E.35389
G1 X130.386 Y129.166 E.16826
G1 X130.386 Y138.975 E.32539
M204 S10000
G1 X129.978 Y139.035 F42000
G1 F5578
M204 S6000
G1 X129.978 Y139.427 E.01301
G1 X125.72 Y139.427 E.14125
G1 X125.72 Y129.573 E.32688
G1 X129.978 Y129.573 E.14125
G1 X129.978 Y138.975 E.31188
M204 S250
G1 X129.586 Y139.035 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5578
M204 S5000
G1 X126.112 Y139.035 E.10675
G1 X126.112 Y138.994 E.00126
G1 X126.112 Y130.006 E.27618
G1 X126.112 Y129.965 E.00126
G1 X129.586 Y129.965 E.10675
G1 X129.586 Y138.975 E.27685
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.587 Y139.01 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.579 Y140.141 Z10 F42000
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5578
M204 S6000
G1 X124.299 Y140.141 E.24149
G1 X124.299 Y128.859 E.37424
G1 X131.827 Y128.859 E.24973
G1 X131.827 Y140.141 E.37424
G1 X131.639 Y140.141 E.00624
; WIPE_START
G1 F8843.478
G1 X129.639 Y140.141 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.892 Y140.548 Z10 F42000
G1 Z9.6
G1 E.8 F1800
G1 F5578
M204 S6000
G1 X123.892 Y128.452 E.40124
G1 X131.971 Y128.452 E.268
G1 X131.971 Y126.448 E.06648
G1 X129.282 Y126.448 E.0892
G1 X129.282 Y116.573 E.32757
G1 X125.128 Y116.573 E.1378
G1 X125.128 Y126.448 E.32757
G1 X123.892 Y126.448 E.041
G1 X123.892 Y113.602 E.42611
G1 X132.235 Y113.602 E.27673
G1 X132.235 Y142.398 E.9552
G1 X131.971 Y142.398 E.00873
G1 X131.971 Y140.548 E.06135
G1 X123.952 Y140.548 E.26601
; WIPE_START
G1 F8843.478
G1 X123.942 Y138.548 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.704 Y142.79 Z10 F42000
G1 Z9.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5578
M204 S5000
G3 X123.5 Y142.59 I-.005 J-.2 E.00979
G1 X123.5 Y113.408 E.89669
G3 X123.693 Y113.21 I.202 J.004 E.00933
G1 X132.46 Y113.212 E.26939
G1 X132.472 Y113.215 E.00038
G3 X132.627 Y113.41 I-.041 J.191 E.0083
G1 X132.62 Y142.647 E.89837
G3 X132.434 Y142.79 I-.192 J-.059 E.00767
G1 X123.764 Y142.79 E.26641
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.636 Y142.78 E-.04876
G1 X123.561 Y142.736 E-.03325
G1 X123.511 Y142.662 E-.03381
G1 X123.5 Y142.59 E-.02776
G1 X123.5 Y140.968 E-.61642
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


G1 X123.81 Y140.744 F42000
G1 Z9.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279201
G1 F5578
M204 S6000
G1 X123.81 Y142.356 E.03104
G1 X123.832 Y142.458 E.002
G1 X123.923 Y142.475 E.00178
G1 X131.775 Y142.475 E.15118
; WIPE_START
G1 F15000
G1 X129.775 Y142.475 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.806 Y139.937 Z10 F42000
G1 Z9.6
G1 E.8 F1800
; LINE_WIDTH: 0.64977
G1 F5578
M204 S6000
G1 X124.806 Y129.063 E.53776
; WIPE_START
G1 F5932.273
G1 X124.806 Y131.063 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.81 Y128.256 Z10 F42000
G1 Z9.6
G1 E.8 F1800
; LINE_WIDTH: 0.27014
G1 F5578
M204 S6000
G1 X123.81 Y126.644 E.02984
M204 S10000
G1 X125.324 Y126.437 F42000
; LINE_WIDTH: 0.45586
G1 F5578
M204 S6000
G1 X129.086 Y126.437 E.12658
; WIPE_START
G1 F8717.973
G1 X127.086 Y126.437 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.688 Y125.693 Z10 F42000
G1 Z9.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5578
M204 S6000
G1 X131.479 Y125.693 E.02625
G1 X131.479 Y124.856 E.02777
G3 X130.038 Y124.42 I-.213 J-1.9 E.05134
G1 X130.038 Y122.266 E.07145
G1 X130.621 Y122.161 E.01965
G1 X131.276 Y121.755 E.02557
G1 X131.479 Y121.505 E.01069
G1 X131.479 Y119.614 E.06272
G3 X130.038 Y119.179 I-.213 J-1.9 E.05134
G1 X130.038 Y117.025 E.07145
G1 X130.621 Y116.92 E.01965
G1 X131.276 Y116.514 E.02557
G1 X131.479 Y116.264 E.01069
G1 X131.479 Y114.373 E.06272
G3 X130.944 Y114.357 I-.249 J-.651 E.01822
G1 X126.308 Y114.358 E.15379
G3 X124.648 Y114.358 I-.831 J-8.955 E.05516
G1 X124.648 Y115.818 E.04843
G1 X126.601 Y115.818 E.0648
G3 X127.017 Y115.448 I1.05 J.763 E.01861
G3 X128.521 Y115.818 I.361 J1.774 E.05307
G1 X130.038 Y115.818 E.05031
G1 X130.038 Y115.929 E.0037
; WIPE_START
G1 F8843.478
G1 X130.038 Y115.818 E-.04243
G1 X128.521 Y115.818 E-.57634
G1 X128.205 Y115.622 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.651 Y123.116 Z10 F42000
G1 X130.848 Y129.321 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.56038
G1 F5578
M204 S6000
G1 X130.848 Y139.679 E.43673
G1 X131.365 Y139.679 E.02182
G1 X131.365 Y129.321 E.43673
G1 X130.908 Y129.321 E.01929
; CHANGE_LAYER
; Z_HEIGHT: 9.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6957.06
G1 X131.365 Y129.321 E-.17383
G1 X131.365 Y130.864 E-.58617
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 49/75
; update layer progress
M73 L49
M991 S0 P48 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z10 I.442 J-1.134 P1  F42000
G1 X124.173 Y128.06 Z10
G1 Z9.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5573
M204 S5000
G1 X124.173 Y128.019 E.00126
G1 X124.173 Y126.881 E.03497
G1 X124.173 Y126.84 E.00126
M73 P74 R5
G1 X131.633 Y126.84 E.22922
G1 X131.633 Y128.06 E.03749
G1 X124.233 Y128.06 E.22738
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.173 Y128.019 E-.02761
G1 X124.173 Y126.881 E-.43244
G1 X124.173 Y126.84 E-.01558
G1 X124.921 Y126.84 E-.28437
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.52 Y126.035 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
G1 F5573
M204 S5000
G1 X125.52 Y116.965 E.2787
G1 X128.89 Y116.965 E.10355
G1 X128.89 Y126.035 E.2787
G1 X125.58 Y126.035 E.10171
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.567 Y124.035 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.145 Y131.219 Z10.2 F42000
G1 X131.633 Y140.94 Z10.2
G1 Z9.8
G1 E.8 F1800
G1 F5573
M204 S5000
G1 X131.633 Y142.16 E.03749
G1 X124.173 Y142.16 E.22922
G1 X124.173 Y142.119 E.00126
G1 X124.173 Y140.981 E.03497
G1 X124.173 Y140.94 E.00126
G1 X131.573 Y140.94 E.22738
; WIPE_START
G1 F9547.055
M204 S6000
G1 X131.633 Y142.16 E-.46416
G1 X130.854 Y142.16 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.993 Y135.084 Z10.2 F42000
G1 X124.335 Y126.041 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5573
M204 S6000
G1 X124.335 Y114.009 E.39911
G1 X131.863 Y114.009 E.24972
G1 X131.863 Y126.041 E.39911
G1 X129.689 Y126.041 E.07211
G1 X129.689 Y116.166 E.32757
G1 X124.721 Y116.166 E.16481
G1 X124.721 Y126.041 E.32757
G1 X124.395 Y126.041 E.01081
; WIPE_START
G1 F8843.478
G1 X124.385 Y124.041 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.243 Y131.118 Z10.2 F42000
G1 X130.439 Y139.035 Z10.2
G1 Z9.8
G1 E.8 F1800
G1 F5573
M204 S6000
G1 X130.439 Y139.834 E.02651
G1 X125.367 Y139.834 E.16826
G1 X125.367 Y129.166 E.35389
G1 X130.439 Y129.166 E.16826
G1 X130.439 Y138.975 E.32539
M204 S10000
G1 X130.032 Y139.035 F42000
G1 F5573
M204 S6000
G1 X130.032 Y139.427 E.01301
G1 X125.774 Y139.427 E.14125
G1 X125.774 Y129.573 E.32688
G1 X130.032 Y129.573 E.14125
G1 X130.032 Y138.975 E.31188
M204 S250
G1 X129.64 Y139.035 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5573
M204 S5000
G1 X126.166 Y139.035 E.10675
G1 X126.166 Y138.994 E.00126
G1 X126.166 Y130.006 E.27618
G1 X126.166 Y129.965 E.00126
G1 X129.64 Y129.965 E.10675
G1 X129.64 Y138.975 E.27685
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.64 Y139.01 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.633 Y140.141 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5573
M204 S6000
G1 X124.335 Y140.141 E.24208
G1 X124.335 Y128.859 E.37424
G1 X131.863 Y128.859 E.24972
G1 X131.863 Y140.141 E.37424
G1 X131.693 Y140.141 E.00565
; WIPE_START
G1 F8843.478
G1 X129.693 Y140.141 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.928 Y140.548 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
G1 F5573
M204 S6000
G1 X123.928 Y128.452 E.40124
G1 X132.025 Y128.452 E.26859
G1 X132.025 Y126.448 E.06648
G1 X129.282 Y126.448 E.09098
G1 X129.282 Y116.573 E.32757
G1 X125.128 Y116.573 E.1378
G1 X125.128 Y126.448 E.32757
G1 X123.928 Y126.448 E.03981
G1 X123.928 Y113.602 E.42611
G1 X132.27 Y113.602 E.27673
G1 X132.27 Y142.398 E.9552
G1 X132.025 Y142.398 E.00814
G1 X132.025 Y140.548 E.06135
G1 X123.988 Y140.548 E.2666
; WIPE_START
G1 F8843.478
G1 X123.978 Y138.548 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.74 Y142.79 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5573
M204 S5000
G3 X123.536 Y142.59 I-.005 J-.2 E.00979
G1 X123.536 Y113.408 E.89669
G3 X123.729 Y113.21 I.202 J.004 E.00933
G1 X132.508 Y113.215 E.26977
G1 X132.52 Y113.218 E.00037
G3 X132.662 Y113.41 I-.054 J.189 E.00792
G1 X132.656 Y142.647 E.89838
G3 X132.47 Y142.79 I-.195 J-.062 E.00765
G1 X123.8 Y142.79 E.2664
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.672 Y142.78 E-.04884
G1 X123.596 Y142.736 E-.03318
G1 X123.547 Y142.662 E-.03381
G1 X123.536 Y142.59 E-.02779
G1 X123.536 Y140.968 E-.61639
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


G1 X123.855 Y140.744 F42000
G1 Z9.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.28237
G1 F5573
M204 S6000
G1 X123.855 Y142.356 E.03145
G1 X123.874 Y142.453 E.00192
G1 X123.977 Y142.475 E.00207
G1 X131.829 Y142.475 E.15321
; WIPE_START
G1 F15000
G1 X129.829 Y142.475 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.851 Y139.937 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
; LINE_WIDTH: 0.66743
G1 F5573
M204 S6000
G1 X124.851 Y129.063 E.55341
; WIPE_START
G1 F5764.52
G1 X124.851 Y131.063 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.855 Y128.256 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
; LINE_WIDTH: 0.2878
G1 F5573
M204 S6000
G1 X123.855 Y126.644 E.03216
M204 S10000
G1 X125.324 Y126.437 F42000
; LINE_WIDTH: 0.45586
G1 F5573
M204 S6000
G1 X129.086 Y126.437 E.12658
; WIPE_START
G1 F8717.973
G1 X127.086 Y126.437 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.897 Y129.317 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.55145
G1 F5573
M204 S6000
G1 X130.897 Y139.683 E.42956
G1 X131.405 Y139.683 E.02107
G1 X131.405 Y129.317 E.42956
G1 X130.957 Y129.317 E.01859
; WIPE_START
G1 F7079.229
G1 X131.405 Y129.317 E-.17045
G1 X131.405 Y130.868 E-.58955
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.515 Y123.551 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5573
M204 S6000
G1 X131.515 Y125.18 E.05401
G3 X130.038 Y124.359 I.684 J-2.971 E.0568
G1 X130.038 Y122.474 E.06252
G2 X131.276 Y121.677 I-.619 J-2.322 E.04964
G1 X131.515 Y121.273 E.01558
G1 X131.515 Y119.938 E.04427
G3 X130.038 Y119.118 I.684 J-2.971 E.0568
G1 X130.038 Y117.233 E.06252
G2 X131.276 Y116.436 I-.619 J-2.322 E.04964
G1 X131.515 Y116.032 E.01558
G1 X131.515 Y114.697 E.04427
G3 X130.621 Y114.371 I.529 J-2.841 E.03172
G1 X126.804 Y114.358 E.1266
G3 X126.362 Y114.717 I-.405 J-.046 E.02094
G3 X125.379 Y114.371 I.546 J-3.116 E.03472
G1 X124.683 Y114.358 E.02309
G1 X124.683 Y115.818 E.04843
G1 X126.393 Y115.818 E.05671
G1 X126.69 Y115.196 E.02284
G1 X127.017 Y115.076 E.01157
G3 X128.465 Y115.818 I-.575 J2.909 E.05466
G1 X130.038 Y115.818 E.05216
G1 X130.038 Y115.873 E.00185
; CHANGE_LAYER
; Z_HEIGHT: 10
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X130.038 Y115.818 E-.02125
G1 X128.465 Y115.818 E-.59752
G1 X128.182 Y115.577 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 50/75
; update layer progress
M73 L50
M991 S0 P49 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z10.2 I-1.16 J-.368 P1  F42000
G1 X124.227 Y128.06 Z10.2
G1 Z10
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5601
M204 S5000
G1 X124.227 Y128.019 E.00126
G1 X124.227 Y126.881 E.03497
G1 X124.227 Y126.84 E.00126
G1 X131.686 Y126.84 E.22922
G1 X131.686 Y128.06 E.03749
G1 X124.287 Y128.06 E.22738
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.227 Y128.019 E-.02761
G1 X124.227 Y126.881 E-.43244
G1 X124.227 Y126.84 E-.01558
G1 X124.975 Y126.84 E-.28437
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.52 Y126.035 Z10.4 F42000
G1 Z10
G1 E.8 F1800
G1 F5601
M204 S5000
G1 X125.52 Y116.965 E.2787
G1 X128.89 Y116.965 E.10355
G1 X128.89 Y126.035 E.2787
G1 X125.58 Y126.035 E.10171
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.567 Y124.035 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.371 Y126.041 Z10.4 F42000
G1 Z10
M73 P75 R5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5601
M204 S6000
G1 X124.371 Y114.009 E.3991
G1 X131.905 Y114.01 E.24993
G1 X131.905 Y126.041 E.3991
G1 X129.689 Y126.041 E.07351
G1 X129.689 Y116.166 E.32757
G1 X124.721 Y116.166 E.16481
G1 X124.721 Y126.041 E.32757
G1 X124.431 Y126.041 E.00962
M204 S10000
G1 X123.964 Y126.448 F42000
G1 F5601
M204 S6000
G1 X123.964 Y113.602 E.42611
G1 X132.313 Y113.602 E.27694
G1 X132.313 Y126.448 E.42611
G1 X129.282 Y126.448 E.10052
G1 X129.282 Y116.573 E.32757
G1 X125.128 Y116.573 E.1378
G1 X125.128 Y126.448 E.32757
G1 X124.024 Y126.448 E.03663
; WIPE_START
G1 F8843.478
G1 X124.015 Y124.448 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.112 Y131.423 Z10.4 F42000
G1 X130.493 Y139.035 Z10.4
G1 Z10
G1 E.8 F1800
G1 F5601
M204 S6000
G1 X130.493 Y139.834 E.02651
G1 X125.42 Y139.834 E.16826
G1 X125.42 Y129.166 E.35389
G1 X130.493 Y129.166 E.16826
G1 X130.493 Y138.975 E.32539
M204 S10000
G1 X130.086 Y139.035 F42000
G1 F5601
M204 S6000
G1 X130.086 Y139.427 E.01301
G1 X125.827 Y139.427 E.14125
G1 X125.827 Y129.573 E.32688
G1 X130.086 Y129.573 E.14125
G1 X130.086 Y138.975 E.31188
M204 S250
G1 X129.694 Y139.035 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5601
M204 S5000
G1 X126.219 Y139.035 E.10675
G1 X126.219 Y138.994 E.00126
G1 X126.219 Y130.006 E.27618
G1 X126.219 Y129.965 E.00126
G1 X129.694 Y129.965 E.10675
G1 X129.694 Y138.975 E.27685
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.694 Y139.01 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.686 Y140.141 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5601
M204 S6000
G1 X124.371 Y140.141 E.24266
G1 X124.371 Y128.859 E.37424
G1 X131.905 Y128.859 E.24993
G1 X131.905 Y140.141 E.37424
G1 X131.746 Y140.141 E.00528
M204 S10000
G1 X131.686 Y140.548 F42000
G1 F5601
M204 S6000
G1 X123.964 Y140.548 E.25617
G1 X123.964 Y128.452 E.40124
G1 X132.313 Y128.452 E.27694
G1 X132.313 Y140.548 E.40124
G1 X131.746 Y140.548 E.01878
M204 S250
G1 X131.686 Y140.94 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5601
M204 S5000
G1 X131.686 Y142.16 E.03749
G1 X124.227 Y142.16 E.22922
G1 X124.227 Y142.119 E.00126
G1 X124.227 Y140.981 E.03497
G1 X124.227 Y140.94 E.00126
G1 X131.626 Y140.94 E.22738
; WIPE_START
G1 F9547.055
M204 S6000
G1 X131.686 Y142.16 E-.46416
G1 X130.908 Y142.16 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.776 Y142.79 Z10.4 F42000
G1 Z10
G1 E.8 F1800
G1 F5601
M204 S5000
G3 X123.572 Y142.59 I-.005 J-.2 E.00979
G1 X123.572 Y113.407 E.89669
G3 X123.765 Y113.21 I.202 J.004 E.00933
G1 X132.508 Y113.21 E.26867
G3 X132.699 Y113.361 I-.002 J.198 E.00802
G1 X132.705 Y141.992 E.87975
G3 X132.702 Y142.629 I-4.116 J.3 E.01961
G1 X132.697 Y142.648 E.00059
G3 X132.509 Y142.79 I-.197 J-.066 E.0077
G1 X123.836 Y142.79 E.26649
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.708 Y142.78 E-.04883
G1 X123.632 Y142.736 E-.03318
G1 X123.583 Y142.661 E-.03413
G1 X123.572 Y142.59 E-.02747
G1 X123.572 Y140.968 E-.61639
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


G1 X123.899 Y140.744 F42000
G1 Z10
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.306873
G1 F5601
M204 S6000
G1 X123.899 Y142.356 E.03467
G1 X123.915 Y142.447 E.00198
G1 X123.973 Y142.461 E.00128
; LINE_WIDTH: 0.29488
G1 X124.031 Y142.475 E.00122
; LINE_WIDTH: 0.281073
G1 X131.882 Y142.475 E.15238
G1 X132.008 Y142.412 E.00272
; LINE_WIDTH: 0.351741
G1 X132.133 Y142.35 E.00352
; LINE_WIDTH: 0.399249
G1 X132.258 Y142.287 E.00407
; LINE_WIDTH: 0.446756
G1 X132.383 Y142.224 E.00461
; LINE_WIDTH: 0.494263
G1 X132.509 Y142.162 E.00515
M204 S10000
G1 X132.196 Y142.594 F42000
; LINE_WIDTH: 0.66903
G1 F5601
M204 S6000
G1 X132.196 Y140.744 E.09436
; WIPE_START
G1 F5749.789
G1 X132.196 Y142.594 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.683 Y139.515 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5601
M204 S2000
G1 X131.279 Y139.918 E.01755
G1 X130.746 Y139.918
G1 X131.683 Y138.981 E.04072
G1 X131.683 Y138.448
G1 X130.715 Y139.416 E.04207
G1 X130.715 Y138.883
G1 X131.683 Y137.915 E.04207
G1 X131.683 Y137.382
G1 X130.715 Y138.35 E.04207
G1 X130.715 Y137.816
G1 X131.683 Y136.848 E.04207
G1 X131.683 Y136.315
G1 X130.715 Y137.283 E.04207
G1 X130.715 Y136.75
G1 X131.683 Y135.782 E.04207
G1 X131.683 Y135.249
G1 X130.715 Y136.217 E.04207
G1 X130.715 Y135.683
G1 X131.683 Y134.715 E.04207
G1 X131.683 Y134.182
G1 X130.715 Y135.15 E.04207
G1 X130.715 Y134.617
G1 X131.683 Y133.649 E.04207
G1 X131.683 Y133.116
G1 X130.715 Y134.084 E.04207
G1 X130.715 Y133.55
G1 X131.683 Y132.582 E.04207
G1 X131.683 Y132.049
G1 X130.715 Y133.017 E.04207
G1 X130.715 Y132.484
G1 X131.683 Y131.516 E.04207
G1 X131.683 Y130.983
M73 P75 R4
G1 X130.715 Y131.951 E.04207
G1 X130.715 Y131.417
G1 X131.683 Y130.449 E.04207
G1 X131.683 Y129.916
G1 X130.715 Y130.884 E.04207
G1 X130.715 Y130.351
G1 X131.683 Y129.383 E.04207
G1 X131.451 Y129.082
G1 X130.715 Y129.818 E.03198
; WIPE_START
G1 F9547.055
M204 S6000
G1 X131.451 Y129.082 E-.39554
G1 X131.683 Y129.383 E-.14449
G1 X131.274 Y129.792 E-.21997
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.196 Y128.256 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.66903
G1 F5601
M204 S6000
G1 X132.196 Y126.644 E.08224
; WIPE_START
G1 F5749.789
G1 X132.196 Y128.256 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.557 Y124.17 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5601
M204 S6000
G1 X131.557 Y125.693 E.05052
G1 X131.452 Y125.693 E.00349
G1 X131.214 Y125.38 E.01304
G1 X130.336 Y124.724 E.03634
G1 X130.038 Y124.284 E.01765
G1 X130.038 Y122.751 E.05086
G1 X130.905 Y122.104 E.0359
G2 X131.463 Y120.466 I-1.479 J-1.418 E.05926
G1 X131.214 Y120.138 E.01364
G1 X130.336 Y119.483 E.03634
G1 X130.038 Y119.043 E.01765
G1 X130.038 Y117.51 E.05086
G1 X130.905 Y116.862 E.0359
G2 X131.463 Y115.225 I-1.479 J-1.418 E.05926
G1 X131.214 Y114.897 E.01364
G1 X130.492 Y114.358 E.0299
G1 X128.864 Y114.358 E.05401
M204 S10000
G1 X130.038 Y115.873 F42000
G1 F5601
M204 S6000
G1 X130.038 Y115.818 E.00183
G1 X128.464 Y115.818 E.05219
G1 X128.284 Y115.552 E.01064
G1 X127.406 Y114.897 E.03634
G3 X127.13 Y114.358 I.336 J-.513 E.02103
G1 X125.251 Y114.358 E.06234
G1 X125.973 Y114.897 E.02991
G3 X126.202 Y115.818 I-.559 J.627 E.03344
G1 X124.719 Y115.818 E.04917
G1 X124.719 Y115.672 E.00485
; WIPE_START
G1 F8843.478
G1 X124.719 Y115.818 E-.05551
G1 X126.202 Y115.818 E-.56325
G1 X126.265 Y115.552 E-.10374
G1 X126.252 Y115.454 E-.0375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.159 Y122.845 Z10.4 F42000
G1 X129.086 Y126.437 Z10.4
G1 Z10
M73 P76 R4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.45586
G1 F5601
M204 S6000
G1 X125.324 Y126.437 E.12658
M204 S10000
G1 X123.899 Y126.644 F42000
; LINE_WIDTH: 0.30546
G1 F5601
M204 S6000
G1 X123.899 Y128.256 E.03448
; WIPE_START
G1 F13712.196
G1 X123.899 Y126.644 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.896 Y129.063 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.68509
G1 F5601
M204 S6000
G1 X124.896 Y139.937 E.56906
; CHANGE_LAYER
; Z_HEIGHT: 10.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5605.992
G1 X124.896 Y137.937 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 51/75
; update layer progress
M73 L51
M991 S0 P50 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z10.4 I-.558 J1.082 P1  F42000
G1 X128.573 Y139.834 Z10.4
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5815
M204 S6000
G1 X128.573 Y140.141 E.01017
G1 X124.407 Y140.141 E.1382
G1 X124.407 Y128.859 E.37424
G1 X128.573 Y128.859 E.1382
G1 X128.573 Y129.166 E.01017
G1 X125.474 Y129.166 E.10281
G1 X125.474 Y139.834 E.35389
G1 X128.513 Y139.834 E.10082
M204 S10000
G1 X128.98 Y139.427 F42000
G1 F5815
M204 S6000
G1 X128.98 Y140.548 E.03718
G1 X124 Y140.548 E.16521
G1 X124 Y128.452 E.40124
G1 X128.98 Y128.452 E.16521
G1 X128.98 Y129.573 E.03718
G1 X125.881 Y129.573 E.10281
G1 X125.881 Y139.427 E.32688
G1 X128.92 Y139.427 E.10082
; WIPE_START
G1 F8843.478
G1 X128.98 Y140.548 E-.42654
G1 X128.103 Y140.548 E-.33346
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.637 Y140.81 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5815
M204 S5000
G1 X130.839 Y140.81 E.02451
G1 X130.839 Y128.19 E.38778
G1 X131.637 Y128.19 E.02451
G1 X131.637 Y140.75 E.38593
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.839 Y140.81 E-.30402
G1 X130.839 Y139.61 E-.45598
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.07 Y132.973 Z10.6 F42000
G1 X124.28 Y128.06 Z10.6
G1 Z10.2
G1 E.8 F1800
G1 F5815
M204 S5000
G1 X124.28 Y128.019 E.00126
G1 X124.28 Y126.881 E.03497
G1 X124.28 Y126.84 E.00126
G1 X131.74 Y126.84 E.22922
G1 X131.74 Y128.06 E.03749
G1 X124.34 Y128.06 E.22738
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.28 Y128.019 E-.02761
G1 X124.28 Y126.881 E-.43244
G1 X124.28 Y126.84 E-.01558
G1 X125.028 Y126.84 E-.28437
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.52 Y126.035 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
G1 F5815
M204 S5000
G1 X125.52 Y116.965 E.2787
G1 X128.89 Y116.965 E.10355
G1 X128.89 Y126.035 E.2787
G1 X125.58 Y126.035 E.10171
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.567 Y124.035 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.407 Y126.041 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5815
M204 S6000
G1 X124.407 Y114.009 E.3991
G1 X131.951 Y114.009 E.25024
G1 X131.951 Y126.041 E.3991
G1 X129.689 Y126.041 E.07502
G1 X129.689 Y116.166 E.32757
G1 X124.721 Y116.166 E.16481
G1 X124.721 Y126.041 E.32757
G1 X124.467 Y126.041 E.00843
M204 S10000
G1 X124 Y126.448 F42000
G1 F5815
M204 S6000
G1 X124 Y113.602 E.42611
G1 X132.358 Y113.602 E.27725
G1 X132.358 Y126.448 E.42611
G1 X129.282 Y126.448 E.10202
G1 X129.282 Y116.573 E.32757
G1 X125.128 Y116.573 E.1378
G1 X125.128 Y126.448 E.32757
G1 X124.06 Y126.448 E.03543
; WIPE_START
G1 F8843.478
G1 X124.051 Y124.448 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.827 Y131.558 Z10.6 F42000
G1 X129.747 Y139.035 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5815
M204 S5000
G1 X126.273 Y139.035 E.10675
G1 X126.273 Y138.994 E.00126
G1 X126.273 Y130.006 E.27618
G1 X126.273 Y129.965 E.00126
G1 X129.747 Y129.965 E.10675
G1 X129.747 Y138.975 E.27685
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.747 Y139.01 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.74 Y140.94 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
G1 F5815
M204 S5000
G1 X131.74 Y142.16 E.03749
G1 X124.28 Y142.16 E.22922
G1 X124.28 Y142.119 E.00126
G1 X124.28 Y140.981 E.03497
G1 X124.28 Y140.94 E.00126
G1 X131.68 Y140.94 E.22738
; WIPE_START
G1 F9547.055
M204 S6000
G1 X131.74 Y142.16 E-.46416
G1 X130.962 Y142.16 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.812 Y142.79 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
G1 F5815
M204 S5000
G3 X123.608 Y142.59 I-.005 J-.2 E.00979
G1 X123.608 Y113.408 E.89669
G3 X123.801 Y113.21 I.202 J.004 E.00933
G1 X132.552 Y113.21 E.26891
G3 X132.729 Y113.32 I-.014 J.221 E.00666
G1 X132.746 Y113.366 E.00149
G1 X132.75 Y141.992 E.8796
G3 X132.747 Y142.629 I-4.117 J.3 E.01961
G1 X132.727 Y142.685 E.00181
G1 X132.715 Y142.706 E.00076
G3 X132.557 Y142.79 I-.175 J-.14 E.00566
G1 X123.872 Y142.79 E.26685
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.744 Y142.78 E-.04879
G1 X123.668 Y142.736 E-.03322
G1 X123.619 Y142.662 E-.03385
G1 X123.608 Y142.59 E-.02776
G1 X123.608 Y140.968 E-.61638
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


G1 X123.944 Y140.744 F42000
G1 Z10.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.324074
G1 F5815
M204 S6000
G1 X123.944 Y142.356 E.03693
G1 X123.957 Y142.441 E.00197
G1 X124.021 Y142.458 E.00151
; LINE_WIDTH: 0.297858
G1 X124.084 Y142.475 E.00137
; LINE_WIDTH: 0.281067
G1 X131.936 Y142.475 E.15237
G1 X132.06 Y142.413 E.00268
; LINE_WIDTH: 0.351741
G1 X132.183 Y142.351 E.00348
; LINE_WIDTH: 0.399248
G1 X132.307 Y142.289 E.00401
; LINE_WIDTH: 0.446755
G1 X132.43 Y142.228 E.00455
; LINE_WIDTH: 0.494262
G1 X132.554 Y142.166 E.00508
M204 S10000
G1 X132.415 Y141.865 F42000
; LINE_WIDTH: 0.29799
G1 F5815
M204 S6000
G1 X132.438 Y141.819 E.00108
; LINE_WIDTH: 0.25161
G1 X132.461 Y141.772 E.00088
; LINE_WIDTH: 0.182133
G1 X132.484 Y141.726 E.00059
G1 X132.484 Y127.274 E.16394
; LINE_WIDTH: 0.205247
G1 X132.379 Y127.064 E.00311
; LINE_WIDTH: 0.25162
G1 X132.274 Y126.854 E.00399
; LINE_WIDTH: 0.297994
G1 X132.169 Y126.644 E.00488
; WIPE_START
G1 F14113.588
G1 X132.274 Y126.854 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.603 Y124.481 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5815
M204 S6000
G1 X131.603 Y125.693 E.04018
G1 X131.186 Y125.693 E.01383
G2 X130.251 Y124.724 I-5.559 J4.429 E.04469
G1 X130.038 Y124.273 E.01657
G1 X130.038 Y123.102 E.03885
G3 X130.99 Y122.104 I5.436 J4.234 E.04583
G2 X131.198 Y120.466 I-1.43 J-1.014 E.05703
G2 X130.251 Y119.483 I-5.642 J4.486 E.04533
G1 X130.038 Y119.032 E.01657
G1 X130.038 Y117.86 E.03885
G3 X130.99 Y116.862 I5.436 J4.234 E.04583
G2 X131.198 Y115.225 I-1.43 J-1.014 E.05703
G2 X130.37 Y114.358 I-4.973 J3.921 E.03982
G1 X128.742 Y114.358 E.05401
M204 S10000
G1 X130.038 Y115.903 F42000
G1 F5815
M204 S6000
G1 X130.038 Y115.818 E.00284
G1 X128.495 Y115.818 E.05117
G1 X128.369 Y115.552 E.00975
G1 X127.7 Y114.897 E.03108
G3 X127.341 Y114.358 I.603 J-.79 E.02188
G1 X125.129 Y114.358 E.07338
G1 X125.68 Y114.897 E.02558
G3 X126.074 Y115.818 I-.684 J.837 E.03454
G1 X124.755 Y115.818 E.04373
G1 X124.755 Y115.507 E.01029
; WIPE_START
G1 F8843.478
G1 X124.755 Y115.818 E-.11783
G1 X126.074 Y115.818 E-.50093
G1 X126.083 Y115.552 E-.10096
G1 X126.045 Y115.453 E-.04028
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.545 Y123.069 Z10.6 F42000
G1 X125.324 Y126.437 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.45586
G1 F5815
M204 S6000
G1 X129.086 Y126.437 E.12658
; WIPE_START
G1 F8717.973
G1 X127.086 Y126.437 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.631 Y128.765 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5815
M204 S2000
G1 X130.134 Y128.267 E.02162
G1 X129.6 Y128.267
G1 X130.631 Y129.298 E.0448
G1 X130.631 Y129.832
G1 X129.203 Y128.403 E.06208
G1 X129.203 Y128.936
G1 X130.631 Y130.365 E.06208
G1 X130.631 Y130.898
G1 X129.955 Y130.221 E.02941
G1 X129.955 Y130.754
G1 X130.631 Y131.431 E.02941
G1 X130.631 Y131.965
G1 X129.955 Y131.288 E.02941
G1 X129.955 Y131.821
G1 X130.631 Y132.498 E.02941
G1 X130.631 Y133.031
G1 X129.955 Y132.354 E.02941
G1 X129.955 Y132.888
G1 X130.631 Y133.564 E.02941
G1 X130.631 Y134.098
G1 X129.955 Y133.421 E.02941
G1 X129.955 Y133.954
G1 X130.631 Y134.631 E.02941
G1 X130.631 Y135.164
G1 X129.955 Y134.487 E.02941
G1 X129.955 Y135.021
G1 X130.631 Y135.697 E.02941
G1 X130.631 Y136.231
G1 X129.955 Y135.554 E.02941
G1 X129.955 Y136.087
G1 X130.631 Y136.764 E.02941
G1 X130.631 Y137.297
G1 X129.955 Y136.62 E.02941
G1 X129.955 Y137.154
G1 X130.631 Y137.83 E.02941
G1 X130.631 Y138.364
G1 X129.955 Y137.687 E.02941
G1 X129.955 Y138.22
G1 X130.631 Y138.897 E.02941
G1 X130.631 Y139.43
G1 X129.955 Y138.753 E.02941
G1 X129.91 Y139.242
G1 X130.631 Y139.963 E.03133
G1 X130.631 Y140.497
G1 X129.377 Y139.242 E.0545
G1 X129.203 Y139.601
G1 X130.334 Y140.733 E.04916
G1 X129.801 Y140.733
G1 X129.203 Y140.135 E.02599
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.801 Y140.733 E-.32136
G1 X130.334 Y140.733 E-.20264
G1 X129.895 Y140.293 E-.236
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.168 Y141.479 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.5215
G1 F5815
M204 S6000
G1 X132.168 Y140.751 E.02838
; LINE_WIDTH: 0.538754
G1 X132.151 Y140.677 E.00308
; LINE_WIDTH: 0.57326
G1 X132.133 Y140.603 E.00329
; LINE_WIDTH: 0.624912
G1 X132.116 Y140.529 E.00361
G1 X132.116 Y128.471 E.57184
; LINE_WIDTH: 0.607767
G1 X132.133 Y128.397 E.00351
; LINE_WIDTH: 0.57326
G1 X132.151 Y128.323 E.00329
; LINE_WIDTH: 0.523267
G1 X132.168 Y128.249 E.00298
G1 X132.168 Y127.581 E.02613
; WIPE_START
G1 F7494.584
G1 X132.168 Y128.249 E-.68217
G1 X132.151 Y128.323 E-.07783
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.105 Y129.228 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
; LINE_WIDTH: 0.37284
M73 P77 R4
G1 F5815
M204 S6000
G1 X124.776 Y129.228 E.00887
G1 X124.776 Y139.772 E.28349
G1 X125.105 Y139.772 E.00887
G1 X125.105 Y129.288 E.28188
; WIPE_START
G1 F10911.736
G1 X125.105 Y131.288 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.944 Y128.256 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.32312
G1 F5815
M204 S6000
G1 X123.944 Y126.644 E.0368
; CHANGE_LAYER
; Z_HEIGHT: 10.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F12847.965
G1 X123.944 Y128.256 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 52/75
; update layer progress
M73 L52
M991 S0 P51 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z10.6 I-1.16 J.368 P1  F42000
G1 X127.622 Y139.834 Z10.6
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5583
M204 S6000
G1 X127.622 Y140.141 E.01017
G1 X124.443 Y140.141 E.10544
G1 X124.443 Y128.859 E.37424
G1 X127.622 Y128.859 E.10544
G1 X127.622 Y129.166 E.01017
G1 X125.528 Y129.166 E.06946
G1 X125.528 Y139.834 E.35389
G1 X127.562 Y139.834 E.06747
; WIPE_START
G1 F8843.478
G1 X127.622 Y140.141 E-.11877
G1 X125.934 Y140.141 E-.64123
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.899 Y132.579 Z10.8 F42000
G1 X124.334 Y128.452 Z10.8
G1 Z10.4
G1 E.8 F1800
G1 F5583
M204 S6000
G1 X128.234 Y128.452 E.12937
G1 X128.234 Y128.853 E.0133
G1 X128.029 Y128.853 E.00681
G1 X128.029 Y129.573 E.02388
G1 X125.935 Y129.573 E.06946
G1 X125.935 Y139.427 E.32688
G1 X128.029 Y139.427 E.06946
G1 X128.029 Y140.147 E.02388
G1 X128.234 Y140.147 E.00681
G1 X128.234 Y140.548 E.0133
G1 X124.036 Y140.548 E.13925
G1 X124.036 Y128.452 E.40124
G1 X124.274 Y128.452 E.00789
; WIPE_START
G1 F8843.478
G1 X126.274 Y128.452 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.338 Y135.443 Z10.8 F42000
G1 X131.69 Y140.81 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5583
M204 S5000
G1 X130.092 Y140.81 E.0491
G1 X130.092 Y128.19 E.38778
G1 X131.69 Y128.19 E.0491
G1 X131.69 Y140.75 E.38593
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.092 Y140.81 E-.6076
G1 X130.092 Y140.409 E-.15241
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.867 Y133.492 Z10.8 F42000
G1 X124.334 Y128.06 Z10.8
G1 Z10.4
G1 E.8 F1800
G1 F5583
M204 S5000
G1 X124.334 Y128.019 E.00126
G1 X124.334 Y126.881 E.03497
G1 X124.334 Y126.84 E.00126
G1 X131.794 Y126.84 E.22922
G1 X131.794 Y128.06 E.03749
G1 X124.394 Y128.06 E.22738
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.334 Y128.019 E-.02761
G1 X124.334 Y126.881 E-.43244
G1 X124.334 Y126.84 E-.01558
G1 X125.082 Y126.84 E-.28437
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.52 Y126.035 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
G1 F5583
M204 S5000
G1 X125.52 Y116.965 E.2787
G1 X128.89 Y116.965 E.10355
G1 X128.89 Y126.035 E.2787
G1 X125.58 Y126.035 E.10171
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.567 Y124.035 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.443 Y126.041 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5583
M204 S6000
G1 X124.443 Y114.009 E.39911
G1 X131.996 Y114.009 E.25055
G1 X131.996 Y126.041 E.3991
G1 X129.689 Y126.041 E.07652
G1 X129.689 Y116.166 E.32757
G1 X124.721 Y116.166 E.16481
G1 X124.721 Y126.041 E.32757
G1 X124.503 Y126.041 E.00724
M204 S10000
G1 X124.036 Y126.448 F42000
G1 F5583
M204 S6000
G1 X124.036 Y113.602 E.42611
G1 X132.403 Y113.602 E.27756
G1 X132.403 Y126.448 E.42611
G1 X129.282 Y126.448 E.10352
G1 X129.282 Y116.573 E.32757
G1 X125.128 Y116.573 E.1378
G1 X125.128 Y126.448 E.32757
G1 X124.096 Y126.448 E.03424
; WIPE_START
G1 F8843.478
G1 X124.087 Y124.448 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.481 Y131.284 Z10.8 F42000
G1 X132.082 Y140.548 Z10.8
G1 Z10.4
G1 E.8 F1800
G1 F5583
M204 S6000
G1 X132.082 Y128.452 E.40124
G1 X132.403 Y128.452 E.01065
G1 X132.403 Y140.548 E.40124
G1 X132.142 Y140.548 E.00866
; WIPE_START
G1 F8843.478
G1 X132.132 Y138.548 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.801 Y139.035 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5583
M204 S5000
G1 X126.327 Y139.035 E.10675
G1 X126.327 Y138.994 E.00126
G1 X126.327 Y130.006 E.27618
G1 X126.327 Y129.965 E.00126
G1 X129.801 Y129.965 E.10675
G1 X129.801 Y138.975 E.27685
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.801 Y139.01 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.794 Y140.94 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
G1 F5583
M204 S5000
G1 X131.794 Y142.16 E.03749
G1 X124.334 Y142.16 E.22922
G1 X124.334 Y142.119 E.00126
G1 X124.334 Y140.981 E.03497
G1 X124.334 Y140.94 E.00126
G1 X131.734 Y140.94 E.22738
; WIPE_START
G1 F9547.055
M204 S6000
G1 X131.794 Y142.16 E-.46416
G1 X131.015 Y142.16 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.848 Y142.79 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
G1 F5583
M204 S5000
G3 X123.644 Y142.59 I-.004 J-.2 E.00979
G1 X123.644 Y113.408 E.89669
G3 X123.837 Y113.21 I.202 J.004 E.00933
G1 X132.596 Y113.21 E.26916
G3 X132.774 Y113.32 I-.013 J.221 E.0067
G1 X132.791 Y113.366 E.0015
G1 X132.795 Y141.992 E.87959
G3 X132.792 Y142.629 I-4.136 J.3 E.0196
G1 X132.773 Y142.685 E.00183
G1 X132.761 Y142.706 E.00074
G3 X132.602 Y142.79 I-.176 J-.141 E.00566
G1 X123.908 Y142.79 E.26715
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.75 Y142.768 E-.06065
G1 X123.695 Y142.727 E-.02584
G1 X123.655 Y142.661 E-.02954
G1 X123.644 Y142.59 E-.02735
G1 X123.644 Y140.967 E-.61662
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


G1 X123.989 Y140.744 F42000
G1 Z10.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.341271
G1 F5583
M204 S6000
G1 X123.989 Y142.356 E.03919
G1 X123.999 Y142.435 E.00193
G1 X124.068 Y142.455 E.00175
; LINE_WIDTH: 0.301019
G1 X124.138 Y142.475 E.00152
; LINE_WIDTH: 0.281043
G1 X131.99 Y142.475 E.15236
G1 X132.112 Y142.414 E.00264
; LINE_WIDTH: 0.35171
G1 X132.233 Y142.353 E.00343
; LINE_WIDTH: 0.399209
G1 X132.355 Y142.292 E.00396
; LINE_WIDTH: 0.446709
G1 X132.477 Y142.231 E.00448
; LINE_WIDTH: 0.494208
G1 X132.599 Y142.17 E.00501
M204 S10000
G1 X132.294 Y142.594 F42000
; LINE_WIDTH: 0.65244
G1 F5583
M204 S6000
G1 X132.294 Y140.744 E.09186
; WIPE_START
G1 F5906.287
G1 X132.294 Y142.594 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.885 Y139.713 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5583
M204 S2000
G1 X128.865 Y140.733 E.0443
G1 X128.456 Y140.608
G1 X129.822 Y139.242 E.05936
G1 X129.289 Y139.242
G1 X128.456 Y140.075 E.03619
G1 X128.251 Y139.747
G1 X128.756 Y139.242 E.02193
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.251 Y139.747 E-.27123
G1 X128.456 Y140.075 E-.14704
G1 X129.092 Y139.439 E-.34173
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.158 Y131.807 Z10.8 F42000
G1 X129.175 Y129.758 Z10.8
G1 Z10.4
G1 E.8 F1800
G1 F5583
M204 S2000
G1 X129.885 Y129.048 E.03084
G1 X129.885 Y128.515
G1 X128.642 Y129.758 E.05401
G1 X128.251 Y129.615
G1 X129.599 Y128.267 E.05857
G1 X129.066 Y128.267
G1 X128.456 Y128.877 E.02648
M204 S10000
G1 X128.559 Y128.979 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.130244
G1 F5583
M204 S6000
G1 X128.232 Y129.306 E.00329
; WIPE_START
G1 F15000
G1 X128.559 Y128.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.086 Y126.437 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
; LINE_WIDTH: 0.45586
G1 F5583
M204 S6000
G1 X125.324 Y126.437 E.12658
M204 S10000
G1 X123.989 Y126.644 F42000
; LINE_WIDTH: 0.34078
G1 F5583
M204 S6000
G1 X123.989 Y128.256 E.03912
; WIPE_START
G1 F12086.214
G1 X123.989 Y126.644 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.155 Y129.232 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38167
G1 F5583
M204 S6000
G1 X124.816 Y129.232 E.00935
G1 X124.816 Y139.768 E.29083
G1 X125.155 Y139.768 E.00935
G1 X125.155 Y129.292 E.28918
; WIPE_START
G1 F10627.305
G1 X125.155 Y131.292 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.178 Y128.305 Z10.8 F42000
G1 X132.294 Y128.256 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.65243
G1 F5583
M204 S6000
G1 X132.294 Y126.644 E.08006
; WIPE_START
G1 F5906.384
G1 X132.294 Y128.256 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.648 Y124.779 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5583
M204 S6000
G1 X131.648 Y125.693 E.03031
G1 X130.933 Y125.693 E.02371
G2 X130.153 Y124.724 I-7.667 J5.378 E.04127
G3 X130.058 Y123.414 I3.474 J-.912 E.04383
G3 X131.088 Y122.104 I10.359 J7.088 E.05534
G2 X130.704 Y120.138 I-1.522 J-.723 E.07114
G1 X130.153 Y119.483 E.02839
G3 X130.058 Y118.173 I3.474 J-.912 E.04383
G3 X131.088 Y116.862 I10.36 J7.089 E.05534
G2 X130.704 Y114.897 I-1.522 J-.723 E.07114
G1 X130.251 Y114.358 E.02336
G1 X131.648 Y114.358 E.04635
G1 X131.648 Y114.589 E.00767
M204 S10000
G1 X130.038 Y115.953 F42000
G1 F5583
M204 S6000
G1 X130.038 Y115.818 E.00448
G1 X128.544 Y115.818 E.04953
G1 X128.468 Y115.552 E.00917
G3 X127.522 Y114.358 I8.502 J-7.704 E.05057
G1 X125.009 Y114.358 E.08335
G3 X125.943 Y115.552 I-8.511 J7.612 E.05032
G1 X125.981 Y115.818 E.0089
G1 X124.791 Y115.818 E.03946
G1 X124.791 Y115.379 E.01456
; CHANGE_LAYER
; Z_HEIGHT: 10.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F8843.478
G1 X124.791 Y115.818 E-.16678
G1 X125.981 Y115.818 E-.45199
G1 X125.943 Y115.552 E-.10193
G1 X125.879 Y115.471 E-.03931
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 53/75
; update layer progress
M73 L53
M991 S0 P52 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z10.8 I-1.215 J.06 P1  F42000
G1 X127.08 Y139.834 Z10.8
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5325
M204 S6000
M73 P78 R4
G1 X127.08 Y140.141 E.01017
G1 X124.479 Y140.141 E.0863
G1 X124.479 Y128.859 E.37424
G1 X127.08 Y128.859 E.0863
G1 X127.08 Y129.166 E.01017
G1 X125.581 Y129.166 E.04973
G1 X125.581 Y139.834 E.35389
G1 X127.02 Y139.834 E.04774
M204 S10000
G1 X127.487 Y139.427 F42000
G1 F5325
M204 S6000
G1 X127.487 Y140.548 E.03718
G1 X124.072 Y140.548 E.1133
G1 X124.072 Y128.452 E.40124
G1 X127.487 Y128.452 E.1133
G1 X127.487 Y129.573 E.03718
G1 X125.988 Y129.573 E.04973
G1 X125.988 Y139.427 E.32688
G1 X127.427 Y139.427 E.04774
; WIPE_START
G1 F8843.478
G1 X127.487 Y140.548 E-.42654
G1 X126.61 Y140.548 E-.33346
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.273 Y133.034 Z11 F42000
G1 X124.387 Y128.06 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5325
M204 S5000
G1 X124.387 Y128.019 E.00126
G1 X124.387 Y126.881 E.03497
G1 X124.387 Y126.84 E.00126
G1 X131.847 Y126.84 E.22922
G1 X131.847 Y128.06 E.03749
G1 X124.447 Y128.06 E.22738
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.387 Y128.019 E-.02761
G1 X124.387 Y126.881 E-.43244
G1 X124.387 Y126.84 E-.01558
G1 X125.136 Y126.84 E-.28437
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.689 Y126.041 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5325
M204 S6000
G1 X129.689 Y116.166 E.32757
G1 X124.479 Y116.166 E.17284
G1 X124.479 Y114.009 E.07153
G1 X132.041 Y114.009 E.25086
G1 X132.041 Y126.041 E.3991
G1 X129.749 Y126.041 E.07603
; WIPE_START
G1 F8843.478
G1 X129.737 Y124.041 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.387 Y126.448 Z11 F42000
G1 Z10.6
G1 E.8 F1800
G1 F5325
M204 S6000
G1 X124.072 Y126.448 E.01047
G1 X124.072 Y113.602 E.42611
G1 X132.448 Y113.602 E.27787
G1 X132.448 Y126.448 E.42611
G1 X129.282 Y126.448 E.10503
G1 X129.282 Y116.573 E.32757
G1 X125.128 Y116.573 E.1378
G1 X125.128 Y126.448 E.32757
G1 X124.447 Y126.448 E.02258
; WIPE_START
G1 F8843.478
G1 X124.072 Y126.448 E-.1427
G1 X124.072 Y124.823 E-.6173
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.52 Y126.035 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5325
M204 S5000
G1 X125.52 Y116.965 E.2787
G1 X128.89 Y116.965 E.10355
G1 X128.89 Y126.035 E.2787
G1 X125.58 Y126.035 E.10171
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.567 Y124.035 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.388 Y131.127 Z11 F42000
G1 X132.136 Y140.548 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5325
M204 S6000
G1 X132.136 Y128.452 E.40124
G1 X132.448 Y128.452 E.01037
G1 X132.448 Y140.548 E.40124
G1 X132.196 Y140.548 E.00838
; WIPE_START
G1 F8843.478
G1 X132.186 Y138.548 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.346 Y139.035 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5325
M204 S5000
G1 X126.38 Y139.035 E.09113
G1 X126.38 Y138.994 E.00126
G1 X126.38 Y130.006 E.27618
G1 X126.38 Y129.965 E.00126
G1 X129.346 Y129.965 E.09113
G1 X129.346 Y128.19 E.05454
G1 X131.744 Y128.19 E.07368
G1 X131.744 Y140.81 E.38778
G1 X129.346 Y140.81 E.07368
G1 X129.346 Y139.095 E.0527
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.346 Y139.055 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.847 Y140.94 Z11 F42000
G1 Z10.6
G1 E.8 F1800
G1 F5325
M204 S5000
G1 X131.847 Y142.16 E.03749
G1 X124.387 Y142.16 E.22922
G1 X124.387 Y142.119 E.00126
G1 X124.387 Y140.981 E.03497
G1 X124.387 Y140.94 E.00126
G1 X131.787 Y140.94 E.22738
; WIPE_START
G1 F9547.055
M204 S6000
G1 X131.847 Y142.16 E-.46416
G1 X131.069 Y142.16 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.884 Y142.79 Z11 F42000
G1 Z10.6
G1 E.8 F1800
G1 F5325
M204 S5000
G3 X123.68 Y142.59 I-.004 J-.2 E.00979
G1 X123.68 Y113.408 E.89669
G3 X123.872 Y113.21 I.202 J.004 E.00933
G1 X132.689 Y113.217 E.27091
G3 X132.82 Y113.32 I-.044 J.19 E.0053
G1 X132.836 Y113.366 E.00148
G1 X132.841 Y141.992 E.87961
G3 X132.838 Y142.629 I-4.115 J.3 E.01959
G1 X132.818 Y142.685 E.00183
G1 X132.806 Y142.706 E.00073
G3 X132.647 Y142.79 I-.177 J-.142 E.00567
G1 X123.944 Y142.79 E.26743
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.816 Y142.78 E-.04878
G1 X123.735 Y142.731 E-.03586
G1 X123.691 Y142.662 E-.03119
G1 X123.68 Y142.59 E-.02779
G1 X123.68 Y140.968 E-.61638
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


G1 X124.034 Y140.744 F42000
G1 Z10.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.358462
G1 F5325
M204 S6000
G1 X124.034 Y142.356 E.04145
G1 X124.042 Y142.428 E.00186
G1 X124.117 Y142.451 E.00202
; LINE_WIDTH: 0.304348
G1 X124.191 Y142.475 E.00167
; LINE_WIDTH: 0.281037
G1 X132.043 Y142.475 E.15236
G1 X132.164 Y142.415 E.00261
; LINE_WIDTH: 0.351709
G1 X132.284 Y142.355 E.00338
; LINE_WIDTH: 0.399209
G1 X132.404 Y142.294 E.0039
; LINE_WIDTH: 0.446708
G1 X132.524 Y142.234 E.00442
; LINE_WIDTH: 0.494207
G1 X132.644 Y142.174 E.00494
M204 S10000
G1 X132.344 Y142.594 F42000
; LINE_WIDTH: 0.64415
G1 F5325
M204 S6000
G1 X132.344 Y140.744 E.09061
; WIPE_START
G1 F5987.726
G1 X132.344 Y142.594 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.138 Y140.07 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5325
M204 S2000
G1 X128.311 Y139.242 E.03598
G1 X127.777 Y139.242
G1 X129.116 Y140.581 E.05818
G1 X128.734 Y140.733
G1 X127.71 Y139.708 E.04451
G1 X127.71 Y140.242
G1 X128.201 Y140.733 E.02134
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.71 Y140.242 E-.26389
G1 X127.71 Y139.708 E-.20264
G1 X128.256 Y140.254 E-.29348
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.218 Y132.899 Z11 F42000
G1 X125.204 Y129.236 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.3905
G1 F5325
M204 S6000
G1 X124.856 Y129.236 E.00984
G1 X124.856 Y139.764 E.29816
G1 X125.204 Y139.764 E.00984
G1 X125.204 Y129.296 E.29646
; WIPE_START
G1 F10357.327
G1 X125.204 Y131.296 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.034 Y128.256 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.35844
G1 F5325
M204 S6000
G1 X124.034 Y126.644 E.04144
M204 S10000
G1 X124.6 Y126.244 F42000
; LINE_WIDTH: 0.69219
G1 F5325
M204 S6000
G1 X124.6 Y116.369 E.52245
; WIPE_START
G1 F5544.689
G1 X124.6 Y118.369 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.505 Y114.358 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5325
M204 S6000
G1 X124.877 Y114.358 E.05401
G2 X125.829 Y115.552 I6.742 J-4.398 E.05074
G1 X125.914 Y115.818 E.00925
G1 X128.615 Y115.818 E.08962
G1 X128.585 Y115.552 E.00886
G2 X127.651 Y114.358 I-6.735 J4.305 E.05038
G1 X130.118 Y114.358 E.08182
G1 X130.502 Y114.897 E.02196
G3 X131.206 Y116.862 I-1.186 J1.533 E.07313
G3 X130.171 Y118.173 I-7.392 J-4.774 E.05547
G1 X130.038 Y118.59 E.01454
G1 X130.038 Y119.486 E.02973
G1 X130.502 Y120.138 E.02655
G3 X131.206 Y122.104 I-1.186 J1.533 E.07313
G3 X130.171 Y123.414 I-7.393 J-4.774 E.05547
G1 X130.038 Y123.831 E.01454
G1 X130.038 Y124.728 E.02973
G2 X130.773 Y125.693 I5.43 J-3.378 E.04031
G1 X131.693 Y125.693 E.03051
G1 X131.693 Y124.984 E.02351
; WIPE_START
G1 F8843.478
G1 X131.693 Y125.693 E-.26928
G1 X130.773 Y125.693 E-.34947
G1 X130.548 Y125.397 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.344 Y126.644 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.64415
G1 F5325
M204 S6000
G1 X132.344 Y128.256 E.07897
; WIPE_START
G1 F5987.726
G1 X132.344 Y126.644 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.086 Y126.437 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; LINE_WIDTH: 0.45586
G1 F5325
M204 S6000
G1 X125.324 Y126.437 E.12658
; WIPE_START
G1 F8717.973
G1 X127.324 Y126.437 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.534 Y128.267 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5325
M204 S2000
G1 X129.138 Y128.872 E.02627
G1 X129.138 Y129.405
G1 X128.001 Y128.267 E.04944
G1 X127.71 Y128.51
G1 X128.958 Y129.758 E.05422
G1 X128.424 Y129.758
G1 X127.71 Y129.043 E.03105
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.424 Y129.758 E-.38394
G1 X128.958 Y129.758 E-.20264
G1 X128.635 Y129.435 E-.17342
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.119 Y129.776 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.120595
G1 F5325
M204 S6000
G1 X129.119 Y129.425 E.00222
; WIPE_START
G1 F15000
G1 X129.119 Y129.776 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.942 Y128.383 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; LINE_WIDTH: 0.10577
G1 F5325
M204 S6000
G1 X128.852 Y128.249 E.00083
; CHANGE_LAYER
; Z_HEIGHT: 10.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X128.942 Y128.383 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 54/75
; update layer progress
M73 L54
M991 S0 P53 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z11 I-1.13 J-.453 P1  F42000
G1 X125.635 Y136.633 Z11
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5217
M204 S6000
G1 X125.635 Y139.834 E.1062
G1 X126.334 Y139.834 E.0232
G1 X126.334 Y140.141 E.01017
G1 X124.515 Y140.141 E.06034
G1 X124.515 Y128.859 E.37424
G1 X126.334 Y128.859 E.06034
G1 X126.334 Y129.166 E.01017
G1 X125.635 Y129.166 E.0232
G1 X125.635 Y136.573 E.2457
; WIPE_START
G1 F8843.478
G1 X125.635 Y138.573 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.741 Y139.427 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
G1 F5217
M204 S6000
M73 P79 R4
G1 X126.741 Y140.548 E.03718
G1 X124.108 Y140.548 E.08735
G1 X124.108 Y128.452 E.40124
G1 X126.741 Y128.452 E.08735
G1 X126.741 Y129.573 E.03718
G1 X126.042 Y129.573 E.0232
G1 X126.042 Y139.427 E.32688
G1 X126.681 Y139.427 E.02121
; WIPE_START
G1 F8843.478
G1 X126.741 Y140.548 E-.42654
G1 X125.864 Y140.548 E-.33346
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125 Y132.965 Z11.2 F42000
G1 X124.441 Y128.06 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5217
M204 S5000
G1 X124.441 Y128.019 E.00126
G1 X124.441 Y126.881 E.03497
G1 X124.441 Y126.84 E.00126
G1 X131.901 Y126.84 E.22922
G1 X131.901 Y128.06 E.03749
G1 X124.501 Y128.06 E.22738
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.441 Y128.019 E-.02761
G1 X124.441 Y126.881 E-.43244
G1 X124.441 Y126.84 E-.01558
G1 X125.189 Y126.84 E-.28437
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.689 Y126.041 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5217
M204 S6000
G1 X129.689 Y116.166 E.32757
G1 X124.515 Y116.166 E.17165
G1 X124.515 Y114.009 E.07153
G1 X132.087 Y114.009 E.25117
G1 X132.087 Y126.041 E.39911
G1 X129.749 Y126.041 E.07753
; WIPE_START
G1 F8843.478
G1 X129.737 Y124.041 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.441 Y126.448 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
G1 F5217
M204 S6000
G1 X124.108 Y126.448 E.01105
G1 X124.108 Y113.602 E.42611
G1 X132.494 Y113.602 E.27818
G1 X132.494 Y126.448 E.42611
G1 X129.282 Y126.448 E.10653
G1 X129.282 Y116.573 E.32757
G1 X125.128 Y116.573 E.1378
G1 X125.128 Y126.448 E.32757
G1 X124.501 Y126.448 E.02081
; WIPE_START
G1 F8843.478
G1 X124.108 Y126.448 E-.1494
G1 X124.108 Y124.841 E-.6106
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.52 Y126.035 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5217
M204 S5000
G1 X125.52 Y116.965 E.2787
G1 X128.89 Y116.965 E.10355
G1 X128.89 Y126.035 E.2787
G1 X125.58 Y126.035 E.10171
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.567 Y124.035 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.408 Y131.119 Z11.2 F42000
G1 X132.189 Y140.548 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5217
M204 S6000
G1 X132.189 Y128.452 E.40124
G1 X132.494 Y128.452 E.0101
G1 X132.494 Y140.548 E.40124
G1 X132.249 Y140.548 E.00811
; WIPE_START
G1 F8843.478
G1 X132.239 Y138.548 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.599 Y139.035 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5217
M204 S5000
G1 X126.434 Y139.035 E.06654
G1 X126.434 Y138.994 E.00126
G1 X126.434 Y130.006 E.27618
G1 X126.434 Y129.965 E.00126
G1 X128.599 Y129.965 E.06654
G1 X128.599 Y128.19 E.05454
G1 X131.797 Y128.19 E.09826
G1 X131.797 Y140.81 E.38778
G1 X128.599 Y140.81 E.09826
G1 X128.599 Y139.095 E.0527
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.6 Y139.04 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.901 Y140.94 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
G1 F5217
M204 S5000
G1 X131.901 Y142.16 E.03749
G1 X124.441 Y142.16 E.22922
G1 X124.441 Y142.119 E.00126
G1 X124.441 Y140.981 E.03497
G1 X124.441 Y140.94 E.00126
G1 X131.841 Y140.94 E.22738
; WIPE_START
G1 F9547.055
M204 S6000
G1 X131.901 Y142.16 E-.46416
G1 X131.122 Y142.16 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.92 Y142.79 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
G1 F5217
M204 S5000
G3 X123.716 Y142.59 I-.004 J-.2 E.00979
G1 X123.716 Y113.408 E.89669
G3 X123.908 Y113.21 I.202 J.004 E.00932
G1 X132.735 Y113.217 E.27121
G3 X132.865 Y113.32 I-.045 J.19 E.00529
G1 X132.882 Y113.366 E.0015
G1 X132.886 Y141.992 E.87959
G3 X132.883 Y142.629 I-4.119 J.3 E.01958
G1 X132.863 Y142.685 E.00184
G1 X132.852 Y142.705 E.00071
G3 X132.693 Y142.79 I-.178 J-.143 E.00568
G1 X123.98 Y142.79 E.26773
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.852 Y142.78 E-.04877
G1 X123.77 Y142.731 E-.03618
G1 X123.727 Y142.662 E-.03082
G1 X123.716 Y142.59 E-.02779
G1 X123.716 Y140.968 E-.61644
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


G1 X124.078 Y140.744 F42000
G1 Z10.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.376157
G1 F5217
M204 S6000
G1 X124.078 Y142.356 E.04377
G1 X124.085 Y142.421 E.00177
G1 X124.138 Y142.439 E.00153
; LINE_WIDTH: 0.334805
G1 X124.191 Y142.457 E.00134
; LINE_WIDTH: 0.298832
G1 X124.245 Y142.475 E.00118
; LINE_WIDTH: 0.281032
G1 X132.097 Y142.475 E.15235
G1 X132.215 Y142.415 E.00257
; LINE_WIDTH: 0.351689
G1 X132.334 Y142.356 E.00334
; LINE_WIDTH: 0.399189
G1 X132.453 Y142.297 E.00385
; LINE_WIDTH: 0.446688
G1 X132.571 Y142.238 E.00436
; LINE_WIDTH: 0.494187
G1 X132.69 Y142.178 E.00488
M204 S10000
G1 X132.393 Y142.594 F42000
; LINE_WIDTH: 0.63585
G1 F5217
M204 S6000
G1 X132.393 Y140.744 E.08936
; WIPE_START
G1 F6071.544
G1 X132.393 Y142.594 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.799 Y140.733 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5217
M204 S2000
G1 X128.392 Y140.139 E.02578
G1 X128.392 Y139.606
G1 X127.266 Y140.733 E.04895
G1 X126.964 Y140.501
G1 X128.223 Y139.242 E.05471
G1 X127.689 Y139.242
G1 X126.964 Y139.968 E.03154
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.689 Y139.242 E-.39003
G1 X128.223 Y139.242 E-.20264
G1 X127.911 Y139.554 E-.16733
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.379 Y139.593 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.107332
G1 F5217
M204 S6000
G1 X128.379 Y139.224 E.00194
; WIPE_START
G1 F15000
G1 X128.379 Y139.593 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.388 Y131.96 Z11.2 F42000
G1 X128.392 Y128.941 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5217
M204 S2000
G1 X127.575 Y129.758 E.03549
G1 X127.042 Y129.758
G1 X128.381 Y128.419 E.05818
G1 X127.999 Y128.267
G1 X126.964 Y129.303 E.045
G1 X126.964 Y128.77
G1 X127.466 Y128.267 E.02183
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.964 Y128.77 E-.26997
G1 X126.964 Y129.303 E-.20264
G1 X127.498 Y128.768 E-.28739
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.253 Y129.241 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.39933
G1 F5217
M204 S6000
G1 X124.897 Y129.241 E.01035
G1 X124.897 Y139.759 E.30548
G1 X125.253 Y139.759 E.01035
G1 X125.253 Y129.301 E.30374
; WIPE_START
G1 F10100.727
G1 X125.253 Y131.301 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.078 Y128.256 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.37609
G1 F5217
M204 S6000
G1 X124.078 Y126.644 E.04376
M204 S10000
G1 X124.618 Y126.244 F42000
; LINE_WIDTH: 0.65625
G1 F5217
M204 S6000
G1 X124.618 Y116.369 E.49353
; WIPE_START
G1 F5869.597
G1 X124.618 Y118.369 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.159 Y114.358 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5217
M204 S6000
G1 X124.863 Y114.358 E.043
G1 X124.863 Y114.69 E.01102
G2 X125.733 Y115.552 I4.005 J-3.17 E.04073
G1 X125.868 Y115.818 E.00988
G1 X128.714 Y115.818 E.0944
G1 X128.732 Y115.552 E.00883
G2 X127.77 Y114.358 I-2.305 J.872 E.05175
G1 X129.929 Y114.358 E.07164
G2 X130.974 Y115.552 I2.933 J-1.512 E.05317
G3 X131.353 Y116.862 I-1.364 J1.104 E.04647
G1 X131.238 Y117.19 E.01152
G3 X130.267 Y118.173 I-4.554 J-3.527 E.04593
G1 X130.038 Y118.625 E.01682
G1 X130.038 Y119.851 E.04068
G2 X130.974 Y120.793 I4.369 J-3.407 E.04418
G3 X131.353 Y122.104 I-1.364 J1.104 E.04647
G1 X131.238 Y122.431 E.01152
G3 X130.267 Y123.414 I-4.554 J-3.527 E.04593
G1 X130.038 Y123.866 E.01682
G1 X130.038 Y125.093 E.04068
G2 X130.61 Y125.693 I2.771 J-2.071 E.02758
G1 X131.738 Y125.693 E.03742
G1 X131.738 Y125.192 E.0166
; WIPE_START
G1 F8843.478
G1 X131.738 Y125.693 E-.19013
G1 X130.61 Y125.693 E-.42862
G1 X130.354 Y125.424 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.393 Y126.644 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.635832
G1 F5217
M204 S6000
G1 X132.393 Y128.256 E.07788
; WIPE_START
G1 F6071.729
G1 X132.393 Y126.644 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.086 Y126.437 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
; LINE_WIDTH: 0.45586
G1 F5217
M204 S6000
G1 X125.324 Y126.437 E.12658
; CHANGE_LAYER
; Z_HEIGHT: 11
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8717.973
G1 X127.324 Y126.437 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 55/75
; update layer progress
M73 L55
M991 S0 P54 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z11.2 I-.171 J-1.205 P1  F42000
G1 X124.495 Y126.84 Z11.2
G1 Z11
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8580
M204 S5000
G1 X131.954 Y126.84 E.22922
G1 X131.954 Y128.06 E.03749
G1 X124.495 Y128.06 E.22922
G1 X124.495 Y128.019 E.00126
G1 X124.495 Y126.9 E.03438
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.494 Y126.884 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.874 Y134.491 Z11.4 F42000
G1 X125.688 Y136.77 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8580
M204 S6000
G1 X125.688 Y136.856 E.00286
G1 X125.588 Y136.856 E.00334
G1 X125.588 Y140.141 E.10897
G1 X124.551 Y140.141 E.03439
G1 X124.551 Y128.859 E.37424
G1 X125.588 Y128.859 E.03439
G1 X125.588 Y132.144 E.10897
G1 X125.688 Y132.144 E.00334
G1 X125.688 Y136.71 E.15144
M204 S10000
G1 X126.095 Y137.177 F42000
G1 F8580
M204 S6000
G1 X126.095 Y137.263 E.00286
G1 X125.995 Y137.263 E.00334
G1 X125.995 Y140.548 E.10897
G1 X124.144 Y140.548 E.0614
G1 X124.144 Y128.452 E.40124
G1 X125.995 Y128.452 E.0614
G1 X125.995 Y131.737 E.10897
G1 X126.095 Y131.737 E.00334
G1 X126.095 Y137.117 E.17845
; WIPE_START
G1 F8843.478
G1 X126.095 Y137.263 E-.0556
G1 X125.995 Y137.263 E-.03828
G1 X125.995 Y139.016 E-.66612
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.15 Y131.43 Z11.4 F42000
G1 X124.551 Y126.041 Z11.4
G1 Z11
G1 E.8 F1800
G1 F8580
M204 S6000
G1 X124.551 Y114.009 E.3991
G1 X132.132 Y114.009 E.25148
G1 X132.132 Y126.041 E.39911
G1 X124.611 Y126.041 E.24949
M204 S10000
M73 P80 R4
G1 X124.495 Y126.448 F42000
G1 F8580
M204 S6000
G1 X124.144 Y126.448 E.01164
G1 X124.144 Y113.602 E.42611
G1 X132.539 Y113.602 E.27849
G1 X132.539 Y126.448 E.42611
G1 X124.555 Y126.448 E.26486
; WIPE_START
G1 F8843.478
G1 X124.144 Y126.448 E-.15612
G1 X124.144 Y124.859 E-.60388
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.645 Y131.641 Z11.4 F42000
G1 X132.243 Y140.548 Z11.4
G1 Z11
G1 E.8 F1800
G1 F8580
M204 S6000
G1 X132.243 Y128.452 E.40124
G1 X132.539 Y128.452 E.00982
G1 X132.539 Y140.548 E.40124
G1 X132.303 Y140.548 E.00783
; WIPE_START
G1 F8843.478
G1 X132.293 Y138.548 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.853 Y139.035 Z11.4 F42000
G1 Z11
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8580
M204 S5000
G1 X126.487 Y139.035 E.04196
G1 X126.487 Y138.994 E.00126
G1 X126.487 Y130.006 E.27618
G1 X126.487 Y129.965 E.00126
G1 X127.853 Y129.965 E.04196
G1 X127.853 Y128.19 E.05454
G1 X131.851 Y128.19 E.12284
G1 X131.851 Y140.81 E.38778
G1 X127.853 Y140.81 E.12284
G1 X127.853 Y139.095 E.0527
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.487 Y139.035 E-.51944
G1 X126.487 Y138.994 E-.01558
G1 X126.487 Y138.402 E-.22499
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.954 Y140.94 Z11.4 F42000
G1 Z11
G1 E.8 F1800
G1 F8580
M204 S5000
G1 X131.954 Y142.16 E.03749
G1 X124.495 Y142.16 E.22922
G1 X124.495 Y142.119 E.00126
G1 X124.495 Y140.981 E.03497
G1 X124.495 Y140.94 E.00126
G1 X131.894 Y140.94 E.22738
; WIPE_START
G1 F9547.055
M204 S6000
G1 X131.954 Y142.16 E-.46416
G1 X131.176 Y142.16 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.956 Y142.79 Z11.4 F42000
G1 Z11
G1 E.8 F1800
G1 F8580
M204 S5000
G3 X123.752 Y142.59 I-.005 J-.2 E.00979
G1 X123.752 Y113.408 E.89669
G3 X123.944 Y113.21 I.202 J.004 E.00933
G1 X132.78 Y113.217 E.2715
G3 X132.91 Y113.32 I-.045 J.19 E.00528
G1 X132.927 Y113.366 E.00151
G1 X132.931 Y141.992 E.87959
G3 X132.928 Y142.628 I-4.138 J.3 E.01957
G1 X132.908 Y142.685 E.00186
G1 X132.897 Y142.705 E.00069
G3 X132.738 Y142.79 I-.178 J-.143 E.00568
G1 X124.016 Y142.79 E.26802
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.888 Y142.78 E-.04875
G1 X123.812 Y142.736 E-.03328
G1 X123.763 Y142.662 E-.03381
G1 X123.752 Y142.59 E-.0278
G1 X123.752 Y140.968 E-.61636
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


G1 X124.123 Y140.744 F42000
G1 Z11
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.393529
G1 F8580
M204 S6000
G1 X124.123 Y142.356 E.04605
G1 X124.128 Y142.414 E.00166
G1 X124.185 Y142.434 E.00173
; LINE_WIDTH: 0.342052
G1 X124.242 Y142.455 E.00147
; LINE_WIDTH: 0.301246
G1 X124.298 Y142.475 E.00127
; LINE_WIDTH: 0.281017
G1 X132.15 Y142.475 E.15234
G1 X132.267 Y142.416 E.00254
; LINE_WIDTH: 0.351683
G1 X132.384 Y142.358 E.00329
; LINE_WIDTH: 0.399179
G1 X132.501 Y142.299 E.0038
; LINE_WIDTH: 0.446674
G1 X132.618 Y142.241 E.0043
; LINE_WIDTH: 0.494169
G1 F7977.862
G1 X132.735 Y142.182 E.00481
M204 S10000
G1 X132.443 Y142.594 F42000
; LINE_WIDTH: 0.62754
G1 F6157.846
M204 S6000
G1 X132.443 Y140.744 E.08811
; WIPE_START
G1 X132.443 Y142.594 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.244 Y139.242 Z11.4 F42000
G1 Z11
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F8580
M204 S2000
G1 X127.646 Y139.644 E.01745
G1 X127.646 Y140.177
G1 X126.711 Y139.242 E.04063
G1 X126.217 Y139.282
G1 X127.516 Y140.581 E.05646
G1 X127.134 Y140.733
G1 X126.217 Y139.815 E.03986
G1 X126.217 Y140.349
G1 X126.601 Y140.733 E.01669
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.217 Y140.349 E-.20641
G1 X126.217 Y139.815 E-.20264
G1 X126.87 Y140.468 E-.35095
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.069 Y139.937 Z11.4 F42000
G1 Z11
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.67265
G1 F5716.736
M204 S6000
G1 X125.069 Y136.652 E.16857
M204 S10000
G1 X125.302 Y132.734 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.40816
G1 F8580
M204 S6000
G1 X124.937 Y132.734 E.01087
G1 X124.937 Y136.266 E.10514
G1 X125.302 Y136.266 E.01087
G1 X125.302 Y132.794 E.10335
M204 S10000
G1 X125.069 Y132.348 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.67265
G1 F5716.736
M204 S6000
G1 X125.069 Y129.063 E.16857
; WIPE_START
G1 X125.069 Y131.063 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.123 Y128.256 Z11.4 F42000
G1 Z11
G1 E.8 F1800
; LINE_WIDTH: 0.39375
G1 F8580
M204 S6000
G1 X124.123 Y126.644 E.04608
; WIPE_START
G1 F10261.38
G1 X124.123 Y128.256 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.714 Y125.705 Z11.4 F42000
G1 Z11
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.42577
M106 S255
G1 F3000
M204 S6000
G1 X129.725 Y125.705 E.15631
G1 X129.725 Y125.322 E.01194
G1 X124.884 Y125.322 E.15102
G1 X124.884 Y124.939 E.01194
G1 X129.725 Y124.939 E.15102
G1 X129.725 Y124.556 E.01194
G1 X124.884 Y124.556 E.15102
G1 X124.884 Y124.173 E.01194
G1 X129.725 Y124.173 E.15102
G1 X129.725 Y123.79 E.01194
G1 X124.884 Y123.79 E.15102
G1 X124.884 Y123.408 E.01194
G1 X129.725 Y123.408 E.15102
G1 X129.725 Y123.025 E.01194
G1 X124.884 Y123.025 E.15102
G1 X124.884 Y122.642 E.01194
G1 X129.725 Y122.642 E.15102
G1 X129.725 Y122.259 E.01194
G1 X124.884 Y122.259 E.15102
G1 X124.884 Y121.876 E.01194
G1 X129.725 Y121.876 E.15102
G1 X129.725 Y121.493 E.01194
G1 X124.884 Y121.493 E.15102
G1 X124.884 Y121.11 E.01194
G1 X129.725 Y121.11 E.15102
G1 X129.725 Y120.728 E.01194
G1 X124.884 Y120.728 E.15102
G1 X124.884 Y120.345 E.01194
G1 X129.725 Y120.345 E.15102
G1 X129.725 Y119.962 E.01194
G1 X124.884 Y119.962 E.15102
G1 X124.884 Y119.579 E.01194
G1 X129.725 Y119.579 E.15102
G1 X129.725 Y119.196 E.01194
G1 X124.884 Y119.196 E.15102
G1 X124.884 Y118.813 E.01194
G1 X129.725 Y118.813 E.15102
G1 X129.725 Y118.431 E.01194
G1 X124.884 Y118.431 E.15102
G1 X124.884 Y118.048 E.01194
G1 X129.725 Y118.048 E.15102
G1 X129.725 Y117.665 E.01194
G1 X124.884 Y117.665 E.15102
G1 X124.884 Y117.282 E.01194
G1 X129.725 Y117.282 E.15102
G1 X129.725 Y116.899 E.01194
G1 X124.884 Y116.899 E.15102
G1 X124.884 Y116.516 E.01194
G1 X129.725 Y116.516 E.15102
G1 X129.725 Y116.142 E.01168
G1 X124.714 Y116.133 E.15631
M106 S201.45
M204 S10000
G1 X125.86 Y114.358 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8580
M204 S6000
G1 X124.899 Y114.358 E.03186
G1 X124.899 Y115.025 E.02215
G1 X125.65 Y115.552 E.03042
G1 X125.783 Y115.738 E.0076
G1 X128.871 Y115.738 E.10243
G2 X128.664 Y114.897 I-.741 J-.263 E.03044
G1 X127.895 Y114.358 E.03115
G1 X129.706 Y114.358 E.06007
M73 P80 R3
G2 X129.957 Y114.897 I.558 J.068 E.0208
G1 X130.891 Y115.552 E.03785
G3 X131.544 Y116.862 I-1.465 J1.547 E.04957
G3 X131.284 Y117.518 I-.655 J.12 E.02463
G1 X130.35 Y118.173 E.03785
G1 X130.117 Y118.498 E.01327
G1 X130.117 Y120.25 E.05813
G3 X131.544 Y122.104 I-1.17 J2.377 E.08036
G3 X131.284 Y122.759 I-.655 J.12 E.02463
G1 X130.35 Y123.414 E.03785
G1 X130.117 Y123.739 E.01327
G1 X130.117 Y125.492 E.05813
G1 X130.403 Y125.693 E.01161
G1 X131.784 Y125.693 E.04579
G1 X131.784 Y125.445 E.00823
; WIPE_START
G1 F8843.478
G1 X131.784 Y125.693 E-.09425
G1 X130.403 Y125.693 E-.52451
G1 X130.117 Y125.492 E-.13296
G1 X130.117 Y125.47 E-.00828
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.443 Y126.644 Z11.4 F42000
G1 Z11
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.627532
G1 F6157.933
M204 S6000
G1 X132.443 Y128.256 E.07679
; WIPE_START
G1 X132.443 Y126.644 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.646 Y128.979 Z11.4 F42000
G1 Z11
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F8580
M204 S2000
G1 X126.934 Y128.267 E.03092
G1 X126.401 Y128.267
G1 X127.646 Y129.512 E.05409
G1 X127.358 Y129.758
G1 X126.217 Y128.617 E.04957
G1 X126.217 Y129.15
G1 X126.825 Y129.758 E.0264
M204 S10000
G1 X126.239 Y128.249 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.12405
G1 F8580
M204 S6000
G1 X126.239 Y128.595 E.00229
; WIPE_START
G1 F15000
G1 X126.239 Y128.249 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.665 Y128.611 Z11.4 F42000
G1 Z11
G1 E.8 F1800
; LINE_WIDTH: 0.160695
G1 F8580
M204 S6000
G1 X127.428 Y128.42 E.00292
G1 X127.313 Y128.249 E.00198
; CHANGE_LAYER
; Z_HEIGHT: 11.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X127.428 Y128.42 E-.30712
G1 X127.665 Y128.611 E-.45288
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 56/75
; update layer progress
M73 L56
M991 S0 P55 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z11.4 I.601 J-1.058 P1  F42000
G1 X124.548 Y126.84 Z11.4
G1 Z11.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5812
M204 S5000
G1 X132.008 Y126.84 E.22922
G1 X132.008 Y128.06 E.03749
G1 X124.548 Y128.06 E.22922
G1 X124.548 Y128.019 E.00126
G1 X124.548 Y126.9 E.03438
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.548 Y126.884 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.928 Y134.491 Z11.6 F42000
G1 X125.742 Y136.77 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5812
M204 S6000
G1 X125.742 Y136.856 E.00286
G1 X124.841 Y136.856 E.02988
G1 X124.841 Y140.141 E.10897
G1 X124.587 Y140.141 E.00844
G1 X124.587 Y128.859 E.37424
G1 X124.841 Y128.859 E.00844
G1 X124.841 Y132.144 E.10897
G1 X125.742 Y132.144 E.02988
G1 X125.742 Y136.71 E.15144
M204 S10000
G1 X126.149 Y137.177 F42000
G1 F5812
M204 S6000
G1 X126.149 Y137.263 E.00286
G1 X125.248 Y137.263 E.02988
G1 X125.248 Y140.548 E.10897
G1 X124.18 Y140.548 E.03545
G1 X124.18 Y128.452 E.40124
G1 X125.248 Y128.452 E.03545
G1 X125.248 Y131.737 E.10897
G1 X126.149 Y131.737 E.02988
G1 X126.149 Y137.117 E.17845
; WIPE_START
G1 F8843.478
G1 X126.149 Y137.263 E-.0556
G1 X125.248 Y137.263 E-.34228
G1 X125.248 Y138.216 E-.36212
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.834 Y130.595 Z11.6 F42000
G1 X124.587 Y126.041 Z11.6
G1 Z11.2
G1 E.8 F1800
G1 F5812
M204 S6000
G1 X124.587 Y114.009 E.39911
G1 X132.177 Y114.009 E.25179
G1 X132.177 Y126.041 E.39911
G1 X124.647 Y126.041 E.2498
M204 S10000
G1 X124.548 Y126.448 F42000
G1 F5812
M204 S6000
G1 X124.18 Y126.448 E.01222
G1 X124.18 Y113.602 E.42611
G1 X132.584 Y113.602 E.2788
G1 X132.584 Y126.448 E.42612
G1 X124.608 Y126.448 E.26458
; WIPE_START
G1 F8843.478
G1 X124.18 Y126.448 E-.16283
G1 X124.18 Y124.876 E-.59717
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.69 Y131.654 Z11.6 F42000
G1 X132.297 Y140.548 Z11.6
M73 P81 R3
G1 Z11.2
G1 E.8 F1800
G1 F5812
M204 S6000
G1 X132.297 Y128.452 E.40124
G1 X132.584 Y128.452 E.00955
G1 X132.584 Y140.548 E.40124
G1 X132.357 Y140.548 E.00756
; WIPE_START
G1 F8843.478
G1 X132.347 Y138.548 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.107 Y139.035 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5812
M204 S5000
G1 X126.541 Y139.035 E.01738
G1 X126.541 Y138.994 E.00126
G1 X126.541 Y130.006 E.27618
G1 X126.541 Y129.965 E.00126
G1 X127.107 Y129.965 E.01738
G1 X127.107 Y128.19 E.05454
G1 X131.904 Y128.19 E.14742
G1 X131.904 Y140.81 E.38778
G1 X127.107 Y140.81 E.14742
G1 X127.107 Y139.095 E.0527
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.541 Y139.035 E-.21614
G1 X126.541 Y138.994 E-.01558
G1 X126.541 Y137.604 E-.52828
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.008 Y140.94 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
G1 F5812
M204 S5000
G1 X132.008 Y142.16 E.03749
G1 X124.548 Y142.16 E.22922
G1 X124.548 Y142.119 E.00126
G1 X124.548 Y140.981 E.03497
G1 X124.548 Y140.94 E.00126
G1 X131.948 Y140.94 E.22738
; WIPE_START
G1 F9547.055
M204 S6000
G1 X132.008 Y142.16 E-.46416
G1 X131.229 Y142.16 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.992 Y142.79 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
G1 F5812
M204 S5000
G3 X123.788 Y142.59 I-.005 J-.2 E.00979
G1 X123.788 Y113.407 E.8967
G3 X123.98 Y113.21 I.202 J.004 E.00932
G1 X132.825 Y113.217 E.27179
G3 X132.956 Y113.32 I-.045 J.19 E.00527
G1 X132.972 Y113.366 E.00151
G1 X132.976 Y141.992 E.87958
G3 X132.974 Y142.628 I-4.145 J.3 E.01956
G3 X132.954 Y142.685 I-.206 J-.039 E.00188
G1 X132.943 Y142.704 E.00067
G3 X132.784 Y142.79 I-.179 J-.144 E.0057
G1 X124.052 Y142.79 E.26831
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.924 Y142.78 E-.04879
G1 X123.848 Y142.736 E-.03318
G1 X123.799 Y142.662 E-.03383
G1 X123.788 Y142.59 E-.02779
G1 X123.788 Y140.968 E-.61641
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


G1 X124.168 Y140.744 F42000
G1 Z11.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.410911
G1 F5812
M204 S6000
G1 X124.168 Y142.356 E.04834
G1 X124.171 Y142.406 E.00151
G1 X124.232 Y142.429 E.00193
; LINE_WIDTH: 0.349556
G1 X124.292 Y142.452 E.00161
; LINE_WIDTH: 0.303747
G1 X124.352 Y142.475 E.00137
; LINE_WIDTH: 0.281011
G1 X132.204 Y142.475 E.15234
G1 X132.319 Y142.417 E.0025
; LINE_WIDTH: 0.351683
G1 X132.435 Y142.36 E.00324
; LINE_WIDTH: 0.399178
G1 X132.55 Y142.302 E.00374
; LINE_WIDTH: 0.446673
G1 X132.665 Y142.244 E.00424
; LINE_WIDTH: 0.494168
G1 X132.78 Y142.187 E.00474
M204 S10000
G1 X132.492 Y142.594 F42000
; LINE_WIDTH: 0.61926
G1 F5812
M204 S6000
G1 X132.492 Y140.744 E.08686
; WIPE_START
G1 F6246.313
G1 X132.492 Y142.594 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.199 Y140.733 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5812
M204 S2000
G1 X126.899 Y140.032 E.03043
G1 X126.899 Y139.499
G1 X125.666 Y140.733 E.0536
G1 X125.471 Y140.394
G1 X126.623 Y139.242 E.05006
G1 X126.334 Y138.998
G1 X125.471 Y139.861 E.0375
G1 X125.471 Y139.328
G1 X126.334 Y138.465 E.0375
G1 X126.334 Y137.932
G1 X125.471 Y138.795 E.0375
G1 X125.471 Y138.261
G1 X126.247 Y137.485 E.03372
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.471 Y138.261 E-.41705
G1 X125.471 Y138.795 E-.20264
G1 X125.732 Y138.534 E-.14032
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.918 Y140.394 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.145198
G1 F5812
M204 S6000
G1 X126.474 Y140.751 E.00475
M204 S10000
G1 X125.95 Y137.467 F42000
; LINE_WIDTH: 0.194374
G1 F5812
M204 S6000
G1 X125.747 Y137.603 E.00302
; LINE_WIDTH: 0.223382
G1 X125.599 Y137.712 E.0027
; LINE_WIDTH: 0.256632
G1 X125.452 Y137.82 E.00319
M204 S10000
G1 X125.547 Y137.504 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F5812
M204 S6000
G1 X125.484 Y137.541 E.00204
G1 X125.532 Y137.569 E.00155
; WIPE_START
G1 F10588.235
G1 X125.484 Y137.541 E-.32875
G1 X125.547 Y137.504 E-.43125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.351 Y132.535 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; LINE_WIDTH: 0.41699
G1 F5812
M204 S6000
G1 X124.977 Y132.535 E.0114
G1 X124.977 Y136.465 E.11981
G1 X125.351 Y136.465 E.0114
G1 X125.351 Y132.595 E.11798
; WIPE_START
G1 F9623.867
G1 X125.351 Y134.595 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.566 Y131.403 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; LINE_WIDTH: 0.38292
G1 F5812
M204 S6000
G1 X125.503 Y131.44 E.00204
G1 X125.551 Y131.468 E.00155
M204 S10000
G1 X125.861 Y131.472 F42000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5812
M204 S2000
G1 X126.334 Y130.999 E.02053
G1 X126.334 Y130.466
G1 X125.502 Y131.298 E.03615
G1 X125.471 Y130.796
G1 X126.334 Y129.933 E.0375
G1 X126.509 Y129.758
G1 X126.899 Y129.367 E.01696
G1 X126.899 Y128.834
G1 X125.471 Y130.263 E.06208
G1 X125.471 Y129.729
G1 X126.781 Y128.419 E.05695
G1 X126.399 Y128.267
G1 X125.471 Y129.196 E.04036
G1 X125.471 Y128.663
G1 X125.866 Y128.267 E.01718
M204 S10000
G1 X125.827 Y131.463 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.109981
G1 F5812
M204 S6000
G1 X125.787 Y131.437 E.00026
G2 X125.66 Y131.41 I-.077 J.05 E.00079
; WIPE_START
G1 F15000
G1 X125.728 Y131.397 E-.28074
G1 X125.787 Y131.437 E-.28627
G1 X125.827 Y131.463 E-.19299
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.168 Y128.256 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; LINE_WIDTH: 0.41141
G1 F5812
M204 S6000
G1 X124.168 Y126.644 E.0484
; WIPE_START
G1 F9769.6
G1 X124.168 Y128.256 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.6 I.536 J1.092 P1  F42000
G1 X130.117 Y125.334 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5812
M204 S6000
G1 X130.117 Y123.706 E.05401
G3 X131.603 Y123.021 I1.752 J1.845 E.05528
G1 X131.829 Y123.147 E.00858
G1 X131.829 Y122.141 E.03336
G1 X131.276 Y121.207 E.03601
G1 X130.621 Y120.679 E.02791
G1 X130.117 Y120.493 E.01781
G1 X130.117 Y118.464 E.0673
G3 X131.603 Y117.779 I1.752 J1.845 E.05528
G1 X131.829 Y117.906 E.00857
G1 X131.829 Y116.9 E.03336
G1 X131.276 Y115.966 E.03601
G2 X129.638 Y115.159 I-1.938 J1.867 E.0618
G2 X129.076 Y115.738 I.219 J.775 E.02806
G1 X125.752 Y115.738 E.11025
G2 X124.935 Y115.274 I-1.098 J.982 E.03174
G1 X124.935 Y114.358 E.03039
G1 X128.005 Y114.358 E.10183
G2 X128.983 Y114.635 I1.058 J-1.866 E.03405
G2 X129.366 Y114.358 I-.048 J-.469 E.01645
G1 X130.994 Y114.358 E.05401
M204 S10000
G1 X129.725 Y116.15 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F5812
M204 S6000
G1 X129.705 Y116.13 E.00085
G1 X124.979 Y116.13 E.14523
G1 X124.979 Y125.649 E.29247
G1 X129.725 Y125.649 E.14583
G1 X129.725 Y116.21 E.29003
M204 S10000
G1 X129.348 Y116.507 F42000
G1 F5812
M204 S6000
G1 X125.356 Y116.507 E.12266
G1 X125.356 Y125.272 E.2693
G1 X129.348 Y125.272 E.12266
G1 X129.348 Y116.567 E.26745
M204 S10000
G1 X128.971 Y116.884 F42000
G1 F5812
M204 S6000
G1 X125.733 Y116.884 E.09949
G1 X125.733 Y124.895 E.24613
G1 X128.971 Y124.895 E.09949
G1 X128.971 Y116.944 E.24428
M204 S10000
G1 X128.594 Y117.261 F42000
G1 F5812
M204 S6000
G1 X126.11 Y117.261 E.07632
G1 X126.11 Y124.518 E.22295
G1 X128.594 Y124.518 E.07632
G1 X128.594 Y117.321 E.22111
M204 S10000
G1 X128.217 Y117.639 F42000
G1 F5812
M204 S6000
G1 X126.487 Y117.639 E.05315
G1 X126.487 Y124.141 E.19978
G1 X128.217 Y124.141 E.05315
G1 X128.217 Y117.699 E.19794
M204 S10000
G1 X127.84 Y118.016 F42000
G1 F5812
M204 S6000
G1 X126.864 Y118.016 E.02997
G1 X126.864 Y123.763 E.17661
G1 X127.84 Y123.763 E.02997
G1 X127.84 Y118.076 E.17477
M204 S10000
G1 X127.352 Y123.276 F42000
; LINE_WIDTH: 0.64134
G1 F5812
M204 S6000
G1 X127.352 Y118.563 E.22979
; WIPE_START
G1 F6015.842
G1 X127.352 Y120.563 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.6 I-.929 J.786 P1  F42000
G1 X132.492 Y126.644 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.619232
G1 F5812
M204 S6000
G1 X132.492 Y128.256 E.0757
; CHANGE_LAYER
; Z_HEIGHT: 11.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6246.619
G1 X132.492 Y126.644 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 57/75
; update layer progress
M73 L57
M991 S0 P56 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z11.6 I-1.15 J-.397 P1  F42000
G1 X131.958 Y128.19 Z11.6
G1 Z11.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5514
M204 S5000
G1 X131.958 Y140.81 E.38778
G1 X126.36 Y140.81 E.17201
G1 X126.36 Y128.19 E.38778
G1 X131.898 Y128.19 E.17016
; WIPE_START
G1 F9547.055
M204 S6000
G1 X131.908 Y130.19 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.97 Y127.009 Z11.8 F42000
G1 X124.602 Y126.84 Z11.8
G1 Z11.4
G1 E.8 F1800
G1 F5514
M204 S5000
G1 X132.062 Y126.84 E.22922
G1 X132.062 Y128.06 E.03749
G1 X124.602 Y128.06 E.22922
G1 X124.602 Y128.019 E.00126
G1 X124.602 Y126.9 E.03438
M204 S10000
G1 X124.623 Y126.041 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5514
M204 S6000
G1 X124.623 Y114.009 E.39911
G1 X132.223 Y114.009 E.2521
G1 X132.223 Y126.041 E.39911
G1 X124.683 Y126.041 E.25011
M204 S10000
G1 X124.602 Y126.448 F42000
G1 F5514
M204 S6000
G1 X124.216 Y126.448 E.01281
G1 X124.216 Y113.602 E.42611
G1 X132.63 Y113.602 E.27911
G1 X132.63 Y126.448 E.42612
G1 X124.662 Y126.448 E.26431
; WIPE_START
G1 F8843.478
G1 X124.216 Y126.448 E-.16954
G1 X124.216 Y124.894 E-.59046
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.735 Y131.667 Z11.8 F42000
G1 X132.35 Y140.548 Z11.8
G1 Z11.4
G1 E.8 F1800
G1 F5514
M204 S6000
G1 X132.35 Y128.452 E.40124
G1 X132.63 Y128.452 E.00927
G1 X132.63 Y140.548 E.40124
G1 X132.41 Y140.548 E.00728
; WIPE_START
G1 F8843.478
G1 X132.4 Y138.548 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.001 Y140.421 Z11.8 F42000
G1 X124.502 Y140.548 Z11.8
G1 Z11.4
G1 E.8 F1800
G1 F5514
M204 S6000
G1 X124.216 Y140.548 E.0095
G1 X124.216 Y128.452 E.40124
G1 X124.502 Y128.452 E.0095
G1 X124.502 Y140.488 E.39925
; WIPE_START
G1 F8843.478
G1 X124.216 Y140.548 E-.11114
G1 X124.216 Y138.84 E-.64886
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.589 Y140.813 Z11.8 F42000
G1 X132.062 Y140.94 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5514
M204 S5000
G1 X132.062 Y142.16 E.03749
G1 X124.602 Y142.16 E.22922
G1 X124.602 Y142.119 E.00126
G1 X124.602 Y140.981 E.03497
G1 X124.602 Y140.94 E.00126
G1 X132.002 Y140.94 E.22738
; WIPE_START
G1 F9547.055
M204 S6000
G1 X132.062 Y142.16 E-.46416
G1 X131.283 Y142.16 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.028 Y142.79 Z11.8 F42000
G1 Z11.4
G1 E.8 F1800
G1 F5514
M204 S5000
G3 X123.823 Y142.59 I-.004 J-.2 E.00979
G1 X123.823 Y113.408 E.89669
G3 X124.016 Y113.21 I.202 J.004 E.00932
G1 X132.871 Y113.217 E.27209
G3 X133.001 Y113.32 I-.045 J.19 E.00527
G1 X133.018 Y113.366 E.00151
G1 X133.022 Y141.992 E.87959
G3 X133.019 Y142.628 I-4.159 J.3 E.01956
G3 X132.999 Y142.685 I-.204 J-.038 E.00188
G1 X132.988 Y142.704 E.00067
M73 P82 R3
G3 X132.829 Y142.79 I-.18 J-.145 E.00569
G1 X124.088 Y142.79 E.2686
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.96 Y142.78 E-.0488
G1 X123.876 Y142.729 E-.03723
G1 X123.834 Y142.66 E-.03045
G1 X123.823 Y142.59 E-.02708
G1 X123.823 Y140.968 E-.61644
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


G1 X124.213 Y140.744 F42000
G1 Z11.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.428694
G1 F5514
M204 S6000
G1 X124.213 Y142.356 E.05067
G1 X124.215 Y142.399 E.00134
G1 X124.263 Y142.418 E.00162
; LINE_WIDTH: 0.376402
G1 X124.31 Y142.437 E.0014
; LINE_WIDTH: 0.338177
G1 X124.358 Y142.456 E.00124
; LINE_WIDTH: 0.299952
G1 X124.406 Y142.475 E.00108
; LINE_WIDTH: 0.281005
G1 X132.258 Y142.475 E.15234
G1 X132.371 Y142.418 E.00246
; LINE_WIDTH: 0.351663
G1 X132.485 Y142.361 E.0032
; LINE_WIDTH: 0.399158
G1 X132.598 Y142.304 E.00369
; LINE_WIDTH: 0.446653
G1 X132.712 Y142.248 E.00418
; LINE_WIDTH: 0.494148
G1 X132.826 Y142.191 E.00467
M204 S10000
G1 X132.542 Y142.594 F42000
; LINE_WIDTH: 0.61096
G1 F5514
M204 S6000
G1 X132.542 Y140.744 E.08561
; WIPE_START
G1 F6337.582
G1 X132.542 Y142.594 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.542 Y134.961 Z11.8 F42000
G1 X132.542 Y128.256 Z11.8
G1 Z11.4
G1 E.8 F1800
; LINE_WIDTH: 0.610932
G1 F5514
M204 S6000
G1 X132.542 Y126.644 E.07461
; WIPE_START
G1 F6337.897
G1 X132.542 Y128.256 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.117 Y125.288 Z11.8 F42000
G1 Z11.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5514
M204 S6000
G1 X130.117 Y123.66 E.05401
G3 X131.603 Y123.358 I1.056 J1.39 E.05205
G1 X131.874 Y123.577 E.01156
G1 X131.874 Y121.828 E.05804
G1 X131.276 Y121.128 E.03056
G1 X130.621 Y120.745 E.02516
G1 X130.117 Y120.672 E.01689
G1 X130.117 Y118.419 E.07476
G3 X131.603 Y118.117 I1.056 J1.39 E.05205
G1 X131.874 Y118.336 E.01156
G1 X131.874 Y116.587 E.05804
G1 X131.276 Y115.886 E.03056
G2 X129.638 Y115.496 I-1.201 J1.409 E.05798
G1 X129.339 Y115.738 E.01277
G1 X125.781 Y115.738 E.11803
G2 X124.971 Y115.445 I-.768 J.855 E.02929
G1 X124.971 Y114.358 E.03607
G1 X125.512 Y114.358 E.01795
M204 S10000
G1 X129.725 Y116.15 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F5514
M204 S6000
G1 X129.705 Y116.13 E.00084
G1 X125.015 Y116.13 E.14413
G1 X125.015 Y125.649 E.29247
G1 X129.725 Y125.649 E.14473
G1 X129.725 Y116.21 E.29003
M204 S10000
G1 X129.348 Y116.507 F42000
G1 F5514
M204 S6000
G1 X125.392 Y116.507 E.12155
G1 X125.392 Y125.272 E.2693
G1 X129.348 Y125.272 E.12155
G1 X129.348 Y116.567 E.26745
M204 S10000
G1 X128.971 Y116.885 F42000
G1 F5514
M204 S6000
G1 X125.769 Y116.885 E.09838
G1 X125.769 Y124.895 E.24612
G1 X128.971 Y124.895 E.09838
G1 X128.971 Y116.945 E.24428
M204 S10000
G1 X128.594 Y117.262 F42000
G1 F5514
M204 S6000
G1 X126.146 Y117.262 E.07521
G1 X126.146 Y124.518 E.22295
G1 X128.594 Y124.518 E.07521
G1 X128.594 Y117.322 E.22111
M204 S10000
G1 X128.217 Y117.639 F42000
G1 F5514
M204 S6000
G1 X126.523 Y117.639 E.05204
G1 X126.523 Y124.141 E.19978
G1 X128.217 Y124.141 E.05204
G1 X128.217 Y117.699 E.19794
M204 S10000
G1 X127.84 Y118.016 F42000
G1 F5514
M204 S6000
G1 X126.9 Y118.016 E.02887
G1 X126.9 Y123.763 E.17661
G1 X127.84 Y123.763 E.02887
G1 X127.84 Y118.076 E.17476
M204 S10000
G1 X127.37 Y123.294 F42000
; LINE_WIDTH: 0.60532
G1 F5514
M204 S6000
G1 X127.37 Y118.545 E.2176
; WIPE_START
G1 F6401.138
G1 X127.37 Y120.545 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.213 Y126.644 Z11.8 F42000
G1 Z11.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.42907
G1 F5514
M204 S6000
G1 X124.213 Y128.256 E.05072
; WIPE_START
G1 F9322.801
G1 X124.213 Y126.644 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.153 Y129.086 Z11.8 F42000
G1 Z11.4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5514
M204 S2000
G1 X125.334 Y128.267 E.03557
G1 X124.801 Y128.267
G1 X126.153 Y129.619 E.05874
G1 X126.153 Y130.152
G1 X124.724 Y128.724 E.06208
G1 X124.724 Y129.257
G1 X126.153 Y130.686 E.06208
G1 X126.153 Y131.219
G1 X124.724 Y129.79 E.06208
G1 X124.724 Y130.324
G1 X126.153 Y131.752 E.06208
G1 X126.153 Y132.285
G1 X124.724 Y130.857 E.06208
G1 X124.724 Y131.39
G1 X126.153 Y132.819 E.06208
G1 X126.153 Y133.352
G1 X124.724 Y131.923 E.06208
G1 X124.724 Y132.457
G1 X126.153 Y133.885 E.06208
G1 X126.153 Y134.418
G1 X124.724 Y132.99 E.06208
G1 X124.724 Y133.523
G1 X126.153 Y134.952 E.06208
G1 X126.153 Y135.485
G1 X124.724 Y134.056 E.06208
G1 X124.724 Y134.59
G1 X126.153 Y136.018 E.06208
G1 X126.153 Y136.551
G1 X124.724 Y135.123 E.06208
G1 X124.724 Y135.656
G1 X126.153 Y137.085 E.06208
G1 X126.153 Y137.618
G1 X124.724 Y136.189 E.06208
G1 X124.724 Y136.723
G1 X126.153 Y138.151 E.06208
G1 X126.153 Y138.684
G1 X124.724 Y137.256 E.06208
G1 X124.724 Y137.789
G1 X126.153 Y139.218 E.06208
G1 X126.153 Y139.751
G1 X124.724 Y138.322 E.06208
G1 X124.724 Y138.856
G1 X126.153 Y140.284 E.06208
G1 X126.068 Y140.733
G1 X124.724 Y139.389 E.05839
G1 X124.724 Y139.922
G1 X125.535 Y140.733 E.03522
; CHANGE_LAYER
; Z_HEIGHT: 11.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.724 Y139.922 E-.43551
G1 X124.724 Y139.389 E-.20264
G1 X124.951 Y139.616 E-.12186
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 58/75
; update layer progress
M73 L58
M991 S0 P57 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z11.8 I1.035 J.64 P1  F42000
G1 X132.012 Y128.19 Z11.8
G1 Z11.6
G1 E.8 F1800
; FEATURE: Outer wall
G1 F5164
M204 S5000
G1 X132.012 Y140.81 E.38778
G1 X125.614 Y140.81 E.19659
G1 X125.614 Y128.19 E.38778
G1 X131.952 Y128.19 E.19474
; WIPE_START
G1 F9547.055
M204 S6000
G1 X131.961 Y130.19 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.023 Y127.009 Z12 F42000
G1 X124.655 Y126.84 Z12
G1 Z11.6
G1 E.8 F1800
G1 F5164
M204 S5000
G1 X132.115 Y126.84 E.22922
G1 X132.115 Y128.06 E.03749
G1 X124.655 Y128.06 E.22922
G1 X124.655 Y128.019 E.00126
G1 X124.655 Y126.9 E.03438
M204 S10000
G1 X124.659 Y126.041 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5164
M204 S6000
G1 X124.659 Y114.009 E.39911
G1 X132.268 Y114.009 E.25241
G1 X132.268 Y126.041 E.39911
G1 X124.719 Y126.041 E.25042
M204 S10000
G1 X124.655 Y126.448 F42000
G1 F5164
M204 S6000
G1 X124.251 Y126.448 E.0134
G1 X124.251 Y113.602 E.42611
G1 X132.675 Y113.602 E.27942
G1 X132.675 Y126.448 E.42612
G1 X124.715 Y126.448 E.26403
; WIPE_START
G1 F8843.478
G1 X124.251 Y126.448 E-.17625
G1 X124.251 Y124.912 E-.58375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.78 Y131.68 Z12 F42000
G1 X132.404 Y140.548 Z12
G1 Z11.6
G1 E.8 F1800
G1 F5164
M204 S6000
G1 X132.404 Y128.452 E.40124
G1 X132.675 Y128.452 E.009
G1 X132.675 Y140.548 E.40124
G1 X132.464 Y140.548 E.00701
M204 S250
G1 X132.115 Y140.94 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5164
M204 S5000
G1 X132.115 Y142.16 E.03749
G1 X124.655 Y142.16 E.22922
G1 X124.655 Y142.119 E.00126
G1 X124.655 Y140.981 E.03497
G1 X124.655 Y140.94 E.00126
G1 X132.055 Y140.94 E.22738
; WIPE_START
G1 F9547.055
M204 S6000
G1 X132.115 Y142.16 E-.46416
G1 X131.337 Y142.16 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.064 Y142.79 Z12 F42000
G1 Z11.6
G1 E.8 F1800
G1 F5164
M204 S5000
G3 X123.859 Y142.59 I-.004 J-.2 E.00979
G1 X123.859 Y113.407 E.8967
G3 X124.052 Y113.21 I.202 J.005 E.00932
G1 X132.916 Y113.217 E.27238
G3 X133.046 Y113.32 I-.045 J.19 E.00526
G1 X133.063 Y113.366 E.00151
G1 X133.067 Y141.992 E.87959
G3 X133.064 Y142.628 I-4.156 J.3 E.01954
G3 X133.044 Y142.686 I-.203 J-.037 E.0019
G1 X133.034 Y142.704 E.00064
G3 X132.874 Y142.79 I-.181 J-.145 E.00572
G1 X124.124 Y142.79 E.26889
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.966 Y142.768 E-.06061
G1 X123.911 Y142.728 E-.02555
G1 X123.871 Y142.662 E-.02938
G1 X123.859 Y142.59 E-.02785
G1 X123.859 Y140.967 E-.61662
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


G1 X124.257 Y141.726 F42000
G1 Z11.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.445421
G1 F5164
M204 S6000
G2 X124.259 Y142.391 I7.752 J.315 E.02181
G1 X124.309 Y142.412 E.00178
; LINE_WIDTH: 0.386372
G1 X124.359 Y142.433 E.00152
; LINE_WIDTH: 0.344158
G1 X124.409 Y142.454 E.00133
; LINE_WIDTH: 0.301944
G1 X124.459 Y142.475 E.00115
; LINE_WIDTH: 0.281
G1 X132.311 Y142.475 E.15233
G1 X132.423 Y142.419 E.00243
; LINE_WIDTH: 0.351663
G1 X132.535 Y142.363 E.00315
; LINE_WIDTH: 0.399158
G1 X132.647 Y142.307 E.00363
; LINE_WIDTH: 0.446652
G1 X132.759 Y142.251 E.00412
; LINE_WIDTH: 0.494147
G1 X132.871 Y142.195 E.0046
M204 S10000
M73 P83 R3
G1 X132.591 Y142.594 F42000
; LINE_WIDTH: 0.60267
G1 F5164
M204 S6000
G1 X132.591 Y140.744 E.08436
; WIPE_START
G1 F6431.443
G1 X132.591 Y142.594 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.436 Y139.936 Z12 F42000
G1 X125.406 Y139.925 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5164
M204 S2000
G1 X124.599 Y140.733 E.03507
G1 X124.448 Y140.884
G1 X124.067 Y141.265 E.01656
G1 X124.067 Y140.732
G1 X125.406 Y139.392 E.05821
G1 X125.406 Y138.859
G1 X124.067 Y140.199 E.05821
G1 X124.067 Y139.665
G1 X125.406 Y138.326 E.05821
G1 X125.406 Y137.792
G1 X124.067 Y139.132 E.05821
G1 X124.067 Y138.599
G1 X125.406 Y137.259 E.05821
G1 X125.406 Y136.726
G1 X124.067 Y138.066 E.05821
G1 X124.067 Y137.532
G1 X125.406 Y136.193 E.05821
G1 X125.406 Y135.659
G1 X124.067 Y136.999 E.05821
G1 X124.067 Y136.466
G1 X125.406 Y135.126 E.05821
G1 X125.406 Y134.593
G1 X124.067 Y135.933 E.05821
G1 X124.067 Y135.399
G1 X125.406 Y134.06 E.05821
G1 X125.406 Y133.526
G1 X124.067 Y134.866 E.05821
G1 X124.067 Y134.333
G1 X125.406 Y132.993 E.05821
G1 X125.406 Y132.46
G1 X124.067 Y133.8 E.05821
G1 X124.067 Y133.266
G1 X125.406 Y131.927 E.05821
G1 X125.406 Y131.393
G1 X124.067 Y132.733 E.05821
G1 X124.067 Y132.2
G1 X125.406 Y130.86 E.05821
G1 X125.406 Y130.327
G1 X124.067 Y131.666 E.05821
G1 X124.067 Y131.133
G1 X125.406 Y129.794 E.05821
G1 X125.406 Y129.26
G1 X124.067 Y130.6 E.05821
G1 X124.067 Y130.067
G1 X125.406 Y128.727 E.05821
G1 X125.211 Y128.389
G1 X124.067 Y129.533 E.04973
G1 X124.067 Y129
G1 X124.8 Y128.267 E.03184
G1 X124.448 Y128.086
G1 X124.067 Y128.467 E.01656
G1 X124.067 Y127.934
G1 X124.448 Y127.553 E.01656
M204 S10000
G1 X124.467 Y141.185 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.373239
G1 F5164
M204 S6000
G1 X124.293 Y141.545 E.01077
G1 X124.208 Y141.558 E.00232
; LINE_WIDTH: 0.339347
G1 X124.155 Y141.485 E.00218
; LINE_WIDTH: 0.292121
G1 X124.101 Y141.413 E.00183
; LINE_WIDTH: 0.244894
G1 X124.048 Y141.34 E.00149
; WIPE_START
G1 F15000
G1 X124.101 Y141.413 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.425 Y140.349 Z12 F42000
G1 Z11.6
G1 E.8 F1800
; LINE_WIDTH: 0.228651
G1 F5164
M204 S6000
G1 X124.926 Y140.751 E.0097
M204 S10000
G1 X124.467 Y127.402 F42000
; LINE_WIDTH: 0.205121
G1 F5164
M204 S6000
G1 X124.371 Y127.362 E.00136
G1 X124.048 Y127.362 E.00428
; WIPE_START
G1 F15000
G1 X124.371 Y127.362 E-.57632
G1 X124.467 Y127.402 E-.18368
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.117 Y125.227 Z12 F42000
G1 Z11.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5164
M204 S6000
G1 X130.117 Y123.599 E.05401
G3 X131.92 Y123.861 I.749 J1.179 E.06582
G1 X131.92 Y121.636 E.0738
G1 X131.276 Y121.037 E.02917
G1 X130.621 Y120.782 E.02332
G1 X130.117 Y120.805 E.01673
G1 X130.117 Y118.358 E.08118
G3 X131.92 Y118.62 I.749 J1.179 E.06582
G1 X131.92 Y116.395 E.0738
G1 X131.276 Y115.796 E.02917
G2 X129.638 Y115.725 I-.885 J1.491 E.05664
G1 X125.887 Y115.738 E.12444
G2 X125.007 Y115.558 I-.644 J.904 E.03067
G1 X125.007 Y114.358 E.03981
G1 X125.435 Y114.358 E.01421
M204 S10000
G1 X129.725 Y116.15 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F5164
M204 S6000
G1 X129.705 Y116.13 E.00084
G1 X125.051 Y116.13 E.14303
G1 X125.051 Y125.649 E.29247
G1 X129.725 Y125.649 E.14362
G1 X129.725 Y116.21 E.29003
M204 S10000
G1 X129.348 Y116.507 F42000
G1 F5164
M204 S6000
G1 X125.428 Y116.507 E.12045
G1 X125.428 Y125.272 E.2693
G1 X129.348 Y125.272 E.12045
G1 X129.348 Y116.567 E.26745
M204 S10000
G1 X128.971 Y116.885 F42000
G1 F5164
M204 S6000
G1 X125.805 Y116.885 E.09728
G1 X125.805 Y124.895 E.24612
G1 X128.971 Y124.895 E.09728
G1 X128.971 Y116.945 E.24428
M204 S10000
G1 X128.594 Y117.262 F42000
G1 F5164
M204 S6000
G1 X126.182 Y117.262 E.07411
G1 X126.182 Y124.518 E.22295
G1 X128.594 Y124.518 E.07411
G1 X128.594 Y117.322 E.22111
M204 S10000
G1 X128.217 Y117.639 F42000
G1 F5164
M204 S6000
G1 X126.559 Y117.639 E.05093
G1 X126.559 Y124.141 E.19978
G1 X128.217 Y124.141 E.05093
G1 X128.217 Y117.699 E.19794
M204 S10000
G1 X127.84 Y118.016 F42000
G1 F5164
M204 S6000
G1 X126.936 Y118.016 E.02776
G1 X126.936 Y123.763 E.17661
G1 X127.84 Y123.763 E.02776
G1 X127.84 Y118.076 E.17476
M204 S10000
G1 X127.388 Y123.312 F42000
; LINE_WIDTH: 0.56938
G1 F5164
M204 S6000
G1 X127.388 Y118.527 E.20524
; WIPE_START
G1 F6838.126
G1 X127.388 Y120.527 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.333 Y126.341 Z12 F42000
G1 X132.591 Y126.644 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.60264
G1 F5164
M204 S6000
G1 X132.591 Y128.256 E.07352
; CHANGE_LAYER
; Z_HEIGHT: 11.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6431.787
G1 X132.591 Y126.644 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 59/75
; update layer progress
M73 L59
M991 S0 P58 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z12 I-1.152 J-.392 P1  F42000
G1 X132.065 Y128.19 Z12
G1 Z11.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4204
M204 S5000
G1 X132.065 Y140.81 E.38778
G1 X124.867 Y140.81 E.22117
G1 X124.867 Y128.19 E.38778
G1 X132.005 Y128.19 E.21933
; WIPE_START
G1 F9547.055
M204 S6000
G1 X132.015 Y130.19 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.077 Y127.009 Z12.2 F42000
G1 X124.709 Y126.84 Z12.2
G1 Z11.8
G1 E.8 F1800
G1 F4204
M204 S5000
G1 X132.169 Y126.84 E.22922
G1 X132.169 Y128.06 E.03749
G1 X124.709 Y128.06 E.22922
G1 X124.709 Y128.019 E.00126
G1 X124.709 Y126.9 E.03438
M204 S10000
G1 X124.709 Y126.041 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4204
M204 S6000
G1 X124.694 Y126.041 E.00048
G1 X124.694 Y114.009 E.39911
G1 X132.313 Y114.009 E.25272
G1 X132.313 Y126.041 E.39911
G1 X124.769 Y126.041 E.25026
M204 S10000
G1 X124.709 Y126.448 F42000
G1 F4204
M204 S6000
G1 X124.287 Y126.448 E.01398
G1 X124.287 Y113.602 E.42611
G1 X132.72 Y113.602 E.27973
G1 X132.72 Y126.448 E.42612
G1 X124.769 Y126.448 E.26376
; WIPE_START
G1 F8843.478
G1 X124.287 Y126.448 E-.18296
G1 X124.287 Y124.929 E-.57704
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.825 Y131.692 Z12.2 F42000
G1 X132.457 Y140.548 Z12.2
G1 Z11.8
G1 E.8 F1800
G1 F4204
M204 S6000
G1 X132.457 Y128.452 E.40124
G1 X132.72 Y128.452 E.00872
G1 X132.72 Y140.548 E.40124
G1 X132.517 Y140.548 E.00673
M204 S250
G1 X132.169 Y140.94 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4204
M204 S5000
G1 X132.169 Y142.16 E.03749
G1 X124.709 Y142.16 E.22922
G1 X124.709 Y142.119 E.00126
G1 X124.709 Y140.981 E.03497
G1 X124.709 Y140.94 E.00126
G1 X132.109 Y140.94 E.22738
; WIPE_START
G1 F9547.055
M204 S6000
G1 X132.169 Y142.16 E-.46416
G1 X131.39 Y142.16 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.103 Y142.79 Z12.2 F42000
G1 Z11.8
G1 E.8 F1800
G1 F4204
M204 S5000
G3 X123.895 Y142.59 I-.006 J-.201 E.00988
G1 X123.895 Y113.408 E.89669
G3 X124.091 Y113.21 I.203 J.005 E.00942
G1 X132.942 Y113.212 E.27197
G1 X132.955 Y113.215 E.0004
G3 X133.092 Y113.32 I-.041 J.194 E.00547
G1 X133.108 Y113.366 E.00151
G1 X133.112 Y141.992 E.87959
G3 X133.11 Y142.627 I-4.15 J.3 E.01954
G3 X133.09 Y142.686 I-.201 J-.036 E.0019
G1 X133.079 Y142.704 E.00065
G3 X132.92 Y142.79 I-.182 J-.146 E.00571
G1 X124.163 Y142.79 E.26907
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.002 Y142.768 E-.06161
G1 X123.947 Y142.727 E-.02618
G1 X123.906 Y142.66 E-.02967
G1 X123.895 Y142.59 E-.02699
G1 X123.895 Y140.97 E-.61554
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


G1 X124.322 Y140.679 F42000
G1 Z11.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.523835
G1 F4204
M204 S6000
G1 X124.342 Y140.615 E.00265
; LINE_WIDTH: 0.563471
G1 X124.362 Y140.55 E.00287
; LINE_WIDTH: 0.603107
G1 X124.381 Y140.485 E.00309
M204 S10000
G1 X124.43 Y140.522 F42000
; LINE_WIDTH: 0.557185
G1 F4204
M204 S6000
G1 X124.478 Y140.559 E.00254
; LINE_WIDTH: 0.513362
G1 X124.526 Y140.596 E.00233
; LINE_WIDTH: 0.469539
G1 X124.575 Y140.632 E.00211
; LINE_WIDTH: 0.425715
G1 X124.623 Y140.669 E.00189
; LINE_WIDTH: 0.381892
G1 X124.671 Y140.706 E.00168
M204 S10000
G1 X124.43 Y140.522 F42000
; LINE_WIDTH: 0.62281
G1 F4204
M204 S6000
G1 X124.381 Y140.485 E.00287
G1 X124.381 Y128.515 E.56567
; LINE_WIDTH: 0.601013
G1 X124.43 Y128.478 E.00276
; LINE_WIDTH: 0.557189
G1 X124.478 Y128.441 E.00254
; LINE_WIDTH: 0.513365
G1 X124.526 Y128.404 E.00233
; LINE_WIDTH: 0.469541
G1 X124.575 Y128.368 E.00211
; LINE_WIDTH: 0.425717
G1 X124.623 Y128.331 E.00189
; LINE_WIDTH: 0.381892
G1 X124.671 Y128.294 E.00168
M204 S10000
G1 X124.342 Y128.385 F42000
; LINE_WIDTH: 0.563475
G1 F4204
M204 S6000
G1 X124.362 Y128.45 E.00287
; LINE_WIDTH: 0.603105
G1 X124.381 Y128.515 E.00309
M204 S10000
G1 X124.342 Y128.385 F42000
; LINE_WIDTH: 0.523845
G1 F4204
M204 S6000
M73 P84 R3
G1 X124.322 Y128.321 E.00265
; LINE_WIDTH: 0.465188
G1 X124.302 Y128.256 E.00233
G1 X124.302 Y126.644 E.05547
; WIPE_START
G1 F8525.395
G1 X124.302 Y128.256 E-.72942
G1 X124.322 Y128.321 E-.03058
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.429 Y125.053 Z12.2 F42000
G1 Z11.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4204
M204 S6000
G1 X125.429 Y123.425 E.05401
G2 X125.043 Y123.485 I-.127 J.455 E.01335
G1 X125.043 Y120.868 E.08679
G3 X125.429 Y120.804 I.264 J.393 E.01338
G1 X125.429 Y118.184 E.08691
G2 X125.043 Y118.243 I-.127 J.455 E.01335
G1 X125.043 Y115.627 E.08679
G1 X125.379 Y115.552 E.01144
G1 X126.035 Y115.69 E.02221
G1 X126.69 Y116.2 E.02755
G2 X128.655 Y116.725 I1.361 J-1.156 E.0718
G1 X129.31 Y116.214 E.02755
G3 X131.276 Y115.69 I1.361 J1.156 E.07179
G3 X131.965 Y116.227 I-46.328 J60.138 E.02898
G1 X131.965 Y114.599 E.05401
M204 S10000
G1 X128.982 Y120.708 F42000
G1 F4204
M204 S6000
G1 X128.982 Y119.08 E.05401
G1 X129.31 Y118.821 E.01388
G3 X131.276 Y118.319 I1.341 J1.153 E.07167
G2 X131.965 Y118.861 I49.385 J-61.98 E.02909
G1 X131.965 Y121.468 E.08647
G1 X131.931 Y121.441 E.00143
G2 X129.966 Y120.939 I-1.341 J1.153 E.07167
G3 X128.982 Y121.712 I-68.758 J-86.557 E.04149
G1 X128.982 Y124.321 E.08656
G1 X129.31 Y124.062 E.01388
G3 X131.276 Y123.56 I1.341 J1.153 E.07167
G2 X131.965 Y124.103 I48.412 J-60.745 E.0291
G1 X131.926 Y125.693 E.05276
; WIPE_START
G1 F8843.478
G1 X131.965 Y124.103 E-.60436
G1 X131.643 Y123.849 E-.15564
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.641 Y126.644 Z12.2 F42000
G1 Z11.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.59434
G1 F4204
M204 S6000
G1 X132.641 Y128.256 E.07243
; WIPE_START
G1 F6528.599
G1 X132.641 Y126.644 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.426 Y124.485 Z12.2 F42000
G1 Z11.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.48474
G1 F4204
M204 S6000
G1 X127.426 Y118.429 E.21804
G1 X126.984 Y118.429 E.01591
G1 X126.984 Y124.485 E.21804
G1 X127.366 Y124.485 E.01375
M204 S10000
G1 X127.836 Y124.895 F42000
; LINE_WIDTH: 0.41999
G1 F4204
M204 S6000
G1 X127.836 Y118.02 E.21124
G1 X126.575 Y118.02 E.03874
G1 X126.575 Y124.895 E.21124
G1 X127.776 Y124.895 E.03689
M204 S10000
G1 X128.213 Y125.272 F42000
G1 F4204
M204 S6000
G1 X128.213 Y117.643 E.23442
G1 X126.198 Y117.643 E.06191
G1 X126.198 Y125.272 E.23442
G1 X128.153 Y125.272 E.06007
M204 S10000
G1 X128.59 Y125.649 F42000
G1 F4204
M204 S6000
G1 X128.59 Y117.285 E.25699
G1 X128.57 Y117.265 E.00084
G1 X125.832 Y117.265 E.08414
G1 X125.821 Y125.649 E.25759
G1 X128.53 Y125.649 E.08324
; WIPE_START
G1 F9547.299
G1 X126.53 Y125.649 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.421 Y133.2 Z12.2 F42000
G1 X124.322 Y140.679 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.465188
G1 F4204
M204 S6000
G1 X124.302 Y140.744 E.00233
G1 X124.303 Y142.382 E.05638
; LINE_WIDTH: 0.442889
G1 X124.355 Y142.406 E.00187
; LINE_WIDTH: 0.396588
G1 X124.408 Y142.429 E.00165
; LINE_WIDTH: 0.350287
G1 X124.46 Y142.452 E.00144
; LINE_WIDTH: 0.2808
G1 X124.513 Y142.475 E.00111
G1 X132.365 Y142.475 E.1522
; LINE_WIDTH: 0.304148
G1 X132.475 Y142.42 E.00262
; LINE_WIDTH: 0.351643
G1 X132.585 Y142.364 E.0031
; LINE_WIDTH: 0.399137
G1 X132.696 Y142.309 E.00358
; LINE_WIDTH: 0.446632
G1 X132.806 Y142.254 E.00406
; LINE_WIDTH: 0.494127
G1 X132.916 Y142.199 E.00453
M204 S10000
G1 X132.641 Y142.594 F42000
; LINE_WIDTH: 0.59437
G1 F4204
M204 S6000
G1 X132.641 Y140.744 E.08311
; CHANGE_LAYER
; Z_HEIGHT: 12
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6528.244
G1 X132.641 Y142.594 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 60/75
; update layer progress
M73 L60
M991 S0 P59 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z12.2 I1.216 J-.044 P1  F42000
G1 X132.119 Y128.19 Z12.2
G1 Z12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3666
M204 S5000
G1 X132.119 Y140.81 E.38778
G1 X124.866 Y140.81 E.22286
G1 X124.866 Y128.19 E.38778
G1 X132.059 Y128.19 E.22102
; WIPE_START
G1 F9547.055
M204 S6000
G1 X132.068 Y130.19 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.13 Y127.009 Z12.4 F42000
G1 X124.762 Y126.84 Z12.4
G1 Z12
G1 E.8 F1800
G1 F3666
M204 S5000
G1 X132.222 Y126.84 E.22922
G1 X132.222 Y128.06 E.03749
G1 X124.762 Y128.06 E.22922
G1 X124.762 Y128.019 E.00126
G1 X124.762 Y126.9 E.03438
M204 S10000
G1 X124.762 Y126.041 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3666
M204 S6000
G1 X124.74 Y126.041 E.00076
G1 X124.74 Y114.009 E.39911
G1 X132.358 Y114.009 E.25273
G1 X132.358 Y126.041 E.39911
G1 X124.822 Y126.041 E.24998
M204 S10000
G1 X124.762 Y126.448 F42000
G1 F3666
M204 S6000
G1 X124.333 Y126.448 E.01426
G1 X124.333 Y113.602 E.42611
G1 X132.765 Y113.602 E.27973
G1 X132.765 Y126.448 E.42612
G1 X124.822 Y126.448 E.26348
; WIPE_START
G1 F8843.478
G1 X124.333 Y126.448 E-.18616
G1 X124.333 Y124.938 E-.57384
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.875 Y131.699 Z12.4 F42000
G1 X132.511 Y140.548 Z12.4
G1 Z12
G1 E.8 F1800
G1 F3666
M204 S6000
G1 X132.511 Y128.452 E.40124
G1 X132.765 Y128.452 E.00844
G1 X132.766 Y140.548 E.40124
G1 X132.571 Y140.548 E.00646
M204 S250
G1 X132.222 Y140.94 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3666
M204 S5000
G1 X132.222 Y142.16 E.03749
G1 X124.762 Y142.16 E.22922
G1 X124.762 Y142.119 E.00126
G1 X124.762 Y140.981 E.03497
G1 X124.762 Y140.94 E.00126
G1 X132.162 Y140.94 E.22738
; WIPE_START
G1 F9547.055
M204 S6000
G1 X132.222 Y142.16 E-.46416
G1 X131.444 Y142.16 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.148 Y142.79 Z12.4 F42000
G1 Z12
G1 E.8 F1800
G1 F3666
M204 S5000
G3 X123.941 Y142.59 I-.006 J-.202 E.00988
G1 X123.941 Y113.408 E.89669
G3 X124.138 Y113.21 I.203 J.006 E.00944
G1 X132.995 Y113.214 E.27216
G3 X133.136 Y113.318 I-.035 J.196 E.00559
G1 X133.139 Y113.323 E.00016
G3 X133.158 Y113.406 I-.184 J.084 E.00262
G1 X133.158 Y141.992 E.87839
G3 X133.155 Y142.627 I-4.187 J.3 E.01952
G3 X133.135 Y142.686 I-.2 J-.035 E.00192
G1 X133.125 Y142.703 E.00061
G3 X132.965 Y142.79 I-.177 J-.136 E.00575
G1 X124.208 Y142.79 E.26906
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.079 Y142.78 E-.04931
G1 X124.001 Y142.735 E-.03411
G1 X123.952 Y142.661 E-.03411
G1 X123.941 Y142.59 E-.0272
G1 X123.941 Y140.971 E-.61528
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


G1 X124.369 Y140.674 F42000
G1 Z12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.47354
G1 F3666
M204 S6000
G1 X124.351 Y140.744 E.00254
G2 X124.352 Y142.378 I31.562 J.806 E.05736
; LINE_WIDTH: 0.449832
G1 X124.406 Y142.403 E.00195
; LINE_WIDTH: 0.401546
G1 X124.459 Y142.427 E.00172
; LINE_WIDTH: 0.353261
G1 X124.513 Y142.451 E.00149
; LINE_WIDTH: 0.280801
G1 X124.566 Y142.475 E.00114
G1 X132.418 Y142.475 E.1522
; LINE_WIDTH: 0.304146
G1 X132.466 Y142.451 E.00113
; LINE_WIDTH: 0.351637
G1 X132.513 Y142.427 E.00134
; LINE_WIDTH: 0.399127
G1 X132.561 Y142.404 E.00154
; LINE_WIDTH: 0.446618
G1 X132.608 Y142.38 E.00175
; LINE_WIDTH: 0.494109
G1 X132.656 Y142.356 E.00195
; LINE_WIDTH: 0.534913
G1 X132.673 Y142.339 E.00097
; LINE_WIDTH: 0.585815
G1 X132.69 Y142.322 E.00107
G1 X132.69 Y140.744 E.0698
; WIPE_START
G1 F6631.121
G1 X132.69 Y142.322 E-.74856
G1 X132.673 Y142.339 E-.01144
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.194 Y140.815 Z12.4 F42000
G1 X124.67 Y140.709 Z12.4
G1 Z12
G1 E.8 F1800
; LINE_WIDTH: 0.27329
G1 F3666
M204 S6000
G1 X124.632 Y140.684 E.00086
; LINE_WIDTH: 0.31991
G1 X124.594 Y140.658 E.00103
; LINE_WIDTH: 0.36653
G1 X124.556 Y140.633 E.0012
; LINE_WIDTH: 0.41315
G1 X124.518 Y140.608 E.00138
; LINE_WIDTH: 0.45977
G1 X124.479 Y140.583 E.00155
; LINE_WIDTH: 0.50639
G1 X124.441 Y140.558 E.00172
; LINE_WIDTH: 0.576243
G1 X124.403 Y140.533 E.00198
G1 X124.403 Y128.467 E.52438
; LINE_WIDTH: 0.553009
G1 X124.441 Y128.442 E.0019
; LINE_WIDTH: 0.506389
G1 X124.479 Y128.417 E.00172
; LINE_WIDTH: 0.45977
G1 X124.518 Y128.392 E.00155
; LINE_WIDTH: 0.41315
G1 X124.556 Y128.367 E.00138
; LINE_WIDTH: 0.36653
G1 X124.594 Y128.342 E.0012
; LINE_WIDTH: 0.31991
G1 X124.632 Y128.316 E.00103
; LINE_WIDTH: 0.27329
G1 X124.67 Y128.291 E.00086
M204 S10000
G1 X124.386 Y128.397 F42000
; LINE_WIDTH: 0.52457
G1 F3666
M204 S6000
G1 X124.369 Y128.326 E.00284
; LINE_WIDTH: 0.473542
G1 X124.351 Y128.256 E.00254
G1 X124.351 Y126.644 E.05656
M204 S10000
G1 X124.386 Y128.397 F42000
; LINE_WIDTH: 0.559084
G1 F3666
M204 S6000
G1 X124.403 Y128.467 E.00305
; WIPE_START
G1 F6974.537
G1 X124.386 Y128.397 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.321 Y125.315 Z12.4 F42000
G1 Z12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3666
M204 S6000
G1 X131.682 Y125.315 E.01197
G1 X131.682 Y124.048 E.04205
G2 X129.638 Y123.572 I-1.304 J.975 E.07564
G2 X128.655 Y124.474 I9.783 J11.653 E.04425
G3 X127.017 Y124.566 I-.905 J-1.48 E.05668
G3 X126.035 Y123.665 I9.781 J-11.651 E.04425
G1 X125.379 Y123.401 E.02343
G1 X125.088 Y123.411 E.00967
G1 X125.088 Y120.898 E.08335
G1 X125.379 Y120.78 E.01042
G1 X126.035 Y120.802 E.02174
G3 X127.345 Y121.853 I-1.784 J3.565 E.05615
G2 X128.983 Y121.945 I.905 J-1.48 E.05668
G2 X129.966 Y121.044 I-9.779 J-11.649 E.04425
G3 X131.603 Y120.952 I.905 J1.48 E.05668
G1 X131.682 Y121.019 E.00343
G1 X131.682 Y118.806 E.07341
G2 X129.638 Y118.331 I-1.304 J.975 E.07563
G2 X128.655 Y119.232 I9.785 J11.655 E.04425
M73 P85 R3
G3 X127.017 Y119.325 I-.905 J-1.48 E.05668
G3 X126.035 Y118.423 I9.783 J-11.653 E.04425
G1 X125.379 Y118.16 E.02343
G1 X125.088 Y118.169 E.00967
G1 X125.088 Y115.656 E.08335
G1 X125.379 Y115.539 E.01042
G1 X126.035 Y115.56 E.02174
G3 X127.345 Y116.612 I-1.784 J3.566 E.05615
G2 X128.983 Y116.704 I.905 J-1.48 E.05668
G2 X129.966 Y115.803 I-9.779 J-11.649 E.04425
G3 X131.603 Y115.71 I.905 J1.48 E.05668
G1 X131.682 Y115.778 E.00343
G1 X131.682 Y114.735 E.03461
G1 X131.097 Y114.735 E.0194
M204 S10000
G1 X130.01 Y114.372 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.383031
G1 F3666
M204 S6000
G1 X131.885 Y114.372 E.05197
G1 X131.981 Y114.387 E.00268
G1 X132.02 Y114.532 E.00417
G1 X132.02 Y125.519 E.3045
G1 X131.981 Y125.664 E.00416
G1 X131.885 Y125.678 E.00269
G1 X128.16 Y125.678 E.10325
; WIPE_START
G1 F10584.8
G1 X130.16 Y125.678 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.69 Y126.644 Z12.4 F42000
G1 Z12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.58604
G1 F3666
M204 S6000
G1 X132.69 Y128.256 E.07134
; WIPE_START
G1 F6628.37
G1 X132.69 Y126.644 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.779 Y133.199 Z12.4 F42000
G1 X124.403 Y140.533 Z12.4
G1 Z12
G1 E.8 F1800
; LINE_WIDTH: 0.559066
G1 F3666
M204 S6000
G1 X124.386 Y140.603 E.00305
; LINE_WIDTH: 0.52456
G1 X124.369 Y140.674 E.00284
; CHANGE_LAYER
; Z_HEIGHT: 12.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7474.471
G1 X124.386 Y140.603 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 61/75
; update layer progress
M73 L61
M991 S0 P60 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z12.4 I1.216 J.038 P1  F42000
G1 X124.816 Y126.84 Z12.4
G1 Z12.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5481
M204 S5000
G1 X132.276 Y126.84 E.22922
G1 X132.276 Y128.06 E.03749
G1 X124.816 Y128.06 E.22922
G1 X124.816 Y128.019 E.00126
G1 X124.816 Y126.9 E.03438
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.816 Y126.884 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.58 Y133.998 Z12.6 F42000
G1 X132.276 Y140.94 Z12.6
G1 Z12.2
G1 E.8 F1800
G1 F5481
M204 S5000
M73 P85 R2
G1 X132.276 Y142.16 E.03749
G1 X124.816 Y142.16 E.22922
G1 X124.816 Y142.119 E.00126
G1 X124.816 Y140.981 E.03497
G1 X124.816 Y140.94 E.00126
G1 X132.216 Y140.94 E.22738
; WIPE_START
G1 F9547.055
M204 S6000
G1 X132.276 Y142.16 E-.46416
G1 X131.497 Y142.16 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.866 Y134.536 Z12.6 F42000
G1 X132.172 Y128.19 Z12.6
G1 Z12.2
G1 E.8 F1800
G1 F5481
M204 S5000
G1 X132.172 Y140.81 E.38778
G1 X124.92 Y140.81 E.22286
G1 X124.92 Y140.769 E.00126
G1 X124.92 Y128.231 E.38526
G1 X124.92 Y128.19 E.00126
G1 X132.112 Y128.19 E.22102
; WIPE_START
G1 F9547.055
M204 S6000
G1 X132.122 Y130.19 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.448 Y137.815 Z12.6 F42000
G1 X132.564 Y140.548 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5481
M204 S6000
G1 X132.564 Y128.452 E.40124
G1 X132.814 Y128.452 E.00829
G1 X132.815 Y140.548 E.40124
G1 X132.624 Y140.548 E.00631
; WIPE_START
G1 F8843.478
G1 X132.615 Y138.548 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.565 Y132.078 Z12.6 F42000
G1 X124.785 Y126.041 Z12.6
G1 Z12.2
G1 E.8 F1800
G1 F5481
M204 S6000
G1 X124.785 Y114.009 E.3991
G1 X132.407 Y114.01 E.25283
G1 X132.407 Y126.041 E.39908
G1 X124.845 Y126.041 E.25085
M204 S10000
G1 X124.378 Y126.448 F42000
G1 F5481
M204 S6000
G1 X124.378 Y113.602 E.42611
G1 X132.814 Y113.603 E.27984
G1 X132.814 Y126.448 E.42609
G1 X124.438 Y126.448 E.27785
; WIPE_START
G1 F8843.478
G1 X124.429 Y124.448 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.331 Y132.08 Z12.6 F42000
G1 X124.194 Y142.79 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5481
M204 S5000
G3 X123.986 Y142.59 I-.006 J-.202 E.00988
G1 X123.986 Y113.408 E.89669
G3 X124.182 Y113.21 I.204 J.006 E.00941
G1 X132.992 Y113.211 E.27071
G3 X133.189 Y113.34 I-.008 J.226 E.00758
G1 X133.2 Y113.372 E.00104
G3 X133.206 Y113.431 I-.241 J.057 E.00184
G1 X133.207 Y142.458 E.89192
G3 X133.199 Y142.63 I-.626 J.058 E.00531
G1 X133.19 Y142.656 E.00084
G1 X133.182 Y142.674 E.00061
G3 X132.994 Y142.789 I-.192 J-.103 E.0071
G1 X124.254 Y142.79 E.26854
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.125 Y142.78 E-.04913
G1 X124.047 Y142.735 E-.03448
G1 X123.997 Y142.66 E-.03426
G1 X123.986 Y142.59 E-.02681
G1 X123.986 Y140.971 E-.61532
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


G1 X124.418 Y140.673 F42000
G1 Z12.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.481444
G1 F5481
M204 S6000
G1 X124.401 Y140.744 E.00261
G2 X124.402 Y142.375 I37.975 J.806 E.05828
; LINE_WIDTH: 0.461418
G1 X124.445 Y142.395 E.00164
; LINE_WIDTH: 0.421281
G1 X124.489 Y142.415 E.00148
; LINE_WIDTH: 0.381145
G1 X124.533 Y142.435 E.00133
; LINE_WIDTH: 0.341009
G1 X124.576 Y142.455 E.00117
; LINE_WIDTH: 0.280511
G1 X124.62 Y142.475 E.00093
G1 X132.472 Y142.475 E.15202
; LINE_WIDTH: 0.303638
G1 X132.519 Y142.451 E.00113
; LINE_WIDTH: 0.351035
G1 X132.567 Y142.427 E.00133
; LINE_WIDTH: 0.398431
G1 X132.614 Y142.403 E.00154
; LINE_WIDTH: 0.445827
G1 X132.662 Y142.38 E.00174
; LINE_WIDTH: 0.493223
G1 X132.709 Y142.356 E.00194
; LINE_WIDTH: 0.532614
G1 X132.725 Y142.34 E.00089
; LINE_WIDTH: 0.580248
G1 X132.74 Y142.325 E.00097
G1 X132.741 Y140.744 E.06921
; WIPE_START
G1 F6699.819
G1 X132.74 Y142.325 E-.74948
G1 X132.725 Y142.34 E-.01052
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.268 Y140.709 Z12.6 F42000
G1 X124.453 Y140.531 Z12.6
G1 Z12.2
G1 E.8 F1800
; LINE_WIDTH: 0.566966
G1 F5481
M204 S6000
G1 X124.436 Y140.602 E.00312
; LINE_WIDTH: 0.53246
G1 X124.418 Y140.673 E.00291
M204 S10000
G1 X124.724 Y140.708 F42000
; LINE_WIDTH: 0.273855
G1 F5481
M204 S6000
G1 X124.685 Y140.683 E.00087
; LINE_WIDTH: 0.321603
G1 X124.646 Y140.658 E.00105
; LINE_WIDTH: 0.369352
G1 X124.608 Y140.632 E.00123
; LINE_WIDTH: 0.4171
G1 X124.569 Y140.607 E.00141
; LINE_WIDTH: 0.464849
G1 X124.53 Y140.582 E.00159
; LINE_WIDTH: 0.512598
G1 X124.492 Y140.556 E.00177
; LINE_WIDTH: 0.584139
G1 X124.453 Y140.531 E.00204
G1 X124.453 Y128.469 E.53197
; LINE_WIDTH: 0.566984
G1 X124.436 Y128.398 E.00312
; LINE_WIDTH: 0.53247
G1 X124.418 Y128.327 E.00291
; LINE_WIDTH: 0.481448
G1 X124.401 Y128.256 E.00261
G1 X124.401 Y126.644 E.0576
M204 S10000
G1 X124.724 Y128.292 F42000
; LINE_WIDTH: 0.273855
G1 F5481
M204 S6000
G1 X124.685 Y128.317 E.00087
; LINE_WIDTH: 0.321603
G1 X124.646 Y128.342 E.00105
; LINE_WIDTH: 0.369352
G1 X124.608 Y128.368 E.00123
; LINE_WIDTH: 0.4171
G1 X124.569 Y128.393 E.00141
; LINE_WIDTH: 0.464849
G1 X124.53 Y128.418 E.00159
; LINE_WIDTH: 0.512597
G1 X124.492 Y128.444 E.00177
; LINE_WIDTH: 0.560345
G1 X124.453 Y128.469 E.00195
; WIPE_START
G1 F6957.528
G1 X124.492 Y128.444 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.761 Y125.549 Z12.6 F42000
G1 Z12.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5481
M204 S6000
G1 X127.938 Y125.129 E.01513
G1 X127.359 Y125.29 E.01994
G1 X127.052 Y124.808 E.01895
G3 X126.035 Y123.754 I1.801 J-2.757 E.049
G1 X125.379 Y123.362 E.02532
G1 X125.134 Y123.323 E.00826
G1 X125.134 Y120.889 E.08076
G1 X125.379 Y120.742 E.0095
G1 X126.035 Y120.637 E.02201
G3 X127.067 Y121.432 I-.389 J1.574 E.04447
G1 X128.361 Y119.913 E.0662
G1 X125.848 Y120.087 E.08357
G1 X126.607 Y119.196 E.03884
G1 X126.035 Y118.513 E.02956
G1 X125.379 Y118.121 E.02532
G1 X125.134 Y118.082 E.00826
G1 X125.134 Y115.647 E.08076
G1 X125.379 Y115.5 E.0095
G1 X126.035 Y115.396 E.02201
G1 X126.362 Y115.477 E.01119
G3 X127.345 Y116.522 I-2.146 J3.002 E.0479
G1 X127.582 Y116.664 E.00915
G1 X129.546 Y114.358 E.10047
G1 X127.595 Y114.358 E.06471
G3 X127.183 Y114.358 I-.206 J-.487 E.01402
G1 X125.555 Y114.358 E.05401
M204 S10000
G1 X130.274 Y114.177 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.41732
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X127.919 Y116.942 E.20238
G1 X128.54 Y116.933 E.0346
G1 X130.715 Y114.38 E.18695
G1 X131.329 Y114.38 E.03421
G1 X126.896 Y119.585 E.38105
G1 X127.548 Y119.539 E.03645
G1 X131.943 Y114.38 E.37772
G1 X132.037 Y114.38 E.00526
G1 X132.037 Y114.99 E.03399
G1 X128.201 Y119.494 E.32976
G1 X128.853 Y119.449 E.03645
G1 X132.037 Y115.71 E.27368
G1 X132.037 Y116.431 E.04016
G1 X127.303 Y121.989 E.40691
G2 X127.784 Y122.146 I.576 J-.953 E.02842
G1 X132.037 Y117.152 E.3656
G1 X132.038 Y117.872 E.04016
G1 X128.308 Y122.251 E.32051
G1 X128.833 Y122.355 E.02982
G1 X132.038 Y118.593 E.27542
G1 X132.038 Y119.314 E.04016
G1 X127.473 Y124.672 E.39226
G1 X127.55 Y124.792 E.00794
G1 X128.119 Y124.635 E.03291
G1 X132.038 Y120.034 E.33677
G1 X132.038 Y120.755 E.04016
G1 X128.495 Y124.914 E.30446
G1 X128.174 Y125.671 E.04582
G1 X128.464 Y125.671 E.01614
G1 X132.038 Y121.476 E.30713
G1 X132.038 Y122.196 E.04016
G1 X129.078 Y125.671 E.25437
G1 X129.692 Y125.671 E.03421
G1 X132.038 Y122.917 E.20161
G1 X132.038 Y123.638 E.04016
G1 X130.306 Y125.671 E.14885
M73 P86 R2
G1 X130.92 Y125.671 E.03421
G1 X132.038 Y124.358 E.09609
G1 X132.038 Y125.079 E.04016
G1 X131.361 Y125.874 E.05816
M106 S201.45
; WIPE_START
G1 X132.038 Y125.079 E-.39656
G1 X132.038 Y124.358 E-.27386
G1 X131.885 Y124.538 E-.08959
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.741 Y126.644 Z12.6 F42000
G1 Z12.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.581414
; LAYER_HEIGHT: 0.2
G1 F5481
M204 S6000
G1 X132.741 Y128.256 E.07073
; CHANGE_LAYER
; Z_HEIGHT: 12.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6685.32
G1 X132.741 Y126.644 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 62/75
; update layer progress
M73 L62
M991 S0 P61 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z12.6 I-.03 J-1.217 P1  F42000
G1 X124.87 Y126.84 Z12.6
G1 Z12.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4335
M204 S5000
G1 X132.321 Y126.84 E.22896
G1 X132.321 Y128.06 E.03749
G1 X124.87 Y128.06 E.22896
G1 X124.87 Y128.019 E.00126
G1 X124.87 Y126.9 E.03438
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.87 Y126.884 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.629 Y134 Z12.8 F42000
G1 X132.321 Y140.94 Z12.8
G1 Z12.4
G1 E.8 F1800
G1 F4335
M204 S5000
G1 X132.321 Y142.16 E.03749
G1 X124.87 Y142.16 E.22896
G1 X124.87 Y142.119 E.00126
G1 X124.87 Y140.981 E.03497
G1 X124.87 Y140.94 E.00126
G1 X132.261 Y140.94 E.22712
; WIPE_START
G1 F9547.055
M204 S6000
G1 X132.321 Y142.16 E-.46416
G1 X131.543 Y142.16 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.915 Y134.537 Z12.8 F42000
G1 X132.226 Y128.19 Z12.8
G1 Z12.4
G1 E.8 F1800
G1 F4335
M204 S5000
G1 X132.226 Y140.81 E.38778
G1 X124.973 Y140.81 E.22286
G1 X124.973 Y140.769 E.00126
G1 X124.973 Y128.231 E.38526
G1 X124.973 Y128.19 E.00126
G1 X132.166 Y128.19 E.22102
; WIPE_START
G1 F9547.055
M204 S6000
G1 X132.176 Y130.19 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.501 Y137.815 Z12.8 F42000
G1 X132.618 Y140.548 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4335
M204 S6000
G1 X132.618 Y128.452 E.40124
G1 X132.866 Y128.452 E.00821
G1 X132.866 Y140.548 E.40124
G1 X132.678 Y140.548 E.00622
; WIPE_START
G1 F8843.478
G1 X132.668 Y138.548 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.603 Y130.916 Z12.8 F42000
G1 X132.459 Y114.015 Z12.8
G1 Z12.4
G1 E.8 F1800
G1 F4335
M204 S6000
G1 X132.459 Y126.041 E.39893
G1 X124.831 Y126.041 E.25302
G1 X124.831 Y114.009 E.39911
G1 X132.399 Y114.015 E.25103
M204 S10000
G1 X132.864 Y113.629 F42000
G1 F4335
M204 S6000
G1 X132.866 Y126.448 E.42524
G1 X124.424 Y126.448 E.28003
G1 X124.424 Y113.602 E.42611
G1 X132.464 Y113.608 E.2667
G3 X132.804 Y113.624 I-.198 J7.587 E.0113
M204 S250
G1 X133.204 Y113.358 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4335
M204 S5000
G3 X133.247 Y113.475 I-.234 J.153 E.00388
G1 X133.248 Y113.479 E.00011
G1 X133.255 Y113.531 E.00162
G3 X133.258 Y114.347 I-29.512 J.516 E.02508
G1 X133.258 Y141.65 E.83896
G3 X133.255 Y142.469 I-29.735 J.3 E.02517
G1 X133.248 Y142.522 E.00161
G1 X133.247 Y142.528 E.00021
G3 X133.033 Y142.753 I-.254 J-.028 E.01022
G3 X132.108 Y142.79 I-.962 J-12.348 E.02844
G1 X124.239 Y142.79 E.24182
G3 X124.032 Y142.59 I-.004 J-.202 E.00982
G1 X124.037 Y113.36 E.89818
G3 X124.228 Y113.21 I.202 J.062 E.00794
G1 X132.476 Y113.216 E.25342
G3 X133.111 Y113.269 I-.065 J4.599 E.01959
G3 X133.166 Y113.311 I-.14 J.241 E.00214
; WIPE_START
G1 F9547.055
M204 S6000
G1 X133.247 Y113.475 E-.06965
G1 X133.248 Y113.479 E-.00135
G1 X133.255 Y113.531 E-.01997
G1 X133.258 Y114.347 E-.31017
G1 X133.258 Y115.291 E-.35886
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


G1 X132.067 Y115.586 F42000
G1 Z12.4
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F4335
M204 S6000
G1 X132.067 Y114.406 E.03625
G1 X129.705 Y114.405 E.07255
G1 X129.705 Y125.649 E.34549
G1 X132.067 Y125.649 E.07255
G1 X132.067 Y115.646 E.30734
M204 S10000
G1 X131.689 Y115.586 F42000
G1 F4335
M204 S6000
G1 X131.689 Y114.783 E.02467
G1 X130.082 Y114.782 E.04938
G1 X130.083 Y125.272 E.32231
G1 X131.689 Y125.272 E.04938
G1 X131.689 Y115.646 E.29576
M204 S10000
G1 X131.312 Y115.586 F42000
G1 F4335
M204 S6000
G1 X131.312 Y115.16 E.01309
G1 X130.46 Y115.16 E.0262
G1 X130.46 Y124.895 E.29913
G1 X131.312 Y124.895 E.0262
G1 X131.312 Y115.646 E.28417
M204 S10000
G1 X130.886 Y124.468 F42000
; LINE_WIDTH: 0.51864
G1 F4335
M204 S6000
G1 X130.886 Y115.646 E.34199
M204 S10000
G1 X129.313 Y114.678 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4335
M204 S6000
G1 X129.313 Y114.361 E.01053
G1 X128.003 Y114.36 E.04348
G1 X127.345 Y114.615 E.0234
G3 X126.608 Y114.359 I-.211 J-.581 E.02803
G1 X125.179 Y114.358 E.04738
G1 X125.179 Y115.597 E.04109
G1 X125.379 Y115.432 E.00859
G1 X126.035 Y115.179 E.0233
G3 X126.69 Y115.29 I.249 J.514 E.02353
G1 X127.345 Y116.443 E.04399
G2 X128.655 Y117.236 I1.853 J-1.584 E.05167
G2 X129.31 Y117.124 I.249 J-.514 E.02353
G1 X129.313 Y117.909 E.02605
G1 X128.655 Y119.064 E.04409
G3 X127.345 Y119.857 I-1.853 J-1.584 E.05167
G3 X126.69 Y119.745 I-.249 J-.514 E.02353
G1 X126.035 Y118.592 E.04399
G1 X125.379 Y118.053 E.02814
G1 X125.179 Y117.975 E.00712
G1 X125.179 Y120.838 E.09496
G1 X125.379 Y120.673 E.00859
G1 X126.035 Y120.42 E.0233
G3 X126.69 Y120.532 I.249 J.514 E.02353
G1 X127.345 Y121.685 E.04399
G2 X128.655 Y122.477 I1.853 J-1.585 E.05167
G2 X129.31 Y122.366 I.249 J-.514 E.02353
G1 X129.313 Y123.151 E.02605
G1 X128.655 Y124.305 E.04409
G3 X127.345 Y125.098 I-1.853 J-1.584 E.05167
G3 X126.69 Y124.986 I-.249 J-.514 E.02353
G1 X126.035 Y123.833 E.04399
G1 X125.379 Y123.294 E.02815
G1 X125.179 Y123.217 E.00712
G1 X125.179 Y125.693 E.08214
G1 X125.953 Y125.693 E.02567
G3 X126.529 Y125.693 I.288 J.677 E.01963
G1 X128.157 Y125.693 E.05401
; WIPE_START
G1 F8843.478
G1 X126.529 Y125.693 E-.61876
G1 X126.362 Y125.609 E-.0709
G1 X126.181 Y125.646 E-.07034
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.503 Y128.471 Z12.8 F42000
G1 Z12.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.567678
G1 F4335
M204 S6000
G1 X124.542 Y128.445 E.002
; LINE_WIDTH: 0.518801
G1 X124.581 Y128.42 E.00181
; LINE_WIDTH: 0.469925
G1 X124.62 Y128.394 E.00163
; LINE_WIDTH: 0.421048
G1 X124.659 Y128.369 E.00144
; LINE_WIDTH: 0.372172
G1 X124.699 Y128.343 E.00126
; LINE_WIDTH: 0.323295
G1 X124.738 Y128.318 E.00107
; LINE_WIDTH: 0.274419
G1 X124.777 Y128.292 E.00088
M204 S10000
G1 X124.451 Y126.644 F42000
; LINE_WIDTH: 0.489344
G1 F4335
M204 S6000
G1 X124.451 Y128.256 E.05864
G1 X124.468 Y128.328 E.00268
; LINE_WIDTH: 0.54035
G1 X124.485 Y128.399 E.00299
; LINE_WIDTH: 0.574864
G1 X124.503 Y128.471 E.00319
; LINE_WIDTH: 0.592026
G1 X124.503 Y140.529 E.53955
G1 X124.542 Y140.555 E.00209
; LINE_WIDTH: 0.518805
G1 X124.581 Y140.58 E.00181
; LINE_WIDTH: 0.469928
G1 X124.62 Y140.606 E.00163
; LINE_WIDTH: 0.42105
G1 X124.659 Y140.631 E.00144
; LINE_WIDTH: 0.372173
G1 X124.699 Y140.657 E.00126
; LINE_WIDTH: 0.323296
G1 X124.738 Y140.682 E.00107
; LINE_WIDTH: 0.274419
G1 X124.777 Y140.708 E.00088
M204 S10000
G1 X124.503 Y140.529 F42000
; LINE_WIDTH: 0.574863
G1 F4335
M204 S6000
G1 X124.485 Y140.601 E.00319
; LINE_WIDTH: 0.540358
G1 X124.468 Y140.672 E.00299
; LINE_WIDTH: 0.48934
G1 X124.451 Y140.744 E.00268
G2 X124.451 Y142.371 I50.367 J.806 E.05919
; LINE_WIDTH: 0.468268
G1 X124.496 Y142.392 E.0017
; LINE_WIDTH: 0.426622
G1 X124.54 Y142.413 E.00154
; LINE_WIDTH: 0.384976
G1 X124.585 Y142.433 E.00137
; LINE_WIDTH: 0.34333
G1 X124.629 Y142.454 E.0012
; LINE_WIDTH: 0.28076
G1 X124.674 Y142.475 E.00095
G1 X132.105 Y142.475 E.14403
G2 X132.549 Y142.468 I.175 J-3.167 E.00861
; LINE_WIDTH: 0.297374
G1 X132.652 Y142.407 E.00248
; LINE_WIDTH: 0.338405
G1 X132.754 Y142.345 E.00288
; LINE_WIDTH: 0.379435
G1 X132.857 Y142.284 E.00328
; LINE_WIDTH: 0.420465
G1 X132.959 Y142.222 E.00368
; LINE_WIDTH: 0.461496
G1 X133.062 Y142.161 E.00408
M204 S10000
G1 X133.036 Y142.538 F42000
; LINE_WIDTH: 0.528154
G1 F4335
M204 S6000
G1 X132.912 Y142.42 E.00677
; LINE_WIDTH: 0.567209
G1 X132.789 Y142.301 E.00732
; LINE_WIDTH: 0.587467
G2 X132.789 Y140.744 I-111.926 J-.806 E.06908
; WIPE_START
G1 F6611.004
G1 X132.789 Y142.301 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.789 Y134.668 Z12.8 F42000
G1 X132.789 Y128.256 Z12.8
G1 Z12.4
G1 E.8 F1800
; LINE_WIDTH: 0.58748
G1 F4335
M204 S6000
G1 X132.789 Y126.644 E.07153
; CHANGE_LAYER
; Z_HEIGHT: 12.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F6610.842
G1 X132.789 Y128.256 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 63/75
; update layer progress
M73 L63
M991 S0 P62 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z12.8 I.216 J-1.198 P1  F42000
G1 X124.923 Y126.84 Z12.8
G1 Z12.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4637
M204 S5000
G1 X130.775 Y126.84 E.1798
G1 X131.175 Y126.84 E.01229
G1 X131.575 Y126.84 E.01229
G1 F2049.099
G1 X131.575 Y126.881 E.00126
M106 S255
G1 F1800
G1 X131.575 Y127.25 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
M73 P87 R2
G1 X131.575 Y127.65 E.01327
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X131.575 Y128.019 E.01134
M106 S201.45
G1 F2049.099
G1 X131.575 Y128.06 E.00126
G1 F4637
G1 X131.175 Y128.06 E.01229
G1 X130.775 Y128.06 E.01229
G1 X124.923 Y128.06 E.1798
G1 X124.923 Y128.019 E.00126
G1 X124.923 Y126.9 E.03438
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.923 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.606 Y134.025 Z13 F42000
G1 X132.154 Y140.81 Z13
G1 Z12.6
G1 E.8 F1800
G1 F4637
M204 S5000
G1 X125.027 Y140.81 E.21901
G1 X125.027 Y140.769 E.00126
G1 X125.027 Y128.231 E.38526
G1 X125.027 Y128.19 E.00126
G1 X132.154 Y128.19 E.21901
G1 X132.154 Y128.231 E.00126
G1 X132.154 Y140.75 E.38467
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.154 Y140.767 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.923 Y142.119 Z13 F42000
G1 Z12.6
G1 E.8 F1800
G1 F4637
M204 S5000
G1 X124.923 Y140.981 E.03497
G1 X124.923 Y140.94 E.00126
G1 X130.775 Y140.94 E.1798
G1 X131.175 Y140.94 E.01229
G1 X131.575 Y140.94 E.01229
G1 F2049.036
G1 X131.575 Y140.981 E.00126
M106 S255
G1 F1800
G1 X131.575 Y141.35 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X131.575 Y141.75 E.01327
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X131.575 Y142.119 E.01134
M106 S201.45
G1 F2049.099
G1 X131.575 Y142.16 E.00126
G1 F4637
G1 X131.175 Y142.16 E.01229
G1 X130.775 Y142.16 E.01229
G1 X124.942 Y142.16 E.17921
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.923 Y140.981 E-.44808
G1 X124.923 Y140.94 E-.01558
G1 X125.703 Y140.94 E-.29635
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.569 Y133.539 Z13 F42000
G1 X132.479 Y114.069 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4637
M204 S6000
G1 X132.48 Y126.041 E.39713
G1 X124.877 Y126.041 E.25221
G1 X124.877 Y114.009 E.39911
G1 X131.595 Y114.012 E.22285
G3 X132.419 Y114.063 I-.409 J13.153 E.02741
M204 S10000
G1 X132.886 Y113.713 F42000
G1 F4637
M204 S6000
G1 X132.888 Y142.287 E.94785
G1 X132.365 Y142.341 E.01746
G1 X131.967 Y142.382 E.01327
G1 F1742.855
G1 X131.967 Y142.132 E.00826
M106 S255
G1 F600
G1 X131.967 Y141.202 E.03086
M106 S201.45
G1 F2160
G1 X132.294 Y141.202 E.01084
G1 F4093.96
G1 X132.546 Y141.202 E.00838
G1 F4637
G1 X132.546 Y140.802 E.01327
G1 X132.546 Y140.402 E.01327
G1 X132.546 Y128.598 E.39156
G1 X132.546 Y128.198 E.01327
G1 X132.546 Y127.798 E.01327
G1 F4093.96
G1 X132.294 Y127.798 E.00838
G1 F2160
G1 X131.967 Y127.798 E.01084
M106 S255
G1 F600
G1 X131.967 Y126.867 E.03086
M106 S201.45
G1 F2869.055
G1 X131.967 Y126.448 E.01392
G1 F4637
G1 X131.567 Y126.448 E.01327
G1 X131.167 Y126.448 E.01327
G1 X124.47 Y126.448 E.22215
G1 X124.47 Y113.602 E.42611
G1 X131.604 Y113.605 E.23665
G3 X132.827 Y113.705 I-.267 J10.767 E.04072
M204 S250
G1 X133.184 Y113.43 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4637
M204 S5000
G3 X133.278 Y113.735 I-.336 J.271 E.01004
G1 X133.28 Y142.195 E.8745
G3 X133.114 Y142.639 I-.513 J.061 E.01514
G1 X133.091 Y142.648 E.00074
G3 X131.363 Y142.79 I-1.685 J-9.929 E.05337
G1 X124.256 Y142.789 E.21835
G3 X124.078 Y142.59 I.018 J-.196 E.00901
G1 X124.083 Y113.36 E.89818
G3 X124.274 Y113.21 I.202 J.061 E.00795
G1 X131.612 Y113.213 E.22548
G3 X133.114 Y113.361 I-.119 J8.869 E.04642
G3 X133.143 Y113.386 I-.266 J.34 E.00117
; WIPE_START
G1 F9547.055
M204 S6000
G1 X133.239 Y113.52 E-.06277
G1 X133.278 Y113.735 E-.08289
G1 X133.278 Y115.351 E-.61434
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


G1 X125.225 Y119.077 F42000
G1 Z12.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4637
M204 S6000
G1 X125.225 Y120.706 E.05401
G1 X126.013 Y120.138 E.03223
G2 X126.287 Y119.483 I-.409 J-.555 E.02474
G2 X125.225 Y117.863 I-2.371 J.396 E.06614
G1 X125.225 Y115.464 E.07956
G1 X126.013 Y114.897 E.03223
G2 X126.276 Y114.358 I-.317 J-.488 E.02088
G1 X128.114 Y114.359 E.06096
G1 X127.366 Y114.897 E.03056
G2 X127.092 Y115.552 I.409 J.555 E.02474
G2 X127.724 Y116.862 I2.083 J-.197 E.04928
G1 X128.567 Y117.494 E.03495
G1 X128.567 Y118.891 E.04633
G1 X128.276 Y119.483 E.02188
G1 X127.366 Y120.138 E.0372
G2 X127.092 Y120.793 I.409 J.555 E.02474
G2 X127.724 Y122.104 I2.083 J-.197 E.04928
G1 X128.567 Y122.736 E.03495
G1 X128.567 Y124.132 E.04633
G1 X128.276 Y124.724 E.02188
G1 X127.366 Y125.38 E.0372
G1 X127.135 Y125.693 E.01291
G1 X125.579 Y125.693 E.05161
G2 X126.287 Y124.724 I-.416 J-1.048 E.04196
G2 X125.225 Y123.104 I-2.37 J.396 E.06614
G1 X125.225 Y124.733 E.05401
; WIPE_START
G1 F8843.478
G1 X125.225 Y123.104 E-.61876
G1 X125.527 Y123.321 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.5 Y126.644 Z13 F42000
G1 Z12.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.49725
G1 F4637
M204 S6000
G1 X124.5 Y128.256 E.05968
G1 X124.518 Y128.328 E.00275
; LINE_WIDTH: 0.54825
G1 X124.535 Y128.4 E.00306
; LINE_WIDTH: 0.582764
G1 X124.552 Y128.473 E.00327
M204 S10000
G1 X124.831 Y128.293 F42000
; LINE_WIDTH: 0.271858
G1 F4637
M204 S6000
G1 X124.796 Y128.315 E.00077
; LINE_WIDTH: 0.315613
G1 X124.761 Y128.338 E.00092
; LINE_WIDTH: 0.359369
G1 X124.726 Y128.36 E.00107
; LINE_WIDTH: 0.403124
G1 X124.691 Y128.383 E.00122
; LINE_WIDTH: 0.446879
G1 X124.657 Y128.405 E.00136
; LINE_WIDTH: 0.490635
G1 X124.622 Y128.428 E.00151
; LINE_WIDTH: 0.53439
G1 X124.587 Y128.45 E.00166
; LINE_WIDTH: 0.578146
G1 X124.552 Y128.473 E.00181
; LINE_WIDTH: 0.599945
G1 X124.552 Y140.527 E.54716
G1 X124.587 Y140.55 E.00188
; LINE_WIDTH: 0.534388
G1 X124.622 Y140.572 E.00166
; LINE_WIDTH: 0.490633
G1 X124.657 Y140.595 E.00151
; LINE_WIDTH: 0.446878
G1 X124.691 Y140.617 E.00136
; LINE_WIDTH: 0.403123
G1 X124.726 Y140.64 E.00122
; LINE_WIDTH: 0.359368
G1 X124.761 Y140.662 E.00107
; LINE_WIDTH: 0.315613
G1 X124.796 Y140.685 E.00092
; LINE_WIDTH: 0.271858
G1 X124.831 Y140.707 E.00077
M204 S10000
G1 X124.552 Y140.527 F42000
; LINE_WIDTH: 0.582769
G1 F4637
M204 S6000
G1 X124.535 Y140.6 E.00327
; LINE_WIDTH: 0.548262
G1 X124.518 Y140.672 E.00306
; LINE_WIDTH: 0.497247
G1 X124.5 Y140.744 E.00275
G2 X124.501 Y142.367 I68.794 J.806 E.06009
; LINE_WIDTH: 0.475166
G1 X124.546 Y142.389 E.00177
; LINE_WIDTH: 0.431987
G1 X124.591 Y142.41 E.00159
; LINE_WIDTH: 0.388808
G1 X124.637 Y142.432 E.00142
; LINE_WIDTH: 0.345629
G1 X124.682 Y142.453 E.00124
; LINE_WIDTH: 0.280842
G1 X124.727 Y142.475 E.00097
G1 X131.771 Y142.471 E.13655
; WIPE_START
G1 F15000
G1 X129.771 Y142.472 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13 I1.198 J.214 P1  F42000
G1 X132.427 Y127.594 Z13
G1 Z12.6
G1 E.8 F1800
; LINE_WIDTH: 0.556189
G1 F4637
M204 S6000
G1 X132.427 Y126.244 E.05646
M204 S10000
G1 X132.088 Y125.649 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F4637
M204 S6000
G1 X132.087 Y114.436 E.34452
G1 X131.582 Y114.404 E.01554
G1 X128.959 Y114.403 E.0806
G1 X128.959 Y125.649 E.34555
G1 X132.028 Y125.649 E.09429
M204 S10000
G1 X131.711 Y125.272 F42000
G1 F4637
M204 S6000
G1 X131.71 Y114.79 E.32207
G1 X129.336 Y114.78 E.07294
G1 X129.336 Y125.272 E.32237
G1 X131.651 Y125.272 E.07112
M204 S10000
G1 X131.334 Y124.895 F42000
G1 F4637
M204 S6000
G1 X131.333 Y115.158 E.29918
G1 X129.713 Y115.157 E.04977
G1 X129.713 Y124.895 E.2992
G1 X131.274 Y124.895 E.04795
M204 S10000
G1 X130.957 Y124.518 F42000
G1 F4637
M204 S6000
G1 X130.956 Y115.535 E.27601
G1 X130.09 Y115.534 E.0266
G1 X130.09 Y124.518 E.27602
G1 X130.897 Y124.518 E.02477
M204 S10000
G1 X130.523 Y124.084 F42000
; LINE_WIDTH: 0.5318
G1 F4637
M204 S6000
G1 X130.523 Y116.027 E.32097
; CHANGE_LAYER
; Z_HEIGHT: 12.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7363.771
G1 X130.523 Y118.027 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 64/75
; update layer progress
M73 L64
M991 S0 P63 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z13 I-1.03 J-.648 P1  F42000
G1 X124.977 Y126.84 Z13
G1 Z12.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6241
M204 S5000
G1 X130.028 Y126.84 E.15522
G1 X130.428 Y126.84 E.01229
G1 F5326.049
G1 X130.828 Y126.84 E.01229
G1 F2049.099
G1 X130.828 Y126.881 E.00126
M106 S255
G1 F1800
G1 X130.828 Y127.25 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X130.828 Y127.65 E.01327
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X130.828 Y128.019 E.01134
M106 S201.45
G1 F2049.099
G1 X130.828 Y128.06 E.00126
G1 F5326.049
G1 X130.428 Y128.06 E.01229
G1 F6241
G1 X130.028 Y128.06 E.01229
G1 X124.977 Y128.06 E.15522
G1 X124.977 Y128.019 E.00126
G1 X124.977 Y126.9 E.03438
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.977 Y126.876 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.947 Y134.439 Z13.2 F42000
G1 X125.08 Y140.81 Z13.2
G1 Z12.8
G1 E.8 F1800
G1 F6241
M204 S5000
G1 X125.08 Y140.769 E.00126
G1 X125.08 Y128.231 E.38526
G1 X125.08 Y128.19 E.00126
G1 X130.608 Y128.19 E.16984
G1 X131.008 Y128.19 E.01229
G1 F5325.948
G1 X131.408 Y128.19 E.01229
G1 F2049.036
G1 X131.408 Y128.231 E.00126
M106 S255
G1 F1800
G1 X131.408 Y128.6 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
G1 X131.408 Y128.665 E.00216
G1 X131.744 Y128.665 E.01116
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 X131.841 Y128.665 E.00299
M106 S201.45
M106 S255
G1 F720
G1 X131.841 Y140.335 E.35859
M106 S201.45
M106 S255
G1 F600
G1 X131.744 Y140.335 E.00299
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255

G1 X131.408 Y140.335 E.01116
G1 X131.408 Y140.4 E.00216
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X131.408 Y140.769 E.01134
M106 S201.45
G1 F2049.099
G1 X131.408 Y140.81 E.00126
G1 F5326.049
G1 X131.008 Y140.81 E.01229
G1 F6241
G1 X130.608 Y140.81 E.01229
G1 X125.14 Y140.81 E.168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.08 Y140.769 E-.02761
G1 X125.08 Y138.842 E-.73239
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.828 Y140.981 Z13.2 F42000
G1 Z12.8
G1 E.8 F1800
M106 S255
M204 S5000
G1 X130.828 Y141.35 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X130.828 Y141.75 E.01327
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
M73 P88 R2
G1 F1800
G1 X130.828 Y142.119 E.01134
M106 S201.45
G1 F2049.099
G1 X130.828 Y142.16 E.00126
G1 F5326.049
G1 X130.428 Y142.16 E.01229
G1 F6241
G1 X130.028 Y142.16 E.01229
G1 X124.977 Y142.16 E.15522
G1 X124.977 Y142.119 E.00126
G1 X124.977 Y140.981 E.03497
G1 X124.977 Y140.94 E.00126
G1 X130.809 Y140.94 E.17921
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.828 Y141.35 E-.15596
G1 X130.828 Y141.75 E-.152
G1 X130.828 Y142.119 E-.14022
G1 X130.828 Y142.16 E-.01558
G1 X130.428 Y142.16 E-.152
G1 X130.049 Y142.16 E-.14424
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.736 Y134.886 Z13.2 F42000
G1 X124.922 Y126.041 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6241
M204 S6000
G1 X124.922 Y114.009 E.39911
G1 X130.946 Y114.014 E.1998
G3 X132.397 Y114.174 I-.319 J9.576 E.04849
G1 X132.397 Y127.391 E.43843
G1 X131.627 Y127.391 E.02553
G1 X131.627 Y126.041 E.04478
G1 X124.982 Y126.041 E.22043
; WIPE_START
G1 F8843.478
G1 X124.972 Y124.041 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.632 Y131.195 Z13.2 F42000
G1 X131.627 Y141.94 Z13.2
G1 Z12.8
G1 E.8 F1800
G1 F6241
M204 S6000
G1 X131.627 Y141.609 E.01098
G1 X132.347 Y141.609 E.02388
G1 X132.369 Y141.829 E.00734
G3 X131.687 Y141.934 I-1.418 J-6.959 E.0229
M204 S10000
G1 X131.22 Y142.38 F42000
G1 F1731.823
M204 S6000
G1 X131.22 Y142.132 E.0082
M106 S255
G1 F600
G1 X131.22 Y141.202 E.03086
M106 S201.45
G1 F2160
G1 X131.547 Y141.202 E.01084
G1 F4093.96
G1 X131.8 Y141.202 E.00838
G1 F6241
G1 X131.8 Y140.782 E.01392
G1 X131.8 Y140.727 E.00184
G1 X132.127 Y140.727 E.01084
G1 X132.233 Y140.727 E.00354
G1 X132.233 Y128.273 E.41313
G1 X132.127 Y128.273 E.00354
G1 X131.8 Y128.273 E.01084
G1 X131.8 Y128.217 E.00184
G1 X131.8 Y127.798 E.01392
G1 F4093.96
G1 X131.547 Y127.798 E.00838
G1 F2160
G1 X131.22 Y127.798 E.01084
M106 S255
G1 F600
G1 X131.22 Y126.867 E.03086
M106 S201.45
G1 F2869.055
G1 X131.22 Y126.448 E.01392
G1 F6241
G1 X130.82 Y126.448 E.01327
G1 X130.42 Y126.448 E.01327
G1 X124.515 Y126.448 E.19588
G1 X124.515 Y113.602 E.42611
G1 X130.958 Y113.607 E.2137
G3 X132.804 Y113.86 I-.171 J8.11 E.06196
G1 X132.804 Y142.139 E.93806
G3 X131.28 Y142.376 I-2.011 J-7.908 E.05124
; WIPE_START
G1 F8843.478
G1 X131.22 Y142.132 E-.09537
G1 X131.22 Y141.202 E-.35356
G1 X131.547 Y141.202 E-.1242
G1 X131.8 Y141.202 E-.09603
G1 X131.8 Y140.963 E-.09084
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.386 Y142.777 Z13.2 F42000
G1 X124.335 Y142.79 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6241
M204 S5000
G3 X124.123 Y142.59 I-.013 J-.198 E.01002
G1 X124.123 Y113.41 E.89663
G3 X124.322 Y113.21 I.198 J-.002 E.00962
G1 X130.969 Y113.215 E.20426
G3 X133.112 Y113.559 I.047 J6.563 E.06699
G3 X133.196 Y113.806 I-.268 J.23 E.00821
G1 X133.196 Y142.194 E.8723
G3 X132.982 Y142.495 I-.269 J.035 E.01249
G3 X130.616 Y142.79 I-2.185 J-7.893 E.07353
G1 X124.395 Y142.79 E.19116
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.245 Y142.774 E-.05738
G1 X124.188 Y142.738 E-.02543
G1 X124.135 Y142.661 E-.03554
G1 X124.123 Y142.59 E-.0273
G1 X124.123 Y140.974 E-.61434
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


G1 X124.567 Y140.671 F42000
G1 Z12.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.556145
G1 F6241
M204 S6000
G1 X124.585 Y140.598 E.00313
; LINE_WIDTH: 0.590654
G1 X124.602 Y140.525 E.00334
M204 S10000
G1 X124.567 Y140.671 F42000
; LINE_WIDTH: 0.505143
G1 F6241
M204 S6000
G1 X124.55 Y140.744 E.00282
G1 X124.55 Y142.363 E.06099
; LINE_WIDTH: 0.48212
G1 X124.596 Y142.386 E.00184
; LINE_WIDTH: 0.437395
G1 X124.642 Y142.408 E.00165
; LINE_WIDTH: 0.392671
G1 X124.689 Y142.43 E.00146
; LINE_WIDTH: 0.347947
G1 X124.735 Y142.453 E.00127
; LINE_WIDTH: 0.281055
G1 X124.781 Y142.475 E.00099
G1 X130.613 Y142.475 E.11317
; LINE_WIDTH: 0.278067
G1 X131.024 Y142.471 E.00788
; WIPE_START
G1 F15000
G1 X130.613 Y142.475 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.2 I.657 J1.025 P1  F42000
G1 X132.281 Y141.406 Z13.2
G1 Z12.8
G1 E.8 F1800
; LINE_WIDTH: 0.349726
G1 F6241
M204 S6000
G1 X132.341 Y141.287 E.00332
; LINE_WIDTH: 0.308817
G1 X132.4 Y141.168 E.00288
; LINE_WIDTH: 0.267908
G1 X132.459 Y141.049 E.00243
; LINE_WIDTH: 0.226999
G1 X132.519 Y140.931 E.00199
; LINE_WIDTH: 0.206788
G1 X132.519 Y128.069 E.17174
G1 X132.459 Y127.951 E.00177
; LINE_WIDTH: 0.26796
G1 X132.4 Y127.832 E.00243
; LINE_WIDTH: 0.308879
G1 X132.341 Y127.713 E.00288
; LINE_WIDTH: 0.349799
G1 X132.281 Y127.594 E.00332
M204 S10000
G1 X132.012 Y127.187 F42000
; LINE_WIDTH: 0.40562
G1 F6241
M204 S6000
G1 X132.012 Y125.837 E.0399
M204 S10000
G1 X131.417 Y125.649 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F6241
M204 S6000
G1 X131.504 Y125.475 E.00596
G1 X132.005 Y125.445 E.01543
G1 X132.005 Y114.51 E.33599
G1 X130.969 Y114.409 E.032
G2 X128.213 Y114.404 I-2.21 J506.181 E.08469
G1 X128.213 Y125.649 E.34551
G1 X131.357 Y125.649 E.09663
M204 S10000
G1 X131.238 Y125.272 F42000
G1 F6241
M204 S6000
G1 X131.3 Y125.158 E.00398
G1 X131.628 Y125.046 E.01065
G1 X131.628 Y114.834 E.31379
G2 X130.11 Y114.783 I-1.13 J10.981 E.04671
G1 X128.59 Y114.781 E.04672
G1 X128.59 Y125.272 E.32233
G1 X131.178 Y125.272 E.07953
M204 S10000
G1 X131.067 Y124.895 F42000
G1 F6241
M204 S6000
G1 X131.096 Y124.841 E.00188
G1 X131.251 Y124.795 E.00496
G1 X131.251 Y115.183 E.29536
G2 X128.967 Y115.159 I-1.759 J58.434 E.07019
G1 X128.967 Y124.895 E.29915
G1 X131.007 Y124.895 E.06268
M204 S10000
G1 X130.874 Y124.518 F42000
G1 F6241
M204 S6000
G1 X130.874 Y115.537 E.27593
G1 X129.344 Y115.536 E.04701
G1 X129.344 Y124.518 E.27597
G1 X130.814 Y124.518 E.04517
M204 S10000
G1 X130.497 Y124.141 F42000
G1 F6241
M204 S6000
G1 X130.497 Y115.914 E.25277
G1 X129.721 Y115.914 E.02384
G1 X129.721 Y124.141 E.25278
G1 X130.437 Y124.141 E.022
M204 S10000
G1 X130.109 Y123.753 F42000
; LINE_WIDTH: 0.44178
G1 F6241
M204 S6000
G1 X130.109 Y116.362 E.24021
M204 S10000
G1 X127.821 Y115.407 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6241
M204 S6000
G1 X127.821 Y117.035 E.05401
G3 X127.279 Y115.552 I1.482 J-1.381 E.05378
G3 X127.821 Y114.757 I1.713 J.585 E.03228
G1 X127.821 Y114.36 E.01318
G1 X126.057 Y114.359 E.05849
G3 X125.271 Y115.312 I-2.195 J-1.01 E.04146
G1 X125.271 Y117.725 E.08004
G3 X126.1 Y119.483 I-1.263 J1.67 E.06706
G3 X125.271 Y120.553 I-2.167 J-.823 E.04558
G1 X125.271 Y122.966 E.08004
G3 X126.1 Y124.724 I-1.263 J1.67 E.06706
G3 X125.377 Y125.693 I-1.983 J-.727 E.04064
G1 X127.412 Y125.693 E.06748
G3 X127.821 Y125.24 I2.26 J1.63 E.02027
G1 X127.821 Y122.276 E.09831
G3 X127.279 Y120.793 I1.482 J-1.381 E.05378
G3 X127.821 Y119.999 I1.713 J.585 E.03228
G1 X127.821 Y118.37 E.05401
; WIPE_START
G1 F8843.478
G1 X127.821 Y119.999 E-.61876
G1 X127.572 Y120.275 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.55 Y126.644 Z13.2 F42000
G1 Z12.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.505146
G1 F6241
M204 S6000
G1 X124.55 Y128.256 E.06072
G1 X124.567 Y128.329 E.00282
; LINE_WIDTH: 0.55614
G1 X124.585 Y128.402 E.00313
; LINE_WIDTH: 0.590647
G1 X124.602 Y128.475 E.00334
; LINE_WIDTH: 0.585539
G1 X124.637 Y128.452 E.00186
; LINE_WIDTH: 0.540798
G1 X124.672 Y128.429 E.0017
; LINE_WIDTH: 0.496056
G1 X124.708 Y128.407 E.00155
; LINE_WIDTH: 0.451315
G1 X124.743 Y128.384 E.0014
; LINE_WIDTH: 0.406574
G1 X124.778 Y128.361 E.00124
; LINE_WIDTH: 0.361833
G1 X124.814 Y128.338 E.00109
; LINE_WIDTH: 0.317092
G1 X124.849 Y128.316 E.00094
; LINE_WIDTH: 0.272351
G1 X124.884 Y128.293 E.00078
M204 S10000
G1 X124.602 Y128.475 F42000
; LINE_WIDTH: 0.607833
G1 F6241
M204 S6000
G1 X124.602 Y140.525 E.55474
G1 X124.637 Y140.548 E.00193
; LINE_WIDTH: 0.540807
G1 X124.672 Y140.571 E.0017
; LINE_WIDTH: 0.496064
G1 X124.708 Y140.593 E.00155
; LINE_WIDTH: 0.451322
G1 X124.743 Y140.616 E.0014
; LINE_WIDTH: 0.406579
G1 X124.778 Y140.639 E.00124
; LINE_WIDTH: 0.361837
G1 X124.814 Y140.662 E.00109
; LINE_WIDTH: 0.317094
G1 X124.849 Y140.684 E.00094
; LINE_WIDTH: 0.272352
G1 X124.884 Y140.707 E.00078
; CHANGE_LAYER
; Z_HEIGHT: 13
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.849 Y140.684 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 65/75
; update layer progress
M73 L65
M991 S0 P64 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z13.2 I1.217 J.016 P1  F42000
G1 X125.03 Y126.84 Z13.2
G1 Z13
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5857
M204 S5000
G1 X129.282 Y126.84 E.13063
G1 X129.682 Y126.84 E.01229
G1 F5326.049
G1 X130.082 Y126.84 E.01229
G1 F2049.099
G1 X130.082 Y126.881 E.00126
M106 S255
G1 F1800
G1 X130.082 Y127.25 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X130.082 Y127.65 E.01327
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X130.082 Y128.019 E.01134
M106 S201.45
G1 F2049.036
G1 X130.082 Y128.06 E.00126
G1 F5325.948
G1 X129.682 Y128.06 E.01229
G1 F5857
G1 X129.282 Y128.06 E.01229
G1 X125.03 Y128.06 E.13063
G1 X125.03 Y128.019 E.00126
G1 X125.03 Y126.9 E.03438
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.03 Y126.872 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.954 Y134.258 Z13.4 F42000
G1 X130.661 Y140.81 Z13.4
G1 Z13
G1 E.8 F1800
G1 F5857
M204 S5000
G1 X125.134 Y140.81 E.16984
G1 X125.134 Y140.769 E.00126
G1 X125.134 Y128.231 E.38526
G1 X125.134 Y128.19 E.00126
G1 X129.861 Y128.19 E.14526
G1 X130.261 Y128.19 E.01229
G1 F5325.948
G1 X130.661 Y128.19 E.01229
G1 F2049.036
G1 X130.661 Y128.231 E.00126
M106 S255
G1 F1800
G1 X130.661 Y128.6 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
G1 X130.661 Y128.665 E.00216
G1 X130.998 Y128.665 E.01116
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X131.367 Y128.665 E.01134
M106 S201.45
G1 F5857
G1 X131.895 Y128.665 E.01623
G1 X131.895 Y129.065 E.01229
G1 X131.895 Y139.935 E.334
G1 X131.895 Y140.335 E.01229
G1 X131.367 Y140.335 E.01623
M106 S255
G1 F1800
G1 X130.998 Y140.335 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
G1 X130.661 Y140.335 E.01116
G1 X130.661 Y140.4 E.00216
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X130.661 Y140.75 E.01075
M106 S201.45
; WIPE_START
M204 S6000
G1 X128.662 Y140.772 E-.76
; WIPE_END
G1 E-.04
M204 S10000
G1 X125.03 Y140.981 Z13.4 F42000
G1 Z13
G1 E.8 F1800
G1 F5857
M204 S5000
G1 X125.03 Y140.94 E.00126
G1 X129.282 Y140.94 E.13063
G1 X129.682 Y140.94 E.01229
G1 F5325.948
G1 X130.082 Y140.94 E.01229
G1 F2049.036
G1 X130.082 Y140.981 E.00126
M106 S255
G1 F1800
G1 X130.082 Y141.35 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X130.082 Y141.75 E.01327
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X130.082 Y142.119 E.01134
M106 S201.45
G1 F2049.099
G1 X130.082 Y142.16 E.00126
G1 F5326.049
G1 X129.682 Y142.16 E.01229
G1 F5857
G1 X129.282 Y142.16 E.01229
G1 X125.03 Y142.16 E.13063
G1 X125.03 Y142.119 E.00126
G1 X125.03 Y141.041 E.03312
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.03 Y140.94 E-.03838
G1 X126.929 Y140.94 E-.72162
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.474 Y142.381 Z13.4 F42000
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1739.443
M204 S6000
G1 X130.474 Y142.132 E.00824
M106 S255
G1 F600
G1 X130.474 Y141.202 E.03086
M106 S201.45
G1 F2160
G1 X130.801 Y141.202 E.01084
G1 F2854.356
G1 X130.901 Y141.202 E.00333
G1 F5857
G1 X130.901 Y141.602 E.01327
G1 X130.901 Y142.002 E.01327
G1 X130.901 Y142.233 E.00765
G1 X130.842 Y142.233 E.00195
G1 X130.808 Y142.358 E.0043
G3 X130.534 Y142.378 I-.653 J-6.996 E.00912
; WIPE_START
G1 F8843.478
G1 X130.474 Y142.132 E-.09601
M73 P89 R2
G1 X130.474 Y141.202 E-.35356
G1 X130.801 Y141.202 E-.1242
G1 X130.901 Y141.202 E-.03812
G1 X130.901 Y141.592 E-.14811
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.4 I1.137 J-.434 P1  F42000
G1 X124.968 Y126.041 Z13.4
G1 Z13
G1 E.8 F1800
G1 F5857
M204 S6000
G1 X124.968 Y114.009 E.39911
G1 X130.221 Y114.015 E.17426
G1 X130.487 Y114.027 E.00883
G1 X130.487 Y126.041 E.39854
G1 X125.028 Y126.041 E.18107
; WIPE_START
G1 F8843.478
G1 X125.018 Y124.041 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.4 I-.69 J1.002 P1  F42000
G1 X130.474 Y127.798 Z13.4
G1 Z13
G1 E.8 F1800
M106 S255
G1 F600
M204 S6000
G1 X130.474 Y126.867 E.03086
M106 S201.45
G1 F2869.055
G1 X130.474 Y126.448 E.01392
G1 F5857
G1 X130.074 Y126.448 E.01327
G1 X129.674 Y126.448 E.01327
G1 X124.561 Y126.448 E.1696
G1 X124.561 Y113.602 E.42611
G1 X130.234 Y113.608 E.18817
G3 X130.876 Y113.649 I-.382 J11.067 E.02135
G1 X130.894 Y113.858 E.00698
G1 X130.901 Y126.998 E.43587
G1 X130.901 Y127.398 E.01327
G1 X130.901 Y127.798 E.01327
G1 F2854.356
G1 X130.801 Y127.798 E.00333
G1 F2160
G1 X130.534 Y127.798 E.00885
; WIPE_START
G1 X130.474 Y126.867 E-.3543
G1 X130.474 Y126.448 E-.15944
G1 X130.074 Y126.448 E-.152
G1 X129.826 Y126.448 E-.09426
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.377 Y133.677 Z13.4 F42000
G1 X124.295 Y142.777 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5857
M204 S5000
G3 X124.169 Y142.591 I.072 J-.185 E.00735
G1 X124.169 Y113.41 E.89664
G3 X124.367 Y113.21 I.198 J-.002 E.00962
G1 X130.246 Y113.216 E.18064
G3 X132.354 Y113.547 I-.047 J7.18 E.06582
G3 X132.753 Y113.809 I-.191 J.724 E.01492
G1 X132.75 Y142.204 E.8725
G3 X132.155 Y142.52 I-.808 J-.802 E.02101
G3 X129.869 Y142.79 I-2.172 J-8.594 E.07092
G1 X124.379 Y142.79 E.1687
G3 X124.354 Y142.79 I-.011 J-.198 E.00076
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.233 Y142.738 E-.05001
G1 X124.181 Y142.662 E-.0353
G1 X124.169 Y142.591 E-.02741
G1 X124.169 Y140.887 E-.64728
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


G1 X124.617 Y140.67 F42000
G1 Z13
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51304
G1 F5857
M204 S6000
G1 X124.6 Y140.744 E.00289
G1 X124.6 Y142.359 E.06188
; LINE_WIDTH: 0.489143
G1 X124.647 Y142.382 E.0019
; LINE_WIDTH: 0.442858
G1 X124.694 Y142.406 E.00171
; LINE_WIDTH: 0.396573
G1 X124.741 Y142.429 E.00151
; LINE_WIDTH: 0.350288
G1 X124.787 Y142.452 E.00131
; LINE_WIDTH: 0.281099
G1 X124.834 Y142.475 E.00102
G1 X129.866 Y142.475 E.09766
; LINE_WIDTH: 0.277786
G1 X130.278 Y142.471 E.00788
; WIPE_START
G1 F15000
G1 X129.866 Y142.475 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.938 Y140.707 Z13.4 F42000
G1 Z13
G1 E.8 F1800
; LINE_WIDTH: 0.272844
G1 F5857
M204 S6000
G1 X124.902 Y140.684 E.0008
; LINE_WIDTH: 0.318572
G1 X124.866 Y140.661 E.00095
; LINE_WIDTH: 0.364299
G1 X124.831 Y140.638 E.00111
; LINE_WIDTH: 0.410027
G1 X124.795 Y140.615 E.00127
; LINE_WIDTH: 0.455754
G1 X124.759 Y140.592 E.00143
; LINE_WIDTH: 0.501482
G1 X124.723 Y140.569 E.00159
; LINE_WIDTH: 0.547209
G1 X124.687 Y140.546 E.00175
; LINE_WIDTH: 0.61572
G1 X124.651 Y140.524 E.00198
G1 X124.651 Y128.476 E.56231
; LINE_WIDTH: 0.592943
G1 X124.687 Y128.454 E.0019
; LINE_WIDTH: 0.547215
G1 X124.723 Y128.431 E.00175
; LINE_WIDTH: 0.501486
G1 X124.759 Y128.408 E.00159
; LINE_WIDTH: 0.455758
G1 X124.795 Y128.385 E.00143
; LINE_WIDTH: 0.41003
G1 X124.831 Y128.362 E.00127
; LINE_WIDTH: 0.364301
G1 X124.866 Y128.339 E.00111
; LINE_WIDTH: 0.318573
G1 X124.902 Y128.316 E.00095
; LINE_WIDTH: 0.272845
G1 X124.938 Y128.293 E.0008
M204 S10000
G1 X124.634 Y128.403 F42000
; LINE_WIDTH: 0.598547
G1 F5857
M204 S6000
G1 X124.651 Y128.476 E.00342
M204 S10000
G1 X124.634 Y128.403 F42000
; LINE_WIDTH: 0.56404
G1 F5857
M204 S6000
G1 X124.617 Y128.329 E.00321
; LINE_WIDTH: 0.513043
G1 X124.6 Y128.256 E.00289
G1 X124.6 Y126.644 E.06175
; WIPE_START
G1 F7657.583
G1 X124.6 Y128.256 E-.726
G1 X124.617 Y128.329 E-.034
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.827 Y125.693 Z13.4 F42000
G1 Z13
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5857
M204 S6000
G1 X125.316 Y125.693 E.0501
G3 X125.483 Y125.38 I.266 J-.059 E.01281
G1 X125.956 Y124.724 E.02679
G2 X125.316 Y122.807 I-1.826 J-.457 E.07078
G1 X125.316 Y120.333 E.08205
G2 X125.956 Y119.483 I-4.769 J-4.251 E.03533
G2 X125.316 Y117.566 I-1.826 J-.457 E.07078
G1 X125.316 Y115.092 E.08205
G2 X125.871 Y114.359 I-4.112 J-3.688 E.03055
G1 X127.074 Y114.36 E.0399
G1 X127.074 Y114.785 E.01412
M204 S10000
G1 X130.095 Y115.721 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F5857
M204 S6000
G1 X130.095 Y114.409 E.04031
G1 X127.466 Y114.404 E.08078
G1 X127.466 Y125.649 E.34551
G1 X130.095 Y125.649 E.08076
G1 X130.095 Y115.781 E.30319
M204 S10000
G1 X129.718 Y115.721 F42000
G1 F5857
M204 S6000
G1 X129.717 Y125.272 E.29345
G1 X128.024 Y125.272 E.05203
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G1 X127.843 Y125.272 E.00556
G1 X127.843 Y114.782 E.32231
G1 X128.024 Y114.782 E.00556
; Slow Down End
G1 F5857
G1 X129.718 Y114.786 E.05205
G1 X129.718 Y115.661 E.0269
M204 S10000
G1 X129.341 Y115.721 F42000
G1 F5857
M204 S6000
G1 X129.341 Y115.162 E.01718
G1 X128.22 Y115.16 E.03443
G1 X128.22 Y124.895 E.29912
G1 X129.34 Y124.895 E.03442
G1 X129.341 Y115.781 E.28002
M204 S10000
G1 X128.967 Y115.721 F42000
; LINE_WIDTH: 0.414575
G1 F5857
M204 S6000
G1 X128.967 Y115.536 E.00562
G1 X128.595 Y115.535 E.01126
G1 X128.595 Y124.52 E.27212
G1 X128.966 Y124.52 E.01125
G1 X128.967 Y115.781 E.26466
; WIPE_START
G1 F9686.403
G1 X128.966 Y117.781 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.545 Y114.148 Z13.4 F42000
G1 Z13
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5857
M204 S2000
G1 X132.069 Y113.672 E.0207
G1 X131.39 Y113.526
G1 X132.545 Y114.681 E.0502
G1 X132.545 Y115.215
G1 X131.111 Y113.78 E.06234
G1 X131.117 Y114.319
G1 X132.545 Y115.748 E.06207
G1 X132.545 Y116.281
G1 X131.117 Y114.853 E.06207
G1 X131.117 Y115.386
G1 X132.545 Y116.814 E.06207
G1 X132.545 Y117.347
G1 X131.117 Y115.919 E.06207
G1 X131.117 Y116.452
G1 X132.545 Y117.881 E.06207
G1 X132.545 Y118.414
G1 X131.117 Y116.985 E.06207
G1 X131.117 Y117.519
G1 X132.545 Y118.947 E.06207
G1 X132.545 Y119.48
G1 X131.117 Y118.052 E.06207
G1 X131.117 Y118.585
G1 X132.545 Y120.014 E.06207
G1 X132.545 Y120.547
G1 X131.117 Y119.118 E.06207
G1 X131.117 Y119.652
G1 X132.545 Y121.08 E.06207
G1 X132.545 Y121.613
G1 X131.116 Y120.185 E.06207
G1 X131.116 Y120.718
G1 X132.545 Y122.146 E.06207
G1 X132.545 Y122.68
G1 X131.116 Y121.251 E.06207
G1 X131.116 Y121.784
G1 X132.545 Y123.213 E.06207
G1 X132.545 Y123.746
G1 X131.116 Y122.318 E.06207
G1 X131.116 Y122.851
G1 X132.545 Y124.279 E.06207
G1 X132.545 Y124.813
G1 X131.116 Y123.384 E.06207
G1 X131.116 Y123.917
G1 X132.545 Y125.346 E.06207
G1 X132.545 Y125.879
G1 X131.116 Y124.451 E.06207
G1 X131.116 Y124.984
G1 X132.545 Y126.412 E.06207
G1 X132.545 Y126.946
G1 X131.116 Y125.517 E.06207
G1 X131.116 Y126.05
G1 X132.545 Y127.479 E.06207
G1 X132.545 Y128.012
G1 X131.124 Y126.591 E.06175
G1 X131.124 Y127.124
G1 X132.545 Y128.545 E.06175
G1 X132.545 Y129.078
G1 X132.102 Y128.636 E.01921
G1 X132.102 Y129.17
G1 X132.544 Y129.612 E.01921
G1 X132.544 Y130.145
G1 X132.102 Y129.703 E.01921
G1 X132.102 Y130.236
G1 X132.544 Y130.678 E.01921
G1 X132.544 Y131.211
G1 X132.102 Y130.769 E.01921
G1 X132.102 Y131.303
G1 X132.544 Y131.745 E.0192
G1 X132.544 Y132.278
G1 X132.102 Y131.836 E.0192
G1 X132.102 Y132.369
G1 X132.544 Y132.811 E.0192
G1 X132.544 Y133.344
G1 X132.102 Y132.902 E.0192
G1 X132.102 Y133.436
G1 X132.544 Y133.877 E.0192
G1 X132.544 Y134.411
G1 X132.102 Y133.969 E.0192
G1 X132.102 Y134.502
G1 X132.544 Y134.944 E.0192
G1 X132.544 Y135.477
G1 X132.102 Y135.035 E.01919
G1 X132.102 Y135.569
G1 X132.544 Y136.01 E.01919
G1 X132.544 Y136.544
G1 X132.102 Y136.102 E.01919
G1 X132.102 Y136.635
G1 X132.544 Y137.077 E.01919
G1 X132.544 Y137.61
G1 X132.102 Y137.168 E.01919
G1 X132.102 Y137.702
G1 X132.544 Y138.143 E.01919
G1 X132.544 Y138.676
G1 X132.102 Y138.235 E.01919
G1 X132.102 Y138.768
G1 X132.544 Y139.21 E.01919
G1 X132.544 Y139.743
G1 X132.102 Y139.301 E.01918
G1 X132.102 Y139.835
G1 X132.544 Y140.276 E.01918
G1 X132.544 Y140.809
G1 X132.102 Y140.368 E.01918
G1 X131.744 Y140.542
G1 X132.544 Y141.343 E.03477
G1 X132.544 Y141.876
G1 X131.703 Y141.035 E.03653
G1 X131.24 Y141.105
G1 X132.361 Y142.226 E.04871
G1 X131.96 Y142.359
G1 X131.124 Y141.522 E.03636
G1 X131.124 Y142.055
G1 X131.52 Y142.451 E.01721
; WIPE_START
G1 F9547.055
M204 S6000
G1 X131.124 Y142.055 E-.21278
G1 X131.124 Y141.522 E-.20264
G1 X131.765 Y142.163 E-.34458
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.4 I1.216 J.036 P1  F42000
G1 X132.173 Y128.566 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.148333
G1 F5857
M204 S6000
G1 X132.136 Y128.476 E.00083
G1 X131.684 Y128.025 E.00548
; WIPE_START
G1 F15000
G1 X132.136 Y128.476 E-.65975
G1 X132.173 Y128.566 E-.10025
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.4 I-1.217 J.029 P1  F42000
G1 X132.494 Y141.926 Z13.4
G1 Z13
G1 E.8 F1800
; LINE_WIDTH: 0.112005
G1 F5857
M204 S6000
G1 X132.523 Y142.12 E.0011
G1 X132.412 Y142.203 E.00078
; WIPE_START
G1 F15000
G1 X132.523 Y142.12 E-.3152
G1 X132.494 Y141.926 E-.4448
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.4 I.214 J-1.198 P1  F42000
G1 X124.651 Y140.524 Z13.4
G1 Z13
G1 E.8 F1800
; LINE_WIDTH: 0.598549
G1 F5857
M204 S6000
G1 X124.634 Y140.597 E.00342
; LINE_WIDTH: 0.564034
G1 X124.617 Y140.67 E.00321
; CHANGE_LAYER
; Z_HEIGHT: 13.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6908.284
G1 X124.634 Y140.597 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 66/75
; update layer progress
M73 L66
M991 S0 P65 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z13.4 I1.216 J.04 P1  F42000
G1 X125.084 Y126.84 Z13.4
G1 Z13.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5187
M204 S5000
G1 X128.535 Y126.84 E.10605
G1 X128.935 Y126.84 E.01229
G1 X129.335 Y126.84 E.01229
G1 F2049.099
G1 X129.335 Y126.881 E.00126
M106 S255
G1 F1800
G1 X129.335 Y127.25 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X129.335 Y127.65 E.01327
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X129.335 Y128.019 E.01134
M106 S201.45
G1 F2049.099
G1 X129.335 Y128.06 E.00126
G1 F5187
G1 X128.935 Y128.06 E.01229
G1 X128.535 Y128.06 E.01229
G1 X125.084 Y128.06 E.10605
G1 X125.084 Y128.019 E.00126
G1 X125.084 Y126.9 E.03438
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.084 Y126.865 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.055 Y134.428 Z13.6 F42000
G1 X125.188 Y140.81 Z13.6
G1 Z13.2
G1 E.8 F1800
G1 F5187
M204 S5000
G1 X125.188 Y140.769 E.00126
G1 X125.188 Y128.231 E.38526
G1 X125.188 Y128.19 E.00126
G1 X129.115 Y128.19 E.12068
G1 X129.515 Y128.19 E.01229
G1 X129.915 Y128.19 E.01229
G1 F2049.036
G1 X129.915 Y128.231 E.00126
M106 S255
G1 F1800
G1 X129.915 Y128.6 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
G1 X129.915 Y128.665 E.00216
G1 X130.251 Y128.665 E.01116
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X130.62 Y128.665 E.01134
M106 S201.45
G1 F4919.51
G1 X131.02 Y128.665 E.01229
G1 F5187
G1 X131.42 Y128.665 E.01229
G1 X131.949 Y128.665 E.01623
G1 X131.949 Y140.335 E.35859
G1 X131.42 Y140.335 E.01623
G1 X131.02 Y140.335 E.01229
G1 F4919.51
G1 X130.62 Y140.335 E.01229
M106 S255
G1 F1800
G1 X130.251 Y140.335 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
G1 X129.915 Y140.335 E.01116
G1 X129.915 Y140.4 E.00216
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X129.915 Y140.769 E.01134
M106 S201.45
G1 F2049.099
G1 X129.915 Y140.81 E.00126
G1 F5187
G1 X129.515 Y140.81 E.01229
G1 X129.115 Y140.81 E.01229
G1 X125.248 Y140.81 E.11884
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.188 Y140.769 E-.02761
G1 X125.188 Y138.842 E-.73239
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.335 Y140.981 Z13.6 F42000
G1 Z13.2
G1 E.8 F1800
M106 S255
M204 S5000
G1 X129.335 Y141.35 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X129.335 Y141.75 E.01327
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X129.335 Y142.119 E.01134
M106 S201.45
G1 F2049.099
G1 X129.335 Y142.16 E.00126
G1 F5187
G1 X128.935 Y142.16 E.01229
G1 X128.535 Y142.16 E.01229
G1 X125.084 Y142.16 E.10605
M73 P90 R2
G1 X125.084 Y142.119 E.00126
G1 X125.084 Y140.981 E.03497
G1 X125.084 Y140.94 E.00126
G1 X129.316 Y140.94 E.13005
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.335 Y141.35 E-.15596
G1 X129.335 Y141.75 E-.152
G1 X129.335 Y142.119 E-.14022
G1 X129.335 Y142.16 E-.01558
G1 X128.935 Y142.16 E-.152
G1 X128.556 Y142.16 E-.14424
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.6 I-.225 J1.196 P1  F42000
G1 X129.728 Y142.381 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1738.288
M204 S6000
G1 X129.728 Y142.132 E.00823
M106 S255
G1 F600
G1 X129.728 Y141.202 E.03086
M106 S201.45
G1 F2160
G1 X130.054 Y141.202 E.01084
G1 F2854.356
G1 X130.155 Y141.202 E.00333
G1 F5187
G1 X130.155 Y141.602 E.01327
G1 X130.155 Y142.002 E.01327
G1 X130.155 Y142.233 E.00765
G1 X130.144 Y142.351 E.00393
G1 X129.787 Y142.376 E.01187
; WIPE_START
G1 F8843.478
G1 X129.728 Y142.132 E-.09544
G1 X129.728 Y141.202 E-.35356
G1 X130.054 Y141.202 E-.1242
G1 X130.155 Y141.202 E-.03812
G1 X130.155 Y141.593 E-.14867
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.6 I1.155 J-.382 P1  F42000
G1 X125.014 Y126.041 Z13.6
G1 Z13.2
G1 E.8 F1800
G1 F5187
M204 S6000
G1 X125.014 Y114.01 E.39908
G1 X129.476 Y114.015 E.14803
G1 X129.741 Y114.027 E.00879
G1 X129.741 Y126.041 E.39854
G1 X125.074 Y126.041 E.15482
; WIPE_START
G1 F8843.478
G1 X125.064 Y124.041 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.6 I-.763 J.948 P1  F42000
G1 X129.728 Y127.798 Z13.6
G1 Z13.2
G1 E.8 F1800
M106 S255
G1 F600
M204 S6000
G1 X129.728 Y126.867 E.03086
M106 S201.45
G1 F2869.055
G1 X129.728 Y126.448 E.01392
G1 F5187
G1 X129.328 Y126.448 E.01327
G1 X128.928 Y126.448 E.01327
G1 X124.607 Y126.448 E.14333
G1 X124.607 Y113.603 E.42609
G1 X129.489 Y113.608 E.16195
G3 X130.129 Y113.649 I-.381 J11.021 E.02129
G1 X130.148 Y113.859 E.00699
G1 X130.154 Y126.998 E.43586
G1 X130.154 Y127.398 E.01327
G1 X130.155 Y127.798 E.01327
G1 F2854.356
G1 X130.054 Y127.798 E.00333
G1 F2160
G1 X129.788 Y127.798 E.00885
; WIPE_START
G1 X129.728 Y126.867 E-.3543
G1 X129.728 Y126.448 E-.15944
G1 X129.328 Y126.448 E-.152
G1 X129.079 Y126.448 E-.09426
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.926 Y133.77 Z13.6 F42000
G1 X124.287 Y142.744 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5187
M204 S5000
G3 X124.215 Y142.591 I.128 J-.153 E.00538
G1 X124.215 Y113.408 E.89672
G3 X124.402 Y113.211 I.197 J0 E.0092
G1 X129.501 Y113.216 E.15668
G3 X131.609 Y113.547 I-.048 J7.175 E.0658
G3 X132.006 Y113.809 I-.193 J.725 E.0149
G1 X132.005 Y142.198 E.87232
G1 X131.988 Y142.23 E.00111
G3 X131.306 Y142.55 I-.958 J-1.159 E.02339
G3 X129.27 Y142.789 I-2.169 J-9.673 E.06311
G1 X124.422 Y142.79 E.14894
G3 X124.338 Y142.775 I-.008 J-.199 E.00265
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.226 Y142.661 E-.06086
G1 X124.215 Y142.591 E-.02699
G1 X124.215 Y140.822 E-.67215
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


G1 X124.667 Y140.67 F42000
G1 Z13.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.520947
G1 F5187
M204 S6000
G1 X124.649 Y140.744 E.00296
G1 X124.65 Y142.356 E.06279
; LINE_WIDTH: 0.494924
G1 X124.698 Y142.38 E.00196
; LINE_WIDTH: 0.447333
G1 X124.745 Y142.404 E.00175
; LINE_WIDTH: 0.399741
G1 X124.793 Y142.427 E.00155
; LINE_WIDTH: 0.352149
G1 X124.84 Y142.451 E.00134
; LINE_WIDTH: 0.280651
G1 X124.888 Y142.475 E.00103
G1 X129.264 Y142.475 E.08478
; LINE_WIDTH: 0.277603
G1 X129.531 Y142.47 E.00511
; WIPE_START
G1 F15000
G1 X129.264 Y142.475 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.797 Y141.533 Z13.6 F42000
G1 Z13.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5187
M204 S2000
G1 X130.901 Y142.43 E.03895
G1 X130.377 Y142.42
G1 X131.797 Y141 E.06171
G1 X131.722 Y140.542
G1 X130.377 Y141.887 E.05844
; WIPE_START
G1 F9547.055
M204 S6000
G1 X131.722 Y140.542 E-.72266
G1 X131.738 Y140.639 E-.03734
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.816 Y141.982 Z13.6 F42000
G1 Z13.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.258009
G1 F5187
M204 S6000
G3 X131.29 Y142.358 I-6.056 J-7.91 E.01135
; WIPE_START
G1 F15000
G1 X131.816 Y141.982 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.6 I.224 J-1.196 P1  F42000
G1 X124.992 Y140.706 Z13.6
G1 Z13.2
G1 E.8 F1800
; LINE_WIDTH: 0.273338
G1 F5187
M204 S6000
G1 X124.955 Y140.683 E.00081
; LINE_WIDTH: 0.320053
G1 X124.919 Y140.66 E.00097
; LINE_WIDTH: 0.366768
G1 X124.883 Y140.637 E.00114
; LINE_WIDTH: 0.413483
G1 X124.846 Y140.614 E.0013
; LINE_WIDTH: 0.460198
G1 X124.81 Y140.591 E.00146
; LINE_WIDTH: 0.506913
G1 X124.774 Y140.568 E.00163
; LINE_WIDTH: 0.553628
G1 X124.737 Y140.545 E.00179
; LINE_WIDTH: 0.623617
G1 X124.701 Y140.522 E.00203
G1 X124.701 Y128.478 E.56989
; LINE_WIDTH: 0.606447
G1 X124.684 Y128.404 E.00349
; LINE_WIDTH: 0.57194
G1 X124.667 Y128.33 E.00328
; LINE_WIDTH: 0.520948
G1 X124.649 Y128.256 E.00296
G1 X124.649 Y126.644 E.06279
M204 S10000
G1 X124.992 Y128.294 F42000
; LINE_WIDTH: 0.273338
G1 F5187
M204 S6000
G1 X124.955 Y128.317 E.00081
; LINE_WIDTH: 0.320052
G1 X124.919 Y128.34 E.00097
; LINE_WIDTH: 0.366766
G1 X124.883 Y128.363 E.00114
; LINE_WIDTH: 0.413481
G1 X124.846 Y128.386 E.0013
; LINE_WIDTH: 0.460195
G1 X124.81 Y128.409 E.00146
; LINE_WIDTH: 0.50691
M73 P90 R1
G1 X124.774 Y128.432 E.00163
; LINE_WIDTH: 0.553624
G1 X124.737 Y128.455 E.00179
; LINE_WIDTH: 0.600339
G1 X124.701 Y128.478 E.00195
; WIPE_START
G1 F6458.346
G1 X124.737 Y128.455 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.328 Y125.437 Z13.6 F42000
G1 Z13.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5187
M204 S6000
G1 X126.328 Y125.693 E.00848
G1 X125.362 Y125.693 E.03203
G1 X125.362 Y125.285 E.01351
G2 X125.951 Y123.414 I-1.191 J-1.404 E.06864
G2 X125.362 Y122.624 I-5.349 J3.376 E.03273
G1 X125.362 Y120.044 E.08558
G2 X125.951 Y118.173 I-1.191 J-1.404 E.06864
G2 X125.362 Y117.383 I-5.349 J3.376 E.03273
G1 X125.362 Y114.803 E.08558
G1 X125.74 Y114.359 E.01932
G1 X126.328 Y114.36 E.01951
G1 X126.328 Y115.4 E.0345
M204 S10000
G1 X129.349 Y115.721 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F5187
M204 S6000
G1 X129.349 Y114.409 E.04031
G1 X126.72 Y114.404 E.08078
G1 X126.72 Y125.649 E.34551
G1 X129.349 Y125.649 E.08078
G1 X129.349 Y115.781 E.30319
M204 S10000
G1 X128.972 Y125.272 F42000
G1 F5187
M204 S6000
G1 X128.972 Y114.786 E.3222
G1 X127.097 Y114.782 E.05761
G1 X127.097 Y125.272 E.32231
G1 X128.912 Y125.272 E.05577
M204 S10000
G1 X128.595 Y124.895 F42000
G1 F5187
M204 S6000
G1 X128.595 Y115.162 E.29905
G1 X127.474 Y115.16 E.03444
G1 X127.474 Y124.895 E.29912
G1 X128.535 Y124.895 E.03259
M204 S10000
G1 X128.22 Y124.52 F42000
; LINE_WIDTH: 0.41477
G1 F5187
M204 S6000
G1 X128.22 Y115.536 E.27224
G1 X127.848 Y115.535 E.01127
G1 X127.848 Y124.52 E.27226
G1 X128.16 Y124.52 E.00945
; WIPE_START
G1 F9681.324
G1 X127.848 Y124.52 E-.11851
G1 X127.848 Y122.832 E-.64149
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.798 Y127.668 Z13.6 F42000
G1 Z13.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5187
M204 S2000
G1 X131.008 Y128.458 E.03432
G1 X130.957 Y127.976
G1 X131.798 Y127.135 E.03657
G1 X131.798 Y126.601
G1 X130.505 Y127.895 E.0562
G1 X130.377 Y127.489
G1 X131.798 Y126.068 E.06175
G1 X131.798 Y125.535
G1 X130.377 Y126.956 E.06176
G1 X130.37 Y126.429
G1 X131.798 Y125.001 E.06205
G1 X131.798 Y124.468
G1 X130.37 Y125.896 E.06205
G1 X130.37 Y125.363
G1 X131.798 Y123.935 E.06205
G1 X131.798 Y123.402
G1 X130.37 Y124.83 E.06205
G1 X130.37 Y124.296
G1 X131.798 Y122.868 E.06205
G1 X131.798 Y122.335
G1 X130.37 Y123.763 E.06205
G1 X130.37 Y123.23
G1 X131.799 Y121.802 E.06206
G1 X131.799 Y121.268
G1 X130.37 Y122.697 E.06206
G1 X130.37 Y122.163
G1 X131.799 Y120.735 E.06206
G1 X131.799 Y120.202
G1 X130.37 Y121.63 E.06206
G1 X130.37 Y121.097
G1 X131.799 Y119.669 E.06206
G1 X131.799 Y119.135
G1 X130.37 Y120.564 E.06206
G1 X130.37 Y120.03
G1 X131.799 Y118.602 E.06206
G1 X131.799 Y118.069
G1 X130.37 Y119.497 E.06207
G1 X130.37 Y118.964
G1 X131.799 Y117.535 E.06207
G1 X131.799 Y117.002
G1 X130.37 Y118.43 E.06207
G1 X130.37 Y117.897
G1 X131.799 Y116.469 E.06207
G1 X131.799 Y115.936
G1 X130.37 Y117.364 E.06207
G1 X130.37 Y116.831
G1 X131.799 Y115.402 E.06207
G1 X131.799 Y114.869
G1 X130.37 Y116.297 E.06207
G1 X130.37 Y115.764
G1 X131.799 Y114.336 E.06208
G1 X131.756 Y113.845
G1 X130.37 Y115.231 E.06021
G1 X130.37 Y114.698
G1 X131.38 Y113.688 E.04387
G1 X130.954 Y113.581
G1 X130.37 Y114.164 E.02535
M204 S10000
G1 X130.52 Y113.489 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0993546
G1 F5187
M204 S6000
G1 X130.354 Y113.914 E.0021
; WIPE_START
G1 F15000
G1 X130.52 Y113.489 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.914 Y120.95 Z13.6 F42000
G1 X124.701 Y140.522 Z13.6
G1 Z13.2
G1 E.8 F1800
; LINE_WIDTH: 0.60644
G1 F5187
M204 S6000
G1 X124.684 Y140.596 E.00349
; LINE_WIDTH: 0.571928
G1 X124.667 Y140.67 E.00328
; CHANGE_LAYER
; Z_HEIGHT: 13.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6805.194
G1 X124.684 Y140.596 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 67/75
; update layer progress
M73 L67
M991 S0 P66 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z13.6 I1.216 J.04 P1  F42000
G1 X125.138 Y126.84 Z13.6
G1 Z13.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4602
M204 S5000
G1 X127.789 Y126.84 E.08147
G1 X128.189 Y126.84 E.01229
G1 X128.589 Y126.84 E.01229
G1 F2049.099
G1 X128.589 Y126.881 E.00126
M106 S255
G1 F1800
G1 X128.589 Y127.25 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X128.589 Y127.65 E.01327
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X128.589 Y128.019 E.01134
M106 S201.45
G1 F2049.099
G1 X128.589 Y128.06 E.00126
G1 F4602
G1 X128.189 Y128.06 E.01229
G1 X127.789 Y128.06 E.01229
G1 X125.138 Y128.06 E.08147
G1 X125.138 Y128.019 E.00126
G1 X125.138 Y126.9 E.03438
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.137 Y126.855 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.148 Y134.423 Z13.8 F42000
G1 X125.138 Y142.16 Z13.8
G1 Z13.4
G1 E.8 F1800
G1 F4602
M204 S5000
G1 X125.138 Y142.119 E.00126
G1 X125.138 Y140.981 E.03497
G1 X125.138 Y140.94 E.00126
G1 X127.789 Y140.94 E.08147
G1 X128.189 Y140.94 E.01229
G1 X128.589 Y140.94 E.01229
G1 F2049.036
G1 X128.589 Y140.981 E.00126
M106 S255
G1 F1800
G1 X128.589 Y141.35 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X128.589 Y141.75 E.01327
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X128.589 Y142.119 E.01134
M106 S201.45
G1 F2049.099
G1 X128.589 Y142.16 E.00126
G1 F4602
G1 X128.189 Y142.16 E.01229
G1 X127.789 Y142.16 E.01229
G1 X125.198 Y142.16 E.07963
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.138 Y142.119 E-.02761
G1 X125.138 Y140.981 E-.43244
G1 X125.138 Y140.94 E-.01558
G1 X125.886 Y140.94 E-.28437
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.8 I-.09 J1.214 P1  F42000
G1 X129.408 Y141.202 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4602
M204 S6000
G1 X129.408 Y141.833 E.02092
G1 X129.408 Y142.233 E.01327
G1 X129.351 Y142.233 E.0019
G1 X129.317 Y142.359 E.00433
G1 F4239.557
G1 X128.981 Y142.382 E.01118
G1 F1744.532
G1 X128.981 Y142.132 E.00827
M106 S255
G1 F600
G1 X128.981 Y141.202 E.03086
M106 S201.45
G1 F2160
G1 X129.308 Y141.202 E.01084
G1 F2427.459
G1 X129.348 Y141.202 E.00134
; WIPE_START
G1 X129.408 Y141.833 E-.24077
G1 X129.408 Y142.233 E-.152
G1 X129.351 Y142.233 E-.02174
G1 X129.317 Y142.359 E-.04962
G1 X128.981 Y142.382 E-.12804
G1 X128.981 Y142.132 E-.09474
G1 X128.981 Y141.94 E-.0731
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.8 I1.217 J.001 P1  F42000
G1 X128.995 Y126.041 Z13.8
G1 Z13.4
G1 E.8 F1800
G1 F4602
M204 S6000
G1 X125.06 Y126.041 E.13053
G1 X125.06 Y114.01 E.39908
G1 X128.73 Y114.015 E.12177
G1 X128.994 Y114.027 E.00877
G1 X128.994 Y125.981 E.39654
; WIPE_START
G1 F8843.478
G1 X126.995 Y126.011 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.8 I-.724 J.978 P1  F42000
G1 X129.408 Y127.798 Z13.8
G1 Z13.4
G1 E.8 F1800
G1 F2854.356
M204 S6000
G1 X129.308 Y127.798 E.00333
G1 F2160
G1 X128.981 Y127.798 E.01084
M106 S255
G1 F600
G1 X128.981 Y126.867 E.03086
M106 S201.45
M73 P91 R1
G1 F2869.055
G1 X128.981 Y126.448 E.01392
G1 F4602
G1 X128.581 Y126.448 E.01327
G1 X128.181 Y126.448 E.01327
G1 X124.652 Y126.448 E.11705
G1 X124.652 Y113.603 E.42608
G1 X128.743 Y113.608 E.13569
G3 X129.383 Y113.649 I-.383 J11.021 E.02126
G1 X129.402 Y113.859 E.00702
G1 X129.408 Y127.738 E.46038
; WIPE_START
G1 F8843.478
G1 X129.308 Y127.798 E-.04441
G1 X128.981 Y127.798 E-.1242
G1 X128.981 Y126.867 E-.35357
G1 X128.981 Y126.448 E-.15944
G1 X128.775 Y126.448 E-.07839
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.8 I-1.217 J.033 P1  F42000
G1 X129.169 Y140.81 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2049.099
M204 S5000
G1 X129.169 Y140.769 E.00126
M106 S255
G1 F1800
G1 X129.169 Y140.4 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
G1 X129.169 Y140.335 E.00216
G1 X129.505 Y140.335 E.01116
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X129.874 Y140.335 E.01134
M106 S201.45
G1 F4602
G1 X130.274 Y140.335 E.01229
G1 X130.674 Y140.335 E.01229
G1 X131.26 Y140.335 E.018
G1 X131.257 Y142.205 E.05745
G3 X130.745 Y142.494 I-.711 J-.659 E.01835
G3 X128.522 Y142.789 I-2.184 J-7.944 E.06911
G1 X124.468 Y142.79 E.12457
G3 X124.26 Y142.591 I-.008 J-.199 E.00987
G1 X124.26 Y113.408 E.89672
G3 X124.447 Y113.211 I.197 J0 E.0092
G1 X128.756 Y113.216 E.13238
G3 X130.863 Y113.548 I-.049 J7.174 E.06579
G3 X131.26 Y113.809 I-.194 J.725 E.01487
G1 X131.26 Y128.665 E.45647
G1 X130.674 Y128.665 E.01801
G1 X130.274 Y128.665 E.01229
G1 X129.874 Y128.665 E.01229
M106 S255
G1 F1800
G1 X129.505 Y128.665 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
G1 X129.169 Y128.665 E.01116
G1 X129.169 Y128.6 E.00216
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X129.169 Y128.231 E.01134
M106 S201.45
G1 F2049.036
G1 X129.169 Y128.19 E.00126
G1 F4602
G1 X128.769 Y128.19 E.01229
G1 X128.369 Y128.19 E.01229
G1 X125.241 Y128.19 E.0961
G1 X125.241 Y128.231 E.00126
G1 X125.241 Y140.769 E.38526
G1 X125.241 Y140.81 E.00126
G1 X129.109 Y140.81 E.11884
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.169 Y140.769 E-.02761
G1 X129.169 Y140.4 E-.14022
G1 X129.169 Y140.335 E-.0247
G1 X129.505 Y140.335 E-.12784
G1 X129.874 Y140.335 E-.14022
G1 X130.274 Y140.335 E-.152
G1 X130.662 Y140.335 E-.14741
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


G1 X130.677 Y140.542 F42000
G1 Z13.4
G1 E.8 F1800
; FEATURE: Top surface
G1 F4602
M204 S2000
G1 X131.052 Y140.917 E.01629
G1 X131.051 Y141.45
G1 X130.21 Y140.609 E.03655
G1 X130.173 Y141.105
G1 X131.051 Y141.983 E.03813
G1 X130.792 Y142.257
G1 X129.64 Y141.105 E.05004
G1 X129.631 Y141.629
G1 X130.382 Y142.38 E.03264
M204 S10000
G1 X129.983 Y141.086 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0662933
G1 F4602
M204 S6000
G1 X129.975 Y141.103 E.00003
; LINE_WIDTH: 0.111036
G1 X129.968 Y141.12 E.0001
G1 X130.087 Y141.192 E.00077
; WIPE_START
G1 F15000
G1 X129.968 Y141.12 E-.67242
G1 X129.975 Y141.103 E-.08758
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.07 Y141.486 Z13.8 F42000
G1 Z13.4
G1 E.8 F1800
; LINE_WIDTH: 0.120145
G1 F4602
M204 S6000
G1 X130.946 Y141.611 E.00111
; WIPE_START
G1 F15000
G1 X131.07 Y141.486 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.785 Y142.471 Z13.8 F42000
G1 Z13.4
G1 E.8 F1800
; LINE_WIDTH: 0.278121
G1 F4602
M204 S6000
G1 X128.518 Y142.475 E.00511
; LINE_WIDTH: 0.280715
G1 X124.942 Y142.475 E.06931
G1 X124.894 Y142.451 E.00103
; LINE_WIDTH: 0.352152
G1 X124.846 Y142.427 E.00134
; LINE_WIDTH: 0.399743
G1 X124.799 Y142.404 E.00155
; LINE_WIDTH: 0.447334
G1 X124.751 Y142.38 E.00175
; LINE_WIDTH: 0.494925
G1 X124.704 Y142.356 E.00196
; LINE_WIDTH: 0.528825
G1 X124.699 Y140.744 E.06383
G1 X124.716 Y140.669 E.00304
; LINE_WIDTH: 0.57982
G1 X124.734 Y140.595 E.00335
; LINE_WIDTH: 0.614326
G1 X124.751 Y140.52 E.00357
M204 S10000
G1 X124.788 Y140.543 F42000
; LINE_WIDTH: 0.56003
G1 F4602
M204 S6000
G1 X124.824 Y140.566 E.00183
; LINE_WIDTH: 0.51233
G1 X124.861 Y140.59 E.00166
; LINE_WIDTH: 0.46463
G1 X124.898 Y140.613 E.0015
; LINE_WIDTH: 0.41693
G1 X124.935 Y140.636 E.00133
; LINE_WIDTH: 0.36923
G1 X124.972 Y140.659 E.00116
; LINE_WIDTH: 0.32153
G1 X125.008 Y140.683 E.00099
; LINE_WIDTH: 0.27383
G1 X125.045 Y140.706 E.00082
M204 S10000
G1 X124.788 Y140.543 F42000
; LINE_WIDTH: 0.631504
G1 F4602
M204 S6000
G1 X124.751 Y140.52 E.00209
G1 X124.751 Y128.48 E.57745
; LINE_WIDTH: 0.60773
G1 X124.788 Y128.457 E.002
; LINE_WIDTH: 0.56003
G1 X124.824 Y128.434 E.00183
; LINE_WIDTH: 0.51233
G1 X124.861 Y128.41 E.00166
; LINE_WIDTH: 0.46463
G1 X124.898 Y128.387 E.0015
; LINE_WIDTH: 0.41693
G1 X124.935 Y128.364 E.00133
; LINE_WIDTH: 0.36923
G1 X124.972 Y128.341 E.00116
; LINE_WIDTH: 0.32153
G1 X125.008 Y128.317 E.00099
; LINE_WIDTH: 0.27383
G1 X125.045 Y128.294 E.00082
M204 S10000
G1 X124.734 Y128.405 F42000
; LINE_WIDTH: 0.614344
G1 F4602
M204 S6000
G1 X124.751 Y128.48 E.00357
M204 S10000
G1 X124.734 Y128.405 F42000
; LINE_WIDTH: 0.57983
G1 F4602
M204 S6000
G1 X124.716 Y128.331 E.00335
; LINE_WIDTH: 0.528844
G1 X124.699 Y128.256 E.00304
G1 X124.699 Y126.644 E.06383
; WIPE_START
G1 F7408.574
G1 X124.699 Y128.256 E-.72549
G1 X124.716 Y128.331 E-.03451
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.007 Y121.05 Z13.8 F42000
G1 X128.602 Y115.982 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F4602
M204 S6000
G1 X128.602 Y114.409 E.04831
G1 X125.452 Y114.403 E.09681
G1 X125.452 Y125.649 E.34555
G1 X128.602 Y125.649 E.09681
G1 X128.602 Y116.042 E.29519
M204 S10000
G1 X128.225 Y125.272 F42000
G1 F4602
M204 S6000
G1 X128.225 Y114.786 E.3222
G1 X125.829 Y114.781 E.07364
G1 X125.829 Y125.272 E.32235
G1 X128.165 Y125.272 E.0718
M204 S10000
G1 X127.848 Y124.895 F42000
G1 F4602
M204 S6000
G1 X127.848 Y115.162 E.29905
G1 X126.206 Y115.159 E.05047
G1 X126.206 Y124.895 E.29915
G1 X127.788 Y124.895 E.04863
M204 S10000
G1 X127.471 Y124.518 F42000
G1 F4602
M204 S6000
G1 X127.471 Y115.538 E.2759
G1 X126.583 Y115.536 E.0273
G1 X126.583 Y124.518 E.27596
G1 X127.411 Y124.518 E.02545
M204 S10000
G1 X127.027 Y124.073 F42000
; LINE_WIDTH: 0.55426
G1 F4602
M204 S6000
G1 X127.027 Y116.042 E.33467
; WIPE_START
G1 F7040.326
G1 X127.027 Y118.042 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.428 Y113.631 Z13.8 F42000
G1 Z13.4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F4602
M204 S2000
G1 X131.053 Y114.255 E.02713
G1 X131.053 Y114.788
G1 X129.772 Y113.508 E.05565
G1 X129.624 Y113.893
G1 X131.053 Y115.322 E.06208
G1 X131.053 Y115.855
G1 X129.624 Y114.426 E.06208
G1 X129.624 Y114.96
G1 X131.053 Y116.388 E.06208
G1 X131.053 Y116.921
G1 X129.624 Y115.493 E.06208
G1 X129.624 Y116.026
G1 X131.053 Y117.455 E.06208
G1 X131.053 Y117.988
G1 X129.624 Y116.559 E.06208
G1 X129.624 Y117.093
G1 X131.053 Y118.521 E.06208
G1 X131.053 Y119.054
G1 X129.624 Y117.626 E.06208
G1 X129.624 Y118.159
G1 X131.053 Y119.588 E.06208
G1 X131.053 Y120.121
G1 X129.624 Y118.692 E.06208
G1 X129.624 Y119.226
G1 X131.053 Y120.654 E.06208
G1 X131.053 Y121.187
G1 X129.624 Y119.759 E.06208
G1 X129.624 Y120.292
G1 X131.053 Y121.721 E.06208
G1 X131.053 Y122.254
G1 X129.624 Y120.825 E.06208
G1 X129.624 Y121.359
G1 X131.053 Y122.787 E.06208
G1 X131.053 Y123.32
G1 X129.624 Y121.892 E.06208
G1 X129.624 Y122.425
G1 X131.053 Y123.854 E.06208
G1 X131.053 Y124.387
G1 X129.624 Y122.958 E.06208
G1 X129.624 Y123.492
G1 X131.053 Y124.92 E.06208
G1 X131.053 Y125.453
G1 X129.624 Y124.025 E.06208
G1 X129.624 Y124.558
G1 X131.053 Y125.987 E.06208
G1 X131.053 Y126.52
G1 X129.624 Y125.091 E.06208
G1 X129.624 Y125.625
G1 X131.053 Y127.053 E.06208
G1 X131.053 Y127.587
G1 X129.624 Y126.158 E.06208
G1 X129.631 Y126.698
G1 X131.053 Y128.12 E.06179
G1 X130.857 Y128.458
G1 X129.631 Y127.231 E.05329
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.857 Y128.458 E-.65909
G1 X130.99 Y128.228 E-.10091
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.8 I1.217 J.007 P1  F42000
G1 X131.071 Y113.923 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.120865
G1 F4602
M204 S6000
G1 X130.904 Y113.8 E.00132
; LINE_WIDTH: 0.0935277
G1 X130.862 Y113.772 E.00021
; CHANGE_LAYER
; Z_HEIGHT: 13.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15000
G1 X130.904 Y113.8 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 68/75
; update layer progress
M73 L68
M991 S0 P67 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z13.8 I-1.115 J-.488 P1  F42000
G1 X125.191 Y126.84 Z13.8
G1 Z13.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4117
M204 S5000
G1 X127.043 Y126.84 E.05689
G1 X127.443 Y126.84 E.01229
G1 X127.843 Y126.84 E.01229
G1 F2049.099
G1 X127.843 Y126.881 E.00126
M106 S255
G1 F1800
G1 X127.843 Y127.25 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X127.843 Y127.65 E.01327
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X127.843 Y128.019 E.01134
M106 S201.45
G1 F2049.099
G1 X127.843 Y128.06 E.00126
G1 F4117
G1 X127.443 Y128.06 E.01229
G1 X127.043 Y128.06 E.01229
G1 X125.191 Y128.06 E.05689
G1 X125.191 Y128.019 E.00126
G1 X125.191 Y126.9 E.03438
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.043 Y126.84 E-.70391
G1 X127.19 Y126.84 E-.0561
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.203 Y134.408 Z14 F42000
G1 X125.191 Y142.16 Z14
G1 Z13.6
G1 E.8 F1800
G1 F4117
M204 S5000
G1 X125.191 Y142.119 E.00126
G1 X125.191 Y140.981 E.03497
G1 X125.191 Y140.94 E.00126
G1 X127.043 Y140.94 E.05689
G1 X127.443 Y140.94 E.01229
G1 X127.843 Y140.94 E.01229
G1 F2049.036
G1 X127.843 Y140.981 E.00126
M106 S255
G1 F1800
G1 X127.843 Y141.35 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X127.843 Y141.75 E.01327
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X127.843 Y142.119 E.01134
M106 S201.45
G1 F2049.099
G1 X127.843 Y142.16 E.00126
G1 F4117
G1 X127.443 Y142.16 E.01229
G1 X127.043 Y142.16 E.01229
G1 X125.251 Y142.16 E.05505
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.191 Y142.119 E-.02761
G1 X125.191 Y140.981 E-.43244
G1 X125.191 Y140.94 E-.01558
G1 X125.94 Y140.94 E-.28437
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14 I-.117 J1.211 P1  F42000
G1 X128.662 Y141.202 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4117
M204 S6000
G1 X128.662 Y141.833 E.02092
G1 X128.662 Y142.233 E.01327
G1 X128.613 Y142.233 E.00163
G1 X128.583 Y142.356 E.00421
G1 X128.235 Y142.383 E.01158
G1 F1752.702
G1 X128.235 Y142.132 E.00832
M106 S255
G1 F600
G1 X128.235 Y141.202 E.03086
M106 S201.45
G1 F2160
G1 X128.562 Y141.202 E.01084
G1 F2427.391
G1 X128.602 Y141.202 E.00134
; WIPE_START
G1 X128.662 Y141.833 E-.24077
G1 X128.662 Y142.233 E-.152
G1 X128.613 Y142.233 E-.01866
G1 X128.583 Y142.356 E-.04821
G1 X128.235 Y142.383 E-.13266
G1 X128.235 Y142.132 E-.09527
G1 X128.235 Y141.942 E-.07244
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14 I1.217 J.001 P1  F42000
G1 X128.248 Y126.041 Z14
G1 Z13.6
G1 E.8 F1800
G1 F4117
M204 S6000
G1 X125.106 Y126.041 E.10422
G1 X125.107 Y114.009 E.39911
G1 X127.689 Y114.009 E.08566
G3 X128.248 Y114.027 I-.054 J10.817 E.01855
G1 X128.248 Y125.981 E.39654
; WIPE_START
G1 F8843.478
G1 X126.248 Y126.019 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14 I-.722 J.98 P1  F42000
G1 X128.662 Y127.798 Z14
G1 Z13.6
G1 E.8 F1800
G1 F2854.282
M204 S6000
G1 X128.562 Y127.798 E.00333
G1 F2160
G1 X128.235 Y127.798 E.01084
M106 S255
G1 F600
G1 X128.235 Y126.867 E.03086
M106 S201.45
G1 F2869.055
G1 X128.235 Y126.448 E.01392
G1 F4117
G1 X127.835 Y126.448 E.01327
G1 X127.435 Y126.448 E.01327
G1 X124.699 Y126.448 E.09074
G1 X124.7 Y113.602 E.42612
G1 X127.693 Y113.602 E.0993
G3 X128.636 Y113.649 I-.238 J14.423 E.03131
G1 X128.655 Y113.86 E.00704
G1 X128.662 Y127.738 E.46035
; WIPE_START
G1 F8843.478
G1 X128.562 Y127.798 E-.0444
G1 X128.235 Y127.798 E-.1242
M73 P92 R1
G1 X128.235 Y126.867 E-.35357
G1 X128.235 Y126.448 E-.15944
G1 X128.028 Y126.448 E-.07839
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14 I-1.217 J.033 P1  F42000
G1 X128.422 Y140.81 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2049.099
M204 S5000
G1 X128.422 Y140.769 E.00126
M106 S255
G1 F1800
G1 X128.422 Y140.4 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
G1 X128.422 Y140.335 E.00216
G1 X128.759 Y140.335 E.01116
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X129.128 Y140.335 E.01134
M106 S201.45
G1 F4117
G1 X129.528 Y140.335 E.01229
G1 X129.928 Y140.335 E.01229
G1 X130.513 Y140.335 E.018
G1 X130.512 Y142.195 E.05716
G1 X130.499 Y142.225 E.001
G3 X129.744 Y142.568 I-1.009 J-1.219 E.02579
G3 X127.775 Y142.789 I-1.988 J-8.82 E.061
G1 X124.485 Y142.788 E.10109
G3 X124.306 Y142.589 I.024 J-.202 E.00896
G1 X124.308 Y113.381 E.89749
G3 X124.512 Y113.21 I.198 J.029 E.00897
G1 X127.697 Y113.21 E.09785
G3 X129.961 Y113.494 I.099 J8.394 E.07033
G3 X130.512 Y113.797 I-.273 J1.149 E.01956
G1 X130.514 Y128.665 E.45686
G1 X129.928 Y128.665 E.01801
G1 X129.528 Y128.665 E.01229
G1 X129.128 Y128.665 E.01229
M106 S255
G1 F1800
G1 X128.759 Y128.665 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
G1 X128.422 Y128.665 E.01116
G1 X128.422 Y128.6 E.00216
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X128.422 Y128.231 E.01134
M106 S201.45
G1 F2049.036
G1 X128.422 Y128.19 E.00126
G1 F4117
G1 X128.022 Y128.19 E.01229
G1 X127.622 Y128.19 E.01229
G1 X125.295 Y128.19 E.07152
G1 X125.295 Y128.231 E.00126
G1 X125.295 Y140.769 E.38526
G1 X125.295 Y140.81 E.00126
G1 X128.362 Y140.81 E.09425
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.422 Y140.769 E-.02761
G1 X128.422 Y140.4 E-.14022
G1 X128.422 Y140.335 E-.0247
G1 X128.759 Y140.335 E-.12784
G1 X129.128 Y140.335 E-.14022
G1 X129.528 Y140.335 E-.152
G1 X129.915 Y140.335 E-.14741
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


G1 X130.305 Y141.426 F42000
G1 Z13.6
G1 E.8 F1800
; FEATURE: Top surface
G1 F4117
M204 S2000
G1 X129.278 Y142.453 E.04466
G1 X128.884 Y142.313
G1 X130.306 Y140.892 E.06177
G1 X130.122 Y140.542
G1 X128.884 Y141.78 E.05379
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.122 Y140.542 E-.66519
G1 X130.238 Y140.763 E-.09481
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14 I-1.214 J.084 P1  F42000
G1 X130.324 Y141.999 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0975316
G1 F4117
M204 S6000
G1 X129.639 Y142.382 E.00349
M204 S10000
G1 X130.324 Y141.94 F42000
; LINE_WIDTH: 0.33942
G1 F4117
M204 S6000
G1 X130.086 Y142.11 E.00705
; LINE_WIDTH: 0.309816
G1 X129.665 Y142.393 E.01104
M204 S10000
G1 X128.039 Y142.471 F42000
; LINE_WIDTH: 0.279748
G1 F4117
M204 S6000
G3 X124.995 Y142.474 I-1.633 J-122.754 E.05873
G1 X124.948 Y142.45 E.00102
; LINE_WIDTH: 0.349708
G1 X124.901 Y142.427 E.00132
; LINE_WIDTH: 0.396883
G1 X124.854 Y142.403 E.00152
; LINE_WIDTH: 0.444058
G1 X124.806 Y142.38 E.00172
; LINE_WIDTH: 0.491233
G1 X124.759 Y142.356 E.00193
; LINE_WIDTH: 0.525375
G1 X124.749 Y142.345 E.00059
; LINE_WIDTH: 0.536697
G1 X124.749 Y140.744 E.06444
G1 X124.766 Y140.669 E.00311
; LINE_WIDTH: 0.587601
G1 X124.783 Y140.593 E.00343
; LINE_WIDTH: 0.622106
G1 X124.8 Y140.518 E.00365
M204 S10000
G1 X124.838 Y140.542 F42000
; LINE_WIDTH: 0.566348
G1 F4117
M204 S6000
G1 X124.875 Y140.565 E.00188
; LINE_WIDTH: 0.517673
G1 X124.912 Y140.588 E.0017
; LINE_WIDTH: 0.468998
G1 X124.95 Y140.612 E.00153
; LINE_WIDTH: 0.420323
G1 X124.987 Y140.635 E.00135
; LINE_WIDTH: 0.371648
G1 X125.024 Y140.659 E.00118
; LINE_WIDTH: 0.322973
G1 X125.061 Y140.682 E.001
; LINE_WIDTH: 0.274298
G1 X125.099 Y140.706 E.00083
M204 S10000
G1 X124.838 Y140.542 F42000
; LINE_WIDTH: 0.638922
G1 F4117
M204 S6000
G1 X124.8 Y140.518 E.00214
G1 X124.801 Y128.482 E.58456
; LINE_WIDTH: 0.621399
G1 X124.784 Y128.407 E.00364
; LINE_WIDTH: 0.586887
G1 X124.766 Y128.331 E.00342
; LINE_WIDTH: 0.535875
G1 X124.749 Y128.256 E.0031
G1 X124.749 Y126.644 E.06475
M204 S10000
G1 X125.099 Y128.294 F42000
; LINE_WIDTH: 0.274254
G1 F4117
M204 S6000
G1 X125.061 Y128.318 E.00083
; LINE_WIDTH: 0.322841
G1 X125.024 Y128.341 E.001
; LINE_WIDTH: 0.371428
G1 X124.987 Y128.365 E.00118
; LINE_WIDTH: 0.420016
G1 X124.95 Y128.388 E.00135
; LINE_WIDTH: 0.468603
G1 X124.913 Y128.412 E.00153
; LINE_WIDTH: 0.51719
G1 X124.875 Y128.435 E.0017
; LINE_WIDTH: 0.565777
G1 X124.838 Y128.458 E.00187
; LINE_WIDTH: 0.614365
G1 X124.801 Y128.482 E.00205
; WIPE_START
G1 F6299.826
G1 X124.838 Y128.458 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.677 Y124.47 Z14 F42000
G1 Z13.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51498
G1 F4117
M204 S6000
G1 X126.677 Y115.64 E.33966
M204 S10000
G1 X127.102 Y124.895 F42000
; LINE_WIDTH: 0.41999
G1 F4117
M204 S6000
G1 X127.102 Y115.156 E.29925
G1 X126.253 Y115.155 E.02608
G1 X126.252 Y124.895 E.29925
G1 X127.042 Y124.895 E.02426
M204 S10000
G1 X127.479 Y125.272 F42000
G1 F4117
M204 S6000
G1 X127.479 Y114.779 E.32242
G1 X125.876 Y114.778 E.04925
G1 X125.875 Y125.272 E.32242
G1 X127.419 Y125.272 E.04743
M204 S10000
G1 X127.856 Y125.649 F42000
G1 F4117
M204 S6000
G1 X127.856 Y114.407 E.34543
G1 X125.499 Y114.401 E.07243
G1 X125.498 Y125.649 E.3456
G1 X127.796 Y125.649 E.0706
; WIPE_START
G1 F9547.299
G1 X125.796 Y125.649 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14 I-.683 J1.008 P1  F42000
G1 X129.942 Y128.458 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F4117
M204 S2000
G1 X130.306 Y128.093 E.01583
G1 X130.306 Y127.56
G1 X129.464 Y128.402 E.0366
G1 X129.438 Y127.895
G1 X130.306 Y127.027 E.03771
G1 X130.306 Y126.494
G1 X128.905 Y127.895 E.06088
G1 X128.884 Y127.382
G1 X130.306 Y125.96 E.06179
G1 X130.306 Y125.427
G1 X128.884 Y126.849 E.06179
G1 X128.878 Y126.322
G1 X130.306 Y124.894 E.06208
G1 X130.306 Y124.361
G1 X128.878 Y125.789 E.06208
G1 X128.878 Y125.256
G1 X130.306 Y123.827 E.06208
G1 X130.306 Y123.294
G1 X128.878 Y124.723 E.06208
G1 X128.878 Y124.189
G1 X130.306 Y122.761 E.06208
G1 X130.306 Y122.228
G1 X128.878 Y123.656 E.06208
G1 X128.878 Y123.123
G1 X130.306 Y121.694 E.06208
G1 X130.306 Y121.161
G1 X128.878 Y122.59 E.06208
G1 X128.878 Y122.056
G1 X130.306 Y120.628 E.06208
G1 X130.306 Y120.095
G1 X128.878 Y121.523 E.06208
G1 X128.878 Y120.99
G1 X130.306 Y119.561 E.06208
G1 X130.306 Y119.028
G1 X128.878 Y120.457 E.06208
G1 X128.878 Y119.923
G1 X130.306 Y118.495 E.06208
G1 X130.306 Y117.961
G1 X128.878 Y119.39 E.06208
G1 X128.878 Y118.857
G1 X130.306 Y117.428 E.06208
G1 X130.306 Y116.895
G1 X128.878 Y118.324 E.06208
G1 X128.878 Y117.79
G1 X130.306 Y116.362 E.06208
G1 X130.306 Y115.828
G1 X128.878 Y117.257 E.06208
G1 X128.878 Y116.724
G1 X130.306 Y115.295 E.06208
G1 X130.306 Y114.762
G1 X128.878 Y116.19 E.06208
G1 X128.878 Y115.657
G1 X130.306 Y114.229 E.06208
G1 X130.193 Y113.808
G1 X128.878 Y115.124 E.05717
G1 X128.878 Y114.591
G1 X129.804 Y113.665 E.04024
G1 X129.371 Y113.564
G1 X128.878 Y114.057 E.02145
M204 S10000
G1 X129.346 Y127.802 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.109417
G1 F4117
M204 S6000
G1 X129.228 Y127.883 E.00077
; LINE_WIDTH: 0.0828036
G1 X129.246 Y127.914 E.00012
; CHANGE_LAYER
; Z_HEIGHT: 13.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X129.228 Y127.883 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 69/75
; update layer progress
M73 L69
M991 S0 P68 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z14 I.308 J-1.177 P1  F42000
G1 X125.245 Y126.84 Z14
G1 Z13.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3751
M204 S5000
G1 X126.296 Y126.84 E.03231
G1 X126.696 Y126.84 E.01229
G1 X127.096 Y126.84 E.01229
G1 F2049.099
G1 X127.096 Y126.881 E.00126
M106 S255
G1 F1800
G1 X127.096 Y127.25 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X127.096 Y127.65 E.01327
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X127.096 Y128.019 E.01134
M106 S201.45
G1 F2049.099
G1 X127.096 Y128.06 E.00126
G1 F3751
G1 X126.696 Y128.06 E.01229
G1 X126.296 Y128.06 E.01229
G1 X125.245 Y128.06 E.03231
G1 X125.245 Y128.019 E.00126
G1 X125.245 Y126.9 E.03438
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.296 Y126.84 E-.40019
G1 X126.696 Y126.84 E-.152
G1 X127.096 Y126.84 E-.152
G1 X127.096 Y126.881 E-.01558
G1 X127.096 Y126.987 E-.04023
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.172 Y134.563 Z14.2 F42000
G1 X125.245 Y142.16 Z14.2
G1 Z13.8
G1 E.8 F1800
G1 F3751
M204 S5000
G1 X125.245 Y142.119 E.00126
G1 X125.245 Y140.981 E.03497
G1 X125.245 Y140.94 E.00126
G1 X126.296 Y140.94 E.03231
G1 X126.696 Y140.94 E.01229
G1 X127.096 Y140.94 E.01229
G1 F2049.036
G1 X127.096 Y140.981 E.00126
M106 S255
G1 F1800
G1 X127.096 Y141.35 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X127.096 Y141.75 E.01327
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X127.096 Y142.119 E.01134
M106 S201.45
G1 F2049.099
G1 X127.096 Y142.16 E.00126
G1 F3751
G1 X126.696 Y142.16 E.01229
G1 X126.296 Y142.16 E.01229
G1 X125.305 Y142.16 E.03046
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.245 Y142.119 E-.02761
G1 X125.245 Y140.981 E-.43244
G1 X125.245 Y140.94 E-.01558
G1 X125.993 Y140.94 E-.28437
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.2 I-.164 J1.206 P1  F42000
G1 X127.915 Y141.202 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3751
M204 S6000
G1 X127.915 Y141.833 E.02092
G1 X127.915 Y142.233 E.01327
G1 X127.889 Y142.233 E.00088
G1 X127.87 Y142.353 E.00402
G1 X127.488 Y142.381 E.01271
G1 F1738.923
G1 X127.488 Y142.132 E.00824
M106 S255
G1 F600
G1 X127.488 Y141.202 E.03086
M106 S201.45
G1 F2160
G1 X127.815 Y141.202 E.01084
G1 F2427.391
G1 X127.855 Y141.202 E.00134
; WIPE_START
G1 X127.915 Y141.833 E-.24077
G1 X127.915 Y142.233 E-.152
G1 X127.889 Y142.233 E-.01006
G1 X127.87 Y142.353 E-.04609
G1 X127.488 Y142.381 E-.14563
G1 X127.488 Y142.132 E-.09437
G1 X127.488 Y141.945 E-.07109
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.2 I1.217 J.001 P1  F42000
G1 X127.502 Y126.041 Z14.2
G1 Z13.8
G1 E.8 F1800
G1 F3751
M204 S6000
G1 X125.152 Y126.041 E.07795
G1 X125.153 Y114.009 E.39911
G1 X126.952 Y114.009 E.05968
G3 X127.502 Y114.027 I-.063 J10.78 E.01825
G1 X127.502 Y125.981 E.39654
; WIPE_START
G1 F8843.478
G1 X125.502 Y126.032 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.2 I-.719 J.982 P1  F42000
G1 X127.915 Y127.798 Z14.2
G1 Z13.8
G1 E.8 F1800
G1 F2854.282
M204 S6000
G1 X127.815 Y127.798 E.00333
G1 F2160
G1 X127.488 Y127.798 E.01084
M106 S255
G1 F600
G1 X127.488 Y126.867 E.03086
M106 S201.45
G1 F2869.055
G1 X127.488 Y126.448 E.01392
G1 F3751
G1 X127.088 Y126.448 E.01327
G1 X126.688 Y126.448 E.01327
G1 X124.745 Y126.448 E.06447
G1 X124.746 Y113.602 E.42612
G1 X126.956 Y113.602 E.07331
G3 X127.889 Y113.649 I-.259 J14.647 E.03101
G1 X127.909 Y113.861 E.00706
G1 X127.915 Y127.738 E.46034
; WIPE_START
G1 F8843.478
G1 X127.815 Y127.798 E-.04441
G1 X127.488 Y127.798 E-.1242
G1 X127.488 Y126.867 E-.35357
G1 X127.488 Y126.448 E-.15944
G1 X127.282 Y126.448 E-.07838
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.2 I-1.217 J.033 P1  F42000
G1 X127.676 Y140.81 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2049.099
M204 S5000
G1 X127.676 Y140.769 E.00126
M106 S255
G1 F1800
G1 X127.676 Y140.4 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
G1 X127.676 Y140.335 E.00216
G1 X128.012 Y140.335 E.01116
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X128.381 Y140.335 E.01134
M106 S201.45
G1 F3751
G1 X128.781 Y140.335 E.01229
G1 X129.181 Y140.335 E.01229
M73 P93 R1
G1 X129.767 Y140.335 E.018
G1 X129.755 Y142.223 E.058
G3 X128.958 Y142.578 I-1.047 J-1.278 E.02712
G3 X126.884 Y142.79 I-1.988 J-9.183 E.06418
G1 X124.534 Y142.788 E.07223
G3 X124.352 Y142.589 I.02 J-.201 E.00907
G1 X124.353 Y113.381 E.89749
G3 X124.558 Y113.21 I.198 J.029 E.00897
G1 X126.96 Y113.21 E.0738
G3 X129.218 Y113.495 I.094 J8.363 E.07017
G3 X129.765 Y113.796 I-.275 J1.146 E.01943
G1 X129.767 Y128.665 E.45687
G1 X129.181 Y128.665 E.01801
G1 X128.781 Y128.665 E.01229
G1 X128.381 Y128.665 E.01229
M106 S255
G1 F1800
G1 X128.012 Y128.665 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
G1 X127.676 Y128.665 E.01116
G1 X127.676 Y128.6 E.00216
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X127.676 Y128.231 E.01134
M106 S201.45
G1 F2049.036
G1 X127.676 Y128.19 E.00126
G1 F3751
G1 X127.276 Y128.19 E.01229
G1 X126.876 Y128.19 E.01229
G1 X125.348 Y128.19 E.04693
G1 X125.348 Y128.231 E.00126
G1 X125.348 Y140.769 E.38526
G1 X125.348 Y140.81 E.00126
G1 X127.616 Y140.81 E.06967
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.676 Y140.769 E-.02761
G1 X127.676 Y140.4 E-.14022
G1 X127.676 Y140.335 E-.0247
G1 X128.012 Y140.335 E-.12784
G1 X128.381 Y140.335 E-.14022
G1 X128.781 Y140.335 E-.152
G1 X129.169 Y140.335 E-.1474
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


G1 X129.559 Y141.024 F42000
G1 Z13.8
G1 E.8 F1800
; FEATURE: Top surface
G1 F3751
M204 S2000
G1 X129.077 Y140.542 E.02094
G1 X128.717 Y140.716
G1 X129.559 Y141.557 E.03657
G1 X129.559 Y142.09
G1 X128.574 Y141.105 E.0428
G1 X128.138 Y141.203
G1 X129.22 Y142.285 E.04702
G1 X128.801 Y142.399
G1 X128.138 Y141.736 E.02881
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.801 Y142.399 E-.35632
G1 X129.22 Y142.285 E-.165
G1 X128.776 Y141.841 E-.23868
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.2 I-.476 J-1.12 P1  F42000
G1 X127.292 Y142.471 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.277959
G1 F3751
M204 S6000
G1 X126.882 Y142.475 E.00786
; LINE_WIDTH: 0.280833
G1 X125.049 Y142.474 E.03554
G1 X125.001 Y142.451 E.00102
; LINE_WIDTH: 0.350388
G1 X124.954 Y142.427 E.00132
; LINE_WIDTH: 0.397637
G1 X124.907 Y142.403 E.00153
; LINE_WIDTH: 0.444886
G1 X124.86 Y142.38 E.00173
; LINE_WIDTH: 0.492136
G1 X124.812 Y142.356 E.00194
; LINE_WIDTH: 0.529804
G1 X124.798 Y142.342 E.00079
; LINE_WIDTH: 0.544585
G1 X124.798 Y140.744 E.06533
G1 X124.816 Y140.668 E.00318
; LINE_WIDTH: 0.595492
G1 X124.833 Y140.592 E.0035
; LINE_WIDTH: 0.629991
G1 X124.85 Y140.516 E.00372
M204 S10000
G1 X125.152 Y140.705 F42000
; LINE_WIDTH: 0.27479
G1 F3751
M204 S6000
G1 X125.114 Y140.682 E.00084
; LINE_WIDTH: 0.32445
G1 X125.077 Y140.658 E.00102
; LINE_WIDTH: 0.37411
G1 X125.039 Y140.634 E.0012
; LINE_WIDTH: 0.42377
G1 X125.001 Y140.611 E.00138
; LINE_WIDTH: 0.47343
G1 X124.963 Y140.587 E.00156
; LINE_WIDTH: 0.52309
G1 X124.926 Y140.563 E.00174
; LINE_WIDTH: 0.57275
G1 X124.888 Y140.54 E.00192
; LINE_WIDTH: 0.646809
G1 X124.85 Y140.516 E.00219
G1 X124.85 Y128.484 E.59212
M204 S10000
G1 X125.152 Y128.295 F42000
; LINE_WIDTH: 0.274747
G1 F3751
M204 S6000
G1 X125.115 Y128.318 E.00084
; LINE_WIDTH: 0.324319
G1 X125.077 Y128.342 E.00102
; LINE_WIDTH: 0.373891
G1 X125.039 Y128.366 E.0012
; LINE_WIDTH: 0.423463
G1 X125.001 Y128.389 E.00138
; LINE_WIDTH: 0.473036
G1 X124.964 Y128.413 E.00156
; LINE_WIDTH: 0.522608
G1 X124.926 Y128.436 E.00174
; LINE_WIDTH: 0.57218
G1 X124.888 Y128.46 E.00192
; LINE_WIDTH: 0.621753
G1 X124.85 Y128.484 E.0021
; LINE_WIDTH: 0.629299
G1 X124.833 Y128.408 E.00372
; LINE_WIDTH: 0.594788
G1 X124.816 Y128.332 E.0035
; LINE_WIDTH: 0.543771
G1 X124.799 Y128.256 E.00317
G1 X124.799 Y126.644 E.06579
; WIPE_START
G1 F7187.775
G1 X124.799 Y128.256 E-.72502
G1 X124.816 Y128.332 E-.03498
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.327 Y124.866 Z14.2 F42000
G1 Z13.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.47702
G1 F3751
M204 S6000
G1 X126.327 Y115.244 E.34037
M204 S10000
G1 X126.733 Y125.272 F42000
; LINE_WIDTH: 0.41999
G1 F3751
M204 S6000
G1 X126.733 Y114.779 E.32242
G1 X125.922 Y114.778 E.02492
G1 X125.921 Y125.272 E.32242
G1 X126.673 Y125.272 E.02309
M204 S10000
G1 X127.11 Y125.649 F42000
G1 F3751
M204 S6000
G1 X127.11 Y114.407 E.34543
G2 X125.545 Y114.401 I-1.192 J120.511 E.04809
G1 X125.544 Y125.649 E.34559
G1 X127.05 Y125.649 E.04626
; WIPE_START
G1 F9547.299
G1 X125.544 Y125.649 E-.57215
G1 X125.544 Y125.154 E-.18785
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.612 Y117.807 Z14.2 F42000
G1 X128.796 Y113.599 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F3751
M204 S2000
G1 X129.56 Y114.362 E.03318
G1 X129.56 Y114.895
G1 X128.157 Y113.493 E.06096
G1 X128.131 Y114
G1 X129.56 Y115.429 E.06208
G1 X129.56 Y115.962
G1 X128.131 Y114.533 E.06208
G1 X128.131 Y115.066
G1 X129.56 Y116.495 E.06208
G1 X129.56 Y117.028
G1 X128.131 Y115.6 E.06208
G1 X128.131 Y116.133
G1 X129.56 Y117.562 E.06208
G1 X129.56 Y118.095
G1 X128.131 Y116.666 E.06208
G1 X128.131 Y117.2
G1 X129.56 Y118.628 E.06208
G1 X129.56 Y119.161
G1 X128.131 Y117.733 E.06208
G1 X128.131 Y118.266
G1 X129.56 Y119.695 E.06208
G1 X129.56 Y120.228
G1 X128.131 Y118.799 E.06208
G1 X128.131 Y119.333
G1 X129.56 Y120.761 E.06208
G1 X129.56 Y121.294
G1 X128.131 Y119.866 E.06208
G1 X128.131 Y120.399
G1 X129.56 Y121.828 E.06208
G1 X129.56 Y122.361
G1 X128.131 Y120.932 E.06208
G1 X128.131 Y121.466
G1 X129.56 Y122.894 E.06208
G1 X129.56 Y123.427
G1 X128.131 Y121.999 E.06208
G1 X128.131 Y122.532
G1 X129.56 Y123.961 E.06208
G1 X129.56 Y124.494
G1 X128.131 Y123.065 E.06208
G1 X128.131 Y123.599
G1 X129.56 Y125.027 E.06208
G1 X129.56 Y125.56
G1 X128.131 Y124.132 E.06208
G1 X128.131 Y124.665
G1 X129.56 Y126.094 E.06208
G1 X129.56 Y126.627
G1 X128.131 Y125.198 E.06208
G1 X128.131 Y125.732
G1 X129.56 Y127.16 E.06208
G1 X129.56 Y127.693
G1 X128.131 Y126.265 E.06208
G1 X128.138 Y126.805
G1 X129.56 Y128.227 E.06179
G1 X129.257 Y128.458
G1 X128.717 Y127.918 E.02346
G1 X128.694 Y127.895
G1 X128.138 Y127.338 E.02419
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.694 Y127.895 E-.2991
G1 X128.717 Y127.918 E-.01235
G1 X129.257 Y128.458 E-.29017
G1 X129.56 Y128.227 E-.14457
G1 X129.534 Y128.201 E-.01381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.2 I1.217 J.004 P1  F42000
G1 X129.579 Y113.971 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.195247
G1 F3751
M204 S6000
G1 X129.394 Y113.835 E.00284
; LINE_WIDTH: 0.152505
G1 X129.196 Y113.701 E.00213
M204 S10000
G1 X128.734 Y113.661 F42000
; LINE_WIDTH: 0.0948256
G1 F3751
M204 S6000
G1 X128.49 Y113.536 E.00116
; CHANGE_LAYER
; Z_HEIGHT: 14
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X128.734 Y113.661 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 70/75
; update layer progress
M73 L70
M991 S0 P69 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z14.2 I-1.178 J-.307 P1  F42000
G1 X125.298 Y126.84 Z14.2
G1 Z14
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3398
M204 S5000
G1 X125.55 Y126.84 E.00773
G1 X125.95 Y126.84 E.01229
G1 X126.35 Y126.84 E.01229
G1 F2049.099
G1 X126.35 Y126.881 E.00126
M106 S255
G1 F1800
G1 X126.35 Y127.25 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X126.35 Y127.65 E.01327
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X126.35 Y128.019 E.01134
M106 S201.45
G1 F2049.036
G1 X126.35 Y128.06 E.00126
G1 F3398
G1 X125.95 Y128.06 E.01229
G1 X125.55 Y128.06 E.01229
G1 X125.298 Y128.06 E.00773
G1 X125.298 Y128.019 E.00126
G1 X125.298 Y126.9 E.03438
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.55 Y126.84 E-.09822
G1 X125.95 Y126.84 E-.152
G1 X126.35 Y126.84 E-.152
G1 X126.35 Y126.881 E-.01558
G1 X126.35 Y127.25 E-.14022
G1 X126.35 Y127.65 E-.152
G1 X126.35 Y127.782 E-.04998
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.793 Y135.394 Z14.4 F42000
G1 X125.298 Y142.16 Z14.4
G1 Z14
G1 E.8 F1800
G1 F3398
M204 S5000
G1 X125.298 Y142.119 E.00126
G1 X125.298 Y140.981 E.03497
G1 X125.298 Y140.94 E.00126
G1 X125.55 Y140.94 E.00773
G1 X125.95 Y140.94 E.01229
G1 X126.35 Y140.94 E.01229
G1 F2049.036
G1 X126.35 Y140.981 E.00126
M106 S255
G1 F1800
G1 X126.35 Y141.35 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X126.35 Y141.75 E.01327
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X126.35 Y142.119 E.01134
M106 S201.45
G1 F2049.099
G1 X126.35 Y142.16 E.00126
G1 F3398
G1 X125.95 Y142.16 E.01229
G1 X125.358 Y142.16 E.01817
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.298 Y142.119 E-.02761
G1 X125.298 Y140.981 E-.43244
G1 X125.298 Y140.94 E-.01558
G1 X125.55 Y140.94 E-.09554
G1 X125.95 Y140.94 E-.152
G1 X126.047 Y140.94 E-.03683
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.4 I-.346 J1.167 P1  F42000
G1 X126.929 Y141.202 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2160
M204 S6000
G1 X127.069 Y141.202 E.00462
G1 F2854.282
G1 X127.169 Y141.202 E.00333
G1 F3398
G1 X127.169 Y141.602 E.01327
G1 X127.169 Y142.002 E.01327
G1 X127.169 Y142.233 E.00765
G1 X127.152 Y142.233 E.00057
G1 X127.139 Y142.352 E.00398
G1 X126.742 Y142.383 E.01322
G1 F1751.368
G1 X126.742 Y142.132 E.00831
M106 S255
G1 F600
G1 X126.742 Y141.202 E.03086
M106 S201.45
G1 F1110.733
G1 X126.869 Y141.202 E.00423
; WIPE_START
G1 X127.069 Y141.202 E-.07576
G1 X127.169 Y141.202 E-.03812
G1 X127.169 Y141.602 E-.152
G1 X127.169 Y142.002 E-.152
G1 X127.169 Y142.233 E-.08769
G1 X127.152 Y142.233 E-.00656
G1 X127.139 Y142.352 E-.04558
G1 X126.742 Y142.383 E-.15149
G1 X126.742 Y142.249 E-.05081
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.4 I1.217 J.001 P1  F42000
G1 X126.755 Y126.041 Z14.4
G1 Z14
G1 E.8 F1800
G1 F3398
M204 S6000
G1 X125.197 Y126.041 E.05169
G1 X125.197 Y114.009 E.39911
G1 X126.215 Y114.009 E.03376
G3 X126.755 Y114.027 I-.071 J10.712 E.01794
G1 X126.755 Y125.981 E.39654
; WIPE_START
G1 F8843.478
G1 X125.197 Y126.041 E-.59263
G1 X125.197 Y125.6 E-.16737
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.4 I-.956 J.753 P1  F42000
G1 X126.929 Y127.798 Z14.4
G1 Z14
G1 E.8 F1800
G1 F1405.094
M204 S6000
G1 X126.742 Y127.798 E.00622
M106 S255
G1 F600
G1 X126.742 Y126.867 E.03086
M106 S201.45
G1 F2869.055
G1 X126.742 Y126.448 E.01392
G1 F3398
G1 X126.342 Y126.448 E.01327
G1 X125.942 Y126.448 E.01327
G1 X124.79 Y126.448 E.03822
G1 X124.79 Y113.602 E.42612
G1 X126.219 Y113.602 E.0474
G3 X127.143 Y113.649 I-.271 J14.577 E.03068
G1 X127.162 Y113.862 E.00708
G1 X127.169 Y126.998 E.43576
G1 X127.169 Y127.398 E.01327
G1 X127.169 Y127.798 E.01327
G1 F2854.282
G1 X127.069 Y127.798 E.00333
G1 F2160
G1 X126.989 Y127.798 E.00263
; WIPE_START
G1 X126.742 Y127.798 E-.09405
G1 X126.742 Y126.867 E-.35357
G1 X126.742 Y126.448 E-.15944
G1 X126.342 Y126.448 E-.152
G1 X126.339 Y126.448 E-.00095
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.4 I-1.216 J.05 P1  F42000
G1 X126.929 Y140.769 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
M204 S5000
G1 X126.929 Y140.4 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
G1 X126.929 Y140.335 E.00216
G1 X127.266 Y140.335 E.01116
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X127.635 Y140.335 E.01134
M106 S201.45
G1 F3398
G1 X128.035 Y140.335 E.01229
G1 X128.435 Y140.335 E.01229
G1 X129.021 Y140.335 E.01801
G1 X129.015 Y142.21 E.05763
G3 X128.344 Y142.543 I-.904 J-.979 E.02334
G3 X126.138 Y142.79 I-2.087 J-8.673 E.06839
G1 X124.593 Y142.79 E.04746
G3 X124.397 Y142.589 I.007 J-.203 E.00949
G1 X124.398 Y113.397 E.897
G3 X124.608 Y113.21 I.199 J.012 E.00959
G1 X126.223 Y113.21 E.04963
G3 X128.475 Y113.496 I.095 J8.275 E.06998
G3 X129.019 Y113.796 I-.277 J1.143 E.01932
G1 X129.021 Y128.665 E.45687
G1 X128.435 Y128.665 E.01801
G1 X128.035 Y128.665 E.01229
G1 X127.635 Y128.665 E.01229
M106 S255
G1 F1800
G1 X127.266 Y128.665 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
G1 X126.929 Y128.665 E.01116
G1 X126.929 Y128.6 E.00216
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X126.929 Y128.231 E.01134
M106 S201.45
G1 F2049.036
G1 X126.929 Y128.19 E.00126
G1 F3398
G1 X126.529 Y128.19 E.01229
G1 X126.129 Y128.19 E.01229
G1 X125.402 Y128.19 E.02235
G1 X125.402 Y128.231 E.00126
G1 X125.402 Y140.769 E.38526
G1 X125.402 Y140.81 E.00126
G1 X126.91 Y140.81 E.04635
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.929 Y140.4 E-.15597
G1 X126.929 Y140.335 E-.0247
G1 X127.266 Y140.335 E-.12784
G1 X127.635 Y140.335 E-.14022
G1 X128.035 Y140.335 E-.152
G1 X128.435 Y140.335 E-.152
G1 X128.454 Y140.335 E-.00727
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


G1 X128.336 Y142.328 F42000
G1 Z14
G1 E.8 F1800
; FEATURE: Top surface
G1 F3398
M204 S2000
G1 X128.813 Y141.851 E.02072
G1 X128.813 Y141.318
G1 X127.658 Y142.473 E.05019
G1 X127.392 Y142.206
M73 P94 R1
G1 X128.813 Y140.785 E.06178
G1 X128.522 Y140.542
G1 X127.971 Y141.094 E.02396
G1 X127.959 Y141.105
G1 X127.392 Y141.673 E.02468
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.959 Y141.105 E-.30519
G1 X127.971 Y141.094 E-.00626
G1 X128.522 Y140.542 E-.29625
G1 X128.813 Y140.785 E-.14388
G1 X128.798 Y140.8 E-.00841
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.4 I-.725 J-.977 P1  F42000
G1 X126.546 Y142.471 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.278224
G1 F3398
M204 S6000
G1 X126.135 Y142.475 E.00788
; LINE_WIDTH: 0.281864
G1 X125.102 Y142.475 E.0201
G1 X125.055 Y142.451 E.00103
; LINE_WIDTH: 0.351793
G1 X125.007 Y142.427 E.00134
; LINE_WIDTH: 0.399292
G1 X124.96 Y142.404 E.00154
; LINE_WIDTH: 0.446791
G1 X124.912 Y142.38 E.00175
; LINE_WIDTH: 0.494291
G1 X124.865 Y142.356 E.00195
; LINE_WIDTH: 0.534891
G1 X124.848 Y142.339 E.00096
; LINE_WIDTH: 0.552545
G1 X124.848 Y140.744 E.06625
G1 X124.865 Y140.667 E.00326
; LINE_WIDTH: 0.603482
G1 X124.882 Y140.591 E.00358
; LINE_WIDTH: 0.637986
G1 X124.9 Y140.514 E.0038
M204 S10000
G1 X124.934 Y140.536 F42000
; LINE_WIDTH: 0.587694
G1 F3398
M204 S6000
G1 X124.968 Y140.557 E.00178
; LINE_WIDTH: 0.542663
G1 X125.002 Y140.578 E.00163
; LINE_WIDTH: 0.497631
G1 X125.036 Y140.599 E.00148
; LINE_WIDTH: 0.4526
G1 X125.07 Y140.62 E.00134
; LINE_WIDTH: 0.407569
G1 X125.104 Y140.641 E.00119
; LINE_WIDTH: 0.362538
G1 X125.138 Y140.663 E.00104
; LINE_WIDTH: 0.317507
G1 X125.172 Y140.684 E.0009
; LINE_WIDTH: 0.272476
G1 X125.206 Y140.705 E.00075
M204 S10000
G1 X124.934 Y140.536 F42000
; LINE_WIDTH: 0.655076
G1 F3398
M204 S6000
G1 X124.9 Y140.514 E.002
G1 X124.9 Y128.485 E.60004
; LINE_WIDTH: 0.632553
G1 X124.934 Y128.464 E.00192
; LINE_WIDTH: 0.587542
G1 X124.968 Y128.443 E.00178
; LINE_WIDTH: 0.542532
G1 X125.002 Y128.422 E.00163
; LINE_WIDTH: 0.497521
G1 X125.036 Y128.401 E.00148
; LINE_WIDTH: 0.45251
G1 X125.07 Y128.38 E.00134
; LINE_WIDTH: 0.407499
G1 X125.104 Y128.359 E.00119
; LINE_WIDTH: 0.362488
G1 X125.138 Y128.337 E.00104
; LINE_WIDTH: 0.317477
G1 X125.172 Y128.316 E.0009
; LINE_WIDTH: 0.272466
G1 X125.206 Y128.295 E.00075
M204 S10000
G1 X124.865 Y128.333 F42000
; LINE_WIDTH: 0.603307
G1 F3398
M204 S6000
G1 X124.883 Y128.409 E.00358
; LINE_WIDTH: 0.637818
G1 X124.9 Y128.485 E.0038
M204 S10000
G1 X124.865 Y128.333 F42000
; LINE_WIDTH: 0.552334
G1 F3398
M204 S6000
G1 X124.848 Y128.256 E.00325
G1 X124.848 Y126.644 E.06691
; WIPE_START
G1 F7066.945
G1 X124.848 Y128.256 E-.72475
G1 X124.865 Y128.333 E-.03525
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.363 Y125.649 Z14.4 F42000
G1 Z14
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F3398
M204 S6000
G1 X126.363 Y114.406 E.34544
G1 X125.589 Y114.401 E.02379
G1 X125.589 Y125.649 E.34559
G1 X126.303 Y125.649 E.02195
M204 S10000
G1 X125.976 Y125.262 F42000
; LINE_WIDTH: 0.44004
G1 F3398
M204 S6000
G1 X125.976 Y114.849 E.33697
; WIPE_START
G1 F9065.27
G1 X125.976 Y116.849 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.5 Y124.327 Z14.4 F42000
G1 X128.342 Y128.458 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F3398
M204 S2000
G1 X128.813 Y127.986 E.02048
G1 X128.813 Y127.453
G1 X127.971 Y128.295 E.0366
G1 X127.839 Y127.895
G1 X128.813 Y126.92 E.04236
G1 X128.813 Y126.387
G1 X127.392 Y127.809 E.06179
G1 X127.392 Y127.275
G1 X128.813 Y125.853 E.06179
G1 X128.813 Y125.32
G1 X127.392 Y126.742 E.06179
G1 X127.385 Y126.215
G1 X128.813 Y124.787 E.06208
G1 X128.813 Y124.254
G1 X127.385 Y125.682 E.06208
G1 X127.385 Y125.149
G1 X128.813 Y123.72 E.06208
G1 X128.813 Y123.187
G1 X127.385 Y124.616 E.06208
G1 X127.385 Y124.082
G1 X128.813 Y122.654 E.06208
G1 X128.813 Y122.121
G1 X127.385 Y123.549 E.06208
G1 X127.385 Y123.016
G1 X128.813 Y121.587 E.06208
G1 X128.813 Y121.054
G1 X127.385 Y122.483 E.06208
G1 X127.385 Y121.949
G1 X128.813 Y120.521 E.06208
G1 X128.813 Y119.988
G1 X127.385 Y121.416 E.06208
G1 X127.385 Y120.883
G1 X128.813 Y119.454 E.06208
G1 X128.813 Y118.921
G1 X127.385 Y120.35 E.06208
G1 X127.385 Y119.816
G1 X128.813 Y118.388 E.06208
G1 X128.813 Y117.855
G1 X127.385 Y119.283 E.06208
G1 X127.385 Y118.75
G1 X128.813 Y117.321 E.06208
G1 X128.813 Y116.788
G1 X127.385 Y118.217 E.06208
G1 X127.385 Y117.683
G1 X128.813 Y116.255 E.06208
G1 X128.813 Y115.722
G1 X127.385 Y117.15 E.06208
G1 X127.385 Y116.617
G1 X128.813 Y115.188 E.06208
G1 X128.813 Y114.655
G1 X127.385 Y116.084 E.06208
G1 X127.385 Y115.55
G1 X128.813 Y114.122 E.06208
G1 X128.628 Y113.774
G1 X127.385 Y115.017 E.054
G1 X127.385 Y114.484
G1 X128.227 Y113.641 E.03662
G1 X127.789 Y113.547
G1 X127.385 Y113.951 E.01755
M204 S10000
G1 X128.333 Y128.449 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0987057
G1 F3398
M204 S6000
G1 X127.952 Y128.449 E.00173
; CHANGE_LAYER
; Z_HEIGHT: 14.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X128.333 Y128.449 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 71/75
; update layer progress
M73 L71
M991 S0 P70 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z14.4 I-1.185 J-.278 P1  F42000
G1 X125.242 Y141.609 Z14.4
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2324.679
M204 S6000
G1 X125.326 Y141.609 E.00277
M106 S255
G1 F1800
G1 X125.708 Y141.609 E.01269
M106 S201.45
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X125.94 Y141.609 E.00768
M106 S201.45
; FEATURE: Inner wall
M106 S255
G1 F600
M204 S6000
G1 X126.016 Y141.609 E.00251
M106 S201.45
M106 S255
G1 X126.016 Y141.973 E.01206
M106 S201.45
G1 F1676.692
G1 X125.778 Y141.984 E.00788
G1 F2400
G1 X125.522 Y141.99 E.00852
G1 F2713
G1 X125.326 Y141.99 E.00649
G1 X125.242 Y141.99 E.00277
G1 X125.242 Y141.669 E.01065
M204 S10000
G1 X124.835 Y141.202 F42000
G1 F2713
M204 S6000
G1 X125.326 Y141.202 E.01627
M106 S255
G1 F1320
G1 X126.322 Y141.202 E.03305
M106 S201.45
G1 F1873.287
G1 X126.423 Y141.202 E.00333
G1 F2713
G1 X126.423 Y141.602 E.01327
G1 X126.423 Y142.002 E.01327
G1 X126.423 Y142.233 E.00765
G1 X126.41 Y142.233 E.00041
G1 X126.402 Y142.351 E.00394
G3 X124.835 Y142.397 I-1.25 J-15.869 E.052
G1 X124.835 Y141.262 E.03766
; WIPE_START
G1 F8843.478
G1 X125.326 Y141.202 E-.18782
G1 X126.322 Y141.202 E-.37864
G1 X126.423 Y141.202 E-.03812
G1 X126.423 Y141.602 E-.152
G1 X126.423 Y141.611 E-.00342
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.791 Y134.005 Z14.6 F42000
G1 X125.243 Y127.391 Z14.6
G1 Z14.2
G1 E.8 F1800
G1 F2713
M204 S6000
G1 X125.243 Y114.009 E.44389
G1 X125.478 Y114.01 E.00779
G3 X126.009 Y114.027 I-.081 J10.701 E.01763
G1 X126.009 Y125.668 E.38615
G1 X126.009 Y126.068 E.01327
G1 X126.009 Y126.468 E.01327
G1 X126.009 Y126.867 E.01327
M106 S255
G1 F960
G1 X126.009 Y127.391 E.01736
M106 S201.45
M106 S255
G1 F600
G1 X125.94 Y127.391 E.00229
M106 S201.45
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X125.708 Y127.391 E.00768
M106 S201.45
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X125.326 Y127.391 E.01269
M106 S201.45
G1 F1939.764
G1 X125.303 Y127.391 E.00077
M204 S10000
G1 X125.063 Y127.798 F42000
G1 F2713
M204 S6000
G1 X124.835 Y127.798 E.00756
G1 X124.836 Y113.602 E.4709
G1 X125.482 Y113.602 E.02143
G3 X126.396 Y113.649 I-.294 J14.807 E.03037
G1 X126.416 Y113.862 E.00709
G1 X126.422 Y126.998 E.43576
G1 X126.422 Y127.398 E.01327
G1 X126.423 Y127.798 E.01327
G1 F1873.287
G1 X126.322 Y127.798 E.00333
M106 S255
G1 F1320
G1 X125.326 Y127.798 E.03305
M106 S201.45
G1 F2535.854
G1 X125.123 Y127.798 E.00672
M204 S250
G1 X125.455 Y128.19 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2713
M204 S5000
G1 X125.455 Y128.231 E.00126
G1 X125.455 Y140.769 E.38526
G1 X125.455 Y140.81 E.00126
G1 X125.783 Y140.81 E.01006
G1 X126.183 Y140.81 E.01229
G1 F2049.099
G1 X126.183 Y140.769 E.00126
M106 S255
G1 F1800
G1 X126.183 Y140.4 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
G1 X126.183 Y140.335 E.00216
G1 X126.519 Y140.335 E.01116
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X126.888 Y140.335 E.01134
M106 S201.45
G1 F2713
G1 X127.288 Y140.335 E.01229
G1 X127.688 Y140.335 E.01229
G1 X128.274 Y140.335 E.01801
G1 X128.264 Y142.219 E.0579
G3 X127.759 Y142.494 I-.771 J-.814 E.01787
G3 X125.531 Y142.789 I-2.228 J-8.277 E.06924
G1 X124.639 Y142.79 E.02743
G3 X124.443 Y142.589 I.008 J-.203 E.00948
G1 X124.444 Y113.397 E.89701
G3 X124.645 Y113.21 I.202 J.015 E.00927
G1 X125.486 Y113.21 E.02584
G3 X127.732 Y113.497 I.088 J8.265 E.0698
G3 X128.273 Y113.796 I-.278 J1.14 E.01922
G1 X128.274 Y128.665 E.45687
G1 X127.688 Y128.665 E.01801
G1 X127.288 Y128.665 E.01229
G1 X126.888 Y128.665 E.01229
M106 S255
G1 F1800
G1 X126.519 Y128.665 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
G1 X126.183 Y128.665 E.01116
G1 X126.183 Y128.6 E.00216
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X126.183 Y128.231 E.01134
M106 S201.45
G1 F2049.036
G1 X126.183 Y128.19 E.00126
G1 F2713
G1 X125.783 Y128.19 E.01229
G1 X125.515 Y128.19 E.00822
; WIPE_START
G1 F8373.692
M204 S6000
G1 X125.455 Y128.231 E-.02761
G1 X125.455 Y130.158 E-.73239
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


G1 X124.949 Y127.994 F42000
G1 Z14.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.663036
G1 F2713
M204 S6000
G1 X124.949 Y141.006 E.65751
; WIPE_START
G1 F5805.373
G1 X124.949 Y139.006 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.067 Y141.132 Z14.6 F42000
G1 Z14.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2713
M204 S2000
G1 X127.478 Y140.542 E.02561
G1 X127.225 Y140.823
G1 X128.067 Y141.665 E.0366
G1 X128.022 Y142.153
G1 X126.974 Y141.105 E.04553
G1 X126.645 Y141.31
G1 X127.646 Y142.311 E.04351
G1 X127.221 Y142.419
G1 X126.645 Y141.843 E.02505
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.221 Y142.419 E-.30976
G1 X127.646 Y142.311 E-.16664
G1 X127.119 Y141.783 E-.2836
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.6 I1.211 J-.124 P1  F42000
G1 X125.626 Y127.187 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.402078
G1 F2713
M204 S6000
G1 X125.626 Y114.216 E.37962
; WIPE_START
G1 F10023.457
G1 X125.626 Y116.216 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.169 Y113.571 Z14.6 F42000
G1 Z14.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2713
M204 S2000
G1 X128.067 Y114.469 E.03903
G1 X128.067 Y115.002
G1 X126.61 Y113.545 E.06332
G1 X126.638 Y114.107
G1 X128.067 Y115.535 E.06208
G1 X128.067 Y116.069
G1 X126.638 Y114.64 E.06208
G1 X126.638 Y115.173
G1 X128.067 Y116.602 E.06208
G1 X128.067 Y117.135
G1 X126.638 Y115.707 E.06208
G1 X126.638 Y116.24
G1 X128.067 Y117.669 E.06208
G1 X128.067 Y118.202
G1 X126.638 Y116.773 E.06208
G1 X126.638 Y117.306
G1 X128.067 Y118.735 E.06208
G1 X128.067 Y119.268
G1 X126.638 Y117.84 E.06208
G1 X126.638 Y118.373
G1 X128.067 Y119.802 E.06208
G1 X128.067 Y120.335
G1 X126.638 Y118.906 E.06208
G1 X126.638 Y119.44
G1 X128.067 Y120.868 E.06208
G1 X128.067 Y121.401
G1 X126.638 Y119.973 E.06208
G1 X126.638 Y120.506
G1 X128.067 Y121.935 E.06208
G1 X128.067 Y122.468
G1 X126.638 Y121.039 E.06208
G1 X126.638 Y121.573
G1 X128.067 Y123.001 E.06208
G1 X128.067 Y123.534
G1 X126.638 Y122.106 E.06208
G1 X126.638 Y122.639
G1 X128.067 Y124.068 E.06208
G1 X128.067 Y124.601
G1 X126.638 Y123.172 E.06208
G1 X126.638 Y123.706
G1 X128.067 Y125.134 E.06208
G1 X128.067 Y125.667
G1 X126.638 Y124.239 E.06208
G1 X126.638 Y124.772
G1 X128.067 Y126.201 E.06208
G1 X128.067 Y126.734
G1 X126.638 Y125.305 E.06208
G1 X126.638 Y125.839
G1 X128.067 Y127.267 E.06208
G1 X128.067 Y127.8
G1 X126.638 Y126.372 E.06208
G1 X126.645 Y126.912
G1 X128.067 Y128.334 E.06179
G1 X127.658 Y128.458
G1 X127.225 Y128.025 E.01882
G1 X127.095 Y127.895
M73 P95 R1
G1 X126.645 Y127.445 E.01954
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.095 Y127.895 E-.24163
G1 X127.225 Y128.025 E-.06982
G1 X127.658 Y128.458 E-.2327
G1 X128.067 Y128.334 E-.16251
G1 X127.968 Y128.234 E-.05334
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.6 I1.217 J.01 P1  F42000
G1 X128.086 Y114.018 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.269542
G1 F2713
M204 S6000
G1 X127.884 Y113.87 E.00462
; LINE_WIDTH: 0.231316
G1 X127.553 Y113.647 E.00613
; CHANGE_LAYER
; Z_HEIGHT: 14.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X127.884 Y113.87 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 72/75
; update layer progress
M73 L72
M991 S0 P71 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z14.6 I-1.203 J-.185 P1  F42000
G1 X125.67 Y128.273 Z14.6
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2914
M204 S6000
G1 X125.609 Y128.273 E.00202
G1 F2640
G1 X125.609 Y140.727 E.41313
G1 F2914
G1 X125.67 Y140.727 E.00202
G1 X125.67 Y140.782 E.00184
G1 X125.67 Y141.182 E.01327
G1 X125.67 Y141.582 E.01327
G1 X125.67 Y142.105 E.01732
G1 X125.633 Y142.355 E.00839
G3 X124.881 Y142.394 I-.967 J-11.418 E.02499
G1 X124.881 Y113.605 E.95497
G1 X125.018 Y113.608 E.00454
G3 X125.649 Y113.646 I-.436 J12.572 E.02098
G1 X125.67 Y113.862 E.00721
G1 X125.67 Y128.213 E.47604
M204 S250
G1 X126.001 Y128.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F600
M204 S5000
G1 X126.001 Y140.335 E.35859
M106 S201.45
G1 F1174.473
M73 P95 R0
G1 X126.142 Y140.335 E.00434
G1 F2914
G1 X126.542 Y140.335 E.01229
G1 X126.942 Y140.335 E.01229
G1 X127.528 Y140.335 E.01801
G1 X127.528 Y142.193 E.05708
G1 X127.502 Y142.24 E.00167
G3 X126.769 Y142.565 I-1.085 J-1.458 E.02483
G3 X124.611 Y142.774 I-1.793 J-7.27 E.06685
G3 X124.489 Y142.59 I.089 J-.192 E.00715
G1 X124.496 Y113.35 E.89845
G3 X124.75 Y113.21 I.207 J.075 E.00973
G1 X125.031 Y113.216 E.00862
G3 X127.138 Y113.55 I-.053 J7.153 E.0658
G3 X127.528 Y113.81 I-.2 J.723 E.01464
G1 X127.528 Y128.665 E.45646
G1 X126.542 Y128.665 E.0303
G1 X126.142 Y128.665 E.01229
G1 X126.061 Y128.665 E.00249
; WIPE_START
G1 F6600
M204 S6000
G1 X126.051 Y130.665 E-.76
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


G1 X125.466 Y128.045 F42000
G1 Z14.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.186125
G1 F2914
M204 S6000
G1 X125.434 Y128.026 E.00043
; LINE_WIDTH: 0.229455
G1 X125.402 Y128.007 E.00057
; LINE_WIDTH: 0.272785
G1 X125.371 Y127.988 E.0007
; LINE_WIDTH: 0.316115
G1 X125.339 Y127.968 E.00083
; LINE_WIDTH: 0.359445
G1 X125.307 Y127.949 E.00096
; LINE_WIDTH: 0.424186
G1 X125.275 Y127.93 E.00116
G1 X125.275 Y114.015 E.43231
G1 X125.089 Y113.815 E.00848
M204 S10000
G1 X125.275 Y127.93 F42000
; LINE_WIDTH: 0.409241
G1 F2914
M204 S6000
G1 X125.26 Y128 E.00213
; LINE_WIDTH: 0.363754
G1 X125.245 Y128.069 E.00187
G1 X125.245 Y140.931 E.33624
; LINE_WIDTH: 0.378865
G1 X125.26 Y141 E.00196
; LINE_WIDTH: 0.409235
G1 X125.275 Y141.07 E.00213
; LINE_WIDTH: 0.402753
G1 X125.307 Y141.051 E.00109
; LINE_WIDTH: 0.35942
G1 X125.339 Y141.032 E.00096
; LINE_WIDTH: 0.316086
G1 X125.371 Y141.012 E.00083
; LINE_WIDTH: 0.272753
G1 X125.402 Y140.993 E.0007
; LINE_WIDTH: 0.22942
G1 X125.434 Y140.974 E.00057
; LINE_WIDTH: 0.186087
G1 X125.466 Y140.955 E.00043
M204 S10000
G1 X125.275 Y141.07 F42000
; LINE_WIDTH: 0.42442
G1 F2914
M204 S6000
G1 X125.275 Y142.174 E.03432
; WIPE_START
G1 F9436.436
G1 X125.275 Y141.07 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.696 Y142.369 Z14.8 F42000
G1 Z14.4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2914
M204 S2000
G1 X127.321 Y141.744 E.02716
G1 X127.321 Y141.211
G1 X126.038 Y142.493 E.05572
G1 X125.892 Y142.106
G1 X127.321 Y140.678 E.06208
G1 X126.923 Y140.542
G1 X126.478 Y140.987 E.01931
G1 X126.36 Y141.105
G1 X125.892 Y141.573 E.02032
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.36 Y141.105 E-.25131
G1 X126.478 Y140.987 E-.06373
G1 X126.923 Y140.542 E-.23878
G1 X127.321 Y140.678 E-.15973
G1 X127.234 Y140.764 E-.04645
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.8 I-1.213 J.097 P1  F42000
G1 X127.339 Y142.075 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.120857
G1 F2914
M204 S6000
G1 X127.172 Y142.199 E.00132
; LINE_WIDTH: 0.093942
G1 X127.128 Y142.229 E.00022
; WIPE_START
G1 F15000
G1 X127.172 Y142.199 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.251 Y134.567 Z14.8 F42000
G1 X127.321 Y127.879 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2914
M204 S2000
G1 X126.742 Y128.458 E.02512
G1 X126.478 Y128.189
G1 X127.321 Y127.346 E.0366
G1 X127.321 Y126.813
G1 X126.239 Y127.895 E.04701
G1 X125.892 Y127.708
G1 X127.321 Y126.28 E.06208
G1 X127.321 Y125.746
G1 X125.892 Y127.175 E.06208
G1 X125.892 Y126.642
G1 X127.321 Y125.213 E.06208
G1 X127.321 Y124.68
G1 X125.892 Y126.108 E.06208
G1 X125.892 Y125.575
G1 X127.321 Y124.147 E.06208
G1 X127.321 Y123.613
G1 X125.892 Y125.042 E.06208
G1 X125.892 Y124.509
G1 X127.321 Y123.08 E.06208
G1 X127.321 Y122.547
G1 X125.892 Y123.975 E.06208
G1 X125.892 Y123.442
G1 X127.321 Y122.014 E.06208
G1 X127.321 Y121.48
G1 X125.892 Y122.909 E.06208
G1 X125.892 Y122.376
G1 X127.321 Y120.947 E.06208
G1 X127.321 Y120.414
G1 X125.892 Y121.842 E.06208
G1 X125.892 Y121.309
G1 X127.321 Y119.881 E.06208
G1 X127.321 Y119.347
G1 X125.892 Y120.776 E.06208
G1 X125.892 Y120.243
G1 X127.321 Y118.814 E.06208
G1 X127.321 Y118.281
G1 X125.892 Y119.709 E.06208
G1 X125.892 Y119.176
G1 X127.321 Y117.748 E.06208
G1 X127.321 Y117.214
G1 X125.892 Y118.643 E.06208
G1 X125.892 Y118.11
G1 X127.321 Y116.681 E.06208
G1 X127.321 Y116.148
G1 X125.892 Y117.576 E.06208
G1 X125.892 Y117.043
G1 X127.321 Y115.615 E.06208
G1 X127.321 Y115.081
G1 X125.892 Y116.51 E.06208
G1 X125.892 Y115.977
G1 X127.321 Y114.548 E.06208
G1 X127.321 Y114.015
G1 X125.892 Y115.443 E.06208
G1 X125.892 Y114.91
G1 X127.059 Y113.743 E.05073
G1 X126.649 Y113.62
G1 X125.892 Y114.377 E.0329
G1 X125.891 Y113.844
G1 X126.203 Y113.532 E.01356
; CHANGE_LAYER
; Z_HEIGHT: 14.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.891 Y113.844 E-.16774
G1 X125.892 Y114.377 E-.20238
G1 X126.618 Y113.651 E-.38988
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 73/75
; update layer progress
M73 L73
M991 S0 P72 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z14.8 I-1.211 J-.122 P1  F42000
G1 X124.93 Y130.437 Z14.8
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2106
M204 S6000
G1 X125.662 Y130.437 E.02431
G1 X125.662 Y138.563 E.26955
G1 X124.93 Y138.563 E.02431
G1 X124.93 Y130.497 E.26756
; WIPE_START
G1 F8843.478
G1 X125.662 Y130.437 E-.2794
G1 X125.662 Y131.702 E-.4806
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.054 Y128.665 Z15 F42000
G1 Z14.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2106
M204 S5000
G1 X126.054 Y128.706 E.00126
G1 X126.054 Y140.294 E.35607
G1 X126.054 Y140.335 E.00126
G1 X126.782 Y140.335 E.02234
G1 X126.782 Y142.185 E.05684
G1 X126.744 Y142.252 E.00236
M73 P96 R0
G3 X125.743 Y142.628 I-1.314 J-1.974 E.03316
G3 X124.65 Y142.749 I-1.079 J-4.777 E.03384
G1 X124.64 Y142.745 E.00032
G3 X124.537 Y142.576 I.081 J-.165 E.00642
G1 X124.537 Y113.429 E.89561
G3 X124.705 Y113.241 I.181 J-.007 E.00855
G1 X124.843 Y113.249 E.00422
G3 X126.57 Y113.63 I-.219 J5.1 E.05463
G3 X126.782 Y113.81 I-.139 J.378 E.00872
G1 X126.782 Y128.665 E.45646
G1 X126.114 Y128.665 E.0205
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.054 Y128.706 E-.02761
G1 X126.054 Y130.633 E-.73239
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


G1 X125.296 Y130.641 F42000
G1 Z14.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.36866
G1 F2106
M204 S6000
G1 X125.296 Y138.359 E.20488
M204 S10000
G1 X125.246 Y138.886 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F2106
M204 S6000
G1 X125.737 Y138.842 E.01364
M204 S10000
G1 X125.378 Y138.976 F42000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2106
M204 S2000
G1 X125.847 Y139.445 E.02037
G1 X125.847 Y139.978
G1 X125.146 Y139.277 E.03048
G1 X125.146 Y139.81
G1 X125.847 Y140.512 E.03048
G1 X125.878 Y140.542
G1 X126.574 Y141.239 E.03026
G1 X126.574 Y141.772
G1 X125.146 Y140.344 E.06208
G1 X125.146 Y140.877
G1 X126.461 Y142.192 E.05716
G1 X126.072 Y142.337
G1 X125.146 Y141.41 E.04026
G1 X125.146 Y141.943
G1 X125.639 Y142.437 E.02143
M204 S10000
G1 X125.345 Y138.985 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.106758
G1 F2106
M204 S6000
G2 X125.244 Y139.05 I.672 J1.158 E.00063
; LINE_WIDTH: 0.152421
G2 X125.19 Y139.142 I.023 J.075 E.00104
G1 X125.275 Y139.148 E.00075
M204 S10000
G1 X124.926 Y138.759 F42000
; LINE_WIDTH: 0.427248
G1 F2106
M204 S6000
G1 X124.926 Y142.139 E.10586
G1 X124.905 Y142.548 E.01283
M204 S10000
G1 X124.926 Y130.241 F42000
; LINE_WIDTH: 0.428189
G1 F2106
M204 S6000
G1 X124.926 Y113.877 E.51375
G1 X124.902 Y113.452 E.01337
; WIPE_START
G1 F9344.12
G1 X124.926 Y113.877 E-.1618
G1 X124.926 Y115.451 E-.5982
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.574 Y114.576 Z15 F42000
G1 Z14.6
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2106
M204 S2000
G1 X125.544 Y113.546 E.04477
G1 X125.121 Y113.656
G1 X126.574 Y115.109 E.06313
G1 X126.574 Y115.642
G1 X125.146 Y114.214 E.06208
G1 X125.146 Y114.747
G1 X126.574 Y116.176 E.06208
G1 X126.574 Y116.709
G1 X125.146 Y115.28 E.06208
G1 X125.146 Y115.814
G1 X126.574 Y117.242 E.06208
G1 X126.574 Y117.775
G1 X125.146 Y116.347 E.06208
G1 X125.146 Y116.88
G1 X126.574 Y118.309 E.06208
G1 X126.574 Y118.842
G1 X125.146 Y117.413 E.06208
G1 X125.146 Y117.947
G1 X126.574 Y119.375 E.06208
G1 X126.574 Y119.908
G1 X125.146 Y118.48 E.06208
G1 X125.146 Y119.013
G1 X126.574 Y120.442 E.06208
G1 X126.574 Y120.975
G1 X125.146 Y119.546 E.06208
G1 X125.146 Y120.08
G1 X126.574 Y121.508 E.06208
G1 X126.574 Y122.042
G1 X125.146 Y120.613 E.06208
G1 X125.146 Y121.146
G1 X126.574 Y122.575 E.06208
G1 X126.574 Y123.108
G1 X125.146 Y121.679 E.06208
G1 X125.146 Y122.213
G1 X126.574 Y123.641 E.06208
G1 X126.574 Y124.175
G1 X125.146 Y122.746 E.06208
G1 X125.146 Y123.279
G1 X126.574 Y124.708 E.06208
G1 X126.574 Y125.241
G1 X125.146 Y123.813 E.06208
G1 X125.146 Y124.346
G1 X126.574 Y125.774 E.06208
G1 X126.574 Y126.308
G1 X125.146 Y124.879 E.06208
G1 X125.146 Y125.412
G1 X126.574 Y126.841 E.06208
G1 X126.574 Y127.374
G1 X125.146 Y125.946 E.06208
G1 X125.146 Y126.479
G1 X126.574 Y127.907 E.06208
G1 X126.574 Y128.441
G1 X125.146 Y127.012 E.06208
G1 X125.146 Y127.545
G1 X126.058 Y128.458 E.03964
G1 X125.847 Y128.78
G1 X125.146 Y128.079 E.03048
G1 X125.146 Y128.612
G1 X125.847 Y129.313 E.03048
G1 X125.847 Y129.847
G1 X125.146 Y129.145 E.03048
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.847 Y129.847 E-.37696
G1 X125.847 Y129.313 E-.20264
G1 X125.511 Y128.978 E-.1804
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.061 Y121.365 Z15 F42000
G1 X126.593 Y113.998 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0945307
G1 F2106
M204 S6000
G1 X125.906 Y113.618 E.0033
M204 S10000
G1 X126.593 Y114.071 F42000
; LINE_WIDTH: 0.336062
G1 F2106
M204 S6000
G2 X125.957 Y113.613 I-5.472 J6.922 E.01873
M204 S10000
G1 X125.765 Y130.125 F42000
; LINE_WIDTH: 0.380157
G1 F2106
M204 S6000
G3 X125.308 Y129.831 I5.347 J-8.822 E.01492
; LINE_WIDTH: 0.39056
G1 X125.221 Y129.889 E.00295
; LINE_WIDTH: 0.359747
G1 X125.134 Y129.946 E.00269
M204 S10000
G1 X125.246 Y130.114 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F2106
M204 S6000
G2 X125.743 Y130.172 I.403 J-1.307 E.01395
; CHANGE_LAYER
; Z_HEIGHT: 14.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10588.235
G1 X125.585 Y130.173 E-.23975
G1 X125.246 Y130.114 E-.52025
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 74/75
; update layer progress
M73 L74
M991 S0 P73 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z15 I-1.214 J.079 P1  F42000
G1 X126.035 Y142.185 Z15
G1 Z14.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1718
M204 S5000
G1 X126.022 Y142.223 E.00124
G3 X125.287 Y142.562 I-.977 J-1.15 E.02521
G3 X124.706 Y142.668 I-.892 J-3.259 E.01815
G1 X124.647 Y142.634 E.00209
G3 X124.589 Y142.435 I.23 J-.175 E.00652
G1 X124.589 Y113.565 E.8871
G3 X124.839 Y113.342 I.178 J-.052 E.01283
G3 X125.91 Y113.679 I-.48 J3.395 E.03464
G3 X126.035 Y113.812 I-.104 J.224 E.00575
G1 X126.035 Y142.125 E.86997
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.022 Y142.223 E-.03763
G1 X125.939 Y142.301 E-.04329
G1 X125.767 Y142.398 E-.07528
G1 X125.287 Y142.562 E-.19284
G1 X124.8 Y142.664 E-.18897
G1 X124.706 Y142.668 E-.03558
G1 X124.647 Y142.634 E-.02588
G1 X124.601 Y142.548 E-.03731
G1 X124.589 Y142.435 E-.04305
G1 X124.589 Y142.224 E-.08018
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z15.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z15.2
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
            G0 Z15.2 F4000
            G39.3 S1
            G0 Z15.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X125.828 Y141.637 F42000
G1 Z14.8
G1 E.8 F1800
; FEATURE: Top surface
G1 F1718
M204 S2000
G1 X125.065 Y142.4 E.03316
G1 X124.796 Y142.135
G1 X125.828 Y141.104 E.04482
G1 X125.828 Y140.571
G1 X124.796 Y141.602 E.04482
G1 X124.796 Y141.069
G1 X125.828 Y140.037 E.04482
G1 X125.828 Y139.504
G1 X124.796 Y140.536 E.04482
G1 X124.796 Y140.002
G1 X125.828 Y138.971 E.04482
G1 X125.828 Y138.438
G1 X124.796 Y139.469 E.04482
G1 X124.796 Y138.936
G1 X125.828 Y137.904 E.04482
G1 X125.828 Y137.371
G1 X124.796 Y138.403 E.04482
G1 X124.796 Y137.869
G1 X125.828 Y136.838 E.04482
G1 X125.828 Y136.305
G1 X124.796 Y137.336 E.04482
G1 X124.796 Y136.803
G1 X125.828 Y135.771 E.04482
G1 X125.828 Y135.238
G1 X124.796 Y136.27 E.04482
G1 X124.796 Y135.736
G1 X125.828 Y134.705 E.04482
G1 X125.828 Y134.172
G1 X124.796 Y135.203 E.04482
G1 X124.796 Y134.67
G1 X125.828 Y133.638 E.04482
G1 X125.828 Y133.105
G1 X124.796 Y134.137 E.04482
G1 X124.796 Y133.603
G1 X125.828 Y132.572 E.04482
G1 X125.828 Y132.039
M73 P97 R0
G1 X124.796 Y133.07 E.04482
G1 X124.796 Y132.537
G1 X125.828 Y131.505 E.04482
G1 X125.828 Y130.972
G1 X124.796 Y132.003 E.04482
G1 X124.796 Y131.47
G1 X125.828 Y130.439 E.04482
G1 X125.828 Y129.906
G1 X124.796 Y130.937 E.04482
G1 X124.796 Y130.404
G1 X125.828 Y129.372 E.04482
G1 X125.828 Y128.839
G1 X124.796 Y129.87 E.04482
G1 X124.796 Y129.337
G1 X125.828 Y128.306 E.04482
G1 X125.828 Y127.773
G1 X124.796 Y128.804 E.04482
G1 X124.796 Y128.271
G1 X125.828 Y127.239 E.04482
G1 X125.828 Y126.706
G1 X124.796 Y127.737 E.04482
G1 X124.796 Y127.204
G1 X125.828 Y126.173 E.04482
G1 X125.828 Y125.64
G1 X124.796 Y126.671 E.04482
G1 X124.796 Y126.138
G1 X125.828 Y125.106 E.04482
G1 X125.828 Y124.573
G1 X124.796 Y125.604 E.04482
G1 X124.796 Y125.071
G1 X125.828 Y124.04 E.04482
G1 X125.828 Y123.506
G1 X124.796 Y124.538 E.04482
G1 X124.796 Y124.005
G1 X125.828 Y122.973 E.04482
G1 X125.828 Y122.44
G1 X124.796 Y123.471 E.04482
G1 X124.796 Y122.938
G1 X125.828 Y121.907 E.04482
G1 X125.828 Y121.373
G1 X124.796 Y122.405 E.04482
G1 X124.796 Y121.872
G1 X125.828 Y120.84 E.04482
G1 X125.828 Y120.307
G1 X124.796 Y121.338 E.04482
G1 X124.796 Y120.805
G1 X125.828 Y119.774 E.04482
G1 X125.828 Y119.24
G1 X124.796 Y120.272 E.04482
G1 X124.796 Y119.739
G1 X125.828 Y118.707 E.04482
G1 X125.828 Y118.174
G1 X124.796 Y119.205 E.04482
G1 X124.796 Y118.672
G1 X125.828 Y117.641 E.04482
G1 X125.828 Y117.107
G1 X124.796 Y118.139 E.04482
G1 X124.796 Y117.606
G1 X125.828 Y116.574 E.04482
G1 X125.828 Y116.041
G1 X124.796 Y117.072 E.04482
G1 X124.796 Y116.539
G1 X125.828 Y115.508 E.04482
G1 X125.828 Y114.974
G1 X124.796 Y116.006 E.04482
G1 X124.796 Y115.473
G1 X125.828 Y114.441 E.04482
G1 X125.828 Y113.908
G1 X124.796 Y114.939 E.04482
G1 X124.796 Y114.406
G1 X125.488 Y113.715 E.03004
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.796 Y114.406 E-.37154
G1 X124.796 Y114.939 E-.20264
G1 X125.142 Y114.593 E-.18582
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.338 Y122.223 Z15.2 F42000
G1 X125.847 Y142.026 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.198964
G1 F1718
M204 S6000
G3 X125.66 Y142.166 I-2.324 J-2.893 E.00296
; LINE_WIDTH: 0.156066
G1 X125.462 Y142.3 E.00221
; CHANGE_LAYER
; Z_HEIGHT: 15
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X125.66 Y142.166 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 75/75
; update layer progress
M73 L75
M991 S0 P74 ;notify layer change
M106 S204
; OBJECT_ID: 394
M204 S250
M204 S10000
G17
G3 Z15.2 I-.179 J-1.204 P1  F42000
G1 X125.276 Y142.223 Z15.2
M204 S10000
G1 Z15
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X124.746 Y142.49 I-.684 J-.7 E.01851
G1 X124.72 Y142.466 E.00109
G3 X124.664 Y142.195 I.43 J-.229 E.00863
G1 X124.664 Y113.805 E.87233
G3 X124.754 Y113.507 I.304 J-.071 E.01
G1 X124.765 Y113.506 E.00033
G1 X124.769 Y113.506 E.00013
G3 X125.288 Y113.801 I-.185 J.929 E.01865
G1 X125.289 Y142.165 E.87155
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.222 Y142.279 E-.0501
G1 X125.074 Y142.372 E-.06653
G1 X124.787 Y142.49 E-.11761
G1 X124.746 Y142.49 E-.01556
G1 X124.72 Y142.466 E-.01346
G1 X124.679 Y142.36 E-.04309
G1 X124.664 Y142.195 E-.06316
G1 X124.664 Y141.167 E-.39049
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z15.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z15.4
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
            G0 Z15.4 F4000
            G39.3 S1
            G0 Z15.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X125.032 Y142.101 F42000
G1 Z15
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.275179
G1 F1200
M204 S6000
G1 X124.977 Y142.068 E.00122
G1 X124.965 Y113.912 E.53289
; LINE_WIDTH: 0.236713
G1 X124.869 Y113.748 E.003
; WIPE_START
G1 F15000
G1 X124.965 Y113.912 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.984 Y121.544 Z15.4 F42000
G1 X125.032 Y142.101 Z15.4
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.232663
G1 F1200
M204 S6000
G1 X125.088 Y142.133 E.001
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F15000
G1 X125.032 Y142.101 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z15.4 I1.217 J0 P1  F42000
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
G1 Z15.4 F900 ; lower z a little
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

    G1 Z115 F600
    G1 Z113

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

