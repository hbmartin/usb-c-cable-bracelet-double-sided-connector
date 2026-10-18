; HEADER_BLOCK_START
; BambuStudio 02.08.02.61
; model printing time: 17m 55s; total estimated time: 24m 12s
; total layer number: 42
; total filament length [mm] : 2135.26
; total filament volume [cm^3] : 5135.90
; total filament weight [g] : 6.37
; model label id: 394,405,416
; object max height: 8.40,8.40,8.40
; filament_density: 1.24
; filament_diameter: 1.75
; max_z_height: 8.40
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
; bottom_shell_layers = 3
; bottom_shell_thickness = 0
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
; different_settings_to_system = ;;
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
; skeleton_infill_density = 15%
; skeleton_infill_line_width = 0.45
; skin_infill_density = 15%
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
; sparse_infill_density = 15%
; sparse_infill_filament = 0
; sparse_infill_lattice_angle_1 = -45
; sparse_infill_lattice_angle_2 = 45
; sparse_infill_line_width = 0.45
; sparse_infill_pattern = grid
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
; wall_loops = 2
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
M73 P0 R24
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
M73 P2 R23
G1 E-0.5 F300

G1 X-28.5 F30000
M73 P3 R23
G1 X-48.2 F3000
M73 P4 R23
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
M73 P5 R22
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
    
M73 P6 R22
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
M73 P24 R18
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
M73 P25 R18
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
    G29 A1 X80 Y119.5 I96 J17
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
; layer num/total_layer_count: 1/42
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X175.034 Y135.146 F42000
M204 S6000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G3 X174.381 Y135.582 I-.639 J-.251 E.03115
G1 X153.51 Y135.576 E.77737
G3 X152.918 Y134.881 I.091 J-.677 E.03725
G1 X152.918 Y121.119 E.51257
M73 P25 R17
G3 X153.619 Y120.418 I.687 J-.014 E.04129
G1 X154.096 Y120.418 E.01775
G1 X174.399 Y120.418 E.75623
G3 X175.081 Y121.067 I-.009 J.692 E.03852
G1 X175.081 Y134.933 E.51649
G3 X175.054 Y135.09 I-.686 J-.038 E.00592
M204 S6000
G1 X175.457 Y135.319 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X174.392 Y136.039 I-1.065 J-.426 E.05086
G1 X153.608 Y136.039 E.77412
G3 X152.461 Y134.892 I-.004 J-1.144 E.06719
G1 X152.461 Y121.108 E.5134
G3 X153.608 Y119.961 I1.144 J-.004 E.06719
G1 X154.096 Y119.961 E.01817
G1 X174.412 Y119.961 E.75668
G3 X175.538 Y121.044 I-.026 J1.154 E.06392
G1 X175.538 Y134.956 E.51816
G3 X175.478 Y135.262 I-1.146 J-.064 E.01166
; WIPE_START
G1 X175.347 Y135.533 E-.11419
G1 X175.205 Y135.705 E-.08487
G1 X174.997 Y135.87 E-.10073
G1 X174.835 Y135.953 E-.06923
G1 X174.563 Y136.027 E-.10722
G1 X174.392 Y136.039 E-.06525
M73 P26 R17
G1 X173.817 Y136.039 E-.2185
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
G1 X174.898 Y121.19 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50667
G1 F6300
M204 S500
G2 X174.569 Y120.864 I-1.809 J1.497 E.01751
G2 X174.37 Y120.807 I-.195 J.301 E.00793
G1 X173.859 Y120.807 E.01933
G1 X174.692 Y121.64 E.04453
G1 X174.692 Y122.296 E.02478
G1 X173.203 Y120.807 E.07958
G1 X172.547 Y120.807 E.02478
G1 X174.692 Y122.952 E.11463
G1 X174.692 Y123.607 E.02478
G1 X171.891 Y120.807 E.14968
G1 X171.235 Y120.807 E.02478
G1 X174.692 Y124.263 E.18473
G1 X174.692 Y124.919 E.02478
G1 X170.58 Y120.807 E.21978
G1 X169.924 Y120.807 E.02478
G1 X174.692 Y125.575 E.25483
G1 X174.692 Y126.231 E.02478
G1 X169.268 Y120.807 E.28989
G1 X168.612 Y120.807 E.02478
G1 X174.692 Y126.887 E.32494
G1 X174.692 Y127.542 E.02478
G1 X167.956 Y120.806 E.35999
G1 X167.3 Y120.806 E.02478
G1 X174.692 Y128.198 E.39504
G1 X174.692 Y128.854 E.02478
G1 X166.644 Y120.806 E.43009
G1 X165.989 Y120.806 E.02478
G1 X174.692 Y129.51 E.46514
G1 X174.692 Y130.166 E.02478
G1 X165.333 Y120.806 E.50019
G1 X164.677 Y120.806 E.02478
G1 X174.692 Y130.822 E.53524
G1 X174.692 Y131.477 E.02478
G1 X164.021 Y120.806 E.57029
G1 X163.365 Y120.806 E.02478
G1 X174.692 Y132.133 E.60534
G1 X174.692 Y132.789 E.02478
G1 X162.709 Y120.806 E.64039
G1 X162.053 Y120.806 E.02478
G1 X174.692 Y133.445 E.67545
G1 X174.692 Y134.101 E.02478
G1 X161.398 Y120.806 E.7105
G1 X160.742 Y120.806 E.02478
G1 X174.692 Y134.757 E.74555
G3 X174.461 Y135.182 I-.34 J.091 E.02015
G1 X160.086 Y120.806 E.76826
G1 X159.43 Y120.806 E.02478
G1 X173.818 Y135.194 E.76891
G1 X173.162 Y135.194 E.02478
G1 X158.774 Y120.806 E.76891
G1 X158.118 Y120.806 E.02478
G1 X172.506 Y135.194 E.76891
G1 X171.85 Y135.194 E.02478
G1 X157.462 Y120.806 E.76891
G1 X156.807 Y120.806 E.02478
G1 X171.194 Y135.194 E.76891
G1 X170.538 Y135.194 E.02478
G1 X156.151 Y120.806 E.76892
G1 X155.495 Y120.806 E.02478
G1 X169.883 Y135.194 E.76892
G1 X169.227 Y135.194 E.02478
G1 X154.839 Y120.806 E.76892
G1 X154.183 Y120.806 E.02478
G1 X168.571 Y135.194 E.76892
G1 X167.915 Y135.194 E.02478
G1 X153.538 Y120.817 E.76836
G2 X153.311 Y121.072 I.105 J.322 E.01352
G1 X153.311 Y121.245 E.00656
G1 X167.259 Y135.194 E.74544
G1 X166.603 Y135.194 E.02478
G1 X153.311 Y121.901 E.7104
G1 X153.31 Y122.557 E.02478
G1 X165.947 Y135.194 E.67536
G1 X165.292 Y135.194 E.02478
G1 X153.31 Y123.212 E.64033
G1 X153.31 Y123.868 E.02478
G1 X164.636 Y135.194 E.60529
G1 X163.98 Y135.194 E.02478
G1 X153.31 Y124.524 E.57025
G1 X153.309 Y125.179 E.02478
G1 X163.324 Y135.194 E.53521
G1 X162.668 Y135.194 E.02478
G1 X153.309 Y125.835 E.50017
G1 X153.309 Y126.49 E.02478
G1 X162.012 Y135.194 E.46514
M73 P27 R17
G1 X161.357 Y135.194 E.02478
G1 X153.309 Y127.146 E.4301
G1 X153.309 Y127.802 E.02478
G1 X160.701 Y135.194 E.39506
G1 X160.045 Y135.194 E.02478
G1 X153.308 Y128.457 E.36002
G1 X153.308 Y129.113 E.02478
G1 X159.389 Y135.194 E.32498
G1 X158.733 Y135.194 E.02478
G1 X153.308 Y129.769 E.28994
G1 X153.308 Y130.424 E.02478
G1 X158.077 Y135.194 E.25491
G1 X157.422 Y135.194 E.02478
G1 X153.307 Y131.08 E.21987
G1 X153.307 Y131.735 E.02478
G1 X156.766 Y135.194 E.18483
G1 X156.11 Y135.194 E.02478
G1 X153.307 Y132.391 E.14979
G1 X153.307 Y133.047 E.02478
G1 X155.454 Y135.194 E.11475
G1 X154.798 Y135.194 E.02478
G1 X153.307 Y133.702 E.07972
G1 X153.306 Y134.358 E.02478
G1 X154.142 Y135.194 E.04468
G3 X153.538 Y135.182 I-.25 J-2.614 E.02287
G3 X153.418 Y135.126 I.042 J-.247 E.00508
G1 X153.1 Y134.808 E.01699
; OBJECT_ID: 405
; WIPE_START
G1 X153.418 Y135.126 E-.1708
G1 X153.538 Y135.182 E-.05042
G1 X154.142 Y135.194 E-.2295
G1 X153.567 Y134.618 E-.30928
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S6000
G1 X145.939 Y134.896 Z.6 F42000
G1 X139.034 Y135.146 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G3 X138.381 Y135.582 I-.639 J-.251 E.03115
G1 X117.51 Y135.576 E.77737
G3 X116.918 Y134.881 I.091 J-.677 E.03725
G1 X116.918 Y121.119 E.51257
G3 X117.619 Y120.418 I.687 J-.014 E.04129
G1 X118.096 Y120.418 E.01775
G1 X138.399 Y120.418 E.75623
G3 X139.081 Y121.067 I-.009 J.692 E.03852
G1 X139.081 Y134.933 E.51649
G3 X139.054 Y135.09 I-.686 J-.038 E.00592
M204 S6000
G1 X139.457 Y135.319 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X138.392 Y136.039 I-1.065 J-.426 E.05086
G1 X117.608 Y136.039 E.77412
G3 X116.461 Y134.892 I-.004 J-1.144 E.06719
G1 X116.461 Y121.108 E.5134
G3 X117.608 Y119.961 I1.144 J-.004 E.06719
G1 X118.096 Y119.961 E.01817
G1 X138.412 Y119.961 E.75668
G3 X139.538 Y121.044 I-.026 J1.154 E.06392
G1 X139.538 Y134.956 E.51816
G3 X139.478 Y135.262 I-1.146 J-.064 E.01166
; WIPE_START
G1 X139.347 Y135.533 E-.11419
G1 X139.205 Y135.705 E-.08487
G1 X138.997 Y135.87 E-.10073
G1 X138.835 Y135.953 E-.06923
G1 X138.563 Y136.027 E-.10722
G1 X138.392 Y136.039 E-.06525
G1 X137.817 Y136.039 E-.2185
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X138.371 Y128.427 Z.6 F42000
G1 X138.898 Y121.19 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50667
G1 F6300
M204 S500
G2 X138.569 Y120.864 I-1.809 J1.497 E.01751
G2 X138.37 Y120.807 I-.195 J.301 E.00793
G1 X137.859 Y120.807 E.01933
G1 X138.692 Y121.64 E.04453
G1 X138.692 Y122.296 E.02478
G1 X137.203 Y120.807 E.07958
G1 X136.547 Y120.807 E.02478
G1 X138.692 Y122.952 E.11463
G1 X138.692 Y123.607 E.02478
G1 X135.891 Y120.807 E.14968
G1 X135.235 Y120.807 E.02478
G1 X138.692 Y124.263 E.18473
G1 X138.692 Y124.919 E.02478
G1 X134.58 Y120.807 E.21978
G1 X133.924 Y120.807 E.02478
G1 X138.692 Y125.575 E.25483
G1 X138.692 Y126.231 E.02478
G1 X133.268 Y120.807 E.28989
G1 X132.612 Y120.807 E.02478
G1 X138.692 Y126.887 E.32494
G1 X138.692 Y127.542 E.02478
G1 X131.956 Y120.806 E.35999
G1 X131.3 Y120.806 E.02478
G1 X138.692 Y128.198 E.39504
G1 X138.692 Y128.854 E.02478
G1 X130.644 Y120.806 E.43009
G1 X129.989 Y120.806 E.02478
G1 X138.692 Y129.51 E.46514
G1 X138.692 Y130.166 E.02478
G1 X129.333 Y120.806 E.50019
G1 X128.677 Y120.806 E.02478
G1 X138.692 Y130.822 E.53524
G1 X138.692 Y131.477 E.02478
G1 X128.021 Y120.806 E.57029
G1 X127.365 Y120.806 E.02478
G1 X138.692 Y132.133 E.60534
G1 X138.692 Y132.789 E.02478
G1 X126.709 Y120.806 E.64039
G1 X126.053 Y120.806 E.02478
G1 X138.692 Y133.445 E.67545
G1 X138.692 Y134.101 E.02478
G1 X125.398 Y120.806 E.7105
G1 X124.742 Y120.806 E.02478
G1 X138.692 Y134.757 E.74555
G3 X138.461 Y135.182 I-.34 J.091 E.02015
G1 X124.086 Y120.806 E.76826
G1 X123.43 Y120.806 E.02478
G1 X137.818 Y135.194 E.76891
G1 X137.162 Y135.194 E.02478
G1 X122.774 Y120.806 E.76891
G1 X122.118 Y120.806 E.02478
G1 X136.506 Y135.194 E.76891
G1 X135.85 Y135.194 E.02478
M73 P28 R17
G1 X121.462 Y120.806 E.76891
G1 X120.807 Y120.806 E.02478
G1 X135.194 Y135.194 E.76891
G1 X134.538 Y135.194 E.02478
G1 X120.151 Y120.806 E.76892
G1 X119.495 Y120.806 E.02478
G1 X133.883 Y135.194 E.76892
G1 X133.227 Y135.194 E.02478
G1 X118.839 Y120.806 E.76892
G1 X118.183 Y120.806 E.02478
G1 X132.571 Y135.194 E.76892
G1 X131.915 Y135.194 E.02478
G1 X117.538 Y120.817 E.76836
G2 X117.311 Y121.072 I.105 J.322 E.01352
G1 X117.311 Y121.245 E.00656
G1 X131.259 Y135.194 E.74544
G1 X130.603 Y135.194 E.02478
G1 X117.311 Y121.901 E.7104
G1 X117.31 Y122.557 E.02478
G1 X129.947 Y135.194 E.67536
G1 X129.292 Y135.194 E.02478
G1 X117.31 Y123.212 E.64033
G1 X117.31 Y123.868 E.02478
G1 X128.636 Y135.194 E.60529
G1 X127.98 Y135.194 E.02478
G1 X117.31 Y124.524 E.57025
G1 X117.309 Y125.179 E.02478
G1 X127.324 Y135.194 E.53521
G1 X126.668 Y135.194 E.02478
G1 X117.309 Y125.835 E.50017
G1 X117.309 Y126.49 E.02478
G1 X126.012 Y135.194 E.46514
G1 X125.357 Y135.194 E.02478
G1 X117.309 Y127.146 E.4301
G1 X117.309 Y127.802 E.02478
G1 X124.701 Y135.194 E.39506
G1 X124.045 Y135.194 E.02478
G1 X117.308 Y128.457 E.36002
G1 X117.308 Y129.113 E.02478
G1 X123.389 Y135.194 E.32498
G1 X122.733 Y135.194 E.02478
G1 X117.308 Y129.769 E.28994
G1 X117.308 Y130.424 E.02478
G1 X122.077 Y135.194 E.25491
G1 X121.422 Y135.194 E.02478
G1 X117.307 Y131.08 E.21987
G1 X117.307 Y131.735 E.02478
G1 X120.766 Y135.194 E.18483
G1 X120.11 Y135.194 E.02478
G1 X117.307 Y132.391 E.14979
G1 X117.307 Y133.047 E.02478
G1 X119.454 Y135.194 E.11475
G1 X118.798 Y135.194 E.02478
G1 X117.307 Y133.702 E.07972
G1 X117.306 Y134.358 E.02478
G1 X118.142 Y135.194 E.04468
G3 X117.538 Y135.182 I-.25 J-2.614 E.02287
G3 X117.418 Y135.126 I.042 J-.247 E.00508
G1 X117.1 Y134.808 E.01699
; OBJECT_ID: 394
; WIPE_START
G1 X117.418 Y135.126 E-.1708
G1 X117.538 Y135.182 E-.05042
G1 X118.142 Y135.194 E-.2295
G1 X117.567 Y134.618 E-.30928
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S6000
G1 X109.939 Y134.896 Z.6 F42000
G1 X103.034 Y135.146 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G3 X102.381 Y135.582 I-.639 J-.251 E.03115
G1 X81.51 Y135.576 E.77737
G3 X80.918 Y134.881 I.091 J-.677 E.03725
G1 X80.918 Y121.119 E.51257
G3 X81.619 Y120.418 I.687 J-.014 E.04129
G1 X82.096 Y120.418 E.01775
G1 X102.399 Y120.418 E.75623
G3 X103.081 Y121.067 I-.009 J.692 E.03852
G1 X103.081 Y134.933 E.51649
G3 X103.054 Y135.09 I-.686 J-.038 E.00592
M204 S6000
G1 X103.463 Y135.305 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X103.457 Y135.319 E.00054
G3 X102.392 Y136.039 I-1.065 J-.426 E.05086
G1 X81.608 Y136.039 E.77412
G3 X80.461 Y134.892 I-.004 J-1.144 E.06719
G1 X80.461 Y121.108 E.5134
G3 X81.608 Y119.961 I1.144 J-.004 E.06719
G1 X82.096 Y119.961 E.01817
G1 X102.412 Y119.961 E.75668
G3 X103.538 Y121.044 I-.026 J1.154 E.06392
G1 X103.538 Y134.956 E.51816
G3 X103.503 Y135.18 I-1.146 J-.064 E.00848
G1 X103.481 Y135.248 E.00265
; WIPE_START
G1 X103.457 Y135.319 E-.02827
G1 X103.347 Y135.533 E-.09152
G1 X103.205 Y135.705 E-.08487
M73 P29 R17
G1 X102.997 Y135.87 E-.10073
G1 X102.835 Y135.953 E-.06923
G1 X102.563 Y136.027 E-.10722
G1 X102.392 Y136.039 E-.06525
G1 X101.832 Y136.039 E-.21291
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X102.378 Y128.427 Z.6 F42000
G1 X102.898 Y121.19 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50667
G1 F6300
M204 S500
G2 X102.569 Y120.864 I-1.809 J1.497 E.01751
G2 X102.37 Y120.807 I-.195 J.301 E.00793
G1 X101.859 Y120.807 E.01933
G1 X102.692 Y121.64 E.04453
G1 X102.692 Y122.296 E.02478
G1 X101.203 Y120.807 E.07958
G1 X100.547 Y120.807 E.02478
G1 X102.692 Y122.952 E.11463
G1 X102.692 Y123.607 E.02478
G1 X99.891 Y120.807 E.14968
G1 X99.235 Y120.807 E.02478
G1 X102.692 Y124.263 E.18473
G1 X102.692 Y124.919 E.02478
G1 X98.58 Y120.807 E.21978
G1 X97.924 Y120.807 E.02478
G1 X102.692 Y125.575 E.25483
G1 X102.692 Y126.231 E.02478
G1 X97.268 Y120.807 E.28989
G1 X96.612 Y120.807 E.02478
G1 X102.692 Y126.887 E.32494
G1 X102.692 Y127.542 E.02478
G1 X95.956 Y120.806 E.35999
G1 X95.3 Y120.806 E.02478
G1 X102.692 Y128.198 E.39504
G1 X102.692 Y128.854 E.02478
G1 X94.644 Y120.806 E.43009
G1 X93.989 Y120.806 E.02478
G1 X102.692 Y129.51 E.46514
G1 X102.692 Y130.166 E.02478
G1 X93.333 Y120.806 E.50019
G1 X92.677 Y120.806 E.02478
G1 X102.692 Y130.822 E.53524
G1 X102.692 Y131.477 E.02478
G1 X92.021 Y120.806 E.57029
G1 X91.365 Y120.806 E.02478
G1 X102.692 Y132.133 E.60534
G1 X102.692 Y132.789 E.02478
G1 X90.709 Y120.806 E.64039
G1 X90.053 Y120.806 E.02478
G1 X102.692 Y133.445 E.67545
G1 X102.692 Y134.101 E.02478
G1 X89.398 Y120.806 E.7105
G1 X88.742 Y120.806 E.02478
G1 X102.692 Y134.757 E.74555
G3 X102.461 Y135.182 I-.34 J.091 E.02015
G1 X88.086 Y120.806 E.76826
G1 X87.43 Y120.806 E.02478
G1 X101.818 Y135.194 E.76891
G1 X101.162 Y135.194 E.02478
G1 X86.774 Y120.806 E.76891
G1 X86.118 Y120.806 E.02478
G1 X100.506 Y135.194 E.76891
G1 X99.85 Y135.194 E.02478
G1 X85.462 Y120.806 E.76891
G1 X84.807 Y120.806 E.02478
G1 X99.194 Y135.194 E.76891
G1 X98.538 Y135.194 E.02478
G1 X84.151 Y120.806 E.76892
G1 X83.495 Y120.806 E.02478
G1 X97.883 Y135.194 E.76892
G1 X97.227 Y135.194 E.02478
G1 X82.839 Y120.806 E.76892
G1 X82.183 Y120.806 E.02478
G1 X96.571 Y135.194 E.76892
G1 X95.915 Y135.194 E.02478
G1 X81.538 Y120.817 E.76836
G2 X81.311 Y121.072 I.105 J.322 E.01352
G1 X81.311 Y121.245 E.00656
G1 X95.259 Y135.194 E.74544
G1 X94.603 Y135.194 E.02478
G1 X81.311 Y121.901 E.7104
G1 X81.31 Y122.557 E.02478
G1 X93.947 Y135.194 E.67536
G1 X93.292 Y135.194 E.02478
G1 X81.31 Y123.212 E.64033
G1 X81.31 Y123.868 E.02478
G1 X92.636 Y135.194 E.60529
G1 X91.98 Y135.194 E.02478
G1 X81.31 Y124.524 E.57025
G1 X81.309 Y125.179 E.02478
G1 X91.324 Y135.194 E.53521
M73 P29 R16
G1 X90.668 Y135.194 E.02478
G1 X81.309 Y125.835 E.50017
G1 X81.309 Y126.49 E.02478
G1 X90.012 Y135.194 E.46514
G1 X89.357 Y135.194 E.02478
G1 X81.309 Y127.146 E.4301
G1 X81.309 Y127.802 E.02478
G1 X88.701 Y135.194 E.39506
G1 X88.045 Y135.194 E.02478
G1 X81.308 Y128.457 E.36002
G1 X81.308 Y129.113 E.02478
G1 X87.389 Y135.194 E.32498
G1 X86.733 Y135.194 E.02478
G1 X81.308 Y129.769 E.28994
G1 X81.308 Y130.424 E.02478
M73 P30 R16
G1 X86.077 Y135.194 E.25491
G1 X85.422 Y135.194 E.02478
G1 X81.307 Y131.08 E.21987
G1 X81.307 Y131.735 E.02478
G1 X84.766 Y135.194 E.18483
G1 X84.11 Y135.194 E.02478
G1 X81.307 Y132.391 E.14979
G1 X81.307 Y133.047 E.02478
G1 X83.454 Y135.194 E.11475
G1 X82.798 Y135.194 E.02478
G1 X81.307 Y133.702 E.07972
G1 X81.306 Y134.358 E.02478
G1 X82.142 Y135.194 E.04468
G3 X81.538 Y135.182 I-.25 J-2.614 E.02287
G3 X81.418 Y135.126 I.042 J-.247 E.00508
G1 X81.1 Y134.808 E.01699
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6300
G1 X81.418 Y135.126 E-.1708
G1 X81.538 Y135.182 E-.05042
G1 X82.142 Y135.194 E-.2295
G1 X81.567 Y134.618 E-.30928
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 2/42
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S191.25
; open powerlost recovery
M1003 S1
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z.6 I-.02 J1.217 P1  F42000
G1 X153.148 Y135.769 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X153.052 Y135.717 E.00361
G3 X152.615 Y134.885 I.552 J-.822 E.03247
G1 X152.615 Y121.114 E.45681
G3 X153.615 Y120.115 I.99 J-.009 E.05223
G1 X174.396 Y120.115 E.68935
G3 X175.383 Y121.052 I-.009 J.998 E.04967
G1 X175.383 Y134.948 E.46098
G3 X174.385 Y135.885 I-.996 J-.062 E.05003
G1 X153.614 Y135.885 E.68901
G3 X153.23 Y135.812 I-.009 J-.99 E.01306
G1 X153.201 Y135.796 E.00108
M204 S250
G1 X152.963 Y136.115 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4800
M204 S5000
G3 X152.304 Y135.365 I.678 J-1.26 E.03132
G1 F5438.175
G1 X152.266 Y135.242 E.00396
G1 F4800
G1 X152.25 Y135.17 E.00227
G1 F5479.933
G1 X152.23 Y135.035 E.00421
G1 F4800
G3 X152.223 Y134.295 I7.519 J-.44 E.02275
G1 X152.223 Y121.705 E.38686
G3 X152.264 Y120.765 I3.862 J-.3 E.02896
G1 F5484.582
G1 X152.304 Y120.634 E.00424
G1 F4800
G3 X152.418 Y120.394 I1.78 J.695 E.00815
G1 F5700
G3 X152.78 Y119.994 I1.569 J1.057 E.01663
G1 F4800
G3 X153.134 Y119.804 I1.019 J1.477 E.01239
G1 F5481.255
G1 X153.266 Y119.764 E.00422
G1 F4800
G3 X154.205 Y119.723 I.639 J3.824 E.02897
G1 X174.406 Y119.723 E.62072
G3 X175.464 Y120.226 I-.014 J1.393 E.03717
G1 F5700
G3 X175.669 Y120.565 I-1.215 J.964 E.0122
G1 F4800
G3 X175.775 Y121.032 I-1.903 J.679 E.01475
G1 X175.775 Y134.968 E.42819
G3 X175.736 Y135.234 I-1.376 J-.068 E.0083
G1 F5484.582
G1 X175.696 Y135.366 E.00424
G1 F4800
G3 X175.582 Y135.606 I-1.78 J-.695 E.00815
G1 F5700
G3 X175.22 Y136.006 I-1.569 J-1.057 E.01663
G1 F4800
G3 X174.866 Y136.196 I-1.019 J-1.477 E.01239
G1 F5481.255
G1 X174.734 Y136.236 E.00422
G1 F4800
G3 X173.795 Y136.277 I-.639 J-3.824 E.02897
G1 X154.205 Y136.277 E.60195
G3 X153.265 Y136.236 I-.3 J-3.861 E.02897
G3 X153.016 Y136.142 I.375 J-1.38 E.00819
; WIPE_START
M204 S6000
G1 X152.726 Y135.964 E-.12921
G1 X152.495 Y135.722 E-.1271
G1 X152.387 Y135.551 E-.07711
G1 X152.304 Y135.365 E-.07723
G1 X152.266 Y135.242 E-.04895
G1 X152.25 Y135.17 E-.02801
G1 X152.23 Y135.035 E-.05205
G1 X152.224 Y134.455 E-.22034
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 416
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
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X153.496 Y120.287 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42178
G1 F9502.19
M204 S6000
G1 X153.12 Y120.663 E.01641
G1 X153.03 Y120.789 E.00477
G2 X152.948 Y121.371 I1.133 J.457 E.01834
G1 X153.871 Y120.448 E.0403
G1 X154.407 Y120.448 E.01654
G1 X152.948 Y121.907 E.06369
G1 X152.948 Y122.443 E.01654
G1 X154.943 Y120.448 E.08708
G1 X155.478 Y120.448 E.01654
G1 X152.948 Y122.978 E.11048
G1 X152.948 Y123.514 E.01654
G1 X156.014 Y120.448 E.13387
G1 X156.55 Y120.448 E.01654
G1 X152.948 Y124.05 E.15726
G1 X152.948 Y124.586 E.01654
G1 X157.086 Y120.448 E.18065
G1 X157.622 Y120.448 E.01654
G1 X152.948 Y125.122 E.20405
G1 X152.948 Y125.657 E.01654
G1 X158.157 Y120.448 E.22744
G1 X158.693 Y120.448 E.01654
G1 X152.948 Y126.193 E.25083
G1 X152.948 Y126.729 E.01654
G1 X159.229 Y120.448 E.27422
G1 X159.765 Y120.448 E.01654
G1 X152.948 Y127.265 E.29761
G1 X152.948 Y127.801 E.01654
G1 X160.3 Y120.448 E.32101
G1 X160.836 Y120.448 E.01654
G1 X152.948 Y128.336 E.3444
G1 X152.948 Y128.872 E.01654
G1 X161.372 Y120.448 E.36779
G1 X161.908 Y120.448 E.01654
G1 X152.948 Y129.408 E.39118
G1 X152.948 Y129.944 E.01654
G1 X162.444 Y120.448 E.41458
G1 X162.979 Y120.448 E.01654
G1 X152.948 Y130.48 E.43797
G1 X152.948 Y131.015 E.01654
G1 X163.515 Y120.448 E.46136
G1 X164.051 Y120.448 E.01654
G1 X152.948 Y131.551 E.48475
G1 X152.948 Y132.087 E.01654
G1 X164.587 Y120.448 E.50814
G1 X165.123 Y120.448 E.01654
G1 X152.948 Y132.623 E.53154
G1 X152.948 Y133.158 E.01654
G1 X165.658 Y120.448 E.55493
G1 X166.194 Y120.448 E.01654
G1 X152.948 Y133.694 E.57832
G1 X152.948 Y134.23 E.01654
G1 X166.73 Y120.448 E.60171
G1 X167.266 Y120.448 E.01654
G1 X152.948 Y134.766 E.62511
G2 X153.039 Y135.21 I.875 J.052 E.01417
G1 X167.801 Y120.448 E.64451
G1 X168.337 Y120.448 E.01654
G1 X153.308 Y135.478 E.6562
G2 X153.769 Y135.552 I.4 J-1.019 E.01455
G1 X168.873 Y120.448 E.65942
G1 X169.409 Y120.448 E.01654
G1 X154.305 Y135.552 E.65942
G1 X154.841 Y135.552 E.01654
G1 X169.945 Y120.448 E.65942
G1 X170.48 Y120.448 E.01654
G1 X155.377 Y135.552 E.65942
G1 X155.913 Y135.552 E.01654
G1 X171.016 Y120.448 E.65942
G1 X171.552 Y120.448 E.01654
G1 X156.448 Y135.552 E.65942
G1 X156.984 Y135.552 E.01654
G1 X172.088 Y120.448 E.65942
G1 X172.623 Y120.448 E.01654
G1 X157.52 Y135.552 E.65942
G1 X158.056 Y135.552 E.01654
G1 X173.159 Y120.448 E.65942
G1 X173.695 Y120.448 E.01654
G1 X158.591 Y135.552 E.65942
G1 X159.127 Y135.552 E.01654
G1 X174.231 Y120.448 E.65942
G3 X174.692 Y120.523 I.074 J1.001 E.01455
G1 X159.663 Y135.552 E.65616
G1 X160.199 Y135.552 E.01654
G1 X174.965 Y120.786 E.6447
G3 X175.05 Y121.237 I-.889 J.401 E.0143
G1 X160.735 Y135.552 E.62501
G1 X161.27 Y135.552 E.01654
G1 X175.05 Y121.772 E.60162
G1 X175.05 Y122.308 E.01654
G1 X161.806 Y135.552 E.57822
G1 X162.342 Y135.552 E.01654
G1 X175.05 Y122.844 E.55483
G1 X175.05 Y123.38 E.01654
G1 X162.878 Y135.552 E.53144
G1 X163.414 Y135.552 E.01654
G1 X175.05 Y123.915 E.50805
G1 X175.05 Y124.451 E.01654
G1 X163.949 Y135.552 E.48465
G1 X164.485 Y135.552 E.01654
M73 P31 R16
G1 X175.05 Y124.987 E.46126
G1 X175.05 Y125.523 E.01654
G1 X165.021 Y135.552 E.43787
G1 X165.557 Y135.552 E.01654
G1 X175.05 Y126.059 E.41448
G1 X175.05 Y126.594 E.01654
G1 X166.093 Y135.552 E.39108
G1 X166.628 Y135.552 E.01654
G1 X175.05 Y127.13 E.36769
G1 X175.05 Y127.666 E.01654
G1 X167.164 Y135.552 E.3443
G1 X167.7 Y135.552 E.01654
G1 X175.05 Y128.202 E.32091
G1 X175.05 Y128.738 E.01654
G1 X168.236 Y135.552 E.29751
G1 X168.771 Y135.552 E.01654
G1 X175.05 Y129.273 E.27412
G1 X175.05 Y129.809 E.01654
G1 X169.307 Y135.552 E.25073
G1 X169.843 Y135.552 E.01654
G1 X175.05 Y130.345 E.22734
G1 X175.05 Y130.881 E.01654
G1 X170.379 Y135.552 E.20394
G1 X170.915 Y135.552 E.01654
G1 X175.05 Y131.417 E.18055
G1 X175.05 Y131.952 E.01654
G1 X171.45 Y135.552 E.15716
G1 X171.986 Y135.552 E.01654
G1 X175.05 Y132.488 E.13377
G1 X175.05 Y133.024 E.01654
G1 X172.522 Y135.552 E.11037
G1 X173.058 Y135.552 E.01654
G1 X175.05 Y133.56 E.08698
G1 X175.05 Y134.095 E.01654
G1 X173.594 Y135.552 E.06359
G1 X174.129 Y135.552 E.01654
G1 X175.05 Y134.631 E.0402
G3 X174.879 Y135.338 I-.941 J.146 E.02305
G1 X174.504 Y135.713 E.01634
; OBJECT_ID: 405
; WIPE_START
G1 X174.879 Y135.338 E-.2011
G1 X174.97 Y135.211 E-.05946
G1 X175.031 Y135.053 E-.06432
G1 X175.05 Y134.924 E-.04978
G1 X175.05 Y134.631 E-.11115
G1 X174.54 Y135.141 E-.27418
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X166.908 Y135.236 Z.8 F42000
G1 X117.369 Y135.85 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X117.23 Y135.812 E.0048
G3 X116.615 Y134.885 I.375 J-.916 E.03916
G1 X116.615 Y121.114 E.45681
G3 X117.615 Y120.115 I.99 J-.009 E.05223
G1 X138.396 Y120.115 E.68935
G3 X139.383 Y121.052 I-.009 J.998 E.04967
G1 X139.383 Y134.948 E.46098
G3 X138.385 Y135.885 I-.996 J-.062 E.05003
G1 X117.614 Y135.885 E.68901
G3 X117.461 Y135.875 I-.009 J-.99 E.0051
G1 X117.427 Y135.866 E.00116
M204 S250
G1 X117.265 Y136.236 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4800
M204 S5000
G3 X116.304 Y135.365 I.375 J-1.38 E.04135
G1 F5438.175
G1 X116.266 Y135.242 E.00396
G1 F4800
G1 X116.25 Y135.17 E.00227
G1 F5479.933
G1 X116.23 Y135.035 E.00421
G1 F4800
G3 X116.223 Y134.295 I7.519 J-.44 E.02275
G1 X116.223 Y121.705 E.38686
G3 X116.264 Y120.765 I3.862 J-.3 E.02896
G1 F5484.582
G1 X116.304 Y120.634 E.00424
G1 F4800
G3 X116.418 Y120.394 I1.78 J.695 E.00815
G1 F5700
G3 X116.78 Y119.994 I1.569 J1.057 E.01663
G1 F4800
G3 X117.134 Y119.804 I1.019 J1.477 E.01239
G1 F5481.255
G1 X117.266 Y119.764 E.00422
G1 F4800
G3 X118.205 Y119.723 I.639 J3.824 E.02897
G1 X138.406 Y119.723 E.62072
G3 X139.464 Y120.226 I-.014 J1.393 E.03717
G1 F5700
G3 X139.669 Y120.565 I-1.215 J.964 E.0122
G1 F4800
G3 X139.775 Y121.032 I-1.903 J.679 E.01475
G1 X139.775 Y134.968 E.42819
G3 X139.736 Y135.234 I-1.376 J-.068 E.0083
G1 F5484.582
G1 X139.696 Y135.366 E.00424
G1 F4800
G3 X139.582 Y135.606 I-1.78 J-.695 E.00815
G1 F5700
G3 X139.22 Y136.006 I-1.569 J-1.057 E.01663
G1 F4800
G3 X138.866 Y136.196 I-1.019 J-1.477 E.01239
G1 F5481.255
G1 X138.734 Y136.236 E.00422
G1 F4800
G3 X137.795 Y136.277 I-.639 J-3.824 E.02897
G1 X118.205 Y136.277 E.60195
G3 X117.325 Y136.245 I-.3 J-3.861 E.02712
; WIPE_START
M204 S6000
G1 X116.961 Y136.119 E-.14638
G1 X116.726 Y135.964 E-.1067
G1 X116.495 Y135.722 E-.1271
G1 X116.387 Y135.551 E-.07711
G1 X116.304 Y135.365 E-.07723
G1 X116.266 Y135.242 E-.04895
G1 X116.25 Y135.17 E-.02801
G1 X116.23 Y135.035 E-.05205
G1 X116.227 Y134.781 E-.09648
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.893 Y127.178 Z.8 F42000
G1 X117.496 Y120.287 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42178
G1 F9502.19
M204 S6000
G1 X117.12 Y120.663 E.01641
G1 X117.03 Y120.789 E.00477
G2 X116.948 Y121.371 I1.133 J.457 E.01834
G1 X117.871 Y120.448 E.0403
G1 X118.407 Y120.448 E.01654
G1 X116.948 Y121.907 E.06369
G1 X116.948 Y122.443 E.01654
G1 X118.943 Y120.448 E.08708
G1 X119.478 Y120.448 E.01654
G1 X116.948 Y122.978 E.11048
G1 X116.948 Y123.514 E.01654
G1 X120.014 Y120.448 E.13387
G1 X120.55 Y120.448 E.01654
G1 X116.948 Y124.05 E.15726
G1 X116.948 Y124.586 E.01654
G1 X121.086 Y120.448 E.18065
G1 X121.622 Y120.448 E.01654
G1 X116.948 Y125.122 E.20405
G1 X116.948 Y125.657 E.01654
G1 X122.157 Y120.448 E.22744
G1 X122.693 Y120.448 E.01654
G1 X116.948 Y126.193 E.25083
G1 X116.948 Y126.729 E.01654
G1 X123.229 Y120.448 E.27422
G1 X123.765 Y120.448 E.01654
G1 X116.948 Y127.265 E.29761
G1 X116.948 Y127.801 E.01654
G1 X124.3 Y120.448 E.32101
G1 X124.836 Y120.448 E.01654
G1 X116.948 Y128.336 E.3444
G1 X116.948 Y128.872 E.01654
G1 X125.372 Y120.448 E.36779
G1 X125.908 Y120.448 E.01654
G1 X116.948 Y129.408 E.39118
G1 X116.948 Y129.944 E.01654
G1 X126.444 Y120.448 E.41458
G1 X126.979 Y120.448 E.01654
G1 X116.948 Y130.48 E.43797
G1 X116.948 Y131.015 E.01654
G1 X127.515 Y120.448 E.46136
G1 X128.051 Y120.448 E.01654
G1 X116.948 Y131.551 E.48475
G1 X116.948 Y132.087 E.01654
G1 X128.587 Y120.448 E.50814
G1 X129.123 Y120.448 E.01654
G1 X116.948 Y132.623 E.53154
G1 X116.948 Y133.158 E.01654
G1 X129.658 Y120.448 E.55493
G1 X130.194 Y120.448 E.01654
G1 X116.948 Y133.694 E.57832
G1 X116.948 Y134.23 E.01654
G1 X130.73 Y120.448 E.60171
G1 X131.266 Y120.448 E.01654
G1 X116.948 Y134.766 E.62511
G2 X117.039 Y135.21 I.875 J.052 E.01417
G1 X131.801 Y120.448 E.64451
G1 X132.337 Y120.448 E.01654
G1 X117.308 Y135.478 E.6562
G2 X117.769 Y135.552 I.4 J-1.019 E.01455
G1 X132.873 Y120.448 E.65942
G1 X133.409 Y120.448 E.01654
G1 X118.305 Y135.552 E.65942
G1 X118.841 Y135.552 E.01654
G1 X133.945 Y120.448 E.65942
G1 X134.48 Y120.448 E.01654
G1 X119.377 Y135.552 E.65942
G1 X119.913 Y135.552 E.01654
G1 X135.016 Y120.448 E.65942
G1 X135.552 Y120.448 E.01654
G1 X120.448 Y135.552 E.65942
G1 X120.984 Y135.552 E.01654
G1 X136.088 Y120.448 E.65942
G1 X136.623 Y120.448 E.01654
G1 X121.52 Y135.552 E.65942
G1 X122.056 Y135.552 E.01654
G1 X137.159 Y120.448 E.65942
G1 X137.695 Y120.448 E.01654
G1 X122.591 Y135.552 E.65942
G1 X123.127 Y135.552 E.01654
G1 X138.231 Y120.448 E.65942
G3 X138.692 Y120.523 I.074 J1.001 E.01455
G1 X123.663 Y135.552 E.65616
G1 X124.199 Y135.552 E.01654
G1 X138.965 Y120.786 E.6447
G3 X139.05 Y121.237 I-.889 J.401 E.0143
G1 X124.735 Y135.552 E.62501
G1 X125.27 Y135.552 E.01654
G1 X139.05 Y121.772 E.60162
G1 X139.05 Y122.308 E.01654
G1 X125.806 Y135.552 E.57822
G1 X126.342 Y135.552 E.01654
G1 X139.05 Y122.844 E.55483
G1 X139.05 Y123.38 E.01654
G1 X126.878 Y135.552 E.53144
G1 X127.414 Y135.552 E.01654
G1 X139.05 Y123.915 E.50805
G1 X139.05 Y124.451 E.01654
G1 X127.949 Y135.552 E.48465
G1 X128.485 Y135.552 E.01654
G1 X139.05 Y124.987 E.46126
G1 X139.05 Y125.523 E.01654
G1 X129.021 Y135.552 E.43787
G1 X129.557 Y135.552 E.01654
G1 X139.05 Y126.059 E.41448
G1 X139.05 Y126.594 E.01654
G1 X130.093 Y135.552 E.39108
G1 X130.628 Y135.552 E.01654
G1 X139.05 Y127.13 E.36769
G1 X139.05 Y127.666 E.01654
G1 X131.164 Y135.552 E.3443
G1 X131.7 Y135.552 E.01654
G1 X139.05 Y128.202 E.32091
G1 X139.05 Y128.738 E.01654
G1 X132.236 Y135.552 E.29751
G1 X132.771 Y135.552 E.01654
G1 X139.05 Y129.273 E.27412
G1 X139.05 Y129.809 E.01654
G1 X133.307 Y135.552 E.25073
G1 X133.843 Y135.552 E.01654
G1 X139.05 Y130.345 E.22734
G1 X139.05 Y130.881 E.01654
G1 X134.379 Y135.552 E.20394
G1 X134.915 Y135.552 E.01654
G1 X139.05 Y131.417 E.18055
G1 X139.05 Y131.952 E.01654
G1 X135.45 Y135.552 E.15716
G1 X135.986 Y135.552 E.01654
G1 X139.05 Y132.488 E.13377
G1 X139.05 Y133.024 E.01654
G1 X136.522 Y135.552 E.11037
G1 X137.058 Y135.552 E.01654
G1 X139.05 Y133.56 E.08698
G1 X139.05 Y134.095 E.01654
G1 X137.594 Y135.552 E.06359
G1 X138.129 Y135.552 E.01654
G1 X139.05 Y134.631 E.0402
G3 X138.879 Y135.338 I-.941 J.146 E.02305
G1 X138.504 Y135.713 E.01634
; OBJECT_ID: 394
; WIPE_START
G1 X138.879 Y135.338 E-.2011
G1 X138.97 Y135.211 E-.05946
G1 X139.031 Y135.053 E-.06432
G1 X139.05 Y134.924 E-.04978
G1 X139.05 Y134.631 E-.11115
G1 X138.54 Y135.141 E-.27418
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X130.907 Y135.157 Z.8 F42000
G1 X103.327 Y135.211 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X103.261 Y135.369 E.00566
G3 X102.385 Y135.885 I-.874 J-.482 E.0354
G1 X81.614 Y135.885 E.68901
G3 X80.615 Y134.885 I-.009 J-.99 E.05223
G1 X80.615 Y121.114 E.45681
G3 X81.615 Y120.115 I.99 J-.009 E.05223
G1 X102.396 Y120.115 E.68935
G3 X103.383 Y121.052 I-.009 J.998 E.04967
G1 X103.383 Y134.948 E.46098
G3 X103.353 Y135.139 I-.996 J-.062 E.0064
G1 X103.347 Y135.155 E.00056
M204 S250
G1 X103.701 Y135.349 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4974.079
M204 S5000
G1 X103.696 Y135.366 E.00055
G1 F4800
G3 X103.582 Y135.606 I-1.78 J-.695 E.00815
G1 F5700
G3 X103.22 Y136.006 I-1.569 J-1.057 E.01663
G1 F4800
G3 X102.866 Y136.196 I-1.019 J-1.477 E.01239
G1 F5481.255
G1 X102.734 Y136.236 E.00422
G1 F4800
G3 X101.795 Y136.277 I-.639 J-3.824 E.02897
G1 X82.205 Y136.277 E.60195
G3 X81.265 Y136.236 I-.3 J-3.861 E.02897
G3 X80.304 Y135.365 I.375 J-1.38 E.04135
G1 F5438.175
G1 X80.266 Y135.242 E.00396
G1 F4800
M73 P32 R16
G1 X80.25 Y135.17 E.00227
G1 F5479.933
G1 X80.23 Y135.035 E.00421
G1 F4800
G3 X80.223 Y134.295 I7.519 J-.44 E.02275
G1 X80.223 Y121.705 E.38686
G3 X80.264 Y120.765 I3.862 J-.3 E.02896
G1 F5484.582
G1 X80.304 Y120.634 E.00424
G1 F4800
G3 X80.418 Y120.394 I1.78 J.695 E.00815
G1 F5700
G3 X80.78 Y119.994 I1.569 J1.057 E.01663
G1 F4800
G3 X81.134 Y119.804 I1.019 J1.477 E.01239
G1 F5481.255
G1 X81.266 Y119.764 E.00422
G1 F4800
G3 X82.205 Y119.723 I.639 J3.824 E.02897
G1 X102.406 Y119.723 E.62072
G3 X103.464 Y120.226 I-.014 J1.393 E.03717
G1 F5700
G3 X103.669 Y120.565 I-1.215 J.964 E.0122
G1 F4800
G3 X103.775 Y121.032 I-1.903 J.679 E.01475
G1 X103.775 Y134.968 E.42819
G3 X103.736 Y135.234 I-1.376 J-.068 E.0083
G1 F5392.193
G1 X103.718 Y135.292 E.00184
; WIPE_START
M204 S6000
G1 X103.696 Y135.366 E-.02963
G1 X103.582 Y135.606 E-.10071
G1 X103.42 Y135.825 E-.10368
G1 X103.22 Y136.006 E-.10234
G1 X103.051 Y136.113 E-.07613
G1 X102.866 Y136.196 E-.07716
G1 X102.734 Y136.236 E-.05214
G1 X102.395 Y136.277 E-.12995
G1 X102.163 Y136.277 E-.08827
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.504 Y135.713 Z.8 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42178
G1 F9502.19
M204 S6000
G1 X102.879 Y135.338 E.01634
G2 X103.05 Y134.631 I-.77 J-.561 E.02305
G1 X102.129 Y135.552 E.0402
G1 X101.594 Y135.552 E.01654
G1 X103.05 Y134.095 E.06359
G1 X103.05 Y133.56 E.01654
G1 X101.058 Y135.552 E.08698
G1 X100.522 Y135.552 E.01654
G1 X103.05 Y133.024 E.11037
G1 X103.05 Y132.488 E.01654
G1 X99.986 Y135.552 E.13377
G1 X99.45 Y135.552 E.01654
G1 X103.05 Y131.952 E.15716
G1 X103.05 Y131.417 E.01654
G1 X98.915 Y135.552 E.18055
G1 X98.379 Y135.552 E.01654
G1 X103.05 Y130.881 E.20394
G1 X103.05 Y130.345 E.01654
G1 X97.843 Y135.552 E.22734
G1 X97.307 Y135.552 E.01654
G1 X103.05 Y129.809 E.25073
G1 X103.05 Y129.273 E.01654
G1 X96.771 Y135.552 E.27412
G1 X96.236 Y135.552 E.01654
G1 X103.05 Y128.738 E.29751
G1 X103.05 Y128.202 E.01654
G1 X95.7 Y135.552 E.32091
G1 X95.164 Y135.552 E.01654
G1 X103.05 Y127.666 E.3443
G1 X103.05 Y127.13 E.01654
G1 X94.628 Y135.552 E.36769
G1 X94.093 Y135.552 E.01654
G1 X103.05 Y126.594 E.39108
G1 X103.05 Y126.059 E.01654
G1 X93.557 Y135.552 E.41448
G1 X93.021 Y135.552 E.01654
G1 X103.05 Y125.523 E.43787
G1 X103.05 Y124.987 E.01654
G1 X92.485 Y135.552 E.46126
G1 X91.949 Y135.552 E.01654
G1 X103.05 Y124.451 E.48465
G1 X103.05 Y123.915 E.01654
G1 X91.414 Y135.552 E.50805
G1 X90.878 Y135.552 E.01654
G1 X103.05 Y123.38 E.53144
G1 X103.05 Y122.844 E.01654
G1 X90.342 Y135.552 E.55483
G1 X89.806 Y135.552 E.01654
G1 X103.05 Y122.308 E.57822
G1 X103.05 Y121.772 E.01654
G1 X89.27 Y135.552 E.60162
G1 X88.735 Y135.552 E.01654
G1 X103.05 Y121.237 E.62501
G2 X102.965 Y120.786 I-.974 J-.05 E.0143
G1 X88.199 Y135.552 E.6447
G1 X87.663 Y135.552 E.01654
G1 X102.692 Y120.523 E.65616
G2 X102.231 Y120.448 I-.387 J.927 E.01455
G1 X87.127 Y135.552 E.65942
G1 X86.591 Y135.552 E.01654
G1 X101.695 Y120.448 E.65942
G1 X101.159 Y120.448 E.01654
G1 X86.056 Y135.552 E.65942
G1 X85.52 Y135.552 E.01654
G1 X100.623 Y120.448 E.65942
G1 X100.088 Y120.448 E.01654
G1 X84.984 Y135.552 E.65942
G1 X84.448 Y135.552 E.01654
G1 X99.552 Y120.448 E.65942
G1 X99.016 Y120.448 E.01654
G1 X83.913 Y135.552 E.65942
G1 X83.377 Y135.552 E.01654
G1 X98.48 Y120.448 E.65942
G1 X97.945 Y120.448 E.01654
G1 X82.841 Y135.552 E.65942
G1 X82.305 Y135.552 E.01654
G1 X97.409 Y120.448 E.65942
G1 X96.873 Y120.448 E.01654
G1 X81.769 Y135.552 E.65942
G3 X81.308 Y135.478 I-.062 J-1.093 E.01455
G1 X96.337 Y120.448 E.6562
G1 X95.801 Y120.448 E.01654
G1 X81.039 Y135.21 E.64451
G3 X80.948 Y134.766 I.784 J-.393 E.01417
G1 X95.266 Y120.448 E.62511
G1 X94.73 Y120.448 E.01654
G1 X80.948 Y134.23 E.60171
G1 X80.948 Y133.694 E.01654
G1 X94.194 Y120.448 E.57832
G1 X93.658 Y120.448 E.01654
G1 X80.948 Y133.158 E.55493
G1 X80.948 Y132.623 E.01654
G1 X93.123 Y120.448 E.53154
G1 X92.587 Y120.448 E.01654
G1 X80.948 Y132.087 E.50814
G1 X80.948 Y131.551 E.01654
G1 X92.051 Y120.448 E.48475
G1 X91.515 Y120.448 E.01654
G1 X80.948 Y131.015 E.46136
G1 X80.948 Y130.48 E.01654
G1 X90.979 Y120.448 E.43797
G1 X90.444 Y120.448 E.01654
G1 X80.948 Y129.944 E.41458
G1 X80.948 Y129.408 E.01654
G1 X89.908 Y120.448 E.39118
G1 X89.372 Y120.448 E.01654
G1 X80.948 Y128.872 E.36779
G1 X80.948 Y128.336 E.01654
G1 X88.836 Y120.448 E.3444
G1 X88.301 Y120.448 E.01654
G1 X80.948 Y127.801 E.32101
G1 X80.948 Y127.265 E.01654
G1 X87.765 Y120.448 E.29761
G1 X87.229 Y120.448 E.01654
G1 X80.948 Y126.729 E.27422
G1 X80.948 Y126.193 E.01654
G1 X86.693 Y120.448 E.25083
G1 X86.157 Y120.448 E.01654
G1 X80.948 Y125.657 E.22744
G1 X80.948 Y125.122 E.01654
G1 X85.622 Y120.448 E.20405
G1 X85.086 Y120.448 E.01654
G1 X80.948 Y124.586 E.18065
G1 X80.948 Y124.05 E.01654
G1 X84.55 Y120.448 E.15726
G1 X84.014 Y120.448 E.01654
G1 X80.948 Y123.514 E.13387
G1 X80.948 Y122.978 E.01654
G1 X83.478 Y120.448 E.11048
G1 X82.943 Y120.448 E.01654
G1 X80.948 Y122.443 E.08708
G1 X80.948 Y121.907 E.01654
G1 X82.407 Y120.448 E.06369
G1 X81.871 Y120.448 E.01654
G1 X80.948 Y121.371 E.0403
G3 X81.03 Y120.789 I1.215 J-.125 E.01834
G1 X81.12 Y120.663 E.00477
G1 X81.496 Y120.287 E.01641
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9502.19
G1 X81.12 Y120.663 E-.20203
G1 X81.03 Y120.789 E-.05868
G1 X80.971 Y120.942 E-.06253
G1 X80.948 Y121.134 E-.07338
G1 X80.948 Y121.371 E-.09011
G1 X81.457 Y120.863 E-.27328
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 3/42
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z.8 I.005 J1.217 P1  F42000
G1 X152.746 Y120.588 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X153.615 Y120.102 I.859 J.517 E.03456
G1 X174.456 Y120.104 E.69133
G3 X175.396 Y121.051 I-.07 J1.01 E.04834
G1 X175.396 Y134.956 E.46126
G3 X174.385 Y135.898 I-1.01 J-.071 E.05042
G1 X153.615 Y135.898 E.68899
G3 X152.602 Y134.885 I-.01 J-1.003 E.05292
G1 X152.602 Y121.108 E.45703
G3 X152.716 Y120.64 I1.003 J-.003 E.01612
M204 S250
G1 X152.409 Y120.386 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X153.605 Y119.71 I1.195 J.718 E.04414
G1 X174.47 Y119.712 E.64112
G3 X175.788 Y121.032 I-.089 J1.407 E.06263
G1 X175.788 Y134.971 E.42831
G3 X174.395 Y136.29 I-1.406 J-.089 E.06486
G1 X153.605 Y136.29 E.63881
G3 X152.21 Y134.895 I-.001 J-1.395 E.06735
G1 X152.21 Y121.103 E.42379
G3 X152.379 Y120.438 I1.395 J.002 E.02129
; WIPE_START
M204 S6000
G1 X152.617 Y120.117 E-.15181
G1 X152.888 Y119.907 E-.13024
G1 X153.07 Y119.815 E-.07734
G1 X153.326 Y119.737 E-.102
G1 X153.605 Y119.71 E-.1064
G1 X154.111 Y119.71 E-.19222
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
G1 X152.774 Y135.005 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42213
G1 F9493.42
M204 S6000
G1 X153.179 Y135.41 E.0177
G1 X153.318 Y135.498 E.00508
G2 X153.87 Y135.565 I.423 J-1.185 E.01734
G1 X152.935 Y134.63 E.04085
G1 X152.935 Y134.094 E.01657
G1 X154.406 Y135.565 E.06428
G1 X154.943 Y135.565 E.01657
G1 X152.935 Y133.557 E.08772
G1 X152.935 Y133.021 E.01657
G1 X155.479 Y135.565 E.11115
G1 X156.015 Y135.565 E.01657
G1 X152.935 Y132.485 E.13459
G1 X152.935 Y131.949 E.01657
G1 X156.551 Y135.565 E.15803
G1 X157.088 Y135.565 E.01657
G1 X152.935 Y131.412 E.18146
G1 X152.935 Y130.876 E.01657
G1 X157.624 Y135.565 E.2049
G1 X158.16 Y135.565 E.01657
G1 X152.935 Y130.34 E.22833
G1 X152.935 Y129.803 E.01657
G1 X158.697 Y135.565 E.25177
G1 X159.233 Y135.565 E.01657
G1 X152.935 Y129.267 E.27521
G1 X152.935 Y128.731 E.01657
M73 P33 R16
G1 X159.769 Y135.565 E.29864
G1 X160.305 Y135.565 E.01657
G1 X152.935 Y128.195 E.32208
G1 X152.935 Y127.658 E.01657
G1 X160.842 Y135.565 E.34551
G1 X161.378 Y135.565 E.01657
G1 X152.935 Y127.122 E.36895
G1 X152.935 Y126.586 E.01657
G1 X161.914 Y135.565 E.39238
G1 X162.451 Y135.565 E.01657
G1 X152.935 Y126.049 E.41582
G1 X152.935 Y125.513 E.01657
G1 X162.987 Y135.565 E.43926
G1 X163.523 Y135.565 E.01657
G1 X152.935 Y124.977 E.46269
G1 X152.935 Y124.441 E.01657
G1 X164.059 Y135.565 E.48613
G1 X164.596 Y135.565 E.01657
G1 X152.935 Y123.904 E.50956
G1 X152.935 Y123.368 E.01657
G1 X165.132 Y135.565 E.533
G1 X165.668 Y135.565 E.01657
G1 X152.935 Y122.832 E.55644
G1 X152.935 Y122.295 E.01657
G1 X166.205 Y135.565 E.57987
G1 X166.741 Y135.565 E.01657
G1 X152.935 Y121.759 E.60331
G1 X152.935 Y121.223 E.01657
G1 X167.277 Y135.565 E.62674
G1 X167.813 Y135.565 E.01657
G1 X153.026 Y120.778 E.64619
G3 X153.303 Y120.518 I.553 J.311 E.01191
G1 X168.35 Y135.565 E.65756
G1 X168.886 Y135.565 E.01657
G1 X153.757 Y120.435 E.66116
G1 X154.293 Y120.435 E.01657
G1 X169.422 Y135.565 E.66116
G1 X169.959 Y135.565 E.01657
G1 X154.829 Y120.435 E.66115
G1 X155.366 Y120.435 E.01657
G1 X170.495 Y135.565 E.66115
G1 X171.031 Y135.565 E.01657
G1 X155.902 Y120.436 E.66115
G1 X156.438 Y120.436 E.01657
G1 X171.567 Y135.565 E.66115
G1 X172.104 Y135.565 E.01657
G1 X156.975 Y120.436 E.66115
G1 X157.511 Y120.436 E.01657
G1 X172.64 Y135.565 E.66114
G1 X173.176 Y135.565 E.01657
G1 X158.047 Y120.436 E.66114
G1 X158.584 Y120.436 E.01657
G1 X173.713 Y135.565 E.66114
G1 X174.249 Y135.565 E.01657
G1 X159.12 Y120.436 E.66114
G1 X159.656 Y120.436 E.01657
G1 X174.701 Y135.481 E.65746
G2 X174.978 Y135.221 I-.298 J-.596 E.01189
G1 X160.193 Y120.436 E.64613
G1 X160.729 Y120.436 E.01657
G1 X175.063 Y134.77 E.62639
G1 X175.063 Y134.233 E.01657
G1 X161.265 Y120.436 E.60295
G1 X161.802 Y120.436 E.01657
G1 X175.063 Y133.697 E.57952
G1 X175.063 Y133.161 E.01657
G1 X162.338 Y120.436 E.55608
G1 X162.874 Y120.436 E.01657
G1 X175.063 Y132.625 E.53264
G1 X175.063 Y132.088 E.01657
G1 X163.411 Y120.436 E.5092
G1 X163.947 Y120.436 E.01657
G1 X175.063 Y131.552 E.48576
G1 X175.063 Y131.016 E.01657
G1 X164.483 Y120.436 E.46233
G1 X165.02 Y120.436 E.01657
G1 X175.063 Y130.479 E.43889
G1 X175.063 Y129.943 E.01657
G1 X165.556 Y120.436 E.41545
G1 X166.092 Y120.436 E.01657
G1 X175.063 Y129.407 E.39201
G1 X175.063 Y128.871 E.01657
G1 X166.629 Y120.437 E.36857
G1 X167.165 Y120.437 E.01657
G1 X175.063 Y128.334 E.34514
G1 X175.063 Y127.798 E.01657
G1 X167.701 Y120.437 E.3217
G1 X168.238 Y120.437 E.01657
G1 X175.063 Y127.262 E.29826
G1 X175.063 Y126.725 E.01657
G1 X168.774 Y120.437 E.27482
G1 X169.31 Y120.437 E.01657
G1 X175.063 Y126.189 E.25138
G1 X175.063 Y125.653 E.01657
G1 X169.847 Y120.437 E.22795
G1 X170.383 Y120.437 E.01657
G1 X175.063 Y125.117 E.20451
G1 X175.063 Y124.58 E.01657
G1 X170.919 Y120.437 E.18107
G1 X171.456 Y120.437 E.01657
G1 X175.063 Y124.044 E.15763
G1 X175.063 Y123.508 E.01657
G1 X171.992 Y120.437 E.13419
G1 X172.528 Y120.437 E.01657
G1 X175.063 Y122.971 E.11076
G1 X175.063 Y122.435 E.01657
G1 X173.065 Y120.437 E.08732
G1 X173.601 Y120.437 E.01657
G1 X175.063 Y121.899 E.06388
G1 X175.063 Y121.363 E.01657
G1 X174.137 Y120.437 E.04044
G3 X174.768 Y120.549 I.138 J1.053 E.02011
G3 X175.221 Y120.984 I-1.985 J2.519 E.01943
; OBJECT_ID: 405
; WIPE_START
G1 X174.768 Y120.549 E-.23856
G1 X174.653 Y120.488 E-.04943
G1 X174.524 Y120.449 E-.05127
G1 X174.137 Y120.437 E-.14712
G1 X174.646 Y120.946 E-.27362
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X167.014 Y120.927 Z1 F42000
G1 X139.367 Y120.859 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X139.396 Y121.051 I-.973 J.248 E.00647
G1 X139.396 Y134.956 E.46126
G3 X138.385 Y135.898 I-1.01 J-.071 E.05042
G1 X117.609 Y135.898 E.68919
G3 X116.602 Y134.89 I.004 J-1.01 E.05244
G1 X116.602 Y121.108 E.45719
G3 X117.615 Y120.102 I1.003 J-.003 E.05267
G1 X138.396 Y120.102 E.68935
G3 X139.35 Y120.801 I-.003 J1.004 E.04195
M204 S250
G1 X139.747 Y120.764 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X139.788 Y121.032 I-1.356 J.346 E.00835
G1 X139.788 Y134.971 E.42829
G3 X138.395 Y136.29 I-1.406 J-.089 E.06486
G1 X117.603 Y136.29 E.63887
G3 X116.21 Y134.896 I.012 J-1.406 E.0671
G1 X116.21 Y121.103 E.42383
G3 X117.605 Y119.71 I1.395 J.002 E.06727
G1 X138.406 Y119.71 E.63917
G3 X139.731 Y120.706 I-.016 J1.4 E.05449
M204 S10000
G1 X139.221 Y120.984 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42216
G1 F9492.669
M204 S6000
G2 X138.77 Y120.551 I-2.392 J2.037 E.01934
G2 X138.136 Y120.436 I-.513 J1.019 E.0202
G1 X139.063 Y121.362 E.0405
G1 X139.063 Y121.899 E.01657
G1 X137.6 Y120.435 E.06394
G1 X137.063 Y120.435 E.01657
G1 X139.063 Y122.435 E.08738
G1 X139.063 Y122.971 E.01657
G1 X136.527 Y120.435 E.11082
G1 X135.991 Y120.435 E.01657
G1 X139.063 Y123.508 E.13426
G1 X139.063 Y124.044 E.01657
G1 X135.454 Y120.435 E.1577
G1 X134.918 Y120.435 E.01657
G1 X139.063 Y124.58 E.18114
G1 X139.063 Y125.117 E.01657
G1 X134.382 Y120.435 E.20458
G1 X133.845 Y120.435 E.01657
G1 X139.063 Y125.653 E.22802
G1 X139.063 Y126.189 E.01657
G1 X133.309 Y120.435 E.25146
G1 X132.773 Y120.435 E.01657
G1 X139.063 Y126.725 E.2749
G1 X139.063 Y127.262 E.01657
G1 X132.236 Y120.435 E.29834
G1 X131.7 Y120.435 E.01657
G1 X139.063 Y127.798 E.32178
G1 X139.063 Y128.334 E.01657
G1 X131.164 Y120.435 E.34522
G1 X130.627 Y120.435 E.01657
G1 X139.063 Y128.871 E.36866
G1 X139.063 Y129.407 E.01657
G1 X130.091 Y120.435 E.3921
G1 X129.555 Y120.435 E.01657
G1 X139.063 Y129.943 E.41554
G1 X139.063 Y130.48 E.01657
G1 X129.018 Y120.435 E.43898
G1 X128.482 Y120.435 E.01657
G1 X139.063 Y131.016 E.46242
G1 X139.063 Y131.552 E.01657
G1 X127.946 Y120.435 E.48586
G1 X127.409 Y120.435 E.01657
G1 X139.063 Y132.089 E.5093
G1 X139.063 Y132.625 E.01657
G1 X126.873 Y120.435 E.53273
G1 X126.337 Y120.435 E.01657
G1 X139.063 Y133.161 E.55617
G1 X139.063 Y133.698 E.01657
G1 X125.8 Y120.435 E.57961
G1 X125.264 Y120.435 E.01657
G1 X139.063 Y134.234 E.60305
G1 X139.063 Y134.77 E.01657
G1 X124.728 Y120.435 E.62649
G1 X124.191 Y120.435 E.01657
G1 X138.978 Y135.222 E.64622
G3 X138.701 Y135.481 I-.575 J-.337 E.01189
G1 X123.655 Y120.435 E.65754
G1 X123.119 Y120.435 E.01657
G1 X138.248 Y135.565 E.66121
G1 X137.712 Y135.565 E.01657
G1 X122.582 Y120.435 E.66121
G1 X122.046 Y120.435 E.01657
G1 X137.175 Y135.565 E.66121
G1 X136.639 Y135.565 E.01657
G1 X121.51 Y120.435 E.66121
G1 X120.973 Y120.435 E.01657
G1 X136.103 Y135.565 E.66121
G1 X135.566 Y135.565 E.01657
G1 X120.437 Y120.435 E.66121
G1 X119.901 Y120.435 E.01657
G1 X135.03 Y135.565 E.66121
G1 X134.494 Y135.565 E.01657
G1 X119.364 Y120.435 E.66121
G1 X118.828 Y120.435 E.01657
G1 X133.957 Y135.565 E.66121
G1 X133.421 Y135.565 E.01657
G1 X118.292 Y120.435 E.66121
G1 X117.755 Y120.435 E.01657
G1 X132.885 Y135.565 E.66121
G1 X132.348 Y135.565 E.01657
G1 X117.302 Y120.518 E.65759
G2 X117.026 Y120.779 I.278 J.571 E.01191
G1 X131.812 Y135.565 E.64621
G1 X131.276 Y135.565 E.01657
G1 X116.935 Y121.224 E.62674
G1 X116.935 Y121.76 E.01657
G1 X130.74 Y135.565 E.6033
G1 X130.203 Y135.565 E.01657
G1 X116.935 Y122.297 E.57986
G1 X116.935 Y122.833 E.01657
G1 X129.667 Y135.565 E.55642
M73 P33 R15
G1 X129.131 Y135.565 E.01657
G1 X116.935 Y123.369 E.53298
G1 X116.935 Y123.906 E.01657
G1 X128.594 Y135.565 E.50954
G1 X128.058 Y135.565 E.01657
G1 X116.935 Y124.442 E.4861
G1 X116.935 Y124.978 E.01657
G1 X127.522 Y135.565 E.46266
G1 X126.985 Y135.565 E.01657
G1 X116.935 Y125.515 E.43922
M73 P34 R15
G1 X116.935 Y126.051 E.01657
G1 X126.449 Y135.565 E.41578
G1 X125.913 Y135.565 E.01657
G1 X116.935 Y126.587 E.39234
G1 X116.935 Y127.124 E.01657
G1 X125.376 Y135.565 E.3689
G1 X124.84 Y135.565 E.01657
G1 X116.935 Y127.66 E.34546
G1 X116.935 Y128.196 E.01657
G1 X124.304 Y135.565 E.32202
G1 X123.767 Y135.565 E.01657
G1 X116.935 Y128.733 E.29858
G1 X116.935 Y129.269 E.01657
G1 X123.231 Y135.565 E.27514
G1 X122.695 Y135.565 E.01657
G1 X116.935 Y129.805 E.2517
G1 X116.935 Y130.342 E.01657
G1 X122.158 Y135.565 E.22826
G1 X121.622 Y135.565 E.01657
G1 X116.935 Y130.878 E.20482
G1 X116.935 Y131.414 E.01657
G1 X121.086 Y135.565 E.18138
G1 X120.549 Y135.565 E.01657
G1 X116.935 Y131.951 E.15795
G1 X116.935 Y132.487 E.01657
G1 X120.013 Y135.565 E.13451
G1 X119.477 Y135.565 E.01657
G1 X116.935 Y133.023 E.11107
G1 X116.935 Y133.56 E.01657
G1 X118.94 Y135.565 E.08763
G1 X118.404 Y135.565 E.01657
G1 X116.935 Y134.096 E.06419
G1 X116.935 Y134.632 E.01657
G1 X117.868 Y135.565 E.04075
G3 X117.289 Y135.484 I-.125 J-1.216 E.01823
G1 X117.162 Y135.396 E.00478
G1 X116.787 Y135.02 E.01642
; OBJECT_ID: 394
; WIPE_START
G1 X117.162 Y135.396 E-.20188
G1 X117.289 Y135.484 E-.05872
G1 X117.437 Y135.541 E-.06016
G1 X117.629 Y135.565 E-.07365
G1 X117.868 Y135.565 E-.09071
G1 X117.356 Y135.053 E-.27488
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X109.724 Y135.127 Z1 F42000
G1 X103.352 Y135.189 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X102.385 Y135.898 I-.966 J-.304 E.04256
G1 X81.615 Y135.898 E.68899
G3 X80.602 Y134.885 I-.01 J-1.003 E.05292
G1 X80.602 Y121.108 E.45703
G3 X81.615 Y120.102 I1.003 J-.003 E.05267
G1 X102.456 Y120.104 E.69133
G3 X103.396 Y121.051 I-.07 J1.01 E.04834
G1 X103.396 Y134.956 E.46126
G3 X103.368 Y135.131 I-1.01 J-.071 E.00588
M204 S250
G1 X103.721 Y135.325 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X103.621 Y135.553 E.00764
G3 X102.395 Y136.29 I-1.239 J-.671 E.0461
G1 X81.605 Y136.29 E.63881
G3 X80.21 Y134.895 I-.001 J-1.395 E.06735
G1 X80.21 Y121.103 E.42379
G3 X81.605 Y119.71 I1.395 J.002 E.06727
G1 X102.47 Y119.712 E.64112
G3 X103.788 Y121.032 I-.089 J1.407 E.06263
G1 X103.788 Y134.971 E.42831
G3 X103.737 Y135.267 I-1.406 J-.089 E.00927
; WIPE_START
M204 S6000
G1 X103.621 Y135.553 E-.11706
G1 X103.473 Y135.784 E-.10424
G1 X103.333 Y135.93 E-.0768
G1 X103.112 Y136.093 E-.10451
G1 X102.87 Y136.208 E-.1019
G1 X102.602 Y136.275 E-.10475
G1 X102.395 Y136.29 E-.07906
G1 X102.206 Y136.29 E-.07168
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.711 Y128.674 Z1 F42000
G1 X103.221 Y120.984 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42213
G1 F9493.42
M204 S6000
G2 X102.768 Y120.549 I-2.438 J2.084 E.01943
G2 X102.137 Y120.437 I-.493 J.941 E.02011
G1 X103.063 Y121.363 E.04044
G1 X103.063 Y121.899 E.01657
G1 X101.601 Y120.437 E.06388
G1 X101.065 Y120.437 E.01657
G1 X103.063 Y122.435 E.08732
G1 X103.063 Y122.971 E.01657
G1 X100.528 Y120.437 E.11076
G1 X99.992 Y120.437 E.01657
G1 X103.063 Y123.508 E.13419
G1 X103.063 Y124.044 E.01657
G1 X99.456 Y120.437 E.15763
G1 X98.919 Y120.437 E.01657
G1 X103.063 Y124.58 E.18107
G1 X103.063 Y125.117 E.01657
G1 X98.383 Y120.437 E.20451
G1 X97.847 Y120.437 E.01657
G1 X103.063 Y125.653 E.22795
G1 X103.063 Y126.189 E.01657
G1 X97.31 Y120.437 E.25138
G1 X96.774 Y120.437 E.01657
G1 X103.063 Y126.725 E.27482
G1 X103.063 Y127.262 E.01657
G1 X96.238 Y120.437 E.29826
G1 X95.701 Y120.437 E.01657
G1 X103.063 Y127.798 E.3217
G1 X103.063 Y128.334 E.01657
G1 X95.165 Y120.437 E.34514
G1 X94.629 Y120.437 E.01657
G1 X103.063 Y128.871 E.36857
G1 X103.063 Y129.407 E.01657
G1 X94.092 Y120.436 E.39201
G1 X93.556 Y120.436 E.01657
G1 X103.063 Y129.943 E.41545
G1 X103.063 Y130.479 E.01657
G1 X93.02 Y120.436 E.43889
G1 X92.483 Y120.436 E.01657
G1 X103.063 Y131.016 E.46233
G1 X103.063 Y131.552 E.01657
G1 X91.947 Y120.436 E.48576
G1 X91.411 Y120.436 E.01657
G1 X103.063 Y132.088 E.5092
G1 X103.063 Y132.625 E.01657
G1 X90.874 Y120.436 E.53264
G1 X90.338 Y120.436 E.01657
G1 X103.063 Y133.161 E.55608
G1 X103.063 Y133.697 E.01657
G1 X89.802 Y120.436 E.57952
G1 X89.265 Y120.436 E.01657
G1 X103.063 Y134.233 E.60295
G1 X103.063 Y134.77 E.01657
G1 X88.729 Y120.436 E.62639
G1 X88.193 Y120.436 E.01657
G1 X102.978 Y135.221 E.64613
G3 X102.701 Y135.481 I-.575 J-.337 E.01189
G1 X87.656 Y120.436 E.65746
G1 X87.12 Y120.436 E.01657
G1 X102.249 Y135.565 E.66114
G1 X101.713 Y135.565 E.01657
G1 X86.584 Y120.436 E.66114
G1 X86.047 Y120.436 E.01657
G1 X101.176 Y135.565 E.66114
G1 X100.64 Y135.565 E.01657
G1 X85.511 Y120.436 E.66114
G1 X84.975 Y120.436 E.01657
G1 X100.104 Y135.565 E.66115
G1 X99.567 Y135.565 E.01657
G1 X84.438 Y120.436 E.66115
G1 X83.902 Y120.436 E.01657
G1 X99.031 Y135.565 E.66115
G1 X98.495 Y135.565 E.01657
G1 X83.366 Y120.435 E.66115
G1 X82.829 Y120.435 E.01657
G1 X97.959 Y135.565 E.66115
G1 X97.422 Y135.565 E.01657
G1 X82.293 Y120.435 E.66116
G1 X81.757 Y120.435 E.01657
G1 X96.886 Y135.565 E.66116
G1 X96.35 Y135.565 E.01657
G1 X81.303 Y120.518 E.65756
G2 X81.026 Y120.778 I.277 J.571 E.01191
G1 X95.813 Y135.565 E.64619
G1 X95.277 Y135.565 E.01657
G1 X80.935 Y121.223 E.62674
G1 X80.935 Y121.759 E.01657
G1 X94.741 Y135.565 E.60331
G1 X94.205 Y135.565 E.01657
G1 X80.935 Y122.295 E.57987
G1 X80.935 Y122.832 E.01657
G1 X93.668 Y135.565 E.55644
G1 X93.132 Y135.565 E.01657
G1 X80.935 Y123.368 E.533
G1 X80.935 Y123.904 E.01657
G1 X92.596 Y135.565 E.50956
G1 X92.059 Y135.565 E.01657
G1 X80.935 Y124.441 E.48613
G1 X80.935 Y124.977 E.01657
G1 X91.523 Y135.565 E.46269
G1 X90.987 Y135.565 E.01657
G1 X80.935 Y125.513 E.43926
G1 X80.935 Y126.049 E.01657
G1 X90.451 Y135.565 E.41582
G1 X89.914 Y135.565 E.01657
G1 X80.935 Y126.586 E.39238
G1 X80.935 Y127.122 E.01657
G1 X89.378 Y135.565 E.36895
G1 X88.842 Y135.565 E.01657
G1 X80.935 Y127.658 E.34551
G1 X80.935 Y128.195 E.01657
G1 X88.305 Y135.565 E.32208
G1 X87.769 Y135.565 E.01657
G1 X80.935 Y128.731 E.29864
G1 X80.935 Y129.267 E.01657
G1 X87.233 Y135.565 E.27521
G1 X86.697 Y135.565 E.01657
G1 X80.935 Y129.803 E.25177
G1 X80.935 Y130.34 E.01657
G1 X86.16 Y135.565 E.22833
G1 X85.624 Y135.565 E.01657
G1 X80.935 Y130.876 E.2049
G1 X80.935 Y131.412 E.01657
G1 X85.088 Y135.565 E.18146
G1 X84.551 Y135.565 E.01657
G1 X80.935 Y131.949 E.15803
G1 X80.935 Y132.485 E.01657
G1 X84.015 Y135.565 E.13459
G1 X83.479 Y135.565 E.01657
G1 X80.935 Y133.021 E.11115
G1 X80.935 Y133.557 E.01657
G1 X82.943 Y135.565 E.08772
G1 X82.406 Y135.565 E.01657
G1 X80.935 Y134.094 E.06428
G1 X80.935 Y134.63 E.01657
G1 X81.87 Y135.565 E.04085
G3 X81.318 Y135.498 I-.13 J-1.251 E.01734
G1 X81.179 Y135.41 E.00508
G1 X80.774 Y135.005 E.0177
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9493.42
G1 X81.179 Y135.41 E-.2177
G1 X81.318 Y135.498 E-.06242
G1 X81.468 Y135.549 E-.06048
G1 X81.87 Y135.565 E-.15276
G1 X81.374 Y135.068 E-.26665
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 4/42
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
M106 S198.9
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z1 I.246 J1.192 P1  F42000
G1 X153.005 Y120.298 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X153.608 Y120.102 I.607 J.844 E.02136
G1 X174.454 Y120.104 E.6915
G3 X175.35 Y120.747 I-.073 J1.047 E.03853
G1 X174.719 Y120.747 E.02092
G1 X174.611 Y120.866 E.00531
G1 X174.146 Y120.555 E.01857
G1 X173.492 Y120.947 E.0253
G1 X171.722 Y120.944 E.05872
G1 X171.722 Y135.053 E.468
G1 X173.468 Y135.053 E.0579
G1 X174.124 Y135.491 E.02619
G1 X174.64 Y135.127 E.02094
G1 X174.766 Y135.253 E.00589
G1 X175.35 Y135.253 E.01938
G3 X174.385 Y135.898 I-.967 J-.403 E.0408
G1 X153.615 Y135.898 E.68898
G3 X152.799 Y135.494 I-.007 J-1.011 E.03133
G1 X152.638 Y135.253 E.00962
G1 X153.259 Y135.253 E.02062
G1 X153.379 Y135.127 E.00575
G1 X153.992 Y135.536 E.02446
G1 X154.582 Y135.053 E.0253
G1 X156.278 Y135.056 E.05625
G1 X156.278 Y120.947 E.468
G1 X154.532 Y120.947 E.0579
G1 X153.875 Y120.509 E.02622
G1 X153.36 Y120.872 E.0209
G1 X153.236 Y120.747 E.00585
G1 X152.65 Y120.747 E.01942
G3 X152.957 Y120.334 I.962 J.394 E.01726
M204 S250
G1 X152.773 Y119.985 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X153.603 Y119.71 I.832 J1.12 E.02732
G1 X174.468 Y119.712 E.64112
G3 X175.788 Y121.032 I-.086 J1.407 E.0627
G1 X175.788 Y134.968 E.42822
G3 X174.395 Y136.29 I-1.406 J-.087 E.06494
M73 P35 R15
G1 X153.605 Y136.29 E.6388
G3 X152.21 Y134.897 I0 J-1.395 E.06728
G1 X152.21 Y121.105 E.42378
G3 X152.726 Y120.022 I1.395 J-.001 E.03812
; WIPE_START
M204 S6000
G1 X153.068 Y119.816 E-.15177
G1 X153.396 Y119.725 E-.12929
G1 X153.603 Y119.71 E-.0788
G1 X154.656 Y119.71 E-.40014
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
G1 X154.266 Y120.525 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.480852
G1 F8220.456
M204 S6000
G1 X156.481 Y120.525 E.07906
; WIPE_START
G1 X154.481 Y120.525 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.901 Y120.854 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F10588.235
M204 S6000
G1 X153.837 Y120.891 E.00204
G1 X153.886 Y120.919 E.00155
M204 S10000
G1 X153.386 Y120.605 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.271152
G1 F15000
M204 S6000
G1 X153.396 Y120.455 E.00279
G1 X153.682 Y120.306 E.00601
; WIPE_START
G1 X153.396 Y120.455 E-.51936
G1 X153.386 Y120.605 E-.24064
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.838 Y128.098 Z1.2 F42000
G1 X156.007 Y134.126 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S2000
G1 X155.302 Y134.832 E.03065
G1 X154.769 Y134.831
G1 X156.007 Y133.593 E.05379
G1 X156.007 Y133.06
G1 X154.085 Y134.982 E.08353
G1 X153.556 Y134.978
G1 X156.007 Y132.527 E.10652
G1 X156.007 Y131.993
G1 X153.018 Y134.982 E.12988
G1 X152.437 Y135.03
G1 X156.007 Y131.46 E.15514
G1 X156.007 Y130.927
G1 X152.417 Y134.517 E.15599
G1 X152.417 Y133.983
G1 X156.007 Y130.394 E.15599
G1 X156.007 Y129.86
G1 X152.417 Y133.45 E.15599
G1 X152.417 Y132.917
G1 X156.007 Y129.327 E.15599
G1 X156.007 Y128.794
G1 X152.417 Y132.384 E.15599
G1 X152.417 Y131.85
G1 X156.007 Y128.261 E.15599
G1 X156.007 Y127.727
G1 X152.417 Y131.317 E.15599
G1 X152.417 Y130.784
G1 X156.007 Y127.194 E.15599
G1 X156.007 Y126.661
G1 X152.417 Y130.251 E.15599
G1 X152.417 Y129.717
G1 X156.007 Y126.128 E.15599
G1 X156.007 Y125.594
G1 X152.417 Y129.184 E.15599
G1 X152.417 Y128.651
G1 X156.007 Y125.061 E.15599
G1 X156.007 Y124.528
G1 X152.417 Y128.118 E.15599
G1 X152.417 Y127.584
G1 X156.007 Y123.995 E.15599
G1 X156.007 Y123.461
G1 X152.417 Y127.051 E.15599
G1 X152.417 Y126.518
G1 X156.007 Y122.928 E.15599
G1 X156.007 Y122.395
G1 X152.417 Y125.984 E.15599
G1 X152.417 Y125.451
G1 X156.007 Y121.861 E.15599
G1 X156.007 Y121.328
G1 X152.417 Y124.918 E.15599
G1 X152.417 Y124.385
G1 X155.632 Y121.17 E.13971
G1 X155.099 Y121.17
G1 X152.417 Y123.851 E.11653
G1 X152.417 Y123.318
G1 X154.566 Y121.17 E.09336
G1 X154.184 Y121.018
G1 X152.417 Y122.785 E.07679
G1 X152.417 Y122.252
G1 X153.651 Y121.018 E.05362
G1 X153.118 Y121.018
G1 X152.417 Y121.718 E.03044
M204 S10000
G1 X156.026 Y121.177 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0944573
G1 F15000
M204 S6000
G1 X155.639 Y121.177 E.00162
; WIPE_START
G1 X156.026 Y121.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.924 Y128.729 Z1.2 F42000
G1 X153.996 Y135.089 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F10588.235
M204 S6000
G1 X153.932 Y135.126 E.00204
G1 X153.981 Y135.154 E.00155
M204 S10000
G1 X154.388 Y135.475 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.479238
G1 F8250.873
M204 S6000
G1 X156.481 Y135.477 E.07443
M204 S10000
G1 X153.734 Y135.694 F42000
; LINE_WIDTH: 0.278723
G1 F15000
M204 S6000
G1 X153.425 Y135.549 E.00656
G1 X153.412 Y135.394 E.00298
; WIPE_START
G1 X153.425 Y135.549 E-.23712
G1 X153.734 Y135.694 E-.52288
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X161.366 Y135.626 Z1.2 F42000
G1 X169.921 Y135.55 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X171.171 Y135.55 E.04144
G1 X171.171 Y135.171 E.01258
G1 X156.829 Y120.829 E.67277
G1 X156.829 Y121.114 E.00943
G1 X156.626 Y121.114 E.00675
G1 X156.626 Y127.698 E.21842
G1 X163.873 Y120.451 E.33996
G1 X164.127 Y120.451 E.00844
G1 X171.374 Y127.698 E.33996
G1 X171.374 Y128.302 E.02003
G1 X164.126 Y135.55 E.34
G1 X163.874 Y135.55 E.00838
G1 X156.626 Y128.302 E.34
G1 X156.626 Y134.889 E.21851
G1 X156.83 Y134.889 E.00676
G1 X156.83 Y135.17 E.00932
G1 X171.17 Y120.83 E.67275
G1 X171.171 Y120.452 E.01253
G1 X169.92 Y120.452 E.04148
M204 S10000
G1 X171.519 Y120.524 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.477635
G1 F8281.294
M204 S6000
G1 X173.799 Y120.526 E.08077
M204 S10000
G1 X174.159 Y120.871 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F10588.235
M204 S6000
G1 X174.095 Y120.908 E.00204
G1 X174.143 Y120.936 E.00155
M204 S10000
G1 X174.571 Y120.594 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.251624
G1 F15000
M204 S6000
G1 X174.562 Y120.446 E.00252
G1 X174.599 Y120.442 E.00064
; LINE_WIDTH: 0.234705
G3 X174.912 Y120.494 I-.209 J2.211 E.00495
; WIPE_START
G1 X174.599 Y120.442 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X175.139 Y128.055 Z1.2 F42000
G1 X175.581 Y134.283 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S2000
G1 X174.882 Y134.982 E.03036
G1 X174.349 Y134.982
G1 X175.581 Y133.75 E.05354
G1 X175.581 Y133.217
G1 X173.815 Y134.982 E.07671
G1 X173.434 Y134.83
G1 X175.581 Y132.684 E.09328
G1 X175.581 Y132.15
G1 X172.901 Y134.83 E.11646
G1 X172.367 Y134.83
G1 X175.581 Y131.617 E.13963
G1 X175.581 Y131.084
G1 X171.993 Y134.672 E.15591
G1 X171.993 Y134.138
G1 X175.581 Y130.551 E.15591
G1 X175.581 Y130.017
G1 X171.993 Y133.605 E.15591
G1 X171.993 Y133.072
G1 X175.581 Y129.484 E.15591
G1 X175.581 Y128.951
G1 X171.993 Y132.539 E.15591
G1 X171.993 Y132.005
G1 X175.581 Y128.418 E.15591
G1 X175.581 Y127.884
G1 X171.993 Y131.472 E.15591
G1 X171.993 Y130.939
G1 X175.581 Y127.351 E.15591
G1 X175.581 Y126.818
G1 X171.993 Y130.406 E.15591
G1 X171.993 Y129.872
G1 X175.581 Y126.285 E.15591
G1 X175.581 Y125.751
G1 X171.993 Y129.339 E.15591
G1 X171.993 Y128.806
G1 X175.581 Y125.218 E.15591
G1 X175.581 Y124.685
G1 X171.993 Y128.273 E.15591
G1 X171.993 Y127.739
G1 X175.581 Y124.151 E.15591
G1 X175.581 Y123.618
G1 X171.993 Y127.206 E.15591
G1 X171.993 Y126.673
G1 X175.581 Y123.085 E.15591
G1 X175.581 Y122.552
G1 X171.993 Y126.14 E.15591
G1 X171.993 Y125.606
G1 X175.581 Y122.018 E.15591
G1 X175.581 Y121.485
G1 X171.993 Y125.073 E.15591
G1 X171.993 Y124.54
G1 X175.563 Y120.97 E.15514
G1 X174.981 Y121.018
G1 X171.993 Y124.006 E.12987
G1 X171.993 Y123.473
G1 X174.444 Y121.022 E.10653
G1 X173.915 Y121.018
G1 X171.993 Y122.94 E.08352
G1 X171.993 Y122.407
G1 X173.231 Y121.169 E.05379
G1 X172.698 Y121.168
G1 X171.993 Y121.873 E.03065
M204 S10000
G1 X172.361 Y134.823 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.094598
G1 F15000
M204 S6000
G1 X171.974 Y134.823 E.00163
M204 S10000
G1 X171.519 Y135.475 F42000
; LINE_WIDTH: 0.48102
G1 F8217.302
M204 S6000
G1 X173.734 Y135.475 E.07909
M204 S10000
G1 X174.141 Y135.072 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F10588.235
M204 S6000
G1 X174.077 Y135.109 E.00204
G1 X174.125 Y135.137 E.00155
M204 S10000
G1 X174.615 Y135.394 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.266591
G1 F15000
M204 S6000
G1 X174.605 Y135.544 E.00274
G1 X174.633 Y135.548 E.00052
; LINE_WIDTH: 0.217814
G2 X174.921 Y135.497 I-.056 J-1.158 E.00419
; OBJECT_ID: 405
; WIPE_START
G1 X174.633 Y135.548 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X167.498 Y132.838 Z1.2 F42000
G1 X135.722 Y120.766 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X135.722 Y135.203 E.4789
G1 X139.38 Y135.203 E.12134
G3 X138.602 Y135.877 I-1.085 J-.466 E.03534
G3 X138.385 Y135.898 I-.215 J-1.089 E.00724
G1 X120.278 Y135.898 E.60065
G1 X120.278 Y120.797 E.50092
G1 X116.62 Y120.797 E.12132
G3 X117.218 Y120.179 I1.11 J.474 E.02918
G3 X117.608 Y120.102 I.4 J1.004 E.01324
G1 X135.722 Y120.103 E.60089
G1 X135.722 Y120.706 E.02001
; WIPE_START
G1 X135.722 Y122.706 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.747 Y120.766 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X139.788 Y121.032 I-1.357 J.344 E.00829
G1 X139.788 Y134.968 E.4282
G3 X138.395 Y136.29 I-1.406 J-.087 E.06494
G1 X117.604 Y136.29 E.63885
G3 X116.21 Y134.895 I.002 J-1.396 E.06727
G1 X116.21 Y121.105 E.42373
G3 X117.603 Y119.71 I1.395 J-.001 E.06728
G1 X138.43 Y119.711 E.63996
G3 X139.731 Y120.709 I-.04 J1.399 E.05384
; WIPE_START
M204 S6000
G1 X139.788 Y121.032 E-.12497
G1 X139.788 Y122.704 E-.63503
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.971 Y123.085 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F10588.235
M204 S6000
G1 X135.908 Y123.122 E.00204
G1 X135.956 Y123.15 E.00155
M204 S10000
G1 X136.011 Y134.898 F42000
G1 F10588.235
M204 S6000
G1 X135.947 Y134.935 E.00204
G1 X135.996 Y134.963 E.00155
M204 S10000
G1 X139.076 Y134.938 F42000
G1 F10588.235
M204 S6000
G1 X139.012 Y134.975 E.00204
G1 X139.06 Y135.003 E.00155
M204 S10000
G1 X138.932 Y134.932 F42000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S2000
G1 X139.581 Y134.283 E.02819
G1 X139.581 Y133.75
G1 X138.399 Y134.932 E.05136
G1 X137.865 Y134.932
G1 X139.581 Y133.217 E.07454
G1 X139.581 Y132.684
G1 X137.332 Y134.932 E.09771
G1 X136.799 Y134.932
G1 X139.581 Y132.15 E.12088
G1 X139.581 Y131.617
G1 X136.266 Y134.932 E.14406
G1 X135.993 Y134.672
G1 X139.581 Y131.084 E.15591
G1 X139.581 Y130.551
G1 X135.993 Y134.138 E.15591
G1 X135.993 Y133.605
G1 X139.581 Y130.017 E.15591
G1 X139.581 Y129.484
G1 X135.993 Y133.072 E.15591
G1 X135.993 Y132.539
G1 X139.581 Y128.951 E.15591
G1 X139.581 Y128.418
G1 X135.993 Y132.005 E.15591
G1 X135.993 Y131.472
G1 X139.581 Y127.884 E.15591
G1 X139.581 Y127.351
G1 X135.993 Y130.939 E.15591
G1 X135.993 Y130.406
G1 X139.581 Y126.818 E.15591
G1 X139.581 Y126.284
G1 X135.993 Y129.872 E.15591
G1 X135.993 Y129.339
G1 X139.581 Y125.751 E.15591
G1 X139.581 Y125.218
G1 X135.993 Y128.806 E.15591
G1 X135.993 Y128.273
G1 X139.581 Y124.685 E.15591
M73 P36 R15
G1 X139.581 Y124.151
G1 X135.993 Y127.739 E.15591
G1 X135.993 Y127.206
G1 X139.581 Y123.618 E.15591
G1 X139.581 Y123.085
G1 X135.993 Y126.673 E.15591
G1 X135.993 Y126.14
G1 X139.581 Y122.552 E.15591
G1 X139.581 Y122.018
G1 X135.993 Y125.606 E.15591
G1 X135.993 Y125.073
G1 X139.581 Y121.485 E.15591
G1 X139.573 Y120.96
G1 X135.993 Y124.54 E.15556
G1 X135.993 Y124.006
G1 X139.446 Y120.553 E.15007
G1 X139.219 Y120.248
G1 X135.993 Y123.473 E.14017
G1 X135.945 Y122.988
G1 X138.902 Y120.031 E.1285
G1 X138.478 Y119.922
G1 X135.993 Y122.407 E.10799
G1 X135.993 Y121.873
G1 X137.948 Y119.918 E.08498
G1 X137.415 Y119.918
G1 X135.993 Y121.34 E.0618
G1 X135.993 Y120.807
G1 X136.882 Y119.918 E.03863
G1 X136.349 Y119.918
G1 X135.945 Y120.322 E.01755
; WIPE_START
M204 S6000
G1 X136.349 Y119.918 E-.21707
G1 X136.882 Y119.918 E-.20263
G1 X136.249 Y120.551 E-.3403
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.06 Y120.139 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973052
G1 F15000
M204 S6000
G1 X138.956 Y120.058 E.00059
; WIPE_START
G1 X139.06 Y120.139 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.017 Y127.772 Z1.2 F42000
G1 X138.974 Y135.446 Z1.2
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.247819
G1 F15000
M204 S6000
G1 X137.99 Y135.694 E.01695
M204 S10000
G1 X138.937 Y135.484 F42000
; LINE_WIDTH: 0.327324
G1 F12658.073
M204 S6000
G3 X138.376 Y135.55 I-.622 J-2.853 E.01309
G1 X135.519 Y135.55 E.06623
M204 S10000
G1 X133.921 Y135.55 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X135.171 Y135.55 E.04144
G1 X135.171 Y135.171 E.01258
G1 X120.83 Y120.83 E.67277
G1 X120.83 Y120.962 E.00439
G1 X120.626 Y120.963 E.00675
G1 X120.626 Y127.698 E.22343
G1 X127.873 Y120.451 E.33999
G1 X128.127 Y120.451 E.0084
G1 X135.374 Y127.698 E.33999
G1 X135.374 Y128.302 E.02003
G1 X128.126 Y135.55 E.34
G1 X127.874 Y135.55 E.00838
G1 X120.626 Y128.302 E.34
G1 X120.626 Y135.374 E.23459
G1 X135.374 Y120.626 E.69186
G1 X135.374 Y120.451 E.00581
G1 X133.921 Y120.451 E.0482
M204 S10000
G1 X120.481 Y120.45 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.330029
G1 F12538.798
M204 S6000
G1 X117.578 Y120.45 E.06792
G2 X117.433 Y120.461 I.036 J1.49 E.0034
; LINE_WIDTH: 0.293452
G1 F14369.441
G1 X117.056 Y120.523 E.0078
; WIPE_START
G1 X117.433 Y120.461 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.024 Y127.926 Z1.2 F42000
G1 X120.071 Y132.841 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F10588.235
M204 S6000
G1 X120.007 Y132.878 E.00204
G1 X120.056 Y132.906 E.00155
M204 S10000
G1 X120.031 Y121.028 F42000
G1 F10588.235
M204 S6000
G1 X119.968 Y121.065 E.00204
G1 X120.016 Y121.093 E.00155
M204 S10000
G1 X120.055 Y135.678 F42000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S2000
G1 X119.651 Y136.083 E.01758
G1 X119.117 Y136.083
G1 X120.007 Y135.193 E.03866
G1 X120.007 Y134.66
G1 X118.584 Y136.083 E.06183
G1 X118.051 Y136.083
G1 X120.007 Y134.126 E.08501
G1 X120.007 Y133.593
G1 X117.521 Y136.08 E.10805
G1 X117.099 Y135.968
G1 X120.055 Y133.012 E.12848
G1 X120.007 Y132.527
G1 X116.782 Y135.751 E.14013
G1 X116.553 Y135.448
G1 X120.007 Y131.993 E.15011
G1 X120.007 Y131.46
G1 X116.427 Y135.04 E.15558
G1 X116.417 Y134.517
G1 X120.007 Y130.927 E.15599
G1 X120.007 Y130.394
G1 X116.417 Y133.983 E.15599
G1 X116.417 Y133.45
G1 X120.007 Y129.86 E.15599
G1 X120.007 Y129.327
G1 X116.417 Y132.917 E.15599
G1 X116.417 Y132.384
G1 X120.007 Y128.794 E.15599
G1 X120.007 Y128.261
G1 X116.417 Y131.85 E.15599
G1 X116.417 Y131.317
G1 X120.007 Y127.727 E.15599
G1 X120.007 Y127.194
G1 X116.417 Y130.784 E.15599
G1 X116.417 Y130.251
G1 X120.007 Y126.661 E.15599
G1 X120.007 Y126.128
G1 X116.417 Y129.717 E.15599
G1 X116.417 Y129.184
G1 X120.007 Y125.594 E.15599
G1 X120.007 Y125.061
G1 X116.417 Y128.651 E.15599
G1 X116.417 Y128.118
G1 X120.007 Y124.528 E.15599
G1 X120.007 Y123.995
G1 X116.417 Y127.584 E.15599
G1 X116.417 Y127.051
G1 X120.007 Y123.461 E.15599
G1 X120.007 Y122.928
G1 X116.417 Y126.518 E.15599
G1 X116.417 Y125.984
G1 X120.007 Y122.395 E.15599
G1 X120.007 Y121.861
G1 X116.417 Y125.451 E.15599
G1 X116.417 Y124.918
G1 X120.007 Y121.328 E.15599
G1 X119.734 Y121.068
G1 X116.417 Y124.385 E.14413
G1 X116.417 Y123.851
G1 X119.201 Y121.068 E.12096
G1 X118.668 Y121.068
G1 X116.417 Y123.318 E.09779
G1 X116.417 Y122.785
G1 X118.134 Y121.068 E.07461
G1 X117.601 Y121.068
G1 X116.417 Y122.252 E.05144
G1 X116.417 Y121.718
G1 X117.068 Y121.068 E.02827
; WIPE_START
M204 S6000
G1 X116.417 Y121.718 E-.34961
G1 X116.417 Y122.252 E-.20264
G1 X116.804 Y121.865 E-.20776
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.934 Y129.496 Z1.2 F42000
G1 X117.043 Y135.941 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.097482
G1 F15000
M204 S6000
G1 X116.94 Y135.861 E.00058
; OBJECT_ID: 394
; WIPE_START
G1 X117.043 Y135.941 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X109.423 Y135.516 Z1.2 F42000
G1 X103.37 Y135.178 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X102.385 Y135.898 I-.988 J-.317 E.04328
G1 X81.615 Y135.898 E.68898
G3 X80.619 Y135.178 I.036 J-1.098 E.04326
G1 X84.278 Y135.178 E.12137
G1 X84.278 Y120.822 E.4762
G1 X80.623 Y120.822 E.12123
G3 X81.608 Y120.102 I.998 J.331 E.04317
G1 X102.454 Y120.104 E.6915
G3 X103.371 Y120.822 I-.082 J1.049 E.04094
G1 X99.722 Y120.822 E.12102
G1 X99.722 Y135.178 E.4762
G1 X103.31 Y135.178 E.11902
M204 S250
G1 X103.733 Y135.285 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X103.68 Y135.43 E.00473
G3 X102.395 Y136.29 I-1.297 J-.548 E.05029
G1 X81.605 Y136.29 E.6388
G3 X80.21 Y134.897 I0 J-1.395 E.06728
G1 X80.21 Y121.105 E.42378
G3 X81.603 Y119.71 I1.395 J-.001 E.06728
G1 X102.468 Y119.712 E.64112
G3 X103.788 Y121.032 I-.086 J1.407 E.0627
G1 X103.788 Y134.968 E.42822
G3 X103.748 Y135.227 I-1.406 J-.087 E.00807
M204 S10000
G1 X102.951 Y135.469 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.352279
G1 F11636.975
M204 S6000
G3 X102.376 Y135.538 I-.64 J-2.918 E.01463
G1 X99.519 Y135.538 E.07203
M204 S10000
G1 X99.5 Y134.631 F42000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S2000
G1 X98.456 Y135.676 E.04537
G1 X97.922 Y135.676
G1 X99.5 Y134.098 E.06855
G1 X99.222 Y133.843
G1 X97.389 Y135.676 E.07964
G1 X97.193 Y135.339
G1 X98.689 Y133.843 E.065
G1 X98.155 Y133.843
G1 X97.193 Y134.805 E.04182
G1 X97.193 Y134.272
G1 X97.622 Y133.843 E.01865
; WIPE_START
M204 S6000
G1 X97.193 Y134.272 E-.23066
G1 X97.193 Y134.805 E-.20264
G1 X97.801 Y134.197 E-.3267
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.519 Y134.923 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.105734
G1 F15000
M204 S6000
G1 X99.284 Y135.159 E.0017
; WIPE_START
G1 X99.519 Y134.923 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.335 Y133.824 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.0983363
G1 F15000
M204 S6000
G1 X97.174 Y133.985 E.00103
M204 S10000
G1 X96.971 Y134.74 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X96.971 Y133.861 E.02914
G1 X97.211 Y133.62 E.0113
G1 X97.621 Y133.62 E.01357
G1 X86.38 Y122.379 E.52734
G1 X84.626 Y122.379 E.05817
G1 X84.626 Y127.698 E.17642
G1 X91.873 Y120.451 E.33996
G1 X92.127 Y120.451 E.00844
G1 X99.374 Y127.698 E.33996
G1 X99.374 Y128.302 E.02003
G1 X92.126 Y135.55 E.34
G1 X91.874 Y135.55 E.00838
G1 X84.626 Y128.302 E.34
G1 X84.626 Y133.62 E.17643
G1 X86.38 Y133.62 E.05817
G1 X97.621 Y122.379 E.52734
G1 X97.211 Y122.379 E.01357
G1 X96.971 Y122.139 E.0113
G1 X96.971 Y121.26 E.02914
; WIPE_START
G1 X96.971 Y122.139 E-.33383
G1 X97.211 Y122.379 E-.1295
G1 X97.621 Y122.379 E-.15543
G1 X97.358 Y122.642 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.5 Y121.3 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S2000
G1 X98.643 Y122.157 E.03725
G1 X98.109 Y122.157
G1 X99.406 Y120.86 E.05636
G1 X99.296 Y120.437
G1 X97.576 Y122.157 E.07475
G1 X97.193 Y122.007
G1 X98.874 Y120.326 E.07306
G1 X98.341 Y120.326
G1 X97.193 Y121.474 E.04989
G1 X97.193 Y120.941
G1 X97.808 Y120.326 E.02671
M204 S10000
G1 X99.519 Y120.463 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.349508
G1 F11742.143
M204 S6000
G1 X102.436 Y120.463 E.07288
G3 X102.964 Y120.542 I-.184 J3.039 E.01334
; WIPE_START
G1 X102.436 Y120.463 E-.20265
G1 X100.969 Y120.463 E-.55735
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.982 Y128.028 Z1.2 F42000
G1 X102.909 Y134.955 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S2000
G1 X103.581 Y134.283 E.0292
G1 X103.581 Y133.75
G1 X102.376 Y134.955 E.05237
G1 X101.842 Y134.955
G1 X103.581 Y133.217 E.07554
G1 X103.581 Y132.684
G1 X101.309 Y134.955 E.09872
G1 X100.776 Y134.955
G1 X103.581 Y132.15 E.12189
G1 X103.581 Y131.617
G1 X100.243 Y134.955 E.14506
G1 X99.945 Y134.72
G1 X103.581 Y131.084 E.158
G1 X103.581 Y130.551
G1 X99.945 Y134.187 E.158
G1 X99.993 Y133.605
G1 X103.581 Y130.017 E.15591
G1 X103.581 Y129.484
G1 X99.993 Y133.072 E.15591
G1 X99.993 Y132.539
G1 X103.581 Y128.951 E.15591
G1 X103.581 Y128.418
G1 X99.993 Y132.005 E.15591
G1 X99.993 Y131.472
G1 X103.581 Y127.884 E.15591
G1 X103.581 Y127.351
G1 X99.993 Y130.939 E.15591
G1 X99.993 Y130.406
G1 X103.581 Y126.818 E.15591
G1 X103.581 Y126.285
G1 X99.993 Y129.872 E.15591
G1 X99.993 Y129.339
G1 X103.581 Y125.751 E.15591
G1 X103.581 Y125.218
G1 X99.993 Y128.806 E.15591
G1 X99.993 Y128.273
G1 X103.581 Y124.685 E.15591
G1 X103.581 Y124.151
G1 X99.993 Y127.739 E.15591
G1 X99.993 Y127.206
G1 X103.581 Y123.618 E.15591
G1 X103.581 Y123.085
G1 X99.993 Y126.673 E.15591
G1 X99.993 Y126.14
G1 X103.581 Y122.552 E.15591
G1 X103.581 Y122.018
G1 X99.993 Y125.606 E.15591
G1 X99.993 Y125.073
G1 X103.581 Y121.485 E.15591
G1 X103.488 Y121.045
G1 X99.993 Y124.54 E.15188
G1 X99.993 Y124.006
G1 X102.955 Y121.045 E.1287
M73 P37 R15
G1 X102.421 Y121.045
G1 X99.993 Y123.473 E.10553
G1 X99.993 Y122.94
G1 X101.888 Y121.045 E.08236
G1 X101.355 Y121.045
G1 X99.993 Y122.407 E.05919
G1 X99.945 Y121.922
G1 X100.822 Y121.045 E.03811
G1 X100.288 Y121.045
G1 X99.945 Y121.388 E.01493
; WIPE_START
M204 S6000
G1 X100.288 Y121.045 E-.18467
G1 X100.822 Y121.045 E-.20264
G1 X100.128 Y121.738 E-.37269
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.499 Y121.971 Z1.2 F42000
G1 X86.378 Y122.157 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X86.807 Y121.728 E.01866
G1 X86.807 Y121.195
G1 X85.845 Y122.157 E.04183
G1 X85.311 Y122.157
G1 X86.807 Y120.661 E.065
G1 X86.61 Y120.325
G1 X84.778 Y122.157 E.07962
G1 X84.5 Y121.902
G1 X86.077 Y120.325 E.06852
G1 X85.544 Y120.325
G1 X84.5 Y121.368 E.04535
M204 S10000
G1 X86.826 Y122.015 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0984282
G1 F15000
M204 S6000
G1 X86.665 Y122.176 E.00103
; WIPE_START
G1 X86.826 Y122.015 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.716 Y120.843 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.104463
G1 F15000
M204 S6000
G1 X84.481 Y121.077 E.00166
M204 S10000
G1 X84.481 Y120.462 F42000
; LINE_WIDTH: 0.354959
G1 F11537.029
M204 S6000
G1 X81.579 Y120.463 E.07381
G2 X81.436 Y120.473 I.036 J1.461 E.00363
; LINE_WIDTH: 0.319123
G1 F13033.896
G1 X81.04 Y120.539 E.00903
; WIPE_START
G1 X81.436 Y120.473 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.826 Y127.978 Z1.2 F42000
G1 X84.055 Y134.612 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S2000
G1 X83.712 Y134.955 E.01494
G1 X83.178 Y134.955
G1 X84.055 Y134.078 E.03811
G1 X84.007 Y133.593
G1 X82.645 Y134.955 E.05919
G1 X82.112 Y134.955
G1 X84.007 Y133.06 E.08236
G1 X84.007 Y132.527
G1 X81.578 Y134.955 E.10554
G1 X81.045 Y134.955
G1 X84.007 Y131.993 E.12871
G1 X84.007 Y131.46
G1 X80.512 Y134.955 E.15188
G1 X80.417 Y134.517
G1 X84.007 Y130.927 E.15599
G1 X84.007 Y130.394
G1 X80.417 Y133.983 E.15599
G1 X80.417 Y133.45
G1 X84.007 Y129.86 E.15599
G1 X84.007 Y129.327
G1 X80.417 Y132.917 E.15599
G1 X80.417 Y132.384
G1 X84.007 Y128.794 E.15599
G1 X84.007 Y128.261
G1 X80.417 Y131.85 E.15599
G1 X80.417 Y131.317
G1 X84.007 Y127.727 E.15599
G1 X84.007 Y127.194
G1 X80.417 Y130.784 E.15599
G1 X80.417 Y130.251
G1 X84.007 Y126.661 E.15599
G1 X84.007 Y126.128
G1 X80.417 Y129.717 E.15599
G1 X80.417 Y129.184
G1 X84.007 Y125.594 E.15599
G1 X84.007 Y125.061
G1 X80.417 Y128.651 E.15599
G1 X80.417 Y128.118
G1 X84.007 Y124.528 E.15599
G1 X84.007 Y123.995
G1 X80.417 Y127.584 E.15599
G1 X80.417 Y127.051
G1 X84.007 Y123.461 E.15599
G1 X84.007 Y122.928
G1 X80.417 Y126.518 E.15599
G1 X80.417 Y125.984
G1 X84.007 Y122.395 E.15599
G1 X84.055 Y121.813
G1 X80.417 Y125.451 E.15808
G1 X80.417 Y124.918
G1 X84.055 Y121.28 E.15808
G1 X83.757 Y121.045
G1 X80.417 Y124.385 E.14514
G1 X80.417 Y123.851
G1 X83.224 Y121.045 E.12197
G1 X82.691 Y121.045
G1 X80.417 Y123.318 E.09879
G1 X80.417 Y122.785
G1 X82.158 Y121.045 E.07562
G1 X81.624 Y121.045
G1 X80.417 Y122.252 E.05245
G1 X80.417 Y121.718
G1 X81.091 Y121.045 E.02928
; WIPE_START
M204 S6000
G1 X80.417 Y121.718 E-.36205
G1 X80.417 Y122.252 E-.20264
G1 X80.781 Y121.888 E-.19532
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.931 Y129.519 Z1.2 F42000
G1 X81.049 Y135.469 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.352145
G1 F11642.027
M204 S6000
G2 X81.624 Y135.538 I.642 J-2.935 E.01462
G1 X84.481 Y135.538 E.072
M204 S10000
G1 X86.191 Y135.676 F42000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S2000
G1 X86.807 Y135.059 E.02678
G1 X86.807 Y134.526
G1 X85.658 Y135.676 E.04996
G1 X85.124 Y135.676
G1 X86.807 Y133.993 E.07313
G1 X86.424 Y133.843
G1 X84.704 Y135.563 E.07475
G1 X84.594 Y135.139
G1 X85.89 Y133.843 E.05634
G1 X85.357 Y133.843
G1 X84.5 Y134.7 E.03724
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.055
M204 S6000
G1 X85.357 Y133.843 E-.46056
G1 X85.89 Y133.843 E-.20264
G1 X85.71 Y134.023 E-.0968
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 5/42
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
M106 S201.45
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z1.2 I.178 J1.204 P1  F42000
G1 X172.198 Y121.223 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X172.198 Y134.777 E.44962
G1 X175.397 Y134.777 E.1061
G3 X174.385 Y135.898 I-1.004 J.111 E.05657
G1 X153.615 Y135.898 E.68899
G3 X152.604 Y134.777 I-.007 J-1.011 E.05655
G1 X155.802 Y134.777 E.1061
G1 X155.802 Y121.223 E.44962
G1 X152.603 Y121.223 E.1061
G3 X153.608 Y120.102 I1.013 J-.103 E.05618
G1 X174.444 Y120.104 E.69119
G3 X175.403 Y121.223 I-.059 J1.021 E.05458
G1 X172.258 Y121.223 E.10434
M204 S250
G1 X172.59 Y121.615 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X172.59 Y134.385 E.39239
G1 X173.302 Y134.385 E.02189
G1 X173.31 Y134.185 E.00615
G1 X173.69 Y134.185 E.01169
G1 X173.695 Y134.385 E.00615
G1 X174.502 Y134.385 E.02482
G1 X174.51 Y134.185 E.00615
G1 X174.89 Y134.185 E.01169
G1 X174.895 Y134.385 E.00615
G1 X175.789 Y134.385 E.0275
G3 X175.783 Y135.034 I-4.555 J.282 E.01995
G3 X174.395 Y136.29 I-1.394 J-.145 E.06302
G1 X153.605 Y136.29 E.6388
G3 X152.212 Y134.968 I.012 J-1.408 E.06495
G1 X152.21 Y134.385 E.01791
G1 X153.102 Y134.385 E.02741
G1 X153.11 Y134.185 E.00615
G1 X153.49 Y134.185 E.01169
G1 X153.495 Y134.385 E.00615
G1 X154.305 Y134.385 E.02491
G1 X154.31 Y134.185 E.00614
G1 X154.69 Y134.186 E.01169
G1 X154.698 Y134.385 E.00613
G1 X155.41 Y134.385 E.02189
G1 X155.41 Y121.615 E.39239
G1 X154.698 Y121.615 E.02189
G1 X154.69 Y121.815 E.00615
G1 X154.31 Y121.815 E.01169
G1 X154.305 Y121.615 E.00615
G1 X153.498 Y121.615 E.02482
G1 X153.49 Y121.815 E.00615
G1 X153.11 Y121.815 E.01169
G1 X153.105 Y121.615 E.00615
G1 X152.21 Y121.615 E.0275
G3 X152.217 Y120.966 I4.553 J-.282 E.01995
G3 X153.603 Y119.71 I1.394 J.145 E.06295
G1 X174.463 Y119.712 E.64098
G3 X175.79 Y121.105 I-.073 J1.398 E.06519
G1 X175.79 Y121.615 E.01566
G1 X174.898 Y121.615 E.02742
G1 X174.89 Y121.815 E.00615
G1 X174.51 Y121.815 E.01169
G1 X174.505 Y121.615 E.00615
G1 X173.695 Y121.615 E.02491
G1 X173.69 Y121.815 E.00614
G1 X173.31 Y121.814 E.01169
G1 X173.302 Y121.615 E.00613
G1 X172.65 Y121.615 E.02005
; WIPE_START
M204 S6000
G1 X172.641 Y123.615 E-.76
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
G1 X174.941 Y120.841 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.398953
G1 F10111.434
M204 S6000
G1 X174.859 Y120.7 E.00475
G1 X174.661 Y120.555 E.00711
G1 X174.382 Y120.485 E.00835
G1 X171.994 Y120.485 E.06926
; LINE_WIDTH: 0.413005
G1 F9727.495
G1 X171.748 Y120.499 E.00746
; LINE_WIDTH: 0.448347
G1 F8879.53
G1 X171.501 Y120.513 E.00817
G1 X171.501 Y120.789 E.00911
; LINE_WIDTH: 0.435219
G1 F9176.69
G1 X171.537 Y120.862 E.0026
; LINE_WIDTH: 0.395735
G1 F10203.647
G1 X171.573 Y120.935 E.00234
; LINE_WIDTH: 0.356252
G1 F11489.423
G1 X171.61 Y121.007 E.00208
; LINE_WIDTH: 0.291218
G1 F12000
G1 X171.622 Y121.103 E.00195
G1 X171.622 Y134.895 E.27906
; LINE_WIDTH: 0.31168
G1 X171.604 Y134.959 E.00146
; LINE_WIDTH: 0.35292
G1 F11612.903
G1 X171.586 Y135.023 E.00168
; LINE_WIDTH: 0.39416
G1 F10249.402
G1 X171.568 Y135.088 E.00191
; LINE_WIDTH: 0.452756
G1 F8784.013
G3 X171.501 Y135.209 I-.164 J-.011 E.00478
G1 X171.501 Y135.488 E.00932
; LINE_WIDTH: 0.441973
G1 F9021.369
G1 X171.748 Y135.502 E.00803
; LINE_WIDTH: 0.400001
G1 F10081.767
G1 X171.994 Y135.516 E.00719
G1 X174.367 Y135.516 E.06903
G1 X174.494 Y135.5 E.00372
G1 X174.788 Y135.368 E.00939
G1 X174.953 Y135.158 E.00777
G2 X174.367 Y135.159 I-.264 J17.863 E.01707
G1 X171.994 Y135.159 E.06903
; LINE_WIDTH: 0.413878
G1 F9704.615
G1 X171.924 Y135.145 E.00218
; LINE_WIDTH: 0.441973
G1 F9021.369
G1 X171.853 Y135.131 E.00235
; LINE_WIDTH: 0.4354
G1 F9172.442
G1 X171.857 Y135.072 E.00189
; LINE_WIDTH: 0.39416
G1 F10249.402
G1 X171.862 Y135.013 E.00169
; LINE_WIDTH: 0.35292
G1 F11612.903
G1 X171.866 Y134.954 E.00149
; LINE_WIDTH: 0.291148
G1 F12000
G1 X171.87 Y121.103 E.28017
; LINE_WIDTH: 0.311548
G1 X171.866 Y121.044 E.00128
; LINE_WIDTH: 0.352523
G1 F11627.812
G1 X171.862 Y120.986 E.00148
; LINE_WIDTH: 0.393498
G1 F10268.77
G1 X171.858 Y120.928 E.00167
; LINE_WIDTH: 0.429154
G1 F9320.773
G1 X171.853 Y120.869 E.00184
G1 X171.994 Y120.841 E.00453
; LINE_WIDTH: 0.398956
G1 F10111.351
G1 X174.881 Y120.841 E.08376
M204 S10000
G1 X156.499 Y120.716 F42000
; LINE_WIDTH: 0.45593
G1 F8716.496
M204 S6000
G1 X156.499 Y120.512 E.00685
; LINE_WIDTH: 0.441878
G1 F9023.517
G1 X156.252 Y120.498 E.00803
; LINE_WIDTH: 0.400331
G1 F10072.449
G1 X156.006 Y120.484 E.00719
G1 X153.644 Y120.484 E.06878
G1 X153.28 Y120.587 E.01102
G2 X153.05 Y120.841 I.272 J.478 E.01015
G1 X156.006 Y120.841 E.08608
; LINE_WIDTH: 0.413773
G1 F9707.363
G1 X156.076 Y120.855 E.00218
; LINE_WIDTH: 0.441878
G1 F9023.517
G1 X156.147 Y120.869 E.00235
; LINE_WIDTH: 0.435323
G1 F9174.253
G1 X156.143 Y120.928 E.00189
; LINE_WIDTH: 0.394108
G1 F10250.934
G1 X156.138 Y120.987 E.00169
; LINE_WIDTH: 0.352893
G1 F11613.933
G1 X156.134 Y121.046 E.00149
; LINE_WIDTH: 0.291158
G1 F12000
G1 X156.13 Y134.897 E.28018
; LINE_WIDTH: 0.311638
G1 X156.134 Y134.956 E.00128
; LINE_WIDTH: 0.352773
G1 F11618.432
G1 X156.138 Y135.014 E.00148
; LINE_WIDTH: 0.393908
G1 F10256.775
G1 X156.142 Y135.073 E.00168
; LINE_WIDTH: 0.429842
G1 F9304.221
G1 X156.147 Y135.131 E.00185
G1 X156.006 Y135.159 E.00453
; LINE_WIDTH: 0.399825
G1 F10086.735
G1 X153.055 Y135.159 E.0858
G1 X153.113 Y135.264 E.00347
G1 X153.374 Y135.457 E.00945
G1 X153.663 Y135.516 E.00858
G1 X156.006 Y135.516 E.06813
; LINE_WIDTH: 0.413775
G1 F9707.297
G1 X156.252 Y135.502 E.00747
; LINE_WIDTH: 0.449033
G1 F8864.544
G1 X156.499 Y135.488 E.00818
G1 X156.499 Y135.211 E.00916
; LINE_WIDTH: 0.435764
G1 F9163.958
G1 X156.463 Y135.138 E.00261
; LINE_WIDTH: 0.39607
G1 F10193.969
G1 X156.427 Y135.066 E.00234
; LINE_WIDTH: 0.356377
G1 F11484.842
G1 X156.39 Y134.993 E.00208
; LINE_WIDTH: 0.291228
G1 F12000
G1 X156.378 Y134.897 E.00195
G1 X156.378 Y121.105 E.27907
; LINE_WIDTH: 0.311678
G1 X156.396 Y121.041 E.00146
; LINE_WIDTH: 0.352893
G1 F11613.933
G1 X156.414 Y120.977 E.00168
; LINE_WIDTH: 0.394108
G1 F10250.934
G1 X156.432 Y120.913 E.00191
; LINE_WIDTH: 0.447193
G1 F8904.887
G3 X156.499 Y120.776 I.888 J.351 E.00502
M204 S10000
G1 X158.078 Y135.55 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X156.909 Y135.55 E.0388
G1 X156.909 Y135.091 E.01522
G1 X171.091 Y120.909 E.6653
G1 X171.295 Y121.153 E.01054
G1 X171.295 Y127.619 E.21448
G1 X164.127 Y120.451 E.33624
G1 X163.873 Y120.451 E.00844
G1 X156.705 Y127.619 E.33624
G1 X156.705 Y128.381 E.02529
G1 X163.874 Y135.55 E.33629
G1 X164.126 Y135.55 E.00838
G1 X171.295 Y128.381 E.33629
G1 X171.295 Y134.845 E.21441
G1 X171.091 Y135.091 E.0106
G1 X156.909 Y120.909 E.66533
G1 X156.909 Y120.451 E.0152
G1 X158.079 Y120.451 E.03882
; OBJECT_ID: 405
; WIPE_START
G1 X156.909 Y120.451 E-.44468
G1 X156.909 Y120.909 E-.17409
G1 X157.172 Y121.172 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X149.539 Y121.192 Z1.4 F42000
G1 X119.802 Y121.273 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X116.603 Y121.273 E.1061
G3 X117.608 Y120.102 I1.017 J-.144 E.0579
G1 X135.722 Y120.102 E.60089
G1 X135.722 Y122.793 E.08926
G1 X136.198 Y122.793 E.01578
G1 X136.198 Y134.727 E.39588
G1 X139.397 Y134.727 E.1061
G3 X138.385 Y135.898 I-1.007 J.152 E.05829
G1 X120.278 Y135.898 E.60065
G1 X120.278 Y133.207 E.08926
G1 X119.802 Y133.207 E.01578
G1 X119.802 Y121.333 E.39389
M204 S250
G1 X119.41 Y121.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X116.21 Y121.665 E.09831
G3 X116.217 Y120.966 I4.894 J-.307 E.02149
G3 X117.603 Y119.71 I1.394 J.145 E.06295
G1 X136.59 Y119.71 E.58342
G1 X136.59 Y120.885 E.0361
G1 X138.99 Y120.885 E.07375
G1 X138.99 Y121.265 E.01168
G1 X136.59 Y121.265 E.07375
G1 X136.59 Y134.335 E.4016
G1 X139.79 Y134.335 E.09831
G3 X139.783 Y135.034 I-4.895 J.307 E.02149
G3 X138.395 Y136.29 I-1.394 J-.145 E.06302
G1 X119.41 Y136.29 E.58335
G1 X119.41 Y135.115 E.0361
G1 X117.01 Y135.115 E.07375
G1 X117.01 Y134.735 E.01168
G1 X119.41 Y134.735 E.07375
G1 X119.41 Y121.725 E.39976
; WIPE_START
M204 S6000
G1 X117.41 Y121.688 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.309 Y129.08 Z1.4 F42000
G1 X120.254 Y132.755 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.53922
G1 F7253.678
M204 S6000
M73 P38 R15
G1 X120.254 Y121.088 E.47186
M204 S10000
G1 X120.467 Y120.606 F42000
; LINE_WIDTH: 0.51917
G1 F7559.055
M204 S6000
G1 X120.467 Y120.544 E.00241
G1 X120.184 Y120.544 E.01101
; LINE_WIDTH: 0.495585
G1 F7952.901
G1 X120.095 Y120.52 E.0034
; LINE_WIDTH: 0.425708
G1 F9404.689
G1 X120.006 Y120.497 E.00287
G1 X117.637 Y120.497 E.07389
; LINE_WIDTH: 0.42174
G1 F9503.215
G1 X117.395 Y120.537 E.00755
G1 X117.206 Y120.653 E.00686
G1 X117.046 Y120.885 E.00868
G3 X120.006 Y120.878 I1.781 J144.803 E.09135
; LINE_WIDTH: 0.448415
G1 F8878.038
G1 X120.058 Y120.867 E.00178
; LINE_WIDTH: 0.495585
G1 F7952.901
G1 X120.111 Y120.856 E.00199
; LINE_WIDTH: 0.529742
G1 F7394.911
M73 P38 R14
G1 X120.249 Y121.028 E.00876
G3 X120.431 Y120.654 I.62 J.07 E.01684
M204 S10000
G1 X133.921 Y120.45 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X135.374 Y120.45 E.04819
G1 X135.374 Y120.626 E.00583
G1 X120.626 Y135.374 E.69186
G1 X120.626 Y133.183 E.07266
G1 X120.705 Y133.104 E.00372
G1 X120.705 Y128.381 E.15667
G1 X127.874 Y135.55 E.33629
G1 X128.126 Y135.55 E.00838
G1 X135.295 Y128.381 E.33629
G1 X135.295 Y127.619 E.02529
G1 X128.126 Y120.45 E.33629
G1 X127.874 Y120.45 E.00838
G1 X120.705 Y127.619 E.33629
G1 X120.705 Y121.005 E.21939
G1 X120.855 Y120.855 E.00703
G1 X135.146 Y135.146 E.67042
G1 X135.091 Y135.2 E.00256
G1 X135.091 Y135.55 E.01158
G1 X133.889 Y135.55 E.03987
M204 S10000
G1 X135.746 Y123.245 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.5392
G1 F7253.969
M204 S6000
G1 X135.746 Y134.914 E.47191
M204 S10000
G1 X138.92 Y135.188 F42000
; LINE_WIDTH: 0.424392
G1 F9437.137
M204 S6000
G1 X138.94 Y135.12 E.00219
G3 X135.994 Y135.122 I-2.173 J-1944.539 E.09158
; LINE_WIDTH: 0.448485
G1 F8876.505
G1 X135.942 Y135.133 E.00178
; LINE_WIDTH: 0.495795
G1 F7949.213
G1 X135.889 Y135.145 E.00198
; LINE_WIDTH: 0.524611
G1 F7473.675
G1 X135.748 Y134.974 E.0087
G3 X135.533 Y135.395 I-.679 J-.081 E.01896
G1 X135.533 Y135.456 E.0024
G1 X135.817 Y135.456 E.01116
; LINE_WIDTH: 0.495795
G1 F7949.213
G1 X135.906 Y135.48 E.00338
; LINE_WIDTH: 0.425236
G1 F9416.314
G1 X135.994 Y135.503 E.00286
G1 X138.372 Y135.503 E.07408
G1 X138.701 Y135.417 E.01057
G1 X138.878 Y135.231 E.00801
; WIPE_START
G1 X138.701 Y135.417 E-.09776
G1 X138.372 Y135.503 E-.12898
G1 X136.969 Y135.503 E-.53326
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.503 Y127.885 Z1.4 F42000
G1 X136.164 Y122.351 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51852
G1 F7569.386
M204 S6000
G1 X136.164 Y120.196 E.08352
; WIPE_START
G1 X136.164 Y122.196 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.311 Y127.095 Z1.4 F42000
G1 X119.836 Y135.864 Z1.4
G1 Z1
G1 E.8 F1800
G1 F7569.386
M204 S6000
G1 X119.836 Y133.709 E.08352
; OBJECT_ID: 394
; WIPE_START
G1 X119.836 Y135.709 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X112.216 Y135.27 Z1.4 F42000
G1 X97.79 Y134.44 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X103.41 Y134.44 E.17269
G1 X103.41 Y135.66 E.03749
G1 X97.79 Y135.66 E.17269
G1 X97.79 Y134.5 E.03564
; WIPE_START
M204 S6000
G1 X99.79 Y134.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.59 Y134.31 Z1.4 F42000
G1 Z1
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X100.59 Y121.69 E.38778
G1 X103.56 Y121.69 E.09126
G1 X103.56 Y134.31 E.38778
G1 X100.65 Y134.31 E.08942
; WIPE_START
M204 S6000
G1 X100.641 Y132.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.684 Y124.933 Z1.4 F42000
G1 X97.79 Y121.56 Z1.4
G1 Z1
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X97.79 Y120.34 E.03749
G1 X103.41 Y120.34 E.17269
G1 X103.41 Y121.56 E.03749
G1 X97.85 Y121.56 E.17084
M204 S10000
G1 X97.398 Y121.56 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.398 Y121.952 E.01301
G1 X100.198 Y121.952 E.09288
G1 X100.198 Y134.048 E.40124
G1 X97.398 Y134.048 E.09288
G1 X97.398 Y135.898 E.06137
G1 X86.602 Y135.898 E.35812
G1 X86.602 Y134.048 E.06137
G1 X83.802 Y134.048 E.09288
G1 X83.802 Y121.952 E.40124
G1 X86.602 Y121.952 E.09288
G1 X86.602 Y120.102 E.06135
G1 X97.398 Y120.103 E.35812
G1 X97.398 Y121.5 E.04633
; WIPE_START
G1 X97.398 Y121.952 E-.17179
G1 X98.946 Y121.952 E-.58821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.317 Y121.717 Z1.4 F42000
G1 X86.21 Y121.56 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X80.59 Y121.56 E.17269
G1 X80.59 Y120.34 E.03749
G1 X86.21 Y120.34 E.17269
G1 X86.21 Y121.5 E.03564
; WIPE_START
M204 S6000
G1 X84.21 Y121.521 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.734 Y129.139 Z1.4 F42000
G1 X83.41 Y134.31 Z1.4
G1 Z1
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X80.44 Y134.31 E.09126
G1 X80.44 Y121.69 E.38778
G1 X83.41 Y121.69 E.09126
G1 X83.41 Y134.25 E.38593
; WIPE_START
M204 S6000
G1 X81.41 Y134.29 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.21 Y134.44 Z1.4 F42000
G1 Z1
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X86.21 Y135.66 E.03749
G1 X80.59 Y135.66 E.17269
G1 X80.59 Y134.44 E.03749
G1 X86.15 Y134.44 E.17084
; WIPE_START
M204 S6000
G1 X86.21 Y135.66 E-.46416
G1 X85.431 Y135.66 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.062 Y135.491 Z1.4 F42000
G1 X103.742 Y135.254 Z1.4
G1 Z1
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X103.621 Y135.552 E.0099
G3 X102.395 Y136.29 I-1.239 J-.671 E.04611
G1 X81.605 Y136.29 E.6388
G3 X80.21 Y134.897 I-.001 J-1.395 E.06728
G1 X80.21 Y121.105 E.42378
G3 X81.603 Y119.71 I1.395 J-.001 E.06728
G1 X102.466 Y119.712 E.64106
G3 X103.788 Y121.032 I-.084 J1.407 E.06276
G1 X103.788 Y134.968 E.42822
G3 X103.755 Y135.196 I-1.406 J-.087 E.00708
M204 S10000
G1 X103.056 Y135.89 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213283
G1 F15000
M204 S6000
G3 X102.665 Y135.958 I-1.146 J-5.414 E.00551
; LINE_WIDTH: 0.280218
G3 X102.387 Y135.975 I-.271 J-2.199 E.0054
G1 X97.594 Y135.975 E.09268
; WIPE_START
G1 X99.594 Y135.975 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.746 Y133.596 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.5392
G1 F7253.969
M204 S6000
G1 X99.746 Y122.464 E.45021
; WIPE_START
G1 X99.746 Y124.464 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.05 Y121.322 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.05 Y122.3 E.03245
G1 X97.7 Y122.3 E.02156
G1 X86.3 Y133.7 E.53477
G1 X84.705 Y133.7 E.05291
G1 X84.705 Y128.381 E.17642
G1 X91.874 Y135.55 E.33629
G1 X92.126 Y135.55 E.00838
G1 X99.295 Y128.381 E.33629
G1 X99.295 Y127.619 E.02529
G1 X92.127 Y120.451 E.33624
G1 X91.873 Y120.451 E.00844
G1 X84.705 Y127.619 E.33624
G1 X84.705 Y122.3 E.17642
G1 X86.3 Y122.3 E.05291
G1 X97.7 Y133.7 E.53477
G1 X97.05 Y133.7 E.02156
G1 X97.05 Y134.678 E.03245
; WIPE_START
G1 X97.05 Y133.7 E-.37176
G1 X97.7 Y133.7 E-.247
G1 X97.437 Y133.437 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.999 Y135.148 Z1.4 F42000
G1 X86.406 Y135.975 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280254
G1 F15000
M204 S6000
G1 X81.613 Y135.975 E.09269
G3 X81.34 Y135.959 I.022 J-2.739 E.00529
; LINE_WIDTH: 0.232453
G1 X80.95 Y135.901 E.00609
M204 S10000
G1 X80.946 Y135.876 F42000
; LINE_WIDTH: 0.105045
G1 F15000
M204 S6000
G1 X81.7 Y136.094 E.00397
; WIPE_START
G1 X80.946 Y135.876 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.254 Y133.596 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.53922
G1 F7253.678
M204 S6000
G1 X84.254 Y122.464 E.45022
; WIPE_START
G1 X84.254 Y124.464 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.406 Y120.025 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.278921
G1 F15000
M204 S6000
G1 X81.552 Y120.026 E.09334
G2 X81.281 Y120.049 I.053 J2.211 E.00523
; LINE_WIDTH: 0.214122
G1 X80.943 Y120.108 E.00479
M204 S10000
G1 X97.594 Y120.026 F42000
; LINE_WIDTH: 0.278293
G1 F15000
M204 S6000
G1 X102.455 Y120.026 E.09323
G3 X102.719 Y120.049 I-.101 J2.68 E.00509
; LINE_WIDTH: 0.214123
G1 X103.057 Y120.108 E.00478
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X102.719 Y120.049 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 6/42
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z1.4 I-.021 J1.217 P1  F42000
G1 X172.198 Y121.223 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X172.198 Y134.777 E.44962
G1 X175.397 Y134.777 E.1061
G3 X174.385 Y135.898 I-1.008 J.108 E.0565
G1 X153.615 Y135.898 E.68898
G3 X152.604 Y134.777 I-.006 J-1.011 E.05655
G1 X155.802 Y134.777 E.1061
G1 X155.802 Y121.223 E.44962
G1 X152.603 Y121.223 E.1061
G3 X153.608 Y120.102 I1.007 J-.108 E.05627
G1 X174.443 Y120.104 E.69113
G3 X175.401 Y121.223 I-.055 J1.017 E.05463
G1 X172.258 Y121.223 E.10425
M204 S250
G1 X172.59 Y121.615 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X172.59 Y134.385 E.39239
G1 X173.303 Y134.385 E.02189
G1 X173.31 Y134.185 E.00615
G1 X173.69 Y134.185 E.01169
G1 X173.695 Y134.385 E.00615
G1 X174.503 Y134.385 E.02483
G1 X174.51 Y134.185 E.00615
G1 X174.89 Y134.185 E.01169
G1 X174.895 Y134.385 E.00615
G1 X175.79 Y134.385 E.0275
G3 X175.783 Y135.034 I-4.55 J.282 E.01996
G3 X174.395 Y136.29 I-1.393 J-.145 E.06302
G1 X153.605 Y136.29 E.6388
G3 X152.212 Y134.968 I.012 J-1.408 E.06495
G1 X152.21 Y134.385 E.01792
G1 X153.103 Y134.385 E.02741
G1 X153.11 Y134.185 E.00615
G1 X153.49 Y134.185 E.01169
G1 X153.495 Y134.385 E.00615
G1 X154.305 Y134.385 E.02491
G1 X154.31 Y134.185 E.00614
G1 X154.69 Y134.186 E.01169
G1 X154.697 Y134.385 E.00613
G1 X155.41 Y134.385 E.0219
G1 X155.41 Y121.615 E.39239
G1 X154.697 Y121.615 E.02189
G1 X154.69 Y121.815 E.00615
G1 X154.31 Y121.815 E.01169
G1 X154.305 Y121.615 E.00615
G1 X153.497 Y121.615 E.02482
G1 X153.49 Y121.815 E.00615
G1 X153.11 Y121.815 E.01169
G1 X153.105 Y121.615 E.00615
G1 X152.21 Y121.615 E.0275
G3 X152.217 Y120.966 I4.552 J-.282 E.01995
G3 X153.603 Y119.71 I1.394 J.145 E.06294
G1 X174.461 Y119.712 E.64092
G3 X175.79 Y121.103 I-.071 J1.398 E.06517
G1 X175.79 Y121.615 E.01574
G1 X174.897 Y121.615 E.02743
G1 X174.89 Y121.815 E.00615
G1 X174.51 Y121.815 E.01169
G1 X174.505 Y121.615 E.00615
G1 X173.695 Y121.615 E.02491
G1 X173.69 Y121.815 E.00614
G1 X173.31 Y121.814 E.01169
G1 X173.302 Y121.615 E.00613
G1 X172.65 Y121.615 E.02005
; WIPE_START
M204 S6000
G1 X172.641 Y123.615 E-.76
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
G1 X174.94 Y120.841 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.398983
G1 F10110.583
M204 S6000
G1 X174.855 Y120.696 E.0049
G1 X174.667 Y120.558 E.00677
G1 X174.38 Y120.485 E.0086
G1 X171.994 Y120.485 E.06921
; LINE_WIDTH: 0.413035
G1 F9726.706
G1 X171.748 Y120.499 E.00746
; LINE_WIDTH: 0.448378
G1 F8878.862
G1 X171.501 Y120.513 E.00817
G1 X171.501 Y120.789 E.00911
; LINE_WIDTH: 0.435244
G1 F9176.105
G1 X171.537 Y120.862 E.0026
; LINE_WIDTH: 0.39575
G1 F10203.214
G1 X171.573 Y120.935 E.00234
; LINE_WIDTH: 0.356257
G1 F11489.24
G1 X171.61 Y121.007 E.00208
; LINE_WIDTH: 0.291218
G1 F12000
G1 X171.622 Y121.103 E.00195
G1 X171.622 Y134.895 E.27906
; LINE_WIDTH: 0.31168
G1 X171.604 Y134.959 E.00146
; LINE_WIDTH: 0.35292
G1 F11612.903
G1 X171.586 Y135.023 E.00168
; LINE_WIDTH: 0.39416
G1 F10249.402
G1 X171.568 Y135.088 E.00191
; LINE_WIDTH: 0.452756
G1 F8784.013
G3 X171.501 Y135.209 I-.164 J-.011 E.00478
G1 X171.501 Y135.488 E.00932
; LINE_WIDTH: 0.441973
G1 F9021.369
G1 X171.748 Y135.502 E.00803
; LINE_WIDTH: 0.398333
G1 F10129.064
G1 X171.994 Y135.516 E.00715
G1 X174.344 Y135.516 E.06806
G1 X174.614 Y135.476 E.0079
G1 X174.777 Y135.381 E.00546
M73 P39 R14
G1 X174.955 Y135.152 E.00839
G3 X171.994 Y135.159 I-1.785 J-129.381 E.08573
; LINE_WIDTH: 0.413878
G1 F9704.615
G1 X171.924 Y135.145 E.00218
; LINE_WIDTH: 0.441973
G1 F9021.369
G1 X171.853 Y135.131 E.00235
; LINE_WIDTH: 0.4354
G1 F9172.442
G1 X171.857 Y135.072 E.00189
; LINE_WIDTH: 0.39416
G1 F10249.402
G1 X171.862 Y135.013 E.00169
; LINE_WIDTH: 0.35292
G1 F11612.903
G1 X171.866 Y134.954 E.00149
; LINE_WIDTH: 0.291148
G1 F12000
G1 X171.87 Y121.103 E.28017
; LINE_WIDTH: 0.311552
G1 X171.866 Y121.044 E.00128
; LINE_WIDTH: 0.352534
G1 F11627.39
G1 X171.862 Y120.986 E.00148
; LINE_WIDTH: 0.393517
G1 F10268.221
G1 X171.858 Y120.928 E.00167
; LINE_WIDTH: 0.429184
G1 F9320.069
G1 X171.853 Y120.869 E.00184
G1 X171.994 Y120.841 E.00453
; LINE_WIDTH: 0.398986
G1 F10110.5
G1 X174.88 Y120.841 E.08373
M204 S10000
G1 X158.079 Y120.451 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X156.909 Y120.451 E.03882
G1 X156.909 Y120.909 E.0152
G1 X171.091 Y135.091 E.66533
G1 X171.295 Y134.845 E.0106
G1 X171.295 Y128.381 E.21441
G1 X164.126 Y135.55 E.33629
G1 X163.874 Y135.55 E.00838
G1 X156.705 Y128.381 E.33629
G1 X156.705 Y127.619 E.02529
G1 X163.873 Y120.451 E.33625
G1 X164.127 Y120.451 E.00844
G1 X171.295 Y127.619 E.33624
G1 X171.295 Y121.153 E.21448
G1 X171.091 Y120.909 E.01054
G1 X156.909 Y135.091 E.6653
G1 X156.909 Y135.55 E.01522
G1 X158.078 Y135.55 E.0388
M204 S10000
G1 X156.499 Y120.716 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.45594
G1 F8716.285
M204 S6000
G1 X156.499 Y120.512 E.00685
; LINE_WIDTH: 0.441885
G1 F9023.347
G1 X156.252 Y120.498 E.00803
; LINE_WIDTH: 0.400331
G1 F10072.445
G1 X156.006 Y120.484 E.00719
G1 X153.644 Y120.484 E.06879
G1 X153.28 Y120.587 E.01101
G2 X153.05 Y120.841 I.266 J.472 E.01015
G1 X156.006 Y120.841 E.08608
; LINE_WIDTH: 0.413775
G1 F9707.297
G1 X156.076 Y120.855 E.00218
; LINE_WIDTH: 0.441885
G1 F9023.347
G1 X156.147 Y120.869 E.00235
; LINE_WIDTH: 0.435332
G1 F9174.049
G1 X156.143 Y120.928 E.00189
; LINE_WIDTH: 0.394114
G1 F10250.751
G1 X156.138 Y120.987 E.00169
; LINE_WIDTH: 0.352897
G1 F11613.792
G1 X156.134 Y121.046 E.00149
; LINE_WIDTH: 0.291158
G1 F12000
G1 X156.13 Y134.897 E.28018
; LINE_WIDTH: 0.311638
G1 X156.134 Y134.956 E.00128
; LINE_WIDTH: 0.352773
G1 F11618.432
G1 X156.138 Y135.014 E.00148
; LINE_WIDTH: 0.393908
G1 F10256.775
G1 X156.142 Y135.073 E.00168
; LINE_WIDTH: 0.429842
G1 F9304.221
G1 X156.147 Y135.131 E.00185
G1 X156.006 Y135.159 E.00453
; LINE_WIDTH: 0.39854
G1 F10123.171
G3 X153.047 Y135.155 I-1.116 J-270.722 E.08574
G1 X153.204 Y135.363 E.00754
G1 X153.492 Y135.503 E.00928
G1 X153.648 Y135.516 E.00453
G1 X156.006 Y135.516 E.06833
; LINE_WIDTH: 0.413775
G1 F9707.297
G1 X156.252 Y135.502 E.00747
; LINE_WIDTH: 0.449033
G1 F8864.544
G1 X156.499 Y135.488 E.00818
G1 X156.499 Y135.211 E.00916
; LINE_WIDTH: 0.435764
G1 F9163.958
G1 X156.463 Y135.138 E.00261
; LINE_WIDTH: 0.39607
G1 F10193.969
G1 X156.427 Y135.066 E.00234
; LINE_WIDTH: 0.356377
G1 F11484.842
G1 X156.39 Y134.993 E.00208
; LINE_WIDTH: 0.291228
G1 F12000
G1 X156.378 Y134.897 E.00195
G1 X156.378 Y121.105 E.27907
; LINE_WIDTH: 0.311679
G1 X156.396 Y121.041 E.00146
; LINE_WIDTH: 0.352897
G1 F11613.792
G1 X156.414 Y120.977 E.00168
; LINE_WIDTH: 0.394114
G1 F10250.751
G1 X156.432 Y120.913 E.00191
; LINE_WIDTH: 0.447202
G1 F8904.686
G3 X156.499 Y120.776 I.887 J.35 E.00502
; OBJECT_ID: 405
; WIPE_START
G1 X156.45 Y120.848 E-.43126
G1 X156.432 Y120.913 E-.32874
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X148.8 Y120.988 Z1.6 F42000
G1 X119.802 Y121.273 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X116.602 Y121.273 E.10615
G3 X117.551 Y120.104 I1.015 J-.145 E.05608
G1 X136.198 Y120.102 E.61855
G1 X136.198 Y134.727 E.48514
G1 X139.398 Y134.727 E.10615
G3 X138.449 Y135.896 I-1.021 J.141 E.056
G1 X119.802 Y135.898 E.61856
G1 X119.802 Y121.333 E.48315
M204 S250
G1 X119.41 Y121.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X116.21 Y121.665 E.09833
G3 X116.252 Y120.762 I3.716 J-.28 E.02783
G3 X117.532 Y119.712 I1.354 J.345 E.05445
G1 X136.59 Y119.71 E.58561
G1 X136.59 Y134.335 E.44939
G1 X139.79 Y134.335 E.09833
G3 X139.749 Y135.236 I-3.819 J.276 E.02777
G3 X138.468 Y136.288 I-1.361 J-.351 E.05447
G1 X119.41 Y136.29 E.58561
G1 X119.41 Y121.725 E.44754
; WIPE_START
M204 S6000
G1 X117.41 Y121.688 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.955 Y129.162 Z1.6 F42000
G1 X120.254 Y135.446 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.53922
G1 F7253.678
M204 S6000
G1 X120.254 Y121.088 E.58068
M204 S10000
G1 X120.467 Y120.606 F42000
; LINE_WIDTH: 0.51938
G1 F7555.724
M204 S6000
G1 X120.467 Y120.545 E.00237
G1 X120.184 Y120.545 E.011
; LINE_WIDTH: 0.49553
G1 F7953.868
G1 X120.095 Y120.522 E.0034
; LINE_WIDTH: 0.424803
G1 F9426.969
G1 X120.006 Y120.498 E.00287
G1 X117.6 Y120.498 E.07487
; LINE_WIDTH: 0.421928
G1 F9498.495
G1 X117.411 Y120.534 E.00593
G1 X117.178 Y120.681 E.00852
G1 X117.038 Y120.882 E.00758
G3 X120.006 Y120.879 I1.771 J244.206 E.09166
; LINE_WIDTH: 0.44783
G1 F8890.864
G1 X120.058 Y120.867 E.00178
; LINE_WIDTH: 0.49553
G1 F7953.868
G1 X120.111 Y120.856 E.00199
; LINE_WIDTH: 0.529887
G1 F7392.699
G1 X120.249 Y121.028 E.00875
G3 X120.431 Y120.654 I.617 J.069 E.01682
M204 S10000
G1 X133.888 Y135.548 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X135.091 Y135.548 E.03992
G1 X135.091 Y135.2 E.01153
G1 X135.146 Y135.146 E.00256
G1 X120.855 Y120.855 E.67042
G1 X120.705 Y121.005 E.00703
G1 X120.705 Y127.619 E.21939
G1 X127.873 Y120.451 E.33624
G1 X128.127 Y120.451 E.00844
G1 X135.295 Y127.619 E.33624
G1 X135.295 Y128.381 E.02529
G1 X128.127 Y135.549 E.33624
G1 X127.873 Y135.549 E.00844
G1 X120.705 Y128.381 E.33624
G1 X120.705 Y135.295 E.22933
G1 X135.295 Y120.705 E.68442
G1 X135.295 Y120.45 E.00845
G1 X133.921 Y120.451 E.04556
M204 S10000
G1 X135.746 Y120.554 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.53921
G1 F7253.823
M204 S6000
G1 X135.746 Y134.914 E.58074
M204 S10000
G1 X138.929 Y135.177 F42000
; LINE_WIDTH: 0.423902
G1 F9449.269
M204 S6000
G1 X138.945 Y135.121 E.0018
G1 X135.994 Y135.121 E.09161
; LINE_WIDTH: 0.4479
G1 F8889.327
G1 X135.942 Y135.133 E.00178
; LINE_WIDTH: 0.49574
G1 F7950.178
G1 X135.889 Y135.144 E.00199
; LINE_WIDTH: 0.524784
G1 F7471
G1 X135.748 Y134.974 E.00869
G3 X135.533 Y135.395 I-.676 J-.08 E.01895
G1 X135.533 Y135.454 E.00235
G1 X135.817 Y135.454 E.01115
; LINE_WIDTH: 0.49574
G1 F7950.178
G1 X135.906 Y135.478 E.00339
; LINE_WIDTH: 0.424618
G1 F9431.555
G1 X135.994 Y135.502 E.00286
G1 X138.393 Y135.502 E.07461
G2 X138.893 Y135.225 I-.062 J-.701 E.01831
; OBJECT_ID: 394
; WIPE_START
G1 X138.818 Y135.324 E-.04748
G1 X138.623 Y135.45 E-.08814
G1 X138.393 Y135.502 E-.08956
G1 X136.986 Y135.502 E-.53483
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X129.356 Y135.295 Z1.6 F42000
G1 X97.79 Y134.44 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X103.41 Y134.44 E.17269
G1 X103.41 Y135.66 E.03749
G1 X97.79 Y135.66 E.17269
G1 X97.79 Y134.5 E.03564
; WIPE_START
M204 S6000
G1 X99.79 Y134.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.59 Y134.31 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X100.59 Y121.69 E.38778
G1 X103.56 Y121.69 E.09126
G1 X103.56 Y134.31 E.38778
G1 X100.65 Y134.31 E.08942
; WIPE_START
M204 S6000
G1 X100.641 Y132.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.684 Y124.933 Z1.6 F42000
G1 X97.79 Y121.56 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X97.79 Y120.34 E.03749
G1 X103.41 Y120.34 E.17269
G1 X103.41 Y121.56 E.03749
G1 X97.85 Y121.56 E.17084
M204 S10000
G1 X97.398 Y121.56 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.398 Y121.952 E.01301
G1 X100.198 Y121.952 E.09288
G1 X100.198 Y134.048 E.40124
G1 X97.398 Y134.048 E.09288
G1 X97.398 Y135.898 E.06137
G1 X86.602 Y135.898 E.35812
G1 X86.602 Y134.048 E.06137
G1 X83.802 Y134.048 E.09288
G1 X83.802 Y121.952 E.40124
G1 X86.602 Y121.952 E.09288
G1 X86.602 Y120.102 E.06135
G1 X97.398 Y120.103 E.35812
G1 X97.398 Y121.5 E.04633
; WIPE_START
G1 X97.398 Y121.952 E-.17179
G1 X98.946 Y121.952 E-.58821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.317 Y121.717 Z1.6 F42000
G1 X86.21 Y121.56 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X80.59 Y121.56 E.17269
G1 X80.59 Y120.34 E.03749
G1 X86.21 Y120.34 E.17269
G1 X86.21 Y121.5 E.03564
; WIPE_START
M204 S6000
G1 X84.21 Y121.521 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.734 Y129.139 Z1.6 F42000
G1 X83.41 Y134.31 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X80.44 Y134.31 E.09126
G1 X80.44 Y121.69 E.38778
G1 X83.41 Y121.69 E.09126
G1 X83.41 Y134.25 E.38593
; WIPE_START
M204 S6000
G1 X81.41 Y134.29 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.21 Y134.44 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X86.21 Y135.66 E.03749
G1 X80.59 Y135.66 E.17269
G1 X80.59 Y134.44 E.03749
G1 X86.15 Y134.44 E.17084
; WIPE_START
M204 S6000
G1 X86.21 Y135.66 E-.46416
G1 X85.431 Y135.66 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.062 Y135.483 Z1.6 F42000
G1 X103.742 Y135.235 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X103.727 Y135.3 E.00206
G3 X102.395 Y136.29 I-1.345 J-.419 E.05454
G1 X81.605 Y136.29 E.6388
G3 X80.21 Y134.897 I0 J-1.395 E.06727
G1 X80.21 Y121.105 E.42378
G3 X81.603 Y119.71 I1.391 J-.004 E.06733
G1 X102.464 Y119.712 E.641
G3 X103.788 Y121.032 I-.082 J1.407 E.06282
G1 X103.788 Y134.968 E.42822
G1 X103.752 Y135.175 E.00647
M204 S10000
G1 X103.052 Y135.875 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.106058
G1 F15000
M204 S6000
G1 X102.332 Y136.094 E.00387
M204 S10000
G1 X102.612 Y135.964 F42000
; LINE_WIDTH: 0.239736
G1 F15000
M204 S6000
G2 X102.767 Y135.943 I-.205 J-2.129 E.00252
; LINE_WIDTH: 0.195143
G1 X103.055 Y135.886 E.00364
M204 S10000
G1 X102.612 Y135.964 F42000
; LINE_WIDTH: 0.280502
G1 F15000
M204 S6000
G3 X102.387 Y135.975 I-.222 J-2.286 E.00436
G1 X97.594 Y135.975 E.09279
; WIPE_START
G1 X99.594 Y135.975 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.05 Y134.678 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.05 Y133.7 E.03245
G1 X97.7 Y133.7 E.02156
G1 X86.3 Y122.3 E.53477
G1 X84.705 Y122.3 E.05291
G1 X84.705 Y127.619 E.17642
G1 X91.873 Y120.451 E.33624
G1 X92.127 Y120.451 E.00844
G1 X99.295 Y127.619 E.33624
G1 X99.295 Y128.381 E.02529
G1 X92.126 Y135.55 E.33629
G1 X91.874 Y135.55 E.00838
G1 X84.705 Y128.381 E.33629
G1 X84.705 Y133.7 E.17642
G1 X86.3 Y133.7 E.05291
G1 X97.7 Y122.3 E.53477
G1 X97.05 Y122.3 E.02156
G1 X97.05 Y121.322 E.03245
; WIPE_START
G1 X97.05 Y122.3 E-.37176
G1 X97.7 Y122.3 E-.247
G1 X97.437 Y122.563 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.594 Y120.026 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.278341
G1 F15000
M204 S6000
G1 X102.453 Y120.026 E.09321
G3 X102.719 Y120.049 I-.097 J2.665 E.00512
; LINE_WIDTH: 0.214093
G1 X103.057 Y120.108 E.00478
; WIPE_START
G1 X102.719 Y120.049 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.083 Y127.504 Z1.6 F42000
G1 X99.746 Y133.596 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.5392
G1 F7253.969
M204 S6000
G1 X99.746 Y122.464 E.45021
; WIPE_START
G1 X99.746 Y124.464 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.504 Y122.054 Z1.6 F42000
G1 X86.406 Y120.025 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.278931
G1 F15000
M204 S6000
G1 X81.552 Y120.026 E.09335
G2 X81.281 Y120.049 I.093 J2.688 E.00523
; LINE_WIDTH: 0.214288
G1 X80.943 Y120.108 E.00479
; WIPE_START
G1 X81.281 Y120.049 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.917 Y127.504 Z1.6 F42000
G1 X84.254 Y133.596 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.53922
G1 F7253.678
M204 S6000
G1 X84.254 Y122.464 E.45022
; WIPE_START
G1 X84.254 Y124.464 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.656 Y131.966 Z1.6 F42000
G1 X86.406 Y135.975 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279826
G1 F15000
M204 S6000
G1 X81.613 Y135.975 E.09252
G3 X81.286 Y135.952 I.013 J-2.516 E.00635
; LINE_WIDTH: 0.216036
G1 X80.943 Y135.893 E.0049
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X81.286 Y135.952 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 7/42
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z1.6 I.195 J1.201 P1  F42000
G1 X172.198 Y121.223 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X172.198 Y134.777 E.44962
G1 X175.397 Y134.777 E.1061
G3 X174.385 Y135.898 I-1.013 J.103 E.05642
G1 X153.615 Y135.898 E.68898
G3 X152.604 Y134.777 I-.007 J-1.01 E.05656
G1 X155.802 Y134.777 E.1061
G1 X155.802 Y121.223 E.44962
G1 X152.603 Y121.223 E.1061
G3 X153.608 Y120.102 I1.013 J-.102 E.05617
G1 X174.441 Y120.104 E.69107
G3 X175.401 Y121.223 I-.054 J1.018 E.0547
G1 X172.258 Y121.223 E.10427
M204 S250
G1 X172.59 Y121.615 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X172.59 Y134.385 E.39239
G1 X173.303 Y134.385 E.02189
G1 X173.31 Y134.185 E.00615
G1 X173.69 Y134.185 E.01169
G1 X173.695 Y134.385 E.00615
G1 X174.503 Y134.385 E.02482
G1 X174.51 Y134.185 E.00615
G1 X174.89 Y134.185 E.01169
G1 X174.895 Y134.385 E.00615
G1 X175.79 Y134.385 E.0275
G3 X175.783 Y135.034 I-4.549 J.282 E.01996
G3 X174.395 Y136.29 I-1.393 J-.145 E.06302
G1 X153.605 Y136.29 E.6388
G3 X152.212 Y134.968 I.004 J-1.4 E.06504
G1 X152.21 Y134.385 E.01792
G1 X153.103 Y134.385 E.02741
G1 X153.11 Y134.185 E.00615
G1 X153.49 Y134.185 E.01169
G1 X153.495 Y134.385 E.00615
G1 X154.305 Y134.385 E.02491
G1 X154.31 Y134.185 E.00614
G1 X154.69 Y134.186 E.01169
G1 X154.697 Y134.385 E.00613
G1 X155.41 Y134.385 E.02189
G1 X155.41 Y121.615 E.39239
G1 X154.697 Y121.615 E.02189
G1 X154.69 Y121.815 E.00615
G1 X154.31 Y121.815 E.01169
G1 X154.305 Y121.615 E.00615
G1 X153.497 Y121.615 E.02482
G1 X153.49 Y121.815 E.00615
G1 X153.11 Y121.815 E.01169
G1 X153.105 Y121.615 E.00615
G1 X152.21 Y121.615 E.0275
G3 X152.217 Y120.966 I4.551 J-.282 E.01996
G3 X153.603 Y119.71 I1.394 J.145 E.06294
G1 X174.459 Y119.712 E.64086
G3 X175.79 Y121.103 I-.068 J1.398 E.06525
G1 X175.79 Y121.615 E.01572
G1 X174.897 Y121.615 E.02743
G1 X174.89 Y121.815 E.00615
G1 X174.51 Y121.815 E.01169
G1 X174.505 Y121.615 E.00615
G1 X173.695 Y121.615 E.02491
G1 X173.69 Y121.815 E.00614
G1 X173.31 Y121.814 E.01169
G1 X173.302 Y121.615 E.00613
G1 X172.65 Y121.615 E.02005
; WIPE_START
M204 S6000
G1 X172.641 Y123.615 E-.76
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
G1 X171.85 Y122.126 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X171.85 Y120.875 E.04151
G1 X172.227 Y120.875 E.0125
G1 X171.804 Y120.452 E.01984
G1 X171.548 Y120.452 E.00848
G1 X156.45 Y135.55 E.70827
G1 X156.198 Y135.55 E.00838
G1 X155.773 Y135.125 E.01991
G1 X156.15 Y135.125 E.0125
G1 X156.15 Y128.174 E.2306
G1 X163.873 Y120.451 E.36228
G1 X164.127 Y120.451 E.00843
G1 X171.85 Y128.174 E.36228
G1 X171.85 Y127.826 E.01153
G1 X164.126 Y135.55 E.36232
G1 X163.874 Y135.55 E.00838
G1 X156.15 Y127.826 E.36232
G1 X156.15 Y120.875 E.2306
G1 X155.773 Y120.875 E.0125
G1 X156.198 Y120.451 E.0199
G1 X156.451 Y120.451 E.00839
G1 X171.55 Y135.55 E.70833
G1 X171.802 Y135.55 E.00838
G1 X172.227 Y135.125 E.01991
G1 X171.85 Y135.125 E.0125
G1 X171.85 Y133.874 E.04151
; OBJECT_ID: 405
; WIPE_START
G1 X171.85 Y135.125 E-.47554
G1 X172.227 Y135.125 E-.14322
G1 X171.964 Y135.388 E-.14124
; WIPE_END
M73 P40 R14
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X164.596 Y133.394 Z1.8 F42000
G1 X119.802 Y121.273 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X116.602 Y121.273 E.10615
G3 X117.551 Y120.104 I1.009 J-.151 E.05617
G1 X136.198 Y120.102 E.61857
G1 X136.198 Y134.727 E.48514
G1 X139.398 Y134.727 E.10615
G3 X138.456 Y135.896 I-1.014 J.147 E.05588
G1 X119.802 Y135.898 E.61879
G1 X119.802 Y121.333 E.48315
M204 S250
G1 X119.41 Y121.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X116.21 Y121.665 E.09833
G3 X116.268 Y120.705 I3.356 J-.28 E.02965
G3 X117.532 Y119.712 I1.355 J.424 E.0525
G1 X136.59 Y119.71 E.58561
G1 X136.59 Y134.335 E.44939
G1 X139.79 Y134.335 E.09833
G3 X139.732 Y135.298 I-3.35 J.28 E.02974
G3 X138.471 Y136.288 I-1.344 J-.414 E.05242
G1 X119.41 Y136.29 E.58568
G1 X119.41 Y121.725 E.44754
; WIPE_START
M204 S6000
G1 X117.41 Y121.688 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.043 Y121.725 Z1.8 F42000
G1 X135.85 Y121.779 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X135.85 Y120.45 E.04406
G1 X135.55 Y120.45 E.00996
G1 X120.45 Y135.55 E.70833
G1 X120.15 Y135.55 E.00996
G1 X120.15 Y128.174 E.24467
G1 X127.873 Y120.451 E.36228
G1 X128.127 Y120.451 E.00844
G1 X135.85 Y128.174 E.36228
G1 X135.85 Y127.826 E.01153
G1 X128.127 Y135.549 E.36228
G1 X127.873 Y135.549 E.00844
G1 X120.15 Y127.826 E.36228
G1 X120.15 Y120.925 E.22894
G1 X119.723 Y120.925 E.01416
G1 X120.196 Y120.452 E.02217
G1 X120.452 Y120.452 E.00849
G1 X135.548 Y135.548 E.70819
G1 X135.804 Y135.548 E.00849
G1 X136.277 Y135.075 E.02217
G1 X135.85 Y135.075 E.01416
G1 X135.85 Y133.874 E.03985
; OBJECT_ID: 394
; WIPE_START
G1 X135.85 Y135.075 E-.45654
G1 X136.277 Y135.075 E-.16222
G1 X136.014 Y135.338 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X128.383 Y135.159 Z1.8 F42000
G1 X97.79 Y134.44 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X103.41 Y134.44 E.17269
G1 X103.41 Y135.66 E.03749
G1 X97.79 Y135.66 E.17269
G1 X97.79 Y134.5 E.03564
; WIPE_START
M204 S6000
G1 X99.79 Y134.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.59 Y134.31 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X100.59 Y121.69 E.38778
G1 X103.56 Y121.69 E.09126
G1 X103.56 Y134.31 E.38778
G1 X100.65 Y134.31 E.08942
; WIPE_START
M204 S6000
G1 X100.641 Y132.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.684 Y124.933 Z1.8 F42000
G1 X97.79 Y121.56 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X97.79 Y120.34 E.03749
G1 X103.41 Y120.34 E.17269
G1 X103.41 Y121.56 E.03749
G1 X97.85 Y121.56 E.17084
M204 S10000
G1 X97.398 Y121.56 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.398 Y121.952 E.01301
G1 X100.198 Y121.952 E.09288
G1 X100.198 Y134.048 E.40124
G1 X97.398 Y134.048 E.09288
G1 X97.398 Y135.898 E.06137
G1 X86.602 Y135.898 E.35812
G1 X86.602 Y134.048 E.06137
G1 X83.802 Y134.048 E.09288
G1 X83.802 Y121.952 E.40124
G1 X86.602 Y121.952 E.09288
G1 X86.602 Y120.102 E.06135
G1 X97.398 Y120.103 E.35812
G1 X97.398 Y121.5 E.04633
; WIPE_START
G1 X97.398 Y121.952 E-.17179
G1 X98.946 Y121.952 E-.58821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.317 Y121.717 Z1.8 F42000
G1 X86.21 Y121.56 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X80.59 Y121.56 E.17269
G1 X80.59 Y120.34 E.03749
G1 X86.21 Y120.34 E.17269
G1 X86.21 Y121.5 E.03564
; WIPE_START
M204 S6000
G1 X84.21 Y121.521 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.734 Y129.139 Z1.8 F42000
G1 X83.41 Y134.31 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X80.44 Y134.31 E.09126
G1 X80.44 Y121.69 E.38778
G1 X83.41 Y121.69 E.09126
G1 X83.41 Y134.25 E.38593
; WIPE_START
M204 S6000
G1 X81.41 Y134.29 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.21 Y134.44 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X86.21 Y135.66 E.03749
G1 X80.59 Y135.66 E.17269
G1 X80.59 Y134.44 E.03749
G1 X86.15 Y134.44 E.17084
; WIPE_START
M204 S6000
G1 X86.21 Y135.66 E-.46416
G1 X85.431 Y135.66 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.061 Y135.467 Z1.8 F42000
G1 X103.755 Y135.196 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X103.679 Y135.431 E.00757
G3 X102.395 Y136.29 I-1.297 J-.549 E.05028
G1 X81.605 Y136.29 E.6388
G3 X80.21 Y134.897 I-.001 J-1.394 E.06729
G1 X80.21 Y121.105 E.42378
G3 X81.603 Y119.71 I1.394 J-.001 E.06729
G1 X102.462 Y119.712 E.64094
G3 X103.788 Y121.032 I-.08 J1.407 E.06288
G1 X103.788 Y134.968 E.42822
G3 X103.767 Y135.137 I-1.406 J-.086 E.00525
; WIPE_START
M204 S6000
G1 X103.679 Y135.431 E-.11628
G1 X103.555 Y135.672 E-.10322
G1 X103.34 Y135.924 E-.12598
G1 X103.112 Y136.093 E-.10775
G1 X102.93 Y136.185 E-.07751
G1 X102.602 Y136.275 E-.12947
G1 X102.395 Y136.29 E-.07882
G1 X102.339 Y136.29 E-.02098
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.056 Y135.89 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.206793
G1 F15000
M204 S6000
G1 X102.771 Y135.943 E.00387
; LINE_WIDTH: 0.231851
G1 X102.666 Y135.958 E.00164
; LINE_WIDTH: 0.280216
G3 X102.387 Y135.975 I-.272 J-2.205 E.00541
G1 X97.594 Y135.975 E.09267
M204 S10000
G1 X86.406 Y135.975 F42000
; LINE_WIDTH: 0.280253
G1 F15000
M204 S6000
G1 X81.613 Y135.975 E.09269
G3 X81.34 Y135.959 I.02 J-2.701 E.0053
; LINE_WIDTH: 0.232425
G1 X80.95 Y135.901 E.00608
M204 S10000
G1 X80.946 Y135.876 F42000
; LINE_WIDTH: 0.105006
G1 F15000
M204 S6000
G1 X81.7 Y136.094 E.00397
; WIPE_START
G1 X80.946 Y135.876 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.945 Y128.243 Z1.8 F42000
G1 X80.943 Y120.108 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.214035
G1 F15000
M204 S6000
G1 X81.28 Y120.049 E.00476
; LINE_WIDTH: 0.278914
G3 X81.552 Y120.026 I.365 J2.648 E.00526
G1 X86.406 Y120.025 E.09334
M204 S10000
G1 X97.594 Y120.026 F42000
; LINE_WIDTH: 0.278377
G1 F15000
M204 S6000
G1 X102.451 Y120.026 E.09319
G3 X102.719 Y120.049 I-.093 J2.643 E.00516
; LINE_WIDTH: 0.214149
G1 X103.057 Y120.108 E.00478
; WIPE_START
G1 X102.719 Y120.049 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.328 Y122.3 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.7 Y122.3 E.05401
G1 X86.3 Y133.7 E.53477
G1 X84.15 Y133.7 E.07132
G1 X84.15 Y128.174 E.18331
G1 X91.873 Y120.451 E.36228
G1 X92.127 Y120.451 E.00843
G1 X99.85 Y128.174 E.36228
G1 X99.85 Y127.826 E.01153
G1 X92.126 Y135.55 E.36232
G1 X91.874 Y135.55 E.00838
G1 X84.15 Y127.826 E.36232
G1 X84.15 Y122.3 E.18331
G1 X86.3 Y122.3 E.07132
G1 X97.7 Y133.7 E.53477
G1 X99.328 Y133.7 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X97.7 Y133.7 E-.61876
G1 X97.437 Y133.437 E-.14125
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 8/42
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z1.8 I.196 J1.201 P1  F42000
G1 X172.198 Y121.223 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X172.198 Y134.777 E.44962
G1 X175.397 Y134.777 E.1061
G3 X174.385 Y135.898 I-1.013 J.103 E.05642
G1 X153.615 Y135.898 E.68898
G3 X152.604 Y134.777 I-.007 J-1.011 E.05655
G1 X155.802 Y134.777 E.1061
G1 X155.802 Y121.223 E.44962
G1 X152.603 Y121.223 E.1061
G3 X153.608 Y120.102 I1.013 J-.102 E.05618
G1 X174.439 Y120.104 E.69101
G3 X175.403 Y121.223 I-.053 J1.021 E.05477
G1 X172.258 Y121.223 E.10434
M204 S250
G1 X172.59 Y121.615 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X172.59 Y134.385 E.39239
G1 X173.302 Y134.385 E.02189
G1 X173.31 Y134.185 E.00615
G1 X173.69 Y134.185 E.01169
G1 X173.695 Y134.385 E.00615
G1 X174.502 Y134.385 E.02482
G1 X174.51 Y134.185 E.00615
G1 X174.89 Y134.185 E.01169
G1 X174.895 Y134.385 E.00615
G1 X175.789 Y134.385 E.0275
G3 X175.783 Y135.034 I-4.547 J.282 E.01996
G3 X174.395 Y136.29 I-1.393 J-.145 E.06302
G1 X153.605 Y136.29 E.6388
G3 X152.212 Y134.968 I.012 J-1.408 E.06494
G1 X152.21 Y134.385 E.01792
G1 X153.102 Y134.385 E.02741
G1 X153.11 Y134.185 E.00615
G1 X153.49 Y134.185 E.01169
G1 X153.495 Y134.385 E.00615
G1 X154.305 Y134.385 E.02491
G1 X154.31 Y134.185 E.00614
G1 X154.69 Y134.186 E.01169
G1 X154.697 Y134.385 E.00613
G1 X155.41 Y134.385 E.02189
G1 X155.41 Y121.615 E.39239
G1 X154.697 Y121.615 E.02189
G1 X154.69 Y121.815 E.00615
G1 X154.31 Y121.815 E.01169
G1 X154.305 Y121.615 E.00615
G1 X153.497 Y121.615 E.02482
G1 X153.49 Y121.815 E.00615
G1 X153.11 Y121.815 E.01169
G1 X153.105 Y121.615 E.00615
G1 X152.21 Y121.615 E.0275
G3 X152.217 Y120.966 I4.543 J-.282 E.01996
G3 X153.603 Y119.71 I1.393 J.145 E.06294
G1 X174.457 Y119.712 E.6408
G3 X175.79 Y121.105 I-.067 J1.398 E.06537
G1 X175.79 Y121.615 E.01566
G1 X174.897 Y121.615 E.02743
G1 X174.89 Y121.815 E.00615
G1 X174.51 Y121.815 E.01169
G1 X174.505 Y121.615 E.00615
G1 X173.695 Y121.615 E.02491
G1 X173.69 Y121.815 E.00614
G1 X173.31 Y121.814 E.01169
G1 X173.302 Y121.615 E.00613
G1 X172.65 Y121.615 E.02005
; WIPE_START
M204 S6000
G1 X172.641 Y123.615 E-.76
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
G1 X167.462 Y120.466 F42000
G1 Z1.6
G1 E.8 F1800
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X171.834 Y120.466 E.12113
; Slow Down End
M204 S10000
G1 X159.828 Y120.465 F42000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X164.549 Y120.466 E.13081
; Slow Down End
M204 S10000
G1 X156.165 Y122.054 F42000
; Slow Down Start
; LINE_WIDTH: 0.399385
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X156.165 Y134.981 E.37547
G1 X156.15 Y135.054 E.00217
; Slow Down End
M204 S10000
G1 X158.456 Y135.173 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X156.827 Y135.173 E.05401
G1 X171.171 Y120.829 E.67289
G1 X166.809 Y120.828 E.1447
G1 X166.719 Y120.544 E.00988
G1 X166.851 Y120.451 E.00535
G1 X164.981 Y120.451 E.06202
G1 X165.358 Y120.828 E.0177
G1 X164.504 Y120.828 E.02833
G1 X171.473 Y127.797 E.32689
G1 X171.473 Y128.203 E.0135
G1 X164.503 Y135.173 E.32694
G1 X163.497 Y135.173 E.0334
G1 X156.527 Y128.203 E.32693
G1 X156.527 Y127.797 E.0135
G1 X163.496 Y120.828 E.3269
G1 X161.868 Y120.828 E.05401
M204 S10000
G1 X160.527 Y135.535 F42000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X156.166 Y135.535 E.12082
; Slow Down End
M204 S10000
G1 X163.385 Y135.535 F42000
; Slow Down Start
M73 P41 R14
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X168.101 Y135.535 E.13066
; Slow Down End
M204 S10000
G1 X171.473 Y134.5 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X171.473 Y134.868 E.01223
G1 X171.85 Y134.669 E.01415
G1 X171.85 Y135.125 E.01514
G1 X172.227 Y135.125 E.0125
G1 X171.802 Y135.55 E.01991
G1 X171.55 Y135.55 E.00838
G1 X156.451 Y120.451 E.70833
G1 X156.198 Y120.451 E.00839
G1 X155.773 Y120.875 E.0199
G1 X156.15 Y120.875 E.0125
G1 X156.15 Y121.556 E.0226
G1 X156.527 Y121.216 E.01685
M204 S10000
G1 X171.835 Y134.267 F42000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X171.835 Y121.019 E.36702
G1 X171.85 Y120.946 E.00207
; Slow Down End
; OBJECT_ID: 405
; WIPE_START
G1 X171.835 Y121.019 E-.02839
G1 X171.835 Y122.945 E-.73161
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X164.207 Y122.7 Z2 F42000
G1 X119.802 Y121.273 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X116.602 Y121.273 E.10615
G3 X117.551 Y120.104 I1.011 J-.149 E.05615
G1 X136.198 Y120.102 E.61855
G1 X136.198 Y134.727 E.48514
G1 X139.398 Y134.727 E.10615
G3 X138.456 Y135.896 I-1.014 J.147 E.05587
G1 X119.802 Y135.898 E.6188
G1 X119.802 Y121.333 E.48315
M204 S250
G1 X119.41 Y121.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X116.21 Y121.665 E.09833
G3 X116.269 Y120.699 I3.322 J-.281 E.02985
G3 X117.532 Y119.712 I1.343 J.416 E.05239
G1 X136.59 Y119.71 E.58561
G1 X136.59 Y134.335 E.44939
G1 X139.79 Y134.335 E.09833
G3 X139.73 Y135.304 I-3.324 J.28 E.02993
G3 X138.471 Y136.288 I-1.343 J-.42 E.05223
G1 X119.41 Y136.29 E.58568
G1 X119.41 Y121.725 E.44754
M204 S10000
G1 X120.165 Y122.079 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.383096
G1 F10582.759
M204 S6000
G1 X120.165 Y135.376 E.36858
G1 X120.192 Y135.508 E.00373
G1 X120.324 Y135.535 E.00373
G1 X132.129 Y135.534 E.32723
M204 S10000
G1 X135.661 Y134.33 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X135.85 Y134.141 E.00887
G1 X135.85 Y135.075 E.03098
G1 X136.277 Y135.075 E.01416
G1 X135.804 Y135.548 E.02217
G1 X135.548 Y135.548 E.00849
G1 X120.452 Y120.452 E.70819
G1 X120.196 Y120.452 E.00849
G1 X119.723 Y120.925 E.02217
G1 X120.15 Y120.925 E.01416
G1 X120.15 Y121.581 E.02177
G1 X120.527 Y121.216 E.01742
M204 S10000
G1 X123.853 Y120.466 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.383098
G1 F10582.691
M204 S6000
G1 X135.676 Y120.465 E.32772
G1 X135.808 Y120.492 E.00373
G1 X135.835 Y120.624 E.00373
G1 X135.835 Y133.583 E.35922
M204 S10000
G1 X135.473 Y122.156 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X135.473 Y120.828 E.04406
G1 X135.172 Y120.828 E.00996
G1 X120.828 Y135.172 E.67294
G1 X127.496 Y135.172 E.2212
G1 X120.527 Y128.203 E.3269
G1 X120.527 Y127.797 E.0135
G1 X127.496 Y120.828 E.3269
G1 X128.504 Y120.828 E.03345
G1 X135.473 Y127.797 E.3269
G1 X135.473 Y128.203 E.0135
G1 X128.504 Y135.172 E.3269
G1 X130.133 Y135.172 E.05401
; OBJECT_ID: 394
; WIPE_START
G1 X128.504 Y135.172 E-.61876
G1 X128.767 Y134.909 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X121.135 Y134.793 Z2 F42000
G1 X97.79 Y134.44 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X103.41 Y134.44 E.17269
G1 X103.41 Y135.66 E.03749
G1 X97.79 Y135.66 E.17269
G1 X97.79 Y134.5 E.03564
; WIPE_START
M204 S6000
G1 X99.79 Y134.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.622 Y126.936 Z2 F42000
G1 X97.79 Y121.56 Z2
G1 Z1.6
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X97.79 Y120.34 E.03749
G1 X103.41 Y120.34 E.17269
G1 X103.41 Y121.56 E.03749
G1 X97.85 Y121.56 E.17084
M204 S10000
G1 X97.398 Y121.56 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.398 Y121.952 E.01301
G1 X100.198 Y121.952 E.09288
G1 X100.198 Y134.048 E.40124
G1 X97.398 Y134.048 E.09288
G1 X97.398 Y135.898 E.06137
G1 X86.602 Y135.898 E.35812
G1 X86.602 Y134.048 E.06137
G1 X83.802 Y134.048 E.09288
G1 X83.802 Y121.952 E.40124
G1 X86.602 Y121.952 E.09288
G1 X86.602 Y120.102 E.06135
G1 X97.398 Y120.103 E.35812
G1 X97.398 Y121.5 E.04633
; WIPE_START
G1 X97.398 Y121.952 E-.17179
G1 X98.946 Y121.952 E-.58821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.317 Y121.717 Z2 F42000
G1 X86.21 Y121.56 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X80.59 Y121.56 E.17269
G1 X80.59 Y120.34 E.03749
G1 X86.21 Y120.34 E.17269
G1 X86.21 Y121.5 E.03564
; WIPE_START
M204 S6000
G1 X84.21 Y121.521 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.378 Y129.064 Z2 F42000
G1 X86.21 Y134.44 Z2
G1 Z1.6
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X86.21 Y135.66 E.03749
G1 X80.59 Y135.66 E.17269
G1 X80.59 Y134.44 E.03749
G1 X86.15 Y134.44 E.17084
; WIPE_START
M204 S6000
G1 X86.21 Y135.66 E-.46416
G1 X85.431 Y135.66 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.41 Y134.31 Z2 F42000
G1 Z1.6
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X83.41 Y121.69 E.38778
G1 X80.44 Y121.69 E.09126
G1 X80.44 Y122.165 E.0146
G1 X80.21 Y122.165 E.00706
G1 X80.212 Y121.032 E.03482
G3 X81.603 Y119.71 I1.398 J.078 E.06496
G1 X102.457 Y119.712 E.6408
G3 X103.79 Y121.105 I-.075 J1.406 E.06527
G1 X103.79 Y122.165 E.03256
G1 X103.56 Y122.165 E.00707
G1 X103.56 Y121.69 E.0146
G1 X100.59 Y121.69 E.09126
G1 X100.59 Y134.31 E.38778
G1 X103.56 Y134.31 E.09126
G1 X103.56 Y133.835 E.0146
G1 X103.79 Y133.835 E.00706
G1 X103.788 Y134.968 E.03482
G3 X102.395 Y136.29 I-1.398 J-.078 E.06504
G1 X81.605 Y136.29 E.6388
G3 X80.21 Y134.896 I-.001 J-1.395 E.06731
G1 X80.21 Y133.835 E.03261
G1 X80.44 Y133.835 E.00707
G1 X80.44 Y134.31 E.0146
G1 X83.35 Y134.31 E.08942
; WIPE_START
M204 S6000
G1 X83.36 Y132.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.672 Y136.094 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.106188
G1 F15000
M204 S6000
G1 X80.948 Y135.875 E.0039
M204 S10000
G1 X80.945 Y135.886 F42000
; LINE_WIDTH: 0.193725
G1 F15000
M204 S6000
G1 X81.227 Y135.942 E.00353
; LINE_WIDTH: 0.232448
G1 X81.341 Y135.959 E.00179
; LINE_WIDTH: 0.28026
G2 X81.613 Y135.975 I.297 J-2.779 E.00527
G1 X86.406 Y135.975 E.09269
M204 S10000
G1 X97.594 Y135.975 F42000
; LINE_WIDTH: 0.280223
G1 F15000
M204 S6000
G1 X102.387 Y135.975 E.09268
G2 X102.665 Y135.958 I.003 J-2.286 E.00539
; LINE_WIDTH: 0.231548
G1 X102.773 Y135.942 E.00169
; LINE_WIDTH: 0.194544
G1 X103.055 Y135.886 E.00355
; WIPE_START
G1 X102.773 Y135.942 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.328 Y133.7 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.7 Y133.7 E.05401
G1 X86.3 Y122.3 E.53477
G1 X84.15 Y122.3 E.07132
G1 X84.15 Y127.826 E.18331
G1 X91.874 Y135.55 E.36232
G1 X92.126 Y135.55 E.00838
G1 X99.85 Y127.826 E.36232
G1 X99.85 Y128.174 E.01153
G1 X92.127 Y120.451 E.36228
G1 X91.873 Y120.451 E.00843
G1 X84.15 Y128.174 E.36228
G1 X84.15 Y133.7 E.18331
G1 X86.3 Y133.7 E.07132
G1 X97.7 Y122.3 E.53477
G1 X99.328 Y122.3 E.05401
; WIPE_START
G1 X97.7 Y122.3 E-.61876
G1 X97.437 Y122.563 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.594 Y120.026 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.278472
G1 F15000
M204 S6000
G1 X102.443 Y120.026 E.09307
G3 X102.713 Y120.048 I-.084 J2.687 E.0052
; LINE_WIDTH: 0.215176
G1 X103.057 Y120.108 E.00491
M204 S10000
G1 X86.406 Y120.025 F42000
; LINE_WIDTH: 0.278908
G1 F15000
M204 S6000
G1 X81.552 Y120.026 E.09334
G2 X81.278 Y120.049 I.091 J2.653 E.00529
; LINE_WIDTH: 0.213751
G1 X80.943 Y120.108 E.00473
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X81.278 Y120.049 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 9/42
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
M106 S188.7
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z2 I-.016 J1.217 P1  F42000
G1 X172.198 Y121.223 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X172.198 Y134.777 E.44962
G1 X175.396 Y134.777 E.1061
G3 X174.385 Y135.898 I-1.013 J.103 E.05642
G1 X153.615 Y135.898 E.68898
G3 X152.604 Y134.777 I-.01 J-1.008 E.05661
G1 X155.802 Y134.777 E.1061
G1 X155.802 Y121.223 E.44962
G1 X152.604 Y121.223 E.1061
G3 X153.608 Y120.102 I1.007 J-.108 E.05627
G1 X174.437 Y120.104 E.69094
G3 X175.403 Y121.223 I-.051 J1.021 E.05483
G1 X172.258 Y121.223 E.10434
M204 S250
G1 X172.59 Y121.615 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X172.59 Y134.385 E.39239
G1 X173.302 Y134.385 E.02189
G1 X173.31 Y134.185 E.00615
G1 X173.69 Y134.185 E.01169
G1 X173.695 Y134.385 E.00615
G1 X174.502 Y134.385 E.02482
G1 X174.51 Y134.185 E.00615
G1 X174.89 Y134.185 E.01169
G1 X174.895 Y134.385 E.00615
G1 X175.789 Y134.385 E.02749
G3 X175.776 Y135.094 I-3.791 J.282 E.02182
G3 X174.395 Y136.29 I-1.386 J-.205 E.06116
G1 X153.605 Y136.29 E.63879
G3 X152.212 Y134.968 I.004 J-1.4 E.06504
G1 X152.21 Y134.385 E.01792
G1 X153.102 Y134.385 E.02741
G1 X153.11 Y134.185 E.00615
G1 X153.49 Y134.185 E.01169
G1 X153.495 Y134.385 E.00615
G1 X154.305 Y134.385 E.02491
G1 X154.31 Y134.185 E.00614
G1 X154.69 Y134.186 E.01169
G1 X154.697 Y134.385 E.00613
G1 X155.41 Y134.385 E.02189
G1 X155.41 Y121.615 E.39239
G1 X154.697 Y121.615 E.02189
G1 X154.69 Y121.815 E.00615
G1 X154.31 Y121.815 E.01169
G1 X154.305 Y121.615 E.00615
G1 X153.497 Y121.615 E.02482
G1 X153.49 Y121.815 E.00615
G1 X153.11 Y121.815 E.01169
G1 X153.105 Y121.615 E.00615
G1 X152.21 Y121.615 E.0275
G3 X152.224 Y120.906 I3.791 J-.282 E.02182
G3 X153.603 Y119.71 I1.386 J.205 E.06108
G1 X174.455 Y119.712 E.64074
G3 X175.79 Y121.105 I-.064 J1.398 E.06543
G1 X175.79 Y121.615 E.01566
G1 X174.897 Y121.615 E.02742
G1 X174.89 Y121.815 E.00615
G1 X174.51 Y121.815 E.01169
G1 X174.505 Y121.615 E.00615
G1 X173.695 Y121.615 E.02491
G1 X173.69 Y121.815 E.00614
G1 X173.31 Y121.814 E.01169
G1 X173.303 Y121.615 E.00613
G1 X172.65 Y121.615 E.02005
; WIPE_START
M204 S6000
G1 X172.641 Y123.615 E-.76
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
M73 P42 R14
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
G1 X170.441 Y134.975 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40624
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X171.828 Y133.588 E.10359
G1 X171.828 Y132.943 E.03407
G1 X170.262 Y134.51 E.11699
G1 X169.944 Y134.192 E.02371
G1 X169.909 Y134.217 E.00231
G1 X171.828 Y132.298 E.14337
G1 X171.828 Y131.653 E.03407
G1 X167.953 Y135.528 E.28945
G1 X167.307 Y135.528 E.03407
G1 X171.828 Y131.007 E.33764
G1 X171.828 Y130.362 E.03407
G1 X166.662 Y135.528 E.38583
G1 X166.017 Y135.528 E.03407
G1 X171.828 Y129.717 E.43402
G1 X171.828 Y129.072 E.03407
G1 X165.372 Y135.528 E.4822
G1 X164.727 Y135.528 E.03407
G1 X171.828 Y128.427 E.53039
G1 X171.828 Y127.781 E.03407
G1 X164.081 Y135.528 E.57858
G1 X163.451 Y135.528 E.03329
G1 X163.45 Y135.515 E.00072
G1 X171.828 Y127.136 E.62576
G1 X171.828 Y126.491 E.03407
G1 X163.198 Y135.121 E.64457
G1 X162.875 Y134.799 E.02409
G1 X171.828 Y125.846 E.66867
G1 X171.828 Y125.2 E.03407
G1 X162.552 Y134.476 E.69276
G1 X162.288 Y134.212 E.01973
G1 X161.891 Y134.493 E.02571
G1 X171.828 Y124.555 E.7422
G1 X171.828 Y123.91 E.03407
G1 X160.21 Y135.528 E.86771
G1 X159.565 Y135.528 E.03407
G1 X171.828 Y123.265 E.9159
G1 X171.828 Y122.62 E.03407
M73 P42 R13
G1 X158.92 Y135.528 E.96408
G1 X158.274 Y135.528 E.03407
G1 X171.828 Y121.974 E1.01227
G1 X171.828 Y121.329 E.03407
G1 X157.629 Y135.528 E1.06046
G1 X156.984 Y135.528 E.03407
G1 X171.828 Y120.684 E1.10865
G1 X171.828 Y120.473 E.01113
G1 X171.394 Y120.473 E.02294
G1 X156.339 Y135.528 E1.12439
G1 X156.172 Y135.528 E.00882
G1 X156.172 Y135.05 E.02526
G1 X170.749 Y120.473 E1.08868
G1 X170.104 Y120.473 E.03407
G1 X156.172 Y134.405 E1.04049
G1 X156.172 Y133.76 E.03407
G1 X169.458 Y120.473 E.99231
G1 X168.813 Y120.473 E.03407
G1 X156.172 Y133.114 E.94413
G1 X156.172 Y132.469 E.03407
G1 X168.168 Y120.473 E.89594
G1 X167.564 Y120.473 E.0319
G1 X167.424 Y120.571 E.00902
G1 X156.172 Y131.824 E.8404
G1 X156.172 Y131.179 E.03407
G1 X165.637 Y121.713 E.70692
G1 X165.314 Y121.391 E.02409
G1 X156.172 Y130.534 E.68282
G1 X156.172 Y129.888 E.03407
G1 X164.992 Y121.068 E.65873
G1 X164.669 Y120.746 E.02409
G1 X156.172 Y129.243 E.63464
G1 X156.172 Y128.598 E.03407
G1 X164.297 Y120.473 E.60684
G1 X163.652 Y120.472 E.03407
G1 X156.172 Y127.953 E.55865
G1 X156.172 Y127.307 E.03407
G1 X163.007 Y120.472 E.51047
G1 X162.362 Y120.472 E.03407
G1 X156.172 Y126.662 E.46228
G1 X156.172 Y126.017 E.03407
G1 X161.716 Y120.472 E.4141
G1 X161.071 Y120.472 E.03407
G1 X156.172 Y125.372 E.36591
G1 X156.172 Y124.727 E.03407
G1 X160.426 Y120.472 E.31773
G1 X159.929 Y120.472 E.02622
G1 X159.42 Y120.833 E.03299
G1 X156.172 Y124.081 E.24258
G1 X156.172 Y123.436 E.03407
G1 X157.928 Y121.68 E.13115
G1 X157.605 Y121.357 E.02409
G1 X156.172 Y122.791 E.10706
G1 X156.172 Y122.146 E.03407
G1 X157.426 Y120.892 E.09366
M106 S188.7
M204 S10000
G1 X154.145 Y120.875 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8843.478
M204 S6000
G1 X155.773 Y120.875 E.05401
G1 X156.198 Y120.451 E.0199
G1 X156.451 Y120.451 E.00839
G1 X156.853 Y120.853 E.01889
G1 X156.15 Y121.556 E.03297
G1 X156.15 Y120.922 E.02104
; WIPE_START
G1 X156.15 Y121.556 E-.24104
G1 X156.853 Y120.853 E-.37772
G1 X156.59 Y120.59 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X162.429 Y125.506 Z2.2 F42000
G1 X173.855 Y135.125 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X172.227 Y135.125 E.05401
G1 X171.802 Y135.55 E.01991
G1 X171.55 Y135.55 E.00838
G1 X171.077 Y135.077 E.02218
G1 X170.518 Y135.372 E.02096
G1 X169.897 Y134.751 E.02914
G1 X169.801 Y134.819 E.00392
; OBJECT_ID: 405
; WIPE_START
G1 X169.897 Y134.751 E-.04488
G1 X170.518 Y135.372 E-.33377
G1 X171.077 Y135.077 E-.24011
G1 X171.34 Y135.34 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X163.977 Y133.33 Z2.2 F42000
G1 X119.802 Y121.273 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X116.602 Y121.273 E.10615
G3 X117.544 Y120.104 I1.009 J-.151 E.05595
G1 X136.198 Y120.102 E.61879
G1 X136.198 Y134.727 E.48514
G1 X139.398 Y134.727 E.10615
G3 X138.456 Y135.896 I-1.014 J.147 E.05587
G1 X119.802 Y135.898 E.61879
G1 X119.802 Y121.333 E.48315
M204 S250
G1 X119.41 Y121.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X116.21 Y121.665 E.09833
G3 X116.252 Y120.762 I3.69 J-.281 E.02784
G3 X117.529 Y119.712 I1.355 J.346 E.05437
G1 X136.59 Y119.71 E.58568
G1 X136.59 Y134.335 E.44939
G1 X139.79 Y134.335 E.09833
G3 X139.73 Y135.303 I-3.324 J.28 E.02992
G3 X138.471 Y136.288 I-1.343 J-.42 E.05224
G1 X119.41 Y136.29 E.58568
G1 X119.41 Y121.725 E.44754
; WIPE_START
M204 S6000
G1 X117.41 Y121.688 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.095 Y120.925 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X119.723 Y120.925 E.05401
G1 X120.196 Y120.452 E.02217
G1 X120.452 Y120.452 E.00849
G1 X120.866 Y120.866 E.01941
G1 X120.15 Y121.581 E.03356
G1 X120.15 Y120.964 E.02045
M204 S10000
G1 X121.438 Y120.903 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.40524
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
M73 P43 R13
G1 X120.172 Y122.169 E.09408
G1 X120.172 Y122.813 E.03383
G1 X121.616 Y121.369 E.10736
G1 X121.938 Y121.69 E.02392
G1 X120.172 Y123.457 E.13129
G1 X120.172 Y124.101 E.03383
G1 X123.42 Y120.853 E.2414
G1 X123.955 Y120.473 E.03446
G1 X124.443 Y120.473 E.02568
G1 X120.172 Y124.745 E.31747
G1 X120.172 Y125.388 E.03383
G1 X125.087 Y120.473 E.36532
G1 X125.731 Y120.473 E.03384
G1 X120.172 Y126.032 E.41317
G1 X120.172 Y126.676 E.03383
G1 X126.375 Y120.473 E.46102
G1 X127.019 Y120.473 E.03384
G1 X120.172 Y127.32 E.50887
G1 X120.172 Y127.964 E.03383
G1 X127.663 Y120.473 E.55672
G1 X128.307 Y120.473 E.03384
G1 X120.172 Y128.608 E.60457
G1 X120.172 Y129.251 E.03383
G1 X128.951 Y120.472 E.65242
G1 X129.594 Y120.472 E.03384
G1 X120.172 Y129.895 E.70027
G1 X120.172 Y130.539 E.03383
G1 X130.238 Y120.472 E.74812
G1 X130.882 Y120.472 E.03384
G1 X120.172 Y131.183 E.79597
G1 X120.172 Y131.827 E.03383
G1 X131.526 Y120.472 E.84382
G1 X132.17 Y120.472 E.03384
G1 X120.172 Y132.47 E.89167
G1 X120.172 Y133.114 E.03383
G1 X132.814 Y120.472 E.93952
G1 X133.458 Y120.472 E.03384
G1 X120.172 Y133.758 E.98737
G1 X120.172 Y134.402 E.03383
G1 X134.102 Y120.472 E1.03523
G1 X134.745 Y120.472 E.03384
G1 X120.172 Y135.046 E1.08308
G1 X120.172 Y135.528 E.02536
G1 X120.333 Y135.528 E.00847
G1 X135.389 Y120.472 E1.11895
G1 X135.828 Y120.472 E.02307
G1 X135.828 Y120.677 E.01076
G1 X120.977 Y135.528 E1.10373
G1 X121.621 Y135.528 E.03384
G1 X135.828 Y121.32 E1.05587
G1 X135.828 Y121.964 E.03383
G1 X122.265 Y135.528 E1.00802
G1 X122.908 Y135.528 E.03384
G1 X135.828 Y122.608 E.96017
G1 X135.828 Y123.252 E.03383
G1 X123.552 Y135.528 E.91232
G1 X124.196 Y135.528 E.03384
G1 X135.828 Y123.896 E.86447
G1 X135.828 Y124.539 E.03383
G1 X124.84 Y135.528 E.81662
G1 X125.484 Y135.528 E.03384
G1 X135.828 Y125.183 E.76877
G1 X135.828 Y125.827 E.03383
G1 X126.128 Y135.528 E.72092
G1 X126.772 Y135.528 E.03384
G1 X135.828 Y126.471 E.67307
G1 X135.828 Y127.115 E.03383
G1 X127.415 Y135.527 E.62522
G1 X128.059 Y135.527 E.03384
G1 X135.828 Y127.758 E.57737
G1 X135.828 Y128.402 E.03383
G1 X128.703 Y135.527 E.52952
G1 X129.347 Y135.527 E.03384
G1 X135.828 Y129.046 E.48167
G1 X135.828 Y129.69 E.03383
G1 X129.991 Y135.527 E.43382
G1 X130.635 Y135.527 E.03384
G1 X135.828 Y130.334 E.38597
G1 X135.828 Y130.977 E.03383
G1 X131.279 Y135.527 E.33811
G1 X131.923 Y135.527 E.03384
G1 X135.828 Y131.621 E.29026
G1 X135.828 Y132.265 E.03383
G1 X133.723 Y134.37 E.15645
G1 X133.957 Y134.205 E.01506
G1 X134.245 Y134.492 E.02138
G1 X135.828 Y132.909 E.11769
G1 X135.828 Y133.553 E.03383
G1 X134.423 Y134.958 E.10441
M106 S188.7
M204 S10000
G1 X137.905 Y135.075 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8843.478
M204 S6000
G1 X136.277 Y135.075 E.05401
G1 X135.804 Y135.548 E.02217
G1 X135.548 Y135.548 E.00849
G1 X134.995 Y134.995 E.02593
G1 X134.569 Y135.422 E.02003
G1 X133.91 Y134.763 E.03091
G1 X133.834 Y134.817 E.00307
; OBJECT_ID: 394
; WIPE_START
G1 X133.91 Y134.763 E-.03522
G1 X134.569 Y135.422 E-.35413
G1 X134.995 Y134.995 E-.22942
G1 X135.258 Y135.258 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X127.628 Y135.092 Z2.2 F42000
G1 X97.79 Y134.44 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X103.41 Y134.44 E.17269
G1 X103.41 Y135.66 E.03749
G1 X97.79 Y135.66 E.17269
G1 X97.79 Y134.5 E.03564
; WIPE_START
M204 S6000
G1 X99.79 Y134.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.622 Y126.936 Z2.2 F42000
G1 X97.79 Y121.56 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X97.79 Y120.34 E.03749
G1 X103.41 Y120.34 E.17269
G1 X103.41 Y121.56 E.03749
G1 X97.85 Y121.56 E.17084
M204 S10000
G1 X97.398 Y121.56 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.398 Y121.952 E.01301
G1 X100.198 Y121.952 E.09288
G1 X100.198 Y134.048 E.40124
G1 X97.398 Y134.048 E.09288
G1 X97.398 Y135.898 E.06137
G1 X86.602 Y135.898 E.35812
G1 X86.602 Y134.048 E.06137
G1 X83.802 Y134.048 E.09288
G1 X83.802 Y121.952 E.40124
G1 X86.602 Y121.952 E.09288
G1 X86.602 Y120.102 E.06136
G1 X97.398 Y120.103 E.35812
G1 X97.398 Y121.5 E.04633
; WIPE_START
G1 X97.398 Y121.952 E-.17179
G1 X98.946 Y121.952 E-.58821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.317 Y121.717 Z2.2 F42000
G1 X86.21 Y121.56 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X80.59 Y121.56 E.17269
G1 X80.59 Y120.34 E.03749
G1 X86.21 Y120.34 E.17269
G1 X86.21 Y121.5 E.03564
; WIPE_START
M204 S6000
G1 X84.21 Y121.521 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.378 Y129.064 Z2.2 F42000
G1 X86.21 Y134.44 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X86.21 Y135.66 E.03749
G1 X80.59 Y135.66 E.17269
G1 X80.59 Y134.44 E.03749
G1 X86.15 Y134.44 E.17084
; WIPE_START
M204 S6000
G1 X86.21 Y135.66 E-.46416
G1 X85.431 Y135.66 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.41 Y134.31 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X83.41 Y121.69 E.38778
G1 X80.44 Y121.69 E.09126
G1 X80.44 Y122.165 E.0146
G1 X80.21 Y122.165 E.00706
G1 X80.212 Y121.032 E.03482
G3 X81.603 Y119.71 I1.398 J.078 E.06496
G1 X102.455 Y119.712 E.64074
G3 X103.79 Y121.105 I-.064 J1.397 E.06544
M73 P44 R13
G1 X103.79 Y122.165 E.03256
G1 X103.56 Y122.165 E.00707
G1 X103.56 Y121.69 E.0146
G1 X100.59 Y121.69 E.09126
G1 X100.59 Y134.31 E.38778
G1 X103.56 Y134.31 E.09126
G1 X103.56 Y133.835 E.0146
G1 X103.79 Y133.835 E.00706
G1 X103.788 Y134.968 E.03482
G3 X102.395 Y136.29 I-1.398 J-.078 E.06504
G1 X81.605 Y136.29 E.63879
G3 X80.21 Y134.897 I-.004 J-1.391 E.06733
G1 X80.21 Y133.835 E.03264
G1 X80.44 Y133.835 E.00707
G1 X80.44 Y134.31 E.0146
G1 X83.35 Y134.31 E.08942
; WIPE_START
M204 S6000
G1 X83.36 Y132.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.672 Y136.094 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.106147
G1 F15000
M204 S6000
G1 X80.948 Y135.875 E.0039
M204 S10000
G1 X80.945 Y135.886 F42000
; LINE_WIDTH: 0.19369
G1 F15000
M204 S6000
G1 X81.227 Y135.942 E.00353
; LINE_WIDTH: 0.232448
G1 X81.341 Y135.959 E.00178
; LINE_WIDTH: 0.28026
G2 X81.613 Y135.975 I.297 J-2.776 E.00527
G1 X86.406 Y135.975 E.09269
; WIPE_START
G1 X84.406 Y135.975 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.033 Y135.678 Z2.2 F42000
G1 X95.684 Y135.535 Z2.2
G1 Z1.8
G1 E.8 F1800
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X91.497 Y135.535 E.11601
; Slow Down End
M204 S10000
G1 X96.673 Y134.301 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X96.673 Y133.323 E.03245
G1 X97.323 Y133.323 E.02156
G1 X86.677 Y122.677 E.49938
G1 X87.327 Y122.677 E.02156
G1 X87.327 Y120.828 E.06135
G1 X91.496 Y120.828 E.13827
G1 X84.527 Y127.797 E.3269
G1 X84.527 Y128.203 E.0135
G1 X91.497 Y135.173 E.32693
G1 X92.503 Y135.173 E.0334
G1 X99.473 Y128.203 E.32694
G1 X99.473 Y127.797 E.0135
G1 X92.504 Y120.828 E.32689
G1 X93.358 Y120.828 E.02833
G1 X93.03 Y120.451 E.01659
G1 X94.905 Y120.451 E.06218
G1 X94.527 Y120.828 E.01769
G1 X96.673 Y120.829 E.07116
G1 X96.673 Y122.677 E.06133
G1 X97.323 Y122.677 E.02156
G1 X86.677 Y133.323 E.49938
G1 X87.327 Y133.323 E.02156
G1 X87.327 Y134.301 E.03245
; WIPE_START
G1 X87.327 Y133.323 E-.37176
G1 X86.677 Y133.323 E-.247
G1 X86.94 Y133.06 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.302 Y135.074 Z2.2 F42000
G1 X97.594 Y135.975 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279803
G1 F15000
M204 S6000
G1 X102.387 Y135.975 E.09251
G2 X102.719 Y135.951 I-.003 J-2.358 E.00643
; LINE_WIDTH: 0.213993
G1 X103.057 Y135.892 E.00478
; WIPE_START
G1 X102.719 Y135.951 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.879 Y128.32 Z2.2 F42000
G1 X103.052 Y120.125 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.106381
G1 F15000
M204 S6000
G1 X102.333 Y119.908 E.00388
M204 S10000
G1 X102.713 Y120.048 F42000
; LINE_WIDTH: 0.278508
G1 F15000
M204 S6000
G2 X102.441 Y120.026 I-.352 J2.643 E.00524
G1 X97.594 Y120.026 E.09304
; WIPE_START
G1 X99.594 Y120.026 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.403 Y120.466 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.384574
G1 F10536.981
M204 S6000
G1 X96.876 Y120.466 E.04101
G1 X97.008 Y120.493 E.00375
G1 X97.035 Y120.625 E.00375
G1 X97.035 Y122.156 E.04261
G1 X97.063 Y122.287 E.00375
G1 X97.194 Y122.315 E.00375
G1 X99.676 Y122.315 E.06909
G1 X99.808 Y122.342 E.00375
G1 X99.835 Y122.474 E.00375
G1 X99.835 Y133.526 E.30769
G1 X99.808 Y133.658 E.00375
G1 X99.676 Y133.685 E.00375
G1 X97.194 Y133.685 E.06909
G1 X97.063 Y133.712 E.00375
G1 X97.037 Y134.612 E.02504
; WIPE_START
G1 X97.063 Y133.712 E-.34184
G1 X97.194 Y133.685 E-.05119
G1 X98.16 Y133.685 E-.36697
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.577 Y126.445 Z2.2 F42000
G1 X102.713 Y120.048 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.214424
G1 F15000
M204 S6000
G1 X103.057 Y120.108 E.00488
; WIPE_START
G1 X102.713 Y120.048 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.083 Y120.261 Z2.2 F42000
G1 X87.744 Y120.465 Z2.2
G1 Z1.8
G1 E.8 F1800
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X92.608 Y120.466 E.13475
; Slow Down End
M204 S10000
G1 X88.636 Y135.535 F42000
; LINE_WIDTH: 0.384369
G1 F10543.3
M204 S6000
G1 X87.124 Y135.535 E.04206
G1 X86.992 Y135.508 E.00375
G1 X86.965 Y135.376 E.00375
G1 X86.965 Y133.844 E.04261
G1 X86.938 Y133.712 E.00375
G1 X86.806 Y133.685 E.00375
G1 X84.324 Y133.685 E.06905
G1 X84.192 Y133.658 E.00375
G3 X84.165 Y132.771 I11.056 J-.785 E.02471
G1 X84.165 Y122.474 E.28649
G1 X84.192 Y122.342 E.00375
G1 X84.324 Y122.315 E.00375
G1 X86.806 Y122.315 E.06905
G1 X86.938 Y122.287 E.00375
G1 X86.965 Y122.156 E.00375
G1 X86.965 Y120.922 E.03431
; WIPE_START
G1 X86.965 Y122.156 E-.46859
G1 X86.938 Y122.287 E-.05119
G1 X86.806 Y122.315 E-.05119
G1 X86.308 Y122.315 E-.18903
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.406 Y120.025 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.278995
G1 F15000
M204 S6000
G1 X81.552 Y120.026 E.09337
G2 X81.287 Y120.048 I.098 J2.759 E.00511
; LINE_WIDTH: 0.215132
G1 X80.943 Y120.108 E.0049
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X81.287 Y120.048 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 10/42
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
M106 S191.25
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z2.2 I-.016 J1.217 P1  F42000
G1 X172.198 Y121.223 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X172.198 Y134.777 E.44962
G1 X175.397 Y134.777 E.1061
G3 X174.385 Y135.898 I-1.008 J.107 E.05649
G1 X153.615 Y135.898 E.68898
G3 X152.604 Y134.777 I-.01 J-1.008 E.05661
G1 X155.802 Y134.777 E.1061
G1 X155.802 Y121.223 E.44962
G1 X152.603 Y121.223 E.1061
G3 X153.608 Y120.102 I1.012 J-.104 E.0562
G1 X174.435 Y120.104 E.69088
G3 X175.401 Y121.223 I-.055 J1.023 E.05477
G1 X172.258 Y121.223 E.10425
M204 S250
G1 X172.59 Y121.615 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X172.59 Y134.385 E.39239
G1 X173.303 Y134.385 E.02189
G1 X173.31 Y134.185 E.00615
G1 X173.69 Y134.185 E.01169
G1 X173.695 Y134.385 E.00615
G1 X174.503 Y134.385 E.02482
G1 X174.51 Y134.185 E.00615
G1 X174.89 Y134.185 E.01169
G1 X174.895 Y134.385 E.00615
G1 X175.789 Y134.385 E.0275
G3 X175.783 Y135.034 I-4.549 J.282 E.01996
G3 X174.395 Y136.29 I-1.393 J-.145 E.06301
G1 X153.605 Y136.29 E.6388
G3 X152.212 Y134.968 I.004 J-1.4 E.06504
G1 X152.21 Y134.385 E.01792
G1 X153.103 Y134.385 E.02741
G1 X153.11 Y134.185 E.00615
G1 X153.49 Y134.185 E.01169
G1 X153.495 Y134.385 E.00615
G1 X154.305 Y134.385 E.02491
G1 X154.31 Y134.185 E.00614
G1 X154.69 Y134.186 E.01169
G1 X154.697 Y134.385 E.00613
G1 X155.41 Y134.385 E.02189
G1 X155.41 Y121.615 E.39239
G1 X154.697 Y121.615 E.02189
G1 X154.69 Y121.815 E.00615
G1 X154.31 Y121.815 E.01169
G1 X154.305 Y121.615 E.00615
G1 X153.497 Y121.615 E.02482
G1 X153.49 Y121.815 E.00615
G1 X153.11 Y121.815 E.01169
G1 X153.105 Y121.615 E.00615
G1 X152.21 Y121.615 E.02749
G3 X152.217 Y120.966 I4.548 J-.282 E.01996
G3 X153.603 Y119.71 I1.394 J.145 E.06294
G1 X174.453 Y119.712 E.64067
G3 X175.79 Y121.103 I-.071 J1.406 E.06532
G1 X175.79 Y121.615 E.01574
G1 X174.897 Y121.615 E.02743
G1 X174.89 Y121.815 E.00615
G1 X174.51 Y121.815 E.01169
G1 X174.505 Y121.615 E.00615
G1 X173.695 Y121.615 E.02489
G1 X173.69 Y121.815 E.00614
G1 X173.31 Y121.814 E.01169
G1 X173.302 Y121.615 E.00613
G1 X172.65 Y121.615 E.02005
; WIPE_START
M204 S6000
G1 X172.641 Y123.615 E-.76
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
G1 X171.224 Y133.658 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42246
G1 F9485.166
M204 S6000
G1 X171.865 Y133.017 E.02801
G1 X171.865 Y132.481 E.0166
G1 X170.857 Y133.488 E.04407
G1 X170.321 Y133.488 E.0166
G1 X171.865 Y131.944 E.06754
G1 X171.865 Y131.407 E.0166
G1 X169.784 Y133.488 E.09102
G1 X169.247 Y133.488 E.0166
G1 X171.865 Y130.87 E.1145
G1 X171.865 Y130.334 E.0166
G1 X168.71 Y133.488 E.13797
G1 X168.174 Y133.488 E.0166
G1 X171.865 Y129.797 E.16145
G1 X171.865 Y129.26 E.0166
G1 X167.637 Y133.488 E.18493
G1 X167.1 Y133.488 E.0166
G1 X171.865 Y128.723 E.2084
G1 X171.865 Y128.187 E.0166
G1 X166.563 Y133.488 E.23188
G1 X166.027 Y133.488 E.0166
G1 X171.865 Y127.65 E.25536
G1 X171.865 Y127.113 E.0166
G1 X165.49 Y133.488 E.27883
G1 X164.953 Y133.488 E.0166
G1 X171.865 Y126.576 E.30231
G1 X171.865 Y126.04 E.0166
G1 X164.416 Y133.488 E.32579
G1 X163.879 Y133.488 E.0166
G1 X171.865 Y125.503 E.34926
G1 X171.865 Y124.966 E.0166
G1 X163.343 Y133.488 E.37274
G1 X162.806 Y133.488 E.0166
G1 X171.865 Y124.429 E.39622
G1 X171.865 Y123.893 E.0166
G1 X162.269 Y133.488 E.41969
G1 X161.732 Y133.488 E.0166
G1 X171.865 Y123.356 E.44317
G1 X171.865 Y122.819 E.0166
G1 X161.196 Y133.488 E.46665
G1 X160.659 Y133.488 E.0166
G1 X171.636 Y122.512 E.4801
G1 X171.099 Y122.512 E.0166
G1 X160.122 Y133.488 E.4801
G1 X159.585 Y133.488 E.0166
G1 X170.562 Y122.512 E.4801
G1 X170.025 Y122.512 E.0166
G1 X159.049 Y133.488 E.48009
G1 X158.512 Y133.488 E.0166
G1 X169.489 Y122.512 E.4801
G1 X168.952 Y122.512 E.0166
G1 X157.975 Y133.488 E.4801
G1 X157.438 Y133.488 E.0166
G1 X168.415 Y122.512 E.4801
G1 X167.878 Y122.512 E.0166
G1 X156.902 Y133.488 E.4801
G1 X156.365 Y133.488 E.0166
G1 X167.342 Y122.512 E.4801
G1 X166.805 Y122.512 E.0166
G1 X156.135 Y133.181 E.46667
G1 X156.135 Y132.645 E.0166
G1 X166.268 Y122.512 E.44319
G1 X165.731 Y122.512 E.0166
G1 X156.135 Y132.108 E.41972
G1 X156.135 Y131.571 E.0166
G1 X165.195 Y122.512 E.39624
G1 X164.658 Y122.512 E.0166
G1 X156.135 Y131.034 E.37276
G1 X156.135 Y130.498 E.0166
G1 X164.121 Y122.512 E.34929
G1 X163.584 Y122.512 E.0166
G1 X156.135 Y129.961 E.32581
G1 X156.135 Y129.424 E.0166
G1 X163.047 Y122.512 E.30233
G1 X162.511 Y122.512 E.0166
G1 X156.135 Y128.887 E.27886
G1 X156.135 Y128.351 E.0166
G1 X161.974 Y122.512 E.25538
G1 X161.437 Y122.512 E.0166
G1 X156.135 Y127.814 E.2319
G1 X156.135 Y127.277 E.0166
G1 X160.9 Y122.512 E.20843
G1 X160.364 Y122.512 E.0166
G1 X156.135 Y126.74 E.18495
G1 X156.135 Y126.204 E.0166
G1 X159.827 Y122.512 E.16147
G1 X159.29 Y122.512 E.0166
G1 X156.135 Y125.667 E.138
G1 X156.135 Y125.13 E.0166
G1 X158.753 Y122.512 E.11452
G1 X158.217 Y122.512 E.0166
G1 X156.135 Y124.593 E.09104
G1 X156.135 Y124.057 E.0166
G1 X157.68 Y122.512 E.06757
G1 X157.143 Y122.512 E.0166
G1 X156.135 Y123.52 E.04409
G1 X156.135 Y122.983 E.0166
G1 X156.776 Y122.342 E.02803
; WIPE_START
G1 X156.135 Y122.983 E-.34445
G1 X156.135 Y123.52 E-.20397
G1 X156.529 Y123.126 E-.21159
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.145 Y120.875 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X155.773 Y120.875 E.05401
G1 X156.198 Y120.451 E.0199
G1 X156.451 Y120.451 E.00839
G1 X158.12 Y122.12 E.0783
G1 X162.204 Y122.12 E.1355
G1 X163.873 Y120.451 E.07827
G1 X164.127 Y120.451 E.00843
G1 X165.796 Y122.12 E.07827
G1 X169.88 Y122.12 E.1355
G1 X171.548 Y120.452 E.07825
G1 X171.804 Y120.452 E.00847
G1 X172.227 Y120.875 E.01984
G1 X173.855 Y120.875 E.05401
; WIPE_START
G1 X172.227 Y120.875 E-.61876
M73 P45 R13
G1 X171.964 Y120.612 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X172.95 Y128.18 Z2.4 F42000
G1 X173.855 Y135.125 Z2.4
G1 Z2
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X172.227 Y135.125 E.05401
G1 X171.802 Y135.55 E.01991
G1 X171.55 Y135.55 E.00838
G1 X169.88 Y133.88 E.07831
G1 X165.796 Y133.88 E.1355
G1 X164.126 Y135.55 E.07831
G1 X163.874 Y135.55 E.00838
G1 X162.204 Y133.88 E.07831
G1 X158.12 Y133.88 E.1355
G1 X156.45 Y135.55 E.07831
G1 X156.198 Y135.55 E.00838
G1 X155.773 Y135.125 E.01991
G1 X154.145 Y135.125 E.05401
; OBJECT_ID: 405
; WIPE_START
G1 X155.773 Y135.125 E-.61876
G1 X156.036 Y135.388 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X148.924 Y132.618 Z2.4 F42000
G1 X119.802 Y121.273 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X116.602 Y121.273 E.10615
G3 X117.544 Y120.104 I1.012 J-.149 E.0559
G1 X136.198 Y120.102 E.6188
G1 X136.198 Y134.727 E.48514
G1 X139.398 Y134.727 E.10615
G3 X138.456 Y135.896 I-1.022 J.141 E.05576
G1 X119.802 Y135.898 E.6188
G1 X119.802 Y121.333 E.48315
M204 S250
G1 X119.41 Y121.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X116.21 Y121.665 E.09833
G3 X116.269 Y120.699 I3.341 J-.28 E.02985
G3 X117.529 Y119.712 I1.346 J.421 E.05229
G1 X136.59 Y119.71 E.58568
G1 X136.59 Y134.335 E.44939
G1 X139.79 Y134.335 E.09833
G3 X139.73 Y135.304 I-3.323 J.28 E.02993
G3 X138.471 Y136.288 I-1.343 J-.42 E.05223
G1 X119.41 Y136.29 E.58568
G1 X119.41 Y121.725 E.44754
; WIPE_START
M204 S6000
G1 X117.41 Y121.688 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.774 Y122.367 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42177
G1 F9502.441
M204 S6000
G1 X120.135 Y123.006 E.02791
G1 X120.135 Y123.542 E.01654
G1 X121.141 Y122.537 E.04389
G1 X121.676 Y122.537 E.01654
G1 X120.135 Y124.078 E.06728
G1 X120.135 Y124.614 E.01654
G1 X122.212 Y122.537 E.09068
G1 X122.748 Y122.537 E.01654
G1 X120.135 Y125.149 E.11407
G1 X120.135 Y125.685 E.01654
G1 X123.284 Y122.537 E.13746
G1 X123.819 Y122.537 E.01654
G1 X120.135 Y126.221 E.16085
G1 X120.135 Y126.757 E.01654
G1 X124.355 Y122.537 E.18424
G1 X124.891 Y122.537 E.01654
G1 X120.135 Y127.293 E.20763
G1 X120.135 Y127.828 E.01654
G1 X125.427 Y122.537 E.23102
G1 X125.963 Y122.537 E.01654
G1 X120.135 Y128.364 E.25441
G1 X120.135 Y128.9 E.01654
G1 X126.498 Y122.537 E.27781
G1 X127.034 Y122.537 E.01654
G1 X120.135 Y129.436 E.3012
G1 X120.135 Y129.971 E.01654
G1 X127.57 Y122.537 E.32459
G1 X128.106 Y122.537 E.01654
G1 X120.135 Y130.507 E.34798
G1 X120.135 Y131.043 E.01654
G1 X128.641 Y122.537 E.37137
G1 X129.177 Y122.537 E.01654
G1 X120.135 Y131.579 E.39476
G1 X120.135 Y132.114 E.01654
G1 X131.814 Y120.436 E.50988
G1 X132.35 Y120.436 E.01654
G1 X120.135 Y132.65 E.53328
G1 X120.135 Y133.186 E.01654
G1 X132.886 Y120.436 E.55667
G1 X133.421 Y120.436 E.01654
G1 X120.135 Y133.722 E.58006
G1 X120.135 Y134.258 E.01654
G1 X133.957 Y120.436 E.60346
G1 X134.493 Y120.435 E.01654
G1 X120.135 Y134.793 E.62685
G1 X120.135 Y135.329 E.01654
G1 X135.029 Y120.435 E.65024
G1 X135.565 Y120.435 E.01654
G1 X120.435 Y135.565 E.66053
G1 X120.971 Y135.565 E.01654
G1 X135.865 Y120.671 E.65023
G1 X135.865 Y121.207 E.01654
G1 X121.507 Y135.565 E.62684
G1 X122.043 Y135.564 E.01654
G1 X135.865 Y121.743 E.60344
G1 X135.865 Y122.278 E.01654
G1 X122.579 Y135.564 E.58005
G1 X123.115 Y135.564 E.01654
G1 X135.865 Y122.814 E.55666
G1 X135.865 Y123.35 E.01654
G1 X123.481 Y135.734 E.54067
M204 S10000
G1 X126.483 Y134.875 F42000
G1 F9502.441
M204 S6000
G1 X125.794 Y135.564 E.03009
G1 X125.258 Y135.564 E.01654
G1 X126.313 Y134.509 E.04607
G1 X126.313 Y133.973 E.01654
G1 X124.722 Y135.564 E.06947
G1 X124.186 Y135.564 E.01654
G1 X135.865 Y123.886 E.50987
G1 X135.865 Y124.422 E.01654
G1 X126.823 Y133.463 E.39475
G1 X127.359 Y133.463 E.01654
G1 X135.865 Y124.957 E.37136
G1 X135.865 Y125.493 E.01654
G1 X127.895 Y133.463 E.34797
G1 X128.43 Y133.463 E.01654
G1 X135.865 Y126.029 E.32458
G1 X135.865 Y126.565 E.01654
G1 X128.966 Y133.463 E.30119
G1 X129.502 Y133.463 E.01654
G1 X135.865 Y127.1 E.27779
G1 X135.865 Y127.636 E.01654
G1 X130.038 Y133.463 E.2544
G1 X130.574 Y133.463 E.01654
G1 X135.865 Y128.172 E.23101
G1 X135.865 Y128.708 E.01654
G1 X131.109 Y133.463 E.20762
G1 X131.645 Y133.463 E.01654
G1 X135.865 Y129.244 E.18423
G1 X135.865 Y129.779 E.01654
G1 X132.181 Y133.463 E.16084
G1 X132.717 Y133.463 E.01654
G1 X135.865 Y130.315 E.13745
G1 X135.865 Y130.851 E.01654
G1 X133.252 Y133.463 E.11405
G1 X133.788 Y133.463 E.01654
G1 X135.865 Y131.387 E.09066
G1 X135.865 Y131.922 E.01654
G1 X134.324 Y133.463 E.06727
G1 X134.86 Y133.463 E.01654
G1 X135.865 Y132.458 E.04388
G1 X135.865 Y132.994 E.01654
G1 X135.226 Y133.633 E.0279
; WIPE_START
G1 X135.865 Y132.994 E-.34338
G1 X135.865 Y132.458 E-.2036
G1 X135.468 Y132.855 E-.21302
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.905 Y135.075 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X136.277 Y135.075 E.05401
G1 X135.804 Y135.548 E.02217
G1 X135.548 Y135.548 E.00849
G1 X133.855 Y133.855 E.0794
G1 X129.821 Y133.855 E.13384
G1 X128.127 Y135.549 E.07944
G1 X127.873 Y135.549 E.00844
G1 X126.705 Y134.381 E.05477
G1 X126.705 Y133.855 E.01745
G1 X127.808 Y133.855 E.03657
M204 S10000
G1 X129.517 Y122.197 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42177
G1 F9502.441
M204 S6000
G1 X131.278 Y120.436 E.07689
G1 X130.742 Y120.436 E.01654
G1 X129.687 Y121.491 E.04609
G1 X129.687 Y120.956 E.01654
G1 X130.376 Y120.266 E.0301
M204 S10000
G1 X118.095 Y120.925 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X119.723 Y120.925 E.05401
G1 X120.196 Y120.452 E.02217
G1 X120.452 Y120.452 E.00849
G1 X122.145 Y122.145 E.0794
G1 X126.179 Y122.145 E.13384
G1 X127.873 Y120.451 E.07944
G1 X128.127 Y120.451 E.00844
G1 X129.295 Y121.619 E.05477
G1 X129.295 Y122.145 E.01745
G1 X128.192 Y122.145 E.03657
; OBJECT_ID: 394
; WIPE_START
G1 X129.295 Y122.145 E-.4189
G1 X129.295 Y121.619 E-.19987
G1 X129.032 Y121.356 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X121.992 Y124.304 Z2.4 F42000
G1 X97.79 Y134.44 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X103.41 Y134.44 E.17269
G1 X103.41 Y135.66 E.03749
G1 X97.79 Y135.66 E.17269
G1 X97.79 Y134.5 E.03564
; WIPE_START
M204 S6000
G1 X99.79 Y134.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.622 Y126.936 Z2.4 F42000
G1 X97.79 Y121.56 Z2.4
G1 Z2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X97.79 Y120.34 E.03749
G1 X103.41 Y120.34 E.17269
G1 X103.41 Y121.56 E.03749
G1 X97.85 Y121.56 E.17084
M204 S10000
G1 X97.398 Y121.56 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.398 Y121.952 E.01301
G1 X100.198 Y121.952 E.09288
G1 X100.198 Y134.048 E.40124
G1 X97.398 Y134.048 E.09288
G1 X97.398 Y135.898 E.06137
G1 X86.602 Y135.898 E.35812
G1 X86.602 Y134.048 E.06137
G1 X83.802 Y134.048 E.09288
G1 X83.802 Y121.952 E.40124
G1 X86.602 Y121.952 E.09288
G1 X86.602 Y120.102 E.06136
G1 X97.398 Y120.103 E.35812
G1 X97.398 Y121.5 E.04633
; WIPE_START
G1 X97.398 Y121.952 E-.17179
G1 X98.946 Y121.952 E-.58821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.317 Y121.717 Z2.4 F42000
G1 X86.21 Y121.56 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X80.59 Y121.56 E.17269
G1 X80.59 Y120.34 E.03749
G1 X86.21 Y120.34 E.17269
G1 X86.21 Y121.5 E.03564
; WIPE_START
M204 S6000
G1 X84.21 Y121.521 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.378 Y129.064 Z2.4 F42000
G1 X86.21 Y134.44 Z2.4
G1 Z2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X86.21 Y135.66 E.03749
G1 X80.59 Y135.66 E.17269
G1 X80.59 Y134.44 E.03749
G1 X86.15 Y134.44 E.17084
; WIPE_START
M204 S6000
G1 X86.21 Y135.66 E-.46416
G1 X85.431 Y135.66 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.41 Y134.31 Z2.4 F42000
G1 Z2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X83.41 Y121.69 E.38778
G1 X80.44 Y121.69 E.09126
G1 X80.44 Y122.165 E.0146
G1 X80.21 Y122.165 E.00706
G1 X80.212 Y121.032 E.03482
G3 X81.603 Y119.71 I1.398 J.078 E.06496
G1 X102.453 Y119.712 E.64067
G3 X103.79 Y121.105 I-.062 J1.398 E.06549
G1 X103.79 Y122.165 E.03256
G1 X103.56 Y122.165 E.00707
G1 X103.56 Y121.69 E.0146
G1 X100.59 Y121.69 E.09126
G1 X100.59 Y134.31 E.38778
G1 X103.56 Y134.31 E.09126
G1 X103.56 Y133.835 E.0146
G1 X103.79 Y133.835 E.00706
G1 X103.788 Y134.968 E.03482
G3 X102.395 Y136.29 I-1.398 J-.078 E.06504
G1 X81.605 Y136.29 E.6388
G3 X80.21 Y134.897 I-.004 J-1.391 E.06733
G1 X80.21 Y133.835 E.03264
G1 X80.44 Y133.835 E.00707
G1 X80.44 Y134.31 E.0146
G1 X83.35 Y134.31 E.08942
; WIPE_START
M204 S6000
G1 X83.36 Y132.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.848 Y136.094 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.15898
G1 F15000
M204 S6000
G1 X80.947 Y135.88 E.00876
M204 S10000
G1 X80.948 Y135.899 F42000
; LINE_WIDTH: 0.226054
G1 F15000
M204 S6000
G1 X81.288 Y135.952 E.00514
; LINE_WIDTH: 0.279843
G2 X81.613 Y135.975 I.339 J-2.49 E.0063
G1 X86.406 Y135.975 E.09253
; WIPE_START
G1 X84.406 Y135.975 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.779 Y128.518 Z2.4 F42000
G1 X80.943 Y120.108 Z2.4
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.213287
G1 F15000
M204 S6000
G1 X81.275 Y120.05 E.00467
; LINE_WIDTH: 0.278885
G3 X81.552 Y120.026 I.366 J2.598 E.00536
G1 X86.406 Y120.025 E.09333
; WIPE_START
G1 X84.406 Y120.025 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.769 Y121.546 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40901
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X88.046 Y120.27 E.09666
M106 S191.25
; WIPE_START
G1 X86.769 Y121.546 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.898 Y122.119 Z2.4 F42000
G1 Z2
G1 E.8 F1800
M106 S255
G1 F3000
M204 S6000
G1 X84.172 Y122.846 E.055
G1 X84.172 Y123.495 E.03475
G1 X85.345 Y122.322 E.08881
G1 X85.994 Y122.322 E.03475
G1 X84.172 Y124.144 E.13795
G1 X84.172 Y124.793 E.03475
G1 X88.493 Y120.472 E.32712
G1 X89.142 Y120.472 E.03475
G1 X84.172 Y125.442 E.37626
G1 X84.172 Y126.091 E.03475
G1 X89.791 Y120.472 E.4254
G1 X90.44 Y120.472 E.03475
G1 X84.172 Y126.74 E.47454
G1 X84.172 Y127.39 E.03475
G1 X91.089 Y120.472 E.52368
G1 X91.738 Y120.472 E.03475
G1 X84.172 Y128.039 E.57282
G1 X84.172 Y128.688 E.03475
G1 X92.387 Y120.472 E.62196
G1 X92.602 Y120.473 E.0115
G1 X92.606 Y120.683 E.01125
G1 X92.716 Y120.792 E.00831
G1 X84.172 Y129.337 E.64688
G1 X84.172 Y129.986 E.03475
G1 X93.041 Y121.117 E.67145
G1 X93.365 Y121.442 E.02457
G1 X84.172 Y130.635 E.69602
G1 X84.172 Y131.284 E.03475
G1 X93.69 Y121.766 E.72059
G1 X93.943 Y122.019 E.01915
G1 X95.489 Y120.473 E.11707
G1 X95.633 Y120.473 E.00767
G1 X84.172 Y131.934 E.86766
G1 X84.172 Y132.583 E.03475
G1 X96.282 Y120.473 E.9168
G1 X96.931 Y120.473 E.03475
G1 X84.172 Y133.232 E.96594
G1 X84.172 Y133.678 E.0239
G1 X84.374 Y133.678 E.01085
G1 X97.028 Y121.024 E.95799
G1 X97.028 Y121.673 E.03475
G1 X85.024 Y133.678 E.90884
G1 X85.673 Y133.678 E.03475
G1 X97.029 Y122.322 E.85977
G1 X97.678 Y122.322 E.03475
G1 X86.322 Y133.678 E.85977
G1 X86.971 Y133.678 E.03475
G1 X98.328 Y122.322 E.85977
G1 X98.977 Y122.322 E.03475
G1 X86.972 Y134.327 E.90885
G1 X86.972 Y134.976 E.03475
M73 P46 R13
G1 X99.626 Y122.322 E.958
G1 X99.828 Y122.322 E.01084
G1 X99.828 Y122.768 E.02391
G1 X87.068 Y135.528 E.96601
G1 X87.717 Y135.528 E.03475
G1 X99.828 Y123.417 E.91687
G1 X99.828 Y124.067 E.03475
G1 X88.367 Y135.528 E.86772
G1 X88.533 Y135.528 E.00892
G1 X90.137 Y134.407 E.10477
G1 X99.828 Y124.716 E.73368
G1 X99.828 Y125.365 E.03475
G1 X90.635 Y134.558 E.69601
G1 X90.959 Y134.883 E.02457
G1 X99.828 Y126.014 E.67144
G1 X99.828 Y126.663 E.03475
G1 X91.284 Y135.208 E.64687
G1 X91.476 Y135.399 E.01453
G1 X91.503 Y135.528 E.00705
G1 X91.612 Y135.528 E.00584
G1 X99.828 Y127.312 E.62201
G1 X99.828 Y127.961 E.03475
G1 X92.261 Y135.528 E.57286
G1 X92.911 Y135.528 E.03475
G1 X99.828 Y128.611 E.52372
G1 X99.828 Y129.26 E.03475
G1 X93.56 Y135.528 E.47457
G1 X94.209 Y135.528 E.03475
G1 X99.828 Y129.909 E.42543
G1 X99.828 Y130.558 E.03475
G1 X94.858 Y135.528 E.37629
G1 X95.507 Y135.528 E.03475
G1 X99.828 Y131.207 E.32714
G1 X99.828 Y131.856 E.03475
G1 X98.006 Y133.678 E.13794
G1 X98.655 Y133.678 E.03475
G1 X99.828 Y132.505 E.0888
M73 P46 R12
G1 X99.828 Y133.155 E.03475
G1 X99.102 Y133.881 E.05498
M106 S191.25
; WIPE_START
G1 X99.828 Y133.155 E-.3903
G1 X99.828 Y132.505 E-.24667
G1 X99.599 Y132.734 E-.12303
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.594 Y135.975 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280215
; LAYER_HEIGHT: 0.2
G1 F15000
M204 S6000
G1 X102.387 Y135.975 E.09267
G2 X102.666 Y135.958 I.007 J-2.223 E.00541
; LINE_WIDTH: 0.232648
G1 X102.766 Y135.944 E.00157
; LINE_WIDTH: 0.207443
G1 X103.056 Y135.891 E.00395
; WIPE_START
G1 X102.766 Y135.944 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.56 Y128.314 Z2.4 F42000
G1 X102.332 Y119.908 Z2.4
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.105721
G1 F15000
M204 S6000
G1 X103.052 Y120.125 E.00385
M204 S10000
G1 X103.055 Y120.113 F42000
; LINE_WIDTH: 0.197407
G1 F15000
M204 S6000
G1 X102.769 Y120.057 E.00368
; LINE_WIDTH: 0.231924
G1 X102.67 Y120.042 E.00154
; LINE_WIDTH: 0.278874
G2 X102.439 Y120.026 I-.272 J2.197 E.00446
G1 X97.594 Y120.026 E.09315
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X99.594 Y120.026 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 11/42
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
M106 S196.35
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z2.4 I-.02 J1.217 P1  F42000
G1 X172.198 Y121.223 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X172.198 Y134.777 E.44962
G1 X175.397 Y134.777 E.1061
G3 X174.392 Y135.898 I-1.013 J.102 E.05617
G1 X153.615 Y135.898 E.68922
G3 X152.604 Y134.777 I-.007 J-1.011 E.05655
G1 X155.802 Y134.777 E.1061
G1 X155.802 Y121.223 E.44962
G1 X152.603 Y121.223 E.1061
G3 X153.608 Y120.102 I1.013 J-.102 E.05617
G1 X174.441 Y120.104 E.69109
G3 X175.401 Y121.223 I-.054 J1.018 E.05467
G1 X172.258 Y121.223 E.10425
M204 S250
G1 X172.59 Y121.615 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X172.59 Y134.385 E.39239
G1 X173.302 Y134.385 E.02189
G1 X173.31 Y134.185 E.00615
G1 X173.69 Y134.185 E.01169
G1 X173.695 Y134.385 E.00615
G1 X174.502 Y134.385 E.02482
G1 X174.51 Y134.185 E.00615
G1 X174.89 Y134.185 E.01169
G1 X174.895 Y134.385 E.00615
G1 X175.789 Y134.385 E.0275
G3 X175.783 Y135.034 I-4.556 J.282 E.01995
G3 X174.397 Y136.29 I-1.393 J-.145 E.06295
G1 X153.605 Y136.29 E.63887
G3 X152.212 Y134.968 I.012 J-1.408 E.06494
G1 X152.21 Y134.385 E.01792
G1 X153.102 Y134.385 E.02741
G1 X153.11 Y134.185 E.00615
G1 X153.49 Y134.185 E.01169
G1 X153.495 Y134.385 E.00615
G1 X154.305 Y134.385 E.02491
G1 X154.31 Y134.185 E.00614
G1 X154.69 Y134.186 E.01169
G1 X154.698 Y134.385 E.00613
G1 X155.41 Y134.385 E.02189
G1 X155.41 Y121.615 E.39239
G1 X154.697 Y121.615 E.02189
G1 X154.69 Y121.815 E.00615
G1 X154.31 Y121.815 E.01169
G1 X154.305 Y121.615 E.00615
G1 X153.497 Y121.615 E.02482
G1 X153.49 Y121.815 E.00615
G1 X153.11 Y121.815 E.01169
G1 X153.105 Y121.615 E.00615
G1 X152.21 Y121.615 E.02749
G3 X152.217 Y120.966 I4.54 J-.282 E.01995
G3 X153.603 Y119.71 I1.393 J.145 E.06295
G1 X174.454 Y119.711 E.6407
G3 X175.79 Y121.103 I-.063 J1.398 E.06539
G1 X175.79 Y121.615 E.01574
G1 X174.897 Y121.615 E.02742
G1 X174.89 Y121.815 E.00615
G1 X174.51 Y121.815 E.01169
G1 X174.505 Y121.615 E.00615
G1 X173.695 Y121.615 E.02491
G1 X173.69 Y121.815 E.00614
G1 X173.31 Y121.814 E.01169
G1 X173.302 Y121.615 E.00613
G1 X172.65 Y121.615 E.02005
; WIPE_START
M204 S6000
G1 X172.641 Y123.615 E-.76
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
G1 X172.034 Y123.152 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42246
G1 F9485.166
M204 S6000
G1 X171.394 Y122.512 E.02801
G1 X170.857 Y122.512 E.0166
G1 X171.865 Y123.519 E.04406
G1 X171.865 Y124.056 E.0166
G1 X170.32 Y122.512 E.06754
G1 X169.784 Y122.512 E.0166
G1 X171.865 Y124.593 E.09102
G1 X171.865 Y125.13 E.0166
G1 X169.247 Y122.512 E.11449
G1 X168.71 Y122.512 E.0166
G1 X171.865 Y125.666 E.13797
G1 X171.865 Y126.203 E.0166
G1 X168.173 Y122.512 E.16145
G1 X167.637 Y122.512 E.0166
G1 X171.865 Y126.74 E.18492
G1 X171.865 Y127.277 E.0166
G1 X167.1 Y122.512 E.2084
G1 X166.563 Y122.512 E.0166
G1 X171.865 Y127.813 E.23188
G1 X171.865 Y128.35 E.0166
G1 X166.026 Y122.512 E.25535
G1 X165.49 Y122.512 E.0166
G1 X171.865 Y128.887 E.27883
G1 X171.865 Y129.424 E.0166
G1 X164.953 Y122.512 E.30231
G1 X164.416 Y122.512 E.0166
G1 X171.865 Y129.96 E.32578
G1 X171.865 Y130.497 E.0166
G1 X163.879 Y122.512 E.34926
G1 X163.343 Y122.512 E.0166
G1 X171.865 Y131.034 E.37274
G1 X171.865 Y131.571 E.0166
G1 X162.806 Y122.512 E.39621
G1 X162.269 Y122.512 E.0166
G1 X171.865 Y132.107 E.41969
G1 X171.865 Y132.644 E.0166
G1 X161.732 Y122.512 E.44317
G1 X161.196 Y122.512 E.0166
G1 X171.865 Y133.181 E.46664
G1 X171.865 Y133.488 E.00951
G1 X171.635 Y133.488 E.0071
M73 P47 R12
G1 X160.659 Y122.512 E.48009
G1 X160.122 Y122.512 E.0166
G1 X171.099 Y133.488 E.48009
G1 X170.562 Y133.488 E.0166
G1 X159.585 Y122.512 E.48009
G1 X159.049 Y122.512 E.0166
G1 X170.025 Y133.488 E.48009
G1 X169.488 Y133.488 E.0166
G1 X158.512 Y122.512 E.48009
G1 X157.975 Y122.512 E.0166
G1 X168.952 Y133.488 E.48009
G1 X168.415 Y133.488 E.0166
G1 X157.438 Y122.512 E.48009
G1 X156.902 Y122.512 E.0166
G1 X167.878 Y133.488 E.48009
G1 X167.341 Y133.488 E.0166
G1 X156.365 Y122.512 E.48009
G1 X156.135 Y122.512 E.0071
G1 X156.135 Y122.819 E.0095
G1 X166.805 Y133.488 E.46665
G1 X166.268 Y133.488 E.0166
G1 X156.135 Y123.356 E.44318
G1 X156.135 Y123.892 E.0166
G1 X165.731 Y133.488 E.4197
G1 X165.194 Y133.488 E.0166
G1 X156.135 Y124.429 E.39622
G1 X156.135 Y124.966 E.0166
G1 X164.658 Y133.488 E.37275
G1 X164.121 Y133.488 E.0166
G1 X156.135 Y125.503 E.34927
G1 X156.135 Y126.039 E.0166
G1 X163.584 Y133.488 E.32579
G1 X163.047 Y133.488 E.0166
G1 X156.135 Y126.576 E.30232
G1 X156.135 Y127.113 E.0166
G1 X162.511 Y133.488 E.27884
G1 X161.974 Y133.488 E.0166
G1 X156.135 Y127.65 E.25536
G1 X156.135 Y128.186 E.0166
G1 X161.437 Y133.488 E.23189
G1 X160.9 Y133.488 E.0166
G1 X156.135 Y128.723 E.20841
G1 X156.135 Y129.26 E.0166
G1 X160.364 Y133.488 E.18493
G1 X159.827 Y133.488 E.0166
G1 X156.135 Y129.797 E.16146
G1 X156.135 Y130.333 E.0166
G1 X159.29 Y133.488 E.13798
G1 X158.753 Y133.488 E.0166
G1 X156.135 Y130.87 E.1145
G1 X156.135 Y131.407 E.0166
G1 X158.216 Y133.488 E.09103
G1 X157.68 Y133.488 E.0166
G1 X156.135 Y131.944 E.06755
G1 X156.135 Y132.48 E.0166
G1 X157.143 Y133.488 E.04407
G1 X156.606 Y133.488 E.0166
G1 X155.966 Y132.848 E.02802
; WIPE_START
G1 X156.606 Y133.488 E-.34426
G1 X157.143 Y133.488 E-.20397
G1 X156.749 Y133.094 E-.21177
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.145 Y135.125 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X155.773 Y135.125 E.05401
G1 X156.198 Y135.55 E.01991
G1 X156.45 Y135.55 E.00838
G1 X158.12 Y133.88 E.07831
G1 X162.204 Y133.88 E.1355
G1 X163.874 Y135.55 E.07831
G1 X164.126 Y135.55 E.00838
G1 X165.796 Y133.88 E.07831
G1 X169.88 Y133.88 E.1355
G1 X171.55 Y135.55 E.07831
G1 X171.802 Y135.55 E.00838
G1 X172.227 Y135.125 E.01991
G1 X173.855 Y135.125 E.05401
; WIPE_START
G1 X172.227 Y135.125 E-.61876
G1 X171.964 Y135.388 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X172.95 Y127.82 Z2.6 F42000
G1 X173.855 Y120.875 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X172.227 Y120.875 E.05401
G1 X171.804 Y120.452 E.01985
G1 X171.548 Y120.452 E.00846
G1 X169.88 Y122.12 E.07825
G1 X165.796 Y122.12 E.1355
G1 X164.127 Y120.451 E.07828
G1 X163.873 Y120.451 E.00843
G1 X162.204 Y122.12 E.07828
G1 X158.12 Y122.12 E.1355
G1 X156.451 Y120.451 E.0783
G1 X156.198 Y120.45 E.00839
G1 X155.773 Y120.875 E.0199
G1 X154.145 Y120.875 E.05401
; OBJECT_ID: 405
; WIPE_START
G1 X155.773 Y120.875 E-.61876
G1 X156.036 Y120.612 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X148.405 Y120.751 Z2.6 F42000
G1 X119.802 Y121.273 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X116.602 Y121.273 E.10615
G3 X117.55 Y120.104 I1.022 J-.14 E.05597
G1 X136.198 Y120.102 E.61858
G1 X136.198 Y134.727 E.48514
G1 X139.398 Y134.727 E.10615
G3 X138.456 Y135.896 I-1.014 J.147 E.05587
G1 X119.802 Y135.898 E.61879
G1 X119.802 Y121.333 E.48315
M204 S250
G1 X119.41 Y121.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X116.21 Y121.665 E.09833
G3 X116.252 Y120.762 I3.69 J-.281 E.02784
G3 X117.532 Y119.712 I1.368 J.362 E.05434
G1 X136.59 Y119.71 E.58561
G1 X136.59 Y134.335 E.44939
G1 X139.79 Y134.335 E.09833
G3 X139.73 Y135.304 I-3.324 J.28 E.02992
G3 X138.471 Y136.288 I-1.343 J-.42 E.05224
G1 X119.41 Y136.29 E.58568
G1 X119.41 Y121.725 E.44754
; WIPE_START
M204 S6000
G1 X117.41 Y121.688 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.036 Y122.011 Z2.6 F42000
G1 X128.192 Y122.145 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X129.295 Y122.145 E.03657
G1 X129.295 Y121.619 E.01745
G1 X128.127 Y120.451 E.05477
G1 X127.873 Y120.451 E.00844
G1 X126.179 Y122.145 E.07944
G1 X122.145 Y122.145 E.13384
G1 X120.452 Y120.452 E.07941
G1 X120.196 Y120.452 E.00849
G1 X119.723 Y120.925 E.02217
G1 X118.095 Y120.925 E.05401
M204 S10000
G1 X136.034 Y121.032 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42179
G1 F9501.939
M204 S6000
G1 X135.438 Y120.435 E.02604
G1 X134.902 Y120.436 E.01654
G1 X135.865 Y121.398 E.04202
G1 X135.865 Y121.934 E.01654
G1 X134.367 Y120.436 E.06541
G1 X133.831 Y120.436 E.01654
G1 X135.865 Y122.47 E.0888
G1 X135.865 Y123.005 E.01654
G1 X133.295 Y120.436 E.11219
G1 X132.759 Y120.436 E.01654
G1 X135.865 Y123.541 E.13559
G1 X135.865 Y124.077 E.01654
G1 X132.224 Y120.436 E.15898
G1 X131.688 Y120.436 E.01654
G1 X135.865 Y124.613 E.18237
G1 X135.865 Y125.149 E.01654
G1 X131.152 Y120.436 E.20576
G1 X130.616 Y120.436 E.01654
G1 X135.865 Y125.684 E.22915
G1 X135.865 Y126.22 E.01654
G1 X130.081 Y120.436 E.25254
G1 X129.687 Y120.436 E.01215
G1 X129.687 Y120.578 E.00439
G1 X135.865 Y126.756 E.26973
G1 X135.865 Y127.292 E.01654
G1 X129.687 Y121.114 E.26973
G1 X129.687 Y121.65 E.01654
G1 X135.865 Y127.828 E.26973
G1 X135.865 Y128.363 E.01654
G1 X129.687 Y122.186 E.26973
G1 X129.687 Y122.334 E.00457
G1 X129.493 Y122.527 E.00846
G1 X135.865 Y128.899 E.27819
G1 X135.865 Y129.435 E.01654
G1 X128.967 Y122.537 E.30118
G1 X128.431 Y122.537 E.01654
G1 X135.865 Y129.971 E.32457
G1 X135.865 Y130.507 E.01654
G1 X127.895 Y122.537 E.34797
G1 X127.359 Y122.537 E.01654
G1 X135.865 Y131.042 E.37136
G1 X135.865 Y131.578 E.01654
G1 X126.823 Y122.537 E.39476
G1 X126.288 Y122.537 E.01654
G1 X135.865 Y132.114 E.41815
G1 X135.865 Y132.65 E.01654
G1 X125.752 Y122.537 E.44154
G1 X125.216 Y122.537 E.01654
G1 X135.865 Y133.186 E.46494
G1 X135.865 Y133.463 E.00857
G1 X135.606 Y133.463 E.00797
G1 X124.68 Y122.537 E.47706
G1 X124.144 Y122.537 E.01654
G1 X135.071 Y133.463 E.47706
G1 X134.535 Y133.463 E.01654
G1 X123.609 Y122.537 E.47706
G1 X123.073 Y122.537 E.01654
G1 X133.999 Y133.463 E.47706
G1 X133.463 Y133.463 E.01654
G1 X122.537 Y122.537 E.47705
G1 X122.001 Y122.537 E.01654
G1 X132.927 Y133.463 E.47706
G1 X132.392 Y133.463 E.01654
G1 X121.465 Y122.537 E.47706
G1 X120.93 Y122.537 E.01654
G1 X131.856 Y133.463 E.47705
G1 X131.32 Y133.463 E.01654
G1 X120.394 Y122.537 E.47706
G1 X120.135 Y122.537 E.00798
G1 X120.135 Y122.814 E.00856
G1 X130.784 Y133.463 E.46494
G1 X130.248 Y133.463 E.01654
G1 X120.135 Y123.35 E.44155
G1 X120.135 Y123.886 E.01654
G1 X129.713 Y133.463 E.41816
G1 X129.177 Y133.463 E.01654
G1 X120.135 Y124.422 E.39476
G1 X120.135 Y124.957 E.01654
G1 X128.641 Y133.463 E.37137
G1 X128.105 Y133.463 E.01654
G1 X120.135 Y125.493 E.34797
G1 X120.135 Y126.029 E.01654
G1 X127.569 Y133.463 E.32458
G1 X127.034 Y133.463 E.01654
G1 X120.135 Y126.565 E.30119
G1 X120.135 Y127.101 E.01654
G1 X126.507 Y133.472 E.2782
G1 X126.313 Y133.666 E.00847
G1 X126.313 Y133.814 E.00457
G1 X120.135 Y127.636 E.26973
G1 X120.135 Y128.172 E.01654
G1 X126.313 Y134.35 E.26973
G1 X126.313 Y134.886 E.01654
G1 X120.135 Y128.708 E.26973
G1 X120.135 Y129.244 E.01654
G1 X126.313 Y135.422 E.26973
G1 X126.313 Y135.564 E.00439
G1 X125.92 Y135.564 E.01215
G1 X120.135 Y129.78 E.25255
G1 X120.135 Y130.315 E.01654
G1 X125.384 Y135.564 E.22916
G1 X124.848 Y135.564 E.01654
G1 X120.135 Y130.851 E.20577
G1 X120.135 Y131.387 E.01654
G1 X124.312 Y135.564 E.18238
G1 X123.777 Y135.564 E.01654
G1 X120.135 Y131.923 E.15898
G1 X120.135 Y132.459 E.01654
G1 X123.241 Y135.564 E.13559
G1 X122.705 Y135.564 E.01654
G1 X120.135 Y132.995 E.1122
G1 X120.135 Y133.53 E.01654
G1 X122.169 Y135.564 E.08881
G1 X121.634 Y135.564 E.01654
G1 X120.135 Y134.066 E.06542
G1 X120.135 Y134.602 E.01654
G1 X121.098 Y135.564 E.04203
G1 X120.562 Y135.565 E.01654
G1 X119.966 Y134.968 E.02604
M204 S10000
G1 X127.808 Y133.855 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X126.705 Y133.855 E.03657
G1 X126.705 Y134.381 E.01745
G1 X127.873 Y135.549 E.05477
G1 X128.127 Y135.549 E.00844
G1 X129.821 Y133.855 E.07944
G1 X133.855 Y133.855 E.13384
G1 X135.548 Y135.548 E.07941
G1 X135.804 Y135.548 E.00849
G1 X136.277 Y135.075 E.02217
G1 X137.905 Y135.075 E.05401
; OBJECT_ID: 394
; WIPE_START
G1 X136.277 Y135.075 E-.61876
G1 X136.014 Y135.338 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X128.383 Y135.159 Z2.6 F42000
G1 X97.79 Y134.44 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X103.41 Y134.44 E.17269
G1 X103.41 Y135.66 E.03749
G1 X97.79 Y135.66 E.17269
G1 X97.79 Y134.5 E.03564
; WIPE_START
M204 S6000
G1 X99.79 Y134.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.622 Y126.936 Z2.6 F42000
G1 X97.79 Y121.56 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X97.79 Y120.34 E.03749
G1 X103.41 Y120.34 E.17269
G1 X103.41 Y121.56 E.03749
G1 X97.85 Y121.56 E.17084
M204 S10000
G1 X97.398 Y121.56 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.398 Y121.952 E.01301
G1 X100.198 Y121.952 E.09288
G1 X100.198 Y134.048 E.40124
G1 X97.398 Y134.048 E.09288
G1 X97.398 Y135.898 E.06137
G1 X86.602 Y135.898 E.35812
G1 X86.602 Y134.048 E.06137
G1 X83.802 Y134.048 E.09288
G1 X83.802 Y121.952 E.40124
G1 X86.602 Y121.952 E.09288
G1 X86.602 Y120.102 E.06136
G1 X97.398 Y120.103 E.35812
G1 X97.398 Y121.5 E.04633
; WIPE_START
G1 X97.398 Y121.952 E-.17179
G1 X98.946 Y121.952 E-.58821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.317 Y121.717 Z2.6 F42000
G1 X86.21 Y121.56 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X80.59 Y121.56 E.17269
G1 X80.59 Y120.34 E.03749
G1 X86.21 Y120.34 E.17269
G1 X86.21 Y121.5 E.03564
; WIPE_START
M204 S6000
G1 X84.21 Y121.521 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.378 Y129.064 Z2.6 F42000
M73 P48 R12
G1 X86.21 Y134.44 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X86.21 Y135.66 E.03749
G1 X80.59 Y135.66 E.17269
G1 X80.59 Y134.44 E.03749
G1 X86.15 Y134.44 E.17084
; WIPE_START
M204 S6000
G1 X86.21 Y135.66 E-.46416
G1 X85.431 Y135.66 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.41 Y134.31 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X83.41 Y121.69 E.38778
G1 X80.44 Y121.69 E.09126
G1 X80.44 Y122.165 E.0146
G1 X80.21 Y122.165 E.00706
G1 X80.212 Y121.032 E.03482
G3 X81.603 Y119.71 I1.404 J.085 E.06489
G1 X102.454 Y119.711 E.6407
G3 X103.79 Y121.105 I-.054 J1.389 E.06558
G1 X103.79 Y122.165 E.03256
G1 X103.56 Y122.165 E.00707
G1 X103.56 Y121.69 E.0146
G1 X100.59 Y121.69 E.09126
G1 X100.59 Y134.31 E.38778
G1 X103.56 Y134.31 E.09126
G1 X103.56 Y133.835 E.0146
G1 X103.79 Y133.835 E.00706
G1 X103.788 Y134.968 E.03482
G3 X102.397 Y136.29 I-1.398 J-.078 E.06496
G1 X81.605 Y136.29 E.63887
G3 X80.21 Y134.897 I-.001 J-1.395 E.06728
G1 X80.21 Y133.835 E.03264
G1 X80.44 Y133.835 E.00707
G1 X80.44 Y134.31 E.0146
G1 X83.35 Y134.31 E.08942
; WIPE_START
M204 S6000
G1 X83.36 Y132.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.733 Y133.884 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42248
G1 F9484.667
M204 S6000
G1 X84.135 Y133.286 E.02616
G1 X84.135 Y132.75 E.0166
G1 X85.1 Y133.715 E.04222
G1 X85.637 Y133.715 E.0166
G1 X84.135 Y132.213 E.0657
G1 X84.135 Y131.676 E.0166
G1 X86.174 Y133.715 E.08917
G1 X86.711 Y133.715 E.0166
G1 X84.135 Y131.139 E.11265
G1 X84.135 Y130.602 E.0166
G1 X87.008 Y133.475 E.12563
G1 X87.044 Y133.438 E.0016
G1 X87.508 Y133.438 E.01434
G1 X84.135 Y130.066 E.14752
G1 X84.135 Y129.529 E.0166
G1 X88.045 Y133.438 E.171
G1 X88.581 Y133.438 E.0166
G1 X84.135 Y128.992 E.19447
G1 X84.135 Y128.455 E.0166
G1 X89.118 Y133.438 E.21795
G1 X89.655 Y133.438 E.0166
G1 X84.135 Y127.919 E.24143
G1 X84.135 Y127.382 E.0166
G1 X90.192 Y133.438 E.26491
G1 X90.729 Y133.438 E.0166
G1 X84.135 Y126.845 E.28839
G1 X84.135 Y126.308 E.0166
G1 X91.265 Y133.438 E.31187
G1 X91.802 Y133.438 E.0166
G1 X84.135 Y125.771 E.33535
G1 X84.135 Y125.235 E.0166
G1 X92.339 Y133.438 E.35883
G1 X92.876 Y133.438 E.0166
G1 X84.135 Y124.698 E.38231
G1 X84.135 Y124.161 E.0166
G1 X93.412 Y133.438 E.40579
G1 X93.949 Y133.438 E.0166
G1 X84.135 Y123.624 E.42927
G1 X84.135 Y123.087 E.0166
G1 X94.486 Y133.438 E.45274
G1 X95.023 Y133.438 E.0166
G1 X84.135 Y122.551 E.47622
G1 X84.135 Y122.285 E.00821
G1 X84.407 Y122.285 E.00839
G1 X95.56 Y133.438 E.48783
G1 X96.096 Y133.438 E.0166
G1 X84.943 Y122.285 E.48783
G1 X85.48 Y122.285 E.0166
G1 X96.633 Y133.438 E.48783
G1 X96.956 Y133.438 E.00999
G1 X97.159 Y133.641 E.00889
G1 X97.159 Y133.715 E.00227
G1 X97.446 Y133.715 E.00889
G1 X86.017 Y122.285 E.49993
G1 X86.554 Y122.285 E.0166
G1 X97.983 Y133.715 E.49993
G1 X98.52 Y133.715 E.0166
G1 X87.367 Y122.562 E.48783
G1 X87.904 Y122.562 E.0166
G1 X99.057 Y133.715 E.48783
G1 X99.594 Y133.715 E.0166
G1 X88.441 Y122.562 E.48783
G1 X88.977 Y122.562 E.0166
G1 X99.865 Y133.449 E.47621
G1 X99.865 Y132.912 E.0166
G1 X89.514 Y122.562 E.45274
G1 X90.051 Y122.562 E.0166
G1 X99.865 Y132.376 E.42926
G1 X99.865 Y131.839 E.0166
G1 X90.588 Y122.562 E.40578
G1 X91.125 Y122.562 E.0166
G1 X99.865 Y131.302 E.3823
G1 X99.865 Y130.765 E.0166
G1 X91.661 Y122.562 E.35882
G1 X92.198 Y122.562 E.0166
G1 X99.865 Y130.228 E.33534
G1 X99.865 Y129.692 E.0166
G1 X92.735 Y122.562 E.31186
G1 X93.272 Y122.562 E.0166
G1 X99.865 Y129.155 E.28838
G1 X99.865 Y128.618 E.0166
G1 X93.808 Y122.562 E.2649
G1 X94.345 Y122.562 E.0166
G1 X99.865 Y128.081 E.24142
G1 X99.865 Y127.545 E.0166
G1 X94.882 Y122.562 E.21794
G1 X95.419 Y122.562 E.0166
G1 X99.865 Y127.008 E.19447
G1 X99.865 Y126.471 E.0166
G1 X95.956 Y122.562 E.17099
G1 X96.492 Y122.562 E.0166
G1 X99.865 Y125.934 E.14751
G1 X99.865 Y125.397 E.0166
G1 X96.993 Y122.525 E.12563
G1 X97.159 Y122.359 E.00729
G1 X97.159 Y122.285 E.00227
G1 X97.289 Y122.285 E.00403
G1 X99.865 Y124.861 E.11265
G1 X99.865 Y124.324 E.0166
G1 X97.826 Y122.285 E.08917
G1 X98.363 Y122.285 E.0166
G1 X99.865 Y123.787 E.06569
G1 X99.865 Y123.25 E.0166
G1 X98.9 Y122.285 E.04221
G1 X99.437 Y122.285 E.0166
G1 X100.034 Y122.883 E.02615
; WIPE_START
G1 X99.437 Y122.285 E-.32129
G1 X98.9 Y122.285 E-.20398
G1 X99.337 Y122.722 E-.23473
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.594 Y120.026 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279202
G1 F15000
M204 S6000
G1 X102.444 Y120.026 E.09338
G3 X102.621 Y120.037 I-.033 J1.966 E.00342
; LINE_WIDTH: 0.238616
G3 X102.768 Y120.057 I-.21 J2.095 E.00236
; LINE_WIDTH: 0.196735
G1 X103.055 Y120.113 E.00367
; WIPE_START
G1 X102.768 Y120.057 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.218 Y121.177 Z2.6 F42000
G1 X88.526 Y122.17 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X90.154 Y122.17 E.05401
G1 X91.873 Y120.451 E.08062
G1 X92.127 Y120.451 E.00843
G1 X93.846 Y122.17 E.08062
G1 X95.474 Y122.17 E.05401
; WIPE_START
G1 X93.846 Y122.17 E-.61876
G1 X93.583 Y121.907 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.406 Y120.025 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279332
G1 F15000
M204 S6000
G1 X81.552 Y120.026 E.09351
G2 X81.331 Y120.042 I.056 J2.268 E.00428
; LINE_WIDTH: 0.238554
G1 X81.273 Y120.05 E.00094
; LINE_WIDTH: 0.212979
G1 X80.943 Y120.108 E.00463
; WIPE_START
G1 X81.273 Y120.05 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.115 Y127.681 Z2.6 F42000
G1 X80.946 Y135.876 Z2.6
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.105144
G1 F15000
M204 S6000
G1 X81.699 Y136.094 E.00398
M204 S10000
G1 X81.341 Y135.959 F42000
; LINE_WIDTH: 0.231589
G1 F15000
M204 S6000
G1 X81.221 Y135.941 E.00187
; LINE_WIDTH: 0.205112
G1 X80.942 Y135.89 E.00375
M204 S10000
G1 X81.341 Y135.959 F42000
; LINE_WIDTH: 0.280259
G1 F15000
M204 S6000
G2 X81.613 Y135.975 I.297 J-2.78 E.00527
G1 X86.406 Y135.975 E.09269
; WIPE_START
G1 X84.406 Y135.975 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.899 Y134.523 Z2.6 F42000
G1 X95.474 Y133.83 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X93.846 Y133.83 E.05401
G1 X92.126 Y135.55 E.08066
G1 X91.874 Y135.55 E.00838
G1 X90.154 Y133.83 E.08066
G1 X88.526 Y133.83 E.05401
; WIPE_START
G1 X90.154 Y133.83 E-.61876
G1 X90.417 Y134.093 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.594 Y135.975 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279985
G1 F15000
M204 S6000
G1 X102.559 Y135.969 E.0959
; LINE_WIDTH: 0.245971
G2 X102.764 Y135.944 I-.159 J-2.17 E.00343
; LINE_WIDTH: 0.207694
G1 X103.056 Y135.891 E.00399
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X102.764 Y135.944 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 12/42
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z2.6 I.252 J1.191 P1  F42000
G1 X172.198 Y121.223 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X172.198 Y134.777 E.44962
G1 X175.397 Y134.777 E.1061
G3 X174.389 Y135.898 I-1.005 J.11 E.05641
G1 X153.615 Y135.898 E.68912
G3 X152.604 Y134.777 I.001 J-1.018 E.05642
G1 X155.802 Y134.777 E.1061
G1 X155.802 Y121.223 E.44962
G1 X152.603 Y121.223 E.1061
G3 X153.608 Y120.102 I1.005 J-.11 E.05631
G1 X174.44 Y120.104 E.69103
G3 X175.401 Y121.223 I-.046 J1.012 E.05483
G1 X172.258 Y121.223 E.10425
M204 S250
G1 X172.59 Y121.615 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X172.59 Y134.385 E.39239
G1 X173.302 Y134.385 E.02189
G1 X173.31 Y134.185 E.00615
G1 X173.69 Y134.185 E.01169
G1 X173.695 Y134.385 E.00615
G1 X174.502 Y134.385 E.02482
G1 X174.51 Y134.185 E.00615
G1 X174.89 Y134.185 E.01169
G1 X174.895 Y134.385 E.00615
G1 X175.789 Y134.385 E.0275
G3 X175.783 Y135.034 I-4.549 J.282 E.01996
G3 X174.396 Y136.29 I-1.386 J-.137 E.06305
G1 X153.605 Y136.29 E.63884
G3 X152.212 Y134.968 I-.001 J-1.395 E.06509
G1 X152.21 Y134.385 E.01793
G1 X153.102 Y134.385 E.02741
G1 X153.11 Y134.185 E.00615
G1 X153.49 Y134.185 E.01169
G1 X153.495 Y134.385 E.00615
G1 X154.305 Y134.385 E.02491
G1 X154.31 Y134.185 E.00614
G1 X154.69 Y134.186 E.01169
G1 X154.698 Y134.385 E.00613
G1 X155.41 Y134.385 E.02189
G1 X155.41 Y121.615 E.39239
G1 X154.697 Y121.615 E.02189
G1 X154.69 Y121.815 E.00615
G1 X154.31 Y121.815 E.01169
G1 X154.305 Y121.615 E.00615
G1 X153.497 Y121.615 E.02482
G1 X153.49 Y121.815 E.00615
G1 X153.11 Y121.815 E.01169
G1 X153.105 Y121.615 E.00615
G1 X152.21 Y121.615 E.02749
G3 X152.217 Y120.966 I4.545 J-.282 E.01996
G3 X153.603 Y119.71 I1.388 J.139 E.06299
G1 X174.452 Y119.711 E.64064
G3 X175.79 Y121.103 I-.052 J1.389 E.06556
G1 X175.79 Y121.615 E.01574
G1 X174.897 Y121.615 E.02742
G1 X174.89 Y121.815 E.00615
G1 X174.51 Y121.815 E.01169
G1 X174.505 Y121.615 E.00615
G1 X173.695 Y121.615 E.02491
G1 X173.69 Y121.815 E.00614
G1 X173.31 Y121.814 E.01169
G1 X173.302 Y121.615 E.00613
G1 X172.65 Y121.615 E.02005
; WIPE_START
M204 S6000
G1 X172.641 Y123.615 E-.76
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
G1 X171.224 Y133.658 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42246
G1 F9485.166
M204 S6000
G1 X171.865 Y133.017 E.02801
G1 X171.865 Y132.481 E.0166
G1 X170.857 Y133.488 E.04406
G1 X170.32 Y133.488 E.0166
G1 X171.865 Y131.944 E.06754
G1 X171.865 Y131.407 E.0166
G1 X169.784 Y133.488 E.09102
G1 X169.247 Y133.488 E.0166
G1 X171.865 Y130.87 E.11449
G1 X171.865 Y130.334 E.0166
G1 X168.71 Y133.488 E.13797
G1 X168.173 Y133.488 E.0166
G1 X171.865 Y129.797 E.16145
G1 X171.865 Y129.26 E.0166
G1 X167.637 Y133.488 E.18492
G1 X167.1 Y133.488 E.0166
G1 X171.865 Y128.723 E.2084
G1 X171.865 Y128.187 E.0166
G1 X166.563 Y133.488 E.23188
G1 X166.026 Y133.488 E.0166
G1 X171.865 Y127.65 E.25535
G1 X171.865 Y127.113 E.0166
G1 X165.49 Y133.488 E.27883
G1 X164.953 Y133.488 E.0166
G1 X171.865 Y126.576 E.30231
G1 X171.865 Y126.04 E.0166
G1 X164.416 Y133.488 E.32578
G1 X163.879 Y133.488 E.0166
G1 X171.865 Y125.503 E.34926
G1 X171.865 Y124.966 E.0166
G1 X163.343 Y133.488 E.37274
G1 X162.806 Y133.488 E.0166
G1 X171.865 Y124.429 E.39621
G1 X171.865 Y123.893 E.0166
G1 X162.269 Y133.488 E.41969
G1 X161.732 Y133.488 E.0166
G1 X171.865 Y123.356 E.44317
G1 X171.865 Y122.819 E.0166
G1 X161.196 Y133.488 E.46664
G1 X160.659 Y133.488 E.0166
G1 X171.635 Y122.512 E.48009
G1 X171.099 Y122.512 E.0166
G1 X160.122 Y133.488 E.48009
G1 X159.585 Y133.488 E.0166
G1 X170.562 Y122.512 E.48009
M73 P49 R12
G1 X170.025 Y122.512 E.0166
G1 X159.049 Y133.488 E.48009
G1 X158.512 Y133.488 E.0166
G1 X169.488 Y122.512 E.48009
G1 X168.952 Y122.512 E.0166
G1 X157.975 Y133.488 E.48009
G1 X157.438 Y133.488 E.0166
G1 X168.415 Y122.512 E.48009
G1 X167.878 Y122.512 E.0166
G1 X156.902 Y133.488 E.48009
G1 X156.365 Y133.488 E.0166
G1 X167.341 Y122.512 E.48009
G1 X166.805 Y122.512 E.0166
G1 X156.135 Y133.181 E.46665
G1 X156.135 Y132.644 E.0166
G1 X166.268 Y122.512 E.44318
G1 X165.731 Y122.512 E.0166
G1 X156.135 Y132.108 E.4197
G1 X156.135 Y131.571 E.0166
G1 X165.194 Y122.512 E.39622
G1 X164.658 Y122.512 E.0166
G1 X156.135 Y131.034 E.37275
G1 X156.135 Y130.497 E.0166
G1 X164.121 Y122.512 E.34927
G1 X163.584 Y122.512 E.0166
G1 X156.135 Y129.961 E.32579
G1 X156.135 Y129.424 E.0166
G1 X163.047 Y122.512 E.30232
G1 X162.511 Y122.512 E.0166
G1 X156.135 Y128.887 E.27884
G1 X156.135 Y128.35 E.0166
G1 X161.974 Y122.512 E.25536
G1 X161.437 Y122.512 E.0166
G1 X156.135 Y127.814 E.23189
G1 X156.135 Y127.277 E.0166
G1 X160.9 Y122.512 E.20841
G1 X160.364 Y122.512 E.0166
G1 X156.135 Y126.74 E.18493
G1 X156.135 Y126.203 E.0166
G1 X159.827 Y122.512 E.16146
G1 X159.29 Y122.512 E.0166
G1 X156.135 Y125.667 E.13798
G1 X156.135 Y125.13 E.0166
G1 X158.753 Y122.512 E.1145
G1 X158.216 Y122.512 E.0166
G1 X156.135 Y124.593 E.09103
G1 X156.135 Y124.056 E.0166
G1 X157.68 Y122.512 E.06755
G1 X157.143 Y122.512 E.0166
G1 X156.135 Y123.52 E.04407
G1 X156.135 Y122.983 E.0166
G1 X156.776 Y122.342 E.02802
; WIPE_START
G1 X156.135 Y122.983 E-.34426
G1 X156.135 Y123.52 E-.20397
G1 X156.529 Y123.125 E-.21177
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.145 Y120.875 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X155.773 Y120.875 E.05401
G1 X156.198 Y120.45 E.0199
G1 X156.451 Y120.451 E.00839
G1 X158.12 Y122.12 E.0783
G1 X162.204 Y122.12 E.1355
G1 X163.873 Y120.451 E.07828
G1 X164.127 Y120.451 E.00843
G1 X165.796 Y122.12 E.07828
G1 X169.88 Y122.12 E.1355
G1 X171.548 Y120.452 E.07825
G1 X171.803 Y120.452 E.00846
G1 X172.227 Y120.875 E.01985
G1 X173.855 Y120.875 E.05401
; WIPE_START
G1 X172.227 Y120.875 E-.61876
G1 X171.964 Y120.612 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X172.95 Y128.18 Z2.8 F42000
G1 X173.855 Y135.125 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X172.227 Y135.125 E.05401
G1 X171.802 Y135.55 E.01991
G1 X171.55 Y135.55 E.00838
G1 X169.88 Y133.88 E.07831
G1 X165.796 Y133.88 E.1355
G1 X164.126 Y135.55 E.07831
G1 X163.874 Y135.55 E.00838
G1 X162.204 Y133.88 E.07831
G1 X158.12 Y133.88 E.1355
G1 X156.45 Y135.55 E.07831
G1 X156.198 Y135.55 E.00838
G1 X155.773 Y135.125 E.01991
G1 X154.145 Y135.125 E.05401
; OBJECT_ID: 405
; WIPE_START
G1 X155.773 Y135.125 E-.61876
G1 X156.036 Y135.388 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X148.924 Y132.618 Z2.8 F42000
G1 X119.802 Y121.273 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X116.602 Y121.273 E.10615
G3 X117.55 Y120.104 I1.015 J-.146 E.05605
G1 X136.198 Y120.102 E.61859
G1 X136.198 Y134.727 E.48514
G1 X139.398 Y134.727 E.10615
G3 X138.45 Y135.896 I-1.01 J.15 E.05613
G1 X119.802 Y135.898 E.61859
G1 X119.802 Y121.333 E.48315
M204 S250
G1 X119.41 Y121.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X116.21 Y121.665 E.09833
G3 X116.252 Y120.762 I3.689 J-.281 E.02784
G3 X117.531 Y119.712 I1.36 J.352 E.05439
G1 X136.59 Y119.71 E.58562
G1 X136.59 Y134.335 E.44939
G1 X139.79 Y134.335 E.09833
G3 X139.73 Y135.304 I-3.323 J.28 E.02993
G3 X138.469 Y136.288 I-1.343 J-.42 E.05229
G1 X119.41 Y136.29 E.58562
G1 X119.41 Y121.725 E.44754
; WIPE_START
M204 S6000
G1 X117.41 Y121.688 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.774 Y122.367 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42177
G1 F9502.441
M204 S6000
G1 X120.135 Y123.006 E.02789
G1 X120.135 Y123.542 E.01654
G1 X121.14 Y122.537 E.04388
G1 X121.676 Y122.537 E.01654
G1 X120.135 Y124.078 E.06727
G1 X120.135 Y124.613 E.01654
G1 X122.212 Y122.537 E.09066
G1 X122.748 Y122.537 E.01654
G1 X120.135 Y125.149 E.11405
G1 X120.135 Y125.685 E.01654
G1 X123.283 Y122.537 E.13744
G1 X123.819 Y122.537 E.01654
G1 X120.135 Y126.221 E.16083
G1 X120.135 Y126.757 E.01654
G1 X124.355 Y122.537 E.18423
G1 X124.891 Y122.537 E.01654
G1 X120.135 Y127.292 E.20762
G1 X120.135 Y127.828 E.01654
G1 X125.427 Y122.537 E.23101
G1 X125.962 Y122.537 E.01654
G1 X120.135 Y128.364 E.2544
G1 X120.135 Y128.9 E.01654
G1 X126.498 Y122.537 E.27779
G1 X127.034 Y122.537 E.01654
G1 X120.135 Y129.435 E.30118
G1 X120.135 Y129.971 E.01654
G1 X127.57 Y122.537 E.32457
G1 X128.105 Y122.537 E.01654
G1 X120.135 Y130.507 E.34796
G1 X120.135 Y131.043 E.01654
G1 X128.641 Y122.537 E.37136
G1 X129.177 Y122.537 E.01654
G1 X120.135 Y131.578 E.39475
G1 X120.135 Y132.114 E.01654
G1 X131.814 Y120.436 E.50987
G1 X132.35 Y120.436 E.01654
G1 X120.135 Y132.65 E.53326
G1 X120.135 Y133.186 E.01654
G1 X132.885 Y120.436 E.55665
G1 X133.421 Y120.436 E.01654
G1 X120.135 Y133.722 E.58005
G1 X120.135 Y134.257 E.01654
G1 X133.957 Y120.436 E.60344
G1 X134.493 Y120.436 E.01654
G1 X120.135 Y134.793 E.62684
G1 X120.135 Y135.329 E.01654
G1 X135.029 Y120.435 E.65023
G1 X135.565 Y120.435 E.01654
G1 X120.435 Y135.565 E.66052
G1 X120.971 Y135.564 E.01654
G1 X135.865 Y120.671 E.65023
G1 X135.865 Y121.207 E.01654
G1 X121.507 Y135.564 E.62684
G1 X122.043 Y135.564 E.01654
G1 X135.865 Y121.743 E.60344
G1 X135.865 Y122.278 E.01654
G1 X122.579 Y135.564 E.58005
G1 X123.115 Y135.564 E.01654
G1 X135.865 Y122.814 E.55665
G1 X135.865 Y123.35 E.01654
G1 X123.481 Y135.734 E.54067
M204 S10000
G1 X126.483 Y134.875 F42000
G1 F9502.441
M204 S6000
G1 X125.794 Y135.564 E.03008
G1 X125.258 Y135.564 E.01654
G1 X126.313 Y134.509 E.04607
G1 X126.313 Y133.973 E.01654
G1 X124.722 Y135.564 E.06946
G1 X124.186 Y135.564 E.01654
G1 X135.865 Y123.886 E.50987
G1 X135.865 Y124.422 E.01654
G1 X126.823 Y133.463 E.39475
G1 X127.359 Y133.463 E.01654
G1 X135.865 Y124.957 E.37136
G1 X135.865 Y125.493 E.01654
G1 X127.895 Y133.463 E.34796
G1 X128.43 Y133.463 E.01654
G1 X135.865 Y126.029 E.32457
G1 X135.865 Y126.565 E.01654
G1 X128.966 Y133.463 E.30118
G1 X129.502 Y133.463 E.01654
G1 X135.865 Y127.1 E.27779
G1 X135.865 Y127.636 E.01654
G1 X130.038 Y133.463 E.2544
G1 X130.573 Y133.463 E.01654
G1 X135.865 Y128.172 E.23101
G1 X135.865 Y128.708 E.01654
G1 X131.109 Y133.463 E.20762
G1 X131.645 Y133.463 E.01654
G1 X135.865 Y129.243 E.18423
G1 X135.865 Y129.779 E.01654
G1 X132.181 Y133.463 E.16083
G1 X132.717 Y133.463 E.01654
G1 X135.865 Y130.315 E.13744
G1 X135.865 Y130.851 E.01654
G1 X133.252 Y133.463 E.11405
G1 X133.788 Y133.463 E.01654
G1 X135.865 Y131.387 E.09066
G1 X135.865 Y131.922 E.01654
G1 X134.324 Y133.463 E.06727
G1 X134.86 Y133.463 E.01654
G1 X135.865 Y132.458 E.04388
G1 X135.865 Y132.994 E.01654
G1 X135.226 Y133.633 E.02789
; WIPE_START
G1 X135.865 Y132.994 E-.34335
G1 X135.865 Y132.458 E-.20359
G1 X135.468 Y132.855 E-.21306
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.905 Y135.075 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X136.277 Y135.075 E.05401
G1 X135.804 Y135.548 E.02217
G1 X135.548 Y135.548 E.00849
G1 X133.855 Y133.855 E.07941
G1 X129.821 Y133.855 E.13384
G1 X128.127 Y135.549 E.07944
G1 X127.873 Y135.549 E.00844
G1 X126.705 Y134.381 E.05477
G1 X126.705 Y133.855 E.01745
G1 X127.808 Y133.855 E.03657
M204 S10000
G1 X129.517 Y122.197 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42177
G1 F9502.441
M204 S6000
G1 X131.278 Y120.436 E.07687
G1 X130.742 Y120.436 E.01654
G1 X129.687 Y121.491 E.04607
G1 X129.687 Y120.955 E.01654
G1 X130.376 Y120.266 E.03009
M204 S10000
G1 X118.095 Y120.925 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X119.723 Y120.925 E.05401
G1 X120.196 Y120.452 E.02217
G1 X120.452 Y120.452 E.00849
G1 X122.145 Y122.145 E.07941
G1 X126.179 Y122.145 E.13384
G1 X127.873 Y120.451 E.07944
G1 X128.127 Y120.451 E.00844
G1 X129.295 Y121.619 E.05477
G1 X129.295 Y122.145 E.01745
G1 X128.192 Y122.145 E.03657
; OBJECT_ID: 394
; WIPE_START
G1 X129.295 Y122.145 E-.4189
G1 X129.295 Y121.619 E-.19987
G1 X129.032 Y121.356 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X121.992 Y124.304 Z2.8 F42000
G1 X97.79 Y134.44 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X103.41 Y134.44 E.17269
G1 X103.41 Y135.66 E.03749
G1 X97.79 Y135.66 E.17269
G1 X97.79 Y134.5 E.03564
; WIPE_START
M204 S6000
G1 X99.79 Y134.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.622 Y126.936 Z2.8 F42000
G1 X97.79 Y121.56 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X97.79 Y120.34 E.03749
G1 X103.41 Y120.34 E.17269
G1 X103.41 Y121.56 E.03749
G1 X97.85 Y121.56 E.17084
M204 S10000
G1 X97.398 Y121.56 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.398 Y121.952 E.01301
G1 X100.198 Y121.952 E.09288
G1 X100.198 Y134.048 E.40124
G1 X97.398 Y134.048 E.09288
G1 X97.398 Y135.898 E.06137
G1 X86.602 Y135.898 E.35812
G1 X86.602 Y134.048 E.06137
G1 X83.802 Y134.048 E.09288
G1 X83.802 Y121.952 E.40124
G1 X86.602 Y121.952 E.09288
G1 X86.602 Y120.102 E.06136
G1 X97.398 Y120.103 E.35812
G1 X97.398 Y121.5 E.04634
; WIPE_START
G1 X97.398 Y121.952 E-.17179
G1 X98.946 Y121.952 E-.58821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.317 Y121.717 Z2.8 F42000
G1 X86.21 Y121.56 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X80.59 Y121.56 E.17269
G1 X80.59 Y120.34 E.03749
G1 X86.21 Y120.34 E.17269
G1 X86.21 Y121.5 E.03564
; WIPE_START
M204 S6000
G1 X84.21 Y121.521 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.378 Y129.064 Z2.8 F42000
G1 X86.21 Y134.44 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X86.21 Y135.66 E.03749
G1 X80.59 Y135.66 E.17269
G1 X80.59 Y134.44 E.03749
G1 X86.15 Y134.44 E.17084
; WIPE_START
M204 S6000
G1 X86.21 Y135.66 E-.46416
G1 X85.431 Y135.66 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.41 Y134.31 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
M73 P50 R12
G1 F9547.055
M204 S5000
G1 X83.41 Y121.69 E.38778
G1 X80.44 Y121.69 E.09126
G1 X80.44 Y122.165 E.0146
G1 X80.21 Y122.165 E.00706
G1 X80.212 Y121.032 E.03482
G3 X81.603 Y119.71 I1.398 J.078 E.06496
G1 X102.452 Y119.711 E.64064
G3 X103.79 Y121.105 I-.054 J1.391 E.06562
G1 X103.79 Y122.165 E.03256
G1 X103.56 Y122.165 E.00707
G1 X103.56 Y121.69 E.0146
G1 X100.59 Y121.69 E.09126
G1 X100.59 Y134.31 E.38778
G1 X103.56 Y134.31 E.09126
G1 X103.56 Y133.835 E.0146
G1 X103.79 Y133.835 E.00706
G1 X103.788 Y134.968 E.03482
G3 X102.396 Y136.29 I-1.398 J-.078 E.06499
G1 X81.605 Y136.29 E.63884
G3 X80.21 Y134.896 I.012 J-1.407 E.06715
G1 X80.21 Y133.835 E.03261
G1 X80.44 Y133.835 E.00707
G1 X80.44 Y134.31 E.0146
G1 X83.35 Y134.31 E.08942
; WIPE_START
M204 S6000
G1 X83.36 Y132.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.699 Y136.094 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.105193
G1 F15000
M204 S6000
G1 X80.946 Y135.876 E.00398
M204 S10000
G1 X80.942 Y135.889 F42000
; LINE_WIDTH: 0.205145
G1 F15000
M204 S6000
G1 X81.221 Y135.941 E.00375
; LINE_WIDTH: 0.231214
G1 X81.339 Y135.959 E.00182
; LINE_WIDTH: 0.280244
G2 X81.613 Y135.975 I.291 J-2.606 E.00532
G1 X86.406 Y135.975 E.09268
; WIPE_START
G1 X84.406 Y135.975 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.526 Y133.83 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X90.154 Y133.83 E.05401
G1 X91.874 Y135.55 E.08066
G1 X92.126 Y135.55 E.00838
G1 X93.846 Y133.83 E.08066
G1 X95.474 Y133.83 E.05401
; WIPE_START
G1 X93.846 Y133.83 E-.61876
G1 X93.583 Y134.093 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.594 Y135.975 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280702
G1 F15000
M204 S6000
G1 X102.391 Y135.975 E.09294
G2 X102.558 Y135.969 I-.007 J-2.478 E.00324
; LINE_WIDTH: 0.24627
G2 X102.763 Y135.944 I-.16 J-2.175 E.00342
; LINE_WIDTH: 0.20797
G1 X103.056 Y135.891 E.00401
; WIPE_START
G1 X102.763 Y135.944 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.267 Y133.884 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42248
G1 F9484.667
M204 S6000
G1 X99.865 Y133.286 E.02615
G1 X99.865 Y132.75 E.0166
G1 X98.9 Y133.715 E.04221
G1 X98.363 Y133.715 E.0166
G1 X99.865 Y132.213 E.06569
G1 X99.865 Y131.676 E.0166
G1 X97.826 Y133.715 E.08917
G1 X97.289 Y133.715 E.0166
G1 X99.865 Y131.139 E.11265
G1 X99.865 Y130.603 E.0166
G1 X96.993 Y133.475 E.12563
G1 X96.956 Y133.438 E.0016
G1 X96.492 Y133.438 E.01434
G1 X99.865 Y130.066 E.14751
G1 X99.865 Y129.529 E.0166
G1 X95.956 Y133.438 E.17099
G1 X95.419 Y133.438 E.0166
G1 X99.865 Y128.992 E.19447
G1 X99.865 Y128.455 E.0166
G1 X94.882 Y133.438 E.21794
G1 X94.345 Y133.438 E.0166
G1 X99.865 Y127.919 E.24142
G1 X99.865 Y127.382 E.0166
G1 X93.808 Y133.438 E.2649
G1 X93.272 Y133.438 E.0166
G1 X99.865 Y126.845 E.28838
G1 X99.865 Y126.308 E.0166
G1 X92.735 Y133.438 E.31186
G1 X92.198 Y133.438 E.0166
G1 X99.865 Y125.772 E.33534
G1 X99.865 Y125.235 E.0166
G1 X91.661 Y133.438 E.35882
G1 X91.125 Y133.438 E.0166
G1 X99.865 Y124.698 E.3823
G1 X99.865 Y124.161 E.0166
G1 X90.588 Y133.438 E.40578
G1 X90.051 Y133.438 E.0166
G1 X99.865 Y123.624 E.42926
G1 X99.865 Y123.088 E.0166
G1 X89.514 Y133.438 E.45274
G1 X88.977 Y133.438 E.0166
G1 X99.865 Y122.551 E.47621
G1 X99.865 Y122.285 E.00821
G1 X99.594 Y122.285 E.00839
G1 X88.441 Y133.438 E.48783
G1 X87.904 Y133.438 E.0166
G1 X99.057 Y122.285 E.48783
G1 X98.52 Y122.285 E.0166
G1 X87.367 Y133.438 E.48783
G1 X87.044 Y133.438 E.00999
G1 X86.841 Y133.641 E.00889
G1 X86.841 Y133.715 E.00227
G1 X86.554 Y133.715 E.00888
G1 X97.983 Y122.285 E.49993
G1 X97.446 Y122.285 E.0166
G1 X86.017 Y133.715 E.49993
G1 X85.48 Y133.715 E.0166
G1 X96.633 Y122.562 E.48783
G1 X96.096 Y122.562 E.0166
G1 X84.943 Y133.715 E.48783
G1 X84.407 Y133.715 E.0166
G1 X95.56 Y122.562 E.48783
G1 X95.023 Y122.562 E.0166
G1 X84.135 Y133.449 E.47622
G1 X84.135 Y132.912 E.0166
G1 X94.486 Y122.562 E.45274
G1 X93.949 Y122.562 E.0166
G1 X84.135 Y132.376 E.42927
G1 X84.135 Y131.839 E.0166
G1 X93.412 Y122.562 E.40579
G1 X92.876 Y122.562 E.0166
G1 X84.135 Y131.302 E.38231
G1 X84.135 Y130.765 E.0166
G1 X92.339 Y122.562 E.35883
G1 X91.802 Y122.562 E.0166
G1 X84.135 Y130.229 E.33535
G1 X84.135 Y129.692 E.0166
G1 X91.265 Y122.562 E.31187
G1 X90.729 Y122.562 E.0166
G1 X84.135 Y129.155 E.28839
G1 X84.135 Y128.618 E.0166
G1 X90.192 Y122.562 E.26491
G1 X89.655 Y122.562 E.0166
G1 X84.135 Y128.081 E.24143
G1 X84.135 Y127.545 E.0166
G1 X89.118 Y122.562 E.21795
G1 X88.581 Y122.562 E.0166
G1 X84.135 Y127.008 E.19447
G1 X84.135 Y126.471 E.0166
G1 X88.045 Y122.562 E.171
G1 X87.508 Y122.562 E.0166
G1 X84.135 Y125.934 E.14752
G1 X84.135 Y125.398 E.0166
G1 X87.008 Y122.525 E.12563
G1 X86.841 Y122.359 E.00729
G1 X86.841 Y122.285 E.00227
G1 X86.711 Y122.285 E.00402
G1 X84.135 Y124.861 E.11265
G1 X84.135 Y124.324 E.0166
G1 X86.174 Y122.285 E.08917
G1 X85.637 Y122.285 E.0166
G1 X84.135 Y123.787 E.0657
G1 X84.135 Y123.25 E.0166
G1 X85.1 Y122.285 E.04222
G1 X84.564 Y122.285 E.0166
G1 X83.966 Y122.883 E.02616
; WIPE_START
G1 X84.564 Y122.285 E-.3214
G1 X85.1 Y122.285 E-.20398
G1 X84.664 Y122.722 E-.23463
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.406 Y120.025 Z2.8 F42000
G1 Z2.4
M73 P50 R11
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279345
G1 F15000
M204 S6000
G1 X81.552 Y120.026 E.09351
G2 X81.331 Y120.042 I.056 J2.262 E.00427
; LINE_WIDTH: 0.238354
G1 X81.271 Y120.05 E.00097
; LINE_WIDTH: 0.212726
G1 X80.943 Y120.108 E.00461
; WIPE_START
G1 X81.271 Y120.05 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.82 Y121.177 Z2.8 F42000
G1 X95.474 Y122.17 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X93.846 Y122.17 E.05401
G1 X92.127 Y120.451 E.08062
G1 X91.873 Y120.451 E.00843
G1 X90.154 Y122.17 E.08063
G1 X88.526 Y122.17 E.05401
; WIPE_START
G1 X90.154 Y122.17 E-.61876
G1 X90.417 Y121.907 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.594 Y120.026 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.278651
G1 F15000
M204 S6000
G1 X102.44 Y120.026 E.09309
G3 X102.713 Y120.048 I-.081 J2.682 E.00525
; LINE_WIDTH: 0.214538
G1 X103.057 Y120.108 E.00489
M204 S10000
G1 X103.052 Y120.125 F42000
; LINE_WIDTH: 0.106537
G1 F15000
M204 S6000
G1 X102.335 Y119.907 E.00388
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X103.052 Y120.125 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 13/42
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z2.8 I-.019 J1.217 P1  F42000
G1 X172.198 Y121.223 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X172.198 Y122.547 E.04393
G1 X164.122 Y122.547 E.26789
G1 X164.122 Y133.453 E.36176
G1 X172.198 Y133.453 E.26789
G1 X172.198 Y134.777 E.04393
G1 X175.397 Y134.777 E.1061
G3 X174.389 Y135.898 I-1.005 J.11 E.05641
G1 X153.615 Y135.898 E.68912
G3 X152.604 Y134.777 I-.007 J-1.011 E.05655
G1 X155.802 Y134.777 E.1061
G1 X155.802 Y133.453 E.04393
G1 X163.878 Y133.453 E.26789
G1 X163.878 Y122.547 E.36176
G1 X155.802 Y122.547 E.26789
G1 X155.802 Y121.223 E.04393
G1 X152.603 Y121.223 E.1061
G3 X153.611 Y120.102 I1.005 J-.11 E.05641
G1 X174.438 Y120.103 E.69086
G3 X175.403 Y121.223 I-.044 J1.014 E.05493
G1 X172.258 Y121.223 E.10434
M204 S250
G1 X172.59 Y121.615 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X172.59 Y134.385 E.39239
G1 X173.302 Y134.385 E.02189
G1 X173.31 Y134.185 E.00615
G1 X173.69 Y134.185 E.01169
G1 X173.695 Y134.385 E.00615
G1 X174.502 Y134.385 E.02482
G1 X174.51 Y134.185 E.00615
G1 X174.89 Y134.185 E.01169
G1 X174.895 Y134.385 E.00615
G1 X175.79 Y134.385 E.0275
G3 X175.783 Y135.034 I-4.55 J.282 E.01997
G3 X174.396 Y136.29 I-1.386 J-.137 E.06306
G1 X153.605 Y136.29 E.63883
G3 X152.212 Y134.968 I.012 J-1.408 E.06494
G1 X152.21 Y134.385 E.01793
G1 X153.102 Y134.385 E.02741
G1 X153.11 Y134.185 E.00615
G1 X153.49 Y134.185 E.01169
G1 X153.495 Y134.385 E.00615
G1 X154.305 Y134.385 E.02491
G1 X154.31 Y134.185 E.00614
G1 X154.69 Y134.186 E.01169
G1 X154.698 Y134.385 E.00613
G1 X155.41 Y134.385 E.02189
G1 X155.41 Y121.615 E.39239
G1 X154.698 Y121.615 E.02189
G1 X154.69 Y121.815 E.00615
G1 X154.31 Y121.815 E.01169
G1 X154.305 Y121.615 E.00615
G1 X153.498 Y121.615 E.02482
G1 X153.49 Y121.815 E.00615
G1 X153.11 Y121.815 E.01169
G1 X153.105 Y121.615 E.00615
G1 X152.21 Y121.615 E.0275
G3 X152.217 Y120.966 I4.546 J-.282 E.01997
G3 X153.604 Y119.71 I1.388 J.14 E.06303
G1 X174.45 Y119.711 E.64054
G3 X175.79 Y121.105 I-.05 J1.389 E.0657
G1 X175.79 Y121.615 E.01566
G1 X174.898 Y121.615 E.02742
G1 X174.89 Y121.815 E.00615
G1 X174.51 Y121.815 E.01169
G1 X174.505 Y121.615 E.00615
G1 X173.695 Y121.615 E.02491
G1 X173.69 Y121.815 E.00614
G1 X173.31 Y121.814 E.01169
G1 X173.303 Y121.615 E.00613
G1 X172.65 Y121.615 E.02005
; WIPE_START
M204 S6000
G1 X172.641 Y123.615 E-.76
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
G1 X171.882 Y122.817 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Top surface
G1 F9547.055
M204 S2000
G1 X172.383 Y123.318 E.02177
G1 X172.383 Y123.851
G1 X171.349 Y122.818 E.0449
G1 X170.816 Y122.818
G1 X172.383 Y124.384 E.06807
G1 X172.383 Y124.918
G1 X170.283 Y122.818 E.09125
G1 X169.75 Y122.818
G1 X172.383 Y125.451 E.11442
G1 X172.383 Y125.984
G1 X169.216 Y122.818 E.13759
G1 X168.683 Y122.818
G1 X172.383 Y126.517 E.16076
G1 X172.383 Y127.051
G1 X168.15 Y122.818 E.18394
G1 X167.617 Y122.818
G1 X172.383 Y127.584 E.20711
G1 X172.383 Y128.117
G1 X167.083 Y122.818 E.23028
G1 X166.55 Y122.818
G1 X172.383 Y128.65 E.25345
G1 X172.383 Y129.184
G1 X166.017 Y122.818 E.27663
G1 X165.484 Y122.818
G1 X172.383 Y129.717 E.2998
G1 X172.383 Y130.25
G1 X164.95 Y122.818 E.32297
G1 X164.46 Y122.861
G1 X172.383 Y130.783 E.34426
G1 X172.383 Y131.317
G1 X164.393 Y123.327 E.34719
G1 X164.393 Y123.86
G1 X172.383 Y131.85 E.34719
G1 X172.383 Y132.383
G1 X164.393 Y124.394 E.34719
G1 X164.393 Y124.927
G1 X172.383 Y132.917 E.34719
G1 X172.163 Y133.23
G1 X164.393 Y125.46 E.33765
G1 X164.393 Y125.993
G1 X171.582 Y133.182 E.31239
G1 X171.048 Y133.182
G1 X164.393 Y126.527 E.28922
G1 X164.393 Y127.06
G1 X170.515 Y133.182 E.26604
G1 X169.982 Y133.182
G1 X164.393 Y127.593 E.24287
G1 X164.393 Y128.126
G1 X169.449 Y133.182 E.2197
G1 X168.915 Y133.182
G1 X164.393 Y128.66 E.19653
M73 P51 R11
G1 X164.393 Y129.193
G1 X168.382 Y133.182 E.17335
G1 X167.849 Y133.182
G1 X164.393 Y129.726 E.15018
G1 X164.393 Y130.259
G1 X167.316 Y133.182 E.12701
G1 X166.782 Y133.182
G1 X164.393 Y130.793 E.10384
G1 X164.393 Y131.326
G1 X166.249 Y133.182 E.08066
G1 X165.716 Y133.182
G1 X164.393 Y131.859 E.05749
G1 X164.393 Y132.392
G1 X165.183 Y133.182 E.03432
M204 S10000
G1 X164.411 Y133.148 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F10588.235
M204 S6000
G1 X164.347 Y133.185 E.00204
G1 X164.396 Y133.213 E.00155
M204 S10000
G1 X164.411 Y122.778 F42000
G1 F10588.235
M204 S6000
G1 X164.347 Y122.815 E.00204
G1 X164.396 Y122.843 E.00155
; WIPE_START
G1 X164.347 Y122.815 E-.32874
G1 X164.411 Y122.778 E-.43126
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X162.817 Y122.818 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S2000
G1 X163.607 Y123.608 E.03432
G1 X163.607 Y124.141
G1 X162.284 Y122.818 E.0575
G1 X161.751 Y122.818
G1 X163.607 Y124.674 E.08067
G1 X163.607 Y125.208
G1 X161.217 Y122.818 E.10384
G1 X160.684 Y122.818
G1 X163.607 Y125.741 E.12701
G1 X163.607 Y126.274
G1 X160.151 Y122.818 E.15019
G1 X159.618 Y122.818
G1 X163.607 Y126.807 E.17336
G1 X163.607 Y127.341
G1 X159.084 Y122.818 E.19653
G1 X158.551 Y122.818
G1 X163.607 Y127.874 E.21971
G1 X163.607 Y128.407
G1 X158.018 Y122.818 E.24288
G1 X157.485 Y122.818
G1 X163.607 Y128.94 E.26605
G1 X163.607 Y129.474
G1 X156.951 Y122.818 E.28922
G1 X156.418 Y122.818
G1 X163.607 Y130.007 E.3124
G1 X163.607 Y130.54
G1 X155.837 Y122.77 E.33766
G1 X155.617 Y123.084
G1 X163.607 Y131.073 E.34719
G1 X163.607 Y131.607
G1 X155.617 Y123.617 E.34719
G1 X155.617 Y124.15
G1 X163.607 Y132.14 E.34719
G1 X163.607 Y132.673
G1 X155.617 Y124.683 E.34719
G1 X155.617 Y125.217
G1 X163.54 Y133.139 E.34426
G1 X163.05 Y133.182
G1 X155.617 Y125.75 E.32297
G1 X155.617 Y126.283
G1 X162.516 Y133.182 E.29979
G1 X161.983 Y133.182
G1 X155.617 Y126.816 E.27662
G1 X155.617 Y127.35
G1 X161.45 Y133.182 E.25345
G1 X160.917 Y133.182
G1 X155.617 Y127.883 E.23028
G1 X155.617 Y128.416
G1 X160.383 Y133.182 E.2071
G1 X159.85 Y133.182
G1 X155.617 Y128.949 E.18393
G1 X155.617 Y129.483
G1 X159.317 Y133.182 E.16076
G1 X158.784 Y133.182
G1 X155.617 Y130.016 E.13759
G1 X155.617 Y130.549
G1 X158.25 Y133.182 E.11441
G1 X157.717 Y133.182
G1 X155.617 Y131.082 E.09124
G1 X155.617 Y131.616
G1 X157.184 Y133.182 E.06807
G1 X156.651 Y133.182
G1 X155.617 Y132.149 E.04489
G1 X155.617 Y132.682
G1 X156.118 Y133.183 E.02177
; WIPE_START
M204 S6000
G1 X155.617 Y132.682 E-.26917
G1 X155.617 Y132.149 E-.20264
G1 X156.154 Y132.685 E-.28819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.145 Y135.125 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X155.773 Y135.125 E.05401
G1 X156.198 Y135.55 E.01991
G1 X156.45 Y135.55 E.00838
G1 X158.199 Y133.801 E.08203
G1 X162.125 Y133.801 E.13024
G1 X163.874 Y135.55 E.08203
G1 X164.126 Y135.55 E.00838
G1 X165.875 Y133.801 E.08203
G1 X169.801 Y133.801 E.13024
G1 X171.55 Y135.55 E.08203
G1 X171.802 Y135.55 E.00838
G1 X172.227 Y135.125 E.01991
G1 X173.855 Y135.125 E.05401
; WIPE_START
G1 X172.227 Y135.125 E-.61876
G1 X171.964 Y135.388 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X164.593 Y133.407 Z3 F42000
G1 X163.631 Y133.148 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F10588.235
M204 S6000
G1 X163.568 Y133.185 E.00204
G1 X163.616 Y133.213 E.00155
M204 S10000
G1 X163.631 Y122.778 F42000
G1 F10588.235
M204 S6000
G1 X163.568 Y122.815 E.00204
G1 X163.616 Y122.843 E.00155
; WIPE_START
G1 X163.568 Y122.815 E-.32877
G1 X163.631 Y122.778 E-.43123
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X171.135 Y121.381 Z3 F42000
G1 X173.855 Y120.875 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X172.227 Y120.875 E.05401
G1 X171.803 Y120.452 E.01985
G1 X171.548 Y120.452 E.00846
G1 X169.801 Y122.199 E.08198
G1 X165.875 Y122.199 E.13024
G1 X164.127 Y120.451 E.082
G1 X163.873 Y120.451 E.00842
G1 X162.125 Y122.199 E.082
G1 X158.199 Y122.199 E.13024
G1 X156.451 Y120.451 E.08202
G1 X156.198 Y120.45 E.00839
G1 X155.773 Y120.875 E.0199
G1 X154.145 Y120.875 E.05401
; OBJECT_ID: 405
; WIPE_START
G1 X155.773 Y120.875 E-.61876
G1 X156.036 Y120.612 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X148.405 Y120.751 Z3 F42000
G1 X119.802 Y121.273 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X116.602 Y121.273 E.10615
G3 X117.544 Y120.104 I1.012 J-.149 E.0559
G1 X129.722 Y120.103 E.40399
G1 X129.722 Y122.572 E.08192
G1 X128.122 Y122.572 E.05307
G1 X128.122 Y133.428 E.3601
G1 X136.198 Y133.428 E.26789
G1 X136.198 Y134.727 E.0431
G1 X139.398 Y134.727 E.10615
G3 X138.456 Y135.896 I-1.015 J.146 E.05587
G1 X126.278 Y135.897 E.40398
G1 X126.278 Y133.428 E.08192
G1 X127.878 Y133.428 E.05307
G1 X127.878 Y122.572 E.3601
G1 X119.802 Y122.572 E.26789
G1 X119.802 Y121.333 E.04111
M204 S250
G1 X119.41 Y121.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X116.21 Y121.665 E.09833
G3 X116.269 Y120.699 I3.321 J-.281 E.02986
G3 X117.529 Y119.712 I1.344 J.418 E.0523
G1 X136.59 Y119.71 E.58569
G1 X136.59 Y134.335 E.44939
G1 X139.79 Y134.335 E.09833
G3 X139.73 Y135.304 I-3.324 J.28 E.02993
G3 X138.471 Y136.288 I-1.343 J-.42 E.05223
G1 X119.41 Y136.29 E.58568
G1 X119.41 Y121.725 E.44754
; WIPE_START
M204 S6000
G1 X117.41 Y121.688 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.986 Y122.616 Z3 F42000
G1 X126.842 Y122.843 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Top surface
G1 F9547.055
M204 S2000
G1 X127.607 Y123.608 E.03324
G1 X127.607 Y124.141
G1 X126.309 Y122.843 E.05641
G1 X125.776 Y122.843
G1 X127.607 Y124.674 E.07958
G1 X127.607 Y125.208
G1 X125.242 Y122.843 E.10276
G1 X124.709 Y122.843
G1 X127.607 Y125.741 E.12593
G1 X127.607 Y126.274
G1 X124.176 Y122.843 E.1491
G1 X123.643 Y122.843
G1 X127.607 Y126.807 E.17227
G1 X127.607 Y127.341
G1 X123.109 Y122.843 E.19545
G1 X122.576 Y122.843
G1 X127.607 Y127.874 E.21862
G1 X127.607 Y128.407
G1 X122.043 Y122.843 E.24179
G1 X121.51 Y122.843
G1 X127.607 Y128.94 E.26496
G1 X127.607 Y129.474
G1 X120.976 Y122.843 E.28814
G1 X120.443 Y122.843
G1 X127.607 Y130.007 E.31131
G1 X127.607 Y130.54
G1 X119.862 Y122.795 E.33657
G1 X119.617 Y123.084
G1 X127.607 Y131.073 E.34719
G1 X127.607 Y131.607
G1 X119.617 Y123.617 E.34719
G1 X119.617 Y124.15
G1 X127.607 Y132.14 E.34719
G1 X127.607 Y132.673
G1 X119.617 Y124.683 E.34719
G1 X119.617 Y125.217
G1 X127.527 Y133.126 E.34372
G1 X127.025 Y133.157
G1 X119.617 Y125.75 E.32188
G1 X119.617 Y126.283
G1 X126.491 Y133.157 E.29871
G1 X126.035 Y133.234
G1 X119.617 Y126.816 E.27886
G1 X119.617 Y127.35
G1 X126.007 Y133.739 E.27767
G1 X126.007 Y134.273
G1 X119.617 Y127.883 E.27766
G1 X119.617 Y128.416
G1 X126.007 Y134.806 E.27766
G1 X126.007 Y135.339
G1 X119.617 Y128.949 E.27767
G1 X119.617 Y129.483
G1 X126.055 Y135.921 E.27976
G1 X125.683 Y136.082
G1 X119.617 Y130.016 E.2636
G1 X119.617 Y130.549
G1 X125.15 Y136.082 E.24043
G1 X124.617 Y136.082
G1 X119.617 Y131.082 E.21726
G1 X119.617 Y131.616
G1 X124.084 Y136.082 E.19409
G1 X123.551 Y136.082
G1 X119.617 Y132.149 E.17092
G1 X119.617 Y132.682
G1 X123.017 Y136.082 E.14775
G1 X122.484 Y136.082
G1 X119.617 Y133.216 E.12458
G1 X119.617 Y133.749
G1 X121.951 Y136.082 E.10141
G1 X121.418 Y136.082
G1 X119.617 Y134.282 E.07823
G1 X119.617 Y134.815
G1 X120.885 Y136.082 E.05506
G1 X120.351 Y136.083
G1 X119.617 Y135.349 E.03189
; WIPE_START
M204 S6000
G1 X120.351 Y136.083 E-.39444
G1 X120.885 Y136.082 E-.20262
G1 X120.581 Y135.779 E-.16295
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.728 Y133.776 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X126.626 Y133.776 E.03657
G1 X126.626 Y134.302 E.01745
G1 X127.873 Y135.549 E.05849
G1 X128.127 Y135.549 E.00844
G1 X129.9 Y133.776 E.08316
G1 X133.776 Y133.776 E.12858
M73 P52 R11
G1 X135.548 Y135.548 E.08313
G1 X135.804 Y135.548 E.00849
G1 X136.277 Y135.075 E.02217
G1 X137.905 Y135.075 E.05401
; WIPE_START
G1 X136.277 Y135.075 E-.61876
G1 X136.014 Y135.338 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.634 Y133.389 Z3 F42000
G1 X127.631 Y133.123 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F10588.235
M204 S6000
G1 X127.568 Y133.16 E.00204
G1 X127.616 Y133.188 E.00155
M204 S10000
G1 X127.631 Y122.803 F42000
G1 F10588.235
M204 S6000
G1 X127.568 Y122.84 E.00204
G1 X127.616 Y122.868 E.00155
M204 S10000
G1 X120.152 Y122.763 F42000
G1 F10588.235
M204 S6000
G1 X120.088 Y122.8 E.00204
G1 X120.137 Y122.828 E.00155
; WIPE_START
G1 X120.088 Y122.8 E-.32877
G1 X120.152 Y122.763 E-.43123
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.768 Y122.257 Z3 F42000
G1 X128.272 Y122.224 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X129.374 Y122.224 E.03657
G1 X129.374 Y121.698 E.01745
G1 X128.127 Y120.451 E.05849
G1 X127.873 Y120.451 E.00844
G1 X126.1 Y122.224 E.08316
G1 X122.224 Y122.224 E.12858
G1 X120.452 Y120.452 E.08313
G1 X120.196 Y120.452 E.00849
G1 X119.723 Y120.925 E.02217
G1 X118.095 Y120.925 E.05401
; WIPE_START
G1 X119.723 Y120.925 E-.61876
G1 X119.986 Y120.662 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.384 Y122.542 Z3 F42000
G1 X128.411 Y122.803 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F10588.235
M204 S6000
G1 X128.347 Y122.84 E.00204
G1 X128.396 Y122.868 E.00155
M204 S10000
G1 X128.411 Y133.123 F42000
G1 F10588.235
M204 S6000
G1 X128.347 Y133.16 E.00204
G1 X128.396 Y133.188 E.00155
M204 S10000
G1 X135.89 Y133.163 F42000
G1 F10588.235
M204 S6000
G1 X135.827 Y133.2 E.00204
G1 X135.875 Y133.228 E.00155
; WIPE_START
G1 X135.827 Y133.2 E-.32873
G1 X135.89 Y133.163 E-.43127
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.19 Y125.537 Z3 F42000
G1 X136.383 Y120.652 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S2000
G1 X135.649 Y119.917 E.0319
G1 X135.115 Y119.918
G1 X136.383 Y121.185 E.05507
G1 X136.383 Y121.718
G1 X134.582 Y119.918 E.07824
G1 X134.049 Y119.918
G1 X136.383 Y122.251 E.10141
G1 X136.383 Y122.785
G1 X133.516 Y119.918 E.12458
G1 X132.983 Y119.918
G1 X136.383 Y123.318 E.14775
G1 X136.383 Y123.851
G1 X132.449 Y119.918 E.17092
G1 X131.916 Y119.918
G1 X136.383 Y124.384 E.19409
G1 X136.383 Y124.918
G1 X131.383 Y119.918 E.21726
G1 X130.85 Y119.918
G1 X136.383 Y125.451 E.24043
G1 X136.383 Y125.984
G1 X130.316 Y119.918 E.2636
G1 X129.945 Y120.08
G1 X136.383 Y126.517 E.27976
G1 X136.383 Y127.051
G1 X129.993 Y120.661 E.27766
G1 X129.993 Y121.194
G1 X136.383 Y127.584 E.27766
G1 X136.383 Y128.117
G1 X129.993 Y121.727 E.27767
G1 X129.993 Y122.261
G1 X136.383 Y128.65 E.27767
G1 X136.383 Y129.184
G1 X129.965 Y122.767 E.27886
G1 X129.509 Y122.843
G1 X136.383 Y129.717 E.29871
G1 X136.383 Y130.25
G1 X128.975 Y122.843 E.32189
G1 X128.473 Y122.874
G1 X136.383 Y130.783 E.34372
G1 X136.383 Y131.317
G1 X128.393 Y123.327 E.34719
G1 X128.393 Y123.86
G1 X136.383 Y131.85 E.34719
G1 X136.383 Y132.383
G1 X128.393 Y124.394 E.34719
G1 X128.393 Y124.927
G1 X136.383 Y132.917 E.34719
G1 X136.138 Y133.205
G1 X128.393 Y125.46 E.33657
G1 X128.393 Y125.993
G1 X135.557 Y133.157 E.3113
G1 X135.023 Y133.157
G1 X128.393 Y126.527 E.28813
G1 X128.393 Y127.06
G1 X134.49 Y133.157 E.26496
G1 X133.957 Y133.157
G1 X128.393 Y127.593 E.24179
G1 X128.393 Y128.126
G1 X133.424 Y133.157 E.21861
G1 X132.89 Y133.157
G1 X128.393 Y128.66 E.19544
G1 X128.393 Y129.193
G1 X132.357 Y133.157 E.17227
G1 X131.824 Y133.157
G1 X128.393 Y129.726 E.1491
G1 X128.393 Y130.259
G1 X131.291 Y133.157 E.12592
G1 X130.757 Y133.157
G1 X128.393 Y130.793 E.10275
G1 X128.393 Y131.326
G1 X130.224 Y133.157 E.07958
G1 X129.691 Y133.157
G1 X128.393 Y131.859 E.0564
G1 X128.393 Y132.392
G1 X129.158 Y133.157 E.03323
; OBJECT_ID: 394
; WIPE_START
M204 S6000
G1 X128.393 Y132.392 E-.41098
G1 X128.393 Y131.859 E-.20264
G1 X128.665 Y132.132 E-.14638
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X121.054 Y132.701 Z3 F42000
G1 X97.79 Y134.44 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
G1 F9547.055
M204 S5000
G1 X103.41 Y134.44 E.17269
G1 X103.41 Y135.66 E.03749
G1 X97.79 Y135.66 E.17269
G1 X97.79 Y134.5 E.03564
; WIPE_START
M204 S6000
G1 X99.79 Y134.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.622 Y126.936 Z3 F42000
G1 X97.79 Y121.56 Z3
G1 Z2.6
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X97.79 Y120.34 E.03749
G1 X103.41 Y120.34 E.17269
G1 X103.41 Y121.56 E.03749
G1 X97.85 Y121.56 E.17084
M204 S10000
G1 X97.398 Y121.56 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.398 Y121.952 E.01301
G1 X100.198 Y121.952 E.09288
G1 X100.198 Y134.048 E.40124
G1 X97.398 Y134.048 E.09288
G1 X97.398 Y135.898 E.06137
G1 X86.602 Y135.898 E.35812
G1 X86.602 Y134.048 E.06137
G1 X83.802 Y134.048 E.09288
G1 X83.802 Y121.952 E.40124
G1 X86.602 Y121.952 E.09288
G1 X86.602 Y120.102 E.06136
G1 X97.398 Y120.103 E.35812
G1 X97.398 Y121.5 E.04634
; WIPE_START
G1 X97.398 Y121.952 E-.17179
G1 X98.946 Y121.952 E-.58821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.317 Y121.717 Z3 F42000
G1 X86.21 Y121.56 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X80.59 Y121.56 E.17269
G1 X80.59 Y120.34 E.03749
G1 X86.21 Y120.34 E.17269
G1 X86.21 Y121.5 E.03564
; WIPE_START
M204 S6000
G1 X84.21 Y121.521 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.378 Y129.064 Z3 F42000
G1 X86.21 Y134.44 Z3
G1 Z2.6
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X86.21 Y135.66 E.03749
G1 X80.59 Y135.66 E.17269
G1 X80.59 Y134.44 E.03749
G1 X86.15 Y134.44 E.17084
; WIPE_START
M204 S6000
G1 X86.21 Y135.66 E-.46416
G1 X85.431 Y135.66 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.41 Y134.31 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X83.41 Y121.69 E.38778
G1 X80.44 Y121.69 E.09126
G1 X80.44 Y122.165 E.0146
G1 X80.21 Y122.165 E.00706
G1 X80.212 Y121.032 E.03481
G3 X81.604 Y119.71 I1.406 J.086 E.06491
G1 X102.45 Y119.711 E.64054
G3 X103.79 Y121.105 I-.059 J1.398 E.06559
G1 X103.79 Y122.165 E.03256
G1 X103.56 Y122.165 E.00707
G1 X103.56 Y121.69 E.0146
G1 X100.59 Y121.69 E.09126
G1 X100.59 Y134.31 E.38778
G1 X103.56 Y134.31 E.09126
G1 X103.56 Y133.835 E.0146
G1 X103.79 Y133.835 E.00706
G1 X103.788 Y134.968 E.03481
G3 X102.396 Y136.29 I-1.406 J-.086 E.06491
G1 X81.605 Y136.29 E.63883
G3 X80.21 Y134.896 I.012 J-1.407 E.06716
G1 X80.21 Y133.835 E.0326
G1 X80.44 Y133.835 E.00707
G1 X80.44 Y134.31 E.0146
G1 X83.35 Y134.31 E.08942
; WIPE_START
M204 S6000
G1 X83.36 Y132.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.733 Y133.884 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42248
G1 F9484.667
M204 S6000
G1 X84.135 Y133.286 E.02616
G1 X84.135 Y132.75 E.0166
G1 X85.1 Y133.715 E.04222
G1 X85.637 Y133.715 E.0166
G1 X84.135 Y132.213 E.0657
G1 X84.135 Y131.676 E.0166
G1 X86.174 Y133.715 E.08917
G1 X86.711 Y133.715 E.0166
G1 X84.135 Y131.139 E.11265
G1 X84.135 Y130.602 E.0166
G1 X87.008 Y133.475 E.12563
G1 X87.044 Y133.438 E.0016
G1 X87.508 Y133.438 E.01434
G1 X84.135 Y130.066 E.14752
G1 X84.135 Y129.529 E.0166
G1 X88.045 Y133.438 E.171
G1 X88.581 Y133.438 E.0166
G1 X84.135 Y128.992 E.19447
G1 X84.135 Y128.455 E.0166
G1 X89.118 Y133.438 E.21795
G1 X89.655 Y133.438 E.0166
G1 X84.135 Y127.919 E.24143
G1 X84.135 Y127.382 E.0166
G1 X90.192 Y133.438 E.26491
G1 X90.729 Y133.438 E.0166
G1 X84.135 Y126.845 E.28839
G1 X84.135 Y126.308 E.0166
G1 X91.265 Y133.438 E.31187
G1 X91.802 Y133.438 E.0166
G1 X84.135 Y125.771 E.33535
G1 X84.135 Y125.235 E.0166
G1 X92.339 Y133.438 E.35883
G1 X92.876 Y133.438 E.0166
G1 X84.135 Y124.698 E.38231
G1 X84.135 Y124.161 E.0166
G1 X93.412 Y133.438 E.40579
G1 X93.949 Y133.438 E.0166
G1 X84.135 Y123.624 E.42927
G1 X84.135 Y123.087 E.0166
G1 X94.486 Y133.438 E.45274
G1 X95.023 Y133.438 E.0166
G1 X84.135 Y122.551 E.47622
G1 X84.135 Y122.285 E.00821
G1 X84.407 Y122.285 E.00839
G1 X95.56 Y133.438 E.48783
G1 X96.096 Y133.438 E.0166
G1 X84.943 Y122.285 E.48783
G1 X85.48 Y122.285 E.0166
G1 X96.633 Y133.438 E.48783
G1 X96.956 Y133.438 E.00999
G1 X97.159 Y133.641 E.00889
G1 X97.159 Y133.715 E.00227
G1 X97.446 Y133.715 E.00889
G1 X86.017 Y122.285 E.49993
G1 X86.554 Y122.285 E.0166
G1 X97.983 Y133.715 E.49993
G1 X98.52 Y133.715 E.0166
G1 X87.367 Y122.562 E.48783
G1 X87.904 Y122.562 E.0166
G1 X99.057 Y133.715 E.48783
G1 X99.594 Y133.715 E.0166
G1 X88.441 Y122.562 E.48783
G1 X88.977 Y122.562 E.0166
G1 X99.865 Y133.449 E.47621
G1 X99.865 Y132.912 E.0166
G1 X89.514 Y122.562 E.45274
G1 X90.051 Y122.562 E.0166
G1 X99.865 Y132.376 E.42926
G1 X99.865 Y131.839 E.0166
G1 X90.588 Y122.562 E.40578
G1 X91.125 Y122.562 E.0166
G1 X99.865 Y131.302 E.3823
G1 X99.865 Y130.765 E.0166
G1 X91.661 Y122.562 E.35882
G1 X92.198 Y122.562 E.0166
G1 X99.865 Y130.228 E.33534
G1 X99.865 Y129.692 E.0166
G1 X92.735 Y122.562 E.31186
G1 X93.272 Y122.562 E.0166
G1 X99.865 Y129.155 E.28838
G1 X99.865 Y128.618 E.0166
G1 X93.808 Y122.562 E.2649
G1 X94.345 Y122.562 E.0166
G1 X99.865 Y128.081 E.24142
G1 X99.865 Y127.545 E.0166
G1 X94.882 Y122.562 E.21794
G1 X95.419 Y122.562 E.0166
G1 X99.865 Y127.008 E.19447
G1 X99.865 Y126.471 E.0166
G1 X95.956 Y122.562 E.17099
G1 X96.492 Y122.562 E.0166
G1 X99.865 Y125.934 E.14751
G1 X99.865 Y125.397 E.0166
M73 P53 R11
G1 X96.993 Y122.525 E.12563
G1 X97.159 Y122.359 E.00729
G1 X97.159 Y122.285 E.00227
G1 X97.289 Y122.285 E.00403
G1 X99.865 Y124.861 E.11265
G1 X99.865 Y124.324 E.0166
G1 X97.826 Y122.285 E.08917
G1 X98.363 Y122.285 E.0166
G1 X99.865 Y123.787 E.06569
G1 X99.865 Y123.25 E.0166
G1 X98.9 Y122.285 E.04221
G1 X99.437 Y122.285 E.0166
G1 X100.034 Y122.883 E.02615
; WIPE_START
G1 X99.437 Y122.285 E-.32129
G1 X98.9 Y122.285 E-.20398
G1 X99.337 Y122.722 E-.23473
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.594 Y120.026 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279024
G1 F15000
M204 S6000
G1 X102.439 Y120.026 E.09321
G3 X102.669 Y120.042 I-.035 J2.128 E.00444
; LINE_WIDTH: 0.223224
G1 X103.055 Y120.104 E.00575
M204 S10000
G1 X103.052 Y120.125 F42000
; LINE_WIDTH: 0.106098
G1 F15000
M204 S6000
G1 X102.33 Y119.907 E.00388
; WIPE_START
G1 X103.052 Y120.125 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.494 Y121.189 Z3 F42000
G1 X88.526 Y122.17 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X90.154 Y122.17 E.05401
G1 X91.873 Y120.451 E.08063
G1 X92.127 Y120.451 E.00842
G1 X93.846 Y122.17 E.08063
G1 X95.474 Y122.17 E.05401
; WIPE_START
G1 X93.846 Y122.17 E-.61876
G1 X93.583 Y121.907 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.406 Y120.025 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279708
G1 F15000
M204 S6000
G1 X81.61 Y120.025 E.09255
G2 X81.287 Y120.048 I.115 J3.901 E.00624
; LINE_WIDTH: 0.214968
G1 X80.943 Y120.108 E.0049
M204 S10000
G1 X80.948 Y120.125 F42000
; LINE_WIDTH: 0.107257
G1 F15000
M204 S6000
G1 X81.669 Y119.906 E.00395
; WIPE_START
G1 X80.948 Y120.125 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.945 Y127.757 Z3 F42000
G1 X80.942 Y135.889 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.20514
G1 F15000
M204 S6000
G1 X81.221 Y135.941 E.00375
; LINE_WIDTH: 0.231562
G1 X81.341 Y135.959 E.00186
; LINE_WIDTH: 0.280259
G2 X81.613 Y135.975 I.298 J-2.786 E.00528
G1 X86.406 Y135.975 E.09269
; WIPE_START
G1 X84.406 Y135.975 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.899 Y134.523 Z3 F42000
G1 X95.474 Y133.83 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X93.846 Y133.83 E.05401
G1 X92.126 Y135.55 E.08066
G1 X91.874 Y135.55 E.00838
G1 X90.154 Y133.83 E.08066
G1 X88.526 Y133.83 E.05401
; WIPE_START
G1 X90.154 Y133.83 E-.61876
G1 X90.417 Y134.093 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.594 Y135.975 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280703
G1 F15000
M204 S6000
G1 X102.39 Y135.975 E.09294
G2 X102.558 Y135.969 I-.007 J-2.489 E.00324
; LINE_WIDTH: 0.246558
G2 X102.761 Y135.944 I-.16 J-2.176 E.0034
; LINE_WIDTH: 0.208159
G1 X103.056 Y135.891 E.00404
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X102.761 Y135.944 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 14/42
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
M106 S198.9
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z3 I.249 J1.191 P1  F42000
G1 X164.598 Y123.023 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X164.598 Y132.977 E.3302
G1 X172.198 Y132.977 E.25211
G1 X172.198 Y134.777 E.05971
G1 X175.397 Y134.777 E.1061
G3 X174.385 Y135.898 I-1.005 J.11 E.05655
G1 X153.615 Y135.898 E.68898
G3 X152.604 Y134.777 I-.004 J-1.013 E.0565
G1 X155.802 Y134.777 E.1061
G1 X155.802 Y132.977 E.05971
G1 X163.402 Y132.977 E.25211
G1 X163.402 Y123.023 E.3302
G1 X155.802 Y123.023 E.25211
G1 X155.802 Y121.223 E.05971
G1 X152.603 Y121.223 E.1061
G3 X153.608 Y120.102 I1.005 J-.11 E.05631
G1 X174.436 Y120.103 E.6909
G3 X175.403 Y121.223 I-.046 J1.018 E.05493
G1 X172.198 Y121.223 E.10633
G1 X172.198 Y123.023 E.05971
G1 X164.658 Y123.023 E.25012
M204 S250
G1 X164.99 Y123.415 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X164.99 Y132.585 E.28177
G1 X172.59 Y132.585 E.23353
G1 X172.59 Y134.385 E.05531
G1 X173.303 Y134.385 E.02189
G1 X173.31 Y134.185 E.00615
G1 X173.69 Y134.185 E.01169
G1 X173.695 Y134.385 E.00615
G1 X174.503 Y134.385 E.02482
G1 X174.51 Y134.185 E.00615
G1 X174.89 Y134.185 E.01169
G1 X174.895 Y134.385 E.00615
G1 X175.79 Y134.385 E.0275
G3 X175.783 Y135.034 I-4.559 J.282 E.01997
G3 X174.395 Y136.29 I-1.386 J-.137 E.06309
G1 X153.605 Y136.29 E.6388
G3 X152.212 Y134.968 I-.002 J-1.394 E.0651
G1 X152.21 Y134.385 E.01793
G1 X153.103 Y134.385 E.02741
G1 X153.11 Y134.185 E.00615
G1 X153.49 Y134.185 E.01169
G1 X153.495 Y134.385 E.00615
G1 X154.305 Y134.385 E.02491
G1 X154.31 Y134.185 E.00614
G1 X154.69 Y134.186 E.01169
G1 X154.697 Y134.385 E.00613
G1 X155.41 Y134.385 E.02189
G1 X155.41 Y132.585 E.05531
G1 X163.01 Y132.585 E.23353
G1 X163.01 Y123.415 E.28177
G1 X155.41 Y123.415 E.23353
G1 X155.41 Y121.615 E.05531
G1 X154.697 Y121.615 E.02189
G1 X154.69 Y121.815 E.00615
G1 X154.31 Y121.815 E.01169
G1 X154.305 Y121.615 E.00615
G1 X153.497 Y121.615 E.02482
G1 X153.49 Y121.815 E.00615
G1 X153.11 Y121.815 E.01169
G1 X153.105 Y121.615 E.00615
G1 X152.21 Y121.615 E.0275
G3 X152.217 Y120.966 I4.542 J-.282 E.01997
G3 X153.603 Y119.71 I1.385 J.135 E.06303
G1 X174.448 Y119.711 E.64051
G3 X175.79 Y121.105 I-.051 J1.392 E.06572
G1 X175.79 Y121.615 E.01566
G1 X174.897 Y121.615 E.02742
G1 X174.89 Y121.815 E.00615
G1 X174.51 Y121.815 E.01169
G1 X174.505 Y121.615 E.00615
G1 X173.695 Y121.615 E.02491
G1 X173.69 Y121.815 E.00614
G1 X173.31 Y121.814 E.01169
G1 X173.302 Y121.615 E.00613
G1 X172.59 Y121.615 E.02189
G1 X172.59 Y123.415 E.05531
G1 X165.05 Y123.415 E.23168
; WIPE_START
M204 S6000
G1 X165.037 Y125.415 E-.76
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
G1 X164.394 Y133.429 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.5391
G1 F7255.432
M204 S6000
G1 X171.686 Y133.429 E.29483
M204 S10000
G1 X164.394 Y133.429 F42000
; LINE_WIDTH: 0.522389
G1 F7508.317
M204 S6000
G1 X164.329 Y133.352 E.00395
; LINE_WIDTH: 0.488965
G1 F8070.935
G1 X164.263 Y133.275 E.00368
; LINE_WIDTH: 0.438249
G1 F9106.348
G1 X164.197 Y133.198 E.00326
G1 X164.197 Y122.819 E.33433
; LINE_WIDTH: 0.454919
G1 F8737.899
G1 X164.249 Y122.737 E.00325
; LINE_WIDTH: 0.490095
G1 F8050.539
G1 X164.3 Y122.655 E.00353
; LINE_WIDTH: 0.525272
G1 F7463.434
G1 X164.351 Y122.573 E.00381
; LINE_WIDTH: 0.51928
G1 F7557.309
G1 X164.176 Y122.55 E.00688
; LINE_WIDTH: 0.487124
G1 F8104.389
G1 X164 Y122.526 E.00641
G1 X163.606 Y122.571 E.01437
; LINE_WIDTH: 0.516223
G1 F7606.129
G1 X163.704 Y122.673 E.00546
; LINE_WIDTH: 0.470468
G1 F8420.117
G1 X163.803 Y122.774 E.00493
; LINE_WIDTH: 0.438099
G1 F9109.795
G1 X163.803 Y133.198 E.33567
; LINE_WIDTH: 0.456169
G1 F8711.469
G1 X163.751 Y133.274 E.0031
; LINE_WIDTH: 0.490845
G1 F8037.059
G1 X163.7 Y133.35 E.00336
; LINE_WIDTH: 0.525522
G1 F7459.567
G1 X163.649 Y133.427 E.00362
; LINE_WIDTH: 0.51928
G1 F7557.309
G1 X163.824 Y133.45 E.00688
; LINE_WIDTH: 0.486343
G1 F8118.671
G1 X164 Y133.474 E.0064
G1 X164.335 Y133.436 E.01218
M204 S10000
G1 X156.254 Y133.429 F42000
; LINE_WIDTH: 0.5391
G1 F7255.432
M204 S6000
G1 X163.589 Y133.429 E.29658
; WIPE_START
G1 X161.589 Y133.429 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X158.223 Y126.579 Z3.2 F42000
G1 X156.254 Y122.571 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F7255.432
M204 S6000
G1 X163.546 Y122.571 E.29483
M204 S10000
G1 X171.746 Y122.571 F42000
G1 F7255.432
M204 S6000
G1 X164.411 Y122.571 E.29658
M204 S10000
G1 X154.145 Y120.875 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X155.773 Y120.875 E.05401
G1 X156.198 Y120.45 E.0199
G1 X156.451 Y120.451 E.00839
G1 X158.12 Y122.12 E.0783
G1 X162.204 Y122.12 E.1355
G1 X163.873 Y120.451 E.07828
G1 X164.127 Y120.451 E.00842
G1 X165.796 Y122.12 E.07828
G1 X169.88 Y122.12 E.1355
G1 X171.549 Y120.451 E.07826
G1 X171.803 Y120.451 E.00845
G1 X172.227 Y120.875 E.01985
G1 X173.855 Y120.875 E.05401
; WIPE_START
G1 X172.227 Y120.875 E-.61876
G1 X171.964 Y120.612 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X172.95 Y128.18 Z3.2 F42000
G1 X173.855 Y135.125 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X172.227 Y135.125 E.05401
G1 X171.802 Y135.55 E.01991
G1 X171.55 Y135.55 E.00838
G1 X169.88 Y133.88 E.07831
G1 X165.796 Y133.88 E.1355
G1 X164.126 Y135.55 E.07831
G1 X163.874 Y135.55 E.00838
G1 X162.204 Y133.88 E.07831
G1 X158.12 Y133.88 E.1355
G1 X156.45 Y135.55 E.07831
G1 X156.198 Y135.55 E.00838
G1 X155.773 Y135.125 E.01991
G1 X154.145 Y135.125 E.05401
; OBJECT_ID: 405
; WIPE_START
G1 X155.773 Y135.125 E-.61876
G1 X156.036 Y135.388 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X149.075 Y132.258 Z3.2 F42000
G1 X128.598 Y123.048 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X128.598 Y132.952 E.32854
G1 X136.198 Y132.952 E.25211
G1 X136.198 Y134.727 E.05888
G1 X139.397 Y134.727 E.10611
G3 X138.385 Y135.898 I-1.008 J.151 E.05827
G1 X125.802 Y135.898 E.4174
G1 X125.802 Y132.952 E.09772
G1 X127.402 Y132.952 E.05307
G1 X127.402 Y123.048 E.32854
G1 X119.802 Y123.048 E.25211
G1 X119.802 Y121.273 E.05888
G1 X116.603 Y121.273 E.10611
G3 X117.615 Y120.102 I1.011 J-.149 E.05822
G1 X130.198 Y120.102 E.4174
G1 X130.198 Y123.048 E.09772
G1 X128.658 Y123.048 E.05108
M204 S250
G1 X128.99 Y123.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X128.99 Y132.56 E.28023
G1 X136.59 Y132.56 E.23353
G1 X136.59 Y134.335 E.05454
G1 X139.79 Y134.335 E.09831
G3 X139.783 Y135.034 I-4.898 J.307 E.02149
G3 X138.395 Y136.29 I-1.385 J-.135 E.06312
G1 X125.41 Y136.29 E.39898
G1 X125.41 Y132.56 E.11461
G1 X127.01 Y132.56 E.04916
G1 X127.01 Y123.44 E.28023
G1 X119.41 Y123.44 E.23353
G1 X119.41 Y121.665 E.05454
G1 X116.21 Y121.665 E.09831
G1 X116.212 Y121.032 E.01946
G3 X117.605 Y119.71 I1.389 J.069 E.06514
G1 X130.59 Y119.71 E.39898
G1 X130.59 Y123.44 E.11461
G1 X129.05 Y123.44 E.04732
; WIPE_START
M204 S6000
G1 X129.037 Y125.44 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.423 Y133.048 Z3.2 F42000
G1 X128.394 Y133.404 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.5391
G1 F7255.432
M204 S6000
G1 X135.686 Y133.404 E.29483
M204 S10000
G1 X128.394 Y133.404 F42000
; LINE_WIDTH: 0.522389
G1 F7508.317
M204 S6000
G1 X128.329 Y133.327 E.00395
; LINE_WIDTH: 0.488965
G1 F8070.935
G1 X128.263 Y133.25 E.00368
; LINE_WIDTH: 0.43825
G1 F9106.329
G1 X128.197 Y133.173 E.00326
G1 X128.197 Y122.844 E.33272
; LINE_WIDTH: 0.454919
G1 F8737.899
G1 X128.249 Y122.762 E.00325
; LINE_WIDTH: 0.490095
G1 F8050.539
G1 X128.3 Y122.68 E.00353
; LINE_WIDTH: 0.525272
G1 F7463.434
G1 X128.351 Y122.598 E.00381
; LINE_WIDTH: 0.51928
G1 F7557.309
G1 X128.176 Y122.575 E.00688
; LINE_WIDTH: 0.487124
G1 F8104.389
G1 X128 Y122.551 E.00641
G1 X127.606 Y122.596 E.01437
; LINE_WIDTH: 0.516223
G1 F7606.129
G1 X127.704 Y122.698 E.00546
; LINE_WIDTH: 0.470468
G1 F8420.117
G1 X127.803 Y122.799 E.00493
; LINE_WIDTH: 0.438099
G1 F9109.793
G1 X127.803 Y133.173 E.33406
; LINE_WIDTH: 0.414507
G1 F9688.184
G1 X127.744 Y133.208 E.00207
; LINE_WIDTH: 0.36586
G1 F11147.581
G1 X127.686 Y133.243 E.0018
; LINE_WIDTH: 0.317214
G1 F12000
G1 X127.627 Y133.279 E.00153
; LINE_WIDTH: 0.29103
G3 X126.594 Y133.28 I-.527 J-11.992 E.02089
; LINE_WIDTH: 0.315519
G1 X126.526 Y133.304 E.00162
; LINE_WIDTH: 0.364535
G1 F11193.508
G1 X126.457 Y133.329 E.00191
; LINE_WIDTH: 0.413552
G1 F9713.147
G1 X126.389 Y133.353 E.0022
; LINE_WIDTH: 0.46139
G1 F8602.767
G1 X126.319 Y133.377 E.0025
; LINE_WIDTH: 0.50805
G1 F7739.771
G1 X126.25 Y133.4 E.00278
; LINE_WIDTH: 0.53428
G1 F7326.603
G1 X126.273 Y133.651 E.01009
G1 X126.375 Y133.525 E.00648
; LINE_WIDTH: 0.507343
G1 F7751.554
G1 X126.419 Y133.526 E.00166
; LINE_WIDTH: 0.459269
G1 F8646.592
G1 X126.463 Y133.526 E.00149
; LINE_WIDTH: 0.411195
G1 F9775.304
G1 X126.507 Y133.527 E.00132
; LINE_WIDTH: 0.363121
G1 F11242.938
G1 X126.551 Y133.527 E.00114
; LINE_WIDTH: 0.292009
G1 F12000
G2 X127.606 Y133.528 I.549 J-49.165 E.02141
; LINE_WIDTH: 0.315819
G1 X127.751 Y133.505 E.00328
; LINE_WIDTH: 0.365437
G1 F11162.202
G1 X127.897 Y133.482 E.00388
; LINE_WIDTH: 0.415055
G1 F9673.909
G1 X128.043 Y133.459 E.00448
; LINE_WIDTH: 0.464673
G1 F8535.802
G1 X128.189 Y133.436 E.00508
; LINE_WIDTH: 0.514291
G1 F7637.296
G1 X128.335 Y133.413 E.00567
M204 S10000
G1 X126.254 Y135.446 F42000
; LINE_WIDTH: 0.5391
G1 F7255.431
M204 S6000
G1 X126.261 Y133.71 E.07022
; WIPE_START
G1 X126.254 Y135.446 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.025 Y128.531 Z3.2 F42000
G1 X120.254 Y122.596 Z3.2
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.5391
G1 F7255.432
M204 S6000
G1 X127.546 Y122.596 E.29483
M204 S10000
G1 X129.746 Y120.554 F42000
G1 F7255.432
M204 S6000
G1 X129.746 Y122.256 E.0688
; LINE_WIDTH: 0.56234
G1 F6930.808
G1 X129.723 Y122.346 E.00395
; LINE_WIDTH: 0.60882
G1 F6361.549
G1 X129.7 Y122.436 E.0043
; LINE_WIDTH: 0.6553
G1 F5878.703
G1 X129.677 Y122.527 E.00466
G1 X129.586 Y122.55 E.00466
; LINE_WIDTH: 0.60882
G1 F6361.549
G1 X129.496 Y122.573 E.0043
; LINE_WIDTH: 0.541094
G1 F7226.397
G1 X129.406 Y122.596 E.00379
G1 X128.411 Y122.596 E.04037
M204 S10000
G1 X118.095 Y120.925 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X119.723 Y120.925 E.05401
G1 X120.193 Y120.455 E.02205
G1 X120.455 Y120.455 E.00866
G1 X122.145 Y122.145 E.07929
G1 X126.179 Y122.145 E.13384
G1 X127.873 Y120.451 E.07944
G1 X128.127 Y120.451 E.00844
G1 X129.295 Y121.619 E.05477
G1 X129.295 Y122.145 E.01745
G1 X128.192 Y122.145 E.03657
; WIPE_START
G1 X129.295 Y122.145 E-.4189
G1 X129.295 Y121.619 E-.19987
G1 X129.032 Y121.356 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.177 Y127.765 Z3.2 F42000
G1 X137.905 Y135.075 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X136.277 Y135.075 E.05401
G1 X135.802 Y135.55 E.02225
G1 X135.55 Y135.55 E.00838
G1 X133.855 Y133.855 E.07949
G1 X129.821 Y133.855 E.13384
G1 X128.126 Y135.55 E.07949
G1 X127.874 Y135.55 E.00838
G1 X126.705 Y134.381 E.05481
G1 X126.705 Y133.855 E.01745
G1 X127.808 Y133.855 E.03657
; OBJECT_ID: 394
; WIPE_START
M73 P54 R11
G1 X126.705 Y133.855 E-.4189
G1 X126.705 Y134.381 E-.19987
G1 X126.968 Y134.644 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X119.336 Y134.591 Z3.2 F42000
G1 X97.79 Y134.44 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X103.41 Y134.44 E.17269
G1 X103.41 Y135.66 E.03749
G1 X97.79 Y135.66 E.17269
G1 X97.79 Y134.5 E.03564
; WIPE_START
M204 S6000
G1 X99.79 Y134.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.622 Y126.936 Z3.2 F42000
G1 X97.79 Y121.56 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X97.79 Y120.34 E.03749
G1 X103.41 Y120.34 E.17269
G1 X103.41 Y121.56 E.03749
G1 X97.85 Y121.56 E.17084
M204 S10000
G1 X97.398 Y121.56 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.398 Y121.952 E.01301
G1 X100.198 Y121.952 E.09288
G1 X100.198 Y122.597 E.0214
G1 X92.122 Y122.597 E.26789
G1 X92.122 Y133.403 E.35844
G1 X100.198 Y133.403 E.26789
G1 X100.198 Y134.048 E.0214
G1 X97.398 Y134.048 E.09288
G1 X97.398 Y135.898 E.06137
G1 X86.602 Y135.898 E.35812
G1 X86.602 Y134.048 E.06137
G1 X83.802 Y134.048 E.09288
G1 X83.802 Y133.403 E.0214
G1 X91.878 Y133.403 E.26789
G1 X91.878 Y122.597 E.35844
G1 X83.802 Y122.597 E.26789
G1 X83.802 Y121.952 E.0214
G1 X86.602 Y121.952 E.09288
G1 X86.602 Y120.102 E.06136
G1 X97.398 Y120.103 E.35812
G1 X97.398 Y121.5 E.04634
; WIPE_START
G1 X97.398 Y121.952 E-.17179
G1 X98.946 Y121.952 E-.58821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.317 Y121.717 Z3.2 F42000
G1 X86.21 Y121.56 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X80.59 Y121.56 E.17269
G1 X80.59 Y120.34 E.03749
G1 X86.21 Y120.34 E.17269
G1 X86.21 Y121.5 E.03564
; WIPE_START
M204 S6000
G1 X84.21 Y121.521 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.378 Y129.064 Z3.2 F42000
G1 X86.21 Y134.44 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X86.21 Y135.66 E.03749
G1 X80.59 Y135.66 E.17269
G1 X80.59 Y134.44 E.03749
G1 X86.15 Y134.44 E.17084
; WIPE_START
M204 S6000
G1 X86.21 Y135.66 E-.46416
G1 X85.431 Y135.66 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.41 Y134.31 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X83.41 Y121.69 E.38778
G1 X80.44 Y121.69 E.09126
G1 X80.44 Y122.165 E.0146
G1 X80.21 Y122.165 E.00706
G1 X80.212 Y121.032 E.03481
G3 X81.603 Y119.71 I1.398 J.078 E.06497
G1 X102.448 Y119.711 E.64051
G3 X103.79 Y121.105 I-.056 J1.397 E.06567
G1 X103.79 Y122.165 E.03256
G1 X103.56 Y122.165 E.00707
G1 X103.56 Y121.69 E.0146
G1 X100.59 Y121.69 E.09126
G1 X100.59 Y134.31 E.38778
G1 X103.56 Y134.31 E.09126
G1 X103.56 Y133.835 E.0146
G1 X103.79 Y133.835 E.00706
G1 X103.788 Y134.968 E.03481
G3 X102.395 Y136.29 I-1.406 J-.086 E.06495
G1 X81.605 Y136.29 E.6388
G3 X80.21 Y134.897 I-.002 J-1.394 E.06729
G1 X80.21 Y133.835 E.03264
G1 X80.44 Y133.835 E.00707
G1 X80.44 Y134.31 E.0146
G1 X83.35 Y134.31 E.08942
M204 S10000
G1 X84.006 Y133.725 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.28102
G1 F15000
M204 S6000
G1 X86.805 Y133.725 E.05432
M204 S10000
G1 X88.447 Y133.751 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X90.075 Y133.751 E.05401
G1 X91.874 Y135.55 E.08438
G1 X92.126 Y135.55 E.00838
G1 X93.925 Y133.751 E.08438
G1 X95.553 Y133.751 E.05401
M204 S10000
G1 X97.195 Y133.725 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.28102
G1 F15000
M204 S6000
G1 X99.994 Y133.725 E.05432
M204 S10000
G1 X99.917 Y133.148 F42000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S2000
G1 X100.383 Y132.682 E.02023
G1 X100.383 Y132.149
G1 X99.399 Y133.132 E.04273
G1 X98.866 Y133.132
G1 X100.383 Y131.616 E.0659
G1 X100.383 Y131.082
G1 X98.333 Y133.132 E.08907
G1 X97.8 Y133.132
G1 X100.383 Y130.549 E.11225
G1 X100.383 Y130.016
G1 X97.266 Y133.132 E.13542
G1 X96.733 Y133.132
G1 X100.383 Y129.483 E.15859
G1 X100.383 Y128.949
G1 X96.2 Y133.132 E.18176
G1 X95.667 Y133.132
G1 X100.383 Y128.416 E.20494
G1 X100.383 Y127.883
G1 X95.133 Y133.132 E.22811
G1 X94.6 Y133.132
G1 X100.383 Y127.35 E.25128
G1 X100.383 Y126.816
G1 X94.067 Y133.132 E.27445
G1 X93.534 Y133.132
G1 X100.383 Y126.283 E.29763
G1 X100.383 Y125.75
G1 X93 Y133.132 E.3208
G1 X92.485 Y133.114
G1 X100.383 Y125.217 E.34318
G1 X100.383 Y124.683
G1 X92.393 Y132.673 E.34719
G1 X92.393 Y132.14
G1 X100.383 Y124.15 E.34719
G1 X100.383 Y123.617
G1 X92.393 Y131.606 E.34719
G1 X92.393 Y131.073
G1 X100.383 Y123.083 E.34719
G1 X100.113 Y122.82
G1 X92.393 Y130.54 E.33548
G1 X92.393 Y130.007
G1 X99.532 Y122.868 E.31022
G1 X98.998 Y122.868
G1 X92.393 Y129.473 E.28704
G1 X92.393 Y128.94
G1 X98.465 Y122.868 E.26387
G1 X97.932 Y122.868
G1 X92.393 Y128.407 E.2407
G1 X92.393 Y127.874
G1 X97.399 Y122.868 E.21753
G1 X96.865 Y122.868
G1 X92.393 Y127.34 E.19435
G1 X92.393 Y126.807
G1 X96.332 Y122.868 E.17118
G1 X95.799 Y122.868
G1 X92.393 Y126.274 E.14801
G1 X92.393 Y125.741
G1 X95.266 Y122.868 E.12484
G1 X94.732 Y122.868
G1 X92.393 Y125.207 E.10166
G1 X92.393 Y124.674
G1 X94.199 Y122.868 E.07849
G1 X93.666 Y122.868
G1 X92.393 Y124.141 E.05532
G1 X92.393 Y123.608
G1 X93.133 Y122.868 E.03215
; WIPE_START
M204 S6000
G1 X92.393 Y123.608 E-.39754
G1 X92.393 Y124.141 E-.20264
G1 X92.69 Y123.843 E-.15982
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.553 Y122.249 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X93.925 Y122.249 E.05401
G1 X92.127 Y120.451 E.08435
G1 X91.873 Y120.451 E.00842
G1 X90.075 Y122.249 E.08435
G1 X88.447 Y122.249 E.05401
M204 S10000
G1 X86.805 Y122.275 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.28102
G1 F15000
M204 S6000
G1 X84.006 Y122.275 E.05432
M204 S10000
G1 X84.152 Y122.788 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F10588.235
M204 S6000
G1 X84.088 Y122.825 E.00204
G1 X84.137 Y122.853 E.00155
M204 S10000
G1 X91.631 Y122.828 F42000
G1 F10588.235
M204 S6000
G1 X91.568 Y122.865 E.00204
G1 X91.616 Y122.893 E.00155
M204 S10000
G1 X91.631 Y133.098 F42000
G1 F10588.235
M204 S6000
G1 X91.568 Y133.135 E.00204
G1 X91.616 Y133.163 E.00155
M204 S10000
G1 X84.152 Y133.138 F42000
G1 F10588.235
M204 S6000
G1 X84.088 Y133.175 E.00204
G1 X84.137 Y133.203 E.00155
; WIPE_START
G1 X84.088 Y133.175 E-.32875
G1 X84.152 Y133.138 E-.43125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.406 Y135.975 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280242
G1 F15000
M204 S6000
G1 X81.613 Y135.975 E.09268
M73 P54 R10
G3 X81.338 Y135.959 I.014 J-2.584 E.00533
; LINE_WIDTH: 0.231159
G1 X81.221 Y135.941 E.00182
; LINE_WIDTH: 0.205231
G1 X80.942 Y135.89 E.00375
; WIPE_START
G1 X81.221 Y135.941 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.549 Y133.807 Z3.2 F42000
G1 X90.867 Y133.132 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S2000
G1 X91.607 Y132.392 E.03215
G1 X91.607 Y131.859
G1 X90.334 Y133.132 E.05532
G1 X89.801 Y133.132
G1 X91.607 Y131.326 E.0785
G1 X91.607 Y130.792
G1 X89.267 Y133.132 E.10167
G1 X88.734 Y133.132
G1 X91.607 Y130.259 E.12484
G1 X91.607 Y129.726
G1 X88.201 Y133.132 E.14801
G1 X87.668 Y133.132
G1 X91.607 Y129.193 E.17119
G1 X91.607 Y128.659
G1 X87.134 Y133.132 E.19436
G1 X86.601 Y133.132
G1 X91.607 Y128.126 E.21753
G1 X91.607 Y127.593
G1 X86.068 Y133.132 E.24071
G1 X85.535 Y133.132
G1 X91.607 Y127.06 E.26388
G1 X91.607 Y126.526
G1 X85.001 Y133.132 E.28705
G1 X84.468 Y133.132
G1 X91.607 Y125.993 E.31022
G1 X91.607 Y125.46
G1 X83.887 Y133.18 E.33549
G1 X83.617 Y132.916
G1 X91.607 Y124.927 E.34719
G1 X91.607 Y124.393
G1 X83.617 Y132.383 E.34719
G1 X83.617 Y131.85
G1 X91.607 Y123.86 E.34719
G1 X91.607 Y123.327
G1 X83.617 Y131.317 E.34719
G1 X83.617 Y130.783
G1 X91.515 Y122.886 E.34317
G1 X91 Y122.868
G1 X83.617 Y130.25 E.32079
G1 X83.617 Y129.717
G1 X90.466 Y122.868 E.29762
G1 X89.933 Y122.868
G1 X83.617 Y129.184 E.27445
G1 X83.617 Y128.65
G1 X89.4 Y122.868 E.25128
G1 X88.867 Y122.868
G1 X83.617 Y128.117 E.2281
G1 X83.617 Y127.584
G1 X88.333 Y122.868 E.20493
G1 X87.8 Y122.868
G1 X83.617 Y127.051 E.18176
G1 X83.617 Y126.517
G1 X87.267 Y122.868 E.15858
G1 X86.734 Y122.868
G1 X83.617 Y125.984 E.13541
G1 X83.617 Y125.451
G1 X86.2 Y122.868 E.11224
G1 X85.667 Y122.868
G1 X83.617 Y124.918 E.08907
G1 X83.617 Y124.384
G1 X85.134 Y122.868 E.06589
G1 X84.601 Y122.868
G1 X83.617 Y123.851 E.04272
G1 X83.617 Y123.318
G1 X84.083 Y122.852 E.02023
; WIPE_START
M204 S6000
G1 X83.617 Y123.318 E-.25018
G1 X83.617 Y123.851 E-.20264
G1 X84.189 Y123.279 E-.30718
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.406 Y120.025 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279357
G1 F15000
M204 S6000
G1 X81.552 Y120.026 E.09352
G2 X81.332 Y120.042 I.056 J2.259 E.00426
; LINE_WIDTH: 0.237791
G1 X81.267 Y120.051 E.00103
; LINE_WIDTH: 0.212264
G1 X80.943 Y120.108 E.00454
; WIPE_START
G1 X81.267 Y120.051 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.826 Y121.106 Z3.2 F42000
G1 X97.195 Y122.275 Z3.2
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.28102
G1 F15000
M204 S6000
G1 X99.994 Y122.275 E.05432
M204 S10000
G1 X99.89 Y122.788 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F10588.235
M204 S6000
G1 X99.827 Y122.825 E.00204
G1 X99.875 Y122.853 E.00155
M204 S10000
G1 X92.411 Y122.828 F42000
G1 F10588.235
M204 S6000
G1 X92.347 Y122.865 E.00204
G1 X92.396 Y122.893 E.00155
M204 S10000
G1 X92.411 Y133.098 F42000
G1 F10588.235
M204 S6000
G1 X92.347 Y133.135 E.00204
G1 X92.396 Y133.163 E.00155
M204 S10000
G1 X99.89 Y133.138 F42000
G1 F10588.235
M204 S6000
G1 X99.827 Y133.175 E.00204
G1 X99.875 Y133.203 E.00155
; WIPE_START
G1 X99.827 Y133.175 E-.32873
G1 X99.89 Y133.138 E-.43127
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.594 Y135.975 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280713
G1 F15000
M204 S6000
G1 X102.387 Y135.975 E.09287
G2 X102.552 Y135.969 I.008 J-2.224 E.00321
; LINE_WIDTH: 0.247343
G2 X102.759 Y135.945 I-.161 J-2.218 E.00348
; LINE_WIDTH: 0.208437
G1 X103.056 Y135.891 E.00407
; WIPE_START
G1 X102.759 Y135.945 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.903 Y128.314 Z3.2 F42000
G1 X103.057 Y120.108 Z3.2
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.214222
G1 F15000
M204 S6000
G1 X102.718 Y120.049 E.00481
; LINE_WIDTH: 0.278689
M73 P55 R10
G2 X102.438 Y120.026 I-.357 J2.616 E.00539
G1 X97.594 Y120.026 E.09307
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X99.594 Y120.026 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 15/42
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
M106 S201.45
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z3.2 I-.056 J1.216 P1  F42000
G1 X164.598 Y123.023 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X164.598 Y132.977 E.3302
G1 X172.198 Y132.977 E.25211
G1 X172.198 Y134.777 E.05971
G1 X175.396 Y134.777 E.1061
G3 X174.392 Y135.898 I-1.009 J.106 E.05624
G1 X153.615 Y135.898 E.68922
G3 X152.604 Y134.777 I-.005 J-1.013 E.05651
G1 X155.802 Y134.777 E.1061
G1 X155.802 Y132.977 E.05971
G1 X163.402 Y132.977 E.25211
G1 X163.402 Y123.023 E.3302
G1 X155.802 Y123.023 E.25211
G1 X155.802 Y121.223 E.05971
G1 X152.603 Y121.223 E.1061
G3 X153.608 Y120.102 I1.005 J-.11 E.05631
G1 X174.434 Y120.103 E.69084
G3 X175.401 Y121.223 I-.04 J1.012 E.05502
G1 X172.198 Y121.223 E.10624
G1 X172.198 Y123.023 E.05971
G1 X164.658 Y123.023 E.25012
M204 S250
G1 X164.99 Y123.415 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X164.99 Y132.585 E.28177
G1 X172.59 Y132.585 E.23353
G1 X172.59 Y134.385 E.05531
G1 X173.302 Y134.385 E.02189
G1 X173.31 Y134.185 E.00615
G1 X173.69 Y134.185 E.01169
G1 X173.695 Y134.385 E.00615
G1 X174.502 Y134.385 E.02482
G1 X174.51 Y134.185 E.00615
G1 X174.89 Y134.185 E.01169
G1 X174.895 Y134.385 E.00615
G1 X175.79 Y134.385 E.0275
G3 X175.775 Y135.105 I-3.758 J.282 E.02217
G3 X174.397 Y136.29 I-1.385 J-.217 E.06073
G1 X153.605 Y136.29 E.63887
G3 X152.212 Y134.968 I-.001 J-1.395 E.0651
G1 X152.21 Y134.385 E.01791
G1 X153.102 Y134.385 E.02741
G1 X153.11 Y134.185 E.00615
G1 X153.49 Y134.185 E.01169
G1 X153.495 Y134.385 E.00615
G1 X154.305 Y134.385 E.02491
G1 X154.31 Y134.185 E.00614
G1 X154.69 Y134.186 E.01169
G1 X154.698 Y134.385 E.00613
G1 X155.41 Y134.385 E.02189
G1 X155.41 Y132.585 E.05531
G1 X163.01 Y132.585 E.23353
G1 X163.01 Y123.415 E.28177
G1 X155.41 Y123.415 E.23353
G1 X155.41 Y121.615 E.05531
G1 X154.697 Y121.615 E.02189
G1 X154.69 Y121.815 E.00615
G1 X154.31 Y121.815 E.01169
G1 X154.305 Y121.615 E.00615
G1 X153.497 Y121.615 E.02482
G1 X153.49 Y121.815 E.00615
G1 X153.11 Y121.815 E.01169
G1 X153.105 Y121.615 E.00615
G1 X152.21 Y121.615 E.0275
G3 X152.217 Y120.966 I4.55 J-.282 E.01997
G3 X153.603 Y119.71 I1.388 J.14 E.06299
G1 X174.446 Y119.711 E.64045
G3 X175.79 Y121.103 I-.046 J1.389 E.06574
G1 X175.79 Y121.615 E.01574
G1 X174.897 Y121.615 E.02743
G1 X174.89 Y121.815 E.00615
G1 X174.51 Y121.815 E.01169
G1 X174.505 Y121.615 E.00615
G1 X173.695 Y121.615 E.02491
G1 X173.69 Y121.815 E.00614
G1 X173.31 Y121.814 E.01169
G1 X173.303 Y121.615 E.00613
G1 X172.59 Y121.615 E.02189
G1 X172.59 Y123.415 E.05531
G1 X165.05 Y123.415 E.23168
; WIPE_START
M204 S6000
G1 X165.037 Y125.415 E-.76
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
G1 X164.394 Y133.429 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.5391
G1 F7255.432
M204 S6000
G1 X171.686 Y133.429 E.29483
M204 S10000
G1 X164.394 Y133.429 F42000
; LINE_WIDTH: 0.522389
G1 F7508.317
M204 S6000
G1 X164.329 Y133.352 E.00395
; LINE_WIDTH: 0.488965
G1 F8070.935
G1 X164.263 Y133.275 E.00368
; LINE_WIDTH: 0.438249
G1 F9106.348
G1 X164.197 Y133.198 E.00326
G1 X164.197 Y122.819 E.33433
; LINE_WIDTH: 0.454919
G1 F8737.899
G1 X164.249 Y122.737 E.00325
; LINE_WIDTH: 0.490095
G1 F8050.539
G1 X164.3 Y122.655 E.00353
; LINE_WIDTH: 0.525272
G1 F7463.434
G1 X164.351 Y122.573 E.00381
; LINE_WIDTH: 0.51928
G1 F7557.309
G1 X164.176 Y122.55 E.00688
; LINE_WIDTH: 0.487124
G1 F8104.389
G1 X164 Y122.526 E.00641
G1 X163.606 Y122.571 E.01437
; LINE_WIDTH: 0.516223
G1 F7606.129
G1 X163.704 Y122.673 E.00546
; LINE_WIDTH: 0.470468
G1 F8420.117
G1 X163.803 Y122.774 E.00493
; LINE_WIDTH: 0.438099
G1 F9109.795
G1 X163.803 Y133.198 E.33567
; LINE_WIDTH: 0.456169
G1 F8711.469
G1 X163.751 Y133.274 E.0031
; LINE_WIDTH: 0.490845
G1 F8037.059
G1 X163.7 Y133.35 E.00336
; LINE_WIDTH: 0.525522
G1 F7459.567
G1 X163.649 Y133.427 E.00362
; LINE_WIDTH: 0.51928
G1 F7557.309
G1 X163.824 Y133.45 E.00688
; LINE_WIDTH: 0.486343
G1 F8118.671
G1 X164 Y133.474 E.0064
G1 X164.335 Y133.436 E.01218
M204 S10000
G1 X156.254 Y133.429 F42000
; LINE_WIDTH: 0.5391
G1 F7255.432
M204 S6000
G1 X163.589 Y133.429 E.29658
; WIPE_START
G1 X161.589 Y133.429 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X158.223 Y126.579 Z3.4 F42000
G1 X156.254 Y122.571 Z3.4
G1 Z3
G1 E.8 F1800
G1 F7255.432
M204 S6000
G1 X163.546 Y122.571 E.29483
M204 S10000
G1 X171.746 Y122.571 F42000
G1 F7255.432
M204 S6000
G1 X164.411 Y122.571 E.29658
M204 S10000
G1 X173.855 Y120.875 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X172.227 Y120.875 E.05401
G1 X171.803 Y120.451 E.01985
G1 X171.549 Y120.451 E.00845
G1 X169.88 Y122.12 E.07826
G1 X165.796 Y122.12 E.1355
G1 X164.127 Y120.451 E.07828
G1 X163.873 Y120.451 E.00842
G1 X162.204 Y122.12 E.07828
G1 X158.12 Y122.12 E.1355
G1 X156.45 Y120.45 E.07831
G1 X156.198 Y120.45 E.00839
G1 X155.773 Y120.875 E.0199
G1 X154.145 Y120.875 E.05401
; WIPE_START
G1 X155.773 Y120.875 E-.61876
G1 X156.036 Y120.612 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X155.05 Y128.18 Z3.4 F42000
G1 X154.145 Y135.125 Z3.4
G1 Z3
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X155.773 Y135.125 E.05401
G1 X156.198 Y135.55 E.01991
G1 X156.45 Y135.55 E.00838
G1 X158.12 Y133.88 E.07831
G1 X162.204 Y133.88 E.1355
G1 X163.874 Y135.55 E.07831
G1 X164.126 Y135.55 E.00838
G1 X165.796 Y133.88 E.07831
G1 X169.88 Y133.88 E.1355
G1 X171.55 Y135.55 E.07831
G1 X171.802 Y135.55 E.00838
G1 X172.227 Y135.125 E.01991
G1 X173.855 Y135.125 E.05401
; OBJECT_ID: 405
; WIPE_START
G1 X172.227 Y135.125 E-.61876
G1 X171.964 Y135.388 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X164.623 Y133.299 Z3.4 F42000
G1 X128.598 Y123.048 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X128.598 Y132.952 E.32854
G1 X136.198 Y132.952 E.25211
G1 X136.198 Y134.727 E.05888
G1 X139.397 Y134.727 E.10611
G3 X138.392 Y135.898 I-1.011 J.149 E.05798
G1 X125.802 Y135.898 E.41764
G1 X125.802 Y132.952 E.09772
G1 X127.402 Y132.952 E.05307
G1 X127.402 Y123.048 E.32854
G1 X119.802 Y123.048 E.25211
G1 X119.802 Y121.273 E.05888
G1 X116.603 Y121.273 E.10611
G3 X117.615 Y120.102 I1.011 J-.149 E.05823
G1 X130.198 Y120.102 E.4174
G1 X130.198 Y123.048 E.09772
G1 X128.658 Y123.048 E.05108
M204 S250
G1 X128.99 Y123.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X128.99 Y132.56 E.28023
G1 X136.59 Y132.56 E.23353
G1 X136.59 Y134.335 E.05454
G1 X139.79 Y134.335 E.09831
G3 X139.783 Y135.034 I-4.898 J.307 E.02149
G3 X138.397 Y136.29 I-1.388 J-.139 E.063
G1 X125.41 Y136.29 E.39906
G1 X125.41 Y132.56 E.11461
G1 X127.01 Y132.56 E.04916
G1 X127.01 Y123.44 E.28023
G1 X119.41 Y123.44 E.23353
G1 X119.41 Y121.665 E.05454
G1 X116.21 Y121.665 E.09831
G3 X116.217 Y120.966 I4.88 J-.307 E.02149
G3 X117.605 Y119.71 I1.393 J.145 E.06302
G1 X130.59 Y119.71 E.39898
G1 X130.59 Y123.44 E.11461
G1 X129.05 Y123.44 E.04732
; WIPE_START
M204 S6000
G1 X129.037 Y125.44 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.192 Y122.145 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X129.295 Y122.145 E.03657
G1 X129.295 Y121.619 E.01745
G1 X128.127 Y120.451 E.05477
G1 X127.873 Y120.451 E.00844
G1 X126.179 Y122.145 E.07944
G1 X122.145 Y122.145 E.13384
G1 X120.455 Y120.455 E.07929
G1 X120.193 Y120.455 E.00866
G1 X119.723 Y120.925 E.02205
G1 X118.095 Y120.925 E.05401
; WIPE_START
G1 X119.723 Y120.925 E-.61876
G1 X119.986 Y120.662 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.878 Y127.227 Z3.4 F42000
G1 X127.808 Y133.855 Z3.4
G1 Z3
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X126.705 Y133.855 E.03657
G1 X126.705 Y134.381 E.01745
G1 X127.874 Y135.55 E.05481
G1 X128.126 Y135.55 E.00838
G1 X129.821 Y133.855 E.07949
G1 X133.855 Y133.855 E.13384
G1 X135.55 Y135.55 E.07949
G1 X135.802 Y135.55 E.00838
G1 X136.277 Y135.075 E.02225
G1 X137.905 Y135.075 E.05401
M204 S10000
G1 X128.394 Y133.404 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.5391
G1 F7255.432
M204 S6000
G1 X135.686 Y133.404 E.29483
M204 S10000
G1 X128.394 Y133.404 F42000
; LINE_WIDTH: 0.522389
G1 F7508.317
M204 S6000
G1 X128.329 Y133.327 E.00395
; LINE_WIDTH: 0.488965
G1 F8070.935
G1 X128.263 Y133.25 E.00368
; LINE_WIDTH: 0.43825
G1 F9106.329
G1 X128.197 Y133.173 E.00326
G1 X128.197 Y122.844 E.33272
; LINE_WIDTH: 0.454919
G1 F8737.899
G1 X128.249 Y122.762 E.00325
; LINE_WIDTH: 0.490095
G1 F8050.539
G1 X128.3 Y122.68 E.00353
; LINE_WIDTH: 0.525272
G1 F7463.434
G1 X128.351 Y122.598 E.00381
; LINE_WIDTH: 0.51928
G1 F7557.309
G1 X128.176 Y122.575 E.00688
; LINE_WIDTH: 0.487124
G1 F8104.389
G1 X128 Y122.551 E.00641
G1 X127.606 Y122.596 E.01437
; LINE_WIDTH: 0.516223
G1 F7606.129
G1 X127.704 Y122.698 E.00546
; LINE_WIDTH: 0.470468
G1 F8420.117
G1 X127.803 Y122.799 E.00493
; LINE_WIDTH: 0.438099
G1 F9109.793
G1 X127.803 Y133.173 E.33406
; LINE_WIDTH: 0.414507
G1 F9688.184
G1 X127.744 Y133.208 E.00207
; LINE_WIDTH: 0.36586
G1 F11147.581
G1 X127.686 Y133.243 E.0018
; LINE_WIDTH: 0.317214
G1 F12000
G1 X127.627 Y133.279 E.00153
; LINE_WIDTH: 0.29103
G3 X126.594 Y133.28 I-.527 J-11.992 E.02089
; LINE_WIDTH: 0.315519
G1 X126.526 Y133.304 E.00162
; LINE_WIDTH: 0.364535
G1 F11193.508
G1 X126.457 Y133.329 E.00191
; LINE_WIDTH: 0.413552
G1 F9713.147
G1 X126.389 Y133.353 E.0022
; LINE_WIDTH: 0.46139
G1 F8602.767
G1 X126.319 Y133.377 E.0025
; LINE_WIDTH: 0.50805
G1 F7739.771
G1 X126.25 Y133.4 E.00278
; LINE_WIDTH: 0.53428
G1 F7326.603
G1 X126.273 Y133.651 E.01009
G1 X126.375 Y133.525 E.00648
; LINE_WIDTH: 0.507343
G1 F7751.554
G1 X126.419 Y133.526 E.00166
; LINE_WIDTH: 0.459269
G1 F8646.592
G1 X126.463 Y133.526 E.00149
; LINE_WIDTH: 0.411195
G1 F9775.304
G1 X126.507 Y133.527 E.00132
; LINE_WIDTH: 0.363121
G1 F11242.938
G1 X126.551 Y133.527 E.00114
; LINE_WIDTH: 0.292009
G1 F12000
G2 X127.606 Y133.528 I.549 J-49.165 E.02141
; LINE_WIDTH: 0.315819
G1 X127.751 Y133.505 E.00328
; LINE_WIDTH: 0.365437
G1 F11162.202
G1 X127.897 Y133.482 E.00388
; LINE_WIDTH: 0.415055
G1 F9673.909
G1 X128.043 Y133.459 E.00448
; LINE_WIDTH: 0.464673
G1 F8535.802
G1 X128.189 Y133.436 E.00508
; LINE_WIDTH: 0.514291
G1 F7637.296
G1 X128.335 Y133.413 E.00567
M204 S10000
G1 X126.254 Y135.446 F42000
; LINE_WIDTH: 0.5391
G1 F7255.431
M204 S6000
G1 X126.261 Y133.71 E.07022
; WIPE_START
G1 X126.254 Y135.446 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.025 Y128.531 Z3.4 F42000
G1 X120.254 Y122.596 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.5391
G1 F7255.432
M204 S6000
G1 X127.546 Y122.596 E.29483
M204 S10000
G1 X129.746 Y120.554 F42000
G1 F7255.432
M204 S6000
G1 X129.746 Y122.256 E.0688
; LINE_WIDTH: 0.56234
G1 F6930.808
G1 X129.723 Y122.346 E.00395
; LINE_WIDTH: 0.60882
G1 F6361.549
G1 X129.7 Y122.436 E.0043
; LINE_WIDTH: 0.6553
G1 F5878.703
G1 X129.677 Y122.527 E.00466
G1 X129.586 Y122.55 E.00466
; LINE_WIDTH: 0.60882
G1 F6361.549
G1 X129.496 Y122.573 E.0043
; LINE_WIDTH: 0.541094
G1 F7226.397
G1 X129.406 Y122.596 E.00379
G1 X128.411 Y122.596 E.04037
; OBJECT_ID: 394
; WIPE_START
G1 X129.406 Y122.596 E-.69481
G1 X129.496 Y122.573 E-.06519
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X122.348 Y125.248 Z3.4 F42000
G1 X97.79 Y134.44 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X103.41 Y134.44 E.17269
G1 X103.41 Y135.66 E.03749
G1 X97.79 Y135.66 E.17269
G1 X97.79 Y134.5 E.03564
; WIPE_START
M204 S6000
G1 X99.79 Y134.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.622 Y126.936 Z3.4 F42000
G1 X97.79 Y121.56 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X97.79 Y120.34 E.03749
G1 X103.41 Y120.34 E.17269
G1 X103.41 Y121.56 E.03749
G1 X97.85 Y121.56 E.17084
M204 S10000
G1 X97.398 Y121.56 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.398 Y121.952 E.01301
G1 X100.198 Y121.952 E.09288
G1 X100.198 Y123.073 E.03718
G1 X92.598 Y123.073 E.25211
G1 X92.598 Y132.927 E.32688
G1 X100.198 Y132.927 E.25211
G1 X100.198 Y134.048 E.03718
G1 X97.398 Y134.048 E.09288
G1 X97.398 Y135.898 E.06137
G1 X86.602 Y135.898 E.35812
G1 X86.602 Y134.048 E.06137
G1 X83.802 Y134.048 E.09288
G1 X83.802 Y132.927 E.03718
G1 X91.402 Y132.927 E.25211
G1 X91.402 Y123.073 E.32688
G1 X83.802 Y123.073 E.25211
G1 X83.802 Y121.952 E.03718
G1 X86.602 Y121.952 E.09288
G1 X86.602 Y120.102 E.06136
G1 X97.398 Y120.103 E.35812
G1 X97.398 Y121.5 E.04634
; WIPE_START
G1 X97.398 Y121.952 E-.17179
G1 X98.946 Y121.952 E-.58821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.317 Y121.717 Z3.4 F42000
G1 X86.21 Y121.56 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X80.59 Y121.56 E.17269
G1 X80.59 Y120.34 E.03749
G1 X86.21 Y120.34 E.17269
G1 X86.21 Y121.5 E.03564
; WIPE_START
M204 S6000
G1 X84.21 Y121.521 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.378 Y129.064 Z3.4 F42000
G1 X86.21 Y134.44 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X86.21 Y135.66 E.03749
G1 X80.59 Y135.66 E.17269
G1 X80.59 Y134.44 E.03749
G1 X86.15 Y134.44 E.17084
; WIPE_START
M204 S6000
G1 X86.21 Y135.66 E-.46416
G1 X85.431 Y135.66 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.452 Y129.173 Z3.4 F42000
G1 X92.99 Y123.465 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X92.99 Y132.535 E.2787
G1 X100.59 Y132.535 E.23353
G1 X100.59 Y134.31 E.05454
G1 X103.56 Y134.31 E.09126
G1 X103.56 Y133.835 E.0146
G1 X103.79 Y133.835 E.00706
G1 X103.788 Y134.968 E.03481
G3 X102.397 Y136.29 I-1.398 J-.078 E.06497
G1 X81.605 Y136.29 E.63887
G3 X80.21 Y134.897 I.004 J-1.399 E.06722
G1 X80.21 Y133.835 E.03264
G1 X80.44 Y133.835 E.00707
G1 X80.44 Y134.31 E.0146
G1 X83.41 Y134.31 E.09126
G1 X83.41 Y132.535 E.05454
G1 X91.01 Y132.535 E.23353
G1 X91.01 Y123.465 E.2787
G1 X83.41 Y123.465 E.23353
G1 X83.41 Y121.69 E.05454
G1 X80.44 Y121.69 E.09126
G1 X80.44 Y122.165 E.0146
G1 X80.21 Y122.165 E.00706
G1 X80.212 Y121.032 E.03481
G3 X81.603 Y119.71 I1.398 J.078 E.06497
G1 X102.446 Y119.711 E.64045
G3 X103.79 Y121.105 I-.055 J1.398 E.06571
G1 X103.79 Y122.165 E.03256
G1 X103.56 Y122.165 E.00707
G1 X103.56 Y121.69 E.0146
G1 X100.59 Y121.69 E.09126
G1 X100.59 Y123.465 E.05454
G1 X93.05 Y123.465 E.23168
; WIPE_START
M204 S6000
G1 X93.037 Y125.465 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.526 Y122.17 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X90.154 Y122.17 E.05401
M73 P56 R10
G1 X91.873 Y120.451 E.08063
G1 X92.127 Y120.451 E.00842
G1 X93.846 Y122.17 E.08063
G1 X95.474 Y122.17 E.05401
; WIPE_START
G1 X93.846 Y122.17 E-.61876
G1 X93.583 Y121.907 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.594 Y120.025 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.278778
G1 F15000
M204 S6000
G1 X102.435 Y120.026 E.09304
G3 X102.713 Y120.048 I-.073 J2.656 E.00536
; LINE_WIDTH: 0.215167
G1 X103.057 Y120.108 E.0049
; WIPE_START
G1 X102.713 Y120.048 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.164 Y126.805 Z3.4 F42000
G1 X95.474 Y133.83 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X93.846 Y133.83 E.05401
G1 X92.126 Y135.55 E.08066
G1 X91.874 Y135.55 E.00838
G1 X90.154 Y133.83 E.08066
G1 X88.526 Y133.83 E.05401
; WIPE_START
G1 X90.154 Y133.83 E-.61876
G1 X90.417 Y134.093 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.406 Y135.975 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279758
G1 F15000
M204 S6000
G1 X81.613 Y135.975 E.0925
G3 X81.276 Y135.951 I.016 J-2.544 E.00652
; LINE_WIDTH: 0.224857
G1 X80.944 Y135.897 E.005
; WIPE_START
G1 X81.276 Y135.951 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.712 Y134.23 Z3.4 F42000
G1 X92.394 Y133.379 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.53908
G1 F7255.728
M204 S6000
G1 X96.878 Y133.379 E.18127
G1 X96.971 Y133.398 E.00387
; LINE_WIDTH: 0.514374
G1 F7635.963
G1 X97.029 Y133.49 E.00415
; LINE_WIDTH: 0.4688
G1 F8453.086
G1 X97.086 Y133.581 E.00375
; LINE_WIDTH: 0.423227
G1 F9466.044
G1 X97.143 Y133.673 E.00335
; LINE_WIDTH: 0.39168
G1 F10322.285
G1 X97.101 Y133.803 E.00388
M204 S10000
G1 X99.816 Y133.488 F42000
; LINE_WIDTH: 0.39982
G1 F10086.86
M204 S6000
G1 X99.816 Y133.309 E.00519
G1 X97.356 Y133.309 E.07155
; LINE_WIDTH: 0.42271
G1 F9478.923
G1 X97.228 Y133.339 E.00407
; LINE_WIDTH: 0.46849
G1 F8459.243
G1 X97.1 Y133.368 E.00456
; LINE_WIDTH: 0.517593
G1 F7584.178
G1 X96.971 Y133.398 E.00509
G1 X97.145 Y133.57 E.00945
; LINE_WIDTH: 0.48474
G1 F8148.114
G1 X97.144 Y133.605 E.00123
; LINE_WIDTH: 0.45102
G1 F8821.367
G1 X97.144 Y133.639 E.00114
; LINE_WIDTH: 0.4173
G1 F9615.898
G1 X97.143 Y133.673 E.00105
G1 X97.176 Y133.654 E.00116
; LINE_WIDTH: 0.45102
G1 F8821.367
G1 X97.209 Y133.634 E.00127
; LINE_WIDTH: 0.48474
G1 F8148.114
G1 X97.242 Y133.615 E.00137
; LINE_WIDTH: 0.484637
G1 F8150.02
G1 X97.305 Y133.632 E.00236
; LINE_WIDTH: 0.45071
G1 F8828.074
G1 X97.368 Y133.649 E.00218
; LINE_WIDTH: 0.400253
G1 F10074.649
G1 X97.431 Y133.666 E.00191
G1 X99.816 Y133.666 E.06943
G1 X99.816 Y133.548 E.00345
M204 S10000
G1 X92.394 Y133.379 F42000
; LINE_WIDTH: 0.522389
G1 F7508.317
M204 S6000
G1 X92.329 Y133.302 E.00395
; LINE_WIDTH: 0.488965
G1 F8070.935
G1 X92.263 Y133.225 E.00368
; LINE_WIDTH: 0.438269
G1 F9105.877
G1 X92.197 Y133.148 E.00326
G1 X92.197 Y122.824 E.3326
; LINE_WIDTH: 0.428167
G1 F9344.672
G1 X92.247 Y122.804 E.00167
; LINE_WIDTH: 0.388979
G1 F10402.858
G1 X92.296 Y122.785 E.0015
; LINE_WIDTH: 0.349792
G1 F11731.304
G1 X92.345 Y122.765 E.00133
; LINE_WIDTH: 0.29124
G1 F12000
G1 X92.394 Y122.745 E.00107
G1 X96.878 Y122.745 E.09072
; LINE_WIDTH: 0.304925
G1 X96.981 Y122.731 E.00221
; LINE_WIDTH: 0.332755
G1 X97.083 Y122.718 E.00245
; LINE_WIDTH: 0.368916
G1 F11043.081
G1 X97.115 Y122.695 E.00103
; LINE_WIDTH: 0.413408
G1 F9716.913
G1 X97.147 Y122.673 E.00117
; LINE_WIDTH: 0.4579
G1 F8675.117
G1 X97.178 Y122.651 E.00131
; LINE_WIDTH: 0.502392
G1 F7835.081
G1 X97.21 Y122.629 E.00145
; LINE_WIDTH: 0.546884
G1 F7143.368
G1 X97.242 Y122.606 E.00159
; LINE_WIDTH: 0.547967
G1 F7128.06
G1 X97.289 Y122.627 E.00214
; LINE_WIDTH: 0.505639
G1 F7780.105
G1 X97.337 Y122.649 E.00196
; LINE_WIDTH: 0.463312
G1 F8563.451
G1 X97.384 Y122.67 E.00178
; LINE_WIDTH: 0.400033
G1 F10080.863
G1 X97.431 Y122.691 E.00151
G1 X99.816 Y122.691 E.06939
G1 X99.816 Y122.334 E.01039
G1 X97.431 Y122.334 E.06939
; LINE_WIDTH: 0.420984
G1 F9522.203
G1 X97.384 Y122.355 E.0016
; LINE_WIDTH: 0.463312
G1 F8563.451
G1 X97.337 Y122.376 E.00178
; LINE_WIDTH: 0.505639
G1 F7780.105
G1 X97.289 Y122.398 E.00196
; LINE_WIDTH: 0.547967
G1 F7128.06
G1 X97.242 Y122.419 E.00214
; LINE_WIDTH: 0.548042
G1 F7127.002
G1 X97.217 Y122.396 E.00139
; LINE_WIDTH: 0.505864
G1 F7776.323
G1 X97.192 Y122.373 E.00127
; LINE_WIDTH: 0.463687
G1 F8555.819
G1 X97.168 Y122.35 E.00116
; LINE_WIDTH: 0.421509
G1 F9508.999
G1 X97.143 Y122.327 E.00104
G1 X97.15 Y122.358 E.00098
; LINE_WIDTH: 0.463687
G1 F8555.819
G1 X97.157 Y122.389 E.00109
; LINE_WIDTH: 0.505864
G1 F7776.323
G1 X97.164 Y122.42 E.0012
; LINE_WIDTH: 0.548042
G1 F7127.002
G1 X97.17 Y122.452 E.00131
; LINE_WIDTH: 0.545954
G1 F7156.584
G1 X97.122 Y122.459 E.00202
; LINE_WIDTH: 0.4996
G1 F7882.981
G1 X97.073 Y122.467 E.00184
; LINE_WIDTH: 0.453247
G1 F8773.497
G1 X97.024 Y122.474 E.00165
; LINE_WIDTH: 0.406894
G1 F9890.834
G1 X96.975 Y122.482 E.00146
; LINE_WIDTH: 0.36054
G1 F11334.299
G1 X96.927 Y122.49 E.00128
; LINE_WIDTH: 0.291263
G1 F12000
G1 X92.394 Y122.497 E.09172
; LINE_WIDTH: 0.315819
G1 X92.237 Y122.522 E.00355
; LINE_WIDTH: 0.365437
G1 F11162.202
G1 X92.079 Y122.547 E.0042
; LINE_WIDTH: 0.415055
G1 F9673.909
G1 X91.921 Y122.572 E.00484
; LINE_WIDTH: 0.464673
G1 F8535.802
G1 X91.763 Y122.596 E.00549
; LINE_WIDTH: 0.500963
G1 F7859.535
G1 X91.606 Y122.621 E.00596
G1 X91.803 Y122.824 E.01055
; LINE_WIDTH: 0.4381
G1 F9109.778
G1 X91.803 Y133.148 E.33246
; LINE_WIDTH: 0.414507
G1 F9688.184
G1 X91.744 Y133.183 E.00207
; LINE_WIDTH: 0.36586
G1 F11147.581
G1 X91.686 Y133.218 E.0018
; LINE_WIDTH: 0.317214
G1 F12000
G1 X91.627 Y133.254 E.00153
; LINE_WIDTH: 0.291015
G1 X87.122 Y133.255 E.09108
; LINE_WIDTH: 0.304925
G1 X87.019 Y133.269 E.00221
; LINE_WIDTH: 0.332755
G1 X86.917 Y133.282 E.00245
; LINE_WIDTH: 0.368916
G1 F11043.081
G1 X86.885 Y133.305 E.00103
; LINE_WIDTH: 0.413408
G1 F9716.913
G1 X86.853 Y133.327 E.00117
; LINE_WIDTH: 0.4579
G1 F8675.117
G1 X86.822 Y133.349 E.00131
; LINE_WIDTH: 0.502392
G1 F7835.081
G1 X86.79 Y133.371 E.00145
; LINE_WIDTH: 0.546884
G1 F7143.368
G1 X86.758 Y133.394 E.00159
; LINE_WIDTH: 0.547967
G1 F7128.06
G1 X86.711 Y133.373 E.00214
; LINE_WIDTH: 0.505639
G1 F7780.105
G1 X86.663 Y133.351 E.00196
; LINE_WIDTH: 0.463312
G1 F8563.451
G1 X86.616 Y133.33 E.00178
; LINE_WIDTH: 0.400033
G1 F10080.863
G1 X86.569 Y133.309 E.00151
G1 X84.184 Y133.309 E.06939
G1 X84.184 Y133.666 E.01039
G1 X86.569 Y133.666 E.06939
; LINE_WIDTH: 0.420984
G1 F9522.203
G1 X86.616 Y133.645 E.0016
; LINE_WIDTH: 0.463312
G1 F8563.451
G1 X86.663 Y133.624 E.00178
; LINE_WIDTH: 0.505639
G1 F7780.105
G1 X86.711 Y133.602 E.00196
; LINE_WIDTH: 0.547967
G1 F7128.06
G1 X86.758 Y133.581 E.00214
; LINE_WIDTH: 0.548047
G1 F7126.931
G1 X86.783 Y133.604 E.00139
; LINE_WIDTH: 0.505879
G1 F7776.071
G1 X86.808 Y133.627 E.00127
; LINE_WIDTH: 0.463712
G1 F8555.311
G1 X86.832 Y133.65 E.00115
; LINE_WIDTH: 0.421544
G1 F9508.12
G1 X86.857 Y133.673 E.00104
G1 X86.85 Y133.642 E.00098
; LINE_WIDTH: 0.463712
G1 F8555.311
G1 X86.843 Y133.611 E.00109
; LINE_WIDTH: 0.505879
G1 F7776.071
G1 X86.836 Y133.58 E.0012
; LINE_WIDTH: 0.548047
G1 F7126.931
G1 X86.83 Y133.548 E.00131
; LINE_WIDTH: 0.545954
G1 F7156.584
G1 X86.878 Y133.541 E.00202
; LINE_WIDTH: 0.4996
G1 F7882.981
G1 X86.927 Y133.533 E.00184
; LINE_WIDTH: 0.453247
G1 F8773.497
G1 X86.976 Y133.526 E.00165
; LINE_WIDTH: 0.406894
G1 F9890.834
G1 X87.025 Y133.518 E.00146
; LINE_WIDTH: 0.36054
G1 F11334.299
G1 X87.073 Y133.51 E.00128
; LINE_WIDTH: 0.291263
G1 F12000
G1 X91.606 Y133.503 E.09172
; LINE_WIDTH: 0.315819
G1 X91.752 Y133.48 E.00328
; LINE_WIDTH: 0.365437
G1 F11162.202
G1 X91.897 Y133.457 E.00388
; LINE_WIDTH: 0.415055
G1 F9673.909
G1 X92.043 Y133.434 E.00448
; LINE_WIDTH: 0.464673
G1 F8535.802
G1 X92.189 Y133.411 E.00508
; LINE_WIDTH: 0.514291
G1 F7637.296
G1 X92.335 Y133.388 E.00567
M204 S10000
G1 X86.918 Y133.86 F42000
; LINE_WIDTH: 0.39169
G1 F10321.988
M204 S6000
G1 X86.875 Y133.73 E.00388
; WIPE_START
G1 X86.918 Y133.86 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.993 Y126.228 Z3.4 F42000
G1 X87.029 Y122.602 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.553145
G1 F7055.711
M204 S6000
G1 X86.83 Y122.452 E.01037
; LINE_WIDTH: 0.548042
G1 F7127.002
G1 X86.836 Y122.42 E.00131
; LINE_WIDTH: 0.505864
G1 F7776.323
G1 X86.843 Y122.389 E.0012
; LINE_WIDTH: 0.463687
G1 F8555.819
G1 X86.85 Y122.358 E.00109
; LINE_WIDTH: 0.421509
G1 F9508.999
G1 X86.857 Y122.327 E.00098
G1 X86.832 Y122.35 E.00104
; LINE_WIDTH: 0.463687
G1 F8555.819
G1 X86.808 Y122.373 E.00116
; LINE_WIDTH: 0.505864
G1 F7776.323
G1 X86.783 Y122.396 E.00127
; LINE_WIDTH: 0.548042
G1 F7127.002
G1 X86.758 Y122.419 E.00139
; LINE_WIDTH: 0.547968
G1 F7128.043
G1 X86.73 Y122.398 E.00146
; LINE_WIDTH: 0.505643
G1 F7780.041
G1 X86.701 Y122.376 E.00134
; LINE_WIDTH: 0.463318
G1 F8563.324
G1 X86.673 Y122.355 E.00122
; LINE_WIDTH: 0.399972
G1 F10082.579
G1 X86.644 Y122.334 E.00103
G1 X84.184 Y122.334 E.07158
G1 X84.184 Y122.691 E.01038
G1 X86.644 Y122.691 E.07158
; LINE_WIDTH: 0.420993
G1 F9521.983
G1 X86.673 Y122.67 E.00109
; LINE_WIDTH: 0.463318
G1 F8563.324
G1 X86.701 Y122.649 E.00122
; LINE_WIDTH: 0.505643
G1 F7780.041
G1 X86.73 Y122.627 E.00134
; LINE_WIDTH: 0.530179
G1 F7388.276
G1 X86.758 Y122.606 E.00141
G1 X86.786 Y122.635 E.00157
G1 X86.969 Y122.61 E.00735
M204 S10000
G1 X86.918 Y122.14 F42000
; LINE_WIDTH: 0.39167
G1 F10322.58
M204 S6000
G1 X86.857 Y122.327 E.00559
; LINE_WIDTH: 0.42321
G1 F9466.46
G1 X86.914 Y122.419 E.00335
; LINE_WIDTH: 0.46879
G1 F8453.284
G1 X86.971 Y122.51 E.00375
; LINE_WIDTH: 0.538503
G1 F7264.181
G2 X87.122 Y122.621 I.128 J-.017 E.00846
G1 X91.546 Y122.621 E.17863
M204 S10000
G1 X97.082 Y122.14 F42000
; LINE_WIDTH: 0.39167
G1 F10322.58
M204 S6000
G1 X97.125 Y122.27 E.00388
; WIPE_START
G1 X97.082 Y122.14 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.595 Y120.657 Z3.4 F42000
G1 X86.406 Y120.025 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279367
G1 F15000
M204 S6000
G1 X81.552 Y120.026 E.09352
G2 X81.332 Y120.042 I.056 J2.26 E.00426
; LINE_WIDTH: 0.237568
G1 X81.266 Y120.051 E.00106
; LINE_WIDTH: 0.211941
G1 X80.943 Y120.108 E.00452
; WIPE_START
G1 X81.266 Y120.051 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.73 Y125.38 Z3.4 F42000
G1 X97.594 Y135.975 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.279522
G1 F15000
M204 S6000
G1 X102.448 Y135.974 E.09358
G2 X102.665 Y135.958 I-.054 J-2.225 E.0042
; LINE_WIDTH: 0.231398
G1 X102.774 Y135.942 E.00169
; LINE_WIDTH: 0.196999
G1 X103.056 Y135.887 E.00361
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X102.774 Y135.942 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 16/42
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z3.4 I.249 J1.191 P1  F42000
G1 X164.598 Y123.023 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X164.598 Y132.977 E.3302
G1 X172.198 Y132.977 E.25211
G1 X172.198 Y134.777 E.05971
G1 X175.397 Y134.777 E.1061
G3 X174.392 Y135.898 I-1.002 J.113 E.05636
G1 X153.615 Y135.898 E.68922
G3 X152.604 Y134.777 I.001 J-1.018 E.05642
G1 X155.802 Y134.777 E.1061
G1 X155.802 Y132.977 E.05971
G1 X163.402 Y132.977 E.25211
G1 X163.402 Y123.023 E.3302
G1 X155.802 Y123.023 E.25211
G1 X155.802 Y121.223 E.05971
G1 X152.603 Y121.223 E.1061
G3 X153.608 Y120.102 I1.005 J-.11 E.05631
G1 X174.432 Y120.103 E.69078
G3 X175.403 Y121.223 I-.039 J1.015 E.05511
G1 X172.198 Y121.223 E.10633
G1 X172.198 Y123.023 E.05971
G1 X164.658 Y123.023 E.25012
M204 S250
G1 X164.99 Y123.415 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X164.99 Y132.585 E.28177
G1 X172.59 Y132.585 E.23353
G1 X172.59 Y134.385 E.05531
G1 X173.302 Y134.385 E.02189
G1 X173.31 Y134.185 E.00615
G1 X173.69 Y134.185 E.01169
G1 X173.695 Y134.385 E.00615
G1 X174.502 Y134.385 E.02482
G1 X174.51 Y134.185 E.00615
G1 X174.89 Y134.185 E.01169
G1 X174.895 Y134.385 E.00615
G1 X175.79 Y134.385 E.0275
G3 X175.783 Y135.034 I-4.551 J.282 E.01997
G3 X174.397 Y136.29 I-1.388 J-.14 E.06298
G1 X153.605 Y136.29 E.63887
G3 X152.212 Y134.968 I-.001 J-1.395 E.06509
G1 X152.21 Y134.385 E.01793
G1 X153.102 Y134.385 E.02741
G1 X153.11 Y134.185 E.00615
G1 X153.49 Y134.185 E.01169
G1 X153.495 Y134.385 E.00615
G1 X154.305 Y134.385 E.02491
G1 X154.31 Y134.185 E.00614
G1 X154.69 Y134.186 E.01169
G1 X154.697 Y134.385 E.00613
G1 X155.41 Y134.385 E.02189
G1 X155.41 Y132.585 E.05531
G1 X163.01 Y132.585 E.23353
G1 X163.01 Y123.415 E.28177
G1 X155.41 Y123.415 E.23353
G1 X155.41 Y121.615 E.05531
G1 X154.697 Y121.615 E.02189
G1 X154.69 Y121.815 E.00615
G1 X154.31 Y121.815 E.01169
G1 X154.305 Y121.615 E.00615
G1 X153.497 Y121.615 E.02482
G1 X153.49 Y121.815 E.00615
G1 X153.11 Y121.815 E.01169
G1 X153.105 Y121.615 E.00615
G1 X152.21 Y121.615 E.0275
G3 X152.217 Y120.966 I4.549 J-.282 E.01997
G3 X153.603 Y119.71 I1.388 J.14 E.06298
G1 X174.444 Y119.711 E.64039
G3 X175.79 Y121.105 I-.044 J1.39 E.06588
G1 X175.79 Y121.615 E.01566
G1 X174.897 Y121.615 E.02743
G1 X174.89 Y121.815 E.00615
G1 X174.51 Y121.815 E.01169
G1 X174.505 Y121.615 E.00615
G1 X173.695 Y121.615 E.02491
G1 X173.69 Y121.815 E.00614
G1 X173.31 Y121.814 E.01169
G1 X173.302 Y121.615 E.00613
G1 X172.59 Y121.615 E.02189
G1 X172.59 Y123.415 E.05531
G1 X165.05 Y123.415 E.23168
; WIPE_START
M204 S6000
G1 X165.037 Y125.415 E-.76
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
G1 X164.25 Y129.878 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X164.25 Y128.25 E.05401
G1 X163.75 Y127.75 E.02343
G1 X163.75 Y128.25 E.01656
G1 X164.25 Y127.75 E.02343
G1 X164.25 Y126.122 E.05401
; WIPE_START
G1 X164.25 Y127.75 E-.61876
G1 X163.987 Y128.013 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.808 Y123.532 Z3.6 F42000
G1 X154.145 Y120.875 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X155.773 Y120.875 E.05401
G1 X156.198 Y120.45 E.0199
G1 X156.45 Y120.45 E.00839
G1 X158.675 Y122.675 E.10434
G1 X161.649 Y122.675 E.09868
G1 X163.873 Y120.451 E.10432
G1 X164.127 Y120.451 E.00842
G1 X166.351 Y122.675 E.10432
G1 X169.325 Y122.675 E.09868
G1 X171.549 Y120.451 E.1043
G1 X171.803 Y120.451 E.00845
G1 X172.227 Y120.875 E.01986
G1 X173.855 Y120.875 E.05401
; WIPE_START
G1 X172.227 Y120.875 E-.61876
G1 X171.964 Y120.612 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X172.95 Y128.18 Z3.6 F42000
G1 X173.855 Y135.125 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X172.227 Y135.125 E.05401
G1 X171.802 Y135.55 E.01991
G1 X171.55 Y135.55 E.00838
G1 X169.325 Y133.325 E.10435
G1 X166.351 Y133.325 E.09868
G1 X164.126 Y135.55 E.10435
G1 X163.874 Y135.55 E.00838
G1 X161.649 Y133.325 E.10435
G1 X158.675 Y133.325 E.09868
G1 X156.45 Y135.55 E.10435
G1 X156.198 Y135.55 E.00838
G1 X155.773 Y135.125 E.01991
G1 X154.145 Y135.125 E.05401
; OBJECT_ID: 405
; WIPE_START
G1 X155.773 Y135.125 E-.61876
G1 X156.036 Y135.388 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X149.075 Y132.258 Z3.6 F42000
G1 X128.598 Y123.048 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X128.598 Y132.952 E.32854
G1 X136.198 Y132.952 E.25211
G1 X136.198 Y134.727 E.05888
G1 X139.397 Y134.727 E.10611
G3 X138.392 Y135.898 I-1.011 J.149 E.05798
G1 X125.802 Y135.898 E.41764
G1 X125.802 Y132.952 E.09772
G1 X127.402 Y132.952 E.05307
G1 X127.402 Y123.048 E.32854
G1 X119.802 Y123.048 E.25211
G1 X119.802 Y121.273 E.05888
G1 X116.603 Y121.273 E.10611
G3 X117.615 Y120.102 I1.011 J-.149 E.05823
G1 X130.198 Y120.102 E.4174
G1 X130.198 Y123.048 E.09772
G1 X128.658 Y123.048 E.05108
M204 S250
G1 X128.99 Y123.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X128.99 Y132.56 E.28023
G1 X136.59 Y132.56 E.23353
G1 X136.59 Y134.335 E.05454
G1 X139.79 Y134.335 E.09831
G3 X139.783 Y135.034 I-4.885 J.307 E.02149
G3 X138.397 Y136.29 I-1.388 J-.139 E.063
G1 X125.41 Y136.29 E.39906
G1 X125.41 Y132.56 E.11461
G1 X127.01 Y132.56 E.04916
G1 X127.01 Y123.44 E.28023
G1 X119.41 Y123.44 E.23353
G1 X119.41 Y121.665 E.05454
G1 X116.21 Y121.665 E.09831
G3 X116.217 Y120.966 I4.88 J-.307 E.02149
G3 X117.605 Y119.71 I1.393 J.145 E.06302
G1 X130.59 Y119.71 E.39898
G1 X130.59 Y123.44 E.11461
G1 X129.05 Y123.44 E.04732
; WIPE_START
M204 S6000
G1 X129.037 Y125.44 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.25 Y129.878 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X128.25 Y128.25 E.05401
G1 X127.75 Y127.75 E.02343
G1 X127.75 Y128.25 E.01656
G1 X128.25 Y127.75 E.02343
G1 X128.25 Y122.7 E.16754
G1 X129.85 Y122.7 E.05307
G1 X129.85 Y122.174 E.01745
G1 X128.127 Y120.451 E.08081
G1 X127.873 Y120.451 E.00844
G1 X125.624 Y122.7 E.10547
G1 X122.7 Y122.7 E.09702
G1 X120.455 Y120.455 E.10532
G1 X120.193 Y120.455 E.00867
G1 X119.723 Y120.925 E.02204
G1 X118.095 Y120.925 E.05401
; WIPE_START
G1 X119.723 Y120.925 E-.61876
G1 X119.986 Y120.662 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.933 Y125.446 Z3.6 F42000
G1 X137.905 Y135.075 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X136.277 Y135.075 E.05401
G1 X135.802 Y135.55 E.02225
G1 X135.55 Y135.55 E.00838
G1 X133.3 Y133.3 E.10552
G1 X130.376 Y133.3 E.09702
G1 X128.126 Y135.55 E.10552
G1 X127.874 Y135.55 E.00838
G1 X126.15 Y133.826 E.08085
G1 X126.15 Y133.3 E.01745
G1 X127.253 Y133.3 E.03657
; OBJECT_ID: 394
; WIPE_START
G1 X126.15 Y133.3 E-.4189
G1 X126.15 Y133.826 E-.19986
G1 X126.413 Y134.089 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X118.781 Y134.183 Z3.6 F42000
G1 X97.79 Y134.44 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X103.41 Y134.44 E.17269
G1 X103.41 Y135.66 E.03749
G1 X97.79 Y135.66 E.17269
G1 X97.79 Y134.5 E.03564
; WIPE_START
M204 S6000
G1 X99.79 Y134.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.622 Y126.936 Z3.6 F42000
G1 X97.79 Y121.56 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X97.79 Y120.34 E.03749
G1 X103.41 Y120.34 E.17269
G1 X103.41 Y121.56 E.03749
G1 X97.85 Y121.56 E.17084
M204 S10000
G1 X97.398 Y121.56 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.398 Y121.952 E.01301
G1 X100.198 Y121.952 E.09288
G1 X100.198 Y123.073 E.03718
G1 X92.598 Y123.073 E.25211
G1 X92.598 Y132.927 E.32688
G1 X100.198 Y132.927 E.25211
G1 X100.198 Y134.048 E.03718
G1 X97.398 Y134.048 E.09288
G1 X97.398 Y135.898 E.06137
G1 X86.602 Y135.898 E.35812
G1 X86.602 Y134.048 E.06137
G1 X83.802 Y134.048 E.09288
G1 X83.802 Y132.927 E.03718
G1 X91.402 Y132.927 E.25211
G1 X91.402 Y123.073 E.32688
M73 P57 R10
G1 X83.802 Y123.073 E.25211
G1 X83.802 Y121.952 E.03718
G1 X86.602 Y121.952 E.09288
G1 X86.602 Y120.102 E.06136
G1 X97.398 Y120.103 E.35812
G1 X97.398 Y121.5 E.04634
; WIPE_START
G1 X97.398 Y121.952 E-.17179
G1 X98.946 Y121.952 E-.58821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.317 Y121.717 Z3.6 F42000
G1 X86.21 Y121.56 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X80.59 Y121.56 E.17269
G1 X80.59 Y120.34 E.03749
G1 X86.21 Y120.34 E.17269
G1 X86.21 Y121.5 E.03564
; WIPE_START
M204 S6000
G1 X84.21 Y121.521 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.378 Y129.064 Z3.6 F42000
G1 X86.21 Y134.44 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X86.21 Y135.66 E.03749
G1 X80.59 Y135.66 E.17269
G1 X80.59 Y134.44 E.03749
G1 X86.15 Y134.44 E.17084
; WIPE_START
M204 S6000
G1 X86.21 Y135.66 E-.46416
G1 X85.431 Y135.66 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.452 Y129.173 Z3.6 F42000
G1 X92.99 Y123.465 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X92.99 Y132.535 E.2787
G1 X100.59 Y132.535 E.23353
G1 X100.59 Y134.31 E.05454
G1 X103.56 Y134.31 E.09126
G1 X103.56 Y133.835 E.0146
G1 X103.79 Y133.835 E.00706
G1 X103.788 Y134.968 E.03481
G3 X102.397 Y136.29 I-1.406 J-.086 E.06487
G1 X81.605 Y136.29 E.63887
G3 X80.21 Y134.897 I.012 J-1.407 E.06712
G1 X80.21 Y133.835 E.03264
G1 X80.44 Y133.835 E.00707
G1 X80.44 Y134.31 E.0146
G1 X83.41 Y134.31 E.09126
G1 X83.41 Y132.535 E.05454
G1 X91.01 Y132.535 E.23353
G1 X91.01 Y123.465 E.2787
G1 X83.41 Y123.465 E.23353
G1 X83.41 Y121.69 E.05454
G1 X80.44 Y121.69 E.09126
G1 X80.44 Y122.165 E.0146
G1 X80.21 Y122.165 E.00706
G1 X80.212 Y121.032 E.03481
G3 X81.603 Y119.71 I1.406 J.086 E.06487
G1 X102.444 Y119.711 E.64039
G3 X103.79 Y121.105 I-.047 J1.392 E.06585
G1 X103.79 Y122.165 E.03256
G1 X103.56 Y122.165 E.00707
G1 X103.56 Y121.69 E.0146
G1 X100.59 Y121.69 E.09126
G1 X100.59 Y123.465 E.05454
G1 X93.05 Y123.465 E.23168
; WIPE_START
M204 S6000
G1 X93.037 Y125.465 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.474 Y122.17 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X93.846 Y122.17 E.05401
G1 X92.127 Y120.451 E.08063
G1 X91.873 Y120.451 E.00842
G1 X90.154 Y122.17 E.08063
G1 X88.526 Y122.17 E.05401
; WIPE_START
G1 X90.154 Y122.17 E-.61876
G1 X90.417 Y121.907 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.406 Y120.025 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279368
G1 F15000
M204 S6000
G1 X81.552 Y120.026 E.09352
G2 X81.332 Y120.042 I.056 J2.258 E.00426
; LINE_WIDTH: 0.237293
G1 X81.264 Y120.052 E.00109
; LINE_WIDTH: 0.211701
G1 X80.943 Y120.108 E.00448
; WIPE_START
G1 X81.264 Y120.052 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.109 Y127.682 Z3.6 F42000
G1 X80.942 Y135.889 Z3.6
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.205212
G1 F15000
M204 S6000
G1 X81.221 Y135.941 E.00375
; LINE_WIDTH: 0.231073
G1 X81.338 Y135.959 E.00181
; LINE_WIDTH: 0.28024
G2 X81.613 Y135.975 I.288 J-2.547 E.00534
G1 X86.406 Y135.975 E.09268
; WIPE_START
G1 X84.406 Y135.975 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.526 Y133.83 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X90.154 Y133.83 E.05401
G1 X91.874 Y135.55 E.08066
G1 X92.126 Y135.55 E.00838
G1 X93.846 Y133.83 E.08066
G1 X95.474 Y133.83 E.05401
; WIPE_START
G1 X93.846 Y133.83 E-.61876
G1 X93.583 Y134.093 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.594 Y135.975 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279985
G1 F15000
M204 S6000
G1 X102.559 Y135.969 E.0959
; LINE_WIDTH: 0.247161
G2 X102.756 Y135.945 I-.155 J-2.127 E.00331
; LINE_WIDTH: 0.208891
G1 X103.057 Y135.891 E.00415
; WIPE_START
G1 X102.756 Y135.945 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.347 Y134.11 Z3.6 F42000
G1 X92.394 Y133.379 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.53908
G1 F7255.728
M204 S6000
G1 X96.878 Y133.379 E.18127
G1 X96.971 Y133.398 E.00387
; LINE_WIDTH: 0.514374
G1 F7635.963
G1 X97.029 Y133.49 E.00415
; LINE_WIDTH: 0.4688
G1 F8453.086
G1 X97.086 Y133.581 E.00375
; LINE_WIDTH: 0.423227
G1 F9466.044
G1 X97.143 Y133.673 E.00335
; LINE_WIDTH: 0.39168
G1 F10322.285
G1 X97.101 Y133.803 E.00388
M204 S10000
G1 X99.816 Y133.488 F42000
; LINE_WIDTH: 0.39982
G1 F10086.86
M204 S6000
G1 X99.816 Y133.309 E.00519
G1 X97.356 Y133.309 E.07155
; LINE_WIDTH: 0.42271
G1 F9478.923
G1 X97.228 Y133.339 E.00407
; LINE_WIDTH: 0.46849
G1 F8459.243
G1 X97.1 Y133.368 E.00456
; LINE_WIDTH: 0.517593
G1 F7584.178
G1 X96.971 Y133.398 E.00509
G1 X97.145 Y133.57 E.00945
; LINE_WIDTH: 0.48474
G1 F8148.114
G1 X97.144 Y133.605 E.00123
; LINE_WIDTH: 0.45102
G1 F8821.367
G1 X97.144 Y133.639 E.00114
; LINE_WIDTH: 0.4173
G1 F9615.898
G1 X97.143 Y133.673 E.00105
G1 X97.176 Y133.654 E.00116
; LINE_WIDTH: 0.45102
G1 F8821.367
G1 X97.209 Y133.634 E.00127
; LINE_WIDTH: 0.48474
G1 F8148.114
G1 X97.242 Y133.615 E.00137
; LINE_WIDTH: 0.484637
G1 F8150.02
G1 X97.305 Y133.632 E.00236
; LINE_WIDTH: 0.45071
G1 F8828.074
G1 X97.368 Y133.649 E.00218
; LINE_WIDTH: 0.400253
G1 F10074.649
G1 X97.431 Y133.666 E.00191
G1 X99.816 Y133.666 E.06943
G1 X99.816 Y133.548 E.00345
M204 S10000
G1 X92.394 Y133.379 F42000
; LINE_WIDTH: 0.522389
G1 F7508.317
M204 S6000
G1 X92.329 Y133.302 E.00395
; LINE_WIDTH: 0.488965
G1 F8070.935
G1 X92.263 Y133.225 E.00368
; LINE_WIDTH: 0.438269
G1 F9105.877
G1 X92.197 Y133.148 E.00326
G1 X92.197 Y122.824 E.3326
; LINE_WIDTH: 0.428167
G1 F9344.672
G1 X92.247 Y122.804 E.00167
; LINE_WIDTH: 0.388979
G1 F10402.858
G1 X92.296 Y122.785 E.0015
; LINE_WIDTH: 0.349792
G1 F11731.304
G1 X92.345 Y122.765 E.00133
; LINE_WIDTH: 0.29124
G1 F12000
G1 X92.394 Y122.745 E.00107
G1 X96.878 Y122.745 E.09072
; LINE_WIDTH: 0.304925
G1 X96.981 Y122.731 E.00221
; LINE_WIDTH: 0.332755
G1 X97.083 Y122.718 E.00245
; LINE_WIDTH: 0.368916
G1 F11043.081
G1 X97.115 Y122.695 E.00103
; LINE_WIDTH: 0.413408
G1 F9716.913
G1 X97.147 Y122.673 E.00117
; LINE_WIDTH: 0.4579
G1 F8675.117
G1 X97.178 Y122.651 E.00131
; LINE_WIDTH: 0.502392
G1 F7835.081
G1 X97.21 Y122.629 E.00145
; LINE_WIDTH: 0.546884
G1 F7143.368
G1 X97.242 Y122.606 E.00159
; LINE_WIDTH: 0.547967
G1 F7128.06
G1 X97.289 Y122.627 E.00214
; LINE_WIDTH: 0.505639
G1 F7780.105
G1 X97.337 Y122.649 E.00196
; LINE_WIDTH: 0.463312
G1 F8563.451
G1 X97.384 Y122.67 E.00178
; LINE_WIDTH: 0.400033
G1 F10080.863
G1 X97.431 Y122.691 E.00151
G1 X99.816 Y122.691 E.06939
G1 X99.816 Y122.334 E.01039
G1 X97.431 Y122.334 E.06939
; LINE_WIDTH: 0.420984
G1 F9522.203
G1 X97.384 Y122.355 E.0016
; LINE_WIDTH: 0.463312
G1 F8563.451
G1 X97.337 Y122.376 E.00178
; LINE_WIDTH: 0.505639
G1 F7780.105
G1 X97.289 Y122.398 E.00196
; LINE_WIDTH: 0.547967
G1 F7128.06
G1 X97.242 Y122.419 E.00214
; LINE_WIDTH: 0.548042
G1 F7127.002
G1 X97.217 Y122.396 E.00139
; LINE_WIDTH: 0.505864
G1 F7776.323
G1 X97.192 Y122.373 E.00127
; LINE_WIDTH: 0.463687
G1 F8555.819
G1 X97.168 Y122.35 E.00116
; LINE_WIDTH: 0.421509
G1 F9508.999
G1 X97.143 Y122.327 E.00104
G1 X97.15 Y122.358 E.00098
; LINE_WIDTH: 0.463687
G1 F8555.819
G1 X97.157 Y122.389 E.00109
; LINE_WIDTH: 0.505864
G1 F7776.323
G1 X97.164 Y122.42 E.0012
; LINE_WIDTH: 0.548042
G1 F7127.002
G1 X97.17 Y122.452 E.00131
; LINE_WIDTH: 0.545954
G1 F7156.584
G1 X97.122 Y122.459 E.00202
; LINE_WIDTH: 0.4996
G1 F7882.981
G1 X97.073 Y122.467 E.00184
; LINE_WIDTH: 0.453247
G1 F8773.497
G1 X97.024 Y122.474 E.00165
; LINE_WIDTH: 0.406894
G1 F9890.834
G1 X96.975 Y122.482 E.00146
; LINE_WIDTH: 0.36054
G1 F11334.299
G1 X96.927 Y122.49 E.00128
; LINE_WIDTH: 0.291263
G1 F12000
G1 X92.394 Y122.497 E.09172
; LINE_WIDTH: 0.315819
G1 X92.237 Y122.522 E.00355
; LINE_WIDTH: 0.365437
G1 F11162.202
G1 X92.079 Y122.547 E.0042
; LINE_WIDTH: 0.415055
G1 F9673.909
G1 X91.921 Y122.572 E.00484
; LINE_WIDTH: 0.464673
G1 F8535.802
G1 X91.763 Y122.596 E.00549
; LINE_WIDTH: 0.500963
G1 F7859.535
G1 X91.606 Y122.621 E.00596
G1 X91.803 Y122.824 E.01055
; LINE_WIDTH: 0.4381
G1 F9109.778
G1 X91.803 Y133.148 E.33246
; LINE_WIDTH: 0.414507
G1 F9688.184
G1 X91.744 Y133.183 E.00207
; LINE_WIDTH: 0.36586
G1 F11147.581
G1 X91.686 Y133.218 E.0018
; LINE_WIDTH: 0.317214
G1 F12000
G1 X91.627 Y133.254 E.00153
; LINE_WIDTH: 0.291015
G1 X87.122 Y133.255 E.09108
; LINE_WIDTH: 0.304925
G1 X87.019 Y133.269 E.00221
; LINE_WIDTH: 0.332755
G1 X86.917 Y133.282 E.00245
; LINE_WIDTH: 0.368916
G1 F11043.081
G1 X86.885 Y133.305 E.00103
; LINE_WIDTH: 0.413408
G1 F9716.913
G1 X86.853 Y133.327 E.00117
; LINE_WIDTH: 0.4579
G1 F8675.117
G1 X86.822 Y133.349 E.00131
; LINE_WIDTH: 0.502392
G1 F7835.081
G1 X86.79 Y133.371 E.00145
; LINE_WIDTH: 0.546884
G1 F7143.368
G1 X86.758 Y133.394 E.00159
; LINE_WIDTH: 0.547967
G1 F7128.06
G1 X86.711 Y133.373 E.00214
; LINE_WIDTH: 0.505639
G1 F7780.105
G1 X86.663 Y133.351 E.00196
; LINE_WIDTH: 0.463312
G1 F8563.451
G1 X86.616 Y133.33 E.00178
; LINE_WIDTH: 0.400033
G1 F10080.863
G1 X86.569 Y133.309 E.00151
G1 X84.184 Y133.309 E.06939
G1 X84.184 Y133.666 E.01039
G1 X86.569 Y133.666 E.06939
; LINE_WIDTH: 0.420984
G1 F9522.203
G1 X86.616 Y133.645 E.0016
; LINE_WIDTH: 0.463312
G1 F8563.451
G1 X86.663 Y133.624 E.00178
; LINE_WIDTH: 0.505639
G1 F7780.105
G1 X86.711 Y133.602 E.00196
; LINE_WIDTH: 0.547967
G1 F7128.06
G1 X86.758 Y133.581 E.00214
; LINE_WIDTH: 0.548047
G1 F7126.931
G1 X86.783 Y133.604 E.00139
; LINE_WIDTH: 0.505879
G1 F7776.071
G1 X86.808 Y133.627 E.00127
; LINE_WIDTH: 0.463712
G1 F8555.311
G1 X86.832 Y133.65 E.00115
; LINE_WIDTH: 0.421544
G1 F9508.12
G1 X86.857 Y133.673 E.00104
G1 X86.85 Y133.642 E.00098
; LINE_WIDTH: 0.463712
G1 F8555.311
G1 X86.843 Y133.611 E.00109
; LINE_WIDTH: 0.505879
G1 F7776.071
G1 X86.836 Y133.58 E.0012
; LINE_WIDTH: 0.548047
G1 F7126.931
G1 X86.83 Y133.548 E.00131
; LINE_WIDTH: 0.545954
G1 F7156.584
G1 X86.878 Y133.541 E.00202
; LINE_WIDTH: 0.4996
G1 F7882.981
G1 X86.927 Y133.533 E.00184
; LINE_WIDTH: 0.453247
G1 F8773.497
G1 X86.976 Y133.526 E.00165
; LINE_WIDTH: 0.406894
G1 F9890.834
G1 X87.025 Y133.518 E.00146
; LINE_WIDTH: 0.36054
G1 F11334.299
G1 X87.073 Y133.51 E.00128
; LINE_WIDTH: 0.291263
G1 F12000
G1 X91.606 Y133.503 E.09172
; LINE_WIDTH: 0.315819
G1 X91.752 Y133.48 E.00328
; LINE_WIDTH: 0.365437
G1 F11162.202
G1 X91.897 Y133.457 E.00388
; LINE_WIDTH: 0.415055
G1 F9673.909
G1 X92.043 Y133.434 E.00448
; LINE_WIDTH: 0.464673
G1 F8535.802
G1 X92.189 Y133.411 E.00508
; LINE_WIDTH: 0.514291
G1 F7637.296
G1 X92.335 Y133.388 E.00567
M204 S10000
G1 X86.918 Y133.86 F42000
; LINE_WIDTH: 0.39169
G1 F10321.988
M204 S6000
G1 X86.875 Y133.73 E.00388
; WIPE_START
G1 X86.918 Y133.86 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.993 Y126.228 Z3.6 F42000
G1 X87.029 Y122.602 Z3.6
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.553145
G1 F7055.711
M204 S6000
G1 X86.83 Y122.452 E.01037
; LINE_WIDTH: 0.548042
G1 F7127.002
G1 X86.836 Y122.42 E.00131
; LINE_WIDTH: 0.505864
G1 F7776.323
G1 X86.843 Y122.389 E.0012
; LINE_WIDTH: 0.463687
G1 F8555.819
G1 X86.85 Y122.358 E.00109
; LINE_WIDTH: 0.421509
G1 F9508.999
G1 X86.857 Y122.327 E.00098
G1 X86.832 Y122.35 E.00104
; LINE_WIDTH: 0.463687
G1 F8555.819
G1 X86.808 Y122.373 E.00116
; LINE_WIDTH: 0.505864
G1 F7776.323
G1 X86.783 Y122.396 E.00127
; LINE_WIDTH: 0.548042
G1 F7127.002
G1 X86.758 Y122.419 E.00139
; LINE_WIDTH: 0.547968
G1 F7128.043
G1 X86.73 Y122.398 E.00146
; LINE_WIDTH: 0.505643
G1 F7780.041
G1 X86.701 Y122.376 E.00134
; LINE_WIDTH: 0.463318
G1 F8563.324
G1 X86.673 Y122.355 E.00122
; LINE_WIDTH: 0.399972
G1 F10082.579
G1 X86.644 Y122.334 E.00103
G1 X84.184 Y122.334 E.07158
G1 X84.184 Y122.691 E.01038
G1 X86.644 Y122.691 E.07158
; LINE_WIDTH: 0.420993
G1 F9521.983
G1 X86.673 Y122.67 E.00109
; LINE_WIDTH: 0.463318
G1 F8563.324
G1 X86.701 Y122.649 E.00122
; LINE_WIDTH: 0.505643
G1 F7780.041
G1 X86.73 Y122.627 E.00134
; LINE_WIDTH: 0.530179
G1 F7388.276
G1 X86.758 Y122.606 E.00141
G1 X86.786 Y122.635 E.00157
G1 X86.969 Y122.61 E.00735
M204 S10000
G1 X86.918 Y122.14 F42000
; LINE_WIDTH: 0.39167
G1 F10322.58
M204 S6000
G1 X86.857 Y122.327 E.00559
; LINE_WIDTH: 0.42321
G1 F9466.46
G1 X86.914 Y122.419 E.00335
; LINE_WIDTH: 0.46879
G1 F8453.284
G1 X86.971 Y122.51 E.00375
; LINE_WIDTH: 0.538503
G1 F7264.181
G2 X87.122 Y122.621 I.128 J-.017 E.00846
G1 X91.546 Y122.621 E.17863
M204 S10000
G1 X97.082 Y122.14 F42000
; LINE_WIDTH: 0.39167
G1 F10322.58
M204 S6000
G1 X97.125 Y122.27 E.00388
; WIPE_START
G1 X97.082 Y122.14 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.594 Y120.025 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279137
G1 F15000
M204 S6000
G1 X102.433 Y120.026 E.09314
G3 X102.67 Y120.042 I-.03 J2.132 E.00458
; LINE_WIDTH: 0.231834
G1 X102.769 Y120.057 E.00154
; LINE_WIDTH: 0.198332
G1 X103.057 Y120.113 E.00372
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X102.769 Y120.057 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 17/42
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z3.6 I-.058 J1.216 P1  F42000
G1 X164.598 Y123.023 Z3.6
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X164.598 Y132.977 E.3302
G1 X172.198 Y132.977 E.25211
G1 X172.198 Y134.777 E.05971
G1 X175.397 Y134.777 E.1061
G3 X174.385 Y135.898 I-1.005 J.11 E.05655
G1 X153.615 Y135.898 E.68898
G3 X152.604 Y134.777 I-.01 J-1.008 E.0566
G1 X155.802 Y134.777 E.1061
G1 X155.802 Y132.977 E.05971
G1 X163.402 Y132.977 E.25211
G1 X163.402 Y123.023 E.3302
G1 X155.802 Y123.023 E.25211
G1 X155.802 Y121.223 E.05971
G1 X152.603 Y121.223 E.1061
G3 X153.608 Y120.102 I1.005 J-.11 E.05631
G1 X174.43 Y120.103 E.69072
G3 X175.403 Y121.223 I-.044 J1.021 E.05506
G1 X172.198 Y121.223 E.10633
G1 X172.198 Y123.023 E.05971
G1 X164.658 Y123.023 E.25012
M204 S250
G1 X164.99 Y123.415 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X164.99 Y132.585 E.28177
G1 X172.59 Y132.585 E.23353
G1 X172.59 Y134.385 E.05531
G1 X173.302 Y134.385 E.02189
G1 X173.31 Y134.185 E.00615
G1 X173.69 Y134.185 E.01169
G1 X173.695 Y134.385 E.00615
G1 X174.502 Y134.385 E.02482
G1 X174.51 Y134.185 E.00615
G1 X174.89 Y134.185 E.01169
G1 X174.895 Y134.385 E.00615
G1 X175.789 Y134.385 E.02749
G3 X175.783 Y135.034 I-4.56 J.282 E.01997
G3 X174.395 Y136.29 I-1.388 J-.14 E.06306
G1 X153.605 Y136.29 E.6388
G3 X152.212 Y134.969 I.004 J-1.4 E.06503
G1 X152.21 Y134.385 E.01793
G1 X153.102 Y134.385 E.02741
G1 X153.11 Y134.185 E.00615
G1 X153.49 Y134.185 E.01169
G1 X153.495 Y134.385 E.00615
G1 X154.305 Y134.385 E.02491
G1 X154.31 Y134.185 E.00614
G1 X154.69 Y134.186 E.01169
G1 X154.698 Y134.385 E.00613
G1 X155.41 Y134.385 E.02189
G1 X155.41 Y132.585 E.05531
G1 X163.01 Y132.585 E.23353
G1 X163.01 Y123.415 E.28177
G1 X155.41 Y123.415 E.23353
G1 X155.41 Y121.615 E.05531
G1 X154.697 Y121.615 E.02189
G1 X154.69 Y121.815 E.00615
G1 X154.31 Y121.815 E.01169
G1 X154.305 Y121.615 E.00615
G1 X153.497 Y121.615 E.02482
G1 X153.49 Y121.815 E.00615
G1 X153.11 Y121.815 E.01169
G1 X153.105 Y121.615 E.00615
G1 X152.21 Y121.615 E.02749
G3 X152.217 Y120.966 I4.543 J-.282 E.01997
G3 X153.603 Y119.71 I1.385 J.135 E.06303
G1 X174.442 Y119.711 E.64033
G3 X175.79 Y121.105 I-.051 J1.398 E.06584
G1 X175.79 Y121.615 E.01566
G1 X174.897 Y121.615 E.02742
G1 X174.89 Y121.815 E.00615
G1 X174.51 Y121.815 E.01169
G1 X174.505 Y121.615 E.00615
G1 X173.695 Y121.615 E.02491
G1 X173.69 Y121.815 E.00614
G1 X173.31 Y121.814 E.01169
G1 X173.302 Y121.615 E.00613
G1 X172.59 Y121.615 E.02189
G1 X172.59 Y123.415 E.05531
G1 X165.05 Y123.415 E.23168
; WIPE_START
M204 S6000
G1 X165.037 Y125.415 E-.76
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
G1 X164.25 Y126.122 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X164.25 Y127.75 E.05401
G1 X163.75 Y128.25 E.02343
G1 X163.75 Y127.75 E.01656
G1 X164.25 Y128.25 E.02343
G1 X164.25 Y129.878 E.05401
; WIPE_START
G1 X164.25 Y128.25 E-.61876
G1 X163.987 Y127.987 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.808 Y132.468 Z3.8 F42000
G1 X154.145 Y135.125 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X155.773 Y135.125 E.05401
G1 X156.198 Y135.55 E.01991
G1 X156.45 Y135.55 E.00838
G1 X158.675 Y133.325 E.10435
G1 X161.649 Y133.325 E.09868
G1 X163.874 Y135.55 E.10435
G1 X164.126 Y135.55 E.00838
G1 X166.351 Y133.325 E.10435
G1 X169.325 Y133.325 E.09868
G1 X171.55 Y135.55 E.10435
G1 X171.802 Y135.55 E.00838
G1 X172.227 Y135.125 E.01991
G1 X173.855 Y135.125 E.05401
; WIPE_START
G1 X172.227 Y135.125 E-.61876
G1 X171.964 Y135.388 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X172.95 Y127.82 Z3.8 F42000
G1 X173.855 Y120.875 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X172.227 Y120.875 E.05401
G1 X171.803 Y120.451 E.01986
G1 X171.549 Y120.451 E.00845
G1 X169.325 Y122.675 E.1043
G1 X166.351 Y122.675 E.09868
G1 X164.127 Y120.451 E.10432
G1 X163.873 Y120.451 E.00842
G1 X161.649 Y122.675 E.10432
G1 X158.675 Y122.675 E.09868
G1 X156.45 Y120.45 E.10434
G1 X156.198 Y120.45 E.00839
G1 X155.773 Y120.875 E.0199
G1 X154.145 Y120.875 E.05401
; OBJECT_ID: 405
; WIPE_START
G1 X155.773 Y120.875 E-.61876
G1 X156.036 Y120.612 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X148.434 Y121.287 Z3.8 F42000
G1 X128.598 Y123.048 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X128.598 Y132.952 E.32854
G1 X136.198 Y132.952 E.25211
G1 X136.198 Y134.727 E.05888
G1 X139.397 Y134.727 E.1061
G3 X138.385 Y135.898 I-1.009 J.15 E.05825
G1 X125.802 Y135.898 E.4174
G1 X125.802 Y132.952 E.09772
G1 X127.402 Y132.952 E.05307
G1 X127.402 Y123.048 E.32854
G1 X119.802 Y123.048 E.25211
G1 X119.802 Y121.273 E.05888
G1 X116.603 Y121.273 E.1061
G3 X117.615 Y120.102 I1.011 J-.149 E.05822
G1 X130.198 Y120.102 E.4174
G1 X130.198 Y123.048 E.09772
G1 X128.658 Y123.048 E.05108
M204 S250
G1 X128.99 Y123.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X128.99 Y132.56 E.28023
G1 X136.59 Y132.56 E.23353
G1 X136.59 Y134.335 E.05454
G1 X139.79 Y134.335 E.09831
G3 X139.783 Y135.034 I-4.896 J.307 E.02149
G3 X138.395 Y136.29 I-1.385 J-.135 E.06312
G1 X125.41 Y136.29 E.39898
G1 X125.41 Y132.56 E.11461
G1 X127.01 Y132.56 E.04916
G1 X127.01 Y123.44 E.28023
G1 X119.41 Y123.44 E.23353
G1 X119.41 Y121.665 E.05454
G1 X116.21 Y121.665 E.09831
G1 X116.212 Y121.031 E.01947
G3 X117.605 Y119.71 I1.389 J.069 E.06513
G1 X130.59 Y119.71 E.39898
G1 X130.59 Y123.44 E.11461
G1 X129.05 Y123.44 E.04732
; WIPE_START
M204 S6000
G1 X129.037 Y125.44 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.347 Y132.883 Z3.8 F42000
G1 X127.253 Y133.3 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X126.15 Y133.3 E.03657
G1 X126.15 Y133.826 E.01745
G1 X127.874 Y135.55 E.08085
G1 X128.126 Y135.55 E.00838
G1 X130.376 Y133.3 E.10552
G1 X133.3 Y133.3 E.09702
G1 X135.55 Y135.55 E.10552
G1 X135.802 Y135.55 E.00838
G1 X136.277 Y135.075 E.02225
G1 X137.905 Y135.075 E.05401
; WIPE_START
M73 P58 R10
G1 X136.277 Y135.075 E-.61876
G1 X136.014 Y135.338 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.067 Y130.554 Z3.8 F42000
G1 X118.095 Y120.925 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X119.723 Y120.925 E.05401
G1 X120.193 Y120.455 E.02205
G1 X120.455 Y120.455 E.00866
G1 X122.7 Y122.7 E.10532
G1 X125.624 Y122.7 E.09702
G1 X127.873 Y120.451 E.10547
G1 X128.127 Y120.451 E.00844
G1 X129.85 Y122.174 E.08081
G1 X129.85 Y122.7 E.01745
G1 X128.25 Y122.7 E.05307
G1 X128.25 Y127.75 E.16754
G1 X127.75 Y128.25 E.02343
G1 X127.75 Y127.75 E.01656
G1 X128.25 Y128.25 E.02343
G1 X128.25 Y129.878 E.05401
; OBJECT_ID: 394
; WIPE_START
G1 X128.25 Y128.25 E-.61876
G1 X127.987 Y127.987 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X120.523 Y129.582 Z3.8 F42000
G1 X97.79 Y134.44 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X103.41 Y134.44 E.17269
G1 X103.41 Y135.66 E.03749
G1 X97.79 Y135.66 E.17269
G1 X97.79 Y134.5 E.03564
; WIPE_START
M204 S6000
G1 X99.79 Y134.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.622 Y126.936 Z3.8 F42000
G1 X97.79 Y121.56 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X97.79 Y120.34 E.03749
G1 X103.41 Y120.34 E.17269
G1 X103.41 Y121.56 E.03749
G1 X97.85 Y121.56 E.17084
M204 S10000
G1 X97.398 Y121.56 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.398 Y121.952 E.01301
G1 X100.198 Y121.952 E.09288
G1 X100.198 Y123.073 E.03718
G1 X92.598 Y123.073 E.25211
G1 X92.598 Y132.927 E.32688
G1 X100.198 Y132.927 E.25211
G1 X100.198 Y134.048 E.03718
G1 X97.398 Y134.048 E.09288
G1 X97.398 Y135.898 E.06137
G1 X86.602 Y135.898 E.35812
G1 X86.602 Y134.048 E.06137
G1 X83.802 Y134.048 E.09288
G1 X83.802 Y132.927 E.03718
G1 X91.402 Y132.927 E.25211
G1 X91.402 Y123.073 E.32688
G1 X83.802 Y123.073 E.25211
G1 X83.802 Y121.952 E.03718
G1 X86.602 Y121.952 E.09288
G1 X86.602 Y120.102 E.06136
G1 X97.398 Y120.103 E.35812
G1 X97.398 Y121.5 E.04634
; WIPE_START
G1 X97.398 Y121.952 E-.17179
G1 X98.946 Y121.952 E-.58821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.317 Y121.717 Z3.8 F42000
G1 X86.21 Y121.56 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X80.59 Y121.56 E.17269
G1 X80.59 Y120.34 E.03749
G1 X86.21 Y120.34 E.17269
G1 X86.21 Y121.5 E.03564
; WIPE_START
M204 S6000
G1 X84.21 Y121.521 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.378 Y129.064 Z3.8 F42000
G1 X86.21 Y134.44 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X86.21 Y135.66 E.03749
G1 X80.59 Y135.66 E.17269
G1 X80.59 Y134.44 E.03749
G1 X86.15 Y134.44 E.17084
; WIPE_START
M204 S6000
G1 X86.21 Y135.66 E-.46416
G1 X85.431 Y135.66 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.452 Y129.173 Z3.8 F42000
G1 X92.99 Y123.465 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X92.99 Y132.535 E.2787
G1 X100.59 Y132.535 E.23353
G1 X100.59 Y134.31 E.05454
G1 X103.56 Y134.31 E.09126
G1 X103.56 Y133.835 E.0146
G1 X103.79 Y133.835 E.00706
G1 X103.788 Y134.968 E.03482
G3 X102.395 Y136.29 I-1.403 J-.083 E.06498
G1 X81.605 Y136.29 E.6388
G3 X80.21 Y134.897 I.004 J-1.399 E.06722
G1 X80.21 Y133.835 E.03264
G1 X80.44 Y133.835 E.00707
G1 X80.44 Y134.31 E.0146
G1 X83.41 Y134.31 E.09126
G1 X83.41 Y132.535 E.05454
G1 X91.01 Y132.535 E.23353
G1 X91.01 Y123.465 E.2787
G1 X83.41 Y123.465 E.23353
G1 X83.41 Y121.69 E.05454
G1 X80.44 Y121.69 E.09126
G1 X80.44 Y122.165 E.0146
G1 X80.21 Y122.165 E.00706
G1 X80.212 Y121.032 E.03482
G3 X81.603 Y119.71 I1.403 J.083 E.0649
G1 X102.442 Y119.711 E.64033
G3 X103.79 Y121.105 I-.046 J1.393 E.0659
G1 X103.79 Y122.165 E.03256
G1 X103.56 Y122.165 E.00707
G1 X103.56 Y121.69 E.0146
G1 X100.59 Y121.69 E.09126
G1 X100.59 Y123.465 E.05454
G1 X93.05 Y123.465 E.23168
; WIPE_START
M204 S6000
G1 X93.037 Y125.465 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.25 Y126.122 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X92.25 Y127.75 E.05401
G1 X91.75 Y128.25 E.02343
G1 X91.75 Y127.75 E.01656
G1 X92.25 Y128.25 E.02343
G1 X92.25 Y129.878 E.05401
; WIPE_START
G1 X92.25 Y128.25 E-.61876
G1 X91.987 Y127.987 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.397 Y134.085 Z3.8 F42000
G1 X86.95 Y134.678 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X86.95 Y133.7 E.03245
G1 X86.3 Y133.7 E.02156
G1 X86.725 Y133.275 E.01991
G1 X89.599 Y133.275 E.09536
G1 X91.874 Y135.55 E.10669
G1 X92.126 Y135.55 E.00838
G1 X94.401 Y133.275 E.10669
G1 X97.275 Y133.275 E.09536
G1 X97.7 Y133.7 E.01991
G1 X97.05 Y133.7 E.02156
G1 X97.05 Y134.678 E.03245
; WIPE_START
G1 X97.05 Y133.7 E-.37176
G1 X97.7 Y133.7 E-.247
G1 X97.437 Y133.437 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.594 Y135.975 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280713
G1 F15000
M204 S6000
G1 X102.387 Y135.975 E.09287
G2 X102.552 Y135.969 I.008 J-2.236 E.00321
; LINE_WIDTH: 0.248093
G2 X102.754 Y135.945 I-.156 J-2.177 E.0034
; LINE_WIDTH: 0.209169
G1 X103.056 Y135.891 E.00416
; WIPE_START
G1 X102.754 Y135.945 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.98 Y128.835 Z3.8 F42000
G1 X97.05 Y121.322 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.05 Y122.3 E.03245
G1 X97.7 Y122.3 E.02156
G1 X97.275 Y122.725 E.01991
G1 X94.401 Y122.725 E.09536
G1 X92.127 Y120.451 E.10667
G1 X91.873 Y120.451 E.00842
G1 X89.599 Y122.725 E.10667
G1 X86.725 Y122.725 E.09536
G1 X86.3 Y122.3 E.01991
G1 X86.95 Y122.3 E.02156
G1 X86.95 Y121.322 E.03245
; WIPE_START
G1 X86.95 Y122.3 E-.37176
G1 X86.3 Y122.3 E-.247
G1 X86.563 Y122.563 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.406 Y120.025 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279379
G1 F15000
M204 S6000
G1 X81.552 Y120.026 E.09352
G2 X81.332 Y120.042 I.056 J2.256 E.00425
; LINE_WIDTH: 0.237026
G1 X81.262 Y120.052 E.00112
; LINE_WIDTH: 0.211461
G1 X80.942 Y120.108 E.00446
; WIPE_START
G1 X81.262 Y120.052 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.108 Y127.683 Z3.8 F42000
G1 X80.942 Y135.889 Z3.8
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.205284
G1 F15000
M204 S6000
G1 X81.221 Y135.941 E.00375
; LINE_WIDTH: 0.231052
G1 X81.338 Y135.959 E.00181
; LINE_WIDTH: 0.28024
G2 X81.613 Y135.975 I.287 J-2.519 E.00534
G1 X86.406 Y135.975 E.09268
; WIPE_START
G1 X84.406 Y135.975 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.27 Y130.093 Z3.8 F42000
G1 X97.594 Y120.025 Z3.8
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.279185
G1 F15000
M204 S6000
G1 X102.431 Y120.026 E.09313
G3 X102.67 Y120.042 I-.028 J2.137 E.00461
; LINE_WIDTH: 0.231833
G1 X102.769 Y120.057 E.00155
; LINE_WIDTH: 0.198714
G1 X103.055 Y120.113 E.0037
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X102.769 Y120.057 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 18/42
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z3.8 I-.058 J1.216 P1  F42000
G1 X164.598 Y123.023 Z3.8
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X164.598 Y132.977 E.3302
G1 X172.198 Y132.977 E.25211
G1 X172.198 Y134.777 E.05971
G1 X175.397 Y134.777 E.1061
G3 X174.388 Y135.898 I-1.005 J.11 E.05645
G1 X153.615 Y135.898 E.68908
G3 X152.604 Y134.777 I.002 J-1.018 E.05641
G1 X155.802 Y134.777 E.1061
G1 X155.802 Y132.977 E.05971
G1 X163.402 Y132.977 E.25211
G1 X163.402 Y123.023 E.3302
G1 X155.802 Y123.023 E.25211
G1 X155.802 Y121.223 E.05971
G1 X152.603 Y121.223 E.1061
G3 X153.612 Y120.102 I1.005 J-.11 E.05645
G1 X174.428 Y120.103 E.69052
G3 X175.402 Y121.223 I-.035 J1.014 E.05521
G1 X172.198 Y121.223 E.10629
G1 X172.198 Y123.023 E.05971
G1 X164.658 Y123.023 E.25012
M204 S250
G1 X164.99 Y123.415 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X164.99 Y132.585 E.28177
G1 X172.59 Y132.585 E.23353
G1 X172.59 Y134.385 E.05531
G1 X173.303 Y134.385 E.02189
G1 X173.31 Y134.185 E.00615
G1 X173.69 Y134.185 E.01169
G1 X173.695 Y134.385 E.00615
G1 X174.503 Y134.385 E.02482
G1 X174.51 Y134.185 E.00615
G1 X174.89 Y134.185 E.01169
G1 X174.895 Y134.385 E.00615
G1 X175.789 Y134.385 E.02749
G3 X175.783 Y135.034 I-4.556 J.282 E.01997
G3 X174.396 Y136.29 I-1.385 J-.136 E.06307
G1 X153.605 Y136.29 E.63882
G3 X152.212 Y134.968 I-.001 J-1.395 E.0651
G1 X152.21 Y134.385 E.01791
G1 X153.103 Y134.385 E.02741
G1 X153.11 Y134.185 E.00615
G1 X153.49 Y134.185 E.01169
G1 X153.495 Y134.385 E.00615
G1 X154.305 Y134.385 E.02491
G1 X154.31 Y134.185 E.00614
G1 X154.69 Y134.186 E.01169
G1 X154.698 Y134.385 E.00613
G1 X155.41 Y134.385 E.02189
G1 X155.41 Y132.585 E.05531
G1 X163.01 Y132.585 E.23353
G1 X163.01 Y123.415 E.28177
G1 X155.41 Y123.415 E.23353
G1 X155.41 Y121.615 E.05531
G1 X154.697 Y121.615 E.02189
G1 X154.69 Y121.815 E.00615
G1 X154.31 Y121.815 E.01169
G1 X154.305 Y121.615 E.00615
G1 X153.497 Y121.615 E.02482
G1 X153.49 Y121.815 E.00615
G1 X153.11 Y121.815 E.01169
G1 X153.105 Y121.615 E.00615
G1 X152.21 Y121.615 E.0275
G3 X152.217 Y120.966 I4.541 J-.282 E.01997
G3 X153.604 Y119.71 I1.388 J.14 E.06303
G1 X174.44 Y119.711 E.64022
G3 X175.79 Y121.104 I-.04 J1.39 E.06597
G1 X175.79 Y121.615 E.01569
G1 X174.897 Y121.615 E.02742
M73 P58 R9
G1 X174.89 Y121.815 E.00615
G1 X174.51 Y121.815 E.01169
G1 X174.505 Y121.615 E.00615
G1 X173.695 Y121.615 E.02491
G1 X173.69 Y121.815 E.00614
G1 X173.31 Y121.814 E.01169
G1 X173.303 Y121.615 E.00613
G1 X172.59 Y121.615 E.02189
G1 X172.59 Y123.415 E.05531
G1 X165.05 Y123.415 E.23168
; WIPE_START
M204 S6000
G1 X165.037 Y125.415 E-.76
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
G1 X164.25 Y129.878 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X164.25 Y128.25 E.05401
G1 X163.75 Y127.75 E.02343
G1 X163.75 Y128.25 E.01656
G1 X164.25 Y127.75 E.02343
G1 X164.25 Y126.122 E.05401
; WIPE_START
G1 X164.25 Y127.75 E-.61876
G1 X163.987 Y128.013 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.808 Y123.532 Z4 F42000
G1 X154.145 Y120.875 Z4
G1 Z3.6
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X155.773 Y120.875 E.05401
G1 X156.198 Y120.45 E.0199
G1 X156.45 Y120.45 E.00839
G1 X158.675 Y122.675 E.10434
G1 X161.649 Y122.675 E.09868
G1 X163.873 Y120.451 E.10432
G1 X164.127 Y120.451 E.00842
G1 X166.351 Y122.675 E.10432
G1 X169.325 Y122.675 E.09868
G1 X171.549 Y120.451 E.1043
G1 X171.803 Y120.451 E.00844
G1 X172.227 Y120.875 E.01986
G1 X173.855 Y120.875 E.05401
; WIPE_START
G1 X172.227 Y120.875 E-.61876
G1 X171.964 Y120.612 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X172.95 Y128.18 Z4 F42000
G1 X173.855 Y135.125 Z4
G1 Z3.6
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X172.227 Y135.125 E.05401
G1 X171.802 Y135.55 E.01991
G1 X171.55 Y135.55 E.00838
G1 X169.325 Y133.325 E.10435
G1 X166.351 Y133.325 E.09868
G1 X164.126 Y135.55 E.10435
G1 X163.874 Y135.55 E.00838
G1 X161.649 Y133.325 E.10435
G1 X158.675 Y133.325 E.09868
G1 X156.45 Y135.55 E.10435
G1 X156.198 Y135.55 E.00838
G1 X155.773 Y135.125 E.01991
G1 X154.145 Y135.125 E.05401
; OBJECT_ID: 405
; WIPE_START
G1 X155.773 Y135.125 E-.61876
G1 X156.036 Y135.388 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X149.075 Y132.258 Z4 F42000
G1 X128.598 Y123.048 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
M73 P59 R9
G1 X128.598 Y132.952 E.32854
G1 X136.198 Y132.952 E.25211
G1 X136.198 Y134.727 E.05888
G1 X139.397 Y134.727 E.1061
G3 X138.388 Y135.898 I-1.009 J.15 E.05816
G1 X125.802 Y135.898 E.4175
G1 X125.802 Y132.952 E.09772
G1 X127.402 Y132.952 E.05307
G1 X127.402 Y123.048 E.32854
G1 X119.802 Y123.048 E.25211
G1 X119.802 Y121.273 E.05888
G1 X116.603 Y121.273 E.1061
G3 X117.615 Y120.102 I1.017 J-.143 E.05812
G1 X130.198 Y120.102 E.4174
G1 X130.198 Y123.048 E.09772
G1 X128.658 Y123.048 E.05108
M204 S250
G1 X128.99 Y123.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X128.99 Y132.56 E.28023
G1 X136.59 Y132.56 E.23353
G1 X136.59 Y134.335 E.05454
G1 X139.79 Y134.335 E.09831
G3 X139.783 Y135.034 I-4.882 J.307 E.02149
G3 X138.396 Y136.29 I-1.388 J-.139 E.06305
G1 X125.41 Y136.29 E.39901
G1 X125.41 Y132.56 E.11461
G1 X127.01 Y132.56 E.04916
G1 X127.01 Y123.44 E.28023
G1 X119.41 Y123.44 E.23353
G1 X119.41 Y121.665 E.05454
G1 X116.21 Y121.665 E.09831
G1 X116.212 Y121.031 E.01947
G3 X117.605 Y119.71 I1.393 J.073 E.06509
G1 X130.59 Y119.71 E.39898
G1 X130.59 Y123.44 E.11461
G1 X129.05 Y123.44 E.04732
; WIPE_START
M204 S6000
G1 X129.037 Y125.44 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.25 Y129.878 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X128.25 Y128.25 E.05401
G1 X127.75 Y127.75 E.02343
G1 X127.75 Y128.25 E.01656
G1 X128.25 Y127.75 E.02343
G1 X128.25 Y122.7 E.16754
G1 X129.85 Y122.7 E.05307
G1 X129.85 Y122.174 E.01745
G1 X128.127 Y120.451 E.08081
G1 X127.873 Y120.451 E.00844
G1 X125.624 Y122.7 E.10547
G1 X122.7 Y122.7 E.09702
G1 X120.455 Y120.455 E.10532
G1 X120.193 Y120.455 E.00867
G1 X119.723 Y120.925 E.02204
G1 X118.095 Y120.925 E.05401
; WIPE_START
G1 X119.723 Y120.925 E-.61876
G1 X119.986 Y120.662 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.933 Y125.446 Z4 F42000
G1 X137.905 Y135.075 Z4
G1 Z3.6
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X136.277 Y135.075 E.05401
G1 X135.802 Y135.55 E.02225
G1 X135.55 Y135.55 E.00838
G1 X133.3 Y133.3 E.10552
G1 X130.376 Y133.3 E.09702
G1 X128.126 Y135.55 E.10552
G1 X127.874 Y135.55 E.00838
G1 X126.15 Y133.826 E.08085
G1 X126.15 Y133.3 E.01745
G1 X127.253 Y133.3 E.03657
; OBJECT_ID: 394
; WIPE_START
G1 X126.15 Y133.3 E-.4189
G1 X126.15 Y133.826 E-.19986
G1 X126.413 Y134.089 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X118.781 Y134.183 Z4 F42000
G1 X97.79 Y134.44 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X103.41 Y134.44 E.17269
G1 X103.41 Y135.66 E.03749
G1 X97.79 Y135.66 E.17269
G1 X97.79 Y134.5 E.03564
; WIPE_START
M204 S6000
G1 X99.79 Y134.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.622 Y126.936 Z4 F42000
G1 X97.79 Y121.56 Z4
G1 Z3.6
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X97.79 Y120.34 E.03749
G1 X103.41 Y120.34 E.17269
G1 X103.41 Y121.56 E.03749
G1 X97.85 Y121.56 E.17084
M204 S10000
G1 X97.398 Y121.56 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.398 Y121.952 E.01301
G1 X100.198 Y121.952 E.09288
G1 X100.198 Y123.073 E.03718
G1 X92.598 Y123.073 E.25211
G1 X92.598 Y132.927 E.32688
G1 X100.198 Y132.927 E.25211
G1 X100.198 Y134.048 E.03718
G1 X97.398 Y134.048 E.09288
G1 X97.398 Y135.898 E.06137
G1 X86.602 Y135.898 E.35812
G1 X86.602 Y134.048 E.06137
G1 X83.802 Y134.048 E.09288
G1 X83.802 Y132.927 E.03718
G1 X91.402 Y132.927 E.25211
G1 X91.402 Y123.073 E.32688
G1 X83.802 Y123.073 E.25211
G1 X83.802 Y121.952 E.03718
G1 X86.602 Y121.952 E.09288
G1 X86.602 Y120.102 E.06136
G1 X97.398 Y120.103 E.35812
G1 X97.398 Y121.5 E.04634
; WIPE_START
G1 X97.398 Y121.952 E-.17179
G1 X98.946 Y121.952 E-.58821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.317 Y121.717 Z4 F42000
G1 X86.21 Y121.56 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X80.59 Y121.56 E.17269
G1 X80.59 Y120.34 E.03749
G1 X86.21 Y120.34 E.17269
G1 X86.21 Y121.5 E.03564
; WIPE_START
M204 S6000
G1 X84.21 Y121.521 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.378 Y129.064 Z4 F42000
G1 X86.21 Y134.44 Z4
G1 Z3.6
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X86.21 Y135.66 E.03749
G1 X80.59 Y135.66 E.17269
G1 X80.59 Y134.44 E.03749
G1 X86.15 Y134.44 E.17084
; WIPE_START
M204 S6000
G1 X86.21 Y135.66 E-.46416
G1 X85.431 Y135.66 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.452 Y129.173 Z4 F42000
G1 X92.99 Y123.465 Z4
G1 Z3.6
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X92.99 Y132.535 E.2787
G1 X100.59 Y132.535 E.23353
G1 X100.59 Y134.31 E.05454
G1 X103.56 Y134.31 E.09126
G1 X103.56 Y133.835 E.0146
G1 X103.79 Y133.835 E.00706
G1 X103.788 Y134.968 E.03482
G3 X102.396 Y136.29 I-1.398 J-.078 E.06501
G1 X81.605 Y136.29 E.63882
G3 X80.21 Y134.896 I-.001 J-1.395 E.06733
G1 X80.21 Y133.835 E.03259
G1 X80.44 Y133.835 E.00707
G1 X80.44 Y134.31 E.0146
G1 X83.41 Y134.31 E.09126
G1 X83.41 Y132.535 E.05454
G1 X91.01 Y132.535 E.23353
G1 X91.01 Y123.465 E.2787
G1 X83.41 Y123.465 E.23353
G1 X83.41 Y121.69 E.05454
G1 X80.44 Y121.69 E.09126
G1 X80.44 Y122.165 E.0146
G1 X80.21 Y122.165 E.00706
G1 X80.212 Y121.032 E.03482
G3 X81.604 Y119.71 I1.398 J.078 E.06501
G1 X102.44 Y119.711 E.64022
G3 X103.79 Y121.105 I-.044 J1.393 E.06596
G1 X103.79 Y122.165 E.03256
G1 X103.56 Y122.165 E.00707
G1 X103.56 Y121.69 E.0146
G1 X100.59 Y121.69 E.09126
G1 X100.59 Y123.465 E.05454
G1 X93.05 Y123.465 E.23168
; WIPE_START
M204 S6000
G1 X93.037 Y125.465 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.594 Y120.025 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.27889
G1 F15000
M204 S6000
G1 X102.429 Y120.026 E.09297
G3 X102.713 Y120.048 I-.065 J2.638 E.00547
; LINE_WIDTH: 0.214699
G1 X103.057 Y120.108 E.00489
M204 S10000
G1 X103.052 Y120.125 F42000
; LINE_WIDTH: 0.106731
G1 F15000
M204 S6000
G1 X102.334 Y119.907 E.0039
; WIPE_START
G1 X103.052 Y120.125 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.387 Y125.24 Z4 F42000
G1 X92.25 Y129.878 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X92.25 Y128.25 E.05401
G1 X91.75 Y127.75 E.02343
G1 X91.75 Y128.25 E.01656
G1 X92.25 Y127.75 E.02343
G1 X92.25 Y126.122 E.05401
; WIPE_START
G1 X92.25 Y127.75 E-.61876
G1 X91.987 Y128.013 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.397 Y121.915 Z4 F42000
G1 X86.95 Y121.322 Z4
G1 Z3.6
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X86.95 Y122.3 E.03245
G1 X86.3 Y122.3 E.02156
G1 X86.725 Y122.725 E.01991
G1 X89.599 Y122.725 E.09536
G1 X91.873 Y120.451 E.10667
G1 X92.127 Y120.451 E.00842
G1 X94.401 Y122.725 E.10667
G1 X97.275 Y122.725 E.09536
G1 X97.7 Y122.3 E.01991
G1 X97.05 Y122.3 E.02156
G1 X97.05 Y121.322 E.03245
; WIPE_START
G1 X97.05 Y122.3 E-.37176
G1 X97.7 Y122.3 E-.247
G1 X97.437 Y122.563 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.999 Y120.852 Z4 F42000
G1 X86.406 Y120.025 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280082
G1 F15000
M204 S6000
G1 X81.611 Y120.025 E.09267
G2 X81.332 Y120.042 I.014 J2.53 E.00539
; LINE_WIDTH: 0.236758
G1 X81.26 Y120.052 E.00115
; LINE_WIDTH: 0.211173
G1 X80.943 Y120.108 E.00441
; WIPE_START
G1 X81.26 Y120.052 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.108 Y127.683 Z4 F42000
G1 X80.944 Y135.886 Z4
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.194041
G1 F15000
M204 S6000
G1 X81.233 Y135.944 E.00363
; LINE_WIDTH: 0.224939
G1 X81.277 Y135.951 E.00065
; LINE_WIDTH: 0.27976
G2 X81.613 Y135.975 I.355 J-2.561 E.00652
G1 X86.406 Y135.975 E.0925
; WIPE_START
G1 X84.406 Y135.975 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.999 Y135.196 Z4 F42000
G1 X97.05 Y134.678 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.05 Y133.7 E.03245
G1 X97.7 Y133.7 E.02156
G1 X97.275 Y133.275 E.01991
G1 X94.401 Y133.275 E.09536
G1 X92.126 Y135.55 E.10669
G1 X91.874 Y135.55 E.00838
G1 X89.599 Y133.275 E.10669
G1 X86.725 Y133.275 E.09536
G1 X86.3 Y133.7 E.01991
G1 X86.95 Y133.7 E.02156
G1 X86.95 Y134.678 E.03245
; WIPE_START
G1 X86.95 Y133.7 E-.37176
G1 X86.3 Y133.7 E-.247
G1 X86.563 Y133.437 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.001 Y135.148 Z4 F42000
G1 X97.594 Y135.975 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280704
G1 F15000
M204 S6000
G1 X102.389 Y135.975 E.09291
G2 X102.557 Y135.969 I-.007 J-2.54 E.00325
; LINE_WIDTH: 0.247882
G2 X102.752 Y135.946 I-.153 J-2.12 E.00328
; LINE_WIDTH: 0.209409
G1 X103.057 Y135.891 E.0042
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X102.752 Y135.946 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 19/42
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z4 I.249 J1.191 P1  F42000
G1 X164.598 Y123.023 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X164.598 Y132.977 E.3302
G1 X172.198 Y132.977 E.25211
G1 X172.198 Y134.777 E.05971
G1 X175.397 Y134.777 E.1061
G3 X174.392 Y135.898 I-1.005 J.11 E.05631
G1 X153.615 Y135.898 E.68922
G3 X152.604 Y134.777 I-.004 J-1.014 E.0565
G1 X155.802 Y134.777 E.1061
G1 X155.802 Y132.977 E.05971
G1 X163.402 Y132.977 E.25211
G1 X163.402 Y123.023 E.3302
G1 X155.802 Y123.023 E.25211
G1 X155.802 Y121.223 E.05971
G1 X152.603 Y121.223 E.1061
G3 X153.608 Y120.102 I1.005 J-.11 E.05631
G1 X174.427 Y120.103 E.6906
G3 X175.401 Y121.223 I-.04 J1.018 E.05515
G1 X172.198 Y121.223 E.10624
G1 X172.198 Y123.023 E.05971
G1 X164.658 Y123.023 E.25012
M204 S250
G1 X164.99 Y123.415 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X164.99 Y132.585 E.28177
G1 X172.59 Y132.585 E.23353
G1 X172.59 Y134.385 E.05531
G1 X173.303 Y134.385 E.02189
G1 X173.31 Y134.185 E.00615
G1 X173.69 Y134.185 E.01169
G1 X173.695 Y134.385 E.00615
G1 X174.503 Y134.385 E.02482
G1 X174.51 Y134.185 E.00615
G1 X174.89 Y134.185 E.01169
G1 X174.895 Y134.385 E.00615
G1 X175.789 Y134.385 E.02749
G3 X175.783 Y135.034 I-4.556 J.282 E.01997
G3 X174.397 Y136.29 I-1.385 J-.136 E.06303
G1 X153.605 Y136.29 E.63887
G3 X152.212 Y134.969 I-.002 J-1.393 E.0651
G1 X152.21 Y134.385 E.01793
G1 X153.103 Y134.385 E.02741
G1 X153.11 Y134.185 E.00615
G1 X153.49 Y134.185 E.01169
G1 X153.495 Y134.385 E.00615
G1 X154.305 Y134.385 E.02491
G1 X154.31 Y134.185 E.00614
G1 X154.69 Y134.186 E.01169
G1 X154.697 Y134.385 E.00613
G1 X155.41 Y134.385 E.02189
G1 X155.41 Y132.585 E.05531
G1 X163.01 Y132.585 E.23353
G1 X163.01 Y123.415 E.28177
G1 X155.41 Y123.415 E.23353
G1 X155.41 Y121.615 E.05531
G1 X154.697 Y121.615 E.02189
G1 X154.69 Y121.815 E.00615
G1 X154.31 Y121.815 E.01169
G1 X154.305 Y121.615 E.00615
G1 X153.497 Y121.615 E.02482
G1 X153.49 Y121.815 E.00615
G1 X153.11 Y121.815 E.01169
G1 X153.105 Y121.615 E.00615
G1 X152.21 Y121.615 E.02749
G3 X152.217 Y120.966 I4.542 J-.282 E.01997
G3 X153.603 Y119.71 I1.388 J.14 E.06298
G1 X174.438 Y119.711 E.64021
G3 X175.79 Y121.103 I-.047 J1.398 E.06588
G1 X175.79 Y121.615 E.01574
G1 X174.897 Y121.615 E.02742
G1 X174.89 Y121.815 E.00615
G1 X174.51 Y121.815 E.01169
G1 X174.505 Y121.615 E.00615
G1 X173.695 Y121.615 E.02491
G1 X173.69 Y121.815 E.00614
G1 X173.31 Y121.814 E.01169
G1 X173.303 Y121.615 E.00613
G1 X172.59 Y121.615 E.02189
G1 X172.59 Y123.415 E.05531
G1 X165.05 Y123.415 E.23168
; WIPE_START
M204 S6000
G1 X165.037 Y125.415 E-.76
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
G1 X164.25 Y126.122 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X164.25 Y127.75 E.05401
G1 X163.75 Y128.25 E.02343
G1 X163.75 Y127.75 E.01656
G1 X164.25 Y128.25 E.02343
G1 X164.25 Y129.878 E.05401
; WIPE_START
G1 X164.25 Y128.25 E-.61876
G1 X163.987 Y127.987 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.808 Y132.468 Z4.2 F42000
G1 X154.145 Y135.125 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X155.773 Y135.125 E.05401
G1 X156.198 Y135.55 E.01991
G1 X156.45 Y135.55 E.00838
G1 X158.675 Y133.325 E.10435
G1 X161.649 Y133.325 E.09868
G1 X163.874 Y135.55 E.10435
G1 X164.126 Y135.55 E.00838
G1 X166.351 Y133.325 E.10435
G1 X169.325 Y133.325 E.09868
G1 X171.55 Y135.55 E.10435
G1 X171.802 Y135.55 E.00838
G1 X172.227 Y135.125 E.01991
G1 X173.855 Y135.125 E.05401
; WIPE_START
G1 X172.227 Y135.125 E-.61876
G1 X171.964 Y135.388 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X172.95 Y127.82 Z4.2 F42000
G1 X173.855 Y120.875 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X172.227 Y120.875 E.05401
G1 X171.803 Y120.451 E.01986
G1 X171.549 Y120.451 E.00844
G1 X169.325 Y122.675 E.1043
G1 X166.351 Y122.675 E.09868
G1 X164.127 Y120.451 E.10432
G1 X163.873 Y120.451 E.00841
G1 X161.649 Y122.675 E.10432
G1 X158.675 Y122.675 E.09868
G1 X156.45 Y120.45 E.10434
G1 X156.198 Y120.45 E.00839
G1 X155.773 Y120.875 E.0199
G1 X154.145 Y120.875 E.05401
; OBJECT_ID: 405
; WIPE_START
G1 X155.773 Y120.875 E-.61876
G1 X156.036 Y120.612 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
M73 P60 R9
G1 X148.434 Y121.287 Z4.2 F42000
G1 X128.598 Y123.048 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X128.598 Y132.952 E.32854
G1 X136.198 Y132.952 E.25211
G1 X136.198 Y134.727 E.05888
G1 X139.397 Y134.727 E.1061
G3 X138.392 Y135.898 I-1.007 J.152 E.05805
G1 X125.802 Y135.898 E.41764
G1 X125.802 Y132.952 E.09772
G1 X127.402 Y132.952 E.05307
G1 X127.402 Y123.048 E.32854
G1 X119.802 Y123.048 E.25211
G1 X119.802 Y121.273 E.05888
G1 X116.603 Y121.273 E.1061
G3 X117.615 Y120.102 I1.011 J-.149 E.05823
G1 X130.198 Y120.102 E.4174
G1 X130.198 Y123.048 E.09772
G1 X128.658 Y123.048 E.05108
M204 S250
G1 X128.99 Y123.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X128.99 Y132.56 E.28023
G1 X136.59 Y132.56 E.23353
G1 X136.59 Y134.335 E.05454
G1 X139.79 Y134.335 E.09831
G3 X139.783 Y135.034 I-4.881 J.307 E.02149
G3 X138.397 Y136.29 I-1.387 J-.137 E.06302
G1 X125.41 Y136.29 E.39906
G1 X125.41 Y132.56 E.11461
G1 X127.01 Y132.56 E.04916
G1 X127.01 Y123.44 E.28023
G1 X119.41 Y123.44 E.23353
G1 X119.41 Y121.665 E.05454
G1 X116.21 Y121.665 E.09831
G1 X116.212 Y121.031 E.01947
G3 X117.605 Y119.71 I1.389 J.07 E.06513
G1 X130.59 Y119.71 E.39898
G1 X130.59 Y123.44 E.11461
G1 X129.05 Y123.44 E.04732
; WIPE_START
M204 S6000
G1 X129.037 Y125.44 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.347 Y132.883 Z4.2 F42000
G1 X127.253 Y133.3 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X126.15 Y133.3 E.03657
G1 X126.15 Y133.826 E.01745
G1 X127.874 Y135.55 E.08085
G1 X128.126 Y135.55 E.00838
G1 X130.376 Y133.3 E.10552
G1 X133.3 Y133.3 E.09702
G1 X135.55 Y135.55 E.10552
G1 X135.802 Y135.55 E.00838
G1 X136.277 Y135.075 E.02225
G1 X137.905 Y135.075 E.05401
; WIPE_START
G1 X136.277 Y135.075 E-.61876
G1 X136.014 Y135.338 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.067 Y130.554 Z4.2 F42000
G1 X118.095 Y120.925 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X119.723 Y120.925 E.05401
G1 X120.193 Y120.455 E.02204
G1 X120.455 Y120.455 E.00867
G1 X122.7 Y122.7 E.10532
G1 X125.624 Y122.7 E.09702
G1 X127.873 Y120.451 E.10547
G1 X128.127 Y120.451 E.00844
G1 X129.85 Y122.174 E.08081
G1 X129.85 Y122.7 E.01745
G1 X128.25 Y122.7 E.05307
G1 X128.25 Y127.75 E.16754
G1 X127.75 Y128.25 E.02343
G1 X127.75 Y127.75 E.01656
G1 X128.25 Y128.25 E.02343
G1 X128.25 Y129.878 E.05401
; OBJECT_ID: 394
; WIPE_START
G1 X128.25 Y128.25 E-.61876
G1 X127.987 Y127.987 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X120.523 Y129.582 Z4.2 F42000
G1 X97.79 Y134.44 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X103.41 Y134.44 E.17269
G1 X103.41 Y135.66 E.03749
G1 X97.79 Y135.66 E.17269
G1 X97.79 Y134.5 E.03564
; WIPE_START
M204 S6000
G1 X99.79 Y134.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.622 Y126.936 Z4.2 F42000
G1 X97.79 Y121.56 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X97.79 Y120.34 E.03749
G1 X103.41 Y120.34 E.17269
G1 X103.41 Y121.56 E.03749
G1 X97.85 Y121.56 E.17084
M204 S10000
G1 X97.398 Y121.56 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.398 Y121.952 E.01301
G1 X100.198 Y121.952 E.09288
G1 X100.198 Y123.073 E.03718
G1 X92.598 Y123.073 E.25211
G1 X92.598 Y132.927 E.32688
G1 X100.198 Y132.927 E.25211
G1 X100.198 Y134.048 E.03718
G1 X97.398 Y134.048 E.09288
G1 X97.398 Y135.898 E.06137
G1 X86.602 Y135.898 E.35812
G1 X86.602 Y134.048 E.06137
G1 X83.802 Y134.048 E.09288
G1 X83.802 Y132.927 E.03718
G1 X91.402 Y132.927 E.25211
G1 X91.402 Y123.073 E.32688
G1 X83.802 Y123.073 E.25211
G1 X83.802 Y121.952 E.03718
G1 X86.602 Y121.952 E.09288
G1 X86.602 Y120.102 E.06136
G1 X97.398 Y120.103 E.35812
G1 X97.398 Y121.5 E.04634
; WIPE_START
G1 X97.398 Y121.952 E-.17179
G1 X98.946 Y121.952 E-.58821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.317 Y121.717 Z4.2 F42000
G1 X86.21 Y121.56 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X80.59 Y121.56 E.17269
G1 X80.59 Y120.34 E.03749
G1 X86.21 Y120.34 E.17269
G1 X86.21 Y121.5 E.03564
; WIPE_START
M204 S6000
G1 X84.21 Y121.521 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.378 Y129.064 Z4.2 F42000
G1 X86.21 Y134.44 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X86.21 Y135.66 E.03749
G1 X80.59 Y135.66 E.17269
G1 X80.59 Y134.44 E.03749
G1 X86.15 Y134.44 E.17084
; WIPE_START
M204 S6000
G1 X86.21 Y135.66 E-.46416
G1 X85.431 Y135.66 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.452 Y129.173 Z4.2 F42000
G1 X92.99 Y123.465 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X92.99 Y132.535 E.2787
G1 X100.59 Y132.535 E.23353
G1 X100.59 Y134.31 E.05454
G1 X103.56 Y134.31 E.09126
G1 X103.56 Y133.835 E.0146
G1 X103.79 Y133.835 E.00706
G1 X103.788 Y134.968 E.03482
G3 X102.397 Y136.29 I-1.398 J-.078 E.06496
G1 X81.605 Y136.29 E.63887
G3 X80.21 Y134.897 I.004 J-1.4 E.06722
G1 X80.21 Y133.835 E.03264
G1 X80.44 Y133.835 E.00707
G1 X80.44 Y134.31 E.0146
G1 X83.41 Y134.31 E.09126
G1 X83.41 Y132.535 E.05454
G1 X91.01 Y132.535 E.23353
G1 X91.01 Y123.465 E.2787
G1 X83.41 Y123.465 E.23353
G1 X83.41 Y121.69 E.05454
G1 X80.44 Y121.69 E.09126
G1 X80.44 Y122.165 E.0146
G1 X80.21 Y122.165 E.00706
G1 X80.212 Y121.032 E.03482
G3 X81.603 Y119.71 I1.398 J.078 E.06496
G1 X102.438 Y119.711 E.64021
G3 X103.79 Y121.105 I-.045 J1.396 E.06598
G1 X103.79 Y122.165 E.03256
G1 X103.56 Y122.165 E.00707
G1 X103.56 Y121.69 E.0146
G1 X100.59 Y121.69 E.09126
G1 X100.59 Y123.465 E.05454
G1 X93.05 Y123.465 E.23168
; WIPE_START
M204 S6000
G1 X93.037 Y125.465 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.25 Y126.122 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X92.25 Y127.75 E.05401
G1 X91.75 Y128.25 E.02343
G1 X91.75 Y127.75 E.01656
G1 X92.25 Y128.25 E.02343
G1 X92.25 Y129.878 E.05401
; WIPE_START
G1 X92.25 Y128.25 E-.61876
G1 X91.987 Y127.987 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.397 Y134.085 Z4.2 F42000
G1 X86.95 Y134.678 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X86.95 Y133.7 E.03245
G1 X86.3 Y133.7 E.02156
G1 X86.725 Y133.275 E.01991
G1 X89.599 Y133.275 E.09536
G1 X91.874 Y135.55 E.10669
G1 X92.126 Y135.55 E.00838
G1 X94.401 Y133.275 E.10669
G1 X97.275 Y133.275 E.09536
G1 X97.7 Y133.7 E.01991
G1 X97.05 Y133.7 E.02156
G1 X97.05 Y134.678 E.03245
; WIPE_START
G1 X97.05 Y133.7 E-.37176
G1 X97.7 Y133.7 E-.247
G1 X97.437 Y133.437 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.594 Y135.975 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279985
G1 F15000
M204 S6000
G1 X102.559 Y135.969 E.0959
; LINE_WIDTH: 0.247946
G2 X102.75 Y135.946 I-.154 J-2.113 E.00323
; LINE_WIDTH: 0.209678
G1 X103.056 Y135.891 E.00423
; WIPE_START
G1 X102.75 Y135.946 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.978 Y128.835 Z4.2 F42000
G1 X97.05 Y121.322 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.05 Y122.3 E.03245
G1 X97.7 Y122.3 E.02156
G1 X97.275 Y122.725 E.01991
G1 X94.401 Y122.725 E.09536
G1 X92.127 Y120.451 E.10667
G1 X91.873 Y120.451 E.00841
G1 X89.599 Y122.725 E.10667
G1 X86.725 Y122.725 E.09536
G1 X86.3 Y122.3 E.01991
G1 X86.95 Y122.3 E.02156
G1 X86.95 Y121.322 E.03245
; WIPE_START
G1 X86.95 Y122.3 E-.37176
G1 X86.3 Y122.3 E-.247
G1 X86.563 Y122.563 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.406 Y120.025 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.27939
G1 F15000
M204 S6000
G1 X81.552 Y120.026 E.09353
G2 X81.332 Y120.042 I.055 J2.248 E.00425
; LINE_WIDTH: 0.236471
G1 X81.259 Y120.052 E.00117
; LINE_WIDTH: 0.210996
G1 X80.943 Y120.108 E.00438
; WIPE_START
G1 X81.259 Y120.052 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.106 Y127.683 Z4.2 F42000
G1 X80.942 Y135.889 Z4.2
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.205394
G1 F15000
M204 S6000
G1 X81.221 Y135.941 E.00376
; LINE_WIDTH: 0.231041
G1 X81.337 Y135.959 E.0018
; LINE_WIDTH: 0.280237
G2 X81.613 Y135.975 I.286 J-2.492 E.00535
G1 X86.406 Y135.975 E.09268
; WIPE_START
G1 X84.406 Y135.975 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.27 Y130.093 Z4.2 F42000
G1 X97.594 Y120.025 Z4.2
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.278894
G1 F15000
M204 S6000
G1 X102.429 Y120.026 E.09297
G3 X102.719 Y120.049 I-.046 J2.373 E.0056
; LINE_WIDTH: 0.213674
G1 X103.059 Y120.108 E.0048
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X102.719 Y120.049 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 20/42
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z4.2 I-.058 J1.216 P1  F42000
G1 X164.598 Y123.023 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X164.598 Y132.977 E.3302
G1 X172.198 Y132.977 E.25211
G1 X172.198 Y134.777 E.05971
G1 X175.397 Y134.777 E.1061
G3 X174.385 Y135.898 I-1.005 J.11 E.05655
G1 X153.615 Y135.898 E.68898
G3 X152.604 Y134.777 I-.008 J-1.009 E.05658
G1 X155.802 Y134.777 E.1061
G1 X155.802 Y132.977 E.05971
G1 X163.402 Y132.977 E.25211
G1 X163.402 Y123.023 E.3302
G1 X155.802 Y123.023 E.25211
G1 X155.802 Y121.223 E.05971
G1 X152.603 Y121.223 E.1061
G3 X153.608 Y120.102 I1.005 J-.11 E.05631
G1 X174.425 Y120.103 E.69053
G3 X175.403 Y121.223 I-.034 J1.018 E.05531
G1 X172.198 Y121.223 E.10633
G1 X172.198 Y123.023 E.05971
G1 X164.658 Y123.023 E.25012
M204 S250
G1 X164.99 Y123.415 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X164.99 Y132.585 E.28177
G1 X172.59 Y132.585 E.23353
G1 X172.59 Y134.385 E.05531
G1 X173.302 Y134.385 E.02189
G1 X173.31 Y134.185 E.00615
G1 X173.69 Y134.185 E.01169
G1 X173.695 Y134.385 E.00615
G1 X174.502 Y134.385 E.02482
G1 X174.51 Y134.185 E.00615
G1 X174.89 Y134.185 E.01169
G1 X174.895 Y134.385 E.00615
G1 X175.789 Y134.385 E.0275
G3 X175.783 Y135.035 I-4.557 J.282 E.01998
G3 X174.395 Y136.29 I-1.385 J-.136 E.0631
G1 X153.605 Y136.29 E.6388
G3 X152.212 Y134.969 I.002 J-1.398 E.06505
G1 X152.21 Y134.385 E.01794
G1 X153.102 Y134.385 E.02741
G1 X153.11 Y134.185 E.00615
G1 X153.49 Y134.185 E.01169
G1 X153.495 Y134.385 E.00615
G1 X154.305 Y134.385 E.02491
G1 X154.31 Y134.185 E.00614
G1 X154.69 Y134.186 E.01169
G1 X154.697 Y134.385 E.00613
G1 X155.41 Y134.385 E.02189
G1 X155.41 Y132.585 E.05531
G1 X163.01 Y132.585 E.23353
G1 X163.01 Y123.415 E.28177
G1 X155.41 Y123.415 E.23353
G1 X155.41 Y121.615 E.05531
G1 X154.698 Y121.615 E.02189
G1 X154.69 Y121.815 E.00615
G1 X154.31 Y121.815 E.01169
G1 X154.305 Y121.615 E.00615
G1 X153.498 Y121.615 E.02482
G1 X153.49 Y121.815 E.00615
G1 X153.11 Y121.815 E.01169
G1 X153.105 Y121.615 E.00615
G1 X152.21 Y121.615 E.0275
G3 X152.217 Y120.965 I4.551 J-.282 E.01998
G3 X153.603 Y119.71 I1.388 J.14 E.06298
G1 X174.436 Y119.711 E.64015
G3 X175.79 Y121.105 I-.039 J1.392 E.0661
G1 X175.79 Y121.615 E.01566
G1 X174.898 Y121.615 E.02742
G1 X174.89 Y121.815 E.00615
G1 X174.51 Y121.815 E.01169
G1 X174.505 Y121.615 E.00615
G1 X173.695 Y121.615 E.02491
G1 X173.69 Y121.815 E.00614
G1 X173.31 Y121.814 E.01169
G1 X173.302 Y121.615 E.00613
G1 X172.59 Y121.615 E.02189
G1 X172.59 Y123.415 E.05531
G1 X165.05 Y123.415 E.23168
; WIPE_START
M204 S6000
G1 X165.037 Y125.415 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
M73 P61 R9
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
G1 X164.25 Y129.878 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X164.25 Y128.25 E.05401
G1 X163.75 Y127.75 E.02343
G1 X163.75 Y128.25 E.01656
G1 X164.25 Y127.75 E.02343
G1 X164.25 Y126.122 E.05401
; WIPE_START
G1 X164.25 Y127.75 E-.61876
G1 X163.987 Y128.013 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.808 Y123.532 Z4.4 F42000
G1 X154.145 Y120.875 Z4.4
G1 Z4
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X155.773 Y120.875 E.05401
G1 X156.198 Y120.45 E.0199
G1 X156.45 Y120.45 E.00839
G1 X158.675 Y122.675 E.10434
G1 X161.649 Y122.675 E.09868
G1 X163.873 Y120.451 E.10432
G1 X164.127 Y120.451 E.00841
G1 X166.351 Y122.675 E.10432
G1 X169.325 Y122.675 E.09868
G1 X171.549 Y120.451 E.10431
G1 X171.803 Y120.451 E.00844
G1 X172.227 Y120.875 E.01986
G1 X173.855 Y120.875 E.05401
; WIPE_START
G1 X172.227 Y120.875 E-.61876
G1 X171.964 Y120.612 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X172.95 Y128.18 Z4.4 F42000
G1 X173.855 Y135.125 Z4.4
G1 Z4
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X172.227 Y135.125 E.05401
G1 X171.802 Y135.55 E.01991
G1 X171.55 Y135.55 E.00838
G1 X169.325 Y133.325 E.10435
G1 X166.351 Y133.325 E.09868
G1 X164.126 Y135.55 E.10435
G1 X163.874 Y135.55 E.00838
G1 X161.649 Y133.325 E.10435
G1 X158.675 Y133.325 E.09868
G1 X156.45 Y135.55 E.10435
G1 X156.198 Y135.55 E.00838
G1 X155.773 Y135.125 E.01991
G1 X154.145 Y135.125 E.05401
; OBJECT_ID: 405
; WIPE_START
G1 X155.773 Y135.125 E-.61876
G1 X156.036 Y135.388 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X149.075 Y132.258 Z4.4 F42000
G1 X128.598 Y123.048 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X128.598 Y132.952 E.32854
G1 X136.198 Y132.952 E.25211
G1 X136.198 Y134.727 E.05888
G1 X139.397 Y134.727 E.1061
G3 X138.385 Y135.898 I-1.007 J.152 E.05829
G1 X125.802 Y135.898 E.4174
G1 X125.802 Y132.952 E.09772
G1 X127.402 Y132.952 E.05307
G1 X127.402 Y123.048 E.32854
G1 X119.802 Y123.048 E.25211
G1 X119.802 Y121.273 E.05888
G1 X116.603 Y121.273 E.1061
G3 X117.615 Y120.102 I1.011 J-.149 E.05822
G1 X130.198 Y120.102 E.4174
G1 X130.198 Y123.048 E.09772
G1 X128.658 Y123.048 E.05108
M204 S250
G1 X128.99 Y123.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X128.99 Y132.56 E.28023
G1 X136.59 Y132.56 E.23353
G1 X136.59 Y134.335 E.05454
G1 X139.79 Y134.335 E.09831
G3 X139.783 Y135.034 I-4.881 J.307 E.02149
G3 X138.395 Y136.29 I-1.387 J-.137 E.0631
G1 X125.41 Y136.29 E.39898
G1 X125.41 Y132.56 E.11461
G1 X127.01 Y132.56 E.04916
G1 X127.01 Y123.44 E.28023
G1 X119.41 Y123.44 E.23353
G1 X119.41 Y121.665 E.05454
G1 X116.21 Y121.665 E.09831
G3 X116.217 Y120.966 I4.876 J-.307 E.02149
G3 X117.605 Y119.71 I1.391 J.142 E.06306
G1 X130.59 Y119.71 E.39898
G1 X130.59 Y123.44 E.11461
G1 X129.05 Y123.44 E.04732
; WIPE_START
M204 S6000
G1 X129.037 Y125.44 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.25 Y129.878 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X128.25 Y128.25 E.05401
G1 X127.75 Y127.75 E.02343
G1 X127.75 Y128.25 E.01656
G1 X128.25 Y127.75 E.02343
G1 X128.25 Y122.7 E.16754
G1 X129.85 Y122.7 E.05307
G1 X129.85 Y122.174 E.01745
G1 X128.127 Y120.451 E.08081
G1 X127.873 Y120.451 E.00844
G1 X125.624 Y122.7 E.10547
G1 X122.7 Y122.7 E.09702
G1 X120.455 Y120.455 E.10532
G1 X120.193 Y120.455 E.00866
G1 X119.723 Y120.925 E.02205
G1 X118.095 Y120.925 E.05401
; WIPE_START
G1 X119.723 Y120.925 E-.61876
G1 X119.986 Y120.662 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.933 Y125.446 Z4.4 F42000
G1 X137.905 Y135.075 Z4.4
G1 Z4
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X136.277 Y135.075 E.05401
G1 X135.802 Y135.55 E.02225
G1 X135.55 Y135.55 E.00838
G1 X133.3 Y133.3 E.10552
G1 X130.376 Y133.3 E.09702
G1 X128.126 Y135.55 E.10552
G1 X127.874 Y135.55 E.00838
G1 X126.15 Y133.826 E.08085
G1 X126.15 Y133.3 E.01745
G1 X127.253 Y133.3 E.03657
; OBJECT_ID: 394
; WIPE_START
G1 X126.15 Y133.3 E-.4189
G1 X126.15 Y133.826 E-.19986
G1 X126.413 Y134.089 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X118.781 Y134.183 Z4.4 F42000
G1 X97.79 Y134.44 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X103.41 Y134.44 E.17269
G1 X103.41 Y135.66 E.03749
G1 X97.79 Y135.66 E.17269
G1 X97.79 Y134.5 E.03564
; WIPE_START
M204 S6000
G1 X99.79 Y134.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.622 Y126.936 Z4.4 F42000
G1 X97.79 Y121.56 Z4.4
G1 Z4
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X97.79 Y120.34 E.03749
G1 X103.41 Y120.34 E.17269
G1 X103.41 Y121.56 E.03749
G1 X97.85 Y121.56 E.17084
M204 S10000
G1 X97.398 Y121.56 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.398 Y121.952 E.01301
G1 X100.198 Y121.952 E.09288
G1 X100.198 Y123.073 E.03718
G1 X92.598 Y123.073 E.25211
G1 X92.598 Y132.927 E.32688
G1 X100.198 Y132.927 E.25211
G1 X100.198 Y134.048 E.03718
G1 X97.398 Y134.048 E.09288
G1 X97.398 Y135.898 E.06137
G1 X86.602 Y135.898 E.35812
G1 X86.602 Y134.048 E.06137
G1 X83.802 Y134.048 E.09288
G1 X83.802 Y132.927 E.03718
G1 X91.402 Y132.927 E.25211
G1 X91.402 Y123.073 E.32688
G1 X83.802 Y123.073 E.25211
G1 X83.802 Y121.952 E.03718
G1 X86.602 Y121.952 E.09288
G1 X86.602 Y120.102 E.06136
G1 X97.398 Y120.103 E.35812
G1 X97.398 Y121.5 E.04635
; WIPE_START
G1 X97.398 Y121.952 E-.17179
G1 X98.946 Y121.952 E-.58821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.317 Y121.717 Z4.4 F42000
G1 X86.21 Y121.56 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X80.59 Y121.56 E.17269
G1 X80.59 Y120.34 E.03749
G1 X86.21 Y120.34 E.17269
G1 X86.21 Y121.5 E.03564
; WIPE_START
M204 S6000
G1 X84.21 Y121.521 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.378 Y129.064 Z4.4 F42000
G1 X86.21 Y134.44 Z4.4
G1 Z4
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X86.21 Y135.66 E.03749
G1 X80.59 Y135.66 E.17269
G1 X80.59 Y134.44 E.03749
G1 X86.15 Y134.44 E.17084
; WIPE_START
M204 S6000
G1 X86.21 Y135.66 E-.46416
G1 X85.431 Y135.66 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.452 Y129.173 Z4.4 F42000
G1 X92.99 Y123.465 Z4.4
G1 Z4
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X92.99 Y132.535 E.2787
G1 X100.59 Y132.535 E.23353
G1 X100.59 Y134.31 E.05454
G1 X103.56 Y134.31 E.09126
G1 X103.56 Y133.835 E.0146
G1 X103.79 Y133.835 E.00706
G1 X103.788 Y134.968 E.03482
G3 X102.395 Y136.29 I-1.398 J-.078 E.06504
G1 X81.605 Y136.29 E.6388
G3 X80.21 Y134.897 I.002 J-1.397 E.06725
G1 X80.21 Y133.835 E.03264
G1 X80.44 Y133.835 E.00707
G1 X80.44 Y134.31 E.0146
G1 X83.41 Y134.31 E.09126
G1 X83.41 Y132.535 E.05454
G1 X91.01 Y132.535 E.23353
G1 X91.01 Y123.465 E.2787
G1 X83.41 Y123.465 E.23353
G1 X83.41 Y121.69 E.05454
G1 X80.44 Y121.69 E.09126
G1 X80.44 Y122.165 E.0146
G1 X80.21 Y122.165 E.00706
G1 X80.212 Y121.032 E.03482
G3 X81.603 Y119.71 I1.406 J.086 E.06487
G1 X102.436 Y119.711 E.64015
G3 X103.79 Y121.105 I-.036 J1.39 E.06613
G1 X103.79 Y122.165 E.03256
G1 X103.56 Y122.165 E.00707
G1 X103.56 Y121.69 E.0146
G1 X100.59 Y121.69 E.09126
G1 X100.59 Y123.465 E.05454
G1 X93.05 Y123.465 E.23168
; WIPE_START
M204 S6000
G1 X93.037 Y125.465 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.594 Y120.025 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279296
G1 F15000
M204 S6000
G1 X102.426 Y120.026 E.09306
G3 X102.67 Y120.042 I-.022 J2.133 E.00472
; LINE_WIDTH: 0.231774
G1 X102.77 Y120.057 E.00155
; LINE_WIDTH: 0.199798
G1 X103.055 Y120.113 E.00372
; WIPE_START
G1 X102.77 Y120.057 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.191 Y125.265 Z4.4 F42000
G1 X92.25 Y129.878 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X92.25 Y128.25 E.05401
G1 X91.75 Y127.75 E.02343
G1 X91.75 Y128.25 E.01656
G1 X92.25 Y127.75 E.02343
G1 X92.25 Y126.122 E.05401
; WIPE_START
G1 X92.25 Y127.75 E-.61876
G1 X91.987 Y128.013 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.397 Y121.915 Z4.4 F42000
G1 X86.95 Y121.322 Z4.4
G1 Z4
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X86.95 Y122.3 E.03245
G1 X86.3 Y122.3 E.02156
G1 X86.725 Y122.725 E.01991
G1 X89.599 Y122.725 E.09536
G1 X91.873 Y120.451 E.10667
G1 X92.127 Y120.451 E.00841
G1 X94.401 Y122.725 E.10667
G1 X97.275 Y122.725 E.09536
G1 X97.7 Y122.3 E.01991
G1 X97.05 Y122.3 E.02156
G1 X97.05 Y121.322 E.03245
; WIPE_START
G1 X97.05 Y122.3 E-.37176
G1 X97.7 Y122.3 E-.247
G1 X97.437 Y122.563 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.999 Y120.852 Z4.4 F42000
G1 X86.406 Y120.025 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279402
G1 F15000
M204 S6000
G1 X81.552 Y120.026 E.09353
G2 X81.333 Y120.042 I.055 J2.251 E.00424
; LINE_WIDTH: 0.236204
G1 X81.257 Y120.053 E.00121
; LINE_WIDTH: 0.210667
G1 X80.942 Y120.109 E.00437
; WIPE_START
G1 X81.257 Y120.053 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.107 Y127.684 Z4.4 F42000
G1 X80.945 Y135.88 Z4.4
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.166833
G1 F15000
M204 S6000
G2 X81.184 Y135.933 I.717 J-2.639 E.00247
; LINE_WIDTH: 0.210646
G1 X81.252 Y135.946 E.00094
; LINE_WIDTH: 0.241195
G1 X81.384 Y135.964 E.00216
; LINE_WIDTH: 0.280485
G2 X81.613 Y135.975 I.227 J-2.33 E.00444
G1 X86.406 Y135.975 E.09278
; WIPE_START
G1 X84.406 Y135.975 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.999 Y135.196 Z4.4 F42000
G1 X97.05 Y134.678 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.05 Y133.7 E.03245
G1 X97.7 Y133.7 E.02156
G1 X97.275 Y133.275 E.01991
G1 X94.401 Y133.275 E.09536
G1 X92.126 Y135.55 E.10669
G1 X91.874 Y135.55 E.00838
G1 X89.599 Y133.275 E.10669
G1 X86.725 Y133.275 E.09536
G1 X86.3 Y133.7 E.01991
G1 X86.95 Y133.7 E.02156
G1 X86.95 Y134.678 E.03245
; WIPE_START
G1 X86.95 Y133.7 E-.37176
G1 X86.3 Y133.7 E-.247
G1 X86.563 Y133.437 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.001 Y135.148 Z4.4 F42000
G1 X97.594 Y135.975 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.28055
G1 F15000
M204 S6000
G1 X102.387 Y135.975 E.0928
G2 X102.559 Y135.969 I.005 J-2.339 E.00333
G1 X102.606 Y135.965 E.00091
; LINE_WIDTH: 0.230371
G2 X103.052 Y135.898 I-.7 J-6.164 E.0069
M204 S10000
G1 X103.052 Y135.875 F42000
; LINE_WIDTH: 0.106292
G1 F15000
M204 S6000
G1 X102.33 Y136.094 E.00389
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X103.052 Y135.875 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 21/42
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z4.4 I.249 J1.191 P1  F42000
G1 X164.598 Y123.023 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X164.598 Y132.977 E.3302
G1 X172.198 Y132.977 E.25211
G1 X172.198 Y134.777 E.05971
G1 X175.397 Y134.777 E.1061
G3 X174.392 Y135.898 I-1.005 J.11 E.05631
G1 X153.615 Y135.898 E.68922
G3 X152.604 Y134.777 I-.01 J-1.008 E.0566
G1 X155.802 Y134.777 E.1061
G1 X155.802 Y132.977 E.05971
G1 X163.402 Y132.977 E.25211
G1 X163.402 Y123.023 E.3302
G1 X155.802 Y123.023 E.25211
G1 X155.802 Y121.223 E.05971
G1 X152.603 Y121.223 E.1061
G3 X153.608 Y120.102 I1.005 J-.11 E.05631
G1 X174.423 Y120.103 E.69047
G3 X175.401 Y121.223 I-.032 J1.015 E.05533
G1 X172.198 Y121.223 E.10624
G1 X172.198 Y123.023 E.05971
G1 X164.658 Y123.023 E.25012
M204 S250
G1 X164.99 Y123.415 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X164.99 Y132.585 E.28177
G1 X172.59 Y132.585 E.23353
G1 X172.59 Y134.385 E.05531
G1 X173.302 Y134.385 E.02189
G1 X173.31 Y134.185 E.00615
G1 X173.69 Y134.185 E.01169
G1 X173.695 Y134.385 E.00615
G1 X174.502 Y134.385 E.02482
G1 X174.51 Y134.185 E.00615
G1 X174.89 Y134.185 E.01169
G1 X174.895 Y134.385 E.00615
G1 X175.789 Y134.385 E.0275
M73 P62 R9
G3 X175.783 Y135.035 I-4.557 J.282 E.01998
G3 X174.397 Y136.29 I-1.388 J-.14 E.06298
G1 X153.605 Y136.29 E.63887
G3 X152.212 Y134.968 I.004 J-1.4 E.06504
G1 X152.21 Y134.385 E.01791
G1 X153.102 Y134.385 E.02741
G1 X153.11 Y134.185 E.00615
G1 X153.49 Y134.185 E.01169
G1 X153.495 Y134.385 E.00615
G1 X154.305 Y134.385 E.02491
G1 X154.31 Y134.185 E.00614
G1 X154.69 Y134.186 E.01169
G1 X154.698 Y134.385 E.00613
G1 X155.41 Y134.385 E.02189
G1 X155.41 Y132.585 E.05531
G1 X163.01 Y132.585 E.23353
G1 X163.01 Y123.415 E.28177
G1 X155.41 Y123.415 E.23353
G1 X155.41 Y121.615 E.05531
G1 X154.698 Y121.615 E.02189
G1 X154.69 Y121.815 E.00615
G1 X154.31 Y121.815 E.01169
G1 X154.305 Y121.615 E.00615
G1 X153.498 Y121.615 E.02482
G1 X153.49 Y121.815 E.00615
G1 X153.11 Y121.815 E.01169
G1 X153.105 Y121.615 E.00615
G1 X152.21 Y121.615 E.0275
G3 X152.217 Y120.965 I4.542 J-.282 E.01998
G3 X153.603 Y119.71 I1.387 J.138 E.063
G1 X174.434 Y119.711 E.64008
G3 X175.79 Y121.103 I-.038 J1.393 E.06607
G1 X175.79 Y121.615 E.01574
G1 X174.898 Y121.615 E.02742
G1 X174.89 Y121.815 E.00615
G1 X174.51 Y121.815 E.01169
G1 X174.505 Y121.615 E.00615
G1 X173.695 Y121.615 E.02491
G1 X173.69 Y121.815 E.00614
G1 X173.31 Y121.814 E.01169
G1 X173.303 Y121.615 E.00613
G1 X172.59 Y121.615 E.02189
G1 X172.59 Y123.415 E.05531
G1 X165.05 Y123.415 E.23168
; WIPE_START
M204 S6000
G1 X165.037 Y125.415 E-.76
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
G1 X164.25 Y126.122 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X164.25 Y127.75 E.05401
G1 X163.75 Y128.25 E.02343
G1 X163.75 Y127.75 E.01656
G1 X164.25 Y128.25 E.02343
G1 X164.25 Y129.878 E.05401
; WIPE_START
G1 X164.25 Y128.25 E-.61876
G1 X163.987 Y127.987 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.808 Y132.468 Z4.6 F42000
G1 X154.145 Y135.125 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X155.773 Y135.125 E.05401
G1 X156.198 Y135.55 E.01991
G1 X156.45 Y135.55 E.00838
G1 X158.675 Y133.325 E.10435
G1 X161.649 Y133.325 E.09868
G1 X163.874 Y135.55 E.10435
G1 X164.126 Y135.55 E.00838
G1 X166.351 Y133.325 E.10435
G1 X169.325 Y133.325 E.09868
G1 X171.55 Y135.55 E.10435
G1 X171.802 Y135.55 E.00838
G1 X172.227 Y135.125 E.01991
G1 X173.855 Y135.125 E.05401
; WIPE_START
G1 X172.227 Y135.125 E-.61876
G1 X171.964 Y135.388 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X172.95 Y127.82 Z4.6 F42000
G1 X173.855 Y120.875 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X172.227 Y120.875 E.05401
G1 X171.803 Y120.451 E.01987
G1 X171.549 Y120.451 E.00843
G1 X169.325 Y122.675 E.10431
G1 X166.351 Y122.675 E.09868
G1 X164.127 Y120.451 E.10433
G1 X163.873 Y120.451 E.00841
G1 X161.649 Y122.675 E.10433
G1 X158.675 Y122.675 E.09868
G1 X156.45 Y120.45 E.10434
G1 X156.198 Y120.45 E.00839
G1 X155.773 Y120.875 E.0199
G1 X154.145 Y120.875 E.05401
; OBJECT_ID: 405
; WIPE_START
G1 X155.773 Y120.875 E-.61876
G1 X156.036 Y120.612 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X148.434 Y121.287 Z4.6 F42000
G1 X128.598 Y123.048 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X128.598 Y132.952 E.32854
G1 X136.198 Y132.952 E.25211
G1 X136.198 Y134.727 E.05888
G1 X139.397 Y134.727 E.1061
G3 X138.392 Y135.898 I-1.009 J.15 E.05802
G1 X125.802 Y135.898 E.41764
G1 X125.802 Y132.952 E.09772
G1 X127.402 Y132.952 E.05307
G1 X127.402 Y123.048 E.32854
G1 X119.802 Y123.048 E.25211
G1 X119.802 Y121.273 E.05888
G1 X116.603 Y121.273 E.1061
G3 X117.615 Y120.102 I1.011 J-.149 E.05822
G1 X130.198 Y120.102 E.4174
G1 X130.198 Y123.048 E.09772
G1 X128.658 Y123.048 E.05108
M204 S250
G1 X128.99 Y123.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X128.99 Y132.56 E.28023
G1 X136.59 Y132.56 E.23353
G1 X136.59 Y134.335 E.05454
G1 X139.79 Y134.335 E.09831
G3 X139.783 Y135.034 I-4.896 J.307 E.02149
G3 X138.397 Y136.29 I-1.385 J-.135 E.06305
G1 X125.41 Y136.29 E.39906
G1 X125.41 Y132.56 E.11461
G1 X127.01 Y132.56 E.04916
G1 X127.01 Y123.44 E.28023
G1 X119.41 Y123.44 E.23353
G1 X119.41 Y121.665 E.05454
G1 X116.21 Y121.665 E.09831
G1 X116.212 Y121.031 E.01947
G3 X117.605 Y119.71 I1.389 J.07 E.06513
G1 X130.59 Y119.71 E.39898
G1 X130.59 Y123.44 E.11461
G1 X129.05 Y123.44 E.04732
; WIPE_START
M204 S6000
G1 X129.037 Y125.44 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.347 Y132.883 Z4.6 F42000
G1 X127.253 Y133.3 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X126.15 Y133.3 E.03657
G1 X126.15 Y133.826 E.01745
G1 X127.874 Y135.55 E.08085
G1 X128.126 Y135.55 E.00838
G1 X130.376 Y133.3 E.10552
G1 X133.3 Y133.3 E.09702
G1 X135.55 Y135.55 E.10552
G1 X135.802 Y135.55 E.00838
G1 X136.277 Y135.075 E.02225
G1 X137.905 Y135.075 E.05401
; WIPE_START
G1 X136.277 Y135.075 E-.61876
G1 X136.014 Y135.338 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.067 Y130.554 Z4.6 F42000
G1 X118.095 Y120.925 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X119.723 Y120.925 E.05401
G1 X120.193 Y120.455 E.02204
G1 X120.455 Y120.455 E.00867
G1 X122.7 Y122.7 E.10532
G1 X125.624 Y122.7 E.09702
G1 X127.873 Y120.451 E.10547
G1 X128.127 Y120.451 E.00844
G1 X129.85 Y122.174 E.08081
G1 X129.85 Y122.7 E.01745
G1 X128.25 Y122.7 E.05307
G1 X128.25 Y127.75 E.16754
G1 X127.75 Y128.25 E.02343
G1 X127.75 Y127.75 E.01656
G1 X128.25 Y128.25 E.02343
G1 X128.25 Y129.878 E.05401
; OBJECT_ID: 394
; WIPE_START
G1 X128.25 Y128.25 E-.61876
G1 X127.987 Y127.987 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X120.523 Y129.582 Z4.6 F42000
G1 X97.79 Y134.44 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X103.41 Y134.44 E.17269
G1 X103.41 Y135.66 E.03749
G1 X97.79 Y135.66 E.17269
G1 X97.79 Y134.5 E.03564
; WIPE_START
M204 S6000
G1 X99.79 Y134.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.622 Y126.936 Z4.6 F42000
G1 X97.79 Y121.56 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X97.79 Y120.34 E.03749
G1 X103.41 Y120.34 E.17269
G1 X103.41 Y121.56 E.03749
G1 X97.85 Y121.56 E.17084
M204 S10000
G1 X97.398 Y121.56 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.398 Y121.952 E.01301
G1 X100.198 Y121.952 E.09288
G1 X100.198 Y123.073 E.03718
G1 X92.598 Y123.073 E.25211
G1 X92.598 Y132.927 E.32688
G1 X100.198 Y132.927 E.25211
G1 X100.198 Y134.048 E.03718
G1 X97.398 Y134.048 E.09288
G1 X97.398 Y135.898 E.06137
G1 X86.602 Y135.898 E.35812
G1 X86.602 Y134.048 E.06137
G1 X83.802 Y134.048 E.09288
G1 X83.802 Y132.927 E.03718
G1 X91.402 Y132.927 E.25211
G1 X91.402 Y123.073 E.32688
G1 X83.802 Y123.073 E.25211
G1 X83.802 Y121.952 E.03718
G1 X86.602 Y121.952 E.09288
G1 X86.602 Y120.102 E.06136
G1 X97.398 Y120.103 E.35812
G1 X97.398 Y121.5 E.04635
; WIPE_START
G1 X97.398 Y121.952 E-.17179
G1 X98.946 Y121.952 E-.58821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.317 Y121.717 Z4.6 F42000
G1 X86.21 Y121.56 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X80.59 Y121.56 E.17269
G1 X80.59 Y120.34 E.03749
G1 X86.21 Y120.34 E.17269
G1 X86.21 Y121.5 E.03564
; WIPE_START
M204 S6000
G1 X84.21 Y121.521 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.378 Y129.064 Z4.6 F42000
G1 X86.21 Y134.44 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X86.21 Y135.66 E.03749
G1 X80.59 Y135.66 E.17269
G1 X80.59 Y134.44 E.03749
G1 X86.15 Y134.44 E.17084
; WIPE_START
M204 S6000
G1 X86.21 Y135.66 E-.46416
G1 X85.431 Y135.66 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.452 Y129.173 Z4.6 F42000
G1 X92.99 Y123.465 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X92.99 Y132.535 E.2787
G1 X100.59 Y132.535 E.23353
G1 X100.59 Y134.31 E.05454
G1 X103.56 Y134.31 E.09126
G1 X103.56 Y133.835 E.0146
G1 X103.79 Y133.835 E.00706
G1 X103.788 Y134.968 E.03482
G3 X102.397 Y136.29 I-1.398 J-.078 E.06496
G1 X81.605 Y136.29 E.63887
G3 X80.21 Y134.897 I-.004 J-1.391 E.06733
G1 X80.21 Y133.835 E.03264
G1 X80.44 Y133.835 E.00707
G1 X80.44 Y134.31 E.0146
G1 X83.41 Y134.31 E.09126
G1 X83.41 Y132.535 E.05454
G1 X91.01 Y132.535 E.23353
G1 X91.01 Y123.465 E.2787
G1 X83.41 Y123.465 E.23353
G1 X83.41 Y121.69 E.05454
G1 X80.44 Y121.69 E.09126
G1 X80.44 Y122.165 E.0146
G1 X80.21 Y122.165 E.00706
G1 X80.212 Y121.032 E.03482
G3 X81.603 Y119.71 I1.398 J.078 E.06496
G1 X102.434 Y119.711 E.64008
G3 X103.79 Y121.105 I-.043 J1.398 E.06608
G1 X103.79 Y122.165 E.03256
G1 X103.56 Y122.165 E.00707
G1 X103.56 Y121.69 E.0146
G1 X100.59 Y121.69 E.09126
G1 X100.59 Y123.465 E.05454
G1 X93.05 Y123.465 E.23168
; WIPE_START
M204 S6000
G1 X93.037 Y125.465 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.25 Y126.122 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X92.25 Y127.75 E.05401
G1 X91.75 Y128.25 E.02343
G1 X91.75 Y127.75 E.01656
G1 X92.25 Y128.25 E.02343
G1 X92.25 Y129.878 E.05401
; WIPE_START
G1 X92.25 Y128.25 E-.61876
G1 X91.987 Y127.987 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.397 Y134.085 Z4.6 F42000
G1 X86.95 Y134.678 Z4.6
G1 Z4.2
M73 P62 R8
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X86.95 Y133.7 E.03245
G1 X86.3 Y133.7 E.02156
G1 X86.725 Y133.275 E.01991
G1 X89.599 Y133.275 E.09536
G1 X91.874 Y135.55 E.10669
G1 X92.126 Y135.55 E.00838
G1 X94.401 Y133.275 E.10669
G1 X97.275 Y133.275 E.09536
G1 X97.7 Y133.7 E.01991
G1 X97.05 Y133.7 E.02156
G1 X97.05 Y134.678 E.03245
; WIPE_START
G1 X97.05 Y133.7 E-.37176
G1 X97.7 Y133.7 E-.247
G1 X97.437 Y133.437 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.594 Y135.975 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279985
G1 F15000
M204 S6000
G1 X102.559 Y135.969 E.0959
; LINE_WIDTH: 0.248412
G2 X102.747 Y135.947 I-.151 J-2.094 E.00318
; LINE_WIDTH: 0.210169
G1 X103.057 Y135.892 E.00429
; WIPE_START
G1 X102.747 Y135.947 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.976 Y128.835 Z4.6 F42000
G1 X97.05 Y121.322 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.05 Y122.3 E.03245
G1 X97.7 Y122.3 E.02156
G1 X97.275 Y122.725 E.01991
G1 X94.401 Y122.725 E.09536
G1 X92.127 Y120.451 E.10667
G1 X91.873 Y120.451 E.00841
G1 X89.599 Y122.725 E.10667
G1 X86.725 Y122.725 E.09536
G1 X86.3 Y122.3 E.01991
G1 X86.95 Y122.3 E.02156
G1 X86.95 Y121.322 E.03245
; WIPE_START
G1 X86.95 Y122.3 E-.37176
G1 X86.3 Y122.3 E-.247
G1 X86.563 Y122.563 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.406 Y120.025 Z4.6 F42000
M73 P63 R8
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279403
G1 F15000
M204 S6000
G1 X81.552 Y120.026 E.09353
G2 X81.333 Y120.042 I.055 J2.247 E.00424
; LINE_WIDTH: 0.235935
G1 X81.255 Y120.053 E.00123
; LINE_WIDTH: 0.210415
G1 X80.943 Y120.108 E.00432
; WIPE_START
G1 X81.255 Y120.053 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.104 Y127.684 Z4.6 F42000
G1 X80.942 Y135.89 Z4.6
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.205369
G1 F15000
M204 S6000
G1 X81.221 Y135.941 E.00375
; LINE_WIDTH: 0.23093
G1 X81.337 Y135.959 E.0018
; LINE_WIDTH: 0.280235
G2 X81.613 Y135.975 I.285 J-2.467 E.00535
G1 X86.406 Y135.975 E.09268
; WIPE_START
G1 X84.406 Y135.975 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.27 Y130.093 Z4.6 F42000
G1 X97.594 Y120.025 Z4.6
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.279548
G1 F15000
M204 S6000
G1 X102.424 Y120.025 E.09312
G3 X102.636 Y120.038 I-.014 J1.995 E.00411
; LINE_WIDTH: 0.235375
G1 X102.771 Y120.057 E.00213
; LINE_WIDTH: 0.200001
G1 X103.055 Y120.113 E.00371
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X102.771 Y120.057 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 22/42
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z4.6 I-.058 J1.216 P1  F42000
G1 X164.598 Y123.023 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X164.598 Y132.977 E.3302
G1 X172.198 Y132.977 E.25211
G1 X172.198 Y134.777 E.05971
G1 X175.396 Y134.777 E.1061
G3 X174.385 Y135.898 I-1.011 J.105 E.05645
G1 X153.615 Y135.898 E.68898
G3 X152.604 Y134.777 I-.007 J-1.011 E.05655
G1 X155.802 Y134.777 E.1061
G1 X155.802 Y132.977 E.05971
G1 X163.402 Y132.977 E.25211
G1 X163.402 Y123.023 E.3302
G1 X155.802 Y123.023 E.25211
G1 X155.802 Y121.223 E.05971
G1 X152.603 Y121.223 E.1061
G3 X153.608 Y120.102 I1.005 J-.11 E.05631
G1 X174.421 Y120.103 E.69041
G3 X175.403 Y121.223 I-.035 J1.022 E.05536
G1 X172.198 Y121.223 E.10633
G1 X172.198 Y123.023 E.05971
G1 X164.658 Y123.023 E.25012
M204 S250
G1 X164.99 Y123.415 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X164.99 Y132.585 E.28177
G1 X172.59 Y132.585 E.23353
G1 X172.59 Y134.385 E.05531
G1 X173.302 Y134.385 E.02189
G1 X173.31 Y134.185 E.00615
G1 X173.69 Y134.185 E.01169
G1 X173.695 Y134.385 E.00615
G1 X174.502 Y134.385 E.02482
G1 X174.51 Y134.185 E.00615
G1 X174.89 Y134.185 E.01169
G1 X174.895 Y134.385 E.00615
G1 X175.789 Y134.385 E.02749
G3 X175.779 Y135.069 I-3.917 J.283 E.02105
G3 X174.395 Y136.29 I-1.389 J-.18 E.06192
G1 X153.605 Y136.29 E.6388
G3 X152.212 Y134.969 I.012 J-1.408 E.06492
G1 X152.21 Y134.385 E.01794
G1 X153.102 Y134.385 E.02741
G1 X153.11 Y134.185 E.00615
G1 X153.49 Y134.185 E.01169
G1 X153.495 Y134.385 E.00615
G1 X154.305 Y134.385 E.02491
G1 X154.31 Y134.185 E.00614
G1 X154.69 Y134.186 E.01169
G1 X154.698 Y134.385 E.00613
G1 X155.41 Y134.385 E.02189
G1 X155.41 Y132.585 E.05531
G1 X163.01 Y132.585 E.23353
G1 X163.01 Y123.415 E.28177
G1 X155.41 Y123.415 E.23353
G1 X155.41 Y121.615 E.05531
G1 X154.697 Y121.615 E.02189
G1 X154.69 Y121.815 E.00615
G1 X154.31 Y121.815 E.01169
G1 X154.305 Y121.615 E.00615
G1 X153.497 Y121.615 E.02482
G1 X153.49 Y121.815 E.00615
G1 X153.11 Y121.815 E.01169
G1 X153.105 Y121.615 E.00615
G1 X152.21 Y121.615 E.02749
G3 X152.217 Y120.965 I4.544 J-.282 E.01998
G3 X153.603 Y119.71 I1.388 J.14 E.06298
G1 X174.432 Y119.711 E.64003
G3 X175.79 Y121.105 I-.041 J1.398 E.06614
G1 X175.79 Y121.615 E.01566
G1 X174.897 Y121.615 E.02742
G1 X174.89 Y121.815 E.00615
G1 X174.51 Y121.815 E.01169
G1 X174.505 Y121.615 E.00615
G1 X173.695 Y121.615 E.02491
G1 X173.69 Y121.815 E.00614
G1 X173.31 Y121.814 E.01169
G1 X173.302 Y121.615 E.00613
G1 X172.59 Y121.615 E.02189
G1 X172.59 Y123.415 E.05531
G1 X165.05 Y123.415 E.23168
; WIPE_START
M204 S6000
G1 X165.037 Y125.415 E-.76
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
G1 X164.25 Y129.878 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X164.25 Y128.25 E.05401
G1 X163.75 Y127.75 E.02343
G1 X163.75 Y128.25 E.01656
G1 X164.25 Y127.75 E.02343
G1 X164.25 Y126.122 E.05401
; WIPE_START
G1 X164.25 Y127.75 E-.61876
G1 X163.987 Y128.013 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.808 Y123.532 Z4.8 F42000
G1 X154.145 Y120.875 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X155.773 Y120.875 E.05401
G1 X156.198 Y120.45 E.0199
G1 X156.45 Y120.45 E.00839
G1 X158.675 Y122.675 E.10434
G1 X161.649 Y122.675 E.09868
G1 X163.873 Y120.451 E.10433
G1 X164.127 Y120.451 E.00841
G1 X166.351 Y122.675 E.10433
G1 X169.325 Y122.675 E.09868
G1 X171.549 Y120.451 E.10431
G1 X171.803 Y120.451 E.00843
G1 X172.227 Y120.875 E.01987
G1 X173.855 Y120.875 E.05401
; WIPE_START
G1 X172.227 Y120.875 E-.61876
G1 X171.964 Y120.612 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X172.95 Y128.18 Z4.8 F42000
G1 X173.855 Y135.125 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X172.227 Y135.125 E.05401
G1 X171.802 Y135.55 E.01991
G1 X171.55 Y135.55 E.00838
G1 X169.325 Y133.325 E.10435
G1 X166.351 Y133.325 E.09868
G1 X164.126 Y135.55 E.10435
G1 X163.874 Y135.55 E.00838
G1 X161.649 Y133.325 E.10435
G1 X158.675 Y133.325 E.09868
G1 X156.45 Y135.55 E.10435
G1 X156.198 Y135.55 E.00838
G1 X155.773 Y135.125 E.01991
G1 X154.145 Y135.125 E.05401
; OBJECT_ID: 405
; WIPE_START
G1 X155.773 Y135.125 E-.61876
G1 X156.036 Y135.388 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X149.075 Y132.258 Z4.8 F42000
G1 X128.598 Y123.048 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X128.598 Y132.952 E.32854
G1 X136.198 Y132.952 E.25211
G1 X136.198 Y134.727 E.05888
G1 X139.397 Y134.727 E.1061
G3 X138.385 Y135.898 I-1.012 J.148 E.05821
G1 X125.802 Y135.898 E.4174
G1 X125.802 Y132.952 E.09772
G1 X127.402 Y132.952 E.05307
G1 X127.402 Y123.048 E.32854
G1 X119.802 Y123.048 E.25211
G1 X119.802 Y121.273 E.05888
G1 X116.603 Y121.273 E.1061
G3 X117.615 Y120.102 I1.012 J-.148 E.05822
G1 X130.198 Y120.102 E.4174
G1 X130.198 Y123.048 E.09772
G1 X128.658 Y123.048 E.05108
M204 S250
G1 X128.99 Y123.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X128.99 Y132.56 E.28023
G1 X136.59 Y132.56 E.23353
G1 X136.59 Y134.335 E.05454
G1 X139.79 Y134.335 E.09831
G3 X139.779 Y135.069 I-4.196 J.307 E.02259
G3 X138.395 Y136.29 I-1.382 J-.172 E.062
G1 X125.41 Y136.29 E.39898
G1 X125.41 Y132.56 E.11461
G1 X127.01 Y132.56 E.04916
G1 X127.01 Y123.44 E.28023
G1 X119.41 Y123.44 E.23353
G1 X119.41 Y121.665 E.05454
G1 X116.21 Y121.665 E.09831
G3 X116.221 Y120.931 I4.195 J-.307 E.02259
G3 X117.605 Y119.71 I1.383 J.173 E.06199
G1 X130.59 Y119.71 E.39898
G1 X130.59 Y123.44 E.11461
G1 X129.05 Y123.44 E.04732
; WIPE_START
M204 S6000
G1 X129.037 Y125.44 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.25 Y129.878 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X128.25 Y128.25 E.05401
G1 X127.75 Y127.75 E.02343
G1 X127.75 Y128.25 E.01656
G1 X128.25 Y127.75 E.02343
G1 X128.25 Y122.7 E.16754
G1 X129.85 Y122.7 E.05307
G1 X129.85 Y122.174 E.01745
G1 X128.127 Y120.451 E.08081
G1 X127.873 Y120.451 E.00844
G1 X125.624 Y122.7 E.10547
G1 X122.7 Y122.7 E.09702
G1 X120.455 Y120.455 E.10532
G1 X120.193 Y120.455 E.00866
G1 X119.723 Y120.925 E.02205
G1 X118.095 Y120.925 E.05401
; WIPE_START
G1 X119.723 Y120.925 E-.61876
G1 X119.986 Y120.662 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.933 Y125.446 Z4.8 F42000
G1 X137.905 Y135.075 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X136.277 Y135.075 E.05401
G1 X135.802 Y135.55 E.02225
G1 X135.55 Y135.55 E.00838
G1 X133.3 Y133.3 E.10552
G1 X130.376 Y133.3 E.09702
G1 X128.126 Y135.55 E.10552
G1 X127.874 Y135.55 E.00838
G1 X126.15 Y133.826 E.08085
G1 X126.15 Y133.3 E.01745
G1 X127.253 Y133.3 E.03657
; OBJECT_ID: 394
; WIPE_START
G1 X126.15 Y133.3 E-.4189
G1 X126.15 Y133.826 E-.19986
G1 X126.413 Y134.089 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X118.781 Y134.183 Z4.8 F42000
G1 X97.79 Y134.44 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X103.41 Y134.44 E.17269
G1 X103.41 Y135.66 E.03749
G1 X97.79 Y135.66 E.17269
G1 X97.79 Y134.5 E.03564
; WIPE_START
M204 S6000
G1 X99.79 Y134.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.622 Y126.936 Z4.8 F42000
G1 X97.79 Y121.56 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X97.79 Y120.34 E.03749
G1 X103.41 Y120.34 E.17269
G1 X103.41 Y121.56 E.03749
G1 X97.85 Y121.56 E.17084
M204 S10000
G1 X97.398 Y121.56 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.398 Y121.952 E.01301
G1 X100.198 Y121.952 E.09288
G1 X100.198 Y123.073 E.03718
G1 X92.598 Y123.073 E.25211
G1 X92.598 Y132.927 E.32688
G1 X100.198 Y132.927 E.25211
G1 X100.198 Y134.048 E.03718
G1 X97.398 Y134.048 E.09288
G1 X97.398 Y135.898 E.06137
G1 X86.602 Y135.898 E.35812
G1 X86.602 Y134.048 E.06137
G1 X83.802 Y134.048 E.09288
G1 X83.802 Y132.927 E.03718
G1 X91.402 Y132.927 E.25211
G1 X91.402 Y123.073 E.32688
G1 X83.802 Y123.073 E.25211
G1 X83.802 Y121.952 E.03718
G1 X86.602 Y121.952 E.09288
G1 X86.602 Y120.102 E.06136
G1 X97.398 Y120.103 E.35812
G1 X97.398 Y121.5 E.04635
; WIPE_START
G1 X97.398 Y121.952 E-.17179
G1 X98.946 Y121.952 E-.58821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.317 Y121.717 Z4.8 F42000
G1 X86.21 Y121.56 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X80.59 Y121.56 E.17269
G1 X80.59 Y120.34 E.03749
G1 X86.21 Y120.34 E.17269
G1 X86.21 Y121.5 E.03564
; WIPE_START
M204 S6000
G1 X84.21 Y121.521 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.378 Y129.064 Z4.8 F42000
G1 X86.21 Y134.44 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X86.21 Y135.66 E.03749
G1 X80.59 Y135.66 E.17269
G1 X80.59 Y134.44 E.03749
G1 X86.15 Y134.44 E.17084
; WIPE_START
M204 S6000
G1 X86.21 Y135.66 E-.46416
G1 X85.431 Y135.66 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.452 Y129.173 Z4.8 F42000
G1 X92.99 Y123.465 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X92.99 Y132.535 E.2787
G1 X100.59 Y132.535 E.23353
G1 X100.59 Y134.31 E.05454
G1 X103.56 Y134.31 E.09126
G1 X103.56 Y133.835 E.0146
G1 X103.79 Y133.835 E.00706
G1 X103.788 Y134.968 E.03482
G3 X102.395 Y136.29 I-1.398 J-.078 E.06504
G1 X81.605 Y136.29 E.6388
G3 X80.21 Y134.897 I-.001 J-1.395 E.06728
G1 X80.21 Y133.835 E.03264
G1 X80.44 Y133.835 E.00707
G1 X80.44 Y134.31 E.0146
G1 X83.41 Y134.31 E.09126
G1 X83.41 Y132.535 E.05454
G1 X91.01 Y132.535 E.23353
G1 X91.01 Y123.465 E.2787
G1 X83.41 Y123.465 E.23353
G1 X83.41 Y121.69 E.05454
G1 X80.44 Y121.69 E.09126
G1 X80.44 Y122.165 E.0146
G1 X80.21 Y122.165 E.00706
G1 X80.212 Y121.032 E.03482
G3 X81.603 Y119.71 I1.398 J.078 E.06497
G1 X102.432 Y119.711 E.64003
G3 X103.79 Y121.105 I-.036 J1.393 E.0662
G1 X103.79 Y122.165 E.03256
G1 X103.56 Y122.165 E.00707
G1 X103.56 Y121.69 E.0146
G1 X100.59 Y121.69 E.09126
G1 X100.59 Y123.465 E.05454
G1 X93.05 Y123.465 E.23168
; WIPE_START
M204 S6000
G1 X93.037 Y125.465 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.594 Y120.025 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279016
G1 F15000
M204 S6000
G1 X102.423 Y120.025 E.0929
G3 X102.719 Y120.049 I-.039 J2.361 E.00571
; LINE_WIDTH: 0.214064
G1 X103.057 Y120.108 E.00478
; WIPE_START
G1 X102.719 Y120.049 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.154 Y125.273 Z4.8 F42000
G1 X92.25 Y129.878 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X92.25 Y128.25 E.05401
G1 X91.75 Y127.75 E.02343
G1 X91.75 Y128.25 E.01656
G1 X92.25 Y127.75 E.02343
G1 X92.25 Y126.122 E.05401
; WIPE_START
G1 X92.25 Y127.75 E-.61876
G1 X91.987 Y128.013 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.397 Y121.915 Z4.8 F42000
G1 X86.95 Y121.322 Z4.8
G1 Z4.4
M73 P64 R8
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X86.95 Y122.3 E.03245
G1 X86.3 Y122.3 E.02156
G1 X86.725 Y122.725 E.01991
G1 X89.599 Y122.725 E.09536
G1 X91.873 Y120.451 E.10667
G1 X92.127 Y120.451 E.00841
G1 X94.401 Y122.725 E.10667
G1 X97.275 Y122.725 E.09536
G1 X97.7 Y122.3 E.01991
G1 X97.05 Y122.3 E.02156
G1 X97.05 Y121.322 E.03245
; WIPE_START
G1 X97.05 Y122.3 E-.37176
G1 X97.7 Y122.3 E-.247
G1 X97.437 Y122.563 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.999 Y120.852 Z4.8 F42000
G1 X86.406 Y120.025 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279411
G1 F15000
M204 S6000
G1 X81.552 Y120.026 E.09354
G2 X81.333 Y120.042 I.055 J2.247 E.00424
; LINE_WIDTH: 0.235625
G1 X81.253 Y120.053 E.00126
; LINE_WIDTH: 0.210178
G1 X80.943 Y120.108 E.00429
; WIPE_START
G1 X81.253 Y120.053 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.105 Y127.684 Z4.8 F42000
G1 X80.945 Y135.88 Z4.8
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.158719
G1 F15000
M204 S6000
G1 X81.112 Y135.919 E.00161
; LINE_WIDTH: 0.19261
G1 X81.227 Y135.942 E.00143
; LINE_WIDTH: 0.23246
G1 X81.341 Y135.959 E.00179
; LINE_WIDTH: 0.28026
G2 X81.613 Y135.975 I.298 J-2.794 E.00527
G1 X86.406 Y135.975 E.09269
; WIPE_START
G1 X84.406 Y135.975 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.999 Y135.196 Z4.8 F42000
G1 X97.05 Y134.678 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.05 Y133.7 E.03245
G1 X97.7 Y133.7 E.02156
G1 X97.275 Y133.275 E.01991
G1 X94.401 Y133.275 E.09536
G1 X92.126 Y135.55 E.10669
G1 X91.874 Y135.55 E.00838
G1 X89.599 Y133.275 E.10669
G1 X86.725 Y133.275 E.09536
G1 X86.3 Y133.7 E.01991
G1 X86.95 Y133.7 E.02156
G1 X86.95 Y134.678 E.03245
; WIPE_START
G1 X86.95 Y133.7 E-.37176
G1 X86.3 Y133.7 E-.247
G1 X86.563 Y133.437 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.001 Y135.148 Z4.8 F42000
G1 X97.594 Y135.975 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280782
G1 F15000
M204 S6000
G1 X102.512 Y135.972 E.09532
; LINE_WIDTH: 0.25329
G2 X102.745 Y135.947 I-.19 J-2.868 E.00402
; LINE_WIDTH: 0.210444
G1 X103.057 Y135.892 E.00432
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X102.745 Y135.947 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 23/42
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z4.8 I.249 J1.191 P1  F42000
G1 X164.598 Y123.023 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X164.598 Y132.977 E.3302
G1 X172.198 Y132.977 E.25211
G1 X172.198 Y134.777 E.05971
G1 X175.397 Y134.777 E.1061
G3 X174.385 Y135.898 I-1.005 J.11 E.05655
G1 X153.615 Y135.898 E.68898
G3 X152.604 Y134.777 I-.008 J-1.01 E.05657
G1 X155.802 Y134.777 E.1061
G1 X155.802 Y132.977 E.05971
G1 X163.402 Y132.977 E.25211
G1 X163.402 Y123.023 E.3302
G1 X155.802 Y123.023 E.25211
G1 X155.802 Y121.223 E.05971
G1 X152.603 Y121.223 E.1061
G3 X153.608 Y120.102 I1.005 J-.11 E.05631
G1 X174.419 Y120.103 E.69035
G3 X175.403 Y121.223 I-.03 J1.019 E.05547
G1 X172.198 Y121.223 E.10633
G1 X172.198 Y123.023 E.05971
G1 X164.658 Y123.023 E.25012
M204 S250
G1 X164.99 Y123.415 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X164.99 Y132.585 E.28177
G1 X172.59 Y132.585 E.23353
G1 X172.59 Y134.385 E.05531
G1 X173.302 Y134.385 E.02189
G1 X173.31 Y134.185 E.00615
G1 X173.69 Y134.185 E.01169
G1 X173.695 Y134.385 E.00615
G1 X174.502 Y134.385 E.02482
G1 X174.51 Y134.185 E.00615
G1 X174.89 Y134.185 E.01169
G1 X174.895 Y134.385 E.00615
G1 X175.789 Y134.385 E.0275
G3 X175.783 Y135.035 I-4.552 J.282 E.01998
G3 X174.395 Y136.29 I-1.388 J-.14 E.06305
G1 X153.605 Y136.29 E.6388
G3 X152.212 Y134.969 I.005 J-1.4 E.06501
G1 X152.21 Y134.385 E.01794
G1 X153.102 Y134.385 E.02741
G1 X153.11 Y134.185 E.00615
G1 X153.49 Y134.185 E.01169
G1 X153.495 Y134.385 E.00615
G1 X154.305 Y134.385 E.02491
G1 X154.31 Y134.185 E.00614
G1 X154.69 Y134.186 E.01169
G1 X154.698 Y134.385 E.00613
G1 X155.41 Y134.385 E.02189
G1 X155.41 Y132.585 E.05531
G1 X163.01 Y132.585 E.23353
G1 X163.01 Y123.415 E.28177
G1 X155.41 Y123.415 E.23353
G1 X155.41 Y121.615 E.05531
G1 X154.697 Y121.615 E.02189
G1 X154.69 Y121.815 E.00615
G1 X154.31 Y121.815 E.01169
G1 X154.305 Y121.615 E.00615
G1 X153.497 Y121.615 E.02482
G1 X153.49 Y121.815 E.00615
G1 X153.11 Y121.815 E.01169
G1 X153.105 Y121.615 E.00615
G1 X152.21 Y121.615 E.0275
G3 X152.217 Y120.965 I4.547 J-.282 E.01998
G3 X153.603 Y119.71 I1.388 J.14 E.06297
G1 X174.43 Y119.711 E.63996
G3 X175.79 Y121.105 I-.036 J1.396 E.06624
G1 X175.79 Y121.615 E.01566
G1 X174.897 Y121.615 E.02742
G1 X174.89 Y121.815 E.00615
G1 X174.51 Y121.815 E.01169
G1 X174.505 Y121.615 E.00615
G1 X173.695 Y121.615 E.02491
G1 X173.69 Y121.815 E.00614
G1 X173.31 Y121.814 E.01169
G1 X173.303 Y121.615 E.00613
G1 X172.59 Y121.615 E.02189
G1 X172.59 Y123.415 E.05531
G1 X165.05 Y123.415 E.23168
; WIPE_START
M204 S6000
G1 X165.037 Y125.415 E-.76
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
G1 X163.75 Y129.878 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X163.75 Y128.25 E.05401
G1 X164.25 Y127.75 E.02343
G1 X164.25 Y128.25 E.01656
G1 X163.75 Y127.75 E.02343
G1 X163.75 Y126.122 E.05401
; WIPE_START
G1 X163.75 Y127.75 E-.61876
G1 X164.013 Y128.013 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X170.191 Y123.532 Z5 F42000
G1 X173.855 Y120.875 Z5
G1 Z4.6
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X172.227 Y120.875 E.05401
G1 X171.803 Y120.451 E.01987
G1 X171.549 Y120.451 E.00843
G1 X169.325 Y122.675 E.10431
G1 X166.351 Y122.675 E.09868
G1 X164.127 Y120.451 E.10433
G1 X163.873 Y120.451 E.00841
G1 X161.649 Y122.675 E.10433
G1 X158.675 Y122.675 E.09868
G1 X156.45 Y120.45 E.10434
G1 X156.198 Y120.45 E.00839
G1 X155.773 Y120.875 E.0199
G1 X154.145 Y120.875 E.05401
; WIPE_START
G1 X155.773 Y120.875 E-.61876
G1 X156.036 Y120.612 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X155.05 Y128.18 Z5 F42000
G1 X154.145 Y135.125 Z5
G1 Z4.6
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X155.773 Y135.125 E.05401
G1 X156.198 Y135.55 E.01991
G1 X156.45 Y135.55 E.00838
G1 X158.675 Y133.325 E.10435
G1 X161.649 Y133.325 E.09868
G1 X163.874 Y135.55 E.10435
G1 X164.126 Y135.55 E.00838
G1 X166.351 Y133.325 E.10435
G1 X169.325 Y133.325 E.09868
G1 X171.55 Y135.55 E.10435
G1 X171.802 Y135.55 E.00838
G1 X172.227 Y135.125 E.01991
G1 X173.855 Y135.125 E.05401
; OBJECT_ID: 405
; WIPE_START
G1 X172.227 Y135.125 E-.61876
G1 X171.964 Y135.388 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X164.623 Y133.299 Z5 F42000
G1 X128.598 Y123.048 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X128.598 Y132.952 E.32854
G1 X136.198 Y132.952 E.25211
G1 X136.198 Y134.727 E.05888
G1 X139.397 Y134.727 E.1061
G3 X138.385 Y135.898 I-1.007 J.153 E.0583
G1 X125.802 Y135.898 E.4174
G1 X125.802 Y132.952 E.09772
G1 X127.402 Y132.952 E.05307
G1 X127.402 Y123.048 E.32854
G1 X119.802 Y123.048 E.25211
G1 X119.802 Y121.273 E.05888
G1 X116.603 Y121.273 E.1061
G3 X117.615 Y120.102 I1.011 J-.149 E.05822
G1 X130.198 Y120.102 E.4174
G1 X130.198 Y123.048 E.09772
G1 X128.658 Y123.048 E.05108
M204 S250
G1 X128.99 Y123.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X128.99 Y132.56 E.28023
G1 X136.59 Y132.56 E.23353
G1 X136.59 Y134.335 E.05454
G1 X139.79 Y134.335 E.09831
G3 X139.783 Y135.034 I-4.891 J.307 E.02149
G3 X138.395 Y136.29 I-1.387 J-.137 E.0631
G1 X125.41 Y136.29 E.39898
G1 X125.41 Y132.56 E.11461
G1 X127.01 Y132.56 E.04916
G1 X127.01 Y123.44 E.28023
G1 X119.41 Y123.44 E.23353
G1 X119.41 Y121.665 E.05454
G1 X116.21 Y121.665 E.09831
G3 X116.221 Y120.933 I4.211 J-.307 E.02253
G3 X117.605 Y119.71 I1.386 J.174 E.06202
G1 X130.59 Y119.71 E.39898
G1 X130.59 Y123.44 E.11461
G1 X129.05 Y123.44 E.04732
; WIPE_START
M204 S6000
G1 X129.037 Y125.44 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.347 Y132.883 Z5 F42000
G1 X127.253 Y133.3 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X126.15 Y133.3 E.03657
G1 X126.15 Y133.826 E.01745
G1 X127.874 Y135.55 E.08085
G1 X128.126 Y135.55 E.00838
G1 X130.376 Y133.3 E.10552
G1 X133.3 Y133.3 E.09702
G1 X135.55 Y135.55 E.10552
G1 X135.802 Y135.55 E.00838
G1 X136.277 Y135.075 E.02225
G1 X137.905 Y135.075 E.05401
; WIPE_START
G1 X136.277 Y135.075 E-.61876
G1 X136.014 Y135.338 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.067 Y130.554 Z5 F42000
G1 X118.095 Y120.925 Z5
G1 Z4.6
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X119.723 Y120.925 E.05401
G1 X120.193 Y120.455 E.02204
G1 X120.455 Y120.455 E.00867
G1 X122.7 Y122.7 E.10532
G1 X125.624 Y122.7 E.09702
G1 X127.873 Y120.451 E.10547
G1 X128.127 Y120.451 E.00844
G1 X129.85 Y122.174 E.0808
G1 X129.85 Y122.7 E.01745
G1 X128.25 Y122.7 E.05307
G1 X128.25 Y127.75 E.16754
G1 X127.75 Y128.25 E.02343
G1 X127.75 Y127.75 E.01656
G1 X128.25 Y128.25 E.02343
G1 X128.25 Y129.878 E.05401
; OBJECT_ID: 394
; WIPE_START
G1 X128.25 Y128.25 E-.61876
G1 X127.987 Y127.987 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X120.523 Y129.582 Z5 F42000
G1 X97.79 Y134.44 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X103.41 Y134.44 E.17269
G1 X103.41 Y135.66 E.03749
G1 X97.79 Y135.66 E.17269
G1 X97.79 Y134.5 E.03564
; WIPE_START
M204 S6000
G1 X99.79 Y134.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.622 Y126.936 Z5 F42000
G1 X97.79 Y121.56 Z5
G1 Z4.6
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X97.79 Y120.34 E.03749
G1 X103.41 Y120.34 E.17269
G1 X103.41 Y121.56 E.03749
G1 X97.85 Y121.56 E.17084
M204 S10000
G1 X97.398 Y121.56 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.398 Y121.952 E.01301
G1 X100.198 Y121.952 E.09288
G1 X100.198 Y123.073 E.03718
G1 X92.598 Y123.073 E.25211
G1 X92.598 Y132.927 E.32688
G1 X100.198 Y132.927 E.25211
G1 X100.198 Y134.048 E.03718
G1 X97.398 Y134.048 E.09288
G1 X97.398 Y135.898 E.06137
G1 X86.602 Y135.898 E.35812
G1 X86.602 Y134.048 E.06137
G1 X83.802 Y134.048 E.09288
G1 X83.802 Y132.927 E.03718
G1 X91.402 Y132.927 E.25211
G1 X91.402 Y123.073 E.32688
G1 X83.802 Y123.073 E.25211
G1 X83.802 Y121.952 E.03718
G1 X86.602 Y121.952 E.09288
G1 X86.602 Y120.102 E.06136
G1 X97.398 Y120.103 E.35812
G1 X97.398 Y121.5 E.04635
; WIPE_START
G1 X97.398 Y121.952 E-.17179
G1 X98.946 Y121.952 E-.58821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.317 Y121.717 Z5 F42000
G1 X86.21 Y121.56 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X80.59 Y121.56 E.17269
G1 X80.59 Y120.34 E.03749
G1 X86.21 Y120.34 E.17269
G1 X86.21 Y121.5 E.03564
; WIPE_START
M204 S6000
G1 X84.21 Y121.521 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.378 Y129.064 Z5 F42000
G1 X86.21 Y134.44 Z5
G1 Z4.6
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X86.21 Y135.66 E.03749
G1 X80.59 Y135.66 E.17269
G1 X80.59 Y134.44 E.03749
G1 X86.15 Y134.44 E.17084
; WIPE_START
M204 S6000
G1 X86.21 Y135.66 E-.46416
G1 X85.431 Y135.66 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.452 Y129.173 Z5 F42000
G1 X92.99 Y123.465 Z5
G1 Z4.6
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X92.99 Y132.535 E.2787
G1 X100.59 Y132.535 E.23353
G1 X100.59 Y134.31 E.05454
G1 X103.56 Y134.31 E.09126
G1 X103.56 Y133.835 E.0146
G1 X103.79 Y133.835 E.00706
G1 X103.788 Y134.968 E.03482
G3 X102.395 Y136.29 I-1.402 J-.082 E.06499
G1 X81.605 Y136.29 E.6388
G3 X80.21 Y134.895 I-.002 J-1.393 E.06735
G1 X80.21 Y133.835 E.03258
G1 X80.44 Y133.835 E.00707
G1 X80.44 Y134.31 E.0146
G1 X83.41 Y134.31 E.09126
G1 X83.41 Y132.535 E.05454
G1 X91.01 Y132.535 E.23353
G1 X91.01 Y123.465 E.2787
G1 X83.41 Y123.465 E.23353
M73 P65 R8
G1 X83.41 Y121.69 E.05454
G1 X80.44 Y121.69 E.09126
G1 X80.44 Y122.165 E.0146
G1 X80.21 Y122.165 E.00706
G1 X80.212 Y121.032 E.03482
G3 X81.603 Y119.71 I1.402 J.082 E.06492
G1 X102.43 Y119.711 E.63996
G3 X103.79 Y121.105 I-.036 J1.396 E.06624
G1 X103.79 Y122.165 E.03256
G1 X103.56 Y122.165 E.00707
G1 X103.56 Y121.69 E.0146
G1 X100.59 Y121.69 E.09126
G1 X100.59 Y123.465 E.05454
G1 X93.05 Y123.465 E.23168
; WIPE_START
M204 S6000
G1 X93.037 Y125.465 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.25 Y126.122 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X92.25 Y127.75 E.05401
G1 X91.75 Y128.25 E.02343
G1 X91.75 Y127.75 E.01656
G1 X92.25 Y128.25 E.02343
G1 X92.25 Y129.878 E.05401
; WIPE_START
G1 X92.25 Y128.25 E-.61876
G1 X91.987 Y127.987 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.026 Y132.753 Z5 F42000
G1 X81.847 Y136.094 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.159097
G1 F15000
M204 S6000
G1 X80.947 Y135.88 E.00876
M204 S10000
G1 X80.952 Y135.902 F42000
; LINE_WIDTH: 0.231793
G1 F15000
M204 S6000
G1 X81.337 Y135.959 E.00598
; LINE_WIDTH: 0.280232
G2 X81.613 Y135.975 I.283 J-2.437 E.00536
G1 X86.406 Y135.975 E.09268
; WIPE_START
G1 X84.406 Y135.975 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.95 Y134.678 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X86.95 Y133.7 E.03245
G1 X86.3 Y133.7 E.02156
G1 X86.725 Y133.275 E.01991
G1 X89.599 Y133.275 E.09536
G1 X91.874 Y135.55 E.10669
G1 X92.126 Y135.55 E.00838
G1 X94.401 Y133.275 E.10669
G1 X97.275 Y133.275 E.09536
G1 X97.7 Y133.7 E.01991
G1 X97.05 Y133.7 E.02156
G1 X97.05 Y134.678 E.03245
; WIPE_START
G1 X97.05 Y133.7 E-.37176
G1 X97.7 Y133.7 E-.247
G1 X97.437 Y133.437 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.594 Y135.975 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280782
G1 F15000
M204 S6000
G1 X102.512 Y135.972 E.09532
; LINE_WIDTH: 0.253499
G2 X102.743 Y135.947 I-.189 J-2.868 E.00399
; LINE_WIDTH: 0.210686
G1 X103.057 Y135.892 E.00435
; WIPE_START
G1 X102.743 Y135.947 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.543 Y128.317 Z5 F42000
G1 X102.323 Y119.907 Z5
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.105857
G1 F15000
M204 S6000
G1 X103.052 Y120.125 E.00391
M204 S10000
G1 X103.047 Y120.098 F42000
; LINE_WIDTH: 0.23201
G1 F15000
M204 S6000
G1 X102.67 Y120.042 E.00587
; LINE_WIDTH: 0.279424
G2 X102.42 Y120.025 I-.268 J2.135 E.00484
G1 X97.594 Y120.025 E.093
; WIPE_START
G1 X99.594 Y120.025 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.05 Y121.322 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.05 Y122.3 E.03245
G1 X97.7 Y122.3 E.02156
G1 X97.275 Y122.725 E.01991
G1 X94.401 Y122.725 E.09536
G1 X92.127 Y120.451 E.10667
G1 X91.873 Y120.451 E.00841
G1 X89.599 Y122.725 E.10667
G1 X86.725 Y122.725 E.09536
G1 X86.3 Y122.3 E.01991
G1 X86.95 Y122.3 E.02156
G1 X86.95 Y121.322 E.03245
; WIPE_START
G1 X86.95 Y122.3 E-.37176
G1 X86.3 Y122.3 E-.247
G1 X86.563 Y122.563 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.406 Y120.025 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279426
G1 F15000
M204 S6000
G1 X81.552 Y120.026 E.09354
G2 X81.335 Y120.042 I.054 J2.227 E.0042
; LINE_WIDTH: 0.231538
G1 X80.955 Y120.098 E.00591
M204 S10000
G1 X80.947 Y120.12 F42000
; LINE_WIDTH: 0.15793
G1 F15000
M204 S6000
G1 X81.841 Y119.907 E.00862
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X80.947 Y120.12 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 24/42
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z5 I-.042 J1.216 P1  F42000
G1 X164.598 Y123.023 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X164.598 Y132.977 E.3302
G1 X172.198 Y132.977 E.25211
G1 X172.198 Y134.777 E.05971
G1 X175.397 Y134.777 E.1061
G3 X174.392 Y135.898 I-1.005 J.11 E.05631
G1 X153.615 Y135.898 E.68922
G3 X152.604 Y134.777 I-.007 J-1.011 E.05655
G1 X155.802 Y134.777 E.1061
G1 X155.802 Y132.977 E.05971
G1 X163.402 Y132.977 E.25211
G1 X163.402 Y123.023 E.3302
G1 X155.802 Y123.023 E.25211
G1 X155.802 Y121.223 E.05971
G1 X152.603 Y121.223 E.1061
G3 X153.608 Y120.102 I1.005 J-.11 E.05631
G1 X174.417 Y120.103 E.69028
G3 X175.401 Y121.223 I-.023 J1.012 E.05558
G1 X172.198 Y121.223 E.10624
G1 X172.198 Y123.023 E.05971
G1 X164.658 Y123.023 E.25012
M204 S250
G1 X164.99 Y123.415 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X164.99 Y132.585 E.28177
G1 X172.59 Y132.585 E.23353
G1 X172.59 Y134.385 E.05531
G1 X173.302 Y134.385 E.02189
G1 X173.31 Y134.185 E.00615
G1 X173.69 Y134.185 E.01169
G1 X173.695 Y134.385 E.00615
G1 X174.502 Y134.385 E.02482
G1 X174.51 Y134.185 E.00615
G1 X174.89 Y134.185 E.01169
G1 X174.895 Y134.385 E.00615
G1 X175.789 Y134.385 E.0275
G3 X175.783 Y135.035 I-4.556 J.282 E.01998
G3 X174.397 Y136.29 I-1.388 J-.14 E.06297
G1 X153.605 Y136.29 E.63887
G3 X152.212 Y134.968 I.012 J-1.408 E.06495
G1 X152.21 Y134.385 E.01791
G1 X153.102 Y134.385 E.02741
G1 X153.11 Y134.185 E.00615
G1 X153.49 Y134.185 E.01169
G1 X153.495 Y134.385 E.00615
G1 X154.305 Y134.385 E.02491
G1 X154.31 Y134.185 E.00614
G1 X154.69 Y134.186 E.01169
G1 X154.698 Y134.385 E.00613
G1 X155.41 Y134.385 E.02189
G1 X155.41 Y132.585 E.05531
G1 X163.01 Y132.585 E.23353
G1 X163.01 Y123.415 E.28177
G1 X155.41 Y123.415 E.23353
G1 X155.41 Y121.615 E.05531
G1 X154.697 Y121.615 E.02189
G1 X154.69 Y121.815 E.00615
G1 X154.31 Y121.815 E.01169
G1 X154.305 Y121.615 E.00615
G1 X153.497 Y121.615 E.02482
G1 X153.49 Y121.815 E.00615
G1 X153.11 Y121.815 E.01169
G1 X153.105 Y121.615 E.00615
G1 X152.21 Y121.615 E.0275
G3 X152.217 Y120.965 I4.55 J-.282 E.01998
G3 X153.603 Y119.71 I1.388 J.14 E.06297
G1 X174.428 Y119.711 E.6399
G3 X175.79 Y121.103 I-.028 J1.39 E.0663
G1 X175.79 Y121.615 E.01574
G1 X174.897 Y121.615 E.02742
G1 X174.89 Y121.815 E.00615
G1 X174.51 Y121.815 E.01169
G1 X174.505 Y121.615 E.00615
G1 X173.695 Y121.615 E.02491
G1 X173.69 Y121.815 E.00614
G1 X173.31 Y121.814 E.01169
G1 X173.303 Y121.615 E.00613
G1 X172.59 Y121.615 E.02189
G1 X172.59 Y123.415 E.05531
G1 X165.05 Y123.415 E.23168
; WIPE_START
M204 S6000
G1 X165.037 Y125.415 E-.76
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
G1 X164.25 Y129.878 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X164.25 Y128.25 E.05401
G1 X163.75 Y127.75 E.02343
G1 X163.75 Y128.25 E.01656
G1 X164.25 Y127.75 E.02343
G1 X164.25 Y126.122 E.05401
; WIPE_START
G1 X164.25 Y127.75 E-.61876
G1 X163.987 Y128.013 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.808 Y123.532 Z5.2 F42000
G1 X154.145 Y120.875 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X155.773 Y120.875 E.05401
G1 X156.198 Y120.45 E.0199
G1 X156.45 Y120.45 E.00838
G1 X158.675 Y122.675 E.10434
G1 X161.649 Y122.675 E.09868
G1 X163.873 Y120.451 E.10433
G1 X164.127 Y120.451 E.00841
G1 X166.351 Y122.675 E.10433
G1 X169.325 Y122.675 E.09868
G1 X171.549 Y120.451 E.10431
G1 X171.803 Y120.451 E.00843
G1 X172.227 Y120.875 E.01987
G1 X173.855 Y120.875 E.05401
; WIPE_START
G1 X172.227 Y120.875 E-.61876
G1 X171.964 Y120.612 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X172.95 Y128.18 Z5.2 F42000
G1 X173.855 Y135.125 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X172.227 Y135.125 E.05401
G1 X171.802 Y135.55 E.01991
G1 X171.55 Y135.55 E.00838
G1 X169.325 Y133.325 E.10435
G1 X166.351 Y133.325 E.09868
G1 X164.126 Y135.55 E.10435
G1 X163.874 Y135.55 E.00838
G1 X161.649 Y133.325 E.10435
G1 X158.675 Y133.325 E.09868
G1 X156.45 Y135.55 E.10435
G1 X156.198 Y135.55 E.00838
G1 X155.773 Y135.125 E.01991
G1 X154.145 Y135.125 E.05401
; OBJECT_ID: 405
; WIPE_START
G1 X155.773 Y135.125 E-.61876
G1 X156.036 Y135.388 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X149.075 Y132.258 Z5.2 F42000
G1 X128.598 Y123.048 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X128.598 Y132.952 E.32854
G1 X136.198 Y132.952 E.25211
G1 X136.198 Y134.727 E.05888
G1 X139.397 Y134.727 E.1061
G3 X138.392 Y135.898 I-1.012 J.148 E.05797
G1 X125.802 Y135.898 E.41764
G1 X125.802 Y132.952 E.09772
G1 X127.402 Y132.952 E.05307
G1 X127.402 Y123.048 E.32854
G1 X119.802 Y123.048 E.25211
G1 X119.802 Y121.273 E.05888
G1 X116.603 Y121.273 E.1061
G3 X117.615 Y120.102 I1.011 J-.149 E.05823
G1 X130.198 Y120.102 E.4174
G1 X130.198 Y123.048 E.09772
G1 X128.658 Y123.048 E.05108
M204 S250
G1 X128.99 Y123.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X128.99 Y132.56 E.28023
G1 X136.59 Y132.56 E.23353
G1 X136.59 Y134.335 E.05454
G1 X139.79 Y134.335 E.09831
G3 X139.783 Y135.034 I-4.896 J.307 E.02149
G3 X138.397 Y136.29 I-1.387 J-.137 E.06302
G1 X125.41 Y136.29 E.39906
G1 X125.41 Y132.56 E.11461
G1 X127.01 Y132.56 E.04916
G1 X127.01 Y123.44 E.28023
G1 X119.41 Y123.44 E.23353
G1 X119.41 Y121.665 E.05454
G1 X116.21 Y121.665 E.09831
G3 X116.22 Y120.935 I4.228 J-.307 E.02247
G3 X117.605 Y119.71 I1.389 J.176 E.06205
G1 X130.59 Y119.71 E.39898
G1 X130.59 Y123.44 E.11461
G1 X129.05 Y123.44 E.04732
; WIPE_START
M204 S6000
G1 X129.037 Y125.44 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.25 Y129.878 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X128.25 Y128.25 E.05401
G1 X127.75 Y127.75 E.02343
G1 X127.75 Y128.25 E.01656
G1 X128.25 Y127.75 E.02343
G1 X128.25 Y122.7 E.16754
G1 X129.85 Y122.7 E.05307
G1 X129.85 Y122.174 E.01745
G1 X128.127 Y120.451 E.08081
G1 X127.873 Y120.451 E.00844
G1 X125.624 Y122.7 E.10547
G1 X122.7 Y122.7 E.09702
G1 X120.455 Y120.455 E.10532
G1 X120.193 Y120.455 E.00866
G1 X119.723 Y120.925 E.02205
G1 X118.095 Y120.925 E.05401
; WIPE_START
G1 X119.723 Y120.925 E-.61876
G1 X119.986 Y120.662 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.933 Y125.446 Z5.2 F42000
G1 X137.905 Y135.075 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X136.277 Y135.075 E.05401
G1 X135.802 Y135.55 E.02225
G1 X135.55 Y135.55 E.00838
G1 X133.3 Y133.3 E.10552
G1 X130.376 Y133.3 E.09702
G1 X128.126 Y135.55 E.10552
G1 X127.874 Y135.55 E.00838
G1 X126.15 Y133.826 E.08085
G1 X126.15 Y133.3 E.01745
G1 X127.253 Y133.3 E.03657
; OBJECT_ID: 394
; WIPE_START
G1 X126.15 Y133.3 E-.4189
G1 X126.15 Y133.826 E-.19986
G1 X126.413 Y134.089 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X118.781 Y134.183 Z5.2 F42000
G1 X97.79 Y134.44 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X103.41 Y134.44 E.17269
G1 X103.41 Y135.66 E.03749
G1 X97.79 Y135.66 E.17269
G1 X97.79 Y134.5 E.03564
; WIPE_START
M204 S6000
G1 X99.79 Y134.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.622 Y126.936 Z5.2 F42000
G1 X97.79 Y121.56 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X97.79 Y120.34 E.03749
G1 X103.41 Y120.34 E.17269
G1 X103.41 Y121.56 E.03749
G1 X97.85 Y121.56 E.17084
M204 S10000
G1 X97.398 Y121.56 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.398 Y121.952 E.01301
G1 X100.198 Y121.952 E.09288
G1 X100.198 Y123.073 E.03718
G1 X92.598 Y123.073 E.25211
G1 X92.598 Y132.927 E.32688
G1 X100.198 Y132.927 E.25211
G1 X100.198 Y134.048 E.03718
G1 X97.398 Y134.048 E.09288
G1 X97.398 Y135.898 E.06137
G1 X86.602 Y135.898 E.35812
G1 X86.602 Y134.048 E.06137
G1 X83.802 Y134.048 E.09288
M73 P66 R8
G1 X83.802 Y132.927 E.03718
G1 X91.402 Y132.927 E.25211
G1 X91.402 Y123.073 E.32688
G1 X83.802 Y123.073 E.25211
G1 X83.802 Y121.952 E.03718
G1 X86.602 Y121.952 E.09288
G1 X86.602 Y120.102 E.06136
G1 X97.398 Y120.103 E.35812
G1 X97.398 Y121.5 E.04635
; WIPE_START
G1 X97.398 Y121.952 E-.17179
G1 X98.946 Y121.952 E-.58821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.317 Y121.717 Z5.2 F42000
G1 X86.21 Y121.56 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X80.59 Y121.56 E.17269
G1 X80.59 Y120.34 E.03749
G1 X86.21 Y120.34 E.17269
G1 X86.21 Y121.5 E.03564
; WIPE_START
M204 S6000
G1 X84.21 Y121.521 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.378 Y129.064 Z5.2 F42000
G1 X86.21 Y134.44 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X86.21 Y135.66 E.03749
G1 X80.59 Y135.66 E.17269
G1 X80.59 Y134.44 E.03749
G1 X86.15 Y134.44 E.17084
; WIPE_START
M204 S6000
G1 X86.21 Y135.66 E-.46416
G1 X85.431 Y135.66 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.452 Y129.173 Z5.2 F42000
G1 X92.99 Y123.465 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X92.99 Y132.535 E.2787
G1 X100.59 Y132.535 E.23353
G1 X100.59 Y134.31 E.05454
G1 X103.56 Y134.31 E.09126
G1 X103.56 Y133.835 E.0146
G1 X103.79 Y133.835 E.00706
G1 X103.788 Y134.968 E.03482
G3 X102.397 Y136.29 I-1.398 J-.078 E.06496
G1 X81.605 Y136.29 E.63887
G3 X80.21 Y134.897 I-.001 J-1.395 E.06728
G1 X80.21 Y133.835 E.03264
G1 X80.44 Y133.835 E.00707
G1 X80.44 Y134.31 E.0146
G1 X83.41 Y134.31 E.09126
G1 X83.41 Y132.535 E.05454
G1 X91.01 Y132.535 E.23353
G1 X91.01 Y123.465 E.2787
G1 X83.41 Y123.465 E.23353
G1 X83.41 Y121.69 E.05454
G1 X80.44 Y121.69 E.09126
G1 X80.44 Y122.165 E.0146
G1 X80.21 Y122.165 E.00706
G1 X80.212 Y121.032 E.03482
G3 X81.603 Y119.71 I1.398 J.078 E.06497
G1 X102.428 Y119.711 E.6399
G3 X103.79 Y121.105 I-.042 J1.403 E.06621
G1 X103.79 Y122.165 E.03256
G1 X103.56 Y122.165 E.00707
G1 X103.56 Y121.69 E.0146
G1 X100.59 Y121.69 E.09126
G1 X100.59 Y123.465 E.05454
G1 X93.05 Y123.465 E.23168
; WIPE_START
M204 S6000
G1 X93.037 Y125.465 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.594 Y120.025 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279462
G1 F15000
M204 S6000
G1 X102.418 Y120.025 E.09298
G3 X102.67 Y120.042 I-.016 J2.147 E.00488
; LINE_WIDTH: 0.231608
G1 X102.771 Y120.057 E.00157
; LINE_WIDTH: 0.201227
G1 X103.056 Y120.112 E.00375
; WIPE_START
G1 X102.771 Y120.057 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.191 Y125.265 Z5.2 F42000
G1 X92.25 Y129.878 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X92.25 Y128.25 E.05401
G1 X91.75 Y127.75 E.02343
G1 X91.75 Y128.25 E.01656
G1 X92.25 Y127.75 E.02343
G1 X92.25 Y126.122 E.05401
; WIPE_START
G1 X92.25 Y127.75 E-.61876
G1 X91.987 Y128.013 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.397 Y121.915 Z5.2 F42000
G1 X86.95 Y121.322 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X86.95 Y122.3 E.03245
G1 X86.3 Y122.3 E.02156
G1 X86.725 Y122.725 E.01991
G1 X89.599 Y122.725 E.09536
G1 X91.873 Y120.451 E.10667
G1 X92.127 Y120.451 E.00841
G1 X94.401 Y122.725 E.10667
G1 X97.275 Y122.725 E.09536
G1 X97.7 Y122.3 E.01991
G1 X97.05 Y122.3 E.02156
G1 X97.05 Y121.322 E.03245
; WIPE_START
G1 X97.05 Y122.3 E-.37176
G1 X97.7 Y122.3 E-.247
G1 X97.437 Y122.563 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.999 Y120.852 Z5.2 F42000
G1 X86.406 Y120.025 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279424
G1 F15000
M204 S6000
G1 X81.552 Y120.026 E.09354
G2 X81.333 Y120.042 I.055 J2.246 E.00423
; LINE_WIDTH: 0.235109
G1 X81.25 Y120.054 E.00132
; LINE_WIDTH: 0.209702
G1 X80.943 Y120.109 E.00423
; WIPE_START
G1 X81.25 Y120.054 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.101 Y127.685 Z5.2 F42000
G1 X80.942 Y135.89 Z5.2
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.205489
G1 F15000
M204 S6000
G1 X81.221 Y135.941 E.00376
; LINE_WIDTH: 0.230867
G1 X81.337 Y135.959 E.00179
; LINE_WIDTH: 0.280233
G2 X81.613 Y135.975 I.282 J-2.416 E.00536
G1 X86.406 Y135.975 E.09268
; WIPE_START
G1 X84.406 Y135.975 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.999 Y135.196 Z5.2 F42000
G1 X97.05 Y134.678 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.05 Y133.7 E.03245
G1 X97.7 Y133.7 E.02156
G1 X97.275 Y133.275 E.01991
G1 X94.401 Y133.275 E.09536
G1 X92.126 Y135.55 E.10669
G1 X91.874 Y135.55 E.00838
G1 X89.599 Y133.275 E.10669
G1 X86.725 Y133.275 E.09536
G1 X86.3 Y133.7 E.01991
G1 X86.95 Y133.7 E.02156
G1 X86.95 Y134.678 E.03245
; WIPE_START
G1 X86.95 Y133.7 E-.37176
G1 X86.3 Y133.7 E-.247
G1 X86.563 Y133.437 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.001 Y135.148 Z5.2 F42000
G1 X97.594 Y135.975 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279985
G1 F15000
M204 S6000
G1 X102.559 Y135.969 E.0959
; LINE_WIDTH: 0.24916
G2 X102.741 Y135.948 I-.149 J-2.072 E.00309
; LINE_WIDTH: 0.210974
G1 X103.057 Y135.892 E.00438
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X102.741 Y135.948 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 25/42
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z5.2 I.249 J1.191 P1  F42000
G1 X164.598 Y123.023 Z5.2
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X164.598 Y132.977 E.3302
G1 X172.198 Y132.977 E.25211
G1 X172.198 Y134.777 E.05971
G1 X175.397 Y134.777 E.1061
G3 X174.385 Y135.898 I-1.013 J.103 E.05641
G1 X153.615 Y135.898 E.68898
G3 X152.604 Y134.777 I-.004 J-1.014 E.0565
G1 X155.802 Y134.777 E.1061
G1 X155.802 Y132.977 E.05971
G1 X163.402 Y132.977 E.25211
G1 X163.402 Y123.023 E.3302
G1 X155.802 Y123.023 E.25211
G1 X155.802 Y121.223 E.05971
G1 X152.603 Y121.223 E.1061
G3 X153.608 Y120.102 I1.005 J-.11 E.05631
G1 X174.415 Y120.103 E.69022
G3 X175.401 Y121.223 I-.028 J1.018 E.05553
G1 X172.198 Y121.223 E.10624
G1 X172.198 Y123.023 E.05971
G1 X164.658 Y123.023 E.25012
M204 S250
G1 X164.99 Y123.415 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X164.99 Y132.585 E.28177
G1 X172.59 Y132.585 E.23353
G1 X172.59 Y134.385 E.05531
G1 X173.302 Y134.385 E.02189
G1 X173.31 Y134.185 E.00615
G1 X173.69 Y134.185 E.01169
G1 X173.695 Y134.385 E.00615
G1 X174.502 Y134.385 E.02482
G1 X174.51 Y134.185 E.00615
G1 X174.89 Y134.185 E.01169
G1 X174.895 Y134.385 E.00615
G1 X175.789 Y134.385 E.0275
G3 X175.783 Y135.034 I-4.556 J.282 E.01995
G3 X174.395 Y136.29 I-1.393 J-.145 E.06302
G1 X153.605 Y136.29 E.6388
G3 X152.212 Y134.969 I-.003 J-1.393 E.06509
G1 X152.21 Y134.385 E.01795
G1 X153.102 Y134.385 E.02741
G1 X153.11 Y134.185 E.00615
G1 X153.49 Y134.185 E.01169
G1 X153.495 Y134.385 E.00615
G1 X154.305 Y134.385 E.02491
G1 X154.31 Y134.185 E.00614
G1 X154.69 Y134.186 E.01169
G1 X154.698 Y134.385 E.00613
G1 X155.41 Y134.385 E.02189
G1 X155.41 Y132.585 E.05531
G1 X163.01 Y132.585 E.23353
G1 X163.01 Y123.415 E.28177
G1 X155.41 Y123.415 E.23353
G1 X155.41 Y121.615 E.05531
G1 X154.698 Y121.615 E.02189
G1 X154.69 Y121.815 E.00615
G1 X154.31 Y121.815 E.01169
G1 X154.305 Y121.615 E.00615
G1 X153.498 Y121.615 E.02482
G1 X153.49 Y121.815 E.00615
G1 X153.11 Y121.815 E.01169
G1 X153.105 Y121.615 E.00615
G1 X152.21 Y121.615 E.0275
G3 X152.217 Y120.965 I4.543 J-.282 E.01998
G3 X153.603 Y119.71 I1.385 J.136 E.06302
G1 X174.426 Y119.711 E.63984
G3 X175.79 Y121.103 I-.035 J1.398 E.06625
G1 X175.79 Y121.615 E.01574
G1 X174.898 Y121.615 E.02742
G1 X174.89 Y121.815 E.00615
G1 X174.51 Y121.815 E.01169
G1 X174.505 Y121.615 E.00615
G1 X173.695 Y121.615 E.02491
G1 X173.69 Y121.815 E.00614
G1 X173.31 Y121.814 E.01169
G1 X173.302 Y121.615 E.00613
G1 X172.59 Y121.615 E.02189
G1 X172.59 Y123.415 E.05531
G1 X165.05 Y123.415 E.23168
; WIPE_START
M204 S6000
G1 X165.037 Y125.415 E-.76
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
G1 X164.25 Y126.122 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X164.25 Y127.75 E.05401
G1 X163.75 Y128.25 E.02343
G1 X163.75 Y127.75 E.01656
G1 X164.25 Y128.25 E.02343
G1 X164.25 Y129.878 E.05401
; WIPE_START
G1 X164.25 Y128.25 E-.61876
G1 X163.987 Y127.987 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.808 Y132.468 Z5.4 F42000
G1 X154.145 Y135.125 Z5.4
G1 Z5
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X155.773 Y135.125 E.05401
G1 X156.198 Y135.55 E.01991
G1 X156.45 Y135.55 E.00838
G1 X158.675 Y133.325 E.10435
G1 X161.649 Y133.325 E.09868
G1 X163.874 Y135.55 E.10435
G1 X164.126 Y135.55 E.00838
G1 X166.351 Y133.325 E.10435
G1 X169.325 Y133.325 E.09868
G1 X171.55 Y135.55 E.10435
G1 X171.802 Y135.55 E.00838
G1 X172.227 Y135.125 E.01991
G1 X173.855 Y135.125 E.05401
; WIPE_START
G1 X172.227 Y135.125 E-.61876
G1 X171.964 Y135.388 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X172.95 Y127.82 Z5.4 F42000
G1 X173.855 Y120.875 Z5.4
G1 Z5
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X172.227 Y120.875 E.05401
G1 X171.803 Y120.451 E.01987
G1 X171.549 Y120.451 E.00842
G1 X169.325 Y122.675 E.10432
G1 X166.351 Y122.675 E.09868
G1 X164.127 Y120.451 E.10433
G1 X163.873 Y120.451 E.0084
G1 X161.649 Y122.675 E.10433
G1 X158.675 Y122.675 E.09868
G1 X156.45 Y120.45 E.10434
G1 X156.198 Y120.45 E.00838
G1 X155.773 Y120.875 E.0199
G1 X154.145 Y120.875 E.05401
; OBJECT_ID: 405
; WIPE_START
G1 X155.773 Y120.875 E-.61876
G1 X156.036 Y120.612 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X148.434 Y121.287 Z5.4 F42000
G1 X128.598 Y123.048 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X128.598 Y132.952 E.32854
G1 X136.198 Y132.952 E.25211
G1 X136.198 Y134.727 E.05888
G1 X139.397 Y134.727 E.1061
G3 X138.385 Y135.898 I-1.008 J.151 E.05827
G1 X125.802 Y135.898 E.4174
G1 X125.802 Y132.952 E.09772
G1 X127.402 Y132.952 E.05307
G1 X127.402 Y123.048 E.32854
G1 X119.802 Y123.048 E.25211
G1 X119.802 Y121.273 E.05888
G1 X116.603 Y121.273 E.1061
G3 X117.615 Y120.102 I1.017 J-.144 E.05812
G1 X130.198 Y120.102 E.4174
G1 X130.198 Y123.048 E.09772
G1 X128.658 Y123.048 E.05108
M204 S250
G1 X128.99 Y123.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X128.99 Y132.56 E.28023
G1 X136.59 Y132.56 E.23353
G1 X136.59 Y134.335 E.05454
G1 X139.79 Y134.335 E.09831
G3 X139.783 Y135.034 I-4.896 J.307 E.02149
G3 X138.395 Y136.29 I-1.385 J-.135 E.06312
G1 X125.41 Y136.29 E.39898
G1 X125.41 Y132.56 E.11461
G1 X127.01 Y132.56 E.04916
G1 X127.01 Y123.44 E.28023
G1 X119.41 Y123.44 E.23353
G1 X119.41 Y121.665 E.05454
G1 X116.21 Y121.665 E.09831
G1 X116.212 Y121.032 E.01945
G3 X117.605 Y119.71 I1.393 J.073 E.0651
G1 X130.59 Y119.71 E.39898
G1 X130.59 Y123.44 E.11461
G1 X129.05 Y123.44 E.04732
; WIPE_START
M204 S6000
G1 X129.037 Y125.44 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.347 Y132.883 Z5.4 F42000
G1 X127.253 Y133.3 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X126.15 Y133.3 E.03657
G1 X126.15 Y133.826 E.01745
G1 X127.874 Y135.55 E.08085
G1 X128.126 Y135.55 E.00838
G1 X130.376 Y133.3 E.10552
G1 X133.3 Y133.3 E.09702
G1 X135.55 Y135.55 E.10552
G1 X135.802 Y135.55 E.00838
G1 X136.277 Y135.075 E.02225
G1 X137.905 Y135.075 E.05401
; WIPE_START
G1 X136.277 Y135.075 E-.61876
G1 X136.014 Y135.338 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.067 Y130.554 Z5.4 F42000
G1 X118.095 Y120.925 Z5.4
G1 Z5
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X119.723 Y120.925 E.05401
G1 X120.193 Y120.455 E.02204
G1 X120.455 Y120.455 E.00868
G1 X122.7 Y122.7 E.10531
G1 X125.624 Y122.7 E.09702
G1 X127.873 Y120.451 E.10547
G1 X128.127 Y120.451 E.00844
G1 X129.85 Y122.174 E.0808
G1 X129.85 Y122.7 E.01745
G1 X128.25 Y122.7 E.05307
M73 P66 R7
G1 X128.25 Y127.75 E.16754
G1 X127.75 Y128.25 E.02343
G1 X127.75 Y127.75 E.01656
G1 X128.25 Y128.25 E.02343
M73 P67 R7
G1 X128.25 Y129.878 E.05401
; OBJECT_ID: 394
; WIPE_START
G1 X128.25 Y128.25 E-.61876
G1 X127.987 Y127.987 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X120.523 Y129.582 Z5.4 F42000
G1 X97.79 Y134.44 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X103.41 Y134.44 E.17269
G1 X103.41 Y135.66 E.03749
G1 X97.79 Y135.66 E.17269
G1 X97.79 Y134.5 E.03564
; WIPE_START
M204 S6000
G1 X99.79 Y134.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.622 Y126.936 Z5.4 F42000
G1 X97.79 Y121.56 Z5.4
G1 Z5
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X97.79 Y120.34 E.03749
G1 X103.41 Y120.34 E.17269
G1 X103.41 Y121.56 E.03749
G1 X97.85 Y121.56 E.17084
M204 S10000
G1 X97.398 Y121.56 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.398 Y121.952 E.01301
G1 X100.198 Y121.952 E.09288
G1 X100.198 Y123.073 E.03718
G1 X92.598 Y123.073 E.25211
G1 X92.598 Y132.927 E.32688
G1 X100.198 Y132.927 E.25211
G1 X100.198 Y134.048 E.03718
G1 X97.398 Y134.048 E.09288
G1 X97.398 Y135.898 E.06137
G1 X86.602 Y135.898 E.35812
G1 X86.602 Y134.048 E.06137
G1 X83.802 Y134.048 E.09288
G1 X83.802 Y132.927 E.03718
G1 X91.402 Y132.927 E.25211
G1 X91.402 Y123.073 E.32688
G1 X83.802 Y123.073 E.25211
G1 X83.802 Y121.952 E.03718
G1 X86.602 Y121.952 E.09288
G1 X86.602 Y120.102 E.06136
G1 X97.398 Y120.103 E.35812
G1 X97.398 Y121.5 E.04635
; WIPE_START
G1 X97.398 Y121.952 E-.17179
G1 X98.946 Y121.952 E-.58821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.317 Y121.717 Z5.4 F42000
G1 X86.21 Y121.56 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X80.59 Y121.56 E.17269
G1 X80.59 Y120.34 E.03749
G1 X86.21 Y120.34 E.17269
G1 X86.21 Y121.5 E.03564
; WIPE_START
M204 S6000
G1 X84.21 Y121.521 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.378 Y129.064 Z5.4 F42000
G1 X86.21 Y134.44 Z5.4
G1 Z5
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X86.21 Y135.66 E.03749
G1 X80.59 Y135.66 E.17269
G1 X80.59 Y134.44 E.03749
G1 X86.15 Y134.44 E.17084
; WIPE_START
M204 S6000
G1 X86.21 Y135.66 E-.46416
G1 X85.431 Y135.66 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.452 Y129.173 Z5.4 F42000
G1 X92.99 Y123.465 Z5.4
G1 Z5
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X92.99 Y132.535 E.2787
G1 X100.59 Y132.535 E.23353
G1 X100.59 Y134.31 E.05454
G1 X103.56 Y134.31 E.09126
G1 X103.56 Y133.835 E.0146
G1 X103.79 Y133.835 E.00706
G1 X103.788 Y134.968 E.03482
G3 X102.395 Y136.29 I-1.398 J-.078 E.06504
G1 X81.605 Y136.29 E.6388
G3 X80.21 Y134.897 I-.002 J-1.393 E.06731
G1 X80.21 Y133.835 E.03264
G1 X80.44 Y133.835 E.00707
G1 X80.44 Y134.31 E.0146
G1 X83.41 Y134.31 E.09126
G1 X83.41 Y132.535 E.05454
G1 X91.01 Y132.535 E.23353
G1 X91.01 Y123.465 E.2787
G1 X83.41 Y123.465 E.23353
G1 X83.41 Y121.69 E.05454
G1 X80.44 Y121.69 E.09126
G1 X80.44 Y122.165 E.0146
G1 X80.21 Y122.165 E.00706
G1 X80.212 Y121.032 E.03482
G3 X81.603 Y119.71 I1.398 J.078 E.06496
G1 X102.426 Y119.711 E.63984
G3 X103.79 Y121.105 I-.026 J1.39 E.06643
G1 X103.79 Y122.165 E.03256
G1 X103.56 Y122.165 E.00707
G1 X103.56 Y121.69 E.0146
G1 X100.59 Y121.69 E.09126
G1 X100.59 Y123.465 E.05454
G1 X93.05 Y123.465 E.23168
; WIPE_START
M204 S6000
G1 X93.037 Y125.465 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.25 Y126.122 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X92.25 Y127.75 E.05401
G1 X91.75 Y128.25 E.02343
G1 X91.75 Y127.75 E.01656
G1 X92.25 Y128.25 E.02343
G1 X92.25 Y129.878 E.05401
; WIPE_START
G1 X92.25 Y128.25 E-.61876
G1 X91.987 Y127.987 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.397 Y134.085 Z5.4 F42000
G1 X86.95 Y134.678 Z5.4
G1 Z5
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X86.95 Y133.7 E.03245
G1 X86.3 Y133.7 E.02156
G1 X86.725 Y133.275 E.01991
G1 X89.599 Y133.275 E.09536
G1 X91.874 Y135.55 E.10669
G1 X92.126 Y135.55 E.00838
G1 X94.401 Y133.275 E.10669
G1 X97.275 Y133.275 E.09536
G1 X97.7 Y133.7 E.01991
G1 X97.05 Y133.7 E.02156
G1 X97.05 Y134.678 E.03245
; WIPE_START
G1 X97.05 Y133.7 E-.37176
G1 X97.7 Y133.7 E-.247
G1 X97.437 Y133.437 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.594 Y135.975 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280782
G1 F15000
M204 S6000
G1 X102.512 Y135.972 E.09532
; LINE_WIDTH: 0.253977
G2 X102.74 Y135.948 I-.193 J-2.904 E.00394
; LINE_WIDTH: 0.211206
G1 X103.057 Y135.892 E.00442
; WIPE_START
G1 X102.74 Y135.948 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.972 Y128.835 Z5.4 F42000
G1 X97.05 Y121.322 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.05 Y122.3 E.03245
G1 X97.7 Y122.3 E.02156
G1 X97.275 Y122.725 E.01991
G1 X94.401 Y122.725 E.09536
G1 X92.127 Y120.451 E.10668
G1 X91.873 Y120.451 E.0084
G1 X89.599 Y122.725 E.10668
G1 X86.725 Y122.725 E.09536
G1 X86.3 Y122.3 E.01991
G1 X86.95 Y122.3 E.02156
G1 X86.95 Y121.322 E.03245
; WIPE_START
G1 X86.95 Y122.3 E-.37176
G1 X86.3 Y122.3 E-.247
G1 X86.563 Y122.563 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.406 Y120.025 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279426
G1 F15000
M204 S6000
G1 X81.552 Y120.026 E.09354
G2 X81.333 Y120.042 I.055 J2.24 E.00423
; LINE_WIDTH: 0.234825
G1 X81.248 Y120.054 E.00135
; LINE_WIDTH: 0.209365
G1 X80.943 Y120.109 E.00419
; WIPE_START
G1 X81.248 Y120.054 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.1 Y127.685 Z5.4 F42000
G1 X80.942 Y135.889 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.205547
G1 F15000
M204 S6000
G1 X81.221 Y135.941 E.00376
; LINE_WIDTH: 0.231629
G1 X81.341 Y135.959 E.00186
; LINE_WIDTH: 0.28026
G2 X81.613 Y135.975 I.297 J-2.782 E.00527
G1 X86.406 Y135.975 E.09269
; WIPE_START
G1 X84.406 Y135.975 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.27 Y130.093 Z5.4 F42000
G1 X97.594 Y120.025 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.279507
G1 F15000
M204 S6000
G1 X102.416 Y120.025 E.09296
G3 X102.67 Y120.042 I-.014 J2.152 E.00491
; LINE_WIDTH: 0.231646
G1 X102.77 Y120.057 E.00156
; LINE_WIDTH: 0.201565
G1 X103.055 Y120.112 E.00375
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X102.77 Y120.057 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 26/42
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z5.4 I-.058 J1.216 P1  F42000
G1 X164.598 Y123.023 Z5.4
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X164.598 Y132.977 E.3302
G1 X172.198 Y132.977 E.25211
G1 X172.198 Y134.777 E.05971
G1 X175.396 Y134.777 E.1061
G3 X174.385 Y135.898 I-1.007 J.108 E.05651
G1 X153.615 Y135.898 E.68898
G3 X152.604 Y134.777 I-.004 J-1.014 E.0565
G1 X155.802 Y134.777 E.1061
G1 X155.802 Y132.977 E.05971
G1 X163.402 Y132.977 E.25211
G1 X163.402 Y123.023 E.3302
G1 X155.802 Y123.023 E.25211
G1 X155.802 Y121.223 E.05971
G1 X152.604 Y121.223 E.1061
G3 X153.608 Y120.102 I1.013 J-.103 E.05618
G1 X174.413 Y120.103 E.69015
G3 X175.403 Y121.223 I-.022 J1.017 E.0557
G1 X172.198 Y121.223 E.10633
G1 X172.198 Y123.023 E.05971
G1 X164.658 Y123.023 E.25012
M204 S250
G1 X164.99 Y123.415 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X164.99 Y132.585 E.28177
G1 X172.59 Y132.585 E.23353
G1 X172.59 Y134.385 E.05531
G1 X173.302 Y134.385 E.02189
G1 X173.31 Y134.185 E.00615
G1 X173.69 Y134.185 E.01169
G1 X173.695 Y134.385 E.00615
G1 X174.502 Y134.385 E.02482
G1 X174.51 Y134.185 E.00615
G1 X174.89 Y134.185 E.01169
G1 X174.895 Y134.385 E.00615
G1 X175.789 Y134.385 E.0275
G3 X175.78 Y135.061 I-3.985 J.282 E.02081
G3 X174.395 Y136.29 I-1.39 J-.172 E.06216
G1 X153.605 Y136.29 E.6388
G3 X152.212 Y134.969 I-.003 J-1.393 E.0651
G1 X152.21 Y134.385 E.01795
G1 X153.102 Y134.385 E.02741
G1 X153.11 Y134.185 E.00615
G1 X153.49 Y134.185 E.01169
G1 X153.495 Y134.385 E.00615
G1 X154.305 Y134.385 E.02491
G1 X154.31 Y134.185 E.00614
G1 X154.69 Y134.186 E.01169
G1 X154.698 Y134.385 E.00613
G1 X155.41 Y134.385 E.02189
G1 X155.41 Y132.585 E.05531
G1 X163.01 Y132.585 E.23353
G1 X163.01 Y123.415 E.28177
G1 X155.41 Y123.415 E.23353
G1 X155.41 Y121.615 E.05531
G1 X154.698 Y121.615 E.02189
G1 X154.69 Y121.815 E.00615
G1 X154.31 Y121.815 E.01169
G1 X154.305 Y121.615 E.00615
G1 X153.498 Y121.615 E.02482
G1 X153.49 Y121.815 E.00615
G1 X153.11 Y121.815 E.01169
G1 X153.105 Y121.615 E.00615
G1 X152.21 Y121.615 E.0275
G3 X152.22 Y120.939 I3.986 J-.282 E.02081
G3 X153.603 Y119.71 I1.39 J.172 E.06209
G1 X174.424 Y119.711 E.63978
G3 X175.79 Y121.105 I-.027 J1.393 E.06646
G1 X175.79 Y121.615 E.01566
G1 X174.898 Y121.615 E.02742
G1 X174.89 Y121.815 E.00615
G1 X174.51 Y121.815 E.01169
G1 X174.505 Y121.615 E.00615
G1 X173.695 Y121.615 E.02491
G1 X173.69 Y121.815 E.00614
G1 X173.31 Y121.814 E.01169
G1 X173.303 Y121.615 E.00613
G1 X172.59 Y121.615 E.02189
G1 X172.59 Y123.415 E.05531
G1 X165.05 Y123.415 E.23168
; WIPE_START
M204 S6000
G1 X165.037 Y125.415 E-.76
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
G1 X164.25 Y129.878 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X164.25 Y128.25 E.05401
G1 X163.75 Y127.75 E.02343
G1 X163.75 Y128.25 E.01656
G1 X164.25 Y127.75 E.02343
G1 X164.25 Y126.122 E.05401
; WIPE_START
G1 X164.25 Y127.75 E-.61876
G1 X163.987 Y128.013 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.808 Y123.532 Z5.6 F42000
G1 X154.145 Y120.875 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X155.773 Y120.875 E.05401
G1 X156.198 Y120.45 E.0199
G1 X156.45 Y120.45 E.00838
G1 X158.675 Y122.675 E.10434
G1 X161.649 Y122.675 E.09868
G1 X163.873 Y120.451 E.10433
G1 X164.127 Y120.451 E.0084
G1 X166.351 Y122.675 E.10433
G1 X169.325 Y122.675 E.09868
G1 X171.549 Y120.451 E.10432
G1 X171.803 Y120.451 E.00842
G1 X172.227 Y120.875 E.01988
G1 X173.855 Y120.875 E.05401
; WIPE_START
G1 X172.227 Y120.875 E-.61876
G1 X171.964 Y120.612 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X172.95 Y128.18 Z5.6 F42000
G1 X173.855 Y135.125 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X172.227 Y135.125 E.05401
G1 X171.802 Y135.55 E.01991
G1 X171.55 Y135.55 E.00838
G1 X169.325 Y133.325 E.10435
G1 X166.351 Y133.325 E.09868
G1 X164.126 Y135.55 E.10435
G1 X163.874 Y135.55 E.00838
G1 X161.649 Y133.325 E.10435
G1 X158.675 Y133.325 E.09868
G1 X156.45 Y135.55 E.10435
G1 X156.198 Y135.55 E.00838
G1 X155.773 Y135.125 E.01991
G1 X154.145 Y135.125 E.05401
; OBJECT_ID: 405
; WIPE_START
G1 X155.773 Y135.125 E-.61876
G1 X156.036 Y135.388 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X149.075 Y132.258 Z5.6 F42000
G1 X128.598 Y123.048 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X128.598 Y132.952 E.32854
G1 X136.198 Y132.952 E.25211
G1 X136.198 Y134.727 E.05888
G1 X139.397 Y134.727 E.1061
G3 X138.385 Y135.898 I-1.009 J.15 E.05825
G1 X125.802 Y135.898 E.4174
G1 X125.802 Y132.952 E.09772
G1 X127.402 Y132.952 E.05307
G1 X127.402 Y123.048 E.32854
G1 X119.802 Y123.048 E.25211
G1 X119.802 Y121.273 E.05888
G1 X116.603 Y121.273 E.1061
G3 X117.615 Y120.102 I1.011 J-.149 E.05822
G1 X130.198 Y120.102 E.4174
G1 X130.198 Y123.048 E.09772
G1 X128.658 Y123.048 E.05108
M204 S250
M73 P68 R7
G1 X128.99 Y123.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X128.99 Y132.56 E.28023
G1 X136.59 Y132.56 E.23353
G1 X136.59 Y134.335 E.05454
G1 X139.79 Y134.335 E.09831
G3 X139.78 Y135.061 I-4.271 J.307 E.02235
G3 X138.395 Y136.29 I-1.385 J-.166 E.06222
G1 X125.41 Y136.29 E.39898
G1 X125.41 Y132.56 E.11461
G1 X127.01 Y132.56 E.04916
G1 X127.01 Y123.44 E.28023
G1 X119.41 Y123.44 E.23353
G1 X119.41 Y121.665 E.05454
G1 X116.21 Y121.665 E.09831
G3 X116.22 Y120.939 I4.272 J-.307 E.02235
G3 X117.605 Y119.71 I1.384 J.165 E.06223
G1 X130.59 Y119.71 E.39898
G1 X130.59 Y123.44 E.11461
G1 X129.05 Y123.44 E.04732
; WIPE_START
M204 S6000
G1 X129.037 Y125.44 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.25 Y129.878 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X128.25 Y128.25 E.05401
G1 X127.75 Y127.75 E.02343
G1 X127.75 Y128.25 E.01656
G1 X128.25 Y127.75 E.02343
G1 X128.25 Y122.7 E.16754
G1 X129.85 Y122.7 E.05307
G1 X129.85 Y122.174 E.01745
G1 X128.127 Y120.451 E.0808
G1 X127.873 Y120.451 E.00844
G1 X125.624 Y122.7 E.10547
G1 X122.7 Y122.7 E.09702
G1 X120.455 Y120.455 E.10532
G1 X120.193 Y120.455 E.00867
G1 X119.723 Y120.925 E.02204
G1 X118.095 Y120.925 E.05401
; WIPE_START
G1 X119.723 Y120.925 E-.61876
G1 X119.986 Y120.662 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.933 Y125.446 Z5.6 F42000
G1 X137.905 Y135.075 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X136.277 Y135.075 E.05401
G1 X135.802 Y135.55 E.02225
G1 X135.55 Y135.55 E.00838
G1 X133.3 Y133.3 E.10552
G1 X130.376 Y133.3 E.09702
G1 X128.126 Y135.55 E.10552
G1 X127.874 Y135.55 E.00838
G1 X126.15 Y133.826 E.08085
G1 X126.15 Y133.3 E.01745
G1 X127.253 Y133.3 E.03657
; OBJECT_ID: 394
; WIPE_START
G1 X126.15 Y133.3 E-.4189
G1 X126.15 Y133.826 E-.19986
G1 X126.413 Y134.089 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X118.781 Y134.183 Z5.6 F42000
G1 X97.79 Y134.44 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X103.41 Y134.44 E.17269
G1 X103.41 Y135.66 E.03749
G1 X97.79 Y135.66 E.17269
G1 X97.79 Y134.5 E.03564
; WIPE_START
M204 S6000
G1 X99.79 Y134.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.622 Y126.936 Z5.6 F42000
G1 X97.79 Y121.56 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X97.79 Y120.34 E.03749
G1 X103.41 Y120.34 E.17269
G1 X103.41 Y121.56 E.03749
G1 X97.85 Y121.56 E.17084
M204 S10000
G1 X97.398 Y121.56 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.398 Y121.952 E.01301
G1 X100.198 Y121.952 E.09288
G1 X100.198 Y123.073 E.03718
G1 X92.598 Y123.073 E.25211
G1 X92.598 Y132.927 E.32688
G1 X100.198 Y132.927 E.25211
G1 X100.198 Y134.048 E.03718
G1 X97.398 Y134.048 E.09288
G1 X97.398 Y135.898 E.06137
G1 X86.602 Y135.898 E.35812
G1 X86.602 Y134.048 E.06137
G1 X83.802 Y134.048 E.09288
G1 X83.802 Y132.927 E.03718
G1 X91.402 Y132.927 E.25211
G1 X91.402 Y123.073 E.32688
G1 X83.802 Y123.073 E.25211
G1 X83.802 Y121.952 E.03718
G1 X86.602 Y121.952 E.09288
G1 X86.602 Y120.102 E.06136
G1 X97.398 Y120.103 E.35812
G1 X97.398 Y121.5 E.04635
; WIPE_START
G1 X97.398 Y121.952 E-.17179
G1 X98.946 Y121.952 E-.58821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.317 Y121.717 Z5.6 F42000
G1 X86.21 Y121.56 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X80.59 Y121.56 E.17269
G1 X80.59 Y120.34 E.03749
G1 X86.21 Y120.34 E.17269
G1 X86.21 Y121.5 E.03564
; WIPE_START
M204 S6000
G1 X84.21 Y121.521 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.378 Y129.064 Z5.6 F42000
G1 X86.21 Y134.44 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X86.21 Y135.66 E.03749
G1 X80.59 Y135.66 E.17269
G1 X80.59 Y134.44 E.03749
G1 X86.15 Y134.44 E.17084
; WIPE_START
M204 S6000
G1 X86.21 Y135.66 E-.46416
G1 X85.431 Y135.66 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.452 Y129.173 Z5.6 F42000
G1 X92.99 Y123.465 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X92.99 Y132.535 E.2787
G1 X100.59 Y132.535 E.23353
G1 X100.59 Y134.31 E.05454
G1 X103.56 Y134.31 E.09126
G1 X103.56 Y133.835 E.0146
G1 X103.79 Y133.835 E.00706
G1 X103.788 Y134.968 E.03482
G3 X102.395 Y136.29 I-1.398 J-.078 E.06504
G1 X81.605 Y136.29 E.6388
G3 X80.21 Y134.897 I-.003 J-1.393 E.06731
G1 X80.21 Y133.835 E.03264
G1 X80.44 Y133.835 E.00707
G1 X80.44 Y134.31 E.0146
G1 X83.41 Y134.31 E.09126
G1 X83.41 Y132.535 E.05454
G1 X91.01 Y132.535 E.23353
G1 X91.01 Y123.465 E.2787
G1 X83.41 Y123.465 E.23353
G1 X83.41 Y121.69 E.05454
G1 X80.44 Y121.69 E.09126
G1 X80.44 Y122.165 E.0146
G1 X80.21 Y122.165 E.00706
G1 X80.212 Y121.032 E.03482
G3 X81.603 Y119.71 I1.401 J.081 E.06492
G1 X102.424 Y119.711 E.63978
G3 X103.79 Y121.105 I-.028 J1.394 E.06645
G1 X103.79 Y122.165 E.03256
G1 X103.56 Y122.165 E.00707
G1 X103.56 Y121.69 E.0146
G1 X100.59 Y121.69 E.09126
G1 X100.59 Y123.465 E.05454
G1 X93.05 Y123.465 E.23168
; WIPE_START
M204 S6000
G1 X93.037 Y125.465 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.594 Y120.025 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279695
G1 F15000
M204 S6000
G1 X102.414 Y120.025 E.093
G3 X102.646 Y120.039 I-.008 J2.058 E.0045
; LINE_WIDTH: 0.22469
G3 X103.058 Y120.106 I-.665 J5.445 E.00618
M204 S10000
G1 X103.053 Y120.125 F42000
; LINE_WIDTH: 0.105663
G1 F15000
M204 S6000
G1 X102.32 Y119.907 E.00391
; WIPE_START
G1 X103.053 Y120.125 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.388 Y125.239 Z5.6 F42000
G1 X92.25 Y129.878 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X92.25 Y128.25 E.05401
G1 X91.75 Y127.75 E.02343
G1 X91.75 Y128.25 E.01656
G1 X92.25 Y127.75 E.02343
G1 X92.25 Y126.122 E.05401
; WIPE_START
G1 X92.25 Y127.75 E-.61876
G1 X91.987 Y128.013 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.397 Y121.915 Z5.6 F42000
G1 X86.95 Y121.322 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X86.95 Y122.3 E.03245
G1 X86.3 Y122.3 E.02156
G1 X86.725 Y122.725 E.01991
G1 X89.599 Y122.725 E.09536
G1 X91.873 Y120.451 E.10668
G1 X92.127 Y120.451 E.0084
G1 X94.401 Y122.725 E.10668
G1 X97.275 Y122.725 E.09536
G1 X97.7 Y122.3 E.01991
G1 X97.05 Y122.3 E.02156
G1 X97.05 Y121.322 E.03245
; WIPE_START
G1 X97.05 Y122.3 E-.37176
G1 X97.7 Y122.3 E-.247
G1 X97.437 Y122.563 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.999 Y120.852 Z5.6 F42000
G1 X86.406 Y120.025 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279435
G1 F15000
M204 S6000
G1 X81.552 Y120.026 E.09355
G2 X81.333 Y120.042 I.055 J2.243 E.00423
; LINE_WIDTH: 0.234578
G1 X81.246 Y120.054 E.00137
; LINE_WIDTH: 0.209163
G1 X80.944 Y120.109 E.00416
; WIPE_START
G1 X81.246 Y120.054 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.1 Y127.685 Z5.6 F42000
G1 X80.942 Y135.89 Z5.6
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.205498
G1 F15000
M204 S6000
G1 X81.221 Y135.941 E.00375
; LINE_WIDTH: 0.231517
G1 X81.341 Y135.959 E.00188
; LINE_WIDTH: 0.28026
G2 X81.613 Y135.975 I.297 J-2.781 E.00527
G1 X86.406 Y135.975 E.09269
; WIPE_START
G1 X84.406 Y135.975 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.999 Y135.196 Z5.6 F42000
G1 X97.05 Y134.678 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.05 Y133.7 E.03245
G1 X97.7 Y133.7 E.02156
G1 X97.275 Y133.275 E.01991
G1 X94.401 Y133.275 E.09536
G1 X92.126 Y135.55 E.10669
G1 X91.874 Y135.55 E.00838
G1 X89.599 Y133.275 E.10669
G1 X86.725 Y133.275 E.09536
G1 X86.3 Y133.7 E.01991
G1 X86.95 Y133.7 E.02156
G1 X86.95 Y134.678 E.03245
; WIPE_START
G1 X86.95 Y133.7 E-.37176
G1 X86.3 Y133.7 E-.247
G1 X86.563 Y133.437 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.001 Y135.148 Z5.6 F42000
G1 X97.594 Y135.975 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280782
G1 F15000
M204 S6000
G1 X102.512 Y135.972 E.09532
; LINE_WIDTH: 0.254205
G2 X102.738 Y135.948 I-.194 J-2.918 E.00391
; LINE_WIDTH: 0.21142
G1 X103.058 Y135.892 E.00446
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X102.738 Y135.948 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 27/42
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z5.6 I.249 J1.191 P1  F42000
G1 X164.598 Y123.023 Z5.6
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X164.598 Y132.977 E.3302
G1 X172.198 Y132.977 E.25211
G1 X172.198 Y134.777 E.05971
G1 X175.397 Y134.777 E.1061
G3 X174.387 Y135.898 I-1.007 J.108 E.05646
G1 X153.615 Y135.898 E.68904
G3 X152.604 Y134.777 I-.007 J-1.011 E.05655
G1 X155.802 Y134.777 E.1061
G1 X155.802 Y132.977 E.05971
G1 X163.402 Y132.977 E.25211
G1 X163.402 Y123.023 E.3302
G1 X155.802 Y123.023 E.25211
G1 X155.802 Y121.223 E.05971
G1 X152.603 Y121.223 E.1061
G3 X153.613 Y120.102 I1.005 J-.11 E.0565
G1 X174.411 Y120.103 E.68991
G3 X175.403 Y121.223 I-.018 J1.015 E.05578
G1 X172.198 Y121.223 E.10631
G1 X172.198 Y123.023 E.05971
G1 X164.658 Y123.023 E.25012
M204 S250
G1 X164.99 Y123.415 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X164.99 Y132.585 E.28177
G1 X172.59 Y132.585 E.23353
G1 X172.59 Y134.385 E.05531
G1 X173.303 Y134.385 E.02189
G1 X173.31 Y134.185 E.00615
G1 X173.69 Y134.185 E.01169
G1 X173.695 Y134.385 E.00615
G1 X174.503 Y134.385 E.02483
G1 X174.51 Y134.185 E.00615
G1 X174.89 Y134.185 E.01169
G1 X174.895 Y134.385 E.00615
G1 X175.789 Y134.385 E.0275
G3 X175.783 Y135.034 I-4.556 J.282 E.01995
G3 X174.395 Y136.29 I-1.397 J-.148 E.06297
G1 X153.605 Y136.29 E.63881
G3 X152.212 Y134.969 I.012 J-1.408 E.06492
G1 X152.21 Y134.385 E.01794
G1 X153.103 Y134.385 E.02741
G1 X153.11 Y134.185 E.00615
G1 X153.49 Y134.185 E.01169
G1 X153.495 Y134.385 E.00615
G1 X154.305 Y134.385 E.02491
G1 X154.31 Y134.185 E.00614
G1 X154.69 Y134.186 E.01169
G1 X154.697 Y134.385 E.00613
G1 X155.41 Y134.385 E.02189
G1 X155.41 Y132.585 E.05531
G1 X163.01 Y132.585 E.23353
G1 X163.01 Y123.415 E.28177
G1 X155.41 Y123.415 E.23353
G1 X155.41 Y121.615 E.05531
G1 X154.697 Y121.615 E.02189
G1 X154.69 Y121.815 E.00615
G1 X154.31 Y121.815 E.01169
G1 X154.305 Y121.615 E.00615
G1 X153.497 Y121.615 E.02482
G1 X153.49 Y121.815 E.00615
G1 X153.11 Y121.815 E.01169
G1 X153.105 Y121.615 E.00615
G1 X152.21 Y121.615 E.02749
G3 X152.217 Y120.965 I4.55 J-.282 E.01999
G3 X153.605 Y119.71 I1.386 J.138 E.06305
G1 X174.422 Y119.711 E.63966
G3 X175.79 Y121.105 I-.022 J1.39 E.06654
G1 X175.79 Y121.615 E.01568
G1 X174.897 Y121.615 E.02742
G1 X174.89 Y121.815 E.00615
G1 X174.51 Y121.815 E.01169
G1 X174.505 Y121.615 E.00615
G1 X173.695 Y121.615 E.02491
G1 X173.69 Y121.815 E.00614
G1 X173.31 Y121.814 E.01169
G1 X173.303 Y121.615 E.00613
G1 X172.59 Y121.615 E.02189
G1 X172.59 Y123.415 E.05531
G1 X165.05 Y123.415 E.23168
; WIPE_START
M204 S6000
G1 X165.037 Y125.415 E-.76
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
G1 X164.25 Y126.122 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X164.25 Y127.75 E.05401
G1 X163.75 Y128.25 E.02343
G1 X163.75 Y127.75 E.01656
G1 X164.25 Y128.25 E.02343
G1 X164.25 Y129.878 E.05401
; WIPE_START
G1 X164.25 Y128.25 E-.61876
G1 X163.987 Y127.987 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.808 Y132.468 Z5.8 F42000
G1 X154.145 Y135.125 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X155.773 Y135.125 E.05401
G1 X156.198 Y135.55 E.01991
G1 X156.45 Y135.55 E.00838
G1 X158.675 Y133.325 E.10435
G1 X161.649 Y133.325 E.09868
G1 X163.874 Y135.55 E.10435
G1 X164.126 Y135.55 E.00838
G1 X166.351 Y133.325 E.10435
G1 X169.325 Y133.325 E.09868
G1 X171.55 Y135.55 E.10435
G1 X171.802 Y135.55 E.00838
G1 X172.227 Y135.125 E.01991
G1 X173.855 Y135.125 E.05401
; WIPE_START
G1 X172.227 Y135.125 E-.61876
G1 X171.964 Y135.388 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X172.95 Y127.82 Z5.8 F42000
G1 X173.855 Y120.875 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X172.227 Y120.875 E.05401
G1 X171.803 Y120.451 E.01988
G1 X171.549 Y120.451 E.00842
G1 X169.325 Y122.675 E.10432
G1 X166.351 Y122.675 E.09868
G1 X164.127 Y120.451 E.10433
G1 X163.873 Y120.451 E.0084
G1 X161.649 Y122.675 E.10433
G1 X158.675 Y122.675 E.09868
G1 X156.45 Y120.45 E.10434
G1 X156.198 Y120.45 E.00838
G1 X155.773 Y120.875 E.0199
G1 X154.145 Y120.875 E.05401
; OBJECT_ID: 405
; WIPE_START
G1 X155.773 Y120.875 E-.61876
G1 X156.036 Y120.612 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X148.434 Y121.287 Z5.8 F42000
G1 X128.598 Y123.048 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X128.598 Y132.952 E.32854
G1 X136.198 Y132.952 E.25211
G1 X136.198 Y134.727 E.05888
G1 X139.397 Y134.727 E.1061
G3 X138.387 Y135.898 I-1.009 J.15 E.0582
G1 X125.802 Y135.898 E.41745
G1 X125.802 Y132.952 E.09772
G1 X127.402 Y132.952 E.05307
G1 X127.402 Y123.048 E.32854
G1 X119.802 Y123.048 E.25211
G1 X119.802 Y121.273 E.05888
G1 X116.603 Y121.273 E.1061
G3 X117.615 Y120.102 I1.011 J-.149 E.05823
M73 P69 R7
G1 X130.198 Y120.102 E.4174
G1 X130.198 Y123.048 E.09772
G1 X128.658 Y123.048 E.05108
M204 S250
G1 X128.99 Y123.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X128.99 Y132.56 E.28023
G1 X136.59 Y132.56 E.23353
G1 X136.59 Y134.335 E.05454
G1 X139.79 Y134.335 E.09831
G3 X139.783 Y135.034 I-4.895 J.307 E.02149
G3 X138.395 Y136.29 I-1.385 J-.135 E.06311
G1 X125.41 Y136.29 E.399
G1 X125.41 Y132.56 E.11461
G1 X127.01 Y132.56 E.04916
G1 X127.01 Y123.44 E.28023
G1 X119.41 Y123.44 E.23353
G1 X119.41 Y121.665 E.05454
G1 X116.21 Y121.665 E.09831
G3 X116.22 Y120.94 I4.292 J-.307 E.02229
G3 X117.605 Y119.71 I1.39 J.17 E.06222
G1 X130.59 Y119.71 E.39898
G1 X130.59 Y123.44 E.11461
G1 X129.05 Y123.44 E.04732
; WIPE_START
M204 S6000
G1 X129.037 Y125.44 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.347 Y132.883 Z5.8 F42000
G1 X127.253 Y133.3 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X126.15 Y133.3 E.03657
G1 X126.15 Y133.826 E.01745
G1 X127.874 Y135.55 E.08085
G1 X128.126 Y135.55 E.00838
G1 X130.376 Y133.3 E.10552
G1 X133.3 Y133.3 E.09702
G1 X135.55 Y135.55 E.10552
G1 X135.802 Y135.55 E.00838
G1 X136.277 Y135.075 E.02225
G1 X137.905 Y135.075 E.05401
; WIPE_START
G1 X136.277 Y135.075 E-.61876
G1 X136.014 Y135.338 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.067 Y130.554 Z5.8 F42000
G1 X118.095 Y120.925 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X119.723 Y120.925 E.05401
G1 X120.193 Y120.455 E.02204
G1 X120.455 Y120.455 E.00867
G1 X122.7 Y122.7 E.10532
G1 X125.624 Y122.7 E.09702
G1 X127.873 Y120.451 E.10547
G1 X128.127 Y120.451 E.00844
G1 X129.85 Y122.174 E.0808
G1 X129.85 Y122.7 E.01745
G1 X128.25 Y122.7 E.05307
G1 X128.25 Y127.75 E.16754
G1 X127.75 Y128.25 E.02343
G1 X127.75 Y127.75 E.01656
G1 X128.25 Y128.25 E.02343
G1 X128.25 Y129.878 E.05401
; OBJECT_ID: 394
; WIPE_START
G1 X128.25 Y128.25 E-.61876
G1 X127.987 Y127.987 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X120.523 Y129.582 Z5.8 F42000
G1 X97.79 Y134.44 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X103.41 Y134.44 E.17269
G1 X103.41 Y135.66 E.03749
G1 X97.79 Y135.66 E.17269
G1 X97.79 Y134.5 E.03564
; WIPE_START
M204 S6000
G1 X99.79 Y134.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.622 Y126.936 Z5.8 F42000
G1 X97.79 Y121.56 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X97.79 Y120.34 E.03749
G1 X103.41 Y120.34 E.17269
G1 X103.41 Y121.56 E.03749
G1 X97.85 Y121.56 E.17084
M204 S10000
G1 X97.398 Y121.56 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.398 Y121.952 E.01301
G1 X100.198 Y121.952 E.09288
G1 X100.198 Y123.073 E.03718
G1 X92.598 Y123.073 E.25211
G1 X92.598 Y132.927 E.32688
G1 X100.198 Y132.927 E.25211
G1 X100.198 Y134.048 E.03718
G1 X97.398 Y134.048 E.09288
G1 X97.398 Y135.898 E.06137
G1 X86.602 Y135.898 E.35812
G1 X86.602 Y134.048 E.06137
G1 X83.802 Y134.048 E.09288
G1 X83.802 Y132.927 E.03718
G1 X91.402 Y132.927 E.25211
G1 X91.402 Y123.073 E.32688
G1 X83.802 Y123.073 E.25211
G1 X83.802 Y121.952 E.03718
G1 X86.602 Y121.952 E.09288
G1 X86.602 Y120.102 E.06136
G1 X97.398 Y120.103 E.35812
G1 X97.398 Y121.5 E.04635
; WIPE_START
G1 X97.398 Y121.952 E-.17179
G1 X98.946 Y121.952 E-.58821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.317 Y121.717 Z5.8 F42000
G1 X86.21 Y121.56 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X80.59 Y121.56 E.17269
G1 X80.59 Y120.34 E.03749
G1 X86.21 Y120.34 E.17269
G1 X86.21 Y121.5 E.03564
; WIPE_START
M204 S6000
G1 X84.21 Y121.521 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.378 Y129.064 Z5.8 F42000
G1 X86.21 Y134.44 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X86.21 Y135.66 E.03749
G1 X80.59 Y135.66 E.17269
G1 X80.59 Y134.44 E.03749
G1 X86.15 Y134.44 E.17084
; WIPE_START
M204 S6000
G1 X86.21 Y135.66 E-.46416
G1 X85.431 Y135.66 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.452 Y129.173 Z5.8 F42000
G1 X92.99 Y123.465 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X92.99 Y132.535 E.2787
G1 X100.59 Y132.535 E.23353
G1 X100.59 Y134.31 E.05454
G1 X103.56 Y134.31 E.09126
G1 X103.56 Y133.835 E.0146
G1 X103.79 Y133.835 E.00706
G1 X103.788 Y134.968 E.03482
G3 X102.395 Y136.29 I-1.401 J-.081 E.06499
G1 X81.605 Y136.29 E.63881
G3 X80.21 Y134.895 I-.001 J-1.395 E.06734
G1 X80.21 Y133.835 E.03258
G1 X80.44 Y133.835 E.00707
G1 X80.44 Y134.31 E.0146
G1 X83.41 Y134.31 E.09126
G1 X83.41 Y132.535 E.05454
G1 X91.01 Y132.535 E.23353
G1 X91.01 Y123.465 E.2787
G1 X83.41 Y123.465 E.23353
G1 X83.41 Y121.69 E.05454
G1 X80.44 Y121.69 E.09126
G1 X80.44 Y122.165 E.0146
G1 X80.21 Y122.165 E.00706
G1 X80.212 Y121.032 E.03482
G3 X81.605 Y119.71 I1.401 J.081 E.06499
G1 X102.422 Y119.711 E.63966
G3 X103.79 Y121.105 I-.026 J1.394 E.06651
G1 X103.79 Y122.165 E.03256
G1 X103.56 Y122.165 E.00707
G1 X103.56 Y121.69 E.0146
G1 X100.59 Y121.69 E.09126
G1 X100.59 Y123.465 E.05454
G1 X93.05 Y123.465 E.23168
; WIPE_START
M204 S6000
G1 X93.037 Y125.465 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.25 Y126.122 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X92.25 Y127.75 E.05401
G1 X91.75 Y128.25 E.02343
G1 X91.75 Y127.75 E.01656
G1 X92.25 Y128.25 E.02343
G1 X92.25 Y129.878 E.05401
; WIPE_START
G1 X92.25 Y128.25 E-.61876
G1 X91.987 Y127.987 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.397 Y134.085 Z5.8 F42000
G1 X86.95 Y134.678 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X86.95 Y133.7 E.03245
G1 X86.3 Y133.7 E.02156
G1 X86.725 Y133.275 E.01991
G1 X89.599 Y133.275 E.09536
G1 X91.874 Y135.55 E.10669
G1 X92.126 Y135.55 E.00838
G1 X94.401 Y133.275 E.10669
G1 X97.275 Y133.275 E.09536
G1 X97.7 Y133.7 E.01991
G1 X97.05 Y133.7 E.02156
G1 X97.05 Y134.678 E.03245
; WIPE_START
G1 X97.05 Y133.7 E-.37176
G1 X97.7 Y133.7 E-.247
G1 X97.437 Y133.437 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.594 Y135.975 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280815
G1 F15000
M204 S6000
G1 X102.489 Y135.973 E.09488
; LINE_WIDTH: 0.25628
G2 X102.736 Y135.948 I-.136 J-2.636 E.00432
; LINE_WIDTH: 0.211719
G1 X103.057 Y135.892 E.00448
; WIPE_START
G1 X102.736 Y135.948 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.97 Y128.835 Z5.8 F42000
G1 X97.05 Y121.322 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.05 Y122.3 E.03245
G1 X97.7 Y122.3 E.02156
G1 X97.275 Y122.725 E.01991
G1 X94.401 Y122.725 E.09536
G1 X92.127 Y120.451 E.10668
G1 X91.873 Y120.451 E.0084
G1 X89.599 Y122.725 E.10668
G1 X86.725 Y122.725 E.09536
G1 X86.3 Y122.3 E.01991
G1 X86.95 Y122.3 E.02156
G1 X86.95 Y121.322 E.03245
; WIPE_START
G1 X86.95 Y122.3 E-.37176
G1 X86.3 Y122.3 E-.247
G1 X86.563 Y122.563 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.406 Y120.025 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280137
G1 F15000
M204 S6000
G1 X81.612 Y120.025 E.09267
G2 X81.334 Y120.042 I.006 J2.407 E.00539
; LINE_WIDTH: 0.234285
G1 X81.244 Y120.055 E.00141
; LINE_WIDTH: 0.208921
G1 X80.943 Y120.109 E.00415
; WIPE_START
G1 X81.244 Y120.055 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.1 Y127.686 Z5.8 F42000
G1 X80.945 Y135.887 Z5.8
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.197351
G1 F15000
M204 S6000
G1 X81.226 Y135.942 E.0036
; LINE_WIDTH: 0.231562
G1 X81.336 Y135.959 E.00172
; LINE_WIDTH: 0.280231
G2 X81.613 Y135.975 I.28 J-2.377 E.00537
G1 X86.406 Y135.975 E.09268
; WIPE_START
G1 X84.406 Y135.975 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.27 Y130.093 Z5.8 F42000
G1 X97.594 Y120.025 Z5.8
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.279265
G1 F15000
M204 S6000
G1 X102.412 Y120.025 E.09279
G3 X102.713 Y120.048 I-.045 J2.608 E.00581
; LINE_WIDTH: 0.214907
G1 X103.058 Y120.108 E.00491
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X102.713 Y120.048 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 28/42
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z5.8 I-.058 J1.216 P1  F42000
G1 X164.598 Y123.023 Z5.8
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X164.598 Y132.977 E.3302
G1 X172.198 Y132.977 E.25211
G1 X172.198 Y134.777 E.05971
G1 X175.397 Y134.777 E.1061
G3 X174.385 Y135.898 I-1.013 J.102 E.05641
G1 X153.615 Y135.898 E.68899
G3 X152.603 Y134.777 I-.009 J-1.009 E.05658
G1 X155.802 Y134.777 E.1061
G1 X155.802 Y132.977 E.05971
G1 X163.402 Y132.977 E.25211
G1 X163.402 Y123.023 E.3302
G1 X155.802 Y123.023 E.25211
G1 X155.802 Y121.223 E.05971
G1 X152.603 Y121.223 E.1061
G3 X153.615 Y120.102 I1.005 J-.11 E.05655
G1 X174.409 Y120.103 E.68979
G3 X175.403 Y121.223 I-.017 J1.016 E.05585
G1 X172.198 Y121.223 E.10633
G1 X172.198 Y123.023 E.05971
G1 X164.658 Y123.023 E.25012
M204 S250
G1 X164.99 Y123.415 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X164.99 Y132.585 E.28177
G1 X172.59 Y132.585 E.23353
G1 X172.59 Y134.385 E.05531
G1 X173.303 Y134.385 E.02189
G1 X173.31 Y134.185 E.00615
G1 X173.69 Y134.185 E.01169
G1 X173.695 Y134.385 E.00615
G1 X174.503 Y134.385 E.02482
G1 X174.51 Y134.185 E.00615
G1 X174.89 Y134.185 E.01169
G1 X174.895 Y134.385 E.00615
G1 X175.789 Y134.385 E.02749
G3 X175.783 Y135.034 I-4.556 J.282 E.01995
G3 X174.395 Y136.29 I-1.393 J-.145 E.06302
G1 X153.605 Y136.29 E.6388
G3 X152.212 Y134.97 I.007 J-1.403 E.06494
G1 X152.21 Y134.385 E.01798
G1 X153.103 Y134.385 E.02741
G1 X153.11 Y134.185 E.00615
G1 X153.49 Y134.185 E.01169
G1 X153.495 Y134.385 E.00615
G1 X154.305 Y134.385 E.02491
G1 X154.31 Y134.185 E.00614
G1 X154.69 Y134.186 E.01169
G1 X154.697 Y134.385 E.00613
G1 X155.41 Y134.385 E.02189
G1 X155.41 Y132.585 E.05531
G1 X163.01 Y132.585 E.23353
G1 X163.01 Y123.415 E.28177
G1 X155.41 Y123.415 E.23353
G1 X155.41 Y121.615 E.05531
G1 X154.697 Y121.615 E.02189
G1 X154.69 Y121.815 E.00615
G1 X154.31 Y121.815 E.01169
G1 X154.305 Y121.615 E.00615
G1 X153.497 Y121.615 E.02482
G1 X153.49 Y121.815 E.00615
G1 X153.11 Y121.815 E.01169
G1 X153.105 Y121.615 E.00615
G1 X152.21 Y121.615 E.02749
G3 X152.217 Y120.965 I4.549 J-.282 E.01999
G3 X153.605 Y119.71 I1.386 J.138 E.06307
G1 X174.42 Y119.711 E.63957
G3 X175.79 Y121.105 I-.02 J1.39 E.06662
G1 X175.79 Y121.615 E.01566
G1 X174.897 Y121.615 E.02742
G1 X174.89 Y121.815 E.00615
G1 X174.51 Y121.815 E.01169
G1 X174.505 Y121.615 E.00615
G1 X173.695 Y121.615 E.02491
G1 X173.69 Y121.815 E.00614
G1 X173.31 Y121.814 E.01169
G1 X173.303 Y121.615 E.00613
G1 X172.59 Y121.615 E.02189
G1 X172.59 Y123.415 E.05531
G1 X165.05 Y123.415 E.23168
; WIPE_START
M204 S6000
G1 X165.037 Y125.415 E-.76
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
G1 X163.75 Y126.122 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X163.75 Y127.75 E.05401
G1 X164.25 Y128.25 E.02343
G1 X164.25 Y127.75 E.01656
G1 X163.75 Y128.25 E.02343
G1 X163.75 Y129.878 E.05401
; WIPE_START
G1 X163.75 Y128.25 E-.61876
G1 X164.013 Y127.987 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X170.191 Y132.468 Z6 F42000
G1 X173.855 Y135.125 Z6
G1 Z5.6
G1 E.8 F1800
M73 P70 R7
G1 F8843.478
M204 S6000
G1 X172.227 Y135.125 E.05401
G1 X171.802 Y135.55 E.01991
G1 X171.55 Y135.55 E.00838
G1 X169.325 Y133.325 E.10435
G1 X166.351 Y133.325 E.09868
G1 X164.126 Y135.55 E.10435
G1 X163.874 Y135.55 E.00838
G1 X161.649 Y133.325 E.10435
G1 X158.675 Y133.325 E.09868
G1 X156.45 Y135.55 E.10435
G1 X156.198 Y135.55 E.00838
G1 X155.773 Y135.125 E.01991
G1 X154.145 Y135.125 E.05401
; WIPE_START
G1 X155.773 Y135.125 E-.61876
G1 X156.036 Y135.388 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X155.05 Y127.82 Z6 F42000
G1 X154.145 Y120.875 Z6
G1 Z5.6
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X155.773 Y120.875 E.05401
G1 X156.198 Y120.45 E.0199
G1 X156.45 Y120.45 E.00838
G1 X158.675 Y122.675 E.10435
G1 X161.649 Y122.675 E.09868
G1 X163.873 Y120.451 E.10433
G1 X164.127 Y120.451 E.0084
G1 X166.351 Y122.675 E.10433
G1 X169.325 Y122.675 E.09868
G1 X171.549 Y120.451 E.10432
G1 X171.803 Y120.451 E.00841
G1 X172.227 Y120.875 E.01988
G1 X173.855 Y120.875 E.05401
; OBJECT_ID: 405
; WIPE_START
G1 X172.227 Y120.875 E-.61876
G1 X171.964 Y120.612 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X164.343 Y121.04 Z6 F42000
G1 X128.598 Y123.048 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X128.598 Y132.952 E.32854
G1 X136.198 Y132.952 E.25211
G1 X136.198 Y134.727 E.05888
G1 X139.397 Y134.727 E.1061
G3 X138.385 Y135.898 I-1.008 J.151 E.05827
G1 X125.802 Y135.898 E.4174
G1 X125.802 Y132.952 E.09772
G1 X127.402 Y132.952 E.05307
G1 X127.402 Y123.048 E.32854
G1 X119.802 Y123.048 E.25211
G1 X119.802 Y121.273 E.05888
G1 X116.603 Y121.273 E.1061
G3 X117.615 Y120.102 I1.017 J-.143 E.05812
G1 X130.198 Y120.102 E.4174
G1 X130.198 Y123.048 E.09772
G1 X128.658 Y123.048 E.05108
M204 S250
G1 X128.99 Y123.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X128.99 Y132.56 E.28023
G1 X136.59 Y132.56 E.23353
G1 X136.59 Y134.335 E.05454
G1 X139.79 Y134.335 E.09831
G3 X139.783 Y135.034 I-4.895 J.307 E.02149
G3 X138.395 Y136.29 I-1.388 J-.139 E.06308
G1 X125.41 Y136.29 E.39898
G1 X125.41 Y132.56 E.11461
G1 X127.01 Y132.56 E.04916
G1 X127.01 Y123.44 E.28023
G1 X119.41 Y123.44 E.23353
G1 X119.41 Y121.665 E.05454
G1 X116.21 Y121.665 E.09831
G1 X116.212 Y121.032 E.01945
G3 X117.605 Y119.71 I1.393 J.073 E.0651
G1 X130.59 Y119.71 E.39898
G1 X130.59 Y123.44 E.11461
G1 X129.05 Y123.44 E.04732
; WIPE_START
M204 S6000
G1 X129.037 Y125.44 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.25 Y129.878 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X128.25 Y128.25 E.05401
G1 X127.75 Y127.75 E.02343
G1 X127.75 Y128.25 E.01656
G1 X128.25 Y127.75 E.02343
G1 X128.25 Y122.7 E.16754
G1 X129.85 Y122.7 E.05307
G1 X129.85 Y122.174 E.01745
G1 X128.127 Y120.451 E.0808
G1 X127.873 Y120.451 E.00844
G1 X125.624 Y122.7 E.10547
G1 X122.7 Y122.7 E.09702
G1 X120.455 Y120.455 E.10532
G1 X120.193 Y120.455 E.00867
G1 X119.723 Y120.925 E.02204
G1 X118.095 Y120.925 E.05401
; WIPE_START
G1 X119.723 Y120.925 E-.61876
G1 X119.986 Y120.662 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.933 Y125.446 Z6 F42000
G1 X137.905 Y135.075 Z6
G1 Z5.6
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X136.277 Y135.075 E.05401
G1 X135.802 Y135.55 E.02225
G1 X135.55 Y135.55 E.00838
G1 X133.3 Y133.3 E.10552
G1 X130.376 Y133.3 E.09702
G1 X128.126 Y135.55 E.10552
G1 X127.874 Y135.55 E.00838
G1 X126.15 Y133.826 E.08085
G1 X126.15 Y133.3 E.01745
G1 X127.253 Y133.3 E.03657
; OBJECT_ID: 394
; WIPE_START
G1 X126.15 Y133.3 E-.4189
G1 X126.15 Y133.826 E-.19986
G1 X126.413 Y134.089 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X118.781 Y134.183 Z6 F42000
G1 X97.79 Y134.44 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X103.41 Y134.44 E.17269
G1 X103.41 Y135.66 E.03749
G1 X97.79 Y135.66 E.17269
G1 X97.79 Y134.5 E.03564
; WIPE_START
M204 S6000
G1 X99.79 Y134.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.622 Y126.936 Z6 F42000
G1 X97.79 Y121.56 Z6
G1 Z5.6
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X97.79 Y120.34 E.03749
G1 X103.41 Y120.34 E.17269
G1 X103.41 Y121.56 E.03749
G1 X97.85 Y121.56 E.17084
M204 S10000
G1 X97.398 Y121.56 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.398 Y121.952 E.01301
G1 X100.198 Y121.952 E.09288
G1 X100.198 Y123.073 E.03718
G1 X92.598 Y123.073 E.25211
G1 X92.598 Y132.927 E.32688
G1 X100.198 Y132.927 E.25211
G1 X100.198 Y134.048 E.03718
G1 X97.398 Y134.048 E.09288
G1 X97.398 Y135.898 E.06137
G1 X86.602 Y135.898 E.35812
G1 X86.602 Y134.048 E.06137
G1 X83.802 Y134.048 E.09288
G1 X83.802 Y132.927 E.03718
G1 X91.402 Y132.927 E.25211
G1 X91.402 Y123.073 E.32688
G1 X83.802 Y123.073 E.25211
G1 X83.802 Y121.952 E.03718
G1 X86.602 Y121.952 E.09288
G1 X86.602 Y120.102 E.06136
G1 X97.398 Y120.103 E.35812
G1 X97.398 Y121.5 E.04636
; WIPE_START
G1 X97.398 Y121.952 E-.17179
G1 X98.946 Y121.952 E-.58821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.317 Y121.717 Z6 F42000
G1 X86.21 Y121.56 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X80.59 Y121.56 E.17269
G1 X80.59 Y120.34 E.03749
G1 X86.21 Y120.34 E.17269
G1 X86.21 Y121.5 E.03564
; WIPE_START
M204 S6000
G1 X84.21 Y121.521 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.378 Y129.064 Z6 F42000
G1 X86.21 Y134.44 Z6
G1 Z5.6
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X86.21 Y135.66 E.03749
G1 X80.59 Y135.66 E.17269
G1 X80.59 Y134.44 E.03749
G1 X86.15 Y134.44 E.17084
; WIPE_START
M204 S6000
G1 X86.21 Y135.66 E-.46416
G1 X85.431 Y135.66 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.452 Y129.173 Z6 F42000
G1 X92.99 Y123.465 Z6
G1 Z5.6
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X92.99 Y132.535 E.2787
G1 X100.59 Y132.535 E.23353
G1 X100.59 Y134.31 E.05454
G1 X103.56 Y134.31 E.09126
G1 X103.56 Y133.835 E.0146
G1 X103.79 Y133.835 E.00706
G1 X103.788 Y134.968 E.03482
G3 X102.395 Y136.29 I-1.398 J-.078 E.06504
G1 X81.605 Y136.29 E.6388
G3 X80.21 Y134.895 I.007 J-1.402 E.06725
G1 X80.21 Y133.835 E.03257
G1 X80.44 Y133.835 E.00707
G1 X80.44 Y134.31 E.0146
G1 X83.41 Y134.31 E.09126
G1 X83.41 Y132.535 E.05454
G1 X91.01 Y132.535 E.23353
G1 X91.01 Y123.465 E.2787
G1 X83.41 Y123.465 E.23353
G1 X83.41 Y121.69 E.05454
G1 X80.44 Y121.69 E.09126
G1 X80.44 Y122.165 E.0146
G1 X80.21 Y122.165 E.00706
G1 X80.212 Y121.032 E.03482
G3 X81.605 Y119.71 I1.398 J.078 E.06504
G1 X102.42 Y119.711 E.63957
G3 X103.79 Y121.105 I-.029 J1.399 E.06651
G1 X103.79 Y122.165 E.03256
G1 X103.56 Y122.165 E.00707
G1 X103.56 Y121.69 E.0146
G1 X100.59 Y121.69 E.09126
G1 X100.59 Y123.465 E.05454
G1 X93.05 Y123.465 E.23168
; WIPE_START
M204 S6000
G1 X93.037 Y125.465 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.594 Y120.025 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.27922
G1 F15000
M204 S6000
G1 X102.411 Y120.025 E.09276
G3 X102.725 Y120.05 I-.028 J2.388 E.00606
; LINE_WIDTH: 0.205734
G3 X103.056 Y120.112 I-.838 J5.362 E.00446
; WIPE_START
G1 X102.725 Y120.05 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.159 Y125.272 Z6 F42000
G1 X92.25 Y129.878 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X92.25 Y128.25 E.05401
G1 X91.75 Y127.75 E.02343
G1 X91.75 Y128.25 E.01656
G1 X92.25 Y127.75 E.02343
G1 X92.25 Y126.122 E.05401
; WIPE_START
G1 X92.25 Y127.75 E-.61876
G1 X91.987 Y128.013 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.397 Y121.915 Z6 F42000
G1 X86.95 Y121.322 Z6
G1 Z5.6
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X86.95 Y122.3 E.03245
G1 X86.3 Y122.3 E.02156
G1 X86.725 Y122.725 E.01991
G1 X89.599 Y122.725 E.09536
G1 X91.873 Y120.451 E.10668
G1 X92.127 Y120.451 E.0084
G1 X94.401 Y122.725 E.10668
G1 X97.275 Y122.725 E.09536
G1 X97.7 Y122.3 E.01991
G1 X97.05 Y122.3 E.02156
G1 X97.05 Y121.322 E.03245
; WIPE_START
G1 X97.05 Y122.3 E-.37176
G1 X97.7 Y122.3 E-.247
G1 X97.437 Y122.563 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.999 Y120.852 Z6 F42000
G1 X86.406 Y120.025 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280162
G1 F15000
M204 S6000
G1 X81.613 Y120.025 E.09265
G2 X81.336 Y120.041 I.003 J2.384 E.00537
; LINE_WIDTH: 0.231707
G1 X80.954 Y120.098 E.00594
M204 S10000
G1 X80.946 Y120.12 F42000
; LINE_WIDTH: 0.158543
G1 F15000
M204 S6000
G1 X81.847 Y119.906 E.00873
; WIPE_START
G1 X80.946 Y120.12 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.944 Y127.752 Z6 F42000
G1 X80.942 Y135.889 Z6
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.205574
G1 F15000
M204 S6000
G1 X81.221 Y135.941 E.00376
; LINE_WIDTH: 0.231581
G1 X81.341 Y135.959 E.00187
; LINE_WIDTH: 0.28026
G2 X81.613 Y135.975 I.297 J-2.783 E.00527
G1 X86.406 Y135.975 E.09269
; WIPE_START
G1 X84.406 Y135.975 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.999 Y135.196 Z6 F42000
G1 X97.05 Y134.678 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.05 Y133.7 E.03245
G1 X97.7 Y133.7 E.02156
G1 X97.275 Y133.275 E.01991
G1 X94.401 Y133.275 E.09536
G1 X92.126 Y135.55 E.10669
G1 X91.874 Y135.55 E.00838
G1 X89.599 Y133.275 E.10669
G1 X86.725 Y133.275 E.09536
G1 X86.3 Y133.7 E.01991
G1 X86.95 Y133.7 E.02156
G1 X86.95 Y134.678 E.03245
; WIPE_START
G1 X86.95 Y133.7 E-.37176
G1 X86.3 Y133.7 E-.247
G1 X86.563 Y133.437 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.001 Y135.148 Z6 F42000
G1 X97.594 Y135.975 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279857
G1 F15000
M204 S6000
G1 X102.387 Y135.975 E.09253
G2 X102.713 Y135.952 I-.045 J-2.97 E.00631
; LINE_WIDTH: 0.215145
G1 X103.057 Y135.892 E.0049
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X102.713 Y135.952 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 29/42
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
M106 S196.35
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z6 I.249 J1.191 P1  F42000
G1 X164.598 Y123.023 Z6
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X164.598 Y132.977 E.3302
G1 X172.198 Y132.977 E.25211
G1 X172.198 Y134.777 E.05971
G1 X175.396 Y134.777 E.1061
G3 X174.385 Y135.898 I-1.013 J.102 E.05641
G1 X153.615 Y135.898 E.68899
G3 X152.604 Y134.777 I-.004 J-1.013 E.0565
G1 X155.802 Y134.777 E.1061
G1 X155.802 Y132.977 E.05971
G1 X163.402 Y132.977 E.25211
G1 X163.402 Y123.023 E.3302
G1 X155.802 Y123.023 E.25211
G1 X155.802 Y121.223 E.05971
G1 X152.604 Y121.223 E.1061
G3 X153.608 Y120.102 I1.009 J-.106 E.05624
G1 X174.408 Y120.103 E.68997
G3 X175.403 Y121.223 I-.015 J1.016 E.05591
G1 X172.198 Y121.223 E.10633
G1 X172.198 Y123.023 E.05971
G1 X164.658 Y123.023 E.25012
M204 S250
G1 X164.99 Y123.415 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X164.99 Y132.585 E.28177
G1 X172.59 Y132.585 E.23353
G1 X172.59 Y134.385 E.05531
G1 X173.303 Y134.385 E.02189
G1 X173.31 Y134.185 E.00615
G1 X173.69 Y134.185 E.01169
G1 X173.695 Y134.385 E.00615
G1 X174.503 Y134.385 E.02482
G1 X174.51 Y134.185 E.00615
G1 X174.89 Y134.185 E.01169
G1 X174.895 Y134.385 E.00615
G1 X175.789 Y134.385 E.0275
G3 X175.781 Y135.056 I-4.058 J.282 E.02063
G3 X174.395 Y136.29 I-1.391 J-.166 E.06234
G1 X153.605 Y136.29 E.6388
G3 X152.212 Y134.969 I-.003 J-1.392 E.0651
G1 X152.21 Y134.385 E.01795
G1 X153.103 Y134.385 E.02741
G1 X153.11 Y134.185 E.00615
G1 X153.49 Y134.185 E.01169
G1 X153.495 Y134.385 E.00615
G1 X154.305 Y134.385 E.02491
G1 X154.31 Y134.185 E.00614
G1 X154.69 Y134.186 E.01169
G1 X154.697 Y134.385 E.00613
G1 X155.41 Y134.385 E.02189
G1 X155.41 Y132.585 E.05531
G1 X163.01 Y132.585 E.23353
G1 X163.01 Y123.415 E.28177
G1 X155.41 Y123.415 E.23353
G1 X155.41 Y121.615 E.05531
G1 X154.697 Y121.615 E.02189
G1 X154.69 Y121.815 E.00615
G1 X154.31 Y121.815 E.01169
G1 X154.305 Y121.615 E.00615
G1 X153.497 Y121.615 E.02482
G1 X153.49 Y121.815 E.00615
G1 X153.11 Y121.815 E.01169
G1 X153.105 Y121.615 E.00615
G1 X152.21 Y121.615 E.02749
G3 X152.219 Y120.944 I4.056 J-.282 E.02063
M73 P71 R7
G3 X153.603 Y119.71 I1.391 J.166 E.06227
G1 X174.418 Y119.711 E.63959
G3 X175.79 Y121.105 I-.018 J1.39 E.06668
G1 X175.79 Y121.615 E.01566
G1 X174.897 Y121.615 E.02742
G1 X174.89 Y121.815 E.00615
G1 X174.51 Y121.815 E.01169
G1 X174.505 Y121.615 E.00615
G1 X173.695 Y121.615 E.02491
G1 X173.69 Y121.815 E.00614
G1 X173.31 Y121.814 E.01169
G1 X173.303 Y121.615 E.00613
G1 X172.59 Y121.615 E.02189
G1 X172.59 Y123.415 E.05531
G1 X165.05 Y123.415 E.23168
; WIPE_START
M204 S6000
G1 X165.037 Y125.415 E-.76
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
G1 X164.25 Y126.122 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X164.25 Y127.75 E.05401
G1 X163.75 Y128.25 E.02343
G1 X163.75 Y127.75 E.01656
G1 X164.25 Y128.25 E.02343
G1 X164.25 Y129.878 E.05401
; WIPE_START
G1 X164.25 Y128.25 E-.61876
G1 X163.987 Y127.987 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.808 Y132.468 Z6.2 F42000
G1 X154.145 Y135.125 Z6.2
G1 Z5.8
G1 E.8 F1800
M73 P71 R6
G1 F8843.478
M204 S6000
G1 X155.773 Y135.125 E.05401
G1 X156.198 Y135.55 E.01991
G1 X156.45 Y135.55 E.00838
G1 X158.675 Y133.325 E.10435
G1 X161.649 Y133.325 E.09868
G1 X163.874 Y135.55 E.10435
G1 X164.126 Y135.55 E.00838
G1 X166.351 Y133.325 E.10435
G1 X169.325 Y133.325 E.09868
G1 X171.55 Y135.55 E.10435
G1 X171.802 Y135.55 E.00838
G1 X172.227 Y135.125 E.01991
G1 X173.855 Y135.125 E.05401
; WIPE_START
G1 X172.227 Y135.125 E-.61876
G1 X171.964 Y135.388 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X172.95 Y127.82 Z6.2 F42000
G1 X173.855 Y120.875 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X172.227 Y120.875 E.05401
G1 X171.803 Y120.451 E.01988
G1 X171.549 Y120.451 E.00841
G1 X169.325 Y122.675 E.10433
G1 X166.351 Y122.675 E.09868
G1 X164.127 Y120.451 E.10433
G1 X163.873 Y120.451 E.0084
G1 X161.649 Y122.675 E.10434
G1 X158.675 Y122.675 E.09868
G1 X156.45 Y120.45 E.10435
G1 X156.198 Y120.45 E.00838
G1 X155.773 Y120.875 E.0199
G1 X154.145 Y120.875 E.05401
; OBJECT_ID: 405
; WIPE_START
G1 X155.773 Y120.875 E-.61876
G1 X156.036 Y120.612 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X148.434 Y121.287 Z6.2 F42000
G1 X128.598 Y123.048 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X128.598 Y132.952 E.32854
G1 X136.198 Y132.952 E.25211
G1 X136.198 Y134.727 E.05888
G1 X139.397 Y134.727 E.1061
G3 X138.385 Y135.898 I-1.007 J.153 E.0583
G1 X125.802 Y135.898 E.4174
G1 X125.802 Y132.952 E.09772
G1 X127.402 Y132.952 E.05307
G1 X127.402 Y123.048 E.32854
G1 X119.802 Y123.048 E.25211
G1 X119.802 Y121.273 E.05888
G1 X116.603 Y121.273 E.1061
G3 X117.615 Y120.102 I1.011 J-.149 E.05822
G1 X130.198 Y120.102 E.4174
G1 X130.198 Y123.048 E.09772
G1 X128.658 Y123.048 E.05108
M204 S250
G1 X128.99 Y123.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X128.99 Y132.56 E.28023
G1 X136.59 Y132.56 E.23353
G1 X136.59 Y134.335 E.05454
G1 X139.79 Y134.335 E.09831
G3 X139.781 Y135.056 I-4.352 J.307 E.02217
G3 X138.395 Y136.29 I-1.385 J-.159 E.06241
G1 X125.41 Y136.29 E.39898
G1 X125.41 Y132.56 E.11461
G1 X127.01 Y132.56 E.04916
G1 X127.01 Y123.44 E.28023
G1 X119.41 Y123.44 E.23353
G1 X119.41 Y121.665 E.05454
G1 X116.21 Y121.665 E.09831
G3 X116.219 Y120.944 I4.35 J-.307 E.02217
G3 X117.605 Y119.71 I1.393 J.169 E.06232
G1 X130.59 Y119.71 E.39898
G1 X130.59 Y123.44 E.11461
G1 X129.05 Y123.44 E.04732
; WIPE_START
M204 S6000
G1 X129.037 Y125.44 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.347 Y132.883 Z6.2 F42000
G1 X127.253 Y133.3 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X126.15 Y133.3 E.03657
G1 X126.15 Y133.826 E.01745
G1 X127.874 Y135.55 E.08085
G1 X128.126 Y135.55 E.00838
G1 X130.376 Y133.3 E.10552
G1 X133.3 Y133.3 E.09702
G1 X135.55 Y135.55 E.10552
G1 X135.802 Y135.55 E.00838
G1 X136.277 Y135.075 E.02225
G1 X137.905 Y135.075 E.05401
; WIPE_START
G1 X136.277 Y135.075 E-.61876
G1 X136.014 Y135.338 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.067 Y130.554 Z6.2 F42000
G1 X118.095 Y120.925 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X119.723 Y120.925 E.05401
G1 X120.193 Y120.455 E.02205
G1 X120.455 Y120.455 E.00866
G1 X122.7 Y122.7 E.10532
G1 X125.624 Y122.7 E.09702
G1 X127.873 Y120.451 E.10547
G1 X128.127 Y120.451 E.00844
G1 X129.85 Y122.174 E.08081
G1 X129.85 Y122.7 E.01745
G1 X128.25 Y122.7 E.05307
G1 X128.25 Y127.75 E.16754
G1 X127.75 Y128.25 E.02343
G1 X127.75 Y127.75 E.01656
G1 X128.25 Y128.25 E.02343
G1 X128.25 Y129.878 E.05401
; OBJECT_ID: 394
; WIPE_START
G1 X128.25 Y128.25 E-.61876
G1 X127.987 Y127.987 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X120.523 Y129.582 Z6.2 F42000
G1 X97.79 Y134.44 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X103.41 Y134.44 E.17269
G1 X103.41 Y135.66 E.03749
G1 X97.79 Y135.66 E.17269
G1 X97.79 Y134.5 E.03564
; WIPE_START
M204 S6000
G1 X99.79 Y134.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.118 Y134.048 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.398 Y134.048 E.09024
G1 X97.398 Y135.898 E.06137
G1 X86.602 Y135.898 E.35812
G1 X86.602 Y134.048 E.06137
G1 X83.802 Y134.048 E.09288
G1 X83.802 Y133.307 E.02456
G1 X83.802 Y132.907 E.01327
G1 F4919.51
G1 X83.802 Y132.507 E.01327
M106 S255
G1 F1800
G1 X83.802 Y132.125 E.01269
M106 S196.35
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X83.802 Y123.875 E.27367
M106 S196.35
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X83.802 Y123.492 E.01269
M106 S196.35
G1 F4919.51
G1 X83.802 Y123.092 E.01327
G1 F8843.478
G1 X83.802 Y122.692 E.01327
G1 X83.802 Y121.952 E.02456
G1 X86.602 Y121.952 E.09288
G1 X86.602 Y120.102 E.06136
G1 X97.398 Y120.102 E.35812
G1 X97.398 Y121.952 E.06135
G1 X100.198 Y121.952 E.09288
G1 X100.198 Y122.692 E.02456
G1 X100.198 Y123.092 E.01327
G1 F4919.51
G1 X100.198 Y123.492 E.01327
M106 S255
G1 F1800
G1 X100.198 Y123.875 E.01269
M106 S196.35
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X100.198 Y132.125 E.27367
M106 S196.35
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X100.198 Y132.507 E.01269
M106 S196.35
G1 F4919.51
G1 X100.198 Y132.907 E.01327
G1 F8843.478
G1 X100.198 Y133.307 E.01327
G1 X100.198 Y134.048 E.02456
G1 X100.178 Y134.048 E.00065
; WIPE_START
G1 X98.178 Y134.048 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.2 I1.216 J-.038 P1  F42000
G1 X97.79 Y121.56 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X97.79 Y120.34 E.03749
G1 X103.41 Y120.34 E.17269
G1 X103.41 Y121.56 E.03749
G1 X97.85 Y121.56 E.17084
; WIPE_START
M204 S6000
G1 X97.79 Y120.34 E-.46416
G1 X98.569 Y120.34 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.973 Y121.09 Z6.2 F42000
G1 X86.21 Y121.56 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X80.59 Y121.56 E.17269
G1 X80.59 Y120.34 E.03749
G1 X86.21 Y120.34 E.17269
G1 X86.21 Y121.5 E.03564
; WIPE_START
M204 S6000
G1 X84.21 Y121.521 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.2 I-1.203 J.186 P1  F42000
G1 X86.21 Y134.44 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X86.21 Y135.66 E.03749
G1 X80.59 Y135.66 E.17269
G1 X80.59 Y134.44 E.03749
G1 X86.15 Y134.44 E.17084
; WIPE_START
M204 S6000
G1 X86.21 Y135.66 E-.46416
G1 X85.431 Y135.66 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.034 Y134.983 Z6.2 F42000
G1 X100.59 Y134.31 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X103.56 Y134.31 E.09126
G1 X103.56 Y133.835 E.0146
G1 X103.79 Y133.835 E.00706
G1 X103.788 Y134.968 E.03482
G3 X102.395 Y136.29 I-1.4 J-.081 E.06501
G1 X81.605 Y136.29 E.6388
G3 X80.21 Y134.897 I.004 J-1.4 E.06722
G1 X80.21 Y133.835 E.03264
G1 X80.44 Y133.835 E.00707
G1 X80.44 Y134.31 E.0146
G1 X83.41 Y134.31 E.09126
G1 X83.41 Y133.294 E.03122
G1 X83.41 Y132.894 E.01229
G1 F4919.51
G1 X83.41 Y132.494 E.01229
M106 S255
G1 F1800
G1 X83.41 Y132.125 E.01134
M106 S196.35
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X83.41 Y123.875 E.27367
M106 S196.35
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X83.41 Y123.506 E.01134
M106 S196.35
G1 F4919.51
G1 X83.41 Y123.106 E.01229
G1 F9547.055
G1 X83.41 Y122.706 E.01229
G1 X83.41 Y121.69 E.03122
G1 X80.44 Y121.69 E.09126
G1 X80.44 Y122.165 E.0146
G1 X80.21 Y122.165 E.00706
G1 X80.212 Y121.032 E.03482
G3 X81.603 Y119.71 I1.4 J.081 E.06493
G1 X102.418 Y119.711 E.63959
G3 X103.79 Y121.105 I-.018 J1.39 E.06668
G1 X103.79 Y122.165 E.03256
G1 X103.56 Y122.165 E.00707
G1 X103.56 Y121.69 E.0146
G1 X100.59 Y121.69 E.09126
G1 X100.59 Y122.706 E.03122
G1 X100.59 Y123.106 E.01229
G1 F4919.51
G1 X100.59 Y123.506 E.01229
M106 S255
G1 F1800
G1 X100.59 Y123.875 E.01134
M106 S196.35
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X100.59 Y132.125 E.27367
M106 S196.35
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X100.59 Y132.494 E.01134
M106 S196.35
G1 F4919.51
G1 X100.59 Y132.894 E.01229
G1 F9547.055
G1 X100.59 Y133.294 E.01229
G1 X100.59 Y134.25 E.02938
; WIPE_START
M204 S6000
G1 X102.59 Y134.29 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.861 Y133.132 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.42687
M106 S255
G1 F3000
M204 S6000
G1 X99.861 Y123.038 E.31583
G1 X99.477 Y123.038 E.01201
G1 X99.477 Y132.962 E.31052
G1 X99.093 Y132.962 E.01201
G1 X99.093 Y123.038 E.31052
G1 X98.709 Y123.038 E.01201
G1 X98.709 Y132.962 E.31052
G1 X98.325 Y132.962 E.01201
G1 X98.325 Y123.038 E.31052
G1 X97.941 Y123.038 E.01201
G1 X97.941 Y132.962 E.31052
G1 X97.557 Y132.962 E.01201
G1 X97.557 Y123.038 E.31052
G1 X97.174 Y123.038 E.01201
G1 X97.174 Y132.962 E.31052
G1 X96.79 Y132.962 E.01201
G1 X96.79 Y123.038 E.31052
G1 X96.406 Y123.038 E.01201
G1 X96.406 Y132.962 E.31052
G1 X96.022 Y132.962 E.01201
G1 X96.022 Y123.038 E.31052
G1 X95.638 Y123.038 E.01201
G1 X95.638 Y132.962 E.31052
G1 X95.254 Y132.962 E.01201
G1 X95.254 Y123.038 E.31052
G1 X94.87 Y123.038 E.01201
G1 X94.87 Y132.962 E.31052
G1 X94.486 Y132.962 E.01201
G1 X94.486 Y123.038 E.31052
G1 X94.102 Y123.038 E.01201
G1 X94.102 Y132.962 E.31052
G1 X93.718 Y132.962 E.01201
G1 X93.718 Y123.038 E.31052
G1 X93.334 Y123.038 E.01201
G1 X93.334 Y132.962 E.31052
G1 X92.95 Y132.962 E.01201
G1 X92.95 Y123.038 E.31052
G1 X92.566 Y123.045 E.01202
G1 X92.566 Y133.132 E.31559
M106 S196.35
; WIPE_START
G1 X92.566 Y131.132 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.594 Y135.975 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280782
G1 F15000
M204 S6000
G1 X102.512 Y135.972 E.09532
; LINE_WIDTH: 0.254893
G2 X102.732 Y135.949 I-.198 J-2.97 E.00383
; LINE_WIDTH: 0.212233
G1 X103.057 Y135.892 E.00454
; WIPE_START
G1 X102.732 Y135.949 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.2 I.825 J-.894 P1  F42000
G1 X92.17 Y126.201 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X92.17 Y127.83 E.05401
G1 X91.83 Y128.17 E.01599
G1 X91.83 Y127.83 E.0113
G1 X92.17 Y128.17 E.01599
G1 X92.17 Y129.799 E.05401
M204 S10000
G1 X91.434 Y122.868 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.42687
M106 S255
G1 F3000
M204 S6000
G1 X91.434 Y132.955 E.31559
G1 X91.05 Y132.962 E.01202
G1 X91.05 Y123.038 E.31052
G1 X90.666 Y123.038 E.01201
G1 X90.666 Y132.962 E.31052
G1 X90.282 Y132.962 E.01201
G1 X90.282 Y123.038 E.31052
G1 X89.898 Y123.038 E.01201
G1 X89.898 Y132.962 E.31052
G1 X89.514 Y132.962 E.01201
G1 X89.514 Y123.038 E.31052
G1 X89.13 Y123.038 E.01201
G1 X89.13 Y132.962 E.31052
G1 X88.746 Y132.962 E.01201
G1 X88.746 Y123.038 E.31052
G1 X88.362 Y123.038 E.01201
G1 X88.362 Y132.962 E.31052
G1 X87.978 Y132.962 E.01201
G1 X87.978 Y123.038 E.31052
G1 X87.594 Y123.038 E.01201
G1 X87.594 Y132.962 E.31052
M73 P72 R6
G1 X87.21 Y132.962 E.01201
G1 X87.21 Y123.038 E.31052
G1 X86.826 Y123.038 E.01201
G1 X86.826 Y132.962 E.31052
G1 X86.443 Y132.962 E.01201
G1 X86.443 Y123.038 E.31052
G1 X86.059 Y123.038 E.01201
G1 X86.059 Y132.962 E.31052
G1 X85.675 Y132.962 E.01201
G1 X85.675 Y123.038 E.31052
G1 X85.291 Y123.038 E.01201
G1 X85.291 Y132.962 E.31052
G1 X84.907 Y132.962 E.01201
G1 X84.907 Y123.038 E.31052
G1 X84.523 Y123.038 E.01201
G1 X84.523 Y132.962 E.31052
G1 X84.139 Y132.962 E.01201
G1 X84.139 Y122.868 E.31583
M106 S196.35
; WIPE_START
G1 X84.139 Y124.868 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.406 Y120.025 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279445
G1 F15000
M204 S6000
G1 X81.552 Y120.026 E.09355
G2 X81.334 Y120.042 I.054 J2.235 E.00423
; LINE_WIDTH: 0.233728
G1 X81.241 Y120.055 E.00146
; LINE_WIDTH: 0.208444
G1 X80.944 Y120.109 E.00407
; WIPE_START
G1 X81.241 Y120.055 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.2 I-1.134 J.443 P1  F42000
G1 X86.95 Y134.678 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X86.95 Y133.7 E.03245
G1 X86.3 Y133.7 E.02156
G1 X86.645 Y133.355 E.01619
G1 X89.679 Y133.355 E.10062
G1 X91.874 Y135.55 E.10298
G1 X92.126 Y135.55 E.00838
G1 X94.321 Y133.355 E.10298
G1 X97.355 Y133.355 E.10062
G1 X97.7 Y133.7 E.01619
G1 X97.05 Y133.7 E.02156
G1 X97.05 Y134.678 E.03245
; WIPE_START
G1 X97.05 Y133.7 E-.37176
G1 X97.7 Y133.7 E-.247
G1 X97.437 Y133.437 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.999 Y135.148 Z6.2 F42000
G1 X86.406 Y135.975 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280261
G1 F15000
M204 S6000
G1 X81.613 Y135.975 E.09269
G3 X81.341 Y135.959 I.025 J-2.799 E.00527
; LINE_WIDTH: 0.23156
G1 X81.221 Y135.941 E.00187
; LINE_WIDTH: 0.20556
G1 X80.942 Y135.89 E.00376
; WIPE_START
G1 X81.221 Y135.941 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.2 I.826 J.894 P1  F42000
G1 X97.05 Y121.322 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.05 Y122.3 E.03245
G1 X97.7 Y122.3 E.02156
G1 X97.355 Y122.645 E.01619
G1 X94.321 Y122.645 E.10062
G1 X92.127 Y120.451 E.10296
G1 X91.873 Y120.451 E.0084
G1 X89.679 Y122.645 E.10296
G1 X86.645 Y122.645 E.10062
G1 X86.3 Y122.3 E.01619
G1 X86.95 Y122.3 E.02156
G1 X86.95 Y121.322 E.03245
; WIPE_START
G1 X86.95 Y122.3 E-.37176
G1 X86.3 Y122.3 E-.247
G1 X86.563 Y122.563 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.001 Y120.852 Z6.2 F42000
G1 X97.594 Y120.025 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279802
G1 F15000
M204 S6000
G1 X102.408 Y120.025 E.09293
G3 X102.65 Y120.04 I-.005 J2.084 E.00468
; LINE_WIDTH: 0.233631
G1 X102.772 Y120.057 E.00191
; LINE_WIDTH: 0.202838
G1 X103.056 Y120.112 E.00377
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X102.772 Y120.057 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 30/42
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
M106 S183.6
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z6.2 I-.027 J1.217 P1  F42000
G1 X155.802 Y121.223 Z6.2
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X152.603 Y121.223 E.1061
G3 X153.614 Y120.102 I1.005 J-.11 E.05651
G1 X174.406 Y120.103 E.6897
G3 X175.403 Y121.223 I-.013 J1.016 E.05598
G1 X172.198 Y121.223 E.10633
G1 X172.198 Y122.642 E.04709
G1 X172.198 Y123.042 E.01327
G1 F4919.51
G1 X172.198 Y123.442 E.01327
M106 S255
G1 F1800
G1 X172.198 Y123.825 E.01269
M106 S183.6
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X172.198 Y132.175 E.27698
M106 S183.6
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X172.198 Y132.557 E.01269
M106 S183.6
G1 F4919.51
G1 X172.198 Y132.957 E.01327
G1 F8843.478
G1 X172.198 Y133.357 E.01327
G1 X172.198 Y134.777 E.04709
G1 X175.397 Y134.777 E.1061
G3 X174.385 Y135.898 I-1.007 J.108 E.05651
G1 X153.615 Y135.898 E.68899
G3 X152.604 Y134.777 I-.007 J-1.011 E.05655
G1 X155.802 Y134.777 E.1061
G1 X155.802 Y133.357 E.04709
G1 X155.802 Y132.957 E.01327
G1 F4919.51
G1 X155.802 Y132.557 E.01327
M106 S255
G1 F1800
G1 X155.802 Y132.175 E.01269
M106 S183.6
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X155.802 Y123.825 E.27698
M106 S183.6
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X155.802 Y123.442 E.01269
M106 S183.6
G1 F4919.51
G1 X155.802 Y123.042 E.01327
G1 F8843.478
G1 X155.802 Y122.642 E.01327
G1 X155.802 Y121.283 E.0451
M204 S250
G1 X155.41 Y121.615 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X154.697 Y121.615 E.02189
G1 X154.69 Y121.815 E.00615
G1 X154.31 Y121.815 E.01169
G1 X154.305 Y121.615 E.00615
G1 X153.497 Y121.615 E.02482
G1 X153.49 Y121.815 E.00615
G1 X153.11 Y121.815 E.01169
G1 X153.105 Y121.615 E.00615
G1 X152.21 Y121.615 E.02749
G3 X152.217 Y120.965 I4.553 J-.282 E.02
G3 X153.605 Y119.71 I1.388 J.141 E.06303
G1 X174.416 Y119.711 E.63946
G3 X175.79 Y121.105 I-.016 J1.39 E.06675
G1 X175.79 Y121.615 E.01566
G1 X174.897 Y121.615 E.02742
G1 X174.89 Y121.815 E.00615
G1 X174.51 Y121.815 E.01169
G1 X174.505 Y121.615 E.00615
G1 X173.695 Y121.615 E.02491
G1 X173.69 Y121.815 E.00614
G1 X173.31 Y121.814 E.01169
G1 X173.303 Y121.615 E.00613
G1 X172.59 Y121.615 E.02189
G1 X172.59 Y122.656 E.03199
G1 X172.59 Y123.056 E.01229
G1 F4919.51
G1 X172.59 Y123.456 E.01229
M106 S255
G1 F1800
G1 X172.59 Y123.825 E.01134
M106 S183.6
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X172.59 Y132.175 E.27698
M106 S183.6
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X172.59 Y132.544 E.01134
M106 S183.6
G1 F4919.51
G1 X172.59 Y132.944 E.01229
G1 F9547.055
G1 X172.59 Y133.344 E.01229
G1 X172.59 Y134.385 E.03199
G1 X173.302 Y134.385 E.02189
G1 X173.31 Y134.185 E.00615
G1 X173.69 Y134.185 E.01169
G1 X173.695 Y134.385 E.00615
G1 X174.502 Y134.385 E.02482
G1 X174.51 Y134.185 E.00615
G1 X174.89 Y134.185 E.01169
G1 X174.895 Y134.385 E.00615
G1 X175.789 Y134.385 E.0275
G3 X175.783 Y135.034 I-4.555 J.282 E.01995
G3 X174.395 Y136.29 I-1.393 J-.145 E.06302
G1 X153.605 Y136.29 E.6388
G3 X152.212 Y134.969 I.012 J-1.409 E.06491
G1 X152.21 Y134.385 E.01795
G1 X153.102 Y134.385 E.02741
G1 X153.11 Y134.185 E.00615
G1 X153.49 Y134.185 E.01169
G1 X153.495 Y134.385 E.00615
G1 X154.305 Y134.385 E.02491
G1 X154.31 Y134.185 E.00614
G1 X154.69 Y134.186 E.01169
G1 X154.697 Y134.385 E.00613
G1 X155.41 Y134.385 E.02189
G1 X155.41 Y133.344 E.03199
G1 X155.41 Y132.944 E.01229
G1 F4919.51
G1 X155.41 Y132.544 E.01229
M106 S255
G1 F1800
G1 X155.41 Y132.175 E.01134
M106 S183.6
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X155.41 Y123.825 E.27698
M106 S183.6
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X155.41 Y123.456 E.01134
M106 S183.6
G1 F4919.51
G1 X155.41 Y123.056 E.01229
G1 F9547.055
G1 X155.41 Y122.656 E.01229
G1 X155.41 Y121.675 E.03014
; WIPE_START
M204 S6000
G1 X154.697 Y121.615 E-.27171
G1 X154.69 Y121.815 E-.07605
G1 X154.31 Y121.815 E-.14456
G1 X154.305 Y121.615 E-.07602
G1 X153.801 Y121.615 E-.19166
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
G1 X154.145 Y120.875 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X155.773 Y120.875 E.05401
G1 X156.198 Y120.45 E.0199
G1 X156.45 Y120.45 E.00838
G1 X158.595 Y122.595 E.10063
G1 X161.729 Y122.595 E.10394
G1 X163.873 Y120.451 E.10062
G1 X164.127 Y120.451 E.0084
G1 X166.271 Y122.595 E.10062
G1 X169.405 Y122.595 E.10394
G1 X171.549 Y120.451 E.10061
G1 X171.803 Y120.451 E.00841
G1 X172.227 Y120.875 E.01989
G1 X173.855 Y120.875 E.05401
M204 S10000
G1 X156.139 Y122.818 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.42687
M106 S255
G1 F3000
M204 S6000
G1 X156.139 Y133.012 E.31896
G1 X156.523 Y133.012 E.01201
G1 X156.523 Y122.988 E.31365
G1 X156.907 Y122.988 E.01201
G1 X156.907 Y133.012 E.31365
G1 X157.291 Y133.012 E.01201
G1 X157.291 Y122.988 E.31365
G1 X157.675 Y122.988 E.01201
G1 X157.675 Y133.012 E.31365
G1 X158.059 Y133.012 E.01201
G1 X158.059 Y122.988 E.31365
G1 X158.443 Y122.988 E.01201
G1 X158.443 Y133.012 E.31365
G1 X158.826 Y133.012 E.01201
G1 X158.826 Y122.988 E.31365
G1 X159.21 Y122.988 E.01201
G1 X159.21 Y133.012 E.31365
G1 X159.594 Y133.012 E.01201
G1 X159.594 Y122.988 E.31365
G1 X159.978 Y122.988 E.01201
G1 X159.978 Y133.012 E.31365
G1 X160.362 Y133.012 E.01201
G1 X160.362 Y122.988 E.31365
G1 X160.746 Y122.988 E.01201
G1 X160.746 Y133.012 E.31365
G1 X161.13 Y133.012 E.01201
G1 X161.13 Y122.988 E.31365
G1 X161.514 Y122.988 E.01201
G1 X161.514 Y133.012 E.31365
G1 X161.898 Y133.012 E.01201
G1 X161.898 Y122.988 E.31365
G1 X162.282 Y122.988 E.01201
G1 X162.282 Y133.012 E.31365
G1 X162.666 Y133.012 E.01201
G1 X162.666 Y122.988 E.31365
G1 X163.05 Y122.988 E.01201
G1 X163.05 Y133.012 E.31365
G1 X163.434 Y133.005 E.01202
G1 X163.434 Y122.818 E.31872
M106 S183.6
M204 S10000
G1 X163.83 Y126.201 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X163.83 Y127.83 E.05401
G1 X164.17 Y128.17 E.01599
G1 X164.17 Y127.83 E.01131
G1 X163.83 Y128.17 E.01599
G1 X163.83 Y129.799 E.05401
M204 S10000
G1 X164.566 Y133.182 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.42687
M106 S255
G1 F3000
M204 S6000
G1 X164.566 Y122.995 E.31872
G1 X164.95 Y122.988 E.01202
G1 X164.95 Y133.012 E.31365
G1 X165.334 Y133.012 E.01201
G1 X165.334 Y122.988 E.31365
G1 X165.718 Y122.988 E.01201
G1 X165.718 Y133.012 E.31365
G1 X166.102 Y133.012 E.01201
G1 X166.102 Y122.988 E.31365
G1 X166.486 Y122.988 E.01201
G1 X166.486 Y133.012 E.31365
M73 P73 R6
G1 X166.87 Y133.012 E.01201
G1 X166.87 Y122.988 E.31365
G1 X167.254 Y122.988 E.01201
G1 X167.254 Y133.012 E.31365
G1 X167.638 Y133.012 E.01201
G1 X167.638 Y122.988 E.31365
G1 X168.022 Y122.988 E.01201
G1 X168.022 Y133.012 E.31365
G1 X168.406 Y133.012 E.01201
G1 X168.406 Y122.988 E.31365
G1 X168.79 Y122.988 E.01201
G1 X168.79 Y133.012 E.31365
G1 X169.174 Y133.012 E.01201
G1 X169.174 Y122.988 E.31365
G1 X169.557 Y122.988 E.01201
G1 X169.557 Y133.012 E.31365
G1 X169.941 Y133.012 E.01201
G1 X169.941 Y122.988 E.31365
G1 X170.325 Y122.988 E.01201
G1 X170.325 Y133.012 E.31365
G1 X170.709 Y133.012 E.01201
G1 X170.709 Y122.988 E.31365
G1 X171.093 Y122.988 E.01201
G1 X171.093 Y133.012 E.31365
G1 X171.477 Y133.012 E.01201
G1 X171.477 Y122.988 E.31365
G1 X171.861 Y122.988 E.01201
G1 X171.861 Y133.182 E.31896
M106 S183.6
; WIPE_START
G1 X171.861 Y131.182 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X173.855 Y135.125 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X172.227 Y135.125 E.05401
G1 X171.802 Y135.55 E.01991
G1 X171.55 Y135.55 E.00838
G1 X169.405 Y133.405 E.10063
G1 X166.271 Y133.405 E.10394
G1 X164.126 Y135.55 E.10063
G1 X163.874 Y135.55 E.00838
G1 X161.729 Y133.405 E.10063
G1 X158.595 Y133.405 E.10394
G1 X156.45 Y135.55 E.10063
G1 X156.198 Y135.55 E.00838
G1 X155.773 Y135.125 E.01991
G1 X154.145 Y135.125 E.05401
; OBJECT_ID: 405
; WIPE_START
G1 X155.773 Y135.125 E-.61876
G1 X156.036 Y135.388 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X148.924 Y132.618 Z6.4 F42000
G1 X119.802 Y121.273 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X116.602 Y121.273 E.10615
G3 X117.544 Y120.104 I1.02 J-.142 E.05579
G1 X129.818 Y120.103 E.40714
G1 X130.217 Y120.103 E.01327
G1 F5116.629
G1 X130.617 Y120.103 E.01327
G1 F1920
G1 X131 Y120.103 E.01269
; FEATURE: Overhang wall
M106 S255
G1 F600
M204 S5000
G1 X136.198 Y120.102 E.17243
G1 X136.198 Y132.15 E.39965
M106 S183.6
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X136.198 Y132.532 E.01269
M106 S183.6
G1 F4919.51
G1 X136.198 Y132.932 E.01327
G1 F8843.478
G1 X136.198 Y133.332 E.01327
G1 X136.198 Y134.727 E.04626
G1 X139.398 Y134.727 E.10615
G3 X138.456 Y135.896 I-1.015 J.146 E.05587
G1 X126.182 Y135.897 E.40714
G1 X125.782 Y135.897 E.01327
G1 F4919.51
G1 X125.382 Y135.897 E.01327
M106 S255
G1 F1800
G1 X125 Y135.897 E.01269
M106 S183.6
; FEATURE: Overhang wall
M106 S255
G1 F600
M204 S5000
G1 X119.802 Y135.898 E.17243
G1 X119.802 Y123.85 E.39965
M106 S183.6
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X119.802 Y123.467 E.01269
M106 S183.6
G1 F4919.51
G1 X119.802 Y123.067 E.01327
G1 F8843.478
G1 X119.802 Y122.667 E.01327
G1 X119.802 Y121.333 E.04427
M204 S250
G1 X119.41 Y121.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X116.21 Y121.665 E.09833
G3 X116.252 Y120.762 I3.703 J-.28 E.02783
G3 X117.53 Y119.712 I1.36 J.352 E.05434
G1 X129.831 Y119.711 E.37799
G1 X130.231 Y119.711 E.01229
G1 F5116.629
G1 X130.631 Y119.711 E.01229
G1 F1920
G1 X131 Y119.711 E.01134
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
G1 X136.59 Y119.71 E.18543
G1 X136.59 Y132.15 E.41266
M106 S183.6
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X136.59 Y132.519 E.01134
M106 S183.6
G1 F4919.51
G1 X136.59 Y132.919 E.01229
G1 F9547.055
G1 X136.59 Y133.319 E.01229
G1 X136.59 Y134.335 E.03122
G1 X139.79 Y134.335 E.09833
G3 X139.73 Y135.304 I-3.323 J.28 E.02993
G3 X138.471 Y136.288 I-1.343 J-.42 E.05224
G1 X126.169 Y136.289 E.37799
G1 X125.769 Y136.289 E.01229
G1 F4919.51
G1 X125.369 Y136.289 E.01229
M106 S255
G1 F1800
G1 X125 Y136.289 E.01134
M106 S183.6
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
G1 X119.41 Y136.29 E.18543
G1 X119.41 Y123.85 E.41266
M106 S183.6
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X119.41 Y123.481 E.01134
M106 S183.6
G1 F4919.51
G1 X119.41 Y123.081 E.01229
G1 F9547.055
G1 X119.41 Y122.681 E.01229
G1 X119.41 Y121.725 E.02938
; WIPE_START
M204 S6000
G1 X117.41 Y121.688 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.139 Y122.843 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.42687
M106 S255
G1 F3000
M204 S6000
G1 X120.139 Y135.565 E.39803
G1 X120.523 Y135.565 E.01201
G1 X120.523 Y123.013 E.39272
G1 X120.907 Y123.013 E.01201
G1 X120.907 Y135.565 E.39271
G1 X121.291 Y135.564 E.01201
G1 X121.291 Y123.013 E.39271
G1 X121.675 Y123.013 E.01201
G1 X121.675 Y135.564 E.39271
G1 X122.059 Y135.564 E.01201
G1 X122.059 Y123.013 E.39271
G1 X122.443 Y123.013 E.01201
G1 X122.443 Y135.564 E.39271
G1 X122.826 Y135.564 E.01201
G1 X122.826 Y123.013 E.39271
G1 X123.21 Y123.013 E.01201
G1 X123.21 Y135.564 E.39271
G1 X123.594 Y135.564 E.01201
G1 X123.594 Y123.013 E.39271
G1 X123.978 Y123.013 E.01201
G1 X123.978 Y135.564 E.3927
G1 X124.362 Y135.564 E.01201
G1 X124.362 Y123.013 E.3927
G1 X124.746 Y123.013 E.01201
G1 X124.746 Y135.564 E.3927
G1 X125.13 Y135.564 E.01201
G1 X125.13 Y123.013 E.3927
G1 X125.514 Y123.013 E.01201
G1 X125.514 Y135.564 E.3927
M73 P74 R6
G1 X125.837 Y135.564 E.01012
G1 X125.837 Y133.191 E.07426
G1 X125.898 Y133.13 E.00268
G1 X125.898 Y123.013 E.31655
G1 X126.282 Y123.013 E.01201
G1 X126.282 Y132.987 E.31209
G1 X126.666 Y132.987 E.01201
G1 X126.666 Y123.013 E.31209
G1 X127.05 Y123.013 E.01201
G1 X127.05 Y132.987 E.31209
G1 X127.426 Y132.987 E.01177
G1 X127.434 Y122.843 E.31739
M106 S183.6
M204 S10000
G1 X128.17 Y129.799 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X128.17 Y128.17 E.05401
G1 X127.83 Y127.83 E.01599
G1 X127.83 Y128.17 E.0113
G1 X128.17 Y127.83 E.01599
G1 X128.17 Y122.861 E.1648
G1 X128.411 Y122.62 E.01131
G1 X129.77 Y122.62 E.04508
G1 X129.77 Y122.094 E.01745
G1 X128.127 Y120.451 E.07709
G1 X127.873 Y120.451 E.00844
G1 X125.704 Y122.62 E.10176
G1 X122.62 Y122.62 E.10228
G1 X120.452 Y120.452 E.10173
G1 X120.196 Y120.452 E.00849
G1 X119.723 Y120.925 E.02218
G1 X118.095 Y120.925 E.05401
; WIPE_START
G1 X119.723 Y120.925 E-.61876
G1 X119.986 Y120.662 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.4 I-1.003 J.689 P1  F42000
G1 X128.566 Y133.157 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.42687
M106 S255
G1 F3000
M204 S6000
G1 X128.574 Y123.013 E.31739
G1 X128.95 Y123.013 E.01177
G1 X128.95 Y132.987 E.31209
G1 X129.334 Y132.987 E.01201
G1 X129.334 Y123.013 E.31209
G1 X129.718 Y123.013 E.01201
G1 X129.718 Y132.987 E.31209
G1 X130.102 Y132.987 E.01201
G1 X130.102 Y122.87 E.31655
G1 X130.163 Y122.809 E.00268
G1 X130.163 Y120.436 E.07426
G1 X130.486 Y120.436 E.01012
G1 X130.486 Y132.987 E.3927
G1 X130.87 Y132.987 E.01201
G1 X130.87 Y120.436 E.3927
G1 X131.254 Y120.436 E.01201
G1 X131.254 Y132.987 E.3927
G1 X131.638 Y132.987 E.01201
G1 X131.638 Y120.436 E.3927
G1 X132.022 Y120.436 E.01201
G1 X132.022 Y132.987 E.3927
G1 X132.406 Y132.987 E.01201
G1 X132.406 Y120.436 E.39271
G1 X132.79 Y120.436 E.01201
G1 X132.79 Y132.987 E.39271
G1 X133.174 Y132.987 E.01201
G1 X133.174 Y120.436 E.39271
G1 X133.557 Y120.436 E.01201
G1 X133.557 Y132.987 E.39271
G1 X133.941 Y132.987 E.01201
G1 X133.941 Y120.436 E.39271
G1 X134.325 Y120.436 E.01201
G1 X134.325 Y132.987 E.39271
G1 X134.709 Y132.987 E.01201
G1 X134.709 Y120.436 E.39271
G1 X135.093 Y120.435 E.01201
G1 X135.093 Y132.987 E.39271
G1 X135.477 Y132.987 E.01201
G1 X135.477 Y120.435 E.39272
G1 X135.861 Y120.435 E.01201
G1 X135.861 Y133.157 E.39803
M106 S183.6
; WIPE_START
G1 X135.861 Y131.157 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.905 Y135.075 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X136.277 Y135.075 E.05401
G1 X135.804 Y135.548 E.02218
G1 X135.548 Y135.548 E.00849
G1 X133.38 Y133.38 E.10173
G1 X130.296 Y133.38 E.10228
G1 X128.127 Y135.549 E.10176
G1 X127.873 Y135.549 E.00844
G1 X126.23 Y133.906 E.07709
G1 X126.23 Y133.38 E.01745
G1 X127.332 Y133.38 E.03657
; OBJECT_ID: 394
; WIPE_START
G1 X126.23 Y133.38 E-.4189
G1 X126.23 Y133.906 E-.19986
G1 X126.492 Y134.168 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z6.4 I-.012 J-1.217 P1  F42000
G1 X97.79 Y134.44 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X103.41 Y134.44 E.17269
G1 X103.41 Y135.66 E.03749
G1 X97.79 Y135.66 E.17269
G1 X97.79 Y134.5 E.03564
; WIPE_START
M204 S6000
G1 X99.79 Y134.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.4 I1.203 J-.186 P1  F42000
G1 X97.79 Y121.56 Z6.4
G1 Z6
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X97.79 Y120.34 E.03749
G1 X103.41 Y120.34 E.17269
G1 X103.41 Y121.56 E.03749
G1 X97.85 Y121.56 E.17084
M204 S10000
G1 X97.398 Y121.56 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.398 Y121.952 E.01301
G1 X100.198 Y121.952 E.09288
G1 X100.198 Y134.048 E.40124
G1 X97.398 Y134.048 E.09288
G1 X97.398 Y135.898 E.06137
G1 X86.602 Y135.898 E.35812
G1 X86.602 Y134.048 E.06137
G1 X83.802 Y134.048 E.09288
G1 X83.802 Y121.952 E.40124
G1 X86.602 Y121.952 E.09288
G1 X86.602 Y120.102 E.06136
G1 X97.398 Y120.102 E.35812
G1 X97.398 Y121.5 E.04636
; WIPE_START
G1 X97.398 Y121.952 E-.17179
G1 X98.946 Y121.952 E-.58821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.317 Y121.717 Z6.4 F42000
G1 X86.21 Y121.56 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X80.59 Y121.56 E.17269
G1 X80.59 Y120.34 E.03749
G1 X86.21 Y120.34 E.17269
G1 X86.21 Y121.5 E.03564
; WIPE_START
M204 S6000
G1 X84.21 Y121.521 E-.76
; WIPE_END
M73 P75 R6
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.4 I-1.203 J.186 P1  F42000
G1 X86.21 Y134.44 Z6.4
G1 Z6
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X86.21 Y135.66 E.03749
G1 X80.59 Y135.66 E.17269
G1 X80.59 Y134.44 E.03749
G1 X86.15 Y134.44 E.17084
; WIPE_START
M204 S6000
G1 X86.21 Y135.66 E-.46416
G1 X85.431 Y135.66 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.034 Y134.983 Z6.4 F42000
G1 X100.59 Y134.31 Z6.4
G1 Z6
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X103.56 Y134.31 E.09126
G1 X103.56 Y133.835 E.0146
G1 X103.79 Y133.835 E.00706
G1 X103.788 Y134.968 E.03482
G3 X102.395 Y136.29 I-1.406 J-.086 E.06494
G1 X81.605 Y136.29 E.6388
G3 X80.21 Y134.895 I.012 J-1.407 E.06718
G1 X80.21 Y133.835 E.03257
G1 X80.44 Y133.835 E.00707
G1 X80.44 Y134.31 E.0146
G1 X83.41 Y134.31 E.09126
G1 X83.41 Y121.69 E.38778
G1 X80.44 Y121.69 E.09126
G1 X80.44 Y122.165 E.0146
G1 X80.21 Y122.165 E.00706
G1 X80.212 Y121.032 E.03482
G3 X81.605 Y119.71 I1.398 J.078 E.06503
G1 X102.416 Y119.711 E.63946
G3 X103.79 Y121.105 I-.02 J1.394 E.0667
G1 X103.79 Y122.165 E.03256
G1 X103.56 Y122.165 E.00707
G1 X103.56 Y121.69 E.0146
G1 X100.59 Y121.69 E.09126
G1 X100.59 Y134.25 E.38593
; WIPE_START
M204 S6000
G1 X102.59 Y134.29 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.22 Y133.132 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42469
G1 F9429.761
M204 S6000
G1 X99.865 Y132.487 E.02838
G1 X99.865 Y131.947 E.0168
G1 X98.849 Y132.963 E.04467
G1 X98.309 Y132.963 E.0168
G1 X99.865 Y131.407 E.06843
G1 X99.865 Y130.867 E.0168
G1 X97.77 Y132.963 E.09218
G1 X97.23 Y132.963 E.0168
G1 X99.865 Y130.327 E.11593
G1 X99.865 Y129.788 E.0168
G1 X96.69 Y132.963 E.13969
G1 X96.15 Y132.963 E.0168
G1 X99.865 Y129.248 E.16344
G1 X99.865 Y128.708 E.0168
G1 X95.61 Y132.963 E.18719
G1 X95.07 Y132.963 E.0168
G1 X99.865 Y128.168 E.21095
M73 P75 R5
G1 X99.865 Y127.628 E.0168
G1 X94.53 Y132.963 E.2347
G1 X93.99 Y132.963 E.0168
G1 X99.865 Y127.088 E.25845
G1 X99.865 Y126.548 E.0168
G1 X93.45 Y132.963 E.28221
G1 X92.91 Y132.963 E.0168
G1 X99.865 Y126.008 E.30596
G1 X99.865 Y125.468 E.0168
G1 X92.562 Y132.771 E.32127
G1 X92.562 Y132.231 E.0168
G1 X99.865 Y124.928 E.32127
G1 X99.865 Y124.388 E.0168
G1 X92.562 Y131.691 E.32127
G1 X92.562 Y131.151 E.0168
G1 X99.865 Y123.849 E.32127
G1 X99.865 Y123.309 E.0168
G1 X92.562 Y130.611 E.32127
G1 X92.562 Y130.071 E.0168
G1 X99.596 Y123.037 E.30945
G1 X99.056 Y123.037 E.0168
G1 X92.562 Y129.531 E.28569
G1 X92.562 Y128.991 E.0168
G1 X98.516 Y123.037 E.26194
G1 X97.976 Y123.037 E.0168
G1 X92.562 Y128.451 E.23819
G1 X92.562 Y127.911 E.0168
G1 X97.436 Y123.037 E.21443
G1 X96.897 Y123.037 E.0168
G1 X92.562 Y127.372 E.19068
G1 X92.562 Y126.832 E.0168
G1 X96.357 Y123.037 E.16693
G1 X95.817 Y123.037 E.0168
G1 X92.562 Y126.292 E.14317
G1 X92.562 Y125.752 E.0168
G1 X95.277 Y123.037 E.11942
G1 X94.737 Y123.037 E.0168
G1 X92.562 Y125.212 E.09567
G1 X92.562 Y124.672 E.0168
G1 X94.197 Y123.037 E.07192
G1 X93.657 Y123.037 E.0168
G1 X92.562 Y124.132 E.04816
G1 X92.562 Y123.592 E.0168
G1 X93.117 Y123.037 E.02441
G1 X92.577 Y123.037 E.0168
G1 X92.393 Y123.222 E.00812
M204 S10000
G1 X86.95 Y121.322 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X86.95 Y122.3 E.03245
G1 X86.3 Y122.3 E.02156
G1 X86.645 Y122.645 E.01619
G1 X89.679 Y122.645 E.10062
G1 X91.873 Y120.451 E.10296
G1 X92.127 Y120.451 E.0084
G1 X94.321 Y122.645 E.10296
G1 X97.355 Y122.645 E.10062
G1 X97.7 Y122.3 E.01619
G1 X97.05 Y122.3 E.02156
G1 X97.05 Y121.322 E.03245
; WIPE_START
G1 X97.05 Y122.3 E-.37176
G1 X97.7 Y122.3 E-.247
G1 X97.437 Y122.563 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.594 Y120.025 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279721
G1 F15000
M204 S6000
G1 X102.406 Y120.025 E.09286
G3 X102.67 Y120.042 I-.007 J2.18 E.0051
; LINE_WIDTH: 0.232022
G1 X102.768 Y120.057 E.00153
; LINE_WIDTH: 0.194685
G1 X103.056 Y120.114 E.00363
M204 S10000
G1 X103.053 Y120.125 F42000
; LINE_WIDTH: 0.105546
G1 F15000
M204 S6000
G1 X102.316 Y119.907 E.00392
; WIPE_START
G1 X103.053 Y120.125 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.4 I-.809 J-.91 P1  F42000
G1 X92.17 Y129.799 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X92.17 Y128.17 E.05401
G1 X91.83 Y127.83 E.01599
G1 X91.83 Y128.17 E.0113
G1 X92.17 Y127.83 E.01599
G1 X92.17 Y126.201 E.05401
M204 S10000
G1 X91.253 Y133.132 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42469
G1 F9429.761
M204 S6000
G1 X91.438 Y132.948 E.00811
G1 X91.438 Y132.408 E.0168
G1 X90.883 Y132.963 E.0244
G1 X90.343 Y132.963 E.0168
G1 X91.438 Y131.868 E.04816
G1 X91.438 Y131.328 E.0168
G1 X89.803 Y132.963 E.07191
G1 X89.263 Y132.963 E.0168
G1 X91.438 Y130.788 E.09566
G1 X91.438 Y130.248 E.0168
G1 X88.723 Y132.963 E.11942
G1 X88.183 Y132.963 E.0168
G1 X91.438 Y129.708 E.14317
G1 X91.438 Y129.168 E.0168
G1 X87.643 Y132.963 E.16692
G1 X87.104 Y132.963 E.0168
G1 X91.438 Y128.629 E.19068
G1 X91.438 Y128.089 E.0168
G1 X86.564 Y132.963 E.21443
G1 X86.024 Y132.963 E.0168
G1 X91.438 Y127.549 E.23818
G1 X91.438 Y127.009 E.0168
G1 X85.484 Y132.963 E.26194
G1 X84.944 Y132.963 E.0168
G1 X91.438 Y126.469 E.28569
G1 X91.438 Y125.929 E.0168
G1 X84.404 Y132.963 E.30944
G1 X84.135 Y132.963 E.00836
G1 X84.135 Y132.691 E.00843
G1 X91.438 Y125.389 E.32127
G1 X91.438 Y124.849 E.0168
G1 X84.135 Y132.152 E.32127
G1 X84.135 Y131.612 E.0168
G1 X91.438 Y124.309 E.32127
G1 X91.438 Y123.769 E.0168
G1 X84.135 Y131.072 E.32127
G1 X84.135 Y130.532 E.0168
G1 X91.438 Y123.229 E.32127
G1 X91.438 Y123.049 E.00562
G1 X91.09 Y123.037 E.01083
G1 X84.135 Y129.992 E.30596
G1 X84.135 Y129.452 E.0168
G1 X90.55 Y123.037 E.28221
G1 X90.01 Y123.037 E.0168
G1 X84.135 Y128.912 E.25846
G1 X84.135 Y128.372 E.0168
G1 X89.47 Y123.037 E.2347
G1 X88.93 Y123.037 E.0168
G1 X84.135 Y127.832 E.21095
G1 X84.135 Y127.292 E.0168
G1 X88.39 Y123.037 E.1872
G1 X87.85 Y123.037 E.0168
G1 X84.135 Y126.752 E.16345
G1 X84.135 Y126.213 E.0168
G1 X87.31 Y123.037 E.13969
G1 X86.77 Y123.037 E.0168
G1 X84.135 Y125.673 E.11594
G1 X84.135 Y125.133 E.0168
G1 X86.231 Y123.037 E.09219
G1 X85.691 Y123.037 E.0168
G1 X84.135 Y124.593 E.06843
G1 X84.135 Y124.053 E.0168
G1 X85.151 Y123.037 E.04468
G1 X84.611 Y123.037 E.0168
G1 X83.966 Y123.683 E.02839
; WIPE_START
G1 X84.611 Y123.037 E-.34678
G1 X85.151 Y123.037 E-.20517
G1 X84.764 Y123.425 E-.20805
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.406 Y120.025 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280157
G1 F15000
M204 S6000
G1 X81.612 Y120.025 E.09267
G2 X81.334 Y120.042 I.003 J2.363 E.00539
; LINE_WIDTH: 0.23346
G1 X81.239 Y120.056 E.00149
; LINE_WIDTH: 0.208158
G1 X80.944 Y120.109 E.00404
; WIPE_START
G1 X81.239 Y120.056 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.098 Y127.687 Z6.4 F42000
G1 X80.946 Y135.88 Z6.4
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.158358
G1 F15000
M204 S6000
G1 X81.847 Y136.094 E.00871
M204 S10000
G1 X81.341 Y135.959 F42000
; LINE_WIDTH: 0.280259
G1 F15000
M204 S6000
G2 X81.613 Y135.975 I.297 J-2.784 E.00527
G1 X86.406 Y135.975 E.09269
M204 S10000
G1 X81.341 Y135.959 F42000
; LINE_WIDTH: 0.232472
G1 F15000
M204 S6000
G1 X80.954 Y135.902 E.00604
; WIPE_START
G1 X81.341 Y135.959 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.948 Y135.339 Z6.4 F42000
G1 X97.05 Y134.678 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.05 Y133.7 E.03245
G1 X97.7 Y133.7 E.02156
G1 X97.355 Y133.355 E.01619
G1 X94.321 Y133.355 E.10062
G1 X92.126 Y135.55 E.10298
G1 X91.874 Y135.55 E.00838
G1 X89.679 Y133.355 E.10298
G1 X86.645 Y133.355 E.10062
G1 X86.3 Y133.7 E.01619
G1 X86.95 Y133.7 E.02156
G1 X86.95 Y134.678 E.03245
; WIPE_START
G1 X86.95 Y133.7 E-.37176
G1 X86.3 Y133.7 E-.247
G1 X86.563 Y133.437 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.001 Y135.148 Z6.4 F42000
G1 X97.594 Y135.975 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280782
G1 F15000
M204 S6000
G1 X102.512 Y135.972 E.09532
; LINE_WIDTH: 0.255116
G2 X102.731 Y135.949 I-.2 J-2.998 E.0038
; LINE_WIDTH: 0.212492
G1 X103.057 Y135.892 E.00457
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X102.731 Y135.949 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 31/42
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
M106 S196.35
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z6.4 I.325 J1.173 P1  F42000
G1 X155.802 Y121.223 Z6.4
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X152.603 Y121.223 E.1061
G3 X153.608 Y120.102 I1.005 J-.11 E.05631
G1 X174.404 Y120.103 E.68984
G3 X175.401 Y121.223 I-.016 J1.018 E.05593
G1 X172.198 Y121.223 E.10624
G1 X172.198 Y134.777 E.44962
G1 X175.397 Y134.777 E.1061
G3 X174.385 Y135.898 I-1.005 J.11 E.05655
G1 X153.615 Y135.898 E.68898
G3 X152.603 Y134.777 I-.009 J-1.009 E.05659
G1 X155.802 Y134.777 E.1061
G1 X155.802 Y121.283 E.44763
M204 S250
G1 X155.41 Y121.615 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X154.697 Y121.615 E.02189
G1 X154.69 Y121.815 E.00615
G1 X154.31 Y121.815 E.01169
G1 X154.305 Y121.615 E.00615
G1 X153.497 Y121.615 E.02482
G1 X153.49 Y121.815 E.00615
G1 X153.11 Y121.815 E.01169
G1 X153.105 Y121.615 E.00615
G1 X152.21 Y121.615 E.0275
G3 X152.217 Y120.965 I4.545 J-.282 E.02
G3 X153.603 Y119.71 I1.388 J.141 E.06296
G1 X174.414 Y119.71 E.63947
G3 X175.79 Y121.103 I-.023 J1.399 E.06662
G1 X175.79 Y121.615 E.01574
G1 X174.897 Y121.615 E.02742
G1 X174.89 Y121.815 E.00615
G1 X174.51 Y121.815 E.01169
G1 X174.505 Y121.615 E.00615
G1 X173.695 Y121.615 E.02491
G1 X173.69 Y121.815 E.00614
G1 X173.31 Y121.814 E.01169
G1 X173.303 Y121.615 E.00613
G1 X172.59 Y121.615 E.02189
G1 X172.59 Y134.385 E.39239
G1 X173.302 Y134.385 E.02189
G1 X173.31 Y134.185 E.00615
G1 X173.69 Y134.185 E.01169
G1 X173.695 Y134.385 E.00615
G1 X174.502 Y134.385 E.02482
G1 X174.51 Y134.185 E.00615
G1 X174.89 Y134.185 E.01169
G1 X174.895 Y134.385 E.00615
G1 X175.789 Y134.385 E.0275
G3 X175.783 Y135.035 I-4.562 J.282 E.02
G3 X174.395 Y136.29 I-1.388 J-.141 E.06303
G1 X153.605 Y136.29 E.6388
G3 X152.212 Y134.971 I.006 J-1.402 E.06494
G1 X152.21 Y134.385 E.01799
G1 X153.102 Y134.385 E.02741
G1 X153.11 Y134.185 E.00615
G1 X153.49 Y134.185 E.01169
G1 X153.495 Y134.385 E.00615
G1 X154.305 Y134.385 E.02491
G1 X154.31 Y134.185 E.00614
G1 X154.69 Y134.186 E.01169
G1 X154.698 Y134.385 E.00613
G1 X155.41 Y134.385 E.02189
G1 X155.41 Y121.675 E.39054
; WIPE_START
M204 S6000
G1 X154.697 Y121.615 E-.27171
G1 X154.69 Y121.815 E-.07605
G1 X154.31 Y121.815 E-.14456
G1 X154.305 Y121.615 E-.07602
G1 X153.801 Y121.615 E-.19166
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
G1 X163.607 Y123.173 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42683
G1 F9377.197
M204 S6000
G1 X163.421 Y122.987 E.00823
G1 X162.878 Y122.987 E.01698
G1 X163.438 Y123.547 E.02474
G1 X163.438 Y124.09 E.01698
G1 X162.335 Y122.987 E.04876
G1 X161.792 Y122.987 E.01698
G1 X163.438 Y124.633 E.07278
G1 X163.438 Y125.175 E.01698
G1 X161.25 Y122.987 E.0968
G1 X160.707 Y122.987 E.01698
G1 X163.438 Y125.718 E.12082
G1 X163.438 Y126.261 E.01698
G1 X160.164 Y122.987 E.14484
G1 X159.621 Y122.987 E.01698
G1 X163.438 Y126.804 E.16886
G1 X163.438 Y127.347 E.01698
G1 X159.078 Y122.987 E.19288
G1 X158.535 Y122.987 E.01699
G1 X163.438 Y127.89 E.2169
G1 X163.438 Y128.433 E.01698
G1 X157.992 Y122.987 E.24092
G1 X157.449 Y122.987 E.01698
G1 X163.438 Y128.976 E.26494
G1 X163.438 Y129.519 E.01698
G1 X156.906 Y122.987 E.28896
G1 X156.363 Y122.987 E.01698
G1 X163.438 Y130.062 E.31298
G1 X163.438 Y130.605 E.01698
M73 P76 R5
G1 X156.135 Y123.302 E.32307
G1 X156.135 Y123.845 E.01698
G1 X163.438 Y131.148 E.32307
G1 X163.438 Y131.691 E.01698
G1 X156.135 Y124.388 E.32307
G1 X156.135 Y124.931 E.01698
G1 X163.438 Y132.234 E.32307
G1 X163.438 Y132.776 E.01699
G1 X156.135 Y125.474 E.32307
G1 X156.135 Y126.017 E.01698
G1 X163.131 Y133.013 E.30949
G1 X162.588 Y133.013 E.01698
G1 X156.135 Y126.56 E.28547
G1 X156.135 Y127.103 E.01698
G1 X162.045 Y133.013 E.26145
G1 X161.502 Y133.013 E.01698
G1 X156.135 Y127.646 E.23743
G1 X156.135 Y128.189 E.01698
G1 X160.959 Y133.013 E.21341
G1 X160.416 Y133.013 E.01698
G1 X156.135 Y128.732 E.18939
G1 X156.135 Y129.275 E.01698
G1 X159.873 Y133.013 E.16537
G1 X159.33 Y133.013 E.01698
G1 X156.135 Y129.818 E.14135
G1 X156.135 Y130.361 E.01698
G1 X158.787 Y133.013 E.11733
G1 X158.244 Y133.013 E.01698
G1 X156.135 Y130.903 E.09331
G1 X156.135 Y131.446 E.01698
G1 X157.701 Y133.013 E.06929
G1 X157.158 Y133.013 E.01699
G1 X156.135 Y131.989 E.04527
G1 X156.135 Y132.532 E.01698
G1 X156.785 Y133.182 E.02876
; WIPE_START
G1 X156.135 Y132.532 E-.34931
G1 X156.135 Y131.989 E-.20631
G1 X156.516 Y132.37 E-.20438
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.145 Y135.125 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X155.773 Y135.125 E.05401
G1 X156.198 Y135.55 E.01991
G1 X156.45 Y135.55 E.00838
G1 X158.595 Y133.405 E.10063
G1 X161.729 Y133.405 E.10394
G1 X163.874 Y135.55 E.10063
G1 X164.126 Y135.55 E.00838
G1 X166.271 Y133.405 E.10063
G1 X169.405 Y133.405 E.10394
G1 X171.55 Y135.55 E.10063
G1 X171.802 Y135.55 E.00838
G1 X172.227 Y135.125 E.01991
G1 X173.855 Y135.125 E.05401
; WIPE_START
G1 X172.227 Y135.125 E-.61876
G1 X171.964 Y135.388 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X164.749 Y133.182 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42683
G1 F9377.197
M204 S6000
G1 X164.562 Y132.996 E.00824
G1 X164.562 Y132.453 E.01698
G1 X165.122 Y133.013 E.02475
G1 X165.665 Y133.013 E.01698
G1 X164.562 Y131.91 E.04877
G1 X164.562 Y131.367 E.01698
G1 X166.208 Y133.013 E.07279
G1 X166.751 Y133.013 E.01698
G1 X164.562 Y130.824 E.09681
G1 X164.562 Y130.281 E.01698
G1 X167.294 Y133.013 E.12083
G1 X167.837 Y133.013 E.01698
G1 X164.562 Y129.738 E.14485
G1 X164.562 Y129.195 E.01698
G1 X168.38 Y133.013 E.16887
G1 X168.922 Y133.013 E.01698
G1 X164.562 Y128.653 E.1929
G1 X164.562 Y128.11 E.01698
G1 X169.465 Y133.013 E.21692
G1 X170.008 Y133.013 E.01698
G1 X164.562 Y127.567 E.24094
G1 X164.562 Y127.024 E.01698
G1 X170.551 Y133.013 E.26496
G1 X171.094 Y133.013 E.01698
G1 X164.562 Y126.481 E.28898
G1 X164.562 Y125.938 E.01698
G1 X171.637 Y133.013 E.313
G1 X171.865 Y133.013 E.00712
G1 X171.865 Y132.697 E.00986
G1 X164.562 Y125.395 E.32307
G1 X164.562 Y124.852 E.01698
G1 X171.865 Y132.154 E.32307
G1 X171.865 Y131.611 E.01698
G1 X164.562 Y124.309 E.32307
G1 X164.562 Y123.766 E.01698
G1 X171.865 Y131.069 E.32307
G1 X171.865 Y130.526 E.01698
G1 X164.562 Y123.223 E.32307
G1 X164.562 Y122.999 E.00702
G1 X164.87 Y122.987 E.00962
G1 X171.865 Y129.983 E.30948
G1 X171.865 Y129.44 E.01698
G1 X165.413 Y122.987 E.28546
G1 X165.955 Y122.987 E.01698
G1 X171.865 Y128.897 E.26144
G1 X171.865 Y128.354 E.01699
G1 X166.498 Y122.987 E.23742
G1 X167.041 Y122.987 E.01698
G1 X171.865 Y127.811 E.2134
G1 X171.865 Y127.268 E.01698
G1 X167.584 Y122.987 E.18938
G1 X168.127 Y122.987 E.01698
G1 X171.865 Y126.725 E.16536
G1 X171.865 Y126.182 E.01698
G1 X168.67 Y122.987 E.14134
G1 X169.213 Y122.987 E.01698
G1 X171.865 Y125.639 E.11732
G1 X171.865 Y125.096 E.01698
G1 X169.756 Y122.987 E.0933
G1 X170.299 Y122.987 E.01698
G1 X171.865 Y124.553 E.06928
G1 X171.865 Y124.01 E.01698
G1 X170.842 Y122.987 E.04526
G1 X171.385 Y122.987 E.01698
G1 X172.034 Y123.637 E.02874
; WIPE_START
G1 X171.385 Y122.987 E-.34916
G1 X170.842 Y122.987 E-.20631
G1 X171.222 Y123.368 E-.20453
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X173.855 Y120.875 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X172.227 Y120.875 E.05401
G1 X171.803 Y120.451 E.01989
G1 X171.549 Y120.451 E.00841
G1 X169.405 Y122.595 E.10061
G1 X166.271 Y122.595 E.10394
G1 X164.127 Y120.451 E.10062
G1 X163.873 Y120.451 E.00839
G1 X161.729 Y122.595 E.10062
G1 X158.595 Y122.595 E.10394
G1 X156.45 Y120.45 E.10063
G1 X156.198 Y120.45 E.00838
G1 X155.773 Y120.875 E.0199
G1 X154.145 Y120.875 E.05401
; WIPE_START
G1 X155.773 Y120.875 E-.61876
G1 X156.036 Y120.612 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.6 I-.928 J.787 P1  F42000
G1 X163.83 Y129.799 Z6.6
G1 Z6.2
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X163.83 Y128.17 E.05401
G1 X164.17 Y127.83 E.01599
G1 X164.17 Y128.17 E.01131
G1 X163.83 Y127.83 E.01599
G1 X163.83 Y126.201 E.05401
; OBJECT_ID: 405
; WIPE_START
G1 X163.83 Y127.83 E-.61876
G1 X164.092 Y128.092 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z6.6 I.185 J-1.203 P1  F42000
G1 X119.802 Y121.273 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X116.602 Y121.273 E.10615
G3 X117.551 Y120.104 I1.011 J-.149 E.05615
G1 X136.198 Y120.102 E.61855
G1 X136.198 Y134.727 E.48514
G1 X139.398 Y134.727 E.10615
G3 X138.456 Y135.896 I-1.015 J.146 E.05587
G1 X119.802 Y135.898 E.61879
G1 X119.802 Y121.333 E.48315
M204 S250
G1 X119.41 Y121.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X116.21 Y121.665 E.09833
G3 X116.252 Y120.762 I3.688 J-.281 E.02784
G3 X117.532 Y119.712 I1.349 J.339 E.05449
G1 X136.59 Y119.71 E.58561
G1 X136.59 Y134.335 E.44939
G1 X139.79 Y134.335 E.09833
G3 X139.729 Y135.306 I-3.319 J.28 E.03
G3 X138.471 Y136.288 I-1.342 J-.423 E.05216
G1 X119.41 Y136.29 E.58568
G1 X119.41 Y121.725 E.44754
; WIPE_START
M204 S6000
G1 X117.41 Y121.688 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.095 Y120.925 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X119.723 Y120.925 E.05401
G1 X120.196 Y120.452 E.02217
G1 X120.452 Y120.452 E.00849
G1 X122.62 Y122.62 E.10173
G1 X125.704 Y122.62 E.10228
G1 X127.873 Y120.451 E.10176
G1 X128.127 Y120.451 E.00844
G1 X129.77 Y122.094 E.07709
G1 X129.77 Y122.62 E.01745
G1 X128.411 Y122.62 E.04508
G1 X128.17 Y122.861 E.01131
G1 X128.17 Y127.83 E.1648
G1 X127.83 Y128.17 E.01599
G1 X127.83 Y127.83 E.0113
G1 X128.17 Y128.17 E.01599
G1 X128.17 Y129.799 E.05401
M204 S10000
G1 X128.393 Y132.804 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42414
G1 F9443.366
M204 S6000
G1 X128.577 Y132.988 E.00808
G1 X129.116 Y132.988 E.01675
G1 X128.562 Y132.434 E.02431
G1 X128.562 Y131.895 E.01675
G1 X129.655 Y132.988 E.048
G1 X130.194 Y132.988 E.01675
G1 X128.562 Y131.356 E.07168
G1 X128.562 Y130.817 E.01675
G1 X130.733 Y132.988 E.09537
G1 X131.272 Y132.988 E.01675
G1 X128.562 Y130.278 E.11905
G1 X128.562 Y129.738 E.01675
G1 X131.812 Y132.988 E.14274
G1 X132.351 Y132.988 E.01675
G1 X128.562 Y129.199 E.16642
G1 X128.562 Y128.66 E.01675
G1 X132.89 Y132.988 E.19011
G1 X133.429 Y132.988 E.01675
G1 X128.562 Y128.121 E.21379
G1 X128.562 Y127.582 E.01675
G1 X133.968 Y132.988 E.23748
G1 X134.507 Y132.988 E.01675
G1 X128.562 Y127.043 E.26116
G1 X128.562 Y126.504 E.01675
G1 X135.046 Y132.988 E.28485
G1 X135.585 Y132.988 E.01675
G1 X128.562 Y125.965 E.30853
G1 X128.562 Y125.425 E.01675
G1 X135.865 Y132.728 E.32081
G1 X135.865 Y132.189 E.01675
G1 X128.562 Y124.886 E.32081
G1 X128.562 Y124.347 E.01675
G1 X135.865 Y131.65 E.32081
G1 X135.865 Y131.11 E.01675
G1 X128.562 Y123.808 E.32081
G1 X128.562 Y123.269 E.01675
G1 X135.865 Y130.571 E.32081
G1 X135.865 Y130.032 E.01675
G1 X128.845 Y123.012 E.30839
G1 X129.384 Y123.012 E.01675
G1 X135.865 Y129.493 E.2847
G1 X135.865 Y128.954 E.01675
G1 X129.923 Y123.012 E.26102
G1 X129.959 Y123.012 E.00112
G1 X130.162 Y122.809 E.00892
G1 X130.162 Y122.712 E.00301
G1 X135.865 Y128.415 E.25051
G1 X135.865 Y127.876 E.01675
G1 X130.162 Y122.173 E.25051
G1 X130.162 Y121.634 E.01675
G1 X135.865 Y127.337 E.25051
G1 X135.865 Y126.797 E.01675
G1 X130.162 Y121.095 E.25051
G1 X130.162 Y120.556 E.01675
G1 X135.865 Y126.258 E.25051
G1 X135.865 Y125.719 E.01675
G1 X130.581 Y120.436 E.23211
G1 X131.121 Y120.436 E.01675
G1 X135.865 Y125.18 E.20842
G1 X135.865 Y124.641 E.01675
G1 X131.66 Y120.436 E.18474
G1 X132.199 Y120.436 E.01675
G1 X135.865 Y124.102 E.16106
G1 X135.865 Y123.563 E.01675
G1 X132.738 Y120.436 E.13738
G1 X133.277 Y120.436 E.01675
G1 X135.865 Y123.024 E.11369
G1 X135.865 Y122.484 E.01675
G1 X133.816 Y120.436 E.09001
G1 X134.355 Y120.435 E.01675
G1 X135.865 Y121.945 E.06633
G1 X135.865 Y121.406 E.01675
G1 X134.894 Y120.435 E.04265
G1 X135.433 Y120.435 E.01675
G1 X136.034 Y121.037 E.02642
M204 S10000
G1 X127.607 Y123.197 F42000
G1 F9443.366
M204 S6000
G1 X127.423 Y123.012 E.00809
G1 X126.884 Y123.012 E.01675
G1 X127.438 Y123.566 E.02432
G1 X127.438 Y124.105 E.01675
G1 X126.345 Y123.012 E.048
G1 X125.806 Y123.012 E.01675
G1 X127.438 Y124.644 E.07169
G1 X127.438 Y125.183 E.01675
G1 X125.267 Y123.012 E.09537
G1 X124.728 Y123.012 E.01675
G1 X127.438 Y125.722 E.11906
G1 X127.438 Y126.262 E.01675
G1 X124.188 Y123.012 E.14274
G1 X123.649 Y123.012 E.01675
G1 X127.438 Y126.801 E.16643
G1 X127.438 Y127.34 E.01675
G1 X123.11 Y123.012 E.19011
G1 X122.571 Y123.012 E.01675
G1 X127.438 Y127.879 E.2138
G1 X127.438 Y128.418 E.01675
G1 X122.032 Y123.012 E.23748
G1 X121.493 Y123.012 E.01675
G1 X127.438 Y128.957 E.26117
G1 X127.438 Y129.496 E.01675
G1 X120.954 Y123.012 E.28485
G1 X120.415 Y123.012 E.01675
G1 X127.438 Y130.035 E.30854
G1 X127.438 Y130.575 E.01675
G1 X120.135 Y123.272 E.32081
G1 X120.135 Y123.811 E.01675
G1 X127.438 Y131.114 E.32081
G1 X127.438 Y131.653 E.01675
G1 X120.135 Y124.351 E.32081
G1 X120.135 Y124.89 E.01675
G1 X127.438 Y132.192 E.32081
G1 X127.438 Y132.731 E.01675
G1 X120.135 Y125.429 E.32081
G1 X120.135 Y125.968 E.01675
G1 X127.155 Y132.988 E.30839
G1 X126.616 Y132.988 E.01675
G1 X120.135 Y126.507 E.2847
G1 X120.135 Y127.046 E.01675
G1 X126.077 Y132.988 E.26102
G1 X126.041 Y132.988 E.00112
G1 X125.838 Y133.191 E.00892
G1 X125.838 Y133.288 E.00301
G1 X120.135 Y127.585 E.25051
G1 X120.135 Y128.124 E.01675
G1 X125.838 Y133.827 E.25051
G1 X125.838 Y134.366 E.01675
G1 X120.135 Y128.664 E.25051
G1 X120.135 Y129.203 E.01675
G1 X125.838 Y134.905 E.25051
G1 X125.838 Y135.444 E.01675
G1 X120.135 Y129.742 E.25051
G1 X120.135 Y130.281 E.01675
G1 X125.418 Y135.564 E.2321
G1 X124.879 Y135.564 E.01675
G1 X120.135 Y130.82 E.20842
G1 X120.135 Y131.359 E.01675
G1 X124.34 Y135.564 E.18474
G1 X123.801 Y135.564 E.01675
G1 X120.135 Y131.898 E.16105
G1 X120.135 Y132.437 E.01675
G1 X123.262 Y135.564 E.13737
G1 X122.723 Y135.564 E.01675
G1 X120.135 Y132.977 E.11369
G1 X120.135 Y133.516 E.01675
G1 X122.184 Y135.564 E.09001
G1 X121.645 Y135.565 E.01675
G1 X120.135 Y134.055 E.06632
G1 X120.135 Y134.594 E.01675
M73 P77 R5
G1 X121.106 Y135.565 E.04264
G1 X120.567 Y135.565 E.01675
G1 X119.966 Y134.963 E.02641
M204 S10000
G1 X127.332 Y133.38 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X126.23 Y133.38 E.03657
G1 X126.23 Y133.906 E.01745
G1 X127.873 Y135.549 E.07709
G1 X128.127 Y135.549 E.00844
G1 X130.296 Y133.38 E.10176
G1 X133.38 Y133.38 E.10228
G1 X135.548 Y135.548 E.10173
G1 X135.804 Y135.548 E.00849
G1 X136.277 Y135.075 E.02217
G1 X137.905 Y135.075 E.05401
; OBJECT_ID: 394
; WIPE_START
G1 X136.277 Y135.075 E-.61876
G1 X136.014 Y135.338 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X128.383 Y135.159 Z6.6 F42000
G1 X97.79 Y134.44 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X103.41 Y134.44 E.17269
G1 X103.41 Y135.66 E.03749
G1 X97.79 Y135.66 E.17269
G1 X97.79 Y134.5 E.03564
; WIPE_START
M204 S6000
G1 X99.79 Y134.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.6 I1.203 J-.186 P1  F42000
G1 X97.79 Y121.56 Z6.6
G1 Z6.2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X97.79 Y120.34 E.03749
G1 X103.41 Y120.34 E.17269
G1 X103.41 Y121.56 E.03749
G1 X97.85 Y121.56 E.17084
M204 S10000
G1 X97.398 Y121.56 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.398 Y121.952 E.01301
G1 X100.198 Y121.952 E.09288
G1 X100.198 Y134.048 E.40124
G1 X97.398 Y134.048 E.09288
G1 X97.398 Y135.898 E.06137
G1 X86.602 Y135.898 E.35812
G1 X86.602 Y134.048 E.06137
G1 X83.802 Y134.048 E.09288
G1 X83.802 Y121.952 E.40124
G1 X86.602 Y121.952 E.09288
G1 X86.602 Y120.102 E.06136
G1 X97.398 Y120.102 E.35812
G1 X97.398 Y121.5 E.04636
; WIPE_START
G1 X97.398 Y121.952 E-.17179
G1 X98.946 Y121.952 E-.58821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.317 Y121.717 Z6.6 F42000
G1 X86.21 Y121.56 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X80.59 Y121.56 E.17269
G1 X80.59 Y120.34 E.03749
G1 X86.21 Y120.34 E.17269
G1 X86.21 Y121.5 E.03564
; WIPE_START
M204 S6000
G1 X84.21 Y121.521 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.6 I-1.203 J.186 P1  F42000
G1 X86.21 Y134.44 Z6.6
G1 Z6.2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X86.21 Y135.66 E.03749
G1 X80.59 Y135.66 E.17269
G1 X80.59 Y134.44 E.03749
G1 X86.15 Y134.44 E.17084
; WIPE_START
M204 S6000
G1 X86.21 Y135.66 E-.46416
G1 X85.431 Y135.66 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.034 Y134.983 Z6.6 F42000
G1 X100.59 Y134.31 Z6.6
G1 Z6.2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X103.56 Y134.31 E.09126
G1 X103.56 Y133.835 E.0146
G1 X103.79 Y133.835 E.00706
G1 X103.788 Y134.968 E.03482
G3 X102.395 Y136.29 I-1.398 J-.078 E.06504
G1 X81.605 Y136.29 E.6388
G3 X80.21 Y134.897 I-.003 J-1.392 E.06731
G1 X80.21 Y133.835 E.03264
G1 X80.44 Y133.835 E.00707
G1 X80.44 Y134.31 E.0146
G1 X83.41 Y134.31 E.09126
G1 X83.41 Y121.69 E.38778
G1 X80.44 Y121.69 E.09126
G1 X80.44 Y122.165 E.0146
G1 X80.21 Y122.165 E.00706
G1 X80.212 Y121.032 E.03482
G3 X81.603 Y119.71 I1.398 J.078 E.06496
G1 X102.414 Y119.71 E.63947
G3 X103.79 Y121.105 I-.023 J1.399 E.0667
G1 X103.79 Y122.165 E.03256
G1 X103.56 Y122.165 E.00707
G1 X103.56 Y121.69 E.0146
G1 X100.59 Y121.69 E.09126
G1 X100.59 Y134.25 E.38593
; WIPE_START
M204 S6000
G1 X102.59 Y134.29 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.512 Y135.972 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280782
G1 F15000
M204 S6000
G1 X97.594 Y135.975 E.09532
M204 S10000
G1 X102.512 Y135.972 F42000
; LINE_WIDTH: 0.255334
G1 F15000
M204 S6000
G2 X102.729 Y135.95 I-.201 J-3.013 E.00378
; LINE_WIDTH: 0.212767
G1 X103.057 Y135.892 E.00461
; WIPE_START
G1 X102.729 Y135.95 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.602 Y133.219 Z6.6 F42000
G1 X93.474 Y132.404 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.4241
G1 F9444.357
M204 S6000
G1 X93.291 Y132.22 E.00808
G1 X93.291 Y131.681 E.01674
G1 X93.844 Y132.234 E.02431
G1 X94.383 Y132.234 E.01674
G1 X93.291 Y131.142 E.04799
G1 X93.291 Y130.603 E.01674
G1 X94.922 Y132.234 E.07167
G1 X95.461 Y132.234 E.01674
G1 X93.291 Y130.064 E.09535
G1 X93.291 Y129.525 E.01674
G1 X96 Y132.234 E.11903
G1 X96.539 Y132.234 E.01674
G1 X93.291 Y128.986 E.14271
G1 X93.291 Y128.447 E.01674
G1 X97.078 Y132.234 E.16639
G1 X97.617 Y132.234 E.01674
G1 X93.291 Y127.908 E.19007
G1 X93.291 Y127.369 E.01674
G1 X98.156 Y132.234 E.21375
G1 X98.695 Y132.234 E.01674
G1 X93.291 Y126.83 E.23743
G1 X93.291 Y126.29 E.01674
G1 X99.235 Y132.234 E.26111
G1 X99.774 Y132.234 E.01674
G1 X93.291 Y125.751 E.28479
G1 X93.291 Y125.212 E.01674
G1 X99.865 Y131.787 E.28879
G1 X99.865 Y131.248 E.01674
G1 X93.291 Y124.673 E.28879
G1 X93.291 Y124.134 E.01674
G1 X99.865 Y130.708 E.28879
G1 X99.865 Y130.169 E.01674
G1 X93.461 Y123.765 E.28131
G1 X94 Y123.765 E.01674
G1 X99.865 Y129.63 E.25763
G1 X99.865 Y129.091 E.01674
G1 X94.539 Y123.765 E.23395
G1 X95.078 Y123.765 E.01674
G1 X99.865 Y128.552 E.21027
G1 X99.865 Y128.013 E.01674
G1 X95.617 Y123.765 E.18659
G1 X96.156 Y123.765 E.01674
G1 X99.865 Y127.474 E.16291
G1 X99.865 Y126.935 E.01674
G1 X96.695 Y123.765 E.13923
G1 X97.234 Y123.765 E.01674
G1 X99.865 Y126.396 E.11555
G1 X99.865 Y125.857 E.01674
G1 X97.773 Y123.765 E.09187
G1 X98.312 Y123.765 E.01674
G1 X99.865 Y125.318 E.06819
G1 X99.865 Y124.779 E.01674
G1 X98.852 Y123.765 E.04451
G1 X99.391 Y123.765 E.01674
G1 X100.034 Y124.409 E.02828
; WIPE_START
G1 X99.391 Y123.765 E-.34599
G1 X98.852 Y123.765 E-.20485
G1 X99.241 Y124.155 E-.20916
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.6 I.963 J-.745 P1  F42000
G1 X97.05 Y121.322 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.05 Y122.3 E.03245
G1 X97.7 Y122.3 E.02156
G1 X96.627 Y123.373 E.05034
G1 X95.049 Y123.373 E.05232
G1 X92.127 Y120.451 E.13712
G1 X91.873 Y120.451 E.00839
G1 X88.951 Y123.373 E.13712
G1 X87.373 Y123.373 E.05232
G1 X86.3 Y122.3 E.05034
G1 X86.95 Y122.3 E.02156
G1 X86.95 Y121.322 E.03245
; WIPE_START
G1 X86.95 Y122.3 E-.37176
G1 X86.3 Y122.3 E-.247
G1 X86.563 Y122.563 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.406 Y120.025 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279468
G1 F15000
M204 S6000
G1 X81.552 Y120.026 E.09356
G2 X81.334 Y120.042 I.054 J2.232 E.00422
; LINE_WIDTH: 0.233227
G1 X81.237 Y120.056 E.00151
; LINE_WIDTH: 0.207956
G1 X80.944 Y120.109 E.00402
; WIPE_START
G1 X81.237 Y120.056 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.315 Y122.914 Z6.6 F42000
G1 X90.879 Y123.95 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.4241
G1 F9444.357
M204 S6000
G1 X90.695 Y123.765 E.00808
G1 X90.156 Y123.765 E.01674
G1 X90.71 Y124.319 E.02431
G1 X90.71 Y124.858 E.01674
G1 X89.617 Y123.765 E.04799
G1 X89.078 Y123.765 E.01674
G1 X90.71 Y125.397 E.07167
G1 X90.71 Y125.936 E.01674
G1 X88.539 Y123.765 E.09535
G1 X88 Y123.765 E.01674
G1 X90.71 Y126.475 E.11903
G1 X90.71 Y127.014 E.01674
G1 X87.461 Y123.765 E.14271
G1 X86.922 Y123.765 E.01674
G1 X90.71 Y127.553 E.16639
G1 X90.71 Y128.092 E.01674
G1 X86.383 Y123.765 E.19007
G1 X85.844 Y123.765 E.01674
G1 X90.71 Y128.631 E.21375
G1 X90.71 Y129.171 E.01674
G1 X85.304 Y123.765 E.23743
G1 X84.765 Y123.765 E.01674
G1 X90.71 Y129.71 E.26111
G1 X90.71 Y130.249 E.01674
G1 X84.226 Y123.765 E.28479
G1 X84.135 Y123.765 E.00283
G1 X84.135 Y124.213 E.01391
G1 X90.71 Y130.788 E.28879
G1 X90.71 Y131.327 E.01674
G1 X84.135 Y124.753 E.28879
G1 X84.135 Y125.292 E.01674
G1 X90.71 Y131.866 E.28879
G1 X90.71 Y132.223 E.0111
G1 X90.539 Y132.234 E.00531
G1 X84.135 Y125.831 E.2813
G1 X84.135 Y126.37 E.01674
G1 X90 Y132.234 E.25762
G1 X89.461 Y132.234 E.01674
G1 X84.135 Y126.909 E.23394
G1 X84.135 Y127.448 E.01674
G1 X88.922 Y132.234 E.21026
G1 X88.383 Y132.234 E.01674
G1 X84.135 Y127.987 E.18658
G1 X84.135 Y128.526 E.01674
G1 X87.844 Y132.234 E.1629
G1 X87.305 Y132.234 E.01674
G1 X84.135 Y129.065 E.13922
G1 X84.135 Y129.604 E.01674
G1 X86.766 Y132.234 E.11554
G1 X86.226 Y132.234 E.01674
G1 X84.135 Y130.143 E.09186
G1 X84.135 Y130.682 E.01674
G1 X85.687 Y132.234 E.06818
G1 X85.148 Y132.234 E.01674
G1 X84.135 Y131.221 E.0445
G1 X84.135 Y131.76 E.01674
G1 X84.779 Y132.404 E.02828
; WIPE_START
G1 X84.135 Y131.76 E-.34594
G1 X84.135 Y131.221 E-.20485
G1 X84.525 Y131.611 E-.20922
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.95 Y134.678 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X86.95 Y133.7 E.03245
G1 X86.3 Y133.7 E.02156
G1 X87.373 Y132.627 E.05034
G1 X88.951 Y132.627 E.05232
G1 X91.874 Y135.55 E.13713
G1 X92.126 Y135.55 E.00838
G1 X95.049 Y132.627 E.13713
G1 X96.627 Y132.627 E.05232
G1 X97.7 Y133.7 E.05034
G1 X97.05 Y133.7 E.02156
G1 X97.05 Y134.678 E.03245
M204 S10000
G1 X92.898 Y125.473 F42000
G1 F8843.478
M204 S6000
G1 X92.898 Y127.102 E.05401
G1 X91.102 Y128.898 E.0843
G1 X91.102 Y127.102 E.05961
G1 X92.898 Y128.898 E.0843
G1 X92.898 Y130.527 E.05401
; WIPE_START
G1 X92.898 Y128.898 E-.61876
G1 X92.636 Y128.636 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.697 Y134.455 Z6.6 F42000
G1 X86.406 Y135.975 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280483
G1 F15000
M204 S6000
G1 X81.613 Y135.975 E.09278
G3 X81.384 Y135.964 I-.002 J-2.338 E.00445
; LINE_WIDTH: 0.244226
G1 X81.271 Y135.949 E.00187
; LINE_WIDTH: 0.21581
G1 X81.107 Y135.919 E.00235
; LINE_WIDTH: 0.18795
G1 X80.943 Y135.888 E.00197
M204 S10000
G1 X80.947 Y135.875 F42000
; LINE_WIDTH: 0.105528
G1 F15000
M204 S6000
G1 X81.687 Y136.094 E.00394
; WIPE_START
G1 X80.947 Y135.875 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.6 I.839 J.881 P1  F42000
G1 X97.594 Y120.025 Z6.6
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.279758
G1 F15000
M204 S6000
G1 X102.405 Y120.025 E.09284
G3 X102.67 Y120.042 I-.005 J2.178 E.00514
; LINE_WIDTH: 0.232022
G1 X103.048 Y120.098 E.00589
M204 S10000
G1 X103.053 Y120.125 F42000
; LINE_WIDTH: 0.10547
G1 F15000
M204 S6000
G1 X102.315 Y119.906 E.00393
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X103.053 Y120.125 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 32/42
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
M106 S198.9
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z6.6 I-.025 J1.217 P1  F42000
G1 X155.802 Y121.223 Z6.6
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X152.603 Y121.223 E.1061
G3 X153.608 Y120.102 I1.007 J-.108 E.05628
G1 X174.402 Y120.102 E.68977
G3 X175.403 Y121.223 I-.016 J1.022 E.056
G1 X172.198 Y121.223 E.10633
G1 X172.198 Y134.777 E.44962
G1 X175.396 Y134.777 E.1061
G3 X174.392 Y135.898 I-1.007 J.108 E.05628
G1 X153.615 Y135.898 E.68922
G3 X152.603 Y134.777 I-.007 J-1.01 E.05656
G1 X155.802 Y134.777 E.1061
G1 X155.802 Y121.283 E.44763
M204 S250
G1 X155.41 Y121.615 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X154.697 Y121.615 E.02189
G1 X154.69 Y121.815 E.00615
G1 X154.31 Y121.815 E.01169
G1 X154.305 Y121.615 E.00615
G1 X153.497 Y121.615 E.02482
G1 X153.49 Y121.815 E.00615
G1 X153.11 Y121.815 E.01169
G1 X153.105 Y121.615 E.00615
G1 X152.21 Y121.615 E.02749
G3 X152.217 Y120.966 I4.542 J-.282 E.01995
G3 X153.603 Y119.71 I1.394 J.145 E.06294
G1 X174.412 Y119.71 E.6394
G3 X175.79 Y121.105 I-.021 J1.399 E.06676
G1 X175.79 Y121.615 E.01566
G1 X174.897 Y121.615 E.02742
G1 X174.89 Y121.815 E.00615
G1 X174.51 Y121.815 E.01169
G1 X174.505 Y121.615 E.00615
G1 X173.695 Y121.615 E.02491
G1 X173.69 Y121.815 E.00614
G1 X173.31 Y121.814 E.01169
G1 X173.303 Y121.615 E.00613
G1 X172.59 Y121.615 E.02189
G1 X172.59 Y134.385 E.39239
G1 X173.302 Y134.385 E.02189
G1 X173.31 Y134.185 E.00615
G1 X173.69 Y134.185 E.01169
G1 X173.695 Y134.385 E.00615
G1 X174.502 Y134.385 E.02482
G1 X174.51 Y134.185 E.00615
G1 X174.89 Y134.185 E.01169
G1 X174.895 Y134.385 E.00615
G1 X175.789 Y134.385 E.0275
G3 X175.774 Y135.106 I-3.765 J.282 E.0222
G3 X174.397 Y136.29 I-1.385 J-.218 E.0607
G1 X153.605 Y136.29 E.63887
G3 X152.212 Y134.971 I.004 J-1.4 E.06497
G1 X152.21 Y134.385 E.01799
G1 X153.102 Y134.385 E.02741
G1 X153.11 Y134.185 E.00615
G1 X153.49 Y134.185 E.01169
G1 X153.495 Y134.385 E.00615
G1 X154.305 Y134.385 E.02491
G1 X154.31 Y134.185 E.00614
G1 X154.69 Y134.186 E.01169
G1 X154.697 Y134.385 E.00613
G1 X155.41 Y134.385 E.02189
G1 X155.41 Y121.675 E.39054
; WIPE_START
M204 S6000
G1 X154.697 Y121.615 E-.27171
G1 X154.69 Y121.815 E-.07605
G1 X154.31 Y121.815 E-.14456
G1 X154.305 Y121.615 E-.07602
G1 X153.801 Y121.615 E-.19166
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
G1 X154.145 Y120.875 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X155.773 Y120.875 E.05401
G1 X156.198 Y120.45 E.0199
G1 X156.45 Y120.45 E.00838
G1 X159.323 Y123.323 E.13478
G1 X161.001 Y123.323 E.05563
G1 X163.874 Y120.451 E.13477
G1 X164.126 Y120.451 E.00839
G1 X166.999 Y123.323 E.13477
G1 X168.677 Y123.323 E.05563
G1 X171.549 Y120.451 E.13477
G1 X171.803 Y120.451 E.0084
G1 X172.227 Y120.875 E.01989
G1 X173.855 Y120.875 E.05401
; WIPE_START
G1 X172.227 Y120.875 E-.61876
G1 X171.964 Y120.612 E-.14124
; WIPE_END
M73 P78 R5
G1 E-.04 F1800
M204 S10000
G1 X165.121 Y123.901 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42653
G1 F9384.531
M204 S6000
G1 X165.307 Y123.715 E.00822
G1 X165.849 Y123.715 E.01696
G1 X165.29 Y124.274 E.0247
G1 X165.29 Y124.817 E.01696
G1 X166.392 Y123.715 E.04869
G1 X166.934 Y123.715 E.01696
G1 X165.29 Y125.359 E.07267
G1 X165.29 Y125.902 E.01696
G1 X167.477 Y123.715 E.09665
G1 X168.019 Y123.715 E.01696
G1 X165.29 Y126.444 E.12064
G1 X165.29 Y126.987 E.01696
G1 X168.562 Y123.715 E.14462
G1 X169.104 Y123.715 E.01696
G1 X165.29 Y127.529 E.1686
G1 X165.29 Y128.072 E.01696
G1 X169.647 Y123.715 E.19258
G1 X170.189 Y123.715 E.01696
G1 X165.29 Y128.614 E.21657
G1 X165.29 Y129.157 E.01696
G1 X170.732 Y123.715 E.24055
G1 X171.274 Y123.715 E.01696
G1 X165.29 Y129.699 E.26453
G1 X165.29 Y130.242 E.01696
G1 X171.817 Y123.715 E.28852
G1 X171.865 Y123.715 E.0015
G1 X171.865 Y124.21 E.01546
G1 X165.29 Y130.784 E.29063
G1 X165.29 Y131.327 E.01696
G1 X171.865 Y124.753 E.29063
G1 X171.865 Y125.295 E.01696
G1 X165.29 Y131.869 E.29063
G1 X165.29 Y132.273 E.01262
G1 X165.418 Y132.284 E.004
G1 X171.865 Y125.838 E.285
G1 X171.865 Y126.38 E.01696
G1 X165.96 Y132.284 E.26102
G1 X166.503 Y132.284 E.01696
G1 X171.865 Y126.923 E.23703
G1 X171.865 Y127.465 E.01696
G1 X167.045 Y132.284 E.21305
G1 X167.588 Y132.284 E.01696
G1 X171.865 Y128.008 E.18907
G1 X171.865 Y128.55 E.01696
G1 X168.13 Y132.284 E.16509
G1 X168.673 Y132.284 E.01696
G1 X171.865 Y129.093 E.1411
G1 X171.865 Y129.635 E.01696
G1 X169.215 Y132.284 E.11712
G1 X169.758 Y132.284 E.01696
G1 X171.865 Y130.178 E.09314
G1 X171.865 Y130.72 E.01696
G1 X170.3 Y132.284 E.06915
G1 X170.843 Y132.284 E.01696
G1 X171.865 Y131.263 E.04517
G1 X171.865 Y131.805 E.01696
G1 X171.216 Y132.454 E.02869
; WIPE_START
G1 X171.865 Y131.805 E-.34876
G1 X171.865 Y131.263 E-.20615
G1 X171.483 Y131.644 E-.20509
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X173.855 Y135.125 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X172.227 Y135.125 E.05401
G1 X171.802 Y135.55 E.01991
G1 X171.55 Y135.55 E.00838
G1 X168.677 Y132.677 E.13478
G1 X166.999 Y132.677 E.05563
G1 X164.126 Y135.55 E.13478
G1 X163.874 Y135.55 E.00838
G1 X161.001 Y132.677 E.13478
G1 X159.323 Y132.677 E.05563
G1 X156.45 Y135.55 E.13478
G1 X156.198 Y135.55 E.00838
G1 X155.773 Y135.125 E.01991
G1 X154.145 Y135.125 E.05401
; WIPE_START
G1 X155.773 Y135.125 E-.61876
G1 X156.036 Y135.388 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X162.524 Y132.454 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42653
G1 F9384.531
M204 S6000
G1 X162.709 Y132.268 E.00821
G1 X162.709 Y131.726 E.01696
G1 X162.151 Y132.284 E.02469
G1 X161.608 Y132.284 E.01696
G1 X162.709 Y131.183 E.04868
G1 X162.709 Y130.641 E.01696
G1 X161.066 Y132.284 E.07266
G1 X160.523 Y132.284 E.01696
G1 X162.709 Y130.098 E.09664
G1 X162.709 Y129.556 E.01696
G1 X159.981 Y132.284 E.12062
G1 X159.438 Y132.284 E.01696
G1 X162.709 Y129.013 E.14461
G1 X162.709 Y128.471 E.01696
G1 X158.896 Y132.284 E.16859
G1 X158.353 Y132.284 E.01696
G1 X162.709 Y127.928 E.19257
G1 X162.709 Y127.386 E.01696
G1 X157.811 Y132.284 E.21656
G1 X157.268 Y132.284 E.01696
G1 X162.709 Y126.843 E.24054
G1 X162.709 Y126.301 E.01696
G1 X156.726 Y132.284 E.26452
G1 X156.183 Y132.284 E.01696
G1 X162.709 Y125.758 E.2885
G1 X162.709 Y125.216 E.01696
G1 X156.135 Y131.79 E.29063
G1 X156.135 Y131.248 E.01696
G1 X162.709 Y124.673 E.29063
G1 X162.709 Y124.131 E.01696
G1 X156.135 Y130.705 E.29063
G1 X156.135 Y130.163 E.01696
G1 X162.582 Y123.715 E.28501
G1 X162.04 Y123.715 E.01696
G1 X156.135 Y129.62 E.26103
G1 X156.135 Y129.078 E.01696
G1 X161.497 Y123.715 E.23704
G1 X160.955 Y123.715 E.01696
G1 X156.135 Y128.535 E.21306
G1 X156.135 Y127.993 E.01696
G1 X160.412 Y123.715 E.18908
G1 X159.87 Y123.715 E.01696
G1 X156.135 Y127.45 E.1651
G1 X156.135 Y126.908 E.01696
G1 X159.327 Y123.715 E.14111
G1 X158.785 Y123.715 E.01696
G1 X156.135 Y126.365 E.11713
G1 X156.135 Y125.823 E.01696
G1 X158.242 Y123.715 E.09315
G1 X157.7 Y123.715 E.01696
G1 X156.135 Y125.28 E.06917
G1 X156.135 Y124.738 E.01696
G1 X157.157 Y123.715 E.04518
G1 X156.615 Y123.715 E.01696
G1 X155.966 Y124.365 E.0287
M204 S10000
G1 X163.102 Y125.473 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X163.102 Y127.102 E.05401
G1 X164.898 Y128.898 E.0843
G1 X164.898 Y127.102 E.05961
G1 X163.102 Y128.898 E.0843
G1 X163.102 Y130.527 E.05401
; OBJECT_ID: 405
; WIPE_START
G1 X163.102 Y128.898 E-.61876
G1 X163.364 Y128.636 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z6.8 I.203 J-1.2 P1  F42000
G1 X119.802 Y121.273 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X116.602 Y121.273 E.10615
G3 X117.553 Y120.104 I1.012 J-.148 E.0562
G1 X136.198 Y120.102 E.61847
G1 X136.198 Y134.727 E.48514
G1 X139.398 Y134.727 E.10615
G3 X138.449 Y135.896 I-1.013 J.147 E.05611
G1 X119.802 Y135.898 E.61855
G1 X119.802 Y121.333 E.48315
M204 S250
G1 X119.41 Y121.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X116.21 Y121.665 E.09833
G3 X116.252 Y120.763 I3.689 J-.281 E.02782
G3 X117.533 Y119.712 I1.354 J.344 E.0545
G1 X136.59 Y119.71 E.58558
G1 X136.59 Y134.335 E.44939
G1 X139.79 Y134.335 E.09833
G3 X139.73 Y135.305 I-3.32 J.28 E.02997
G3 X138.468 Y136.288 I-1.342 J-.422 E.05226
G1 X119.41 Y136.29 E.58561
G1 X119.41 Y121.725 E.44754
; WIPE_START
M204 S6000
G1 X117.41 Y121.688 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.789 Y123.571 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42888
G1 F9327.39
M204 S6000
G1 X120.135 Y124.225 E.0291
G1 X120.135 Y124.771 E.01717
G1 X121.166 Y123.74 E.04583
G1 X121.711 Y123.74 E.01717
G1 X120.135 Y125.317 E.07011
G1 X120.135 Y125.863 E.01717
G1 X122.257 Y123.74 E.09439
G1 X122.803 Y123.74 E.01717
G1 X120.135 Y126.408 E.11866
G1 X120.135 Y126.954 E.01717
G1 X123.349 Y123.74 E.14294
G1 X123.895 Y123.74 E.01717
G1 X120.135 Y127.5 E.16722
G1 X120.135 Y128.046 E.01717
G1 X124.441 Y123.74 E.1915
G1 X124.986 Y123.74 E.01717
G1 X120.135 Y128.592 E.21577
G1 X120.135 Y129.138 E.01717
G1 X125.532 Y123.74 E.24005
G1 X126.078 Y123.74 E.01717
G1 X120.135 Y129.683 E.26433
G1 X120.135 Y130.229 E.01717
G1 X126.624 Y123.74 E.28861
G1 X126.709 Y123.752 E.00271
G1 X126.709 Y124.201 E.01412
G1 X120.135 Y130.775 E.29241
G1 X120.135 Y131.321 E.01717
G1 X126.709 Y124.747 E.29241
G1 X126.709 Y125.292 E.01717
G1 X120.135 Y131.867 E.29241
G1 X120.135 Y132.413 E.01717
G1 X126.709 Y125.838 E.29241
G1 X126.709 Y126.384 E.01717
G1 X120.135 Y132.958 E.29241
G1 X120.135 Y133.504 E.01717
G1 X126.709 Y126.93 E.29241
G1 X126.709 Y127.476 E.01717
G1 X120.135 Y134.05 E.29241
G1 X120.135 Y134.596 E.01717
G1 X126.709 Y128.022 E.29241
G1 X126.709 Y128.567 E.01717
G1 X120.135 Y135.142 E.29241
G1 X120.135 Y135.565 E.0133
G1 X120.258 Y135.565 E.00386
G1 X126.709 Y129.113 E.28695
G1 X126.709 Y129.659 E.01717
G1 X120.804 Y135.565 E.26267
G1 X121.35 Y135.565 E.01717
G1 X126.709 Y130.205 E.23839
G1 X126.709 Y130.751 E.01717
G1 X121.726 Y135.734 E.22166
M204 S10000
G1 X124.455 Y135.734 F42000
G1 F9327.39
M204 S6000
G1 X125.109 Y135.08 E.02909
G1 X125.109 Y134.534 E.01717
G1 X124.079 Y135.564 E.04582
G1 X123.533 Y135.564 E.01717
G1 X125.109 Y133.988 E.0701
G1 X125.109 Y133.442 E.01717
G1 X122.987 Y135.564 E.09438
G1 X122.442 Y135.564 E.01717
G1 X125.109 Y132.897 E.11866
G1 X125.109 Y132.463 E.01365
G1 X125.313 Y132.259 E.00904
G1 X125.747 Y132.259 E.01365
G1 X126.709 Y131.297 E.04283
G1 X126.709 Y131.842 E.01717
G1 X126.123 Y132.429 E.0261
M204 S10000
G1 X128.898 Y130.527 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X128.898 Y128.898 E.05401
G1 X127.102 Y127.102 E.0843
G1 X127.102 Y128.898 E.05961
G1 X128.898 Y127.102 E.0843
G1 X128.898 Y123.589 E.1165
G1 X129.139 Y123.348 E.01131
G1 X130.498 Y123.348 E.04508
G1 X130.498 Y122.822 E.01745
G1 X128.127 Y120.451 E.11124
G1 X127.873 Y120.451 E.00844
G1 X124.976 Y123.348 E.13592
G1 X123.348 Y123.348 E.05398
G1 X120.452 Y120.452 E.13588
G1 X120.196 Y120.452 E.00849
G1 X119.723 Y120.925 E.02217
G1 X118.095 Y120.925 E.05401
; WIPE_START
G1 X119.723 Y120.925 E-.61876
G1 X119.986 Y120.662 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.07 Y123.504 Z6.8 F42000
G1 X129.121 Y124.328 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42888
G1 F9327.39
M204 S6000
G1 X129.708 Y123.74 E.02611
G1 X130.254 Y123.74 E.01717
G1 X129.121 Y124.873 E.05039
M204 S10000
G1 X130.721 Y121.09 F42000
G1 F9327.39
M204 S6000
G1 X131.375 Y120.436 E.0291
G1 X131.921 Y120.436 E.01717
G1 X130.89 Y121.466 E.04584
G1 X130.89 Y122.012 E.01717
G1 X132.467 Y120.436 E.07012
G1 X133.013 Y120.436 E.01717
G1 X130.89 Y122.558 E.0944
G1 X130.89 Y123.104 E.01717
G1 X133.559 Y120.436 E.11868
G1 X134.105 Y120.435 E.01717
G1 X129.29 Y125.25 E.21412
G1 X129.29 Y125.795 E.01717
G1 X134.65 Y120.435 E.2384
G1 X135.196 Y120.435 E.01717
G1 X129.29 Y126.341 E.26268
G1 X129.29 Y126.887 E.01717
G1 X135.742 Y120.435 E.28696
G1 X135.865 Y120.435 E.00385
G1 X135.865 Y120.859 E.01331
G1 X129.29 Y127.433 E.29241
G1 X129.29 Y127.979 E.01717
G1 X135.865 Y121.404 E.29241
G1 X135.865 Y121.95 E.01717
G1 X129.29 Y128.525 E.29241
G1 X129.29 Y129.07 E.01717
G1 X135.865 Y122.496 E.29241
G1 X135.865 Y123.042 E.01717
G1 X129.29 Y129.616 E.29241
G1 X129.29 Y130.162 E.01717
G1 X135.865 Y123.588 E.29241
G1 X135.865 Y124.134 E.01717
G1 X129.29 Y130.708 E.29241
G1 X129.29 Y131.254 E.01717
G1 X135.865 Y124.679 E.29241
G1 X135.865 Y125.225 E.01717
G1 X129.29 Y131.8 E.29241
G1 X129.29 Y132.248 E.01411
G1 X129.376 Y132.26 E.00272
G1 X135.865 Y125.771 E.28859
G1 X135.865 Y126.317 E.01717
G1 X129.922 Y132.26 E.26432
G1 X130.468 Y132.26 E.01717
G1 X135.865 Y126.863 E.24004
G1 X135.865 Y127.409 E.01717
G1 X131.014 Y132.26 E.21576
G1 X131.56 Y132.26 E.01717
G1 X135.865 Y127.954 E.19148
G1 X135.865 Y128.5 E.01717
G1 X132.106 Y132.26 E.16721
G1 X132.651 Y132.259 E.01717
G1 X135.865 Y129.046 E.14293
G1 X135.865 Y129.592 E.01717
G1 X133.197 Y132.259 E.11865
G1 X133.743 Y132.259 E.01717
G1 X135.865 Y130.138 E.09437
G1 X135.865 Y130.684 E.01717
G1 X134.289 Y132.259 E.0701
G1 X134.835 Y132.259 E.01717
G1 X135.865 Y131.229 E.04582
G1 X135.865 Y131.775 E.01717
G1 X135.211 Y132.429 E.02909
; WIPE_START
G1 X135.865 Y131.775 E-.35144
G1 X135.865 Y131.229 E-.20742
G1 X135.49 Y131.604 E-.20115
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.905 Y135.075 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X136.277 Y135.075 E.05401
G1 X135.804 Y135.548 E.02217
G1 X135.548 Y135.548 E.00849
G1 X132.652 Y132.652 E.13588
G1 X131.024 Y132.652 E.05398
G1 X128.127 Y135.549 E.13592
G1 X127.873 Y135.549 E.00844
G1 X125.502 Y133.178 E.11124
G1 X125.502 Y132.652 E.01745
G1 X126.604 Y132.652 E.03657
; OBJECT_ID: 394
; WIPE_START
G1 X125.502 Y132.652 E-.4189
G1 X125.502 Y133.178 E-.19987
G1 X125.764 Y133.44 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z6.8 I-.043 J-1.216 P1  F42000
G1 X97.79 Y134.44 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X103.41 Y134.44 E.17269
G1 X103.41 Y135.66 E.03749
G1 X97.79 Y135.66 E.17269
G1 X97.79 Y134.5 E.03564
; WIPE_START
M204 S6000
G1 X99.79 Y134.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.622 Y126.936 Z6.8 F42000
G1 X97.79 Y121.56 Z6.8
M73 P79 R5
G1 Z6.4
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X97.79 Y120.34 E.03749
G1 X103.41 Y120.34 E.17269
G1 X103.41 Y121.56 E.03749
G1 X97.85 Y121.56 E.17084
M204 S10000
G1 X97.398 Y121.56 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.398 Y121.952 E.01301
G1 X100.198 Y121.952 E.09288
G1 X100.198 Y134.048 E.40124
G1 X97.398 Y134.048 E.09288
G1 X97.398 Y135.898 E.06137
G1 X86.602 Y135.898 E.35812
G1 X86.602 Y134.048 E.06137
G1 X83.802 Y134.048 E.09288
G1 X83.802 Y121.952 E.40124
G1 X86.602 Y121.952 E.09288
G1 X86.602 Y120.102 E.06136
G1 X97.398 Y120.102 E.35812
G1 X97.398 Y121.5 E.04636
; WIPE_START
G1 X97.398 Y121.952 E-.17179
G1 X98.946 Y121.952 E-.58821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.317 Y121.717 Z6.8 F42000
G1 X86.21 Y121.56 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X80.59 Y121.56 E.17269
G1 X80.59 Y120.34 E.03749
G1 X86.21 Y120.34 E.17269
G1 X86.21 Y121.5 E.03564
; WIPE_START
M204 S6000
G1 X84.21 Y121.521 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.378 Y129.064 Z6.8 F42000
G1 X86.21 Y134.44 Z6.8
G1 Z6.4
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X86.21 Y135.66 E.03749
G1 X80.59 Y135.66 E.17269
G1 X80.59 Y134.44 E.03749
G1 X86.15 Y134.44 E.17084
; WIPE_START
M204 S6000
G1 X86.21 Y135.66 E-.46416
G1 X85.431 Y135.66 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.034 Y134.983 Z6.8 F42000
G1 X100.59 Y134.31 Z6.8
G1 Z6.4
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X103.56 Y134.31 E.09126
G1 X103.56 Y133.835 E.0146
G1 X103.79 Y133.835 E.00706
G1 X103.788 Y134.968 E.03482
G3 X102.397 Y136.29 I-1.406 J-.086 E.06487
G1 X81.605 Y136.29 E.63887
G3 X80.21 Y134.897 I.012 J-1.407 E.06712
G1 X80.21 Y133.835 E.03264
G1 X80.44 Y133.835 E.00707
G1 X80.44 Y134.31 E.0146
G1 X83.41 Y134.31 E.09126
G1 X83.41 Y121.69 E.38778
G1 X80.44 Y121.69 E.09126
G1 X80.44 Y122.165 E.0146
G1 X80.21 Y122.165 E.00706
G1 X80.212 Y121.032 E.03482
G3 X81.603 Y119.71 I1.398 J.078 E.06496
G1 X102.412 Y119.71 E.6394
G3 X103.79 Y121.105 I-.012 J1.391 E.06687
G1 X103.79 Y122.165 E.03256
G1 X103.56 Y122.165 E.00707
G1 X103.56 Y121.69 E.0146
G1 X100.59 Y121.69 E.09126
G1 X100.59 Y134.25 E.38593
; WIPE_START
M204 S6000
G1 X102.59 Y134.29 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.328 Y133.7 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.7 Y133.7 E.05401
G1 X86.3 Y122.3 E.53477
G1 X84.15 Y122.3 E.07132
G1 X84.15 Y127.826 E.18331
G1 X91.874 Y135.55 E.36232
G1 X92.126 Y135.55 E.00838
G1 X99.85 Y127.826 E.36232
G1 X99.85 Y128.174 E.01153
G1 X92.126 Y120.451 E.36231
G1 X91.874 Y120.451 E.00839
G1 X84.15 Y128.174 E.36231
G1 X84.15 Y133.7 E.18331
G1 X86.3 Y133.7 E.07132
G1 X97.7 Y122.3 E.53477
G1 X99.328 Y122.3 E.05401
; WIPE_START
G1 X97.7 Y122.3 E-.61876
G1 X97.437 Y122.563 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.594 Y120.025 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279459
G1 F15000
M204 S6000
G1 X102.404 Y120.025 E.0927
G3 X102.717 Y120.049 I-.019 J2.359 E.00607
; LINE_WIDTH: 0.211159
G1 X103.056 Y120.109 E.00472
; WIPE_START
G1 X102.717 Y120.049 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.881 Y127.679 Z6.8 F42000
G1 X103.057 Y135.892 Z6.8
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.212965
G1 F15000
M204 S6000
G1 X102.727 Y135.95 E.00464
; LINE_WIDTH: 0.260107
G3 X102.448 Y135.974 I-.367 J-2.58 E.00496
; LINE_WIDTH: 0.280112
G1 X97.594 Y135.975 E.09382
M204 S10000
G1 X86.406 Y135.975 F42000
; LINE_WIDTH: 0.280483
G1 F15000
M204 S6000
G1 X81.613 Y135.975 E.09278
G3 X81.384 Y135.964 I-.002 J-2.336 E.00445
; LINE_WIDTH: 0.244359
G1 X81.272 Y135.95 E.00186
; LINE_WIDTH: 0.211727
G1 X81.167 Y135.931 E.00146
; LINE_WIDTH: 0.182876
G1 X80.945 Y135.884 E.00259
; WIPE_START
G1 X81.167 Y135.931 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.059 Y128.3 Z6.8 F42000
G1 X80.943 Y120.109 Z6.8
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.207672
G1 F15000
M204 S6000
G1 X81.236 Y120.056 E.00399
; LINE_WIDTH: 0.232961
G1 X81.334 Y120.042 E.00154
; LINE_WIDTH: 0.279468
G3 X81.552 Y120.026 I.273 J2.219 E.00422
G1 X86.406 Y120.025 E.09356
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X84.406 Y120.025 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 33/42
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
M106 S201.45
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z6.8 I-.02 J1.217 P1  F42000
G1 X155.802 Y121.223 Z6.8
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X152.603 Y121.223 E.1061
M73 P79 R4
G3 X153.614 Y120.102 I1.004 J-.111 E.05654
G1 X174.4 Y120.102 E.6895
G3 X175.403 Y121.223 I-.012 J1.021 E.05609
G1 X172.198 Y121.223 E.10633
G1 X172.198 Y134.777 E.44962
G1 X175.397 Y134.777 E.1061
G3 X174.385 Y135.898 I-1.012 J.104 E.05643
G1 X153.615 Y135.898 E.68898
G3 X152.603 Y134.777 I-.009 J-1.009 E.05659
G1 X155.802 Y134.777 E.1061
G1 X155.802 Y121.283 E.44763
M204 S250
G1 X155.41 Y121.615 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X154.697 Y121.615 E.02189
G1 X154.69 Y121.815 E.00615
G1 X154.31 Y121.815 E.01169
G1 X154.305 Y121.615 E.00615
G1 X153.497 Y121.615 E.02482
G1 X153.49 Y121.815 E.00615
G1 X153.11 Y121.815 E.01169
G1 X153.105 Y121.615 E.00615
G1 X152.21 Y121.615 E.0275
G3 X152.217 Y120.966 I4.538 J-.282 E.01995
G3 X153.605 Y119.71 I1.394 J.145 E.06301
G1 X174.41 Y119.71 E.63928
G3 X175.79 Y121.105 I-.016 J1.395 E.06687
G1 X175.79 Y121.615 E.01566
G1 X174.897 Y121.615 E.02743
G1 X174.89 Y121.815 E.00615
G1 X174.51 Y121.815 E.01169
G1 X174.505 Y121.615 E.00615
G1 X173.695 Y121.615 E.02491
G1 X173.69 Y121.815 E.00614
G1 X173.31 Y121.814 E.01169
G1 X173.303 Y121.615 E.00613
G1 X172.59 Y121.615 E.02189
G1 X172.59 Y134.385 E.39239
G1 X173.303 Y134.385 E.02189
G1 X173.31 Y134.185 E.00615
G1 X173.69 Y134.185 E.01169
G1 X173.695 Y134.385 E.00615
G1 X174.503 Y134.385 E.02483
G1 X174.51 Y134.185 E.00615
G1 X174.89 Y134.185 E.01169
G1 X174.895 Y134.385 E.00615
G1 X175.789 Y134.385 E.0275
G3 X175.783 Y135.034 I-4.543 J.282 E.01995
G3 X174.395 Y136.29 I-1.394 J-.145 E.06302
G1 X153.605 Y136.29 E.6388
G3 X152.212 Y134.97 I.006 J-1.402 E.06497
G1 X152.21 Y134.385 E.01797
G1 X153.103 Y134.385 E.02741
G1 X153.11 Y134.185 E.00615
G1 X153.49 Y134.185 E.01169
G1 X153.495 Y134.385 E.00615
G1 X154.305 Y134.385 E.02491
G1 X154.31 Y134.185 E.00614
G1 X154.69 Y134.186 E.01169
G1 X154.697 Y134.385 E.00613
G1 X155.41 Y134.385 E.02189
G1 X155.41 Y121.675 E.39054
; WIPE_START
M204 S6000
G1 X154.697 Y121.615 E-.27172
G1 X154.69 Y121.815 E-.07605
G1 X154.31 Y121.815 E-.14456
G1 X154.305 Y121.615 E-.07602
G1 X153.801 Y121.615 E-.19165
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
G1 X171.85 Y122.126 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X171.85 Y120.875 E.04151
G1 X172.227 Y120.875 E.0125
G1 X171.803 Y120.451 E.01989
G1 X171.549 Y120.451 E.0084
G1 X156.45 Y135.55 E.70833
G1 X156.198 Y135.55 E.00838
G1 X155.773 Y135.125 E.01991
G1 X156.15 Y135.125 E.0125
G1 X156.15 Y128.174 E.2306
G1 X163.874 Y120.451 E.36231
G1 X164.126 Y120.451 E.00839
G1 X171.85 Y128.174 E.36231
G1 X171.85 Y127.826 E.01153
G1 X164.126 Y135.55 E.36232
G1 X163.874 Y135.55 E.00838
G1 X156.15 Y127.826 E.36232
G1 X156.15 Y120.875 E.2306
G1 X155.773 Y120.875 E.0125
G1 X156.198 Y120.45 E.0199
G1 X156.45 Y120.45 E.00838
G1 X171.55 Y135.55 E.70834
G1 X171.802 Y135.55 E.00838
G1 X172.227 Y135.125 E.01991
G1 X171.85 Y135.125 E.0125
G1 X171.85 Y133.874 E.04151
; OBJECT_ID: 405
; WIPE_START
G1 X171.85 Y135.125 E-.47554
G1 X172.227 Y135.125 E-.14322
G1 X171.964 Y135.388 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X164.596 Y133.394 Z7 F42000
G1 X119.802 Y121.273 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X116.602 Y121.273 E.10615
G3 X117.546 Y120.104 I1.012 J-.149 E.05598
G1 X136.198 Y120.102 E.61872
G1 X136.198 Y134.727 E.48514
G1 X139.398 Y134.727 E.10615
G3 X138.456 Y135.896 I-1.016 J.146 E.05585
G1 X119.802 Y135.898 E.6188
G1 X119.802 Y121.333 E.48315
M204 S250
G1 X119.41 Y121.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X116.21 Y121.665 E.09833
G3 X116.256 Y120.748 I3.573 J-.281 E.02828
G3 X117.53 Y119.712 I1.349 J.357 E.05396
G1 X136.59 Y119.71 E.58566
G1 X136.59 Y134.335 E.44939
G1 X139.79 Y134.335 E.09833
G3 X139.745 Y135.249 I-3.655 J.278 E.0282
G3 X138.471 Y136.288 I-1.357 J-.364 E.05397
G1 X119.41 Y136.29 E.58568
G1 X119.41 Y121.725 E.44754
; WIPE_START
M204 S6000
G1 X117.41 Y121.688 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.043 Y121.725 Z7 F42000
G1 X135.85 Y121.779 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X135.85 Y120.45 E.04406
G1 X135.55 Y120.45 E.00996
G1 X120.45 Y135.55 E.70833
G1 X120.15 Y135.55 E.00996
G1 X120.15 Y128.174 E.24467
G1 X127.873 Y120.451 E.36228
G1 X128.127 Y120.451 E.00844
G1 X135.85 Y128.174 E.36228
G1 X135.85 Y127.826 E.01153
G1 X128.127 Y135.549 E.36228
G1 X127.873 Y135.549 E.00844
G1 X120.15 Y127.826 E.36228
G1 X120.15 Y120.925 E.22894
G1 X119.723 Y120.925 E.01416
G1 X120.196 Y120.452 E.02217
G1 X120.452 Y120.452 E.00849
G1 X135.548 Y135.548 E.70819
G1 X135.804 Y135.548 E.00849
G1 X136.277 Y135.075 E.02217
G1 X135.85 Y135.075 E.01416
G1 X135.85 Y133.874 E.03985
; OBJECT_ID: 394
; WIPE_START
G1 X135.85 Y135.075 E-.45654
G1 X136.277 Y135.075 E-.16222
G1 X136.014 Y135.338 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X128.383 Y135.159 Z7 F42000
G1 X97.79 Y134.44 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X103.41 Y134.44 E.17269
G1 X103.41 Y135.66 E.03749
G1 X97.79 Y135.66 E.17269
G1 X97.79 Y134.5 E.03564
; WIPE_START
M204 S6000
G1 X99.79 Y134.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.622 Y126.936 Z7 F42000
G1 X97.79 Y121.56 Z7
G1 Z6.6
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X97.79 Y120.34 E.03749
G1 X103.41 Y120.34 E.17269
G1 X103.41 Y121.56 E.03749
G1 X97.85 Y121.56 E.17084
M204 S10000
G1 X97.398 Y121.56 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.398 Y121.952 E.01301
G1 X100.198 Y121.952 E.09288
G1 X100.198 Y134.048 E.40124
G1 X97.398 Y134.048 E.09288
G1 X97.398 Y135.898 E.06137
G1 X86.602 Y135.898 E.35812
G1 X86.602 Y134.048 E.06137
G1 X83.802 Y134.048 E.09288
G1 X83.802 Y121.952 E.40124
G1 X86.602 Y121.952 E.09288
G1 X86.602 Y120.102 E.06136
G1 X97.398 Y120.102 E.35812
G1 X97.398 Y121.5 E.04636
; WIPE_START
G1 X97.398 Y121.952 E-.17179
G1 X98.946 Y121.952 E-.58821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.317 Y121.717 Z7 F42000
G1 X86.21 Y121.56 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
M73 P80 R4
G1 X80.59 Y121.56 E.17269
G1 X80.59 Y120.34 E.03749
G1 X86.21 Y120.34 E.17269
G1 X86.21 Y121.5 E.03564
; WIPE_START
M204 S6000
G1 X84.21 Y121.521 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.378 Y129.064 Z7 F42000
G1 X86.21 Y134.44 Z7
G1 Z6.6
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X86.21 Y135.66 E.03749
G1 X80.59 Y135.66 E.17269
G1 X80.59 Y134.44 E.03749
G1 X86.15 Y134.44 E.17084
; WIPE_START
M204 S6000
G1 X86.21 Y135.66 E-.46416
G1 X85.431 Y135.66 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.034 Y134.983 Z7 F42000
G1 X100.59 Y134.31 Z7
G1 Z6.6
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X103.56 Y134.31 E.09126
G1 X103.56 Y133.835 E.0146
G1 X103.79 Y133.835 E.00706
G1 X103.788 Y134.968 E.03482
G3 X102.395 Y136.29 I-1.398 J-.078 E.06504
G1 X81.605 Y136.29 E.6388
G3 X80.21 Y134.895 I-.003 J-1.392 E.06739
G1 X80.21 Y133.835 E.03257
G1 X80.44 Y133.835 E.00707
G1 X80.44 Y134.31 E.0146
G1 X83.41 Y134.31 E.09126
G1 X83.41 Y121.69 E.38778
G1 X80.44 Y121.69 E.09126
G1 X80.44 Y122.165 E.0146
G1 X80.21 Y122.165 E.00706
G1 X80.212 Y121.032 E.03482
G3 X81.605 Y119.71 I1.406 J.086 E.06494
G1 X102.41 Y119.71 E.63928
G3 X103.79 Y121.105 I-.011 J1.391 E.06693
G1 X103.79 Y122.165 E.03256
G1 X103.56 Y122.165 E.00707
G1 X103.56 Y121.69 E.0146
G1 X100.59 Y121.69 E.09126
G1 X100.59 Y134.25 E.38593
; WIPE_START
M204 S6000
G1 X102.59 Y134.29 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.725 Y135.95 Z7 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279736
G1 F15000
M204 S6000
G3 X102.387 Y135.975 I-.376 J-2.79 E.00656
G1 X97.594 Y135.975 E.09249
M204 S10000
G1 X102.725 Y135.95 F42000
; LINE_WIDTH: 0.213287
G1 F15000
M204 S6000
G1 X103.057 Y135.892 E.00468
; WIPE_START
G1 X102.725 Y135.95 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.882 Y128.544 Z7 F42000
G1 X99.328 Y122.3 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.7 Y122.3 E.05401
G1 X86.3 Y133.7 E.53477
G1 X84.15 Y133.7 E.07132
G1 X84.15 Y128.174 E.18331
G1 X91.874 Y120.451 E.36231
G1 X92.126 Y120.451 E.00839
G1 X99.85 Y128.174 E.36231
G1 X99.85 Y127.826 E.01153
G1 X92.126 Y135.55 E.36232
G1 X91.874 Y135.55 E.00838
G1 X84.15 Y127.826 E.36232
G1 X84.15 Y122.3 E.18331
G1 X86.3 Y122.3 E.07132
G1 X97.7 Y133.7 E.53477
G1 X99.328 Y133.7 E.05401
; WIPE_START
G1 X97.7 Y133.7 E-.61876
G1 X97.437 Y133.437 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.999 Y135.148 Z7 F42000
G1 X86.406 Y135.975 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280509
G1 F15000
M204 S6000
G1 X81.613 Y135.975 E.09279
G3 X81.39 Y135.964 I-.004 J-2.28 E.00433
; LINE_WIDTH: 0.244327
G1 X81.269 Y135.949 E.002
; LINE_WIDTH: 0.215251
G1 X81.106 Y135.919 E.00233
; LINE_WIDTH: 0.187737
G1 X80.942 Y135.888 E.00196
M204 S10000
G1 X80.946 Y135.876 F42000
; LINE_WIDTH: 0.104945
G1 F15000
M204 S6000
G1 X81.7 Y136.094 E.00396
; WIPE_START
G1 X80.946 Y135.876 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.946 Y128.243 Z7 F42000
G1 X80.947 Y120.12 Z7
G1 Z6.6
G1 E.8 F1800
; LINE_WIDTH: 0.159045
G1 F15000
M204 S6000
G1 X81.847 Y119.906 E.00876
M204 S10000
G1 X81.335 Y120.042 F42000
; LINE_WIDTH: 0.231556
G1 F15000
M204 S6000
G1 X80.952 Y120.098 E.00594
M204 S10000
G1 X81.335 Y120.042 F42000
; LINE_WIDTH: 0.280184
G1 F15000
M204 S6000
G3 X81.613 Y120.025 I.277 J2.29 E.00538
G1 X86.406 Y120.025 E.09267
M204 S10000
G1 X97.594 Y120.025 F42000
; LINE_WIDTH: 0.27955
G1 F15000
M204 S6000
G1 X102.402 Y120.025 E.0927
G3 X102.713 Y120.048 I-.062 J2.994 E.00601
; LINE_WIDTH: 0.215154
G1 X103.057 Y120.108 E.0049
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X102.713 Y120.048 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 34/42
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z7 I-.027 J1.217 P1  F42000
G1 X155.802 Y121.223 Z7
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X152.603 Y121.223 E.1061
G3 X153.608 Y120.102 I1.013 J-.103 E.05618
G1 X174.398 Y120.102 E.68964
G3 X175.401 Y121.223 I-.009 J1.017 E.05614
G1 X172.198 Y121.223 E.10624
G1 X172.198 Y134.777 E.44962
G1 X175.396 Y134.777 E.1061
G3 X174.392 Y135.898 I-1.013 J.102 E.05618
G1 X153.615 Y135.898 E.68922
G3 X152.603 Y134.777 I-.009 J-1.008 E.05659
G1 X155.802 Y134.777 E.1061
G1 X155.802 Y121.283 E.44763
M204 S250
G1 X155.41 Y121.615 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X154.698 Y121.615 E.02189
G1 X154.69 Y121.815 E.00615
G1 X154.31 Y121.815 E.01169
G1 X154.305 Y121.615 E.00615
G1 X153.498 Y121.615 E.02482
G1 X153.49 Y121.815 E.00615
G1 X153.11 Y121.815 E.01169
G1 X153.105 Y121.615 E.00615
G1 X152.21 Y121.615 E.02749
G3 X152.227 Y120.884 I3.595 J-.283 E.02251
G3 X153.603 Y119.71 I1.383 J.228 E.06039
G1 X174.408 Y119.71 E.63928
G3 X175.79 Y121.103 I-.013 J1.395 E.06686
G1 X175.79 Y121.615 E.01574
G1 X174.898 Y121.615 E.02742
G1 X174.89 Y121.815 E.00615
G1 X174.51 Y121.815 E.01169
G1 X174.505 Y121.615 E.00615
G1 X173.695 Y121.615 E.02491
G1 X173.69 Y121.815 E.00614
G1 X173.31 Y121.814 E.01169
G1 X173.303 Y121.615 E.00613
G1 X172.59 Y121.615 E.02189
G1 X172.59 Y134.385 E.39239
G1 X173.302 Y134.385 E.02189
G1 X173.31 Y134.185 E.00615
G1 X173.69 Y134.185 E.01169
G1 X173.695 Y134.385 E.00615
G1 X174.502 Y134.385 E.02482
G1 X174.51 Y134.185 E.00615
G1 X174.89 Y134.185 E.01169
G1 X174.895 Y134.385 E.00615
G1 X175.789 Y134.385 E.0275
G3 X175.773 Y135.116 I-3.595 J.283 E.02251
G3 X174.397 Y136.29 I-1.383 J-.228 E.06039
G1 X153.605 Y136.29 E.63887
G3 X152.212 Y134.97 I.006 J-1.402 E.06497
G1 X152.21 Y134.385 E.01797
G1 X153.102 Y134.385 E.02741
G1 X153.11 Y134.185 E.00615
G1 X153.49 Y134.185 E.01169
G1 X153.495 Y134.385 E.00615
G1 X154.305 Y134.385 E.02491
G1 X154.31 Y134.185 E.00614
G1 X154.69 Y134.186 E.01169
G1 X154.697 Y134.385 E.00613
G1 X155.41 Y134.385 E.02189
G1 X155.41 Y121.675 E.39054
; WIPE_START
M204 S6000
G1 X154.698 Y121.615 E-.27168
G1 X154.69 Y121.815 E-.07605
G1 X154.31 Y121.815 E-.14456
G1 X154.305 Y121.615 E-.07602
G1 X153.801 Y121.615 E-.19169
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
G1 X171.85 Y133.874 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X171.85 Y135.125 E.04151
G1 X172.227 Y135.125 E.0125
G1 X171.802 Y135.55 E.01991
G1 X171.55 Y135.55 E.00838
G1 X156.45 Y120.45 E.70834
G1 X156.198 Y120.45 E.00838
G1 X155.773 Y120.875 E.01991
G1 X156.15 Y120.875 E.0125
G1 X156.15 Y127.826 E.2306
G1 X163.874 Y135.55 E.36232
G1 X164.126 Y135.55 E.00838
G1 X171.85 Y127.826 E.36232
G1 X171.85 Y128.174 E.01153
G1 X164.126 Y120.45 E.36231
G1 X163.874 Y120.45 E.00839
G1 X156.15 Y128.174 E.36231
G1 X156.15 Y135.125 E.2306
G1 X155.773 Y135.125 E.0125
G1 X156.198 Y135.55 E.01991
G1 X156.45 Y135.55 E.00838
G1 X171.549 Y120.451 E.70833
G1 X171.803 Y120.451 E.0084
G1 X172.227 Y120.875 E.01989
G1 X171.85 Y120.875 E.0125
G1 X171.85 Y122.126 E.04151
; OBJECT_ID: 405
; WIPE_START
G1 X171.85 Y120.875 E-.47554
G1 X172.227 Y120.875 E-.14322
G1 X171.964 Y120.612 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X164.332 Y120.709 Z7.2 F42000
G1 X119.802 Y121.273 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X116.602 Y121.273 E.10615
G3 X117.553 Y120.104 I1.011 J-.149 E.0562
G1 X136.198 Y120.102 E.61849
G1 X136.198 Y134.727 E.48514
G1 X139.398 Y134.727 E.10615
G3 X138.456 Y135.896 I-1.015 J.146 E.05586
G1 X119.802 Y135.898 E.61879
G1 X119.802 Y121.333 E.48315
M204 S250
G1 X119.41 Y121.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X116.21 Y121.665 E.09833
G3 X116.252 Y120.763 I3.691 J-.281 E.02782
G3 X117.532 Y119.712 I1.354 J.344 E.0545
G1 X136.59 Y119.71 E.58559
G1 X136.59 Y134.335 E.44939
G1 X139.79 Y134.335 E.09833
G3 X139.73 Y135.303 I-3.324 J.28 E.02992
G3 X138.471 Y136.288 I-1.354 J-.434 E.05216
G1 X119.41 Y136.29 E.58568
G1 X119.41 Y121.725 E.44754
; WIPE_START
M204 S6000
G1 X117.41 Y121.688 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.778 Y125.896 Z7.2 F42000
G1 X135.85 Y133.874 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X135.85 Y135.075 E.03985
G1 X136.277 Y135.075 E.01416
G1 X135.804 Y135.548 E.02217
G1 X135.548 Y135.548 E.00849
G1 X120.452 Y120.452 E.70819
G1 X120.196 Y120.452 E.00849
G1 X119.723 Y120.925 E.02217
G1 X120.15 Y120.925 E.01416
G1 X120.15 Y127.826 E.22894
G1 X127.873 Y135.549 E.36228
G1 X128.127 Y135.549 E.00844
G1 X135.85 Y127.826 E.36228
G1 X135.85 Y128.174 E.01153
G1 X128.127 Y120.451 E.36228
G1 X127.873 Y120.451 E.00844
G1 X120.15 Y128.174 E.36228
G1 X120.15 Y135.55 E.24467
G1 X120.45 Y135.55 E.00996
G1 X135.55 Y120.45 E.70833
G1 X135.85 Y120.45 E.00996
G1 X135.85 Y121.779 E.04406
; OBJECT_ID: 394
; WIPE_START
G1 X135.85 Y120.45 E-.50471
G1 X135.55 Y120.45 E-.11405
G1 X135.287 Y120.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X128.119 Y123.337 Z7.2 F42000
G1 X97.79 Y134.44 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X103.41 Y134.44 E.17269
G1 X103.41 Y135.66 E.03749
G1 X97.79 Y135.66 E.17269
G1 X97.79 Y134.5 E.03564
; WIPE_START
M204 S6000
G1 X99.79 Y134.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.622 Y126.936 Z7.2 F42000
G1 X97.79 Y121.56 Z7.2
G1 Z6.8
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X97.79 Y120.34 E.03749
G1 X103.41 Y120.34 E.17269
G1 X103.41 Y121.56 E.03749
G1 X97.85 Y121.56 E.17084
M204 S10000
G1 X97.398 Y121.56 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.398 Y121.952 E.01301
G1 X100.198 Y121.952 E.09288
G1 X100.198 Y134.048 E.40124
G1 X97.398 Y134.048 E.09288
G1 X97.398 Y135.898 E.06137
G1 X86.602 Y135.898 E.35812
G1 X86.602 Y134.048 E.06137
G1 X83.802 Y134.048 E.09288
G1 X83.802 Y121.952 E.40124
G1 X86.602 Y121.952 E.09288
G1 X86.602 Y120.102 E.06137
G1 X97.398 Y120.102 E.35812
G1 X97.398 Y121.5 E.04636
; WIPE_START
G1 X97.398 Y121.952 E-.17179
G1 X98.946 Y121.952 E-.58821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.317 Y121.717 Z7.2 F42000
G1 X86.21 Y121.56 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X80.59 Y121.56 E.17269
G1 X80.59 Y120.34 E.03749
G1 X86.21 Y120.34 E.17269
G1 X86.21 Y121.5 E.03564
; WIPE_START
M204 S6000
G1 X84.21 Y121.521 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.378 Y129.064 Z7.2 F42000
G1 X86.21 Y134.44 Z7.2
G1 Z6.8
M73 P81 R4
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X86.21 Y135.66 E.03749
G1 X80.59 Y135.66 E.17269
G1 X80.59 Y134.44 E.03749
G1 X86.15 Y134.44 E.17084
; WIPE_START
M204 S6000
G1 X86.21 Y135.66 E-.46416
G1 X85.431 Y135.66 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.034 Y134.983 Z7.2 F42000
G1 X100.59 Y134.31 Z7.2
G1 Z6.8
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X103.56 Y134.31 E.09126
G1 X103.56 Y133.835 E.0146
G1 X103.79 Y133.835 E.00706
G1 X103.788 Y134.968 E.03482
G3 X102.397 Y136.29 I-1.406 J-.086 E.06487
G1 X81.605 Y136.29 E.63887
G3 X80.21 Y134.897 I-.003 J-1.392 E.06732
G1 X80.21 Y133.835 E.03264
G1 X80.44 Y133.835 E.00707
G1 X80.44 Y134.31 E.0146
G1 X83.41 Y134.31 E.09126
G1 X83.41 Y121.69 E.38778
G1 X80.44 Y121.69 E.09126
G1 X80.44 Y122.165 E.0146
G1 X80.21 Y122.165 E.00706
G1 X80.212 Y121.032 E.03482
G3 X81.603 Y119.71 I1.406 J.086 E.06487
G1 X102.408 Y119.71 E.63928
G3 X103.79 Y121.105 I-.012 J1.394 E.06695
G1 X103.79 Y122.165 E.03256
G1 X103.56 Y122.165 E.00707
G1 X103.56 Y121.69 E.0146
G1 X100.59 Y121.69 E.09126
G1 X100.59 Y134.25 E.38593
; WIPE_START
M204 S6000
G1 X102.59 Y134.29 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.328 Y133.7 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.7 Y133.7 E.05401
G1 X86.3 Y122.3 E.53477
G1 X84.15 Y122.3 E.07132
G1 X84.15 Y127.826 E.18331
G1 X91.874 Y135.55 E.36232
G1 X92.126 Y135.55 E.00838
G1 X99.85 Y127.826 E.36232
G1 X99.85 Y128.174 E.01153
G1 X92.126 Y120.45 E.36231
G1 X91.874 Y120.45 E.00839
G1 X84.15 Y128.174 E.36231
G1 X84.15 Y133.7 E.18331
G1 X86.3 Y133.7 E.07132
G1 X97.7 Y122.3 E.53477
G1 X99.328 Y122.3 E.05401
; WIPE_START
G1 X97.7 Y122.3 E-.61876
G1 X97.437 Y122.563 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.594 Y120.025 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279611
G1 F15000
M204 S6000
G1 X102.4 Y120.025 E.09269
G3 X102.711 Y120.048 I-.061 J3.007 E.00602
; LINE_WIDTH: 0.212958
G1 X103.058 Y120.109 E.00488
; WIPE_START
G1 X102.711 Y120.048 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.878 Y127.678 Z7.2 F42000
G1 X103.057 Y135.892 Z7.2
G1 Z6.8
G1 E.8 F1800
; LINE_WIDTH: 0.213511
G1 F15000
M204 S6000
G1 X102.724 Y135.95 E.0047
; LINE_WIDTH: 0.279063
G3 X102.448 Y135.974 I-.365 J-2.605 E.00533
G1 X97.594 Y135.975 E.0934
M204 S10000
G1 X86.406 Y135.975 F42000
; LINE_WIDTH: 0.280224
G1 F15000
M204 S6000
G1 X81.613 Y135.975 E.09268
G3 X81.335 Y135.958 I-.002 J-2.3 E.00538
; LINE_WIDTH: 0.231623
G1 X81.227 Y135.942 E.00169
; LINE_WIDTH: 0.194007
G1 X80.945 Y135.886 E.00355
M204 S10000
G1 X80.948 Y135.875 F42000
; LINE_WIDTH: 0.102936
G1 F15000
M204 S6000
G1 X81.666 Y136.094 E.00367
; WIPE_START
G1 X80.948 Y135.875 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.946 Y128.243 Z7.2 F42000
G1 X80.945 Y120.113 Z7.2
G1 Z6.8
G1 E.8 F1800
; LINE_WIDTH: 0.194831
G1 F15000
M204 S6000
G1 X81.227 Y120.058 E.00355
; LINE_WIDTH: 0.231474
G1 X81.335 Y120.042 E.00168
; LINE_WIDTH: 0.279484
G3 X81.552 Y120.026 I.271 J2.209 E.0042
G1 X86.406 Y120.025 E.09357
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X84.406 Y120.025 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 35/42
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z7.2 I-.02 J1.217 P1  F42000
G1 X155.802 Y121.223 Z7.2
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X152.604 Y121.223 E.1061
G3 X153.608 Y120.102 I1.007 J-.108 E.05627
G1 X174.396 Y120.102 E.68958
G3 X175.401 Y121.223 I-.007 J1.017 E.05621
G1 X172.198 Y121.223 E.10624
G1 X172.198 Y134.777 E.44962
G1 X175.397 Y134.777 E.1061
G3 X174.392 Y135.898 I-1.013 J.102 E.05618
G1 X153.615 Y135.898 E.68922
G3 X152.603 Y134.777 I-.009 J-1.008 E.05659
G1 X155.802 Y134.777 E.1061
G1 X155.802 Y121.283 E.44763
M204 S250
G1 X155.41 Y121.615 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X154.697 Y121.615 E.02189
G1 X154.69 Y121.815 E.00615
G1 X154.31 Y121.815 E.01169
G1 X154.305 Y121.615 E.00615
G1 X153.497 Y121.615 E.02482
G1 X153.49 Y121.815 E.00615
G1 X153.11 Y121.815 E.01169
G1 X153.105 Y121.615 E.00615
G1 X152.21 Y121.615 E.0275
G3 X152.226 Y120.894 I3.765 J-.282 E.0222
G3 X153.603 Y119.71 I1.386 J.22 E.06069
G1 X174.406 Y119.71 E.63922
G3 X175.79 Y121.103 I-.011 J1.395 E.06692
G1 X175.79 Y121.615 E.01574
G1 X174.897 Y121.615 E.02742
G1 X174.89 Y121.815 E.00615
G1 X174.51 Y121.815 E.01169
G1 X174.505 Y121.615 E.00615
G1 X173.695 Y121.615 E.02491
G1 X173.69 Y121.815 E.00614
G1 X173.31 Y121.814 E.01169
G1 X173.303 Y121.615 E.00613
G1 X172.59 Y121.615 E.02189
G1 X172.59 Y134.385 E.39239
G1 X173.302 Y134.385 E.02189
G1 X173.31 Y134.185 E.00615
G1 X173.69 Y134.185 E.01169
G1 X173.695 Y134.385 E.00615
G1 X174.502 Y134.385 E.02482
G1 X174.51 Y134.185 E.00615
G1 X174.89 Y134.185 E.01169
G1 X174.895 Y134.385 E.00615
G1 X175.789 Y134.385 E.02749
G3 X175.783 Y135.034 I-4.544 J.282 E.01995
G3 X174.397 Y136.29 I-1.394 J-.145 E.06295
G1 X153.605 Y136.29 E.63887
G3 X152.212 Y134.971 I.004 J-1.4 E.06497
G1 X152.21 Y134.385 E.01799
G1 X153.102 Y134.385 E.02741
G1 X153.11 Y134.185 E.00615
G1 X153.49 Y134.185 E.01169
G1 X153.495 Y134.385 E.00615
G1 X154.305 Y134.385 E.02491
G1 X154.31 Y134.185 E.00614
G1 X154.69 Y134.186 E.01169
G1 X154.697 Y134.385 E.00613
G1 X155.41 Y134.385 E.02189
G1 X155.41 Y121.675 E.39054
; WIPE_START
M204 S6000
G1 X154.697 Y121.615 E-.27171
G1 X154.69 Y121.815 E-.07605
G1 X154.31 Y121.815 E-.14456
G1 X154.305 Y121.615 E-.07602
G1 X153.801 Y121.615 E-.19166
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
G1 X171.85 Y122.126 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X171.85 Y120.875 E.04151
G1 X172.227 Y120.875 E.0125
G1 X171.802 Y120.451 E.0199
G1 X171.549 Y120.451 E.00839
G1 X156.45 Y135.55 E.70833
G1 X156.198 Y135.55 E.00838
G1 X155.773 Y135.125 E.01991
G1 X156.15 Y135.125 E.0125
G1 X156.15 Y128.174 E.2306
G1 X163.874 Y120.45 E.36231
G1 X164.126 Y120.45 E.00839
G1 X171.85 Y128.174 E.36231
G1 X171.85 Y127.826 E.01153
G1 X164.126 Y135.55 E.36232
G1 X163.874 Y135.55 E.00838
G1 X156.15 Y127.826 E.36232
G1 X156.15 Y120.875 E.2306
G1 X155.773 Y120.875 E.0125
G1 X156.198 Y120.45 E.01991
G1 X156.45 Y120.45 E.00838
G1 X171.55 Y135.55 E.70834
G1 X171.802 Y135.55 E.00838
G1 X172.227 Y135.125 E.01991
G1 X171.85 Y135.125 E.0125
G1 X171.85 Y133.874 E.04151
; OBJECT_ID: 405
; WIPE_START
G1 X171.85 Y135.125 E-.47554
G1 X172.227 Y135.125 E-.14322
G1 X171.964 Y135.388 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X164.596 Y133.394 Z7.4 F42000
G1 X119.802 Y121.273 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X116.602 Y121.273 E.10615
G3 X117.551 Y120.104 I1.011 J-.149 E.05615
G1 X136.198 Y120.102 E.61855
G1 X136.198 Y134.727 E.48514
G1 X139.398 Y134.727 E.10615
G3 X138.456 Y135.896 I-1.015 J.146 E.05587
G1 X119.802 Y135.898 E.61879
G1 X119.802 Y121.333 E.48315
M204 S250
G1 X119.41 Y121.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X116.21 Y121.665 E.09833
G3 X116.252 Y120.762 I3.69 J-.281 E.02783
G3 X117.532 Y119.712 I1.354 J.344 E.05446
G1 X136.59 Y119.71 E.58561
G1 X136.59 Y134.335 E.44939
G1 X139.79 Y134.335 E.09833
G3 X139.729 Y135.305 I-3.32 J.28 E.02998
G3 X138.471 Y136.288 I-1.343 J-.422 E.05218
G1 X119.41 Y136.29 E.58568
G1 X119.41 Y121.725 E.44754
; WIPE_START
M204 S6000
G1 X117.41 Y121.688 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.043 Y121.725 Z7.4 F42000
G1 X135.85 Y121.779 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X135.85 Y120.45 E.04406
G1 X135.55 Y120.45 E.00996
G1 X120.45 Y135.55 E.70833
G1 X120.15 Y135.55 E.00996
G1 X120.15 Y128.174 E.24467
G1 X127.873 Y120.451 E.36228
G1 X128.127 Y120.451 E.00844
G1 X135.85 Y128.174 E.36228
G1 X135.85 Y127.826 E.01153
G1 X128.127 Y135.549 E.36228
G1 X127.873 Y135.549 E.00844
G1 X120.15 Y127.826 E.36228
G1 X120.15 Y120.925 E.22894
G1 X119.723 Y120.925 E.01416
G1 X120.196 Y120.452 E.02217
G1 X120.452 Y120.452 E.00849
G1 X135.548 Y135.548 E.70819
G1 X135.804 Y135.548 E.00849
G1 X136.277 Y135.075 E.02217
G1 X135.85 Y135.075 E.01416
G1 X135.85 Y133.874 E.03985
; OBJECT_ID: 394
; WIPE_START
G1 X135.85 Y135.075 E-.45654
G1 X136.277 Y135.075 E-.16222
G1 X136.014 Y135.338 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X128.383 Y135.159 Z7.4 F42000
G1 X97.79 Y134.44 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X103.41 Y134.44 E.17269
G1 X103.41 Y135.66 E.03749
G1 X97.79 Y135.66 E.17269
G1 X97.79 Y134.5 E.03564
; WIPE_START
M204 S6000
G1 X99.79 Y134.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.622 Y126.936 Z7.4 F42000
G1 X97.79 Y121.56 Z7.4
G1 Z7
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X97.79 Y120.34 E.03749
G1 X103.41 Y120.34 E.17269
G1 X103.41 Y121.56 E.03749
G1 X97.85 Y121.56 E.17084
M204 S10000
G1 X97.398 Y121.56 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.398 Y121.952 E.01301
G1 X100.198 Y121.952 E.09288
G1 X100.198 Y134.048 E.40124
G1 X97.398 Y134.048 E.09288
G1 X97.398 Y135.898 E.06137
G1 X86.602 Y135.898 E.35812
G1 X86.602 Y134.048 E.06137
G1 X83.802 Y134.048 E.09288
G1 X83.802 Y121.952 E.40124
G1 X86.602 Y121.952 E.09288
G1 X86.602 Y120.102 E.06137
G1 X97.398 Y120.102 E.35812
G1 X97.398 Y121.5 E.04636
; WIPE_START
G1 X97.398 Y121.952 E-.17179
G1 X98.946 Y121.952 E-.58821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.317 Y121.717 Z7.4 F42000
G1 X86.21 Y121.56 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X80.59 Y121.56 E.17269
G1 X80.59 Y120.34 E.03749
G1 X86.21 Y120.34 E.17269
G1 X86.21 Y121.5 E.03564
; WIPE_START
M204 S6000
G1 X84.21 Y121.521 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.378 Y129.064 Z7.4 F42000
G1 X86.21 Y134.44 Z7.4
G1 Z7
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X86.21 Y135.66 E.03749
G1 X80.59 Y135.66 E.17269
G1 X80.59 Y134.44 E.03749
G1 X86.15 Y134.44 E.17084
; WIPE_START
M204 S6000
G1 X86.21 Y135.66 E-.46416
M73 P82 R4
G1 X85.431 Y135.66 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.034 Y134.983 Z7.4 F42000
G1 X100.59 Y134.31 Z7.4
G1 Z7
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X103.56 Y134.31 E.09126
G1 X103.56 Y133.835 E.0146
G1 X103.79 Y133.835 E.00706
G1 X103.788 Y134.968 E.03482
G3 X102.397 Y136.29 I-1.399 J-.079 E.06495
G1 X81.605 Y136.29 E.63887
G3 X80.21 Y134.897 I-.004 J-1.392 E.06732
G1 X80.21 Y133.835 E.03264
G1 X80.44 Y133.835 E.00707
G1 X80.44 Y134.31 E.0146
G1 X83.41 Y134.31 E.09126
G1 X83.41 Y121.69 E.38778
G1 X80.44 Y121.69 E.09126
G1 X80.44 Y122.165 E.0146
G1 X80.21 Y122.165 E.00706
G1 X80.212 Y121.032 E.03482
G3 X81.603 Y119.71 I1.399 J.079 E.06495
G1 X102.406 Y119.71 E.63922
G3 X103.79 Y121.105 I-.01 J1.394 E.06702
G1 X103.79 Y122.165 E.03256
G1 X103.56 Y122.165 E.00707
G1 X103.56 Y121.69 E.0146
G1 X100.59 Y121.69 E.09126
G1 X100.59 Y134.25 E.38593
; WIPE_START
M204 S6000
G1 X102.59 Y134.29 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.722 Y135.951 Z7.4 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279076
G1 F15000
M204 S6000
G3 X102.448 Y135.974 I-.365 J-2.621 E.0053
G1 X97.594 Y135.975 E.0934
M204 S10000
G1 X102.722 Y135.951 F42000
; LINE_WIDTH: 0.213764
G1 F15000
M204 S6000
G1 X103.057 Y135.892 E.00473
; WIPE_START
G1 X102.722 Y135.951 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.88 Y128.544 Z7.4 F42000
G1 X99.328 Y122.3 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.7 Y122.3 E.05401
G1 X86.3 Y133.7 E.53477
G1 X84.15 Y133.7 E.07132
G1 X84.15 Y128.174 E.18331
G1 X91.874 Y120.45 E.36231
G1 X92.126 Y120.45 E.00839
G1 X99.85 Y128.174 E.36231
G1 X99.85 Y127.826 E.01153
G1 X92.126 Y135.55 E.36232
G1 X91.874 Y135.55 E.00838
G1 X84.15 Y127.826 E.36232
G1 X84.15 Y122.3 E.18331
G1 X86.3 Y122.3 E.07132
G1 X97.7 Y133.7 E.53477
G1 X99.328 Y133.7 E.05401
; WIPE_START
G1 X97.7 Y133.7 E-.61876
G1 X97.437 Y133.437 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.999 Y135.148 Z7.4 F42000
G1 X86.406 Y135.975 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.28026
G1 F15000
M204 S6000
G1 X81.613 Y135.975 E.09269
G3 X81.341 Y135.959 I.025 J-2.792 E.00527
; LINE_WIDTH: 0.231541
G1 X81.221 Y135.941 E.00187
; LINE_WIDTH: 0.205663
G1 X80.945 Y135.89 E.00373
; WIPE_START
G1 X81.221 Y135.941 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.087 Y128.31 Z7.4 F42000
G1 X80.944 Y120.109 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.206999
G1 F15000
M204 S6000
G1 X81.23 Y120.057 E.00389
; LINE_WIDTH: 0.232115
G1 X81.334 Y120.042 E.00162
; LINE_WIDTH: 0.27949
G3 X81.552 Y120.026 I.272 J2.213 E.00421
G1 X86.406 Y120.025 E.09357
M204 S10000
G1 X97.594 Y120.025 F42000
; LINE_WIDTH: 0.279636
G1 F15000
M204 S6000
G1 X102.398 Y120.025 E.09266
G3 X102.711 Y120.048 I-.058 J2.99 E.00607
; LINE_WIDTH: 0.213279
G1 X103.058 Y120.109 E.00489
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X102.711 Y120.048 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 36/42
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z7.4 I-.027 J1.217 P1  F42000
G1 X155.802 Y121.223 Z7.4
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X152.604 Y121.223 E.1061
G3 X153.615 Y120.102 I1.013 J-.103 E.0564
G1 X174.394 Y120.102 E.68929
G3 X175.403 Y121.223 I-.006 J1.02 E.0563
G1 X172.198 Y121.223 E.10632
G1 X172.198 Y134.777 E.44962
G1 X175.397 Y134.777 E.1061
G3 X174.385 Y135.898 I-1.013 J.102 E.0564
G1 X153.615 Y135.898 E.689
G3 X152.603 Y134.777 I-.007 J-1.011 E.05655
G1 X155.802 Y134.777 E.1061
G1 X155.802 Y121.283 E.44763
M204 S250
G1 X155.41 Y121.615 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X154.697 Y121.615 E.02189
G1 X154.69 Y121.815 E.00615
G1 X154.31 Y121.815 E.01169
G1 X154.305 Y121.615 E.00615
G1 X153.497 Y121.615 E.02483
G1 X153.49 Y121.815 E.00615
G1 X153.11 Y121.815 E.01169
G1 X153.105 Y121.615 E.00615
G1 X152.21 Y121.615 E.0275
G3 X152.218 Y120.958 I4.295 J-.282 E.02021
G3 X153.605 Y119.71 I1.392 J.153 E.06276
G1 X174.404 Y119.71 E.63908
G3 X175.79 Y121.105 I-.009 J1.395 E.06706
G1 X175.79 Y121.615 E.01566
G1 X174.897 Y121.615 E.02743
G1 X174.89 Y121.815 E.00615
G1 X174.51 Y121.815 E.01169
G1 X174.505 Y121.615 E.00615
G1 X173.695 Y121.615 E.02491
G1 X173.69 Y121.815 E.00614
G1 X173.31 Y121.814 E.01169
G1 X173.302 Y121.615 E.00613
G1 X172.59 Y121.615 E.02189
G1 X172.59 Y134.385 E.39239
G1 X173.302 Y134.385 E.02189
G1 X173.31 Y134.185 E.00615
G1 X173.69 Y134.185 E.01169
G1 X173.695 Y134.385 E.00615
G1 X174.502 Y134.385 E.02482
G1 X174.51 Y134.185 E.00615
G1 X174.89 Y134.185 E.01169
G1 X174.895 Y134.385 E.00615
G1 X175.789 Y134.385 E.02749
G3 X175.783 Y135.034 I-4.556 J.282 E.01995
G3 X174.395 Y136.29 I-1.393 J-.145 E.06302
G1 X153.605 Y136.29 E.6388
G3 X152.212 Y134.97 I.012 J-1.409 E.06488
G1 X152.21 Y134.385 E.01798
G1 X153.102 Y134.385 E.02741
G1 X153.11 Y134.185 E.00615
G1 X153.49 Y134.185 E.01169
G1 X153.495 Y134.385 E.00615
G1 X154.305 Y134.385 E.02491
G1 X154.31 Y134.185 E.00614
G1 X154.69 Y134.186 E.01169
G1 X154.697 Y134.385 E.00613
G1 X155.41 Y134.385 E.02189
G1 X155.41 Y121.675 E.39054
; WIPE_START
M204 S6000
G1 X154.697 Y121.615 E-.27172
G1 X154.69 Y121.815 E-.07605
G1 X154.31 Y121.815 E-.14456
G1 X154.305 Y121.615 E-.07602
G1 X153.801 Y121.615 E-.19165
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
G1 X171.85 Y133.874 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X171.85 Y135.125 E.04151
G1 X172.227 Y135.125 E.0125
G1 X171.802 Y135.55 E.01991
G1 X171.55 Y135.55 E.00838
G1 X156.45 Y120.45 E.70834
G1 X156.198 Y120.45 E.00838
G1 X155.773 Y120.875 E.01991
G1 X156.15 Y120.875 E.0125
G1 X156.15 Y127.826 E.2306
G1 X163.874 Y135.55 E.36232
G1 X164.126 Y135.55 E.00838
G1 X171.85 Y127.826 E.36232
G1 X171.85 Y128.174 E.01153
G1 X164.126 Y120.45 E.36231
G1 X163.874 Y120.45 E.00839
G1 X156.15 Y128.174 E.36232
G1 X156.15 Y135.125 E.2306
G1 X155.773 Y135.125 E.0125
G1 X156.198 Y135.55 E.01991
G1 X156.45 Y135.55 E.00838
G1 X171.549 Y120.451 E.70833
G1 X171.802 Y120.451 E.00839
G1 X172.227 Y120.875 E.0199
G1 X171.85 Y120.875 E.0125
G1 X171.85 Y122.126 E.04151
; OBJECT_ID: 405
; WIPE_START
G1 X171.85 Y120.875 E-.47554
G1 X172.227 Y120.875 E-.14322
G1 X171.964 Y120.612 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X164.332 Y120.709 Z7.6 F42000
G1 X119.802 Y121.273 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X116.602 Y121.273 E.10615
G3 X117.544 Y120.104 I1.012 J-.149 E.05592
G1 X136.198 Y120.102 E.61879
G1 X136.198 Y134.727 E.48514
G1 X139.398 Y134.727 E.10615
G3 X138.455 Y135.896 I-1.014 J.146 E.05592
G1 X119.802 Y135.898 E.61874
G1 X119.802 Y121.333 E.48315
M204 S250
G1 X119.41 Y121.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X116.21 Y121.665 E.09833
G3 X116.252 Y120.762 I3.689 J-.281 E.02784
G3 X117.529 Y119.712 I1.354 J.345 E.05438
G1 X136.59 Y119.71 E.58568
G1 X136.59 Y134.335 E.44939
G1 X139.79 Y134.335 E.09833
G3 X139.749 Y135.235 I-3.875 J.274 E.02775
G3 X138.47 Y136.288 I-1.361 J-.35 E.05443
G1 X119.41 Y136.29 E.58566
G1 X119.41 Y121.725 E.44754
; WIPE_START
M204 S6000
G1 X117.41 Y121.688 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.778 Y125.896 Z7.6 F42000
G1 X135.85 Y133.874 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X135.85 Y135.075 E.03985
G1 X136.277 Y135.075 E.01416
G1 X135.804 Y135.548 E.02217
G1 X135.548 Y135.548 E.00849
G1 X120.452 Y120.452 E.70819
G1 X120.196 Y120.452 E.00849
G1 X119.723 Y120.925 E.02217
G1 X120.15 Y120.925 E.01416
G1 X120.15 Y127.826 E.22894
G1 X127.873 Y135.549 E.36228
G1 X128.127 Y135.549 E.00844
G1 X135.85 Y127.826 E.36228
G1 X135.85 Y128.174 E.01153
G1 X128.127 Y120.451 E.36228
G1 X127.873 Y120.451 E.00844
G1 X120.15 Y128.174 E.36228
G1 X120.15 Y135.55 E.24467
G1 X120.45 Y135.55 E.00996
G1 X135.55 Y120.45 E.70833
G1 X135.85 Y120.45 E.00996
G1 X135.85 Y121.779 E.04406
; OBJECT_ID: 394
; WIPE_START
G1 X135.85 Y120.45 E-.50471
G1 X135.55 Y120.45 E-.11405
G1 X135.287 Y120.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X128.119 Y123.337 Z7.6 F42000
G1 X97.79 Y134.44 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X103.41 Y134.44 E.17269
G1 X103.41 Y135.66 E.03749
G1 X97.79 Y135.66 E.17269
G1 X97.79 Y134.5 E.03564
; WIPE_START
M204 S6000
G1 X99.79 Y134.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.59 Y134.31 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X100.59 Y121.69 E.38778
G1 X103.16 Y121.69 E.07897
G1 X103.56 Y121.69 E.01229
G1 F6111.477
G1 X103.56 Y122.206 E.01586
M106 S255
G1 F1800
G1 X103.56 Y122.575 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X103.56 Y133.425 E.35991
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X103.56 Y133.794 E.01134
M106 S201.45
G1 F6111.477
G1 X103.56 Y134.31 E.01586
G1 F9547.055
G1 X103.16 Y134.31 E.01229
G1 X100.65 Y134.31 E.07712
; WIPE_START
M204 S6000
G1 X100.641 Y132.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.684 Y124.933 Z7.6 F42000
G1 X97.79 Y121.56 Z7.6
G1 Z7.2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X97.79 Y120.34 E.03749
G1 X103.41 Y120.34 E.17269
G1 X103.41 Y121.56 E.03749
G1 X97.85 Y121.56 E.17084
M204 S10000
G1 X97.398 Y121.56 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.398 Y121.952 E.01301
G1 X100.198 Y121.952 E.09288
G1 X100.198 Y134.048 E.40124
G1 X97.398 Y134.048 E.09288
G1 X97.398 Y135.898 E.06137
G1 X86.602 Y135.898 E.35812
G1 X86.602 Y134.048 E.06137
G1 X83.802 Y134.048 E.09288
G1 X83.802 Y121.952 E.40124
G1 X86.602 Y121.952 E.09288
G1 X86.602 Y120.102 E.06137
G1 X97.398 Y120.102 E.35812
G1 X97.398 Y121.5 E.04637
; WIPE_START
G1 X97.398 Y121.952 E-.17179
G1 X98.946 Y121.952 E-.58821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.317 Y121.717 Z7.6 F42000
G1 X86.21 Y121.56 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X80.59 Y121.56 E.17269
M73 P83 R4
G1 X80.59 Y120.34 E.03749
G1 X86.21 Y120.34 E.17269
G1 X86.21 Y121.5 E.03564
; WIPE_START
M204 S6000
G1 X84.21 Y121.521 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.41 Y121.69 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X83.41 Y134.31 E.38778
G1 X80.84 Y134.31 E.07897
G1 X80.44 Y134.31 E.01229
G1 F6111.477
G1 X80.44 Y133.794 E.01586
M106 S255
G1 F1800
G1 X80.44 Y133.425 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X80.44 Y122.575 E.35991
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X80.44 Y122.206 E.01134
M106 S201.45
G1 F6111.477
G1 X80.44 Y121.69 E.01586
G1 F9547.055
G1 X80.84 Y121.69 E.01229
G1 X83.35 Y121.69 E.07712
; WIPE_START
M204 S6000
G1 X83.36 Y123.69 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.316 Y131.067 Z7.6 F42000
G1 X86.21 Y134.44 Z7.6
G1 Z7.2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X86.21 Y135.66 E.03749
G1 X80.59 Y135.66 E.17269
G1 X80.59 Y134.44 E.03749
G1 X86.15 Y134.44 E.17084
; WIPE_START
M204 S6000
G1 X86.21 Y135.66 E-.46416
G1 X85.431 Y135.66 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.308 Y130.79 Z7.6 F42000
G1 X103.671 Y120.544 Z7.6
G1 Z7.2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X103.68 Y120.57 E.00084
G3 X103.788 Y121.03 I-1.297 J.548 E.01459
G1 X103.788 Y121.406 E.01156
G1 X103.788 Y121.806 E.01229
G1 F4919.51
G1 X103.788 Y122.206 E.01229
M106 S255
G1 F1800
G1 X103.788 Y122.575 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X103.788 Y133.425 E.35991
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X103.788 Y133.794 E.01134
M106 S201.45
G1 F4919.51
G1 X103.788 Y134.194 E.01229
G1 F9547.055
G1 X103.788 Y134.594 E.01229
G1 X103.788 Y134.968 E.0115
G3 X102.395 Y136.29 I-1.399 J-.079 E.06502
G1 X81.605 Y136.29 E.6388
G3 X80.21 Y134.895 I-.001 J-1.394 E.06736
G1 X80.21 Y134.594 E.00924
G1 X80.21 Y134.194 E.01229
G1 F4919.51
G1 X80.21 Y133.794 E.01229
M106 S255
G1 F1800
G1 X80.21 Y133.425 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X80.21 Y122.575 E.35991
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X80.21 Y122.206 E.01134
M106 S201.45
G1 F4919.51
G1 X80.21 Y121.806 E.01229
G1 F9547.055
G1 X80.21 Y121.406 E.01229
G1 X80.21 Y121.106 E.00922
G3 X81.605 Y119.71 I1.394 J-.001 E.06738
G1 X102.404 Y119.71 E.63908
G3 X103.55 Y120.331 I-.021 J1.408 E.04166
G1 X103.641 Y120.492 E.00567
M204 S10000
G1 X103.057 Y120.108 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.214111
G1 F15000
M204 S6000
G1 X102.719 Y120.049 E.00478
; LINE_WIDTH: 0.279592
G2 X102.396 Y120.025 I-.344 J2.459 E.00625
G1 X97.594 Y120.025 E.09261
M204 S10000
G1 X86.406 Y120.025 F42000
; LINE_WIDTH: 0.2802
G1 F15000
M204 S6000
G1 X81.613 Y120.025 E.09268
G2 X81.335 Y120.042 I-.003 J2.271 E.00539
; LINE_WIDTH: 0.231846
G1 X81.229 Y120.057 E.00165
; LINE_WIDTH: 0.206776
G1 X80.943 Y120.11 E.00387
; WIPE_START
G1 X81.229 Y120.057 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.092 Y127.689 Z7.6 F42000
G1 X80.944 Y135.89 Z7.6
G1 Z7.2
G1 E.8 F1800
; LINE_WIDTH: 0.205757
G1 F15000
M204 S6000
G1 X81.221 Y135.941 E.00373
; LINE_WIDTH: 0.231571
G1 X81.341 Y135.959 E.00187
; LINE_WIDTH: 0.28026
G2 X81.613 Y135.975 I.297 J-2.781 E.00527
G1 X86.406 Y135.975 E.09269
M204 S10000
G1 X97.594 Y135.975 F42000
; LINE_WIDTH: 0.279788
G1 F15000
M204 S6000
G1 X102.387 Y135.975 E.09251
G2 X102.72 Y135.951 I-.048 J-2.982 E.00645
; LINE_WIDTH: 0.214021
G1 X103.057 Y135.892 E.00476
; WIPE_START
G1 X102.72 Y135.951 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.328 Y133.7 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.7 Y133.7 E.05401
G1 X86.3 Y122.3 E.53477
G1 X84.15 Y122.3 E.07132
G1 X84.15 Y127.826 E.18331
G1 X91.874 Y135.55 E.36232
G1 X92.126 Y135.55 E.00838
G1 X99.85 Y127.826 E.36232
G1 X99.85 Y128.174 E.01153
G1 X92.126 Y120.45 E.36231
G1 X91.874 Y120.45 E.00839
G1 X84.15 Y128.174 E.36232
G1 X84.15 Y133.7 E.18331
G1 X86.3 Y133.7 E.07132
G1 X97.7 Y122.3 E.53477
G1 X99.328 Y122.3 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X97.7 Y122.3 E-.61876
G1 X97.437 Y122.563 E-.14125
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 37/42
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z7.6 I.028 J1.217 P1  F42000
G1 X155.802 Y121.223 Z7.6
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X152.604 Y121.223 E.1061
G3 X153.615 Y120.102 I1.013 J-.103 E.05641
G1 X174.392 Y120.102 E.68922
G3 X175.403 Y121.223 I-.004 J1.02 E.05637
G1 X172.198 Y121.223 E.10633
G1 X172.198 Y134.777 E.44962
G1 X175.396 Y134.777 E.1061
G3 X174.385 Y135.898 I-1.006 J.109 E.05652
G1 X153.615 Y135.898 E.68899
G3 X152.603 Y134.777 I-.006 J-1.011 E.05654
G1 X155.802 Y134.777 E.1061
G1 X155.802 Y121.283 E.44763
M204 S250
G1 X155.41 Y121.615 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X154.697 Y121.615 E.0219
G1 X154.69 Y121.815 E.00615
G1 X154.31 Y121.815 E.01169
G1 X154.305 Y121.615 E.00615
G1 X153.497 Y121.615 E.02483
G1 X153.49 Y121.815 E.00615
G1 X153.11 Y121.815 E.01169
G1 X153.105 Y121.615 E.00615
G1 X152.21 Y121.615 E.0275
G3 X152.225 Y120.896 I3.75 J-.282 E.02213
G3 X153.605 Y119.71 I1.385 J.215 E.06086
G1 X174.402 Y119.71 E.63902
G3 X175.79 Y121.105 I-.007 J1.395 E.06713
G1 X175.79 Y121.615 E.01566
G1 X174.897 Y121.615 E.02743
G1 X174.89 Y121.815 E.00615
G1 X174.51 Y121.815 E.01169
G1 X174.505 Y121.615 E.00615
G1 X173.695 Y121.615 E.02491
G1 X173.69 Y121.815 E.00614
G1 X173.31 Y121.814 E.01169
G1 X173.303 Y121.615 E.00613
G1 X172.59 Y121.615 E.0219
G1 X172.59 Y134.385 E.39239
G1 X173.302 Y134.385 E.02189
G1 X173.31 Y134.185 E.00615
G1 X173.69 Y134.185 E.01169
G1 X173.695 Y134.385 E.00615
G1 X174.502 Y134.385 E.02482
G1 X174.51 Y134.185 E.00615
G1 X174.89 Y134.185 E.01169
G1 X174.895 Y134.385 E.00615
G1 X175.789 Y134.385 E.0275
G3 X175.774 Y135.111 I-3.658 J.283 E.02234
G3 X174.395 Y136.29 I-1.384 J-.222 E.06064
G1 X153.605 Y136.29 E.63881
G3 X152.212 Y134.97 I.013 J-1.409 E.06488
G1 X152.21 Y134.385 E.01797
G1 X153.102 Y134.385 E.02741
G1 X153.11 Y134.185 E.00615
G1 X153.49 Y134.185 E.01169
G1 X153.495 Y134.385 E.00615
G1 X154.305 Y134.385 E.02491
G1 X154.31 Y134.185 E.00614
G1 X154.69 Y134.186 E.01169
G1 X154.697 Y134.385 E.00613
G1 X155.41 Y134.385 E.02189
G1 X155.41 Y121.675 E.39054
; WIPE_START
M204 S6000
G1 X154.697 Y121.615 E-.27175
G1 X154.69 Y121.815 E-.07605
G1 X154.31 Y121.815 E-.14456
G1 X154.305 Y121.615 E-.07602
G1 X153.801 Y121.615 E-.19162
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
G1 X156.137 Y120.887 F42000
G1 Z7.4
G1 E.8 F1800
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.39948
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X156.165 Y121.019 E.00391
G1 X156.165 Y134.981 E.40564
G1 X156.15 Y135.054 E.00217
; Slow Down End
M204 S10000
G1 X156.106 Y120.465 F42000
; Slow Down Start
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X171.834 Y120.465 E.43577
; Slow Down End
M204 S10000
G1 X171.473 Y133.844 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
M73 P83 R3
G1 F8843.478
M204 S6000
G1 X171.473 Y135.173 E.04406
G1 X171.173 Y135.173 E.00995
G1 X156.828 Y120.828 E.67295
G1 X163.496 Y120.828 E.22122
G1 X156.527 Y127.797 E.32693
G1 X156.527 Y128.203 E.0135
G1 X163.497 Y135.173 E.32693
G1 X164.503 Y135.173 E.0334
G1 X171.473 Y128.203 E.32693
G1 X171.473 Y127.797 E.0135
G1 X164.504 Y120.828 E.32693
G1 X171.172 Y120.828 E.22122
G1 X156.827 Y135.173 E.67295
G1 X156.527 Y135.173 E.00995
G1 X156.527 Y133.844 E.04406
M204 S10000
G1 X171.862 Y135.113 F42000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.39946
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X171.835 Y134.981 E.00391
G1 X171.835 Y121.019 E.40562
G1 X171.85 Y120.946 E.00217
; Slow Down End
M204 S10000
G1 X171.894 Y135.535 F42000
; Slow Down Start
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X156.166 Y135.535 E.43577
; Slow Down End
; OBJECT_ID: 405
; WIPE_START
G1 X158.166 Y135.535 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X151.012 Y132.876 Z7.8 F42000
G1 X119.802 Y121.273 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X116.602 Y121.273 E.10615
G3 X117.551 Y120.104 I1.009 J-.151 E.05619
G1 X136.198 Y120.102 E.61854
G1 X136.198 Y134.727 E.48514
G1 X139.398 Y134.727 E.10615
G3 X138.456 Y135.896 I-1.014 J.147 E.05588
G1 X119.802 Y135.898 E.61879
G1 X119.802 Y121.333 E.48315
M204 S250
G1 X119.41 Y121.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X116.21 Y121.665 E.09833
G3 X116.252 Y120.762 I3.686 J-.281 E.02784
G3 X117.532 Y119.712 I1.354 J.344 E.05447
G1 X136.59 Y119.71 E.5856
G1 X136.59 Y134.335 E.44939
G1 X139.79 Y134.335 E.09833
G3 X139.73 Y135.303 I-3.321 J.28 E.02992
G3 X138.471 Y136.288 I-1.343 J-.42 E.05224
G1 X119.41 Y136.29 E.58568
G1 X119.41 Y121.725 E.44754
; WIPE_START
M204 S6000
G1 X117.41 Y121.688 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.137 Y120.937 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.383142
G1 F10581.342
M204 S6000
G1 X120.165 Y121.069 E.00373
G1 X120.165 Y135.376 E.39663
G1 X120.192 Y135.508 E.00374
G1 X120.324 Y135.535 E.00374
G1 X135.834 Y135.534 E.43
M204 S10000
G1 X137.432 Y135.548 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X136.257 Y135.548 E.03899
G1 X136.257 Y135.095 E.01503
G1 X137.905 Y135.075 E.05467
; WIPE_START
G1 X136.257 Y135.095 E-.62627
G1 X136.257 Y135.447 E-.13373
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.472 Y133.844 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X135.472 Y135.172 E.04406
G1 X135.172 Y135.172 E.00995
G1 X120.828 Y120.828 E.67295
G1 X127.496 Y120.828 E.22122
G1 X120.528 Y127.797 E.32693
G1 X120.528 Y128.203 E.0135
G1 X127.496 Y135.172 E.32693
G1 X128.504 Y135.172 E.03341
G1 X135.472 Y128.203 E.32693
G1 X135.472 Y127.796 E.0135
G1 X128.504 Y120.828 E.32693
G1 X135.172 Y120.828 E.22122
G1 X120.828 Y135.172 E.67295
G1 X120.528 Y135.172 E.00995
G1 X120.528 Y133.844 E.04406
; WIPE_START
G1 X120.528 Y135.172 E-.50477
G1 X120.828 Y135.172 E-.11399
G1 X121.09 Y134.91 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.492 Y127.446 Z7.8 F42000
G1 X118.095 Y120.925 Z7.8
G1 Z7.4
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X119.743 Y120.905 E.05467
G1 X119.743 Y120.452 E.01503
G1 X118.568 Y120.452 E.03899
M204 S10000
G1 X120.106 Y120.466 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.383109
G1 F10582.367
M204 S6000
G1 X135.676 Y120.465 E.43162
G1 X135.808 Y120.492 E.00373
G1 X135.835 Y120.624 E.00373
G1 X135.835 Y134.931 E.39659
G1 X135.85 Y135.004 E.00207
; OBJECT_ID: 394
; WIPE_START
G1 X135.835 Y134.931 E-.02839
G1 X135.835 Y133.005 E-.73161
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X128.208 Y133.293 Z7.8 F42000
G1 X97.79 Y134.44 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X103.41 Y134.44 E.17269
G1 X103.41 Y135.66 E.03749
G1 X97.79 Y135.66 E.17269
G1 X97.79 Y134.5 E.03564
; WIPE_START
M204 S6000
G1 X99.79 Y134.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.59 Y134.31 Z7.8 F42000
M73 P84 R3
G1 Z7.4
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X100.59 Y121.69 E.38778
G1 X103.56 Y121.69 E.09126
G1 X103.56 Y134.31 E.38778
G1 X100.65 Y134.31 E.08942
; WIPE_START
M204 S6000
G1 X100.641 Y132.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.684 Y124.933 Z7.8 F42000
G1 X97.79 Y121.56 Z7.8
G1 Z7.4
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X97.79 Y120.34 E.03749
G1 X103.41 Y120.34 E.17269
G1 X103.41 Y121.56 E.03749
G1 X97.85 Y121.56 E.17084
M204 S10000
G1 X97.398 Y121.56 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.398 Y121.952 E.01301
G1 X100.198 Y121.952 E.09288
G1 X100.198 Y134.048 E.40124
G1 X97.398 Y134.048 E.09288
G1 X97.398 Y135.898 E.06137
G1 X86.602 Y135.898 E.35812
G1 X86.602 Y134.048 E.06137
G1 X83.802 Y134.048 E.09288
G1 X83.802 Y121.952 E.40124
G1 X86.602 Y121.952 E.09288
G1 X86.602 Y120.102 E.06137
G1 X97.398 Y120.102 E.35812
G1 X97.398 Y121.5 E.04637
; WIPE_START
G1 X97.398 Y121.952 E-.17179
G1 X98.946 Y121.952 E-.58821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.317 Y121.717 Z7.8 F42000
G1 X86.21 Y121.56 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X80.59 Y121.56 E.17269
G1 X80.59 Y120.34 E.03749
G1 X86.21 Y120.34 E.17269
G1 X86.21 Y121.5 E.03564
; WIPE_START
M204 S6000
G1 X84.21 Y121.521 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.41 Y121.69 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X83.41 Y134.31 E.38778
G1 X80.44 Y134.31 E.09126
G1 X80.44 Y121.69 E.38778
G1 X83.35 Y121.69 E.08942
; WIPE_START
M204 S6000
G1 X83.36 Y123.69 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.316 Y131.067 Z7.8 F42000
G1 X86.21 Y134.44 Z7.8
G1 Z7.4
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X86.21 Y135.66 E.03749
G1 X80.59 Y135.66 E.17269
G1 X80.59 Y134.44 E.03749
G1 X86.15 Y134.44 E.17084
; WIPE_START
M204 S6000
G1 X86.21 Y135.66 E-.46416
G1 X85.431 Y135.66 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.306 Y130.788 Z7.8 F42000
G1 X103.668 Y120.536 Z7.8
G1 Z7.4
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X103.745 Y120.763 E.00737
G3 X103.788 Y121.032 I-1.362 J.355 E.00838
G1 X103.788 Y134.968 E.42821
G3 X102.395 Y136.29 I-1.398 J-.078 E.06505
G1 X81.605 Y136.29 E.63881
G3 X80.21 Y134.895 I0 J-1.395 E.06735
G1 X80.21 Y121.103 E.42379
G3 X81.605 Y119.71 I1.395 J.002 E.06727
G1 X102.402 Y119.71 E.63902
G3 X103.64 Y120.483 I-.019 J1.408 E.04714
M204 S10000
G1 X103.057 Y120.108 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.214061
G1 F15000
M204 S6000
G1 X102.719 Y120.049 E.00478
; LINE_WIDTH: 0.279629
G2 X102.394 Y120.025 I-.344 J2.459 E.0063
G1 X97.594 Y120.025 E.09258
M204 S10000
G1 X86.406 Y120.025 F42000
; LINE_WIDTH: 0.2802
G1 F15000
M204 S6000
G1 X81.613 Y120.025 E.09267
G2 X81.335 Y120.042 I-.004 J2.256 E.00539
; LINE_WIDTH: 0.231492
G1 X81.227 Y120.058 E.00168
; LINE_WIDTH: 0.193917
G1 X80.945 Y120.114 E.00354
M204 S10000
G1 X80.948 Y120.125 F42000
; LINE_WIDTH: 0.107821
G1 F15000
M204 S6000
G1 X81.67 Y119.906 E.00399
; WIPE_START
G1 X80.948 Y120.125 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.324 Y122.315 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.383797
G1 F10561.013
M204 S6000
G1 X84.192 Y122.342 E.00374
G1 X84.165 Y122.474 E.00374
G1 X84.165 Y133.526 E.30699
G1 X84.192 Y133.658 E.00374
G1 X84.324 Y133.685 E.00374
G1 X86.806 Y133.685 E.06893
G1 X86.937 Y133.713 E.00374
G1 X86.965 Y133.844 E.00374
G1 X86.965 Y135.376 E.04254
G1 X86.992 Y135.508 E.00374
G1 X87.124 Y135.535 E.00374
G1 X96.876 Y135.535 E.27088
G1 X97.008 Y135.508 E.00374
G1 X97.035 Y135.376 E.00374
G1 X97.035 Y133.844 E.04254
G1 X97.063 Y133.713 E.00374
G1 X97.194 Y133.685 E.00374
G1 X99.676 Y133.685 E.06893
G1 X99.808 Y133.658 E.00374
G1 X99.835 Y133.526 E.00374
G1 X99.835 Y122.474 E.30699
G1 X99.808 Y122.342 E.00374
G1 X99.676 Y122.315 E.00374
G1 X97.194 Y122.315 E.06893
G1 X97.063 Y122.287 E.00374
G1 X97.035 Y122.156 E.00374
G1 X97.035 Y120.624 E.04254
G1 X97.008 Y120.492 E.00374
G1 X96.876 Y120.465 E.00374
G1 X87.124 Y120.465 E.27088
G1 X86.992 Y120.492 E.00374
G1 X86.965 Y120.624 E.00374
G1 X86.965 Y122.156 E.04254
G1 X86.937 Y122.287 E.00374
G1 X86.806 Y122.315 E.00374
G1 X84.384 Y122.315 E.06727
; WIPE_START
G1 X86.384 Y122.315 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.396 Y129.947 Z7.8 F42000
G1 X86.406 Y135.975 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280224
G1 F15000
M204 S6000
G1 X81.613 Y135.975 E.09268
G3 X81.335 Y135.958 I-.004 J-2.257 E.00538
; LINE_WIDTH: 0.231626
G1 X81.227 Y135.942 E.00168
; LINE_WIDTH: 0.193716
G1 X80.943 Y135.886 E.00355
M204 S10000
G1 X80.946 Y135.875 F42000
; LINE_WIDTH: 0.105216
G1 F15000
M204 S6000
G1 X81.694 Y136.094 E.00395
M204 S10000
G1 X97.594 Y135.975 F42000
; LINE_WIDTH: 0.279802
G1 F15000
M204 S6000
G1 X102.387 Y135.975 E.09251
G2 X102.719 Y135.951 I-.041 J-2.886 E.00643
; LINE_WIDTH: 0.214266
G1 X103.057 Y135.892 E.00479
; WIPE_START
G1 X102.719 Y135.951 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.951 Y133.323 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.323 Y133.323 E.05401
G1 X86.677 Y122.677 E.49938
G1 X87.327 Y122.677 E.02156
G1 X87.327 Y120.828 E.06137
G1 X91.496 Y120.828 E.13829
G1 X84.527 Y127.797 E.32693
G1 X84.527 Y128.203 E.0135
G1 X91.497 Y135.173 E.32693
G1 X92.503 Y135.173 E.0334
G1 X99.473 Y128.203 E.32693
G1 X99.473 Y127.797 E.0135
G1 X92.504 Y120.828 E.32693
G1 X96.673 Y120.828 E.13829
G1 X96.673 Y122.677 E.06136
G1 X97.323 Y122.677 E.02156
G1 X86.677 Y133.323 E.49938
G1 X85.049 Y133.323 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X86.677 Y133.323 E-.61876
G1 X86.94 Y133.06 E-.14125
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 38/42
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
M106 S181.05
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z7.8 I.206 J1.199 P1  F42000
G1 X155.802 Y121.223 Z7.8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X152.604 Y121.223 E.1061
G3 X153.615 Y120.102 I1.013 J-.103 E.05641
G1 X174.39 Y120.102 E.68915
G3 X175.403 Y121.223 I-.002 J1.02 E.05643
G1 X172.198 Y121.223 E.10632
G1 X172.198 Y134.777 E.44962
G1 X175.396 Y134.777 E.1061
G3 X174.385 Y135.898 I-1.007 J.108 E.05651
G1 X153.615 Y135.898 E.68899
G3 X152.604 Y134.777 I-.006 J-1.011 E.05654
G1 X155.802 Y134.777 E.1061
G1 X155.802 Y121.283 E.44763
M204 S250
G1 X155.41 Y121.615 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X154.697 Y121.615 E.02189
G1 X154.69 Y121.815 E.00615
G1 X154.31 Y121.815 E.01169
G1 X154.305 Y121.615 E.00615
G1 X153.497 Y121.615 E.02482
G1 X153.49 Y121.815 E.00615
G1 X153.11 Y121.815 E.01169
G1 X153.105 Y121.615 E.00615
G1 X152.21 Y121.615 E.0275
G3 X152.226 Y120.891 I3.685 J-.283 E.02227
G3 X153.605 Y119.71 I1.384 J.22 E.06071
G1 X174.4 Y119.71 E.63896
G3 X175.79 Y121.105 I-.005 J1.395 E.06719
G1 X175.79 Y121.615 E.01566
G1 X174.897 Y121.615 E.02742
G1 X174.89 Y121.815 E.00615
G1 X174.51 Y121.815 E.01169
G1 X174.505 Y121.615 E.00615
G1 X173.695 Y121.615 E.02491
G1 X173.69 Y121.815 E.00614
G1 X173.31 Y121.814 E.01169
G1 X173.303 Y121.615 E.00613
G1 X172.59 Y121.615 E.02189
G1 X172.59 Y134.385 E.39239
G1 X173.302 Y134.385 E.02189
G1 X173.31 Y134.185 E.00615
G1 X173.69 Y134.185 E.01169
G1 X173.695 Y134.385 E.00615
G1 X174.502 Y134.385 E.02482
G1 X174.51 Y134.185 E.00615
G1 X174.89 Y134.185 E.01169
G1 X174.895 Y134.385 E.00615
G1 X175.789 Y134.385 E.02749
G3 X175.774 Y135.109 I-3.685 J.283 E.02227
G3 X174.395 Y136.29 I-1.385 J-.221 E.0607
G1 X153.605 Y136.29 E.6388
G3 X152.212 Y134.97 I.013 J-1.408 E.06488
G1 X152.21 Y134.385 E.01798
G1 X153.102 Y134.385 E.02741
G1 X153.11 Y134.185 E.00615
G1 X153.49 Y134.185 E.01169
G1 X153.495 Y134.385 E.00615
G1 X154.305 Y134.385 E.02491
G1 X154.31 Y134.185 E.00614
G1 X154.69 Y134.186 E.01169
G1 X154.697 Y134.385 E.00613
G1 X155.41 Y134.385 E.02189
G1 X155.41 Y121.675 E.39054
; WIPE_START
M204 S6000
G1 X154.697 Y121.615 E-.27171
G1 X154.69 Y121.815 E-.07605
G1 X154.31 Y121.815 E-.14456
G1 X154.305 Y121.615 E-.07602
G1 X153.801 Y121.615 E-.19167
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
G1 X155.768 Y120.484 F42000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.399467
G1 F10096.85
M204 S6000
G1 X153.627 Y120.484 E.0622
G1 X153.231 Y120.616 E.01215
G1 X153.047 Y120.842 E.00847
G2 X153.633 Y120.841 I.264 J-17.7 E.01704
G1 X155.768 Y120.841 E.06203
G1 X155.768 Y120.544 E.00863
; WIPE_START
G1 X155.768 Y120.841 E-.11282
G1 X154.065 Y120.841 E-.64718
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X155.096 Y128.403 Z8 F42000
G1 X155.969 Y134.808 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40619
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X156.69 Y135.528 E.05378
G1 X157.335 Y135.528 E.03406
G1 X156.172 Y134.365 E.08683
G1 X156.172 Y133.72 E.03406
G1 X157.98 Y135.528 E.135
G1 X158.625 Y135.528 E.03406
G1 X156.172 Y133.075 E.18317
G1 X156.172 Y132.43 E.03406
G1 X159.27 Y135.528 E.23134
G1 X159.915 Y135.528 E.03406
G1 X156.172 Y131.785 E.27952
G1 X156.172 Y131.14 E.03406
G1 X160.56 Y135.528 E.32769
G1 X161.206 Y135.528 E.03406
G1 X156.172 Y130.494 E.37586
G1 X156.172 Y129.849 E.03406
G1 X161.851 Y135.528 E.42403
G1 X162.496 Y135.528 E.03406
G1 X156.172 Y129.204 E.4722
G1 X156.172 Y128.559 E.03406
G1 X163.141 Y135.528 E.52037
G1 X163.786 Y135.528 E.03406
G1 X156.172 Y127.914 E.56854
G1 X156.172 Y127.269 E.03406
G1 X164.431 Y135.528 E.61671
G1 X165.077 Y135.528 E.03406
G1 X156.172 Y126.623 E.66488
G1 X156.172 Y125.978 E.03406
G1 X165.722 Y135.528 E.71305
G1 X166.367 Y135.528 E.03406
G1 X156.172 Y125.333 E.76122
G1 X156.172 Y124.688 E.03406
G1 X167.012 Y135.528 E.80939
G1 X167.657 Y135.528 E.03406
G1 X156.172 Y124.043 E.85756
G1 X156.172 Y123.398 E.03406
G1 X168.302 Y135.528 E.90574
G1 X168.947 Y135.528 E.03406
G1 X156.172 Y122.753 E.95391
G1 X156.172 Y122.107 E.03406
G1 X169.593 Y135.528 E1.00208
G1 X170.238 Y135.528 E.03406
G1 X156.172 Y121.462 E1.05025
G1 X156.172 Y120.817 E.03406
G1 X170.883 Y135.528 E1.09842
G1 X171.528 Y135.528 E.03406
G1 X156.472 Y120.472 E1.1242
G1 X157.117 Y120.472 E.03406
G1 X171.828 Y135.183 E1.09844
G1 X171.828 Y134.538 E.03406
G1 X157.762 Y120.472 E1.05027
G1 X158.407 Y120.472 E.03406
G1 X171.828 Y133.893 E1.0021
G1 X171.828 Y133.248 E.03406
G1 X159.052 Y120.472 E.95393
G1 X159.697 Y120.472 E.03406
G1 X171.828 Y132.603 E.90576
G1 X171.828 Y131.957 E.03406
G1 X160.343 Y120.472 E.85759
G1 X160.988 Y120.472 E.03406
G1 X171.828 Y131.312 E.80942
G1 X171.828 Y130.667 E.03406
G1 X161.633 Y120.472 E.76125
G1 X162.278 Y120.472 E.03406
G1 X171.828 Y130.022 E.71308
G1 X171.828 Y129.377 E.03406
G1 X162.923 Y120.472 E.6649
G1 X163.568 Y120.472 E.03406
G1 X171.828 Y128.732 E.61673
G1 X171.828 Y128.087 E.03406
G1 X164.213 Y120.472 E.56856
G1 X164.859 Y120.472 E.03406
G1 X171.828 Y127.441 E.52039
G1 X171.828 Y126.796 E.03406
G1 X165.504 Y120.472 E.47222
G1 X166.149 Y120.472 E.03406
G1 X171.828 Y126.151 E.42405
G1 X171.828 Y125.506 E.03406
G1 X166.794 Y120.472 E.37588
G1 X167.439 Y120.472 E.03406
G1 X171.828 Y124.861 E.32771
M73 P85 R3
G1 X171.828 Y124.216 E.03406
G1 X168.084 Y120.472 E.27953
G1 X168.73 Y120.472 E.03406
G1 X171.828 Y123.571 E.23136
G1 X171.828 Y122.925 E.03406
G1 X169.375 Y120.472 E.18319
G1 X170.02 Y120.472 E.03406
G1 X171.828 Y122.28 E.13502
G1 X171.828 Y121.635 E.03406
G1 X170.665 Y120.472 E.08685
G1 X171.31 Y120.472 E.03406
G1 X172.031 Y121.192 E.0538
M106 S181.05
M204 S10000
G1 X174.837 Y120.682 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.399755
; LAYER_HEIGHT: 0.2
G1 F10088.704
M204 S6000
G1 X174.594 Y120.528 E.00836
G1 X174.35 Y120.484 E.00723
G1 X172.232 Y120.484 E.06159
G1 X172.232 Y120.841 E.01038
G1 X174.936 Y120.841 E.07865
G1 X174.869 Y120.733 E.00371
; WIPE_START
G1 X174.936 Y120.841 E-.04848
G1 X173.064 Y120.841 E-.71152
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X173.751 Y128.442 Z8 F42000
G1 X174.358 Y135.159 Z8
G1 Z7.6
G1 E.8 F1800
; LINE_WIDTH: 0.398973
G1 F10110.875
M204 S6000
G1 X172.232 Y135.159 E.0617
G1 X172.232 Y135.516 E.01036
G1 X174.367 Y135.516 E.06195
G1 X174.544 Y135.492 E.0052
G1 X174.779 Y135.372 E.00765
G1 X174.957 Y135.156 E.0081
G1 X174.418 Y135.159 E.01562
M204 S10000
G1 X155.768 Y135.159 F42000
; LINE_WIDTH: 0.398469
G1 F10125.191
M204 S6000
G3 X153.041 Y135.155 I-1.061 J-200.43 E.07903
G1 X153.237 Y135.388 E.00883
G1 X153.488 Y135.502 E.00799
G1 X153.648 Y135.516 E.00465
G1 X155.768 Y135.516 E.06143
G1 X155.768 Y135.219 E.0086
; OBJECT_ID: 405
; WIPE_START
G1 X155.768 Y135.516 E-.11283
G1 X154.065 Y135.516 E-.64717
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X147.017 Y132.586 Z8 F42000
G1 X119.802 Y121.273 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X116.603 Y121.273 E.1061
G3 X117.615 Y120.102 I1.017 J-.144 E.05812
G1 X136.198 Y120.102 E.61644
G1 X136.198 Y134.727 E.48514
G1 X139.397 Y134.727 E.1061
G3 X138.385 Y135.898 I-1.011 J.149 E.05822
G1 X119.802 Y135.898 E.61643
G1 X119.802 Y121.333 E.48315
M204 S250
G1 X119.41 Y121.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X116.21 Y121.665 E.09831
G1 X116.212 Y121.032 E.01944
G3 X117.605 Y119.71 I1.393 J.072 E.06511
G1 X136.59 Y119.71 E.58335
G1 X136.59 Y120.085 E.01152
G1 X136.59 Y120.485 E.01229
G1 F5325.948
G1 X136.59 Y120.885 E.01229
G1 F2049.036
G1 X136.631 Y120.885 E.00126
M106 S255
G1 F1800
G1 X137 Y120.885 E.01134
M106 S181.05
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
G1 X138.99 Y120.885 E.06601
G1 X138.99 Y121.265 E.01261
G1 X137 Y121.265 E.06601
M106 S181.05
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X136.631 Y121.265 E.01134
M106 S181.05
G1 F2049.036
G1 X136.59 Y121.265 E.00126
G1 F5325.948
G1 X136.59 Y121.665 E.01229
G1 F9547.055
G1 X136.59 Y122.065 E.01229
G1 X136.59 Y134.335 E.37702
G1 X139.79 Y134.335 E.09831
G1 X139.788 Y134.968 E.01944
G3 X138.395 Y136.29 I-1.389 J-.069 E.06515
G1 X119.41 Y136.29 E.58334
G1 X119.41 Y135.915 E.01152
G1 X119.41 Y135.515 E.01229
G1 F5325.948
G1 X119.41 Y135.115 E.01229
G1 F2049.036
G1 X119.369 Y135.115 E.00126
M106 S255
G1 F1800
G1 X119 Y135.115 E.01134
M106 S181.05
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
G1 X117.01 Y135.115 E.06601
G1 X117.01 Y134.735 E.01261
G1 X119 Y134.735 E.06601
M106 S181.05
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X119.369 Y134.735 E.01134
M106 S181.05
G1 F2049.036
G1 X119.41 Y134.735 E.00126
G1 F5325.948
G1 X119.41 Y134.335 E.01229
G1 F9547.055
G1 X119.41 Y133.935 E.01229
G1 X119.41 Y121.725 E.37518
M204 S10000
G1 X119.756 Y120.878 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.42347
G1 F9460.01
M204 S6000
G1 X119.756 Y120.497 E.01184
G1 X117.638 Y120.497 E.06567
G1 X117.314 Y120.568 E.01028
G2 X117.045 Y120.883 I.287 J.517 E.01312
G3 X119.696 Y120.878 I1.627 J178.267 E.08219
M204 S10000
G1 X120.892 Y120.269 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.40619
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X120.172 Y120.99 E.05381
G1 X120.172 Y121.635 E.03406
G1 X121.335 Y120.472 E.08686
G1 X121.98 Y120.472 E.03406
G1 X120.172 Y122.28 E.13503
G1 X120.172 Y122.925 E.03406
G1 X122.625 Y120.472 E.1832
G1 X123.271 Y120.472 E.03406
G1 X120.172 Y123.571 E.23137
G1 X120.172 Y124.216 E.03406
G1 X123.916 Y120.472 E.27954
G1 X124.561 Y120.472 E.03406
G1 X120.172 Y124.861 E.32771
G1 X120.172 Y125.506 E.03406
G1 X125.206 Y120.472 E.37588
G1 X125.851 Y120.472 E.03406
G1 X120.172 Y126.151 E.42406
G1 X120.172 Y126.796 E.03406
G1 X126.496 Y120.472 E.47223
G1 X127.141 Y120.472 E.03406
G1 X120.172 Y127.441 E.5204
G1 X120.172 Y128.087 E.03406
G1 X127.787 Y120.472 E.56857
G1 X128.432 Y120.472 E.03406
G1 X120.172 Y128.732 E.61674
G1 X120.172 Y129.377 E.03406
G1 X129.077 Y120.472 E.66491
G1 X129.722 Y120.472 E.03406
G1 X120.172 Y130.022 E.71308
G1 X120.172 Y130.667 E.03406
G1 X130.367 Y120.472 E.76125
G1 X131.012 Y120.472 E.03406
G1 X120.172 Y131.312 E.80942
G1 X120.172 Y131.957 E.03406
G1 X131.657 Y120.472 E.85759
G1 X132.303 Y120.472 E.03406
G1 X120.172 Y132.603 E.90576
G1 X120.172 Y133.248 E.03406
G1 X132.948 Y120.472 E.95393
G1 X133.593 Y120.472 E.03406
G1 X120.172 Y133.893 E1.00211
G1 X120.172 Y134.538 E.03406
G1 X134.238 Y120.472 E1.05028
G1 X134.883 Y120.472 E.03406
G1 X120.172 Y135.183 E1.09845
G1 X120.172 Y135.528 E.01821
G1 X120.472 Y135.528 E.01585
G1 X135.528 Y120.472 E1.1242
G1 X135.828 Y120.472 E.01583
G1 X135.828 Y120.817 E.01823
G1 X121.117 Y135.528 E1.09842
G1 X121.762 Y135.528 E.03406
G1 X135.828 Y121.462 E1.05025
G1 X135.828 Y122.107 E.03406
G1 X122.407 Y135.528 E1.00208
G1 X123.053 Y135.528 E.03406
G1 X135.828 Y122.753 E.95391
G1 X135.828 Y123.398 E.03406
G1 X123.698 Y135.528 E.90574
G1 X124.343 Y135.528 E.03406
G1 X135.828 Y124.043 E.85756
G1 X135.828 Y124.688 E.03406
G1 X124.988 Y135.528 E.80939
G1 X125.633 Y135.528 E.03406
G1 X135.828 Y125.333 E.76122
G1 X135.828 Y125.978 E.03406
G1 X126.278 Y135.528 E.71305
G1 X126.923 Y135.528 E.03406
G1 X135.828 Y126.623 E.66488
G1 X135.828 Y127.269 E.03406
G1 X127.569 Y135.528 E.61671
G1 X128.214 Y135.528 E.03406
G1 X135.828 Y127.914 E.56854
G1 X135.828 Y128.559 E.03406
G1 X128.859 Y135.528 E.52037
G1 X129.504 Y135.528 E.03406
G1 X135.828 Y129.204 E.4722
G1 X135.828 Y129.849 E.03406
M73 P86 R3
G1 X130.149 Y135.528 E.42403
G1 X130.794 Y135.528 E.03406
G1 X135.828 Y130.494 E.37586
G1 X135.828 Y131.14 E.03406
G1 X131.44 Y135.528 E.32769
G1 X132.085 Y135.528 E.03406
G1 X135.828 Y131.785 E.27952
G1 X135.828 Y132.43 E.03406
G1 X132.73 Y135.528 E.23134
G1 X133.375 Y135.528 E.03406
G1 X135.828 Y133.075 E.18317
G1 X135.828 Y133.72 E.03406
G1 X134.02 Y135.528 E.135
G1 X134.665 Y135.528 E.03406
G1 X135.828 Y134.365 E.08683
G1 X135.828 Y135.01 E.03406
G1 X135.108 Y135.731 E.05378
M106 S181.05
M204 S10000
G1 X136.244 Y135.122 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.422314
; LAYER_HEIGHT: 0.2
G1 F9488.821
M204 S6000
G1 X136.244 Y135.503 E.01181
G1 X138.36 Y135.503 E.06541
G1 X138.634 Y135.453 E.00862
G2 X138.959 Y135.114 I-.298 J-.611 E.01484
G3 X136.304 Y135.122 I-1.635 J-102.622 E.08208
; OBJECT_ID: 394
; WIPE_START
G1 X138.304 Y135.116 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X130.673 Y134.988 Z8 F42000
G1 X97.79 Y134.44 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X103.41 Y134.44 E.17269
G1 X103.41 Y135.66 E.03749
G1 X97.79 Y135.66 E.17269
G1 X97.79 Y134.5 E.03564
; WIPE_START
M204 S6000
G1 X99.79 Y134.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.59 Y134.31 Z8 F42000
G1 Z7.6
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X100.59 Y121.69 E.38778
G1 X103.56 Y121.69 E.09126
G1 X103.56 Y134.31 E.38778
G1 X100.65 Y134.31 E.08942
; WIPE_START
M204 S6000
G1 X100.641 Y132.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.684 Y124.933 Z8 F42000
G1 X97.79 Y121.56 Z8
G1 Z7.6
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X97.79 Y120.34 E.03749
G1 X103.41 Y120.34 E.17269
G1 X103.41 Y121.56 E.03749
G1 X97.85 Y121.56 E.17084
M204 S10000
G1 X97.398 Y121.56 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X97.398 Y121.952 E.01301
G1 X100.198 Y121.952 E.09288
G1 X100.198 Y134.048 E.40124
G1 X97.398 Y134.048 E.09288
G1 X97.398 Y135.898 E.06137
G1 X86.602 Y135.898 E.35812
G1 X86.602 Y134.048 E.06137
G1 X83.802 Y134.048 E.09288
G1 X83.802 Y121.952 E.40124
G1 X86.602 Y121.952 E.09288
G1 X86.602 Y120.102 E.06137
G1 X97.398 Y120.102 E.35812
G1 X97.398 Y121.5 E.04637
; WIPE_START
G1 X97.398 Y121.952 E-.17179
G1 X98.946 Y121.952 E-.58821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.317 Y121.717 Z8 F42000
G1 X86.21 Y121.56 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X80.59 Y121.56 E.17269
G1 X80.59 Y120.34 E.03749
G1 X86.21 Y120.34 E.17269
G1 X86.21 Y121.5 E.03564
; WIPE_START
M204 S6000
G1 X84.21 Y121.521 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.41 Y121.69 Z8 F42000
G1 Z7.6
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X83.41 Y134.31 E.38778
G1 X80.44 Y134.31 E.09126
G1 X80.44 Y121.69 E.38778
G1 X83.35 Y121.69 E.08942
; WIPE_START
M204 S6000
G1 X83.36 Y123.69 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.316 Y131.067 Z8 F42000
G1 X86.21 Y134.44 Z8
G1 Z7.6
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X86.21 Y135.66 E.03749
G1 X80.59 Y135.66 E.17269
G1 X80.59 Y134.44 E.03749
G1 X86.15 Y134.44 E.17084
; WIPE_START
M204 S6000
G1 X86.21 Y135.66 E-.46416
G1 X85.431 Y135.66 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.306 Y130.787 Z8 F42000
G1 X103.667 Y120.535 Z8
G1 Z7.6
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X103.745 Y120.763 E.00742
G3 X103.788 Y121.032 I-1.362 J.355 E.00838
G1 X103.788 Y134.968 E.42822
G3 X102.395 Y136.29 I-1.398 J-.078 E.06504
G1 X81.605 Y136.29 E.6388
G3 X80.21 Y134.895 I0 J-1.395 E.06735
G1 X80.21 Y121.103 E.42379
G3 X81.605 Y119.71 I1.395 J.002 E.06727
G1 X102.4 Y119.71 E.63896
G3 X103.639 Y120.482 I-.017 J1.408 E.04715
M204 S10000
G1 X103.057 Y120.108 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.214132
G1 F15000
M204 S6000
G1 X102.719 Y120.049 E.00479
; LINE_WIDTH: 0.279678
G2 X102.392 Y120.025 I-.344 J2.466 E.00633
G1 X97.594 Y120.025 E.09256
; WIPE_START
G1 X99.594 Y120.025 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.603 Y120.269 Z8 F42000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.409
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X97.028 Y120.695 E.03222
G1 X97.028 Y121.344 E.03475
G1 X95.953 Y120.269 E.08136
M106 S181.05
; WIPE_START
G1 X97.028 Y121.344 E-.57759
G1 X97.028 Y120.864 E-.18241
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.102 Y122.119 Z8 F42000
G1 Z7.6
G1 E.8 F1800
M106 S255
G1 F3000
M204 S6000
G1 X99.828 Y122.846 E.05501
G1 X99.828 Y123.495 E.03475
G1 X98.655 Y122.322 E.08882
G1 X98.006 Y122.322 E.03475
G1 X99.828 Y124.144 E.13796
G1 X99.828 Y124.793 E.03475
G1 X95.507 Y120.472 E.32714
G1 X94.858 Y120.472 E.03475
G1 X99.828 Y125.442 E.37628
G1 X99.828 Y126.092 E.03475
G1 X94.209 Y120.472 E.42542
G1 X93.559 Y120.472 E.03475
G1 X99.828 Y126.741 E.47456
G1 X99.828 Y127.39 E.03475
G1 X92.91 Y120.472 E.52371
G1 X92.261 Y120.472 E.03475
G1 X99.828 Y128.039 E.57285
G1 X99.828 Y128.688 E.03475
G1 X91.612 Y120.472 E.62199
G1 X90.963 Y120.472 E.03475
G1 X99.828 Y129.337 E.67113
G1 X99.828 Y129.986 E.03475
G1 X90.314 Y120.472 E.72027
G1 X89.665 Y120.472 E.03475
G1 X99.828 Y130.635 E.76941
G1 X99.828 Y131.285 E.03475
G1 X89.016 Y120.472 E.81855
G1 X88.366 Y120.472 E.03475
G1 X99.828 Y131.934 E.86769
G1 X99.828 Y132.583 E.03475
G1 X87.717 Y120.472 E.91683
G1 X87.068 Y120.472 E.03475
G1 X99.828 Y133.232 E.96597
G1 X99.828 Y133.678 E.02389
G1 X99.625 Y133.678 E.01086
G1 X86.972 Y121.025 E.95791
G1 X86.972 Y121.674 E.03475
G1 X98.976 Y133.678 E.90877
G1 X98.327 Y133.678 E.03475
G1 X86.971 Y122.322 E.85971
G1 X86.322 Y122.322 E.03475
M73 P87 R3
G1 X97.678 Y133.678 E.85971
G1 X97.029 Y133.678 E.03475
G1 X85.672 Y122.322 E.85971
G1 X85.023 Y122.322 E.03475
G1 X97.028 Y134.327 E.9088
G1 X97.028 Y134.976 E.03475
G1 X84.374 Y122.322 E.95794
G1 X84.172 Y122.322 E.01084
G1 X84.172 Y122.768 E.02391
G1 X96.932 Y135.528 E.96595
G1 X96.282 Y135.528 E.03475
G1 X84.172 Y123.418 E.91681
G1 X84.172 Y124.067 E.03475
G1 X95.633 Y135.528 E.86767
G1 X94.984 Y135.528 E.03475
G1 X84.172 Y124.716 E.81853
G1 X84.172 Y125.365 E.03475
G1 X94.335 Y135.528 E.76939
G1 X93.686 Y135.528 E.03475
G1 X84.172 Y126.014 E.72024
G1 X84.172 Y126.663 E.03475
G1 X93.037 Y135.528 E.6711
G1 X92.388 Y135.528 E.03475
G1 X84.172 Y127.312 E.62196
G1 X84.172 Y127.961 E.03475
G1 X91.739 Y135.528 E.57282
G1 X91.089 Y135.528 E.03475
G1 X84.172 Y128.611 E.52368
G1 X84.172 Y129.26 E.03475
G1 X90.44 Y135.528 E.47454
G1 X89.791 Y135.528 E.03475
G1 X84.172 Y129.909 E.4254
G1 X84.172 Y130.558 E.03475
G1 X89.142 Y135.528 E.37626
G1 X88.493 Y135.528 E.03475
G1 X83.969 Y131.005 E.34245
M106 S181.05
M204 S10000
G1 X83.969 Y132.952 F42000
M106 S255
G1 F3000
M204 S6000
G1 X84.696 Y133.678 E.05498
G1 X85.345 Y133.678 E.03475
G1 X84.172 Y132.505 E.08879
G1 X84.172 Y131.856 E.03475
G1 X86.196 Y133.881 E.15326
M106 S181.05
M204 S10000
G1 X86.769 Y134.454 F42000
M106 S255
G1 F3000
M204 S6000
G1 X87.844 Y135.528 E.08134
G1 X87.195 Y135.528 E.03475
G1 X86.769 Y135.103 E.0322
M106 S181.05
M204 S10000
G1 X86.406 Y135.975 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.28022
; LAYER_HEIGHT: 0.2
G1 F15000
M204 S6000
G1 X81.613 Y135.975 E.09268
G3 X81.335 Y135.958 I-.007 J-2.211 E.00539
; LINE_WIDTH: 0.21297
G3 X80.944 Y135.89 I.733 J-5.336 E.0055
; WIPE_START
G1 X81.335 Y135.958 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.147 Y128.328 Z8 F42000
G1 X80.944 Y120.11 Z8
G1 Z7.6
G1 E.8 F1800
; LINE_WIDTH: 0.213319
G1 F15000
M204 S6000
G3 X81.335 Y120.042 I1.142 J5.388 E.00551
; LINE_WIDTH: 0.280209
G3 X81.613 Y120.025 I.274 J2.233 E.0054
G1 X86.406 Y120.025 E.09267
; WIPE_START
G1 X84.406 Y120.025 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.27 Y125.907 Z8 F42000
G1 X97.594 Y135.975 Z8
G1 Z7.6
G1 E.8 F1800
; LINE_WIDTH: 0.280476
G1 F15000
M204 S6000
G1 X102.387 Y135.975 E.09278
G2 X102.618 Y135.964 I.001 J-2.363 E.00448
; LINE_WIDTH: 0.237221
G2 X102.779 Y135.941 I-.225 J-2.212 E.00258
; LINE_WIDTH: 0.205788
G1 X103.056 Y135.89 E.00374
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X102.779 Y135.941 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 39/42
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
M106 S178.5
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z8 I.011 J1.217 P1  F42000
G1 X152.804 Y135.499 Z8
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X152.682 Y135.288 I.8 J-.604 E.00811
G1 X152.612 Y135.04 E.00856
G1 F8047.587
G1 X152.602 Y134.885 E.00514
G1 F6236.356
G1 X152.602 Y134.357 E.0175
M106 S255
G1 F1800
G1 X152.602 Y133.975 E.01269
M106 S178.5
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X152.602 Y122.025 E.3964
M106 S178.5
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X152.602 Y121.642 E.01269
M106 S178.5
G1 F6232.745
G1 X152.602 Y121.115 E.01749
G1 F8843.478
G1 X152.631 Y120.865 E.00837
G3 X153.615 Y120.102 I.978 J.246 E.04453
G1 X174.388 Y120.102 E.68907
G3 X175.363 Y120.851 I-.001 J1.011 E.04385
G1 X175.396 Y121.051 E.00673
G1 F6953.562
G1 X175.396 Y121.642 E.01961
M106 S255
G1 F1800
G1 X175.396 Y122.025 E.01269
M106 S178.5
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X175.396 Y133.975 E.3964
M106 S178.5
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X175.396 Y134.357 E.01269
M106 S178.5
M73 P87 R2
G1 F4919.51
G1 X175.394 Y134.757 E.01327
G1 F7443.877
G1 X175.393 Y134.99 E.00773
G1 F8843.478
G1 X175.355 Y135.19 E.00673
G3 X174.385 Y135.898 I-.956 J-.29 E.04273
G1 X153.615 Y135.898 E.68899
G3 X152.842 Y135.546 I-.01 J-1.003 E.02909
M204 S250
G1 X152.487 Y135.729 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X152.318 Y135.434 I1.118 J-.834 E.01047
G1 X152.225 Y135.102 E.0106
G1 F9015.22
G1 X152.21 Y134.895 E.00638
G1 F6491.689
G1 X152.21 Y134.344 E.01692
M106 S255
G1 F1800
G1 X152.21 Y133.975 E.01134
M106 S178.5
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X152.21 Y122.025 E.3964
M106 S178.5
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X152.21 Y121.656 E.01134
M106 S178.5
G1 F6492.135
G1 X152.21 Y121.105 E.01692
G1 F9547.055
G1 X152.251 Y120.765 E.01054
G3 X153.605 Y119.71 I1.36 J.349 E.05675
G1 X174.398 Y119.71 E.63889
G3 X175.745 Y120.761 I-.015 J1.408 E.05639
G1 X175.788 Y121.032 E.00845
G1 F7337.242
G1 X175.788 Y121.256 E.00688
G1 F4919.51
G1 X175.788 Y121.656 E.01229
M106 S255
G1 F1800
G1 X175.788 Y122.025 E.01134
M106 S178.5
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X175.788 Y133.975 E.3964
M106 S178.5
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X175.788 Y134.344 E.01134
M106 S178.5
G1 F4919.51
G1 X175.785 Y134.744 E.01229
G1 F8138.717
G1 X175.783 Y135.034 E.0089
G1 F9547.055
G1 X175.73 Y135.303 E.00845
G3 X174.395 Y136.29 I-1.331 J-.405 E.05466
G1 X153.605 Y136.29 E.6388
G3 X152.523 Y135.776 I-.001 J-1.395 E.03803
; WIPE_START
M204 S6000
G1 X152.318 Y135.434 E-.15174
G1 X152.225 Y135.102 E-.13111
G1 X152.21 Y134.895 E-.07886
G1 X152.21 Y134.344 E-.20922
G1 X152.21 Y133.975 E-.14022
G1 X152.21 Y133.846 E-.04885
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
G1 X155.872 Y135.419 F42000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42194
G1 F9498.179
M204 S6000
G1 X156.018 Y135.565 E.00637
G1 X156.554 Y135.565 E.01656
G1 X156.31 Y135.32 E.01068
G1 X156.437 Y135.177 E.0059
G1 X156.544 Y135.018 E.00593
G1 X157.09 Y135.565 E.02387
G1 X157.626 Y135.565 E.01656
G1 X156.71 Y134.649 E.04001
G1 X156.776 Y134.389 E.00828
G1 X156.794 Y134.197 E.00595
G1 X158.162 Y135.565 E.05975
G1 X158.698 Y135.565 E.01656
G1 X156.794 Y133.661 E.08316
G1 X156.794 Y133.125 E.01655
G1 X159.234 Y135.565 E.10657
G1 X159.77 Y135.565 E.01656
G1 X156.794 Y132.589 E.12999
G1 X156.794 Y132.053 E.01655
G1 X160.306 Y135.565 E.1534
G1 X160.842 Y135.565 E.01656
G1 X156.794 Y131.517 E.17681
G1 X156.794 Y130.981 E.01655
G1 X161.378 Y135.565 E.20022
G1 X161.914 Y135.565 E.01656
G1 X156.794 Y130.445 E.22364
G1 X156.794 Y129.909 E.01655
G1 X162.45 Y135.565 E.24705
G1 X162.987 Y135.565 E.01656
G1 X156.794 Y129.373 E.27046
G1 X156.794 Y128.837 E.01655
G1 X163.523 Y135.565 E.29387
G1 X164.059 Y135.565 E.01656
G1 X156.794 Y128.301 E.31729
G1 X156.794 Y127.765 E.01656
G1 X164.595 Y135.565 E.3407
G1 X165.131 Y135.565 E.01656
G1 X156.794 Y127.229 E.36411
G1 X156.794 Y126.693 E.01656
G1 X165.667 Y135.565 E.38752
G1 X166.203 Y135.565 E.01656
G1 X156.794 Y126.157 E.41093
G1 X156.794 Y125.62 E.01656
G1 X166.739 Y135.565 E.43435
G1 X167.275 Y135.565 E.01656
G1 X156.794 Y125.084 E.45776
G1 X156.794 Y124.548 E.01656
G1 X167.811 Y135.565 E.48117
G1 X168.347 Y135.565 E.01656
G1 X156.794 Y124.012 E.50458
G1 X156.794 Y123.476 E.01656
G1 X168.883 Y135.565 E.528
G1 X169.419 Y135.565 E.01655
G1 X156.794 Y122.94 E.55141
M73 P88 R2
G1 X156.794 Y122.404 E.01656
G1 X169.955 Y135.565 E.57482
G1 X170.491 Y135.565 E.01655
G1 X156.794 Y121.868 E.59823
G1 X156.786 Y121.678 E.00589
G1 X156.754 Y121.503 E.0055
G1 X156.64 Y121.178 E.01064
G1 X171.027 Y135.565 E.6284
G1 X171.563 Y135.565 E.01655
G1 X156.433 Y120.435 E.66083
G1 X156.969 Y120.435 E.01656
G1 X171.363 Y134.829 E.62868
G1 X171.25 Y134.515 E.01031
G1 X171.214 Y134.322 E.00605
G1 X171.206 Y134.135 E.00577
G1 X157.505 Y120.435 E.5984
G1 X158.041 Y120.435 E.01656
G1 X171.206 Y133.599 E.57499
G1 X171.206 Y133.063 E.01655
G1 X158.577 Y120.435 E.55158
G1 X159.113 Y120.435 E.01656
G1 X171.206 Y132.527 E.52816
G1 X171.206 Y131.991 E.01655
G1 X159.65 Y120.435 E.50475
G1 X160.186 Y120.435 E.01656
G1 X171.206 Y131.455 E.48134
G1 X171.206 Y130.919 E.01655
G1 X160.722 Y120.435 E.45793
G1 X161.258 Y120.435 E.01655
G1 X171.206 Y130.383 E.43451
G1 X171.206 Y129.847 E.01655
G1 X161.794 Y120.435 E.4111
G1 X162.33 Y120.435 E.01656
G1 X171.206 Y129.311 E.38769
G1 X171.206 Y128.775 E.01655
G1 X162.866 Y120.435 E.36428
G1 X163.402 Y120.435 E.01655
G1 X171.206 Y128.239 E.34086
G1 X171.206 Y127.703 E.01655
G1 X163.938 Y120.435 E.31745
G1 X164.474 Y120.435 E.01656
G1 X171.206 Y127.167 E.29404
G1 X171.206 Y126.631 E.01655
G1 X165.01 Y120.435 E.27063
G1 X165.546 Y120.435 E.01656
G1 X171.206 Y126.095 E.24721
G1 X171.206 Y125.559 E.01655
G1 X166.082 Y120.435 E.2238
G1 X166.618 Y120.435 E.01656
G1 X171.206 Y125.023 E.20039
G1 X171.206 Y124.487 E.01655
G1 X167.154 Y120.435 E.17698
G1 X167.69 Y120.435 E.01656
G1 X171.206 Y123.951 E.15356
G1 X171.206 Y123.415 E.01655
G1 X168.226 Y120.435 E.13015
G1 X168.762 Y120.435 E.01656
G1 X171.206 Y122.879 E.10674
G1 X171.206 Y122.343 E.01656
G1 X169.298 Y120.435 E.08333
G1 X169.834 Y120.435 E.01656
G1 X171.206 Y121.807 E.05991
G1 X171.224 Y121.611 E.00607
G1 X171.289 Y121.354 E.00819
G1 X170.37 Y120.435 E.04013
G1 X170.906 Y120.435 E.01655
G1 X171.455 Y120.984 E.02397
G1 X171.563 Y120.823 E.00602
G1 X171.688 Y120.682 E.00581
G1 X171.442 Y120.435 E.01076
G1 X171.978 Y120.435 E.01655
G1 X172.125 Y120.582 E.00642
M204 S10000
G1 X171.587 Y134.824 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.42862
M106 S255
G1 F3000
M204 S6000
G1 X171.595 Y121.681 E.41311
G1 X171.641 Y121.488 E.00621
G1 X171.746 Y121.236 E.00859
G1 X171.864 Y121.051 E.00688
G1 X171.973 Y120.932 E.00507
G1 X171.973 Y135.068 E.44427
G1 X172.161 Y135.201 E.00725
G1 X172.358 Y135.292 E.00684
G1 X172.358 Y120.708 E.45836
G1 X172.526 Y120.647 E.00562
G1 X172.744 Y120.61 E.00695
G1 X172.744 Y135.39 E.46456
G1 X173.13 Y135.392 E.01212
G1 X173.13 Y120.608 E.46465
G1 X173.516 Y120.68 E.01233
G1 X173.516 Y135.32 E.46013
G1 X173.757 Y135.38 E.00782
G1 X173.901 Y135.392 E.00455
G1 X173.901 Y120.608 E.46467
G1 X174.287 Y120.608 E.01212
G1 X174.287 Y135.392 E.46467
G1 X174.441 Y135.38 E.00487
G1 X174.673 Y135.324 E.00749
G1 X174.673 Y120.677 E.46036
G1 X174.699 Y120.684 E.00088
G1 X174.861 Y120.638 E.00529
G3 X175.058 Y121.047 I-.412 J.45 E.01461
G1 X175.058 Y135.407 E.45131
M106 S178.5
; WIPE_START
G1 X175.058 Y133.407 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.2 I.668 J-1.018 P1  F42000
G1 X156.413 Y121.175 Z8.2
G1 Z7.8
G1 E.8 F1800
; LINE_WIDTH: 0.42882
M106 S255
G1 F3000
M204 S6000
G1 X156.405 Y134.319 E.41333
G1 X156.359 Y134.512 E.00622
G1 X156.254 Y134.764 E.0086
G1 X156.136 Y134.949 E.00689
G1 X156.027 Y135.068 E.00508
G1 X156.027 Y120.932 E.44451
G1 X155.839 Y120.799 E.00724
G1 X155.641 Y120.708 E.00685
G1 X155.641 Y135.292 E.45861
G1 X155.474 Y135.353 E.00561
G1 X155.255 Y135.391 E.00697
G1 X155.255 Y120.609 E.4648
G1 X154.869 Y120.608 E.01214
G1 X154.869 Y135.392 E.46489
G1 X154.483 Y135.32 E.01234
G1 X154.483 Y120.68 E.46039
G1 X154.243 Y120.62 E.00779
G1 X154.097 Y120.608 E.00459
G1 X154.097 Y135.392 E.46491
G1 X153.712 Y135.392 E.01213
G1 X153.712 Y120.608 E.46491
G1 X153.559 Y120.62 E.00482
G1 X153.326 Y120.677 E.00754
G1 X153.326 Y135.323 E.46057
G1 X153.301 Y135.316 E.00082
G1 X153.147 Y135.36 E.00502
G3 X152.94 Y134.894 I.339 J-.43 E.01666
G1 X152.94 Y120.596 E.44961
M106 S178.5
; OBJECT_ID: 405
; WIPE_START
G1 X152.94 Y122.596 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X145.322 Y122.131 Z8.2 F42000
G1 X116.896 Y120.396 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X117.615 Y120.102 I.712 J.714 E.02644
G1 X135.818 Y120.103 E.60381
G1 X136.218 Y120.103 E.01327
G1 F4919.51
G1 X136.617 Y120.103 E.01327
M106 S255
G1 F1800
G1 X137 Y120.103 E.01269
M106 S178.5
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X138.424 Y120.103 E.04722
M106 S178.5
M106 S255
G1 F600
G3 X139.176 Y120.475 I-.045 J1.037 E.02866
M106 S178.5
; FEATURE: Inner wall
M106 S255
M204 S6000
G1 X139.217 Y120.528 E.00222
M106 S178.5
M106 S255
G1 X139.257 Y120.591 E.00248
M106 S178.5
M106 S255
G1 X139.304 Y120.678 E.00328
M106 S178.5
M106 S255
G1 X139.34 Y120.768 E.00321
M106 S178.5
M106 S255
G1 X139.368 Y120.86 E.00321
M106 S178.5
M106 S255
G1 X139.387 Y120.955 E.00321
M106 S178.5
M106 S255
G1 X139.396 Y121.052 E.0032
M106 S178.5
M106 S255
G1 X139.396 Y121.675 E.02068
M106 S178.5
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X139.396 Y133.925 E.40635
M106 S178.5
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X139.396 Y134.307 E.01269
M106 S178.5
G1 F5858.4
G1 X139.396 Y134.8 E.01633
G1 F8843.478
G1 X139.379 Y135.095 E.0098
G3 X138.385 Y135.898 I-.986 J-.203 E.04594
G1 X120.182 Y135.898 E.60381
G1 X119.782 Y135.898 E.01327
G1 F4919.51
G1 X119.382 Y135.898 E.01327
M106 S255
G1 F1800
G1 X119 Y135.898 E.01269
M106 S178.5
; FEATURE: Overhang wall
M106 S255
G1 F600
M204 S5000
G1 X117.616 Y135.898 E.0459
G3 X116.823 Y135.525 I-.012 J-1.005 E.0301
M106 S178.5
; FEATURE: Inner wall
M106 S255
M204 S6000
G1 X116.797 Y135.491 E.00141
M106 S178.5
M106 S255
G1 X116.758 Y135.435 E.00226
M106 S178.5
M106 S255
G1 X116.719 Y135.367 E.0026
M106 S178.5
M106 S255
G1 X116.675 Y135.274 E.0034
M106 S178.5
M106 S255
G1 X116.654 Y135.217 E.00202
M106 S178.5
M106 S255
G1 X116.632 Y135.142 E.00261
M106 S178.5
M106 S255
G1 X116.613 Y135.041 E.00339
M106 S178.5
M106 S255
G3 X116.602 Y134.887 I1.17 J-.158 E.00514
M106 S178.5
M106 S255
G1 X116.602 Y134.325 E.01864
M106 S178.5
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X116.602 Y122.075 E.40635
M106 S178.5
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X116.602 Y121.692 E.01269
M106 S178.5
G1 F6791.711
G1 X116.602 Y121.115 E.01914
G1 F8843.478
G1 X116.631 Y120.865 E.00837
G3 X116.855 Y120.44 I.978 J.246 E.01609
M204 S250
G1 X116.62 Y120.12 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X117.605 Y119.71 I.991 J.994 E.03365
G1 X135.831 Y119.711 E.56002
G1 X136.231 Y119.711 E.01229
G1 F4919.51
G1 X136.631 Y119.711 E.01229
M106 S255
G1 F1800
G1 X137 Y119.711 E.01134
M106 S178.5
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X138.437 Y119.711 E.04766
M106 S178.5
M106 S255
G1 F600
G3 X139.788 Y121.032 I-.054 J1.407 E.06875
G1 X139.788 Y133.925 E.42767
M106 S178.5
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X139.788 Y134.294 E.01134
M106 S178.5
G1 F4919.51
G1 X139.786 Y134.694 E.01229
G1 F8775.746
G1 X139.783 Y135.034 E.01044
G1 F9547.055
G1 X139.73 Y135.303 E.00845
G3 X138.395 Y136.29 I-1.331 J-.405 E.05466
G1 X120.169 Y136.29 E.56002
G1 X119.769 Y136.29 E.01229
G1 F4919.51
G1 X119.369 Y136.29 E.01229
M106 S255
G1 F1800
G1 X119 Y136.29 E.01134
M106 S178.5
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
M73 P89 R2
G1 F600
G1 X117.605 Y136.29 E.04626
G3 X116.21 Y134.895 I0 J-1.396 E.07268
G1 X116.21 Y122.075 E.42527
M106 S178.5
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X116.21 Y121.706 E.01134
M106 S178.5
G1 F4919.51
G1 X116.21 Y121.306 E.01229
G1 F7062.367
G1 X116.21 Y121.105 E.00616
G1 F9547.055
G1 X116.251 Y120.765 E.01054
G3 X116.578 Y120.163 I1.36 J.349 E.02126
M204 S10000
G1 X116.897 Y120.66 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.42502
M106 S255
G1 F3000
M204 S6000
G1 X119.305 Y120.664 E.07498
G1 X119.529 Y120.714 E.00712
G1 X119.781 Y120.817 E.0085
G1 X119.957 Y120.926 E.00641
G1 X120.088 Y121.042 E.00546
G1 X116.946 Y121.042 E.09783
G2 X116.935 Y121.424 I1.676 J.237 E.01193
G1 X120.313 Y121.424 E.10517
G1 X120.378 Y121.601 E.00587
G1 X120.414 Y121.807 E.00649
G1 X116.935 Y121.807 E.10832
G1 X116.935 Y122.189 E.0119
G1 X120.417 Y122.189 E.10842
G1 X120.417 Y122.571 E.0119
G1 X116.935 Y122.571 E.10842
G1 X116.935 Y122.953 E.0119
G1 X120.417 Y122.953 E.10842
G1 X120.417 Y123.335 E.0119
G1 X116.935 Y123.335 E.10842
G1 X116.935 Y123.717 E.0119
G1 X120.417 Y123.717 E.10842
G1 X120.417 Y124.099 E.0119
G1 X116.935 Y124.099 E.10842
G1 X116.935 Y124.481 E.0119
G1 X120.417 Y124.481 E.10842
G1 X120.417 Y124.863 E.0119
G1 X116.935 Y124.863 E.10842
G1 X116.935 Y125.245 E.0119
G1 X120.417 Y125.245 E.10842
G1 X120.417 Y125.628 E.0119
G1 X116.935 Y125.628 E.10842
G1 X116.935 Y126.01 E.0119
G1 X120.417 Y126.01 E.10842
G1 X120.417 Y126.392 E.0119
G1 X116.935 Y126.392 E.10842
G1 X116.935 Y126.774 E.0119
G1 X120.417 Y126.774 E.10842
G1 X120.417 Y127.156 E.0119
G1 X116.935 Y127.156 E.10842
G1 X116.935 Y127.538 E.0119
G1 X120.417 Y127.538 E.10842
G1 X120.417 Y127.92 E.0119
G1 X116.935 Y127.92 E.10842
G1 X116.935 Y128.302 E.0119
G1 X120.417 Y128.302 E.10842
G1 X120.417 Y128.684 E.0119
G1 X116.935 Y128.684 E.10842
G1 X116.935 Y129.066 E.0119
G1 X120.417 Y129.066 E.10842
G1 X120.417 Y129.449 E.0119
G1 X116.935 Y129.449 E.10842
G1 X116.935 Y129.831 E.0119
G1 X120.417 Y129.831 E.10842
G1 X120.417 Y130.213 E.0119
G1 X116.935 Y130.213 E.10842
G1 X116.935 Y130.595 E.0119
G1 X120.417 Y130.595 E.10842
G1 X120.417 Y130.977 E.0119
G1 X116.935 Y130.977 E.10842
G1 X116.935 Y131.359 E.0119
G1 X120.417 Y131.359 E.10842
G1 X120.417 Y131.741 E.0119
G1 X116.935 Y131.741 E.10842
G1 X116.935 Y132.123 E.0119
G1 X120.417 Y132.123 E.10842
G1 X120.417 Y132.505 E.0119
G1 X116.935 Y132.505 E.10842
G1 X116.935 Y132.887 E.0119
G1 X120.417 Y132.887 E.10842
G1 X120.417 Y133.27 E.0119
G1 X116.935 Y133.27 E.10842
G1 X116.935 Y133.652 E.0119
G1 X120.417 Y133.652 E.10842
G1 X120.417 Y134.034 E.0119
G1 X116.935 Y134.034 E.10842
G1 X116.935 Y134.416 E.0119
G1 X120.417 Y134.416 E.10842
G1 X120.417 Y134.544 E.00398
G1 X120.378 Y134.798 E.00801
G1 X116.935 Y134.798 E.1072
G2 X117.011 Y135.18 I.954 J.01 E.01221
G1 X120.405 Y135.18 E.10568
G1 X120.415 Y135.267 E.00273
G1 X120.417 Y135.562 E.00919
G1 X117.102 Y135.562 E.10322
M106 S178.5
; WIPE_START
G1 X119.102 Y135.562 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.2 I-.091 J1.214 P1  F42000
G1 X121.399 Y135.734 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42543
G1 F9411.518
M204 S6000
G1 X120.776 Y135.111 E.02748
G1 X120.734 Y134.925 E.00594
G1 X120.793 Y134.587 E.01069
G1 X121.77 Y135.565 E.04308
G1 X122.311 Y135.565 E.01686
G1 X120.794 Y134.048 E.06686
G1 X120.794 Y133.507 E.01686
G1 X122.852 Y135.565 E.09071
G1 X123.393 Y135.565 E.01686
G1 X120.794 Y132.966 E.11456
G1 X120.794 Y132.425 E.01686
G1 X123.934 Y135.565 E.1384
G1 X124.475 Y135.565 E.01686
G1 X120.794 Y131.884 E.16225
G1 X120.794 Y131.343 E.01686
G1 X125.016 Y135.565 E.18609
G1 X125.557 Y135.565 E.01686
G1 X120.794 Y130.802 E.20994
G1 X120.794 Y130.261 E.01686
G1 X126.098 Y135.565 E.23378
G1 X126.639 Y135.565 E.01686
G1 X120.794 Y129.72 E.25763
G1 X120.794 Y129.179 E.01686
G1 X127.18 Y135.565 E.28147
G1 X127.721 Y135.565 E.01686
G1 X120.794 Y128.638 E.30532
G1 X120.794 Y128.097 E.01686
G1 X128.262 Y135.565 E.32916
G1 X128.803 Y135.565 E.01686
G1 X120.794 Y127.556 E.35301
G1 X120.794 Y127.015 E.01686
G1 X129.344 Y135.565 E.37686
G1 X129.885 Y135.565 E.01686
G1 X120.794 Y126.475 E.4007
G1 X120.794 Y125.934 E.01686
G1 X130.426 Y135.565 E.42455
G1 X130.967 Y135.565 E.01686
G1 X120.794 Y125.393 E.44839
G1 X120.794 Y124.852 E.01686
G1 X131.507 Y135.565 E.47224
G1 X132.048 Y135.565 E.01686
G1 X120.794 Y124.311 E.49608
G1 X120.794 Y123.77 E.01686
G1 X132.589 Y135.565 E.51993
G1 X133.13 Y135.565 E.01686
G1 X120.794 Y123.229 E.54377
G1 X120.794 Y122.688 E.01686
G1 X133.671 Y135.565 E.56762
G1 X134.212 Y135.565 E.01686
G1 X120.794 Y122.147 E.59146
G2 X120.794 Y121.834 I-6.527 J-.147 E.00975
G1 X120.757 Y121.569 E.00835
G1 X134.753 Y135.565 E.61695
G1 X135.294 Y135.565 E.01686
G1 X120.165 Y120.435 E.66691
G1 X120.706 Y120.435 E.01686
G1 X135.835 Y135.565 E.66691
G1 X136.152 Y135.565 E.00989
G1 X135.987 Y135.486 E.00572
G1 X135.822 Y135.38 E.0061
G1 X135.689 Y135.269 E.00541
G1 X135.575 Y135.142 E.00533
G1 X135.39 Y134.843 E.01093
G1 X135.295 Y134.614 E.00774
G1 X135.243 Y134.431 E.00592
G1 X121.247 Y120.435 E.61695
G1 X121.788 Y120.435 E.01686
G1 X135.206 Y133.853 E.59146
G1 X135.206 Y133.312 E.01686
G1 X122.329 Y120.436 E.56762
G1 X122.87 Y120.436 E.01686
G1 X135.206 Y132.771 E.54377
G1 X135.206 Y132.23 E.01686
G1 X123.411 Y120.436 E.51993
G1 X123.952 Y120.436 E.01686
G1 X135.206 Y131.689 E.49608
G1 X135.206 Y131.149 E.01686
G1 X124.493 Y120.436 E.47223
G1 X125.034 Y120.436 E.01686
G1 X135.206 Y130.608 E.44839
G1 X135.206 Y130.067 E.01686
G1 X125.575 Y120.436 E.42454
G1 X126.116 Y120.436 E.01686
G1 X135.206 Y129.526 E.40069
G1 X135.206 Y128.985 E.01686
G1 X126.657 Y120.436 E.37685
G1 X127.197 Y120.436 E.01686
G1 X135.206 Y128.444 E.353
G1 X135.206 Y127.903 E.01686
G1 X127.738 Y120.436 E.32915
G1 X128.279 Y120.436 E.01686
G1 X135.206 Y127.362 E.30531
G1 X135.206 Y126.821 E.01686
G1 X128.82 Y120.436 E.28146
G1 X129.361 Y120.436 E.01686
G1 X135.206 Y126.28 E.25761
G1 X135.206 Y125.739 E.01686
G1 X129.902 Y120.436 E.23377
G1 X130.443 Y120.436 E.01686
G1 X135.206 Y125.198 E.20992
G1 X135.206 Y124.657 E.01686
G1 X130.984 Y120.436 E.18608
G1 X131.525 Y120.436 E.01686
G1 X135.206 Y124.116 E.16223
G1 X135.206 Y123.575 E.01686
G1 X132.066 Y120.436 E.13838
G1 X132.607 Y120.436 E.01686
G1 X135.206 Y123.034 E.11454
G1 X135.206 Y122.493 E.01686
G1 X133.148 Y120.436 E.09069
G1 X133.689 Y120.436 E.01686
G1 X135.206 Y121.952 E.06684
G3 X135.206 Y121.434 I10.33 J-.25 E.01615
G1 X135.207 Y121.413 E.00066
G1 X134.23 Y120.436 E.04306
G1 X134.771 Y120.436 E.01686
G1 X135.436 Y121.101 E.02929
M204 S10000
G1 X135.587 Y134.774 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.42863
M106 S255
G1 F3000
M204 S6000
G1 X135.587 Y120.436 E.45066
G1 X135.973 Y120.436 E.01212
G1 X135.973 Y135.018 E.4583
G1 X136.161 Y135.151 E.00725
G1 X136.358 Y135.242 E.00683
G1 X136.358 Y120.436 E.46535
G1 X136.744 Y120.436 E.01212
G1 X136.744 Y135.34 E.46845
G1 X137.13 Y135.342 E.01212
G1 X137.13 Y120.436 E.46851
G1 X137.516 Y120.436 E.01212
G1 X137.516 Y135.342 E.46851
G1 X137.901 Y135.342 E.01212
G1 X137.901 Y120.436 E.46851
G1 X138.287 Y120.436 E.01212
G1 X138.287 Y135.342 E.46851
G1 X138.673 Y135.342 E.01212
G1 X138.673 Y120.497 E.46659
G3 X139.058 Y121.046 I-.275 J.603 E.02211
G1 X139.058 Y135.407 E.45135
M106 S178.5
; OBJECT_ID: 394
; WIPE_START
G1 X139.058 Y133.407 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X131.867 Y130.85 Z8.2 F42000
G1 X103.314 Y120.702 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7500
M204 S6000
G1 X103.321 Y120.718 E.00059
G1 F8818.401
G1 X103.357 Y120.818 E.0035
G1 F8843.478
G1 X103.366 Y120.85 E.00113
G1 X103.383 Y120.934 E.00283
G3 X103.396 Y121.051 I-.587 J.127 E.00392
G1 X103.396 Y121.317 E.00883
G1 F6070.344
G1 X103.396 Y121.717 E.01327
G1 F2520
G1 X103.396 Y134.282 E.4168
G1 F6070.344
G1 X103.395 Y134.682 E.01327
G1 F7250.074
G1 X103.394 Y134.99 E.01021
G1 F6242.908
G1 X103.383 Y135.065 E.00248
G1 F5449.791
G1 X103.378 Y135.095 E.00101
G1 F5142.863
G1 X103.354 Y135.189 E.00324
G1 F4217.114
G1 X103.321 Y135.282 E.00324
G1 F3383.013
G1 X103.279 Y135.37 E.00325
G1 F2640
G1 X103.229 Y135.454 E.00325
G1 F2520
G1 X103.171 Y135.533 E.00325
G1 F3245.504
G1 X103.105 Y135.605 E.00324
G1 F3575.39
G1 X103.075 Y135.632 E.00135
G1 F5537.992
G1 X102.906 Y135.76 E.007
G1 F7067.168
G1 X102.782 Y135.821 E.00462
G1 F8843.478
G1 X102.539 Y135.885 E.00833
M73 P90 R2
G3 X102.385 Y135.898 I-.167 J-1.052 E.00511
G1 X81.615 Y135.898 E.68899
G3 X81.461 Y135.888 I-.014 J-.992 E.00512
G1 X81.257 Y135.837 E.00698
G1 F7634.396
G1 X81.046 Y135.729 E.00787
G1 F5032.659
G1 X80.925 Y135.632 E.00512
G1 F3628.923
G1 X80.895 Y135.605 E.00135
G1 F3296.464
G1 X80.824 Y135.527 E.00348
G1 F2514.41
G1 X80.803 Y135.5 E.00115
G1 F2280
G1 X80.745 Y135.413 E.00349
G1 F3000
G1 X80.695 Y135.32 E.00349
G1 F3265.632
G1 X80.681 Y135.289 E.00114
G1 F4219.585
G1 X80.643 Y135.182 E.00374
G1 F4531.298
G1 X80.634 Y135.15 E.00113
G1 F5361.602
G1 X80.618 Y135.066 E.00283
G1 F5637.854
G1 X80.612 Y135.04 E.00089
G1 F8309.915
G1 X80.607 Y134.64 E.01327
G1 F5616.997
G1 X80.602 Y134.282 E.01185
G1 F2520
G1 X80.602 Y121.717 E.4168
G1 F6070.344
G1 X80.61 Y121.318 E.01327
G1 F7218.652
G1 X80.618 Y120.935 E.01268
G1 F5420.473
G1 X80.623 Y120.898 E.00124
G1 F5045.971
G1 X80.631 Y120.865 E.00114
G1 F4712.81
G1 X80.663 Y120.758 E.00372
G1 F3707.347
G1 X80.677 Y120.723 E.00124
G1 F3399.217
G1 X80.719 Y120.632 E.00331
G1 F2640
G1 X80.771 Y120.546 E.00335
G1 F2520
G1 X80.829 Y120.467 E.00324
G1 F3245.334
G1 X80.895 Y120.395 E.00324
G1 F3575.15
G1 X80.925 Y120.367 E.00135
G1 F5511.129
G1 X81.091 Y120.242 E.00692
G1 F7559.193
G1 X81.257 Y120.163 E.00608
G1 F8843.478
G1 X81.461 Y120.113 E.00695
G3 X81.615 Y120.102 I.152 J1.013 E.00514
G1 X102.388 Y120.102 E.68907
G3 X102.594 Y120.125 I-.015 J1.061 E.00689
G1 X102.782 Y120.179 E.00647
G1 F7068.728
G1 X102.954 Y120.271 E.00648
G1 F4975.243
G1 X103.075 Y120.367 E.00514
G1 F3576.154
G1 X103.105 Y120.395 E.00135
G1 F3246.625
G1 X103.171 Y120.467 E.00325
G1 F2520
G1 X103.229 Y120.546 E.00325
G1 F2640
G1 X103.279 Y120.63 E.00325
G1 F2784.702
G1 X103.288 Y120.648 E.00067
M204 S250
G1 X103.666 Y120.535 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X103.68 Y120.57 E.00116
G3 X103.788 Y121.032 I-1.297 J.548 E.01466
G1 X103.788 Y134.971 E.4283
G3 X102.395 Y136.29 I-1.398 J-.081 E.06496
G1 X81.605 Y136.29 E.6388
G3 X80.21 Y134.895 I-.001 J-1.395 E.06735
G1 X80.21 Y121.105 E.4237
G3 X81.605 Y119.71 I1.395 J-.001 E.06736
G1 X102.398 Y119.71 E.63889
G3 X103.55 Y120.331 I-.015 J1.408 E.04185
G1 X103.636 Y120.482 E.00534
; WIPE_START
M204 S6000
G1 X103.68 Y120.57 E-.03705
G1 X103.748 Y120.76 E-.07664
G1 X103.788 Y121.032 E-.1046
G1 X103.788 Y122.458 E-.54172
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.2 I-.073 J-1.215 P1  F42000
G1 X99.14 Y122.737 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.43451
M106 S255
G1 F3000
M204 S6000
G1 X99.14 Y120.435 E.07344
G1 X98.748 Y120.435 E.0125
G1 X98.748 Y122.567 E.06803
G1 X98.356 Y122.567 E.0125
G1 X98.356 Y120.435 E.06803
G1 X97.965 Y120.435 E.0125
G1 X97.965 Y122.567 E.06801
G1 X97.951 Y122.566 E.00042
G1 X97.748 Y122.533 E.00658
G1 X97.573 Y122.473 E.0059
G1 X97.573 Y120.435 E.06502
G1 X97.182 Y120.435 E.0125
G1 X97.182 Y122.25 E.05791
G1 X97.064 Y122.124 E.00552
G1 X96.946 Y121.939 E.00699
G1 X96.841 Y121.687 E.00872
G1 X96.795 Y121.494 E.00631
G1 X96.79 Y120.266 E.03921
M106 S178.5
M204 S10000
G1 X96.575 Y120.744 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42319
G1 F9466.957
M204 S6000
G1 X96.267 Y120.435 E.01352
G1 X95.729 Y120.435 E.01666
G1 X96.575 Y121.282 E.03708
M204 S10000
G1 X99.375 Y123.544 F42000
G1 F9466.957
M204 S6000
G1 X98.776 Y122.944 E.02627
G1 X98.238 Y122.944 E.01666
G1 X99.206 Y123.912 E.0424
G1 X99.206 Y124.45 E.01666
G1 X97.655 Y122.899 E.06796
G1 X97.237 Y122.738 E.01385
G1 X97.037 Y122.615 E.00728
G1 X96.889 Y122.494 E.00594
G1 X96.763 Y122.352 E.00586
G1 X96.639 Y122.163 E.00702
G1 X96.502 Y121.856 E.01044
G1 X96.451 Y121.695 E.00521
G1 X95.191 Y120.435 E.05521
G1 X94.653 Y120.435 E.01666
G1 X99.206 Y124.987 E.19948
G1 X99.206 Y125.525 E.01666
G1 X94.116 Y120.435 E.22305
G1 X93.578 Y120.435 E.01666
G1 X99.206 Y126.063 E.24662
G1 X99.206 Y126.601 E.01666
G1 X93.04 Y120.435 E.27019
G1 X92.502 Y120.435 E.01666
G1 X99.206 Y127.139 E.29375
G1 X99.206 Y127.676 E.01666
G1 X91.965 Y120.435 E.31732
G1 X91.427 Y120.435 E.01666
G1 X99.206 Y128.214 E.34089
G1 X99.206 Y128.752 E.01666
G1 X90.889 Y120.435 E.36445
G1 X90.351 Y120.435 E.01666
G1 X99.206 Y129.29 E.38802
G1 X99.206 Y129.827 E.01666
G1 X89.813 Y120.435 E.41159
G1 X89.276 Y120.435 E.01666
G1 X99.206 Y130.365 E.43515
G1 X99.206 Y130.903 E.01666
G1 X88.738 Y120.435 E.45872
G1 X88.2 Y120.435 E.01666
G1 X99.206 Y131.441 E.48229
G1 X99.206 Y131.979 E.01666
G1 X87.662 Y120.435 E.50586
G1 X87.589 Y120.435 E.00228
G1 X87.594 Y120.509 E.00229
G3 X87.594 Y120.905 I-8.272 J.207 E.01227
G1 X99.206 Y132.516 E.50883
G1 X99.206 Y133.054 E.01666
G1 X87.591 Y121.44 E.50897
G1 X87.55 Y121.69 E.00784
G1 X87.49 Y121.876 E.00608
G1 X98.669 Y133.056 E.4899
G1 X98.131 Y133.056 E.01666
G1 X87.315 Y122.239 E.47401
G1 X87.189 Y122.411 E.00661
G1 X87.07 Y122.532 E.00526
G1 X97.642 Y133.104 E.46332
G1 X97.254 Y133.253 E.0129
G1 X86.747 Y122.746 E.46044
G1 X86.358 Y122.896 E.0129
G1 X96.931 Y133.468 E.46332
G1 X96.811 Y133.589 E.00527
G1 X96.685 Y133.761 E.00659
G1 X85.869 Y122.944 E.474
G1 X85.331 Y122.944 E.01666
G1 X96.51 Y134.123 E.48989
G1 X96.45 Y134.31 E.00609
G1 X96.409 Y134.56 E.00783
G1 X84.794 Y122.945 E.50897
G1 X84.794 Y123.483 E.01666
G1 X96.406 Y135.094 E.50883
G2 X96.411 Y135.565 I3.162 J.197 E.01459
G1 X96.338 Y135.565 E.00226
G1 X84.794 Y124.021 E.50588
G1 X84.794 Y124.559 E.01666
G1 X95.8 Y135.565 E.48231
G1 X95.263 Y135.565 E.01666
G1 X84.794 Y125.096 E.45874
G1 X84.794 Y125.634 E.01666
G1 X94.725 Y135.565 E.43518
G1 X94.187 Y135.565 E.01666
G1 X84.794 Y126.172 E.41161
G1 X84.794 Y126.71 E.01666
G1 X93.649 Y135.565 E.38804
G1 X93.112 Y135.565 E.01666
G1 X84.794 Y127.248 E.36448
G1 X84.794 Y127.785 E.01666
G1 X92.574 Y135.565 E.34091
G1 X92.036 Y135.565 E.01666
G1 X84.794 Y128.323 E.31734
G1 X84.794 Y128.861 E.01666
G1 X91.498 Y135.565 E.29377
G1 X90.96 Y135.565 E.01666
G1 X84.794 Y129.399 E.27021
G1 X84.794 Y129.936 E.01666
G1 X90.423 Y135.565 E.24664
G1 X89.885 Y135.565 E.01666
G1 X84.794 Y130.474 E.22307
G1 X84.794 Y131.012 E.01666
G1 X89.347 Y135.565 E.19951
G1 X88.809 Y135.565 E.01666
G1 X87.549 Y134.304 E.05524
G1 X87.594 Y134.609 E.00956
G3 X87.594 Y134.888 I-5.811 J.148 E.00863
G1 X88.271 Y135.565 E.02967
G1 X87.734 Y135.565 E.01666
G1 X87.425 Y135.256 E.01354
M204 S10000
G1 X87.21 Y135.734 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.43462
M106 S255
G1 F3000
M204 S6000
G1 X87.205 Y134.506 E.03922
G1 X87.159 Y134.313 E.00631
G1 X87.054 Y134.061 E.00872
G1 X86.936 Y133.876 E.00699
G1 X86.818 Y133.75 E.00553
G1 X86.818 Y135.565 E.05794
G1 X86.426 Y135.565 E.0125
G1 X86.426 Y133.527 E.06504
G1 X86.252 Y133.467 E.00589
G1 X86.049 Y133.434 E.00658
G1 X86.035 Y133.433 E.00044
G1 X86.035 Y135.565 E.06803
G1 X85.643 Y135.565 E.0125
G1 X85.643 Y133.433 E.06805
G1 X85.251 Y133.433 E.0125
G1 X85.251 Y135.565 E.06805
G1 X84.86 Y135.565 E.0125
G1 X84.86 Y133.263 E.07346
M106 S178.5
M204 S10000
G1 X84.625 Y132.456 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42319
G1 F9466.957
M204 S6000
G1 X85.225 Y133.056 E.02629
G1 X85.762 Y133.056 E.01666
G1 X84.794 Y132.088 E.04242
G1 X84.794 Y131.55 E.01666
G1 X86.632 Y133.388 E.08053
M204 S10000
G1 X96.79 Y133.994 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.43451
M106 S255
G1 F3000
M204 S6000
G1 X96.791 Y135.565 E.05011
G1 X97.182 Y135.565 E.01248
G1 X97.182 Y133.75 E.05792
G1 X97.361 Y133.624 E.00699
G1 X97.573 Y133.527 E.00745
G1 X97.573 Y135.565 E.06502
G1 X97.965 Y135.565 E.0125
G1 X97.965 Y133.433 E.06801
G1 X98.356 Y133.433 E.0125
G1 X98.356 Y135.565 E.06803
G1 X98.748 Y135.565 E.0125
G1 X98.748 Y133.433 E.06803
G1 X99.14 Y133.433 E.0125
G1 X99.14 Y135.565 E.06803
G1 X99.531 Y135.565 E.0125
G1 X99.531 Y120.435 E.48277
G1 X99.923 Y120.435 E.0125
G1 X99.923 Y135.565 E.48277
G1 X100.314 Y135.565 E.0125
G1 X100.314 Y120.435 E.48277
G1 X100.706 Y120.435 E.0125
G1 X100.706 Y135.565 E.48277
G1 X101.097 Y135.565 E.0125
G1 X101.097 Y120.435 E.48277
G1 X101.489 Y120.435 E.0125
G1 X101.489 Y135.565 E.48277
G1 X101.881 Y135.565 E.0125
G1 X101.881 Y120.435 E.48277
G1 X102.272 Y120.435 E.0125
G1 X102.272 Y135.565 E.48277
G2 X102.664 Y135.504 I.004 J-1.267 E.0127
G1 X102.664 Y120.494 E.47897
G3 X103.011 Y120.846 I-.258 J.603 E.01618
G1 X103.011 Y121.34 E.01577
G1 X103.055 Y121.384 E.00199
G1 X103.055 Y135.417 E.44778
M106 S178.5
; WIPE_START
G1 X103.055 Y133.417 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.2 I.711 J-.988 P1  F42000
G1 X87.21 Y122.006 Z8.2
G1 Z7.8
G1 E.8 F1800
; LINE_WIDTH: 0.43462
M106 S255
G1 F3000
M204 S6000
G1 X87.21 Y120.435 E.05013
G1 X86.818 Y120.435 E.01249
G1 X86.818 Y122.25 E.05794
G1 X86.631 Y122.381 E.00728
G1 X86.426 Y122.473 E.00716
G1 X86.426 Y120.435 E.06504
G1 X86.035 Y120.435 E.0125
G1 X86.035 Y122.567 E.06803
G1 X85.643 Y122.567 E.0125
G1 X85.643 Y120.435 E.06805
G1 X85.251 Y120.435 E.0125
G1 X85.251 Y122.567 E.06805
G1 X84.86 Y122.567 E.0125
G1 X84.86 Y120.435 E.06805
G1 X84.468 Y120.435 E.0125
G1 X84.468 Y135.565 E.48291
G1 X84.076 Y135.565 E.0125
G1 X84.076 Y120.435 E.48291
G1 X83.685 Y120.435 E.0125
G1 X83.685 Y135.565 E.48291
G1 X83.293 Y135.565 E.0125
G1 X83.293 Y120.435 E.48291
G1 X82.901 Y120.435 E.0125
G1 X82.901 Y135.565 E.48291
G1 X82.509 Y135.565 E.0125
G1 X82.509 Y120.435 E.48291
G1 X82.118 Y120.435 E.0125
G1 X82.118 Y135.565 E.48291
G1 X81.726 Y135.565 E.0125
G1 X81.726 Y120.435 E.48291
G2 X81.334 Y120.501 I-.005 J1.18 E.01274
G1 X81.334 Y135.501 E.4788
G3 X81.025 Y135.25 I.298 J-.684 E.01288
G1 X80.989 Y135.154 E.00328
G1 X80.989 Y134.662 E.0157
G1 X80.943 Y134.616 E.00207
G1 X80.943 Y120.585 E.44785
M106 S178.5
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
G1 X80.943 Y122.585 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 40/42
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
M106 S191.25
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z8.2 I-.215 J1.198 P1  F42000
G1 X152.8 Y135.493 Z8.2
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X152.602 Y134.892 I.805 J-.598 E.02135
G1 X152.602 Y121.115 E.45703
G3 X153.615 Y120.102 I1.003 J-.01 E.05292
G1 X174.386 Y120.102 E.68901
G3 X175.396 Y121.051 I0 J1.012 E.05065
G1 X175.396 Y134.949 E.46101
G3 X174.385 Y135.898 I-1.009 J-.062 E.05068
G1 X153.615 Y135.898 E.68898
G3 X152.837 Y135.54 I-.01 J-1.003 E.02934
M204 S250
G1 X152.485 Y135.727 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X152.21 Y134.897 I1.12 J-.832 E.02732
G1 X152.21 Y121.105 E.42379
G3 X153.605 Y119.71 I1.395 J-.001 E.06735
G1 X174.396 Y119.71 E.63883
G3 X175.788 Y121.032 I-.013 J1.408 E.06491
G1 X175.788 Y134.968 E.42822
G3 X174.395 Y136.29 I-1.405 J-.086 E.06494
G1 X153.605 Y136.29 E.6388
G3 X152.522 Y135.774 I-.001 J-1.395 E.03811
; WIPE_START
M204 S6000
G1 X152.344 Y135.494 E-.12608
G1 X152.236 Y135.169 E-.13034
G1 X152.21 Y134.897 E-.10364
G1 X152.21 Y133.845 E-.39995
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
G1 X153.497 Y120.274 F42000
G1 Z8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.4221
G1 F9494.171
M204 S6000
G1 X153.083 Y120.688 E.01808
G1 X153.018 Y120.785 E.00361
M73 P91 R2
G2 X152.935 Y121.371 I1.142 J.46 E.01848
G1 X153.871 Y120.435 E.0409
G1 X154.408 Y120.435 E.01657
G1 X152.935 Y121.908 E.06433
G1 X152.935 Y122.444 E.01657
G1 X154.944 Y120.435 E.08777
G1 X155.48 Y120.435 E.01657
G1 X152.935 Y122.98 E.1112
G1 X152.935 Y123.516 E.01657
G1 X156.016 Y120.435 E.13463
G1 X156.553 Y120.435 E.01657
G1 X152.935 Y124.053 E.15806
G1 X152.935 Y124.589 E.01657
G1 X157.089 Y120.435 E.18149
G1 X157.625 Y120.435 E.01657
G1 X152.935 Y125.125 E.20493
G1 X152.935 Y125.661 E.01657
G1 X158.161 Y120.435 E.22836
G1 X158.698 Y120.435 E.01657
G1 X152.935 Y126.198 E.25179
G1 X152.935 Y126.734 E.01657
G1 X159.234 Y120.435 E.27522
G1 X159.77 Y120.435 E.01657
G1 X152.935 Y127.27 E.29865
G1 X152.935 Y127.806 E.01657
G1 X160.306 Y120.435 E.32209
G1 X160.842 Y120.435 E.01657
G1 X152.935 Y128.342 E.34552
G1 X152.935 Y128.879 E.01657
G1 X161.379 Y120.435 E.36895
G1 X161.915 Y120.435 E.01657
G1 X152.935 Y129.415 E.39238
G1 X152.935 Y129.951 E.01657
G1 X162.451 Y120.435 E.41582
G1 X162.987 Y120.435 E.01657
G1 X152.935 Y130.487 E.43925
G1 X152.935 Y131.024 E.01657
G1 X163.524 Y120.435 E.46268
G1 X164.06 Y120.435 E.01657
G1 X152.935 Y131.56 E.48611
G1 X152.935 Y132.096 E.01657
G1 X164.596 Y120.435 E.50954
G1 X165.132 Y120.435 E.01657
G1 X152.935 Y132.632 E.53298
G1 X152.935 Y133.169 E.01657
G1 X165.669 Y120.435 E.55641
G1 X166.205 Y120.435 E.01657
G1 X152.935 Y133.705 E.57984
G1 X152.935 Y134.241 E.01657
G1 X166.741 Y120.435 E.60327
G1 X167.277 Y120.435 E.01657
G1 X152.935 Y134.777 E.6267
G2 X153.025 Y135.224 I.926 J.045 E.01421
G1 X167.814 Y120.435 E.6462
G1 X168.35 Y120.435 E.01657
G1 X153.298 Y135.487 E.65771
G2 X153.757 Y135.565 I.396 J-.942 E.0145
G1 X168.886 Y120.435 E.66111
G1 X169.422 Y120.435 E.01657
G1 X154.293 Y135.565 E.66111
G1 X154.829 Y135.565 E.01657
G1 X169.959 Y120.435 E.66111
G1 X170.495 Y120.435 E.01657
G1 X155.365 Y135.565 E.66111
G1 X155.902 Y135.565 E.01657
G1 X171.031 Y120.435 E.66111
G1 X171.567 Y120.435 E.01657
G1 X156.438 Y135.565 E.66111
G1 X156.974 Y135.565 E.01657
G1 X172.104 Y120.435 E.66111
G1 X172.64 Y120.435 E.01657
G1 X157.51 Y135.565 E.66111
G1 X158.047 Y135.565 E.01657
G1 X173.176 Y120.435 E.66111
G1 X173.712 Y120.435 E.01657
G1 X158.583 Y135.565 E.66111
G1 X159.119 Y135.565 E.01657
G1 X174.249 Y120.435 E.66111
G3 X174.705 Y120.515 I.061 J.992 E.01444
G1 X159.655 Y135.565 E.6576
G1 X160.192 Y135.565 E.01657
G1 X174.976 Y120.78 E.64605
G3 X175.063 Y121.23 I-.728 J.373 E.01435
G1 X160.728 Y135.565 E.62639
G1 X161.264 Y135.565 E.01657
G1 X175.063 Y121.766 E.60296
G1 X175.063 Y122.302 E.01657
G1 X161.8 Y135.565 E.57952
G1 X162.337 Y135.565 E.01657
G1 X175.063 Y122.839 E.55609
G1 X175.063 Y123.375 E.01657
G1 X162.873 Y135.565 E.53266
G1 X163.409 Y135.565 E.01657
G1 X175.063 Y123.911 E.50923
G1 X175.063 Y124.447 E.01657
G1 X163.945 Y135.565 E.4858
G1 X164.482 Y135.565 E.01657
G1 X175.063 Y124.984 E.46236
G1 X175.063 Y125.52 E.01657
G1 X165.018 Y135.565 E.43893
G1 X165.554 Y135.565 E.01657
G1 X175.063 Y126.056 E.4155
G1 X175.063 Y126.592 E.01657
G1 X166.09 Y135.565 E.39207
G1 X166.627 Y135.565 E.01657
G1 X175.063 Y127.128 E.36864
G1 X175.063 Y127.665 E.01657
G1 X167.163 Y135.565 E.3452
G1 X167.699 Y135.565 E.01657
G1 X175.063 Y128.201 E.32177
G1 X175.063 Y128.737 E.01657
G1 X168.235 Y135.565 E.29834
G1 X168.772 Y135.565 E.01657
G1 X175.063 Y129.273 E.27491
G1 X175.063 Y129.81 E.01657
G1 X169.308 Y135.565 E.25148
G1 X169.844 Y135.565 E.01657
G1 X175.063 Y130.346 E.22804
G1 X175.063 Y130.882 E.01657
G1 X170.38 Y135.565 E.20461
G1 X170.916 Y135.565 E.01657
G1 X175.063 Y131.418 E.18118
G1 X175.063 Y131.955 E.01657
G1 X171.453 Y135.565 E.15775
G1 X171.989 Y135.565 E.01657
G1 X175.063 Y132.491 E.13431
G1 X175.063 Y133.027 E.01657
G1 X172.525 Y135.565 E.11088
G1 X173.061 Y135.565 E.01657
G1 X175.063 Y133.563 E.08745
G1 X175.063 Y134.1 E.01657
G1 X173.598 Y135.565 E.06402
G1 X174.134 Y135.565 E.01657
G1 X175.063 Y134.636 E.04059
G1 X175.063 Y134.921 E.00881
G3 X174.89 Y135.345 I-.722 J-.047 E.01441
G1 X174.514 Y135.721 E.01643
; OBJECT_ID: 405
; WIPE_START
G1 X174.89 Y135.345 E-.20201
G1 X174.983 Y135.214 E-.06109
G1 X175.034 Y135.09 E-.05106
M73 P91 R1
G1 X175.063 Y134.921 E-.0652
G1 X175.063 Y134.636 E-.10835
G1 X174.556 Y135.143 E-.27229
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X167.162 Y133.251 Z8.4 F42000
G1 X116.896 Y120.395 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X117.615 Y120.102 I.708 J.71 E.02644
G1 X138.398 Y120.102 E.68941
G3 X139.396 Y121.051 I-.006 J1.005 E.05032
G1 X139.396 Y134.949 E.46101
G3 X138.385 Y135.898 I-1.009 J-.062 E.05068
G1 X117.608 Y135.898 E.68921
G3 X116.602 Y134.89 I-.004 J-1.002 E.05254
G1 X116.602 Y121.115 E.45695
G3 X116.855 Y120.439 I1.003 J-.01 E.0245
M204 S250
G1 X116.619 Y120.118 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X117.605 Y119.71 I.986 J.987 E.03365
G1 X138.409 Y119.71 E.63922
G3 X139.788 Y121.032 I-.019 J1.401 E.0646
G1 X139.788 Y134.968 E.42822
G3 X138.395 Y136.29 I-1.405 J-.086 E.06494
G1 X117.603 Y136.29 E.63888
G3 X116.21 Y134.896 I.001 J-1.394 E.06723
G1 X116.21 Y121.105 E.42376
G3 X116.578 Y120.161 I1.395 J-.001 E.03186
M204 S10000
G1 X117.497 Y120.274 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.4221
G1 F9494.171
M204 S6000
G1 X117.083 Y120.688 E.01808
G1 X117.018 Y120.785 E.00361
G2 X116.935 Y121.371 I1.141 J.46 E.01848
G1 X117.871 Y120.435 E.0409
G1 X118.408 Y120.435 E.01657
G1 X116.935 Y121.908 E.06433
G1 X116.935 Y122.444 E.01657
G1 X118.944 Y120.435 E.08777
G1 X119.48 Y120.435 E.01657
M73 P92 R1
G1 X116.935 Y122.98 E.1112
G1 X116.935 Y123.516 E.01657
G1 X120.016 Y120.435 E.13463
G1 X120.553 Y120.435 E.01657
G1 X116.935 Y124.053 E.15806
G1 X116.935 Y124.589 E.01657
G1 X121.089 Y120.435 E.18149
G1 X121.625 Y120.435 E.01657
G1 X116.935 Y125.125 E.20492
G1 X116.935 Y125.661 E.01657
G1 X122.161 Y120.435 E.22836
G1 X122.697 Y120.435 E.01657
G1 X116.935 Y126.198 E.25179
G1 X116.935 Y126.734 E.01657
G1 X123.234 Y120.435 E.27522
G1 X123.77 Y120.435 E.01657
G1 X116.935 Y127.27 E.29865
G1 X116.935 Y127.806 E.01657
G1 X124.306 Y120.435 E.32208
G1 X124.842 Y120.435 E.01657
G1 X116.935 Y128.342 E.34551
G1 X116.935 Y128.879 E.01657
G1 X125.379 Y120.435 E.36895
G1 X125.915 Y120.435 E.01657
G1 X116.935 Y129.415 E.39238
G1 X116.935 Y129.951 E.01657
G1 X126.451 Y120.435 E.41581
G1 X126.987 Y120.435 E.01657
G1 X116.935 Y130.487 E.43924
G1 X116.935 Y131.024 E.01657
G1 X127.524 Y120.435 E.46267
G1 X128.06 Y120.435 E.01657
G1 X116.935 Y131.56 E.48611
G1 X116.935 Y132.096 E.01657
G1 X128.596 Y120.435 E.50954
G1 X129.132 Y120.435 E.01657
G1 X116.935 Y132.632 E.53297
G1 X116.935 Y133.169 E.01657
G1 X129.669 Y120.435 E.5564
G1 X130.205 Y120.435 E.01657
G1 X116.935 Y133.705 E.57983
G1 X116.935 Y134.241 E.01657
G1 X130.741 Y120.435 E.60326
G1 X131.277 Y120.435 E.01657
G1 X116.935 Y134.777 E.6267
G2 X117.023 Y135.226 I.964 J.044 E.01425
G1 X131.813 Y120.435 E.64629
G1 X132.35 Y120.436 E.01657
G1 X117.297 Y135.488 E.65775
G2 X117.757 Y135.565 I.406 J-1.017 E.01451
G1 X132.886 Y120.436 E.6611
G1 X133.422 Y120.436 E.01657
G1 X118.293 Y135.565 E.6611
G1 X118.829 Y135.565 E.01657
G1 X133.958 Y120.436 E.6611
G1 X134.495 Y120.436 E.01657
G1 X119.365 Y135.565 E.6611
G1 X119.902 Y135.565 E.01657
G1 X135.031 Y120.436 E.6611
G1 X135.567 Y120.436 E.01657
G1 X120.438 Y135.565 E.6611
G1 X120.974 Y135.565 E.01657
G1 X136.103 Y120.436 E.6611
G1 X136.64 Y120.436 E.01657
G1 X121.51 Y135.565 E.6611
G1 X122.047 Y135.565 E.01657
G1 X137.176 Y120.436 E.6611
G1 X137.712 Y120.436 E.01657
G1 X122.583 Y135.565 E.6611
G1 X123.119 Y135.565 E.01657
G1 X138.248 Y120.436 E.66109
G3 X138.705 Y120.515 I.067 J.965 E.01446
G1 X123.655 Y135.565 E.65761
G1 X124.192 Y135.565 E.01657
G1 X138.977 Y120.78 E.64605
G3 X139.063 Y121.23 I-.729 J.373 E.01435
G1 X124.728 Y135.565 E.62639
G1 X125.264 Y135.565 E.01657
G1 X139.063 Y121.766 E.60296
G1 X139.063 Y122.302 E.01657
G1 X125.8 Y135.565 E.57953
G1 X126.337 Y135.565 E.01657
G1 X139.063 Y122.839 E.55609
G1 X139.063 Y123.375 E.01657
G1 X126.873 Y135.565 E.53266
G1 X127.409 Y135.565 E.01657
G1 X139.063 Y123.911 E.50923
G1 X139.063 Y124.447 E.01657
G1 X127.945 Y135.565 E.4858
G1 X128.482 Y135.565 E.01657
G1 X139.063 Y124.984 E.46236
G1 X139.063 Y125.52 E.01657
G1 X129.018 Y135.565 E.43893
G1 X129.554 Y135.565 E.01657
G1 X139.063 Y126.056 E.4155
G1 X139.063 Y126.592 E.01657
G1 X130.09 Y135.565 E.39207
G1 X130.627 Y135.565 E.01657
G1 X139.063 Y127.128 E.36864
G1 X139.063 Y127.665 E.01657
G1 X131.163 Y135.565 E.3452
G1 X131.699 Y135.565 E.01657
G1 X139.063 Y128.201 E.32177
G1 X139.063 Y128.737 E.01657
G1 X132.235 Y135.565 E.29834
G1 X132.772 Y135.565 E.01657
G1 X139.063 Y129.273 E.27491
G1 X139.063 Y129.81 E.01657
G1 X133.308 Y135.565 E.25148
G1 X133.844 Y135.565 E.01657
G1 X139.063 Y130.346 E.22804
G1 X139.063 Y130.882 E.01657
G1 X134.38 Y135.565 E.20461
G1 X134.916 Y135.565 E.01657
G1 X139.063 Y131.418 E.18118
G1 X139.063 Y131.955 E.01657
G1 X135.453 Y135.565 E.15775
G1 X135.989 Y135.565 E.01657
G1 X139.063 Y132.491 E.13432
G1 X139.063 Y133.027 E.01657
G1 X136.525 Y135.565 E.11088
G1 X137.061 Y135.565 E.01657
G1 X139.063 Y133.563 E.08745
G1 X139.063 Y134.1 E.01657
G1 X137.598 Y135.565 E.06402
G1 X138.134 Y135.565 E.01657
G1 X139.063 Y134.636 E.04059
G1 X139.063 Y134.921 E.00881
G3 X138.89 Y135.345 I-.722 J-.047 E.01441
G1 X138.514 Y135.721 E.01643
; OBJECT_ID: 394
; WIPE_START
G1 X138.89 Y135.345 E-.20201
G1 X138.983 Y135.214 E-.06109
G1 X139.034 Y135.09 E-.05106
G1 X139.063 Y134.921 E-.0652
G1 X139.063 Y134.636 E-.10835
G1 X138.556 Y135.143 E-.27229
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X131.495 Y132.245 Z8.4 F42000
G1 X103.298 Y120.675 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X103.396 Y121.051 I-.912 J.438 E.01296
G1 X103.396 Y134.949 E.46101
G3 X102.385 Y135.898 I-1.009 J-.062 E.05068
G1 X81.615 Y135.898 E.68898
G3 X80.602 Y134.892 I-.01 J-1.003 E.05268
G1 X80.602 Y121.115 E.45703
G3 X81.615 Y120.102 I1.003 J-.01 E.05292
G1 X102.386 Y120.102 E.68901
G3 X103.27 Y120.622 I0 J1.012 E.03569
M204 S250
G1 X103.666 Y120.532 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X103.745 Y120.763 E.00751
G3 X103.788 Y121.032 I-1.363 J.355 E.00838
G1 X103.788 Y134.968 E.42822
G3 X102.395 Y136.29 I-1.405 J-.086 E.06494
G1 X81.605 Y136.29 E.6388
G3 X80.21 Y134.897 I-.001 J-1.395 E.06728
G1 X80.21 Y121.105 E.42379
G3 X81.605 Y119.71 I1.395 J-.001 E.06735
G1 X102.396 Y119.71 E.63883
G3 X103.637 Y120.479 I-.013 J1.408 E.04717
; WIPE_START
M204 S6000
G1 X103.745 Y120.763 E-.11543
G1 X103.788 Y121.032 E-.10353
G1 X103.788 Y122.456 E-.54104
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.4 I-1.211 J-.116 P1  F42000
G1 X102.514 Y135.721 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.4221
G1 F9494.171
M204 S6000
G1 X102.89 Y135.345 E.01643
G2 X103.063 Y134.921 I-.549 J-.471 E.01441
G1 X103.063 Y134.636 E.00881
G1 X102.134 Y135.565 E.04059
G1 X101.598 Y135.565 E.01657
G1 X103.063 Y134.1 E.06402
G1 X103.063 Y133.563 E.01657
G1 X101.061 Y135.565 E.08745
G1 X100.525 Y135.565 E.01657
G1 X103.063 Y133.027 E.11088
G1 X103.063 Y132.491 E.01657
G1 X99.989 Y135.565 E.13431
G1 X99.453 Y135.565 E.01657
G1 X103.063 Y131.955 E.15775
G1 X103.063 Y131.418 E.01657
G1 X98.916 Y135.565 E.18118
G1 X98.38 Y135.565 E.01657
G1 X103.063 Y130.882 E.20461
G1 X103.063 Y130.346 E.01657
G1 X97.844 Y135.565 E.22804
G1 X97.308 Y135.565 E.01657
G1 X103.063 Y129.81 E.25148
G1 X103.063 Y129.273 E.01657
G1 X96.772 Y135.565 E.27491
G1 X96.235 Y135.565 E.01657
G1 X103.063 Y128.737 E.29834
G1 X103.063 Y128.201 E.01657
G1 X95.699 Y135.565 E.32177
G1 X95.163 Y135.565 E.01657
G1 X103.063 Y127.665 E.3452
G1 X103.063 Y127.128 E.01657
G1 X94.627 Y135.565 E.36864
G1 X94.09 Y135.565 E.01657
G1 X103.063 Y126.592 E.39207
G1 X103.063 Y126.056 E.01657
G1 X93.554 Y135.565 E.4155
G1 X93.018 Y135.565 E.01657
G1 X103.063 Y125.52 E.43893
G1 X103.063 Y124.984 E.01657
G1 X92.482 Y135.565 E.46236
G1 X91.945 Y135.565 E.01657
G1 X103.063 Y124.447 E.4858
G1 X103.063 Y123.911 E.01657
G1 X91.409 Y135.565 E.50923
G1 X90.873 Y135.565 E.01657
G1 X103.063 Y123.375 E.53266
G1 X103.063 Y122.839 E.01657
G1 X90.337 Y135.565 E.55609
G1 X89.8 Y135.565 E.01657
G1 X103.063 Y122.302 E.57952
G1 X103.063 Y121.766 E.01657
G1 X89.264 Y135.565 E.60296
G1 X88.728 Y135.565 E.01657
G1 X103.063 Y121.23 E.62639
G2 X102.976 Y120.78 I-.815 J-.077 E.01435
G1 X88.192 Y135.565 E.64605
G1 X87.655 Y135.565 E.01657
G1 X102.705 Y120.515 E.6576
G2 X102.249 Y120.435 I-.395 J.912 E.01444
G1 X87.119 Y135.565 E.66111
G1 X86.583 Y135.565 E.01657
G1 X101.712 Y120.435 E.66111
G1 X101.176 Y120.435 E.01657
G1 X86.047 Y135.565 E.66111
G1 X85.51 Y135.565 E.01657
G1 X100.64 Y120.435 E.66111
G1 X100.104 Y120.435 E.01657
G1 X84.974 Y135.565 E.66111
G1 X84.438 Y135.565 E.01657
G1 X99.567 Y120.435 E.66111
G1 X99.031 Y120.435 E.01657
G1 X83.902 Y135.565 E.66111
G1 X83.365 Y135.565 E.01657
G1 X98.495 Y120.435 E.66111
G1 X97.959 Y120.435 E.01657
G1 X82.829 Y135.565 E.66111
G1 X82.293 Y135.565 E.01657
G1 X97.422 Y120.435 E.66111
G1 X96.886 Y120.435 E.01657
G1 X81.757 Y135.565 E.66111
G3 X81.298 Y135.487 I-.063 J-1.02 E.0145
G1 X96.35 Y120.435 E.65771
G1 X95.814 Y120.435 E.01657
G1 X81.025 Y135.224 E.6462
G3 X80.935 Y134.777 I.836 J-.401 E.01421
G1 X95.277 Y120.435 E.6267
G1 X94.741 Y120.435 E.01657
G1 X80.935 Y134.241 E.60327
G1 X80.935 Y133.705 E.01657
G1 X94.205 Y120.435 E.57984
G1 X93.669 Y120.435 E.01657
G1 X80.935 Y133.169 E.55641
G1 X80.935 Y132.632 E.01657
G1 X93.132 Y120.435 E.53298
G1 X92.596 Y120.435 E.01657
G1 X80.935 Y132.096 E.50954
G1 X80.935 Y131.56 E.01657
G1 X92.06 Y120.435 E.48611
G1 X91.524 Y120.435 E.01657
G1 X80.935 Y131.024 E.46268
M73 P93 R1
G1 X80.935 Y130.487 E.01657
G1 X90.987 Y120.435 E.43925
G1 X90.451 Y120.435 E.01657
G1 X80.935 Y129.951 E.41582
G1 X80.935 Y129.415 E.01657
G1 X89.915 Y120.435 E.39238
G1 X89.379 Y120.435 E.01657
G1 X80.935 Y128.879 E.36895
G1 X80.935 Y128.342 E.01657
G1 X88.842 Y120.435 E.34552
G1 X88.306 Y120.435 E.01657
G1 X80.935 Y127.806 E.32209
G1 X80.935 Y127.27 E.01657
G1 X87.77 Y120.435 E.29865
G1 X87.234 Y120.435 E.01657
G1 X80.935 Y126.734 E.27522
G1 X80.935 Y126.198 E.01657
G1 X86.698 Y120.435 E.25179
G1 X86.161 Y120.435 E.01657
G1 X80.935 Y125.661 E.22836
G1 X80.935 Y125.125 E.01657
G1 X85.625 Y120.435 E.20493
G1 X85.089 Y120.435 E.01657
G1 X80.935 Y124.589 E.18149
G1 X80.935 Y124.053 E.01657
G1 X84.553 Y120.435 E.15806
G1 X84.016 Y120.435 E.01657
G1 X80.935 Y123.516 E.13463
G1 X80.935 Y122.98 E.01657
G1 X83.48 Y120.435 E.1112
G1 X82.944 Y120.435 E.01657
G1 X80.935 Y122.444 E.08777
G1 X80.935 Y121.908 E.01657
G1 X82.408 Y120.435 E.06433
G1 X81.871 Y120.435 E.01657
G1 X80.935 Y121.371 E.0409
G3 X81.018 Y120.785 I1.224 J-.127 E.01848
G1 X81.083 Y120.688 E.00361
G1 X81.497 Y120.274 E.01808
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9494.171
G1 X81.083 Y120.688 E-.22239
G1 X81.018 Y120.785 E-.04441
G1 X80.957 Y120.944 E-.06496
G1 X80.935 Y121.371 E-.16242
G1 X81.43 Y120.877 E-.26582
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 41/42
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z8.4 I-.247 J1.192 P1  F42000
G1 X153.052 Y135.717 Z8.4
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X152.615 Y134.892 I.552 J-.821 E.03223
G1 X152.615 Y121.114 E.45705
G3 X153.608 Y120.115 I.99 J-.009 E.05199
G1 X174.396 Y120.115 E.68959
G3 X175.383 Y121.052 I-.009 J.998 E.04967
G1 X175.383 Y134.948 E.46098
G3 X174.392 Y135.885 I-.996 J-.062 E.04979
G1 X153.614 Y135.885 E.68925
G3 X153.103 Y135.749 I-.01 J-.99 E.01777
M204 S250
G1 X152.835 Y136.043 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X152.223 Y134.897 I.769 J-1.148 E.04157
G1 X152.223 Y121.105 E.4238
G3 X153.603 Y119.723 I1.382 J0 E.06665
G1 X174.406 Y119.723 E.63922
G3 X175.775 Y121.032 I-.023 J1.395 E.064
G1 X175.775 Y134.968 E.42819
G3 X174.397 Y136.277 I-1.393 J-.085 E.06427
G1 X153.605 Y136.277 E.63889
G3 X152.886 Y136.076 I0 J-1.382 E.02324
; WIPE_START
M204 S6000
G1 X152.626 Y135.874 E-.12489
G1 X152.417 Y135.606 E-.12918
G1 X152.328 Y135.427 E-.07608
G1 X152.238 Y135.102 E-.128
G1 X152.223 Y134.897 E-.07807
G1 X152.223 Y134.308 E-.22377
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
G1 X152.797 Y135.01 F42000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42175
G1 F9502.944
M204 S6000
G1 X153.193 Y135.405 E.01728
G1 X153.297 Y135.474 E.00385
G2 X153.876 Y135.552 I.451 J-1.167 E.01818
G1 X152.948 Y134.624 E.04049
G1 X152.948 Y134.089 E.01654
G1 X154.411 Y135.552 E.06388
G1 X154.947 Y135.552 E.01654
G1 X152.948 Y133.553 E.08727
G1 X152.948 Y133.017 E.01654
G1 X155.483 Y135.552 E.11065
G1 X156.018 Y135.552 E.01654
G1 X152.948 Y132.481 E.13404
G1 X152.948 Y131.946 E.01654
G1 X156.554 Y135.552 E.15743
G1 X157.09 Y135.552 E.01654
G1 X152.948 Y131.41 E.18082
G1 X152.948 Y130.874 E.01654
G1 X157.626 Y135.552 E.20421
G1 X158.161 Y135.552 E.01654
G1 X152.948 Y130.339 E.2276
G1 X152.948 Y129.803 E.01654
G1 X158.697 Y135.552 E.25099
G1 X159.233 Y135.552 E.01654
G1 X152.948 Y129.267 E.27438
G1 X152.948 Y128.731 E.01654
G1 X159.769 Y135.552 E.29777
G1 X160.304 Y135.552 E.01654
G1 X152.948 Y128.196 E.32115
G1 X152.948 Y127.66 E.01654
G1 X160.84 Y135.552 E.34454
G1 X161.376 Y135.552 E.01654
G1 X152.948 Y127.124 E.36793
G1 X152.948 Y126.588 E.01654
G1 X161.912 Y135.552 E.39132
G1 X162.447 Y135.552 E.01654
G1 X152.948 Y126.053 E.41471
G1 X152.948 Y125.517 E.01654
G1 X162.983 Y135.552 E.4381
G1 X163.519 Y135.552 E.01654
G1 X152.948 Y124.981 E.46149
G1 X152.948 Y124.445 E.01654
G1 X164.055 Y135.552 E.48488
G1 X164.59 Y135.552 E.01654
G1 X152.948 Y123.91 E.50827
G1 X152.948 Y123.374 E.01654
G1 X165.126 Y135.552 E.53165
G1 X165.662 Y135.552 E.01654
G1 X152.948 Y122.838 E.55504
G1 X152.948 Y122.302 E.01654
G1 X166.198 Y135.552 E.57843
G1 X166.733 Y135.552 E.01654
G1 X152.948 Y121.767 E.60182
G1 X152.948 Y121.231 E.01654
G1 X167.269 Y135.552 E.62521
G1 X167.805 Y135.552 E.01654
G1 X153.035 Y120.782 E.6448
G3 X153.31 Y120.521 I.722 J.483 E.01179
G1 X168.341 Y135.552 E.65621
G1 X168.876 Y135.552 E.01654
G1 X153.773 Y120.448 E.65938
G1 X154.308 Y120.448 E.01654
G1 X169.412 Y135.552 E.65938
G1 X169.948 Y135.552 E.01654
G1 X154.844 Y120.448 E.65938
G1 X155.38 Y120.448 E.01654
G1 X170.484 Y135.552 E.65938
G1 X171.019 Y135.552 E.01654
G1 X155.916 Y120.448 E.65938
G1 X156.451 Y120.448 E.01654
G1 X171.555 Y135.552 E.65938
G1 X172.091 Y135.552 E.01654
G1 X156.987 Y120.448 E.65938
G1 X157.523 Y120.448 E.01654
G1 X172.627 Y135.552 E.65938
G1 X173.162 Y135.552 E.01654
G1 X158.059 Y120.448 E.65938
G1 X158.594 Y120.448 E.01654
G1 X173.698 Y135.552 E.65938
G1 X174.234 Y135.552 E.01654
G1 X159.13 Y120.448 E.65938
G1 X159.666 Y120.448 E.01654
G1 X174.695 Y135.477 E.65612
G2 X174.968 Y135.214 I-.471 J-.76 E.01179
G1 X160.202 Y120.448 E.64463
G1 X160.737 Y120.448 E.01654
G1 X175.05 Y134.761 E.62484
G1 X175.05 Y134.225 E.01654
G1 X161.273 Y120.448 E.60145
G1 X161.809 Y120.448 E.01654
G1 X175.05 Y133.689 E.57806
G1 X175.05 Y133.154 E.01654
G1 X162.345 Y120.448 E.55467
G1 X162.88 Y120.448 E.01654
G1 X175.05 Y132.618 E.53128
G1 X175.05 Y132.082 E.01654
G1 X163.416 Y120.448 E.50789
G1 X163.952 Y120.448 E.01654
G1 X175.05 Y131.546 E.4845
G1 X175.05 Y131.011 E.01654
G1 X164.488 Y120.448 E.46112
G1 X165.023 Y120.448 E.01654
G1 X175.05 Y130.475 E.43773
G1 X175.05 Y129.939 E.01654
G1 X165.559 Y120.448 E.41434
G1 X166.095 Y120.448 E.01654
G1 X175.05 Y129.403 E.39095
G1 X175.05 Y128.868 E.01654
G1 X166.631 Y120.448 E.36756
G1 X167.166 Y120.448 E.01654
G1 X175.05 Y128.332 E.34417
G1 X175.05 Y127.796 E.01654
G1 X167.702 Y120.448 E.32078
G1 X168.238 Y120.448 E.01654
G1 X175.05 Y127.26 E.29739
G1 X175.05 Y126.725 E.01654
G1 X168.774 Y120.448 E.274
G1 X169.309 Y120.448 E.01654
G1 X175.05 Y126.189 E.25061
G1 X175.05 Y125.653 E.01654
G1 X169.845 Y120.448 E.22722
G1 X170.381 Y120.448 E.01654
G1 X175.05 Y125.117 E.20383
G1 X175.05 Y124.582 E.01654
G1 X170.917 Y120.448 E.18045
G1 X171.452 Y120.448 E.01654
G1 X175.05 Y124.046 E.15706
G1 X175.05 Y123.51 E.01654
G1 X171.988 Y120.448 E.13367
G1 X172.524 Y120.448 E.01654
G1 X175.05 Y122.974 E.11028
G1 X175.05 Y122.439 E.01654
G1 X173.06 Y120.448 E.08689
G1 X173.595 Y120.448 E.01654
G1 X175.05 Y121.903 E.0635
G1 X175.05 Y121.367 E.01654
G1 X174.131 Y120.448 E.04011
G3 X174.761 Y120.56 I.124 J1.131 E.02001
G3 X175.209 Y120.99 I-1.959 J2.487 E.0192
; OBJECT_ID: 405
; WIPE_START
G1 X174.761 Y120.56 E-.23593
G1 X174.648 Y120.5 E-.04853
G1 X174.527 Y120.463 E-.04831
G1 X174.131 Y120.448 E-.1504
G1 X174.646 Y120.964 E-.27683
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X167.014 Y120.877 Z8.6 F42000
G1 X117.014 Y120.31 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X117.608 Y120.115 I.591 J.794 E.02108
G1 X138.396 Y120.115 E.68959
G3 X139.383 Y121.052 I-.009 J.998 E.04967
M73 P94 R1
G1 X139.383 Y134.948 E.46098
G3 X138.392 Y135.885 I-.996 J-.062 E.04979
G1 X117.614 Y135.885 E.68925
G3 X116.615 Y134.892 I-.01 J-.99 E.05199
G1 X116.615 Y121.114 E.45705
G3 X116.967 Y120.347 I.99 J-.009 E.02892
M204 S250
G1 X116.781 Y119.995 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X117.603 Y119.723 I.824 J1.109 E.02707
G1 X138.406 Y119.723 E.63922
G3 X139.775 Y121.032 I-.023 J1.395 E.064
G1 X139.775 Y134.968 E.42819
G3 X138.397 Y136.277 I-1.393 J-.085 E.06427
G1 X117.605 Y136.277 E.63889
G3 X116.223 Y134.897 I0 J-1.382 E.06665
G1 X116.223 Y121.105 E.4238
G3 X116.733 Y120.032 I1.382 J0 E.03774
; WIPE_START
M204 S6000
G1 X117.073 Y119.828 E-.15075
G1 X117.398 Y119.738 E-.128
G1 X117.603 Y119.723 E-.07807
G1 X118.664 Y119.723 E-.40318
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.6 I-1.208 J-.147 P1  F42000
G1 X116.797 Y135.01 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42175
G1 F9502.944
M204 S6000
G1 X117.193 Y135.405 E.01728
G1 X117.297 Y135.474 E.00385
G2 X117.876 Y135.552 I.451 J-1.167 E.01818
G1 X116.948 Y134.624 E.04049
G1 X116.948 Y134.089 E.01654
G1 X118.411 Y135.552 E.06388
G1 X118.947 Y135.552 E.01654
G1 X116.948 Y133.553 E.08727
G1 X116.948 Y133.017 E.01654
G1 X119.483 Y135.552 E.11065
G1 X120.018 Y135.552 E.01654
G1 X116.948 Y132.481 E.13404
G1 X116.948 Y131.946 E.01654
G1 X120.554 Y135.552 E.15743
G1 X121.09 Y135.552 E.01654
G1 X116.948 Y131.41 E.18082
G1 X116.948 Y130.874 E.01654
G1 X121.626 Y135.552 E.20421
G1 X122.161 Y135.552 E.01654
G1 X116.948 Y130.339 E.2276
G1 X116.948 Y129.803 E.01654
G1 X122.697 Y135.552 E.25099
G1 X123.233 Y135.552 E.01654
G1 X116.948 Y129.267 E.27438
G1 X116.948 Y128.731 E.01654
G1 X123.769 Y135.552 E.29777
G1 X124.304 Y135.552 E.01654
G1 X116.948 Y128.196 E.32115
G1 X116.948 Y127.66 E.01654
G1 X124.84 Y135.552 E.34454
G1 X125.376 Y135.552 E.01654
G1 X116.948 Y127.124 E.36793
G1 X116.948 Y126.588 E.01654
G1 X125.912 Y135.552 E.39132
G1 X126.447 Y135.552 E.01654
G1 X116.948 Y126.053 E.41471
G1 X116.948 Y125.517 E.01654
G1 X126.983 Y135.552 E.4381
G1 X127.519 Y135.552 E.01654
G1 X116.948 Y124.981 E.46149
G1 X116.948 Y124.445 E.01654
G1 X128.055 Y135.552 E.48488
G1 X128.59 Y135.552 E.01654
G1 X116.948 Y123.91 E.50827
G1 X116.948 Y123.374 E.01654
G1 X129.126 Y135.552 E.53165
G1 X129.662 Y135.552 E.01654
G1 X116.948 Y122.838 E.55504
G1 X116.948 Y122.302 E.01654
G1 X130.198 Y135.552 E.57843
G1 X130.733 Y135.552 E.01654
G1 X116.948 Y121.767 E.60182
G1 X116.948 Y121.231 E.01654
G1 X131.269 Y135.552 E.62521
G1 X131.805 Y135.552 E.01654
G1 X117.035 Y120.782 E.6448
G3 X117.31 Y120.521 I.722 J.483 E.01179
G1 X132.341 Y135.552 E.65621
G1 X132.876 Y135.552 E.01654
G1 X117.773 Y120.448 E.65938
G1 X118.308 Y120.448 E.01654
G1 X133.412 Y135.552 E.65938
G1 X133.948 Y135.552 E.01654
G1 X118.844 Y120.448 E.65938
G1 X119.38 Y120.448 E.01654
G1 X134.484 Y135.552 E.65938
G1 X135.019 Y135.552 E.01654
G1 X119.916 Y120.448 E.65938
G1 X120.451 Y120.448 E.01654
G1 X135.555 Y135.552 E.65938
G1 X136.091 Y135.552 E.01654
G1 X120.987 Y120.448 E.65938
G1 X121.523 Y120.448 E.01654
G1 X136.627 Y135.552 E.65938
G1 X137.162 Y135.552 E.01654
G1 X122.059 Y120.448 E.65938
G1 X122.594 Y120.448 E.01654
G1 X137.698 Y135.552 E.65938
G1 X138.234 Y135.552 E.01654
G1 X123.13 Y120.448 E.65938
G1 X123.666 Y120.448 E.01654
G1 X138.695 Y135.477 E.65612
G2 X138.968 Y135.214 I-.471 J-.76 E.01179
G1 X124.202 Y120.448 E.64463
G1 X124.737 Y120.448 E.01654
G1 X139.05 Y134.761 E.62484
G1 X139.05 Y134.225 E.01654
G1 X125.273 Y120.448 E.60145
G1 X125.809 Y120.448 E.01654
G1 X139.05 Y133.689 E.57806
G1 X139.05 Y133.154 E.01654
G1 X126.345 Y120.448 E.55467
G1 X126.88 Y120.448 E.01654
G1 X139.05 Y132.618 E.53128
G1 X139.05 Y132.082 E.01654
G1 X127.416 Y120.448 E.50789
G1 X127.952 Y120.448 E.01654
G1 X139.05 Y131.546 E.4845
G1 X139.05 Y131.011 E.01654
G1 X128.488 Y120.448 E.46112
G1 X129.023 Y120.448 E.01654
G1 X139.05 Y130.475 E.43773
G1 X139.05 Y129.939 E.01654
G1 X129.559 Y120.448 E.41434
G1 X130.095 Y120.448 E.01654
G1 X139.05 Y129.403 E.39095
G1 X139.05 Y128.868 E.01654
G1 X130.631 Y120.448 E.36756
G1 X131.166 Y120.448 E.01654
G1 X139.05 Y128.332 E.34417
G1 X139.05 Y127.796 E.01654
G1 X131.702 Y120.448 E.32078
G1 X132.238 Y120.448 E.01654
G1 X139.05 Y127.26 E.29739
G1 X139.05 Y126.725 E.01654
G1 X132.774 Y120.448 E.274
G1 X133.309 Y120.448 E.01654
G1 X139.05 Y126.189 E.25061
G1 X139.05 Y125.653 E.01654
G1 X133.845 Y120.448 E.22722
G1 X134.381 Y120.448 E.01654
G1 X139.05 Y125.117 E.20383
G1 X139.05 Y124.582 E.01654
G1 X134.917 Y120.448 E.18045
G1 X135.452 Y120.448 E.01654
G1 X139.05 Y124.046 E.15706
G1 X139.05 Y123.51 E.01654
G1 X135.988 Y120.448 E.13367
G1 X136.524 Y120.448 E.01654
G1 X139.05 Y122.974 E.11028
G1 X139.05 Y122.439 E.01654
G1 X137.06 Y120.448 E.08689
G1 X137.595 Y120.448 E.01654
G1 X139.05 Y121.903 E.0635
G1 X139.05 Y121.367 E.01654
G1 X138.131 Y120.448 E.04011
G3 X138.761 Y120.56 I.124 J1.131 E.02001
G3 X139.209 Y120.99 I-1.959 J2.487 E.0192
; OBJECT_ID: 394
; WIPE_START
G1 X138.761 Y120.56 E-.23593
G1 X138.648 Y120.5 E-.04853
G1 X138.527 Y120.463 E-.04831
G1 X138.131 Y120.448 E-.1504
G1 X138.646 Y120.964 E-.27683
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X131.014 Y120.911 Z8.6 F42000
G1 X103.307 Y120.718 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X103.306 Y120.723 E.00016
G3 X103.383 Y121.052 I-.918 J.39 E.01126
G1 X103.383 Y134.948 E.46098
G3 X102.392 Y135.885 I-.996 J-.062 E.04979
G1 X81.614 Y135.885 E.68925
G3 X80.615 Y134.892 I-.01 J-.99 E.05199
G1 X80.615 Y121.114 E.45705
G3 X81.608 Y120.115 I.99 J-.009 E.05199
G1 X102.396 Y120.115 E.68959
G3 X103.215 Y120.555 I-.009 J.998 E.03208
G1 X103.278 Y120.666 E.00421
M204 S250
G1 X103.652 Y120.533 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X103.665 Y120.567 E.00112
G3 X103.775 Y121.032 I-1.282 J.55 E.01476
G1 X103.775 Y134.968 E.42819
G3 X102.397 Y136.277 I-1.393 J-.085 E.06427
G1 X81.605 Y136.277 E.63889
G3 X80.223 Y134.897 I0 J-1.382 E.06665
G1 X80.223 Y121.105 E.4238
G3 X81.603 Y119.723 I1.382 J0 E.06665
G1 X102.406 Y119.723 E.63922
G3 X103.54 Y120.338 I-.023 J1.395 E.04121
G1 X103.622 Y120.481 E.00506
M204 S10000
G1 X103.209 Y120.99 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42175
G1 F9502.944
M204 S6000
G2 X102.761 Y120.56 I-2.407 J2.057 E.0192
G2 X102.131 Y120.448 I-.506 J1.02 E.02001
G1 X103.05 Y121.367 E.04011
G1 X103.05 Y121.903 E.01654
G1 X101.595 Y120.448 E.0635
G1 X101.06 Y120.448 E.01654
G1 X103.05 Y122.439 E.08689
G1 X103.05 Y122.974 E.01654
G1 X100.524 Y120.448 E.11028
G1 X99.988 Y120.448 E.01654
G1 X103.05 Y123.51 E.13367
G1 X103.05 Y124.046 E.01654
G1 X99.452 Y120.448 E.15706
G1 X98.917 Y120.448 E.01654
G1 X103.05 Y124.582 E.18045
G1 X103.05 Y125.117 E.01654
G1 X98.381 Y120.448 E.20383
G1 X97.845 Y120.448 E.01654
G1 X103.05 Y125.653 E.22722
G1 X103.05 Y126.189 E.01654
G1 X97.309 Y120.448 E.25061
G1 X96.774 Y120.448 E.01654
G1 X103.05 Y126.725 E.274
G1 X103.05 Y127.26 E.01654
G1 X96.238 Y120.448 E.29739
G1 X95.702 Y120.448 E.01654
G1 X103.05 Y127.796 E.32078
G1 X103.05 Y128.332 E.01654
G1 X95.166 Y120.448 E.34417
G1 X94.631 Y120.448 E.01654
G1 X103.05 Y128.868 E.36756
G1 X103.05 Y129.403 E.01654
G1 X94.095 Y120.448 E.39095
M73 P95 R1
G1 X93.559 Y120.448 E.01654
G1 X103.05 Y129.939 E.41434
G1 X103.05 Y130.475 E.01654
G1 X93.023 Y120.448 E.43773
G1 X92.488 Y120.448 E.01654
G1 X103.05 Y131.011 E.46112
G1 X103.05 Y131.546 E.01654
G1 X91.952 Y120.448 E.4845
G1 X91.416 Y120.448 E.01654
G1 X103.05 Y132.082 E.50789
G1 X103.05 Y132.618 E.01654
G1 X90.88 Y120.448 E.53128
G1 X90.345 Y120.448 E.01654
G1 X103.05 Y133.154 E.55467
G1 X103.05 Y133.689 E.01654
G1 X89.809 Y120.448 E.57806
G1 X89.273 Y120.448 E.01654
G1 X103.05 Y134.225 E.60145
G1 X103.05 Y134.761 E.01654
G1 X88.737 Y120.448 E.62484
G1 X88.202 Y120.448 E.01654
G1 X102.968 Y135.214 E.64463
G3 X102.695 Y135.477 I-.743 J-.497 E.01179
G1 X87.666 Y120.448 E.65612
G1 X87.13 Y120.448 E.01654
G1 X102.234 Y135.552 E.65938
G1 X101.698 Y135.552 E.01654
G1 X86.594 Y120.448 E.65938
G1 X86.059 Y120.448 E.01654
G1 X101.162 Y135.552 E.65938
G1 X100.627 Y135.552 E.01654
G1 X85.523 Y120.448 E.65938
G1 X84.987 Y120.448 E.01654
G1 X100.091 Y135.552 E.65938
G1 X99.555 Y135.552 E.01654
G1 X84.451 Y120.448 E.65938
G1 X83.916 Y120.448 E.01654
G1 X99.019 Y135.552 E.65938
G1 X98.484 Y135.552 E.01654
G1 X83.38 Y120.448 E.65938
G1 X82.844 Y120.448 E.01654
G1 X97.948 Y135.552 E.65938
G1 X97.412 Y135.552 E.01654
G1 X82.308 Y120.448 E.65938
G1 X81.773 Y120.448 E.01654
G1 X96.876 Y135.552 E.65938
G1 X96.341 Y135.552 E.01654
G1 X81.31 Y120.521 E.65621
G2 X81.035 Y120.782 I.447 J.744 E.01179
G1 X95.805 Y135.552 E.6448
G1 X95.269 Y135.552 E.01654
G1 X80.948 Y121.231 E.62521
G1 X80.948 Y121.767 E.01654
G1 X94.733 Y135.552 E.60182
G1 X94.198 Y135.552 E.01654
G1 X80.948 Y122.302 E.57843
G1 X80.948 Y122.838 E.01654
G1 X93.662 Y135.552 E.55504
G1 X93.126 Y135.552 E.01654
G1 X80.948 Y123.374 E.53165
G1 X80.948 Y123.91 E.01654
G1 X92.59 Y135.552 E.50827
G1 X92.055 Y135.552 E.01654
G1 X80.948 Y124.445 E.48488
G1 X80.948 Y124.981 E.01654
G1 X91.519 Y135.552 E.46149
G1 X90.983 Y135.552 E.01654
G1 X80.948 Y125.517 E.4381
G1 X80.948 Y126.053 E.01654
G1 X90.447 Y135.552 E.41471
G1 X89.912 Y135.552 E.01654
G1 X80.948 Y126.588 E.39132
G1 X80.948 Y127.124 E.01654
G1 X89.376 Y135.552 E.36793
G1 X88.84 Y135.552 E.01654
G1 X80.948 Y127.66 E.34454
G1 X80.948 Y128.196 E.01654
G1 X88.304 Y135.552 E.32115
G1 X87.769 Y135.552 E.01654
G1 X80.948 Y128.731 E.29777
G1 X80.948 Y129.267 E.01654
G1 X87.233 Y135.552 E.27438
G1 X86.697 Y135.552 E.01654
G1 X80.948 Y129.803 E.25099
G1 X80.948 Y130.339 E.01654
G1 X86.161 Y135.552 E.2276
G1 X85.626 Y135.552 E.01654
G1 X80.948 Y130.874 E.20421
G1 X80.948 Y131.41 E.01654
G1 X85.09 Y135.552 E.18082
G1 X84.554 Y135.552 E.01654
G1 X80.948 Y131.946 E.15743
G1 X80.948 Y132.481 E.01654
G1 X84.019 Y135.552 E.13404
G1 X83.483 Y135.552 E.01654
G1 X80.948 Y133.017 E.11065
G1 X80.948 Y133.553 E.01654
G1 X82.947 Y135.552 E.08727
G1 X82.411 Y135.552 E.01654
G1 X80.948 Y134.089 E.06388
G1 X80.948 Y134.624 E.01654
G1 X81.876 Y135.552 E.04049
G3 X81.297 Y135.474 I-.127 J-1.245 E.01818
G1 X81.193 Y135.405 E.00385
G1 X80.797 Y135.01 E.01728
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9502.944
G1 X81.193 Y135.405 E-.21271
G1 X81.297 Y135.474 E-.04741
G1 X81.441 Y135.529 E-.05844
G1 X81.634 Y135.552 E-.07384
G1 X81.876 Y135.552 E-.09177
G1 X81.362 Y135.039 E-.27583
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 42/42
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z8.6 I-.015 J1.217 P1  F42000
G1 X152.904 Y135.942 Z8.6
G1 Z8.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X152.346 Y134.895 I.7 J-1.045 E.03798
G1 X152.346 Y121.105 E.42372
G3 X153.603 Y119.846 I1.26 J.001 E.06071
G1 X174.414 Y119.846 E.63948
G3 X175.653 Y121.038 I-.025 J1.265 E.05807
G1 X175.653 Y134.962 E.42782
G3 X174.397 Y136.154 I-1.271 J-.081 E.05851
G1 X153.605 Y136.154 E.63889
G3 X152.954 Y135.974 I-.001 J-1.258 E.02099
; WIPE_START
M204 S6000
G1 X152.7 Y135.773 E-.12313
G1 X152.523 Y135.543 E-.11049
G1 X152.441 Y135.379 E-.06939
G1 X152.359 Y135.081 E-.11751
G1 X152.346 Y134.895 E-.07114
G1 X152.346 Y134.188 E-.26834
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
G1 X174.455 Y135.942 F42000
G1 Z8.4
G1 E.8 F1800
; FEATURE: Top surface
G1 F9547.055
M204 S2000
G1 X175.444 Y134.954 E.04295
G1 X175.445 Y134.419
G1 X173.917 Y135.947 E.06641
G1 X173.384 Y135.947
G1 X175.445 Y133.886 E.08958
G1 X175.445 Y133.352
G1 X172.85 Y135.947 E.11276
G1 X172.317 Y135.947
G1 X175.445 Y132.819 E.13593
G1 X175.445 Y132.286
G1 X171.784 Y135.947 E.1591
G1 X171.251 Y135.947
G1 X175.445 Y131.752 E.18227
G1 X175.445 Y131.219
G1 X170.717 Y135.947 E.20545
G1 X170.184 Y135.947
G1 X175.445 Y130.686 E.22862
G1 X175.445 Y130.153
G1 X169.651 Y135.947 E.25179
G1 X169.118 Y135.947
G1 X175.445 Y129.619 E.27496
G1 X175.445 Y129.086
G1 X168.584 Y135.947 E.29814
G1 X168.051 Y135.947
G1 X175.445 Y128.553 E.32131
G1 X175.445 Y128.02
G1 X167.518 Y135.947 E.34448
G1 X166.985 Y135.947
G1 X175.445 Y127.486 E.36766
G1 X175.445 Y126.953
G1 X166.451 Y135.947 E.39083
G1 X165.918 Y135.947
G1 X175.445 Y126.42 E.414
G1 X175.445 Y125.887
G1 X165.385 Y135.947 E.43717
G1 X164.852 Y135.947
G1 X175.445 Y125.353 E.46035
G1 X175.445 Y124.82
G1 X164.318 Y135.947 E.48352
G1 X163.785 Y135.947
G1 X175.445 Y124.287 E.50669
G1 X175.445 Y123.754
G1 X163.252 Y135.947 E.52986
G1 X162.719 Y135.947
G1 X175.445 Y123.22 E.55304
G1 X175.445 Y122.687
G1 X162.185 Y135.947 E.57621
G1 X161.652 Y135.947
G1 X175.445 Y122.154 E.59938
G1 X175.445 Y121.621
G1 X161.119 Y135.947 E.62255
G1 X160.586 Y135.947
G1 X175.445 Y121.087 E.64573
G1 X175.346 Y120.654
G1 X160.052 Y135.947 E.66457
G1 X159.519 Y135.947
G1 X175.121 Y120.345 E.67797
G1 X174.799 Y120.134
G1 X158.986 Y135.947 E.68717
G1 X158.453 Y135.947
G1 X174.346 Y120.053 E.69065
G1 X173.813 Y120.053
G1 X157.919 Y135.947 E.69065
G1 X157.386 Y135.947
G1 X173.28 Y120.053 E.69066
G1 X172.746 Y120.053
G1 X156.853 Y135.947 E.69066
G1 X156.319 Y135.947
G1 X172.213 Y120.053 E.69066
G1 X171.68 Y120.053
G1 X155.786 Y135.947 E.69066
G1 X155.253 Y135.947
G1 X171.147 Y120.053 E.69066
G1 X170.613 Y120.053
G1 X154.72 Y135.947 E.69066
G1 X154.186 Y135.947
G1 X170.08 Y120.053 E.69066
G1 X169.547 Y120.053
G1 X153.653 Y135.947 E.69066
G1 X153.207 Y135.86
G1 X169.014 Y120.053 E.68689
G1 X168.48 Y120.053
G1 X152.883 Y135.651 E.6778
G1 X152.657 Y135.344
G1 X167.947 Y120.053 E.66444
G1 X167.414 Y120.053
G1 X152.555 Y134.912 E.64571
G1 X152.553 Y134.381
G1 X166.881 Y120.053 E.62261
G1 X166.347 Y120.053
G1 X152.553 Y133.848 E.59944
G1 X152.553 Y133.315
G1 X165.814 Y120.053 E.57627
G1 X165.281 Y120.053
G1 X152.553 Y132.781 E.5531
G1 X152.553 Y132.248
G1 X164.748 Y120.053 E.52992
G1 X164.214 Y120.053
G1 X152.553 Y131.715 E.50675
M73 P95 R0
G1 X152.553 Y131.181
G1 X163.681 Y120.053 E.48358
G1 X163.148 Y120.053
G1 X152.553 Y130.648 E.46041
G1 X152.553 Y130.115
G1 X162.615 Y120.053 E.43723
G1 X162.082 Y120.053
G1 X152.553 Y129.582 E.41406
M73 P96 R0
G1 X152.553 Y129.048
G1 X161.548 Y120.053 E.39089
G1 X161.015 Y120.053
G1 X152.553 Y128.515 E.36772
G1 X152.553 Y127.982
G1 X160.482 Y120.053 E.34455
G1 X159.949 Y120.053
G1 X152.553 Y127.449 E.32137
G1 X152.553 Y126.915
G1 X159.415 Y120.053 E.2982
G1 X158.882 Y120.053
G1 X152.553 Y126.382 E.27503
G1 X152.553 Y125.849
G1 X158.349 Y120.053 E.25186
G1 X157.816 Y120.053
G1 X152.553 Y125.316 E.22869
G1 X152.553 Y124.782
G1 X157.282 Y120.053 E.20551
G1 X156.749 Y120.053
G1 X152.553 Y124.249 E.18234
G1 X152.553 Y123.716
G1 X156.216 Y120.053 E.15917
G1 X155.683 Y120.053
G1 X152.553 Y123.183 E.136
G1 X152.553 Y122.649
G1 X155.149 Y120.053 E.11283
G1 X154.616 Y120.053
G1 X152.553 Y122.116 E.08965
G1 X152.553 Y121.583
G1 X154.083 Y120.053 E.06648
G1 X153.545 Y120.058
G1 X152.562 Y121.04 E.04268
; WIPE_START
M204 S6000
G1 X153.545 Y120.058 E-.52787
G1 X154.083 Y120.053 E-.20449
G1 X154.031 Y120.104 E-.02763
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.152 Y120.158 Z8.8 F42000
G1 Z8.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.109531
G1 F15000
M204 S6000
G2 X152.997 Y120.277 I.64 J.998 E.00106
; LINE_WIDTH: 0.127083
G2 X152.687 Y120.61 I1.364 J1.579 E.00313
; LINE_WIDTH: 0.0931386
G1 X152.661 Y120.649 E.00019
; WIPE_START
G1 X152.687 Y120.61 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X152.927 Y128.239 Z8.8 F42000
G1 X153.167 Y135.846 Z8.8
G1 Z8.4
G1 E.8 F1800
; LINE_WIDTH: 0.105132
G1 F15000
M204 S6000
G3 X153.045 Y135.755 I.349 J-.598 E.00077
; WIPE_START
G1 X153.167 Y135.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X160.797 Y135.675 Z8.8 F42000
G1 X175.341 Y135.349 Z8.8
G1 Z8.4
G1 E.8 F1800
; LINE_WIDTH: 0.0929743
G1 F15000
M204 S6000
G1 X175.315 Y135.388 E.00019
; LINE_WIDTH: 0.12422
G3 X174.891 Y135.813 I-1.886 J-1.457 E.00399
; LINE_WIDTH: 0.0937403
G1 X174.848 Y135.842 E.00021
; OBJECT_ID: 405
; WIPE_START
G1 X174.891 Y135.813 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X167.52 Y133.83 Z8.8 F42000
G1 X116.76 Y120.172 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X117.603 Y119.846 I.846 J.934 E.0284
G1 X138.414 Y119.846 E.63948
G3 X139.653 Y121.038 I-.025 J1.265 E.05807
G1 X139.653 Y134.962 E.42782
G3 X138.397 Y136.154 I-1.271 J-.081 E.05851
G1 X117.605 Y136.154 E.63889
G3 X116.346 Y134.895 I-.001 J-1.258 E.06081
G1 X116.346 Y121.105 E.42372
G3 X116.717 Y120.213 I1.26 J.001 E.03047
; WIPE_START
M204 S6000
G1 X116.901 Y120.058 E-.09142
G1 X117.121 Y119.941 E-.0946
G1 X117.416 Y119.859 E-.11649
G1 X117.603 Y119.846 E-.0712
G1 X118.619 Y119.846 E-.3863
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.546 Y124.655 Z8.8 F42000
G1 X138.455 Y135.942 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Top surface
G1 F9547.055
M204 S2000
G1 X139.444 Y134.954 E.04295
G1 X139.445 Y134.419
G1 X137.917 Y135.947 E.06641
G1 X137.384 Y135.947
G1 X139.445 Y133.886 E.08958
G1 X139.445 Y133.352
G1 X136.85 Y135.947 E.11276
G1 X136.317 Y135.947
G1 X139.445 Y132.819 E.13593
G1 X139.445 Y132.286
G1 X135.784 Y135.947 E.1591
G1 X135.251 Y135.947
G1 X139.445 Y131.752 E.18227
G1 X139.445 Y131.219
G1 X134.717 Y135.947 E.20545
G1 X134.184 Y135.947
G1 X139.445 Y130.686 E.22862
G1 X139.445 Y130.153
G1 X133.651 Y135.947 E.25179
G1 X133.118 Y135.947
G1 X139.445 Y129.619 E.27496
G1 X139.445 Y129.086
G1 X132.584 Y135.947 E.29814
G1 X132.051 Y135.947
G1 X139.445 Y128.553 E.32131
G1 X139.445 Y128.02
G1 X131.518 Y135.947 E.34448
G1 X130.985 Y135.947
G1 X139.445 Y127.486 E.36766
G1 X139.445 Y126.953
G1 X130.451 Y135.947 E.39083
G1 X129.918 Y135.947
G1 X139.445 Y126.42 E.414
G1 X139.445 Y125.887
G1 X129.385 Y135.947 E.43717
G1 X128.852 Y135.947
G1 X139.445 Y125.353 E.46035
G1 X139.445 Y124.82
G1 X128.318 Y135.947 E.48352
G1 X127.785 Y135.947
G1 X139.445 Y124.287 E.50669
G1 X139.445 Y123.754
G1 X127.252 Y135.947 E.52986
G1 X126.719 Y135.947
G1 X139.445 Y123.22 E.55304
G1 X139.445 Y122.687
G1 X126.185 Y135.947 E.57621
G1 X125.652 Y135.947
G1 X139.445 Y122.154 E.59938
G1 X139.445 Y121.621
G1 X125.119 Y135.947 E.62255
G1 X124.586 Y135.947
G1 X139.445 Y121.087 E.64573
G1 X139.346 Y120.654
G1 X124.052 Y135.947 E.66457
G1 X123.519 Y135.947
G1 X139.121 Y120.345 E.67797
G1 X138.799 Y120.134
G1 X122.986 Y135.947 E.68717
G1 X122.453 Y135.947
G1 X138.346 Y120.053 E.69065
G1 X137.813 Y120.053
G1 X121.919 Y135.947 E.69065
G1 X121.386 Y135.947
G1 X137.28 Y120.053 E.69066
G1 X136.746 Y120.053
G1 X120.853 Y135.947 E.69066
G1 X120.319 Y135.947
G1 X136.213 Y120.053 E.69066
G1 X135.68 Y120.053
G1 X119.786 Y135.947 E.69066
G1 X119.253 Y135.947
G1 X135.147 Y120.053 E.69066
G1 X134.613 Y120.053
G1 X118.72 Y135.947 E.69066
G1 X118.186 Y135.947
G1 X134.08 Y120.053 E.69066
G1 X133.547 Y120.053
G1 X117.653 Y135.947 E.69066
G1 X117.207 Y135.86
G1 X133.014 Y120.053 E.68689
G1 X132.48 Y120.053
G1 X116.883 Y135.651 E.6778
G1 X116.657 Y135.344
G1 X131.947 Y120.053 E.66444
G1 X131.414 Y120.053
G1 X116.555 Y134.912 E.64571
G1 X116.553 Y134.381
G1 X130.881 Y120.053 E.62261
G1 X130.347 Y120.053
G1 X116.553 Y133.848 E.59944
G1 X116.553 Y133.315
G1 X129.814 Y120.053 E.57627
G1 X129.281 Y120.053
G1 X116.553 Y132.781 E.5531
G1 X116.553 Y132.248
G1 X128.748 Y120.053 E.52992
G1 X128.214 Y120.053
G1 X116.553 Y131.715 E.50675
G1 X116.553 Y131.181
G1 X127.681 Y120.053 E.48358
G1 X127.148 Y120.053
G1 X116.553 Y130.648 E.46041
G1 X116.553 Y130.115
G1 X126.615 Y120.053 E.43723
G1 X126.082 Y120.053
G1 X116.553 Y129.582 E.41406
G1 X116.553 Y129.048
G1 X125.548 Y120.053 E.39089
G1 X125.015 Y120.053
G1 X116.553 Y128.515 E.36772
G1 X116.553 Y127.982
G1 X124.482 Y120.053 E.34455
G1 X123.949 Y120.053
G1 X116.553 Y127.449 E.32137
G1 X116.553 Y126.915
G1 X123.415 Y120.053 E.2982
M73 P97 R0
G1 X122.882 Y120.053
G1 X116.553 Y126.382 E.27503
G1 X116.553 Y125.849
G1 X122.349 Y120.053 E.25186
G1 X121.816 Y120.053
G1 X116.553 Y125.316 E.22869
G1 X116.553 Y124.782
G1 X121.282 Y120.053 E.20551
G1 X120.749 Y120.053
G1 X116.553 Y124.249 E.18234
G1 X116.553 Y123.716
G1 X120.216 Y120.053 E.15917
G1 X119.683 Y120.053
G1 X116.553 Y123.183 E.136
G1 X116.553 Y122.649
G1 X119.149 Y120.053 E.11283
G1 X118.616 Y120.053
G1 X116.553 Y122.116 E.08965
G1 X116.553 Y121.583
G1 X118.083 Y120.053 E.06648
G1 X117.545 Y120.058
G1 X116.562 Y121.04 E.04268
; WIPE_START
M204 S6000
G1 X117.545 Y120.058 E-.52787
G1 X118.083 Y120.053 E-.20449
G1 X118.031 Y120.104 E-.02763
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.152 Y120.158 Z8.8 F42000
G1 Z8.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.109531
G1 F15000
M204 S6000
G2 X116.997 Y120.277 I.64 J.998 E.00106
; LINE_WIDTH: 0.127083
G2 X116.687 Y120.61 I1.364 J1.579 E.00313
; LINE_WIDTH: 0.0931386
G1 X116.661 Y120.649 E.00019
; WIPE_START
G1 X116.687 Y120.61 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.927 Y128.239 Z8.8 F42000
G1 X117.167 Y135.846 Z8.8
G1 Z8.4
G1 E.8 F1800
; LINE_WIDTH: 0.105132
G1 F15000
M204 S6000
G3 X117.045 Y135.755 I.349 J-.598 E.00077
; WIPE_START
G1 X117.167 Y135.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.797 Y135.675 Z8.8 F42000
G1 X139.341 Y135.349 Z8.8
G1 Z8.4
G1 E.8 F1800
; LINE_WIDTH: 0.0929743
G1 F15000
M204 S6000
G1 X139.315 Y135.388 E.00019
; LINE_WIDTH: 0.12422
G3 X138.891 Y135.813 I-1.886 J-1.457 E.00399
; LINE_WIDTH: 0.0937403
G1 X138.848 Y135.842 E.00021
; OBJECT_ID: 394
; WIPE_START
G1 X138.891 Y135.813 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X131.882 Y132.792 Z8.8 F42000
G1 X103.538 Y120.575 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X103.615 Y120.796 E.00717
G3 X103.653 Y121.038 I-1.225 J.315 E.00756
G1 X103.653 Y134.962 E.42782
G3 X102.397 Y136.154 I-1.271 J-.081 E.05851
G1 X81.605 Y136.154 E.63889
G3 X80.346 Y134.895 I-.001 J-1.258 E.06081
G1 X80.346 Y121.105 E.42372
G3 X81.603 Y119.846 I1.26 J.001 E.06071
G1 X102.414 Y119.846 E.63948
G3 X103.51 Y120.522 I-.025 J1.265 E.04149
; WIPE_START
M204 S6000
G1 X103.615 Y120.796 E-.11126
G1 X103.653 Y121.038 E-.09337
G1 X103.653 Y122.5 E-.55538
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.975 Y130.102 Z8.8 F42000
G1 X102.455 Y135.942 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Top surface
G1 F9547.055
M204 S2000
G1 X103.444 Y134.954 E.04295
G1 X103.445 Y134.419
G1 X101.917 Y135.947 E.06641
G1 X101.384 Y135.947
G1 X103.445 Y133.886 E.08958
G1 X103.445 Y133.352
G1 X100.85 Y135.947 E.11276
G1 X100.317 Y135.947
G1 X103.445 Y132.819 E.13593
G1 X103.445 Y132.286
G1 X99.784 Y135.947 E.1591
G1 X99.251 Y135.947
G1 X103.445 Y131.752 E.18227
G1 X103.445 Y131.219
G1 X98.717 Y135.947 E.20545
G1 X98.184 Y135.947
G1 X103.445 Y130.686 E.22862
G1 X103.445 Y130.153
G1 X97.651 Y135.947 E.25179
G1 X97.118 Y135.947
G1 X103.445 Y129.619 E.27496
G1 X103.445 Y129.086
G1 X96.584 Y135.947 E.29814
G1 X96.051 Y135.947
G1 X103.445 Y128.553 E.32131
G1 X103.445 Y128.02
G1 X95.518 Y135.947 E.34448
G1 X94.985 Y135.947
G1 X103.445 Y127.486 E.36766
G1 X103.445 Y126.953
G1 X94.451 Y135.947 E.39083
G1 X93.918 Y135.947
G1 X103.445 Y126.42 E.414
G1 X103.445 Y125.887
G1 X93.385 Y135.947 E.43717
G1 X92.852 Y135.947
G1 X103.445 Y125.353 E.46035
G1 X103.445 Y124.82
G1 X92.318 Y135.947 E.48352
G1 X91.785 Y135.947
G1 X103.445 Y124.287 E.50669
G1 X103.445 Y123.754
G1 X91.252 Y135.947 E.52986
G1 X90.719 Y135.947
G1 X103.445 Y123.22 E.55304
G1 X103.445 Y122.687
G1 X90.185 Y135.947 E.57621
G1 X89.652 Y135.947
G1 X103.445 Y122.154 E.59938
G1 X103.445 Y121.621
G1 X89.119 Y135.947 E.62255
G1 X88.586 Y135.947
G1 X103.445 Y121.087 E.64573
G1 X103.346 Y120.654
G1 X88.052 Y135.947 E.66457
G1 X87.519 Y135.947
G1 X103.121 Y120.345 E.67797
G1 X102.799 Y120.134
G1 X86.986 Y135.947 E.68717
G1 X86.453 Y135.947
G1 X102.346 Y120.053 E.69065
G1 X101.813 Y120.053
G1 X85.919 Y135.947 E.69065
G1 X85.386 Y135.947
G1 X101.28 Y120.053 E.69066
G1 X100.746 Y120.053
G1 X84.853 Y135.947 E.69066
G1 X84.32 Y135.947
G1 X100.213 Y120.053 E.69066
G1 X99.68 Y120.053
G1 X83.786 Y135.947 E.69066
G1 X83.253 Y135.947
G1 X99.147 Y120.053 E.69066
G1 X98.613 Y120.053
G1 X82.72 Y135.947 E.69066
G1 X82.186 Y135.947
G1 X98.08 Y120.053 E.69066
G1 X97.547 Y120.053
G1 X81.653 Y135.947 E.69066
G1 X81.207 Y135.86
G1 X97.014 Y120.053 E.68689
G1 X96.48 Y120.053
G1 X80.883 Y135.651 E.6778
G1 X80.657 Y135.344
G1 X95.947 Y120.053 E.66444
G1 X95.414 Y120.053
G1 X80.555 Y134.912 E.64571
G1 X80.553 Y134.381
G1 X94.881 Y120.053 E.62261
G1 X94.347 Y120.053
G1 X80.553 Y133.848 E.59944
G1 X80.553 Y133.315
G1 X93.814 Y120.053 E.57627
G1 X93.281 Y120.053
G1 X80.553 Y132.781 E.5531
G1 X80.553 Y132.248
G1 X92.748 Y120.053 E.52992
G1 X92.215 Y120.053
G1 X80.553 Y131.715 E.50675
G1 X80.553 Y131.181
G1 X91.681 Y120.053 E.48358
G1 X91.148 Y120.053
G1 X80.553 Y130.648 E.46041
G1 X80.553 Y130.115
G1 X90.615 Y120.053 E.43723
G1 X90.082 Y120.053
G1 X80.553 Y129.582 E.41406
G1 X80.553 Y129.048
G1 X89.548 Y120.053 E.39089
G1 X89.015 Y120.053
G1 X80.553 Y128.515 E.36772
G1 X80.553 Y127.982
G1 X88.482 Y120.053 E.34455
G1 X87.949 Y120.053
G1 X80.553 Y127.449 E.32137
G1 X80.553 Y126.915
G1 X87.415 Y120.053 E.2982
G1 X86.882 Y120.053
G1 X80.553 Y126.382 E.27503
G1 X80.553 Y125.849
G1 X86.349 Y120.053 E.25186
G1 X85.816 Y120.053
G1 X80.553 Y125.316 E.22869
M73 P98 R0
G1 X80.553 Y124.782
G1 X85.282 Y120.053 E.20551
G1 X84.749 Y120.053
G1 X80.553 Y124.249 E.18234
G1 X80.553 Y123.716
G1 X84.216 Y120.053 E.15917
G1 X83.683 Y120.053
G1 X80.553 Y123.183 E.136
G1 X80.553 Y122.649
G1 X83.149 Y120.053 E.11283
G1 X82.616 Y120.053
G1 X80.553 Y122.116 E.08965
G1 X80.553 Y121.583
G1 X82.083 Y120.053 E.06648
G1 X81.545 Y120.058
G1 X80.562 Y121.04 E.04268
; WIPE_START
M204 S6000
G1 X81.545 Y120.058 E-.52787
G1 X82.083 Y120.053 E-.20449
G1 X82.031 Y120.104 E-.02763
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.152 Y120.158 Z8.8 F42000
G1 Z8.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.109531
G1 F15000
M204 S6000
G2 X80.997 Y120.277 I.64 J.998 E.00106
; LINE_WIDTH: 0.127083
G2 X80.687 Y120.61 I1.364 J1.579 E.00313
; LINE_WIDTH: 0.0931386
G1 X80.661 Y120.649 E.00019
; WIPE_START
G1 X80.687 Y120.61 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.927 Y128.239 Z8.8 F42000
G1 X81.167 Y135.846 Z8.8
G1 Z8.4
G1 E.8 F1800
; LINE_WIDTH: 0.105132
G1 F15000
M204 S6000
G3 X81.045 Y135.755 I.349 J-.598 E.00077
; WIPE_START
G1 X81.167 Y135.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.797 Y135.675 Z8.8 F42000
G1 X103.341 Y135.349 Z8.8
G1 Z8.4
G1 E.8 F1800
; LINE_WIDTH: 0.0929743
G1 F15000
M204 S6000
G1 X103.315 Y135.388 E.00019
; LINE_WIDTH: 0.12422
G3 X102.891 Y135.813 I-1.886 J-1.457 E.00399
; LINE_WIDTH: 0.0937403
G1 X102.848 Y135.842 E.00021
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F15000
G1 X102.891 Y135.813 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.8 I1.217 J0 P1  F42000
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
G1 Z8.8 F900 ; lower z a little
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

    G1 Z108.4 F600
    G1 Z106.4

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

