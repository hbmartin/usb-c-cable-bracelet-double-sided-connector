; HEADER_BLOCK_START
; BambuStudio 02.08.02.61
; model printing time: 12m 51s; total estimated time: 19m 8s
; total layer number: 72
; total filament length [mm] : 837.57
; total filament volume [cm^3] : 2014.60
; total filament weight [g] : 2.50
; filament_density: 1.24
; filament_diameter: 1.75
; max_z_height: 14.40
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
M73 P0 R18
G1 E5 F200
M104 S220
G92 E0
M73 P3 R18
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
M73 P6 R17
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
M73 P8 R17
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
M73 P31 R13
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
M73 P32 R13
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
    G29 A1 X123.415 Y115 I9.16972 J26
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
M73 P32 R12
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
; layer num/total_layer_count: 1/72
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
; OBJECT_ID: 394
G1 X124.689 Y117.075 F42000
M204 S6000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X129.739 Y117.075 E.18809
G1 X129.739 Y127.325 E.38177
G1 X124.689 Y127.325 E.18809
G1 X124.689 Y117.135 E.37954
; WIPE_START
G1 X126.689 Y117.111 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X130.098 Y116.618 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X124.333 Y116.618 E.21472
G1 X124.333 Y116.195 E.01576
G1 X130.098 Y116.195 E.21472
G1 X130.098 Y116.558 E.01351
; WIPE_START
G1 X128.098 Y116.579 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X128.614 Y124.194 Z.6 F42000
G1 X129.641 Y139.348 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X124.79 Y139.348 E.18067
G1 X124.79 Y128.239 E.41377
G1 X129.641 Y128.239 E.18067
G1 X129.641 Y139.288 E.41152
M204 S6000
G1 X130.098 Y139.805 F42000
G1 F3000
M204 S500
G1 X124.333 Y139.805 E.21472
G1 X124.333 Y127.782 E.44782
G1 X130.098 Y127.782 E.21472
G1 X130.098 Y139.745 E.44557
M204 S6000
G1 X130.545 Y140.262 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X123.886 Y140.262 E.24803
G3 X123.876 Y140.187 I.328 J-.081 E.00285
G1 X123.876 Y115.812 E.90786
G3 X123.885 Y115.738 I.289 J0 E.0028
G1 X124.301 Y115.738 E.01549
G1 X130.545 Y115.738 E.23255
G3 X130.555 Y115.814 I-.305 J.079 E.00285
G1 X130.555 Y140.186 E.90778
G3 X130.554 Y140.203 I-.316 J-.004 E.00061
; WIPE_START
G1 X128.554 Y140.22 E-.76
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
M73 P33 R12
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
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


G1 X129.458 Y129.375 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.51391
G1 F3947
M204 S500
G1 X128.71 Y128.628 E.04059
G1 X128.044 Y128.628 E.02556
G1 X129.252 Y129.836 E.06558
G1 X129.252 Y130.502 E.02556
G1 X127.378 Y128.628 E.10173
G1 X126.712 Y128.628 E.02556
G1 X129.252 Y131.168 E.13788
G1 X129.252 Y131.834 E.02556
G1 X126.046 Y128.628 E.17404
G1 X125.38 Y128.628 E.02556
G1 X129.252 Y132.5 E.21019
G1 X129.252 Y133.166 E.02556
G1 X125.178 Y129.092 E.22111
G1 X125.178 Y129.759 E.02556
G1 X129.252 Y133.832 E.22111
G1 X129.252 Y134.498 E.02556
G1 X125.178 Y130.425 E.22111
G1 X125.178 Y131.091 E.02556
G1 X129.252 Y135.164 E.22111
G1 X129.252 Y135.831 E.02556
G1 X125.178 Y131.757 E.22111
G1 X125.178 Y132.423 E.02556
G1 X129.252 Y136.497 E.22111
G1 X129.252 Y137.163 E.02556
G1 X125.178 Y133.089 E.22111
G1 X125.178 Y133.755 E.02556
G1 X129.252 Y137.829 E.22111
G1 X129.252 Y138.495 E.02556
G1 X125.178 Y134.421 E.22111
G1 X125.178 Y135.087 E.02556
G1 X129.051 Y138.959 E.21017
G1 X128.384 Y138.959 E.02556
G1 X125.178 Y135.753 E.17402
G1 X125.178 Y136.419 E.02556
G1 X127.718 Y138.959 E.13787
G1 X127.052 Y138.959 E.02556
G1 X125.178 Y137.085 E.10172
G1 X125.178 Y137.752 E.02556
G1 X126.386 Y138.96 E.06557
G1 X125.72 Y138.96 E.02556
G1 X124.973 Y138.212 E.04058
; WIPE_START
G1 F6300
G1 X125.72 Y138.96 E-.40179
G1 X126.386 Y138.96 E-.2531
G1 X126.191 Y138.764 E-.10512
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X124.91 Y131.24 Z.6 F42000
G1 X124.282 Y127.553 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.39884
G1 F3000
M204 S500
G1 X124.282 Y116.847 E.31053
; WIPE_START
G1 X124.282 Y118.847 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X130.147 Y116.847 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.40194
G1 F3000
M204 S500
G1 X130.147 Y127.553 E.31324
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
G1 X130.147 Y125.553 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/72
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S201.45
; open powerlost recovery
M1003 S1
; OBJECT_ID: 394
M204 S10000
G17
G3 Z.6 I1.039 J-.634 P1  F42000
G1 X124.804 Y116.798 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4176
M204 S6000
G1 X130.016 Y116.798 E.17289
G1 X130.016 Y127.602 E.35839
G1 X124.412 Y127.602 E.1859
G1 X124.412 Y116.798 E.35839
G1 X124.744 Y116.798 E.01102
M204 S250
G1 X124.804 Y117.19 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4176
M204 S5000
G1 X129.624 Y117.19 E.14811
G1 X129.624 Y127.21 E.30789
G1 X124.804 Y127.21 E.14811
G1 X124.804 Y117.25 E.30604
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.804 Y117.225 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.871 Y124.783 Z.8 F42000
G1 X129.993 Y139.815 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4176
M204 S6000
G1 X124.437 Y139.815 E.18432
G1 X124.437 Y128.009 E.39163
G1 X129.993 Y128.009 E.18432
G1 X129.993 Y139.755 E.38964
M204 S10000
G1 X130.401 Y140.222 F42000
G1 F4176
M204 S6000
G1 X124.03 Y140.222 E.21132
G1 X124.03 Y115.778 E.81087
G1 X130.401 Y115.778 E.21132
G1 X130.401 Y140.162 E.80888
M204 S250
M73 P34 R12
G1 X130.788 Y140.308 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X130.783 Y140.367 E.00184
G1 F2880
G1 X130.778 Y140.398 E.00095
G1 F2760
G1 X130.763 Y140.464 E.00209
G1 F2400
G1 X130.744 Y140.512 E.0016
G1 F2280
G1 X130.724 Y140.546 E.00121
G1 F2040
G1 X130.704 Y140.572 E.001
G1 F1920
G1 X130.685 Y140.589 E.00078
M106 S255
G1 F1800
G1 X130.648 Y140.609 E.00129
M106 S201.45
M106 S255
G1 F1680
G1 X130.632 Y140.613 E.00052
G3 X124.424 Y140.614 I-3.279 J-609.322 E.19073
G3 X123.801 Y140.613 I-.3 J-4.064 E.01918
G1 X123.784 Y140.609 E.00054
M106 S201.45
M106 S255
G1 F1800
G1 X123.747 Y140.588 E.00129
M106 S201.45
G1 F1920
G1 X123.726 Y140.57 E.00086
G1 F2040
G1 X123.707 Y140.545 E.00098
G1 F2280
G1 X123.686 Y140.51 E.00124
G1 F2520
G1 X123.667 Y140.459 E.00166
G1 F2760
G1 X123.65 Y140.383 E.00238
G1 F3000
G1 X123.642 Y140.303 E.00249
G1 F4176
G1 X123.64 Y139.903 E.01229
G1 X123.638 Y139.596 E.00943
G1 X123.638 Y116.404 E.71261
G1 X123.64 Y116.097 E.00944
G1 X123.642 Y115.697 E.01229
G1 F3000
G1 X123.65 Y115.619 E.0024
G1 F2760
G1 X123.668 Y115.541 E.00248
G1 F2520
G1 X123.686 Y115.49 E.00165
G1 F2280
G1 X123.707 Y115.455 E.00125
G1 F2040
G1 X123.728 Y115.428 E.00105
G1 F1920
G1 X123.769 Y115.398 E.00159
M106 S255
G1 F1800
G1 X123.784 Y115.391 E.00049
M106 S201.45
M106 S255
G1 F1680
G1 X123.801 Y115.387 E.00052
G3 X130.009 Y115.386 I3.277 J576.13 E.19076
G3 X130.632 Y115.387 I.3 J4.146 E.01917
M106 S201.45
M106 S255
G1 X130.644 Y115.39 E.00038
M106 S201.45
M106 S255
G1 F1800
G1 X130.685 Y115.411 E.00139
M106 S201.45
G1 F1920
G1 X130.704 Y115.428 E.00077
G1 F2040
G1 X130.724 Y115.454 E.00102
G1 F2280
G1 X130.744 Y115.488 E.00121
G1 F2520
G1 X130.763 Y115.537 E.00164
G1 F2640
G1 X130.773 Y115.579 E.0013
G1 F3000
G1 X130.788 Y115.686 E.00334
G1 F4176
G1 X130.79 Y116.086 E.01229
G1 X130.793 Y116.405 E.00978
G1 X130.793 Y139.596 E.7126
G3 X130.791 Y140.248 I-9.24 J.3 E.02004
; WIPE_START
G1 F4800
M204 S6000
G1 X130.783 Y140.367 E-.04548
G1 X130.778 Y140.398 E-.01172
G1 X130.763 Y140.464 E-.0258
G1 X130.744 Y140.512 E-.01979
G1 X130.724 Y140.546 E-.01494
G1 X130.704 Y140.572 E-.01241
G1 X130.685 Y140.589 E-.0097
G1 X130.648 Y140.609 E-.01592
G1 X130.632 Y140.613 E-.00639
G1 X129.058 Y140.613 E-.59787
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


G1 X129.601 Y128.401 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F4176
M204 S6000
G1 X124.829 Y128.401 E.14664
G1 X124.829 Y139.423 E.33867
G1 X129.601 Y139.423 E.14664
G1 X129.601 Y128.461 E.33682
M204 S10000
G1 X129.224 Y128.778 F42000
G1 F4176
M204 S6000
G1 X125.206 Y128.778 E.12346
G1 X125.206 Y139.046 E.31549
G1 X129.224 Y139.046 E.12346
G1 X129.224 Y128.838 E.31365
M204 S10000
G1 X128.847 Y129.155 F42000
G1 F4176
M204 S6000
G1 X125.583 Y129.155 E.10029
G1 X125.583 Y138.669 E.29232
G1 X128.847 Y138.669 E.10029
G1 X128.847 Y129.215 E.29048
M204 S10000
G1 X128.47 Y129.532 F42000
G1 F4176
M204 S6000
G1 X125.96 Y129.532 E.07712
G1 X125.96 Y138.292 E.26915
G1 X128.47 Y138.292 E.07712
G1 X128.47 Y129.592 E.2673
M204 S10000
G1 X128.093 Y129.909 F42000
G1 F4176
M204 S6000
G1 X126.337 Y129.909 E.05395
G1 X126.337 Y137.915 E.24598
G1 X128.093 Y137.915 E.05395
G1 X128.093 Y129.969 E.24413
M204 S10000
G1 X127.716 Y130.287 F42000
G1 F4176
M204 S6000
G1 X126.714 Y130.287 E.03078
G1 X126.714 Y137.538 E.22281
G1 X127.716 Y137.538 E.03078
G1 X127.716 Y130.347 E.22096
M204 S10000
G1 X127.371 Y130.631 F42000
; LINE_WIDTH: 0.35518
G1 F4176
M204 S6000
G1 X127.059 Y130.631 E.00795
G1 X127.059 Y137.193 E.16697
G1 X127.371 Y137.193 E.00795
G1 X127.371 Y130.691 E.16544
; WIPE_START
G1 F11528.854
G1 X127.371 Y132.691 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.667 Y125.17 Z.8 F42000
G1 X130.197 Y116.288 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.656056
G1 F4176
M204 S6000
G1 X124.234 Y116.288 E.29795
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5871.463
G1 X126.234 Y116.288 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/72
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z.8 I-.409 J-1.146 P1  F42000
G1 X124.804 Y116.798 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3982
M204 S6000
G1 X130.016 Y116.798 E.17289
G1 X130.016 Y127.602 E.35839
G1 X124.412 Y127.602 E.1859
G1 X124.412 Y116.798 E.35839
G1 X124.744 Y116.798 E.01102
M204 S250
G1 X124.804 Y117.19 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3982
M204 S5000
G1 X129.624 Y117.19 E.14811
G1 X129.624 Y127.21 E.30789
G1 X124.804 Y127.21 E.14811
G1 X124.804 Y117.25 E.30604
M204 S10000
G1 X124.804 Y116.391 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3982
M204 S6000
G1 X124.425 Y116.391 E.01256
G1 X124.425 Y116.068 E.01072
G1 X130.007 Y116.068 E.18517
G1 X130.007 Y116.391 E.01072
G1 X124.864 Y116.391 E.17062
; WIPE_START
G1 F8843.478
G1 X124.425 Y116.391 E-.16669
G1 X124.425 Y116.068 E-.1228
G1 X125.663 Y116.068 E-.47051
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.03 Y123.577 Z1 F42000
G1 X130.007 Y139.932 Z1
G1 Z.6
G1 E.8 F1800
G1 F3982
M204 S6000
G1 X124.425 Y139.932 E.18518
G1 X124.425 Y128.009 E.39551
G1 X130.007 Y128.009 E.18517
G1 X130.007 Y139.872 E.39353
M204 S10000
G1 X130.415 Y140.34 F42000
G1 F3982
M204 S6000
G1 X124.018 Y140.339 E.21218
G1 X124.018 Y115.661 E.81864
G1 X130.414 Y115.661 E.21217
G1 X130.415 Y140.28 E.81665
M204 S250
G1 X130.804 Y140.465 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3982
M204 S5000
G1 X130.804 Y140.516 E.00157
G1 X130.792 Y140.581 E.00203
G1 X130.789 Y140.592 E.00033
G1 X130.776 Y140.623 E.00104
G1 X130.761 Y140.65 E.00095
G1 X130.743 Y140.672 E.00087
G1 X130.724 Y140.691 E.00083
G1 X130.703 Y140.706 E.00078
G1 X130.638 Y140.73 E.00213
G3 X124.424 Y140.731 I-3.253 J-571.176 E.19095
G3 X123.797 Y140.73 I-.3 J-5.106 E.01929
G1 X123.758 Y140.719 E.00123
G1 X123.713 Y140.693 E.00159
G1 X123.69 Y140.67 E.00102
G1 X123.672 Y140.647 E.00088
G1 X123.657 Y140.62 E.00097
G1 X123.645 Y140.59 E.00099
G1 X123.632 Y140.538 E.00164
G1 X123.628 Y140.511 E.00086
G1 X123.626 Y140.463 E.00148
G1 X123.626 Y115.538 E.76588
G1 X123.628 Y115.489 E.00148
M73 P35 R12
G1 X123.633 Y115.458 E.00097
G1 X123.644 Y115.41 E.00151
G1 X123.657 Y115.38 E.001
G1 X123.672 Y115.352 E.00098
G1 X123.69 Y115.331 E.00087
G1 X123.712 Y115.308 E.00096
G1 X123.755 Y115.281 E.00157
G1 X123.797 Y115.27 E.00131
G3 X130.011 Y115.269 I3.273 J605.926 E.19097
G3 X130.639 Y115.27 I.3 J5.095 E.01928
G1 X130.703 Y115.294 E.00212
G1 X130.721 Y115.306 E.00064
G1 X130.743 Y115.328 E.00098
G1 X130.763 Y115.352 E.00095
G1 X130.776 Y115.377 E.00085
G1 X130.788 Y115.405 E.00094
G1 X130.801 Y115.46 E.00175
G1 X130.804 Y115.483 E.0007
G1 X130.806 Y115.535 E.00162
G1 X130.806 Y115.542 E.0002
G1 X130.804 Y140.405 E.76399
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.804 Y140.516 E-.04217
G1 X130.792 Y140.581 E-.0251
G1 X130.789 Y140.592 E-.00408
G1 X130.776 Y140.623 E-.01286
G1 X130.761 Y140.65 E-.01179
G1 X130.743 Y140.672 E-.01076
G1 X130.724 Y140.691 E-.01029
G1 X130.703 Y140.706 E-.0096
G1 X130.638 Y140.73 E-.02633
G1 X129.041 Y140.73 E-.60702
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
G1 X129.615 Y128.401 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F3982
M204 S6000
G1 X124.817 Y128.401 E.14743
G1 X124.817 Y139.54 E.34226
G1 X129.615 Y139.54 E.14743
G1 X129.615 Y128.461 E.34042
M204 S10000
G1 X129.238 Y128.778 F42000
G1 F3982
M204 S6000
G1 X125.194 Y128.778 E.12426
G1 X125.194 Y139.163 E.31909
G1 X129.238 Y139.163 E.12426
G1 X129.238 Y128.838 E.31725
M204 S10000
G1 X128.861 Y129.155 F42000
G1 F3982
M204 S6000
G1 X125.571 Y129.155 E.10109
G1 X125.571 Y138.786 E.29592
G1 X128.861 Y138.786 E.10109
G1 X128.861 Y129.215 E.29408
M204 S10000
G1 X128.484 Y129.532 F42000
G1 F3982
M204 S6000
G1 X125.948 Y129.532 E.07791
G1 X125.948 Y138.409 E.27275
G1 X128.484 Y138.409 E.07792
G1 X128.484 Y129.592 E.27091
M204 S10000
G1 X128.107 Y129.909 F42000
G1 F3982
M204 S6000
G1 X126.325 Y129.909 E.05474
G1 X126.325 Y138.032 E.24958
G1 X128.107 Y138.032 E.05474
G1 X128.107 Y129.969 E.24773
M204 S10000
G1 X127.73 Y130.287 F42000
G1 F3982
M204 S6000
G1 X126.702 Y130.287 E.03157
G1 X126.702 Y137.655 E.2264
G1 X127.73 Y137.655 E.03157
G1 X127.73 Y130.347 E.22456
M204 S10000
G1 X127.379 Y130.638 F42000
; LINE_WIDTH: 0.368125
G1 F3982
M204 S6000
G1 X127.054 Y130.638 E.00862
G1 X127.054 Y137.304 E.17665
G1 X127.379 Y137.304 E.00862
G1 X127.379 Y130.698 E.17506
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11069.95
G1 X127.379 Y132.698 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/72
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z1 I1.198 J-.215 P1  F42000
G1 X124.554 Y116.94 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3854
M204 S5000
G1 X129.874 Y116.94 E.16347
G1 X129.874 Y127.46 E.32325
G1 X124.554 Y127.46 E.16347
G1 X124.554 Y117 E.32141
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.554 Y116.977 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.417 Y116.548 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3854
M204 S6000
G1 X124.02 Y116.548 E.21219
G1 X124.02 Y115.608 E.03116
G1 X130.417 Y115.609 E.21219
G1 X130.417 Y116.488 E.02917
; WIPE_START
G1 F8843.478
G1 X128.417 Y116.507 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.933 Y124.122 Z1.2 F42000
G1 X130.01 Y139.984 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F3854
M204 S6000
G1 X124.427 Y139.985 E.18519
G1 X124.427 Y128.259 E.38895
G1 X130.01 Y128.259 E.18518
G1 X130.01 Y139.924 E.38696
M204 S10000
G1 X130.417 Y140.391 F42000
G1 F3854
M204 S6000
G1 X124.02 Y140.392 E.2122
G1 X124.02 Y127.852 E.41596
G1 X130.417 Y127.852 E.21219
G1 X130.417 Y140.331 E.41396
M204 S250
G1 X130.809 Y140.505 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3854
M204 S5000
G3 X130.774 Y140.7 I-.281 J.05 E.00622
G1 X130.75 Y140.73 E.00118
G1 X130.734 Y140.743 E.00063
G3 X130.611 Y140.784 I-.14 J-.221 E.00403
G1 X130.011 Y140.784 E.01844
G1 X123.83 Y140.784 E.18993
G3 X123.751 Y140.77 I-.002 J-.214 E.00246
G3 X123.684 Y140.725 I.075 J-.185 E.00249
G1 X123.669 Y140.706 E.00074
G1 X123.644 Y140.663 E.00154
G3 X123.628 Y140.575 I.242 J-.088 E.00277
G1 X123.628 Y115.426 E.77276
G3 X123.67 Y115.293 I.294 J.019 E.00431
G3 X123.709 Y115.254 I.135 J.097 E.00173
G1 X123.735 Y115.237 E.00094
G1 X123.771 Y115.224 E.00119
G3 X123.827 Y115.216 I.05 J.167 E.00173
G1 X130.01 Y115.216 E.18997
G1 X130.61 Y115.217 E.01844
G3 X130.689 Y115.233 I.004 J.184 E.00252
G3 X130.752 Y115.273 I-.055 J.154 E.0023
G1 X130.774 Y115.301 E.00112
G3 X130.809 Y115.423 I-.184 J.118 E.00394
G1 X130.809 Y140.445 E.76886
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.803 Y140.631 E-.07081
G1 X130.774 Y140.7 E-.02842
G1 X130.75 Y140.73 E-.01457
G1 X130.734 Y140.743 E-.00774
G1 X130.611 Y140.784 E-.04933
G1 X130.011 Y140.784 E-.228
G1 X129.061 Y140.784 E-.36114
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


G1 X129.618 Y130.77 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F3854
M204 S6000
G1 X124.819 Y130.77 E.14744
G1 X124.819 Y139.592 E.27108
G1 X129.618 Y139.592 E.14744
G1 X129.618 Y130.829 E.26925
M204 S10000
G1 X129.241 Y131.147 F42000
G1 F3854
M204 S6000
G1 X125.196 Y131.147 E.12427
G1 X125.196 Y139.215 E.24791
G1 X129.241 Y139.215 E.12427
G1 X129.241 Y131.207 E.24608
M204 S10000
M73 P36 R12
G1 X128.864 Y131.524 F42000
G1 F3854
M204 S6000
G1 X125.573 Y131.524 E.1011
G1 X125.573 Y138.838 E.22474
G1 X128.864 Y138.838 E.1011
G1 X128.864 Y131.584 E.2229
M204 S10000
G1 X128.487 Y131.901 F42000
G1 F3854
M204 S6000
G1 X125.95 Y131.901 E.07792
G1 X125.95 Y138.461 E.20157
G1 X128.487 Y138.461 E.07793
G1 X128.487 Y131.961 E.19973
M204 S10000
G1 X128.109 Y132.278 F42000
G1 F3854
M204 S6000
G1 X126.328 Y132.278 E.05475
G1 X126.328 Y138.084 E.1784
G1 X128.11 Y138.084 E.05475
G1 X128.109 Y132.338 E.17656
M204 S10000
G1 X127.732 Y132.655 F42000
G1 F3854
M204 S6000
G1 X126.705 Y132.655 E.03158
G1 X126.705 Y137.707 E.15523
G1 X127.732 Y137.707 E.03158
G1 X127.732 Y132.715 E.15339
M204 S10000
G1 X127.381 Y133.006 F42000
; LINE_WIDTH: 0.36829
G1 F3854
M204 S6000
G1 X127.056 Y133.006 E.00863
G1 X127.056 Y137.356 E.11532
G1 X127.381 Y137.356 E.00863
G1 X127.381 Y133.066 E.11373
M204 S10000
G1 X129.787 Y130.212 F42000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F3854
M204 S2000
G1 X129.437 Y130.563 E.01524
G1 X128.903 Y130.563
G1 X129.787 Y129.679 E.03842
G1 X129.787 Y129.145
G1 X128.37 Y130.563 E.06159
G1 X127.837 Y130.563
G1 X129.787 Y128.612 E.08476
G1 X129.385 Y128.482
G1 X127.304 Y130.563 E.09044
G1 X126.77 Y130.563
G1 X128.852 Y128.482 E.09044
G1 X128.318 Y128.482
G1 X126.237 Y130.563 E.09044
G1 X125.704 Y130.563
G1 X127.785 Y128.482 E.09044
G1 X127.252 Y128.482
G1 X125.171 Y130.563 E.09044
G1 X124.65 Y130.55
G1 X126.719 Y128.482 E.08991
G1 X126.185 Y128.482
G1 X124.65 Y130.017 E.06673
G1 X124.65 Y129.484
G1 X125.652 Y128.482 E.04356
G1 X125.119 Y128.482
G1 X124.65 Y128.951 E.02039
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.119 Y128.482 E-.25215
G1 X125.652 Y128.482 E-.20264
G1 X125.084 Y129.049 E-.30522
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.091 Y127.656 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.57651
G1 F3854
M204 S6000
G1 X124.091 Y116.744 E.47446
M204 S10000
G1 X124.224 Y116.078 F42000
; LINE_WIDTH: 0.575256
G1 F3854
M204 S6000
G1 X130.213 Y116.078 E.25982
M204 S10000
G1 X130.341 Y116.744 F42000
; LINE_WIDTH: 0.585963
G1 F3854
M204 S6000
G1 X130.341 Y127.656 E.48286
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6629.31
G1 X130.341 Y125.656 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/72
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z1.2 I-.575 J-1.073 P1  F42000
G1 X124.454 Y128.81 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3705
M204 S5000
G1 X124.454 Y127.59 E.03749
G1 X129.974 Y127.59 E.16961
G1 X129.974 Y128.81 E.03749
G1 X124.514 Y128.81 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y127.59 E-.46416
G1 X125.232 Y127.59 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.747 Y119.973 Z1.4 F42000
G1 X124.554 Y116.94 Z1.4
G1 Z1
G1 E.8 F1800
G1 F3705
M204 S5000
G1 X129.874 Y116.94 E.16347
G1 X129.874 Y127.46 E.32325
G1 X124.554 Y127.46 E.16347
G1 X124.554 Y117 E.32141
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.554 Y116.977 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.974 Y116.81 Z1.4 F42000
G1 Z1
G1 E.8 F1800
G1 F3705
M204 S5000
G1 X124.454 Y116.81 E.16961
G1 X124.454 Y115.59 E.03749
G1 X129.974 Y115.59 E.16961
G1 X129.974 Y116.75 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.974 Y116.772 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.642 Y124.375 Z1.4 F42000
G1 X130.015 Y139.99 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3705
M204 S6000
G1 X124.432 Y139.991 E.1852
G1 X124.432 Y129.609 E.34438
G1 X130.015 Y129.609 E.1852
G1 X130.015 Y139.93 E.34238
M204 S10000
G1 X130.422 Y140.398 F42000
G1 F3705
M204 S6000
G1 X124.025 Y140.398 E.21221
G1 X124.025 Y129.202 E.37139
G1 X130.422 Y129.202 E.21221
G1 X130.422 Y140.338 E.36938
M204 S250
G1 X130.808 Y140.648 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3705
M204 S5000
G3 X130.628 Y140.79 I-.188 J-.054 E.00752
G1 X123.775 Y140.783 E.21056
G3 X123.633 Y140.59 I.061 J-.194 E.00788
G1 X123.634 Y115.384 E.77452
G3 X123.817 Y115.21 I.191 J.018 E.00844
G1 X130.661 Y115.215 E.21031
G3 X130.814 Y115.41 I-.041 J.19 E.00828
G1 X130.808 Y140.588 E.77366
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.742 Y140.748 E-.06574
G1 X130.628 Y140.79 E-.04632
G1 X128.922 Y140.788 E-.64793
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


G1 X129.623 Y130.001 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F3705
M204 S6000
G1 X124.824 Y130.001 E.14745
G1 X124.824 Y139.599 E.2949
G1 X129.623 Y139.598 E.14745
G1 X129.623 Y130.061 E.29305
M204 S10000
G1 X129.246 Y130.378 F42000
G1 F3705
M204 S6000
G1 X125.201 Y130.378 E.12428
G1 X125.201 Y139.222 E.27173
G1 X129.246 Y139.221 E.12428
G1 X129.246 Y130.438 E.26987
M204 S10000
G1 X128.869 Y130.755 F42000
G1 F3705
M204 S6000
G1 X125.578 Y130.755 E.10111
G1 X125.578 Y138.845 E.24855
G1 X128.869 Y138.844 E.10111
G1 X128.869 Y130.815 E.2467
M204 S10000
G1 X128.492 Y131.132 F42000
G1 F3705
M204 S6000
G1 X125.955 Y131.132 E.07794
G1 X125.955 Y138.467 E.22538
G1 X128.492 Y138.467 E.07794
G1 X128.492 Y131.192 E.22353
M204 S10000
G1 X128.115 Y131.509 F42000
G1 F3705
M204 S6000
G1 X126.332 Y131.509 E.05477
M73 P37 R12
G1 X126.332 Y138.09 E.20221
G1 X128.115 Y138.09 E.05477
G1 X128.115 Y131.569 E.20036
M204 S10000
G1 X127.738 Y131.887 F42000
G1 F3705
M204 S6000
G1 X126.71 Y131.887 E.03159
G1 X126.71 Y137.713 E.17903
G1 X127.738 Y137.713 E.03159
G1 X127.738 Y131.947 E.17719
M204 S10000
G1 X127.386 Y132.238 F42000
; LINE_WIDTH: 0.36851
G1 F3705
M204 S6000
G1 X127.061 Y132.238 E.00864
G1 X127.061 Y137.362 E.13595
G1 X127.386 Y137.362 E.00864
G1 X127.386 Y132.298 E.13436
; WIPE_START
G1 F11056.851
G1 X127.386 Y134.298 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.394 Y129.006 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.4915
G1 F3705
M204 S6000
G1 X130.394 Y127.394 E.05892
; LINE_WIDTH: 0.5165
G1 X130.369 Y127.288 E.0042
; LINE_WIDTH: 0.59123
G1 X130.344 Y127.182 E.00486
G1 X130.344 Y117.218 E.44521
; LINE_WIDTH: 0.574837
G1 X130.361 Y117.147 E.00314
; LINE_WIDTH: 0.541503
G1 X130.377 Y117.077 E.00295
; LINE_WIDTH: 0.492223
G1 X130.394 Y117.006 E.00266
G1 X130.394 Y115.406 E.05858
M204 S10000
G1 X124.043 Y115.406 F42000
; LINE_WIDTH: 0.472258
G1 F3705
M204 S6000
G1 X124.043 Y117.006 E.05596
G1 X124.06 Y117.075 E.00248
; LINE_WIDTH: 0.52155
G1 X124.077 Y117.144 E.00277
; LINE_WIDTH: 0.55489
G1 X124.093 Y117.213 E.00296
; LINE_WIDTH: 0.548065
G1 X124.131 Y117.188 E.00185
; LINE_WIDTH: 0.50112
G1 X124.169 Y117.164 E.00168
; LINE_WIDTH: 0.454175
G1 X124.207 Y117.139 E.00151
; LINE_WIDTH: 0.407229
G1 X124.244 Y117.115 E.00134
; LINE_WIDTH: 0.360284
G1 X124.282 Y117.09 E.00117
; LINE_WIDTH: 0.313338
G1 X124.32 Y117.065 E.00099
; LINE_WIDTH: 0.266393
G1 X124.358 Y117.041 E.00082
M204 S10000
G1 X124.093 Y117.213 F42000
; LINE_WIDTH: 0.571445
G1 F3705
M204 S6000
G1 X124.093 Y127.187 E.42956
G1 X124.131 Y127.212 E.00194
; LINE_WIDTH: 0.501122
G1 X124.169 Y127.236 E.00168
; LINE_WIDTH: 0.454176
G1 X124.207 Y127.261 E.00151
; LINE_WIDTH: 0.40723
G1 X124.244 Y127.285 E.00134
; LINE_WIDTH: 0.360285
G1 X124.282 Y127.31 E.00117
; LINE_WIDTH: 0.313339
M73 P37 R11
G1 X124.32 Y127.335 E.00099
; LINE_WIDTH: 0.266393
G1 X124.358 Y127.359 E.00082
M204 S10000
G1 X124.093 Y127.187 F42000
; LINE_WIDTH: 0.546544
G1 F3705
M204 S6000
G1 X124.068 Y127.29 E.00437
; LINE_WIDTH: 0.4731
G1 X124.043 Y127.394 E.00373
G1 X124.043 Y129.006 E.05651
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8368.601
G1 X124.043 Y127.394 E-.71291
G1 X124.068 Y127.29 E-.04709
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/72
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z1.4 I-1.18 J.299 P1  F42000
G1 X124.454 Y128.81 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2612
M204 S5000
G1 X124.454 Y127.59 E.03749
G1 X129.974 Y127.59 E.16961
G1 X129.974 Y128.81 E.03749
G1 X124.514 Y128.81 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y127.59 E-.46416
G1 X125.232 Y127.59 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.747 Y119.973 Z1.6 F42000
G1 X124.554 Y116.94 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F2612
M204 S5000
G1 X129.874 Y116.94 E.16347
G1 X129.874 Y127.46 E.32325
G1 X124.554 Y127.46 E.16347
G1 X124.554 Y117 E.32141
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.554 Y116.977 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.974 Y116.81 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
G1 F2612
M204 S5000
G1 X124.454 Y116.81 E.16961
G1 X124.454 Y115.59 E.03749
G1 X129.974 Y115.59 E.16961
G1 X129.974 Y116.75 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.974 Y116.772 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.645 Y124.375 Z1.6 F42000
G1 X130.023 Y139.99 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2612
M204 S6000
G1 X124.44 Y139.991 E.18521
G1 X124.44 Y129.609 E.34438
G1 X130.023 Y129.609 E.18521
G1 X130.023 Y139.93 E.34238
M204 S10000
G1 X130.43 Y140.398 F42000
G1 F2612
M204 S6000
G1 X124.033 Y140.398 E.21222
G1 X124.033 Y129.202 E.37139
G1 X130.43 Y129.202 E.21222
G1 X130.43 Y140.338 E.36938
M204 S250
G1 X130.815 Y140.648 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2612
M204 S5000
G3 X130.635 Y140.79 I-.188 J-.055 E.0075
G1 X123.782 Y140.783 E.21058
G3 X123.641 Y140.59 I.061 J-.193 E.00788
G1 X123.646 Y115.357 E.77532
G3 X123.825 Y115.21 I.192 J.051 E.00759
G1 X130.668 Y115.214 E.21029
G3 X130.822 Y115.41 I-.04 J.19 E.0083
G1 X130.815 Y140.588 E.77365
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.75 Y140.748 E-.06567
G1 X130.635 Y140.79 E-.04625
G1 X128.93 Y140.788 E-.64808
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


G1 X129.675 Y137.862 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2612
M204 S6000
G1 X129.675 Y139.49 E.05401
G1 X129.381 Y139.642 E.01099
G1 X126.639 Y139.642 E.09094
G1 X126.035 Y139.212 E.02461
G2 X124.788 Y139.32 I-.504 J1.439 E.04277
G1 X124.788 Y136.584 E.09076
G3 X126.69 Y137.284 I.394 J1.863 E.07088
G1 X127.345 Y137.753 E.02674
G2 X129.31 Y137.061 I.444 J-1.876 E.07303
G1 X129.675 Y136.8 E.01487
G1 X129.675 Y134.349 E.08129
G3 X128.655 Y135.132 I-4.891 J-5.311 E.04271
G3 X126.69 Y134.44 I-.444 J-1.876 E.07303
G1 X126.035 Y133.971 E.02674
G2 X124.788 Y134.079 I-.504 J1.438 E.04277
G1 X124.788 Y131.343 E.09076
G3 X126.69 Y132.042 I.394 J1.863 E.07088
G1 X127.345 Y132.512 E.02674
G2 X129.31 Y131.82 I.444 J-1.876 E.07303
G1 X129.675 Y131.559 E.01487
G1 X129.648 Y129.957 E.05312
; WIPE_START
G1 F8843.478
G1 X129.675 Y131.559 E-.60851
G1 X129.351 Y131.791 E-.15149
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.398 Y129.006 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.49935
M73 P38 R11
G1 F2612
M204 S6000
G1 X130.398 Y127.394 E.05995
; LINE_WIDTH: 0.51601
G1 X130.381 Y127.323 E.00282
; LINE_WIDTH: 0.54935
G1 X130.365 Y127.252 E.00302
; LINE_WIDTH: 0.599229
G1 X130.348 Y127.18 E.00332
G1 X130.348 Y117.22 E.45154
; LINE_WIDTH: 0.574345
G1 X130.373 Y117.113 E.00475
; LINE_WIDTH: 0.524355
G1 X130.398 Y117.006 E.0043
; LINE_WIDTH: 0.49934
G1 X130.398 Y115.406 E.0595
M204 S10000
G1 X124.047 Y115.406 F42000
; LINE_WIDTH: 0.465569
G1 F2612
M204 S6000
G1 X124.047 Y117.006 E.05509
G1 X124.072 Y117.109 E.00364
; LINE_WIDTH: 0.53902
G1 X124.097 Y117.211 E.00427
M204 S10000
G1 X124.358 Y117.04 F42000
; LINE_WIDTH: 0.265856
G1 F2612
M204 S6000
G1 X124.32 Y117.065 E.00081
; LINE_WIDTH: 0.311728
G1 X124.283 Y117.089 E.00097
; LINE_WIDTH: 0.357601
G1 X124.246 Y117.114 E.00114
; LINE_WIDTH: 0.403473
G1 X124.209 Y117.138 E.00131
; LINE_WIDTH: 0.449345
G1 X124.172 Y117.162 E.00147
; LINE_WIDTH: 0.495217
G1 X124.134 Y117.187 E.00164
; LINE_WIDTH: 0.541089
G1 X124.097 Y117.211 E.00181
; LINE_WIDTH: 0.563918
G1 X124.097 Y127.189 E.42359
G1 X124.134 Y127.213 E.00189
; LINE_WIDTH: 0.495213
G1 X124.172 Y127.238 E.00164
; LINE_WIDTH: 0.449342
G1 X124.209 Y127.262 E.00147
; LINE_WIDTH: 0.40347
G1 X124.246 Y127.286 E.00131
; LINE_WIDTH: 0.357599
G1 X124.283 Y127.311 E.00114
; LINE_WIDTH: 0.311728
G1 X124.32 Y127.335 E.00097
; LINE_WIDTH: 0.265856
G1 X124.358 Y127.359 E.00081
M204 S10000
G1 X124.097 Y127.189 F42000
; LINE_WIDTH: 0.547357
G1 F2612
M204 S6000
G1 X124.08 Y127.257 E.00289
; LINE_WIDTH: 0.514023
G1 X124.064 Y127.326 E.0027
; LINE_WIDTH: 0.464718
G1 X124.047 Y127.394 E.00242
G1 X124.047 Y129.006 E.05541
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8534.902
G1 X124.047 Y127.394 E-.7282
G1 X124.064 Y127.326 E-.0318
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/72
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z1.6 I-1.177 J.309 P1  F42000
G1 X124.454 Y128.81 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2609
M204 S5000
G1 X124.454 Y127.59 E.03749
G1 X129.974 Y127.59 E.16961
G1 X129.974 Y128.81 E.03749
G1 X124.514 Y128.81 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y127.59 E-.46416
G1 X125.232 Y127.59 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.747 Y119.973 Z1.8 F42000
G1 X124.554 Y116.94 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F2609
M204 S5000
G1 X129.874 Y116.94 E.16347
G1 X129.874 Y127.46 E.32325
G1 X124.554 Y127.46 E.16347
G1 X124.554 Y117 E.32141
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.554 Y116.977 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.974 Y116.81 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
G1 F2609
M204 S5000
G1 X124.454 Y116.81 E.16961
G1 X124.454 Y115.59 E.03749
G1 X129.974 Y115.59 E.16961
G1 X129.974 Y116.75 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.974 Y116.772 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.647 Y124.374 Z1.8 F42000
G1 X130.031 Y139.99 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2609
M204 S6000
G1 X124.447 Y139.991 E.18522
G1 X124.447 Y129.609 E.34438
G1 X130.031 Y129.609 E.18522
G1 X130.031 Y139.93 E.34238
M204 S10000
G1 X130.438 Y140.398 F42000
G1 F2609
M204 S6000
G1 X124.04 Y140.398 E.21223
G1 X124.04 Y129.202 E.37139
G1 X130.438 Y129.202 E.21223
G1 X130.438 Y140.338 E.36938
M204 S250
G1 X130.823 Y140.648 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2609
M204 S5000
G3 X130.643 Y140.79 I-.191 J-.057 E.0075
G1 X123.79 Y140.783 E.21058
G3 X123.648 Y140.59 I.061 J-.194 E.00789
G1 X123.654 Y115.356 E.77535
G3 X123.832 Y115.21 I.195 J.057 E.00753
G1 X130.676 Y115.214 E.21029
G3 X130.83 Y115.41 I-.04 J.19 E.00831
G1 X130.823 Y140.588 E.77364
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.756 Y140.75 E-.06644
G1 X130.643 Y140.79 E-.04555
G1 X128.938 Y140.788 E-.648
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


G1 X128.25 Y139.642 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2609
M204 S6000
G1 X126.622 Y139.642 E.05401
G2 X125.379 Y139.135 I-1.857 J2.776 E.04483
G1 X124.795 Y139.216 E.01955
G1 X124.795 Y136.687 E.08386
G3 X126.69 Y137.082 I.675 J1.502 E.0686
G1 X127.345 Y137.636 E.02846
G2 X129.31 Y137.262 I.731 J-1.51 E.07111
G1 X129.683 Y136.948 E.01617
G1 X129.683 Y139.421 E.08204
G1 X129.363 Y139.642 E.0129
G1 X128.25 Y139.642 E.0369
M204 S10000
G1 X124.795 Y135.603 F42000
G1 F2609
M204 S6000
G1 X124.795 Y133.974 E.05401
G3 X126.035 Y134.088 I.494 J1.429 E.04254
G1 X126.69 Y134.642 E.02846
G2 X128.655 Y135.015 I1.234 J-1.136 E.0711
G3 X129.683 Y134.19 I6.219 J6.691 E.04375
G1 X129.683 Y131.706 E.08239
G1 X129.31 Y132.021 E.01617
G3 X127.345 Y132.395 I-1.234 J-1.136 E.0711
G1 X126.69 Y131.841 E.02846
G2 X124.795 Y131.446 I-1.219 J1.108 E.0686
G1 X124.795 Y129.957 E.04938
G1 X124.935 Y129.957 E.00463
; WIPE_START
G1 F8843.478
G1 X124.795 Y129.957 E-.05306
G1 X124.795 Y131.446 E-.56571
G1 X125.152 Y131.341 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.051 Y129.006 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.457182
G1 F2609
M204 S6000
G1 X124.051 Y127.394 E.05442
G1 X124.068 Y127.326 E.00236
; LINE_WIDTH: 0.506485
G1 X124.084 Y127.258 E.00264
; LINE_WIDTH: 0.539822
G1 X124.101 Y127.191 E.00283
M204 S10000
G1 X124.358 Y127.36 F42000
; LINE_WIDTH: 0.265319
G1 F2609
M204 S6000
G1 X124.321 Y127.336 E.0008
; LINE_WIDTH: 0.310116
G1 X124.284 Y127.312 E.00096
; LINE_WIDTH: 0.354913
G1 X124.248 Y127.287 E.00112
; LINE_WIDTH: 0.39971
G1 X124.211 Y127.263 E.00128
; LINE_WIDTH: 0.444508
G1 X124.174 Y127.239 E.00144
; LINE_WIDTH: 0.489305
G1 X124.138 Y127.215 E.0016
; LINE_WIDTH: 0.556392
G1 X124.101 Y127.191 E.00184
G1 X124.101 Y117.209 E.41763
M204 S10000
G1 X124.358 Y117.04 F42000
; LINE_WIDTH: 0.265318
G1 F2609
M204 S6000
G1 X124.321 Y117.064 E.0008
; LINE_WIDTH: 0.310114
G1 X124.284 Y117.088 E.00096
; LINE_WIDTH: 0.354909
G1 X124.248 Y117.113 E.00112
; LINE_WIDTH: 0.399705
G1 X124.211 Y117.137 E.00128
; LINE_WIDTH: 0.444501
G1 X124.174 Y117.161 E.00144
; LINE_WIDTH: 0.489296
G1 X124.138 Y117.185 E.0016
; LINE_WIDTH: 0.534092
G1 X124.101 Y117.209 E.00176
; LINE_WIDTH: 0.531485
G1 X124.076 Y117.108 E.00417
; LINE_WIDTH: 0.458027
G1 X124.051 Y117.006 E.00354
G1 X124.051 Y115.406 E.05411
M204 S10000
G1 X130.402 Y115.406 F42000
; LINE_WIDTH: 0.508817
G1 F2609
M204 S6000
G1 X130.402 Y117.006 E.06074
G1 X130.377 Y117.114 E.0042
; LINE_WIDTH: 0.582199
G1 X130.352 Y117.221 E.00486
; LINE_WIDTH: 0.606926
G1 X130.352 Y127.178 E.45762
G1 X130.377 Y127.286 E.00508
; LINE_WIDTH: 0.5322
G1 X130.402 Y127.394 E.00441
; LINE_WIDTH: 0.5072
G1 X130.402 Y129.006 E.06099
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7753.942
G1 X130.402 Y127.394 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/72
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z1.8 I-.282 J-1.184 P1  F42000
G1 X124.454 Y128.81 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2776
M204 S5000
G1 X124.454 Y127.59 E.03749
G1 X129.974 Y127.59 E.16961
G1 X129.974 Y128.81 E.03749
G1 X124.514 Y128.81 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y127.59 E-.46416
G1 X125.232 Y127.59 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.747 Y119.973 Z2 F42000
G1 X124.554 Y116.94 Z2
G1 Z1.6
G1 E.8 F1800
G1 F2776
M204 S5000
G1 X129.874 Y116.94 E.16347
G1 X129.874 Y127.46 E.32325
G1 X124.554 Y127.46 E.16347
G1 X124.554 Y117 E.32141
; WIPE_START
G1 F9547.055
M204 S6000
M73 P39 R11
G1 X126.554 Y116.977 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.974 Y116.81 Z2 F42000
G1 Z1.6
G1 E.8 F1800
G1 F2776
M204 S5000
G1 X124.454 Y116.81 E.16961
G1 X124.454 Y115.59 E.03749
G1 X129.974 Y115.59 E.16961
G1 X129.974 Y116.75 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.974 Y116.772 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.65 Y124.374 Z2 F42000
G1 X130.039 Y139.99 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2776
M204 S6000
G1 X124.455 Y139.991 E.18523
G1 X124.455 Y129.609 E.34438
G1 X130.039 Y129.609 E.18523
G1 X130.039 Y139.93 E.34238
M204 S10000
G1 X130.446 Y140.398 F42000
G1 F2776
M204 S6000
G1 X124.048 Y140.398 E.21224
G1 X124.048 Y129.202 E.37139
G1 X130.446 Y129.202 E.21224
G1 X130.446 Y140.338 E.36938
M204 S250
G1 X130.831 Y140.648 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2776
M204 S5000
G3 X130.651 Y140.79 I-.189 J-.055 E.00751
G1 X123.798 Y140.783 E.21059
G3 X123.656 Y140.59 I.061 J-.194 E.00789
G1 X123.661 Y115.356 E.77537
G3 X123.84 Y115.21 I.192 J.054 E.00754
G1 X130.683 Y115.214 E.21026
G3 X130.838 Y115.41 I-.039 J.19 E.00835
G1 X130.831 Y140.588 E.77365
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.765 Y140.749 E-.06599
G1 X130.651 Y140.79 E-.04603
G1 X128.946 Y140.788 E-.64798
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


G1 X129.321 Y139.099 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2776
M204 S6000
G1 X129.321 Y137.47 E.05401
G3 X128.983 Y137.757 I-1.604 J-1.547 E.01474
G3 X127.345 Y137.538 I-.614 J-1.645 E.05707
G1 X126.69 Y136.863 E.0312
G2 X126.035 Y136.463 I-.9 J.735 E.02597
G1 X125.379 Y136.491 E.02175
G1 X125.18 Y136.587 E.00733
G1 X125.18 Y139.103 E.08347
G3 X125.698 Y139.265 I.07 J.687 E.0185
G1 X127.327 Y139.265 E.05401
M204 S10000
G1 X124.817 Y136.505 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F2776
M204 S6000
G1 X124.817 Y136.378 E.00351
M204 S10000
G1 X124.803 Y135.006 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2776
M204 S6000
G1 X124.803 Y134.386 E.02056
G1 X125.18 Y134.481 E.01291
G1 X125.18 Y133.862 E.02054
G1 X125.379 Y133.871 E.00662
G1 X126.035 Y134.186 E.02411
G2 X127.017 Y135.137 I5.239 J-4.43 E.04544
G2 X128.655 Y134.918 I.614 J-1.645 E.05707
G3 X129.313 Y134.24 I3.71 J2.946 E.03138
G1 X129.313 Y132.237 E.06646
G3 X128.983 Y132.516 I-1.555 J-1.506 E.01438
G3 X127.345 Y132.297 I-.614 J-1.645 E.05707
G1 X126.69 Y131.622 E.0312
G2 X124.803 Y131.527 I-.997 J1.019 E.0685
G1 X124.803 Y129.957 E.05207
G1 X124.862 Y129.957 E.00194
M204 S10000
G1 X126.064 Y129.972 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38337
G1 F2776
M204 S6000
G1 X129.524 Y129.972 E.09601
G1 X129.651 Y129.997 E.00357
G1 X129.68 Y130.132 E.00383
G2 X129.68 Y139.469 I1912.432 J4.668 E.25902
G1 X129.651 Y139.603 E.00381
G1 X129.525 Y139.628 E.00357
G1 X125.882 Y139.628 E.10106
M204 S10000
G1 X124.845 Y139.601 F42000
; LINE_WIDTH: 0.39947
G1 F2776
M204 S6000
G1 X124.817 Y139.469 E.00391
G1 X124.817 Y138.478 E.02878
M204 S10000
G1 X124.817 Y134.015 F42000
; LINE_WIDTH: 0.38292
G1 F2776
M204 S6000
G1 X124.817 Y133.432 E.01617
; WIPE_START
G1 F10588.235
G1 X124.817 Y134.015 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.055 Y129.006 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.450473
G1 F2776
M204 S6000
G1 X124.055 Y127.394 E.05353
G1 X124.08 Y127.293 E.00345
; LINE_WIDTH: 0.523955
G1 X124.105 Y127.192 E.00407
M204 S10000
G1 X124.141 Y127.216 F42000
; LINE_WIDTH: 0.48338
G1 F2776
M204 S6000
G1 X124.177 Y127.24 E.00156
; LINE_WIDTH: 0.43966
G1 X124.213 Y127.264 E.0014
; LINE_WIDTH: 0.39594
G1 X124.249 Y127.288 E.00125
; LINE_WIDTH: 0.35222
G1 X124.285 Y127.312 E.00109
; LINE_WIDTH: 0.3085
G1 X124.322 Y127.336 E.00094
; LINE_WIDTH: 0.26478
G1 X124.358 Y127.36 E.00078
M204 S10000
G1 X124.141 Y127.216 F42000
; LINE_WIDTH: 0.548866
G1 F2776
M204 S6000
G1 X124.105 Y127.192 E.00179
G1 X124.105 Y117.208 E.41166
; LINE_WIDTH: 0.52396
G1 X124.08 Y117.107 E.00407
; LINE_WIDTH: 0.450484
G1 X124.055 Y117.006 E.00345
G1 X124.055 Y115.406 E.05312
M204 S10000
G1 X124.358 Y117.04 F42000
; LINE_WIDTH: 0.26478
G1 F2776
M204 S6000
G1 X124.322 Y117.064 E.00078
; LINE_WIDTH: 0.308499
G1 X124.285 Y117.088 E.00094
; LINE_WIDTH: 0.352218
G1 X124.249 Y117.112 E.00109
; LINE_WIDTH: 0.395937
G1 X124.213 Y117.136 E.00125
; LINE_WIDTH: 0.439656
G1 X124.177 Y117.16 E.0014
; LINE_WIDTH: 0.483375
G1 X124.141 Y117.184 E.00156
; LINE_WIDTH: 0.527094
G1 X124.105 Y117.208 E.00171
; WIPE_START
G1 F7435.35
G1 X124.141 Y117.184 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.356 Y117.223 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.614763
G1 F2776
M204 S6000
G1 X130.356 Y127.177 E.46381
G1 X130.381 Y127.285 E.00519
; LINE_WIDTH: 0.54004
G1 X130.406 Y127.394 E.00452
; LINE_WIDTH: 0.51504
G1 X130.406 Y129.006 E.06202
M204 S10000
G1 X130.356 Y117.223 F42000
; LINE_WIDTH: 0.590037
G1 F2776
M204 S6000
G1 X130.381 Y117.115 E.00497
; LINE_WIDTH: 0.516669
G1 X130.406 Y117.006 E.0043
G1 X130.406 Y115.406 E.06176
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7598.969
G1 X130.406 Y117.006 E-.71049
G1 X130.381 Y117.115 E-.04951
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/72
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z2 I-1.086 J-.55 P1  F42000
G1 X124.454 Y128.81 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3611
M204 S5000
G1 X124.454 Y127.59 E.03749
G1 X129.974 Y127.59 E.16961
G1 X129.974 Y128.81 E.03749
G1 X124.514 Y128.81 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y127.59 E-.46416
G1 X125.232 Y127.59 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.747 Y119.973 Z2.2 F42000
G1 X124.554 Y116.94 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F3611
M204 S5000
G1 X129.874 Y116.94 E.16347
G1 X129.874 Y127.46 E.32325
G1 X124.554 Y127.46 E.16347
G1 X124.554 Y117 E.32141
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.554 Y116.977 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.974 Y116.81 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
G1 F3611
M204 S5000
G1 X124.454 Y116.81 E.16961
G1 X124.454 Y115.59 E.03749
G1 X129.974 Y115.59 E.16961
G1 X129.974 Y116.75 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.974 Y116.772 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.652 Y124.374 Z2.2 F42000
G1 X130.047 Y139.99 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3611
M204 S6000
G1 X124.462 Y139.991 E.18524
G1 X124.462 Y129.609 E.34438
G1 X130.047 Y129.609 E.18524
G1 X130.047 Y139.93 E.34238
M204 S10000
G1 X130.454 Y140.398 F42000
G1 F3611
M204 S6000
G1 X124.055 Y140.398 E.21225
G1 X124.055 Y129.202 E.37139
G1 X130.454 Y129.202 E.21225
G1 X130.454 Y140.338 E.36938
M204 S250
G1 X130.839 Y140.648 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3611
M204 S5000
G3 X130.659 Y140.79 I-.191 J-.057 E.0075
G1 X123.805 Y140.783 E.2106
G3 X123.663 Y140.59 I.06 J-.193 E.00789
G1 X123.669 Y115.355 E.7754
G3 X123.848 Y115.21 I.192 J.055 E.00752
G1 X130.69 Y115.214 E.21024
G3 X130.846 Y115.41 I-.038 J.19 E.00837
G1 X130.839 Y140.588 E.77364
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.772 Y140.749 E-.06643
G1 X130.659 Y140.79 E-.04559
G1 X128.954 Y140.788 E-.64799
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
M73 P40 R11
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X129.11 Y139.823 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.42615
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X129.677 Y138.723 E.07192
G1 X129.677 Y137.684 E.06039
G1 X128.679 Y139.621 E.12663
G1 X128.143 Y139.621 E.03113
G1 X129.677 Y136.645 E.19457
G1 X129.677 Y135.606 E.06039
G1 X127.607 Y139.621 E.26252
G1 X127.072 Y139.621 E.03113
G1 X129.677 Y134.566 E.33047
G1 X129.677 Y133.527 E.06039
G1 X126.536 Y139.621 E.39842
G1 X126 Y139.621 E.03113
G1 X129.677 Y132.488 E.46636
G1 X129.677 Y131.449 E.06039
G1 X125.578 Y139.402 E.51996
G1 X125.245 Y139.242 E.02142
G1 X125.042 Y139.402 E.01505
G1 X129.677 Y130.409 E.58793
G1 X129.677 Y129.979 E.02502
G1 X129.363 Y129.979 E.01823
G1 X124.832 Y138.77 E.57475
G1 X124.832 Y138.602 E.00973
G1 X125.326 Y136.928 E.10143
G1 X125.273 Y136.875 E.00439
G1 X128.828 Y129.979 E.45084
G1 X128.292 Y129.979 E.03113
G1 X124.922 Y136.517 E.42746
G1 X124.835 Y136.428 E.0072
G1 X125.964 Y134.238 E.14323
G1 X125.607 Y134.147 E.02138
G1 X127.756 Y129.979 E.27254
G1 X127.22 Y129.979 E.03113
G1 X125.134 Y134.027 E.26469
G1 X124.832 Y133.951 E.01809
G1 X124.832 Y133.574 E.02193
G1 X126.685 Y129.979 E.23502
G1 X126.149 Y129.979 E.03113
G1 X125.32 Y131.587 E.10516
M106 S201.45
M204 S10000
G1 X124.967 Y130.114 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.64572
; LAYER_HEIGHT: 0.2
G1 F3611
M204 S6000
G1 X124.967 Y131.094 E.04816
; LINE_WIDTH: 0.62483
G1 X124.946 Y131.205 E.00532
; LINE_WIDTH: 0.58305
G1 X124.925 Y131.315 E.00494
; LINE_WIDTH: 0.54127
G1 X124.905 Y131.425 E.00456
; LINE_WIDTH: 0.49949
G1 X124.884 Y131.536 E.00418
G1 X124.905 Y131.594 E.00231
; LINE_WIDTH: 0.54127
G1 X124.925 Y131.653 E.00252
; LINE_WIDTH: 0.58305
G1 X124.946 Y131.711 E.00273
; LINE_WIDTH: 0.641522
G1 X124.967 Y131.77 E.00303
G1 X124.967 Y132.017 E.01204
M204 S10000
G1 X124.967 Y135.023 F42000
; LINE_WIDTH: 0.64572
G1 F3611
M204 S6000
G1 X124.967 Y134.588 E.02137
M204 S10000
G1 X124.881 Y137.004 F42000
; LINE_WIDTH: 0.426
G1 F3611
M204 S6000
G1 X124.809 Y137.046 E.00259
G1 X124.871 Y137.081 E.00221
M204 S10000
G1 X125.315 Y139.621 F42000
; LINE_WIDTH: 0.38292
G1 F3611
M204 S6000
G1 X125.251 Y139.658 E.00204
G1 X125.3 Y139.686 E.00155
; WIPE_START
G1 F10588.235
G1 X125.251 Y139.658 E-.32875
G1 X125.315 Y139.621 E-.43125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.418 Y132.042 Z2.2 F42000
G1 X124.058 Y129.006 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.442931
G1 F3611
M204 S6000
G1 X124.058 Y127.394 E.05254
G1 X124.083 Y127.294 E.00335
; LINE_WIDTH: 0.516432
G1 X124.108 Y127.194 E.00397
M204 S10000
G1 X124.15 Y127.222 F42000
; LINE_WIDTH: 0.466795
G1 F3611
M204 S6000
G1 X124.191 Y127.25 E.00173
; LINE_WIDTH: 0.417045
G1 X124.233 Y127.278 E.00152
; LINE_WIDTH: 0.367295
G1 X124.275 Y127.305 E.00132
; LINE_WIDTH: 0.317545
G1 X124.316 Y127.333 E.00112
; LINE_WIDTH: 0.267795
G1 X124.358 Y127.361 E.00092
M204 S10000
G1 X124.15 Y127.222 F42000
; LINE_WIDTH: 0.541306
G1 F3611
M204 S6000
G1 X124.108 Y127.194 E.00203
G1 X124.108 Y117.206 E.40566
; LINE_WIDTH: 0.516553
G1 X124.15 Y117.178 E.00193
; LINE_WIDTH: 0.466802
G1 X124.191 Y117.15 E.00173
; LINE_WIDTH: 0.41705
G1 X124.233 Y117.122 E.00152
; LINE_WIDTH: 0.367299
G1 X124.275 Y117.095 E.00132
; LINE_WIDTH: 0.317548
G1 X124.316 Y117.067 E.00112
; LINE_WIDTH: 0.267796
G1 X124.358 Y117.039 E.00092
M204 S10000
G1 X124.092 Y117.139 F42000
; LINE_WIDTH: 0.52477
G1 F3611
M204 S6000
G1 X124.108 Y117.206 E.00269
M204 S10000
G1 X124.092 Y117.139 F42000
; LINE_WIDTH: 0.49143
G1 F3611
M204 S6000
G1 X124.075 Y117.073 E.00251
; LINE_WIDTH: 0.442116
G1 X124.058 Y117.006 E.00223
G1 X124.058 Y115.406 E.05203
M204 S10000
G1 X130.41 Y115.406 F42000
; LINE_WIDTH: 0.523645
G1 F3611
M204 S6000
G1 X130.41 Y117.006 E.06267
G1 X130.393 Y117.079 E.00293
; LINE_WIDTH: 0.572887
G1 X130.376 Y117.152 E.00323
; LINE_WIDTH: 0.606225
G1 X130.36 Y117.225 E.00344
; LINE_WIDTH: 0.622611
G1 X130.36 Y127.175 E.47
G1 X130.385 Y127.284 E.00531
; LINE_WIDTH: 0.547895
G1 X130.41 Y127.394 E.00462
; LINE_WIDTH: 0.52289
G1 X130.41 Y129.006 E.06305
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7500.469
G1 X130.41 Y127.394 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/72
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z2.2 I-.281 J-1.184 P1  F42000
G1 X124.454 Y128.81 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3696
M204 S5000
G1 X124.454 Y127.59 E.03749
G1 X129.974 Y127.59 E.16961
G1 X129.974 Y128.81 E.03749
G1 X124.514 Y128.81 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y127.59 E-.46416
G1 X125.232 Y127.59 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.747 Y119.973 Z2.4 F42000
G1 X124.554 Y116.94 Z2.4
G1 Z2
G1 E.8 F1800
G1 F3696
M204 S5000
G1 X129.874 Y116.94 E.16347
G1 X129.874 Y127.46 E.32325
G1 X124.554 Y127.46 E.16347
G1 X124.554 Y117 E.32141
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.554 Y116.977 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.974 Y116.81 Z2.4 F42000
G1 Z2
G1 E.8 F1800
G1 F3696
M204 S5000
G1 X124.454 Y116.81 E.16961
G1 X124.454 Y115.59 E.03749
G1 X129.974 Y115.59 E.16961
G1 X129.974 Y116.75 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.974 Y116.772 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.655 Y124.374 Z2.4 F42000
G1 X130.054 Y139.99 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3696
M204 S6000
G1 X124.47 Y139.991 E.18525
G1 X124.47 Y129.609 E.34438
G1 X130.054 Y129.609 E.18525
G1 X130.054 Y139.93 E.34238
M204 S10000
G1 X130.462 Y140.398 F42000
G1 F3696
M204 S6000
G1 X124.063 Y140.398 E.21226
G1 X124.063 Y129.202 E.37139
G1 X130.462 Y129.202 E.21226
G1 X130.462 Y140.338 E.36938
M204 S250
G1 X130.846 Y140.649 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3696
M204 S5000
G3 X130.667 Y140.79 I-.188 J-.055 E.00745
G1 X123.813 Y140.783 E.21061
G3 X123.671 Y140.59 I.057 J-.191 E.00791
G1 X123.677 Y115.354 E.77544
G3 X123.855 Y115.21 I.191 J.055 E.0075
G1 X130.704 Y115.215 E.21043
G3 X130.854 Y115.41 I-.044 J.189 E.00817
G1 X130.854 Y140.589 E.77369
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.807 Y140.724 E-.05424
G1 X130.733 Y140.776 E-.03433
G1 X130.667 Y140.79 E-.02552
G1 X128.967 Y140.788 E-.64591
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


G1 X129.662 Y132.401 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F3696
M204 S6000
G1 X129.662 Y130.001 E.07375
G1 X124.862 Y130.001 E.1475
G1 X124.862 Y139.599 E.2949
G1 X129.662 Y139.598 E.1475
G1 X129.662 Y132.461 E.21929
M204 S10000
G1 X129.285 Y132.401 F42000
G1 F3696
M204 S6000
G1 X129.285 Y130.378 E.06217
G1 X125.239 Y130.378 E.12433
G1 X125.239 Y139.222 E.27173
G1 X129.285 Y139.221 E.12433
G1 X129.285 Y132.461 E.20771
M204 S10000
G1 X128.908 Y132.401 F42000
G1 F3696
M204 S6000
G1 X128.908 Y130.755 E.05058
G1 X125.616 Y130.755 E.10116
G1 X125.616 Y138.845 E.24855
G1 X128.908 Y138.844 E.10116
G1 X128.908 Y132.461 E.19612
M204 S10000
G1 X128.531 Y132.401 F42000
G1 F3696
M204 S6000
M73 P41 R11
G1 X128.531 Y131.132 E.03899
G1 X125.993 Y131.132 E.07799
G1 X125.993 Y138.467 E.22538
G1 X128.531 Y138.467 E.07799
G1 X128.531 Y132.461 E.18454
M204 S10000
G1 X128.154 Y132.401 F42000
G1 F3696
M204 S6000
G1 X128.154 Y131.509 E.02741
G1 X126.37 Y131.509 E.05482
G1 X126.37 Y138.09 E.20221
G1 X128.154 Y138.09 E.05482
G1 X128.154 Y132.461 E.17295
M204 S10000
G1 X127.777 Y132.401 F42000
G1 F3696
M204 S6000
G1 X127.777 Y131.887 E.01582
G1 X126.747 Y131.887 E.03164
G1 X126.747 Y137.713 E.17903
G1 X127.777 Y137.713 E.03164
G1 X127.777 Y132.461 E.16137
M204 S10000
G1 X127.425 Y132.401 F42000
; LINE_WIDTH: 0.3693
G1 F3696
M204 S6000
G1 X127.425 Y132.238 E.00434
G1 X127.099 Y132.238 E.00868
G1 X127.099 Y137.362 E.13626
G1 X127.425 Y137.362 E.00868
G1 X127.425 Y132.461 E.13032
; WIPE_START
G1 F11030.088
G1 X127.425 Y134.461 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.414 Y129.006 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.53074
G1 F3696
M204 S6000
G1 X130.414 Y127.394 E.06408
; LINE_WIDTH: 0.55574
G1 X130.389 Y127.284 E.00473
; LINE_WIDTH: 0.630459
G1 X130.364 Y127.173 E.00542
G1 X130.364 Y117.227 E.47619
; LINE_WIDTH: 0.614078
G1 X130.38 Y117.153 E.00351
; LINE_WIDTH: 0.580743
G1 X130.397 Y117.08 E.00331
; LINE_WIDTH: 0.531491
G1 X130.414 Y117.006 E.00301
G1 X130.414 Y115.406 E.06369
M204 S10000
G1 X124.062 Y115.406 F42000
; LINE_WIDTH: 0.435399
G1 F3696
M204 S6000
G1 X124.062 Y117.006 E.05116
G1 X124.087 Y117.105 E.00326
; LINE_WIDTH: 0.5089
G1 X124.112 Y117.204 E.00387
; LINE_WIDTH: 0.509649
G1 X124.153 Y117.176 E.00187
; LINE_WIDTH: 0.461153
G1 X124.194 Y117.149 E.00168
; LINE_WIDTH: 0.412657
G1 X124.235 Y117.121 E.00149
; LINE_WIDTH: 0.364161
G1 X124.276 Y117.094 E.00129
; LINE_WIDTH: 0.315664
G1 X124.317 Y117.066 E.0011
; LINE_WIDTH: 0.267168
G1 X124.358 Y117.039 E.0009
M204 S10000
G1 X124.112 Y117.204 F42000
; LINE_WIDTH: 0.533781
G1 F3696
M204 S6000
G1 X124.112 Y127.196 E.39969
G1 X124.153 Y127.224 E.00197
; LINE_WIDTH: 0.461155
G1 X124.194 Y127.251 E.00168
; LINE_WIDTH: 0.412659
G1 X124.235 Y127.279 E.00149
; LINE_WIDTH: 0.364162
G1 X124.276 Y127.306 E.00129
; LINE_WIDTH: 0.315665
G1 X124.317 Y127.334 E.0011
; LINE_WIDTH: 0.267169
G1 X124.358 Y127.361 E.0009
M204 S10000
G1 X124.112 Y127.196 F42000
; LINE_WIDTH: 0.508898
G1 F3696
M204 S6000
G1 X124.087 Y127.295 E.00387
; LINE_WIDTH: 0.435388
G1 X124.062 Y127.394 E.00326
G1 X124.062 Y129.006 E.05155
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9172.738
G1 X124.062 Y127.394 E-.71478
G1 X124.087 Y127.295 E-.04522
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/72
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
M106 S198.9
; OBJECT_ID: 394
M204 S10000
G17
G3 Z2.4 I.114 J1.212 P1  F42000
G1 X129.464 Y126.791 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
M204 S5000
G1 X129.448 Y126.791 E.00053
G1 X129.448 Y117.609 E.30457
G1 X129.464 Y117.609 E.00053
M106 S198.9
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X129.846 Y117.609 E.01269
M106 S198.9
G1 F3294.48
G1 X130.062 Y117.609 E.00717
G1 F7243.776
G1 X130.062 Y118.009 E.01327
G1 F8843.478
G1 X130.062 Y118.409 E.01327
G1 X130.062 Y125.991 E.2515
G1 X130.062 Y126.391 E.01327
G1 F7243.776
G1 X130.062 Y126.791 E.01327
G1 F3294.48
G1 X129.846 Y126.791 E.00717
M106 S255
G1 F1800
G1 X129.524 Y126.791 E.0107
M106 S198.9
; WIPE_START
G1 X129.448 Y126.791 E-.02883
G1 X129.448 Y124.867 E-.73117
; WIPE_END
G1 E-.04
M204 S10000
G17
G3 Z2.6 I-.439 J-1.135 P1  F42000
G1 X124.477 Y126.791 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X124.477 Y118.409 E.27804
G1 X124.477 Y118.009 E.01327
G1 F5980.894
G1 X124.477 Y117.609 E.01327
G1 F2462.484
G1 X124.581 Y117.609 E.00345
M106 S255
G1 F1800
G1 X124.964 Y117.609 E.01269
M106 S198.9
; FEATURE: Overhang wall
M106 S255
G1 F600
M204 S5000
G1 X124.98 Y117.609 E.00053
G1 X124.98 Y126.791 E.30457
M106 S198.9
M106 S255
G1 F3000
G1 X124.964 Y126.791 E.00053
M106 S198.9
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X124.581 Y126.791 E.01269
M106 S198.9
G1 F2067.203
G1 X124.537 Y126.791 E.00146
; WIPE_START
G1 X124.523 Y124.791 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.6 I1.209 J.143 P1  F42000
G1 X125.387 Y117.473 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Overhang wall
M106 S255
G1 F600
M204 S5000
G1 X129.041 Y117.473 E.12121
G1 X129.041 Y126.927 E.31361
G1 X125.387 Y126.927 E.12121
G1 X125.387 Y117.533 E.31162
M106 S198.9
M204 S250
G1 X125.779 Y117.865 F42000
M106 S255
G1 F600
M204 S5000
G1 X128.649 Y117.865 E.0952
G1 X128.649 Y126.535 E.2876
G1 X125.779 Y126.535 E.0952
G1 X125.779 Y117.925 E.28561
M106 S198.9
; WIPE_START
M204 S6000
G1 X127.778 Y117.883 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.6 I-1.146 J-.409 P1  F42000
G1 X124.454 Y127.198 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X124.07 Y127.198 E.01272
G1 X124.07 Y117.602 E.31831
G1 X124.07 Y117.202 E.01327
G1 F5145.402
G1 X124.581 Y117.202 E.01695
M106 S255
G1 F1320
G1 X129.846 Y117.202 E.17465
M106 S198.9
G1 F4101.713
G1 X130.246 Y117.202 E.01327
G1 F6321.14
G1 X130.469 Y117.202 E.0074
G1 F8843.478
G1 X130.469 Y117.602 E.01327
G1 X130.469 Y126.798 E.30504
G1 X130.469 Y127.198 E.01327
G1 F6321.14
G1 X130.246 Y127.198 E.0074
G1 F4101.713
G1 X129.846 Y127.198 E.01327
M106 S255
G1 F1320
G1 X124.581 Y127.198 E.17465
M106 S198.9
G1 F1681.627
G1 X124.514 Y127.198 E.00224
; WIPE_START
G1 X124.07 Y127.198 E-.16851
G1 X124.07 Y125.641 E-.59149
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.454 Y128.81 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P42 R11
G1 F9547.055
M204 S5000
G1 X124.454 Y127.59 E.03749
G1 X129.974 Y127.59 E.16961
G1 X129.974 Y128.81 E.03749
G1 X124.514 Y128.81 E.16777
; WIPE_START
M204 S6000
G1 X124.454 Y127.59 E-.46416
G1 X125.232 Y127.59 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.682 Y119.977 Z2.6 F42000
G1 X124.454 Y116.81 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X124.454 Y115.59 E.03749
G1 X129.974 Y115.59 E.16961
G1 X129.974 Y116.81 E.03749
G1 X124.514 Y116.81 E.16777
; WIPE_START
M204 S6000
G1 X124.454 Y115.59 E-.46416
G1 X125.232 Y115.59 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.6 I-1.194 J.236 P1  F42000
G1 X130.062 Y139.99 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X124.477 Y139.991 E.18526
G1 X124.477 Y129.609 E.34438
G1 X130.062 Y129.609 E.18526
G1 X130.062 Y139.93 E.34238
M204 S10000
G1 X130.469 Y140.398 F42000
G1 F8843.478
M204 S6000
G1 X124.07 Y140.398 E.21227
G1 X124.07 Y129.202 E.37139
G1 X130.469 Y129.202 E.21227
G1 X130.469 Y140.338 E.36938
M204 S250
G1 X130.855 Y140.648 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X130.675 Y140.79 I-.191 J-.058 E.00749
G1 X123.82 Y140.783 E.21062
G3 X123.678 Y140.59 I.061 J-.194 E.00788
G1 X123.685 Y115.353 E.77547
G3 X123.863 Y115.21 I.191 J.056 E.00747
G1 X130.712 Y115.216 E.21045
G3 X130.861 Y115.41 I-.045 J.189 E.00816
G1 X130.855 Y140.588 E.77365
; WIPE_START
M204 S6000
G1 X130.788 Y140.749 E-.06642
G1 X130.675 Y140.79 E-.04556
G1 X128.969 Y140.788 E-.64802
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


G1 X129.67 Y130.001 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X124.869 Y130.001 E.14751
G1 X124.869 Y139.599 E.2949
G1 X129.67 Y139.598 E.14751
G1 X129.67 Y130.061 E.29305
M204 S10000
G1 X129.293 Y130.378 F42000
G1 F9547.299
M204 S6000
G1 X125.246 Y130.378 E.12434
G1 X125.246 Y139.222 E.27173
G1 X129.293 Y139.221 E.12434
G1 X129.293 Y130.438 E.26987
M204 S10000
G1 X128.916 Y130.755 F42000
G1 F9547.299
M204 S6000
G1 X125.624 Y130.755 E.10117
G1 X125.624 Y138.845 E.24855
G1 X128.916 Y138.844 E.10117
G1 X128.916 Y130.815 E.2467
M204 S10000
G1 X128.539 Y131.132 F42000
G1 F9547.299
M204 S6000
G1 X126.001 Y131.132 E.078
G1 X126.001 Y138.467 E.22538
G1 X128.539 Y138.467 E.078
G1 X128.539 Y131.192 E.22353
M204 S10000
G1 X128.162 Y131.509 F42000
G1 F9547.299
M204 S6000
G1 X126.378 Y131.509 E.05482
G1 X126.378 Y138.09 E.20221
G1 X128.162 Y138.09 E.05482
G1 X128.162 Y131.569 E.20036
M204 S10000
G1 X127.785 Y131.887 F42000
G1 F9547.299
M204 S6000
G1 X126.755 Y131.887 E.03165
G1 X126.755 Y137.713 E.17903
G1 X127.785 Y137.713 E.03165
G1 X127.785 Y131.947 E.17719
M204 S10000
G1 X127.433 Y132.238 F42000
; LINE_WIDTH: 0.36946
G1 F11024.682
M204 S6000
M73 P42 R10
G1 X127.107 Y132.238 E.00869
G1 X127.107 Y137.361 E.13632
G1 X127.433 Y137.361 E.00869
G1 X127.433 Y132.298 E.13472
; WIPE_START
G1 X127.433 Y134.298 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.418 Y129.006 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.53858
G1 F7263.043
M204 S6000
G1 X130.418 Y127.394 E.0651
; WIPE_START
G1 X130.418 Y129.006 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.755 Y126.587 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.2503
G1 F15000
M204 S6000
G1 X129.755 Y117.813 E.14828
; WIPE_START
G1 X129.755 Y119.813 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.418 Y117.006 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.53858
G1 F7263.043
M204 S6000
G1 X130.418 Y115.406 E.06461
M204 S10000
G1 X124.066 Y115.406 F42000
; LINE_WIDTH: 0.42637
G1 F9388.447
M204 S6000
G1 X124.066 Y117.006 E.04998
; WIPE_START
G1 X124.066 Y115.406 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.728 Y117.813 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.13809
G1 F15000
M204 S6000
G1 X124.728 Y126.587 E.06805
; WIPE_START
G1 X124.728 Y124.587 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.066 Y127.394 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.42637
G1 F9388.447
M204 S6000
G1 X124.066 Y129.006 E.05037
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9388.447
G1 X124.066 Y127.394 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/72
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
M106 S201.45
; OBJECT_ID: 394
M204 S10000
G17
G3 Z2.6 I.136 J1.209 P1  F42000
G1 X129.448 Y126.791 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5151
M204 S6000
G1 X129.448 Y117.609 E.30457
G1 X130.07 Y117.609 E.02064
G1 X130.07 Y126.791 E.30457
G1 X129.508 Y126.791 E.01865
; WIPE_START
G1 F8843.478
G1 X129.495 Y124.791 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I-.438 J-1.135 P1  F42000
G1 X124.98 Y126.535 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F5151
M204 S6000
G1 X124.98 Y126.791 E.00849
G1 X124.485 Y126.791 E.01641
G1 X124.485 Y117.609 E.30457
G1 X124.98 Y117.609 E.01641
G1 X124.98 Y126.475 E.2941
M204 S10000
G1 X125.779 Y126.927 F42000
G1 F5151
M204 S6000
G1 X125.387 Y126.927 E.01301
G1 X125.387 Y117.473 E.31361
G1 X129.041 Y117.473 E.12121
G1 X129.041 Y126.927 E.31361
G1 X125.839 Y126.927 E.10622
M204 S250
G1 X125.779 Y126.535 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5151
M204 S5000
G1 X125.779 Y117.865 E.2664
G1 X128.649 Y117.865 E.08819
G1 X128.649 Y126.535 E.2664
G1 X125.839 Y126.535 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.825 Y124.535 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I-1.082 J-.557 P1  F42000
G1 X124.454 Y127.198 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5151
M204 S6000
G1 X124.078 Y127.198 E.01247
G1 X124.078 Y117.202 E.33158
G1 X130.477 Y117.202 E.21228
G1 X130.477 Y127.198 E.33158
G1 X124.514 Y127.198 E.19782
; WIPE_START
G1 F8843.478
G1 X124.078 Y127.198 E-.16565
G1 X124.078 Y125.634 E-.59435
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.454 Y128.81 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5151
M204 S5000
G1 X124.454 Y127.59 E.03749
M73 P43 R10
G1 X129.974 Y127.59 E.16961
G1 X129.974 Y128.81 E.03749
G1 X124.514 Y128.81 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y127.59 E-.46416
G1 X125.232 Y127.59 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.682 Y119.977 Z2.8 F42000
G1 X124.454 Y116.81 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F5151
M204 S5000
G1 X124.454 Y115.59 E.03749
G1 X129.974 Y115.59 E.16961
G1 X129.974 Y116.81 E.03749
G1 X124.514 Y116.81 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y115.59 E-.46416
G1 X125.232 Y115.59 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I-1.194 J.237 P1  F42000
G1 X130.07 Y139.99 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5151
M204 S6000
G1 X124.485 Y139.991 E.18527
G1 X124.485 Y129.609 E.34438
G1 X130.07 Y129.609 E.18527
G1 X130.07 Y139.93 E.34238
M204 S10000
G1 X130.477 Y140.398 F42000
G1 F5151
M204 S6000
G1 X124.078 Y140.398 E.21228
G1 X124.078 Y129.202 E.37139
G1 X130.477 Y129.202 E.21228
G1 X130.477 Y140.338 E.36938
M204 S250
G1 X130.863 Y140.648 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5151
M204 S5000
G3 X130.683 Y140.79 I-.188 J-.054 E.00749
G1 X123.828 Y140.783 E.21065
G3 X123.686 Y140.59 I.061 J-.194 E.00788
G1 X123.692 Y115.352 E.77549
G3 X123.871 Y115.21 I.192 J.059 E.00745
G1 X130.721 Y115.216 E.21048
G3 X130.869 Y115.41 I-.045 J.188 E.00813
G1 X130.863 Y140.588 E.77365
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.797 Y140.748 E-.06566
G1 X130.683 Y140.79 E-.04616
G1 X128.977 Y140.788 E-.64819
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


G1 X129.227 Y138.238 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Top surface
G1 F5151
M204 S2000
G1 X127.697 Y139.768 E.06648
G1 X127.163 Y139.768
G1 X129.262 Y137.669 E.09121
G1 X129.262 Y137.136
G1 X126.63 Y139.768 E.11439
G1 X126.215 Y139.65
G1 X129.262 Y136.603 E.13241
G1 X129.262 Y136.069
G1 X125.883 Y139.448 E.14683
G1 X125.613 Y139.186
G1 X129.262 Y135.536 E.15858
G1 X129.262 Y135.003
G1 X125.406 Y138.86 E.16759
G1 X125.249 Y138.483
G1 X129.262 Y134.47 E.1744
G1 X129.262 Y133.936
G1 X125.156 Y138.043 E.17845
G1 X125.15 Y137.516
G1 X129.262 Y133.403 E.1787
G1 X129.262 Y132.87
G1 X125.15 Y136.982 E.1787
G1 X125.15 Y136.449
G1 X129.262 Y132.337 E.1787
G1 X129.262 Y131.803
G1 X125.15 Y135.916 E.1787
G1 X125.15 Y135.383
G1 X129.262 Y131.27 E.1787
G1 X129.262 Y130.737
G1 X125.15 Y134.849 E.1787
G1 X125.15 Y134.316
G1 X129.262 Y130.204 E.1787
G1 X129.101 Y129.832
G1 X125.15 Y133.783 E.1717
G1 X125.15 Y133.25
G1 X128.568 Y129.832 E.14853
G1 X128.035 Y129.832
G1 X125.15 Y132.716 E.12536
G1 X125.15 Y132.183
G1 X127.502 Y129.832 E.10219
G1 X126.968 Y129.832
G1 X125.15 Y131.65 E.07901
G1 X125.15 Y131.117
G1 X126.435 Y129.832 E.05584
G1 X125.902 Y129.832
G1 X125.15 Y130.583 E.03267
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.902 Y129.832 E-.404
G1 X126.435 Y129.832 E-.20264
G1 X126.15 Y130.117 E-.15336
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.633 Y137.334 Z2.8 F42000
G1 X129.092 Y138.669 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.154278
G1 F5151
M204 S6000
G3 X128.921 Y138.911 I-4.704 J-3.16 E.00269
; LINE_WIDTH: 0.208673
G3 X128.782 Y139.082 I-3.157 J-2.407 E.00298
; LINE_WIDTH: 0.244145
G3 X128.457 Y139.408 I-2.242 J-1.917 E.00756
; LINE_WIDTH: 0.208662
G3 X128.286 Y139.546 I-2.598 J-3.043 E.00297
; LINE_WIDTH: 0.154302
G3 X128.044 Y139.718 I-3.364 J-4.481 E.00269
M204 S10000
G1 X125.515 Y139.017 F42000
; LINE_WIDTH: 0.0981583
G1 F5151
M204 S6000
G3 X125.438 Y138.919 I1.778 J-1.48 E.00056
M204 S10000
G1 X129.572 Y137.987 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.628438
G1 F5151
M204 S6000
G1 X129.574 Y130.165 E.3732
M204 S10000
G1 X129.572 Y137.987 F42000
; LINE_WIDTH: 0.609926
G1 F5151
M204 S6000
G1 X129.54 Y138.055 E.00348
; LINE_WIDTH: 0.567018
G1 X129.508 Y138.123 E.00321
; LINE_WIDTH: 0.52411
G1 X129.476 Y138.192 E.00295
; LINE_WIDTH: 0.481201
G1 X129.444 Y138.26 E.00269
; LINE_WIDTH: 0.438293
G1 X129.412 Y138.328 E.00242
; LINE_WIDTH: 0.416037
G1 X129.248 Y138.884 E.01763
; LINE_WIDTH: 0.485763
G1 X129.145 Y139.098 E.00858
; LINE_WIDTH: 0.546356
G1 X129.043 Y139.313 E.00975
G1 X128.826 Y139.533 E.0127
G1 X129.613 Y139.533 E.03229
; LINE_WIDTH: 0.528708
G1 X129.634 Y139.245 E.01144
; LINE_WIDTH: 0.485763
G1 X129.656 Y138.957 E.01043
; LINE_WIDTH: 0.4417
G1 X129.679 Y138.705 E.00822
; LINE_WIDTH: 0.39652
G1 X129.701 Y138.453 E.00728
; LINE_WIDTH: 0.395385
G1 X129.682 Y138.385 E.00203
; LINE_WIDTH: 0.438293
G1 X129.664 Y138.317 E.00227
; LINE_WIDTH: 0.481201
G1 X129.645 Y138.249 E.00252
; LINE_WIDTH: 0.52411
G1 X129.626 Y138.181 E.00277
; LINE_WIDTH: 0.567018
G1 X129.607 Y138.113 E.00301
; LINE_WIDTH: 0.609926
G1 X129.588 Y138.045 E.00326
; WIPE_START
G1 F6349.141
G1 X129.607 Y138.113 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.287 Y130.511 Z2.8 F42000
G1 X130.421 Y129.006 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.54643
G1 F5151
M204 S6000
G1 X130.421 Y127.394 E.06613
; WIPE_START
G1 F7149.809
G1 X130.421 Y129.006 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.759 Y126.587 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.25815
G1 F5151
M204 S6000
G1 X129.759 Y117.813 E.15389
; WIPE_START
G1 F15000
G1 X129.759 Y119.813 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.421 Y117.006 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.54643
G1 F5151
M204 S6000
G1 X130.421 Y115.406 E.06563
; WIPE_START
G1 F7149.809
G1 X130.421 Y117.006 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I-.171 J-1.205 P1  F42000
G1 X124.732 Y117.813 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.13056
G1 F5151
M204 S6000
G1 X124.732 Y126.587 E.06266
; WIPE_START
G1 F15000
G1 X124.732 Y124.587 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.07 Y127.394 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.41884
G1 F5151
M204 S6000
G1 X124.07 Y129.006 E.04938
; WIPE_START
G1 F9576.505
G1 X124.07 Y127.394 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.91 Y130.034 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.48782
G1 F5151
M204 S6000
G1 X124.912 Y138 E.28879
M204 S10000
G1 X124.914 Y138.069 F42000
; LINE_WIDTH: 0.498274
G1 F5151
M204 S6000
G3 X124.916 Y139.559 I-174.225 J1 E.05531
G1 X125.631 Y139.559 E.02653
G1 X125.281 Y139.137 E.02034
G1 X125.035 Y138.614 E.02146
G1 X124.927 Y138.127 E.0185
; WIPE_START
G1 F7905.944
G1 X125.035 Y138.614 E-.18948
G1 X125.281 Y139.137 E-.21977
G1 X125.631 Y139.559 E-.20834
G1 X125.257 Y139.559 E-.14241
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.855 Y131.937 Z2.8 F42000
G1 X124.07 Y117.006 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.41884
G1 F5151
M204 S6000
G1 X124.07 Y115.406 E.049
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9576.505
G1 X124.07 Y117.006 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/72
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z2.8 I-1.201 J.196 P1  F42000
G1 X127.51 Y138.135 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5073
M204 S5000
G1 X126.903 Y138.135 E.01865
G1 X126.903 Y129.465 E.2664
G1 X127.51 Y129.465 E.01865
G1 X127.51 Y138.075 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.903 Y138.135 E-.23175
G1 X126.903 Y136.745 E-.52826
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.652 Y129.452 Z3 F42000
G1 X124.454 Y128.81 Z3
G1 Z2.6
G1 E.8 F1800
G1 F5073
M204 S5000
G1 X124.454 Y127.59 E.03749
G1 X129.974 Y127.59 E.16961
G1 X129.974 Y128.81 E.03749
G1 X124.514 Y128.81 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y127.59 E-.46416
G1 X125.232 Y127.59 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I.227 J1.196 P1  F42000
G1 X129.448 Y126.791 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5073
M204 S6000
G1 X129.448 Y117.609 E.30457
G1 X130.078 Y117.609 E.0209
G1 X130.078 Y126.791 E.30457
G1 X129.508 Y126.791 E.01891
; WIPE_START
G1 F8843.478
G1 X129.495 Y124.791 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I-.438 J-1.135 P1  F42000
G1 X124.98 Y126.535 Z3
M73 P44 R10
G1 Z2.6
G1 E.8 F1800
G1 F5073
M204 S6000
G1 X124.98 Y126.791 E.00849
G1 X124.492 Y126.791 E.01616
G1 X124.492 Y117.609 E.30457
G1 X124.98 Y117.609 E.01616
G1 X124.98 Y126.475 E.2941
M204 S10000
G1 X125.779 Y126.927 F42000
G1 F5073
M204 S6000
G1 X125.387 Y126.927 E.01301
G1 X125.387 Y117.473 E.31361
G1 X129.041 Y117.473 E.12121
G1 X129.041 Y126.927 E.31361
G1 X125.839 Y126.927 E.10622
M204 S250
G1 X125.779 Y126.535 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5073
M204 S5000
G1 X125.779 Y117.865 E.2664
G1 X128.649 Y117.865 E.08819
G1 X128.649 Y126.535 E.2664
G1 X125.839 Y126.535 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.825 Y124.535 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I-1.082 J-.557 P1  F42000
G1 X124.454 Y127.198 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5073
M204 S6000
G1 X124.085 Y127.198 E.01222
G1 X124.085 Y117.202 E.33158
G1 X130.485 Y117.202 E.21229
G1 X130.485 Y127.198 E.33158
G1 X124.514 Y127.198 E.19808
; WIPE_START
G1 F8843.478
G1 X124.085 Y127.198 E-.16279
G1 X124.085 Y125.626 E-.59721
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.404 Y118.001 Z3 F42000
G1 X124.454 Y116.81 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5073
M204 S5000
G1 X124.454 Y115.59 E.03749
G1 X129.974 Y115.59 E.16961
G1 X129.974 Y116.81 E.03749
G1 X124.514 Y116.81 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y115.59 E-.46416
G1 X125.232 Y115.59 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I-1.194 J.237 P1  F42000
G1 X130.078 Y139.99 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5073
M204 S6000
G1 X124.492 Y139.991 E.18528
G1 X124.492 Y139.654 E.01117
G1 X129.082 Y139.654 E.15224
G1 X129.082 Y129.609 E.33321
G1 X130.078 Y129.609 E.03304
G1 X130.078 Y139.93 E.34238
M204 S10000
G1 X130.485 Y140.398 F42000
G1 F5073
M204 S6000
G1 X124.085 Y140.398 E.21229
G1 X124.085 Y129.202 E.37139
G1 X125.044 Y129.202 E.03181
G1 X125.044 Y139.247 E.33321
G1 X128.675 Y139.247 E.12043
G1 X128.675 Y129.202 E.33321
G1 X130.485 Y129.202 E.06005
G1 X130.485 Y140.338 E.36938
M204 S250
G1 X130.87 Y140.648 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5073
M204 S5000
G3 X130.691 Y140.79 I-.19 J-.057 E.00748
G1 X123.835 Y140.783 E.21066
G3 X123.693 Y140.59 I.061 J-.194 E.00788
G1 X123.693 Y115.408 E.77379
G3 X123.879 Y115.21 I.196 J-.001 E.00918
G1 X130.733 Y115.217 E.21061
G3 X130.877 Y115.41 I-.05 J.187 E.008
G1 X130.87 Y140.588 E.77365
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.804 Y140.749 E-.06626
G1 X130.691 Y140.79 E-.04554
G1 X128.985 Y140.788 E-.6482
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


G1 X129.58 Y139.787 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.63189
G1 F5073
M204 S6000
G1 X129.58 Y129.813 E.4787
; WIPE_START
G1 F6112.366
G1 X129.58 Y131.813 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.425 Y129.006 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.55428
G1 F5073
M204 S6000
G1 X130.425 Y127.394 E.06717
; WIPE_START
G1 F7040.05
G1 X130.425 Y129.006 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.763 Y126.587 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.266
G1 F5073
M204 S6000
G1 X129.763 Y117.813 E.15951
; WIPE_START
G1 F15000
G1 X129.763 Y119.813 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.425 Y117.006 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.55428
G1 F5073
M204 S6000
G1 X130.425 Y115.406 E.06665
; WIPE_START
G1 F7040.05
G1 X130.425 Y117.006 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I-.171 J-1.205 P1  F42000
G1 X124.736 Y117.813 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.12303
G1 F5073
M204 S6000
G1 X124.736 Y126.587 E.05728
; WIPE_START
G1 F15000
G1 X124.736 Y124.587 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.073 Y127.394 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.41131
G1 F5073
M204 S6000
G1 X124.073 Y129.006 E.04839
M204 S10000
G1 X124.565 Y129.406 F42000
; LINE_WIDTH: 0.5949
G1 F5073
M204 S6000
G1 X124.565 Y139.45 E.45181
; WIPE_START
G1 F6521.976
G1 X124.565 Y137.45 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.349 Y138.921 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F5073
M204 S6000
G1 X128.408 Y138.417 E.01407
G1 X128.384 Y138.128 E.00802
M204 S10000
G1 X127.891 Y129.192 F42000
; LINE_WIDTH: 0.42943
G1 F5073
M204 S6000
G1 X127.891 Y137.436 E.25964
G1 X128.239 Y137.644 E.01275
G1 X128.278 Y137.686 E.00182
G1 X128.278 Y129.192 E.26753
G1 X127.951 Y129.192 E.01028
M204 S10000
G1 X126.084 Y129.017 F42000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5073
M204 S2000
G1 X126.695 Y129.628 E.02655
G1 X126.695 Y130.162
G1 X125.551 Y129.017 E.04972
G1 X125.267 Y129.266
G1 X126.695 Y130.695 E.06208
G1 X126.695 Y131.228
G1 X125.267 Y129.8 E.06208
G1 X125.267 Y130.333
G1 X126.695 Y131.761 E.06208
G1 X126.695 Y132.295
G1 X125.267 Y130.866 E.06208
G1 X125.267 Y131.399
G1 X126.695 Y132.828 E.06208
G1 X126.695 Y133.361
G1 X125.267 Y131.933 E.06208
G1 X125.267 Y132.466
G1 X126.695 Y133.894 E.06208
G1 X126.695 Y134.428
G1 X125.267 Y132.999 E.06208
G1 X125.267 Y133.532
G1 X126.695 Y134.961 E.06208
G1 X126.695 Y135.494
G1 X125.267 Y134.066 E.06208
G1 X125.267 Y134.599
G1 X126.695 Y136.027 E.06208
G1 X126.695 Y136.561
G1 X125.267 Y135.132 E.06208
G1 X125.267 Y135.665
G1 X126.695 Y137.094 E.06208
G1 X126.695 Y137.627
G1 X125.267 Y136.199 E.06208
G1 X125.267 Y136.732
G1 X126.695 Y138.16 E.06208
G1 X127.717 Y138.116
G1 X128.289 Y138.688 E.02487
G1 X128.093 Y139.025
G1 X127.411 Y138.342 E.02964
G1 X126.877 Y138.342
G1 X127.559 Y139.025 E.02964
G1 X127.026 Y139.025
G1 X125.267 Y137.265 E.07645
G1 X125.267 Y137.798
G1 X126.493 Y139.025 E.05328
G1 X125.96 Y139.025
G1 X125.267 Y138.332 E.0301
M204 S10000
G1 X128.337 Y138.373 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.308778
G1 F5073
M204 S6000
G1 X128.21 Y138.184 E.00492
; LINE_WIDTH: 0.350239
G2 X127.906 Y137.828 I-1.033 J.573 E.01181
; LINE_WIDTH: 0.37577
G1 X127.867 Y137.814 E.00111
; LINE_WIDTH: 0.361316
G1 X127.848 Y137.836 E.00076
; LINE_WIDTH: 0.322318
G1 X127.828 Y137.858 E.00067
; LINE_WIDTH: 0.28332
G1 X127.809 Y137.88 E.00058
; LINE_WIDTH: 0.250112
G1 X127.8 Y137.902 E.00039
; LINE_WIDTH: 0.222691
G1 X127.792 Y137.924 E.00034
; WIPE_START
G1 F15000
G1 X127.8 Y137.902 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.798 Y138.421 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.121238
G1 F5073
M204 S6000
G3 X126.585 Y138.271 I.077 J-.335 E.00171
; WIPE_START
G1 F15000
G1 X126.705 Y138.385 E-.47478
G1 X126.798 Y138.421 E-.28522
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.835 Y130.85 Z3 F42000
G1 X124.073 Y117.006 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.41131
G1 F5073
M204 S6000
G1 X124.073 Y115.406 E.04802
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9772.252
G1 X124.073 Y117.006 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/72
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z3 I-1.201 J.198 P1  F42000
G1 X127.563 Y138.135 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4791
M204 S5000
G1 X126.156 Y138.135 E.04323
G1 X126.156 Y129.465 E.2664
M73 P45 R10
G1 X127.563 Y129.465 E.04323
G1 X127.563 Y138.075 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.156 Y138.135 E-.53511
G1 X126.156 Y137.543 E-.2249
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.696 Y130.052 Z3.2 F42000
G1 X124.454 Y128.81 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F4791
M204 S5000
G1 X124.454 Y127.59 E.03749
G1 X129.974 Y127.59 E.16961
G1 X129.974 Y128.81 E.03749
G1 X124.514 Y128.81 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y127.59 E-.46416
G1 X125.232 Y127.59 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.448 Y126.791 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4791
M204 S6000
G1 X129.448 Y117.609 E.30457
G1 X130.086 Y117.609 E.02116
G1 X130.086 Y126.791 E.30457
G1 X129.508 Y126.791 E.01917
; WIPE_START
G1 F8843.478
G1 X129.495 Y124.791 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.98 Y126.535 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F4791
M204 S6000
G1 X124.98 Y126.791 E.00849
G1 X124.5 Y126.791 E.01591
G1 X124.5 Y117.609 E.30457
G1 X124.98 Y117.609 E.01591
G1 X124.98 Y126.475 E.2941
M204 S10000
G1 X125.779 Y126.927 F42000
G1 F4791
M204 S6000
G1 X125.387 Y126.927 E.01301
G1 X125.387 Y117.473 E.31361
G1 X129.041 Y117.473 E.12121
G1 X129.041 Y126.927 E.31361
G1 X125.839 Y126.927 E.10622
M204 S250
G1 X125.779 Y126.535 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4791
M204 S5000
G1 X125.779 Y117.865 E.2664
G1 X128.649 Y117.865 E.08819
G1 X128.649 Y126.535 E.2664
G1 X125.839 Y126.535 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.825 Y124.535 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.454 Y127.198 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4791
M204 S6000
G1 X124.093 Y127.198 E.01197
G1 X124.093 Y117.202 E.33158
G1 X130.493 Y117.202 E.2123
G1 X130.493 Y127.198 E.33158
G1 X124.514 Y127.198 E.19834
; WIPE_START
G1 F8843.478
G1 X124.093 Y127.198 E-.15993
G1 X124.093 Y125.619 E-.60007
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.405 Y117.993 Z3.2 F42000
G1 X124.454 Y116.81 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4791
M204 S5000
G1 X124.454 Y115.59 E.03749
G1 X129.974 Y115.59 E.16961
G1 X129.974 Y116.81 E.03749
G1 X124.514 Y116.81 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y115.59 E-.46416
G1 X125.232 Y115.59 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.721 Y123.076 Z3.2 F42000
G1 X130.086 Y139.99 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4791
M204 S6000
G1 X124.5 Y139.991 E.1853
G1 X124.5 Y139.654 E.01117
G1 X128.336 Y139.654 E.12723
G1 X128.336 Y138.934 E.02388
G1 X128.362 Y138.934 E.00089
G1 X128.362 Y129.609 E.30933
G1 X130.086 Y129.609 E.05717
G1 X130.086 Y139.93 E.34238
M204 S10000
G1 X130.493 Y140.398 F42000
G1 F4791
M204 S6000
G1 X124.093 Y140.398 E.2123
G1 X124.093 Y139.247 E.03818
G1 X127.928 Y139.247 E.12723
G1 X127.928 Y138.527 E.02388
G1 X127.955 Y138.527 E.00089
G1 X127.955 Y129.202 E.30933
G1 X130.493 Y129.202 E.08418
G1 X130.493 Y140.338 E.36938
M204 S250
G1 X130.878 Y140.648 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4791
M204 S5000
G3 X130.701 Y140.79 I-.194 J-.061 E.0074
G1 X123.843 Y140.783 E.21073
G3 X123.701 Y140.59 I.061 J-.194 E.00788
G1 X123.701 Y115.408 E.77379
G3 X123.887 Y115.21 I.196 J-.001 E.00919
G1 X130.696 Y115.21 E.20922
G3 X130.885 Y115.41 I-.009 J.198 E.00934
G1 X130.878 Y140.588 E.77365
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.813 Y140.748 E-.06555
G1 X130.701 Y140.79 E-.04554
G1 X128.993 Y140.788 E-.64891
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


G1 X127.602 Y138.921 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F4791
M204 S6000
G1 X127.648 Y138.454 E.013
M204 S10000
G1 X126.841 Y139.025 F42000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F4791
M204 S2000
G1 X127.523 Y138.342 E.02964
G1 X126.99 Y138.342
G1 X126.307 Y139.025 E.02964
G1 X125.774 Y139.025
G1 X126.456 Y138.342 E.02964
G1 X125.949 Y138.316
G1 X125.241 Y139.025 E.03077
G1 X124.708 Y139.025
G1 X125.949 Y137.783 E.05394
G1 X125.949 Y137.25
G1 X124.52 Y138.678 E.06208
G1 X124.52 Y138.145
G1 X125.949 Y136.717 E.06208
G1 X125.949 Y136.183
G1 X124.52 Y137.612 E.06208
G1 X124.52 Y137.079
G1 X125.949 Y135.65 E.06208
G1 X125.949 Y135.117
G1 X124.52 Y136.545 E.06208
G1 X124.52 Y136.012
G1 X125.949 Y134.584 E.06208
G1 X125.949 Y134.05
G1 X124.52 Y135.479 E.06208
G1 X124.52 Y134.946
G1 X125.949 Y133.517 E.06208
G1 X125.949 Y132.984
G1 X124.52 Y134.412 E.06208
G1 X124.52 Y133.879
G1 X125.949 Y132.451 E.06208
G1 X125.949 Y131.917
G1 X124.52 Y133.346 E.06208
G1 X124.52 Y132.813
G1 X125.949 Y131.384 E.06208
G1 X125.949 Y130.851
G1 X124.52 Y132.279 E.06208
G1 X124.52 Y131.746
G1 X125.949 Y130.318 E.06208
G1 X125.949 Y129.784
G1 X124.52 Y131.213 E.06208
G1 X124.52 Y130.68
G1 X125.949 Y129.251 E.06208
G1 X125.649 Y129.017
G1 X124.52 Y130.146 E.04906
G1 X124.52 Y129.613
G1 X125.116 Y129.017 E.02589
M204 S10000
G1 X124.544 Y138.702 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.128048
G1 F4791
M204 S6000
G1 X124.544 Y139.043 E.00237
M204 S10000
G1 X125.968 Y138.125 F42000
; LINE_WIDTH: 0.0827019
G1 F4791
M204 S6000
G1 X125.937 Y138.106 E.00012
; LINE_WIDTH: 0.109538
G1 X125.857 Y138.224 E.00077
M204 S10000
G1 X127.59 Y138.575 F42000
; LINE_WIDTH: 0.241361
G1 F4791
M204 S6000
G3 X127.277 Y139.043 I-4.402 J-2.604 E.00912
M204 S10000
G1 X124.195 Y139.051 F42000
; LINE_WIDTH: 0.6401
G1 F4791
M204 S6000
G1 X124.195 Y129.298 E.4746
; LINE_WIDTH: 0.616468
G1 X124.172 Y129.24 E.00294
; LINE_WIDTH: 0.569204
G1 X124.148 Y129.181 E.0027
; LINE_WIDTH: 0.52194
G1 X124.124 Y129.123 E.00246
; LINE_WIDTH: 0.474676
G1 X124.101 Y129.064 E.00222
; LINE_WIDTH: 0.404669
G1 X124.077 Y129.006 E.00186
G1 X124.077 Y127.394 E.04752
; WIPE_START
G1 F9951.653
G1 X124.077 Y129.006 E-.73141
G1 X124.101 Y129.064 E-.02859
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.74 Y126.587 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.1155
G1 F4791
M204 S6000
G1 X124.74 Y117.813 E.0519
; WIPE_START
G1 F15000
G1 X124.74 Y119.813 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.077 Y117.006 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.40378
G1 F4791
M204 S6000
G1 X124.077 Y115.406 E.04704
; WIPE_START
G1 F9976.168
G1 X124.077 Y117.006 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.767 Y117.813 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.27384
G1 F4791
M204 S6000
G1 X129.767 Y126.587 E.16511
; WIPE_START
G1 F15000
G1 X129.767 Y124.587 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.429 Y127.394 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.56212
G1 F4791
M204 S6000
G1 X130.429 Y129.006 E.0682
; WIPE_START
G1 F6933.745
G1 X130.429 Y127.394 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.754 Y130.001 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F4791
M204 S6000
G1 X128.754 Y139.138 E.28073
G1 X128.728 Y139.599 E.01418
G1 X129.694 Y139.598 E.02969
G1 X129.694 Y130.001 E.29489
G1 X128.814 Y130.001 E.02702
M204 S10000
G1 X129.224 Y139.129 F42000
; LINE_WIDTH: 0.60514
G1 F4791
M204 S6000
G1 X129.224 Y130.531 E.39391
; WIPE_START
G1 F6403.188
G1 X129.224 Y132.531 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.494 Y129.031 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.536315
G1 F4791
M204 S6000
G1 X124.394 Y129.12 E.00537
; LINE_WIDTH: 0.577826
G1 X124.295 Y129.209 E.00582
; LINE_WIDTH: 0.619336
G1 X124.195 Y129.298 E.00627
; WIPE_START
G1 F6245.493
G1 X124.295 Y129.209 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.723 Y122.39 Z3.2 F42000
G1 X130.429 Y117.006 Z3.2
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.56212
G1 F4791
M204 S6000
G1 X130.429 Y115.406 E.06767
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6933.745
G1 X130.429 Y117.006 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/72
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z3.2 I-1.211 J-.121 P1  F42000
G1 X129.448 Y126.791 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4704
M204 S6000
M73 P46 R10
G1 X129.448 Y117.609 E.30457
G1 X130.094 Y117.609 E.02142
G1 X130.094 Y126.791 E.30457
G1 X129.508 Y126.791 E.01943
; WIPE_START
G1 F8843.478
G1 X129.495 Y124.791 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.98 Y126.535 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F4704
M204 S6000
G1 X124.98 Y126.791 E.00849
G1 X124.507 Y126.791 E.01566
G1 X124.507 Y117.609 E.30457
G1 X124.98 Y117.609 E.01566
G1 X124.98 Y126.475 E.2941
M204 S10000
G1 X125.779 Y126.927 F42000
G1 F4704
M204 S6000
G1 X125.387 Y126.927 E.01301
G1 X125.387 Y117.473 E.31361
G1 X129.041 Y117.473 E.12121
G1 X129.041 Y126.927 E.31361
G1 X125.839 Y126.927 E.10622
M204 S250
G1 X125.779 Y126.535 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4704
M204 S5000
G1 X125.779 Y117.865 E.2664
G1 X128.649 Y117.865 E.08819
G1 X128.649 Y126.535 E.2664
G1 X125.839 Y126.535 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.825 Y124.535 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.454 Y127.198 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4704
M204 S6000
G1 X124.1 Y127.198 E.01172
G1 X124.1 Y117.202 E.33158
G1 X130.501 Y117.202 E.21231
G1 X130.501 Y127.198 E.33158
G1 X124.514 Y127.198 E.1986
; WIPE_START
G1 F8843.478
G1 X124.1 Y127.198 E-.15707
G1 X124.1 Y125.611 E-.60293
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.164 Y132.96 Z3.4 F42000
G1 X127.617 Y138.135 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4704
M204 S5000
G1 X125.41 Y138.135 E.06781
G1 X125.41 Y129.465 E.2664
G1 X127.617 Y129.465 E.06781
G1 X127.617 Y138.075 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.618 Y138.129 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.672 Y130.556 Z3.4 F42000
G1 X124.454 Y128.81 Z3.4
G1 Z3
G1 E.8 F1800
G1 F4704
M204 S5000
G1 X124.454 Y127.59 E.03749
G1 X129.974 Y127.59 E.16961
G1 X129.974 Y128.81 E.03749
G1 X124.514 Y128.81 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y127.59 E-.46416
G1 X125.232 Y127.59 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.682 Y119.977 Z3.4 F42000
G1 X124.454 Y116.81 Z3.4
G1 Z3
G1 E.8 F1800
G1 F4704
M204 S5000
G1 X124.454 Y115.59 E.03749
G1 X129.974 Y115.59 E.16961
G1 X129.974 Y116.81 E.03749
G1 X124.514 Y116.81 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y115.59 E-.46416
G1 X125.232 Y115.59 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.724 Y123.075 Z3.4 F42000
G1 X130.094 Y139.99 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4704
M204 S6000
G1 X124.507 Y139.991 E.18531
G1 X124.507 Y139.654 E.01117
G1 X127.589 Y139.654 E.10223
G1 X127.589 Y138.934 E.02388
G1 X128.416 Y138.934 E.02743
G1 X128.416 Y129.609 E.30933
G1 X130.094 Y129.609 E.05565
G1 X130.094 Y139.93 E.34238
M204 S10000
G1 X130.501 Y140.398 F42000
G1 F4704
M204 S6000
G1 X124.1 Y140.398 E.21231
G1 X124.1 Y139.247 E.03818
G1 X127.182 Y139.247 E.10223
G1 X127.182 Y138.527 E.02388
G1 X128.009 Y138.527 E.02743
G1 X128.009 Y129.202 E.30933
G1 X130.501 Y129.202 E.08266
G1 X130.501 Y140.338 E.36938
M204 S250
G1 X130.886 Y140.648 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4704
M204 S5000
G3 X130.706 Y140.79 I-.188 J-.054 E.00751
G1 X123.85 Y140.783 E.21066
G3 X123.708 Y140.59 I.057 J-.191 E.00791
G1 X123.708 Y115.408 E.77379
G3 X123.894 Y115.21 I.196 J-.001 E.0092
G1 X130.705 Y115.21 E.20927
G3 X130.893 Y115.41 I-.01 J.198 E.0093
G1 X130.886 Y140.588 E.77365
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.821 Y140.748 E-.06561
G1 X130.706 Y140.79 E-.04643
G1 X129.001 Y140.788 E-.64796
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


G1 X126.856 Y138.921 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F4704
M204 S6000
G1 X126.902 Y138.454 E.013
; WIPE_START
G1 F10588.235
G1 X126.856 Y138.921 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.488 Y131.465 Z3.4 F42000
G1 X128.808 Y130.001 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.41999
G1 F4704
M204 S6000
G1 X128.808 Y139.142 E.28086
; LINE_WIDTH: 0.406895
G1 X128.714 Y139.221 E.00365
; LINE_WIDTH: 0.368523
G1 X128.62 Y139.3 E.00326
G1 X127.955 Y139.3 E.01763
G1 X127.955 Y139.625 E.00862
G1 X128.62 Y139.625 E.01763
; LINE_WIDTH: 0.380705
G1 X128.937 Y139.612 E.00875
; LINE_WIDTH: 0.419619
G3 X129.702 Y139.598 I.541 J9.264 E.02348
G1 X129.702 Y130.001 E.2946
G1 X128.868 Y130.001 E.02559
M204 S10000
G1 X129.255 Y139.152 F42000
; LINE_WIDTH: 0.55948
G1 F4704
M204 S6000
G1 X129.255 Y130.508 E.36384
; WIPE_START
G1 F6969.181
G1 X129.255 Y132.508 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.433 Y129.006 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.56997
G1 F4704
M204 S6000
G1 X130.433 Y127.394 E.06923
; WIPE_START
G1 F6830.472
G1 X130.433 Y129.006 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.771 Y126.587 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.28169
G1 F4704
M204 S6000
G1 X129.771 Y117.813 E.17073
; WIPE_START
G1 F15000
G1 X129.771 Y119.813 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.433 Y117.006 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.56997
G1 F4704
M204 S6000
G1 X130.433 Y115.406 E.0687
; WIPE_START
G1 F6830.472
G1 X130.433 Y117.006 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.743 Y117.813 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.10797
G1 F4704
M204 S6000
G1 X124.743 Y126.587 E.04651
; WIPE_START
G1 F15000
G1 X124.743 Y124.587 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.081 Y127.394 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.39625
G1 F4704
M204 S6000
G1 X124.081 Y128.549 E.03325
M204 S10000
G1 X124.485 Y129.017 F42000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F4704
M204 S2000
G1 X125.203 Y129.735 E.0312
G1 X125.203 Y130.269
G1 X123.951 Y129.017 E.05437
G1 X123.916 Y129.515
G1 X125.203 Y130.802 E.05592
G1 X125.203 Y131.335
G1 X123.916 Y130.048 E.05592
G1 X123.916 Y130.581
G1 X125.203 Y131.868 E.05592
G1 X125.203 Y132.402
G1 X123.916 Y131.115 E.05592
G1 X123.916 Y131.648
G1 X125.203 Y132.935 E.05592
G1 X125.203 Y133.468
G1 X123.916 Y132.181 E.05592
G1 X123.916 Y132.715
G1 X125.203 Y134.001 E.05592
G1 X125.203 Y134.535
G1 X123.916 Y133.248 E.05592
G1 X123.916 Y133.781
G1 X125.203 Y135.068 E.05592
G1 X125.203 Y135.601
G1 X123.916 Y134.314 E.05592
G1 X123.916 Y134.848
G1 X125.203 Y136.134 E.05592
G1 X125.203 Y136.668
G1 X123.916 Y135.381 E.05592
G1 X123.916 Y135.914
G1 X125.203 Y137.201 E.05592
G1 X125.203 Y137.734
G1 X123.916 Y136.447 E.05592
G1 X123.916 Y136.981
G1 X125.203 Y138.267 E.05592
G1 X126.344 Y138.342
G1 X126.771 Y138.77 E.01857
G1 X126.493 Y139.025
G1 X125.811 Y138.342 E.02964
G1 X125.278 Y138.342
G1 X125.96 Y139.025 E.02964
G1 X125.426 Y139.025
G1 X123.916 Y137.514 E.06565
G1 X123.916 Y138.047
G1 X124.893 Y139.025 E.04247
G1 X124.36 Y139.025
G1 X123.916 Y138.58 E.0193
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.36 Y139.025 E-.2387
G1 X124.893 Y139.025 E-.20264
G1 X124.3 Y138.432 E-.31866
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.419 Y131.099 Z3.4 F42000
G1 X126.986 Y129.138 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.30586
G1 F4704
M204 S6000
G1 X127.813 Y129.138 E.01771
; WIPE_START
G1 F13691.336
G1 X126.986 Y129.138 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.209 Y121.715 Z3.4 F42000
G1 X124.081 Y117.006 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.39625
M73 P47 R10
G1 F4704
M204 S6000
G1 X124.081 Y115.406 E.04605
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10188.775
G1 X124.081 Y117.006 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/72
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z3.4 I-1.067 J.585 P1  F42000
G1 X129.448 Y126.791 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4298
M204 S6000
G1 X129.448 Y117.609 E.30457
G1 X130.105 Y117.609 E.0218
G1 X130.105 Y126.791 E.30457
G1 X129.508 Y126.791 E.01981
; WIPE_START
G1 F8843.478
G1 X129.495 Y124.791 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.98 Y126.535 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
G1 F4298
M204 S6000
G1 X124.98 Y126.791 E.00849
G1 X124.515 Y126.791 E.01541
G1 X124.515 Y117.609 E.30457
G1 X124.98 Y117.609 E.01541
G1 X124.98 Y126.475 E.2941
M204 S10000
G1 X125.779 Y126.927 F42000
G1 F4298
M204 S6000
G1 X125.387 Y126.927 E.01301
G1 X125.387 Y117.473 E.31361
G1 X129.041 Y117.473 E.12121
G1 X129.041 Y126.927 E.31361
G1 X125.839 Y126.927 E.10622
M204 S250
G1 X125.779 Y126.535 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4298
M204 S5000
G1 X125.779 Y117.865 E.2664
G1 X128.649 Y117.865 E.08819
G1 X128.649 Y126.535 E.2664
G1 X125.839 Y126.535 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.825 Y124.535 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.454 Y127.198 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4298
M204 S6000
G1 X124.108 Y127.198 E.01147
G1 X124.108 Y117.202 E.33158
G1 X130.512 Y117.202 E.21244
G1 X130.512 Y127.198 E.33158
G1 X124.514 Y127.198 E.19898
; WIPE_START
G1 F8843.478
G1 X124.108 Y127.198 E-.15421
G1 X124.108 Y125.604 E-.60579
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.454 Y128.81 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4298
M204 S5000
G1 X124.454 Y127.59 E.03749
G1 X129.974 Y127.59 E.16961
G1 X129.974 Y128.81 E.03749
G1 X124.514 Y128.81 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y127.59 E-.46416
G1 X125.232 Y127.59 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.952 Y135.026 Z3.6 F42000
G1 X127.67 Y138.135 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F4298
M204 S5000
G1 X124.714 Y138.135 E.09084
G1 X124.714 Y129.465 E.2664
G1 X127.67 Y129.465 E.09084
G1 X127.67 Y138.075 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.671 Y138.116 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.105 Y139.99 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4298
M204 S6000
G1 X124.515 Y139.991 E.18543
G1 X124.515 Y138.934 E.03505
G1 X128.47 Y138.934 E.13118
G1 X128.47 Y129.609 E.30933
G1 X130.105 Y129.609 E.05425
G1 X130.105 Y139.93 E.34238
M204 S10000
G1 X130.512 Y140.398 F42000
G1 F4298
M204 S6000
G1 X124.108 Y140.398 E.21244
G1 X124.108 Y138.527 E.06206
G1 X128.063 Y138.527 E.13118
G1 X128.063 Y129.202 E.30933
G1 X130.512 Y129.202 E.08126
G1 X130.512 Y140.338 E.36938
; WIPE_START
G1 F8843.478
G1 X128.512 Y140.356 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.216 Y132.835 Z3.6 F42000
G1 X124.454 Y116.81 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4298
M204 S5000
G1 X124.454 Y115.59 E.03749
G1 X129.974 Y115.59 E.16961
G1 X129.974 Y116.81 E.03749
G1 X124.514 Y116.81 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y115.59 E-.46416
G1 X125.232 Y115.59 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.915 Y123.035 Z3.6 F42000
G1 X130.897 Y140.648 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F4298
M204 S5000
G3 X130.717 Y140.79 I-.192 J-.059 E.00751
G1 X123.858 Y140.783 E.21075
G3 X123.716 Y140.59 I.061 J-.194 E.00788
G1 X123.716 Y115.407 E.77379
G3 X123.902 Y115.21 I.196 J-.001 E.00921
G1 X130.716 Y115.21 E.20936
G3 X130.904 Y115.41 I-.01 J.198 E.00931
G1 X130.897 Y140.588 E.77365
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.83 Y140.749 E-.06631
G1 X130.717 Y140.79 E-.0459
G1 X129.012 Y140.788 E-.64779
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


G1 X128.673 Y139.462 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692412
G1 F4298
M204 S6000
G1 X124.718 Y139.462 E.20929
; WIPE_START
G1 F5542.799
G1 X126.718 Y139.462 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.215 Y138.331 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.64899
G1 F4298
M204 S6000
G1 X124.215 Y129.306 E.44571
G1 X124.235 Y129.288 E.00135
; LINE_WIDTH: 0.588879
G1 X124.255 Y129.269 E.00122
; LINE_WIDTH: 0.543829
G1 X124.301 Y129.245 E.00212
; LINE_WIDTH: 0.499165
G1 X124.344 Y129.223 E.0018
; LINE_WIDTH: 0.456209
G1 X124.388 Y129.202 E.00163
; LINE_WIDTH: 0.413252
G1 X124.431 Y129.18 E.00146
; LINE_WIDTH: 0.370295
G1 X124.475 Y129.159 E.00129
; LINE_WIDTH: 0.327339
G1 X124.518 Y129.138 E.00112
; LINE_WIDTH: 0.30586
G1 X127.866 Y129.138 E.07174
; WIPE_START
G1 F13691.336
G1 X125.866 Y129.138 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.862 Y130.001 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F4298
M204 S6000
G1 X128.862 Y138.724 E.26802
G1 X129.003 Y138.772 E.00458
; LINE_WIDTH: 0.442557
G1 X129.046 Y138.819 E.00208
; LINE_WIDTH: 0.48769
G1 X129.089 Y138.866 E.00231
; LINE_WIDTH: 0.55459
G1 X129.133 Y138.912 E.00266
G1 X129.133 Y139.531 E.02578
G1 X129.645 Y139.531 E.02137
G1 X129.645 Y138.912 E.02578
; LINE_WIDTH: 0.532824
G1 X129.668 Y138.76 E.00614
; LINE_WIDTH: 0.48769
G1 X129.69 Y138.608 E.00558
; LINE_WIDTH: 0.42036
G1 X129.713 Y138.456 E.00473
G1 X129.713 Y130.001 E.26004
G1 X128.922 Y130.001 E.02434
M204 S10000
G1 X129.287 Y138.456 F42000
; LINE_WIDTH: 0.51714
G1 F4298
M204 S6000
G1 X129.287 Y130.487 E.30795
; WIPE_START
G1 F7591.414
G1 X129.287 Y132.487 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.439 Y129.006 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.5813
M73 P47 R9
G1 F4298
M204 S6000
G1 X130.439 Y127.394 E.07072
; WIPE_START
G1 F6686.727
G1 X130.439 Y129.006 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.776 Y126.587 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.29302
G1 F4298
M204 S6000
G1 X129.776 Y117.813 E.17883
; WIPE_START
G1 F14394.242
G1 X129.776 Y119.813 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.439 Y117.006 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.5813
G1 F4298
M204 S6000
G1 X130.439 Y115.406 E.07017
M204 S10000
G1 X124.085 Y115.406 F42000
; LINE_WIDTH: 0.38872
G1 F4298
M204 S6000
G1 X124.085 Y117.006 E.04507
; WIPE_START
G1 F10410.642
G1 X124.085 Y115.406 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.747 Y117.813 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.10044
G1 F4298
M204 S6000
G1 X124.747 Y126.587 E.04113
; WIPE_START
G1 F15000
G1 X124.747 Y124.587 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.085 Y127.394 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.38943
G1 F4298
M204 S6000
G1 X124.085 Y129.006 E.04552
G1 X124.106 Y129.056 E.00154
; LINE_WIDTH: 0.453805
G1 X124.128 Y129.106 E.00183
; LINE_WIDTH: 0.497195
G1 X124.15 Y129.156 E.00202
; LINE_WIDTH: 0.540585
G1 X124.172 Y129.206 E.00221
; LINE_WIDTH: 0.583975
G1 X124.193 Y129.256 E.0024
; LINE_WIDTH: 0.627365
G1 X124.215 Y129.306 E.0026
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6159.69
G1 X124.193 Y129.256 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/72
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z3.6 I.517 J1.102 P1  F42000
G1 X129.448 Y126.791 Z3.6
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4255
M204 S6000
G1 X129.448 Y117.609 E.30457
G1 X130.122 Y117.609 E.02237
G1 X130.122 Y126.791 E.30457
G1 X129.508 Y126.791 E.02038
; WIPE_START
G1 F8843.478
G1 X129.495 Y124.791 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.98 Y126.535 Z3.8 F42000
G1 Z3.4
M73 P48 R9
G1 E.8 F1800
G1 F4255
M204 S6000
G1 X124.98 Y126.791 E.00849
G1 X124.522 Y126.791 E.01516
G1 X124.522 Y117.609 E.30457
G1 X124.98 Y117.609 E.01516
G1 X124.98 Y126.475 E.2941
M204 S10000
G1 X125.779 Y126.927 F42000
G1 F4255
M204 S6000
G1 X125.387 Y126.927 E.01301
G1 X125.387 Y117.473 E.31361
G1 X129.041 Y117.473 E.12121
G1 X129.041 Y126.927 E.31361
G1 X125.839 Y126.927 E.10622
M204 S250
G1 X125.779 Y126.535 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4255
M204 S5000
G1 X125.779 Y117.865 E.2664
G1 X128.649 Y117.865 E.08819
G1 X128.649 Y126.535 E.2664
G1 X125.839 Y126.535 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.825 Y124.535 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.454 Y127.198 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4255
M204 S6000
G1 X124.115 Y127.198 E.01122
G1 X124.115 Y117.202 E.33158
G1 X130.529 Y117.202 E.21275
G1 X130.529 Y127.198 E.33158
G1 X124.514 Y127.198 E.19954
; WIPE_START
G1 F8843.478
G1 X124.115 Y127.198 E-.15135
G1 X124.115 Y125.596 E-.60865
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.454 Y128.81 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4255
M204 S5000
G1 X124.454 Y127.59 E.03749
G1 X129.974 Y127.59 E.16961
G1 X129.974 Y128.81 E.03749
G1 X124.514 Y128.81 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y127.59 E-.46416
G1 X125.232 Y127.59 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.987 Y135.018 Z3.8 F42000
G1 X127.724 Y138.135 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F4255
M204 S5000
G1 X124.768 Y138.135 E.09084
G1 X124.768 Y138.094 E.00126
G1 X124.768 Y129.506 E.26389
G1 X124.768 Y129.465 E.00126
G1 X127.724 Y129.465 E.09084
G1 X127.724 Y138.075 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.724 Y138.116 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.122 Y139.99 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4255
M204 S6000
G1 X124.522 Y139.991 E.18575
G1 X124.522 Y138.934 E.03505
G1 X128.523 Y138.934 E.13271
G1 X128.523 Y129.609 E.30933
G1 X130.122 Y129.609 E.05304
G1 X130.122 Y139.93 E.34238
; WIPE_START
G1 F8843.478
G1 X128.122 Y139.952 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.116 Y138.135 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F4255
M204 S6000
G1 X128.116 Y129.202 E.29632
G1 X130.529 Y129.202 E.08004
G1 X130.529 Y140.398 E.37137
G1 X124.115 Y140.398 E.21275
G1 X124.115 Y129.202 E.37139
G1 X124.376 Y129.202 E.00863
G1 X124.376 Y138.527 E.30933
G1 X128.116 Y138.527 E.12408
G1 X128.116 Y138.195 E.01102
; WIPE_START
G1 F8843.478
G1 X128.116 Y136.195 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.699 Y128.695 Z3.8 F42000
G1 X124.454 Y116.81 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4255
M204 S5000
G1 X124.454 Y115.59 E.03749
G1 X129.974 Y115.59 E.16961
G1 X129.974 Y116.81 E.03749
G1 X124.514 Y116.81 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y115.59 E-.46416
G1 X125.232 Y115.59 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.92 Y123.033 Z3.8 F42000
G1 X130.914 Y140.648 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F4255
M204 S5000
G3 X130.733 Y140.79 I-.189 J-.055 E.00754
G1 X123.865 Y140.783 E.21103
G3 X123.723 Y140.59 I.061 J-.194 E.00788
G1 X123.723 Y115.407 E.77379
G3 X123.91 Y115.21 I.199 J.001 E.00918
G1 X130.732 Y115.21 E.20961
G3 X130.921 Y115.41 I-.009 J.198 E.00935
G1 X130.914 Y140.588 E.77365
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.849 Y140.748 E-.06556
G1 X130.733 Y140.79 E-.04681
G1 X129.029 Y140.788 E-.64763
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


G1 X128.727 Y139.462 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692411
G1 F4255
M204 S6000
G1 X124.726 Y139.462 E.21173
; WIPE_START
G1 F5542.801
G1 X126.726 Y139.462 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.096 Y132.006 Z3.8 F42000
G1 X124.089 Y127.394 Z3.8
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.3812
G1 F4255
M204 S6000
G1 X124.089 Y129.006 E.04443
M204 S10000
G1 X124.572 Y129.138 F42000
; LINE_WIDTH: 0.30586
G1 F4255
M204 S6000
G1 X127.92 Y129.138 E.07174
; WIPE_START
G1 F13691.336
G1 X125.92 Y129.138 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.915 Y130.001 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F4255
M204 S6000
G1 X128.915 Y138.724 E.26802
G1 X129.054 Y138.771 E.00451
; LINE_WIDTH: 0.439514
G1 X129.095 Y138.818 E.00202
; LINE_WIDTH: 0.47856
G1 X129.136 Y138.865 E.00222
; LINE_WIDTH: 0.53645
G1 X129.177 Y138.912 E.00252
G1 X129.177 Y139.54 E.02523
G1 X129.671 Y139.54 E.01987
G1 X129.671 Y138.912 E.02523
; LINE_WIDTH: 0.517607
G1 X129.691 Y138.763 E.00583
; LINE_WIDTH: 0.47856
G1 X129.71 Y138.614 E.00535
; LINE_WIDTH: 0.420304
G1 X129.73 Y138.464 E.00464
G1 X129.73 Y130.001 E.26025
G1 X128.975 Y130.001 E.02321
M204 S10000
G1 X129.323 Y138.464 F42000
; LINE_WIDTH: 0.4806
G1 F4255
M204 S6000
G1 X129.323 Y130.469 E.28516
; WIPE_START
G1 F8225.187
G1 X129.323 Y132.469 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.447 Y129.006 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.59836
G1 F4255
M204 S6000
G1 X130.447 Y127.394 E.07296
; WIPE_START
G1 F6481.348
G1 X130.447 Y129.006 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.785 Y126.587 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.31008
G1 F4255
M204 S6000
G1 X129.785 Y117.813 E.19103
; WIPE_START
G1 F13475.07
G1 X129.785 Y119.813 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.447 Y117.006 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.59836
G1 F4255
M204 S6000
G1 X130.447 Y115.406 E.0724
M204 S10000
G1 X124.089 Y115.406 F42000
; LINE_WIDTH: 0.3812
G1 F4255
M204 S6000
G1 X124.089 Y117.006 E.04409
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10642.071
G1 X124.089 Y115.406 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/72
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z3.8 I-1.101 J.518 P1  F42000
G1 X129.448 Y126.791 Z3.8
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4271
M204 S6000
G1 X129.448 Y117.609 E.30457
G1 X130.139 Y117.609 E.02293
G1 X130.139 Y126.791 E.30457
G1 X129.508 Y126.791 E.02094
; WIPE_START
G1 F8843.478
G1 X129.495 Y124.791 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.98 Y126.535 Z4 F42000
G1 Z3.6
G1 E.8 F1800
G1 F4271
M204 S6000
G1 X124.98 Y126.791 E.00849
G1 X124.533 Y126.791 E.0148
G1 X124.533 Y117.609 E.30457
G1 X124.98 Y117.609 E.0148
G1 X124.98 Y126.475 E.2941
M204 S10000
G1 X125.779 Y126.927 F42000
G1 F4271
M204 S6000
G1 X125.387 Y126.927 E.01301
G1 X125.387 Y117.473 E.31361
G1 X129.041 Y117.473 E.12121
G1 X129.041 Y126.927 E.31361
G1 X125.839 Y126.927 E.10622
M204 S250
G1 X125.779 Y126.535 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4271
M204 S5000
G1 X125.779 Y117.865 E.2664
G1 X128.649 Y117.865 E.08819
G1 X128.649 Y126.535 E.2664
G1 X125.839 Y126.535 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.825 Y124.535 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.454 Y127.198 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4271
M204 S6000
G1 X124.126 Y127.198 E.01086
G1 X124.126 Y117.202 E.33158
G1 X130.546 Y117.202 E.21296
G1 X130.546 Y127.198 E.33158
G1 X124.514 Y127.198 E.20011
; WIPE_START
G1 F8843.478
G1 X124.126 Y127.198 E-.14723
G1 X124.126 Y125.585 E-.61277
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.454 Y128.81 Z4 F42000
M73 P49 R9
G1 Z3.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4271
M204 S5000
G1 X124.454 Y127.59 E.03749
G1 X129.974 Y127.59 E.16961
G1 X129.974 Y128.81 E.03749
G1 X124.514 Y128.81 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y127.59 E-.46416
G1 X125.232 Y127.59 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.023 Y135.009 Z4 F42000
G1 X127.778 Y138.135 Z4
G1 Z3.6
G1 E.8 F1800
G1 F4271
M204 S5000
G1 X124.821 Y138.135 E.09084
G1 X124.821 Y138.094 E.00126
G1 X124.821 Y129.506 E.26389
G1 X124.821 Y129.465 E.00126
G1 X127.778 Y129.465 E.09084
G1 X127.778 Y138.075 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.778 Y138.116 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.139 Y139.99 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4271
M204 S6000
G1 X124.533 Y139.991 E.18595
G1 X124.533 Y138.934 E.03505
G1 X128.577 Y138.934 E.13413
G1 X128.577 Y129.609 E.30933
G1 X130.139 Y129.609 E.05183
G1 X130.139 Y139.93 E.34238
; WIPE_START
G1 F8843.478
G1 X128.139 Y139.952 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.778 Y138.527 Z4 F42000
G1 Z3.6
G1 E.8 F1800
G1 F4271
M204 S6000
G1 X128.17 Y138.527 E.01301
G1 X128.17 Y129.202 E.30933
G1 X130.546 Y129.202 E.07883
G1 X130.546 Y140.398 E.37137
G1 X124.126 Y140.398 E.21296
G1 X124.126 Y129.202 E.37139
G1 X124.429 Y129.202 E.01005
G1 X124.429 Y138.527 E.30933
G1 X127.718 Y138.527 E.10909
; WIPE_START
G1 F8843.478
G1 X128.17 Y138.527 E-.17179
G1 X128.17 Y136.979 E-.58822
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.787 Y129.473 Z4 F42000
G1 X124.454 Y116.81 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4271
M204 S5000
G1 X124.454 Y115.59 E.03749
G1 X129.974 Y115.59 E.16961
G1 X129.974 Y116.81 E.03749
G1 X124.514 Y116.81 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y115.59 E-.46416
G1 X125.232 Y115.59 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.925 Y123.032 Z4 F42000
G1 X130.932 Y140.648 Z4
G1 Z3.6
G1 E.8 F1800
G1 F4271
M204 S5000
G3 X130.75 Y140.79 I-.189 J-.055 E.00755
G1 X123.877 Y140.783 E.21121
G3 X123.734 Y140.59 I.061 J-.194 E.00789
G1 X123.734 Y115.407 E.7738
G3 X123.922 Y115.21 I.199 J.002 E.00922
G1 X130.747 Y115.21 E.20971
G3 X130.938 Y115.41 I-.007 J.198 E.00939
G1 X130.932 Y140.588 E.77364
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.866 Y140.748 E-.06569
G1 X130.75 Y140.79 E-.04679
G1 X129.046 Y140.788 E-.64753
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


G1 X128.78 Y139.462 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692411
G1 F4271
M204 S6000
G1 X124.737 Y139.462 E.214
; WIPE_START
G1 F5542.804
G1 X126.737 Y139.462 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.104 Y132.007 Z4 F42000
G1 X124.094 Y127.394 Z4
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.37036
G1 F4271
M204 S6000
G1 X124.094 Y129.006 E.04301
M204 S10000
G1 X124.625 Y129.138 F42000
; LINE_WIDTH: 0.30586
G1 F4271
M204 S6000
G1 X127.974 Y129.138 E.07174
; WIPE_START
G1 F13691.336
G1 X125.974 Y129.138 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.969 Y130.001 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F4271
M204 S6000
G1 X128.969 Y138.724 E.26802
G1 X129.106 Y138.769 E.00443
; LINE_WIDTH: 0.444708
G1 X129.164 Y138.841 E.00302
; LINE_WIDTH: 0.517616
G1 X129.222 Y138.912 E.00357
G1 X129.222 Y139.549 E.02462
G1 X129.698 Y139.549 E.01841
G1 X129.698 Y138.912 E.02462
; LINE_WIDTH: 0.494143
G1 X129.722 Y138.692 E.00814
; LINE_WIDTH: 0.420572
G1 X129.747 Y138.472 E.00681
G1 X129.747 Y130.001 E.26069
G1 X129.029 Y130.001 E.0221
M204 S10000
G1 X129.358 Y138.472 F42000
; LINE_WIDTH: 0.44406
G1 F4271
M204 S6000
G1 X129.358 Y130.45 E.26223
; WIPE_START
G1 F8974.422
G1 X129.358 Y132.45 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.456 Y129.006 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.61541
G1 F4271
M204 S6000
G1 X130.456 Y127.394 E.0752
; WIPE_START
G1 F6288.32
G1 X130.456 Y129.006 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.793 Y126.587 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.32713
G1 F4271
M204 S6000
G1 X129.793 Y117.813 E.20322
; WIPE_START
G1 F12666.689
G1 X129.793 Y119.813 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.456 Y117.006 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.61541
G1 F4271
M204 S6000
G1 X130.456 Y115.406 E.07462
M204 S10000
G1 X124.094 Y115.406 F42000
; LINE_WIDTH: 0.37036
G1 F4271
M204 S6000
G1 X124.094 Y117.006 E.04268
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10994.38
G1 X124.094 Y115.406 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/72
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z4 I-1.101 J.518 P1  F42000
G1 X129.448 Y126.791 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4271
M204 S6000
G1 X129.448 Y117.609 E.30457
G1 X130.156 Y117.609 E.0235
G1 X130.156 Y126.791 E.30457
G1 X129.508 Y126.791 E.02151
; WIPE_START
G1 F8843.478
G1 X129.495 Y124.791 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.98 Y126.535 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
G1 F4271
M204 S6000
G1 X124.98 Y126.791 E.00849
G1 X124.55 Y126.791 E.01424
G1 X124.55 Y117.609 E.30457
G1 X124.98 Y117.609 E.01424
G1 X124.98 Y126.475 E.2941
M204 S10000
G1 X125.779 Y126.927 F42000
G1 F4271
M204 S6000
G1 X125.387 Y126.927 E.01301
G1 X125.387 Y117.473 E.31361
G1 X129.041 Y117.473 E.12121
G1 X129.041 Y126.927 E.31361
G1 X125.839 Y126.927 E.10622
M204 S250
G1 X125.779 Y126.535 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4271
M204 S5000
G1 X125.779 Y117.865 E.2664
G1 X128.649 Y117.865 E.08819
G1 X128.649 Y126.535 E.2664
G1 X125.839 Y126.535 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.825 Y124.535 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.454 Y127.198 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4271
M204 S6000
G1 X124.143 Y127.198 E.0103
G1 X124.143 Y117.202 E.33158
G1 X130.563 Y117.202 E.21297
G1 X130.563 Y127.198 E.33158
G1 X124.514 Y127.198 E.20067
; WIPE_START
G1 F8843.478
G1 X124.143 Y127.198 E-.14081
G1 X124.143 Y125.568 E-.61919
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.454 Y128.81 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4271
M204 S5000
G1 X124.454 Y127.59 E.03749
G1 X129.974 Y127.59 E.16961
G1 X129.974 Y128.81 E.03749
G1 X124.514 Y128.81 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y127.59 E-.46416
G1 X125.232 Y127.59 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.059 Y135.001 Z4.2 F42000
G1 X127.831 Y138.135 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F4271
M204 S5000
G1 X124.875 Y138.135 E.09084
G1 X124.875 Y138.094 E.00126
G1 X124.875 Y129.506 E.26389
G1 X124.875 Y129.465 E.00126
G1 X127.831 Y129.465 E.09084
G1 X127.831 Y138.075 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.832 Y138.116 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.156 Y139.99 Z4.2 F42000
M73 P50 R9
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4271
M204 S6000
G1 X124.55 Y139.991 E.18596
G1 X124.55 Y138.934 E.03505
G1 X128.63 Y138.934 E.13535
G1 X128.63 Y129.609 E.30933
G1 X130.156 Y129.609 E.05061
G1 X130.156 Y139.93 E.34238
; WIPE_START
G1 F8843.478
G1 X128.156 Y139.952 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.831 Y138.527 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
G1 F4271
M204 S6000
G1 X128.223 Y138.527 E.01301
G1 X128.223 Y129.202 E.30933
G1 X130.563 Y129.202 E.07762
G1 X130.563 Y140.398 E.37137
G1 X124.143 Y140.398 E.21297
G1 X124.143 Y129.202 E.37139
G1 X124.483 Y129.202 E.01126
G1 X124.483 Y138.527 E.30933
G1 X127.771 Y138.527 E.10909
; WIPE_START
G1 F8843.478
G1 X128.223 Y138.527 E-.17179
G1 X128.223 Y136.979 E-.58821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.821 Y129.477 Z4.2 F42000
G1 X124.454 Y116.81 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4271
M204 S5000
G1 X124.454 Y115.59 E.03749
G1 X129.974 Y115.59 E.16961
G1 X129.974 Y116.81 E.03749
G1 X124.514 Y116.81 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y115.59 E-.46416
G1 X125.232 Y115.59 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.93 Y123.031 Z4.2 F42000
G1 X130.949 Y140.648 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F4271
M204 S5000
G3 X130.767 Y140.79 I-.192 J-.059 E.00752
G1 X123.894 Y140.783 E.21121
G3 X123.751 Y140.59 I.06 J-.194 E.00789
G1 X123.751 Y115.407 E.7738
G3 X123.939 Y115.21 I.199 J.002 E.00921
G1 X130.81 Y115.216 E.21111
G3 X130.955 Y115.41 I-.048 J.188 E.00805
G1 X130.949 Y140.588 E.77365
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.881 Y140.749 E-.06643
G1 X130.767 Y140.79 E-.04589
G1 X129.063 Y140.788 E-.64768
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


G1 X128.834 Y139.462 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692402
G1 F4271
M204 S6000
G1 X124.754 Y139.462 E.21593
; WIPE_START
G1 F5542.883
G1 X126.754 Y139.462 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.116 Y132.008 Z4.2 F42000
G1 X124.102 Y127.394 Z4.2
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.35346
G1 F4271
M204 S6000
G1 X124.102 Y129.006 E.04079
M204 S10000
G1 X124.679 Y129.138 F42000
; LINE_WIDTH: 0.30586
G1 F4271
M204 S6000
G1 X128.027 Y129.138 E.07174
; WIPE_START
G1 F13691.336
G1 X126.027 Y129.138 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.022 Y130.001 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F4271
M204 S6000
G1 X129.022 Y138.724 E.26802
G1 X129.157 Y138.767 E.00435
; LINE_WIDTH: 0.44014
G1 X129.212 Y138.84 E.00294
; LINE_WIDTH: 0.49959
G1 X129.266 Y138.912 E.00338
G1 X129.266 Y139.558 E.02403
G1 X129.724 Y139.558 E.01703
G1 X129.724 Y138.912 E.02403
; LINE_WIDTH: 0.48044
G1 X129.744 Y138.697 E.00773
; LINE_WIDTH: 0.420456
G1 X129.764 Y138.481 E.00667
G1 X129.764 Y130.001 E.26088
G1 X129.082 Y130.001 E.02097
M204 S10000
G1 X129.393 Y138.481 F42000
; LINE_WIDTH: 0.40752
G1 F4271
M204 S6000
G1 X129.393 Y130.432 E.23914
; WIPE_START
G1 F9873.834
G1 X129.393 Y132.432 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.465 Y129.006 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.63246
G1 F4271
M204 S6000
G1 X130.465 Y127.394 E.07743
; WIPE_START
G1 F6106.456
G1 X130.465 Y129.006 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.802 Y126.587 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.34418
G1 F4271
M204 S6000
G1 X129.802 Y117.813 E.21541
; WIPE_START
G1 F11949.81
G1 X129.802 Y119.813 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.465 Y117.006 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.63246
G1 F4271
M204 S6000
G1 X130.465 Y115.406 E.07685
M204 S10000
G1 X124.102 Y115.406 F42000
; LINE_WIDTH: 0.35346
G1 F4271
M204 S6000
G1 X124.102 Y117.006 E.04048
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11592.709
G1 X124.102 Y115.406 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/72
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z4.2 I-1.102 J.517 P1  F42000
G1 X129.448 Y126.791 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4271
M204 S6000
G1 X129.448 Y117.609 E.30457
G1 X130.173 Y117.609 E.02406
G1 X130.173 Y126.791 E.30457
G1 X129.508 Y126.791 E.02207
; WIPE_START
G1 F8843.478
G1 X129.495 Y124.791 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.98 Y126.535 Z4.4 F42000
G1 Z4
G1 E.8 F1800
G1 F4271
M204 S6000
G1 X124.98 Y126.791 E.00849
G1 X124.567 Y126.791 E.01368
G1 X124.567 Y117.609 E.30457
G1 X124.98 Y117.609 E.01368
G1 X124.98 Y126.475 E.2941
M204 S10000
G1 X125.779 Y126.927 F42000
G1 F4271
M204 S6000
G1 X125.387 Y126.927 E.01301
G1 X125.387 Y117.473 E.31361
G1 X129.041 Y117.473 E.12121
G1 X129.041 Y126.927 E.31361
G1 X125.839 Y126.927 E.10622
M204 S250
G1 X125.779 Y126.535 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4271
M204 S5000
G1 X125.779 Y117.865 E.2664
G1 X128.649 Y117.865 E.08819
G1 X128.649 Y126.535 E.2664
G1 X125.839 Y126.535 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.825 Y124.535 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.454 Y127.198 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4271
M204 S6000
G1 X124.16 Y127.198 E.00974
G1 X124.16 Y117.202 E.33158
G1 X130.58 Y117.202 E.21297
G1 X130.58 Y127.198 E.33158
G1 X124.514 Y127.198 E.20124
; WIPE_START
G1 F8843.478
G1 X124.16 Y127.198 E-.13439
G1 X124.16 Y125.552 E-.62561
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.454 Y128.81 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4271
M204 S5000
G1 X124.454 Y127.59 E.03749
G1 X129.974 Y127.59 E.16961
G1 X129.974 Y128.81 E.03749
G1 X124.514 Y128.81 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y127.59 E-.46416
G1 X125.232 Y127.59 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.094 Y134.992 Z4.4 F42000
G1 X127.885 Y138.135 Z4.4
G1 Z4
G1 E.8 F1800
G1 F4271
M204 S5000
G1 X124.928 Y138.135 E.09084
G1 X124.928 Y138.094 E.00126
G1 X124.928 Y129.506 E.26389
G1 X124.928 Y129.465 E.00126
G1 X127.885 Y129.465 E.09084
G1 X127.885 Y138.075 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.885 Y138.116 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.173 Y139.99 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4271
M204 S6000
G1 X124.567 Y139.991 E.18596
G1 X124.567 Y138.934 E.03505
G1 X128.684 Y138.934 E.13656
G1 X128.684 Y129.609 E.30933
G1 X130.173 Y129.609 E.0494
G1 X130.173 Y139.93 E.34238
; WIPE_START
G1 F8843.478
G1 X128.173 Y139.952 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.885 Y138.527 Z4.4 F42000
G1 Z4
M73 P51 R9
G1 E.8 F1800
G1 F4271
M204 S6000
G1 X128.277 Y138.527 E.01301
G1 X128.277 Y129.202 E.30933
G1 X130.58 Y129.202 E.07641
G1 X130.58 Y140.398 E.37137
G1 X124.16 Y140.398 E.21297
G1 X124.16 Y129.202 E.37139
G1 X124.536 Y129.202 E.01248
G1 X124.536 Y138.527 E.30933
G1 X127.825 Y138.527 E.10909
; WIPE_START
G1 F8843.478
G1 X128.277 Y138.527 E-.17179
G1 X128.277 Y136.979 E-.58821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.855 Y129.48 Z4.4 F42000
G1 X124.454 Y116.81 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4271
M204 S5000
G1 X124.454 Y115.59 E.03749
G1 X129.974 Y115.59 E.16961
G1 X129.974 Y116.81 E.03749
G1 X124.514 Y116.81 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y115.59 E-.46416
G1 X125.232 Y115.59 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.935 Y123.03 Z4.4 F42000
G1 X130.966 Y140.648 Z4.4
G1 Z4
G1 E.8 F1800
G1 F4271
M204 S5000
G3 X130.785 Y140.79 I-.192 J-.059 E.00752
G1 X123.911 Y140.783 E.21122
G3 X123.768 Y140.59 I.06 J-.194 E.00789
G1 X123.768 Y115.407 E.77379
G3 X123.956 Y115.21 I.199 J.002 E.00922
G1 X130.827 Y115.217 E.21111
G3 X130.972 Y115.41 I-.048 J.188 E.00805
G1 X130.966 Y140.588 E.77365
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.899 Y140.749 E-.06639
G1 X130.785 Y140.79 E-.04597
G1 X129.08 Y140.788 E-.64765
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


G1 X128.887 Y139.462 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692402
G1 F4271
M204 S6000
G1 X124.771 Y139.462 E.21788
; WIPE_START
G1 F5542.885
G1 X126.771 Y139.462 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.128 Y132.009 Z4.4 F42000
G1 X124.111 Y127.394 Z4.4
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.33657
G1 F4271
M204 S6000
G1 X124.111 Y129.006 E.03857
M204 S10000
G1 X124.732 Y129.138 F42000
; LINE_WIDTH: 0.30586
G1 F4271
M204 S6000
G1 X128.081 Y129.138 E.07174
; WIPE_START
G1 F13691.336
G1 X126.081 Y129.138 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.076 Y130.001 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F4271
M204 S6000
G1 X129.076 Y138.724 E.26802
G1 X129.209 Y138.765 E.00427
; LINE_WIDTH: 0.435573
G1 X129.26 Y138.839 E.00287
; LINE_WIDTH: 0.481555
G1 X129.311 Y138.912 E.0032
G1 X129.311 Y139.567 E.02341
G1 X129.75 Y139.567 E.0157
G1 X129.75 Y138.912 E.0234
; LINE_WIDTH: 0.466738
G1 X129.766 Y138.701 E.00732
; LINE_WIDTH: 0.420344
G1 X129.781 Y138.49 E.00652
G1 X129.781 Y130.001 E.26107
G1 X129.136 Y130.001 E.01984
M204 S10000
G1 X129.429 Y138.49 F42000
; LINE_WIDTH: 0.37098
G1 F4271
M204 S6000
G1 X129.429 Y130.414 E.21589
; WIPE_START
G1 F10973.602
G1 X129.429 Y132.414 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.473 Y129.006 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.64951
G1 F4271
M204 S6000
G1 X130.473 Y127.394 E.07967
; WIPE_START
G1 F5934.816
G1 X130.473 Y129.006 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.811 Y126.587 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.36123
G1 F4271
M204 S6000
G1 X129.811 Y117.813 E.2276
; WIPE_START
G1 F11309.73
G1 X129.811 Y119.813 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.473 Y117.006 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.64951
G1 F4271
M204 S6000
G1 X130.473 Y115.406 E.07907
M204 S10000
G1 X124.111 Y115.406 F42000
; LINE_WIDTH: 0.33657
G1 F4271
M204 S6000
G1 X124.111 Y117.006 E.03828
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F12259.492
G1 X124.111 Y115.406 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/72
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z4.4 I-1.102 J.517 P1  F42000
G1 X129.448 Y126.791 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4172
M204 S6000
G1 X129.448 Y117.609 E.30457
G1 X130.19 Y117.609 E.02463
G1 X130.19 Y126.791 E.30457
G1 X129.508 Y126.791 E.02264
; WIPE_START
G1 F8843.478
G1 X129.495 Y124.791 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.98 Y126.535 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F4172
M204 S6000
G1 X124.98 Y126.791 E.00849
G1 X124.584 Y126.791 E.01312
G1 X124.584 Y117.609 E.30457
G1 X124.98 Y117.609 E.01312
G1 X124.98 Y126.475 E.2941
M204 S10000
G1 X125.779 Y126.927 F42000
G1 F4172
M204 S6000
G1 X125.387 Y126.927 E.01301
G1 X125.387 Y117.473 E.31361
G1 X129.041 Y117.473 E.12121
G1 X129.041 Y126.927 E.31361
G1 X125.839 Y126.927 E.10622
M204 S250
G1 X125.779 Y126.535 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4172
M204 S5000
G1 X125.779 Y117.865 E.2664
G1 X128.649 Y117.865 E.08819
G1 X128.649 Y126.535 E.2664
G1 X125.839 Y126.535 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.825 Y124.535 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.454 Y127.198 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4172
M204 S6000
G1 X124.177 Y127.198 E.00918
G1 X124.177 Y117.202 E.33158
G1 X130.597 Y117.202 E.21298
G1 X130.597 Y127.198 E.33158
G1 X124.514 Y127.198 E.20181
; WIPE_START
G1 F8843.478
G1 X124.177 Y127.198 E-.12798
G1 X124.177 Y125.535 E-.63202
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.454 Y128.81 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4172
M204 S5000
G1 X124.454 Y127.59 E.03749
G1 X129.974 Y127.59 E.16961
G1 X129.974 Y128.81 E.03749
G1 X124.514 Y128.81 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y127.59 E-.46416
G1 X125.232 Y127.59 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.129 Y134.983 Z4.6 F42000
G1 X127.938 Y138.135 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F4172
M204 S5000
G1 X124.982 Y138.135 E.09084
G1 X124.982 Y138.094 E.00126
G1 X124.982 Y129.506 E.26389
G1 X124.982 Y129.465 E.00126
G1 X127.938 Y129.465 E.09084
G1 X127.938 Y138.075 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.939 Y138.116 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.19 Y139.99 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4172
M204 S6000
G1 X124.584 Y139.991 E.18597
G1 X124.584 Y138.934 E.03505
G1 X128.738 Y138.934 E.13778
G1 X128.738 Y129.609 E.30933
G1 X130.19 Y129.609 E.04819
G1 X130.19 Y139.93 E.34238
; WIPE_START
G1 F8843.478
G1 X128.19 Y139.952 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.938 Y138.527 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F4172
M204 S6000
G1 X128.33 Y138.527 E.01301
G1 X128.33 Y129.202 E.30933
G1 X130.597 Y129.202 E.0752
G1 X130.597 Y140.398 E.37137
G1 X124.177 Y140.398 E.21298
G1 X124.177 Y129.202 E.37139
G1 X124.59 Y129.202 E.0137
G1 X124.59 Y138.527 E.30933
G1 X127.878 Y138.527 E.10909
; WIPE_START
G1 F8843.478
G1 X128.33 Y138.527 E-.17179
G1 X128.33 Y136.979 E-.58821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.89 Y129.484 Z4.6 F42000
M73 P52 R9
G1 X124.454 Y116.81 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4172
M204 S5000
G1 X124.454 Y115.59 E.03749
G1 X129.974 Y115.59 E.16961
G1 X129.974 Y116.81 E.03749
G1 X124.514 Y116.81 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y115.59 E-.46416
G1 X125.232 Y115.59 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.939 Y123.029 Z4.6 F42000
G1 X130.983 Y140.648 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F4172
M204 S5000
G3 X130.802 Y140.79 I-.192 J-.059 E.00753
G1 X123.927 Y140.783 E.21122
G3 X123.785 Y140.59 I.061 J-.194 E.0079
G1 X123.785 Y115.408 E.77379
G3 X123.973 Y115.21 I.2 J.002 E.00921
G1 X130.844 Y115.217 E.21113
G3 X130.989 Y115.41 I-.048 J.187 E.00804
G1 X130.983 Y140.588 E.77364
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.916 Y140.749 E-.06635
G1 X130.802 Y140.79 E-.04602
G1 X129.097 Y140.788 E-.64763
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


G1 X128.941 Y139.462 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692411
G1 F4172
M204 S6000
G1 X124.788 Y139.462 E.21982
; WIPE_START
G1 F5542.808
G1 X126.788 Y139.462 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.14 Y132.01 Z4.6 F42000
G1 X124.119 Y127.394 Z4.6
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.31968
G1 F4172
M204 S6000
G1 X124.119 Y129.006 E.03635
M204 S10000
G1 X124.786 Y129.138 F42000
; LINE_WIDTH: 0.30586
G1 F4172
M204 S6000
G1 X128.134 Y129.138 E.07174
; WIPE_START
G1 F13691.336
G1 X126.134 Y129.138 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.202 Y130.074 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.56576
G1 F4172
M204 S6000
G1 X129.202 Y138.671 E.36626
G1 X129.304 Y138.706 E.00458
; LINE_WIDTH: 0.548809
G1 X129.321 Y138.775 E.00293
; LINE_WIDTH: 0.514905
G1 X129.338 Y138.843 E.00273
; LINE_WIDTH: 0.464706
G1 X129.355 Y138.912 E.00244
G1 X129.355 Y139.576 E.02282
G1 X129.776 Y139.576 E.01447
G1 X129.776 Y138.912 E.02282
; LINE_WIDTH: 0.481002
G1 X129.759 Y138.775 E.00496
; LINE_WIDTH: 0.514905
G1 X129.742 Y138.637 E.00535
; LINE_WIDTH: 0.565499
G1 X129.725 Y138.499 E.00592
G1 X129.725 Y130.074 E.35874
G1 X129.262 Y130.074 E.01971
; WIPE_START
G1 F6888.911
G1 X129.725 Y130.074 E-.17588
G1 X129.725 Y131.611 E-.58412
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.482 Y129.006 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.66657
G1 F4172
M204 S6000
G1 X130.482 Y127.394 E.08192
; WIPE_START
G1 F5772.469
G1 X130.482 Y129.006 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.819 Y126.587 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.37829
G1 F4172
M204 S6000
G1 X129.819 Y117.813 E.2398
; WIPE_START
G1 F10734.413
G1 X129.819 Y119.813 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.482 Y117.006 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.66657
G1 F4172
M204 S6000
G1 X130.482 Y115.406 E.08129
M204 S10000
G1 X124.119 Y115.406 F42000
; LINE_WIDTH: 0.31968
G1 F4172
M204 S6000
G1 X124.119 Y117.006 E.03608
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F13007.66
G1 X124.119 Y115.406 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/72
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z4.6 I-1.217 J.03 P1  F42000
G1 X124.454 Y128.81 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4109
M204 S5000
G1 X124.454 Y127.59 E.03749
G1 X129.974 Y127.59 E.16961
G1 X129.974 Y128.81 E.03749
G1 X124.514 Y128.81 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y127.59 E-.46416
G1 X125.232 Y127.59 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.165 Y134.974 Z4.8 F42000
G1 X127.992 Y138.135 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F4109
M204 S5000
G1 X125.036 Y138.135 E.09084
G1 X125.036 Y138.094 E.00126
G1 X125.036 Y129.506 E.26389
G1 X125.036 Y129.465 E.00126
G1 X127.992 Y129.465 E.09084
G1 X127.992 Y138.075 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.992 Y138.116 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.22 Y130.815 Z4.8 F42000
G1 X129.448 Y126.791 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4109
M204 S6000
G1 X129.448 Y117.609 E.30457
G1 X130.207 Y117.609 E.02519
G1 X130.207 Y126.791 E.30457
G1 X129.508 Y126.791 E.0232
; WIPE_START
G1 F8843.478
G1 X129.495 Y124.791 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.98 Y126.535 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F4109
M204 S6000
G1 X124.98 Y126.791 E.00849
G1 X124.601 Y126.791 E.01256
G1 X124.601 Y117.609 E.30457
G1 X124.98 Y117.609 E.01256
G1 X124.98 Y126.475 E.2941
M204 S10000
G1 X125.779 Y126.927 F42000
G1 F4109
M204 S6000
G1 X125.387 Y126.927 E.01301
G1 X125.387 Y117.473 E.31361
G1 X129.041 Y117.473 E.12121
G1 X129.041 Y126.927 E.31361
G1 X125.839 Y126.927 E.10622
M204 S250
G1 X125.779 Y126.535 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4109
M204 S5000
G1 X125.779 Y117.865 E.2664
G1 X128.649 Y117.865 E.08819
G1 X128.649 Y126.535 E.2664
G1 X125.839 Y126.535 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.825 Y124.535 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.907 Y131.878 Z4.8 F42000
G1 X130.207 Y139.99 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4109
M204 S6000
G1 X124.601 Y139.991 E.18598
G1 X124.601 Y138.934 E.03505
G1 X128.791 Y138.934 E.139
G1 X128.791 Y129.609 E.30933
G1 X130.207 Y129.609 E.04698
G1 X130.207 Y139.93 E.34238
M204 S10000
G1 X130.614 Y140.398 F42000
G1 F4109
M204 S6000
G1 X124.194 Y140.398 E.21298
G1 X124.194 Y129.202 E.37139
G1 X124.643 Y129.202 E.01492
G1 X124.643 Y138.527 E.30933
G1 X128.384 Y138.527 E.12408
G1 X128.384 Y129.202 E.30933
G1 X130.366 Y129.202 E.06574
G1 X130.366 Y127.198 E.06648
G1 X124.194 Y127.198 E.20473
G1 X124.194 Y117.202 E.33158
G1 X130.366 Y117.202 E.20473
G1 X130.366 Y115.602 E.05307
G1 X130.614 Y115.602 E.00825
G1 X130.614 Y140.338 E.82051
; WIPE_START
G1 F8843.478
G1 X128.614 Y140.356 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.286 Y132.84 Z4.8 F42000
G1 X124.454 Y116.81 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4109
M204 S5000
G1 X124.454 Y115.59 E.03749
G1 X129.974 Y115.59 E.16961
G1 X129.974 Y116.81 E.03749
G1 X124.514 Y116.81 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y115.59 E-.46416
G1 X125.232 Y115.59 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.944 Y123.028 Z4.8 F42000
G1 X131 Y140.648 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F4109
M204 S5000
G3 X130.819 Y140.79 I-.191 J-.057 E.00753
G1 X123.944 Y140.783 E.21123
G3 X123.802 Y140.59 I.061 J-.194 E.0079
G1 X123.802 Y115.408 E.77379
G3 X123.99 Y115.21 I.199 J.002 E.00922
G1 X130.861 Y115.217 E.21114
G3 X131.006 Y115.41 I-.048 J.187 E.00802
G1 X131 Y140.588 E.77365
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.933 Y140.749 E-.06608
G1 X130.819 Y140.79 E-.04629
G1 X129.114 Y140.788 E-.64763
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


G1 X128.995 Y139.462 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692401
G1 F4109
M204 S6000
G1 X124.804 Y139.462 E.22176
; WIPE_START
G1 F5542.888
G1 X126.804 Y139.462 E-.76
; WIPE_END
M73 P53 R9
G1 E-.04 F1800
M204 S10000
G1 X125.152 Y132.011 Z4.8 F42000
M73 P53 R8
G1 X124.128 Y127.394 Z4.8
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.30279
G1 F4109
M204 S6000
G1 X124.128 Y129.006 E.03413
M204 S10000
G1 X124.84 Y129.138 F42000
; LINE_WIDTH: 0.30586
G1 F4109
M204 S6000
G1 X128.188 Y129.138 E.07174
; WIPE_START
G1 F13691.336
G1 X126.188 Y129.138 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.247 Y130.065 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.54749
G1 F4109
M204 S6000
G1 X129.247 Y138.676 E.35407
G1 X129.349 Y138.71 E.00441
; LINE_WIDTH: 0.530539
G1 X129.366 Y138.778 E.00276
; LINE_WIDTH: 0.496635
G1 X129.383 Y138.845 E.00257
; LINE_WIDTH: 0.446423
G1 X129.4 Y138.912 E.00229
G1 X129.4 Y139.586 E.02213
G1 X129.802 Y139.586 E.01325
G1 X129.802 Y138.912 E.02213
; LINE_WIDTH: 0.462732
G1 X129.785 Y138.778 E.00465
; LINE_WIDTH: 0.496635
G1 X129.768 Y138.643 E.00503
; LINE_WIDTH: 0.547235
G1 X129.752 Y138.508 E.00559
G1 X129.752 Y130.065 E.34696
G1 X129.307 Y130.065 E.01827
; WIPE_START
G1 F7138.403
G1 X129.752 Y130.065 E-.16894
G1 X129.752 Y131.62 E-.59106
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.828 Y126.587 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.39534
G1 F4109
M204 S6000
G1 X129.828 Y117.813 E.25199
; WIPE_START
G1 F10215.084
G1 X129.828 Y119.813 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.128 Y117.006 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.30279
G1 F4109
M204 S6000
G1 X124.128 Y115.406 E.03387
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F13853.08
G1 X124.128 Y117.006 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/72
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z4.8 I-1.217 J.034 P1  F42000
G1 X124.454 Y128.81 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4186
M204 S5000
G1 X124.454 Y127.59 E.03749
G1 X129.974 Y127.59 E.16961
G1 X129.974 Y128.81 E.03749
G1 X124.514 Y128.81 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y127.59 E-.46416
G1 X125.232 Y127.59 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.2 Y134.964 Z5 F42000
G1 X128.046 Y138.135 Z5
G1 Z4.6
G1 E.8 F1800
G1 F4186
M204 S5000
G1 X125.089 Y138.135 E.09084
G1 X125.089 Y138.094 E.00126
G1 X125.089 Y129.506 E.26389
G1 X125.089 Y129.465 E.00126
G1 X128.046 Y129.465 E.09084
G1 X128.046 Y138.075 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.046 Y138.116 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.242 Y130.806 Z5 F42000
G1 X129.448 Y126.791 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4186
M204 S6000
G1 X129.448 Y117.609 E.30457
G1 X130.224 Y117.609 E.02576
G1 X130.224 Y126.791 E.30457
G1 X129.508 Y126.791 E.02377
; WIPE_START
G1 F8843.478
G1 X129.495 Y124.791 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.98 Y126.535 Z5 F42000
G1 Z4.6
G1 E.8 F1800
G1 F4186
M204 S6000
G1 X124.98 Y126.791 E.00849
G1 X124.618 Y126.791 E.012
G1 X124.618 Y117.609 E.30457
G1 X124.98 Y117.609 E.012
G1 X124.98 Y126.475 E.2941
M204 S10000
G1 X125.779 Y126.927 F42000
G1 F4186
M204 S6000
G1 X125.387 Y126.927 E.01301
G1 X125.387 Y117.473 E.31361
G1 X129.041 Y117.473 E.12121
G1 X129.041 Y126.927 E.31361
G1 X125.839 Y126.927 E.10622
M204 S250
G1 X125.779 Y126.535 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4186
M204 S5000
G1 X125.779 Y117.865 E.2664
G1 X128.649 Y117.865 E.08819
G1 X128.649 Y126.535 E.2664
G1 X125.839 Y126.535 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.825 Y124.535 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.914 Y131.876 Z5 F42000
G1 X130.224 Y139.99 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4186
M204 S6000
G1 X124.618 Y139.991 E.18598
G1 X124.618 Y138.934 E.03505
G1 X128.845 Y138.934 E.14022
G1 X128.845 Y129.609 E.30933
G1 X130.224 Y129.609 E.04577
G1 X130.224 Y139.93 E.34238
M204 S10000
G1 X130.631 Y140.398 F42000
G1 F4186
M204 S6000
G1 X124.211 Y140.398 E.21299
G1 X124.211 Y129.202 E.37139
G1 X124.697 Y129.202 E.01613
G1 X124.697 Y138.527 E.30933
G1 X128.438 Y138.527 E.12408
G1 X128.438 Y129.202 E.30933
G1 X130.366 Y129.202 E.06396
G1 X130.366 Y127.198 E.06648
G1 X124.211 Y127.198 E.20417
G1 X124.211 Y117.202 E.33158
G1 X130.366 Y117.202 E.20417
G1 X130.366 Y115.602 E.05307
G1 X130.631 Y115.602 E.00881
G1 X130.631 Y140.338 E.82052
; WIPE_START
G1 F8843.478
G1 X128.632 Y140.356 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.298 Y132.841 Z5 F42000
G1 X124.454 Y116.81 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4186
M204 S5000
G1 X124.454 Y115.59 E.03749
G1 X129.974 Y115.59 E.16961
G1 X129.974 Y116.81 E.03749
G1 X124.514 Y116.81 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y115.59 E-.46416
G1 X125.232 Y115.59 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.949 Y123.027 Z5 F42000
G1 X131.017 Y140.648 Z5
G1 Z4.6
G1 E.8 F1800
G1 F4186
M204 S5000
G3 X130.836 Y140.79 I-.192 J-.059 E.0075
G1 X123.961 Y140.783 E.21125
G3 X123.819 Y140.59 I.061 J-.194 E.0079
G1 X123.819 Y115.407 E.77379
G3 X124.007 Y115.21 I.199 J.002 E.00921
G1 X130.878 Y115.217 E.21115
G3 X131.024 Y115.41 I-.048 J.187 E.00802
G1 X131.017 Y140.588 E.77365
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.95 Y140.749 E-.06635
G1 X130.836 Y140.79 E-.04569
G1 X129.131 Y140.788 E-.64795
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


G1 X129.048 Y139.462 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692401
G1 F4186
M204 S6000
G1 X124.821 Y139.462 E.2237
M204 S10000
G1 X124.454 Y138.731 F42000
; LINE_WIDTH: 0.12221
G1 F4186
M204 S6000
G1 X124.454 Y129.406 E.06025
M204 S10000
G1 X124.136 Y129.006 F42000
; LINE_WIDTH: 0.28589
G1 F4186
M204 S6000
G1 X124.136 Y127.394 E.03191
; WIPE_START
G1 F14816.644
G1 X124.136 Y129.006 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.893 Y129.138 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.30586
G1 F4186
M204 S6000
G1 X128.242 Y129.138 E.07174
; WIPE_START
G1 F13691.336
G1 X126.242 Y129.138 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P54 R8
G1 X129.291 Y130.056 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.52921
G1 F4186
M204 S6000
G1 X129.291 Y138.682 E.34183
G1 X129.393 Y138.715 E.00423
; LINE_WIDTH: 0.51226
G1 X129.41 Y138.781 E.0026
; LINE_WIDTH: 0.47836
G1 X129.427 Y138.847 E.00242
; LINE_WIDTH: 0.42814
G1 X129.444 Y138.912 E.00214
G1 X129.444 Y139.595 E.02142
G1 X129.829 Y139.595 E.01207
G1 X129.829 Y138.912 E.02141
; LINE_WIDTH: 0.44446
G1 X129.812 Y138.781 E.00435
; LINE_WIDTH: 0.47836
G1 X129.795 Y138.649 E.00472
; LINE_WIDTH: 0.528961
G1 X129.778 Y138.517 E.00527
G1 X129.778 Y130.056 E.33511
G1 X129.351 Y130.056 E.01688
; WIPE_START
G1 F7406.795
G1 X129.778 Y130.056 E-.16199
G1 X129.778 Y131.63 E-.59801
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.836 Y126.587 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.41239
G1 F4186
M204 S6000
G1 X129.836 Y117.813 E.26418
; WIPE_START
G1 F9743.687
G1 X129.836 Y119.813 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.136 Y117.006 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.28589
G1 F4186
M204 S6000
G1 X124.136 Y115.406 E.03167
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F14816.644
G1 X124.136 Y117.006 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/72
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z5 I-1.217 J.033 P1  F42000
G1 X124.454 Y128.81 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4186
M204 S5000
G1 X124.454 Y127.59 E.03749
G1 X129.974 Y127.59 E.16961
G1 X129.974 Y128.81 E.03749
G1 X124.514 Y128.81 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y127.59 E-.46416
G1 X125.232 Y127.59 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.235 Y134.955 Z5.2 F42000
G1 X128.099 Y138.135 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F4186
M204 S5000
G1 X125.143 Y138.135 E.09084
G1 X125.143 Y138.094 E.00126
G1 X125.143 Y129.506 E.26389
G1 X125.143 Y129.465 E.00126
G1 X128.099 Y129.465 E.09084
G1 X128.099 Y138.075 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.1 Y138.116 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.264 Y130.796 Z5.2 F42000
G1 X129.448 Y126.791 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4186
M204 S6000
G1 X129.448 Y117.609 E.30457
G1 X130.241 Y117.609 E.02632
G1 X130.241 Y126.791 E.30457
G1 X129.508 Y126.791 E.02433
; WIPE_START
G1 F8843.478
G1 X129.495 Y124.791 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.98 Y126.535 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F4186
M204 S6000
G1 X124.98 Y126.791 E.00849
G1 X124.635 Y126.791 E.01144
G1 X124.635 Y117.609 E.30457
G1 X124.98 Y117.609 E.01144
G1 X124.98 Y126.475 E.2941
M204 S10000
G1 X125.779 Y126.927 F42000
G1 F4186
M204 S6000
G1 X125.387 Y126.927 E.01301
G1 X125.387 Y117.473 E.31361
G1 X129.041 Y117.473 E.12121
G1 X129.041 Y126.927 E.31361
G1 X125.839 Y126.927 E.10622
M204 S250
G1 X125.779 Y126.535 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4186
M204 S5000
G1 X125.779 Y117.865 E.2664
G1 X128.649 Y117.865 E.08819
G1 X128.649 Y126.535 E.2664
G1 X125.839 Y126.535 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.825 Y124.535 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.922 Y131.874 Z5.2 F42000
G1 X130.241 Y139.99 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4186
M204 S6000
G1 X124.635 Y139.991 E.18599
G1 X124.635 Y138.934 E.03505
G1 X128.898 Y138.934 E.14143
G1 X128.898 Y129.609 E.30933
G1 X130.241 Y129.609 E.04455
G1 X130.241 Y139.93 E.34238
M204 S10000
G1 X130.648 Y140.398 F42000
G1 F4186
M204 S6000
G1 X124.228 Y140.398 E.21299
G1 X124.228 Y129.202 E.37139
G1 X124.751 Y129.202 E.01735
G1 X124.751 Y138.527 E.30933
G1 X128.491 Y138.527 E.12408
G1 X128.491 Y129.202 E.30933
G1 X130.366 Y129.202 E.06218
G1 X130.366 Y127.198 E.06648
G1 X124.228 Y127.198 E.20361
G1 X124.228 Y117.202 E.33158
G1 X130.366 Y117.202 E.20361
G1 X130.366 Y115.602 E.05307
G1 X130.648 Y115.602 E.00938
G1 X130.648 Y140.338 E.82052
; WIPE_START
G1 F8843.478
G1 X128.649 Y140.356 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.31 Y132.842 Z5.2 F42000
G1 X124.454 Y116.81 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4186
M204 S5000
G1 X124.454 Y115.59 E.03749
G1 X129.974 Y115.59 E.16961
G1 X129.974 Y116.81 E.03749
G1 X124.514 Y116.81 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y115.59 E-.46416
G1 X125.232 Y115.59 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.954 Y123.026 Z5.2 F42000
G1 X131.034 Y140.648 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F4186
M204 S5000
G3 X130.853 Y140.79 I-.192 J-.059 E.00751
G1 X123.978 Y140.783 E.21125
G3 X123.836 Y140.59 I.057 J-.191 E.00792
G1 X123.836 Y115.407 E.77379
G3 X124.024 Y115.21 I.199 J.002 E.00922
G1 X130.896 Y115.217 E.21116
G3 X131.041 Y115.41 I-.048 J.187 E.00801
G1 X131.034 Y140.588 E.77364
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.967 Y140.749 E-.06641
G1 X130.853 Y140.79 E-.04579
G1 X129.148 Y140.788 E-.64781
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


G1 X129.102 Y139.462 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692401
G1 F4186
M204 S6000
G1 X124.838 Y139.462 E.22565
M204 S10000
G1 X124.489 Y138.731 F42000
; LINE_WIDTH: 0.15891
G1 F4186
M204 S6000
G1 X124.489 Y129.406 E.08814
M204 S10000
G1 X124.145 Y129.006 F42000
; LINE_WIDTH: 0.269
G1 F4186
M204 S6000
G1 X124.145 Y127.394 E.0297
; WIPE_START
G1 F15000
G1 X124.145 Y129.006 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.947 Y129.138 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.30586
G1 F4186
M204 S6000
G1 X128.295 Y129.138 E.07174
; WIPE_START
G1 F13691.336
G1 X126.295 Y129.138 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.336 Y130.047 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51094
G1 F4186
M204 S6000
G1 X129.336 Y138.688 E.32956
G1 X129.438 Y138.719 E.00406
; LINE_WIDTH: 0.49399
G1 X129.455 Y138.784 E.00245
; LINE_WIDTH: 0.46009
G1 X129.471 Y138.848 E.00226
; LINE_WIDTH: 0.409856
G1 X129.488 Y138.912 E.00199
G1 X129.488 Y139.604 E.02067
G1 X129.855 Y139.604 E.01095
G1 X129.855 Y138.912 E.02067
; LINE_WIDTH: 0.42619
G1 X129.838 Y138.784 E.00405
; LINE_WIDTH: 0.46009
G1 X129.821 Y138.655 E.00441
; LINE_WIDTH: 0.510696
G1 X129.804 Y138.526 E.00495
G1 X129.804 Y130.047 E.32323
G1 X129.396 Y130.047 E.01555
; WIPE_START
G1 F7695.99
M73 P55 R8
G1 X129.804 Y130.047 E-.15505
G1 X129.804 Y131.639 E-.60495
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.845 Y126.587 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.42944
G1 F4186
M204 S6000
G1 X129.845 Y117.813 E.27637
; WIPE_START
G1 F9313.877
G1 X129.845 Y119.813 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.145 Y117.006 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.269
G1 F4186
M204 S6000
G1 X124.145 Y115.406 E.02947
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.145 Y117.006 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/72
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z5.2 I-1.217 J.032 P1  F42000
G1 X124.454 Y128.81 Z5.2
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4186
M204 S5000
G1 X124.454 Y127.59 E.03749
G1 X129.974 Y127.59 E.16961
G1 X129.974 Y128.81 E.03749
G1 X124.514 Y128.81 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y127.59 E-.46416
G1 X125.232 Y127.59 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.269 Y134.946 Z5.4 F42000
G1 X128.153 Y138.135 Z5.4
G1 Z5
G1 E.8 F1800
G1 F4186
M204 S5000
G1 X125.196 Y138.135 E.09084
G1 X125.196 Y138.094 E.00126
G1 X125.196 Y129.506 E.26389
G1 X125.196 Y129.465 E.00126
G1 X128.153 Y129.465 E.09084
G1 X128.153 Y138.075 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.153 Y138.116 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.285 Y130.787 Z5.4 F42000
G1 X129.448 Y126.791 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4186
M204 S6000
G1 X129.448 Y117.609 E.30457
G1 X130.258 Y117.609 E.02689
G1 X130.258 Y126.791 E.30457
G1 X129.508 Y126.791 E.0249
; WIPE_START
G1 F8843.478
G1 X129.495 Y124.791 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.98 Y126.535 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F4186
M204 S6000
G1 X124.98 Y126.791 E.00849
G1 X124.652 Y126.791 E.01088
G1 X124.652 Y117.609 E.30457
G1 X124.98 Y117.609 E.01088
G1 X124.98 Y126.475 E.2941
M204 S10000
G1 X125.779 Y126.927 F42000
G1 F4186
M204 S6000
G1 X125.387 Y126.927 E.01301
G1 X125.387 Y117.473 E.31361
G1 X129.041 Y117.473 E.12121
G1 X129.041 Y126.927 E.31361
G1 X125.839 Y126.927 E.10622
M204 S250
G1 X125.779 Y126.535 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4186
M204 S5000
G1 X125.779 Y117.865 E.2664
G1 X128.649 Y117.865 E.08819
G1 X128.649 Y126.535 E.2664
G1 X125.839 Y126.535 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.825 Y124.535 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.929 Y131.872 Z5.4 F42000
G1 X130.258 Y139.99 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4186
M204 S6000
G1 X124.652 Y139.991 E.18599
G1 X124.652 Y138.934 E.03505
G1 X128.952 Y138.934 E.14265
G1 X128.952 Y129.609 E.30933
G1 X130.258 Y129.609 E.04334
G1 X130.258 Y139.93 E.34238
M204 S10000
G1 X130.666 Y140.398 F42000
G1 F4186
M204 S6000
G1 X124.245 Y140.398 E.213
G1 X124.245 Y129.202 E.37139
G1 X124.804 Y129.202 E.01857
G1 X124.804 Y138.527 E.30933
G1 X128.545 Y138.527 E.12408
G1 X128.545 Y129.202 E.30933
G1 X130.366 Y129.202 E.0604
G1 X130.366 Y127.198 E.06648
G1 X124.245 Y127.198 E.20305
G1 X124.245 Y117.202 E.33158
G1 X130.366 Y117.202 E.20305
G1 X130.366 Y115.602 E.05307
G1 X130.666 Y115.602 E.00994
G1 X130.666 Y140.338 E.82052
; WIPE_START
G1 F8843.478
G1 X128.666 Y140.356 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.322 Y132.843 Z5.4 F42000
G1 X124.454 Y116.81 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4186
M204 S5000
G1 X124.454 Y115.59 E.03749
G1 X129.974 Y115.59 E.16961
G1 X129.974 Y116.81 E.03749
G1 X124.514 Y116.81 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y115.59 E-.46416
G1 X125.232 Y115.59 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.959 Y123.025 Z5.4 F42000
G1 X131.051 Y140.648 Z5.4
G1 Z5
G1 E.8 F1800
G1 F4186
M204 S5000
G3 X130.87 Y140.79 I-.189 J-.055 E.00753
G1 X123.995 Y140.783 E.21125
G3 X123.852 Y140.59 I.06 J-.194 E.0079
G1 X123.852 Y115.407 E.77379
G3 X124.04 Y115.21 I.199 J.002 E.00921
G1 X130.895 Y115.212 E.21061
G1 X130.906 Y115.215 E.00036
G3 X131.058 Y115.41 I-.043 J.19 E.00823
G1 X131.051 Y140.588 E.77365
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.986 Y140.748 E-.06565
G1 X130.87 Y140.79 E-.04661
G1 X129.166 Y140.788 E-.64774
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


G1 X129.155 Y139.462 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692401
G1 F4186
M204 S6000
G1 X124.855 Y139.462 E.22759
M204 S10000
G1 X124.524 Y138.731 F42000
; LINE_WIDTH: 0.19561
G1 F4186
M204 S6000
G1 X124.524 Y129.406 E.11602
M204 S10000
G1 X124.153 Y129.006 F42000
; LINE_WIDTH: 0.25211
G1 F4186
M204 S6000
G1 X124.153 Y127.394 E.02748
; WIPE_START
G1 F15000
G1 X124.153 Y129.006 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125 Y129.138 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.30586
G1 F4186
M204 S6000
G1 X128.349 Y129.138 E.07174
; WIPE_START
G1 F13691.336
G1 X126.349 Y129.138 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.38 Y130.038 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.49268
G1 F4186
M204 S6000
G1 X129.38 Y138.694 E.31726
G1 X129.482 Y138.724 E.00389
; LINE_WIDTH: 0.475729
G1 X129.499 Y138.787 E.00229
; LINE_WIDTH: 0.441825
G1 X129.516 Y138.85 E.00211
; LINE_WIDTH: 0.391572
G1 X129.533 Y138.912 E.00185
G1 X129.533 Y139.613 E.0199
G1 X129.881 Y139.613 E.00989
G1 X129.881 Y138.912 E.0199
; LINE_WIDTH: 0.407922
G1 X129.864 Y138.787 E.00376
; LINE_WIDTH: 0.441825
G1 X129.847 Y138.662 E.00411
; LINE_WIDTH: 0.492442
G1 X129.83 Y138.536 E.00464
G1 X129.83 Y130.038 E.31131
G1 X129.44 Y130.038 E.01428
; WIPE_START
G1 F8008.506
G1 X129.83 Y130.038 E-.14811
G1 X129.83 Y131.648 E-.61189
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.853 Y126.587 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.4465
G1 F4186
M204 S6000
G1 X129.853 Y117.813 E.28857
; WIPE_START
G1 F8920.165
G1 X129.853 Y119.813 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.153 Y117.006 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.25211
G1 F4186
M204 S6000
G1 X124.153 Y115.406 E.02727
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.153 Y117.006 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/72
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z5.4 I-1.217 J.031 P1  F42000
M73 P56 R8
G1 X124.454 Y128.81 Z5.4
G1 Z5.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4164
M204 S5000
G1 X124.454 Y127.59 E.03749
G1 X129.974 Y127.59 E.16961
G1 X129.974 Y128.81 E.03749
G1 X124.514 Y128.81 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y127.59 E-.46416
G1 X125.232 Y127.59 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.304 Y134.936 Z5.6 F42000
G1 X128.206 Y138.135 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F4164
M204 S5000
G1 X125.25 Y138.135 E.09084
G1 X125.25 Y138.094 E.00126
G1 X125.25 Y129.506 E.26389
G1 X125.25 Y129.465 E.00126
G1 X128.206 Y129.465 E.09084
G1 X128.206 Y138.075 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.207 Y138.116 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.307 Y130.778 Z5.6 F42000
G1 X129.448 Y126.791 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4164
M204 S6000
G1 X129.448 Y117.609 E.30457
G1 X130.276 Y117.609 E.02746
G1 X130.276 Y126.791 E.30457
G1 X129.508 Y126.791 E.02547
; WIPE_START
G1 F8843.478
G1 X129.495 Y124.791 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.98 Y126.535 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F4164
M204 S6000
G1 X124.98 Y126.791 E.00849
G1 X124.668 Y126.791 E.01032
G1 X124.668 Y117.609 E.30457
G1 X124.98 Y117.609 E.01032
G1 X124.98 Y126.475 E.2941
M204 S10000
G1 X125.779 Y126.927 F42000
G1 F4164
M204 S6000
G1 X125.387 Y126.927 E.01301
G1 X125.387 Y117.473 E.31361
G1 X129.041 Y117.473 E.12121
G1 X129.041 Y126.927 E.31361
G1 X125.839 Y126.927 E.10622
M204 S250
G1 X125.779 Y126.535 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4164
M204 S5000
G1 X125.779 Y117.865 E.2664
G1 X128.649 Y117.865 E.08819
G1 X128.649 Y126.535 E.2664
G1 X125.839 Y126.535 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.825 Y124.535 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.937 Y131.869 Z5.6 F42000
G1 X130.276 Y139.99 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4164
M204 S6000
G1 X124.668 Y139.991 E.186
G1 X124.668 Y138.934 E.03505
G1 X129.005 Y138.934 E.14387
G1 X129.005 Y129.609 E.30933
G1 X130.276 Y129.609 E.04213
G1 X130.276 Y139.93 E.34238
M204 S10000
G1 X130.683 Y140.398 F42000
G1 F4164
M204 S6000
G1 X124.261 Y140.398 E.213
G1 X124.261 Y129.202 E.37139
G1 X124.858 Y129.202 E.01979
G1 X124.858 Y138.527 E.30933
G1 X128.598 Y138.527 E.12408
G1 X128.598 Y129.202 E.30933
G1 X130.366 Y129.202 E.05863
G1 X130.366 Y127.198 E.06648
G1 X124.261 Y127.198 E.20249
G1 X124.261 Y117.202 E.33158
G1 X130.366 Y117.202 E.20249
G1 X130.366 Y115.602 E.05307
G1 X130.683 Y115.602 E.01051
G1 X130.683 Y140.338 E.82052
; WIPE_START
G1 F8843.478
G1 X128.683 Y140.356 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.333 Y132.844 Z5.6 F42000
G1 X124.454 Y116.81 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4164
M204 S5000
G1 X124.454 Y115.59 E.03749
G1 X129.974 Y115.59 E.16961
G1 X129.974 Y116.81 E.03749
G1 X124.514 Y116.81 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y115.59 E-.46416
G1 X125.232 Y115.59 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.963 Y123.024 Z5.6 F42000
G1 X131.068 Y140.648 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F4164
M204 S5000
G3 X130.887 Y140.79 I-.189 J-.055 E.00754
G1 X124.012 Y140.783 E.21125
G3 X123.869 Y140.59 I.06 J-.194 E.00789
G1 X123.869 Y115.407 E.77379
G3 X124.057 Y115.21 I.197 J-.001 E.00925
G1 X130.912 Y115.212 E.21062
G1 X130.923 Y115.215 E.00036
G3 X131.075 Y115.41 I-.043 J.19 E.00823
G1 X131.068 Y140.588 E.77365
; WIPE_START
G1 F9547.055
M204 S6000
G1 X131.003 Y140.748 E-.06565
G1 X130.887 Y140.79 E-.04669
G1 X129.183 Y140.788 E-.64767
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


G1 X129.209 Y139.462 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692401
G1 F4164
M204 S6000
G1 X124.872 Y139.462 E.22953
M204 S10000
G1 X124.56 Y138.731 F42000
; LINE_WIDTH: 0.2323
G1 F4164
M204 S6000
G1 X124.56 Y129.406 E.1439
M204 S10000
G1 X125.054 Y129.138 F42000
; LINE_WIDTH: 0.30586
G1 F4164
M204 S6000
G1 X128.402 Y129.138 E.07174
; WIPE_START
G1 F13691.336
G1 X126.402 Y129.138 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.425 Y130.028 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.47441
G1 F4164
M204 S6000
G1 X129.425 Y138.7 E.30491
G1 X129.526 Y138.729 E.00372
; LINE_WIDTH: 0.457459
G1 X129.543 Y138.79 E.00214
; LINE_WIDTH: 0.423555
G1 X129.56 Y138.851 E.00197
; LINE_WIDTH: 0.373287
G1 X129.577 Y138.912 E.00171
G1 X129.577 Y139.622 E.0191
G1 X129.907 Y139.622 E.00888
G1 X129.907 Y138.912 E.0191
; LINE_WIDTH: 0.389652
G1 X129.89 Y138.79 E.00348
; LINE_WIDTH: 0.423555
G1 X129.873 Y138.668 E.00382
; LINE_WIDTH: 0.474179
G1 X129.856 Y138.546 E.00433
G1 X129.856 Y130.028 E.29933
G1 X129.485 Y130.028 E.01306
; WIPE_START
G1 F8347.668
G1 X129.856 Y130.028 E-.14117
G1 X129.856 Y131.657 E-.61883
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.862 Y126.587 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.46355
G1 F4164
M204 S6000
G1 X129.862 Y117.813 E.30076
; WIPE_START
G1 F8558.59
G1 X129.862 Y119.813 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.162 Y117.006 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.23521
G1 F4164
M204 S6000
G1 X124.162 Y115.406 E.02506
M204 S10000
G1 X124.162 Y127.394 F42000
G1 F4164
M204 S6000
G1 X124.162 Y129.006 E.02526
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.162 Y127.394 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/72
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z5.6 I-1.192 J.246 P1  F42000
G1 X124.454 Y128.81 Z5.6
G1 Z5.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4154
M204 S5000
G1 X124.454 Y127.59 E.03749
G1 X129.974 Y127.59 E.16961
G1 X129.974 Y128.81 E.03749
G1 X124.514 Y128.81 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y127.59 E-.46416
G1 X125.232 Y127.59 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.339 Y134.926 Z5.8 F42000
G1 X128.26 Y138.135 Z5.8
G1 Z5.4
G1 E.8 F1800
M73 P57 R8
G1 F4154
M204 S5000
G1 X125.304 Y138.135 E.09084
G1 X125.304 Y138.094 E.00126
G1 X125.304 Y129.506 E.26389
G1 X125.304 Y129.465 E.00126
G1 X128.26 Y129.465 E.09084
G1 X128.26 Y138.075 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.26 Y138.116 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.328 Y130.769 Z5.8 F42000
G1 X129.448 Y126.791 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4154
M204 S6000
G1 X129.448 Y117.609 E.30457
G1 X130.295 Y117.609 E.0281
G1 X130.295 Y126.791 E.30457
G1 X129.508 Y126.791 E.02611
; WIPE_START
G1 F8843.478
G1 X129.495 Y124.791 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.98 Y126.535 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
G1 F4154
M204 S6000
G1 X124.98 Y126.791 E.00849
G1 X124.685 Y126.791 E.00976
G1 X124.685 Y117.609 E.30457
G1 X124.98 Y117.609 E.00976
G1 X124.98 Y126.475 E.2941
M204 S10000
G1 X125.779 Y126.927 F42000
G1 F4154
M204 S6000
G1 X125.387 Y126.927 E.01301
G1 X125.387 Y117.473 E.31361
G1 X129.041 Y117.473 E.12121
G1 X129.041 Y126.927 E.31361
G1 X125.839 Y126.927 E.10622
M204 S250
G1 X125.779 Y126.535 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4154
M204 S5000
G1 X125.779 Y117.865 E.2664
G1 X128.649 Y117.865 E.08819
G1 X128.649 Y126.535 E.2664
G1 X125.839 Y126.535 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.825 Y124.535 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.945 Y131.867 Z5.8 F42000
G1 X130.295 Y139.99 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4154
M204 S6000
G1 X124.685 Y139.991 E.18608
G1 X124.685 Y138.934 E.03505
G1 X129.059 Y138.934 E.14508
G1 X129.059 Y129.609 E.30933
G1 X130.295 Y129.609 E.041
G1 X130.295 Y139.93 E.34238
M204 S10000
G1 X130.702 Y140.398 F42000
G1 F4154
M204 S6000
G1 X124.278 Y140.398 E.21309
G1 X124.278 Y129.202 E.37139
G1 X124.911 Y129.202 E.021
G1 X124.911 Y138.527 E.30933
G1 X128.652 Y138.527 E.12408
G1 X128.652 Y129.202 E.30933
G1 X130.366 Y129.202 E.05685
G1 X130.366 Y127.198 E.06648
G1 X124.278 Y127.198 E.20193
G1 X124.278 Y117.202 E.33158
G1 X130.366 Y117.202 E.20193
G1 X130.366 Y115.602 E.05306
G1 X130.702 Y115.602 E.01116
G1 X130.702 Y140.338 E.82051
; WIPE_START
G1 F8843.478
G1 X128.702 Y140.356 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.347 Y132.845 Z5.8 F42000
G1 X124.454 Y116.81 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4154
M204 S5000
G1 X124.454 Y115.59 E.03749
G1 X129.974 Y115.59 E.16961
G1 X129.974 Y116.81 E.03749
G1 X124.514 Y116.81 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y115.59 E-.46416
G1 X125.232 Y115.59 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.969 Y123.022 Z5.8 F42000
G1 X131.087 Y140.648 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F4154
M204 S5000
G3 X130.904 Y140.79 I-.19 J-.057 E.00759
G1 X124.029 Y140.783 E.21127
G3 X123.886 Y140.59 I.061 J-.194 E.0079
G1 X123.886 Y115.407 E.77379
G3 X124.074 Y115.21 I.199 J.002 E.00921
G1 X130.904 Y115.21 E.20987
G3 X131.094 Y115.41 I-.01 J.199 E.00934
G1 X131.087 Y140.588 E.77364
; WIPE_START
G1 F9547.055
M204 S6000
G1 X131.022 Y140.748 E-.06561
G1 X130.904 Y140.79 E-.04737
G1 X129.202 Y140.788 E-.64702
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


G1 X129.263 Y139.462 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692392
G1 F4154
M204 S6000
G1 X124.889 Y139.462 E.23147
M204 S10000
G1 X124.595 Y138.731 F42000
; LINE_WIDTH: 0.269
G1 F4154
M204 S6000
G1 X124.595 Y129.406 E.17179
M204 S10000
G1 X125.108 Y129.138 F42000
; LINE_WIDTH: 0.30586
G1 F4154
M204 S6000
G1 X128.456 Y129.138 E.07174
; WIPE_START
G1 F13691.336
G1 X126.456 Y129.138 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.47 Y130.02 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.45733
G1 F4154
M204 S6000
G1 X129.47 Y138.706 E.29333
G1 X129.572 Y138.734 E.00356
; LINE_WIDTH: 0.44038
G1 X129.588 Y138.794 E.002
; LINE_WIDTH: 0.40648
G1 X129.605 Y138.853 E.00183
; LINE_WIDTH: 0.356203
G1 X129.622 Y138.912 E.00158
G1 X129.622 Y139.631 E.01833
G1 X129.935 Y139.631 E.00798
G1 X129.935 Y138.912 E.01833
; LINE_WIDTH: 0.37258
G1 X129.918 Y138.794 E.00323
; LINE_WIDTH: 0.40648
G1 X129.901 Y138.675 E.00356
; LINE_WIDTH: 0.457104
G1 X129.884 Y138.556 E.00405
G1 X129.884 Y130.02 E.28809
G1 X129.53 Y130.02 E.01196
; WIPE_START
G1 F8691.787
G1 X129.884 Y130.02 E-.13468
G1 X129.884 Y131.665 E-.62532
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.871 Y126.587 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.48299
G1 F4154
M204 S6000
G1 X129.871 Y117.813 E.31466
; WIPE_START
G1 F8180.516
G1 X129.871 Y119.813 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.17 Y117.006 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.21832
G1 F4154
M204 S6000
G1 X124.17 Y115.406 E.02286
M204 S10000
G1 X124.17 Y127.394 F42000
G1 F4154
M204 S6000
G1 X124.17 Y129.006 E.02304
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.17 Y127.394 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/72
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z5.8 I-1.193 J.239 P1  F42000
G1 X124.454 Y128.81 Z5.8
G1 Z5.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4159
M204 S5000
G1 X124.454 Y127.59 E.03749
G1 X129.974 Y127.59 E.16961
G1 X129.974 Y128.81 E.03749
G1 X124.514 Y128.81 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y127.59 E-.46416
G1 X125.232 Y127.59 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.373 Y134.916 Z6 F42000
G1 X128.314 Y138.135 Z6
G1 Z5.6
G1 E.8 F1800
G1 F4159
M204 S5000
G1 X125.357 Y138.135 E.09084
G1 X125.357 Y138.094 E.00126
M73 P58 R8
G1 X125.357 Y129.506 E.26389
G1 X125.357 Y129.465 E.00126
G1 X128.314 Y129.465 E.09084
G1 X128.314 Y138.075 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.314 Y138.116 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.35 Y130.76 Z6 F42000
G1 X129.448 Y126.791 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4159
M204 S6000
G1 X129.448 Y117.609 E.30457
G1 X130.321 Y117.609 E.02897
G1 X130.321 Y126.791 E.30457
G1 X129.508 Y126.791 E.02698
; WIPE_START
G1 F8843.478
G1 X129.495 Y124.791 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.98 Y126.535 Z6 F42000
G1 Z5.6
G1 E.8 F1800
G1 F4159
M204 S6000
G1 X124.98 Y126.791 E.00849
G1 X124.702 Y126.791 E.0092
G1 X124.702 Y117.609 E.30457
G1 X124.98 Y117.609 E.0092
G1 X124.98 Y126.475 E.2941
M204 S10000
G1 X125.779 Y126.927 F42000
G1 F4159
M204 S6000
G1 X125.387 Y126.927 E.01301
G1 X125.387 Y117.473 E.31361
G1 X129.041 Y117.473 E.12121
G1 X129.041 Y126.927 E.31361
G1 X125.839 Y126.927 E.10622
M204 S250
G1 X125.779 Y126.535 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4159
M204 S5000
G1 X125.779 Y117.865 E.2664
G1 X128.649 Y117.865 E.08819
G1 X128.649 Y126.535 E.2664
G1 X125.839 Y126.535 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.825 Y124.535 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.957 Y131.864 Z6 F42000
G1 X130.321 Y139.99 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4159
M204 S6000
G1 X124.702 Y139.991 E.18639
G1 X124.702 Y138.934 E.03505
G1 X129.113 Y138.934 E.1463
G1 X129.113 Y129.609 E.30933
G1 X130.321 Y129.609 E.04009
G1 X130.321 Y139.93 E.34238
M204 S10000
G1 X130.728 Y140.398 F42000
G1 F4159
M204 S6000
G1 X124.295 Y140.398 E.2134
G1 X124.295 Y129.202 E.37139
G1 X124.965 Y129.202 E.02222
G1 X124.965 Y138.527 E.30933
G1 X128.706 Y138.527 E.12408
G1 X128.706 Y129.202 E.30933
G1 X130.366 Y129.202 E.05507
G1 X130.366 Y127.198 E.06648
G1 X124.295 Y127.198 E.20137
G1 X124.295 Y117.202 E.33158
G1 X130.366 Y117.202 E.20137
G1 X130.366 Y115.602 E.05307
G1 X130.728 Y115.602 E.01203
G1 X130.728 Y140.338 E.82052
; WIPE_START
G1 F8843.478
G1 X128.728 Y140.356 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.365 Y132.847 Z6 F42000
G1 X124.454 Y116.81 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4159
M204 S5000
G1 X124.454 Y115.59 E.03749
M73 P58 R7
G1 X129.974 Y115.59 E.16961
G1 X129.974 Y116.81 E.03749
G1 X124.514 Y116.81 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y115.59 E-.46416
G1 X125.232 Y115.59 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.976 Y123.021 Z6 F42000
G1 X131.114 Y140.648 Z6
G1 Z5.6
G1 E.8 F1800
G1 F4159
M204 S5000
G3 X130.931 Y140.79 I-.19 J-.057 E.00759
G1 X124.046 Y140.783 E.21156
G3 X123.903 Y140.59 I.061 J-.194 E.00789
G1 X123.903 Y115.407 E.77379
G3 X124.091 Y115.21 I.199 J.002 E.00921
G1 X130.973 Y115.217 E.21147
G3 X131.12 Y115.41 I-.046 J.188 E.00808
G1 X131.114 Y140.588 E.77364
; WIPE_START
G1 F9547.055
M204 S6000
G1 X131.048 Y140.748 E-.06569
G1 X130.931 Y140.79 E-.04731
G1 X129.228 Y140.788 E-.64701
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


G1 X129.316 Y139.462 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692392
G1 F4159
M204 S6000
G1 X124.906 Y139.462 E.23341
M204 S10000
G1 X124.63 Y138.731 F42000
; LINE_WIDTH: 0.3057
G1 F4159
M204 S6000
G1 X124.63 Y129.406 E.19968
M204 S10000
G1 X125.161 Y129.138 F42000
; LINE_WIDTH: 0.30586
G1 F4159
M204 S6000
G1 X128.509 Y129.138 E.07174
; WIPE_START
G1 F13691.336
G1 X126.509 Y129.138 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.885 Y126.587 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.50932
G1 F4159
M204 S6000
G1 X129.885 Y117.813 E.33349
; WIPE_START
G1 F7718.696
G1 X129.885 Y119.813 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.178 Y117.006 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.20143
G1 F4159
M204 S6000
G1 X124.178 Y115.406 E.02066
M204 S10000
G1 X124.178 Y127.394 F42000
G1 F4159
M204 S6000
G1 X124.178 Y129.006 E.02082
; WIPE_START
G1 F15000
G1 X124.178 Y127.394 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.404 Y134.311 Z6 F42000
G1 X129.819 Y139.488 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.64107
G1 F4159
M204 S6000
G1 X129.819 Y139.103 E.01877
M204 S10000
G1 X129.517 Y130.013 F42000
; LINE_WIDTH: 0.443705
G1 F4159
M204 S6000
G1 X129.517 Y138.564 E.27925
G1 X129.52 Y138.709 E.00475
G1 X129.618 Y138.738 E.00336
; LINE_WIDTH: 0.468373
G1 X129.668 Y138.814 E.00316
; LINE_WIDTH: 0.517718
G1 X129.719 Y138.89 E.00353
; LINE_WIDTH: 0.567063
G1 X129.769 Y138.967 E.00389
; LINE_WIDTH: 0.616408
G1 X129.819 Y139.043 E.00426
; LINE_WIDTH: 0.618721
G1 X129.841 Y138.965 E.0038
; LINE_WIDTH: 0.574003
G1 X129.863 Y138.887 E.0035
; LINE_WIDTH: 0.529285
G1 X129.886 Y138.809 E.00321
; LINE_WIDTH: 0.484567
G1 X129.908 Y138.731 E.00291
; LINE_WIDTH: 0.44354
G2 X129.917 Y138.564 I-.181 J-.094 E.00565
G1 X129.917 Y130.013 E.27914
G1 X129.577 Y130.013 E.01113
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8986.084
G1 X129.917 Y130.013 E-.1295
G1 X129.917 Y131.672 E-.6305
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/72
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z6 I.565 J-1.078 P1  F42000
G1 X124.454 Y128.81 Z6
G1 Z5.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4171
M204 S5000
G1 X124.454 Y127.59 E.03749
G1 X129.974 Y127.59 E.16961
G1 X129.974 Y128.81 E.03749
G1 X124.514 Y128.81 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y127.59 E-.46416
G1 X125.232 Y127.59 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.407 Y134.906 Z6.2 F42000
G1 X128.367 Y138.135 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F4171
M204 S5000
G1 X125.411 Y138.135 E.09084
G1 X125.411 Y138.094 E.00126
G1 X125.411 Y129.506 E.26389
G1 X125.411 Y129.465 E.00126
G1 X128.367 Y129.465 E.09084
G1 X128.367 Y138.075 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.368 Y138.116 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.371 Y130.751 Z6.2 F42000
G1 X129.448 Y126.791 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4171
M204 S6000
G1 X129.448 Y117.609 E.30457
G1 X130.348 Y117.609 E.02985
G1 X130.348 Y126.791 E.30457
G1 X129.508 Y126.791 E.02786
; WIPE_START
G1 F8843.478
G1 X129.495 Y124.791 E-.76
; WIPE_END
M73 P59 R7
G1 E-.04 F1800
M204 S10000
G1 X124.98 Y126.535 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
G1 F4171
M204 S6000
G1 X124.98 Y126.791 E.00849
G1 X124.719 Y126.791 E.00864
G1 X124.719 Y117.609 E.30457
G1 X124.98 Y117.609 E.00864
G1 X124.98 Y126.475 E.2941
M204 S10000
G1 X125.779 Y126.927 F42000
G1 F4171
M204 S6000
G1 X125.387 Y126.927 E.01301
G1 X125.387 Y117.473 E.31361
G1 X129.041 Y117.473 E.12121
G1 X129.041 Y126.927 E.31361
G1 X125.839 Y126.927 E.10622
M204 S250
G1 X125.779 Y126.535 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4171
M204 S5000
G1 X125.779 Y117.865 E.2664
G1 X128.649 Y117.865 E.08819
G1 X128.649 Y126.535 E.2664
G1 X125.839 Y126.535 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.825 Y124.535 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.968 Y131.86 Z6.2 F42000
G1 X130.348 Y139.99 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4171
M204 S6000
G1 X124.719 Y139.991 E.18671
G1 X124.719 Y138.934 E.03505
G1 X129.166 Y138.934 E.14752
G1 X129.166 Y129.609 E.30933
G1 X130.348 Y129.609 E.03919
G1 X130.348 Y139.93 E.34238
M204 S10000
G1 X130.755 Y140.398 F42000
G1 F4171
M204 S6000
G1 X124.312 Y140.398 E.21371
G1 X124.312 Y129.202 E.37139
G1 X125.019 Y129.202 E.02344
G1 X125.019 Y138.527 E.30933
G1 X128.759 Y138.527 E.12408
G1 X128.759 Y129.202 E.30933
G1 X130.366 Y129.202 E.05329
G1 X130.366 Y127.198 E.06648
G1 X124.312 Y127.198 E.20081
G1 X124.312 Y117.202 E.33158
G1 X130.366 Y117.202 E.20081
G1 X130.366 Y115.602 E.05307
G1 X130.755 Y115.602 E.0129
G1 X130.755 Y140.338 E.82052
; WIPE_START
G1 F8843.478
G1 X128.755 Y140.356 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.383 Y132.848 Z6.2 F42000
G1 X124.454 Y116.81 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4171
M204 S5000
G1 X124.454 Y115.59 E.03749
G1 X129.974 Y115.59 E.16961
G1 X129.974 Y116.81 E.03749
G1 X124.514 Y116.81 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y115.59 E-.46416
G1 X125.232 Y115.59 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.984 Y123.019 Z6.2 F42000
G1 X131.14 Y140.648 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F4171
M204 S5000
G3 X130.957 Y140.79 I-.193 J-.06 E.00757
G1 X124.063 Y140.783 E.21185
G3 X123.92 Y140.59 I.061 J-.194 E.0079
G1 X123.92 Y115.408 E.77379
G3 X124.108 Y115.21 I.199 J.002 E.00922
G1 X130.982 Y115.212 E.21123
G1 X130.994 Y115.215 E.00037
G3 X131.147 Y115.41 I-.043 J.19 E.00826
G1 X131.14 Y140.588 E.77364
; WIPE_START
G1 F9547.055
M204 S6000
G1 X131.073 Y140.749 E-.06639
G1 X130.957 Y140.79 E-.04653
G1 X129.254 Y140.788 E-.64709
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


G1 X129.37 Y139.462 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692392
G1 F4171
M204 S6000
G1 X124.923 Y139.462 E.23535
M204 S10000
G1 X124.665 Y138.731 F42000
; LINE_WIDTH: 0.3424
G1 F4171
M204 S6000
G1 X124.665 Y129.406 E.22756
M204 S10000
G1 X125.215 Y129.138 F42000
; LINE_WIDTH: 0.30586
G1 F4171
M204 S6000
G1 X128.563 Y129.138 E.07174
; WIPE_START
G1 F13691.336
G1 X126.563 Y129.138 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.898 Y126.587 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.53565
G1 F4171
M204 S6000
G1 X129.898 Y117.813 E.35231
; WIPE_START
G1 F7306.232
G1 X129.898 Y119.813 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.187 Y117.006 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.18454
G1 F4171
M204 S6000
G1 X124.187 Y115.406 E.01846
M204 S10000
G1 X124.187 Y127.394 F42000
G1 F4171
M204 S6000
G1 X124.187 Y129.006 E.0186
; WIPE_START
G1 F15000
G1 X124.187 Y127.394 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.425 Y134.306 Z6.2 F42000
G1 X129.859 Y139.502 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.6138
G1 F4171
M204 S6000
G1 X129.859 Y139.056 E.02074
M204 S10000
G1 X129.563 Y130.006 F42000
; LINE_WIDTH: 0.429998
G1 F4171
M204 S6000
G1 X129.563 Y138.719 E.27482
G1 X129.671 Y138.761 E.00363
; LINE_WIDTH: 0.441572
G1 X129.723 Y138.811 E.00238
; LINE_WIDTH: 0.486735
G1 X129.776 Y138.862 E.00264
; LINE_WIDTH: 0.531899
G1 X129.829 Y138.912 E.00291
; LINE_WIDTH: 0.569315
G1 X129.844 Y138.954 E.00189
; LINE_WIDTH: 0.598985
G1 X129.859 Y138.996 E.002
; LINE_WIDTH: 0.590852
G1 X129.882 Y138.89 E.00484
; LINE_WIDTH: 0.544914
G1 X129.905 Y138.784 E.00444
; LINE_WIDTH: 0.498977
G1 X129.928 Y138.678 E.00403
; LINE_WIDTH: 0.430347
G1 X129.951 Y138.572 E.00342
G1 X129.951 Y130.006 E.27042
G1 X129.623 Y130.006 E.01033
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9292.081
G1 X129.951 Y130.006 E-.12432
G1 X129.951 Y131.679 E-.63568
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/72
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z6.2 I.563 J-1.079 P1  F42000
G1 X124.454 Y128.81 Z6.2
G1 Z6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4116
M204 S5000
G1 X124.454 Y127.59 E.03749
G1 X129.974 Y127.59 E.16961
G1 X129.974 Y128.81 E.03749
G1 X124.514 Y128.81 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y127.59 E-.46416
G1 X125.232 Y127.59 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.441 Y134.896 Z6.4 F42000
G1 X128.421 Y138.135 Z6.4
G1 Z6
G1 E.8 F1800
G1 F4116
M204 S5000
G1 X125.464 Y138.135 E.09084
G1 X125.464 Y138.094 E.00126
G1 X125.464 Y129.506 E.26389
G1 X125.464 Y129.465 E.00126
G1 X128.421 Y129.465 E.09084
G1 X128.421 Y138.075 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.421 Y138.116 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.392 Y130.742 Z6.4 F42000
G1 X129.448 Y126.791 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4116
M204 S6000
G1 X129.448 Y117.609 E.30457
G1 X130.374 Y117.609 E.03072
G1 X130.374 Y126.791 E.30457
G1 X129.508 Y126.791 E.02873
; WIPE_START
G1 F8843.478
G1 X129.495 Y124.791 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.779 Y126.927 Z6.4 F42000
G1 Z6
G1 E.8 F1800
G1 F4116
M204 S6000
G1 X125.387 Y126.927 E.01301
G1 X125.387 Y117.473 E.31361
G1 X129.041 Y117.473 E.12121
G1 X129.041 Y126.927 E.31361
G1 X125.839 Y126.927 E.10622
M204 S250
G1 X125.779 Y126.535 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4116
M204 S5000
G1 X125.779 Y117.865 E.2664
G1 X128.649 Y117.865 E.08819
G1 X128.649 Y126.535 E.2664
G1 X125.839 Y126.535 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.825 Y124.535 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.98 Y131.857 Z6.4 F42000
G1 X130.374 Y139.99 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4116
M204 S6000
G1 X124.736 Y139.991 E.18702
G1 X124.736 Y138.934 E.03505
G1 X129.22 Y138.934 E.14874
G1 X129.22 Y129.609 E.30933
G1 X130.374 Y129.609 E.03828
G1 X130.374 Y139.93 E.34238
M204 S10000
G1 X130.781 Y140.398 F42000
G1 F4116
M204 S6000
G1 X124.329 Y140.398 E.21403
G1 X124.329 Y129.202 E.37139
G1 X125.072 Y129.202 E.02465
G1 X125.072 Y138.527 E.30933
G1 X128.813 Y138.527 E.12408
G1 X128.813 Y129.202 E.30933
G1 X130.366 Y129.202 E.05152
G1 X130.366 Y127.198 E.06648
G1 X124.329 Y127.198 E.20025
G1 X124.329 Y117.202 E.33158
G1 X130.366 Y117.202 E.20025
G1 X130.366 Y115.602 E.05307
G1 X130.781 Y115.602 E.01378
G1 X130.781 Y140.338 E.82052
; WIPE_START
M73 P60 R7
G1 F8843.478
G1 X128.781 Y140.356 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.401 Y132.85 Z6.4 F42000
G1 X124.454 Y116.81 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4116
M204 S5000
G1 X124.454 Y115.59 E.03749
G1 X129.974 Y115.59 E.16961
G1 X129.974 Y116.81 E.03749
G1 X124.514 Y116.81 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y115.59 E-.46416
G1 X125.232 Y115.59 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.991 Y123.017 Z6.4 F42000
G1 X131.166 Y140.648 Z6.4
G1 Z6
G1 E.8 F1800
G1 F4116
M204 S5000
G3 X130.983 Y140.79 I-.193 J-.06 E.00758
G1 X124.079 Y140.783 E.21214
G3 X123.937 Y140.59 I.061 J-.194 E.00789
G1 X123.937 Y115.408 E.77379
G3 X124.125 Y115.21 I.199 J.002 E.00922
G1 X131.027 Y115.217 E.21208
G3 X131.173 Y115.41 I-.048 J.188 E.00804
G1 X131.166 Y140.588 E.77364
; WIPE_START
G1 F9547.055
M204 S6000
G1 X131.099 Y140.749 E-.06641
G1 X130.983 Y140.79 E-.04653
G1 X129.281 Y140.788 E-.64706
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


G1 X129.423 Y139.462 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692391
G1 F4116
M204 S6000
G1 X124.94 Y139.462 E.23729
M204 S10000
G1 X124.701 Y138.731 F42000
; LINE_WIDTH: 0.37909
G1 F4116
M204 S6000
G1 X124.701 Y129.406 E.25544
M204 S10000
G1 X125.268 Y129.138 F42000
; LINE_WIDTH: 0.30586
G1 F4116
M204 S6000
G1 X128.617 Y129.138 E.07174
; WIPE_START
G1 F13691.336
G1 X126.617 Y129.138 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.911 Y126.587 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.56198
G1 F4116
M204 S6000
G1 X129.911 Y117.813 E.37114
; WIPE_START
G1 F6935.614
G1 X129.911 Y119.813 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.858 Y117.406 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.6935
G1 F4116
M204 S6000
G1 X124.858 Y126.994 E.50834
M204 S10000
G1 X124.195 Y127.394 F42000
; LINE_WIDTH: 0.16764
G1 F4116
M204 S6000
G1 X124.195 Y129.006 E.01638
; WIPE_START
G1 F15000
G1 X124.195 Y127.394 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.445 Y134.3 Z6.4 F42000
G1 X129.899 Y139.515 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.58654
G1 F4116
M204 S6000
G1 X129.899 Y139.011 E.02235
M204 S10000
G1 X129.61 Y129.999 F42000
; LINE_WIDTH: 0.416693
G1 F4116
M204 S6000
G1 X129.61 Y138.566 E.26091
G1 X129.627 Y138.719 E.0047
G1 X129.715 Y138.74 E.00276
; LINE_WIDTH: 0.451522
G1 X129.78 Y138.798 E.0029
; LINE_WIDTH: 0.495185
G1 X129.846 Y138.855 E.00321
; LINE_WIDTH: 0.538849
G1 X129.912 Y138.912 E.00352
; LINE_WIDTH: 0.53664
G1 X129.936 Y138.797 E.00475
; LINE_WIDTH: 0.48856
G1 X129.96 Y138.681 E.00429
; LINE_WIDTH: 0.416756
G1 X129.984 Y138.566 E.0036
G1 X129.984 Y129.999 E.26095
G1 X129.67 Y129.999 E.00955
; WIPE_START
G1 F9629.906
G1 X129.984 Y129.999 E-.11914
G1 X129.984 Y131.686 E-.64086
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.184 Y124.585 Z6.4 F42000
G1 X124.195 Y117.006 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.16764
G1 F4116
M204 S6000
G1 X124.195 Y115.406 E.01626
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.195 Y117.006 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/72
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z6.4 I-1.194 J.237 P1  F42000
G1 X128.474 Y138.527 Z6.4
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4197
M204 S6000
G1 X125.126 Y138.527 E.11108
G1 X125.126 Y129.073 E.31361
G1 X128.866 Y129.073 E.12408
G1 X128.866 Y138.527 E.31361
G1 X128.534 Y138.527 E.01102
M204 S250
G1 X128.474 Y138.135 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4197
M204 S5000
G1 X125.518 Y138.135 E.09084
G1 X125.518 Y138.094 E.00126
G1 X125.518 Y129.506 E.26389
G1 X125.518 Y129.465 E.00126
G1 X128.474 Y129.465 E.09084
G1 X128.474 Y138.075 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.475 Y138.116 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.001 Y130.498 Z6.6 F42000
G1 X125.779 Y126.927 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4197
M204 S6000
G1 X125.387 Y126.927 E.01301
G1 X125.387 Y117.473 E.31361
G1 X129.041 Y117.473 E.12121
G1 X129.041 Y126.927 E.31361
G1 X125.839 Y126.927 E.10622
M204 S250
G1 X125.779 Y126.535 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4197
M204 S5000
G1 X125.779 Y117.865 E.2664
G1 X128.649 Y117.865 E.08819
G1 X128.649 Y126.535 E.2664
G1 X125.839 Y126.535 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.825 Y124.535 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.875 Y116.962 Z6.6 F42000
G1 X124.756 Y116.009 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
M204 S6000
G1 X124.864 Y116.009 E.00359
M106 S201.45
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X129.564 Y116.009 E.15591
M106 S201.45
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X129.946 Y116.009 E.01269
M106 S201.45
G1 F4197
G1 X130.4 Y116.009 E.01506
G1 X130.4 Y116.409 E.01327
G1 X130.4 Y139.99 E.78223
G1 X124.756 Y139.991 E.18725
G1 X124.756 Y138.934 E.03505
G1 X129.273 Y138.934 E.14987
G1 X129.273 Y129.582 E.31021
G1 X129.273 Y129.182 E.01327
G1 X129.273 Y128.782 E.01327
G1 F3674.307
G1 X129.273 Y128.666 E.00387
G1 F2760
G1 X125.156 Y128.666 E.1366
G1 X124.756 Y128.666 E.01327
M106 S255
G1 F840
G1 X124.756 Y127.617 E.03478
M106 S201.45
G1 F2363.438
G1 X124.756 Y127.334 E.0094
G1 F4197
G1 X125.156 Y127.334 E.01327
G1 X125.556 Y127.334 E.01327
G1 X129.448 Y127.334 E.12912
G1 X129.448 Y117.066 E.34062
G1 X125.556 Y117.066 E.12912
G1 X125.156 Y117.066 E.01327
G1 X124.756 Y117.066 E.01327
G1 F2363.371
G1 X124.756 Y116.782 E.0094
M106 S255
G1 F840
G1 X124.756 Y116.069 E.02365
M106 S201.45
M204 S10000
G1 X124.348 Y115.602 F42000
G1 F4197
M204 S6000
G1 X130.807 Y115.602 E.21425
G1 X130.807 Y140.398 E.82251
G1 X124.348 Y140.398 E.21425
G1 X124.348 Y115.662 E.82052
M204 S250
G1 X123.956 Y115.407 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4197
M204 S5000
G3 X124.146 Y115.21 I.2 J.003 E.00926
G1 X131.053 Y115.217 E.21222
G3 X131.199 Y115.41 I-.047 J.188 E.00805
G1 X131.199 Y140.593 E.77378
G3 X131.01 Y140.79 I-.198 J-.001 E.00928
G1 X124.1 Y140.783 E.21231
G3 X123.956 Y140.59 I.055 J-.192 E.00795
G1 X123.956 Y115.467 E.77194
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.973 Y115.325 E-.05461
G1 X124.009 Y115.271 E-.02475
G1 X124.083 Y115.222 E-.03361
G1 X124.146 Y115.21 E-.02441
G1 X125.785 Y115.212 E-.62262
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
M73 P61 R7
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X124.959 Y116.538 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692357
G1 F4197
M204 S6000
G1 X129.651 Y116.538 E.24832
; LINE_WIDTH: 0.723198
G1 X129.844 Y116.566 E.01077
G1 X129.864 Y116.64 E.00426
; LINE_WIDTH: 0.688913
G1 X129.884 Y116.714 E.00404
; LINE_WIDTH: 0.648668
G1 X129.904 Y116.788 E.00379
; LINE_WIDTH: 0.608423
G1 X129.924 Y116.862 E.00354
; LINE_WIDTH: 0.58831
G1 X129.924 Y127.538 E.47443
; WIPE_START
G1 F6600.781
G1 X129.924 Y125.538 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.6 I-.658 J-1.024 P1  F42000
G1 X124.737 Y128.87 Z6.6
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.41322
G1 F4197
M204 S6000
G1 X124.737 Y138.731 E.29755
M204 S10000
G1 X124.959 Y139.462 F42000
; LINE_WIDTH: 0.692391
G1 F4197
M204 S6000
G1 X129.477 Y139.462 E.2391
M204 S10000
G1 X129.939 Y139.529 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.55928
G1 F4197
M204 S6000
G1 X129.939 Y138.972 E.02341
M204 S10000
G1 X129.657 Y130.755 F42000
; LINE_WIDTH: 0.40281
G1 F4197
M204 S6000
G1 X129.657 Y138.523 E.22782
; LINE_WIDTH: 0.417458
G1 X129.672 Y138.614 E.0028
; LINE_WIDTH: 0.453894
G1 X129.686 Y138.705 E.00308
G1 X129.771 Y138.724 E.00293
; LINE_WIDTH: 0.485875
G1 X129.855 Y138.818 E.00455
; LINE_WIDTH: 0.534825
G1 X129.939 Y138.912 E.00505
; LINE_WIDTH: 0.539739
G1 X129.958 Y138.815 E.00402
; LINE_WIDTH: 0.500617
G1 X129.978 Y138.718 E.0037
; LINE_WIDTH: 0.461494
G1 X129.997 Y138.621 E.00339
; LINE_WIDTH: 0.403048
G1 X130.017 Y138.523 E.00291
G1 X130.017 Y130.74 E.2284
G1 X129.717 Y130.752 E.00881
M204 S10000
G1 X129.437 Y130.388 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.43074
M106 S255
G1 F3000
M204 S6000
G2 X130.067 Y130.356 I.216 J-1.987 E.02002
G1 X130.067 Y130 E.01125
G1 X129.607 Y130 E.01455
G1 X129.607 Y129.612 E.01226
G1 X130.067 Y129.612 E.01455
G1 X130.067 Y129.224 E.01226
G1 X129.607 Y129.224 E.01455
G1 X129.607 Y128.836 E.01226
G1 X130.067 Y128.836 E.01455
G1 X130.067 Y128.448 E.01226
G1 X129.607 Y128.448 E.01455
G1 X129.607 Y128.333 E.00366
G1 X125.089 Y128.333 E.14278
G1 X125.089 Y128.061 E.0086
G1 X130.067 Y128.061 E.15733
G1 X130.067 Y127.871 E.006
G1 X129.297 Y127.871 E.02434
G1 X129.297 Y127.673 E.00626
G1 X124.919 Y127.673 E.13834
M106 S201.45
M204 S10000
G1 X124.868 Y127.13 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.67404
G1 F4197
M204 S6000
G1 X124.868 Y117.269 E.50713
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5704.145
G1 X124.868 Y119.269 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/72
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z6.6 I-1.196 J.227 P1  F42000
G1 X128.528 Y138.527 Z6.6
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3951
M204 S6000
G1 X125.179 Y138.527 E.11108
G1 X125.179 Y129.073 E.31361
G1 X128.92 Y129.073 E.12408
G1 X128.92 Y138.527 E.31361
G1 X128.588 Y138.527 E.01102
M204 S250
G1 X128.528 Y138.135 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3951
M204 S5000
G1 X125.571 Y138.135 E.09084
G1 X125.571 Y138.094 E.00126
G1 X125.571 Y129.506 E.26389
G1 X125.571 Y129.465 E.00126
G1 X128.528 Y129.465 E.09084
G1 X128.528 Y138.075 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.528 Y138.116 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.018 Y130.5 Z6.8 F42000
G1 X125.779 Y126.927 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3951
M204 S6000
G1 X125.387 Y126.927 E.01301
G1 X125.387 Y117.473 E.31361
G1 X129.041 Y117.473 E.12121
G1 X129.041 Y126.927 E.31361
G1 X125.839 Y126.927 E.10622
M204 S250
G1 X125.779 Y126.535 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3951
M204 S5000
G1 X125.779 Y117.865 E.2664
G1 X128.649 Y117.865 E.08819
G1 X128.649 Y126.535 E.2664
G1 X125.839 Y126.535 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.825 Y124.535 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.898 Y116.959 Z6.8 F42000
G1 X124.782 Y116.009 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3951
M204 S6000
G1 X130.427 Y116.009 E.18725
G1 X130.427 Y139.99 E.7955
G1 X124.782 Y139.991 E.18725
G1 X124.782 Y138.934 E.03505
G1 X129.327 Y138.934 E.15077
G1 X129.327 Y128.666 E.34062
G1 X124.782 Y128.666 E.15077
G1 X124.782 Y127.334 E.04418
G1 X129.448 Y127.334 E.15478
G1 X129.448 Y117.066 E.34062
G1 X124.782 Y117.066 E.15478
G1 X124.782 Y116.069 E.03305
M204 S10000
G1 X124.375 Y115.602 F42000
G1 F3951
M204 S6000
G1 X130.834 Y115.602 E.21425
G1 X130.834 Y140.398 E.82251
G1 X124.375 Y140.398 E.21425
G1 X124.375 Y115.662 E.82052
M204 S250
G1 X123.983 Y115.408 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3951
M204 S5000
G3 X124.173 Y115.21 I.198 J0 E.00929
G1 X131.079 Y115.217 E.21222
G3 X131.226 Y115.41 I-.047 J.188 E.00806
G1 X131.219 Y140.648 E.77549
G3 X131.037 Y140.79 I-.193 J-.06 E.00753
G1 X124.127 Y140.783 E.21235
G3 X123.983 Y140.59 I.06 J-.195 E.00792
G1 X123.983 Y115.468 E.77194
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.999 Y115.324 E-.05474
G1 X124.037 Y115.269 E-.0255
G1 X124.11 Y115.222 E-.03288
G1 X124.173 Y115.21 E-.02429
G1 X125.811 Y115.212 E-.6226
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


G1 X124.985 Y116.538 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692345
G1 F3951
M204 S6000
G1 X129.651 Y116.538 E.24692
; LINE_WIDTH: 0.730294
G1 X129.864 Y116.572 E.01205
G1 X129.888 Y116.669 E.00559
; LINE_WIDTH: 0.68821
G1 X129.913 Y116.766 E.00524
; LINE_WIDTH: 0.639164
G1 X129.937 Y116.862 E.00485
; LINE_WIDTH: 0.61464
G1 X129.937 Y127.538 E.49734
; WIPE_START
G1 F6296.789
G1 X129.937 Y125.538 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.881 Y127.13 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.64771
G1 F3951
M204 S6000
G1 X124.881 Y117.269 E.48598
; WIPE_START
G1 F5952.48
G1 X124.881 Y119.269 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.798 Y126.901 Z6.8 F42000
G1 X124.777 Y128.87 Z6.8
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.44048
G1 F3951
M204 S6000
G1 X124.777 Y138.731 E.31946
M204 S10000
G1 X124.985 Y139.462 F42000
; LINE_WIDTH: 0.692391
G1 F3951
M204 S6000
G1 X129.53 Y139.462 E.24054
M204 S10000
G1 X129.979 Y139.542 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.53202
G1 F3951
M204 S6000
G1 X129.979 Y138.927 E.02453
; WIPE_START
G1 F7360.459
G1 X129.979 Y139.542 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.35 Y131.936 Z6.8 F42000
G1 X129.043 Y128.231 Z6.8
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.481235
G1 F3951
M204 S6000
G1 X129.67 Y128.309 E.02255
; LINE_WIDTH: 0.440203
G1 X129.687 Y128.386 E.00254
; LINE_WIDTH: 0.389313
G1 X129.704 Y128.462 E.00222
G1 X129.704 Y138.483 E.28285
; LINE_WIDTH: 0.413845
G1 X129.728 Y138.589 E.00328
; LINE_WIDTH: 0.473216
G1 X129.753 Y138.694 E.0038
G1 X129.826 Y138.71 E.00261
; LINE_WIDTH: 0.50586
G1 X129.895 Y138.79 E.00399
; LINE_WIDTH: 0.5419
G1 X129.965 Y138.869 E.0043
; LINE_WIDTH: 0.538578
M73 P62 R7
G1 X129.986 Y138.773 E.00399
; LINE_WIDTH: 0.495893
G1 X130.007 Y138.676 E.00365
; LINE_WIDTH: 0.453208
G1 X130.029 Y138.58 E.00331
; LINE_WIDTH: 0.389389
G1 X130.05 Y138.483 E.00279
G1 X130.05 Y128.462 E.28291
; LINE_WIDTH: 0.406188
G1 X130.033 Y128.309 E.00457
; LINE_WIDTH: 0.449947
G3 X130.016 Y127.948 I1.619 J-.257 E.012
; LINE_WIDTH: 0.443795
G1 X129.721 Y127.935 E.00964
; LINE_WIDTH: 0.416965
G1 X129.426 Y127.921 E.009
; LINE_WIDTH: 0.420502
G1 X129.362 Y127.904 E.00203
; LINE_WIDTH: 0.454405
G1 X129.299 Y127.887 E.00221
; LINE_WIDTH: 0.505127
G1 X129.235 Y127.871 E.00249
G1 X129.204 Y127.769 E.00401
G1 X125.217 Y127.769 E.15017
G1 X125.217 Y128.231 E.01741
G1 X128.983 Y128.231 E.14187
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7788.726
G1 X126.983 Y128.231 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/72
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z6.8 I-1.203 J.187 P1  F42000
G1 X128.581 Y138.527 Z6.8
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3932
M204 S6000
G1 X125.233 Y138.527 E.11108
G1 X125.233 Y129.073 E.31361
G1 X128.974 Y129.073 E.12408
G1 X128.974 Y138.527 E.31361
G1 X128.641 Y138.527 E.01102
M204 S250
G1 X128.581 Y138.135 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3932
M204 S5000
G1 X125.625 Y138.135 E.09084
G1 X125.625 Y138.094 E.00126
G1 X125.625 Y129.506 E.26389
G1 X125.625 Y129.465 E.00126
G1 X128.581 Y129.465 E.09084
G1 X128.581 Y138.075 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.582 Y138.116 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.035 Y130.503 Z7 F42000
G1 X125.779 Y126.927 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3932
M204 S6000
G1 X125.387 Y126.927 E.01301
G1 X125.387 Y117.473 E.31361
G1 X129.041 Y117.473 E.12121
G1 X129.041 Y126.927 E.31361
G1 X125.839 Y126.927 E.10622
M204 S250
G1 X125.779 Y126.535 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3932
M204 S5000
G1 X125.779 Y117.865 E.2664
G1 X128.649 Y117.865 E.08819
G1 X128.649 Y126.535 E.2664
G1 X125.839 Y126.535 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.825 Y124.535 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.921 Y116.956 Z7 F42000
G1 X124.808 Y116.009 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3932
M204 S6000
G1 X130.453 Y116.009 E.18725
G1 X130.453 Y139.99 E.7955
G1 X124.808 Y139.991 E.18725
G1 X124.808 Y138.934 E.03505
G1 X129.381 Y138.934 E.15168
G1 X129.381 Y128.666 E.34062
G1 X124.808 Y128.666 E.15168
G1 X124.808 Y127.334 E.04418
G1 X129.448 Y127.334 E.15391
G1 X129.448 Y117.066 E.34062
G1 X124.808 Y117.066 E.15391
G1 X124.808 Y116.069 E.03305
M204 S10000
G1 X124.401 Y115.602 F42000
G1 F3932
M204 S6000
G1 X130.86 Y115.602 E.21425
G1 X130.86 Y140.398 E.8225
G1 X124.401 Y140.398 E.21425
G1 X124.401 Y115.662 E.82052
M204 S250
G1 X124.009 Y115.407 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3932
M204 S5000
G3 X124.199 Y115.21 I.2 J.003 E.00926
G1 X131.105 Y115.217 E.21221
G3 X131.252 Y115.41 I-.047 J.188 E.00807
G1 X131.245 Y140.648 E.77548
G3 X131.062 Y140.79 I-.192 J-.058 E.00759
G1 X124.153 Y140.783 E.21231
G3 X124.009 Y140.59 I.056 J-.192 E.00795
G1 X124.009 Y115.467 E.77194
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.025 Y115.325 E-.05457
G1 X124.062 Y115.27 E-.02487
G1 X124.136 Y115.222 E-.03358
G1 X124.199 Y115.21 E-.02438
G1 X125.837 Y115.212 E-.6226
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


G1 X125.012 Y116.538 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692334
G1 F3932
M204 S6000
G1 X129.651 Y116.538 E.24553
; LINE_WIDTH: 0.739322
G1 X129.883 Y116.579 E.01337
G1 X129.906 Y116.673 E.00551
; LINE_WIDTH: 0.70808
G1 X129.928 Y116.768 E.00526
; LINE_WIDTH: 0.663347
G1 X129.95 Y116.862 E.00491
; LINE_WIDTH: 0.64096
G1 X129.95 Y127.538 E.52023
; WIPE_START
G1 F6019.665
G1 X129.95 Y125.538 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.894 Y127.13 Z7 F42000
G1 Z6.6
G1 E.8 F1800
; LINE_WIDTH: 0.62138
G1 F3932
M204 S6000
G1 X124.894 Y117.269 E.46482
; WIPE_START
G1 F6223.421
G1 X124.894 Y119.269 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.833 Y126.902 Z7 F42000
G1 X124.817 Y128.87 Z7
G1 Z6.6
G1 E.8 F1800
; LINE_WIDTH: 0.46774
G1 F3932
M204 S6000
G1 X124.817 Y138.731 E.34136
M204 S10000
G1 X125.012 Y139.462 F42000
; LINE_WIDTH: 0.692392
G1 F3932
M204 S6000
G1 X129.584 Y139.462 E.24199
M204 S10000
G1 X130.019 Y139.556 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50476
G1 F3932
M204 S6000
G1 X130.018 Y138.912 E.02422
; LINE_WIDTH: 0.51795
G1 X130.015 Y138.901 E.00046
; LINE_WIDTH: 0.54429
G1 X130.011 Y138.89 E.00048
; WIPE_START
G1 F7180.326
G1 X130.015 Y138.901 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.323 Y131.3 Z7 F42000
G1 X129.043 Y128.231 Z7
G1 Z6.6
G1 E.8 F1800
; LINE_WIDTH: 0.488307
G1 F3932
M204 S6000
G1 X129.224 Y128.248 E.00657
; LINE_WIDTH: 0.4544
G1 X129.404 Y128.265 E.00607
; LINE_WIDTH: 0.423094
G3 X129.713 Y128.305 I-.085 J1.872 E.00968
; LINE_WIDTH: 0.431253
G1 X129.732 Y128.384 E.00256
; LINE_WIDTH: 0.375699
G1 X129.75 Y128.462 E.00219
G1 X129.75 Y138.445 E.27071
; LINE_WIDTH: 0.397819
G1 X129.773 Y138.525 E.0024
; LINE_WIDTH: 0.442355
G1 X129.795 Y138.605 E.0027
; LINE_WIDTH: 0.496417
G1 X129.817 Y138.685 E.00307
G1 X129.878 Y138.698 E.00229
; LINE_WIDTH: 0.53331
G1 X129.992 Y138.833 E.00707
G1 X130.016 Y138.606 E.00913
; LINE_WIDTH: 0.486892
G1 X130.039 Y138.552 E.0021
; LINE_WIDTH: 0.442355
G1 X130.061 Y138.499 E.00189
; LINE_WIDTH: 0.375679
G1 X130.083 Y138.445 E.00157
G1 X130.083 Y128.462 E.27069
; LINE_WIDTH: 0.394118
G1 X130.065 Y128.305 E.00453
; LINE_WIDTH: 0.432216
G3 X130.046 Y127.945 I1.517 J-.259 E.01148
G1 X129.426 Y127.921 E.01967
; LINE_WIDTH: 0.420502
G1 X129.363 Y127.904 E.00203
; LINE_WIDTH: 0.454405
G1 X129.299 Y127.887 E.00221
; LINE_WIDTH: 0.505126
G1 X129.235 Y127.871 E.00249
G1 X129.204 Y127.769 E.00401
G1 X125.243 Y127.769 E.14918
G1 X125.243 Y128.231 E.01741
G1 X128.983 Y128.231 E.14088
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7788.741
M73 P63 R7
G1 X126.983 Y128.231 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/72
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z7 I-1.202 J.193 P1  F42000
G1 X128.635 Y138.527 Z7
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3727
M204 S6000
G1 X125.287 Y138.527 E.11108
G1 X125.287 Y129.073 E.31361
G1 X129.027 Y129.073 E.12408
G1 X129.027 Y138.527 E.31361
G1 X128.695 Y138.527 E.01102
M204 S250
G1 X128.635 Y138.135 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3727
M204 S5000
G1 X125.679 Y138.135 E.09084
G1 X125.679 Y138.094 E.00126
G1 X125.679 Y129.506 E.26389
G1 X125.679 Y129.465 E.00126
G1 X128.635 Y129.465 E.09084
G1 X128.635 Y138.075 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.635 Y138.116 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.053 Y130.505 Z7.2 F42000
G1 X125.779 Y126.927 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3727
M204 S6000
G1 X125.387 Y126.927 E.01301
G1 X125.387 Y117.473 E.31361
G1 X129.041 Y117.473 E.12121
G1 X129.041 Y126.927 E.31361
G1 X125.839 Y126.927 E.10622
M204 S250
G1 X125.779 Y126.535 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3727
M204 S5000
G1 X125.779 Y117.865 E.2664
G1 X128.649 Y117.865 E.08819
G1 X128.649 Y126.535 E.2664
G1 X125.839 Y126.535 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.825 Y124.535 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.944 Y116.954 Z7.2 F42000
G1 X124.834 Y116.009 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3727
M204 S6000
G1 X130.479 Y116.009 E.18725
G1 X130.479 Y139.99 E.7955
G1 X124.834 Y139.991 E.18725
G1 X124.834 Y138.934 E.03505
G1 X129.434 Y138.934 E.15258
G1 X129.434 Y128.666 E.34062
G1 X124.834 Y128.666 E.15258
G1 X124.834 Y127.334 E.04418
G1 X129.448 Y127.334 E.15303
G1 X129.448 Y117.066 E.34062
G1 X124.834 Y117.066 E.15303
G1 X124.834 Y116.069 E.03305
M204 S10000
G1 X124.427 Y115.602 F42000
G1 F3727
M204 S6000
G1 X130.886 Y115.602 E.21425
G1 X130.886 Y140.398 E.8225
G1 X124.427 Y140.398 E.21425
G1 X124.427 Y115.662 E.82052
M204 S250
G1 X124.035 Y115.408 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3727
M204 S5000
G3 X124.225 Y115.21 I.2 J.003 E.00926
G1 X131.131 Y115.217 E.21221
G3 X131.278 Y115.41 I-.047 J.188 E.00807
G1 X131.272 Y140.648 E.77548
G3 X131.089 Y140.79 I-.193 J-.06 E.00757
G1 X124.179 Y140.783 E.21231
G3 X124.035 Y140.59 I.06 J-.195 E.00792
G1 X124.035 Y115.468 E.77194
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.052 Y115.325 E-.05454
G1 X124.088 Y115.271 E-.02489
G1 X124.162 Y115.222 E-.03366
G1 X124.225 Y115.21 E-.02426
G1 X125.864 Y115.212 E-.62266
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


G1 X125.038 Y116.538 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692957
G1 F3727
M204 S6000
G1 X129.651 Y116.538 E.24437
G1 X129.777 Y116.562 E.00677
; LINE_WIDTH: 0.765152
G1 X129.903 Y116.586 E.00753
; LINE_WIDTH: 0.769067
G1 X129.923 Y116.678 E.00558
; LINE_WIDTH: 0.72836
G1 X129.943 Y116.77 E.00527
; LINE_WIDTH: 0.687654
G1 X129.964 Y116.862 E.00495
; LINE_WIDTH: 0.6673
G1 X129.964 Y127.538 E.54315
M204 S10000
M73 P63 R6
G1 X129.478 Y128 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.56074
G1 F3727
M204 S6000
G1 X129.957 Y128 E.0202
M204 S10000
G1 X129.03 Y127.769 F42000
; LINE_WIDTH: 0.505015
G1 F3727
M204 S6000
G1 X125.269 Y127.769 E.1416
G1 X125.269 Y128.231 E.01741
G1 X129.19 Y128.231 E.14764
G1 X129.245 Y128.125 E.00451
; LINE_WIDTH: 0.493743
G1 X129.362 Y128.062 E.00485
; LINE_WIDTH: 0.531452
G1 X129.478 Y128 E.00526
G1 X129.237 Y127.866 E.01097
; LINE_WIDTH: 0.498062
G1 X129.207 Y127.764 E.00394
G1 X129.09 Y127.767 E.00435
M204 S10000
G1 X129.957 Y128.462 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.68092
G1 F3727
M204 S6000
G1 X129.957 Y139.138 E.55499
; LINE_WIDTH: 0.70028
G1 X129.937 Y139.228 E.00497
; LINE_WIDTH: 0.738999
G1 X129.918 Y139.319 E.00526
; LINE_WIDTH: 0.777718
G1 X129.899 Y139.41 E.00556
; LINE_WIDTH: 0.779598
G1 X129.812 Y139.427 E.00533
; LINE_WIDTH: 0.744655
G1 X129.725 Y139.445 E.00507
; LINE_WIDTH: 0.69271
G1 X129.638 Y139.462 E.0047
G1 X125.038 Y139.462 E.24355
M204 S10000
G1 X124.857 Y138.731 F42000
; LINE_WIDTH: 0.495
G1 F3727
M204 S6000
G1 X124.857 Y128.87 E.36327
; WIPE_START
G1 F7963.192
G1 X124.857 Y130.87 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.907 Y127.13 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
; LINE_WIDTH: 0.59505
G1 F3727
M204 S6000
G1 X124.907 Y117.269 E.44366
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6520.204
G1 X124.907 Y119.269 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/72
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z7.2 I-1.194 J.234 P1  F42000
G1 X128.689 Y138.527 Z7.2
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3741
M204 S6000
G1 X125.34 Y138.527 E.11108
G1 X125.34 Y129.073 E.31361
G1 X129.081 Y129.073 E.12408
G1 X129.081 Y138.527 E.31361
G1 X128.749 Y138.527 E.01102
M204 S250
G1 X128.689 Y138.135 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3741
M204 S5000
G1 X125.732 Y138.135 E.09084
G1 X125.732 Y138.094 E.00126
G1 X125.732 Y129.506 E.26389
G1 X125.732 Y129.465 E.00126
G1 X128.689 Y129.465 E.09084
G1 X128.689 Y138.075 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.689 Y138.116 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.07 Y130.508 Z7.4 F42000
G1 X125.779 Y126.927 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3741
M204 S6000
G1 X125.387 Y126.927 E.01301
G1 X125.387 Y117.473 E.31361
G1 X129.041 Y117.473 E.12121
G1 X129.041 Y126.927 E.31361
G1 X125.839 Y126.927 E.10622
M204 S250
G1 X125.779 Y126.535 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3741
M204 S5000
G1 X125.779 Y117.865 E.2664
G1 X128.649 Y117.865 E.08819
G1 X128.649 Y126.535 E.2664
G1 X125.839 Y126.535 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
M73 P64 R6
G1 X125.825 Y124.535 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.967 Y116.951 Z7.4 F42000
G1 X124.861 Y116.009 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3741
M204 S6000
G1 X130.506 Y116.009 E.18725
G1 X130.506 Y139.99 E.7955
G1 X124.861 Y139.991 E.18725
G1 X124.861 Y138.934 E.03505
G1 X129.488 Y138.934 E.15349
G1 X129.488 Y128.666 E.34062
G1 X124.861 Y128.666 E.15349
G1 X124.861 Y127.334 E.04418
G1 X129.448 Y127.334 E.15216
G1 X129.448 Y117.066 E.34062
G1 X124.861 Y117.066 E.15216
G1 X124.861 Y116.069 E.03305
M204 S10000
G1 X124.454 Y115.602 F42000
G1 F3741
M204 S6000
G1 X130.913 Y115.602 E.21425
G1 X130.913 Y140.398 E.8225
G1 X124.454 Y140.398 E.21425
G1 X124.454 Y115.662 E.82052
M204 S250
G1 X124.062 Y115.407 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3741
M204 S5000
G3 X124.252 Y115.21 I.2 J.003 E.00926
G1 X131.111 Y115.21 E.21076
G3 X131.305 Y115.41 I-.005 J.199 E.00948
G1 X131.298 Y140.648 E.77548
G3 X131.115 Y140.79 I-.19 J-.057 E.00759
G1 X124.206 Y140.783 E.21231
G3 X124.062 Y140.59 I.058 J-.194 E.00793
G1 X124.062 Y115.467 E.77194
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.078 Y115.325 E-.05463
G1 X124.114 Y115.271 E-.02471
G1 X124.189 Y115.222 E-.03373
G1 X124.252 Y115.21 E-.02433
G1 X125.89 Y115.21 E-.62261
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


G1 X125.064 Y116.538 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692657
G1 F3741
M204 S6000
G1 X129.651 Y116.538 E.24286
G1 X129.741 Y116.556 E.00487
; LINE_WIDTH: 0.748387
G1 X129.831 Y116.575 E.00528
; LINE_WIDTH: 0.78579
G1 X129.921 Y116.594 E.00556
; LINE_WIDTH: 0.786004
G1 X129.94 Y116.683 E.00554
; LINE_WIDTH: 0.74905
G1 X129.958 Y116.773 E.00526
; LINE_WIDTH: 0.712097
G1 X129.977 Y116.862 E.00498
; LINE_WIDTH: 0.69363
G1 X129.977 Y127.538 E.56605
M204 S10000
G1 X129.493 Y128 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.56074
G1 F3741
M204 S6000
G1 X129.983 Y128 E.0207
M204 S10000
G1 X129.043 Y128.231 F42000
; LINE_WIDTH: 0.490352
G1 F3741
M204 S6000
G1 X129.251 Y128.242 E.00759
G1 X129.28 Y128.142 E.00382
; LINE_WIDTH: 0.502375
G1 X129.386 Y128.071 E.00478
; LINE_WIDTH: 0.535542
G1 X129.493 Y128 E.00513
G1 X129.235 Y127.871 E.01159
; LINE_WIDTH: 0.50526
G1 X129.204 Y127.769 E.00401
G1 X125.296 Y127.769 E.14724
G1 X125.296 Y128.231 E.01742
G1 X128.983 Y128.231 E.13893
M204 S10000
G1 X129.997 Y128.462 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.65366
G1 F3741
M204 S6000
G1 X129.997 Y139.138 E.53128
; LINE_WIDTH: 0.675028
G1 X129.975 Y139.231 E.00493
; LINE_WIDTH: 0.717765
G1 X129.954 Y139.324 E.00526
; LINE_WIDTH: 0.743632
G1 X129.933 Y139.418 E.00546
G1 X129.691 Y139.462 E.01401
; LINE_WIDTH: 0.69238
G1 X125.064 Y139.462 E.24487
M204 S10000
G1 X124.897 Y138.731 F42000
; LINE_WIDTH: 0.52226
G1 F3741
M204 S6000
G1 X124.897 Y128.87 E.38517
; WIPE_START
G1 F7510.327
G1 X124.897 Y130.87 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.92 Y127.13 Z7.4 F42000
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.56872
G1 F3741
M204 S6000
G1 X124.92 Y117.269 E.4225
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6846.71
G1 X124.92 Y119.269 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/72
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z7.4 I-1.194 J.237 P1  F42000
G1 X128.742 Y138.527 Z7.4
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4056
M204 S6000
G1 X125.394 Y138.527 E.11108
G1 X125.394 Y129.073 E.31361
G1 X129.134 Y129.073 E.12408
G1 X129.134 Y138.527 E.31361
G1 X128.802 Y138.527 E.01102
M204 S250
G1 X128.742 Y138.135 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4056
M204 S5000
G1 X125.786 Y138.135 E.09084
G1 X125.786 Y138.094 E.00126
G1 X125.786 Y129.506 E.26389
G1 X125.786 Y129.465 E.00126
G1 X128.742 Y129.465 E.09084
G1 X128.742 Y138.075 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.743 Y138.116 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.088 Y130.511 Z7.6 F42000
G1 X125.779 Y126.927 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4056
M204 S6000
G1 X125.387 Y126.927 E.01301
G1 X125.387 Y117.473 E.31361
G1 X129.041 Y117.473 E.12121
G1 X129.041 Y126.927 E.31361
G1 X125.839 Y126.927 E.10622
M204 S250
G1 X125.779 Y126.535 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4056
M204 S5000
G1 X125.779 Y117.865 E.2664
G1 X128.649 Y117.865 E.08819
G1 X128.649 Y126.535 E.2664
G1 X125.839 Y126.535 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.825 Y124.535 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.99 Y116.948 Z7.6 F42000
G1 X124.887 Y116.009 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4056
M204 S6000
G1 X130.532 Y116.009 E.18725
G1 X130.532 Y139.99 E.79549
G1 X124.887 Y139.991 E.18725
G1 X124.887 Y138.934 E.03505
G1 X129.541 Y138.934 E.15439
G1 X129.541 Y128.666 E.34062
G1 X124.887 Y128.666 E.15439
G1 X124.887 Y127.334 E.04418
G1 X129.448 Y127.334 E.15129
G1 X129.448 Y117.066 E.34062
G1 X124.887 Y117.066 E.15129
M73 P65 R6
G1 X124.887 Y116.069 E.03305
M204 S10000
G1 X124.48 Y115.602 F42000
G1 F4056
M204 S6000
G1 X130.939 Y115.602 E.21425
G1 X130.939 Y140.398 E.8225
G1 X124.48 Y140.398 E.21425
G1 X124.48 Y115.662 E.82052
M204 S250
G1 X124.088 Y115.408 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4056
M204 S5000
G3 X124.278 Y115.21 I.2 J.003 E.00926
G1 X131.138 Y115.21 E.2108
G3 X131.331 Y115.41 I-.007 J.2 E.00943
G1 X131.324 Y140.648 E.77548
G3 X131.141 Y140.79 I-.191 J-.057 E.00759
G1 X124.232 Y140.783 E.21231
G3 X124.088 Y140.59 I.06 J-.194 E.00792
G1 X124.088 Y115.468 E.77195
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.104 Y115.325 E-.05461
G1 X124.141 Y115.271 E-.0248
G1 X124.215 Y115.222 E-.03365
G1 X124.278 Y115.21 E-.0243
G1 X125.916 Y115.21 E-.62265
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


G1 X125.091 Y116.538 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692278
G1 F4056
M204 S6000
G1 X129.651 Y116.538 E.24132
M204 S10000
G1 X130.076 Y117.165 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.53193
G1 F4056
M204 S6000
G1 X130.09 Y116.51 E.02613
M204 S10000
G1 X129.821 Y125.249 F42000
; LINE_WIDTH: 0.38144
G1 F4056
M204 S6000
G1 X130.159 Y125.272 E.00936
G1 X130.159 Y117.55 E.21302
; LINE_WIDTH: 0.402882
G1 X130.138 Y117.499 E.00161
; LINE_WIDTH: 0.445765
G1 X130.116 Y117.449 E.00181
; LINE_WIDTH: 0.488649
G1 X130.095 Y117.398 E.002
; LINE_WIDTH: 0.52624
G1 X130.076 Y117.165 E.00919
G1 X129.948 Y117.302 E.00737
G1 X129.885 Y117.315 E.00254
; LINE_WIDTH: 0.488649
G1 X129.864 Y117.393 E.00295
; LINE_WIDTH: 0.445765
G1 X129.842 Y117.471 E.00267
; LINE_WIDTH: 0.381666
G1 X129.821 Y117.55 E.00224
G1 X129.821 Y125.189 E.21088
; WIPE_START
G1 F10627.443
G1 X129.821 Y123.189 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.626 Y128.24 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F4056
M204 S2000
G1 X130.31 Y127.557 E.02969
G1 X130.31 Y127.023
G1 X128.89 Y128.443 E.06171
G1 X128.356 Y128.443
G1 X129.243 Y127.557 E.03854
G1 X128.71 Y127.557
G1 X127.823 Y128.443 E.03854
G1 X127.341 Y128.392
G1 X128.177 Y127.557 E.03631
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.341 Y128.392 E-.44898
G1 X127.823 Y128.443 E-.1841
G1 X128.059 Y128.207 E-.12691
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.67 Y127.13 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
G1 F4056
M204 S2000
G1 X130.31 Y126.49 E.02778
G1 X130.31 Y125.957
G1 X129.67 Y126.596 E.02778
G1 X129.67 Y126.063
G1 X130.262 Y125.471 E.02571
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.67 Y126.063 E-.318
G1 X129.67 Y126.596 E-.20264
G1 X130.116 Y126.151 E-.23936
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.623 Y128.237 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.17608
G1 F4056
M204 S6000
G1 X129.493 Y128.199 E.00147
G1 X129.285 Y128.462 E.00364
M204 S10000
G1 X130.037 Y128.462 F42000
; LINE_WIDTH: 0.6264
G1 F4056
M204 S6000
G1 X130.037 Y139.138 E.50757
; LINE_WIDTH: 0.649927
G1 X130.013 Y139.233 E.00487
; LINE_WIDTH: 0.696979
G1 X129.99 Y139.329 E.00525
; LINE_WIDTH: 0.734208
G1 X129.966 Y139.425 E.00555
G1 X129.745 Y139.462 E.01264
; LINE_WIDTH: 0.692378
G1 X125.091 Y139.462 E.24631
M204 S10000
G1 X124.937 Y138.731 F42000
; LINE_WIDTH: 0.54951
G1 F4056
M204 S6000
G1 X124.937 Y128.87 E.40707
; WIPE_START
G1 F7106.338
G1 X124.937 Y130.87 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.933 Y127.13 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; LINE_WIDTH: 0.54238
G1 F4056
M204 S6000
G1 X124.933 Y117.269 E.40134
; WIPE_START
G1 F7207.785
G1 X124.933 Y119.269 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.712 Y126.692 Z7.6 F42000
G1 X127.081 Y128.231 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50526
G1 F4056
M204 S6000
G1 X127.079 Y127.769 E.01742
G1 X125.322 Y127.769 E.06619
G1 X125.322 Y128.231 E.01742
G1 X127.021 Y128.231 E.06401
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7786.477
G1 X125.322 Y128.231 E-.64567
G1 X125.322 Y127.93 E-.11433
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/72
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z7.6 I-1.154 J.385 P1  F42000
G1 X129.08 Y139.19 Z7.6
G1 Z7.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4207
M204 S5000
G1 X130.168 Y139.19 E.03341
G1 X130.168 Y140.41 E.03749
G1 X129.08 Y140.41 E.03341
G1 X129.08 Y139.25 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.168 Y139.19 E-.41384
G1 X130.168 Y140.101 E-.34616
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.052 Y132.55 Z7.8 F42000
G1 X128.281 Y127.334 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4207
M204 S6000
G1 X128.281 Y128.666 E.04418
G1 X124.913 Y128.666 E.11171
G1 X124.913 Y127.334 E.04418
G1 X128.221 Y127.334 E.10972
; WIPE_START
G1 F8843.478
G1 X128.281 Y128.666 E-.50658
G1 X127.614 Y128.666 E-.25342
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.522 Y136.244 Z7.8 F42000
G1 X128.796 Y138.527 Z7.8
G1 Z7.4
G1 E.8 F1800
G1 F4207
M204 S6000
G1 X125.447 Y138.527 E.11108
G1 X125.447 Y129.073 E.31361
G1 X129.188 Y129.073 E.12408
G1 X129.188 Y138.527 E.31361
G1 X128.856 Y138.527 E.01102
M204 S250
G1 X128.796 Y138.135 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4207
M204 S5000
G1 X125.839 Y138.135 E.09084
G1 X125.839 Y138.094 E.00126
G1 X125.839 Y129.506 E.26389
G1 X125.839 Y129.465 E.00126
G1 X128.796 Y129.465 E.09084
G1 X128.796 Y138.075 E.26456
M204 S10000
G1 X129.595 Y138.391 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4207
M204 S6000
G1 X129.595 Y129.209 E.30457
G1 X130.558 Y129.209 E.03195
G1 X130.558 Y138.391 E.30457
G1 X129.655 Y138.391 E.02996
; WIPE_START
G1 F8843.478
G1 X129.642 Y136.391 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.281 Y139.19 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
G1 F4207
M204 S6000
G1 X128.281 Y139.991 E.02656
G1 X124.913 Y139.991 E.11171
G1 X124.913 Y138.934 E.03505
G1 X128.281 Y138.934 E.11171
G1 X128.281 Y139.13 E.0065
; WIPE_START
G1 F8843.478
G1 X128.281 Y139.991 E-.32703
G1 X127.142 Y139.991 E-.43297
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.35 Y132.399 Z7.8 F42000
G1 X125.779 Y126.927 Z7.8
G1 Z7.4
G1 E.8 F1800
G1 F4207
M204 S6000
G1 X125.387 Y126.927 E.01301
G1 X125.387 Y117.473 E.31361
G1 X129.041 Y117.473 E.12121
G1 X129.041 Y126.798 E.30933
G1 X130.56 Y126.798 E.05038
G1 X130.56 Y128.802 E.06648
G1 X128.688 Y128.802 E.06208
G1 X128.688 Y126.927 E.0622
G1 X125.839 Y126.927 E.09452
; WIPE_START
G1 F8843.478
G1 X125.387 Y126.927 E-.17179
G1 X125.387 Y125.379 E-.58821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.08 Y127.19 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4207
M204 S5000
G1 X130.168 Y127.19 E.03341
G1 X130.168 Y128.41 E.03749
G1 X129.08 Y128.41 E.03341
G1 X129.08 Y127.25 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.168 Y127.19 E-.41384
G1 X130.168 Y128.101 E-.34616
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.779 Y126.535 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
G1 F4207
M204 S5000
M73 P66 R6
G1 X125.779 Y117.865 E.2664
G1 X128.649 Y117.865 E.08819
G1 X128.649 Y126.535 E.2664
G1 X125.839 Y126.535 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.825 Y124.535 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.014 Y116.946 Z7.8 F42000
G1 X124.913 Y116.009 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4207
M204 S6000
G1 X130.558 Y116.009 E.18725
G1 X130.558 Y126.391 E.34437
G1 X129.448 Y126.391 E.03684
G1 X129.448 Y117.066 E.30933
G1 X124.913 Y117.066 E.15041
G1 X124.913 Y116.069 E.03305
M204 S10000
G1 X124.506 Y115.602 F42000
G1 F4207
M204 S6000
G1 X130.965 Y115.602 E.21425
G1 X130.965 Y140.398 E.8225
G1 X130.56 Y140.398 E.01346
G1 X130.56 Y138.798 E.05306
G1 X128.688 Y138.798 E.06208
G1 X128.688 Y140.398 E.05307
G1 X124.506 Y140.398 E.13871
G1 X124.506 Y115.662 E.82052
M204 S250
G1 X124.114 Y115.407 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4207
M204 S5000
G3 X124.304 Y115.21 I.2 J.003 E.00926
G1 X131.166 Y115.21 E.21085
G3 X131.357 Y115.41 I-.008 J.199 E.00939
G1 X131.351 Y140.648 E.77548
G3 X131.168 Y140.79 I-.193 J-.06 E.00756
G1 X124.258 Y140.783 E.21232
G3 X124.114 Y140.59 I.056 J-.192 E.00795
G1 X124.114 Y115.467 E.77195
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.131 Y115.325 E-.05455
G1 X124.167 Y115.271 E-.02484
G1 X124.242 Y115.222 E-.03367
G1 X124.304 Y115.21 E-.02428
G1 X125.943 Y115.21 E-.62266
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


G1 X125.117 Y116.538 F42000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692257
G1 F4207
M204 S6000
G1 X129.651 Y116.538 E.23992
M204 S10000
G1 X130.103 Y117.131 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.54475
G1 F4207
M204 S6000
G1 X130.105 Y116.523 E.02486
M204 S10000
G1 X129.827 Y126.011 F42000
; LINE_WIDTH: 0.39461
G1 F4207
M204 S6000
G1 X130.179 Y126.011 E.01008
G1 X130.179 Y117.518 E.24342
; LINE_WIDTH: 0.419083
G1 X130.154 Y117.462 E.00186
; LINE_WIDTH: 0.468028
G1 X130.13 Y117.406 E.00211
; LINE_WIDTH: 0.506035
G1 X130.116 Y117.269 E.00522
; LINE_WIDTH: 0.52477
G1 X130.103 Y117.131 E.00543
G1 X129.95 Y117.291 E.00871
; LINE_WIDTH: 0.4925
G1 X129.876 Y117.307 E.00275
; LINE_WIDTH: 0.468028
G1 X129.852 Y117.413 E.00374
; LINE_WIDTH: 0.39492
G1 X129.827 Y117.518 E.00309
G1 X129.827 Y125.951 E.24191
; WIPE_START
G1 F10227.298
G1 X129.827 Y123.951 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.846 Y128 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
; LINE_WIDTH: 0.50526
G1 F4207
M204 S6000
G1 X127.846 Y127.769 E.00871
G1 X125.348 Y127.769 E.09412
G1 X125.348 Y128.231 E.01742
G1 X127.846 Y128.231 E.09412
G1 X127.846 Y128.06 E.00645
; WIPE_START
G1 F7786.477
G1 X127.846 Y128.231 E-.06504
G1 X126.018 Y128.231 E-.69496
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.077 Y129.413 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.59914
G1 F4207
M204 S6000
G1 X130.077 Y138.187 E.39771
; WIPE_START
G1 F6472.259
G1 X130.077 Y136.187 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.078 Y139.462 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
; LINE_WIDTH: 0.692442
G1 F4207
M204 S6000
G1 X125.117 Y139.462 E.15669
M204 S10000
G1 X124.977 Y138.731 F42000
; LINE_WIDTH: 0.57677
G1 F4207
M204 S6000
G1 X124.977 Y128.87 E.42897
; WIPE_START
G1 F6743.467
G1 X124.977 Y130.87 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.947 Y127.13 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
; LINE_WIDTH: 0.51605
G1 F4207
M204 S6000
G1 X124.947 Y117.269 E.38018
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7608.903
G1 X124.947 Y119.269 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/72
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z7.8 I-1.2 J.204 P1  F42000
G1 X128.334 Y139.19 Z7.8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4236
M204 S5000
G1 X130.221 Y139.19 E.05799
G1 X130.221 Y140.41 E.03749
G1 X128.334 Y140.41 E.05799
G1 X128.334 Y139.25 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.221 Y139.19 E-.71757
G1 X130.221 Y139.302 E-.04243
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.352 Y131.902 Z8 F42000
G1 X127.535 Y128.666 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4236
M204 S6000
G1 X124.94 Y128.666 E.08607
G1 X124.94 Y127.334 E.04418
G1 X127.535 Y127.334 E.08607
G1 X127.535 Y128.606 E.04219
; WIPE_START
G1 F8843.478
G1 X125.535 Y128.652 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.964 Y135.888 Z8 F42000
G1 X128.849 Y138.527 Z8
G1 Z7.6
G1 E.8 F1800
G1 F4236
M204 S6000
G1 X125.501 Y138.527 E.11108
G1 X125.501 Y129.073 E.31361
G1 X129.242 Y129.073 E.12408
G1 X129.242 Y138.527 E.31361
G1 X128.909 Y138.527 E.01102
M204 S250
G1 X128.849 Y138.135 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4236
M204 S5000
G1 X125.893 Y138.135 E.09084
G1 X125.893 Y138.094 E.00126
G1 X125.893 Y129.506 E.26389
G1 X125.893 Y129.465 E.00126
G1 X128.849 Y129.465 E.09084
G1 X128.849 Y138.075 E.26456
M204 S10000
G1 X129.649 Y138.391 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4236
M204 S6000
G1 X129.649 Y129.209 E.30457
G1 X130.586 Y129.209 E.03111
G1 X130.586 Y138.391 E.30457
G1 X129.709 Y138.391 E.02912
; WIPE_START
G1 F8843.478
G1 X129.696 Y136.391 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.535 Y139.19 Z8 F42000
G1 Z7.6
G1 E.8 F1800
G1 F4236
M204 S6000
G1 X127.535 Y139.991 E.02656
G1 X124.94 Y139.991 E.08607
G1 X124.94 Y138.934 E.03505
G1 X127.535 Y138.934 E.08607
G1 X127.535 Y139.13 E.0065
; WIPE_START
G1 F8843.478
G1 X127.535 Y139.991 E-.32705
G1 X126.395 Y139.991 E-.43295
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.035 Y132.367 Z8 F42000
G1 X125.779 Y126.927 Z8
G1 Z7.6
G1 E.8 F1800
G1 F4236
M204 S6000
G1 X125.387 Y126.927 E.01301
G1 X125.387 Y117.473 E.31361
G1 X129.041 Y117.473 E.12121
G1 X129.041 Y126.798 E.30933
G1 X130.613 Y126.798 E.05216
G1 X130.613 Y128.802 E.06648
G1 X127.942 Y128.802 E.08862
G1 X127.942 Y126.927 E.0622
G1 X125.839 Y126.927 E.06976
; WIPE_START
G1 F8843.478
G1 X125.387 Y126.927 E-.17179
G1 X125.387 Y125.379 E-.58821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.221 Y127.19 Z8 F42000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4236
M204 S5000
G1 X130.221 Y128.41 E.03749
G1 X128.334 Y128.41 E.05799
G1 X128.334 Y127.19 E.03749
G1 X130.161 Y127.19 E.05615
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.221 Y128.41 E-.46416
G1 X129.443 Y128.41 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.779 Y126.535 Z8 F42000
G1 Z7.6
G1 E.8 F1800
G1 F4236
M204 S5000
G1 X125.779 Y117.865 E.2664
G1 X128.649 Y117.865 E.08819
G1 X128.649 Y126.535 E.2664
G1 X125.839 Y126.535 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.825 Y124.535 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.037 Y116.943 Z8 F42000
G1 X124.94 Y116.009 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4236
M204 S6000
G1 X130.586 Y116.01 E.18731
G1 X130.586 Y126.391 E.34437
G1 X129.448 Y126.391 E.03777
G1 X129.448 Y117.066 E.30933
G1 X124.94 Y117.066 E.14954
G1 X124.94 Y116.069 E.03305
M204 S10000
G1 X124.533 Y115.602 F42000
G1 F4236
M204 S6000
G1 X130.993 Y115.602 E.21431
G1 X130.993 Y140.398 E.8225
G1 X130.613 Y140.398 E.01261
G1 X130.613 Y138.798 E.05306
G1 X127.942 Y138.798 E.08862
G1 X127.942 Y140.398 E.05307
G1 X124.533 Y140.398 E.11308
G1 X124.533 Y115.662 E.82052
M204 S250
G1 X124.141 Y115.408 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4236
M204 S5000
G3 X124.33 Y115.21 I.2 J.003 E.00926
M73 P67 R6
G1 X131.194 Y115.21 E.2109
G3 X131.386 Y115.41 I-.009 J.201 E.00938
G1 X131.379 Y140.647 E.77546
G3 X131.194 Y140.79 I-.195 J-.062 E.00763
G1 X124.284 Y140.783 E.21231
G3 X124.141 Y140.59 I.06 J-.195 E.00792
G1 X124.141 Y115.468 E.77194
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.157 Y115.325 E-.05458
G1 X124.194 Y115.271 E-.02484
G1 X124.268 Y115.222 E-.03361
G1 X124.33 Y115.21 E-.0243
G1 X125.969 Y115.21 E-.62267
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


G1 X125.143 Y116.538 F42000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692235
G1 F4236
M204 S6000
G1 X129.651 Y116.538 E.23852
M204 S10000
G1 X130.119 Y117.087 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.57098
G1 F4236
M204 S6000
G1 X130.119 Y116.537 E.02368
M204 S10000
G1 X129.834 Y126.004 F42000
; LINE_WIDTH: 0.40867
G1 F4236
M204 S6000
G1 X130.2 Y126.004 E.0109
G1 X130.2 Y117.481 E.25402
; LINE_WIDTH: 0.428959
G1 X130.18 Y117.383 E.00316
; LINE_WIDTH: 0.469537
G1 X130.159 Y117.284 E.0035
; LINE_WIDTH: 0.510114
G1 X130.139 Y117.186 E.00383
; LINE_WIDTH: 0.550692
G1 X130.119 Y117.087 E.00416
; LINE_WIDTH: 0.554025
G1 X130.062 Y117.151 E.00355
; LINE_WIDTH: 0.520115
G1 X130.006 Y117.215 E.00331
; LINE_WIDTH: 0.477626
G3 X129.865 Y117.298 I-.13 J-.058 E.0062
; LINE_WIDTH: 0.454105
G1 X129.849 Y117.39 E.00311
; LINE_WIDTH: 0.408835
G1 X129.834 Y117.481 E.00277
G1 X129.834 Y125.944 E.25234
; WIPE_START
G1 F9838.37
G1 X129.834 Y123.944 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.845 Y126.862 Z8 F42000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.30586
G1 F4236
M204 S6000
G1 X128.138 Y126.862 E.01514
; WIPE_START
G1 F13691.336
G1 X128.845 Y126.862 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.1 Y128 Z8 F42000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50526
G1 F4236
M204 S6000
G1 X127.1 Y127.769 E.00871
G1 X125.375 Y127.769 E.065
G1 X125.375 Y128.231 E.01742
G1 X127.1 Y128.231 E.065
G1 X127.1 Y128.06 E.00645
; WIPE_START
G1 F7786.477
G1 X127.1 Y128.231 E-.06504
G1 X125.375 Y128.231 E-.65566
G1 X125.375 Y128.128 E-.0393
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.117 Y129.413 Z8 F42000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.57367
G1 F4236
M204 S6000
G1 X130.117 Y138.187 E.3795
; WIPE_START
G1 F6782.855
G1 X130.117 Y136.187 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.331 Y139.462 Z8 F42000
G1 Z7.6
G1 E.8 F1800
; LINE_WIDTH: 0.692463
G1 F4236
M204 S6000
G1 X125.143 Y139.462 E.1158
M204 S10000
G1 X125.017 Y138.731 F42000
; LINE_WIDTH: 0.60403
G1 F4236
M204 S6000
G1 X125.017 Y128.87 E.45088
; WIPE_START
G1 F6415.855
G1 X125.017 Y130.87 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.96 Y127.13 Z8 F42000
G1 Z7.6
G1 E.8 F1800
; LINE_WIDTH: 0.48972
G1 F4236
M204 S6000
G1 X124.96 Y117.269 E.35902
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8057.296
G1 X124.96 Y119.269 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/72
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z8 I-1.207 J.159 P1  F42000
G1 X127.587 Y139.19 Z8
G1 Z7.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4225
M204 S5000
G1 X130.275 Y139.19 E.08258
G1 X130.275 Y140.41 E.03749
G1 X127.587 Y140.41 E.08258
G1 X127.587 Y139.25 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.587 Y139.205 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.836 Y131.777 Z8.2 F42000
G1 X126.788 Y127.334 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4225
M204 S6000
G1 X126.788 Y128.666 E.04418
G1 X124.966 Y128.666 E.06044
G1 X124.966 Y127.334 E.04418
G1 X126.728 Y127.334 E.05845
; WIPE_START
G1 F8843.478
G1 X126.788 Y128.666 E-.50658
G1 X126.121 Y128.666 E-.25342
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.193 Y136.012 Z8.2 F42000
G1 X128.903 Y138.527 Z8.2
G1 Z7.8
G1 E.8 F1800
G1 F4225
M204 S6000
G1 X125.555 Y138.527 E.11108
G1 X125.555 Y129.073 E.31361
G1 X129.295 Y129.073 E.12408
G1 X129.295 Y138.527 E.31361
G1 X128.963 Y138.527 E.01102
M204 S250
G1 X128.903 Y138.135 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4225
M204 S5000
G1 X125.947 Y138.135 E.09084
G1 X125.947 Y138.094 E.00126
G1 X125.947 Y129.506 E.26389
G1 X125.947 Y129.465 E.00126
G1 X128.903 Y129.465 E.09084
G1 X128.903 Y138.075 E.26456
M204 S10000
G1 X129.702 Y138.391 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4225
M204 S6000
G1 X129.702 Y129.209 E.30457
G1 X130.622 Y129.209 E.03052
G1 X130.622 Y138.391 E.30457
G1 X129.762 Y138.391 E.02853
; WIPE_START
G1 F8843.478
G1 X129.749 Y136.391 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.788 Y139.19 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
G1 F4225
M204 S6000
G1 X126.788 Y139.991 E.02656
G1 X124.966 Y139.991 E.06044
G1 X124.966 Y138.934 E.03505
G1 X126.788 Y138.934 E.06044
G1 X126.788 Y139.13 E.0065
; WIPE_START
G1 F8843.478
G1 X126.788 Y139.991 E-.32707
G1 X125.649 Y139.991 E-.43293
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.725 Y132.359 Z8.2 F42000
G1 X125.779 Y126.927 Z8.2
G1 Z7.8
G1 E.8 F1800
G1 F4225
M204 S6000
G1 X125.387 Y126.927 E.01301
G1 X125.387 Y117.473 E.31361
G1 X129.041 Y117.473 E.12121
G1 X129.041 Y126.798 E.30933
G1 X130.667 Y126.798 E.05394
G1 X130.667 Y128.802 E.06648
G1 X127.195 Y128.802 E.11516
G1 X127.195 Y126.927 E.0622
G1 X125.839 Y126.927 E.045
; WIPE_START
G1 F8843.478
G1 X125.387 Y126.927 E-.17179
G1 X125.387 Y125.379 E-.58821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.275 Y127.19 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4225
M204 S5000
G1 X130.275 Y128.41 E.03749
G1 X127.587 Y128.41 E.08258
G1 X127.587 Y127.19 E.03749
G1 X130.215 Y127.19 E.08073
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.275 Y128.41 E-.46416
G1 X129.496 Y128.41 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.779 Y126.535 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
G1 F4225
M204 S5000
G1 X125.779 Y117.865 E.2664
G1 X128.649 Y117.865 E.08819
G1 X128.649 Y126.535 E.2664
G1 X125.839 Y126.535 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.825 Y124.535 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.06 Y116.941 Z8.2 F42000
G1 X124.966 Y116.009 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4225
M204 S6000
G1 X130.622 Y116.009 E.18762
G1 X130.622 Y126.391 E.34437
G1 X129.448 Y126.391 E.03895
G1 X129.448 Y117.066 E.30933
G1 X124.966 Y117.066 E.14867
G1 X124.966 Y116.069 E.03305
M204 S10000
G1 X124.559 Y115.602 F42000
G1 F4225
M204 S6000
G1 X131.029 Y115.602 E.21463
G1 X131.029 Y140.398 E.8225
G1 X130.667 Y140.398 E.01202
G1 X130.667 Y138.798 E.05306
G1 X127.195 Y138.798 E.11516
G1 X127.195 Y140.398 E.05307
G1 X124.559 Y140.398 E.08745
G1 X124.559 Y115.662 E.82052
M204 S250
G1 X124.167 Y115.407 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4225
M204 S5000
G3 X124.357 Y115.21 I.2 J.003 E.00926
G1 X131.228 Y115.21 E.21112
G3 X131.421 Y115.41 I-.007 J.201 E.00944
G1 X131.415 Y140.647 E.77546
G3 X131.229 Y140.79 I-.195 J-.062 E.00765
G1 X124.311 Y140.783 E.21257
G3 X124.167 Y140.59 I.06 J-.194 E.00792
G1 X124.167 Y115.467 E.77195
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.183 Y115.325 E-.05457
G1 X124.22 Y115.271 E-.02479
G1 X124.294 Y115.222 E-.03367
G1 X124.357 Y115.21 E-.0243
G1 X125.996 Y115.21 E-.62267
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
M73 P68 R6
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X125.17 Y116.538 F42000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692246
G1 F4225
M204 S6000
G1 X129.651 Y116.538 E.23713
M204 S10000
G1 X130.137 Y117.049 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.6067
G1 F4225
M204 S6000
G1 X130.137 Y116.555 E.02272
M204 S10000
G1 X129.843 Y125.996 F42000
; LINE_WIDTH: 0.42653
G1 F4225
M204 S6000
G1 X130.227 Y125.996 E.01199
G1 X130.227 Y117.433 E.26767
; LINE_WIDTH: 0.449052
G1 X130.204 Y117.337 E.00326
; LINE_WIDTH: 0.494094
G1 X130.182 Y117.241 E.00362
; LINE_WIDTH: 0.539137
G1 X130.159 Y117.145 E.00398
; LINE_WIDTH: 0.581218
G1 X130.137 Y117.049 E.00432
G1 X130.104 Y117.131 E.00386
; LINE_WIDTH: 0.529744
G1 X130.052 Y117.174 E.00269
; LINE_WIDTH: 0.49101
G1 X129.999 Y117.217 E.00248
; LINE_WIDTH: 0.426856
G3 X129.846 Y117.291 I-.169 J-.154 E.00544
G1 X129.843 Y125.936 E.27046
; WIPE_START
G1 F9376.583
G1 X129.844 Y123.936 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.845 Y126.862 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.30586
G1 F4225
M204 S6000
G1 X127.391 Y126.862 E.03114
; WIPE_START
G1 F13691.336
G1 X128.845 Y126.862 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.354 Y128 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50526
G1 F4225
M204 S6000
G1 X126.354 Y127.769 E.00871
G1 X125.401 Y127.769 E.03589
G1 X125.401 Y128.231 E.01742
G1 X126.354 Y128.231 E.03589
G1 X126.354 Y128.06 E.00645
; WIPE_START
G1 F7786.477
G1 X126.354 Y128.231 E-.06504
G1 X125.401 Y128.231 E-.36201
G1 X125.401 Y127.769 E-.17569
G1 X125.815 Y127.769 E-.15725
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.057 Y128.87 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.63129
G1 F4225
M204 S6000
G1 X125.057 Y138.731 E.47278
M204 S10000
G1 X125.17 Y139.462 F42000
; LINE_WIDTH: 0.692493
G1 F4225
M204 S6000
G1 X126.585 Y139.462 E.0749
; WIPE_START
G1 F5542.102
G1 X125.17 Y139.462 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.162 Y138.187 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
; LINE_WIDTH: 0.5558
G1 F4225
M204 S6000
G1 X130.162 Y129.413 E.36672
; WIPE_START
G1 F7019.186
G1 X130.162 Y131.413 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.973 Y127.13 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
; LINE_WIDTH: 0.46339
G1 F4225
M204 S6000
G1 X124.973 Y117.269 E.33787
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8561.847
G1 X124.973 Y119.269 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/72
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z8.2 I-1.212 J.114 P1  F42000
G1 X126.841 Y139.19 Z8.2
G1 Z8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4213
M204 S5000
G1 X130.328 Y139.19 E.10716
G1 X130.328 Y140.41 E.03749
G1 X126.841 Y140.41 E.10716
G1 X126.841 Y139.25 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.841 Y139.216 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.883 Y131.838 Z8.4 F42000
G1 X126.042 Y128.666 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4213
M204 S6000
G1 X124.992 Y128.666 E.03481
G1 X124.992 Y127.334 E.04418
G1 X126.042 Y127.334 E.03481
G1 X126.042 Y128.606 E.04219
; WIPE_START
G1 F8843.478
G1 X124.992 Y128.666 E-.3994
G1 X124.992 Y127.717 E-.3606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.62 Y134.883 Z8.4 F42000
G1 X128.957 Y138.527 Z8.4
G1 Z8
G1 E.8 F1800
G1 F4213
M204 S6000
G1 X125.608 Y138.527 E.11108
G1 X125.608 Y129.073 E.31361
G1 X129.349 Y129.073 E.12408
G1 X129.349 Y138.527 E.31361
G1 X129.017 Y138.527 E.01102
M204 S250
G1 X128.957 Y138.135 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4213
M204 S5000
G1 X126 Y138.135 E.09084
G1 X126 Y138.094 E.00126
G1 X126 Y129.506 E.26389
G1 X126 Y129.465 E.00126
G1 X128.957 Y129.465 E.09084
G1 X128.957 Y138.075 E.26456
M204 S10000
G1 X129.756 Y138.391 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4213
M204 S6000
G1 X129.756 Y129.209 E.30457
G1 X130.658 Y129.209 E.02992
G1 X130.658 Y138.391 E.30457
G1 X129.816 Y138.391 E.02793
; WIPE_START
G1 F8843.478
G1 X129.803 Y136.391 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.042 Y139.19 Z8.4 F42000
G1 Z8
G1 E.8 F1800
G1 F4213
M204 S6000
G1 X126.042 Y139.991 E.02656
G1 X124.992 Y139.991 E.03481
G1 X124.992 Y138.934 E.03505
G1 X126.042 Y138.934 E.03481
G1 X126.042 Y139.13 E.0065
; WIPE_START
G1 F8843.478
G1 X126.042 Y139.991 E-.32709
G1 X124.992 Y139.991 E-.39875
G1 X124.992 Y139.901 E-.03417
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.454 Y132.282 Z8.4 F42000
G1 X125.779 Y126.927 Z8.4
G1 Z8
G1 E.8 F1800
G1 F4213
M204 S6000
G1 X125.387 Y126.927 E.01301
G1 X125.387 Y117.473 E.31361
G1 X129.041 Y117.473 E.12121
G1 X129.041 Y126.798 E.30933
G1 X130.72 Y126.798 E.05572
G1 X130.72 Y128.802 E.06648
G1 X126.449 Y128.802 E.14169
M73 P68 R5
G1 X126.449 Y126.927 E.0622
G1 X125.839 Y126.927 E.02024
; WIPE_START
G1 F8843.478
G1 X125.387 Y126.927 E-.17179
G1 X125.387 Y125.379 E-.58821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.328 Y127.19 Z8.4 F42000
G1 Z8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4213
M204 S5000
G1 X130.328 Y128.41 E.03749
G1 X126.841 Y128.41 E.10716
G1 X126.841 Y127.19 E.03749
G1 X130.268 Y127.19 E.10531
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.328 Y128.41 E-.46416
G1 X129.55 Y128.41 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.779 Y126.535 Z8.4 F42000
G1 Z8
G1 E.8 F1800
G1 F4213
M204 S5000
G1 X125.779 Y117.865 E.2664
G1 X128.649 Y117.865 E.08819
G1 X128.649 Y126.535 E.2664
G1 X125.839 Y126.535 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.825 Y124.535 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.083 Y116.939 Z8.4 F42000
G1 X124.992 Y116.009 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4213
M204 S6000
G1 X130.658 Y116.009 E.18793
G1 X130.658 Y126.391 E.34437
G1 X129.448 Y126.391 E.04014
G1 X129.448 Y117.066 E.30933
G1 X124.992 Y117.066 E.14779
G1 X124.992 Y116.069 E.03305
M204 S10000
G1 X124.585 Y115.602 F42000
G1 F4213
M204 S6000
G1 X131.065 Y115.602 E.21494
G1 X131.065 Y140.398 E.8225
G1 X130.72 Y140.398 E.01143
G1 X130.72 Y138.798 E.05306
G1 X126.449 Y138.798 E.14169
G1 X126.449 Y140.398 E.05307
G1 X124.585 Y140.398 E.06181
G1 X124.585 Y115.662 E.82052
M204 S250
G1 X124.193 Y115.407 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4213
M204 S5000
G3 X124.383 Y115.21 I.2 J.003 E.00926
G1 X131.262 Y115.21 E.21136
G3 X131.457 Y115.41 I-.006 J.201 E.00948
G1 X131.45 Y140.647 E.77547
G3 X131.265 Y140.79 I-.193 J-.059 E.00766
G1 X124.337 Y140.783 E.21286
G3 X124.193 Y140.59 I.056 J-.192 E.00795
G1 X124.193 Y115.467 E.77195
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.21 Y115.325 E-.05451
G1 X124.246 Y115.271 E-.02487
G1 X124.32 Y115.222 E-.03364
G1 X124.383 Y115.21 E-.02432
G1 X126.022 Y115.21 E-.62266
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


G1 X125.196 Y116.538 F42000
G1 Z8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692277
G1 F4213
M204 S6000
G1 X129.651 Y116.538 E.23575
M204 S10000
G1 X130.155 Y116.997 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.64242
G1 F4213
M204 S6000
G1 X130.155 Y116.573 E.02075
M204 S10000
G1 X129.852 Y125.987 F42000
; LINE_WIDTH: 0.44439
G1 F4213
M204 S6000
G1 X130.254 Y125.987 E.01313
G1 X130.254 Y117.437 E.27971
; LINE_WIDTH: 0.466155
G1 X130.232 Y117.32 E.00408
; LINE_WIDTH: 0.509685
G1 X130.21 Y117.204 E.0045
; LINE_WIDTH: 0.553215
G1 X130.188 Y117.087 E.00492
; LINE_WIDTH: 0.59184
G1 X130.171 Y117.042 E.00215
; LINE_WIDTH: 0.62556
G1 X130.155 Y116.997 E.00228
; LINE_WIDTH: 0.62528
G1 X130.136 Y117.042 E.00228
; LINE_WIDTH: 0.591
G1 X130.118 Y117.086 E.00214
; LINE_WIDTH: 0.55672
G1 X130.099 Y117.13 E.00201
; LINE_WIDTH: 0.515783
G1 X129.977 Y117.211 E.00564
; LINE_WIDTH: 0.444787
G1 X129.855 Y117.291 E.00479
G1 X129.852 Y117.437 E.00478
G1 X129.852 Y125.927 E.27802
; WIPE_START
G1 F8958.2
M73 P69 R5
G1 X129.852 Y123.927 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.845 Y126.862 Z8.4 F42000
G1 Z8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.30586
G1 F4213
M204 S6000
G1 X126.645 Y126.862 E.04713
; WIPE_START
G1 F13691.336
G1 X128.645 Y126.862 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.678 Y127.859 Z8.4 F42000
G1 Z8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.36406
G1 F4213
M204 S6000
G1 X125.678 Y127.698 E.0042
G1 X125.357 Y127.698 E.0084
G1 X125.357 Y128.302 E.01579
G1 X125.678 Y128.302 E.0084
G1 X125.678 Y127.919 E.01002
; WIPE_START
G1 F11210.064
G1 X125.678 Y128.302 E-.16266
G1 X125.357 Y128.302 E-.1364
G1 X125.357 Y127.698 E-.25635
G1 X125.678 Y127.698 E-.1364
G1 X125.678 Y127.859 E-.0682
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.986 Y127.13 Z8.4 F42000
G1 Z8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43706
G1 F4213
M204 S6000
G1 X124.986 Y117.269 E.31671
; WIPE_START
G1 F9133.81
G1 X124.986 Y119.269 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.074 Y126.901 Z8.4 F42000
G1 X125.097 Y128.87 Z8.4
G1 Z8
G1 E.8 F1800
; LINE_WIDTH: 0.65855
G1 F4213
M204 S6000
G1 X125.097 Y138.731 E.49469
M204 S10000
G1 X125.678 Y139.298 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.36406
G1 F4213
M204 S6000
G1 X125.357 Y139.298 E.0084
G1 X125.357 Y139.627 E.0086
G1 X125.678 Y139.627 E.0084
G1 X125.678 Y139.358 E.00703
; WIPE_START
G1 F11210.064
G1 X125.678 Y139.627 E-.16464
G1 X125.357 Y139.627 E-.19695
G1 X125.357 Y139.298 E-.20145
G1 X125.678 Y139.298 E-.19695
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.207 Y138.187 Z8.4 F42000
G1 Z8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.53793
G1 F4213
M204 S6000
G1 X130.207 Y129.413 E.35394
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7272.58
G1 X130.207 Y131.413 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/72
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z8.4 I-1.076 J-.569 P1  F42000
G1 X126.095 Y139.19 Z8.4
G1 Z8.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4193
M204 S5000
G1 X130.382 Y139.19 E.13174
G1 X130.382 Y140.41 E.03749
G1 X126.095 Y140.41 E.13174
G1 X126.095 Y139.25 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.094 Y139.222 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.402 Y138.135 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4193
M204 S6000
G1 X129.402 Y138.527 E.01301
G1 X125.662 Y138.527 E.12408
G1 X125.662 Y129.073 E.31361
G1 X129.402 Y129.073 E.12408
G1 X129.402 Y138.075 E.29861
M204 S250
G1 X129.01 Y138.135 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4193
M204 S5000
G1 X126.054 Y138.135 E.09084
G1 X126.054 Y138.094 E.00126
G1 X126.054 Y129.506 E.26389
G1 X126.054 Y129.465 E.00126
G1 X129.01 Y129.465 E.09084
G1 X129.01 Y138.075 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.011 Y138.116 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.811 Y130.578 Z8.6 F42000
G1 X125.295 Y127.334 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4193
M204 S6000
G1 X125.295 Y128.666 E.04418
G1 X125.019 Y128.666 E.00917
G1 X125.019 Y127.334 E.04418
G1 X125.235 Y127.334 E.00718
; WIPE_START
G1 F8843.478
G1 X125.295 Y128.666 E-.50657
G1 X125.019 Y128.666 E-.1051
G1 X125.019 Y128.276 E-.14832
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.286 Y135.174 Z8.6 F42000
G1 X129.809 Y138.391 Z8.6
G1 Z8.2
G1 E.8 F1800
G1 F4193
M204 S6000
G1 X129.809 Y129.209 E.30457
G1 X130.694 Y129.209 E.02933
G1 X130.694 Y138.391 E.30457
G1 X129.869 Y138.391 E.02734
; WIPE_START
G1 F8843.478
G1 X129.856 Y136.391 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.295 Y139.19 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
G1 F4193
M204 S6000
G1 X125.295 Y139.991 E.02656
G1 X125.019 Y139.991 E.00917
G1 X125.019 Y138.934 E.03505
G1 X125.295 Y138.934 E.00917
G1 X125.295 Y139.13 E.0065
; WIPE_START
G1 F8843.478
G1 X125.295 Y139.991 E-.32709
G1 X125.019 Y139.991 E-.1051
G1 X125.019 Y139.128 E-.3278
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.242 Y131.499 Z8.6 F42000
G1 X125.387 Y126.535 Z8.6
G1 Z8.2
G1 E.8 F1800
G1 F4193
M204 S6000
G1 X125.387 Y117.473 E.30061
G1 X129.041 Y117.473 E.12121
G1 X129.041 Y126.798 E.30933
G1 X130.774 Y126.798 E.0575
G1 X130.774 Y128.802 E.06648
G1 X125.702 Y128.802 E.16823
G1 X125.702 Y126.927 E.0622
G1 X125.387 Y126.927 E.01048
G1 X125.387 Y126.595 E.01102
; WIPE_START
G1 F8843.478
G1 X125.387 Y124.595 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.382 Y127.19 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4193
M204 S5000
G1 X130.382 Y128.41 E.03749
G1 X126.095 Y128.41 E.13174
G1 X126.095 Y127.19 E.03749
G1 X130.322 Y127.19 E.1299
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.382 Y128.41 E-.46416
G1 X129.603 Y128.41 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.779 Y126.535 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
G1 F4193
M204 S5000
G1 X125.779 Y117.865 E.2664
G1 X128.649 Y117.865 E.08819
G1 X128.649 Y126.535 E.2664
G1 X125.839 Y126.535 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.825 Y124.535 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.106 Y116.936 Z8.6 F42000
G1 X125.019 Y116.009 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4193
M204 S6000
G1 X130.694 Y116.009 E.18824
G1 X130.694 Y126.391 E.34437
G1 X129.448 Y126.391 E.04132
G1 X129.448 Y117.066 E.30933
G1 X125.019 Y117.066 E.14692
G1 X125.019 Y116.069 E.03305
M204 S10000
G1 X124.612 Y115.602 F42000
G1 F4193
M204 S6000
G1 X131.101 Y115.602 E.21525
G1 X131.101 Y140.398 E.8225
G1 X130.774 Y140.398 E.01083
G1 X130.774 Y138.798 E.05306
G1 X125.702 Y138.798 E.16823
G1 X125.702 Y140.398 E.05307
G1 X124.612 Y140.398 E.03618
G1 X124.612 Y115.662 E.82052
M204 S250
G1 X124.22 Y115.407 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4193
M204 S5000
G3 X124.41 Y115.21 I.2 J.003 E.00926
G1 X131.296 Y115.21 E.21161
G3 X131.493 Y115.41 I-.004 J.201 E.00953
G1 X131.486 Y140.647 E.77547
G3 X131.3 Y140.79 I-.195 J-.062 E.00764
G1 X124.363 Y140.783 E.21316
G3 X124.22 Y140.59 I.06 J-.194 E.00792
G1 X124.22 Y115.467 E.77195
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.236 Y115.325 E-.05455
G1 X124.273 Y115.271 E-.02484
G1 X124.347 Y115.222 E-.03362
G1 X124.41 Y115.21 E-.02433
G1 X126.048 Y115.21 E-.62266
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


G1 X125.222 Y116.538 F42000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.69229
G1 F4193
M204 S6000
G1 X129.651 Y116.538 E.23436
; WIPE_START
G1 F5543.842
G1 X127.651 Y116.538 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.999 Y117.269 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
; LINE_WIDTH: 0.41073
G1 F4193
M204 S6000
G1 X124.999 Y127.13 E.29555
M204 S10000
G1 X125.899 Y126.862 F42000
; LINE_WIDTH: 0.30586
G1 F4193
M204 S6000
G1 X128.845 Y126.862 E.06312
; WIPE_START
G1 F13691.336
G1 X126.845 Y126.862 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.861 Y125.978 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.46225
G1 F4193
M204 S6000
G1 X130.28 Y125.978 E.01433
G1 X130.28 Y117.447 E.2915
; LINE_WIDTH: 0.445297
G1 X130.297 Y117.327 E.00397
; LINE_WIDTH: 0.41139
G1 X130.314 Y117.207 E.00363
; LINE_WIDTH: 0.361628
G1 X130.331 Y117.087 E.00314
G1 X130.331 Y116.372 E.01859
G1 X130.014 Y116.372 E.00825
G1 X130.014 Y117.087 E.01859
; LINE_WIDTH: 0.377484
G1 X129.997 Y117.147 E.0017
; LINE_WIDTH: 0.41139
G1 X129.98 Y117.207 E.00187
; LINE_WIDTH: 0.46213
G1 X129.963 Y117.267 E.00213
G1 X129.861 Y117.295 E.00361
G1 X129.861 Y125.918 E.29454
; WIPE_START
G1 F8587.583
G1 X129.861 Y123.918 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.251 Y129.413 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.52006
G1 F4193
M204 S6000
G1 X130.251 Y138.187 E.34117
; WIPE_START
G1 F7544.956
G1 X130.251 Y136.187 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.137 Y138.731 Z8.6 F42000
G1 Z8.2
M73 P70 R5
G1 E.8 F1800
; LINE_WIDTH: 0.68581
G1 F4193
M204 S6000
G1 X125.137 Y128.87 E.51659
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5599.714
G1 X125.137 Y130.87 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 42/72
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z8.6 I-1.217 J.031 P1  F42000
G1 X125.348 Y139.19 Z8.6
G1 Z8.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4232
M204 S5000
G1 X130.436 Y139.19 E.15632
G1 X130.436 Y140.41 E.03749
G1 X125.348 Y140.41 E.15632
G1 X125.348 Y139.25 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.348 Y139.226 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.064 Y138.527 Z8.8 F42000
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4232
M204 S6000
G1 X125.715 Y138.527 E.11108
G1 X125.715 Y129.073 E.31361
G1 X129.456 Y129.073 E.12408
G1 X129.456 Y138.527 E.31361
G1 X129.124 Y138.527 E.01102
M204 S250
G1 X129.064 Y138.135 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4232
M204 S5000
G1 X126.107 Y138.135 E.09084
G1 X126.107 Y138.094 E.00126
G1 X126.107 Y129.506 E.26389
G1 X126.107 Y129.465 E.00126
G1 X129.064 Y129.465 E.09084
G1 X129.064 Y138.075 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.064 Y138.116 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.173 Y130.78 Z8.8 F42000
G1 X130.436 Y126.391 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4232
M204 S6000
G1 X129.448 Y126.391 E.03276
G1 X129.448 Y117.066 E.30933
G1 X125.045 Y117.066 E.14605
G1 X125.045 Y116.009 E.03504
G1 X130.729 Y116.009 E.18855
G1 X130.729 Y126.391 E.34437
G1 X130.496 Y126.391 E.00775
; WIPE_START
G1 F8843.478
G1 X129.448 Y126.391 E-.39812
G1 X129.448 Y125.439 E-.36188
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.387 Y126.535 Z8.8 F42000
G1 Z8.4
G1 E.8 F1800
G1 F4232
M204 S6000
G1 X125.387 Y117.473 E.30061
G1 X129.041 Y117.473 E.12121
G1 X129.041 Y126.798 E.30933
G1 X130.828 Y126.798 E.05927
G1 X130.828 Y128.802 E.06648
G1 X124.956 Y128.802 E.19477
G1 X124.956 Y126.798 E.06648
G1 X125.387 Y126.798 E.01428
G1 X125.387 Y126.595 E.00673
; WIPE_START
G1 F8843.478
G1 X125.387 Y124.595 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.436 Y127.19 Z8.8 F42000
G1 Z8.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4232
M204 S5000
G1 X130.436 Y128.41 E.03749
G1 X125.348 Y128.41 E.15632
G1 X125.348 Y127.19 E.03749
G1 X130.376 Y127.19 E.15448
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.436 Y128.41 E-.46416
G1 X129.657 Y128.41 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.779 Y126.535 Z8.8 F42000
G1 Z8.4
G1 E.8 F1800
G1 F4232
M204 S5000
G1 X125.779 Y117.865 E.2664
G1 X128.649 Y117.865 E.08819
G1 X128.649 Y126.535 E.2664
G1 X125.839 Y126.535 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.825 Y124.535 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.54 Y132.162 Z8.8 F42000
G1 X125.308 Y138.391 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4232
M204 S6000
G1 X125.045 Y138.391 E.00873
G1 X125.045 Y129.209 E.30457
G1 X125.308 Y129.209 E.00873
G1 X125.308 Y138.331 E.30258
; WIPE_START
G1 F8843.478
G1 X125.045 Y138.391 E-.10254
G1 X125.045 Y136.661 E-.65746
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.863 Y138.391 Z8.8 F42000
G1 Z8.4
G1 E.8 F1800
G1 F4232
M204 S6000
G1 X129.863 Y129.209 E.30457
G1 X130.729 Y129.209 E.02874
G1 X130.729 Y138.391 E.30457
G1 X129.923 Y138.391 E.02675
; WIPE_START
G1 F8843.478
G1 X129.91 Y136.391 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.034 Y128.993 Z8.8 F42000
G1 X124.638 Y115.602 Z8.8
G1 Z8.4
G1 E.8 F1800
G1 F4232
M204 S6000
G1 X131.136 Y115.602 E.21556
G1 X131.136 Y140.398 E.8225
G1 X130.828 Y140.398 E.01024
G1 X130.828 Y138.798 E.05306
G1 X124.956 Y138.798 E.19477
G1 X124.956 Y140.398 E.05307
G1 X124.638 Y140.398 E.01055
G1 X124.638 Y115.662 E.82052
M204 S250
G1 X124.246 Y115.407 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4232
M204 S5000
G3 X124.436 Y115.21 I.2 J.003 E.00926
G1 X131.379 Y115.217 E.21336
G3 X131.528 Y115.41 I-.045 J.189 E.00811
G1 X131.522 Y140.647 E.77547
G3 X131.336 Y140.79 I-.193 J-.06 E.00766
G1 X124.39 Y140.783 E.21344
G3 X124.246 Y140.59 I.059 J-.194 E.00792
G1 X124.246 Y115.467 E.77195
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.262 Y115.325 E-.05454
G1 X124.299 Y115.271 E-.02482
G1 X124.373 Y115.222 E-.03363
G1 X124.436 Y115.21 E-.0243
G1 X126.075 Y115.212 E-.62271
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


G1 X125.249 Y116.538 F42000
G1 Z8.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692292
G1 F4232
M204 S6000
G1 X129.651 Y116.538 E.23297
; WIPE_START
G1 F5543.822
G1 X127.651 Y116.538 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.012 Y117.269 Z8.8 F42000
G1 Z8.4
G1 E.8 F1800
; LINE_WIDTH: 0.3844
G1 F4232
M204 S6000
G1 X125.012 Y126.594 E.25948
M204 S10000
G1 X125.583 Y126.862 F42000
; LINE_WIDTH: 0.30586
G1 F4232
M204 S6000
G1 X128.845 Y126.862 E.06989
; WIPE_START
G1 F13691.336
G1 X126.845 Y126.862 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.87 Y125.969 Z8.8 F42000
G1 Z8.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.48011
G1 F4232
M204 S6000
G1 X130.307 Y125.969 E.01558
G1 X130.307 Y117.457 E.30324
; LINE_WIDTH: 0.463157
G1 X130.324 Y117.334 E.00426
; LINE_WIDTH: 0.42925
G1 X130.341 Y117.211 E.00391
; LINE_WIDTH: 0.379515
G1 X130.358 Y117.087 E.00341
G1 X130.358 Y116.381 E.01938
G1 X130.023 Y116.381 E.0092
G1 X130.023 Y117.087 E.01938
; LINE_WIDTH: 0.395344
G1 X130.006 Y117.149 E.00183
; LINE_WIDTH: 0.42925
G1 X129.989 Y117.211 E.00201
; LINE_WIDTH: 0.479987
G1 X129.972 Y117.272 E.00227
G1 X129.87 Y117.302 E.00377
G1 X129.87 Y125.909 E.30655
; WIPE_START
G1 F8236.73
G1 X129.87 Y123.909 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.296 Y129.413 Z8.8 F42000
G1 Z8.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.50219
G1 F4232
M204 S6000
G1 X130.296 Y138.187 E.32839
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F7838.526
G1 X130.296 Y136.187 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 43/72
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z8.8 I1.217 J.026 P1  F42000
G1 X130.489 Y127.19 Z8.8
G1 Z8.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4245
M204 S5000
G1 X130.489 Y128.41 E.03749
G1 X124.789 Y128.41 E.17514
G1 X124.789 Y127.19 E.03749
G1 X130.429 Y127.19 E.1733
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.489 Y128.41 E-.46416
G1 X129.711 Y128.41 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.779 Y126.535 Z9 F42000
G1 Z8.6
G1 E.8 F1800
G1 F4245
M204 S5000
G1 X125.779 Y117.865 E.2664
M73 P71 R5
G1 X128.649 Y117.865 E.08819
G1 X128.649 Y126.535 E.2664
G1 X125.839 Y126.535 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.825 Y124.535 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.287 Y132.148 Z9 F42000
G1 X124.789 Y139.19 Z9
G1 Z8.6
G1 E.8 F1800
G1 F4245
M204 S5000
G1 X130.489 Y139.19 E.17514
G1 X130.489 Y140.41 E.03749
G1 X124.789 Y140.41 E.17514
G1 X124.789 Y139.25 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.789 Y139.229 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.509 Y138.135 Z9 F42000
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4245
M204 S6000
G1 X129.509 Y138.527 E.01301
G1 X125.769 Y138.527 E.12408
G1 X125.769 Y129.073 E.31361
G1 X129.509 Y129.073 E.12408
G1 X129.509 Y138.075 E.29861
M204 S250
G1 X129.117 Y138.135 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4245
M204 S5000
G1 X126.161 Y138.135 E.09084
G1 X126.161 Y138.094 E.00126
G1 X126.161 Y129.506 E.26389
G1 X126.161 Y129.465 E.00126
G1 X129.117 Y129.465 E.09084
G1 X129.117 Y138.075 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.118 Y138.116 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.227 Y130.78 Z9 F42000
G1 X130.489 Y126.391 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4245
M204 S6000
G1 X129.448 Y126.391 E.03454
G1 X129.448 Y117.066 E.30933
G1 X125.071 Y117.066 E.14517
G1 X125.071 Y116.009 E.03504
G1 X130.765 Y116.009 E.18886
G1 X130.765 Y126.391 E.34437
G1 X130.549 Y126.391 E.00716
; WIPE_START
G1 F8843.478
G1 X129.448 Y126.391 E-.41849
G1 X129.448 Y125.492 E-.34151
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.725 Y133.12 Z9 F42000
G1 X129.917 Y138.391 Z9
G1 Z8.6
G1 E.8 F1800
G1 F4245
M204 S6000
G1 X129.917 Y129.209 E.30457
G1 X130.765 Y129.209 E.02815
G1 X130.765 Y138.391 E.30457
G1 X129.977 Y138.391 E.02616
; WIPE_START
G1 F8843.478
G1 X129.963 Y136.391 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.362 Y138.135 Z9 F42000
G1 Z8.6
G1 E.8 F1800
G1 F4245
M204 S6000
G1 X125.362 Y138.391 E.00849
G1 X125.071 Y138.391 E.00963
G1 X125.071 Y129.209 E.30457
G1 X125.362 Y129.209 E.00963
G1 X125.362 Y138.075 E.2941
; WIPE_START
G1 F8843.478
G1 X125.362 Y138.391 E-.12003
G1 X125.071 Y138.391 E-.11033
G1 X125.071 Y136.997 E-.52964
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.926 Y129.366 Z9 F42000
G1 X124.664 Y115.602 Z9
G1 Z8.6
G1 E.8 F1800
G1 F4245
M204 S6000
G1 X131.172 Y115.602 E.21587
G1 X131.172 Y140.398 E.8225
G1 X130.881 Y140.398 E.00965
G1 X130.881 Y138.798 E.05306
G1 X124.664 Y138.798 E.20622
G1 X124.664 Y128.802 E.33158
G1 X130.881 Y128.802 E.20622
G1 X130.881 Y126.798 E.06648
G1 X129.041 Y126.798 E.06105
G1 X129.041 Y117.473 E.30933
G1 X125.387 Y117.473 E.12121
G1 X125.387 Y126.798 E.30933
G1 X124.664 Y126.798 E.02396
G1 X124.664 Y115.662 E.36939
M204 S250
G1 X124.272 Y115.407 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4245
M204 S5000
G3 X124.462 Y115.21 I.2 J.003 E.00925
G1 X131.415 Y115.217 E.21365
G3 X131.564 Y115.41 I-.046 J.189 E.00811
G1 X131.557 Y140.647 E.77547
G3 X131.372 Y140.79 I-.195 J-.062 E.00765
G1 X124.416 Y140.783 E.21373
G3 X124.272 Y140.59 I.06 J-.195 E.00791
G1 X124.272 Y115.467 E.77196
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.289 Y115.324 E-.05471
G1 X124.325 Y115.27 E-.02463
G1 X124.399 Y115.222 E-.03358
G1 X124.462 Y115.21 E-.02433
G1 X126.101 Y115.212 E-.62276
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


G1 X125.275 Y116.538 F42000
G1 Z8.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692314
G1 F4245
M204 S6000
G1 X129.651 Y116.538 E.23158
; WIPE_START
G1 F5543.633
G1 X127.651 Y116.538 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.026 Y117.269 Z9 F42000
G1 Z8.6
G1 E.8 F1800
; LINE_WIDTH: 0.35807
G1 F4245
M204 S6000
G1 X125.026 Y126.594 E.23947
M204 S10000
G1 X125.583 Y126.862 F42000
; LINE_WIDTH: 0.30586
G1 F4245
M204 S6000
G1 X128.845 Y126.862 E.06989
; WIPE_START
G1 F13691.336
G1 X126.845 Y126.862 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.879 Y125.96 Z9 F42000
G1 Z8.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.49797
G1 F4245
M204 S6000
G1 X130.334 Y125.96 E.01687
G1 X130.334 Y117.467 E.31494
; LINE_WIDTH: 0.481017
G1 X130.351 Y117.34 E.00455
; LINE_WIDTH: 0.44711
G1 X130.368 Y117.214 E.0042
; LINE_WIDTH: 0.397402
G1 X130.385 Y117.087 E.00368
G1 X130.385 Y116.39 E.02016
G1 X130.031 Y116.39 E.01021
G1 X130.031 Y117.087 E.02016
; LINE_WIDTH: 0.413204
G1 X130.015 Y117.151 E.00197
; LINE_WIDTH: 0.44711
G1 X129.998 Y117.214 E.00215
; LINE_WIDTH: 0.497844
G1 X129.981 Y117.277 E.00243
G1 X129.879 Y117.308 E.00394
G1 X129.879 Y125.9 E.31851
; WIPE_START
G1 F7913.42
G1 X129.879 Y123.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.341 Y129.413 Z9 F42000
G1 Z8.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.48433
G1 F4245
M204 S6000
G1 X130.341 Y138.187 E.31562
; WIPE_START
G1 F8155.683
G1 X130.341 Y136.187 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.531 Y138.994 Z9 F42000
G1 Z8.6
G1 E.8 F1800
; LINE_WIDTH: 0.16773
G1 F4245
M204 S6000
G1 X124.531 Y140.594 E.01627
M204 S10000
G1 X124.531 Y128.606 F42000
G1 F4245
M204 S6000
G1 X124.531 Y126.994 E.01639
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.531 Y128.606 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 44/72
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z9 I.279 J1.185 P1  F42000
G1 X130.543 Y127.19 Z9
G1 Z8.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4231
M204 S5000
G1 X130.543 Y128.41 E.03749
G1 X124.843 Y128.41 E.17514
G1 X124.843 Y128.369 E.00126
G1 X124.843 Y127.231 E.03497
G1 X124.843 Y127.19 E.00126
G1 X130.483 Y127.19 E.1733
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.543 Y128.41 E-.46416
G1 X129.764 Y128.41 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.779 Y126.535 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
G1 F4231
M204 S5000
G1 X125.779 Y117.865 E.2664
G1 X128.649 Y117.865 E.08819
G1 X128.649 Y126.535 E.2664
G1 X125.839 Y126.535 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.825 Y124.535 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P72 R5
G1 X125.315 Y132.15 Z9.2 F42000
G1 X124.843 Y139.19 Z9.2
G1 Z8.8
G1 E.8 F1800
G1 F4231
M204 S5000
G1 X130.543 Y139.19 E.17514
G1 X130.543 Y140.41 E.03749
G1 X124.843 Y140.41 E.17514
G1 X124.843 Y140.369 E.00126
G1 X124.843 Y139.25 E.03438
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.843 Y139.229 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.171 Y138.527 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4231
M204 S6000
G1 X125.822 Y138.527 E.11107
G1 X125.822 Y129.073 E.31361
G1 X129.563 Y129.073 E.12408
G1 X129.563 Y138.527 E.31361
G1 X129.231 Y138.527 E.01102
M204 S250
G1 X129.171 Y138.135 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4231
M204 S5000
G1 X126.215 Y138.135 E.09084
G1 X126.215 Y138.094 E.00126
G1 X126.215 Y129.506 E.26389
G1 X126.215 Y129.465 E.00126
G1 X129.171 Y129.465 E.09084
G1 X129.171 Y138.075 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.171 Y138.116 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.281 Y130.78 Z9.2 F42000
G1 X130.543 Y126.391 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4231
M204 S6000
G1 X129.448 Y126.391 E.03632
G1 X129.448 Y117.066 E.30933
G1 X125.1 Y117.066 E.14422
G1 X125.1 Y116.009 E.03504
G1 X130.801 Y116.009 E.18909
G1 X130.801 Y126.391 E.34437
G1 X130.603 Y126.391 E.00657
; WIPE_START
G1 F8843.478
G1 X129.448 Y126.391 E-.43885
G1 X129.448 Y125.546 E-.32115
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.758 Y133.172 Z9.2 F42000
G1 X129.97 Y138.391 Z9.2
G1 Z8.8
G1 E.8 F1800
G1 F4231
M204 S6000
G1 X129.97 Y129.209 E.30457
G1 X130.801 Y129.209 E.02755
G1 X130.801 Y138.391 E.30457
G1 X130.03 Y138.391 E.02556
; WIPE_START
G1 F8843.478
G1 X130.017 Y136.391 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.415 Y138.135 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
G1 F4231
M204 S6000
G1 X125.415 Y138.391 E.00849
G1 X125.1 Y138.391 E.01045
G1 X125.1 Y129.209 E.30457
G1 X125.415 Y129.209 E.01045
G1 X125.415 Y138.075 E.2941
; WIPE_START
G1 F8843.478
G1 X125.415 Y138.391 E-.12003
G1 X125.1 Y138.391 E-.11975
G1 X125.1 Y137.022 E-.52022
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.955 Y129.391 Z9.2 F42000
G1 X124.693 Y115.602 Z9.2
G1 Z8.8
G1 E.8 F1800
G1 F4231
M204 S6000
G1 X131.208 Y115.602 E.2161
G1 X131.208 Y140.398 E.82251
G1 X130.935 Y140.398 E.00906
G1 X130.935 Y138.798 E.05306
G1 X124.693 Y138.798 E.20704
G1 X124.693 Y128.802 E.33158
G1 X130.935 Y128.802 E.20704
G1 X130.935 Y126.798 E.06648
G1 X129.041 Y126.798 E.06283
G1 X129.041 Y117.473 E.30933
G1 X125.387 Y117.473 E.12121
G1 X125.387 Y126.798 E.30933
G1 X124.693 Y126.798 E.023
G1 X124.693 Y115.662 E.36939
M204 S250
G1 X124.301 Y115.408 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4231
M204 S5000
G3 X124.494 Y115.21 I.202 J.004 E.00933
G1 X131.451 Y115.217 E.21378
G3 X131.6 Y115.41 I-.046 J.189 E.0081
G1 X131.593 Y140.647 E.77547
G3 X131.408 Y140.79 I-.194 J-.061 E.00766
G1 X124.505 Y140.79 E.21209
G3 X124.301 Y140.59 I-.002 J-.202 E.00976
G1 X124.301 Y115.468 E.77194
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.318 Y115.325 E-.05448
G1 X124.354 Y115.271 E-.02489
G1 X124.43 Y115.222 E-.03402
G1 X124.494 Y115.21 E-.02485
G1 X126.13 Y115.212 E-.62176
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


G1 X125.304 Y116.538 F42000
G1 Z8.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692336
G1 F4231
M204 S6000
G1 X129.651 Y116.538 E.23006
; WIPE_START
G1 F5543.449
G1 X127.651 Y116.538 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.04 Y117.269 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
; LINE_WIDTH: 0.32928
G1 F4231
M204 S6000
G1 X125.04 Y126.594 E.21759
M204 S10000
G1 X125.583 Y126.862 F42000
; LINE_WIDTH: 0.30586
G1 F4231
M204 S6000
G1 X128.845 Y126.862 E.06989
; WIPE_START
G1 F13691.336
G1 X126.845 Y126.862 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.888 Y125.951 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51583
G1 F4231
M204 S6000
G1 X130.361 Y125.951 E.01822
G1 X130.361 Y117.476 E.32659
; LINE_WIDTH: 0.498877
G1 X130.378 Y117.346 E.00485
; LINE_WIDTH: 0.46497
G1 X130.395 Y117.217 E.00449
; LINE_WIDTH: 0.415289
G1 X130.412 Y117.087 E.00396
G1 X130.412 Y116.398 E.02091
G1 X130.04 Y116.398 E.01126
G1 X130.04 Y117.087 E.02091
; LINE_WIDTH: 0.431064
G1 X130.023 Y117.152 E.00212
; LINE_WIDTH: 0.46497
G1 X130.006 Y117.217 E.0023
; LINE_WIDTH: 0.515701
G1 X129.99 Y117.282 E.00258
G1 X129.888 Y117.314 E.00411
G1 X129.888 Y125.891 E.33045
; WIPE_START
G1 F7614.531
G1 X129.888 Y123.891 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.385 Y129.413 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.46646
G1 F4231
M204 S6000
G1 X130.385 Y138.187 E.30284
; WIPE_START
G1 F8499.787
G1 X130.385 Y136.187 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.572 Y138.994 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
; LINE_WIDTH: 0.19253
G1 F4231
M204 S6000
G1 X124.572 Y140.594 E.0195
M204 S10000
G1 X124.572 Y128.606 F42000
G1 F4231
M204 S6000
G1 X124.572 Y126.994 E.01965
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.572 Y128.606 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 45/72
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z9.2 I.278 J1.185 P1  F42000
G1 X130.596 Y127.19 Z9.2
G1 Z9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4234
M204 S5000
G1 X130.596 Y128.41 E.03749
G1 X124.896 Y128.41 E.17514
G1 X124.896 Y128.369 E.00126
G1 X124.896 Y127.231 E.03497
G1 X124.896 Y127.19 E.00126
G1 X130.536 Y127.19 E.1733
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.596 Y128.41 E-.46416
G1 X129.818 Y128.41 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.779 Y126.535 Z9.4 F42000
G1 Z9
G1 E.8 F1800
G1 F4234
M204 S5000
G1 X125.779 Y117.865 E.2664
G1 X128.649 Y117.865 E.08819
G1 X128.649 Y126.535 E.2664
G1 X125.839 Y126.535 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.825 Y124.535 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.342 Y132.152 Z9.4 F42000
G1 X124.896 Y139.19 Z9.4
G1 Z9
G1 E.8 F1800
G1 F4234
M204 S5000
G1 X130.596 Y139.19 E.17514
G1 X130.596 Y140.41 E.03749
G1 X124.896 Y140.41 E.17514
G1 X124.896 Y140.369 E.00126
G1 X124.896 Y139.25 E.03438
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.896 Y139.229 E-.76
; WIPE_END
M73 P73 R5
G1 E-.04 F1800
M204 S10000
G1 X129.617 Y138.135 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4234
M204 S6000
G1 X129.617 Y138.527 E.01301
G1 X125.876 Y138.527 E.12408
G1 X125.876 Y129.073 E.31361
G1 X129.617 Y129.073 E.12408
G1 X129.617 Y138.075 E.29861
M204 S250
G1 X129.225 Y138.135 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4234
M204 S5000
G1 X126.268 Y138.135 E.09084
G1 X126.268 Y138.094 E.00126
G1 X126.268 Y129.506 E.26389
G1 X126.268 Y129.465 E.00126
G1 X129.225 Y129.465 E.09084
G1 X129.225 Y138.075 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.225 Y138.116 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.334 Y130.78 Z9.4 F42000
G1 X130.596 Y126.391 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4234
M204 S6000
G1 X129.448 Y126.391 E.0381
G1 X129.448 Y117.066 E.30933
G1 X125.136 Y117.066 E.14303
G1 X125.136 Y116.009 E.03505
G1 X130.836 Y116.009 E.18909
G1 X130.836 Y126.391 E.34438
G1 X130.656 Y126.391 E.00598
; WIPE_START
G1 F8843.478
G1 X129.448 Y126.391 E-.45921
G1 X129.448 Y125.599 E-.30079
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.791 Y133.224 Z9.4 F42000
G1 X130.024 Y138.391 Z9.4
G1 Z9
G1 E.8 F1800
G1 F4234
M204 S6000
G1 X130.024 Y129.209 E.30457
G1 X130.836 Y129.209 E.02696
G1 X130.836 Y138.391 E.30457
G1 X130.084 Y138.391 E.02497
; WIPE_START
G1 F8843.478
G1 X130.071 Y136.391 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.469 Y138.135 Z9.4 F42000
G1 Z9
G1 E.8 F1800
G1 F4234
M204 S6000
G1 X125.469 Y138.391 E.00849
G1 X125.136 Y138.391 E.01104
G1 X125.136 Y129.209 E.30457
G1 X125.469 Y129.209 E.01104
G1 X125.469 Y138.075 E.2941
; WIPE_START
G1 F8843.478
G1 X125.469 Y138.391 E-.12003
G1 X125.136 Y138.391 E-.12648
G1 X125.136 Y137.04 E-.51349
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.991 Y129.408 Z9.4 F42000
G1 X124.729 Y115.602 Z9.4
G1 Z9
G1 E.8 F1800
G1 F4234
M204 S6000
G1 X131.244 Y115.602 E.2161
G1 X131.244 Y140.398 E.82251
G1 X130.988 Y140.398 E.00846
G1 X130.988 Y138.798 E.05306
G1 X124.729 Y138.798 E.20763
G1 X124.729 Y128.802 E.33158
G1 X130.988 Y128.802 E.20763
G1 X130.988 Y126.798 E.06648
G1 X129.041 Y126.798 E.06461
G1 X129.041 Y117.473 E.30933
G1 X125.387 Y117.473 E.12121
G1 X125.387 Y126.798 E.30933
G1 X124.729 Y126.798 E.02181
G1 X124.729 Y115.662 E.36939
M204 S250
G1 X124.337 Y115.408 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4234
M204 S5000
G3 X124.53 Y115.21 I.202 J.004 E.00933
G1 X131.487 Y115.217 E.21378
G3 X131.636 Y115.41 I-.046 J.189 E.00809
G1 X131.629 Y140.647 E.77547
G3 X131.443 Y140.79 I-.192 J-.059 E.00767
G1 X124.541 Y140.79 E.21208
G3 X124.337 Y140.59 I-.002 J-.202 E.00976
G1 X124.337 Y115.468 E.77194
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.354 Y115.325 E-.05448
G1 X124.39 Y115.271 E-.02479
G1 X124.465 Y115.222 E-.03408
G1 X124.53 Y115.21 E-.0249
G1 X126.166 Y115.212 E-.62176
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


G1 X125.34 Y116.538 F42000
G1 Z9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692356
G1 F4234
M204 S6000
G1 X129.651 Y116.538 E.22817
; WIPE_START
G1 F5543.277
G1 X127.651 Y116.538 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.058 Y117.269 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.29339
G1 F4234
M204 S6000
G1 X125.058 Y126.594 E.19032
M204 S10000
G1 X125.583 Y126.862 F42000
; LINE_WIDTH: 0.30586
G1 F4234
M204 S6000
G1 X128.845 Y126.862 E.06989
; WIPE_START
G1 F13691.336
G1 X126.845 Y126.862 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.897 Y125.942 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.53369
G1 F4234
M204 S6000
G1 X130.388 Y125.942 E.01963
G1 X130.388 Y117.485 E.3382
; LINE_WIDTH: 0.516737
G1 X130.404 Y117.353 E.00516
; LINE_WIDTH: 0.48283
G1 X130.421 Y117.22 E.00479
; LINE_WIDTH: 0.433174
G1 X130.438 Y117.087 E.00425
G1 X130.438 Y116.407 E.02163
G1 X130.049 Y116.407 E.01237
G1 X130.049 Y117.087 E.02163
; LINE_WIDTH: 0.448924
G1 X130.032 Y117.154 E.00226
; LINE_WIDTH: 0.48283
G1 X130.015 Y117.22 E.00245
; LINE_WIDTH: 0.533558
G1 X129.998 Y117.286 E.00274
G1 X129.897 Y117.319 E.00427
G1 X129.897 Y125.882 E.34234
; WIPE_START
G1 F7337.397
G1 X129.897 Y123.882 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.43 Y129.413 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.44859
G1 F4234
M204 S6000
G1 X130.43 Y138.187 E.29006
; WIPE_START
G1 F8874.208
G1 X130.43 Y136.187 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.617 Y138.994 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.21023
G1 F4234
M204 S6000
G1 X124.617 Y140.594 E.02181
M204 S10000
G1 X124.617 Y128.606 F42000
G1 F4234
M204 S6000
G1 X124.617 Y126.994 E.02198
; CHANGE_LAYER
; Z_HEIGHT: 9.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.617 Y128.606 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 46/72
; update layer progress
M73 L46
M991 S0 P45 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z9.4 I.278 J1.185 P1  F42000
G1 X130.65 Y127.19 Z9.4
G1 Z9.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4179
M204 S5000
G1 X130.65 Y128.41 E.03749
G1 X124.95 Y128.41 E.17514
G1 X124.95 Y128.369 E.00126
G1 X124.95 Y127.231 E.03497
G1 X124.95 Y127.19 E.00126
G1 X130.59 Y127.19 E.1733
M204 S10000
G1 X130.65 Y126.391 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4179
M204 S6000
G1 X129.448 Y126.391 E.03987
G1 X129.448 Y117.066 E.30933
G1 X125.172 Y117.066 E.14184
G1 X125.172 Y116.009 E.03504
G1 X130.872 Y116.009 E.18908
G1 X130.872 Y126.391 E.34438
G1 X130.71 Y126.391 E.00538
M204 S10000
G1 X130.65 Y126.798 F42000
G1 F4179
M204 S6000
G1 X129.041 Y126.798 E.05338
G1 X129.041 Y117.473 E.30933
G1 X125.387 Y117.473 E.12121
G1 X125.387 Y126.798 E.30933
G1 X124.765 Y126.798 E.02062
G1 X124.765 Y115.602 E.37138
G1 X131.279 Y115.602 E.21609
G1 X131.279 Y126.798 E.37138
G1 X130.71 Y126.798 E.01889
; WIPE_START
G1 F8843.478
G1 X129.041 Y126.798 E-.63427
G1 X129.041 Y126.467 E-.12573
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.779 Y126.535 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4179
M204 S5000
G1 X125.779 Y117.865 E.2664
G1 X128.649 Y117.865 E.08819
G1 X128.649 Y126.535 E.2664
G1 X125.839 Y126.535 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.825 Y124.535 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P73 R4
G1 X127.654 Y131.945 Z9.6 F42000
G1 X129.278 Y138.527 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4179
M204 S6000
M73 P74 R4
G1 X125.93 Y138.527 E.11108
G1 X125.93 Y129.073 E.31361
G1 X129.67 Y129.073 E.12408
G1 X129.67 Y138.527 E.31361
G1 X129.338 Y138.527 E.01102
M204 S250
G1 X129.278 Y138.135 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4179
M204 S5000
G1 X126.322 Y138.135 E.09084
G1 X126.322 Y138.094 E.00126
G1 X126.322 Y129.506 E.26389
G1 X126.322 Y129.465 E.00126
G1 X129.278 Y129.465 E.09084
G1 X129.278 Y138.075 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.279 Y138.116 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.523 Y138.135 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4179
M204 S6000
G1 X125.523 Y138.391 E.00849
G1 X125.172 Y138.391 E.01163
G1 X125.172 Y129.209 E.30457
G1 X125.523 Y129.209 E.01163
G1 X125.523 Y138.075 E.2941
; WIPE_START
G1 F8843.478
G1 X125.523 Y138.391 E-.12003
G1 X125.172 Y138.391 E-.13321
G1 X125.172 Y137.057 E-.50676
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.077 Y138.391 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
G1 F4179
M204 S6000
G1 X130.077 Y129.209 E.30457
G1 X130.872 Y129.209 E.02637
G1 X130.872 Y138.391 E.30457
G1 X130.137 Y138.391 E.02438
; WIPE_START
G1 F8843.478
G1 X130.124 Y136.391 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.95 Y138.798 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
G1 F4179
M204 S6000
G1 X124.765 Y138.798 E.00614
G1 X124.765 Y128.802 E.33158
G1 X131.279 Y128.802 E.21609
G1 X131.279 Y138.798 E.33158
G1 X125.01 Y138.798 E.20796
M204 S250
G1 X124.95 Y139.19 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4179
M204 S5000
G1 X130.65 Y139.19 E.17514
G1 X130.65 Y140.41 E.03749
G1 X124.95 Y140.41 E.17514
G1 X124.95 Y140.369 E.00126
G1 X124.95 Y139.25 E.03438
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.95 Y139.229 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.129 Y131.641 Z9.6 F42000
G1 X124.373 Y115.408 Z9.6
G1 Z9.2
G1 E.8 F1800
G1 F4179
M204 S5000
G3 X124.565 Y115.21 I.199 J.001 E.00936
G1 X131.523 Y115.217 E.21379
G3 X131.671 Y115.41 I-.046 J.189 E.00809
G1 X131.665 Y140.647 E.77546
G3 X131.479 Y140.79 I-.195 J-.062 E.00765
G1 X124.577 Y140.79 E.21207
G3 X124.373 Y140.59 I-.002 J-.202 E.00976
G1 X124.373 Y115.468 E.77194
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.381 Y115.35 E-.0449
G1 X124.419 Y115.279 E-.03072
G1 X124.472 Y115.236 E-.02583
G1 X124.565 Y115.21 E-.0369
G1 X126.201 Y115.212 E-.62165
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


G1 X125.376 Y116.538 F42000
G1 Z9.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692369
G1 F4179
M204 S6000
G1 X129.651 Y116.538 E.22628
; WIPE_START
G1 F5543.166
G1 X127.651 Y116.538 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.076 Y117.269 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
; LINE_WIDTH: 0.25751
G1 F4179
M204 S6000
G1 X125.076 Y126.594 E.16306
M204 S10000
G1 X125.583 Y126.862 F42000
; LINE_WIDTH: 0.30586
G1 F4179
M204 S6000
G1 X128.845 Y126.862 E.06989
; WIPE_START
G1 F13691.336
G1 X126.845 Y126.862 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.906 Y125.933 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.55155
G1 F4179
M204 S6000
G1 X130.414 Y125.933 E.02108
G1 X130.414 Y117.494 E.34976
; LINE_WIDTH: 0.534595
G1 X130.431 Y117.359 E.00548
; LINE_WIDTH: 0.500685
G1 X130.448 Y117.223 E.0051
; LINE_WIDTH: 0.451056
G2 X130.465 Y116.416 I-8.779 J-.588 E.02685
G1 X130.058 Y116.416 E.01353
G1 X130.058 Y117.087 E.02232
; LINE_WIDTH: 0.466775
G1 X130.041 Y117.155 E.00241
; LINE_WIDTH: 0.500685
G1 X130.024 Y117.223 E.00261
; LINE_WIDTH: 0.551414
G1 X130.007 Y117.291 E.0029
G1 X129.906 Y117.325 E.00444
G1 X129.906 Y125.873 E.3542
; WIPE_START
G1 F7079.728
G1 X129.906 Y123.873 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.161 Y126.994 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.67226
G1 F4179
M204 S6000
G1 X131.161 Y128.606 E.08266
; WIPE_START
G1 F5720.279
G1 X131.161 Y126.994 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.475 Y129.413 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
; LINE_WIDTH: 0.43073
G1 F4179
M204 S6000
G1 X130.475 Y138.187 E.27729
; WIPE_START
G1 F9282.896
G1 X130.475 Y136.187 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.161 Y138.994 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
; LINE_WIDTH: 0.67226
G1 F4179
M204 S6000
G1 X131.161 Y140.594 E.08203
M204 S10000
G1 X124.661 Y140.594 F42000
; LINE_WIDTH: 0.22794
G1 F4179
M204 S6000
G1 X124.661 Y138.994 E.02412
M204 S10000
G1 X124.661 Y128.606 F42000
G1 F4179
M204 S6000
G1 X124.661 Y126.994 E.0243
; CHANGE_LAYER
; Z_HEIGHT: 9.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.661 Y128.606 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 47/72
; update layer progress
M73 L47
M991 S0 P46 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z9.6 I.278 J1.185 P1  F42000
G1 X130.703 Y127.19 Z9.6
G1 Z9.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4206
M204 S5000
G1 X130.703 Y128.41 E.03749
G1 X125.004 Y128.41 E.17514
G1 X125.004 Y128.369 E.00126
G1 X125.004 Y127.231 E.03497
G1 X125.004 Y127.19 E.00126
G1 X130.643 Y127.19 E.1733
M204 S10000
G1 X130.703 Y126.391 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4206
M204 S6000
G1 X129.448 Y126.391 E.04165
G1 X129.448 Y117.066 E.30933
G1 X125.208 Y117.066 E.14065
G1 X125.208 Y116.009 E.03505
G1 X130.908 Y116.009 E.18908
G1 X130.908 Y126.391 E.34438
G1 X130.763 Y126.391 E.00479
M204 S10000
G1 X130.703 Y126.798 F42000
G1 F4206
M204 S6000
G1 X129.041 Y126.798 E.05516
G1 X129.041 Y117.473 E.30933
G1 X125.387 Y117.473 E.12121
G1 X125.387 Y126.798 E.30933
G1 X124.801 Y126.798 E.01943
G1 X124.801 Y115.602 E.37138
G1 X131.315 Y115.602 E.21608
G1 X131.315 Y126.798 E.37138
G1 X130.763 Y126.798 E.01829
; WIPE_START
G1 F8843.478
G1 X129.041 Y126.798 E-.65463
G1 X129.041 Y126.521 E-.10537
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.779 Y126.535 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4206
M204 S5000
G1 X125.779 Y117.865 E.2664
G1 X128.649 Y117.865 E.08819
G1 X128.649 Y126.535 E.2664
G1 X125.839 Y126.535 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.825 Y124.535 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.928 Y131.872 Z9.8 F42000
M73 P75 R4
G1 X129.724 Y138.135 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4206
M204 S6000
G1 X129.724 Y138.527 E.01301
G1 X125.983 Y138.527 E.12408
G1 X125.983 Y129.073 E.31361
G1 X129.724 Y129.073 E.12408
G1 X129.724 Y138.075 E.29861
M204 S250
G1 X129.332 Y138.135 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4206
M204 S5000
G1 X126.375 Y138.135 E.09084
G1 X126.375 Y138.094 E.00126
G1 X126.375 Y129.506 E.26389
G1 X126.375 Y129.465 E.00126
G1 X129.332 Y129.465 E.09084
G1 X129.332 Y138.075 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.332 Y138.116 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.576 Y138.135 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4206
M204 S6000
G1 X125.576 Y138.391 E.00849
G1 X125.208 Y138.391 E.01222
G1 X125.208 Y129.209 E.30457
G1 X125.576 Y129.209 E.01222
G1 X125.576 Y138.075 E.2941
; WIPE_START
G1 F8843.478
G1 X125.576 Y138.391 E-.12003
G1 X125.208 Y138.391 E-.13994
G1 X125.208 Y137.075 E-.50003
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.131 Y138.391 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
G1 F4206
M204 S6000
G1 X130.131 Y129.209 E.30457
G1 X130.908 Y129.209 E.02577
G1 X130.908 Y138.391 E.30457
G1 X130.191 Y138.391 E.02378
; WIPE_START
G1 F8843.478
G1 X130.178 Y136.391 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.004 Y138.798 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
G1 F4206
M204 S6000
G1 X124.801 Y138.798 E.00673
G1 X124.801 Y128.802 E.33158
G1 X131.315 Y128.802 E.21608
G1 X131.315 Y138.798 E.33158
G1 X125.064 Y138.798 E.20737
M204 S250
G1 X125.004 Y139.19 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4206
M204 S5000
G1 X130.703 Y139.19 E.17514
G1 X130.703 Y140.41 E.03749
G1 X125.004 Y140.41 E.17514
G1 X125.004 Y140.369 E.00126
G1 X125.004 Y139.25 E.03438
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.003 Y139.229 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.177 Y131.641 Z9.8 F42000
G1 X124.409 Y115.408 Z9.8
G1 Z9.4
G1 E.8 F1800
G1 F4206
M204 S5000
G3 X124.601 Y115.21 I.202 J.004 E.00933
G1 X131.54 Y115.212 E.21321
G1 X131.553 Y115.215 E.00039
G3 X131.707 Y115.41 I-.041 J.191 E.0083
G1 X131.7 Y140.647 E.77546
G3 X131.515 Y140.79 I-.195 J-.062 E.00764
G1 X124.613 Y140.79 E.21209
G3 X124.409 Y140.59 I-.002 J-.202 E.00976
G1 X124.409 Y115.468 E.77194
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.425 Y115.325 E-.05438
G1 X124.462 Y115.271 E-.02494
G1 X124.537 Y115.222 E-.03407
G1 X124.601 Y115.21 E-.02479
G1 X126.238 Y115.211 E-.62182
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


G1 X125.411 Y116.538 F42000
G1 Z9.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692378
G1 F4206
M204 S6000
G1 X129.651 Y116.538 E.22438
; WIPE_START
G1 F5543.087
G1 X127.651 Y116.538 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.094 Y117.269 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
; LINE_WIDTH: 0.22162
G1 F4206
M204 S6000
G1 X125.094 Y126.594 E.13579
M204 S10000
G1 X124.706 Y126.994 F42000
; LINE_WIDTH: 0.24564
G1 F4206
M204 S6000
G1 X124.706 Y128.606 E.02663
; WIPE_START
G1 F15000
G1 X124.706 Y126.994 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.583 Y126.862 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
; LINE_WIDTH: 0.30586
G1 F4206
M204 S6000
G1 X128.845 Y126.862 E.06989
; WIPE_START
G1 F13691.336
G1 X126.845 Y126.862 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.915 Y125.924 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.56941
G1 F4206
M204 S6000
G1 X130.441 Y125.924 E.02259
G1 X130.441 Y117.503 E.36128
; LINE_WIDTH: 0.552457
G1 X130.458 Y117.365 E.0058
; LINE_WIDTH: 0.51855
G1 X130.475 Y117.226 E.00541
; LINE_WIDTH: 0.46895
G2 X130.492 Y116.425 I-8.578 J-.582 E.02782
G1 X130.067 Y116.425 E.01475
G1 X130.067 Y117.087 E.02299
; LINE_WIDTH: 0.484644
G1 X130.05 Y117.157 E.00257
; LINE_WIDTH: 0.51855
G1 X130.033 Y117.226 E.00276
; LINE_WIDTH: 0.569272
G1 X130.016 Y117.295 E.00306
G1 X129.915 Y117.33 E.00461
G1 X129.915 Y125.864 E.36603
; WIPE_START
G1 F6839.54
G1 X129.915 Y123.864 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.205 Y126.994 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.65439
G1 F4206
M204 S6000
G1 X131.205 Y128.606 E.08032
; WIPE_START
G1 F5887.452
G1 X131.205 Y126.994 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.519 Y129.413 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
; LINE_WIDTH: 0.41286
G1 F4206
M204 S6000
G1 X130.519 Y138.187 E.26452
; WIPE_START
G1 F9731.308
G1 X130.519 Y136.187 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.205 Y138.994 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
; LINE_WIDTH: 0.65439
G1 F4206
M204 S6000
G1 X131.205 Y140.594 E.0797
M204 S10000
G1 X124.706 Y140.594 F42000
; LINE_WIDTH: 0.24564
G1 F4206
M204 S6000
G1 X124.706 Y138.994 E.02643
; CHANGE_LAYER
; Z_HEIGHT: 9.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15000
G1 X124.706 Y140.594 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 48/72
; update layer progress
M73 L48
M991 S0 P47 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z9.8 I1.109 J.501 P1  F42000
G1 X130.757 Y127.19 Z9.8
G1 Z9.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4299
M204 S5000
G1 X130.757 Y128.41 E.03749
G1 X125.057 Y128.41 E.17514
G1 X125.057 Y128.369 E.00126
G1 X125.057 Y127.231 E.03497
G1 X125.057 Y127.19 E.00126
G1 X130.697 Y127.19 E.1733
M204 S10000
G1 X130.757 Y126.391 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4299
M204 S6000
G1 X129.448 Y126.391 E.04343
G1 X129.448 Y117.066 E.30933
G1 X125.244 Y117.066 E.13946
G1 X125.244 Y116.009 E.03505
G1 X130.944 Y116.009 E.18907
G1 X130.944 Y126.391 E.34438
G1 X130.817 Y126.391 E.0042
M204 S10000
G1 X130.757 Y126.798 F42000
G1 F4299
M204 S6000
G1 X129.041 Y126.798 E.05693
G1 X129.041 Y117.473 E.30933
G1 X125.387 Y117.473 E.12121
G1 X125.387 Y126.798 E.30933
G1 X124.837 Y126.798 E.01824
G1 X124.837 Y115.602 E.37138
G1 X131.351 Y115.602 E.21608
G1 X131.351 Y126.798 E.37139
G1 X130.817 Y126.798 E.0177
; WIPE_START
G1 F8843.478
G1 X129.041 Y126.798 E-.675
G1 X129.041 Y126.574 E-.085
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.779 Y126.535 Z10 F42000
G1 Z9.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4299
M204 S5000
G1 X125.779 Y117.865 E.2664
G1 X128.649 Y117.865 E.08819
G1 X128.649 Y126.535 E.2664
G1 X125.839 Y126.535 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.825 Y124.535 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.707 Y131.932 Z10 F42000
G1 X129.385 Y138.527 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4299
M204 S6000
G1 X126.037 Y138.527 E.11107
G1 X126.037 Y129.073 E.31361
G1 X129.777 Y129.073 E.12408
G1 X129.777 Y138.527 E.31361
G1 X129.445 Y138.527 E.01102
M204 S250
G1 X129.385 Y138.135 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4299
M204 S5000
G1 X126.429 Y138.135 E.09084
G1 X126.429 Y138.094 E.00126
G1 X126.429 Y129.506 E.26389
G1 X126.429 Y129.465 E.00126
G1 X129.385 Y129.465 E.09084
G1 X129.385 Y138.075 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.386 Y138.116 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.63 Y138.135 Z10 F42000
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4299
M204 S6000
G1 X125.63 Y138.391 E.00849
G1 X125.244 Y138.391 E.0128
G1 X125.244 Y129.209 E.30457
G1 X125.63 Y129.209 E.0128
G1 X125.63 Y138.075 E.2941
; WIPE_START
G1 F8843.478
G1 X125.63 Y138.391 E-.12003
G1 X125.244 Y138.391 E-.14666
G1 X125.244 Y137.093 E-.4933
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.184 Y138.391 Z10 F42000
G1 Z9.6
G1 E.8 F1800
G1 F4299
M204 S6000
G1 X130.184 Y129.209 E.30457
M73 P76 R4
G1 X130.944 Y129.209 E.02518
G1 X130.944 Y138.391 E.30457
G1 X130.244 Y138.391 E.02319
; WIPE_START
G1 F8843.478
G1 X130.231 Y136.391 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.057 Y138.798 Z10 F42000
G1 Z9.6
G1 E.8 F1800
G1 F4299
M204 S6000
G1 X124.837 Y138.798 E.00731
G1 X124.837 Y128.802 E.33158
G1 X131.351 Y128.802 E.21608
G1 X131.351 Y138.798 E.33158
G1 X125.117 Y138.798 E.20678
M204 S250
G1 X125.057 Y139.19 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4299
M204 S5000
G1 X130.757 Y139.19 E.17514
G1 X130.757 Y140.41 E.03749
G1 X125.057 Y140.41 E.17514
G1 X125.057 Y140.369 E.00126
G1 X125.057 Y139.25 E.03438
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.057 Y139.229 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.225 Y131.642 Z10 F42000
G1 X124.445 Y115.408 Z10
G1 Z9.6
G1 E.8 F1800
G1 F4299
M204 S5000
G3 X124.637 Y115.21 I.199 J.002 E.00936
G1 X131.576 Y115.212 E.21321
G1 X131.588 Y115.215 E.00038
G3 X131.743 Y115.41 I-.041 J.191 E.0083
G1 X131.736 Y140.647 E.77546
G3 X131.553 Y140.79 I-.195 J-.062 E.00758
G1 X124.649 Y140.79 E.21214
G3 X124.445 Y140.59 I-.002 J-.202 E.00976
G1 X124.445 Y115.468 E.77194
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.452 Y115.352 E-.04406
G1 X124.491 Y115.279 E-.03151
G1 X124.544 Y115.236 E-.02591
G1 X124.637 Y115.21 E-.03689
G1 X126.273 Y115.211 E-.62164
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


G1 X125.447 Y116.538 F42000
G1 Z9.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.6924
G1 F4299
M204 S6000
G1 X129.651 Y116.538 E.22249
; WIPE_START
G1 F5542.895
G1 X127.651 Y116.538 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.112 Y117.269 Z10 F42000
G1 Z9.6
G1 E.8 F1800
; LINE_WIDTH: 0.18574
G1 F4299
M204 S6000
G1 X125.112 Y126.594 E.10852
M204 S10000
G1 X124.751 Y126.994 F42000
; LINE_WIDTH: 0.26335
G1 F4299
M204 S6000
G1 X124.751 Y128.606 E.02895
; WIPE_START
G1 F15000
G1 X124.751 Y126.994 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.583 Y126.862 Z10 F42000
G1 Z9.6
G1 E.8 F1800
; LINE_WIDTH: 0.30586
G1 F4299
M204 S6000
G1 X128.845 Y126.862 E.06989
; WIPE_START
G1 F13691.336
G1 X126.845 Y126.862 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.84 Y125.999 Z10 F42000
G1 Z9.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F4299
M204 S6000
G1 X130.552 Y125.999 E.02187
G1 X130.552 Y117.782 E.25248
; LINE_WIDTH: 0.441965
G1 X130.53 Y117.65 E.00434
; LINE_WIDTH: 0.485915
G1 X130.508 Y117.518 E.00482
; LINE_WIDTH: 0.520418
G1 X130.486 Y117.387 E.0052
G1 X130.519 Y116.655 E.02849
; LINE_WIDTH: 0.491904
G1 X130.519 Y116.434 E.0081
G1 X130.076 Y116.434 E.0162
G1 X130.076 Y117.087 E.0239
G1 X130.008 Y117.278 E.00742
G1 X129.896 Y117.318 E.00434
; LINE_WIDTH: 0.514082
G1 X129.878 Y117.472 E.00598
; LINE_WIDTH: 0.476445
G1 X129.859 Y117.627 E.0055
; LINE_WIDTH: 0.420343
G1 X129.84 Y117.782 E.00479
G1 X129.84 Y125.939 E.25087
M204 S10000
G1 X130.196 Y125.643 F42000
; LINE_WIDTH: 0.37748
G1 F4299
M204 S6000
G1 X130.196 Y117.842 E.21268
; WIPE_START
G1 F10760.402
G1 X130.196 Y119.842 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.25 Y126.994 Z10 F42000
G1 Z9.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.63652
G1 F4299
M204 S6000
G1 X131.25 Y128.606 E.07797
; WIPE_START
G1 F6064.69
G1 X131.25 Y126.994 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.564 Y129.413 Z10 F42000
G1 Z9.6
G1 E.8 F1800
; LINE_WIDTH: 0.39499
G1 F4299
M204 S6000
G1 X130.564 Y138.187 E.25174
; WIPE_START
G1 F10225.238
G1 X130.564 Y136.187 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.25 Y138.994 Z10 F42000
G1 Z9.6
G1 E.8 F1800
; LINE_WIDTH: 0.63652
G1 F4299
M204 S6000
G1 X131.25 Y140.594 E.07737
M204 S10000
G1 X124.751 Y140.594 F42000
; LINE_WIDTH: 0.26335
G1 F4299
M204 S6000
G1 X124.751 Y138.994 E.02874
; CHANGE_LAYER
; Z_HEIGHT: 9.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.751 Y140.594 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 49/72
; update layer progress
M73 L49
M991 S0 P48 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z10 I1.109 J.501 P1  F42000
G1 X130.811 Y127.19 Z10
G1 Z9.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4302
M204 S5000
G1 X130.811 Y128.41 E.03749
G1 X125.111 Y128.41 E.17514
G1 X125.111 Y128.369 E.00126
G1 X125.111 Y127.231 E.03497
G1 X125.111 Y127.19 E.00126
G1 X130.751 Y127.19 E.1733
M204 S10000
G1 X130.811 Y126.391 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4302
M204 S6000
G1 X129.448 Y126.391 E.04521
G1 X129.448 Y117.066 E.30933
G1 X125.28 Y117.066 E.13827
G1 X125.28 Y116.009 E.03505
G1 X130.981 Y116.009 E.18913
G1 X130.981 Y126.391 E.34438
G1 X130.871 Y126.391 E.00367
M204 S10000
G1 X130.811 Y126.798 F42000
G1 F4302
M204 S6000
G1 X129.041 Y126.798 E.05871
G1 X129.041 Y117.473 E.30933
G1 X125.387 Y117.473 E.12121
G1 X125.387 Y126.798 E.30933
G1 X124.873 Y126.798 E.01705
G1 X124.873 Y115.602 E.37138
G1 X131.388 Y115.602 E.21614
G1 X131.388 Y126.798 E.37139
G1 X130.871 Y126.798 E.01717
; WIPE_START
G1 F8843.478
G1 X129.041 Y126.798 E-.69536
G1 X129.041 Y126.628 E-.06464
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.779 Y126.535 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4302
M204 S5000
G1 X125.779 Y117.865 E.2664
G1 X128.649 Y117.865 E.08819
G1 X128.649 Y126.535 E.2664
G1 X125.839 Y126.535 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.825 Y124.535 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.982 Y131.856 Z10.2 F42000
G1 X129.831 Y138.135 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4302
M204 S6000
G1 X129.831 Y138.527 E.01301
G1 X126.09 Y138.527 E.12408
G1 X126.09 Y129.073 E.31361
G1 X129.831 Y129.073 E.12408
G1 X129.831 Y138.075 E.29861
M204 S250
G1 X129.439 Y138.135 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4302
M204 S5000
G1 X126.482 Y138.135 E.09084
G1 X126.482 Y138.094 E.00126
G1 X126.482 Y129.506 E.26389
G1 X126.482 Y129.465 E.00126
G1 X129.439 Y129.465 E.09084
G1 X129.439 Y138.075 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.439 Y138.116 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.683 Y138.135 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4302
M204 S6000
G1 X125.683 Y138.391 E.00849
G1 X125.28 Y138.391 E.01339
G1 X125.28 Y129.209 E.30457
G1 X125.683 Y129.209 E.01339
G1 X125.683 Y138.075 E.2941
; WIPE_START
G1 F8843.478
G1 X125.683 Y138.391 E-.12003
G1 X125.28 Y138.391 E-.15339
G1 X125.28 Y137.11 E-.48657
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.238 Y138.391 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
G1 F4302
M204 S6000
G1 X130.238 Y129.209 E.30457
G1 X130.981 Y129.209 E.02465
G1 X130.981 Y138.391 E.30457
G1 X130.298 Y138.391 E.02266
; WIPE_START
G1 F8843.478
G1 X130.285 Y136.391 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.111 Y138.798 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
G1 F4302
M204 S6000
G1 X124.873 Y138.798 E.0079
G1 X124.873 Y128.802 E.33158
G1 X131.388 Y128.802 E.21614
G1 X131.388 Y138.798 E.33158
G1 X125.171 Y138.798 E.20625
M204 S250
G1 X125.111 Y139.19 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4302
M204 S5000
G1 X130.811 Y139.19 E.17514
G1 X130.811 Y140.41 E.03749
G1 X125.111 Y140.41 E.17514
G1 X125.111 Y140.369 E.00126
G1 X125.111 Y139.25 E.03438
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.111 Y139.229 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.277 Y131.642 Z10.2 F42000
G1 X124.487 Y115.353 Z10.2
G1 Z9.8
G1 E.8 F1800
G1 F4302
M204 S5000
G3 X124.673 Y115.21 I.198 J.066 E.00765
G1 X131.612 Y115.213 E.21321
G1 X131.624 Y115.215 E.00037
G3 X131.78 Y115.41 I-.041 J.193 E.00833
M73 P77 R4
G1 X131.774 Y140.647 E.77546
G3 X131.586 Y140.79 I-.195 J-.062 E.00772
G1 X124.685 Y140.79 E.21206
G3 X124.481 Y140.59 I-.002 J-.202 E.00976
G1 X124.487 Y115.413 E.77362
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.551 Y115.255 E-.06484
G1 X124.673 Y115.21 E-.04932
G1 X126.373 Y115.211 E-.64584
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


G1 X125.483 Y116.538 F42000
G1 Z9.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692412
G1 F4302
M204 S6000
G1 X129.651 Y116.538 E.2206
; WIPE_START
G1 F5542.796
G1 X127.651 Y116.538 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.13 Y117.269 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
; LINE_WIDTH: 0.14986
G1 F4302
M204 S6000
G1 X125.13 Y126.594 E.08126
M204 S10000
G1 X124.796 Y126.994 F42000
; LINE_WIDTH: 0.28106
G1 F4302
M204 S6000
G1 X124.796 Y128.606 E.03128
; WIPE_START
G1 F15000
G1 X124.796 Y126.994 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.583 Y126.862 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
; LINE_WIDTH: 0.30586
G1 F4302
M204 S6000
G1 X128.845 Y126.862 E.06989
; WIPE_START
G1 F13691.336
G1 X126.845 Y126.862 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.84 Y125.999 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F4302
M204 S6000
G1 X130.589 Y125.999 E.02302
G1 X130.589 Y117.72 E.25439
; LINE_WIDTH: 0.442022
G1 X130.567 Y117.589 E.00432
; LINE_WIDTH: 0.486085
G1 X130.545 Y117.458 E.00479
; LINE_WIDTH: 0.515668
G1 X130.523 Y117.327 E.00511
G2 X130.547 Y116.443 I-12.05 J-.768 E.03406
G1 X130.086 Y116.443 E.01778
G1 X130.086 Y117.087 E.02481
G1 X130.062 Y117.207 E.00471
G1 X129.886 Y117.311 E.00785
; LINE_WIDTH: 0.489403
G1 X129.863 Y117.515 E.00748
; LINE_WIDTH: 0.420555
G1 X129.84 Y117.72 E.00633
G1 X129.84 Y125.939 E.25292
M204 S10000
G1 X130.215 Y125.624 F42000
; LINE_WIDTH: 0.41512
G1 F4302
M204 S6000
G1 X130.215 Y117.78 E.23792
; WIPE_START
G1 F9672.219
G1 X130.215 Y119.78 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.296 Y126.994 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.62057
G1 F4302
M204 S6000
G1 X131.296 Y128.606 E.07587
; WIPE_START
G1 F6232.148
G1 X131.296 Y126.994 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.61 Y129.413 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
; LINE_WIDTH: 0.37904
G1 F4302
M204 S6000
G1 X130.61 Y138.187 E.24033
; WIPE_START
G1 F10710.461
G1 X130.61 Y136.187 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.296 Y138.994 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
; LINE_WIDTH: 0.62057
G1 F4302
M204 S6000
G1 X131.296 Y140.594 E.07529
M204 S10000
G1 X124.796 Y140.594 F42000
; LINE_WIDTH: 0.28106
G1 F4302
M204 S6000
G1 X124.796 Y138.994 E.03105
; CHANGE_LAYER
; Z_HEIGHT: 10
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.796 Y140.594 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 50/72
; update layer progress
M73 L50
M991 S0 P49 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z10.2 I1.109 J.502 P1  F42000
G1 X130.864 Y127.19 Z10.2
G1 Z10
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4365
M204 S5000
G1 X130.864 Y128.41 E.03749
G1 X125.164 Y128.41 E.17514
G1 X125.164 Y128.369 E.00126
G1 X125.164 Y127.231 E.03497
G1 X125.164 Y127.19 E.00126
G1 X130.804 Y127.19 E.1733
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.864 Y128.41 E-.46416
G1 X130.086 Y128.41 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.779 Y126.535 Z10.4 F42000
G1 Z10
G1 E.8 F1800
G1 F4365
M204 S5000
G1 X125.779 Y117.865 E.2664
G1 X128.649 Y117.865 E.08819
G1 X128.649 Y126.535 E.2664
G1 X125.839 Y126.535 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.825 Y124.535 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.37 Y116.916 Z10.4 F42000
G1 X125.316 Y116.009 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4365
M204 S6000
G1 X131.027 Y116.009 E.18944
G1 X131.027 Y126.391 E.34437
G1 X129.448 Y126.391 E.05237
G1 X129.448 Y117.066 E.30933
G1 X125.316 Y117.066 E.13707
G1 X125.316 Y116.069 E.03305
M204 S10000
G1 X124.909 Y115.602 F42000
G1 F4365
M204 S6000
G1 X131.434 Y115.602 E.21645
G1 X131.434 Y126.798 E.37137
G1 X129.041 Y126.798 E.07937
G1 X129.041 Y117.473 E.30933
G1 X125.387 Y117.473 E.12121
G1 X125.387 Y126.798 E.30933
G1 X124.909 Y126.798 E.01586
G1 X124.909 Y115.662 E.36939
; WIPE_START
G1 F8843.478
G1 X126.908 Y115.644 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.765 Y123.228 Z10.4 F42000
G1 X129.492 Y138.527 Z10.4
G1 Z10
G1 E.8 F1800
G1 F4365
M204 S6000
G1 X126.144 Y138.527 E.11107
G1 X126.144 Y129.073 E.31361
G1 X129.885 Y129.073 E.12408
G1 X129.885 Y138.527 E.31361
G1 X129.552 Y138.527 E.01102
M204 S250
G1 X129.493 Y138.135 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4365
M204 S5000
G1 X126.536 Y138.135 E.09084
G1 X126.536 Y138.094 E.00126
G1 X126.536 Y129.506 E.26389
G1 X126.536 Y129.465 E.00126
G1 X129.493 Y129.465 E.09084
G1 X129.493 Y138.075 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.493 Y138.116 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.737 Y138.135 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4365
M204 S6000
G1 X125.737 Y138.391 E.00849
G1 X125.316 Y138.391 E.01398
G1 X125.316 Y129.209 E.30457
G1 X125.737 Y129.209 E.01398
G1 X125.737 Y138.075 E.2941
; WIPE_START
G1 F8843.478
G1 X125.737 Y138.391 E-.12003
G1 X125.316 Y138.391 E-.16012
G1 X125.316 Y137.128 E-.47985
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.292 Y138.391 Z10.4 F42000
G1 Z10
G1 E.8 F1800
G1 F4365
M204 S6000
G1 X130.292 Y129.209 E.30457
G1 X131.027 Y129.209 E.02438
G1 X131.027 Y138.391 E.30457
G1 X130.352 Y138.391 E.02239
; WIPE_START
G1 F8843.478
G1 X130.339 Y136.391 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.164 Y138.798 Z10.4 F42000
G1 Z10
G1 E.8 F1800
G1 F4365
M204 S6000
G1 X124.909 Y138.798 E.00849
G1 X124.909 Y128.802 E.33158
G1 X131.434 Y128.802 E.21645
G1 X131.434 Y138.798 E.33158
G1 X125.224 Y138.798 E.20597
M204 S250
G1 X125.164 Y139.19 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4365
M204 S5000
G1 X130.864 Y139.19 E.17514
G1 X130.864 Y140.41 E.03749
G1 X125.164 Y140.41 E.17514
G1 X125.164 Y140.369 E.00126
G1 X125.164 Y139.25 E.03438
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.164 Y139.229 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.33 Y131.642 Z10.4 F42000
G1 X124.535 Y115.327 Z10.4
G1 Z10
G1 E.8 F1800
G1 F4365
M204 S5000
G3 X124.709 Y115.21 I.183 J.085 E.00675
G1 X131.629 Y115.21 E.21262
G3 X131.805 Y115.32 I-.015 J.221 E.00664
G1 X131.821 Y115.366 E.00149
G1 X131.826 Y139.992 E.75669
G3 X131.823 Y140.63 I-4.117 J.3 E.01962
G1 X131.803 Y140.684 E.00179
G1 X131.791 Y140.706 E.00077
G3 X131.63 Y140.79 I-.174 J-.14 E.00573
G1 X124.721 Y140.79 E.2123
G3 X124.516 Y140.59 I-.002 J-.202 E.00976
G1 X124.516 Y115.408 E.77378
G3 X124.518 Y115.385 I.202 J.004 E.00071
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.57 Y115.271 E-.04736
G1 X124.645 Y115.222 E-.03407
G1 X124.709 Y115.21 E-.02474
G1 X126.43 Y115.21 E-.65383
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


G1 X125.519 Y116.538 F42000
G1 Z10
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692256
G1 F4365
M204 S6000
G1 X129.651 Y116.538 E.21864
; WIPE_START
M73 P78 R4
G1 F5544.125
G1 X127.651 Y116.538 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.148 Y117.269 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.11397
G1 F4365
M204 S6000
G1 X125.148 Y126.594 E.05399
M204 S10000
G1 X124.84 Y126.994 F42000
; LINE_WIDTH: 0.29876
G1 F4365
M204 S6000
G1 X124.84 Y128.606 E.0336
; WIPE_START
G1 F14071.294
G1 X124.84 Y126.994 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.583 Y126.862 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.30586
G1 F4365
M204 S6000
G1 X128.845 Y126.862 E.06989
; WIPE_START
G1 F13691.336
G1 X126.845 Y126.862 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.84 Y125.999 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F4365
M204 S6000
G1 X130.634 Y125.999 E.02441
G1 X130.634 Y117.642 E.25678
; LINE_WIDTH: 0.442085
G1 X130.612 Y117.512 E.00429
; LINE_WIDTH: 0.486275
G1 X130.59 Y117.382 E.00476
; LINE_WIDTH: 0.531055
G1 X130.568 Y117.252 E.00524
G2 X130.581 Y116.455 I-17.292 J-.676 E.0317
G1 X130.097 Y116.455 E.01926
G1 X130.084 Y117.17 E.02843
; LINE_WIDTH: 0.533835
G1 X130.04 Y117.211 E.0024
; LINE_WIDTH: 0.483381
G3 X129.869 Y117.3 I-.191 J-.158 E.00712
; LINE_WIDTH: 0.463243
G1 X129.854 Y117.471 E.00588
; LINE_WIDTH: 0.420283
G1 X129.84 Y117.642 E.00528
G1 X129.84 Y125.939 E.25514
M204 S10000
G1 X130.237 Y125.602 F42000
; LINE_WIDTH: 0.4604
G1 F4365
M204 S6000
G1 X130.237 Y117.702 E.26874
; WIPE_START
G1 F8623.167
G1 X130.237 Y119.702 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.345 Y126.994 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.61225
G1 F4365
M204 S6000
G1 X131.345 Y128.606 E.07478
; WIPE_START
G1 F6323.222
G1 X131.345 Y126.994 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.659 Y129.413 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.37072
G1 F4365
M204 S6000
G1 X130.659 Y138.187 E.23438
; WIPE_START
G1 F10982.305
G1 X130.659 Y136.187 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.345 Y138.994 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.61225
G1 F4365
M204 S6000
G1 X131.345 Y140.594 E.07421
M204 S10000
G1 X124.84 Y140.594 F42000
; LINE_WIDTH: 0.29876
G1 F4365
M204 S6000
G1 X124.84 Y138.994 E.03335
; CHANGE_LAYER
; Z_HEIGHT: 10.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F14071.294
G1 X124.84 Y140.594 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 51/72
; update layer progress
M73 L51
M991 S0 P50 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z10.4 I1.108 J.503 P1  F42000
G1 X130.918 Y127.19 Z10.4
G1 Z10.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4201
M204 S5000
G1 X130.918 Y128.41 E.03749
G1 X125.218 Y128.41 E.17514
G1 X125.218 Y128.369 E.00126
G1 X125.218 Y127.231 E.03497
G1 X125.218 Y127.19 E.00126
G1 X130.858 Y127.19 E.1733
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.918 Y128.41 E-.46416
G1 X130.139 Y128.41 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.779 Y126.535 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
G1 F4201
M204 S5000
G1 X125.779 Y117.865 E.2664
G1 X128.649 Y117.865 E.08819
G1 X128.649 Y126.535 E.2664
G1 X125.839 Y126.535 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.825 Y124.535 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.402 Y116.914 Z10.6 F42000
G1 X125.351 Y116.009 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4201
M204 S6000
G1 X131.072 Y116.009 E.18975
G1 X131.072 Y126.391 E.34437
G1 X129.448 Y126.391 E.05387
G1 X129.448 Y117.066 E.30933
G1 X125.351 Y117.066 E.13588
G1 X125.351 Y116.069 E.03305
M204 S10000
G1 X124.944 Y115.602 F42000
G1 F4201
M204 S6000
G1 X131.479 Y115.602 E.21676
G1 X131.479 Y126.798 E.37138
G1 X129.041 Y126.798 E.08088
G1 X129.041 Y117.473 E.30933
G1 X125.387 Y117.473 E.12121
G1 X125.387 Y126.798 E.30933
G1 X124.944 Y126.798 E.01467
G1 X124.944 Y115.662 E.36939
; WIPE_START
G1 F8843.478
G1 X126.944 Y115.644 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.951 Y123.21 Z10.6 F42000
G1 X129.938 Y138.135 Z10.6
G1 Z10.2
G1 E.8 F1800
G1 F4201
M204 S6000
G1 X129.938 Y138.527 E.01301
G1 X126.198 Y138.527 E.12408
G1 X126.198 Y129.073 E.31361
G1 X129.938 Y129.073 E.12408
G1 X129.938 Y138.075 E.29861
M204 S250
G1 X129.546 Y138.135 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4201
M204 S5000
G1 X126.59 Y138.135 E.09084
G1 X126.59 Y138.094 E.00126
G1 X126.59 Y129.506 E.26389
G1 X126.59 Y129.465 E.00126
G1 X129.546 Y129.465 E.09084
G1 X129.546 Y138.075 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.547 Y138.116 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.791 Y138.135 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4201
M204 S6000
G1 X125.791 Y138.391 E.00849
G1 X125.351 Y138.391 E.01457
G1 X125.351 Y129.209 E.30457
G1 X125.791 Y129.209 E.01457
G1 X125.791 Y138.075 E.2941
; WIPE_START
G1 F8843.478
G1 X125.791 Y138.391 E-.12003
G1 X125.351 Y138.391 E-.16685
G1 X125.351 Y137.146 E-.47312
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.345 Y138.391 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
G1 F4201
M204 S6000
G1 X130.345 Y129.209 E.30457
G1 X131.072 Y129.209 E.0241
G1 X131.072 Y138.391 E.30457
G1 X130.405 Y138.391 E.02211
; WIPE_START
G1 F8843.478
G1 X130.392 Y136.391 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.218 Y138.798 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
G1 F4201
M204 S6000
G1 X124.944 Y138.798 E.00907
G1 X124.944 Y128.802 E.33158
G1 X131.479 Y128.802 E.21676
G1 X131.479 Y138.798 E.33158
G1 X125.278 Y138.798 E.2057
M204 S250
G1 X125.218 Y139.19 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4201
M204 S5000
G1 X130.918 Y139.19 E.17514
G1 X130.918 Y140.41 E.03749
G1 X125.218 Y140.41 E.17514
G1 X125.218 Y140.369 E.00126
G1 X125.218 Y139.25 E.03438
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.218 Y139.229 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.378 Y131.643 Z10.6 F42000
G1 X124.571 Y115.326 Z10.6
G1 Z10.2
G1 E.8 F1800
G1 F4201
M204 S5000
G3 X124.745 Y115.21 I.183 J.085 E.00675
G1 X131.672 Y115.21 E.21286
G3 X131.85 Y115.32 I-.014 J.221 E.00669
G1 X131.867 Y115.366 E.00149
G1 X131.871 Y139.993 E.75674
G3 X131.869 Y140.621 I-5.044 J.3 E.01928
G3 X131.848 Y140.685 I-.218 J-.035 E.00209
G1 X131.836 Y140.706 E.00074
G3 X131.678 Y140.79 I-.176 J-.141 E.00567
G1 X124.756 Y140.79 E.21267
G3 X124.552 Y140.59 I-.002 J-.202 E.00976
G1 X124.552 Y115.408 E.77378
G3 X124.554 Y115.384 I.202 J.004 E.00072
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.605 Y115.271 E-.04726
G1 X124.681 Y115.222 E-.03409
G1 X124.745 Y115.21 E-.02481
G1 X126.466 Y115.21 E-.65385
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


G1 X125.555 Y116.538 F42000
G1 Z10.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692277
G1 F4201
M204 S6000
G1 X129.651 Y116.538 E.21675
M204 S10000
G1 X129.84 Y125.999 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F4201
M204 S6000
G1 X130.68 Y125.999 E.0258
G1 X130.68 Y117.561 E.25927
; LINE_WIDTH: 0.441599
G1 X130.658 Y117.403 E.00517
; LINE_WIDTH: 0.484815
G1 X130.637 Y117.245 E.00573
; LINE_WIDTH: 0.547928
G3 X130.615 Y116.466 I6.145 J-.56 E.03208
G1 X130.108 Y116.466 E.02085
G3 X130.106 Y117.132 I-7.639 J.311 E.02738
; LINE_WIDTH: 0.533067
G1 X130.022 Y117.182 E.0039
; LINE_WIDTH: 0.49226
G1 X129.939 Y117.232 E.00357
; LINE_WIDTH: 0.451454
G1 X129.855 Y117.281 E.00325
; LINE_WIDTH: 0.420169
G1 X129.84 Y117.561 E.00859
G1 X129.84 Y125.939 E.25755
M204 S10000
M73 P79 R4
G1 X130.26 Y125.579 F42000
; LINE_WIDTH: 0.50566
G1 F4201
M204 S6000
G1 X130.26 Y117.621 E.30009
; WIPE_START
G1 F7779.747
G1 X130.26 Y119.621 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.845 Y126.862 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.30586
G1 F4201
M204 S6000
G1 X125.583 Y126.862 E.06989
M204 S10000
G1 X124.885 Y126.994 F42000
; LINE_WIDTH: 0.31647
G1 F4201
M204 S6000
G1 X124.885 Y128.606 E.03593
; WIPE_START
G1 F13160.299
G1 X124.885 Y126.994 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.709 Y129.413 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
; LINE_WIDTH: 0.3624
G1 F4201
M204 S6000
G1 X130.709 Y138.187 E.22844
; WIPE_START
G1 F11268.311
G1 X130.709 Y136.187 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.394 Y138.994 Z10.6 F42000
G1 Z10.2
M73 P79 R3
G1 E.8 F1800
; LINE_WIDTH: 0.60393
G1 F4201
M204 S6000
G1 X131.394 Y140.594 E.07312
M204 S10000
G1 X124.885 Y140.594 F42000
; LINE_WIDTH: 0.31647
G1 F4201
M204 S6000
G1 X124.885 Y138.994 E.03566
; WIPE_START
G1 F13160.299
G1 X124.885 Y140.594 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.527 Y133.886 Z10.6 F42000
G1 X131.394 Y128.606 Z10.6
G1 Z10.2
G1 E.8 F1800
; LINE_WIDTH: 0.60393
G1 F4201
M204 S6000
G1 X131.394 Y126.994 E.07369
; CHANGE_LAYER
; Z_HEIGHT: 10.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6416.998
G1 X131.394 Y128.606 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 52/72
; update layer progress
M73 L52
M991 S0 P51 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z10.6 I1.166 J-.348 P1  F42000
G1 X130.971 Y127.19 Z10.6
G1 Z10.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4186
M204 S5000
G1 X130.971 Y128.41 E.03749
G1 X125.272 Y128.41 E.17514
G1 X125.272 Y128.369 E.00126
G1 X125.272 Y127.231 E.03497
G1 X125.272 Y127.19 E.00126
G1 X130.911 Y127.19 E.1733
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.971 Y128.41 E-.46416
G1 X130.193 Y128.41 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.779 Y126.535 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
G1 F4186
M204 S5000
G1 X125.779 Y117.865 E.2664
G1 X128.649 Y117.865 E.08819
G1 X128.649 Y126.535 E.2664
G1 X125.839 Y126.535 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.825 Y124.535 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.434 Y116.913 Z10.8 F42000
G1 X125.387 Y116.009 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4186
M204 S6000
G1 X131.117 Y116.009 E.19006
G1 X131.117 Y126.391 E.34437
G1 X129.448 Y126.391 E.05537
G1 X129.448 Y117.066 E.30933
G1 X125.387 Y117.066 E.13469
G1 X125.387 Y116.069 E.03305
M204 S10000
G1 X124.98 Y115.602 F42000
G1 F4186
M204 S6000
G1 X131.524 Y115.602 E.21707
G1 X131.524 Y126.798 E.37138
G1 X129.041 Y126.798 E.08238
G1 X129.041 Y117.473 E.30933
G1 X125.387 Y117.473 E.12121
G1 X125.387 Y126.798 E.30933
G1 X124.98 Y126.798 E.01348
G1 X124.98 Y115.662 E.36939
; WIPE_START
G1 F8843.478
G1 X126.98 Y115.644 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.848 Y123.227 Z10.8 F42000
G1 X129.6 Y138.527 Z10.8
G1 Z10.4
G1 E.8 F1800
G1 F4186
M204 S6000
G1 X126.251 Y138.527 E.11108
G1 X126.251 Y129.073 E.31361
G1 X129.992 Y129.073 E.12408
G1 X129.992 Y138.527 E.31361
G1 X129.66 Y138.527 E.01102
M204 S250
G1 X129.6 Y138.135 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4186
M204 S5000
G1 X126.643 Y138.135 E.09084
G1 X126.643 Y138.094 E.00126
G1 X126.643 Y129.506 E.26389
G1 X126.643 Y129.465 E.00126
G1 X129.6 Y129.465 E.09084
G1 X129.6 Y138.075 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.6 Y138.116 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.844 Y138.135 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4186
M204 S6000
G1 X125.844 Y138.391 E.00849
G1 X125.387 Y138.391 E.01515
G1 X125.387 Y129.209 E.30457
G1 X125.844 Y129.209 E.01515
G1 X125.844 Y138.075 E.2941
; WIPE_START
G1 F8843.478
G1 X125.844 Y138.391 E-.12003
G1 X125.387 Y138.391 E-.17358
G1 X125.387 Y137.164 E-.46639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.399 Y138.391 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
G1 F4186
M204 S6000
G1 X130.399 Y129.209 E.30457
G1 X131.117 Y129.209 E.02383
G1 X131.117 Y138.391 E.30457
G1 X130.459 Y138.391 E.02183
; WIPE_START
G1 F8843.478
G1 X130.446 Y136.391 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.272 Y138.798 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
G1 F4186
M204 S6000
G1 X124.98 Y138.798 E.00966
G1 X124.98 Y128.802 E.33158
G1 X131.524 Y128.802 E.21707
G1 X131.524 Y138.798 E.33158
G1 X125.332 Y138.798 E.20542
M204 S250
G1 X125.272 Y139.19 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4186
M204 S5000
G1 X130.971 Y139.19 E.17514
G1 X130.971 Y140.41 E.03749
G1 X125.272 Y140.41 E.17514
G1 X125.272 Y140.369 E.00126
G1 X125.272 Y139.25 E.03438
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.271 Y139.229 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.426 Y131.643 Z10.8 F42000
G1 X124.607 Y115.326 Z10.8
G1 Z10.4
G1 E.8 F1800
G1 F4186
M204 S5000
G3 X124.781 Y115.21 I.183 J.085 E.00675
G1 X131.716 Y115.21 E.21311
G3 X131.895 Y115.32 I-.012 J.221 E.00673
G1 X131.912 Y115.366 E.00149
G1 X131.916 Y139.993 E.75673
G3 X131.914 Y140.622 I-4.854 J.3 E.01934
G3 X131.893 Y140.686 I-.212 J-.035 E.00208
G1 X131.886 Y140.699 E.00045
G3 X131.723 Y140.79 I-.18 J-.132 E.00591
G1 X124.792 Y140.79 E.21296
G3 X124.588 Y140.59 I-.002 J-.202 E.00976
G1 X124.588 Y115.408 E.77378
G3 X124.59 Y115.384 I.202 J.004 E.00072
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.641 Y115.271 E-.04727
G1 X124.717 Y115.222 E-.03408
G1 X124.781 Y115.21 E-.0248
G1 X126.501 Y115.21 E-.65386
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


G1 X125.591 Y116.538 F42000
G1 Z10.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692289
G1 F4186
M204 S6000
G1 X129.651 Y116.538 E.21486
M204 S10000
G1 X129.84 Y125.999 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F4186
M204 S6000
G1 X130.725 Y125.999 E.0272
G1 X130.725 Y117.411 E.26388
; LINE_WIDTH: 0.439027
G1 X130.706 Y117.313 E.00322
; LINE_WIDTH: 0.477099
G1 X130.687 Y117.215 E.00353
; LINE_WIDTH: 0.515172
G1 X130.668 Y117.117 E.00384
; LINE_WIDTH: 0.57117
G3 X130.649 Y116.478 I3.958 J-.438 E.02756
G1 X130.119 Y116.478 E.02279
G1 X130.119 Y117.019 E.0233
; LINE_WIDTH: 0.55757
G1 X130.103 Y117.073 E.00239
; LINE_WIDTH: 0.52815
G1 X130.087 Y117.128 E.00226
; LINE_WIDTH: 0.490078
G1 X129.971 Y117.202 E.00501
; LINE_WIDTH: 0.420355
G1 X129.855 Y117.276 E.00423
G1 X129.84 Y117.552 E.00849
G1 X129.84 Y125.939 E.25796
M204 S10000
G1 X130.282 Y125.556 F42000
; LINE_WIDTH: 0.55094
G1 F4186
M204 S6000
G1 X130.282 Y117.552 E.33137
; LINE_WIDTH: 0.532465
G1 X130.293 Y117.51 E.0017
; LINE_WIDTH: 0.495515
G1 X130.304 Y117.469 E.00157
; WIPE_START
G1 F7954.131
G1 X130.293 Y117.51 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.125 Y125.053 Z10.8 F42000
G1 X128.845 Y126.862 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.30586
G1 F4186
M204 S6000
G1 X125.583 Y126.862 E.06989
M204 S10000
G1 X124.93 Y126.994 F42000
; LINE_WIDTH: 0.33417
G1 F4186
M204 S6000
M73 P80 R3
G1 X124.93 Y128.606 E.03826
; WIPE_START
G1 F12360.514
G1 X124.93 Y126.994 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.758 Y129.413 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
; LINE_WIDTH: 0.35408
G1 F4186
M204 S6000
G1 X130.758 Y138.187 E.22249
; WIPE_START
G1 F11569.61
G1 X130.758 Y136.187 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.444 Y138.994 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
; LINE_WIDTH: 0.59562
G1 F4186
M204 S6000
G1 X131.444 Y140.594 E.07204
M204 S10000
G1 X124.93 Y140.594 F42000
; LINE_WIDTH: 0.33417
G1 F4186
M204 S6000
G1 X124.93 Y138.994 E.03797
; WIPE_START
G1 F12360.514
G1 X124.93 Y140.594 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.574 Y133.888 Z10.8 F42000
G1 X131.444 Y128.606 Z10.8
G1 Z10.4
G1 E.8 F1800
; LINE_WIDTH: 0.59562
G1 F4186
M204 S6000
G1 X131.444 Y126.994 E.0726
; CHANGE_LAYER
; Z_HEIGHT: 10.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F6513.48
G1 X131.444 Y128.606 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 53/72
; update layer progress
M73 L53
M991 S0 P52 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z10.8 I1.167 J-.345 P1  F42000
G1 X131.025 Y127.19 Z10.8
G1 Z10.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4307
M204 S5000
G1 X131.025 Y128.41 E.03749
G1 X125.325 Y128.41 E.17514
G1 X125.325 Y128.369 E.00126
G1 X125.325 Y127.231 E.03497
G1 X125.325 Y127.19 E.00126
G1 X130.965 Y127.19 E.1733
M204 S10000
G1 X131.025 Y126.391 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4307
M204 S6000
G1 X129.448 Y126.391 E.05232
G1 X129.448 Y117.066 E.30933
G1 X125.423 Y117.066 E.1335
G1 X125.423 Y116.009 E.03504
G1 X131.162 Y116.009 E.19038
G1 X131.162 Y126.391 E.34437
G1 X131.085 Y126.391 E.00256
M204 S10000
G1 X131.025 Y126.798 F42000
G1 F4307
M204 S6000
G1 X129.041 Y126.798 E.06582
G1 X129.041 Y117.473 E.30933
G1 X125.387 Y117.473 E.12121
G1 X125.387 Y126.798 E.30933
G1 X125.016 Y126.798 E.01229
G1 X125.016 Y115.602 E.37138
G1 X131.569 Y115.602 E.21738
G1 X131.569 Y126.798 E.37138
G1 X131.085 Y126.798 E.01607
; WIPE_START
G1 F8843.478
G1 X129.085 Y126.798 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.779 Y126.535 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4307
M204 S5000
G1 X125.779 Y117.865 E.2664
G1 X128.649 Y117.865 E.08819
G1 X128.649 Y126.535 E.2664
G1 X125.839 Y126.535 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.825 Y124.535 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.087 Y131.825 Z11 F42000
G1 X130.045 Y138.135 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4307
M204 S6000
G1 X130.045 Y138.527 E.01301
G1 X126.305 Y138.527 E.12408
G1 X126.305 Y129.073 E.31361
G1 X130.045 Y129.073 E.12408
G1 X130.045 Y138.075 E.29861
M204 S250
G1 X129.653 Y138.135 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4307
M204 S5000
G1 X126.697 Y138.135 E.09084
G1 X126.697 Y138.094 E.00126
G1 X126.697 Y129.506 E.26389
G1 X126.697 Y129.465 E.00126
G1 X129.653 Y129.465 E.09084
G1 X129.653 Y138.075 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.654 Y138.116 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.898 Y138.135 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4307
M204 S6000
G1 X125.898 Y138.391 E.00849
G1 X125.423 Y138.391 E.01574
G1 X125.423 Y129.209 E.30457
G1 X125.898 Y129.209 E.01574
G1 X125.898 Y138.075 E.2941
; WIPE_START
G1 F8843.478
G1 X125.898 Y138.391 E-.12003
G1 X125.423 Y138.391 E-.18031
G1 X125.423 Y137.181 E-.45966
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.452 Y138.391 Z11 F42000
G1 Z10.6
G1 E.8 F1800
G1 F4307
M204 S6000
G1 X130.452 Y129.209 E.30457
G1 X131.162 Y129.209 E.02355
G1 X131.162 Y138.391 E.30457
G1 X130.512 Y138.391 E.02156
; WIPE_START
G1 F8843.478
G1 X130.499 Y136.391 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.325 Y138.798 Z11 F42000
G1 Z10.6
G1 E.8 F1800
G1 F4307
M204 S6000
G1 X125.016 Y138.798 E.01025
G1 X125.016 Y128.802 E.33158
G1 X131.569 Y128.802 E.21738
G1 X131.569 Y138.798 E.33158
G1 X125.385 Y138.798 E.20514
M204 S250
G1 X125.325 Y139.19 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4307
M204 S5000
G1 X131.025 Y139.19 E.17514
G1 X131.025 Y140.41 E.03749
G1 X125.325 Y140.41 E.17514
G1 X125.325 Y140.369 E.00126
G1 X125.325 Y139.25 E.03438
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.325 Y139.229 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.474 Y131.644 Z11 F42000
G1 X124.643 Y115.326 Z11
G1 Z10.6
G1 E.8 F1800
G1 F4307
M204 S5000
G3 X124.817 Y115.21 I.183 J.086 E.00675
G1 X131.81 Y115.217 E.21489
G3 X131.941 Y115.32 I-.047 J.193 E.00529
G1 X131.957 Y115.366 E.0015
G1 X131.961 Y139.993 E.75672
G3 X131.96 Y140.623 I-4.776 J.3 E.01936
G3 X131.939 Y140.684 I-.206 J-.034 E.002
G1 X131.931 Y140.7 E.00054
G3 X131.768 Y140.79 I-.18 J-.133 E.00589
G1 X124.828 Y140.79 E.21325
G3 X124.624 Y140.59 I-.002 J-.202 E.00976
G1 X124.624 Y115.407 E.77378
G3 X124.626 Y115.384 I.202 J.004 E.00071
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.677 Y115.271 E-.04727
G1 X124.753 Y115.222 E-.03406
G1 X124.817 Y115.21 E-.02479
G1 X126.537 Y115.212 E-.65389
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


G1 X125.627 Y116.538 F42000
G1 Z10.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692292
G1 F4307
M204 S6000
G1 X129.651 Y116.538 E.21296
M204 S10000
G1 X129.84 Y125.999 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F4307
M204 S6000
G1 X130.77 Y125.999 E.02859
G1 X130.77 Y116.401 E.29489
G1 X130.043 Y116.401 E.02233
G1 X130.043 Y117.087 E.02108
G1 X129.985 Y117.224 E.00457
G1 X129.84 Y117.291 E.0049
G1 X129.84 Y125.939 E.26572
M204 S10000
G1 X130.305 Y125.534 F42000
; LINE_WIDTH: 0.59616
G1 F4307
M204 S6000
G1 X130.305 Y117.561 E.35941
; LINE_WIDTH: 0.575816
G1 X130.325 Y117.467 E.00421
; LINE_WIDTH: 0.535128
G1 X130.346 Y117.372 E.00389
; LINE_WIDTH: 0.49444
G1 X130.366 Y117.277 E.00357
; LINE_WIDTH: 0.453752
G1 X130.386 Y117.182 E.00325
; LINE_WIDTH: 0.398207
G2 X130.407 Y116.825 I-.822 J-.226 E.01044
; WIPE_START
G1 F10132.65
G1 X130.407 Y117.087 E-.55501
G1 X130.386 Y117.182 E-.20499
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.186 Y124.72 Z11 F42000
G1 X128.845 Y126.862 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.30586
G1 F4307
M204 S6000
G1 X125.583 Y126.862 E.06989
M204 S10000
G1 X124.975 Y126.994 F42000
; LINE_WIDTH: 0.35188
G1 F4307
M204 S6000
G1 X124.975 Y128.606 E.04058
; WIPE_START
G1 F11651.994
G1 X124.975 Y126.994 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.66 Y129.413 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; LINE_WIDTH: 0.11034
G1 F4307
M204 S6000
G1 X125.66 Y138.187 E.04821
; WIPE_START
G1 F15000
G1 X125.66 Y136.187 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.975 Y138.994 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; LINE_WIDTH: 0.35188
G1 F4307
M204 S6000
G1 X124.975 Y140.594 E.04028
; WIPE_START
G1 F11651.994
G1 X124.975 Y138.994 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.807 Y138.187 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; LINE_WIDTH: 0.345741
G1 F4307
M204 S6000
G1 X130.807 Y129.413 E.21652
; WIPE_START
G1 F11888.243
G1 X130.807 Y131.413 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.493 Y128.606 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; LINE_WIDTH: 0.587272
M73 P81 R3
G1 F4307
M204 S6000
G1 X131.493 Y126.994 E.0715
; WIPE_START
G1 F6613.372
G1 X131.493 Y128.606 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.493 Y136.238 Z11 F42000
G1 X131.493 Y138.994 Z11
G1 Z10.6
G1 E.8 F1800
; LINE_WIDTH: 0.58729
G1 F4307
M204 S6000
G1 X131.493 Y140.594 E.07095
; CHANGE_LAYER
; Z_HEIGHT: 10.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6613.149
G1 X131.493 Y138.994 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 54/72
; update layer progress
M73 L54
M991 S0 P53 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z11 I1.216 J-.043 P1  F42000
G1 X131.079 Y127.19 Z11
G1 Z10.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4317
M204 S5000
G1 X131.079 Y128.41 E.03749
G1 X125.379 Y128.41 E.17514
G1 X125.379 Y128.369 E.00126
G1 X125.379 Y127.231 E.03497
G1 X125.379 Y127.19 E.00126
G1 X131.019 Y127.19 E.1733
M204 S10000
G1 X131.079 Y126.391 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4317
M204 S6000
G1 X129.448 Y126.391 E.0541
G1 X129.448 Y117.066 E.30933
G1 X125.459 Y117.066 E.13231
G1 X125.459 Y116.009 E.03504
G1 X131.208 Y116.009 E.19069
G1 X131.208 Y126.391 E.34437
G1 X131.139 Y126.391 E.00229
M204 S10000
G1 X131.079 Y126.798 F42000
G1 F4317
M204 S6000
G1 X129.041 Y126.798 E.0676
G1 X129.041 Y117.473 E.30933
G1 X125.387 Y117.473 E.12121
G1 X125.387 Y126.798 E.30933
G1 X125.052 Y126.798 E.0111
G1 X125.052 Y115.602 E.37138
G1 X131.615 Y115.602 E.21769
G1 X131.615 Y126.798 E.37138
G1 X131.139 Y126.798 E.01579
; WIPE_START
G1 F8843.478
G1 X129.139 Y126.798 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.779 Y126.535 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4317
M204 S5000
G1 X125.779 Y117.865 E.2664
G1 X128.649 Y117.865 E.08819
G1 X128.649 Y126.535 E.2664
G1 X125.839 Y126.535 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.825 Y124.535 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.865 Y131.89 Z11.2 F42000
G1 X129.707 Y138.527 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4317
M204 S6000
G1 X126.358 Y138.527 E.11107
G1 X126.358 Y129.073 E.31361
G1 X130.099 Y129.073 E.12408
G1 X130.099 Y138.527 E.31361
G1 X129.767 Y138.527 E.01102
M204 S250
G1 X129.707 Y138.135 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4317
M204 S5000
G1 X126.75 Y138.135 E.09084
G1 X126.75 Y138.094 E.00126
G1 X126.75 Y129.506 E.26389
G1 X126.75 Y129.465 E.00126
G1 X129.707 Y129.465 E.09084
G1 X129.707 Y138.075 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.707 Y138.116 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.951 Y138.135 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4317
M204 S6000
G1 X125.951 Y138.391 E.00849
G1 X125.459 Y138.391 E.01633
G1 X125.459 Y129.209 E.30457
G1 X125.951 Y129.209 E.01633
G1 X125.951 Y138.075 E.2941
; WIPE_START
G1 F8843.478
G1 X125.951 Y138.391 E-.12003
G1 X125.459 Y138.391 E-.18703
G1 X125.459 Y137.199 E-.45294
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.506 Y138.391 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
G1 F4317
M204 S6000
G1 X130.506 Y129.209 E.30457
G1 X131.208 Y129.209 E.02327
G1 X131.208 Y138.391 E.30457
G1 X130.566 Y138.391 E.02128
; WIPE_START
G1 F8843.478
G1 X130.553 Y136.391 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.379 Y138.798 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
G1 F4317
M204 S6000
G1 X125.052 Y138.798 E.01084
G1 X125.052 Y128.802 E.33158
G1 X131.615 Y128.802 E.21769
G1 X131.615 Y138.798 E.33158
G1 X125.439 Y138.798 E.20487
M204 S250
G1 X125.379 Y139.19 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4317
M204 S5000
G1 X131.079 Y139.19 E.17514
G1 X131.079 Y140.41 E.03749
G1 X125.379 Y140.41 E.17514
G1 X125.379 Y140.369 E.00126
G1 X125.379 Y139.25 E.03438
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.379 Y139.229 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.522 Y131.645 Z11.2 F42000
G1 X124.679 Y115.327 Z11.2
G1 Z10.8
G1 E.8 F1800
G1 F4317
M204 S5000
G3 X124.853 Y115.21 I.183 J.085 E.00675
G1 X131.855 Y115.217 E.21518
G3 X131.986 Y115.32 I-.045 J.19 E.00529
G1 X132.003 Y115.366 E.0015
G1 X132.007 Y139.993 E.75671
G3 X132.005 Y140.624 I-4.67 J.3 E.0194
G1 X131.985 Y140.683 E.00192
G1 X131.975 Y140.701 E.00062
G3 X131.814 Y140.79 I-.18 J-.136 E.00583
G1 X124.864 Y140.79 E.21355
G3 X124.66 Y140.59 I-.002 J-.202 E.00976
G1 X124.66 Y115.408 E.77378
G3 X124.662 Y115.385 I.202 J.004 E.00071
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.713 Y115.271 E-.04732
G1 X124.789 Y115.222 E-.03411
G1 X124.853 Y115.21 E-.02477
G1 X126.573 Y115.212 E-.6538
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


G1 X125.663 Y116.538 F42000
G1 Z10.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692304
G1 F4317
M204 S6000
G1 X129.651 Y116.538 E.21106
M204 S10000
G1 X129.84 Y125.999 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F4317
M204 S6000
G1 X130.815 Y125.999 E.02998
G1 X130.815 Y116.401 E.29489
G1 X130.043 Y116.401 E.02373
G1 X130.043 Y117.087 E.02108
G1 X129.987 Y117.222 E.00449
G1 X129.84 Y117.291 E.00498
G1 X129.84 Y125.939 E.26572
M204 S10000
G1 X130.328 Y125.511 F42000
; LINE_WIDTH: 0.64143
G1 F4317
M204 S6000
G1 X130.328 Y117.571 E.38724
; LINE_WIDTH: 0.621076
G1 X130.348 Y117.474 E.00466
; LINE_WIDTH: 0.580388
G1 X130.368 Y117.378 E.00433
; LINE_WIDTH: 0.5397
G1 X130.389 Y117.281 E.004
; LINE_WIDTH: 0.499012
G1 X130.409 Y117.184 E.00367
; LINE_WIDTH: 0.443916
G2 X130.429 Y116.847 I-.79 J-.217 E.0111
; WIPE_START
G1 F8977.658
G1 X130.429 Y117.087 E-.53827
G1 X130.409 Y117.184 E-.22173
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.191 Y124.719 Z11.2 F42000
G1 X128.845 Y126.862 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.30586
G1 F4317
M204 S6000
G1 X125.583 Y126.862 E.06989
M204 S10000
G1 X125.019 Y126.994 F42000
; LINE_WIDTH: 0.36958
G1 F4317
M204 S6000
G1 X125.019 Y128.606 E.04291
; WIPE_START
G1 F11020.634
G1 X125.019 Y126.994 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.705 Y129.413 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
; LINE_WIDTH: 0.12804
G1 F4317
M204 S6000
G1 X125.705 Y138.187 E.06086
; WIPE_START
G1 F15000
G1 X125.705 Y136.187 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.019 Y138.994 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
; LINE_WIDTH: 0.36958
G1 F4317
M204 S6000
G1 X125.019 Y140.594 E.04259
; WIPE_START
G1 F11020.634
G1 X125.019 Y138.994 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.857 Y138.187 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
; LINE_WIDTH: 0.337411
G1 F4317
M204 S6000
G1 X130.857 Y129.413 E.21057
; WIPE_START
G1 F12224.509
G1 X130.857 Y131.413 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.543 Y128.606 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
; LINE_WIDTH: 0.57895
G1 F4317
M204 S6000
G1 X131.543 Y126.994 E.07041
; WIPE_START
G1 F6716.042
G1 X131.543 Y128.606 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.543 Y136.238 Z11.2 F42000
G1 X131.543 Y138.994 Z11.2
G1 Z10.8
G1 E.8 F1800
; LINE_WIDTH: 0.57897
G1 F4317
M204 S6000
G1 X131.543 Y140.594 E.06987
; CHANGE_LAYER
; Z_HEIGHT: 11
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6715.792
G1 X131.543 Y138.994 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 55/72
; update layer progress
M73 L55
M991 S0 P54 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z11.2 I1.216 J-.042 P1  F42000
G1 X131.132 Y127.19 Z11.2
G1 Z11
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4085
M204 S5000
G1 X131.132 Y128.41 E.03749
G1 X125.432 Y128.41 E.17514
G1 X125.432 Y128.369 E.00126
G1 X125.432 Y127.231 E.03497
M73 P82 R3
G1 X125.432 Y127.19 E.00126
G1 X131.072 Y127.19 E.1733
M204 S10000
G1 X131.132 Y126.391 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4085
M204 S6000
G1 X129.448 Y126.391 E.05587
G1 X129.448 Y117.066 E.30933
G1 X125.495 Y117.066 E.13112
G1 X125.495 Y116.009 E.03504
G1 X131.253 Y116.009 E.191
G1 X131.253 Y126.391 E.34437
G1 X131.192 Y126.391 E.00201
M204 S10000
G1 X131.132 Y126.798 F42000
G1 F4085
M204 S6000
G1 X129.041 Y126.798 E.06938
G1 X129.041 Y117.473 E.30933
G1 X125.387 Y117.473 E.12121
G1 X125.387 Y126.798 E.30933
G1 X125.088 Y126.798 E.00991
G1 X125.088 Y115.602 E.37138
G1 X131.66 Y115.602 E.218
G1 X131.66 Y126.798 E.37138
G1 X131.192 Y126.798 E.01551
; WIPE_START
G1 F8843.478
G1 X129.192 Y126.798 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.779 Y126.535 Z11.4 F42000
G1 Z11
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4085
M204 S5000
G1 X125.779 Y117.865 E.2664
G1 X128.649 Y117.865 E.08819
G1 X128.649 Y126.535 E.2664
G1 X125.839 Y126.535 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.825 Y124.535 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.139 Y131.808 Z11.4 F42000
G1 X130.153 Y138.135 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4085
M204 S6000
G1 X130.153 Y138.527 E.01301
G1 X126.412 Y138.527 E.12408
G1 X126.412 Y129.073 E.31361
G1 X130.153 Y129.073 E.12408
G1 X130.153 Y138.075 E.29861
M204 S250
G1 X129.76 Y138.135 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4085
M204 S5000
G1 X126.804 Y138.135 E.09084
G1 X126.804 Y138.094 E.00126
G1 X126.804 Y129.506 E.26389
G1 X126.804 Y129.465 E.00126
G1 X129.76 Y129.465 E.09084
G1 X129.76 Y138.075 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.761 Y138.116 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.005 Y138.135 Z11.4 F42000
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4085
M204 S6000
G1 X126.005 Y138.391 E.00849
G1 X125.495 Y138.391 E.01691
G1 X125.495 Y129.209 E.30457
G1 X126.005 Y129.209 E.01691
G1 X126.005 Y138.075 E.2941
; WIPE_START
G1 F8843.478
G1 X126.005 Y138.391 E-.12003
G1 X125.495 Y138.391 E-.19376
G1 X125.495 Y137.217 E-.44621
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.56 Y138.391 Z11.4 F42000
G1 Z11
G1 E.8 F1800
G1 F4085
M204 S6000
G1 X130.56 Y129.209 E.30457
G1 X131.253 Y129.209 E.023
G1 X131.253 Y138.391 E.30457
G1 X130.62 Y138.391 E.02101
; WIPE_START
G1 F8843.478
G1 X130.607 Y136.391 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.432 Y138.798 Z11.4 F42000
G1 Z11
G1 E.8 F1800
G1 F4085
M204 S6000
G1 X125.088 Y138.798 E.01142
G1 X125.088 Y128.802 E.33158
G1 X131.66 Y128.802 E.218
G1 X131.66 Y138.798 E.33158
G1 X125.492 Y138.798 E.20459
M204 S250
G1 X125.432 Y139.19 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4085
M204 S5000
G1 X131.132 Y139.19 E.17514
G1 X131.132 Y140.41 E.03749
G1 X125.432 Y140.41 E.17514
G1 X125.432 Y140.369 E.00126
G1 X125.432 Y139.25 E.03438
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.432 Y139.229 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.57 Y131.645 Z11.4 F42000
G1 X124.715 Y115.327 Z11.4
G1 Z11
G1 E.8 F1800
G1 F4085
M204 S5000
G3 X124.888 Y115.21 I.183 J.085 E.00675
G1 X131.901 Y115.217 E.21548
G3 X132.031 Y115.32 I-.045 J.19 E.00528
G1 X132.048 Y115.366 E.0015
G1 X132.052 Y139.993 E.7567
G3 X132.05 Y140.625 I-4.56 J.3 E.01943
G1 X132.031 Y140.682 E.00187
G3 X131.859 Y140.79 I-.178 J-.095 E.0065
G1 X124.9 Y140.79 E.21384
G3 X124.696 Y140.59 I-.002 J-.202 E.00976
G1 X124.696 Y115.407 E.77379
G3 X124.698 Y115.384 I.202 J.004 E.00071
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.749 Y115.271 E-.04729
G1 X124.824 Y115.222 E-.03411
G1 X124.888 Y115.21 E-.02476
G1 X126.609 Y115.212 E-.65384
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


G1 X125.699 Y116.538 F42000
G1 Z11
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692335
G1 F4085
M204 S6000
G1 X129.651 Y116.538 E.20918
M204 S10000
G1 X130.703 Y116.358 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4085
M204 S6000
G1 X130.905 Y116.358 E.0067
G1 X130.905 Y117.784 E.04731
G2 X129.796 Y119.916 I.844 J1.793 E.08563
G1 X129.957 Y120.138 E.00911
G1 X130.905 Y120.813 E.03859
G1 X130.905 Y123.025 E.07338
G2 X129.796 Y125.157 I.844 J1.793 E.08563
G1 X129.957 Y125.38 E.00911
G1 X130.905 Y126.043 E.03836
G1 X130.905 Y124.422 E.05375
; WIPE_START
G1 F8843.478
G1 X130.905 Y126.043 E-.6157
G1 X130.593 Y125.825 E-.14431
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.592 Y126.994 Z11.4 F42000
G1 Z11
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.57062
G1 F4085
M204 S6000
G1 X131.592 Y128.606 E.06931
; WIPE_START
G1 F6822.058
G1 X131.592 Y126.994 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.906 Y129.413 Z11.4 F42000
G1 Z11
G1 E.8 F1800
; LINE_WIDTH: 0.329091
G1 F4085
M204 S6000
G1 X130.906 Y138.187 E.20462
; WIPE_START
G1 F12579.913
G1 X130.906 Y136.187 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.592 Y138.994 Z11.4 F42000
G1 Z11
G1 E.8 F1800
; LINE_WIDTH: 0.57065
G1 F4085
M204 S6000
G1 X131.592 Y140.594 E.06878
M204 S10000
G1 X125.064 Y140.594 F42000
; LINE_WIDTH: 0.38729
G1 F4085
M204 S6000
G1 X125.064 Y138.994 E.0449
; WIPE_START
G1 F10453.872
G1 X125.064 Y140.594 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.75 Y138.187 Z11.4 F42000
G1 Z11
G1 E.8 F1800
; LINE_WIDTH: 0.14575
G1 F4085
M204 S6000
G1 X125.75 Y129.413 E.07353
; WIPE_START
G1 F15000
G1 X125.75 Y131.413 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.064 Y128.606 Z11.4 F42000
G1 Z11
G1 E.8 F1800
; LINE_WIDTH: 0.38729
G1 F4085
M204 S6000
G1 X125.064 Y126.994 E.04523
M204 S10000
G1 X125.583 Y126.862 F42000
; LINE_WIDTH: 0.30586
G1 F4085
M204 S6000
G1 X128.845 Y126.862 E.06989
; CHANGE_LAYER
; Z_HEIGHT: 11.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F13691.336
G1 X126.845 Y126.862 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 56/72
; update layer progress
M73 L56
M991 S0 P55 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z11.4 I-1.165 J-.352 P1  F42000
G1 X126.058 Y129.465 Z11.4
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3881
M204 S6000
G1 X126.058 Y138.391 E.29609
G1 X125.531 Y138.391 E.0175
G1 X125.531 Y129.209 E.30457
G1 X126.058 Y129.209 E.0175
G1 X126.058 Y129.405 E.0065
M204 S10000
G1 X126.858 Y129.073 F42000
G1 F3881
M204 S6000
G1 X126.466 Y129.073 E.01301
G1 X126.466 Y138.527 E.31361
G1 X128.495 Y138.527 E.06731
G1 X128.495 Y138.798 E.00899
G1 X125.124 Y138.798 E.11182
G1 X125.124 Y128.802 E.33158
G1 X128.495 Y128.802 E.11182
G1 X128.495 Y129.073 E.00899
G1 X126.918 Y129.073 E.05232
; WIPE_START
G1 F8843.478
G1 X126.466 Y129.073 E-.17179
G1 X126.466 Y130.621 E-.58821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.082 Y128.54 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3881
M204 S5000
G1 X131.082 Y139.06 E.32325
G1 X130.353 Y139.06 E.0224
G1 X130.353 Y128.54 E.32325
G1 X131.022 Y128.54 E.02056
; WIPE_START
G1 F9547.055
M204 S6000
G1 X131.034 Y130.54 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.186 Y126.391 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P83 R3
G1 F3881
M204 S6000
G1 X129.448 Y126.391 E.05765
G1 X129.448 Y117.066 E.30933
G1 X125.531 Y117.066 E.12993
G1 X125.531 Y116.009 E.03504
G1 X131.298 Y116.009 E.19131
G1 X131.298 Y126.391 E.34438
G1 X131.246 Y126.391 E.00174
M204 S10000
G1 X131.186 Y126.798 F42000
G1 F3881
M204 S6000
G1 X129.041 Y126.798 E.07115
G1 X129.041 Y117.473 E.30933
G1 X125.387 Y117.473 E.12121
G1 X125.387 Y126.798 E.30933
G1 X125.124 Y126.798 E.00872
G1 X125.124 Y115.602 E.37138
G1 X131.705 Y115.602 E.21831
G1 X131.705 Y126.798 E.37138
G1 X131.246 Y126.798 E.01524
M204 S250
G1 X131.186 Y127.19 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3881
M204 S5000
G1 X131.186 Y128.41 E.03749
G1 X125.486 Y128.41 E.17514
G1 X125.486 Y128.369 E.00126
G1 X125.486 Y127.231 E.03497
G1 X125.486 Y127.19 E.00126
G1 X131.126 Y127.19 E.1733
; WIPE_START
G1 F9547.055
M204 S6000
G1 X131.186 Y128.41 E-.46416
G1 X130.407 Y128.41 E-.29584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.858 Y129.465 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
G1 F3881
M204 S5000
G1 X129.814 Y129.465 E.09084
G1 X129.814 Y138.135 E.2664
G1 X126.858 Y138.135 E.09084
G1 X126.858 Y138.094 E.00126
G1 X126.858 Y129.525 E.2633
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.857 Y129.484 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.353 Y136.694 Z11.6 F42000
G1 X125.486 Y139.19 Z11.6
G1 Z11.2
G1 E.8 F1800
G1 F3881
M204 S5000
G1 X131.186 Y139.19 E.17514
G1 X131.186 Y140.41 E.03749
G1 X125.486 Y140.41 E.17514
G1 X125.486 Y140.369 E.00126
G1 X125.486 Y139.25 E.03438
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.486 Y139.229 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.469 Y131.665 Z11.6 F42000
G1 X125.779 Y126.535 Z11.6
G1 Z11.2
G1 E.8 F1800
G1 F3881
M204 S5000
G1 X125.779 Y117.865 E.2664
G1 X128.649 Y117.865 E.08819
G1 X128.649 Y126.535 E.2664
G1 X125.839 Y126.535 E.08634
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.825 Y124.535 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.94 Y116.954 Z11.6 F42000
G1 X124.751 Y115.327 Z11.6
G1 Z11.2
G1 E.8 F1800
G1 F3881
M204 S5000
G3 X124.924 Y115.21 I.183 J.085 E.00676
G1 X131.946 Y115.217 E.21577
G3 X132.077 Y115.32 I-.045 J.19 E.00528
G1 X132.093 Y115.366 E.0015
G1 X132.097 Y139.993 E.75669
G3 X132.095 Y140.626 I-4.469 J.3 E.01948
G1 X132.076 Y140.681 E.0018
G3 X131.904 Y140.79 I-.179 J-.093 E.00653
G1 X124.936 Y140.79 E.21413
G3 X124.732 Y140.59 I-.002 J-.202 E.00976
G1 X124.732 Y115.407 E.77379
G3 X124.734 Y115.385 I.202 J.005 E.0007
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.785 Y115.271 E-.04736
G1 X124.861 Y115.222 E-.0343
G1 X124.924 Y115.21 E-.02456
G1 X126.645 Y115.212 E-.65378
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


G1 X125.734 Y116.538 F42000
G1 Z11.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692346
G1 F3881
M204 S6000
G1 X129.651 Y116.538 E.20728
M204 S10000
G1 X130.905 Y116.358 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3881
M204 S6000
G1 X130.95 Y116.358 E.00147
G1 X130.95 Y117.941 E.05254
G1 X130.621 Y118.059 E.01159
G1 X129.965 Y118.586 E.02791
G1 X129.796 Y118.872 E.01103
G1 X129.796 Y120.418 E.05127
G3 X130.95 Y120.892 I-.622 J3.155 E.04164
G1 X130.95 Y123.183 E.07598
G1 X130.621 Y123.3 E.01159
G1 X129.965 Y123.828 E.02791
G1 X129.796 Y124.114 E.01103
G1 X129.796 Y125.659 E.05127
G3 X130.809 Y126.043 I-.646 J3.239 E.0361
G1 X130.95 Y126.043 E.00466
G1 X130.95 Y124.555 E.04935
; WIPE_START
G1 F8843.478
G1 X130.95 Y126.043 E-.56536
G1 X130.809 Y126.043 E-.05339
G1 X130.621 Y125.92 E-.0854
G1 X130.481 Y125.876 E-.05585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.845 Y126.862 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.30586
G1 F3881
M204 S6000
G1 X125.583 Y126.862 E.06989
M204 S10000
G1 X125.109 Y126.994 F42000
; LINE_WIDTH: 0.40499
G1 F3881
M204 S6000
G1 X125.109 Y128.606 E.04756
; WIPE_START
G1 F9942.828
G1 X125.109 Y126.994 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.795 Y129.413 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; LINE_WIDTH: 0.16345
G1 F3881
M204 S6000
G1 X125.795 Y138.187 E.08618
; WIPE_START
G1 F15000
G1 X125.795 Y136.187 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.109 Y138.994 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; LINE_WIDTH: 0.40499
G1 F3881
M204 S6000
G1 X125.109 Y140.594 E.0472
; WIPE_START
G1 F9942.828
G1 X125.109 Y138.994 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.549 Y138.983 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F3881
M204 S2000
G1 X130.146 Y138.386 E.02594
G1 X129.656 Y138.342
G1 X129.016 Y138.983 E.02782
G1 X128.717 Y138.748
G1 X129.123 Y138.342 E.01761
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.717 Y138.748 E-.2178
G1 X129.016 Y138.983 E-.1443
G1 X129.656 Y138.342 E-.34406
G1 X129.797 Y138.355 E-.05384
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.642 Y139.701 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.5773
G1 F3881
M204 S6000
G1 X131.642 Y139.001 E.03047
; LINE_WIDTH: 0.594554
G1 X131.624 Y138.923 E.00361
; LINE_WIDTH: 0.62906
G1 X131.607 Y138.845 E.00383
; LINE_WIDTH: 0.680672
G1 X131.59 Y138.766 E.00417
G1 X131.59 Y128.834 E.51618
; LINE_WIDTH: 0.663547
G1 X131.607 Y128.755 E.00406
; LINE_WIDTH: 0.62904
G1 X131.624 Y128.677 E.00383
; LINE_WIDTH: 0.579204
G1 X131.642 Y128.599 E.00351
G1 X131.642 Y127.959 E.02796
; WIPE_START
G1 F6712.865
G1 X131.642 Y128.599 E-.67526
G1 X131.624 Y128.677 E-.08474
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.675 Y129.258 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F3881
M204 S2000
G1 X130.146 Y128.787 E.02045
G1 X129.782 Y128.617
G1 X129.142 Y129.258 E.02782
G1 X128.717 Y129.149
G1 X129.249 Y128.617 E.0231
; CHANGE_LAYER
; Z_HEIGHT: 11.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.717 Y129.149 E-.28571
G1 X129.142 Y129.258 E-.16657
G1 X129.715 Y128.685 E-.30771
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 57/72
; update layer progress
M73 L57
M991 S0 P56 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z11.6 I-1.041 J-.63 P1  F42000
G1 X126.112 Y134.64 Z11.6
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5196
M204 S6000
G1 X126.112 Y138.391 E.12441
G1 X125.57 Y138.391 E.01798
G1 X125.57 Y129.209 E.30457
G1 X126.112 Y129.209 E.01798
G1 X126.112 Y134.58 E.17817
; WIPE_START
G1 F8843.478
G1 X126.112 Y136.58 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.748 Y138.527 Z11.8 F42000
G1 Z11.4
G1 E.8 F1800
G1 F5196
M204 S6000
G1 X127.748 Y138.798 E.00899
G1 X125.163 Y138.798 E.08576
G1 X125.163 Y128.802 E.33158
G1 X127.748 Y128.802 E.08576
G1 X127.748 Y129.073 E.00899
G1 X126.519 Y129.073 E.04078
G1 X126.519 Y138.527 E.31361
G1 X127.688 Y138.527 E.03879
; WIPE_START
G1 F8843.478
G1 X127.748 Y138.798 E-.10543
G1 X126.026 Y138.798 E-.65457
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P84 R3
G1 X125.706 Y131.172 Z11.8 F42000
G1 X125.539 Y127.19 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5196
M204 S5000
G1 X131.239 Y127.19 E.17514
G1 X131.239 Y128.41 E.03749
G1 X125.539 Y128.41 E.17514
G1 X125.539 Y128.369 E.00126
G1 X125.539 Y127.25 E.03438
M204 S10000
G1 X125.57 Y126.391 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5196
M204 S6000
G1 X125.57 Y116.009 E.34437
G1 X131.343 Y116.009 E.19151
G1 X131.343 Y126.391 E.34438
G1 X129.421 Y126.391 E.06376
G1 X129.021 Y126.391 E.01327
G1 X128.621 Y126.391 E.01327
G1 F2760
G1 X125.806 Y126.391 E.09338
G1 F4191.323
G1 X125.63 Y126.391 E.00584
M204 S10000
G1 X125.539 Y126.798 F42000
G1 F5196
M204 S6000
G1 X125.163 Y126.798 E.01249
G1 X125.163 Y115.602 E.37138
G1 X131.75 Y115.602 E.21852
G1 X131.75 Y126.798 E.37138
G1 X125.599 Y126.798 E.20404
; WIPE_START
G1 F8843.478
G1 X125.163 Y126.798 E-.16587
G1 X125.163 Y125.234 E-.59413
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.649 Y132.451 Z11.8 F42000
G1 X129.607 Y138.135 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5196
M204 S5000
G1 X126.911 Y138.135 E.08283
G1 X126.911 Y138.094 E.00126
G1 X126.911 Y129.506 E.26389
G1 X126.911 Y129.465 E.00126
G1 X129.607 Y129.465 E.08283
G1 X129.607 Y128.54 E.02842
G1 X131.136 Y128.54 E.04698
G1 X131.136 Y139.06 E.32325
G1 X129.607 Y139.06 E.04698
G1 X129.607 Y138.195 E.02658
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.607 Y138.15 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.539 Y139.19 Z11.8 F42000
G1 Z11.4
G1 E.8 F1800
G1 F5196
M204 S5000
G1 X131.239 Y139.19 E.17514
G1 X131.239 Y140.41 E.03749
G1 X125.539 Y140.41 E.17514
G1 X125.539 Y140.369 E.00126
G1 X125.539 Y139.25 E.03438
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.539 Y139.229 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.667 Y131.646 Z11.8 F42000
G1 X124.79 Y115.327 Z11.8
G1 Z11.4
G1 E.8 F1800
G1 F5196
M204 S5000
G3 X124.967 Y115.21 I.184 J.086 E.00686
G1 X131.992 Y115.217 E.21585
G3 X132.122 Y115.32 I-.045 J.19 E.00527
G1 X132.138 Y115.366 E.00151
G1 X132.143 Y139.992 E.75669
G3 X132.14 Y140.627 I-4.421 J.3 E.01951
G1 X132.122 Y140.681 E.00175
G3 X131.95 Y140.79 I-.179 J-.092 E.00656
G1 X124.979 Y140.79 E.2142
G3 X124.771 Y140.59 I-.004 J-.204 E.00985
G1 X124.771 Y115.408 E.77378
G3 X124.773 Y115.385 I.204 J.006 E.0007
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.824 Y115.272 E-.04736
G1 X124.901 Y115.223 E-.03473
G1 X124.967 Y115.21 E-.02537
G1 X126.684 Y115.212 E-.65255
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


G1 X125.734 Y116.348 F42000
G1 Z11.4
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.43107
M106 S255
G1 F3000
M204 S6000
G1 X128.866 Y116.348 E.09908
G3 X129.263 Y116.503 I-.788 J2.598 E.01349
G1 X129.421 Y116.589 E.0057
G1 X129.628 Y116.736 E.00802
G1 X125.903 Y116.736 E.11781
G1 X125.903 Y117.125 E.01228
G1 X129.509 Y117.125 E.11404
G1 X129.483 Y117.186 E.00211
G1 X129.483 Y117.513 E.01033
G1 X125.903 Y117.513 E.11323
G1 X125.903 Y117.901 E.01228
G1 X129.483 Y117.901 E.11323
G1 X129.483 Y118.289 E.01228
G1 X125.903 Y118.289 E.11323
M73 P84 R2
G1 X125.903 Y118.677 E.01228
G1 X129.483 Y118.677 E.11323
G1 X129.483 Y119.065 E.01228
G1 X125.903 Y119.065 E.11323
G1 X125.903 Y119.453 E.01228
G1 X129.483 Y119.453 E.11323
G1 X129.483 Y119.842 E.01228
G1 X125.903 Y119.842 E.11323
G1 X125.903 Y120.23 E.01228
G1 X129.483 Y120.23 E.11323
G1 X129.483 Y120.618 E.01228
G1 X125.903 Y120.618 E.11323
G1 X125.903 Y121.006 E.01228
G1 X129.483 Y121.006 E.11323
G1 X129.483 Y121.394 E.01228
G1 X125.903 Y121.394 E.11323
G1 X125.903 Y121.782 E.01228
G1 X129.483 Y121.782 E.11323
G1 X129.483 Y122.171 E.01228
G1 X125.903 Y122.171 E.11323
G1 X125.903 Y122.559 E.01228
G1 X129.483 Y122.559 E.11323
G1 X129.483 Y122.947 E.01228
G1 X125.903 Y122.947 E.11323
G1 X125.903 Y123.335 E.01228
G1 X129.483 Y123.335 E.11323
G1 X129.483 Y123.723 E.01228
G1 X125.903 Y123.723 E.11323
G1 X125.903 Y124.111 E.01228
G1 X129.483 Y124.111 E.11323
G1 X129.483 Y124.499 E.01228
G1 X125.903 Y124.499 E.11323
G1 X125.903 Y124.888 E.01228
G1 X129.483 Y124.888 E.11323
G1 X129.483 Y125.276 E.01228
G1 X125.903 Y125.276 E.11323
G1 X125.903 Y125.664 E.01228
G1 X129.483 Y125.664 E.11323
G1 X129.483 Y126.052 E.01228
G1 X125.734 Y126.052 E.1186
M106 S201.45
; WIPE_START
G1 X127.734 Y126.052 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.155 Y126.994 Z11.8 F42000
G1 Z11.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.41943
G1 F5196
M204 S6000
G1 X125.155 Y128.606 E.04945
; WIPE_START
G1 F9561.498
G1 X125.155 Y126.994 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.841 Y129.413 Z11.8 F42000
G1 Z11.4
G1 E.8 F1800
; LINE_WIDTH: 0.17789
G1 F5196
M204 S6000
G1 X125.841 Y138.187 E.09651
; WIPE_START
G1 F15000
G1 X125.841 Y136.187 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.155 Y138.994 Z11.8 F42000
G1 Z11.4
G1 E.8 F1800
; LINE_WIDTH: 0.41943
G1 F5196
M204 S6000
G1 X125.155 Y140.594 E.04909
; WIPE_START
G1 F9561.498
G1 X125.155 Y138.994 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.01 Y138.342 Z11.8 F42000
G1 Z11.4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5196
M204 S2000
G1 X129.399 Y138.731 E.01691
G1 X129.117 Y138.983
G1 X128.477 Y138.342 E.02782
G1 X127.971 Y138.369
G1 X128.584 Y138.983 E.02664
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.971 Y138.369 E-.32951
G1 X128.477 Y138.342 E-.19263
G1 X128.92 Y138.785 E-.23786
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.691 Y140.594 Z11.8 F42000
G1 Z11.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.553997
G1 F5196
M204 S6000
G1 X131.691 Y138.994 E.06661
; LINE_WIDTH: 0.571252
G1 X131.674 Y138.917 E.00338
; LINE_WIDTH: 0.605756
G1 X131.656 Y138.841 E.0036
; LINE_WIDTH: 0.657369
G1 X131.639 Y138.764 E.00393
G1 X131.639 Y128.836 E.49709
; LINE_WIDTH: 0.640244
G1 X131.656 Y128.759 E.00383
; LINE_WIDTH: 0.605733
G1 X131.674 Y128.683 E.0036
; LINE_WIDTH: 0.554773
G1 X131.691 Y128.606 E.00328
G1 X131.691 Y126.994 E.06723
; WIPE_START
G1 F7033.276
G1 X131.691 Y128.606 E-.72467
G1 X131.674 Y128.683 E-.03533
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.995 Y124.698 Z11.8 F42000
G1 Z11.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5196
M204 S6000
G1 X130.995 Y126.043 E.04462
G3 X130.621 Y125.987 I-.142 J-.333 E.01321
G1 X129.875 Y125.916 E.02483
G1 X129.875 Y123.854 E.0684
G1 X130.621 Y123.366 E.02954
G1 X130.995 Y123.32 E.01252
G1 X130.995 Y120.975 E.07779
G1 X130.621 Y120.745 E.01457
G1 X129.875 Y120.674 E.02483
G1 X129.875 Y118.612 E.0684
G1 X130.621 Y118.125 E.02954
G1 X130.995 Y118.079 E.01251
G1 X130.995 Y116.45 E.05401
M204 S10000
G1 X129.733 Y116.34 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F5196
M204 S6000
G1 X129.669 Y116.377 E.00204
G1 X129.718 Y116.405 E.00155
; WIPE_START
G1 F10588.235
G1 X129.669 Y116.377 E-.32874
G1 X129.733 Y116.34 E-.43126
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.206 Y123.954 Z11.8 F42000
G1 X128.884 Y128.617 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5196
M204 S2000
G1 X129.399 Y129.133 E.0224
G1 X128.991 Y129.258
G1 X128.351 Y128.617 E.02782
G1 X127.971 Y128.771
G1 X128.458 Y129.258 E.02115
; CHANGE_LAYER
; Z_HEIGHT: 11.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.971 Y128.771 E-.2616
G1 X128.351 Y128.617 E-.15566
G1 X128.988 Y129.255 E-.34273
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 58/72
; update layer progress
M73 L58
M991 S0 P57 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z11.8 I-1.107 J-.505 P1  F42000
G1 X126.166 Y135.44 Z11.8
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P85 R2
G1 F4222
M204 S6000
G1 X126.166 Y138.391 E.09788
G1 X125.616 Y138.391 E.01825
G1 X125.616 Y129.209 E.30457
G1 X126.166 Y129.209 E.01825
G1 X126.166 Y135.38 E.20471
M204 S10000
G1 X126.573 Y136.236 F42000
G1 F4222
M204 S6000
G1 X126.573 Y138.527 E.07601
G1 X127.002 Y138.527 E.01424
G1 X127.002 Y138.798 E.00899
G1 X125.209 Y138.798 E.05949
G1 X125.209 Y128.802 E.33158
G1 X127.002 Y128.802 E.05949
G1 X127.002 Y129.073 E.00899
G1 X126.573 Y129.073 E.01424
G1 X126.573 Y136.176 E.23561
; WIPE_START
G1 F8843.478
G1 X126.573 Y138.176 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.895 Y130.573 Z12 F42000
G1 X125.593 Y127.19 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4222
M204 S5000
G1 X131.293 Y127.19 E.17514
G1 X131.293 Y128.41 E.03749
G1 X125.593 Y128.41 E.17514
G1 X125.593 Y128.369 E.00126
G1 X125.593 Y127.25 E.03438
M204 S10000
G1 X125.616 Y126.391 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4222
M204 S6000
G1 X125.616 Y116.009 E.34437
G1 X131.389 Y116.009 E.1915
G1 X131.389 Y126.391 E.34438
G1 X125.676 Y126.391 E.18951
M204 S10000
G1 X125.593 Y126.798 F42000
G1 F4222
M204 S6000
G1 X125.209 Y126.798 E.01275
G1 X125.209 Y115.602 E.37138
G1 X131.796 Y115.602 E.21851
G1 X131.796 Y126.798 E.37138
G1 X125.653 Y126.798 E.20376
; WIPE_START
G1 F8843.478
G1 X125.209 Y126.798 E-.16891
G1 X125.209 Y125.242 E-.59109
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.289 Y132.586 Z12 F42000
G1 X128.86 Y138.135 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4222
M204 S5000
G1 X126.965 Y138.135 E.05825
G1 X126.965 Y138.094 E.00126
G1 X126.965 Y129.506 E.26389
G1 X126.965 Y129.465 E.00126
G1 X128.86 Y129.465 E.05825
G1 X128.86 Y128.54 E.02842
G1 X131.189 Y128.54 E.07157
G1 X131.189 Y139.06 E.32325
G1 X128.86 Y139.06 E.07157
G1 X128.86 Y138.195 E.02658
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.965 Y138.135 E-.72068
G1 X126.965 Y138.094 E-.01558
G1 X126.965 Y138.032 E-.02374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.593 Y139.19 Z12 F42000
G1 Z11.6
G1 E.8 F1800
G1 F4222
M204 S5000
G1 X131.293 Y139.19 E.17514
G1 X131.293 Y140.41 E.03749
G1 X125.593 Y140.41 E.17514
G1 X125.593 Y140.369 E.00126
G1 X125.593 Y139.25 E.03438
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.593 Y139.229 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.713 Y131.647 Z12 F42000
G1 X124.821 Y115.36 Z12
G1 Z11.6
G1 E.8 F1800
G1 F4222
M204 S5000
G3 X125.013 Y115.21 I.202 J.061 E.00794
G1 X132.018 Y115.212 E.21525
G1 X132.031 Y115.215 E.0004
G3 X132.167 Y115.32 I-.041 J.194 E.00548
G1 X132.184 Y115.367 E.00151
G1 X132.188 Y139.992 E.75668
G3 X132.185 Y140.628 I-4.35 J.3 E.01954
G1 X132.166 Y140.684 E.00184
G1 X132.156 Y140.702 E.00064
G3 X131.995 Y140.79 I-.182 J-.144 E.00576
G1 X125.024 Y140.79 E.21419
G3 X124.816 Y140.59 I-.004 J-.204 E.00985
G1 X124.821 Y115.42 E.77341
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.888 Y115.255 E-.06734
G1 X125.013 Y115.21 E-.05034
G1 X126.703 Y115.211 E-.64232
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


G1 X129.687 Y116.777 F42000
G1 Z11.6
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F4222
M204 S6000
G1 X129.687 Y116.401 E.01155
G1 X126.008 Y116.401 E.11304
G1 X126.008 Y125.999 E.29489
G1 X129.483 Y125.999 E.10679
G1 X129.483 Y117.224 E.26963
G3 X129.687 Y116.916 I.869 J.355 E.0114
G1 X129.687 Y116.837 E.00243
M204 S10000
G1 X129.308 Y116.778 F42000
G1 F4222
M204 S6000
G1 X126.385 Y116.779 E.08983
G1 X126.385 Y125.622 E.27172
G1 X129.106 Y125.622 E.08362
G1 X129.106 Y117.224 E.25804
G1 X129.242 Y116.856 E.01205
G1 X129.269 Y116.824 E.00128
M204 S10000
G1 X128.754 Y117.156 F42000
G1 F4222
M204 S6000
G1 X126.762 Y117.156 E.06122
G1 X126.762 Y125.245 E.24855
G1 X128.729 Y125.245 E.06045
G1 X128.734 Y117.212 E.24682
M204 S10000
G1 X128.352 Y117.533 F42000
G1 F4222
M204 S6000
G1 X127.139 Y117.533 E.03728
G1 X127.139 Y124.868 E.22538
G1 X128.352 Y124.868 E.03728
G1 X128.352 Y117.593 E.22353
M204 S10000
G1 X127.955 Y117.93 F42000
; LINE_WIDTH: 0.46098
G1 F4222
M204 S6000
G1 X127.536 Y117.93 E.01424
G1 X127.536 Y124.47 E.22279
G1 X127.955 Y124.47 E.01424
G1 X127.955 Y117.99 E.22075
M204 S10000
G1 X131.04 Y116.562 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4222
M204 S6000
G1 X131.04 Y118.19 E.05401
G1 X130.621 Y118.161 E.01395
G1 X129.875 Y118.5 E.02716
G1 X129.875 Y120.854 E.07808
G1 X130.621 Y120.782 E.02484
G1 X131.04 Y120.956 E.01507
G1 X131.04 Y123.432 E.08211
G1 X130.621 Y123.403 E.01396
G1 X129.875 Y123.742 E.02716
G1 X129.875 Y126.043 E.07633
G1 X130.197 Y126.043 E.01067
G3 X131.04 Y126.043 I.422 J9.254 E.02799
G1 X131.04 Y124.788 E.04162
; WIPE_START
G1 F8843.478
G1 X131.04 Y126.043 E-.47681
G1 X130.295 Y126.043 E-.28319
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.74 Y126.994 Z12 F42000
G1 Z11.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.546438
G1 F4222
M204 S6000
G1 X131.74 Y128.606 E.06614
G1 X131.723 Y128.682 E.0032
; LINE_WIDTH: 0.597408
G1 X131.706 Y128.758 E.00352
; LINE_WIDTH: 0.631913
G1 X131.689 Y128.834 E.00374
; LINE_WIDTH: 0.649051
G1 X131.689 Y138.766 E.49055
G1 X131.706 Y138.842 E.00385
; LINE_WIDTH: 0.597435
G1 X131.723 Y138.918 E.00352
; LINE_WIDTH: 0.562932
G1 X131.74 Y138.994 E.0033
; LINE_WIDTH: 0.545676
G1 X131.74 Y140.594 E.06553
; WIPE_START
G1 F7160.542
G1 X131.74 Y138.994 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.589 Y138.342 Z12 F42000
G1 Z11.6
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F4222
M204 S2000
G1 X127.949 Y138.983 E.02782
G1 X127.416 Y138.983
G1 X128.056 Y138.342 E.02782
M204 S10000
G1 X127.251 Y138.324 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.132931
G1 F4222
M204 S6000
G1 X127.251 Y139.001 E.00497
; WIPE_START
G1 F15000
G1 X127.251 Y138.324 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.672 Y138.642 Z12 F42000
G1 Z11.6
G1 E.8 F1800
; LINE_WIDTH: 0.148115
G1 F4222
M204 S6000
G1 X128.226 Y139.001 E.00491
; WIPE_START
G1 F15000
G1 X128.672 Y138.642 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.891 Y138.187 Z12 F42000
G1 Z11.6
G1 E.8 F1800
; LINE_WIDTH: 0.18588
G1 F4222
M204 S6000
G1 X125.891 Y129.413 E.10222
; WIPE_START
G1 F15000
G1 X125.891 Y131.413 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.205 Y128.606 Z12 F42000
G1 Z11.6
G1 E.8 F1800
; LINE_WIDTH: 0.42741
G1 F4222
M204 S6000
G1 X125.205 Y126.994 E.0505
; WIPE_START
G1 F9363.052
G1 X125.205 Y128.606 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.075 Y129.258 Z12 F42000
G1 Z11.6
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F4222
M204 S2000
G1 X128.564 Y128.769 E.02124
G1 X128.182 Y128.617
G1 X127.542 Y129.258 E.02782
G1 X127.224 Y129.042
G1 X127.649 Y128.617 E.01846
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.224 Y129.042 E-.22824
G1 X127.542 Y129.258 E-.1459
G1 X128.182 Y128.617 E-.34406
G1 X128.285 Y128.658 E-.0418
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.105 Y135.973 Z12 F42000
G1 X125.205 Y138.994 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.42741
G1 F4222
M204 S6000
G1 X125.205 Y140.594 E.05013
; CHANGE_LAYER
; Z_HEIGHT: 11.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9363.052
G1 X125.205 Y138.994 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 59/72
; update layer progress
M73 L59
M991 S0 P58 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z12 I1.216 J.046 P1  F42000
G1 X125.647 Y127.19 Z12
G1 Z11.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4064
M204 S5000
G1 X131.347 Y127.19 E.17514
G1 X131.347 Y128.41 E.03749
G1 X125.647 Y128.41 E.17514
G1 X125.647 Y128.369 E.00126
G1 X125.647 Y127.25 E.03438
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.647 Y127.229 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.309 Y134.743 Z12.2 F42000
G1 X126.219 Y135.247 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4064
M204 S6000
G1 X126.219 Y135.956 E.0235
G1 X125.661 Y135.956 E.01851
G1 X125.661 Y131.644 E.14303
G1 X126.219 Y131.644 E.01851
G1 X126.219 Y135.187 E.11753
; WIPE_START
G1 F8843.478
G1 X126.219 Y135.956 E-.29203
G1 X125.661 Y135.956 E-.21205
G1 X125.661 Y135.282 E-.25592
; WIPE_END
M73 P86 R2
G1 E-.04 F1800
M204 S10000
G1 X126.626 Y136.277 Z12.2 F42000
G1 Z11.8
G1 E.8 F1800
G1 F4064
M204 S6000
G1 X126.626 Y136.363 E.00286
G1 X126.256 Y136.363 E.0123
G1 X126.256 Y138.798 E.08077
G1 X125.254 Y138.798 E.03322
G1 X125.254 Y128.802 E.33158
G1 X126.256 Y128.802 E.03322
G1 X126.256 Y131.237 E.08077
G1 X126.626 Y131.237 E.0123
G1 X126.626 Y136.217 E.16518
; WIPE_START
G1 F8843.478
G1 X126.626 Y136.363 E-.0556
G1 X126.256 Y136.363 E-.14089
G1 X126.256 Y137.846 E-.56351
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.114 Y138.135 Z12.2 F42000
G1 Z11.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4064
M204 S5000
G1 X127.018 Y138.135 E.03366
G1 X127.018 Y138.094 E.00126
G1 X127.018 Y129.506 E.26389
G1 X127.018 Y129.465 E.00126
G1 X128.114 Y129.465 E.03366
G1 X128.114 Y128.54 E.02842
G1 X131.243 Y128.54 E.09615
G1 X131.243 Y139.06 E.32325
G1 X128.114 Y139.06 E.09615
G1 X128.114 Y138.195 E.02658
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.018 Y138.135 E-.41695
G1 X127.018 Y138.094 E-.01558
G1 X127.018 Y137.232 E-.32747
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.647 Y139.19 Z12.2 F42000
G1 Z11.8
G1 E.8 F1800
G1 F4064
M204 S5000
G1 X131.347 Y139.19 E.17514
G1 X131.347 Y140.41 E.03749
G1 X125.647 Y140.41 E.17514
G1 X125.647 Y140.369 E.00126
G1 X125.647 Y139.25 E.03438
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.647 Y139.229 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.48 Y131.686 Z12.2 F42000
G1 X125.661 Y126.391 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4064
M204 S6000
G1 X125.661 Y116.009 E.34437
G1 X131.434 Y116.009 E.19149
G1 X131.434 Y126.391 E.34438
G1 X125.721 Y126.391 E.1895
M204 S10000
G1 X125.647 Y126.798 F42000
G1 F4064
M204 S6000
G1 X125.254 Y126.798 E.01302
G1 X125.254 Y115.602 E.37138
G1 X131.841 Y115.602 E.21849
G1 X131.841 Y126.798 E.37139
G1 X125.707 Y126.798 E.20349
; WIPE_START
G1 F8843.478
G1 X125.254 Y126.798 E-.17195
G1 X125.254 Y125.25 E-.58805
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.95 Y117.624 Z12.2 F42000
G1 X124.862 Y115.408 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4064
M204 S5000
G3 X125.058 Y115.21 I.204 J.006 E.00942
G1 X132.07 Y115.214 E.21546
G3 X132.212 Y115.318 I-.035 J.196 E.00558
G1 X132.215 Y115.323 E.00017
G3 X132.233 Y115.406 I-.185 J.084 E.00264
G1 X132.233 Y139.992 E.75545
G3 X132.23 Y140.629 I-4.311 J.3 E.01959
G1 X132.211 Y140.683 E.00177
G3 X132.041 Y140.79 I-.176 J-.092 E.00647
G1 X125.07 Y140.79 E.21419
G3 X124.862 Y140.59 I-.004 J-.204 E.00984
G1 X124.862 Y115.468 E.77194
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.879 Y115.326 E-.05424
G1 X124.916 Y115.272 E-.02489
G1 X124.993 Y115.223 E-.03478
G1 X125.058 Y115.21 E-.02536
G1 X126.692 Y115.211 E-.62073
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


G1 X129.687 Y116.777 F42000
G1 Z11.8
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F4064
M204 S6000
G1 X129.687 Y116.401 E.01155
G1 X126.053 Y116.401 E.11164
G1 X126.053 Y125.999 E.29489
G1 X129.483 Y125.999 E.10539
G1 X129.483 Y117.224 E.26963
G3 X129.687 Y116.916 I.869 J.355 E.0114
G1 X129.687 Y116.837 E.00243
M204 S10000
G1 X129.308 Y116.778 F42000
G1 F4064
M204 S6000
G1 X126.43 Y116.778 E.08843
G1 X126.43 Y125.622 E.27172
G1 X129.106 Y125.622 E.08222
G1 X129.106 Y117.224 E.25804
G1 X129.242 Y116.856 E.01205
G1 X129.269 Y116.824 E.00128
M204 S10000
G1 X128.754 Y117.155 F42000
G1 F4064
M204 S6000
G1 X126.807 Y117.156 E.05982
G1 X126.807 Y125.245 E.24855
G1 X128.729 Y125.245 E.05905
G1 X128.734 Y117.212 E.24682
M204 S10000
G1 X128.352 Y117.533 F42000
G1 F4064
M204 S6000
G1 X127.185 Y117.533 E.03588
G1 X127.185 Y124.868 E.22538
G1 X128.352 Y124.868 E.03588
G1 X128.352 Y117.593 E.22354
M204 S10000
G1 X127.966 Y117.919 F42000
; LINE_WIDTH: 0.43818
G1 F4064
M204 S6000
G1 X127.571 Y117.919 E.01273
G1 X127.571 Y124.481 E.21137
G1 X127.966 Y124.481 E.01273
G1 X127.966 Y117.979 E.20944
M204 S10000
G1 X130.079 Y116.837 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4064
M204 S6000
G3 X129.875 Y117.274 I-.32 J.117 E.01777
G1 X129.875 Y118.381 E.03671
G1 X129.965 Y118.31 E.00379
G1 X130.621 Y118.173 E.02221
G1 X131.086 Y118.287 E.01589
G1 X131.086 Y120.902 E.08674
G1 X130.621 Y120.793 E.01584
G1 X129.965 Y120.939 E.02226
G1 X129.875 Y121.01 E.0038
G1 X129.875 Y123.622 E.08663
G1 X129.965 Y123.552 E.00379
G1 X130.621 Y123.414 E.02221
G1 X131.086 Y123.529 E.01589
G1 X131.086 Y125.157 E.05401
; WIPE_START
G1 F8843.478
G1 X131.086 Y123.529 E-.61876
G1 X130.725 Y123.44 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.79 Y126.994 Z12.2 F42000
G1 Z11.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.538101
G1 F4064
M204 S6000
G1 X131.79 Y128.606 E.06504
G1 X131.773 Y128.681 E.00312
; LINE_WIDTH: 0.589075
G1 X131.755 Y128.757 E.00344
; LINE_WIDTH: 0.623584
G1 X131.738 Y128.832 E.00366
; LINE_WIDTH: 0.640713
G1 X131.738 Y138.768 E.48398
G1 X131.755 Y138.843 E.00377
; LINE_WIDTH: 0.589105
G1 X131.773 Y138.919 E.00344
; LINE_WIDTH: 0.554595
G1 X131.79 Y138.994 E.00323
; LINE_WIDTH: 0.537346
G1 X131.79 Y140.594 E.06444
; WIPE_START
G1 F7281.181
G1 X131.79 Y138.994 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.411 Y138.342 Z12.2 F42000
G1 Z11.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F4064
M204 S2000
G1 X127.899 Y138.831 E.02124
G1 X127.518 Y138.983
G1 X126.877 Y138.342 E.02782
G1 X126.478 Y138.476
G1 X126.984 Y138.983 E.022
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.478 Y138.476 E-.27203
G1 X126.877 Y138.342 E-.16003
G1 X127.488 Y138.953 E-.32794
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.254 Y140.594 Z12.2 F42000
G1 Z11.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.4354
G1 F4064
M204 S6000
G1 X125.254 Y138.994 E.05117
M204 S10000
G1 X125.755 Y138.594 F42000
; LINE_WIDTH: 0.63724
G1 F4064
M204 S6000
G1 X125.755 Y136.159 E.11792
M204 S10000
G1 X125.94 Y135.752 F42000
; LINE_WIDTH: 0.19387
G1 F4064
M204 S6000
G1 X125.94 Y131.848 E.04803
M204 S10000
G1 X125.755 Y131.441 F42000
; LINE_WIDTH: 0.63724
G1 F4064
M204 S6000
G1 X125.755 Y129.006 E.11792
M204 S10000
G1 X125.254 Y128.606 F42000
; LINE_WIDTH: 0.4354
G1 F4064
M204 S6000
G1 X125.254 Y126.994 E.05155
; WIPE_START
G1 F9172.442
G1 X125.254 Y128.606 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.284 Y128.617 Z12.2 F42000
G1 Z11.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F4064
M204 S2000
G1 X127.907 Y129.24 E.02705
G1 X127.391 Y129.258
G1 X126.751 Y128.617 E.02782
G1 X126.478 Y128.878
G1 X126.858 Y129.258 E.01651
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.478 Y128.878 E-.20412
G1 X126.751 Y128.617 E-.14332
G1 X127.391 Y129.258 E-.34406
G1 X127.571 Y129.251 E-.0685
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.775 Y128.841 Z12.2 F42000
G1 Z11.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0953381
G1 F4064
M204 S6000
G1 X127.694 Y128.72 E.00062
; LINE_WIDTH: 0.121754
G1 X127.612 Y128.599 E.00094
; CHANGE_LAYER
; Z_HEIGHT: 12
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X127.694 Y128.72 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 60/72
; update layer progress
M73 L60
M991 S0 P59 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z12.2 I.741 J-.965 P1  F42000
G1 X125.7 Y127.19 Z12.2
G1 Z12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4411
M204 S5000
G1 X131.4 Y127.19 E.17514
G1 X131.4 Y128.41 E.03749
G1 X125.7 Y128.41 E.17514
G1 X125.7 Y128.369 E.00126
G1 X125.7 Y127.25 E.03438
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.7 Y127.229 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.453 Y134.759 Z12.4 F42000
G1 X126.273 Y135.848 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4411
M204 S6000
G1 X126.273 Y135.956 E.00356
G1 X125.707 Y135.956 E.01878
G1 X125.707 Y131.644 E.14303
G1 X126.273 Y131.644 E.01878
G1 X126.273 Y135.788 E.13747
M204 S10000
G1 X126.68 Y136.353 F42000
G1 F4411
M204 S6000
G1 X126.68 Y136.363 E.00034
G1 X125.3 Y136.363 E.04578
G1 X125.3 Y131.237 E.17003
G1 X126.68 Y131.237 E.04578
G1 X126.68 Y136.293 E.1677
; WIPE_START
G1 F8843.478
G1 X126.68 Y136.363 E-.02669
G1 X125.3 Y136.363 E-.52445
G1 X125.3 Y135.813 E-.20886
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.368 Y138.135 Z12.4 F42000
G1 Z12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4411
M204 S5000
G1 X127.072 Y138.135 E.00908
M73 P87 R2
G1 X127.072 Y138.094 E.00126
G1 X127.072 Y129.506 E.26389
G1 X127.072 Y129.465 E.00126
G1 X127.368 Y129.465 E.00908
G1 X127.368 Y128.54 E.02842
G1 X131.297 Y128.54 E.12073
G1 X131.297 Y139.06 E.32325
G1 X127.368 Y139.06 E.12073
G1 X127.368 Y138.195 E.02658
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.072 Y138.135 E-.11461
G1 X127.072 Y138.094 E-.01558
G1 X127.072 Y136.437 E-.62981
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.7 Y139.19 Z12.4 F42000
G1 Z12
G1 E.8 F1800
G1 F4411
M204 S5000
G1 X131.4 Y139.19 E.17514
G1 X131.4 Y140.41 E.03749
G1 X125.7 Y140.41 E.17514
G1 X125.7 Y140.369 E.00126
G1 X125.7 Y139.25 E.03438
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.7 Y139.229 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.047 Y131.624 Z12.4 F42000
G1 X125.707 Y116.009 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4411
M204 S6000
G1 X131.481 Y116.01 E.19153
G1 X131.481 Y126.391 E.34437
G1 X125.707 Y126.391 E.19153
G1 X125.707 Y116.069 E.34238
M204 S10000
G1 X125.3 Y115.602 F42000
G1 F4411
M204 S6000
G1 X131.888 Y115.602 E.21854
G1 X131.888 Y126.798 E.37137
G1 X125.3 Y126.798 E.21854
G1 X125.3 Y115.662 E.36939
M204 S250
G1 X124.908 Y115.408 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4411
M204 S5000
G3 X125.104 Y115.21 I.204 J.006 E.00941
G1 X132.082 Y115.21 E.21443
G3 X132.257 Y115.321 I-.003 J.199 E.00668
G3 X132.275 Y115.37 I-.123 J.073 E.00162
G1 X132.28 Y139.934 E.75478
G3 X132.275 Y140.633 I-5.278 J.312 E.02152
G1 X132.264 Y140.664 E.00099
G3 X132.086 Y140.79 I-.185 J-.073 E.00709
G1 X125.116 Y140.79 E.21417
G3 X124.908 Y140.592 I-.004 J-.204 E.00978
G1 X124.908 Y115.468 E.77201
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.924 Y115.326 E-.05417
G1 X124.961 Y115.272 E-.02496
G1 X125.038 Y115.223 E-.0347
G1 X125.104 Y115.21 E-.02542
G1 X126.738 Y115.21 E-.62076
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


G1 X126.099 Y116.402 F42000
G1 Z12
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F4411
M204 S6000
G1 X126.099 Y125.999 E.29489
G1 X131.089 Y125.999 E.15332
G1 X131.089 Y116.402 E.29489
G1 X126.159 Y116.402 E.15147
M204 S10000
G1 X126.476 Y116.779 F42000
G1 F4411
M204 S6000
G1 X126.476 Y125.622 E.27172
G1 X130.712 Y125.622 E.13015
G1 X130.712 Y116.779 E.27172
G1 X126.536 Y116.779 E.1283
M204 S10000
G1 X126.853 Y117.156 F42000
G1 F4411
M204 S6000
G1 X126.853 Y125.245 E.24855
G1 X130.335 Y125.245 E.10698
G1 X130.335 Y117.156 E.24854
G1 X126.913 Y117.156 E.10513
M204 S10000
G1 X129.957 Y117.533 F42000
G1 F4411
M204 S6000
G1 X127.23 Y117.533 E.0838
G1 X127.23 Y124.868 E.22537
G1 X129.958 Y124.868 E.0838
G1 X129.957 Y117.593 E.22353
M204 S10000
G1 X129.58 Y117.91 F42000
G1 F4411
M204 S6000
G1 X127.607 Y117.91 E.06063
G1 X127.607 Y124.491 E.2022
G1 X129.58 Y124.491 E.06063
G1 X129.58 Y117.97 E.20036
M204 S10000
G1 X129.203 Y118.287 F42000
G1 F4411
M204 S6000
G1 X127.984 Y118.287 E.03746
G1 X127.984 Y124.113 E.17903
G1 X129.203 Y124.113 E.03746
G1 X129.203 Y118.347 E.17719
M204 S10000
G1 X128.804 Y118.686 F42000
; LINE_WIDTH: 0.463945
G1 F4411
M204 S6000
G1 X128.383 Y118.686 E.01444
G1 X128.383 Y123.714 E.17252
G1 X128.804 Y123.714 E.01445
G1 X128.804 Y118.746 E.17046
; WIPE_START
G1 F8550.572
G1 X128.804 Y120.746 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.84 Y126.994 Z12.4 F42000
G1 Z12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.531498
G1 F4411
M204 S6000
G1 X131.84 Y128.606 E.06418
G1 X131.823 Y128.681 E.00306
; LINE_WIDTH: 0.582488
G1 X131.806 Y128.756 E.00338
; LINE_WIDTH: 0.616994
G1 X131.788 Y128.831 E.0036
; LINE_WIDTH: 0.634164
G1 X131.788 Y138.769 E.47883
G1 X131.806 Y138.844 E.0037
; LINE_WIDTH: 0.582575
G1 X131.823 Y138.919 E.00338
; LINE_WIDTH: 0.548072
G1 X131.84 Y138.994 E.00316
; LINE_WIDTH: 0.530817
G1 X131.84 Y140.593 E.06359
; WIPE_START
G1 F7378.616
G1 X131.84 Y138.994 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.349 Y138.983 Z12.4 F42000
G1 Z12
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F4411
M204 S2000
G1 X126.99 Y138.342 E.02782
G1 X126.865 Y137.934
G1 X125.816 Y138.983 E.04556
G1 X125.732 Y138.534
G1 X126.865 Y137.401 E.04923
G1 X126.865 Y136.868
G1 X125.732 Y138.001 E.04923
G1 X125.732 Y137.467
G1 X126.614 Y136.585 E.03832
G1 X126.08 Y136.585
G1 X125.732 Y136.934 E.01515
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.08 Y136.585 E-.18734
G1 X126.614 Y136.585 E-.20264
G1 X125.925 Y137.274 E-.37002
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.179 Y138.598 Z12.4 F42000
G1 Z12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.231731
G1 F4411
M204 S6000
G1 X126.678 Y139.001 E.0099
M204 S10000
G1 X127.146 Y138.85 F42000
; LINE_WIDTH: 0.108647
G1 F4411
M204 S6000
G1 X127.146 Y138.324 E.00282
; WIPE_START
G1 F15000
G1 X127.146 Y138.85 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.705 Y138.96 Z12.4 F42000
G1 Z12
G1 E.8 F1800
; LINE_WIDTH: 0.469815
G1 F4411
M204 S6000
G1 X125.63 Y138.897 E.0034
; LINE_WIDTH: 0.519685
G1 X125.555 Y138.835 E.00379
; LINE_WIDTH: 0.569555
G1 X125.48 Y138.773 E.00419
; LINE_WIDTH: 0.643277
G1 X125.404 Y138.71 E.00478
G1 X125.404 Y136.559 E.10524
M204 S10000
G1 X125.99 Y135.752 F42000
; LINE_WIDTH: 0.20185
G1 F4411
M204 S6000
G1 X125.99 Y131.848 E.05057
M204 S10000
G1 X125.404 Y131.041 F42000
; LINE_WIDTH: 0.64436
G1 F4411
M204 S6000
G1 X125.404 Y128.89 E.10543
; LINE_WIDTH: 0.619429
G1 X125.48 Y128.827 E.00459
; LINE_WIDTH: 0.569558
G1 X125.555 Y128.765 E.00419
; LINE_WIDTH: 0.519687
G1 X125.63 Y128.703 E.00379
; LINE_WIDTH: 0.469816
G1 X125.705 Y128.64 E.0034
M204 S10000
G1 X125.364 Y128.776 F42000
; LINE_WIDTH: 0.54387
G1 F4411
M204 S6000
G1 X125.344 Y128.72 E.00246
; LINE_WIDTH: 0.503674
G1 X125.324 Y128.663 E.00226
; LINE_WIDTH: 0.444104
G1 X125.304 Y128.606 E.00197
G1 X125.304 Y126.994 E.0527
M204 S10000
G1 X125.364 Y128.776 F42000
; LINE_WIDTH: 0.584066
G1 F4411
M204 S6000
G1 X125.384 Y128.833 E.00265
; LINE_WIDTH: 0.624262
G1 X125.404 Y128.89 E.00285
; WIPE_START
G1 F6192.568
G1 X125.384 Y128.833 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.865 Y130.468 Z12.4 F42000
G1 Z12
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F4411
M204 S2000
G1 X126.318 Y131.015 E.02373
G1 X125.785 Y131.015
G1 X126.865 Y129.935 E.04691
G1 X126.865 Y129.402
G1 X125.732 Y130.535 E.04923
G1 X125.732 Y130.002
G1 X126.974 Y128.759 E.05398
G1 X126.583 Y128.617
G1 X125.732 Y129.468 E.03698
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.583 Y128.617 E-.45733
G1 X126.974 Y128.759 E-.15818
G1 X126.705 Y129.028 E-.14449
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.179 Y128.935 Z12.4 F42000
G1 Z12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.17079
G1 F4411
M204 S6000
G1 X126.821 Y129.269 E.0051
G1 X126.875 Y129.413 E.0016
M204 S10000
G1 X127.137 Y129.276 F42000
; LINE_WIDTH: 0.126923
G1 F4411
M204 S6000
G1 X127.137 Y128.75 E.0036
; WIPE_START
G1 F15000
G1 X127.137 Y129.276 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.758 Y136.783 Z12.4 F42000
G1 X125.404 Y138.71 Z12.4
G1 Z12
G1 E.8 F1800
; LINE_WIDTH: 0.624266
G1 F4411
M204 S6000
G1 X125.384 Y138.767 E.00285
; LINE_WIDTH: 0.584069
G1 X125.364 Y138.824 E.00265
; LINE_WIDTH: 0.543872
G1 X125.344 Y138.88 E.00246
; LINE_WIDTH: 0.503676
G1 X125.324 Y138.937 E.00226
; LINE_WIDTH: 0.444109
G1 X125.304 Y138.994 E.00197
G1 X125.304 Y140.594 E.05231
; CHANGE_LAYER
; Z_HEIGHT: 12.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8973.332
G1 X125.304 Y138.994 E-.73244
G1 X125.324 Y138.937 E-.02756
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 61/72
; update layer progress
M73 L61
M991 S0 P60 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z12.4 I-.115 J1.212 P1  F42000
G1 X126.621 Y139.06 Z12.4
G1 Z12.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4229
M204 S5000
G1 X126.621 Y128.54 E.32325
G1 X131.35 Y128.54 E.14531
G1 X131.35 Y139.06 E.32325
G1 X126.681 Y139.06 E.14347
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.67 Y137.06 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.964 Y129.46 Z12.6 F42000
G1 X125.754 Y127.19 Z12.6
G1 Z12.2
G1 E.8 F1800
G1 F4229
M204 S5000
G1 X131.454 Y127.19 E.17514
G1 X131.454 Y128.41 E.03749
G1 X125.754 Y128.41 E.17514
G1 X125.754 Y128.369 E.00126
G1 X125.754 Y127.25 E.03438
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.754 Y127.229 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.495 Y134.757 Z12.6 F42000
G1 X125.754 Y139.19 Z12.6
G1 Z12.2
G1 E.8 F1800
G1 F4229
M204 S5000
G1 X131.454 Y139.19 E.17514
G1 X131.454 Y140.41 E.03749
G1 X125.754 Y140.41 E.17514
G1 X125.754 Y140.369 E.00126
G1 X125.754 Y139.25 E.03438
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.754 Y139.229 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.579 Y131.687 Z12.6 F42000
G1 X125.754 Y126.391 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4229
M204 S6000
M73 P88 R2
G1 X125.752 Y126.391 E.00005
G1 X125.752 Y116.009 E.34437
G1 X131.532 Y116.009 E.19171
G1 X131.532 Y126.391 E.34438
G1 X125.814 Y126.391 E.18967
; WIPE_START
G1 F8843.478
G1 X125.752 Y126.391 E-.02332
G1 X125.752 Y124.452 E-.73668
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.402 Y116.828 Z12.6 F42000
G1 X125.345 Y115.602 Z12.6
G1 Z12.2
G1 E.8 F1800
G1 F4229
M204 S6000
G1 X131.939 Y115.61 E.21871
G1 X131.939 Y126.798 E.37114
G1 X125.345 Y126.798 E.21872
G1 X125.345 Y115.662 E.36939
M204 S250
G1 X124.958 Y115.36 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4229
M204 S5000
G3 X125.149 Y115.21 I.202 J.061 E.00794
G1 X131.833 Y115.216 E.20538
G3 X132.195 Y115.25 I.1 J.871 E.01125
G1 X132.216 Y115.262 E.00073
G3 X132.321 Y115.42 I-.153 J.215 E.00597
G1 X132.323 Y115.426 E.00019
G1 X132.328 Y115.465 E.00122
G3 X132.331 Y116.113 I-6.885 J.348 E.01991
G1 X132.331 Y139.726 E.72556
G3 X132.328 Y140.535 I-21.593 J.335 E.02486
G1 X132.323 Y140.574 E.00122
G1 X132.321 Y140.58 E.00019
G3 X132.065 Y140.775 I-.238 J-.047 E.01081
G3 X131.466 Y140.79 I-.595 J-11.494 E.01842
G1 X125.16 Y140.79 E.19375
G3 X124.953 Y140.59 I-.004 J-.203 E.00981
G1 X124.958 Y115.42 E.77343
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.025 Y115.255 E-.06742
G1 X125.149 Y115.21 E-.05027
G1 X126.84 Y115.212 E-.64232
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


G1 X128.43 Y123.713 F42000
G1 Z12.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.466585
G1 F4229
M204 S6000
G1 X128.854 Y123.713 E.01463
G1 X128.854 Y118.687 E.17351
G1 X128.43 Y118.687 E.01463
G1 X128.43 Y123.653 E.17144
M204 S10000
G1 X128.03 Y124.113 F42000
; LINE_WIDTH: 0.41999
G1 F4229
M204 S6000
G1 X129.254 Y124.113 E.03762
G1 X129.254 Y118.287 E.17904
G1 X128.03 Y118.287 E.03762
G1 X128.03 Y124.053 E.17719
M204 S10000
G1 X127.653 Y124.491 F42000
G1 F4229
M204 S6000
G1 X129.631 Y124.491 E.0608
G1 X129.631 Y117.91 E.20221
G1 X127.653 Y117.91 E.06079
G1 X127.653 Y124.431 E.20036
M204 S10000
G1 X127.276 Y124.868 F42000
G1 F4229
M204 S6000
G1 X130.008 Y124.868 E.08397
G1 X130.008 Y117.532 E.22538
G1 X127.276 Y117.533 E.08396
G1 X127.276 Y124.808 E.22353
M204 S10000
G1 X126.899 Y125.245 F42000
G1 F4229
M204 S6000
G1 X130.386 Y125.245 E.10714
G1 X130.385 Y117.155 E.24855
G1 X126.899 Y117.156 E.10714
G1 X126.899 Y125.185 E.24671
M204 S10000
G1 X126.522 Y125.622 F42000
G1 F4229
M204 S6000
G1 X130.763 Y125.622 E.13031
G1 X130.762 Y116.778 E.27173
G1 X126.522 Y116.779 E.13031
G1 X126.522 Y125.562 E.26988
M204 S10000
G1 X126.145 Y125.999 F42000
G1 F4229
M204 S6000
G1 X131.14 Y125.999 E.15348
G1 X131.14 Y116.401 E.2949
G1 X126.145 Y116.401 E.15348
G1 X126.145 Y125.939 E.29305
; WIPE_START
G1 F9547.299
G1 X126.145 Y123.939 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.414 Y129.347 Z12.6 F42000
G1 Z12.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F4229
M204 S2000
G1 X125.684 Y128.617 E.03169
G1 X125.546 Y128.479
G1 X125.161 Y128.094 E.01676
G1 X125.161 Y128.627
G1 X126.414 Y129.88 E.05445
G1 X126.414 Y130.413
G1 X125.161 Y129.16 E.05445
G1 X125.161 Y129.693
G1 X126.414 Y130.947 E.05445
G1 X126.414 Y131.48
G1 X125.161 Y130.227 E.05445
G1 X125.161 Y130.76
G1 X126.414 Y132.013 E.05445
G1 X126.414 Y132.546
G1 X125.161 Y131.293 E.05445
G1 X125.161 Y131.826
G1 X126.414 Y133.08 E.05445
G1 X126.414 Y133.613
G1 X125.161 Y132.36 E.05445
G1 X125.161 Y132.893
G1 X126.414 Y134.146 E.05445
G1 X126.414 Y134.679
G1 X125.161 Y133.426 E.05445
G1 X125.161 Y133.96
G1 X126.414 Y135.213 E.05445
G1 X126.414 Y135.746
G1 X125.161 Y134.493 E.05445
G1 X125.161 Y135.026
G1 X126.414 Y136.279 E.05445
G1 X126.414 Y136.812
G1 X125.161 Y135.559 E.05445
G1 X125.161 Y136.093
G1 X126.414 Y137.346 E.05445
G1 X126.414 Y137.879
G1 X125.161 Y136.626 E.05445
G1 X125.161 Y137.159
G1 X126.414 Y138.412 E.05445
G1 X126.3 Y138.831
G1 X125.161 Y137.692 E.04949
G1 X125.161 Y138.226
G1 X125.918 Y138.983 E.0329
G1 X125.546 Y139.145
G1 X125.161 Y138.759 E.01676
G1 X125.161 Y139.292
G1 X125.546 Y139.678 E.01676
M204 S10000
G1 X125.565 Y139.664 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.224432
G1 F4229
M204 S6000
G1 X125.475 Y139.878 E.00343
G1 X125.142 Y139.874 E.00492
; WIPE_START
G1 F15000
G1 X125.475 Y139.878 E-.44798
G1 X125.565 Y139.664 E-.31202
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.227 Y138.929 Z12.6 F42000
G1 Z12.2
G1 E.8 F1800
; LINE_WIDTH: 0.0933614
G1 F4229
M204 S6000
G3 X126.129 Y139.001 I-.103 J-.037 E.00053
; WIPE_START
G1 F15000
G1 X126.198 Y138.973 E-.44564
G1 X126.227 Y138.929 E-.31436
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.384 Y131.299 Z12.6 F42000
G1 X126.433 Y128.954 Z12.6
G1 Z12.2
G1 E.8 F1800
; LINE_WIDTH: 0.196161
G1 F4229
M204 S6000
G1 X125.991 Y128.599 E.00708
M204 S10000
G1 X125.565 Y128.175 F42000
; LINE_WIDTH: 0.380389
G1 F4229
M204 S6000
G1 X125.388 Y127.809 E.01119
G1 X125.306 Y127.796 E.00226
; LINE_WIDTH: 0.3532
G1 X125.265 Y127.851 E.00174
; LINE_WIDTH: 0.315509
G1 X125.224 Y127.906 E.00153
; LINE_WIDTH: 0.277817
G1 X125.183 Y127.962 E.00132
; LINE_WIDTH: 0.240126
G1 X125.142 Y128.017 E.00111
; WIPE_START
G1 F15000
G1 X125.183 Y127.962 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.841 Y128.83 Z12.6 F42000
G1 Z12.2
G1 E.8 F1800
; LINE_WIDTH: 0.614322
G1 F4229
M204 S6000
G1 X131.858 Y128.755 E.00357
; LINE_WIDTH: 0.579812
G1 X131.875 Y128.681 E.00335
; LINE_WIDTH: 0.528827
G1 X131.892 Y128.606 E.00304
G1 X131.892 Y126.994 E.06383
M204 S10000
G1 X131.841 Y128.83 F42000
; LINE_WIDTH: 0.631515
G1 F4229
M204 S6000
G1 X131.841 Y138.77 E.47674
G1 X131.858 Y138.845 E.00368
; LINE_WIDTH: 0.579958
G1 X131.875 Y138.919 E.00336
; LINE_WIDTH: 0.545453
G1 X131.892 Y138.994 E.00314
; LINE_WIDTH: 0.528198
G3 X131.891 Y140.584 I-150.552 J.666 E.06288
; CHANGE_LAYER
; Z_HEIGHT: 12.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7418.432
G1 X131.892 Y138.994 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 62/72
; update layer progress
M73 L62
M991 S0 P61 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z12.6 I-.013 J-1.217 P1  F42000
G1 X125.911 Y139.06 Z12.6
G1 Z12.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3480
M204 S5000
G1 X125.911 Y128.54 E.32325
G1 X131.404 Y128.54 E.16878
G1 X131.404 Y139.06 E.32325
G1 X125.971 Y139.06 E.16694
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.96 Y137.06 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.842 Y129.428 Z12.8 F42000
G1 X125.807 Y127.19 Z12.8
G1 Z12.4
G1 E.8 F1800
G1 F3480
M204 S5000
G1 X130.131 Y127.19 E.13286
G1 X130.531 Y127.19 E.01229
G1 X130.931 Y127.19 E.01229
G1 F2049.099
G1 X130.931 Y127.231 E.00126
M106 S255
G1 F1800
G1 X130.931 Y127.6 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X130.931 Y128 E.01327
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X130.931 Y128.369 E.01134
M106 S201.45
G1 F2049.099
G1 X130.931 Y128.41 E.00126
G1 F3480
G1 X130.531 Y128.41 E.01229
G1 X130.131 Y128.41 E.01229
G1 X125.807 Y128.41 E.13286
G1 X125.807 Y128.369 E.00126
G1 X125.807 Y127.25 E.03438
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.807 Y127.222 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.549 Y134.75 Z12.8 F42000
G1 X125.807 Y139.19 Z12.8
G1 Z12.4
G1 E.8 F1800
G1 F3480
M204 S5000
G1 X130.131 Y139.19 E.13286
G1 X130.531 Y139.19 E.01229
G1 X130.931 Y139.19 E.01229
G1 F2049.036
G1 X130.931 Y139.231 E.00126
M106 S255
G1 F1800
G1 X130.931 Y139.6 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X130.931 Y140 E.01327
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X130.931 Y140.369 E.01134
M106 S201.45
G1 F2049.099
G1 X130.931 Y140.41 E.00126
G1 F3480
G1 X130.531 Y140.41 E.01229
G1 X130.131 Y140.41 E.01229
G1 X125.807 Y140.41 E.13286
G1 X125.807 Y140.369 E.00126
G1 X125.807 Y139.25 E.03438
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.807 Y139.222 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.323 Y139.452 Z12.8 F42000
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3480
M204 S6000
G1 X131.426 Y139.452 E.00342
G1 X131.982 Y139.452 E.01844
G1 X131.982 Y140.19 E.02449
G1 X131.978 Y140.325 E.00446
G1 X131.426 Y140.376 E.01838
G1 X131.343 Y140.382 E.00277
G1 F3151.842
G1 X131.323 Y140.382 E.00066
G1 F3000
G1 X131.323 Y139.512 E.02887
; WIPE_START
G1 X131.426 Y139.452 E-.04529
M73 P89 R2
G1 X131.982 Y139.452 E-.21125
G1 X131.982 Y140.19 E-.2805
G1 X131.978 Y140.325 E-.05108
G1 X131.528 Y140.366 E-.17187
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.78 Y132.937 Z12.8 F42000
G1 X125.798 Y116.009 Z12.8
G1 Z12.4
G1 E.8 F1800
G1 F3480
M204 S6000
G1 X131.172 Y116.019 E.17827
G1 X131.575 Y116.043 E.01339
G1 X131.575 Y126.391 E.34327
G1 X125.798 Y126.391 E.19164
G1 X125.798 Y116.069 E.34238
M204 S10000
G1 X125.391 Y115.602 F42000
G1 F3480
M204 S6000
G1 X131.188 Y115.612 E.19231
G3 X131.978 Y115.676 I-.435 J10.265 E.02629
G1 X131.982 Y128.148 E.41372
G1 X131.426 Y128.148 E.01844
G1 X131.323 Y128.148 E.00342
G1 F3000
G1 X131.323 Y127.217 E.03086
G1 F3480
G1 X131.323 Y126.798 E.01392
G1 X130.923 Y126.798 E.01327
G1 X125.391 Y126.798 E.18352
G1 X125.391 Y115.662 E.36939
M204 S250
G1 X125.011 Y115.341 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3480
M204 S5000
G3 X125.197 Y115.21 I.186 J.067 E.00745
G1 X131.204 Y115.22 E.18459
G3 X132.224 Y115.331 I.056 J4.213 E.03159
G3 X132.372 Y115.722 I-.309 J.34 E.01333
G3 X132.374 Y116.404 I-10.99 J.381 E.02094
G1 X132.374 Y139.596 E.71265
G3 X132.372 Y140.266 I-10.831 J.3 E.02058
G3 X132.197 Y140.683 I-.429 J.066 E.01463
G3 X130.719 Y140.79 I-1.313 J-7.908 E.04562
G1 X125.21 Y140.79 E.16926
G3 X124.999 Y140.591 I-.013 J-.198 E.01001
G1 X124.999 Y115.41 E.77372
G3 X124.999 Y115.4 I.198 J-.002 E.00031
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.065 Y115.26 E-.05866
G1 X125.121 Y115.226 E-.02534
G1 X125.197 Y115.21 E-.02931
G1 X126.899 Y115.213 E-.6467
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


G1 X126.146 Y116.835 F42000
G1 Z12.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3480
M204 S6000
G1 X126.146 Y116.358 E.01582
G1 X127.298 Y116.36 E.03819
G1 X127.923 Y116.92 E.02784
G1 X127.923 Y119.633 E.09
G3 X127.017 Y119.909 I-1.094 J-1.969 E.03166
G1 X126.69 Y119.745 E.01215
G1 X126.146 Y118.788 E.03649
G1 X126.146 Y120.402 E.05353
G3 X126.69 Y120.532 I.181 J.445 E.01978
G1 X127.345 Y121.685 E.04399
G1 X127.923 Y122.161 E.02486
G1 X127.923 Y124.874 E.09
G3 X127.017 Y125.15 I-1.094 J-1.969 E.03166
G1 X126.69 Y124.986 E.01215
G1 X126.146 Y124.03 E.03649
G1 X126.146 Y125.643 E.05353
G3 X126.948 Y126.043 I.089 J.825 E.03137
G1 X127.923 Y126.043 E.03236
G1 X127.923 Y125.39 E.02165
M204 S10000
G1 X129.504 Y124.811 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.53398
G1 F3480
M204 S6000
G1 X129.995 Y124.811 E.01965
G1 X129.995 Y117.597 E.28865
G1 X129.504 Y117.596 E.01965
G1 X129.504 Y124.751 E.28629
M204 S10000
G1 X129.07 Y125.245 F42000
; LINE_WIDTH: 0.41999
G1 F3480
M204 S6000
G1 X130.429 Y125.245 E.04176
G1 X130.429 Y117.164 E.2483
G1 X129.07 Y117.161 E.04176
G1 X129.07 Y125.185 E.24653
M204 S10000
G1 X128.693 Y125.622 F42000
G1 F3480
M204 S6000
G1 X130.806 Y125.622 E.06494
G1 X130.806 Y116.787 E.27145
G1 X128.693 Y116.784 E.06494
G1 X128.693 Y125.562 E.26972
M204 S10000
G1 X128.316 Y125.999 F42000
G1 F3480
M204 S6000
G1 X131.183 Y125.999 E.08811
G1 X131.183 Y116.434 E.29388
G1 X131.159 Y116.411 E.00103
G1 X128.316 Y116.406 E.08738
G1 X128.316 Y125.939 E.29291
; WIPE_START
G1 F9547.299
G1 X128.316 Y123.939 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.403 Y126.994 Z12.8 F42000
G1 Z12.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.460092
G1 F3480
M204 S6000
G1 X125.403 Y128.606 E.0548
G1 X125.42 Y128.675 E.00242
; LINE_WIDTH: 0.51113
G1 X125.438 Y128.744 E.00272
; LINE_WIDTH: 0.545644
G1 X125.455 Y128.814 E.00292
; LINE_WIDTH: 0.540535
G1 X125.492 Y128.789 E.00181
; LINE_WIDTH: 0.495834
G1 X125.529 Y128.764 E.00165
; LINE_WIDTH: 0.451134
G1 X125.566 Y128.74 E.00148
; LINE_WIDTH: 0.406433
G1 X125.603 Y128.715 E.00132
; LINE_WIDTH: 0.361732
G1 X125.641 Y128.69 E.00116
; LINE_WIDTH: 0.317032
G1 X125.678 Y128.665 E.001
; LINE_WIDTH: 0.272331
G1 X125.715 Y128.641 E.00083
M204 S10000
G1 X125.455 Y128.814 F42000
; LINE_WIDTH: 0.562791
G1 F3480
M204 S6000
G1 X125.455 Y138.786 E.42247
G1 X125.492 Y138.811 E.00189
; LINE_WIDTH: 0.49583
G1 X125.529 Y138.836 E.00165
; LINE_WIDTH: 0.45113
G1 X125.566 Y138.86 E.00148
; LINE_WIDTH: 0.40643
G1 X125.603 Y138.885 E.00132
; LINE_WIDTH: 0.36173
G1 X125.641 Y138.91 E.00116
; LINE_WIDTH: 0.31703
G1 X125.678 Y138.935 E.001
; LINE_WIDTH: 0.27233
G1 X125.715 Y138.959 E.00083
M204 S10000
G1 X125.438 Y138.856 F42000
; LINE_WIDTH: 0.511123
G1 F3480
M204 S6000
G1 X125.42 Y138.925 E.00272
; LINE_WIDTH: 0.460097
G1 X125.403 Y138.994 E.00243
G1 X125.403 Y140.594 E.05439
M204 S10000
G1 X125.438 Y138.856 F42000
; LINE_WIDTH: 0.545631
G1 F3480
M204 S6000
G1 X125.455 Y138.786 E.00292
; WIPE_START
G1 F7161.171
G1 X125.438 Y138.856 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.889 Y139.256 Z12.8 F42000
G1 Z12.4
G1 E.8 F1800
; LINE_WIDTH: 0.62129
G1 F3480
M204 S6000
G1 X131.889 Y128.344 E.51427
M204 S10000
G1 X131.653 Y127.944 F42000
; LINE_WIDTH: 0.29476
G1 F3480
M204 S6000
G1 X131.653 Y126.594 E.0277
; CHANGE_LAYER
; Z_HEIGHT: 12.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F14294.789
G1 X131.653 Y127.944 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 63/72
; update layer progress
M73 L63
M991 S0 P62 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z12.8 I.157 J-1.207 P1  F42000
G1 X125.861 Y127.19 Z12.8
G1 Z12.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4082
M204 S5000
G1 X129.385 Y127.19 E.10828
G1 X129.785 Y127.19 E.01229
G1 X130.185 Y127.19 E.01229
G1 F2049.099
G1 X130.185 Y127.231 E.00126
M106 S255
G1 F1800
G1 X130.185 Y127.6 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X130.185 Y128 E.01327
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X130.185 Y128.369 E.01134
M106 S201.45
G1 F2049.099
G1 X130.185 Y128.41 E.00126
G1 F4082
G1 X129.785 Y128.41 E.01229
G1 X129.385 Y128.41 E.01229
G1 X125.861 Y128.41 E.10828
G1 X125.861 Y128.369 E.00126
G1 X125.861 Y127.25 E.03438
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.861 Y127.216 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.654 Y134.752 Z13 F42000
G1 X125.965 Y139.06 Z13
G1 Z12.6
G1 E.8 F1800
G1 F4082
M204 S5000
G1 X125.965 Y139.019 E.00126
G1 X125.965 Y128.581 E.32073
G1 X125.965 Y128.54 E.00126
G1 X129.964 Y128.54 E.1229
G1 X130.364 Y128.54 E.01229
G1 X130.764 Y128.54 E.01229
G1 F3192.872
G1 X130.764 Y128.581 E.00126
G1 F2880
G1 X130.764 Y128.79 E.00642
M106 S255
G1 F1560
G1 X131.199 Y128.79 E.01334
M106 S201.45
G1 F2160
M73 P89 R1
G1 X131.199 Y129.19 E.01229
G1 X131.199 Y138.41 E.2833
G1 X131.199 Y138.81 E.01229
M106 S255
G1 F1560
G1 X130.764 Y138.81 E.01334
M106 S201.45
G1 F2880
G1 X130.764 Y139.019 E.00642
G1 F3192.95
G1 X130.764 Y139.06 E.00126
G1 F4082
G1 X130.364 Y139.06 E.01229
G1 X129.964 Y139.06 E.01229
G1 X126.025 Y139.06 E.12106
M204 S250
G1 X125.861 Y139.19 F42000
G1 F4082
M204 S5000
G1 X129.385 Y139.19 E.10828
G1 X129.785 Y139.19 E.01229
G1 X130.185 Y139.19 E.01229
G1 F2049.036
G1 X130.185 Y139.231 E.00126
M106 S255
G1 F1800
G1 X130.185 Y139.6 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X130.185 Y140 E.01327
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X130.185 Y140.369 E.01134
M106 S201.45
G1 F2049.099
G1 X130.185 Y140.41 E.00126
G1 F4082
G1 X129.785 Y140.41 E.01229
G1 X129.385 Y140.41 E.01229
G1 X125.861 Y140.41 E.10828
G1 X125.861 Y140.369 E.00126
G1 X125.861 Y139.25 E.03438
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.861 Y139.216 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.2 Y131.612 Z13 F42000
G1 X125.844 Y116.01 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4082
M204 S6000
G1 X130.3 Y116.014 E.14783
G3 X131.534 Y116.132 I-.267 J9.283 E.04114
G1 X131.534 Y127.741 E.38507
G1 X130.984 Y127.741 E.01824
G1 X130.984 Y126.391 E.04478
G1 X125.844 Y126.391 E.17051
G1 X125.844 Y116.07 E.34236
M204 S10000
G1 X125.437 Y115.603 F42000
G1 F4082
M204 S6000
G1 X130.312 Y115.607 E.16172
G3 X131.941 Y115.799 I-.355 J10.02 E.05447
G1 X131.941 Y140.202 E.80947
G3 X131.585 Y140.271 I-1.711 J-7.839 E.01205
G1 X131.301 Y140.308 E.0095
G1 X130.904 Y140.358 E.01327
G1 F2227.45
G1 X130.577 Y140.381 E.01087
M106 S255
G1 F600
G1 X130.577 Y139.452 E.03081
M106 S201.45
G1 F2160
G1 X130.904 Y139.452 E.01084
G1 F4082
G1 X131.156 Y139.452 E.00838
G1 X131.156 Y139.202 E.00829
G1 X131.591 Y139.202 E.0144
G1 X131.591 Y128.398 E.35839
G1 X131.156 Y128.398 E.0144
G1 X131.156 Y128.148 E.00829
G1 X130.904 Y128.148 E.00838
G1 F2160
G1 X130.577 Y128.148 E.01084
M106 S255
G1 F600
G1 X130.577 Y127.217 E.03086
M106 S201.45
G1 F2869.055
G1 X130.577 Y126.798 E.01392
G1 F4082
G1 X130.177 Y126.798 E.01327
G1 X129.777 Y126.798 E.01327
G1 X125.437 Y126.798 E.14398
G1 X125.437 Y115.663 E.36936
M204 S250
G1 X125.056 Y115.341 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4082
M204 S5000
G3 X125.229 Y115.211 I.185 J.067 E.00704
G1 X130.324 Y115.215 E.15653
G3 X132.213 Y115.475 I.008 J6.948 E.05877
G3 X132.333 Y115.805 I-.306 J.299 E.01113
G1 X132.333 Y140.191 E.74931
G3 X132.163 Y140.547 I-.337 J.058 E.01294
G3 X130.121 Y140.789 I-2.131 J-9.258 E.06331
G1 X125.255 Y140.79 E.14953
G3 X125.045 Y140.591 I-.011 J-.198 E.00997
G1 X125.045 Y115.41 E.77373
G3 X125.045 Y115.4 I.197 J-.002 E.00031
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.087 Y115.284 E-.0469
G1 X125.137 Y115.241 E-.02527
G1 X125.229 Y115.211 E-.03676
G1 X126.943 Y115.213 E-.65107
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


G1 X130.774 Y125.999 F42000
G1 Z12.6
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F4082
M204 S6000
G1 X130.846 Y125.835 E.00549
G1 X131.142 Y125.795 E.00916
G1 X131.142 Y116.484 E.2861
G1 X130.286 Y116.406 E.0264
G1 X126.236 Y116.403 E.12445
G1 X126.236 Y125.999 E.29486
G1 X130.714 Y125.999 E.1376
M204 S10000
G1 X126.613 Y125.622 F42000
G1 F4082
M204 S6000
G1 X130.573 Y125.622 E.12169
G1 X130.614 Y125.538 E.00285
G1 X130.765 Y125.486 E.0049
G1 X130.765 Y116.829 E.26603
G1 X130.245 Y116.783 E.01602
G1 X126.613 Y116.78 E.11161
G1 X126.613 Y125.562 E.26983
M204 S10000
G1 X126.99 Y125.245 F42000
G1 F4082
M204 S6000
G1 X130.38 Y125.245 E.10417
G1 X130.388 Y125.229 E.00053
M73 P90 R1
G1 X130.388 Y117.173 E.24754
G1 X126.99 Y117.157 E.1044
G1 X126.99 Y125.185 E.24665
M204 S10000
G1 X127.367 Y124.868 F42000
G1 F4082
M204 S6000
G1 X130.011 Y124.868 E.08123
G1 X130.011 Y117.537 E.22524
G1 X127.367 Y117.535 E.08123
G1 X127.367 Y124.808 E.22347
M204 S10000
G1 X129.633 Y117.914 F42000
G1 F4082
M204 S6000
G1 X127.744 Y117.912 E.05806
G1 X127.744 Y124.491 E.20213
G1 X129.633 Y124.491 E.05806
G1 X129.633 Y117.974 E.20023
M204 S10000
G1 X129.256 Y118.291 F42000
G1 F4082
M204 S6000
G1 X128.121 Y118.29 E.03488
G1 X128.121 Y124.113 E.17895
G1 X129.256 Y124.113 E.03488
G1 X129.256 Y118.351 E.17707
M204 S10000
G1 X128.878 Y118.668 F42000
; LINE_WIDTH: 0.42205
G1 F4082
M204 S6000
G1 X128.499 Y118.668 E.01171
G1 X128.499 Y123.735 E.15655
G1 X128.878 Y123.735 E.01171
G1 X128.878 Y118.728 E.15469
M204 S10000
G1 X131.259 Y126.187 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.185761
G1 F4082
M204 S6000
G1 X131.259 Y127.537 E.01571
; WIPE_START
G1 F15000
G1 X131.259 Y126.187 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.453 Y126.994 Z13 F42000
G1 Z12.6
G1 E.8 F1800
; LINE_WIDTH: 0.468088
G1 F4082
M204 S6000
G1 X125.453 Y128.606 E.05585
G1 X125.47 Y128.676 E.00249
; LINE_WIDTH: 0.51912
G1 X125.487 Y128.746 E.00279
; LINE_WIDTH: 0.553627
G1 X125.505 Y128.816 E.003
; LINE_WIDTH: 0.547956
G1 X125.542 Y128.791 E.00186
; LINE_WIDTH: 0.502114
G1 X125.58 Y128.766 E.00169
; LINE_WIDTH: 0.456272
G1 X125.618 Y128.741 E.00152
; LINE_WIDTH: 0.410429
G1 X125.655 Y128.716 E.00135
; LINE_WIDTH: 0.364587
G1 X125.693 Y128.691 E.00118
; LINE_WIDTH: 0.318744
G1 X125.731 Y128.666 E.00102
; LINE_WIDTH: 0.272902
G1 X125.768 Y128.641 E.00085
M204 S10000
G1 X125.505 Y128.816 F42000
; LINE_WIDTH: 0.570777
G1 F4082
M204 S6000
G1 X125.505 Y138.784 E.42879
G1 X125.542 Y138.809 E.00194
; LINE_WIDTH: 0.502116
G1 X125.58 Y138.834 E.00169
; LINE_WIDTH: 0.456273
G1 X125.618 Y138.859 E.00152
; LINE_WIDTH: 0.41043
G1 X125.655 Y138.884 E.00135
; LINE_WIDTH: 0.364588
G1 X125.693 Y138.909 E.00119
; LINE_WIDTH: 0.318745
G1 X125.731 Y138.934 E.00102
; LINE_WIDTH: 0.272902
G1 X125.768 Y138.959 E.00085
M204 S10000
G1 X125.505 Y138.784 F42000
; LINE_WIDTH: 0.553621
G1 F4082
M204 S6000
G1 X125.487 Y138.854 E.00299
; LINE_WIDTH: 0.519109
G1 X125.47 Y138.924 E.00279
; LINE_WIDTH: 0.468093
G1 X125.453 Y138.994 E.00249
G1 X125.453 Y140.594 E.05543
; CHANGE_LAYER
; Z_HEIGHT: 12.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8467.152
G1 X125.453 Y138.994 E-.72728
G1 X125.47 Y138.924 E-.03272
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 64/72
; update layer progress
M73 L64
M991 S0 P63 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z13 I1.216 J.046 P1  F42000
G1 X125.915 Y127.19 Z13
G1 Z12.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4350
M204 S5000
G1 X128.638 Y127.19 E.08369
G1 X129.038 Y127.19 E.01229
G1 X129.438 Y127.19 E.01229
G1 F2049.099
G1 X129.438 Y127.231 E.00126
M106 S255
G1 F1800
G1 X129.438 Y127.6 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X129.438 Y128 E.01327
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X129.438 Y128.369 E.01134
M106 S201.45
G1 F2049.099
G1 X129.438 Y128.41 E.00126
G1 F4350
G1 X129.038 Y128.41 E.01229
G1 X128.638 Y128.41 E.01229
G1 X125.915 Y128.41 E.08369
G1 X125.915 Y128.369 E.00126
G1 X125.915 Y127.25 E.03438
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.914 Y127.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.709 Y134.743 Z13.2 F42000
G1 X126.018 Y139.06 Z13.2
G1 Z12.8
G1 E.8 F1800
G1 F4350
M204 S5000
G1 X126.018 Y139.019 E.00126
G1 X126.018 Y128.581 E.32073
G1 X126.018 Y128.54 E.00126
G1 X129.218 Y128.54 E.09832
G1 X129.618 Y128.54 E.01229
G1 X130.018 Y128.54 E.01229
G1 F3192.872
G1 X130.018 Y128.581 E.00126
G1 F2880
G1 X130.018 Y128.79 E.00642
M106 S255
G1 F1560
G1 X130.723 Y128.79 E.02168
M106 S201.45
G1 F4350
G1 X131.252 Y128.79 E.01625
G1 X131.252 Y129.19 E.01229
G1 X131.252 Y138.41 E.2833
G1 X131.252 Y138.81 E.01229
G1 X130.723 Y138.81 E.01625
M106 S255
G1 F1560
G1 X130.018 Y138.81 E.02168
M106 S201.45
G1 F2880
G1 X130.018 Y139.019 E.00642
G1 F3192.95
G1 X130.018 Y139.06 E.00126
G1 F4350
G1 X129.618 Y139.06 E.01229
G1 X129.218 Y139.06 E.01229
G1 X126.078 Y139.06 E.09648
M204 S250
G1 X125.915 Y139.19 F42000
G1 F4350
M204 S5000
G1 X128.638 Y139.19 E.08369
G1 X129.038 Y139.19 E.01229
G1 X129.438 Y139.19 E.01229
G1 F2049.036
G1 X129.438 Y139.231 E.00126
M106 S255
G1 F1800
G1 X129.438 Y139.6 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X129.438 Y140 E.01327
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X129.438 Y140.369 E.01134
M106 S201.45
G1 F2049.099
G1 X129.438 Y140.41 E.00126
G1 F4350
G1 X129.038 Y140.41 E.01229
G1 X128.638 Y140.41 E.01229
G1 X125.915 Y140.41 E.08369
G1 X125.915 Y140.369 E.00126
G1 X125.915 Y139.25 E.03438
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.914 Y139.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.83 Y139.452 Z13.2 F42000
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2160
M204 S6000
G1 X130.157 Y139.452 E.01084
G1 F2854.356
G1 X130.258 Y139.452 E.00333
G1 F4350
G1 X130.258 Y139.852 E.01327
G1 X130.258 Y140.349 E.01647
G1 F2935.462
G1 X130.157 Y140.358 E.00334
G1 F2227.736
G1 X130.098 Y140.364 E.00197
G1 F1857.084
G1 X129.83 Y140.382 E.00891
M106 S255
G1 F600
G1 X129.83 Y139.512 E.02885
M106 S201.45
; WIPE_START
G1 X130.157 Y139.452 E-.12627
G1 X130.258 Y139.452 E-.03812
G1 X130.258 Y139.852 E-.152
G1 X130.258 Y140.349 E-.18873
G1 X130.157 Y140.358 E-.03829
G1 X130.098 Y140.364 E-.02252
G1 X129.83 Y140.382 E-.10201
G1 X129.83 Y140.139 E-.09206
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.6 Y132.607 Z13.2 F42000
G1 X125.889 Y116.01 Z13.2
G1 Z12.8
G1 E.8 F1800
G1 F4350
M204 S6000
G1 X129.579 Y116.015 E.12239
G1 X129.844 Y116.027 E.0088
G1 X129.843 Y126.391 E.3438
G1 X125.889 Y126.391 E.13116
G1 X125.889 Y116.07 E.34236
M204 S10000
G1 X125.482 Y115.603 F42000
G1 F4350
M204 S6000
G1 X129.591 Y115.608 E.13631
G3 X130.233 Y115.649 I-.383 J11.066 E.02132
G1 X130.251 Y115.858 E.00696
G1 X130.257 Y127.348 E.38115
G1 X130.257 Y127.748 E.01327
G1 X130.258 Y128.148 E.01327
G1 F2854.356
G1 X130.157 Y128.148 E.00333
G1 F2160
G1 X129.83 Y128.148 E.01084
M106 S255
G1 F600
G1 X129.83 Y127.217 E.03086
M106 S201.45
G1 F2869.055
G1 X129.83 Y126.798 E.01392
G1 F4350
G1 X129.43 Y126.798 E.01327
G1 X129.03 Y126.798 E.01327
G1 X125.482 Y126.798 E.1177
G1 X125.482 Y115.663 E.36936
M204 S250
G1 X125.112 Y115.318 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4350
M204 S5000
G3 X125.277 Y115.211 I.175 J.09 E.00632
G1 X129.603 Y115.216 E.13294
G3 X131.71 Y115.547 I-.048 J7.18 E.06577
G3 X132.104 Y115.796 I-.213 J.773 E.01453
G1 X132.097 Y140.223 E.75058
G3 X131.424 Y140.545 I-.965 J-1.15 E.02316
G3 X129.373 Y140.789 I-2.142 J-9.28 E.06361
G1 X125.298 Y140.79 E.12521
G3 X125.09 Y140.591 I-.008 J-.199 E.00987
G1 X125.09 Y115.408 E.77382
G3 X125.093 Y115.375 I.197 J0 E.001
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.15 Y115.266 E-.04678
G1 X125.205 Y115.229 E-.02549
G1 X125.277 Y115.211 E-.02802
G1 X127.013 Y115.213 E-.6597
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


G1 X127.866 Y124.414 F42000
G1 Z12.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.57351
G1 F4350
M204 S6000
G1 X127.866 Y118.051 E.27509
M204 S10000
G1 X128.32 Y124.868 F42000
; LINE_WIDTH: 0.41999
G1 F4350
M204 S6000
G1 X128.32 Y117.538 E.2252
G1 X127.413 Y117.536 E.0279
G1 X127.413 Y124.868 E.22526
G1 X128.26 Y124.868 E.02604
M204 S10000
G1 X128.697 Y125.245 F42000
G1 F4350
M204 S6000
G1 X128.698 Y117.162 E.24835
G1 X127.035 Y117.159 E.05107
G1 X127.035 Y125.245 E.24846
G1 X128.637 Y125.245 E.04921
M204 S10000
G1 X129.074 Y125.622 F42000
G1 F4350
M204 S6000
G1 X129.075 Y116.786 E.2715
G1 X126.658 Y116.781 E.07424
G1 X126.658 Y125.622 E.27165
G1 X129.014 Y125.622 E.07238
M204 S10000
G1 X129.451 Y125.999 F42000
G1 F4350
M204 S6000
G1 X129.452 Y116.409 E.29465
G1 X126.281 Y116.403 E.09742
G1 X126.281 Y125.999 E.29485
G1 X129.391 Y125.999 E.09555
; WIPE_START
G1 F9547.299
G1 X127.391 Y125.999 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.502 Y126.994 Z13.2 F42000
G1 Z12.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.476084
G1 F4350
M204 S6000
G1 X125.502 Y128.606 E.0569
G1 X125.52 Y128.677 E.00256
; LINE_WIDTH: 0.5271
G1 X125.537 Y128.747 E.00286
; LINE_WIDTH: 0.561607
G1 X125.554 Y128.818 E.00307
; LINE_WIDTH: 0.578763
G1 X125.554 Y138.782 E.43511
G1 X125.592 Y138.808 E.002
; LINE_WIDTH: 0.508402
G1 X125.631 Y138.833 E.00174
; LINE_WIDTH: 0.461416
G1 X125.669 Y138.858 E.00156
; LINE_WIDTH: 0.41443
G1 X125.707 Y138.883 E.00139
; LINE_WIDTH: 0.367445
G1 X125.746 Y138.908 E.00121
; LINE_WIDTH: 0.320459
G1 X125.784 Y138.933 E.00104
; LINE_WIDTH: 0.273473
G1 X125.822 Y138.958 E.00086
M204 S10000
G1 X125.537 Y138.853 F42000
; LINE_WIDTH: 0.527112
G1 F4350
M204 S6000
G1 X125.52 Y138.923 E.00286
; LINE_WIDTH: 0.47609
G1 X125.502 Y138.994 E.00256
G1 X125.502 Y140.594 E.05648
M204 S10000
G1 X125.537 Y138.853 F42000
; LINE_WIDTH: 0.561626
G1 F4350
M204 S6000
G1 X125.554 Y138.782 E.00307
; WIPE_START
G1 F6940.348
G1 X125.537 Y138.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.2 I-.299 J1.18 P1  F42000
G1 X131.393 Y140.338 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F4350
M204 S2000
G1 X131.898 Y139.833 E.02193
G1 X131.898 Y139.3
G1 X130.72 Y140.478 E.0512
G1 X130.48 Y140.184
G1 X131.898 Y138.767 E.0616
G1 X131.898 Y138.234
G1 X131.46 Y138.672 E.01904
G1 X131.46 Y138.138
G1 X131.898 Y137.7 E.01904
G1 X131.898 Y137.167
G1 X131.46 Y137.605 E.01904
G1 X131.46 Y137.072
G1 X131.898 Y136.634 E.01904
G1 X131.898 Y136.1
G1 X131.46 Y136.539 E.01904
G1 X131.46 Y136.005
G1 X131.898 Y135.567 E.01904
G1 X131.898 Y135.034
G1 X131.46 Y135.472 E.01904
G1 X131.46 Y134.939
G1 X131.898 Y134.501 E.01904
G1 X131.898 Y133.967
G1 X131.46 Y134.406 E.01904
G1 X131.46 Y133.872
G1 X131.898 Y133.434 E.01904
G1 X131.898 Y132.901
G1 X131.46 Y133.339 E.01904
G1 X131.46 Y132.806
G1 X131.898 Y132.368 E.01904
G1 X131.898 Y131.834
G1 X131.46 Y132.273 E.01904
G1 X131.46 Y131.739
G1 X131.898 Y131.301 E.01904
G1 X131.898 Y130.768
G1 X131.46 Y131.206 E.01904
G1 X131.46 Y130.673
G1 X131.898 Y130.235 E.01904
M73 P91 R1
G1 X131.898 Y129.701
G1 X131.46 Y130.14 E.01904
G1 X131.46 Y129.606
G1 X131.898 Y129.168 E.01904
G1 X131.898 Y128.635
G1 X131.46 Y129.073 E.01904
G1 X131.417 Y128.583
G1 X131.898 Y128.102 E.0209
G1 X131.898 Y127.568
G1 X131.06 Y128.406 E.03642
G1 X130.688 Y128.245
G1 X131.898 Y127.035 E.05256
G1 X131.898 Y126.502
G1 X130.48 Y127.919 E.0616
G1 X130.48 Y127.386
G1 X131.898 Y125.969 E.0616
G1 X131.898 Y125.435
G1 X130.473 Y126.86 E.06193
G1 X130.473 Y126.327
G1 X131.898 Y124.902 E.06193
G1 X131.898 Y124.369
G1 X130.473 Y125.794 E.06192
G1 X130.473 Y125.261
G1 X131.898 Y123.836 E.06192
G1 X131.898 Y123.302
G1 X130.473 Y124.727 E.06192
G1 X130.473 Y124.194
G1 X131.898 Y122.769 E.06192
G1 X131.898 Y122.236
G1 X130.473 Y123.661 E.06192
G1 X130.473 Y123.127
G1 X131.898 Y121.703 E.06192
G1 X131.898 Y121.169
G1 X130.473 Y122.594 E.06191
G1 X130.473 Y122.061
G1 X131.898 Y120.636 E.06191
G1 X131.898 Y120.103
G1 X130.473 Y121.527 E.06191
G1 X130.473 Y120.994
G1 X131.898 Y119.57 E.06191
G1 X131.898 Y119.036
G1 X130.473 Y120.461 E.06191
G1 X130.473 Y119.928
G1 X131.898 Y118.503 E.06191
G1 X131.898 Y117.97
G1 X130.473 Y119.394 E.0619
G1 X130.473 Y118.861
G1 X131.898 Y117.436 E.0619
G1 X131.898 Y116.903
G1 X130.473 Y118.328 E.0619
G1 X130.473 Y117.794
G1 X131.898 Y116.37 E.0619
G1 X131.879 Y115.856
G1 X130.473 Y117.261 E.06107
G1 X130.473 Y116.728
G1 X131.506 Y115.696 E.04486
G1 X131.082 Y115.586
G1 X130.473 Y116.195 E.02645
M204 S10000
G1 X130.635 Y115.49 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.125267
G1 F4350
M204 S6000
G1 X130.458 Y115.943 E.00326
M204 S10000
G1 X130.55 Y127.99 F42000
; LINE_WIDTH: 0.162321
G1 F4350
M204 S6000
G2 X130.563 Y128.264 I.218 J.127 E.00282
M204 S10000
G1 X131.216 Y128.566 F42000
; LINE_WIDTH: 0.114045
G1 F4350
M204 S6000
G1 X131.041 Y128.562 E.00101
M204 S10000
G1 X131.336 Y128.502 F42000
; LINE_WIDTH: 0.11641
G1 F4350
M204 S6000
G1 X131.216 Y128.566 E.00082
; LINE_WIDTH: 0.0965692
G1 X131.221 Y128.584 E.00008
; LINE_WIDTH: 0.06379
G1 X131.227 Y128.601 E.00003
; WIPE_START
G1 F15000
G1 X131.221 Y128.584 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.822 Y128.642 Z13.2 F42000
G1 Z12.8
G1 E.8 F1800
; LINE_WIDTH: 0.273473
G1 F4350
M204 S6000
G1 X125.784 Y128.667 E.00086
; LINE_WIDTH: 0.32046
G1 X125.746 Y128.692 E.00104
; LINE_WIDTH: 0.367446
G1 X125.707 Y128.717 E.00121
; LINE_WIDTH: 0.414432
G1 X125.669 Y128.742 E.00139
; LINE_WIDTH: 0.461418
G1 X125.631 Y128.767 E.00156
; LINE_WIDTH: 0.508404
G1 X125.592 Y128.792 E.00174
; LINE_WIDTH: 0.55539
G1 X125.554 Y128.818 E.00191
; CHANGE_LAYER
; Z_HEIGHT: 13
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7024.801
G1 X125.592 Y128.792 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 65/72
; update layer progress
M73 L65
M991 S0 P64 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z13.2 I1.185 J.278 P1  F42000
G1 X125.968 Y127.19 Z13.2
G1 Z13
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3859
M204 S5000
G1 X127.892 Y127.19 E.05911
G1 X128.292 Y127.19 E.01229
G1 X128.692 Y127.19 E.01229
G1 F2049.099
G1 X128.692 Y127.231 E.00126
M106 S255
G1 F1800
G1 X128.692 Y127.6 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X128.692 Y128 E.01327
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X128.692 Y128.369 E.01134
M106 S201.45
G1 F2049.099
G1 X128.692 Y128.41 E.00126
G1 F3859
G1 X128.292 Y128.41 E.01229
G1 X127.892 Y128.41 E.01229
G1 X125.968 Y128.41 E.05911
G1 X125.968 Y128.369 E.00126
G1 X125.968 Y127.25 E.03438
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.892 Y127.19 E-.73139
G1 X127.967 Y127.19 E-.02861
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.764 Y134.727 Z13.4 F42000
G1 X126.072 Y139.06 Z13.4
G1 Z13
G1 E.8 F1800
G1 F3859
M204 S5000
G1 X126.072 Y139.019 E.00126
G1 X126.072 Y128.581 E.32073
G1 X126.072 Y128.54 E.00126
G1 X128.472 Y128.54 E.07374
G1 X128.872 Y128.54 E.01229
G1 X129.272 Y128.54 E.01229
G1 F3192.872
G1 X129.272 Y128.581 E.00126
G1 F2880
G1 X129.272 Y128.79 E.00642
M106 S255
G1 F1560
G1 X129.977 Y128.79 E.02168
M106 S201.45
G1 F3859
G1 X130.377 Y128.79 E.01229
G1 X130.777 Y128.79 E.01229
G1 X131.306 Y128.79 E.01625
G1 X131.306 Y138.81 E.30789
G1 X130.777 Y138.81 E.01625
G1 X130.377 Y138.81 E.01229
G1 X129.977 Y138.81 E.01229
M106 S255
G1 F1560
G1 X129.272 Y138.81 E.02168
M106 S201.45
G1 F2880
G1 X129.272 Y139.019 E.00642
G1 F3192.95
G1 X129.272 Y139.06 E.00126
G1 F3859
G1 X128.872 Y139.06 E.01229
G1 X128.472 Y139.06 E.01229
G1 X126.132 Y139.06 E.0719
M204 S250
G1 X125.968 Y139.19 F42000
G1 F3859
M204 S5000
G1 X127.892 Y139.19 E.05911
G1 X128.292 Y139.19 E.01229
G1 X128.692 Y139.19 E.01229
G1 F2049.036
G1 X128.692 Y139.231 E.00126
M106 S255
G1 F1800
G1 X128.692 Y139.6 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X128.692 Y140 E.01327
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X128.692 Y140.369 E.01134
M106 S201.45
G1 F2049.099
G1 X128.692 Y140.41 E.00126
G1 F3859
G1 X128.292 Y140.41 E.01229
G1 X127.892 Y140.41 E.01229
G1 X125.968 Y140.41 E.05911
G1 X125.968 Y140.369 E.00126
G1 X125.968 Y139.25 E.03438
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.892 Y139.19 E-.73139
G1 X127.967 Y139.19 E-.02861
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.084 Y139.452 Z13.4 F42000
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2160
M204 S6000
G1 X129.411 Y139.452 E.01084
G1 F2854.356
G1 X129.511 Y139.452 E.00333
G1 F3859
G1 X129.511 Y139.852 E.01327
G1 X129.511 Y140.35 E.01652
G1 F2935.186
G1 X129.411 Y140.358 E.00334
G1 F2228.387
G1 X129.095 Y140.382 E.01051
G1 F637.916
G1 X129.084 Y140.382 E.00036
M106 S255
G1 F600
G1 X129.084 Y139.512 E.02887
M106 S201.45
; WIPE_START
G1 X129.411 Y139.452 E-.12627
G1 X129.511 Y139.452 E-.03812
G1 X129.511 Y139.852 E-.152
G1 X129.511 Y140.35 E-.1892
G1 X129.411 Y140.358 E-.03824
G1 X129.095 Y140.382 E-.12039
G1 X129.084 Y140.382 E-.00418
G1 X129.084 Y140.141 E-.0916
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.096 Y132.573 Z13.4 F42000
G1 X125.935 Y116.009 Z13.4
G1 Z13
G1 E.8 F1800
G1 F3859
M204 S6000
G1 X128.529 Y116.009 E.08606
G3 X129.097 Y116.027 I-.045 J10.889 E.01886
G1 X129.097 Y126.391 E.3438
G1 X125.935 Y126.391 E.10491
G1 X125.935 Y116.069 E.34239
M204 S10000
G1 X125.528 Y115.602 F42000
G1 F3859
M204 S6000
G1 X128.533 Y115.602 E.09968
G3 X129.486 Y115.649 I-.215 J14.191 E.03166
G1 X129.505 Y115.859 E.00701
G1 X129.511 Y127.348 E.3811
G1 X129.511 Y127.748 E.01327
G1 X129.511 Y128.148 E.01327
G1 F2854.356
G1 X129.411 Y128.148 E.00333
G1 F2160
G1 X129.084 Y128.148 E.01084
M106 S255
G1 F600
G1 X129.084 Y127.217 E.03086
M106 S201.45
G1 F2869.055
G1 X129.084 Y126.798 E.01392
G1 F3859
G1 X128.684 Y126.798 E.01327
G1 X128.284 Y126.798 E.01327
G1 X125.528 Y126.798 E.09143
G1 X125.528 Y115.662 E.3694
M204 S250
G1 X125.159 Y115.319 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3859
M204 S5000
G3 X125.342 Y115.21 I.18 J.095 E.00687
G1 X128.536 Y115.21 E.09816
G3 X130.804 Y115.492 I.104 J8.437 E.07044
G3 X131.358 Y115.79 I-.286 J1.195 E.01954
G1 X131.361 Y140.198 E.75001
G1 X131.344 Y140.23 E.00111
G3 X130.47 Y140.597 I-1.146 J-1.505 E.02945
G3 X128.626 Y140.789 I-1.986 J-10.141 E.05706
G1 X125.343 Y140.79 E.10087
G3 X125.136 Y140.589 I-.008 J-.199 E.00991
G1 X125.136 Y115.408 E.77377
G3 X125.139 Y115.376 I.204 J.006 E.00099
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.195 Y115.266 E-.04687
G1 X125.251 Y115.229 E-.02537
G1 X125.342 Y115.21 E-.03541
G1 X127.059 Y115.21 E-.65235
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


G1 X130.23 Y115.566 F42000
G1 Z13
G1 E.8 F1800
; FEATURE: Top surface
G1 F3859
M204 S2000
G1 X131.155 Y116.491 E.04021
G1 X131.155 Y117.024
G1 X129.702 Y115.571 E.06316
G1 X129.727 Y116.129
G1 X131.155 Y117.557 E.06207
G1 X131.155 Y118.091
G1 X129.727 Y116.662 E.06207
G1 X129.727 Y117.196
G1 X131.155 Y118.624 E.06207
G1 X131.155 Y119.157
G1 X129.727 Y117.729 E.06207
G1 X129.727 Y118.262
G1 X131.155 Y119.69 E.06207
G1 X131.155 Y120.224
G1 X129.727 Y118.795 E.06206
G1 X129.727 Y119.329
G1 X131.155 Y120.757 E.06206
G1 X131.155 Y121.29
G1 X129.727 Y119.862 E.06206
G1 X129.727 Y120.395
G1 X131.155 Y121.823 E.06206
G1 X131.155 Y122.356
G1 X129.727 Y120.928 E.06206
G1 X129.727 Y121.462
G1 X131.155 Y122.89 E.06206
G1 X131.155 Y123.423
G1 X129.727 Y121.995 E.06205
G1 X129.727 Y122.528
G1 X131.155 Y123.956 E.06205
G1 X131.155 Y124.489
G1 X129.727 Y123.061 E.06205
G1 X129.727 Y123.595
G1 X131.155 Y125.023 E.06205
G1 X131.155 Y125.556
G1 X129.727 Y124.128 E.06205
G1 X129.727 Y124.661
G1 X131.155 Y126.089 E.06205
G1 X131.155 Y126.622
G1 X129.727 Y125.194 E.06204
G1 X129.727 Y125.728
G1 X131.155 Y127.155 E.06204
G1 X131.155 Y127.689
G1 X129.727 Y126.261 E.06204
G1 X129.727 Y126.794
G1 X131.155 Y128.222 E.06204
G1 X130.982 Y128.583
G1 X129.734 Y127.334 E.05425
G1 X129.734 Y127.867
G1 X130.111 Y128.245 E.0164
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.734 Y127.867 E-.20278
G1 X129.734 Y127.334 E-.20264
G1 X130.394 Y127.994 E-.35459
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.891 Y120.378 Z13.4 F42000
G1 X131.174 Y116.028 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.285028
G1 F3859
M204 S6000
G1 X130.97 Y115.878 E.005
; LINE_WIDTH: 0.246616
G1 X130.611 Y115.636 E.00719
M204 S10000
G1 X130.675 Y128.601 F42000
; LINE_WIDTH: 0.127396
G1 F3859
M204 S6000
G1 X130.214 Y128.141 E.00448
; WIPE_START
G1 F15000
G1 X130.675 Y128.601 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.4 I.935 J-.779 P1  F42000
G1 X127.516 Y124.81 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.53602
G1 F3859
M204 S6000
G1 X127.516 Y117.651 E.28766
M204 S10000
G1 X127.951 Y125.245 F42000
; LINE_WIDTH: 0.41999
G1 F3859
M204 S6000
G1 X127.951 Y117.156 E.24855
G1 X127.081 Y117.155 E.02674
G1 X127.081 Y125.245 E.24855
G1 X127.891 Y125.245 E.02489
M204 S10000
G1 X128.328 Y125.622 F42000
G1 F3859
M204 S6000
G1 X128.328 Y116.778 E.27172
G1 X126.704 Y116.778 E.04991
G1 X126.704 Y125.622 E.27172
G1 X128.268 Y125.622 E.04807
M204 S10000
G1 X128.705 Y125.999 F42000
G1 F3859
M204 S6000
G1 X128.705 Y116.407 E.29472
G1 X126.327 Y116.401 E.07308
G1 X126.327 Y125.999 E.2949
G1 X128.645 Y125.999 E.07124
; WIPE_START
G1 F9547.299
G1 X126.645 Y125.999 E-.76
; WIPE_END
M73 P92 R1
G1 E-.04 F1800
M204 S10000
G1 X125.552 Y126.994 Z13.4 F42000
G1 Z13
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.48408
G1 F3859
M204 S6000
G1 X125.552 Y128.606 E.05795
G1 X125.569 Y128.677 E.00263
; LINE_WIDTH: 0.53509
G1 X125.586 Y128.748 E.00294
; LINE_WIDTH: 0.569604
G1 X125.604 Y128.82 E.00314
; LINE_WIDTH: 0.586749
G1 X125.604 Y138.78 E.44142
G1 X125.643 Y138.806 E.00206
; LINE_WIDTH: 0.514672
G1 X125.681 Y138.831 E.00178
; LINE_WIDTH: 0.466546
G1 X125.72 Y138.857 E.0016
; LINE_WIDTH: 0.41842
G1 X125.759 Y138.882 E.00142
; LINE_WIDTH: 0.370295
G1 X125.798 Y138.907 E.00124
; LINE_WIDTH: 0.322169
G1 X125.837 Y138.933 E.00106
; LINE_WIDTH: 0.274043
G1 X125.876 Y138.958 E.00087
M204 S10000
G1 X125.586 Y138.852 F42000
; LINE_WIDTH: 0.535099
G1 F3859
M204 S6000
G1 X125.569 Y138.923 E.00294
; LINE_WIDTH: 0.484086
G1 X125.552 Y138.994 E.00263
G1 X125.552 Y140.594 E.05752
M204 S10000
G1 X125.586 Y138.852 F42000
; LINE_WIDTH: 0.569605
G1 F3859
M204 S6000
G1 X125.604 Y138.78 E.00314
; WIPE_START
G1 F6835.207
G1 X125.586 Y138.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.154 Y139.419 Z13.4 F42000
G1 Z13
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F3859
M204 S2000
G1 X130.752 Y139.017 E.01747
G1 X130.313 Y139.112
G1 X131.154 Y139.953 E.03653
G1 X130.917 Y140.249
G1 X130.023 Y139.355 E.03883
G1 X129.734 Y139.599
G1 X130.509 Y140.375 E.03371
G1 X130.065 Y140.463
G1 X129.734 Y140.132 E.01439
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.065 Y140.463 E-.17797
G1 X130.509 Y140.375 E-.17227
G1 X129.747 Y139.612 E-.40977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.4 I1.136 J-.436 P1  F42000
G1 X125.604 Y128.82 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.562796
G1 F3859
M204 S6000
G1 X125.643 Y128.794 E.00197
; LINE_WIDTH: 0.51467
G1 X125.681 Y128.769 E.00178
; LINE_WIDTH: 0.466545
G1 X125.72 Y128.743 E.0016
; LINE_WIDTH: 0.418419
G1 X125.759 Y128.718 E.00142
; LINE_WIDTH: 0.370294
G1 X125.798 Y128.693 E.00124
; LINE_WIDTH: 0.322168
G1 X125.837 Y128.667 E.00106
; LINE_WIDTH: 0.274043
G1 X125.876 Y128.642 E.00087
; CHANGE_LAYER
; Z_HEIGHT: 13.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X125.837 Y128.667 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 66/72
; update layer progress
M73 L66
M991 S0 P65 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z13.4 I1.208 J.151 P1  F42000
G1 X126.022 Y127.19 Z13.4
G1 Z13.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3180
M204 S5000
G1 X127.146 Y127.19 E.03453
G1 X127.546 Y127.19 E.01229
G1 X127.946 Y127.19 E.01229
G1 F2049.099
G1 X127.946 Y127.231 E.00126
M106 S255
G1 F1800
G1 X127.946 Y127.6 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X127.946 Y128 E.01327
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X127.946 Y128.369 E.01134
M106 S201.45
G1 F2049.099
G1 X127.946 Y128.41 E.00126
G1 F3180
G1 X127.546 Y128.41 E.01229
G1 X127.146 Y128.41 E.01229
G1 X126.022 Y128.41 E.03453
G1 X126.022 Y128.369 E.00126
G1 X126.022 Y127.25 E.03438
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.146 Y127.19 E-.42764
G1 X127.546 Y127.19 E-.152
G1 X127.946 Y127.19 E-.152
G1 X127.946 Y127.231 E-.01558
G1 X127.946 Y127.265 E-.01278
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.73 Y134.8 Z13.6 F42000
G1 X126.022 Y139.19 Z13.6
G1 Z13.2
G1 E.8 F1800
G1 F3180
M204 S5000
G1 X127.146 Y139.19 E.03453
G1 X127.546 Y139.19 E.01229
G1 X127.946 Y139.19 E.01229
G1 F2049.036
G1 X127.946 Y139.231 E.00126
M106 S255
G1 F1800
G1 X127.946 Y139.6 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X127.946 Y140 E.01327
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X127.946 Y140.369 E.01134
M106 S201.45
G1 F2049.099
G1 X127.946 Y140.41 E.00126
G1 F3180
G1 X127.546 Y140.41 E.01229
G1 X127.146 Y140.41 E.01229
G1 X126.022 Y140.41 E.03453
G1 X126.022 Y140.369 E.00126
G1 X126.022 Y139.25 E.03438
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.146 Y139.19 E-.42764
G1 X127.546 Y139.19 E-.152
G1 X127.946 Y139.19 E-.152
G1 X127.946 Y139.231 E-.01558
G1 X127.946 Y139.265 E-.01278
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.338 Y140.381 Z13.6 F42000
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
M204 S6000
G1 X128.338 Y139.452 E.03081
M106 S201.45
G1 F2160
G1 X128.664 Y139.452 E.01084
G1 F2854.282
G1 X128.765 Y139.452 E.00333
G1 F3180
G1 X128.765 Y139.852 E.01327
G1 X128.765 Y140.349 E.01647
G1 X128.664 Y140.358 E.00334
G1 X128.617 Y140.363 E.0016
G1 X128.397 Y140.377 E.00728
; WIPE_START
G1 F8843.478
G1 X128.338 Y139.452 E-.35221
G1 X128.664 Y139.452 E-.1242
G1 X128.765 Y139.452 E-.03812
G1 X128.765 Y139.852 E-.152
G1 X128.765 Y140.098 E-.09347
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.6 I1.193 J-.242 P1  F42000
G1 X125.981 Y126.391 Z13.6
G1 Z13.2
G1 E.8 F1800
G1 F3180
M204 S6000
G1 X125.982 Y116.009 E.34438
G1 X127.794 Y116.009 E.0601
G3 X128.351 Y116.027 I-.056 J10.819 E.01849
G1 X128.351 Y126.391 E.3438
G1 X126.041 Y126.391 E.07661
M204 S10000
G1 X125.574 Y126.798 F42000
G1 F3180
M204 S6000
G1 X125.575 Y115.602 E.37139
G1 X127.798 Y115.602 E.07374
G3 X128.739 Y115.649 I-.24 J14.411 E.03126
G1 X128.758 Y115.86 E.00703
G1 X128.764 Y127.348 E.38108
G1 X128.765 Y127.748 E.01327
G1 X128.765 Y128.148 E.01327
G1 F2854.282
G1 X128.664 Y128.148 E.00333
G1 F2160
G1 X128.338 Y128.148 E.01084
M106 S255
G1 F600
G1 X128.338 Y127.217 E.03086
M106 S201.45
G1 F2869.055
G1 X128.338 Y126.798 E.01392
G1 F3180
G1 X127.938 Y126.798 E.01327
G1 X127.538 Y126.798 E.01327
G1 X125.634 Y126.798 E.06314
; WIPE_START
G1 F8843.478
G1 X125.624 Y124.798 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.892 Y132.426 Z13.6 F42000
G1 X126.125 Y139.06 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3180
M204 S5000
G1 X127.725 Y139.06 E.04916
G1 X128.125 Y139.06 E.01229
G1 X128.525 Y139.06 E.01229
G1 X128.525 Y139.019 E.00126
G1 F2880
G1 X128.525 Y138.81 E.00642
M106 S255
G1 F1560
G1 X129.231 Y138.81 E.02168
M106 S201.45
G1 F3180
G1 X129.631 Y138.81 E.01229
G1 X130.031 Y138.81 E.01229
G1 X130.616 Y138.81 E.018
G1 X130.611 Y140.21 E.04303
G3 X130.101 Y140.495 I-.729 J-.708 E.0182
G3 X127.734 Y140.79 I-2.205 J-8.035 E.07355
G1 X125.36 Y140.788 E.07293
G3 X125.181 Y140.59 I.024 J-.202 E.00897
G1 X125.183 Y115.381 E.77458
G3 X125.388 Y115.21 I.198 J.029 E.00897
G1 X127.802 Y115.21 E.07418
G3 X130.062 Y115.493 I.097 J8.399 E.07023
G3 X130.615 Y115.797 I-.272 J1.15 E.01961
G1 X130.617 Y128.79 E.39925
G1 X130.031 Y128.79 E.01801
G1 X129.631 Y128.79 E.01229
G1 X129.231 Y128.79 E.01229
M106 S255
G1 F1560
G1 X128.525 Y128.79 E.02168
M106 S201.45
G1 F2880
G1 X128.525 Y128.581 E.00642
G1 F3180
G1 X128.525 Y128.54 E.00126
G1 X128.125 Y128.54 E.01229
G1 X127.725 Y128.54 E.01229
G1 X126.125 Y128.54 E.04916
G1 X126.125 Y128.581 E.00126
G1 X126.125 Y139 E.32015
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.725 Y139.06 E-.60835
G1 X128.124 Y139.06 E-.15165
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


G1 X129.755 Y140.377 F42000
G1 Z13.2
G1 E.8 F1800
; FEATURE: Top surface
G1 F3180
M204 S2000
G1 X130.408 Y139.723 E.0284
G1 X130.409 Y139.189
G1 X129.101 Y140.497 E.05684
G1 X128.987 Y140.077
G1 X130.047 Y139.017 E.04606
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.987 Y140.077 E-.56968
G1 X129.101 Y140.497 E-.16531
G1 X129.147 Y140.451 E-.02501
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.427 Y140.072 Z13.6 F42000
G1 Z13.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.145207
G1 F3180
M204 S6000
G1 X130.323 Y140.145 E.00106
; LINE_WIDTH: 0.108759
G3 X130.178 Y140.246 I-1.543 J-2.068 E.00095
; WIPE_START
G1 F15000
G1 X130.323 Y140.145 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.428 Y139.032 Z13.6 F42000
G1 Z13.2
G1 E.8 F1800
; LINE_WIDTH: 0.110205
G1 F3180
M204 S6000
G1 X130.062 Y139.032 E.002
; WIPE_START
G1 F15000
G1 X130.428 Y139.032 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.6 I-.374 J-1.158 P1  F42000
G1 X125.602 Y140.592 Z13.6
G1 Z13.2
G1 E.8 F1800
; LINE_WIDTH: 0.492025
G1 F3180
M204 S6000
G1 X125.602 Y138.994 E.05849
G1 X125.619 Y138.922 E.0027
; LINE_WIDTH: 0.542963
G1 X125.636 Y138.85 E.00301
; LINE_WIDTH: 0.57747
G1 X125.653 Y138.779 E.00322
M204 S10000
G1 X125.929 Y138.958 F42000
; LINE_WIDTH: 0.274605
G1 F3180
M204 S6000
G1 X125.89 Y138.932 E.00089
; LINE_WIDTH: 0.323853
G1 X125.85 Y138.906 E.00108
; LINE_WIDTH: 0.373102
G1 X125.811 Y138.881 E.00126
; LINE_WIDTH: 0.42235
G1 X125.772 Y138.855 E.00145
; LINE_WIDTH: 0.471599
G1 X125.732 Y138.83 E.00164
; LINE_WIDTH: 0.520847
G1 X125.693 Y138.804 E.00183
; LINE_WIDTH: 0.594284
G1 X125.653 Y138.779 E.00211
G1 X125.654 Y128.821 E.44737
; LINE_WIDTH: 0.57679
G1 X125.636 Y128.75 E.00321
; LINE_WIDTH: 0.542274
G1 X125.619 Y128.678 E.003
; LINE_WIDTH: 0.491226
G1 X125.602 Y128.606 E.0027
G1 X125.602 Y126.994 E.05889
M204 S10000
G1 X125.929 Y128.642 F42000
; LINE_WIDTH: 0.274558
G1 F3180
M204 S6000
G1 X125.89 Y128.668 E.00089
; LINE_WIDTH: 0.323712
G1 X125.851 Y128.693 E.00107
; LINE_WIDTH: 0.372866
G1 X125.811 Y128.719 E.00126
; LINE_WIDTH: 0.422021
G1 X125.772 Y128.745 E.00145
; LINE_WIDTH: 0.471175
G1 X125.732 Y128.77 E.00164
; LINE_WIDTH: 0.520329
G1 X125.693 Y128.796 E.00183
; LINE_WIDTH: 0.569484
G1 X125.654 Y128.821 E.00201
; WIPE_START
G1 F6836.786
G1 X125.693 Y128.796 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.166 Y125.206 Z13.6 F42000
G1 Z13.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.49684
G1 F3180
M204 S6000
G1 X127.167 Y117.254 E.29414
M204 S10000
G1 X127.582 Y125.622 F42000
; LINE_WIDTH: 0.41999
G1 F3180
M204 S6000
G1 X127.582 Y116.779 E.27172
G1 X126.751 Y116.778 E.02552
G1 X126.751 Y125.622 E.27172
G1 X127.522 Y125.622 E.0237
M204 S10000
G1 X127.959 Y125.999 F42000
G1 F3180
M204 S6000
G1 X127.959 Y116.407 E.29473
G2 X126.374 Y116.401 I-1.204 J119.135 E.0487
G1 X126.374 Y125.999 E.2949
G1 X127.899 Y125.999 E.04687
; WIPE_START
G1 F9547.299
M73 P93 R1
G1 X126.374 Y125.999 E-.57968
G1 X126.374 Y125.524 E-.18032
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.409 Y127.99 Z13.6 F42000
G1 Z13.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F3180
M204 S2000
G1 X129.817 Y128.583 E.02573
G1 X129.567 Y128.299
G1 X130.409 Y127.457 E.0366
G1 X130.409 Y126.924
G1 X129.088 Y128.245 E.05739
G1 X128.987 Y127.813
G1 X130.409 Y126.391 E.06179
G1 X130.409 Y125.857
G1 X128.987 Y127.279 E.06179
G1 X128.981 Y126.753
G1 X130.409 Y125.324 E.06208
G1 X130.409 Y124.791
G1 X128.981 Y126.219 E.06208
G1 X128.981 Y125.686
G1 X130.409 Y124.258 E.06208
G1 X130.409 Y123.724
G1 X128.981 Y125.153 E.06208
G1 X128.981 Y124.62
G1 X130.409 Y123.191 E.06208
G1 X130.409 Y122.658
G1 X128.981 Y124.086 E.06208
G1 X128.981 Y123.553
G1 X130.409 Y122.125 E.06208
G1 X130.409 Y121.591
G1 X128.981 Y123.02 E.06208
G1 X128.981 Y122.487
G1 X130.409 Y121.058 E.06208
G1 X130.409 Y120.525
G1 X128.981 Y121.953 E.06208
G1 X128.981 Y121.42
G1 X130.409 Y119.992 E.06208
G1 X130.409 Y119.458
G1 X128.981 Y120.887 E.06208
G1 X128.981 Y120.354
G1 X130.409 Y118.925 E.06208
G1 X130.409 Y118.392
G1 X128.981 Y119.82 E.06208
G1 X128.981 Y119.287
G1 X130.409 Y117.859 E.06208
G1 X130.409 Y117.325
G1 X128.981 Y118.754 E.06208
G1 X128.981 Y118.221
G1 X130.409 Y116.792 E.06208
G1 X130.409 Y116.259
G1 X128.981 Y117.687 E.06208
G1 X128.981 Y117.154
G1 X130.316 Y115.819 E.05803
G1 X129.93 Y115.671
G1 X128.981 Y116.621 E.04126
G1 X128.981 Y116.088
G1 X129.499 Y115.569 E.02255
; CHANGE_LAYER
; Z_HEIGHT: 13.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.981 Y116.088 E-.27887
G1 X128.981 Y116.621 E-.20264
G1 X129.499 Y116.103 E-.27849
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 67/72
; update layer progress
M73 L67
M991 S0 P66 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z13.6 I-1.163 J-.359 P1  F42000
G1 X126.075 Y127.19 Z13.6
G1 Z13.4
G1 E.8 F1800
; FEATURE: Outer wall
G1 F2977
M204 S5000
G1 X126.399 Y127.19 E.00995
G1 X126.799 Y127.19 E.01229
G1 X127.199 Y127.19 E.01229
G1 F2049.099
G1 X127.199 Y127.231 E.00126
M106 S255
G1 F1800
G1 X127.199 Y127.6 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X127.199 Y128 E.01327
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X127.199 Y128.369 E.01134
M106 S201.45
G1 F2049.099
G1 X127.199 Y128.41 E.00126
G1 F2977
G1 X126.799 Y128.41 E.01229
G1 X126.399 Y128.41 E.01229
G1 X126.075 Y128.41 E.00995
G1 X126.075 Y128.369 E.00126
G1 X126.075 Y127.25 E.03438
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.399 Y127.19 E-.12513
G1 X126.799 Y127.19 E-.152
G1 X127.199 Y127.19 E-.152
G1 X127.199 Y127.231 E-.01558
G1 X127.199 Y127.6 E-.14022
G1 X127.199 Y128 E-.152
G1 X127.199 Y128.061 E-.02307
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.432 Y135.655 Z13.8 F42000
G1 X126.075 Y139.19 Z13.8
G1 Z13.4
G1 E.8 F1800
G1 F2977
M204 S5000
G1 X126.399 Y139.19 E.00995
G1 X126.799 Y139.19 E.01229
G1 X127.199 Y139.19 E.01229
G1 F2049.036
G1 X127.199 Y139.231 E.00126
M106 S255
G1 F1800
G1 X127.199 Y139.6 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X127.199 Y140 E.01327
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X127.199 Y140.369 E.01134
M106 S201.45
G1 F2049.099
G1 X127.199 Y140.41 E.00126
G1 F2977
G1 X126.799 Y140.41 E.01229
G1 X126.399 Y140.41 E.01229
G1 X126.075 Y140.41 E.00995
G1 X126.075 Y140.369 E.00126
G1 X126.075 Y139.25 E.03438
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.399 Y139.19 E-.12513
G1 X126.799 Y139.19 E-.152
G1 X127.199 Y139.19 E-.152
G1 X127.199 Y139.231 E-.01558
G1 X127.199 Y139.6 E-.14022
G1 X127.199 Y140 E-.152
G1 X127.199 Y140.061 E-.02307
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.8 I-.772 J.941 P1  F42000
G1 X127.591 Y140.382 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
M204 S6000
G1 X127.591 Y139.452 E.03086
M106 S201.45
G1 F2160
G1 X127.918 Y139.452 E.01084
G1 F2854.282
G1 X128.018 Y139.452 E.00333
G1 F2977
G1 X128.018 Y139.852 E.01327
G1 X128.018 Y140.35 E.01651
G1 X127.918 Y140.358 E.00334
G1 X127.651 Y140.378 E.00888
; WIPE_START
G1 F8843.478
G1 X127.591 Y139.452 E-.35274
G1 X127.918 Y139.452 E-.1242
G1 X128.018 Y139.452 E-.03812
G1 X128.018 Y139.852 E-.152
G1 X128.018 Y140.097 E-.09293
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.8 I1.204 J-.175 P1  F42000
G1 X126.026 Y126.391 Z13.8
G1 Z13.4
G1 E.8 F1800
G1 F2977
M204 S6000
G1 X126.026 Y116.009 E.34438
G1 X127.059 Y116.009 E.03425
G3 X127.605 Y116.027 I-.067 J10.78 E.01811
G1 X127.605 Y126.391 E.3438
G1 X126.086 Y126.391 E.05037
; WIPE_START
G1 F8843.478
G1 X126.075 Y124.391 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.8 I-1.129 J.455 P1  F42000
G1 X127.591 Y128.148 Z13.8
G1 Z13.4
G1 E.8 F1800
M106 S255
G1 F600
M204 S6000
G1 X127.591 Y127.217 E.03086
M106 S201.45
G1 F2869.055
G1 X127.591 Y126.798 E.01392
G1 F2977
G1 X127.191 Y126.798 E.01327
G1 X126.791 Y126.798 E.01327
G1 X125.619 Y126.798 E.03888
G1 X125.619 Y115.602 E.37139
G1 X127.063 Y115.602 E.04789
G3 X127.992 Y115.649 I-.253 J14.316 E.03087
G1 X128.012 Y115.86 E.00704
G1 X128.018 Y127.348 E.38107
G1 X128.018 Y127.748 E.01327
G1 X128.018 Y128.148 E.01327
G1 F2854.282
G1 X127.918 Y128.148 E.00333
G1 F2160
G1 X127.651 Y128.148 E.00885
; WIPE_START
G1 X127.591 Y127.217 E-.3543
G1 X127.591 Y126.798 E-.15944
G1 X127.191 Y126.798 E-.152
G1 X126.943 Y126.798 E-.09426
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.468 Y134.416 Z13.8 F42000
G1 X126.179 Y139.06 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2977
M204 S5000
G1 X126.979 Y139.06 E.02458
G1 X127.379 Y139.06 E.01229
G1 X127.779 Y139.06 E.01229
G1 X127.779 Y139.019 E.00126
G1 F2880
G1 X127.779 Y138.81 E.00642
M106 S255
G1 F1560
G1 X128.484 Y138.81 E.02168
M106 S201.45
G1 F2977
G1 X128.884 Y138.81 E.01229
G1 X129.284 Y138.81 E.01229
G1 X129.87 Y138.81 E.018
G1 X129.863 Y140.214 E.04313
G3 X129.191 Y140.544 I-.912 J-1.007 E.02332
G3 X126.987 Y140.79 I-2.085 J-8.682 E.06831
G1 X125.421 Y140.789 E.04813
G3 X125.227 Y140.589 I.009 J-.203 E.00943
G1 X125.227 Y115.397 E.7741
G3 X125.437 Y115.21 I.199 J.012 E.00958
G1 X127.067 Y115.21 E.05008
G3 X129.32 Y115.494 I.1 J8.288 E.07
G3 X129.868 Y115.797 I-.274 J1.147 E.01948
G1 X129.87 Y128.79 E.39925
G1 X129.284 Y128.79 E.01801
G1 X128.884 Y128.79 E.01229
G1 X128.484 Y128.79 E.01229
M106 S255
G1 F1560
G1 X127.779 Y128.79 E.02168
M106 S201.45
G1 F2880
G1 X127.779 Y128.581 E.00642
G1 F2977
G1 X127.779 Y128.54 E.00126
G1 X127.379 Y128.54 E.01229
G1 X126.979 Y128.54 E.01229
G1 X126.179 Y128.54 E.02458
G1 X126.179 Y128.581 E.00126
G1 X126.179 Y139 E.32015
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.979 Y139.06 E-.30477
G1 X127.379 Y139.06 E-.152
G1 X127.779 Y139.06 E-.152
G1 X127.779 Y139.019 E-.01558
G1 X127.779 Y138.81 E-.07942
G1 X127.927 Y138.81 E-.05623
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


G1 X129.662 Y139.527 F42000
G1 Z13.4
G1 E.8 F1800
; FEATURE: Top surface
G1 F2977
M204 S2000
G1 X129.152 Y139.017 E.02216
G1 X128.82 Y139.219
G1 X129.662 Y140.06 E.03655
G1 X129.346 Y140.278
G1 X128.423 Y139.355 E.04008
G1 X128.241 Y139.706
G1 X128.929 Y140.394 E.0299
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.241 Y139.706 E-.36978
G1 X128.423 Y139.355 E-.15024
G1 X128.87 Y139.802 E-.23998
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.8 I.342 J-1.168 P1  F42000
G1 X125.983 Y138.957 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.272032
G1 F2977
M204 S6000
G1 X125.948 Y138.935 E.00078
; LINE_WIDTH: 0.316134
G1 X125.913 Y138.912 E.00093
; LINE_WIDTH: 0.360237
G1 X125.878 Y138.89 E.00108
; LINE_WIDTH: 0.404339
G1 X125.843 Y138.867 E.00123
; LINE_WIDTH: 0.448442
G1 X125.808 Y138.844 E.00138
; LINE_WIDTH: 0.492544
G1 X125.773 Y138.822 E.00153
; LINE_WIDTH: 0.536647
G1 X125.738 Y138.799 E.00168
; LINE_WIDTH: 0.602638
G1 X125.703 Y138.777 E.0019
G1 X125.703 Y128.823 E.45397
; LINE_WIDTH: 0.580595
G1 X125.738 Y128.801 E.00182
; LINE_WIDTH: 0.536513
G1 X125.773 Y128.778 E.00167
; LINE_WIDTH: 0.492431
G1 X125.808 Y128.756 E.00152
; LINE_WIDTH: 0.448349
G1 X125.843 Y128.733 E.00138
; LINE_WIDTH: 0.404267
G1 X125.878 Y128.71 E.00123
; LINE_WIDTH: 0.360185
G1 X125.913 Y128.688 E.00108
; LINE_WIDTH: 0.316103
G1 X125.948 Y128.665 E.00093
; LINE_WIDTH: 0.272021
G1 X125.983 Y128.643 E.00078
M204 S10000
G1 X125.686 Y128.751 F42000
; LINE_WIDTH: 0.585385
G1 F2977
M204 S6000
G1 X125.703 Y128.823 E.00329
M204 S10000
G1 X125.686 Y128.751 F42000
; LINE_WIDTH: 0.550871
G1 F2977
M204 S6000
G1 X125.668 Y128.678 E.00308
; LINE_WIDTH: 0.49986
G1 X125.651 Y128.606 E.00277
G1 X125.651 Y126.994 E.06002
; WIPE_START
G1 F7878.507
G1 X125.651 Y128.606 E-.72644
G1 X125.668 Y128.678 E-.03356
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.213 Y125.999 Z13.8 F42000
G1 Z13.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F2977
M204 S6000
G1 X127.213 Y116.407 E.29473
G1 X126.419 Y116.401 E.0244
G1 X126.418 Y125.999 E.29489
G1 X127.153 Y125.999 E.02256
M204 S10000
G1 X126.815 Y125.602 F42000
; LINE_WIDTH: 0.45999
G1 F2977
M204 S6000
G1 X126.816 Y116.859 E.29715
; WIPE_START
G1 F8631.644
G1 X126.816 Y118.859 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.606 Y115.542 Z13.8 F42000
G1 Z13.4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2977
M204 S2000
G1 X129.663 Y116.598 E.04591
G1 X129.663 Y117.131
G1 X128.219 Y115.688 E.06272
G1 X128.234 Y116.236
G1 X129.663 Y117.665 E.06208
G1 X129.663 Y118.198
G1 X128.234 Y116.769 E.06208
G1 X128.234 Y117.302
G1 X129.663 Y118.731 E.06208
G1 X129.663 Y119.264
G1 X128.234 Y117.836 E.06208
G1 X128.234 Y118.369
G1 X129.663 Y119.798 E.06208
G1 X129.663 Y120.331
G1 X128.234 Y118.902 E.06208
G1 X128.234 Y119.436
G1 X129.663 Y120.864 E.06208
G1 X129.663 Y121.397
G1 X128.234 Y119.969 E.06208
G1 X128.234 Y120.502
G1 X129.663 Y121.931 E.06208
G1 X129.663 Y122.464
G1 X128.234 Y121.035 E.06208
G1 X128.234 Y121.569
G1 X129.663 Y122.997 E.06208
G1 X129.663 Y123.53
G1 X128.234 Y122.102 E.06208
G1 X128.234 Y122.635
G1 X129.663 Y124.064 E.06208
G1 X129.663 Y124.597
G1 X128.234 Y123.168 E.06208
G1 X128.234 Y123.702
G1 X129.663 Y125.13 E.06208
G1 X129.663 Y125.663
G1 X128.234 Y124.235 E.06208
G1 X128.234 Y124.768
G1 X129.663 Y126.197 E.06208
G1 X129.663 Y126.73
G1 X128.234 Y125.301 E.06208
G1 X128.234 Y125.835
G1 X129.663 Y127.263 E.06208
G1 X129.663 Y127.796
G1 X128.234 Y126.368 E.06208
G1 X128.241 Y126.908
G1 X129.663 Y128.33 E.06179
G1 X129.382 Y128.583
G1 X128.241 Y127.441 E.04961
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.382 Y128.583 E-.61348
M73 P94 R1
G1 X129.663 Y128.33 E-.14348
G1 X129.657 Y128.324 E-.00305
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.672 Y120.692 Z13.8 F42000
G1 X129.682 Y116.075 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.359314
G1 F2977
M204 S6000
G1 X129.46 Y115.913 E.00708
; LINE_WIDTH: 0.325507
G1 X129 Y115.602 E.01279
M204 S10000
G1 X128.541 Y115.606 F42000
; LINE_WIDTH: 0.128029
G1 F2977
M204 S6000
G2 X128.185 Y115.517 I-.283 J.373 E.00262
; WIPE_START
G1 F15000
G1 X128.38 Y115.527 E-.39597
G1 X128.541 Y115.606 E-.36403
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.613 Y123.182 Z13.8 F42000
G1 X125.703 Y138.777 Z13.8
G1 Z13.4
G1 E.8 F1800
; LINE_WIDTH: 0.585546
G1 F2977
M204 S6000
G1 X125.686 Y138.849 E.00329
; LINE_WIDTH: 0.551042
G1 X125.668 Y138.922 E.00308
; LINE_WIDTH: 0.500064
G1 X125.651 Y138.994 E.00277
G1 X125.651 Y140.594 E.05958
; CHANGE_LAYER
; Z_HEIGHT: 13.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F7874.992
G1 X125.651 Y138.994 E-.72618
G1 X125.668 Y138.922 E-.03382
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 68/72
; update layer progress
M73 L68
M991 S0 P67 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z13.8 I-1.158 J.375 P1  F42000
G1 X125.84 Y139.452 Z13.8
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2400
M204 S6000
G1 X126.103 Y139.452 E.00871
M106 S255
G1 F1320
G1 X127.172 Y139.452 E.03545
M106 S201.45
G1 F1873.287
G1 X127.272 Y139.452 E.00333
G1 F2400
G1 X127.272 Y139.852 E.01327
G1 X127.272 Y140.35 E.01651
G1 X127.172 Y140.358 E.00334
G1 X126.907 Y140.378 E.00881
G1 X126.815 Y140.382 E.00304
G3 X125.665 Y140.397 I-.799 J-17.268 E.03819
G1 X125.665 Y139.452 E.03136
G1 X125.78 Y139.452 E.00384
; WIPE_START
G1 F8843.478
G1 X126.103 Y139.452 E-.12253
G1 X127.172 Y139.452 E-.40614
G1 X127.272 Y139.452 E-.03812
G1 X127.272 Y139.852 E-.152
G1 X127.272 Y139.961 E-.04122
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.526 Y132.365 Z14 F42000
G1 X126.072 Y127.741 Z14
G1 Z13.6
G1 E.8 F1800
G1 F2400
M204 S6000
G1 X126.072 Y116.009 E.38915
G1 X126.324 Y116.01 E.00836
G3 X126.858 Y116.027 I-.079 J10.736 E.01773
G1 X126.858 Y126.018 E.33141
G1 X126.858 Y126.418 E.01327
G1 X126.858 Y126.818 E.01327
G1 X126.858 Y127.217 E.01327
M106 S255
G1 F960
G1 X126.858 Y127.741 E.01736
M106 S201.45
M106 S255
G1 F600
G1 X126.789 Y127.741 E.00229
M106 S201.45
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X126.485 Y127.741 E.01008
M106 S201.45
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X126.132 Y127.741 E.01173
M106 S201.45
M204 S10000
G1 X125.665 Y128.148 F42000
G1 F2400
M204 S6000
G1 X125.665 Y115.602 E.41616
G1 X126.328 Y115.602 E.022
G3 X127.246 Y115.649 I-.285 J14.704 E.03048
G1 X127.265 Y115.861 E.00707
G1 X127.272 Y127.348 E.38104
G1 X127.272 Y127.748 E.01327
G1 X127.272 Y128.148 E.01327
G1 F1873.287
G1 X127.172 Y128.148 E.00333
M106 S255
G1 F1320
G1 X126.103 Y128.148 E.03545
M106 S201.45
G1 F2400
G1 X125.725 Y128.148 E.01254
; WIPE_START
G1 F3909.495
G1 X125.715 Y126.148 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.021 Y133.774 Z14 F42000
G1 X126.232 Y139.06 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2400
M204 S5000
G1 X126.632 Y139.06 E.01228
G1 X127.032 Y139.06 E.01229
G1 X127.032 Y139.019 E.00126
G1 X127.032 Y138.81 E.00642
M106 S255
G1 F1560
G1 X127.738 Y138.81 E.02168
M106 S201.45
G1 F2400
G1 X128.138 Y138.81 E.01229
G1 X128.538 Y138.81 E.01229
G1 X129.124 Y138.81 E.01801
G1 X129.124 Y140.189 E.04236
G1 X129.111 Y140.222 E.00109
G3 X128.608 Y140.494 I-.777 J-.833 E.01776
G3 X126.381 Y140.789 I-2.228 J-8.273 E.06924
G1 X125.468 Y140.79 E.02806
G3 X125.273 Y140.589 I.008 J-.203 E.00948
G1 X125.273 Y115.397 E.77409
G3 X125.473 Y115.21 I.202 J.015 E.00925
G1 X126.332 Y115.21 E.0264
G3 X128.578 Y115.496 I.09 J8.273 E.06977
G3 X129.122 Y115.796 I-.276 J1.143 E.01934
G1 X129.124 Y128.79 E.39926
G1 X128.538 Y128.79 E.01801
G1 X128.138 Y128.79 E.01229
G1 X127.738 Y128.79 E.01229
M106 S255
G1 F1560
G1 X127.032 Y128.79 E.02168
M106 S201.45
G1 F2400
G1 X127.032 Y128.581 E.00642
G1 X127.032 Y128.54 E.00126
G1 X126.632 Y128.54 E.01229
G1 X126.232 Y128.54 E.01228
G1 X126.232 Y128.581 E.00126
G1 X126.232 Y139 E.32015
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.632 Y139.06 E-.15362
G1 X127.032 Y139.06 E-.152
G1 X127.032 Y139.019 E-.01558
G1 X127.032 Y138.81 E-.07942
G1 X127.738 Y138.81 E-.26806
G1 X127.978 Y138.81 E-.09132
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


G1 X127.068 Y139.911 F42000
G1 Z13.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.576419
G1 F2400
M204 S6000
G3 X125.868 Y139.925 I-.967 J-32.045 E.05219
M204 S10000
G1 X125.753 Y139.256 F42000
; LINE_WIDTH: 0.610726
G1 F2400
M204 S6000
G1 X125.753 Y128.344 E.50488
; WIPE_START
G1 F6340.202
G1 X125.753 Y130.344 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14 I1.18 J.299 P1  F42000
G1 X126.465 Y127.537 Z14
G1 Z13.6
G1 E.8 F1800
; LINE_WIDTH: 0.422118
G1 F2400
M204 S6000
G1 X126.465 Y116.217 E.34981
; WIPE_START
G1 F9493.742
G1 X126.465 Y118.217 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.341 Y125.615 Z14 F42000
G1 X128.916 Y127.883 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2400
M204 S2000
G1 X128.217 Y128.583 E.03038
G1 X128.022 Y128.245
G1 X128.916 Y127.35 E.03887
G1 X128.916 Y126.817
G1 X127.494 Y128.239 E.06179
G1 X127.494 Y127.706
G1 X128.916 Y126.284 E.06179
G1 X128.916 Y125.75
G1 X127.494 Y127.172 E.06179
G1 X127.488 Y126.646
G1 X128.916 Y125.217 E.06208
G1 X128.916 Y124.684
G1 X127.488 Y126.112 E.06208
G1 X127.488 Y125.579
G1 X128.916 Y124.151 E.06208
G1 X128.916 Y123.617
G1 X127.488 Y125.046 E.06208
G1 X127.488 Y124.513
G1 X128.916 Y123.084 E.06208
G1 X128.916 Y122.551
G1 X127.488 Y123.979 E.06208
G1 X127.488 Y123.446
G1 X128.916 Y122.018 E.06208
G1 X128.916 Y121.484
G1 X127.488 Y122.913 E.06208
G1 X127.488 Y122.38
G1 X128.916 Y120.951 E.06208
G1 X128.916 Y120.418
G1 X127.488 Y121.846 E.06208
G1 X127.488 Y121.313
G1 X128.916 Y119.885 E.06208
G1 X128.916 Y119.351
G1 X127.488 Y120.78 E.06208
G1 X127.488 Y120.247
G1 X128.916 Y118.818 E.06208
G1 X128.916 Y118.285
G1 X127.488 Y119.713 E.06208
G1 X127.488 Y119.18
G1 X128.916 Y117.752 E.06208
G1 X128.916 Y117.218
G1 X127.488 Y118.647 E.06208
G1 X127.488 Y118.114
G1 X128.916 Y116.685 E.06208
G1 X128.916 Y116.152
G1 X127.488 Y117.58 E.06208
G1 X127.488 Y117.047
G1 X128.752 Y115.783 E.05492
G1 X128.354 Y115.648
G1 X127.488 Y116.514 E.03763
G1 X127.488 Y115.981
G1 X127.917 Y115.552 E.01865
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.488 Y115.981 E-.2306
G1 X127.488 Y116.514 E-.20264
G1 X128.096 Y115.906 E-.32676
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.906 Y116.141 Z14 F42000
G1 Z13.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.102157
G1 F2400
M204 S6000
G1 X128.906 Y115.896 E.00119
G1 X128.805 Y115.81 E.00064
; WIPE_START
G1 F15000
G1 X128.906 Y115.896 E-.26596
G1 X128.906 Y116.141 E-.49404
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.66 Y123.77 Z14 F42000
G1 X128.124 Y140.407 Z14
M73 P94 R0
G1 Z13.6
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2400
M204 S2000
G1 X128.916 Y139.615 E.03443
G1 X128.916 Y139.082
G1 X127.494 Y140.504 E.06179
G1 X127.494 Y139.971
G1 X128.448 Y139.017 E.04142
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.494 Y139.971 E-.51221
G1 X127.494 Y140.504 E-.20264
G1 X127.578 Y140.42 E-.04516
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.935 Y140.059 Z14 F42000
G1 Z13.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0903115
G1 F2400
M204 S6000
G1 X128.515 Y140.307 E.00189
M204 S10000
G1 X128.935 Y140.013 F42000
; LINE_WIDTH: 0.218546
G1 F2400
M204 S6000
G1 X128.791 Y140.126 E.00262
; LINE_WIDTH: 0.18762
G1 X128.519 Y140.315 E.0039
; CHANGE_LAYER
; Z_HEIGHT: 13.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X128.791 Y140.126 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 69/72
; update layer progress
M73 L69
M991 S0 P68 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z14 I.448 J-1.132 P1  F42000
G1 X126.456 Y139.202 Z14
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2232
M204 S6000
G1 X126.519 Y139.202 E.0021
G1 X126.519 Y140.106 E.02998
G1 X126.483 Y140.355 E.00835
G3 X125.71 Y140.394 I-.962 J-11.364 E.02568
G1 X125.71 Y115.606 E.82227
G1 X125.869 Y115.608 E.00528
G3 X126.498 Y115.646 I-.415 J12.104 E.02089
G1 X126.518 Y115.852 E.00686
G1 X126.519 Y128.398 E.41617
G1 X126.153 Y128.398 E.01214
G1 X126.153 Y139.202 E.35839
G1 X126.396 Y139.202 E.00806
M204 S250
G1 X126.545 Y138.81 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1560
M204 S5000
G1 X126.991 Y138.81 E.01372
M106 S201.45
G1 F2232
G1 X127.391 Y138.81 E.01229
G1 X127.791 Y138.81 E.01229
G1 X128.377 Y138.81 E.01801
G1 X128.377 Y140.193 E.04248
M73 P95 R0
G1 X128.351 Y140.241 E.00169
G3 X127.616 Y140.566 I-1.084 J-1.457 E.02489
G3 X125.44 Y140.774 I-1.798 J-7.314 E.06739
G3 X125.318 Y140.589 I.089 J-.192 E.00717
G1 X125.328 Y115.341 E.77581
G3 X125.504 Y115.211 I.207 J.097 E.00698
G1 X125.881 Y115.216 E.0116
G3 X127.986 Y115.55 I-.054 J7.151 E.06573
G3 X128.377 Y115.81 I-.198 J.723 E.01468
G1 X128.377 Y128.79 E.39885
G1 X127.791 Y128.79 E.01801
G1 X127.391 Y128.79 E.01229
G1 X126.991 Y128.79 E.01229
M106 S255
G1 F1560
G1 X126.545 Y128.79 E.01372
M106 S201.45
M106 S255
G1 F720
G1 X126.545 Y138.75 E.30604
M106 S201.45
; WIPE_START
M204 S6000
G1 X126.991 Y138.81 E-.17115
G1 X127.391 Y138.81 E-.152
G1 X127.791 Y138.81 E-.152
G1 X128.377 Y138.81 E-.22268
G1 X128.377 Y138.974 E-.06216
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


G1 X128.17 Y139.635 F42000
G1 Z13.8
G1 E.8 F1800
; FEATURE: Top surface
G1 F2232
M204 S2000
G1 X127.552 Y139.017 E.02684
G1 X127.328 Y139.326
G1 X128.145 Y140.144 E.03553
G1 X127.773 Y140.304
G1 X126.824 Y139.355 E.04124
G1 X126.741 Y139.806
G1 X127.349 Y140.414 E.0264
M204 S10000
G1 X126.895 Y140.511 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0996126
G1 F2232
M204 S6000
G1 X126.727 Y140.059 E.00223
; WIPE_START
G1 F15000
G1 X126.895 Y140.511 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.2 I1.215 J-.077 P1  F42000
G1 X126.115 Y128.194 Z14.2
G1 Z13.8
G1 E.8 F1800
; LINE_WIDTH: 0.443977
G1 F2232
M204 S6000
G1 X126.114 Y116.024 E.39775
G1 X125.919 Y115.814 E.00935
; WIPE_START
G1 F8976.278
G1 X126.114 Y116.024 E-.1087
G1 X126.114 Y117.738 E-.6513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.66 Y115.662 Z14.2 F42000
G1 Z13.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2232
M204 S2000
G1 X128.17 Y116.172 E.02215
G1 X128.17 Y116.705
G1 X126.987 Y115.522 E.05142
G1 X126.737 Y115.805
G1 X128.17 Y117.238 E.06227
G1 X128.17 Y117.771
G1 X126.74 Y116.342 E.06212
G1 X126.74 Y116.875
G1 X128.17 Y118.305 E.06212
G1 X128.17 Y118.838
G1 X126.74 Y117.409 E.06212
G1 X126.74 Y117.942
G1 X128.17 Y119.371 E.06211
G1 X128.17 Y119.904
G1 X126.741 Y118.475 E.06211
G1 X126.741 Y119.008
G1 X128.17 Y120.438 E.06211
G1 X128.17 Y120.971
G1 X126.741 Y119.542 E.06211
G1 X126.741 Y120.075
G1 X128.17 Y121.504 E.06211
G1 X128.17 Y122.038
G1 X126.741 Y120.608 E.06211
G1 X126.741 Y121.142
G1 X128.17 Y122.571 E.0621
G1 X128.17 Y123.104
G1 X126.741 Y121.675 E.0621
G1 X126.741 Y122.208
G1 X128.17 Y123.637 E.0621
G1 X128.17 Y124.171
G1 X126.741 Y122.742 E.0621
G1 X126.741 Y123.275
G1 X128.17 Y124.704 E.0621
G1 X128.17 Y125.237
G1 X126.741 Y123.808 E.06209
G1 X126.741 Y124.341
G1 X128.17 Y125.77 E.06209
G1 X128.17 Y126.304
G1 X126.741 Y124.875 E.06209
G1 X126.741 Y125.408
G1 X128.17 Y126.837 E.06209
G1 X128.17 Y127.37
G1 X126.741 Y125.941 E.06209
G1 X126.741 Y126.475
G1 X128.17 Y127.903 E.06209
G1 X128.17 Y128.437
G1 X126.741 Y127.008 E.06208
G1 X126.741 Y127.541
G1 X127.783 Y128.583 E.04525
; CHANGE_LAYER
; Z_HEIGHT: 14
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.741 Y127.541 E-.55965
G1 X126.741 Y127.014 E-.20035
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 70/72
; update layer progress
M73 L70
M991 S0 P69 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z14.2 I-1.211 J-.119 P1  F42000
G1 X125.759 Y137.038 Z14.2
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1707
M204 S6000
G1 X125.759 Y130.562 E.21481
G1 X126.206 Y130.562 E.01486
G1 X126.206 Y137.038 E.21481
G1 X125.819 Y137.038 E.01287
; WIPE_START
G1 F8843.478
G1 X125.8 Y135.038 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.598 Y138.81 Z14.4 F42000
G1 Z14
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1707
M204 S5000
G1 X127.631 Y138.81 E.03172
G1 X127.629 Y140.201 E.04273
G3 X127.115 Y140.495 I-.698 J-.625 E.01849
G3 X125.48 Y140.75 I-1.714 J-5.604 E.05104
G1 X125.469 Y140.746 E.00033
G3 X125.366 Y140.572 I.094 J-.173 E.00652
G1 X125.366 Y115.427 E.77264
G3 X125.563 Y115.239 I.181 J-.008 E.00946
G1 X125.955 Y115.275 E.0121
G3 X127.366 Y115.603 I-.427 J5.026 E.04467
G3 X127.63 Y115.801 I-.173 J.507 E.0103
G1 X127.631 Y128.79 E.39912
G1 X126.598 Y128.79 E.03172
G1 X126.598 Y128.831 E.00126
G1 X126.598 Y138.75 E.30478
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.631 Y138.81 E-.39297
G1 X127.629 Y139.776 E-.36703
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


G1 X126.497 Y140.435 F42000
G1 Z14
G1 E.8 F1800
; FEATURE: Top surface
G1 F1707
M204 S2000
G1 X127.423 Y139.508 E.04026
G1 X127.381 Y139.017
G1 X125.979 Y140.419 E.06092
G1 X125.995 Y139.87
G1 X126.848 Y139.017 E.03706
G1 X126.391 Y138.941
G1 X125.995 Y139.337 E.01721
G1 X125.995 Y138.804
G1 X126.391 Y138.408 E.01722
G1 X126.391 Y137.874
G1 X125.995 Y138.27 E.01721
M204 S10000
G1 X126.41 Y137.717 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.100702
G1 F1707
M204 S6000
G1 X126.035 Y137.726 E.00176
; WIPE_START
G1 F15000
G1 X126.41 Y137.717 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.4 I-1.107 J.506 P1  F42000
G1 X127.442 Y139.972 Z14.4
G1 Z14
G1 E.8 F1800
; LINE_WIDTH: 0.286154
G1 F1707
M204 S6000
G1 X127.24 Y140.12 E.00497
; LINE_WIDTH: 0.251681
G1 X126.877 Y140.367 E.00747
M204 S10000
G1 X125.753 Y140.548 F42000
; LINE_WIDTH: 0.448238
G1 F1707
M204 S6000
G1 X125.765 Y137.234 E.10945
; WIPE_START
G1 F8881.932
M73 P96 R0
G1 X125.758 Y139.234 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.245 Y131.617 Z14.4 F42000
G1 X126.391 Y129.342 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F1707
M204 S2000
G1 X125.995 Y129.738 E.01721
G1 X125.995 Y129.205
G1 X126.391 Y128.809 E.01721
G1 X126.617 Y128.583
G1 X127.423 Y127.777 E.03502
G1 X127.423 Y127.243
G1 X125.995 Y128.672 E.06207
G1 X125.995 Y128.139
G1 X127.423 Y126.71 E.06207
G1 X127.423 Y126.177
G1 X125.995 Y127.605 E.06207
G1 X125.995 Y127.072
G1 X127.423 Y125.644 E.06207
G1 X127.423 Y125.111
G1 X125.995 Y126.539 E.06206
G1 X125.995 Y126.006
G1 X127.423 Y124.577 E.06206
G1 X127.423 Y124.044
G1 X125.995 Y125.472 E.06206
G1 X125.995 Y124.939
G1 X127.423 Y123.511 E.06206
G1 X127.423 Y122.978
G1 X125.995 Y124.406 E.06206
G1 X125.995 Y123.873
G1 X127.423 Y122.444 E.06205
G1 X127.423 Y121.911
G1 X125.995 Y123.339 E.06205
G1 X125.995 Y122.806
G1 X127.423 Y121.378 E.06205
G1 X127.423 Y120.845
G1 X125.995 Y122.273 E.06205
G1 X125.995 Y121.739
G1 X127.423 Y120.312 E.06205
G1 X127.423 Y119.778
G1 X125.995 Y121.206 E.06205
G1 X125.995 Y120.673
G1 X127.423 Y119.245 E.06204
G1 X127.423 Y118.712
G1 X125.995 Y120.14 E.06204
G1 X125.995 Y119.606
G1 X127.423 Y118.179 E.06204
G1 X127.423 Y117.646
G1 X125.995 Y119.073 E.06204
G1 X125.995 Y118.54
G1 X127.423 Y117.112 E.06204
G1 X127.423 Y116.579
G1 X125.995 Y118.007 E.06204
G1 X125.995 Y117.473
G1 X127.422 Y116.046 E.06203
G1 X127.184 Y115.751
G1 X125.995 Y116.94 E.05166
G1 X125.995 Y116.407
G1 X126.775 Y115.627 E.0339
G1 X126.332 Y115.536
G1 X125.995 Y115.874 E.01466
M204 S10000
G1 X126.394 Y129.929 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.103386
G1 F1707
M204 S6000
G1 X125.976 Y129.872 E.00208
M204 S10000
G1 X125.765 Y130.366 F42000
; LINE_WIDTH: 0.448495
G1 F1707
M204 S6000
G1 X125.765 Y115.88 E.47873
G1 X125.74 Y115.452 E.01419
; CHANGE_LAYER
; Z_HEIGHT: 14.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8876.293
G1 X125.765 Y115.88 E-.16315
G1 X125.765 Y117.451 E-.59685
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 71/72
; update layer progress
M73 L71
M991 S0 P70 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z14.4 I-1.217 J.003 P1  F42000
G1 X125.81 Y137.038 Z14.4
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1383
M204 S6000
G1 X125.81 Y130.562 E.21481
G1 X126.26 Y130.562 E.01493
G1 X126.26 Y137.038 E.21481
G1 X125.87 Y137.038 E.01294
; WIPE_START
G1 F8843.478
G1 X125.851 Y135.038 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.884 Y139.128 Z14.6 F42000
G1 Z14.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1383
M204 S5000
G1 X126.884 Y140.185 E.03247
G1 X126.872 Y140.223 E.00123
G3 X126.137 Y140.562 I-.978 J-1.153 E.02517
G3 X125.535 Y140.671 I-.926 J-3.401 E.01882
G1 X125.462 Y140.621 E.00273
G3 X125.418 Y140.442 I.249 J-.156 E.00577
G1 X125.418 Y115.558 E.7646
G3 X125.582 Y115.326 I.18 J-.047 E.00996
G3 X126.76 Y115.68 I-.406 J3.488 E.03799
G3 X126.884 Y115.813 I-.104 J.222 E.00574
G1 X126.884 Y128.79 E.39876
G1 X126.652 Y128.79 E.00714
G1 X126.652 Y128.831 E.00126
G1 X126.652 Y138.769 E.30537
G1 X126.652 Y138.81 E.00126
G1 X126.884 Y138.81 E.00714
G1 X126.884 Y139.068 E.00793
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.884 Y140.185 E-.42432
G1 X126.872 Y140.223 E-.01527
G1 X126.789 Y140.3 E-.04288
G1 X126.614 Y140.399 E-.07642
G1 X126.137 Y140.562 E-.19161
G1 X126.113 Y140.567 E-.0095
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


G1 X126.445 Y137.91 F42000
G1 Z14.2
G1 E.8 F1800
; FEATURE: Top surface
G1 F1383
M204 S2000
G1 X125.795 Y137.26 E.02822
G1 X125.625 Y137.624
G1 X126.445 Y138.443 E.03561
G1 X126.445 Y138.976
G1 X125.625 Y138.157 E.03561
G1 X125.625 Y138.69
G1 X126.677 Y139.742 E.04571
G1 X126.584 Y140.182
G1 X125.625 Y139.223 E.04167
G1 X125.625 Y139.757
G1 X126.197 Y140.329 E.02485
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.625 Y139.757 E-.30735
G1 X125.625 Y139.223 E-.20264
G1 X126.09 Y139.689 E-.25001
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.282 Y132.058 Z14.6 F42000
G1 X126.677 Y116.279 Z14.6
G1 Z14.2
G1 E.8 F1800
G1 F1383
M204 S2000
G1 X126.024 Y115.625 E.02839
G1 X125.625 Y115.76
G1 X126.677 Y116.812 E.04571
G1 X126.677 Y117.345
G1 X125.625 Y116.293 E.04571
G1 X125.625 Y116.827
G1 X126.677 Y117.878 E.04571
G1 X126.677 Y118.412
G1 X125.625 Y117.36 E.04571
G1 X125.625 Y117.893
G1 X126.677 Y118.945 E.04571
G1 X126.677 Y119.478
G1 X125.625 Y118.426 E.04571
G1 X125.625 Y118.96
G1 X126.677 Y120.011 E.04571
G1 X126.677 Y120.545
G1 X125.625 Y119.493 E.04571
G1 X125.625 Y120.026
G1 X126.677 Y121.078 E.04571
G1 X126.677 Y121.611
G1 X125.625 Y120.559 E.04571
G1 X125.625 Y121.093
G1 X126.677 Y122.144 E.04571
G1 X126.677 Y122.678
G1 X125.625 Y121.626 E.04571
G1 X125.625 Y122.159
G1 X126.677 Y123.211 E.04571
G1 X126.677 Y123.744
G1 X125.625 Y122.692 E.04571
G1 X125.625 Y123.226
G1 X126.677 Y124.277 E.04571
G1 X126.677 Y124.811
G1 X125.625 Y123.759 E.04571
G1 X125.625 Y124.292
G1 X126.677 Y125.344 E.04571
G1 X126.677 Y125.877
G1 X125.625 Y124.825 E.04571
G1 X125.625 Y125.359
G1 X126.677 Y126.411 E.04571
G1 X126.677 Y126.944
G1 X125.625 Y125.892 E.04571
G1 X125.625 Y126.425
G1 X126.677 Y127.477 E.04571
G1 X126.677 Y128.01
G1 X125.625 Y126.958 E.04571
G1 X125.625 Y127.492
G1 X126.677 Y128.544 E.04571
G1 X126.445 Y128.844
G1 X125.625 Y128.025 E.03561
G1 X125.625 Y128.558
M73 P97 R0
G1 X126.445 Y129.378 E.03561
G1 X126.445 Y129.911
G1 X125.625 Y129.091 E.03561
G1 X125.625 Y129.625
G1 X126.34 Y130.34 E.03107
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.625 Y129.625 E-.38419
G1 X125.625 Y129.091 E-.20264
G1 X125.947 Y129.414 E-.17317
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.371 Y121.793 Z14.6 F42000
G1 X126.696 Y115.933 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.137434
G1 F1383
M204 S6000
G1 X126.523 Y115.807 E.00165
; LINE_WIDTH: 0.101881
G1 X126.445 Y115.754 E.00046
; CHANGE_LAYER
; Z_HEIGHT: 14.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X126.523 Y115.807 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 72/72
; update layer progress
M73 L72
M991 S0 P71 ;notify layer change
M106 S204
; OBJECT_ID: 394
M204 S10000
G17
G3 Z14.6 I-1.217 J-.019 P1  F42000
G1 X126.138 Y140.192 Z14.6
G1 Z14.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X126.125 Y140.223 E.00102
G3 X125.579 Y140.498 I-.795 J-.901 E.019
G1 X125.548 Y140.473 E.00121
G3 X125.491 Y140.195 I.438 J-.235 E.00885
G1 X125.491 Y115.806 E.7494
G3 X125.581 Y115.502 I.332 J-.068 E.01014
G1 X125.595 Y115.5 E.00044
G3 X126.137 Y115.801 I-.169 J.944 E.01941
G1 X126.138 Y140.132 E.74764
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.125 Y140.223 E-.03479
G1 X126.006 Y140.325 E-.05971
G1 X125.873 Y140.397 E-.05719
G1 X125.579 Y140.498 E-.11833
G1 X125.548 Y140.473 E-.01494
G1 X125.504 Y140.354 E-.04811
G1 X125.491 Y140.195 E-.06085
G1 X125.491 Y139.231 E-.36608
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


G1 X125.713 Y140.252 F42000
G1 Z14.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.297687
G1 F1200
M204 S6000
G1 X125.815 Y140.062 E.00446
G1 X125.815 Y115.938 E.50081
G1 X125.715 Y115.749 E.00444
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F14130.577
G1 X125.815 Y115.938 E-.08126
G1 X125.815 Y117.725 E-.67875
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.8 I1.217 J0 P1  F42000
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
G1 Z14.8 F900 ; lower z a little
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

    G1 Z114.4 F600
    G1 Z112.4

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

