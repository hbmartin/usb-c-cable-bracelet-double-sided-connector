; HEADER_BLOCK_START
; BambuStudio 02.08.02.61
; model printing time: 15m 39s; total estimated time: 21m 56s
; total layer number: 72
; total filament length [mm] : 1404.75
; total filament volume [cm^3] : 3378.81
; total filament weight [g] : 4.19
; model label id: 394,405,416
; object max height: 14.40,14.40,14.40
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
M73 P7 R20
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
M73 P27 R16
G1 Z2 F1200
G1 X112 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
M73 P27 R15
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
    G29 A1 X102.245 Y120.8 I51.5092 J14.4
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
M73 P28 R15
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
; layer num/total_layer_count: 1/72
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
G1 X145.933 Y133.05 F42000
M204 S6000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X145.933 Y122.95 E.37619
G1 X150.833 Y122.95 E.18251
G1 X150.833 Y133.05 E.37619
G1 X145.993 Y133.05 E.18027
; WIPE_START
G1 X145.982 Y131.05 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X149.993 Y124.557 Z.6 F42000
G1 X151.267 Y122.493 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X145.503 Y122.493 E.21472
G1 X145.503 Y121.995 E.01855
G1 X151.267 Y121.995 E.21472
G1 X151.267 Y122.433 E.01631
; WIPE_START
G1 X149.268 Y122.454 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X150.57 Y129.974 Z.6 F42000
G1 X151.267 Y134.005 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X145.503 Y134.005 E.21472
G1 X145.503 Y133.507 E.01855
G1 X151.267 Y133.507 E.21472
G1 X151.267 Y133.945 E.01631
M204 S6000
G1 X151.715 Y134.462 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X145.055 Y134.462 E.24805
G3 X145.045 Y134.385 I.336 J-.08 E.00292
G1 X145.045 Y121.612 E.47573
G3 X145.055 Y121.538 I.292 J0 E.0028
G1 X145.471 Y121.538 E.01549
G1 X151.714 Y121.538 E.23254
G3 X151.725 Y121.614 I-.305 J.079 E.00285
G1 X151.715 Y134.402 E.47631
; WIPE_START
G1 X149.715 Y134.42 E-.76
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
G1 X151.279 Y133.278 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.47694
G1 F3000
M204 S500
G1 X151.279 Y122.722 E.37337
; WIPE_START
G1 X151.279 Y124.722 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X145.489 Y122.722 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.47384
G1 F3000
M204 S500
G1 X145.489 Y133.278 E.3707
; OBJECT_ID: 405
; WIPE_START
G1 X145.489 Y131.278 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S6000
G1 X137.887 Y131.953 Z.6 F42000
G1 X124.689 Y133.125 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X124.689 Y122.875 E.38177
G1 X129.739 Y122.875 E.18809
G1 X129.739 Y133.125 E.38177
G1 X124.749 Y133.125 E.18586
; WIPE_START
G1 X124.737 Y131.125 E-.76
; WIPE_END
M73 P29 R15
G1 E-.04 F1800
M204 S6000
G1 X128.738 Y124.626 Z.6 F42000
G1 X130.098 Y122.418 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X124.333 Y122.418 E.21472
G1 X124.333 Y121.995 E.01576
G1 X130.098 Y121.995 E.21472
G1 X130.098 Y122.358 E.01351
; WIPE_START
G1 X128.098 Y122.379 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X129.392 Y129.901 Z.6 F42000
G1 X130.098 Y134.005 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X124.333 Y134.005 E.21472
G1 X124.333 Y133.582 E.01576
G1 X130.098 Y133.582 E.21472
G1 X130.098 Y133.945 E.01351
M204 S6000
G1 X130.545 Y134.462 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X123.885 Y134.462 E.24805
G3 X123.876 Y134.385 I.336 J-.08 E.00292
G1 X123.876 Y121.612 E.47573
G3 X123.885 Y121.538 I.292 J0 E.0028
G1 X124.301 Y121.538 E.01549
G1 X130.545 Y121.538 E.23254
G3 X130.555 Y121.614 I-.305 J.079 E.00285
G1 X130.545 Y134.402 E.47631
; WIPE_START
G1 X128.545 Y134.42 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X130.147 Y133.353 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.40194
G1 F3000
M204 S500
G1 X130.147 Y122.647 E.31324
; WIPE_START
G1 X130.147 Y124.647 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X124.282 Y122.647 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.39884
G1 F3000
M204 S500
G1 X124.282 Y133.353 E.31053
; OBJECT_ID: 394
; WIPE_START
G1 X124.282 Y131.353 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S6000
G1 X116.68 Y132.027 Z.6 F42000
G1 X103.444 Y133.2 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X103.444 Y122.8 E.38736
G1 X108.644 Y122.8 E.19368
G1 X108.644 Y133.2 E.38736
G1 X103.504 Y133.2 E.19145
; WIPE_START
G1 X103.492 Y131.2 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X107.485 Y124.695 Z.6 F42000
G1 X108.928 Y122.343 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X103.163 Y122.343 E.21472
G1 X103.163 Y121.995 E.01297
G1 X108.928 Y121.995 E.21472
G1 X108.928 Y122.283 E.01072
; WIPE_START
G1 X106.928 Y122.304 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X108.214 Y129.827 Z.6 F42000
G1 X108.928 Y134.005 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X103.163 Y134.005 E.21472
G1 X103.163 Y133.657 E.01297
G1 X108.928 Y133.657 E.21472
G1 X108.928 Y133.945 E.01072
M204 S6000
G1 X109.375 Y134.462 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X102.715 Y134.462 E.24805
G3 X102.706 Y134.385 I.336 J-.08 E.00292
G1 X102.706 Y121.612 E.47573
G3 X102.716 Y121.538 I.292 J0 E.0028
G1 X103.131 Y121.538 E.01549
G1 X109.375 Y121.538 E.23254
G3 X109.385 Y121.614 I-.305 J.079 E.00285
G1 X109.375 Y134.402 E.47631
; WIPE_START
G1 X107.375 Y134.42 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X109.014 Y133.428 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.32694
G1 F3000
M204 S500
G1 X109.014 Y122.572 E.25127
; WIPE_START
G1 X109.014 Y124.572 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X103.075 Y122.572 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.32384
G1 F3000
M204 S500
G1 X103.075 Y133.428 E.24853
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
G1 X103.075 Y131.428 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 2/72
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
G3 Z.6 I.228 J1.195 P1  F42000
G1 X151.163 Y122.266 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7132
M204 S6000
G1 X145.607 Y122.266 E.18432
G1 X145.607 Y121.985 E.00932
G1 X151.163 Y121.985 E.18432
G1 X151.163 Y122.206 E.00733
; WIPE_START
G1 F8843.478
G1 X149.163 Y122.227 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.101 Y129.576 Z.8 F42000
G1 X146.048 Y133.327 Z.8
G1 Z.4
G1 E.8 F1800
G1 F7132
M204 S6000
G1 X145.656 Y133.327 E.01301
G1 X145.656 Y122.673 E.35342
G1 X151.111 Y122.673 E.18092
G1 X151.111 Y133.327 E.35342
G1 X146.108 Y133.327 E.16593
M204 S250
G1 X146.048 Y132.935 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7132
M204 S5000
G1 X146.048 Y123.065 E.30328
G1 X150.718 Y123.065 E.1435
G1 X150.718 Y132.935 E.30328
G1 X146.108 Y132.935 E.14165
; WIPE_START
G1 F9547.055
M204 S6000
G1 X146.096 Y130.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.163 Y134.015 Z.8 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7132
M204 S6000
G1 X145.607 Y134.015 E.18432
G1 X145.607 Y133.734 E.00933
G1 X151.163 Y133.734 E.18432
G1 X151.163 Y133.955 E.00733
M204 S10000
G1 X151.57 Y134.422 F42000
G1 F7132
M204 S6000
G1 X145.2 Y134.422 E.21132
G1 X145.2 Y121.578 E.42608
G1 X151.57 Y121.578 E.21132
G1 X151.57 Y134.362 E.42409
M204 S250
G1 X151.958 Y134.507 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X151.949 Y134.593 E.00267
G1 F2760
G1 X151.932 Y134.664 E.00224
G1 F2520
G1 X151.914 Y134.712 E.00159
G1 F2280
G1 X151.894 Y134.746 E.00121
G1 F2040
G1 X151.875 Y134.77 E.00092
G1 F1920
G1 X151.843 Y134.797 E.0013
M106 S255
G1 F1800
G1 X151.818 Y134.809 E.00086
M106 S201.45
M106 S255
G1 F1680
G1 X151.801 Y134.813 E.00052
G3 X145.594 Y134.814 I-3.279 J-609.322 E.19073
G3 X144.971 Y134.813 I-.3 J-4.064 E.01918
G1 X144.954 Y134.809 E.00054
M106 S201.45
M106 S255
G1 F1800
G1 X144.917 Y134.788 E.00129
M106 S201.45
G1 F1920
G1 X144.896 Y134.77 E.00086
G1 F2040
G1 X144.876 Y134.745 E.00098
G1 F2280
G1 X144.856 Y134.71 E.00124
G1 F2520
G1 X144.837 Y134.659 E.00166
G1 F2760
G1 X144.82 Y134.583 E.00238
G1 F3000
G1 X144.812 Y134.503 E.00249
G1 F4800
G1 X144.809 Y134.103 E.01229
G1 X144.808 Y133.796 E.00943
G1 X144.808 Y122.204 E.35617
G1 X144.809 Y121.897 E.00943
G1 X144.812 Y121.497 E.01229
G1 F3000
G1 X144.82 Y121.417 E.00249
G1 F2760
M73 P30 R15
G1 X144.837 Y121.341 E.00239
G1 F2520
G1 X144.856 Y121.292 E.0016
G1 F2280
G1 X144.883 Y121.247 E.00162
G1 F2040
G1 X144.896 Y121.23 E.00065
G1 F1920
G1 X144.917 Y121.212 E.00086
M106 S255
G1 F1800
G1 X144.954 Y121.191 E.00129
M106 S201.45
M106 S255
G1 F1680
G1 X144.97 Y121.187 E.00052
G3 X151.179 Y121.186 I3.277 J569.779 E.19076
G3 X151.802 Y121.187 I.3 J4.146 E.01917
M106 S201.45
M106 S255
G1 X151.814 Y121.19 E.00038
M106 S201.45
M106 S255
G1 F1800
G1 X151.855 Y121.211 E.00139
M106 S201.45
G1 F1920
G1 X151.873 Y121.228 E.00077
G1 F2040
G1 X151.894 Y121.254 E.00102
G1 F2280
G1 X151.914 Y121.288 E.00121
G1 F2520
G1 X151.933 Y121.337 E.00164
G1 F2640
G1 X151.943 Y121.379 E.0013
G1 F3000
G1 X151.957 Y121.486 E.00334
G1 F4800
G1 X151.96 Y121.886 E.01229
G1 X151.962 Y122.205 E.00978
G1 X151.962 Y133.796 E.35616
G3 X151.961 Y134.447 I-9.207 J.3 E.02001
; OBJECT_ID: 405
; WIPE_START
M204 S6000
G1 X151.949 Y134.593 E-.05577
G1 X151.932 Y134.664 E-.0277
G1 X151.914 Y134.712 E-.01968
G1 X151.894 Y134.746 E-.01494
G1 X151.875 Y134.77 E-.0114
G1 X151.843 Y134.797 E-.01602
G1 X151.818 Y134.809 E-.01062
G1 X151.801 Y134.813 E-.00639
G1 X150.229 Y134.813 E-.5975
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X142.608 Y134.39 Z.8 F42000
G1 X124.804 Y133.402 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7132
M204 S6000
G1 X124.412 Y133.402 E.01301
G1 X124.412 Y122.598 E.35839
G1 X130.016 Y122.598 E.1859
G1 X130.016 Y133.402 E.35839
G1 X124.864 Y133.402 E.1709
M204 S250
G1 X124.804 Y133.01 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7132
M204 S5000
G1 X124.804 Y122.99 E.30789
G1 X129.624 Y122.99 E.14811
G1 X129.624 Y133.01 E.30789
G1 X124.864 Y133.01 E.14626
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.852 Y131.01 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.401 Y134.422 Z.8 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7132
M204 S6000
G1 X124.03 Y134.422 E.21132
G1 X124.03 Y121.578 E.42608
G1 X130.401 Y121.578 E.21132
G1 X130.401 Y134.362 E.42409
M204 S250
G1 X130.788 Y134.507 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X130.779 Y134.593 E.00267
G1 F2760
G1 X130.763 Y134.664 E.00224
G1 F2520
G1 X130.744 Y134.712 E.00159
G1 F2280
G1 X130.724 Y134.746 E.00121
G1 F2040
G1 X130.706 Y134.77 E.00092
G1 F1920
G1 X130.673 Y134.797 E.0013
M106 S255
G1 F1800
G1 X130.648 Y134.809 E.00086
M106 S201.45
M106 S255
G1 F1680
G1 X130.632 Y134.813 E.00052
G3 X124.424 Y134.814 I-3.279 J-609.322 E.19073
G3 X123.801 Y134.813 I-.3 J-4.064 E.01918
G1 X123.784 Y134.809 E.00054
M106 S201.45
M106 S255
G1 F1800
G1 X123.747 Y134.788 E.00129
M106 S201.45
G1 F1920
G1 X123.726 Y134.77 E.00086
G1 F2040
G1 X123.707 Y134.745 E.00098
G1 F2280
G1 X123.686 Y134.71 E.00124
G1 F2520
G1 X123.667 Y134.659 E.00166
G1 F2760
G1 X123.65 Y134.583 E.00238
G1 F3000
G1 X123.642 Y134.503 E.00249
G1 F4800
G1 X123.64 Y134.103 E.01229
G1 X123.638 Y133.796 E.00943
G1 X123.638 Y122.204 E.35617
G1 X123.64 Y121.897 E.00943
G1 X123.642 Y121.497 E.01229
G1 F3000
G1 X123.65 Y121.417 E.00249
G1 F2760
G1 X123.667 Y121.341 E.00239
G1 F2520
G1 X123.686 Y121.292 E.0016
G1 F2280
G1 X123.713 Y121.247 E.00162
G1 F2040
G1 X123.726 Y121.23 E.00065
G1 F1920
G1 X123.747 Y121.212 E.00086
M106 S255
G1 F1800
G1 X123.784 Y121.191 E.00129
M106 S201.45
M106 S255
G1 F1680
G1 X123.801 Y121.187 E.00052
G3 X130.009 Y121.186 I3.277 J569.779 E.19076
G3 X130.632 Y121.187 I.3 J4.146 E.01917
M106 S201.45
M106 S255
G1 X130.644 Y121.19 E.00038
M106 S201.45
M106 S255
G1 F1800
G1 X130.685 Y121.211 E.00139
M106 S201.45
G1 F1920
G1 X130.704 Y121.228 E.00077
G1 F2040
G1 X130.724 Y121.254 E.00102
G1 F2280
G1 X130.744 Y121.288 E.00121
G1 F2520
G1 X130.763 Y121.337 E.00164
G1 F2640
G1 X130.773 Y121.379 E.0013
G1 F3000
G1 X130.788 Y121.486 E.00334
G1 F4800
G1 X130.79 Y121.886 E.01229
G1 X130.793 Y122.205 E.00978
G1 X130.793 Y133.796 E.35616
G3 X130.791 Y134.447 I-9.207 J.3 E.02001
; WIPE_START
M204 S6000
G1 X130.779 Y134.593 E-.05577
G1 X130.763 Y134.664 E-.0277
G1 X130.744 Y134.712 E-.01968
G1 X130.724 Y134.746 E-.01494
G1 X130.706 Y134.77 E-.0114
G1 X130.673 Y134.797 E-.01602
G1 X130.648 Y134.809 E-.01062
G1 X130.632 Y134.813 E-.00639
G1 X129.059 Y134.813 E-.5975
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
G1 X130.197 Y133.912 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.656058
G1 F5871.438
M204 S6000
G1 X124.234 Y133.912 E.29795
M204 S10000
G1 X124.234 Y122.088 F42000
; LINE_WIDTH: 0.656056
G1 F5871.463
M204 S6000
G1 X130.197 Y122.088 E.29795
; OBJECT_ID: 394
; WIPE_START
G1 X128.197 Y122.088 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X121.269 Y125.29 Z.8 F42000
G1 X103.559 Y133.477 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7132
M204 S6000
G1 X103.167 Y133.477 E.01301
G1 X103.167 Y122.523 E.36337
G1 X108.921 Y122.523 E.19088
G1 X108.921 Y133.477 E.36337
G1 X103.619 Y133.477 E.17588
M204 S250
G1 X103.559 Y133.085 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7132
M204 S5000
G1 X103.559 Y122.915 E.3125
G1 X108.529 Y122.915 E.15271
G1 X108.529 Y133.085 E.3125
G1 X103.619 Y133.085 E.15087
; WIPE_START
G1 F9547.055
M204 S6000
G1 X103.607 Y131.085 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.231 Y134.422 Z.8 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7132
M204 S6000
G1 X102.86 Y134.422 E.21132
G1 X102.86 Y121.578 E.42608
G1 X109.231 Y121.578 E.21132
G1 X109.231 Y134.362 E.42409
M204 S250
G1 X109.619 Y134.507 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X109.609 Y134.593 E.00267
G1 F2760
G1 X109.593 Y134.664 E.00224
G1 F2520
G1 X109.574 Y134.712 E.00159
G1 F2280
G1 X109.554 Y134.746 E.00121
G1 F2040
G1 X109.536 Y134.77 E.00092
G1 F1920
G1 X109.503 Y134.797 E.0013
M106 S255
G1 F1800
G1 X109.478 Y134.809 E.00086
M106 S201.45
M106 S255
G1 F1680
G1 X109.462 Y134.813 E.00052
G3 X103.255 Y134.814 I-3.279 J-609.322 E.19073
G3 X102.631 Y134.813 I-.3 J-4.064 E.01918
G1 X102.614 Y134.809 E.00054
M106 S201.45
M106 S255
G1 F1800
G1 X102.578 Y134.788 E.00129
M106 S201.45
G1 F1920
G1 X102.557 Y134.77 E.00086
G1 F2040
G1 X102.537 Y134.745 E.00098
G1 F2280
G1 X102.517 Y134.71 E.00124
G1 F2520
G1 X102.498 Y134.659 E.00166
G1 F2760
G1 X102.481 Y134.583 E.00238
G1 F3000
G1 X102.472 Y134.503 E.00249
G1 F4800
G1 X102.47 Y134.103 E.01229
G1 X102.468 Y133.796 E.00943
G1 X102.468 Y122.204 E.35617
G1 X102.47 Y121.897 E.00943
G1 X102.472 Y121.497 E.01229
G1 F3000
G1 X102.481 Y121.417 E.00249
G1 F2760
G1 X102.498 Y121.341 E.00239
G1 F2520
G1 X102.516 Y121.292 E.0016
G1 F2280
G1 X102.543 Y121.247 E.00162
G1 F2040
G1 X102.556 Y121.23 E.00065
G1 F1920
G1 X102.577 Y121.212 E.00086
M106 S255
G1 F1800
G1 X102.614 Y121.191 E.00129
M106 S201.45
M106 S255
G1 F1680
G1 X102.631 Y121.187 E.00052
G3 X108.839 Y121.186 I3.277 J569.779 E.19076
G3 X109.462 Y121.187 I.3 J4.146 E.01917
M106 S201.45
M106 S255
G1 X109.475 Y121.19 E.00038
M106 S201.45
M106 S255
G1 F1800
G1 X109.515 Y121.211 E.00139
M106 S201.45
G1 F1920
G1 X109.534 Y121.228 E.00077
G1 F2040
G1 X109.554 Y121.254 E.00102
G1 F2280
G1 X109.574 Y121.288 E.00121
G1 F2520
G1 X109.593 Y121.337 E.00164
G1 F2640
G1 X109.603 Y121.379 E.0013
G1 F3000
G1 X109.618 Y121.486 E.00334
G1 F4800
G1 X109.621 Y121.886 E.01229
G1 X109.623 Y122.205 E.00978
G1 X109.623 Y133.796 E.35616
G3 X109.621 Y134.447 I-9.207 J.3 E.02001
M204 S10000
G1 X109.027 Y133.95 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.581057
G1 F6689.75
M204 S6000
G1 X103.064 Y133.95 E.26151
M204 S10000
G1 X103.064 Y122.05 F42000
; LINE_WIDTH: 0.581055
G1 F6689.778
M204 S6000
G1 X109.027 Y122.05 E.26151
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6689.778
G1 X107.027 Y122.05 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 3/72
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z.8 I-.007 J1.217 P1  F42000
G1 X146.048 Y122.266 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5826
M204 S6000
G1 X145.595 Y122.266 E.01505
G1 X145.595 Y121.868 E.01321
G1 X151.177 Y121.868 E.18517
G1 X151.177 Y122.266 E.01321
G1 X146.108 Y122.266 E.16813
; WIPE_START
G1 F8843.478
G1 X145.595 Y122.266 E-.19519
G1 X145.595 Y121.868 E-.1513
G1 X146.683 Y121.868 E-.41351
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.261 Y129.488 Z1 F42000
G1 X146.048 Y133.327 Z1
G1 Z.6
G1 E.8 F1800
G1 F5826
M204 S6000
G1 X145.656 Y133.327 E.01301
G1 X145.656 Y122.673 E.35342
G1 X151.111 Y122.673 E.18092
G1 X151.111 Y133.327 E.35342
G1 X146.108 Y133.327 E.16593
M204 S250
G1 X146.048 Y132.935 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5826
M204 S5000
G1 X146.048 Y123.065 E.30328
G1 X150.718 Y123.065 E.1435
G1 X150.718 Y132.935 E.30328
G1 X146.108 Y132.935 E.14165
; WIPE_START
G1 F9547.055
M204 S6000
G1 X146.096 Y130.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.177 Y134.132 Z1 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5826
M204 S6000
G1 X145.595 Y134.132 E.18517
G1 X145.595 Y133.734 E.01321
G1 X151.177 Y133.734 E.18517
G1 X151.177 Y134.072 E.01122
M204 S10000
G1 X151.584 Y134.54 F42000
G1 F5826
M204 S6000
G1 X145.188 Y134.539 E.21217
G1 X145.188 Y121.461 E.43384
G1 X151.584 Y121.461 E.21217
G1 X151.584 Y134.48 E.43186
M204 S250
G1 X151.976 Y134.657 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5826
M204 S5000
G1 X151.976 Y134.663 E.00018
G1 X151.974 Y134.717 E.00167
G1 X151.968 Y134.758 E.00126
G1 X151.959 Y134.792 E.00109
G1 X151.946 Y134.823 E.00103
G1 X151.931 Y134.85 E.00095
G1 X151.894 Y134.891 E.0017
G1 X151.873 Y134.906 E.00078
G1 X151.808 Y134.93 E.00213
G1 F5700
G3 X145.594 Y134.931 I-3.253 J-571.176 E.19095
G3 X144.966 Y134.93 I-.3 J-5.106 E.01929
G1 F5826
G1 X144.905 Y134.908 E.00199
G1 X144.881 Y134.891 E.0009
G1 X144.86 Y134.869 E.00095
G1 X144.842 Y134.847 E.00087
G1 X144.827 Y134.82 E.00097
G1 X144.814 Y134.79 E.00099
G1 X144.802 Y134.738 E.00164
G1 X144.798 Y134.711 E.00086
G1 X144.796 Y134.663 E.00148
G1 X144.796 Y121.337 E.40945
G1 X144.798 Y121.29 E.00147
G1 X144.804 Y121.247 E.00131
G1 X144.813 Y121.212 E.00111
G1 X144.827 Y121.18 E.00106
G1 X144.842 Y121.152 E.00098
G1 X144.86 Y121.131 E.00087
G1 X144.882 Y121.108 E.00096
G1 X144.925 Y121.081 E.00156
G1 X144.966 Y121.07 E.00132
G1 F5700
G3 X151.181 Y121.069 I3.273 J605.867 E.19097
G3 X151.808 Y121.07 I.3 J5.095 E.01928
G1 F5826
G1 X151.873 Y121.094 E.00212
G1 X151.89 Y121.106 E.00064
G1 X151.913 Y121.128 E.00098
G1 X151.932 Y121.152 E.00095
G1 X151.946 Y121.177 E.00085
G1 X151.958 Y121.205 E.00094
G1 X151.971 Y121.26 E.00175
G1 X151.974 Y121.283 E.0007
G1 X151.976 Y121.335 E.00162
G1 X151.976 Y121.342 E.0002
G1 X151.976 Y134.597 E.40729
; WIPE_START
G1 F9547.055
M204 S6000
G1 X151.976 Y134.663 E-.02505
G1 X151.974 Y134.717 E-.02065
G1 X151.968 Y134.758 E-.0156
G1 X151.959 Y134.792 E-.01354
G1 X151.946 Y134.823 E-.01272
G1 X151.931 Y134.85 E-.01179
G1 X151.894 Y134.891 E-.02103
G1 X151.873 Y134.906 E-.00961
G1 X151.808 Y134.93 E-.02631
G1 X150.219 Y134.93 E-.60371
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
G1 X151.347 Y133.531 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.10929
G1 F5826
M204 S6000
G1 X151.347 Y122.469 E.05982
M204 S10000
G1 X145.422 Y122.469 F42000
; LINE_WIDTH: 0.1045
G1 F5826
M204 S6000
G1 X145.422 Y133.531 E.0555
; OBJECT_ID: 405
; WIPE_START
G1 F15000
G1 X145.422 Y131.531 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X138.47 Y128.381 Z1 F42000
G1 X124.804 Y122.191 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5826
M204 S6000
G1 X124.425 Y122.191 E.01256
G1 X124.425 Y121.868 E.01072
G1 X130.007 Y121.868 E.18517
G1 X130.007 Y122.191 E.01072
G1 X124.864 Y122.191 E.17062
; WIPE_START
G1 F8843.478
G1 X124.425 Y122.191 E-.16669
G1 X124.425 Y121.868 E-.1228
M73 P31 R15
G1 X125.663 Y121.868 E-.47051
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.096 Y129.479 Z1 F42000
G1 X124.804 Y133.402 Z1
G1 Z.6
G1 E.8 F1800
G1 F5826
M204 S6000
G1 X124.412 Y133.402 E.01301
G1 X124.412 Y122.598 E.35839
G1 X130.016 Y122.598 E.1859
G1 X130.016 Y133.402 E.35839
G1 X124.864 Y133.402 E.1709
M204 S250
G1 X124.804 Y133.01 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5826
M204 S5000
G1 X124.804 Y122.99 E.30789
G1 X129.624 Y122.99 E.14811
G1 X129.624 Y133.01 E.30789
G1 X124.864 Y133.01 E.14626
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.852 Y131.01 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.007 Y134.132 Z1 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5826
M204 S6000
G1 X124.425 Y134.132 E.18517
G1 X124.425 Y133.809 E.01072
G1 X130.007 Y133.809 E.18517
G1 X130.007 Y134.072 E.00873
M204 S10000
G1 X130.414 Y134.54 F42000
G1 F5826
M204 S6000
G1 X124.018 Y134.539 E.21217
G1 X124.018 Y121.461 E.43384
G1 X130.414 Y121.461 E.21217
G1 X130.414 Y134.48 E.43186
M204 S250
G1 X130.806 Y134.657 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5826
M204 S5000
G1 X130.806 Y134.663 E.00018
G1 X130.804 Y134.717 E.00167
G1 X130.798 Y134.758 E.00126
G1 X130.789 Y134.792 E.00109
G1 X130.776 Y134.823 E.00103
G1 X130.761 Y134.85 E.00095
G1 X130.724 Y134.891 E.0017
G1 X130.703 Y134.906 E.00078
G1 X130.638 Y134.93 E.00213
G1 F5700
G3 X124.424 Y134.931 I-3.253 J-571.176 E.19095
G3 X123.797 Y134.93 I-.3 J-5.106 E.01929
G1 F5826
G1 X123.736 Y134.908 E.00199
G1 X123.712 Y134.891 E.0009
G1 X123.69 Y134.869 E.00095
G1 X123.672 Y134.847 E.00087
G1 X123.657 Y134.82 E.00097
G1 X123.645 Y134.79 E.00099
G1 X123.632 Y134.738 E.00164
G1 X123.628 Y134.711 E.00086
G1 X123.626 Y134.663 E.00148
G1 X123.626 Y121.337 E.40945
G1 X123.628 Y121.29 E.00147
G1 X123.634 Y121.247 E.00131
G1 X123.643 Y121.212 E.00111
G1 X123.657 Y121.18 E.00106
G1 X123.672 Y121.152 E.00098
G1 X123.69 Y121.131 E.00087
G1 X123.712 Y121.108 E.00096
G1 X123.755 Y121.081 E.00156
G1 X123.797 Y121.07 E.00132
G1 F5700
G3 X130.011 Y121.069 I3.273 J605.867 E.19097
G3 X130.639 Y121.07 I.3 J5.095 E.01928
G1 F5826
G1 X130.703 Y121.094 E.00212
G1 X130.721 Y121.106 E.00064
G1 X130.743 Y121.128 E.00098
G1 X130.763 Y121.152 E.00095
G1 X130.776 Y121.177 E.00085
G1 X130.788 Y121.205 E.00094
G1 X130.801 Y121.26 E.00175
G1 X130.804 Y121.283 E.0007
G1 X130.806 Y121.335 E.00162
G1 X130.806 Y121.342 E.0002
G1 X130.806 Y134.597 E.40729
; OBJECT_ID: 394
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.806 Y134.663 E-.02505
G1 X130.804 Y134.717 E-.02065
G1 X130.798 Y134.758 E-.0156
G1 X130.789 Y134.792 E-.01354
G1 X130.776 Y134.823 E-.01272
G1 X130.761 Y134.85 E-.01179
G1 X130.724 Y134.891 E-.02103
G1 X130.703 Y134.906 E-.00961
G1 X130.638 Y134.93 E-.02631
G1 X129.05 Y134.93 E-.60371
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X122.23 Y131.502 Z1 F42000
G1 X103.559 Y122.116 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5826
M204 S6000
G1 X103.255 Y122.116 E.01007
G1 X103.255 Y121.868 E.00823
G1 X108.837 Y121.868 E.18517
G1 X108.837 Y122.116 E.00823
G1 X103.619 Y122.116 E.17311
; WIPE_START
G1 F8843.478
G1 X103.255 Y122.116 E-.13819
G1 X103.255 Y121.868 E-.0943
G1 X104.643 Y121.868 E-.52751
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.934 Y129.467 Z1 F42000
G1 X103.559 Y133.477 Z1
G1 Z.6
G1 E.8 F1800
G1 F5826
M204 S6000
G1 X103.167 Y133.477 E.01301
G1 X103.167 Y122.523 E.36337
G1 X108.921 Y122.523 E.19088
G1 X108.921 Y133.477 E.36337
G1 X103.619 Y133.477 E.17588
M204 S250
G1 X103.559 Y133.085 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5826
M204 S5000
G1 X103.559 Y122.915 E.3125
G1 X108.529 Y122.915 E.15271
G1 X108.529 Y133.085 E.3125
G1 X103.619 Y133.085 E.15087
; WIPE_START
G1 F9547.055
M204 S6000
G1 X103.607 Y131.085 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.837 Y134.132 Z1 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5826
M204 S6000
G1 X103.255 Y134.132 E.18517
G1 X103.255 Y133.884 E.00823
G1 X108.837 Y133.884 E.18517
G1 X108.837 Y134.072 E.00625
M204 S10000
G1 X109.244 Y134.54 F42000
G1 F5826
M204 S6000
G1 X102.848 Y134.539 E.21217
G1 X102.848 Y121.461 E.43384
G1 X109.244 Y121.461 E.21217
G1 X109.244 Y134.48 E.43186
M204 S250
G1 X109.637 Y134.657 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5826
M204 S5000
G1 X109.637 Y134.663 E.00018
G1 X109.634 Y134.717 E.00167
G1 X109.628 Y134.758 E.00126
G1 X109.619 Y134.792 E.00109
G1 X109.606 Y134.823 E.00103
G1 X109.591 Y134.85 E.00095
G1 X109.554 Y134.891 E.0017
G1 X109.533 Y134.906 E.00078
G1 X109.469 Y134.93 E.00213
G1 F5700
G3 X103.254 Y134.931 I-3.253 J-571.176 E.19095
G3 X102.627 Y134.93 I-.3 J-5.106 E.01929
G1 F5826
G1 X102.566 Y134.908 E.00199
G1 X102.542 Y134.891 E.0009
G1 X102.52 Y134.869 E.00095
G1 X102.502 Y134.847 E.00087
G1 X102.487 Y134.82 E.00097
G1 X102.475 Y134.79 E.00099
G1 X102.462 Y134.738 E.00164
G1 X102.458 Y134.711 E.00086
G1 X102.456 Y134.663 E.00148
G1 X102.456 Y121.337 E.40945
G1 X102.458 Y121.29 E.00147
G1 X102.464 Y121.247 E.00131
G1 X102.474 Y121.212 E.00111
G1 X102.487 Y121.18 E.00106
G1 X102.502 Y121.152 E.00098
G1 X102.52 Y121.131 E.00087
G1 X102.542 Y121.108 E.00096
G1 X102.586 Y121.081 E.00156
G1 X102.627 Y121.07 E.00132
G1 F5700
G3 X108.842 Y121.069 I3.273 J605.867 E.19097
G3 X109.469 Y121.07 I.3 J5.095 E.01928
G1 F5826
G1 X109.534 Y121.094 E.00212
G1 X109.551 Y121.106 E.00064
G1 X109.574 Y121.128 E.00098
G1 X109.593 Y121.152 E.00095
G1 X109.606 Y121.177 E.00085
G1 X109.618 Y121.205 E.00094
G1 X109.631 Y121.26 E.00175
G1 X109.634 Y121.283 E.0007
G1 X109.637 Y121.335 E.00162
G1 X109.637 Y121.342 E.0002
G1 X109.637 Y134.597 E.40729
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.055
M204 S6000
G1 X109.637 Y134.663 E-.02505
G1 X109.634 Y134.717 E-.02065
G1 X109.628 Y134.758 E-.0156
G1 X109.619 Y134.792 E-.01354
G1 X109.606 Y134.823 E-.01272
G1 X109.591 Y134.85 E-.01179
G1 X109.554 Y134.891 E-.02103
G1 X109.533 Y134.906 E-.00961
G1 X109.469 Y134.93 E-.02631
G1 X107.88 Y134.93 E-.60371
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 4/72
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z1 I.054 J1.216 P1  F42000
G1 X145.723 Y133.26 Z1
G1 Z.8
G1 E.8 F1800
G1 F4649
M204 S5000
G1 X145.723 Y122.74 E.32325
G1 X151.043 Y122.74 E.16347
G1 X151.043 Y133.26 E.32325
G1 X145.783 Y133.26 E.16163
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.772 Y131.26 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.942 Y124.868 Z1.2 F42000
G1 X151.586 Y122.348 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4649
M204 S6000
G1 X145.19 Y122.348 E.21219
G1 X145.19 Y121.408 E.03116
G1 X151.586 Y121.409 E.21219
G1 X151.586 Y122.288 E.02917
; WIPE_START
G1 F8843.478
G1 X149.587 Y122.307 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.813 Y129.84 Z1.2 F42000
G1 X151.587 Y134.591 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F4649
M204 S6000
G1 X145.19 Y134.592 E.21219
G1 X145.19 Y133.652 E.03117
G1 X151.587 Y133.652 E.21219
G1 X151.587 Y134.531 E.02917
M204 S250
G1 X151.979 Y134.78 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4649
M204 S5000
G3 X151.944 Y134.9 I-.273 J-.015 E.00386
G1 X151.924 Y134.925 E.00099
G1 X151.89 Y134.953 E.00135
G1 X151.88 Y134.958 E.00034
G3 X151.782 Y134.984 I-.1 J-.188 E.00315
G1 X151.182 Y134.984 E.01844
G1 X144.998 Y134.984 E.19
G3 X144.909 Y134.965 I.003 J-.236 E.00281
G3 X144.862 Y134.932 I.077 J-.163 E.00178
G1 X144.849 Y134.917 E.00063
G1 X144.813 Y134.863 E.00197
G3 X144.798 Y134.775 I.242 J-.088 E.00277
G1 X144.798 Y121.226 E.41633
G3 X144.839 Y121.093 I.194 J-.012 E.00435
G3 X144.884 Y121.05 I.148 J.108 E.00192
G1 X144.922 Y121.03 E.00132
G3 X144.999 Y121.016 I.074 J.19 E.00243
G1 X151.179 Y121.016 E.1899
G1 X151.779 Y121.017 E.01844
G3 X151.859 Y121.033 I.004 J.184 E.00252
M73 P31 R14
G3 X151.921 Y121.073 I-.055 J.154 E.0023
G1 X151.944 Y121.101 E.00112
G3 X151.978 Y121.223 I-.184 J.118 E.00394
G3 X151.979 Y134.72 I-1943.571 J6.783 E.41473
; WIPE_START
G1 F9547.055
M204 S6000
G1 X151.944 Y134.9 E-.06957
G1 X151.924 Y134.925 E-.01228
G1 X151.89 Y134.953 E-.01668
G1 X151.88 Y134.958 E-.00423
G1 X151.782 Y134.984 E-.03861
G1 X151.182 Y134.984 E-.228
G1 X150.154 Y134.984 E-.39062
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
G1 X151.383 Y134.122 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.575327
G1 F4649
M204 S6000
G1 X145.393 Y134.122 E.25986
M204 S10000
G1 X145.261 Y133.456 F42000
; LINE_WIDTH: 0.57651
G1 F4649
M204 S6000
G1 X145.261 Y122.544 E.47446
M204 S10000
G1 X145.393 Y121.878 F42000
; LINE_WIDTH: 0.575256
G1 F4649
M204 S6000
G1 X151.383 Y121.878 E.25982
M204 S10000
G1 X151.511 Y122.544 F42000
; LINE_WIDTH: 0.586036
G1 F4649
M204 S6000
G1 X151.511 Y133.456 E.48293
; OBJECT_ID: 405
; WIPE_START
G1 F6628.422
G1 X151.511 Y131.456 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X143.896 Y131.966 Z1.2 F42000
G1 X124.554 Y133.26 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4649
M204 S5000
G1 X124.554 Y122.74 E.32325
G1 X129.874 Y122.74 E.16347
G1 X129.874 Y133.26 E.32325
G1 X124.614 Y133.26 E.16163
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.602 Y131.26 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.773 Y124.868 Z1.2 F42000
G1 X130.417 Y122.348 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4649
M204 S6000
G1 X124.02 Y122.348 E.21219
G1 X124.02 Y121.408 E.03116
G1 X130.417 Y121.409 E.21219
G1 X130.417 Y122.288 E.02917
; WIPE_START
G1 F8843.478
G1 X128.417 Y122.307 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.643 Y129.84 Z1.2 F42000
G1 X130.417 Y134.591 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F4649
M204 S6000
G1 X124.02 Y134.592 E.21219
G1 X124.02 Y133.652 E.03117
G1 X130.417 Y133.652 E.21219
G1 X130.417 Y134.531 E.02917
M204 S250
G1 X130.809 Y134.78 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4649
M204 S5000
G3 X130.774 Y134.9 I-.273 J-.015 E.00386
G1 X130.754 Y134.925 E.00099
G1 X130.72 Y134.953 E.00135
M73 P32 R14
G1 X130.71 Y134.958 E.00034
G3 X130.612 Y134.984 I-.1 J-.188 E.00315
G1 X130.012 Y134.984 E.01844
G1 X123.829 Y134.984 E.19
G3 X123.74 Y134.965 I.003 J-.236 E.00281
G3 X123.692 Y134.932 I.077 J-.163 E.00178
G1 X123.679 Y134.917 E.00063
G1 X123.644 Y134.863 E.00197
G3 X123.628 Y134.775 I.242 J-.088 E.00277
G1 X123.628 Y121.226 E.41633
G3 X123.669 Y121.093 I.194 J-.012 E.00435
G3 X123.714 Y121.05 I.148 J.108 E.00192
G1 X123.752 Y121.03 E.00132
G3 X123.829 Y121.016 I.074 J.19 E.00243
G1 X130.01 Y121.016 E.1899
G1 X130.61 Y121.017 E.01844
G3 X130.689 Y121.033 I.004 J.184 E.00252
G3 X130.752 Y121.073 I-.055 J.154 E.0023
G1 X130.774 Y121.101 E.00112
G3 X130.809 Y121.223 I-.184 J.118 E.00394
G3 X130.809 Y134.72 I-1943.571 J6.783 E.41473
M204 S10000
G1 X130.213 Y134.122 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.575327
G1 F4649
M204 S6000
G1 X124.224 Y134.122 E.25986
M204 S10000
G1 X124.091 Y133.456 F42000
; LINE_WIDTH: 0.57651
G1 F4649
M204 S6000
G1 X124.091 Y122.544 E.47446
M204 S10000
G1 X124.224 Y121.878 F42000
; LINE_WIDTH: 0.575256
G1 F4649
M204 S6000
G1 X130.213 Y121.878 E.25982
M204 S10000
G1 X130.341 Y122.544 F42000
; LINE_WIDTH: 0.586036
G1 F4649
M204 S6000
G1 X130.341 Y133.456 E.48293
; OBJECT_ID: 394
; WIPE_START
G1 F6628.422
G1 X130.341 Y131.456 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X122.726 Y131.966 Z1.2 F42000
G1 X103.384 Y133.26 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4649
M204 S5000
G1 X103.384 Y122.74 E.32325
G1 X108.704 Y122.74 E.16347
G1 X108.704 Y133.26 E.32325
G1 X103.444 Y133.26 E.16163
; WIPE_START
G1 F9547.055
M204 S6000
G1 X103.433 Y131.26 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.603 Y124.868 Z1.2 F42000
G1 X109.247 Y122.348 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4649
M204 S6000
G1 X102.85 Y122.348 E.21219
G1 X102.85 Y121.408 E.03116
G1 X109.247 Y121.409 E.21219
G1 X109.247 Y122.288 E.02917
; WIPE_START
G1 F8843.478
G1 X107.247 Y122.307 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.474 Y129.84 Z1.2 F42000
G1 X109.247 Y134.591 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F4649
M204 S6000
G1 X102.85 Y134.592 E.21219
G1 X102.85 Y133.652 E.03117
G1 X109.247 Y133.652 E.21219
G1 X109.247 Y134.531 E.02917
M204 S250
G1 X109.639 Y134.78 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4649
M204 S5000
G3 X109.604 Y134.9 I-.273 J-.015 E.00386
G1 X109.584 Y134.925 E.00099
G1 X109.55 Y134.953 E.00135
G1 X109.541 Y134.958 E.00034
G3 X109.442 Y134.984 I-.1 J-.188 E.00315
G1 X108.842 Y134.984 E.01844
G1 X102.659 Y134.984 E.19
G3 X102.57 Y134.965 I.003 J-.236 E.00281
G3 X102.522 Y134.932 I.077 J-.163 E.00178
G1 X102.509 Y134.917 E.00063
G1 X102.474 Y134.863 E.00197
G3 X102.458 Y134.775 I.242 J-.088 E.00277
G1 X102.458 Y121.226 E.41633
G3 X102.499 Y121.093 I.194 J-.012 E.00435
G3 X102.544 Y121.05 I.148 J.108 E.00192
G1 X102.582 Y121.03 E.00132
G3 X102.66 Y121.016 I.074 J.19 E.00243
G1 X108.84 Y121.016 E.1899
G1 X109.44 Y121.017 E.01844
G3 X109.52 Y121.033 I.004 J.184 E.00252
G3 X109.582 Y121.073 I-.055 J.154 E.0023
G1 X109.605 Y121.101 E.00112
G3 X109.639 Y121.223 I-.184 J.118 E.00394
G3 X109.639 Y134.72 I-1943.571 J6.783 E.41473
M204 S10000
G1 X109.044 Y134.122 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.575327
G1 F4649
M204 S6000
G1 X103.054 Y134.122 E.25986
M204 S10000
G1 X102.921 Y133.456 F42000
; LINE_WIDTH: 0.57651
G1 F4649
M204 S6000
G1 X102.921 Y122.544 E.47446
M204 S10000
G1 X103.054 Y121.878 F42000
; LINE_WIDTH: 0.575256
G1 F4649
M204 S6000
G1 X109.043 Y121.878 E.25982
M204 S10000
G1 X109.171 Y122.544 F42000
; LINE_WIDTH: 0.586036
G1 F4649
M204 S6000
G1 X109.172 Y133.456 E.48293
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6628.422
G1 X109.172 Y131.456 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 5/72
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z1.2 I-.052 J1.216 P1  F42000
G1 X151.043 Y133.26 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4430
M204 S5000
G1 X145.723 Y133.26 E.16347
G1 X145.723 Y122.74 E.32325
G1 X151.043 Y122.74 E.16347
G1 X151.043 Y133.2 E.32141
; WIPE_START
G1 F9547.055
M204 S6000
G1 X149.044 Y133.223 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.702 Y125.958 Z1.4 F42000
G1 X145.623 Y122.61 Z1.4
G1 Z1
G1 E.8 F1800
G1 F4430
M204 S5000
G1 X145.623 Y121.39 E.03749
G1 X151.143 Y121.39 E.16961
G1 X151.143 Y122.61 E.03749
G1 X145.683 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.623 Y121.39 E-.46416
G1 X146.402 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.908 Y129.006 Z1.4 F42000
G1 X145.623 Y133.39 Z1.4
G1 Z1
G1 E.8 F1800
G1 F4430
M204 S5000
G1 X151.143 Y133.39 E.16961
G1 X151.143 Y134.61 E.03749
G1 X145.623 Y134.61 E.16961
G1 X145.623 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X147.623 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.983 Y134.821 Z1.4 F42000
G1 Z1
G1 E.8 F1800
G1 F4430
M204 S5000
G3 X151.8 Y134.99 I-.193 J-.026 E.00827
G1 X144.972 Y134.988 E.20981
G3 X144.803 Y134.793 I.026 J-.193 E.00869
G1 X144.804 Y121.184 E.41816
G3 X144.986 Y121.01 I.196 J.023 E.00839
G1 X151.831 Y121.015 E.2103
G3 X151.984 Y121.196 I-.038 J.187 E.00787
G1 X151.983 Y134.761 E.41683
; WIPE_START
G1 F9547.055
M204 S6000
G1 X151.964 Y134.883 E-.04678
G1 X151.918 Y134.943 E-.02885
G1 X151.8 Y134.99 E-.04826
G1 X150.126 Y134.989 E-.63612
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
G1 X151.564 Y134.794 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.491474
G1 F4430
M204 S6000
G1 X151.564 Y133.194 E.05847
; LINE_WIDTH: 0.516438
G1 X151.539 Y133.088 E.0042
; LINE_WIDTH: 0.590996
G1 X151.514 Y132.982 E.00486
G1 X151.514 Y123.018 E.44503
; LINE_WIDTH: 0.574415
G1 X151.53 Y122.947 E.00314
; LINE_WIDTH: 0.541079
G1 X151.547 Y122.877 E.00294
; LINE_WIDTH: 0.491782
G1 X151.564 Y122.806 E.00265
G1 X151.564 Y121.206 E.05852
M204 S10000
G1 X145.213 Y121.206 F42000
; LINE_WIDTH: 0.472258
G1 F4430
M204 S6000
G1 X145.213 Y122.806 E.05596
G1 X145.23 Y122.875 E.00248
; LINE_WIDTH: 0.52155
G1 X145.246 Y122.944 E.00277
; LINE_WIDTH: 0.55489
G1 X145.263 Y123.013 E.00296
M204 S10000
G1 X145.527 Y122.841 F42000
; LINE_WIDTH: 0.266393
G1 F4430
M204 S6000
G1 X145.49 Y122.865 E.00082
; LINE_WIDTH: 0.313338
G1 X145.452 Y122.89 E.00099
; LINE_WIDTH: 0.360284
G1 X145.414 Y122.915 E.00117
; LINE_WIDTH: 0.407229
G1 X145.376 Y122.939 E.00134
; LINE_WIDTH: 0.454175
G1 X145.339 Y122.964 E.00151
; LINE_WIDTH: 0.50112
G1 X145.301 Y122.988 E.00168
; LINE_WIDTH: 0.548065
G1 X145.263 Y123.013 E.00185
; LINE_WIDTH: 0.571445
G1 X145.263 Y132.987 E.42956
G1 X145.301 Y133.012 E.00194
; LINE_WIDTH: 0.501122
G1 X145.339 Y133.036 E.00168
; LINE_WIDTH: 0.454176
G1 X145.376 Y133.061 E.00151
; LINE_WIDTH: 0.40723
G1 X145.414 Y133.085 E.00134
; LINE_WIDTH: 0.360285
G1 X145.452 Y133.11 E.00117
; LINE_WIDTH: 0.313339
G1 X145.49 Y133.135 E.00099
; LINE_WIDTH: 0.266393
G1 X145.527 Y133.159 E.00082
M204 S10000
G1 X145.263 Y132.987 F42000
; LINE_WIDTH: 0.546544
G1 F4430
M204 S6000
G1 X145.238 Y133.09 E.00437
; LINE_WIDTH: 0.473111
G1 X145.213 Y133.194 E.00373
G1 X145.213 Y134.794 E.05609
; OBJECT_ID: 405
; WIPE_START
G1 F8368.387
G1 X145.213 Y133.194 E-.71257
G1 X145.238 Y133.09 E-.04743
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.606 Y133.175 Z1.4 F42000
G1 X129.874 Y133.26 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4430
M204 S5000
G1 X124.554 Y133.26 E.16347
G1 X124.554 Y122.74 E.32325
G1 X129.874 Y122.74 E.16347
G1 X129.874 Y133.2 E.32141
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.874 Y133.223 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.533 Y125.958 Z1.4 F42000
G1 X124.454 Y122.61 Z1.4
G1 Z1
G1 E.8 F1800
G1 F4430
M204 S5000
G1 X124.454 Y121.39 E.03749
G1 X129.974 Y121.39 E.16961
G1 X129.974 Y122.61 E.03749
G1 X124.514 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y121.39 E-.46416
G1 X125.232 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.738 Y129.006 Z1.4 F42000
G1 X124.454 Y133.39 Z1.4
G1 Z1
G1 E.8 F1800
G1 F4430
M204 S5000
G1 X129.974 Y133.39 E.16961
G1 X129.974 Y134.61 E.03749
G1 X124.454 Y134.61 E.16961
G1 X124.454 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.454 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.813 Y134.821 Z1.4 F42000
G1 Z1
G1 E.8 F1800
G1 F4430
M204 S5000
G3 X130.63 Y134.99 I-.193 J-.026 E.00827
G1 X123.802 Y134.988 E.20981
G3 X123.633 Y134.793 I.026 J-.193 E.00869
G1 X123.634 Y121.184 E.41816
G3 X123.817 Y121.01 I.196 J.023 E.00839
G1 X130.661 Y121.015 E.2103
G3 X130.814 Y121.196 I-.038 J.187 E.00787
G1 X130.813 Y134.761 E.41683
M204 S10000
G1 X130.394 Y134.794 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.491474
G1 F4430
M204 S6000
G1 X130.394 Y133.194 E.05847
; LINE_WIDTH: 0.516438
G1 X130.369 Y133.088 E.0042
; LINE_WIDTH: 0.590996
G1 X130.344 Y132.982 E.00486
G1 X130.344 Y123.018 E.44503
; LINE_WIDTH: 0.574415
G1 X130.36 Y122.947 E.00314
; LINE_WIDTH: 0.541079
G1 X130.377 Y122.877 E.00294
; LINE_WIDTH: 0.491782
G1 X130.394 Y122.806 E.00265
G1 X130.394 Y121.206 E.05852
M204 S10000
G1 X124.043 Y121.206 F42000
; LINE_WIDTH: 0.472258
G1 F4430
M204 S6000
G1 X124.043 Y122.806 E.05596
G1 X124.06 Y122.875 E.00248
; LINE_WIDTH: 0.52155
G1 X124.077 Y122.944 E.00277
; LINE_WIDTH: 0.55489
G1 X124.093 Y123.013 E.00296
M204 S10000
G1 X124.358 Y122.841 F42000
; LINE_WIDTH: 0.266393
G1 F4430
M204 S6000
G1 X124.32 Y122.865 E.00082
; LINE_WIDTH: 0.313338
G1 X124.282 Y122.89 E.00099
; LINE_WIDTH: 0.360284
G1 X124.244 Y122.915 E.00117
; LINE_WIDTH: 0.407229
G1 X124.207 Y122.939 E.00134
; LINE_WIDTH: 0.454175
G1 X124.169 Y122.964 E.00151
; LINE_WIDTH: 0.50112
G1 X124.131 Y122.988 E.00168
; LINE_WIDTH: 0.548065
G1 X124.093 Y123.013 E.00185
; LINE_WIDTH: 0.571445
G1 X124.093 Y132.987 E.42956
G1 X124.131 Y133.012 E.00194
; LINE_WIDTH: 0.501122
G1 X124.169 Y133.036 E.00168
; LINE_WIDTH: 0.454176
G1 X124.207 Y133.061 E.00151
; LINE_WIDTH: 0.40723
G1 X124.244 Y133.085 E.00134
; LINE_WIDTH: 0.360285
G1 X124.282 Y133.11 E.00117
; LINE_WIDTH: 0.313339
G1 X124.32 Y133.135 E.00099
; LINE_WIDTH: 0.266393
G1 X124.358 Y133.159 E.00082
M204 S10000
G1 X124.093 Y132.987 F42000
; LINE_WIDTH: 0.546544
G1 F4430
M204 S6000
G1 X124.068 Y133.09 E.00437
; LINE_WIDTH: 0.473111
G1 X124.043 Y133.194 E.00373
G1 X124.043 Y134.794 E.05609
; OBJECT_ID: 394
; WIPE_START
G1 F8368.387
G1 X124.043 Y133.194 E-.71257
G1 X124.068 Y133.09 E-.04743
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X117.243 Y129.675 Z1.4 F42000
G1 X103.384 Y122.74 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4430
M204 S5000
G1 X108.704 Y122.74 E.16347
G1 X108.704 Y133.26 E.32325
G1 X103.384 Y133.26 E.16347
G1 X103.384 Y122.8 E.32141
M204 S250
G1 X103.284 Y122.61 F42000
G1 F4430
M204 S5000
G1 X103.284 Y121.39 E.03749
G1 X108.804 Y121.39 E.16961
G1 X108.804 Y122.61 E.03749
G1 X103.344 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X103.284 Y121.39 E-.46416
G1 X104.062 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.568 Y129.006 Z1.4 F42000
G1 X103.284 Y133.39 Z1.4
G1 Z1
G1 E.8 F1800
G1 F4430
M204 S5000
G1 X108.804 Y133.39 E.16961
G1 X108.804 Y134.61 E.03749
G1 X103.284 Y134.61 E.16961
G1 X103.284 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.284 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.643 Y134.821 Z1.4 F42000
G1 Z1
G1 E.8 F1800
G1 F4430
M204 S5000
G3 X109.46 Y134.99 I-.193 J-.026 E.00827
G1 X102.632 Y134.988 E.20981
G3 X102.463 Y134.793 I.026 J-.193 E.00869
G1 X102.464 Y121.184 E.41816
M73 P33 R14
G3 X102.647 Y121.01 I.196 J.023 E.00839
G1 X109.491 Y121.015 E.2103
G3 X109.644 Y121.196 I-.038 J.187 E.00787
G1 X109.643 Y134.761 E.41683
M204 S10000
G1 X109.224 Y134.794 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.491474
G1 F4430
M204 S6000
G1 X109.224 Y133.194 E.05847
; LINE_WIDTH: 0.516438
G1 X109.199 Y133.088 E.0042
; LINE_WIDTH: 0.590996
G1 X109.174 Y132.982 E.00486
G1 X109.174 Y123.018 E.44503
; LINE_WIDTH: 0.574415
G1 X109.191 Y122.947 E.00314
; LINE_WIDTH: 0.541079
G1 X109.207 Y122.877 E.00294
; LINE_WIDTH: 0.491782
G1 X109.224 Y122.806 E.00265
G1 X109.224 Y121.206 E.05852
M204 S10000
G1 X102.874 Y121.206 F42000
; LINE_WIDTH: 0.472258
G1 F4430
M204 S6000
G1 X102.874 Y122.806 E.05596
G1 X102.89 Y122.875 E.00248
; LINE_WIDTH: 0.52155
G1 X102.907 Y122.944 E.00277
; LINE_WIDTH: 0.55489
G1 X102.924 Y123.013 E.00296
M204 S10000
G1 X103.188 Y122.841 F42000
; LINE_WIDTH: 0.266393
G1 F4430
M204 S6000
G1 X103.15 Y122.865 E.00082
; LINE_WIDTH: 0.313338
G1 X103.112 Y122.89 E.00099
; LINE_WIDTH: 0.360284
G1 X103.075 Y122.915 E.00117
; LINE_WIDTH: 0.407229
G1 X103.037 Y122.939 E.00134
; LINE_WIDTH: 0.454175
G1 X102.999 Y122.964 E.00151
; LINE_WIDTH: 0.50112
G1 X102.961 Y122.988 E.00168
; LINE_WIDTH: 0.548065
G1 X102.924 Y123.013 E.00185
; LINE_WIDTH: 0.571445
G1 X102.924 Y132.987 E.42956
G1 X102.961 Y133.012 E.00194
; LINE_WIDTH: 0.501122
G1 X102.999 Y133.036 E.00168
; LINE_WIDTH: 0.454176
G1 X103.037 Y133.061 E.00151
; LINE_WIDTH: 0.40723
G1 X103.075 Y133.085 E.00134
; LINE_WIDTH: 0.360285
G1 X103.112 Y133.11 E.00117
; LINE_WIDTH: 0.313339
G1 X103.15 Y133.135 E.00099
; LINE_WIDTH: 0.266393
G1 X103.188 Y133.159 E.00082
M204 S10000
G1 X102.924 Y132.987 F42000
; LINE_WIDTH: 0.546544
G1 F4430
M204 S6000
G1 X102.899 Y133.09 E.00437
; LINE_WIDTH: 0.473111
G1 X102.874 Y133.194 E.00373
G1 X102.874 Y134.794 E.05609
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8368.387
G1 X102.874 Y133.194 E-.71257
G1 X102.899 Y133.09 E-.04743
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 6/72
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z1.4 I-.004 J1.217 P1  F42000
G1 X151.043 Y133.26 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4428
M204 S5000
G1 X145.723 Y133.26 E.16347
G1 X145.723 Y122.74 E.32325
G1 X151.043 Y122.74 E.16347
G1 X151.043 Y133.2 E.32141
; WIPE_START
G1 F9547.055
M204 S6000
G1 X149.044 Y133.223 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.702 Y125.958 Z1.6 F42000
G1 X145.623 Y122.61 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F4428
M204 S5000
G1 X145.623 Y121.39 E.03749
G1 X151.143 Y121.39 E.16961
G1 X151.143 Y122.61 E.03749
G1 X145.683 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.623 Y121.39 E-.46416
G1 X146.402 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.908 Y129.006 Z1.6 F42000
G1 X145.623 Y133.39 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F4428
M204 S5000
G1 X151.143 Y133.39 E.16961
G1 X151.143 Y134.61 E.03749
G1 X145.623 Y134.61 E.16961
G1 X145.623 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X147.623 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.99 Y134.822 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
G1 F4428
M204 S5000
G3 X151.808 Y134.99 I-.193 J-.027 E.00826
G1 X144.979 Y134.988 E.20983
G3 X144.81 Y134.792 I.026 J-.193 E.00868
G1 X144.811 Y121.183 E.41819
G3 X144.994 Y121.01 I.193 J.022 E.0084
G1 X151.838 Y121.014 E.21029
G3 X151.991 Y121.196 I-.038 J.188 E.00788
G1 X151.99 Y134.762 E.41683
; WIPE_START
G1 F9547.055
M204 S6000
G1 X151.973 Y134.881 E-.04593
G1 X151.926 Y134.943 E-.02941
G1 X151.808 Y134.99 E-.04835
G1 X150.133 Y134.989 E-.63632
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
G1 X151.568 Y134.794 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.499315
G1 F4428
M204 S6000
G1 X151.568 Y133.194 E.05949
; LINE_WIDTH: 0.524299
G1 X151.543 Y133.087 E.0043
; LINE_WIDTH: 0.598843
G1 X151.518 Y132.98 E.00497
G1 X151.517 Y123.02 E.45123
; LINE_WIDTH: 0.582277
G1 X151.534 Y122.948 E.00321
; LINE_WIDTH: 0.548939
G1 X151.551 Y122.877 E.00301
; LINE_WIDTH: 0.499647
G1 X151.567 Y122.806 E.00272
G1 X151.567 Y121.206 E.05954
M204 S10000
G1 X145.217 Y121.206 F42000
; LINE_WIDTH: 0.465569
G1 F4428
M204 S6000
G1 X145.217 Y122.806 E.05509
G1 X145.242 Y122.909 E.00364
; LINE_WIDTH: 0.53902
G1 X145.267 Y123.011 E.00427
M204 S10000
G1 X145.527 Y122.84 F42000
; LINE_WIDTH: 0.265856
G1 F4428
M204 S6000
G1 X145.49 Y122.865 E.00081
; LINE_WIDTH: 0.311728
G1 X145.453 Y122.889 E.00097
; LINE_WIDTH: 0.357601
G1 X145.416 Y122.914 E.00114
; LINE_WIDTH: 0.403473
G1 X145.379 Y122.938 E.00131
; LINE_WIDTH: 0.449345
G1 X145.341 Y122.962 E.00147
; LINE_WIDTH: 0.495217
G1 X145.304 Y122.987 E.00164
; LINE_WIDTH: 0.541089
G1 X145.267 Y123.011 E.00181
; LINE_WIDTH: 0.563918
G1 X145.267 Y132.989 E.42359
G1 X145.304 Y133.013 E.00189
; LINE_WIDTH: 0.495213
G1 X145.341 Y133.038 E.00164
; LINE_WIDTH: 0.449342
G1 X145.379 Y133.062 E.00147
; LINE_WIDTH: 0.40347
G1 X145.416 Y133.086 E.00131
; LINE_WIDTH: 0.357599
G1 X145.453 Y133.111 E.00114
; LINE_WIDTH: 0.311728
G1 X145.49 Y133.135 E.00097
; LINE_WIDTH: 0.265856
G1 X145.527 Y133.159 E.00081
M204 S10000
G1 X145.267 Y132.989 F42000
; LINE_WIDTH: 0.547357
G1 F4428
M204 S6000
G1 X145.25 Y133.057 E.00289
; LINE_WIDTH: 0.514023
G1 X145.234 Y133.126 E.0027
; LINE_WIDTH: 0.464723
G1 X145.217 Y133.194 E.00242
G1 X145.217 Y134.794 E.05499
; OBJECT_ID: 405
; WIPE_START
G1 F8534.798
G1 X145.217 Y133.194 E-.72796
G1 X145.234 Y133.126 E-.03204
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.601 Y133.192 Z1.6 F42000
G1 X129.874 Y133.26 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4428
M204 S5000
G1 X124.554 Y133.26 E.16347
G1 X124.554 Y122.74 E.32325
G1 X129.874 Y122.74 E.16347
G1 X129.874 Y133.2 E.32141
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.874 Y133.223 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.533 Y125.958 Z1.6 F42000
G1 X124.454 Y122.61 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F4428
M204 S5000
G1 X124.454 Y121.39 E.03749
G1 X129.974 Y121.39 E.16961
G1 X129.974 Y122.61 E.03749
G1 X124.514 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y121.39 E-.46416
G1 X125.232 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.738 Y129.006 Z1.6 F42000
G1 X124.454 Y133.39 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F4428
M204 S5000
G1 X129.974 Y133.39 E.16961
G1 X129.974 Y134.61 E.03749
G1 X124.454 Y134.61 E.16961
G1 X124.454 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.454 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.821 Y134.822 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
G1 F4428
M204 S5000
G3 X130.638 Y134.99 I-.193 J-.027 E.00826
G1 X123.809 Y134.988 E.20983
G3 X123.641 Y134.792 I.026 J-.193 E.00868
G1 X123.642 Y121.183 E.41819
G3 X123.825 Y121.01 I.193 J.022 E.0084
G1 X130.668 Y121.014 E.21029
G3 X130.822 Y121.196 I-.038 J.188 E.00788
G1 X130.821 Y134.762 E.41683
M204 S10000
G1 X130.398 Y134.794 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.499315
G1 F4428
M204 S6000
G1 X130.398 Y133.194 E.05949
; LINE_WIDTH: 0.524299
G1 X130.373 Y133.087 E.0043
; LINE_WIDTH: 0.598843
G1 X130.348 Y132.98 E.00497
G1 X130.348 Y123.02 E.45123
; LINE_WIDTH: 0.582277
G1 X130.364 Y122.948 E.00321
; LINE_WIDTH: 0.548939
G1 X130.381 Y122.877 E.00301
; LINE_WIDTH: 0.499647
G1 X130.398 Y122.806 E.00272
G1 X130.398 Y121.206 E.05954
M204 S10000
G1 X124.047 Y121.206 F42000
; LINE_WIDTH: 0.465569
G1 F4428
M204 S6000
G1 X124.047 Y122.806 E.05509
G1 X124.072 Y122.909 E.00364
; LINE_WIDTH: 0.53902
G1 X124.097 Y123.011 E.00427
M204 S10000
G1 X124.358 Y122.84 F42000
; LINE_WIDTH: 0.265856
G1 F4428
M204 S6000
G1 X124.32 Y122.865 E.00081
; LINE_WIDTH: 0.311728
G1 X124.283 Y122.889 E.00097
; LINE_WIDTH: 0.357601
G1 X124.246 Y122.914 E.00114
; LINE_WIDTH: 0.403473
G1 X124.209 Y122.938 E.00131
; LINE_WIDTH: 0.449345
G1 X124.172 Y122.962 E.00147
; LINE_WIDTH: 0.495217
G1 X124.134 Y122.987 E.00164
; LINE_WIDTH: 0.541089
G1 X124.097 Y123.011 E.00181
; LINE_WIDTH: 0.563918
G1 X124.097 Y132.989 E.42359
G1 X124.134 Y133.013 E.00189
; LINE_WIDTH: 0.495213
G1 X124.172 Y133.038 E.00164
; LINE_WIDTH: 0.449342
G1 X124.209 Y133.062 E.00147
; LINE_WIDTH: 0.40347
G1 X124.246 Y133.086 E.00131
; LINE_WIDTH: 0.357599
G1 X124.283 Y133.111 E.00114
; LINE_WIDTH: 0.311728
G1 X124.32 Y133.135 E.00097
; LINE_WIDTH: 0.265856
G1 X124.358 Y133.159 E.00081
M204 S10000
G1 X124.097 Y132.989 F42000
; LINE_WIDTH: 0.547357
G1 F4428
M204 S6000
G1 X124.08 Y133.057 E.00289
; LINE_WIDTH: 0.514023
G1 X124.064 Y133.126 E.0027
; LINE_WIDTH: 0.464723
G1 X124.047 Y133.194 E.00242
G1 X124.047 Y134.794 E.05499
; OBJECT_ID: 394
; WIPE_START
G1 F8534.798
G1 X124.047 Y133.194 E-.72796
G1 X124.064 Y133.126 E-.03204
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X117.243 Y129.7 Z1.6 F42000
G1 X103.384 Y122.74 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4428
M204 S5000
G1 X108.704 Y122.74 E.16347
G1 X108.704 Y133.26 E.32325
G1 X103.384 Y133.26 E.16347
G1 X103.384 Y122.8 E.32141
M204 S250
G1 X103.284 Y122.61 F42000
G1 F4428
M204 S5000
G1 X103.284 Y121.39 E.03749
G1 X108.804 Y121.39 E.16961
G1 X108.804 Y122.61 E.03749
G1 X103.344 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X103.284 Y121.39 E-.46416
G1 X104.062 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.568 Y129.006 Z1.6 F42000
G1 X103.284 Y133.39 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F4428
M204 S5000
G1 X108.804 Y133.39 E.16961
G1 X108.804 Y134.61 E.03749
G1 X103.284 Y134.61 E.16961
G1 X103.284 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.284 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.651 Y134.822 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
G1 F4428
M204 S5000
G3 X109.468 Y134.99 I-.193 J-.027 E.00826
G1 X102.639 Y134.988 E.20983
G3 X102.471 Y134.792 I.026 J-.193 E.00868
G1 X102.472 Y121.183 E.41819
G3 X102.655 Y121.01 I.193 J.022 E.0084
G1 X109.499 Y121.014 E.21029
G3 X109.652 Y121.196 I-.038 J.188 E.00788
G1 X109.651 Y134.762 E.41683
M204 S10000
G1 X109.228 Y134.794 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.499315
G1 F4428
M204 S6000
G1 X109.228 Y133.194 E.05949
; LINE_WIDTH: 0.524299
G1 X109.203 Y133.087 E.0043
; LINE_WIDTH: 0.598843
G1 X109.178 Y132.98 E.00497
G1 X109.178 Y123.02 E.45123
; LINE_WIDTH: 0.582277
G1 X109.195 Y122.948 E.00321
; LINE_WIDTH: 0.548939
G1 X109.211 Y122.877 E.00301
; LINE_WIDTH: 0.499647
G1 X109.228 Y122.806 E.00272
G1 X109.228 Y121.206 E.05954
M204 S10000
G1 X102.877 Y121.206 F42000
; LINE_WIDTH: 0.465569
G1 F4428
M204 S6000
G1 X102.877 Y122.806 E.05509
G1 X102.902 Y122.909 E.00364
; LINE_WIDTH: 0.53902
G1 X102.927 Y123.011 E.00427
M204 S10000
G1 X103.188 Y122.84 F42000
; LINE_WIDTH: 0.265856
G1 F4428
M204 S6000
G1 X103.151 Y122.865 E.00081
; LINE_WIDTH: 0.311728
G1 X103.113 Y122.889 E.00097
; LINE_WIDTH: 0.357601
G1 X103.076 Y122.914 E.00114
; LINE_WIDTH: 0.403473
G1 X103.039 Y122.938 E.00131
; LINE_WIDTH: 0.449345
G1 X103.002 Y122.962 E.00147
; LINE_WIDTH: 0.495217
G1 X102.965 Y122.987 E.00164
; LINE_WIDTH: 0.541089
G1 X102.927 Y123.011 E.00181
; LINE_WIDTH: 0.563918
G1 X102.927 Y132.989 E.42359
G1 X102.965 Y133.013 E.00189
; LINE_WIDTH: 0.495213
G1 X103.002 Y133.038 E.00164
; LINE_WIDTH: 0.449342
G1 X103.039 Y133.062 E.00147
; LINE_WIDTH: 0.40347
G1 X103.076 Y133.086 E.00131
; LINE_WIDTH: 0.357599
G1 X103.113 Y133.111 E.00114
; LINE_WIDTH: 0.311728
G1 X103.151 Y133.135 E.00097
; LINE_WIDTH: 0.265856
G1 X103.188 Y133.159 E.00081
M204 S10000
G1 X102.927 Y132.989 F42000
; LINE_WIDTH: 0.547357
G1 F4428
M204 S6000
G1 X102.911 Y133.057 E.00289
; LINE_WIDTH: 0.514023
G1 X102.894 Y133.126 E.0027
; LINE_WIDTH: 0.464723
G1 X102.877 Y133.194 E.00242
G1 X102.877 Y134.794 E.05499
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8534.798
G1 X102.877 Y133.194 E-.72796
G1 X102.894 Y133.126 E-.03204
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 7/72
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z1.6 I-.003 J1.217 P1  F42000
G1 X151.043 Y133.26 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4428
M204 S5000
G1 X145.723 Y133.26 E.16347
G1 X145.723 Y122.74 E.32325
G1 X151.043 Y122.74 E.16347
G1 X151.043 Y133.2 E.32141
; WIPE_START
G1 F9547.055
M204 S6000
G1 X149.044 Y133.223 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.702 Y125.958 Z1.8 F42000
G1 X145.623 Y122.61 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F4428
M204 S5000
G1 X145.623 Y121.39 E.03749
G1 X151.143 Y121.39 E.16961
G1 X151.143 Y122.61 E.03749
G1 X145.683 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.623 Y121.39 E-.46416
G1 X146.402 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.908 Y129.006 Z1.8 F42000
G1 X145.623 Y133.39 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F4428
M204 S5000
G1 X151.143 Y133.39 E.16961
G1 X151.143 Y134.61 E.03749
G1 X145.623 Y134.61 E.16961
G1 X145.623 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X147.623 Y133.428 E-.76
; WIPE_END
M73 P34 R14
G1 E-.04 F1800
M204 S10000
G1 X151.998 Y134.821 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
G1 F4428
M204 S5000
G3 X151.816 Y134.99 I-.193 J-.026 E.00828
G1 X145.014 Y134.99 E.20899
G1 X144.901 Y134.956 E.00364
G3 X144.818 Y134.792 I.111 J-.159 E.00587
G1 X144.819 Y121.182 E.41822
G3 X145.002 Y121.01 I.193 J.022 E.00837
G1 X151.846 Y121.014 E.21029
G3 X151.999 Y121.197 I-.038 J.188 E.0079
G1 X151.998 Y134.761 E.4168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X151.981 Y134.881 E-.04601
G1 X151.934 Y134.943 E-.02954
G1 X151.816 Y134.99 E-.04833
G1 X150.142 Y134.99 E-.63613
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
G1 X151.572 Y134.794 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.507179
G1 F4428
M204 S6000
G1 X151.572 Y133.194 E.06051
; LINE_WIDTH: 0.523807
G1 X151.555 Y133.122 E.00289
; LINE_WIDTH: 0.557142
G1 X151.538 Y133.05 E.00309
; LINE_WIDTH: 0.606858
G1 X151.522 Y132.979 E.00339
G1 X151.521 Y123.021 E.45757
; LINE_WIDTH: 0.590147
G1 X151.538 Y122.95 E.00329
; LINE_WIDTH: 0.55681
G1 X151.555 Y122.878 E.00309
; LINE_WIDTH: 0.507532
G1 X151.571 Y122.806 E.00279
G1 X151.571 Y121.206 E.06057
M204 S10000
G1 X145.221 Y121.206 F42000
; LINE_WIDTH: 0.458027
G1 F4428
M204 S6000
G1 X145.221 Y122.806 E.05411
G1 X145.246 Y122.908 E.00354
; LINE_WIDTH: 0.531485
G1 X145.271 Y123.009 E.00417
; LINE_WIDTH: 0.534092
G1 X145.307 Y122.985 E.00176
; LINE_WIDTH: 0.489296
G1 X145.344 Y122.961 E.0016
; LINE_WIDTH: 0.444501
G1 X145.381 Y122.937 E.00144
; LINE_WIDTH: 0.399705
G1 X145.417 Y122.913 E.00128
; LINE_WIDTH: 0.354909
G1 X145.454 Y122.888 E.00112
; LINE_WIDTH: 0.310114
G1 X145.491 Y122.864 E.00096
; LINE_WIDTH: 0.265318
G1 X145.527 Y122.84 E.0008
M204 S10000
G1 X145.271 Y123.009 F42000
; LINE_WIDTH: 0.556392
G1 F4428
M204 S6000
G1 X145.271 Y132.991 E.41763
G1 X145.307 Y133.015 E.00184
; LINE_WIDTH: 0.489305
G1 X145.344 Y133.039 E.0016
; LINE_WIDTH: 0.444508
G1 X145.381 Y133.063 E.00144
; LINE_WIDTH: 0.39971
G1 X145.417 Y133.087 E.00128
; LINE_WIDTH: 0.354913
G1 X145.454 Y133.112 E.00112
; LINE_WIDTH: 0.310116
G1 X145.491 Y133.136 E.00096
; LINE_WIDTH: 0.265319
G1 X145.527 Y133.16 E.0008
M204 S10000
G1 X145.271 Y132.991 F42000
; LINE_WIDTH: 0.539822
G1 F4428
M204 S6000
G1 X145.254 Y133.058 E.00283
; LINE_WIDTH: 0.506485
G1 X145.237 Y133.126 E.00264
; LINE_WIDTH: 0.457187
G1 X145.221 Y133.194 E.00236
G1 X145.221 Y134.794 E.05401
; OBJECT_ID: 405
; WIPE_START
G1 F8690.059
G1 X145.221 Y133.194 E-.72823
G1 X145.237 Y133.126 E-.03177
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.605 Y133.193 Z1.8 F42000
G1 X129.874 Y133.26 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4428
M204 S5000
G1 X124.554 Y133.26 E.16347
G1 X124.554 Y122.74 E.32325
G1 X129.874 Y122.74 E.16347
G1 X129.874 Y133.2 E.32141
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.874 Y133.223 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.533 Y125.958 Z1.8 F42000
G1 X124.454 Y122.61 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F4428
M204 S5000
G1 X124.454 Y121.39 E.03749
G1 X129.974 Y121.39 E.16961
G1 X129.974 Y122.61 E.03749
G1 X124.514 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y121.39 E-.46416
G1 X125.232 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.738 Y129.006 Z1.8 F42000
G1 X124.454 Y133.39 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F4428
M204 S5000
G1 X129.974 Y133.39 E.16961
G1 X129.974 Y134.61 E.03749
G1 X124.454 Y134.61 E.16961
G1 X124.454 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.454 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.828 Y134.821 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
G1 F4428
M204 S5000
G3 X130.646 Y134.99 I-.193 J-.026 E.00828
G1 X123.844 Y134.99 E.20899
G1 X123.731 Y134.956 E.00364
G3 X123.648 Y134.792 I.111 J-.159 E.00587
G1 X123.649 Y121.182 E.41822
G3 X123.832 Y121.01 I.193 J.022 E.00837
G1 X130.676 Y121.014 E.21029
G3 X130.83 Y121.197 I-.038 J.188 E.0079
G1 X130.828 Y134.761 E.4168
M204 S10000
G1 X130.402 Y134.794 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.507179
G1 F4428
M204 S6000
G1 X130.402 Y133.194 E.06051
; LINE_WIDTH: 0.523807
G1 X130.385 Y133.122 E.00289
; LINE_WIDTH: 0.557142
G1 X130.369 Y133.05 E.00309
; LINE_WIDTH: 0.606858
G1 X130.352 Y132.979 E.00339
G1 X130.352 Y123.021 E.45757
; LINE_WIDTH: 0.590147
G1 X130.368 Y122.95 E.00329
; LINE_WIDTH: 0.55681
G1 X130.385 Y122.878 E.00309
; LINE_WIDTH: 0.507532
G1 X130.402 Y122.806 E.00279
G1 X130.402 Y121.206 E.06057
M204 S10000
G1 X124.051 Y121.206 F42000
; LINE_WIDTH: 0.458027
G1 F4428
M204 S6000
G1 X124.051 Y122.806 E.05411
G1 X124.076 Y122.908 E.00354
; LINE_WIDTH: 0.531485
G1 X124.101 Y123.009 E.00417
; LINE_WIDTH: 0.534092
G1 X124.138 Y122.985 E.00176
; LINE_WIDTH: 0.489296
G1 X124.174 Y122.961 E.0016
; LINE_WIDTH: 0.444501
G1 X124.211 Y122.937 E.00144
; LINE_WIDTH: 0.399705
G1 X124.248 Y122.913 E.00128
; LINE_WIDTH: 0.354909
G1 X124.284 Y122.888 E.00112
; LINE_WIDTH: 0.310114
G1 X124.321 Y122.864 E.00096
; LINE_WIDTH: 0.265318
G1 X124.358 Y122.84 E.0008
M204 S10000
G1 X124.101 Y123.009 F42000
; LINE_WIDTH: 0.556392
G1 F4428
M204 S6000
G1 X124.101 Y132.991 E.41763
G1 X124.138 Y133.015 E.00184
; LINE_WIDTH: 0.489305
G1 X124.174 Y133.039 E.0016
; LINE_WIDTH: 0.444508
G1 X124.211 Y133.063 E.00144
; LINE_WIDTH: 0.39971
G1 X124.248 Y133.087 E.00128
; LINE_WIDTH: 0.354913
G1 X124.284 Y133.112 E.00112
; LINE_WIDTH: 0.310116
G1 X124.321 Y133.136 E.00096
; LINE_WIDTH: 0.265319
G1 X124.358 Y133.16 E.0008
M204 S10000
G1 X124.101 Y132.991 F42000
; LINE_WIDTH: 0.539822
G1 F4428
M204 S6000
G1 X124.084 Y133.058 E.00283
; LINE_WIDTH: 0.506485
G1 X124.068 Y133.126 E.00264
; LINE_WIDTH: 0.457187
G1 X124.051 Y133.194 E.00236
G1 X124.051 Y134.794 E.05401
; OBJECT_ID: 394
; WIPE_START
G1 F8690.059
G1 X124.051 Y133.194 E-.72823
G1 X124.068 Y133.126 E-.03177
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X117.247 Y129.701 Z1.8 F42000
G1 X103.384 Y122.74 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4428
M204 S5000
G1 X108.704 Y122.74 E.16347
G1 X108.704 Y133.26 E.32325
G1 X103.384 Y133.26 E.16347
G1 X103.384 Y122.8 E.32141
M204 S250
G1 X103.284 Y122.61 F42000
G1 F4428
M204 S5000
G1 X103.284 Y121.39 E.03749
G1 X108.804 Y121.39 E.16961
G1 X108.804 Y122.61 E.03749
G1 X103.344 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X103.284 Y121.39 E-.46416
G1 X104.062 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.568 Y129.006 Z1.8 F42000
G1 X103.284 Y133.39 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F4428
M204 S5000
G1 X108.804 Y133.39 E.16961
G1 X108.804 Y134.61 E.03749
G1 X103.284 Y134.61 E.16961
G1 X103.284 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.284 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.659 Y134.821 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
G1 F4428
M204 S5000
G3 X109.476 Y134.99 I-.193 J-.026 E.00828
G1 X102.675 Y134.99 E.20899
G1 X102.561 Y134.956 E.00364
G3 X102.478 Y134.792 I.111 J-.159 E.00587
G1 X102.48 Y121.182 E.41822
G3 X102.662 Y121.01 I.193 J.022 E.00837
G1 X109.506 Y121.014 E.21029
G3 X109.66 Y121.197 I-.038 J.188 E.0079
G1 X109.659 Y134.761 E.4168
M204 S10000
G1 X109.232 Y134.794 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.507179
G1 F4428
M204 S6000
G1 X109.232 Y133.194 E.06051
; LINE_WIDTH: 0.523807
G1 X109.215 Y133.122 E.00289
; LINE_WIDTH: 0.557142
G1 X109.199 Y133.05 E.00309
; LINE_WIDTH: 0.606858
G1 X109.182 Y132.979 E.00339
G1 X109.182 Y123.021 E.45757
; LINE_WIDTH: 0.590147
G1 X109.199 Y122.95 E.00329
; LINE_WIDTH: 0.55681
G1 X109.215 Y122.878 E.00309
; LINE_WIDTH: 0.507532
G1 X109.232 Y122.806 E.00279
G1 X109.232 Y121.206 E.06057
M204 S10000
G1 X102.881 Y121.206 F42000
; LINE_WIDTH: 0.458027
G1 F4428
M204 S6000
G1 X102.881 Y122.806 E.05411
G1 X102.906 Y122.908 E.00354
; LINE_WIDTH: 0.531485
G1 X102.931 Y123.009 E.00417
; LINE_WIDTH: 0.534092
G1 X102.968 Y122.985 E.00176
; LINE_WIDTH: 0.489296
G1 X103.004 Y122.961 E.0016
; LINE_WIDTH: 0.444501
G1 X103.041 Y122.937 E.00144
; LINE_WIDTH: 0.399705
G1 X103.078 Y122.913 E.00128
; LINE_WIDTH: 0.354909
G1 X103.115 Y122.888 E.00112
; LINE_WIDTH: 0.310114
G1 X103.151 Y122.864 E.00096
; LINE_WIDTH: 0.265318
G1 X103.188 Y122.84 E.0008
M204 S10000
G1 X102.931 Y123.009 F42000
; LINE_WIDTH: 0.556392
G1 F4428
M204 S6000
G1 X102.931 Y132.991 E.41763
G1 X102.968 Y133.015 E.00184
; LINE_WIDTH: 0.489305
G1 X103.004 Y133.039 E.0016
; LINE_WIDTH: 0.444508
G1 X103.041 Y133.063 E.00144
; LINE_WIDTH: 0.39971
G1 X103.078 Y133.087 E.00128
; LINE_WIDTH: 0.354913
G1 X103.115 Y133.112 E.00112
; LINE_WIDTH: 0.310116
G1 X103.151 Y133.136 E.00096
; LINE_WIDTH: 0.265319
G1 X103.188 Y133.16 E.0008
M204 S10000
G1 X102.931 Y132.991 F42000
; LINE_WIDTH: 0.539822
G1 F4428
M204 S6000
G1 X102.914 Y133.058 E.00283
; LINE_WIDTH: 0.506485
G1 X102.898 Y133.126 E.00264
; LINE_WIDTH: 0.457187
G1 X102.881 Y133.194 E.00236
G1 X102.881 Y134.794 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8690.059
G1 X102.881 Y133.194 E-.72823
G1 X102.898 Y133.126 E-.03177
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 8/72
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z1.8 I-.003 J1.217 P1  F42000
G1 X151.043 Y133.26 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4427
M204 S5000
G1 X145.723 Y133.26 E.16347
G1 X145.723 Y122.74 E.32325
G1 X151.043 Y122.74 E.16347
G1 X151.043 Y133.2 E.32141
; WIPE_START
G1 F9547.055
M204 S6000
G1 X149.044 Y133.223 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.702 Y125.958 Z2 F42000
G1 X145.623 Y122.61 Z2
G1 Z1.6
G1 E.8 F1800
G1 F4427
M204 S5000
G1 X145.623 Y121.39 E.03749
G1 X151.143 Y121.39 E.16961
G1 X151.143 Y122.61 E.03749
G1 X145.683 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.623 Y121.39 E-.46416
G1 X146.402 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.908 Y129.006 Z2 F42000
G1 X145.623 Y133.39 Z2
G1 Z1.6
G1 E.8 F1800
G1 F4427
M204 S5000
G1 X151.143 Y133.39 E.16961
G1 X151.143 Y134.61 E.03749
G1 X145.623 Y134.61 E.16961
G1 X145.623 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X147.623 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X152.006 Y134.821 Z2 F42000
G1 Z1.6
G1 E.8 F1800
G1 F4427
M204 S5000
G3 X151.824 Y134.99 I-.194 J-.027 E.00826
G1 X144.951 Y134.978 E.21119
G3 X144.825 Y134.792 I.068 J-.181 E.00734
G1 X144.827 Y121.181 E.41825
G3 X145.01 Y121.01 I.193 J.024 E.00834
G1 X151.853 Y121.014 E.21028
G3 X152.007 Y121.197 I-.038 J.188 E.00791
G1 X152.006 Y134.761 E.4168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X151.988 Y134.883 E-.04676
G1 X151.941 Y134.944 E-.02906
G1 X151.824 Y134.99 E-.04802
G1 X150.149 Y134.987 E-.63616
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
G1 X151.576 Y134.794 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.515011
G1 F4427
M204 S6000
G1 X151.576 Y133.194 E.06153
; LINE_WIDTH: 0.539997
G1 X151.551 Y133.085 E.00452
; LINE_WIDTH: 0.614551
G1 X151.526 Y132.977 E.00519
G1 X151.525 Y123.023 E.46364
; LINE_WIDTH: 0.598013
G1 X151.542 Y122.951 E.00336
; LINE_WIDTH: 0.56468
G1 X151.559 Y122.878 E.00316
; LINE_WIDTH: 0.515389
G1 X151.575 Y122.806 E.00286
G1 X151.575 Y121.206 E.06159
M204 S10000
G1 X145.224 Y121.206 F42000
; LINE_WIDTH: 0.450484
G1 F4427
M204 S6000
G1 X145.224 Y122.806 E.05312
G1 X145.249 Y122.907 E.00345
; LINE_WIDTH: 0.52396
G1 X145.274 Y123.008 E.00407
M204 S10000
G1 X145.527 Y122.84 F42000
; LINE_WIDTH: 0.26478
G1 F4427
M204 S6000
G1 X145.491 Y122.864 E.00078
; LINE_WIDTH: 0.308499
G1 X145.455 Y122.888 E.00094
; LINE_WIDTH: 0.352218
G1 X145.419 Y122.912 E.00109
; LINE_WIDTH: 0.395937
G1 X145.383 Y122.936 E.00125
; LINE_WIDTH: 0.439656
G1 X145.347 Y122.96 E.0014
; LINE_WIDTH: 0.483375
G1 X145.311 Y122.984 E.00156
; LINE_WIDTH: 0.527094
G1 X145.274 Y123.008 E.00171
; LINE_WIDTH: 0.548866
G1 X145.274 Y132.992 E.41166
G1 X145.311 Y133.016 E.00179
; LINE_WIDTH: 0.48338
G1 X145.347 Y133.04 E.00156
; LINE_WIDTH: 0.43966
G1 X145.383 Y133.064 E.0014
; LINE_WIDTH: 0.39594
G1 X145.419 Y133.088 E.00125
; LINE_WIDTH: 0.35222
G1 X145.455 Y133.112 E.00109
; LINE_WIDTH: 0.3085
G1 X145.491 Y133.136 E.00094
; LINE_WIDTH: 0.26478
G1 X145.527 Y133.16 E.00078
M204 S10000
M73 P35 R14
G1 X145.274 Y132.992 F42000
; LINE_WIDTH: 0.523955
G1 F4427
M204 S6000
G1 X145.249 Y133.093 E.00407
; LINE_WIDTH: 0.450483
G1 X145.224 Y133.194 E.00345
G1 X145.224 Y134.794 E.05314
; OBJECT_ID: 405
; WIPE_START
G1 F8832.989
G1 X145.224 Y133.194 E-.7137
G1 X145.249 Y133.093 E-.0463
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.617 Y133.176 Z2 F42000
G1 X129.874 Y133.26 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4427
M204 S5000
G1 X124.554 Y133.26 E.16347
G1 X124.554 Y122.74 E.32325
G1 X129.874 Y122.74 E.16347
G1 X129.874 Y133.2 E.32141
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.874 Y133.223 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.533 Y125.958 Z2 F42000
G1 X124.454 Y122.61 Z2
G1 Z1.6
G1 E.8 F1800
G1 F4427
M204 S5000
G1 X124.454 Y121.39 E.03749
G1 X129.974 Y121.39 E.16961
G1 X129.974 Y122.61 E.03749
G1 X124.514 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y121.39 E-.46416
G1 X125.232 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.738 Y129.006 Z2 F42000
G1 X124.454 Y133.39 Z2
G1 Z1.6
G1 E.8 F1800
G1 F4427
M204 S5000
G1 X129.974 Y133.39 E.16961
G1 X129.974 Y134.61 E.03749
G1 X124.454 Y134.61 E.16961
G1 X124.454 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.454 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.836 Y134.821 Z2 F42000
G1 Z1.6
G1 E.8 F1800
G1 F4427
M204 S5000
G3 X130.654 Y134.99 I-.194 J-.027 E.00826
G1 X123.781 Y134.978 E.21119
G3 X123.656 Y134.792 I.068 J-.181 E.00734
G1 X123.657 Y121.181 E.41825
G3 X123.84 Y121.01 I.193 J.024 E.00834
G1 X130.683 Y121.014 E.21028
G3 X130.837 Y121.197 I-.038 J.188 E.00791
G1 X130.836 Y134.761 E.4168
M204 S10000
G1 X130.406 Y134.794 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.515011
G1 F4427
M204 S6000
G1 X130.406 Y133.194 E.06153
; LINE_WIDTH: 0.539997
G1 X130.381 Y133.085 E.00452
; LINE_WIDTH: 0.614551
G1 X130.356 Y132.977 E.00519
G1 X130.356 Y123.023 E.46364
; LINE_WIDTH: 0.598013
G1 X130.372 Y122.951 E.00336
; LINE_WIDTH: 0.56468
G1 X130.389 Y122.878 E.00316
; LINE_WIDTH: 0.515389
G1 X130.406 Y122.806 E.00286
G1 X130.406 Y121.206 E.06159
M204 S10000
G1 X124.055 Y121.206 F42000
; LINE_WIDTH: 0.450484
G1 F4427
M204 S6000
G1 X124.055 Y122.806 E.05312
G1 X124.08 Y122.907 E.00345
; LINE_WIDTH: 0.52396
G1 X124.105 Y123.008 E.00407
M204 S10000
G1 X124.358 Y122.84 F42000
; LINE_WIDTH: 0.26478
G1 F4427
M204 S6000
G1 X124.322 Y122.864 E.00078
; LINE_WIDTH: 0.308499
G1 X124.285 Y122.888 E.00094
; LINE_WIDTH: 0.352218
G1 X124.249 Y122.912 E.00109
; LINE_WIDTH: 0.395937
G1 X124.213 Y122.936 E.00125
; LINE_WIDTH: 0.439656
G1 X124.177 Y122.96 E.0014
; LINE_WIDTH: 0.483375
G1 X124.141 Y122.984 E.00156
; LINE_WIDTH: 0.527094
G1 X124.105 Y123.008 E.00171
; LINE_WIDTH: 0.548866
G1 X124.105 Y132.992 E.41166
G1 X124.141 Y133.016 E.00179
; LINE_WIDTH: 0.48338
G1 X124.177 Y133.04 E.00156
; LINE_WIDTH: 0.43966
G1 X124.213 Y133.064 E.0014
; LINE_WIDTH: 0.39594
G1 X124.249 Y133.088 E.00125
; LINE_WIDTH: 0.35222
G1 X124.285 Y133.112 E.00109
; LINE_WIDTH: 0.3085
G1 X124.322 Y133.136 E.00094
; LINE_WIDTH: 0.26478
G1 X124.358 Y133.16 E.00078
M204 S10000
G1 X124.105 Y132.992 F42000
; LINE_WIDTH: 0.523955
G1 F4427
M204 S6000
G1 X124.08 Y133.093 E.00407
; LINE_WIDTH: 0.450483
G1 X124.055 Y133.194 E.00345
G1 X124.055 Y134.794 E.05314
; OBJECT_ID: 394
; WIPE_START
G1 F8832.989
G1 X124.055 Y133.194 E-.7137
G1 X124.08 Y133.093 E-.0463
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X117.254 Y129.678 Z2 F42000
G1 X103.384 Y122.74 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4427
M204 S5000
G1 X108.704 Y122.74 E.16347
G1 X108.704 Y133.26 E.32325
G1 X103.384 Y133.26 E.16347
G1 X103.384 Y122.8 E.32141
M204 S250
G1 X103.284 Y122.61 F42000
G1 F4427
M204 S5000
G1 X103.284 Y121.39 E.03749
G1 X108.804 Y121.39 E.16961
G1 X108.804 Y122.61 E.03749
G1 X103.344 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X103.284 Y121.39 E-.46416
G1 X104.062 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.568 Y129.006 Z2 F42000
G1 X103.284 Y133.39 Z2
G1 Z1.6
G1 E.8 F1800
G1 F4427
M204 S5000
G1 X108.804 Y133.39 E.16961
G1 X108.804 Y134.61 E.03749
G1 X103.284 Y134.61 E.16961
G1 X103.284 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.284 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.667 Y134.821 Z2 F42000
G1 Z1.6
G1 E.8 F1800
G1 F4427
M204 S5000
G3 X109.484 Y134.99 I-.194 J-.027 E.00826
G1 X102.611 Y134.978 E.21119
G3 X102.486 Y134.792 I.068 J-.181 E.00734
G1 X102.487 Y121.181 E.41825
G3 X102.67 Y121.01 I.193 J.024 E.00834
G1 X109.514 Y121.014 E.21028
G3 X109.668 Y121.197 I-.038 J.188 E.00791
G1 X109.667 Y134.761 E.4168
M204 S10000
G1 X109.236 Y134.794 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.515011
G1 F4427
M204 S6000
G1 X109.236 Y133.194 E.06153
; LINE_WIDTH: 0.539997
G1 X109.211 Y133.085 E.00452
; LINE_WIDTH: 0.614551
G1 X109.186 Y132.977 E.00519
G1 X109.186 Y123.023 E.46364
; LINE_WIDTH: 0.598013
G1 X109.203 Y122.951 E.00336
; LINE_WIDTH: 0.56468
G1 X109.219 Y122.878 E.00316
; LINE_WIDTH: 0.515389
G1 X109.236 Y122.806 E.00286
G1 X109.236 Y121.206 E.06159
M204 S10000
G1 X102.885 Y121.206 F42000
; LINE_WIDTH: 0.450484
G1 F4427
M204 S6000
G1 X102.885 Y122.806 E.05312
G1 X102.91 Y122.907 E.00345
; LINE_WIDTH: 0.52396
G1 X102.935 Y123.008 E.00407
M204 S10000
G1 X103.188 Y122.84 F42000
; LINE_WIDTH: 0.26478
G1 F4427
M204 S6000
G1 X103.152 Y122.864 E.00078
; LINE_WIDTH: 0.308499
G1 X103.116 Y122.888 E.00094
; LINE_WIDTH: 0.352218
G1 X103.079 Y122.912 E.00109
; LINE_WIDTH: 0.395937
G1 X103.043 Y122.936 E.00125
; LINE_WIDTH: 0.439656
G1 X103.007 Y122.96 E.0014
; LINE_WIDTH: 0.483375
G1 X102.971 Y122.984 E.00156
; LINE_WIDTH: 0.527094
G1 X102.935 Y123.008 E.00171
; LINE_WIDTH: 0.548866
G1 X102.935 Y132.992 E.41166
G1 X102.971 Y133.016 E.00179
; LINE_WIDTH: 0.48338
G1 X103.007 Y133.04 E.00156
; LINE_WIDTH: 0.43966
G1 X103.043 Y133.064 E.0014
; LINE_WIDTH: 0.39594
G1 X103.079 Y133.088 E.00125
; LINE_WIDTH: 0.35222
G1 X103.116 Y133.112 E.00109
; LINE_WIDTH: 0.3085
G1 X103.152 Y133.136 E.00094
; LINE_WIDTH: 0.26478
G1 X103.188 Y133.16 E.00078
M204 S10000
G1 X102.935 Y132.992 F42000
; LINE_WIDTH: 0.523955
G1 F4427
M204 S6000
G1 X102.91 Y133.093 E.00407
; LINE_WIDTH: 0.450483
G1 X102.885 Y133.194 E.00345
G1 X102.885 Y134.794 E.05314
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8832.989
G1 X102.885 Y133.194 E-.7137
G1 X102.91 Y133.093 E-.0463
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 9/72
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z2 I-.004 J1.217 P1  F42000
G1 X151.043 Y133.26 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4565
M204 S5000
G1 X145.723 Y133.26 E.16347
G1 X145.723 Y122.74 E.32325
G1 X151.043 Y122.74 E.16347
G1 X151.043 Y133.2 E.32141
; WIPE_START
G1 F9547.055
M204 S6000
G1 X149.044 Y133.223 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.702 Y125.958 Z2.2 F42000
G1 X145.623 Y122.61 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F4565
M204 S5000
G1 X145.623 Y121.39 E.03749
G1 X151.143 Y121.39 E.16961
G1 X151.143 Y122.61 E.03749
G1 X145.683 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.623 Y121.39 E-.46416
G1 X146.402 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.908 Y129.006 Z2.2 F42000
G1 X145.623 Y133.39 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F4565
M204 S5000
G1 X151.143 Y133.39 E.16961
G1 X151.143 Y134.61 E.03749
G1 X145.623 Y134.61 E.16961
G1 X145.623 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X147.623 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X152.015 Y134.794 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
G1 F4565
M204 S5000
G1 X151.981 Y134.908 E.00365
G1 X151.888 Y134.979 E.0036
G3 X151.831 Y134.99 I-.066 J-.192 E.00179
G1 X145.029 Y134.99 E.20901
G1 X144.957 Y134.978 E.00224
G1 X144.898 Y134.943 E.00212
G3 X144.833 Y134.792 I.143 J-.151 E.00517
G1 X144.834 Y121.18 E.41828
G3 X145.017 Y121.01 I.193 J.025 E.00832
G1 X151.86 Y121.014 E.21025
G3 X152.015 Y121.205 I-.038 J.19 E.0082
G1 X152.015 Y134.734 E.41571
; WIPE_START
G1 F9547.055
M204 S6000
G1 X151.981 Y134.908 E-.06729
G1 X151.888 Y134.979 E-.04451
G1 X151.831 Y134.99 E-.02208
G1 X150.184 Y134.99 E-.62612
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
G1 X151.579 Y134.794 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.522877
G1 F4565
M204 S6000
G1 X151.579 Y133.194 E.06256
; LINE_WIDTH: 0.547878
G1 X151.554 Y133.084 E.00462
; LINE_WIDTH: 0.622556
G1 X151.529 Y132.975 E.00531
G1 X151.529 Y123.025 E.46996
; LINE_WIDTH: 0.606129
G1 X151.546 Y122.952 E.00344
; LINE_WIDTH: 0.572792
G1 X151.563 Y122.879 E.00323
; LINE_WIDTH: 0.523538
G1 X151.579 Y122.806 E.00293
G1 X151.579 Y121.206 E.06266
; WIPE_START
G1 F7490.369
G1 X151.579 Y122.806 E-.72601
G1 X151.563 Y122.879 E-.03399
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.278 Y123.006 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.516553
G1 F4565
M204 S6000
G1 X145.32 Y122.978 E.00193
; LINE_WIDTH: 0.466802
G1 X145.361 Y122.95 E.00173
; LINE_WIDTH: 0.41705
G1 X145.403 Y122.922 E.00152
; LINE_WIDTH: 0.367299
G1 X145.444 Y122.895 E.00132
; LINE_WIDTH: 0.317548
G1 X145.486 Y122.867 E.00112
; LINE_WIDTH: 0.267796
G1 X145.527 Y122.839 E.00092
M204 S10000
G1 X145.228 Y121.206 F42000
; LINE_WIDTH: 0.442116
G1 F4565
M204 S6000
G1 X145.228 Y122.806 E.05203
G1 X145.245 Y122.873 E.00223
; LINE_WIDTH: 0.49143
G1 X145.261 Y122.939 E.00251
; LINE_WIDTH: 0.52477
G1 X145.278 Y123.006 E.00269
; LINE_WIDTH: 0.541306
G1 X145.278 Y132.994 E.40566
G1 X145.32 Y133.022 E.00203
; LINE_WIDTH: 0.466795
G1 X145.361 Y133.05 E.00173
; LINE_WIDTH: 0.417045
G1 X145.403 Y133.078 E.00152
; LINE_WIDTH: 0.367295
G1 X145.444 Y133.105 E.00132
; LINE_WIDTH: 0.317545
G1 X145.486 Y133.133 E.00112
; LINE_WIDTH: 0.267795
G1 X145.527 Y133.161 E.00092
M204 S10000
G1 X145.278 Y132.994 F42000
; LINE_WIDTH: 0.516432
G1 F4565
M204 S6000
G1 X145.253 Y133.094 E.00397
; LINE_WIDTH: 0.442942
G1 X145.228 Y133.194 E.00335
G1 X145.228 Y134.794 E.05215
; OBJECT_ID: 405
; WIPE_START
G1 F8999.524
G1 X145.228 Y133.194 E-.71407
G1 X145.253 Y133.094 E-.04593
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.621 Y133.176 Z2.2 F42000
G1 X129.874 Y133.26 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4565
M204 S5000
G1 X124.554 Y133.26 E.16347
G1 X124.554 Y122.74 E.32325
G1 X129.874 Y122.74 E.16347
G1 X129.874 Y133.2 E.32141
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.874 Y133.223 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.533 Y125.958 Z2.2 F42000
G1 X124.454 Y122.61 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F4565
M204 S5000
G1 X124.454 Y121.39 E.03749
G1 X129.974 Y121.39 E.16961
G1 X129.974 Y122.61 E.03749
G1 X124.514 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y121.39 E-.46416
G1 X125.232 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.738 Y129.006 Z2.2 F42000
G1 X124.454 Y133.39 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F4565
M204 S5000
G1 X129.974 Y133.39 E.16961
G1 X129.974 Y134.61 E.03749
G1 X124.454 Y134.61 E.16961
G1 X124.454 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.454 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.846 Y134.794 Z2.2 F42000
M73 P36 R14
G1 Z1.8
G1 E.8 F1800
G1 F4565
M204 S5000
G1 X130.812 Y134.908 E.00365
G1 X130.719 Y134.979 E.0036
G3 X130.662 Y134.99 I-.066 J-.192 E.00179
G1 X123.86 Y134.99 E.20901
G1 X123.788 Y134.978 E.00224
G1 X123.728 Y134.943 E.00212
G3 X123.663 Y134.792 I.143 J-.151 E.00517
G1 X123.665 Y121.18 E.41828
G3 X123.848 Y121.01 I.193 J.025 E.00832
G1 X130.69 Y121.014 E.21025
G3 X130.846 Y121.205 I-.038 J.19 E.0082
G1 X130.846 Y134.734 E.41571
M204 S10000
G1 X130.41 Y134.794 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.522877
G1 F4565
M204 S6000
G1 X130.41 Y133.194 E.06256
; LINE_WIDTH: 0.547878
G1 X130.385 Y133.084 E.00462
; LINE_WIDTH: 0.622556
G1 X130.36 Y132.975 E.00531
G1 X130.36 Y123.025 E.46996
; LINE_WIDTH: 0.606129
G1 X130.376 Y122.952 E.00344
; LINE_WIDTH: 0.572792
G1 X130.393 Y122.879 E.00323
; LINE_WIDTH: 0.523538
G1 X130.41 Y122.806 E.00293
G1 X130.41 Y121.206 E.06266
; WIPE_START
G1 F7490.369
G1 X130.41 Y122.806 E-.72601
G1 X130.393 Y122.879 E-.03399
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.108 Y123.006 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.516553
G1 F4565
M204 S6000
G1 X124.15 Y122.978 E.00193
; LINE_WIDTH: 0.466802
G1 X124.191 Y122.95 E.00173
; LINE_WIDTH: 0.41705
G1 X124.233 Y122.922 E.00152
; LINE_WIDTH: 0.367299
G1 X124.275 Y122.895 E.00132
; LINE_WIDTH: 0.317548
G1 X124.316 Y122.867 E.00112
; LINE_WIDTH: 0.267796
G1 X124.358 Y122.839 E.00092
M204 S10000
G1 X124.058 Y121.206 F42000
; LINE_WIDTH: 0.442116
G1 F4565
M204 S6000
G1 X124.058 Y122.806 E.05203
G1 X124.075 Y122.873 E.00223
; LINE_WIDTH: 0.49143
G1 X124.092 Y122.939 E.00251
; LINE_WIDTH: 0.52477
G1 X124.108 Y123.006 E.00269
; LINE_WIDTH: 0.541306
G1 X124.108 Y132.994 E.40566
G1 X124.15 Y133.022 E.00203
; LINE_WIDTH: 0.466795
G1 X124.191 Y133.05 E.00173
; LINE_WIDTH: 0.417045
G1 X124.233 Y133.078 E.00152
; LINE_WIDTH: 0.367295
G1 X124.275 Y133.105 E.00132
; LINE_WIDTH: 0.317545
G1 X124.316 Y133.133 E.00112
; LINE_WIDTH: 0.267795
G1 X124.358 Y133.161 E.00092
M204 S10000
G1 X124.108 Y132.994 F42000
; LINE_WIDTH: 0.516432
G1 F4565
M204 S6000
G1 X124.083 Y133.094 E.00397
; LINE_WIDTH: 0.442942
G1 X124.058 Y133.194 E.00335
G1 X124.058 Y134.794 E.05215
; OBJECT_ID: 394
; WIPE_START
G1 F8999.524
G1 X124.058 Y133.194 E-.71407
G1 X124.083 Y133.094 E-.04593
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X117.257 Y129.68 Z2.2 F42000
G1 X103.384 Y122.74 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4565
M204 S5000
G1 X108.704 Y122.74 E.16347
G1 X108.704 Y133.26 E.32325
G1 X103.384 Y133.26 E.16347
G1 X103.384 Y122.8 E.32141
M204 S250
G1 X103.284 Y122.61 F42000
G1 F4565
M204 S5000
G1 X103.284 Y121.39 E.03749
G1 X108.804 Y121.39 E.16961
G1 X108.804 Y122.61 E.03749
G1 X103.344 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X103.284 Y121.39 E-.46416
G1 X104.062 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.568 Y129.006 Z2.2 F42000
G1 X103.284 Y133.39 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F4565
M204 S5000
G1 X108.804 Y133.39 E.16961
G1 X108.804 Y134.61 E.03749
G1 X103.284 Y134.61 E.16961
G1 X103.284 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.284 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.676 Y134.794 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
G1 F4565
M204 S5000
G1 X109.642 Y134.908 E.00365
G1 X109.549 Y134.979 E.0036
G3 X109.492 Y134.99 I-.066 J-.192 E.00179
G1 X102.69 Y134.99 E.20901
G1 X102.618 Y134.978 E.00224
G1 X102.559 Y134.943 E.00212
G3 X102.493 Y134.792 I.143 J-.151 E.00517
M73 P36 R13
G1 X102.495 Y121.18 E.41828
G3 X102.678 Y121.01 I.193 J.025 E.00832
G1 X109.52 Y121.014 E.21025
G3 X109.676 Y121.205 I-.038 J.19 E.0082
G1 X109.676 Y134.734 E.41571
M204 S10000
G1 X109.24 Y134.794 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.522877
G1 F4565
M204 S6000
G1 X109.24 Y133.194 E.06256
; LINE_WIDTH: 0.547878
G1 X109.215 Y133.084 E.00462
; LINE_WIDTH: 0.622556
G1 X109.19 Y132.975 E.00531
G1 X109.19 Y123.025 E.46996
; LINE_WIDTH: 0.606129
G1 X109.207 Y122.952 E.00344
; LINE_WIDTH: 0.572792
G1 X109.223 Y122.879 E.00323
; LINE_WIDTH: 0.523538
G1 X109.24 Y122.806 E.00293
G1 X109.24 Y121.206 E.06266
; WIPE_START
G1 F7490.369
G1 X109.24 Y122.806 E-.72601
G1 X109.223 Y122.879 E-.03399
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.939 Y123.006 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.516553
G1 F4565
M204 S6000
G1 X102.98 Y122.978 E.00193
; LINE_WIDTH: 0.466802
G1 X103.022 Y122.95 E.00173
; LINE_WIDTH: 0.41705
G1 X103.063 Y122.922 E.00152
; LINE_WIDTH: 0.367299
G1 X103.105 Y122.895 E.00132
; LINE_WIDTH: 0.317548
G1 X103.146 Y122.867 E.00112
; LINE_WIDTH: 0.267796
G1 X103.188 Y122.839 E.00092
M204 S10000
G1 X102.889 Y121.206 F42000
; LINE_WIDTH: 0.442116
G1 F4565
M204 S6000
G1 X102.889 Y122.806 E.05203
G1 X102.905 Y122.873 E.00223
; LINE_WIDTH: 0.49143
G1 X102.922 Y122.939 E.00251
; LINE_WIDTH: 0.52477
G1 X102.939 Y123.006 E.00269
; LINE_WIDTH: 0.541306
G1 X102.939 Y132.994 E.40566
G1 X102.98 Y133.022 E.00203
; LINE_WIDTH: 0.466795
G1 X103.022 Y133.05 E.00173
; LINE_WIDTH: 0.417045
G1 X103.063 Y133.078 E.00152
; LINE_WIDTH: 0.367295
G1 X103.105 Y133.105 E.00132
; LINE_WIDTH: 0.317545
G1 X103.146 Y133.133 E.00112
; LINE_WIDTH: 0.267795
G1 X103.188 Y133.161 E.00092
M204 S10000
G1 X102.939 Y132.994 F42000
; LINE_WIDTH: 0.516432
G1 F4565
M204 S6000
G1 X102.914 Y133.094 E.00397
; LINE_WIDTH: 0.442942
G1 X102.889 Y133.194 E.00335
G1 X102.889 Y134.794 E.05215
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8999.524
G1 X102.889 Y133.194 E-.71407
G1 X102.914 Y133.094 E-.04593
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 10/72
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z2.2 I-.004 J1.217 P1  F42000
G1 X151.043 Y133.26 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4565
M204 S5000
G1 X145.723 Y133.26 E.16347
G1 X145.723 Y122.74 E.32325
G1 X151.043 Y122.74 E.16347
G1 X151.043 Y133.2 E.32141
; WIPE_START
G1 F9547.055
M204 S6000
G1 X149.044 Y133.223 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.702 Y125.958 Z2.4 F42000
G1 X145.623 Y122.61 Z2.4
G1 Z2
G1 E.8 F1800
G1 F4565
M204 S5000
G1 X145.623 Y121.39 E.03749
G1 X151.143 Y121.39 E.16961
G1 X151.143 Y122.61 E.03749
G1 X145.683 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.623 Y121.39 E-.46416
G1 X146.402 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.908 Y129.006 Z2.4 F42000
G1 X145.623 Y133.39 Z2.4
G1 Z2
G1 E.8 F1800
G1 F4565
M204 S5000
G1 X151.143 Y133.39 E.16961
G1 X151.143 Y134.61 E.03749
G1 X145.623 Y134.61 E.16961
G1 X145.623 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X147.623 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X152.023 Y134.794 Z2.4 F42000
G1 Z2
G1 E.8 F1800
G1 F4565
M204 S5000
G1 X151.99 Y134.907 E.00363
G1 X151.896 Y134.979 E.00363
G3 X151.839 Y134.99 I-.066 J-.191 E.00179
G1 X145.037 Y134.99 E.20902
G1 X144.923 Y134.956 E.00366
G3 X144.84 Y134.793 I.112 J-.159 E.00585
G1 X144.842 Y121.179 E.41831
G3 X145.025 Y121.01 I.193 J.026 E.0083
G1 X151.868 Y121.014 E.21026
G3 X152.023 Y121.197 I-.038 J.189 E.00795
G1 X152.023 Y134.734 E.41594
; WIPE_START
G1 F9547.055
M204 S6000
G1 X151.99 Y134.907 E-.06703
G1 X151.896 Y134.979 E-.04484
G1 X151.839 Y134.99 E-.02208
G1 X150.192 Y134.99 E-.62605
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
G1 X151.583 Y134.794 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.530714
G1 F4565
M204 S6000
G1 X151.583 Y133.194 E.06358
; LINE_WIDTH: 0.555699
G1 X151.558 Y133.084 E.00473
; LINE_WIDTH: 0.630263
G1 X151.533 Y132.973 E.00542
G1 X151.533 Y123.027 E.47604
; LINE_WIDTH: 0.613733
G1 X151.55 Y122.953 E.00351
; LINE_WIDTH: 0.580397
G1 X151.567 Y122.88 E.00331
; LINE_WIDTH: 0.531129
G1 X151.583 Y122.806 E.003
G1 X151.583 Y121.206 E.06364
; WIPE_START
G1 F7373.898
G1 X151.583 Y122.806 E-.72576
G1 X151.567 Y122.88 E-.03424
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.282 Y123.004 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.509649
G1 F4565
M204 S6000
G1 X145.323 Y122.976 E.00187
; LINE_WIDTH: 0.461153
G1 X145.364 Y122.949 E.00168
; LINE_WIDTH: 0.412657
G1 X145.405 Y122.921 E.00149
; LINE_WIDTH: 0.364161
G1 X145.446 Y122.894 E.00129
; LINE_WIDTH: 0.315664
G1 X145.486 Y122.866 E.0011
; LINE_WIDTH: 0.267168
G1 X145.527 Y122.839 E.0009
M204 S10000
G1 X145.232 Y121.206 F42000
; LINE_WIDTH: 0.435399
G1 F4565
M204 S6000
G1 X145.232 Y122.806 E.05116
G1 X145.257 Y122.905 E.00326
; LINE_WIDTH: 0.5089
G1 X145.282 Y123.004 E.00387
; LINE_WIDTH: 0.533781
G1 X145.282 Y132.996 E.39969
G1 X145.323 Y133.024 E.00197
; LINE_WIDTH: 0.461155
G1 X145.364 Y133.051 E.00168
; LINE_WIDTH: 0.412659
G1 X145.405 Y133.079 E.00149
; LINE_WIDTH: 0.364162
G1 X145.446 Y133.106 E.00129
; LINE_WIDTH: 0.315665
G1 X145.486 Y133.134 E.0011
; LINE_WIDTH: 0.267169
G1 X145.527 Y133.161 E.0009
M204 S10000
G1 X145.282 Y132.996 F42000
; LINE_WIDTH: 0.508898
G1 F4565
M204 S6000
G1 X145.257 Y133.095 E.00387
; LINE_WIDTH: 0.435398
G1 X145.232 Y133.194 E.00326
G1 X145.232 Y134.794 E.05117
; OBJECT_ID: 405
; WIPE_START
G1 F9172.49
G1 X145.232 Y133.194 E-.71446
G1 X145.257 Y133.095 E-.04554
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.625 Y133.177 Z2.4 F42000
G1 X129.874 Y133.26 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4565
M204 S5000
G1 X124.554 Y133.26 E.16347
G1 X124.554 Y122.74 E.32325
G1 X129.874 Y122.74 E.16347
G1 X129.874 Y133.2 E.32141
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.874 Y133.223 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.533 Y125.958 Z2.4 F42000
G1 X124.454 Y122.61 Z2.4
G1 Z2
G1 E.8 F1800
G1 F4565
M204 S5000
G1 X124.454 Y121.39 E.03749
G1 X129.974 Y121.39 E.16961
G1 X129.974 Y122.61 E.03749
G1 X124.514 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y121.39 E-.46416
G1 X125.232 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.738 Y129.006 Z2.4 F42000
G1 X124.454 Y133.39 Z2.4
G1 Z2
G1 E.8 F1800
G1 F4565
M204 S5000
G1 X129.974 Y133.39 E.16961
G1 X129.974 Y134.61 E.03749
G1 X124.454 Y134.61 E.16961
G1 X124.454 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.454 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.854 Y134.794 Z2.4 F42000
G1 Z2
G1 E.8 F1800
G1 F4565
M204 S5000
G1 X130.82 Y134.907 E.00363
G1 X130.726 Y134.979 E.00363
G3 X130.669 Y134.99 I-.066 J-.191 E.00179
G1 X123.867 Y134.99 E.20902
G1 X123.753 Y134.956 E.00366
G3 X123.671 Y134.793 I.112 J-.159 E.00585
G1 X123.672 Y121.179 E.41831
G3 X123.856 Y121.01 I.193 J.026 E.0083
G1 X130.698 Y121.014 E.21026
G3 X130.853 Y121.197 I-.038 J.189 E.00795
G1 X130.854 Y134.734 E.41594
M204 S10000
G1 X130.414 Y134.794 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.530714
G1 F4565
M204 S6000
G1 X130.414 Y133.194 E.06358
; LINE_WIDTH: 0.555699
G1 X130.389 Y133.084 E.00473
; LINE_WIDTH: 0.630263
G1 X130.364 Y132.973 E.00542
G1 X130.363 Y123.027 E.47604
; LINE_WIDTH: 0.613733
G1 X130.38 Y122.953 E.00351
; LINE_WIDTH: 0.580397
G1 X130.397 Y122.88 E.00331
; LINE_WIDTH: 0.531129
G1 X130.413 Y122.806 E.003
G1 X130.413 Y121.206 E.06364
; WIPE_START
G1 F7373.898
G1 X130.413 Y122.806 E-.72576
G1 X130.397 Y122.88 E-.03424
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.112 Y123.004 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.509649
G1 F4565
M204 S6000
G1 X124.153 Y122.976 E.00187
; LINE_WIDTH: 0.461153
G1 X124.194 Y122.949 E.00168
; LINE_WIDTH: 0.412657
G1 X124.235 Y122.921 E.00149
; LINE_WIDTH: 0.364161
G1 X124.276 Y122.894 E.00129
; LINE_WIDTH: 0.315664
G1 X124.317 Y122.866 E.0011
; LINE_WIDTH: 0.267168
G1 X124.358 Y122.839 E.0009
M204 S10000
G1 X124.062 Y121.206 F42000
; LINE_WIDTH: 0.435399
G1 F4565
M204 S6000
G1 X124.062 Y122.806 E.05116
G1 X124.087 Y122.905 E.00326
; LINE_WIDTH: 0.5089
G1 X124.112 Y123.004 E.00387
; LINE_WIDTH: 0.533781
G1 X124.112 Y132.996 E.39969
G1 X124.153 Y133.024 E.00197
; LINE_WIDTH: 0.461155
G1 X124.194 Y133.051 E.00168
; LINE_WIDTH: 0.412659
G1 X124.235 Y133.079 E.00149
; LINE_WIDTH: 0.364162
G1 X124.276 Y133.106 E.00129
; LINE_WIDTH: 0.315665
G1 X124.317 Y133.134 E.0011
; LINE_WIDTH: 0.267169
G1 X124.358 Y133.161 E.0009
M204 S10000
G1 X124.112 Y132.996 F42000
; LINE_WIDTH: 0.508898
G1 F4565
M204 S6000
G1 X124.087 Y133.095 E.00387
; LINE_WIDTH: 0.435398
G1 X124.062 Y133.194 E.00326
G1 X124.062 Y134.794 E.05117
; OBJECT_ID: 394
; WIPE_START
G1 F9172.49
G1 X124.062 Y133.194 E-.71446
G1 X124.087 Y133.095 E-.04554
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X117.261 Y129.681 Z2.4 F42000
G1 X103.384 Y122.74 Z2.4
G1 Z2
M73 P37 R13
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4565
M204 S5000
G1 X108.704 Y122.74 E.16347
G1 X108.704 Y133.26 E.32325
G1 X103.384 Y133.26 E.16347
G1 X103.384 Y122.8 E.32141
M204 S250
G1 X103.284 Y122.61 F42000
G1 F4565
M204 S5000
G1 X103.284 Y121.39 E.03749
G1 X108.804 Y121.39 E.16961
G1 X108.804 Y122.61 E.03749
G1 X103.344 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X103.284 Y121.39 E-.46416
G1 X104.062 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.568 Y129.006 Z2.4 F42000
G1 X103.284 Y133.39 Z2.4
G1 Z2
G1 E.8 F1800
G1 F4565
M204 S5000
G1 X108.804 Y133.39 E.16961
G1 X108.804 Y134.61 E.03749
G1 X103.284 Y134.61 E.16961
G1 X103.284 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.284 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.684 Y134.794 Z2.4 F42000
G1 Z2
G1 E.8 F1800
G1 F4565
M204 S5000
G1 X109.65 Y134.907 E.00363
G1 X109.557 Y134.979 E.00363
G3 X109.5 Y134.99 I-.066 J-.191 E.00179
G1 X102.697 Y134.99 E.20902
G1 X102.583 Y134.956 E.00366
G3 X102.501 Y134.793 I.112 J-.159 E.00585
G1 X102.503 Y121.179 E.41831
G3 X102.686 Y121.01 I.193 J.026 E.0083
G1 X109.528 Y121.014 E.21026
G3 X109.683 Y121.197 I-.038 J.189 E.00795
G1 X109.684 Y134.734 E.41594
M204 S10000
G1 X109.244 Y134.794 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.530714
G1 F4565
M204 S6000
G1 X109.244 Y133.194 E.06358
; LINE_WIDTH: 0.555699
G1 X109.219 Y133.084 E.00473
; LINE_WIDTH: 0.630263
G1 X109.194 Y132.973 E.00542
G1 X109.194 Y123.027 E.47604
; LINE_WIDTH: 0.613733
G1 X109.21 Y122.953 E.00351
; LINE_WIDTH: 0.580397
G1 X109.227 Y122.88 E.00331
; LINE_WIDTH: 0.531129
G1 X109.244 Y122.806 E.003
G1 X109.244 Y121.206 E.06364
; WIPE_START
G1 F7373.898
G1 X109.244 Y122.806 E-.72576
G1 X109.227 Y122.88 E-.03424
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.942 Y123.004 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.509649
G1 F4565
M204 S6000
G1 X102.983 Y122.976 E.00187
; LINE_WIDTH: 0.461153
G1 X103.024 Y122.949 E.00168
; LINE_WIDTH: 0.412657
G1 X103.065 Y122.921 E.00149
; LINE_WIDTH: 0.364161
G1 X103.106 Y122.894 E.00129
; LINE_WIDTH: 0.315664
G1 X103.147 Y122.866 E.0011
; LINE_WIDTH: 0.267168
G1 X103.188 Y122.839 E.0009
M204 S10000
G1 X102.892 Y121.206 F42000
; LINE_WIDTH: 0.435399
G1 F4565
M204 S6000
G1 X102.892 Y122.806 E.05116
G1 X102.917 Y122.905 E.00326
; LINE_WIDTH: 0.5089
G1 X102.942 Y123.004 E.00387
; LINE_WIDTH: 0.533781
G1 X102.942 Y132.996 E.39969
G1 X102.983 Y133.024 E.00197
; LINE_WIDTH: 0.461155
G1 X103.024 Y133.051 E.00168
; LINE_WIDTH: 0.412659
G1 X103.065 Y133.079 E.00149
; LINE_WIDTH: 0.364162
G1 X103.106 Y133.106 E.00129
; LINE_WIDTH: 0.315665
G1 X103.147 Y133.134 E.0011
; LINE_WIDTH: 0.267169
G1 X103.188 Y133.161 E.0009
M204 S10000
G1 X102.942 Y132.996 F42000
; LINE_WIDTH: 0.508898
G1 F4565
M204 S6000
G1 X102.917 Y133.095 E.00387
; LINE_WIDTH: 0.435398
G1 X102.892 Y133.194 E.00326
G1 X102.892 Y134.794 E.05117
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9172.49
G1 X102.892 Y133.194 E-.71446
G1 X102.917 Y133.095 E-.04554
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 11/72
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
M106 S186.15
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z2.4 I.013 J1.217 P1  F42000
G1 X150.633 Y132.591 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
M204 S5000
G1 X150.618 Y132.591 E.00053
G1 X150.618 Y123.409 E.30458
G1 X150.633 Y123.409 E.00053
M106 S186.15
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X151.016 Y123.409 E.01269
M106 S186.15
G1 F3293.446
G1 X151.232 Y123.409 E.00716
G1 F7242.243
G1 X151.232 Y123.809 E.01327
G1 F8843.478
G1 X151.232 Y124.209 E.01327
G1 X151.232 Y131.791 E.2515
G1 X151.232 Y132.191 E.01327
G1 F7243.422
G1 X151.232 Y132.591 E.01327
G1 F3294.241
G1 X151.016 Y132.591 E.00717
M106 S255
G1 F1800
G1 X150.693 Y132.591 E.0107
M106 S186.15
; WIPE_START
G1 X150.618 Y132.591 E-.02883
G1 X150.618 Y130.667 E-.73118
; WIPE_END
G1 E-.04
M204 S10000
G17
G3 Z2.6 I-.439 J-1.135 P1  F42000
G1 X145.647 Y132.591 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X145.647 Y124.209 E.27804
G1 X145.647 Y123.809 E.01327
G1 F5980.894
G1 X145.647 Y123.409 E.01327
G1 F2462.484
G1 X145.751 Y123.409 E.00345
M106 S255
G1 F1800
G1 X146.133 Y123.409 E.01269
M106 S186.15
; FEATURE: Overhang wall
M106 S255
G1 F600
M204 S5000
G1 X146.149 Y123.409 E.00053
G1 X146.149 Y132.591 E.30458
M106 S186.15
M106 S255
G1 F3000
G1 X146.133 Y132.591 E.00053
M106 S186.15
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X145.751 Y132.591 E.01269
M106 S186.15
G1 F2067.203
G1 X145.707 Y132.591 E.00146
; WIPE_START
G1 X145.693 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.6 I1.209 J.143 P1  F42000
G1 X146.556 Y123.273 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Overhang wall
M106 S255
G1 F600
M204 S5000
G1 X150.211 Y123.273 E.12121
G1 X150.211 Y132.727 E.31361
G1 X146.556 Y132.727 E.12121
G1 X146.556 Y123.333 E.31162
M106 S186.15
M204 S250
G1 X146.948 Y123.665 F42000
M106 S255
G1 F600
M204 S5000
G1 X149.818 Y123.665 E.0952
G1 X149.818 Y132.335 E.2876
G1 X146.948 Y132.335 E.0952
G1 X146.948 Y123.725 E.28561
M106 S186.15
; WIPE_START
M204 S6000
G1 X148.948 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.6 I-1.146 J-.409 P1  F42000
G1 X145.623 Y132.998 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X145.24 Y132.998 E.01272
G1 X145.24 Y123.402 E.31831
G1 X145.24 Y123.002 E.01327
G1 F5145.402
G1 X145.751 Y123.002 E.01695
M106 S255
G1 F1320
G1 X151.016 Y123.002 E.17465
M106 S186.15
G1 F4101.713
G1 X151.416 Y123.002 E.01327
G1 F6319.597
G1 X151.639 Y123.002 E.0074
G1 F8843.478
G1 X151.639 Y123.402 E.01327
G1 X151.639 Y132.598 E.30504
G1 X151.639 Y132.998 E.01327
G1 F6320.919
G1 X151.416 Y132.998 E.0074
G1 F4101.713
G1 X151.016 Y132.998 E.01327
M106 S255
G1 F1320
G1 X145.751 Y132.998 E.17465
M106 S186.15
G1 F1681.627
G1 X145.683 Y132.998 E.00224
M204 S250
G1 X145.623 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X151.143 Y133.39 E.16961
G1 X151.143 Y134.61 E.03749
G1 X145.623 Y134.61 E.16961
G1 X145.623 Y133.45 E.03564
; WIPE_START
M204 S6000
G1 X147.623 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.236 Y125.923 Z2.6 F42000
G1 X145.623 Y122.61 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X145.623 Y121.39 E.03749
G1 X151.143 Y121.39 E.16961
G1 X151.143 Y122.61 E.03749
G1 X145.683 Y122.61 E.16777
; WIPE_START
M204 S6000
G1 X145.623 Y121.39 E-.46416
G1 X146.402 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.6 I-1.122 J.47 P1  F42000
G1 X152.03 Y134.821 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G3 X151.847 Y134.99 I-.193 J-.027 E.00827
G1 X144.973 Y134.978 E.21122
G3 X144.848 Y134.792 I.068 J-.181 E.00734
G1 X144.85 Y121.178 E.41834
G3 X145.033 Y121.01 I.193 J.027 E.00828
G1 X151.882 Y121.016 E.21045
G3 X152.031 Y121.202 I-.044 J.188 E.00792
G1 X152.03 Y134.761 E.41663
; WIPE_START
M204 S6000
G1 X152.01 Y134.885 E-.04774
G1 X151.965 Y134.943 E-.02764
G1 X151.847 Y134.99 E-.04833
G1 X150.173 Y134.987 E-.63629
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
G1 X151.587 Y134.794 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.538573
G1 F7263.145
M204 S6000
G1 X151.587 Y133.194 E.0646
; WIPE_START
G1 X151.587 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.925 Y132.387 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.250212
G1 F15000
M204 S6000
G1 X150.925 Y123.613 E.14822
; WIPE_START
G1 X150.925 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.587 Y122.806 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.538433
G1 F7265.197
M204 S6000
G1 X151.587 Y121.206 E.06459
M204 S10000
G1 X145.236 Y121.206 F42000
; LINE_WIDTH: 0.42637
G1 F9388.447
M204 S6000
G1 X145.236 Y122.806 E.04998
; WIPE_START
M73 P38 R13
G1 X145.236 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.898 Y123.613 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.13809
G1 F15000
M204 S6000
G1 X145.898 Y132.387 E.06805
; WIPE_START
G1 X145.898 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.236 Y133.194 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.42637
G1 F9388.447
M204 S6000
G1 X145.236 Y134.794 E.04999
; OBJECT_ID: 405
; WIPE_START
G1 X145.236 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.609 Y132.902 Z2.6 F42000
G1 X129.464 Y132.591 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
M204 S5000
G1 X129.448 Y132.591 E.00053
G1 X129.448 Y123.409 E.30458
G1 X129.464 Y123.409 E.00053
M106 S186.15
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X129.846 Y123.409 E.01269
M106 S186.15
G1 F3293.446
G1 X130.062 Y123.409 E.00716
G1 F7242.243
G1 X130.062 Y123.809 E.01327
G1 F8843.478
G1 X130.062 Y124.209 E.01327
G1 X130.062 Y131.791 E.2515
G1 X130.062 Y132.191 E.01327
G1 F7243.422
G1 X130.062 Y132.591 E.01327
G1 F3294.241
G1 X129.846 Y132.591 E.00717
M106 S255
G1 F1800
G1 X129.524 Y132.591 E.0107
M106 S186.15
; WIPE_START
G1 X129.448 Y132.591 E-.02883
G1 X129.448 Y130.667 E-.73118
; WIPE_END
G1 E-.04
M204 S10000
G17
G3 Z2.6 I-.439 J-1.135 P1  F42000
G1 X124.477 Y132.591 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X124.477 Y124.209 E.27804
G1 X124.477 Y123.809 E.01327
G1 F5980.894
G1 X124.477 Y123.409 E.01327
G1 F2462.484
G1 X124.581 Y123.409 E.00345
M106 S255
G1 F1800
G1 X124.964 Y123.409 E.01269
M106 S186.15
; FEATURE: Overhang wall
M106 S255
G1 F600
M204 S5000
G1 X124.98 Y123.409 E.00053
G1 X124.98 Y132.591 E.30458
M106 S186.15
M106 S255
G1 F3000
G1 X124.964 Y132.591 E.00053
M106 S186.15
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X124.581 Y132.591 E.01269
M106 S186.15
G1 F2067.203
G1 X124.537 Y132.591 E.00146
; WIPE_START
G1 X124.523 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.6 I1.209 J.143 P1  F42000
G1 X125.387 Y123.273 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Overhang wall
M106 S255
G1 F600
M204 S5000
G1 X129.041 Y123.273 E.12121
G1 X129.041 Y132.727 E.31361
G1 X125.387 Y132.727 E.12121
G1 X125.387 Y123.333 E.31162
M106 S186.15
M204 S250
G1 X125.779 Y123.665 F42000
M106 S255
G1 F600
M204 S5000
G1 X128.649 Y123.665 E.0952
G1 X128.649 Y132.335 E.2876
G1 X125.779 Y132.335 E.0952
G1 X125.779 Y123.725 E.28561
M106 S186.15
; WIPE_START
M204 S6000
G1 X127.778 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.6 I-1.146 J-.409 P1  F42000
G1 X124.454 Y132.998 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X124.07 Y132.998 E.01272
G1 X124.07 Y123.402 E.31831
G1 X124.07 Y123.002 E.01327
G1 F5145.402
G1 X124.581 Y123.002 E.01695
M106 S255
G1 F1320
G1 X129.846 Y123.002 E.17465
M106 S186.15
G1 F4101.713
G1 X130.246 Y123.002 E.01327
G1 F6319.597
G1 X130.469 Y123.002 E.0074
G1 F8843.478
G1 X130.469 Y123.402 E.01327
G1 X130.469 Y132.598 E.30504
G1 X130.469 Y132.998 E.01327
G1 F6320.919
G1 X130.246 Y132.998 E.0074
G1 F4101.713
G1 X129.846 Y132.998 E.01327
M106 S255
G1 F1320
G1 X124.581 Y132.998 E.17465
M106 S186.15
G1 F1681.627
G1 X124.514 Y132.998 E.00224
M204 S250
G1 X124.454 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X129.974 Y133.39 E.16961
G1 X129.974 Y134.61 E.03749
G1 X124.454 Y134.61 E.16961
G1 X124.454 Y133.45 E.03564
; WIPE_START
M204 S6000
G1 X126.454 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.066 Y125.923 Z2.6 F42000
G1 X124.454 Y122.61 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X124.454 Y121.39 E.03749
G1 X129.974 Y121.39 E.16961
G1 X129.974 Y122.61 E.03749
G1 X124.514 Y122.61 E.16777
; WIPE_START
M204 S6000
G1 X124.454 Y121.39 E-.46416
G1 X125.232 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.6 I-1.122 J.47 P1  F42000
G1 X130.86 Y134.821 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G3 X130.677 Y134.99 I-.193 J-.027 E.00827
G1 X123.803 Y134.978 E.21122
G3 X123.678 Y134.792 I.068 J-.181 E.00734
G1 X123.68 Y121.178 E.41834
G3 X123.863 Y121.01 I.193 J.027 E.00828
G1 X130.712 Y121.016 E.21045
G3 X130.861 Y121.202 I-.044 J.188 E.00792
G1 X130.86 Y134.761 E.41663
M204 S10000
G1 X130.418 Y134.794 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.538573
G1 F7263.145
M204 S6000
G1 X130.418 Y133.194 E.0646
; WIPE_START
G1 X130.418 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.755 Y132.387 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.250212
G1 F15000
M204 S6000
G1 X129.755 Y123.613 E.14822
; WIPE_START
G1 X129.755 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.417 Y122.806 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.538433
G1 F7265.197
M204 S6000
G1 X130.417 Y121.206 E.06459
M204 S10000
G1 X124.066 Y121.206 F42000
; LINE_WIDTH: 0.42637
G1 F9388.447
M204 S6000
G1 X124.066 Y122.806 E.04998
; WIPE_START
G1 X124.066 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.728 Y123.613 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.13809
G1 F15000
M204 S6000
G1 X124.728 Y132.387 E.06805
; WIPE_START
G1 X124.728 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.066 Y133.194 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.42637
G1 F9388.447
M204 S6000
G1 X124.066 Y134.794 E.04999
; OBJECT_ID: 394
; WIPE_START
G1 X124.066 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X116.439 Y132.902 Z2.6 F42000
G1 X108.294 Y132.591 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
M73 P39 R13
G1 F600
M204 S5000
G1 X108.278 Y132.591 E.00053
G1 X108.278 Y123.409 E.30458
G1 X108.294 Y123.409 E.00053
M106 S186.15
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X108.676 Y123.409 E.01269
M106 S186.15
G1 F3293.446
G1 X108.892 Y123.409 E.00716
G1 F7242.243
G1 X108.892 Y123.809 E.01327
G1 F8843.478
G1 X108.892 Y124.209 E.01327
G1 X108.893 Y131.791 E.2515
G1 X108.893 Y132.191 E.01327
G1 F7243.422
G1 X108.893 Y132.591 E.01327
G1 F3294.241
G1 X108.676 Y132.591 E.00717
M106 S255
G1 F1800
G1 X108.354 Y132.591 E.0107
M106 S186.15
; WIPE_START
G1 X108.278 Y132.591 E-.02883
G1 X108.278 Y130.667 E-.73118
; WIPE_END
G1 E-.04
M204 S10000
G17
G3 Z2.6 I-.439 J-1.135 P1  F42000
G1 X103.308 Y132.591 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X103.308 Y124.209 E.27804
G1 X103.308 Y123.809 E.01327
G1 F5980.894
G1 X103.308 Y123.409 E.01327
G1 F2462.484
G1 X103.411 Y123.409 E.00345
M106 S255
G1 F1800
G1 X103.794 Y123.409 E.01269
M106 S186.15
; FEATURE: Overhang wall
M106 S255
G1 F600
M204 S5000
G1 X103.81 Y123.409 E.00053
G1 X103.81 Y132.591 E.30458
M106 S186.15
M106 S255
G1 F3000
G1 X103.794 Y132.591 E.00053
M106 S186.15
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X103.411 Y132.591 E.01269
M106 S186.15
G1 F2067.203
G1 X103.368 Y132.591 E.00146
; WIPE_START
G1 X103.353 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.6 I1.209 J.143 P1  F42000
G1 X104.217 Y123.273 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Overhang wall
M106 S255
G1 F600
M204 S5000
G1 X107.871 Y123.273 E.12121
G1 X107.871 Y132.727 E.31361
G1 X104.217 Y132.727 E.12121
G1 X104.217 Y123.333 E.31162
M106 S186.15
M204 S250
G1 X104.609 Y123.665 F42000
M106 S255
G1 F600
M204 S5000
G1 X107.479 Y123.665 E.0952
G1 X107.479 Y132.335 E.2876
G1 X104.609 Y132.335 E.0952
G1 X104.609 Y123.725 E.28561
M106 S186.15
; WIPE_START
M204 S6000
G1 X106.609 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.6 I-1.146 J-.409 P1  F42000
G1 X103.284 Y132.998 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X102.9 Y132.998 E.01272
G1 X102.9 Y123.402 E.31831
G1 X102.9 Y123.002 E.01327
G1 F5145.402
G1 X103.411 Y123.002 E.01695
M106 S255
G1 F1320
G1 X108.676 Y123.002 E.17465
M106 S186.15
G1 F4101.713
G1 X109.076 Y123.002 E.01327
G1 F6319.597
G1 X109.299 Y123.002 E.0074
G1 F8843.478
G1 X109.299 Y123.402 E.01327
G1 X109.3 Y132.598 E.30504
G1 X109.3 Y132.998 E.01327
G1 F6320.919
G1 X109.076 Y132.998 E.0074
G1 F4101.713
G1 X108.676 Y132.998 E.01327
M106 S255
G1 F1320
G1 X103.411 Y132.998 E.17465
M106 S186.15
G1 F1681.627
G1 X103.344 Y132.998 E.00224
M204 S250
G1 X103.284 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X108.804 Y133.39 E.16961
G1 X108.804 Y134.61 E.03749
G1 X103.284 Y134.61 E.16961
G1 X103.284 Y133.45 E.03564
; WIPE_START
M204 S6000
G1 X105.284 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.896 Y125.923 Z2.6 F42000
G1 X103.284 Y122.61 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X103.284 Y121.39 E.03749
G1 X108.804 Y121.39 E.16961
G1 X108.804 Y122.61 E.03749
G1 X103.344 Y122.61 E.16777
; WIPE_START
M204 S6000
G1 X103.284 Y121.39 E-.46416
G1 X104.062 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.6 I-1.122 J.47 P1  F42000
G1 X109.69 Y134.821 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F9547.055
M204 S5000
G3 X109.508 Y134.99 I-.193 J-.027 E.00827
G1 X102.634 Y134.978 E.21122
G3 X102.508 Y134.792 I.068 J-.181 E.00734
G1 X102.51 Y121.178 E.41834
G3 X102.694 Y121.01 I.193 J.027 E.00828
G1 X109.543 Y121.016 E.21045
G3 X109.692 Y121.202 I-.044 J.188 E.00792
G1 X109.69 Y134.761 E.41663
M204 S10000
G1 X109.248 Y134.794 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.538573
G1 F7263.145
M204 S6000
G1 X109.248 Y133.194 E.0646
; WIPE_START
G1 X109.248 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.585 Y132.387 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.250212
G1 F15000
M204 S6000
G1 X108.585 Y123.613 E.14822
; WIPE_START
G1 X108.585 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.248 Y122.806 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.538433
G1 F7265.197
M204 S6000
G1 X109.248 Y121.206 E.06459
M204 S10000
G1 X102.896 Y121.206 F42000
; LINE_WIDTH: 0.42637
G1 F9388.447
M204 S6000
G1 X102.896 Y122.806 E.04998
; WIPE_START
G1 X102.896 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.559 Y123.613 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.13809
G1 F15000
M204 S6000
G1 X103.559 Y132.387 E.06805
; WIPE_START
G1 X103.559 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.896 Y133.194 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.42637
G1 F9388.447
M204 S6000
G1 X102.896 Y134.794 E.04999
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9388.447
G1 X102.896 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 12/72
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
M106 S201.45
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z2.6 I.015 J1.217 P1  F42000
G1 X150.618 Y132.591 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X150.618 Y123.409 E.30458
G1 X151.24 Y123.409 E.02064
G1 X151.24 Y132.591 E.30458
G1 X150.678 Y132.591 E.01865
; WIPE_START
G1 X150.665 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I1.019 J-.665 P1  F42000
G1 X146.149 Y123.665 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X146.149 Y132.591 E.29609
G1 X145.655 Y132.591 E.01641
G1 X145.655 Y123.409 E.30458
G1 X146.149 Y123.409 E.01641
G1 X146.149 Y123.605 E.0065
M204 S10000
G1 X146.948 Y123.273 F42000
G1 F8843.478
M204 S6000
G1 X150.211 Y123.273 E.10821
G1 X150.211 Y132.727 E.31361
G1 X146.556 Y132.727 E.12121
G1 X146.556 Y123.273 E.31361
G1 X146.888 Y123.273 E.01102
M204 S250
G1 X146.948 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8846
M204 S5000
G1 X149.818 Y123.665 E.08819
G1 X149.818 Y132.335 E.2664
G1 X146.948 Y132.335 E.08819
G1 X146.948 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.948 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I-1.146 J-.409 P1  F42000
G1 X145.623 Y132.998 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X145.248 Y132.998 E.01247
G1 X145.248 Y123.002 E.33158
G1 X151.647 Y123.002 E.21228
G1 X151.647 Y132.998 E.33158
G1 X145.683 Y132.998 E.19782
M204 S250
G1 X145.623 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8846
M204 S5000
G1 X151.143 Y133.39 E.16961
G1 X151.143 Y134.61 E.03749
G1 X145.623 Y134.61 E.16961
G1 X145.623 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X147.623 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.236 Y125.923 Z2.8 F42000
G1 X145.623 Y122.61 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F8846
M204 S5000
G1 X145.623 Y121.39 E.03749
G1 X151.143 Y121.39 E.16961
G1 X151.143 Y122.61 E.03749
G1 X145.683 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.623 Y121.39 E-.46416
G1 X146.402 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
M73 P40 R13
G3 Z2.8 I-1.122 J.472 P1  F42000
G1 X152.039 Y134.794 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F8846
M204 S5000
G1 X152.006 Y134.907 E.00362
G1 X151.912 Y134.979 E.00363
G3 X151.855 Y134.99 I-.066 J-.191 E.0018
G1 X144.981 Y134.978 E.21122
G3 X144.855 Y134.793 I.068 J-.181 E.00734
G1 X144.857 Y121.177 E.41837
G3 X145.041 Y121.01 I.193 J.028 E.00826
G1 X151.891 Y121.016 E.21048
G3 X152.039 Y121.201 I-.045 J.188 E.00786
G1 X152.039 Y134.734 E.41582
; WIPE_START
G1 F9547.055
M204 S6000
G1 X152.006 Y134.907 E-.06696
G1 X151.912 Y134.979 E-.04484
G1 X151.855 Y134.99 E-.02213
G1 X150.207 Y134.987 E-.62608
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
G1 X151.591 Y134.794 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.546413
G1 F7150.048
M204 S6000
G1 X151.591 Y133.194 E.06562
; WIPE_START
G1 X151.591 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.929 Y132.387 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.258052
G1 F8846
M204 S6000
G1 X150.929 Y123.613 E.15382
; WIPE_START
G1 F15000
G1 X150.929 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.591 Y122.806 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.546254
G1 F7152.321
M204 S6000
G1 X151.591 Y121.206 E.06561
M204 S10000
G1 X145.239 Y121.206 F42000
; LINE_WIDTH: 0.41884
G1 F8846
M204 S6000
G1 X145.239 Y122.806 E.049
; WIPE_START
G1 F9576.505
G1 X145.239 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.902 Y123.613 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.13056
G1 F8846
M204 S6000
G1 X145.902 Y132.387 E.06266
; WIPE_START
G1 F15000
G1 X145.902 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.239 Y133.194 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.41884
G1 F8846
M204 S6000
G1 X145.239 Y134.794 E.04901
; OBJECT_ID: 405
; WIPE_START
G1 F9576.505
G1 X145.239 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.613 Y132.903 Z2.8 F42000
G1 X129.448 Y132.591 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X129.448 Y123.409 E.30458
G1 X130.07 Y123.409 E.02064
G1 X130.07 Y132.591 E.30458
G1 X129.508 Y132.591 E.01865
; WIPE_START
G1 X129.495 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I1.019 J-.665 P1  F42000
G1 X124.98 Y123.665 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X124.98 Y132.591 E.29609
G1 X124.485 Y132.591 E.01641
G1 X124.485 Y123.409 E.30458
G1 X124.98 Y123.409 E.01641
G1 X124.98 Y123.605 E.0065
M204 S10000
G1 X125.779 Y123.273 F42000
G1 F8843.478
M204 S6000
G1 X129.041 Y123.273 E.10821
G1 X129.041 Y132.727 E.31361
G1 X125.387 Y132.727 E.12121
G1 X125.387 Y123.273 E.31361
G1 X125.719 Y123.273 E.01102
M204 S250
G1 X125.779 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8846
M204 S5000
G1 X128.649 Y123.665 E.08819
G1 X128.649 Y132.335 E.2664
G1 X125.779 Y132.335 E.08819
G1 X125.779 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.778 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I-1.146 J-.409 P1  F42000
G1 X124.454 Y132.998 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X124.078 Y132.998 E.01247
G1 X124.078 Y123.002 E.33158
G1 X130.477 Y123.002 E.21228
G1 X130.477 Y132.998 E.33158
G1 X124.514 Y132.998 E.19782
M204 S250
G1 X124.454 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8846
M204 S5000
G1 X129.974 Y133.39 E.16961
G1 X129.974 Y134.61 E.03749
G1 X124.454 Y134.61 E.16961
G1 X124.454 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.454 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.066 Y125.923 Z2.8 F42000
G1 X124.454 Y122.61 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F8846
M204 S5000
G1 X124.454 Y121.39 E.03749
G1 X129.974 Y121.39 E.16961
G1 X129.974 Y122.61 E.03749
G1 X124.514 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y121.39 E-.46416
G1 X125.232 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I-1.122 J.472 P1  F42000
G1 X130.869 Y134.794 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F8846
M204 S5000
G1 X130.836 Y134.907 E.00362
G1 X130.742 Y134.979 E.00363
G3 X130.685 Y134.99 I-.066 J-.191 E.0018
G1 X123.811 Y134.978 E.21122
G3 X123.686 Y134.793 I.068 J-.181 E.00734
G1 X123.688 Y121.177 E.41837
G3 X123.871 Y121.01 I.193 J.028 E.00826
G1 X130.721 Y121.016 E.21048
G3 X130.869 Y121.201 I-.045 J.188 E.00786
G1 X130.869 Y134.734 E.41582
M204 S10000
G1 X130.421 Y134.794 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.546413
G1 F7150.048
M204 S6000
G1 X130.421 Y133.194 E.06562
; WIPE_START
G1 X130.421 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.759 Y132.387 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.258052
G1 F8846
M204 S6000
G1 X129.759 Y123.613 E.15382
; WIPE_START
G1 F15000
G1 X129.759 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.421 Y122.806 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.546254
G1 F7152.321
M204 S6000
G1 X130.421 Y121.206 E.06561
M204 S10000
G1 X124.07 Y121.206 F42000
; LINE_WIDTH: 0.41884
G1 F8846
M204 S6000
G1 X124.07 Y122.806 E.049
; WIPE_START
G1 F9576.505
G1 X124.07 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.732 Y123.613 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.13056
G1 F8846
M204 S6000
G1 X124.732 Y132.387 E.06266
; WIPE_START
G1 F15000
G1 X124.732 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.07 Y133.194 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.41884
G1 F8846
M204 S6000
G1 X124.07 Y134.794 E.04901
; OBJECT_ID: 394
; WIPE_START
G1 F9576.505
G1 X124.07 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X116.443 Y132.903 Z2.8 F42000
G1 X108.278 Y132.591 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X108.278 Y123.409 E.30458
G1 X108.9 Y123.409 E.02064
G1 X108.9 Y132.591 E.30458
G1 X108.338 Y132.591 E.01865
; WIPE_START
G1 X108.325 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I1.019 J-.665 P1  F42000
G1 X103.81 Y123.665 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X103.81 Y132.591 E.29609
G1 X103.315 Y132.591 E.01641
G1 X103.315 Y123.409 E.30458
G1 X103.81 Y123.409 E.01641
G1 X103.81 Y123.605 E.0065
M204 S10000
G1 X104.609 Y123.273 F42000
G1 F8843.478
M204 S6000
G1 X107.871 Y123.273 E.10821
G1 X107.871 Y132.727 E.31361
G1 X104.217 Y132.727 E.12121
G1 X104.217 Y123.273 E.31361
G1 X104.549 Y123.273 E.01102
M204 S250
G1 X104.609 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8846
M204 S5000
G1 X107.479 Y123.665 E.08819
G1 X107.479 Y132.335 E.2664
G1 X104.609 Y132.335 E.08819
G1 X104.609 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X106.609 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I-1.146 J-.409 P1  F42000
G1 X103.284 Y132.998 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X102.908 Y132.998 E.01247
G1 X102.908 Y123.002 E.33158
G1 X109.307 Y123.002 E.21228
G1 X109.307 Y132.998 E.33158
G1 X103.344 Y132.998 E.19782
M204 S250
G1 X103.284 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8846
M204 S5000
G1 X108.804 Y133.39 E.16961
G1 X108.804 Y134.61 E.03749
G1 X103.284 Y134.61 E.16961
G1 X103.284 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.284 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.896 Y125.923 Z2.8 F42000
G1 X103.284 Y122.61 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F8846
M204 S5000
G1 X103.284 Y121.39 E.03749
G1 X108.804 Y121.39 E.16961
G1 X108.804 Y122.61 E.03749
G1 X103.344 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X103.284 Y121.39 E-.46416
G1 X104.062 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I-1.122 J.472 P1  F42000
G1 X109.7 Y134.794 Z2.8
G1 Z2.4
G1 E.8 F1800
M73 P40 R12
G1 F8846
M204 S5000
G1 X109.666 Y134.907 E.00362
G1 X109.572 Y134.979 E.00363
G3 X109.515 Y134.99 I-.066 J-.191 E.0018
G1 X102.641 Y134.978 E.21122
G3 X102.516 Y134.793 I.068 J-.181 E.00734
G1 X102.518 Y121.177 E.41837
G3 X102.701 Y121.01 I.193 J.028 E.00826
G1 X109.551 Y121.016 E.21048
G3 X109.699 Y121.201 I-.045 J.188 E.00786
G1 X109.7 Y134.734 E.41582
M204 S10000
G1 X109.252 Y134.794 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.546413
G1 F7150.048
M204 S6000
G1 X109.252 Y133.194 E.06562
; WIPE_START
G1 X109.252 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.589 Y132.387 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.258052
G1 F8846
M204 S6000
G1 X108.589 Y123.613 E.15382
; WIPE_START
G1 F15000
G1 X108.589 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.252 Y122.806 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.546254
G1 F7152.321
M204 S6000
G1 X109.252 Y121.206 E.06561
M204 S10000
G1 X102.9 Y121.206 F42000
; LINE_WIDTH: 0.41884
G1 F8846
M204 S6000
G1 X102.9 Y122.806 E.049
; WIPE_START
G1 F9576.505
G1 X102.9 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.562 Y123.613 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.13056
G1 F8846
M204 S6000
G1 X103.562 Y132.387 E.06266
; WIPE_START
G1 F15000
G1 X103.562 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.9 Y133.194 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.41884
G1 F8846
M204 S6000
G1 X102.9 Y134.794 E.04901
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9576.505
G1 X102.9 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 13/72
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z2.8 I.015 J1.217 P1  F42000
G1 X150.618 Y132.591 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X150.618 Y123.409 E.30458
G1 X151.247 Y123.409 E.02089
G1 X151.248 Y132.591 E.30458
G1 X150.678 Y132.591 E.01891
; WIPE_START
G1 X150.665 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I1.019 J-.665 P1  F42000
G1 X146.149 Y123.665 Z3
G1 Z2.6
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X146.149 Y132.591 E.29609
G1 X145.662 Y132.591 E.01616
G1 X145.662 Y123.409 E.30458
G1 X146.149 Y123.409 E.01616
G1 X146.149 Y123.605 E.0065
M204 S10000
G1 X146.948 Y123.273 F42000
G1 F8843.478
M204 S6000
G1 X150.211 Y123.273 E.10821
G1 X150.211 Y132.727 E.31361
G1 X146.556 Y132.727 E.12121
G1 X146.556 Y123.273 E.31361
G1 X146.888 Y123.273 E.01102
M204 S250
G1 X146.948 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8851
M204 S5000
G1 X149.818 Y123.665 E.08819
M73 P41 R12
G1 X149.818 Y132.335 E.2664
G1 X146.948 Y132.335 E.08819
G1 X146.948 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.948 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I-1.146 J-.409 P1  F42000
G1 X145.623 Y132.998 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X145.255 Y132.998 E.01222
G1 X145.255 Y123.002 E.33158
G1 X151.655 Y123.002 E.21228
G1 X151.655 Y132.998 E.33158
G1 X145.683 Y132.998 E.19808
M204 S250
G1 X145.623 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8851
M204 S5000
G1 X151.143 Y133.39 E.16961
G1 X151.143 Y134.61 E.03749
G1 X145.623 Y134.61 E.16961
G1 X145.623 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X147.623 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.236 Y125.923 Z3 F42000
G1 X145.623 Y122.61 Z3
G1 Z2.6
G1 E.8 F1800
G1 F8851
M204 S5000
G1 X145.623 Y121.39 E.03749
G1 X151.143 Y121.39 E.16961
G1 X151.143 Y122.61 E.03749
G1 X145.683 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.623 Y121.39 E-.46416
G1 X146.402 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I-1.122 J.472 P1  F42000
G1 X152.047 Y134.794 Z3
G1 Z2.6
G1 E.8 F1800
G1 F8851
M204 S5000
G1 X152.013 Y134.907 E.00363
G1 X151.92 Y134.979 E.00363
G3 X151.859 Y134.99 I-.067 J-.195 E.00191
G1 X144.988 Y134.978 E.21112
G3 X144.863 Y134.793 I.068 J-.181 E.00734
G1 X144.865 Y121.176 E.4184
G3 X145.049 Y121.01 I.193 J.029 E.00823
G1 X151.903 Y121.017 E.21061
G3 X152.047 Y121.197 I-.049 J.187 E.00761
G1 X152.047 Y134.734 E.41593
; WIPE_START
G1 F9547.055
M204 S6000
G1 X152.013 Y134.907 E-.06706
G1 X151.92 Y134.979 E-.04486
G1 X151.859 Y134.99 E-.02353
G1 X150.215 Y134.987 E-.62455
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
G1 X151.595 Y134.794 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.554267
G1 F7040.238
M204 S6000
G1 X151.595 Y133.194 E.06665
; WIPE_START
G1 X151.595 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.933 Y132.387 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.265833
G1 F8851
M204 S6000
G1 X150.933 Y123.613 E.15939
; WIPE_START
G1 F15000
G1 X150.933 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.595 Y122.806 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.553967
G1 F7044.37
M204 S6000
G1 X151.595 Y121.206 E.06661
M204 S10000
G1 X145.243 Y121.206 F42000
; LINE_WIDTH: 0.41131
G1 F8851
M204 S6000
G1 X145.243 Y122.806 E.04802
; WIPE_START
G1 F9772.252
G1 X145.243 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.906 Y123.613 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.12303
G1 F8851
M204 S6000
G1 X145.906 Y132.387 E.05728
; WIPE_START
G1 F15000
G1 X145.906 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.243 Y133.194 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.41131
G1 F8851
M204 S6000
G1 X145.243 Y134.794 E.04803
; OBJECT_ID: 405
; WIPE_START
G1 F9772.252
G1 X145.243 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.616 Y132.903 Z3 F42000
G1 X129.448 Y132.591 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X129.448 Y123.409 E.30458
G1 X130.078 Y123.409 E.02089
G1 X130.078 Y132.591 E.30458
G1 X129.508 Y132.591 E.01891
; WIPE_START
G1 X129.495 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I1.019 J-.665 P1  F42000
G1 X124.98 Y123.665 Z3
G1 Z2.6
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X124.98 Y132.591 E.29609
G1 X124.492 Y132.591 E.01616
G1 X124.492 Y123.409 E.30458
G1 X124.98 Y123.409 E.01616
G1 X124.98 Y123.605 E.0065
M204 S10000
G1 X125.779 Y123.273 F42000
G1 F8843.478
M204 S6000
G1 X129.041 Y123.273 E.10821
G1 X129.041 Y132.727 E.31361
G1 X125.387 Y132.727 E.12121
G1 X125.387 Y123.273 E.31361
G1 X125.719 Y123.273 E.01102
M204 S250
G1 X125.779 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8851
M204 S5000
G1 X128.649 Y123.665 E.08819
G1 X128.649 Y132.335 E.2664
G1 X125.779 Y132.335 E.08819
G1 X125.779 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.778 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I-1.146 J-.409 P1  F42000
G1 X124.454 Y132.998 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X124.085 Y132.998 E.01222
G1 X124.085 Y123.002 E.33158
G1 X130.485 Y123.002 E.21228
G1 X130.485 Y132.998 E.33158
G1 X124.514 Y132.998 E.19808
M204 S250
G1 X124.454 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8851
M204 S5000
G1 X129.974 Y133.39 E.16961
G1 X129.974 Y134.61 E.03749
G1 X124.454 Y134.61 E.16961
G1 X124.454 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.454 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.066 Y125.923 Z3 F42000
G1 X124.454 Y122.61 Z3
G1 Z2.6
G1 E.8 F1800
G1 F8851
M204 S5000
G1 X124.454 Y121.39 E.03749
G1 X129.974 Y121.39 E.16961
G1 X129.974 Y122.61 E.03749
G1 X124.514 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y121.39 E-.46416
G1 X125.232 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I-1.122 J.472 P1  F42000
G1 X130.877 Y134.794 Z3
G1 Z2.6
G1 E.8 F1800
G1 F8851
M204 S5000
G1 X130.844 Y134.907 E.00363
G1 X130.75 Y134.979 E.00363
G3 X130.689 Y134.99 I-.067 J-.195 E.00191
G1 X123.818 Y134.978 E.21112
G3 X123.693 Y134.793 I.068 J-.181 E.00734
G1 X123.695 Y121.176 E.4184
G3 X123.879 Y121.01 I.193 J.029 E.00823
G1 X130.733 Y121.017 E.21061
G3 X130.877 Y121.197 I-.049 J.187 E.00761
G1 X130.877 Y134.734 E.41593
M204 S10000
G1 X130.425 Y134.794 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.554267
G1 F7040.238
M204 S6000
G1 X130.425 Y133.194 E.06665
; WIPE_START
G1 X130.425 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.763 Y132.387 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.265833
G1 F8851
M204 S6000
G1 X129.763 Y123.613 E.15939
; WIPE_START
G1 F15000
G1 X129.763 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.425 Y122.806 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.553967
G1 F7044.37
M204 S6000
G1 X130.425 Y121.206 E.06661
M204 S10000
G1 X124.073 Y121.206 F42000
; LINE_WIDTH: 0.41131
G1 F8851
M204 S6000
G1 X124.073 Y122.806 E.04802
; WIPE_START
G1 F9772.252
G1 X124.073 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.736 Y123.613 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.12303
G1 F8851
M204 S6000
G1 X124.736 Y132.387 E.05728
; WIPE_START
G1 F15000
G1 X124.736 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.073 Y133.194 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.41131
G1 F8851
M204 S6000
G1 X124.073 Y134.794 E.04803
; OBJECT_ID: 394
; WIPE_START
G1 F9772.252
G1 X124.073 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X116.447 Y132.903 Z3 F42000
G1 X108.278 Y132.591 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X108.278 Y123.409 E.30458
G1 X108.908 Y123.409 E.02089
G1 X108.908 Y132.591 E.30458
G1 X108.338 Y132.591 E.01891
; WIPE_START
G1 X108.325 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I1.019 J-.665 P1  F42000
G1 X103.81 Y123.665 Z3
G1 Z2.6
G1 E.8 F1800
G1 F8843.478
M204 S6000
G1 X103.81 Y132.591 E.29609
G1 X103.323 Y132.591 E.01616
G1 X103.323 Y123.409 E.30458
G1 X103.81 Y123.409 E.01616
G1 X103.81 Y123.605 E.0065
M204 S10000
G1 X104.609 Y123.273 F42000
G1 F8843.478
M204 S6000
G1 X107.871 Y123.273 E.10821
G1 X107.871 Y132.727 E.31361
G1 X104.217 Y132.727 E.12121
G1 X104.217 Y123.273 E.31361
G1 X104.549 Y123.273 E.01102
M204 S250
G1 X104.609 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8851
M204 S5000
G1 X107.479 Y123.665 E.08819
G1 X107.479 Y132.335 E.2664
G1 X104.609 Y132.335 E.08819
G1 X104.609 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X106.609 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I-1.146 J-.409 P1  F42000
G1 X103.284 Y132.998 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X102.916 Y132.998 E.01222
G1 X102.916 Y123.002 E.33158
G1 X109.315 Y123.002 E.21228
G1 X109.315 Y132.998 E.33158
G1 X103.344 Y132.998 E.19808
M204 S250
G1 X103.284 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8851
M204 S5000
G1 X108.804 Y133.39 E.16961
G1 X108.804 Y134.61 E.03749
G1 X103.284 Y134.61 E.16961
G1 X103.284 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.284 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.896 Y125.923 Z3 F42000
G1 X103.284 Y122.61 Z3
G1 Z2.6
G1 E.8 F1800
G1 F8851
M204 S5000
G1 X103.284 Y121.39 E.03749
G1 X108.804 Y121.39 E.16961
G1 X108.804 Y122.61 E.03749
G1 X103.344 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X103.284 Y121.39 E-.46416
G1 X104.062 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I-1.122 J.472 P1  F42000
G1 X109.707 Y134.794 Z3
G1 Z2.6
G1 E.8 F1800
G1 F8851
M204 S5000
G1 X109.674 Y134.907 E.00363
G1 X109.58 Y134.979 E.00363
G3 X109.519 Y134.99 I-.067 J-.195 E.00191
G1 X102.649 Y134.978 E.21112
G3 X102.523 Y134.793 I.068 J-.181 E.00734
G1 X102.525 Y121.176 E.4184
G3 X102.709 Y121.01 I.193 J.029 E.00823
G1 X109.563 Y121.017 E.21061
G3 X109.707 Y121.197 I-.049 J.187 E.00761
G1 X109.707 Y134.734 E.41593
M204 S10000
G1 X109.256 Y134.794 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.554267
G1 F7040.238
M204 S6000
G1 X109.256 Y133.194 E.06665
; WIPE_START
G1 X109.256 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.593 Y132.387 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.265833
G1 F8851
M204 S6000
G1 X108.593 Y123.613 E.15939
; WIPE_START
G1 F15000
G1 X108.593 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.256 Y122.806 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.553967
G1 F7044.37
M204 S6000
G1 X109.255 Y121.206 E.06661
M204 S10000
G1 X102.904 Y121.206 F42000
; LINE_WIDTH: 0.41131
G1 F8851
M204 S6000
G1 X102.904 Y122.806 E.04802
; WIPE_START
G1 F9772.252
G1 X102.904 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.566 Y123.613 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.12303
G1 F8851
M204 S6000
G1 X103.566 Y132.387 E.05728
; WIPE_START
G1 F15000
G1 X103.566 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P42 R12
G1 X102.904 Y133.194 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.41131
G1 F8851
M204 S6000
G1 X102.904 Y134.794 E.04803
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9772.252
G1 X102.904 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 14/72
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z3 I.015 J1.217 P1  F42000
G1 X150.618 Y132.591 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8657
M204 S6000
G1 X150.618 Y123.409 E.30458
G1 X151.255 Y123.409 E.02115
G1 X151.256 Y132.591 E.30458
G1 X150.678 Y132.591 E.01917
; WIPE_START
G1 F8843.478
G1 X150.665 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.496 Y124.197 Z3.2 F42000
G1 X146.149 Y123.665 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F8657
M204 S6000
G1 X146.149 Y132.591 E.29609
G1 X145.67 Y132.591 E.01591
G1 X145.67 Y123.409 E.30458
G1 X146.149 Y123.409 E.01591
G1 X146.149 Y123.605 E.0065
M204 S10000
G1 X146.948 Y123.273 F42000
G1 F8657
M204 S6000
G1 X150.211 Y123.273 E.10821
G1 X150.211 Y132.727 E.31361
G1 X146.556 Y132.727 E.12121
G1 X146.556 Y123.273 E.31361
G1 X146.888 Y123.273 E.01102
M204 S250
G1 X146.948 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8657
M204 S5000
G1 X149.818 Y123.665 E.08819
G1 X149.818 Y132.335 E.2664
G1 X146.948 Y132.335 E.08819
G1 X146.948 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.948 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.382 Y130.872 Z3.2 F42000
G1 X145.623 Y132.998 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8657
M204 S6000
G1 X145.263 Y132.998 E.01197
G1 X145.263 Y123.002 E.33158
G1 X151.662 Y123.002 E.21229
G1 X151.663 Y132.998 E.33158
G1 X145.683 Y132.998 E.19834
M204 S250
G1 X145.623 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8657
M204 S5000
G1 X151.143 Y133.39 E.16961
G1 X151.143 Y134.61 E.03749
G1 X145.623 Y134.61 E.16961
G1 X145.623 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X147.623 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.236 Y125.923 Z3.2 F42000
G1 X145.623 Y122.61 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F8657
M204 S5000
G1 X145.623 Y121.39 E.03749
G1 X151.143 Y121.39 E.16961
G1 X151.143 Y122.61 E.03749
G1 X145.683 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.623 Y121.39 E-.46416
G1 X146.402 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.362 Y128.425 Z3.2 F42000
G1 X152.053 Y134.821 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F8657
M204 S5000
G3 X151.87 Y134.99 I-.193 J-.026 E.00828
G1 X144.996 Y134.978 E.21123
G3 X144.871 Y134.793 I.068 J-.181 E.00734
G1 X144.873 Y121.175 E.41843
G3 X145.056 Y121.01 I.194 J.032 E.00817
G1 X151.865 Y121.01 E.20924
G3 X152.054 Y121.198 I-.009 J.198 E.00897
G1 X152.053 Y134.761 E.41676
; WIPE_START
G1 F9547.055
M204 S6000
G1 X152.035 Y134.882 E-.04661
G1 X151.989 Y134.943 E-.02892
G1 X151.87 Y134.99 E-.04836
G1 X150.196 Y134.987 E-.63611
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
G1 X151.599 Y134.794 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.562107
G1 F6933.925
M204 S6000
G1 X151.599 Y133.194 E.06767
; WIPE_START
G1 X151.599 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.937 Y132.387 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.273683
G1 F8657
M204 S6000
G1 X150.936 Y123.613 E.165
; WIPE_START
G1 F15000
G1 X150.936 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.599 Y122.806 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.561827
G1 F6937.667
M204 S6000
G1 X151.599 Y121.206 E.06764
M204 S10000
G1 X145.247 Y121.206 F42000
; LINE_WIDTH: 0.40378
G1 F8657
M204 S6000
G1 X145.247 Y122.806 E.04704
; WIPE_START
G1 F9976.168
G1 X145.247 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.909 Y123.613 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.1155
G1 F8657
M204 S6000
G1 X145.909 Y132.387 E.0519
; WIPE_START
G1 F15000
G1 X145.909 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.247 Y133.194 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.40378
G1 F8657
M204 S6000
G1 X145.247 Y134.794 E.04705
; OBJECT_ID: 405
; WIPE_START
G1 F9976.168
G1 X145.247 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.62 Y132.903 Z3.2 F42000
G1 X129.448 Y132.591 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8657
M204 S6000
G1 X129.448 Y123.409 E.30458
G1 X130.086 Y123.409 E.02115
G1 X130.086 Y132.591 E.30458
G1 X129.508 Y132.591 E.01917
; WIPE_START
G1 F8843.478
G1 X129.495 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.326 Y124.197 Z3.2 F42000
G1 X124.98 Y123.665 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F8657
M204 S6000
G1 X124.98 Y132.591 E.29609
G1 X124.5 Y132.591 E.01591
G1 X124.5 Y123.409 E.30458
G1 X124.98 Y123.409 E.01591
G1 X124.98 Y123.605 E.0065
M204 S10000
G1 X125.779 Y123.273 F42000
G1 F8657
M204 S6000
G1 X129.041 Y123.273 E.10821
G1 X129.041 Y132.727 E.31361
G1 X125.387 Y132.727 E.12121
G1 X125.387 Y123.273 E.31361
G1 X125.719 Y123.273 E.01102
M204 S250
G1 X125.779 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8657
M204 S5000
G1 X128.649 Y123.665 E.08819
G1 X128.649 Y132.335 E.2664
G1 X125.779 Y132.335 E.08819
G1 X125.779 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.778 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.213 Y130.872 Z3.2 F42000
G1 X124.454 Y132.998 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8657
M204 S6000
G1 X124.093 Y132.998 E.01197
G1 X124.093 Y123.002 E.33158
G1 X130.493 Y123.002 E.21229
G1 X130.493 Y132.998 E.33158
G1 X124.514 Y132.998 E.19834
M204 S250
G1 X124.454 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8657
M204 S5000
G1 X129.974 Y133.39 E.16961
G1 X129.974 Y134.61 E.03749
G1 X124.454 Y134.61 E.16961
G1 X124.454 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.454 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.066 Y125.923 Z3.2 F42000
G1 X124.454 Y122.61 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F8657
M204 S5000
G1 X124.454 Y121.39 E.03749
G1 X129.974 Y121.39 E.16961
G1 X129.974 Y122.61 E.03749
G1 X124.514 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y121.39 E-.46416
G1 X125.232 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.192 Y128.425 Z3.2 F42000
G1 X130.883 Y134.821 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F8657
M204 S5000
G3 X130.701 Y134.99 I-.193 J-.026 E.00828
G1 X123.826 Y134.978 E.21123
G3 X123.701 Y134.793 I.068 J-.181 E.00734
G1 X123.703 Y121.175 E.41843
G3 X123.886 Y121.01 I.194 J.032 E.00817
G1 X130.696 Y121.01 E.20924
G3 X130.885 Y121.198 I-.009 J.198 E.00897
G1 X130.883 Y134.761 E.41676
M204 S10000
G1 X130.429 Y134.794 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.562107
G1 F6933.925
M204 S6000
G1 X130.429 Y133.194 E.06767
; WIPE_START
G1 X130.429 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.767 Y132.387 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.273683
G1 F8657
M204 S6000
G1 X129.767 Y123.613 E.165
; WIPE_START
G1 F15000
G1 X129.767 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.429 Y122.806 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.561827
G1 F6937.667
M204 S6000
G1 X130.429 Y121.206 E.06764
M204 S10000
G1 X124.077 Y121.206 F42000
; LINE_WIDTH: 0.40378
G1 F8657
M204 S6000
G1 X124.077 Y122.806 E.04704
; WIPE_START
G1 F9976.168
G1 X124.077 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.74 Y123.613 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.1155
G1 F8657
M204 S6000
G1 X124.74 Y132.387 E.0519
; WIPE_START
G1 F15000
G1 X124.74 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.077 Y133.194 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.40378
G1 F8657
M204 S6000
G1 X124.077 Y134.794 E.04705
; OBJECT_ID: 394
; WIPE_START
G1 F9976.168
G1 X124.077 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X116.45 Y132.903 Z3.2 F42000
G1 X108.278 Y132.591 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8657
M204 S6000
G1 X108.278 Y123.409 E.30458
G1 X108.916 Y123.409 E.02115
G1 X108.916 Y132.591 E.30458
G1 X108.338 Y132.591 E.01917
; WIPE_START
G1 F8843.478
G1 X108.325 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.157 Y124.197 Z3.2 F42000
G1 X103.81 Y123.665 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F8657
M204 S6000
G1 X103.81 Y132.591 E.29609
G1 X103.33 Y132.591 E.01591
G1 X103.33 Y123.409 E.30458
G1 X103.81 Y123.409 E.01591
G1 X103.81 Y123.605 E.0065
M204 S10000
G1 X104.609 Y123.273 F42000
G1 F8657
M204 S6000
G1 X107.871 Y123.273 E.10821
G1 X107.871 Y132.727 E.31361
G1 X104.217 Y132.727 E.12121
G1 X104.217 Y123.273 E.31361
G1 X104.549 Y123.273 E.01102
M204 S250
G1 X104.609 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8657
M204 S5000
G1 X107.479 Y123.665 E.08819
G1 X107.479 Y132.335 E.2664
G1 X104.609 Y132.335 E.08819
G1 X104.609 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X106.609 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.043 Y130.872 Z3.2 F42000
G1 X103.284 Y132.998 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8657
M204 S6000
G1 X102.923 Y132.998 E.01197
G1 X102.923 Y123.002 E.33158
G1 X109.323 Y123.002 E.21229
G1 X109.323 Y132.998 E.33158
G1 X103.344 Y132.998 E.19834
M204 S250
G1 X103.284 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8657
M204 S5000
G1 X108.804 Y133.39 E.16961
G1 X108.804 Y134.61 E.03749
G1 X103.284 Y134.61 E.16961
G1 X103.284 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.284 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.896 Y125.923 Z3.2 F42000
G1 X103.284 Y122.61 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F8657
M204 S5000
G1 X103.284 Y121.39 E.03749
G1 X108.804 Y121.39 E.16961
G1 X108.804 Y122.61 E.03749
G1 X103.344 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X103.284 Y121.39 E-.46416
G1 X104.062 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.023 Y128.425 Z3.2 F42000
G1 X109.714 Y134.821 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F8657
M204 S5000
G3 X109.531 Y134.99 I-.193 J-.026 E.00828
G1 X102.656 Y134.978 E.21123
G3 X102.531 Y134.793 I.068 J-.181 E.00734
G1 X102.533 Y121.175 E.41843
G3 X102.716 Y121.01 I.194 J.032 E.00817
G1 X109.526 Y121.01 E.20924
G3 X109.715 Y121.198 I-.009 J.198 E.00897
G1 X109.714 Y134.761 E.41676
M204 S10000
G1 X109.26 Y134.794 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.562107
G1 F6933.925
M204 S6000
G1 X109.26 Y133.194 E.06767
; WIPE_START
G1 X109.26 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.597 Y132.387 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.273683
G1 F8657
M204 S6000
G1 X108.597 Y123.613 E.165
; WIPE_START
G1 F15000
G1 X108.597 Y125.613 E-.76
; WIPE_END
M73 P43 R12
G1 E-.04 F1800
M204 S10000
G1 X109.259 Y122.806 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.561827
G1 F6937.667
M204 S6000
G1 X109.259 Y121.206 E.06764
M204 S10000
G1 X102.907 Y121.206 F42000
; LINE_WIDTH: 0.40378
G1 F8657
M204 S6000
G1 X102.907 Y122.806 E.04704
; WIPE_START
G1 F9976.168
G1 X102.907 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.57 Y123.613 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.1155
G1 F8657
M204 S6000
G1 X103.57 Y132.387 E.0519
; WIPE_START
G1 F15000
G1 X103.57 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.907 Y133.194 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.40378
G1 F8657
M204 S6000
G1 X102.907 Y134.794 E.04705
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9976.168
G1 X102.907 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 15/72
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z3.2 I.015 J1.217 P1  F42000
G1 X150.618 Y132.591 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8660
M204 S6000
G1 X150.618 Y123.409 E.30458
G1 X151.263 Y123.409 E.02142
G1 X151.263 Y132.591 E.30458
G1 X150.678 Y132.591 E.01943
; WIPE_START
G1 F8843.478
G1 X150.665 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.496 Y124.197 Z3.4 F42000
G1 X146.149 Y123.665 Z3.4
G1 Z3
G1 E.8 F1800
G1 F8660
M204 S6000
G1 X146.149 Y132.591 E.29609
G1 X145.677 Y132.591 E.01566
G1 X145.677 Y123.409 E.30458
G1 X146.149 Y123.409 E.01566
G1 X146.149 Y123.605 E.0065
M204 S10000
G1 X146.948 Y123.273 F42000
G1 F8660
M204 S6000
G1 X150.211 Y123.273 E.10821
G1 X150.211 Y132.727 E.31361
G1 X146.556 Y132.727 E.12121
G1 X146.556 Y123.273 E.31361
G1 X146.888 Y123.273 E.01102
M204 S250
G1 X146.948 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8660
M204 S5000
G1 X149.818 Y123.665 E.08819
G1 X149.818 Y132.335 E.2664
G1 X146.948 Y132.335 E.08819
G1 X146.948 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.948 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.382 Y130.872 Z3.4 F42000
G1 X145.623 Y132.998 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8660
M204 S6000
G1 X145.27 Y132.998 E.01172
G1 X145.27 Y123.002 E.33158
G1 X151.67 Y123.002 E.2123
G1 X151.67 Y132.998 E.33158
G1 X145.683 Y132.998 E.1986
M204 S250
G1 X145.623 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8660
M204 S5000
G1 X151.143 Y133.39 E.16961
G1 X151.143 Y134.61 E.03749
G1 X145.623 Y134.61 E.16961
G1 X145.623 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X147.623 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.236 Y125.923 Z3.4 F42000
G1 X145.623 Y122.61 Z3.4
G1 Z3
G1 E.8 F1800
G1 F8660
M204 S5000
G1 X145.623 Y121.39 E.03749
G1 X151.143 Y121.39 E.16961
G1 X151.143 Y122.61 E.03749
G1 X145.683 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.623 Y121.39 E-.46416
G1 X146.402 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.371 Y128.421 Z3.4 F42000
G1 X152.063 Y134.794 Z3.4
G1 Z3
G1 E.8 F1800
G1 F8660
M204 S5000
G1 X152.029 Y134.907 E.0036
G1 X151.935 Y134.979 E.00365
G3 X151.878 Y134.99 I-.065 J-.191 E.00177
G1 X145.003 Y134.978 E.21125
G3 X144.878 Y134.793 I.068 J-.181 E.00734
G1 X144.88 Y121.174 E.41845
G3 X145.064 Y121.01 I.194 J.033 E.00818
G1 X151.875 Y121.01 E.20927
G3 X152.062 Y121.199 I-.01 J.198 E.00895
G1 X152.063 Y134.734 E.41592
; WIPE_START
G1 F9547.055
M204 S6000
G1 X152.029 Y134.907 E-.06675
G1 X151.935 Y134.979 E-.04512
G1 X151.878 Y134.99 E-.02181
G1 X150.23 Y134.987 E-.62632
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
G1 X151.603 Y134.794 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.569947
G1 F6830.775
M204 S6000
G1 X151.603 Y133.194 E.06869
; WIPE_START
G1 X151.603 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.94 Y132.387 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.281543
G1 F8660
M204 S6000
G1 X150.94 Y123.613 E.17062
; WIPE_START
G1 F15000
G1 X150.94 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.603 Y122.806 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.569687
G1 F6834.146
M204 S6000
G1 X151.603 Y121.206 E.06866
M204 S10000
G1 X145.251 Y121.206 F42000
; LINE_WIDTH: 0.39625
G1 F8660
M204 S6000
G1 X145.251 Y122.806 E.04605
; WIPE_START
G1 F10188.775
G1 X145.251 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.913 Y123.613 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.10797
G1 F8660
M204 S6000
G1 X145.913 Y132.387 E.04651
; WIPE_START
G1 F15000
G1 X145.913 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.251 Y133.194 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.39625
G1 F8660
M204 S6000
G1 X145.251 Y134.794 E.04606
; OBJECT_ID: 405
; WIPE_START
G1 F10188.775
G1 X145.251 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.624 Y132.903 Z3.4 F42000
G1 X129.448 Y132.591 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8660
M204 S6000
G1 X129.448 Y123.409 E.30458
G1 X130.093 Y123.409 E.02142
G1 X130.094 Y132.591 E.30458
G1 X129.508 Y132.591 E.01943
; WIPE_START
G1 F8843.478
G1 X129.495 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.326 Y124.197 Z3.4 F42000
G1 X124.98 Y123.665 Z3.4
G1 Z3
G1 E.8 F1800
G1 F8660
M204 S6000
G1 X124.98 Y132.591 E.29609
G1 X124.507 Y132.591 E.01566
G1 X124.507 Y123.409 E.30458
G1 X124.98 Y123.409 E.01566
G1 X124.98 Y123.605 E.0065
M204 S10000
G1 X125.779 Y123.273 F42000
G1 F8660
M204 S6000
G1 X129.041 Y123.273 E.10821
G1 X129.041 Y132.727 E.31361
G1 X125.387 Y132.727 E.12121
G1 X125.387 Y123.273 E.31361
G1 X125.719 Y123.273 E.01102
M204 S250
G1 X125.779 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8660
M204 S5000
G1 X128.649 Y123.665 E.08819
G1 X128.649 Y132.335 E.2664
G1 X125.779 Y132.335 E.08819
G1 X125.779 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.778 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.213 Y130.872 Z3.4 F42000
G1 X124.454 Y132.998 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8660
M204 S6000
G1 X124.1 Y132.998 E.01172
G1 X124.1 Y123.002 E.33158
G1 X130.5 Y123.002 E.2123
G1 X130.501 Y132.998 E.33158
G1 X124.514 Y132.998 E.1986
M204 S250
G1 X124.454 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8660
M204 S5000
G1 X129.974 Y133.39 E.16961
G1 X129.974 Y134.61 E.03749
G1 X124.454 Y134.61 E.16961
G1 X124.454 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.454 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.066 Y125.923 Z3.4 F42000
G1 X124.454 Y122.61 Z3.4
G1 Z3
G1 E.8 F1800
G1 F8660
M204 S5000
G1 X124.454 Y121.39 E.03749
G1 X129.974 Y121.39 E.16961
G1 X129.974 Y122.61 E.03749
G1 X124.514 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y121.39 E-.46416
G1 X125.232 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.201 Y128.421 Z3.4 F42000
G1 X130.893 Y134.794 Z3.4
G1 Z3
G1 E.8 F1800
G1 F8660
M204 S5000
G1 X130.859 Y134.907 E.0036
G1 X130.765 Y134.979 E.00365
G3 X130.709 Y134.99 I-.065 J-.191 E.00177
G1 X123.833 Y134.978 E.21125
G3 X123.708 Y134.793 I.068 J-.181 E.00734
G1 X123.71 Y121.174 E.41845
G3 X123.894 Y121.01 I.194 J.033 E.00818
G1 X130.705 Y121.01 E.20927
G3 X130.893 Y121.199 I-.01 J.198 E.00895
G1 X130.893 Y134.734 E.41592
M204 S10000
G1 X130.433 Y134.794 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.569947
G1 F6830.775
M204 S6000
G1 X130.433 Y133.194 E.06869
; WIPE_START
G1 X130.433 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.771 Y132.387 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.281543
G1 F8660
M204 S6000
G1 X129.771 Y123.613 E.17062
; WIPE_START
G1 F15000
G1 X129.771 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.433 Y122.806 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.569687
G1 F6834.146
M204 S6000
G1 X130.433 Y121.206 E.06866
M204 S10000
G1 X124.081 Y121.206 F42000
; LINE_WIDTH: 0.39625
G1 F8660
M204 S6000
G1 X124.081 Y122.806 E.04605
; WIPE_START
G1 F10188.775
G1 X124.081 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.743 Y123.613 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.10797
G1 F8660
M204 S6000
G1 X124.743 Y132.387 E.04651
; WIPE_START
G1 F15000
G1 X124.743 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.081 Y133.194 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.39625
G1 F8660
M204 S6000
G1 X124.081 Y134.794 E.04606
; OBJECT_ID: 394
; WIPE_START
G1 F10188.775
G1 X124.081 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X116.454 Y132.903 Z3.4 F42000
G1 X108.278 Y132.591 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8660
M204 S6000
G1 X108.278 Y123.409 E.30458
G1 X108.924 Y123.409 E.02142
G1 X108.924 Y132.591 E.30458
G1 X108.338 Y132.591 E.01943
; WIPE_START
G1 F8843.478
G1 X108.325 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.157 Y124.197 Z3.4 F42000
G1 X103.81 Y123.665 Z3.4
G1 Z3
G1 E.8 F1800
G1 F8660
M204 S6000
G1 X103.81 Y132.591 E.29609
G1 X103.338 Y132.591 E.01566
G1 X103.338 Y123.409 E.30458
G1 X103.81 Y123.409 E.01566
G1 X103.81 Y123.605 E.0065
M204 S10000
G1 X104.609 Y123.273 F42000
G1 F8660
M204 S6000
G1 X107.871 Y123.273 E.10821
G1 X107.871 Y132.727 E.31361
G1 X104.217 Y132.727 E.12121
G1 X104.217 Y123.273 E.31361
G1 X104.549 Y123.273 E.01102
M204 S250
G1 X104.609 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8660
M204 S5000
G1 X107.479 Y123.665 E.08819
G1 X107.479 Y132.335 E.2664
G1 X104.609 Y132.335 E.08819
G1 X104.609 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X106.609 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.043 Y130.872 Z3.4 F42000
G1 X103.284 Y132.998 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8660
M204 S6000
G1 X102.931 Y132.998 E.01172
G1 X102.931 Y123.002 E.33158
G1 X109.331 Y123.002 E.2123
G1 X109.331 Y132.998 E.33158
G1 X103.344 Y132.998 E.1986
M204 S250
G1 X103.284 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8660
M204 S5000
G1 X108.804 Y133.39 E.16961
G1 X108.804 Y134.61 E.03749
G1 X103.284 Y134.61 E.16961
G1 X103.284 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.284 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.896 Y125.923 Z3.4 F42000
G1 X103.284 Y122.61 Z3.4
G1 Z3
G1 E.8 F1800
G1 F8660
M204 S5000
G1 X103.284 Y121.39 E.03749
G1 X108.804 Y121.39 E.16961
G1 X108.804 Y122.61 E.03749
G1 X103.344 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X103.284 Y121.39 E-.46416
G1 X104.062 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P44 R12
G1 X107.032 Y128.421 Z3.4 F42000
G1 X109.723 Y134.794 Z3.4
G1 Z3
G1 E.8 F1800
G1 F8660
M204 S5000
G1 X109.69 Y134.907 E.0036
G1 X109.595 Y134.979 E.00365
G3 X109.539 Y134.99 I-.065 J-.191 E.00177
G1 X102.664 Y134.978 E.21125
G3 X102.539 Y134.793 I.068 J-.181 E.00734
G1 X102.541 Y121.174 E.41845
G3 X102.725 Y121.01 I.194 J.033 E.00818
G1 X109.535 Y121.01 E.20927
G3 X109.723 Y121.199 I-.01 J.198 E.00895
G1 X109.723 Y134.734 E.41592
M204 S10000
G1 X109.263 Y134.794 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.569947
G1 F6830.775
M204 S6000
G1 X109.263 Y133.194 E.06869
; WIPE_START
G1 X109.263 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.601 Y132.387 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.281543
G1 F8660
M204 S6000
G1 X108.601 Y123.613 E.17062
; WIPE_START
G1 F15000
G1 X108.601 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.263 Y122.806 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.569687
G1 F6834.146
M204 S6000
G1 X109.263 Y121.206 E.06866
M204 S10000
G1 X102.911 Y121.206 F42000
; LINE_WIDTH: 0.39625
G1 F8660
M204 S6000
G1 X102.911 Y122.806 E.04605
; WIPE_START
G1 F10188.775
G1 X102.911 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.574 Y123.613 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.10797
G1 F8660
M204 S6000
G1 X103.574 Y132.387 E.04651
; WIPE_START
G1 F15000
G1 X103.574 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.911 Y133.194 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.39625
G1 F8660
M204 S6000
G1 X102.911 Y134.794 E.04606
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10188.775
G1 X102.911 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 16/72
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z3.4 I.015 J1.217 P1  F42000
G1 X150.618 Y132.591 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8668
M204 S6000
G1 X150.618 Y123.409 E.30458
G1 X151.275 Y123.409 E.02179
G1 X151.275 Y132.591 E.30458
G1 X150.678 Y132.591 E.01981
; WIPE_START
G1 F8843.478
G1 X150.665 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.496 Y124.197 Z3.6 F42000
G1 X146.149 Y123.665 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F8668
M204 S6000
G1 X146.149 Y132.591 E.29609
G1 X145.685 Y132.591 E.01541
G1 X145.685 Y123.409 E.30458
G1 X146.149 Y123.409 E.01541
G1 X146.149 Y123.605 E.0065
M204 S10000
G1 X146.948 Y123.273 F42000
G1 F8668
M204 S6000
G1 X150.211 Y123.273 E.10821
G1 X150.211 Y132.727 E.31361
G1 X146.556 Y132.727 E.12121
G1 X146.556 Y123.273 E.31361
G1 X146.888 Y123.273 E.01102
M204 S250
G1 X146.948 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8668
M204 S5000
G1 X149.818 Y123.665 E.08819
G1 X149.818 Y132.335 E.2664
G1 X146.948 Y132.335 E.08819
G1 X146.948 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.948 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.382 Y130.872 Z3.6 F42000
G1 X145.623 Y132.998 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8668
M204 S6000
G1 X145.278 Y132.998 E.01147
G1 X145.278 Y123.002 E.33158
G1 X151.682 Y123.002 E.21243
G1 X151.682 Y132.998 E.33158
G1 X145.683 Y132.998 E.19898
M204 S250
G1 X145.623 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8668
M204 S5000
G1 X151.143 Y133.39 E.16961
G1 X151.143 Y134.61 E.03749
G1 X145.623 Y134.61 E.16961
G1 X145.623 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X147.623 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.236 Y125.923 Z3.6 F42000
G1 X145.623 Y122.61 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F8668
M204 S5000
G1 X145.623 Y121.39 E.03749
G1 X151.143 Y121.39 E.16961
G1 X151.143 Y122.61 E.03749
G1 X145.683 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.623 Y121.39 E-.46416
G1 X146.402 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.37 Y128.422 Z3.6 F42000
G1 X152.072 Y134.821 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F8668
M204 S5000
G3 X151.889 Y134.99 I-.194 J-.027 E.00829
G1 X145.011 Y134.978 E.21134
G3 X144.886 Y134.793 I.068 J-.181 E.00734
G1 X144.888 Y121.173 E.41848
G3 X145.072 Y121.01 I.195 J.035 E.00815
G1 X151.886 Y121.01 E.20937
G3 X152.074 Y121.199 I-.01 J.198 E.00896
G1 X152.072 Y134.761 E.41674
; WIPE_START
G1 F9547.055
M204 S6000
G1 X152.055 Y134.881 E-.04583
G1 X152.008 Y134.943 E-.02963
G1 X151.889 Y134.99 E-.04863
G1 X150.215 Y134.987 E-.6359
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
G1 X151.609 Y134.794 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.581285
G1 F6686.913
M204 S6000
G1 X151.609 Y133.194 E.07017
; WIPE_START
G1 X151.609 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.946 Y132.387 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.292873
G1 F8668
M204 S6000
G1 X150.946 Y123.613 E.17872
; WIPE_START
G1 F14402.724
G1 X150.946 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.609 Y122.806 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.581025
G1 F6690.144
M204 S6000
G1 X151.609 Y121.206 E.07014
M204 S10000
G1 X145.255 Y121.206 F42000
; LINE_WIDTH: 0.38872
G1 F8668
M204 S6000
G1 X145.255 Y122.806 E.04507
; WIPE_START
G1 F10410.642
G1 X145.255 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.917 Y123.613 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.10044
G1 F8668
M204 S6000
G1 X145.917 Y132.387 E.04113
; WIPE_START
G1 F15000
G1 X145.917 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.255 Y133.194 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.38872
G1 F8668
M204 S6000
G1 X145.255 Y134.794 E.04508
; OBJECT_ID: 405
; WIPE_START
G1 F10410.642
G1 X145.255 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.628 Y132.903 Z3.6 F42000
G1 X129.448 Y132.591 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8668
M204 S6000
G1 X129.448 Y123.409 E.30458
G1 X130.105 Y123.409 E.02179
G1 X130.105 Y132.591 E.30458
G1 X129.508 Y132.591 E.01981
; WIPE_START
G1 F8843.478
G1 X129.495 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.326 Y124.197 Z3.6 F42000
G1 X124.98 Y123.665 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F8668
M204 S6000
G1 X124.98 Y132.591 E.29609
G1 X124.515 Y132.591 E.01541
G1 X124.515 Y123.409 E.30458
G1 X124.98 Y123.409 E.01541
G1 X124.98 Y123.605 E.0065
M204 S10000
G1 X125.779 Y123.273 F42000
G1 F8668
M204 S6000
G1 X129.041 Y123.273 E.10821
G1 X129.041 Y132.727 E.31361
G1 X125.387 Y132.727 E.12121
G1 X125.387 Y123.273 E.31361
G1 X125.719 Y123.273 E.01102
M204 S250
G1 X125.779 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8668
M204 S5000
G1 X128.649 Y123.665 E.08819
G1 X128.649 Y132.335 E.2664
G1 X125.779 Y132.335 E.08819
G1 X125.779 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.778 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.213 Y130.872 Z3.6 F42000
G1 X124.454 Y132.998 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8668
M204 S6000
G1 X124.108 Y132.998 E.01147
G1 X124.108 Y123.002 E.33158
G1 X130.512 Y123.002 E.21243
G1 X130.512 Y132.998 E.33158
G1 X124.514 Y132.998 E.19898
M204 S250
G1 X124.454 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8668
M204 S5000
G1 X129.974 Y133.39 E.16961
G1 X129.974 Y134.61 E.03749
G1 X124.454 Y134.61 E.16961
G1 X124.454 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.454 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.066 Y125.923 Z3.6 F42000
G1 X124.454 Y122.61 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F8668
M204 S5000
G1 X124.454 Y121.39 E.03749
G1 X129.974 Y121.39 E.16961
G1 X129.974 Y122.61 E.03749
G1 X124.514 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y121.39 E-.46416
G1 X125.232 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.201 Y128.422 Z3.6 F42000
G1 X130.903 Y134.821 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F8668
M204 S5000
G3 X130.719 Y134.99 I-.194 J-.027 E.00829
G1 X123.841 Y134.978 E.21134
G3 X123.716 Y134.793 I.068 J-.181 E.00734
G1 X123.718 Y121.173 E.41848
G3 X123.902 Y121.01 I.195 J.035 E.00815
G1 X130.716 Y121.01 E.20937
G3 X130.904 Y121.199 I-.01 J.198 E.00896
G1 X130.903 Y134.761 E.41674
M204 S10000
G1 X130.439 Y134.794 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.581285
G1 F6686.913
M204 S6000
G1 X130.439 Y133.194 E.07017
; WIPE_START
G1 X130.439 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.776 Y132.387 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.292873
G1 F8668
M204 S6000
G1 X129.776 Y123.613 E.17872
; WIPE_START
G1 F14402.724
G1 X129.776 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.439 Y122.806 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.581025
G1 F6690.144
M204 S6000
G1 X130.439 Y121.206 E.07014
M204 S10000
G1 X124.085 Y121.206 F42000
; LINE_WIDTH: 0.38872
G1 F8668
M204 S6000
G1 X124.085 Y122.806 E.04507
; WIPE_START
G1 F10410.642
G1 X124.085 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.747 Y123.613 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.10044
G1 F8668
M204 S6000
G1 X124.747 Y132.387 E.04113
; WIPE_START
G1 F15000
G1 X124.747 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.085 Y133.194 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.38872
G1 F8668
M204 S6000
G1 X124.085 Y134.794 E.04508
; OBJECT_ID: 394
; WIPE_START
G1 F10410.642
G1 X124.085 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X116.458 Y132.903 Z3.6 F42000
G1 X108.278 Y132.591 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8668
M204 S6000
G1 X108.278 Y123.409 E.30458
G1 X108.935 Y123.409 E.02179
G1 X108.935 Y132.591 E.30458
G1 X108.338 Y132.591 E.01981
; WIPE_START
G1 F8843.478
G1 X108.325 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.157 Y124.197 Z3.6 F42000
G1 X103.81 Y123.665 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F8668
M204 S6000
G1 X103.81 Y132.591 E.29609
G1 X103.345 Y132.591 E.01541
G1 X103.345 Y123.409 E.30458
G1 X103.81 Y123.409 E.01541
G1 X103.81 Y123.605 E.0065
M204 S10000
G1 X104.609 Y123.273 F42000
G1 F8668
M204 S6000
G1 X107.871 Y123.273 E.10821
G1 X107.871 Y132.727 E.31361
G1 X104.217 Y132.727 E.12121
G1 X104.217 Y123.273 E.31361
G1 X104.549 Y123.273 E.01102
M204 S250
G1 X104.609 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8668
M204 S5000
G1 X107.479 Y123.665 E.08819
G1 X107.479 Y132.335 E.2664
G1 X104.609 Y132.335 E.08819
G1 X104.609 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X106.609 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.043 Y130.872 Z3.6 F42000
M73 P45 R12
G1 X103.284 Y132.998 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8668
M204 S6000
G1 X102.938 Y132.998 E.01147
G1 X102.938 Y123.002 E.33158
G1 X109.342 Y123.002 E.21243
G1 X109.342 Y132.998 E.33158
G1 X103.344 Y132.998 E.19898
M204 S250
G1 X103.284 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8668
M204 S5000
G1 X108.804 Y133.39 E.16961
G1 X108.804 Y134.61 E.03749
G1 X103.284 Y134.61 E.16961
G1 X103.284 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.284 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.896 Y125.923 Z3.6 F42000
G1 X103.284 Y122.61 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F8668
M204 S5000
G1 X103.284 Y121.39 E.03749
G1 X108.804 Y121.39 E.16961
G1 X108.804 Y122.61 E.03749
G1 X103.344 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X103.284 Y121.39 E-.46416
G1 X104.062 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.031 Y128.422 Z3.6 F42000
G1 X109.733 Y134.821 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F8668
M204 S5000
G3 X109.549 Y134.99 I-.194 J-.027 E.00829
G1 X102.671 Y134.978 E.21134
G3 X102.546 Y134.793 I.068 J-.181 E.00734
G1 X102.548 Y121.173 E.41848
G3 X102.732 Y121.01 I.195 J.035 E.00815
G1 X109.546 Y121.01 E.20937
G3 X109.734 Y121.199 I-.01 J.198 E.00896
G1 X109.733 Y134.761 E.41674
M204 S10000
G1 X109.269 Y134.794 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.581285
G1 F6686.913
M204 S6000
G1 X109.269 Y133.194 E.07017
; WIPE_START
G1 X109.269 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.607 Y132.387 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.292873
G1 F8668
M204 S6000
G1 X108.607 Y123.613 E.17872
; WIPE_START
G1 F14402.724
G1 X108.607 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.269 Y122.806 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.581025
G1 F6690.144
M204 S6000
G1 X109.269 Y121.206 E.07014
M204 S10000
G1 X102.915 Y121.206 F42000
; LINE_WIDTH: 0.38872
G1 F8668
M204 S6000
G1 X102.915 Y122.806 E.04507
; WIPE_START
G1 F10410.642
G1 X102.915 Y121.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.578 Y123.613 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.10044
G1 F8668
M204 S6000
G1 X103.578 Y132.387 E.04113
; WIPE_START
G1 F15000
G1 X103.578 Y130.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.915 Y133.194 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.38872
G1 F8668
M204 S6000
G1 X102.915 Y134.794 E.04508
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10410.642
G1 X102.915 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 17/72
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z3.6 I.015 J1.217 P1  F42000
G1 X150.618 Y132.591 Z3.6
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7913
M204 S6000
G1 X150.618 Y123.409 E.30458
G1 X151.292 Y123.409 E.02236
G1 X151.292 Y132.591 E.30458
G1 X150.678 Y132.591 E.02037
; WIPE_START
G1 F8843.478
G1 X150.665 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.496 Y124.197 Z3.8 F42000
G1 X146.149 Y123.665 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F7913
M204 S6000
G1 X146.149 Y132.591 E.29609
G1 X145.692 Y132.591 E.01516
G1 X145.692 Y123.409 E.30458
G1 X146.149 Y123.409 E.01516
G1 X146.149 Y123.605 E.0065
M204 S10000
G1 X146.948 Y123.273 F42000
G1 F7913
M204 S6000
G1 X150.211 Y123.273 E.10821
G1 X150.211 Y132.727 E.31361
G1 X146.556 Y132.727 E.12121
G1 X146.556 Y123.273 E.31361
G1 X146.888 Y123.273 E.01102
M204 S250
G1 X146.948 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7913
M204 S5000
G1 X149.818 Y123.665 E.08819
G1 X149.818 Y132.335 E.2664
G1 X146.948 Y132.335 E.08819
G1 X146.948 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.948 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.382 Y130.872 Z3.8 F42000
G1 X145.623 Y132.998 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7913
M204 S6000
G1 X145.285 Y132.998 E.01122
G1 X145.285 Y123.002 E.33158
G1 X151.699 Y123.002 E.21275
G1 X151.699 Y132.998 E.33158
G1 X145.683 Y132.998 E.19954
M204 S250
G1 X145.623 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7913
M204 S5000
G1 X151.143 Y133.39 E.16961
M73 P45 R11
G1 X151.143 Y134.61 E.03749
G1 X145.623 Y134.61 E.16961
G1 X145.623 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X147.623 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.236 Y125.923 Z3.8 F42000
G1 X145.623 Y122.61 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F7913
M204 S5000
G1 X145.623 Y121.39 E.03749
G1 X151.143 Y121.39 E.16961
G1 X151.143 Y122.61 E.03749
G1 X145.683 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.623 Y121.39 E-.46416
G1 X146.402 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.384 Y128.416 Z3.8 F42000
G1 X152.091 Y134.794 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F7913
M204 S5000
G1 X152.057 Y134.907 E.00362
G1 X151.963 Y134.979 E.00364
G3 X151.906 Y134.99 I-.067 J-.193 E.00181
G1 X145.018 Y134.978 E.21163
G3 X144.893 Y134.793 I.068 J-.181 E.00734
G1 X144.897 Y121.162 E.41882
G3 X145.08 Y121.01 I.187 J.039 E.00787
G1 X151.901 Y121.01 E.20961
G3 X152.091 Y121.199 I-.009 J.198 E.009
G1 X152.091 Y134.734 E.41589
; WIPE_START
G1 F9547.055
M204 S6000
G1 X152.057 Y134.907 E-.06689
G1 X151.963 Y134.979 E-.04502
G1 X151.906 Y134.99 E-.02228
G1 X150.259 Y134.987 E-.62581
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
G1 X151.617 Y134.794 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.598347
G1 F6481.5
M204 S6000
G1 X151.617 Y133.194 E.07239
; WIPE_START
G1 X151.617 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.955 Y132.387 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.309923
G1 F7913
M204 S6000
G1 X150.955 Y123.613 E.19091
; WIPE_START
G1 F13482.992
G1 X150.955 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.617 Y122.806 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.598087
G1 F6484.536
M204 S6000
G1 X151.617 Y121.206 E.07236
M204 S10000
G1 X145.258 Y121.206 F42000
; LINE_WIDTH: 0.3812
G1 F7913
M204 S6000
G1 X145.258 Y122.806 E.04409
M204 S10000
G1 X145.258 Y133.194 F42000
G1 F7913
M204 S6000
G1 X145.258 Y134.794 E.0441
; OBJECT_ID: 405
; WIPE_START
G1 F10642.071
G1 X145.258 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.631 Y132.903 Z3.8 F42000
G1 X129.448 Y132.591 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7913
M204 S6000
G1 X129.448 Y123.409 E.30458
G1 X130.122 Y123.409 E.02236
G1 X130.122 Y132.591 E.30458
G1 X129.508 Y132.591 E.02037
; WIPE_START
G1 F8843.478
G1 X129.495 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.326 Y124.197 Z3.8 F42000
G1 X124.98 Y123.665 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F7913
M204 S6000
G1 X124.98 Y132.591 E.29609
G1 X124.522 Y132.591 E.01516
G1 X124.522 Y123.409 E.30458
G1 X124.98 Y123.409 E.01516
G1 X124.98 Y123.605 E.0065
M204 S10000
G1 X125.779 Y123.273 F42000
G1 F7913
M204 S6000
G1 X129.041 Y123.273 E.10821
G1 X129.041 Y132.727 E.31361
G1 X125.387 Y132.727 E.12121
G1 X125.387 Y123.273 E.31361
G1 X125.719 Y123.273 E.01102
M204 S250
G1 X125.779 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7913
M204 S5000
G1 X128.649 Y123.665 E.08819
G1 X128.649 Y132.335 E.2664
G1 X125.779 Y132.335 E.08819
G1 X125.779 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.778 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.213 Y130.872 Z3.8 F42000
G1 X124.454 Y132.998 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7913
M204 S6000
G1 X124.115 Y132.998 E.01122
G1 X124.115 Y123.002 E.33158
G1 X130.529 Y123.002 E.21275
G1 X130.529 Y132.998 E.33158
G1 X124.514 Y132.998 E.19954
M204 S250
G1 X124.454 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7913
M204 S5000
G1 X129.974 Y133.39 E.16961
G1 X129.974 Y134.61 E.03749
G1 X124.454 Y134.61 E.16961
G1 X124.454 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.454 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.066 Y125.923 Z3.8 F42000
G1 X124.454 Y122.61 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F7913
M204 S5000
G1 X124.454 Y121.39 E.03749
G1 X129.974 Y121.39 E.16961
G1 X129.974 Y122.61 E.03749
G1 X124.514 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y121.39 E-.46416
G1 X125.232 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.214 Y128.416 Z3.8 F42000
G1 X130.921 Y134.794 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F7913
M204 S5000
G1 X130.888 Y134.907 E.00362
G1 X130.794 Y134.979 E.00364
G3 X130.736 Y134.99 I-.067 J-.193 E.00181
G1 X123.849 Y134.978 E.21163
G3 X123.723 Y134.793 I.068 J-.181 E.00734
G1 X123.728 Y121.162 E.41882
G3 X123.91 Y121.01 I.187 J.039 E.00787
G1 X130.732 Y121.01 E.20961
G3 X130.921 Y121.199 I-.009 J.198 E.009
G1 X130.921 Y134.734 E.41589
M204 S10000
G1 X130.447 Y134.794 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.598347
G1 F6481.5
M204 S6000
G1 X130.447 Y133.194 E.07239
; WIPE_START
G1 X130.447 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.785 Y132.387 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.309923
G1 F7913
M204 S6000
G1 X129.785 Y123.613 E.19091
; WIPE_START
G1 F13482.992
G1 X129.785 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.447 Y122.806 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.598087
G1 F6484.536
M204 S6000
G1 X130.447 Y121.206 E.07236
M204 S10000
G1 X124.089 Y121.206 F42000
; LINE_WIDTH: 0.3812
G1 F7913
M204 S6000
G1 X124.089 Y122.806 E.04409
M204 S10000
G1 X124.089 Y133.194 F42000
G1 F7913
M204 S6000
G1 X124.089 Y134.794 E.0441
; OBJECT_ID: 394
; WIPE_START
G1 F10642.071
G1 X124.089 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X116.462 Y132.903 Z3.8 F42000
G1 X108.278 Y132.591 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7913
M204 S6000
G1 X108.278 Y123.409 E.30458
G1 X108.952 Y123.409 E.02236
G1 X108.952 Y132.591 E.30458
G1 X108.338 Y132.591 E.02037
; WIPE_START
G1 F8843.478
G1 X108.325 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.157 Y124.197 Z3.8 F42000
G1 X103.81 Y123.665 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F7913
M204 S6000
G1 X103.81 Y132.591 E.29609
G1 X103.353 Y132.591 E.01516
G1 X103.353 Y123.409 E.30458
G1 X103.81 Y123.409 E.01516
G1 X103.81 Y123.605 E.0065
M204 S10000
G1 X104.609 Y123.273 F42000
G1 F7913
M204 S6000
G1 X107.871 Y123.273 E.10821
M73 P46 R11
G1 X107.871 Y132.727 E.31361
G1 X104.217 Y132.727 E.12121
G1 X104.217 Y123.273 E.31361
G1 X104.549 Y123.273 E.01102
M204 S250
G1 X104.609 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7913
M204 S5000
G1 X107.479 Y123.665 E.08819
G1 X107.479 Y132.335 E.2664
G1 X104.609 Y132.335 E.08819
G1 X104.609 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X106.609 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.043 Y130.872 Z3.8 F42000
G1 X103.284 Y132.998 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7913
M204 S6000
G1 X102.946 Y132.998 E.01122
G1 X102.946 Y123.002 E.33158
G1 X109.359 Y123.002 E.21275
G1 X109.359 Y132.998 E.33158
G1 X103.344 Y132.998 E.19954
M204 S250
G1 X103.284 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7913
M204 S5000
G1 X108.804 Y133.39 E.16961
G1 X108.804 Y134.61 E.03749
G1 X103.284 Y134.61 E.16961
G1 X103.284 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.284 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.896 Y125.923 Z3.8 F42000
G1 X103.284 Y122.61 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F7913
M204 S5000
G1 X103.284 Y121.39 E.03749
G1 X108.804 Y121.39 E.16961
G1 X108.804 Y122.61 E.03749
G1 X103.344 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X103.284 Y121.39 E-.46416
G1 X104.062 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.044 Y128.416 Z3.8 F42000
G1 X109.751 Y134.794 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F7913
M204 S5000
G1 X109.718 Y134.907 E.00362
G1 X109.624 Y134.979 E.00364
G3 X109.566 Y134.99 I-.067 J-.193 E.00181
G1 X102.679 Y134.978 E.21163
G3 X102.554 Y134.793 I.068 J-.181 E.00734
G1 X102.558 Y121.162 E.41882
G3 X102.74 Y121.01 I.187 J.039 E.00787
G1 X109.562 Y121.01 E.20961
G3 X109.751 Y121.199 I-.009 J.198 E.009
G1 X109.751 Y134.734 E.41589
M204 S10000
G1 X109.278 Y134.794 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.598347
G1 F6481.5
M204 S6000
G1 X109.278 Y133.194 E.07239
; WIPE_START
G1 X109.278 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.615 Y132.387 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.309923
G1 F7913
M204 S6000
G1 X108.615 Y123.613 E.19091
; WIPE_START
G1 F13482.992
G1 X108.615 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.278 Y122.806 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.598087
G1 F6484.536
M204 S6000
G1 X109.278 Y121.206 E.07236
M204 S10000
G1 X102.919 Y121.206 F42000
; LINE_WIDTH: 0.3812
G1 F7913
M204 S6000
G1 X102.919 Y122.806 E.04409
M204 S10000
G1 X102.919 Y133.194 F42000
G1 F7913
M204 S6000
G1 X102.919 Y134.794 E.0441
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10642.071
G1 X102.919 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 18/72
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z3.8 I.015 J1.217 P1  F42000
G1 X150.618 Y132.591 Z3.8
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7925
M204 S6000
G1 X150.618 Y123.409 E.30458
G1 X151.309 Y123.409 E.02292
G1 X151.309 Y132.591 E.30458
G1 X150.678 Y132.591 E.02094
; WIPE_START
G1 F8843.478
G1 X150.665 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.496 Y124.197 Z4 F42000
G1 X146.149 Y123.665 Z4
G1 Z3.6
G1 E.8 F1800
G1 F7925
M204 S6000
G1 X146.149 Y132.591 E.29609
G1 X145.703 Y132.591 E.0148
G1 X145.703 Y123.409 E.30458
G1 X146.149 Y123.409 E.0148
G1 X146.149 Y123.605 E.0065
M204 S10000
G1 X146.948 Y123.273 F42000
G1 F7925
M204 S6000
G1 X150.211 Y123.273 E.10821
G1 X150.211 Y132.727 E.31361
G1 X146.556 Y132.727 E.12121
G1 X146.556 Y123.273 E.31361
G1 X146.888 Y123.273 E.01102
M204 S250
G1 X146.948 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7925
M204 S5000
G1 X149.818 Y123.665 E.08819
G1 X149.818 Y132.335 E.2664
G1 X146.948 Y132.335 E.08819
G1 X146.948 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.948 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.382 Y130.872 Z4 F42000
G1 X145.623 Y132.998 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7925
M204 S6000
G1 X145.296 Y132.998 E.01086
G1 X145.296 Y123.002 E.33158
G1 X151.716 Y123.002 E.21295
G1 X151.716 Y132.998 E.33158
G1 X145.683 Y132.998 E.20011
M204 S250
G1 X145.623 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7925
M204 S5000
G1 X151.143 Y133.39 E.16961
G1 X151.143 Y134.61 E.03749
G1 X145.623 Y134.61 E.16961
G1 X145.623 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X147.623 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.236 Y125.923 Z4 F42000
G1 X145.623 Y122.61 Z4
G1 Z3.6
G1 E.8 F1800
G1 F7925
M204 S5000
G1 X145.623 Y121.39 E.03749
G1 X151.143 Y121.39 E.16961
G1 X151.143 Y122.61 E.03749
G1 X145.683 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.623 Y121.39 E-.46416
G1 X146.402 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.391 Y128.413 Z4 F42000
G1 X152.108 Y134.794 Z4
G1 Z3.6
G1 E.8 F1800
G1 F7925
M204 S5000
G1 X152.074 Y134.907 E.00363
G1 X151.98 Y134.979 E.00363
G3 X151.923 Y134.99 I-.066 J-.193 E.00181
G1 X145.101 Y134.99 E.2096
G1 X145.008 Y134.969 E.00293
G3 X144.904 Y134.793 I.095 J-.176 E.00661
G1 X144.914 Y121.14 E.41953
G3 X145.092 Y121.01 I.183 J.064 E.00718
G1 X151.917 Y121.01 E.20971
G3 X152.108 Y121.199 I-.007 J.198 E.00905
G1 X152.108 Y134.734 E.4159
; WIPE_START
G1 F9547.055
M204 S6000
G1 X152.074 Y134.907 E-.06704
G1 X151.98 Y134.979 E-.04485
G1 X151.923 Y134.99 E-.02225
G1 X150.276 Y134.99 E-.62586
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
G1 X151.626 Y134.794 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.615396
G1 F6288.481
M204 S6000
G1 X151.626 Y133.194 E.07462
; WIPE_START
G1 X151.626 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.963 Y132.387 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.326983
G1 F7925
M204 S6000
G1 X150.963 Y123.613 E.20311
; WIPE_START
G1 F12673.241
G1 X150.963 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.626 Y122.806 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.615136
G1 F6291.338
M204 S6000
G1 X151.626 Y121.206 E.07459
M204 S10000
G1 X145.264 Y121.206 F42000
; LINE_WIDTH: 0.37036
G1 F7925
M204 S6000
G1 X145.264 Y122.806 E.04268
M204 S10000
G1 X145.264 Y133.194 F42000
G1 F7925
M204 S6000
G1 X145.264 Y134.794 E.04269
; OBJECT_ID: 405
; WIPE_START
G1 F10994.38
G1 X145.264 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.637 Y132.903 Z4 F42000
G1 X129.448 Y132.591 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7925
M204 S6000
G1 X129.448 Y123.409 E.30458
G1 X130.139 Y123.409 E.02292
G1 X130.139 Y132.591 E.30458
G1 X129.508 Y132.591 E.02094
; WIPE_START
G1 F8843.478
G1 X129.495 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.326 Y124.197 Z4 F42000
G1 X124.98 Y123.665 Z4
G1 Z3.6
G1 E.8 F1800
G1 F7925
M204 S6000
G1 X124.98 Y132.591 E.29609
G1 X124.533 Y132.591 E.0148
G1 X124.533 Y123.409 E.30458
G1 X124.98 Y123.409 E.0148
G1 X124.98 Y123.605 E.0065
M204 S10000
G1 X125.779 Y123.273 F42000
G1 F7925
M204 S6000
G1 X129.041 Y123.273 E.10821
G1 X129.041 Y132.727 E.31361
G1 X125.387 Y132.727 E.12121
G1 X125.387 Y123.273 E.31361
G1 X125.719 Y123.273 E.01102
M204 S250
G1 X125.779 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7925
M204 S5000
G1 X128.649 Y123.665 E.08819
G1 X128.649 Y132.335 E.2664
G1 X125.779 Y132.335 E.08819
G1 X125.779 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.778 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.213 Y130.872 Z4 F42000
G1 X124.454 Y132.998 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7925
M204 S6000
G1 X124.126 Y132.998 E.01086
G1 X124.126 Y123.002 E.33158
G1 X130.546 Y123.002 E.21295
G1 X130.546 Y132.998 E.33158
G1 X124.514 Y132.998 E.20011
M204 S250
G1 X124.454 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7925
M204 S5000
G1 X129.974 Y133.39 E.16961
G1 X129.974 Y134.61 E.03749
G1 X124.454 Y134.61 E.16961
G1 X124.454 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.454 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.066 Y125.923 Z4 F42000
G1 X124.454 Y122.61 Z4
G1 Z3.6
G1 E.8 F1800
G1 F7925
M204 S5000
G1 X124.454 Y121.39 E.03749
G1 X129.974 Y121.39 E.16961
G1 X129.974 Y122.61 E.03749
G1 X124.514 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y121.39 E-.46416
G1 X125.232 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.222 Y128.413 Z4 F42000
G1 X130.938 Y134.794 Z4
G1 Z3.6
G1 E.8 F1800
G1 F7925
M204 S5000
G1 X130.904 Y134.907 E.00363
G1 X130.81 Y134.979 E.00363
G3 X130.753 Y134.99 I-.066 J-.193 E.00181
G1 X123.932 Y134.99 E.2096
G1 X123.839 Y134.969 E.00293
G3 X123.734 Y134.793 I.095 J-.176 E.00661
G1 X123.744 Y121.14 E.41953
G3 X123.922 Y121.01 I.183 J.064 E.00718
G1 X130.747 Y121.01 E.20971
G3 X130.938 Y121.199 I-.007 J.198 E.00905
G1 X130.938 Y134.734 E.4159
M204 S10000
G1 X130.456 Y134.794 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.615396
G1 F6288.481
M204 S6000
G1 X130.456 Y133.194 E.07462
; WIPE_START
G1 X130.456 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.793 Y132.387 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.326983
G1 F7925
M204 S6000
G1 X129.793 Y123.613 E.20311
; WIPE_START
G1 F12673.241
G1 X129.793 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.456 Y122.806 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.615136
G1 F6291.338
M204 S6000
G1 X130.456 Y121.206 E.07459
M204 S10000
G1 X124.094 Y121.206 F42000
; LINE_WIDTH: 0.37036
G1 F7925
M204 S6000
G1 X124.094 Y122.806 E.04268
M204 S10000
G1 X124.094 Y133.194 F42000
G1 F7925
M204 S6000
G1 X124.094 Y134.794 E.04269
; OBJECT_ID: 394
; WIPE_START
G1 F10994.38
G1 X124.094 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X116.467 Y132.903 Z4 F42000
G1 X108.278 Y132.591 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7925
M204 S6000
G1 X108.278 Y123.409 E.30458
G1 X108.969 Y123.409 E.02292
G1 X108.969 Y132.591 E.30458
G1 X108.338 Y132.591 E.02094
; WIPE_START
G1 F8843.478
G1 X108.325 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.157 Y124.197 Z4 F42000
G1 X103.81 Y123.665 Z4
G1 Z3.6
G1 E.8 F1800
M73 P47 R11
G1 F7925
M204 S6000
G1 X103.81 Y132.591 E.29609
G1 X103.364 Y132.591 E.0148
G1 X103.364 Y123.409 E.30458
G1 X103.81 Y123.409 E.0148
G1 X103.81 Y123.605 E.0065
M204 S10000
G1 X104.609 Y123.273 F42000
G1 F7925
M204 S6000
G1 X107.871 Y123.273 E.10821
G1 X107.871 Y132.727 E.31361
G1 X104.217 Y132.727 E.12121
G1 X104.217 Y123.273 E.31361
G1 X104.549 Y123.273 E.01102
M204 S250
G1 X104.609 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7925
M204 S5000
G1 X107.479 Y123.665 E.08819
G1 X107.479 Y132.335 E.2664
G1 X104.609 Y132.335 E.08819
G1 X104.609 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X106.609 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.043 Y130.872 Z4 F42000
G1 X103.284 Y132.998 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7925
M204 S6000
G1 X102.957 Y132.998 E.01086
G1 X102.957 Y123.002 E.33158
G1 X109.376 Y123.002 E.21295
G1 X109.376 Y132.998 E.33158
G1 X103.344 Y132.998 E.20011
M204 S250
G1 X103.284 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7925
M204 S5000
G1 X108.804 Y133.39 E.16961
G1 X108.804 Y134.61 E.03749
G1 X103.284 Y134.61 E.16961
G1 X103.284 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.284 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.896 Y125.923 Z4 F42000
G1 X103.284 Y122.61 Z4
G1 Z3.6
G1 E.8 F1800
G1 F7925
M204 S5000
G1 X103.284 Y121.39 E.03749
G1 X108.804 Y121.39 E.16961
G1 X108.804 Y122.61 E.03749
G1 X103.344 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X103.284 Y121.39 E-.46416
G1 X104.062 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.052 Y128.413 Z4 F42000
G1 X109.769 Y134.794 Z4
G1 Z3.6
G1 E.8 F1800
G1 F7925
M204 S5000
G1 X109.735 Y134.907 E.00363
G1 X109.641 Y134.979 E.00363
G3 X109.583 Y134.99 I-.066 J-.193 E.00181
G1 X102.762 Y134.99 E.2096
G1 X102.669 Y134.969 E.00293
G3 X102.564 Y134.793 I.095 J-.176 E.00661
G1 X102.575 Y121.14 E.41953
G3 X102.753 Y121.01 I.183 J.064 E.00718
G1 X109.577 Y121.01 E.20971
G3 X109.768 Y121.199 I-.007 J.198 E.00905
G1 X109.768 Y134.734 E.4159
M204 S10000
G1 X109.286 Y134.794 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.615396
G1 F6288.481
M204 S6000
G1 X109.286 Y133.194 E.07462
; WIPE_START
G1 X109.286 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.624 Y132.387 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.326983
G1 F7925
M204 S6000
G1 X108.624 Y123.613 E.20311
; WIPE_START
G1 F12673.241
G1 X108.624 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.286 Y122.806 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.615136
G1 F6291.338
M204 S6000
G1 X109.286 Y121.206 E.07459
M204 S10000
G1 X102.924 Y121.206 F42000
; LINE_WIDTH: 0.37036
G1 F7925
M204 S6000
G1 X102.924 Y122.806 E.04268
M204 S10000
G1 X102.924 Y133.194 F42000
G1 F7925
M204 S6000
G1 X102.924 Y134.794 E.04269
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10994.38
G1 X102.924 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 19/72
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z4 I.015 J1.217 P1  F42000
G1 X150.618 Y132.591 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7936
M204 S6000
G1 X150.618 Y123.409 E.30458
G1 X151.326 Y123.409 E.02349
G1 X151.326 Y132.591 E.30458
G1 X150.678 Y132.591 E.0215
; WIPE_START
G1 F8843.478
G1 X150.665 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.496 Y124.197 Z4.2 F42000
G1 X146.149 Y123.665 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F7936
M204 S6000
G1 X146.149 Y132.591 E.29609
G1 X145.72 Y132.591 E.01424
G1 X145.72 Y123.409 E.30458
G1 X146.149 Y123.409 E.01424
G1 X146.149 Y123.605 E.0065
M204 S10000
G1 X146.948 Y123.273 F42000
G1 F7936
M204 S6000
G1 X150.211 Y123.273 E.10821
G1 X150.211 Y132.727 E.31361
G1 X146.556 Y132.727 E.12121
G1 X146.556 Y123.273 E.31361
G1 X146.888 Y123.273 E.01102
M204 S250
G1 X146.948 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7936
M204 S5000
G1 X149.818 Y123.665 E.08819
G1 X149.818 Y132.335 E.2664
G1 X146.948 Y132.335 E.08819
G1 X146.948 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.948 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.382 Y130.872 Z4.2 F42000
G1 X145.623 Y132.998 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7936
M204 S6000
G1 X145.313 Y132.998 E.0103
G1 X145.313 Y123.002 E.33158
G1 X151.733 Y123.002 E.21296
G1 X151.733 Y132.998 E.33158
G1 X145.683 Y132.998 E.20067
M204 S250
G1 X145.623 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7936
M204 S5000
G1 X151.143 Y133.39 E.16961
G1 X151.143 Y134.61 E.03749
G1 X145.623 Y134.61 E.16961
G1 X145.623 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X147.623 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.236 Y125.923 Z4.2 F42000
G1 X145.623 Y122.61 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F7936
M204 S5000
G1 X145.623 Y121.39 E.03749
G1 X151.143 Y121.39 E.16961
G1 X151.143 Y122.61 E.03749
G1 X145.683 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.623 Y121.39 E-.46416
G1 X146.402 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.399 Y128.409 Z4.2 F42000
G1 X152.125 Y134.794 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F7936
M204 S5000
G1 X152.092 Y134.907 E.00361
G1 X151.997 Y134.979 E.00364
G3 X151.94 Y134.99 I-.067 J-.193 E.00181
G1 X145.047 Y134.978 E.21181
G3 X144.921 Y134.793 I.067 J-.181 E.00735
G1 X144.931 Y121.14 E.41952
G3 X145.109 Y121.01 I.182 J.064 E.00718
G1 X151.979 Y121.016 E.21111
G3 X152.125 Y121.199 I-.047 J.187 E.0077
G1 X152.125 Y134.734 E.4159
; WIPE_START
G1 F9547.055
M204 S6000
G1 X152.092 Y134.907 E-.06687
G1 X151.997 Y134.979 E-.04501
G1 X151.94 Y134.99 E-.02228
G1 X150.293 Y134.987 E-.62585
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
G1 X151.634 Y134.794 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.632446
G1 F6106.606
M204 S6000
G1 X151.634 Y133.194 E.07684
; WIPE_START
G1 X151.634 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.972 Y132.387 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.344034
G1 F7936
M204 S6000
G1 X150.972 Y123.613 E.2153
; WIPE_START
G1 F11955.634
G1 X150.972 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.634 Y122.806 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.632186
G1 F6109.301
M204 S6000
G1 X151.634 Y121.206 E.07681
M204 S10000
G1 X145.272 Y121.206 F42000
; LINE_WIDTH: 0.35346
G1 F7936
M204 S6000
G1 X145.272 Y122.806 E.04048
M204 S10000
G1 X145.272 Y133.194 F42000
G1 F7936
M204 S6000
G1 X145.272 Y134.794 E.04049
; OBJECT_ID: 405
; WIPE_START
G1 F11592.709
G1 X145.272 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.645 Y132.903 Z4.2 F42000
G1 X129.448 Y132.591 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7936
M204 S6000
G1 X129.448 Y123.409 E.30458
G1 X130.156 Y123.409 E.02349
G1 X130.156 Y132.591 E.30458
G1 X129.508 Y132.591 E.0215
; WIPE_START
G1 F8843.478
G1 X129.495 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.326 Y124.197 Z4.2 F42000
G1 X124.98 Y123.665 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F7936
M204 S6000
G1 X124.98 Y132.591 E.29609
G1 X124.55 Y132.591 E.01424
G1 X124.55 Y123.409 E.30458
G1 X124.98 Y123.409 E.01424
G1 X124.98 Y123.605 E.0065
M204 S10000
G1 X125.779 Y123.273 F42000
G1 F7936
M204 S6000
G1 X129.041 Y123.273 E.10821
G1 X129.041 Y132.727 E.31361
G1 X125.387 Y132.727 E.12121
G1 X125.387 Y123.273 E.31361
G1 X125.719 Y123.273 E.01102
M204 S250
G1 X125.779 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7936
M204 S5000
G1 X128.649 Y123.665 E.08819
G1 X128.649 Y132.335 E.2664
G1 X125.779 Y132.335 E.08819
G1 X125.779 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.778 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.213 Y130.872 Z4.2 F42000
G1 X124.454 Y132.998 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7936
M204 S6000
G1 X124.143 Y132.998 E.0103
G1 X124.143 Y123.002 E.33158
G1 X130.563 Y123.002 E.21296
G1 X130.563 Y132.998 E.33158
G1 X124.514 Y132.998 E.20067
M204 S250
G1 X124.454 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7936
M204 S5000
G1 X129.974 Y133.39 E.16961
G1 X129.974 Y134.61 E.03749
G1 X124.454 Y134.61 E.16961
G1 X124.454 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.454 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.066 Y125.923 Z4.2 F42000
G1 X124.454 Y122.61 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F7936
M204 S5000
G1 X124.454 Y121.39 E.03749
G1 X129.974 Y121.39 E.16961
G1 X129.974 Y122.61 E.03749
G1 X124.514 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y121.39 E-.46416
G1 X125.232 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.229 Y128.409 Z4.2 F42000
G1 X130.955 Y134.794 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F7936
M204 S5000
G1 X130.922 Y134.907 E.00361
G1 X130.828 Y134.979 E.00364
G3 X130.77 Y134.99 I-.067 J-.193 E.00181
G1 X123.877 Y134.978 E.21181
G3 X123.751 Y134.793 I.067 J-.181 E.00735
G1 X123.761 Y121.14 E.41952
G3 X123.939 Y121.01 I.182 J.064 E.00718
G1 X130.81 Y121.016 E.21111
G3 X130.955 Y121.199 I-.047 J.187 E.0077
G1 X130.955 Y134.734 E.4159
M204 S10000
G1 X130.464 Y134.794 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.632446
G1 F6106.606
M204 S6000
G1 X130.464 Y133.194 E.07684
; WIPE_START
G1 X130.464 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.802 Y132.387 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.344034
G1 F7936
M204 S6000
G1 X129.802 Y123.613 E.2153
; WIPE_START
G1 F11955.634
G1 X129.802 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.464 Y122.806 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.632186
G1 F6109.301
M204 S6000
G1 X130.464 Y121.206 E.07681
M204 S10000
G1 X124.102 Y121.206 F42000
; LINE_WIDTH: 0.35346
G1 F7936
M204 S6000
G1 X124.102 Y122.806 E.04048
M204 S10000
G1 X124.102 Y133.194 F42000
G1 F7936
M204 S6000
G1 X124.102 Y134.794 E.04049
; OBJECT_ID: 394
; WIPE_START
G1 F11592.709
G1 X124.102 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X116.475 Y132.903 Z4.2 F42000
G1 X108.278 Y132.591 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7936
M204 S6000
G1 X108.278 Y123.409 E.30458
G1 X108.986 Y123.409 E.02349
G1 X108.986 Y132.591 E.30458
G1 X108.338 Y132.591 E.0215
; WIPE_START
G1 F8843.478
G1 X108.325 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P48 R11
G1 X104.157 Y124.197 Z4.2 F42000
G1 X103.81 Y123.665 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F7936
M204 S6000
G1 X103.81 Y132.591 E.29609
G1 X103.38 Y132.591 E.01424
G1 X103.38 Y123.409 E.30458
G1 X103.81 Y123.409 E.01424
G1 X103.81 Y123.605 E.0065
M204 S10000
G1 X104.609 Y123.273 F42000
G1 F7936
M204 S6000
G1 X107.871 Y123.273 E.10821
G1 X107.871 Y132.727 E.31361
G1 X104.217 Y132.727 E.12121
G1 X104.217 Y123.273 E.31361
G1 X104.549 Y123.273 E.01102
M204 S250
G1 X104.609 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7936
M204 S5000
G1 X107.479 Y123.665 E.08819
G1 X107.479 Y132.335 E.2664
G1 X104.609 Y132.335 E.08819
G1 X104.609 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X106.609 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.043 Y130.872 Z4.2 F42000
G1 X103.284 Y132.998 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7936
M204 S6000
G1 X102.973 Y132.998 E.0103
G1 X102.973 Y123.002 E.33158
G1 X109.393 Y123.002 E.21296
G1 X109.393 Y132.998 E.33158
G1 X103.344 Y132.998 E.20067
M204 S250
G1 X103.284 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7936
M204 S5000
G1 X108.804 Y133.39 E.16961
G1 X108.804 Y134.61 E.03749
G1 X103.284 Y134.61 E.16961
G1 X103.284 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.284 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.896 Y125.923 Z4.2 F42000
G1 X103.284 Y122.61 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F7936
M204 S5000
G1 X103.284 Y121.39 E.03749
G1 X108.804 Y121.39 E.16961
G1 X108.804 Y122.61 E.03749
G1 X103.344 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X103.284 Y121.39 E-.46416
G1 X104.062 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.06 Y128.409 Z4.2 F42000
G1 X109.786 Y134.794 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F7936
M204 S5000
G1 X109.752 Y134.907 E.00361
G1 X109.658 Y134.979 E.00364
G3 X109.6 Y134.99 I-.067 J-.193 E.00181
G1 X102.707 Y134.978 E.21181
G3 X102.581 Y134.793 I.067 J-.181 E.00735
G1 X102.592 Y121.14 E.41952
G3 X102.769 Y121.01 I.182 J.064 E.00718
G1 X109.64 Y121.016 E.21111
G3 X109.785 Y121.199 I-.047 J.187 E.0077
G1 X109.786 Y134.734 E.4159
M204 S10000
G1 X109.295 Y134.794 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.632446
G1 F6106.606
M204 S6000
G1 X109.295 Y133.194 E.07684
; WIPE_START
G1 X109.295 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.632 Y132.387 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.344034
G1 F7936
M204 S6000
G1 X108.632 Y123.613 E.2153
; WIPE_START
G1 F11955.634
G1 X108.632 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.295 Y122.806 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.632186
G1 F6109.301
M204 S6000
G1 X109.295 Y121.206 E.07681
M204 S10000
G1 X102.933 Y121.206 F42000
; LINE_WIDTH: 0.35346
G1 F7936
M204 S6000
G1 X102.933 Y122.806 E.04048
M204 S10000
G1 X102.933 Y133.194 F42000
G1 F7936
M204 S6000
G1 X102.933 Y134.794 E.04049
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11592.709
G1 X102.933 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 20/72
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z4.2 I.015 J1.217 P1  F42000
G1 X150.618 Y132.591 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7947
M204 S6000
G1 X150.618 Y123.409 E.30458
G1 X151.343 Y123.409 E.02405
G1 X151.343 Y132.591 E.30458
G1 X150.678 Y132.591 E.02207
; WIPE_START
G1 F8843.478
G1 X150.665 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.496 Y124.197 Z4.4 F42000
G1 X146.149 Y123.665 Z4.4
G1 Z4
G1 E.8 F1800
G1 F7947
M204 S6000
G1 X146.149 Y132.591 E.29609
G1 X145.737 Y132.591 E.01368
G1 X145.737 Y123.409 E.30458
G1 X146.149 Y123.409 E.01368
G1 X146.149 Y123.605 E.0065
M204 S10000
G1 X146.948 Y123.273 F42000
G1 F7947
M204 S6000
G1 X150.211 Y123.273 E.10821
G1 X150.211 Y132.727 E.31361
G1 X146.556 Y132.727 E.12121
G1 X146.556 Y123.273 E.31361
G1 X146.888 Y123.273 E.01102
M204 S250
G1 X146.948 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7947
M204 S5000
G1 X149.818 Y123.665 E.08819
G1 X149.818 Y132.335 E.2664
G1 X146.948 Y132.335 E.08819
G1 X146.948 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.948 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.382 Y130.872 Z4.4 F42000
G1 X145.623 Y132.998 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7947
M204 S6000
G1 X145.33 Y132.998 E.00974
G1 X145.33 Y123.002 E.33158
G1 X151.75 Y123.002 E.21296
G1 X151.75 Y132.998 E.33158
G1 X145.683 Y132.998 E.20124
M204 S250
G1 X145.623 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7947
M204 S5000
G1 X151.143 Y133.39 E.16961
G1 X151.143 Y134.61 E.03749
G1 X145.623 Y134.61 E.16961
G1 X145.623 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X147.623 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.236 Y125.923 Z4.4 F42000
G1 X145.623 Y122.61 Z4.4
G1 Z4
G1 E.8 F1800
G1 F7947
M204 S5000
G1 X145.623 Y121.39 E.03749
G1 X151.143 Y121.39 E.16961
G1 X151.143 Y122.61 E.03749
G1 X145.683 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.623 Y121.39 E-.46416
G1 X146.402 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.407 Y128.406 Z4.4 F42000
G1 X152.142 Y134.794 Z4.4
G1 Z4
G1 E.8 F1800
G1 F7947
M204 S5000
G1 X152.109 Y134.907 E.00362
G1 X152.014 Y134.979 E.00364
G3 X151.957 Y134.99 I-.067 J-.194 E.00181
G1 X145.063 Y134.978 E.21181
G3 X144.938 Y134.793 I.067 J-.181 E.00735
G1 X144.948 Y121.139 E.41952
G3 X145.126 Y121.01 I.183 J.064 E.00718
G1 X151.996 Y121.017 E.21111
G3 X152.142 Y121.199 I-.047 J.187 E.0077
G1 X152.142 Y134.734 E.4159
; WIPE_START
G1 F9547.055
M204 S6000
G1 X152.109 Y134.907 E-.06688
G1 X152.014 Y134.979 E-.04502
G1 X151.957 Y134.99 E-.02225
G1 X150.31 Y134.987 E-.62585
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
G1 X151.643 Y134.794 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.649496
G1 F5934.956
M204 S6000
G1 X151.643 Y133.194 E.07906
; WIPE_START
G1 X151.643 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.98 Y132.387 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.361084
G1 F7947
M204 S6000
G1 X150.98 Y123.613 E.22749
; WIPE_START
G1 F11314.939
G1 X150.98 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.643 Y122.806 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.649236
G1 F5937.501
M204 S6000
G1 X151.643 Y121.206 E.07903
M204 S10000
G1 X145.281 Y121.206 F42000
; LINE_WIDTH: 0.33657
G1 F7947
M204 S6000
G1 X145.281 Y122.806 E.03828
M204 S10000
G1 X145.281 Y133.194 F42000
G1 F7947
M204 S6000
G1 X145.281 Y134.794 E.03828
; OBJECT_ID: 405
; WIPE_START
G1 F12259.492
G1 X145.281 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.654 Y132.903 Z4.4 F42000
G1 X129.448 Y132.591 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7947
M204 S6000
G1 X129.448 Y123.409 E.30458
G1 X130.173 Y123.409 E.02405
G1 X130.173 Y132.591 E.30458
G1 X129.508 Y132.591 E.02207
; WIPE_START
G1 F8843.478
G1 X129.495 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.326 Y124.197 Z4.4 F42000
G1 X124.98 Y123.665 Z4.4
G1 Z4
G1 E.8 F1800
G1 F7947
M204 S6000
G1 X124.98 Y132.591 E.29609
G1 X124.567 Y132.591 E.01368
G1 X124.567 Y123.409 E.30458
G1 X124.98 Y123.409 E.01368
G1 X124.98 Y123.605 E.0065
M204 S10000
G1 X125.779 Y123.273 F42000
G1 F7947
M204 S6000
G1 X129.041 Y123.273 E.10821
G1 X129.041 Y132.727 E.31361
G1 X125.387 Y132.727 E.12121
G1 X125.387 Y123.273 E.31361
G1 X125.719 Y123.273 E.01102
M204 S250
G1 X125.779 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7947
M204 S5000
G1 X128.649 Y123.665 E.08819
G1 X128.649 Y132.335 E.2664
G1 X125.779 Y132.335 E.08819
G1 X125.779 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.778 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.213 Y130.872 Z4.4 F42000
G1 X124.454 Y132.998 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7947
M204 S6000
G1 X124.16 Y132.998 E.00974
G1 X124.16 Y123.002 E.33158
G1 X130.58 Y123.002 E.21296
G1 X130.58 Y132.998 E.33158
G1 X124.514 Y132.998 E.20124
M204 S250
G1 X124.454 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7947
M204 S5000
G1 X129.974 Y133.39 E.16961
G1 X129.974 Y134.61 E.03749
G1 X124.454 Y134.61 E.16961
G1 X124.454 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.454 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.066 Y125.923 Z4.4 F42000
G1 X124.454 Y122.61 Z4.4
G1 Z4
G1 E.8 F1800
G1 F7947
M204 S5000
G1 X124.454 Y121.39 E.03749
G1 X129.974 Y121.39 E.16961
G1 X129.974 Y122.61 E.03749
G1 X124.514 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y121.39 E-.46416
G1 X125.232 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.237 Y128.406 Z4.4 F42000
G1 X130.972 Y134.794 Z4.4
G1 Z4
G1 E.8 F1800
G1 F7947
M204 S5000
G1 X130.939 Y134.907 E.00362
G1 X130.845 Y134.979 E.00364
G3 X130.787 Y134.99 I-.067 J-.194 E.00181
G1 X123.894 Y134.978 E.21181
G3 X123.768 Y134.793 I.067 J-.181 E.00735
G1 X123.778 Y121.139 E.41952
G3 X123.956 Y121.01 I.183 J.064 E.00718
G1 X130.827 Y121.017 E.21111
G3 X130.972 Y121.199 I-.047 J.187 E.0077
G1 X130.972 Y134.734 E.4159
M204 S10000
G1 X130.473 Y134.794 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.649496
G1 F5934.956
M204 S6000
G1 X130.473 Y133.194 E.07906
; WIPE_START
G1 X130.473 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.81 Y132.387 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.361084
G1 F7947
M204 S6000
G1 X129.81 Y123.613 E.22749
; WIPE_START
G1 F11314.939
G1 X129.81 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.473 Y122.806 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.649236
G1 F5937.501
M204 S6000
G1 X130.473 Y121.206 E.07903
M204 S10000
G1 X124.111 Y121.206 F42000
; LINE_WIDTH: 0.33657
G1 F7947
M204 S6000
G1 X124.111 Y122.806 E.03828
M204 S10000
G1 X124.111 Y133.194 F42000
G1 F7947
M204 S6000
G1 X124.111 Y134.794 E.03828
; OBJECT_ID: 394
; WIPE_START
G1 F12259.492
G1 X124.111 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X116.484 Y132.903 Z4.4 F42000
G1 X108.278 Y132.591 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P49 R11
G1 F7947
M204 S6000
G1 X108.278 Y123.409 E.30458
G1 X109.003 Y123.409 E.02405
G1 X109.003 Y132.591 E.30458
G1 X108.338 Y132.591 E.02207
; WIPE_START
G1 F8843.478
G1 X108.325 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.157 Y124.197 Z4.4 F42000
G1 X103.81 Y123.665 Z4.4
G1 Z4
G1 E.8 F1800
G1 F7947
M204 S6000
G1 X103.81 Y132.591 E.29609
G1 X103.397 Y132.591 E.01368
G1 X103.397 Y123.409 E.30458
G1 X103.81 Y123.409 E.01368
G1 X103.81 Y123.605 E.0065
M204 S10000
G1 X104.609 Y123.273 F42000
G1 F7947
M204 S6000
G1 X107.871 Y123.273 E.10821
G1 X107.871 Y132.727 E.31361
G1 X104.217 Y132.727 E.12121
G1 X104.217 Y123.273 E.31361
G1 X104.549 Y123.273 E.01102
M204 S250
G1 X104.609 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7947
M204 S5000
G1 X107.479 Y123.665 E.08819
G1 X107.479 Y132.335 E.2664
G1 X104.609 Y132.335 E.08819
G1 X104.609 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X106.609 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.043 Y130.872 Z4.4 F42000
G1 X103.284 Y132.998 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7947
M204 S6000
G1 X102.99 Y132.998 E.00974
G1 X102.99 Y123.002 E.33158
G1 X109.41 Y123.002 E.21296
G1 X109.41 Y132.998 E.33158
G1 X103.344 Y132.998 E.20124
M204 S250
G1 X103.284 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7947
M204 S5000
G1 X108.804 Y133.39 E.16961
G1 X108.804 Y134.61 E.03749
G1 X103.284 Y134.61 E.16961
G1 X103.284 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.284 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.896 Y125.923 Z4.4 F42000
G1 X103.284 Y122.61 Z4.4
G1 Z4
G1 E.8 F1800
G1 F7947
M204 S5000
G1 X103.284 Y121.39 E.03749
G1 X108.804 Y121.39 E.16961
G1 X108.804 Y122.61 E.03749
G1 X103.344 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X103.284 Y121.39 E-.46416
G1 X104.062 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.067 Y128.406 Z4.4 F42000
G1 X109.803 Y134.794 Z4.4
G1 Z4
G1 E.8 F1800
G1 F7947
M204 S5000
G1 X109.769 Y134.907 E.00362
G1 X109.675 Y134.979 E.00364
G3 X109.617 Y134.99 I-.067 J-.194 E.00181
G1 X102.724 Y134.978 E.21181
G3 X102.598 Y134.793 I.067 J-.181 E.00735
G1 X102.609 Y121.139 E.41952
G3 X102.786 Y121.01 I.183 J.064 E.00718
G1 X109.657 Y121.017 E.21111
G3 X109.802 Y121.199 I-.047 J.187 E.0077
G1 X109.803 Y134.734 E.4159
M204 S10000
G1 X109.303 Y134.794 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.649496
G1 F5934.956
M204 S6000
G1 X109.303 Y133.194 E.07906
; WIPE_START
G1 X109.303 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.641 Y132.387 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.361084
G1 F7947
M204 S6000
G1 X108.641 Y123.613 E.22749
; WIPE_START
G1 F11314.939
G1 X108.641 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.303 Y122.806 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.649236
G1 F5937.501
M204 S6000
G1 X109.303 Y121.206 E.07903
M204 S10000
G1 X102.941 Y121.206 F42000
; LINE_WIDTH: 0.33657
G1 F7947
M204 S6000
G1 X102.941 Y122.806 E.03828
M204 S10000
G1 X102.941 Y133.194 F42000
G1 F7947
M204 S6000
G1 X102.941 Y134.794 E.03828
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F12259.492
G1 X102.941 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 21/72
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z4.4 I.015 J1.217 P1  F42000
G1 X150.618 Y132.591 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7957
M204 S6000
G1 X150.618 Y123.409 E.30458
G1 X151.36 Y123.409 E.02462
G1 X151.36 Y132.591 E.30458
G1 X150.678 Y132.591 E.02264
; WIPE_START
G1 F8843.478
G1 X150.665 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.496 Y124.197 Z4.6 F42000
G1 X146.149 Y123.665 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F7957
M204 S6000
G1 X146.149 Y132.591 E.29609
G1 X145.754 Y132.591 E.01312
G1 X145.754 Y123.409 E.30458
G1 X146.149 Y123.409 E.01312
G1 X146.149 Y123.605 E.0065
M204 S10000
G1 X146.948 Y123.273 F42000
G1 F7957
M204 S6000
G1 X150.211 Y123.273 E.10821
G1 X150.211 Y132.727 E.31361
G1 X146.556 Y132.727 E.12121
G1 X146.556 Y123.273 E.31361
G1 X146.888 Y123.273 E.01102
M204 S250
G1 X146.948 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7957
M204 S5000
G1 X149.818 Y123.665 E.08819
G1 X149.818 Y132.335 E.2664
G1 X146.948 Y132.335 E.08819
G1 X146.948 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.948 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.382 Y130.872 Z4.6 F42000
G1 X145.623 Y132.998 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7957
M204 S6000
G1 X145.347 Y132.998 E.00918
G1 X145.347 Y123.002 E.33158
G1 X151.767 Y123.002 E.21297
G1 X151.767 Y132.998 E.33158
G1 X145.683 Y132.998 E.2018
M204 S250
G1 X145.623 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7957
M204 S5000
G1 X151.143 Y133.39 E.16961
G1 X151.143 Y134.61 E.03749
G1 X145.623 Y134.61 E.16961
G1 X145.623 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X147.623 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.236 Y125.923 Z4.6 F42000
G1 X145.623 Y122.61 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F7957
M204 S5000
G1 X145.623 Y121.39 E.03749
G1 X151.143 Y121.39 E.16961
G1 X151.143 Y122.61 E.03749
G1 X145.683 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.623 Y121.39 E-.46416
G1 X146.402 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.414 Y128.403 Z4.6 F42000
G1 X152.159 Y134.794 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F7957
M204 S5000
G1 X152.125 Y134.908 E.00365
G1 X152.032 Y134.979 E.0036
G3 X151.974 Y134.99 I-.067 J-.194 E.00182
G1 X145.08 Y134.978 E.21182
G3 X144.955 Y134.793 I.067 J-.181 E.00735
G1 X144.965 Y121.14 E.41952
G3 X145.143 Y121.01 I.182 J.064 E.00718
G1 X152.002 Y121.014 E.21077
G3 X152.159 Y121.199 I-.036 J.19 E.00806
G1 X152.159 Y134.734 E.4159
; WIPE_START
G1 F9547.055
M204 S6000
G1 X152.125 Y134.908 E-.06724
G1 X152.032 Y134.979 E-.04454
G1 X151.974 Y134.99 E-.02238
G1 X150.327 Y134.987 E-.62584
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
G1 X151.651 Y134.794 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.666548
G1 F5772.674
M204 S6000
G1 X151.651 Y133.194 E.08128
; WIPE_START
G1 X151.651 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.989 Y132.387 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.378144
G1 F7957
M204 S6000
G1 X150.989 Y123.613 E.23969
; WIPE_START
G1 F10739.094
G1 X150.989 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.651 Y122.806 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.666288
G1 F5775.082
M204 S6000
G1 X151.651 Y121.206 E.08126
M204 S10000
G1 X145.289 Y121.206 F42000
; LINE_WIDTH: 0.31968
G1 F7957
M204 S6000
G1 X145.289 Y122.806 E.03608
M204 S10000
G1 X145.289 Y133.194 F42000
G1 F7957
M204 S6000
G1 X145.289 Y134.794 E.03608
; OBJECT_ID: 405
; WIPE_START
G1 F13007.66
G1 X145.289 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.662 Y132.904 Z4.6 F42000
G1 X129.448 Y132.591 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7957
M204 S6000
G1 X129.448 Y123.409 E.30458
G1 X130.19 Y123.409 E.02462
G1 X130.19 Y132.591 E.30458
G1 X129.508 Y132.591 E.02264
; WIPE_START
G1 F8843.478
G1 X129.495 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.326 Y124.197 Z4.6 F42000
G1 X124.98 Y123.665 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F7957
M204 S6000
G1 X124.98 Y132.591 E.29609
G1 X124.584 Y132.591 E.01312
G1 X124.584 Y123.409 E.30458
G1 X124.98 Y123.409 E.01312
G1 X124.98 Y123.605 E.0065
M204 S10000
G1 X125.779 Y123.273 F42000
G1 F7957
M204 S6000
G1 X129.041 Y123.273 E.10821
G1 X129.041 Y132.727 E.31361
G1 X125.387 Y132.727 E.12121
G1 X125.387 Y123.273 E.31361
G1 X125.719 Y123.273 E.01102
M204 S250
G1 X125.779 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7957
M204 S5000
G1 X128.649 Y123.665 E.08819
G1 X128.649 Y132.335 E.2664
G1 X125.779 Y132.335 E.08819
G1 X125.779 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.778 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.213 Y130.872 Z4.6 F42000
G1 X124.454 Y132.998 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7957
M204 S6000
G1 X124.177 Y132.998 E.00918
G1 X124.177 Y123.002 E.33158
G1 X130.597 Y123.002 E.21297
G1 X130.597 Y132.998 E.33158
G1 X124.514 Y132.998 E.2018
M204 S250
G1 X124.454 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7957
M204 S5000
G1 X129.974 Y133.39 E.16961
G1 X129.974 Y134.61 E.03749
G1 X124.454 Y134.61 E.16961
G1 X124.454 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.454 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.066 Y125.923 Z4.6 F42000
G1 X124.454 Y122.61 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F7957
M204 S5000
G1 X124.454 Y121.39 E.03749
G1 X129.974 Y121.39 E.16961
G1 X129.974 Y122.61 E.03749
G1 X124.514 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y121.39 E-.46416
G1 X125.232 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.244 Y128.403 Z4.6 F42000
G1 X130.989 Y134.794 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F7957
M204 S5000
G1 X130.955 Y134.908 E.00365
G1 X130.862 Y134.979 E.0036
M73 P49 R10
G3 X130.804 Y134.99 I-.067 J-.194 E.00182
G1 X123.911 Y134.978 E.21182
G3 X123.785 Y134.793 I.067 J-.181 E.00735
G1 X123.795 Y121.14 E.41952
G3 X123.973 Y121.01 I.182 J.064 E.00718
G1 X130.832 Y121.014 E.21077
G3 X130.989 Y121.199 I-.036 J.19 E.00806
G1 X130.989 Y134.734 E.4159
M204 S10000
G1 X130.482 Y134.794 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.666548
G1 F5772.674
M204 S6000
G1 X130.482 Y133.194 E.08128
; WIPE_START
G1 X130.482 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.819 Y132.387 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.378144
G1 F7957
M204 S6000
G1 X129.819 Y123.613 E.23969
; WIPE_START
G1 F10739.094
G1 X129.819 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.481 Y122.806 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.666288
G1 F5775.082
M204 S6000
G1 X130.481 Y121.206 E.08126
M204 S10000
G1 X124.119 Y121.206 F42000
; LINE_WIDTH: 0.31968
G1 F7957
M204 S6000
G1 X124.119 Y122.806 E.03608
M204 S10000
G1 X124.119 Y133.194 F42000
G1 F7957
M204 S6000
G1 X124.119 Y134.794 E.03608
; OBJECT_ID: 394
; WIPE_START
G1 F13007.66
G1 X124.119 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
M73 P50 R10
G1 X116.492 Y132.904 Z4.6 F42000
G1 X108.278 Y132.591 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7957
M204 S6000
G1 X108.278 Y123.409 E.30458
G1 X109.02 Y123.409 E.02462
G1 X109.02 Y132.591 E.30458
G1 X108.338 Y132.591 E.02264
; WIPE_START
G1 F8843.478
G1 X108.325 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.157 Y124.197 Z4.6 F42000
G1 X103.81 Y123.665 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F7957
M204 S6000
G1 X103.81 Y132.591 E.29609
G1 X103.414 Y132.591 E.01312
G1 X103.414 Y123.409 E.30458
G1 X103.81 Y123.409 E.01312
G1 X103.81 Y123.605 E.0065
M204 S10000
G1 X104.609 Y123.273 F42000
G1 F7957
M204 S6000
G1 X107.871 Y123.273 E.10821
G1 X107.871 Y132.727 E.31361
G1 X104.217 Y132.727 E.12121
G1 X104.217 Y123.273 E.31361
G1 X104.549 Y123.273 E.01102
M204 S250
G1 X104.609 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7957
M204 S5000
G1 X107.479 Y123.665 E.08819
G1 X107.479 Y132.335 E.2664
G1 X104.609 Y132.335 E.08819
G1 X104.609 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X106.609 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.043 Y130.872 Z4.6 F42000
G1 X103.284 Y132.998 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7957
M204 S6000
G1 X103.007 Y132.998 E.00918
G1 X103.007 Y123.002 E.33158
G1 X109.427 Y123.002 E.21297
G1 X109.428 Y132.998 E.33158
G1 X103.344 Y132.998 E.2018
M204 S250
G1 X103.284 Y133.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7957
M204 S5000
G1 X108.804 Y133.39 E.16961
G1 X108.804 Y134.61 E.03749
G1 X103.284 Y134.61 E.16961
G1 X103.284 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.284 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.896 Y125.923 Z4.6 F42000
G1 X103.284 Y122.61 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F7957
M204 S5000
G1 X103.284 Y121.39 E.03749
G1 X108.804 Y121.39 E.16961
G1 X108.804 Y122.61 E.03749
G1 X103.344 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X103.284 Y121.39 E-.46416
G1 X104.062 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.075 Y128.403 Z4.6 F42000
G1 X109.82 Y134.794 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F7957
M204 S5000
G1 X109.785 Y134.908 E.00365
G1 X109.692 Y134.979 E.0036
G3 X109.634 Y134.99 I-.067 J-.194 E.00182
G1 X102.741 Y134.978 E.21182
G3 X102.615 Y134.793 I.067 J-.181 E.00735
G1 X102.625 Y121.14 E.41952
G3 X102.803 Y121.01 I.182 J.064 E.00718
G1 X109.662 Y121.014 E.21077
G3 X109.819 Y121.199 I-.036 J.19 E.00806
G1 X109.82 Y134.734 E.4159
M204 S10000
G1 X109.312 Y134.794 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.666548
G1 F5772.674
M204 S6000
G1 X109.312 Y133.194 E.08128
; WIPE_START
G1 X109.312 Y134.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.649 Y132.387 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.378144
G1 F7957
M204 S6000
G1 X108.649 Y123.613 E.23969
; WIPE_START
G1 F10739.094
G1 X108.649 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.312 Y122.806 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.666288
G1 F5775.082
M204 S6000
G1 X109.312 Y121.206 E.08126
M204 S10000
G1 X102.95 Y121.206 F42000
; LINE_WIDTH: 0.31968
G1 F7957
M204 S6000
G1 X102.95 Y122.806 E.03608
M204 S10000
G1 X102.95 Y133.194 F42000
G1 F7957
M204 S6000
G1 X102.95 Y134.794 E.03608
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F13007.66
G1 X102.95 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 22/72
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z4.6 I-.006 J1.217 P1  F42000
G1 X145.623 Y133.39 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8187
M204 S5000
G1 X151.143 Y133.39 E.16961
G1 X151.143 Y134.61 E.03749
G1 X145.623 Y134.61 E.16961
G1 X145.623 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X147.623 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.618 Y132.591 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8187
M204 S6000
G1 X150.618 Y123.409 E.30458
G1 X151.377 Y123.409 E.02519
G1 X151.377 Y132.591 E.30458
G1 X150.678 Y132.591 E.0232
; WIPE_START
G1 F8843.478
G1 X150.665 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.496 Y124.197 Z4.8 F42000
G1 X146.149 Y123.665 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F8187
M204 S6000
G1 X146.149 Y132.591 E.29609
G1 X145.771 Y132.591 E.01256
G1 X145.771 Y123.409 E.30458
G1 X146.149 Y123.409 E.01256
G1 X146.149 Y123.605 E.0065
M204 S10000
G1 X146.948 Y123.273 F42000
G1 F8187
M204 S6000
G1 X150.211 Y123.273 E.10821
G1 X150.211 Y132.727 E.31361
G1 X146.556 Y132.727 E.12121
G1 X146.556 Y123.273 E.31361
G1 X146.888 Y123.273 E.01102
M204 S250
G1 X146.948 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8187
M204 S5000
G1 X149.818 Y123.665 E.08819
G1 X149.818 Y132.335 E.2664
G1 X146.948 Y132.335 E.08819
G1 X146.948 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.948 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.868 Y131.07 Z4.8 F42000
G1 X151.784 Y134.598 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8187
M204 S6000
G1 X151.536 Y134.598 E.00825
G1 X151.536 Y132.998 E.05306
G1 X145.364 Y132.998 E.20473
G1 X145.364 Y123.002 E.33158
G1 X151.536 Y123.002 E.20473
G1 X151.536 Y121.402 E.05307
G1 X151.784 Y121.402 E.00824
G1 X151.784 Y134.538 E.43572
; WIPE_START
G1 F8843.478
G1 X151.536 Y134.598 E-.09718
G1 X151.536 Y132.998 E-.60785
G1 X151.391 Y132.998 E-.05497
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.686 Y126.325 Z4.8 F42000
G1 X145.623 Y122.61 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8187
M204 S5000
G1 X145.623 Y121.39 E.03749
G1 X151.143 Y121.39 E.16961
G1 X151.143 Y122.61 E.03749
G1 X145.683 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.623 Y121.39 E-.46416
G1 X146.402 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.416 Y128.402 Z4.8 F42000
G1 X152.175 Y134.821 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F8187
M204 S5000
G3 X151.991 Y134.99 I-.194 J-.027 E.0083
G1 X145.097 Y134.978 E.21182
G3 X144.972 Y134.793 I.067 J-.181 E.00735
G1 X144.982 Y121.139 E.41952
G3 X145.159 Y121.01 I.183 J.064 E.00717
G1 X152.019 Y121.014 E.21078
G3 X152.176 Y121.199 I-.036 J.189 E.00806
G1 X152.175 Y134.761 E.41673
; WIPE_START
G1 F9547.055
M204 S6000
G1 X152.155 Y134.885 E-.04777
G1 X152.11 Y134.943 E-.02762
G1 X151.991 Y134.99 E-.04874
G1 X150.318 Y134.987 E-.63587
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
G1 X150.997 Y132.387 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.395194
G1 F8187
M204 S6000
G1 X150.997 Y123.613 E.25188
; WIPE_START
G1 F10219.322
G1 X150.997 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.297 Y122.806 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.30279
G1 F8187
M204 S6000
G1 X145.297 Y121.206 E.03387
M204 S10000
G1 X145.297 Y133.194 F42000
G1 F8187
M204 S6000
G1 X145.297 Y134.794 E.03388
; OBJECT_ID: 405
; WIPE_START
G1 F13853.08
G1 X145.297 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.665 Y133.266 Z4.8 F42000
G1 X124.454 Y133.39 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8187
M204 S5000
G1 X129.974 Y133.39 E.16961
G1 X129.974 Y134.61 E.03749
G1 X124.454 Y134.61 E.16961
G1 X124.454 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.454 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.448 Y132.591 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8187
M204 S6000
G1 X129.448 Y123.409 E.30458
G1 X130.207 Y123.409 E.02519
G1 X130.207 Y132.591 E.30458
G1 X129.508 Y132.591 E.0232
; WIPE_START
G1 F8843.478
G1 X129.495 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.326 Y124.197 Z4.8 F42000
G1 X124.98 Y123.665 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F8187
M204 S6000
G1 X124.98 Y132.591 E.29609
G1 X124.601 Y132.591 E.01256
G1 X124.601 Y123.409 E.30458
G1 X124.98 Y123.409 E.01256
G1 X124.98 Y123.605 E.0065
M204 S10000
G1 X125.779 Y123.273 F42000
G1 F8187
M204 S6000
G1 X129.041 Y123.273 E.10821
G1 X129.041 Y132.727 E.31361
G1 X125.387 Y132.727 E.12121
G1 X125.387 Y123.273 E.31361
G1 X125.719 Y123.273 E.01102
M204 S250
G1 X125.779 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8187
M204 S5000
G1 X128.649 Y123.665 E.08819
G1 X128.649 Y132.335 E.2664
G1 X125.779 Y132.335 E.08819
G1 X125.779 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.778 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.698 Y131.07 Z4.8 F42000
G1 X130.614 Y134.598 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8187
M204 S6000
G1 X130.366 Y134.598 E.00825
G1 X130.366 Y132.998 E.05306
G1 X124.194 Y132.998 E.20473
G1 X124.194 Y123.002 E.33158
G1 X130.366 Y123.002 E.20473
G1 X130.366 Y121.402 E.05307
G1 X130.614 Y121.402 E.00824
G1 X130.614 Y134.538 E.43572
; WIPE_START
G1 F8843.478
G1 X130.366 Y134.598 E-.09718
G1 X130.366 Y132.998 E-.60785
G1 X130.221 Y132.998 E-.05497
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.516 Y126.325 Z4.8 F42000
G1 X124.454 Y122.61 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8187
M204 S5000
G1 X124.454 Y121.39 E.03749
G1 X129.974 Y121.39 E.16961
G1 X129.974 Y122.61 E.03749
G1 X124.514 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y121.39 E-.46416
G1 X125.232 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.246 Y128.402 Z4.8 F42000
G1 X131.005 Y134.821 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F8187
M204 S5000
G3 X130.821 Y134.99 I-.194 J-.027 E.0083
G1 X123.928 Y134.978 E.21182
G3 X123.802 Y134.793 I.067 J-.181 E.00735
G1 X123.812 Y121.139 E.41952
G3 X123.99 Y121.01 I.183 J.064 E.00717
G1 X130.849 Y121.014 E.21078
G3 X131.006 Y121.199 I-.036 J.189 E.00806
G1 X131.005 Y134.761 E.41673
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.985 Y134.885 E-.04777
G1 X130.941 Y134.943 E-.02762
G1 X130.821 Y134.99 E-.04874
G1 X129.148 Y134.987 E-.63587
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.828 Y132.387 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.395194
G1 F8187
M204 S6000
G1 X129.827 Y123.613 E.25188
; WIPE_START
G1 F10219.322
G1 X129.827 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.128 Y122.806 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.30279
G1 F8187
M204 S6000
G1 X124.128 Y121.206 E.03387
M204 S10000
M73 P51 R10
G1 X124.128 Y133.194 F42000
G1 F8187
M204 S6000
G1 X124.128 Y134.794 E.03388
; OBJECT_ID: 394
; WIPE_START
G1 F13853.08
G1 X124.128 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X116.496 Y133.266 Z4.8 F42000
G1 X103.284 Y133.39 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8187
M204 S5000
G1 X108.804 Y133.39 E.16961
G1 X108.804 Y134.61 E.03749
G1 X103.284 Y134.61 E.16961
G1 X103.284 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.284 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.278 Y132.591 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8187
M204 S6000
G1 X108.278 Y123.409 E.30458
G1 X109.037 Y123.409 E.02519
G1 X109.038 Y132.591 E.30458
G1 X108.338 Y132.591 E.0232
; WIPE_START
G1 F8843.478
G1 X108.325 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.157 Y124.197 Z4.8 F42000
G1 X103.81 Y123.665 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F8187
M204 S6000
G1 X103.81 Y132.591 E.29609
G1 X103.431 Y132.591 E.01256
G1 X103.431 Y123.409 E.30458
G1 X103.81 Y123.409 E.01256
G1 X103.81 Y123.605 E.0065
M204 S10000
G1 X104.609 Y123.273 F42000
G1 F8187
M204 S6000
G1 X107.871 Y123.273 E.10821
G1 X107.871 Y132.727 E.31361
G1 X104.217 Y132.727 E.12121
G1 X104.217 Y123.273 E.31361
G1 X104.549 Y123.273 E.01102
M204 S250
G1 X104.609 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8187
M204 S5000
G1 X107.479 Y123.665 E.08819
G1 X107.479 Y132.335 E.2664
G1 X104.609 Y132.335 E.08819
G1 X104.609 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X106.609 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.528 Y131.07 Z4.8 F42000
G1 X109.445 Y134.598 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8187
M204 S6000
G1 X109.196 Y134.598 E.00825
G1 X109.196 Y132.998 E.05306
G1 X103.024 Y132.998 E.20473
G1 X103.024 Y123.002 E.33158
G1 X109.196 Y123.002 E.20473
G1 X109.196 Y121.402 E.05307
G1 X109.444 Y121.402 E.00824
G1 X109.445 Y134.538 E.43572
; WIPE_START
G1 F8843.478
G1 X109.196 Y134.598 E-.09718
G1 X109.196 Y132.998 E-.60785
G1 X109.051 Y132.998 E-.05497
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.347 Y126.325 Z4.8 F42000
G1 X103.284 Y122.61 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8187
M204 S5000
G1 X103.284 Y121.39 E.03749
G1 X108.804 Y121.39 E.16961
G1 X108.804 Y122.61 E.03749
G1 X103.344 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X103.284 Y121.39 E-.46416
G1 X104.062 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.076 Y128.402 Z4.8 F42000
G1 X109.835 Y134.821 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F8187
M204 S5000
G3 X109.651 Y134.99 I-.194 J-.027 E.0083
G1 X102.758 Y134.978 E.21182
G3 X102.632 Y134.793 I.067 J-.181 E.00735
G1 X102.642 Y121.139 E.41952
G3 X102.82 Y121.01 I.183 J.064 E.00717
G1 X109.68 Y121.014 E.21078
G3 X109.836 Y121.199 I-.036 J.189 E.00806
G1 X109.835 Y134.761 E.41673
; WIPE_START
G1 F9547.055
M204 S6000
G1 X109.815 Y134.885 E-.04777
G1 X109.771 Y134.943 E-.02762
G1 X109.651 Y134.99 E-.04874
G1 X107.978 Y134.987 E-.63587
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.658 Y132.387 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.395194
G1 F8187
M204 S6000
G1 X108.658 Y123.613 E.25188
; WIPE_START
G1 F10219.322
G1 X108.658 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.958 Y122.806 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.30279
G1 F8187
M204 S6000
G1 X102.958 Y121.206 E.03387
M204 S10000
G1 X102.958 Y133.194 F42000
G1 F8187
M204 S6000
G1 X102.958 Y134.794 E.03388
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F13853.08
G1 X102.958 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 23/72
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z4.8 I-.006 J1.217 P1  F42000
G1 X145.623 Y133.39 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8188
M204 S5000
G1 X151.143 Y133.39 E.16961
G1 X151.143 Y134.61 E.03749
G1 X145.623 Y134.61 E.16961
G1 X145.623 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X147.623 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.618 Y132.591 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8188
M204 S6000
G1 X150.618 Y123.409 E.30458
G1 X151.394 Y123.409 E.02575
G1 X151.394 Y132.591 E.30458
G1 X150.678 Y132.591 E.02377
; WIPE_START
G1 F8843.478
G1 X150.665 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.496 Y124.197 Z5 F42000
G1 X146.149 Y123.665 Z5
G1 Z4.6
G1 E.8 F1800
G1 F8188
M204 S6000
G1 X146.149 Y132.591 E.29609
G1 X145.788 Y132.591 E.012
G1 X145.788 Y123.409 E.30458
G1 X146.149 Y123.409 E.012
G1 X146.149 Y123.605 E.0065
M204 S10000
G1 X146.948 Y123.273 F42000
G1 F8188
M204 S6000
G1 X150.211 Y123.273 E.10821
G1 X150.211 Y132.727 E.31361
G1 X146.556 Y132.727 E.12121
G1 X146.556 Y123.273 E.31361
G1 X146.888 Y123.273 E.01102
M204 S250
G1 X146.948 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8188
M204 S5000
G1 X149.818 Y123.665 E.08819
G1 X149.818 Y132.335 E.2664
G1 X146.948 Y132.335 E.08819
G1 X146.948 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.948 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.878 Y131.068 Z5 F42000
G1 X151.801 Y134.598 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8188
M204 S6000
G1 X151.536 Y134.598 E.00881
G1 X151.536 Y132.998 E.05306
G1 X145.38 Y132.998 E.20417
G1 X145.38 Y123.002 E.33158
G1 X151.536 Y123.002 E.20417
G1 X151.536 Y121.402 E.05307
G1 X151.801 Y121.402 E.0088
G1 X151.801 Y134.538 E.43572
; WIPE_START
G1 F8843.478
G1 X151.536 Y134.598 E-.10349
G1 X151.536 Y132.998 E-.60785
G1 X151.407 Y132.998 E-.04866
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.694 Y126.329 Z5 F42000
G1 X145.623 Y122.61 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8188
M204 S5000
G1 X145.623 Y121.39 E.03749
G1 X151.143 Y121.39 E.16961
G1 X151.143 Y122.61 E.03749
G1 X145.683 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.623 Y121.39 E-.46416
G1 X146.402 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.429 Y128.396 Z5 F42000
G1 X152.193 Y134.794 Z5
G1 Z4.6
G1 E.8 F1800
G1 F8188
M204 S5000
G1 X152.16 Y134.907 E.00361
G1 X152.066 Y134.979 E.00364
G3 X152.008 Y134.99 I-.067 J-.193 E.00181
G1 X145.114 Y134.978 E.21183
G3 X144.988 Y134.793 I.067 J-.181 E.00735
G1 X144.999 Y121.139 E.41952
G3 X145.176 Y121.01 I.182 J.064 E.00718
G1 X152.036 Y121.014 E.21079
G3 X152.193 Y121.199 I-.036 J.189 E.00805
G1 X152.193 Y134.734 E.4159
; WIPE_START
G1 F9547.055
M204 S6000
G1 X152.16 Y134.907 E-.06684
G1 X152.066 Y134.979 E-.04499
G1 X152.008 Y134.99 E-.02235
G1 X150.361 Y134.987 E-.62583
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
G1 X151.006 Y132.387 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.412244
G1 F8188
M204 S6000
G1 X151.006 Y123.613 E.26408
; WIPE_START
G1 F9747.539
G1 X151.006 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.306 Y122.806 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.28589
G1 F8188
M204 S6000
G1 X145.306 Y121.206 E.03167
M204 S10000
G1 X145.306 Y133.194 F42000
G1 F8188
M204 S6000
G1 X145.306 Y134.794 E.03168
; OBJECT_ID: 405
; WIPE_START
G1 F14816.644
G1 X145.306 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.674 Y133.266 Z5 F42000
G1 X124.454 Y133.39 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8188
M204 S5000
G1 X129.974 Y133.39 E.16961
G1 X129.974 Y134.61 E.03749
G1 X124.454 Y134.61 E.16961
G1 X124.454 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.454 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.448 Y132.591 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8188
M204 S6000
G1 X129.448 Y123.409 E.30458
G1 X130.224 Y123.409 E.02575
G1 X130.224 Y132.591 E.30458
G1 X129.508 Y132.591 E.02377
; WIPE_START
G1 F8843.478
G1 X129.495 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.326 Y124.197 Z5 F42000
G1 X124.98 Y123.665 Z5
G1 Z4.6
G1 E.8 F1800
G1 F8188
M204 S6000
G1 X124.98 Y132.591 E.29609
G1 X124.618 Y132.591 E.012
G1 X124.618 Y123.409 E.30458
G1 X124.98 Y123.409 E.012
G1 X124.98 Y123.605 E.0065
M204 S10000
G1 X125.779 Y123.273 F42000
G1 F8188
M204 S6000
G1 X129.041 Y123.273 E.10821
G1 X129.041 Y132.727 E.31361
G1 X125.387 Y132.727 E.12121
G1 X125.387 Y123.273 E.31361
G1 X125.719 Y123.273 E.01102
M204 S250
G1 X125.779 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8188
M204 S5000
G1 X128.649 Y123.665 E.08819
G1 X128.649 Y132.335 E.2664
G1 X125.779 Y132.335 E.08819
G1 X125.779 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.778 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.709 Y131.068 Z5 F42000
G1 X130.631 Y134.598 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8188
M204 S6000
G1 X130.366 Y134.598 E.00881
G1 X130.366 Y132.998 E.05306
G1 X124.211 Y132.998 E.20417
G1 X124.211 Y123.002 E.33158
G1 X130.366 Y123.002 E.20417
G1 X130.366 Y121.402 E.05307
G1 X130.631 Y121.402 E.0088
G1 X130.631 Y134.538 E.43572
; WIPE_START
G1 F8843.478
G1 X130.366 Y134.598 E-.10349
G1 X130.366 Y132.998 E-.60785
G1 X130.238 Y132.998 E-.04866
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.525 Y126.329 Z5 F42000
G1 X124.454 Y122.61 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8188
M204 S5000
G1 X124.454 Y121.39 E.03749
G1 X129.974 Y121.39 E.16961
G1 X129.974 Y122.61 E.03749
G1 X124.514 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y121.39 E-.46416
G1 X125.232 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.259 Y128.396 Z5 F42000
G1 X131.024 Y134.794 Z5
G1 Z4.6
G1 E.8 F1800
G1 F8188
M204 S5000
G1 X130.99 Y134.907 E.00361
G1 X130.896 Y134.979 E.00364
G3 X130.838 Y134.99 I-.067 J-.193 E.00181
G1 X123.944 Y134.978 E.21183
G3 X123.819 Y134.793 I.067 J-.181 E.00735
G1 X123.829 Y121.139 E.41952
G3 X124.007 Y121.01 I.182 J.064 E.00718
G1 X130.867 Y121.014 E.21079
G3 X131.023 Y121.199 I-.036 J.189 E.00805
G1 X131.024 Y134.734 E.4159
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.99 Y134.907 E-.06684
G1 X130.896 Y134.979 E-.04499
G1 X130.838 Y134.99 E-.02235
G1 X129.191 Y134.987 E-.62583
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.836 Y132.387 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.412244
G1 F8188
M204 S6000
M73 P52 R10
G1 X129.836 Y123.613 E.26408
; WIPE_START
G1 F9747.539
G1 X129.836 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.136 Y122.806 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.28589
G1 F8188
M204 S6000
G1 X124.136 Y121.206 E.03167
M204 S10000
G1 X124.136 Y133.194 F42000
G1 F8188
M204 S6000
G1 X124.136 Y134.794 E.03168
; OBJECT_ID: 394
; WIPE_START
G1 F14816.644
G1 X124.136 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X116.504 Y133.266 Z5 F42000
G1 X103.284 Y133.39 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8188
M204 S5000
G1 X108.804 Y133.39 E.16961
G1 X108.804 Y134.61 E.03749
G1 X103.284 Y134.61 E.16961
G1 X103.284 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.284 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.278 Y132.591 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8188
M204 S6000
G1 X108.278 Y123.409 E.30458
G1 X109.054 Y123.409 E.02575
G1 X109.055 Y132.591 E.30458
G1 X108.338 Y132.591 E.02377
; WIPE_START
G1 F8843.478
G1 X108.325 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.157 Y124.197 Z5 F42000
G1 X103.81 Y123.665 Z5
G1 Z4.6
G1 E.8 F1800
G1 F8188
M204 S6000
G1 X103.81 Y132.591 E.29609
G1 X103.448 Y132.591 E.012
G1 X103.448 Y123.409 E.30458
G1 X103.81 Y123.409 E.012
G1 X103.81 Y123.605 E.0065
M204 S10000
G1 X104.609 Y123.273 F42000
G1 F8188
M204 S6000
G1 X107.871 Y123.273 E.10821
G1 X107.871 Y132.727 E.31361
G1 X104.217 Y132.727 E.12121
G1 X104.217 Y123.273 E.31361
G1 X104.549 Y123.273 E.01102
M204 S250
G1 X104.609 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8188
M204 S5000
G1 X107.479 Y123.665 E.08819
G1 X107.479 Y132.335 E.2664
G1 X104.609 Y132.335 E.08819
G1 X104.609 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X106.609 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.539 Y131.068 Z5 F42000
G1 X109.462 Y134.598 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8188
M204 S6000
G1 X109.196 Y134.598 E.00881
G1 X109.196 Y132.998 E.05306
G1 X103.041 Y132.998 E.20417
G1 X103.041 Y123.002 E.33158
G1 X109.196 Y123.002 E.20417
G1 X109.196 Y121.402 E.05307
G1 X109.461 Y121.402 E.0088
G1 X109.462 Y134.538 E.43572
; WIPE_START
G1 F8843.478
G1 X109.196 Y134.598 E-.10349
G1 X109.196 Y132.998 E-.60785
G1 X109.068 Y132.998 E-.04866
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.355 Y126.329 Z5 F42000
G1 X103.284 Y122.61 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8188
M204 S5000
G1 X103.284 Y121.39 E.03749
G1 X108.804 Y121.39 E.16961
G1 X108.804 Y122.61 E.03749
G1 X103.344 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X103.284 Y121.39 E-.46416
G1 X104.062 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.09 Y128.396 Z5 F42000
G1 X109.854 Y134.794 Z5
G1 Z4.6
G1 E.8 F1800
G1 F8188
M204 S5000
G1 X109.82 Y134.907 E.00361
G1 X109.726 Y134.979 E.00364
G3 X109.668 Y134.99 I-.067 J-.193 E.00181
G1 X102.775 Y134.978 E.21183
G3 X102.649 Y134.793 I.067 J-.181 E.00735
G1 X102.659 Y121.139 E.41952
G3 X102.837 Y121.01 I.182 J.064 E.00718
G1 X109.697 Y121.014 E.21079
G3 X109.853 Y121.199 I-.036 J.189 E.00805
G1 X109.854 Y134.734 E.4159
; WIPE_START
G1 F9547.055
M204 S6000
G1 X109.82 Y134.907 E-.06684
G1 X109.726 Y134.979 E-.04499
G1 X109.668 Y134.99 E-.02235
G1 X108.021 Y134.987 E-.62583
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.666 Y132.387 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.412244
G1 F8188
M204 S6000
G1 X108.666 Y123.613 E.26408
; WIPE_START
G1 F9747.539
G1 X108.666 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.966 Y122.806 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.28589
G1 F8188
M204 S6000
G1 X102.966 Y121.206 E.03167
M204 S10000
G1 X102.966 Y133.194 F42000
G1 F8188
M204 S6000
G1 X102.966 Y134.794 E.03168
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F14816.644
G1 X102.966 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 24/72
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z5 I-.006 J1.217 P1  F42000
G1 X145.623 Y133.39 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8191
M204 S5000
G1 X151.143 Y133.39 E.16961
G1 X151.143 Y134.61 E.03749
G1 X145.623 Y134.61 E.16961
G1 X145.623 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X147.623 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.618 Y132.591 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8191
M204 S6000
G1 X150.618 Y123.409 E.30458
G1 X151.411 Y123.409 E.02632
G1 X151.411 Y132.591 E.30458
G1 X150.678 Y132.591 E.02433
; WIPE_START
G1 F8843.478
G1 X150.665 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.496 Y124.197 Z5.2 F42000
G1 X146.149 Y123.665 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F8191
M204 S6000
G1 X146.149 Y132.591 E.29609
G1 X145.804 Y132.591 E.01144
G1 X145.804 Y123.409 E.30458
G1 X146.149 Y123.409 E.01144
G1 X146.149 Y123.605 E.0065
M204 S10000
G1 X146.948 Y123.273 F42000
G1 F8191
M204 S6000
G1 X150.211 Y123.273 E.10821
G1 X150.211 Y132.727 E.31361
G1 X146.556 Y132.727 E.12121
G1 X146.556 Y123.273 E.31361
G1 X146.888 Y123.273 E.01102
M204 S250
G1 X146.948 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8191
M204 S5000
G1 X149.818 Y123.665 E.08819
G1 X149.818 Y132.335 E.2664
G1 X146.948 Y132.335 E.08819
G1 X146.948 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.948 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.889 Y131.065 Z5.2 F42000
G1 X151.818 Y134.598 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8191
M204 S6000
G1 X151.536 Y134.598 E.00938
G1 X151.536 Y132.998 E.05306
G1 X145.397 Y132.998 E.20361
G1 X145.397 Y123.002 E.33158
G1 X151.536 Y123.002 E.20361
G1 X151.536 Y121.402 E.05307
G1 X151.818 Y121.402 E.00937
G1 X151.818 Y134.538 E.43572
; WIPE_START
G1 F8843.478
G1 X151.536 Y134.598 E-.10982
G1 X151.536 Y132.998 E-.60785
G1 X151.424 Y132.998 E-.04233
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.703 Y126.334 Z5.2 F42000
G1 X145.623 Y122.61 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8191
M204 S5000
G1 X145.623 Y121.39 E.03749
G1 X151.143 Y121.39 E.16961
G1 X151.143 Y122.61 E.03749
G1 X145.683 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.623 Y121.39 E-.46416
G1 X146.402 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.431 Y128.396 Z5.2 F42000
G1 X152.209 Y134.821 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F8191
M204 S5000
G3 X152.025 Y134.99 I-.194 J-.027 E.0083
G1 X145.131 Y134.978 E.21183
G3 X145.005 Y134.793 I.067 J-.181 E.00735
G1 X145.016 Y121.139 E.41952
G3 X145.193 Y121.01 I.183 J.064 E.00718
G1 X152.054 Y121.014 E.2108
G3 X152.21 Y121.199 I-.037 J.19 E.00804
G1 X152.209 Y134.761 E.41673
; WIPE_START
G1 F9547.055
M204 S6000
G1 X152.19 Y134.883 E-.047
G1 X152.144 Y134.943 E-.02848
G1 X152.025 Y134.99 E-.04872
G1 X150.352 Y134.987 E-.6358
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
G1 X151.014 Y132.387 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.429295
G1 F8191
M204 S6000
G1 X151.014 Y123.613 E.27627
; WIPE_START
G1 F9317.393
G1 X151.014 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.314 Y122.806 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.269
G1 F8191
M204 S6000
G1 X145.314 Y121.206 E.02947
M204 S10000
G1 X145.314 Y133.194 F42000
G1 F8191
M204 S6000
G1 X145.314 Y134.794 E.02947
; OBJECT_ID: 405
; WIPE_START
G1 F15000
G1 X145.314 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.682 Y133.266 Z5.2 F42000
G1 X124.454 Y133.39 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8191
M204 S5000
G1 X129.974 Y133.39 E.16961
G1 X129.974 Y134.61 E.03749
G1 X124.454 Y134.61 E.16961
G1 X124.454 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.454 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.448 Y132.591 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8191
M204 S6000
G1 X129.448 Y123.409 E.30458
G1 X130.241 Y123.409 E.02632
G1 X130.241 Y132.591 E.30458
G1 X129.508 Y132.591 E.02433
; WIPE_START
G1 F8843.478
G1 X129.495 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.326 Y124.197 Z5.2 F42000
G1 X124.98 Y123.665 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F8191
M204 S6000
G1 X124.98 Y132.591 E.29609
G1 X124.635 Y132.591 E.01144
G1 X124.635 Y123.409 E.30458
G1 X124.98 Y123.409 E.01144
G1 X124.98 Y123.605 E.0065
M204 S10000
G1 X125.779 Y123.273 F42000
G1 F8191
M204 S6000
G1 X129.041 Y123.273 E.10821
G1 X129.041 Y132.727 E.31361
G1 X125.387 Y132.727 E.12121
G1 X125.387 Y123.273 E.31361
G1 X125.719 Y123.273 E.01102
M204 S250
G1 X125.779 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8191
M204 S5000
G1 X128.649 Y123.665 E.08819
G1 X128.649 Y132.335 E.2664
G1 X125.779 Y132.335 E.08819
G1 X125.779 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.778 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.719 Y131.065 Z5.2 F42000
G1 X130.648 Y134.598 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8191
M204 S6000
G1 X130.366 Y134.598 E.00938
G1 X130.366 Y132.998 E.05306
G1 X124.228 Y132.998 E.20361
G1 X124.228 Y123.002 E.33158
G1 X130.366 Y123.002 E.20361
G1 X130.366 Y121.402 E.05307
G1 X130.648 Y121.402 E.00937
G1 X130.648 Y134.538 E.43572
; WIPE_START
G1 F8843.478
G1 X130.366 Y134.598 E-.10982
G1 X130.366 Y132.998 E-.60785
G1 X130.254 Y132.998 E-.04233
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.533 Y126.334 Z5.2 F42000
G1 X124.454 Y122.61 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8191
M204 S5000
G1 X124.454 Y121.39 E.03749
G1 X129.974 Y121.39 E.16961
G1 X129.974 Y122.61 E.03749
G1 X124.514 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y121.39 E-.46416
G1 X125.232 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.261 Y128.396 Z5.2 F42000
G1 X131.039 Y134.821 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F8191
M204 S5000
G3 X130.855 Y134.99 I-.194 J-.027 E.0083
G1 X123.961 Y134.978 E.21183
G3 X123.836 Y134.793 I.067 J-.181 E.00735
G1 X123.846 Y121.139 E.41952
G3 X124.024 Y121.01 I.182 J.064 E.00718
G1 X130.884 Y121.014 E.2108
G3 X131.04 Y121.199 I-.037 J.19 E.00804
M73 P53 R10
G1 X131.039 Y134.761 E.41673
; WIPE_START
G1 F9547.055
M204 S6000
G1 X131.02 Y134.883 E-.047
G1 X130.975 Y134.943 E-.02848
G1 X130.855 Y134.99 E-.04872
G1 X129.182 Y134.987 E-.6358
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.845 Y132.387 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.429295
G1 F8191
M204 S6000
G1 X129.845 Y123.613 E.27627
; WIPE_START
G1 F9317.393
G1 X129.845 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.145 Y122.806 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.269
G1 F8191
M204 S6000
G1 X124.145 Y121.206 E.02947
M204 S10000
G1 X124.145 Y133.194 F42000
G1 F8191
M204 S6000
G1 X124.145 Y134.794 E.02947
; OBJECT_ID: 394
; WIPE_START
G1 F15000
G1 X124.145 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X116.512 Y133.266 Z5.2 F42000
G1 X103.284 Y133.39 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8191
M204 S5000
G1 X108.804 Y133.39 E.16961
G1 X108.804 Y134.61 E.03749
G1 X103.284 Y134.61 E.16961
G1 X103.284 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.284 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.278 Y132.591 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8191
M204 S6000
G1 X108.278 Y123.409 E.30458
G1 X109.071 Y123.409 E.02632
G1 X109.072 Y132.591 E.30458
G1 X108.338 Y132.591 E.02433
; WIPE_START
G1 F8843.478
G1 X108.325 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.157 Y124.197 Z5.2 F42000
G1 X103.81 Y123.665 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F8191
M204 S6000
G1 X103.81 Y132.591 E.29609
G1 X103.465 Y132.591 E.01144
G1 X103.465 Y123.409 E.30458
G1 X103.81 Y123.409 E.01144
G1 X103.81 Y123.605 E.0065
M204 S10000
G1 X104.609 Y123.273 F42000
G1 F8191
M204 S6000
G1 X107.871 Y123.273 E.10821
G1 X107.871 Y132.727 E.31361
G1 X104.217 Y132.727 E.12121
G1 X104.217 Y123.273 E.31361
G1 X104.549 Y123.273 E.01102
M204 S250
G1 X104.609 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8191
M204 S5000
G1 X107.479 Y123.665 E.08819
G1 X107.479 Y132.335 E.2664
G1 X104.609 Y132.335 E.08819
G1 X104.609 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X106.609 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.55 Y131.065 Z5.2 F42000
G1 X109.479 Y134.598 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8191
M204 S6000
G1 X109.196 Y134.598 E.00938
G1 X109.196 Y132.998 E.05306
G1 X103.058 Y132.998 E.20361
G1 X103.058 Y123.002 E.33158
G1 X109.196 Y123.002 E.20361
G1 X109.196 Y121.402 E.05307
G1 X109.478 Y121.402 E.00937
G1 X109.479 Y134.538 E.43572
; WIPE_START
G1 F8843.478
G1 X109.196 Y134.598 E-.10982
G1 X109.196 Y132.998 E-.60785
G1 X109.085 Y132.998 E-.04233
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.363 Y126.334 Z5.2 F42000
G1 X103.284 Y122.61 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8191
M204 S5000
G1 X103.284 Y121.39 E.03749
G1 X108.804 Y121.39 E.16961
G1 X108.804 Y122.61 E.03749
G1 X103.344 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X103.284 Y121.39 E-.46416
G1 X104.062 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.091 Y128.396 Z5.2 F42000
G1 X109.869 Y134.821 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F8191
M204 S5000
G3 X109.685 Y134.99 I-.194 J-.027 E.0083
G1 X102.792 Y134.978 E.21183
G3 X102.666 Y134.793 I.067 J-.181 E.00735
G1 X102.676 Y121.139 E.41952
G3 X102.854 Y121.01 I.182 J.064 E.00718
G1 X109.714 Y121.014 E.2108
G3 X109.871 Y121.199 I-.037 J.19 E.00804
G1 X109.869 Y134.761 E.41673
; WIPE_START
G1 F9547.055
M204 S6000
G1 X109.85 Y134.883 E-.047
G1 X109.805 Y134.943 E-.02848
G1 X109.685 Y134.99 E-.04872
G1 X108.012 Y134.987 E-.6358
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.675 Y132.387 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.429295
G1 F8191
M204 S6000
G1 X108.675 Y123.613 E.27627
; WIPE_START
G1 F9317.393
G1 X108.675 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.975 Y122.806 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.269
G1 F8191
M204 S6000
G1 X102.975 Y121.206 E.02947
M204 S10000
G1 X102.975 Y133.194 F42000
G1 F8191
M204 S6000
G1 X102.975 Y134.794 E.02947
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X102.975 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 25/72
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z5.2 I-.006 J1.217 P1  F42000
G1 X145.623 Y133.39 Z5.2
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8195
M204 S5000
G1 X151.143 Y133.39 E.16961
G1 X151.143 Y134.61 E.03749
G1 X145.623 Y134.61 E.16961
G1 X145.623 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X147.623 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.618 Y132.591 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8195
M204 S6000
G1 X150.618 Y123.409 E.30458
G1 X151.428 Y123.409 E.02688
G1 X151.428 Y132.591 E.30458
G1 X150.678 Y132.591 E.0249
; WIPE_START
G1 F8843.478
G1 X150.665 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.496 Y124.197 Z5.4 F42000
G1 X146.149 Y123.665 Z5.4
G1 Z5
G1 E.8 F1800
G1 F8195
M204 S6000
G1 X146.149 Y132.591 E.29609
G1 X145.821 Y132.591 E.01088
G1 X145.821 Y123.409 E.30458
G1 X146.149 Y123.409 E.01088
G1 X146.149 Y123.605 E.0065
M204 S10000
G1 X146.948 Y123.273 F42000
G1 F8195
M204 S6000
G1 X150.211 Y123.273 E.10821
G1 X150.211 Y132.727 E.31361
G1 X146.556 Y132.727 E.12121
G1 X146.556 Y123.273 E.31361
G1 X146.888 Y123.273 E.01102
M204 S250
G1 X146.948 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8195
M204 S5000
G1 X149.818 Y123.665 E.08819
G1 X149.818 Y132.335 E.2664
G1 X146.948 Y132.335 E.08819
G1 X146.948 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.948 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.9 Y131.062 Z5.4 F42000
G1 X151.835 Y134.598 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8195
M204 S6000
G1 X151.536 Y134.598 E.00994
G1 X151.536 Y132.998 E.05306
G1 X145.414 Y132.998 E.20305
G1 X145.414 Y123.002 E.33158
G1 X151.536 Y123.002 E.20305
G1 X151.536 Y121.402 E.05307
G1 X151.835 Y121.402 E.00993
G1 X151.835 Y134.538 E.43573
; WIPE_START
G1 F8843.478
G1 X151.536 Y134.598 E-.11617
G1 X151.536 Y132.998 E-.60785
G1 X151.441 Y132.998 E-.03598
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.712 Y126.339 Z5.4 F42000
G1 X145.623 Y122.61 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8195
M204 S5000
G1 X145.623 Y121.39 E.03749
G1 X151.143 Y121.39 E.16961
G1 X151.143 Y122.61 E.03749
G1 X145.683 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.623 Y121.39 E-.46416
G1 X146.402 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.438 Y128.393 Z5.4 F42000
G1 X152.226 Y134.821 Z5.4
G1 Z5
G1 E.8 F1800
G1 F8195
M204 S5000
G3 X152.042 Y134.99 I-.194 J-.027 E.0083
G1 X145.148 Y134.978 E.21184
G3 X145.022 Y134.792 I.067 J-.181 E.00735
G1 X145.022 Y121.207 E.41743
G1 X145.054 Y121.096 E.00355
G3 X145.21 Y121.01 I.162 J.108 E.0057
G1 X152.071 Y121.014 E.21081
G3 X152.227 Y121.199 I-.036 J.189 E.00803
G1 X152.226 Y134.761 E.41674
; WIPE_START
G1 F9547.055
M204 S6000
G1 X152.208 Y134.881 E-.04593
G1 X152.161 Y134.943 E-.02951
G1 X152.042 Y134.99 E-.04868
G1 X150.369 Y134.987 E-.63587
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
G1 X151.023 Y132.387 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.446345
G1 F8195
M204 S6000
G1 X151.023 Y123.613 E.28846
; WIPE_START
G1 F8923.605
G1 X151.023 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.323 Y122.806 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.25211
G1 F8195
M204 S6000
G1 X145.323 Y121.206 E.02727
M204 S10000
G1 X145.323 Y133.194 F42000
G1 F8195
M204 S6000
G1 X145.323 Y134.794 E.02727
; OBJECT_ID: 405
; WIPE_START
G1 F15000
G1 X145.323 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.691 Y133.266 Z5.4 F42000
G1 X124.454 Y133.39 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8195
M204 S5000
G1 X129.974 Y133.39 E.16961
G1 X129.974 Y134.61 E.03749
G1 X124.454 Y134.61 E.16961
G1 X124.454 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.454 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.448 Y132.591 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8195
M204 S6000
G1 X129.448 Y123.409 E.30458
G1 X130.258 Y123.409 E.02688
G1 X130.258 Y132.591 E.30458
G1 X129.508 Y132.591 E.0249
; WIPE_START
G1 F8843.478
G1 X129.495 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.326 Y124.197 Z5.4 F42000
G1 X124.98 Y123.665 Z5.4
G1 Z5
G1 E.8 F1800
G1 F8195
M204 S6000
G1 X124.98 Y132.591 E.29609
G1 X124.652 Y132.591 E.01088
G1 X124.652 Y123.409 E.30458
G1 X124.98 Y123.409 E.01088
G1 X124.98 Y123.605 E.0065
M204 S10000
G1 X125.779 Y123.273 F42000
G1 F8195
M204 S6000
G1 X129.041 Y123.273 E.10821
G1 X129.041 Y132.727 E.31361
G1 X125.387 Y132.727 E.12121
G1 X125.387 Y123.273 E.31361
G1 X125.719 Y123.273 E.01102
M204 S250
G1 X125.779 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8195
M204 S5000
G1 X128.649 Y123.665 E.08819
G1 X128.649 Y132.335 E.2664
G1 X125.779 Y132.335 E.08819
G1 X125.779 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.778 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.73 Y131.062 Z5.4 F42000
G1 X130.666 Y134.598 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8195
M204 S6000
G1 X130.366 Y134.598 E.00994
G1 X130.366 Y132.998 E.05306
G1 X124.245 Y132.998 E.20305
G1 X124.245 Y123.002 E.33158
G1 X130.366 Y123.002 E.20305
G1 X130.366 Y121.402 E.05307
G1 X130.665 Y121.402 E.00993
G1 X130.666 Y134.538 E.43573
; WIPE_START
G1 F8843.478
G1 X130.366 Y134.598 E-.11617
G1 X130.366 Y132.998 E-.60785
G1 X130.271 Y132.998 E-.03598
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.542 Y126.339 Z5.4 F42000
G1 X124.454 Y122.61 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8195
M204 S5000
G1 X124.454 Y121.39 E.03749
G1 X129.974 Y121.39 E.16961
G1 X129.974 Y122.61 E.03749
G1 X124.514 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y121.39 E-.46416
G1 X125.232 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P54 R10
G1 X128.269 Y128.393 Z5.4 F42000
G1 X131.056 Y134.821 Z5.4
G1 Z5
G1 E.8 F1800
G1 F8195
M204 S5000
G3 X130.872 Y134.99 I-.194 J-.027 E.0083
G1 X123.978 Y134.978 E.21184
G3 X123.852 Y134.792 I.067 J-.181 E.00735
G1 X123.852 Y121.207 E.41743
G1 X123.884 Y121.096 E.00355
G3 X124.04 Y121.01 I.162 J.108 E.0057
G1 X130.901 Y121.014 E.21081
G3 X131.057 Y121.199 I-.036 J.189 E.00803
G1 X131.056 Y134.761 E.41674
; WIPE_START
G1 F9547.055
M204 S6000
G1 X131.038 Y134.881 E-.04593
G1 X130.992 Y134.943 E-.02951
G1 X130.872 Y134.99 E-.04868
G1 X129.199 Y134.987 E-.63587
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.853 Y132.387 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.446345
G1 F8195
M204 S6000
G1 X129.853 Y123.613 E.28846
; WIPE_START
G1 F8923.605
G1 X129.853 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.153 Y122.806 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.25211
G1 F8195
M204 S6000
G1 X124.153 Y121.206 E.02727
M204 S10000
G1 X124.153 Y133.194 F42000
G1 F8195
M204 S6000
G1 X124.153 Y134.794 E.02727
; OBJECT_ID: 394
; WIPE_START
G1 F15000
G1 X124.153 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X116.521 Y133.266 Z5.4 F42000
G1 X103.284 Y133.39 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8195
M204 S5000
G1 X108.804 Y133.39 E.16961
G1 X108.804 Y134.61 E.03749
G1 X103.284 Y134.61 E.16961
G1 X103.284 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.284 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.278 Y132.591 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8195
M204 S6000
G1 X108.278 Y123.409 E.30458
G1 X109.088 Y123.409 E.02688
G1 X109.089 Y132.591 E.30458
G1 X108.338 Y132.591 E.0249
; WIPE_START
G1 F8843.478
G1 X108.325 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.157 Y124.197 Z5.4 F42000
G1 X103.81 Y123.665 Z5.4
G1 Z5
G1 E.8 F1800
G1 F8195
M204 S6000
G1 X103.81 Y132.591 E.29609
G1 X103.482 Y132.591 E.01088
G1 X103.482 Y123.409 E.30458
G1 X103.81 Y123.409 E.01088
G1 X103.81 Y123.605 E.0065
M204 S10000
G1 X104.609 Y123.273 F42000
G1 F8195
M204 S6000
G1 X107.871 Y123.273 E.10821
G1 X107.871 Y132.727 E.31361
G1 X104.217 Y132.727 E.12121
G1 X104.217 Y123.273 E.31361
G1 X104.549 Y123.273 E.01102
M204 S250
G1 X104.609 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8195
M204 S5000
G1 X107.479 Y123.665 E.08819
G1 X107.479 Y132.335 E.2664
G1 X104.609 Y132.335 E.08819
G1 X104.609 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X106.609 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.56 Y131.062 Z5.4 F42000
G1 X109.496 Y134.598 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8195
M204 S6000
G1 X109.196 Y134.598 E.00994
G1 X109.196 Y132.998 E.05306
G1 X103.075 Y132.998 E.20305
G1 X103.075 Y123.002 E.33158
G1 X109.196 Y123.002 E.20305
G1 X109.196 Y121.402 E.05307
G1 X109.496 Y121.402 E.00993
G1 X109.496 Y134.538 E.43573
; WIPE_START
G1 F8843.478
G1 X109.196 Y134.598 E-.11617
G1 X109.196 Y132.998 E-.60785
G1 X109.101 Y132.998 E-.03598
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.372 Y126.339 Z5.4 F42000
G1 X103.284 Y122.61 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8195
M204 S5000
G1 X103.284 Y121.39 E.03749
G1 X108.804 Y121.39 E.16961
G1 X108.804 Y122.61 E.03749
G1 X103.344 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X103.284 Y121.39 E-.46416
G1 X104.062 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.099 Y128.393 Z5.4 F42000
G1 X109.886 Y134.821 Z5.4
G1 Z5
G1 E.8 F1800
G1 F8195
M204 S5000
G3 X109.703 Y134.99 I-.194 J-.027 E.0083
G1 X102.808 Y134.978 E.21184
G3 X102.683 Y134.792 I.067 J-.181 E.00735
G1 X102.683 Y121.207 E.41743
G1 X102.714 Y121.096 E.00355
G3 X102.871 Y121.01 I.162 J.108 E.0057
G1 X109.731 Y121.014 E.21081
G3 X109.888 Y121.199 I-.036 J.189 E.00803
G1 X109.886 Y134.761 E.41674
; WIPE_START
G1 F9547.055
M204 S6000
G1 X109.869 Y134.881 E-.04593
G1 X109.822 Y134.943 E-.02951
G1 X109.703 Y134.99 E-.04868
G1 X108.029 Y134.987 E-.63587
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.683 Y132.387 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.446345
G1 F8195
M204 S6000
G1 X108.683 Y123.613 E.28846
; WIPE_START
G1 F8923.605
G1 X108.683 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.983 Y122.806 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.25211
G1 F8195
M204 S6000
G1 X102.983 Y121.206 E.02727
M204 S10000
G1 X102.983 Y133.194 F42000
G1 F8195
M204 S6000
G1 X102.983 Y134.794 E.02727
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X102.983 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 26/72
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z5.4 I-.006 J1.217 P1  F42000
G1 X145.623 Y133.39 Z5.4
G1 Z5.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8199
M204 S5000
G1 X151.143 Y133.39 E.16961
G1 X151.143 Y134.61 E.03749
G1 X145.623 Y134.61 E.16961
G1 X145.623 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X147.623 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.618 Y132.591 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8199
M204 S6000
G1 X150.618 Y123.409 E.30458
G1 X151.445 Y123.409 E.02745
G1 X151.445 Y132.591 E.30458
G1 X150.678 Y132.591 E.02546
; WIPE_START
G1 F8843.478
G1 X150.665 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.496 Y124.197 Z5.6 F42000
G1 X146.149 Y123.665 Z5.6
G1 Z5.2
G1 E.8 F1800
M73 P54 R9
G1 F8199
M204 S6000
G1 X146.149 Y132.591 E.29609
G1 X145.838 Y132.591 E.01032
G1 X145.838 Y123.409 E.30458
G1 X146.149 Y123.409 E.01032
G1 X146.149 Y123.605 E.0065
M204 S10000
G1 X146.948 Y123.273 F42000
G1 F8199
M204 S6000
G1 X150.211 Y123.273 E.10821
G1 X150.211 Y132.727 E.31361
G1 X146.556 Y132.727 E.12121
G1 X146.556 Y123.273 E.31361
G1 X146.888 Y123.273 E.01102
M204 S250
G1 X146.948 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8199
M204 S5000
G1 X149.818 Y123.665 E.08819
G1 X149.818 Y132.335 E.2664
G1 X146.948 Y132.335 E.08819
G1 X146.948 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.948 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.911 Y131.059 Z5.6 F42000
G1 X151.852 Y134.598 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8199
M204 S6000
G1 X151.536 Y134.598 E.01051
G1 X151.536 Y132.998 E.05306
G1 X145.431 Y132.998 E.20249
G1 X145.431 Y123.002 E.33158
G1 X151.536 Y123.002 E.20249
G1 X151.536 Y121.402 E.05307
G1 X151.852 Y121.402 E.0105
G1 X151.852 Y134.538 E.43573
; WIPE_START
G1 F8843.478
G1 X151.536 Y134.598 E-.12253
G1 X151.536 Y132.998 E-.60785
G1 X151.458 Y132.998 E-.02962
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.72 Y126.343 Z5.6 F42000
G1 X145.623 Y122.61 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8199
M204 S5000
G1 X145.623 Y121.39 E.03749
G1 X151.143 Y121.39 E.16961
G1 X151.143 Y122.61 E.03749
G1 X145.683 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.623 Y121.39 E-.46416
G1 X146.402 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.446 Y128.389 Z5.6 F42000
G1 X152.243 Y134.821 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F8199
M204 S5000
G3 X152.059 Y134.99 I-.194 J-.027 E.0083
G1 X145.165 Y134.978 E.21184
G3 X145.039 Y134.793 I.067 J-.181 E.00735
G1 X145.049 Y121.139 E.41952
G3 X145.227 Y121.01 I.182 J.064 E.00718
G1 X152.088 Y121.014 E.21082
G3 X152.244 Y121.199 I-.037 J.189 E.00804
G1 X152.243 Y134.761 E.41674
; WIPE_START
G1 F9547.055
M204 S6000
G1 X152.225 Y134.881 E-.04582
G1 X152.178 Y134.943 E-.02963
G1 X152.059 Y134.99 E-.04868
G1 X150.386 Y134.987 E-.63587
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
G1 X151.031 Y132.387 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463405
G1 F8199
M204 S6000
G1 X151.031 Y123.613 E.30066
; WIPE_START
G1 F8561.551
G1 X151.031 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.331 Y122.806 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.23521
G1 F8199
M204 S6000
G1 X145.331 Y121.206 E.02506
M204 S10000
G1 X145.331 Y133.194 F42000
G1 F8199
M204 S6000
G1 X145.331 Y134.794 E.02507
; OBJECT_ID: 405
; WIPE_START
G1 F15000
G1 X145.331 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.699 Y133.266 Z5.6 F42000
G1 X124.454 Y133.39 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8199
M204 S5000
G1 X129.974 Y133.39 E.16961
G1 X129.974 Y134.61 E.03749
G1 X124.454 Y134.61 E.16961
G1 X124.454 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.454 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.448 Y132.591 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8199
M204 S6000
G1 X129.448 Y123.409 E.30458
G1 X130.275 Y123.409 E.02745
G1 X130.275 Y132.591 E.30458
G1 X129.508 Y132.591 E.02546
; WIPE_START
G1 F8843.478
G1 X129.495 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.326 Y124.197 Z5.6 F42000
G1 X124.98 Y123.665 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F8199
M204 S6000
G1 X124.98 Y132.591 E.29609
G1 X124.668 Y132.591 E.01032
G1 X124.668 Y123.409 E.30458
G1 X124.98 Y123.409 E.01032
G1 X124.98 Y123.605 E.0065
M204 S10000
G1 X125.779 Y123.273 F42000
G1 F8199
M204 S6000
G1 X129.041 Y123.273 E.10821
G1 X129.041 Y132.727 E.31361
G1 X125.387 Y132.727 E.12121
G1 X125.387 Y123.273 E.31361
G1 X125.719 Y123.273 E.01102
M204 S250
G1 X125.779 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8199
M204 S5000
G1 X128.649 Y123.665 E.08819
G1 X128.649 Y132.335 E.2664
G1 X125.779 Y132.335 E.08819
G1 X125.779 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.778 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.741 Y131.059 Z5.6 F42000
G1 X130.683 Y134.598 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8199
M204 S6000
G1 X130.366 Y134.598 E.01051
G1 X130.366 Y132.998 E.05306
G1 X124.261 Y132.998 E.20249
G1 X124.261 Y123.002 E.33158
G1 X130.366 Y123.002 E.20249
G1 X130.366 Y121.402 E.05307
G1 X130.682 Y121.402 E.0105
G1 X130.683 Y134.538 E.43573
; WIPE_START
G1 F8843.478
G1 X130.366 Y134.598 E-.12253
G1 X130.366 Y132.998 E-.60785
G1 X130.288 Y132.998 E-.02962
; WIPE_END
M73 P55 R9
G1 E-.04 F1800
M204 S10000
G1 X126.55 Y126.343 Z5.6 F42000
G1 X124.454 Y122.61 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8199
M204 S5000
G1 X124.454 Y121.39 E.03749
G1 X129.974 Y121.39 E.16961
G1 X129.974 Y122.61 E.03749
G1 X124.514 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y121.39 E-.46416
G1 X125.232 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.276 Y128.389 Z5.6 F42000
G1 X131.073 Y134.821 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F8199
M204 S5000
G3 X130.889 Y134.99 I-.194 J-.027 E.0083
G1 X123.995 Y134.978 E.21184
G3 X123.869 Y134.793 I.067 J-.181 E.00735
G1 X123.88 Y121.139 E.41952
G3 X124.057 Y121.01 I.182 J.064 E.00718
G1 X130.918 Y121.014 E.21082
G3 X131.074 Y121.199 I-.037 J.189 E.00804
G1 X131.073 Y134.761 E.41674
; WIPE_START
G1 F9547.055
M204 S6000
G1 X131.056 Y134.881 E-.04582
G1 X131.009 Y134.943 E-.02963
G1 X130.889 Y134.99 E-.04868
G1 X129.216 Y134.987 E-.63587
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.862 Y132.387 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463405
G1 F8199
M204 S6000
G1 X129.862 Y123.613 E.30066
; WIPE_START
G1 F8561.551
G1 X129.862 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.162 Y122.806 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.23521
G1 F8199
M204 S6000
G1 X124.162 Y121.206 E.02506
M204 S10000
G1 X124.162 Y133.194 F42000
G1 F8199
M204 S6000
G1 X124.162 Y134.794 E.02507
; OBJECT_ID: 394
; WIPE_START
G1 F15000
G1 X124.162 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X116.529 Y133.266 Z5.6 F42000
G1 X103.284 Y133.39 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8199
M204 S5000
G1 X108.804 Y133.39 E.16961
G1 X108.804 Y134.61 E.03749
G1 X103.284 Y134.61 E.16961
G1 X103.284 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.284 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.278 Y132.591 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8199
M204 S6000
G1 X108.278 Y123.409 E.30458
G1 X109.106 Y123.409 E.02745
G1 X109.106 Y132.591 E.30458
G1 X108.338 Y132.591 E.02546
; WIPE_START
G1 F8843.478
G1 X108.325 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.157 Y124.197 Z5.6 F42000
G1 X103.81 Y123.665 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F8199
M204 S6000
G1 X103.81 Y132.591 E.29609
G1 X103.499 Y132.591 E.01032
G1 X103.499 Y123.409 E.30458
G1 X103.81 Y123.409 E.01032
G1 X103.81 Y123.605 E.0065
M204 S10000
G1 X104.609 Y123.273 F42000
G1 F8199
M204 S6000
G1 X107.871 Y123.273 E.10821
G1 X107.871 Y132.727 E.31361
G1 X104.217 Y132.727 E.12121
G1 X104.217 Y123.273 E.31361
G1 X104.549 Y123.273 E.01102
M204 S250
G1 X104.609 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8199
M204 S5000
G1 X107.479 Y123.665 E.08819
G1 X107.479 Y132.335 E.2664
G1 X104.609 Y132.335 E.08819
G1 X104.609 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X106.609 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.571 Y131.059 Z5.6 F42000
G1 X109.513 Y134.598 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8199
M204 S6000
G1 X109.196 Y134.598 E.01051
G1 X109.196 Y132.998 E.05306
G1 X103.092 Y132.998 E.20249
G1 X103.092 Y123.002 E.33158
G1 X109.196 Y123.002 E.20249
G1 X109.196 Y121.402 E.05307
G1 X109.513 Y121.402 E.0105
G1 X109.513 Y134.538 E.43573
; WIPE_START
G1 F8843.478
G1 X109.196 Y134.598 E-.12253
G1 X109.196 Y132.998 E-.60785
G1 X109.118 Y132.998 E-.02962
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.381 Y126.343 Z5.6 F42000
G1 X103.284 Y122.61 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8199
M204 S5000
G1 X103.284 Y121.39 E.03749
G1 X108.804 Y121.39 E.16961
G1 X108.804 Y122.61 E.03749
G1 X103.344 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X103.284 Y121.39 E-.46416
G1 X104.062 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.106 Y128.389 Z5.6 F42000
G1 X109.903 Y134.821 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F8199
M204 S5000
G3 X109.72 Y134.99 I-.194 J-.027 E.0083
G1 X102.825 Y134.978 E.21184
G3 X102.7 Y134.793 I.067 J-.181 E.00735
G1 X102.71 Y121.139 E.41952
G3 X102.888 Y121.01 I.182 J.064 E.00718
G1 X109.748 Y121.014 E.21082
G3 X109.905 Y121.199 I-.037 J.189 E.00804
G1 X109.903 Y134.761 E.41674
; WIPE_START
G1 F9547.055
M204 S6000
G1 X109.886 Y134.881 E-.04582
G1 X109.839 Y134.943 E-.02963
G1 X109.72 Y134.99 E-.04868
G1 X108.046 Y134.987 E-.63587
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.692 Y132.387 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463405
G1 F8199
M204 S6000
G1 X108.692 Y123.613 E.30066
; WIPE_START
G1 F8561.551
G1 X108.692 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.992 Y122.806 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.23521
G1 F8199
M204 S6000
G1 X102.992 Y121.206 E.02506
M204 S10000
G1 X102.992 Y133.194 F42000
G1 F8199
M204 S6000
G1 X102.992 Y134.794 E.02507
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X102.992 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 27/72
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z5.6 I-.006 J1.217 P1  F42000
G1 X145.623 Y133.39 Z5.6
G1 Z5.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8205
M204 S5000
G1 X151.143 Y133.39 E.16961
G1 X151.143 Y134.61 E.03749
G1 X145.623 Y134.61 E.16961
G1 X145.623 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X147.623 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.618 Y132.591 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8205
M204 S6000
G1 X150.618 Y123.409 E.30458
G1 X151.464 Y123.409 E.02809
G1 X151.465 Y132.591 E.30458
G1 X150.678 Y132.591 E.02611
; WIPE_START
G1 F8843.478
G1 X150.665 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.496 Y124.197 Z5.8 F42000
G1 X146.149 Y123.665 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F8205
M204 S6000
G1 X146.149 Y132.591 E.29609
G1 X145.855 Y132.591 E.00976
G1 X145.855 Y123.409 E.30458
G1 X146.149 Y123.409 E.00976
G1 X146.149 Y123.605 E.0065
M204 S10000
G1 X146.948 Y123.273 F42000
G1 F8205
M204 S6000
G1 X150.211 Y123.273 E.10821
G1 X150.211 Y132.727 E.31361
G1 X146.556 Y132.727 E.12121
G1 X146.556 Y123.273 E.31361
G1 X146.888 Y123.273 E.01102
M204 S250
G1 X146.948 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8205
M204 S5000
G1 X149.818 Y123.665 E.08819
G1 X149.818 Y132.335 E.2664
G1 X146.948 Y132.335 E.08819
G1 X146.948 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.948 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.923 Y131.056 Z5.8 F42000
G1 X151.872 Y134.598 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8205
M204 S6000
G1 X151.536 Y134.598 E.01115
G1 X151.536 Y132.998 E.05306
G1 X145.448 Y132.998 E.20193
G1 X145.448 Y123.002 E.33158
G1 X151.536 Y123.002 E.20193
G1 X151.536 Y121.402 E.05306
G1 X151.872 Y121.402 E.01115
G1 X151.872 Y134.538 E.43571
; WIPE_START
G1 F8843.478
G1 X151.536 Y134.598 E-.1298
G1 X151.536 Y132.998 E-.60786
G1 X151.477 Y132.998 E-.02235
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.73 Y126.348 Z5.8 F42000
G1 X145.623 Y122.61 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8205
M204 S5000
G1 X145.623 Y121.39 E.03749
G1 X151.143 Y121.39 E.16961
G1 X151.143 Y122.61 E.03749
G1 X145.683 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.623 Y121.39 E-.46416
G1 X146.402 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.454 Y128.386 Z5.8 F42000
G1 X152.262 Y134.821 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F8205
M204 S5000
G3 X152.077 Y134.99 I-.195 J-.028 E.00835
G1 X145.182 Y134.978 E.21186
G3 X145.056 Y134.793 I.067 J-.181 E.00735
G1 X145.066 Y121.14 E.41952
G3 X145.244 Y121.01 I.183 J.064 E.00718
G1 X152.074 Y121.01 E.20987
G3 X152.264 Y121.199 I-.01 J.199 E.00902
G1 X152.262 Y134.761 E.41671
; WIPE_START
G1 F9547.055
M204 S6000
G1 X152.245 Y134.88 E-.04581
G1 X152.198 Y134.943 E-.02973
G1 X152.077 Y134.99 E-.04928
G1 X150.405 Y134.987 E-.63518
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
G1 X151.041 Y132.387 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.482855
G1 F8183.036
M204 S6000
G1 X151.041 Y123.613 E.31456
; WIPE_START
G1 X151.041 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.34 Y122.806 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.21832
G1 F8205
M204 S6000
G1 X145.34 Y121.206 E.02286
M204 S10000
G1 X145.34 Y133.194 F42000
G1 F8205
M204 S6000
G1 X145.34 Y134.794 E.02287
; OBJECT_ID: 405
; WIPE_START
G1 F15000
G1 X145.34 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.708 Y133.266 Z5.8 F42000
G1 X124.454 Y133.39 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8205
M204 S5000
G1 X129.974 Y133.39 E.16961
G1 X129.974 Y134.61 E.03749
G1 X124.454 Y134.61 E.16961
G1 X124.454 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.454 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.448 Y132.591 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8205
M204 S6000
G1 X129.448 Y123.409 E.30458
G1 X130.295 Y123.409 E.02809
G1 X130.295 Y132.591 E.30458
G1 X129.508 Y132.591 E.02611
; WIPE_START
G1 F8843.478
G1 X129.495 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.326 Y124.197 Z5.8 F42000
G1 X124.98 Y123.665 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F8205
M204 S6000
G1 X124.98 Y132.591 E.29609
G1 X124.685 Y132.591 E.00976
G1 X124.685 Y123.409 E.30458
G1 X124.98 Y123.409 E.00976
G1 X124.98 Y123.605 E.0065
M204 S10000
G1 X125.779 Y123.273 F42000
G1 F8205
M204 S6000
G1 X129.041 Y123.273 E.10821
G1 X129.041 Y132.727 E.31361
G1 X125.387 Y132.727 E.12121
G1 X125.387 Y123.273 E.31361
G1 X125.719 Y123.273 E.01102
M204 S250
G1 X125.779 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8205
M204 S5000
G1 X128.649 Y123.665 E.08819
G1 X128.649 Y132.335 E.2664
G1 X125.779 Y132.335 E.08819
G1 X125.779 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.778 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.753 Y131.056 Z5.8 F42000
G1 X130.702 Y134.598 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8205
M204 S6000
G1 X130.366 Y134.598 E.01115
G1 X130.366 Y132.998 E.05306
G1 X124.278 Y132.998 E.20193
G1 X124.278 Y123.002 E.33158
G1 X130.366 Y123.002 E.20193
M73 P56 R9
G1 X130.366 Y121.402 E.05306
G1 X130.702 Y121.402 E.01115
G1 X130.702 Y134.538 E.43571
; WIPE_START
G1 F8843.478
G1 X130.366 Y134.598 E-.1298
G1 X130.366 Y132.998 E-.60786
G1 X130.307 Y132.998 E-.02235
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.56 Y126.348 Z5.8 F42000
G1 X124.454 Y122.61 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8205
M204 S5000
G1 X124.454 Y121.39 E.03749
G1 X129.974 Y121.39 E.16961
G1 X129.974 Y122.61 E.03749
G1 X124.514 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y121.39 E-.46416
G1 X125.232 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.285 Y128.386 Z5.8 F42000
G1 X131.093 Y134.821 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F8205
M204 S5000
G3 X130.907 Y134.99 I-.195 J-.028 E.00835
G1 X124.012 Y134.978 E.21186
G3 X123.886 Y134.793 I.067 J-.181 E.00735
G1 X123.897 Y121.14 E.41952
G3 X124.074 Y121.01 I.183 J.064 E.00718
G1 X130.904 Y121.01 E.20987
G3 X131.094 Y121.199 I-.01 J.199 E.00902
G1 X131.093 Y134.761 E.41671
; WIPE_START
G1 F9547.055
M204 S6000
G1 X131.075 Y134.88 E-.04581
G1 X131.028 Y134.943 E-.02973
G1 X130.907 Y134.99 E-.04928
G1 X129.235 Y134.987 E-.63518
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.871 Y132.387 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.482855
G1 F8183.036
M204 S6000
G1 X129.871 Y123.613 E.31456
; WIPE_START
G1 X129.871 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.17 Y122.806 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.21832
G1 F8205
M204 S6000
G1 X124.17 Y121.206 E.02286
M204 S10000
G1 X124.17 Y133.194 F42000
G1 F8205
M204 S6000
G1 X124.17 Y134.794 E.02287
; OBJECT_ID: 394
; WIPE_START
G1 F15000
G1 X124.17 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X116.538 Y133.266 Z5.8 F42000
G1 X103.284 Y133.39 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8205
M204 S5000
G1 X108.804 Y133.39 E.16961
G1 X108.804 Y134.61 E.03749
G1 X103.284 Y134.61 E.16961
G1 X103.284 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.284 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.278 Y132.591 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8205
M204 S6000
G1 X108.278 Y123.409 E.30458
G1 X109.125 Y123.409 E.02809
G1 X109.125 Y132.591 E.30458
G1 X108.338 Y132.591 E.02611
; WIPE_START
G1 F8843.478
G1 X108.325 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.157 Y124.197 Z5.8 F42000
G1 X103.81 Y123.665 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F8205
M204 S6000
G1 X103.81 Y132.591 E.29609
G1 X103.516 Y132.591 E.00976
G1 X103.516 Y123.409 E.30458
G1 X103.81 Y123.409 E.00976
G1 X103.81 Y123.605 E.0065
M204 S10000
G1 X104.609 Y123.273 F42000
G1 F8205
M204 S6000
G1 X107.871 Y123.273 E.10821
G1 X107.871 Y132.727 E.31361
G1 X104.217 Y132.727 E.12121
G1 X104.217 Y123.273 E.31361
G1 X104.549 Y123.273 E.01102
M204 S250
G1 X104.609 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8205
M204 S5000
G1 X107.479 Y123.665 E.08819
G1 X107.479 Y132.335 E.2664
G1 X104.609 Y132.335 E.08819
G1 X104.609 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X106.609 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.583 Y131.056 Z5.8 F42000
G1 X109.532 Y134.598 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8205
M204 S6000
G1 X109.196 Y134.598 E.01115
G1 X109.196 Y132.998 E.05306
G1 X103.109 Y132.998 E.20193
G1 X103.109 Y123.002 E.33158
G1 X109.196 Y123.002 E.20193
G1 X109.196 Y121.402 E.05306
G1 X109.532 Y121.402 E.01115
G1 X109.532 Y134.538 E.43571
; WIPE_START
G1 F8843.478
G1 X109.196 Y134.598 E-.1298
G1 X109.196 Y132.998 E-.60786
G1 X109.137 Y132.998 E-.02235
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.39 Y126.348 Z5.8 F42000
G1 X103.284 Y122.61 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8205
M204 S5000
G1 X103.284 Y121.39 E.03749
G1 X108.804 Y121.39 E.16961
G1 X108.804 Y122.61 E.03749
G1 X103.344 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X103.284 Y121.39 E-.46416
G1 X104.062 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.115 Y128.386 Z5.8 F42000
G1 X109.923 Y134.821 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F8205
M204 S5000
G3 X109.737 Y134.99 I-.195 J-.028 E.00835
G1 X102.842 Y134.978 E.21186
G3 X102.716 Y134.793 I.067 J-.181 E.00735
G1 X102.727 Y121.14 E.41952
G3 X102.904 Y121.01 I.183 J.064 E.00718
G1 X109.735 Y121.01 E.20987
G3 X109.924 Y121.199 I-.01 J.199 E.00902
G1 X109.923 Y134.761 E.41671
; WIPE_START
G1 F9547.055
M204 S6000
G1 X109.905 Y134.88 E-.04581
G1 X109.858 Y134.943 E-.02973
G1 X109.737 Y134.99 E-.04928
G1 X108.066 Y134.987 E-.63518
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.702 Y132.387 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.482855
G1 F8183.036
M204 S6000
G1 X108.702 Y123.613 E.31456
; WIPE_START
G1 X108.702 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103 Y122.806 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.21832
G1 F8205
M204 S6000
G1 X103 Y121.206 E.02286
M204 S10000
G1 X103 Y133.194 F42000
G1 F8205
M204 S6000
G1 X103 Y134.794 E.02287
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X103 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 28/72
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z5.8 I-.006 J1.217 P1  F42000
G1 X145.623 Y133.39 Z5.8
G1 Z5.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8237
M204 S5000
G1 X151.143 Y133.39 E.16961
G1 X151.143 Y134.61 E.03749
G1 X145.623 Y134.61 E.16961
G1 X145.623 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X147.623 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.618 Y132.591 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8237
M204 S6000
G1 X150.618 Y123.409 E.30458
G1 X151.491 Y123.409 E.02897
G1 X151.491 Y132.591 E.30458
G1 X150.678 Y132.591 E.02698
; WIPE_START
G1 F8843.478
G1 X150.665 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.496 Y124.197 Z6 F42000
G1 X146.149 Y123.665 Z6
G1 Z5.6
G1 E.8 F1800
G1 F8237
M204 S6000
G1 X146.149 Y132.591 E.29609
G1 X145.872 Y132.591 E.0092
G1 X145.872 Y123.409 E.30458
G1 X146.149 Y123.409 E.0092
G1 X146.149 Y123.605 E.0065
M204 S10000
G1 X146.948 Y123.273 F42000
G1 F8237
M204 S6000
G1 X150.211 Y123.273 E.10821
G1 X150.211 Y132.727 E.31361
G1 X146.556 Y132.727 E.12121
G1 X146.556 Y123.273 E.31361
G1 X146.888 Y123.273 E.01102
M204 S250
G1 X146.948 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8237
M204 S5000
G1 X149.818 Y123.665 E.08819
G1 X149.818 Y132.335 E.2664
G1 X146.948 Y132.335 E.08819
G1 X146.948 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.948 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.94 Y131.051 Z6 F42000
G1 X151.898 Y134.598 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8237
M204 S6000
G1 X151.536 Y134.598 E.01203
G1 X151.536 Y132.998 E.05306
G1 X145.465 Y132.998 E.20137
G1 X145.465 Y123.002 E.33158
G1 X151.536 Y123.002 E.20137
G1 X151.536 Y121.402 E.05306
G1 X151.898 Y121.402 E.01202
G1 X151.898 Y134.538 E.43572
; WIPE_START
G1 F8843.478
G1 X151.536 Y134.598 E-.13966
G1 X151.536 Y132.998 E-.60786
G1 X151.503 Y132.998 E-.01249
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.743 Y126.356 Z6 F42000
G1 X145.623 Y122.61 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8237
M204 S5000
G1 X145.623 Y121.39 E.03749
G1 X151.143 Y121.39 E.16961
G1 X151.143 Y122.61 E.03749
G1 X145.683 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.623 Y121.39 E-.46416
G1 X146.402 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.466 Y128.381 Z6 F42000
G1 X152.289 Y134.821 Z6
G1 Z5.6
G1 E.8 F1800
G1 F8237
M204 S5000
G3 X152.103 Y134.99 I-.195 J-.029 E.00834
G1 X145.199 Y134.978 E.21215
G3 X145.073 Y134.793 I.067 J-.181 E.00735
G1 X145.083 Y121.139 E.41952
G3 X145.261 Y121.01 I.182 J.064 E.00718
G1 X152.099 Y121.01 E.21012
G3 X152.29 Y121.199 I-.008 J.199 E.00905
G1 X152.289 Y134.761 E.41673
; WIPE_START
G1 F9547.055
M204 S6000
G1 X152.271 Y134.881 E-.04584
G1 X152.224 Y134.943 E-.02958
G1 X152.103 Y134.99 E-.04925
G1 X150.431 Y134.987 E-.63533
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
G1 X151.054 Y132.387 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.509175
G1 F7721.096
M204 S6000
G1 X151.054 Y123.613 E.33338
; WIPE_START
G1 X151.054 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.348 Y122.806 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.20143
G1 F8237
M204 S6000
G1 X145.348 Y121.206 E.02066
M204 S10000
G1 X145.348 Y133.194 F42000
G1 F8237
M204 S6000
G1 X145.348 Y134.794 E.02067
; OBJECT_ID: 405
; WIPE_START
G1 F15000
G1 X145.348 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.716 Y133.266 Z6 F42000
G1 X124.454 Y133.39 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8237
M204 S5000
G1 X129.974 Y133.39 E.16961
G1 X129.974 Y134.61 E.03749
G1 X124.454 Y134.61 E.16961
G1 X124.454 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.454 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.448 Y132.591 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8237
M204 S6000
G1 X129.448 Y123.409 E.30458
G1 X130.321 Y123.409 E.02897
G1 X130.321 Y132.591 E.30458
G1 X129.508 Y132.591 E.02698
; WIPE_START
G1 F8843.478
G1 X129.495 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.326 Y124.197 Z6 F42000
G1 X124.98 Y123.665 Z6
G1 Z5.6
G1 E.8 F1800
G1 F8237
M204 S6000
G1 X124.98 Y132.591 E.29609
G1 X124.702 Y132.591 E.0092
G1 X124.702 Y123.409 E.30458
G1 X124.98 Y123.409 E.0092
G1 X124.98 Y123.605 E.0065
M204 S10000
G1 X125.779 Y123.273 F42000
G1 F8237
M204 S6000
G1 X129.041 Y123.273 E.10821
G1 X129.041 Y132.727 E.31361
G1 X125.387 Y132.727 E.12121
G1 X125.387 Y123.273 E.31361
G1 X125.719 Y123.273 E.01102
M204 S250
G1 X125.779 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8237
M204 S5000
G1 X128.649 Y123.665 E.08819
G1 X128.649 Y132.335 E.2664
G1 X125.779 Y132.335 E.08819
G1 X125.779 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.778 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.77 Y131.051 Z6 F42000
G1 X130.728 Y134.598 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8237
M204 S6000
G1 X130.366 Y134.598 E.01203
G1 X130.366 Y132.998 E.05306
G1 X124.295 Y132.998 E.20137
M73 P57 R9
G1 X124.295 Y123.002 E.33158
G1 X130.366 Y123.002 E.20137
G1 X130.366 Y121.402 E.05306
G1 X130.728 Y121.402 E.01202
G1 X130.728 Y134.538 E.43572
; WIPE_START
G1 F8843.478
G1 X130.366 Y134.598 E-.13966
G1 X130.366 Y132.998 E-.60786
G1 X130.333 Y132.998 E-.01249
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.574 Y126.356 Z6 F42000
G1 X124.454 Y122.61 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8237
M204 S5000
G1 X124.454 Y121.39 E.03749
G1 X129.974 Y121.39 E.16961
G1 X129.974 Y122.61 E.03749
G1 X124.514 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y121.39 E-.46416
G1 X125.232 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.296 Y128.381 Z6 F42000
G1 X131.119 Y134.821 Z6
G1 Z5.6
G1 E.8 F1800
G1 F8237
M204 S5000
G3 X130.933 Y134.99 I-.195 J-.029 E.00834
G1 X124.029 Y134.978 E.21215
G3 X123.903 Y134.793 I.067 J-.181 E.00735
G1 X123.913 Y121.139 E.41952
G3 X124.091 Y121.01 I.182 J.064 E.00718
G1 X130.929 Y121.01 E.21012
G3 X131.12 Y121.199 I-.008 J.199 E.00905
G1 X131.119 Y134.761 E.41673
; WIPE_START
G1 F9547.055
M204 S6000
G1 X131.101 Y134.881 E-.04584
G1 X131.054 Y134.943 E-.02958
G1 X130.933 Y134.99 E-.04925
G1 X129.261 Y134.987 E-.63533
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.885 Y132.387 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.509175
G1 F7721.096
M204 S6000
G1 X129.884 Y123.613 E.33338
; WIPE_START
G1 X129.884 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.178 Y122.806 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.20143
G1 F8237
M204 S6000
G1 X124.178 Y121.206 E.02066
M204 S10000
G1 X124.178 Y133.194 F42000
G1 F8237
M204 S6000
G1 X124.178 Y134.794 E.02067
; OBJECT_ID: 394
; WIPE_START
G1 F15000
G1 X124.178 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X116.546 Y133.266 Z6 F42000
G1 X103.284 Y133.39 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8237
M204 S5000
G1 X108.804 Y133.39 E.16961
G1 X108.804 Y134.61 E.03749
G1 X103.284 Y134.61 E.16961
G1 X103.284 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.284 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.278 Y132.591 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8237
M204 S6000
G1 X108.278 Y123.409 E.30458
G1 X109.151 Y123.409 E.02897
G1 X109.152 Y132.591 E.30458
G1 X108.338 Y132.591 E.02698
; WIPE_START
G1 F8843.478
G1 X108.325 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.157 Y124.197 Z6 F42000
G1 X103.81 Y123.665 Z6
G1 Z5.6
G1 E.8 F1800
G1 F8237
M204 S6000
G1 X103.81 Y132.591 E.29609
G1 X103.533 Y132.591 E.0092
G1 X103.533 Y123.409 E.30458
G1 X103.81 Y123.409 E.0092
G1 X103.81 Y123.605 E.0065
M204 S10000
G1 X104.609 Y123.273 F42000
G1 F8237
M204 S6000
G1 X107.871 Y123.273 E.10821
G1 X107.871 Y132.727 E.31361
G1 X104.217 Y132.727 E.12121
G1 X104.217 Y123.273 E.31361
G1 X104.549 Y123.273 E.01102
M204 S250
G1 X104.609 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8237
M204 S5000
G1 X107.479 Y123.665 E.08819
G1 X107.479 Y132.335 E.2664
G1 X104.609 Y132.335 E.08819
G1 X104.609 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X106.609 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.6 Y131.051 Z6 F42000
G1 X109.559 Y134.598 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8237
M204 S6000
G1 X109.196 Y134.598 E.01203
G1 X109.196 Y132.998 E.05306
G1 X103.125 Y132.998 E.20137
G1 X103.125 Y123.002 E.33158
G1 X109.196 Y123.002 E.20137
G1 X109.196 Y121.402 E.05306
G1 X109.558 Y121.402 E.01202
G1 X109.559 Y134.538 E.43572
; WIPE_START
G1 F8843.478
G1 X109.196 Y134.598 E-.13966
G1 X109.196 Y132.998 E-.60786
G1 X109.163 Y132.998 E-.01249
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.404 Y126.356 Z6 F42000
G1 X103.284 Y122.61 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8237
M204 S5000
G1 X103.284 Y121.39 E.03749
G1 X108.804 Y121.39 E.16961
G1 X108.804 Y122.61 E.03749
G1 X103.344 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X103.284 Y121.39 E-.46416
G1 X104.062 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.126 Y128.381 Z6 F42000
G1 X109.949 Y134.821 Z6
G1 Z5.6
G1 E.8 F1800
G1 F8237
M204 S5000
G3 X109.764 Y134.99 I-.195 J-.029 E.00834
G1 X102.859 Y134.978 E.21215
G3 X102.733 Y134.793 I.067 J-.181 E.00735
G1 X102.744 Y121.139 E.41952
G3 X102.921 Y121.01 I.182 J.064 E.00718
G1 X109.759 Y121.01 E.21012
G3 X109.95 Y121.199 I-.008 J.199 E.00905
G1 X109.949 Y134.761 E.41673
; WIPE_START
G1 F9547.055
M204 S6000
G1 X109.931 Y134.881 E-.04584
G1 X109.884 Y134.943 E-.02958
G1 X109.764 Y134.99 E-.04925
G1 X108.092 Y134.987 E-.63533
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.715 Y132.387 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.509175
G1 F7721.096
M204 S6000
G1 X108.715 Y123.613 E.33338
; WIPE_START
G1 X108.715 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.009 Y122.806 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.20143
G1 F8237
M204 S6000
G1 X103.009 Y121.206 E.02066
M204 S10000
G1 X103.009 Y133.194 F42000
G1 F8237
M204 S6000
G1 X103.009 Y134.794 E.02067
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X103.009 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 29/72
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z6 I-.006 J1.217 P1  F42000
G1 X145.623 Y133.39 Z6
G1 Z5.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8269
M204 S5000
G1 X151.143 Y133.39 E.16961
G1 X151.143 Y134.61 E.03749
G1 X145.623 Y134.61 E.16961
G1 X145.623 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X147.623 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.618 Y132.591 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8269
M204 S6000
G1 X150.618 Y123.409 E.30458
G1 X151.517 Y123.409 E.02984
G1 X151.517 Y132.591 E.30458
G1 X150.678 Y132.591 E.02786
; WIPE_START
G1 F8843.478
G1 X150.665 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.496 Y124.197 Z6.2 F42000
G1 X146.149 Y123.665 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F8269
M204 S6000
G1 X146.149 Y132.591 E.29609
G1 X145.889 Y132.591 E.00864
G1 X145.889 Y123.409 E.30458
G1 X146.149 Y123.409 E.00864
G1 X146.149 Y123.605 E.0065
M204 S10000
G1 X146.948 Y123.273 F42000
G1 F8269
M204 S6000
G1 X150.211 Y123.273 E.10821
G1 X150.211 Y132.727 E.31361
G1 X146.556 Y132.727 E.12121
G1 X146.556 Y123.273 E.31361
G1 X146.888 Y123.273 E.01102
M204 S250
G1 X146.948 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8269
M204 S5000
G1 X149.818 Y123.665 E.08819
G1 X149.818 Y132.335 E.2664
G1 X146.948 Y132.335 E.08819
G1 X146.948 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.948 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.956 Y131.047 Z6.2 F42000
G1 X151.924 Y134.598 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8269
M204 S6000
G1 X151.536 Y134.598 E.0129
G1 X151.536 Y132.998 E.05306
G1 X145.482 Y132.998 E.20081
G1 X145.482 Y123.002 E.33158
G1 X151.536 Y123.002 E.20081
G1 X151.536 Y121.402 E.05306
G1 X151.924 Y121.402 E.01289
G1 X151.924 Y134.538 E.43572
; WIPE_START
G1 F8843.478
G1 X151.536 Y134.598 E-.14954
G1 X151.536 Y132.998 E-.60786
G1 X151.529 Y132.998 E-.00261
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.757 Y126.363 Z6.2 F42000
G1 X145.623 Y122.61 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8269
M204 S5000
G1 X145.623 Y121.39 E.03749
G1 X151.143 Y121.39 E.16961
G1 X151.143 Y122.61 E.03749
G1 X145.683 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.623 Y121.39 E-.46416
G1 X146.402 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.477 Y128.375 Z6.2 F42000
G1 X152.315 Y134.821 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F8269
M204 S5000
G3 X152.129 Y134.99 I-.197 J-.031 E.00833
G1 X145.216 Y134.978 E.21244
G3 X145.09 Y134.793 I.067 J-.181 E.00735
G1 X145.09 Y121.207 E.41744
G1 X145.11 Y121.116 E.00288
G3 X145.278 Y121.01 I.177 J.096 E.00636
G1 X152.124 Y121.01 E.21037
G3 X152.316 Y121.199 I-.007 J.199 E.00908
G1 X152.315 Y134.761 E.41673
; WIPE_START
G1 F9547.055
M204 S6000
G1 X152.297 Y134.882 E-.04665
G1 X152.249 Y134.944 E-.02964
G1 X152.129 Y134.99 E-.0485
G1 X150.458 Y134.987 E-.63522
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
G1 X151.067 Y132.387 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.535495
G1 F7308.531
M204 S6000
G1 X151.067 Y123.613 E.3522
; WIPE_START
G1 X151.067 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.357 Y122.806 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.18454
G1 F8269
M204 S6000
G1 X145.357 Y121.206 E.01846
M204 S10000
G1 X145.357 Y133.194 F42000
G1 F8269
M204 S6000
G1 X145.357 Y134.794 E.01846
; OBJECT_ID: 405
; WIPE_START
G1 F15000
G1 X145.357 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.724 Y133.266 Z6.2 F42000
G1 X124.454 Y133.39 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8269
M204 S5000
G1 X129.974 Y133.39 E.16961
G1 X129.974 Y134.61 E.03749
G1 X124.454 Y134.61 E.16961
G1 X124.454 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.454 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.448 Y132.591 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8269
M204 S6000
G1 X129.448 Y123.409 E.30458
G1 X130.347 Y123.409 E.02984
G1 X130.348 Y132.591 E.30458
G1 X129.508 Y132.591 E.02786
; WIPE_START
G1 F8843.478
G1 X129.495 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.326 Y124.197 Z6.2 F42000
G1 X124.98 Y123.665 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F8269
M204 S6000
G1 X124.98 Y132.591 E.29609
G1 X124.719 Y132.591 E.00864
G1 X124.719 Y123.409 E.30458
G1 X124.98 Y123.409 E.00864
G1 X124.98 Y123.605 E.0065
M204 S10000
G1 X125.779 Y123.273 F42000
G1 F8269
M204 S6000
G1 X129.041 Y123.273 E.10821
G1 X129.041 Y132.727 E.31361
G1 X125.387 Y132.727 E.12121
G1 X125.387 Y123.273 E.31361
G1 X125.719 Y123.273 E.01102
M204 S250
G1 X125.779 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8269
M204 S5000
G1 X128.649 Y123.665 E.08819
G1 X128.649 Y132.335 E.2664
G1 X125.779 Y132.335 E.08819
G1 X125.779 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.778 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.786 Y131.047 Z6.2 F42000
G1 X130.755 Y134.598 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8269
M204 S6000
G1 X130.366 Y134.598 E.0129
G1 X130.366 Y132.998 E.05306
G1 X124.312 Y132.998 E.20081
G1 X124.312 Y123.002 E.33158
G1 X130.366 Y123.002 E.20081
M73 P58 R9
G1 X130.366 Y121.402 E.05306
G1 X130.754 Y121.402 E.01289
G1 X130.755 Y134.538 E.43572
; WIPE_START
G1 F8843.478
G1 X130.366 Y134.598 E-.14954
G1 X130.366 Y132.998 E-.60786
G1 X130.359 Y132.998 E-.00261
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.587 Y126.363 Z6.2 F42000
G1 X124.454 Y122.61 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8269
M204 S5000
G1 X124.454 Y121.39 E.03749
G1 X129.974 Y121.39 E.16961
G1 X129.974 Y122.61 E.03749
G1 X124.514 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y121.39 E-.46416
G1 X125.232 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.308 Y128.375 Z6.2 F42000
G1 X131.145 Y134.821 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F8269
M204 S5000
G3 X130.96 Y134.99 I-.197 J-.031 E.00833
G1 X124.046 Y134.978 E.21244
G3 X123.92 Y134.793 I.067 J-.181 E.00735
G1 X123.92 Y121.207 E.41744
G1 X123.94 Y121.116 E.00288
G3 X124.108 Y121.01 I.177 J.096 E.00636
G1 X130.954 Y121.01 E.21037
G3 X131.146 Y121.199 I-.007 J.199 E.00908
G1 X131.145 Y134.761 E.41673
; WIPE_START
G1 F9547.055
M204 S6000
G1 X131.127 Y134.882 E-.04665
G1 X131.079 Y134.944 E-.02964
G1 X130.96 Y134.99 E-.0485
G1 X129.288 Y134.987 E-.63522
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.898 Y132.387 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.535495
G1 F7308.531
M204 S6000
G1 X129.898 Y123.613 E.3522
; WIPE_START
G1 X129.898 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.187 Y122.806 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.18454
G1 F8269
M204 S6000
G1 X124.187 Y121.206 E.01846
M204 S10000
G1 X124.187 Y133.194 F42000
G1 F8269
M204 S6000
G1 X124.187 Y134.794 E.01846
; OBJECT_ID: 394
; WIPE_START
G1 F15000
G1 X124.187 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X116.555 Y133.266 Z6.2 F42000
G1 X103.284 Y133.39 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8269
M204 S5000
G1 X108.804 Y133.39 E.16961
G1 X108.804 Y134.61 E.03749
G1 X103.284 Y134.61 E.16961
G1 X103.284 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.284 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.278 Y132.591 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8269
M204 S6000
G1 X108.278 Y123.409 E.30458
G1 X109.178 Y123.409 E.02984
G1 X109.178 Y132.591 E.30458
G1 X108.338 Y132.591 E.02786
; WIPE_START
G1 F8843.478
G1 X108.325 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.157 Y124.197 Z6.2 F42000
G1 X103.81 Y123.665 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F8269
M204 S6000
G1 X103.81 Y132.591 E.29609
G1 X103.549 Y132.591 E.00864
G1 X103.549 Y123.409 E.30458
G1 X103.81 Y123.409 E.00864
G1 X103.81 Y123.605 E.0065
M204 S10000
G1 X104.609 Y123.273 F42000
G1 F8269
M204 S6000
G1 X107.871 Y123.273 E.10821
G1 X107.871 Y132.727 E.31361
G1 X104.217 Y132.727 E.12121
G1 X104.217 Y123.273 E.31361
G1 X104.549 Y123.273 E.01102
M204 S250
G1 X104.609 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8269
M204 S5000
G1 X107.479 Y123.665 E.08819
G1 X107.479 Y132.335 E.2664
G1 X104.609 Y132.335 E.08819
G1 X104.609 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X106.609 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.617 Y131.047 Z6.2 F42000
G1 X109.585 Y134.598 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8269
M204 S6000
G1 X109.196 Y134.598 E.0129
G1 X109.196 Y132.998 E.05306
G1 X103.142 Y132.998 E.20081
G1 X103.142 Y123.002 E.33158
G1 X109.196 Y123.002 E.20081
G1 X109.196 Y121.402 E.05306
G1 X109.585 Y121.402 E.01289
G1 X109.585 Y134.538 E.43572
; WIPE_START
G1 F8843.478
G1 X109.196 Y134.598 E-.14954
G1 X109.196 Y132.998 E-.60786
G1 X109.189 Y132.998 E-.00261
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.417 Y126.363 Z6.2 F42000
G1 X103.284 Y122.61 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8269
M204 S5000
G1 X103.284 Y121.39 E.03749
G1 X108.804 Y121.39 E.16961
G1 X108.804 Y122.61 E.03749
G1 X103.344 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X103.284 Y121.39 E-.46416
G1 X104.062 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.138 Y128.375 Z6.2 F42000
G1 X109.975 Y134.821 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F8269
M204 S5000
G3 X109.79 Y134.99 I-.197 J-.031 E.00833
G1 X102.876 Y134.978 E.21244
G3 X102.75 Y134.793 I.067 J-.181 E.00735
G1 X102.75 Y121.207 E.41744
G1 X102.771 Y121.116 E.00288
G3 X102.938 Y121.01 I.177 J.096 E.00636
G1 X109.784 Y121.01 E.21037
G3 X109.977 Y121.199 I-.007 J.199 E.00908
G1 X109.975 Y134.761 E.41673
; WIPE_START
G1 F9547.055
M204 S6000
G1 X109.957 Y134.882 E-.04665
G1 X109.909 Y134.944 E-.02964
G1 X109.79 Y134.99 E-.0485
G1 X108.118 Y134.987 E-.63522
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.728 Y132.387 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.535495
G1 F7308.531
M204 S6000
G1 X108.728 Y123.613 E.3522
; WIPE_START
G1 X108.728 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.017 Y122.806 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.18454
G1 F8269
M204 S6000
G1 X103.017 Y121.206 E.01846
M204 S10000
G1 X103.017 Y133.194 F42000
G1 F8269
M204 S6000
G1 X103.017 Y134.794 E.01846
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X103.017 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 30/72
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z6.2 I-.006 J1.217 P1  F42000
G1 X145.623 Y133.39 Z6.2
G1 Z6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8045
M204 S5000
G1 X151.143 Y133.39 E.16961
G1 X151.143 Y134.61 E.03749
G1 X145.623 Y134.61 E.16961
G1 X145.623 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X147.623 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.618 Y132.591 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8045
M204 S6000
G1 X150.618 Y123.409 E.30458
G1 X151.543 Y123.409 E.03071
G1 X151.544 Y132.591 E.30458
G1 X150.678 Y132.591 E.02873
; WIPE_START
G1 F8843.478
G1 X150.665 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.209 Y123.786 Z6.4 F42000
G1 X146.948 Y123.273 Z6.4
G1 Z6
G1 E.8 F1800
G1 F8045
M204 S6000
G1 X150.211 Y123.273 E.10821
G1 X150.211 Y132.727 E.31361
G1 X146.556 Y132.727 E.12121
G1 X146.556 Y123.273 E.31361
G1 X146.888 Y123.273 E.01102
M204 S250
G1 X146.948 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8045
M204 S5000
G1 X149.818 Y123.665 E.08819
G1 X149.818 Y132.335 E.2664
G1 X146.948 Y132.335 E.08819
G1 X146.948 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.948 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.973 Y131.042 Z6.4 F42000
G1 X151.951 Y134.598 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8045
M204 S6000
G1 X151.536 Y134.598 E.01377
G1 X151.536 Y132.998 E.05306
G1 X145.499 Y132.998 E.20025
G1 X145.499 Y123.002 E.33158
G1 X151.536 Y123.002 E.20025
G1 X151.536 Y121.402 E.05306
G1 X151.95 Y121.402 E.01377
G1 X151.951 Y134.538 E.43572
; WIPE_START
G1 F8843.478
G1 X151.536 Y134.598 E-.15944
G1 X151.536 Y133.017 E-.60057
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.766 Y126.381 Z6.4 F42000
G1 X145.623 Y122.61 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8045
M204 S5000
G1 X145.623 Y121.39 E.03749
G1 X151.143 Y121.39 E.16961
G1 X151.143 Y122.61 E.03749
G1 X145.683 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.623 Y121.39 E-.46416
G1 X146.402 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.489 Y128.37 Z6.4 F42000
G1 X152.341 Y134.821 Z6.4
G1 Z6
G1 E.8 F1800
G1 F8045
M204 S5000
G3 X152.156 Y134.99 I-.195 J-.028 E.00835
G1 X145.232 Y134.978 E.21274
G3 X145.107 Y134.792 I.067 J-.181 E.00734
G1 X145.117 Y121.139 E.41952
G3 X145.295 Y121.01 I.182 J.064 E.00718
G1 X152.149 Y121.01 E.21061
G3 X152.343 Y121.199 I-.005 J.199 E.00913
G1 X152.341 Y134.761 E.41673
; WIPE_START
G1 F9547.055
M204 S6000
G1 X152.324 Y134.88 E-.04581
G1 X152.277 Y134.943 E-.02965
G1 X152.156 Y134.99 E-.04929
G1 X150.484 Y134.987 E-.63525
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
G1 X151.081 Y132.387 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.561836
G1 F6937.549
M204 S6000
G1 X151.081 Y123.613 E.37104
; WIPE_START
G1 X151.081 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.365 Y121.206 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.16764
G1 F8045
M204 S6000
G1 X145.365 Y122.806 E.01626
M204 S10000
G1 X146.028 Y123.206 F42000
; LINE_WIDTH: 0.6935
G1 F5533.524
M204 S6000
G1 X146.028 Y132.794 E.50834
M204 S10000
G1 X145.365 Y133.194 F42000
; LINE_WIDTH: 0.16764
G1 F8045
M204 S6000
G1 X145.365 Y134.794 E.01626
; OBJECT_ID: 405
; WIPE_START
G1 F15000
G1 X145.365 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.733 Y133.266 Z6.4 F42000
G1 X124.454 Y133.39 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8045
M204 S5000
G1 X129.974 Y133.39 E.16961
G1 X129.974 Y134.61 E.03749
G1 X124.454 Y134.61 E.16961
G1 X124.454 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.454 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.448 Y132.591 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8045
M204 S6000
G1 X129.448 Y123.409 E.30458
G1 X130.374 Y123.409 E.03071
G1 X130.374 Y132.591 E.30458
G1 X129.508 Y132.591 E.02873
; WIPE_START
G1 F8843.478
G1 X129.495 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.039 Y123.786 Z6.4 F42000
G1 X125.779 Y123.273 Z6.4
G1 Z6
G1 E.8 F1800
G1 F8045
M204 S6000
G1 X129.041 Y123.273 E.10821
G1 X129.041 Y132.727 E.31361
G1 X125.387 Y132.727 E.12121
G1 X125.387 Y123.273 E.31361
G1 X125.719 Y123.273 E.01102
M204 S250
G1 X125.779 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8045
M204 S5000
G1 X128.649 Y123.665 E.08819
G1 X128.649 Y132.335 E.2664
G1 X125.779 Y132.335 E.08819
G1 X125.779 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.778 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.803 Y131.042 Z6.4 F42000
G1 X130.781 Y134.598 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8045
M204 S6000
G1 X130.366 Y134.598 E.01377
G1 X130.366 Y132.998 E.05306
G1 X124.329 Y132.998 E.20025
G1 X124.329 Y123.002 E.33158
G1 X130.366 Y123.002 E.20025
G1 X130.366 Y121.402 E.05306
G1 X130.781 Y121.402 E.01377
G1 X130.781 Y134.538 E.43572
; WIPE_START
G1 F8843.478
G1 X130.366 Y134.598 E-.15944
G1 X130.366 Y133.017 E-.60057
; WIPE_END
M73 P59 R8
G1 E-.04 F1800
M204 S10000
G1 X126.596 Y126.381 Z6.4 F42000
G1 X124.454 Y122.61 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8045
M204 S5000
G1 X124.454 Y121.39 E.03749
G1 X129.974 Y121.39 E.16961
G1 X129.974 Y122.61 E.03749
G1 X124.514 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.454 Y121.39 E-.46416
G1 X125.232 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.319 Y128.37 Z6.4 F42000
G1 X131.172 Y134.821 Z6.4
G1 Z6
G1 E.8 F1800
G1 F8045
M204 S5000
G3 X130.986 Y134.99 I-.195 J-.028 E.00835
G1 X124.063 Y134.978 E.21274
G3 X123.937 Y134.792 I.067 J-.181 E.00734
G1 X123.947 Y121.139 E.41952
G3 X124.125 Y121.01 I.182 J.064 E.00718
G1 X130.979 Y121.01 E.21061
G3 X131.173 Y121.199 I-.005 J.199 E.00913
G1 X131.172 Y134.761 E.41673
; WIPE_START
G1 F9547.055
M204 S6000
G1 X131.154 Y134.88 E-.04581
G1 X131.107 Y134.943 E-.02965
G1 X130.986 Y134.99 E-.04929
G1 X129.314 Y134.987 E-.63525
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.911 Y132.387 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.561836
G1 F6937.549
M204 S6000
G1 X129.911 Y123.613 E.37104
; WIPE_START
G1 X129.911 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.195 Y121.206 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.16764
G1 F8045
M204 S6000
G1 X124.195 Y122.806 E.01626
M204 S10000
G1 X124.858 Y123.206 F42000
; LINE_WIDTH: 0.6935
G1 F5533.524
M204 S6000
G1 X124.858 Y132.794 E.50834
M204 S10000
G1 X124.195 Y133.194 F42000
; LINE_WIDTH: 0.16764
G1 F8045
M204 S6000
G1 X124.195 Y134.794 E.01626
; OBJECT_ID: 394
; WIPE_START
G1 F15000
G1 X124.195 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X116.563 Y133.266 Z6.4 F42000
G1 X103.284 Y133.39 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8045
M204 S5000
G1 X108.804 Y133.39 E.16961
G1 X108.804 Y134.61 E.03749
G1 X103.284 Y134.61 E.16961
G1 X103.284 Y133.45 E.03564
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.284 Y133.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.278 Y132.591 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8045
M204 S6000
G1 X108.278 Y123.409 E.30458
G1 X109.204 Y123.409 E.03071
G1 X109.204 Y132.591 E.30458
G1 X108.338 Y132.591 E.02873
; WIPE_START
G1 F8843.478
G1 X108.325 Y130.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.869 Y123.786 Z6.4 F42000
G1 X104.609 Y123.273 Z6.4
G1 Z6
G1 E.8 F1800
G1 F8045
M204 S6000
G1 X107.871 Y123.273 E.10821
G1 X107.871 Y132.727 E.31361
G1 X104.217 Y132.727 E.12121
G1 X104.217 Y123.273 E.31361
G1 X104.549 Y123.273 E.01102
M204 S250
G1 X104.609 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8045
M204 S5000
G1 X107.479 Y123.665 E.08819
G1 X107.479 Y132.335 E.2664
G1 X104.609 Y132.335 E.08819
G1 X104.609 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X106.609 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.633 Y131.042 Z6.4 F42000
G1 X109.611 Y134.598 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8045
M204 S6000
G1 X109.196 Y134.598 E.01377
G1 X109.196 Y132.998 E.05306
G1 X103.159 Y132.998 E.20025
G1 X103.159 Y123.002 E.33158
G1 X109.196 Y123.002 E.20025
G1 X109.196 Y121.402 E.05306
G1 X109.611 Y121.402 E.01377
G1 X109.611 Y134.538 E.43572
; WIPE_START
G1 F8843.478
G1 X109.196 Y134.598 E-.15944
G1 X109.196 Y133.017 E-.60057
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.426 Y126.381 Z6.4 F42000
G1 X103.284 Y122.61 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8045
M204 S5000
G1 X103.284 Y121.39 E.03749
G1 X108.804 Y121.39 E.16961
G1 X108.804 Y122.61 E.03749
G1 X103.344 Y122.61 E.16777
; WIPE_START
G1 F9547.055
M204 S6000
G1 X103.284 Y121.39 E-.46416
G1 X104.062 Y121.39 E-.29585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.149 Y128.37 Z6.4 F42000
G1 X110.002 Y134.821 Z6.4
G1 Z6
G1 E.8 F1800
G1 F8045
M204 S5000
G3 X109.816 Y134.99 I-.195 J-.028 E.00835
G1 X102.893 Y134.978 E.21274
G3 X102.767 Y134.792 I.067 J-.181 E.00734
G1 X102.777 Y121.139 E.41952
G3 X102.955 Y121.01 I.182 J.064 E.00718
G1 X109.809 Y121.01 E.21061
G3 X110.003 Y121.199 I-.005 J.199 E.00913
G1 X110.002 Y134.761 E.41673
; WIPE_START
G1 F9547.055
M204 S6000
G1 X109.984 Y134.88 E-.04581
G1 X109.937 Y134.943 E-.02965
G1 X109.816 Y134.99 E-.04929
G1 X108.145 Y134.987 E-.63525
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.741 Y132.387 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.561836
G1 F6937.549
M204 S6000
G1 X108.741 Y123.613 E.37104
; WIPE_START
G1 X108.741 Y125.613 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.026 Y121.206 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.16764
G1 F8045
M204 S6000
G1 X103.026 Y122.806 E.01626
M204 S10000
G1 X103.688 Y123.206 F42000
; LINE_WIDTH: 0.6935
G1 F5533.524
M204 S6000
G1 X103.688 Y132.794 E.50834
M204 S10000
G1 X103.026 Y133.194 F42000
; LINE_WIDTH: 0.16764
G1 F8045
M204 S6000
G1 X103.026 Y134.794 E.01626
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X103.026 Y133.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 31/72
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z6.4 I.268 J1.187 P1  F42000
G1 X146.948 Y123.273 Z6.4
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X150.211 Y123.273 E.10821
G1 X150.211 Y132.727 E.31361
G1 X146.556 Y132.727 E.12121
G1 X146.556 Y123.273 E.31361
G1 X146.888 Y123.273 E.01102
M204 S250
G1 X146.948 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X149.818 Y123.665 E.08819
G1 X149.818 Y132.335 E.2664
G1 X146.948 Y132.335 E.08819
G1 X146.948 Y123.725 E.26456
; WIPE_START
M204 S6000
G1 X148.948 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.838 Y131.018 Z6.6 F42000
G1 X145.925 Y134.191 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M106 S255
G1 F840
M204 S6000
G1 X145.925 Y133.417 E.02565
M106 S201.45
G1 F2363.371
G1 X145.925 Y133.134 E.0094
G1 F5825.86
G1 X146.325 Y133.134 E.01327
G1 F8843.478
G1 X146.725 Y133.134 E.01327
G1 X150.618 Y133.134 E.12912
G1 X150.618 Y122.866 E.34062
G1 X146.725 Y122.866 E.12912
G1 X146.325 Y122.866 E.01327
G1 F5825.86
G1 X145.925 Y122.866 E.01327
G1 F2363.371
G1 X145.925 Y122.582 E.0094
M106 S255
G1 F840
G1 X145.925 Y122.209 E.01238
M106 S201.45
M106 S255
G1 X145.925 Y121.809 E.01327
M106 S201.45
M106 S255
G1 F600
G1 X146.033 Y121.809 E.00359
M106 S201.45
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X150.733 Y121.809 E.15591
M106 S201.45
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X151.116 Y121.809 E.01269
M106 S201.45
G1 F5456.478
G1 X151.57 Y121.809 E.01505
G1 F8843.478
G1 X151.57 Y122.209 E.01327
G1 X151.57 Y133.79 E.38417
G1 X151.57 Y134.19 E.01327
G1 F5459.14
G1 X151.116 Y134.19 E.01506
M106 S255
G1 F1800
G1 X150.733 Y134.191 E.01269
M106 S201.45
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X146.033 Y134.191 E.15591
M106 S201.45
; FEATURE: Inner wall
M106 S255
G1 F600
M204 S6000
G1 X145.985 Y134.191 E.0016
M106 S201.45
M204 S10000
G1 X145.518 Y134.598 F42000
G1 F8843.478
M204 S6000
G1 X145.518 Y121.402 E.43772
G1 X151.977 Y121.402 E.21424
G1 X151.977 Y134.598 E.43771
G1 X145.578 Y134.598 E.21226
M204 S250
G1 X145.126 Y134.793 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X145.126 Y121.207 E.41743
G1 X145.158 Y121.096 E.00358
G3 X145.316 Y121.01 I.163 J.112 E.00572
G1 X152.222 Y121.017 E.2122
G3 X152.369 Y121.199 I-.048 J.189 E.00772
G1 X152.369 Y134.794 E.41774
G1 X152.335 Y134.907 E.00363
G1 X152.24 Y134.979 E.00364
G3 X152.182 Y134.99 I-.067 J-.197 E.00183
G1 X145.253 Y134.978 E.21291
G3 X145.134 Y134.853 I.066 J-.182 E.00549
; WIPE_START
M204 S6000
G1 X145.133 Y132.853 E-.76
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
G1 X146.037 Y132.931 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.67404
G1 F5704.145
M204 S6000
G1 X146.037 Y123.069 E.50714
M204 S10000
G1 X146.129 Y122.338 F42000
; LINE_WIDTH: 0.692302
G1 F5543.733
M204 S6000
G1 X150.821 Y122.338 E.2483
; LINE_WIDTH: 0.72305
G1 F5293.111
G1 X151.013 Y122.366 E.01076
G1 X151.033 Y122.44 E.00425
; LINE_WIDTH: 0.6887
G1 F5574.658
G1 X151.053 Y122.514 E.00404
; LINE_WIDTH: 0.648436
G1 F5945.345
G1 X151.074 Y122.588 E.00379
; LINE_WIDTH: 0.608172
G1 F6368.842
G1 X151.094 Y122.662 E.00354
; LINE_WIDTH: 0.588309
G1 F6600.801
G1 X151.094 Y133.338 E.47444
G1 X151.074 Y133.412 E.00341
; LINE_WIDTH: 0.6486
G1 F5943.739
G1 X151.054 Y133.486 E.00379
; LINE_WIDTH: 0.688818
G1 F5573.637
G1 X151.033 Y133.56 E.00404
; LINE_WIDTH: 0.729037
G1 F5246.925
G1 X151.013 Y133.634 E.00429
; LINE_WIDTH: 0.73492
G1 F5202.317
G1 X150.917 Y133.648 E.00548
; LINE_WIDTH: 0.706467
G1 F5425.392
G1 X150.821 Y133.662 E.00525
; LINE_WIDTH: 0.692376
G1 F5543.106
G1 X146.129 Y133.662 E.24833
; OBJECT_ID: 405
; WIPE_START
G1 X148.129 Y133.662 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X141.208 Y130.445 Z6.6 F42000
G1 X125.779 Y123.273 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X129.041 Y123.273 E.10821
G1 X129.041 Y132.727 E.31361
G1 X125.387 Y132.727 E.12121
G1 X125.387 Y123.273 E.31361
G1 X125.719 Y123.273 E.01102
M204 S250
G1 X125.779 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X128.649 Y123.665 E.08819
G1 X128.649 Y132.335 E.2664
G1 X125.779 Y132.335 E.08819
G1 X125.779 Y123.725 E.26456
; WIPE_START
M204 S6000
G1 X127.778 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.668 Y131.018 Z6.6 F42000
G1 X124.756 Y134.191 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M106 S255
G1 F840
M204 S6000
G1 X124.756 Y133.417 E.02565
M106 S201.45
G1 F2363.371
G1 X124.756 Y133.134 E.0094
G1 F5825.86
G1 X125.156 Y133.134 E.01327
G1 F8843.478
G1 X125.556 Y133.134 E.01327
G1 X129.448 Y133.134 E.12912
G1 X129.448 Y122.866 E.34062
G1 X125.556 Y122.866 E.12912
G1 X125.156 Y122.866 E.01327
G1 F5825.86
G1 X124.756 Y122.866 E.01327
G1 F2363.371
G1 X124.756 Y122.582 E.0094
M106 S255
G1 F840
G1 X124.756 Y122.209 E.01238
M106 S201.45
M106 S255
G1 X124.756 Y121.809 E.01327
M106 S201.45
M106 S255
G1 F600
G1 X124.864 Y121.809 E.00359
M106 S201.45
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X129.564 Y121.809 E.15591
M106 S201.45
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X129.946 Y121.809 E.01269
M106 S201.45
M73 P60 R8
G1 F5456.478
G1 X130.4 Y121.809 E.01505
G1 F8843.478
G1 X130.4 Y122.209 E.01327
G1 X130.4 Y133.79 E.38417
G1 X130.4 Y134.19 E.01327
G1 F5459.14
G1 X129.946 Y134.19 E.01506
M106 S255
G1 F1800
G1 X129.564 Y134.191 E.01269
M106 S201.45
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X124.864 Y134.191 E.15591
M106 S201.45
; FEATURE: Inner wall
M106 S255
G1 F600
M204 S6000
G1 X124.816 Y134.191 E.0016
M106 S201.45
M204 S10000
G1 X124.348 Y134.598 F42000
G1 F8843.478
M204 S6000
G1 X124.348 Y121.402 E.43772
G1 X130.807 Y121.402 E.21424
G1 X130.807 Y134.598 E.43771
G1 X124.408 Y134.598 E.21226
M204 S250
G1 X123.956 Y134.793 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X123.956 Y121.207 E.41743
G1 X123.989 Y121.096 E.00358
G3 X124.146 Y121.01 I.163 J.112 E.00572
G1 X131.052 Y121.017 E.2122
G3 X131.199 Y121.199 I-.048 J.189 E.00772
G1 X131.199 Y134.794 E.41774
G1 X131.165 Y134.907 E.00363
G1 X131.071 Y134.979 E.00364
G3 X131.012 Y134.99 I-.067 J-.197 E.00183
G1 X124.083 Y134.978 E.21291
G3 X123.965 Y134.853 I.066 J-.182 E.00549
; WIPE_START
M204 S6000
G1 X123.963 Y132.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.6 I-.768 J.944 P1  F42000
G1 X124.959 Y133.662 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692376
G1 F5543.106
M204 S6000
G1 X129.651 Y133.662 E.24833
; LINE_WIDTH: 0.706467
G1 F5425.392
G1 X129.747 Y133.648 E.00525
; LINE_WIDTH: 0.73492
G1 F5202.317
G1 X129.844 Y133.634 E.00548
; LINE_WIDTH: 0.729037
G1 F5246.925
G1 X129.864 Y133.56 E.00429
; LINE_WIDTH: 0.688818
G1 F5573.637
G1 X129.884 Y133.486 E.00404
; LINE_WIDTH: 0.6486
G1 F5943.739
G1 X129.904 Y133.412 E.00379
; LINE_WIDTH: 0.588309
G1 F6600.801
G1 X129.924 Y133.338 E.00341
G1 X129.924 Y122.662 E.47444
; LINE_WIDTH: 0.608172
G1 F6368.842
G1 X129.904 Y122.588 E.00354
; LINE_WIDTH: 0.648436
G1 F5945.345
G1 X129.884 Y122.514 E.00379
; LINE_WIDTH: 0.6887
G1 F5574.658
G1 X129.864 Y122.44 E.00404
; LINE_WIDTH: 0.72305
G1 F5293.111
G1 X129.843 Y122.366 E.00425
G1 X129.651 Y122.338 E.01076
; LINE_WIDTH: 0.692302
G1 F5543.733
G1 X124.959 Y122.338 E.2483
M204 S10000
G1 X124.868 Y123.069 F42000
; LINE_WIDTH: 0.67404
G1 F5704.145
M204 S6000
G1 X124.868 Y132.931 E.50714
; OBJECT_ID: 394
; WIPE_START
G1 X124.868 Y130.931 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X117.728 Y128.232 Z6.6 F42000
G1 X104.609 Y123.273 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X107.871 Y123.273 E.10821
G1 X107.871 Y132.727 E.31361
G1 X104.217 Y132.727 E.12121
G1 X104.217 Y123.273 E.31361
G1 X104.549 Y123.273 E.01102
M204 S250
G1 X104.609 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X107.479 Y123.665 E.08819
G1 X107.479 Y132.335 E.2664
G1 X104.609 Y132.335 E.08819
G1 X104.609 Y123.725 E.26456
; WIPE_START
M204 S6000
G1 X106.609 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.498 Y131.018 Z6.6 F42000
G1 X103.586 Y134.191 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M106 S255
G1 F840
M204 S6000
G1 X103.586 Y133.417 E.02565
M106 S201.45
G1 F2363.371
G1 X103.586 Y133.134 E.0094
G1 F5825.86
G1 X103.986 Y133.134 E.01327
G1 F8843.478
G1 X104.386 Y133.134 E.01327
G1 X108.278 Y133.134 E.12912
G1 X108.278 Y122.866 E.34062
G1 X104.386 Y122.866 E.12912
G1 X103.986 Y122.866 E.01327
G1 F5825.86
G1 X103.586 Y122.866 E.01327
G1 F2363.371
G1 X103.586 Y122.582 E.0094
M106 S255
G1 F840
G1 X103.586 Y122.209 E.01238
M106 S201.45
M106 S255
G1 X103.586 Y121.809 E.01327
M106 S201.45
M106 S255
G1 F600
G1 X103.694 Y121.809 E.00359
M106 S201.45
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X108.394 Y121.809 E.15591
M106 S201.45
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X108.776 Y121.809 E.01269
M106 S201.45
G1 F5456.478
G1 X109.23 Y121.809 E.01505
G1 F8843.478
G1 X109.23 Y122.209 E.01327
G1 X109.231 Y133.79 E.38417
G1 X109.231 Y134.19 E.01327
G1 F5459.14
G1 X108.776 Y134.19 E.01506
M106 S255
G1 F1800
G1 X108.394 Y134.191 E.01269
M106 S201.45
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X103.694 Y134.191 E.15591
M106 S201.45
; FEATURE: Inner wall
M106 S255
G1 F600
M204 S6000
G1 X103.646 Y134.191 E.0016
M106 S201.45
M204 S10000
G1 X103.179 Y134.598 F42000
G1 F8843.478
M204 S6000
G1 X103.179 Y121.402 E.43772
G1 X109.637 Y121.402 E.21424
G1 X109.638 Y134.598 E.43771
G1 X103.239 Y134.598 E.21226
M204 S250
G1 X102.787 Y134.793 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X102.787 Y121.207 E.41743
G1 X102.819 Y121.096 E.00358
G3 X102.977 Y121.01 I.163 J.112 E.00572
G1 X109.883 Y121.017 E.2122
G3 X110.029 Y121.199 I-.048 J.189 E.00772
G1 X110.03 Y134.794 E.41774
G1 X109.995 Y134.907 E.00363
G1 X109.901 Y134.979 E.00364
G3 X109.843 Y134.99 I-.067 J-.197 E.00183
G1 X102.913 Y134.978 E.21291
G3 X102.795 Y134.853 I.066 J-.182 E.00549
; WIPE_START
M204 S6000
G1 X102.794 Y132.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.6 I-.768 J.944 P1  F42000
G1 X103.789 Y133.662 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692376
G1 F5543.106
M204 S6000
G1 X108.482 Y133.662 E.24833
; LINE_WIDTH: 0.706467
G1 F5425.392
G1 X108.578 Y133.648 E.00525
; LINE_WIDTH: 0.73492
G1 F5202.317
G1 X108.674 Y133.634 E.00548
; LINE_WIDTH: 0.729037
G1 F5246.925
G1 X108.694 Y133.56 E.00429
; LINE_WIDTH: 0.688818
G1 F5573.637
G1 X108.714 Y133.486 E.00404
; LINE_WIDTH: 0.6486
G1 F5943.739
G1 X108.734 Y133.412 E.00379
; LINE_WIDTH: 0.588309
G1 F6600.801
G1 X108.754 Y133.338 E.00341
G1 X108.754 Y122.662 E.47444
; LINE_WIDTH: 0.608172
G1 F6368.842
G1 X108.734 Y122.588 E.00354
; LINE_WIDTH: 0.648436
G1 F5945.345
G1 X108.714 Y122.514 E.00379
; LINE_WIDTH: 0.6887
G1 F5574.658
G1 X108.694 Y122.44 E.00404
; LINE_WIDTH: 0.72305
G1 F5293.111
G1 X108.674 Y122.366 E.00425
G1 X108.482 Y122.338 E.01076
; LINE_WIDTH: 0.692302
G1 F5543.733
G1 X103.789 Y122.338 E.2483
M204 S10000
G1 X103.698 Y123.069 F42000
; LINE_WIDTH: 0.67404
G1 F5704.145
M204 S6000
G1 X103.698 Y132.931 E.50714
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5704.145
G1 X103.698 Y130.931 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 32/72
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z6.6 I.212 J1.198 P1  F42000
G1 X146.948 Y123.273 Z6.6
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7036
M204 S6000
G1 X150.211 Y123.273 E.10821
G1 X150.211 Y132.727 E.31361
G1 X146.556 Y132.727 E.12121
G1 X146.556 Y123.273 E.31361
G1 X146.888 Y123.273 E.01102
M204 S250
G1 X146.948 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7036
M204 S5000
G1 X149.818 Y123.665 E.08819
G1 X149.818 Y132.335 E.2664
G1 X146.948 Y132.335 E.08819
G1 X146.948 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.948 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.855 Y131.023 Z6.8 F42000
G1 X145.952 Y134.191 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7036
M204 S6000
G1 X145.952 Y133.134 E.03505
G1 X150.618 Y133.134 E.15478
G1 X150.618 Y122.866 E.34062
G1 X145.952 Y122.866 E.15478
G1 X145.952 Y121.809 E.03504
G1 X151.596 Y121.809 E.18724
G1 X151.596 Y134.19 E.4107
G1 X146.012 Y134.191 E.18526
M204 S10000
G1 X145.545 Y134.598 F42000
G1 F7036
M204 S6000
G1 X145.545 Y121.402 E.43772
G1 X152.003 Y121.402 E.21424
G1 X152.003 Y134.598 E.43771
G1 X145.605 Y134.598 E.21226
M204 S250
G1 X145.152 Y134.793 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7036
M204 S5000
G1 X145.163 Y121.14 E.41951
G3 X145.342 Y121.01 I.184 J.066 E.00723
G1 X152.237 Y121.014 E.21184
G3 X152.395 Y121.199 I-.035 J.19 E.0081
G1 X152.396 Y134.794 E.41774
G1 X152.362 Y134.906 E.00361
G1 X152.267 Y134.979 E.00366
G3 X152.208 Y134.99 I-.068 J-.198 E.00184
G1 X145.279 Y134.978 E.21291
G3 X145.161 Y134.853 I.066 J-.181 E.00549
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.161 Y132.853 E-.76
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
G1 X146.05 Y132.931 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.64771
G1 F5952.48
M204 S6000
G1 X146.05 Y123.069 E.48598
M204 S10000
G1 X146.155 Y122.338 F42000
; LINE_WIDTH: 0.692323
G1 F5543.552
M204 S6000
G1 X150.821 Y122.338 E.24692
; LINE_WIDTH: 0.730185
G1 F5238.158
G1 X151.033 Y122.372 E.01204
G1 X151.058 Y122.469 E.00559
; LINE_WIDTH: 0.687998
G1 F5580.722
G1 X151.082 Y122.566 E.00524
; LINE_WIDTH: 0.63892
G1 F6040.276
G1 X151.107 Y122.662 E.00484
; LINE_WIDTH: 0.614712
G1 F6295.996
G1 X151.107 Y133.338 E.49741
G1 X151.082 Y133.434 E.00465
; LINE_WIDTH: 0.688134
G1 F5579.55
G1 X151.058 Y133.531 E.00524
; LINE_WIDTH: 0.737148
G1 F5185.619
G1 X151.033 Y133.628 E.00564
; LINE_WIDTH: 0.744309
G1 F5132.673
G1 X150.927 Y133.645 E.00615
; LINE_WIDTH: 0.709597
G1 F5399.922
G1 X150.821 Y133.662 E.00584
; LINE_WIDTH: 0.692386
G1 F5543.015
G1 X146.155 Y133.662 E.24694
; OBJECT_ID: 405
; WIPE_START
G1 X148.155 Y133.662 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X141.232 Y130.448 Z6.8 F42000
G1 X125.779 Y123.273 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7036
M204 S6000
G1 X129.041 Y123.273 E.10821
G1 X129.041 Y132.727 E.31361
G1 X125.387 Y132.727 E.12121
G1 X125.387 Y123.273 E.31361
G1 X125.719 Y123.273 E.01102
M204 S250
G1 X125.779 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7036
M204 S5000
G1 X128.649 Y123.665 E.08819
G1 X128.649 Y132.335 E.2664
G1 X125.779 Y132.335 E.08819
G1 X125.779 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.778 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.685 Y131.023 Z6.8 F42000
G1 X124.782 Y134.191 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7036
M204 S6000
G1 X124.782 Y133.134 E.03505
G1 X129.448 Y133.134 E.15478
G1 X129.448 Y122.866 E.34062
G1 X124.782 Y122.866 E.15478
G1 X124.782 Y121.809 E.03504
G1 X130.426 Y121.809 E.18724
G1 X130.427 Y134.19 E.4107
G1 X124.842 Y134.191 E.18526
M204 S10000
G1 X124.375 Y134.598 F42000
G1 F7036
M204 S6000
G1 X124.375 Y121.402 E.43772
G1 X130.833 Y121.402 E.21424
G1 X130.834 Y134.598 E.43771
G1 X124.435 Y134.598 E.21226
M204 S250
G1 X123.983 Y134.793 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7036
M204 S5000
G1 X123.993 Y121.14 E.41951
G3 X124.173 Y121.01 I.184 J.066 E.00723
G1 X131.067 Y121.014 E.21184
G3 X131.225 Y121.199 I-.035 J.19 E.0081
G1 X131.226 Y134.794 E.41774
G1 X131.192 Y134.906 E.00361
G1 X131.097 Y134.979 E.00366
G3 X131.039 Y134.99 I-.068 J-.198 E.00184
G1 X124.11 Y134.978 E.21291
G3 X123.991 Y134.853 I.066 J-.181 E.00549
; WIPE_START
G1 F9547.055
M204 S6000
G1 X123.991 Y132.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.8 I-.769 J.944 P1  F42000
G1 X124.985 Y133.662 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692386
G1 F5543.015
M204 S6000
G1 X129.651 Y133.662 E.24694
; LINE_WIDTH: 0.709597
G1 F5399.922
G1 X129.758 Y133.645 E.00584
; LINE_WIDTH: 0.744309
G1 F5132.673
G1 X129.864 Y133.628 E.00615
; LINE_WIDTH: 0.737148
G1 F5185.619
G1 X129.888 Y133.531 E.00564
; LINE_WIDTH: 0.688134
G1 F5579.55
G1 X129.913 Y133.434 E.00524
; LINE_WIDTH: 0.614712
G1 F6295.996
G1 X129.937 Y133.338 E.00465
G1 X129.937 Y122.662 E.49741
; LINE_WIDTH: 0.63892
G1 F6040.276
G1 X129.913 Y122.566 E.00484
; LINE_WIDTH: 0.687998
G1 F5580.722
G1 X129.888 Y122.469 E.00524
; LINE_WIDTH: 0.730185
G1 F5238.158
G1 X129.863 Y122.372 E.00559
G1 X129.651 Y122.338 E.01204
; LINE_WIDTH: 0.692323
G1 F5543.552
G1 X124.985 Y122.338 E.24692
M204 S10000
G1 X124.881 Y123.069 F42000
; LINE_WIDTH: 0.64771
G1 F5952.48
M204 S6000
G1 X124.881 Y132.931 E.48598
; OBJECT_ID: 394
; WIPE_START
G1 X124.881 Y130.931 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X117.741 Y128.233 Z6.8 F42000
G1 X104.609 Y123.273 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7036
M204 S6000
G1 X107.871 Y123.273 E.10821
G1 X107.871 Y132.727 E.31361
G1 X104.217 Y132.727 E.12121
G1 X104.217 Y123.273 E.31361
G1 X104.549 Y123.273 E.01102
M204 S250
G1 X104.609 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7036
M204 S5000
G1 X107.479 Y123.665 E.08819
G1 X107.479 Y132.335 E.2664
G1 X104.609 Y132.335 E.08819
M73 P61 R8
G1 X104.609 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X106.609 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.515 Y131.023 Z6.8 F42000
G1 X103.612 Y134.191 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7036
M204 S6000
G1 X103.612 Y133.134 E.03505
G1 X108.278 Y133.134 E.15478
G1 X108.278 Y122.866 E.34062
G1 X103.612 Y122.866 E.15478
G1 X103.612 Y121.809 E.03504
G1 X109.257 Y121.809 E.18724
G1 X109.257 Y134.19 E.4107
G1 X103.672 Y134.191 E.18526
M204 S10000
G1 X103.205 Y134.598 F42000
G1 F7036
M204 S6000
G1 X103.205 Y121.402 E.43772
G1 X109.664 Y121.402 E.21424
G1 X109.664 Y134.598 E.43771
G1 X103.265 Y134.598 E.21226
M204 S250
G1 X102.813 Y134.793 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7036
M204 S5000
G1 X102.823 Y121.14 E.41951
G3 X103.003 Y121.01 I.184 J.066 E.00723
G1 X109.897 Y121.014 E.21184
G3 X110.056 Y121.199 I-.035 J.19 E.0081
G1 X110.056 Y134.794 E.41774
G1 X110.022 Y134.906 E.00361
G1 X109.927 Y134.979 E.00366
G3 X109.869 Y134.99 I-.068 J-.198 E.00184
G1 X102.94 Y134.978 E.21291
G3 X102.821 Y134.853 I.066 J-.181 E.00549
; WIPE_START
G1 F9547.055
M204 S6000
G1 X102.822 Y132.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.8 I-.769 J.944 P1  F42000
G1 X103.816 Y133.662 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692386
G1 F5543.015
M204 S6000
G1 X108.482 Y133.662 E.24694
; LINE_WIDTH: 0.709597
G1 F5399.922
G1 X108.588 Y133.645 E.00584
; LINE_WIDTH: 0.744309
G1 F5132.673
G1 X108.694 Y133.628 E.00615
; LINE_WIDTH: 0.737148
G1 F5185.619
G1 X108.718 Y133.531 E.00564
; LINE_WIDTH: 0.688134
G1 F5579.55
G1 X108.743 Y133.434 E.00524
; LINE_WIDTH: 0.614712
G1 F6295.996
G1 X108.767 Y133.338 E.00465
G1 X108.767 Y122.662 E.49741
; LINE_WIDTH: 0.63892
G1 F6040.276
G1 X108.743 Y122.566 E.00484
; LINE_WIDTH: 0.687998
G1 F5580.722
G1 X108.718 Y122.469 E.00524
; LINE_WIDTH: 0.730185
G1 F5238.158
G1 X108.694 Y122.372 E.00559
G1 X108.482 Y122.338 E.01204
; LINE_WIDTH: 0.692323
G1 F5543.552
G1 X103.816 Y122.338 E.24692
M204 S10000
G1 X103.711 Y123.069 F42000
; LINE_WIDTH: 0.64771
G1 F5952.48
M204 S6000
G1 X103.711 Y132.931 E.48598
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5952.48
G1 X103.711 Y130.931 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 33/72
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z6.8 I.212 J1.198 P1  F42000
G1 X146.948 Y123.273 Z6.8
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7032
M204 S6000
G1 X150.211 Y123.273 E.10821
G1 X150.211 Y132.727 E.31361
G1 X146.556 Y132.727 E.12121
G1 X146.556 Y123.273 E.31361
G1 X146.888 Y123.273 E.01102
M204 S250
G1 X146.948 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7032
M204 S5000
G1 X149.818 Y123.665 E.08819
G1 X149.818 Y132.335 E.2664
G1 X146.948 Y132.335 E.08819
G1 X146.948 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.948 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.872 Y131.028 Z7 F42000
G1 X145.978 Y134.191 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7032
M204 S6000
G1 X145.978 Y133.134 E.03505
G1 X150.618 Y133.134 E.15391
G1 X150.618 Y122.866 E.34062
G1 X145.978 Y122.866 E.15391
G1 X145.978 Y121.809 E.03504
G1 X151.622 Y121.809 E.18724
G1 X151.623 Y134.19 E.41071
G1 X146.038 Y134.191 E.18526
M204 S10000
G1 X145.571 Y134.598 F42000
G1 F7032
M204 S6000
G1 X145.571 Y121.402 E.43772
G1 X152.029 Y121.402 E.21424
G1 X152.03 Y134.598 E.43771
G1 X145.631 Y134.598 E.21226
M204 S250
G1 X145.179 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7032
M204 S5000
G1 X145.189 Y121.14 E.41951
G3 X145.369 Y121.01 I.184 J.066 E.00724
G1 X152.263 Y121.014 E.21185
G3 X152.422 Y121.199 I-.035 J.19 E.00809
G1 X152.42 Y134.821 E.41857
G3 X152.235 Y134.99 I-.195 J-.028 E.00835
G1 X145.306 Y134.978 E.21291
G3 X145.187 Y134.853 I.066 J-.181 E.0055
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.187 Y132.853 E-.76
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
G1 X146.064 Y132.931 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.62138
G1 F6223.421
M204 S6000
G1 X146.064 Y123.069 E.46482
M204 S10000
G1 X146.181 Y122.338 F42000
; LINE_WIDTH: 0.692345
G1 F5543.371
M204 S6000
G1 X150.821 Y122.338 E.24553
; LINE_WIDTH: 0.739239
G1 F5170.046
G1 X151.053 Y122.379 E.01336
G1 X151.075 Y122.473 E.00551
; LINE_WIDTH: 0.707878
G1 F5413.876
G1 X151.098 Y122.568 E.00526
; LINE_WIDTH: 0.663093
G1 F5804.835
G1 X151.12 Y122.662 E.00491
; LINE_WIDTH: 0.641027
G1 F6018.996
G1 X151.12 Y133.338 E.5203
G1 X151.098 Y133.432 E.00473
; LINE_WIDTH: 0.708
G1 F5412.889
G1 X151.075 Y133.526 E.00526
; LINE_WIDTH: 0.752711
G1 F5071.916
G1 X151.053 Y133.621 E.00561
; LINE_WIDTH: 0.754376
G1 F5060.049
G1 X150.937 Y133.642 E.00683
; LINE_WIDTH: 0.712952
G1 F5372.879
G1 X150.821 Y133.662 E.00643
; LINE_WIDTH: 0.692379
G1 F5543.076
G1 X146.181 Y133.662 E.24554
; OBJECT_ID: 405
; WIPE_START
G1 X148.181 Y133.662 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X141.257 Y130.451 Z7 F42000
G1 X125.779 Y123.273 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7032
M204 S6000
G1 X129.041 Y123.273 E.10821
G1 X129.041 Y132.727 E.31361
G1 X125.387 Y132.727 E.12121
G1 X125.387 Y123.273 E.31361
G1 X125.719 Y123.273 E.01102
M204 S250
G1 X125.779 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7032
M204 S5000
G1 X128.649 Y123.665 E.08819
G1 X128.649 Y132.335 E.2664
G1 X125.779 Y132.335 E.08819
G1 X125.779 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.778 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.702 Y131.028 Z7 F42000
G1 X124.808 Y134.191 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7032
M204 S6000
G1 X124.808 Y133.134 E.03505
G1 X129.448 Y133.134 E.15391
G1 X129.448 Y122.866 E.34062
G1 X124.808 Y122.866 E.15391
G1 X124.808 Y121.809 E.03504
G1 X130.453 Y121.809 E.18724
G1 X130.453 Y134.19 E.41071
G1 X124.868 Y134.191 E.18526
M204 S10000
G1 X124.401 Y134.598 F42000
G1 F7032
M204 S6000
G1 X124.401 Y121.402 E.43772
G1 X130.86 Y121.402 E.21424
G1 X130.86 Y134.598 E.43771
G1 X124.461 Y134.598 E.21226
M204 S250
G1 X124.009 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7032
M204 S5000
G1 X124.019 Y121.14 E.41951
G3 X124.199 Y121.01 I.184 J.066 E.00724
G1 X131.094 Y121.014 E.21185
G3 X131.252 Y121.199 I-.035 J.19 E.00809
G1 X131.251 Y134.821 E.41857
G3 X131.065 Y134.99 I-.195 J-.028 E.00835
G1 X124.136 Y134.978 E.21291
G3 X124.017 Y134.853 I.066 J-.181 E.0055
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.018 Y132.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7 I-.769 J.943 P1  F42000
G1 X125.012 Y133.662 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692379
G1 F5543.076
M204 S6000
G1 X129.651 Y133.662 E.24554
; LINE_WIDTH: 0.712952
G1 F5372.879
G1 X129.767 Y133.642 E.00643
; LINE_WIDTH: 0.754376
G1 F5060.049
G1 X129.883 Y133.621 E.00683
; LINE_WIDTH: 0.752711
G1 F5071.916
G1 X129.906 Y133.526 E.00561
; LINE_WIDTH: 0.708
G1 F5412.889
G1 X129.928 Y133.432 E.00526
; LINE_WIDTH: 0.641027
G1 F6018.996
G1 X129.95 Y133.338 E.00473
G1 X129.95 Y122.662 E.5203
; LINE_WIDTH: 0.663093
G1 F5804.835
G1 X129.928 Y122.568 E.00491
; LINE_WIDTH: 0.707878
G1 F5413.876
G1 X129.905 Y122.473 E.00526
; LINE_WIDTH: 0.739239
G1 F5170.046
G1 X129.883 Y122.379 E.00551
G1 X129.651 Y122.338 E.01336
; LINE_WIDTH: 0.692345
G1 F5543.371
G1 X125.012 Y122.338 E.24553
M204 S10000
G1 X124.894 Y123.069 F42000
; LINE_WIDTH: 0.62138
G1 F6223.421
M204 S6000
G1 X124.894 Y132.931 E.46482
; OBJECT_ID: 394
; WIPE_START
G1 X124.894 Y130.931 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X117.753 Y128.235 Z7 F42000
G1 X104.609 Y123.273 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7032
M204 S6000
G1 X107.871 Y123.273 E.10821
G1 X107.871 Y132.727 E.31361
G1 X104.217 Y132.727 E.12121
G1 X104.217 Y123.273 E.31361
G1 X104.549 Y123.273 E.01102
M204 S250
G1 X104.609 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7032
M204 S5000
G1 X107.479 Y123.665 E.08819
G1 X107.479 Y132.335 E.2664
G1 X104.609 Y132.335 E.08819
G1 X104.609 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X106.609 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.532 Y131.028 Z7 F42000
G1 X103.638 Y134.191 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7032
M204 S6000
G1 X103.638 Y133.134 E.03505
G1 X108.278 Y133.134 E.15391
G1 X108.278 Y122.866 E.34062
G1 X103.638 Y122.866 E.15391
G1 X103.638 Y121.809 E.03504
G1 X109.283 Y121.809 E.18724
G1 X109.283 Y134.19 E.41071
G1 X103.698 Y134.191 E.18526
M204 S10000
G1 X103.231 Y134.598 F42000
G1 F7032
M204 S6000
G1 X103.231 Y121.402 E.43772
G1 X109.69 Y121.402 E.21424
G1 X109.69 Y134.598 E.43771
G1 X103.291 Y134.598 E.21226
M204 S250
G1 X102.839 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7032
M204 S5000
G1 X102.85 Y121.14 E.41951
G3 X103.029 Y121.01 I.184 J.066 E.00724
G1 X109.924 Y121.014 E.21185
G3 X110.082 Y121.199 I-.035 J.19 E.00809
G1 X110.081 Y134.821 E.41857
G3 X109.895 Y134.99 I-.195 J-.028 E.00835
G1 X102.966 Y134.978 E.21291
G3 X102.848 Y134.853 I.066 J-.181 E.0055
; WIPE_START
G1 F9547.055
M204 S6000
G1 X102.848 Y132.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7 I-.769 J.943 P1  F42000
G1 X103.842 Y133.662 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692379
G1 F5543.076
M204 S6000
G1 X108.482 Y133.662 E.24554
; LINE_WIDTH: 0.712952
G1 F5372.879
G1 X108.598 Y133.642 E.00643
; LINE_WIDTH: 0.754376
G1 F5060.049
G1 X108.714 Y133.621 E.00683
; LINE_WIDTH: 0.752711
G1 F5071.916
G1 X108.736 Y133.526 E.00561
; LINE_WIDTH: 0.708
M73 P62 R8
G1 F5412.889
G1 X108.758 Y133.432 E.00526
; LINE_WIDTH: 0.641027
G1 F6018.996
G1 X108.781 Y133.338 E.00473
G1 X108.781 Y122.662 E.5203
; LINE_WIDTH: 0.663093
G1 F5804.835
G1 X108.758 Y122.568 E.00491
; LINE_WIDTH: 0.707878
G1 F5413.876
G1 X108.736 Y122.473 E.00526
; LINE_WIDTH: 0.739239
G1 F5170.046
G1 X108.713 Y122.379 E.00551
G1 X108.482 Y122.338 E.01336
; LINE_WIDTH: 0.692345
G1 F5543.371
G1 X103.842 Y122.338 E.24553
M204 S10000
G1 X103.724 Y123.069 F42000
; LINE_WIDTH: 0.62138
G1 F6223.421
M204 S6000
G1 X103.724 Y132.931 E.46482
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6223.421
G1 X103.724 Y130.931 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 34/72
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z7 I.212 J1.198 P1  F42000
G1 X146.948 Y123.273 Z7
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6990
M204 S6000
G1 X150.211 Y123.273 E.10821
G1 X150.211 Y132.727 E.31361
G1 X146.556 Y132.727 E.12121
G1 X146.556 Y123.273 E.31361
G1 X146.888 Y123.273 E.01102
M204 S250
G1 X146.948 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X149.818 Y123.665 E.08819
G1 X149.818 Y132.335 E.2664
G1 X146.948 Y132.335 E.08819
G1 X146.948 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.948 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.889 Y131.033 Z7.2 F42000
G1 X146.004 Y134.191 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6990
M204 S6000
G1 X146.004 Y133.134 E.03505
G1 X150.618 Y133.134 E.15303
G1 X150.618 Y122.866 E.34062
G1 X146.004 Y122.866 E.15303
G1 X146.004 Y121.809 E.03504
G1 X151.649 Y121.809 E.18724
G1 X151.649 Y134.19 E.41071
G1 X146.064 Y134.191 E.18526
M204 S10000
G1 X145.597 Y134.598 F42000
G1 F6990
M204 S6000
G1 X145.597 Y121.402 E.43772
G1 X152.056 Y121.402 E.21424
G1 X152.056 Y134.598 E.43771
G1 X145.657 Y134.598 E.21226
M204 S250
G1 X145.205 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X145.215 Y121.14 E.41951
G3 X145.395 Y121.01 I.184 J.066 E.00723
G1 X152.29 Y121.014 E.21186
G3 X152.448 Y121.199 I-.035 J.19 E.00808
G1 X152.447 Y134.821 E.41857
G3 X152.261 Y134.99 I-.195 J-.028 E.00835
G1 X145.332 Y134.978 E.21291
G3 X145.213 Y134.853 I.066 J-.181 E.0055
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.214 Y132.853 E-.76
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
G1 X146.077 Y132.931 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.59505
G1 F6520.204
M204 S6000
G1 X146.077 Y123.069 E.44366
M204 S10000
G1 X146.208 Y122.338 F42000
; LINE_WIDTH: 0.693011
G1 F5537.692
M204 S6000
G1 X150.821 Y122.338 E.24439
G1 X150.947 Y122.362 E.00677
; LINE_WIDTH: 0.765096
G1 F4984.938
G1 X151.072 Y122.386 E.00752
; LINE_WIDTH: 0.768954
G1 F4958.449
G1 X151.092 Y122.478 E.00558
; LINE_WIDTH: 0.728188
G1 F5253.418
G1 X151.113 Y122.57 E.00527
; LINE_WIDTH: 0.687423
G1 F5585.702
G1 X151.133 Y122.662 E.00495
; LINE_WIDTH: 0.667324
G1 F5765.505
G1 X151.133 Y133.338 E.54317
G1 X151.113 Y133.43 E.0048
; LINE_WIDTH: 0.728315
G1 F5252.451
G1 X151.093 Y133.522 E.00526
; LINE_WIDTH: 0.76901
G1 F4958.068
G1 X151.072 Y133.614 E.00558
; LINE_WIDTH: 0.765072
G1 F4985.105
G1 X150.947 Y133.638 E.00753
; LINE_WIDTH: 0.716517
G1 F5344.441
G1 X150.821 Y133.662 E.00702
; LINE_WIDTH: 0.692381
G1 F5543.062
G1 X146.208 Y133.662 E.24415
; OBJECT_ID: 405
; WIPE_START
G1 X148.208 Y133.662 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X141.282 Y130.454 Z7.2 F42000
G1 X125.779 Y123.273 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6990
M204 S6000
G1 X129.041 Y123.273 E.10821
G1 X129.041 Y132.727 E.31361
G1 X125.387 Y132.727 E.12121
G1 X125.387 Y123.273 E.31361
G1 X125.719 Y123.273 E.01102
M204 S250
G1 X125.779 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X128.649 Y123.665 E.08819
G1 X128.649 Y132.335 E.2664
G1 X125.779 Y132.335 E.08819
G1 X125.779 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.778 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.719 Y131.033 Z7.2 F42000
G1 X124.834 Y134.191 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6990
M204 S6000
G1 X124.834 Y133.134 E.03505
G1 X129.448 Y133.134 E.15303
G1 X129.448 Y122.866 E.34062
G1 X124.834 Y122.866 E.15303
G1 X124.834 Y121.809 E.03504
G1 X130.479 Y121.809 E.18724
G1 X130.479 Y134.19 E.41071
G1 X124.894 Y134.191 E.18526
M204 S10000
G1 X124.427 Y134.598 F42000
G1 F6990
M204 S6000
G1 X124.427 Y121.402 E.43772
G1 X130.886 Y121.402 E.21424
G1 X130.886 Y134.598 E.43771
G1 X124.487 Y134.598 E.21226
M204 S250
G1 X124.035 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X124.046 Y121.14 E.41951
G3 X124.225 Y121.01 I.184 J.066 E.00723
G1 X131.12 Y121.014 E.21186
G3 X131.278 Y121.199 I-.035 J.19 E.00808
G1 X131.277 Y134.821 E.41857
G3 X131.091 Y134.99 I-.195 J-.028 E.00835
G1 X124.162 Y134.978 E.21291
G3 X124.044 Y134.853 I.066 J-.181 E.0055
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.044 Y132.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.038 Y133.662 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692381
G1 F5543.062
M204 S6000
G1 X129.651 Y133.662 E.24415
; LINE_WIDTH: 0.716517
G1 F5344.441
G1 X129.777 Y133.638 E.00702
; LINE_WIDTH: 0.765072
G1 F4985.105
G1 X129.903 Y133.614 E.00753
; LINE_WIDTH: 0.76901
G1 F4958.068
G1 X129.923 Y133.522 E.00558
; LINE_WIDTH: 0.728315
G1 F5252.451
G1 X129.943 Y133.43 E.00526
; LINE_WIDTH: 0.667324
G1 F5765.505
G1 X129.964 Y133.338 E.0048
G1 X129.963 Y122.662 E.54317
; LINE_WIDTH: 0.687423
G1 F5585.702
G1 X129.943 Y122.57 E.00495
; LINE_WIDTH: 0.728188
G1 F5253.418
G1 X129.923 Y122.478 E.00527
; LINE_WIDTH: 0.768954
G1 F4958.449
G1 X129.902 Y122.386 E.00558
; LINE_WIDTH: 0.765096
G1 F4984.938
G1 X129.777 Y122.362 E.00752
; LINE_WIDTH: 0.693011
G1 F5537.692
G1 X129.651 Y122.338 E.00677
G1 X125.038 Y122.338 E.24439
M204 S10000
G1 X124.907 Y123.069 F42000
; LINE_WIDTH: 0.59505
G1 F6520.204
M204 S6000
G1 X124.907 Y132.931 E.44366
; OBJECT_ID: 394
; WIPE_START
G1 X124.907 Y130.931 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X117.766 Y128.236 Z7.2 F42000
G1 X104.609 Y123.273 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6990
M204 S6000
G1 X107.871 Y123.273 E.10821
G1 X107.871 Y132.727 E.31361
G1 X104.217 Y132.727 E.12121
G1 X104.217 Y123.273 E.31361
G1 X104.549 Y123.273 E.01102
M204 S250
G1 X104.609 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X107.479 Y123.665 E.08819
G1 X107.479 Y132.335 E.2664
G1 X104.609 Y132.335 E.08819
G1 X104.609 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X106.609 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.55 Y131.033 Z7.2 F42000
G1 X103.665 Y134.191 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6990
M204 S6000
G1 X103.665 Y133.134 E.03505
G1 X108.278 Y133.134 E.15303
G1 X108.278 Y122.866 E.34062
G1 X103.665 Y122.866 E.15303
G1 X103.665 Y121.809 E.03504
G1 X109.309 Y121.809 E.18724
G1 X109.31 Y134.19 E.41071
G1 X103.725 Y134.191 E.18526
M204 S10000
G1 X103.258 Y134.598 F42000
G1 F6990
M204 S6000
G1 X103.258 Y121.402 E.43772
G1 X109.716 Y121.402 E.21424
G1 X109.717 Y134.598 E.43771
G1 X103.318 Y134.598 E.21226
M204 S250
G1 X102.866 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X102.876 Y121.14 E.41951
G3 X103.055 Y121.01 I.184 J.066 E.00723
G1 X109.95 Y121.014 E.21186
G3 X110.108 Y121.199 I-.035 J.19 E.00808
G1 X110.107 Y134.821 E.41857
G3 X109.922 Y134.99 I-.195 J-.028 E.00835
G1 X102.992 Y134.978 E.21291
G3 X102.874 Y134.853 I.066 J-.181 E.0055
; WIPE_START
G1 F9547.055
M204 S6000
G1 X102.874 Y132.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.868 Y133.662 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692381
G1 F5543.062
M204 S6000
G1 X108.482 Y133.662 E.24415
; LINE_WIDTH: 0.716517
G1 F5344.441
G1 X108.607 Y133.638 E.00702
; LINE_WIDTH: 0.765072
G1 F4985.105
G1 X108.733 Y133.614 E.00753
; LINE_WIDTH: 0.76901
G1 F4958.068
G1 X108.753 Y133.522 E.00558
; LINE_WIDTH: 0.728315
G1 F5252.451
G1 X108.773 Y133.43 E.00526
; LINE_WIDTH: 0.667324
G1 F5765.505
G1 X108.794 Y133.338 E.0048
G1 X108.794 Y122.662 E.54317
; LINE_WIDTH: 0.687423
G1 F5585.702
G1 X108.773 Y122.57 E.00495
; LINE_WIDTH: 0.728188
G1 F5253.418
G1 X108.753 Y122.478 E.00527
; LINE_WIDTH: 0.768954
G1 F4958.449
G1 X108.733 Y122.386 E.00558
; LINE_WIDTH: 0.765096
G1 F4984.938
G1 X108.607 Y122.362 E.00752
; LINE_WIDTH: 0.693011
G1 F5537.692
G1 X108.482 Y122.338 E.00677
G1 X103.868 Y122.338 E.24439
M204 S10000
G1 X103.737 Y123.069 F42000
; LINE_WIDTH: 0.59505
G1 F6520.204
M204 S6000
G1 X103.737 Y132.931 E.44366
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6520.204
G1 X103.737 Y130.931 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 35/72
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z7.2 I.212 J1.198 P1  F42000
G1 X146.948 Y123.273 Z7.2
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6986
M204 S6000
G1 X150.211 Y123.273 E.10821
G1 X150.211 Y132.727 E.31361
G1 X146.556 Y132.727 E.12121
G1 X146.556 Y123.273 E.31361
G1 X146.888 Y123.273 E.01102
M204 S250
G1 X146.948 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6986
M204 S5000
G1 X149.818 Y123.665 E.08819
G1 X149.818 Y132.335 E.2664
G1 X146.948 Y132.335 E.08819
G1 X146.948 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.948 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.906 Y131.037 Z7.4 F42000
G1 X146.031 Y134.191 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6986
M204 S6000
G1 X146.031 Y133.134 E.03505
G1 X150.618 Y133.134 E.15216
G1 X150.618 Y122.866 E.34062
G1 X146.031 Y122.866 E.15216
G1 X146.031 Y121.809 E.03504
G1 X151.675 Y121.809 E.18724
G1 X151.675 Y134.19 E.41071
G1 X146.091 Y134.191 E.18526
M204 S10000
G1 X145.624 Y134.598 F42000
G1 F6986
M204 S6000
G1 X145.624 Y121.402 E.43772
G1 X152.082 Y121.402 E.21424
G1 X152.082 Y134.598 E.43771
G1 X145.684 Y134.598 E.21226
M204 S250
G1 X145.231 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6986
M204 S5000
G1 X145.242 Y121.14 E.41951
G3 X145.421 Y121.01 I.184 J.066 E.00724
M73 P63 R8
G1 X152.316 Y121.014 E.21185
G3 X152.474 Y121.199 I-.035 J.19 E.00808
G1 X152.473 Y134.821 E.41857
G3 X152.287 Y134.99 I-.197 J-.031 E.00833
G1 X145.358 Y134.978 E.21291
G3 X145.24 Y134.853 I.066 J-.182 E.0055
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.24 Y132.853 E-.76
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
G1 X146.09 Y132.931 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.56872
G1 F6846.71
M204 S6000
G1 X146.09 Y123.069 E.42251
M204 S10000
G1 X146.234 Y122.338 F42000
; LINE_WIDTH: 0.692736
G1 F5540.035
M204 S6000
G1 X150.821 Y122.338 E.24289
G1 X150.911 Y122.356 E.00486
; LINE_WIDTH: 0.748416
G1 F5102.792
G1 X151.001 Y122.375 E.00528
; LINE_WIDTH: 0.785742
G1 F4846.386
G1 X151.091 Y122.394 E.00556
; LINE_WIDTH: 0.785907
G1 F4845.306
G1 X151.109 Y122.483 E.00554
; LINE_WIDTH: 0.748889
G1 F5099.379
G1 X151.128 Y122.573 E.00526
; LINE_WIDTH: 0.71187
G1 F5381.573
G1 X151.146 Y122.662 E.00499
; LINE_WIDTH: 0.693642
G1 F5532.318
G1 X151.146 Y133.338 E.56607
G1 X151.128 Y133.427 E.00485
; LINE_WIDTH: 0.749013
G1 F5098.48
G1 X151.11 Y133.517 E.00526
; LINE_WIDTH: 0.785961
G1 F4844.959
G1 X151.091 Y133.606 E.00553
; LINE_WIDTH: 0.785731
G1 F4846.454
G1 X151.001 Y133.625 E.00556
; LINE_WIDTH: 0.748335
G1 F5103.381
G1 X150.911 Y133.644 E.00528
; LINE_WIDTH: 0.710939
G1 F5389.075
G1 X150.821 Y133.662 E.005
; LINE_WIDTH: 0.692383
G1 F5543.048
G1 X146.234 Y133.662 E.24276
; OBJECT_ID: 405
; WIPE_START
G1 X148.234 Y133.662 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X141.307 Y130.457 Z7.4 F42000
G1 X125.779 Y123.273 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6986
M204 S6000
G1 X129.041 Y123.273 E.10821
G1 X129.041 Y132.727 E.31361
G1 X125.387 Y132.727 E.12121
G1 X125.387 Y123.273 E.31361
G1 X125.719 Y123.273 E.01102
M204 S250
G1 X125.779 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6986
M204 S5000
G1 X128.649 Y123.665 E.08819
G1 X128.649 Y132.335 E.2664
G1 X125.779 Y132.335 E.08819
G1 X125.779 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.778 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.736 Y131.037 Z7.4 F42000
G1 X124.861 Y134.191 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6986
M204 S6000
G1 X124.861 Y133.134 E.03505
G1 X129.448 Y133.134 E.15216
G1 X129.448 Y122.866 E.34062
G1 X124.861 Y122.866 E.15216
G1 X124.861 Y121.809 E.03504
G1 X130.505 Y121.809 E.18724
G1 X130.506 Y134.19 E.41071
G1 X124.921 Y134.191 E.18526
M204 S10000
G1 X124.454 Y134.598 F42000
G1 F6986
M204 S6000
G1 X124.454 Y121.402 E.43772
G1 X130.912 Y121.402 E.21424
G1 X130.913 Y134.598 E.43771
G1 X124.514 Y134.598 E.21226
M204 S250
G1 X124.062 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6986
M204 S5000
G1 X124.072 Y121.14 E.41951
G3 X124.252 Y121.01 I.184 J.066 E.00724
G1 X131.146 Y121.014 E.21185
G3 X131.304 Y121.199 I-.035 J.19 E.00808
G1 X131.303 Y134.821 E.41857
G3 X131.118 Y134.99 I-.197 J-.031 E.00833
G1 X124.189 Y134.978 E.21291
G3 X124.07 Y134.853 I.066 J-.182 E.0055
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.07 Y132.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.064 Y133.662 Z7.4 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692383
G1 F5543.048
M204 S6000
G1 X129.651 Y133.662 E.24276
; LINE_WIDTH: 0.710939
G1 F5389.075
G1 X129.741 Y133.644 E.005
; LINE_WIDTH: 0.748335
G1 F5103.381
G1 X129.831 Y133.625 E.00528
; LINE_WIDTH: 0.785731
G1 F4846.454
G1 X129.921 Y133.606 E.00556
; LINE_WIDTH: 0.785961
G1 F4844.959
G1 X129.94 Y133.517 E.00553
; LINE_WIDTH: 0.749013
G1 F5098.48
G1 X129.958 Y133.427 E.00526
; LINE_WIDTH: 0.693642
G1 F5532.318
G1 X129.977 Y133.338 E.00485
G1 X129.977 Y122.662 E.56607
; LINE_WIDTH: 0.71187
G1 F5381.573
G1 X129.958 Y122.573 E.00499
; LINE_WIDTH: 0.748889
G1 F5099.379
G1 X129.94 Y122.483 E.00526
; LINE_WIDTH: 0.785907
G1 F4845.306
G1 X129.921 Y122.394 E.00554
; LINE_WIDTH: 0.785742
G1 F4846.386
G1 X129.831 Y122.375 E.00556
; LINE_WIDTH: 0.748416
G1 F5102.792
G1 X129.741 Y122.356 E.00528
; LINE_WIDTH: 0.692736
G1 F5540.035
G1 X129.651 Y122.338 E.00486
G1 X125.064 Y122.338 E.24289
M204 S10000
G1 X124.92 Y123.069 F42000
; LINE_WIDTH: 0.56872
G1 F6846.71
M204 S6000
G1 X124.92 Y132.931 E.42251
; OBJECT_ID: 394
; WIPE_START
G1 X124.92 Y130.931 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X117.778 Y128.238 Z7.4 F42000
G1 X104.609 Y123.273 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6986
M204 S6000
G1 X107.871 Y123.273 E.10821
G1 X107.871 Y132.727 E.31361
G1 X104.217 Y132.727 E.12121
G1 X104.217 Y123.273 E.31361
G1 X104.549 Y123.273 E.01102
M204 S250
G1 X104.609 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6986
M204 S5000
G1 X107.479 Y123.665 E.08819
G1 X107.479 Y132.335 E.2664
G1 X104.609 Y132.335 E.08819
G1 X104.609 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X106.609 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.567 Y131.037 Z7.4 F42000
G1 X103.691 Y134.191 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6986
M204 S6000
G1 X103.691 Y133.134 E.03505
G1 X108.278 Y133.134 E.15216
G1 X108.278 Y122.866 E.34062
G1 X103.691 Y122.866 E.15216
G1 X103.691 Y121.809 E.03504
G1 X109.336 Y121.809 E.18724
G1 X109.336 Y134.19 E.41071
M73 P63 R7
G1 X103.751 Y134.191 E.18526
M204 S10000
G1 X103.284 Y134.598 F42000
G1 F6986
M204 S6000
G1 X103.284 Y121.402 E.43772
G1 X109.743 Y121.402 E.21424
G1 X109.743 Y134.598 E.43771
G1 X103.344 Y134.598 E.21226
M204 S250
G1 X102.892 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6986
M204 S5000
G1 X102.902 Y121.14 E.41951
G3 X103.082 Y121.01 I.184 J.066 E.00724
G1 X109.977 Y121.014 E.21185
G3 X110.135 Y121.199 I-.035 J.19 E.00808
G1 X110.133 Y134.821 E.41857
G3 X109.948 Y134.99 I-.197 J-.031 E.00833
G1 X103.019 Y134.978 E.21291
G3 X102.9 Y134.853 I.066 J-.182 E.0055
; WIPE_START
G1 F9547.055
M204 S6000
G1 X102.901 Y132.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.895 Y133.662 Z7.4 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692383
G1 F5543.048
M204 S6000
G1 X108.482 Y133.662 E.24276
; LINE_WIDTH: 0.710939
G1 F5389.075
G1 X108.572 Y133.644 E.005
; LINE_WIDTH: 0.748335
G1 F5103.381
G1 X108.662 Y133.625 E.00528
; LINE_WIDTH: 0.785731
G1 F4846.454
G1 X108.752 Y133.606 E.00556
; LINE_WIDTH: 0.785961
G1 F4844.959
G1 X108.77 Y133.517 E.00553
; LINE_WIDTH: 0.749013
G1 F5098.48
G1 X108.788 Y133.427 E.00526
; LINE_WIDTH: 0.693642
G1 F5532.318
G1 X108.807 Y133.338 E.00485
G1 X108.807 Y122.662 E.56607
; LINE_WIDTH: 0.71187
G1 F5381.573
G1 X108.788 Y122.573 E.00499
; LINE_WIDTH: 0.748889
G1 F5099.379
G1 X108.77 Y122.483 E.00526
; LINE_WIDTH: 0.785907
G1 F4845.306
G1 X108.751 Y122.394 E.00554
; LINE_WIDTH: 0.785742
G1 F4846.386
G1 X108.661 Y122.375 E.00556
; LINE_WIDTH: 0.748416
G1 F5102.792
G1 X108.572 Y122.356 E.00528
; LINE_WIDTH: 0.692736
G1 F5540.035
G1 X108.482 Y122.338 E.00486
G1 X103.895 Y122.338 E.24289
M204 S10000
G1 X103.75 Y123.069 F42000
; LINE_WIDTH: 0.56872
G1 F6846.71
M204 S6000
G1 X103.75 Y132.931 E.42251
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6846.71
G1 X103.75 Y130.931 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 36/72
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z7.4 I.212 J1.198 P1  F42000
G1 X146.948 Y123.273 Z7.4
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6978
M204 S6000
G1 X150.211 Y123.273 E.10821
G1 X150.211 Y132.727 E.31361
G1 X146.556 Y132.727 E.12121
G1 X146.556 Y123.273 E.31361
G1 X146.888 Y123.273 E.01102
M204 S250
G1 X146.948 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6978
M204 S5000
G1 X149.818 Y123.665 E.08819
G1 X149.818 Y132.335 E.2664
G1 X146.948 Y132.335 E.08819
G1 X146.948 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.948 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.923 Y131.042 Z7.6 F42000
G1 X146.057 Y134.191 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6978
M204 S6000
G1 X146.057 Y133.134 E.03505
G1 X150.618 Y133.134 E.15129
G1 X150.618 Y122.866 E.34062
G1 X146.057 Y122.866 E.15129
G1 X146.057 Y121.809 E.03505
G1 X151.701 Y121.809 E.18724
G1 X151.702 Y134.19 E.41071
G1 X146.117 Y134.191 E.18526
M204 S10000
G1 X145.65 Y134.598 F42000
G1 F6978
M204 S6000
G1 X145.65 Y121.402 E.43772
G1 X152.108 Y121.402 E.21424
G1 X152.109 Y134.598 E.43772
G1 X145.71 Y134.598 E.21226
M204 S250
G1 X145.258 Y134.793 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6978
M204 S5000
G1 X145.268 Y121.14 E.41951
G3 X145.448 Y121.01 I.184 J.066 E.00723
G1 X152.343 Y121.014 E.21187
G3 X152.501 Y121.199 I-.036 J.19 E.00807
G1 X152.499 Y134.821 E.41857
G3 X152.314 Y134.99 I-.195 J-.029 E.00835
G1 X145.384 Y134.978 E.21291
G3 X145.266 Y134.853 I.067 J-.181 E.00549
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.266 Y132.853 E-.76
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
G1 X146.103 Y132.931 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.54238
G1 F6978
M204 S6000
G1 X146.103 Y123.069 E.40134
M204 S10000
G1 X146.26 Y122.338 F42000
; LINE_WIDTH: 0.692388
G1 F5543
M204 S6000
G1 X150.821 Y122.338 E.24136
M204 S10000
G1 X150.821 Y133.662 F42000
; LINE_WIDTH: 0.692391
G1 F5542.976
M204 S6000
G1 X146.26 Y133.662 E.24136
M204 S10000
G1 X151.261 Y133.75 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51649
G1 F6978
M204 S6000
G1 X151.261 Y133.112 E.02461
; LINE_WIDTH: 0.53684
G1 X151.241 Y133.05 E.00263
; LINE_WIDTH: 0.57752
G1 F6734.007
G1 X151.221 Y132.988 E.00285
; LINE_WIDTH: 0.6182
G1 F6257.822
G1 X151.2 Y132.926 E.00306
; LINE_WIDTH: 0.65888
G1 F5844.535
G1 X151.18 Y132.864 E.00328
; LINE_WIDTH: 0.719674
G1 F5319.517
G1 X151.16 Y132.802 E.0036
G1 X151.16 Y123.198 E.52965
; LINE_WIDTH: 0.699372
G1 F5484.026
G1 X151.18 Y123.136 E.00349
; LINE_WIDTH: 0.658676
G1 F5846.472
G1 X151.2 Y123.074 E.00328
; LINE_WIDTH: 0.61798
G1 F6260.216
G1 X151.221 Y123.012 E.00306
; LINE_WIDTH: 0.577284
G1 F6736.981
G1 X151.241 Y122.949 E.00284
; LINE_WIDTH: 0.518316
G1 F6978
G1 X151.261 Y122.887 E.00253
G1 X151.261 Y122.309 E.02239
; OBJECT_ID: 405
; WIPE_START
G1 F7572.645
G1 X151.261 Y122.887 E-.68282
G1 X151.241 Y122.949 E-.07718
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X143.609 Y123.046 Z7.6 F42000
G1 X125.779 Y123.273 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6978
M204 S6000
G1 X129.041 Y123.273 E.10821
G1 X129.041 Y132.727 E.31361
G1 X125.387 Y132.727 E.12121
G1 X125.387 Y123.273 E.31361
G1 X125.719 Y123.273 E.01102
M204 S250
G1 X125.779 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6978
M204 S5000
G1 X128.649 Y123.665 E.08819
G1 X128.649 Y132.335 E.2664
G1 X125.779 Y132.335 E.08819
M73 P64 R7
G1 X125.779 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.778 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.753 Y131.042 Z7.6 F42000
G1 X124.887 Y134.191 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6978
M204 S6000
G1 X124.887 Y133.134 E.03505
G1 X129.448 Y133.134 E.15129
G1 X129.448 Y122.866 E.34062
G1 X124.887 Y122.866 E.15129
G1 X124.887 Y121.809 E.03505
G1 X130.532 Y121.809 E.18724
G1 X130.532 Y134.19 E.41071
G1 X124.947 Y134.191 E.18526
M204 S10000
G1 X124.48 Y134.598 F42000
G1 F6978
M204 S6000
G1 X124.48 Y121.402 E.43772
G1 X130.939 Y121.402 E.21424
G1 X130.939 Y134.598 E.43772
G1 X124.54 Y134.598 E.21226
M204 S250
G1 X124.088 Y134.793 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6978
M204 S5000
G1 X124.098 Y121.14 E.41951
G3 X124.278 Y121.01 I.184 J.066 E.00723
G1 X131.173 Y121.014 E.21187
G3 X131.331 Y121.199 I-.036 J.19 E.00807
G1 X131.33 Y134.821 E.41857
G3 X131.144 Y134.99 I-.195 J-.029 E.00835
G1 X124.215 Y134.978 E.21291
G3 X124.096 Y134.853 I.067 J-.181 E.00549
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.097 Y132.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.091 Y133.662 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692391
G1 F5542.976
M204 S6000
G1 X129.651 Y133.662 E.24136
M204 S10000
G1 X130.092 Y133.75 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51649
G1 F6978
M204 S6000
G1 X130.092 Y133.112 E.02461
; LINE_WIDTH: 0.53684
G1 X130.071 Y133.05 E.00263
; LINE_WIDTH: 0.57752
G1 F6734.007
G1 X130.051 Y132.988 E.00285
; LINE_WIDTH: 0.6182
G1 F6257.822
G1 X130.031 Y132.926 E.00306
; LINE_WIDTH: 0.65888
G1 F5844.535
G1 X130.01 Y132.864 E.00328
; LINE_WIDTH: 0.719674
G1 F5319.517
G1 X129.99 Y132.802 E.0036
G1 X129.99 Y123.198 E.52965
; LINE_WIDTH: 0.699372
G1 F5484.026
G1 X130.01 Y123.136 E.00349
; LINE_WIDTH: 0.658676
G1 F5846.472
G1 X130.03 Y123.074 E.00328
; LINE_WIDTH: 0.61798
G1 F6260.216
G1 X130.051 Y123.012 E.00306
; LINE_WIDTH: 0.577284
G1 F6736.981
G1 X130.071 Y122.949 E.00284
; LINE_WIDTH: 0.518316
G1 F6978
G1 X130.091 Y122.887 E.00253
G1 X130.091 Y122.309 E.02239
M204 S10000
G1 X129.651 Y122.338 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.692388
G1 F5543
M204 S6000
G1 X125.091 Y122.338 E.24136
M204 S10000
G1 X124.933 Y123.069 F42000
; LINE_WIDTH: 0.54238
G1 F6978
M204 S6000
G1 X124.933 Y132.931 E.40134
; OBJECT_ID: 394
; WIPE_START
G1 F7207.785
G1 X124.933 Y130.931 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X117.791 Y128.24 Z7.6 F42000
G1 X104.609 Y123.273 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6978
M204 S6000
G1 X107.871 Y123.273 E.10821
G1 X107.871 Y132.727 E.31361
G1 X104.217 Y132.727 E.12121
G1 X104.217 Y123.273 E.31361
G1 X104.549 Y123.273 E.01102
M204 S250
G1 X104.609 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6978
M204 S5000
G1 X107.479 Y123.665 E.08819
G1 X107.479 Y132.335 E.2664
G1 X104.609 Y132.335 E.08819
G1 X104.609 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X106.609 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.584 Y131.042 Z7.6 F42000
G1 X103.717 Y134.191 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6978
M204 S6000
G1 X103.717 Y133.134 E.03505
G1 X108.278 Y133.134 E.15129
G1 X108.278 Y122.866 E.34062
G1 X103.717 Y122.866 E.15129
G1 X103.717 Y121.809 E.03505
G1 X109.362 Y121.809 E.18724
G1 X109.362 Y134.19 E.41071
G1 X103.777 Y134.191 E.18526
M204 S10000
G1 X103.31 Y134.598 F42000
G1 F6978
M204 S6000
G1 X103.31 Y121.402 E.43772
G1 X109.769 Y121.402 E.21424
G1 X109.769 Y134.598 E.43772
G1 X103.37 Y134.598 E.21226
M204 S250
G1 X102.918 Y134.793 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6978
M204 S5000
G1 X102.929 Y121.14 E.41951
G3 X103.108 Y121.01 I.184 J.066 E.00723
G1 X110.003 Y121.014 E.21187
G3 X110.161 Y121.199 I-.036 J.19 E.00807
G1 X110.16 Y134.821 E.41857
G3 X109.974 Y134.99 I-.195 J-.029 E.00835
G1 X103.045 Y134.978 E.21291
G3 X102.927 Y134.853 I.067 J-.181 E.00549
; WIPE_START
G1 F9547.055
M204 S6000
G1 X102.927 Y132.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.921 Y133.662 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692391
G1 F5542.976
M204 S6000
G1 X108.482 Y133.662 E.24136
M204 S10000
G1 X108.922 Y133.75 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51649
G1 F6978
M204 S6000
G1 X108.922 Y133.112 E.02461
; LINE_WIDTH: 0.53684
G1 X108.901 Y133.05 E.00263
; LINE_WIDTH: 0.57752
G1 F6734.007
G1 X108.881 Y132.988 E.00285
; LINE_WIDTH: 0.6182
G1 F6257.822
G1 X108.861 Y132.926 E.00306
; LINE_WIDTH: 0.65888
G1 F5844.535
G1 X108.84 Y132.864 E.00328
; LINE_WIDTH: 0.719674
G1 F5319.517
G1 X108.82 Y132.802 E.0036
G1 X108.82 Y123.198 E.52965
; LINE_WIDTH: 0.699372
G1 F5484.026
G1 X108.84 Y123.136 E.00349
; LINE_WIDTH: 0.658676
G1 F5846.472
G1 X108.861 Y123.074 E.00328
; LINE_WIDTH: 0.61798
G1 F6260.216
G1 X108.881 Y123.012 E.00306
; LINE_WIDTH: 0.577284
G1 F6736.981
G1 X108.901 Y122.949 E.00284
; LINE_WIDTH: 0.518316
G1 F6978
G1 X108.922 Y122.887 E.00253
G1 X108.922 Y122.309 E.02239
M204 S10000
G1 X108.482 Y122.338 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.692388
G1 F5543
M204 S6000
G1 X103.921 Y122.338 E.24136
M204 S10000
G1 X103.764 Y123.069 F42000
; LINE_WIDTH: 0.54238
G1 F6978
M204 S6000
G1 X103.764 Y132.931 E.40134
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7207.785
G1 X103.764 Y130.931 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 37/72
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z7.6 I.212 J1.198 P1  F42000
G1 X146.948 Y123.273 Z7.6
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6990
M204 S6000
G1 X150.211 Y123.273 E.10821
G1 X150.211 Y132.727 E.31361
G1 X146.556 Y132.727 E.12121
G1 X146.556 Y123.273 E.31361
G1 X146.888 Y123.273 E.01102
M204 S250
G1 X146.948 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X149.818 Y123.665 E.08819
G1 X149.818 Y132.335 E.2664
G1 X146.948 Y132.335 E.08819
G1 X146.948 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.948 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.94 Y131.047 Z7.8 F42000
G1 X146.083 Y134.191 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6990
M204 S6000
G1 X146.083 Y133.134 E.03505
G1 X150.618 Y133.134 E.15041
G1 X150.618 Y122.866 E.34062
G1 X146.083 Y122.866 E.15041
G1 X146.083 Y121.809 E.03505
G1 X151.728 Y121.809 E.18724
G1 X151.728 Y134.19 E.41071
G1 X146.143 Y134.191 E.18526
M204 S10000
G1 X145.676 Y134.598 F42000
G1 F6990
M204 S6000
G1 X145.676 Y121.402 E.43772
G1 X152.135 Y121.402 E.21424
G1 X152.135 Y134.598 E.43772
G1 X145.736 Y134.598 E.21226
M204 S250
G1 X145.284 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X145.294 Y121.14 E.41951
G3 X145.474 Y121.01 I.184 J.066 E.00724
G1 X152.369 Y121.014 E.21187
G3 X152.527 Y121.199 I-.036 J.19 E.00807
G1 X152.526 Y134.821 E.41857
G3 X152.34 Y134.99 I-.195 J-.028 E.00834
G1 X145.411 Y134.978 E.21291
G3 X145.292 Y134.853 I.066 J-.181 E.0055
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.293 Y132.853 E-.76
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
G1 X146.116 Y132.931 F42000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51605
G1 F6990
M204 S6000
G1 X146.116 Y123.069 E.38018
M204 S10000
G1 X146.287 Y122.338 F42000
; LINE_WIDTH: 0.692401
G1 F5542.89
M204 S6000
G1 X150.821 Y122.338 E.23997
M204 S10000
G1 X150.821 Y133.662 F42000
; LINE_WIDTH: 0.692391
G1 F5542.975
M204 S6000
G1 X146.287 Y133.662 E.23997
M204 S10000
G1 X151.275 Y133.737 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.54282
G1 F6990
M204 S6000
G1 X151.274 Y133.112 E.02544
; LINE_WIDTH: 0.563162
G1 F6919.857
G1 X151.254 Y133.049 E.00284
; LINE_WIDTH: 0.603846
G1 F6417.959
G1 X151.234 Y132.985 E.00306
; LINE_WIDTH: 0.64453
G1 F5983.943
G1 X151.213 Y132.921 E.00328
; LINE_WIDTH: 0.685214
G1 F5604.91
G1 X151.193 Y132.857 E.0035
; LINE_WIDTH: 0.746
G1 F5120.33
G1 X151.173 Y132.794 E.00383
G1 X151.173 Y123.206 E.54928
; LINE_WIDTH: 0.725694
G1 F5272.609
G1 X151.193 Y123.142 E.00372
; LINE_WIDTH: 0.685002
G1 F5606.761
G1 X151.213 Y123.079 E.0035
; LINE_WIDTH: 0.64431
G1 F5986.132
G1 X151.234 Y123.015 E.00328
; LINE_WIDTH: 0.603618
G1 F6420.569
G1 X151.254 Y122.951 E.00306
; LINE_WIDTH: 0.544736
G1 F6990
G1 X151.274 Y122.887 E.00274
G1 X151.274 Y122.323 E.0231
; OBJECT_ID: 405
; WIPE_START
G1 F7173.943
G1 X151.274 Y122.887 E-.67946
G1 X151.254 Y122.951 E-.08054
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X143.622 Y123.048 Z7.8 F42000
G1 X125.779 Y123.273 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6990
M204 S6000
G1 X129.041 Y123.273 E.10821
G1 X129.041 Y132.727 E.31361
G1 X125.387 Y132.727 E.12121
G1 X125.387 Y123.273 E.31361
G1 X125.719 Y123.273 E.01102
M204 S250
G1 X125.779 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X128.649 Y123.665 E.08819
G1 X128.649 Y132.335 E.2664
G1 X125.779 Y132.335 E.08819
G1 X125.779 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.778 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.771 Y131.047 Z7.8 F42000
G1 X124.913 Y134.191 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6990
M204 S6000
G1 X124.913 Y133.134 E.03505
G1 X129.448 Y133.134 E.15041
G1 X129.448 Y122.866 E.34062
G1 X124.913 Y122.866 E.15041
G1 X124.913 Y121.809 E.03505
G1 X130.558 Y121.809 E.18724
G1 X130.558 Y134.19 E.41071
G1 X124.973 Y134.191 E.18526
M204 S10000
G1 X124.506 Y134.598 F42000
G1 F6990
M204 S6000
G1 X124.506 Y121.402 E.43772
G1 X130.965 Y121.402 E.21424
G1 X130.965 Y134.598 E.43772
G1 X124.566 Y134.598 E.21226
M204 S250
G1 X124.114 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X124.125 Y121.14 E.41951
G3 X124.304 Y121.01 I.184 J.066 E.00724
G1 X131.199 Y121.014 E.21187
G3 X131.357 Y121.199 I-.036 J.19 E.00807
G1 X131.356 Y134.821 E.41857
G3 X131.17 Y134.99 I-.195 J-.028 E.00834
G1 X124.241 Y134.978 E.21291
G3 X124.123 Y134.853 I.066 J-.181 E.0055
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.123 Y132.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.117 Y133.662 Z7.8 F42000
M73 P65 R7
G1 Z7.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692391
G1 F5542.975
M204 S6000
G1 X129.651 Y133.662 E.23997
M204 S10000
G1 X130.105 Y133.737 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.54282
G1 F6990
M204 S6000
G1 X130.105 Y133.112 E.02544
; LINE_WIDTH: 0.563162
G1 F6919.857
G1 X130.084 Y133.049 E.00284
; LINE_WIDTH: 0.603846
G1 F6417.959
G1 X130.064 Y132.985 E.00306
; LINE_WIDTH: 0.64453
G1 F5983.943
G1 X130.044 Y132.921 E.00328
; LINE_WIDTH: 0.685214
G1 F5604.91
G1 X130.023 Y132.857 E.0035
; LINE_WIDTH: 0.746
G1 F5120.33
G1 X130.003 Y132.794 E.00383
G1 X130.003 Y123.206 E.54928
; LINE_WIDTH: 0.725694
G1 F5272.609
G1 X130.023 Y123.142 E.00372
; LINE_WIDTH: 0.685002
G1 F5606.761
G1 X130.044 Y123.079 E.0035
; LINE_WIDTH: 0.64431
G1 F5986.132
G1 X130.064 Y123.015 E.00328
; LINE_WIDTH: 0.603618
G1 F6420.569
G1 X130.084 Y122.951 E.00306
; LINE_WIDTH: 0.544736
G1 F6990
G1 X130.105 Y122.887 E.00274
G1 X130.105 Y122.323 E.0231
M204 S10000
G1 X129.651 Y122.338 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.692401
G1 F5542.89
M204 S6000
G1 X125.117 Y122.338 E.23997
M204 S10000
G1 X124.947 Y123.069 F42000
; LINE_WIDTH: 0.51605
G1 F6990
M204 S6000
G1 X124.947 Y132.931 E.38018
; OBJECT_ID: 394
; WIPE_START
G1 F7608.903
G1 X124.947 Y130.931 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X117.804 Y128.241 Z7.8 F42000
G1 X104.609 Y123.273 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6990
M204 S6000
G1 X107.871 Y123.273 E.10821
G1 X107.871 Y132.727 E.31361
G1 X104.217 Y132.727 E.12121
G1 X104.217 Y123.273 E.31361
G1 X104.549 Y123.273 E.01102
M204 S250
G1 X104.609 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X107.479 Y123.665 E.08819
G1 X107.479 Y132.335 E.2664
G1 X104.609 Y132.335 E.08819
G1 X104.609 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X106.609 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.601 Y131.047 Z7.8 F42000
G1 X103.744 Y134.191 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6990
M204 S6000
G1 X103.744 Y133.134 E.03505
G1 X108.278 Y133.134 E.15041
G1 X108.278 Y122.866 E.34062
G1 X103.744 Y122.866 E.15041
G1 X103.744 Y121.809 E.03505
G1 X109.388 Y121.809 E.18724
G1 X109.389 Y134.19 E.41071
G1 X103.804 Y134.191 E.18526
M204 S10000
G1 X103.337 Y134.598 F42000
G1 F6990
M204 S6000
G1 X103.337 Y121.402 E.43772
G1 X109.795 Y121.402 E.21424
G1 X109.796 Y134.598 E.43772
G1 X103.397 Y134.598 E.21226
M204 S250
G1 X102.945 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X102.955 Y121.14 E.41951
G3 X103.135 Y121.01 I.184 J.066 E.00724
G1 X110.03 Y121.014 E.21187
G3 X110.187 Y121.199 I-.036 J.19 E.00807
G1 X110.186 Y134.821 E.41857
G3 X110.001 Y134.99 I-.195 J-.028 E.00834
G1 X103.072 Y134.978 E.21291
G3 X102.953 Y134.853 I.066 J-.181 E.0055
; WIPE_START
G1 F9547.055
M204 S6000
G1 X102.953 Y132.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.947 Y133.662 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692391
G1 F5542.975
M204 S6000
G1 X108.482 Y133.662 E.23997
M204 S10000
G1 X108.935 Y133.737 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.54282
G1 F6990
M204 S6000
G1 X108.935 Y133.112 E.02544
; LINE_WIDTH: 0.563162
G1 F6919.857
G1 X108.915 Y133.049 E.00284
; LINE_WIDTH: 0.603846
G1 F6417.959
G1 X108.894 Y132.985 E.00306
; LINE_WIDTH: 0.64453
G1 F5983.943
G1 X108.874 Y132.921 E.00328
; LINE_WIDTH: 0.685214
G1 F5604.91
G1 X108.854 Y132.857 E.0035
; LINE_WIDTH: 0.746
G1 F5120.33
G1 X108.833 Y132.794 E.00383
G1 X108.833 Y123.206 E.54928
; LINE_WIDTH: 0.725694
G1 F5272.609
G1 X108.854 Y123.142 E.00372
; LINE_WIDTH: 0.685002
G1 F5606.761
G1 X108.874 Y123.079 E.0035
; LINE_WIDTH: 0.64431
G1 F5986.132
G1 X108.894 Y123.015 E.00328
; LINE_WIDTH: 0.603618
G1 F6420.569
G1 X108.915 Y122.951 E.00306
; LINE_WIDTH: 0.544736
G1 F6990
G1 X108.935 Y122.887 E.00274
G1 X108.935 Y122.323 E.0231
M204 S10000
G1 X108.482 Y122.338 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.692401
G1 F5542.89
M204 S6000
G1 X103.947 Y122.338 E.23997
M204 S10000
G1 X103.777 Y123.069 F42000
; LINE_WIDTH: 0.51605
G1 F6990
M204 S6000
G1 X103.777 Y132.931 E.38018
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7608.903
G1 X103.777 Y130.931 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 38/72
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z7.8 I.213 J1.198 P1  F42000
G1 X146.948 Y123.273 Z7.8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7262
M204 S6000
G1 X150.211 Y123.273 E.10821
G1 X150.211 Y132.727 E.31361
G1 X146.556 Y132.727 E.12121
G1 X146.556 Y123.273 E.31361
G1 X146.888 Y123.273 E.01102
M204 S250
G1 X146.948 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7262
M204 S5000
G1 X149.818 Y123.665 E.08819
G1 X149.818 Y132.335 E.2664
G1 X146.948 Y132.335 E.08819
G1 X146.948 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.948 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.958 Y131.052 Z8 F42000
G1 X146.11 Y134.191 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7262
M204 S6000
G1 X146.11 Y133.134 E.03505
G1 X150.618 Y133.134 E.14954
G1 X150.618 Y122.866 E.34062
G1 X146.11 Y122.866 E.14954
G1 X146.11 Y121.809 E.03504
G1 X151.756 Y121.81 E.1873
G1 X151.756 Y134.19 E.4107
G1 X146.17 Y134.191 E.18532
M204 S10000
G1 X145.703 Y134.598 F42000
G1 F7262
M204 S6000
G1 X145.703 Y121.402 E.43772
G1 X152.163 Y121.402 E.2143
G1 X152.163 Y134.598 E.4377
G1 X145.763 Y134.598 E.21232
M204 S250
G1 X145.31 Y134.793 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7262
M204 S5000
G1 X145.321 Y121.14 E.41951
G3 X145.5 Y121.01 I.184 J.066 E.00723
G1 X152.364 Y121.01 E.2109
G3 X152.555 Y121.199 I-.009 J.201 E.00903
G1 X152.554 Y134.821 E.41856
G3 X152.366 Y134.99 I-.197 J-.03 E.00839
G1 X145.437 Y134.978 E.21291
G3 X145.319 Y134.853 I.066 J-.182 E.0055
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.319 Y132.853 E-.76
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
G1 X146.129 Y132.931 F42000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.48972
G1 F7262
M204 S6000
G1 X146.129 Y123.069 E.35903
M204 S10000
G1 X146.313 Y122.338 F42000
; LINE_WIDTH: 0.692235
G1 F5544.305
M204 S6000
G1 X150.821 Y122.338 E.23852
M204 S10000
G1 X150.821 Y133.662 F42000
; LINE_WIDTH: 0.692401
G1 F5542.895
M204 S6000
G1 X146.313 Y133.662 E.23858
M204 S10000
G1 X151.289 Y133.723 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.57094
G1 F6817.924
M204 S6000
G1 X151.289 Y133.172 E.02369
M204 S10000
G1 X151.004 Y123.282 F42000
; LINE_WIDTH: 0.409318
G1 F7262
M204 S6000
G1 X151.004 Y132.741 E.28243
G1 X151.025 Y132.909 E.00505
G1 X151.115 Y132.931 E.00276
; LINE_WIDTH: 0.468907
G1 X151.173 Y132.991 E.00291
; LINE_WIDTH: 0.50972
G1 X151.231 Y133.052 E.00319
; LINE_WIDTH: 0.550534
G1 F7092.013
G1 X151.289 Y133.112 E.00347
; LINE_WIDTH: 0.550653
G1 F7090.348
G1 X151.309 Y133.02 E.00393
; LINE_WIDTH: 0.510078
G1 F7262
G1 X151.329 Y132.927 E.00362
; LINE_WIDTH: 0.469503
G1 X151.349 Y132.834 E.0033
; LINE_WIDTH: 0.408793
G1 X151.37 Y132.741 E.00283
G1 X151.37 Y123.282 E.28202
; LINE_WIDTH: 0.428813
G1 X151.349 Y123.183 E.00317
; LINE_WIDTH: 0.469358
G1 X151.329 Y123.085 E.0035
; LINE_WIDTH: 0.509903
G1 X151.309 Y122.986 E.00383
; LINE_WIDTH: 0.550448
G1 F7093.212
G1 X151.288 Y122.887 E.00416
; LINE_WIDTH: 0.55385
G1 F7045.975
G1 X151.232 Y122.951 E.00354
; LINE_WIDTH: 0.52011
G1 F7262
G1 X151.176 Y123.015 E.00331
; LINE_WIDTH: 0.47784
G3 X151.034 Y123.098 I-.13 J-.058 E.0062
; LINE_WIDTH: 0.45426
G1 X151.024 Y123.161 E.00211
; LINE_WIDTH: 0.42378
G1 X151.014 Y123.223 E.00195
M204 S10000
G1 X151.288 Y122.887 F42000
; LINE_WIDTH: 0.57071
G1 F6820.895
M204 S6000
G1 X151.288 Y122.337 E.02368
; OBJECT_ID: 405
; WIPE_START
G1 X151.288 Y122.887 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X143.657 Y123.003 Z8 F42000
G1 X125.779 Y123.273 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7262
M204 S6000
G1 X129.041 Y123.273 E.10821
G1 X129.041 Y132.727 E.31361
G1 X125.387 Y132.727 E.12121
G1 X125.387 Y123.273 E.31361
G1 X125.719 Y123.273 E.01102
M204 S250
G1 X125.779 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7262
M204 S5000
G1 X128.649 Y123.665 E.08819
G1 X128.649 Y132.335 E.2664
G1 X125.779 Y132.335 E.08819
G1 X125.779 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.778 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.788 Y131.052 Z8 F42000
G1 X124.94 Y134.191 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7262
M204 S6000
G1 X124.94 Y133.134 E.03505
G1 X129.448 Y133.134 E.14954
G1 X129.448 Y122.866 E.34062
G1 X124.94 Y122.866 E.14954
G1 X124.94 Y121.809 E.03504
G1 X130.586 Y121.81 E.1873
G1 X130.586 Y134.19 E.4107
G1 X125 Y134.191 E.18532
M204 S10000
G1 X124.533 Y134.598 F42000
G1 F7262
M204 S6000
G1 X124.533 Y121.402 E.43772
G1 X130.993 Y121.402 E.2143
G1 X130.993 Y134.598 E.4377
G1 X124.593 Y134.598 E.21232
M204 S250
G1 X124.141 Y134.793 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7262
M204 S5000
G1 X124.151 Y121.14 E.41951
G3 X124.33 Y121.01 I.184 J.066 E.00723
G1 X131.194 Y121.01 E.2109
G3 X131.385 Y121.199 I-.009 J.201 E.00903
G1 X131.384 Y134.821 E.41856
G3 X131.197 Y134.99 I-.197 J-.03 E.00839
G1 X124.268 Y134.978 E.21291
G3 X124.149 Y134.853 I.066 J-.182 E.0055
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.149 Y132.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.143 Y133.662 Z8 F42000
M73 P66 R7
G1 Z7.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692401
G1 F5542.895
M204 S6000
G1 X129.651 Y133.662 E.23858
M204 S10000
G1 X130.119 Y133.723 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.57094
G1 F6817.924
M204 S6000
G1 X130.119 Y133.172 E.02369
M204 S10000
G1 X129.834 Y123.282 F42000
; LINE_WIDTH: 0.409318
G1 F7262
M204 S6000
G1 X129.834 Y132.741 E.28243
G1 X129.855 Y132.909 E.00505
G1 X129.945 Y132.931 E.00276
; LINE_WIDTH: 0.468907
G1 X130.003 Y132.991 E.00291
; LINE_WIDTH: 0.50972
G1 X130.061 Y133.052 E.00319
; LINE_WIDTH: 0.550534
G1 F7092.013
G1 X130.119 Y133.112 E.00347
; LINE_WIDTH: 0.550653
G1 F7090.348
G1 X130.139 Y133.02 E.00393
; LINE_WIDTH: 0.510078
G1 F7262
G1 X130.159 Y132.927 E.00362
; LINE_WIDTH: 0.469503
G1 X130.18 Y132.834 E.0033
; LINE_WIDTH: 0.408793
G1 X130.2 Y132.741 E.00283
G1 X130.2 Y123.282 E.28202
; LINE_WIDTH: 0.428813
G1 X130.18 Y123.183 E.00317
; LINE_WIDTH: 0.469358
G1 X130.159 Y123.085 E.0035
; LINE_WIDTH: 0.509903
G1 X130.139 Y122.986 E.00383
; LINE_WIDTH: 0.550448
G1 F7093.212
G1 X130.119 Y122.887 E.00416
; LINE_WIDTH: 0.55385
G1 F7045.975
G1 X130.062 Y122.951 E.00354
; LINE_WIDTH: 0.52011
G1 F7262
G1 X130.006 Y123.015 E.00331
; LINE_WIDTH: 0.47784
G3 X129.865 Y123.098 I-.13 J-.058 E.0062
; LINE_WIDTH: 0.45426
G1 X129.854 Y123.161 E.00211
; LINE_WIDTH: 0.42378
G1 X129.844 Y123.223 E.00195
M204 S10000
G1 X130.119 Y122.887 F42000
; LINE_WIDTH: 0.57071
G1 F6820.895
M204 S6000
G1 X130.119 Y122.337 E.02368
M204 S10000
G1 X129.651 Y122.338 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.692235
G1 F5544.305
M204 S6000
G1 X125.143 Y122.338 E.23852
M204 S10000
G1 X124.96 Y123.069 F42000
; LINE_WIDTH: 0.48972
G1 F7262
M204 S6000
G1 X124.96 Y132.931 E.35903
; OBJECT_ID: 394
; WIPE_START
G1 F8057.296
G1 X124.96 Y130.931 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X117.816 Y128.243 Z8 F42000
G1 X104.609 Y123.273 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7262
M204 S6000
G1 X107.871 Y123.273 E.10821
G1 X107.871 Y132.727 E.31361
G1 X104.217 Y132.727 E.12121
G1 X104.217 Y123.273 E.31361
G1 X104.549 Y123.273 E.01102
M204 S250
G1 X104.609 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7262
M204 S5000
G1 X107.479 Y123.665 E.08819
G1 X107.479 Y132.335 E.2664
G1 X104.609 Y132.335 E.08819
G1 X104.609 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X106.609 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.618 Y131.052 Z8 F42000
G1 X103.77 Y134.191 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7262
M204 S6000
G1 X103.77 Y133.134 E.03505
G1 X108.278 Y133.134 E.14954
G1 X108.278 Y122.866 E.34062
G1 X103.77 Y122.866 E.14954
G1 X103.77 Y121.809 E.03504
G1 X109.416 Y121.81 E.1873
G1 X109.417 Y134.19 E.4107
G1 X103.83 Y134.191 E.18532
M204 S10000
G1 X103.363 Y134.598 F42000
G1 F7262
M204 S6000
G1 X103.363 Y121.402 E.43772
G1 X109.823 Y121.402 E.2143
G1 X109.824 Y134.598 E.4377
G1 X103.423 Y134.598 E.21232
M204 S250
G1 X102.971 Y134.793 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7262
M204 S5000
G1 X102.981 Y121.14 E.41951
G3 X103.161 Y121.01 I.184 J.066 E.00723
G1 X110.024 Y121.01 E.2109
G3 X110.215 Y121.199 I-.009 J.201 E.00903
G1 X110.214 Y134.821 E.41856
G3 X110.027 Y134.99 I-.197 J-.03 E.00839
G1 X103.098 Y134.978 E.21291
G3 X102.979 Y134.853 I.066 J-.182 E.0055
; WIPE_START
G1 F9547.055
M204 S6000
G1 X102.98 Y132.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.974 Y133.662 Z8 F42000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692401
G1 F5542.895
M204 S6000
G1 X108.482 Y133.662 E.23858
M204 S10000
G1 X108.949 Y133.723 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.57094
G1 F6817.924
M204 S6000
G1 X108.949 Y133.172 E.02369
M204 S10000
G1 X108.664 Y123.282 F42000
; LINE_WIDTH: 0.409318
G1 F7262
M204 S6000
G1 X108.664 Y132.741 E.28243
G1 X108.685 Y132.909 E.00505
G1 X108.775 Y132.931 E.00276
; LINE_WIDTH: 0.468907
G1 X108.833 Y132.991 E.00291
; LINE_WIDTH: 0.50972
G1 X108.891 Y133.052 E.00319
; LINE_WIDTH: 0.550534
G1 F7092.013
G1 X108.949 Y133.112 E.00347
; LINE_WIDTH: 0.550653
G1 F7090.348
G1 X108.969 Y133.02 E.00393
; LINE_WIDTH: 0.510078
G1 F7262
G1 X108.99 Y132.927 E.00362
; LINE_WIDTH: 0.469503
G1 X109.01 Y132.834 E.0033
; LINE_WIDTH: 0.408793
G1 X109.03 Y132.741 E.00283
G1 X109.03 Y123.282 E.28202
; LINE_WIDTH: 0.428813
G1 X109.01 Y123.183 E.00317
; LINE_WIDTH: 0.469358
G1 X108.99 Y123.085 E.0035
; LINE_WIDTH: 0.509903
G1 X108.969 Y122.986 E.00383
; LINE_WIDTH: 0.550448
G1 F7093.212
G1 X108.949 Y122.887 E.00416
; LINE_WIDTH: 0.55385
G1 F7045.975
G1 X108.893 Y122.951 E.00354
; LINE_WIDTH: 0.52011
G1 F7262
G1 X108.836 Y123.015 E.00331
; LINE_WIDTH: 0.47784
G3 X108.695 Y123.098 I-.13 J-.058 E.0062
; LINE_WIDTH: 0.45426
G1 X108.685 Y123.161 E.00211
; LINE_WIDTH: 0.42378
G1 X108.674 Y123.223 E.00195
M204 S10000
G1 X108.949 Y122.887 F42000
; LINE_WIDTH: 0.57071
G1 F6820.895
M204 S6000
G1 X108.949 Y122.337 E.02368
M204 S10000
G1 X108.482 Y122.338 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.692235
G1 F5544.305
M204 S6000
G1 X103.974 Y122.338 E.23852
M204 S10000
G1 X103.79 Y123.069 F42000
; LINE_WIDTH: 0.48972
G1 F7262
M204 S6000
G1 X103.79 Y132.931 E.35903
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8057.296
G1 X103.79 Y130.931 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 39/72
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z8 I.213 J1.198 P1  F42000
G1 X146.948 Y123.273 Z8
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7265
M204 S6000
G1 X150.211 Y123.273 E.10821
G1 X150.211 Y132.727 E.31361
G1 X146.556 Y132.727 E.12121
G1 X146.556 Y123.273 E.31361
G1 X146.888 Y123.273 E.01102
M204 S250
G1 X146.948 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7265
M204 S5000
G1 X149.818 Y123.665 E.08819
G1 X149.818 Y132.335 E.2664
G1 X146.948 Y132.335 E.08819
G1 X146.948 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.948 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.975 Y131.056 Z8.2 F42000
G1 X146.136 Y134.191 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7265
M204 S6000
G1 X146.136 Y133.134 E.03505
G1 X150.618 Y133.134 E.14867
G1 X150.618 Y122.866 E.34062
G1 X146.136 Y122.866 E.14867
G1 X146.136 Y121.809 E.03504
G1 X151.792 Y121.809 E.18761
G1 X151.792 Y134.191 E.4107
G1 X146.196 Y134.191 E.18563
M204 S10000
G1 X145.729 Y134.598 F42000
G1 F7265
M204 S6000
G1 X145.729 Y121.402 E.43772
G1 X152.199 Y121.402 E.21462
G1 X152.199 Y134.598 E.43771
G1 X145.789 Y134.598 E.21263
M204 S250
G1 X145.337 Y134.793 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7265
M204 S5000
G1 X145.347 Y121.14 E.41951
G3 X145.527 Y121.01 I.184 J.066 E.00723
G1 X152.397 Y121.01 E.21112
G3 X152.591 Y121.199 I-.007 J.201 E.0091
G1 X152.589 Y134.821 E.41856
G3 X152.4 Y134.99 I-.197 J-.03 E.00845
G1 X145.464 Y134.978 E.21314
G3 X145.345 Y134.853 I.066 J-.181 E.00549
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.345 Y132.853 E-.76
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
G1 X146.143 Y132.931 F42000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.46339
G1 F7265
M204 S6000
G1 X146.143 Y123.069 E.33787
M204 S10000
G1 X146.339 Y122.338 F42000
; LINE_WIDTH: 0.692246
G1 F5544.213
M204 S6000
G1 X150.821 Y122.338 E.23713
M204 S10000
G1 X150.821 Y133.662 F42000
; LINE_WIDTH: 0.692409
G1 F5542.821
M204 S6000
G1 X146.339 Y133.662 E.23719
M204 S10000
G1 X151.306 Y133.705 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.60666
G1 F6385.922
M204 S6000
G1 X151.306 Y133.244 E.0212
M204 S10000
G1 X151.013 Y123.233 F42000
; LINE_WIDTH: 0.426416
G1 F7265
M204 S6000
G1 X151.013 Y132.921 E.30274
G1 X151.118 Y132.955 E.00346
; LINE_WIDTH: 0.442259
G1 X151.173 Y133.007 E.00246
; LINE_WIDTH: 0.487975
G1 X151.227 Y133.06 E.00274
; LINE_WIDTH: 0.533692
G1 X151.281 Y133.112 E.00302
; LINE_WIDTH: 0.569078
G1 F6842.058
G1 X151.294 Y133.148 E.00162
; LINE_WIDTH: 0.594133
G1 F6531.057
G1 X151.306 Y133.184 E.00169
; LINE_WIDTH: 0.58414
G1 F6651.639
G1 X151.329 Y133.081 E.00463
; LINE_WIDTH: 0.5391
G1 F7255.432
G1 X151.351 Y132.979 E.00424
; LINE_WIDTH: 0.49406
G1 F7265
G1 X151.374 Y132.876 E.00386
; LINE_WIDTH: 0.426701
G1 X151.396 Y132.774 E.00328
G1 X151.396 Y123.233 E.29837
; LINE_WIDTH: 0.448914
G1 X151.374 Y123.137 E.00326
; LINE_WIDTH: 0.493922
G1 X151.351 Y123.041 E.00362
; LINE_WIDTH: 0.538929
G1 F7257.937
G1 X151.329 Y122.946 E.00398
; LINE_WIDTH: 0.581045
G1 F6689.899
G1 X151.306 Y122.85 E.00432
G1 X151.274 Y122.931 E.00384
; LINE_WIDTH: 0.529825
G1 F7265
G1 X151.221 Y122.974 E.00269
; LINE_WIDTH: 0.491175
G1 X151.169 Y123.017 E.00248
; LINE_WIDTH: 0.437248
G3 X151.016 Y123.091 I-.168 J-.153 E.00558
G1 X151.014 Y123.173 E.00264
M204 S10000
G1 X151.306 Y122.85 F42000
; LINE_WIDTH: 0.60644
G1 F6388.416
M204 S6000
G1 X151.306 Y122.355 E.02273
; OBJECT_ID: 405
; WIPE_START
G1 X151.306 Y122.85 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X143.675 Y122.976 Z8.2 F42000
G1 X125.779 Y123.273 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7265
M204 S6000
G1 X129.041 Y123.273 E.10821
G1 X129.041 Y132.727 E.31361
G1 X125.387 Y132.727 E.12121
G1 X125.387 Y123.273 E.31361
G1 X125.719 Y123.273 E.01102
M204 S250
G1 X125.779 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7265
M204 S5000
G1 X128.649 Y123.665 E.08819
G1 X128.649 Y132.335 E.2664
G1 X125.779 Y132.335 E.08819
G1 X125.779 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.778 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.805 Y131.056 Z8.2 F42000
G1 X124.966 Y134.191 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7265
M204 S6000
G1 X124.966 Y133.134 E.03505
G1 X129.448 Y133.134 E.14867
G1 X129.448 Y122.866 E.34062
G1 X124.966 Y122.866 E.14867
G1 X124.966 Y121.809 E.03504
G1 X130.622 Y121.809 E.18761
G1 X130.622 Y134.191 E.4107
G1 X125.026 Y134.191 E.18563
M204 S10000
G1 X124.559 Y134.598 F42000
G1 F7265
M204 S6000
G1 X124.559 Y121.402 E.43772
G1 X131.029 Y121.402 E.21462
G1 X131.029 Y134.598 E.43771
G1 X124.619 Y134.598 E.21263
M204 S250
G1 X124.167 Y134.793 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7265
M204 S5000
G1 X124.177 Y121.14 E.41951
G3 X124.357 Y121.01 I.184 J.066 E.00723
G1 X131.228 Y121.01 E.21112
G3 X131.421 Y121.199 I-.007 J.201 E.0091
G1 X131.42 Y134.821 E.41856
G3 X131.23 Y134.99 I-.197 J-.03 E.00845
G1 X124.294 Y134.978 E.21314
G3 X124.175 Y134.853 I.066 J-.181 E.00549
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.176 Y132.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.17 Y133.662 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692409
G1 F5542.821
M204 S6000
G1 X129.651 Y133.662 E.23719
M204 S10000
G1 X130.137 Y133.705 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.60666
G1 F6385.922
M204 S6000
G1 X130.137 Y133.244 E.0212
M204 S10000
G1 X129.843 Y123.233 F42000
; LINE_WIDTH: 0.426416
G1 F7265
M204 S6000
G1 X129.843 Y132.921 E.30274
G1 X129.948 Y132.955 E.00346
; LINE_WIDTH: 0.442259
G1 X130.003 Y133.007 E.00246
; LINE_WIDTH: 0.487975
G1 X130.057 Y133.06 E.00274
; LINE_WIDTH: 0.533692
G1 X130.112 Y133.112 E.00302
; LINE_WIDTH: 0.569078
G1 F6842.058
G1 X130.124 Y133.148 E.00162
; LINE_WIDTH: 0.594133
G1 F6531.057
G1 X130.137 Y133.184 E.00169
; LINE_WIDTH: 0.58414
G1 F6651.639
G1 X130.159 Y133.081 E.00463
; LINE_WIDTH: 0.5391
G1 F7255.432
G1 X130.182 Y132.979 E.00424
; LINE_WIDTH: 0.49406
G1 F7265
G1 X130.204 Y132.876 E.00386
; LINE_WIDTH: 0.426701
G1 X130.227 Y132.774 E.00328
G1 X130.227 Y123.233 E.29837
; LINE_WIDTH: 0.448914
G1 X130.204 Y123.137 E.00326
; LINE_WIDTH: 0.493922
G1 X130.182 Y123.041 E.00362
; LINE_WIDTH: 0.538929
G1 F7257.937
G1 X130.159 Y122.946 E.00398
; LINE_WIDTH: 0.581045
G1 F6689.899
G1 X130.137 Y122.85 E.00432
G1 X130.104 Y122.931 E.00384
; LINE_WIDTH: 0.529825
G1 F7265
G1 X130.052 Y122.974 E.00269
; LINE_WIDTH: 0.491175
G1 X129.999 Y123.017 E.00248
; LINE_WIDTH: 0.437248
G3 X129.846 Y123.091 I-.168 J-.153 E.00558
G1 X129.845 Y123.173 E.00264
M204 S10000
G1 X130.137 Y122.85 F42000
; LINE_WIDTH: 0.60644
G1 F6388.416
M204 S6000
G1 X130.137 Y122.355 E.02273
M204 S10000
G1 X129.651 Y122.338 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.692246
G1 F5544.213
M204 S6000
G1 X125.17 Y122.338 E.23713
M204 S10000
G1 X124.973 Y123.069 F42000
; LINE_WIDTH: 0.46339
G1 F7265
M204 S6000
G1 X124.973 Y132.931 E.33787
; OBJECT_ID: 394
; WIPE_START
G1 F8561.847
G1 X124.973 Y130.931 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X117.829 Y128.244 Z8.2 F42000
G1 X104.609 Y123.273 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7265
M204 S6000
G1 X107.871 Y123.273 E.10821
G1 X107.871 Y132.727 E.31361
G1 X104.217 Y132.727 E.12121
G1 X104.217 Y123.273 E.31361
G1 X104.549 Y123.273 E.01102
M204 S250
G1 X104.609 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7265
M204 S5000
G1 X107.479 Y123.665 E.08819
G1 X107.479 Y132.335 E.2664
G1 X104.609 Y132.335 E.08819
G1 X104.609 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
M73 P67 R7
G1 X106.609 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.635 Y131.056 Z8.2 F42000
G1 X103.796 Y134.191 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7265
M204 S6000
G1 X103.796 Y133.134 E.03505
G1 X108.278 Y133.134 E.14867
G1 X108.278 Y122.866 E.34062
G1 X103.796 Y122.866 E.14867
G1 X103.796 Y121.809 E.03504
G1 X109.452 Y121.809 E.18761
G1 X109.452 Y134.191 E.4107
G1 X103.856 Y134.191 E.18563
M204 S10000
G1 X103.389 Y134.598 F42000
G1 F7265
M204 S6000
G1 X103.389 Y121.402 E.43772
G1 X109.859 Y121.402 E.21462
G1 X109.859 Y134.598 E.43771
G1 X103.449 Y134.598 E.21263
M204 S250
G1 X102.997 Y134.793 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7265
M204 S5000
G1 X103.008 Y121.14 E.41951
G3 X103.187 Y121.01 I.184 J.066 E.00723
G1 X110.058 Y121.01 E.21112
G3 X110.251 Y121.199 I-.007 J.201 E.0091
G1 X110.25 Y134.821 E.41856
G3 X110.06 Y134.99 I-.197 J-.03 E.00845
G1 X103.124 Y134.978 E.21314
G3 X103.006 Y134.853 I.066 J-.181 E.00549
; WIPE_START
G1 F9547.055
M204 S6000
G1 X103.006 Y132.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104 Y133.662 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692409
G1 F5542.821
M204 S6000
G1 X108.482 Y133.662 E.23719
M204 S10000
G1 X108.967 Y133.705 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.60666
G1 F6385.922
M204 S6000
G1 X108.967 Y133.244 E.0212
M204 S10000
G1 X108.673 Y123.233 F42000
; LINE_WIDTH: 0.426416
G1 F7265
M204 S6000
G1 X108.673 Y132.921 E.30274
G1 X108.779 Y132.955 E.00346
; LINE_WIDTH: 0.442259
G1 X108.833 Y133.007 E.00246
; LINE_WIDTH: 0.487975
G1 X108.887 Y133.06 E.00274
; LINE_WIDTH: 0.533692
G1 X108.942 Y133.112 E.00302
; LINE_WIDTH: 0.569078
G1 F6842.058
G1 X108.954 Y133.148 E.00162
; LINE_WIDTH: 0.594133
G1 F6531.057
G1 X108.967 Y133.184 E.00169
; LINE_WIDTH: 0.58414
G1 F6651.639
G1 X108.989 Y133.081 E.00463
; LINE_WIDTH: 0.5391
G1 F7255.432
G1 X109.012 Y132.979 E.00424
; LINE_WIDTH: 0.49406
G1 F7265
G1 X109.034 Y132.876 E.00386
; LINE_WIDTH: 0.426701
G1 X109.057 Y132.774 E.00328
G1 X109.057 Y123.233 E.29837
; LINE_WIDTH: 0.448914
G1 X109.034 Y123.137 E.00326
; LINE_WIDTH: 0.493922
G1 X109.012 Y123.041 E.00362
; LINE_WIDTH: 0.538929
G1 F7257.937
G1 X108.989 Y122.946 E.00398
; LINE_WIDTH: 0.581045
G1 F6689.899
G1 X108.967 Y122.85 E.00432
G1 X108.934 Y122.931 E.00384
; LINE_WIDTH: 0.529825
G1 F7265
G1 X108.882 Y122.974 E.00269
; LINE_WIDTH: 0.491175
G1 X108.829 Y123.017 E.00248
; LINE_WIDTH: 0.437248
G3 X108.677 Y123.091 I-.168 J-.153 E.00558
G1 X108.675 Y123.173 E.00264
M204 S10000
G1 X108.967 Y122.85 F42000
; LINE_WIDTH: 0.60644
G1 F6388.416
M204 S6000
G1 X108.967 Y122.355 E.02273
M204 S10000
G1 X108.482 Y122.338 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.692246
G1 F5544.213
M204 S6000
G1 X104 Y122.338 E.23713
M204 S10000
G1 X103.803 Y123.069 F42000
; LINE_WIDTH: 0.46339
G1 F7265
M204 S6000
G1 X103.803 Y132.931 E.33787
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8561.847
G1 X103.803 Y130.931 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 40/72
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z8.2 I.213 J1.198 P1  F42000
G1 X146.948 Y123.273 Z8.2
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7457
M204 S6000
G1 X150.211 Y123.273 E.10821
G1 X150.211 Y132.727 E.31361
G1 X146.556 Y132.727 E.12121
G1 X146.556 Y123.273 E.31361
G1 X146.888 Y123.273 E.01102
M204 S250
G1 X146.948 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7457
M204 S5000
G1 X149.818 Y123.665 E.08819
G1 X149.818 Y132.335 E.2664
G1 X146.948 Y132.335 E.08819
G1 X146.948 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.948 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.992 Y131.061 Z8.4 F42000
G1 X146.162 Y134.191 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7457
M204 S6000
G1 X146.162 Y133.134 E.03505
G1 X150.618 Y133.134 E.14779
G1 X150.618 Y122.866 E.34062
G1 X146.162 Y122.866 E.14779
G1 X146.162 Y121.809 E.03504
G1 X151.827 Y121.809 E.18792
G1 X151.828 Y134.19 E.4107
G1 X146.222 Y134.191 E.18594
M204 S10000
G1 X145.755 Y134.598 F42000
G1 F7457
M204 S6000
G1 X145.755 Y121.402 E.43772
G1 X152.234 Y121.402 E.21493
G1 X152.235 Y134.598 E.43771
G1 X145.815 Y134.598 E.21295
M204 S250
G1 X145.363 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7457
M204 S5000
G1 X145.373 Y121.14 E.41951
G3 X145.553 Y121.01 I.184 J.066 E.00723
G1 X152.432 Y121.01 E.21136
G3 X152.626 Y121.199 I-.006 J.201 E.00914
G1 X152.625 Y134.821 E.41856
G3 X152.437 Y134.99 I-.197 J-.03 E.00842
G1 X145.49 Y134.978 E.21346
G3 X145.371 Y134.853 I.066 J-.181 E.0055
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.372 Y132.853 E-.76
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
G1 X146.156 Y132.931 F42000
G1 Z8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43706
G1 F7457
M204 S6000
G1 X146.156 Y123.069 E.31671
M204 S10000
G1 X146.366 Y122.338 F42000
; LINE_WIDTH: 0.692277
G1 F5543.945
M204 S6000
G1 X150.821 Y122.338 E.23575
M204 S10000
G1 X151.324 Y122.798 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.64214
G1 F6007.81
M204 S6000
G1 X151.324 Y122.373 E.02076
M204 S10000
G1 X151.022 Y132.763 F42000
; LINE_WIDTH: 0.44436
G1 F7457
M204 S6000
G1 X151.025 Y132.909 E.00477
G1 X151.124 Y132.938 E.00337
; LINE_WIDTH: 0.469113
G1 X151.174 Y133.015 E.00319
; LINE_WIDTH: 0.518618
G1 X151.224 Y133.092 E.00356
; LINE_WIDTH: 0.568123
G1 F6854.499
G1 X151.274 Y133.168 E.00393
; LINE_WIDTH: 0.617628
G1 F6264.056
G1 X151.324 Y133.245 E.0043
; LINE_WIDTH: 0.619884
G1 F6239.558
G1 X151.347 Y133.167 E.00381
; LINE_WIDTH: 0.574892
G1 F6767.274
G1 X151.369 Y133.089 E.00351
; LINE_WIDTH: 0.5299
G1 F7392.501
G1 X151.392 Y133.012 E.00322
; LINE_WIDTH: 0.484908
G1 F7457
G1 X151.414 Y132.934 E.00292
; LINE_WIDTH: 0.444144
G2 X151.423 Y132.763 I-.183 J-.095 E.00575
G1 X151.423 Y123.237 E.31147
; LINE_WIDTH: 0.466059
G1 X151.401 Y123.12 E.00408
; LINE_WIDTH: 0.509655
G1 X151.38 Y123.004 E.0045
; LINE_WIDTH: 0.553252
G1 F7054.236
G1 X151.358 Y122.887 E.00492
; LINE_WIDTH: 0.591823
G1 F6558.542
G1 X151.341 Y122.843 E.00214
; LINE_WIDTH: 0.625368
G1 F6180.815
G1 X151.324 Y122.798 E.00227
; LINE_WIDTH: 0.625064
G1 F6184.044
G1 X151.306 Y122.842 E.00227
; LINE_WIDTH: 0.59091
G1 F6569.464
G1 X151.288 Y122.886 E.00214
; LINE_WIDTH: 0.556757
G1 F7006.117
G1 X151.269 Y122.93 E.002
; LINE_WIDTH: 0.515825
G1 F7457
G1 X151.147 Y123.011 E.00564
; LINE_WIDTH: 0.444667
G1 X151.025 Y123.091 E.00479
G1 X151.022 Y123.237 E.00477
G1 X151.022 Y132.703 E.30991
M204 S10000
G1 X151.324 Y133.687 F42000
; LINE_WIDTH: 0.64238
G1 F6005.405
M204 S6000
G1 X151.324 Y133.305 E.01867
M204 S10000
G1 X150.821 Y133.662 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.692391
G1 F5542.972
M204 S6000
G1 X146.366 Y133.662 E.23579
; OBJECT_ID: 405
; WIPE_START
G1 X148.366 Y133.662 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X141.432 Y130.473 Z8.4 F42000
G1 X125.779 Y123.273 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7457
M204 S6000
G1 X129.041 Y123.273 E.10821
G1 X129.041 Y132.727 E.31361
G1 X125.387 Y132.727 E.12121
G1 X125.387 Y123.273 E.31361
G1 X125.719 Y123.273 E.01102
M204 S250
G1 X125.779 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7457
M204 S5000
G1 X128.649 Y123.665 E.08819
G1 X128.649 Y132.335 E.2664
G1 X125.779 Y132.335 E.08819
G1 X125.779 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.778 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.822 Y131.061 Z8.4 F42000
G1 X124.992 Y134.191 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7457
M204 S6000
G1 X124.992 Y133.134 E.03505
G1 X129.448 Y133.134 E.14779
G1 X129.448 Y122.866 E.34062
G1 X124.992 Y122.866 E.14779
G1 X124.992 Y121.809 E.03504
G1 X130.658 Y121.809 E.18792
G1 X130.658 Y134.19 E.4107
G1 X125.052 Y134.191 E.18594
M204 S10000
G1 X124.585 Y134.598 F42000
G1 F7457
M204 S6000
G1 X124.585 Y121.402 E.43772
G1 X131.065 Y121.402 E.21493
G1 X131.065 Y134.598 E.43771
G1 X124.645 Y134.598 E.21295
M204 S250
G1 X124.193 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7457
M204 S5000
G1 X124.204 Y121.14 E.41951
G3 X124.383 Y121.01 I.184 J.066 E.00723
G1 X131.262 Y121.01 E.21136
G3 X131.457 Y121.199 I-.006 J.201 E.00914
G1 X131.455 Y134.821 E.41856
G3 X131.267 Y134.99 I-.197 J-.03 E.00842
G1 X124.32 Y134.978 E.21346
G3 X124.202 Y134.853 I.066 J-.181 E.0055
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.202 Y132.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.196 Y133.662 Z8.4 F42000
G1 Z8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692391
G1 F5542.972
M204 S6000
G1 X129.651 Y133.662 E.23579
; WIPE_START
G1 X127.651 Y133.662 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.986 Y132.931 Z8.4 F42000
G1 Z8
G1 E.8 F1800
; LINE_WIDTH: 0.43706
G1 F7457
M204 S6000
G1 X124.986 Y123.069 E.31671
M204 S10000
G1 X125.196 Y122.338 F42000
; LINE_WIDTH: 0.692277
G1 F5543.945
M204 S6000
G1 X129.651 Y122.338 E.23575
M204 S10000
G1 X130.154 Y122.798 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.64214
G1 F6007.81
M204 S6000
G1 X130.154 Y122.373 E.02076
M204 S10000
G1 X129.852 Y132.763 F42000
; LINE_WIDTH: 0.44436
G1 F7457
M204 S6000
G1 X129.855 Y132.909 E.00477
G1 X129.954 Y132.938 E.00337
; LINE_WIDTH: 0.469113
G1 X130.004 Y133.015 E.00319
; LINE_WIDTH: 0.518618
G1 X130.054 Y133.092 E.00356
; LINE_WIDTH: 0.568123
G1 F6854.499
G1 X130.104 Y133.168 E.00393
; LINE_WIDTH: 0.617628
G1 F6264.056
G1 X130.155 Y133.245 E.0043
; LINE_WIDTH: 0.619884
G1 F6239.558
G1 X130.177 Y133.167 E.00381
; LINE_WIDTH: 0.574892
G1 F6767.274
G1 X130.2 Y133.089 E.00351
; LINE_WIDTH: 0.5299
G1 F7392.501
G1 X130.222 Y133.012 E.00322
; LINE_WIDTH: 0.484908
G1 F7457
G1 X130.244 Y132.934 E.00292
; LINE_WIDTH: 0.444144
G2 X130.254 Y132.763 I-.183 J-.095 E.00575
G1 X130.253 Y123.237 E.31147
; LINE_WIDTH: 0.466059
G1 X130.232 Y123.12 E.00408
; LINE_WIDTH: 0.509655
G1 X130.21 Y123.004 E.0045
; LINE_WIDTH: 0.553252
G1 F7054.236
G1 X130.188 Y122.887 E.00492
; LINE_WIDTH: 0.591823
G1 F6558.542
G1 X130.171 Y122.843 E.00214
; LINE_WIDTH: 0.625368
G1 F6180.815
G1 X130.154 Y122.798 E.00227
; LINE_WIDTH: 0.625064
G1 F6184.044
G1 X130.136 Y122.842 E.00227
; LINE_WIDTH: 0.59091
G1 F6569.464
G1 X130.118 Y122.886 E.00214
; LINE_WIDTH: 0.556757
G1 F7006.117
G1 X130.099 Y122.93 E.002
; LINE_WIDTH: 0.515825
G1 F7457
G1 X129.977 Y123.011 E.00564
; LINE_WIDTH: 0.444667
G1 X129.855 Y123.091 E.00479
G1 X129.852 Y123.237 E.00477
G1 X129.852 Y132.703 E.30991
M204 S10000
G1 X130.155 Y133.687 F42000
; LINE_WIDTH: 0.64238
G1 F6005.405
M204 S6000
G1 X130.155 Y133.305 E.01867
; OBJECT_ID: 394
; WIPE_START
G1 X130.155 Y133.687 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X123.087 Y130.806 Z8.4 F42000
G1 X104.609 Y123.273 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7457
M204 S6000
G1 X107.871 Y123.273 E.10821
G1 X107.871 Y132.727 E.31361
G1 X104.217 Y132.727 E.12121
G1 X104.217 Y123.273 E.31361
G1 X104.549 Y123.273 E.01102
M204 S250
G1 X104.609 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7457
M204 S5000
G1 X107.479 Y123.665 E.08819
G1 X107.479 Y132.335 E.2664
G1 X104.609 Y132.335 E.08819
G1 X104.609 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X106.609 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.653 Y131.061 Z8.4 F42000
G1 X103.823 Y134.191 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7457
M204 S6000
G1 X103.823 Y133.134 E.03505
G1 X108.278 Y133.134 E.14779
G1 X108.278 Y122.866 E.34062
G1 X103.823 Y122.866 E.14779
G1 X103.823 Y121.809 E.03504
G1 X109.488 Y121.809 E.18792
G1 X109.488 Y134.19 E.4107
G1 X103.883 Y134.191 E.18594
M204 S10000
G1 X103.416 Y134.598 F42000
G1 F7457
M204 S6000
G1 X103.416 Y121.402 E.43772
G1 X109.895 Y121.402 E.21493
G1 X109.895 Y134.598 E.43771
G1 X103.476 Y134.598 E.21295
M204 S250
G1 X103.024 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7457
M204 S5000
G1 X103.034 Y121.14 E.41951
G3 X103.213 Y121.01 I.184 J.066 E.00723
G1 X110.092 Y121.01 E.21136
G3 X110.287 Y121.199 I-.006 J.201 E.00914
G1 X110.286 Y134.821 E.41856
G3 X110.097 Y134.99 I-.197 J-.03 E.00842
G1 X103.15 Y134.978 E.21346
G3 X103.032 Y134.853 I.066 J-.181 E.0055
; WIPE_START
G1 F9547.055
M204 S6000
G1 X103.032 Y132.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.026 Y133.662 Z8.4 F42000
G1 Z8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692391
G1 F5542.972
M204 S6000
G1 X108.482 Y133.662 E.23579
; WIPE_START
G1 X106.482 Y133.662 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.816 Y132.931 Z8.4 F42000
M73 P68 R7
G1 Z8
G1 E.8 F1800
; LINE_WIDTH: 0.43706
G1 F7457
M204 S6000
G1 X103.816 Y123.069 E.31671
M204 S10000
G1 X104.026 Y122.338 F42000
; LINE_WIDTH: 0.692277
G1 F5543.945
M204 S6000
G1 X108.482 Y122.338 E.23575
M204 S10000
G1 X108.985 Y122.798 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.64214
G1 F6007.81
M204 S6000
G1 X108.985 Y122.373 E.02076
M204 S10000
G1 X108.682 Y132.763 F42000
; LINE_WIDTH: 0.44436
G1 F7457
M204 S6000
G1 X108.685 Y132.909 E.00477
G1 X108.784 Y132.938 E.00337
; LINE_WIDTH: 0.469113
G1 X108.834 Y133.015 E.00319
; LINE_WIDTH: 0.518618
G1 X108.884 Y133.092 E.00356
; LINE_WIDTH: 0.568123
G1 F6854.499
G1 X108.935 Y133.168 E.00393
; LINE_WIDTH: 0.617628
G1 F6264.056
G1 X108.985 Y133.245 E.0043
; LINE_WIDTH: 0.619884
G1 F6239.558
G1 X109.007 Y133.167 E.00381
; LINE_WIDTH: 0.574892
G1 F6767.274
G1 X109.03 Y133.089 E.00351
; LINE_WIDTH: 0.5299
G1 F7392.501
G1 X109.052 Y133.012 E.00322
; LINE_WIDTH: 0.484908
G1 F7457
G1 X109.075 Y132.934 E.00292
; LINE_WIDTH: 0.444144
G2 X109.084 Y132.763 I-.183 J-.095 E.00575
G1 X109.084 Y123.237 E.31147
; LINE_WIDTH: 0.466059
G1 X109.062 Y123.12 E.00408
; LINE_WIDTH: 0.509655
G1 X109.04 Y123.004 E.0045
; LINE_WIDTH: 0.553252
G1 F7054.236
G1 X109.018 Y122.887 E.00492
; LINE_WIDTH: 0.591823
G1 F6558.542
G1 X109.001 Y122.843 E.00214
; LINE_WIDTH: 0.625368
G1 F6180.815
G1 X108.985 Y122.798 E.00227
; LINE_WIDTH: 0.625064
G1 F6184.044
G1 X108.966 Y122.842 E.00227
; LINE_WIDTH: 0.59091
G1 F6569.464
G1 X108.948 Y122.886 E.00214
; LINE_WIDTH: 0.556757
G1 F7006.117
G1 X108.93 Y122.93 E.002
; LINE_WIDTH: 0.515825
G1 F7457
G1 X108.807 Y123.011 E.00564
; LINE_WIDTH: 0.444667
G1 X108.685 Y123.091 E.00479
G1 X108.682 Y123.237 E.00477
G1 X108.682 Y132.703 E.30991
M204 S10000
G1 X108.985 Y133.687 F42000
; LINE_WIDTH: 0.64238
G1 F6005.405
M204 S6000
G1 X108.985 Y133.305 E.01867
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6005.405
G1 X108.985 Y133.687 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 41/72
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z8.4 I.322 J1.174 P1  F42000
G1 X146.948 Y123.273 Z8.4
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7418
M204 S6000
G1 X150.211 Y123.273 E.10821
G1 X150.211 Y132.727 E.31361
G1 X146.556 Y132.727 E.12121
G1 X146.556 Y123.273 E.31361
G1 X146.888 Y123.273 E.01102
M204 S250
G1 X146.948 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7418
M204 S5000
G1 X149.818 Y123.665 E.08819
G1 X149.818 Y132.335 E.2664
G1 X146.948 Y132.335 E.08819
G1 X146.948 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.948 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P68 R6
G1 X147.009 Y131.065 Z8.6 F42000
G1 X146.189 Y134.191 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7418
M204 S6000
G1 X146.189 Y133.134 E.03505
G1 X150.618 Y133.134 E.14692
G1 X150.618 Y122.866 E.34062
G1 X146.189 Y122.866 E.14692
G1 X146.189 Y121.809 E.03504
G1 X151.863 Y121.809 E.18823
G1 X151.863 Y134.19 E.4107
G1 X146.249 Y134.191 E.18625
M204 S10000
G1 X145.781 Y134.598 F42000
G1 F7418
M204 S6000
G1 X145.781 Y121.402 E.43772
G1 X152.27 Y121.402 E.21524
G1 X152.27 Y134.598 E.43771
G1 X145.841 Y134.598 E.21326
M204 S250
G1 X145.389 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7418
M204 S5000
G1 X145.4 Y121.14 E.41951
G3 X145.579 Y121.01 I.184 J.066 E.00722
G1 X152.466 Y121.01 E.21162
G3 X152.662 Y121.199 I-.004 J.201 E.00919
G1 X152.661 Y134.821 E.41856
G3 X152.473 Y134.99 I-.197 J-.03 E.00842
G1 X145.516 Y134.978 E.21375
G3 X145.398 Y134.853 I.066 J-.181 E.00549
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.398 Y132.853 E-.76
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
G1 X146.169 Y132.931 F42000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.41073
G1 F7418
M204 S6000
G1 X146.169 Y123.069 E.29555
M204 S10000
G1 X146.392 Y122.338 F42000
; LINE_WIDTH: 0.692289
G1 F5543.847
M204 S6000
G1 X150.821 Y122.338 E.23436
M204 S10000
G1 X151.031 Y123.247 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.462171
G1 F7418
M204 S6000
G1 X151.031 Y132.905 E.32994
G1 X151.132 Y132.933 E.00361
; LINE_WIDTH: 0.445269
G1 X151.149 Y132.993 E.00204
; LINE_WIDTH: 0.411365
G1 X151.166 Y133.053 E.00187
; LINE_WIDTH: 0.361093
G1 X151.183 Y133.112 E.00161
G1 X151.183 Y133.828 E.01856
G1 X151.501 Y133.828 E.00823
G1 X151.501 Y133.112 E.01856
; LINE_WIDTH: 0.377462
G1 X151.484 Y132.993 E.0033
; LINE_WIDTH: 0.411365
G1 X151.467 Y132.873 E.00363
; LINE_WIDTH: 0.461958
G1 X151.45 Y132.753 E.00413
G1 X151.45 Y123.247 E.3246
; LINE_WIDTH: 0.445167
G1 X151.467 Y123.127 E.00397
; LINE_WIDTH: 0.41126
G1 X151.484 Y123.007 E.00363
; LINE_WIDTH: 0.361492
G1 X151.501 Y122.887 E.00314
G1 X151.501 Y122.172 E.01858
G1 X151.183 Y122.172 E.00824
G1 X151.183 Y122.887 E.01858
; LINE_WIDTH: 0.377354
G1 X151.166 Y122.947 E.0017
; LINE_WIDTH: 0.41126
G1 X151.149 Y123.007 E.00187
; LINE_WIDTH: 0.458051
G1 X151.132 Y123.067 E.00211
G1 X151.031 Y123.095 E.00357
G1 X151.031 Y123.187 E.0031
M204 S10000
G1 X150.821 Y133.662 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.692401
G1 F5542.892
M204 S6000
G1 X146.392 Y133.662 E.2344
; OBJECT_ID: 405
; WIPE_START
G1 X148.392 Y133.662 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X141.457 Y130.476 Z8.6 F42000
G1 X125.779 Y123.273 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7418
M204 S6000
G1 X129.041 Y123.273 E.10821
G1 X129.041 Y132.727 E.31361
G1 X125.387 Y132.727 E.12121
G1 X125.387 Y123.273 E.31361
G1 X125.719 Y123.273 E.01102
M204 S250
G1 X125.779 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7418
M204 S5000
G1 X128.649 Y123.665 E.08819
G1 X128.649 Y132.335 E.2664
G1 X125.779 Y132.335 E.08819
G1 X125.779 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.778 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.84 Y131.065 Z8.6 F42000
G1 X125.019 Y134.191 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7418
M204 S6000
G1 X125.019 Y133.134 E.03505
G1 X129.448 Y133.134 E.14692
G1 X129.448 Y122.866 E.34062
G1 X125.019 Y122.866 E.14692
G1 X125.019 Y121.809 E.03504
G1 X130.693 Y121.809 E.18823
G1 X130.694 Y134.19 E.4107
G1 X125.079 Y134.191 E.18625
M204 S10000
G1 X124.612 Y134.598 F42000
G1 F7418
M204 S6000
G1 X124.612 Y121.402 E.43772
G1 X131.1 Y121.402 E.21524
G1 X131.101 Y134.598 E.43771
G1 X124.672 Y134.598 E.21326
M204 S250
G1 X124.22 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7418
M204 S5000
G1 X124.23 Y121.14 E.41951
G3 X124.409 Y121.01 I.184 J.066 E.00722
G1 X131.296 Y121.01 E.21162
G3 X131.492 Y121.199 I-.004 J.201 E.00919
G1 X131.491 Y134.821 E.41856
G3 X131.303 Y134.99 I-.197 J-.03 E.00842
G1 X124.346 Y134.978 E.21375
G3 X124.228 Y134.853 I.066 J-.181 E.00549
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.228 Y132.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.222 Y133.662 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692401
G1 F5542.892
M204 S6000
G1 X129.651 Y133.662 E.2344
; WIPE_START
G1 X127.651 Y133.662 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.999 Y132.931 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
; LINE_WIDTH: 0.41073
G1 F7418
M204 S6000
G1 X124.999 Y123.069 E.29555
M204 S10000
G1 X125.222 Y122.338 F42000
; LINE_WIDTH: 0.692289
G1 F5543.847
M204 S6000
G1 X129.651 Y122.338 E.23436
M204 S10000
G1 X129.861 Y123.247 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.462171
G1 F7418
M204 S6000
G1 X129.861 Y132.905 E.32994
G1 X129.963 Y132.933 E.00361
; LINE_WIDTH: 0.445269
G1 X129.98 Y132.993 E.00204
; LINE_WIDTH: 0.411365
G1 X129.997 Y133.053 E.00187
; LINE_WIDTH: 0.361093
G1 X130.014 Y133.112 E.00161
G1 X130.014 Y133.828 E.01856
G1 X130.331 Y133.828 E.00823
G1 X130.331 Y133.112 E.01856
; LINE_WIDTH: 0.377462
G1 X130.314 Y132.993 E.0033
; LINE_WIDTH: 0.411365
G1 X130.297 Y132.873 E.00363
; LINE_WIDTH: 0.461958
G1 X130.28 Y132.753 E.00413
G1 X130.28 Y123.247 E.3246
; LINE_WIDTH: 0.445167
G1 X130.297 Y123.127 E.00397
; LINE_WIDTH: 0.41126
G1 X130.314 Y123.007 E.00363
; LINE_WIDTH: 0.361492
G1 X130.331 Y122.887 E.00314
G1 X130.331 Y122.172 E.01858
G1 X130.014 Y122.172 E.00824
G1 X130.014 Y122.887 E.01858
; LINE_WIDTH: 0.377354
G1 X129.997 Y122.947 E.0017
; LINE_WIDTH: 0.41126
G1 X129.98 Y123.007 E.00187
; LINE_WIDTH: 0.458051
G1 X129.963 Y123.067 E.00211
G1 X129.861 Y123.095 E.00357
G1 X129.861 Y123.187 E.0031
; OBJECT_ID: 394
; WIPE_START
G1 F8671.976
G1 X129.861 Y123.095 E-.26822
G1 X129.963 Y123.067 E-.30934
G1 X129.98 Y123.007 E-.18244
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X122.348 Y123.087 Z8.6 F42000
G1 X104.609 Y123.273 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7418
M204 S6000
G1 X107.871 Y123.273 E.10821
G1 X107.871 Y132.727 E.31361
G1 X104.217 Y132.727 E.12121
G1 X104.217 Y123.273 E.31361
G1 X104.549 Y123.273 E.01102
M204 S250
G1 X104.609 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7418
M204 S5000
G1 X107.479 Y123.665 E.08819
G1 X107.479 Y132.335 E.2664
G1 X104.609 Y132.335 E.08819
G1 X104.609 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X106.609 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.67 Y131.065 Z8.6 F42000
G1 X103.849 Y134.191 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7418
M204 S6000
G1 X103.849 Y133.134 E.03505
G1 X108.278 Y133.134 E.14692
G1 X108.278 Y122.866 E.34062
G1 X103.849 Y122.866 E.14692
G1 X103.849 Y121.809 E.03504
G1 X109.524 Y121.809 E.18823
G1 X109.524 Y134.19 E.4107
G1 X103.909 Y134.191 E.18625
M204 S10000
G1 X103.442 Y134.598 F42000
G1 F7418
M204 S6000
G1 X103.442 Y121.402 E.43772
G1 X109.931 Y121.402 E.21524
G1 X109.931 Y134.598 E.43771
G1 X103.502 Y134.598 E.21326
M204 S250
G1 X103.05 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7418
M204 S5000
G1 X103.06 Y121.14 E.41951
G3 X103.239 Y121.01 I.184 J.066 E.00722
G1 X110.127 Y121.01 E.21162
G3 X110.323 Y121.199 I-.004 J.201 E.00919
G1 X110.321 Y134.821 E.41856
G3 X110.133 Y134.99 I-.197 J-.03 E.00842
G1 X103.177 Y134.978 E.21375
G3 X103.058 Y134.853 I.066 J-.181 E.00549
; WIPE_START
G1 F9547.055
M204 S6000
G1 X103.059 Y132.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.053 Y133.662 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692401
G1 F5542.892
M204 S6000
G1 X108.482 Y133.662 E.2344
; WIPE_START
G1 X106.482 Y133.662 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.829 Y132.931 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
; LINE_WIDTH: 0.41073
G1 F7418
M204 S6000
G1 X103.829 Y123.069 E.29555
M204 S10000
G1 X104.053 Y122.338 F42000
; LINE_WIDTH: 0.692289
G1 F5543.847
M204 S6000
G1 X108.482 Y122.338 E.23436
M204 S10000
G1 X108.691 Y123.247 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.462171
G1 F7418
M204 S6000
G1 X108.691 Y132.905 E.32994
G1 X108.793 Y132.933 E.00361
; LINE_WIDTH: 0.445269
G1 X108.81 Y132.993 E.00204
; LINE_WIDTH: 0.411365
G1 X108.827 Y133.053 E.00187
; LINE_WIDTH: 0.361093
G1 X108.844 Y133.112 E.00161
G1 X108.844 Y133.828 E.01856
G1 X109.161 Y133.828 E.00823
G1 X109.161 Y133.112 E.01856
; LINE_WIDTH: 0.377462
G1 X109.144 Y132.993 E.0033
; LINE_WIDTH: 0.411365
G1 X109.128 Y132.873 E.00363
; LINE_WIDTH: 0.461958
G1 X109.111 Y132.753 E.00413
G1 X109.11 Y123.247 E.3246
; LINE_WIDTH: 0.445167
G1 X109.127 Y123.127 E.00397
; LINE_WIDTH: 0.41126
G1 X109.144 Y123.007 E.00363
; LINE_WIDTH: 0.361492
G1 X109.161 Y122.887 E.00314
G1 X109.161 Y122.172 E.01858
G1 X108.844 Y122.172 E.00824
G1 X108.844 Y122.887 E.01858
; LINE_WIDTH: 0.377354
G1 X108.827 Y122.947 E.0017
; LINE_WIDTH: 0.41126
G1 X108.81 Y123.007 E.00187
; LINE_WIDTH: 0.458051
G1 X108.793 Y123.067 E.00211
G1 X108.691 Y123.095 E.00357
G1 X108.691 Y123.187 E.0031
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8671.976
G1 X108.691 Y123.095 E-.26822
G1 X108.793 Y123.067 E-.30934
G1 X108.81 Y123.007 E-.18244
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 42/72
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z8.6 I-.008 J1.217 P1  F42000
G1 X146.948 Y123.273 Z8.6
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7410
M204 S6000
G1 X150.211 Y123.273 E.10821
G1 X150.211 Y132.727 E.31361
G1 X146.556 Y132.727 E.12121
G1 X146.556 Y123.273 E.31361
G1 X146.888 Y123.273 E.01102
M204 S250
G1 X146.948 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7410
M204 S5000
G1 X149.818 Y123.665 E.08819
G1 X149.818 Y132.335 E.2664
G1 X146.948 Y132.335 E.08819
G1 X146.948 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.948 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.027 Y131.07 Z8.8 F42000
G1 X146.215 Y134.191 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7410
M204 S6000
G1 X146.215 Y133.134 E.03505
G1 X150.618 Y133.134 E.14605
G1 X150.618 Y122.866 E.34062
M73 P69 R6
G1 X146.215 Y122.866 E.14605
G1 X146.215 Y121.809 E.03504
G1 X151.899 Y121.809 E.18854
G1 X151.899 Y134.19 E.4107
G1 X146.275 Y134.191 E.18656
M204 S10000
G1 X145.808 Y134.598 F42000
G1 F7410
M204 S6000
G1 X145.808 Y121.402 E.43772
G1 X152.306 Y121.402 E.21555
G1 X152.306 Y134.598 E.43771
G1 X145.868 Y134.598 E.21357
M204 S250
G1 X145.416 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7410
M204 S5000
G1 X145.426 Y121.14 E.41951
G3 X145.606 Y121.01 I.184 J.066 E.00723
G1 X152.549 Y121.017 E.21336
G3 X152.698 Y121.199 I-.045 J.189 E.00777
G1 X152.698 Y134.794 E.41773
G1 X152.664 Y134.906 E.00362
G1 X152.568 Y134.978 E.00368
G3 X152.508 Y134.99 I-.069 J-.202 E.00187
G1 X145.543 Y134.978 E.21404
G3 X145.424 Y134.853 I.066 J-.181 E.0055
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.424 Y132.853 E-.76
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
G1 X146.182 Y132.931 F42000
G1 Z8.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.3844
G1 F7410
M204 S6000
G1 X146.182 Y123.069 E.2744
M204 S10000
G1 X146.418 Y122.338 F42000
; LINE_WIDTH: 0.692292
G1 F5543.822
M204 S6000
G1 X150.821 Y122.338 E.23297
M204 S10000
G1 X151.04 Y123.257 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.480031
G1 F7410
M204 S6000
G1 X151.04 Y132.898 E.34342
G1 X151.141 Y132.928 E.00377
; LINE_WIDTH: 0.463129
G1 X151.158 Y132.989 E.00219
; LINE_WIDTH: 0.429225
G1 X151.175 Y133.051 E.00201
; LINE_WIDTH: 0.378968
G1 X151.192 Y133.112 E.00175
G1 X151.192 Y133.819 E.01935
G1 X151.528 Y133.819 E.00919
G1 X151.528 Y133.112 E.01935
; LINE_WIDTH: 0.395322
G1 X151.511 Y132.989 E.00357
; LINE_WIDTH: 0.429225
G1 X151.494 Y132.866 E.00391
; LINE_WIDTH: 0.479812
G1 X151.477 Y132.743 E.00443
G1 X151.477 Y123.257 E.33772
; LINE_WIDTH: 0.463027
G1 X151.494 Y123.134 E.00425
; LINE_WIDTH: 0.42912
G1 X151.511 Y123.011 E.00391
; LINE_WIDTH: 0.379379
G1 X151.528 Y122.887 E.00341
G1 X151.528 Y122.181 E.01938
G1 X151.192 Y122.181 E.00919
G1 X151.192 Y122.887 E.01938
; LINE_WIDTH: 0.395214
G1 X151.175 Y122.949 E.00183
; LINE_WIDTH: 0.42912
G1 X151.158 Y123.011 E.00201
; LINE_WIDTH: 0.475895
G1 X151.141 Y123.072 E.00225
G1 X151.04 Y123.102 E.00374
G1 X151.04 Y123.197 E.00336
M204 S10000
G1 X150.821 Y133.662 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.692401
G1 F5542.89
M204 S6000
G1 X146.418 Y133.662 E.23301
; OBJECT_ID: 405
; WIPE_START
G1 X148.418 Y133.662 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X141.482 Y130.479 Z8.8 F42000
G1 X125.779 Y123.273 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7410
M204 S6000
G1 X129.041 Y123.273 E.10821
G1 X129.041 Y132.727 E.31361
G1 X125.387 Y132.727 E.12121
G1 X125.387 Y123.273 E.31361
G1 X125.719 Y123.273 E.01102
M204 S250
G1 X125.779 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7410
M204 S5000
G1 X128.649 Y123.665 E.08819
G1 X128.649 Y132.335 E.2664
G1 X125.779 Y132.335 E.08819
G1 X125.779 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.778 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.857 Y131.07 Z8.8 F42000
G1 X125.045 Y134.191 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7410
M204 S6000
G1 X125.045 Y133.134 E.03505
G1 X129.448 Y133.134 E.14605
G1 X129.448 Y122.866 E.34062
G1 X125.045 Y122.866 E.14605
G1 X125.045 Y121.809 E.03504
G1 X130.729 Y121.809 E.18854
G1 X130.729 Y134.19 E.4107
G1 X125.105 Y134.191 E.18656
M204 S10000
G1 X124.638 Y134.598 F42000
G1 F7410
M204 S6000
G1 X124.638 Y121.402 E.43772
G1 X131.136 Y121.402 E.21555
G1 X131.136 Y134.598 E.43771
G1 X124.698 Y134.598 E.21357
M204 S250
G1 X124.246 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7410
M204 S5000
G1 X124.256 Y121.14 E.41951
G3 X124.436 Y121.01 I.184 J.066 E.00723
G1 X131.379 Y121.017 E.21336
G3 X131.528 Y121.199 I-.045 J.189 E.00777
G1 X131.528 Y134.794 E.41773
G1 X131.494 Y134.906 E.00362
G1 X131.398 Y134.978 E.00368
G3 X131.339 Y134.99 I-.069 J-.202 E.00187
G1 X124.373 Y134.978 E.21404
G3 X124.254 Y134.853 I.066 J-.181 E.0055
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.255 Y132.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.249 Y133.662 Z8.8 F42000
G1 Z8.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692401
G1 F5542.89
M204 S6000
G1 X129.651 Y133.662 E.23301
; WIPE_START
G1 X127.651 Y133.662 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.012 Y132.931 Z8.8 F42000
G1 Z8.4
G1 E.8 F1800
; LINE_WIDTH: 0.3844
G1 F7410
M204 S6000
G1 X125.012 Y123.069 E.2744
M204 S10000
G1 X125.249 Y122.338 F42000
; LINE_WIDTH: 0.692292
G1 F5543.822
M204 S6000
G1 X129.651 Y122.338 E.23297
M204 S10000
G1 X129.87 Y123.257 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.480031
G1 F7410
M204 S6000
G1 X129.87 Y132.898 E.34342
G1 X129.972 Y132.928 E.00377
; LINE_WIDTH: 0.463129
G1 X129.989 Y132.989 E.00219
; LINE_WIDTH: 0.429225
G1 X130.006 Y133.051 E.00201
; LINE_WIDTH: 0.378968
G1 X130.023 Y133.112 E.00175
G1 X130.023 Y133.819 E.01935
G1 X130.358 Y133.819 E.00919
G1 X130.358 Y133.112 E.01935
; LINE_WIDTH: 0.395322
G1 X130.341 Y132.989 E.00357
; LINE_WIDTH: 0.429225
G1 X130.324 Y132.866 E.00391
; LINE_WIDTH: 0.479812
G1 X130.307 Y132.743 E.00443
G1 X130.307 Y123.257 E.33772
; LINE_WIDTH: 0.463027
G1 X130.324 Y123.134 E.00425
; LINE_WIDTH: 0.42912
G1 X130.341 Y123.011 E.00391
; LINE_WIDTH: 0.379379
G1 X130.358 Y122.887 E.00341
G1 X130.358 Y122.181 E.01938
G1 X130.022 Y122.181 E.00919
G1 X130.022 Y122.887 E.01938
; LINE_WIDTH: 0.395214
G1 X130.006 Y122.949 E.00183
; LINE_WIDTH: 0.42912
G1 X129.989 Y123.011 E.00201
; LINE_WIDTH: 0.475895
G1 X129.972 Y123.072 E.00225
G1 X129.87 Y123.102 E.00374
G1 X129.87 Y123.197 E.00336
; OBJECT_ID: 394
; WIPE_START
G1 F8314.57
G1 X129.87 Y123.102 E-.27313
G1 X129.972 Y123.072 E-.30374
G1 X129.989 Y123.011 E-.18313
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X122.357 Y123.089 Z8.8 F42000
G1 X104.609 Y123.273 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7410
M204 S6000
G1 X107.871 Y123.273 E.10821
G1 X107.871 Y132.727 E.31361
G1 X104.217 Y132.727 E.12121
G1 X104.217 Y123.273 E.31361
G1 X104.549 Y123.273 E.01102
M204 S250
G1 X104.609 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7410
M204 S5000
G1 X107.479 Y123.665 E.08819
G1 X107.479 Y132.335 E.2664
G1 X104.609 Y132.335 E.08819
G1 X104.609 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X106.609 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.687 Y131.07 Z8.8 F42000
G1 X103.875 Y134.191 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7410
M204 S6000
G1 X103.875 Y133.134 E.03505
G1 X108.278 Y133.134 E.14605
G1 X108.278 Y122.866 E.34062
G1 X103.875 Y122.866 E.14605
G1 X103.875 Y121.809 E.03504
G1 X109.559 Y121.809 E.18854
G1 X109.56 Y134.19 E.4107
G1 X103.935 Y134.191 E.18656
M204 S10000
G1 X103.468 Y134.598 F42000
G1 F7410
M204 S6000
G1 X103.468 Y121.402 E.43772
G1 X109.966 Y121.402 E.21555
G1 X109.967 Y134.598 E.43771
G1 X103.528 Y134.598 E.21357
M204 S250
G1 X103.076 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7410
M204 S5000
G1 X103.087 Y121.14 E.41951
G3 X103.266 Y121.01 I.184 J.066 E.00723
G1 X110.21 Y121.017 E.21336
G3 X110.358 Y121.199 I-.045 J.189 E.00777
G1 X110.359 Y134.794 E.41773
G1 X110.324 Y134.906 E.00362
G1 X110.228 Y134.978 E.00368
G3 X110.169 Y134.99 I-.069 J-.202 E.00187
G1 X103.203 Y134.978 E.21404
G3 X103.085 Y134.853 I.066 J-.181 E.0055
; WIPE_START
G1 F9547.055
M204 S6000
G1 X103.085 Y132.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.079 Y133.662 Z8.8 F42000
G1 Z8.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692401
G1 F5542.89
M204 S6000
G1 X108.482 Y133.662 E.23301
; WIPE_START
G1 X106.482 Y133.662 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.843 Y132.931 Z8.8 F42000
G1 Z8.4
G1 E.8 F1800
; LINE_WIDTH: 0.3844
G1 F7410
M204 S6000
G1 X103.843 Y123.069 E.2744
M204 S10000
G1 X104.079 Y122.338 F42000
; LINE_WIDTH: 0.692292
G1 F5543.822
M204 S6000
G1 X108.482 Y122.338 E.23297
M204 S10000
G1 X108.7 Y123.257 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.480031
G1 F7410
M204 S6000
G1 X108.7 Y132.898 E.34342
G1 X108.802 Y132.928 E.00377
; LINE_WIDTH: 0.463129
G1 X108.819 Y132.989 E.00219
; LINE_WIDTH: 0.429225
G1 X108.836 Y133.051 E.00201
; LINE_WIDTH: 0.378968
G1 X108.853 Y133.112 E.00175
G1 X108.853 Y133.819 E.01935
G1 X109.188 Y133.819 E.00919
G1 X109.188 Y133.112 E.01935
; LINE_WIDTH: 0.395322
G1 X109.171 Y132.989 E.00357
; LINE_WIDTH: 0.429225
G1 X109.154 Y132.866 E.00391
; LINE_WIDTH: 0.479812
G1 X109.137 Y132.743 E.00443
G1 X109.137 Y123.257 E.33772
; LINE_WIDTH: 0.463027
G1 X109.154 Y123.134 E.00425
; LINE_WIDTH: 0.42912
G1 X109.171 Y123.011 E.00391
; LINE_WIDTH: 0.379379
G1 X109.188 Y122.887 E.00341
G1 X109.188 Y122.181 E.01938
G1 X108.853 Y122.181 E.00919
G1 X108.853 Y122.887 E.01938
; LINE_WIDTH: 0.395214
G1 X108.836 Y122.949 E.00183
; LINE_WIDTH: 0.42912
G1 X108.819 Y123.011 E.00201
; LINE_WIDTH: 0.475895
G1 X108.802 Y123.072 E.00225
G1 X108.7 Y123.102 E.00374
G1 X108.7 Y123.197 E.00336
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F8314.57
G1 X108.7 Y123.102 E-.27313
G1 X108.802 Y123.072 E-.30374
G1 X108.819 Y123.011 E-.18313
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 43/72
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z8.8 I-.008 J1.217 P1  F42000
G1 X146.948 Y123.273 Z8.8
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7408
M204 S6000
G1 X150.211 Y123.273 E.10821
G1 X150.211 Y132.727 E.31361
G1 X146.556 Y132.727 E.12121
G1 X146.556 Y123.273 E.31361
G1 X146.888 Y123.273 E.01102
M204 S250
G1 X146.948 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7408
M204 S5000
G1 X149.818 Y123.665 E.08819
G1 X149.818 Y132.335 E.2664
G1 X146.948 Y132.335 E.08819
G1 X146.948 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.948 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.044 Y131.074 Z9 F42000
G1 X146.241 Y134.191 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7408
M204 S6000
G1 X146.241 Y133.134 E.03505
G1 X150.618 Y133.134 E.14517
G1 X150.618 Y122.866 E.34062
G1 X146.241 Y122.866 E.14517
G1 X146.241 Y121.809 E.03504
G1 X151.934 Y121.809 E.18886
G1 X151.935 Y134.19 E.4107
G1 X146.301 Y134.191 E.18687
M204 S10000
G1 X145.834 Y134.598 F42000
G1 F7408
M204 S6000
G1 X145.834 Y121.402 E.43772
G1 X152.342 Y121.402 E.21586
G1 X152.342 Y134.598 E.43771
G1 X145.894 Y134.598 E.21388
M204 S250
G1 X145.442 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7408
M204 S5000
G1 X145.452 Y121.14 E.41951
G3 X145.632 Y121.01 I.184 J.066 E.00723
G1 X152.573 Y121.014 E.21328
G3 X152.734 Y121.199 I-.034 J.192 E.00814
G1 X152.734 Y134.794 E.41773
G1 X152.7 Y134.906 E.00359
G1 X152.626 Y134.969 E.003
G3 X152.544 Y134.99 I-.098 J-.218 E.00261
G1 X145.569 Y134.978 E.21433
G3 X145.45 Y134.853 I.066 J-.182 E.0055
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.451 Y132.853 E-.76
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
G1 X146.195 Y132.931 F42000
G1 Z8.6
M73 P70 R6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.35807
G1 F7408
M204 S6000
G1 X146.195 Y123.069 E.25324
M204 S10000
G1 X146.445 Y122.338 F42000
; LINE_WIDTH: 0.692314
G1 F5543.633
M204 S6000
G1 X150.821 Y122.338 E.23158
M204 S10000
G1 X151.049 Y123.267 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.497891
G1 F7408
M204 S6000
G1 X151.049 Y132.892 E.35687
G1 X151.15 Y132.923 E.00394
; LINE_WIDTH: 0.480989
G1 X151.167 Y132.986 E.00234
; LINE_WIDTH: 0.447085
G1 X151.184 Y133.049 E.00215
; LINE_WIDTH: 0.396842
G1 X151.201 Y133.112 E.00189
G1 X151.201 Y133.81 E.02013
G1 X151.555 Y133.81 E.01019
G1 X151.555 Y133.112 E.02013
; LINE_WIDTH: 0.413182
G1 X151.538 Y132.986 E.00385
; LINE_WIDTH: 0.447085
G1 X151.521 Y132.86 E.0042
; LINE_WIDTH: 0.497666
G1 X151.504 Y132.733 E.00472
G1 X151.504 Y123.267 E.3508
; LINE_WIDTH: 0.480887
G1 X151.52 Y123.14 E.00455
; LINE_WIDTH: 0.44698
G1 X151.537 Y123.014 E.0042
; LINE_WIDTH: 0.397266
G1 X151.554 Y122.887 E.00368
G1 X151.554 Y122.189 E.02015
G1 X151.201 Y122.189 E.0102
G1 X151.201 Y122.887 E.02015
; LINE_WIDTH: 0.413074
G1 X151.184 Y122.951 E.00197
; LINE_WIDTH: 0.44698
G1 X151.167 Y123.014 E.00215
; LINE_WIDTH: 0.493741
G1 X151.15 Y123.077 E.0024
G1 X151.049 Y123.108 E.0039
G1 X151.049 Y123.207 E.00363
M204 S10000
G1 X150.821 Y133.662 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.692401
G1 F5542.889
M204 S6000
G1 X146.445 Y133.662 E.23161
; OBJECT_ID: 405
; WIPE_START
G1 X148.445 Y133.662 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X141.506 Y130.482 Z9 F42000
G1 X125.779 Y123.273 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7408
M204 S6000
G1 X129.041 Y123.273 E.10821
G1 X129.041 Y132.727 E.31361
G1 X125.387 Y132.727 E.12121
G1 X125.387 Y123.273 E.31361
G1 X125.719 Y123.273 E.01102
M204 S250
G1 X125.779 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7408
M204 S5000
G1 X128.649 Y123.665 E.08819
G1 X128.649 Y132.335 E.2664
G1 X125.779 Y132.335 E.08819
G1 X125.779 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.778 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.874 Y131.074 Z9 F42000
G1 X125.071 Y134.191 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7408
M204 S6000
G1 X125.071 Y133.134 E.03505
G1 X129.448 Y133.134 E.14517
G1 X129.448 Y122.866 E.34062
G1 X125.071 Y122.866 E.14517
G1 X125.071 Y121.809 E.03504
G1 X130.765 Y121.809 E.18886
G1 X130.765 Y134.19 E.4107
G1 X125.131 Y134.191 E.18687
M204 S10000
G1 X124.664 Y134.598 F42000
G1 F7408
M204 S6000
G1 X124.664 Y121.402 E.43772
G1 X131.172 Y121.402 E.21586
G1 X131.172 Y134.598 E.43771
G1 X124.724 Y134.598 E.21388
M204 S250
G1 X124.272 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7408
M204 S5000
G1 X124.283 Y121.14 E.41951
G3 X124.462 Y121.01 I.184 J.066 E.00723
G1 X131.403 Y121.014 E.21328
G3 X131.564 Y121.199 I-.034 J.192 E.00814
G1 X131.564 Y134.794 E.41773
G1 X131.53 Y134.906 E.00359
G1 X131.456 Y134.969 E.003
G3 X131.374 Y134.99 I-.098 J-.218 E.00261
G1 X124.399 Y134.978 E.21433
G3 X124.281 Y134.853 I.066 J-.182 E.0055
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.281 Y132.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.275 Y133.662 Z9 F42000
G1 Z8.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692401
G1 F5542.889
M204 S6000
G1 X129.651 Y133.662 E.23161
; WIPE_START
G1 X127.651 Y133.662 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.026 Y132.931 Z9 F42000
G1 Z8.6
G1 E.8 F1800
; LINE_WIDTH: 0.35807
G1 F7408
M204 S6000
G1 X125.026 Y123.069 E.25324
M204 S10000
G1 X125.275 Y122.338 F42000
; LINE_WIDTH: 0.692314
G1 F5543.633
M204 S6000
G1 X129.651 Y122.338 E.23158
M204 S10000
G1 X129.879 Y123.267 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.497891
G1 F7408
M204 S6000
G1 X129.879 Y132.892 E.35687
G1 X129.981 Y132.923 E.00394
; LINE_WIDTH: 0.480989
G1 X129.998 Y132.986 E.00234
; LINE_WIDTH: 0.447085
G1 X130.014 Y133.049 E.00215
; LINE_WIDTH: 0.396842
G1 X130.031 Y133.112 E.00189
G1 X130.031 Y133.81 E.02013
G1 X130.385 Y133.81 E.01019
G1 X130.385 Y133.112 E.02013
; LINE_WIDTH: 0.413182
G1 X130.368 Y132.986 E.00385
; LINE_WIDTH: 0.447085
G1 X130.351 Y132.86 E.0042
; LINE_WIDTH: 0.497666
G1 X130.334 Y132.733 E.00472
G1 X130.334 Y123.267 E.3508
; LINE_WIDTH: 0.480887
G1 X130.351 Y123.14 E.00455
; LINE_WIDTH: 0.44698
G1 X130.368 Y123.014 E.0042
; LINE_WIDTH: 0.397266
G1 X130.385 Y122.887 E.00368
G1 X130.385 Y122.189 E.02015
G1 X130.031 Y122.189 E.0102
G1 X130.031 Y122.887 E.02015
; LINE_WIDTH: 0.413074
G1 X130.014 Y122.951 E.00197
; LINE_WIDTH: 0.44698
G1 X129.998 Y123.014 E.00215
; LINE_WIDTH: 0.493741
G1 X129.981 Y123.077 E.0024
G1 X129.879 Y123.108 E.0039
G1 X129.879 Y123.207 E.00363
; OBJECT_ID: 394
; WIPE_START
G1 F7985.434
G1 X129.879 Y123.108 E-.27778
G1 X129.981 Y123.077 E-.29846
G1 X129.998 Y123.014 E-.18376
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X122.365 Y123.092 Z9 F42000
G1 X104.609 Y123.273 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7408
M204 S6000
G1 X107.871 Y123.273 E.10821
G1 X107.871 Y132.727 E.31361
G1 X104.217 Y132.727 E.12121
G1 X104.217 Y123.273 E.31361
G1 X104.549 Y123.273 E.01102
M204 S250
G1 X104.609 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7408
M204 S5000
G1 X107.479 Y123.665 E.08819
G1 X107.479 Y132.335 E.2664
G1 X104.609 Y132.335 E.08819
G1 X104.609 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X106.609 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.705 Y131.074 Z9 F42000
G1 X103.902 Y134.191 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7408
M204 S6000
G1 X103.902 Y133.134 E.03505
G1 X108.278 Y133.134 E.14517
G1 X108.278 Y122.866 E.34062
G1 X103.902 Y122.866 E.14517
G1 X103.902 Y121.809 E.03504
G1 X109.595 Y121.809 E.18886
G1 X109.595 Y134.19 E.4107
G1 X103.962 Y134.191 E.18687
M204 S10000
G1 X103.495 Y134.598 F42000
G1 F7408
M204 S6000
G1 X103.495 Y121.402 E.43772
G1 X110.002 Y121.402 E.21586
G1 X110.002 Y134.598 E.43771
G1 X103.555 Y134.598 E.21388
M204 S250
G1 X103.103 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7408
M204 S5000
G1 X103.113 Y121.14 E.41951
G3 X103.292 Y121.01 I.184 J.066 E.00723
G1 X110.234 Y121.014 E.21328
G3 X110.394 Y121.199 I-.034 J.192 E.00814
G1 X110.394 Y134.794 E.41773
G1 X110.361 Y134.906 E.00359
G1 X110.287 Y134.969 E.003
G3 X110.205 Y134.99 I-.098 J-.218 E.00261
G1 X103.229 Y134.978 E.21433
G3 X103.111 Y134.853 I.066 J-.182 E.0055
; WIPE_START
G1 F9547.055
M204 S6000
G1 X103.111 Y132.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.105 Y133.662 Z9 F42000
G1 Z8.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692401
G1 F5542.889
M204 S6000
G1 X108.482 Y133.662 E.23161
; WIPE_START
G1 X106.482 Y133.662 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.856 Y132.931 Z9 F42000
G1 Z8.6
G1 E.8 F1800
; LINE_WIDTH: 0.35807
G1 F7408
M204 S6000
G1 X103.856 Y123.069 E.25324
M204 S10000
G1 X104.105 Y122.338 F42000
; LINE_WIDTH: 0.692314
G1 F5543.633
M204 S6000
G1 X108.482 Y122.338 E.23158
M204 S10000
G1 X108.709 Y123.267 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.497891
G1 F7408
M204 S6000
G1 X108.709 Y132.892 E.35687
G1 X108.811 Y132.923 E.00394
; LINE_WIDTH: 0.480989
G1 X108.828 Y132.986 E.00234
; LINE_WIDTH: 0.447085
G1 X108.845 Y133.049 E.00215
; LINE_WIDTH: 0.396842
G1 X108.862 Y133.112 E.00189
G1 X108.862 Y133.81 E.02013
G1 X109.215 Y133.81 E.01019
G1 X109.215 Y133.112 E.02013
; LINE_WIDTH: 0.413182
G1 X109.198 Y132.986 E.00385
; LINE_WIDTH: 0.447085
G1 X109.181 Y132.86 E.0042
; LINE_WIDTH: 0.497666
G1 X109.164 Y132.733 E.00472
G1 X109.164 Y123.267 E.3508
; LINE_WIDTH: 0.480887
G1 X109.181 Y123.14 E.00455
; LINE_WIDTH: 0.44698
G1 X109.198 Y123.014 E.0042
; LINE_WIDTH: 0.397266
G1 X109.215 Y122.887 E.00368
G1 X109.215 Y122.189 E.02015
G1 X108.862 Y122.189 E.0102
G1 X108.862 Y122.887 E.02015
; LINE_WIDTH: 0.413074
G1 X108.845 Y122.951 E.00197
; LINE_WIDTH: 0.44698
G1 X108.828 Y123.014 E.00215
; LINE_WIDTH: 0.493741
G1 X108.811 Y123.077 E.0024
G1 X108.709 Y123.108 E.0039
G1 X108.709 Y123.207 E.00363
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7985.434
G1 X108.709 Y123.108 E-.27778
G1 X108.811 Y123.077 E-.29846
G1 X108.828 Y123.014 E-.18376
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 44/72
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z9 I-.008 J1.217 P1  F42000
G1 X146.948 Y123.273 Z9
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7404
M204 S6000
G1 X150.211 Y123.273 E.10821
G1 X150.211 Y132.727 E.31361
G1 X146.556 Y132.727 E.12121
G1 X146.556 Y123.273 E.31361
G1 X146.888 Y123.273 E.01102
M204 S250
G1 X146.948 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7404
M204 S5000
G1 X149.818 Y123.665 E.08819
G1 X149.818 Y132.335 E.2664
G1 X146.948 Y132.335 E.08819
G1 X146.948 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.948 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.063 Y131.079 Z9.2 F42000
G1 X146.27 Y134.191 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7404
M204 S6000
G1 X146.27 Y133.134 E.03505
G1 X150.618 Y133.134 E.14422
G1 X150.618 Y122.866 E.34062
G1 X146.27 Y122.866 E.14422
G1 X146.27 Y121.809 E.03504
G1 X151.97 Y121.809 E.18909
G1 X151.97 Y134.191 E.41071
G1 X146.33 Y134.191 E.1871
M204 S10000
G1 X145.863 Y134.598 F42000
G1 F7404
M204 S6000
G1 X145.863 Y121.402 E.43772
G1 X152.377 Y121.402 E.21609
G1 X152.378 Y134.598 E.43772
G1 X145.923 Y134.598 E.21411
M204 S250
G1 X145.471 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7404
M204 S5000
G1 X145.481 Y121.14 E.4195
G3 X145.664 Y121.01 I.186 J.068 E.00731
G1 X152.609 Y121.014 E.21341
G3 X152.769 Y121.199 I-.034 J.192 E.00814
G1 X152.77 Y134.794 E.41773
G1 X152.749 Y134.884 E.00284
G3 X152.574 Y134.99 I-.18 J-.101 E.00657
G1 X145.673 Y134.99 E.21204
G1 X145.599 Y134.978 E.0023
G3 X145.479 Y134.853 I.065 J-.182 E.00552
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.48 Y132.853 E-.76
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
G1 X146.21 Y132.931 F42000
G1 Z8.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.32928
G1 F7404
M204 S6000
G1 X146.21 Y123.069 E.2301
M204 S10000
G1 X146.474 Y122.338 F42000
; LINE_WIDTH: 0.692336
G1 F5543.449
M204 S6000
G1 X150.821 Y122.338 E.23006
M204 S10000
G1 X151.058 Y123.276 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515756
G1 F7404
M204 S6000
G1 X151.058 Y132.886 E.37029
G1 X151.159 Y132.918 E.00411
; LINE_WIDTH: 0.498849
G1 X151.176 Y132.983 E.00249
; LINE_WIDTH: 0.464945
G1 X151.193 Y133.048 E.0023
; LINE_WIDTH: 0.414715
G1 X151.21 Y133.113 E.00203
G1 X151.21 Y133.802 E.02088
G1 X151.581 Y133.802 E.01125
G1 X151.581 Y133.113 E.02088
; LINE_WIDTH: 0.431042
G1 X151.564 Y132.983 E.00413
; LINE_WIDTH: 0.464945
G1 X151.547 Y132.853 E.00449
; LINE_WIDTH: 0.515525
G1 X151.53 Y132.724 E.00503
G1 X151.53 Y123.276 E.36385
; LINE_WIDTH: 0.498755
G1 X151.547 Y123.146 E.00485
; LINE_WIDTH: 0.464845
G1 X151.564 Y123.017 E.00449
; LINE_WIDTH: 0.415159
G1 X151.581 Y122.887 E.00396
G1 X151.581 Y122.198 E.0209
G1 X151.21 Y122.198 E.01126
G1 X151.21 Y122.887 E.0209
; LINE_WIDTH: 0.430935
G1 X151.193 Y122.952 E.00212
; LINE_WIDTH: 0.464845
G1 X151.176 Y123.017 E.0023
; LINE_WIDTH: 0.511598
G1 X151.159 Y123.082 E.00256
G1 X151.058 Y123.113 E.00407
G1 X151.058 Y123.216 E.00391
M204 S10000
G1 X150.821 Y133.662 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.692499
G1 F5542.058
M204 S6000
G1 X146.474 Y133.662 E.23012
; OBJECT_ID: 405
; WIPE_START
G1 X148.474 Y133.662 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X141.534 Y130.485 Z9.2 F42000
G1 X125.779 Y123.273 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7404
M204 S6000
G1 X129.041 Y123.273 E.10821
G1 X129.041 Y132.727 E.31361
G1 X125.387 Y132.727 E.12121
G1 X125.387 Y123.273 E.31361
G1 X125.719 Y123.273 E.01102
M204 S250
G1 X125.779 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7404
M204 S5000
G1 X128.649 Y123.665 E.08819
G1 X128.649 Y132.335 E.2664
G1 X125.779 Y132.335 E.08819
G1 X125.779 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.778 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.893 Y131.079 Z9.2 F42000
G1 X125.1 Y134.191 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7404
M204 S6000
G1 X125.1 Y133.134 E.03505
G1 X129.448 Y133.134 E.14422
G1 X129.448 Y122.866 E.34062
M73 P71 R6
G1 X125.1 Y122.866 E.14422
G1 X125.1 Y121.809 E.03504
G1 X130.8 Y121.809 E.18909
G1 X130.801 Y134.191 E.41071
G1 X125.16 Y134.191 E.1871
M204 S10000
G1 X124.693 Y134.598 F42000
G1 F7404
M204 S6000
G1 X124.693 Y121.402 E.43772
G1 X131.208 Y121.402 E.21609
G1 X131.208 Y134.598 E.43772
G1 X124.753 Y134.598 E.21411
M204 S250
G1 X124.301 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7404
M204 S5000
G1 X124.311 Y121.14 E.4195
G3 X124.494 Y121.01 I.186 J.068 E.00731
G1 X131.439 Y121.014 E.21341
G3 X131.6 Y121.199 I-.034 J.192 E.00814
G1 X131.6 Y134.794 E.41773
G1 X131.579 Y134.884 E.00284
G3 X131.404 Y134.99 I-.18 J-.101 E.00657
G1 X124.503 Y134.99 E.21204
G1 X124.429 Y134.978 E.0023
G3 X124.31 Y134.853 I.065 J-.182 E.00552
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.31 Y132.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.304 Y133.662 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692499
G1 F5542.058
M204 S6000
G1 X129.651 Y133.662 E.23012
; WIPE_START
G1 X127.651 Y133.662 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.04 Y132.931 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
; LINE_WIDTH: 0.32928
G1 F7404
M204 S6000
G1 X125.04 Y123.069 E.2301
M204 S10000
G1 X125.304 Y122.338 F42000
; LINE_WIDTH: 0.692336
G1 F5543.449
M204 S6000
G1 X129.651 Y122.338 E.23006
M204 S10000
G1 X129.888 Y123.276 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515756
G1 F7404
M204 S6000
G1 X129.888 Y132.886 E.37029
G1 X129.99 Y132.918 E.00411
; LINE_WIDTH: 0.498849
G1 X130.006 Y132.983 E.00249
; LINE_WIDTH: 0.464945
G1 X130.023 Y133.048 E.0023
; LINE_WIDTH: 0.414715
G1 X130.04 Y133.113 E.00203
G1 X130.04 Y133.802 E.02088
G1 X130.412 Y133.802 E.01125
G1 X130.412 Y133.113 E.02088
; LINE_WIDTH: 0.431042
G1 X130.395 Y132.983 E.00413
; LINE_WIDTH: 0.464945
G1 X130.378 Y132.853 E.00449
; LINE_WIDTH: 0.515525
G1 X130.361 Y132.724 E.00503
G1 X130.361 Y123.276 E.36385
; LINE_WIDTH: 0.498755
G1 X130.378 Y123.146 E.00485
; LINE_WIDTH: 0.464845
G1 X130.394 Y123.017 E.00449
; LINE_WIDTH: 0.415159
G1 X130.411 Y122.887 E.00396
G1 X130.411 Y122.198 E.0209
G1 X130.04 Y122.198 E.01126
G1 X130.04 Y122.887 E.0209
; LINE_WIDTH: 0.430935
G1 X130.023 Y122.952 E.00212
; LINE_WIDTH: 0.464845
G1 X130.006 Y123.017 E.0023
; LINE_WIDTH: 0.511598
G1 X129.989 Y123.082 E.00256
G1 X129.888 Y123.113 E.00407
G1 X129.888 Y123.216 E.00391
; OBJECT_ID: 394
; WIPE_START
G1 F7681.185
G1 X129.888 Y123.113 E-.28216
G1 X129.989 Y123.082 E-.2935
G1 X130.006 Y123.017 E-.18433
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X122.374 Y123.094 Z9.2 F42000
G1 X104.609 Y123.273 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7404
M204 S6000
G1 X107.871 Y123.273 E.10821
G1 X107.871 Y132.727 E.31361
G1 X104.217 Y132.727 E.12121
G1 X104.217 Y123.273 E.31361
G1 X104.549 Y123.273 E.01102
M204 S250
G1 X104.609 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7404
M204 S5000
G1 X107.479 Y123.665 E.08819
G1 X107.479 Y132.335 E.2664
G1 X104.609 Y132.335 E.08819
G1 X104.609 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X106.609 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.724 Y131.079 Z9.2 F42000
G1 X103.931 Y134.191 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7404
M204 S6000
G1 X103.931 Y133.134 E.03505
G1 X108.278 Y133.134 E.14422
G1 X108.278 Y122.866 E.34062
G1 X103.931 Y122.866 E.14422
G1 X103.931 Y121.809 E.03504
G1 X109.631 Y121.809 E.18909
G1 X109.631 Y134.191 E.41071
G1 X103.991 Y134.191 E.1871
M204 S10000
G1 X103.523 Y134.598 F42000
G1 F7404
M204 S6000
G1 X103.523 Y121.402 E.43772
G1 X110.038 Y121.402 E.21609
G1 X110.038 Y134.598 E.43772
G1 X103.583 Y134.598 E.21411
M204 S250
G1 X103.131 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7404
M204 S5000
G1 X103.142 Y121.14 E.4195
G3 X103.324 Y121.01 I.186 J.068 E.00731
G1 X110.269 Y121.014 E.21341
G3 X110.43 Y121.199 I-.034 J.192 E.00814
G1 X110.43 Y134.794 E.41773
G1 X110.409 Y134.884 E.00284
G3 X110.234 Y134.99 I-.18 J-.101 E.00657
G1 X103.333 Y134.99 E.21204
G1 X103.26 Y134.978 E.0023
G3 X103.14 Y134.853 I.065 J-.182 E.00552
; WIPE_START
G1 F9547.055
M204 S6000
G1 X103.14 Y132.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.134 Y133.662 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692499
G1 F5542.058
M204 S6000
G1 X108.482 Y133.662 E.23012
; WIPE_START
G1 X106.482 Y133.662 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.87 Y132.931 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
; LINE_WIDTH: 0.32928
G1 F7404
M204 S6000
G1 X103.87 Y123.069 E.2301
M204 S10000
G1 X104.134 Y122.338 F42000
; LINE_WIDTH: 0.692336
G1 F5543.449
M204 S6000
G1 X108.482 Y122.338 E.23006
M204 S10000
G1 X108.718 Y123.276 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515756
G1 F7404
M204 S6000
G1 X108.718 Y132.886 E.37029
G1 X108.82 Y132.918 E.00411
; LINE_WIDTH: 0.498849
G1 X108.837 Y132.983 E.00249
; LINE_WIDTH: 0.464945
G1 X108.854 Y133.048 E.0023
; LINE_WIDTH: 0.414715
G1 X108.871 Y133.113 E.00203
G1 X108.871 Y133.802 E.02088
G1 X109.242 Y133.802 E.01125
G1 X109.242 Y133.113 E.02088
; LINE_WIDTH: 0.431042
G1 X109.225 Y132.983 E.00413
; LINE_WIDTH: 0.464945
G1 X109.208 Y132.853 E.00449
; LINE_WIDTH: 0.515525
G1 X109.191 Y132.724 E.00503
G1 X109.191 Y123.276 E.36385
; LINE_WIDTH: 0.498755
G1 X109.208 Y123.146 E.00485
; LINE_WIDTH: 0.464845
G1 X109.225 Y123.017 E.00449
; LINE_WIDTH: 0.415159
G1 X109.242 Y122.887 E.00396
G1 X109.242 Y122.198 E.0209
G1 X108.871 Y122.198 E.01126
G1 X108.871 Y122.887 E.0209
; LINE_WIDTH: 0.430935
G1 X108.854 Y122.952 E.00212
; LINE_WIDTH: 0.464845
G1 X108.837 Y123.017 E.0023
; LINE_WIDTH: 0.511598
G1 X108.82 Y123.082 E.00256
G1 X108.718 Y123.113 E.00407
G1 X108.718 Y123.216 E.00391
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7681.185
G1 X108.718 Y123.113 E-.28216
G1 X108.82 Y123.082 E-.2935
G1 X108.837 Y123.017 E-.18433
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 45/72
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z9.2 I-.008 J1.217 P1  F42000
G1 X146.948 Y123.273 Z9.2
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7404
M204 S6000
G1 X150.211 Y123.273 E.10821
G1 X150.211 Y132.727 E.31361
G1 X146.556 Y132.727 E.12121
G1 X146.556 Y123.273 E.31361
G1 X146.888 Y123.273 E.01102
M204 S250
G1 X146.948 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7404
M204 S5000
G1 X149.818 Y123.665 E.08819
G1 X149.818 Y132.335 E.2664
G1 X146.948 Y132.335 E.08819
G1 X146.948 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.948 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.087 Y131.085 Z9.4 F42000
G1 X146.306 Y134.191 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7404
M204 S6000
G1 X146.306 Y133.134 E.03505
G1 X150.618 Y133.134 E.14303
G1 X150.618 Y122.866 E.34062
G1 X146.306 Y122.866 E.14303
G1 X146.306 Y121.809 E.03505
G1 X152.006 Y121.809 E.18908
G1 X152.006 Y134.19 E.41071
G1 X146.366 Y134.191 E.1871
M204 S10000
G1 X145.899 Y134.598 F42000
G1 F7404
M204 S6000
G1 X145.899 Y121.402 E.43772
G1 X152.413 Y121.402 E.21609
G1 X152.413 Y134.598 E.43771
G1 X145.959 Y134.598 E.2141
M204 S250
G1 X145.507 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7404
M204 S5000
G1 X145.517 Y121.14 E.4195
G3 X145.7 Y121.01 I.186 J.068 E.00731
G1 X152.645 Y121.014 E.21341
G3 X152.805 Y121.199 I-.034 J.191 E.00813
G1 X152.805 Y134.794 E.41773
G1 X152.772 Y134.906 E.00359
G1 X152.698 Y134.969 E.00299
G3 X152.616 Y134.99 I-.098 J-.218 E.00261
G1 X145.709 Y134.99 E.21222
G1 X145.635 Y134.978 E.0023
G3 X145.515 Y134.853 I.065 J-.182 E.00552
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.516 Y132.853 E-.76
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
G1 X146.228 Y132.931 F42000
G1 Z9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.29339
G1 F7404
M204 S6000
G1 X146.228 Y123.069 E.20126
M204 S10000
G1 X146.509 Y122.338 F42000
; LINE_WIDTH: 0.692356
G1 F5543.277
M204 S6000
G1 X150.821 Y122.338 E.22817
M204 S10000
G1 X151.066 Y123.285 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.533616
G1 F7336.525
M204 S6000
G1 X151.066 Y132.881 E.38368
G1 X151.168 Y132.914 E.00427
; LINE_WIDTH: 0.516709
G1 F7404
G1 X151.185 Y132.98 E.00264
; LINE_WIDTH: 0.482805
G1 X151.202 Y133.046 E.00245
; LINE_WIDTH: 0.432589
G1 X151.219 Y133.112 E.00217
G1 X151.219 Y133.792 E.02159
G1 X151.608 Y133.792 E.01235
G1 X151.608 Y133.112 E.02159
; LINE_WIDTH: 0.448902
G1 X151.591 Y132.98 E.00442
; LINE_WIDTH: 0.482805
G1 X151.574 Y132.847 E.00479
; LINE_WIDTH: 0.533379
G1 F7340.069
G1 X151.557 Y132.715 E.00534
G1 X151.557 Y123.285 E.37686
; LINE_WIDTH: 0.516615
G1 F7404
G1 X151.574 Y123.153 E.00516
; LINE_WIDTH: 0.482705
G1 X151.591 Y123.02 E.00479
; LINE_WIDTH: 0.433044
G1 X151.608 Y122.887 E.00425
G1 X151.608 Y122.207 E.02162
G1 X151.219 Y122.207 E.01236
G1 X151.219 Y122.887 E.02162
; LINE_WIDTH: 0.448795
G1 X151.202 Y122.954 E.00226
; LINE_WIDTH: 0.482705
G1 X151.185 Y123.02 E.00245
; LINE_WIDTH: 0.529447
G1 F7399.396
G1 X151.168 Y123.086 E.00271
G1 X151.066 Y123.119 E.00424
G1 X151.066 Y123.225 E.0042
M204 S10000
G1 X150.821 Y133.662 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.692401
G1 F5542.887
M204 S6000
G1 X146.509 Y133.662 E.22819
; OBJECT_ID: 405
; WIPE_START
G1 X148.509 Y133.662 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X141.568 Y130.49 Z9.4 F42000
G1 X125.779 Y123.273 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7404
M204 S6000
G1 X129.041 Y123.273 E.10821
G1 X129.041 Y132.727 E.31361
G1 X125.387 Y132.727 E.12121
G1 X125.387 Y123.273 E.31361
G1 X125.719 Y123.273 E.01102
M204 S250
G1 X125.779 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7404
M204 S5000
G1 X128.649 Y123.665 E.08819
G1 X128.649 Y132.335 E.2664
G1 X125.779 Y132.335 E.08819
G1 X125.779 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.778 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.917 Y131.085 Z9.4 F42000
G1 X125.136 Y134.191 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7404
M204 S6000
G1 X125.136 Y133.134 E.03505
G1 X129.448 Y133.134 E.14303
G1 X129.448 Y122.866 E.34062
G1 X125.136 Y122.866 E.14303
G1 X125.136 Y121.809 E.03505
G1 X130.836 Y121.809 E.18908
G1 X130.836 Y134.19 E.41071
G1 X125.196 Y134.191 E.1871
M204 S10000
G1 X124.729 Y134.598 F42000
G1 F7404
M204 S6000
G1 X124.729 Y121.402 E.43772
G1 X131.243 Y121.402 E.21609
G1 X131.243 Y134.598 E.43771
G1 X124.789 Y134.598 E.2141
M204 S250
G1 X124.337 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7404
M204 S5000
G1 X124.347 Y121.14 E.4195
G3 X124.53 Y121.01 I.186 J.068 E.00731
G1 X131.475 Y121.014 E.21341
G3 X131.635 Y121.199 I-.034 J.191 E.00813
G1 X131.636 Y134.794 E.41773
G1 X131.602 Y134.906 E.00359
G1 X131.528 Y134.969 E.00299
G3 X131.446 Y134.99 I-.098 J-.218 E.00261
G1 X124.539 Y134.99 E.21222
G1 X124.465 Y134.978 E.0023
G3 X124.346 Y134.853 I.065 J-.182 E.00552
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.346 Y132.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P72 R6
G1 X125.34 Y133.662 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692401
G1 F5542.887
M204 S6000
G1 X129.651 Y133.662 E.22819
; WIPE_START
G1 X127.651 Y133.662 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.058 Y132.931 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.29339
G1 F7404
M204 S6000
G1 X125.058 Y123.069 E.20126
M204 S10000
G1 X125.34 Y122.338 F42000
; LINE_WIDTH: 0.692356
G1 F5543.277
M204 S6000
G1 X129.651 Y122.338 E.22817
M204 S10000
G1 X129.897 Y123.285 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.533616
G1 F7336.525
M204 S6000
G1 X129.897 Y132.881 E.38368
G1 X129.998 Y132.914 E.00427
; LINE_WIDTH: 0.516709
G1 F7404
G1 X130.015 Y132.98 E.00264
; LINE_WIDTH: 0.482805
G1 X130.032 Y133.046 E.00245
; LINE_WIDTH: 0.432589
G1 X130.049 Y133.112 E.00217
G1 X130.049 Y133.792 E.02159
G1 X130.438 Y133.792 E.01235
G1 X130.438 Y133.112 E.02159
; LINE_WIDTH: 0.448902
G1 X130.421 Y132.98 E.00442
; LINE_WIDTH: 0.482805
G1 X130.404 Y132.847 E.00479
; LINE_WIDTH: 0.533379
G1 F7340.069
G1 X130.387 Y132.715 E.00534
G1 X130.387 Y123.285 E.37686
; LINE_WIDTH: 0.516615
G1 F7404
G1 X130.404 Y123.153 E.00516
; LINE_WIDTH: 0.482705
G1 X130.421 Y123.02 E.00479
; LINE_WIDTH: 0.433044
G1 X130.438 Y122.887 E.00425
G1 X130.438 Y122.207 E.02162
G1 X130.049 Y122.207 E.01236
G1 X130.049 Y122.887 E.02162
; LINE_WIDTH: 0.448795
G1 X130.032 Y122.954 E.00226
; LINE_WIDTH: 0.482705
G1 X130.015 Y123.02 E.00245
; LINE_WIDTH: 0.529447
G1 F7399.396
G1 X129.998 Y123.086 E.00271
G1 X129.897 Y123.119 E.00424
G1 X129.897 Y123.225 E.0042
; OBJECT_ID: 394
; WIPE_START
G1 X129.897 Y123.119 E-.28635
G1 X129.998 Y123.086 E-.2888
G1 X130.015 Y123.02 E-.18485
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X122.383 Y123.096 Z9.4 F42000
G1 X104.609 Y123.273 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7404
M204 S6000
G1 X107.871 Y123.273 E.10821
G1 X107.871 Y132.727 E.31361
G1 X104.217 Y132.727 E.12121
G1 X104.217 Y123.273 E.31361
G1 X104.549 Y123.273 E.01102
M204 S250
G1 X104.609 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7404
M204 S5000
G1 X107.479 Y123.665 E.08819
G1 X107.479 Y132.335 E.2664
G1 X104.609 Y132.335 E.08819
G1 X104.609 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X106.609 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.747 Y131.085 Z9.4 F42000
G1 X103.966 Y134.191 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7404
M204 S6000
G1 X103.966 Y133.134 E.03505
G1 X108.278 Y133.134 E.14303
G1 X108.278 Y122.866 E.34062
G1 X103.966 Y122.866 E.14303
G1 X103.966 Y121.809 E.03505
G1 X109.666 Y121.809 E.18908
G1 X109.667 Y134.19 E.41071
G1 X104.026 Y134.191 E.1871
M204 S10000
G1 X103.559 Y134.598 F42000
G1 F7404
M204 S6000
G1 X103.559 Y121.402 E.43772
G1 X110.073 Y121.402 E.21609
G1 X110.074 Y134.598 E.43771
G1 X103.619 Y134.598 E.2141
M204 S250
G1 X103.167 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7404
M204 S5000
G1 X103.178 Y121.14 E.4195
G3 X103.36 Y121.01 I.186 J.068 E.00731
G1 X110.305 Y121.014 E.21341
G3 X110.466 Y121.199 I-.034 J.191 E.00813
G1 X110.466 Y134.794 E.41773
G1 X110.432 Y134.906 E.00359
G1 X110.358 Y134.969 E.00299
G3 X110.276 Y134.99 I-.098 J-.218 E.00261
G1 X103.37 Y134.99 E.21222
G1 X103.296 Y134.978 E.0023
G3 X103.176 Y134.853 I.065 J-.182 E.00552
; WIPE_START
G1 F9547.055
M204 S6000
G1 X103.176 Y132.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.17 Y133.662 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692401
G1 F5542.887
M204 S6000
G1 X108.482 Y133.662 E.22819
; WIPE_START
G1 X106.482 Y133.662 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.888 Y132.931 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.29339
G1 F7404
M204 S6000
G1 X103.888 Y123.069 E.20126
M204 S10000
G1 X104.17 Y122.338 F42000
; LINE_WIDTH: 0.692356
G1 F5543.277
M204 S6000
G1 X108.482 Y122.338 E.22817
M204 S10000
G1 X108.727 Y123.285 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.533616
G1 F7336.525
M204 S6000
G1 X108.727 Y132.881 E.38368
G1 X108.829 Y132.914 E.00427
; LINE_WIDTH: 0.516709
G1 F7404
G1 X108.846 Y132.98 E.00264
; LINE_WIDTH: 0.482805
G1 X108.863 Y133.046 E.00245
; LINE_WIDTH: 0.432589
G1 X108.88 Y133.112 E.00217
G1 X108.88 Y133.792 E.02159
G1 X109.269 Y133.792 E.01235
G1 X109.269 Y133.112 E.02159
; LINE_WIDTH: 0.448902
G1 X109.252 Y132.98 E.00442
; LINE_WIDTH: 0.482805
G1 X109.235 Y132.847 E.00479
; LINE_WIDTH: 0.533379
G1 F7340.069
G1 X109.218 Y132.715 E.00534
G1 X109.218 Y123.285 E.37686
; LINE_WIDTH: 0.516615
G1 F7404
G1 X109.235 Y123.153 E.00516
; LINE_WIDTH: 0.482705
G1 X109.251 Y123.02 E.00479
; LINE_WIDTH: 0.433044
G1 X109.268 Y122.887 E.00425
G1 X109.268 Y122.207 E.02162
G1 X108.88 Y122.207 E.01236
G1 X108.88 Y122.887 E.02162
; LINE_WIDTH: 0.448795
G1 X108.863 Y122.954 E.00226
; LINE_WIDTH: 0.482705
G1 X108.846 Y123.02 E.00245
; LINE_WIDTH: 0.529447
G1 F7399.396
G1 X108.829 Y123.086 E.00271
G1 X108.727 Y123.119 E.00424
G1 X108.727 Y123.225 E.0042
; CHANGE_LAYER
; Z_HEIGHT: 9.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7399.396
G1 X108.727 Y123.119 E-.28635
G1 X108.829 Y123.086 E-.2888
G1 X108.846 Y123.02 E-.18485
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 46/72
; update layer progress
M73 L46
M991 S0 P45 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z9.4 I-.008 J1.217 P1  F42000
G1 X146.948 Y123.273 Z9.4
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7426
M204 S6000
G1 X150.211 Y123.273 E.10821
G1 X150.211 Y132.727 E.31361
G1 X146.556 Y132.727 E.12121
G1 X146.556 Y123.273 E.31361
G1 X146.888 Y123.273 E.01102
M204 S250
G1 X146.948 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7426
M204 S5000
G1 X149.818 Y123.665 E.08819
G1 X149.818 Y132.335 E.2664
G1 X146.948 Y132.335 E.08819
G1 X146.948 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.948 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.111 Y131.091 Z9.6 F42000
G1 X146.342 Y134.191 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7426
M204 S6000
G1 X146.342 Y133.134 E.03505
G1 X150.618 Y133.134 E.14184
G1 X150.618 Y122.866 E.34062
G1 X146.342 Y122.866 E.14184
G1 X146.342 Y121.809 E.03504
G1 X152.042 Y121.809 E.18907
G1 X152.042 Y134.19 E.41071
G1 X146.402 Y134.191 E.18709
M204 S10000
G1 X145.935 Y134.598 F42000
G1 F7426
M204 S6000
G1 X145.935 Y121.402 E.43772
G1 X152.449 Y121.402 E.21608
G1 X152.449 Y134.598 E.43771
G1 X145.995 Y134.598 E.2141
M204 S250
G1 X145.543 Y134.793 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7426
M204 S5000
G1 X145.553 Y121.14 E.4195
G3 X145.735 Y121.01 I.186 J.068 E.00731
G1 X152.681 Y121.014 E.21341
G3 X152.841 Y121.199 I-.035 J.192 E.00812
G1 X152.839 Y134.821 E.41856
G3 X152.651 Y134.99 I-.197 J-.03 E.00842
G1 X145.745 Y134.99 E.21221
G1 X145.671 Y134.978 E.0023
G3 X145.551 Y134.853 I.065 J-.182 E.00552
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.551 Y132.853 E-.76
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
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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
G1 X146.246 Y132.931 F42000
G1 Z9.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.25751
G1 F7426
M204 S6000
G1 X146.246 Y123.069 E.17243
M204 S10000
G1 X146.545 Y122.338 F42000
; LINE_WIDTH: 0.692369
G1 F5543.166
M204 S6000
G1 X150.821 Y122.338 E.22628
M204 S10000
G1 X151.075 Y123.294 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.551476
G1 F7078.874
M204 S6000
G1 X151.075 Y132.875 E.39704
G1 X151.177 Y132.909 E.00444
; LINE_WIDTH: 0.53457
G1 F7322.282
G1 X151.194 Y132.977 E.0028
; LINE_WIDTH: 0.50067
G1 F7426
G1 X151.211 Y133.045 E.00261
; LINE_WIDTH: 0.450472
G1 X151.228 Y133.112 E.00232
G1 X151.228 Y133.784 E.02229
G1 X151.635 Y133.784 E.01351
G1 X151.635 Y133.112 E.02229
; LINE_WIDTH: 0.46677
G1 X151.618 Y132.977 E.00472
; LINE_WIDTH: 0.50067
G1 X151.601 Y132.841 E.0051
; LINE_WIDTH: 0.551233
G1 F7082.251
G1 X151.584 Y132.706 E.00566
G1 X151.584 Y123.294 E.38983
; LINE_WIDTH: 0.534474
G1 F7323.723
G1 X151.601 Y123.159 E.00547
; LINE_WIDTH: 0.50056
G1 F7426
G1 X151.618 Y123.023 E.0051
; LINE_WIDTH: 0.450919
G2 X151.635 Y122.216 I-8.785 J-.588 E.02684
G1 X151.228 Y122.216 E.01352
G1 X151.228 Y122.887 E.02231
; LINE_WIDTH: 0.466647
G1 X151.211 Y122.955 E.00241
; LINE_WIDTH: 0.50056
G1 X151.194 Y123.023 E.00261
; LINE_WIDTH: 0.547296
G1 F7137.541
G1 X151.177 Y123.091 E.00287
G1 X151.075 Y123.125 E.00441
M73 P72 R5
G1 X151.075 Y123.234 E.0045
M204 S10000
G1 X150.821 Y133.662 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.692401
G1 F5542.892
M204 S6000
G1 X146.545 Y133.662 E.22629
; OBJECT_ID: 405
; WIPE_START
G1 X148.545 Y133.662 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X141.602 Y130.494 Z9.6 F42000
G1 X125.779 Y123.273 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7426
M204 S6000
G1 X129.041 Y123.273 E.10821
G1 X129.041 Y132.727 E.31361
G1 X125.387 Y132.727 E.12121
G1 X125.387 Y123.273 E.31361
G1 X125.719 Y123.273 E.01102
M204 S250
G1 X125.779 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7426
M204 S5000
G1 X128.649 Y123.665 E.08819
G1 X128.649 Y132.335 E.2664
G1 X125.779 Y132.335 E.08819
G1 X125.779 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.778 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.941 Y131.091 Z9.6 F42000
G1 X125.172 Y134.191 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7426
M204 S6000
G1 X125.172 Y133.134 E.03505
G1 X129.448 Y133.134 E.14184
G1 X129.448 Y122.866 E.34062
G1 X125.172 Y122.866 E.14184
G1 X125.172 Y121.809 E.03504
G1 X130.872 Y121.809 E.18907
G1 X130.872 Y134.19 E.41071
G1 X125.232 Y134.191 E.18709
M204 S10000
G1 X124.765 Y134.598 F42000
G1 F7426
M204 S6000
G1 X124.765 Y121.402 E.43772
G1 X131.279 Y121.402 E.21608
G1 X131.279 Y134.598 E.43771
G1 X124.825 Y134.598 E.2141
M204 S250
G1 X124.373 Y134.793 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7426
M204 S5000
G1 X124.383 Y121.14 E.4195
G3 X124.565 Y121.01 I.186 J.068 E.00731
G1 X131.511 Y121.014 E.21341
G3 X131.671 Y121.199 I-.035 J.192 E.00812
G1 X131.67 Y134.821 E.41856
G3 X131.481 Y134.99 I-.197 J-.03 E.00842
G1 X124.575 Y134.99 E.21221
G1 X124.501 Y134.978 E.0023
G3 X124.381 Y134.853 I.065 J-.182 E.00552
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.382 Y132.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.376 Y133.662 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692401
G1 F5542.892
M204 S6000
G1 X129.651 Y133.662 E.22629
; WIPE_START
G1 X127.651 Y133.662 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.076 Y132.931 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
; LINE_WIDTH: 0.25751
G1 F7426
M204 S6000
G1 X125.076 Y123.069 E.17243
M204 S10000
G1 X125.376 Y122.338 F42000
; LINE_WIDTH: 0.692369
G1 F5543.166
M204 S6000
G1 X129.651 Y122.338 E.22628
M204 S10000
G1 X129.906 Y123.294 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.551476
M73 P73 R5
G1 F7078.874
M204 S6000
G1 X129.906 Y132.875 E.39704
G1 X130.007 Y132.909 E.00444
; LINE_WIDTH: 0.53457
G1 F7322.282
G1 X130.024 Y132.977 E.0028
; LINE_WIDTH: 0.50067
G1 F7426
G1 X130.041 Y133.045 E.00261
; LINE_WIDTH: 0.450472
G1 X130.058 Y133.112 E.00232
G1 X130.058 Y133.784 E.02229
G1 X130.465 Y133.784 E.01351
G1 X130.465 Y133.112 E.02229
; LINE_WIDTH: 0.46677
G1 X130.448 Y132.977 E.00472
; LINE_WIDTH: 0.50067
G1 X130.431 Y132.841 E.0051
; LINE_WIDTH: 0.551233
G1 F7082.251
G1 X130.414 Y132.706 E.00566
G1 X130.414 Y123.294 E.38983
; LINE_WIDTH: 0.534474
G1 F7323.723
G1 X130.431 Y123.159 E.00547
; LINE_WIDTH: 0.50056
G1 F7426
G1 X130.448 Y123.023 E.0051
; LINE_WIDTH: 0.450919
G2 X130.465 Y122.216 I-8.785 J-.588 E.02684
G1 X130.058 Y122.216 E.01352
G1 X130.058 Y122.887 E.02231
; LINE_WIDTH: 0.466647
G1 X130.041 Y122.955 E.00241
; LINE_WIDTH: 0.50056
G1 X130.024 Y123.023 E.00261
; LINE_WIDTH: 0.547296
G1 F7137.541
G1 X130.007 Y123.091 E.00287
G1 X129.906 Y123.125 E.00441
G1 X129.906 Y123.234 E.0045
; OBJECT_ID: 394
; WIPE_START
G1 X129.906 Y123.125 E-.29037
G1 X130.007 Y123.091 E-.28432
G1 X130.024 Y123.023 E-.18531
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X122.392 Y123.098 Z9.6 F42000
G1 X104.609 Y123.273 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7426
M204 S6000
G1 X107.871 Y123.273 E.10821
G1 X107.871 Y132.727 E.31361
G1 X104.217 Y132.727 E.12121
G1 X104.217 Y123.273 E.31361
G1 X104.549 Y123.273 E.01102
M204 S250
G1 X104.609 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7426
M204 S5000
G1 X107.479 Y123.665 E.08819
G1 X107.479 Y132.335 E.2664
G1 X104.609 Y132.335 E.08819
G1 X104.609 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X106.609 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.771 Y131.091 Z9.6 F42000
G1 X104.002 Y134.191 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7426
M204 S6000
G1 X104.002 Y133.134 E.03505
G1 X108.278 Y133.134 E.14184
G1 X108.278 Y122.866 E.34062
G1 X104.002 Y122.866 E.14184
G1 X104.002 Y121.809 E.03504
G1 X109.702 Y121.809 E.18907
G1 X109.702 Y134.19 E.41071
G1 X104.062 Y134.191 E.18709
M204 S10000
G1 X103.595 Y134.598 F42000
G1 F7426
M204 S6000
G1 X103.595 Y121.402 E.43772
G1 X110.109 Y121.402 E.21608
G1 X110.109 Y134.598 E.43771
G1 X103.655 Y134.598 E.2141
M204 S250
G1 X103.203 Y134.793 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7426
M204 S5000
G1 X103.213 Y121.14 E.4195
G3 X103.396 Y121.01 I.186 J.068 E.00731
G1 X110.341 Y121.014 E.21341
G3 X110.501 Y121.199 I-.035 J.192 E.00812
G1 X110.5 Y134.821 E.41856
G3 X110.312 Y134.99 I-.197 J-.03 E.00842
G1 X103.405 Y134.99 E.21221
G1 X103.331 Y134.978 E.0023
G3 X103.212 Y134.853 I.065 J-.182 E.00552
; WIPE_START
G1 F9547.055
M204 S6000
G1 X103.212 Y132.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.206 Y133.662 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692401
G1 F5542.892
M204 S6000
G1 X108.482 Y133.662 E.22629
; WIPE_START
G1 X106.482 Y133.662 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.906 Y132.931 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
; LINE_WIDTH: 0.25751
G1 F7426
M204 S6000
G1 X103.906 Y123.069 E.17243
M204 S10000
G1 X104.206 Y122.338 F42000
; LINE_WIDTH: 0.692369
G1 F5543.166
M204 S6000
G1 X108.482 Y122.338 E.22628
M204 S10000
G1 X108.736 Y123.294 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.551476
G1 F7078.874
M204 S6000
G1 X108.736 Y132.875 E.39704
G1 X108.838 Y132.909 E.00444
; LINE_WIDTH: 0.53457
G1 F7322.282
G1 X108.855 Y132.977 E.0028
; LINE_WIDTH: 0.50067
G1 F7426
G1 X108.872 Y133.045 E.00261
; LINE_WIDTH: 0.450472
G1 X108.888 Y133.112 E.00232
G1 X108.889 Y133.784 E.02229
G1 X109.295 Y133.784 E.01351
G1 X109.295 Y133.112 E.02229
; LINE_WIDTH: 0.46677
G1 X109.278 Y132.977 E.00472
; LINE_WIDTH: 0.50067
G1 X109.261 Y132.841 E.0051
; LINE_WIDTH: 0.551233
G1 F7082.251
G1 X109.245 Y132.706 E.00566
G1 X109.244 Y123.294 E.38983
; LINE_WIDTH: 0.534474
G1 F7323.723
G1 X109.261 Y123.159 E.00547
; LINE_WIDTH: 0.50056
G1 F7426
G1 X109.278 Y123.023 E.0051
; LINE_WIDTH: 0.450919
G2 X109.295 Y122.216 I-8.785 J-.588 E.02684
G1 X108.888 Y122.216 E.01352
G1 X108.888 Y122.887 E.02231
; LINE_WIDTH: 0.466647
G1 X108.872 Y122.955 E.00241
; LINE_WIDTH: 0.50056
G1 X108.855 Y123.023 E.00261
; LINE_WIDTH: 0.547296
G1 F7137.541
G1 X108.838 Y123.091 E.00287
G1 X108.736 Y123.125 E.00441
G1 X108.736 Y123.234 E.0045
; CHANGE_LAYER
; Z_HEIGHT: 9.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7137.541
G1 X108.736 Y123.125 E-.29037
G1 X108.838 Y123.091 E-.28432
G1 X108.855 Y123.023 E-.18531
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 47/72
; update layer progress
M73 L47
M991 S0 P46 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z9.6 I-.008 J1.217 P1  F42000
G1 X146.948 Y123.273 Z9.6
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7448
M204 S6000
G1 X150.211 Y123.273 E.10821
G1 X150.211 Y132.727 E.31361
G1 X146.556 Y132.727 E.12121
G1 X146.556 Y123.273 E.31361
G1 X146.888 Y123.273 E.01102
M204 S250
G1 X146.948 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7448
M204 S5000
G1 X149.818 Y123.665 E.08819
G1 X149.818 Y132.335 E.2664
G1 X146.948 Y132.335 E.08819
G1 X146.948 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.948 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.134 Y131.097 Z9.8 F42000
G1 X146.378 Y134.191 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7448
M204 S6000
G1 X146.378 Y133.134 E.03505
G1 X150.618 Y133.134 E.14065
G1 X150.618 Y122.866 E.34062
G1 X146.378 Y122.866 E.14065
G1 X146.378 Y121.809 E.03505
G1 X152.077 Y121.809 E.18907
G1 X152.078 Y134.19 E.41071
G1 X146.438 Y134.191 E.18709
M204 S10000
G1 X145.971 Y134.598 F42000
G1 F7448
M204 S6000
G1 X145.971 Y121.402 E.43772
G1 X152.484 Y121.402 E.21608
G1 X152.485 Y134.598 E.43771
G1 X146.031 Y134.598 E.21409
M204 S250
G1 X145.579 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7448
M204 S5000
G1 X145.589 Y121.14 E.41949
G3 X145.771 Y121.01 I.186 J.068 E.00732
G1 X152.717 Y121.014 E.21342
G3 X152.876 Y121.199 I-.034 J.191 E.00812
G1 X152.875 Y134.821 E.41856
G3 X152.687 Y134.99 I-.197 J-.03 E.00841
G1 X145.781 Y134.99 E.21221
G1 X145.707 Y134.978 E.0023
G3 X145.587 Y134.853 I.065 J-.182 E.00552
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.587 Y132.853 E-.76
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
G1 X146.263 Y132.931 F42000
G1 Z9.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.22162
G1 F7448
M204 S6000
G1 X146.263 Y123.069 E.14359
M204 S10000
G1 X146.581 Y122.338 F42000
; LINE_WIDTH: 0.692378
G1 F5543.087
M204 S6000
G1 X150.821 Y122.338 E.22438
M204 S10000
G1 X151.084 Y123.303 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.569336
G1 F6838.705
M204 S6000
G1 X151.084 Y132.87 E.41038
G1 X151.186 Y132.905 E.00461
; LINE_WIDTH: 0.55243
G1 F7065.613
G1 X151.203 Y132.974 E.00296
; LINE_WIDTH: 0.51853
G1 F7448
G1 X151.22 Y133.043 E.00276
; LINE_WIDTH: 0.468345
G1 X151.237 Y133.112 E.00247
G1 X151.237 Y133.775 E.02295
G1 X151.662 Y133.775 E.01472
G1 X151.662 Y133.112 E.02295
; LINE_WIDTH: 0.48463
G1 X151.645 Y132.974 E.00502
; LINE_WIDTH: 0.51853
G1 X151.628 Y132.835 E.00541
; LINE_WIDTH: 0.569088
G1 F6841.928
G1 X151.611 Y132.697 E.00599
G1 X151.611 Y123.303 E.40277
; LINE_WIDTH: 0.552335
G1 F7066.93
G1 X151.628 Y123.165 E.00579
; LINE_WIDTH: 0.518425
G1 F7448
G1 X151.645 Y123.026 E.00541
; LINE_WIDTH: 0.468813
G2 X151.662 Y122.225 I-8.585 J-.582 E.02781
G1 X151.237 Y122.225 E.01474
G1 X151.237 Y122.887 E.02298
; LINE_WIDTH: 0.484515
G1 X151.22 Y122.957 E.00257
; LINE_WIDTH: 0.518425
G1 X151.203 Y123.026 E.00276
; LINE_WIDTH: 0.565146
G1 F6893.566
G1 X151.186 Y123.095 E.00304
G1 X151.084 Y123.13 E.00458
G1 X151.084 Y123.243 E.00481
M204 S10000
G1 X150.821 Y133.662 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.692401
G1 F5542.89
M204 S6000
G1 X146.581 Y133.662 E.22439
; OBJECT_ID: 405
; WIPE_START
G1 X148.581 Y133.662 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X141.636 Y130.498 Z9.8 F42000
G1 X125.779 Y123.273 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7448
M204 S6000
G1 X129.041 Y123.273 E.10821
G1 X129.041 Y132.727 E.31361
G1 X125.387 Y132.727 E.12121
G1 X125.387 Y123.273 E.31361
G1 X125.719 Y123.273 E.01102
M204 S250
G1 X125.779 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7448
M204 S5000
G1 X128.649 Y123.665 E.08819
G1 X128.649 Y132.335 E.2664
G1 X125.779 Y132.335 E.08819
G1 X125.779 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.778 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.965 Y131.097 Z9.8 F42000
G1 X125.208 Y134.191 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7448
M204 S6000
G1 X125.208 Y133.134 E.03505
G1 X129.448 Y133.134 E.14065
G1 X129.448 Y122.866 E.34062
G1 X125.208 Y122.866 E.14065
G1 X125.208 Y121.809 E.03505
G1 X130.908 Y121.809 E.18907
G1 X130.908 Y134.19 E.41071
G1 X125.268 Y134.191 E.18709
M204 S10000
G1 X124.801 Y134.598 F42000
G1 F7448
M204 S6000
G1 X124.801 Y121.402 E.43772
G1 X131.315 Y121.402 E.21608
G1 X131.315 Y134.598 E.43771
G1 X124.861 Y134.598 E.21409
M204 S250
G1 X124.409 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7448
M204 S5000
G1 X124.419 Y121.14 E.41949
G3 X124.601 Y121.01 I.186 J.068 E.00732
G1 X131.547 Y121.014 E.21342
G3 X131.707 Y121.199 I-.034 J.191 E.00812
G1 X131.705 Y134.821 E.41856
G3 X131.517 Y134.99 I-.197 J-.03 E.00841
G1 X124.611 Y134.99 E.21221
G1 X124.537 Y134.978 E.0023
G3 X124.417 Y134.853 I.065 J-.182 E.00552
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.418 Y132.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.411 Y133.662 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692401
G1 F5542.89
M204 S6000
G1 X129.651 Y133.662 E.22439
; WIPE_START
G1 X127.651 Y133.662 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.094 Y132.931 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
; LINE_WIDTH: 0.22162
G1 F7448
M204 S6000
G1 X125.094 Y123.069 E.14359
M204 S10000
G1 X125.411 Y122.338 F42000
; LINE_WIDTH: 0.692378
G1 F5543.087
M204 S6000
G1 X129.651 Y122.338 E.22438
M204 S10000
G1 X129.915 Y123.303 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.569336
G1 F6838.705
M204 S6000
G1 X129.915 Y132.87 E.41038
G1 X130.016 Y132.905 E.00461
; LINE_WIDTH: 0.55243
G1 F7065.613
G1 X130.033 Y132.974 E.00296
; LINE_WIDTH: 0.51853
G1 F7448
G1 X130.05 Y133.043 E.00276
; LINE_WIDTH: 0.468345
G1 X130.067 Y133.112 E.00247
G1 X130.067 Y133.775 E.02295
G1 X130.492 Y133.775 E.01472
G1 X130.492 Y133.112 E.02295
; LINE_WIDTH: 0.48463
G1 X130.475 Y132.974 E.00502
; LINE_WIDTH: 0.51853
G1 X130.458 Y132.835 E.00541
; LINE_WIDTH: 0.569088
G1 F6841.928
G1 X130.441 Y132.697 E.00599
G1 X130.441 Y123.303 E.40277
; LINE_WIDTH: 0.552335
G1 F7066.93
G1 X130.458 Y123.165 E.00579
; LINE_WIDTH: 0.518425
G1 F7448
G1 X130.475 Y123.026 E.00541
; LINE_WIDTH: 0.468813
G2 X130.492 Y122.225 I-8.585 J-.582 E.02781
G1 X130.067 Y122.225 E.01474
G1 X130.067 Y122.887 E.02298
; LINE_WIDTH: 0.484515
G1 X130.05 Y122.957 E.00257
; LINE_WIDTH: 0.518425
G1 X130.033 Y123.026 E.00276
; LINE_WIDTH: 0.565146
G1 F6893.566
G1 X130.016 Y123.095 E.00304
G1 X129.915 Y123.13 E.00458
G1 X129.915 Y123.243 E.00481
; OBJECT_ID: 394
; WIPE_START
G1 X129.915 Y123.13 E-.29418
G1 X130.016 Y123.095 E-.28007
G1 X130.033 Y123.026 E-.18575
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X122.401 Y123.1 Z9.8 F42000
G1 X104.609 Y123.273 Z9.8
G1 Z9.4
M73 P74 R5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7448
M204 S6000
G1 X107.871 Y123.273 E.10821
G1 X107.871 Y132.727 E.31361
G1 X104.217 Y132.727 E.12121
G1 X104.217 Y123.273 E.31361
G1 X104.549 Y123.273 E.01102
M204 S250
G1 X104.609 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7448
M204 S5000
G1 X107.479 Y123.665 E.08819
G1 X107.479 Y132.335 E.2664
G1 X104.609 Y132.335 E.08819
G1 X104.609 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X106.609 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.795 Y131.097 Z9.8 F42000
G1 X104.038 Y134.191 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7448
M204 S6000
G1 X104.038 Y133.134 E.03505
G1 X108.278 Y133.134 E.14065
G1 X108.278 Y122.866 E.34062
G1 X104.038 Y122.866 E.14065
G1 X104.038 Y121.809 E.03505
G1 X109.738 Y121.809 E.18907
G1 X109.738 Y134.19 E.41071
G1 X104.098 Y134.191 E.18709
M204 S10000
G1 X103.631 Y134.598 F42000
G1 F7448
M204 S6000
G1 X103.631 Y121.402 E.43772
G1 X110.145 Y121.402 E.21608
G1 X110.145 Y134.598 E.43771
G1 X103.691 Y134.598 E.21409
M204 S250
G1 X103.239 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7448
M204 S5000
G1 X103.249 Y121.14 E.41949
G3 X103.432 Y121.01 I.186 J.068 E.00732
G1 X110.377 Y121.014 E.21342
G3 X110.537 Y121.199 I-.034 J.191 E.00812
G1 X110.536 Y134.821 E.41856
G3 X110.348 Y134.99 I-.197 J-.03 E.00841
G1 X103.441 Y134.99 E.21221
G1 X103.367 Y134.978 E.0023
G3 X103.248 Y134.853 I.065 J-.182 E.00552
; WIPE_START
G1 F9547.055
M204 S6000
G1 X103.248 Y132.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.242 Y133.662 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692401
G1 F5542.89
M204 S6000
G1 X108.482 Y133.662 E.22439
; WIPE_START
G1 X106.482 Y133.662 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.924 Y132.931 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
; LINE_WIDTH: 0.22162
G1 F7448
M204 S6000
G1 X103.924 Y123.069 E.14359
M204 S10000
G1 X104.242 Y122.338 F42000
; LINE_WIDTH: 0.692378
G1 F5543.087
M204 S6000
G1 X108.482 Y122.338 E.22438
M204 S10000
G1 X108.745 Y123.303 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.569336
G1 F6838.705
M204 S6000
G1 X108.745 Y132.87 E.41038
G1 X108.847 Y132.905 E.00461
; LINE_WIDTH: 0.55243
G1 F7065.613
G1 X108.864 Y132.974 E.00296
; LINE_WIDTH: 0.51853
G1 F7448
G1 X108.88 Y133.043 E.00276
; LINE_WIDTH: 0.468345
G1 X108.897 Y133.112 E.00247
G1 X108.897 Y133.775 E.02295
G1 X109.322 Y133.775 E.01472
G1 X109.322 Y133.112 E.02295
; LINE_WIDTH: 0.48463
G1 X109.305 Y132.974 E.00502
; LINE_WIDTH: 0.51853
G1 X109.288 Y132.835 E.00541
; LINE_WIDTH: 0.569088
G1 F6841.928
G1 X109.271 Y132.697 E.00599
G1 X109.271 Y123.303 E.40277
; LINE_WIDTH: 0.552335
G1 F7066.93
G1 X109.288 Y123.165 E.00579
; LINE_WIDTH: 0.518425
G1 F7448
G1 X109.305 Y123.026 E.00541
; LINE_WIDTH: 0.468813
G2 X109.322 Y122.225 I-8.585 J-.582 E.02781
G1 X108.897 Y122.225 E.01474
G1 X108.897 Y122.887 E.02298
; LINE_WIDTH: 0.484515
G1 X108.88 Y122.957 E.00257
; LINE_WIDTH: 0.518425
G1 X108.863 Y123.026 E.00276
; LINE_WIDTH: 0.565146
G1 F6893.566
G1 X108.847 Y123.095 E.00304
G1 X108.745 Y123.13 E.00458
G1 X108.745 Y123.243 E.00481
; CHANGE_LAYER
; Z_HEIGHT: 9.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F6893.566
G1 X108.745 Y123.13 E-.29418
G1 X108.847 Y123.095 E-.28007
G1 X108.863 Y123.026 E-.18575
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 48/72
; update layer progress
M73 L48
M991 S0 P47 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z9.8 I-.008 J1.217 P1  F42000
G1 X146.948 Y123.273 Z9.8
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7771
M204 S6000
G1 X150.211 Y123.273 E.10821
G1 X150.211 Y132.727 E.31361
G1 X146.556 Y132.727 E.12121
G1 X146.556 Y123.273 E.31361
G1 X146.888 Y123.273 E.01102
M204 S250
G1 X146.948 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7771
M204 S5000
G1 X149.818 Y123.665 E.08819
G1 X149.818 Y132.335 E.2664
G1 X146.948 Y132.335 E.08819
G1 X146.948 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.948 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.158 Y131.103 Z10 F42000
G1 X146.414 Y134.191 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7771
M204 S6000
G1 X146.414 Y133.134 E.03505
G1 X150.618 Y133.134 E.13946
G1 X150.618 Y122.866 E.34062
G1 X146.414 Y122.866 E.13946
G1 X146.414 Y121.809 E.03505
G1 X152.113 Y121.809 E.18906
G1 X152.113 Y134.19 E.41071
G1 X146.474 Y134.191 E.18708
M204 S10000
G1 X146.006 Y134.598 F42000
G1 F7771
M204 S6000
G1 X146.006 Y121.402 E.43772
G1 X152.52 Y121.402 E.21607
G1 X152.52 Y134.598 E.43772
G1 X146.066 Y134.598 E.21409
M204 S250
G1 X145.614 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7771
M204 S5000
G1 X145.625 Y121.14 E.4195
G3 X145.807 Y121.01 I.186 J.068 E.00731
G1 X152.752 Y121.014 E.21341
G3 X152.912 Y121.199 I-.034 J.191 E.00812
G1 X152.911 Y134.821 E.41857
G3 X152.723 Y134.99 I-.197 J-.03 E.00841
G1 X145.817 Y134.99 E.2122
G1 X145.743 Y134.978 E.0023
G3 X145.623 Y134.853 I.065 J-.182 E.00552
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.623 Y132.853 E-.76
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
G1 X146.281 Y132.931 F42000
G1 Z9.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.18574
G1 F7771
M204 S6000
G1 X146.281 Y123.069 E.11476
M204 S10000
G1 X146.617 Y122.338 F42000
; LINE_WIDTH: 0.6924
G1 F5542.895
M204 S6000
G1 X150.821 Y122.338 E.22249
M204 S10000
G1 X151.01 Y123.582 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F7771
M204 S6000
G1 X151.01 Y132.924 E.28704
G1 X151.143 Y132.966 E.00428
; LINE_WIDTH: 0.436378
G1 X151.194 Y133.039 E.00288
; LINE_WIDTH: 0.48474
G1 X151.246 Y133.112 E.00323
G1 X151.246 Y133.766 E.02352
G1 X151.688 Y133.766 E.01594
G1 X151.688 Y133.112 E.02352
; LINE_WIDTH: 0.469153
G1 X151.705 Y132.9 E.00739
; LINE_WIDTH: 0.420365
G1 X151.721 Y132.688 E.00655
G1 X151.721 Y123.582 E.28007
; LINE_WIDTH: 0.441964
G1 X151.699 Y123.45 E.00434
; LINE_WIDTH: 0.48591
G1 X151.677 Y123.319 E.00482
; LINE_WIDTH: 0.520353
G1 F7540.337
G1 X151.655 Y123.187 E.00519
G1 X151.688 Y122.455 E.0285
; LINE_WIDTH: 0.4918
G1 F7771
G1 X151.688 Y122.234 E.00809
G1 X151.246 Y122.234 E.01619
G1 X151.246 Y122.887 E.0239
G1 X151.178 Y123.078 E.00742
G1 X151.066 Y123.118 E.00434
; LINE_WIDTH: 0.514174
G1 F7639.203
G1 X151.05 Y123.253 E.00522
; LINE_WIDTH: 0.4765
G1 F7771
G1 X151.033 Y123.388 E.0048
; LINE_WIDTH: 0.438827
G1 X151.017 Y123.523 E.00439
M204 S10000
G1 X151.365 Y132.688 F42000
; LINE_WIDTH: 0.37733
G1 F7771
M204 S6000
G1 X151.365 Y123.642 E.2465
M204 S10000
G1 X150.821 Y133.662 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.69241
G1 F5542.81
M204 S6000
G1 X146.617 Y133.662 E.22249
; OBJECT_ID: 405
; WIPE_START
G1 X148.617 Y133.662 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X141.67 Y130.502 Z10 F42000
G1 X125.779 Y123.273 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7771
M204 S6000
G1 X129.041 Y123.273 E.10821
G1 X129.041 Y132.727 E.31361
G1 X125.387 Y132.727 E.12121
G1 X125.387 Y123.273 E.31361
G1 X125.719 Y123.273 E.01102
M204 S250
G1 X125.779 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7771
M204 S5000
G1 X128.649 Y123.665 E.08819
G1 X128.649 Y132.335 E.2664
G1 X125.779 Y132.335 E.08819
G1 X125.779 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.778 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.989 Y131.103 Z10 F42000
G1 X125.244 Y134.191 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7771
M204 S6000
G1 X125.244 Y133.134 E.03505
G1 X129.448 Y133.134 E.13946
G1 X129.448 Y122.866 E.34062
G1 X125.244 Y122.866 E.13946
G1 X125.244 Y121.809 E.03505
G1 X130.943 Y121.809 E.18906
G1 X130.944 Y134.19 E.41071
G1 X125.304 Y134.191 E.18708
M204 S10000
G1 X124.837 Y134.598 F42000
G1 F7771
M204 S6000
G1 X124.837 Y121.402 E.43772
G1 X131.35 Y121.402 E.21607
G1 X131.351 Y134.598 E.43772
G1 X124.897 Y134.598 E.21409
M204 S250
G1 X124.445 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7771
M204 S5000
G1 X124.455 Y121.14 E.4195
G3 X124.637 Y121.01 I.186 J.068 E.00731
G1 X131.583 Y121.014 E.21341
G3 X131.742 Y121.199 I-.034 J.191 E.00812
G1 X131.741 Y134.821 E.41857
G3 X131.553 Y134.99 I-.197 J-.03 E.00841
G1 X124.647 Y134.99 E.2122
G1 X124.573 Y134.978 E.0023
G3 X124.453 Y134.853 I.065 J-.182 E.00552
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.453 Y132.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.447 Y133.662 Z10 F42000
G1 Z9.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.69241
G1 F5542.81
M204 S6000
G1 X129.651 Y133.662 E.22249
; WIPE_START
G1 X127.651 Y133.662 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.112 Y132.931 Z10 F42000
G1 Z9.6
G1 E.8 F1800
; LINE_WIDTH: 0.18574
G1 F7771
M204 S6000
G1 X125.112 Y123.069 E.11476
M204 S10000
G1 X125.447 Y122.338 F42000
; LINE_WIDTH: 0.6924
G1 F5542.895
M204 S6000
G1 X129.651 Y122.338 E.22249
M204 S10000
G1 X129.84 Y123.582 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F7771
M204 S6000
G1 X129.84 Y132.924 E.28704
G1 X129.973 Y132.966 E.00428
; LINE_WIDTH: 0.436378
G1 X130.024 Y133.039 E.00288
; LINE_WIDTH: 0.48474
G1 X130.076 Y133.112 E.00323
G1 X130.076 Y133.766 E.02352
G1 X130.519 Y133.766 E.01594
G1 X130.519 Y133.112 E.02352
; LINE_WIDTH: 0.469153
G1 X130.535 Y132.9 E.00739
; LINE_WIDTH: 0.420365
G1 X130.551 Y132.688 E.00655
G1 X130.551 Y123.582 E.28007
; LINE_WIDTH: 0.441964
G1 X130.529 Y123.45 E.00434
; LINE_WIDTH: 0.48591
G1 X130.507 Y123.319 E.00482
; LINE_WIDTH: 0.520353
G1 F7540.337
G1 X130.485 Y123.187 E.00519
G1 X130.519 Y122.455 E.0285
; LINE_WIDTH: 0.4918
G1 F7771
G1 X130.519 Y122.234 E.00809
G1 X130.076 Y122.234 E.01619
G1 X130.076 Y122.887 E.0239
G1 X130.008 Y123.078 E.00742
G1 X129.896 Y123.118 E.00434
; LINE_WIDTH: 0.514174
G1 F7639.203
G1 X129.88 Y123.253 E.00522
; LINE_WIDTH: 0.4765
G1 F7771
G1 X129.864 Y123.388 E.0048
; LINE_WIDTH: 0.438827
G1 X129.847 Y123.523 E.00439
M204 S10000
G1 X130.196 Y132.688 F42000
; LINE_WIDTH: 0.37733
G1 F7771
M204 S6000
G1 X130.196 Y123.642 E.2465
; OBJECT_ID: 394
; WIPE_START
G1 F10765.228
G1 X130.196 Y125.642 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X122.596 Y124.938 Z10 F42000
G1 X104.609 Y123.273 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7771
M204 S6000
G1 X107.871 Y123.273 E.10821
G1 X107.871 Y132.727 E.31361
G1 X104.217 Y132.727 E.12121
G1 X104.217 Y123.273 E.31361
G1 X104.549 Y123.273 E.01102
M204 S250
G1 X104.609 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7771
M204 S5000
G1 X107.479 Y123.665 E.08819
G1 X107.479 Y132.335 E.2664
G1 X104.609 Y132.335 E.08819
G1 X104.609 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X106.609 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.819 Y131.103 Z10 F42000
G1 X104.074 Y134.191 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7771
M204 S6000
G1 X104.074 Y133.134 E.03505
G1 X108.278 Y133.134 E.13946
G1 X108.278 Y122.866 E.34062
G1 X104.074 Y122.866 E.13946
G1 X104.074 Y121.809 E.03505
G1 X109.774 Y121.809 E.18906
G1 X109.774 Y134.19 E.41071
G1 X104.134 Y134.191 E.18708
M204 S10000
G1 X103.667 Y134.598 F42000
G1 F7771
M204 S6000
G1 X103.667 Y121.402 E.43772
G1 X110.181 Y121.402 E.21607
G1 X110.181 Y134.598 E.43772
G1 X103.727 Y134.598 E.21409
M204 S250
G1 X103.275 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7771
M204 S5000
G1 X103.285 Y121.14 E.4195
G3 X103.468 Y121.01 I.186 J.068 E.00731
G1 X110.413 Y121.014 E.21341
G3 X110.573 Y121.199 I-.034 J.191 E.00812
G1 X110.571 Y134.821 E.41857
G3 X110.383 Y134.99 I-.197 J-.03 E.00841
G1 X103.477 Y134.99 E.2122
M73 P75 R5
G1 X103.403 Y134.978 E.0023
G3 X103.283 Y134.853 I.065 J-.182 E.00552
; WIPE_START
G1 F9547.055
M204 S6000
G1 X103.284 Y132.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.278 Y133.662 Z10 F42000
G1 Z9.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.69241
G1 F5542.81
M204 S6000
G1 X108.482 Y133.662 E.22249
; WIPE_START
G1 X106.482 Y133.662 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.942 Y132.931 Z10 F42000
G1 Z9.6
G1 E.8 F1800
; LINE_WIDTH: 0.18574
G1 F7771
M204 S6000
G1 X103.942 Y123.069 E.11476
M204 S10000
G1 X104.278 Y122.338 F42000
; LINE_WIDTH: 0.6924
G1 F5542.895
M204 S6000
G1 X108.482 Y122.338 E.22249
M204 S10000
G1 X108.67 Y123.582 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F7771
M204 S6000
G1 X108.67 Y132.924 E.28704
G1 X108.803 Y132.966 E.00428
; LINE_WIDTH: 0.436378
G1 X108.855 Y133.039 E.00288
; LINE_WIDTH: 0.48474
G1 X108.906 Y133.112 E.00323
G1 X108.906 Y133.766 E.02352
G1 X109.349 Y133.766 E.01594
G1 X109.349 Y133.112 E.02352
; LINE_WIDTH: 0.469153
G1 X109.365 Y132.9 E.00739
; LINE_WIDTH: 0.420365
G1 X109.382 Y132.688 E.00655
G1 X109.382 Y123.582 E.28007
; LINE_WIDTH: 0.441964
G1 X109.36 Y123.45 E.00434
; LINE_WIDTH: 0.48591
G1 X109.338 Y123.319 E.00482
; LINE_WIDTH: 0.520353
G1 F7540.337
G1 X109.316 Y123.187 E.00519
G1 X109.349 Y122.455 E.0285
; LINE_WIDTH: 0.4918
G1 F7771
G1 X109.349 Y122.234 E.00809
G1 X108.906 Y122.234 E.01619
G1 X108.906 Y122.887 E.0239
G1 X108.839 Y123.078 E.00742
G1 X108.727 Y123.118 E.00434
; LINE_WIDTH: 0.514174
G1 F7639.203
G1 X108.71 Y123.253 E.00522
; LINE_WIDTH: 0.4765
G1 F7771
G1 X108.694 Y123.388 E.0048
; LINE_WIDTH: 0.438827
G1 X108.677 Y123.523 E.00439
M204 S10000
G1 X109.026 Y132.688 F42000
; LINE_WIDTH: 0.37733
G1 F7771
M204 S6000
G1 X109.026 Y123.642 E.2465
; CHANGE_LAYER
; Z_HEIGHT: 9.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10765.228
G1 X109.026 Y125.642 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 49/72
; update layer progress
M73 L49
M991 S0 P48 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z10 I.076 J1.215 P1  F42000
G1 X146.948 Y123.273 Z10
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7785
M204 S6000
G1 X150.211 Y123.273 E.10821
G1 X150.211 Y132.727 E.31361
G1 X146.556 Y132.727 E.12121
G1 X146.556 Y123.273 E.31361
G1 X146.888 Y123.273 E.01102
M204 S250
G1 X146.948 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7785
M204 S5000
G1 X149.818 Y123.665 E.08819
G1 X149.818 Y132.335 E.2664
G1 X146.948 Y132.335 E.08819
G1 X146.948 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.948 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.182 Y131.109 Z10.2 F42000
G1 X146.449 Y134.191 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7785
M204 S6000
G1 X146.449 Y133.134 E.03505
G1 X150.618 Y133.134 E.13827
G1 X150.618 Y122.866 E.34062
G1 X146.449 Y122.866 E.13827
G1 X146.449 Y121.809 E.03505
G1 X152.151 Y121.809 E.18912
G1 X152.151 Y134.19 E.41071
G1 X146.509 Y134.191 E.18714
M204 S10000
G1 X146.042 Y134.598 F42000
G1 F7785
M204 S6000
G1 X146.042 Y121.402 E.43772
G1 X152.558 Y121.402 E.21613
G1 X152.558 Y134.598 E.43772
G1 X146.102 Y134.598 E.21415
M204 S250
G1 X145.65 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7785
M204 S5000
G1 X145.661 Y121.14 E.41949
G3 X145.843 Y121.01 I.186 J.068 E.00731
G1 X152.788 Y121.014 E.21341
G3 X152.95 Y121.199 I-.034 J.193 E.00815
G1 X152.949 Y134.821 E.41856
G3 X152.758 Y134.99 I-.201 J-.035 E.00844
G1 X145.853 Y134.99 E.2122
G1 X145.778 Y134.978 E.00231
G3 X145.659 Y134.852 I.065 J-.182 E.00552
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.659 Y132.852 E-.76
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
G1 X146.299 Y132.931 F42000
G1 Z9.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.14986
G1 F7785
M204 S6000
G1 X146.299 Y123.069 E.08593
M204 S10000
G1 X146.653 Y122.338 F42000
; LINE_WIDTH: 0.692412
G1 F5542.796
M204 S6000
G1 X150.821 Y122.338 E.2206
M204 S10000
G1 X151.01 Y123.52 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F7785
M204 S6000
G1 X151.01 Y132.924 E.28895
G1 X151.145 Y132.967 E.00437
; LINE_WIDTH: 0.441083
G1 X151.2 Y133.04 E.00296
; LINE_WIDTH: 0.503316
G1 X151.255 Y133.112 E.00342
G1 X151.255 Y133.756 E.02415
G1 X151.717 Y133.756 E.01731
G1 X151.717 Y133.112 E.02415
; LINE_WIDTH: 0.483268
G1 X151.738 Y132.896 E.00781
; LINE_WIDTH: 0.42048
G1 X151.759 Y132.679 E.0067
G1 X151.759 Y123.52 E.28179
; LINE_WIDTH: 0.44202
G1 X151.737 Y123.389 E.00432
; LINE_WIDTH: 0.48608
G1 X151.715 Y123.258 E.00479
; LINE_WIDTH: 0.515579
G1 F7616.488
G1 X151.693 Y123.127 E.00511
G2 X151.717 Y122.243 I-12.042 J-.769 E.03407
G1 X151.255 Y122.243 E.01777
G1 X151.255 Y122.887 E.0248
G1 X151.231 Y123.007 E.00471
G1 X151.056 Y123.111 E.00784
; LINE_WIDTH: 0.48953
G1 F7785
G1 X151.036 Y123.286 E.0064
; LINE_WIDTH: 0.44317
G1 X151.016 Y123.46 E.00574
M204 S10000
G1 X151.384 Y132.679 F42000
; LINE_WIDTH: 0.41496
G1 F7785
M204 S6000
G1 X151.384 Y123.58 E.27585
M204 S10000
G1 X150.821 Y133.662 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.692411
G1 F5542.809
M204 S6000
G1 X146.653 Y133.662 E.2206
; OBJECT_ID: 405
; WIPE_START
G1 X148.653 Y133.662 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X141.704 Y130.506 Z10.2 F42000
G1 X125.779 Y123.273 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7785
M204 S6000
G1 X129.041 Y123.273 E.10821
G1 X129.041 Y132.727 E.31361
G1 X125.387 Y132.727 E.12121
G1 X125.387 Y123.273 E.31361
G1 X125.719 Y123.273 E.01102
M204 S250
G1 X125.779 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7785
M204 S5000
G1 X128.649 Y123.665 E.08819
G1 X128.649 Y132.335 E.2664
G1 X125.779 Y132.335 E.08819
G1 X125.779 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.778 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.013 Y131.109 Z10.2 F42000
G1 X125.28 Y134.191 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7785
M204 S6000
G1 X125.28 Y133.134 E.03505
G1 X129.448 Y133.134 E.13827
G1 X129.448 Y122.866 E.34062
G1 X125.28 Y122.866 E.13827
G1 X125.28 Y121.809 E.03505
G1 X130.981 Y121.809 E.18912
G1 X130.981 Y134.19 E.41071
G1 X125.34 Y134.191 E.18714
M204 S10000
G1 X124.873 Y134.598 F42000
G1 F7785
M204 S6000
G1 X124.873 Y121.402 E.43772
G1 X131.388 Y121.402 E.21613
G1 X131.388 Y134.598 E.43772
G1 X124.933 Y134.598 E.21415
M204 S250
G1 X124.481 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7785
M204 S5000
G1 X124.491 Y121.14 E.41949
G3 X124.673 Y121.01 I.186 J.068 E.00731
G1 X131.619 Y121.014 E.21341
G3 X131.78 Y121.199 I-.034 J.193 E.00815
G1 X131.779 Y134.821 E.41856
G3 X131.589 Y134.99 I-.201 J-.035 E.00844
G1 X124.683 Y134.99 E.2122
G1 X124.609 Y134.978 E.00231
G3 X124.489 Y134.852 I.065 J-.182 E.00552
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.489 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.483 Y133.662 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692411
G1 F5542.809
M204 S6000
G1 X129.651 Y133.662 E.2206
; WIPE_START
G1 X127.651 Y133.662 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.13 Y132.931 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
; LINE_WIDTH: 0.14986
G1 F7785
M204 S6000
G1 X125.13 Y123.069 E.08593
M204 S10000
G1 X125.483 Y122.338 F42000
; LINE_WIDTH: 0.692412
G1 F5542.796
M204 S6000
G1 X129.651 Y122.338 E.2206
M204 S10000
G1 X129.84 Y123.52 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F7785
M204 S6000
G1 X129.84 Y132.924 E.28895
G1 X129.975 Y132.967 E.00437
; LINE_WIDTH: 0.441083
G1 X130.03 Y133.04 E.00296
; LINE_WIDTH: 0.503316
G1 X130.086 Y133.112 E.00342
G1 X130.086 Y133.756 E.02415
G1 X130.547 Y133.756 E.01731
G1 X130.547 Y133.112 E.02415
; LINE_WIDTH: 0.483268
G1 X130.568 Y132.896 E.00781
; LINE_WIDTH: 0.42048
G1 X130.589 Y132.679 E.0067
G1 X130.589 Y123.52 E.28179
; LINE_WIDTH: 0.44202
G1 X130.567 Y123.389 E.00432
; LINE_WIDTH: 0.48608
G1 X130.545 Y123.258 E.00479
; LINE_WIDTH: 0.515579
G1 F7616.488
G1 X130.523 Y123.127 E.00511
G2 X130.547 Y122.243 I-12.042 J-.769 E.03407
G1 X130.085 Y122.243 E.01777
G1 X130.085 Y122.887 E.0248
G1 X130.062 Y123.007 E.00471
G1 X129.886 Y123.111 E.00784
; LINE_WIDTH: 0.48953
G1 F7785
G1 X129.866 Y123.286 E.0064
; LINE_WIDTH: 0.44317
G1 X129.847 Y123.46 E.00574
M204 S10000
G1 X130.215 Y132.679 F42000
; LINE_WIDTH: 0.41496
G1 F7785
M204 S6000
G1 X130.214 Y123.58 E.27585
; OBJECT_ID: 394
; WIPE_START
G1 F9676.379
G1 X130.214 Y125.58 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X122.613 Y124.895 Z10.2 F42000
G1 X104.609 Y123.273 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7785
M204 S6000
G1 X107.871 Y123.273 E.10821
G1 X107.871 Y132.727 E.31361
G1 X104.217 Y132.727 E.12121
G1 X104.217 Y123.273 E.31361
G1 X104.549 Y123.273 E.01102
M204 S250
G1 X104.609 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7785
M204 S5000
G1 X107.479 Y123.665 E.08819
G1 X107.479 Y132.335 E.2664
G1 X104.609 Y132.335 E.08819
G1 X104.609 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X106.609 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.843 Y131.109 Z10.2 F42000
G1 X104.11 Y134.191 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7785
M204 S6000
G1 X104.11 Y133.134 E.03505
G1 X108.278 Y133.134 E.13827
G1 X108.278 Y122.866 E.34062
G1 X104.11 Y122.866 E.13827
G1 X104.11 Y121.809 E.03505
G1 X109.811 Y121.809 E.18912
G1 X109.811 Y134.19 E.41071
G1 X104.17 Y134.191 E.18714
M204 S10000
G1 X103.703 Y134.598 F42000
G1 F7785
M204 S6000
G1 X103.703 Y121.402 E.43772
G1 X110.218 Y121.402 E.21613
G1 X110.219 Y134.598 E.43772
G1 X103.763 Y134.598 E.21415
M204 S250
G1 X103.311 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7785
M204 S5000
G1 X103.321 Y121.14 E.41949
G3 X103.503 Y121.01 I.186 J.068 E.00731
G1 X110.449 Y121.014 E.21341
G3 X110.61 Y121.199 I-.034 J.193 E.00815
G1 X110.609 Y134.821 E.41856
G3 X110.419 Y134.99 I-.201 J-.035 E.00844
G1 X103.513 Y134.99 E.2122
G1 X103.439 Y134.978 E.00231
G3 X103.319 Y134.852 I.065 J-.182 E.00552
; WIPE_START
G1 F9547.055
M204 S6000
G1 X103.32 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.313 Y133.662 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692411
G1 F5542.809
M204 S6000
G1 X108.482 Y133.662 E.2206
; WIPE_START
G1 X106.482 Y133.662 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.96 Y132.931 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
; LINE_WIDTH: 0.14986
G1 F7785
M204 S6000
G1 X103.96 Y123.069 E.08593
M204 S10000
G1 X104.313 Y122.338 F42000
; LINE_WIDTH: 0.692412
G1 F5542.796
M204 S6000
G1 X108.482 Y122.338 E.2206
M204 S10000
G1 X108.67 Y123.52 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F7785
M204 S6000
G1 X108.67 Y132.924 E.28895
G1 X108.805 Y132.967 E.00437
; LINE_WIDTH: 0.441083
G1 X108.861 Y133.04 E.00296
; LINE_WIDTH: 0.503316
G1 X108.916 Y133.112 E.00342
G1 X108.916 Y133.756 E.02415
G1 X109.377 Y133.756 E.01731
G1 X109.377 Y133.112 E.02415
; LINE_WIDTH: 0.483268
G1 X109.398 Y132.896 E.00781
; LINE_WIDTH: 0.42048
G1 X109.419 Y132.679 E.0067
G1 X109.419 Y123.52 E.28179
; LINE_WIDTH: 0.44202
G1 X109.397 Y123.389 E.00432
; LINE_WIDTH: 0.48608
G1 X109.375 Y123.258 E.00479
; LINE_WIDTH: 0.515579
M73 P76 R5
G1 F7616.488
G1 X109.353 Y123.127 E.00511
G2 X109.377 Y122.243 I-12.042 J-.769 E.03407
G1 X108.916 Y122.243 E.01777
G1 X108.916 Y122.887 E.0248
G1 X108.892 Y123.007 E.00471
G1 X108.717 Y123.111 E.00784
; LINE_WIDTH: 0.48953
G1 F7785
G1 X108.697 Y123.286 E.0064
; LINE_WIDTH: 0.44317
G1 X108.677 Y123.46 E.00574
M204 S10000
G1 X109.045 Y132.679 F42000
; LINE_WIDTH: 0.41496
G1 F7785
M204 S6000
G1 X109.045 Y123.58 E.27585
; CHANGE_LAYER
; Z_HEIGHT: 10
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9676.379
G1 X109.045 Y125.58 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 50/72
; update layer progress
M73 L50
M991 S0 P49 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z10.2 I.074 J1.215 P1  F42000
G1 X146.948 Y123.273 Z10.2
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6934
M204 S6000
G1 X150.211 Y123.273 E.10821
G1 X150.211 Y132.727 E.31361
G1 X146.556 Y132.727 E.12121
G1 X146.556 Y123.273 E.31361
G1 X146.888 Y123.273 E.01102
M204 S250
G1 X146.948 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6934
M204 S5000
G1 X149.818 Y123.665 E.08819
G1 X149.818 Y132.335 E.2664
G1 X146.948 Y132.335 E.08819
G1 X146.948 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.948 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.206 Y131.114 Z10.4 F42000
G1 X146.485 Y134.191 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6934
M204 S6000
G1 X146.485 Y133.134 E.03505
G1 X150.618 Y133.134 E.13707
G1 X150.618 Y122.866 E.34062
G1 X146.485 Y122.866 E.13707
G1 X146.485 Y121.809 E.03504
G1 X152.196 Y121.809 E.18943
G1 X152.196 Y134.19 E.4107
G1 X146.545 Y134.191 E.18745
M204 S10000
G1 X146.078 Y134.598 F42000
G1 F6934
M204 S6000
G1 X146.078 Y121.402 E.43772
G1 X152.603 Y121.402 E.21644
G1 X152.603 Y134.598 E.43771
G1 X146.138 Y134.598 E.21446
M204 S250
G1 X145.686 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6934
M204 S5000
G1 X145.697 Y121.14 E.4195
G3 X145.879 Y121.01 I.186 J.068 E.0073
G1 X152.798 Y121.01 E.21262
G3 X152.973 Y121.118 I-.015 J.221 E.00656
G1 X152.989 Y121.157 E.00129
G1 X152.995 Y134.194 E.4006
G3 X152.994 Y134.82 I-5.44 J.3 E.01926
G3 X152.971 Y134.89 I-.313 J-.066 E.00225
G1 X152.967 Y134.897 E.00025
G3 X152.802 Y134.99 I-.171 J-.112 E.00603
G1 X145.888 Y134.99 E.21244
G1 X145.814 Y134.978 E.0023
G3 X145.695 Y134.853 I.065 J-.182 E.00552
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.695 Y132.853 E-.76
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
G1 X146.317 Y132.931 F42000
G1 Z10
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.11397
G1 F6934
M204 S6000
G1 X146.317 Y123.069 E.05709
M204 S10000
G1 X146.689 Y122.338 F42000
; LINE_WIDTH: 0.692256
G1 F5544.125
M204 S6000
G1 X150.821 Y122.338 E.21864
M204 S10000
G1 X151.848 Y123.901 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6934
M204 S6000
G1 X151.848 Y122.273 E.05401
G1 X151.197 Y122.759 E.02695
G2 X151.169 Y123.032 I.166 J.155 E.00979
G1 X150.966 Y123.032 E.00675
G2 X151.848 Y124.979 I1.886 J.319 E.07523
G1 X151.848 Y127.514 E.08409
G2 X150.966 Y128.304 I.93 J1.925 E.0398
G2 X151.848 Y130.221 I1.863 J.303 E.07425
G1 X151.848 Y132.755 E.08408
G1 X151.169 Y133.278 E.02841
G1 X151.169 Y132.968 E.01028
G1 X150.966 Y132.968 E.00675
G1 X150.966 Y131.853 E.03699
M204 S10000
G1 X150.821 Y133.662 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.692411
G1 F5542.807
M204 S6000
G1 X146.689 Y133.662 E.2187
; OBJECT_ID: 405
; WIPE_START
G1 X148.689 Y133.662 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X141.738 Y130.51 Z10.4 F42000
G1 X125.779 Y123.273 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6934
M204 S6000
G1 X129.041 Y123.273 E.10821
G1 X129.041 Y132.727 E.31361
G1 X125.387 Y132.727 E.12121
G1 X125.387 Y123.273 E.31361
G1 X125.719 Y123.273 E.01102
M204 S250
G1 X125.779 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6934
M204 S5000
G1 X128.649 Y123.665 E.08819
G1 X128.649 Y132.335 E.2664
G1 X125.779 Y132.335 E.08819
G1 X125.779 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.778 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.037 Y131.114 Z10.4 F42000
G1 X125.316 Y134.191 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6934
M204 S6000
G1 X125.316 Y133.134 E.03505
G1 X129.448 Y133.134 E.13707
G1 X129.448 Y122.866 E.34062
G1 X125.316 Y122.866 E.13707
G1 X125.316 Y121.809 E.03504
G1 X131.026 Y121.809 E.18943
G1 X131.026 Y134.19 E.4107
G1 X125.376 Y134.191 E.18745
M204 S10000
G1 X124.909 Y134.598 F42000
G1 F6934
M204 S6000
G1 X124.909 Y121.402 E.43772
G1 X131.433 Y121.402 E.21644
G1 X131.434 Y134.598 E.43771
G1 X124.969 Y134.598 E.21446
M204 S250
G1 X124.516 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6934
M204 S5000
G1 X124.527 Y121.14 E.4195
G3 X124.709 Y121.01 I.186 J.068 E.0073
G1 X131.629 Y121.01 E.21262
G3 X131.804 Y121.118 I-.015 J.221 E.00656
G1 X131.819 Y121.157 E.00129
G1 X131.826 Y134.194 E.4006
G3 X131.824 Y134.82 I-5.44 J.3 E.01926
G3 X131.801 Y134.89 I-.313 J-.066 E.00225
G1 X131.797 Y134.897 E.00025
G3 X131.632 Y134.99 I-.171 J-.112 E.00603
G1 X124.719 Y134.99 E.21244
G1 X124.645 Y134.978 E.0023
G3 X124.525 Y134.853 I.065 J-.182 E.00552
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.525 Y132.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.519 Y133.662 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692411
G1 F5542.807
M204 S6000
G1 X129.651 Y133.662 E.2187
M204 S10000
G1 X129.796 Y131.853 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6934
M204 S6000
G1 X129.796 Y132.968 E.03699
G1 X130 Y132.968 E.00675
G1 X130 Y133.278 E.01028
G1 X130.678 Y132.755 E.02841
G1 X130.678 Y130.221 E.08408
G3 X129.796 Y128.304 I.981 J-1.613 E.07425
G3 X130.678 Y127.514 I1.812 J1.135 E.0398
G1 X130.678 Y124.979 E.08409
G3 X129.796 Y123.032 I1.005 J-1.628 E.07523
G1 X130 Y123.032 E.00675
G3 X130.027 Y122.759 I.194 J-.119 E.00979
G1 X130.678 Y122.273 E.02695
G1 X130.678 Y123.901 E.05401
M204 S10000
G1 X129.651 Y122.338 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.692256
G1 F5544.125
M204 S6000
G1 X125.519 Y122.338 E.21864
M204 S10000
G1 X125.148 Y123.069 F42000
; LINE_WIDTH: 0.11397
G1 F6934
M204 S6000
G1 X125.148 Y132.931 E.05709
; OBJECT_ID: 394
; WIPE_START
G1 F15000
G1 X125.148 Y130.931 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X117.996 Y128.264 Z10.4 F42000
G1 X104.609 Y123.273 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6934
M204 S6000
G1 X107.871 Y123.273 E.10821
G1 X107.871 Y132.727 E.31361
G1 X104.217 Y132.727 E.12121
G1 X104.217 Y123.273 E.31361
G1 X104.549 Y123.273 E.01102
M204 S250
G1 X104.609 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6934
M204 S5000
G1 X107.479 Y123.665 E.08819
G1 X107.479 Y132.335 E.2664
G1 X104.609 Y132.335 E.08819
G1 X104.609 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X106.609 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.867 Y131.114 Z10.4 F42000
G1 X104.146 Y134.191 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6934
M204 S6000
G1 X104.146 Y133.134 E.03505
G1 X108.278 Y133.134 E.13707
G1 X108.278 Y122.866 E.34062
G1 X104.146 Y122.866 E.13707
G1 X104.146 Y121.809 E.03504
G1 X109.857 Y121.809 E.18943
G1 X109.857 Y134.19 E.4107
G1 X104.206 Y134.191 E.18745
M204 S10000
G1 X103.739 Y134.598 F42000
G1 F6934
M204 S6000
G1 X103.739 Y121.402 E.43772
G1 X110.264 Y121.402 E.21644
G1 X110.264 Y134.598 E.43771
G1 X103.799 Y134.598 E.21446
M204 S250
G1 X103.347 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6934
M204 S5000
G1 X103.357 Y121.14 E.4195
G3 X103.539 Y121.01 I.186 J.068 E.0073
G1 X110.459 Y121.01 E.21262
G3 X110.634 Y121.118 I-.015 J.221 E.00656
G1 X110.65 Y121.157 E.00129
G1 X110.656 Y134.194 E.4006
G3 X110.654 Y134.82 I-5.44 J.3 E.01926
G3 X110.631 Y134.89 I-.313 J-.066 E.00225
G1 X110.627 Y134.897 E.00025
G3 X110.463 Y134.99 I-.171 J-.112 E.00603
G1 X103.549 Y134.99 E.21244
G1 X103.475 Y134.978 E.0023
G3 X103.355 Y134.853 I.065 J-.182 E.00552
; WIPE_START
G1 F9547.055
M204 S6000
G1 X103.355 Y132.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.349 Y133.662 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692411
G1 F5542.807
M204 S6000
G1 X108.482 Y133.662 E.2187
M204 S10000
G1 X108.626 Y131.853 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6934
M204 S6000
G1 X108.626 Y132.968 E.03699
G1 X108.83 Y132.968 E.00675
G1 X108.83 Y133.278 E.01028
G1 X109.508 Y132.755 E.02841
G1 X109.508 Y130.221 E.08408
G3 X108.626 Y128.304 I.981 J-1.613 E.07425
G3 X109.508 Y127.514 I1.812 J1.135 E.0398
G1 X109.508 Y124.979 E.08409
G3 X108.626 Y123.032 I1.004 J-1.628 E.07523
G1 X108.83 Y123.032 E.00675
G3 X108.857 Y122.759 I.194 J-.119 E.00979
G1 X109.508 Y122.273 E.02695
G1 X109.508 Y123.901 E.05401
M204 S10000
G1 X108.482 Y122.338 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.692256
G1 F5544.125
M204 S6000
G1 X104.349 Y122.338 E.21864
M204 S10000
G1 X103.978 Y123.069 F42000
; LINE_WIDTH: 0.11397
G1 F6934
M204 S6000
G1 X103.978 Y132.931 E.05709
; CHANGE_LAYER
; Z_HEIGHT: 10.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X103.978 Y130.931 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 51/72
; update layer progress
M73 L51
M991 S0 P50 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z10.4 I.214 J1.198 P1  F42000
G1 X146.948 Y123.273 Z10.4
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6598
M204 S6000
G1 X150.211 Y123.273 E.10821
G1 X150.211 Y132.727 E.31361
G1 X146.556 Y132.727 E.12121
G1 X146.556 Y123.273 E.31361
G1 X146.888 Y123.273 E.01102
M204 S250
G1 X146.948 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6598
M204 S5000
G1 X149.818 Y123.665 E.08819
G1 X149.818 Y132.335 E.2664
G1 X146.948 Y132.335 E.08819
G1 X146.948 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.948 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.23 Y131.12 Z10.6 F42000
G1 X146.521 Y134.191 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6598
M204 S6000
G1 X146.521 Y133.134 E.03505
G1 X150.618 Y133.134 E.13588
G1 X150.618 Y122.866 E.34062
G1 X146.521 Y122.866 E.13588
G1 X146.521 Y121.809 E.03504
G1 X152.241 Y121.809 E.18975
G1 X152.242 Y134.191 E.4107
G1 X146.581 Y134.191 E.18776
M204 S10000
G1 X146.114 Y134.598 F42000
G1 F6598
M204 S6000
G1 X146.114 Y121.402 E.43772
G1 X152.648 Y121.402 E.21675
G1 X152.649 Y134.598 E.43771
G1 X146.174 Y134.598 E.21477
M204 S250
G1 X145.722 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6598
M204 S5000
G1 X145.732 Y121.14 E.41949
G3 X145.915 Y121.01 I.186 J.068 E.00731
G1 X152.842 Y121.01 E.21286
G3 X153.021 Y121.122 I-.014 J.221 E.00676
G1 X153.034 Y121.156 E.00112
G1 X153.041 Y134.194 E.40061
G3 X153.039 Y134.82 I-5.496 J.3 E.01926
G3 X153.016 Y134.89 I-.323 J-.07 E.00227
G1 X153.011 Y134.898 E.00027
G3 X152.845 Y134.99 I-.171 J-.113 E.00608
G1 X145.924 Y134.99 E.21265
M73 P77 R5
G1 X145.85 Y134.978 E.0023
G3 X145.731 Y134.852 I.065 J-.182 E.00552
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.731 Y132.852 E-.76
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
G1 X146.725 Y133.662 F42000
G1 Z10.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692456
G1 F5542.42
M204 S6000
G1 X150.821 Y133.662 E.21681
M204 S10000
G1 X150.966 Y132.258 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6598
M204 S6000
G1 X150.966 Y132.968 E.02356
G1 X151.169 Y132.968 E.00675
G1 X151.169 Y133.682 E.02371
G3 X151.893 Y132.847 I2.553 J1.48 E.03689
G1 X151.893 Y130.427 E.08026
G3 X151.086 Y128.655 I1.256 J-1.641 E.06726
G3 X151.893 Y127.606 I2.262 J.904 E.04447
G1 X151.893 Y125.186 E.08026
G3 X151.086 Y123.414 I1.256 J-1.641 E.06725
G3 X151.893 Y122.364 I2.262 J.904 E.04447
G1 X151.893 Y123.993 E.05401
M204 S10000
G1 X150.821 Y122.338 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.692277
G1 F5543.947
M204 S6000
G1 X146.725 Y122.338 E.21675
; OBJECT_ID: 405
; WIPE_START
G1 X148.725 Y122.338 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X141.099 Y122.648 Z10.6 F42000
G1 X125.779 Y123.273 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6598
M204 S6000
G1 X129.041 Y123.273 E.10821
G1 X129.041 Y132.727 E.31361
G1 X125.387 Y132.727 E.12121
G1 X125.387 Y123.273 E.31361
G1 X125.719 Y123.273 E.01102
M204 S250
G1 X125.779 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6598
M204 S5000
G1 X128.649 Y123.665 E.08819
G1 X128.649 Y132.335 E.2664
G1 X125.779 Y132.335 E.08819
G1 X125.779 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.778 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.061 Y131.12 Z10.6 F42000
G1 X125.351 Y134.191 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6598
M204 S6000
G1 X125.351 Y133.134 E.03505
G1 X129.448 Y133.134 E.13588
G1 X129.448 Y122.866 E.34062
G1 X125.351 Y122.866 E.13588
G1 X125.351 Y121.809 E.03504
G1 X131.072 Y121.809 E.18975
G1 X131.072 Y134.191 E.4107
G1 X125.411 Y134.191 E.18776
M204 S10000
G1 X124.944 Y134.598 F42000
G1 F6598
M204 S6000
G1 X124.944 Y121.402 E.43772
G1 X131.479 Y121.402 E.21675
G1 X131.479 Y134.598 E.43771
G1 X125.004 Y134.598 E.21477
M204 S250
G1 X124.552 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6598
M204 S5000
G1 X124.563 Y121.14 E.41949
G3 X124.745 Y121.01 I.186 J.068 E.00731
G1 X131.672 Y121.01 E.21286
G3 X131.851 Y121.122 I-.014 J.221 E.00676
G1 X131.865 Y121.156 E.00112
G1 X131.871 Y134.194 E.40061
G3 X131.869 Y134.82 I-5.496 J.3 E.01926
G3 X131.846 Y134.89 I-.323 J-.07 E.00227
G1 X131.842 Y134.898 E.00027
G3 X131.675 Y134.99 I-.171 J-.113 E.00608
G1 X124.754 Y134.99 E.21265
G1 X124.681 Y134.978 E.0023
G3 X124.561 Y134.852 I.065 J-.182 E.00552
; WIPE_START
M73 P77 R4
G1 F9547.055
M204 S6000
G1 X124.561 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.555 Y133.662 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692456
G1 F5542.42
M204 S6000
G1 X129.651 Y133.662 E.21681
M204 S10000
G1 X129.796 Y132.258 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6598
M204 S6000
G1 X129.796 Y132.968 E.02356
G1 X130 Y132.968 E.00675
G1 X130 Y133.682 E.02371
G3 X130.723 Y132.847 I2.553 J1.48 E.03689
G1 X130.723 Y130.427 E.08026
G3 X129.917 Y128.655 I1.256 J-1.641 E.06726
G3 X130.723 Y127.606 I2.262 J.904 E.04447
G1 X130.723 Y125.186 E.08026
G3 X129.917 Y123.414 I1.256 J-1.641 E.06725
G3 X130.723 Y122.364 I2.262 J.904 E.04447
G1 X130.723 Y123.993 E.05401
M204 S10000
G1 X129.651 Y122.338 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.692277
G1 F5543.947
M204 S6000
G1 X125.555 Y122.338 E.21675
; OBJECT_ID: 394
; WIPE_START
G1 X127.555 Y122.338 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X119.929 Y122.648 Z10.6 F42000
G1 X104.609 Y123.273 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6598
M204 S6000
G1 X107.871 Y123.273 E.10821
G1 X107.871 Y132.727 E.31361
G1 X104.217 Y132.727 E.12121
G1 X104.217 Y123.273 E.31361
G1 X104.549 Y123.273 E.01102
M204 S250
G1 X104.609 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6598
M204 S5000
G1 X107.479 Y123.665 E.08819
G1 X107.479 Y132.335 E.2664
G1 X104.609 Y132.335 E.08819
G1 X104.609 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X106.609 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.891 Y131.12 Z10.6 F42000
G1 X104.182 Y134.191 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6598
M204 S6000
G1 X104.182 Y133.134 E.03505
G1 X108.278 Y133.134 E.13588
G1 X108.278 Y122.866 E.34062
G1 X104.182 Y122.866 E.13588
G1 X104.182 Y121.809 E.03504
G1 X109.902 Y121.809 E.18975
G1 X109.902 Y134.191 E.4107
G1 X104.242 Y134.191 E.18776
M204 S10000
G1 X103.775 Y134.598 F42000
G1 F6598
M204 S6000
G1 X103.775 Y121.402 E.43772
G1 X110.309 Y121.402 E.21675
G1 X110.309 Y134.598 E.43771
G1 X103.835 Y134.598 E.21477
M204 S250
G1 X103.383 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6598
M204 S5000
G1 X103.393 Y121.14 E.41949
G3 X103.575 Y121.01 I.186 J.068 E.00731
G1 X110.503 Y121.01 E.21286
G3 X110.682 Y121.122 I-.014 J.221 E.00676
G1 X110.695 Y121.156 E.00112
G1 X110.701 Y134.194 E.40061
G3 X110.7 Y134.82 I-5.496 J.3 E.01926
G3 X110.676 Y134.89 I-.323 J-.07 E.00227
G1 X110.672 Y134.898 E.00027
G3 X110.505 Y134.99 I-.171 J-.113 E.00608
G1 X103.585 Y134.99 E.21265
G1 X103.511 Y134.978 E.0023
G3 X103.391 Y134.852 I.065 J-.182 E.00552
; WIPE_START
G1 F9547.055
M204 S6000
G1 X103.391 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.385 Y133.662 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692456
G1 F5542.42
M204 S6000
G1 X108.482 Y133.662 E.21681
M204 S10000
G1 X108.626 Y132.258 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6598
M204 S6000
G1 X108.626 Y132.968 E.02356
G1 X108.83 Y132.968 E.00675
G1 X108.83 Y133.682 E.02371
G3 X109.554 Y132.847 I2.553 J1.48 E.03689
G1 X109.554 Y130.427 E.08026
G3 X108.747 Y128.655 I1.256 J-1.641 E.06726
G3 X109.554 Y127.606 I2.262 J.904 E.04447
G1 X109.554 Y125.186 E.08026
G3 X108.747 Y123.414 I1.256 J-1.641 E.06725
G3 X109.554 Y122.364 I2.262 J.904 E.04447
G1 X109.554 Y123.993 E.05401
M204 S10000
G1 X108.482 Y122.338 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.692277
G1 F5543.947
M204 S6000
G1 X104.385 Y122.338 E.21675
; CHANGE_LAYER
; Z_HEIGHT: 10.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5543.947
G1 X106.385 Y122.338 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 52/72
; update layer progress
M73 L52
M991 S0 P51 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z10.6 I-.028 J1.217 P1  F42000
G1 X146.948 Y123.273 Z10.6
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6618
M204 S6000
G1 X150.211 Y123.273 E.10821
G1 X150.211 Y132.727 E.31361
G1 X146.556 Y132.727 E.12121
G1 X146.556 Y123.273 E.31361
G1 X146.888 Y123.273 E.01102
M204 S250
G1 X146.948 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6618
M204 S5000
G1 X149.818 Y123.665 E.08819
G1 X149.818 Y132.335 E.2664
G1 X146.948 Y132.335 E.08819
G1 X146.948 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.948 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.255 Y131.125 Z10.8 F42000
G1 X146.557 Y134.191 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6618
M204 S6000
G1 X146.557 Y133.134 E.03505
G1 X150.618 Y133.134 E.13469
G1 X150.618 Y122.866 E.34062
G1 X146.557 Y122.866 E.13469
G1 X146.557 Y121.809 E.03504
G1 X152.287 Y121.809 E.19006
G1 X152.287 Y134.19 E.4107
G1 X146.617 Y134.191 E.18807
M204 S10000
G1 X146.15 Y134.598 F42000
G1 F6618
M204 S6000
G1 X146.15 Y121.402 E.43772
G1 X152.694 Y121.402 E.21706
G1 X152.694 Y134.598 E.43771
G1 X146.21 Y134.598 E.21508
M204 S250
G1 X145.758 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6618
M204 S5000
G1 X145.768 Y121.14 E.41949
G3 X145.951 Y121.01 I.186 J.068 E.00731
G1 X152.886 Y121.01 E.21311
G3 X153.066 Y121.122 I-.012 J.221 E.0068
G1 X153.08 Y121.156 E.00112
G1 X153.086 Y134.788 E.41887
G3 X153.061 Y134.89 I-.253 J-.008 E.00326
G1 X153.056 Y134.899 E.0003
G3 X152.893 Y134.99 I-.17 J-.115 E.00595
G1 X145.96 Y134.99 E.21302
G1 X145.886 Y134.978 E.0023
G3 X145.766 Y134.853 I.065 J-.182 E.00552
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.767 Y132.853 E-.76
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
G1 X146.761 Y133.662 F42000
G1 Z10.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692402
G1 F5542.883
M204 S6000
G1 X150.821 Y133.662 E.21489
M204 S10000
G1 X150.966 Y132.515 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6618
M204 S6000
G1 X150.966 Y132.968 E.01502
G1 X151.169 Y132.968 E.00675
G1 X151.169 Y133.842 E.02901
G1 X151.267 Y133.842 E.00324
G3 X151.939 Y132.966 I6.916 J4.607 E.03664
G1 X151.938 Y130.71 E.07486
G1 X151.873 Y130.621 E.00365
G3 X151.227 Y128.655 I1.176 J-1.476 E.07264
G3 X151.938 Y127.725 I7.344 J4.878 E.03887
G1 X151.938 Y125.468 E.07487
G1 X151.873 Y125.379 E.00365
G3 X151.227 Y123.414 I1.176 J-1.476 E.07264
G3 X151.938 Y122.484 I7.343 J4.878 E.03886
G1 X151.938 Y124.112 E.05401
M204 S10000
G1 X150.821 Y122.338 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.692289
G1 F5543.849
M204 S6000
G1 X146.761 Y122.338 E.21486
; OBJECT_ID: 405
; WIPE_START
G1 X148.761 Y122.338 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X141.134 Y122.648 Z10.8 F42000
G1 X125.779 Y123.273 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P78 R4
G1 F6618
M204 S6000
G1 X129.041 Y123.273 E.10821
G1 X129.041 Y132.727 E.31361
G1 X125.387 Y132.727 E.12121
G1 X125.387 Y123.273 E.31361
G1 X125.719 Y123.273 E.01102
M204 S250
G1 X125.779 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6618
M204 S5000
G1 X128.649 Y123.665 E.08819
G1 X128.649 Y132.335 E.2664
G1 X125.779 Y132.335 E.08819
G1 X125.779 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.778 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.085 Y131.125 Z10.8 F42000
G1 X125.387 Y134.191 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6618
M204 S6000
G1 X125.387 Y133.134 E.03505
G1 X129.448 Y133.134 E.13469
G1 X129.448 Y122.866 E.34062
G1 X125.387 Y122.866 E.13469
G1 X125.387 Y121.809 E.03504
G1 X131.117 Y121.809 E.19006
G1 X131.117 Y134.19 E.4107
G1 X125.447 Y134.191 E.18807
M204 S10000
G1 X124.98 Y134.598 F42000
G1 F6618
M204 S6000
G1 X124.98 Y121.402 E.43772
G1 X131.524 Y121.402 E.21706
G1 X131.524 Y134.598 E.43771
G1 X125.04 Y134.598 E.21508
M204 S250
G1 X124.588 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6618
M204 S5000
G1 X124.598 Y121.14 E.41949
G3 X124.781 Y121.01 I.186 J.068 E.00731
G1 X131.716 Y121.01 E.21311
G3 X131.897 Y121.122 I-.012 J.221 E.0068
G1 X131.91 Y121.156 E.00112
G1 X131.916 Y134.788 E.41887
G3 X131.891 Y134.89 I-.253 J-.008 E.00326
G1 X131.886 Y134.899 E.0003
G3 X131.723 Y134.99 I-.17 J-.115 E.00595
G1 X124.79 Y134.99 E.21302
G1 X124.716 Y134.978 E.0023
G3 X124.597 Y134.853 I.065 J-.182 E.00552
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.597 Y132.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.591 Y133.662 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692402
G1 F5542.883
M204 S6000
G1 X129.651 Y133.662 E.21489
M204 S10000
G1 X129.796 Y132.515 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6618
M204 S6000
G1 X129.796 Y132.968 E.01502
G1 X130 Y132.968 E.00675
G1 X130 Y133.842 E.02901
G1 X130.097 Y133.842 E.00324
G3 X130.769 Y132.966 I6.916 J4.607 E.03664
G1 X130.769 Y130.71 E.07486
G1 X130.704 Y130.621 E.00365
G3 X130.057 Y128.655 I1.176 J-1.476 E.07264
G3 X130.769 Y127.725 I7.344 J4.878 E.03887
G1 X130.769 Y125.468 E.07487
G1 X130.704 Y125.379 E.00365
G3 X130.057 Y123.414 I1.176 J-1.476 E.07264
G3 X130.769 Y122.484 I7.343 J4.878 E.03886
G1 X130.769 Y124.112 E.05401
M204 S10000
G1 X129.651 Y122.338 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.692289
G1 F5543.849
M204 S6000
G1 X125.591 Y122.338 E.21486
; OBJECT_ID: 394
; WIPE_START
G1 X127.591 Y122.338 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X119.965 Y122.648 Z10.8 F42000
G1 X104.609 Y123.273 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6618
M204 S6000
G1 X107.871 Y123.273 E.10821
G1 X107.871 Y132.727 E.31361
G1 X104.217 Y132.727 E.12121
G1 X104.217 Y123.273 E.31361
G1 X104.549 Y123.273 E.01102
M204 S250
G1 X104.609 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6618
M204 S5000
G1 X107.479 Y123.665 E.08819
G1 X107.479 Y132.335 E.2664
G1 X104.609 Y132.335 E.08819
G1 X104.609 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X106.609 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.915 Y131.125 Z10.8 F42000
G1 X104.218 Y134.191 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6618
M204 S6000
G1 X104.218 Y133.134 E.03505
G1 X108.278 Y133.134 E.13469
G1 X108.278 Y122.866 E.34062
G1 X104.218 Y122.866 E.13469
G1 X104.218 Y121.809 E.03504
G1 X109.947 Y121.809 E.19006
G1 X109.947 Y134.19 E.4107
G1 X104.278 Y134.191 E.18807
M204 S10000
G1 X103.811 Y134.598 F42000
G1 F6618
M204 S6000
G1 X103.811 Y121.402 E.43772
G1 X110.354 Y121.402 E.21706
G1 X110.354 Y134.598 E.43771
G1 X103.871 Y134.598 E.21508
M204 S250
G1 X103.418 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6618
M204 S5000
G1 X103.429 Y121.14 E.41949
G3 X103.611 Y121.01 I.186 J.068 E.00731
G1 X110.547 Y121.01 E.21311
G3 X110.727 Y121.122 I-.012 J.221 E.0068
G1 X110.74 Y121.156 E.00112
G1 X110.746 Y134.788 E.41887
G3 X110.721 Y134.89 I-.253 J-.008 E.00326
G1 X110.716 Y134.899 E.0003
G3 X110.553 Y134.99 I-.17 J-.115 E.00595
G1 X103.621 Y134.99 E.21302
G1 X103.547 Y134.978 E.0023
G3 X103.427 Y134.853 I.065 J-.182 E.00552
; WIPE_START
G1 F9547.055
M204 S6000
G1 X103.427 Y132.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.421 Y133.662 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692402
G1 F5542.883
M204 S6000
G1 X108.482 Y133.662 E.21489
M204 S10000
G1 X108.626 Y132.515 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6618
M204 S6000
G1 X108.626 Y132.968 E.01502
G1 X108.83 Y132.968 E.00675
G1 X108.83 Y133.842 E.02901
G1 X108.928 Y133.842 E.00324
G3 X109.599 Y132.966 I6.916 J4.607 E.03664
G1 X109.599 Y130.71 E.07486
G1 X109.534 Y130.621 E.00365
G3 X108.888 Y128.655 I1.176 J-1.476 E.07264
G3 X109.599 Y127.725 I7.344 J4.878 E.03887
G1 X109.599 Y125.468 E.07487
G1 X109.534 Y125.379 E.00365
G3 X108.888 Y123.414 I1.176 J-1.476 E.07264
G3 X109.599 Y122.484 I7.343 J4.878 E.03886
G1 X109.599 Y124.112 E.05401
M204 S10000
G1 X108.482 Y122.338 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.692289
G1 F5543.849
M204 S6000
G1 X104.421 Y122.338 E.21486
; CHANGE_LAYER
; Z_HEIGHT: 10.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F5543.849
G1 X106.421 Y122.338 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 53/72
; update layer progress
M73 L53
M991 S0 P52 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z10.8 I-.028 J1.217 P1  F42000
G1 X146.948 Y123.273 Z10.8
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6612
M204 S6000
G1 X150.211 Y123.273 E.10821
G1 X150.211 Y132.727 E.31361
G1 X146.556 Y132.727 E.12121
G1 X146.556 Y123.273 E.31361
G1 X146.888 Y123.273 E.01102
M204 S250
G1 X146.948 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6612
M204 S5000
G1 X149.818 Y123.665 E.08819
G1 X149.818 Y132.335 E.2664
G1 X146.948 Y132.335 E.08819
G1 X146.948 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.948 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.279 Y131.131 Z11 F42000
G1 X146.593 Y134.191 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6612
M204 S6000
G1 X146.593 Y133.134 E.03505
G1 X150.618 Y133.134 E.1335
G1 X150.618 Y122.866 E.34062
G1 X146.593 Y122.866 E.1335
G1 X146.593 Y121.809 E.03504
G1 X152.332 Y121.809 E.19037
G1 X152.332 Y134.191 E.41071
G1 X146.653 Y134.191 E.18839
M204 S10000
G1 X146.186 Y134.598 F42000
G1 F6612
M204 S6000
G1 X146.186 Y121.402 E.43772
G1 X152.739 Y121.402 E.21738
G1 X152.739 Y134.598 E.43771
G1 X146.246 Y134.598 E.21539
M204 S250
G1 X145.794 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6612
M204 S5000
G1 X145.804 Y121.14 E.41949
G3 X145.986 Y121.01 I.186 J.068 E.00731
G1 X152.98 Y121.017 E.21489
G3 X153.112 Y121.122 I-.047 J.194 E.00536
G1 X153.125 Y121.156 E.00111
G1 X153.126 Y134.839 E.42045
G1 X153.106 Y134.891 E.00169
G1 X153.101 Y134.899 E.00031
G3 X152.932 Y134.99 I-.17 J-.115 E.00611
G1 X145.996 Y134.99 E.21313
G1 X145.922 Y134.978 E.0023
G3 X145.802 Y134.852 I.065 J-.182 E.00552
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.803 Y132.852 E-.76
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
G1 X146.797 Y133.662 F42000
G1 Z10.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692462
G1 F5542.373
M204 S6000
G1 X150.821 Y133.662 E.21302
M204 S10000
G1 X150.966 Y132.636 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6612
M204 S6000
G1 X150.966 Y132.968 E.011
G1 X151.169 Y132.968 E.00675
G1 X151.169 Y133.842 E.02901
G1 X151.388 Y133.842 E.00726
G2 X151.984 Y133.136 I-3.407 J-3.479 E.03069
G1 X151.984 Y130.981 E.07151
G1 X151.672 Y130.621 E.0158
G3 X151.341 Y128.655 I1.133 J-1.201 E.07098
G2 X151.984 Y127.895 I-3.667 J-3.752 E.03307
G1 X151.984 Y125.739 E.07152
G1 X151.672 Y125.379 E.01579
G3 X151.341 Y123.414 I1.133 J-1.201 E.07098
G2 X151.984 Y122.654 I-3.667 J-3.752 E.03306
G1 X151.984 Y124.282 E.05401
M204 S10000
G1 X150.821 Y122.338 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.692292
G1 F5543.821
M204 S6000
G1 X146.797 Y122.338 E.21296
; OBJECT_ID: 405
; WIPE_START
G1 X148.797 Y122.338 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X141.17 Y122.647 Z11 F42000
G1 X125.779 Y123.273 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6612
M204 S6000
G1 X129.041 Y123.273 E.10821
G1 X129.041 Y132.727 E.31361
G1 X125.387 Y132.727 E.12121
G1 X125.387 Y123.273 E.31361
G1 X125.719 Y123.273 E.01102
M204 S250
G1 X125.779 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6612
M204 S5000
G1 X128.649 Y123.665 E.08819
G1 X128.649 Y132.335 E.2664
G1 X125.779 Y132.335 E.08819
G1 X125.779 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.778 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.109 Y131.131 Z11 F42000
G1 X125.423 Y134.191 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6612
M204 S6000
G1 X125.423 Y133.134 E.03505
G1 X129.448 Y133.134 E.1335
G1 X129.448 Y122.866 E.34062
G1 X125.423 Y122.866 E.1335
G1 X125.423 Y121.809 E.03504
G1 X131.162 Y121.809 E.19037
G1 X131.162 Y134.191 E.41071
G1 X125.483 Y134.191 E.18839
M204 S10000
G1 X125.016 Y134.598 F42000
G1 F6612
M204 S6000
G1 X125.016 Y121.402 E.43772
G1 X131.569 Y121.402 E.21738
G1 X131.569 Y134.598 E.43771
G1 X125.076 Y134.598 E.21539
M204 S250
G1 X124.624 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6612
M204 S5000
G1 X124.634 Y121.14 E.41949
G3 X124.817 Y121.01 I.186 J.068 E.00731
G1 X131.81 Y121.017 E.21489
G3 X131.942 Y121.122 I-.047 J.194 E.00536
G1 X131.955 Y121.156 E.00111
G1 X131.956 Y134.839 E.42045
G1 X131.936 Y134.891 E.00169
G1 X131.931 Y134.899 E.00031
G3 X131.762 Y134.99 I-.17 J-.115 E.00611
G1 X124.826 Y134.99 E.21313
G1 X124.752 Y134.978 E.0023
G3 X124.633 Y134.852 I.065 J-.182 E.00552
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.633 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.627 Y133.662 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692462
G1 F5542.373
M204 S6000
G1 X129.651 Y133.662 E.21302
M204 S10000
M73 P79 R4
G1 X129.796 Y132.636 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6612
M204 S6000
G1 X129.796 Y132.968 E.011
G1 X130 Y132.968 E.00675
G1 X130 Y133.842 E.02901
G1 X130.218 Y133.842 E.00726
G2 X130.814 Y133.136 I-3.407 J-3.479 E.03069
G1 X130.814 Y130.981 E.07151
G1 X130.502 Y130.621 E.0158
G3 X130.171 Y128.655 I1.133 J-1.201 E.07098
G2 X130.814 Y127.895 I-3.667 J-3.752 E.03307
G1 X130.814 Y125.739 E.07152
G1 X130.502 Y125.379 E.01579
G3 X130.171 Y123.414 I1.133 J-1.201 E.07098
G2 X130.814 Y122.654 I-3.667 J-3.752 E.03306
G1 X130.814 Y124.282 E.05401
M204 S10000
G1 X129.651 Y122.338 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.692292
G1 F5543.821
M204 S6000
G1 X125.627 Y122.338 E.21296
; OBJECT_ID: 394
; WIPE_START
G1 X127.627 Y122.338 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X120.001 Y122.647 Z11 F42000
G1 X104.609 Y123.273 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6612
M204 S6000
G1 X107.871 Y123.273 E.10821
G1 X107.871 Y132.727 E.31361
G1 X104.217 Y132.727 E.12121
G1 X104.217 Y123.273 E.31361
G1 X104.549 Y123.273 E.01102
M204 S250
G1 X104.609 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6612
M204 S5000
G1 X107.479 Y123.665 E.08819
G1 X107.479 Y132.335 E.2664
G1 X104.609 Y132.335 E.08819
G1 X104.609 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X106.609 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.939 Y131.131 Z11 F42000
G1 X104.253 Y134.191 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6612
M204 S6000
G1 X104.253 Y133.134 E.03505
G1 X108.278 Y133.134 E.1335
G1 X108.278 Y122.866 E.34062
G1 X104.253 Y122.866 E.1335
G1 X104.253 Y121.809 E.03504
G1 X109.992 Y121.809 E.19037
G1 X109.993 Y134.191 E.41071
G1 X104.313 Y134.191 E.18839
M204 S10000
G1 X103.846 Y134.598 F42000
G1 F6612
M204 S6000
G1 X103.846 Y121.402 E.43772
G1 X110.399 Y121.402 E.21738
G1 X110.4 Y134.598 E.43771
G1 X103.906 Y134.598 E.21539
M204 S250
G1 X103.454 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6612
M204 S5000
G1 X103.465 Y121.14 E.41949
G3 X103.647 Y121.01 I.186 J.068 E.00731
G1 X110.64 Y121.017 E.21489
G3 X110.772 Y121.122 I-.047 J.194 E.00536
G1 X110.785 Y121.156 E.00111
G1 X110.786 Y134.839 E.42045
G1 X110.766 Y134.891 E.00169
G1 X110.761 Y134.899 E.00031
G3 X110.593 Y134.99 I-.17 J-.115 E.00611
G1 X103.657 Y134.99 E.21313
G1 X103.583 Y134.978 E.0023
G3 X103.463 Y134.852 I.065 J-.182 E.00552
; WIPE_START
G1 F9547.055
M204 S6000
G1 X103.463 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.457 Y133.662 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692462
G1 F5542.373
M204 S6000
G1 X108.482 Y133.662 E.21302
M204 S10000
G1 X108.626 Y132.636 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6612
M204 S6000
G1 X108.626 Y132.968 E.011
G1 X108.83 Y132.968 E.00675
G1 X108.83 Y133.842 E.02901
G1 X109.049 Y133.842 E.00726
G2 X109.644 Y133.136 I-3.407 J-3.479 E.03069
G1 X109.644 Y130.981 E.07151
G1 X109.332 Y130.621 E.0158
G3 X109.002 Y128.655 I1.133 J-1.201 E.07098
G2 X109.644 Y127.895 I-3.667 J-3.752 E.03307
G1 X109.644 Y125.739 E.07152
G1 X109.332 Y125.379 E.01579
G3 X109.002 Y123.414 I1.133 J-1.201 E.07098
G2 X109.644 Y122.654 I-3.667 J-3.752 E.03306
G1 X109.644 Y124.282 E.05401
M204 S10000
G1 X108.482 Y122.338 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.692292
G1 F5543.821
M204 S6000
G1 X104.457 Y122.338 E.21296
; CHANGE_LAYER
; Z_HEIGHT: 10.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5543.821
G1 X106.457 Y122.338 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 54/72
; update layer progress
M73 L54
M991 S0 P53 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z11 I-.028 J1.217 P1  F42000
G1 X146.948 Y123.273 Z11
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6602
M204 S6000
G1 X150.211 Y123.273 E.10821
G1 X150.211 Y132.727 E.31361
G1 X146.556 Y132.727 E.12121
G1 X146.556 Y123.273 E.31361
G1 X146.888 Y123.273 E.01102
M204 S250
G1 X146.948 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6602
M204 S5000
G1 X149.818 Y123.665 E.08819
G1 X149.818 Y132.335 E.2664
G1 X146.948 Y132.335 E.08819
G1 X146.948 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.948 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.303 Y131.136 Z11.2 F42000
G1 X146.629 Y134.191 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6602
M204 S6000
G1 X146.629 Y133.134 E.03505
G1 X150.618 Y133.134 E.13231
G1 X150.618 Y122.866 E.34062
G1 X146.629 Y122.866 E.13231
G1 X146.629 Y121.809 E.03504
G1 X152.377 Y121.809 E.19068
G1 X152.377 Y134.19 E.4107
G1 X146.689 Y134.191 E.1887
M204 S10000
G1 X146.222 Y134.598 F42000
G1 F6602
M204 S6000
G1 X146.222 Y121.402 E.43772
G1 X152.784 Y121.402 E.21769
G1 X152.784 Y134.597 E.43771
G1 X146.282 Y134.598 E.2157
M204 S250
G1 X145.83 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6602
M204 S5000
G1 X145.84 Y121.14 E.41949
G3 X146.022 Y121.01 I.186 J.068 E.00731
G1 X153.025 Y121.017 E.21518
G3 X153.157 Y121.122 I-.045 J.191 E.00537
G1 X153.173 Y121.167 E.00146
G1 X153.17 Y134.844 E.42025
G1 X153.151 Y134.891 E.00155
G1 X153.089 Y134.956 E.00277
G3 X152.984 Y134.99 I-.131 J-.232 E.00343
G1 X146.032 Y134.99 E.2136
G1 X145.958 Y134.978 E.0023
G3 X145.838 Y134.853 I.065 J-.182 E.00552
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.839 Y132.853 E-.76
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
G1 X146.832 Y133.662 F42000
G1 Z10.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692403
G1 F5542.872
M204 S6000
G1 X150.821 Y133.662 E.2111
M204 S10000
G1 X150.966 Y132.743 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6602
M204 S6000
G1 X150.966 Y132.968 E.00747
G1 X151.169 Y132.968 E.00675
G1 X151.169 Y133.842 E.02901
G1 X151.495 Y133.842 E.01079
G1 X152.029 Y133.34 E.02433
G1 X152.029 Y131.168 E.07205
G1 X151.447 Y130.621 E.02649
G3 X151.058 Y129.966 I.682 J-.848 E.02582
G1 X151.104 Y129.31 E.02179
G3 X152.029 Y128.099 I2.14 J.674 E.05159
G1 X152.029 Y125.926 E.07205
G1 X151.447 Y125.379 E.02649
G3 X151.058 Y124.724 I.682 J-.848 E.02582
G1 X151.104 Y124.069 E.02179
G3 X152.029 Y122.857 I2.14 J.674 E.05159
G1 X152.029 Y122.158 E.02321
G1 X151.169 Y122.158 E.02851
G1 X151.169 Y122.227 E.00229
M204 S10000
G1 X150.821 Y122.338 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.692304
G1 F5543.722
M204 S6000
G1 X146.832 Y122.338 E.21106
; OBJECT_ID: 405
; WIPE_START
G1 X148.832 Y122.338 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X141.206 Y122.647 Z11.2 F42000
G1 X125.779 Y123.273 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6602
M204 S6000
G1 X129.041 Y123.273 E.10821
G1 X129.041 Y132.727 E.31361
G1 X125.387 Y132.727 E.12121
G1 X125.387 Y123.273 E.31361
G1 X125.719 Y123.273 E.01102
M204 S250
G1 X125.779 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6602
M204 S5000
G1 X128.649 Y123.665 E.08819
G1 X128.649 Y132.335 E.2664
G1 X125.779 Y132.335 E.08819
G1 X125.779 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.778 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.133 Y131.136 Z11.2 F42000
G1 X125.459 Y134.191 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6602
M204 S6000
G1 X125.459 Y133.134 E.03505
G1 X129.448 Y133.134 E.13231
G1 X129.448 Y122.866 E.34062
G1 X125.459 Y122.866 E.13231
G1 X125.459 Y121.809 E.03504
G1 X131.207 Y121.809 E.19068
G1 X131.208 Y134.19 E.4107
G1 X125.519 Y134.191 E.1887
M204 S10000
G1 X125.052 Y134.598 F42000
G1 F6602
M204 S6000
G1 X125.052 Y121.402 E.43772
G1 X131.614 Y121.402 E.21769
G1 X131.615 Y134.597 E.43771
G1 X125.112 Y134.598 E.2157
M204 S250
G1 X124.66 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6602
M204 S5000
G1 X124.67 Y121.14 E.41949
G3 X124.853 Y121.01 I.186 J.068 E.00731
G1 X131.855 Y121.017 E.21518
G3 X131.987 Y121.122 I-.045 J.191 E.00537
G1 X132.003 Y121.167 E.00146
G1 X132.001 Y134.844 E.42025
G1 X131.981 Y134.891 E.00155
G1 X131.92 Y134.956 E.00277
G3 X131.814 Y134.99 I-.131 J-.232 E.00343
G1 X124.862 Y134.99 E.2136
G1 X124.788 Y134.978 E.0023
G3 X124.668 Y134.853 I.065 J-.182 E.00552
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.669 Y132.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.663 Y133.662 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692403
G1 F5542.872
M204 S6000
G1 X129.651 Y133.662 E.2111
M204 S10000
G1 X129.796 Y132.743 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6602
M204 S6000
G1 X129.796 Y132.968 E.00747
G1 X130 Y132.968 E.00675
G1 X130 Y133.842 E.02901
G1 X130.325 Y133.842 E.01079
G1 X130.859 Y133.34 E.02433
G1 X130.859 Y131.168 E.07205
G1 X130.277 Y130.621 E.02649
G3 X129.888 Y129.966 I.682 J-.848 E.02582
G1 X129.935 Y129.31 E.02179
G3 X130.859 Y128.099 I2.14 J.674 E.05159
G1 X130.859 Y125.926 E.07205
G1 X130.277 Y125.379 E.02649
G3 X129.888 Y124.724 I.682 J-.848 E.02582
G1 X129.935 Y124.069 E.02179
G3 X130.859 Y122.857 I2.14 J.674 E.05159
G1 X130.859 Y122.158 E.02321
G1 X130 Y122.158 E.02851
G1 X130 Y122.227 E.00229
M204 S10000
G1 X129.651 Y122.338 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.692304
G1 F5543.722
M204 S6000
G1 X125.663 Y122.338 E.21106
; OBJECT_ID: 394
; WIPE_START
G1 X127.663 Y122.338 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X120.036 Y122.647 Z11.2 F42000
G1 X104.609 Y123.273 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6602
M204 S6000
G1 X107.871 Y123.273 E.10821
G1 X107.871 Y132.727 E.31361
G1 X104.217 Y132.727 E.12121
G1 X104.217 Y123.273 E.31361
G1 X104.549 Y123.273 E.01102
M204 S250
G1 X104.609 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P80 R4
G1 F6602
M204 S5000
G1 X107.479 Y123.665 E.08819
G1 X107.479 Y132.335 E.2664
G1 X104.609 Y132.335 E.08819
G1 X104.609 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X106.609 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.964 Y131.136 Z11.2 F42000
G1 X104.289 Y134.191 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6602
M204 S6000
G1 X104.289 Y133.134 E.03505
G1 X108.278 Y133.134 E.13231
G1 X108.278 Y122.866 E.34062
G1 X104.289 Y122.866 E.13231
G1 X104.289 Y121.809 E.03504
G1 X110.038 Y121.809 E.19068
G1 X110.038 Y134.19 E.4107
G1 X104.349 Y134.191 E.1887
M204 S10000
G1 X103.882 Y134.598 F42000
G1 F6602
M204 S6000
G1 X103.882 Y121.402 E.43772
G1 X110.445 Y121.402 E.21769
G1 X110.445 Y134.597 E.43771
G1 X103.942 Y134.598 E.2157
M204 S250
G1 X103.49 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6602
M204 S5000
G1 X103.501 Y121.14 E.41949
G3 X103.683 Y121.01 I.186 J.068 E.00731
G1 X110.686 Y121.017 E.21518
G3 X110.817 Y121.122 I-.045 J.191 E.00537
G1 X110.833 Y121.167 E.00146
G1 X110.831 Y134.844 E.42025
G1 X110.812 Y134.891 E.00155
G1 X110.75 Y134.956 E.00277
G3 X110.644 Y134.99 I-.131 J-.232 E.00343
G1 X103.692 Y134.99 E.2136
G1 X103.618 Y134.978 E.0023
G3 X103.499 Y134.853 I.065 J-.182 E.00552
; WIPE_START
G1 F9547.055
M204 S6000
G1 X103.499 Y132.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.493 Y133.662 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692403
G1 F5542.872
M204 S6000
G1 X108.482 Y133.662 E.2111
M204 S10000
G1 X108.626 Y132.743 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6602
M204 S6000
G1 X108.626 Y132.968 E.00747
G1 X108.83 Y132.968 E.00675
G1 X108.83 Y133.842 E.02901
G1 X109.155 Y133.842 E.01079
G1 X109.69 Y133.34 E.02433
G1 X109.69 Y131.168 E.07205
G1 X109.108 Y130.621 E.02649
G3 X108.719 Y129.966 I.682 J-.848 E.02582
G1 X108.765 Y129.31 E.02179
G3 X109.689 Y128.099 I2.14 J.674 E.05159
G1 X109.689 Y125.926 E.07205
G1 X109.108 Y125.379 E.02649
G3 X108.719 Y124.724 I.682 J-.848 E.02582
G1 X108.765 Y124.069 E.02179
G3 X109.689 Y122.857 I2.14 J.674 E.05159
G1 X109.689 Y122.158 E.02321
G1 X108.83 Y122.158 E.02851
G1 X108.83 Y122.227 E.00229
M204 S10000
G1 X108.482 Y122.338 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.692304
G1 F5543.722
M204 S6000
G1 X104.493 Y122.338 E.21106
; CHANGE_LAYER
; Z_HEIGHT: 11
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5543.722
G1 X106.493 Y122.338 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 55/72
; update layer progress
M73 L55
M991 S0 P54 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z11.2 I-.028 J1.217 P1  F42000
G1 X146.948 Y123.273 Z11.2
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6599
M204 S6000
G1 X150.211 Y123.273 E.10821
G1 X150.211 Y132.727 E.31361
G1 X146.556 Y132.727 E.12121
G1 X146.556 Y123.273 E.31361
G1 X146.888 Y123.273 E.01102
M204 S250
G1 X146.948 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6599
M204 S5000
G1 X149.818 Y123.665 E.08819
G1 X149.818 Y132.335 E.2664
G1 X146.948 Y132.335 E.08819
G1 X146.948 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.948 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.327 Y131.142 Z11.4 F42000
G1 X146.665 Y134.191 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6599
M204 S6000
G1 X146.665 Y133.134 E.03505
G1 X150.618 Y133.134 E.13112
G1 X150.618 Y122.866 E.34062
G1 X146.665 Y122.866 E.13112
G1 X146.665 Y121.809 E.03504
G1 X152.422 Y121.809 E.19099
G1 X152.423 Y134.191 E.41071
G1 X146.725 Y134.191 E.18901
M204 S10000
G1 X146.258 Y134.598 F42000
G1 F6599
M204 S6000
G1 X146.258 Y121.402 E.43772
G1 X152.829 Y121.402 E.218
G1 X152.83 Y134.598 E.43772
G1 X146.318 Y134.598 E.21601
M204 S250
G1 X145.866 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6599
M204 S5000
G1 X145.876 Y121.14 E.41949
G3 X146.058 Y121.01 I.186 J.068 E.00731
G1 X153.071 Y121.017 E.21548
G3 X153.201 Y121.12 I-.045 J.19 E.00528
G1 X153.218 Y121.167 E.00153
G1 X153.222 Y134.194 E.40029
G3 X153.22 Y134.818 I-5.772 J.3 E.01916
G1 X153.217 Y134.839 E.00067
G1 X153.207 Y134.865 E.00085
G1 X153.157 Y134.939 E.00274
G3 X153.022 Y134.99 I-.139 J-.167 E.00452
G1 X146.068 Y134.99 E.21369
G1 X145.994 Y134.978 E.0023
G3 X145.874 Y134.852 I.065 J-.182 E.00552
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.874 Y132.852 E-.76
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
G1 X146.868 Y133.662 F42000
G1 Z11
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692499
G1 F5542.058
M204 S6000
G1 X150.821 Y133.662 E.20923
M204 S10000
G1 X150.966 Y132.845 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6599
M204 S6000
G1 X150.966 Y132.968 E.00406
G1 X151.169 Y132.968 E.00675
G1 X151.169 Y133.842 E.02901
G1 X151.597 Y133.842 E.01419
G1 X152.074 Y133.508 E.01934
G1 X152.074 Y131.296 E.07338
G1 X151.127 Y130.621 E.03859
G1 X150.966 Y130.398 E.00911
G3 X152.074 Y128.266 I1.952 J-.339 E.08563
G1 X152.074 Y126.054 E.07338
G1 X151.127 Y125.379 E.03859
G1 X150.966 Y125.157 E.00911
G3 X152.074 Y123.025 I1.952 J-.339 E.08563
G1 X152.074 Y122.158 E.02878
G1 X151.313 Y122.158 E.02523
M204 S10000
G1 X150.821 Y122.338 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.692335
G1 F5543.452
M204 S6000
G1 X146.868 Y122.338 E.20918
; OBJECT_ID: 405
; WIPE_START
G1 X148.868 Y122.338 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X141.242 Y122.647 Z11.4 F42000
G1 X125.779 Y123.273 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6599
M204 S6000
G1 X129.041 Y123.273 E.10821
G1 X129.041 Y132.727 E.31361
G1 X125.387 Y132.727 E.12121
G1 X125.387 Y123.273 E.31361
G1 X125.719 Y123.273 E.01102
M204 S250
G1 X125.779 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6599
M204 S5000
G1 X128.649 Y123.665 E.08819
G1 X128.649 Y132.335 E.2664
G1 X125.779 Y132.335 E.08819
G1 X125.779 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.778 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.158 Y131.142 Z11.4 F42000
G1 X125.495 Y134.191 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6599
M204 S6000
G1 X125.495 Y133.134 E.03505
G1 X129.448 Y133.134 E.13112
G1 X129.448 Y122.866 E.34062
G1 X125.495 Y122.866 E.13112
G1 X125.495 Y121.809 E.03504
G1 X131.253 Y121.809 E.19099
G1 X131.253 Y134.191 E.41071
G1 X125.555 Y134.191 E.18901
M204 S10000
G1 X125.088 Y134.598 F42000
G1 F6599
M204 S6000
G1 X125.088 Y121.402 E.43772
G1 X131.66 Y121.402 E.218
G1 X131.66 Y134.598 E.43772
G1 X125.148 Y134.598 E.21601
M204 S250
G1 X124.696 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6599
M204 S5000
G1 X124.706 Y121.14 E.41949
G3 X124.888 Y121.01 I.186 J.068 E.00731
G1 X131.901 Y121.017 E.21548
G3 X132.031 Y121.12 I-.045 J.19 E.00528
G1 X132.048 Y121.167 E.00153
G1 X132.052 Y134.194 E.40029
G3 X132.051 Y134.818 I-5.772 J.3 E.01916
G1 X132.047 Y134.839 E.00067
G1 X132.037 Y134.865 E.00085
G1 X131.987 Y134.939 E.00274
G3 X131.852 Y134.99 I-.139 J-.167 E.00452
G1 X124.898 Y134.99 E.21369
G1 X124.824 Y134.978 E.0023
G3 X124.704 Y134.852 I.065 J-.182 E.00552
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.705 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.699 Y133.662 Z11.4 F42000
G1 Z11
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692499
G1 F5542.058
M204 S6000
G1 X129.651 Y133.662 E.20923
M204 S10000
G1 X129.796 Y132.845 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6599
M204 S6000
G1 X129.796 Y132.968 E.00406
G1 X130 Y132.968 E.00675
G1 X130 Y133.842 E.02901
G1 X130.427 Y133.842 E.01419
G1 X130.905 Y133.508 E.01934
G1 X130.905 Y131.296 E.07338
G1 X129.957 Y130.621 E.03859
G1 X129.796 Y130.398 E.00911
G3 X130.904 Y128.266 I1.952 J-.339 E.08563
G1 X130.904 Y126.054 E.07338
G1 X129.957 Y125.379 E.03859
G1 X129.796 Y125.157 E.00911
G3 X130.904 Y123.025 I1.952 J-.339 E.08563
G1 X130.904 Y122.158 E.02878
G1 X130.144 Y122.158 E.02523
M204 S10000
G1 X129.651 Y122.338 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.692335
G1 F5543.452
M204 S6000
G1 X125.699 Y122.338 E.20918
; OBJECT_ID: 394
; WIPE_START
G1 X127.699 Y122.338 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X120.072 Y122.647 Z11.4 F42000
G1 X104.609 Y123.273 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6599
M204 S6000
G1 X107.871 Y123.273 E.10821
G1 X107.871 Y132.727 E.31361
G1 X104.217 Y132.727 E.12121
G1 X104.217 Y123.273 E.31361
G1 X104.549 Y123.273 E.01102
M204 S250
G1 X104.609 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6599
M204 S5000
G1 X107.479 Y123.665 E.08819
G1 X107.479 Y132.335 E.2664
G1 X104.609 Y132.335 E.08819
G1 X104.609 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X106.609 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P81 R4
G1 X104.988 Y131.142 Z11.4 F42000
G1 X104.325 Y134.191 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6599
M204 S6000
G1 X104.325 Y133.134 E.03505
G1 X108.278 Y133.134 E.13112
G1 X108.278 Y122.866 E.34062
G1 X104.325 Y122.866 E.13112
G1 X104.325 Y121.809 E.03504
G1 X110.083 Y121.809 E.19099
G1 X110.083 Y134.191 E.41071
G1 X104.385 Y134.191 E.18901
M204 S10000
G1 X103.918 Y134.598 F42000
G1 F6599
M204 S6000
G1 X103.918 Y121.402 E.43772
G1 X110.49 Y121.402 E.218
G1 X110.49 Y134.598 E.43772
G1 X103.978 Y134.598 E.21601
M204 S250
G1 X103.526 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6599
M204 S5000
G1 X103.536 Y121.14 E.41949
G3 X103.719 Y121.01 I.186 J.068 E.00731
G1 X110.731 Y121.017 E.21548
G3 X110.862 Y121.12 I-.045 J.19 E.00528
G1 X110.878 Y121.167 E.00153
G1 X110.882 Y134.194 E.40029
G3 X110.881 Y134.818 I-5.772 J.3 E.01916
G1 X110.877 Y134.839 E.00067
G1 X110.868 Y134.865 E.00085
G1 X110.818 Y134.939 E.00274
G3 X110.683 Y134.99 I-.139 J-.167 E.00452
G1 X103.728 Y134.99 E.21369
G1 X103.654 Y134.978 E.0023
G3 X103.535 Y134.852 I.065 J-.182 E.00552
; WIPE_START
G1 F9547.055
M204 S6000
G1 X103.535 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.529 Y133.662 Z11.4 F42000
G1 Z11
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692499
G1 F5542.058
M204 S6000
G1 X108.482 Y133.662 E.20923
M204 S10000
G1 X108.626 Y132.845 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6599
M204 S6000
G1 X108.626 Y132.968 E.00406
G1 X108.83 Y132.968 E.00675
G1 X108.83 Y133.842 E.02901
G1 X109.258 Y133.842 E.01419
G1 X109.735 Y133.508 E.01934
G1 X109.735 Y131.296 E.07338
G1 X108.787 Y130.621 E.03859
G1 X108.626 Y130.398 E.00911
G3 X109.735 Y128.266 I1.952 J-.339 E.08563
G1 X109.735 Y126.054 E.07338
G1 X108.787 Y125.379 E.03859
G1 X108.626 Y125.157 E.00911
G3 X109.735 Y123.025 I1.952 J-.339 E.08563
G1 X109.735 Y122.158 E.02878
G1 X108.974 Y122.158 E.02523
M204 S10000
G1 X108.482 Y122.338 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.692335
G1 F5543.452
M204 S6000
G1 X104.529 Y122.338 E.20918
; CHANGE_LAYER
; Z_HEIGHT: 11.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5543.452
G1 X106.529 Y122.338 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 56/72
; update layer progress
M73 L56
M991 S0 P55 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z11.4 I-.028 J1.217 P1  F42000
G1 X146.948 Y123.273 Z11.4
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6618
M204 S6000
G1 X150.211 Y123.273 E.10821
G1 X150.211 Y132.727 E.31361
G1 X146.556 Y132.727 E.12121
G1 X146.556 Y123.273 E.31361
G1 X146.888 Y123.273 E.01102
M204 S250
G1 X146.948 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6618
M204 S5000
G1 X149.818 Y123.665 E.08819
G1 X149.818 Y132.335 E.2664
G1 X146.948 Y132.335 E.08819
G1 X146.948 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X148.948 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.352 Y131.147 Z11.6 F42000
G1 X146.701 Y134.191 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6618
M204 S6000
G1 X146.701 Y133.134 E.03505
G1 X150.618 Y133.134 E.12993
G1 X150.618 Y122.866 E.34062
G1 X146.701 Y122.866 E.12993
G1 X146.701 Y121.809 E.03504
G1 X152.468 Y121.809 E.19131
G1 X152.468 Y134.191 E.41071
G1 X146.761 Y134.191 E.18932
M204 S10000
G1 X146.294 Y134.598 F42000
G1 F6618
M204 S6000
G1 X146.294 Y121.402 E.43772
G1 X152.875 Y121.402 E.21831
G1 X152.875 Y134.598 E.43772
G1 X146.354 Y134.598 E.21633
M204 S250
G1 X145.901 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6618
M204 S5000
G1 X145.912 Y121.139 E.41952
G3 X146.094 Y121.01 I.186 J.069 E.00729
G1 X153.116 Y121.017 E.21577
G3 X153.246 Y121.12 I-.045 J.19 E.00528
G1 X153.263 Y121.167 E.00152
G1 X153.267 Y134.194 E.4003
G3 X153.266 Y134.817 I-5.795 J.3 E.01914
G3 X153.241 Y134.892 I-.285 J-.054 E.00244
G1 X153.203 Y134.938 E.00183
G3 X153.066 Y134.99 I-.14 J-.166 E.0046
G1 X146.104 Y134.99 E.21392
G1 X146.03 Y134.978 E.0023
G3 X145.91 Y134.853 I.065 J-.182 E.00553
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.91 Y132.853 E-.76
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
G1 X146.904 Y133.662 F42000
G1 Z11.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692518
G1 F5541.893
M204 S6000
G1 X150.821 Y133.662 E.20733
M204 S10000
G1 X150.966 Y132.945 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6618
M204 S6000
G1 X151.169 Y132.968 E.00679
G1 X151.169 Y133.842 E.02901
G2 X152.12 Y133.665 I.208 J-1.52 E.03262
G1 X152.12 Y131.375 E.07598
G2 X150.966 Y130.901 I-1.776 J2.681 E.04164
G1 X150.966 Y129.355 E.05127
G1 X151.135 Y129.069 E.01103
G1 X151.79 Y128.541 E.02791
G1 X152.12 Y128.424 E.01159
G1 X152.12 Y126.133 E.07598
G2 X150.966 Y125.659 I-1.776 J2.681 E.04164
G1 X150.966 Y124.114 E.05127
G1 X151.135 Y123.828 E.01103
G1 X151.79 Y123.3 E.02791
G1 X152.119 Y123.183 E.01159
G1 X152.119 Y122.158 E.03401
G1 X151.516 Y122.158 E.02001
M204 S10000
G1 X150.821 Y122.338 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.692346
G1 F5543.358
M204 S6000
G1 X146.904 Y122.338 E.20728
; OBJECT_ID: 405
; WIPE_START
G1 X148.904 Y122.338 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X141.278 Y122.646 Z11.6 F42000
G1 X125.779 Y123.273 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6618
M204 S6000
G1 X129.041 Y123.273 E.10821
G1 X129.041 Y132.727 E.31361
G1 X125.387 Y132.727 E.12121
G1 X125.387 Y123.273 E.31361
G1 X125.719 Y123.273 E.01102
M204 S250
G1 X125.779 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6618
M204 S5000
G1 X128.649 Y123.665 E.08819
G1 X128.649 Y132.335 E.2664
G1 X125.779 Y132.335 E.08819
G1 X125.779 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.778 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.182 Y131.147 Z11.6 F42000
G1 X125.531 Y134.191 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6618
M204 S6000
G1 X125.531 Y133.134 E.03505
G1 X129.448 Y133.134 E.12993
G1 X129.448 Y122.866 E.34062
G1 X125.531 Y122.866 E.12993
G1 X125.531 Y121.809 E.03504
G1 X131.298 Y121.809 E.19131
G1 X131.298 Y134.191 E.41071
G1 X125.591 Y134.191 E.18932
M204 S10000
G1 X125.124 Y134.598 F42000
G1 F6618
M204 S6000
G1 X125.124 Y121.402 E.43772
G1 X131.705 Y121.402 E.21831
G1 X131.705 Y134.598 E.43772
G1 X125.184 Y134.598 E.21633
M204 S250
G1 X124.732 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6618
M204 S5000
G1 X124.742 Y121.139 E.41952
G3 X124.924 Y121.01 I.186 J.069 E.00729
G1 X131.946 Y121.017 E.21577
G3 X132.077 Y121.12 I-.045 J.19 E.00528
G1 X132.093 Y121.167 E.00152
G1 X132.097 Y134.194 E.4003
G3 X132.096 Y134.817 I-5.795 J.3 E.01914
G3 X132.071 Y134.892 I-.285 J-.054 E.00244
G1 X132.034 Y134.938 E.00183
G3 X131.896 Y134.99 I-.14 J-.166 E.0046
G1 X124.934 Y134.99 E.21392
G1 X124.86 Y134.978 E.0023
G3 X124.74 Y134.853 I.065 J-.182 E.00553
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.741 Y132.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.734 Y133.662 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692518
G1 F5541.893
M204 S6000
G1 X129.651 Y133.662 E.20733
M204 S10000
G1 X129.796 Y132.945 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6618
M204 S6000
G1 X130 Y132.968 E.00679
G1 X130 Y133.842 E.02901
G2 X130.95 Y133.665 I.208 J-1.52 E.03262
G1 X130.95 Y131.375 E.07598
G2 X129.796 Y130.901 I-1.776 J2.681 E.04164
G1 X129.796 Y129.355 E.05127
G1 X129.965 Y129.069 E.01103
G1 X130.621 Y128.541 E.02791
G1 X130.95 Y128.424 E.01159
G1 X130.95 Y126.133 E.07598
G2 X129.796 Y125.659 I-1.776 J2.681 E.04164
G1 X129.796 Y124.114 E.05127
G1 X129.965 Y123.828 E.01103
G1 X130.621 Y123.3 E.02791
G1 X130.95 Y123.183 E.01159
G1 X130.95 Y122.158 E.03401
G1 X130.347 Y122.158 E.02001
M204 S10000
G1 X129.651 Y122.338 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.692346
G1 F5543.358
M204 S6000
G1 X125.734 Y122.338 E.20728
; OBJECT_ID: 394
; WIPE_START
G1 X127.734 Y122.338 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X120.108 Y122.646 Z11.6 F42000
G1 X104.609 Y123.273 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6618
M204 S6000
G1 X107.871 Y123.273 E.10821
G1 X107.871 Y132.727 E.31361
G1 X104.217 Y132.727 E.12121
G1 X104.217 Y123.273 E.31361
G1 X104.549 Y123.273 E.01102
M204 S250
G1 X104.609 Y123.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6618
M204 S5000
G1 X107.479 Y123.665 E.08819
G1 X107.479 Y132.335 E.2664
G1 X104.609 Y132.335 E.08819
G1 X104.609 Y123.725 E.26456
; WIPE_START
G1 F9547.055
M204 S6000
M73 P81 R3
G1 X106.609 Y123.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.012 Y131.147 Z11.6 F42000
G1 X104.361 Y134.191 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6618
M204 S6000
G1 X104.361 Y133.134 E.03505
G1 X108.278 Y133.134 E.12993
G1 X108.278 Y122.866 E.34062
G1 X104.361 Y122.866 E.12993
G1 X104.361 Y121.809 E.03504
G1 X110.128 Y121.809 E.19131
G1 X110.128 Y134.191 E.41071
G1 X104.421 Y134.191 E.18932
M204 S10000
G1 X103.954 Y134.598 F42000
G1 F6618
M204 S6000
G1 X103.954 Y121.402 E.43772
G1 X110.535 Y121.402 E.21831
G1 X110.535 Y134.598 E.43772
G1 X104.014 Y134.598 E.21633
M204 S250
G1 X103.562 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6618
M204 S5000
G1 X103.573 Y121.139 E.41952
G3 X103.755 Y121.01 I.186 J.069 E.00729
G1 X110.777 Y121.017 E.21577
G3 X110.907 Y121.12 I-.045 J.19 E.00528
G1 X110.924 Y121.167 E.00152
G1 X110.927 Y134.194 E.4003
G3 X110.926 Y134.817 I-5.795 J.3 E.01914
G3 X110.901 Y134.892 I-.285 J-.054 E.00244
G1 X110.864 Y134.938 E.00183
G3 X110.726 Y134.99 I-.14 J-.166 E.0046
G1 X103.764 Y134.99 E.21392
G1 X103.69 Y134.978 E.0023
G3 X103.571 Y134.853 I.065 J-.182 E.00553
; WIPE_START
G1 F9547.055
M204 S6000
G1 X103.571 Y132.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.565 Y133.662 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.692518
G1 F5541.893
M204 S6000
G1 X108.482 Y133.662 E.20733
M204 S10000
G1 X108.626 Y132.945 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6618
M204 S6000
G1 X108.83 Y132.968 E.00679
M73 P82 R3
G1 X108.83 Y133.842 E.02901
G2 X109.78 Y133.665 I.208 J-1.52 E.03262
G1 X109.78 Y131.375 E.07598
G2 X108.626 Y130.901 I-1.776 J2.681 E.04164
G1 X108.626 Y129.355 E.05127
G1 X108.796 Y129.069 E.01103
G1 X109.451 Y128.541 E.02791
G1 X109.78 Y128.424 E.01159
G1 X109.78 Y126.133 E.07598
G2 X108.626 Y125.659 I-1.776 J2.681 E.04164
G1 X108.626 Y124.114 E.05127
G1 X108.796 Y123.828 E.01103
G1 X109.451 Y123.3 E.02791
G1 X109.78 Y123.183 E.01159
G1 X109.78 Y122.158 E.03401
G1 X109.177 Y122.158 E.02001
M204 S10000
G1 X108.482 Y122.338 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.692346
G1 F5543.358
M204 S6000
G1 X104.565 Y122.338 E.20728
; CHANGE_LAYER
; Z_HEIGHT: 11.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5543.358
G1 X106.565 Y122.338 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 57/72
; update layer progress
M73 L57
M991 S0 P56 ;notify layer change
M106 S198.9
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z11.6 I-.344 J1.167 P1  F42000
G1 X146.74 Y134.191 Z11.6
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X146.74 Y121.809 E.41071
G1 X152.513 Y121.809 E.19151
G1 X152.513 Y134.19 E.41071
G1 X146.8 Y134.191 E.18952
M204 S10000
G1 X146.333 Y134.598 F42000
G1 F8843.478
M204 S6000
G1 X146.333 Y121.402 E.43772
G1 X152.92 Y121.402 E.21852
G1 X152.92 Y134.597 E.43771
G1 X146.393 Y134.598 E.21653
M204 S250
G1 X145.941 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X145.951 Y121.141 E.41947
G3 X146.137 Y121.01 I.189 J.071 E.00742
G1 X153.162 Y121.017 E.21585
G3 X153.292 Y121.12 I-.045 J.19 E.00527
G1 X153.308 Y121.167 E.00152
G1 X153.312 Y134.195 E.4003
G3 X153.311 Y134.817 I-5.874 J.3 E.01912
G3 X153.286 Y134.891 I-.273 J-.049 E.00243
G1 X153.249 Y134.938 E.00185
G3 X153.12 Y134.99 I-.14 J-.165 E.00435
G1 X146.147 Y134.99 E.21426
G1 X146.071 Y134.978 E.00236
G3 X145.949 Y134.852 I.064 J-.183 E.00556
; WIPE_START
M204 S6000
G1 X145.95 Y132.852 E-.76
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
G1 X146.903 Y133.857 F42000
G1 Z11.4
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.42079
M106 S255
G1 F3000
M204 S6000
G1 X150.018 Y133.857 E.09589
G1 X150.15 Y133.814 E.0043
G2 X150.779 Y133.479 I-.605 J-1.893 E.02204
G1 X147.073 Y133.479 E.1141
G1 X147.073 Y133.101 E.01164
G1 X150.689 Y133.101 E.11135
G1 X150.653 Y133.014 E.00292
G1 X150.653 Y132.723 E.00894
G1 X147.073 Y132.723 E.11023
G1 X147.073 Y132.346 E.01164
G1 X150.653 Y132.346 E.11023
G1 X150.653 Y131.968 E.01164
G1 X147.073 Y131.968 E.11023
G1 X147.073 Y131.59 E.01164
G1 X150.653 Y131.59 E.11023
G1 X150.653 Y131.212 E.01164
G1 X147.073 Y131.212 E.11023
G1 X147.073 Y130.834 E.01164
G1 X150.653 Y130.834 E.11023
G1 X150.653 Y130.456 E.01164
G1 X147.073 Y130.456 E.11023
G1 X147.073 Y130.078 E.01164
G1 X150.653 Y130.078 E.11023
G1 X150.653 Y129.701 E.01164
G1 X147.073 Y129.701 E.11023
G1 X147.073 Y129.323 E.01164
G1 X150.653 Y129.323 E.11023
G1 X150.653 Y128.945 E.01164
G1 X147.073 Y128.945 E.11023
G1 X147.073 Y128.567 E.01164
G1 X150.653 Y128.567 E.11023
G1 X150.653 Y128.189 E.01164
G1 X147.073 Y128.189 E.11023
G1 X147.073 Y127.811 E.01164
G1 X150.653 Y127.811 E.11023
G1 X150.653 Y127.433 E.01164
G1 X147.073 Y127.433 E.11023
G1 X147.073 Y127.055 E.01164
G1 X150.653 Y127.055 E.11023
G1 X150.653 Y126.678 E.01164
G1 X147.073 Y126.678 E.11023
G1 X147.073 Y126.3 E.01164
G1 X150.653 Y126.3 E.11023
G1 X150.653 Y125.922 E.01164
G1 X147.073 Y125.922 E.11023
G1 X147.073 Y125.544 E.01164
G1 X150.653 Y125.544 E.11023
G1 X150.653 Y125.166 E.01164
G1 X147.073 Y125.166 E.11023
G1 X147.073 Y124.788 E.01164
G1 X150.653 Y124.788 E.11023
G1 X150.653 Y124.41 E.01164
G1 X147.073 Y124.41 E.11023
G1 X147.073 Y124.032 E.01164
G1 X150.653 Y124.032 E.11023
G1 X150.653 Y123.655 E.01164
G1 X147.073 Y123.655 E.11023
G1 X147.073 Y123.277 E.01164
G1 X150.653 Y123.277 E.11023
G1 X150.653 Y122.986 E.00895
G1 X150.689 Y122.899 E.00291
G1 X147.073 Y122.899 E.11134
G1 X147.073 Y122.521 E.01164
G1 X150.779 Y122.521 E.11411
G1 X150.433 Y122.303 E.01259
G2 X150.019 Y122.143 I-1.135 J2.315 E.01369
G1 X146.903 Y122.143 E.09592
M106 S198.9
M204 S10000
G1 X150.902 Y122.14 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F10588.235
M204 S6000
G1 X150.839 Y122.177 E.00204
G1 X150.887 Y122.205 E.00155
M204 S10000
G1 X151.699 Y122.158 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X152.165 Y122.158 E.01546
G1 X152.165 Y123.32 E.03855
G1 X151.79 Y123.366 E.01251
G1 X151.045 Y123.854 E.02954
G1 X151.045 Y125.916 E.0684
G1 X151.79 Y125.987 E.02483
G1 X152.165 Y126.216 E.01457
G1 X152.165 Y128.561 E.07779
G1 X151.79 Y128.607 E.01251
G1 X151.045 Y129.095 E.02954
G1 X151.045 Y131.157 E.0684
G1 X151.79 Y131.228 E.02483
G1 X152.165 Y131.457 E.01457
G1 X152.165 Y133.086 E.05401
M204 S10000
G1 X150.908 Y133.792 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F10588.235
M204 S6000
G1 X150.844 Y133.829 E.00204
G1 X150.893 Y133.857 E.00155
; OBJECT_ID: 405
; WIPE_START
G1 X150.844 Y133.829 E-.32873
G1 X150.908 Y133.792 E-.43127
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X143.276 Y133.912 Z11.8 F42000
G1 X125.57 Y134.191 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X125.57 Y121.809 E.41071
G1 X131.343 Y121.809 E.19151
G1 X131.343 Y134.19 E.41071
G1 X125.63 Y134.191 E.18952
M204 S10000
G1 X125.163 Y134.598 F42000
G1 F8843.478
M204 S6000
G1 X125.163 Y121.402 E.43772
G1 X131.75 Y121.402 E.21852
G1 X131.75 Y134.597 E.43771
G1 X125.223 Y134.598 E.21653
M204 S250
G1 X124.771 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X124.781 Y121.141 E.41947
G3 X124.967 Y121.01 I.189 J.071 E.00742
G1 X131.992 Y121.017 E.21585
G3 X132.122 Y121.12 I-.045 J.19 E.00527
G1 X132.139 Y121.167 E.00152
G1 X132.143 Y134.195 E.4003
G3 X132.141 Y134.817 I-5.874 J.3 E.01912
G3 X132.117 Y134.891 I-.273 J-.049 E.00243
G1 X132.079 Y134.938 E.00185
G3 X131.95 Y134.99 I-.14 J-.165 E.00435
G1 X124.977 Y134.99 E.21426
G1 X124.901 Y134.978 E.00236
G3 X124.78 Y134.852 I.064 J-.183 E.00556
; WIPE_START
M204 S6000
G1 X124.78 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.734 Y133.857 Z11.8 F42000
G1 Z11.4
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.42079
M106 S255
G1 F3000
M204 S6000
G1 X128.848 Y133.857 E.09589
G1 X128.981 Y133.814 E.0043
G2 X129.609 Y133.479 I-.605 J-1.893 E.02204
G1 X125.903 Y133.479 E.1141
G1 X125.903 Y133.101 E.01164
G1 X129.519 Y133.101 E.11135
G1 X129.483 Y133.014 E.00292
G1 X129.483 Y132.723 E.00894
G1 X125.903 Y132.723 E.11023
G1 X125.903 Y132.346 E.01164
G1 X129.483 Y132.346 E.11023
G1 X129.483 Y131.968 E.01164
G1 X125.903 Y131.968 E.11023
G1 X125.903 Y131.59 E.01164
G1 X129.483 Y131.59 E.11023
G1 X129.483 Y131.212 E.01164
G1 X125.903 Y131.212 E.11023
G1 X125.903 Y130.834 E.01164
G1 X129.483 Y130.834 E.11023
G1 X129.483 Y130.456 E.01164
G1 X125.903 Y130.456 E.11023
G1 X125.903 Y130.078 E.01164
G1 X129.483 Y130.078 E.11023
G1 X129.483 Y129.701 E.01164
G1 X125.903 Y129.701 E.11023
G1 X125.903 Y129.323 E.01164
G1 X129.483 Y129.323 E.11023
G1 X129.483 Y128.945 E.01164
G1 X125.903 Y128.945 E.11023
G1 X125.903 Y128.567 E.01164
G1 X129.483 Y128.567 E.11023
G1 X129.483 Y128.189 E.01164
G1 X125.903 Y128.189 E.11023
G1 X125.903 Y127.811 E.01164
G1 X129.483 Y127.811 E.11023
G1 X129.483 Y127.433 E.01164
G1 X125.903 Y127.433 E.11023
G1 X125.903 Y127.055 E.01164
G1 X129.483 Y127.055 E.11023
G1 X129.483 Y126.678 E.01164
G1 X125.903 Y126.678 E.11023
G1 X125.903 Y126.3 E.01164
G1 X129.483 Y126.3 E.11023
G1 X129.483 Y125.922 E.01164
G1 X125.903 Y125.922 E.11023
G1 X125.903 Y125.544 E.01164
G1 X129.483 Y125.544 E.11023
G1 X129.483 Y125.166 E.01164
G1 X125.903 Y125.166 E.11023
G1 X125.903 Y124.788 E.01164
G1 X129.483 Y124.788 E.11023
G1 X129.483 Y124.41 E.01164
G1 X125.903 Y124.41 E.11023
G1 X125.903 Y124.032 E.01164
G1 X129.483 Y124.032 E.11023
G1 X129.483 Y123.655 E.01164
G1 X125.903 Y123.655 E.11023
G1 X125.903 Y123.277 E.01164
G1 X129.483 Y123.277 E.11023
G1 X129.483 Y122.986 E.00895
G1 X129.519 Y122.899 E.00291
G1 X125.903 Y122.899 E.11134
G1 X125.903 Y122.521 E.01164
G1 X129.609 Y122.521 E.11411
G1 X129.263 Y122.303 E.01259
G2 X128.849 Y122.143 I-1.135 J2.315 E.01369
G1 X125.734 Y122.143 E.09592
M106 S198.9
M204 S10000
G1 X129.733 Y122.14 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F10588.235
M204 S6000
G1 X129.669 Y122.177 E.00204
G1 X129.718 Y122.205 E.00155
M204 S10000
G1 X130.529 Y122.158 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X130.995 Y122.158 E.01546
G1 X130.995 Y123.32 E.03855
G1 X130.621 Y123.366 E.01251
G1 X129.875 Y123.854 E.02954
G1 X129.875 Y125.916 E.0684
G1 X130.621 Y125.987 E.02483
G1 X130.995 Y126.216 E.01457
G1 X130.995 Y128.561 E.07779
G1 X130.621 Y128.607 E.01251
G1 X129.875 Y129.095 E.02954
G1 X129.875 Y131.157 E.0684
G1 X130.621 Y131.228 E.02483
G1 X130.995 Y131.457 E.01457
G1 X130.995 Y133.086 E.05401
M204 S10000
G1 X129.738 Y133.792 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F10588.235
M204 S6000
G1 X129.674 Y133.829 E.00204
G1 X129.723 Y133.857 E.00155
; OBJECT_ID: 394
; WIPE_START
G1 X129.674 Y133.829 E-.32873
G1 X129.738 Y133.792 E-.43127
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X122.107 Y133.912 Z11.8 F42000
G1 X104.4 Y134.191 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X104.4 Y121.809 E.41071
G1 X110.174 Y121.809 E.19151
G1 X110.174 Y134.19 E.41071
G1 X104.46 Y134.191 E.18952
M204 S10000
G1 X103.993 Y134.598 F42000
G1 F8843.478
M204 S6000
G1 X103.993 Y121.402 E.43772
G1 X110.581 Y121.402 E.21852
G1 X110.581 Y134.597 E.43771
G1 X104.053 Y134.598 E.21653
M204 S250
G1 X103.601 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X103.611 Y121.141 E.41947
G3 X103.797 Y121.01 I.189 J.071 E.00742
G1 X110.822 Y121.017 E.21585
G3 X110.952 Y121.12 I-.045 J.19 E.00527
G1 X110.969 Y121.167 E.00152
G1 X110.973 Y134.195 E.4003
G3 X110.972 Y134.817 I-5.874 J.3 E.01912
M73 P83 R3
G3 X110.947 Y134.891 I-.273 J-.049 E.00243
G1 X110.909 Y134.938 E.00185
G3 X110.78 Y134.99 I-.14 J-.165 E.00435
G1 X103.807 Y134.99 E.21426
G1 X103.731 Y134.978 E.00236
G3 X103.61 Y134.852 I.064 J-.183 E.00556
; WIPE_START
M204 S6000
G1 X103.61 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.564 Y133.857 Z11.8 F42000
G1 Z11.4
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.42079
M106 S255
G1 F3000
M204 S6000
G1 X107.678 Y133.857 E.09589
G1 X107.811 Y133.814 E.0043
G2 X108.439 Y133.479 I-.605 J-1.893 E.02204
G1 X104.734 Y133.479 E.1141
G1 X104.734 Y133.101 E.01164
G1 X108.35 Y133.101 E.11135
G1 X108.313 Y133.014 E.00292
G1 X108.313 Y132.723 E.00894
G1 X104.734 Y132.723 E.11023
G1 X104.734 Y132.346 E.01164
G1 X108.313 Y132.346 E.11023
G1 X108.313 Y131.968 E.01164
G1 X104.734 Y131.968 E.11023
G1 X104.734 Y131.59 E.01164
G1 X108.313 Y131.59 E.11023
G1 X108.313 Y131.212 E.01164
G1 X104.734 Y131.212 E.11023
G1 X104.734 Y130.834 E.01164
G1 X108.313 Y130.834 E.11023
G1 X108.313 Y130.456 E.01164
G1 X104.734 Y130.456 E.11023
G1 X104.734 Y130.078 E.01164
G1 X108.313 Y130.078 E.11023
G1 X108.313 Y129.701 E.01164
G1 X104.734 Y129.701 E.11023
G1 X104.734 Y129.323 E.01164
G1 X108.313 Y129.323 E.11023
G1 X108.313 Y128.945 E.01164
G1 X104.734 Y128.945 E.11023
G1 X104.734 Y128.567 E.01164
G1 X108.313 Y128.567 E.11023
G1 X108.313 Y128.189 E.01164
G1 X104.734 Y128.189 E.11023
G1 X104.734 Y127.811 E.01164
G1 X108.313 Y127.811 E.11023
G1 X108.313 Y127.433 E.01164
G1 X104.734 Y127.433 E.11023
G1 X104.734 Y127.055 E.01164
G1 X108.313 Y127.055 E.11023
G1 X108.313 Y126.678 E.01164
G1 X104.734 Y126.678 E.11023
G1 X104.734 Y126.3 E.01164
G1 X108.313 Y126.3 E.11023
G1 X108.313 Y125.922 E.01164
G1 X104.734 Y125.922 E.11023
G1 X104.734 Y125.544 E.01164
G1 X108.313 Y125.544 E.11023
G1 X108.313 Y125.166 E.01164
G1 X104.734 Y125.166 E.11023
G1 X104.734 Y124.788 E.01164
G1 X108.313 Y124.788 E.11023
G1 X108.313 Y124.41 E.01164
G1 X104.734 Y124.41 E.11023
G1 X104.734 Y124.032 E.01164
G1 X108.313 Y124.032 E.11023
G1 X108.313 Y123.655 E.01164
G1 X104.734 Y123.655 E.11023
G1 X104.734 Y123.277 E.01164
G1 X108.313 Y123.277 E.11023
G1 X108.313 Y122.986 E.00895
G1 X108.35 Y122.899 E.00291
G1 X104.734 Y122.899 E.11134
G1 X104.734 Y122.521 E.01164
G1 X108.439 Y122.521 E.11411
G1 X108.093 Y122.303 E.01259
G2 X107.679 Y122.143 I-1.135 J2.315 E.01369
G1 X104.564 Y122.143 E.09592
M106 S198.9
M204 S10000
G1 X108.563 Y122.14 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F10588.235
M204 S6000
G1 X108.499 Y122.177 E.00204
G1 X108.548 Y122.205 E.00155
M204 S10000
G1 X109.359 Y122.158 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X109.825 Y122.158 E.01546
G1 X109.825 Y123.32 E.03855
G1 X109.451 Y123.366 E.01251
G1 X108.706 Y123.854 E.02954
G1 X108.706 Y125.916 E.0684
G1 X109.451 Y125.987 E.02483
G1 X109.825 Y126.216 E.01457
G1 X109.825 Y128.561 E.07779
G1 X109.451 Y128.607 E.01251
G1 X108.706 Y129.095 E.02954
G1 X108.706 Y131.157 E.0684
G1 X109.451 Y131.228 E.02483
G1 X109.825 Y131.457 E.01457
G1 X109.825 Y133.086 E.05401
M204 S10000
G1 X108.568 Y133.792 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F10588.235
M204 S6000
G1 X108.505 Y133.829 E.00204
G1 X108.553 Y133.857 E.00155
; CHANGE_LAYER
; Z_HEIGHT: 11.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F10588.235
G1 X108.505 Y133.829 E-.32873
G1 X108.568 Y133.792 E-.43127
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 58/72
; update layer progress
M73 L58
M991 S0 P57 ;notify layer change
M106 S201.45
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z11.8 I-.013 J1.217 P1  F42000
G1 X146.785 Y134.191 Z11.8
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8096
M204 S6000
G1 X146.785 Y121.809 E.41072
G1 X152.558 Y121.809 E.1915
G1 X152.558 Y134.191 E.41072
G1 X146.845 Y134.191 E.18951
M204 S10000
G1 X146.378 Y134.598 F42000
G1 F8096
M204 S6000
G1 X146.378 Y121.402 E.43772
G1 X152.965 Y121.402 E.2185
G1 X152.965 Y134.598 E.43773
G1 X146.438 Y134.598 E.21652
M204 S250
G1 X145.986 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8096
M204 S5000
G1 X145.986 Y121.208 E.41741
G1 X146.007 Y121.117 E.00284
G3 X146.184 Y121.01 I.184 J.104 E.00664
G1 X153.195 Y121.014 E.21543
G3 X153.336 Y121.116 I-.037 J.199 E.00552
G1 X153.338 Y121.121 E.00017
G3 X153.357 Y121.205 I-.188 J.087 E.00267
G1 X153.358 Y134.789 E.4174
G3 X153.332 Y134.89 I-.212 J.001 E.00324
G1 X153.314 Y134.918 E.00101
G3 X153.153 Y134.99 I-.168 J-.158 E.00555
G1 X146.192 Y134.99 E.2139
G1 X146.093 Y134.968 E.00312
G3 X145.996 Y134.852 I.092 J-.176 E.00476
; WIPE_START
G1 F9547.055
M204 S6000
G1 X145.994 Y132.852 E-.76
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
G1 X152.21 Y133.067 F42000
G1 Z11.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8096
M204 S6000
G1 X152.21 Y131.439 E.05401
G1 X151.79 Y131.265 E.01507
G1 X151.045 Y131.337 E.02484
G1 X151.045 Y128.983 E.07808
G1 X151.79 Y128.644 E.02716
G1 X152.21 Y128.673 E.01396
G1 X152.21 Y126.197 E.08211
G1 X151.79 Y126.023 E.01507
G1 X151.045 Y126.095 E.02484
G1 X151.045 Y123.742 E.07808
G1 X151.79 Y123.403 E.02716
G1 X152.21 Y123.432 E.01395
G1 X152.21 Y122.158 E.04226
G1 X151.856 Y122.158 E.01175
M204 S10000
G1 X150.857 Y122.577 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F8096
M204 S6000
G1 X150.857 Y122.201 E.01155
G1 X147.177 Y122.201 E.11304
G1 X147.177 Y133.799 E.35635
G1 X150.857 Y133.799 E.11304
G1 X150.856 Y133.284 E.01583
G1 X150.698 Y133.099 E.00747
G1 X150.653 Y132.976 E.00402
G1 X150.653 Y123.024 E.30581
G3 X150.857 Y122.716 I.869 J.355 E.0114
G1 X150.857 Y122.637 E.00243
M204 S10000
G1 X150.478 Y122.578 F42000
G1 F8096
M204 S6000
G1 X147.555 Y122.578 E.08983
G1 X147.555 Y133.422 E.33317
G1 X150.478 Y133.422 E.08984
G1 X150.412 Y133.344 E.00313
G1 X150.276 Y132.976 E.01205
G1 X150.276 Y123.024 E.30581
G1 X150.412 Y122.656 E.01205
G1 X150.439 Y122.624 E.00128
M204 S10000
G1 X149.924 Y122.955 F42000
G1 F8096
M204 S6000
G1 X147.932 Y122.956 E.06122
G1 X147.932 Y133.045 E.31
G1 X149.924 Y133.045 E.06122
G1 X149.899 Y132.061 E.03023
G1 X149.903 Y123.012 E.27805
M204 S10000
G1 X149.522 Y123.333 F42000
G1 F8096
M204 S6000
G1 X148.309 Y123.333 E.03728
G1 X148.309 Y132.668 E.28683
G1 X149.522 Y132.668 E.03728
G1 X149.522 Y123.393 E.28499
M204 S10000
G1 X149.124 Y123.73 F42000
; LINE_WIDTH: 0.46098
G1 F8096
M204 S6000
G1 X148.706 Y123.73 E.01424
G1 X148.706 Y132.27 E.29092
G1 X149.124 Y132.27 E.01424
G1 X149.124 Y123.79 E.28888
; OBJECT_ID: 405
; WIPE_START
G1 F8611.204
G1 X149.124 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z12 I-.41 J-1.146 P1  F42000
G1 X125.616 Y134.191 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8096
M204 S6000
G1 X125.616 Y121.809 E.41072
G1 X131.389 Y121.809 E.1915
G1 X131.389 Y134.191 E.41072
G1 X125.676 Y134.191 E.18951
M204 S10000
G1 X125.209 Y134.598 F42000
G1 F8096
M204 S6000
G1 X125.209 Y121.402 E.43772
G1 X131.796 Y121.402 E.2185
G1 X131.796 Y134.598 E.43773
G1 X125.269 Y134.598 E.21652
M204 S250
G1 X124.816 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8096
M204 S5000
G1 X124.816 Y121.208 E.41741
G1 X124.837 Y121.117 E.00284
G3 X125.014 Y121.01 I.184 J.104 E.00664
G1 X132.025 Y121.014 E.21543
G3 X132.166 Y121.116 I-.037 J.199 E.00552
G1 X132.169 Y121.121 E.00017
G3 X132.188 Y121.205 I-.188 J.087 E.00267
G1 X132.188 Y134.789 E.4174
G3 X132.162 Y134.89 I-.212 J.001 E.00324
G1 X132.144 Y134.918 E.00101
G3 X131.984 Y134.99 I-.168 J-.158 E.00555
G1 X125.022 Y134.99 E.2139
G1 X124.923 Y134.968 E.00312
G3 X124.826 Y134.852 I.092 J-.176 E.00476
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.825 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.04 Y133.067 Z12 F42000
G1 Z11.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8096
M204 S6000
G1 X131.04 Y131.439 E.05401
G1 X130.621 Y131.265 E.01507
G1 X129.875 Y131.337 E.02484
G1 X129.875 Y128.983 E.07808
G1 X130.621 Y128.644 E.02716
G1 X131.04 Y128.673 E.01396
G1 X131.04 Y126.197 E.08211
G1 X130.621 Y126.023 E.01507
G1 X129.875 Y126.095 E.02484
G1 X129.875 Y123.742 E.07808
G1 X130.621 Y123.403 E.02716
G1 X131.04 Y123.432 E.01395
G1 X131.04 Y122.158 E.04226
G1 X130.686 Y122.158 E.01175
M204 S10000
G1 X129.687 Y122.577 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F8096
M204 S6000
G1 X129.687 Y122.201 E.01155
G1 X126.008 Y122.201 E.11304
G1 X126.008 Y133.799 E.35635
G1 X129.687 Y133.799 E.11304
G1 X129.687 Y133.284 E.01583
G1 X129.529 Y133.099 E.00747
G1 X129.483 Y132.976 E.00402
G1 X129.483 Y123.024 E.30581
G3 X129.687 Y122.716 I.869 J.355 E.0114
G1 X129.687 Y122.637 E.00243
M204 S10000
G1 X129.308 Y122.578 F42000
G1 F8096
M204 S6000
G1 X126.385 Y122.578 E.08983
G1 X126.385 Y133.422 E.33317
G1 X129.309 Y133.422 E.08984
G1 X129.242 Y133.344 E.00313
G1 X129.106 Y132.976 E.01205
G1 X129.106 Y123.024 E.30581
G1 X129.242 Y122.656 E.01205
G1 X129.269 Y122.624 E.00128
M204 S10000
G1 X128.754 Y122.955 F42000
G1 F8096
M204 S6000
G1 X126.762 Y122.956 E.06122
G1 X126.762 Y133.045 E.31
G1 X128.754 Y133.045 E.06122
G1 X128.729 Y132.061 E.03023
G1 X128.734 Y123.012 E.27805
M204 S10000
G1 X128.352 Y123.333 F42000
G1 F8096
M204 S6000
G1 X127.139 Y123.333 E.03728
G1 X127.139 Y132.668 E.28683
G1 X128.352 Y132.668 E.03728
G1 X128.352 Y123.393 E.28499
M204 S10000
G1 X127.955 Y123.73 F42000
; LINE_WIDTH: 0.46098
G1 F8096
M204 S6000
G1 X127.536 Y123.73 E.01424
G1 X127.536 Y132.27 E.29092
G1 X127.955 Y132.27 E.01424
G1 X127.955 Y123.79 E.28888
; OBJECT_ID: 394
; WIPE_START
G1 F8611.204
G1 X127.955 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z12 I-.41 J-1.146 P1  F42000
G1 X104.446 Y134.191 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8096
M204 S6000
G1 X104.446 Y121.809 E.41072
G1 X110.219 Y121.809 E.1915
G1 X110.219 Y134.191 E.41072
G1 X104.506 Y134.191 E.18951
M204 S10000
G1 X104.039 Y134.598 F42000
G1 F8096
M204 S6000
G1 X104.039 Y121.402 E.43772
G1 X110.626 Y121.402 E.2185
M73 P84 R3
G1 X110.626 Y134.598 E.43773
G1 X104.099 Y134.598 E.21652
M204 S250
G1 X103.647 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8096
M204 S5000
G1 X103.647 Y121.208 E.41741
G1 X103.667 Y121.117 E.00284
G3 X103.844 Y121.01 I.184 J.104 E.00664
G1 X110.855 Y121.014 E.21543
G3 X110.996 Y121.116 I-.037 J.199 E.00552
G1 X110.999 Y121.121 E.00017
G3 X111.018 Y121.205 I-.188 J.087 E.00267
G1 X111.018 Y134.789 E.4174
G3 X110.993 Y134.89 I-.212 J.001 E.00324
G1 X110.974 Y134.918 E.00101
G3 X110.814 Y134.99 I-.168 J-.158 E.00555
G1 X103.853 Y134.99 E.2139
G1 X103.754 Y134.968 E.00312
G3 X103.656 Y134.852 I.092 J-.176 E.00476
; WIPE_START
G1 F9547.055
M204 S6000
G1 X103.655 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.871 Y133.067 Z12 F42000
G1 Z11.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8096
M204 S6000
G1 X109.871 Y131.439 E.05401
G1 X109.451 Y131.265 E.01507
G1 X108.706 Y131.337 E.02484
G1 X108.706 Y128.983 E.07808
G1 X109.451 Y128.644 E.02716
G1 X109.871 Y128.673 E.01396
G1 X109.871 Y126.197 E.08211
G1 X109.451 Y126.023 E.01507
G1 X108.706 Y126.095 E.02484
G1 X108.706 Y123.742 E.07808
G1 X109.451 Y123.403 E.02716
G1 X109.871 Y123.432 E.01395
G1 X109.871 Y122.158 E.04226
G1 X109.516 Y122.158 E.01175
M204 S10000
G1 X108.517 Y122.577 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F8096
M204 S6000
G1 X108.517 Y122.201 E.01155
G1 X104.838 Y122.201 E.11304
G1 X104.838 Y133.799 E.35635
G1 X108.517 Y133.799 E.11304
G1 X108.517 Y133.284 E.01583
G1 X108.359 Y133.099 E.00747
G1 X108.314 Y132.976 E.00402
G1 X108.314 Y123.024 E.30581
G3 X108.517 Y122.716 I.869 J.355 E.0114
G1 X108.517 Y122.637 E.00243
M204 S10000
G1 X108.139 Y122.578 F42000
G1 F8096
M204 S6000
G1 X105.215 Y122.578 E.08983
G1 X105.215 Y133.422 E.33317
G1 X108.139 Y133.422 E.08984
G1 X108.073 Y133.344 E.00313
G1 X107.936 Y132.976 E.01205
G1 X107.936 Y123.024 E.30581
G1 X108.073 Y122.656 E.01205
G1 X108.1 Y122.624 E.00128
M204 S10000
G1 X107.585 Y122.955 F42000
G1 F8096
M204 S6000
G1 X105.592 Y122.956 E.06122
G1 X105.592 Y133.045 E.31
G1 X107.585 Y133.045 E.06122
G1 X107.559 Y132.061 E.03023
G1 X107.564 Y123.012 E.27805
M204 S10000
G1 X107.182 Y123.333 F42000
G1 F8096
M204 S6000
G1 X105.969 Y123.333 E.03728
G1 X105.969 Y132.668 E.28683
G1 X107.182 Y132.668 E.03728
G1 X107.182 Y123.393 E.28499
M204 S10000
G1 X106.785 Y123.73 F42000
; LINE_WIDTH: 0.46098
G1 F8096
M204 S6000
G1 X106.367 Y123.73 E.01424
G1 X106.367 Y132.27 E.29092
G1 X106.785 Y132.27 E.01424
G1 X106.785 Y123.79 E.28888
; CHANGE_LAYER
; Z_HEIGHT: 11.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8611.204
G1 X106.785 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 59/72
; update layer progress
M73 L59
M991 S0 P58 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z12 I-.25 J1.191 P1  F42000
G1 X146.831 Y134.191 Z12
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8099
M204 S6000
G1 X146.831 Y121.809 E.41072
G1 X152.604 Y121.809 E.19149
G1 X152.604 Y134.19 E.41071
G1 X146.891 Y134.191 E.1895
M204 S10000
G1 X146.424 Y134.598 F42000
G1 F8099
M204 S6000
G1 X146.424 Y121.402 E.43772
G1 X153.011 Y121.402 E.21849
G1 X153.011 Y134.597 E.43771
G1 X146.484 Y134.598 E.21651
M204 S250
G1 X146.032 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8099
M204 S5000
G1 X146.042 Y121.141 E.41947
G3 X146.228 Y121.01 I.189 J.071 E.00742
G1 X153.24 Y121.014 E.21546
G3 X153.38 Y121.116 I-.035 J.195 E.0055
G1 X153.397 Y121.158 E.00138
G1 X153.398 Y134.839 E.42039
G1 X153.382 Y134.882 E.00141
G3 X153.21 Y134.99 I-.187 J-.108 E.00648
G1 X146.238 Y134.99 E.21425
G1 X146.139 Y134.968 E.00312
G3 X146.041 Y134.852 I.093 J-.177 E.00476
; WIPE_START
G1 F9547.055
M204 S6000
G1 X146.042 Y132.852 E-.76
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
G1 X150.857 Y133.423 F42000
G1 Z11.8
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F8099
M204 S6000
G1 X150.857 Y133.284 E.00427
G1 X150.698 Y133.099 E.00747
G1 X150.653 Y132.976 E.00402
G1 X150.653 Y123.024 E.30581
G3 X150.857 Y122.716 I.869 J.355 E.0114
G1 X150.857 Y122.201 E.01583
G1 X147.223 Y122.201 E.11164
G1 X147.223 Y133.799 E.35634
G1 X150.857 Y133.798 E.11164
G1 X150.857 Y133.483 E.00971
M204 S10000
G1 X150.478 Y133.421 F42000
G1 F8099
M204 S6000
G1 X150.412 Y133.344 E.00312
G1 X150.276 Y132.976 E.01205
G1 X150.276 Y123.024 E.30581
G1 X150.412 Y122.656 E.01205
G1 X150.478 Y122.578 E.00313
G1 X147.6 Y122.578 E.08843
G1 X147.6 Y133.422 E.33317
G1 X150.418 Y133.421 E.08659
M204 S10000
G1 X149.924 Y133.044 F42000
G1 F8099
M204 S6000
G1 X149.899 Y132.084 E.02953
G1 X149.899 Y123.024 E.27838
G1 X149.924 Y122.955 E.00223
G1 X147.977 Y122.956 E.05982
G1 X147.977 Y133.045 E.31
G1 X149.864 Y133.044 E.05798
M204 S10000
G1 X149.522 Y132.667 F42000
G1 F8099
M204 S6000
G1 X149.522 Y123.333 E.28682
G1 X148.354 Y123.333 E.03588
G1 X148.354 Y132.667 E.28683
G1 X149.462 Y132.667 E.03403
M204 S10000
G1 X149.136 Y132.281 F42000
; LINE_WIDTH: 0.43818
G1 F8099
M204 S6000
G1 X149.136 Y123.719 E.27579
G1 X148.74 Y123.719 E.01273
G1 X148.74 Y132.281 E.27579
G1 X149.076 Y132.281 E.0108
M204 S10000
G1 X151.183 Y133.064 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8099
M204 S6000
G1 X151.045 Y132.926 E.00647
G1 X151.045 Y131.493 E.04755
G1 X151.135 Y131.422 E.0038
G1 X151.79 Y131.276 E.02227
G1 X152.255 Y131.385 E.01584
G1 X152.255 Y128.77 E.08674
G1 X151.79 Y128.655 E.01589
G1 X151.135 Y128.793 E.02221
G1 X151.045 Y128.863 E.00379
G1 X151.045 Y126.251 E.08663
G1 X151.135 Y126.18 E.0038
G1 X151.79 Y126.035 E.02226
G1 X152.255 Y126.144 E.01584
G1 X152.255 Y123.529 E.08674
G1 X151.79 Y123.414 E.01589
G1 X151.135 Y123.552 E.02221
G1 X151.045 Y123.622 E.00379
G1 X151.045 Y123.074 E.01818
G1 X151.249 Y122.87 E.00954
G1 X151.249 Y122.158 E.02365
G1 X151.328 Y122.158 E.00265
; OBJECT_ID: 405
; WIPE_START
G1 F8843.478
G1 X151.249 Y122.158 E-.03031
G1 X151.249 Y122.87 E-.27089
G1 X151.045 Y123.074 E-.10933
G1 X151.045 Y123.622 E-.20824
G1 X151.135 Y123.552 E-.04339
G1 X151.387 Y123.499 E-.09785
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X144.339 Y126.428 Z12.2 F42000
G1 X125.661 Y134.191 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8099
M204 S6000
G1 X125.661 Y121.809 E.41072
G1 X131.434 Y121.809 E.19149
G1 X131.434 Y134.19 E.41071
G1 X125.721 Y134.191 E.1895
M204 S10000
G1 X125.254 Y134.598 F42000
G1 F8099
M204 S6000
G1 X125.254 Y121.402 E.43772
G1 X131.841 Y121.402 E.21849
G1 X131.841 Y134.597 E.43771
G1 X125.314 Y134.598 E.21651
M204 S250
G1 X124.862 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8099
M204 S5000
G1 X124.872 Y121.141 E.41947
G3 X125.058 Y121.01 I.189 J.071 E.00742
G1 X132.07 Y121.014 E.21546
G3 X132.21 Y121.116 I-.035 J.195 E.0055
G1 X132.227 Y121.158 E.00138
G1 X132.228 Y134.839 E.42039
G1 X132.212 Y134.882 E.00141
G3 X132.041 Y134.99 I-.187 J-.108 E.00648
G1 X125.068 Y134.99 E.21425
G1 X124.969 Y134.968 E.00312
G3 X124.872 Y134.852 I.093 J-.177 E.00476
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.872 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.687 Y133.423 Z12.2 F42000
G1 Z11.8
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F8099
M204 S6000
G1 X129.687 Y133.284 E.00427
G1 X129.529 Y133.099 E.00747
G1 X129.483 Y132.976 E.00402
G1 X129.483 Y123.024 E.30581
G3 X129.687 Y122.716 I.869 J.355 E.0114
G1 X129.687 Y122.201 E.01583
G1 X126.053 Y122.201 E.11164
G1 X126.053 Y133.799 E.35634
G1 X129.687 Y133.798 E.11164
G1 X129.687 Y133.483 E.00971
M204 S10000
G1 X129.308 Y133.421 F42000
G1 F8099
M204 S6000
G1 X129.242 Y133.344 E.00312
G1 X129.106 Y132.976 E.01205
G1 X129.106 Y123.024 E.30581
G1 X129.242 Y122.656 E.01205
G1 X129.308 Y122.578 E.00313
G1 X126.43 Y122.578 E.08843
G1 X126.43 Y133.422 E.33317
G1 X129.248 Y133.421 E.08659
M204 S10000
G1 X128.754 Y133.044 F42000
G1 F8099
M204 S6000
G1 X128.729 Y132.084 E.02953
G1 X128.729 Y123.024 E.27838
G1 X128.754 Y122.955 E.00223
G1 X126.807 Y122.956 E.05982
G1 X126.807 Y133.045 E.31
G1 X128.694 Y133.044 E.05798
M204 S10000
G1 X128.352 Y132.667 F42000
G1 F8099
M204 S6000
G1 X128.352 Y123.333 E.28682
G1 X127.185 Y123.333 E.03588
G1 X127.185 Y132.667 E.28683
G1 X128.292 Y132.667 E.03403
M204 S10000
G1 X127.966 Y132.281 F42000
; LINE_WIDTH: 0.43818
G1 F8099
M204 S6000
G1 X127.966 Y123.719 E.27579
G1 X127.571 Y123.719 E.01273
G1 X127.571 Y132.281 E.27579
G1 X127.906 Y132.281 E.0108
M204 S10000
G1 X130.013 Y133.064 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8099
M204 S6000
G1 X129.875 Y132.926 E.00647
G1 X129.875 Y131.493 E.04755
G1 X129.965 Y131.422 E.0038
G1 X130.621 Y131.276 E.02227
G1 X131.086 Y131.385 E.01584
G1 X131.086 Y128.77 E.08674
G1 X130.621 Y128.655 E.01589
G1 X129.965 Y128.793 E.02221
G1 X129.875 Y128.863 E.00379
G1 X129.875 Y126.251 E.08663
G1 X129.965 Y126.18 E.0038
G1 X130.621 Y126.035 E.02226
G1 X131.086 Y126.144 E.01584
G1 X131.086 Y123.529 E.08674
G1 X130.621 Y123.414 E.01589
G1 X129.965 Y123.552 E.02221
G1 X129.875 Y123.622 E.00379
G1 X129.875 Y123.074 E.01818
G1 X130.079 Y122.87 E.00954
G1 X130.079 Y122.158 E.02365
G1 X130.159 Y122.158 E.00265
; OBJECT_ID: 394
; WIPE_START
G1 F8843.478
G1 X130.079 Y122.158 E-.03031
G1 X130.079 Y122.87 E-.27089
G1 X129.875 Y123.074 E-.10933
G1 X129.875 Y123.622 E-.20824
G1 X129.965 Y123.552 E-.04339
G1 X130.217 Y123.499 E-.09785
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X123.169 Y126.428 Z12.2 F42000
G1 X104.491 Y134.191 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8099
M204 S6000
G1 X104.491 Y121.809 E.41072
G1 X110.264 Y121.809 E.19149
G1 X110.264 Y134.19 E.41071
G1 X104.551 Y134.191 E.1895
M204 S10000
G1 X104.084 Y134.598 F42000
G1 F8099
M204 S6000
G1 X104.084 Y121.402 E.43772
G1 X110.671 Y121.402 E.21849
G1 X110.671 Y134.597 E.43771
G1 X104.144 Y134.598 E.21651
M204 S250
G1 X103.692 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8099
M204 S5000
G1 X103.703 Y121.141 E.41947
G3 X103.889 Y121.01 I.189 J.071 E.00742
G1 X110.901 Y121.014 E.21546
G3 X111.041 Y121.116 I-.035 J.195 E.0055
G1 X111.057 Y121.158 E.00138
G1 X111.058 Y134.839 E.42039
G1 X111.043 Y134.882 E.00141
G3 X110.871 Y134.99 I-.187 J-.108 E.00648
G1 X103.898 Y134.99 E.21425
G1 X103.799 Y134.968 E.00312
G3 X103.702 Y134.852 I.093 J-.177 E.00476
; WIPE_START
G1 F9547.055
M204 S6000
G1 X103.702 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.517 Y133.423 Z12.2 F42000
G1 Z11.8
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F8099
M204 S6000
G1 X108.517 Y133.284 E.00427
G1 X108.359 Y133.099 E.00747
G1 X108.314 Y132.976 E.00402
G1 X108.314 Y123.024 E.30581
G3 X108.517 Y122.716 I.869 J.355 E.0114
G1 X108.517 Y122.201 E.01583
G1 X104.884 Y122.201 E.11164
M73 P85 R3
G1 X104.884 Y133.799 E.35634
G1 X108.517 Y133.798 E.11164
G1 X108.517 Y133.483 E.00971
M204 S10000
G1 X108.139 Y133.421 F42000
G1 F8099
M204 S6000
G1 X108.073 Y133.344 E.00312
G1 X107.936 Y132.976 E.01205
G1 X107.936 Y123.024 E.30581
G1 X108.073 Y122.656 E.01205
G1 X108.139 Y122.578 E.00313
G1 X105.261 Y122.578 E.08843
G1 X105.261 Y133.422 E.33317
G1 X108.079 Y133.421 E.08659
M204 S10000
G1 X107.585 Y133.044 F42000
G1 F8099
M204 S6000
G1 X107.559 Y132.084 E.02953
G1 X107.559 Y123.024 E.27838
G1 X107.585 Y122.955 E.00223
G1 X105.638 Y122.956 E.05982
G1 X105.638 Y133.045 E.31
G1 X107.525 Y133.044 E.05798
M204 S10000
G1 X107.182 Y132.667 F42000
G1 F8099
M204 S6000
G1 X107.182 Y123.333 E.28682
G1 X106.015 Y123.333 E.03588
G1 X106.015 Y132.667 E.28683
G1 X107.122 Y132.667 E.03403
M204 S10000
G1 X106.796 Y132.281 F42000
; LINE_WIDTH: 0.43818
G1 F8099
M204 S6000
G1 X106.796 Y123.719 E.27579
G1 X106.401 Y123.719 E.01273
G1 X106.401 Y132.281 E.27579
G1 X106.736 Y132.281 E.0108
M204 S10000
G1 X108.843 Y133.064 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8099
M204 S6000
G1 X108.706 Y132.926 E.00647
G1 X108.706 Y131.493 E.04755
G1 X108.796 Y131.422 E.0038
G1 X109.451 Y131.276 E.02227
G1 X109.916 Y131.385 E.01584
G1 X109.916 Y128.77 E.08674
G1 X109.451 Y128.655 E.01589
G1 X108.796 Y128.793 E.02221
G1 X108.706 Y128.863 E.00379
G1 X108.706 Y126.251 E.08663
G1 X108.796 Y126.18 E.0038
G1 X109.451 Y126.035 E.02226
G1 X109.916 Y126.144 E.01584
G1 X109.916 Y123.529 E.08674
G1 X109.451 Y123.414 E.01589
G1 X108.796 Y123.552 E.02221
G1 X108.706 Y123.622 E.00379
G1 X108.706 Y123.074 E.01818
G1 X108.909 Y122.87 E.00954
G1 X108.909 Y122.158 E.02365
G1 X108.989 Y122.158 E.00265
; CHANGE_LAYER
; Z_HEIGHT: 12
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X108.909 Y122.158 E-.03031
G1 X108.909 Y122.87 E-.27089
G1 X108.706 Y123.074 E-.10933
G1 X108.706 Y123.622 E-.20824
G1 X108.796 Y123.552 E-.04339
G1 X109.048 Y123.499 E-.09785
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 60/72
; update layer progress
M73 L60
M991 S0 P59 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z12.2 I-.331 J1.171 P1  F42000
G1 X146.877 Y134.191 Z12.2
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X146.877 Y121.809 E.41071
G1 X152.651 Y121.81 E.19153
G1 X152.651 Y134.191 E.41071
G1 X146.937 Y134.191 E.18955
M204 S10000
G1 X146.47 Y134.598 F42000
G1 F8843.478
M204 S6000
G1 X146.47 Y121.402 E.43772
G1 X153.058 Y121.402 E.21854
G1 X153.058 Y134.598 E.43772
G1 X146.53 Y134.598 E.21656
M204 S250
G1 X146.077 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X146.088 Y121.141 E.41947
G3 X146.274 Y121.01 I.189 J.071 E.00742
G1 X153.252 Y121.01 E.21443
G3 X153.427 Y121.121 I-.003 J.199 E.00668
G3 X153.445 Y121.17 I-.122 J.073 E.00162
G1 X153.45 Y134.134 E.39834
G3 X153.445 Y134.83 I-5.47 J.312 E.02143
G1 X153.43 Y134.876 E.00148
G3 X153.24 Y134.99 I-.185 J-.094 E.00716
G1 X146.283 Y134.99 E.21378
G1 X146.184 Y134.967 E.00313
G3 X146.087 Y134.852 I.093 J-.177 E.00474
; WIPE_START
M204 S6000
G1 X146.087 Y132.852 E-.76
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
G1 X147.269 Y133.799 F42000
G1 Z12
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X147.269 Y122.202 E.35634
G1 X151.045 Y122.202 E.11603
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G1 X152.258 Y122.202 E.03728
G1 X152.259 Y133.799 E.35634
G1 X151.045 Y133.799 E.03729
; Slow Down End
G1 F9547.299
G1 X147.329 Y133.799 E.11419
M204 S10000
G1 X147.646 Y133.422 F42000
G1 F9547.299
M204 S6000
G1 X147.646 Y122.579 E.33317
G1 X151.045 Y122.579 E.10445
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G1 X151.881 Y122.579 E.0257
G1 X151.882 Y133.422 E.33317
G1 X151.045 Y133.422 E.0257
; Slow Down End
G1 F9547.299
G1 X147.706 Y133.422 E.10261
M204 S10000
G1 X148.023 Y122.956 F42000
G1 F9547.299
M204 S6000
G1 X148.023 Y133.045 E.31
G1 X151.505 Y133.045 E.10698
G1 X151.504 Y122.956 E.31
G1 X148.083 Y122.956 E.10513
M204 S10000
G1 X151.127 Y123.333 F42000
G1 F9547.299
M204 S6000
G1 X148.4 Y123.333 E.0838
G1 X148.4 Y132.668 E.28683
G1 X151.127 Y132.668 E.08381
G1 X151.127 Y123.393 E.28498
M204 S10000
G1 X150.75 Y123.71 F42000
G1 F9547.299
M204 S6000
G1 X148.777 Y123.71 E.06063
G1 X148.777 Y132.291 E.26365
G1 X150.75 Y132.291 E.06064
G1 X150.75 Y123.77 E.26181
M204 S10000
G1 X150.373 Y124.087 F42000
G1 F9547.299
M204 S6000
G1 X149.154 Y124.087 E.03746
G1 X149.154 Y131.913 E.24048
G1 X150.373 Y131.913 E.03746
G1 X150.373 Y124.147 E.23864
M204 S10000
G1 X149.974 Y124.486 F42000
; LINE_WIDTH: 0.46398
G1 F8549.865
M204 S6000
G1 X149.553 Y124.486 E.01445
G1 X149.553 Y131.514 E.24115
G1 X149.974 Y131.514 E.01445
G1 X149.974 Y124.546 E.23909
; OBJECT_ID: 405
; WIPE_START
G1 X149.974 Y126.546 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X142.694 Y128.839 Z12.4 F42000
G1 X125.707 Y134.191 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X125.707 Y121.809 E.41071
G1 X131.481 Y121.81 E.19153
G1 X131.481 Y134.191 E.41071
G1 X125.767 Y134.191 E.18955
M204 S10000
G1 X125.3 Y134.598 F42000
G1 F8843.478
M204 S6000
G1 X125.3 Y121.402 E.43772
G1 X131.888 Y121.402 E.21854
G1 X131.888 Y134.598 E.43772
G1 X125.36 Y134.598 E.21656
M204 S250
G1 X124.908 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X124.918 Y121.141 E.41947
G3 X125.104 Y121.01 I.189 J.071 E.00742
G1 X132.082 Y121.01 E.21443
G3 X132.257 Y121.121 I-.003 J.199 E.00668
G3 X132.275 Y121.17 I-.122 J.073 E.00162
G1 X132.28 Y134.134 E.39834
G3 X132.275 Y134.83 I-5.47 J.312 E.02143
G1 X132.26 Y134.876 E.00148
G3 X132.071 Y134.99 I-.185 J-.094 E.00716
G1 X125.114 Y134.99 E.21378
G1 X125.014 Y134.967 E.00313
G3 X124.917 Y134.852 I.093 J-.177 E.00474
; WIPE_START
M204 S6000
G1 X124.917 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.759 Y125.266 Z12.4 F42000
G1 X126.099 Y122.202 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X126.099 Y133.799 E.35634
G1 X131.089 Y133.799 E.15332
G1 X131.089 Y122.202 E.35634
G1 X126.159 Y122.202 E.15148
M204 S10000
G1 X126.476 Y122.579 F42000
G1 F9547.299
M204 S6000
G1 X126.476 Y133.422 E.33317
G1 X130.712 Y133.422 E.13015
G1 X130.712 Y122.579 E.33317
G1 X126.536 Y122.579 E.1283
M204 S10000
G1 X126.853 Y122.956 F42000
G1 F9547.299
M204 S6000
G1 X126.853 Y133.045 E.31
G1 X130.335 Y133.045 E.10698
G1 X130.335 Y122.956 E.31
G1 X126.913 Y122.956 E.10513
M204 S10000
G1 X129.958 Y123.333 F42000
G1 F9547.299
M204 S6000
G1 X127.23 Y123.333 E.0838
G1 X127.23 Y132.668 E.28683
G1 X129.958 Y132.668 E.08381
G1 X129.958 Y123.393 E.28498
M204 S10000
G1 X129.58 Y123.71 F42000
G1 F9547.299
M204 S6000
G1 X127.607 Y123.71 E.06063
G1 X127.607 Y132.291 E.26365
G1 X129.581 Y132.291 E.06064
G1 X129.58 Y123.77 E.26181
M204 S10000
G1 X129.203 Y124.087 F42000
G1 F9547.299
M204 S6000
G1 X127.984 Y124.087 E.03746
G1 X127.984 Y131.913 E.24048
G1 X129.204 Y131.913 E.03746
G1 X129.203 Y124.147 E.23864
M204 S10000
G1 X128.804 Y124.486 F42000
; LINE_WIDTH: 0.46398
G1 F8549.865
M204 S6000
G1 X128.383 Y124.486 E.01445
G1 X128.383 Y131.514 E.24115
G1 X128.804 Y131.514 E.01445
G1 X128.804 Y124.546 E.23909
; OBJECT_ID: 394
; WIPE_START
G1 X128.804 Y126.546 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X121.525 Y128.839 Z12.4 F42000
G1 X104.537 Y134.191 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X104.537 Y121.809 E.41071
G1 X110.311 Y121.81 E.19153
G1 X110.311 Y134.191 E.41071
G1 X104.597 Y134.191 E.18955
M204 S10000
G1 X104.13 Y134.598 F42000
G1 F8843.478
M204 S6000
G1 X104.13 Y121.402 E.43772
G1 X110.718 Y121.402 E.21854
G1 X110.718 Y134.598 E.43772
G1 X104.19 Y134.598 E.21656
M204 S250
G1 X103.738 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X103.748 Y121.141 E.41947
G3 X103.934 Y121.01 I.189 J.071 E.00742
G1 X110.913 Y121.01 E.21443
G3 X111.088 Y121.121 I-.003 J.199 E.00668
G3 X111.106 Y121.17 I-.122 J.073 E.00162
G1 X111.11 Y134.134 E.39834
G3 X111.106 Y134.83 I-5.47 J.312 E.02143
G1 X111.09 Y134.876 E.00148
G3 X110.901 Y134.99 I-.185 J-.094 E.00716
G1 X103.944 Y134.99 E.21378
G1 X103.844 Y134.967 E.00313
G3 X103.748 Y134.852 I.093 J-.177 E.00474
; WIPE_START
M204 S6000
G1 X103.748 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.589 Y125.266 Z12.4 F42000
G1 X104.929 Y122.202 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X104.929 Y133.799 E.35634
G1 X109.919 Y133.799 E.15332
G1 X109.919 Y122.202 E.35634
G1 X104.989 Y122.202 E.15148
M204 S10000
G1 X105.306 Y122.579 F42000
G1 F9547.299
M204 S6000
G1 X105.306 Y133.422 E.33317
G1 X109.542 Y133.422 E.13015
G1 X109.542 Y122.579 E.33317
G1 X105.366 Y122.579 E.1283
M204 S10000
G1 X105.683 Y122.956 F42000
G1 F9547.299
M204 S6000
G1 X105.683 Y133.045 E.31
G1 X109.165 Y133.045 E.10698
G1 X109.165 Y122.956 E.31
G1 X105.743 Y122.956 E.10513
M204 S10000
G1 X108.788 Y123.333 F42000
G1 F9547.299
M204 S6000
G1 X106.06 Y123.333 E.0838
G1 X106.06 Y132.668 E.28683
G1 X108.788 Y132.668 E.08381
G1 X108.788 Y123.393 E.28498
M204 S10000
G1 X108.411 Y123.71 F42000
G1 F9547.299
M204 S6000
G1 X106.437 Y123.71 E.06063
G1 X106.437 Y132.291 E.26365
G1 X108.411 Y132.291 E.06064
G1 X108.411 Y123.77 E.26181
M204 S10000
G1 X108.034 Y124.087 F42000
G1 F9547.299
M204 S6000
G1 X106.815 Y124.087 E.03746
G1 X106.815 Y131.913 E.24048
G1 X108.034 Y131.913 E.03746
G1 X108.034 Y124.147 E.23864
M204 S10000
G1 X107.635 Y124.486 F42000
; LINE_WIDTH: 0.46398
G1 F8549.865
M204 S6000
G1 X107.214 Y124.486 E.01445
G1 X107.214 Y131.514 E.24115
G1 X107.635 Y131.514 E.01445
G1 X107.635 Y124.546 E.23909
; CHANGE_LAYER
; Z_HEIGHT: 12.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8549.865
G1 X107.635 Y126.546 E-.76
; WIPE_END
M73 P86 R3
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 61/72
; update layer progress
M73 L61
M991 S0 P60 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z12.4 I-.232 J1.195 P1  F42000
G1 X146.922 Y134.191 Z12.4
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X146.922 Y121.809 E.41072
G1 X152.702 Y121.809 E.19172
G1 X152.701 Y134.191 E.41072
G1 X146.982 Y134.191 E.18972
M204 S10000
G1 X146.515 Y134.598 F42000
G1 F8843.478
M204 S6000
G1 X146.515 Y121.402 E.43772
G1 X153.109 Y121.41 E.21872
G1 X153.108 Y134.586 E.43709
G3 X152.632 Y134.598 I-.424 J-7.391 E.0158
G1 X146.575 Y134.598 E.20093
M204 S250
G1 X146.123 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9299
M204 S5000
G1 X146.13 Y121.15 E.41918
G3 X146.319 Y121.01 I.191 J.06 E.00771
G1 X153.003 Y121.016 E.20538
G3 X153.365 Y121.05 I.1 J.871 E.01125
G1 X153.386 Y121.062 E.00073
G3 X153.491 Y121.22 I-.172 J.227 E.00595
G1 X153.492 Y121.226 E.00019
G1 X153.498 Y121.262 E.00112
G3 X153.501 Y122.075 I-27.734 J.512 E.02499
G1 X153.501 Y134.087 E.36909
G3 X153.498 Y134.735 I-6.872 J.3 E.01992
G1 X153.492 Y134.774 E.00122
G1 X153.491 Y134.78 E.00019
G3 X153.294 Y134.97 I-.228 J-.039 E.009
G3 X152.635 Y134.99 I-.64 J-10.231 E.02025
G1 X146.334 Y134.99 E.19361
G3 X146.133 Y134.852 I-.011 J-.2 E.00808
; WIPE_START
G1 F9547.055
M204 S6000
G1 X146.132 Y132.852 E-.76
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
G1 X149.6 Y131.301 F42000
G1 Z12.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.466635
G1 F8496.289
M204 S6000
G1 X149.6 Y131.513 E.00731
G1 X150.024 Y131.513 E.01463
G1 X150.024 Y124.487 E.24259
G1 X149.6 Y124.487 E.01463
G1 X149.6 Y131.241 E.2332
M204 S10000
G1 X150.424 Y124.699 F42000
; LINE_WIDTH: 0.41999
G1 F9299
M204 S6000
G1 X150.424 Y124.087 E.01881
G1 X149.2 Y124.087 E.03763
G1 X149.2 Y131.913 E.24049
G1 X150.424 Y131.913 E.03762
G1 X150.424 Y124.759 E.21983
M204 S10000
G1 X150.801 Y124.699 F42000
G1 F9299
M204 S6000
G1 X150.801 Y123.71 E.0304
G1 X148.823 Y123.71 E.0608
G1 X148.823 Y132.291 E.26366
G1 X150.801 Y132.291 E.06079
G1 X150.801 Y124.759 E.23142
M204 S10000
G1 X151.178 Y124.699 F42000
G1 F9299
M204 S6000
G1 X151.178 Y123.333 E.04199
G1 X148.445 Y123.333 E.08397
G1 X148.445 Y132.668 E.28683
G1 X151.178 Y132.668 E.08396
G1 X151.178 Y124.759 E.243
M204 S10000
G1 X151.555 Y124.699 F42000
G1 F9299
M204 S6000
G1 X151.555 Y122.955 E.05358
G1 X148.068 Y122.956 E.10714
G1 X148.068 Y133.045 E.31
G1 X151.555 Y133.045 E.10714
G1 X151.555 Y124.759 E.25459
M204 S10000
G1 X151.932 Y124.699 F42000
G1 F9299
M204 S6000
G1 X151.933 Y122.578 E.06516
G1 X147.691 Y122.579 E.13032
G1 X147.691 Y133.422 E.33317
G1 X151.932 Y133.422 E.13031
G1 X151.932 Y124.759 E.26617
M204 S10000
G1 X152.31 Y124.699 F42000
G1 F9299
M204 S6000
G1 X152.31 Y122.201 E.07675
G1 X147.314 Y122.201 E.15349
G1 X147.314 Y133.799 E.35634
G1 X152.309 Y133.799 E.15348
G1 X152.31 Y124.759 E.27776
; OBJECT_ID: 405
; WIPE_START
G1 F9547.299
G1 X152.309 Y126.759 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X144.959 Y128.816 Z12.6 F42000
G1 X125.752 Y134.191 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X125.752 Y121.809 E.41072
G1 X131.532 Y121.809 E.19172
G1 X131.532 Y134.191 E.41072
G1 X125.812 Y134.191 E.18972
M204 S10000
G1 X125.345 Y134.598 F42000
G1 F8843.478
M204 S6000
G1 X125.345 Y121.402 E.43772
G1 X131.939 Y121.41 E.21872
G1 X131.939 Y134.586 E.43709
G3 X131.463 Y134.598 I-.424 J-7.391 E.0158
G1 X125.405 Y134.598 E.20093
M204 S250
G1 X124.953 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9299
M204 S5000
M73 P86 R2
G1 X124.961 Y121.15 E.41918
G3 X125.149 Y121.01 I.191 J.06 E.00771
G1 X131.833 Y121.016 E.20538
G3 X132.195 Y121.05 I.1 J.871 E.01125
G1 X132.216 Y121.062 E.00073
G3 X132.321 Y121.22 I-.172 J.227 E.00595
G1 X132.323 Y121.226 E.00019
G1 X132.328 Y121.262 E.00112
G3 X132.331 Y122.075 I-27.734 J.512 E.02499
G1 X132.331 Y134.087 E.36909
G3 X132.328 Y134.735 I-6.872 J.3 E.01992
G1 X132.323 Y134.774 E.00122
G1 X132.321 Y134.78 E.00019
G3 X132.124 Y134.97 I-.228 J-.039 E.009
G3 X131.465 Y134.99 I-.64 J-10.231 E.02025
G1 X125.165 Y134.99 E.19361
G3 X124.963 Y134.852 I-.011 J-.2 E.00808
; WIPE_START
G1 F9547.055
M204 S6000
G1 X124.963 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.43 Y131.301 Z12.6 F42000
G1 Z12.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.466635
G1 F8496.289
M204 S6000
G1 X128.43 Y131.513 E.00731
G1 X128.854 Y131.513 E.01463
G1 X128.854 Y124.487 E.24259
G1 X128.43 Y124.487 E.01463
G1 X128.43 Y131.241 E.2332
M204 S10000
G1 X129.254 Y124.699 F42000
; LINE_WIDTH: 0.41999
G1 F9299
M204 S6000
G1 X129.254 Y124.087 E.01881
G1 X128.03 Y124.087 E.03763
G1 X128.03 Y131.913 E.24049
G1 X129.254 Y131.913 E.03762
G1 X129.254 Y124.759 E.21983
M204 S10000
G1 X129.632 Y124.699 F42000
G1 F9299
M204 S6000
G1 X129.632 Y123.71 E.0304
G1 X127.653 Y123.71 E.0608
G1 X127.653 Y132.291 E.26366
G1 X129.631 Y132.291 E.06079
G1 X129.632 Y124.759 E.23142
M204 S10000
G1 X130.009 Y124.699 F42000
G1 F9299
M204 S6000
G1 X130.009 Y123.333 E.04199
G1 X127.276 Y123.333 E.08397
G1 X127.276 Y132.668 E.28683
G1 X130.008 Y132.668 E.08396
G1 X130.009 Y124.759 E.243
M204 S10000
G1 X130.386 Y124.699 F42000
G1 F9299
M204 S6000
G1 X130.386 Y122.955 E.05358
G1 X126.899 Y122.956 E.10714
G1 X126.899 Y133.045 E.31
G1 X130.385 Y133.045 E.10714
G1 X130.386 Y124.759 E.25459
M204 S10000
G1 X130.763 Y124.699 F42000
G1 F9299
M204 S6000
G1 X130.763 Y122.578 E.06516
G1 X126.522 Y122.579 E.13032
G1 X126.522 Y133.422 E.33317
G1 X130.763 Y133.422 E.13031
G1 X130.763 Y124.759 E.26617
M204 S10000
G1 X131.14 Y124.699 F42000
G1 F9299
M204 S6000
G1 X131.14 Y122.201 E.07675
G1 X126.145 Y122.201 E.15349
G1 X126.145 Y133.799 E.35634
G1 X131.14 Y133.799 E.15348
G1 X131.14 Y124.759 E.27776
; OBJECT_ID: 394
; WIPE_START
G1 F9547.299
G1 X131.14 Y126.759 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X123.79 Y128.816 Z12.6 F42000
G1 X104.583 Y134.191 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X104.583 Y121.809 E.41072
G1 X110.362 Y121.809 E.19172
G1 X110.362 Y134.191 E.41072
G1 X104.643 Y134.191 E.18972
M204 S10000
G1 X104.176 Y134.598 F42000
G1 F8843.478
M204 S6000
G1 X104.176 Y121.402 E.43772
G1 X110.769 Y121.41 E.21872
G1 X110.769 Y134.586 E.43709
G3 X110.293 Y134.598 I-.424 J-7.391 E.0158
G1 X104.236 Y134.598 E.20093
M204 S250
G1 X103.784 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9299
M204 S5000
G1 X103.791 Y121.15 E.41918
G3 X103.98 Y121.01 I.191 J.06 E.00771
G1 X110.664 Y121.016 E.20538
G3 X111.026 Y121.05 I.1 J.871 E.01125
G1 X111.046 Y121.062 E.00073
G3 X111.151 Y121.22 I-.172 J.227 E.00595
G1 X111.153 Y121.226 E.00019
G1 X111.158 Y121.262 E.00112
G3 X111.161 Y122.075 I-27.734 J.512 E.02499
G1 X111.161 Y134.087 E.36909
G3 X111.159 Y134.735 I-6.872 J.3 E.01992
G1 X111.153 Y134.774 E.00122
G1 X111.151 Y134.78 E.00019
G3 X110.954 Y134.97 I-.228 J-.039 E.009
G3 X110.296 Y134.99 I-.64 J-10.231 E.02025
G1 X103.995 Y134.99 E.19361
G3 X103.793 Y134.852 I-.011 J-.2 E.00808
; WIPE_START
G1 F9547.055
M204 S6000
G1 X103.793 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.26 Y131.301 Z12.6 F42000
G1 Z12.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.466635
G1 F8496.289
M204 S6000
G1 X107.26 Y131.513 E.00731
G1 X107.684 Y131.513 E.01463
G1 X107.684 Y124.487 E.24259
G1 X107.261 Y124.487 E.01463
G1 X107.26 Y131.241 E.2332
M204 S10000
G1 X108.085 Y124.699 F42000
; LINE_WIDTH: 0.41999
G1 F9299
M204 S6000
G1 X108.085 Y124.087 E.01881
G1 X106.86 Y124.087 E.03763
G1 X106.86 Y131.913 E.24049
G1 X108.085 Y131.913 E.03762
G1 X108.085 Y124.759 E.21983
M204 S10000
G1 X108.462 Y124.699 F42000
G1 F9299
M204 S6000
G1 X108.462 Y123.71 E.0304
G1 X106.483 Y123.71 E.0608
G1 X106.483 Y132.291 E.26366
G1 X108.462 Y132.291 E.06079
G1 X108.462 Y124.759 E.23142
M204 S10000
G1 X108.839 Y124.699 F42000
G1 F9299
M204 S6000
G1 X108.839 Y123.333 E.04199
G1 X106.106 Y123.333 E.08397
G1 X106.106 Y132.668 E.28683
G1 X108.839 Y132.668 E.08396
G1 X108.839 Y124.759 E.243
M204 S10000
G1 X109.216 Y124.699 F42000
G1 F9299
M204 S6000
G1 X109.216 Y122.955 E.05358
G1 X105.729 Y122.956 E.10714
G1 X105.729 Y133.045 E.31
G1 X109.216 Y133.045 E.10714
G1 X109.216 Y124.759 E.25459
M204 S10000
G1 X109.593 Y124.699 F42000
G1 F9299
M204 S6000
G1 X109.593 Y122.578 E.06516
G1 X105.352 Y122.579 E.13032
G1 X105.352 Y133.422 E.33317
G1 X109.593 Y133.422 E.13031
G1 X109.593 Y124.759 E.26617
M204 S10000
G1 X109.97 Y124.699 F42000
G1 F9299
M204 S6000
G1 X109.97 Y122.201 E.07675
G1 X104.975 Y122.201 E.15349
G1 X104.975 Y133.799 E.35634
G1 X109.97 Y133.799 E.15348
G1 X109.97 Y124.759 E.27776
; CHANGE_LAYER
; Z_HEIGHT: 12.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X109.97 Y126.759 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 62/72
; update layer progress
M73 L62
M991 S0 P61 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z12.6 I-.24 J1.193 P1  F42000
G1 X146.968 Y134.191 Z12.6
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7400
M204 S6000
G1 X146.968 Y121.809 E.41072
G1 X152.236 Y121.815 E.17475
G3 X152.745 Y121.845 I-.171 J7.167 E.01692
G1 X152.745 Y134.155 E.40834
G3 X151.884 Y134.191 I-.875 J-10.591 E.0286
G1 X147.028 Y134.191 E.16107
M204 S10000
G1 X146.561 Y134.598 F42000
M73 P87 R2
G1 F7400
M204 S6000
G1 X146.561 Y121.402 E.43772
G1 X152.249 Y121.408 E.18869
G3 X153.148 Y121.476 I-.418 J11.476 E.02991
G1 X153.148 Y134.525 E.43285
G3 X151.886 Y134.598 I-1.515 J-15.17 E.04193
G1 X146.621 Y134.598 E.17467
M204 S250
G1 X146.169 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7400
M204 S5000
G1 X146.169 Y121.21 E.41733
G3 X146.365 Y121.01 I.202 J.002 E.00951
G1 X152.262 Y121.016 E.1812
G3 X153.363 Y121.115 I-.066 J6.889 E.03402
G3 X153.542 Y121.534 I-.25 J.354 E.01471
G3 X153.544 Y122.204 I-10.776 J.37 E.02059
G1 X153.544 Y133.796 E.35621
G3 X153.541 Y134.477 I-11.015 J.3 E.02093
G3 X153.343 Y134.892 I-.392 J.067 E.01508
G3 X151.889 Y134.99 I-1.612 J-13.116 E.04479
G1 X146.379 Y134.99 E.16932
G3 X146.179 Y134.851 I-.008 J-.201 E.00804
; WIPE_START
G1 F9547.055
M204 S6000
G1 X146.177 Y132.851 E-.76
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
G1 X148.664 Y133.843 F42000
G1 Z12.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7400
M204 S6000
G1 X149.091 Y133.843 E.01419
G1 X149.092 Y132.642 E.03982
G1 X148.515 Y132.167 E.02479
G1 X147.859 Y131.014 E.04399
G2 X147.316 Y130.885 I-.362 J.315 E.01978
G1 X147.316 Y129.271 E.05353
G1 X147.859 Y130.227 E.03649
G1 X148.187 Y130.391 E.01215
G2 X149.092 Y130.116 I-.188 J-2.242 E.03161
G1 X149.092 Y127.401 E.09004
G1 X148.515 Y126.926 E.02482
G1 X147.859 Y125.773 E.04399
G2 X147.316 Y125.643 I-.362 J.315 E.01978
G1 X147.316 Y124.03 E.05353
G1 X147.859 Y124.986 E.03649
G1 X148.187 Y125.15 E.01215
G2 X149.093 Y124.874 I-.188 J-2.244 E.03164
G1 X149.093 Y123.246 E.05401
M204 S10000
G1 X150.673 Y123.639 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.534466
G1 F7323.831
M204 S6000
G1 X150.672 Y132.61 E.35933
G1 X151.164 Y132.61 E.0197
G1 X151.165 Y123.394 E.36915
G1 X150.673 Y123.393 E.01967
G1 X150.673 Y123.579 E.00744
M204 S10000
G1 X150.239 Y122.959 F42000
; LINE_WIDTH: 0.41999
G1 F7400
M204 S6000
G1 X150.238 Y133.045 E.3099
G1 X151.599 Y133.045 E.04182
G1 X151.599 Y122.96 E.30986
G1 X150.299 Y122.959 E.03993
M204 S10000
G1 X149.862 Y122.581 F42000
G1 F7400
M204 S6000
G1 X149.861 Y133.422 E.33308
G1 X151.976 Y133.417 E.06499
G1 X151.976 Y122.584 E.33288
G1 X149.922 Y122.582 E.0631
M204 S10000
G1 X149.485 Y122.204 F42000
G1 F7400
M204 S6000
G1 X149.483 Y133.799 E.35627
G1 X151.875 Y133.799 E.0735
G1 X152.353 Y133.779 E.01468
G1 X152.353 Y122.214 E.35533
G1 X149.545 Y122.204 E.08627
; OBJECT_ID: 405
; WIPE_START
G1 F9547.299
G1 X151.545 Y122.211 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X144.625 Y125.431 Z12.8 F42000
G1 X125.798 Y134.191 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7400
M204 S6000
G1 X125.798 Y121.809 E.41072
G1 X131.066 Y121.815 E.17475
G3 X131.575 Y121.845 I-.171 J7.167 E.01692
G1 X131.575 Y134.155 E.40834
G3 X130.714 Y134.191 I-.875 J-10.591 E.0286
G1 X125.858 Y134.191 E.16107
M204 S10000
G1 X125.391 Y134.598 F42000
G1 F7400
M204 S6000
G1 X125.391 Y121.402 E.43772
G1 X131.079 Y121.408 E.18869
G3 X131.978 Y121.476 I-.418 J11.476 E.02991
G1 X131.978 Y134.525 E.43285
G3 X130.717 Y134.598 I-1.515 J-15.17 E.04193
G1 X125.451 Y134.598 E.17467
M204 S250
G1 X124.999 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7400
M204 S5000
G1 X124.999 Y121.21 E.41733
G3 X125.195 Y121.01 I.202 J.002 E.00951
G1 X131.092 Y121.016 E.1812
G3 X132.194 Y121.115 I-.066 J6.889 E.03402
G3 X132.372 Y121.534 I-.25 J.354 E.01471
G3 X132.374 Y122.204 I-10.776 J.37 E.02059
G1 X132.374 Y133.796 E.35621
G3 X132.372 Y134.477 I-11.015 J.3 E.02093
G3 X132.173 Y134.892 I-.392 J.067 E.01508
G3 X130.719 Y134.99 I-1.612 J-13.116 E.04479
G1 X125.209 Y134.99 E.16932
G3 X125.009 Y134.851 I-.008 J-.201 E.00804
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.007 Y132.851 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.494 Y133.843 Z12.8 F42000
G1 Z12.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7400
M204 S6000
G1 X127.922 Y133.843 E.01419
G1 X127.922 Y132.642 E.03982
G1 X127.345 Y132.167 E.02479
G1 X126.69 Y131.014 E.04399
G2 X126.146 Y130.885 I-.362 J.315 E.01978
G1 X126.146 Y129.271 E.05353
G1 X126.69 Y130.227 E.03649
G1 X127.017 Y130.391 E.01215
G2 X127.922 Y130.116 I-.188 J-2.242 E.03161
G1 X127.923 Y127.401 E.09004
G1 X127.345 Y126.926 E.02482
G1 X126.69 Y125.773 E.04399
G2 X126.146 Y125.643 I-.362 J.315 E.01978
G1 X126.146 Y124.03 E.05353
G1 X126.69 Y124.986 E.03649
G1 X127.017 Y125.15 E.01215
G2 X127.923 Y124.874 I-.188 J-2.244 E.03164
G1 X127.923 Y123.246 E.05401
M204 S10000
G1 X129.504 Y123.639 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.534466
G1 F7323.831
M204 S6000
G1 X129.503 Y132.61 E.35933
G1 X129.994 Y132.61 E.0197
G1 X129.995 Y123.394 E.36915
G1 X129.504 Y123.393 E.01967
G1 X129.504 Y123.579 E.00744
M204 S10000
G1 X129.069 Y122.959 F42000
; LINE_WIDTH: 0.41999
G1 F7400
M204 S6000
G1 X129.068 Y133.045 E.3099
G1 X130.429 Y133.045 E.04182
G1 X130.429 Y122.96 E.30986
G1 X129.129 Y122.959 E.03993
M204 S10000
G1 X128.692 Y122.581 F42000
G1 F7400
M204 S6000
G1 X128.691 Y133.422 E.33308
G1 X130.806 Y133.417 E.06499
G1 X130.806 Y122.584 E.33288
G1 X128.752 Y122.582 E.0631
M204 S10000
G1 X128.315 Y122.204 F42000
G1 F7400
M204 S6000
G1 X128.314 Y133.799 E.35627
G1 X130.706 Y133.799 E.0735
G1 X131.183 Y133.779 E.01468
G1 X131.183 Y122.214 E.35533
G1 X128.375 Y122.204 E.08627
; OBJECT_ID: 394
; WIPE_START
G1 F9547.299
G1 X130.375 Y122.211 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X123.455 Y125.431 Z12.8 F42000
G1 X104.628 Y134.191 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7400
M204 S6000
G1 X104.628 Y121.809 E.41072
G1 X109.896 Y121.815 E.17475
G3 X110.405 Y121.845 I-.171 J7.167 E.01692
G1 X110.405 Y134.155 E.40834
G3 X109.544 Y134.191 I-.875 J-10.591 E.0286
G1 X104.688 Y134.191 E.16107
M204 S10000
G1 X104.221 Y134.598 F42000
G1 F7400
M204 S6000
G1 X104.221 Y121.402 E.43772
G1 X109.91 Y121.408 E.18869
G3 X110.808 Y121.476 I-.418 J11.476 E.02991
G1 X110.808 Y134.525 E.43285
G3 X109.547 Y134.598 I-1.515 J-15.17 E.04193
G1 X104.281 Y134.598 E.17467
M204 S250
G1 X103.829 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7400
M204 S5000
G1 X103.829 Y121.21 E.41733
G3 X104.025 Y121.01 I.202 J.002 E.00951
G1 X109.922 Y121.016 E.1812
G3 X111.024 Y121.115 I-.066 J6.889 E.03402
G3 X111.202 Y121.534 I-.25 J.354 E.01471
G3 X111.205 Y122.204 I-10.776 J.37 E.02059
G1 X111.204 Y133.796 E.35621
G3 X111.202 Y134.477 I-11.015 J.3 E.02093
G3 X111.003 Y134.892 I-.392 J.067 E.01508
G3 X109.549 Y134.99 I-1.612 J-13.116 E.04479
G1 X104.039 Y134.99 E.16932
G3 X103.839 Y134.851 I-.008 J-.201 E.00804
; WIPE_START
G1 F9547.055
M204 S6000
G1 X103.838 Y132.851 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.324 Y133.843 Z12.8 F42000
G1 Z12.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7400
M204 S6000
G1 X106.752 Y133.843 E.01419
G1 X106.752 Y132.642 E.03982
G1 X106.175 Y132.167 E.02479
G1 X105.52 Y131.014 E.04399
G2 X104.977 Y130.885 I-.362 J.315 E.01978
G1 X104.977 Y129.271 E.05353
G1 X105.52 Y130.227 E.03649
G1 X105.848 Y130.391 E.01215
G2 X106.752 Y130.116 I-.188 J-2.242 E.03161
G1 X106.753 Y127.401 E.09004
G1 X106.175 Y126.926 E.02482
G1 X105.52 Y125.773 E.04399
G2 X104.977 Y125.643 I-.362 J.315 E.01978
G1 X104.977 Y124.03 E.05353
G1 X105.52 Y124.986 E.03649
G1 X105.848 Y125.15 E.01215
G2 X106.753 Y124.874 I-.188 J-2.244 E.03164
G1 X106.753 Y123.246 E.05401
M204 S10000
G1 X108.334 Y123.639 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.534466
G1 F7323.831
M204 S6000
G1 X108.333 Y132.61 E.35933
G1 X108.825 Y132.61 E.0197
G1 X108.825 Y123.394 E.36915
G1 X108.334 Y123.393 E.01967
G1 X108.334 Y123.579 E.00744
M204 S10000
G1 X107.9 Y122.959 F42000
; LINE_WIDTH: 0.41999
G1 F7400
M204 S6000
G1 X107.898 Y133.045 E.3099
G1 X109.259 Y133.045 E.04182
G1 X109.259 Y122.96 E.30986
G1 X107.96 Y122.959 E.03993
M204 S10000
G1 X107.523 Y122.581 F42000
G1 F7400
M204 S6000
G1 X107.521 Y133.422 E.33308
G1 X109.636 Y133.417 E.06499
G1 X109.636 Y122.584 E.33288
G1 X107.583 Y122.582 E.0631
M204 S10000
G1 X107.146 Y122.204 F42000
G1 F7400
M204 S6000
G1 X107.144 Y133.799 E.35627
G1 X109.536 Y133.799 E.0735
G1 X110.013 Y133.779 E.01468
G1 X110.013 Y122.214 E.35533
G1 X107.206 Y122.204 E.08627
; CHANGE_LAYER
; Z_HEIGHT: 12.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F9547.299
G1 X109.206 Y122.211 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 63/72
; update layer progress
M73 L63
M991 S0 P62 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z12.8 I-.368 J1.16 P1  F42000
G1 X147.013 Y134.191 Z12.8
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8248
M204 S6000
G1 X147.013 Y121.809 E.41072
G1 X151.471 Y121.814 E.14786
G3 X152.704 Y121.931 I-.257 J9.241 E.04111
G1 X152.704 Y134.066 E.40253
G3 X151.134 Y134.191 I-1.534 J-9.354 E.05229
G1 X147.073 Y134.191 E.1347
M204 S10000
G1 X146.606 Y134.598 F42000
G1 F8248
M204 S6000
G1 X146.606 Y121.402 E.43772
G1 X151.482 Y121.407 E.16175
G3 X153.111 Y121.603 I-.167 J8.273 E.05449
G1 X153.111 Y134.397 E.42442
G3 X151.138 Y134.598 I-1.996 J-9.83 E.06588
G1 X146.666 Y134.598 E.14834
M204 S250
G1 X146.214 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8248
M204 S5000
G1 X146.214 Y121.21 E.41734
G3 X146.41 Y121.01 I.201 J.001 E.00952
G1 X151.494 Y121.015 E.15619
G3 X153.382 Y121.275 I-.027 J7.202 E.05876
G3 X153.503 Y121.609 I-.34 J.311 E.0112
G1 X153.503 Y134.391 E.39276
G3 X153.334 Y134.747 I-.332 J.061 E.01293
G3 X151.142 Y134.99 I-2.204 J-9.877 E.0679
G1 X146.424 Y134.99 E.14496
G3 X146.225 Y134.852 I-.007 J-.203 E.008
; WIPE_START
G1 F9547.055
M204 S6000
G1 X146.223 Y132.852 E-.76
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
G1 X147.362 Y132.008 F42000
G1 Z12.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8248
M204 S6000
G1 X147.362 Y130.379 E.05401
G2 X147.362 Y129.603 I-.788 J-.388 E.02667
G1 X147.362 Y125.138 E.14812
G2 X147.362 Y124.362 I-.788 J-.388 E.02667
G1 X147.362 Y122.158 E.0731
G1 X148.347 Y122.159 E.03268
G1 X148.347 Y125.635 E.11531
G2 X148.347 Y126.357 I.797 J.361 E.02468
G1 X148.347 Y130.877 E.14993
M73 P88 R2
G2 X148.347 Y131.598 I.797 J.361 E.02466
G1 X148.347 Y133.226 E.05401
M204 S10000
G1 X148.739 Y133.796 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F8248
M204 S6000
G1 X151.54 Y133.791 E.08608
G1 X152.312 Y133.718 E.02381
G1 X152.311 Y122.273 E.35165
G2 X150.527 Y122.205 I-1.34 J11.666 E.05492
G1 X148.739 Y122.203 E.05495
G1 X148.739 Y133.736 E.35435
M204 S10000
G1 X149.116 Y133.418 F42000
G1 F8248
M204 S6000
G1 X151.522 Y133.414 E.07394
G1 X151.935 Y133.375 E.01273
G1 X151.934 Y122.615 E.3306
G1 X151.429 Y122.583 E.01557
G1 X149.116 Y122.581 E.07106
G1 X149.116 Y133.358 E.33115
M204 S10000
G1 X149.493 Y133.04 F42000
G1 F8248
M204 S6000
G1 X151.557 Y133.032 E.06344
G1 X151.557 Y122.969 E.30921
G2 X149.493 Y122.958 I-1.688 J131.51 E.06343
G1 X149.493 Y132.98 E.30794
M204 S10000
G1 X149.87 Y132.663 F42000
G1 F8248
M204 S6000
G1 X151.18 Y132.66 E.04027
G1 X151.18 Y123.337 E.28647
G1 X149.87 Y123.336 E.04026
G1 X149.87 Y132.603 E.28474
M204 S10000
G1 X150.292 Y132.24 F42000
; LINE_WIDTH: 0.509559
G1 F7714.752
M204 S6000
G1 X150.758 Y132.239 E.01775
G1 X150.758 Y123.758 E.32248
G1 X150.292 Y123.758 E.01774
G1 X150.292 Y132.18 E.32025
; OBJECT_ID: 405
; WIPE_START
G1 X150.292 Y130.18 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X142.76 Y131.416 Z13 F42000
G1 X125.844 Y134.191 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8248
M204 S6000
G1 X125.844 Y121.809 E.41072
G1 X130.301 Y121.814 E.14786
G3 X131.534 Y121.931 I-.257 J9.241 E.04111
G1 X131.534 Y134.066 E.40253
G3 X129.964 Y134.191 I-1.534 J-9.354 E.05229
G1 X125.904 Y134.191 E.1347
M204 S10000
G1 X125.437 Y134.598 F42000
G1 F8248
M204 S6000
G1 X125.437 Y121.402 E.43772
G1 X130.313 Y121.407 E.16175
G3 X131.941 Y121.603 I-.167 J8.273 E.05449
G1 X131.941 Y134.397 E.42442
G3 X129.968 Y134.598 I-1.996 J-9.83 E.06588
G1 X125.497 Y134.598 E.14834
M204 S250
G1 X125.045 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8248
M204 S5000
G1 X125.045 Y121.21 E.41734
G3 X125.241 Y121.01 I.201 J.001 E.00952
G1 X130.324 Y121.015 E.15619
G3 X132.213 Y121.275 I-.027 J7.202 E.05876
G3 X132.333 Y121.609 I-.34 J.311 E.0112
G1 X132.333 Y134.391 E.39276
G3 X132.164 Y134.747 I-.332 J.061 E.01293
G3 X129.972 Y134.99 I-2.204 J-9.877 E.0679
G1 X125.255 Y134.99 E.14496
G3 X125.055 Y134.852 I-.007 J-.203 E.008
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.053 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.177 Y133.226 Z13 F42000
G1 Z12.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8248
M204 S6000
G1 X127.177 Y131.598 E.05401
G3 X127.177 Y130.877 I.797 J-.361 E.02466
G1 X127.177 Y126.357 E.14993
G3 X127.177 Y125.635 I.797 J-.361 E.02468
G1 X127.177 Y122.159 E.11531
G1 X126.192 Y122.158 E.03268
G1 X126.192 Y124.362 E.0731
G3 X126.192 Y125.138 I-.788 J.388 E.02667
G1 X126.192 Y129.603 E.14812
G3 X126.192 Y130.379 I-.788 J.388 E.02667
G1 X126.192 Y132.008 E.05401
M204 S10000
G1 X127.569 Y133.796 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F8248
M204 S6000
G1 X130.37 Y133.791 E.08608
G1 X131.142 Y133.718 E.02381
G1 X131.142 Y122.273 E.35165
G2 X129.357 Y122.205 I-1.34 J11.666 E.05492
G1 X127.569 Y122.203 E.05495
G1 X127.569 Y133.736 E.35435
M204 S10000
G1 X127.946 Y133.418 F42000
G1 F8248
M204 S6000
G1 X130.352 Y133.414 E.07394
G1 X130.765 Y133.375 E.01273
G1 X130.765 Y122.615 E.3306
G1 X130.259 Y122.583 E.01557
G1 X127.946 Y122.581 E.07106
G1 X127.946 Y133.358 E.33115
M204 S10000
G1 X128.323 Y133.04 F42000
G1 F8248
M204 S6000
G1 X130.388 Y133.032 E.06344
G1 X130.388 Y122.969 E.30921
G2 X128.323 Y122.958 I-1.688 J131.51 E.06343
G1 X128.323 Y132.98 E.30794
M204 S10000
G1 X128.7 Y132.663 F42000
G1 F8248
M204 S6000
G1 X130.011 Y132.66 E.04027
G1 X130.011 Y123.337 E.28647
G1 X128.7 Y123.336 E.04026
G1 X128.7 Y132.603 E.28474
M204 S10000
G1 X129.122 Y132.24 F42000
; LINE_WIDTH: 0.509559
G1 F7714.752
M204 S6000
G1 X129.589 Y132.239 E.01775
G1 X129.589 Y123.758 E.32248
G1 X129.122 Y123.758 E.01774
G1 X129.122 Y132.18 E.32025
; OBJECT_ID: 394
; WIPE_START
G1 X129.122 Y130.18 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X121.59 Y131.416 Z13 F42000
G1 X104.674 Y134.191 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8248
M204 S6000
G1 X104.674 Y121.809 E.41072
G1 X109.131 Y121.814 E.14786
G3 X110.364 Y121.931 I-.257 J9.241 E.04111
G1 X110.364 Y134.066 E.40253
G3 X108.795 Y134.191 I-1.534 J-9.354 E.05229
G1 X104.734 Y134.191 E.1347
M204 S10000
G1 X104.267 Y134.598 F42000
G1 F8248
M204 S6000
G1 X104.267 Y121.402 E.43772
G1 X109.143 Y121.407 E.16175
G3 X110.771 Y121.603 I-.167 J8.273 E.05449
G1 X110.771 Y134.397 E.42442
G3 X108.799 Y134.598 I-1.996 J-9.83 E.06588
G1 X104.327 Y134.598 E.14834
M204 S250
G1 X103.875 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8248
M204 S5000
G1 X103.875 Y121.21 E.41734
G3 X104.071 Y121.01 I.201 J.001 E.00952
G1 X109.154 Y121.015 E.15619
G3 X111.043 Y121.275 I-.027 J7.202 E.05876
G3 X111.163 Y121.609 I-.34 J.311 E.0112
G1 X111.163 Y134.391 E.39276
G3 X110.994 Y134.747 I-.332 J.061 E.01293
G3 X108.803 Y134.99 I-2.204 J-9.877 E.0679
G1 X104.085 Y134.99 E.14496
G3 X103.885 Y134.852 I-.007 J-.203 E.008
; WIPE_START
G1 F9547.055
M204 S6000
G1 X103.884 Y132.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.007 Y133.226 Z13 F42000
G1 Z12.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8248
M204 S6000
G1 X106.007 Y131.598 E.05401
G3 X106.007 Y130.877 I.797 J-.361 E.02466
G1 X106.007 Y126.357 E.14993
G3 X106.007 Y125.635 I.797 J-.361 E.02468
G1 X106.007 Y122.159 E.11531
G1 X105.022 Y122.158 E.03268
G1 X105.022 Y124.362 E.0731
G3 X105.022 Y125.138 I-.788 J.388 E.02667
G1 X105.022 Y129.603 E.14812
G3 X105.022 Y130.379 I-.788 J.388 E.02667
G1 X105.022 Y132.008 E.05401
M204 S10000
G1 X106.399 Y133.796 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F8248
M204 S6000
G1 X109.201 Y133.791 E.08608
G1 X109.972 Y133.718 E.02381
G1 X109.972 Y122.273 E.35165
G2 X108.188 Y122.205 I-1.34 J11.666 E.05492
G1 X106.399 Y122.203 E.05495
G1 X106.399 Y133.736 E.35435
M204 S10000
G1 X106.776 Y133.418 F42000
G1 F8248
M204 S6000
G1 X109.183 Y133.414 E.07394
G1 X109.595 Y133.375 E.01273
G1 X109.595 Y122.615 E.3306
G1 X109.089 Y122.583 E.01557
G1 X106.776 Y122.581 E.07106
G1 X106.776 Y133.358 E.33115
M204 S10000
G1 X107.153 Y133.04 F42000
G1 F8248
M204 S6000
G1 X109.218 Y133.032 E.06344
G1 X109.218 Y122.969 E.30921
G2 X107.153 Y122.958 I-1.688 J131.51 E.06343
G1 X107.153 Y132.98 E.30794
M204 S10000
G1 X107.53 Y132.663 F42000
G1 F8248
M204 S6000
G1 X108.841 Y132.66 E.04027
G1 X108.841 Y123.337 E.28647
G1 X107.531 Y123.336 E.04026
G1 X107.53 Y132.603 E.28474
M204 S10000
G1 X107.952 Y132.24 F42000
; LINE_WIDTH: 0.509559
G1 F7714.752
M204 S6000
G1 X108.419 Y132.239 E.01775
G1 X108.419 Y123.758 E.32248
G1 X107.952 Y123.758 E.01774
G1 X107.952 Y132.18 E.32025
; CHANGE_LAYER
; Z_HEIGHT: 12.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7714.752
G1 X107.952 Y130.18 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 64/72
; update layer progress
M73 L64
M991 S0 P63 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z13 I-.124 J1.211 P1  F42000
G1 X147.059 Y134.191 Z13
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X147.059 Y121.81 E.41069
G1 X150.749 Y121.815 E.12239
G1 X151.014 Y121.827 E.0088
G1 X151.014 Y134.174 E.40958
G1 X150.529 Y134.19 E.01608
G1 X147.119 Y134.191 E.11312
M204 S10000
G1 X146.652 Y134.598 F42000
G1 F8843.478
M204 S6000
G1 X146.652 Y121.403 E.43769
G1 X150.761 Y121.408 E.13631
G3 X151.402 Y121.449 I-.383 J11.065 E.02132
G1 X151.421 Y121.658 E.00697
G1 X151.421 Y134.315 E.41985
G1 X151.39 Y134.552 E.00795
G3 X150.536 Y134.597 I-1.008 J-11.099 E.02837
G1 X146.712 Y134.598 E.12685
M204 S250
G1 X146.26 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X146.26 Y121.208 E.41742
G3 X146.445 Y121.011 I.2 J.003 E.00909
G1 X150.773 Y121.016 E.133
G3 X152.88 Y121.347 I-.048 J7.18 E.06576
G3 X153.273 Y121.6 I-.187 J.723 E.01463
G1 X153.266 Y134.423 E.39402
G3 X152.594 Y134.745 I-1.015 J-1.254 E.02312
G3 X150.542 Y134.989 I-2.044 J-8.452 E.06363
G1 X146.468 Y134.99 E.12521
G3 X146.27 Y134.851 I-.003 J-.204 E.00793
; WIPE_START
M204 S6000
G1 X146.269 Y132.851 E-.76
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
G1 X150.524 Y133.798 F42000
G1 Z12.8
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X150.622 Y133.795 E.00299
G1 X150.622 Y122.209 E.35597
G1 X147.451 Y122.203 E.09742
G1 X147.451 Y133.799 E.3563
G1 X150.464 Y133.798 E.09258
M204 S10000
G1 X150.244 Y133.421 F42000
G1 F9547.299
M204 S6000
G1 X150.244 Y122.586 E.33293
G1 X147.828 Y122.581 E.07425
G1 X147.828 Y133.421 E.3331
G1 X150.184 Y133.421 E.0724
M204 S10000
G1 X149.867 Y123.791 F42000
G1 F9547.299
M204 S6000
G1 X149.867 Y122.962 E.02548
G1 X148.205 Y122.959 E.05107
G1 X148.205 Y133.044 E.3099
G1 X149.867 Y133.044 E.05107
G1 X149.867 Y123.851 E.28245
M204 S10000
G1 X149.49 Y123.791 F42000
G1 F9547.299
M204 S6000
G1 X149.49 Y123.338 E.01392
G1 X148.582 Y123.336 E.0279
G1 X148.582 Y132.667 E.2867
G1 X149.49 Y132.667 E.0279
G1 X149.49 Y123.851 E.27087
M204 S10000
G1 X149.036 Y132.213 F42000
; LINE_WIDTH: 0.5739
G1 F6779.917
M204 S6000
G1 X149.036 Y123.851 E.36179
; WIPE_START
G1 X149.036 Y125.851 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.838 Y132.951 Z13.2 F42000
G1 X152.474 Y134.561 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S2000
G1 X153.067 Y133.967 E.02579
G1 X153.067 Y133.434
G1 X151.813 Y134.689 E.05453
G1 X151.643 Y134.325
G1 X153.067 Y132.901 E.06189
G1 X153.067 Y132.368
G1 X151.643 Y133.792 E.06189
G1 X151.643 Y133.259
G1 X153.067 Y131.834 E.06189
G1 X153.067 Y131.301
M73 P89 R2
G1 X151.643 Y132.725 E.06189
G1 X151.643 Y132.192
G1 X153.067 Y130.768 E.06189
G1 X153.067 Y130.235
G1 X151.643 Y131.659 E.06189
G1 X151.643 Y131.126
G1 X153.067 Y129.701 E.06189
G1 X153.067 Y129.168
G1 X151.643 Y130.592 E.06189
G1 X151.643 Y130.059
G1 X153.067 Y128.635 E.06189
G1 X153.067 Y128.102
G1 X151.643 Y129.526 E.06189
G1 X151.643 Y128.993
G1 X153.067 Y127.568 E.06189
G1 X153.067 Y127.035
G1 X151.643 Y128.459 E.06189
G1 X151.643 Y127.926
G1 X153.067 Y126.502 E.06189
G1 X153.067 Y125.969
G1 X151.643 Y127.393 E.06189
G1 X151.643 Y126.86
G1 X153.067 Y125.435 E.06189
G1 X153.067 Y124.902
G1 X151.643 Y126.326 E.06189
G1 X151.643 Y125.793
G1 X153.067 Y124.369 E.06189
G1 X153.067 Y123.836
G1 X151.643 Y125.26 E.06189
G1 X151.643 Y124.727
G1 X153.067 Y123.302 E.06189
G1 X153.067 Y122.769
G1 X151.643 Y124.193 E.06189
G1 X151.643 Y123.66
G1 X153.067 Y122.236 E.06189
G1 X153.067 Y121.703
G1 X151.643 Y123.127 E.06189
G1 X151.643 Y122.594
G1 X152.724 Y121.512 E.04698
G1 X152.306 Y121.398
G1 X151.643 Y122.06 E.02878
M204 S10000
G1 X151.83 Y121.293 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.180816
G1 F15000
M204 S6000
G1 X151.631 Y121.806 E.00617
; WIPE_START
G1 X151.83 Y121.293 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X152.564 Y128.891 Z13.2 F42000
G1 X153.086 Y134.29 Z13.2
G1 Z12.8
G1 E.8 F1800
; LINE_WIDTH: 0.108357
G1 F15000
M204 S6000
G3 X152.914 Y134.414 I-2.134 J-2.781 E.00113
; OBJECT_ID: 405
; WIPE_START
G1 X153.086 Y134.29 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X145.454 Y134.262 Z13.2 F42000
G1 X125.889 Y134.191 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X125.889 Y121.81 E.41069
G1 X129.579 Y121.815 E.12239
G1 X129.844 Y121.827 E.0088
G1 X129.844 Y134.174 E.40958
G1 X129.359 Y134.19 E.01608
G1 X125.949 Y134.191 E.11312
M204 S10000
G1 X125.482 Y134.598 F42000
G1 F8843.478
M204 S6000
G1 X125.482 Y121.403 E.43769
G1 X129.591 Y121.408 E.13631
G3 X130.233 Y121.449 I-.383 J11.065 E.02132
G1 X130.251 Y121.658 E.00697
G1 X130.251 Y134.315 E.41985
G1 X130.22 Y134.552 E.00795
G3 X129.366 Y134.597 I-1.008 J-11.099 E.02837
G1 X125.542 Y134.598 E.12685
M204 S250
G1 X125.09 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X125.09 Y121.208 E.41742
G3 X125.275 Y121.011 I.2 J.003 E.00909
G1 X129.603 Y121.016 E.133
G3 X131.71 Y121.347 I-.048 J7.18 E.06576
G3 X132.104 Y121.6 I-.187 J.723 E.01463
G1 X132.096 Y134.423 E.39402
G3 X131.424 Y134.745 I-1.015 J-1.254 E.02312
G3 X129.373 Y134.989 I-2.044 J-8.452 E.06363
G1 X125.298 Y134.99 E.12521
G3 X125.101 Y134.851 I-.003 J-.204 E.00793
; WIPE_START
M204 S6000
G1 X125.099 Y132.851 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.354 Y133.798 Z13.2 F42000
G1 Z12.8
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X129.452 Y133.795 E.00299
G1 X129.452 Y122.209 E.35597
G1 X126.281 Y122.203 E.09742
G1 X126.281 Y133.799 E.3563
G1 X129.294 Y133.798 E.09258
M204 S10000
G1 X129.075 Y133.421 F42000
G1 F9547.299
M204 S6000
G1 X129.075 Y122.586 E.33293
G1 X126.658 Y122.581 E.07425
G1 X126.658 Y133.421 E.3331
G1 X129.015 Y133.421 E.0724
M204 S10000
G1 X128.698 Y123.791 F42000
G1 F9547.299
M204 S6000
G1 X128.698 Y122.962 E.02548
G1 X127.035 Y122.959 E.05107
G1 X127.035 Y133.044 E.3099
G1 X128.698 Y133.044 E.05107
G1 X128.698 Y123.851 E.28245
M204 S10000
G1 X128.321 Y123.791 F42000
G1 F9547.299
M204 S6000
G1 X128.321 Y123.338 E.01392
G1 X127.413 Y123.336 E.0279
G1 X127.413 Y132.667 E.2867
G1 X128.321 Y132.667 E.0279
G1 X128.321 Y123.851 E.27087
M204 S10000
G1 X127.867 Y132.213 F42000
; LINE_WIDTH: 0.5739
G1 F6779.917
M204 S6000
G1 X127.867 Y123.851 E.36179
; WIPE_START
G1 X127.867 Y125.851 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.669 Y132.951 Z13.2 F42000
G1 X131.304 Y134.561 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S2000
G1 X131.898 Y133.967 E.02579
G1 X131.898 Y133.434
G1 X130.643 Y134.689 E.05453
G1 X130.473 Y134.325
G1 X131.898 Y132.901 E.06189
G1 X131.898 Y132.368
G1 X130.473 Y133.792 E.06189
G1 X130.473 Y133.259
G1 X131.898 Y131.834 E.06189
G1 X131.898 Y131.301
G1 X130.473 Y132.725 E.06189
G1 X130.473 Y132.192
G1 X131.898 Y130.768 E.06189
G1 X131.898 Y130.235
G1 X130.473 Y131.659 E.06189
G1 X130.473 Y131.126
G1 X131.898 Y129.701 E.06189
G1 X131.898 Y129.168
G1 X130.473 Y130.592 E.06189
G1 X130.473 Y130.059
G1 X131.898 Y128.635 E.06189
G1 X131.898 Y128.102
G1 X130.473 Y129.526 E.06189
G1 X130.473 Y128.993
G1 X131.898 Y127.568 E.06189
G1 X131.898 Y127.035
G1 X130.473 Y128.459 E.06189
G1 X130.473 Y127.926
G1 X131.898 Y126.502 E.06189
G1 X131.898 Y125.969
G1 X130.473 Y127.393 E.06189
G1 X130.473 Y126.86
G1 X131.898 Y125.435 E.06189
G1 X131.898 Y124.902
G1 X130.473 Y126.326 E.06189
G1 X130.473 Y125.793
G1 X131.898 Y124.369 E.06189
G1 X131.898 Y123.836
G1 X130.473 Y125.26 E.06189
G1 X130.473 Y124.727
G1 X131.898 Y123.302 E.06189
G1 X131.898 Y122.769
G1 X130.473 Y124.193 E.06189
G1 X130.473 Y123.66
G1 X131.898 Y122.236 E.06189
G1 X131.898 Y121.703
G1 X130.473 Y123.127 E.06189
G1 X130.473 Y122.594
G1 X131.555 Y121.512 E.04698
G1 X131.136 Y121.398
G1 X130.473 Y122.06 E.02878
M204 S10000
G1 X130.66 Y121.293 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.180816
G1 F15000
M204 S6000
G1 X130.461 Y121.806 E.00617
; WIPE_START
G1 X130.66 Y121.293 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.395 Y128.891 Z13.2 F42000
G1 X131.917 Y134.29 Z13.2
G1 Z12.8
G1 E.8 F1800
; LINE_WIDTH: 0.108357
G1 F15000
M204 S6000
G3 X131.744 Y134.414 I-2.134 J-2.781 E.00113
; OBJECT_ID: 394
; WIPE_START
G1 X131.917 Y134.29 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X124.284 Y134.262 Z13.2 F42000
G1 X104.719 Y134.191 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X104.719 Y121.81 E.41069
G1 X108.409 Y121.815 E.12239
G1 X108.674 Y121.827 E.0088
G1 X108.674 Y134.174 E.40958
G1 X108.19 Y134.19 E.01608
G1 X104.779 Y134.191 E.11312
M204 S10000
G1 X104.312 Y134.598 F42000
G1 F8843.478
M204 S6000
G1 X104.312 Y121.403 E.43769
G1 X108.422 Y121.408 E.13631
G3 X109.063 Y121.449 I-.383 J11.065 E.02132
G1 X109.081 Y121.658 E.00697
G1 X109.081 Y134.315 E.41985
G1 X109.05 Y134.552 E.00795
G3 X108.196 Y134.597 I-1.008 J-11.099 E.02837
G1 X104.372 Y134.598 E.12685
M204 S250
G1 X103.92 Y134.792 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X103.92 Y121.208 E.41742
G3 X104.105 Y121.011 I.2 J.003 E.00909
G1 X108.434 Y121.016 E.133
G3 X110.54 Y121.347 I-.048 J7.18 E.06576
G3 X110.934 Y121.6 I-.187 J.723 E.01463
G1 X110.927 Y134.423 E.39402
G3 X110.254 Y134.745 I-1.015 J-1.254 E.02312
G3 X108.203 Y134.989 I-2.044 J-8.452 E.06363
G1 X104.128 Y134.99 E.12521
G3 X103.931 Y134.851 I-.003 J-.204 E.00793
; WIPE_START
M204 S6000
G1 X103.929 Y132.851 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.185 Y133.798 Z13.2 F42000
G1 Z12.8
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X108.282 Y133.795 E.00299
G1 X108.282 Y122.209 E.35597
G1 X105.112 Y122.203 E.09742
G1 X105.112 Y133.799 E.3563
G1 X108.125 Y133.798 E.09258
M204 S10000
G1 X107.905 Y133.421 F42000
G1 F9547.299
M204 S6000
G1 X107.905 Y122.586 E.33293
G1 X105.489 Y122.581 E.07425
G1 X105.489 Y133.421 E.3331
G1 X107.845 Y133.421 E.0724
M204 S10000
G1 X107.528 Y123.791 F42000
G1 F9547.299
M204 S6000
G1 X107.528 Y122.962 E.02548
G1 X105.866 Y122.959 E.05107
G1 X105.866 Y133.044 E.3099
G1 X107.528 Y133.044 E.05107
G1 X107.528 Y123.851 E.28245
M204 S10000
G1 X107.151 Y123.791 F42000
G1 F9547.299
M204 S6000
G1 X107.151 Y123.338 E.01392
G1 X106.243 Y123.336 E.0279
G1 X106.243 Y132.667 E.2867
G1 X107.151 Y132.667 E.0279
G1 X107.151 Y123.851 E.27087
M204 S10000
G1 X106.697 Y132.213 F42000
; LINE_WIDTH: 0.5739
G1 F6779.917
M204 S6000
G1 X106.697 Y123.851 E.36179
; WIPE_START
G1 X106.697 Y125.851 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.499 Y132.951 Z13.2 F42000
G1 X110.135 Y134.561 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S2000
G1 X110.728 Y133.967 E.02579
G1 X110.728 Y133.434
G1 X109.473 Y134.689 E.05453
G1 X109.304 Y134.325
G1 X110.728 Y132.901 E.06189
G1 X110.728 Y132.368
G1 X109.304 Y133.792 E.06189
G1 X109.304 Y133.259
G1 X110.728 Y131.834 E.06189
G1 X110.728 Y131.301
G1 X109.304 Y132.725 E.06189
G1 X109.304 Y132.192
G1 X110.728 Y130.768 E.06189
G1 X110.728 Y130.235
G1 X109.304 Y131.659 E.06189
G1 X109.304 Y131.126
G1 X110.728 Y129.701 E.06189
G1 X110.728 Y129.168
G1 X109.304 Y130.592 E.06189
G1 X109.304 Y130.059
G1 X110.728 Y128.635 E.06189
G1 X110.728 Y128.102
G1 X109.304 Y129.526 E.06189
G1 X109.304 Y128.993
G1 X110.728 Y127.568 E.06189
G1 X110.728 Y127.035
G1 X109.304 Y128.459 E.06189
G1 X109.304 Y127.926
G1 X110.728 Y126.502 E.06189
G1 X110.728 Y125.969
G1 X109.304 Y127.393 E.06189
G1 X109.304 Y126.86
G1 X110.728 Y125.435 E.06189
G1 X110.728 Y124.902
G1 X109.304 Y126.326 E.06189
G1 X109.304 Y125.793
G1 X110.728 Y124.369 E.06189
G1 X110.728 Y123.836
G1 X109.304 Y125.26 E.06189
G1 X109.304 Y124.727
G1 X110.728 Y123.302 E.06189
G1 X110.728 Y122.769
G1 X109.304 Y124.193 E.06189
G1 X109.304 Y123.66
G1 X110.728 Y122.236 E.06189
M73 P90 R2
G1 X110.728 Y121.703
G1 X109.304 Y123.127 E.06189
G1 X109.304 Y122.594
G1 X110.385 Y121.512 E.04698
G1 X109.966 Y121.398
G1 X109.304 Y122.06 E.02878
M204 S10000
G1 X109.491 Y121.293 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.180816
G1 F15000
M204 S6000
G1 X109.292 Y121.806 E.00617
; WIPE_START
G1 X109.491 Y121.293 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.225 Y128.891 Z13.2 F42000
G1 X110.747 Y134.29 Z13.2
G1 Z12.8
G1 E.8 F1800
; LINE_WIDTH: 0.108357
G1 F15000
M204 S6000
G3 X110.574 Y134.414 I-2.134 J-2.781 E.00113
; CHANGE_LAYER
; Z_HEIGHT: 13
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X110.747 Y134.29 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 65/72
; update layer progress
M73 L65
M991 S0 P64 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z13.2 I.003 J1.217 P1  F42000
G1 X147.105 Y134.191 Z13.2
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8696
M204 S6000
G1 X147.105 Y121.81 E.41069
G3 X150.004 Y121.815 I1.319 J78.627 E.09617
G1 X150.267 Y121.827 E.00875
G1 X150.264 Y134.173 E.40955
G3 X149.785 Y134.19 I-.578 J-9.476 E.01588
G1 X147.165 Y134.191 E.08694
M204 S10000
G1 X146.698 Y134.598 F42000
G1 F8696
M204 S6000
G1 X146.698 Y121.403 E.43769
G1 X150.016 Y121.408 E.11009
G3 X150.655 Y121.449 I-.385 J11.066 E.02125
G1 X150.674 Y121.659 E.007
G1 X150.671 Y134.552 E.42767
G3 X149.791 Y134.597 I-1.085 J-12.454 E.02924
G1 X146.758 Y134.598 E.10061
M204 S250
G1 X146.305 Y134.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8696
M204 S5000
G1 X146.31 Y121.16 E.41886
G3 X146.49 Y121.011 I.198 J.057 E.00762
G1 X150.028 Y121.016 E.10871
G3 X152.135 Y121.347 I-.049 J7.176 E.06576
G3 X152.533 Y121.609 I-.192 J.725 E.0149
G1 X152.531 Y134.398 E.39297
G3 X152.094 Y134.668 I-.65 J-.565 E.01603
G3 X149.795 Y134.989 I-2.17 J-7.142 E.07161
G1 X146.486 Y134.989 E.10167
G3 X146.314 Y134.851 I.016 J-.196 E.0072
; WIPE_START
G1 F9547.055
M204 S6000
G1 X146.314 Y132.851 E-.76
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
G1 X148.684 Y132.61 F42000
G1 Z13
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.53427
G1 F7326.753
M204 S6000
G1 X148.686 Y123.455 E.36657
M204 S10000
G1 X149.12 Y123.395 F42000
; LINE_WIDTH: 0.41999
G1 F8696
M204 S6000
G1 X149.121 Y122.961 E.01333
G1 X148.251 Y122.959 E.02673
G1 X148.251 Y133.044 E.30988
G1 X149.118 Y133.044 E.02664
G1 X149.12 Y123.455 E.29463
M204 S10000
G1 X149.498 Y123.395 F42000
G1 F8696
M204 S6000
G1 X149.498 Y122.585 E.02489
G1 X147.874 Y122.581 E.0499
G1 X147.874 Y133.421 E.33308
G1 X149.495 Y133.421 E.04981
G1 X149.498 Y123.455 E.3062
M204 S10000
G1 X149.875 Y123.395 F42000
G1 F8696
M204 S6000
G1 X149.875 Y122.209 E.03645
G1 X147.497 Y122.203 E.07308
G1 X147.497 Y133.799 E.35629
G1 X149.872 Y133.795 E.07298
G1 X149.875 Y123.455 E.31768
; WIPE_START
G1 F9547.299
G1 X149.874 Y125.455 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.319 Y121.35 Z13.4 F42000
G1 Z13
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F8696
M204 S2000
G1 X152.325 Y122.357 E.04375
G1 X152.325 Y122.89
G1 X150.878 Y121.443 E.06288
G1 X150.897 Y121.995
G1 X152.325 Y123.423 E.06208
G1 X152.325 Y123.957
G1 X150.896 Y122.528 E.06209
G1 X150.896 Y123.061
G1 X152.325 Y124.49 E.0621
G1 X152.325 Y125.023
G1 X150.896 Y123.594 E.0621
G1 X150.896 Y124.127
G1 X152.325 Y125.556 E.06211
G1 X152.325 Y126.09
G1 X150.896 Y124.66 E.06211
G1 X150.896 Y125.193
G1 X152.325 Y126.623 E.06212
G1 X152.325 Y127.156
G1 X150.896 Y125.727 E.06213
G1 X150.895 Y126.26
G1 X152.325 Y127.689 E.06213
G1 X152.325 Y128.223
G1 X150.895 Y126.793 E.06214
G1 X150.895 Y127.326
G1 X152.325 Y128.756 E.06215
G1 X152.325 Y129.289
G1 X150.895 Y127.859 E.06215
G1 X150.895 Y128.392
G1 X152.325 Y129.822 E.06216
G1 X152.325 Y130.356
G1 X150.895 Y128.925 E.06216
G1 X150.895 Y129.458
G1 X152.325 Y130.889 E.06217
G1 X152.325 Y131.422
G1 X150.894 Y129.991 E.06218
G1 X150.894 Y130.525
G1 X152.325 Y131.956 E.06218
G1 X152.325 Y132.489
G1 X150.894 Y131.058 E.06219
G1 X150.894 Y131.591
G1 X152.325 Y133.022 E.0622
G1 X152.325 Y133.555
G1 X150.894 Y132.124 E.0622
G1 X150.894 Y132.657
G1 X152.325 Y134.089 E.06221
G1 X152.132 Y134.429
G1 X150.894 Y133.19 E.05384
G1 X150.893 Y133.723
G1 X151.731 Y134.56 E.03638
G1 X151.29 Y134.653
G1 X150.893 Y134.256 E.01725
; WIPE_START
G1 F9547.055
M204 S6000
G1 X151.29 Y134.653 E-.21333
G1 X151.731 Y134.56 E-.171
G1 X151.031 Y133.861 E-.37568
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.857 Y126.274 Z13.4 F42000
G1 X152.344 Y121.791 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0919485
G1 F8696
M204 S6000
G1 X151.682 Y121.424 E.00302
M204 S10000
G1 X152.344 Y121.857 F42000
; LINE_WIDTH: 0.330771
G1 F8696
M204 S6000
G1 X152.13 Y121.699 E.00625
; LINE_WIDTH: 0.294849
G1 X151.702 Y121.412 E.01058
M204 S10000
G1 X151.255 Y121.414 F42000
; LINE_WIDTH: 0.100726
G1 F8696
M204 S6000
G1 X151.045 Y121.312 E.0011
; LINE_WIDTH: 0.071565
G1 X151.032 Y121.287 E.00006
M204 S10000
G1 X151.908 Y134.472 F42000
; LINE_WIDTH: 0.0925478
G1 F8696
M204 S6000
G1 X151.758 Y134.556 E.0007
; OBJECT_ID: 405
; WIPE_START
G1 F15000
G1 X151.908 Y134.472 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X144.276 Y134.389 Z13.4 F42000
G1 X125.935 Y134.191 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8696
M204 S6000
G1 X125.935 Y121.81 E.41069
G3 X128.834 Y121.815 I1.319 J78.627 E.09617
G1 X129.097 Y121.827 E.00875
G1 X129.094 Y134.173 E.40955
G3 X128.616 Y134.19 I-.578 J-9.476 E.01588
G1 X125.995 Y134.191 E.08694
M204 S10000
G1 X125.528 Y134.598 F42000
G1 F8696
M204 S6000
G1 X125.528 Y121.403 E.43769
G1 X128.846 Y121.408 E.11009
G3 X129.486 Y121.449 I-.385 J11.066 E.02125
G1 X129.504 Y121.659 E.007
G1 X129.501 Y134.552 E.42767
G3 X128.621 Y134.597 I-1.085 J-12.454 E.02924
G1 X125.588 Y134.598 E.10061
M204 S250
G1 X125.136 Y134.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8696
M204 S5000
G1 X125.141 Y121.16 E.41886
G3 X125.321 Y121.011 I.198 J.057 E.00762
G1 X128.859 Y121.016 E.10871
G3 X130.965 Y121.347 I-.049 J7.176 E.06576
G3 X131.363 Y121.609 I-.192 J.725 E.0149
G1 X131.361 Y134.398 E.39297
G3 X130.924 Y134.668 I-.65 J-.565 E.01603
G3 X128.626 Y134.989 I-2.17 J-7.142 E.07161
G1 X125.317 Y134.989 E.10167
G3 X125.144 Y134.851 I.016 J-.196 E.0072
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.144 Y132.851 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.515 Y132.61 Z13.4 F42000
G1 Z13
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.53427
G1 F7326.753
M204 S6000
G1 X127.516 Y123.455 E.36657
M204 S10000
G1 X127.951 Y123.395 F42000
; LINE_WIDTH: 0.41999
G1 F8696
M204 S6000
G1 X127.951 Y122.961 E.01333
G1 X127.081 Y122.959 E.02673
G1 X127.081 Y133.044 E.30988
G1 X127.948 Y133.044 E.02664
G1 X127.951 Y123.455 E.29463
M204 S10000
G1 X128.328 Y123.395 F42000
G1 F8696
M204 S6000
G1 X128.328 Y122.585 E.02489
G1 X126.704 Y122.581 E.0499
G1 X126.704 Y133.421 E.33308
G1 X128.325 Y133.421 E.04981
G1 X128.328 Y123.455 E.3062
M204 S10000
G1 X128.705 Y123.395 F42000
G1 F8696
M204 S6000
G1 X128.705 Y122.209 E.03645
G1 X126.327 Y122.203 E.07308
G1 X126.327 Y133.799 E.35629
G1 X128.702 Y133.795 E.07298
G1 X128.705 Y123.455 E.31768
; WIPE_START
G1 F9547.299
G1 X128.704 Y125.455 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.149 Y121.35 Z13.4 F42000
G1 Z13
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F8696
M204 S2000
G1 X131.156 Y122.357 E.04375
G1 X131.156 Y122.89
G1 X129.708 Y121.443 E.06288
G1 X129.727 Y121.995
G1 X131.156 Y123.423 E.06208
G1 X131.156 Y123.957
G1 X129.727 Y122.528 E.06209
G1 X129.727 Y123.061
G1 X131.156 Y124.49 E.0621
G1 X131.156 Y125.023
G1 X129.726 Y123.594 E.0621
G1 X129.726 Y124.127
G1 X131.156 Y125.556 E.06211
G1 X131.156 Y126.09
G1 X129.726 Y124.66 E.06211
G1 X129.726 Y125.193
G1 X131.156 Y126.623 E.06212
G1 X131.156 Y127.156
G1 X129.726 Y125.727 E.06213
G1 X129.726 Y126.26
G1 X131.156 Y127.689 E.06213
G1 X131.156 Y128.223
G1 X129.726 Y126.793 E.06214
G1 X129.725 Y127.326
G1 X131.156 Y128.756 E.06215
G1 X131.156 Y129.289
G1 X129.725 Y127.859 E.06215
G1 X129.725 Y128.392
G1 X131.156 Y129.822 E.06216
G1 X131.156 Y130.356
G1 X129.725 Y128.925 E.06216
G1 X129.725 Y129.458
G1 X131.156 Y130.889 E.06217
G1 X131.156 Y131.422
G1 X129.725 Y129.991 E.06218
G1 X129.725 Y130.525
G1 X131.156 Y131.956 E.06218
G1 X131.156 Y132.489
G1 X129.724 Y131.058 E.06219
G1 X129.724 Y131.591
G1 X131.156 Y133.022 E.0622
G1 X131.156 Y133.555
G1 X129.724 Y132.124 E.0622
G1 X129.724 Y132.657
G1 X131.156 Y134.089 E.06221
G1 X130.963 Y134.429
G1 X129.724 Y133.19 E.05384
G1 X129.724 Y133.723
G1 X130.561 Y134.56 E.03638
M73 P90 R1
G1 X130.121 Y134.653
G1 X129.724 Y134.256 E.01725
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.121 Y134.653 E-.21333
G1 X130.561 Y134.56 E-.171
G1 X129.862 Y133.861 E-.37568
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.687 Y126.274 Z13.4 F42000
G1 X131.174 Y121.791 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0919485
G1 F8696
M204 S6000
G1 X130.513 Y121.424 E.00302
M204 S10000
G1 X131.174 Y121.857 F42000
; LINE_WIDTH: 0.330771
G1 F8696
M204 S6000
G1 X130.96 Y121.699 E.00625
; LINE_WIDTH: 0.294849
G1 X130.533 Y121.412 E.01058
M204 S10000
G1 X130.085 Y121.414 F42000
; LINE_WIDTH: 0.100726
G1 F8696
M204 S6000
G1 X129.876 Y121.312 E.0011
; LINE_WIDTH: 0.071565
G1 X129.862 Y121.287 E.00006
M204 S10000
G1 X130.739 Y134.472 F42000
; LINE_WIDTH: 0.0925478
G1 F8696
M204 S6000
G1 X130.588 Y134.556 E.0007
; OBJECT_ID: 394
; WIPE_START
G1 F15000
G1 X130.739 Y134.472 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X123.107 Y134.389 Z13.4 F42000
G1 X104.765 Y134.191 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8696
M204 S6000
G1 X104.765 Y121.81 E.41069
G3 X107.664 Y121.815 I1.319 J78.627 E.09617
G1 X107.928 Y121.827 E.00875
G1 X107.924 Y134.173 E.40955
G3 X107.446 Y134.19 I-.578 J-9.476 E.01588
G1 X104.825 Y134.191 E.08694
M204 S10000
G1 X104.358 Y134.598 F42000
G1 F8696
M204 S6000
G1 X104.358 Y121.403 E.43769
M73 P91 R1
G1 X107.677 Y121.408 E.11009
G3 X108.316 Y121.449 I-.385 J11.066 E.02125
G1 X108.335 Y121.659 E.007
G1 X108.331 Y134.552 E.42767
G3 X107.451 Y134.597 I-1.085 J-12.454 E.02924
G1 X104.418 Y134.598 E.10061
M204 S250
G1 X103.966 Y134.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8696
M204 S5000
G1 X103.971 Y121.16 E.41886
G3 X104.151 Y121.011 I.198 J.057 E.00762
G1 X107.689 Y121.016 E.10871
G3 X109.795 Y121.347 I-.049 J7.176 E.06576
G3 X110.193 Y121.609 I-.192 J.725 E.0149
G1 X110.192 Y134.398 E.39297
G3 X109.754 Y134.668 I-.65 J-.565 E.01603
G3 X107.456 Y134.989 I-2.17 J-7.142 E.07161
G1 X104.147 Y134.989 E.10167
G3 X103.975 Y134.851 I.016 J-.196 E.0072
; WIPE_START
G1 F9547.055
M204 S6000
G1 X103.974 Y132.851 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.345 Y132.61 Z13.4 F42000
G1 Z13
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.53427
G1 F7326.753
M204 S6000
G1 X106.346 Y123.455 E.36657
M204 S10000
G1 X106.781 Y123.395 F42000
; LINE_WIDTH: 0.41999
G1 F8696
M204 S6000
G1 X106.781 Y122.961 E.01333
G1 X105.911 Y122.959 E.02673
G1 X105.911 Y133.044 E.30988
G1 X106.778 Y133.044 E.02664
G1 X106.781 Y123.455 E.29463
M204 S10000
G1 X107.158 Y123.395 F42000
G1 F8696
M204 S6000
G1 X107.158 Y122.585 E.02489
G1 X105.534 Y122.581 E.0499
G1 X105.534 Y133.421 E.33308
G1 X107.155 Y133.421 E.04981
G1 X107.158 Y123.455 E.3062
M204 S10000
G1 X107.535 Y123.395 F42000
G1 F8696
M204 S6000
G1 X107.535 Y122.209 E.03645
G1 X105.157 Y122.203 E.07308
G1 X105.157 Y133.799 E.35629
G1 X107.532 Y133.795 E.07298
G1 X107.535 Y123.455 E.31768
; WIPE_START
G1 F9547.299
G1 X107.535 Y125.455 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.979 Y121.35 Z13.4 F42000
G1 Z13
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F8696
M204 S2000
G1 X109.986 Y122.357 E.04375
G1 X109.986 Y122.89
G1 X108.539 Y121.443 E.06288
G1 X108.557 Y121.995
G1 X109.986 Y123.423 E.06208
G1 X109.986 Y123.957
G1 X108.557 Y122.528 E.06209
G1 X108.557 Y123.061
G1 X109.986 Y124.49 E.0621
G1 X109.986 Y125.023
G1 X108.557 Y123.594 E.0621
G1 X108.557 Y124.127
G1 X109.986 Y125.556 E.06211
G1 X109.986 Y126.09
G1 X108.556 Y124.66 E.06211
G1 X108.556 Y125.193
G1 X109.986 Y126.623 E.06212
G1 X109.986 Y127.156
G1 X108.556 Y125.727 E.06213
G1 X108.556 Y126.26
G1 X109.986 Y127.689 E.06213
G1 X109.986 Y128.223
G1 X108.556 Y126.793 E.06214
G1 X108.556 Y127.326
G1 X109.986 Y128.756 E.06215
G1 X109.986 Y129.289
G1 X108.556 Y127.859 E.06215
G1 X108.555 Y128.392
G1 X109.986 Y129.822 E.06216
G1 X109.986 Y130.356
G1 X108.555 Y128.925 E.06216
G1 X108.555 Y129.458
G1 X109.986 Y130.889 E.06217
G1 X109.986 Y131.422
G1 X108.555 Y129.991 E.06218
G1 X108.555 Y130.525
G1 X109.986 Y131.956 E.06218
G1 X109.986 Y132.489
G1 X108.555 Y131.058 E.06219
G1 X108.555 Y131.591
G1 X109.986 Y133.022 E.0622
G1 X109.986 Y133.555
G1 X108.554 Y132.124 E.0622
G1 X108.554 Y132.657
G1 X109.986 Y134.089 E.06221
G1 X109.793 Y134.429
G1 X108.554 Y133.19 E.05384
G1 X108.554 Y133.723
G1 X109.391 Y134.56 E.03638
G1 X108.951 Y134.653
G1 X108.554 Y134.256 E.01725
; WIPE_START
G1 F9547.055
M204 S6000
G1 X108.951 Y134.653 E-.21333
G1 X109.391 Y134.56 E-.171
G1 X108.692 Y133.861 E-.37568
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.517 Y126.274 Z13.4 F42000
G1 X110.005 Y121.791 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0919485
G1 F8696
M204 S6000
G1 X109.343 Y121.424 E.00302
M204 S10000
G1 X110.005 Y121.857 F42000
; LINE_WIDTH: 0.330771
G1 F8696
M204 S6000
G1 X109.79 Y121.699 E.00625
; LINE_WIDTH: 0.294849
G1 X109.363 Y121.412 E.01058
M204 S10000
G1 X108.915 Y121.414 F42000
; LINE_WIDTH: 0.100726
G1 F8696
M204 S6000
G1 X108.706 Y121.312 E.0011
; LINE_WIDTH: 0.071565
G1 X108.693 Y121.287 E.00006
M204 S10000
G1 X109.569 Y134.472 F42000
; LINE_WIDTH: 0.0925478
G1 F8696
M204 S6000
G1 X109.419 Y134.556 E.0007
; CHANGE_LAYER
; Z_HEIGHT: 13.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X109.569 Y134.472 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 66/72
; update layer progress
M73 L66
M991 S0 P65 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z13.4 I.009 J1.217 P1  F42000
G1 X147.15 Y134.191 Z13.4
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7667
M204 S6000
G1 X147.15 Y121.809 E.41072
G1 X148.964 Y121.809 E.06016
G3 X149.521 Y121.827 I-.055 J10.816 E.01849
G1 X149.519 Y134.175 E.40961
G3 X147.21 Y134.192 I-1.462 J-40.797 E.07659
M204 S10000
G1 X146.743 Y134.598 F42000
G1 F7667
M204 S6000
G1 X146.743 Y121.402 E.43773
G1 X148.968 Y121.402 E.07379
G3 X149.909 Y121.449 I-.238 J14.375 E.03126
G1 X149.928 Y121.66 E.00703
G1 X149.926 Y134.258 E.41789
G1 X149.847 Y134.559 E.01033
G3 X148.901 Y134.598 I-.993 J-12.561 E.03141
G1 X146.803 Y134.598 E.0696
M204 S250
G1 X146.351 Y134.794 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7667
M204 S5000
G1 X146.351 Y121.21 E.41739
G3 X146.557 Y121.01 I.202 J.002 E.00983
G1 X148.971 Y121.01 E.07418
G3 X151.233 Y121.293 I.097 J8.398 E.07024
G3 X151.785 Y121.597 I-.272 J1.149 E.01959
G1 X151.783 Y134.405 E.39355
G3 X151.345 Y134.669 I-.656 J-.592 E.01593
G3 X148.903 Y134.99 I-2.267 J-7.789 E.07598
G1 X146.561 Y134.99 E.07197
G3 X146.361 Y134.854 I-.01 J-.2 E.00798
; WIPE_START
G1 F9547.055
M204 S6000
G1 X146.36 Y132.854 E-.76
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
G1 X150.839 Y134.596 F42000
G1 Z13.2
G1 E.8 F1800
; FEATURE: Top surface
G1 F7667
M204 S2000
G1 X151.577 Y133.858 E.03208
G1 X151.577 Y133.325
G1 X150.196 Y134.706 E.06
G1 X150.148 Y134.22
G1 X151.577 Y132.791 E.06209
G1 X151.577 Y132.258
G1 X150.149 Y133.687 E.06209
G1 X150.149 Y133.154
G1 X151.577 Y131.725 E.06209
G1 X151.578 Y131.191
G1 X150.149 Y132.62 E.06209
G1 X150.149 Y132.087
G1 X151.578 Y130.658 E.06209
G1 X151.578 Y130.125
G1 X150.149 Y131.554 E.06209
G1 X150.149 Y131.02
G1 X151.578 Y129.591 E.06209
G1 X151.578 Y129.058
G1 X150.149 Y130.487 E.06209
G1 X150.149 Y129.953
G1 X151.578 Y128.525 E.06209
G1 X151.578 Y127.991
G1 X150.149 Y129.42 E.06209
G1 X150.149 Y128.887
G1 X151.578 Y127.458 E.06209
G1 X151.578 Y126.925
G1 X150.149 Y128.353 E.06209
G1 X150.149 Y127.82
G1 X151.578 Y126.391 E.06209
G1 X151.578 Y125.858
G1 X150.149 Y127.287 E.06209
G1 X150.15 Y126.753
G1 X151.578 Y125.325 E.06209
G1 X151.578 Y124.791
G1 X150.15 Y126.22 E.06209
G1 X150.15 Y125.687
G1 X151.579 Y124.258 E.06209
G1 X151.579 Y123.725
G1 X150.15 Y125.153 E.06209
G1 X150.15 Y124.62
G1 X151.579 Y123.191 E.06209
G1 X151.579 Y122.658
G1 X150.15 Y124.087 E.06209
G1 X150.15 Y123.553
G1 X151.579 Y122.125 E.06209
G1 X151.529 Y121.641
G1 X150.15 Y123.02 E.05991
G1 X150.15 Y122.487
G1 X151.151 Y121.486 E.0435
G1 X150.725 Y121.379
G1 X150.15 Y121.953 E.02495
M204 S10000
G1 X150.295 Y121.288 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0892916
G1 F7667
M204 S6000
G1 X150.134 Y121.703 E.00168
; WIPE_START
G1 F15000
G1 X150.295 Y121.288 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.056 Y128.883 Z13.6 F42000
G1 X151.596 Y134.267 Z13.6
G1 Z13.2
G1 E.8 F1800
; LINE_WIDTH: 0.0920487
G1 F7667
M204 S6000
G1 X151.24 Y134.487 E.00167
M204 S10000
G1 X151.596 Y134.24 F42000
; LINE_WIDTH: 0.185421
G1 F7667
M204 S6000
G1 X151.428 Y134.363 E.00241
; LINE_WIDTH: 0.149225
G1 X151.242 Y134.49 E.00195
; WIPE_START
G1 F15000
G1 X151.428 Y134.363 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.99 Y126.867 Z13.6 F42000
G1 X149.129 Y122.375 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F7667
M204 S6000
G1 X149.129 Y122.207 E.00517
G2 X147.542 Y122.201 I-1.205 J119.369 E.04874
G1 X147.542 Y133.796 E.35627
G1 X149.127 Y133.785 E.04869
G1 X149.129 Y122.435 E.34875
M204 S10000
G1 X148.335 Y132.998 F42000
; LINE_WIDTH: 0.49715
G1 F7667
M204 S6000
G1 X148.335 Y123.055 E.36806
M204 S10000
G1 X148.75 Y133.411 F42000
; LINE_WIDTH: 0.41999
G1 F7667
M204 S6000
G1 X148.751 Y122.579 E.33284
G1 X147.919 Y122.578 E.02557
G1 X147.919 Y133.416 E.33301
G1 X148.69 Y133.411 E.02367
; OBJECT_ID: 405
; WIPE_START
G1 F9547.299
G1 X147.919 Y133.416 E-.29279
G1 X147.919 Y132.187 E-.46722
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X140.319 Y132.881 Z13.6 F42000
G1 X125.981 Y134.191 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7667
M204 S6000
G1 X125.98 Y121.809 E.41072
G1 X127.794 Y121.809 E.06016
G3 X128.351 Y121.827 I-.055 J10.816 E.01849
G1 X128.349 Y134.175 E.40961
G3 X126.041 Y134.192 I-1.462 J-40.797 E.07659
M204 S10000
G1 X125.573 Y134.598 F42000
G1 F7667
M204 S6000
G1 X125.573 Y121.402 E.43773
G1 X127.798 Y121.402 E.07379
G3 X128.739 Y121.449 I-.238 J14.375 E.03126
G1 X128.758 Y121.66 E.00703
G1 X128.756 Y134.258 E.41789
G1 X128.677 Y134.559 E.01033
G3 X127.731 Y134.598 I-.993 J-12.561 E.03141
G1 X125.633 Y134.598 E.0696
M204 S250
G1 X125.181 Y134.794 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7667
M204 S5000
G1 X125.181 Y121.21 E.41739
G3 X125.388 Y121.01 I.202 J.002 E.00983
G1 X127.802 Y121.01 E.07418
G3 X130.063 Y121.293 I.097 J8.398 E.07024
G3 X130.615 Y121.597 I-.272 J1.149 E.01959
G1 X130.613 Y134.405 E.39355
G3 X130.176 Y134.669 I-.656 J-.592 E.01593
G3 X127.734 Y134.99 I-2.267 J-7.789 E.07598
G1 X125.391 Y134.99 E.07197
G3 X125.192 Y134.854 I-.01 J-.2 E.00798
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.19 Y132.854 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.669 Y134.596 Z13.6 F42000
G1 Z13.2
G1 E.8 F1800
; FEATURE: Top surface
G1 F7667
M204 S2000
G1 X130.407 Y133.858 E.03208
G1 X130.407 Y133.325
G1 X129.027 Y134.706 E.06
G1 X128.979 Y134.22
G1 X130.408 Y132.791 E.06209
G1 X130.408 Y132.258
G1 X128.979 Y133.687 E.06209
G1 X128.979 Y133.154
G1 X130.408 Y131.725 E.06209
G1 X130.408 Y131.191
G1 X128.979 Y132.62 E.06209
G1 X128.979 Y132.087
G1 X130.408 Y130.658 E.06209
G1 X130.408 Y130.125
G1 X128.979 Y131.554 E.06209
G1 X128.979 Y131.02
G1 X130.408 Y129.591 E.06209
G1 X130.408 Y129.058
G1 X128.979 Y130.487 E.06209
G1 X128.979 Y129.953
G1 X130.408 Y128.525 E.06209
G1 X130.408 Y127.991
G1 X128.979 Y129.42 E.06209
G1 X128.979 Y128.887
G1 X130.408 Y127.458 E.06209
G1 X130.408 Y126.925
G1 X128.98 Y128.353 E.06209
M73 P92 R1
G1 X128.98 Y127.82
G1 X130.408 Y126.391 E.06209
G1 X130.409 Y125.858
G1 X128.98 Y127.287 E.06209
G1 X128.98 Y126.753
G1 X130.409 Y125.325 E.06209
G1 X130.409 Y124.791
G1 X128.98 Y126.22 E.06209
G1 X128.98 Y125.687
G1 X130.409 Y124.258 E.06209
G1 X130.409 Y123.725
G1 X128.98 Y125.153 E.06209
G1 X128.98 Y124.62
G1 X130.409 Y123.191 E.06209
G1 X130.409 Y122.658
G1 X128.98 Y124.087 E.06209
G1 X128.98 Y123.553
G1 X130.409 Y122.125 E.06209
G1 X130.359 Y121.641
G1 X128.98 Y123.02 E.05991
G1 X128.98 Y122.487
G1 X129.981 Y121.486 E.0435
G1 X129.555 Y121.379
G1 X128.981 Y121.953 E.02495
M204 S10000
G1 X129.125 Y121.288 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0892916
G1 F7667
M204 S6000
G1 X128.964 Y121.703 E.00168
; WIPE_START
G1 F15000
G1 X129.125 Y121.288 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.886 Y128.883 Z13.6 F42000
G1 X130.426 Y134.267 Z13.6
G1 Z13.2
G1 E.8 F1800
; LINE_WIDTH: 0.0920487
G1 F7667
M204 S6000
G1 X130.07 Y134.487 E.00167
M204 S10000
G1 X130.426 Y134.24 F42000
; LINE_WIDTH: 0.185421
G1 F7667
M204 S6000
G1 X130.258 Y134.363 E.00241
; LINE_WIDTH: 0.149225
G1 X130.072 Y134.49 E.00195
; WIPE_START
G1 F15000
G1 X130.258 Y134.363 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.82 Y126.867 Z13.6 F42000
G1 X127.959 Y122.375 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F7667
M204 S6000
G1 X127.959 Y122.207 E.00517
G2 X126.373 Y122.201 I-1.205 J119.369 E.04874
G1 X126.373 Y133.796 E.35627
G1 X127.957 Y133.785 E.04869
G1 X127.959 Y122.435 E.34875
M204 S10000
G1 X127.165 Y132.998 F42000
; LINE_WIDTH: 0.49715
G1 F7667
M204 S6000
G1 X127.166 Y123.055 E.36806
M204 S10000
G1 X127.58 Y133.411 F42000
; LINE_WIDTH: 0.41999
G1 F7667
M204 S6000
G1 X127.582 Y122.579 E.33284
G1 X126.75 Y122.578 E.02557
G1 X126.75 Y133.416 E.33301
G1 X127.52 Y133.411 E.02367
; OBJECT_ID: 394
; WIPE_START
G1 F9547.299
G1 X126.75 Y133.416 E-.29279
G1 X126.75 Y132.187 E-.46722
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X119.149 Y132.881 Z13.6 F42000
G1 X104.811 Y134.191 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7667
M204 S6000
G1 X104.811 Y121.809 E.41072
G1 X106.624 Y121.809 E.06016
G3 X107.181 Y121.827 I-.055 J10.816 E.01849
G1 X107.179 Y134.175 E.40961
G3 X104.871 Y134.192 I-1.462 J-40.797 E.07659
M204 S10000
G1 X104.404 Y134.598 F42000
G1 F7667
M204 S6000
G1 X104.404 Y121.402 E.43773
G1 X106.628 Y121.402 E.07379
G3 X107.569 Y121.449 I-.238 J14.375 E.03126
G1 X107.588 Y121.66 E.00703
G1 X107.586 Y134.258 E.41789
G1 X107.508 Y134.559 E.01033
G3 X106.562 Y134.598 I-.993 J-12.561 E.03141
G1 X104.464 Y134.598 E.0696
M204 S250
G1 X104.012 Y134.794 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7667
M204 S5000
G1 X104.012 Y121.21 E.41739
G3 X104.218 Y121.01 I.202 J.002 E.00983
G1 X106.632 Y121.01 E.07418
G3 X108.893 Y121.293 I.097 J8.398 E.07024
G3 X109.445 Y121.597 I-.272 J1.149 E.01959
G1 X109.443 Y134.405 E.39355
G3 X109.006 Y134.669 I-.656 J-.592 E.01593
G3 X106.564 Y134.99 I-2.267 J-7.789 E.07598
G1 X104.222 Y134.99 E.07197
G3 X104.022 Y134.854 I-.01 J-.2 E.00798
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.02 Y132.854 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.499 Y134.596 Z13.6 F42000
G1 Z13.2
G1 E.8 F1800
; FEATURE: Top surface
G1 F7667
M204 S2000
G1 X109.238 Y133.858 E.03208
G1 X109.238 Y133.325
G1 X107.857 Y134.706 E.06
G1 X107.809 Y134.22
G1 X109.238 Y132.791 E.06209
G1 X109.238 Y132.258
G1 X107.809 Y133.687 E.06209
G1 X107.809 Y133.154
G1 X109.238 Y131.725 E.06209
G1 X109.238 Y131.191
G1 X107.809 Y132.62 E.06209
G1 X107.809 Y132.087
G1 X109.238 Y130.658 E.06209
G1 X109.238 Y130.125
G1 X107.809 Y131.554 E.06209
G1 X107.809 Y131.02
G1 X109.238 Y129.591 E.06209
G1 X109.238 Y129.058
G1 X107.81 Y130.487 E.06209
G1 X107.81 Y129.953
G1 X109.238 Y128.525 E.06209
G1 X109.238 Y127.991
G1 X107.81 Y129.42 E.06209
G1 X107.81 Y128.887
G1 X109.239 Y127.458 E.06209
G1 X109.239 Y126.925
G1 X107.81 Y128.353 E.06209
G1 X107.81 Y127.82
G1 X109.239 Y126.391 E.06209
G1 X109.239 Y125.858
G1 X107.81 Y127.287 E.06209
G1 X107.81 Y126.753
G1 X109.239 Y125.325 E.06209
G1 X109.239 Y124.791
G1 X107.81 Y126.22 E.06209
G1 X107.81 Y125.687
G1 X109.239 Y124.258 E.06209
G1 X109.239 Y123.725
G1 X107.81 Y125.153 E.06209
G1 X107.81 Y124.62
G1 X109.239 Y123.191 E.06209
G1 X109.239 Y122.658
G1 X107.81 Y124.087 E.06209
G1 X107.811 Y123.553
G1 X109.239 Y122.125 E.06209
G1 X109.189 Y121.641
G1 X107.811 Y123.02 E.05991
G1 X107.811 Y122.487
G1 X108.812 Y121.486 E.0435
G1 X108.385 Y121.379
G1 X107.811 Y121.953 E.02495
M204 S10000
G1 X107.955 Y121.288 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0892916
G1 F7667
M204 S6000
G1 X107.794 Y121.703 E.00168
; WIPE_START
G1 F15000
G1 X107.955 Y121.288 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.717 Y128.883 Z13.6 F42000
G1 X109.256 Y134.267 Z13.6
G1 Z13.2
G1 E.8 F1800
; LINE_WIDTH: 0.0920487
G1 F7667
M204 S6000
G1 X108.9 Y134.487 E.00167
M204 S10000
G1 X109.256 Y134.24 F42000
; LINE_WIDTH: 0.185421
G1 F7667
M204 S6000
G1 X109.088 Y134.363 E.00241
; LINE_WIDTH: 0.149225
G1 X108.902 Y134.49 E.00195
; WIPE_START
G1 F15000
G1 X109.088 Y134.363 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.651 Y126.867 Z13.6 F42000
G1 X106.789 Y122.375 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F7667
M204 S6000
G1 X106.789 Y122.207 E.00517
G2 X105.203 Y122.201 I-1.205 J119.369 E.04874
G1 X105.203 Y133.796 E.35627
G1 X106.787 Y133.785 E.04869
G1 X106.789 Y122.435 E.34875
M204 S10000
G1 X105.995 Y132.998 F42000
; LINE_WIDTH: 0.49715
G1 F7667
M204 S6000
G1 X105.996 Y123.055 E.36806
M204 S10000
G1 X106.41 Y133.411 F42000
; LINE_WIDTH: 0.41999
G1 F7667
M204 S6000
G1 X106.412 Y122.579 E.33284
G1 X105.58 Y122.578 E.02557
G1 X105.58 Y133.416 E.33301
G1 X106.35 Y133.411 E.02367
; CHANGE_LAYER
; Z_HEIGHT: 13.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X105.58 Y133.416 E-.29279
G1 X105.58 Y132.187 E-.46722
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 67/72
; update layer progress
M73 L67
M991 S0 P66 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z13.6 I-.058 J1.216 P1  F42000
G1 X147.196 Y134.19 Z13.6
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6855
M204 S6000
G1 X147.197 Y121.809 E.41068
G1 X148.229 Y121.809 E.03421
G3 X148.774 Y121.827 I-.067 J10.779 E.01811
G1 X148.774 Y134.173 E.40954
G3 X147.256 Y134.191 I-1.052 J-24.68 E.05036
M204 S10000
G1 X146.789 Y134.596 F42000
G1 F6855
M204 S6000
G1 X146.79 Y121.402 E.43767
G1 X148.233 Y121.402 E.04785
G3 X149.162 Y121.449 I-.253 J14.316 E.03087
G1 X149.181 Y121.66 E.00704
G1 X149.181 Y134.307 E.41951
G1 X149.144 Y134.553 E.00827
G3 X146.849 Y134.598 I-1.625 J-24.539 E.07615
M204 S250
G1 X146.397 Y134.805 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6855
M204 S5000
G1 X146.398 Y121.181 E.41864
G3 X146.607 Y121.01 I.197 J.028 E.0091
G1 X148.237 Y121.01 E.05008
G3 X150.49 Y121.294 I.1 J8.288 E.07
G3 X151.038 Y121.597 I-.274 J1.147 E.01947
G1 X151.033 Y134.414 E.39384
G3 X150.36 Y134.744 I-.94 J-1.065 E.02329
G3 X148.157 Y134.99 I-2.085 J-8.682 E.06831
G1 X146.576 Y134.988 E.04858
G3 X146.412 Y134.864 I.023 J-.202 E.00662
; WIPE_START
G1 F9547.055
M204 S6000
G1 X146.41 Y132.864 E-.76
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
G1 X148.382 Y122.363 F42000
G1 Z13.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F6855
M204 S6000
G1 X148.382 Y122.207 E.00482
G1 X147.589 Y122.201 E.02436
G1 X147.588 Y133.793 E.35618
G1 X148.382 Y133.785 E.02439
G1 X148.382 Y122.423 E.3491
M204 S10000
G1 X147.985 Y133.392 F42000
; LINE_WIDTH: 0.45908
G1 F6855
M204 S6000
G1 X147.986 Y122.658 E.36402
; WIPE_START
G1 F8650.519
G1 X147.986 Y124.658 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.832 Y122.464 Z13.8 F42000
G1 Z13.4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6855
M204 S2000
G1 X149.698 Y121.329 E.04929
G1 X149.396 Y121.56
G1 X150.832 Y122.997 E.06243
G1 X150.832 Y123.53
G1 X149.404 Y122.102 E.06207
G1 X149.404 Y122.635
G1 X150.832 Y124.063 E.06206
G1 X150.832 Y124.596
G1 X149.404 Y123.168 E.06206
G1 X149.404 Y123.702
G1 X150.832 Y125.13 E.06206
G1 X150.832 Y125.663
G1 X149.404 Y124.235 E.06205
G1 X149.404 Y124.768
G1 X150.832 Y126.196 E.06205
G1 X150.832 Y126.729
G1 X149.404 Y125.301 E.06205
G1 X149.404 Y125.835
G1 X150.832 Y127.262 E.06204
G1 X150.832 Y127.795
G1 X149.404 Y126.368 E.06204
G1 X149.404 Y126.901
G1 X150.831 Y128.329 E.06204
G1 X150.831 Y128.862
G1 X149.404 Y127.434 E.06204
G1 X149.404 Y127.967
G1 X150.831 Y129.395 E.06203
G1 X150.831 Y129.928
G1 X149.404 Y128.501 E.06203
G1 X149.404 Y129.034
G1 X150.831 Y130.461 E.06203
G1 X150.831 Y130.995
G1 X149.404 Y129.567 E.06202
G1 X149.404 Y130.1
G1 X150.831 Y131.528 E.06202
G1 X150.831 Y132.061
G1 X149.404 Y130.634 E.06202
G1 X149.404 Y131.167
G1 X150.831 Y132.594 E.06201
G1 X150.831 Y133.127
G1 X149.404 Y131.7 E.06201
G1 X149.404 Y132.233
G1 X150.831 Y133.66 E.06201
G1 X150.831 Y134.194
G1 X149.404 Y132.767 E.06201
G1 X149.404 Y133.3
G1 X150.563 Y134.459 E.05039
G1 X150.152 Y134.581
G1 X149.404 Y133.833 E.0325
G1 X149.398 Y134.361
G1 X149.706 Y134.669 E.01338
; WIPE_START
G1 F9547.055
M204 S6000
G1 X149.398 Y134.361 E-.16552
G1 X149.404 Y133.833 E-.2005
G1 X150.137 Y134.566 E-.39398
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.849 Y134.273 Z13.8 F42000
G1 Z13.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.145678
G1 F6855
M204 S6000
G1 X150.728 Y134.359 E.00125
; LINE_WIDTH: 0.11973
G1 X150.606 Y134.446 E.00093
M204 S10000
G1 X149.891 Y134.587 F42000
; LINE_WIDTH: 0.098811
G1 F6855
M204 S6000
G1 X149.728 Y134.669 E.00083
; WIPE_START
G1 F15000
G1 X149.891 Y134.587 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.467 Y126.977 Z13.8 F42000
G1 X150.851 Y121.905 Z13.8
G1 Z13.4
G1 E.8 F1800
; LINE_WIDTH: 0.405069
G1 F6855
M204 S6000
G1 X150.62 Y121.734 E.00848
; LINE_WIDTH: 0.373818
G1 X150.105 Y121.387 E.01674
; OBJECT_ID: 405
; WIPE_START
G1 F10879.496
G1 X150.62 Y121.734 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X143.811 Y125.183 Z13.8 F42000
G1 X126.027 Y134.19 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6855
M204 S6000
G1 X126.028 Y121.809 E.41068
G1 X127.059 Y121.809 E.03421
G3 X127.605 Y121.827 I-.067 J10.779 E.01811
G1 X127.604 Y134.173 E.40954
G3 X126.087 Y134.191 I-1.052 J-24.68 E.05036
M204 S10000
G1 X125.619 Y134.596 F42000
G1 F6855
M204 S6000
G1 X125.621 Y121.402 E.43767
G1 X127.063 Y121.402 E.04785
G3 X127.992 Y121.449 I-.253 J14.316 E.03087
G1 X128.012 Y121.66 E.00704
G1 X128.011 Y134.307 E.41951
G1 X127.974 Y134.553 E.00827
G3 X125.679 Y134.598 I-1.625 J-24.539 E.07615
M204 S250
G1 X125.227 Y134.805 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6855
M204 S5000
G1 X125.229 Y121.181 E.41864
G3 X125.437 Y121.01 I.197 J.028 E.0091
G1 X127.067 Y121.01 E.05008
G3 X129.32 Y121.294 I.1 J8.288 E.07
G3 X129.868 Y121.597 I-.274 J1.147 E.01947
G1 X129.863 Y134.414 E.39384
G3 X129.191 Y134.744 I-.94 J-1.065 E.02329
G3 X126.987 Y134.99 I-2.085 J-8.682 E.06831
G1 X125.406 Y134.988 E.04858
G3 X125.242 Y134.864 I.023 J-.202 E.00662
; WIPE_START
M73 P93 R1
G1 F9547.055
M204 S6000
G1 X125.24 Y132.864 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.649 Y125.363 Z13.8 F42000
G1 X127.213 Y122.363 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F6855
M204 S6000
G1 X127.213 Y122.207 E.00482
G1 X126.42 Y122.201 E.02436
G1 X126.419 Y133.793 E.35618
G1 X127.212 Y133.785 E.02439
G1 X127.213 Y122.423 E.3491
M204 S10000
G1 X126.816 Y133.392 F42000
; LINE_WIDTH: 0.45908
G1 F6855
M204 S6000
G1 X126.816 Y122.658 E.36402
; WIPE_START
G1 F8650.519
G1 X126.816 Y124.658 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.663 Y122.464 Z13.8 F42000
G1 Z13.4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6855
M204 S2000
G1 X128.528 Y121.329 E.04929
G1 X128.226 Y121.56
G1 X129.663 Y122.997 E.06243
G1 X129.662 Y123.53
G1 X128.234 Y122.102 E.06207
G1 X128.234 Y122.635
G1 X129.662 Y124.063 E.06206
G1 X129.662 Y124.596
G1 X128.234 Y123.168 E.06206
G1 X128.234 Y123.702
G1 X129.662 Y125.13 E.06206
G1 X129.662 Y125.663
G1 X128.234 Y124.235 E.06205
G1 X128.234 Y124.768
G1 X129.662 Y126.196 E.06205
G1 X129.662 Y126.729
G1 X128.234 Y125.301 E.06205
G1 X128.234 Y125.835
G1 X129.662 Y127.262 E.06204
G1 X129.662 Y127.795
G1 X128.234 Y126.368 E.06204
G1 X128.234 Y126.901
G1 X129.662 Y128.329 E.06204
G1 X129.662 Y128.862
G1 X128.234 Y127.434 E.06204
G1 X128.234 Y127.967
G1 X129.662 Y129.395 E.06203
G1 X129.661 Y129.928
G1 X128.234 Y128.501 E.06203
G1 X128.234 Y129.034
G1 X129.661 Y130.461 E.06203
G1 X129.661 Y130.995
G1 X128.234 Y129.567 E.06202
G1 X128.234 Y130.1
G1 X129.661 Y131.528 E.06202
G1 X129.661 Y132.061
G1 X128.234 Y130.634 E.06202
G1 X128.234 Y131.167
G1 X129.661 Y132.594 E.06201
G1 X129.661 Y133.127
G1 X128.234 Y131.7 E.06201
G1 X128.234 Y132.233
G1 X129.661 Y133.66 E.06201
G1 X129.661 Y134.194
G1 X128.234 Y132.767 E.06201
G1 X128.234 Y133.3
G1 X129.393 Y134.459 E.05039
G1 X128.982 Y134.581
G1 X128.234 Y133.833 E.0325
G1 X128.228 Y134.361
G1 X128.536 Y134.669 E.01338
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.228 Y134.361 E-.16552
G1 X128.234 Y133.833 E-.2005
G1 X128.967 Y134.566 E-.39398
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.68 Y134.273 Z13.8 F42000
G1 Z13.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.145678
G1 F6855
M204 S6000
G1 X129.558 Y134.359 E.00125
; LINE_WIDTH: 0.11973
G1 X129.436 Y134.446 E.00093
M204 S10000
G1 X128.721 Y134.587 F42000
; LINE_WIDTH: 0.098811
G1 F6855
M204 S6000
G1 X128.558 Y134.669 E.00083
; WIPE_START
G1 F15000
G1 X128.721 Y134.587 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.297 Y126.977 Z13.8 F42000
G1 X129.682 Y121.905 Z13.8
G1 Z13.4
G1 E.8 F1800
; LINE_WIDTH: 0.405069
G1 F6855
M204 S6000
G1 X129.45 Y121.734 E.00848
; LINE_WIDTH: 0.373818
G1 X128.935 Y121.387 E.01674
; OBJECT_ID: 394
; WIPE_START
G1 F10879.496
G1 X129.45 Y121.734 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X122.641 Y125.183 Z13.8 F42000
G1 X104.857 Y134.19 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6855
M204 S6000
G1 X104.858 Y121.809 E.41068
G1 X105.889 Y121.809 E.03421
G3 X106.435 Y121.827 I-.067 J10.779 E.01811
G1 X106.435 Y134.173 E.40954
G3 X104.917 Y134.191 I-1.052 J-24.68 E.05036
M204 S10000
G1 X104.45 Y134.596 F42000
G1 F6855
M204 S6000
G1 X104.451 Y121.402 E.43767
G1 X105.893 Y121.402 E.04785
G3 X106.823 Y121.449 I-.253 J14.316 E.03087
G1 X106.842 Y121.66 E.00704
G1 X106.842 Y134.307 E.41951
G1 X106.804 Y134.553 E.00827
G3 X104.51 Y134.598 I-1.625 J-24.539 E.07615
M204 S250
G1 X104.058 Y134.805 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6855
M204 S5000
G1 X104.059 Y121.181 E.41864
G3 X104.267 Y121.01 I.197 J.028 E.0091
G1 X105.897 Y121.01 E.05008
G3 X108.15 Y121.294 I.1 J8.288 E.07
G3 X108.699 Y121.597 I-.274 J1.147 E.01947
G1 X108.693 Y134.414 E.39384
G3 X108.021 Y134.744 I-.94 J-1.065 E.02329
G3 X105.817 Y134.99 I-2.085 J-8.682 E.06831
G1 X104.236 Y134.988 E.04858
G3 X104.072 Y134.864 I.023 J-.202 E.00662
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.07 Y132.864 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.479 Y125.363 Z13.8 F42000
G1 X106.043 Y122.363 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F6855
M204 S6000
G1 X106.043 Y122.207 E.00482
G1 X105.25 Y122.201 E.02436
G1 X105.249 Y133.793 E.35618
G1 X106.043 Y133.785 E.02439
G1 X106.043 Y122.423 E.3491
M204 S10000
G1 X105.646 Y133.392 F42000
; LINE_WIDTH: 0.45908
G1 F6855
M204 S6000
G1 X105.646 Y122.658 E.36402
; WIPE_START
G1 F8650.519
G1 X105.646 Y124.658 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.493 Y122.464 Z13.8 F42000
G1 Z13.4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6855
M204 S2000
G1 X107.358 Y121.329 E.04929
G1 X107.056 Y121.56
G1 X108.493 Y122.997 E.06243
G1 X108.493 Y123.53
G1 X107.064 Y122.102 E.06207
G1 X107.064 Y122.635
G1 X108.493 Y124.063 E.06206
G1 X108.493 Y124.596
G1 X107.064 Y123.168 E.06206
G1 X107.064 Y123.702
G1 X108.492 Y125.13 E.06206
G1 X108.492 Y125.663
G1 X107.064 Y124.235 E.06205
G1 X107.064 Y124.768
G1 X108.492 Y126.196 E.06205
G1 X108.492 Y126.729
G1 X107.064 Y125.301 E.06205
G1 X107.064 Y125.835
G1 X108.492 Y127.262 E.06204
G1 X108.492 Y127.795
G1 X107.064 Y126.368 E.06204
G1 X107.064 Y126.901
G1 X108.492 Y128.329 E.06204
G1 X108.492 Y128.862
G1 X107.064 Y127.434 E.06204
G1 X107.064 Y127.967
G1 X108.492 Y129.395 E.06203
G1 X108.492 Y129.928
G1 X107.064 Y128.501 E.06203
G1 X107.064 Y129.034
G1 X108.492 Y130.461 E.06203
G1 X108.492 Y130.995
G1 X107.064 Y129.567 E.06202
G1 X107.064 Y130.1
G1 X108.491 Y131.528 E.06202
G1 X108.491 Y132.061
G1 X107.064 Y130.634 E.06202
G1 X107.064 Y131.167
G1 X108.491 Y132.594 E.06201
G1 X108.491 Y133.127
G1 X107.064 Y131.7 E.06201
G1 X107.064 Y132.233
G1 X108.491 Y133.66 E.06201
G1 X108.491 Y134.194
G1 X107.064 Y132.767 E.06201
G1 X107.064 Y133.3
G1 X108.224 Y134.459 E.05039
G1 X107.812 Y134.581
G1 X107.064 Y133.833 E.0325
G1 X107.058 Y134.361
G1 X107.366 Y134.669 E.01338
; WIPE_START
G1 F9547.055
M204 S6000
G1 X107.058 Y134.361 E-.16552
G1 X107.064 Y133.833 E-.2005
G1 X107.797 Y134.566 E-.39398
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.51 Y134.273 Z13.8 F42000
G1 Z13.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.145678
G1 F6855
M204 S6000
G1 X108.388 Y134.359 E.00125
; LINE_WIDTH: 0.11973
G1 X108.267 Y134.446 E.00093
M204 S10000
G1 X107.551 Y134.587 F42000
; LINE_WIDTH: 0.098811
G1 F6855
M204 S6000
G1 X107.388 Y134.669 E.00083
; WIPE_START
G1 F15000
G1 X107.551 Y134.587 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.128 Y126.977 Z13.8 F42000
G1 X108.512 Y121.905 Z13.8
G1 Z13.4
G1 E.8 F1800
; LINE_WIDTH: 0.405069
G1 F6855
M204 S6000
G1 X108.28 Y121.734 E.00848
; LINE_WIDTH: 0.373818
G1 X107.765 Y121.387 E.01674
; CHANGE_LAYER
; Z_HEIGHT: 13.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F10879.496
G1 X108.28 Y121.734 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 68/72
; update layer progress
M73 L68
M991 S0 P67 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z13.8 I-.371 J1.159 P1  F42000
G1 X147.242 Y134.19 Z13.8
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5663
M204 S6000
G1 X147.242 Y121.809 E.41069
G1 X147.494 Y121.81 E.00836
G3 X148.028 Y121.827 I-.079 J10.736 E.01773
G1 X148.028 Y134.173 E.40954
G3 X147.302 Y134.191 I-.663 J-12.305 E.0241
M204 S10000
G1 X146.835 Y134.597 F42000
G1 F5663
M204 S6000
G1 X146.835 Y121.402 E.43771
G1 X147.498 Y121.402 E.022
G3 X148.415 Y121.449 I-.285 J14.704 E.03048
G1 X148.435 Y121.661 E.00707
G1 X148.435 Y134.353 E.42102
G1 X148.421 Y134.551 E.00659
G3 X146.895 Y134.598 I-1.258 J-16.026 E.05067
M204 S250
G1 X146.443 Y134.804 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5663
M204 S5000
G1 X146.443 Y121.197 E.4181
G3 X146.643 Y121.01 I.202 J.016 E.00925
G1 X147.502 Y121.01 E.0264
G3 X149.747 Y121.296 I.09 J8.273 E.06977
G3 X150.292 Y121.596 I-.276 J1.143 E.01934
G1 X150.293 Y134.391 E.39314
G1 X150.281 Y134.422 E.00102
G3 X149.778 Y134.694 I-.777 J-.833 E.01776
G3 X147.551 Y134.989 I-2.228 J-8.273 E.06924
G1 X146.636 Y134.989 E.0281
G3 X146.457 Y134.862 I.013 J-.207 E.00711
; WIPE_START
G1 F9547.055
M204 S6000
G1 X146.455 Y132.862 E-.76
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
G1 X147.635 Y133.983 F42000
G1 Z13.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.421952
G1 F5663
M204 S6000
G1 X147.635 Y122.017 E.36959
; WIPE_START
G1 F9497.9
G1 X147.635 Y124.017 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.756 Y131.566 Z14 F42000
G1 X149.21 Y134.625 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5663
M204 S2000
G1 X150.086 Y133.75 E.03805
G1 X150.086 Y133.216
G1 X148.636 Y134.666 E.06301
G1 X148.658 Y134.111
G1 X150.086 Y132.683 E.06207
G1 X150.086 Y132.15
G1 X148.658 Y133.578 E.06207
G1 X148.658 Y133.045
G1 X150.086 Y131.617 E.06207
G1 X150.086 Y131.083
G1 X148.658 Y132.512 E.06207
G1 X148.658 Y131.978
G1 X150.086 Y130.55 E.06207
G1 X150.086 Y130.017
G1 X148.658 Y131.445 E.06207
G1 X148.658 Y130.912
G1 X150.086 Y129.483 E.06207
G1 X150.086 Y128.95
G1 X148.658 Y130.379 E.06207
G1 X148.658 Y129.845
G1 X150.086 Y128.417 E.06207
G1 X150.086 Y127.884
G1 X148.658 Y129.312 E.06207
G1 X148.658 Y128.779
G1 X150.086 Y127.35 E.06207
G1 X150.086 Y126.817
G1 X148.658 Y128.246 E.06207
G1 X148.658 Y127.712
G1 X150.086 Y126.284 E.06207
G1 X150.086 Y125.751
G1 X148.658 Y127.179 E.06207
G1 X148.658 Y126.646
G1 X150.086 Y125.217 E.06207
G1 X150.086 Y124.684
G1 X148.658 Y126.113 E.06207
G1 X148.658 Y125.579
G1 X150.086 Y124.151 E.06208
G1 X150.086 Y123.617
M73 P94 R1
G1 X148.658 Y125.046 E.06208
G1 X148.658 Y124.513
G1 X150.086 Y123.084 E.06208
G1 X150.086 Y122.551
G1 X148.658 Y123.979 E.06208
G1 X148.658 Y123.446
G1 X150.086 Y122.018 E.06208
G1 X149.966 Y121.605
G1 X148.658 Y122.913 E.05686
G1 X148.658 Y122.38
G1 X149.575 Y121.462 E.03986
G1 X149.142 Y121.362
G1 X148.658 Y121.846 E.02105
; WIPE_START
G1 F9547.055
M204 S6000
G1 X149.142 Y121.362 E-.26032
G1 X149.575 Y121.462 E-.16888
G1 X148.959 Y122.078 E-.3308
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.678 Y129.676 Z14 F42000
G1 X150.105 Y134.183 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.264367
G1 F5663
M204 S6000
G1 X149.949 Y134.305 E.00356
; LINE_WIDTH: 0.235621
G1 X149.6 Y134.549 E.00669
; OBJECT_ID: 405
; WIPE_START
G1 F15000
G1 X149.949 Y134.305 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X142.317 Y134.268 Z14 F42000
G1 X126.072 Y134.19 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5663
M204 S6000
G1 X126.072 Y121.809 E.41069
G1 X126.324 Y121.81 E.00836
G3 X126.858 Y121.827 I-.079 J10.736 E.01773
G1 X126.858 Y134.173 E.40954
G3 X126.132 Y134.191 I-.663 J-12.305 E.0241
M204 S10000
G1 X125.665 Y134.597 F42000
G1 F5663
M204 S6000
G1 X125.665 Y121.402 E.43771
G1 X126.328 Y121.402 E.022
G3 X127.246 Y121.449 I-.285 J14.704 E.03048
G1 X127.265 Y121.661 E.00707
G1 X127.265 Y134.353 E.42102
G1 X127.251 Y134.551 E.00659
G3 X125.725 Y134.598 I-1.258 J-16.026 E.05067
M204 S250
G1 X125.273 Y134.804 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5663
M204 S5000
G1 X125.273 Y121.197 E.4181
G3 X125.473 Y121.01 I.202 J.016 E.00925
G1 X126.332 Y121.01 E.0264
G3 X128.578 Y121.296 I.09 J8.273 E.06977
G3 X129.122 Y121.596 I-.276 J1.143 E.01934
G1 X129.123 Y134.391 E.39314
G1 X129.111 Y134.422 E.00102
G3 X128.608 Y134.694 I-.777 J-.833 E.01776
G3 X126.381 Y134.989 I-2.228 J-8.273 E.06924
G1 X125.467 Y134.989 E.0281
G3 X125.288 Y134.862 I.013 J-.207 E.00711
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.286 Y132.862 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.465 Y133.983 Z14 F42000
G1 Z13.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.421952
G1 F5663
M204 S6000
G1 X126.465 Y122.017 E.36959
; WIPE_START
G1 F9497.9
G1 X126.465 Y124.017 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.586 Y131.566 Z14 F42000
G1 X128.041 Y134.625 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5663
M204 S2000
G1 X128.916 Y133.75 E.03805
G1 X128.916 Y133.216
G1 X127.466 Y134.666 E.06301
G1 X127.488 Y134.111
G1 X128.916 Y132.683 E.06207
G1 X128.916 Y132.15
G1 X127.488 Y133.578 E.06207
G1 X127.488 Y133.045
G1 X128.916 Y131.617 E.06207
G1 X128.916 Y131.083
G1 X127.488 Y132.512 E.06207
G1 X127.488 Y131.978
G1 X128.916 Y130.55 E.06207
G1 X128.916 Y130.017
G1 X127.488 Y131.445 E.06207
G1 X127.488 Y130.912
G1 X128.916 Y129.483 E.06207
G1 X128.916 Y128.95
G1 X127.488 Y130.379 E.06207
G1 X127.488 Y129.845
G1 X128.916 Y128.417 E.06207
G1 X128.916 Y127.884
G1 X127.488 Y129.312 E.06207
G1 X127.488 Y128.779
G1 X128.916 Y127.35 E.06207
G1 X128.916 Y126.817
G1 X127.488 Y128.246 E.06207
G1 X127.488 Y127.712
G1 X128.916 Y126.284 E.06207
G1 X128.916 Y125.751
G1 X127.488 Y127.179 E.06207
G1 X127.488 Y126.646
G1 X128.916 Y125.217 E.06207
G1 X128.916 Y124.684
G1 X127.488 Y126.113 E.06207
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
G1 X128.796 Y121.605
G1 X127.488 Y122.913 E.05686
G1 X127.488 Y122.38
G1 X128.405 Y121.462 E.03986
G1 X127.972 Y121.362
G1 X127.488 Y121.846 E.02105
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.972 Y121.362 E-.26032
G1 X128.405 Y121.462 E-.16888
G1 X127.79 Y122.078 E-.3308
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.508 Y129.676 Z14 F42000
G1 X128.935 Y134.183 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.264367
G1 F5663
M204 S6000
G1 X128.78 Y134.305 E.00356
; LINE_WIDTH: 0.235621
G1 X128.431 Y134.549 E.00669
; OBJECT_ID: 394
; WIPE_START
G1 F15000
G1 X128.78 Y134.305 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X121.147 Y134.268 Z14 F42000
G1 X104.902 Y134.19 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5663
M204 S6000
G1 X104.902 Y121.809 E.41069
G1 X105.154 Y121.81 E.00836
G3 X105.688 Y121.827 I-.079 J10.736 E.01773
G1 X105.688 Y134.173 E.40954
G3 X104.962 Y134.191 I-.663 J-12.305 E.0241
M204 S10000
G1 X104.495 Y134.597 F42000
G1 F5663
M204 S6000
G1 X104.495 Y121.402 E.43771
G1 X105.158 Y121.402 E.022
G3 X106.076 Y121.449 I-.285 J14.704 E.03048
G1 X106.096 Y121.661 E.00707
G1 X106.096 Y134.353 E.42102
G1 X106.081 Y134.551 E.00659
G3 X104.555 Y134.598 I-1.258 J-16.026 E.05067
M204 S250
G1 X104.103 Y134.804 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5663
M204 S5000
G1 X104.103 Y121.197 E.4181
G3 X104.304 Y121.01 I.202 J.016 E.00925
G1 X105.163 Y121.01 E.0264
G3 X107.408 Y121.296 I.09 J8.273 E.06977
G3 X107.952 Y121.596 I-.276 J1.143 E.01934
G1 X107.954 Y134.391 E.39314
G1 X107.941 Y134.422 E.00102
G3 X107.439 Y134.694 I-.777 J-.833 E.01776
G3 X105.211 Y134.989 I-2.228 J-8.273 E.06924
G1 X104.297 Y134.989 E.0281
G3 X104.118 Y134.862 I.013 J-.207 E.00711
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.116 Y132.862 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.295 Y133.983 Z14 F42000
G1 Z13.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.421952
G1 F5663
M204 S6000
G1 X105.295 Y122.017 E.36959
; WIPE_START
G1 F9497.9
G1 X105.295 Y124.017 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.417 Y131.566 Z14 F42000
G1 X106.871 Y134.625 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5663
M204 S2000
G1 X107.746 Y133.75 E.03805
G1 X107.746 Y133.216
G1 X106.296 Y134.666 E.06301
G1 X106.318 Y134.111
G1 X107.746 Y132.683 E.06207
G1 X107.746 Y132.15
G1 X106.318 Y133.578 E.06207
G1 X106.318 Y133.045
G1 X107.746 Y131.617 E.06207
G1 X107.746 Y131.083
G1 X106.318 Y132.512 E.06207
G1 X106.318 Y131.978
G1 X107.746 Y130.55 E.06207
G1 X107.746 Y130.017
G1 X106.318 Y131.445 E.06207
G1 X106.318 Y130.912
G1 X107.746 Y129.483 E.06207
G1 X107.746 Y128.95
G1 X106.318 Y130.379 E.06207
G1 X106.318 Y129.845
G1 X107.746 Y128.417 E.06207
G1 X107.746 Y127.884
G1 X106.318 Y129.312 E.06207
G1 X106.318 Y128.779
G1 X107.746 Y127.35 E.06207
G1 X107.746 Y126.817
G1 X106.318 Y128.246 E.06207
G1 X106.318 Y127.712
G1 X107.746 Y126.284 E.06207
G1 X107.746 Y125.751
G1 X106.318 Y127.179 E.06207
G1 X106.318 Y126.646
G1 X107.746 Y125.217 E.06207
G1 X107.746 Y124.684
G1 X106.318 Y126.113 E.06207
G1 X106.318 Y125.579
G1 X107.747 Y124.151 E.06208
G1 X107.747 Y123.617
G1 X106.318 Y125.046 E.06208
G1 X106.318 Y124.513
G1 X107.747 Y123.084 E.06208
G1 X107.747 Y122.551
G1 X106.318 Y123.979 E.06208
G1 X106.318 Y123.446
G1 X107.747 Y122.018 E.06208
G1 X107.626 Y121.605
G1 X106.318 Y122.913 E.05686
G1 X106.318 Y122.38
G1 X107.235 Y121.462 E.03986
G1 X106.802 Y121.362
G1 X106.318 Y121.846 E.02105
; WIPE_START
G1 F9547.055
M204 S6000
G1 X106.802 Y121.362 E-.26032
G1 X107.235 Y121.462 E-.16888
G1 X106.62 Y122.078 E-.3308
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.339 Y129.676 Z14 F42000
G1 X107.765 Y134.183 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.264367
G1 F5663
M204 S6000
G1 X107.61 Y134.305 E.00356
; LINE_WIDTH: 0.235621
G1 X107.261 Y134.549 E.00669
; CHANGE_LAYER
; Z_HEIGHT: 13.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X107.61 Y134.305 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 69/72
; update layer progress
M73 L69
M991 S0 P68 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z14 I-.009 J1.217 P1  F42000
G1 X146.88 Y134.594 Z14
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4580
M204 S6000
G1 X146.88 Y121.406 E.43747
G1 X147.039 Y121.408 E.00528
G3 X147.668 Y121.446 I-.416 J12.129 E.02091
G1 X147.689 Y121.662 E.00718
G1 X147.689 Y134.306 E.41942
G1 X147.653 Y134.555 E.00836
G3 X146.94 Y134.593 I-.961 J-11.344 E.02368
M204 S250
G1 X146.488 Y134.804 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4580
M204 S5000
G1 X146.498 Y121.141 E.41982
G3 X146.673 Y121.011 I.207 J.097 E.00698
G1 X147.051 Y121.016 E.0116
G3 X149.156 Y121.35 I-.054 J7.152 E.06573
G3 X149.547 Y121.61 I-.198 J.723 E.01469
G1 X149.547 Y134.393 E.39278
G1 X149.52 Y134.441 E.00169
G3 X148.786 Y134.766 I-1.084 J-1.457 E.02489
G3 X146.61 Y134.974 I-1.798 J-7.311 E.06739
G3 X146.502 Y134.863 I.083 J-.188 E.00488
; WIPE_START
G1 F9547.055
M204 S6000
G1 X146.502 Y132.863 E-.76
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
G1 X147.285 Y134.375 F42000
G1 Z13.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.444267
G1 F4580
M204 S6000
G1 X147.284 Y121.824 E.41046
G1 X147.089 Y121.614 E.00937
; WIPE_START
G1 F8969.8
G1 X147.284 Y121.824 E-.1089
G1 X147.284 Y123.538 E-.6511
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.739 Y121.437 Z14.2 F42000
G1 Z13.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F4580
M204 S2000
G1 X149.34 Y122.038 E.0261
G1 X149.34 Y122.571
G1 X148.079 Y121.31 E.05479
G1 X147.911 Y121.675
G1 X149.34 Y123.104 E.06208
G1 X149.34 Y123.637
G1 X147.911 Y122.209 E.06208
G1 X147.911 Y122.742
G1 X149.34 Y124.171 E.06208
G1 X149.34 Y124.704
G1 X147.911 Y123.275 E.06208
G1 X147.911 Y123.809
G1 X149.34 Y125.237 E.06208
G1 X149.34 Y125.77
G1 X147.911 Y124.342 E.06208
G1 X147.911 Y124.875
G1 X149.34 Y126.304 E.06208
G1 X149.34 Y126.837
G1 X147.911 Y125.408 E.06208
G1 X147.911 Y125.942
M73 P95 R1
G1 X149.34 Y127.37 E.06208
G1 X149.34 Y127.903
G1 X147.911 Y126.475 E.06208
G1 X147.911 Y127.008
G1 X149.34 Y128.437 E.06208
G1 X149.34 Y128.97
G1 X147.911 Y127.541 E.06208
G1 X147.911 Y128.075
G1 X149.34 Y129.503 E.06208
G1 X149.34 Y130.036
G1 X147.911 Y128.608 E.06208
G1 X147.911 Y129.141
G1 X149.34 Y130.57 E.06208
G1 X149.34 Y131.103
G1 X147.911 Y129.674 E.06208
G1 X147.911 Y130.208
G1 X149.34 Y131.636 E.06208
G1 X149.34 Y132.169
G1 X147.911 Y130.741 E.06208
G1 X147.911 Y131.274
G1 X149.34 Y132.703 E.06208
G1 X149.34 Y133.236
G1 X147.911 Y131.807 E.06208
G1 X147.911 Y132.341
G1 X149.34 Y133.769 E.06208
G1 X149.34 Y134.302
G1 X147.911 Y132.874 E.06208
G1 X147.911 Y133.407
G1 X148.991 Y134.487 E.04694
G1 X148.572 Y134.602
G1 X147.911 Y133.94 E.02873
M204 S10000
G1 X148.091 Y134.707 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.155889
G1 F4580
M204 S6000
G1 X147.901 Y134.197 E.00501
; WIPE_START
G1 F15000
G1 X148.091 Y134.707 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.832 Y127.111 Z14.2 F42000
G1 X149.359 Y121.715 Z14.2
G1 Z13.8
G1 E.8 F1800
; LINE_WIDTH: 0.109847
G1 F4580
M204 S6000
G1 X149.181 Y121.585 E.0012
; OBJECT_ID: 405
; WIPE_START
G1 F15000
G1 X149.359 Y121.715 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X142.656 Y125.366 Z14.2 F42000
G1 X125.711 Y134.594 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4580
M204 S6000
G1 X125.71 Y121.406 E.43747
G1 X125.869 Y121.408 E.00528
G3 X126.499 Y121.446 I-.416 J12.129 E.02091
G1 X126.519 Y121.662 E.00718
G1 X126.519 Y134.306 E.41942
G1 X126.483 Y134.555 E.00836
G3 X125.771 Y134.593 I-.961 J-11.344 E.02368
M204 S250
G1 X125.319 Y134.804 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4580
M204 S5000
G1 X125.328 Y121.141 E.41982
G3 X125.504 Y121.011 I.207 J.097 E.00698
G1 X125.881 Y121.016 E.0116
G3 X127.986 Y121.35 I-.054 J7.152 E.06573
G3 X128.377 Y121.61 I-.198 J.723 E.01469
G1 X128.377 Y134.393 E.39278
G1 X128.351 Y134.441 E.00169
G3 X127.616 Y134.766 I-1.084 J-1.457 E.02489
G3 X125.44 Y134.974 I-1.798 J-7.311 E.06739
G3 X125.333 Y134.863 I.083 J-.188 E.00488
M204 S10000
G1 X126.115 Y134.375 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.444267
G1 F4580
M204 S6000
G1 X126.115 Y121.824 E.41046
G1 X125.919 Y121.614 E.00937
; WIPE_START
G1 F8969.8
G1 X126.115 Y121.824 E-.1089
G1 X126.115 Y123.538 E-.6511
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.569 Y121.437 Z14.2 F42000
G1 Z13.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F4580
M204 S2000
G1 X128.17 Y122.038 E.0261
G1 X128.17 Y122.571
G1 X126.909 Y121.31 E.05479
G1 X126.741 Y121.675
G1 X128.17 Y123.104 E.06208
G1 X128.17 Y123.637
G1 X126.741 Y122.209 E.06208
G1 X126.741 Y122.742
G1 X128.17 Y124.171 E.06208
G1 X128.17 Y124.704
G1 X126.741 Y123.275 E.06208
G1 X126.741 Y123.809
G1 X128.17 Y125.237 E.06208
G1 X128.17 Y125.77
G1 X126.741 Y124.342 E.06208
G1 X126.741 Y124.875
G1 X128.17 Y126.304 E.06208
G1 X128.17 Y126.837
G1 X126.741 Y125.408 E.06208
G1 X126.741 Y125.942
G1 X128.17 Y127.37 E.06208
G1 X128.17 Y127.903
G1 X126.741 Y126.475 E.06208
G1 X126.741 Y127.008
G1 X128.17 Y128.437 E.06208
G1 X128.17 Y128.97
G1 X126.741 Y127.541 E.06208
G1 X126.741 Y128.075
G1 X128.17 Y129.503 E.06208
G1 X128.17 Y130.036
G1 X126.741 Y128.608 E.06208
G1 X126.741 Y129.141
G1 X128.17 Y130.57 E.06208
G1 X128.17 Y131.103
G1 X126.741 Y129.674 E.06208
G1 X126.741 Y130.208
G1 X128.17 Y131.636 E.06208
G1 X128.17 Y132.169
G1 X126.741 Y130.741 E.06208
G1 X126.741 Y131.274
G1 X128.17 Y132.703 E.06208
G1 X128.17 Y133.236
G1 X126.741 Y131.807 E.06208
G1 X126.741 Y132.341
G1 X128.17 Y133.769 E.06208
G1 X128.17 Y134.302
G1 X126.741 Y132.874 E.06208
G1 X126.741 Y133.407
G1 X127.821 Y134.487 E.04694
M73 P95 R0
G1 X127.403 Y134.602
G1 X126.741 Y133.94 E.02873
M204 S10000
G1 X126.921 Y134.707 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.155889
G1 F4580
M204 S6000
G1 X126.731 Y134.197 E.00501
; WIPE_START
G1 F15000
G1 X126.921 Y134.707 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.662 Y127.111 Z14.2 F42000
G1 X128.189 Y121.715 Z14.2
G1 Z13.8
G1 E.8 F1800
; LINE_WIDTH: 0.109847
G1 F4580
M204 S6000
G1 X128.011 Y121.585 E.0012
; OBJECT_ID: 394
; WIPE_START
G1 F15000
G1 X128.189 Y121.715 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X121.486 Y125.366 Z14.2 F42000
G1 X104.541 Y134.594 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4580
M204 S6000
G1 X104.54 Y121.406 E.43747
G1 X104.7 Y121.408 E.00528
G3 X105.329 Y121.446 I-.416 J12.129 E.02091
G1 X105.349 Y121.662 E.00718
G1 X105.349 Y134.306 E.41942
G1 X105.313 Y134.555 E.00836
G3 X104.601 Y134.593 I-.961 J-11.344 E.02368
M204 S250
G1 X104.149 Y134.804 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4580
M204 S5000
G1 X104.159 Y121.141 E.41982
G3 X104.334 Y121.011 I.207 J.097 E.00698
G1 X104.711 Y121.016 E.0116
G3 X106.816 Y121.35 I-.054 J7.152 E.06573
G3 X107.208 Y121.61 I-.198 J.723 E.01469
G1 X107.208 Y134.393 E.39278
G1 X107.181 Y134.441 E.00169
G3 X106.446 Y134.766 I-1.084 J-1.457 E.02489
G3 X104.271 Y134.974 I-1.798 J-7.311 E.06739
G3 X104.163 Y134.863 I.083 J-.188 E.00488
M204 S10000
G1 X104.945 Y134.375 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.444267
G1 F4580
M204 S6000
G1 X104.945 Y121.824 E.41046
G1 X104.75 Y121.614 E.00937
; WIPE_START
G1 F8969.8
G1 X104.945 Y121.824 E-.1089
G1 X104.945 Y123.538 E-.6511
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.4 Y121.437 Z14.2 F42000
G1 Z13.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F4580
M204 S2000
G1 X107 Y122.038 E.0261
G1 X107 Y122.571
G1 X105.739 Y121.31 E.05479
G1 X105.572 Y121.675
G1 X107 Y123.104 E.06208
G1 X107 Y123.637
G1 X105.572 Y122.209 E.06208
G1 X105.572 Y122.742
G1 X107 Y124.171 E.06208
G1 X107 Y124.704
G1 X105.572 Y123.275 E.06208
G1 X105.572 Y123.809
G1 X107 Y125.237 E.06208
G1 X107 Y125.77
G1 X105.572 Y124.342 E.06208
G1 X105.572 Y124.875
G1 X107 Y126.304 E.06208
G1 X107 Y126.837
G1 X105.572 Y125.408 E.06208
G1 X105.572 Y125.942
G1 X107 Y127.37 E.06208
G1 X107 Y127.903
G1 X105.572 Y126.475 E.06208
G1 X105.572 Y127.008
G1 X107 Y128.437 E.06208
G1 X107 Y128.97
G1 X105.572 Y127.541 E.06208
G1 X105.572 Y128.075
G1 X107 Y129.503 E.06208
G1 X107 Y130.036
G1 X105.572 Y128.608 E.06208
G1 X105.572 Y129.141
G1 X107 Y130.57 E.06208
G1 X107 Y131.103
G1 X105.572 Y129.674 E.06208
G1 X105.572 Y130.208
G1 X107 Y131.636 E.06208
G1 X107 Y132.169
G1 X105.572 Y130.741 E.06208
G1 X105.572 Y131.274
G1 X107 Y132.703 E.06208
G1 X107 Y133.236
G1 X105.572 Y131.807 E.06208
G1 X105.572 Y132.341
G1 X107 Y133.769 E.06208
G1 X107 Y134.302
G1 X105.572 Y132.874 E.06208
G1 X105.572 Y133.407
G1 X106.652 Y134.487 E.04694
G1 X106.233 Y134.602
G1 X105.572 Y133.94 E.02873
M204 S10000
G1 X105.751 Y134.707 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.155889
G1 F4580
M204 S6000
G1 X105.562 Y134.197 E.00501
; WIPE_START
G1 F15000
G1 X105.751 Y134.707 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.493 Y127.111 Z14.2 F42000
G1 X107.019 Y121.715 Z14.2
G1 Z13.8
G1 E.8 F1800
; LINE_WIDTH: 0.109847
G1 F4580
M204 S6000
G1 X106.841 Y121.585 E.0012
; CHANGE_LAYER
; Z_HEIGHT: 14
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X107.019 Y121.715 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 70/72
; update layer progress
M73 L70
M991 S0 P69 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z14.2 I-.382 J1.156 P1  F42000
G1 X146.536 Y134.772 Z14.2
G1 Z14
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3571
M204 S5000
G1 X146.536 Y121.227 E.4162
G3 X146.733 Y121.039 I.181 J-.008 E.00946
G1 X147.125 Y121.075 E.0121
G3 X148.59 Y121.43 I-.353 J4.652 E.04652
G3 X148.801 Y121.61 I-.141 J.379 E.0087
G1 X148.798 Y134.401 E.39303
G3 X148.285 Y134.694 I-.698 J-.625 E.01848
G3 X146.649 Y134.95 I-1.714 J-5.603 E.05105
G1 X146.639 Y134.946 E.00033
G3 X146.545 Y134.832 I.094 J-.173 E.00465
; WIPE_START
G1 F9547.055
M204 S6000
G1 X146.544 Y132.832 E-.76
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
G1 X146.923 Y134.748 F42000
G1 Z14
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.448434
G1 F3571
M204 S6000
G1 X146.935 Y121.663 E.43239
G1 X146.916 Y121.252 E.01358
M204 S10000
G1 X147.586 Y134.65 F42000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F3571
M204 S2000
G1 X148.593 Y133.642 E.04377
G1 X148.593 Y133.109
G1 X147.154 Y134.548 E.06254
G1 X147.165 Y134.004
G1 X148.593 Y132.576 E.06208
G1 X148.593 Y132.043
G1 X147.165 Y133.471 E.06208
G1 X147.165 Y132.938
G1 X148.593 Y131.509 E.06208
G1 X148.593 Y130.976
G1 X147.165 Y132.405 E.06208
G1 X147.165 Y131.871
G1 X148.593 Y130.443 E.06208
G1 X148.593 Y129.91
G1 X147.165 Y131.338 E.06208
G1 X147.165 Y130.805
G1 X148.593 Y129.376 E.06208
G1 X148.593 Y128.843
G1 X147.165 Y130.272 E.06208
G1 X147.165 Y129.738
G1 X148.593 Y128.31 E.06208
G1 X148.593 Y127.777
G1 X147.165 Y129.205 E.06208
G1 X147.165 Y128.672
G1 X148.593 Y127.243 E.06208
G1 X148.593 Y126.71
G1 X147.165 Y128.139 E.06208
G1 X147.165 Y127.605
G1 X148.593 Y126.177 E.06208
G1 X148.593 Y125.644
G1 X147.165 Y127.072 E.06208
G1 X147.165 Y126.539
G1 X148.593 Y125.11 E.06208
G1 X148.593 Y124.577
G1 X147.165 Y126.006 E.06208
G1 X147.165 Y125.472
G1 X148.593 Y124.044 E.06208
G1 X148.593 Y123.51
G1 X147.165 Y124.939 E.06208
G1 X147.165 Y124.406
G1 X148.593 Y122.977 E.06208
G1 X148.593 Y122.444
M73 P96 R0
G1 X147.165 Y123.873 E.06208
G1 X147.165 Y123.339
G1 X148.593 Y121.911 E.06208
G1 X148.4 Y121.57
G1 X147.165 Y122.806 E.0537
G1 X147.165 Y122.273
G1 X147.999 Y121.439 E.03624
G1 X147.559 Y121.345
G1 X147.165 Y121.739 E.01714
M204 S10000
G1 X148.176 Y121.528 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.090839
G1 F3571
M204 S6000
G1 X148.027 Y121.444 E.00067
; WIPE_START
G1 F15000
G1 X148.176 Y121.528 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.44 Y129.156 Z14.4 F42000
G1 X148.612 Y134.143 Z14.4
G1 Z14
G1 E.8 F1800
; LINE_WIDTH: 0.331921
G1 F3571
M204 S6000
G1 X148.4 Y134.299 E.00621
; LINE_WIDTH: 0.299898
G1 X147.975 Y134.587 E.01074
; OBJECT_ID: 405
; WIPE_START
G1 F14009.001
G1 X148.4 Y134.299 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X140.769 Y134.456 Z14.4 F42000
G1 X125.366 Y134.772 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3571
M204 S5000
G1 X125.366 Y121.227 E.4162
G3 X125.563 Y121.039 I.181 J-.008 E.00946
G1 X125.955 Y121.075 E.0121
G3 X127.42 Y121.43 I-.353 J4.652 E.04652
G3 X127.631 Y121.61 I-.141 J.379 E.0087
G1 X127.629 Y134.401 E.39303
G3 X127.116 Y134.694 I-.698 J-.625 E.01848
G3 X125.48 Y134.95 I-1.714 J-5.603 E.05105
G1 X125.469 Y134.946 E.00033
G3 X125.376 Y134.832 I.094 J-.173 E.00465
M204 S10000
G1 X125.753 Y134.748 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.448434
G1 F3571
M204 S6000
G1 X125.765 Y121.663 E.43239
G1 X125.746 Y121.252 E.01358
M204 S10000
G1 X126.416 Y134.65 F42000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F3571
M204 S2000
G1 X127.423 Y133.642 E.04377
G1 X127.423 Y133.109
G1 X125.984 Y134.548 E.06254
G1 X125.995 Y134.004
G1 X127.423 Y132.576 E.06208
G1 X127.423 Y132.043
G1 X125.995 Y133.471 E.06208
G1 X125.995 Y132.938
G1 X127.423 Y131.509 E.06208
G1 X127.423 Y130.976
G1 X125.995 Y132.405 E.06208
G1 X125.995 Y131.871
G1 X127.423 Y130.443 E.06208
G1 X127.423 Y129.91
G1 X125.995 Y131.338 E.06208
G1 X125.995 Y130.805
G1 X127.423 Y129.376 E.06208
G1 X127.423 Y128.843
G1 X125.995 Y130.272 E.06208
G1 X125.995 Y129.738
G1 X127.423 Y128.31 E.06208
G1 X127.423 Y127.777
G1 X125.995 Y129.205 E.06208
G1 X125.995 Y128.672
G1 X127.423 Y127.243 E.06208
G1 X127.423 Y126.71
G1 X125.995 Y128.139 E.06208
G1 X125.995 Y127.605
G1 X127.423 Y126.177 E.06208
G1 X127.423 Y125.644
G1 X125.995 Y127.072 E.06208
G1 X125.995 Y126.539
G1 X127.423 Y125.11 E.06208
G1 X127.423 Y124.577
G1 X125.995 Y126.006 E.06208
G1 X125.995 Y125.472
G1 X127.423 Y124.044 E.06208
G1 X127.423 Y123.51
G1 X125.995 Y124.939 E.06208
G1 X125.995 Y124.406
G1 X127.423 Y122.977 E.06208
G1 X127.423 Y122.444
G1 X125.995 Y123.873 E.06208
G1 X125.995 Y123.339
G1 X127.423 Y121.911 E.06208
G1 X127.231 Y121.57
G1 X125.995 Y122.806 E.0537
G1 X125.995 Y122.273
G1 X126.829 Y121.439 E.03624
G1 X126.389 Y121.345
G1 X125.995 Y121.739 E.01714
M204 S10000
G1 X127.006 Y121.528 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.090839
G1 F3571
M204 S6000
G1 X126.857 Y121.444 E.00067
; WIPE_START
G1 F15000
G1 X127.006 Y121.528 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.27 Y129.156 Z14.4 F42000
G1 X127.442 Y134.143 Z14.4
G1 Z14
G1 E.8 F1800
; LINE_WIDTH: 0.331921
G1 F3571
M204 S6000
G1 X127.23 Y134.299 E.00621
; LINE_WIDTH: 0.299898
G1 X126.805 Y134.587 E.01074
; OBJECT_ID: 394
; WIPE_START
G1 F14009.001
G1 X127.23 Y134.299 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X119.599 Y134.456 Z14.4 F42000
G1 X104.197 Y134.772 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3571
M204 S5000
G1 X104.197 Y121.227 E.4162
G3 X104.393 Y121.039 I.181 J-.008 E.00946
G1 X104.785 Y121.075 E.0121
G3 X106.25 Y121.43 I-.353 J4.652 E.04652
G3 X106.461 Y121.61 I-.141 J.379 E.0087
G1 X106.459 Y134.401 E.39303
G3 X105.946 Y134.694 I-.698 J-.625 E.01848
G3 X104.31 Y134.95 I-1.714 J-5.603 E.05105
G1 X104.3 Y134.946 E.00033
G3 X104.206 Y134.832 I.094 J-.173 E.00465
M204 S10000
G1 X104.584 Y134.748 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.448434
G1 F3571
M204 S6000
G1 X104.596 Y121.663 E.43239
G1 X104.576 Y121.252 E.01358
M204 S10000
G1 X105.246 Y134.65 F42000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F3571
M204 S2000
G1 X106.254 Y133.642 E.04377
G1 X106.254 Y133.109
G1 X104.815 Y134.548 E.06254
G1 X104.825 Y134.004
G1 X106.254 Y132.576 E.06208
G1 X106.254 Y132.043
G1 X104.825 Y133.471 E.06208
G1 X104.825 Y132.938
G1 X106.254 Y131.509 E.06208
G1 X106.254 Y130.976
G1 X104.825 Y132.405 E.06208
G1 X104.825 Y131.871
G1 X106.254 Y130.443 E.06208
G1 X106.254 Y129.91
G1 X104.825 Y131.338 E.06208
G1 X104.825 Y130.805
G1 X106.254 Y129.376 E.06208
G1 X106.254 Y128.843
G1 X104.825 Y130.272 E.06208
G1 X104.825 Y129.738
G1 X106.254 Y128.31 E.06208
G1 X106.254 Y127.777
G1 X104.825 Y129.205 E.06208
G1 X104.825 Y128.672
G1 X106.254 Y127.243 E.06208
G1 X106.254 Y126.71
G1 X104.825 Y128.139 E.06208
G1 X104.825 Y127.605
G1 X106.254 Y126.177 E.06208
G1 X106.254 Y125.644
G1 X104.825 Y127.072 E.06208
G1 X104.825 Y126.539
G1 X106.254 Y125.11 E.06208
G1 X106.254 Y124.577
G1 X104.825 Y126.006 E.06208
G1 X104.825 Y125.472
G1 X106.254 Y124.044 E.06208
G1 X106.254 Y123.51
G1 X104.825 Y124.939 E.06208
G1 X104.825 Y124.406
G1 X106.254 Y122.977 E.06208
G1 X106.254 Y122.444
G1 X104.825 Y123.873 E.06208
G1 X104.825 Y123.339
G1 X106.254 Y121.911 E.06208
G1 X106.061 Y121.57
G1 X104.825 Y122.806 E.0537
G1 X104.825 Y122.273
G1 X105.659 Y121.439 E.03624
G1 X105.22 Y121.345
G1 X104.825 Y121.739 E.01714
M204 S10000
G1 X105.836 Y121.528 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.090839
G1 F3571
M204 S6000
G1 X105.687 Y121.444 E.00067
; WIPE_START
G1 F15000
G1 X105.836 Y121.528 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.1 Y129.156 Z14.4 F42000
G1 X106.273 Y134.143 Z14.4
G1 Z14
G1 E.8 F1800
; LINE_WIDTH: 0.331921
G1 F3571
M204 S6000
G1 X106.06 Y134.299 E.00621
; LINE_WIDTH: 0.299898
G1 X105.636 Y134.587 E.01074
; CHANGE_LAYER
; Z_HEIGHT: 14.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F14009.001
G1 X106.06 Y134.299 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 71/72
; update layer progress
M73 L71
M991 S0 P70 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z14.4 I-.013 J1.217 P1  F42000
G1 X146.596 Y134.739 Z14.4
G1 Z14.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2666
M204 S5000
G3 X146.588 Y134.642 I.284 J-.074 E.00302
G1 X146.588 Y121.358 E.40816
G3 X146.75 Y121.126 I.18 J-.047 E.00992
G3 X147.929 Y121.479 I-.451 J3.644 E.03799
G3 X148.054 Y121.61 I-.121 J.242 E.00566
G1 X148.054 Y134.385 E.39254
G1 X148.042 Y134.423 E.00123
G3 X147.299 Y134.764 I-.982 J-1.16 E.02542
G3 X146.705 Y134.871 I-.917 J-3.394 E.01857
G1 X146.631 Y134.821 E.00273
G3 X146.617 Y134.796 I.249 J-.156 E.0009
; WIPE_START
G1 F9547.055
M204 S6000
G1 X146.588 Y134.642 E-.05958
G1 X146.588 Y132.798 E-.70042
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
G1 X147.847 Y122.144 F42000
G1 Z14.2
G1 E.8 F1800
; FEATURE: Top surface
G1 F2666
M204 S2000
G1 X147.108 Y121.405 E.03212
G1 X146.795 Y121.626
G1 X147.847 Y122.678 E.04571
G1 X147.847 Y123.211
G1 X146.795 Y122.159 E.04571
G1 X146.795 Y122.692
G1 X147.847 Y123.744 E.04571
G1 X147.847 Y124.277
G1 X146.795 Y123.226 E.04571
G1 X146.795 Y123.759
G1 X147.847 Y124.811 E.04571
G1 X147.847 Y125.344
G1 X146.795 Y124.292 E.04571
G1 X146.795 Y124.825
G1 X147.847 Y125.877 E.04571
G1 X147.847 Y126.411
G1 X146.795 Y125.359 E.04571
G1 X146.795 Y125.892
G1 X147.847 Y126.944 E.04571
G1 X147.847 Y127.477
G1 X146.795 Y126.425 E.04571
G1 X146.795 Y126.958
G1 X147.847 Y128.01 E.04571
G1 X147.847 Y128.544
G1 X146.795 Y127.492 E.04571
G1 X146.795 Y128.025
G1 X147.847 Y129.077 E.04571
G1 X147.847 Y129.61
G1 X146.795 Y128.558 E.04571
G1 X146.795 Y129.091
G1 X147.847 Y130.143 E.04571
G1 X147.847 Y130.677
G1 X146.795 Y129.625 E.04571
G1 X146.795 Y130.158
G1 X147.847 Y131.21 E.04571
G1 X147.847 Y131.743
G1 X146.795 Y130.691 E.04571
G1 X146.795 Y131.224
G1 X147.847 Y132.276 E.04571
G1 X147.847 Y132.81
G1 X146.795 Y131.758 E.04571
G1 X146.795 Y132.291
G1 X147.847 Y133.343 E.04571
G1 X147.847 Y133.876
G1 X146.795 Y132.824 E.04571
G1 X146.795 Y133.358
G1 X147.796 Y134.358 E.04349
G1 X147.418 Y134.514
G1 X146.795 Y133.891 E.02707
; WIPE_START
G1 F9547.055
M204 S6000
G1 X147.418 Y134.514 E-.33472
G1 X147.796 Y134.358 E-.15529
G1 X147.293 Y133.856 E-.26999
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.654 Y126.232 Z14.6 F42000
G1 X147.866 Y121.763 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.190288
G1 F2666
M204 S6000
G1 X147.719 Y121.654 E.00219
; LINE_WIDTH: 0.161262
G1 X147.514 Y121.51 E.00242
; OBJECT_ID: 405
; WIPE_START
G1 F15000
G1 X147.719 Y121.654 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X141.137 Y125.518 Z14.6 F42000
M73 P97 R0
G1 X125.426 Y134.739 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2666
M204 S5000
G3 X125.418 Y134.642 I.284 J-.074 E.00302
G1 X125.418 Y121.358 E.40816
G3 X125.581 Y121.126 I.18 J-.047 E.00992
G3 X126.759 Y121.479 I-.451 J3.644 E.03799
G3 X126.884 Y121.61 I-.121 J.242 E.00566
G1 X126.884 Y134.385 E.39254
G1 X126.872 Y134.423 E.00123
G3 X126.129 Y134.764 I-.982 J-1.16 E.02542
G3 X125.535 Y134.871 I-.917 J-3.394 E.01857
G1 X125.462 Y134.821 E.00273
G3 X125.447 Y134.796 I.249 J-.156 E.0009
; WIPE_START
G1 F9547.055
M204 S6000
G1 X125.418 Y134.642 E-.05958
G1 X125.418 Y132.798 E-.70042
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.314 Y125.219 Z14.6 F42000
G1 X126.677 Y122.144 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Top surface
G1 F2666
M204 S2000
G1 X125.938 Y121.405 E.03212
G1 X125.625 Y121.626
G1 X126.677 Y122.678 E.04571
G1 X126.677 Y123.211
G1 X125.625 Y122.159 E.04571
G1 X125.625 Y122.692
G1 X126.677 Y123.744 E.04571
G1 X126.677 Y124.277
G1 X125.625 Y123.226 E.04571
G1 X125.625 Y123.759
G1 X126.677 Y124.811 E.04571
G1 X126.677 Y125.344
G1 X125.625 Y124.292 E.04571
G1 X125.625 Y124.825
G1 X126.677 Y125.877 E.04571
G1 X126.677 Y126.411
G1 X125.625 Y125.359 E.04571
G1 X125.625 Y125.892
G1 X126.677 Y126.944 E.04571
G1 X126.677 Y127.477
G1 X125.625 Y126.425 E.04571
G1 X125.625 Y126.958
G1 X126.677 Y128.01 E.04571
G1 X126.677 Y128.544
G1 X125.625 Y127.492 E.04571
G1 X125.625 Y128.025
G1 X126.677 Y129.077 E.04571
G1 X126.677 Y129.61
G1 X125.625 Y128.558 E.04571
G1 X125.625 Y129.091
G1 X126.677 Y130.143 E.04571
G1 X126.677 Y130.677
G1 X125.625 Y129.625 E.04571
G1 X125.625 Y130.158
G1 X126.677 Y131.21 E.04571
G1 X126.677 Y131.743
G1 X125.625 Y130.691 E.04571
G1 X125.625 Y131.224
G1 X126.677 Y132.276 E.04571
G1 X126.677 Y132.81
G1 X125.625 Y131.758 E.04571
G1 X125.625 Y132.291
G1 X126.677 Y133.343 E.04571
G1 X126.677 Y133.876
G1 X125.625 Y132.824 E.04571
G1 X125.625 Y133.358
G1 X126.626 Y134.358 E.04349
G1 X126.248 Y134.514
G1 X125.625 Y133.891 E.02707
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.248 Y134.514 E-.33472
G1 X126.626 Y134.358 E-.15529
G1 X126.124 Y133.856 E-.26999
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.484 Y126.232 Z14.6 F42000
G1 X126.696 Y121.763 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.190288
G1 F2666
M204 S6000
G1 X126.55 Y121.654 E.00219
; LINE_WIDTH: 0.161262
G1 X126.344 Y121.51 E.00242
; OBJECT_ID: 394
; WIPE_START
G1 F15000
G1 X126.55 Y121.654 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X119.967 Y125.518 Z14.6 F42000
G1 X104.257 Y134.739 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2666
M204 S5000
G3 X104.248 Y134.642 I.284 J-.074 E.00302
G1 X104.248 Y121.358 E.40816
G3 X104.411 Y121.126 I.18 J-.047 E.00992
G3 X105.59 Y121.479 I-.451 J3.644 E.03799
G3 X105.715 Y121.61 I-.121 J.242 E.00566
G1 X105.715 Y134.385 E.39254
G1 X105.702 Y134.423 E.00123
G3 X104.96 Y134.764 I-.982 J-1.16 E.02542
G3 X104.365 Y134.871 I-.917 J-3.394 E.01857
G1 X104.292 Y134.821 E.00273
G3 X104.278 Y134.796 I.249 J-.156 E.0009
; WIPE_START
G1 F9547.055
M204 S6000
G1 X104.248 Y134.642 E-.05958
G1 X104.248 Y132.798 E-.70042
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.144 Y125.219 Z14.6 F42000
G1 X105.507 Y122.144 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Top surface
G1 F2666
M204 S2000
G1 X104.768 Y121.405 E.03212
G1 X104.455 Y121.626
G1 X105.507 Y122.678 E.04571
G1 X105.507 Y123.211
G1 X104.455 Y122.159 E.04571
G1 X104.455 Y122.692
G1 X105.507 Y123.744 E.04571
G1 X105.507 Y124.277
G1 X104.455 Y123.226 E.04571
G1 X104.455 Y123.759
G1 X105.507 Y124.811 E.04571
G1 X105.507 Y125.344
G1 X104.455 Y124.292 E.04571
G1 X104.455 Y124.825
G1 X105.507 Y125.877 E.04571
G1 X105.507 Y126.411
G1 X104.455 Y125.359 E.04571
G1 X104.455 Y125.892
G1 X105.507 Y126.944 E.04571
G1 X105.507 Y127.477
G1 X104.455 Y126.425 E.04571
G1 X104.455 Y126.958
G1 X105.507 Y128.01 E.04571
G1 X105.507 Y128.544
G1 X104.455 Y127.492 E.04571
G1 X104.455 Y128.025
G1 X105.507 Y129.077 E.04571
G1 X105.507 Y129.61
G1 X104.455 Y128.558 E.04571
G1 X104.455 Y129.091
G1 X105.507 Y130.143 E.04571
G1 X105.507 Y130.677
G1 X104.455 Y129.625 E.04571
G1 X104.455 Y130.158
G1 X105.507 Y131.21 E.04571
G1 X105.507 Y131.743
G1 X104.455 Y130.691 E.04571
G1 X104.455 Y131.224
G1 X105.507 Y132.276 E.04571
G1 X105.507 Y132.81
G1 X104.455 Y131.758 E.04571
G1 X104.455 Y132.291
G1 X105.507 Y133.343 E.04571
G1 X105.507 Y133.876
G1 X104.455 Y132.824 E.04571
G1 X104.455 Y133.358
G1 X105.456 Y134.358 E.04349
G1 X105.078 Y134.514
G1 X104.455 Y133.891 E.02707
; WIPE_START
G1 F9547.055
M204 S6000
G1 X105.078 Y134.514 E-.33472
G1 X105.456 Y134.358 E-.15529
G1 X104.954 Y133.856 E-.26999
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.315 Y126.232 Z14.6 F42000
G1 X105.526 Y121.763 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.190288
G1 F2666
M204 S6000
G1 X105.38 Y121.654 E.00219
; LINE_WIDTH: 0.161262
G1 X105.174 Y121.51 E.00242
; CHANGE_LAYER
; Z_HEIGHT: 14.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X105.38 Y121.654 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 394
M625
; layer num/total_layer_count: 72/72
; update layer progress
M73 L72
M991 S0 P71 ;notify layer change
; OBJECT_ID: 416
; start printing object, unique label id: 416
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z14.6 I-.366 J1.161 P1  F42000
G1 X146.718 Y134.673 Z14.6
G1 Z14.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1322
M204 S5000
G3 X146.661 Y134.395 I.438 J-.235 E.00885
G1 X146.661 Y121.606 E.39296
G3 X146.75 Y121.302 I.332 J-.068 E.01014
G1 X146.764 Y121.3 E.00044
G3 X147.307 Y121.601 I-.169 J.944 E.01941
G1 X147.308 Y134.392 E.39304
G1 X147.295 Y134.423 E.00102
G3 X146.769 Y134.694 I-.742 J-.796 E.01842
; WIPE_START
G1 F9547.055
M204 S6000
G1 X146.674 Y134.554 E-.06421
G1 X146.661 Y134.395 E-.06075
G1 X146.661 Y132.724 E-.63504
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
G1 X147.046 Y134.297 F42000
G1 Z14.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.297567
G1 F1322
M204 S6000
G1 X146.984 Y134.261 E.00148
G1 X146.984 Y121.738 E.25986
G1 X146.884 Y121.549 E.00444
; WIPE_START
G1 F14137.242
G1 X146.984 Y121.738 E-.08129
G1 X146.984 Y123.525 E-.67871
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.028 Y131.157 Z14.8 F42000
G1 X147.046 Y134.297 Z14.8
G1 Z14.4
G1 E.8 F1800
; LINE_WIDTH: 0.236527
G1 F1322
M204 S6000
G1 X147.107 Y134.333 E.00112
; OBJECT_ID: 405
; WIPE_START
G1 F15000
G1 X147.046 Y134.297 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 416
M625
; start printing object, unique label id: 405
M624 AgAAAAAAAAA=
M204 S10000
G1 X139.415 Y134.431 Z14.8 F42000
G1 X125.548 Y134.673 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1322
M204 S5000
G3 X125.491 Y134.395 I.438 J-.235 E.00885
G1 X125.491 Y121.606 E.39296
G3 X125.581 Y121.302 I.332 J-.068 E.01014
G1 X125.595 Y121.3 E.00044
G3 X126.137 Y121.601 I-.169 J.944 E.01941
G1 X126.138 Y134.392 E.39304
G1 X126.125 Y134.423 E.00102
G3 X125.599 Y134.694 I-.742 J-.796 E.01842
M204 S10000
G1 X125.876 Y134.297 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.297567
G1 F1322
M204 S6000
G1 X125.815 Y134.261 E.00148
G1 X125.815 Y121.738 E.25986
G1 X125.715 Y121.549 E.00444
; WIPE_START
G1 F14137.242
G1 X125.815 Y121.738 E-.08129
G1 X125.815 Y123.525 E-.67871
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.858 Y131.157 Z14.8 F42000
G1 X125.876 Y134.297 Z14.8
G1 Z14.4
G1 E.8 F1800
; LINE_WIDTH: 0.236527
G1 F1322
M204 S6000
G1 X125.938 Y134.333 E.00112
; OBJECT_ID: 394
; WIPE_START
G1 F15000
G1 X125.876 Y134.297 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 405
M625
; start printing object, unique label id: 394
M624 AQAAAAAAAAA=
M204 S10000
G1 X118.245 Y134.431 Z14.8 F42000
G1 X104.379 Y134.673 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1322
M204 S5000
G3 X104.321 Y134.395 I.438 J-.235 E.00885
G1 X104.321 Y121.606 E.39296
G3 X104.411 Y121.302 I.332 J-.068 E.01014
G1 X104.425 Y121.3 E.00044
G3 X104.967 Y121.601 I-.169 J.944 E.01941
G1 X104.968 Y134.392 E.39304
G1 X104.956 Y134.423 E.00102
G3 X104.429 Y134.694 I-.742 J-.796 E.01842
M204 S10000
G1 X104.706 Y134.297 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.297567
G1 F1322
M204 S6000
G1 X104.645 Y134.261 E.00148
G1 X104.645 Y121.738 E.25986
G1 X104.545 Y121.549 E.00444
; WIPE_START
G1 F14137.242
G1 X104.645 Y121.738 E-.08129
G1 X104.645 Y123.525 E-.67871
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.688 Y131.157 Z14.8 F42000
G1 X104.706 Y134.297 Z14.8
G1 Z14.4
G1 E.8 F1800
; LINE_WIDTH: 0.236527
G1 F1322
M204 S6000
G1 X104.768 Y134.333 E.00112
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F15000
G1 X104.706 Y134.297 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.8 I1.217 J0 P1  F42000
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

