; HEADER_BLOCK_START
; BambuStudio 02.08.02.61
; model printing time: 9m 7s; total estimated time: 15m 24s
; total layer number: 42
; total filament length [mm] : 789.22
; total filament volume [cm^3] : 1898.30
; total filament weight [g] : 2.35
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
M73 P0 R15
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
M73 P3 R14
G1 E-0.5 F300

G1 X-28.5 F30000
M73 P5 R14
G1 X-48.2 F3000
M73 P6 R14
G1 X-28.5 F30000 ;wipe and shake
M73 P7 R14
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
M73 P9 R14
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
M73 P9 R13
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
M73 P10 R13
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
M73 P38 R9
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
M73 P39 R9
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
    G29 A1 X121.5 Y113 I13 J30
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
; OBJECT_ID: 394
M73 P40 R9
G1 X133.582 Y113.918 F42000
M204 S6000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X133.582 Y142.082 E1.04899
G1 X122.418 Y142.082 E.41584
G1 X122.418 Y113.918 E1.049
G1 X133.522 Y113.918 E.41361
M204 S6000
G1 X133.86 Y113.501 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X134.039 Y113.808 I-.161 J.301 E.01393
G1 X134.039 Y142.192 E1.05718
G3 X133.713 Y142.539 I-.351 J-.003 E.01952
G1 X122.308 Y142.539 E.42476
G3 X121.961 Y142.188 I.003 J-.351 E.02044
G1 X121.961 Y113.808 E1.05703
G3 X122.287 Y113.461 I.351 J.003 E.01952
G1 X133.733 Y113.462 E.42629
G3 X133.804 Y113.478 I-.034 J.339 E.00274
; WIPE_START
G1 X133.962 Y113.585 E-.07257
G1 X134.024 Y113.702 E-.05022
G1 X134.039 Y113.808 E-.04088
G1 X134.039 Y115.377 E-.59633
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


G1 X133.4 Y115.039 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.5066
G1 F6300
M204 S500
M73 P41 R9
G1 X132.667 Y114.306 E.03913
G1 X132.012 Y114.306 E.02478
G1 X133.194 Y115.489 E.06317
G1 X133.194 Y116.144 E.02478
G1 X131.356 Y114.306 E.09821
G1 X130.7 Y114.307 E.02478
G1 X133.194 Y116.8 E.13325
G1 X133.194 Y117.456 E.02478
G1 X130.044 Y114.307 E.16829
G1 X129.389 Y114.307 E.02478
G1 X133.194 Y118.112 E.20333
G1 X133.194 Y118.767 E.02478
G1 X128.733 Y114.307 E.23836
G1 X128.077 Y114.307 E.02478
G1 X133.194 Y119.423 E.2734
G1 X133.194 Y120.079 E.02478
G1 X127.422 Y114.307 E.30844
G1 X126.766 Y114.307 E.02478
G1 X133.194 Y120.735 E.34348
G1 X133.194 Y121.39 E.02478
G1 X126.11 Y114.307 E.37851
G1 X125.454 Y114.307 E.02478
G1 X133.194 Y122.046 E.41355
G1 X133.194 Y122.702 E.02478
G1 X124.799 Y114.307 E.44859
G1 X124.143 Y114.307 E.02478
G1 X133.194 Y123.358 E.48363
G1 X133.194 Y124.013 E.02478
G1 X123.487 Y114.307 E.51866
G1 X122.832 Y114.307 E.02478
G1 X133.194 Y124.669 E.5537
G1 X133.194 Y125.325 E.02478
G1 X122.806 Y114.937 E.55506
G1 X122.806 Y115.593 E.02478
G1 X133.194 Y125.981 E.55506
G1 X133.194 Y126.636 E.02478
G1 X122.806 Y116.249 E.55506
G1 X122.806 Y116.904 E.02478
G1 X133.194 Y127.292 E.55506
G1 X133.194 Y127.948 E.02478
M73 P41 R8
G1 X122.806 Y117.56 E.55506
G1 X122.806 Y118.216 E.02478
G1 X133.194 Y128.604 E.55506
G1 X133.194 Y129.259 E.02478
G1 X122.806 Y118.872 E.55506
G1 X122.806 Y119.527 E.02478
G1 X133.194 Y129.915 E.55506
G1 X133.194 Y130.571 E.02478
G1 X122.806 Y120.183 E.55506
G1 X122.806 Y120.839 E.02478
G1 X133.194 Y131.227 E.55506
G1 X133.194 Y131.882 E.02478
G1 X122.806 Y121.495 E.55506
G1 X122.806 Y122.15 E.02478
G1 X133.194 Y132.538 E.55506
G1 X133.194 Y133.194 E.02478
G1 X122.806 Y122.806 E.55506
G1 X122.806 Y123.462 E.02478
G1 X133.194 Y133.85 E.55506
G1 X133.194 Y134.505 E.02478
G1 X122.806 Y124.118 E.55506
G1 X122.806 Y124.773 E.02478
M73 P42 R8
G1 X133.194 Y135.161 E.55506
G1 X133.194 Y135.817 E.02478
G1 X122.806 Y125.429 E.55506
G1 X122.806 Y126.085 E.02478
G1 X133.194 Y136.472 E.55506
G1 X133.194 Y137.128 E.02478
G1 X122.806 Y126.741 E.55506
G1 X122.806 Y127.396 E.02478
G1 X133.194 Y137.784 E.55506
G1 X133.194 Y138.44 E.02478
G1 X122.806 Y128.052 E.55506
G1 X122.806 Y128.708 E.02478
G1 X133.194 Y139.095 E.55506
G1 X133.194 Y139.751 E.02478
G1 X122.806 Y129.363 E.55506
G1 X122.806 Y130.019 E.02478
G1 X133.194 Y140.407 E.55506
G1 X133.194 Y141.063 E.02478
G1 X122.806 Y130.675 E.55506
G1 X122.806 Y131.331 E.02478
G1 X133.169 Y141.693 E.55371
G1 X132.513 Y141.693 E.02478
G1 X122.806 Y131.986 E.51867
G1 X122.806 Y132.642 E.02478
G1 X131.857 Y141.693 E.48364
G1 X131.201 Y141.693 E.02477
G1 X122.806 Y133.298 E.4486
G1 X122.806 Y133.954 E.02478
G1 X130.546 Y141.693 E.41356
G1 X129.89 Y141.693 E.02477
G1 X122.806 Y134.609 E.37853
G1 X122.806 Y135.265 E.02478
G1 X129.234 Y141.693 E.34349
G1 X128.579 Y141.693 E.02478
G1 X122.806 Y135.921 E.30845
G1 X122.806 Y136.577 E.02478
G1 X127.923 Y141.693 E.27341
G1 X127.267 Y141.693 E.02477
G1 X122.806 Y137.232 E.23838
G1 X122.806 Y137.888 E.02478
G1 X126.612 Y141.694 E.20334
G1 X125.956 Y141.694 E.02477
G1 X122.806 Y138.544 E.1683
G1 X122.806 Y139.2 E.02478
G1 X125.3 Y141.694 E.13327
G1 X124.644 Y141.694 E.02478
G1 X122.806 Y139.855 E.09823
G1 X122.806 Y140.511 E.02478
G1 X123.989 Y141.694 E.06319
G1 X123.333 Y141.694 E.02477
G1 X122.6 Y140.961 E.03915
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6300
M73 P43 R8
G1 X123.333 Y141.694 E-.3937
G1 X123.989 Y141.694 E-.24916
G1 X123.771 Y141.476 E-.11714
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/42
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S201.45
; open powerlost recovery
M1003 S1
; OBJECT_ID: 394
M204 S10000
G17
G3 Z.6 I1.145 J.412 P1  F42000
G1 X133.787 Y113.637 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X133.843 Y113.683 E.00238
G1 X133.877 Y113.746 E.00239
G1 X133.885 Y113.81 E.00212
G1 X133.881 Y142.236 E.94295
G3 X133.702 Y142.384 I-.19 J-.047 E.00826
G1 X122.264 Y142.381 E.3794
G3 X122.115 Y142.178 I.043 J-.188 E.00912
G1 X122.119 Y113.764 E.94253
G3 X122.298 Y113.616 I.19 J.047 E.00826
G1 X133.718 Y113.616 E.37879
G1 X133.73 Y113.62 E.00042
M204 S250
G1 X133.902 Y113.262 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4800
M204 S5000
G1 X133.921 Y113.267 E.0006
G3 X134.277 Y113.8 I-.223 J.535 E.02086
G1 X134.277 Y141.595 E.85406
G3 X134.274 Y142.257 I-6.743 J.3 E.02035
G3 X134.109 Y142.606 I-.654 J-.094 E.01206
G1 F5700
G3 X133.813 Y142.766 I-.5 J-.577 E.01043
G1 F4800
G1 X122.905 Y142.777 E.33515
G3 X122.243 Y142.774 I-.301 J-6.719 E.02035
G3 X121.723 Y142.192 I.062 J-.58 E.02629
G1 X121.723 Y114.405 E.85381
G3 X121.726 Y113.743 I6.743 J-.3 E.02035
G3 X121.891 Y113.394 I.654 J.094 E.01206
G1 F5700
G3 X122.187 Y113.234 I.5 J.577 E.01043
G1 F4800
G1 X133.1 Y113.223 E.33532
G3 X133.756 Y113.226 I.3 J6.397 E.02017
G1 X133.844 Y113.248 E.00277
; WIPE_START
M204 S6000
G1 X133.921 Y113.267 E-.03017
G1 X134.108 Y113.392 E-.08548
G1 X134.233 Y113.579 E-.08556
G1 X134.277 Y113.8 E-.08545
G1 X134.277 Y115.045 E-.47334
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


G1 X122.288 Y114.552 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42456
G1 F9432.973
M204 S6000
G1 X122.891 Y113.949 E.02651
G1 X123.431 Y113.949 E.01678
G1 X122.458 Y114.922 E.04279
G1 X122.458 Y115.462 E.01679
G1 X123.97 Y113.949 E.06653
G1 X124.51 Y113.949 E.01678
G1 X122.457 Y116.002 E.09028
G1 X122.457 Y116.542 E.01679
G1 X125.05 Y113.949 E.11402
G1 X125.589 Y113.949 E.01678
G1 X122.457 Y117.082 E.13776
G1 X122.457 Y117.622 E.01679
G1 X126.129 Y113.949 E.16151
G1 X126.669 Y113.949 E.01678
G1 X122.457 Y118.161 E.18525
G1 X122.456 Y118.701 E.01679
G1 X127.209 Y113.949 E.209
G1 X127.748 Y113.949 E.01678
G1 X122.456 Y119.241 E.23274
G1 X122.456 Y119.781 E.01679
G1 X128.288 Y113.949 E.25649
G1 X128.828 Y113.949 E.01678
G1 X122.456 Y120.321 E.28023
G1 X122.456 Y120.861 E.01679
G1 X129.367 Y113.949 E.30397
G1 X129.907 Y113.949 E.01678
G1 X122.455 Y121.401 E.32772
G1 X122.455 Y121.941 E.01679
G1 X130.447 Y113.949 E.35146
G1 X130.986 Y113.949 E.01678
G1 X122.455 Y122.481 E.37521
G1 X122.455 Y123.021 E.01679
G1 X131.526 Y113.95 E.39895
G1 X132.066 Y113.95 E.01678
G1 X122.455 Y123.561 E.4227
G1 X122.455 Y124.1 E.01679
G1 X132.605 Y113.95 E.44644
G1 X133.145 Y113.95 E.01678
G1 X122.454 Y124.64 E.47018
G1 X122.454 Y125.18 E.01679
G1 X133.552 Y114.083 E.48808
G1 X133.552 Y114.623 E.01679
G1 X122.454 Y125.72 E.48808
G1 X122.454 Y126.26 E.01679
G1 X133.551 Y115.163 E.48808
G1 X133.551 Y115.702 E.01679
G1 X122.454 Y126.8 E.48808
G1 X122.453 Y127.34 E.01679
G1 X133.551 Y116.242 E.48808
G1 X133.551 Y116.782 E.01679
G1 X122.453 Y127.88 E.48808
G1 X122.453 Y128.42 E.01679
G1 X133.551 Y117.322 E.48808
G1 X133.55 Y117.862 E.01679
G1 X122.453 Y128.96 E.48808
G1 X122.453 Y129.5 E.01679
G1 X133.55 Y118.402 E.48808
G1 X133.55 Y118.942 E.01679
G1 X122.452 Y130.04 E.48808
G1 X122.452 Y130.579 E.01679
G1 X133.55 Y119.482 E.48808
G1 X133.55 Y120.022 E.01679
G1 X122.452 Y131.119 E.48808
G1 X122.452 Y131.659 E.01679
G1 X133.549 Y120.562 E.48808
G1 X133.549 Y121.102 E.01679
G1 X122.452 Y132.199 E.48808
G1 X122.451 Y132.739 E.01679
G1 X133.549 Y121.641 E.48808
M73 P44 R8
G1 X133.549 Y122.181 E.01679
G1 X122.451 Y133.279 E.48808
G1 X122.451 Y133.819 E.01679
G1 X133.549 Y122.721 E.48808
G1 X133.548 Y123.261 E.01679
G1 X122.451 Y134.359 E.48808
G1 X122.451 Y134.899 E.01679
G1 X133.548 Y123.801 E.48808
G1 X133.548 Y124.341 E.01679
G1 X122.45 Y135.439 E.48808
G1 X122.45 Y135.979 E.01679
G1 X133.548 Y124.881 E.48808
G1 X133.548 Y125.421 E.01679
G1 X122.45 Y136.518 E.48808
G1 X122.45 Y137.058 E.01679
G1 X133.548 Y125.961 E.48808
G1 X133.547 Y126.501 E.01679
G1 X122.45 Y137.598 E.48808
G1 X122.45 Y138.138 E.01679
G1 X133.547 Y127.041 E.48808
G1 X133.547 Y127.581 E.01679
G1 X122.449 Y138.678 E.48808
G1 X122.449 Y139.218 E.01679
G1 X133.547 Y128.12 E.48808
G1 X133.547 Y128.66 E.01679
G1 X122.449 Y139.758 E.48808
G1 X122.449 Y140.298 E.01679
G1 X133.546 Y129.2 E.48808
G1 X133.546 Y129.74 E.01679
G1 X122.449 Y140.838 E.48808
G1 X122.448 Y141.378 E.01679
G1 X133.546 Y130.28 E.48808
G1 X133.546 Y130.82 E.01679
G1 X122.448 Y141.918 E.48808
G1 X122.448 Y142.042 E.00387
G1 X122.863 Y142.042 E.01291
G1 X133.546 Y131.36 E.46981
G1 X133.545 Y131.9 E.01679
G1 X123.403 Y142.043 E.44609
G1 X123.942 Y142.043 E.01677
G1 X133.545 Y132.44 E.42236
G1 X133.545 Y132.98 E.01679
G1 X124.481 Y142.044 E.39864
G1 X125.02 Y142.044 E.01677
G1 X133.545 Y133.52 E.37491
G1 X133.545 Y134.059 E.01679
G1 X125.56 Y142.044 E.35118
G1 X126.099 Y142.045 E.01677
G1 X133.544 Y134.599 E.32746
G1 X133.544 Y135.139 E.01679
G1 X126.638 Y142.045 E.30373
G1 X127.178 Y142.046 E.01677
G1 X133.544 Y135.679 E.28
G1 X133.544 Y136.219 E.01679
G1 X127.717 Y142.046 E.25628
G1 X128.256 Y142.047 E.01677
G1 X133.544 Y136.759 E.23255
G1 X133.544 Y137.299 E.01679
G1 X128.795 Y142.047 E.20882
G1 X129.335 Y142.047 E.01677
G1 X133.543 Y137.839 E.1851
G1 X133.543 Y138.379 E.01679
G1 X129.874 Y142.048 E.16137
G1 X130.413 Y142.048 E.01677
G1 X133.543 Y138.919 E.13765
G1 X133.543 Y139.459 E.01679
G1 X130.953 Y142.049 E.11392
G1 X131.492 Y142.049 E.01677
G1 X133.543 Y139.998 E.09019
G1 X133.542 Y140.538 E.01679
G1 X132.031 Y142.05 E.06647
G1 X132.57 Y142.05 E.01677
G1 X133.542 Y141.078 E.04274
G1 X133.542 Y141.618 E.01679
G1 X132.94 Y142.22 E.02647
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9432.973
G1 X133.542 Y141.618 E-.32344
G1 X133.542 Y141.078 E-.20516
G1 X133.112 Y141.509 E-.2314
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/42
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z.8 I1.217 J.028 P1  F42000
G1 X133.751 Y113.609 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X133.81 Y113.636 E.00214
G1 X133.864 Y113.69 E.00255
G1 X133.898 Y113.815 E.00427
G1 X133.893 Y142.239 E.94288
G3 X133.702 Y142.397 I-.203 J-.051 E.00881
G1 X122.262 Y142.393 E.37951
G3 X122.102 Y142.178 I.045 J-.2 E.00969
G1 X122.107 Y113.761 E.94263
G3 X122.298 Y113.603 I.203 J.051 E.00881
G1 X133.691 Y113.609 E.37794
M204 S250
G1 X133.868 Y113.243 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X134.026 Y113.312 E.00529
G3 X134.29 Y113.805 I-.336 J.497 E.01788
G1 X134.29 Y142.195 E.87234
G3 X133.727 Y142.789 I-.602 J-.007 E.02767
G1 X122.305 Y142.79 E.35094
G3 X121.71 Y142.193 I.012 J-.607 E.02865
G1 X121.71 Y113.805 E.87226
G3 X122.273 Y113.211 I.608 J.012 E.02761
G1 X133.813 Y113.222 E.35457
; WIPE_START
M204 S6000
G1 X134.026 Y113.312 E-.08808
G1 X134.156 Y113.426 E-.06565
G1 X134.264 Y113.629 E-.08741
G1 X134.29 Y113.805 E-.06762
G1 X134.29 Y114.992 E-.45123
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
G1 X133.734 Y114.535 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X133.141 Y113.942 E.02575
G1 X132.608 Y113.942 E.01639
G1 X133.564 Y114.898 E.04156
G1 X133.564 Y115.431 E.01638
G1 X132.074 Y113.941 E.06473
G1 X131.541 Y113.941 E.01639
G1 X133.564 Y115.964 E.08791
G1 X133.564 Y116.497 E.01638
G1 X131.007 Y113.941 E.11108
G1 X130.474 Y113.941 E.01639
G1 X133.563 Y117.03 E.13426
G1 X133.563 Y117.563 E.01638
G1 X129.94 Y113.94 E.15743
G1 X129.407 Y113.94 E.01639
G1 X133.563 Y118.096 E.18061
G1 X133.563 Y118.629 E.01638
G1 X128.873 Y113.94 E.20378
G1 X128.34 Y113.939 E.01639
G1 X133.563 Y119.162 E.22696
G1 X133.562 Y119.696 E.01638
M73 P45 R8
G1 X127.806 Y113.939 E.25013
G1 X127.273 Y113.939 E.01639
G1 X133.562 Y120.229 E.27331
G1 X133.562 Y120.762 E.01638
G1 X126.739 Y113.939 E.29649
G1 X126.205 Y113.938 E.01639
G1 X133.562 Y121.295 E.31966
G1 X133.562 Y121.828 E.01638
G1 X125.672 Y113.938 E.34284
G1 X125.138 Y113.938 E.01639
G1 X133.561 Y122.361 E.36601
G1 X133.561 Y122.894 E.01638
G1 X124.605 Y113.938 E.38919
G1 X124.071 Y113.937 E.01639
G1 X133.561 Y123.427 E.41236
G1 X133.561 Y123.96 E.01638
G1 X123.538 Y113.937 E.43554
G1 X123.004 Y113.937 E.01639
G1 X133.561 Y124.493 E.45871
G1 X133.56 Y125.026 E.01638
G1 X122.471 Y113.936 E.48189
G1 X122.446 Y113.936 E.00076
G1 X122.446 Y114.445 E.01562
G1 X133.56 Y125.559 E.48296
G1 X133.56 Y126.092 E.01638
G1 X122.446 Y114.978 E.48296
G1 X122.445 Y115.511 E.01638
G1 X133.56 Y126.625 E.48296
G1 X133.56 Y127.158 E.01638
G1 X122.445 Y116.044 E.48296
G1 X122.445 Y116.577 E.01638
G1 X133.559 Y127.691 E.48296
G1 X133.559 Y128.224 E.01638
G1 X122.445 Y117.11 E.48296
G1 X122.445 Y117.643 E.01638
G1 X133.559 Y128.757 E.48296
G1 X133.559 Y129.291 E.01638
G1 X122.444 Y118.176 E.48296
G1 X122.444 Y118.709 E.01638
G1 X133.559 Y129.824 E.48296
G1 X133.558 Y130.357 E.01638
G1 X122.444 Y119.242 E.48296
G1 X122.444 Y119.775 E.01638
G1 X133.558 Y130.89 E.48296
G1 X133.558 Y131.423 E.01638
G1 X122.444 Y120.308 E.48296
G1 X122.443 Y120.841 E.01638
G1 X133.558 Y131.956 E.48296
G1 X133.558 Y132.489 E.01638
G1 X122.443 Y121.374 E.48296
G1 X122.443 Y121.908 E.01638
G1 X133.557 Y133.022 E.48296
G1 X133.557 Y133.555 E.01638
G1 X122.443 Y122.441 E.48296
G1 X122.443 Y122.974 E.01638
G1 X133.557 Y134.088 E.48296
G1 X133.557 Y134.621 E.01638
G1 X122.442 Y123.507 E.48296
G1 X122.442 Y124.04 E.01638
G1 X133.557 Y135.154 E.48296
G1 X133.556 Y135.687 E.01638
G1 X122.442 Y124.573 E.48296
G1 X122.442 Y125.106 E.01638
G1 X133.556 Y136.22 E.48296
G1 X133.556 Y136.753 E.01638
G1 X122.442 Y125.639 E.48296
G1 X122.441 Y126.172 E.01638
G1 X133.556 Y137.286 E.48296
G1 X133.556 Y137.819 E.01638
G1 X122.441 Y126.705 E.48296
G1 X122.441 Y127.238 E.01638
G1 X133.555 Y138.352 E.48296
G1 X133.555 Y138.885 E.01638
G1 X122.441 Y127.771 E.48296
G1 X122.441 Y128.304 E.01638
G1 X133.555 Y139.419 E.48296
G1 X133.555 Y139.952 E.01638
G1 X122.44 Y128.837 E.48296
G1 X122.44 Y129.37 E.01638
G1 X133.555 Y140.485 E.48296
G1 X133.554 Y141.018 E.01638
G1 X122.44 Y129.903 E.48296
G1 X122.44 Y130.436 E.01638
G1 X133.554 Y141.551 E.48296
G1 X133.554 Y142.064 E.01576
G1 X133.534 Y142.064 E.00062
G1 X122.44 Y130.969 E.48208
G1 X122.439 Y131.503 E.01638
G1 X133 Y142.063 E.45889
G1 X132.466 Y142.063 E.0164
G1 X122.439 Y132.036 E.43571
G1 X122.439 Y132.569 E.01638
G1 X131.932 Y142.062 E.41253
G1 X131.399 Y142.062 E.0164
G1 X122.439 Y133.102 E.38935
G1 X122.439 Y133.635 E.01638
G1 X130.865 Y142.061 E.36616
G1 X130.331 Y142.061 E.0164
G1 X122.438 Y134.168 E.34298
G1 X122.438 Y134.701 E.01638
G1 X129.798 Y142.06 E.3198
G1 X129.264 Y142.06 E.0164
G1 X122.438 Y135.234 E.29661
G1 X122.438 Y135.767 E.01638
G1 X128.73 Y142.059 E.27343
G1 X128.196 Y142.059 E.0164
G1 X122.438 Y136.3 E.25025
G1 X122.437 Y136.833 E.01638
G1 X127.663 Y142.058 E.22706
G1 X127.129 Y142.058 E.0164
G1 X122.437 Y137.366 E.20388
G1 X122.437 Y137.899 E.01638
G1 X126.595 Y142.058 E.1807
G1 X126.062 Y142.057 E.0164
G1 X122.437 Y138.432 E.15751
G1 X122.437 Y138.965 E.01638
G1 X125.528 Y142.057 E.13433
G1 X124.994 Y142.056 E.0164
G1 X122.436 Y139.498 E.11115
G1 X122.436 Y140.031 E.01638
G1 X124.46 Y142.056 E.08796
G1 X123.927 Y142.055 E.0164
G1 X122.436 Y140.564 E.06478
G1 X122.436 Y141.098 E.01638
G1 X123.393 Y142.055 E.0416
G1 X122.859 Y142.054 E.0164
G1 X122.266 Y141.461 E.02578
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X122.859 Y142.054 E-.31888
G1 X123.393 Y142.055 E-.20281
G1 X122.95 Y141.611 E-.23831
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/42
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z1 I1.135 J.438 P1  F42000
M73 P46 R8
G1 X133.751 Y113.609 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7590
M204 S6000
G1 X133.809 Y113.636 E.00213
G1 X133.864 Y113.69 E.00255
G1 X133.898 Y113.814 E.00424
G1 X133.898 Y127.322 E.44811
G1 X130.222 Y127.322 E.12193
G1 X130.222 Y141.678 E.4762
G1 X133.898 Y141.678 E.12193
G3 X133.893 Y142.238 I-2.827 J.258 E.01863
G3 X133.702 Y142.397 I-.208 J-.056 E.00878
G1 X122.262 Y142.393 E.37951
G3 X122.102 Y142.178 I.045 J-.2 E.0097
G1 X122.102 Y128.678 E.44782
G1 X125.778 Y128.678 E.12193
G1 X125.778 Y114.322 E.4762
G1 X122.102 Y114.322 E.12193
G3 X122.107 Y113.762 I2.845 J-.258 E.01862
G3 X122.298 Y113.603 I.208 J.056 E.00878
G1 X133.691 Y113.609 E.37795
M204 S250
G1 X133.848 Y113.235 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7590
M204 S5000
G1 X134.026 Y113.312 E.00598
G3 X134.29 Y113.804 I-.336 J.497 E.01785
G1 X134.29 Y142.195 E.87237
G3 X133.727 Y142.789 I-.609 J-.013 E.02761
G1 X122.305 Y142.79 E.35094
G3 X121.71 Y142.192 I.012 J-.607 E.02866
G1 X121.71 Y113.805 E.87224
G3 X122.273 Y113.211 I.609 J.013 E.0276
G1 X133.79 Y113.222 E.35387
; WIPE_START
G1 F9547.055
M204 S6000
G1 X134.026 Y113.312 E-.09597
G1 X134.156 Y113.426 E-.06572
G1 X134.264 Y113.629 E-.08738
G1 X134.29 Y113.804 E-.0672
G1 X134.29 Y114.972 E-.44373
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


G1 X127.811 Y115.657 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Top surface
G1 F7590
M204 S2000
G1 X128.307 Y115.161 E.02155
G1 X128.307 Y114.628
G1 X127.278 Y115.657 E.04472
G1 X126.745 Y115.657
G1 X128.307 Y114.095 E.06789
G1 X128.04 Y113.828
G1 X126.211 Y115.657 E.07946
G1 X126 Y115.335
G1 X127.507 Y113.828 E.06549
G1 X126.974 Y113.828
G1 X126 Y114.802 E.04233
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.974 Y113.828 E-.52346
G1 X127.507 Y113.828 E-.20253
G1 X127.444 Y113.891 E-.03401
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.326 Y115.482 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.145458
G1 F7590
M204 S6000
G1 X128.132 Y115.676 E.0023
; WIPE_START
G1 F15000
G1 X128.326 Y115.482 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.981 Y113.963 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.355051
G1 F7590
M204 S6000
G1 X122.306 Y113.963 E.09349
; WIPE_START
G1 F11533.64
G1 X124.306 Y113.963 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.605 Y121.484 Z1.2 F42000
G1 X126.126 Y124.498 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7590
M204 S6000
G1 X126.126 Y126.126 E.05401
G1 X127.12 Y127.12 E.04665
G1 X127.47 Y127.12 E.01161
G1 X127.47 Y126.261 E.0285
G1 X127.711 Y126.02 E.0113
G1 X129.98 Y126.02 E.07523
G1 X133.55 Y122.45 E.16748
G1 X133.55 Y125.874 E.11356
G1 X126.126 Y118.45 E.34826
G1 X126.126 Y122.198 E.12433
G1 X133.55 Y114.774 E.34826
G1 X133.55 Y118.198 E.11356
G1 X129.307 Y113.955 E.19904
G1 X128.529 Y113.955 E.02579
G1 X128.529 Y114.805 E.02823
; WIPE_START
G1 F8843.478
G1 X128.529 Y113.955 E-.32335
G1 X129.307 Y113.955 E-.29542
G1 X129.57 Y114.218 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.442 Y121.548 Z1.2 F42000
G1 X125.555 Y128.045 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F7590
M204 S2000
G1 X125.145 Y128.455 E.01783
G1 X124.612 Y128.455
G1 X125.555 Y127.512 E.041
G1 X125.507 Y127.027
G1 X124.078 Y128.455 E.06208
G1 X123.545 Y128.455
G1 X125.507 Y126.493 E.08525
G1 X125.507 Y125.96
G1 X123.012 Y128.455 E.10843
G1 X122.479 Y128.455
G1 X125.507 Y125.427 E.1316
G1 X125.507 Y124.894
G1 X121.945 Y128.455 E.15477
G1 X121.917 Y127.95
G1 X125.507 Y124.36 E.15599
G1 X125.507 Y123.827
G1 X121.917 Y127.417 E.15599
G1 X121.917 Y126.884
G1 X125.507 Y123.294 E.15599
G1 X125.507 Y122.761
G1 X121.917 Y126.35 E.15599
G1 X121.917 Y125.817
G1 X125.507 Y122.227 E.15599
G1 X125.507 Y121.694
G1 X121.917 Y125.284 E.15599
G1 X121.917 Y124.751
G1 X125.507 Y121.161 E.15599
G1 X125.507 Y120.628
G1 X121.917 Y124.217 E.15599
G1 X121.917 Y123.684
G1 X125.507 Y120.094 E.15599
G1 X125.507 Y119.561
G1 X121.917 Y123.151 E.15599
G1 X121.917 Y122.618
G1 X125.507 Y119.028 E.15599
G1 X125.507 Y118.495
G1 X121.917 Y122.084 E.15599
G1 X121.917 Y121.551
G1 X125.507 Y117.961 E.15599
G1 X125.507 Y117.428
G1 X121.917 Y121.018 E.15599
G1 X121.917 Y120.484
G1 X125.507 Y116.895 E.15599
G1 X125.507 Y116.361
G1 X121.917 Y119.951 E.15599
G1 X121.917 Y119.418
G1 X125.507 Y115.828 E.15599
G1 X125.555 Y115.247
G1 X121.917 Y118.885 E.15808
G1 X121.917 Y118.351
G1 X125.555 Y114.714 E.15808
G1 X125.191 Y114.545
G1 X121.917 Y117.818 E.14225
G1 X121.917 Y117.285
G1 X124.658 Y114.545 E.11908
G1 X124.124 Y114.545
G1 X121.917 Y116.752 E.0959
G1 X121.917 Y116.218
G1 X123.591 Y114.545 E.07273
G1 X123.058 Y114.545
G1 X121.917 Y115.685 E.04956
G1 X121.917 Y115.152
G1 X122.525 Y114.545 E.02639
; WIPE_START
G1 F9547.055
M204 S6000
G1 X121.917 Y115.152 E-.32631
G1 X121.917 Y115.685 E-.20264
G1 X122.347 Y115.255 E-.23105
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.379 Y122.26 Z1.2 F42000
G1 X128.307 Y129.026 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F7590
M204 S2000
G1 X127.576 Y129.757 E.03177
M204 S10000
G1 X130 Y127.866 F42000
G1 F7590
M204 S2000
G1 X129.209 Y128.657 E.03436
G1 X128.676 Y128.657
M73 P47 R8
G1 X130 Y127.333 E.05753
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.676 Y128.657 E-.71147
G1 X128.804 Y128.657 E-.04853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.9 Y127.1 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
G1 F7590
M204 S2000
G1 X133.676 Y126.324 E.03372
G1 X133.223 Y126.243
G1 X132.366 Y127.1 E.03724
G1 X131.833 Y127.1
G1 X132.69 Y126.243 E.03724
G1 X132.157 Y126.243
G1 X131.3 Y127.1 E.03724
G1 X130.766 Y127.1
G1 X131.623 Y126.243 E.03724
G1 X131.09 Y126.243
G1 X130.233 Y127.1 E.03724
G1 X130.557 Y126.243
G1 X127.043 Y129.757 E.15271
G1 X126.509 Y129.757
G1 X130.024 Y126.243 E.15271
G1 X129.49 Y126.243
G1 X125.976 Y129.757 E.15271
G1 X125.443 Y129.757
G1 X128.957 Y126.243 E.15271
G1 X128.424 Y126.243
G1 X127.693 Y126.974 E.03177
G1 X127.324 Y127.343
G1 X126 Y128.667 E.05752
G1 X126 Y128.133
G1 X126.791 Y127.343 E.03435
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126 Y128.133 E-.42482
G1 X126 Y128.667 E-.20264
G1 X126.247 Y128.42 E-.13254
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.767 Y128.9 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
G1 F7590
M204 S2000
G1 X124.91 Y129.757 E.03724
G1 X124.376 Y129.757
G1 X125.233 Y128.9 E.03724
G1 X124.7 Y128.9
G1 X123.843 Y129.757 E.03724
G1 X123.31 Y129.757
G1 X124.167 Y128.9 E.03724
G1 X123.634 Y128.9
G1 X122.777 Y129.757 E.03724
G1 X122.324 Y129.676
G1 X123.1 Y128.9 E.03372
; WIPE_START
G1 F9547.055
M204 S6000
G1 X122.324 Y129.676 E-.41697
G1 X122.777 Y129.757 E-.17457
G1 X123.09 Y129.444 E-.16845
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.113 Y128.779 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.101465
G1 F7590
M204 S6000
G1 X125.879 Y129.013 E.00158
; WIPE_START
G1 F15000
G1 X126.113 Y128.779 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.181 Y127.1 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.105286
G1 F7590
M204 S6000
G1 X130.05 Y127.076 E.00068
G1 X129.887 Y127.221 E.00111
; WIPE_START
G1 F15000
G1 X130.05 Y127.076 E-.47173
G1 X130.181 Y127.1 E-.28827
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.791 Y126.276 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.108028
G1 F7590
M204 S6000
G1 X130.609 Y126.243 E.00098
; WIPE_START
G1 F15000
G1 X130.791 Y126.276 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.874 Y131.502 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7590
M204 S6000
G1 X129.874 Y129.874 E.05401
G1 X128.88 Y128.88 E.04665
G1 X128.529 Y128.88 E.01161
G1 X128.529 Y129.739 E.0285
G1 X128.289 Y129.98 E.0113
G1 X126.02 Y129.98 E.07523
G1 X122.45 Y133.55 E.16748
G1 X122.45 Y130.126 E.11356
G1 X129.874 Y137.55 E.34826
G1 X129.874 Y133.802 E.12433
G1 X122.45 Y141.226 E.34826
G1 X122.45 Y137.802 E.11356
G1 X126.691 Y142.043 E.19893
G1 X127.47 Y142.043 E.02587
G1 X127.47 Y141.195 E.02815
; WIPE_START
G1 F8843.478
G1 X127.47 Y142.043 E-.32246
G1 X126.691 Y142.043 E-.2963
G1 X126.428 Y141.78 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130 Y141.198 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F7590
M204 S2000
G1 X129.027 Y142.171 E.04227
G1 X128.494 Y142.17
G1 X130 Y140.665 E.06542
G1 X129.788 Y140.343
G1 X127.962 Y142.17 E.07938
G1 X127.693 Y141.905
G1 X129.255 Y140.343 E.06789
G1 X128.722 Y140.343
G1 X127.693 Y141.372 E.04471
G1 X127.693 Y140.839
G1 X128.189 Y140.343 E.02154
M204 S10000
G1 X127.868 Y140.324 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.145375
G1 F7590
M204 S6000
G1 X127.674 Y140.518 E.00229
; WIPE_START
G1 F15000
G1 X127.868 Y140.324 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.019 Y142.038 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.355204
G1 F7590
M204 S6000
G1 X133.694 Y142.037 E.09353
M204 S10000
G1 X133.475 Y141.455 F42000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F7590
M204 S2000
G1 X134.083 Y140.848 E.02639
G1 X134.083 Y140.315
G1 X132.942 Y141.455 E.04956
G1 X132.409 Y141.455
G1 X134.083 Y139.781 E.07274
G1 X134.083 Y139.248
G1 X131.876 Y141.455 E.09591
G1 X131.342 Y141.455
G1 X134.083 Y138.715 E.11908
G1 X134.083 Y138.182
G1 X130.809 Y141.455 E.14225
G1 X130.445 Y141.286
G1 X134.083 Y137.648 E.15808
G1 X134.083 Y137.115
G1 X130.445 Y140.753 E.15808
G1 X130.493 Y140.172
G1 X134.083 Y136.582 E.15599
G1 X134.083 Y136.049
G1 X130.493 Y139.638 E.15599
G1 X130.493 Y139.105
G1 X134.083 Y135.515 E.15599
G1 X134.083 Y134.982
G1 X130.493 Y138.572 E.15599
G1 X130.493 Y138.039
G1 X134.083 Y134.449 E.15599
G1 X134.083 Y133.916
G1 X130.493 Y137.505 E.15599
G1 X130.493 Y136.972
G1 X134.083 Y133.382 E.15599
G1 X134.083 Y132.849
G1 X130.493 Y136.439 E.15599
G1 X130.493 Y135.906
G1 X134.083 Y132.316 E.15599
G1 X134.083 Y131.783
G1 X130.493 Y135.372 E.15599
G1 X130.493 Y134.839
G1 X134.083 Y131.249 E.15599
G1 X134.083 Y130.716
G1 X130.493 Y134.306 E.15599
G1 X130.493 Y133.773
G1 X134.083 Y130.183 E.15599
G1 X134.083 Y129.65
G1 X130.493 Y133.239 E.15599
G1 X130.493 Y132.706
G1 X134.083 Y129.116 E.15599
G1 X134.083 Y128.583
G1 X130.493 Y132.173 E.15599
G1 X130.493 Y131.64
G1 X134.083 Y128.05 E.15599
G1 X134.054 Y127.545
G1 X130.493 Y131.106 E.15477
G1 X130.493 Y130.573
G1 X133.521 Y127.545 E.13159
G1 X132.988 Y127.545
G1 X130.493 Y130.04 E.10842
G1 X130.493 Y129.506
G1 X132.455 Y127.545 E.08525
G1 X131.921 Y127.545
G1 X130.493 Y128.973 E.06208
G1 X130.445 Y128.488
G1 X131.388 Y127.545 E.041
G1 X130.855 Y127.545
G1 X130.445 Y127.955 E.01782
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.855 Y127.545 E-.22042
G1 X131.388 Y127.545 E-.20264
G1 X130.761 Y128.172 E-.33695
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/42
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z1.2 I.055 J-1.216 P1  F42000
G1 X128.29 Y128.06 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
G1 F4861
M204 S5000
G1 X128.29 Y126.84 E.03749
G1 X133.91 Y126.84 E.17269
G1 X133.91 Y128.06 E.03749
G1 X128.35 Y128.06 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.29 Y126.84 E-.46416
G1 X129.069 Y126.84 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.162 Y134.394 Z1.4 F42000
G1 X131.09 Y140.81 Z1.4
G1 Z1
G1 E.8 F1800
G1 F4861
M204 S5000
G1 X131.09 Y128.19 E.38778
G1 X134.06 Y128.19 E.09126
G1 X134.06 Y140.81 E.38778
G1 X131.15 Y140.81 E.08942
; WIPE_START
G1 F9547.055
M204 S6000
G1 X131.14 Y138.81 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.843 Y131.531 Z1.4 F42000
G1 X127.71 Y127.94 Z1.4
G1 Z1
G1 E.8 F1800
G1 F4861
M204 S5000
G1 X127.71 Y129.16 E.03749
G1 X122.09 Y129.16 E.17269
G1 X122.09 Y127.94 E.03749
G1 X127.65 Y127.94 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.71 Y129.16 E-.46416
G1 X126.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.91 Y127.81 Z1.4 F42000
G1 Z1
G1 E.8 F1800
G1 F4861
M204 S5000
G1 X121.94 Y127.81 E.09126
G1 X121.94 Y115.19 E.38778
G1 X124.91 Y115.19 E.09126
G1 X124.91 Y127.75 E.38593
; WIPE_START
G1 F9547.055
M204 S6000
G1 X122.91 Y127.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P48 R8
G1 X125.603 Y120.649 Z1.4 F42000
G1 X127.71 Y115.06 Z1.4
G1 Z1
G1 E.8 F1800
G1 F4861
M204 S5000
G1 X122.09 Y115.06 E.17269
G1 X122.09 Y113.84 E.03749
G1 X127.71 Y113.84 E.17269
G1 X127.71 Y115 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.228 Y113.701 Z1.4 F42000
G1 X133.751 Y113.609 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4861
M204 S6000
G1 X133.81 Y113.636 E.00213
G1 X133.864 Y113.69 E.00255
G1 X133.898 Y113.813 E.00421
G1 X133.898 Y126.448 E.41914
G1 X127.898 Y126.448 E.19903
G1 X127.898 Y127.548 E.03649
G1 X125.302 Y127.548 E.08611
G1 X125.302 Y115.452 E.40124
M73 P48 R7
G1 X128.102 Y115.452 E.09288
G1 X128.102 Y113.603 E.06134
G1 X133.691 Y113.609 E.1854
; WIPE_START
G1 F8843.478
G1 X133.81 Y113.636 E-.04612
G1 X133.864 Y113.69 E-.02919
G1 X133.898 Y113.813 E-.04817
G1 X133.898 Y115.488 E-.63651
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.931 Y123.059 Z1.4 F42000
G1 X130.698 Y140.548 Z1.4
G1 Z1
G1 E.8 F1800
G1 F4861
M204 S6000
G1 X127.898 Y140.548 E.09288
G1 X127.898 Y142.397 E.06135
G1 X122.262 Y142.393 E.18696
G3 X122.102 Y142.178 I.045 J-.2 E.00971
G1 X122.102 Y129.552 E.41881
G1 X128.102 Y129.552 E.19903
G1 X128.102 Y128.452 E.03649
G1 X130.698 Y128.452 E.08611
G1 X130.698 Y140.488 E.39925
; WIPE_START
G1 F8843.478
G1 X128.698 Y140.531 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.29 Y140.94 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4861
M204 S5000
G1 X133.91 Y140.94 E.17269
G1 X133.91 Y142.16 E.03749
G1 X128.29 Y142.16 E.17269
G1 X128.29 Y141 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.255 Y133.407 Z1.4 F42000
G1 X133.827 Y113.226 Z1.4
G1 Z1
G1 E.8 F1800
G1 F4861
M204 S5000
G1 X134.026 Y113.312 E.00667
G3 X134.29 Y113.803 I-.336 J.497 E.01781
G1 X134.29 Y142.195 E.87241
G3 X133.726 Y142.789 I-.602 J-.007 E.02768
G1 X122.305 Y142.79 E.35093
G3 X121.71 Y142.192 I.012 J-.607 E.02866
G1 X121.71 Y113.805 E.87225
G3 X122.274 Y113.211 I.608 J.012 E.02761
G1 X133.768 Y113.222 E.35318
; WIPE_START
G1 F9547.055
M204 S6000
G1 X134.026 Y113.312 E-.10398
G1 X134.156 Y113.426 E-.06566
G1 X134.264 Y113.629 E-.0874
G1 X134.29 Y113.803 E-.06679
G1 X134.29 Y114.95 E-.43618
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


G1 X128.45 Y114.726 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4861
M204 S6000
G1 X128.45 Y113.952 E.02568
G1 X129.304 Y113.953 E.02833
G1 X133.55 Y118.198 E.19915
G1 X133.55 Y114.774 E.11356
G1 X126.205 Y122.119 E.34454
G1 X126.205 Y118.529 E.11907
G1 X133.55 Y125.874 E.34454
G1 X133.55 Y122.45 E.11356
G1 X129.9 Y126.1 E.1712
G1 X127.55 Y126.1 E.07798
G1 X127.55 Y127.2 E.03649
G1 X127.2 Y127.2 E.01161
G1 X126.205 Y126.205 E.04665
G1 X126.205 Y124.577 E.05401
M204 S10000
G1 X125.754 Y127.096 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.53922
G1 F4861
M204 S6000
G1 X125.754 Y115.964 E.45022
; WIPE_START
G1 F7253.678
G1 X125.754 Y117.964 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.906 Y113.525 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279428
G1 F4861
M204 S6000
G1 X122.293 Y113.525 E.10817
G2 X122.138 Y113.549 I.059 J.898 E.00303
; LINE_WIDTH: 0.215056
G1 X122.089 Y113.566 E.00073
; LINE_WIDTH: 0.177456
G1 X121.949 Y113.626 E.00167
; WIPE_START
G1 F15000
G1 X122.089 Y113.566 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.026 Y120.611 Z1.4 F42000
G1 X128 Y127.744 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.23088
G1 F4861
M204 S6000
G1 X128 Y128.256 E.00784
; WIPE_START
G1 F15000
G1 X128 Y127.744 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.366 Y135.253 Z1.4 F42000
G1 X130.246 Y140.096 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.5392
G1 F4861
M204 S6000
G1 X130.246 Y128.964 E.45021
M204 S10000
G1 X127.55 Y141.273 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4861
M204 S6000
G1 X127.55 Y142.049 E.02574
G1 X126.697 Y142.049 E.02827
G1 X122.45 Y137.802 E.19924
G1 X122.45 Y141.226 E.11356
G1 X129.795 Y133.881 E.34454
G1 X129.795 Y137.471 E.11907
G1 X122.45 Y130.126 E.34454
G1 X122.45 Y133.55 E.11356
G1 X126.1 Y129.9 E.1712
G1 X128.45 Y129.9 E.07798
G1 X128.45 Y128.8 E.03649
G1 X128.8 Y128.8 E.01161
G1 X129.795 Y129.795 E.04665
G1 X129.795 Y131.423 E.05401
; WIPE_START
G1 F8843.478
G1 X129.795 Y129.795 E-.61876
G1 X129.532 Y129.532 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.689 Y137.118 Z1.4 F42000
G1 X128.094 Y142.475 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280021
G1 F4861
M204 S6000
G1 X133.707 Y142.475 E.10844
G2 X133.795 Y142.466 I-.013 J-.604 E.00171
; LINE_WIDTH: 0.236046
G2 X134.039 Y142.399 I-.334 J-1.684 E.00398
M204 S10000
G1 X134.052 Y142.373 F42000
; LINE_WIDTH: 0.171761
G1 F4861
M204 S6000
G1 X133.554 Y142.593 E.00571
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X134.052 Y142.373 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/42
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z1.4 I1.141 J-.423 P1  F42000
G1 X128.29 Y126.84 Z1.4
G1 Z1.2
M73 P49 R7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4871
M204 S5000
G1 X133.91 Y126.84 E.17269
G1 X133.91 Y128.06 E.03749
G1 X128.29 Y128.06 E.17269
G1 X128.29 Y126.9 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.728 Y134.499 Z1.6 F42000
G1 X131.09 Y140.81 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F4871
M204 S5000
G1 X131.09 Y128.19 E.38778
G1 X134.06 Y128.19 E.09126
G1 X134.06 Y140.81 E.38778
G1 X131.15 Y140.81 E.08942
; WIPE_START
G1 F9547.055
M204 S6000
G1 X131.14 Y138.81 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.843 Y131.531 Z1.6 F42000
G1 X127.71 Y127.94 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F4871
M204 S5000
G1 X127.71 Y129.16 E.03749
G1 X122.09 Y129.16 E.17269
G1 X122.09 Y127.94 E.03749
G1 X127.65 Y127.94 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.71 Y129.16 E-.46416
G1 X126.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.91 Y127.81 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
G1 F4871
M204 S5000
G1 X121.94 Y127.81 E.09126
G1 X121.94 Y115.19 E.38778
G1 X124.91 Y115.19 E.09126
G1 X124.91 Y127.75 E.38593
; WIPE_START
G1 F9547.055
M204 S6000
G1 X122.91 Y127.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.603 Y120.649 Z1.6 F42000
G1 X127.71 Y115.06 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F4871
M204 S5000
G1 X122.09 Y115.06 E.17269
G1 X122.09 Y113.84 E.03749
G1 X127.71 Y113.84 E.17269
G1 X127.71 Y115 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.228 Y113.701 Z1.6 F42000
G1 X133.751 Y113.609 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4871
M204 S6000
G1 X133.81 Y113.636 E.00213
G1 X133.864 Y113.69 E.00255
G1 X133.898 Y113.812 E.00417
G1 X133.898 Y126.448 E.41917
G1 X127.898 Y126.448 E.19903
G1 X127.898 Y127.548 E.03649
G1 X125.302 Y127.548 E.08611
G1 X125.302 Y115.452 E.40124
G1 X128.102 Y115.452 E.09288
G1 X128.102 Y113.603 E.06134
G1 X133.691 Y113.609 E.18541
; WIPE_START
G1 F8843.478
G1 X133.81 Y113.636 E-.04614
G1 X133.864 Y113.69 E-.0292
G1 X133.898 Y113.812 E-.04776
G1 X133.898 Y115.488 E-.6369
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.931 Y123.059 Z1.6 F42000
G1 X130.698 Y140.548 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F4871
M204 S6000
G1 X127.898 Y140.548 E.09288
G1 X127.898 Y142.397 E.06135
G1 X122.262 Y142.393 E.18697
G3 X122.102 Y142.178 I.045 J-.2 E.0097
G1 X122.102 Y129.552 E.41881
G1 X128.102 Y129.552 E.19903
G1 X128.102 Y128.452 E.03649
G1 X130.698 Y128.452 E.08611
G1 X130.698 Y140.488 E.39925
; WIPE_START
G1 F8843.478
G1 X128.698 Y140.531 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.29 Y140.94 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4871
M204 S5000
G1 X133.91 Y140.94 E.17269
G1 X133.91 Y142.16 E.03749
G1 X128.29 Y142.16 E.17269
G1 X128.29 Y141 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.251 Y133.407 Z1.6 F42000
G1 X133.815 Y113.222 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F4871
M204 S5000
G1 X133.818 Y113.222 E.0001
G3 X134.29 Y113.802 I-.128 J.586 E.0248
G1 X134.29 Y142.195 E.87243
G3 X133.726 Y142.789 I-.609 J-.013 E.02761
G1 X122.305 Y142.79 E.35094
G3 X121.71 Y142.192 I.012 J-.607 E.02866
G1 X121.71 Y113.805 E.87224
G3 X122.274 Y113.211 I.603 J.007 E.02767
G1 X133.755 Y113.222 E.35278
; WIPE_START
G1 F9547.055
M204 S6000
G1 X133.818 Y113.222 E-.02402
G1 X134.028 Y113.31 E-.08638
G1 X134.156 Y113.426 E-.06576
G1 X134.264 Y113.629 E-.08742
G1 X134.29 Y113.802 E-.06646
G1 X134.29 Y114.933 E-.42997
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


G1 X127.906 Y113.525 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279619
G1 F4871
M204 S6000
G1 X122.293 Y113.525 E.10826
G2 X122.163 Y113.543 I.021 J.653 E.00254
; LINE_WIDTH: 0.232374
G1 X122.119 Y113.556 E.0007
; LINE_WIDTH: 0.202528
G1 X121.955 Y113.616 E.00227
; WIPE_START
G1 F15000
G1 X122.119 Y113.556 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.772 Y120.712 Z1.6 F42000
G1 X126.205 Y124.577 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4871
M204 S6000
G1 X126.205 Y126.205 E.05401
G1 X127.2 Y127.2 E.04665
G1 X127.55 Y127.2 E.01161
G1 X127.55 Y126.1 E.03649
G1 X129.9 Y126.1 E.07798
G1 X133.55 Y122.45 E.1712
G1 X133.55 Y125.874 E.11356
G1 X126.205 Y118.529 E.34454
G1 X126.205 Y122.119 E.11907
G1 X133.55 Y114.774 E.34454
G1 X133.55 Y118.198 E.11355
G1 X129.304 Y113.953 E.19915
G1 X128.45 Y113.952 E.02833
G1 X128.45 Y114.726 E.02568
M204 S10000
G1 X125.754 Y127.096 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.53922
G1 F4871
M204 S6000
G1 X125.754 Y115.964 E.45022
; WIPE_START
G1 F7253.678
G1 X125.754 Y117.964 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.462 Y125.403 Z1.6 F42000
G1 X128 Y127.744 Z1.6
G1 Z1.2
M73 P50 R7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
G1 F4871
M204 S6000
G1 X128 Y128.256 E.00784
; WIPE_START
G1 F15000
G1 X128 Y127.744 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.795 Y131.423 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4871
M204 S6000
G1 X129.795 Y129.795 E.05401
G1 X128.8 Y128.8 E.04665
G1 X128.45 Y128.8 E.01161
G1 X128.45 Y129.9 E.03649
G1 X126.1 Y129.9 E.07798
G1 X122.45 Y133.55 E.1712
G1 X122.45 Y130.126 E.11356
G1 X129.795 Y137.471 E.34454
G1 X129.795 Y133.881 E.11907
G1 X122.45 Y141.226 E.34454
G1 X122.45 Y137.802 E.11356
G1 X126.697 Y142.049 E.19924
G1 X127.55 Y142.049 E.02827
G1 X127.55 Y141.273 E.02574
; WIPE_START
G1 F8843.478
G1 X127.55 Y142.049 E-.2949
G1 X126.697 Y142.049 E-.32387
G1 X126.435 Y141.786 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.094 Y142.475 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.28002
G1 F4871
M204 S6000
G1 X133.707 Y142.475 E.10845
G2 X133.795 Y142.466 I-.013 J-.602 E.00171
; LINE_WIDTH: 0.242843
G2 X133.881 Y142.444 I-.104 J-.597 E.00145
; LINE_WIDTH: 0.202565
G1 X133.927 Y142.427 E.00064
; LINE_WIDTH: 0.163068
G1 X134.058 Y142.368 E.0014
; WIPE_START
G1 F15000
G1 X133.927 Y142.427 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.246 Y140.096 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.5392
G1 F4871
M204 S6000
G1 X130.246 Y128.964 E.45021
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7253.969
G1 X130.246 Y130.964 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/42
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z1.6 I1.1 J-.522 P1  F42000
G1 X128.29 Y126.84 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4609
M204 S5000
G1 X133.91 Y126.84 E.17269
G1 X133.91 Y128.06 E.03749
G1 X128.29 Y128.06 E.17269
G1 X128.29 Y126.9 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.728 Y134.499 Z1.8 F42000
G1 X131.09 Y140.81 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F4609
M204 S5000
G1 X131.09 Y128.19 E.38778
G1 X134.06 Y128.19 E.09126
G1 X134.06 Y140.81 E.38778
G1 X131.15 Y140.81 E.08942
; WIPE_START
G1 F9547.055
M204 S6000
G1 X131.14 Y138.81 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.843 Y131.531 Z1.8 F42000
G1 X127.71 Y127.94 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F4609
M204 S5000
G1 X127.71 Y129.16 E.03749
G1 X122.09 Y129.16 E.17269
G1 X122.09 Y127.94 E.03749
G1 X127.65 Y127.94 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.71 Y129.16 E-.46416
G1 X126.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.91 Y127.81 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
G1 F4609
M204 S5000
G1 X121.94 Y127.81 E.09126
G1 X121.94 Y115.19 E.38778
G1 X124.91 Y115.19 E.09126
G1 X124.91 Y127.75 E.38593
; WIPE_START
G1 F9547.055
M204 S6000
G1 X122.91 Y127.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.603 Y120.649 Z1.8 F42000
G1 X127.71 Y115.06 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F4609
M204 S5000
G1 X122.09 Y115.06 E.17269
G1 X122.09 Y113.84 E.03749
G1 X127.71 Y113.84 E.17269
G1 X127.71 Y115 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.228 Y113.701 Z1.8 F42000
G1 X133.752 Y113.609 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4609
M204 S6000
G1 X133.81 Y113.636 E.00212
G1 X133.864 Y113.691 E.00256
G1 X133.898 Y113.811 E.00414
G1 X133.898 Y126.448 E.4192
G1 X127.898 Y126.448 E.19903
G1 X127.898 Y127.548 E.03649
G1 X125.302 Y127.548 E.08611
G1 X125.302 Y115.452 E.40124
G1 X128.102 Y115.452 E.09288
G1 X128.102 Y113.603 E.06134
G1 X133.692 Y113.609 E.18541
; WIPE_START
G1 F8843.478
G1 X133.81 Y113.636 E-.046
G1 X133.864 Y113.691 E-.02929
G1 X133.898 Y113.811 E-.04745
G1 X133.898 Y115.488 E-.63726
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.931 Y123.059 Z1.8 F42000
G1 X130.698 Y140.548 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F4609
M204 S6000
G1 X127.898 Y140.548 E.09288
G1 X127.898 Y142.397 E.06135
G1 X122.262 Y142.393 E.18697
G3 X122.102 Y142.178 I.045 J-.2 E.0097
G1 X122.102 Y129.552 E.41881
G1 X128.102 Y129.552 E.19903
G1 X128.102 Y128.452 E.03649
G1 X130.698 Y128.452 E.08611
G1 X130.698 Y140.488 E.39925
; WIPE_START
G1 F8843.478
G1 X128.698 Y140.531 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.29 Y140.94 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4609
M204 S5000
G1 X133.91 Y140.94 E.17269
G1 X133.91 Y142.16 E.03749
G1 X128.29 Y142.16 E.17269
G1 X128.29 Y141 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.249 Y133.407 Z1.8 F42000
G1 X133.806 Y113.222 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F4609
M204 S5000
G1 X133.818 Y113.222 E.00036
G3 X134.29 Y113.801 I-.128 J.586 E.02476
G1 X134.29 Y142.195 E.87247
G3 X133.726 Y142.789 I-.608 J-.012 E.02762
G1 X122.305 Y142.79 E.35093
G3 X121.71 Y142.192 I.012 J-.607 E.02866
G1 X121.71 Y113.805 E.87224
G3 X122.274 Y113.211 I.608 J.012 E.02762
G1 X133.746 Y113.222 E.35252
; WIPE_START
G1 F9547.055
M204 S6000
G1 X133.818 Y113.222 E-.02725
G1 X134.028 Y113.31 E-.08631
G1 X134.156 Y113.426 E-.06572
G1 X134.245 Y113.575 E-.06588
G1 X134.29 Y113.801 E-.08762
G1 X134.29 Y114.925 E-.42721
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


G1 X127.906 Y113.525 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279426
G1 F4609
M204 S6000
G1 X122.293 Y113.525 E.10817
G2 X122.136 Y113.55 I.057 J.883 E.00306
; LINE_WIDTH: 0.214714
G1 X122.089 Y113.566 E.00071
; LINE_WIDTH: 0.177636
G1 X121.949 Y113.626 E.00167
; WIPE_START
G1 F15000
G1 X122.089 Y113.566 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.65 Y116.346 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4609
M204 S6000
G1 X125.65 Y117.974 E.05401
G1 X133.55 Y125.874 E.37058
G1 X133.55 Y122.45 E.11356
G1 X129.9 Y126.1 E.17121
G1 X127.55 Y126.1 E.07797
G1 X127.55 Y127.2 E.03649
G1 X127.2 Y127.2 E.01161
G1 X125.65 Y125.65 E.07269
G1 X125.65 Y122.674 E.09873
G1 X133.55 Y114.774 E.37058
G1 X133.55 Y118.198 E.11356
G1 X129.304 Y113.952 E.19916
G1 X128.45 Y113.952 E.02833
G1 X128.45 Y114.726 E.02568
; WIPE_START
G1 F8843.478
G1 X128.45 Y113.952 E-.29419
G1 X129.304 Y113.952 E-.32457
M73 P51 R7
G1 X129.567 Y114.215 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.689 Y121.797 Z1.8 F42000
G1 X128 Y127.744 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
G1 F4609
M204 S6000
G1 X128 Y128.256 E.00784
; WIPE_START
G1 F15000
G1 X128 Y127.744 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.477 Y135.232 Z1.8 F42000
G1 X130.35 Y139.654 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4609
M204 S6000
G1 X130.35 Y138.026 E.05401
G1 X122.45 Y130.126 E.37058
G1 X122.45 Y133.55 E.11357
G1 X126.1 Y129.9 E.17121
G1 X128.45 Y129.9 E.07797
G1 X128.45 Y128.8 E.03649
G1 X128.8 Y128.8 E.01161
G1 X130.35 Y130.35 E.07269
G1 X130.35 Y133.326 E.09873
G1 X122.45 Y141.226 E.37058
G1 X122.45 Y137.802 E.11357
G1 X126.697 Y142.049 E.19925
G1 X127.55 Y142.049 E.02827
G1 X127.55 Y141.273 E.02574
; WIPE_START
G1 F8843.478
G1 X127.55 Y142.049 E-.2949
G1 X126.697 Y142.049 E-.32387
G1 X126.435 Y141.787 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.094 Y142.475 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280104
G1 F4609
M204 S6000
G1 X133.755 Y142.472 E.1094
; LINE_WIDTH: 0.254843
G1 X133.867 Y142.449 E.00197
; LINE_WIDTH: 0.213451
G1 X133.912 Y142.434 E.00066
; LINE_WIDTH: 0.177345
G1 X134.051 Y142.374 E.00166
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X133.912 Y142.434 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/42
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z1.8 I1.145 J-.413 P1  F42000
G1 X128.29 Y126.84 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3978
M204 S5000
G1 X133.91 Y126.84 E.17269
G1 X133.91 Y128.06 E.03749
G1 X128.29 Y128.06 E.17269
G1 X128.29 Y126.9 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.71 Y127.94 Z2 F42000
G1 Z1.6
G1 E.8 F1800
G1 F3978
M204 S5000
G1 X127.71 Y129.16 E.03749
G1 X122.09 Y129.16 E.17269
G1 X122.09 Y127.94 E.03749
G1 X127.65 Y127.94 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.71 Y129.16 E-.46416
G1 X126.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.352 Y121.539 Z2 F42000
G1 X127.71 Y115.06 Z2
G1 Z1.6
G1 E.8 F1800
G1 F3978
M204 S5000
G1 X122.09 Y115.06 E.17269
G1 X122.09 Y113.84 E.03749
G1 X127.71 Y113.84 E.17269
G1 X127.71 Y115 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.51 Y122.651 Z2 F42000
G1 X125.382 Y127.548 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3978
M204 S6000
G1 X125.302 Y127.548 E.00264
G1 X125.302 Y115.452 E.40124
G1 X128.102 Y115.452 E.09288
G1 X128.102 Y113.603 E.06134
G1 X133.752 Y113.609 E.1874
G1 X133.81 Y113.636 E.00212
G1 X133.864 Y113.691 E.00256
G3 X133.897 Y113.79 I-.224 J.129 E.00351
G1 X133.898 Y126.448 E.41987
G1 X127.898 Y126.448 E.19903
G1 X127.898 Y127.548 E.03649
G1 X125.442 Y127.548 E.08148
; WIPE_START
G1 F8843.478
G1 X125.302 Y127.548 E-.05301
G1 X125.302 Y125.687 E-.70699
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.652 Y129.552 Z2 F42000
G1 Z1.6
G1 E.8 F1800
G1 F3978
M204 S6000
G1 X128.102 Y129.552 E.0481
G1 X128.102 Y128.452 E.03649
G1 X130.698 Y128.452 E.08611
G1 X130.698 Y140.548 E.40124
G1 X127.898 Y140.548 E.09288
G1 X127.898 Y142.397 E.06135
G1 X122.262 Y142.393 E.18697
G3 X122.103 Y142.202 I.056 J-.207 E.00879
G1 X122.102 Y129.552 E.41963
G1 X126.592 Y129.552 E.14894
; WIPE_START
G1 F8843.478
G1 X128.102 Y129.552 E-.5738
G1 X128.102 Y129.062 E-.1862
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.223 Y136.694 Z2 F42000
G1 X128.29 Y140.94 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3978
M204 S5000
G1 X133.91 Y140.94 E.17269
G1 X133.91 Y142.16 E.03749
G1 X128.29 Y142.16 E.17269
G1 X128.29 Y141 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.403 Y133.913 Z2 F42000
G1 X124.91 Y127.81 Z2
G1 Z1.6
G1 E.8 F1800
G1 F3978
M204 S5000
G1 X124.91 Y115.19 E.38778
G1 X121.94 Y115.19 E.09126
G1 X121.94 Y115.665 E.0146
G1 X121.71 Y115.665 E.00706
G1 X121.711 Y113.774 E.05811
G3 X122.274 Y113.211 I.594 J.031 E.02679
G1 X133.818 Y113.222 E.35473
G3 X134.289 Y113.771 I-.12 J.58 E.0239
G1 X134.29 Y128.665 E.45765
G1 X134.06 Y128.665 E.00707
G1 X134.06 Y128.19 E.0146
G1 X131.09 Y128.19 E.09126
G1 X131.09 Y140.81 E.38778
G1 X134.06 Y140.81 E.09126
G1 X134.06 Y140.335 E.0146
G1 X134.29 Y140.335 E.00706
G1 X134.289 Y142.229 E.05819
G3 X133.726 Y142.789 I-.594 J-.034 E.02671
G1 X122.305 Y142.79 E.35093
G3 X121.711 Y142.226 I.013 J-.608 E.02761
G1 X121.71 Y127.335 E.45757
G1 X121.94 Y127.335 E.00707
G1 X121.94 Y127.81 E.0146
G1 X124.85 Y127.81 E.08942
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.859 Y125.81 E-.76
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


G1 X128 Y127.744 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
G1 F3978
M204 S6000
G1 X128 Y128.256 E.00784
; WIPE_START
G1 F15000
G1 X128 Y127.744 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.746 Y135.372 Z2 F42000
G1 X127.55 Y141.273 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3978
M204 S6000
G1 X127.55 Y142.049 E.02574
G1 X126.697 Y142.049 E.02827
G1 X122.451 Y137.803 E.19922
G1 X122.451 Y141.225 E.11351
G1 X130.35 Y133.326 E.37054
G1 X130.35 Y130.35 E.09873
G1 X128.8 Y128.8 E.07269
G1 X128.45 Y128.8 E.01161
G1 X128.45 Y129.9 E.03649
M73 P52 R7
G1 X126.1 Y129.9 E.07797
G1 X122.451 Y133.549 E.17119
G1 X122.45 Y130.126 E.11355
G1 X130.35 Y138.026 E.37058
G1 X130.35 Y139.654 E.05401
; WIPE_START
G1 F8843.478
G1 X130.35 Y138.026 E-.61876
G1 X130.087 Y137.763 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.094 Y142.475 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.278372
G1 F3978
M204 S6000
G1 X133.707 Y142.475 E.10769
G2 X134.037 Y142.402 I-.1 J-1.248 E.0065
M204 S10000
G1 X134.051 Y142.374 F42000
; LINE_WIDTH: 0.177457
G1 F3978
M204 S6000
G1 X133.54 Y142.593 E.0061
; WIPE_START
G1 F15000
G1 X134.051 Y142.374 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.536 Y134.893 Z2 F42000
G1 X128.45 Y114.726 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3978
M204 S6000
G1 X128.45 Y113.951 E.02568
G1 X129.304 Y113.952 E.02833
G1 X133.549 Y118.197 E.19913
G1 X133.549 Y114.775 E.11351
G1 X125.65 Y122.674 E.37054
G1 X125.65 Y125.65 E.09873
G1 X127.2 Y127.2 E.07269
G1 X127.55 Y127.2 E.01161
G1 X127.55 Y126.1 E.03649
G1 X129.9 Y126.1 E.07797
G1 X133.549 Y122.451 E.17119
G1 X133.55 Y125.874 E.11355
G1 X125.65 Y117.974 E.37058
G1 X125.65 Y116.346 E.05401
; WIPE_START
G1 F8843.478
G1 X125.65 Y117.974 E-.61876
G1 X125.913 Y118.237 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.906 Y113.525 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279629
G1 F3978
M204 S6000
G1 X122.293 Y113.525 E.10826
G2 X122.163 Y113.543 I.021 J.656 E.00254
; LINE_WIDTH: 0.223432
G1 X122.09 Y113.566 E.00111
; LINE_WIDTH: 0.178603
G1 X121.949 Y113.626 E.0017
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X122.09 Y113.566 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/42
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z2 I-1.103 J.515 P1  F42000
G1 X128.29 Y126.84 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4832
M204 S5000
G1 X133.91 Y126.84 E.17269
G1 X133.91 Y128.06 E.03749
G1 X128.29 Y128.06 E.17269
G1 X128.29 Y126.9 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.71 Y127.94 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
G1 F4832
M204 S5000
G1 X127.71 Y129.16 E.03749
G1 X122.09 Y129.16 E.17269
G1 X122.09 Y127.94 E.03749
G1 X127.65 Y127.94 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.71 Y129.16 E-.46416
G1 X126.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.352 Y121.539 Z2.2 F42000
G1 X127.71 Y115.06 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F4832
M204 S5000
G1 X122.09 Y115.06 E.17269
G1 X122.09 Y113.84 E.03749
G1 X127.71 Y113.84 E.17269
G1 X127.71 Y115 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.51 Y122.651 Z2.2 F42000
G1 X125.382 Y127.548 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4832
M204 S6000
G1 X125.302 Y127.548 E.00264
G1 X125.302 Y115.452 E.40124
G1 X128.102 Y115.452 E.09288
G1 X128.102 Y113.603 E.06134
G1 X133.752 Y113.609 E.18741
G1 X133.81 Y113.636 E.00211
G1 X133.864 Y113.69 E.00255
G3 X133.897 Y113.79 I-.225 J.13 E.00352
G1 X133.898 Y126.448 E.41988
G1 X127.898 Y126.448 E.19903
G1 X127.898 Y127.548 E.03649
G1 X125.442 Y127.548 E.08148
; WIPE_START
G1 F8843.478
G1 X125.302 Y127.548 E-.05301
G1 X125.302 Y125.687 E-.70699
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.652 Y129.552 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
G1 F4832
M204 S6000
G1 X128.102 Y129.552 E.0481
G1 X128.102 Y128.452 E.03649
G1 X130.698 Y128.452 E.08611
G1 X130.698 Y140.548 E.40124
G1 X127.898 Y140.548 E.09288
G1 X127.898 Y142.397 E.06135
G1 X122.243 Y142.389 E.18759
G3 X122.103 Y142.202 I.07 J-.198 E.00819
G1 X122.102 Y129.552 E.41963
G1 X126.592 Y129.552 E.14894
; WIPE_START
G1 F8843.478
G1 X128.102 Y129.552 E-.5738
G1 X128.102 Y129.062 E-.1862
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.223 Y136.694 Z2.2 F42000
G1 X128.29 Y140.94 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4832
M204 S5000
G1 X133.91 Y140.94 E.17269
G1 X133.91 Y142.16 E.03749
G1 X128.29 Y142.16 E.17269
G1 X128.29 Y141 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.403 Y133.913 Z2.2 F42000
G1 X124.91 Y127.81 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F4832
M204 S5000
G1 X124.91 Y115.19 E.38778
G1 X121.94 Y115.19 E.09126
G1 X121.94 Y115.665 E.0146
G1 X121.71 Y115.665 E.00706
G1 X121.711 Y113.774 E.0581
G3 X122.274 Y113.211 I.594 J.031 E.0268
G1 X133.818 Y113.222 E.35473
G3 X134.289 Y113.771 I-.12 J.58 E.0239
G1 X134.29 Y128.665 E.45765
G1 X134.06 Y128.665 E.00707
G1 X134.06 Y128.19 E.0146
G1 X131.09 Y128.19 E.09126
G1 X131.09 Y140.81 E.38778
G1 X134.06 Y140.81 E.09126
G1 X134.06 Y140.335 E.0146
G1 X134.29 Y140.335 E.00706
G1 X134.289 Y142.226 E.05811
G3 X133.726 Y142.789 I-.594 J-.031 E.02678
G1 X122.305 Y142.79 E.35094
G3 X121.711 Y142.226 I.013 J-.609 E.02761
G1 X121.71 Y127.335 E.45757
G1 X121.94 Y127.335 E.00707
G1 X121.94 Y127.81 E.0146
G1 X124.85 Y127.81 E.08942
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.859 Y125.81 E-.76
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


G1 X125.665 Y126.625 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.383501
G1 F4832
M204 S6000
G1 X125.665 Y115.974 E.29558
G1 X125.692 Y115.842 E.00374
G1 X125.824 Y115.815 E.00374
G1 X128.306 Y115.815 E.06887
G1 X128.437 Y115.787 E.00374
M73 P53 R7
G1 X128.465 Y115.656 E.00374
G1 X128.465 Y114.126 E.04246
G1 X128.492 Y113.994 E.00374
G1 X128.624 Y113.966 E.00374
G1 X133.375 Y113.972 E.13185
G1 X133.507 Y113.999 E.00374
G1 X133.534 Y114.131 E.00374
G1 X133.535 Y124.369 E.28415
M204 S10000
G1 X133.172 Y121.2 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4832
M204 S6000
G1 X133.172 Y122.828 E.05401
G1 X130.277 Y125.722 E.13579
G1 X133.042 Y125.722 E.0917
G1 X132.665 Y126.1 E.01769
G1 X133.55 Y126.1 E.02935
G1 X133.549 Y125.874 E.0075
G1 X126.027 Y118.352 E.35287
G1 X126.027 Y116.177 E.07212
G1 X128.827 Y116.177 E.09288
G1 X128.827 Y114.329 E.06131
G1 X129.682 Y114.33 E.02835
G1 X133.172 Y117.82 E.16371
G1 X133.172 Y115.152 E.08848
G1 X126.027 Y122.297 E.33515
G1 X126.027 Y126.027 E.12376
G1 X126.822 Y126.822 E.0373
G1 X127.173 Y126.822 E.01161
G1 X127.173 Y125.722 E.03649
G1 X127.351 Y125.722 E.00591
M204 S10000
G1 X126.547 Y127.185 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.383609
G1 F4832
M204 S6000
G1 X127.081 Y127.185 E.0148
G1 X127.428 Y127.104 E.0099
G1 X127.535 Y126.986 E.00444
G1 X127.535 Y126.244 E.02057
G1 X127.562 Y126.112 E.00374
G1 X127.694 Y126.085 E.00374
G1 X132.106 Y126.085 E.12249
; WIPE_START
G1 F10566.837
G1 X130.106 Y126.085 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128 Y127.744 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
G1 F4832
M204 S6000
G1 X128 Y128.256 E.00784
M204 S10000
G1 X128.597 Y128.8 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4832
M204 S6000
G1 X128.45 Y128.8 E.00486
G1 X128.45 Y128.9 E.00331
G1 X128.802 Y128.802 E.01212
G1 X128.597 Y128.8 E.00682
; WIPE_START
G1 F8843.478
G1 X128.802 Y128.802 E-.1912
G1 X128.45 Y128.9 E-.3398
G1 X128.45 Y128.8 E-.09278
G1 X128.597 Y128.8 E-.13622
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.792 Y129.915 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.385118
G1 F4832
M204 S6000
G1 X128.306 Y129.915 E.12585
G1 X128.437 Y129.888 E.00376
G1 X128.462 Y129.332 E.01549
; WIPE_START
G1 F10520.251
G1 X128.437 Y129.888 E-.21116
G1 X128.306 Y129.915 E-.05119
G1 X126.996 Y129.915 E-.49765
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.465 Y131.906 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.383501
G1 F4832
M204 S6000
G1 X122.466 Y141.876 E.27671
G1 X122.493 Y142.008 E.00374
G1 X122.625 Y142.035 E.00374
G1 X127.376 Y142.035 E.13185
G1 X127.508 Y142.007 E.00374
G1 X127.535 Y141.876 E.00374
G1 X127.535 Y140.344 E.04249
G1 X127.562 Y140.212 E.00374
G1 X127.694 Y140.185 E.00374
G1 X130.176 Y140.185 E.06887
G1 X130.308 Y140.158 E.00374
G1 X130.335 Y140.026 E.00374
G1 X130.335 Y129.138 E.30217
M204 S10000
G1 X122.828 Y134.8 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4832
M204 S6000
G1 X122.828 Y133.172 E.05401
G1 X125.722 Y130.277 E.13579
G1 X122.917 Y130.277 E.09307
G1 X123.294 Y129.9 E.01769
G1 X122.45 Y129.9 E.02798
G1 X122.451 Y130.126 E.0075
G1 X122.759 Y130.435 E.01448
G1 X122.828 Y130.367 E.00321
G1 X122.828 Y130.504 E.00454
G1 X129.973 Y137.648 E.33518
G1 X129.973 Y139.823 E.07212
G1 X127.173 Y139.823 E.09288
G1 X127.173 Y141.672 E.06135
G1 X126.32 Y141.672 E.02827
G1 X122.828 Y138.18 E.16382
G1 X122.828 Y140.848 E.08848
G1 X129.973 Y133.703 E.33515
G1 X129.973 Y129.973 E.12376
G1 X129.177 Y129.177 E.03731
G1 X128.827 Y129.177 E.0116
G1 X128.827 Y130.277 E.0365
G1 X128.649 Y130.277 E.00591
; WIPE_START
G1 F8843.478
G1 X128.827 Y130.277 E-.06768
G1 X128.827 Y129.177 E-.41816
G1 X129.177 Y129.177 E-.13292
G1 X129.44 Y129.44 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.656 Y137.032 Z2.2 F42000
G1 X128.094 Y142.475 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280021
G1 F4832
M204 S6000
G1 X133.707 Y142.475 E.10845
G2 X133.795 Y142.466 I-.013 J-.6 E.00171
; LINE_WIDTH: 0.242882
G2 X133.881 Y142.444 I-.104 J-.594 E.00145
; LINE_WIDTH: 0.202496
G1 X133.927 Y142.427 E.00064
; LINE_WIDTH: 0.163002
G1 X134.058 Y142.368 E.0014
; WIPE_START
G1 F15000
G1 X133.927 Y142.427 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.371 Y134.955 Z2.2 F42000
G1 X127.906 Y113.525 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.279461
G1 F4832
M204 S6000
G1 X122.293 Y113.525 E.10819
G2 X122.138 Y113.549 I.053 J.859 E.00302
; LINE_WIDTH: 0.215018
G1 X122.088 Y113.566 E.00074
; LINE_WIDTH: 0.177315
G1 X121.949 Y113.626 E.00166
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X122.088 Y113.566 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/42
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
M106 S198.9
; OBJECT_ID: 394
M204 S10000
G17
G3 Z2.2 I-1.103 J.515 P1  F42000
G1 X128.29 Y126.84 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X133.91 Y126.84 E.17269
G1 X133.91 Y128.06 E.03749
G1 X128.29 Y128.06 E.17269
G1 X128.29 Y126.9 E.03564
; WIPE_START
M204 S6000
G1 X130.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.71 Y127.94 Z2.4 F42000
G1 Z2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X127.71 Y129.16 E.03749
G1 X122.09 Y129.16 E.17269
G1 X122.09 Y127.94 E.03749
G1 X127.65 Y127.94 E.17084
; WIPE_START
M204 S6000
G1 X127.71 Y129.16 E-.46416
G1 X126.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.352 Y121.539 Z2.4 F42000
G1 X127.71 Y115.06 Z2.4
G1 Z2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X122.09 Y115.06 E.17269
G1 X122.09 Y113.84 E.03749
G1 X127.71 Y113.84 E.17269
G1 X127.71 Y115 E.03564
; WIPE_START
M204 S6000
G1 X125.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.51 Y122.651 Z2.4 F42000
G1 X125.382 Y127.548 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X125.302 Y127.548 E.00264
G1 X125.302 Y115.452 E.40124
G1 X128.102 Y115.452 E.09288
G1 X128.102 Y113.603 E.06134
G1 X133.752 Y113.609 E.18741
G1 X133.809 Y113.636 E.00211
G3 X133.897 Y113.79 I-.112 J.165 E.0061
G1 X133.898 Y126.448 E.41987
G1 X127.898 Y126.448 E.19903
G1 X127.898 Y127.548 E.03649
G1 X125.442 Y127.548 E.08148
; WIPE_START
G1 X125.302 Y127.548 E-.05301
G1 X125.302 Y125.687 E-.70699
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.652 Y129.552 Z2.4 F42000
G1 Z2
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X128.102 Y129.552 E.0481
G1 X128.102 Y128.452 E.03649
G1 X130.698 Y128.452 E.08611
G1 X130.698 Y140.548 E.40124
G1 X127.898 Y140.548 E.09288
G1 X127.898 Y142.397 E.06135
G1 X122.262 Y142.393 E.18697
G3 X122.103 Y142.202 I.049 J-.202 E.00883
G1 X122.102 Y129.552 E.41963
G1 X126.592 Y129.552 E.14894
; WIPE_START
G1 X128.102 Y129.552 E-.5738
G1 X128.102 Y129.062 E-.1862
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.223 Y136.694 Z2.4 F42000
G1 X128.29 Y140.94 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X133.91 Y140.94 E.17269
G1 X133.91 Y142.16 E.03749
G1 X128.29 Y142.16 E.17269
G1 X128.29 Y141 E.03564
; WIPE_START
M204 S6000
G1 X130.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.403 Y133.913 Z2.4 F42000
G1 X124.91 Y127.81 Z2.4
G1 Z2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X124.91 Y115.19 E.38778
G1 X121.94 Y115.19 E.09126
G1 X121.94 Y115.665 E.0146
G1 X121.71 Y115.665 E.00706
M73 P54 R7
G1 X121.711 Y113.771 E.05819
G3 X122.274 Y113.211 I.594 J.034 E.02671
G1 X133.818 Y113.222 E.35473
G3 X134.289 Y113.771 I-.125 J.583 E.02387
G1 X134.29 Y128.665 E.45765
G1 X134.06 Y128.665 E.00707
G1 X134.06 Y128.19 E.0146
G1 X131.09 Y128.19 E.09126
G1 X131.09 Y140.81 E.38778
G1 X134.06 Y140.81 E.09126
G1 X134.06 Y140.335 E.0146
G1 X134.29 Y140.335 E.00706
G1 X134.289 Y142.229 E.05819
G3 X133.726 Y142.789 I-.591 J-.031 E.02675
G1 X122.305 Y142.79 E.35093
G3 X121.711 Y142.226 I.012 J-.608 E.02761
G1 X121.71 Y127.335 E.45757
G1 X121.94 Y127.335 E.00707
G1 X121.94 Y127.81 E.0146
G1 X124.85 Y127.81 E.08942
; WIPE_START
M204 S6000
G1 X124.859 Y125.81 E-.76
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


G1 X126.899 Y127.381 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40655
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X127.731 Y126.549 E.06223
M106 S198.9
; WIPE_START
G1 X126.899 Y127.381 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128 Y127.744 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
; LAYER_HEIGHT: 0.2
G1 F15000
M204 S6000
G1 X128 Y128.256 E.00784
M204 S10000
G1 X128.8 Y128.8 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X128.802 Y128.802 E.0001
M204 S10000
G1 X129.435 Y128.901 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.40763
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X122.472 Y135.864 E.5236
G1 X122.472 Y136.511 E.03441
G1 X129.616 Y129.368 E.53716
G1 X129.677 Y129.429 E.00463
G1 X130.328 Y129.153 E.03762
G1 X130.328 Y129.302 E.00797
G1 X122.472 Y137.158 E.59074
G1 X122.472 Y137.806 E.03441
G1 X130.328 Y129.95 E.59074
G1 X130.328 Y130.597 E.03441
G1 X122.472 Y138.453 E.59073
G1 X122.472 Y139.1 E.03441
G1 X130.328 Y131.244 E.59073
G1 X130.328 Y131.891 E.03441
G1 X122.472 Y139.747 E.59073
G1 X122.473 Y140.394 E.03441
G1 X130.328 Y132.538 E.59073
G1 X130.328 Y133.186 E.03441
G1 X122.473 Y141.041 E.59072
G1 X122.473 Y141.688 E.03441
G1 X130.328 Y133.833 E.59072
G1 X130.328 Y134.48 E.03441
G1 X122.78 Y142.028 E.5676
G1 X123.427 Y142.028 E.03441
G1 X130.328 Y135.127 E.51894
G1 X130.328 Y135.774 E.03441
G1 X124.074 Y142.028 E.47026
G1 X124.722 Y142.028 E.03442
G1 X130.328 Y136.422 E.42159
G1 X130.328 Y137.069 E.03441
G1 X125.166 Y142.231 E.38815
M106 S198.9
M204 S10000
G1 X127.108 Y142.23 F42000
M106 S255
G1 F3000
M204 S6000
G1 X127.528 Y141.81 E.03159
G1 X127.528 Y141.163 E.03441
G1 X126.663 Y142.028 E.06503
G1 X126.016 Y142.028 E.03442
G1 X130.328 Y137.716 E.32425
G1 X130.328 Y138.363 E.03441
G1 X128.513 Y140.178 E.1365
G1 X129.16 Y140.178 E.03441
G1 X130.328 Y139.01 E.08783
G1 X130.328 Y139.657 E.03441
G1 X129.605 Y140.381 E.05439
M106 S198.9
; WIPE_START
G1 X130.328 Y139.657 E-.38872
G1 X130.328 Y139.01 E-.24593
G1 X130.095 Y139.244 E-.12535
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.094 Y142.475 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.28002
; LAYER_HEIGHT: 0.2
G1 F15000
M204 S6000
G1 X133.707 Y142.475 E.10844
M73 P54 R6
G2 X133.795 Y142.466 I-.014 J-.605 E.00172
; LINE_WIDTH: 0.236058
G2 X134.039 Y142.399 I-.334 J-1.684 E.00398
M204 S10000
G1 X134.052 Y142.372 F42000
; LINE_WIDTH: 0.171748
G1 F15000
M204 S6000
G1 X133.554 Y142.593 E.00571
; WIPE_START
G1 X134.052 Y142.372 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.479 Y138.493 Z2.4 F42000
G1 X122.27 Y135.42 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40763
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X127.768 Y129.922 E.41342
G1 X127.12 Y129.922 E.03441
G1 X122.472 Y134.57 E.34953
G1 X122.472 Y133.923 E.03441
G1 X126.473 Y129.922 E.30086
G1 X125.826 Y129.922 E.03441
G1 X122.472 Y133.276 E.2522
G1 X122.472 Y132.628 E.03441
G1 X125.179 Y129.922 E.20354
G1 X124.532 Y129.922 E.03441
G1 X122.532 Y131.921 E.15037
G1 X123.059 Y130.983 E.05724
G1 X122.941 Y130.865 E.00886
G1 X124.087 Y129.719 E.08615
M106 S198.9
M204 S10000
G1 X122.517 Y131.057 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.444675
; LAYER_HEIGHT: 0.2
G1 F8960.685
M204 S6000
G1 X122.49 Y130.96 E.00332
; LINE_WIDTH: 0.403505
G1 F9983.776
G1 X122.463 Y130.862 E.00298
; LINE_WIDTH: 0.402984
G1 F9998.223
G1 X122.486 Y130.795 E.00209
; LINE_WIDTH: 0.443112
G1 F8995.681
G1 X122.508 Y130.727 E.00232
; LINE_WIDTH: 0.48324
G1 F8175.872
G1 X122.531 Y130.659 E.00256
; LINE_WIDTH: 0.523368
G1 F7493.006
G1 X122.554 Y130.592 E.00279
; LINE_WIDTH: 0.580771
G1 F6693.314
G1 X122.576 Y130.524 E.00312
G1 X122.576 Y130.086 E.01921
; WIPE_START
G1 X122.576 Y130.524 E-.65367
G1 X122.554 Y130.592 E-.10633
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.481 Y127.387 Z2.4 F42000
G1 X131.873 Y126.281 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40655
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X133.18 Y124.973 E.09779
G1 X133.528 Y124.299 E.04016
G1 X133.528 Y123.98 E.01685
G1 X131.43 Y126.078 E.15695
G1 X130.784 Y126.078 E.03415
G1 X133.528 Y123.334 E.20524
G1 X133.528 Y122.689 E.03415
G1 X130.138 Y126.078 E.25353
G1 X129.493 Y126.078 E.03415
G1 X133.528 Y122.043 E.30183
G1 X133.528 Y121.397 E.03415
G1 X128.847 Y126.078 E.35012
M73 P55 R6
G1 X128.201 Y126.078 E.03415
G1 X133.528 Y120.752 E.39841
G1 X133.528 Y120.106 E.03415
G1 X126.633 Y127.001 E.51571
G1 X126.708 Y126.28 E.03834
G1 X133.528 Y119.461 E.51007
G1 X133.528 Y118.815 E.03415
G1 X125.843 Y126.5 E.57479
G1 X125.672 Y126.553 E.00951
G1 X125.672 Y126.025 E.02793
G1 X133.528 Y118.169 E.58761
G1 X133.528 Y117.524 E.03415
G1 X125.672 Y125.38 E.58761
G1 X125.672 Y124.734 E.03415
G1 X133.528 Y116.878 E.58761
G1 X133.527 Y116.233 E.03415
G1 X125.672 Y124.088 E.5876
G1 X125.672 Y123.443 E.03415
G1 X133.527 Y115.587 E.5876
G1 X133.527 Y114.941 E.03415
G1 X125.672 Y122.797 E.5876
G1 X125.672 Y122.151 E.03415
G1 X133.527 Y114.296 E.58759
G1 X133.527 Y113.979 E.01677
G1 X133.199 Y113.978 E.01736
G1 X125.672 Y121.506 E.56304
G1 X125.672 Y120.86 E.03415
G1 X132.554 Y113.978 E.5148
G1 X131.909 Y113.977 E.03411
G1 X125.672 Y120.214 E.46656
G1 X125.672 Y119.569 E.03415
G1 X131.264 Y113.976 E.41832
G1 X130.619 Y113.975 E.03411
G1 X125.672 Y118.923 E.37008
G1 X125.672 Y118.277 E.03415
G1 X129.974 Y113.975 E.32184
G1 X129.33 Y113.974 E.03411
G1 X128.472 Y114.832 E.06416
G1 X128.472 Y114.186 E.03415
G1 X128.887 Y113.771 E.03105
M106 S198.9
; WIPE_START
G1 X128.472 Y114.186 E-.22311
G1 X128.472 Y114.832 E-.24535
G1 X129.014 Y114.289 E-.29153
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.906 Y113.525 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279609
; LAYER_HEIGHT: 0.2
G1 F15000
M204 S6000
G1 X122.293 Y113.525 E.10825
G2 X122.158 Y113.544 I.022 J.668 E.00264
; LINE_WIDTH: 0.221761
G1 X122.089 Y113.566 E.00105
; LINE_WIDTH: 0.177707
G1 X121.949 Y113.626 E.00168
; WIPE_START
G1 X122.089 Y113.566 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.393 Y115.619 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40655
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X125.672 Y116.34 E.05395
G1 X125.672 Y116.546 E.01089
G1 X126.02 Y116.546 E.01841
G1 X125.672 Y116.894 E.02603
G1 X125.672 Y116.986 E.00485
G1 X126.836 Y115.822 E.0871
G1 X127.482 Y115.822 E.03415
G1 X125.469 Y117.834 E.15054
M106 S198.9
M204 S10000
G1 X133.424 Y125.974 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.58358
; LAYER_HEIGHT: 0.2
G1 F6658.529
M204 S6000
G1 X133.424 Y125.495 E.02112
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6658.529
G1 X133.424 Y125.974 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/42
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
M106 S201.45
; OBJECT_ID: 394
M204 S10000
G17
G3 Z2.4 I-.202 J-1.2 P1  F42000
G1 X128.29 Y126.84 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8500
M204 S5000
G1 X133.91 Y126.84 E.17269
G1 X133.91 Y128.06 E.03749
G1 X128.29 Y128.06 E.17269
G1 X128.29 Y126.9 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.71 Y127.94 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
G1 F8500
M204 S5000
G1 X127.71 Y129.16 E.03749
G1 X122.09 Y129.16 E.17269
G1 X122.09 Y127.94 E.03749
G1 X127.65 Y127.94 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.71 Y129.16 E-.46416
G1 X126.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.352 Y121.539 Z2.6 F42000
G1 X127.71 Y115.06 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F8500
M204 S5000
G1 X122.09 Y115.06 E.17269
G1 X122.09 Y113.84 E.03749
G1 X127.71 Y113.84 E.17269
G1 X127.71 Y115 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.51 Y122.651 Z2.6 F42000
G1 X125.382 Y127.548 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8500
M204 S6000
G1 X125.302 Y127.548 E.00264
G1 X125.302 Y115.452 E.40124
G1 X128.102 Y115.452 E.09288
G1 X128.102 Y113.603 E.06134
G1 X133.752 Y113.609 E.18742
G1 X133.81 Y113.636 E.00211
G1 X133.864 Y113.69 E.00255
G3 X133.897 Y113.79 I-.23 J.131 E.00352
G1 X133.898 Y126.448 E.41987
G1 X127.898 Y126.448 E.19903
G1 X127.898 Y127.548 E.03649
G1 X125.442 Y127.548 E.08148
; WIPE_START
G1 F8843.478
G1 X125.302 Y127.548 E-.05301
G1 X125.302 Y125.687 E-.70699
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.652 Y129.552 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
G1 F8500
M204 S6000
G1 X128.102 Y129.552 E.0481
G1 X128.102 Y128.452 E.03649
G1 X130.698 Y128.452 E.08611
G1 X130.698 Y140.548 E.40124
G1 X127.898 Y140.548 E.09288
G1 X127.898 Y142.397 E.06135
G1 X122.262 Y142.393 E.18697
G3 X122.103 Y142.202 I.049 J-.202 E.00883
G1 X122.102 Y129.552 E.41963
G1 X126.592 Y129.552 E.14894
; WIPE_START
G1 F8843.478
G1 X128.102 Y129.552 E-.5738
G1 X128.102 Y129.062 E-.1862
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.223 Y136.694 Z2.6 F42000
G1 X128.29 Y140.94 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8500
M204 S5000
G1 X133.91 Y140.94 E.17269
G1 X133.91 Y142.16 E.03749
G1 X128.29 Y142.16 E.17269
G1 X128.29 Y141 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.403 Y133.913 Z2.6 F42000
G1 X124.91 Y127.81 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F8500
M204 S5000
G1 X124.91 Y115.19 E.38778
G1 X121.94 Y115.19 E.09126
G1 X121.94 Y115.665 E.0146
G1 X121.71 Y115.665 E.00706
G1 X121.711 Y113.774 E.05811
G3 X122.274 Y113.211 I.594 J.031 E.02679
G1 X133.818 Y113.222 E.35474
G3 X134.289 Y113.771 I-.121 J.58 E.02389
G1 X134.29 Y128.665 E.45765
G1 X134.06 Y128.665 E.00707
G1 X134.06 Y128.19 E.0146
G1 X131.09 Y128.19 E.09126
G1 X131.09 Y140.81 E.38778
G1 X134.06 Y140.81 E.09126
G1 X134.06 Y140.335 E.0146
G1 X134.29 Y140.335 E.00706
G1 X134.289 Y142.229 E.05819
G3 X133.726 Y142.789 I-.594 J-.034 E.02671
G1 X122.305 Y142.79 E.35093
G3 X121.711 Y142.226 I.012 J-.608 E.02762
G1 X121.71 Y127.335 E.45757
G1 X121.94 Y127.335 E.00707
G1 X121.94 Y127.81 E.0146
G1 X124.85 Y127.81 E.08942
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.859 Y125.81 E-.76
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


G1 X125.466 Y126.619 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42156
G1 F8500
M204 S6000
G1 X126.062 Y127.215 E.02601
G1 X126.597 Y127.215 E.01652
G1 X125.635 Y126.253 E.04197
G1 X125.635 Y125.717 E.01652
G1 X127.133 Y127.215 E.06534
G1 X127.565 Y127.215 E.01333
G1 X127.565 Y127.111 E.00319
G1 X125.635 Y125.182 E.0842
G1 X125.635 Y124.646 E.01652
G1 X127.565 Y126.576 E.0842
G1 X127.565 Y126.115 E.01423
G1 X127.639 Y126.115 E.00229
G1 X125.635 Y124.111 E.08744
G1 X125.635 Y123.575 E.01652
G1 X128.175 Y126.115 E.1108
G1 X128.71 Y126.115 E.01652
G1 X125.635 Y123.04 E.13417
G1 X125.635 Y122.505 E.01652
M73 P56 R6
G1 X129.245 Y126.115 E.15753
G1 X129.781 Y126.115 E.01652
G1 X125.635 Y121.969 E.1809
G1 X125.635 Y121.434 E.01652
G1 X130.316 Y126.115 E.20426
G1 X130.852 Y126.115 E.01652
G1 X125.635 Y120.898 E.22763
G1 X125.635 Y120.363 E.01652
G1 X131.387 Y126.115 E.25099
G1 X131.923 Y126.115 E.01652
G1 X125.635 Y119.827 E.27436
G1 X125.635 Y119.292 E.01652
G1 X132.458 Y126.115 E.29772
G1 X132.994 Y126.115 E.01652
G1 X125.635 Y118.756 E.32109
G1 X125.635 Y118.221 E.01652
G1 X133.529 Y126.115 E.34446
G1 X133.565 Y126.115 E.00109
G1 X133.565 Y125.615 E.01543
G1 X125.635 Y117.685 E.34599
G1 X125.635 Y117.15 E.01652
G1 X133.565 Y125.079 E.34599
G1 X133.565 Y124.544 E.01652
G1 X125.635 Y116.614 E.34599
G1 X125.635 Y116.079 E.01652
G1 X133.564 Y124.008 E.34599
G1 X133.564 Y123.473 E.01652
G1 X125.877 Y115.785 E.33543
G1 X126.413 Y115.785 E.01652
G1 X133.564 Y122.937 E.31207
G1 X133.564 Y122.401 E.01652
G1 X126.948 Y115.785 E.2887
G1 X127.484 Y115.785 E.01652
G1 X133.564 Y121.866 E.26533
G1 X133.564 Y121.33 E.01652
G1 X128.019 Y115.785 E.24197
G1 X128.435 Y115.785 E.01284
G1 X128.435 Y115.666 E.00368
G1 X133.564 Y120.795 E.2238
G1 X133.564 Y120.259 E.01652
G1 X128.435 Y115.13 E.2238
G1 X128.435 Y114.595 E.01652
G1 X133.564 Y119.724 E.2238
G1 X133.564 Y119.188 E.01652
G1 X128.435 Y114.059 E.2238
G1 X128.435 Y113.936 E.0038
G1 X128.848 Y113.937 E.01274
G1 X133.564 Y118.653 E.20578
G1 X133.564 Y118.117 E.01652
G1 X129.384 Y113.938 E.18239
G1 X129.92 Y113.938 E.01654
G1 X133.564 Y117.582 E.15899
G1 X133.564 Y117.046 E.01652
G1 X130.456 Y113.939 E.1356
G1 X130.992 Y113.939 E.01654
G1 X133.564 Y116.511 E.11221
G1 X133.564 Y115.975 E.01652
G1 X131.529 Y113.94 E.08881
G1 X132.065 Y113.941 E.01654
G1 X133.564 Y115.44 E.06542
G1 X133.564 Y114.904 E.01652
G1 X132.601 Y113.941 E.04203
G1 X133.137 Y113.942 E.01654
G1 X133.734 Y114.538 E.02604
; WIPE_START
G1 F9507.712
G1 X133.137 Y113.942 E-.32065
G1 X132.601 Y113.941 E-.20371
G1 X133.039 Y114.38 E-.23563
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.906 Y113.525 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279621
G1 F8500
M204 S6000
G1 X122.293 Y113.525 E.10826
G2 X122.158 Y113.544 I.022 J.667 E.00263
; LINE_WIDTH: 0.221923
G1 X122.089 Y113.566 E.00106
; LINE_WIDTH: 0.17772
G1 X121.949 Y113.626 E.00168
; WIPE_START
G1 F15000
G1 X122.089 Y113.566 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.026 Y120.611 Z2.6 F42000
G1 X128 Y127.744 Z2.6
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.23088
G1 F8500
M204 S6000
G1 X128 Y128.256 E.00784
; WIPE_START
G1 F15000
G1 X128 Y127.744 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.534 Y129.381 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42169
G1 F8500
M204 S6000
G1 X129.938 Y128.785 E.02602
G1 X129.403 Y128.785 E.01653
G1 X130.365 Y129.747 E.042
G1 X130.365 Y130.283 E.01653
G1 X128.867 Y128.785 E.06538
G1 X128.435 Y128.785 E.01333
G1 X128.435 Y128.889 E.00321
G1 X130.365 Y130.819 E.08422
G1 X130.365 Y131.354 E.01653
G1 X128.435 Y129.425 E.08422
G1 X128.435 Y129.885 E.01421
G1 X128.36 Y129.885 E.00232
G1 X130.365 Y131.89 E.08751
G1 X130.365 Y132.426 E.01653
G1 X127.824 Y129.885 E.11089
G1 X127.289 Y129.885 E.01653
G1 X130.365 Y132.961 E.13427
G1 X130.365 Y133.497 E.01653
G1 X126.753 Y129.885 E.15765
G1 X126.217 Y129.885 E.01653
G1 X130.365 Y134.033 E.18104
G1 X130.365 Y134.568 E.01653
G1 X125.682 Y129.885 E.20442
G1 X125.146 Y129.885 E.01653
G1 X130.365 Y135.104 E.2278
G1 X130.365 Y135.64 E.01653
G1 X124.61 Y129.885 E.25118
G1 X124.075 Y129.885 E.01653
G1 X130.365 Y136.175 E.27456
G1 X130.365 Y136.711 E.01653
G1 X123.539 Y129.885 E.29794
G1 X123.003 Y129.885 E.01653
G1 X130.365 Y137.247 E.32132
G1 X130.365 Y137.782 E.01653
G1 X122.468 Y129.885 E.3447
G1 X122.435 Y129.885 E.001
G1 X122.435 Y130.389 E.01554
G1 X130.365 Y138.318 E.34611
G1 X130.365 Y138.854 E.01653
G1 X122.435 Y130.924 E.34611
G1 X122.435 Y131.46 E.01653
G1 X130.365 Y139.389 E.34611
G1 X130.365 Y139.925 E.01653
G1 X122.436 Y131.996 E.34611
G1 X122.436 Y132.531 E.01653
G1 X130.119 Y140.215 E.33538
G1 X129.583 Y140.215 E.01653
G1 X122.436 Y133.067 E.31199
G1 X122.436 Y133.603 E.01653
G1 X129.048 Y140.215 E.28861
G1 X128.512 Y140.215 E.01653
G1 X122.436 Y134.138 E.26523
G1 X122.436 Y134.674 E.01653
G1 X127.976 Y140.215 E.24184
G1 X127.565 Y140.215 E.0127
G1 X127.565 Y140.339 E.00383
G1 X122.436 Y135.21 E.22388
G1 X122.436 Y135.746 E.01653
G1 X127.565 Y140.875 E.22388
G1 X127.565 Y141.41 E.01653
G1 X122.436 Y136.281 E.22388
G1 X122.436 Y136.817 E.01653
G1 X127.565 Y141.946 E.22388
G1 X127.565 Y142.064 E.00365
G1 X127.148 Y142.064 E.01288
G1 X122.436 Y137.353 E.20566
G1 X122.436 Y137.888 E.01653
G1 X126.612 Y142.064 E.18228
G1 X126.076 Y142.064 E.01653
G1 X122.436 Y138.424 E.1589
G1 X122.436 Y138.96 E.01653
G1 X125.541 Y142.065 E.13552
G1 X125.005 Y142.065 E.01653
G1 X122.436 Y139.495 E.11214
G1 X122.436 Y140.031 E.01653
G1 X124.469 Y142.065 E.08876
G1 X123.934 Y142.065 E.01653
G1 X122.436 Y140.567 E.06538
G1 X122.436 Y141.103 E.01653
G1 X123.398 Y142.065 E.042
G1 X122.863 Y142.065 E.01653
G1 X122.266 Y141.469 E.02602
; WIPE_START
G1 F9504.448
G1 X122.863 Y142.065 E-.32039
G1 X123.398 Y142.065 E-.20353
G1 X122.959 Y141.625 E-.23608
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.094 Y142.475 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.278372
G1 F8500
M204 S6000
G1 X133.707 Y142.475 E.10769
G2 X134.037 Y142.402 I-.1 J-1.246 E.0065
M204 S10000
G1 X134.051 Y142.374 F42000
; LINE_WIDTH: 0.177343
G1 F8500
M204 S6000
G1 X133.54 Y142.593 E.0061
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X134.051 Y142.374 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/42
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z2.6 I1.141 J-.423 P1  F42000
G1 X128.29 Y126.84 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8499
M204 S5000
G1 X133.91 Y126.84 E.17269
G1 X133.91 Y128.06 E.03749
G1 X128.29 Y128.06 E.17269
G1 X128.29 Y126.9 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.71 Y127.94 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F8499
M204 S5000
G1 X127.71 Y129.16 E.03749
G1 X122.09 Y129.16 E.17269
G1 X122.09 Y127.94 E.03749
M73 P57 R6
G1 X127.65 Y127.94 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.71 Y129.16 E-.46416
G1 X126.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.352 Y121.539 Z2.8 F42000
G1 X127.71 Y115.06 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F8499
M204 S5000
G1 X122.09 Y115.06 E.17269
G1 X122.09 Y113.84 E.03749
G1 X127.71 Y113.84 E.17269
G1 X127.71 Y115 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.51 Y122.651 Z2.8 F42000
G1 X125.382 Y127.548 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8499
M204 S6000
G1 X125.302 Y127.548 E.00264
G1 X125.302 Y115.452 E.40124
G1 X128.102 Y115.452 E.09288
G1 X128.102 Y113.603 E.06134
G1 X133.738 Y113.607 E.18697
G1 X133.839 Y113.66 E.0038
G3 X133.897 Y113.79 I-.143 J.141 E.00481
G1 X133.898 Y126.448 E.41988
G1 X127.898 Y126.448 E.19903
G1 X127.898 Y127.548 E.03649
G1 X125.442 Y127.548 E.08148
; WIPE_START
G1 F8843.478
G1 X125.302 Y127.548 E-.05301
G1 X125.302 Y125.687 E-.70699
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.652 Y129.552 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F8499
M204 S6000
G1 X128.102 Y129.552 E.0481
G1 X128.102 Y128.452 E.03649
G1 X130.698 Y128.452 E.08611
G1 X130.698 Y140.548 E.40124
G1 X127.898 Y140.548 E.09288
G1 X127.898 Y142.397 E.06135
G1 X122.262 Y142.393 E.18697
G3 X122.103 Y142.202 I.05 J-.203 E.00882
G1 X122.102 Y129.552 E.41963
G1 X126.592 Y129.552 E.14894
; WIPE_START
G1 F8843.478
G1 X128.102 Y129.552 E-.5738
G1 X128.102 Y129.062 E-.1862
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.223 Y136.694 Z2.8 F42000
G1 X128.29 Y140.94 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8499
M204 S5000
G1 X133.91 Y140.94 E.17269
G1 X133.91 Y142.16 E.03749
G1 X128.29 Y142.16 E.17269
G1 X128.29 Y141 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.403 Y133.913 Z2.8 F42000
G1 X124.91 Y127.81 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F8499
M204 S5000
G1 X124.91 Y115.19 E.38778
G1 X121.94 Y115.19 E.09126
G1 X121.94 Y115.665 E.0146
G1 X121.71 Y115.665 E.00706
G1 X121.711 Y113.771 E.05819
G3 X122.274 Y113.211 I.594 J.034 E.0267
G1 X133.756 Y113.213 E.35284
G3 X134.289 Y113.771 I-.065 J.595 E.02576
G1 X134.29 Y128.665 E.45765
G1 X134.06 Y128.665 E.00707
G1 X134.06 Y128.19 E.0146
G1 X131.09 Y128.19 E.09126
G1 X131.09 Y140.81 E.38778
G1 X134.06 Y140.81 E.09126
G1 X134.06 Y140.335 E.0146
G1 X134.29 Y140.335 E.00706
G1 X134.289 Y142.229 E.05819
G3 X133.726 Y142.789 I-.594 J-.034 E.02671
G1 X122.305 Y142.79 E.35094
G3 X121.711 Y142.226 I.012 J-.608 E.02761
G1 X121.71 Y127.335 E.45757
G1 X121.94 Y127.335 E.00707
G1 X121.94 Y127.81 E.0146
G1 X124.85 Y127.81 E.08942
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.859 Y125.81 E-.76
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


G1 X126.425 Y127.384 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42704
G1 F8499
M204 S6000
G1 X133.564 Y120.245 E.31603
G1 X133.564 Y119.702 E.017
G1 X126.051 Y127.215 E.33257
G1 X125.635 Y127.215 E.01302
G1 X125.635 Y127.088 E.00398
G1 X133.564 Y119.159 E.35098
G1 X133.564 Y118.615 E.017
G1 X125.635 Y126.544 E.35098
G1 X125.635 Y126.001 E.017
G1 X133.564 Y118.072 E.35098
G1 X133.564 Y117.529 E.017
G1 X125.635 Y125.458 E.35098
G1 X125.635 Y124.915 E.017
G1 X133.564 Y116.986 E.35098
G1 X133.564 Y116.443 E.017
G1 X125.635 Y124.371 E.35098
G1 X125.635 Y123.828 E.017
G1 X133.564 Y115.899 E.35097
G1 X133.564 Y115.356 E.017
G1 X125.635 Y123.285 E.35097
G1 X125.635 Y122.742 E.017
G1 X133.564 Y114.813 E.35097
G1 X133.564 Y114.27 E.017
G1 X125.635 Y122.199 E.35097
G1 X125.635 Y121.655 E.017
G1 X133.351 Y113.939 E.34155
G1 X132.808 Y113.939 E.01699
G1 X125.635 Y121.112 E.31752
G1 X125.635 Y120.569 E.017
G1 X132.265 Y113.939 E.29349
G1 X131.722 Y113.938 E.01699
G1 X125.635 Y120.026 E.26946
G1 X125.635 Y119.482 E.017
G1 X131.18 Y113.938 E.24543
G1 X130.637 Y113.938 E.01699
G1 X125.635 Y118.939 E.2214
G1 X125.635 Y118.396 E.017
G1 X130.094 Y113.937 E.19736
G1 X129.551 Y113.937 E.01699
G1 X128.435 Y115.053 E.04939
G1 X128.435 Y114.509 E.017
G1 X129.008 Y113.937 E.02536
G1 X128.465 Y113.936 E.01699
G1 X128.266 Y114.136 E.00884
M204 S10000
G1 X127.906 Y113.525 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.279632
G1 F8499
M204 S6000
G1 X122.293 Y113.525 E.10827
G2 X122.158 Y113.544 I.022 J.668 E.00262
; LINE_WIDTH: 0.221975
G1 X122.089 Y113.566 E.00106
; LINE_WIDTH: 0.177795
G1 X121.949 Y113.626 E.00168
; WIPE_START
G1 F15000
G1 X122.089 Y113.566 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.466 Y116.393 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42704
G1 F8499
M204 S6000
G1 X126.073 Y115.785 E.02689
G1 X126.616 Y115.785 E.017
G1 X125.635 Y116.766 E.04343
G1 X125.635 Y117.309 E.017
G1 X127.159 Y115.785 E.06747
G1 X127.703 Y115.785 E.017
G1 X125.466 Y118.022 E.09903
M204 S10000
G1 X132.957 Y126.284 F42000
G1 F8499
M204 S6000
G1 X133.565 Y125.677 E.02689
G1 X133.565 Y125.134 E.017
G1 X132.584 Y126.115 E.04343
G1 X132.04 Y126.115 E.017
G1 X133.565 Y124.591 E.06747
G1 X133.564 Y124.047 E.017
G1 X131.497 Y126.115 E.09152
G1 X130.954 Y126.115 E.017
G1 X133.564 Y123.504 E.11556
G1 X133.564 Y122.961 E.017
G1 X130.411 Y126.115 E.13961
G1 X129.867 Y126.115 E.017
G1 X133.564 Y122.418 E.16365
G1 X133.564 Y121.875 E.017
G1 X129.324 Y126.115 E.1877
G1 X128.781 Y126.115 E.017
G1 X133.564 Y121.331 E.21174
G1 X133.564 Y120.788 E.017
G1 X128.068 Y126.284 E.2433
M204 S10000
G1 X127.734 Y126.618 F42000
G1 F8499
M204 S6000
G1 X126.968 Y127.384 E.03393
; WIPE_START
G1 F9372.071
G1 X127.734 Y126.618 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128 Y127.744 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
G1 F8499
M204 S6000
G1 X128 Y128.256 E.00784
; WIPE_START
G1 F15000
G1 X128 Y127.744 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.266 Y129.382 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42704
G1 F8499
M204 S6000
G1 X128.862 Y128.785 E.02641
G1 X129.405 Y128.785 E.017
G1 X122.436 Y135.755 E.30852
G1 X122.436 Y136.298 E.017
G1 X129.949 Y128.785 E.33257
M73 P58 R6
G1 X130.365 Y128.785 E.01302
G1 X130.365 Y128.912 E.00398
G1 X122.436 Y136.841 E.35098
G1 X122.436 Y137.385 E.017
G1 X130.365 Y129.456 E.35098
G1 X130.365 Y129.999 E.017
G1 X122.436 Y137.928 E.35098
G1 X122.436 Y138.471 E.017
G1 X130.365 Y130.542 E.35098
G1 X130.365 Y131.085 E.017
G1 X122.436 Y139.014 E.35098
G1 X122.436 Y139.557 E.017
G1 X130.365 Y131.629 E.35098
G1 X130.365 Y132.172 E.017
G1 X122.436 Y140.1 E.35097
G1 X122.436 Y140.644 E.017
G1 X130.365 Y132.715 E.35097
G1 X130.365 Y133.258 E.017
G1 X122.436 Y141.187 E.35097
G1 X122.436 Y141.73 E.017
G1 X130.365 Y133.801 E.35097
G1 X130.365 Y134.345 E.017
G1 X122.645 Y142.065 E.34174
G1 X123.188 Y142.065 E.01701
G1 X130.365 Y134.888 E.31769
G1 X130.365 Y135.431 E.017
G1 X123.731 Y142.065 E.29364
G1 X124.274 Y142.065 E.01701
G1 X130.365 Y135.974 E.26959
G1 X130.365 Y136.518 E.017
G1 X124.818 Y142.065 E.24554
G1 X125.361 Y142.065 E.01701
G1 X130.365 Y137.061 E.2215
G1 X130.365 Y137.604 E.017
G1 X125.735 Y142.234 E.20496
; WIPE_START
G1 F9372.071
G1 X127.149 Y140.82 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.757 Y140.384 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F8499
M204 S6000
G1 X130.365 Y139.777 E.02689
G1 X130.365 Y139.234 E.017
G1 X129.384 Y140.215 E.04343
G1 X128.84 Y140.215 E.017
G1 X130.365 Y138.69 E.06748
G1 X130.365 Y138.147 E.017
G1 X128.128 Y140.384 E.09903
M204 S10000
G1 X127.734 Y140.778 F42000
G1 F8499
M204 S6000
G1 X126.448 Y142.064 E.05696
G1 X126.991 Y142.064 E.01701
G1 X127.565 Y141.49 E.0254
G1 X127.565 Y142.034 E.017
G1 X127.364 Y142.234 E.00887
M204 S10000
G1 X128.094 Y142.475 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.28002
G1 F8499
M204 S6000
G1 X133.707 Y142.475 E.10844
G2 X133.795 Y142.466 I-.014 J-.604 E.00172
; LINE_WIDTH: 0.242816
G2 X133.881 Y142.444 I-.104 J-.593 E.00145
; LINE_WIDTH: 0.202506
G1 X133.927 Y142.427 E.00064
; LINE_WIDTH: 0.163022
G1 X134.058 Y142.368 E.0014
; WIPE_START
G1 F15000
G1 X133.927 Y142.427 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.395 Y138.48 Z2.8 F42000
G1 X122.266 Y135.381 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42704
G1 F8499
M204 S6000
G1 X127.762 Y129.885 E.2433
G1 X127.219 Y129.885 E.017
G1 X122.436 Y134.669 E.21174
G1 X122.436 Y134.125 E.017
G1 X126.676 Y129.885 E.18769
G1 X126.133 Y129.885 E.017
G1 X122.436 Y133.582 E.16365
G1 X122.436 Y133.039 E.017
G1 X125.589 Y129.885 E.1396
G1 X125.046 Y129.885 E.017
G1 X122.436 Y132.496 E.11556
G1 X122.436 Y131.953 E.017
G1 X124.503 Y129.885 E.09151
G1 X123.96 Y129.885 E.017
G1 X122.435 Y131.409 E.06747
G1 X122.435 Y130.866 E.017
G1 X123.416 Y129.885 E.04342
G1 X122.873 Y129.885 E.017
G1 X122.266 Y130.493 E.02689
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9372.071
G1 X122.873 Y129.885 E-.32644
G1 X123.416 Y129.885 E-.20643
G1 X122.994 Y130.308 E-.22713
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/42
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z2.8 I.667 J1.018 P1  F42000
G1 X128.29 Y126.84 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8510
M204 S5000
G1 X133.91 Y126.84 E.17269
G1 X133.91 Y128.06 E.03749
G1 X128.29 Y128.06 E.17269
G1 X128.29 Y126.9 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.71 Y127.94 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F8510
M204 S5000
G1 X127.71 Y129.16 E.03749
G1 X122.09 Y129.16 E.17269
G1 X122.09 Y127.94 E.03749
G1 X127.65 Y127.94 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.71 Y129.16 E-.46416
G1 X126.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.352 Y121.539 Z3 F42000
G1 X127.71 Y115.06 Z3
G1 Z2.6
G1 E.8 F1800
G1 F8510
M204 S5000
G1 X122.09 Y115.06 E.17269
G1 X122.09 Y113.84 E.03749
G1 X127.71 Y113.84 E.17269
G1 X127.71 Y115 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.51 Y122.651 Z3 F42000
G1 X125.382 Y127.548 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8510
M204 S6000
G1 X125.302 Y127.548 E.00264
G1 X125.302 Y115.452 E.40124
G1 X128.102 Y115.452 E.09288
G1 X128.102 Y113.603 E.06134
G1 X133.738 Y113.607 E.18697
G1 X133.852 Y113.675 E.0044
G1 X133.897 Y113.79 E.00411
G1 X133.898 Y126.448 E.41987
G1 X127.898 Y126.448 E.19903
G1 X127.898 Y127.548 E.03649
G1 X125.442 Y127.548 E.08148
; WIPE_START
G1 F8843.478
G1 X125.302 Y127.548 E-.05301
G1 X125.302 Y125.687 E-.70699
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.652 Y129.552 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F8510
M204 S6000
G1 X128.102 Y129.552 E.0481
G1 X128.102 Y128.452 E.03649
G1 X130.698 Y128.452 E.08611
G1 X130.698 Y140.548 E.40124
G1 X127.898 Y140.548 E.09288
G1 X127.898 Y142.397 E.06135
G1 X122.262 Y142.393 E.18697
G3 X122.103 Y142.207 I.044 J-.198 E.00872
G1 X122.102 Y129.552 E.41978
G1 X126.592 Y129.552 E.14894
; WIPE_START
G1 F8843.478
G1 X128.102 Y129.552 E-.5738
G1 X128.102 Y129.062 E-.1862
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.223 Y136.694 Z3 F42000
G1 X128.29 Y140.94 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8510
M204 S5000
G1 X133.91 Y140.94 E.17269
G1 X133.91 Y142.16 E.03749
G1 X128.29 Y142.16 E.17269
G1 X128.29 Y141 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.403 Y133.913 Z3 F42000
G1 X124.91 Y127.81 Z3
G1 Z2.6
G1 E.8 F1800
G1 F8510
M204 S5000
G1 X124.91 Y115.19 E.38778
G1 X121.94 Y115.19 E.09126
G1 X121.94 Y115.665 E.0146
G1 X121.71 Y115.665 E.00706
G1 X121.711 Y113.774 E.05811
G3 X122.274 Y113.211 I.594 J.031 E.02679
G1 X133.756 Y113.213 E.35283
G3 X134.289 Y113.771 I-.059 J.589 E.02582
G1 X134.29 Y128.665 E.45765
G1 X134.06 Y128.665 E.00707
G1 X134.06 Y128.19 E.0146
G1 X131.09 Y128.19 E.09126
G1 X131.09 Y140.81 E.38778
G1 X134.06 Y140.81 E.09126
G1 X134.06 Y140.335 E.0146
G1 X134.29 Y140.335 E.00706
G1 X134.289 Y142.229 E.05819
G3 X133.726 Y142.789 I-.594 J-.034 E.02671
G1 X122.305 Y142.79 E.35093
G3 X121.711 Y142.228 I.012 J-.608 E.02756
G1 X121.71 Y127.335 E.45762
G1 X121.94 Y127.335 E.00707
G1 X121.94 Y127.81 E.0146
G1 X124.85 Y127.81 E.08942
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.859 Y125.81 E-.76
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


G1 X125.466 Y126.619 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42161
G1 F8510
M204 S6000
G1 X126.062 Y127.215 E.02601
G1 X126.597 Y127.215 E.01653
G1 X125.635 Y126.253 E.04198
G1 X125.635 Y125.717 E.01653
G1 X127.133 Y127.215 E.06535
G1 X127.565 Y127.215 E.01333
G1 X127.565 Y127.111 E.00319
G1 X125.635 Y125.182 E.08421
G1 X125.635 Y124.646 E.01653
G1 X127.565 Y126.576 E.08421
G1 X127.565 Y126.115 E.01422
G1 X127.639 Y126.115 E.0023
G1 X125.635 Y124.111 E.08746
G1 X125.635 Y123.575 E.01653
G1 X128.175 Y126.115 E.11084
G1 X128.711 Y126.115 E.01653
G1 X125.635 Y123.039 E.13421
G1 X125.635 Y122.504 E.01653
G1 X129.246 Y126.115 E.15758
G1 X129.782 Y126.115 E.01653
G1 X125.635 Y121.968 E.18095
G1 X125.635 Y121.433 E.01653
G1 X130.317 Y126.115 E.20432
G1 X130.853 Y126.115 E.01653
G1 X125.635 Y120.897 E.22769
G1 X125.635 Y120.362 E.01653
G1 X131.388 Y126.115 E.25106
G1 X131.924 Y126.115 E.01653
G1 X125.635 Y119.826 E.27444
G1 X125.635 Y119.291 E.01653
G1 X132.459 Y126.115 E.29781
G1 X132.995 Y126.115 E.01653
G1 X125.635 Y118.755 E.32118
G1 X125.635 Y118.22 E.01653
G1 X133.53 Y126.115 E.34455
G1 X133.565 Y126.115 E.00105
G1 X133.565 Y125.613 E.01547
G1 X125.635 Y117.684 E.34604
G1 X125.635 Y117.148 E.01653
G1 X133.565 Y125.078 E.34604
M73 P59 R6
G1 X133.565 Y124.542 E.01653
G1 X125.635 Y116.613 E.34604
G1 X125.635 Y116.077 E.01653
G1 X133.564 Y124.007 E.34604
G1 X133.564 Y123.471 E.01653
G1 X125.879 Y115.785 E.33541
G1 X126.414 Y115.785 E.01653
G1 X133.564 Y122.935 E.31204
G1 X133.564 Y122.4 E.01653
G1 X126.95 Y115.785 E.28867
G1 X127.485 Y115.785 E.01653
G1 X133.564 Y121.864 E.26529
G1 X133.564 Y121.329 E.01653
G1 X128.021 Y115.785 E.24192
G1 X128.435 Y115.785 E.01279
G1 X128.435 Y115.664 E.00374
G1 X133.564 Y120.793 E.22383
G1 X133.564 Y120.258 E.01653
G1 X128.435 Y115.129 E.22383
G1 X128.435 Y114.593 E.01653
G1 X133.564 Y119.722 E.22383
G1 X133.564 Y119.186 E.01653
G1 X128.435 Y114.057 E.22383
G1 X128.435 Y113.936 E.00374
G1 X128.85 Y113.937 E.0128
G1 X133.564 Y118.651 E.20573
G1 X133.564 Y118.115 E.01653
G1 X129.386 Y113.937 E.18234
G1 X129.922 Y113.937 E.01654
G1 X133.564 Y117.58 E.15896
G1 X133.564 Y117.044 E.01653
G1 X130.458 Y113.938 E.13557
G1 X130.993 Y113.938 E.01654
G1 X133.564 Y116.508 E.11218
G1 X133.564 Y115.973 E.01653
G1 X131.529 Y113.938 E.08879
G1 X132.065 Y113.939 E.01654
G1 X133.564 Y115.437 E.0654
G1 X133.564 Y114.902 E.01653
G1 X132.601 Y113.939 E.04201
G1 X133.137 Y113.939 E.01654
G1 X133.734 Y114.536 E.02603
; WIPE_START
G1 F9506.456
G1 X133.137 Y113.939 E-.32054
G1 X132.601 Y113.939 E-.20364
G1 X133.04 Y114.378 E-.23582
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.906 Y113.525 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279634
G1 F8510
M204 S6000
G1 X122.293 Y113.525 E.10827
G2 X122.159 Y113.544 I.022 J.665 E.00262
; LINE_WIDTH: 0.222089
G1 X122.089 Y113.566 E.00106
; LINE_WIDTH: 0.177882
G1 X121.949 Y113.626 E.00168
; WIPE_START
G1 F15000
G1 X122.089 Y113.566 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.026 Y120.611 Z3 F42000
G1 X128 Y127.744 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.23088
G1 F8510
M204 S6000
G1 X128 Y128.256 E.00784
; WIPE_START
G1 F15000
G1 X128 Y127.744 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.534 Y129.381 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42169
G1 F8510
M204 S6000
G1 X129.938 Y128.785 E.02602
G1 X129.403 Y128.785 E.01653
G1 X130.365 Y129.747 E.042
G1 X130.365 Y130.283 E.01653
G1 X128.867 Y128.785 E.06538
G1 X128.435 Y128.785 E.01333
G1 X128.435 Y128.889 E.00321
G1 X130.365 Y130.819 E.08422
G1 X130.365 Y131.354 E.01653
G1 X128.435 Y129.425 E.08422
G1 X128.435 Y129.885 E.01421
G1 X128.36 Y129.885 E.00232
G1 X130.365 Y131.89 E.08751
G1 X130.365 Y132.426 E.01653
G1 X127.824 Y129.885 E.11089
G1 X127.289 Y129.885 E.01653
G1 X130.365 Y132.961 E.13427
G1 X130.365 Y133.497 E.01653
G1 X126.753 Y129.885 E.15765
G1 X126.217 Y129.885 E.01653
G1 X130.365 Y134.033 E.18104
G1 X130.365 Y134.568 E.01653
G1 X125.682 Y129.885 E.20442
G1 X125.146 Y129.885 E.01653
G1 X130.365 Y135.104 E.2278
G1 X130.365 Y135.64 E.01653
G1 X124.61 Y129.885 E.25118
G1 X124.075 Y129.885 E.01653
G1 X130.365 Y136.175 E.27456
G1 X130.365 Y136.711 E.01653
G1 X123.539 Y129.885 E.29794
G1 X123.003 Y129.885 E.01653
G1 X130.365 Y137.247 E.32132
G1 X130.365 Y137.782 E.01653
G1 X122.468 Y129.885 E.3447
G1 X122.435 Y129.885 E.001
G1 X122.435 Y130.389 E.01554
G1 X130.365 Y138.318 E.34611
G1 X130.365 Y138.854 E.01653
G1 X122.435 Y130.924 E.34611
G1 X122.435 Y131.46 E.01653
G1 X130.365 Y139.389 E.34611
G1 X130.365 Y139.925 E.01653
G1 X122.436 Y131.996 E.34611
G1 X122.436 Y132.531 E.01653
G1 X130.119 Y140.215 E.33538
G1 X129.583 Y140.215 E.01653
G1 X122.436 Y133.067 E.31199
G1 X122.436 Y133.603 E.01653
G1 X129.048 Y140.215 E.28861
G1 X128.512 Y140.215 E.01653
G1 X122.436 Y134.138 E.26523
G1 X122.436 Y134.674 E.01653
G1 X127.976 Y140.215 E.24184
G1 X127.565 Y140.215 E.0127
G1 X127.565 Y140.339 E.00383
G1 X122.436 Y135.21 E.22388
G1 X122.436 Y135.746 E.01653
G1 X127.565 Y140.875 E.22388
G1 X127.565 Y141.41 E.01653
G1 X122.436 Y136.281 E.22388
G1 X122.436 Y136.817 E.01653
G1 X127.565 Y141.946 E.22388
G1 X127.565 Y142.064 E.00365
G1 X127.148 Y142.064 E.01288
G1 X122.436 Y137.353 E.20566
G1 X122.436 Y137.888 E.01653
G1 X126.612 Y142.064 E.18228
G1 X126.076 Y142.064 E.01653
G1 X122.436 Y138.424 E.1589
G1 X122.436 Y138.96 E.01653
G1 X125.541 Y142.065 E.13552
G1 X125.005 Y142.065 E.01653
G1 X122.436 Y139.495 E.11214
G1 X122.436 Y140.031 E.01653
G1 X124.469 Y142.065 E.08876
G1 X123.934 Y142.065 E.01653
G1 X122.436 Y140.567 E.06538
G1 X122.436 Y141.103 E.01653
G1 X123.398 Y142.065 E.042
G1 X122.863 Y142.065 E.01653
G1 X122.266 Y141.469 E.02602
; WIPE_START
G1 F9504.448
G1 X122.863 Y142.065 E-.32039
G1 X123.398 Y142.065 E-.20353
G1 X122.959 Y141.625 E-.23608
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.094 Y142.475 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280021
G1 F8510
M204 S6000
G1 X133.707 Y142.475 E.10844
G2 X133.795 Y142.466 I-.014 J-.605 E.00171
; LINE_WIDTH: 0.242882
G2 X133.881 Y142.444 I-.104 J-.596 E.00145
; LINE_WIDTH: 0.20252
G1 X133.927 Y142.427 E.00064
; LINE_WIDTH: 0.163001
G1 X134.058 Y142.368 E.0014
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X133.927 Y142.427 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/42
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z3 I1.134 J-.441 P1  F42000
G1 X127.898 Y126.903 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X127.898 Y127.548 E.0214
G1 X125.302 Y127.548 E.08611
G1 X125.302 Y126.903 E.0214
G1 X127.838 Y126.903 E.08412
M204 S250
G1 X128.29 Y126.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X133.91 Y126.84 E.17269
G1 X133.91 Y128.06 E.03749
G1 X128.29 Y128.06 E.17269
G1 X128.29 Y126.9 E.03564
; WIPE_START
M204 S6000
G1 X130.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.166 Y129.097 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X128.102 Y129.097 E.00212
G1 X128.102 Y128.452 E.0214
G1 X130.698 Y128.452 E.08611
G1 X130.698 Y129.097 E.0214
G1 X128.226 Y129.097 E.082
; WIPE_START
G1 X128.102 Y129.097 E-.04708
G1 X128.102 Y128.452 E-.24516
G1 X129.333 Y128.452 E-.46776
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.71 Y127.94 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X127.71 Y129.16 E.03749
G1 X122.09 Y129.16 E.17269
G1 X122.09 Y127.94 E.03749
G1 X127.65 Y127.94 E.17084
; WIPE_START
M204 S6000
G1 X127.71 Y129.16 E-.46416
G1 X126.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.622 Y130.685 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X122.622 Y139.903 E.30575
G1 X130.698 Y139.903 E.26789
G1 X130.698 Y140.548 E.0214
G1 X127.898 Y140.548 E.09288
G1 X127.898 Y142.397 E.06135
G1 X122.262 Y142.393 E.18697
G3 X122.103 Y142.202 I.05 J-.203 E.00882
G1 X122.102 Y129.552 E.41963
G1 X122.622 Y129.552 E.01725
G1 X122.622 Y130.625 E.03561
; WIPE_START
G1 X122.622 Y132.625 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.921 Y138.932 Z3.2 F42000
G1 X128.29 Y140.94 Z3.2
G1 Z2.8
M73 P60 R6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X133.91 Y140.94 E.17269
G1 X133.91 Y142.16 E.03749
G1 X128.29 Y142.16 E.17269
G1 X128.29 Y141 E.03564
; WIPE_START
M204 S6000
G1 X130.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.534 Y133.384 Z3.2 F42000
G1 X127.71 Y115.06 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X122.09 Y115.06 E.17269
G1 X122.09 Y113.84 E.03749
G1 X127.71 Y113.84 E.17269
G1 X127.71 Y115 E.03564
; WIPE_START
M204 S6000
G1 X125.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.004 Y121.331 Z3.2 F42000
G1 X133.487 Y126.448 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X133.378 Y126.448 E.00361
G1 X133.378 Y116.097 E.34335
G1 X125.302 Y116.097 E.26789
G1 X125.302 Y115.452 E.0214
G1 X128.102 Y115.452 E.09288
G1 X128.102 Y113.603 E.06134
G1 X133.738 Y113.607 E.18697
G1 X133.853 Y113.675 E.00441
G1 X133.897 Y113.79 E.0041
G1 X133.898 Y126.448 E.41987
G1 X133.547 Y126.448 E.01165
; WIPE_START
G1 X133.378 Y126.448 E-.06413
G1 X133.378 Y124.617 E-.69588
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.236 Y127.31 Z3.2 F42000
G1 X124.91 Y127.81 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X124.91 Y115.19 E.38778
G1 X121.94 Y115.19 E.09126
G1 X121.94 Y115.665 E.0146
G1 X121.71 Y115.665 E.00706
G1 X121.711 Y113.771 E.05819
G3 X122.274 Y113.211 I.594 J.034 E.02671
G1 X133.757 Y113.213 E.35284
G3 X134.289 Y113.771 I-.059 J.589 E.02582
G1 X134.29 Y128.665 E.45765
G1 X134.06 Y128.665 E.00707
G1 X134.06 Y128.19 E.0146
G1 X131.09 Y128.19 E.09126
G1 X131.09 Y140.81 E.38778
G1 X134.06 Y140.81 E.09126
G1 X134.06 Y140.335 E.0146
G1 X134.29 Y140.335 E.00706
G1 X134.289 Y142.229 E.05819
G3 X133.726 Y142.789 I-.594 J-.034 E.02671
G1 X122.305 Y142.79 E.35093
G3 X121.711 Y142.226 I.012 J-.608 E.02761
G1 X121.71 Y127.335 E.45757
G1 X121.94 Y127.335 E.00707
G1 X121.94 Y127.81 E.0146
G1 X124.85 Y127.81 E.08942
; WIPE_START
M204 S6000
G1 X124.859 Y125.81 E-.76
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


G1 X125.506 Y127.225 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.28101
G1 F11734
M204 S6000
G1 X127.694 Y127.225 E.04247
M204 S10000
G1 X128 Y127.744 F42000
; LINE_WIDTH: 0.23088
G1 F11734
M204 S6000
G1 X128 Y128.256 E.00784
M204 S10000
G1 X128.306 Y128.775 F42000
; LINE_WIDTH: 0.28101
G1 F11734
M204 S6000
G1 X130.494 Y128.775 E.04247
; WIPE_START
G1 F15000
G1 X128.494 Y128.775 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.155 Y125.778 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S2000
G1 X132.3 Y126.633 E.03716
G1 X131.767 Y126.633
G1 X133.155 Y125.244 E.06033
G1 X133.155 Y124.711
G1 X131.234 Y126.633 E.0835
G1 X130.7 Y126.633
G1 X133.155 Y124.178 E.10667
G1 X133.155 Y123.645
G1 X130.167 Y126.633 E.12985
G1 X129.634 Y126.633
G1 X133.155 Y123.111 E.15302
G1 X133.155 Y122.578
G1 X129.101 Y126.633 E.17619
G1 X128.567 Y126.633
G1 X133.155 Y122.045 E.19936
G1 X133.155 Y121.512
G1 X127.987 Y126.68 E.22461
G1 X127.501 Y126.632
G1 X133.155 Y120.978 E.24569
G1 X133.155 Y120.445
G1 X126.968 Y126.632 E.26886
G1 X126.435 Y126.632
G1 X133.155 Y119.912 E.29203
G1 X133.155 Y119.378
G1 X125.902 Y126.632 E.31521
G1 X125.32 Y126.68
G1 X133.155 Y118.845 E.34047
G1 X133.155 Y118.312
G1 X125.117 Y126.35 E.34929
G1 X125.117 Y125.817
G1 X133.155 Y117.779 E.34929
G1 X133.155 Y117.245
G1 X125.117 Y125.283 E.34929
G1 X125.117 Y124.75
G1 X133.155 Y116.712 E.34929
G1 X133.014 Y116.32
G1 X125.117 Y124.217 E.34317
G1 X125.117 Y123.684
G1 X132.433 Y116.368 E.3179
G1 X131.9 Y116.368
G1 X125.117 Y123.15 E.29473
G1 X125.117 Y122.617
G1 X131.367 Y116.368 E.27156
G1 X130.833 Y116.368
G1 X125.117 Y122.084 E.24839
G1 X125.117 Y121.551
G1 X130.3 Y116.368 E.22521
G1 X129.767 Y116.368
G1 X125.117 Y121.017 E.20204
G1 X125.117 Y120.484
G1 X129.234 Y116.368 E.17887
G1 X128.7 Y116.368
G1 X125.117 Y119.951 E.15569
G1 X125.117 Y119.418
G1 X128.167 Y116.368 E.13252
G1 X127.634 Y116.368
G1 X125.117 Y118.884 E.10935
G1 X125.117 Y118.351
G1 X127.101 Y116.368 E.08618
G1 X126.567 Y116.368
G1 X125.117 Y117.818 E.063
G1 X125.117 Y117.284
G1 X126.034 Y116.368 E.03983
G1 X125.542 Y116.327
G1 X125.117 Y116.751 E.01844
; WIPE_START
M204 S6000
G1 X125.542 Y116.327 E-.228
G1 X126.034 Y116.368 E-.18774
G1 X125.393 Y117.008 E-.34426
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.227 Y124.639 Z3.2 F42000
G1 X125.188 Y126.42 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.150217
G1 F11734
M204 S6000
G1 X125.15 Y126.51 E.00085
G1 X125.15 Y126.699 E.00165
; WIPE_START
G1 F15000
G1 X125.15 Y126.51 E-.50094
G1 X125.188 Y126.42 E-.25906
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.362 Y129.756 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.155524
G1 F11734
M204 S6000
G1 X122.363 Y140.106 E.09497
M204 S10000
G1 X123.35 Y141.15 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.62251
G1 F6211.288
M204 S6000
G1 X126.564 Y141.15 E.15175
M204 S10000
G1 X126.956 Y140.672 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X123.037 Y140.672 E.12043
G1 X123 Y140.749 E.00263
G1 X122.872 Y140.794 E.00418
G1 X122.872 Y141.629 E.02563
G1 X127.129 Y141.628 E.13079
M73 P61 R6
G1 X127.129 Y140.954 E.02072
G1 X127.021 Y140.884 E.00395
G1 X126.974 Y140.729 E.00497
M204 S10000
G1 X127.302 Y140.295 F42000
G1 F9547.299
M204 S6000
G1 X122.832 Y140.295 E.13735
G1 X122.763 Y140.456 E.0054
G1 X122.495 Y140.498 E.00833
G1 X122.495 Y142.006 E.04632
G1 X127.506 Y142.005 E.15396
G1 X127.506 Y140.773 E.03787
G1 X127.334 Y140.674 E.00608
G1 X127.307 Y140.355 E.00986
M204 S10000
G1 X127.694 Y140.225 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.28102
G1 F11734
M204 S6000
M73 P61 R5
G1 X130.494 Y140.225 E.05432
; WIPE_START
G1 F15000
G1 X128.494 Y140.225 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.883 Y139.249 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S2000
G1 X130.458 Y139.673 E.01844
G1 X129.966 Y139.632
G1 X130.883 Y138.715 E.03984
G1 X130.883 Y138.182
G1 X129.433 Y139.632 E.06301
G1 X128.899 Y139.632
G1 X130.883 Y137.649 E.08618
G1 X130.883 Y137.116
G1 X128.366 Y139.632 E.10935
G1 X127.833 Y139.632
G1 X130.883 Y136.582 E.13253
G1 X130.883 Y136.049
G1 X127.3 Y139.632 E.1557
G1 X126.766 Y139.632
G1 X130.883 Y135.516 E.17887
G1 X130.883 Y134.983
G1 X126.233 Y139.632 E.20205
G1 X125.7 Y139.632
G1 X130.883 Y134.449 E.22522
G1 X130.883 Y133.916
G1 X125.167 Y139.632 E.24839
G1 X124.633 Y139.632
G1 X130.883 Y133.383 E.27156
G1 X130.883 Y132.85
G1 X124.1 Y139.632 E.29474
G1 X123.567 Y139.632
G1 X130.883 Y132.316 E.31791
G1 X130.883 Y131.783
G1 X122.985 Y139.68 E.34317
G1 X122.845 Y139.288
G1 X130.883 Y131.25 E.34929
G1 X130.883 Y130.717
G1 X122.845 Y138.754 E.34929
G1 X122.845 Y138.221
G1 X130.883 Y130.183 E.34929
G1 X130.883 Y129.65
G1 X122.845 Y137.688 E.34929
G1 X122.845 Y137.155
G1 X130.68 Y129.32 E.34047
G1 X130.098 Y129.368
G1 X122.845 Y136.621 E.3152
G1 X122.845 Y136.088
G1 X129.565 Y129.368 E.29203
G1 X129.032 Y129.368
G1 X122.845 Y135.555 E.26885
G1 X122.845 Y135.022
G1 X128.498 Y129.368 E.24568
G1 X128.013 Y129.32
G1 X122.845 Y134.488 E.2246
G1 X122.845 Y133.955
G1 X127.432 Y129.367 E.19936
G1 X126.899 Y129.367
G1 X122.845 Y133.422 E.17619
G1 X122.845 Y132.889
G1 X126.366 Y129.367 E.15301
G1 X125.833 Y129.367
G1 X122.845 Y132.355 E.12984
G1 X122.845 Y131.822
G1 X125.299 Y129.367 E.10667
G1 X124.766 Y129.367
G1 X122.845 Y131.289 E.0835
G1 X122.845 Y130.756
G1 X124.233 Y129.367 E.06032
G1 X123.7 Y129.367
G1 X122.845 Y130.222 E.03715
M204 S10000
G1 X130.812 Y129.58 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.150332
G1 F11734
M204 S6000
G1 X130.85 Y129.49 E.00085
G1 X130.85 Y129.301 E.00165
; WIPE_START
G1 F15000
G1 X130.85 Y129.49 E-.50136
G1 X130.812 Y129.58 E-.25864
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.638 Y126.244 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.155524
G1 F11734
M204 S6000
G1 X133.637 Y115.894 E.09497
M204 S10000
G1 X129.376 Y114.85 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.62003
G1 F6237.979
M204 S6000
G1 X132.591 Y114.852 E.1512
M204 S10000
G1 X129.044 Y115.328 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X132.963 Y115.328 E.12043
G1 X133 Y115.251 E.00263
G1 X133.128 Y115.205 E.00417
G1 X133.128 Y114.375 E.02551
G1 X128.871 Y114.372 E.13079
G1 X128.871 Y115.046 E.02069
G1 X128.979 Y115.116 E.00396
G1 X129.026 Y115.271 E.00497
M204 S10000
G1 X128.698 Y115.705 F42000
G1 F9547.299
M204 S6000
G1 X133.168 Y115.705 E.13735
G1 X133.237 Y115.544 E.0054
G1 X133.505 Y115.502 E.00833
G1 X133.505 Y113.998 E.04619
G1 X128.494 Y113.995 E.15396
G1 X128.494 Y115.242 E.03831
G1 X128.666 Y115.326 E.00587
G1 X128.693 Y115.645 E.00986
M204 S10000
G1 X128.305 Y115.775 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.28102
G1 F11734
M204 S6000
G1 X125.506 Y115.775 E.05432
; WIPE_START
G1 F15000
G1 X127.506 Y115.775 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.906 Y113.525 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.279644
G1 F11734
M204 S6000
G1 X122.293 Y113.525 E.10827
G2 X122.159 Y113.544 I.022 J.665 E.00262
; LINE_WIDTH: 0.222205
G1 X122.09 Y113.566 E.00106
; LINE_WIDTH: 0.17791
G1 X121.949 Y113.626 E.00169
; WIPE_START
G1 F15000
G1 X122.09 Y113.566 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.642 Y121.039 Z3.2 F42000
G1 X128.094 Y142.475 Z3.2
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.279838
G1 F11734
M204 S6000
G1 X133.707 Y142.475 E.10836
G2 X133.836 Y142.458 I-.023 J-.673 E.00251
; LINE_WIDTH: 0.223239
G1 X133.912 Y142.434 E.00117
; LINE_WIDTH: 0.177417
G1 X134.051 Y142.374 E.00166
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X133.912 Y142.434 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/42
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z3.2 I1.135 J-.438 P1  F42000
G1 X127.898 Y126.84 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4557
M204 S6000
G1 X127.898 Y127.548 E.02348
G1 X125.302 Y127.548 E.08611
G1 X125.302 Y126.427 E.03718
G1 X127.898 Y126.427 E.08611
G1 X127.898 Y126.78 E.01171
M204 S250
G1 X128.29 Y126.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4557
M204 S5000
G1 X133.91 Y126.84 E.17269
G1 X133.91 Y128.06 E.03749
G1 X128.29 Y128.06 E.17269
G1 X128.29 Y126.9 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.102 Y128.452 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4557
M204 S6000
G1 X130.698 Y128.452 E.08611
G1 X130.698 Y129.573 E.03718
G1 X128.102 Y129.573 E.08611
G1 X128.102 Y128.512 E.03519
M204 S250
G1 X127.71 Y127.94 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4557
M204 S5000
G1 X127.71 Y129.16 E.03749
G1 X122.09 Y129.16 E.17269
G1 X122.09 Y127.94 E.03749
G1 X127.65 Y127.94 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.71 Y129.16 E-.46416
G1 X126.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.098 Y129.573 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4557
M204 S6000
G1 X123.098 Y139.427 E.32688
G1 X130.698 Y139.427 E.25211
G1 X130.698 Y140.548 E.03718
G1 X127.898 Y140.548 E.09288
G1 X127.898 Y142.397 E.06135
G1 X122.262 Y142.393 E.18697
G3 X122.103 Y142.202 I.049 J-.202 E.00883
G1 X122.102 Y129.552 E.41963
G1 X123.059 Y129.552 E.03173
; WIPE_START
G1 F8843.478
G1 X123.067 Y131.552 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.778 Y138.222 Z3.4 F42000
G1 X128.29 Y140.94 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4557
M204 S5000
G1 X133.91 Y140.94 E.17269
G1 X133.91 Y142.16 E.03749
G1 X128.29 Y142.16 E.17269
G1 X128.29 Y141 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.534 Y133.384 Z3.4 F42000
G1 X127.71 Y115.06 Z3.4
G1 Z3
G1 E.8 F1800
G1 F4557
M204 S5000
G1 X122.09 Y115.06 E.17269
G1 X122.09 Y113.84 E.03749
G1 X127.71 Y113.84 E.17269
G1 X127.71 Y115 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.302 Y116.573 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4557
M204 S6000
G1 X125.302 Y115.452 E.03718
G1 X128.102 Y115.452 E.09288
G1 X128.102 Y113.603 E.06134
G1 X133.738 Y113.607 E.18697
G1 X133.852 Y113.675 E.00441
G1 X133.897 Y113.79 E.00411
G1 X133.898 Y126.448 E.41987
G1 X132.902 Y126.448 E.03303
G1 X132.902 Y116.573 E.32757
G1 X125.362 Y116.573 E.25012
; WIPE_START
G1 F8843.478
M73 P62 R5
G1 X125.302 Y115.452 E-.42654
G1 X126.18 Y115.452 E-.33346
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.789 Y122.957 Z3.4 F42000
G1 X123.49 Y129.965 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4557
M204 S5000
G1 X123.49 Y139.035 E.2787
G1 X131.09 Y139.035 E.23353
G1 X131.09 Y140.81 E.05454
G1 X134.06 Y140.81 E.09126
G1 X134.06 Y140.335 E.0146
G1 X134.29 Y140.335 E.00706
G1 X134.289 Y142.229 E.05819
G3 X133.726 Y142.789 I-.594 J-.034 E.02671
G1 X122.305 Y142.79 E.35093
G3 X121.711 Y142.226 I.012 J-.608 E.02762
G1 X121.71 Y127.335 E.45757
G1 X121.94 Y127.335 E.00707
G1 X121.94 Y127.81 E.0146
G1 X124.91 Y127.81 E.09126
G1 X124.91 Y126.035 E.05454
G1 X132.51 Y126.035 E.23353
G1 X132.51 Y116.965 E.2787
G1 X124.91 Y116.965 E.23353
G1 X124.91 Y115.19 E.05454
G1 X121.94 Y115.19 E.09126
G1 X121.94 Y115.665 E.0146
G1 X121.71 Y115.665 E.00706
G1 X121.711 Y113.771 E.05819
G3 X122.274 Y113.211 I.608 J.048 E.02657
G1 X133.757 Y113.213 E.35284
G3 X134.289 Y113.771 I-.059 J.589 E.02582
G1 X134.29 Y128.665 E.45765
G1 X134.06 Y128.665 E.00707
G1 X134.06 Y128.19 E.0146
G1 X131.09 Y128.19 E.09126
G1 X131.09 Y129.965 E.05454
G1 X123.55 Y129.965 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.537 Y131.965 E-.76
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


G1 X122.6 Y129.756 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.631239
G1 F4557
M204 S6000
G1 X122.6 Y139.631 E.47341
M204 S10000
G1 X126.676 Y140.649 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.570567
G1 F4557
M204 S6000
G1 X123.693 Y140.649 E.12829
G1 X123.456 Y140.795 E.01197
G1 X123.324 Y140.817 E.00573
G1 X123.324 Y141.176 E.01544
G1 X126.676 Y141.176 E.14412
G1 X126.676 Y140.709 E.0201
M204 S10000
G1 X127.253 Y140.196 F42000
; LINE_WIDTH: 0.41999
G1 F4557
M204 S6000
G1 X123.487 Y140.196 E.11571
G1 X123.425 Y140.31 E.00398
G1 X123.12 Y140.4 E.00979
G1 X122.872 Y140.4 E.00761
G1 X122.872 Y141.629 E.03777
G1 X127.129 Y141.628 E.13079
G1 X127.129 Y140.344 E.03945
G1 X127.215 Y140.242 E.0041
M204 S10000
G1 X127.694 Y139.809 F42000
; LINE_WIDTH: 0.41384
G1 F4557
M204 S6000
G3 X123.308 Y139.819 I-2.55 J-155.453 E.13258
G1 X123.222 Y139.993 E.00586
G1 X123.12 Y140.023 E.00321
G1 X122.495 Y140.023 E.01888
G1 X122.495 Y142.006 E.05995
G1 X127.506 Y142.005 E.15145
G1 X127.506 Y140.344 E.05021
G1 X127.694 Y140.166 E.00785
G1 X130.316 Y140.166 E.07924
G1 X130.316 Y139.809 E.01079
G1 X127.754 Y139.809 E.07742
; WIPE_START
G1 F9705.596
G1 X129.754 Y139.809 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.094 Y142.475 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280103
G1 F4557
M204 S6000
G1 X133.756 Y142.472 E.10942
; LINE_WIDTH: 0.254699
G1 X133.867 Y142.449 E.00195
; LINE_WIDTH: 0.213451
G1 X133.912 Y142.434 E.00066
; LINE_WIDTH: 0.177387
G1 X134.051 Y142.374 E.00166
; WIPE_START
G1 F15000
G1 X133.912 Y142.434 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.684 Y135.517 Z3.4 F42000
G1 X127.906 Y129.563 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.45586
G1 F4557
M204 S6000
G1 X123.294 Y129.563 E.15519
; WIPE_START
G1 F8717.973
G1 X125.294 Y129.563 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.516 Y127.166 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.39982
G1 F4557
M204 S6000
G1 X127.516 Y126.809 E.01038
G1 X125.684 Y126.809 E.05328
G1 X125.684 Y127.166 E.01038
G1 X127.456 Y127.166 E.05153
M204 S10000
G1 X128 Y127.744 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
G1 F4557
M204 S6000
G1 X128 Y128.256 E.00784
M204 S10000
G1 X128.484 Y128.834 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.399825
G1 F4557
M204 S6000
G1 X128.484 Y129.191 E.01038
G1 X130.316 Y129.191 E.05328
G1 X130.316 Y128.834 E.01038
G1 X128.544 Y128.834 E.05153
; WIPE_START
G1 F10086.717
G1 X130.316 Y128.834 E-.67333
G1 X130.316 Y129.062 E-.08667
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.094 Y126.437 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.45586
G1 F4557
M204 S6000
G1 X132.706 Y126.437 E.15519
M204 S10000
G1 X133.4 Y126.244 F42000
; LINE_WIDTH: 0.631239
G1 F4557
M204 S6000
G1 X133.4 Y116.369 E.47341
M204 S10000
G1 X129.323 Y115.352 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.569344
G1 F4557
M204 S6000
G1 X132.307 Y115.352 E.12801
G1 X132.546 Y115.205 E.012
G1 X132.676 Y115.183 E.00569
G1 X132.676 Y114.827 E.01531
G1 X129.323 Y114.825 E.14384
G1 X129.323 Y115.292 E.02003
M204 S10000
G1 X128.747 Y115.804 F42000
; LINE_WIDTH: 0.41999
G1 F4557
M204 S6000
G1 X132.512 Y115.804 E.11571
G1 X132.574 Y115.69 E.00397
G1 X132.88 Y115.6 E.0098
G1 X133.128 Y115.6 E.00761
G1 X133.128 Y114.375 E.03764
G1 X128.871 Y114.372 E.13079
G1 X128.871 Y115.656 E.03942
G1 X128.785 Y115.758 E.0041
M204 S10000
G1 X128.306 Y116.191 F42000
; LINE_WIDTH: 0.41384
G1 F4557
M204 S6000
G3 X132.692 Y116.181 I2.55 J155.453 E.13258
G1 X132.778 Y116.007 E.00586
G1 X132.88 Y115.977 E.00321
G1 X133.505 Y115.977 E.01888
G1 X133.505 Y113.998 E.05981
G1 X128.494 Y113.995 E.15145
G1 X128.494 Y115.656 E.05019
G1 X128.306 Y115.834 E.00785
G1 X125.684 Y115.834 E.07924
G1 X125.684 Y116.191 E.01079
G1 X128.246 Y116.191 E.07742
; WIPE_START
G1 F9705.598
G1 X126.246 Y116.191 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.906 Y113.525 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279645
G1 F4557
M204 S6000
G1 X122.293 Y113.525 E.10827
G2 X122.159 Y113.544 I.022 J.663 E.00262
; LINE_WIDTH: 0.222335
G1 X122.09 Y113.566 E.00106
; LINE_WIDTH: 0.178069
G1 X121.949 Y113.626 E.00169
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X122.09 Y113.566 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/42
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z3.4 I-1.115 J.488 P1  F42000
G1 X127.898 Y126.84 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4560
M204 S6000
G1 X127.898 Y127.548 E.02348
G1 X125.302 Y127.548 E.08611
G1 X125.302 Y126.427 E.03718
G1 X127.898 Y126.427 E.08611
G1 X127.898 Y126.78 E.01171
M204 S250
G1 X128.29 Y126.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4560
M204 S5000
G1 X133.91 Y126.84 E.17269
G1 X133.91 Y128.06 E.03749
G1 X128.29 Y128.06 E.17269
G1 X128.29 Y126.9 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.102 Y128.452 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4560
M204 S6000
G1 X130.698 Y128.452 E.08611
M73 P63 R5
G1 X130.698 Y129.573 E.03718
G1 X128.102 Y129.573 E.08611
G1 X128.102 Y128.512 E.03519
M204 S250
G1 X127.71 Y127.94 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4560
M204 S5000
G1 X127.71 Y129.16 E.03749
G1 X122.09 Y129.16 E.17269
G1 X122.09 Y127.94 E.03749
G1 X127.65 Y127.94 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.71 Y129.16 E-.46416
G1 X126.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.098 Y129.573 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4560
M204 S6000
G1 X123.098 Y139.427 E.32688
G1 X130.698 Y139.427 E.25211
G1 X130.698 Y140.548 E.03718
G1 X127.898 Y140.548 E.09288
G1 X127.898 Y142.397 E.06135
G1 X122.262 Y142.393 E.18697
G3 X122.103 Y142.202 I.043 J-.197 E.00888
G1 X122.102 Y129.552 E.41963
G1 X123.059 Y129.552 E.03173
; WIPE_START
G1 F8843.478
G1 X123.067 Y131.552 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.778 Y138.222 Z3.6 F42000
G1 X128.29 Y140.94 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4560
M204 S5000
G1 X133.91 Y140.94 E.17269
G1 X133.91 Y142.16 E.03749
G1 X128.29 Y142.16 E.17269
G1 X128.29 Y141 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.534 Y133.384 Z3.6 F42000
G1 X127.71 Y115.06 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F4560
M204 S5000
G1 X122.09 Y115.06 E.17269
G1 X122.09 Y113.84 E.03749
G1 X127.71 Y113.84 E.17269
G1 X127.71 Y115 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.302 Y116.573 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4560
M204 S6000
G1 X125.302 Y115.452 E.03718
G1 X128.102 Y115.452 E.09288
G1 X128.102 Y113.603 E.06134
G1 X133.739 Y113.607 E.18697
G1 X133.852 Y113.675 E.00441
G1 X133.897 Y113.79 E.00411
G1 X133.898 Y126.448 E.41987
G1 X132.902 Y126.448 E.03303
G1 X132.902 Y116.573 E.32757
G1 X125.362 Y116.573 E.25012
; WIPE_START
G1 F8843.478
G1 X125.302 Y115.452 E-.42654
G1 X126.18 Y115.452 E-.33346
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.789 Y122.957 Z3.6 F42000
G1 X123.49 Y129.965 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4560
M204 S5000
G1 X123.49 Y139.035 E.2787
G1 X131.09 Y139.035 E.23353
G1 X131.09 Y140.81 E.05454
G1 X134.06 Y140.81 E.09126
G1 X134.06 Y140.335 E.0146
G1 X134.29 Y140.335 E.00706
G1 X134.289 Y142.229 E.05819
G3 X133.726 Y142.789 I-.591 J-.031 E.02675
G1 X122.305 Y142.79 E.35093
G3 X121.711 Y142.226 I.012 J-.608 E.02761
G1 X121.71 Y127.335 E.45757
G1 X121.94 Y127.335 E.00707
G1 X121.94 Y127.81 E.0146
G1 X124.91 Y127.81 E.09126
G1 X124.91 Y126.035 E.05454
G1 X132.51 Y126.035 E.23353
G1 X132.51 Y116.965 E.2787
G1 X124.91 Y116.965 E.23353
G1 X124.91 Y115.19 E.05454
G1 X121.94 Y115.19 E.09126
G1 X121.94 Y115.665 E.0146
G1 X121.71 Y115.665 E.00706
G1 X121.711 Y113.771 E.05819
G3 X122.274 Y113.211 I.608 J.048 E.02657
G1 X133.757 Y113.213 E.35284
G3 X134.289 Y113.771 I-.059 J.589 E.02581
G1 X134.29 Y128.665 E.45765
G1 X134.06 Y128.665 E.00707
G1 X134.06 Y128.19 E.0146
G1 X131.09 Y128.19 E.09126
G1 X131.09 Y129.965 E.05454
G1 X123.55 Y129.965 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.537 Y131.965 E-.76
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


G1 X122.6 Y129.756 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.631239
G1 F4560
M204 S6000
G1 X122.6 Y139.631 E.47341
M204 S10000
G1 X126.676 Y140.649 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.570567
G1 F4560
M204 S6000
G1 X123.693 Y140.649 E.12829
G1 X123.456 Y140.795 E.01197
G1 X123.324 Y140.817 E.00573
G1 X123.324 Y141.176 E.01544
G1 X126.676 Y141.176 E.14412
G1 X126.676 Y140.709 E.0201
M204 S10000
G1 X127.253 Y140.196 F42000
; LINE_WIDTH: 0.41999
G1 F4560
M204 S6000
G1 X123.487 Y140.196 E.11571
G1 X123.425 Y140.31 E.00398
G1 X123.12 Y140.4 E.00979
G1 X122.872 Y140.4 E.00761
G1 X122.872 Y141.629 E.03777
G1 X127.129 Y141.628 E.13079
G1 X127.129 Y140.344 E.03945
G1 X127.215 Y140.242 E.0041
M204 S10000
G1 X127.694 Y139.809 F42000
; LINE_WIDTH: 0.41384
G1 F4560
M204 S6000
G3 X123.308 Y139.819 I-2.55 J-155.453 E.13258
G1 X123.222 Y139.993 E.00586
G1 X123.12 Y140.023 E.00321
G1 X122.495 Y140.023 E.01888
G1 X122.495 Y142.006 E.05995
G1 X127.506 Y142.005 E.15145
G1 X127.506 Y140.344 E.05021
G1 X127.694 Y140.166 E.00785
G1 X130.316 Y140.166 E.07924
G1 X130.316 Y139.809 E.01079
G1 X127.754 Y139.809 E.07742
; WIPE_START
G1 F9705.596
G1 X129.754 Y139.809 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.094 Y142.475 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.28002
G1 F4560
M204 S6000
G1 X133.707 Y142.475 E.10844
G2 X133.795 Y142.466 I-.013 J-.604 E.00172
; LINE_WIDTH: 0.236034
G2 X134.039 Y142.399 I-.334 J-1.68 E.00398
M204 S10000
G1 X134.052 Y142.372 F42000
; LINE_WIDTH: 0.171752
G1 F4560
M204 S6000
G1 X133.555 Y142.593 E.00571
; WIPE_START
G1 F15000
G1 X134.052 Y142.372 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.75 Y135.491 Z3.6 F42000
G1 X127.906 Y129.563 Z3.6
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.45586
G1 F4560
M204 S6000
G1 X123.294 Y129.563 E.15519
; WIPE_START
G1 F8717.973
G1 X125.294 Y129.563 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.516 Y127.166 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.39982
G1 F4560
M204 S6000
G1 X127.516 Y126.809 E.01038
G1 X125.684 Y126.809 E.05328
G1 X125.684 Y127.166 E.01038
G1 X127.456 Y127.166 E.05153
M204 S10000
G1 X128 Y127.744 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
G1 F4560
M204 S6000
G1 X128 Y128.256 E.00784
M204 S10000
G1 X128.484 Y128.834 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.399825
G1 F4560
M204 S6000
G1 X128.484 Y129.191 E.01038
G1 X130.316 Y129.191 E.05328
G1 X130.316 Y128.834 E.01038
G1 X128.544 Y128.834 E.05153
; WIPE_START
M73 P64 R5
G1 F10086.717
G1 X130.316 Y128.834 E-.67333
G1 X130.316 Y129.062 E-.08667
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.094 Y126.437 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.45586
G1 F4560
M204 S6000
G1 X132.706 Y126.437 E.15519
M204 S10000
G1 X133.4 Y126.244 F42000
; LINE_WIDTH: 0.631239
G1 F4560
M204 S6000
G1 X133.4 Y116.369 E.47341
M204 S10000
G1 X129.323 Y115.352 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.569349
G1 F4560
M204 S6000
G1 X132.307 Y115.352 E.12801
G1 X132.546 Y115.205 E.012
G1 X132.676 Y115.183 E.00569
G1 X132.676 Y114.827 E.01531
G1 X129.323 Y114.825 E.14384
G1 X129.323 Y115.292 E.02004
M204 S10000
G1 X128.747 Y115.804 F42000
; LINE_WIDTH: 0.41999
G1 F4560
M204 S6000
G1 X132.512 Y115.804 E.11571
G1 X132.574 Y115.69 E.00397
G1 X132.88 Y115.6 E.0098
G1 X133.128 Y115.6 E.00761
G1 X133.128 Y114.375 E.03764
G1 X128.871 Y114.372 E.13079
G1 X128.871 Y115.656 E.03943
G1 X128.785 Y115.758 E.0041
M204 S10000
G1 X128.306 Y116.191 F42000
; LINE_WIDTH: 0.41384
G1 F4560
M204 S6000
G3 X132.692 Y116.181 I2.55 J155.453 E.13258
G1 X132.778 Y116.007 E.00586
G1 X132.88 Y115.977 E.00321
G1 X133.505 Y115.977 E.01888
G1 X133.505 Y113.998 E.05981
G1 X128.494 Y113.995 E.15145
G1 X128.494 Y115.656 E.05019
G1 X128.306 Y115.834 E.00785
G1 X125.684 Y115.834 E.07924
G1 X125.684 Y116.191 E.01079
G1 X128.246 Y116.191 E.07742
; WIPE_START
G1 F9705.598
G1 X126.246 Y116.191 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.906 Y113.525 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279655
G1 F4560
M204 S6000
G1 X122.293 Y113.525 E.10828
G2 X122.159 Y113.544 I.022 J.664 E.00262
; LINE_WIDTH: 0.216334
G2 X121.956 Y113.612 I.479 J1.749 E.00303
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X122.159 Y113.544 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/42
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z3.6 I-1.117 J.482 P1  F42000
G1 X127.898 Y126.84 Z3.6
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3910
M204 S6000
G1 X127.898 Y127.548 E.02348
G1 X125.302 Y127.548 E.08611
G1 X125.302 Y126.427 E.03718
G1 X127.898 Y126.427 E.08611
G1 X127.898 Y126.78 E.01171
M204 S250
G1 X128.29 Y126.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3910
M204 S5000
G1 X133.91 Y126.84 E.17269
G1 X133.91 Y128.06 E.03749
G1 X128.29 Y128.06 E.17269
G1 X128.29 Y126.9 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.102 Y128.452 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3910
M204 S6000
G1 X130.698 Y128.452 E.08611
G1 X130.698 Y129.573 E.03718
G1 X128.102 Y129.573 E.08611
G1 X128.102 Y128.512 E.03519
M204 S250
G1 X127.71 Y127.94 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3910
M204 S5000
G1 X127.71 Y129.16 E.03749
G1 X122.09 Y129.16 E.17269
G1 X122.09 Y127.94 E.03749
G1 X127.65 Y127.94 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.71 Y129.16 E-.46416
G1 X126.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.098 Y129.573 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3910
M204 S6000
G1 X123.098 Y139.427 E.32688
G1 X130.698 Y139.427 E.25211
G1 X130.698 Y140.548 E.03718
G1 X127.898 Y140.548 E.09288
G1 X127.898 Y142.397 E.06135
G1 X122.243 Y142.389 E.1876
G3 X122.103 Y142.202 I.071 J-.198 E.00819
G1 X122.102 Y129.552 E.41963
G1 X123.059 Y129.552 E.03173
; WIPE_START
G1 F8843.478
G1 X123.067 Y131.552 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.778 Y138.222 Z3.8 F42000
G1 X128.29 Y140.94 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3910
M204 S5000
G1 X133.91 Y140.94 E.17269
G1 X133.91 Y142.16 E.03749
G1 X128.29 Y142.16 E.17269
G1 X128.29 Y141 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.534 Y133.384 Z3.8 F42000
G1 X127.71 Y115.06 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F3910
M204 S5000
G1 X122.09 Y115.06 E.17269
G1 X122.09 Y113.84 E.03749
G1 X127.71 Y113.84 E.17269
G1 X127.71 Y115 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.302 Y116.573 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3910
M204 S6000
G1 X125.302 Y115.452 E.03718
G1 X128.102 Y115.452 E.09288
G1 X128.102 Y113.603 E.06134
G1 X133.716 Y113.603 E.18623
G1 X133.839 Y113.661 E.00451
G1 X133.884 Y113.727 E.00265
G1 X133.897 Y113.79 E.00215
G1 X133.898 Y126.448 E.41987
G1 X132.902 Y126.448 E.03303
G1 X132.902 Y116.573 E.32757
G1 X125.362 Y116.573 E.25012
; WIPE_START
G1 F8843.478
G1 X125.302 Y115.452 E-.42654
G1 X126.18 Y115.452 E-.33346
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.789 Y122.957 Z3.8 F42000
G1 X123.49 Y129.965 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3910
M204 S5000
G1 X123.49 Y139.035 E.2787
G1 X131.09 Y139.035 E.23353
G1 X131.09 Y140.81 E.05454
G1 X134.06 Y140.81 E.09126
G1 X134.06 Y140.335 E.0146
G1 X134.29 Y140.335 E.00706
G1 X134.289 Y142.229 E.05819
G3 X133.726 Y142.789 I-.594 J-.034 E.02671
G1 X122.305 Y142.79 E.35093
G3 X121.711 Y142.226 I.013 J-.609 E.02761
G1 X121.71 Y127.335 E.45757
G1 X121.94 Y127.335 E.00707
G1 X121.94 Y127.81 E.0146
G1 X124.91 Y127.81 E.09126
G1 X124.91 Y126.035 E.05454
G1 X132.51 Y126.035 E.23353
G1 X132.51 Y116.965 E.2787
G1 X124.91 Y116.965 E.23353
G1 X124.91 Y115.19 E.05454
G1 X121.94 Y115.19 E.09126
G1 X121.94 Y115.665 E.0146
G1 X121.71 Y115.665 E.00706
G1 X121.711 Y113.771 E.05819
G3 X122.274 Y113.211 I.608 J.048 E.02657
G1 X133.757 Y113.213 E.35284
G3 X134.289 Y113.771 I-.059 J.589 E.02581
G1 X134.29 Y128.665 E.45765
G1 X134.06 Y128.665 E.00707
G1 X134.06 Y128.19 E.0146
G1 X131.09 Y128.19 E.09126
G1 X131.09 Y129.965 E.05454
G1 X123.55 Y129.965 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.537 Y131.965 E-.76
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


G1 X122.6 Y129.756 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.631239
G1 F3910
M204 S6000
G1 X122.6 Y139.631 E.47341
M204 S10000
G1 X123.255 Y142.05 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3910
M204 S6000
G1 X122.451 Y142.05 E.02665
G1 X122.451 Y141.225 E.02736
G1 X123.901 Y139.775 E.06799
G1 X124.423 Y139.775 E.01734
G1 X126.697 Y142.049 E.10668
G1 X127.55 Y142.049 E.02827
G1 X127.55 Y141.273 E.02574
; WIPE_START
G1 F8843.478
G1 X127.55 Y142.049 E-.2949
G1 X126.697 Y142.049 E-.32387
G1 X126.435 Y141.786 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.094 Y142.475 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280103
G1 F3910
M204 S6000
G1 X133.756 Y142.472 E.10943
; LINE_WIDTH: 0.254645
G1 X133.867 Y142.449 E.00195
; LINE_WIDTH: 0.213427
G1 X133.912 Y142.434 E.00066
; LINE_WIDTH: 0.17738
G1 X134.051 Y142.374 E.00166
; WIPE_START
G1 F15000
G1 X133.912 Y142.434 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.684 Y135.517 Z3.8 F42000
G1 X127.906 Y129.563 Z3.8
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.45586
G1 F3910
M204 S6000
G1 X123.294 Y129.563 E.15519
; WIPE_START
G1 F8717.973
G1 X125.294 Y129.563 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.516 Y127.166 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.39982
G1 F3910
M204 S6000
G1 X127.516 Y126.809 E.01038
G1 X125.684 Y126.809 E.05328
G1 X125.684 Y127.166 E.01038
G1 X127.456 Y127.166 E.05153
M204 S10000
G1 X128 Y127.744 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
G1 F3910
M204 S6000
G1 X128 Y128.256 E.00784
M204 S10000
G1 X128.484 Y128.834 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.399825
G1 F3910
M204 S6000
M73 P65 R5
G1 X128.484 Y129.191 E.01038
G1 X130.316 Y129.191 E.05328
G1 X130.316 Y128.834 E.01038
G1 X128.544 Y128.834 E.05153
; WIPE_START
G1 F10086.717
G1 X130.316 Y128.834 E-.67333
G1 X130.316 Y129.062 E-.08667
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.094 Y126.437 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.45586
G1 F3910
M204 S6000
G1 X132.706 Y126.437 E.15519
M204 S10000
G1 X133.4 Y126.244 F42000
; LINE_WIDTH: 0.631239
G1 F3910
M204 S6000
G1 X133.4 Y116.369 E.47341
M204 S10000
G1 X132.744 Y113.951 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3910
M204 S6000
G1 X133.549 Y113.952 E.02669
G1 X133.549 Y114.775 E.02733
G1 X132.099 Y116.225 E.06799
G1 X131.577 Y116.225 E.01734
G1 X129.303 Y113.951 E.10665
G1 X128.45 Y113.951 E.02829
G1 X128.45 Y114.727 E.02573
; WIPE_START
G1 F8843.478
G1 X128.45 Y113.951 E-.29471
G1 X129.303 Y113.951 E-.32406
G1 X129.566 Y114.214 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.906 Y113.525 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279667
G1 F3910
M204 S6000
G1 X122.293 Y113.525 E.10828
G2 X122.159 Y113.544 I.021 J.662 E.00261
; LINE_WIDTH: 0.22247
G1 X122.09 Y113.566 E.00107
; LINE_WIDTH: 0.178098
G1 X121.949 Y113.626 E.00169
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X122.09 Y113.566 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/42
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z3.8 I-1.115 J.488 P1  F42000
G1 X127.898 Y126.84 Z3.8
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3928
M204 S6000
G1 X127.898 Y127.548 E.02348
G1 X125.302 Y127.548 E.08611
G1 X125.302 Y126.427 E.03718
G1 X127.898 Y126.427 E.08611
G1 X127.898 Y126.78 E.01171
M204 S250
G1 X128.29 Y126.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3928
M204 S5000
G1 X133.91 Y126.84 E.17269
G1 X133.91 Y128.06 E.03749
G1 X128.29 Y128.06 E.17269
G1 X128.29 Y126.9 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.102 Y128.452 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3928
M204 S6000
G1 X130.698 Y128.452 E.08611
G1 X130.698 Y129.573 E.03718
G1 X128.102 Y129.573 E.08611
G1 X128.102 Y128.512 E.03519
M204 S250
G1 X127.71 Y127.94 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3928
M204 S5000
G1 X127.71 Y129.16 E.03749
G1 X122.09 Y129.16 E.17269
G1 X122.09 Y127.94 E.03749
G1 X127.65 Y127.94 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.71 Y129.16 E-.46416
G1 X126.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.098 Y129.573 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3928
M204 S6000
G1 X123.098 Y139.427 E.32688
G1 X130.698 Y139.427 E.25211
G1 X130.698 Y140.548 E.03718
G1 X127.898 Y140.548 E.09288
G1 X127.898 Y142.397 E.06135
G1 X122.262 Y142.393 E.18697
G3 X122.103 Y142.202 I.043 J-.197 E.00887
G1 X122.102 Y129.552 E.41963
G1 X123.059 Y129.552 E.03173
; WIPE_START
G1 F8843.478
G1 X123.067 Y131.552 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.778 Y138.222 Z4 F42000
G1 X128.29 Y140.94 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3928
M204 S5000
G1 X133.91 Y140.94 E.17269
G1 X133.91 Y142.16 E.03749
G1 X128.29 Y142.16 E.17269
G1 X128.29 Y141 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.534 Y133.384 Z4 F42000
G1 X127.71 Y115.06 Z4
G1 Z3.6
G1 E.8 F1800
G1 F3928
M204 S5000
G1 X122.09 Y115.06 E.17269
G1 X122.09 Y113.84 E.03749
G1 X127.71 Y113.84 E.17269
G1 X127.71 Y115 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.302 Y116.573 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3928
M204 S6000
G1 X125.302 Y115.452 E.03718
G1 X128.102 Y115.452 E.09288
G1 X128.102 Y113.603 E.06134
G1 X133.716 Y113.603 E.18624
G1 X133.839 Y113.66 E.0045
G1 X133.884 Y113.727 E.00265
G1 X133.897 Y113.79 E.00215
G1 X133.898 Y126.448 E.41987
G1 X132.902 Y126.448 E.03303
G1 X132.902 Y116.573 E.32757
G1 X125.362 Y116.573 E.25012
; WIPE_START
G1 F8843.478
G1 X125.302 Y115.452 E-.42654
G1 X126.18 Y115.452 E-.33346
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.789 Y122.957 Z4 F42000
G1 X123.49 Y129.965 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3928
M204 S5000
G1 X123.49 Y139.035 E.2787
G1 X131.09 Y139.035 E.23353
G1 X131.09 Y140.81 E.05454
G1 X134.06 Y140.81 E.09126
G1 X134.06 Y140.335 E.0146
G1 X134.29 Y140.335 E.00706
G1 X134.289 Y142.229 E.05819
G3 X133.726 Y142.789 I-.591 J-.031 E.02675
G1 X122.305 Y142.79 E.35093
G3 X121.711 Y142.226 I.012 J-.608 E.02761
G1 X121.71 Y127.335 E.45757
G1 X121.94 Y127.335 E.00707
G1 X121.94 Y127.81 E.0146
G1 X124.91 Y127.81 E.09126
G1 X124.91 Y126.035 E.05454
G1 X132.51 Y126.035 E.23353
G1 X132.51 Y116.965 E.2787
G1 X124.91 Y116.965 E.23353
G1 X124.91 Y115.19 E.05454
G1 X121.94 Y115.19 E.09126
G1 X121.94 Y115.665 E.0146
G1 X121.71 Y115.665 E.00706
G1 X121.711 Y113.771 E.05819
G3 X122.274 Y113.211 I.608 J.048 E.02657
G1 X133.757 Y113.213 E.35284
G3 X134.289 Y113.771 I-.059 J.589 E.02581
G1 X134.29 Y128.665 E.45765
G1 X134.06 Y128.665 E.00707
G1 X134.06 Y128.19 E.0146
G1 X131.09 Y128.19 E.09126
G1 X131.09 Y129.965 E.05454
G1 X123.55 Y129.965 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.537 Y131.965 E-.76
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


G1 X122.6 Y129.756 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.631239
G1 F3928
M204 S6000
G1 X122.6 Y139.631 E.47341
M204 S10000
G1 X127.55 Y141.273 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3928
M204 S6000
G1 X127.55 Y142.049 E.02574
G1 X126.697 Y142.049 E.02827
G1 X124.423 Y139.775 E.10668
G1 X123.901 Y139.775 E.01734
G1 X122.451 Y141.225 E.06799
G1 X122.451 Y142.05 E.02736
G1 X123.255 Y142.05 E.02665
; WIPE_START
G1 F8843.478
G1 X122.451 Y142.05 E-.30528
G1 X122.451 Y141.225 E-.31348
G1 X122.714 Y140.962 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.094 Y142.475 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.28002
G1 F3928
M204 S6000
G1 X133.707 Y142.475 E.10844
G2 X133.795 Y142.466 I-.013 J-.603 E.00172
; LINE_WIDTH: 0.236007
G2 X134.039 Y142.399 I-.335 J-1.684 E.00398
M204 S10000
G1 X134.052 Y142.373 F42000
; LINE_WIDTH: 0.171773
G1 F3928
M204 S6000
G1 X133.554 Y142.593 E.00571
; WIPE_START
G1 F15000
G1 X134.052 Y142.373 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.75 Y135.491 Z4 F42000
M73 P66 R5
G1 X127.906 Y129.563 Z4
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.45586
G1 F3928
M204 S6000
G1 X123.294 Y129.563 E.15519
; WIPE_START
G1 F8717.973
G1 X125.294 Y129.563 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.516 Y127.166 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.39982
G1 F3928
M204 S6000
G1 X127.516 Y126.809 E.01038
G1 X125.684 Y126.809 E.05328
G1 X125.684 Y127.166 E.01038
G1 X127.456 Y127.166 E.05153
M204 S10000
G1 X128 Y127.744 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
G1 F3928
M204 S6000
G1 X128 Y128.256 E.00784
M204 S10000
G1 X128.484 Y128.834 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.399825
G1 F3928
M204 S6000
G1 X128.484 Y129.191 E.01038
G1 X130.316 Y129.191 E.05328
G1 X130.316 Y128.834 E.01038
G1 X128.544 Y128.834 E.05153
; WIPE_START
G1 F10086.717
G1 X130.316 Y128.834 E-.67333
G1 X130.316 Y129.062 E-.08667
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.094 Y126.437 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.45586
G1 F3928
M204 S6000
G1 X132.706 Y126.437 E.15519
M204 S10000
G1 X133.4 Y126.244 F42000
; LINE_WIDTH: 0.631239
G1 F3928
M204 S6000
G1 X133.4 Y116.369 E.47341
M204 S10000
G1 X128.45 Y114.727 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3928
M204 S6000
G1 X128.45 Y113.951 E.02573
G1 X129.303 Y113.951 E.02829
G1 X131.577 Y116.225 E.10665
G1 X132.099 Y116.225 E.01734
G1 X133.549 Y114.775 E.06799
G1 X133.549 Y113.952 E.02732
G1 X132.744 Y113.951 E.02669
; WIPE_START
G1 F8843.478
G1 X133.549 Y113.952 E-.30575
G1 X133.549 Y114.775 E-.31301
G1 X133.286 Y115.038 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.906 Y113.525 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279496
G1 F3928
M204 S6000
G1 X122.293 Y113.525 E.1082
G2 X122.137 Y113.55 I.044 J.794 E.00306
; LINE_WIDTH: 0.214465
G1 X122.088 Y113.566 E.00071
; LINE_WIDTH: 0.177385
G1 X121.949 Y113.626 E.00166
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X122.088 Y113.566 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/42
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z4 I-1.115 J.488 P1  F42000
G1 X127.898 Y126.84 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3921
M204 S6000
G1 X127.898 Y127.548 E.02348
G1 X125.302 Y127.548 E.08611
G1 X125.302 Y126.427 E.03718
G1 X127.898 Y126.427 E.08611
G1 X127.898 Y126.78 E.01171
M204 S250
G1 X128.29 Y126.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3921
M204 S5000
G1 X133.91 Y126.84 E.17269
G1 X133.91 Y128.06 E.03749
G1 X128.29 Y128.06 E.17269
G1 X128.29 Y126.9 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.102 Y128.452 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3921
M204 S6000
G1 X130.698 Y128.452 E.08611
G1 X130.698 Y129.573 E.03718
G1 X128.102 Y129.573 E.08611
G1 X128.102 Y128.512 E.03519
M204 S250
G1 X127.71 Y127.94 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3921
M204 S5000
G1 X127.71 Y129.16 E.03749
G1 X122.09 Y129.16 E.17269
G1 X122.09 Y127.94 E.03749
G1 X127.65 Y127.94 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.71 Y129.16 E-.46416
G1 X126.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.098 Y129.573 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3921
M204 S6000
G1 X123.098 Y139.427 E.32688
G1 X130.698 Y139.427 E.25211
G1 X130.698 Y140.548 E.03718
G1 X127.898 Y140.548 E.09288
G1 X127.898 Y142.397 E.06135
G1 X122.262 Y142.393 E.18697
G3 X122.103 Y142.202 I.043 J-.197 E.00888
G1 X122.102 Y129.552 E.41963
G1 X123.059 Y129.552 E.03173
; WIPE_START
G1 F8843.478
G1 X123.067 Y131.552 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.778 Y138.222 Z4.2 F42000
G1 X128.29 Y140.94 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3921
M204 S5000
G1 X133.91 Y140.94 E.17269
G1 X133.91 Y142.16 E.03749
G1 X128.29 Y142.16 E.17269
G1 X128.29 Y141 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.534 Y133.384 Z4.2 F42000
G1 X127.71 Y115.06 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F3921
M204 S5000
G1 X122.09 Y115.06 E.17269
G1 X122.09 Y113.84 E.03749
G1 X127.71 Y113.84 E.17269
G1 X127.71 Y115 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.302 Y116.573 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3921
M204 S6000
G1 X125.302 Y115.452 E.03718
G1 X128.102 Y115.452 E.09288
G1 X128.102 Y113.603 E.06134
G1 X133.716 Y113.603 E.18624
G1 X133.839 Y113.66 E.0045
G1 X133.883 Y113.726 E.00262
G1 X133.897 Y113.79 E.00218
G1 X133.898 Y126.448 E.41987
G1 X132.902 Y126.448 E.03303
G1 X132.902 Y116.573 E.32757
G1 X125.362 Y116.573 E.25012
; WIPE_START
G1 F8843.478
G1 X125.302 Y115.452 E-.42654
G1 X126.18 Y115.452 E-.33346
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.789 Y122.957 Z4.2 F42000
G1 X123.49 Y129.965 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3921
M204 S5000
G1 X123.49 Y139.035 E.2787
G1 X131.09 Y139.035 E.23353
G1 X131.09 Y140.81 E.05454
G1 X134.06 Y140.81 E.09126
G1 X134.06 Y140.335 E.0146
G1 X134.29 Y140.335 E.00706
G1 X134.289 Y142.229 E.05819
G3 X133.726 Y142.789 I-.591 J-.031 E.02675
G1 X122.305 Y142.79 E.35094
G3 X121.711 Y142.226 I.013 J-.608 E.02761
G1 X121.71 Y127.335 E.45757
G1 X121.94 Y127.335 E.00707
G1 X121.94 Y127.81 E.0146
G1 X124.91 Y127.81 E.09126
G1 X124.91 Y126.035 E.05454
G1 X132.51 Y126.035 E.23353
G1 X132.51 Y116.965 E.2787
G1 X124.91 Y116.965 E.23353
G1 X124.91 Y115.19 E.05454
G1 X121.94 Y115.19 E.09126
G1 X121.94 Y115.665 E.0146
G1 X121.71 Y115.665 E.00706
G1 X121.711 Y113.774 E.05811
G3 X122.274 Y113.211 I.594 J.031 E.02679
G1 X133.757 Y113.213 E.35285
G3 X134.289 Y113.771 I-.059 J.589 E.02581
G1 X134.29 Y128.665 E.45765
G1 X134.06 Y128.665 E.00707
G1 X134.06 Y128.19 E.0146
G1 X131.09 Y128.19 E.09126
G1 X131.09 Y129.965 E.05454
G1 X123.55 Y129.965 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.537 Y131.965 E-.76
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


G1 X122.6 Y129.756 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.631239
G1 F3921
M204 S6000
G1 X122.6 Y139.631 E.47341
M204 S10000
G1 X123.255 Y142.05 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3921
M204 S6000
G1 X122.451 Y142.05 E.02665
G1 X122.451 Y141.225 E.02736
M73 P67 R5
G1 X123.901 Y139.775 E.06799
G1 X124.423 Y139.775 E.01734
G1 X126.697 Y142.049 E.10668
G1 X127.55 Y142.049 E.02827
G1 X127.55 Y141.273 E.02574
; WIPE_START
G1 F8843.478
G1 X127.55 Y142.049 E-.2949
G1 X126.697 Y142.049 E-.32387
G1 X126.435 Y141.786 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.094 Y142.475 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280021
G1 F3921
M204 S6000
G1 X133.707 Y142.475 E.10844
G2 X133.795 Y142.466 I-.013 J-.601 E.00171
; LINE_WIDTH: 0.236026
G2 X134.039 Y142.399 I-.336 J-1.691 E.00398
M204 S10000
G1 X134.052 Y142.373 F42000
; LINE_WIDTH: 0.171767
G1 F3921
M204 S6000
G1 X133.554 Y142.593 E.00571
; WIPE_START
G1 F15000
G1 X134.052 Y142.373 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.75 Y135.491 Z4.2 F42000
G1 X127.906 Y129.563 Z4.2
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.45586
G1 F3921
M204 S6000
G1 X123.294 Y129.563 E.15519
; WIPE_START
G1 F8717.973
G1 X125.294 Y129.563 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.516 Y127.166 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.39982
G1 F3921
M204 S6000
G1 X127.516 Y126.809 E.01038
G1 X125.684 Y126.809 E.05328
G1 X125.684 Y127.166 E.01038
G1 X127.456 Y127.166 E.05153
M204 S10000
G1 X128 Y127.744 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
G1 F3921
M204 S6000
G1 X128 Y128.256 E.00784
M204 S10000
G1 X128.484 Y128.834 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.399825
G1 F3921
M204 S6000
G1 X128.484 Y129.191 E.01038
G1 X130.316 Y129.191 E.05328
G1 X130.316 Y128.834 E.01038
G1 X128.544 Y128.834 E.05153
; WIPE_START
G1 F10086.717
G1 X130.316 Y128.834 E-.67333
G1 X130.316 Y129.062 E-.08667
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.094 Y126.437 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.45586
G1 F3921
M204 S6000
G1 X132.706 Y126.437 E.15519
M204 S10000
G1 X133.4 Y126.244 F42000
; LINE_WIDTH: 0.631239
G1 F3921
M204 S6000
G1 X133.4 Y116.369 E.47341
M204 S10000
G1 X132.744 Y113.951 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3921
M204 S6000
G1 X133.549 Y113.952 E.02669
G1 X133.549 Y114.775 E.02732
G1 X132.099 Y116.225 E.06799
G1 X131.577 Y116.225 E.01734
G1 X129.303 Y113.951 E.10665
G1 X128.45 Y113.951 E.02829
G1 X128.45 Y114.727 E.02573
; WIPE_START
G1 F8843.478
G1 X128.45 Y113.951 E-.29471
G1 X129.303 Y113.951 E-.32405
G1 X129.566 Y114.214 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P67 R4
G1 X127.906 Y113.525 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.278249
G1 F3921
M204 S6000
G1 X122.293 Y113.525 E.10763
G2 X121.963 Y113.598 I.1 J1.247 E.00649
M204 S10000
G1 X121.949 Y113.626 F42000
; LINE_WIDTH: 0.17737
G1 F3921
M204 S6000
G1 X122.46 Y113.407 E.0061
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X121.949 Y113.626 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/42
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z4.2 I-1.11 J.5 P1  F42000
G1 X127.898 Y126.84 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3922
M204 S6000
G1 X127.898 Y127.548 E.02348
G1 X125.302 Y127.548 E.08611
G1 X125.302 Y126.427 E.03718
G1 X127.898 Y126.427 E.08611
G1 X127.898 Y126.78 E.01171
M204 S250
G1 X128.29 Y126.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3922
M204 S5000
G1 X133.91 Y126.84 E.17269
G1 X133.91 Y128.06 E.03749
G1 X128.29 Y128.06 E.17269
G1 X128.29 Y126.9 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.102 Y128.452 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3922
M204 S6000
G1 X130.698 Y128.452 E.08611
G1 X130.698 Y129.573 E.03718
G1 X128.102 Y129.573 E.08611
G1 X128.102 Y128.512 E.03519
M204 S250
G1 X127.71 Y127.94 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3922
M204 S5000
G1 X127.71 Y129.16 E.03749
G1 X122.09 Y129.16 E.17269
G1 X122.09 Y127.94 E.03749
G1 X127.65 Y127.94 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.71 Y129.16 E-.46416
G1 X126.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.098 Y129.573 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3922
M204 S6000
G1 X123.098 Y139.427 E.32688
G1 X130.698 Y139.427 E.25211
G1 X130.698 Y140.548 E.03718
G1 X127.898 Y140.548 E.09288
G1 X127.898 Y142.397 E.06135
G1 X122.315 Y142.398 E.1852
G1 X122.186 Y142.36 E.00447
G3 X122.103 Y142.202 I.138 J-.173 E.00608
G1 X122.102 Y129.552 E.41963
G1 X123.059 Y129.552 E.03173
; WIPE_START
G1 F8843.478
G1 X123.067 Y131.552 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.778 Y138.222 Z4.4 F42000
G1 X128.29 Y140.94 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3922
M204 S5000
G1 X133.91 Y140.94 E.17269
G1 X133.91 Y142.16 E.03749
G1 X128.29 Y142.16 E.17269
G1 X128.29 Y141 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.534 Y133.384 Z4.4 F42000
G1 X127.71 Y115.06 Z4.4
G1 Z4
G1 E.8 F1800
G1 F3922
M204 S5000
G1 X122.09 Y115.06 E.17269
G1 X122.09 Y113.84 E.03749
G1 X127.71 Y113.84 E.17269
G1 X127.71 Y115 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.302 Y116.573 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3922
M204 S6000
G1 X125.302 Y115.452 E.03718
G1 X128.102 Y115.452 E.09288
G1 X128.102 Y113.603 E.06134
G1 X133.717 Y113.603 E.18624
G1 X133.839 Y113.661 E.00449
G1 X133.881 Y113.721 E.00243
G1 X133.897 Y113.79 E.00237
G1 X133.898 Y126.448 E.41988
G1 X132.902 Y126.448 E.03303
G1 X132.902 Y116.573 E.32757
G1 X125.362 Y116.573 E.25012
; WIPE_START
G1 F8843.478
G1 X125.302 Y115.452 E-.42654
G1 X126.18 Y115.452 E-.33346
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.789 Y122.957 Z4.4 F42000
G1 X123.49 Y129.965 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3922
M204 S5000
G1 X123.49 Y139.035 E.2787
G1 X131.09 Y139.035 E.23353
G1 X131.09 Y140.81 E.05454
G1 X134.06 Y140.81 E.09126
G1 X134.06 Y140.335 E.0146
G1 X134.29 Y140.335 E.00706
G1 X134.289 Y142.229 E.05819
G3 X133.726 Y142.789 I-.593 J-.033 E.02673
G1 X122.305 Y142.79 E.35094
G3 X121.711 Y142.226 I.01 J-.605 E.02764
G1 X121.71 Y127.335 E.45757
G1 X121.94 Y127.335 E.00707
G1 X121.94 Y127.81 E.0146
G1 X124.91 Y127.81 E.09126
G1 X124.91 Y126.035 E.05454
G1 X132.51 Y126.035 E.23353
M73 P68 R4
G1 X132.51 Y116.965 E.2787
G1 X124.91 Y116.965 E.23353
G1 X124.91 Y115.19 E.05454
G1 X121.94 Y115.19 E.09126
G1 X121.94 Y115.665 E.0146
G1 X121.71 Y115.665 E.00706
G1 X121.711 Y113.771 E.05819
G3 X122.274 Y113.211 I.605 J.045 E.02659
G1 X133.757 Y113.213 E.35285
G3 X134.289 Y113.771 I-.059 J.589 E.02581
G1 X134.29 Y128.665 E.45765
G1 X134.06 Y128.665 E.00707
G1 X134.06 Y128.19 E.0146
G1 X131.09 Y128.19 E.09126
G1 X131.09 Y129.965 E.05454
G1 X123.55 Y129.965 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.537 Y131.965 E-.76
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


G1 X122.6 Y129.756 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.631239
G1 F3922
M204 S6000
G1 X122.6 Y139.631 E.47341
M204 S10000
G1 X127.55 Y141.273 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3922
M204 S6000
G1 X127.55 Y142.049 E.02574
G1 X126.697 Y142.049 E.02827
G1 X124.423 Y139.775 E.10668
G1 X123.901 Y139.775 E.01734
G1 X122.451 Y141.225 E.06799
G1 X122.451 Y142.05 E.02736
G1 X123.255 Y142.05 E.02665
; WIPE_START
G1 F8843.478
G1 X122.451 Y142.05 E-.30528
G1 X122.451 Y141.225 E-.31348
G1 X122.714 Y140.962 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.094 Y142.475 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280021
G1 F3922
M204 S6000
G1 X133.707 Y142.475 E.10844
G2 X133.795 Y142.466 I-.013 J-.602 E.00171
; LINE_WIDTH: 0.242861
G2 X133.881 Y142.444 I-.104 J-.594 E.00145
; LINE_WIDTH: 0.201724
G1 X133.929 Y142.426 E.00067
; LINE_WIDTH: 0.165869
G1 X133.969 Y142.409 E.00044
; LINE_WIDTH: 0.127153
G1 X134.057 Y142.362 E.00068
; WIPE_START
G1 F15000
G1 X133.969 Y142.409 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.711 Y135.506 Z4.4 F42000
G1 X127.906 Y129.563 Z4.4
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.45586
G1 F3922
M204 S6000
G1 X123.294 Y129.563 E.15519
; WIPE_START
G1 F8717.973
G1 X125.294 Y129.563 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.516 Y127.166 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.39982
G1 F3922
M204 S6000
G1 X127.516 Y126.809 E.01038
G1 X125.684 Y126.809 E.05328
G1 X125.684 Y127.166 E.01038
G1 X127.456 Y127.166 E.05153
M204 S10000
G1 X128 Y127.744 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
G1 F3922
M204 S6000
G1 X128 Y128.256 E.00784
M204 S10000
G1 X128.484 Y128.834 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.399825
G1 F3922
M204 S6000
G1 X128.484 Y129.191 E.01038
G1 X130.316 Y129.191 E.05328
G1 X130.316 Y128.834 E.01038
G1 X128.544 Y128.834 E.05153
; WIPE_START
G1 F10086.717
G1 X130.316 Y128.834 E-.67333
G1 X130.316 Y129.062 E-.08667
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.094 Y126.437 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.45586
G1 F3922
M204 S6000
G1 X132.706 Y126.437 E.15519
M204 S10000
G1 X133.4 Y126.244 F42000
; LINE_WIDTH: 0.631239
G1 F3922
M204 S6000
G1 X133.4 Y116.369 E.47341
M204 S10000
G1 X128.45 Y114.727 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3922
M204 S6000
G1 X128.45 Y113.951 E.02573
G1 X129.303 Y113.951 E.02829
G1 X131.577 Y116.225 E.10665
G1 X132.099 Y116.225 E.01734
G1 X133.549 Y114.775 E.06799
G1 X133.549 Y113.952 E.02732
G1 X132.744 Y113.952 E.02669
; WIPE_START
G1 F8843.478
G1 X133.549 Y113.952 E-.30576
G1 X133.549 Y114.775 E-.313
G1 X133.286 Y115.038 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.906 Y113.525 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279708
G1 F3922
M204 S6000
G1 X122.293 Y113.525 E.1083
G2 X122.163 Y113.543 I.021 J.654 E.00254
; LINE_WIDTH: 0.232357
G1 X122.119 Y113.556 E.0007
; LINE_WIDTH: 0.202519
G1 X121.95 Y113.618 E.00234
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X122.119 Y113.556 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/42
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z4.4 I-1.116 J.485 P1  F42000
G1 X127.898 Y126.84 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3910
M204 S6000
G1 X127.898 Y127.548 E.02348
G1 X125.302 Y127.548 E.08611
G1 X125.302 Y126.427 E.03718
G1 X127.898 Y126.427 E.08611
G1 X127.898 Y126.78 E.01171
M204 S250
G1 X128.29 Y126.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3910
M204 S5000
G1 X133.91 Y126.84 E.17269
G1 X133.91 Y128.06 E.03749
G1 X128.29 Y128.06 E.17269
G1 X128.29 Y126.9 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.102 Y128.452 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3910
M204 S6000
G1 X130.698 Y128.452 E.08611
G1 X130.698 Y129.573 E.03718
G1 X128.102 Y129.573 E.08611
G1 X128.102 Y128.512 E.03519
M204 S250
G1 X127.71 Y127.94 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3910
M204 S5000
G1 X127.71 Y129.16 E.03749
G1 X122.09 Y129.16 E.17269
G1 X122.09 Y127.94 E.03749
G1 X127.65 Y127.94 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.71 Y129.16 E-.46416
G1 X126.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.098 Y129.573 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3910
M204 S6000
G1 X123.098 Y139.427 E.32688
G1 X130.698 Y139.427 E.25211
G1 X130.698 Y140.548 E.03718
G1 X127.898 Y140.548 E.09288
G1 X127.898 Y142.397 E.06135
G1 X122.261 Y142.393 E.18697
G3 X122.103 Y142.202 I.043 J-.197 E.00887
G1 X122.102 Y129.552 E.41963
G1 X123.059 Y129.552 E.03173
; WIPE_START
G1 F8843.478
G1 X123.067 Y131.552 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.778 Y138.222 Z4.6 F42000
G1 X128.29 Y140.94 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3910
M204 S5000
G1 X133.91 Y140.94 E.17269
G1 X133.91 Y142.16 E.03749
G1 X128.29 Y142.16 E.17269
G1 X128.29 Y141 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.534 Y133.384 Z4.6 F42000
G1 X127.71 Y115.06 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F3910
M204 S5000
G1 X122.09 Y115.06 E.17269
G1 X122.09 Y113.84 E.03749
G1 X127.71 Y113.84 E.17269
G1 X127.71 Y115 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.302 Y116.573 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3910
M204 S6000
G1 X125.302 Y115.452 E.03718
G1 X128.102 Y115.452 E.09288
M73 P69 R4
G1 X128.102 Y113.603 E.06134
G1 X133.717 Y113.603 E.18625
G1 X133.839 Y113.661 E.00449
G1 X133.881 Y113.72 E.00241
G1 X133.897 Y113.79 E.00238
G1 X133.898 Y126.448 E.41988
G1 X132.902 Y126.448 E.03303
G1 X132.902 Y116.573 E.32757
G1 X125.362 Y116.573 E.25012
; WIPE_START
G1 F8843.478
G1 X125.302 Y115.452 E-.42654
G1 X126.18 Y115.452 E-.33346
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.789 Y122.957 Z4.6 F42000
G1 X123.49 Y129.965 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3910
M204 S5000
G1 X123.49 Y139.035 E.2787
G1 X131.09 Y139.035 E.23353
G1 X131.09 Y140.81 E.05454
G1 X134.06 Y140.81 E.09126
G1 X134.06 Y140.335 E.0146
G1 X134.29 Y140.335 E.00706
G1 X134.289 Y142.229 E.05819
G3 X133.726 Y142.789 I-.594 J-.034 E.02671
G1 X122.305 Y142.79 E.35094
G3 X121.711 Y142.226 I.012 J-.608 E.02761
G1 X121.71 Y127.335 E.45757
G1 X121.94 Y127.335 E.00707
G1 X121.94 Y127.81 E.0146
G1 X124.91 Y127.81 E.09126
G1 X124.91 Y126.035 E.05454
G1 X132.51 Y126.035 E.23353
G1 X132.51 Y116.965 E.2787
G1 X124.91 Y116.965 E.23353
G1 X124.91 Y115.19 E.05454
G1 X121.94 Y115.19 E.09126
G1 X121.94 Y115.665 E.0146
G1 X121.71 Y115.665 E.00706
G1 X121.711 Y113.771 E.05819
G3 X122.274 Y113.211 I.594 J.034 E.02671
G1 X133.757 Y113.213 E.35285
G3 X134.289 Y113.771 I-.059 J.589 E.0258
G1 X134.29 Y128.665 E.45765
G1 X134.06 Y128.665 E.00707
G1 X134.06 Y128.19 E.0146
G1 X131.09 Y128.19 E.09126
G1 X131.09 Y129.965 E.05454
G1 X123.55 Y129.965 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.537 Y131.965 E-.76
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


G1 X122.6 Y129.756 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.631239
G1 F3910
M204 S6000
G1 X122.6 Y139.631 E.47341
M204 S10000
G1 X123.255 Y142.05 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3910
M204 S6000
G1 X122.451 Y142.05 E.02665
G1 X122.451 Y141.225 E.02736
G1 X123.901 Y139.775 E.06799
G1 X124.423 Y139.775 E.01734
G1 X126.697 Y142.049 E.10668
G1 X127.55 Y142.049 E.02827
G1 X127.55 Y141.273 E.02574
; WIPE_START
G1 F8843.478
G1 X127.55 Y142.049 E-.2949
G1 X126.697 Y142.049 E-.32387
G1 X126.435 Y141.786 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.094 Y142.475 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280097
G1 F3910
M204 S6000
G1 X133.761 Y142.471 E.10952
; LINE_WIDTH: 0.253836
G2 X133.866 Y142.449 I-.104 J-.762 E.00186
; LINE_WIDTH: 0.213502
G1 X133.912 Y142.434 E.00067
; LINE_WIDTH: 0.177372
G1 X134.051 Y142.374 E.00166
; WIPE_START
G1 F15000
G1 X133.912 Y142.434 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.684 Y135.517 Z4.6 F42000
G1 X127.906 Y129.563 Z4.6
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.45586
G1 F3910
M204 S6000
G1 X123.294 Y129.563 E.15519
; WIPE_START
G1 F8717.973
G1 X125.294 Y129.563 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.516 Y127.166 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.39982
G1 F3910
M204 S6000
G1 X127.516 Y126.809 E.01038
G1 X125.684 Y126.809 E.05328
G1 X125.684 Y127.166 E.01038
G1 X127.456 Y127.166 E.05153
M204 S10000
G1 X128 Y127.744 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
G1 F3910
M204 S6000
G1 X128 Y128.256 E.00784
M204 S10000
G1 X128.484 Y128.834 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.399825
G1 F3910
M204 S6000
G1 X128.484 Y129.191 E.01038
G1 X130.316 Y129.191 E.05328
G1 X130.316 Y128.834 E.01038
G1 X128.544 Y128.834 E.05153
; WIPE_START
G1 F10086.717
G1 X130.316 Y128.834 E-.67333
G1 X130.316 Y129.062 E-.08667
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.094 Y126.437 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.45586
G1 F3910
M204 S6000
G1 X132.706 Y126.437 E.15519
M204 S10000
G1 X133.4 Y126.244 F42000
; LINE_WIDTH: 0.631239
G1 F3910
M204 S6000
G1 X133.4 Y116.369 E.47341
M204 S10000
G1 X132.744 Y113.952 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3910
M204 S6000
G1 X133.549 Y113.952 E.02669
G1 X133.549 Y114.775 E.02732
G1 X132.099 Y116.225 E.06799
G1 X131.577 Y116.225 E.01734
G1 X129.303 Y113.951 E.10665
G1 X128.45 Y113.951 E.02829
G1 X128.45 Y114.727 E.02573
; WIPE_START
G1 F8843.478
G1 X128.45 Y113.951 E-.29471
G1 X129.303 Y113.951 E-.32405
G1 X129.566 Y114.214 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.906 Y113.525 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279806
G1 F3910
M204 S6000
G1 X122.293 Y113.525 E.10835
G2 X122.179 Y113.539 I.016 J.623 E.00222
; LINE_WIDTH: 0.241001
G1 X122.133 Y113.551 E.00076
; LINE_WIDTH: 0.21344
G1 X122.088 Y113.566 E.00066
; LINE_WIDTH: 0.177378
G1 X121.949 Y113.626 E.00166
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X122.088 Y113.566 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/42
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z4.6 I-1.115 J.488 P1  F42000
G1 X127.898 Y126.84 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3921
M204 S6000
G1 X127.898 Y127.548 E.02348
G1 X125.302 Y127.548 E.08611
G1 X125.302 Y126.427 E.03718
G1 X127.898 Y126.427 E.08611
G1 X127.898 Y126.78 E.01171
M204 S250
G1 X128.29 Y126.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3921
M204 S5000
G1 X133.91 Y126.84 E.17269
G1 X133.91 Y128.06 E.03749
G1 X128.29 Y128.06 E.17269
G1 X128.29 Y126.9 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.102 Y128.452 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3921
M204 S6000
G1 X130.698 Y128.452 E.08611
G1 X130.698 Y129.573 E.03718
G1 X128.102 Y129.573 E.08611
G1 X128.102 Y128.512 E.03519
M204 S250
G1 X127.71 Y127.94 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3921
M204 S5000
G1 X127.71 Y129.16 E.03749
G1 X122.09 Y129.16 E.17269
G1 X122.09 Y127.94 E.03749
M73 P70 R4
G1 X127.65 Y127.94 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.71 Y129.16 E-.46416
G1 X126.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.098 Y129.573 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3921
M204 S6000
G1 X123.098 Y139.427 E.32688
G1 X130.698 Y139.427 E.25211
G1 X130.698 Y140.548 E.03718
G1 X127.898 Y140.548 E.09288
G1 X127.898 Y142.397 E.06135
G1 X122.262 Y142.393 E.18697
G3 X122.103 Y142.202 I.043 J-.197 E.00887
G1 X122.102 Y129.552 E.41963
G1 X123.059 Y129.552 E.03173
; WIPE_START
G1 F8843.478
G1 X123.067 Y131.552 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.778 Y138.222 Z4.8 F42000
G1 X128.29 Y140.94 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3921
M204 S5000
G1 X133.91 Y140.94 E.17269
G1 X133.91 Y142.16 E.03749
G1 X128.29 Y142.16 E.17269
G1 X128.29 Y141 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.534 Y133.384 Z4.8 F42000
G1 X127.71 Y115.06 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F3921
M204 S5000
G1 X122.09 Y115.06 E.17269
G1 X122.09 Y113.84 E.03749
G1 X127.71 Y113.84 E.17269
G1 X127.71 Y115 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.302 Y116.573 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3921
M204 S6000
G1 X125.302 Y115.452 E.03718
G1 X128.102 Y115.452 E.09288
G1 X128.102 Y113.603 E.06134
G1 X133.717 Y113.603 E.18625
G1 X133.839 Y113.661 E.00448
G1 X133.88 Y113.72 E.00239
G1 X133.897 Y113.79 E.00241
G1 X133.898 Y126.448 E.41987
G1 X132.902 Y126.448 E.03303
G1 X132.902 Y116.573 E.32757
G1 X125.362 Y116.573 E.25012
; WIPE_START
G1 F8843.478
G1 X125.302 Y115.452 E-.42654
G1 X126.18 Y115.452 E-.33346
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.789 Y122.957 Z4.8 F42000
G1 X123.49 Y129.965 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3921
M204 S5000
G1 X123.49 Y139.035 E.2787
G1 X131.09 Y139.035 E.23353
G1 X131.09 Y140.81 E.05454
G1 X134.06 Y140.81 E.09126
G1 X134.06 Y140.335 E.0146
G1 X134.29 Y140.335 E.00706
G1 X134.289 Y142.229 E.05819
G3 X133.726 Y142.789 I-.594 J-.034 E.02671
G1 X122.305 Y142.79 E.35093
G3 X121.711 Y142.226 I.012 J-.608 E.02762
G1 X121.71 Y127.335 E.45757
G1 X121.94 Y127.335 E.00707
G1 X121.94 Y127.81 E.0146
G1 X124.91 Y127.81 E.09126
G1 X124.91 Y126.035 E.05454
G1 X132.51 Y126.035 E.23353
G1 X132.51 Y116.965 E.2787
G1 X124.91 Y116.965 E.23353
G1 X124.91 Y115.19 E.05454
G1 X121.94 Y115.19 E.09126
G1 X121.94 Y115.665 E.0146
G1 X121.71 Y115.665 E.00706
G1 X121.711 Y113.774 E.05811
G3 X122.274 Y113.211 I.594 J.031 E.02679
G1 X133.757 Y113.213 E.35285
G3 X134.289 Y113.771 I-.059 J.589 E.0258
G1 X134.29 Y128.665 E.45765
G1 X134.06 Y128.665 E.00707
G1 X134.06 Y128.19 E.0146
G1 X131.09 Y128.19 E.09126
G1 X131.09 Y129.965 E.05454
G1 X123.55 Y129.965 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.537 Y131.965 E-.76
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


G1 X122.6 Y129.756 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.631239
G1 F3921
M204 S6000
G1 X122.6 Y139.631 E.47341
M204 S10000
G1 X127.55 Y141.273 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3921
M204 S6000
G1 X127.55 Y142.049 E.02574
G1 X126.697 Y142.049 E.02827
G1 X124.423 Y139.775 E.10668
G1 X123.901 Y139.775 E.01734
G1 X122.451 Y141.225 E.06799
G1 X122.451 Y142.05 E.02736
G1 X123.255 Y142.05 E.02665
; WIPE_START
G1 F8843.478
G1 X122.451 Y142.05 E-.30528
G1 X122.451 Y141.225 E-.31348
G1 X122.714 Y140.962 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.094 Y142.475 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279626
G1 F3921
M204 S6000
G1 X133.707 Y142.475 E.10826
G2 X133.798 Y142.466 I-.015 J-.622 E.00176
G1 X133.864 Y142.45 E.00132
; LINE_WIDTH: 0.214248
G1 X133.912 Y142.434 E.0007
; LINE_WIDTH: 0.177362
G1 X134.051 Y142.374 E.00166
; WIPE_START
G1 F15000
G1 X133.912 Y142.434 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.684 Y135.517 Z4.8 F42000
G1 X127.906 Y129.563 Z4.8
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.45586
G1 F3921
M204 S6000
G1 X123.294 Y129.563 E.15519
; WIPE_START
G1 F8717.973
G1 X125.294 Y129.563 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.516 Y127.166 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.39982
G1 F3921
M204 S6000
G1 X127.516 Y126.809 E.01038
G1 X125.684 Y126.809 E.05328
G1 X125.684 Y127.166 E.01038
G1 X127.456 Y127.166 E.05153
M204 S10000
G1 X128 Y127.744 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
G1 F3921
M204 S6000
G1 X128 Y128.256 E.00784
M204 S10000
G1 X128.484 Y128.834 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.399825
G1 F3921
M204 S6000
G1 X128.484 Y129.191 E.01038
G1 X130.316 Y129.191 E.05328
G1 X130.316 Y128.834 E.01038
G1 X128.544 Y128.834 E.05153
; WIPE_START
G1 F10086.717
G1 X130.316 Y128.834 E-.67333
G1 X130.316 Y129.062 E-.08667
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.094 Y126.437 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.45586
G1 F3921
M204 S6000
G1 X132.706 Y126.437 E.15519
M204 S10000
G1 X133.4 Y126.244 F42000
; LINE_WIDTH: 0.631239
M73 P71 R4
G1 F3921
M204 S6000
G1 X133.4 Y116.369 E.47341
M204 S10000
G1 X128.45 Y114.727 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3921
M204 S6000
G1 X128.45 Y113.951 E.02573
G1 X129.303 Y113.951 E.02829
G1 X131.577 Y116.225 E.10665
G1 X132.099 Y116.225 E.01734
G1 X133.549 Y114.775 E.06799
G1 X133.549 Y113.952 E.02732
G1 X132.744 Y113.952 E.02669
; WIPE_START
G1 F8843.478
G1 X133.549 Y113.952 E-.30577
G1 X133.549 Y114.775 E-.31299
G1 X133.286 Y115.038 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.906 Y113.525 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279702
G1 F3921
M204 S6000
G1 X122.293 Y113.525 E.1083
G2 X122.16 Y113.543 I.021 J.66 E.00259
; LINE_WIDTH: 0.215849
G2 X121.956 Y113.613 I.486 J1.77 E.00304
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X122.16 Y113.543 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/42
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z4.8 I-1.117 J.482 P1  F42000
G1 X127.898 Y126.84 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3909
M204 S6000
G1 X127.898 Y127.548 E.02348
G1 X125.302 Y127.548 E.08611
G1 X125.302 Y126.427 E.03718
G1 X127.898 Y126.427 E.08611
G1 X127.898 Y126.78 E.01171
M204 S250
G1 X128.29 Y126.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3909
M204 S5000
G1 X133.91 Y126.84 E.17269
G1 X133.91 Y128.06 E.03749
G1 X128.29 Y128.06 E.17269
G1 X128.29 Y126.9 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.102 Y128.452 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3909
M204 S6000
G1 X130.698 Y128.452 E.08611
G1 X130.698 Y129.573 E.03718
G1 X128.102 Y129.573 E.08611
G1 X128.102 Y128.512 E.03519
M204 S250
G1 X127.71 Y127.94 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3909
M204 S5000
G1 X127.71 Y129.16 E.03749
G1 X122.09 Y129.16 E.17269
G1 X122.09 Y127.94 E.03749
G1 X127.65 Y127.94 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.71 Y129.16 E-.46416
G1 X126.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.098 Y129.573 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3909
M204 S6000
G1 X123.098 Y139.427 E.32688
G1 X130.698 Y139.427 E.25211
G1 X130.698 Y140.548 E.03718
G1 X127.898 Y140.548 E.09288
G1 X127.898 Y142.397 E.06135
G1 X122.262 Y142.393 E.18697
G3 X122.103 Y142.202 I.05 J-.203 E.00882
G1 X122.102 Y129.552 E.41963
G1 X123.059 Y129.552 E.03173
; WIPE_START
G1 F8843.478
G1 X123.067 Y131.552 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.778 Y138.222 Z5 F42000
G1 X128.29 Y140.94 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3909
M204 S5000
G1 X133.91 Y140.94 E.17269
G1 X133.91 Y142.16 E.03749
G1 X128.29 Y142.16 E.17269
G1 X128.29 Y141 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.534 Y133.384 Z5 F42000
G1 X127.71 Y115.06 Z5
G1 Z4.6
G1 E.8 F1800
G1 F3909
M204 S5000
G1 X122.09 Y115.06 E.17269
G1 X122.09 Y113.84 E.03749
G1 X127.71 Y113.84 E.17269
G1 X127.71 Y115 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.302 Y116.573 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3909
M204 S6000
G1 X125.302 Y115.452 E.03718
G1 X128.102 Y115.452 E.09288
G1 X128.102 Y113.603 E.06134
G1 X133.717 Y113.603 E.18626
G1 X133.839 Y113.661 E.00448
G1 X133.88 Y113.719 E.00237
G1 X133.897 Y113.79 E.00242
G1 X133.898 Y126.448 E.41988
G1 X132.902 Y126.448 E.03303
G1 X132.902 Y116.573 E.32757
G1 X125.362 Y116.573 E.25012
; WIPE_START
G1 F8843.478
G1 X125.302 Y115.452 E-.42654
G1 X126.18 Y115.452 E-.33346
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.789 Y122.957 Z5 F42000
G1 X123.49 Y129.965 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3909
M204 S5000
G1 X123.49 Y139.035 E.2787
G1 X131.09 Y139.035 E.23353
G1 X131.09 Y140.81 E.05454
G1 X134.06 Y140.81 E.09126
G1 X134.06 Y140.335 E.0146
G1 X134.29 Y140.335 E.00706
G1 X134.289 Y142.229 E.05819
G3 X133.726 Y142.789 I-.594 J-.034 E.02671
G1 X122.305 Y142.79 E.35094
G3 X121.711 Y142.226 I.012 J-.608 E.02761
G1 X121.71 Y127.335 E.45757
G1 X121.94 Y127.335 E.00707
G1 X121.94 Y127.81 E.0146
G1 X124.91 Y127.81 E.09126
G1 X124.91 Y126.035 E.05454
G1 X132.51 Y126.035 E.23353
G1 X132.51 Y116.965 E.2787
G1 X124.91 Y116.965 E.23353
G1 X124.91 Y115.19 E.05454
G1 X121.94 Y115.19 E.09126
G1 X121.94 Y115.665 E.0146
G1 X121.71 Y115.665 E.00706
G1 X121.711 Y113.771 E.05819
G3 X122.274 Y113.211 I.609 J.049 E.02656
G1 X133.757 Y113.213 E.35285
G3 X134.289 Y113.771 I-.059 J.589 E.0258
G1 X134.29 Y128.665 E.45765
G1 X134.06 Y128.665 E.00707
G1 X134.06 Y128.19 E.0146
G1 X131.09 Y128.19 E.09126
G1 X131.09 Y129.965 E.05454
G1 X123.55 Y129.965 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.537 Y131.965 E-.76
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


G1 X122.6 Y129.756 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.631239
G1 F3909
M204 S6000
G1 X122.6 Y139.631 E.47341
M204 S10000
G1 X123.255 Y142.05 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3909
M204 S6000
G1 X122.451 Y142.05 E.02665
G1 X122.451 Y141.225 E.02736
G1 X123.901 Y139.775 E.06799
G1 X124.423 Y139.775 E.01734
G1 X126.697 Y142.049 E.10668
G1 X127.55 Y142.049 E.02827
G1 X127.55 Y141.273 E.02574
; WIPE_START
G1 F8843.478
G1 X127.55 Y142.049 E-.2949
G1 X126.697 Y142.049 E-.32387
G1 X126.435 Y141.786 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.094 Y142.475 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279625
G1 F3909
M204 S6000
G1 X133.707 Y142.475 E.10826
G2 X133.798 Y142.466 I-.014 J-.621 E.00177
G1 X133.864 Y142.45 E.00132
; LINE_WIDTH: 0.214196
G1 X133.912 Y142.434 E.0007
; LINE_WIDTH: 0.17734
G1 X134.051 Y142.374 E.00166
; WIPE_START
G1 F15000
G1 X133.912 Y142.434 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.684 Y135.517 Z5 F42000
G1 X127.906 Y129.563 Z5
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.45586
G1 F3909
M204 S6000
G1 X123.294 Y129.563 E.15519
; WIPE_START
G1 F8717.973
G1 X125.294 Y129.563 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.516 Y127.166 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.39982
G1 F3909
M204 S6000
G1 X127.516 Y126.809 E.01038
G1 X125.684 Y126.809 E.05328
G1 X125.684 Y127.166 E.01038
G1 X127.456 Y127.166 E.05153
M204 S10000
G1 X128 Y127.744 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
G1 F3909
M204 S6000
G1 X128 Y128.256 E.00784
M204 S10000
G1 X128.484 Y128.834 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.399825
G1 F3909
M204 S6000
G1 X128.484 Y129.191 E.01038
G1 X130.316 Y129.191 E.05328
G1 X130.316 Y128.834 E.01038
G1 X128.544 Y128.834 E.05153
; WIPE_START
G1 F10086.717
G1 X130.316 Y128.834 E-.67333
G1 X130.316 Y129.062 E-.08667
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.094 Y126.437 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.45586
G1 F3909
M204 S6000
M73 P72 R4
G1 X132.706 Y126.437 E.15519
M204 S10000
G1 X133.4 Y126.244 F42000
; LINE_WIDTH: 0.631239
G1 F3909
M204 S6000
G1 X133.4 Y116.369 E.47341
M204 S10000
G1 X132.744 Y113.952 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3909
M204 S6000
G1 X133.549 Y113.952 E.02669
G1 X133.549 Y114.775 E.02732
G1 X132.099 Y116.225 E.06799
G1 X131.577 Y116.225 E.01734
G1 X129.303 Y113.951 E.10666
G1 X128.45 Y113.951 E.02829
G1 X128.45 Y114.727 E.02573
; WIPE_START
G1 F8843.478
G1 X128.45 Y113.951 E-.29472
G1 X129.303 Y113.951 E-.32404
G1 X129.566 Y114.214 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.906 Y113.525 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279727
G1 F3909
M204 S6000
G1 X122.293 Y113.525 E.10831
G2 X122.163 Y113.543 I.021 J.653 E.00254
; LINE_WIDTH: 0.232331
G1 X122.119 Y113.556 E.0007
; LINE_WIDTH: 0.202497
G1 X122.073 Y113.573 E.00064
; LINE_WIDTH: 0.162932
G1 X121.942 Y113.632 E.0014
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X122.073 Y113.573 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/42
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z5 I-1.114 J.489 P1  F42000
G1 X127.898 Y126.84 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3922
M204 S6000
G1 X127.898 Y127.548 E.02348
G1 X125.302 Y127.548 E.08611
G1 X125.302 Y126.427 E.03718
G1 X127.898 Y126.427 E.08611
G1 X127.898 Y126.78 E.01171
M204 S250
G1 X128.29 Y126.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3922
M204 S5000
G1 X133.91 Y126.84 E.17269
G1 X133.91 Y128.06 E.03749
G1 X128.29 Y128.06 E.17269
G1 X128.29 Y126.9 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.102 Y128.452 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3922
M204 S6000
G1 X130.698 Y128.452 E.08611
G1 X130.698 Y129.573 E.03718
G1 X128.102 Y129.573 E.08611
G1 X128.102 Y128.512 E.03519
M204 S250
G1 X127.71 Y127.94 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3922
M204 S5000
G1 X127.71 Y129.16 E.03749
G1 X122.09 Y129.16 E.17269
G1 X122.09 Y127.94 E.03749
G1 X127.65 Y127.94 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.71 Y129.16 E-.46416
G1 X126.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.098 Y129.573 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3922
M204 S6000
G1 X123.098 Y139.427 E.32688
G1 X130.698 Y139.427 E.25211
G1 X130.698 Y140.548 E.03718
G1 X127.898 Y140.548 E.09288
G1 X127.898 Y142.397 E.06135
G1 X122.262 Y142.393 E.18697
G3 X122.103 Y142.202 I.043 J-.197 E.00888
G1 X122.102 Y129.552 E.41963
G1 X123.059 Y129.552 E.03173
; WIPE_START
G1 F8843.478
G1 X123.067 Y131.552 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.778 Y138.222 Z5.2 F42000
G1 X128.29 Y140.94 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3922
M204 S5000
G1 X133.91 Y140.94 E.17269
G1 X133.91 Y142.16 E.03749
G1 X128.29 Y142.16 E.17269
G1 X128.29 Y141 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.534 Y133.384 Z5.2 F42000
G1 X127.71 Y115.06 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F3922
M204 S5000
G1 X122.09 Y115.06 E.17269
G1 X122.09 Y113.84 E.03749
G1 X127.71 Y113.84 E.17269
G1 X127.71 Y115 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.302 Y116.573 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3922
M204 S6000
G1 X125.302 Y115.452 E.03718
G1 X128.102 Y115.452 E.09288
G1 X128.102 Y113.603 E.06135
G1 X133.717 Y113.603 E.18627
G1 X133.839 Y113.661 E.00447
G1 X133.88 Y113.718 E.00233
G1 X133.897 Y113.79 E.00246
G1 X133.898 Y126.448 E.41987
G1 X132.902 Y126.448 E.03303
G1 X132.902 Y116.573 E.32757
G1 X125.362 Y116.573 E.25012
; WIPE_START
G1 F8843.478
G1 X125.302 Y115.452 E-.42654
G1 X126.18 Y115.452 E-.33346
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.789 Y122.957 Z5.2 F42000
G1 X123.49 Y129.965 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3922
M204 S5000
G1 X123.49 Y139.035 E.2787
G1 X131.09 Y139.035 E.23353
G1 X131.09 Y140.81 E.05454
G1 X134.06 Y140.81 E.09126
G1 X134.06 Y140.335 E.0146
G1 X134.29 Y140.335 E.00706
G1 X134.289 Y142.229 E.05819
G3 X133.726 Y142.789 I-.594 J-.034 E.02671
G1 X122.305 Y142.79 E.35094
G3 X121.711 Y142.226 I.007 J-.602 E.02768
G1 X121.71 Y127.335 E.45757
G1 X121.94 Y127.335 E.00707
G1 X121.94 Y127.81 E.0146
G1 X124.91 Y127.81 E.09126
G1 X124.91 Y126.035 E.05454
G1 X132.51 Y126.035 E.23353
G1 X132.51 Y116.965 E.2787
G1 X124.91 Y116.965 E.23353
G1 X124.91 Y115.19 E.05454
G1 X121.94 Y115.19 E.09126
G1 X121.94 Y115.665 E.0146
G1 X121.71 Y115.665 E.00706
G1 X121.711 Y113.774 E.05811
G3 X122.274 Y113.211 I.594 J.031 E.02679
G1 X133.757 Y113.213 E.35286
G3 X134.289 Y113.771 I-.059 J.589 E.0258
G1 X134.29 Y128.665 E.45765
G1 X134.06 Y128.665 E.00707
G1 X134.06 Y128.19 E.0146
G1 X131.09 Y128.19 E.09126
G1 X131.09 Y129.965 E.05454
G1 X123.55 Y129.965 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.537 Y131.965 E-.76
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


G1 X122.6 Y129.756 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.631239
G1 F3922
M204 S6000
G1 X122.6 Y139.631 E.47341
M204 S10000
G1 X127.55 Y141.273 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3922
M204 S6000
G1 X127.55 Y142.049 E.02574
G1 X126.697 Y142.049 E.02827
G1 X124.423 Y139.775 E.10668
G1 X123.901 Y139.775 E.01734
G1 X122.451 Y141.225 E.06799
G1 X122.451 Y142.05 E.02736
G1 X123.255 Y142.05 E.02665
; WIPE_START
G1 F8843.478
G1 X122.451 Y142.05 E-.30528
G1 X122.451 Y141.225 E-.31348
G1 X122.714 Y140.962 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.094 Y142.475 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280105
G1 F3922
M204 S6000
G1 X133.754 Y142.472 E.10939
; LINE_WIDTH: 0.25495
G1 X133.866 Y142.449 E.00198
; LINE_WIDTH: 0.213497
G1 X133.912 Y142.434 E.00066
; LINE_WIDTH: 0.177397
G1 X134.051 Y142.374 E.00166
; WIPE_START
G1 F15000
G1 X133.912 Y142.434 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.684 Y135.517 Z5.2 F42000
G1 X127.906 Y129.563 Z5.2
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.45586
G1 F3922
M204 S6000
G1 X123.294 Y129.563 E.15519
; WIPE_START
G1 F8717.973
G1 X125.294 Y129.563 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.516 Y127.166 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.39982
G1 F3922
M204 S6000
G1 X127.516 Y126.809 E.01038
G1 X125.684 Y126.809 E.05328
G1 X125.684 Y127.166 E.01038
G1 X127.456 Y127.166 E.05153
M204 S10000
G1 X128 Y127.744 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
G1 F3922
M204 S6000
G1 X128 Y128.256 E.00784
M204 S10000
M73 P73 R4
G1 X128.484 Y128.834 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.399825
G1 F3922
M204 S6000
G1 X128.484 Y129.191 E.01038
G1 X130.316 Y129.191 E.05328
G1 X130.316 Y128.834 E.01038
G1 X128.544 Y128.834 E.05153
; WIPE_START
G1 F10086.717
G1 X130.316 Y128.834 E-.67333
G1 X130.316 Y129.062 E-.08667
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.094 Y126.437 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.45586
G1 F3922
M204 S6000
G1 X132.706 Y126.437 E.15519
M204 S10000
G1 X133.4 Y126.244 F42000
; LINE_WIDTH: 0.631239
G1 F3922
M204 S6000
G1 X133.4 Y116.369 E.47341
M204 S10000
G1 X128.45 Y114.727 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3922
M204 S6000
G1 X128.45 Y113.951 E.02573
G1 X129.303 Y113.951 E.02829
G1 X131.577 Y116.225 E.10666
G1 X132.099 Y116.225 E.01734
G1 X133.549 Y114.775 E.06799
G1 X133.549 Y113.952 E.02732
G1 X132.744 Y113.952 E.02669
; WIPE_START
G1 F8843.478
G1 X133.549 Y113.952 E-.30579
G1 X133.549 Y114.775 E-.31297
G1 X133.286 Y115.038 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.906 Y113.525 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279812
G1 F3922
M204 S6000
G1 X122.293 Y113.525 E.10835
G1 X122.177 Y113.54 E.00226
; LINE_WIDTH: 0.240349
G1 X122.133 Y113.551 E.00072
; LINE_WIDTH: 0.213439
G1 X122.088 Y113.566 E.00066
; LINE_WIDTH: 0.177382
G1 X121.949 Y113.626 E.00166
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X122.088 Y113.566 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/42
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z5.2 I-1.115 J.488 P1  F42000
G1 X127.898 Y126.84 Z5.2
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3916
M204 S6000
G1 X127.898 Y127.548 E.02348
G1 X125.302 Y127.548 E.08611
G1 X125.302 Y126.427 E.03718
G1 X127.898 Y126.427 E.08611
G1 X127.898 Y126.78 E.01171
M204 S250
G1 X128.29 Y126.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3916
M204 S5000
G1 X133.91 Y126.84 E.17269
G1 X133.91 Y128.06 E.03749
G1 X128.29 Y128.06 E.17269
G1 X128.29 Y126.9 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.102 Y128.452 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3916
M204 S6000
G1 X130.698 Y128.452 E.08611
G1 X130.698 Y129.573 E.03718
G1 X128.102 Y129.573 E.08611
G1 X128.102 Y128.512 E.03519
M204 S250
G1 X127.71 Y127.94 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3916
M204 S5000
G1 X127.71 Y129.16 E.03749
G1 X122.09 Y129.16 E.17269
G1 X122.09 Y127.94 E.03749
G1 X127.65 Y127.94 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.71 Y129.16 E-.46416
G1 X126.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.098 Y129.573 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3916
M204 S6000
G1 X123.098 Y139.427 E.32688
G1 X130.698 Y139.427 E.25211
G1 X130.698 Y140.548 E.03718
G1 X127.898 Y140.548 E.09288
G1 X127.898 Y142.397 E.06135
G1 X122.261 Y142.393 E.18697
G3 X122.103 Y142.205 I.043 J-.197 E.0088
G1 X122.102 Y129.552 E.41971
G1 X123.059 Y129.552 E.03173
; WIPE_START
G1 F8843.478
G1 X123.067 Y131.552 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.778 Y138.222 Z5.4 F42000
G1 X128.29 Y140.94 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3916
M204 S5000
G1 X133.91 Y140.94 E.17269
G1 X133.91 Y142.16 E.03749
G1 X128.29 Y142.16 E.17269
G1 X128.29 Y141 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.534 Y133.384 Z5.4 F42000
G1 X127.71 Y115.06 Z5.4
G1 Z5
G1 E.8 F1800
G1 F3916
M204 S5000
G1 X122.09 Y115.06 E.17269
G1 X122.09 Y113.84 E.03749
G1 X127.71 Y113.84 E.17269
G1 X127.71 Y115 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.302 Y116.573 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3916
M204 S6000
G1 X125.302 Y115.452 E.03718
G1 X128.102 Y115.452 E.09288
G1 X128.102 Y113.603 E.06135
G1 X133.717 Y113.603 E.18627
G1 X133.839 Y113.661 E.00447
G1 X133.878 Y113.713 E.00215
G1 X133.897 Y113.79 E.00265
G1 X133.898 Y126.448 E.41987
G1 X132.902 Y126.448 E.03303
G1 X132.902 Y116.573 E.32757
G1 X125.362 Y116.573 E.25012
; WIPE_START
G1 F8843.478
G1 X125.302 Y115.452 E-.42654
G1 X126.18 Y115.452 E-.33346
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.789 Y122.957 Z5.4 F42000
G1 X123.49 Y129.965 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3916
M204 S5000
G1 X123.49 Y139.035 E.2787
G1 X131.09 Y139.035 E.23353
G1 X131.09 Y140.81 E.05454
G1 X134.06 Y140.81 E.09126
G1 X134.06 Y140.335 E.0146
G1 X134.29 Y140.335 E.00706
G1 X134.289 Y142.229 E.05819
G3 X133.726 Y142.789 I-.594 J-.034 E.02671
G1 X122.305 Y142.79 E.35094
G3 X121.711 Y142.227 I.012 J-.608 E.02759
G1 X121.71 Y127.335 E.45759
G1 X121.94 Y127.335 E.00707
G1 X121.94 Y127.81 E.0146
G1 X124.91 Y127.81 E.09126
G1 X124.91 Y126.035 E.05454
G1 X132.51 Y126.035 E.23353
G1 X132.51 Y116.965 E.2787
G1 X124.91 Y116.965 E.23353
G1 X124.91 Y115.19 E.05454
G1 X121.94 Y115.19 E.09126
G1 X121.94 Y115.665 E.0146
G1 X121.71 Y115.665 E.00706
G1 X121.711 Y113.771 E.05819
G3 X122.274 Y113.211 I.594 J.034 E.02671
G1 X133.757 Y113.213 E.35286
G3 X134.289 Y113.771 I-.059 J.589 E.0258
G1 X134.29 Y128.665 E.45765
G1 X134.06 Y128.665 E.00707
G1 X134.06 Y128.19 E.0146
G1 X131.09 Y128.19 E.09126
G1 X131.09 Y129.965 E.05454
G1 X123.55 Y129.965 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.537 Y131.965 E-.76
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


G1 X122.6 Y129.756 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.631239
G1 F3916
M204 S6000
G1 X122.6 Y139.631 E.47341
M204 S10000
G1 X123.255 Y142.05 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3916
M204 S6000
G1 X122.451 Y142.05 E.02665
G1 X122.451 Y141.225 E.02736
G1 X123.901 Y139.775 E.06799
G1 X124.423 Y139.775 E.01734
G1 X126.697 Y142.049 E.10668
G1 X127.55 Y142.049 E.02827
G1 X127.55 Y141.273 E.02574
; WIPE_START
G1 F8843.478
G1 X127.55 Y142.049 E-.2949
G1 X126.697 Y142.049 E-.32387
G1 X126.435 Y141.786 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.094 Y142.475 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280105
G1 F3916
M204 S6000
G1 X133.754 Y142.472 E.10939
; LINE_WIDTH: 0.254968
G1 X133.866 Y142.449 E.00198
; LINE_WIDTH: 0.213486
G1 X133.912 Y142.434 E.00067
; LINE_WIDTH: 0.177378
G1 X134.051 Y142.374 E.00166
; WIPE_START
G1 F15000
G1 X133.912 Y142.434 E-.76
; WIPE_END
M73 P74 R4
G1 E-.04 F1800
M204 S10000
G1 X130.684 Y135.517 Z5.4 F42000
G1 X127.906 Y129.563 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.45586
G1 F3916
M204 S6000
G1 X123.294 Y129.563 E.15519
; WIPE_START
G1 F8717.973
G1 X125.294 Y129.563 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.516 Y127.166 Z5.4 F42000
G1 Z5
M73 P74 R3
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.39982
G1 F3916
M204 S6000
G1 X127.516 Y126.809 E.01038
G1 X125.684 Y126.809 E.05328
G1 X125.684 Y127.166 E.01038
G1 X127.456 Y127.166 E.05153
M204 S10000
G1 X128 Y127.744 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
G1 F3916
M204 S6000
G1 X128 Y128.256 E.00784
M204 S10000
G1 X128.484 Y128.834 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.399825
G1 F3916
M204 S6000
G1 X128.484 Y129.191 E.01038
G1 X130.316 Y129.191 E.05328
G1 X130.316 Y128.834 E.01038
G1 X128.544 Y128.834 E.05153
; WIPE_START
G1 F10086.717
G1 X130.316 Y128.834 E-.67333
G1 X130.316 Y129.062 E-.08667
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.094 Y126.437 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.45586
G1 F3916
M204 S6000
G1 X132.706 Y126.437 E.15519
M204 S10000
G1 X133.4 Y126.244 F42000
; LINE_WIDTH: 0.631239
G1 F3916
M204 S6000
G1 X133.4 Y116.369 E.47341
M204 S10000
G1 X132.744 Y113.952 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3916
M204 S6000
G1 X133.549 Y113.952 E.02669
G1 X133.549 Y114.775 E.02732
G1 X132.099 Y116.225 E.06799
G1 X131.577 Y116.225 E.01734
G1 X129.303 Y113.951 E.10666
G1 X128.45 Y113.951 E.02829
G1 X128.45 Y114.727 E.02573
; WIPE_START
G1 F8843.478
G1 X128.45 Y113.951 E-.29472
G1 X129.303 Y113.951 E-.32404
G1 X129.566 Y114.214 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.906 Y113.525 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279522
G1 F3916
M204 S6000
G1 X122.293 Y113.525 E.10822
G2 X121.987 Y113.563 I.105 J2.094 E.00595
M204 S10000
G1 X121.949 Y113.626 F42000
; LINE_WIDTH: 0.177347
G1 F3916
M204 S6000
G1 X122.088 Y113.566 E.00166
; LINE_WIDTH: 0.214237
G1 X122.552 Y113.407 E.00684
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X122.088 Y113.566 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/42
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z5.4 I-1.115 J.488 P1  F42000
G1 X127.898 Y126.84 Z5.4
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3923
M204 S6000
G1 X127.898 Y127.548 E.02348
G1 X125.302 Y127.548 E.08611
G1 X125.302 Y126.427 E.03718
G1 X127.898 Y126.427 E.08611
G1 X127.898 Y126.78 E.01171
M204 S250
G1 X128.29 Y126.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3923
M204 S5000
G1 X133.91 Y126.84 E.17269
G1 X133.91 Y128.06 E.03749
G1 X128.29 Y128.06 E.17269
G1 X128.29 Y126.9 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.102 Y128.452 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3923
M204 S6000
G1 X130.698 Y128.452 E.08611
G1 X130.698 Y129.573 E.03718
G1 X128.102 Y129.573 E.08611
G1 X128.102 Y128.512 E.03519
M204 S250
G1 X127.71 Y127.94 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3923
M204 S5000
G1 X127.71 Y129.16 E.03749
G1 X122.09 Y129.16 E.17269
G1 X122.09 Y127.94 E.03749
G1 X127.65 Y127.94 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.71 Y129.16 E-.46416
G1 X126.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.098 Y129.573 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3923
M204 S6000
G1 X123.098 Y139.427 E.32688
G1 X130.698 Y139.427 E.25211
G1 X130.698 Y140.548 E.03718
G1 X127.898 Y140.548 E.09288
G1 X127.898 Y142.397 E.06135
G1 X122.261 Y142.393 E.18698
G3 X122.103 Y142.216 I.051 J-.205 E.00837
G1 X122.102 Y129.552 E.4201
G1 X123.059 Y129.552 E.03173
; WIPE_START
G1 F8843.478
G1 X123.067 Y131.552 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.778 Y138.222 Z5.6 F42000
G1 X128.29 Y140.94 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3923
M204 S5000
G1 X133.91 Y140.94 E.17269
G1 X133.91 Y142.16 E.03749
G1 X128.29 Y142.16 E.17269
G1 X128.29 Y141 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.534 Y133.384 Z5.6 F42000
G1 X127.71 Y115.06 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F3923
M204 S5000
G1 X122.09 Y115.06 E.17269
G1 X122.09 Y113.84 E.03749
G1 X127.71 Y113.84 E.17269
G1 X127.71 Y115 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.302 Y116.573 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3923
M204 S6000
G1 X125.302 Y115.452 E.03718
G1 X128.102 Y115.452 E.09288
G1 X128.102 Y113.603 E.06135
G1 X133.718 Y113.603 E.18628
G1 X133.839 Y113.661 E.00446
G1 X133.877 Y113.713 E.00214
G1 X133.897 Y113.79 E.00265
G1 X133.898 Y126.448 E.41987
G1 X132.902 Y126.448 E.03303
G1 X132.902 Y116.573 E.32757
G1 X125.362 Y116.573 E.25012
; WIPE_START
G1 F8843.478
G1 X125.302 Y115.452 E-.42654
G1 X126.18 Y115.452 E-.33346
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.789 Y122.957 Z5.6 F42000
G1 X123.49 Y129.965 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3923
M204 S5000
G1 X123.49 Y139.035 E.2787
G1 X131.09 Y139.035 E.23353
G1 X131.09 Y140.81 E.05454
G1 X134.06 Y140.81 E.09126
G1 X134.06 Y140.335 E.0146
G1 X134.29 Y140.335 E.00706
G1 X134.289 Y142.229 E.05819
G3 X133.727 Y142.789 I-.594 J-.034 E.02669
G1 X122.305 Y142.79 E.35096
G3 X121.711 Y142.229 I.012 J-.609 E.02754
G1 X121.71 Y127.335 E.45765
G1 X121.94 Y127.335 E.00707
G1 X121.94 Y127.81 E.0146
G1 X124.91 Y127.81 E.09126
G1 X124.91 Y126.035 E.05454
G1 X132.51 Y126.035 E.23353
G1 X132.51 Y116.965 E.2787
G1 X124.91 Y116.965 E.23353
G1 X124.91 Y115.19 E.05454
G1 X121.94 Y115.19 E.09126
G1 X121.94 Y115.665 E.0146
G1 X121.71 Y115.665 E.00706
G1 X121.711 Y113.771 E.05819
G3 X122.274 Y113.211 I.608 J.048 E.02657
G1 X133.757 Y113.213 E.35286
G3 X134.289 Y113.771 I-.059 J.589 E.0258
G1 X134.29 Y128.665 E.45765
G1 X134.06 Y128.665 E.00707
G1 X134.06 Y128.19 E.0146
G1 X131.09 Y128.19 E.09126
G1 X131.09 Y129.965 E.05454
G1 X123.55 Y129.965 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.537 Y131.965 E-.76
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
M73 P75 R3
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X122.6 Y129.756 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.631239
G1 F3923
M204 S6000
G1 X122.6 Y139.631 E.47341
M204 S10000
G1 X127.55 Y141.273 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3923
M204 S6000
G1 X127.55 Y142.049 E.02574
G1 X126.697 Y142.049 E.02827
G1 X124.423 Y139.775 E.10668
G1 X123.901 Y139.775 E.01734
G1 X122.451 Y141.225 E.06799
G1 X122.451 Y142.05 E.02736
G1 X123.255 Y142.05 E.02665
; WIPE_START
G1 F8843.478
G1 X122.451 Y142.05 E-.30528
G1 X122.451 Y141.225 E-.31348
G1 X122.714 Y140.962 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.094 Y142.475 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280112
G1 F3923
M204 S6000
G1 X133.75 Y142.472 E.10932
; LINE_WIDTH: 0.255467
G2 X133.866 Y142.449 I-.076 J-.685 E.00205
; LINE_WIDTH: 0.213421
G1 X133.912 Y142.434 E.00066
; LINE_WIDTH: 0.17733
G1 X134.051 Y142.374 E.00166
; WIPE_START
G1 F15000
G1 X133.912 Y142.434 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.684 Y135.517 Z5.6 F42000
G1 X127.906 Y129.563 Z5.6
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.45586
G1 F3923
M204 S6000
G1 X123.294 Y129.563 E.15519
; WIPE_START
G1 F8717.973
G1 X125.294 Y129.563 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.516 Y127.166 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.39982
G1 F3923
M204 S6000
G1 X127.516 Y126.809 E.01038
G1 X125.684 Y126.809 E.05328
G1 X125.684 Y127.166 E.01038
G1 X127.456 Y127.166 E.05153
M204 S10000
G1 X128 Y127.744 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
G1 F3923
M204 S6000
G1 X128 Y128.256 E.00784
M204 S10000
G1 X128.484 Y128.834 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.399825
G1 F3923
M204 S6000
G1 X128.484 Y129.191 E.01038
G1 X130.316 Y129.191 E.05328
G1 X130.316 Y128.834 E.01038
G1 X128.544 Y128.834 E.05153
; WIPE_START
G1 F10086.717
G1 X130.316 Y128.834 E-.67333
G1 X130.316 Y129.062 E-.08667
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.094 Y126.437 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.45586
G1 F3923
M204 S6000
G1 X132.706 Y126.437 E.15519
M204 S10000
G1 X133.4 Y126.244 F42000
; LINE_WIDTH: 0.631239
G1 F3923
M204 S6000
G1 X133.4 Y116.369 E.47341
M204 S10000
G1 X128.45 Y114.727 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3923
M204 S6000
G1 X128.45 Y113.951 E.02573
G1 X129.303 Y113.951 E.02829
G1 X131.577 Y116.225 E.10666
G1 X132.099 Y116.225 E.01734
G1 X133.549 Y114.775 E.06799
G1 X133.549 Y113.952 E.02732
G1 X132.744 Y113.952 E.0267
; WIPE_START
G1 F8843.478
G1 X133.549 Y113.952 E-.30582
G1 X133.549 Y114.775 E-.31295
G1 X133.286 Y115.038 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.906 Y113.525 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.27984
G1 F3923
M204 S6000
G1 X122.293 Y113.525 E.10836
G2 X122.18 Y113.539 I.018 J.649 E.0022
; LINE_WIDTH: 0.241258
G1 X122.133 Y113.551 E.00078
; LINE_WIDTH: 0.213398
G1 X122.088 Y113.566 E.00066
; LINE_WIDTH: 0.177376
G1 X121.949 Y113.626 E.00166
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X122.088 Y113.566 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/42
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z5.6 I-1.115 J.488 P1  F42000
G1 X127.898 Y126.84 Z5.6
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3909
M204 S6000
G1 X127.898 Y127.548 E.02348
G1 X125.302 Y127.548 E.08611
G1 X125.302 Y126.427 E.03718
G1 X127.898 Y126.427 E.08611
G1 X127.898 Y126.78 E.01171
M204 S250
G1 X128.29 Y126.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3909
M204 S5000
G1 X133.91 Y126.84 E.17269
G1 X133.91 Y128.06 E.03749
G1 X128.29 Y128.06 E.17269
G1 X128.29 Y126.9 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.102 Y128.452 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3909
M204 S6000
G1 X130.698 Y128.452 E.08611
G1 X130.698 Y129.573 E.03718
G1 X128.102 Y129.573 E.08611
G1 X128.102 Y128.512 E.03519
M204 S250
G1 X127.71 Y127.94 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3909
M204 S5000
G1 X127.71 Y129.16 E.03749
G1 X122.09 Y129.16 E.17269
G1 X122.09 Y127.94 E.03749
G1 X127.65 Y127.94 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.71 Y129.16 E-.46416
G1 X126.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.098 Y129.573 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3909
M204 S6000
G1 X123.098 Y139.427 E.32688
G1 X130.698 Y139.427 E.25211
G1 X130.698 Y140.548 E.03718
G1 X127.898 Y140.548 E.09288
G1 X127.898 Y142.397 E.06135
G1 X122.262 Y142.393 E.18697
G3 X122.103 Y142.202 I.049 J-.202 E.00883
G1 X122.102 Y129.552 E.41963
G1 X123.059 Y129.552 E.03173
; WIPE_START
G1 F8843.478
G1 X123.067 Y131.552 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.778 Y138.222 Z5.8 F42000
G1 X128.29 Y140.94 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3909
M204 S5000
G1 X133.91 Y140.94 E.17269
G1 X133.91 Y142.16 E.03749
G1 X128.29 Y142.16 E.17269
G1 X128.29 Y141 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.534 Y133.384 Z5.8 F42000
G1 X127.71 Y115.06 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F3909
M204 S5000
G1 X122.09 Y115.06 E.17269
G1 X122.09 Y113.84 E.03749
G1 X127.71 Y113.84 E.17269
G1 X127.71 Y115 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.302 Y116.573 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3909
M204 S6000
G1 X125.302 Y115.452 E.03718
G1 X128.102 Y115.452 E.09288
G1 X128.102 Y113.603 E.06135
G1 X133.718 Y113.603 E.18628
G1 X133.839 Y113.661 E.00446
G3 X133.897 Y113.79 I-.143 J.141 E.00481
G1 X133.898 Y126.448 E.41987
G1 X132.902 Y126.448 E.03303
G1 X132.902 Y116.573 E.32757
G1 X125.362 Y116.573 E.25012
; WIPE_START
G1 F8843.478
G1 X125.302 Y115.452 E-.42654
G1 X126.18 Y115.452 E-.33346
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.789 Y122.957 Z5.8 F42000
G1 X123.49 Y129.965 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3909
M204 S5000
G1 X123.49 Y139.035 E.2787
G1 X131.09 Y139.035 E.23353
G1 X131.09 Y140.81 E.05454
G1 X134.06 Y140.81 E.09126
G1 X134.06 Y140.335 E.0146
M73 P76 R3
G1 X134.29 Y140.335 E.00706
G1 X134.289 Y142.229 E.05819
G3 X133.726 Y142.789 I-.594 J-.034 E.02671
G1 X122.305 Y142.79 E.35093
G3 X121.711 Y142.226 I.012 J-.608 E.02761
G1 X121.71 Y127.335 E.45757
G1 X121.94 Y127.335 E.00707
G1 X121.94 Y127.81 E.0146
G1 X124.91 Y127.81 E.09126
G1 X124.91 Y126.035 E.05454
G1 X132.51 Y126.035 E.23353
G1 X132.51 Y116.965 E.2787
G1 X124.91 Y116.965 E.23353
G1 X124.91 Y115.19 E.05454
G1 X121.94 Y115.19 E.09126
G1 X121.94 Y115.665 E.0146
G1 X121.71 Y115.665 E.00706
G1 X121.711 Y113.771 E.05819
G3 X122.274 Y113.211 I.594 J.034 E.02671
G1 X133.757 Y113.213 E.35286
G3 X134.289 Y113.771 I-.066 J.595 E.02573
G1 X134.29 Y128.665 E.45765
G1 X134.06 Y128.665 E.00707
G1 X134.06 Y128.19 E.0146
G1 X131.09 Y128.19 E.09126
G1 X131.09 Y129.965 E.05454
G1 X123.55 Y129.965 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.537 Y131.965 E-.76
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


G1 X122.6 Y129.756 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.631239
G1 F3909
M204 S6000
G1 X122.6 Y139.631 E.47341
M204 S10000
G1 X123.255 Y142.05 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3909
M204 S6000
G1 X122.451 Y142.05 E.02665
G1 X122.451 Y141.225 E.02736
G1 X123.901 Y139.775 E.06799
G1 X124.423 Y139.775 E.01734
G1 X126.697 Y142.049 E.10668
G1 X127.55 Y142.049 E.02827
G1 X127.55 Y141.273 E.02574
; WIPE_START
G1 F8843.478
G1 X127.55 Y142.049 E-.2949
G1 X126.697 Y142.049 E-.32387
G1 X126.435 Y141.786 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.094 Y142.475 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280097
G1 F3909
M204 S6000
G1 X133.761 Y142.471 E.10952
; LINE_WIDTH: 0.253808
G2 X133.866 Y142.449 I-.105 J-.765 E.00186
; LINE_WIDTH: 0.213455
G1 X133.912 Y142.434 E.00067
; LINE_WIDTH: 0.177413
G1 X134.051 Y142.374 E.00166
; WIPE_START
G1 F15000
G1 X133.912 Y142.434 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.684 Y135.517 Z5.8 F42000
G1 X127.906 Y129.563 Z5.8
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.45586
G1 F3909
M204 S6000
G1 X123.294 Y129.563 E.15519
; WIPE_START
G1 F8717.973
G1 X125.294 Y129.563 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.516 Y127.166 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.39982
G1 F3909
M204 S6000
G1 X127.516 Y126.809 E.01038
G1 X125.684 Y126.809 E.05328
G1 X125.684 Y127.166 E.01038
G1 X127.456 Y127.166 E.05153
M204 S10000
G1 X128 Y127.744 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
G1 F3909
M204 S6000
G1 X128 Y128.256 E.00784
M204 S10000
G1 X128.484 Y128.834 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.399825
G1 F3909
M204 S6000
G1 X128.484 Y129.191 E.01038
G1 X130.316 Y129.191 E.05328
G1 X130.316 Y128.834 E.01038
G1 X128.544 Y128.834 E.05153
; WIPE_START
G1 F10086.717
G1 X130.316 Y128.834 E-.67333
G1 X130.316 Y129.062 E-.08667
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.094 Y126.437 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.45586
G1 F3909
M204 S6000
G1 X132.706 Y126.437 E.15519
M204 S10000
G1 X133.4 Y126.244 F42000
; LINE_WIDTH: 0.631239
G1 F3909
M204 S6000
G1 X133.4 Y116.369 E.47341
M204 S10000
G1 X132.744 Y113.952 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3909
M204 S6000
G1 X133.549 Y113.952 E.0267
G1 X133.549 Y114.775 E.02732
G1 X132.099 Y116.225 E.06799
G1 X131.577 Y116.225 E.01734
G1 X129.303 Y113.951 E.10666
G1 X128.45 Y113.951 E.02829
G1 X128.45 Y114.727 E.02573
; WIPE_START
G1 F8843.478
G1 X128.45 Y113.951 E-.29472
G1 X129.303 Y113.951 E-.32404
G1 X129.566 Y114.214 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.906 Y113.525 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279736
G1 F3909
M204 S6000
G1 X122.293 Y113.525 E.10831
G2 X122.161 Y113.543 I.021 J.659 E.00258
; LINE_WIDTH: 0.215407
G2 X121.956 Y113.613 I.484 J1.763 E.00305
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X122.161 Y113.543 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/42
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z5.8 I-1.117 J.482 P1  F42000
G1 X127.898 Y126.84 Z5.8
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3928
M204 S6000
G1 X127.898 Y127.548 E.02348
G1 X125.302 Y127.548 E.08611
G1 X125.302 Y126.427 E.03718
G1 X127.898 Y126.427 E.08611
G1 X127.898 Y126.78 E.01171
M204 S250
G1 X128.29 Y126.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3928
M204 S5000
G1 X133.91 Y126.84 E.17269
G1 X133.91 Y128.06 E.03749
G1 X128.29 Y128.06 E.17269
G1 X128.29 Y126.9 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.102 Y128.452 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3928
M204 S6000
G1 X130.698 Y128.452 E.08611
G1 X130.698 Y129.573 E.03718
G1 X128.102 Y129.573 E.08611
G1 X128.102 Y128.512 E.03519
M204 S250
G1 X127.71 Y127.94 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3928
M204 S5000
G1 X127.71 Y129.16 E.03749
G1 X122.09 Y129.16 E.17269
G1 X122.09 Y127.94 E.03749
G1 X127.65 Y127.94 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.71 Y129.16 E-.46416
G1 X126.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.098 Y129.573 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3928
M204 S6000
G1 X123.098 Y139.427 E.32688
G1 X130.698 Y139.427 E.25211
G1 X130.698 Y140.548 E.03718
G1 X127.898 Y140.548 E.09288
G1 X127.898 Y142.397 E.06135
G1 X122.262 Y142.393 E.18697
G3 X122.103 Y142.202 I.049 J-.202 E.00883
G1 X122.102 Y129.552 E.41963
G1 X123.059 Y129.552 E.03173
; WIPE_START
G1 F8843.478
G1 X123.067 Y131.552 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.778 Y138.222 Z6 F42000
G1 X128.29 Y140.94 Z6
M73 P77 R3
G1 Z5.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3928
M204 S5000
G1 X133.91 Y140.94 E.17269
G1 X133.91 Y142.16 E.03749
G1 X128.29 Y142.16 E.17269
G1 X128.29 Y141 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.534 Y133.384 Z6 F42000
G1 X127.71 Y115.06 Z6
G1 Z5.6
G1 E.8 F1800
G1 F3928
M204 S5000
G1 X122.09 Y115.06 E.17269
G1 X122.09 Y113.84 E.03749
G1 X127.71 Y113.84 E.17269
G1 X127.71 Y115 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.302 Y116.573 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3928
M204 S6000
G1 X125.302 Y115.452 E.03718
G1 X128.102 Y115.452 E.09288
G1 X128.102 Y113.603 E.06135
G1 X133.718 Y113.604 E.18629
G1 X133.839 Y113.66 E.00445
G1 X133.877 Y113.713 E.00214
G1 X133.897 Y113.79 E.00266
G1 X133.898 Y126.448 E.41987
G1 X132.902 Y126.448 E.03303
G1 X132.902 Y116.573 E.32757
G1 X125.362 Y116.573 E.25012
; WIPE_START
G1 F8843.478
G1 X125.302 Y115.452 E-.42654
G1 X126.18 Y115.452 E-.33346
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.789 Y122.957 Z6 F42000
G1 X123.49 Y129.965 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3928
M204 S5000
G1 X123.49 Y139.035 E.2787
G1 X131.09 Y139.035 E.23353
G1 X131.09 Y140.81 E.05454
G1 X134.06 Y140.81 E.09126
G1 X134.06 Y140.335 E.0146
G1 X134.29 Y140.335 E.00706
G1 X134.289 Y142.229 E.05819
G3 X133.726 Y142.789 I-.594 J-.034 E.02671
G1 X122.305 Y142.79 E.35094
G3 X121.711 Y142.226 I.013 J-.608 E.02761
G1 X121.71 Y127.335 E.45757
G1 X121.94 Y127.335 E.00707
G1 X121.94 Y127.81 E.0146
G1 X124.91 Y127.81 E.09126
G1 X124.91 Y126.035 E.05454
G1 X132.51 Y126.035 E.23353
G1 X132.51 Y116.965 E.2787
G1 X124.91 Y116.965 E.23353
G1 X124.91 Y115.19 E.05454
G1 X121.94 Y115.19 E.09126
G1 X121.94 Y115.665 E.0146
G1 X121.71 Y115.665 E.00706
G1 X121.711 Y113.774 E.05811
G3 X122.274 Y113.211 I.594 J.031 E.02679
G1 X133.757 Y113.213 E.35286
G3 X134.289 Y113.771 I-.06 J.589 E.02579
G1 X134.29 Y128.665 E.45765
G1 X134.06 Y128.665 E.00707
G1 X134.06 Y128.19 E.0146
G1 X131.09 Y128.19 E.09126
G1 X131.09 Y129.965 E.05454
G1 X123.55 Y129.965 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.537 Y131.965 E-.76
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


G1 X122.6 Y129.756 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.631239
G1 F3928
M204 S6000
G1 X122.6 Y139.631 E.47341
M204 S10000
G1 X127.55 Y141.273 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3928
M204 S6000
G1 X127.55 Y142.049 E.02574
G1 X126.697 Y142.049 E.02827
G1 X124.423 Y139.775 E.10668
G1 X123.901 Y139.775 E.01734
G1 X122.451 Y141.225 E.06799
G1 X122.451 Y142.05 E.02736
G1 X123.255 Y142.05 E.02665
; WIPE_START
G1 F8843.478
G1 X122.451 Y142.05 E-.30528
G1 X122.451 Y141.225 E-.31348
G1 X122.714 Y140.962 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.094 Y142.475 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.278371
G1 F3928
M204 S6000
G1 X133.707 Y142.475 E.10769
G2 X134.037 Y142.402 I-.1 J-1.245 E.0065
M204 S10000
G1 X134.051 Y142.374 F42000
; LINE_WIDTH: 0.177379
G1 F3928
M204 S6000
G1 X133.54 Y142.593 E.0061
; WIPE_START
G1 F15000
G1 X134.051 Y142.374 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.75 Y135.492 Z6 F42000
G1 X127.906 Y129.563 Z6
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.45586
G1 F3928
M204 S6000
G1 X123.294 Y129.563 E.15519
; WIPE_START
G1 F8717.973
G1 X125.294 Y129.563 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.516 Y127.166 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.39982
G1 F3928
M204 S6000
G1 X127.516 Y126.809 E.01038
G1 X125.684 Y126.809 E.05328
G1 X125.684 Y127.166 E.01038
G1 X127.456 Y127.166 E.05153
M204 S10000
G1 X128 Y127.744 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
G1 F3928
M204 S6000
G1 X128 Y128.256 E.00784
M204 S10000
G1 X128.484 Y128.834 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.399825
G1 F3928
M204 S6000
G1 X128.484 Y129.191 E.01038
G1 X130.316 Y129.191 E.05328
G1 X130.316 Y128.834 E.01038
G1 X128.544 Y128.834 E.05153
; WIPE_START
G1 F10086.717
G1 X130.316 Y128.834 E-.67333
G1 X130.316 Y129.062 E-.08667
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.094 Y126.437 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.45586
G1 F3928
M204 S6000
G1 X132.706 Y126.437 E.15519
M204 S10000
G1 X133.4 Y126.244 F42000
; LINE_WIDTH: 0.631239
G1 F3928
M204 S6000
G1 X133.4 Y116.369 E.47341
M204 S10000
G1 X128.45 Y114.727 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3928
M204 S6000
G1 X128.45 Y113.951 E.02573
G1 X129.303 Y113.951 E.02829
G1 X131.577 Y116.225 E.10666
G1 X132.099 Y116.225 E.01734
G1 X133.549 Y114.775 E.06799
G1 X133.549 Y113.952 E.02732
G1 X132.744 Y113.952 E.0267
; WIPE_START
G1 F8843.478
G1 X133.549 Y113.952 E-.30584
G1 X133.549 Y114.775 E-.31293
G1 X133.286 Y115.038 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.906 Y113.525 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279738
G1 F3928
M204 S6000
M73 P78 R3
G1 X122.293 Y113.525 E.10831
G2 X122.161 Y113.543 I.021 J.659 E.00257
; LINE_WIDTH: 0.215338
G2 X121.956 Y113.613 I.489 J1.779 E.00305
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X122.161 Y113.543 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/42
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
M106 S198.9
; OBJECT_ID: 394
M204 S10000
G17
G3 Z6 I-1.105 J.509 P1  F42000
G1 X128.29 Y126.84 Z6
G1 Z5.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X133.91 Y126.84 E.17269
G1 X133.91 Y128.06 E.03749
G1 X128.29 Y128.06 E.17269
G1 X128.29 Y126.9 E.03564
; WIPE_START
M204 S6000
G1 X130.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.71 Y127.94 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X127.71 Y129.16 E.03749
G1 X122.09 Y129.16 E.17269
G1 X122.09 Y127.94 E.03749
G1 X127.65 Y127.94 E.17084
; WIPE_START
M204 S6000
G1 X127.71 Y129.16 E-.46416
G1 X126.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.2 I-1.158 J.375 P1  F42000
G1 X130.618 Y140.548 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X127.898 Y140.548 E.09024
G1 X127.898 Y142.397 E.06135
G1 X122.262 Y142.393 E.18697
G3 X122.103 Y142.202 I.049 J-.202 E.00883
G1 X122.102 Y129.552 E.41963
G1 X128.102 Y129.552 E.19903
G1 X128.102 Y128.452 E.03649
G1 X130.698 Y128.452 E.08611
G1 X130.698 Y129.192 E.02456
G1 X130.698 Y129.592 E.01327
G1 F4919.51
G1 X130.698 Y129.992 E.01327
M106 S255
G1 F1800
G1 X130.698 Y130.375 E.01269
M106 S198.9
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X130.698 Y138.625 E.27367
M106 S198.9
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X130.698 Y139.007 E.01269
M106 S198.9
G1 F4919.51
G1 X130.698 Y139.407 E.01327
G1 F8843.478
G1 X130.698 Y139.807 E.01327
G1 X130.698 Y140.548 E.02456
G1 X130.678 Y140.548 E.00065
; WIPE_START
G1 X128.678 Y140.548 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.29 Y140.94 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X133.91 Y140.94 E.17269
G1 X133.91 Y142.16 E.03749
G1 X128.29 Y142.16 E.17269
G1 X128.29 Y141 E.03564
; WIPE_START
M204 S6000
G1 X130.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.2 I1.211 J-.121 P1  F42000
G1 X127.71 Y115.06 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X122.09 Y115.06 E.17269
G1 X122.09 Y113.84 E.03749
G1 X127.71 Y113.84 E.17269
G1 X127.71 Y115 E.03564
; WIPE_START
M204 S6000
G1 X125.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.2 I-1.216 J-.04 P1  F42000
G1 X125.302 Y127.548 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X125.302 Y126.807 E.02456
G1 X125.302 Y126.407 E.01327
G1 F4919.51
G1 X125.302 Y126.007 E.01327
M106 S255
G1 F1800
G1 X125.302 Y125.625 E.01269
M106 S198.9
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X125.302 Y117.375 E.27367
M106 S198.9
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X125.302 Y116.992 E.01269
M106 S198.9
G1 F4919.51
G1 X125.302 Y116.592 E.01327
G1 F8843.478
G1 X125.302 Y116.192 E.01327
G1 X125.302 Y115.452 E.02456
G1 X128.102 Y115.452 E.09288
G1 X128.102 Y113.603 E.06135
G1 X133.718 Y113.604 E.18629
G1 X133.839 Y113.66 E.00445
G1 X133.877 Y113.712 E.00213
G1 X133.897 Y113.79 E.00267
G1 X133.898 Y126.448 E.41987
G1 X127.898 Y126.448 E.19903
G1 X127.898 Y127.548 E.03649
G1 X125.362 Y127.548 E.08412
; WIPE_START
G1 X125.302 Y126.807 E-.28229
G1 X125.302 Y126.407 E-.152
G1 X125.302 Y126.007 E-.152
G1 X125.302 Y125.625 E-.14535
G1 X125.302 Y125.55 E-.02836
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.2 I-1.138 J.432 P1  F42000
G1 X131.09 Y140.81 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X134.06 Y140.81 E.09126
G1 X134.06 Y140.335 E.0146
G1 X134.29 Y140.335 E.00706
G1 X134.289 Y142.229 E.05819
G3 X133.726 Y142.789 I-.594 J-.034 E.02671
G1 X122.305 Y142.79 E.35094
G3 X121.711 Y142.226 I.012 J-.608 E.02761
G1 X121.71 Y127.335 E.45757
G1 X121.94 Y127.335 E.00707
G1 X121.94 Y127.81 E.0146
G1 X124.91 Y127.81 E.09126
G1 X124.91 Y126.794 E.03122
G1 X124.91 Y126.394 E.01229
G1 F4919.51
G1 X124.91 Y125.994 E.01229
M106 S255
G1 F1800
G1 X124.91 Y125.625 E.01134
M106 S198.9
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X124.91 Y117.375 E.27367
M106 S198.9
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X124.91 Y117.006 E.01134
M106 S198.9
G1 F4919.51
G1 X124.91 Y116.606 E.01229
G1 F9547.055
G1 X124.91 Y116.206 E.01229
G1 X124.91 Y115.19 E.03122
G1 X121.94 Y115.19 E.09126
G1 X121.94 Y115.665 E.0146
G1 X121.71 Y115.665 E.00706
G1 X121.711 Y113.771 E.05819
G3 X122.274 Y113.211 I.608 J.048 E.02657
G1 X133.757 Y113.213 E.35286
G3 X134.289 Y113.771 I-.06 J.589 E.02579
G1 X134.29 Y128.665 E.45765
G1 X134.06 Y128.665 E.00707
G1 X134.06 Y128.19 E.0146
G1 X131.09 Y128.19 E.09126
G1 X131.09 Y129.206 E.03122
G1 X131.09 Y129.606 E.01229
G1 F4919.51
G1 X131.09 Y130.006 E.01229
M106 S255
G1 F1800
G1 X131.09 Y130.375 E.01134
M106 S198.9
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X131.09 Y138.625 E.27367
M106 S198.9
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X131.09 Y138.994 E.01134
M106 S198.9
G1 F4919.51
G1 X131.09 Y139.394 E.01229
G1 F9547.055
G1 X131.09 Y139.794 E.01229
G1 X131.09 Y140.75 E.02938
; WIPE_START
M204 S6000
G1 X133.09 Y140.79 E-.76
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


G1 X134.051 Y142.374 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.17679
G1 F15000
M204 S6000
G1 X133.54 Y142.593 E.00607
M204 S10000
G1 X134.026 Y142.417 F42000
; LINE_WIDTH: 0.278967
G1 F15000
M204 S6000
G3 X133.707 Y142.475 I-.4 J-1.31 E.00626
G1 X128.094 Y142.475 E.10796
; WIPE_START
G1 X130.094 Y142.475 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.357 Y139.632 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.4362
M106 S255
G1 F3000
M204 S6000
G1 X130.357 Y129.538 E.3235
G1 X129.963 Y129.538 E.0126
G1 X129.963 Y139.462 E.31807
G1 X129.57 Y139.462 E.0126
G1 X129.57 Y129.538 E.31807
G1 X129.177 Y129.538 E.0126
G1 X129.177 Y139.462 E.31807
G1 X128.783 Y139.462 E.0126
G1 X128.783 Y129.538 E.31807
G1 X128.435 Y129.538 E.01116
G1 X128.435 Y129.885 E.01115
G1 X128.39 Y129.885 E.00145
G1 X128.39 Y139.462 E.30692
G1 X127.997 Y139.462 E.0126
G1 X127.997 Y129.885 E.30692
G1 X127.604 Y129.885 E.0126
G1 X127.604 Y139.462 E.30692
G1 X127.21 Y139.462 E.0126
G1 X127.21 Y129.885 E.30692
G1 X126.817 Y129.885 E.0126
G1 X126.817 Y139.462 E.30692
G1 X126.424 Y139.462 E.0126
G1 X126.424 Y129.885 E.30692
G1 X126.03 Y129.885 E.0126
G1 X126.03 Y139.462 E.30692
G1 X125.637 Y139.462 E.0126
G1 X125.637 Y129.885 E.30692
G1 X125.244 Y129.885 E.0126
G1 X125.244 Y139.462 E.30692
G1 X124.851 Y139.462 E.0126
G1 X124.851 Y129.885 E.30692
G1 X124.457 Y129.885 E.0126
G1 X124.457 Y139.462 E.30692
G1 X124.064 Y139.462 E.0126
G1 X124.064 Y129.885 E.30692
G1 X123.671 Y129.885 E.0126
G1 X123.671 Y139.462 E.30692
G1 X123.277 Y139.462 E.0126
G1 X123.277 Y129.885 E.30692
G1 X122.884 Y129.885 E.0126
G1 X122.884 Y139.666 E.31344
G1 X122.82 Y139.666 E.00207
G1 X122.669 Y139.457 E.00827
G1 X122.541 Y139.162 E.0103
G1 X122.491 Y138.943 E.00721
G1 X122.491 Y129.716 E.2957
M106 S198.9
; WIPE_START
G1 X122.491 Y131.716 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.521 Y127.171 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38964
G1 F10383.018
M204 S6000
G1 X127.521 Y126.824 E.0098
G1 X125.679 Y126.824 E.05205
G1 X125.679 Y127.171 E.0098
G1 X127.461 Y127.171 E.05035
M204 S10000
G1 X128 Y127.744 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
G1 F15000
M204 S6000
G1 X128 Y128.256 E.00784
M204 S10000
G1 X128.479 Y128.829 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.389635
G1 F10383.168
M204 S6000
G1 X128.479 Y129.176 E.0098
G1 X130.321 Y129.176 E.05204
G1 X130.321 Y128.829 E.0098
G1 X128.539 Y128.829 E.05035
; WIPE_START
G1 X130.321 Y128.829 E-.6772
G1 X130.321 Y129.047 E-.0828
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.509 Y126.284 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.4362
M106 S255
G1 F3000
M204 S6000
G1 X133.509 Y117.057 E.2957
G1 X133.459 Y116.838 E.00721
G1 X133.331 Y116.543 E.0103
G1 X133.18 Y116.334 E.00827
G1 X133.116 Y116.334 E.00207
G1 X133.116 Y126.115 E.31344
G1 X132.723 Y126.115 E.0126
G1 X132.723 Y116.538 E.30692
G1 X132.329 Y116.538 E.0126
G1 X132.329 Y126.115 E.30692
G1 X131.936 Y126.115 E.0126
M73 P79 R3
G1 X131.936 Y116.538 E.30692
G1 X131.543 Y116.538 E.0126
G1 X131.543 Y126.115 E.30692
G1 X131.149 Y126.115 E.0126
G1 X131.149 Y116.538 E.30692
G1 X130.756 Y116.538 E.0126
G1 X130.756 Y126.115 E.30692
G1 X130.363 Y126.115 E.0126
G1 X130.363 Y116.538 E.30692
G1 X129.97 Y116.538 E.0126
G1 X129.97 Y126.115 E.30692
G1 X129.576 Y126.115 E.0126
G1 X129.576 Y116.538 E.30692
G1 X129.183 Y116.538 E.0126
G1 X129.183 Y126.115 E.30692
G1 X128.79 Y126.115 E.0126
G1 X128.79 Y116.538 E.30692
G1 X128.396 Y116.538 E.0126
G1 X128.396 Y126.115 E.30692
G1 X128.003 Y126.115 E.0126
G1 X128.003 Y116.538 E.30692
G1 X127.61 Y116.538 E.0126
G1 X127.61 Y126.115 E.30692
G1 X127.565 Y126.115 E.00145
G1 X127.565 Y126.462 E.01115
G1 X127.217 Y126.462 E.01116
G1 X127.217 Y116.538 E.31807
G1 X126.823 Y116.538 E.0126
G1 X126.823 Y126.462 E.31807
G1 X126.43 Y126.462 E.0126
G1 X126.43 Y116.538 E.31807
G1 X126.037 Y116.538 E.0126
G1 X126.037 Y126.462 E.31807
G1 X125.643 Y126.462 E.0126
G1 X125.643 Y116.368 E.3235
M106 S198.9
; WIPE_START
G1 X125.643 Y118.368 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.906 Y113.525 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279747
G1 F15000
M204 S6000
G1 X122.293 Y113.525 E.10832
G2 X122.161 Y113.543 I.021 J.657 E.00258
; LINE_WIDTH: 0.215294
G2 X121.955 Y113.613 I.484 J1.762 E.00305
; WIPE_START
G1 X122.161 Y113.543 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.788 Y113.838 Z6.2 F42000
G1 X132.744 Y113.952 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X133.549 Y113.952 E.0267
G1 X133.549 Y114.775 E.02732
G1 X132.179 Y116.145 E.06428
G1 X131.497 Y116.145 E.0226
G1 X129.303 Y113.951 E.10294
G1 X128.45 Y113.951 E.02829
G1 X128.45 Y114.727 E.02573
M204 S10000
G1 X133.574 Y116.25 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F10588.235
M204 S6000
G1 X133.51 Y116.286 E.00204
G1 X133.559 Y116.314 E.00155
; WIPE_START
G1 X133.51 Y116.286 E-.32874
G1 X133.574 Y116.25 E-.43126
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.2 I-1.1 J-.521 P1  F42000
G1 X122.469 Y139.676 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F10588.235
M204 S6000
G1 X122.405 Y139.713 E.00204
G1 X122.454 Y139.741 E.00155
M204 S10000
G1 X123.255 Y142.05 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X122.451 Y142.05 E.02665
G1 X122.451 Y141.225 E.02737
G1 X123.821 Y139.855 E.06427
G1 X124.503 Y139.855 E.0226
G1 X126.697 Y142.049 E.10296
G1 X127.55 Y142.049 E.02827
G1 X127.55 Y141.273 E.02574
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X127.55 Y142.049 E-.2949
G1 X126.697 Y142.049 E-.32387
G1 X126.435 Y141.786 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/42
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
M106 S201.45
; OBJECT_ID: 394
M204 S10000
G17
G3 Z6.2 I1.208 J.15 P1  F42000
G1 X128.29 Y126.84 Z6.2
G1 Z6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8161
M204 S5000
G1 X133.91 Y126.84 E.17269
G1 X133.91 Y128.06 E.03749
G1 X128.29 Y128.06 E.17269
G1 X128.29 Y126.9 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.71 Y127.94 Z6.4 F42000
G1 Z6
G1 E.8 F1800
G1 F8161
M204 S5000
G1 X127.71 Y129.16 E.03749
G1 X122.09 Y129.16 E.17269
G1 X122.09 Y127.94 E.03749
G1 X127.65 Y127.94 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.71 Y129.16 E-.46416
G1 X126.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.4 I1.215 J.067 P1  F42000
G1 X127.71 Y115.06 Z6.4
G1 Z6
G1 E.8 F1800
G1 F8161
M204 S5000
G1 X122.09 Y115.06 E.17269
G1 X122.09 Y113.84 E.03749
G1 X127.71 Y113.84 E.17269
G1 X127.71 Y115 E.03564
; WIPE_START
M73 P80 R3
G1 F9547.055
M204 S6000
G1 X125.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.4 I-1.216 J-.04 P1  F42000
G1 X125.302 Y127.548 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8161
M204 S6000
G1 X125.302 Y115.452 E.40124
G1 X128.102 Y115.452 E.09288
G1 X128.102 Y113.603 E.06135
G1 X133.718 Y113.604 E.1863
G1 X133.809 Y113.636 E.00321
G3 X133.897 Y113.79 I-.111 J.165 E.0061
G1 X133.898 Y126.448 E.41987
G1 X127.898 Y126.448 E.19903
G1 X127.898 Y127.548 E.03649
G1 X125.362 Y127.548 E.08412
; WIPE_START
G1 F8843.478
G1 X125.352 Y125.548 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.4 I-1.148 J.403 P1  F42000
G1 X130.618 Y140.548 Z6.4
G1 Z6
G1 E.8 F1800
G1 F8161
M204 S6000
G1 X127.898 Y140.548 E.09024
G1 X127.898 Y142.397 E.06135
G1 X122.262 Y142.393 E.18697
G3 X122.103 Y142.202 I.05 J-.202 E.00883
G1 X122.102 Y129.552 E.41963
G1 X128.102 Y129.552 E.19903
G1 X128.102 Y128.452 E.03649
G1 X130.698 Y128.452 E.08611
G1 X130.698 Y140.548 E.40124
G1 X130.678 Y140.548 E.00065
; WIPE_START
G1 F8843.478
G1 X128.678 Y140.548 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.29 Y140.94 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8161
M204 S5000
G1 X133.91 Y140.94 E.17269
G1 X133.91 Y142.16 E.03749
G1 X128.29 Y142.16 E.17269
G1 X128.29 Y141 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.09 Y140.81 Z6.4 F42000
G1 Z6
G1 E.8 F1800
G1 F8161
M204 S5000
G1 X134.06 Y140.81 E.09126
G1 X134.06 Y140.335 E.0146
G1 X134.29 Y140.335 E.00706
G1 X134.289 Y142.229 E.05819
G3 X133.726 Y142.789 I-.592 J-.032 E.02674
G1 X122.305 Y142.79 E.35094
G3 X121.711 Y142.226 I.013 J-.608 E.0276
G1 X121.71 Y127.335 E.45757
G1 X121.94 Y127.335 E.00707
G1 X121.94 Y127.81 E.0146
G1 X124.91 Y127.81 E.09126
G1 X124.91 Y115.19 E.38778
G1 X121.94 Y115.19 E.09126
G1 X121.94 Y115.665 E.0146
G1 X121.71 Y115.665 E.00706
G1 X121.711 Y113.774 E.05811
G3 X122.274 Y113.211 I.594 J.031 E.02679
G1 X133.757 Y113.213 E.35287
G3 X134.289 Y113.771 I-.072 J.601 E.02567
G1 X134.29 Y128.665 E.45765
G1 X134.06 Y128.665 E.00707
G1 X134.06 Y128.19 E.0146
G1 X131.09 Y128.19 E.09126
G1 X131.09 Y140.75 E.38593
; WIPE_START
G1 F9547.055
M204 S6000
G1 X133.09 Y140.79 E-.76
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


G1 X133.795 Y142.466 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.28002
G1 F8161
M204 S6000
G3 X133.707 Y142.475 I-.102 J-.594 E.00172
G1 X128.094 Y142.475 E.10844
; WIPE_START
G1 F15000
G1 X130.094 Y142.475 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.55 Y141.273 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8161
M204 S6000
G1 X127.55 Y142.049 E.02574
G1 X126.697 Y142.049 E.02827
G1 X124.503 Y139.855 E.10296
G1 X123.821 Y139.855 E.0226
G1 X122.451 Y141.225 E.06427
G1 X122.451 Y142.05 E.02737
G1 X123.255 Y142.05 E.02665
; WIPE_START
G1 F8843.478
G1 X122.451 Y142.05 E-.30528
G1 X122.451 Y141.225 E-.31348
G1 X122.714 Y140.962 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.288 Y141.905 Z6.4 F42000
G1 X134.052 Y142.373 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.173774
G1 F8161
M204 S6000
G1 X133.926 Y142.428 E.00146
; LINE_WIDTH: 0.202984
G1 X133.882 Y142.444 E.0006
; LINE_WIDTH: 0.242533
G3 X133.795 Y142.466 I-.193 J-.582 E.00146
; WIPE_START
G1 F15000
G1 X133.882 Y142.444 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.726 Y139.632 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.4218
G1 F8161
M204 S6000
G1 X130.365 Y138.993 E.0279
G1 X130.365 Y138.457 E.01654
G1 X129.36 Y139.463 E.04389
G1 X128.824 Y139.463 E.01654
G1 X130.365 Y137.922 E.06728
G1 X130.365 Y137.386 E.01654
G1 X128.288 Y139.463 E.09068
G1 X127.752 Y139.463 E.01654
G1 X130.365 Y136.85 E.11407
G1 X130.365 Y136.314 E.01654
G1 X127.216 Y139.463 E.13747
G1 X126.681 Y139.463 E.01654
G1 X130.365 Y135.778 E.16086
G1 X130.365 Y135.242 E.01654
G1 X126.145 Y139.463 E.18426
G1 X125.609 Y139.463 E.01654
G1 X130.365 Y134.707 E.20765
G1 X130.365 Y134.171 E.01654
G1 X125.073 Y139.463 E.23105
G1 X124.537 Y139.463 E.01654
G1 X130.365 Y133.635 E.25444
G1 X130.365 Y133.099 E.01654
G1 X124.001 Y139.463 E.27784
G1 X123.466 Y139.463 E.01654
G1 X130.365 Y132.563 E.30123
G1 X130.365 Y132.028 E.01654
G1 X122.726 Y139.666 E.33351
G1 X122.436 Y139.666 E.00896
G1 X122.436 Y139.421 E.00758
G1 X130.365 Y131.492 E.34619
G1 X130.365 Y130.956 E.01654
G1 X122.436 Y138.885 E.34619
G1 X122.436 Y138.349 E.01654
G1 X130.365 Y130.42 E.34619
M73 P80 R2
G1 X130.365 Y129.884 E.01654
G1 X122.436 Y137.813 E.34619
G1 X122.436 Y137.277 E.01654
G1 X130.365 Y129.348 E.34619
G1 X130.365 Y128.813 E.01654
G1 X122.436 Y136.742 E.3462
G1 X122.436 Y136.206 E.01654
G1 X129.856 Y128.785 E.324
G1 X129.321 Y128.785 E.01654
G1 X122.436 Y135.67 E.30061
G1 X122.436 Y135.134 E.01654
G1 X127.685 Y129.885 E.22919
G1 X127.149 Y129.885 E.01654
G1 X122.436 Y134.598 E.20579
G1 X122.436 Y134.063 E.01654
G1 X126.613 Y129.885 E.1824
G1 X126.077 Y129.885 E.01654
G1 X122.436 Y133.527 E.159
G1 X122.436 Y132.991 E.01654
G1 X125.541 Y129.885 E.13561
G1 X125.006 Y129.885 E.01654
G1 X122.436 Y132.455 E.11222
G1 X122.436 Y131.92 E.01654
G1 X124.47 Y129.885 E.08882
G1 X123.934 Y129.885 E.01654
G1 X122.435 Y131.384 E.06543
G1 X122.435 Y130.848 E.01654
G1 X123.398 Y129.885 E.04204
G1 X122.862 Y129.885 E.01654
G1 X122.266 Y130.482 E.02605
; WIPE_START
G1 F9501.689
G1 X122.862 Y129.885 E-.32064
G1 X123.398 Y129.885 E-.20361
G1 X122.96 Y130.324 E-.23575
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.266 Y129.304 Z6.4 F42000
G1 Z6
G1 E.8 F1800
G1 F8161
M204 S6000
G1 X128.954 Y128.616 E.03008
; WIPE_START
G1 F9501.689
G1 X128.266 Y129.304 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128 Y128.256 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
G1 F8161
M204 S6000
G1 X128 Y127.744 E.00784
; WIPE_START
G1 F15000
G1 X128 Y128.256 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.968 Y126.284 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.4218
G1 F8161
M204 S6000
G1 X133.565 Y125.688 E.02604
G1 X133.565 Y125.152 E.01654
G1 X132.602 Y126.115 E.04202
G1 X132.066 Y126.115 E.01654
G1 X133.565 Y124.616 E.06542
G1 X133.564 Y124.081 E.01654
G1 X131.53 Y126.115 E.08881
G1 X130.995 Y126.115 E.01654
G1 X133.564 Y123.545 E.1122
G1 X133.564 Y123.009 E.01654
G1 X130.459 Y126.115 E.1356
G1 X129.923 Y126.115 E.01654
G1 X133.564 Y122.473 E.15899
G1 X133.564 Y121.938 E.01654
G1 X129.387 Y126.115 E.18239
G1 X128.851 Y126.115 E.01654
G1 X133.564 Y121.402 E.20578
G1 X133.564 Y120.866 E.01654
G1 X128.146 Y126.284 E.23658
M204 S10000
G1 X127.734 Y126.696 F42000
G1 F8161
M204 S6000
G1 X127.046 Y127.384 E.03007
M204 S10000
G1 X126.51 Y127.384 F42000
M73 P81 R2
G1 F8161
M204 S6000
G1 X133.564 Y120.33 E.308
G1 X133.564 Y119.794 E.01654
G1 X126.144 Y127.215 E.32399
G1 X125.635 Y127.215 E.0157
G1 X125.635 Y127.188 E.00084
G1 X133.564 Y119.259 E.3462
G1 X133.564 Y118.723 E.01654
G1 X125.635 Y126.652 E.34619
G1 X125.635 Y126.116 E.01654
G1 X133.564 Y118.187 E.34619
G1 X133.564 Y117.651 E.01654
G1 X125.635 Y125.58 E.34619
G1 X125.635 Y125.044 E.01654
G1 X133.564 Y117.116 E.34619
G1 X133.564 Y116.58 E.01654
G1 X125.635 Y124.509 E.34619
G1 X125.635 Y123.973 E.01654
G1 X133.274 Y116.334 E.33352
G1 X133.06 Y116.334 E.00661
G1 X132.909 Y116.485 E.00658
G1 X132.782 Y116.537 E.00426
G1 X132.535 Y116.537 E.00763
G1 X125.635 Y123.437 E.30125
G1 X125.635 Y122.901 E.01654
G1 X131.999 Y116.537 E.27785
G1 X131.463 Y116.537 E.01654
G1 X125.635 Y122.365 E.25446
G1 X125.635 Y121.829 E.01654
G1 X130.927 Y116.537 E.23106
G1 X130.391 Y116.537 E.01654
G1 X125.635 Y121.294 E.20767
G1 X125.635 Y120.758 E.01654
G1 X129.856 Y116.537 E.18427
G1 X129.32 Y116.537 E.01654
G1 X125.635 Y120.222 E.16088
G1 X125.635 Y119.686 E.01654
G1 X128.784 Y116.537 E.13748
G1 X128.248 Y116.537 E.01654
G1 X125.635 Y119.15 E.11409
G1 X125.635 Y118.615 E.01654
G1 X127.712 Y116.537 E.09069
G1 X127.176 Y116.537 E.01654
G1 X125.635 Y118.079 E.0673
G1 X125.635 Y117.543 E.01654
G1 X126.641 Y116.537 E.0439
G1 X126.105 Y116.537 E.01654
G1 X125.466 Y117.177 E.02791
; WIPE_START
G1 F9501.689
G1 X126.105 Y116.537 E-.34357
G1 X126.641 Y116.537 E-.20361
G1 X126.245 Y116.933 E-.21281
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.955 Y113.613 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.215211
G1 F8161
M204 S6000
G3 X122.161 Y113.543 I.691 J1.698 E.00305
; LINE_WIDTH: 0.279749
G3 X122.293 Y113.525 I.153 J.64 E.00257
G1 X127.906 Y113.525 E.10832
; WIPE_START
G1 F15000
G1 X125.906 Y113.525 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.45 Y114.727 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8161
M204 S6000
G1 X128.45 Y113.951 E.02573
G1 X129.303 Y113.951 E.02829
G1 X131.497 Y116.145 E.10294
G1 X132.179 Y116.145 E.0226
G1 X133.549 Y114.775 E.06428
G1 X133.549 Y113.952 E.02732
G1 X132.744 Y113.952 E.0267
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X133.549 Y113.952 E-.30585
G1 X133.549 Y114.775 E-.31291
G1 X133.286 Y115.038 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/42
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z6.4 I-1.121 J-.474 P1  F42000
G1 X128.29 Y126.84 Z6.4
G1 Z6.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7119
M204 S5000
G1 X133.91 Y126.84 E.17269
G1 X133.91 Y128.06 E.03749
G1 X128.29 Y128.06 E.17269
G1 X128.29 Y126.9 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.71 Y127.94 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
G1 F7119
M204 S5000
G1 X127.71 Y129.16 E.03749
G1 X122.09 Y129.16 E.17269
G1 X122.09 Y127.94 E.03749
G1 X127.65 Y127.94 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.71 Y129.16 E-.46416
G1 X126.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.6 I1.215 J.067 P1  F42000
G1 X127.71 Y115.06 Z6.6
G1 Z6.2
G1 E.8 F1800
G1 F7119
M204 S5000
G1 X122.09 Y115.06 E.17269
G1 X122.09 Y113.84 E.03749
G1 X127.71 Y113.84 E.17269
G1 X127.71 Y115 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.6 I-1.216 J-.04 P1  F42000
G1 X125.302 Y127.548 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7119
M204 S6000
G1 X125.302 Y115.452 E.40124
G1 X128.102 Y115.452 E.09288
G1 X128.102 Y113.603 E.06135
G1 X133.718 Y113.604 E.1863
G1 X133.839 Y113.66 E.00444
G1 X133.882 Y113.724 E.00255
G1 X133.897 Y113.79 E.00224
G1 X133.898 Y126.448 E.41987
G1 X127.898 Y126.448 E.19903
G1 X127.898 Y127.548 E.03649
G1 X125.362 Y127.548 E.08412
; WIPE_START
G1 F8843.478
G1 X125.352 Y125.548 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.6 I-1.148 J.403 P1  F42000
G1 X130.618 Y140.548 Z6.6
G1 Z6.2
G1 E.8 F1800
G1 F7119
M204 S6000
G1 X127.898 Y140.548 E.09024
G1 X127.898 Y142.397 E.06135
G1 X122.261 Y142.393 E.18697
G3 X122.103 Y142.202 I.05 J-.203 E.00882
G1 X122.102 Y129.552 E.41963
G1 X128.102 Y129.552 E.19903
G1 X128.102 Y128.452 E.03649
G1 X130.698 Y128.452 E.08611
G1 X130.698 Y140.548 E.40124
G1 X130.678 Y140.548 E.00065
; WIPE_START
G1 F8843.478
G1 X128.678 Y140.548 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.29 Y140.94 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7119
M204 S5000
G1 X133.91 Y140.94 E.17269
G1 X133.91 Y142.16 E.03749
G1 X128.29 Y142.16 E.17269
G1 X128.29 Y141 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.09 Y140.81 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
G1 F7119
M204 S5000
G1 X134.06 Y140.81 E.09126
G1 X134.06 Y140.335 E.0146
G1 X134.29 Y140.335 E.00706
G1 X134.289 Y142.229 E.05819
G3 X133.726 Y142.789 I-.594 J-.034 E.02671
G1 X122.305 Y142.79 E.35094
G3 X121.711 Y142.226 I.012 J-.608 E.02761
G1 X121.71 Y127.335 E.45757
G1 X121.94 Y127.335 E.00707
G1 X121.94 Y127.81 E.0146
G1 X124.91 Y127.81 E.09126
G1 X124.91 Y115.19 E.38778
G1 X121.94 Y115.19 E.09126
G1 X121.94 Y115.665 E.0146
G1 X121.71 Y115.665 E.00706
G1 X121.711 Y113.774 E.05812
G3 X122.274 Y113.211 I.594 J.031 E.02679
G1 X133.757 Y113.213 E.35287
G3 X134.289 Y113.771 I-.06 J.589 E.02579
G1 X134.29 Y128.665 E.45765
G1 X134.06 Y128.665 E.00707
G1 X134.06 Y128.19 E.0146
G1 X131.09 Y128.19 E.09126
G1 X131.09 Y140.75 E.38593
; WIPE_START
G1 F9547.055
M204 S6000
G1 X133.09 Y140.79 E-.76
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


G1 X134.051 Y142.374 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.17738
G1 F7119
M204 S6000
G1 X133.539 Y142.593 E.0061
M204 S10000
G1 X134.037 Y142.402 F42000
; LINE_WIDTH: 0.27837
G1 F7119
M204 S6000
G3 X133.707 Y142.475 I-.43 J-1.174 E.0065
G1 X128.094 Y142.475 E.10769
; WIPE_START
G1 F15000
G1 X130.094 Y142.475 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.178 Y139.127 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7119
M204 S6000
G1 X124.549 Y139.127 E.05401
G1 X122.451 Y141.225 E.09843
G1 X122.451 Y137.803 E.11351
G1 X123.398 Y138.75 E.04445
G1 X123.398 Y138.886 E.00448
G1 X123.639 Y139.127 E.01131
G1 X123.775 Y139.127 E.00448
G1 X126.697 Y142.049 E.13711
G1 X127.55 Y142.049 E.02827
G1 X127.55 Y141.273 E.02574
M204 S10000
G1 X123.974 Y138.904 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.4241
G1 F7119
M204 S6000
G1 X123.79 Y138.72 E.00808
G1 X123.79 Y138.181 E.01674
G1 X124.344 Y138.734 E.02431
G1 X124.883 Y138.734 E.01674
G1 X123.79 Y137.642 E.04799
G1 X123.79 Y137.103 E.01674
G1 X125.422 Y138.734 E.07167
G1 X125.961 Y138.734 E.01674
G1 X123.79 Y136.564 E.09535
G1 X123.79 Y136.025 E.01674
G1 X126.5 Y138.734 E.11903
G1 X127.039 Y138.734 E.01674
G1 X123.79 Y135.486 E.14271
G1 X123.79 Y134.947 E.01674
G1 X127.578 Y138.734 E.16639
G1 X128.117 Y138.734 E.01674
G1 X123.79 Y134.408 E.19006
G1 X123.79 Y133.869 E.01674
G1 X128.656 Y138.734 E.21374
G1 X129.195 Y138.734 E.01674
G1 X123.79 Y133.33 E.23742
G1 X123.79 Y132.79 E.01674
G1 X129.735 Y138.734 E.2611
G1 X130.274 Y138.734 E.01674
G1 X123.79 Y132.251 E.28478
G1 X123.79 Y131.712 E.01674
G1 X130.365 Y138.287 E.28879
G1 X130.365 Y137.748 E.01674
G1 X123.79 Y131.173 E.28879
G1 X123.79 Y130.634 E.01674
G1 X130.365 Y137.208 E.28879
G1 X130.365 Y136.669 E.01674
G1 X123.961 Y130.265 E.28131
G1 X124.5 Y130.265 E.01674
G1 X130.365 Y136.13 E.25763
G1 X130.365 Y135.591 E.01674
G1 X125.039 Y130.265 E.23395
G1 X125.578 Y130.265 E.01674
G1 X130.365 Y135.052 E.21027
M73 P82 R2
G1 X130.365 Y134.513 E.01674
G1 X126.117 Y130.265 E.18659
G1 X126.656 Y130.265 E.01674
G1 X130.365 Y133.974 E.16291
G1 X130.365 Y133.435 E.01674
G1 X127.195 Y130.265 E.13923
G1 X127.734 Y130.265 E.01674
G1 X130.365 Y132.896 E.11555
G1 X130.365 Y132.357 E.01674
G1 X128.273 Y130.265 E.09187
G1 X128.812 Y130.265 E.01674
G1 X130.365 Y131.818 E.06819
G1 X130.365 Y131.279 E.01674
G1 X129.352 Y130.265 E.04451
G1 X129.891 Y130.265 E.01674
G1 X130.534 Y130.909 E.02828
M204 S10000
G1 X130.271 Y128.8 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7119
M204 S6000
G1 X130.35 Y128.8 E.00262
G1 X130.35 Y129.873 E.0356
G1 X129.873 Y129.873 E.0158
G1 X128.8 Y128.8 E.05034
G1 X128.45 Y128.8 E.01161
G1 X128.45 Y129.873 E.0356
G1 X128.656 Y129.873 E.00681
; WIPE_START
G1 F8843.478
G1 X128.45 Y129.873 E-.07798
G1 X128.45 Y128.8 E-.40778
G1 X128.8 Y128.8 E-.133
G1 X129.063 Y129.063 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128 Y128.256 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
G1 F7119
M204 S6000
G1 X128 Y127.744 E.00784
; WIPE_START
G1 F15000
G1 X128 Y128.256 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.65 Y127.121 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7119
M204 S6000
G1 X125.65 Y127.2 E.00262
G1 X127.2 Y127.2 E.0514
G1 X126.127 Y126.127 E.05034
G1 X127.55 Y126.127 E.04721
G1 X127.55 Y126.332 E.00681
M204 S10000
G1 X126.279 Y125.904 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.4241
G1 F7119
M204 S6000
G1 X125.635 Y125.26 E.02828
G1 X125.635 Y124.721 E.01674
G1 X126.648 Y125.734 E.0445
G1 X127.187 Y125.734 E.01674
G1 X125.635 Y124.182 E.06818
G1 X125.635 Y123.643 E.01674
G1 X127.726 Y125.734 E.09186
G1 X128.266 Y125.734 E.01674
G1 X125.635 Y123.104 E.11554
G1 X125.635 Y122.565 E.01674
G1 X128.805 Y125.734 E.13922
G1 X129.344 Y125.734 E.01674
G1 X125.635 Y122.026 E.1629
G1 X125.635 Y121.487 E.01674
G1 X129.883 Y125.734 E.18658
G1 X130.422 Y125.734 E.01674
G1 X125.635 Y120.948 E.21026
G1 X125.635 Y120.409 E.01674
G1 X130.961 Y125.734 E.23394
G1 X131.5 Y125.734 E.01674
G1 X125.635 Y119.87 E.25762
G1 X125.635 Y119.331 E.01674
G1 X132.039 Y125.734 E.2813
G1 X132.209 Y125.723 E.00531
G1 X132.209 Y125.366 E.0111
G1 X125.635 Y118.792 E.28879
G1 X125.635 Y118.253 E.01674
G1 X132.209 Y124.827 E.28879
G1 X132.209 Y124.288 E.01674
G1 X125.635 Y117.713 E.28879
G1 X125.635 Y117.265 E.01391
G1 X125.726 Y117.265 E.00283
G1 X132.209 Y123.749 E.28479
G1 X132.209 Y123.21 E.01674
G1 X126.265 Y117.265 E.26111
G1 X126.804 Y117.265 E.01674
G1 X132.209 Y122.671 E.23743
G1 X132.209 Y122.131 E.01674
G1 X127.344 Y117.265 E.21375
G1 X127.883 Y117.265 E.01674
G1 X132.209 Y121.592 E.19007
G1 X132.209 Y121.053 E.01674
G1 X128.422 Y117.265 E.16639
G1 X128.961 Y117.265 E.01674
G1 X132.209 Y120.514 E.14271
G1 X132.209 Y119.975 E.01674
G1 X129.5 Y117.265 E.11903
G1 X130.039 Y117.265 E.01674
G1 X132.209 Y119.436 E.09535
G1 X132.209 Y118.897 E.01674
G1 X130.578 Y117.265 E.07167
G1 X131.117 Y117.265 E.01674
G1 X132.209 Y118.358 E.04799
G1 X132.209 Y117.819 E.01674
G1 X131.656 Y117.265 E.02431
G1 X132.195 Y117.265 E.01674
G1 X132.379 Y117.45 E.00808
M204 S10000
G1 X129.822 Y116.873 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7119
M204 S6000
G1 X131.451 Y116.873 E.05401
G1 X133.549 Y114.775 E.09843
G1 X133.549 Y118.197 E.11351
G1 X132.602 Y117.25 E.04445
G1 X132.602 Y117.114 E.00448
G1 X132.361 Y116.873 E.01131
G1 X132.225 Y116.873 E.00448
G1 X129.303 Y113.951 E.13709
G1 X128.45 Y113.951 E.02829
G1 X128.45 Y114.727 E.02573
; WIPE_START
G1 F8843.478
G1 X128.45 Y113.951 E-.29474
G1 X129.303 Y113.951 E-.32403
G1 X129.566 Y114.214 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.906 Y113.525 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279759
G1 F7119
M204 S6000
G1 X122.293 Y113.525 E.10832
G2 X122.161 Y113.543 I.021 J.657 E.00257
; LINE_WIDTH: 0.215132
G2 X121.955 Y113.613 I.484 J1.763 E.00305
; WIPE_START
G1 F15000
G1 X122.161 Y113.543 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.6 I-.833 J.887 P1  F42000
G1 X133.549 Y124.245 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7119
M204 S6000
G1 X133.549 Y125.874 E.05401
G1 X132.602 Y124.926 E.04447
G1 X132.602 Y123.398 E.05066
G1 X133.549 Y122.451 E.04446
G1 X133.549 Y120.822 E.05401
; WIPE_START
G1 F8843.478
G1 X133.549 Y122.451 E-.61876
G1 X133.286 Y122.714 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.6 I-.78 J-.934 P1  F42000
G1 X122.451 Y131.755 Z6.6
G1 Z6.2
G1 E.8 F1800
G1 F7119
M204 S6000
G1 X122.451 Y130.126 E.05401
G1 X123.398 Y131.074 E.04447
G1 X123.398 Y132.602 E.05066
G1 X122.451 Y133.549 E.04446
G1 X122.451 Y135.178 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X122.451 Y133.549 E-.61876
G1 X122.714 Y133.286 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/42
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z6.6 I.92 J.796 P1  F42000
G1 X128.29 Y126.84 Z6.6
G1 Z6.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3978
M204 S5000
G1 X133.91 Y126.84 E.17269
G1 X133.91 Y128.06 E.03749
G1 X128.29 Y128.06 E.17269
G1 X128.29 Y126.9 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.71 Y127.94 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
G1 F3978
M204 S5000
G1 X127.71 Y129.16 E.03749
G1 X122.09 Y129.16 E.17269
G1 X122.09 Y127.94 E.03749
G1 X127.65 Y127.94 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.71 Y129.16 E-.46416
G1 X126.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.352 Y121.539 Z6.8 F42000
G1 X127.71 Y115.06 Z6.8
G1 Z6.4
G1 E.8 F1800
G1 F3978
M204 S5000
G1 X122.09 Y115.06 E.17269
G1 X122.09 Y113.84 E.03749
G1 X127.71 Y113.84 E.17269
G1 X127.71 Y115 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.462 Y122.65 Z6.8 F42000
G1 X125.302 Y127.548 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3978
M204 S6000
G1 X125.302 Y115.452 E.40124
G1 X128.102 Y115.452 E.09288
G1 X128.102 Y113.603 E.06135
G1 X133.718 Y113.604 E.1863
G1 X133.793 Y113.626 E.00259
G1 X133.864 Y113.69 E.00317
G3 X133.897 Y113.79 I-.212 J.125 E.00352
G1 X133.898 Y126.448 E.41988
G1 X127.898 Y126.448 E.19903
G1 X127.898 Y127.548 E.03649
G1 X125.362 Y127.548 E.08412
; WIPE_START
G1 F8843.478
G1 X125.352 Y125.548 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.88 Y132.749 Z6.8 F42000
G1 X130.618 Y140.548 Z6.8
G1 Z6.4
G1 E.8 F1800
G1 F3978
M204 S6000
G1 X127.898 Y140.548 E.09024
G1 X127.898 Y142.397 E.06135
G1 X122.262 Y142.393 E.18697
G3 X122.103 Y142.202 I.05 J-.203 E.00882
G1 X122.102 Y129.552 E.41963
G1 X128.102 Y129.552 E.19903
G1 X128.102 Y128.452 E.03649
G1 X130.698 Y128.452 E.08611
G1 X130.698 Y140.548 E.40124
G1 X130.678 Y140.548 E.00065
; WIPE_START
G1 F8843.478
G1 X128.678 Y140.548 E-.76
; WIPE_END
M73 P83 R2
G1 E-.04 F1800
M204 S10000
G1 X128.29 Y140.94 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3978
M204 S5000
G1 X133.91 Y140.94 E.17269
G1 X133.91 Y142.16 E.03749
G1 X128.29 Y142.16 E.17269
G1 X128.29 Y141 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.09 Y140.81 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
G1 F3978
M204 S5000
G1 X134.06 Y140.81 E.09126
G1 X134.06 Y140.335 E.0146
G1 X134.29 Y140.335 E.00706
G1 X134.289 Y142.229 E.05819
G3 X133.726 Y142.789 I-.591 J-.031 E.02675
G1 X122.305 Y142.79 E.35094
G3 X121.711 Y142.226 I.013 J-.608 E.02761
G1 X121.71 Y127.335 E.45757
G1 X121.94 Y127.335 E.00707
G1 X121.94 Y127.81 E.0146
G1 X124.91 Y127.81 E.09126
G1 X124.91 Y115.19 E.38778
G1 X121.94 Y115.19 E.09126
G1 X121.94 Y115.665 E.0146
G1 X121.71 Y115.665 E.00706
G1 X121.711 Y113.771 E.05819
G3 X122.274 Y113.211 I.594 J.034 E.02671
G1 X133.757 Y113.213 E.35287
G3 X134.289 Y113.771 I-.066 J.595 E.02572
G1 X134.29 Y128.665 E.45765
G1 X134.06 Y128.665 E.00707
G1 X134.06 Y128.19 E.0146
G1 X131.09 Y128.19 E.09126
G1 X131.09 Y140.75 E.38593
; WIPE_START
G1 F9547.055
M204 S6000
G1 X133.09 Y140.79 E-.76
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


G1 X133.795 Y142.466 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.236048
G1 F3978
M204 S6000
G2 X134.039 Y142.399 I-.333 J-1.677 E.00398
M204 S10000
G1 X134.052 Y142.373 F42000
; LINE_WIDTH: 0.171794
G1 F3978
M204 S6000
G1 X133.554 Y142.593 E.00572
M204 S10000
G1 X133.795 Y142.466 F42000
; LINE_WIDTH: 0.280021
G1 F3978
M204 S6000
G3 X133.707 Y142.475 I-.101 J-.592 E.00171
G1 X128.094 Y142.475 E.10844
; WIPE_START
G1 F15000
G1 X130.094 Y142.475 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.55 Y141.273 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3978
M204 S6000
G1 X127.55 Y142.049 E.02574
G1 X126.697 Y142.049 E.02827
G1 X122.451 Y137.803 E.19922
G1 X122.451 Y141.225 E.11351
G1 X130.35 Y133.326 E.37054
G1 X130.35 Y130.35 E.09873
G1 X128.8 Y128.8 E.07269
G1 X128.45 Y128.8 E.01161
G1 X128.45 Y129.9 E.03649
G1 X126.1 Y129.9 E.07797
G1 X122.451 Y133.549 E.17119
G1 X122.45 Y130.126 E.11355
G1 X130.35 Y138.026 E.37058
G1 X130.35 Y139.654 E.05401
; WIPE_START
G1 F8843.478
G1 X130.35 Y138.026 E-.61876
G1 X130.087 Y137.763 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.45 Y130.308 Z6.8 F42000
G1 X128 Y128.256 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
G1 F3978
M204 S6000
G1 X128 Y127.744 E.00784
; WIPE_START
G1 F15000
G1 X128 Y128.256 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.254 Y120.628 Z6.8 F42000
G1 X128.45 Y114.726 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3978
M204 S6000
G1 X128.45 Y113.951 E.02573
G1 X129.303 Y113.951 E.02829
G1 X133.549 Y118.197 E.1992
G1 X133.549 Y114.775 E.11351
G1 X125.65 Y122.674 E.37054
G1 X125.65 Y125.65 E.09873
G1 X127.2 Y127.2 E.07269
G1 X127.55 Y127.2 E.01161
G1 X127.55 Y126.1 E.03649
G1 X129.9 Y126.1 E.07797
G1 X133.549 Y122.451 E.17119
G1 X133.55 Y125.874 E.11355
G1 X125.65 Y117.974 E.37058
G1 X125.65 Y116.346 E.05401
; WIPE_START
G1 F8843.478
G1 X125.65 Y117.974 E-.61876
G1 X125.913 Y118.237 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.906 Y113.525 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279776
G1 F3978
M204 S6000
G1 X122.293 Y113.525 E.10833
G2 X122.163 Y113.543 I.021 J.655 E.00254
; LINE_WIDTH: 0.214464
G2 X121.955 Y113.614 I.469 J1.711 E.00307
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X122.163 Y113.543 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/42
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z6.8 I-1.105 J.509 P1  F42000
G1 X128.29 Y126.84 Z6.8
G1 Z6.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3968
M204 S5000
G1 X133.91 Y126.84 E.17269
G1 X133.91 Y128.06 E.03749
G1 X128.29 Y128.06 E.17269
G1 X128.29 Y126.9 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.71 Y127.94 Z7 F42000
G1 Z6.6
G1 E.8 F1800
G1 F3968
M204 S5000
G1 X127.71 Y129.16 E.03749
G1 X122.09 Y129.16 E.17269
G1 X122.09 Y127.94 E.03749
G1 X127.65 Y127.94 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.71 Y129.16 E-.46416
G1 X126.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.352 Y121.539 Z7 F42000
G1 X127.71 Y115.06 Z7
G1 Z6.6
G1 E.8 F1800
G1 F3968
M204 S5000
G1 X122.09 Y115.06 E.17269
G1 X122.09 Y113.84 E.03749
G1 X127.71 Y113.84 E.17269
G1 X127.71 Y115 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.462 Y122.65 Z7 F42000
G1 X125.302 Y127.548 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3968
M204 S6000
G1 X125.302 Y115.452 E.40124
G1 X128.102 Y115.452 E.09288
G1 X128.102 Y113.603 E.06135
G1 X133.719 Y113.604 E.18631
M73 P84 R2
G1 X133.809 Y113.636 E.0032
G3 X133.897 Y113.79 I-.112 J.165 E.0061
G1 X133.898 Y126.448 E.41988
G1 X127.898 Y126.448 E.19903
G1 X127.898 Y127.548 E.03649
G1 X125.362 Y127.548 E.08412
; WIPE_START
G1 F8843.478
G1 X125.352 Y125.548 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.88 Y132.749 Z7 F42000
G1 X130.618 Y140.548 Z7
G1 Z6.6
G1 E.8 F1800
G1 F3968
M204 S6000
G1 X127.898 Y140.548 E.09024
G1 X127.898 Y142.397 E.06135
G1 X122.262 Y142.393 E.18696
G3 X122.103 Y142.202 I.049 J-.202 E.00883
G1 X122.102 Y129.552 E.41963
G1 X128.102 Y129.552 E.19903
G1 X128.102 Y128.452 E.03649
G1 X130.698 Y128.452 E.08611
G1 X130.698 Y140.548 E.40124
G1 X130.678 Y140.548 E.00065
; WIPE_START
G1 F8843.478
G1 X128.678 Y140.548 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.29 Y140.94 Z7 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3968
M204 S5000
G1 X133.91 Y140.94 E.17269
G1 X133.91 Y142.16 E.03749
G1 X128.29 Y142.16 E.17269
G1 X128.29 Y141 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.09 Y140.81 Z7 F42000
G1 Z6.6
G1 E.8 F1800
G1 F3968
M204 S5000
G1 X134.06 Y140.81 E.09126
G1 X134.06 Y140.335 E.0146
G1 X134.29 Y140.335 E.00706
G1 X134.289 Y142.229 E.05819
G3 X133.726 Y142.789 I-.594 J-.034 E.02671
G1 X122.305 Y142.79 E.35093
G3 X121.711 Y142.226 I.012 J-.608 E.02761
G1 X121.71 Y127.335 E.45757
G1 X121.94 Y127.335 E.00707
G1 X121.94 Y127.81 E.0146
G1 X124.91 Y127.81 E.09126
G1 X124.91 Y115.19 E.38778
G1 X121.94 Y115.19 E.09126
G1 X121.94 Y115.665 E.0146
G1 X121.71 Y115.665 E.00706
G1 X121.711 Y113.771 E.05819
G3 X122.274 Y113.211 I.594 J.034 E.02671
G1 X133.758 Y113.213 E.35287
G3 X134.289 Y113.771 I-.072 J.601 E.02567
G1 X134.29 Y128.665 E.45765
G1 X134.06 Y128.665 E.00707
G1 X134.06 Y128.19 E.0146
G1 X131.09 Y128.19 E.09126
G1 X131.09 Y140.75 E.38593
; WIPE_START
G1 F9547.055
M204 S6000
G1 X133.09 Y140.79 E-.76
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


G1 X133.754 Y142.472 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.255184
G1 F3968
M204 S6000
G1 X133.866 Y142.449 E.00197
; LINE_WIDTH: 0.213728
G1 X133.912 Y142.434 E.00068
; LINE_WIDTH: 0.177302
G1 X134.051 Y142.374 E.00166
M204 S10000
G1 X133.754 Y142.472 F42000
; LINE_WIDTH: 0.280105
G1 F3968
M204 S6000
G1 X128.094 Y142.475 E.10939
; WIPE_START
G1 F15000
G1 X130.094 Y142.474 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.35 Y139.654 Z7 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3968
M204 S6000
G1 X130.35 Y138.026 E.05401
G1 X122.45 Y130.126 E.37058
G1 X122.451 Y133.549 E.11355
G1 X126.1 Y129.9 E.17119
G1 X128.45 Y129.9 E.07797
G1 X128.45 Y128.8 E.03649
G1 X128.8 Y128.8 E.01161
G1 X130.35 Y130.35 E.07269
G1 X130.35 Y133.326 E.09873
G1 X122.451 Y141.225 E.37054
G1 X122.451 Y137.803 E.11351
G1 X126.697 Y142.049 E.19922
G1 X127.55 Y142.049 E.02827
G1 X127.55 Y141.273 E.02574
; WIPE_START
G1 F8843.478
G1 X127.55 Y142.049 E-.2949
G1 X126.697 Y142.049 E-.32387
G1 X126.435 Y141.787 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.312 Y134.205 Z7 F42000
G1 X128 Y128.256 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
G1 F3968
M204 S6000
G1 X128 Y127.744 E.00784
; WIPE_START
G1 F15000
G1 X128 Y128.256 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.523 Y120.768 Z7 F42000
G1 X125.65 Y116.346 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3968
M204 S6000
G1 X125.65 Y117.974 E.05401
G1 X133.55 Y125.874 E.37058
G1 X133.549 Y122.451 E.11355
G1 X129.9 Y126.1 E.17119
G1 X127.55 Y126.1 E.07797
G1 X127.55 Y127.2 E.03649
G1 X127.2 Y127.2 E.01161
G1 X125.65 Y125.65 E.07269
G1 X125.65 Y122.674 E.09873
G1 X133.549 Y114.775 E.37054
G1 X133.549 Y118.197 E.11351
G1 X129.303 Y113.951 E.1992
G1 X128.45 Y113.951 E.02829
G1 X128.45 Y114.726 E.02573
; WIPE_START
G1 F8843.478
G1 X128.45 Y113.951 E-.29474
G1 X129.303 Y113.951 E-.32403
G1 X129.566 Y114.214 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.906 Y113.525 Z7 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279781
G1 F3968
M204 S6000
G1 X122.293 Y113.525 E.10833
G2 X122.162 Y113.543 I.021 J.656 E.00256
; LINE_WIDTH: 0.214982
G2 X121.955 Y113.613 I.484 J1.763 E.00306
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X122.162 Y113.543 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/42
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z7 I-1.105 J.509 P1  F42000
G1 X128.29 Y126.84 Z7
G1 Z6.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4016
M204 S5000
G1 X133.91 Y126.84 E.17269
G1 X133.91 Y128.06 E.03749
G1 X128.29 Y128.06 E.17269
G1 X128.29 Y126.9 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.71 Y127.94 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
G1 F4016
M204 S5000
G1 X127.71 Y129.16 E.03749
G1 X122.09 Y129.16 E.17269
G1 X122.09 Y127.94 E.03749
M73 P85 R2
G1 X127.65 Y127.94 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.71 Y129.16 E-.46416
G1 X126.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.352 Y121.539 Z7.2 F42000
G1 X127.71 Y115.06 Z7.2
G1 Z6.8
G1 E.8 F1800
G1 F4016
M204 S5000
G1 X122.09 Y115.06 E.17269
G1 X122.09 Y113.84 E.03749
G1 X127.71 Y113.84 E.17269
G1 X127.71 Y115 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.462 Y122.65 Z7.2 F42000
G1 X125.302 Y127.548 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4016
M204 S6000
G1 X125.302 Y115.452 E.40124
G1 X128.102 Y115.452 E.09288
G1 X128.102 Y113.603 E.06135
G1 X133.719 Y113.604 E.18632
G1 X133.793 Y113.626 E.00257
G1 X133.864 Y113.69 E.00317
G3 X133.897 Y113.79 I-.211 J.125 E.00352
G1 X133.898 Y126.448 E.41987
G1 X127.898 Y126.448 E.19903
G1 X127.898 Y127.548 E.03649
G1 X125.362 Y127.548 E.08412
; WIPE_START
G1 F8843.478
G1 X125.352 Y125.548 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.88 Y132.749 Z7.2 F42000
G1 X130.618 Y140.548 Z7.2
G1 Z6.8
G1 E.8 F1800
G1 F4016
M204 S6000
G1 X127.898 Y140.548 E.09024
G1 X127.898 Y142.397 E.06135
G1 X122.262 Y142.393 E.18697
G3 X122.103 Y142.203 I.049 J-.202 E.0088
G1 X122.102 Y129.552 E.41966
G1 X128.102 Y129.552 E.19903
G1 X128.102 Y128.452 E.03649
G1 X130.698 Y128.452 E.08611
G1 X130.698 Y140.548 E.40124
G1 X130.678 Y140.548 E.00065
; WIPE_START
G1 F8843.478
G1 X128.678 Y140.548 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.29 Y140.94 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4016
M204 S5000
G1 X133.91 Y140.94 E.17269
G1 X133.91 Y142.16 E.03749
G1 X128.29 Y142.16 E.17269
G1 X128.29 Y141 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.09 Y140.81 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
G1 F4016
M204 S5000
G1 X134.06 Y140.81 E.09126
G1 X134.06 Y140.335 E.0146
G1 X134.29 Y140.335 E.00706
G1 X134.289 Y142.229 E.05819
G3 X133.726 Y142.789 I-.594 J-.034 E.02671
G1 X122.305 Y142.79 E.35094
G3 X121.711 Y142.227 I.012 J-.608 E.0276
G1 X121.71 Y127.335 E.45758
G1 X121.94 Y127.335 E.00707
G1 X121.94 Y127.81 E.0146
G1 X124.91 Y127.81 E.09126
G1 X124.91 Y115.19 E.38778
G1 X121.94 Y115.19 E.09126
G1 X121.94 Y115.665 E.0146
G1 X121.71 Y115.665 E.00706
G1 X121.711 Y113.774 E.05811
G3 X122.274 Y113.211 I.591 J.029 E.02682
G1 X133.758 Y113.213 E.35287
G3 X134.289 Y113.771 I-.066 J.595 E.02572
G1 X134.29 Y128.665 E.45765
G1 X134.06 Y128.665 E.00707
G1 X134.06 Y128.19 E.0146
G1 X131.09 Y128.19 E.09126
G1 X131.09 Y140.75 E.38593
; WIPE_START
G1 F9547.055
M204 S6000
G1 X133.09 Y140.79 E-.76
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


G1 X133.795 Y142.466 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280021
G1 F4016
M204 S6000
G3 X133.707 Y142.475 I-.102 J-.594 E.00172
G1 X128.094 Y142.475 E.10844
; WIPE_START
G1 F15000
G1 X130.094 Y142.475 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.55 Y141.273 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4016
M204 S6000
G1 X127.55 Y142.049 E.02574
G1 X126.697 Y142.049 E.02827
G1 X122.451 Y137.803 E.19922
G1 X122.451 Y141.225 E.11351
G1 X130.35 Y133.326 E.37054
G1 X130.35 Y130.35 E.09873
G1 X128.8 Y128.8 E.07269
G1 X128.45 Y128.8 E.01161
G1 X128.45 Y129.9 E.03649
G1 X126.1 Y129.9 E.07797
G1 X122.451 Y133.549 E.17119
G1 X122.45 Y130.126 E.11355
G1 X130.35 Y138.026 E.37058
G1 X130.35 Y139.654 E.05401
; WIPE_START
G1 F8843.478
G1 X130.35 Y138.026 E-.61876
G1 X130.087 Y137.763 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.795 Y142.466 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.242889
G1 F4016
M204 S6000
G2 X133.881 Y142.444 I-.104 J-.594 E.00145
; LINE_WIDTH: 0.202588
G1 X133.927 Y142.427 E.00064
; LINE_WIDTH: 0.162999
G1 X134.058 Y142.368 E.0014
; WIPE_START
G1 F15000
G1 X133.927 Y142.427 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.982 Y135.386 Z7.2 F42000
G1 X128 Y128.256 Z7.2
G1 Z6.8
G1 E.8 F1800
; LINE_WIDTH: 0.23088
G1 F4016
M204 S6000
G1 X128 Y127.744 E.00784
; WIPE_START
G1 F15000
G1 X128 Y128.256 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.254 Y120.628 Z7.2 F42000
G1 X128.45 Y114.726 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4016
M204 S6000
G1 X128.45 Y113.951 E.02573
G1 X129.303 Y113.951 E.02829
G1 X133.549 Y118.197 E.1992
G1 X133.549 Y114.775 E.11351
G1 X125.65 Y122.674 E.37054
G1 X125.65 Y125.65 E.09873
G1 X127.2 Y127.2 E.07269
G1 X127.55 Y127.2 E.01161
G1 X127.55 Y126.1 E.03649
G1 X129.9 Y126.1 E.07797
G1 X133.549 Y122.451 E.17119
G1 X133.55 Y125.874 E.11355
G1 X125.65 Y117.974 E.37058
G1 X125.65 Y116.346 E.05401
; WIPE_START
G1 F8843.478
G1 X125.65 Y117.974 E-.61876
G1 X125.913 Y118.237 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.906 Y113.525 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279786
G1 F4016
M204 S6000
G1 X122.293 Y113.525 E.10834
G2 X122.163 Y113.543 I.021 J.655 E.00255
; LINE_WIDTH: 0.232394
G1 X121.961 Y113.601 E.00323
M204 S10000
G1 X121.948 Y113.628 F42000
; LINE_WIDTH: 0.170048
G1 F4016
M204 S6000
G1 X122.443 Y113.407 E.00562
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X121.948 Y113.628 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/42
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z7.2 I-1.097 J.527 P1  F42000
M73 P86 R2
G1 X128.29 Y126.84 Z7.2
G1 Z7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3981
M204 S5000
G1 X133.91 Y126.84 E.17269
G1 X133.91 Y128.06 E.03749
G1 X128.29 Y128.06 E.17269
G1 X128.29 Y126.9 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.71 Y127.94 Z7.4 F42000
G1 Z7
G1 E.8 F1800
G1 F3981
M204 S5000
G1 X127.71 Y129.16 E.03749
G1 X122.09 Y129.16 E.17269
G1 X122.09 Y127.94 E.03749
G1 X127.65 Y127.94 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.71 Y129.16 E-.46416
G1 X126.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.352 Y121.539 Z7.4 F42000
G1 X127.71 Y115.06 Z7.4
G1 Z7
G1 E.8 F1800
G1 F3981
M204 S5000
G1 X122.09 Y115.06 E.17269
G1 X122.09 Y113.84 E.03749
G1 X127.71 Y113.84 E.17269
G1 X127.71 Y115 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.462 Y122.65 Z7.4 F42000
G1 X125.302 Y127.548 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3981
M204 S6000
G1 X125.302 Y115.452 E.40124
G1 X128.102 Y115.452 E.09288
G1 X128.102 Y113.603 E.06135
G1 X133.719 Y113.604 E.18631
G1 X133.839 Y113.661 E.00443
G3 X133.897 Y113.79 I-.143 J.141 E.00481
G1 X133.898 Y126.448 E.41987
G1 X127.898 Y126.448 E.19903
G1 X127.898 Y127.548 E.03649
G1 X125.362 Y127.548 E.08412
; WIPE_START
G1 F8843.478
G1 X125.352 Y125.548 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.88 Y132.749 Z7.4 F42000
G1 X130.618 Y140.548 Z7.4
G1 Z7
G1 E.8 F1800
G1 F3981
M204 S6000
G1 X127.898 Y140.548 E.09024
G1 X127.898 Y142.397 E.06135
G1 X122.262 Y142.393 E.18697
G3 X122.103 Y142.202 I.049 J-.202 E.00883
G1 X122.102 Y129.552 E.41963
G1 X128.102 Y129.552 E.19903
G1 X128.102 Y128.452 E.03649
G1 X130.698 Y128.452 E.08611
G1 X130.698 Y140.548 E.40124
G1 X130.678 Y140.548 E.00065
; WIPE_START
G1 F8843.478
G1 X128.678 Y140.548 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.29 Y140.94 Z7.4 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3981
M204 S5000
G1 X133.91 Y140.94 E.17269
G1 X133.91 Y142.16 E.03749
G1 X128.29 Y142.16 E.17269
G1 X128.29 Y141 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.09 Y140.81 Z7.4 F42000
G1 Z7
G1 E.8 F1800
G1 F3981
M204 S5000
G1 X134.06 Y140.81 E.09126
G1 X134.06 Y140.335 E.0146
G1 X134.29 Y140.335 E.00706
G1 X134.289 Y142.229 E.05819
G3 X133.726 Y142.789 I-.591 J-.031 E.02675
G1 X122.305 Y142.79 E.35094
G3 X121.711 Y142.226 I.012 J-.608 E.02761
G1 X121.71 Y127.335 E.45757
G1 X121.94 Y127.335 E.00707
G1 X121.94 Y127.81 E.0146
G1 X124.91 Y127.81 E.09126
G1 X124.91 Y115.19 E.38778
G1 X121.94 Y115.19 E.09126
G1 X121.94 Y115.665 E.0146
G1 X121.71 Y115.665 E.00706
G1 X121.711 Y113.771 E.05819
G3 X122.274 Y113.211 I.594 J.034 E.02671
G1 X133.758 Y113.213 E.35287
G3 X134.289 Y113.771 I-.066 J.595 E.02572
G1 X134.29 Y128.665 E.45765
G1 X134.06 Y128.665 E.00707
G1 X134.06 Y128.19 E.0146
G1 X131.09 Y128.19 E.09126
G1 X131.09 Y140.75 E.38593
; WIPE_START
G1 F9547.055
M204 S6000
G1 X133.09 Y140.79 E-.76
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


G1 X133.795 Y142.466 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.23605
G1 F3981
M204 S6000
G2 X134.039 Y142.399 I-.334 J-1.679 E.00398
M204 S10000
G1 X134.052 Y142.373 F42000
; LINE_WIDTH: 0.17177
G1 F3981
M204 S6000
G1 X133.554 Y142.593 E.00572
M204 S10000
G1 X133.795 Y142.466 F42000
; LINE_WIDTH: 0.280021
G1 F3981
M204 S6000
G3 X133.707 Y142.475 I-.102 J-.594 E.00171
G1 X128.094 Y142.475 E.10844
; WIPE_START
G1 F15000
G1 X130.094 Y142.475 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.35 Y139.654 Z7.4 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3981
M204 S6000
G1 X130.35 Y138.026 E.05401
G1 X122.45 Y130.126 E.37058
G1 X122.451 Y133.549 E.11355
G1 X126.1 Y129.9 E.17119
G1 X128.45 Y129.9 E.07797
G1 X128.45 Y128.8 E.03649
G1 X128.8 Y128.8 E.01161
G1 X130.35 Y130.35 E.07269
G1 X130.35 Y133.326 E.09873
G1 X122.451 Y141.225 E.37054
G1 X122.451 Y137.803 E.11351
G1 X126.697 Y142.049 E.19922
G1 X127.55 Y142.049 E.02827
G1 X127.55 Y141.273 E.02574
; WIPE_START
G1 F8843.478
G1 X127.55 Y142.049 E-.2949
G1 X126.697 Y142.049 E-.32387
G1 X126.435 Y141.787 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.312 Y134.205 Z7.4 F42000
G1 X128 Y128.256 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
G1 F3981
M204 S6000
G1 X128 Y127.744 E.00784
; WIPE_START
G1 F15000
G1 X128 Y128.256 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.523 Y120.768 Z7.4 F42000
G1 X125.65 Y116.346 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3981
M204 S6000
G1 X125.65 Y117.974 E.05401
G1 X133.55 Y125.874 E.37058
G1 X133.549 Y122.451 E.11355
G1 X129.9 Y126.1 E.17119
G1 X127.55 Y126.1 E.07797
G1 X127.55 Y127.2 E.03649
G1 X127.2 Y127.2 E.01161
G1 X125.65 Y125.65 E.07269
G1 X125.65 Y122.674 E.09873
G1 X133.549 Y114.775 E.37054
G1 X133.549 Y118.197 E.11351
G1 X129.303 Y113.951 E.1992
G1 X128.45 Y113.951 E.02828
G1 X128.45 Y114.726 E.02573
; WIPE_START
G1 F8843.478
G1 X128.45 Y113.951 E-.29475
G1 X129.303 Y113.951 E-.32402
G1 X129.566 Y114.214 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.906 Y113.525 Z7.4 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.278343
G1 F3981
M204 S6000
G1 X122.293 Y113.525 E.10768
G2 X121.963 Y113.598 I.1 J1.246 E.0065
M204 S10000
G1 X121.949 Y113.626 F42000
; LINE_WIDTH: 0.17738
G1 F3981
M204 S6000
G1 X122.461 Y113.407 E.0061
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X121.949 Y113.626 E-.76
; WIPE_END
M73 P87 R2
G1 E-.04 F1800
; layer num/total_layer_count: 36/42
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z7.4 I-1.097 J.527 P1  F42000
G1 X128.29 Y126.84 Z7.4
G1 Z7.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5071
M204 S5000
G1 X133.91 Y126.84 E.17269
M73 P87 R1
G1 X133.91 Y128.06 E.03749
G1 X128.29 Y128.06 E.17269
G1 X128.29 Y126.9 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.728 Y134.499 Z7.6 F42000
G1 X131.09 Y140.81 Z7.6
G1 Z7.2
G1 E.8 F1800
G1 F5071
M204 S5000
G1 X131.09 Y128.19 E.38778
G1 X133.66 Y128.19 E.07897
G1 X134.06 Y128.19 E.01229
G1 X134.06 Y128.706 E.01585
M106 S255
G1 F1800
G1 X134.06 Y129.075 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X134.06 Y139.925 E.35991
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X134.06 Y140.294 E.01134
M106 S201.45
G1 F5071
G1 X134.06 Y140.81 E.01586
G1 X133.66 Y140.81 E.01229
G1 X131.15 Y140.81 E.07712
; WIPE_START
G1 F9547.055
M204 S6000
G1 X131.14 Y138.81 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.843 Y131.531 Z7.6 F42000
G1 X127.71 Y127.94 Z7.6
G1 Z7.2
G1 E.8 F1800
G1 F5071
M204 S5000
G1 X127.71 Y129.16 E.03749
G1 X122.09 Y129.16 E.17269
G1 X122.09 Y127.94 E.03749
G1 X127.65 Y127.94 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.71 Y129.16 E-.46416
G1 X126.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.838 Y121.606 Z7.6 F42000
G1 X124.91 Y115.19 Z7.6
G1 Z7.2
G1 E.8 F1800
G1 F5071
M204 S5000
G1 X124.91 Y127.81 E.38778
G1 X122.34 Y127.81 E.07897
G1 X121.94 Y127.81 E.01229
G1 X121.94 Y127.294 E.01585
M106 S255
G1 F1800
G1 X121.94 Y126.925 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X121.94 Y116.075 E.35991
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X121.94 Y115.706 E.01134
M106 S201.45
G1 F5071
G1 X121.94 Y115.19 E.01586
G1 X122.34 Y115.19 E.01229
G1 X124.85 Y115.19 E.07712
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.859 Y117.19 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.71 Y115.06 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
G1 F5071
M204 S5000
G1 X122.09 Y115.06 E.17269
G1 X122.09 Y113.84 E.03749
G1 X127.71 Y113.84 E.17269
G1 X127.71 Y115 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.249 Y113.829 Z7.6 F42000
G1 X133.884 Y113.729 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5071
M204 S6000
G3 X133.897 Y113.79 I-.187 J.073 E.0021
G1 X133.897 Y126.448 E.41988
G1 X127.898 Y126.448 E.19901
G1 X127.898 Y127.548 E.03649
G1 X125.302 Y127.548 E.08611
G1 X125.302 Y115.452 E.40124
G1 X128.102 Y115.452 E.09288
G1 X128.102 Y113.603 E.06135
G1 X133.719 Y113.604 E.18632
G1 X133.839 Y113.66 E.00442
G3 X133.853 Y113.676 I-.143 J.141 E.00071
; WIPE_START
G1 F8843.478
G1 X133.897 Y113.79 E-.04634
G1 X133.897 Y115.668 E-.71366
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.924 Y123.239 Z7.6 F42000
G1 X130.698 Y140.548 Z7.6
G1 Z7.2
G1 E.8 F1800
G1 F5071
M204 S6000
G1 X127.898 Y140.548 E.09288
G1 X127.898 Y142.397 E.06135
G1 X122.262 Y142.393 E.18697
G3 X122.102 Y142.178 I.045 J-.2 E.0097
G1 X122.102 Y129.552 E.41881
G1 X128.102 Y129.552 E.19903
G1 X128.102 Y128.452 E.03649
G1 X130.698 Y128.452 E.08611
G1 X130.698 Y140.488 E.39925
; WIPE_START
G1 F8843.478
G1 X128.698 Y140.531 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.29 Y140.94 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5071
M204 S5000
G1 X133.91 Y140.94 E.17269
G1 X133.91 Y142.16 E.03749
G1 X128.29 Y142.16 E.17269
G1 X128.29 Y141 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.376 Y133.424 Z7.6 F42000
G1 X134.234 Y113.552 Z7.6
G1 Z7.2
G1 E.8 F1800
G1 F5071
M204 S5000
G1 X134.234 Y113.555 E.00009
G3 X134.289 Y113.771 I-.543 J.253 E.0069
G1 X134.29 Y127.906 E.43433
G1 X134.29 Y128.306 E.01229
G1 F4919.51
G1 X134.29 Y128.706 E.01229
M106 S255
G1 F1800
G1 X134.29 Y129.075 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X134.29 Y139.925 E.35991
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X134.29 Y140.294 E.01134
M106 S201.45
G1 F4919.51
G1 X134.29 Y140.694 E.01229
G1 F5071
G1 X134.29 Y141.094 E.01229
G1 X134.29 Y142.195 E.03382
G3 X133.726 Y142.789 I-.608 J-.012 E.02761
G1 X122.305 Y142.79 E.35094
G3 X121.71 Y142.192 I.012 J-.607 E.02866
G1 X121.71 Y128.094 E.43319
G1 X121.71 Y127.694 E.01229
G1 F4919.51
G1 X121.71 Y127.294 E.01229
M106 S255
G1 F1800
G1 X121.71 Y126.925 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X121.71 Y116.075 E.35991
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X121.71 Y115.706 E.01134
M106 S201.45
G1 F4919.51
G1 X121.71 Y115.306 E.01229
G1 F5071
G1 X121.71 Y114.906 E.01229
G1 X121.71 Y113.805 E.03382
G3 X122.274 Y113.211 I.608 J.012 E.02761
G1 X133.758 Y113.213 E.35287
G3 X134.115 Y113.385 I-.066 J.595 E.01241
G1 X134.199 Y113.503 E.00447
; WIPE_START
G1 F9547.055
M204 S6000
G1 X134.234 Y113.555 E-.02361
G1 X134.289 Y113.771 E-.08479
G1 X134.289 Y115.486 E-.6516
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


G1 X128.45 Y114.726 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5071
M204 S6000
G1 X128.45 Y113.951 E.02573
G1 X129.303 Y113.951 E.02828
G1 X133.549 Y118.197 E.19919
G1 X133.549 Y114.775 E.11351
G1 X125.65 Y122.674 E.37054
G1 X125.65 Y125.65 E.09873
G1 X127.2 Y127.2 E.07269
G1 X127.55 Y127.2 E.01161
G1 X127.55 Y126.1 E.03649
G1 X129.9 Y126.1 E.07797
G1 X133.549 Y122.451 E.17118
G1 X133.549 Y125.873 E.11353
G1 X125.65 Y117.974 E.37056
G1 X125.65 Y116.346 E.05401
; WIPE_START
G1 F8843.478
G1 X125.65 Y117.974 E-.61876
G1 X125.913 Y118.237 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P88 R1
G1 X127.906 Y113.525 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279915
G1 F5071
M204 S6000
G1 X122.293 Y113.525 E.1084
G2 X122.182 Y113.538 I.026 J.717 E.00217
; LINE_WIDTH: 0.241737
G1 X122.134 Y113.551 E.00081
; LINE_WIDTH: 0.213455
G1 X122.088 Y113.566 E.00066
; LINE_WIDTH: 0.177406
G1 X121.949 Y113.626 E.00166
; WIPE_START
G1 F15000
G1 X122.088 Y113.566 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.026 Y120.611 Z7.6 F42000
G1 X128 Y127.744 Z7.6
G1 Z7.2
G1 E.8 F1800
; LINE_WIDTH: 0.23088
G1 F5071
M204 S6000
G1 X128 Y128.256 E.00784
; WIPE_START
G1 F15000
G1 X128 Y127.744 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.746 Y135.372 Z7.6 F42000
G1 X127.55 Y141.273 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5071
M204 S6000
G1 X127.55 Y142.049 E.02574
G1 X126.697 Y142.049 E.02827
G1 X122.45 Y137.802 E.19925
G1 X122.45 Y141.226 E.11357
G1 X130.35 Y133.326 E.37058
G1 X130.35 Y130.35 E.09873
G1 X128.8 Y128.8 E.07269
G1 X128.45 Y128.8 E.01161
G1 X128.45 Y129.9 E.03649
G1 X126.1 Y129.9 E.07797
G1 X122.45 Y133.55 E.17121
G1 X122.45 Y130.126 E.11357
G1 X130.35 Y138.026 E.37058
G1 X130.35 Y139.654 E.05401
; WIPE_START
G1 F8843.478
G1 X130.35 Y138.026 E-.61876
G1 X130.087 Y137.763 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.094 Y142.475 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280105
G1 F5071
M204 S6000
G1 X133.754 Y142.472 E.10939
; LINE_WIDTH: 0.255107
G1 X133.866 Y142.449 E.00197
; LINE_WIDTH: 0.213613
G1 X133.912 Y142.433 E.00068
; LINE_WIDTH: 0.17737
G1 X134.051 Y142.374 E.00166
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X133.912 Y142.433 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/42
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z7.6 I1.145 J-.413 P1  F42000
G1 X128.29 Y126.84 Z7.6
G1 Z7.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5321
M204 S5000
G1 X133.91 Y126.84 E.17269
G1 X133.91 Y128.06 E.03749
G1 X128.29 Y128.06 E.17269
G1 X128.29 Y126.9 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.728 Y134.499 Z7.8 F42000
G1 X131.09 Y140.81 Z7.8
G1 Z7.4
G1 E.8 F1800
G1 F5321
M204 S5000
G1 X131.09 Y128.19 E.38778
G1 X134.06 Y128.19 E.09126
G1 X134.06 Y140.81 E.38778
G1 X131.15 Y140.81 E.08942
; WIPE_START
G1 F9547.055
M204 S6000
G1 X131.14 Y138.81 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.843 Y131.531 Z7.8 F42000
G1 X127.71 Y127.94 Z7.8
G1 Z7.4
G1 E.8 F1800
G1 F5321
M204 S5000
G1 X127.71 Y129.16 E.03749
G1 X122.09 Y129.16 E.17269
G1 X122.09 Y127.94 E.03749
G1 X127.65 Y127.94 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.71 Y129.16 E-.46416
G1 X126.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.838 Y121.606 Z7.8 F42000
G1 X124.91 Y115.19 Z7.8
G1 Z7.4
G1 E.8 F1800
G1 F5321
M204 S5000
G1 X124.91 Y127.81 E.38778
G1 X121.94 Y127.81 E.09126
G1 X121.94 Y115.19 E.38778
G1 X124.85 Y115.19 E.08942
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.859 Y117.19 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.71 Y115.06 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
G1 F5321
M204 S5000
G1 X122.09 Y115.06 E.17269
G1 X122.09 Y113.84 E.03749
G1 X127.71 Y113.84 E.17269
G1 X127.71 Y115 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.249 Y113.829 Z7.8 F42000
G1 X133.884 Y113.729 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5321
M204 S6000
G3 X133.897 Y113.79 I-.187 J.073 E.0021
G1 X133.897 Y126.448 E.41988
G1 X127.898 Y126.448 E.19901
G1 X127.898 Y127.548 E.03649
G1 X125.302 Y127.548 E.08611
G1 X125.302 Y115.452 E.40124
G1 X128.102 Y115.452 E.09288
G1 X128.102 Y113.603 E.06135
G1 X133.719 Y113.604 E.18632
G1 X133.839 Y113.661 E.00442
G3 X133.853 Y113.676 I-.143 J.141 E.0007
; WIPE_START
G1 F8843.478
G1 X133.897 Y113.79 E-.0464
G1 X133.897 Y115.668 E-.71361
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.924 Y123.238 Z7.8 F42000
G1 X130.698 Y140.548 Z7.8
G1 Z7.4
G1 E.8 F1800
G1 F5321
M204 S6000
G1 X127.898 Y140.548 E.09288
G1 X127.898 Y142.397 E.06135
G1 X122.262 Y142.393 E.18697
G3 X122.102 Y142.178 I.045 J-.2 E.00971
G1 X122.102 Y129.552 E.41881
G1 X128.102 Y129.552 E.19903
G1 X128.102 Y128.452 E.03649
G1 X130.698 Y128.452 E.08611
G1 X130.698 Y140.488 E.39925
; WIPE_START
G1 F8843.478
G1 X128.698 Y140.531 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.29 Y140.94 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5321
M204 S5000
G1 X133.91 Y140.94 E.17269
G1 X133.91 Y142.16 E.03749
G1 X128.29 Y142.16 E.17269
G1 X128.29 Y141 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.377 Y133.424 Z7.8 F42000
G1 X134.235 Y113.553 Z7.8
G1 Z7.4
G1 E.8 F1800
G1 F5321
M204 S5000
G1 X134.234 Y113.554 E.00006
G3 X134.289 Y113.771 I-.542 J.254 E.00693
G1 X134.29 Y142.195 E.87338
G3 X133.726 Y142.789 I-.608 J-.013 E.02761
G1 X122.305 Y142.79 E.35094
G3 X121.71 Y142.192 I.012 J-.607 E.02866
G1 X121.71 Y113.805 E.87225
G3 X122.274 Y113.211 I.608 J.013 E.02761
G1 X133.758 Y113.213 E.35287
G3 X134.115 Y113.385 I-.066 J.595 E.01242
G1 X134.2 Y113.504 E.0045
; WIPE_START
G1 F9547.055
M204 S6000
G1 X134.234 Y113.554 E-.02291
G1 X134.289 Y113.771 E-.08515
G1 X134.289 Y115.487 E-.65194
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


G1 X127.906 Y113.525 F42000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279803
G1 F5321
M204 S6000
G1 X122.293 Y113.525 E.10834
G2 X122.162 Y113.543 I.02 J.652 E.00256
; LINE_WIDTH: 0.214707
G2 X121.955 Y113.614 I.477 J1.739 E.00306
; WIPE_START
G1 F15000
G1 X122.162 Y113.543 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.027 Y116.723 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5321
M204 S6000
G1 X126.027 Y118.352 E.05401
G1 X133.172 Y125.496 E.33516
G1 X133.172 Y122.828 E.0885
G1 X130.277 Y125.722 E.13578
G1 X127.173 Y125.722 E.103
M73 P89 R1
G1 X127.173 Y126.822 E.03649
G1 X126.822 Y126.822 E.01161
G1 X126.027 Y126.027 E.0373
G1 X126.027 Y122.297 E.12376
G1 X133.172 Y115.152 E.33514
G1 X133.172 Y117.82 E.08848
G1 X129.68 Y114.328 E.16379
G1 X128.827 Y114.328 E.02829
G1 X128.827 Y115.104 E.02573
M204 S10000
G1 X127.376 Y127.185 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.384085
G1 F5321
M204 S6000
G1 X127.508 Y127.158 E.00374
G1 X127.535 Y126.244 E.02541
G1 X127.562 Y126.112 E.00375
G1 X127.694 Y126.085 E.00375
G1 X133.375 Y126.085 E.15793
G1 X133.507 Y126.058 E.00375
G1 X133.535 Y125.926 E.00375
G1 X133.534 Y114.126 E.32806
G1 X133.507 Y113.994 E.00374
G1 X133.375 Y113.966 E.00374
G1 X128.624 Y113.965 E.13208
G1 X128.492 Y113.993 E.00375
G1 X128.465 Y114.125 E.00375
G1 X128.465 Y115.656 E.04256
G1 X128.437 Y115.787 E.00375
G1 X128.306 Y115.815 E.00374
G1 X125.824 Y115.815 E.06899
G1 X125.692 Y115.842 E.00375
G1 X125.665 Y115.974 E.00375
G1 X125.665 Y127.026 E.30725
G1 X125.692 Y127.158 E.00375
G1 X125.824 Y127.185 E.00374
G1 X127.316 Y127.185 E.04148
M204 S10000
G1 X128 Y127.744 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
G1 F5321
M204 S6000
G1 X128 Y128.256 E.00784
M204 S10000
G1 X128.624 Y128.815 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.384084
G1 F5321
M204 S6000
G1 X128.492 Y128.842 E.00374
G1 X128.465 Y129.756 E.02541
G1 X128.437 Y129.888 E.00375
G1 X128.306 Y129.915 E.00375
G1 X122.624 Y129.915 E.15795
G1 X122.492 Y129.942 E.00374
G1 X122.465 Y130.074 E.00375
G1 X122.465 Y141.876 E.3281
G1 X122.492 Y142.008 E.00375
G1 X122.624 Y142.035 E.00375
G1 X127.376 Y142.035 E.1321
G1 X127.508 Y142.007 E.00375
G1 X127.535 Y141.876 E.00374
G1 X127.535 Y140.344 E.04257
G1 X127.562 Y140.212 E.00375
G1 X127.694 Y140.185 E.00374
G1 X130.176 Y140.185 E.06899
G1 X130.308 Y140.158 E.00375
G1 X130.335 Y140.026 E.00375
G1 X130.335 Y128.974 E.30725
G1 X130.308 Y128.842 E.00375
G1 X130.176 Y128.815 E.00374
G1 X128.684 Y128.815 E.04148
M204 S10000
G1 X129.973 Y139.277 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5321
M204 S6000
G1 X129.973 Y137.648 E.05401
G1 X122.827 Y130.503 E.33519
G1 X122.827 Y133.173 E.08854
G1 X125.722 Y130.277 E.13581
G1 X128.827 Y130.277 E.103
G1 X128.827 Y129.177 E.03649
G1 X129.177 Y129.177 E.01161
G1 X129.973 Y129.973 E.0373
G1 X129.973 Y133.703 E.12376
G1 X122.827 Y140.848 E.33519
G1 X122.827 Y138.179 E.08854
G1 X126.32 Y141.672 E.16385
G1 X127.173 Y141.672 E.02827
G1 X127.173 Y140.896 E.02574
; WIPE_START
G1 F8843.478
G1 X127.173 Y141.672 E-.29491
G1 X126.32 Y141.672 E-.32386
G1 X126.057 Y141.409 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.094 Y142.475 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.278371
G1 F5321
M204 S6000
G1 X133.707 Y142.475 E.10769
G2 X134.037 Y142.402 I-.1 J-1.248 E.0065
M204 S10000
G1 X134.051 Y142.374 F42000
; LINE_WIDTH: 0.177443
G1 F5321
M204 S6000
G1 X133.54 Y142.593 E.0061
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X134.051 Y142.374 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/42
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
M106 S198.9
; OBJECT_ID: 394
M204 S10000
G17
G3 Z7.8 I1.141 J-.423 P1  F42000
G1 X128.29 Y126.84 Z7.8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X133.91 Y126.84 E.17269
G1 X133.91 Y128.06 E.03749
G1 X128.29 Y128.06 E.17269
G1 X128.29 Y126.9 E.03564
; WIPE_START
M204 S6000
G1 X130.29 Y126.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.728 Y134.499 Z8 F42000
G1 X131.09 Y140.81 Z8
G1 Z7.6
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X131.09 Y128.19 E.38778
G1 X134.06 Y128.19 E.09126
G1 X134.06 Y140.81 E.38778
G1 X131.15 Y140.81 E.08942
; WIPE_START
M204 S6000
G1 X131.14 Y138.81 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.843 Y131.531 Z8 F42000
G1 X127.71 Y127.94 Z8
G1 Z7.6
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X127.71 Y129.16 E.03749
G1 X122.09 Y129.16 E.17269
G1 X122.09 Y127.94 E.03749
G1 X127.65 Y127.94 E.17084
; WIPE_START
M204 S6000
G1 X127.71 Y129.16 E-.46416
G1 X126.931 Y129.16 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.838 Y121.606 Z8 F42000
G1 X124.91 Y115.19 Z8
G1 Z7.6
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X124.91 Y127.81 E.38778
G1 X121.94 Y127.81 E.09126
G1 X121.94 Y115.19 E.38778
G1 X124.85 Y115.19 E.08942
; WIPE_START
M204 S6000
G1 X124.859 Y117.19 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.71 Y115.06 Z8 F42000
G1 Z7.6
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X122.09 Y115.06 E.17269
G1 X122.09 Y113.84 E.03749
G1 X127.71 Y113.84 E.17269
G1 X127.71 Y115 E.03564
; WIPE_START
M204 S6000
G1 X125.71 Y115.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.249 Y113.829 Z8 F42000
G1 X133.883 Y113.728 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X133.897 Y113.79 I-.187 J.073 E.00211
G1 X133.897 Y126.448 E.41988
G1 X127.898 Y126.448 E.19901
G1 X127.898 Y127.548 E.03649
G1 X125.302 Y127.548 E.08611
G1 X125.302 Y115.452 E.40124
G1 X128.102 Y115.452 E.09288
G1 X128.102 Y113.603 E.06135
G1 X133.719 Y113.604 E.18633
G1 X133.839 Y113.661 E.00442
G3 X133.853 Y113.676 I-.143 J.141 E.00069
; WIPE_START
G1 X133.897 Y113.79 E-.0465
G1 X133.897 Y115.668 E-.7135
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.924 Y123.238 Z8 F42000
G1 X130.698 Y140.548 Z8
G1 Z7.6
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X127.898 Y140.548 E.09288
G1 X127.898 Y142.397 E.06135
G1 X122.261 Y142.393 E.18697
G3 X122.102 Y142.178 I.045 J-.2 E.0097
G1 X122.102 Y129.552 E.41881
G1 X128.102 Y129.552 E.19903
G1 X128.102 Y128.452 E.03649
G1 X130.698 Y128.452 E.08611
G1 X130.698 Y140.488 E.39925
; WIPE_START
G1 X128.698 Y140.531 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.29 Y140.94 Z8 F42000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X133.91 Y140.94 E.17269
G1 X133.91 Y142.16 E.03749
G1 X128.29 Y142.16 E.17269
G1 X128.29 Y141 E.03564
; WIPE_START
M204 S6000
G1 X130.29 Y140.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.376 Y133.424 Z8 F42000
G1 X134.233 Y113.553 Z8
G1 Z7.6
G1 E.8 F1800
G1 F9547.055
M204 S5000
G3 X134.289 Y113.771 I-.542 J.255 E.00695
G1 X134.29 Y142.195 E.87338
G3 X133.726 Y142.789 I-.608 J-.013 E.02761
G1 X122.305 Y142.79 E.35094
G3 X121.71 Y142.192 I.012 J-.607 E.02866
G1 X121.71 Y113.805 E.87225
M73 P90 R1
G3 X122.274 Y113.211 I.608 J.013 E.02761
G1 X133.758 Y113.213 E.35287
G3 X134.205 Y113.5 I-.066 J.595 E.01692
; WIPE_START
M204 S6000
G1 X134.289 Y113.771 E-.10777
G1 X134.289 Y115.487 E-.65224
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


G1 X128.269 Y115.069 F42000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.41358
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X129.366 Y113.972 E.08488
G1 X128.71 Y113.972 E.03588
G1 X128.269 Y114.413 E.03414
M106 S198.9
M204 S10000
G1 X127.906 Y113.525 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.279813
; LAYER_HEIGHT: 0.2
G1 F15000
M204 S6000
G1 X122.293 Y113.525 E.10835
G2 X122.162 Y113.543 I.021 J.653 E.00255
; LINE_WIDTH: 0.214635
G2 X121.955 Y113.614 I.477 J1.74 E.00306
; WIPE_START
G1 X122.162 Y113.543 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.408 Y115.619 Z8 F42000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.41358
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X125.672 Y116.355 E.05698
G1 X125.672 Y117.011 E.03588
G1 X126.861 Y115.822 E.09205
G1 X127.516 Y115.822 E.03588
G1 X125.672 Y117.666 E.1428
G1 X125.672 Y118.322 E.03588
G1 X130.021 Y113.973 E.33668
G1 X130.677 Y113.973 E.03588
G1 X125.672 Y118.978 E.38742
G1 X125.672 Y119.633 E.03588
G1 X131.332 Y113.973 E.43816
G1 X131.988 Y113.973 E.03588
G1 X125.672 Y120.289 E.4889
G1 X125.672 Y120.944 E.03589
G1 X132.643 Y113.973 E.53964
G1 X133.299 Y113.973 E.03588
G1 X125.672 Y121.6 E.59038
G1 X125.672 Y122.256 E.03588
G1 X133.527 Y114.4 E.60809
G1 X133.527 Y115.056 E.03588
G1 X125.672 Y122.911 E.60809
G1 X125.672 Y123.567 E.03588
G1 X133.527 Y115.711 E.60809
G1 X133.527 Y116.367 E.03588
G1 X125.672 Y124.222 E.6081
G1 X125.672 Y124.878 E.03588
G1 X133.527 Y117.022 E.6081
G1 X133.527 Y117.678 E.03588
G1 X125.672 Y125.534 E.6081
G1 X125.672 Y126.189 E.03588
G1 X133.528 Y118.333 E.6081
G1 X133.528 Y118.989 E.03588
G1 X125.672 Y126.845 E.6081
G1 X125.672 Y127.178 E.01825
G1 X125.994 Y127.178 E.01763
G1 X133.528 Y119.645 E.58316
G1 X133.528 Y120.3 E.03588
G1 X126.447 Y127.381 E.54809
M106 S198.9
M204 S10000
G1 X127.103 Y127.381 F42000
M106 S255
G1 F3000
M204 S6000
G1 X127.731 Y126.753 E.04863
M106 S198.9
M204 S10000
G1 X128.203 Y126.281 F42000
M106 S255
G1 F3000
M204 S6000
G1 X133.528 Y120.956 E.4122
G1 X133.528 Y121.611 E.03588
G1 X129.061 Y126.078 E.34577
G1 X129.716 Y126.078 E.03588
G1 X133.528 Y122.267 E.29503
G1 X133.528 Y122.923 E.03588
G1 X130.372 Y126.078 E.24428
G1 X131.027 Y126.078 E.03588
G1 X133.528 Y123.578 E.19353
G1 X133.528 Y124.234 E.03588
G1 X131.683 Y126.078 E.14279
G1 X132.339 Y126.078 E.03588
G1 X133.528 Y124.889 E.09204
G1 X133.528 Y125.545 E.03588
G1 X132.792 Y126.281 E.05697
M106 S198.9
; WIPE_START
G1 X133.528 Y125.545 E-.3955
G1 X133.528 Y124.889 E-.24912
G1 X133.313 Y125.104 E-.11538
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128 Y127.744 Z8 F42000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
; LAYER_HEIGHT: 0.2
G1 F15000
M204 S6000
G1 X128 Y128.256 E.00784
; WIPE_START
G1 X128 Y127.744 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.269 Y129.247 Z8 F42000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.41359
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X128.695 Y128.822 E.03294
G1 X129.35 Y128.822 E.03589
G1 X122.472 Y135.7 E.53249
G1 X122.472 Y136.356 E.03589
G1 X130.006 Y128.822 E.58324
G1 X130.328 Y128.822 E.01764
G1 X130.328 Y129.155 E.01824
G1 X122.472 Y137.012 E.60819
G1 X122.472 Y137.667 E.03589
G1 X130.328 Y129.811 E.60819
G1 X130.328 Y130.466 E.03589
G1 X122.472 Y138.323 E.60819
G1 X122.472 Y138.978 E.03589
G1 X130.328 Y131.122 E.60819
G1 X130.328 Y131.777 E.03589
G1 X122.472 Y139.634 E.60819
G1 X122.472 Y140.29 E.03589
G1 X130.328 Y132.433 E.60819
G1 X130.328 Y133.089 E.03589
G1 X122.472 Y140.945 E.60819
G1 X122.472 Y141.601 E.03589
G1 X130.328 Y133.744 E.60819
G1 X130.328 Y134.4 E.03589
G1 X122.7 Y142.028 E.59052
G1 X123.356 Y142.028 E.03589
G1 X130.328 Y135.056 E.53977
G1 X130.328 Y135.711 E.03589
G1 X124.011 Y142.028 E.48901
G1 X124.667 Y142.028 E.03589
G1 X130.328 Y136.367 E.43825
G1 X130.328 Y137.022 E.03589
G1 X125.12 Y142.231 E.40317
M106 S198.9
; WIPE_START
G1 X126.534 Y140.816 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.592 Y140.381 Z8 F42000
G1 Z7.6
G1 E.8 F1800
M106 S255
G1 F3000
M204 S6000
G1 X130.328 Y139.645 E.05697
G1 X130.328 Y138.989 E.03589
G1 X129.139 Y140.178 E.09205
G1 X128.484 Y140.178 E.03589
G1 X130.328 Y138.334 E.1428
G1 X130.328 Y137.678 E.03589
G1 X125.978 Y142.028 E.33674
G1 X126.634 Y142.028 E.03589
G1 X127.528 Y141.134 E.06923
G1 X127.528 Y141.789 E.03589
G1 X127.087 Y142.23 E.03415
M106 S198.9
; WIPE_START
G1 X127.528 Y141.789 E-.2371
G1 X127.528 Y141.134 E-.24914
G1 X127.019 Y141.643 E-.27377
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.094 Y142.475 Z8 F42000
M73 P91 R1
G1 Z7.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280021
; LAYER_HEIGHT: 0.2
G1 F15000
M204 S6000
G1 X133.707 Y142.475 E.10844
G2 X133.795 Y142.466 I-.013 J-.6 E.00172
; LINE_WIDTH: 0.24287
G2 X133.881 Y142.444 I-.104 J-.594 E.00145
; LINE_WIDTH: 0.20247
G1 X133.927 Y142.427 E.00064
; LINE_WIDTH: 0.162821
G1 X134.058 Y142.367 E.0014
; WIPE_START
G1 X133.927 Y142.427 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.429 Y138.425 Z8 F42000
G1 X122.269 Y135.247 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.41359
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X127.595 Y129.922 E.41226
G1 X126.939 Y129.922 E.03589
G1 X122.472 Y134.389 E.34583
G1 X122.472 Y133.734 E.03589
G1 X126.284 Y129.922 E.29508
G1 X125.628 Y129.922 E.03589
G1 X122.472 Y133.078 E.24433
G1 X122.472 Y132.422 E.03589
G1 X124.972 Y129.922 E.19357
G1 X124.317 Y129.922 E.03589
G1 X122.472 Y131.767 E.14282
G1 X122.472 Y131.111 E.03589
G1 X123.661 Y129.922 E.09207
G1 X123.005 Y129.922 E.03589
G1 X122.269 Y130.658 E.05699
M106 S198.9
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
G1 X123.005 Y129.922 E-.39566
G1 X123.661 Y129.922 E-.24914
G1 X123.447 Y130.136 E-.1152
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/42
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z8 I1.027 J.653 P1  F42000
G1 X133.883 Y113.728 Z8
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X133.897 Y113.79 I-.187 J.074 E.00213
G1 X133.897 Y127.418 E.45203
G1 X133.897 Y127.818 E.01327
G1 F6070.344
G1 X133.897 Y128.217 E.01327
G1 F2520
G1 X133.898 Y140.782 E.4168
G1 F6070.344
G1 X133.897 Y141.182 E.01327
G1 F8843.478
G1 X133.895 Y141.582 E.01327
G1 X133.893 Y142.238 E.02176
G3 X133.702 Y142.397 I-.203 J-.05 E.00882
G1 X122.261 Y142.393 E.37951
G3 X122.102 Y142.178 I.045 J-.2 E.0097
G1 X122.102 Y128.582 E.45097
G1 X122.102 Y128.182 E.01327
G1 F6070.344
G1 X122.102 Y127.782 E.01327
G1 F2520
G1 X122.102 Y115.217 E.4168
G1 F6070.344
G1 X122.103 Y114.818 E.01327
G1 F8843.478
G1 X122.105 Y114.418 E.01327
G1 X122.107 Y113.761 E.02176
G3 X122.298 Y113.603 I.202 J.049 E.00883
G1 X133.719 Y113.604 E.37887
G1 X133.84 Y113.661 E.00441
G3 X133.853 Y113.676 I-.143 J.141 E.00067
M204 S250
G1 X134.236 Y113.558 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X134.289 Y113.771 E.00674
G1 X134.29 Y142.195 E.87338
G3 X133.726 Y142.789 I-.608 J-.012 E.02761
G1 X122.305 Y142.79 E.35094
G3 X121.71 Y142.192 I.012 J-.607 E.02866
G1 X121.71 Y113.805 E.87225
G3 X122.274 Y113.211 I.608 J.012 E.02761
G1 X133.758 Y113.213 E.35287
G3 X134.208 Y113.505 I-.066 J.595 E.01711
; WIPE_START
M204 S6000
G1 X134.289 Y113.771 E-.10557
G1 X134.289 Y115.493 E-.65444
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


G1 X133.733 Y114.544 F42000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42702
G1 F9372.559
M204 S6000
G1 X133.126 Y113.937 E.02688
G1 X132.583 Y113.937 E.017
G1 X133.563 Y114.918 E.04341
G1 X133.563 Y115.461 E.017
G1 X132.039 Y113.937 E.06745
G1 X131.496 Y113.937 E.017
G1 X133.563 Y116.004 E.09148
G1 X133.563 Y116.547 E.017
G1 X130.953 Y113.937 E.11552
G1 X130.41 Y113.937 E.017
G1 X133.563 Y117.09 E.13956
G1 X133.562 Y117.633 E.017
G1 X129.867 Y113.937 E.16359
G1 X129.323 Y113.937 E.017
G1 X133.562 Y118.176 E.18763
G1 X133.562 Y118.719 E.017
G1 X129.094 Y114.251 E.19775
G1 X129.094 Y114.794 E.017
G1 X133.562 Y119.262 E.19774
G1 X133.562 Y119.805 E.017
G1 X129.028 Y115.271 E.20069
G1 X128.867 Y115.653 E.01298
G1 X133.561 Y120.348 E.2078
G1 X133.561 Y120.891 E.017
G1 X128.638 Y115.967 E.21794
G1 X128.502 Y116.087 E.00565
G1 X128.33 Y116.202 E.00651
G1 X133.561 Y121.434 E.23157
G1 X133.561 Y121.977 E.017
G1 X127.952 Y116.368 E.24827
G1 X127.696 Y116.429 E.00823
G1 X127.485 Y116.444 E.00662
G1 X133.561 Y122.52 E.26892
G1 X133.561 Y123.063 E.017
G1 X126.942 Y116.444 E.29295
G1 X126.399 Y116.444 E.017
G1 X133.56 Y123.606 E.31699
G1 X133.56 Y124.149 E.017
G1 X126.294 Y116.883 E.32161
G1 X126.294 Y117.426 E.017
G1 X133.56 Y124.692 E.3216
G1 X133.56 Y125.235 E.017
G1 X126.294 Y117.969 E.32159
G1 X126.294 Y118.513 E.017
G1 X133.237 Y125.456 E.30732
G1 X132.694 Y125.456 E.017
G1 X126.294 Y119.056 E.28328
G1 X126.294 Y119.599 E.017
G1 X132.151 Y125.456 E.25923
G1 X131.608 Y125.456 E.017
G1 X126.294 Y120.142 E.23519
G1 X126.294 Y120.685 E.017
G1 X131.065 Y125.456 E.21114
G1 X130.521 Y125.456 E.017
G1 X126.294 Y121.229 E.1871
G1 X126.294 Y121.772 E.017
G1 X129.978 Y125.456 E.16306
G1 X129.435 Y125.456 E.017
G1 X126.294 Y122.315 E.13901
G1 X126.294 Y122.858 E.017
G1 X128.892 Y125.456 E.11497
G2 X128.357 Y125.464 I-.215 J3.28 E.01676
G1 X126.294 Y123.401 E.0913
G1 X126.294 Y123.945 E.017
G1 X127.929 Y125.579 E.07233
G1 X127.737 Y125.662 E.00652
G1 X127.57 Y125.763 E.00614
G1 X126.294 Y124.488 E.05644
G1 X126.294 Y125.031 E.017
G1 X127.285 Y126.021 E.04383
G1 X127.164 Y126.194 E.00661
G1 X127.079 Y126.358 E.00579
G1 X126.294 Y125.574 E.03471
G1 X126.294 Y126.117 E.017
G1 X126.902 Y126.725 E.0269
; WIPE_START
G1 X126.294 Y126.117 E-.32663
G1 X126.294 Y125.574 E-.20642
G1 X126.717 Y125.997 E-.22696
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.2 I-.867 J-.854 P1  F42000
G1 X122.443 Y130.337 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.42614
M106 S255
M73 P92 R1
G1 F3000
M204 S6000
G1 X122.446 Y114.891 E.48233
G1 X122.489 Y114.848 E.00189
G1 X122.489 Y114.051 E.02489
G3 X122.446 Y113.936 I.036 J-.079 E.00425
G1 X122.826 Y113.936 E.01187
G1 X122.826 Y130.167 E.50685
G1 X123.21 Y130.167 E.01197
G1 X123.21 Y113.936 E.50685
G1 X123.593 Y113.936 E.01197
G1 X123.593 Y130.167 E.50685
G1 X123.976 Y130.167 E.01197
G1 X123.976 Y113.936 E.50685
G1 X124.359 Y113.936 E.01197
G1 X124.359 Y130.167 E.50685
G1 X124.742 Y130.167 E.01197
G1 X124.742 Y113.936 E.50685
G1 X125.126 Y113.936 E.01197
G1 X125.126 Y130.167 E.50685
G1 X125.509 Y130.167 E.01197
G1 X125.509 Y113.936 E.50685
G1 X125.892 Y113.936 E.01197
G1 X125.892 Y130.167 E.50685
G1 X126.275 Y130.167 E.01197
G1 X126.275 Y126.933 E.10101
G1 X126.659 Y126.933 E.01197
G1 X126.659 Y130.167 E.10101
G1 X127.042 Y130.167 E.01197
G1 X127.042 Y126.933 E.10101
G1 X127.263 Y126.933 E.0069
G1 X127.425 Y126.508 E.01421
G1 X127.425 Y130.167 E.11428
G1 X127.614 Y130.16 E.00592
G1 X127.808 Y130.118 E.0062
G1 X127.808 Y126.057 E.1268
G1 X127.939 Y125.983 E.0047
G1 X128.191 Y125.882 E.00848
G1 X128.191 Y129.943 E.12681
G1 X128.401 Y129.768 E.00852
G1 X128.575 Y129.493 E.01016
G1 X128.575 Y125.833 E.11431
G1 X128.958 Y125.833 E.01197
G1 X128.958 Y129.067 E.10101
G1 X129.341 Y129.067 E.01197
G1 X129.341 Y125.833 E.10101
G1 X129.724 Y125.833 E.01197
G1 X129.724 Y129.237 E.10631
M106 S198.9
M204 S10000
G1 X129.875 Y130.052 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42687
G1 F9376.22
M204 S6000
G1 X129.268 Y129.444 E.02686
G1 X129.003 Y129.444 E.0083
G1 X128.922 Y129.641 E.00665
G1 X129.706 Y130.425 E.03468
G1 X129.706 Y130.968 E.01699
G1 X128.716 Y129.978 E.04379
G1 X128.598 Y130.106 E.00544
G1 X128.431 Y130.237 E.00663
G1 X129.706 Y131.511 E.05639
G1 X129.706 Y132.054 E.01699
G1 X128.072 Y130.421 E.07226
G1 X127.87 Y130.493 E.00673
G1 X127.644 Y130.536 E.00717
G1 X129.706 Y132.597 E.0912
G1 X129.706 Y133.14 E.01699
G1 X127.11 Y130.544 E.11484
G1 X126.567 Y130.544 E.01699
G1 X129.706 Y133.683 E.13886
G1 X129.706 Y134.226 E.01699
G1 X126.024 Y130.544 E.16289
G1 X125.481 Y130.544 E.01699
G1 X129.706 Y134.769 E.18691
G1 X129.706 Y135.312 E.01699
G1 X124.938 Y130.544 E.21094
G1 X124.395 Y130.544 E.01699
G1 X129.706 Y135.855 E.23496
G1 X129.706 Y136.398 E.01699
G1 X123.852 Y130.544 E.25899
G1 X123.309 Y130.544 E.01699
G1 X129.706 Y136.941 E.28301
G1 X129.706 Y137.484 E.01699
G1 X122.766 Y130.544 E.30704
G1 X122.44 Y130.544 E.01022
G1 X122.44 Y130.761 E.00677
G1 X129.706 Y138.027 E.32149
G1 X129.706 Y138.57 E.01699
G1 X122.439 Y131.304 E.3215
G1 X122.439 Y131.846 E.01698
G1 X129.706 Y139.113 E.32151
G1 X129.706 Y139.556 E.01386
G1 X129.605 Y139.556 E.00313
G1 X122.439 Y132.389 E.31709
G1 X122.439 Y132.932 E.01698
G1 X129.062 Y139.556 E.29307
G1 X128.519 Y139.556 E.01699
G1 X122.439 Y133.475 E.26906
G1 X122.438 Y134.018 E.01698
G1 X128.052 Y139.631 E.24837
G1 X127.674 Y139.796 E.0129
G1 X122.438 Y134.56 E.23166
G1 X122.438 Y135.103 E.01698
G1 X127.365 Y140.03 E.218
G1 X127.245 Y140.172 E.00582
G1 X127.135 Y140.343 E.00636
G1 X122.438 Y135.646 E.20784
G1 X122.438 Y136.189 E.01698
G1 X126.974 Y140.725 E.20071
G1 X126.917 Y140.985 E.00834
G1 X126.906 Y141.2 E.00672
G1 X122.437 Y136.731 E.1977
G1 X122.437 Y137.274 E.01698
G1 X126.906 Y141.743 E.19771
G2 X126.911 Y142.058 I2.249 J.122 E.00988
G1 X126.678 Y142.058 E.00729
G1 X122.437 Y137.817 E.18764
G1 X122.437 Y138.36 E.01698
G1 X126.134 Y142.057 E.1636
G1 X125.591 Y142.057 E.017
G1 X122.437 Y138.903 E.13956
G1 X122.436 Y139.445 E.01698
G1 X125.047 Y142.056 E.11553
G1 X124.504 Y142.056 E.017
G1 X122.436 Y139.988 E.09149
G1 X122.436 Y140.531 E.01698
G1 X123.96 Y142.055 E.06745
G1 X123.417 Y142.055 E.017
G1 X122.436 Y141.074 E.04342
G1 X122.436 Y141.616 E.01698
G1 X123.043 Y142.224 E.02689
M204 S10000
G1 X127.425 Y140.278 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.42614
M106 S255
G1 F3000
M204 S6000
G1 X127.425 Y142.058 E.0556
G1 X127.808 Y142.059 E.01197
G1 X127.808 Y140.157 E.05938
G1 X127.939 Y140.083 E.0047
G1 X128.191 Y139.982 E.00848
G1 X128.191 Y142.059 E.06484
G1 X128.575 Y142.059 E.01197
G1 X128.575 Y139.933 E.06641
G1 X128.958 Y139.933 E.01197
G1 X128.958 Y142.06 E.06642
G1 X129.341 Y142.06 E.01197
M73 P93 R1
G1 X129.341 Y139.933 E.06643
G1 X129.724 Y139.933 E.01197
G1 X129.724 Y142.06 E.06644
G1 X130.108 Y142.061 E.01197
G1 X130.108 Y125.833 E.50676
G1 X130.491 Y125.833 E.01197
G1 X130.491 Y142.061 E.50677
G1 X130.874 Y142.061 E.01197
G1 X130.874 Y125.833 E.50678
G1 X131.257 Y125.833 E.01197
G1 X131.257 Y142.062 E.50679
G1 X131.64 Y142.062 E.01197
G1 X131.64 Y125.833 E.5068
G1 X132.024 Y125.833 E.01197
G1 X132.024 Y142.062 E.50681
G1 X132.407 Y142.063 E.01197
G1 X132.407 Y125.833 E.50682
G1 X132.79 Y125.833 E.01197
G1 X132.79 Y142.063 E.50683
G1 X133.173 Y142.063 E.01197
G1 X133.173 Y125.833 E.50684
G1 X133.556 Y125.833 E.01197
G1 X133.556 Y142.233 E.51215
M106 S198.9
; WIPE_START
G1 X133.556 Y140.233 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.2 I1.193 J-.242 P1  F42000
G1 X128.575 Y115.723 Z8.2
G1 Z7.8
G1 E.8 F1800
M106 S255
G1 F3000
M204 S6000
G1 X128.575 Y113.937 E.05577
G1 X128.191 Y113.937 E.01197
G1 X128.191 Y115.843 E.05954
G1 X128.061 Y115.917 E.00468
G1 X127.808 Y116.018 E.00849
G1 X127.808 Y113.937 E.06499
G1 X127.425 Y113.937 E.01197
G1 X127.425 Y116.067 E.06654
G1 X127.042 Y116.067 E.01197
G1 X127.042 Y113.937 E.06654
G1 X126.659 Y113.937 E.01197
G1 X126.659 Y116.067 E.06654
G1 X126.275 Y116.067 E.01197
G1 X126.275 Y113.767 E.07184
M106 S198.9
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
G1 X126.275 Y115.767 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/42
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
M106 S201.45
; OBJECT_ID: 394
M204 S10000
G17
G3 Z8.2 I.316 J1.175 P1  F42000
G1 X133.882 Y113.724 Z8.2
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X133.897 Y113.798 I-.156 J.07 E.00251
G1 X133.893 Y142.238 E.94342
G3 X133.702 Y142.397 I-.202 J-.049 E.00883
G1 X122.261 Y142.393 E.37952
G3 X122.102 Y142.177 I.045 J-.2 E.0097
G1 X122.107 Y113.762 E.9426
G3 X122.298 Y113.603 I.203 J.05 E.00882
G1 X133.719 Y113.604 E.37887
G1 X133.81 Y113.636 E.00318
G1 X133.844 Y113.678 E.0018
M204 S250
G1 X134.242 Y113.569 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X134.243 Y113.575 E.00017
G3 X134.289 Y113.774 I-.551 J.233 E.00631
G1 X134.29 Y142.195 E.8733
G3 X133.726 Y142.789 I-.608 J-.013 E.0276
G1 X122.305 Y142.79 E.35095
G3 X121.71 Y142.192 I.012 J-.607 E.02866
G1 X121.71 Y113.805 E.87225
G3 X122.274 Y113.211 I.602 J.007 E.02767
G1 X133.758 Y113.213 E.35288
G3 X134.115 Y113.385 I-.066 J.595 E.01241
G1 X134.208 Y113.52 E.00503
; WIPE_START
M204 S6000
G1 X134.243 Y113.575 E-.02481
G1 X134.289 Y113.774 E-.07764
G1 X134.289 Y115.504 E-.65755
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


G1 X122.276 Y114.54 F42000
G1 Z8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42503
G1 F9421.37
M204 S6000
G1 X122.88 Y113.936 E.0266
G1 X123.421 Y113.936 E.01682
G1 X122.446 Y114.911 E.04293
G1 X122.445 Y115.452 E.01683
G1 X123.961 Y113.936 E.06674
G1 X124.501 Y113.936 E.01682
G1 X122.445 Y115.993 E.09054
G1 X122.445 Y116.533 E.01683
G1 X125.042 Y113.936 E.11434
G1 X125.582 Y113.936 E.01682
G1 X122.445 Y117.074 E.13815
G1 X122.445 Y117.614 E.01683
G1 X126.122 Y113.937 E.16195
G1 X126.663 Y113.937 E.01682
G1 X122.444 Y118.155 E.18575
G1 X122.444 Y118.695 E.01683
G1 X127.203 Y113.937 E.20956
G1 X127.743 Y113.937 E.01682
G1 X122.444 Y119.236 E.23336
G1 X122.444 Y119.777 E.01683
G1 X128.284 Y113.937 E.25716
G1 X128.824 Y113.937 E.01682
G1 X122.444 Y120.317 E.28096
G1 X122.443 Y120.858 E.01683
G1 X129.365 Y113.937 E.30477
M73 P93 R0
G1 X129.905 Y113.937 E.01683
G1 X122.443 Y121.398 E.32857
G1 X122.443 Y121.939 E.01683
G1 X130.445 Y113.937 E.35237
G1 X130.986 Y113.937 E.01682
G1 X122.443 Y122.48 E.37618
G1 X122.443 Y123.02 E.01683
G1 X131.526 Y113.937 E.39998
G1 X132.066 Y113.937 E.01682
G1 X122.442 Y123.561 E.42378
G1 X122.442 Y124.101 E.01683
G1 X132.607 Y113.937 E.44759
G1 X133.147 Y113.937 E.01682
G1 X122.442 Y124.642 E.47139
G1 X122.442 Y125.183 E.01683
G1 X133.564 Y114.061 E.48975
G1 X133.563 Y114.601 E.01683
G1 X122.442 Y125.723 E.48975
G1 X122.441 Y126.264 E.01683
G1 X133.563 Y115.142 E.48975
G1 X133.563 Y115.682 E.01683
G1 X122.441 Y126.804 E.48975
G1 X122.441 Y127.345 E.01683
G1 X133.563 Y116.223 E.48975
G1 X133.563 Y116.764 E.01683
G1 X122.441 Y127.886 E.48975
G1 X122.441 Y128.426 E.01683
G1 X133.563 Y117.304 E.48975
G1 X133.562 Y117.845 E.01683
G1 X122.44 Y128.967 E.48975
G1 X122.44 Y129.507 E.01683
G1 X133.562 Y118.385 E.48975
G1 X133.562 Y118.926 E.01683
G1 X122.44 Y130.048 E.48975
G1 X122.44 Y130.588 E.01683
G1 X133.562 Y119.466 E.48975
G1 X133.562 Y120.007 E.01683
G1 X122.44 Y131.129 E.48975
G1 X122.439 Y131.67 E.01683
G1 X133.561 Y120.548 E.48975
G1 X133.561 Y121.088 E.01683
G1 X122.439 Y132.21 E.48976
G1 X122.439 Y132.751 E.01683
G1 X133.561 Y121.629 E.48976
G1 X133.561 Y122.169 E.01683
G1 X122.439 Y133.291 E.48976
G1 X122.438 Y133.832 E.01683
G1 X133.561 Y122.71 E.48976
G1 X133.56 Y123.25 E.01683
G1 X122.438 Y134.373 E.48976
G1 X122.438 Y134.913 E.01683
G1 X133.56 Y123.791 E.48976
G1 X133.56 Y124.332 E.01683
G1 X122.438 Y135.454 E.48976
G1 X122.438 Y135.994 E.01683
G1 X133.56 Y124.872 E.48976
G1 X133.56 Y125.413 E.01683
G1 X122.437 Y136.535 E.48976
G1 X122.437 Y137.076 E.01683
G1 X133.559 Y125.953 E.48976
M73 P94 R0
G1 X133.559 Y126.494 E.01683
G1 X122.437 Y137.616 E.48976
G1 X122.437 Y138.157 E.01683
G1 X133.559 Y127.034 E.48976
G1 X133.559 Y127.575 E.01683
G1 X122.437 Y138.697 E.48976
G1 X122.436 Y139.238 E.01683
G1 X133.559 Y128.116 E.48977
G1 X133.559 Y128.656 E.01683
G1 X122.436 Y139.779 E.48977
G1 X122.436 Y140.319 E.01683
G1 X133.558 Y129.197 E.48977
G1 X133.558 Y129.737 E.01683
G1 X122.436 Y140.86 E.48977
G1 X122.436 Y141.4 E.01683
G1 X133.558 Y130.278 E.48977
G1 X133.558 Y130.818 E.01683
G1 X122.435 Y141.941 E.48977
G1 X122.435 Y142.054 E.00352
G1 X122.862 Y142.054 E.01329
G1 X133.558 Y131.359 E.47096
G1 X133.557 Y131.9 E.01683
G1 X123.402 Y142.055 E.44718
G1 X123.942 Y142.055 E.01681
G1 X133.557 Y132.44 E.4234
G1 X133.557 Y132.981 E.01683
G1 X124.482 Y142.056 E.39961
G1 X125.022 Y142.056 E.01681
G1 X133.557 Y133.521 E.37583
G1 X133.557 Y134.062 E.01683
G1 X125.562 Y142.057 E.35205
G1 X126.102 Y142.057 E.01681
G1 X133.556 Y134.602 E.32826
G1 X133.556 Y135.143 E.01683
G1 X126.642 Y142.058 E.30448
G1 X127.182 Y142.058 E.01681
G1 X133.556 Y135.684 E.2807
G1 X133.556 Y136.224 E.01683
G1 X127.722 Y142.059 E.25691
G1 X128.261 Y142.059 E.01681
G1 X133.556 Y136.765 E.23313
G1 X133.556 Y137.305 E.01683
G1 X128.801 Y142.059 E.20935
G1 X129.341 Y142.06 E.01681
G1 X133.555 Y137.846 E.18556
G1 X133.555 Y138.387 E.01683
G1 X129.881 Y142.06 E.16178
G1 X130.421 Y142.061 E.01681
G1 X133.555 Y138.927 E.138
G1 X133.555 Y139.468 E.01683
G1 X130.961 Y142.061 E.11421
G1 X131.501 Y142.062 E.01681
G1 X133.555 Y140.008 E.09043
G1 X133.554 Y140.549 E.01683
G1 X132.041 Y142.062 E.06665
G1 X132.581 Y142.063 E.01681
G1 X133.554 Y141.089 E.04286
G1 X133.554 Y141.63 E.01683
G1 X132.951 Y142.233 E.02654
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9421.37
G1 X133.554 Y141.63 E-.32395
G1 X133.554 Y141.089 E-.20542
G1 X133.125 Y141.519 E-.23063
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/42
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z8.4 I1.217 J.032 P1  F42000
G1 X133.855 Y113.7 Z8.4
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X133.884 Y113.791 I-.157 J.101 E.0032
G1 X133.881 Y142.236 E.94357
G3 X133.702 Y142.384 I-.19 J-.048 E.00826
G1 X122.264 Y142.381 E.3794
G3 X122.115 Y142.178 I.043 J-.188 E.00912
G1 X122.119 Y113.764 E.94253
G3 X122.298 Y113.616 I.19 J.048 E.00826
G1 X133.718 Y113.616 E.37879
G1 X133.802 Y113.647 E.00298
G3 X133.814 Y113.655 I-.104 J.155 E.0005
M204 S250
G1 X134.225 Y113.569 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X134.276 Y113.772 E.00644
G1 X134.277 Y142.195 E.87336
G3 X133.726 Y142.776 I-.589 J-.007 E.02708
G1 X122.305 Y142.777 E.35091
G3 X121.723 Y142.192 I.012 J-.594 E.02805
G1 X121.723 Y113.805 E.87224
G3 X122.274 Y113.224 I.589 J.006 E.02708
G1 X133.756 Y113.226 E.35281
G3 X134.197 Y113.516 I-.07 J.588 E.01681
; WIPE_START
M204 S6000
G1 X134.276 Y113.772 E-.10184
G1 X134.276 Y115.504 E-.65816
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


G1 X133.72 Y114.552 F42000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42465
G1 F9430.749
M204 S6000
G1 X133.118 Y113.95 E.02649
G1 X132.578 Y113.95 E.01679
G1 X133.551 Y114.922 E.04277
G1 X133.55 Y115.462 E.01679
G1 X132.038 Y113.95 E.06651
G1 X131.499 Y113.95 E.01679
G1 X133.55 Y116.001 E.09026
G1 X133.55 Y116.541 E.01679
G1 X130.959 Y113.949 E.114
G1 X130.419 Y113.949 E.01679
G1 X133.55 Y117.081 E.13774
G1 X133.55 Y117.62 E.01679
G1 X129.879 Y113.949 E.16148
G1 X129.339 Y113.949 E.01679
G1 X133.55 Y118.16 E.18522
G1 X133.549 Y118.7 E.01679
G1 X128.799 Y113.949 E.20897
G1 X128.259 Y113.949 E.01679
G1 X133.549 Y119.239 E.23271
G1 X133.549 Y119.779 E.01679
G1 X127.719 Y113.949 E.25645
G1 X127.18 Y113.949 E.01679
G1 X133.549 Y120.319 E.28019
G1 X133.549 Y120.858 E.01679
G1 X126.64 Y113.949 E.30393
G1 X126.1 Y113.949 E.01679
G1 X133.549 Y121.398 E.32768
G1 X133.548 Y121.938 E.01679
G1 X125.56 Y113.949 E.35142
M73 P95 R0
G1 X125.02 Y113.949 E.01679
G1 X133.548 Y122.477 E.37516
G1 X133.548 Y123.017 E.01679
G1 X124.48 Y113.949 E.3989
G1 X123.94 Y113.949 E.01679
G1 X133.548 Y123.557 E.42264
G1 X133.548 Y124.096 E.01679
G1 X123.4 Y113.949 E.44639
G1 X122.861 Y113.949 E.01679
G1 X133.547 Y124.636 E.47013
G1 X133.547 Y125.176 E.01679
G1 X122.458 Y114.086 E.48782
G1 X122.458 Y114.626 E.01679
G1 X133.547 Y125.715 E.48782
G1 X133.547 Y126.255 E.01679
G1 X122.458 Y115.166 E.48782
G1 X122.458 Y115.705 E.01679
G1 X133.547 Y126.795 E.48782
G1 X133.547 Y127.334 E.01679
G1 X122.457 Y116.245 E.48782
G1 X122.457 Y116.785 E.01679
G1 X133.546 Y127.874 E.48783
G1 X133.546 Y128.414 E.01679
G1 X122.457 Y117.324 E.48783
G1 X122.457 Y117.864 E.01679
G1 X133.546 Y128.953 E.48783
G1 X133.546 Y129.493 E.01679
G1 X122.457 Y118.404 E.48783
G1 X122.456 Y118.943 E.01679
G1 X133.546 Y130.033 E.48783
G1 X133.546 Y130.572 E.01679
G1 X122.456 Y119.483 E.48783
G1 X122.456 Y120.023 E.01679
G1 X133.545 Y131.112 E.48783
G1 X133.545 Y131.652 E.01679
G1 X122.456 Y120.562 E.48783
G1 X122.456 Y121.102 E.01679
G1 X133.545 Y132.191 E.48783
G1 X133.545 Y132.731 E.01679
G1 X122.455 Y121.642 E.48783
G1 X122.455 Y122.181 E.01679
G1 X133.545 Y133.271 E.48783
G1 X133.544 Y133.81 E.01679
G1 X122.455 Y122.721 E.48783
G1 X122.455 Y123.261 E.01679
G1 X133.544 Y134.35 E.48784
G1 X133.544 Y134.89 E.01679
G1 X122.455 Y123.8 E.48784
G1 X122.454 Y124.34 E.01679
G1 X133.544 Y135.429 E.48784
G1 X133.544 Y135.969 E.01679
G1 X122.454 Y124.88 E.48784
G1 X122.454 Y125.419 E.01679
G1 X133.544 Y136.509 E.48784
G1 X133.543 Y137.048 E.01679
G1 X122.454 Y125.959 E.48784
G1 X122.454 Y126.499 E.01679
G1 X133.543 Y137.588 E.48784
G1 X133.543 Y138.128 E.01679
G1 X122.453 Y127.038 E.48784
G1 X122.453 Y127.578 E.01679
G1 X133.543 Y138.668 E.48784
G1 X133.543 Y139.207 E.01679
G1 X122.453 Y128.118 E.48784
G1 X122.453 Y128.657 E.01679
G1 X133.543 Y139.747 E.48784
G1 X133.542 Y140.287 E.01679
G1 X122.453 Y129.197 E.48784
G1 X122.453 Y129.736 E.01679
G1 X133.542 Y140.826 E.48784
G1 X133.542 Y141.366 E.01679
G1 X122.452 Y130.276 E.48785
G1 X122.452 Y130.816 E.01679
G1 X133.542 Y141.906 E.48785
G1 X133.542 Y142.051 E.00452
G1 X133.147 Y142.051 E.01228
G1 X122.452 Y131.355 E.47048
G1 X122.452 Y131.895 E.01679
G1 X132.607 Y142.05 E.44672
G1 X132.066 Y142.05 E.01681
G1 X122.452 Y132.435 E.42297
G1 X122.451 Y132.974 E.01679
G1 X131.526 Y142.049 E.39921
G1 X130.986 Y142.049 E.01681
G1 X122.451 Y133.514 E.37545
G1 X122.451 Y134.054 E.01679
G1 X130.446 Y142.048 E.35169
G1 X129.905 Y142.048 E.01681
G1 X122.451 Y134.593 E.32793
G1 X122.451 Y135.133 E.01679
G1 X129.365 Y142.047 E.30417
G1 X128.825 Y142.047 E.01681
G1 X122.45 Y135.673 E.28041
G1 X122.45 Y136.212 E.01679
G1 X128.284 Y142.047 E.25665
G1 X127.744 Y142.046 E.01681
G1 X122.45 Y136.752 E.23289
G1 X122.45 Y137.292 E.01679
G1 X127.204 Y142.046 E.20914
G1 X126.664 Y142.045 E.01681
G1 X122.45 Y137.831 E.18538
G1 X122.449 Y138.371 E.01679
G1 X126.123 Y142.045 E.16162
G1 X125.583 Y142.044 E.01681
G1 X122.449 Y138.911 E.13786
G1 X122.449 Y139.45 E.01679
G1 X125.043 Y142.044 E.1141
G1 X124.502 Y142.044 E.01681
G1 X122.449 Y139.99 E.09034
G1 X122.449 Y140.53 E.01679
G1 X123.962 Y142.043 E.06658
G1 X123.422 Y142.043 E.01681
G1 X122.448 Y141.069 E.04282
G1 X122.448 Y141.609 E.01679
G1 X123.051 Y142.212 E.02654
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9430.749
G1 X122.448 Y141.609 E-.32416
G1 X122.448 Y141.069 E-.20507
G1 X122.878 Y141.499 E-.23077
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 42/42
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z8.6 I1.128 J.456 P1  F42000
G1 X134.132 Y113.663 Z8.6
G1 Z8.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X134.134 Y113.668 E.00018
G3 X134.154 Y113.805 I-.436 J.134 E.00427
G1 X134.154 Y142.195 E.87232
G3 X133.72 Y142.654 I-.469 J-.009 E.02132
G1 X122.305 Y142.654 E.35074
G3 X121.846 Y142.192 I.009 J-.468 E.02216
G1 X121.846 Y113.805 E.87224
G3 X122.28 Y113.346 I.469 J.009 E.02132
G1 X133.744 Y113.348 E.35225
G3 X134.051 Y113.512 I-.046 J.454 E.01097
G1 X134.103 Y113.61 E.00342
; WIPE_START
M204 S6000
G1 X134.134 Y113.668 E-.025
G1 X134.154 Y113.805 E-.05265
G1 X134.154 Y115.601 E-.68235
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


G1 X133.551 Y142.446 F42000
G1 Z8.4
G1 E.8 F1800
; FEATURE: Top surface
M73 P96 R0
G1 F9547.055
M204 S2000
G1 X133.947 Y142.05 E.01722
G1 X133.947 Y141.517
G1 X133.018 Y142.446 E.04039
G1 X132.484 Y142.446
G1 X133.947 Y140.984 E.06357
G1 X133.947 Y140.45
G1 X131.951 Y142.446 E.08674
G1 X131.418 Y142.446
G1 X133.947 Y139.917 E.10992
G1 X133.947 Y139.384
G1 X130.884 Y142.446 E.13309
G1 X130.351 Y142.446
G1 X133.947 Y138.85 E.15626
G1 X133.947 Y138.317
G1 X129.818 Y142.447 E.17944
G1 X129.284 Y142.447
G1 X133.947 Y137.784 E.20261
G1 X133.947 Y137.251
G1 X128.751 Y142.447 E.22579
G1 X128.218 Y142.447
G1 X133.947 Y136.717 E.24896
G1 X133.947 Y136.184
G1 X127.685 Y142.447 E.27214
G1 X127.151 Y142.447
G1 X133.947 Y135.651 E.29531
G1 X133.947 Y135.118
G1 X126.618 Y142.447 E.31848
G1 X126.085 Y142.447
G1 X133.947 Y134.584 E.34166
G1 X133.947 Y134.051
G1 X125.551 Y142.447 E.36483
G1 X125.018 Y142.447
G1 X133.947 Y133.518 E.38801
G1 X133.947 Y132.985
G1 X124.485 Y142.447 E.41118
G1 X123.952 Y142.447
G1 X133.947 Y132.451 E.43436
G1 X133.947 Y131.918
G1 X123.418 Y142.447 E.45753
G1 X122.885 Y142.447
G1 X133.947 Y131.385 E.4807
G1 X133.947 Y130.852
G1 X122.352 Y142.447 E.50388
G1 X122.057 Y142.208
G1 X133.947 Y130.318 E.51666
G1 X133.947 Y129.785
G1 X122.053 Y141.679 E.51686
G1 X122.053 Y141.146
G1 X133.947 Y129.252 E.51686
G1 X133.947 Y128.719
G1 X122.053 Y140.613 E.51686
G1 X122.053 Y140.079
G1 X133.947 Y128.185 E.51686
G1 X133.947 Y127.652
G1 X122.053 Y139.546 E.51686
G1 X122.053 Y139.013
G1 X133.947 Y127.119 E.51686
G1 X133.947 Y126.586
G1 X122.053 Y138.48 E.51686
G1 X122.053 Y137.946
G1 X133.947 Y126.052 E.51686
G1 X133.947 Y125.519
G1 X122.053 Y137.413 E.51686
G1 X122.053 Y136.88
G1 X133.947 Y124.986 E.51686
G1 X133.947 Y124.453
G1 X122.053 Y136.347 E.51686
G1 X122.053 Y135.813
G1 X133.947 Y123.919 E.51686
G1 X133.947 Y123.386
G1 X122.053 Y135.28 E.51686
G1 X122.053 Y134.747
G1 X133.947 Y122.853 E.51686
G1 X133.947 Y122.32
G1 X122.053 Y134.214 E.51686
G1 X122.053 Y133.68
G1 X133.947 Y121.786 E.51686
G1 X133.947 Y121.253
G1 X122.053 Y133.147 E.51686
G1 X122.053 Y132.614
G1 X133.947 Y120.72 E.51686
G1 X133.947 Y120.186
G1 X122.053 Y132.081 E.51686
G1 X122.053 Y131.547
G1 X133.947 Y119.653 E.51686
G1 X133.947 Y119.12
G1 X122.053 Y131.014 E.51686
G1 X122.053 Y130.481
G1 X133.947 Y118.587 E.51686
G1 X133.947 Y118.053
G1 X122.053 Y129.948 E.51686
G1 X122.053 Y129.414
G1 X133.947 Y117.52 E.51686
G1 X133.947 Y116.987
G1 X122.053 Y128.881 E.51686
G1 X122.053 Y128.348
G1 X133.947 Y116.454 E.51686
G1 X133.947 Y115.92
G1 X122.053 Y127.815 E.51686
G1 X122.053 Y127.281
G1 X133.947 Y115.387 E.51686
G1 X133.947 Y114.854
G1 X122.053 Y126.748 E.51686
G1 X122.053 Y126.215
G1 X133.947 Y114.321 E.51686
G1 X133.943 Y113.792
G1 X122.053 Y125.682 E.51668
G1 X122.053 Y125.148
G1 X133.646 Y113.555 E.50377
G1 X133.113 Y113.555
G1 X122.053 Y124.615 E.4806
G1 X122.053 Y124.082
G1 X132.58 Y113.555 E.45743
G1 X132.046 Y113.555
G1 X122.053 Y123.548 E.43426
G1 X122.053 Y123.015
G1 X131.513 Y113.555 E.41109
G1 X130.98 Y113.555
G1 X122.053 Y122.482 E.38792
G1 X122.053 Y121.949
G1 X130.447 Y113.555 E.36475
G1 X129.914 Y113.555
G1 X122.053 Y121.415 E.34158
G1 X122.053 Y120.882
G1 X129.38 Y113.555 E.31841
G1 X128.847 Y113.555
G1 X122.053 Y120.349 E.29524
G1 X122.053 Y119.816
G1 X128.314 Y113.555 E.27208
G1 X127.781 Y113.554
G1 X122.053 Y119.282 E.24891
G1 X122.053 Y118.749
G1 X127.248 Y113.554 E.22574
G1 X126.714 Y113.554
G1 X122.053 Y118.216 E.20257
G1 X122.053 Y117.683
G1 X126.181 Y113.554 E.1794
G1 X125.648 Y113.554
G1 X122.053 Y117.149 E.15623
G1 X122.053 Y116.616
G1 X125.115 Y113.554 E.13306
M73 P97 R0
G1 X124.582 Y113.554
G1 X122.053 Y116.083 E.10989
G1 X122.053 Y115.55
G1 X124.049 Y113.554 E.08672
G1 X123.515 Y113.554
G1 X122.053 Y115.016 E.06355
G1 X122.053 Y114.483
G1 X122.982 Y113.554 E.04038
G1 X122.449 Y113.554
G1 X122.053 Y113.95 E.01721
; WIPE_START
M204 S6000
G1 X122.449 Y113.554 E-.21285
G1 X122.982 Y113.554 E-.20261
G1 X122.341 Y114.195 E-.34454
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.953 Y113.632 Z8.8 F42000
G1 X130.69 Y113.578 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.126795
G1 F15000
M204 S6000
G1 X130.47 Y113.578 E.00151
; WIPE_START
G1 X130.69 Y113.578 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.943 Y113.77 Z8.8 F42000
G1 Z8.4
G1 E.8 F1800
; LINE_WIDTH: 0.113968
G1 F15000
M204 S6000
G2 X133.801 Y113.612 I-.415 J.23 E.00124
; LINE_WIDTH: 0.1412
G1 X133.78 Y113.613 E.00017
G1 X133.776 Y113.685 E.00058
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F15000
G1 X133.78 Y113.613 E-.59143
G1 X133.801 Y113.612 E-.16857
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.8 I1.217 J0 P1  F42000
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

