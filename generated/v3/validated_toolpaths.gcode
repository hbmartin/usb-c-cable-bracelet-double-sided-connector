; HEADER_BLOCK_START
; BambuStudio 02.08.02.61
; model printing time: 14m 7s; total estimated time: 20m 25s
; total layer number: 85
; total filament length [mm] : 754.63
; total filament volume [cm^3] : 1815.10
; total filament weight [g] : 2.25
; filament_density: 1.24
; filament_diameter: 1.75
; max_z_height: 17.00
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
M73 P30 R14
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
    G29 A1 X116 Y123.112 I23.9999 J9.77688
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
; layer num/total_layer_count: 1/85
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
; OBJECT_ID: 394
G1 X137.887 Y131.871 F42000
M204 S6000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X128.348 Y130.616 E.35837
G2 X127.648 Y130.616 I-.347 J3.578 E.02611
G1 X118.113 Y131.871 E.35821
G1 X117.256 Y125.363 E.24451
G1 X126.771 Y124.11 E.35744
G3 X128.301 Y124.036 I1.376 J12.537 E.05709
G3 X129.229 Y124.11 I-.374 J10.513 E.03472
G1 X138.742 Y125.363 E.35735
G1 X137.895 Y131.812 E.24228
M204 S6000
G1 X138.282 Y132.376 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X138.206 Y132.374 I-.033 J-.241 E.00284
G1 X128.298 Y131.07 E.37221
G2 X127.7 Y131.07 I-.298 J2.979 E.0223
G1 X117.794 Y132.374 E.37214
G3 X117.718 Y132.376 I-.043 J-.241 E.00284
G1 X116.747 Y124.976 E.27798
G3 X116.814 Y124.96 I.101 J.271 E.00257
G1 X126.716 Y123.656 E.372
G3 X128.31 Y123.579 I1.439 J13.159 E.05951
G3 X129.284 Y123.656 I-.381 J10.938 E.0364
G1 X139.186 Y124.96 E.372
G3 X139.256 Y124.978 I-.043 J.32 E.00267
G1 X138.29 Y132.317 E.27571
; WIPE_START
G1 X138.206 Y132.374 E-.03871
G1 X136.324 Y132.127 E-.72129
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
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


G1 X138.429 Y126.337 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.5
G1 F4742
M204 S500
G1 X137.711 Y125.619 E.03784
G1 X136.967 Y125.521 E.02797
G1 X138.171 Y126.725 E.06344
G1 X138.096 Y127.296 E.02146
G1 X136.222 Y125.423 E.0987
G1 X135.478 Y125.325 E.02797
G1 X138.021 Y127.868 E.13396
G1 X137.946 Y128.439 E.02146
G1 X134.733 Y125.227 E.16922
G1 X133.989 Y125.129 E.02797
G1 X137.871 Y129.011 E.20447
G1 X137.796 Y129.582 E.02146
G1 X133.245 Y125.031 E.23973
M73 P31 R14
G1 X132.5 Y124.933 E.02797
G1 X137.721 Y130.153 E.27499
G1 X137.646 Y130.725 E.02146
G1 X131.756 Y124.835 E.31025
G1 X131.011 Y124.737 E.02797
G1 X137.571 Y131.296 E.34551
G1 X137.552 Y131.436 E.00524
G1 X136.99 Y131.361 E.02114
G1 X130.267 Y124.639 E.35411
G1 X129.522 Y124.541 E.02797
G1 X136.245 Y131.263 E.35411
G1 X135.501 Y131.165 E.02797
G1 X128.788 Y124.453 E.35358
G2 X128.114 Y124.425 I-.876 J13.066 E.02513
G1 X134.756 Y131.067 E.34988
G1 X134.012 Y130.969 E.02797
G1 X127.481 Y124.438 E.34403
G1 X126.886 Y124.49 E.02222
G1 X133.268 Y130.871 E.33613
G1 X132.523 Y130.773 E.02797
G1 X126.312 Y124.563 E.32715
G1 X125.741 Y124.638 E.02146
G1 X131.779 Y130.675 E.31803
G1 X131.034 Y130.577 E.02797
G1 X125.17 Y124.713 E.30891
G1 X124.599 Y124.788 E.02146
G1 X130.29 Y130.479 E.29978
G1 X129.545 Y130.381 E.02797
G1 X124.027 Y124.863 E.29066
G1 X123.456 Y124.939 E.02146
G1 X128.801 Y130.283 E.28154
G2 X128.081 Y130.21 I-.893 J5.175 E.02698
G1 X122.885 Y125.014 E.2737
G1 X122.314 Y125.089 E.02146
G1 X127.472 Y130.247 E.27172
G1 X126.901 Y130.323 E.02146
G1 X121.743 Y125.164 E.27172
G1 X121.171 Y125.239 E.02146
G1 X126.33 Y130.398 E.27172
G1 X125.759 Y130.473 E.02146
G1 X120.6 Y125.315 E.27172
G1 X120.029 Y125.39 E.02146
M73 P31 R13
G1 X125.187 Y130.548 E.27172
G1 X124.616 Y130.623 E.02146
G1 X119.458 Y125.465 E.27172
G1 X118.886 Y125.54 E.02146
G1 X124.045 Y130.699 E.27172
G1 X123.474 Y130.774 E.02146
G1 X118.315 Y125.615 E.27172
G1 X117.744 Y125.691 E.02146
G1 X122.903 Y130.849 E.27172
G1 X122.331 Y130.924 E.02146
G1 X117.781 Y126.374 E.23969
G1 X117.879 Y127.118 E.02797
G1 X121.76 Y130.999 E.20444
G1 X121.189 Y131.075 E.02146
G1 X117.977 Y127.863 E.16919
G1 X118.075 Y128.607 E.02797
G1 X120.618 Y131.15 E.13394
G1 X120.047 Y131.225 E.02146
G1 X118.173 Y129.351 E.09869
G1 X118.271 Y130.096 E.02797
G1 X119.475 Y131.3 E.06344
G1 X118.904 Y131.375 E.02146
G1 X118.13 Y130.601 E.04077
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6300
G1 X118.904 Y131.375 E-.416
G1 X119.475 Y131.3 E-.21893
G1 X119.243 Y131.067 E-.12507
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/85
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S201.45
; open powerlost recovery
M1003 S1
; OBJECT_ID: 394
M204 S10000
G17
G3 Z.6 I-.074 J1.215 P1  F42000
G1 X138.262 Y132.226 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5411
M204 S6000
G1 X128.318 Y130.917 E.33268
G2 X127.682 Y130.917 I-.318 J4.271 E.02114
G1 X117.738 Y132.226 E.33268
G1 X116.803 Y125.117 E.23783
G1 X126.733 Y123.81 E.33224
G3 X128.368 Y123.735 I1.41 J12.821 E.05435
G3 X129.268 Y123.81 I-.54 J11.857 E.02995
G1 X139.197 Y125.117 E.33223
G1 X138.269 Y132.167 E.23586
M204 S250
G1 X138.298 Y132.623 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4800
M204 S5000
G3 X137.613 Y132.536 I.718 J-8.436 E.02119
G1 X128.272 Y131.306 E.28952
G1 F5250.435
G1 X128.18 Y131.296 E.00282
G1 F4800
G2 X127.133 Y131.385 I-.143 J4.56 E.03236
G1 X118.364 Y132.539 E.27178
G1 F5411
G1 X117.769 Y132.617 E.01844
G1 F3715.011
G1 X117.68 Y132.623 E.00274
G1 F3000
G1 X117.612 Y132.624 E.0021
G1 F2760
G1 X117.557 Y132.618 E.00169
G1 F2520
G1 X117.516 Y132.61 E.00128
G1 F2400
G1 X117.488 Y132.602 E.00092
G1 F2160
G1 X117.449 Y132.583 E.00132
G1 F2040
G1 X117.423 Y132.565 E.00097
M73 P32 R13
G1 F1920
G1 X117.402 Y132.544 E.00091
M106 S255
G1 F1800
G1 X117.389 Y132.524 E.00075
M106 S201.45
M106 S255
G1 F1680
G1 X117.38 Y132.5 E.00077
G3 X116.465 Y125.559 I1077.71 J-145.574 E.21511
G1 X116.391 Y124.909 E.02012
M106 S201.45
M106 S255
G1 F1800
G1 X116.404 Y124.879 E.00101
M106 S201.45
G1 F1920
G1 X116.412 Y124.867 E.00044
G1 F2040
G1 X116.445 Y124.834 E.00144
G1 F2280
G1 X116.49 Y124.803 E.00167
G1 F2640
G1 X116.549 Y124.776 E.00201
G1 F2880
G1 X116.645 Y124.748 E.00305
G1 F4800
G1 X117.041 Y124.693 E.01229
G1 X117.349 Y124.65 E.00955
G1 X126.091 Y123.499 E.27093
G3 X128.377 Y123.343 I1.949 J11.704 E.07052
G3 X129.909 Y123.499 I-1.587 J23.144 E.04735
G1 X138.627 Y124.647 E.27018
G1 X138.96 Y124.693 E.01032
G1 X139.356 Y124.748 E.01229
G1 F2880
G1 X139.45 Y124.776 E.00302
G1 F2640
G1 X139.514 Y124.805 E.00215
G1 F2400
G1 X139.539 Y124.821 E.00092
G1 F2160
G1 X139.561 Y124.839 E.00086
G1 F2040
G1 X139.578 Y124.855 E.00072
G1 F1920
G1 X139.6 Y124.887 E.00119
M106 S255
G1 F1800
G1 X139.612 Y124.916 E.00097
M106 S201.45
M106 S255
G1 F1680
G1 X138.701 Y131.889 E.21607
G3 X138.62 Y132.5 I-4.907 J-.343 E.01896
G1 X138.607 Y132.531 E.00103
M106 S201.45
M106 S255
G1 F1800
G1 X138.591 Y132.553 E.00084
M106 S201.45
G1 F1920
G1 X138.567 Y132.573 E.00096
G1 F2040
G1 X138.554 Y132.582 E.00049
G1 F2160
G1 X138.513 Y132.601 E.0014
G1 F2400
G1 X138.483 Y132.611 E.00095
G1 F2520
G1 X138.436 Y132.619 E.00146
G1 F2880
G1 X138.363 Y132.624 E.00225
G1 F3000
G1 X138.357 Y132.624 E.00017
; WIPE_START
M204 S6000
G1 X137.613 Y132.536 E-.28473
G1 X136.373 Y132.373 E-.47528
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
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


G1 X137.44 Y131.953 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42358
G1 F5411
M204 S6000
G1 X138.04 Y131.353 E.02633
G1 X138.122 Y130.733 E.0194
G1 X137.116 Y131.739 E.04415
G1 X136.64 Y131.676 E.01488
G1 X138.204 Y130.113 E.0686
G1 X138.285 Y129.493 E.0194
G1 X136.164 Y131.614 E.09304
G1 X135.688 Y131.551 E.01488
G1 X138.367 Y128.873 E.11749
G1 X138.448 Y128.253 E.0194
G1 X135.213 Y131.489 E.14194
G1 X134.737 Y131.426 E.01488
G1 X138.53 Y127.633 E.16639
G1 X138.612 Y127.013 E.0194
G1 X134.261 Y131.363 E.19084
G1 X133.786 Y131.301 E.01488
G1 X138.693 Y126.393 E.21529
G1 X138.775 Y125.773 E.0194
G1 X133.31 Y131.238 E.23974
G1 X132.834 Y131.175 E.01488
G1 X138.631 Y125.379 E.25429
G1 X138.155 Y125.316 E.01488
G1 X132.358 Y131.113 E.25429
G1 X131.883 Y131.05 E.01488
G1 X137.68 Y125.253 E.25429
G1 X137.204 Y125.191 E.01488
G1 X131.407 Y130.988 E.25429
G1 X130.931 Y130.925 E.01488
G1 X136.728 Y125.128 E.25429
G1 X136.252 Y125.066 E.01488
G1 X130.456 Y130.862 E.25429
G1 X129.98 Y130.8 E.01488
G1 X135.777 Y125.003 E.25429
G1 X135.301 Y124.94 E.01488
G1 X129.504 Y130.737 E.25429
G1 X129.028 Y130.674 E.01488
G1 X134.825 Y124.878 E.25429
G1 X134.35 Y124.815 E.01488
G1 X128.553 Y130.612 E.25429
G2 X128.06 Y130.566 I-.598 J3.759 E.01536
G1 X133.874 Y124.752 E.25503
G1 X133.398 Y124.69 E.01488
G1 X127.48 Y130.607 E.25959
G1 X126.861 Y130.689 E.01939
G1 X132.922 Y124.627 E.26592
G1 X132.447 Y124.565 E.01488
G1 X126.241 Y130.771 E.27224
G1 X125.621 Y130.852 E.01939
G1 X131.971 Y124.502 E.27857
G1 X131.495 Y124.439 E.01488
G1 X125.001 Y130.934 E.2849
G1 X124.381 Y131.015 E.01939
G1 X131.02 Y124.377 E.29122
G1 X130.544 Y124.314 E.01488
G1 X123.761 Y131.097 E.29755
G1 X123.141 Y131.178 E.01939
G1 X130.068 Y124.251 E.30387
G1 X129.592 Y124.189 E.01488
G1 X122.521 Y131.26 E.3102
G1 X121.901 Y131.342 E.01939
G1 X129.112 Y124.131 E.3163
G1 X128.615 Y124.09 E.01546
G1 X121.281 Y131.423 E.3217
G1 X120.662 Y131.505 E.01939
G1 X128.098 Y124.068 E.32622
G2 X127.556 Y124.072 I-.248 J3.148 E.01685
G1 X120.042 Y131.586 E.32962
G1 X119.422 Y131.668 E.01939
G1 X126.966 Y124.124 E.33093
G2 X126.356 Y124.196 I.517 J7.037 E.01906
G1 X118.802 Y131.749 E.33137
G1 X118.182 Y131.831 E.01939
G1 X125.736 Y124.277 E.33136
G1 X125.116 Y124.359 E.0194
G1 X117.979 Y131.496 E.31309
G1 X117.916 Y131.02 E.01488
G1 X124.496 Y124.441 E.28864
G1 X123.876 Y124.522 E.0194
G1 X117.853 Y130.545 E.26419
G1 X117.791 Y130.069 E.01488
G1 X123.256 Y124.604 E.23974
G1 X122.636 Y124.685 E.0194
G1 X117.728 Y129.593 E.21529
G1 X117.665 Y129.118 E.01488
G1 X122.016 Y124.767 E.19085
G1 X121.396 Y124.849 E.0194
G1 X117.603 Y128.642 E.1664
G1 X117.54 Y128.166 E.01488
G1 X120.776 Y124.93 E.14195
G1 X120.156 Y125.012 E.0194
G1 X117.477 Y127.69 E.1175
G1 X117.415 Y127.215 E.01488
G1 X119.536 Y125.094 E.09305
G1 X118.916 Y125.175 E.0194
G1 X117.352 Y126.739 E.0686
G1 X117.29 Y126.263 E.01488
G1 X118.296 Y125.257 E.04415
G1 X117.676 Y125.338 E.0194
G1 X117.076 Y125.939 E.02634
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9457.259
G1 X117.676 Y125.338 E-.32265
G1 X118.296 Y125.257 E-.23762
G1 X117.924 Y125.628 E-.19973
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/85
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z.8 I-.375 J1.158 P1  F42000
G1 X138.376 Y132.254 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5013
M204 S6000
G1 X128.31 Y130.929 E.33677
G2 X127.683 Y130.93 I-.309 J3.312 E.02084
G1 X117.624 Y132.254 E.33656
G1 X116.685 Y125.12 E.23868
G1 X126.731 Y123.797 E.33612
G3 X128.422 Y123.723 I1.412 J12.854 E.05619
G3 X129.269 Y123.797 I-.431 J9.786 E.02822
G1 X139.315 Y125.12 E.33612
G1 X138.384 Y132.194 E.23669
M204 S250
G1 X138.44 Y132.658 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5013
M204 S5000
G1 X128.268 Y131.319 E.31527
G2 X127.73 Y131.319 I-.267 J2.789 E.01655
G1 X117.55 Y132.659 E.31549
G1 X117.532 Y132.661 E.00058
G1 X117.479 Y132.664 E.00161
G1 X117.446 Y132.662 E.00101
G1 X117.413 Y132.656 E.00104
G1 X117.382 Y132.647 E.00099
G1 X117.366 Y132.64 E.00056
G1 X117.334 Y132.622 E.00111
G1 X117.323 Y132.613 E.00043
G1 X117.301 Y132.591 E.00094
G1 X117.276 Y132.554 E.00138
G3 X117.261 Y132.497 I.176 J-.08 E.00182
G1 X116.349 Y125.573 E.21459
G3 X116.269 Y124.944 I4.07 J-.838 E.01951
G1 X116.283 Y124.883 E.00191
G1 X116.303 Y124.848 E.00124
G1 X116.319 Y124.829 E.00077
G1 X116.331 Y124.818 E.0005
G1 X116.363 Y124.795 E.00122
G1 X116.409 Y124.772 E.00157
G1 X116.452 Y124.758 E.00139
G1 X116.515 Y124.747 E.00197
G1 X116.515 Y124.747 E.00001
G1 X126.684 Y123.408 E.31515
G3 X128.439 Y123.331 I1.464 J13.376 E.05402
G3 X129.316 Y123.408 I-.446 J10.14 E.02706
G1 X139.485 Y124.747 E.31515
G1 X139.485 Y124.747 E.00001
G1 X139.548 Y124.758 E.00197
G1 X139.591 Y124.772 E.00138
G1 X139.637 Y124.795 E.00159
G1 X139.669 Y124.818 E.0012
G1 X139.681 Y124.829 E.00051
G1 X139.697 Y124.848 E.00077
G1 X139.717 Y124.883 E.00125
G1 X139.73 Y124.925 E.00134
G1 X139.731 Y124.956 E.00095
G3 X138.818 Y131.903 I-1078.785 J-138.328 E.21528
G1 X138.739 Y132.497 E.01844
G3 X138.699 Y132.591 I-.197 J-.029 E.00319
G1 X138.677 Y132.613 E.00094
G1 X138.666 Y132.622 E.00044
G1 X138.634 Y132.64 E.00111
G1 X138.618 Y132.647 E.00056
G1 X138.588 Y132.656 E.00096
G1 X138.553 Y132.662 E.00107
G1 X138.521 Y132.664 E.001
G1 X138.5 Y132.663 E.00063
; WIPE_START
G1 F9289.183
M204 S6000
G1 X136.517 Y132.402 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
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
G1 X139.041 Y125.948 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42708
G1 F5013
M204 S6000
G1 X138.433 Y125.34 E.02691
G1 X137.808 Y125.257 E.01975
G1 X138.827 Y126.277 E.04512
G1 X138.764 Y126.757 E.01516
G1 X137.182 Y125.175 E.07002
G1 X136.556 Y125.093 E.01975
G1 X138.7 Y127.237 E.09492
G1 X138.637 Y127.717 E.01516
G1 X135.931 Y125.01 E.11982
G1 X135.305 Y124.928 E.01975
G1 X138.574 Y128.197 E.14472
G1 X138.511 Y128.677 E.01516
G1 X134.679 Y124.846 E.16962
G1 X134.054 Y124.763 E.01975
G1 X138.448 Y129.157 E.19452
G1 X138.384 Y129.637 E.01516
G1 X133.428 Y124.681 E.21942
G1 X132.802 Y124.599 E.01975
G1 X138.321 Y130.117 E.24432
M73 P33 R13
G1 X138.258 Y130.597 E.01516
G1 X132.177 Y124.516 E.26922
G1 X131.551 Y124.434 E.01975
G1 X138.195 Y131.077 E.29412
G1 X138.132 Y131.558 E.01516
G1 X130.925 Y124.351 E.31902
G1 X130.3 Y124.269 E.01975
G1 X137.883 Y131.853 E.33573
G1 X137.258 Y131.77 E.01975
G1 X129.674 Y124.187 E.33574
G2 X129.057 Y124.113 I-1.153 J7.056 E.01945
G1 X136.632 Y131.688 E.33534
G1 X136.007 Y131.606 E.01975
G1 X128.462 Y124.061 E.33401
G2 X127.914 Y124.056 I-.3 J3.108 E.01718
G1 X135.381 Y131.523 E.33057
G1 X134.755 Y131.441 E.01975
G1 X127.388 Y124.074 E.32614
G1 X126.889 Y124.118 E.0157
G1 X134.13 Y131.359 E.32056
G1 X133.504 Y131.276 E.01975
G1 X126.404 Y124.176 E.31432
G1 X125.924 Y124.24 E.01516
G1 X132.878 Y131.194 E.30788
G1 X132.253 Y131.112 E.01975
G1 X125.444 Y124.303 E.30143
G1 X124.964 Y124.366 E.01516
G1 X131.627 Y131.029 E.29499
G1 X131.002 Y130.947 E.01975
G1 X124.484 Y124.429 E.28855
G1 X124.004 Y124.492 E.01516
G1 X130.376 Y130.865 E.28211
G1 X129.75 Y130.782 E.01975
G1 X123.524 Y124.556 E.27566
G1 X123.044 Y124.619 E.01516
G1 X129.125 Y130.7 E.26922
G1 X128.499 Y130.618 E.01975
G1 X122.563 Y124.682 E.26278
G1 X122.083 Y124.745 E.01516
G1 X127.918 Y130.58 E.25832
G2 X127.423 Y130.628 I.121 J3.853 E.0156
G1 X121.603 Y124.808 E.25764
G1 X121.123 Y124.872 E.01516
G1 X126.943 Y130.691 E.25763
G1 X126.463 Y130.754 E.01516
G1 X120.643 Y124.935 E.25763
G1 X120.163 Y124.998 E.01516
G1 X125.983 Y130.817 E.25763
G1 X125.502 Y130.881 E.01516
G1 X119.683 Y125.061 E.25763
G1 X119.203 Y125.124 E.01516
G1 X125.022 Y130.944 E.25763
G1 X124.542 Y131.007 E.01516
G1 X118.723 Y125.188 E.25763
G1 X118.243 Y125.251 E.01516
G1 X124.062 Y131.07 E.25763
G1 X123.582 Y131.133 E.01516
G1 X117.763 Y125.314 E.25763
G1 X117.283 Y125.377 E.01516
G1 X123.102 Y131.197 E.25763
G1 X122.622 Y131.26 E.01516
G1 X117.103 Y125.741 E.24434
G1 X117.185 Y126.366 E.01975
G1 X122.142 Y131.323 E.21944
G1 X121.662 Y131.386 E.01516
G1 X117.267 Y126.992 E.19454
G1 X117.35 Y127.617 E.01975
G1 X121.182 Y131.449 E.16964
G1 X120.701 Y131.512 E.01516
G1 X117.432 Y128.243 E.14474
G1 X117.514 Y128.869 E.01975
G1 X120.221 Y131.576 E.11984
G1 X119.741 Y131.639 E.01516
G1 X117.597 Y129.494 E.09494
G1 X117.679 Y130.12 E.01975
G1 X119.261 Y131.702 E.07004
G1 X118.781 Y131.765 E.01516
G1 X117.762 Y130.746 E.04513
G1 X117.844 Y131.371 E.01975
G1 X118.452 Y131.98 E.02693
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9371.095
G1 X117.844 Y131.371 E-.32689
G1 X117.762 Y130.746 E-.2398
G1 X118.121 Y131.105 E-.19331
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/85
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z1 I-.069 J1.215 P1  F42000
G1 X138.428 Y132.261 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3795
M204 S6000
G1 X128.316 Y130.93 E.33831
G2 X127.684 Y130.93 I-.316 J4.23 E.021
G1 X117.572 Y132.261 E.3383
G1 X116.633 Y125.127 E.2387
G1 X126.731 Y123.797 E.33785
G3 X128.422 Y123.723 I1.416 J12.944 E.05618
G3 X129.269 Y123.797 I-.441 J9.906 E.02823
G1 X139.367 Y125.127 E.33784
G1 X138.435 Y132.201 E.23671
M204 S250
G1 X138.564 Y132.674 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3795
M204 S5000
G1 X128.27 Y131.319 E.31905
G2 X127.73 Y131.319 I-.27 J3.636 E.01659
G1 X117.363 Y132.673 E.32127
G3 X117.307 Y132.653 I.041 J-.199 E.00183
G1 X117.291 Y132.643 E.00059
G1 X117.256 Y132.612 E.00143
G3 X117.209 Y132.505 I.2 J-.151 E.00363
G1 X116.297 Y125.58 E.21461
G3 X116.217 Y124.947 I4.227 J-.859 E.01962
G1 X116.229 Y124.886 E.00191
G1 X116.26 Y124.833 E.00191
G1 X116.275 Y124.818 E.00062
G1 X116.282 Y124.811 E.00033
G3 X116.396 Y124.762 I.159 J.214 E.00383
G1 X126.684 Y123.408 E.31886
G3 X128.439 Y123.331 I1.468 J13.46 E.05401
G3 X129.316 Y123.408 I-.456 J10.258 E.02706
G1 X139.604 Y124.762 E.31886
G3 X139.725 Y124.819 I-.023 J.208 E.00418
G1 X139.74 Y124.833 E.00062
G1 X139.771 Y124.887 E.00193
G1 X139.783 Y124.955 E.00212
G3 X138.869 Y131.91 I-630.56 J-79.311 E.21554
G3 X138.784 Y132.539 I-4.267 J-.259 E.01953
G3 X138.744 Y132.612 I-.201 J-.063 E.00256
G1 X138.71 Y132.643 E.00142
G1 X138.693 Y132.652 E.00059
G3 X138.625 Y132.675 I-.097 J-.18 E.00222
; WIPE_START
G1 F9547.055
M204 S6000
G1 X136.642 Y132.415 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X137.588 Y131.985 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.43349
G1 F3795
M204 S6000
G1 X138.21 Y131.363 E.028
G1 X138.293 Y130.727 E.02042
G1 X137.251 Y131.77 E.04693
G1 X136.763 Y131.706 E.01567
G1 X138.377 Y130.091 E.07267
G1 X138.461 Y129.455 E.02042
G1 X136.275 Y131.641 E.0984
G1 X135.787 Y131.577 E.01567
G1 X138.545 Y128.819 E.12414
G1 X138.628 Y128.183 E.02042
G1 X135.298 Y131.513 E.14988
G1 X134.81 Y131.449 E.01567
G1 X138.712 Y127.547 E.17562
G1 X138.796 Y126.911 E.02042
G1 X134.322 Y131.384 E.20135
G1 X133.834 Y131.32 E.01567
G1 X138.88 Y126.275 E.22709
G1 X138.963 Y125.639 E.02042
G1 X133.346 Y131.256 E.25283
G1 X132.858 Y131.192 E.01567
G1 X138.678 Y125.372 E.26194
G1 X138.19 Y125.308 E.01567
G1 X132.37 Y131.127 E.26194
G1 X132.022 Y131.082 E.01117
G1 X132.046 Y130.899 E.00587
G1 X137.702 Y125.243 E.25455
G1 X137.213 Y125.179 E.01567
M73 P34 R13
G1 X132.13 Y130.263 E.22881
G1 X132.214 Y129.627 E.02042
G1 X136.725 Y125.115 E.20307
G1 X136.237 Y125.051 E.01567
G1 X132.297 Y128.991 E.17734
G1 X132.381 Y128.354 E.02042
G1 X135.749 Y124.986 E.1516
G1 X135.261 Y124.922 E.01567
G1 X132.465 Y127.718 E.12586
G1 X132.549 Y127.082 E.02042
G1 X134.773 Y124.858 E.10012
G1 X134.285 Y124.794 E.01567
G1 X132.632 Y126.446 E.07438
G1 X132.716 Y125.81 E.02042
G1 X133.797 Y124.729 E.04865
G1 X133.309 Y124.665 E.01567
G1 X132.603 Y125.371 E.03178
M204 S10000
G1 X132.244 Y126.395 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3795
M204 S6000
G1 X132.456 Y124.78 E.05401
G1 X132.212 Y124.536 E.01146
G1 X131.551 Y124.449 E.02211
G1 X125.079 Y130.921 E.30364
G3 X128 Y130.56 I4.231 J22.208 E.09772
G3 X130.921 Y130.921 I-1.31 J22.57 E.09772
G1 X124.449 Y124.449 E.30364
G1 X123.788 Y124.536 E.02211
G1 X123.544 Y124.78 E.01146
G1 X123.756 Y126.395 E.05401
M204 S10000
G1 X123.247 Y131.349 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42051
G1 F3795
M204 S6000
G1 X123.924 Y130.672 E.02948
G1 X123.862 Y130.2 E.01464
G1 X122.829 Y131.233 E.04495
G1 X122.214 Y131.314 E.01908
G1 X123.8 Y129.728 E.06901
G1 X123.738 Y129.256 E.01464
G1 X121.599 Y131.395 E.09307
G1 X120.984 Y131.476 E.01908
G1 X123.675 Y128.784 E.11712
G1 X123.613 Y128.312 E.01464
G1 X120.369 Y131.557 E.14118
G1 X119.754 Y131.638 E.01908
G1 X123.551 Y127.84 E.16523
G1 X123.489 Y127.369 E.01464
G1 X119.139 Y131.719 E.18929
G1 X118.524 Y131.8 E.01908
G1 X123.427 Y126.897 E.21334
G1 X123.365 Y126.425 E.01464
G1 X117.909 Y131.881 E.2374
G1 X117.859 Y131.887 E.00155
G1 X117.802 Y131.454 E.01346
G1 X123.303 Y125.953 E.23935
G1 X123.241 Y125.481 E.01464
G1 X117.74 Y130.982 E.23935
G1 X117.678 Y130.51 E.01464
G1 X123.179 Y125.009 E.23935
G1 X123.126 Y124.608 E.01245
G1 X123.034 Y124.62 E.00286
G1 X117.616 Y130.038 E.23575
G1 X117.554 Y129.566 E.01464
G1 X122.419 Y124.701 E.2117
G1 X121.804 Y124.782 E.01908
G1 X117.492 Y129.094 E.18764
G1 X117.429 Y128.622 E.01464
G1 X121.189 Y124.863 E.16359
G1 X120.574 Y124.944 E.01908
G1 X117.367 Y128.15 E.13953
G1 X117.305 Y127.679 E.01464
G1 X119.959 Y125.025 E.11547
G1 X119.344 Y125.106 E.01908
G1 X117.243 Y127.207 E.09142
G1 X117.181 Y126.735 E.01464
G1 X118.729 Y125.187 E.06736
G1 X118.114 Y125.268 E.01908
G1 X117.119 Y126.263 E.04331
G1 X117.057 Y125.791 E.01464
G1 X117.696 Y125.152 E.02783
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9534.15
G1 X117.057 Y125.791 E-.34368
G1 X117.119 Y126.263 E-.18086
G1 X117.557 Y125.825 E-.23546
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/85
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z1.2 I-.439 J1.135 P1  F42000
G1 X132.014 Y131.417 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4289
M204 S6000
G1 X128.31 Y130.929 E.12391
G2 X127.69 Y130.929 I-.31 J2.805 E.02063
G1 X123.986 Y131.417 E.12391
G1 X123.047 Y124.282 E.2387
G1 X126.731 Y123.797 E.12325
G3 X128.422 Y123.723 I1.419 J13.016 E.05619
G3 X129.269 Y123.797 I-.427 J9.738 E.02822
G1 X132.953 Y124.282 E.12326
G1 X132.022 Y131.357 E.23671
; WIPE_START
G1 F8843.478
G1 X130.035 Y131.128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.545 Y132.489 Z1.4 F42000
G1 X138.576 Y132.676 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4289
M204 S5000
G1 X128.268 Y131.319 E.31947
G2 X127.732 Y131.319 I-.268 J2.342 E.01649
G1 X117.354 Y132.674 E.3216
G3 X117.203 Y132.506 I.041 J-.189 E.00744
G1 X116.213 Y124.986 E.23306
G1 X116.214 Y124.916 E.00215
G1 X116.254 Y124.833 E.00283
G3 X116.383 Y124.764 I.153 J.133 E.00459
G1 X126.684 Y123.408 E.31925
G3 X128.439 Y123.331 I1.472 J13.541 E.05402
G3 X129.316 Y123.408 I-.441 J10.084 E.02706
G1 X139.617 Y124.764 E.31925
G3 X139.787 Y124.986 I-.02 J.192 E.00961
G1 X138.797 Y132.506 E.23305
G3 X138.636 Y132.675 I-.193 J-.022 E.00773
; WIPE_START
G1 F9547.055
M204 S6000
G1 X136.653 Y132.416 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X139.027 Y124.896 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Top surface
G1 F4289
M204 S2000
G1 X139.525 Y125.393 E.02163
G1 X139.463 Y125.865
G1 X138.413 Y124.815 E.04562
G1 X137.799 Y124.734
G1 X139.401 Y126.336 E.06961
G1 X139.338 Y126.807
G1 X137.185 Y124.653 E.0936
G1 X136.57 Y124.572
G1 X139.276 Y127.278 E.11759
G1 X139.214 Y127.749
G1 X135.956 Y124.491 E.14158
G1 X135.342 Y124.41
G1 X139.152 Y128.221 E.16557
G1 X139.09 Y128.692
G1 X134.728 Y124.33 E.18956
G1 X134.114 Y124.249
G1 X139.028 Y129.163 E.21355
G1 X138.966 Y129.634
G1 X133.5 Y124.168 E.23754
G1 X133.166 Y124.367
G1 X138.904 Y130.105 E.24935
G1 X138.842 Y130.577
G1 X133.147 Y124.882 E.24748
G1 X133.085 Y125.353
G1 X138.78 Y131.048 E.24748
G1 X138.718 Y131.519
G1 X133.023 Y125.824 E.24748
G1 X132.961 Y126.295
G1 X138.656 Y131.99 E.24748
G1 X138.594 Y132.462
G1 X132.899 Y126.766 E.24748
G1 X132.837 Y127.238
G1 X137.989 Y132.389 E.22387
G1 X137.374 Y132.309
G1 X132.775 Y127.709 E.19988
G1 X132.713 Y128.18
G1 X136.76 Y132.228 E.17589
G1 X136.146 Y132.147
G1 X132.651 Y128.651 E.1519
G1 X132.589 Y129.123
G1 X135.532 Y132.066 E.12791
G1 X134.918 Y131.985
G1 X132.527 Y129.594 E.10392
G1 X132.465 Y130.065
G1 X134.304 Y131.904 E.07993
G1 X133.69 Y131.823
G1 X132.403 Y130.536 E.05594
G1 X132.341 Y131.007
G1 X133.076 Y131.743 E.03194
; WIPE_START
G1 F9547.055
M204 S6000
G1 X132.341 Y131.007 E-.39506
G1 X132.403 Y130.536 E-.18061
G1 X132.746 Y130.879 E-.18432
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.884 Y127.536 Z1.4 F42000
G1 X123.686 Y126.465 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4289
M204 S6000
G1 X123.473 Y124.851 E.05401
G1 X123.786 Y124.538 E.01469
G1 X124.452 Y124.452 E.02226
G1 X130.921 Y130.921 E.30351
G2 X128 Y130.56 I-4.124 J21.367 E.09772
G2 X125.079 Y130.921 I1.202 J21.728 E.09772
G1 X131.551 Y124.449 E.30364
G1 X132.212 Y124.536 E.02211
G1 X132.527 Y124.851 E.01478
G1 X132.314 Y126.465 E.05401
; WIPE_START
G1 F8843.478
G1 X132.527 Y124.851 E-.61876
G1 X132.264 Y124.588 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.632 Y124.674 Z1.4 F42000
G1 X122.828 Y124.695 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F4289
M204 S2000
G1 X122.325 Y124.191 E.02189
M73 P35 R13
G1 X121.853 Y124.253
G1 X122.909 Y125.309 E.04588
G1 X122.99 Y125.923
G1 X121.382 Y124.315 E.06987
G1 X120.911 Y124.377
G1 X123.071 Y126.537 E.09386
G1 X123.152 Y127.151
G1 X120.44 Y124.439 E.11785
G1 X119.968 Y124.501
G1 X123.233 Y127.765 E.14184
G1 X123.313 Y128.379
G1 X119.497 Y124.563 E.16583
G1 X119.026 Y124.625
G1 X123.394 Y128.994 E.18982
G1 X123.475 Y129.608
G1 X118.555 Y124.687 E.21381
G1 X118.084 Y124.749
G1 X123.556 Y130.222 E.2378
G1 X123.637 Y130.836
G1 X117.612 Y124.811 E.26179
G1 X117.141 Y124.873
G1 X123.774 Y131.506 E.28821
G1 X123.413 Y131.678
G1 X116.67 Y124.935 E.29301
G1 X116.457 Y125.256
G1 X122.942 Y131.74 E.28177
G1 X122.47 Y131.802
G1 X116.538 Y125.87 E.25778
G1 X116.619 Y126.484
G1 X121.999 Y131.864 E.23379
G1 X121.528 Y131.926
G1 X116.7 Y127.098 E.2098
G1 X116.781 Y127.713
G1 X121.057 Y131.988 E.18581
G1 X120.585 Y132.051
G1 X116.862 Y128.327 E.16182
G1 X116.942 Y128.941
G1 X120.114 Y132.113 E.13783
G1 X119.643 Y132.175
G1 X117.023 Y129.555 E.11384
G1 X117.104 Y130.169
G1 X119.172 Y132.237 E.08985
G1 X118.701 Y132.299
G1 X117.185 Y130.783 E.06586
G1 X117.266 Y131.397
G1 X118.229 Y132.361 E.04187
G1 X117.758 Y132.423
G1 X117.347 Y132.011 E.01788
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.055
M204 S6000
G1 X117.758 Y132.423 E-.22108
G1 X118.229 Y132.361 E-.18061
G1 X117.563 Y131.694 E-.35831
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/85
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z1.4 I.018 J1.217 P1  F42000
G1 X132.485 Y131.479 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1813
M204 S6000
G1 X128.317 Y130.93 E.13947
G2 X127.683 Y130.93 I-.317 J4.253 E.02104
G1 X123.515 Y131.479 E.13947
G1 X122.575 Y124.344 E.2387
G1 X126.731 Y123.797 E.13903
G3 X128.422 Y123.723 I1.423 J13.103 E.05618
G3 X129.269 Y123.797 I-.426 J9.738 E.02823
G1 X133.425 Y124.344 E.13903
G1 X132.493 Y131.419 E.23671
M204 S250
G1 X132.873 Y131.542 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1813
M204 S5000
G1 X133.732 Y125.013 E.20234
G1 X133.815 Y124.384 E.01951
G1 X139.387 Y125.117 E.17269
G1 X138.444 Y132.275 E.22185
G1 X132.932 Y131.55 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X133.175 Y129.564 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.686 Y131.038 Z1.6 F42000
G1 X123.127 Y131.542 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F1813
M204 S5000
G1 X117.556 Y132.275 E.17269
G1 X116.613 Y125.117 E.22185
G1 X117.144 Y125.047 E.01644
G1 X122.185 Y124.384 E.15625
G1 X123.12 Y131.482 E.22001
; WIPE_START
G1 F9547.055
M204 S6000
G1 X121.14 Y131.764 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.762 Y132.163 Z1.6 F42000
G1 X138.576 Y132.676 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F1813
M204 S5000
G1 X128.27 Y131.319 E.31939
G2 X127.73 Y131.319 I-.27 J3.666 E.01662
G1 X117.354 Y132.674 E.32152
G3 X117.203 Y132.505 I.041 J-.189 E.00745
G1 X116.214 Y124.916 E.23518
G3 X116.383 Y124.764 I.187 J.039 E.00746
G1 X126.684 Y123.408 E.31925
G3 X128.439 Y123.331 I1.476 J13.629 E.05401
G3 X129.316 Y123.408 I-.44 J10.082 E.02707
G1 X139.617 Y124.764 E.31925
G3 X139.787 Y124.986 I-.02 J.192 E.00961
G1 X138.797 Y132.506 E.23306
G3 X138.636 Y132.675 I-.193 J-.022 E.00773
; WIPE_START
G1 F9547.055
M204 S6000
G1 X136.653 Y132.416 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X132.738 Y126.889 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1813
M204 S6000
G1 X132.951 Y125.275 E.05401
G1 X132.212 Y124.536 E.03467
G1 X131.551 Y124.449 E.02211
G1 X125.079 Y130.921 E.30364
G3 X128 Y130.56 I4.238 J22.26 E.09772
G3 X130.921 Y130.921 I-1.316 J22.621 E.09772
G1 X124.452 Y124.452 E.30348
G1 X123.785 Y124.539 E.02231
G1 X123.049 Y125.275 E.03454
G1 X123.262 Y126.889 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X123.049 Y125.275 E-.61876
G1 X123.312 Y125.012 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/85
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z1.6 I-.701 J.995 P1  F42000
G1 X132.485 Y131.479 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1808
M204 S6000
G1 X128.31 Y130.929 E.1397
G2 X127.69 Y130.929 I-.31 J2.802 E.02061
G1 X123.515 Y131.479 E.1397
G1 X122.575 Y124.344 E.2387
G1 X126.731 Y123.797 E.13903
G3 X128.422 Y123.723 I1.426 J13.183 E.05618
G3 X129.269 Y123.797 I-.426 J9.737 E.02823
G1 X133.425 Y124.344 E.13903
G1 X132.493 Y131.419 E.23671
M204 S250
G1 X132.873 Y131.542 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1808
M204 S5000
G1 X133.51 Y126.699 E.1501
G1 X133.815 Y124.384 E.07175
G1 X139.387 Y125.117 E.17269
G1 X138.444 Y132.275 E.22185
G1 X132.932 Y131.55 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X133.169 Y129.564 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P36 R13
G1 X125.68 Y131.039 Z1.8 F42000
G1 X123.127 Y131.542 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F1808
M204 S5000
G1 X117.556 Y132.275 E.17269
G1 X116.613 Y125.117 E.22185
G1 X118.432 Y124.878 E.05638
G1 X122.185 Y124.384 E.1163
G1 X123.12 Y131.482 E.22001
; WIPE_START
G1 F9547.055
M204 S6000
G1 X121.14 Y131.764 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.762 Y132.163 Z1.8 F42000
G1 X138.576 Y132.676 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F1808
M204 S5000
G1 X128.268 Y131.319 E.3195
G2 X127.732 Y131.319 I-.268 J2.339 E.01648
G1 X117.354 Y132.674 E.32161
G3 X117.203 Y132.505 I.041 J-.189 E.00744
G1 X116.213 Y124.986 E.23304
G1 X116.214 Y124.915 E.00217
G1 X116.254 Y124.832 E.00283
G3 X116.383 Y124.764 I.153 J.133 E.00458
G1 X126.684 Y123.408 E.31925
G3 X128.439 Y123.331 I1.479 J13.715 E.05401
G3 X129.316 Y123.408 I-.44 J10.081 E.02707
G1 X139.617 Y124.764 E.31925
G3 X139.787 Y124.986 I-.025 J.195 E.00955
G1 X138.797 Y132.506 E.23306
G3 X138.636 Y132.675 I-.193 J-.022 E.00771
; WIPE_START
G1 F9547.055
M204 S6000
G1 X136.653 Y132.416 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X123.262 Y126.889 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1808
M204 S6000
G1 X123.049 Y125.275 E.05401
G1 X123.785 Y124.539 E.03454
G1 X124.452 Y124.452 E.02231
G1 X130.921 Y130.921 E.30348
G2 X128 Y130.56 I-4.119 J21.327 E.09772
G2 X125.079 Y130.921 I1.197 J21.688 E.09772
G1 X131.551 Y124.449 E.30364
G1 X132.212 Y124.536 E.02211
G1 X132.951 Y125.275 E.03467
G1 X132.738 Y126.889 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
M73 P36 R12
G1 F8843.478
G1 X132.951 Y125.275 E-.61876
G1 X132.688 Y125.012 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/85
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z1.8 I-1.216 J-.038 P1  F42000
G1 X132.485 Y131.479 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1810
M204 S6000
G1 X128.31 Y130.929 E.1397
G2 X127.69 Y130.929 I-.31 J2.801 E.02061
G1 X123.515 Y131.479 E.1397
G1 X122.575 Y124.344 E.2387
G1 X126.731 Y123.797 E.13903
G3 X128.422 Y123.723 I1.43 J13.277 E.05618
G3 X129.269 Y123.797 I-.426 J9.737 E.02823
G1 X133.425 Y124.344 E.13903
G1 X132.493 Y131.419 E.23671
M204 S250
G1 X132.873 Y131.542 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1810
M204 S5000
G1 X133.288 Y128.384 E.09787
G1 X133.815 Y124.384 E.12398
G1 X139.387 Y125.117 E.17269
G1 X138.444 Y132.275 E.22185
G1 X132.932 Y131.55 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X133.156 Y129.562 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.668 Y131.04 Z2 F42000
G1 X123.127 Y131.542 Z2
G1 Z1.6
G1 E.8 F1800
G1 F1810
M204 S5000
G1 X117.556 Y132.275 E.17269
G1 X116.613 Y125.117 E.22185
G1 X119.721 Y124.708 E.09633
G1 X122.185 Y124.384 E.07636
G1 X123.12 Y131.482 E.22001
; WIPE_START
G1 F9547.055
M204 S6000
G1 X121.14 Y131.764 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.762 Y132.163 Z2 F42000
G1 X138.578 Y132.676 Z2
G1 Z1.6
G1 E.8 F1800
G1 F1810
M204 S5000
G1 X128.268 Y131.319 E.31955
G2 X127.732 Y131.319 I-.268 J2.339 E.01648
G1 X117.355 Y132.674 E.3216
G3 X117.203 Y132.506 I.041 J-.19 E.00745
G1 X116.213 Y124.986 E.23306
G1 X116.229 Y124.872 E.00354
G3 X116.383 Y124.764 I.176 J.088 E.00603
G1 X126.684 Y123.408 E.31925
G3 X128.439 Y123.331 I1.483 J13.805 E.05401
G3 X129.316 Y123.408 I-.44 J10.081 E.02707
G1 X139.617 Y124.764 E.31925
G3 X139.787 Y124.986 I-.022 J.193 E.00959
G1 X138.797 Y132.506 E.23306
G3 X138.638 Y132.675 I-.193 J-.022 E.00766
; WIPE_START
G1 F9547.055
M204 S6000
G1 X136.655 Y132.416 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X132.738 Y126.889 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
M73 P37 R12
G1 F1810
M204 S6000
G1 X132.951 Y125.275 E.05401
G1 X132.212 Y124.536 E.03467
G1 X131.551 Y124.449 E.02211
G1 X125.079 Y130.921 E.30364
G3 X128 Y130.56 I4.119 J21.327 E.09772
G3 X130.921 Y130.921 I-1.197 J21.687 E.09772
G1 X124.452 Y124.452 E.30348
G1 X123.785 Y124.539 E.02231
G1 X123.049 Y125.275 E.03454
G1 X123.262 Y126.889 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X123.049 Y125.275 E-.61876
G1 X123.312 Y125.012 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/85
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z2 I-.701 J.995 P1  F42000
G1 X132.485 Y131.479 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1827
M204 S6000
G1 X128.31 Y130.929 E.1397
G2 X127.684 Y130.93 I-.309 J3.311 E.02081
G1 X123.515 Y131.479 E.13948
G1 X122.575 Y124.344 E.2387
G1 X126.731 Y123.797 E.13903
G3 X128.422 Y123.723 I1.434 J13.365 E.05618
G3 X129.269 Y123.797 I-.428 J9.757 E.02823
G1 X133.425 Y124.344 E.13904
G1 X132.493 Y131.419 E.23671
; WIPE_START
G1 F8843.478
G1 X130.507 Y131.186 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.598 Y126.356 Z2.2 F42000
G1 X122.185 Y124.384 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1827
M204 S5000
G1 X123.127 Y131.542 E.22185
G1 X117.556 Y132.275 E.17269
G1 X116.613 Y125.117 E.22185
G1 X121.01 Y124.538 E.13627
G1 X122.126 Y124.391 E.03457
; WIPE_START
G1 F9547.055
M204 S6000
G1 X122.403 Y126.372 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.247 Y129.751 Z2.2 F42000
G1 X132.873 Y131.542 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F1827
M204 S5000
G1 X133.066 Y130.069 E.04563
G1 X133.815 Y124.384 E.17622
G1 X139.387 Y125.117 E.17269
G1 X138.444 Y132.275 E.22185
G1 X132.932 Y131.55 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X133.066 Y130.069 E-.56476
G1 X133.133 Y129.56 E-.19524
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.578 Y132.676 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
G1 F1827
M204 S5000
G1 X128.268 Y131.319 E.31954
G2 X127.73 Y131.319 I-.267 J2.787 E.01654
G1 X117.354 Y132.674 E.32153
G3 X117.203 Y132.506 I.041 J-.189 E.00745
G1 X116.214 Y124.915 E.2352
G3 X116.383 Y124.764 I.187 J.039 E.00744
G1 X126.684 Y123.408 E.31926
G3 X128.439 Y123.331 I1.487 J13.895 E.05401
G3 X129.316 Y123.408 I-.442 J10.095 E.02707
G1 X139.617 Y124.764 E.31926
G3 X139.787 Y124.986 I-.02 J.192 E.00961
G1 X138.797 Y132.506 E.23306
G3 X138.638 Y132.674 I-.195 J-.025 E.00763
; WIPE_START
G1 F9547.055
M204 S6000
G1 X136.655 Y132.415 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X123.262 Y126.889 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1827
M204 S6000
G1 X123.049 Y125.275 E.05401
G1 X123.785 Y124.539 E.03454
G1 X124.452 Y124.452 E.02231
G1 X130.921 Y130.921 E.30348
G2 X127.993 Y130.56 I-4.091 J21.111 E.09797
G2 X125.079 Y130.921 I1.335 J22.705 E.09747
G1 X131.551 Y124.449 E.30364
G1 X132.212 Y124.536 E.02211
G1 X132.951 Y125.275 E.03467
G1 X132.738 Y126.889 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X132.951 Y125.275 E-.61876
G1 X132.688 Y125.012 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/85
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z2.2 I-.954 J.756 P1  F42000
G1 X138.434 Y132.262 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5396
M204 S6000
G1 X128.316 Y130.93 E.33852
G2 X127.684 Y130.93 I-.316 J4.258 E.02101
G1 X117.566 Y132.262 E.33852
G1 X116.627 Y125.127 E.2387
G1 X126.731 Y123.797 E.33807
G3 X128.422 Y123.723 I1.438 J13.452 E.05618
G3 X129.269 Y123.797 I-.426 J9.738 E.02823
G1 X139.373 Y125.127 E.33807
G1 X138.442 Y132.202 E.23671
M204 S250
G1 X138.578 Y132.676 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5396
M204 S5000
G1 X128.27 Y131.319 E.31948
G2 X127.73 Y131.319 I-.27 J3.672 E.0166
M73 P38 R12
G1 X117.424 Y132.676 E.31941
G1 X117.31 Y132.66 E.00353
G3 X117.203 Y132.505 I.087 J-.176 E.00603
G1 X116.214 Y124.915 E.2352
G3 X116.383 Y124.764 I.187 J.039 E.00744
G1 X126.684 Y123.408 E.31925
G3 X128.439 Y123.331 I1.491 J13.982 E.05401
G3 X129.316 Y123.408 I-.44 J10.082 E.02707
G1 X139.617 Y124.764 E.31926
G3 X139.787 Y124.986 I-.02 J.192 E.0096
G1 X138.797 Y132.506 E.23306
G3 X138.638 Y132.675 I-.193 J-.022 E.00766
; WIPE_START
G1 F9547.055
M204 S6000
G1 X136.655 Y132.416 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X132.326 Y131.118 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.4266
M106 S255
G1 F3000
M204 S6000
G1 X133.089 Y131.218 E.02405
G1 X133.145 Y131.175 E.00221
G1 X138.101 Y131.828 E.15631
G1 X138.145 Y131.497 E.01043
G1 X132.544 Y130.76 E.17661
G1 X132.594 Y130.379 E.012
G1 X138.195 Y131.117 E.17661
G1 X138.245 Y130.736 E.012
G1 X132.644 Y129.999 E.17661
G1 X132.695 Y129.619 E.012
G1 X138.295 Y130.356 E.17661
G1 X138.345 Y129.976 E.012
G1 X132.745 Y129.238 E.17661
G1 X132.795 Y128.858 E.012
G1 X138.395 Y129.595 E.17661
G1 X138.445 Y129.215 E.012
G1 X132.845 Y128.477 E.17661
G1 X132.895 Y128.097 E.012
G1 X138.495 Y128.834 E.17661
G1 X138.545 Y128.454 E.012
G1 X132.945 Y127.717 E.17661
G1 X132.995 Y127.336 E.012
G1 X138.596 Y128.074 E.17661
G1 X138.646 Y127.693 E.012
G1 X133.045 Y126.956 E.17661
G1 X133.095 Y126.575 E.012
G1 X138.696 Y127.313 E.17661
G1 X138.746 Y126.932 E.012
G1 X133.145 Y126.195 E.17661
G1 X133.195 Y125.815 E.012
G1 X138.796 Y126.552 E.17661
G1 X138.846 Y126.172 E.012
G1 X133.245 Y125.434 E.17661
G1 X133.295 Y125.054 E.012
G1 X138.896 Y125.791 E.17661
G1 X138.94 Y125.46 E.01044
G1 X133.983 Y124.808 E.15631
G1 X133.94 Y124.752 E.0022
G1 X133.177 Y124.651 E.02405
M106 S201.45
M204 S10000
G1 X132.668 Y126.819 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5396
M204 S6000
G1 X132.88 Y125.204 E.05401
G1 X132.212 Y124.536 E.03135
G1 X131.551 Y124.449 E.02211
G1 X125.079 Y130.921 E.30364
G3 X128 Y130.56 I4.235 J22.239 E.09772
G3 X130.921 Y130.921 I-1.312 J22.589 E.09772
G1 X124.449 Y124.449 E.30364
G1 X123.788 Y124.536 E.02211
G1 X123.12 Y125.204 E.03135
G1 X123.332 Y126.819 E.05401
; WIPE_START
G1 F8843.478
G1 X123.12 Y125.204 E-.61876
G1 X123.383 Y124.941 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.4 I-.092 J-1.213 P1  F42000
G1 X116.886 Y125.433 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.4266
M106 S255
G1 F3000
M204 S6000
G1 X122.654 Y124.673 E.18192
G1 X122.704 Y125.054 E.012
G1 X117.104 Y125.791 E.17661
G1 X117.154 Y126.172 E.012
G1 X122.755 Y125.434 E.17661
G1 X122.805 Y125.815 E.012
G1 X117.204 Y126.552 E.17661
G1 X117.254 Y126.932 E.012
G1 X122.855 Y126.195 E.17661
G1 X122.905 Y126.575 E.012
G1 X117.304 Y127.313 E.17661
G1 X117.354 Y127.693 E.012
G1 X122.955 Y126.956 E.17661
G1 X123.005 Y127.336 E.012
G1 X117.404 Y128.074 E.17661
G1 X117.455 Y128.454 E.012
G1 X123.055 Y127.717 E.17661
G1 X123.105 Y128.097 E.012
G1 X117.505 Y128.834 E.17661
G1 X117.555 Y129.215 E.012
G1 X123.155 Y128.477 E.17661
G1 X123.205 Y128.858 E.012
G1 X117.605 Y129.595 E.17661
G1 X117.655 Y129.976 E.012
G1 X123.255 Y129.238 E.17661
G1 X123.305 Y129.619 E.012
G1 X117.705 Y130.356 E.17661
G1 X117.755 Y130.736 E.012
G1 X123.356 Y129.999 E.17661
G1 X123.406 Y130.379 E.012
G1 X117.805 Y131.117 E.17661
G1 X117.855 Y131.497 E.012
G1 X123.456 Y130.76 E.17661
G1 X123.506 Y131.14 E.012
G1 X117.737 Y131.9 E.18192
M106 S201.45
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
G1 X119.72 Y131.639 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/85
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z2.4 I-.04 J1.216 P1  F42000
G1 X138.434 Y132.262 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3658
M204 S6000
G1 X128.31 Y130.929 E.33873
G2 X127.683 Y130.93 I-.309 J3.31 E.02082
G1 X117.566 Y132.262 E.33851
G1 X116.627 Y125.127 E.2387
G1 X126.731 Y123.797 E.33807
G3 X128.422 Y123.723 I1.441 J13.534 E.05618
G3 X129.269 Y123.797 I-.426 J9.738 E.02823
G1 X139.373 Y125.127 E.33807
G1 X138.442 Y132.202 E.23671
M204 S250
G1 X138.576 Y132.676 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3658
M204 S5000
G1 X128.268 Y131.319 E.31947
G2 X127.73 Y131.319 I-.267 J2.786 E.01654
G1 X117.424 Y132.676 E.3194
G1 X117.353 Y132.674 E.00218
G1 X117.271 Y132.635 E.0028
G3 X117.203 Y132.506 I.132 J-.153 E.0046
G1 X116.214 Y124.915 E.23521
G3 X116.383 Y124.764 I.187 J.04 E.00743
G1 X126.684 Y123.408 E.31925
G3 X128.439 Y123.331 I1.495 J14.071 E.05401
G3 X129.316 Y123.408 I-.44 J10.082 E.02707
G1 X139.617 Y124.764 E.31925
G3 X139.787 Y124.986 I-.022 J.193 E.00958
G1 X138.797 Y132.506 E.23306
G3 X138.636 Y132.675 I-.193 J-.022 E.00773
; WIPE_START
G1 F9547.055
M204 S6000
G1 X136.653 Y132.416 E-.76
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
M73 P39 R12
G1 Z2.6
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X133.234 Y131.412 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42435
G1 F3658
M204 S6000
G1 X132.549 Y130.727 E.03014
G1 X132.611 Y130.25 E.01494
G1 X133.658 Y131.297 E.04603
G1 X134.28 Y131.379 E.01947
G1 X132.674 Y129.773 E.07057
G1 X132.737 Y129.297 E.01494
G1 X134.901 Y131.461 E.09512
G1 X135.522 Y131.542 E.01947
G1 X132.8 Y128.82 E.11967
G1 X132.862 Y128.343 E.01494
G1 X136.143 Y131.624 E.14421
G1 X136.764 Y131.706 E.01947
G1 X132.925 Y127.867 E.16876
G1 X132.988 Y127.39 E.01494
G1 X137.386 Y131.788 E.19331
G1 X138.007 Y131.869 E.01947
G1 X133.051 Y126.913 E.21786
G1 X133.113 Y126.437 E.01494
G1 X138.196 Y131.519 E.2234
G1 X138.259 Y131.042 E.01494
G1 X133.176 Y125.96 E.2234
G1 X133.239 Y125.483 E.01494
G1 X138.321 Y130.566 E.2234
G1 X138.384 Y130.089 E.01494
G1 X133.302 Y125.007 E.2234
G1 X133.346 Y124.67 E.01055
G1 X133.529 Y124.694 E.00572
G1 X138.447 Y129.612 E.21619
G1 X138.51 Y129.136 E.01494
G1 X134.15 Y124.776 E.19164
G1 X134.771 Y124.858 E.01947
G1 X138.572 Y128.659 E.1671
G1 X138.635 Y128.182 E.01494
G1 X135.392 Y124.939 E.14255
G1 X136.013 Y125.021 E.01947
G1 X138.698 Y127.706 E.118
G1 X138.761 Y127.229 E.01494
G1 X136.635 Y125.103 E.09345
G1 X137.256 Y125.185 E.01947
G1 X138.823 Y126.752 E.06891
G1 X138.886 Y126.276 E.01494
G1 X137.877 Y125.266 E.04436
G1 X138.498 Y125.348 E.01947
G1 X139.1 Y125.95 E.02646
M204 S10000
G1 X123.332 Y126.819 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3658
M204 S6000
G1 X123.12 Y125.204 E.05401
G1 X123.788 Y124.536 E.03135
G1 X124.449 Y124.449 E.02211
G1 X130.921 Y130.921 E.30364
G2 X127.993 Y130.56 I-4.091 J21.116 E.09797
G2 X125.079 Y130.921 I1.336 J22.709 E.09747
G1 X131.551 Y124.449 E.30364
G1 X132.212 Y124.536 E.02211
G1 X132.88 Y125.204 E.03135
G1 X132.668 Y126.819 E.05401
M204 S10000
G1 X122.926 Y125.435 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.43429
G1 F3658
M204 S6000
G1 X122.218 Y124.727 E.03192
G1 X121.729 Y124.792 E.01573
G1 X122.813 Y125.875 E.04887
G1 X122.897 Y126.513 E.0205
G1 X121.24 Y124.856 E.07471
G1 X120.751 Y124.921 E.01573
G1 X122.981 Y127.15 E.10056
G1 X123.064 Y127.787 E.0205
G1 X120.262 Y124.985 E.1264
G1 X119.773 Y125.049 E.01573
G1 X123.148 Y128.425 E.15224
G1 X123.232 Y129.062 E.0205
G1 X119.284 Y125.114 E.17809
G1 X118.795 Y125.178 E.01573
G1 X123.316 Y129.7 E.20393
G1 X123.4 Y130.337 E.0205
G1 X118.306 Y125.242 E.22977
G1 X117.816 Y125.307 E.01573
G1 X123.484 Y130.974 E.25562
G1 X123.506 Y131.144 E.00544
G1 X123.147 Y131.191 E.01156
G1 X117.327 Y125.371 E.26248
G1 X117 Y125.414 E.01051
G1 X117.028 Y125.626 E.0068
G1 X122.658 Y131.255 E.25391
G1 X122.169 Y131.32 E.01573
G1 X117.112 Y126.263 E.22806
G1 X117.196 Y126.901 E.0205
G1 X121.68 Y131.384 E.20222
G1 X121.191 Y131.449 E.01573
G1 X117.28 Y127.538 E.17638
G1 X117.364 Y128.175 E.0205
G1 X120.702 Y131.513 E.15053
G1 X120.213 Y131.577 E.01573
G1 X117.448 Y128.813 E.12469
G1 X117.532 Y129.45 E.0205
G1 X119.723 Y131.642 E.09885
G1 X119.234 Y131.706 E.01573
G1 X117.616 Y130.087 E.073
G1 X117.7 Y130.725 E.0205
G1 X118.745 Y131.77 E.04716
G1 X118.256 Y131.835 E.01573
G1 X117.586 Y131.165 E.0302
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9198.456
G1 X118.256 Y131.835 E-.35989
G1 X118.745 Y131.77 E-.18746
G1 X118.35 Y131.375 E-.21265
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/85
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z2.6 I-.03 J1.217 P1  F42000
G1 X134.79 Y131.782 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3822
M204 S6000
G1 X128.31 Y130.929 E.2168
G2 X127.69 Y130.929 I-.31 J2.802 E.02062
G1 X121.21 Y131.782 E.2168
G1 X120.271 Y124.648 E.2387
G1 X126.731 Y123.797 E.21614
G3 X128.422 Y123.723 I1.445 J13.621 E.05618
G3 X129.269 Y123.797 I-.427 J9.739 E.02822
G1 X135.729 Y124.648 E.21614
G1 X134.798 Y131.722 E.23671
; WIPE_START
G1 F8843.478
G1 X132.812 Y131.48 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.578 Y132.676 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3822
M204 S5000
G1 X128.268 Y131.319 E.31953
G2 X127.732 Y131.319 I-.268 J2.339 E.01648
G1 X117.424 Y132.676 E.31948
G1 X117.31 Y132.66 E.00353
G3 X117.203 Y132.506 I.087 J-.176 E.00603
G1 X116.214 Y124.915 E.23521
G3 X116.383 Y124.764 I.189 J.042 E.00741
G1 X126.684 Y123.408 E.31926
G3 X128.439 Y123.331 I1.499 J14.161 E.05402
G3 X129.316 Y123.408 I-.441 J10.084 E.02707
G1 X139.617 Y124.764 E.31926
G3 X139.787 Y124.986 I-.021 J.192 E.0096
G1 X138.797 Y132.506 E.23306
G3 X138.638 Y132.675 I-.193 J-.022 E.00768
; WIPE_START
G1 F9547.055
M204 S6000
G1 X136.654 Y132.416 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X138.653 Y132.011 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Top surface
G1 F3822
M204 S2000
G1 X138.242 Y132.423 E.01788
G1 X137.771 Y132.361
G1 X138.734 Y131.397 E.04187
G1 X138.815 Y130.783
G1 X137.299 Y132.299 E.06586
G1 X136.828 Y132.237
G1 X138.896 Y130.169 E.08985
G1 X138.977 Y129.555
G1 X136.357 Y132.175 E.11384
G1 X135.886 Y132.113
G1 X139.058 Y128.941 E.13783
G1 X139.138 Y128.327
G1 X135.414 Y132.051 E.16182
G1 X134.994 Y131.938
G1 X139.219 Y127.712 E.18362
G1 X139.3 Y127.098
G1 X135.074 Y131.324 E.18362
G1 X135.155 Y130.71
G1 X139.381 Y126.484 E.18362
G1 X139.462 Y125.87
G1 X135.236 Y130.096 E.18362
G1 X135.317 Y129.482
G1 X139.543 Y125.256 E.18362
G1 X139.33 Y124.935
G1 X135.398 Y128.868 E.17087
G1 X135.479 Y128.253
G1 X138.859 Y124.873 E.14688
G1 X138.387 Y124.811
G1 X135.56 Y127.639 E.12289
G1 X135.64 Y127.025
G1 X137.916 Y124.749 E.0989
G1 X137.445 Y124.687
G1 X135.721 Y126.411 E.07491
G1 X135.802 Y125.797
G1 X136.974 Y124.625 E.05092
G1 X136.503 Y124.563
G1 X135.883 Y125.183 E.02693
; WIPE_START
G1 F9547.055
M204 S6000
M73 P40 R12
G1 X136.503 Y124.563 E-.33298
G1 X136.974 Y124.625 E-.18061
G1 X136.515 Y125.084 E-.24641
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.091 Y129.183 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3822
M204 S6000
G1 X132.878 Y130.798 E.05401
G1 X132.541 Y131.135 E.0158
G1 X130.921 Y130.921 E.05419
G1 X124.449 Y124.449 E.30364
G1 X123.788 Y124.536 E.02211
G1 X122.471 Y125.853 E.06179
G1 X123.122 Y130.798 E.16544
G1 X123.459 Y131.135 E.0158
G1 X125.079 Y130.921 E.05419
G1 X131.551 Y124.449 E.30364
G1 X132.212 Y124.536 E.02211
G1 X133.529 Y125.853 E.06179
G1 X133.317 Y127.467 E.05401
M204 S10000
G1 X133.223 Y131.18 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F3822
M204 S6000
G1 X134.452 Y131.342 E.03809
G1 X135.289 Y124.985 E.19701
G1 X134.06 Y124.823 E.03809
G1 X133.231 Y131.121 E.19517
M204 S10000
G1 X133.677 Y130.832 F42000
; LINE_WIDTH: 0.474275
G1 F3822
M204 S6000
G1 X134.104 Y130.889 E.01516
G1 X134.836 Y125.333 E.19696
G1 X134.408 Y125.277 E.01516
G1 X133.684 Y130.773 E.19485
; WIPE_START
G1 F8345.795
G1 X133.945 Y128.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.482 Y130.387 Z2.8 F42000
G1 X122.777 Y131.18 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.41999
G1 F3822
M204 S6000
G1 X121.94 Y124.823 E.19701
G1 X120.711 Y124.985 E.03809
G1 X121.548 Y131.342 E.19701
G1 X122.717 Y131.188 E.03625
M204 S10000
G1 X122.323 Y130.832 F42000
; LINE_WIDTH: 0.47428
G1 F3822
M204 S6000
G1 X121.592 Y125.277 E.19696
G1 X121.164 Y125.333 E.01516
G1 X121.896 Y130.889 E.19696
G1 X122.264 Y130.84 E.01305
; WIPE_START
G1 F8345.697
G1 X121.896 Y130.889 E-.14112
G1 X121.683 Y129.274 E-.61889
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.468 Y132.066 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F3822
M204 S2000
G1 X120.959 Y131.575 E.02133
G1 X120.897 Y131.104
G1 X119.854 Y132.147 E.04532
G1 X119.239 Y132.228
G1 X120.835 Y130.633 E.06931
G1 X120.772 Y130.161
G1 X118.625 Y132.309 E.0933
G1 X118.011 Y132.389
G1 X120.71 Y129.69 E.11729
G1 X120.648 Y129.219
G1 X117.406 Y132.461 E.1409
G1 X117.344 Y131.99
G1 X120.586 Y128.748 E.1409
G1 X120.524 Y128.277
G1 X117.282 Y131.519 E.1409
G1 X117.22 Y131.048
G1 X120.462 Y127.805 E.1409
G1 X120.4 Y127.334
G1 X117.158 Y130.577 E.1409
G1 X117.096 Y130.105
G1 X120.338 Y126.863 E.1409
G1 X120.276 Y126.392
G1 X117.034 Y129.634 E.1409
G1 X116.972 Y129.163
G1 X120.214 Y125.921 E.1409
G1 X120.152 Y125.449
G1 X116.91 Y128.692 E.1409
G1 X116.848 Y128.22
G1 X120.09 Y124.978 E.1409
G1 X120.028 Y124.507
G1 X116.786 Y127.749 E.1409
G1 X116.724 Y127.278
G1 X119.429 Y124.572 E.11758
G1 X118.815 Y124.653
G1 X116.662 Y126.807 E.09359
G1 X116.599 Y126.336
G1 X118.201 Y124.734 E.0696
G1 X117.587 Y124.815
G1 X116.537 Y125.864 E.04561
G1 X116.475 Y125.393
G1 X116.973 Y124.896 E.02162
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.055
M204 S6000
G1 X116.475 Y125.393 E-.26741
G1 X116.537 Y125.864 E-.18061
G1 X117.118 Y125.284 E-.31199
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/85
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z2.8 I-.414 J1.144 P1  F42000
G1 X135.261 Y131.844 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2154
M204 S6000
G1 X128.31 Y130.929 E.23258
G2 X127.683 Y130.93 I-.309 J3.313 E.02082
G1 X120.739 Y131.844 E.23236
G1 X119.799 Y124.71 E.2387
G1 X126.731 Y123.797 E.23192
G3 X128.422 Y123.723 I1.45 J13.72 E.05618
G3 X129.269 Y123.797 I-.426 J9.733 E.02823
G1 X136.201 Y124.71 E.23192
G1 X135.269 Y131.785 E.23671
; WIPE_START
G1 F8843.478
G1 X133.284 Y131.541 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.537 Y125.158 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2154
M204 S5000
G1 X136.578 Y124.848 E.00961
G1 X139.522 Y125.236 E.09126
G1 X138.606 Y132.196 E.2157
G1 X135.662 Y131.808 E.09126
G1 X136.529 Y125.218 E.20425
; WIPE_START
G1 F9547.055
M204 S6000
G1 X136.578 Y124.848 E-.14167
G1 X138.191 Y125.061 E-.61833
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.559 Y124.974 Z3 F42000
G1 X119.422 Y124.848 Z3
G1 Z2.6
G1 E.8 F1800
G1 F2154
M204 S5000
G1 X120.338 Y131.808 E.2157
G1 X117.394 Y132.196 E.09126
G1 X116.478 Y125.236 E.2157
G1 X119.363 Y124.856 E.08942
; WIPE_START
G1 F9547.055
M204 S6000
G1 X119.641 Y126.837 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.934 Y129.086 Z3 F42000
G1 X138.578 Y132.676 Z3
G1 Z2.6
G1 E.8 F1800
G1 F2154
M204 S5000
G1 X128.268 Y131.319 E.31953
G2 X127.73 Y131.319 I-.267 J2.786 E.01654
G1 X117.353 Y132.674 E.32157
G3 X117.203 Y132.506 I.04 J-.187 E.00742
G1 X116.214 Y124.915 E.23522
G3 X116.383 Y124.764 I.187 J.04 E.00742
G1 X126.684 Y123.408 E.31926
G3 X128.439 Y123.331 I1.503 J14.254 E.05401
G3 X129.316 Y123.408 I-.44 J10.076 E.02707
G1 X139.617 Y124.764 E.31926
G3 X139.788 Y124.984 I-.022 J.193 E.00951
G1 X138.797 Y132.506 E.23313
G3 X138.638 Y132.675 I-.192 J-.02 E.00769
; WIPE_START
G1 F9547.055
M204 S6000
G1 X136.655 Y132.416 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X135.436 Y132.02 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130847
G1 F2154
M204 S6000
G1 X138.609 Y132.438 E.02293
M204 S10000
G1 X139.587 Y125.002 F42000
; LINE_WIDTH: 0.130854
G1 F2154
M204 S6000
G1 X136.415 Y124.585 E.02293
; WIPE_START
G1 F15000
G1 X138.398 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.574 Y128.264 Z3 F42000
G1 X126.693 Y130.709 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2154
M204 S6000
G1 X125.079 Y130.921 E.05401
G1 X131.551 Y124.449 E.30364
G1 X132.212 Y124.536 E.02211
G1 X135.446 Y127.77 E.15174
G1 X135.377 Y128.299 E.01768
G1 X132.541 Y131.135 E.13303
G1 X130.921 Y130.921 E.05419
G1 X124.449 Y124.449 E.30364
G1 X123.788 Y124.536 E.02211
G1 X120.554 Y127.77 E.15174
G1 X120.623 Y128.299 E.01769
G1 X123.459 Y131.135 E.13302
G1 X121.844 Y131.347 E.05401
; WIPE_START
G1 F8843.478
M73 P41 R12
G1 X123.459 Y131.135 E-.61876
G1 X123.196 Y130.872 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.564 Y132.02 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.13084
G1 F2154
M204 S6000
G1 X117.391 Y132.438 E.02293
M204 S10000
G1 X116.413 Y125.002 F42000
; LINE_WIDTH: 0.130851
G1 F2154
M204 S6000
G1 X119.585 Y124.585 E.02293
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X117.602 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/85
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z3 I-.448 J1.131 P1  F42000
G1 X135.261 Y131.844 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2201
M204 S6000
M73 P41 R11
G1 X128.317 Y130.93 E.23236
G2 X127.683 Y130.93 I-.317 J4.258 E.02102
G1 X120.739 Y131.844 E.23236
G1 X119.799 Y124.71 E.2387
G1 X126.731 Y123.797 E.23192
G3 X128.422 Y123.723 I1.453 J13.806 E.05618
G3 X129.269 Y123.797 I-.426 J9.734 E.02823
G1 X136.201 Y124.71 E.23192
G1 X135.269 Y131.785 E.23671
; WIPE_START
G1 F8843.478
G1 X133.284 Y131.541 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.544 Y125.108 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2201
M204 S5000
G1 X136.578 Y124.848 E.00806
G1 X139.522 Y125.236 E.09126
G1 X138.606 Y132.196 E.2157
G1 X135.662 Y131.808 E.09126
G1 X136.536 Y125.168 E.2058
; WIPE_START
G1 F9547.055
M204 S6000
G1 X136.578 Y124.848 E-.12253
G1 X138.241 Y125.067 E-.63747
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.098 Y127.757 Z3.2 F42000
G1 X120.338 Y131.808 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F2201
M204 S5000
G1 X117.394 Y132.196 E.09126
G1 X116.478 Y125.236 E.2157
G1 X116.748 Y125.2 E.00838
G1 X119.422 Y124.848 E.08288
G1 X120.331 Y131.749 E.21386
; WIPE_START
G1 F9547.055
M204 S6000
G1 X118.353 Y132.05 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.982 Y132.286 Z3.2 F42000
G1 X138.578 Y132.676 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F2201
M204 S5000
G1 X128.27 Y131.319 E.31947
G2 X127.73 Y131.319 I-.27 J3.67 E.0166
G1 X117.353 Y132.674 E.32157
G3 X117.203 Y132.505 I.043 J-.189 E.0074
G1 X116.214 Y124.914 E.23522
G3 X116.383 Y124.764 I.187 J.04 E.00742
G1 X126.684 Y123.408 E.31925
G3 X128.439 Y123.331 I1.507 J14.347 E.05401
G3 X129.316 Y123.408 I-.44 J10.076 E.02707
G1 X139.617 Y124.764 E.31925
G3 X139.787 Y124.986 I-.022 J.193 E.00958
G1 X138.797 Y132.506 E.23306
G3 X138.638 Y132.674 I-.195 J-.024 E.00764
; WIPE_START
G1 F9547.055
M204 S6000
G1 X136.655 Y132.415 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X135.436 Y132.02 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130743
G1 F2201
M204 S6000
G1 X138.609 Y132.438 E.0229
; WIPE_START
G1 F15000
G1 X136.626 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.538 Y125.122 Z3.2 F42000
G1 X139.588 Y125.002 Z3.2
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.130528
G1 F2201
M204 S6000
G1 X136.415 Y124.585 E.02284
; WIPE_START
G1 F15000
G1 X138.398 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.984 Y128.982 Z3.2 F42000
G1 X129.307 Y130.709 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2201
M204 S6000
G1 X130.921 Y130.921 E.05401
G1 X124.449 Y124.449 E.30364
G1 X123.788 Y124.536 E.02211
G1 X120.554 Y127.77 E.15174
G1 X120.623 Y128.299 E.01768
G1 X123.459 Y131.135 E.13303
G1 X125.079 Y130.921 E.05419
G1 X131.551 Y124.449 E.30364
G1 X132.212 Y124.536 E.02211
G1 X135.447 Y127.771 E.15174
G1 X135.377 Y128.299 E.01768
G1 X132.541 Y131.135 E.13303
G1 X134.156 Y131.347 E.05401
; WIPE_START
G1 F8843.478
G1 X132.541 Y131.135 E-.61876
G1 X132.804 Y130.872 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.205 Y131.585 Z3.2 F42000
G1 X120.564 Y132.02 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130527
G1 F2201
M204 S6000
G1 X117.391 Y132.438 E.02284
; WIPE_START
G1 F15000
G1 X119.374 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P42 R11
G1 X116.462 Y125.122 Z3.2 F42000
G1 X116.412 Y125.002 Z3.2
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.130542
G1 F2201
M204 S6000
G1 X119.585 Y124.585 E.02285
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X117.602 Y124.845 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/85
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z3.2 I.009 J1.217 P1  F42000
G1 X136.201 Y124.71 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1865
M204 S6000
G1 X135.261 Y131.844 E.2387
G1 X128.317 Y130.93 E.23236
G2 X127.69 Y130.929 I-.318 J3.313 E.02082
G1 X120.739 Y131.844 E.23258
G1 X119.799 Y124.71 E.2387
G1 X126.731 Y123.797 E.23192
G3 X128.056 Y123.715 I1.675 J16.266 E.04406
G3 X129.269 Y123.797 I-.116 J10.697 E.04036
G1 X136.141 Y124.702 E.22992
M204 S250
G1 X136.578 Y124.848 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1865
M204 S5000
G1 X135.662 Y131.808 E.2157
G1 X138.606 Y132.196 E.09126
G1 X138.668 Y131.725 E.0146
G1 X138.896 Y131.755 E.00706
G1 X138.781 Y132.565 E.02514
G3 X138.576 Y132.676 I-.178 J-.084 E.00769
G1 X128.27 Y131.319 E.3194
G2 X127.732 Y131.319 I-.27 J2.787 E.01654
G1 X117.355 Y132.674 E.32159
G3 X117.205 Y132.52 I.038 J-.186 E.00703
G1 X117.104 Y131.755 E.02371
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.01459
G1 X120.338 Y131.808 E.09126
G1 X119.422 Y124.848 E.21571
G1 X116.478 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.213 Y124.986 E.02327
G3 X116.383 Y124.764 I.2 J-.022 E.00948
G1 X126.684 Y123.408 E.31926
G3 X128.065 Y123.323 I1.721 J16.704 E.04252
G3 X129.316 Y123.408 I-.124 J11.084 E.03857
G1 X139.617 Y124.764 E.31926
G3 X139.787 Y124.986 I-.028 J.197 E.00951
G1 X139.689 Y125.737 E.02327
G1 X139.46 Y125.707 E.00707
G1 X139.522 Y125.236 E.0146
G1 X136.637 Y124.856 E.08942
; WIPE_START
G1 F9547.055
M204 S6000
G1 X136.359 Y126.837 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X136.415 Y124.585 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130845
G1 F1865
M204 S6000
G1 X139.587 Y125.002 E.02293
; WIPE_START
G1 F15000
G1 X137.605 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.591 Y132.31 Z3.4 F42000
G1 X138.608 Y132.438 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.130847
G1 F1865
M204 S6000
G1 X135.436 Y132.02 E.02292
; WIPE_START
G1 F15000
G1 X137.419 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.156 Y131.347 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1865
M204 S6000
G1 X132.541 Y131.135 E.05401
G1 X135.377 Y128.299 E.13302
G1 X135.446 Y127.77 E.01769
G1 X132.212 Y124.536 E.15174
G1 X131.551 Y124.449 E.02211
G1 X125.079 Y130.921 E.30364
G1 X123.459 Y131.135 E.05419
G1 X120.623 Y128.299 E.13303
G1 X120.554 Y127.77 E.01769
G1 X123.788 Y124.536 E.15174
G1 X124.449 Y124.449 E.02211
G1 X130.921 Y130.921 E.30364
G1 X129.307 Y130.709 E.05401
; WIPE_START
G1 F8843.478
G1 X130.921 Y130.921 E-.61876
G1 X130.659 Y130.659 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.095 Y131.679 Z3.4 F42000
G1 X120.564 Y132.02 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130864
G1 F1865
M204 S6000
G1 X117.392 Y132.438 E.02293
; WIPE_START
G1 F15000
G1 X119.375 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.462 Y125.122 Z3.4 F42000
G1 X116.413 Y125.002 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.130851
G1 F1865
M204 S6000
G1 X119.585 Y124.585 E.02293
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X117.602 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/85
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z3.4 I.009 J1.217 P1  F42000
G1 X136.201 Y124.71 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2139
M204 S6000
G1 X135.261 Y131.844 E.2387
G1 X128.317 Y130.93 E.23236
G2 X127.69 Y130.929 I-.318 J3.31 E.02082
G1 X120.739 Y131.844 E.23258
G1 X119.799 Y124.71 E.2387
G1 X126.731 Y123.797 E.23192
G3 X128.422 Y123.723 I1.41 J12.814 E.05619
G3 X129.269 Y123.797 I-.426 J9.737 E.02822
G1 X136.141 Y124.702 E.22992
M204 S250
G1 X136.578 Y124.848 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2139
M204 S5000
G1 X135.662 Y131.808 E.21571
G1 X138.606 Y132.196 E.09126
G1 X138.668 Y131.725 E.0146
G1 X138.896 Y131.755 E.00706
G1 X138.795 Y132.52 E.02371
G3 X138.578 Y132.676 I-.189 J-.034 E.0091
G1 X128.27 Y131.319 E.31946
G2 X127.732 Y131.319 I-.27 J2.787 E.01654
G1 X117.354 Y132.674 E.32159
G3 X117.205 Y132.52 I.038 J-.186 E.00702
G1 X117.104 Y131.755 E.02371
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.0146
G1 X120.338 Y131.808 E.09126
G1 X119.422 Y124.848 E.21571
G1 X116.478 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.213 Y124.986 E.02327
G3 X116.383 Y124.764 I.201 J-.022 E.00949
G1 X126.684 Y123.408 E.31925
G3 X128.439 Y123.331 I1.463 J13.334 E.05402
G3 X129.316 Y123.408 I-.441 J10.082 E.02706
G1 X139.617 Y124.764 E.31925
G3 X139.787 Y124.986 I-.022 J.193 E.00958
G1 X139.689 Y125.737 E.02327
G1 X139.46 Y125.707 E.00707
G1 X139.522 Y125.236 E.0146
G1 X136.637 Y124.856 E.08942
; WIPE_START
G1 F9547.055
M204 S6000
G1 X136.359 Y126.837 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X136.415 Y124.585 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130844
G1 F2139
M204 S6000
G1 X139.587 Y125.002 E.02293
; WIPE_START
M73 P43 R11
G1 F15000
G1 X137.605 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.105 Y130.255 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.385372
G1 F2139
M204 S6000
G1 X135.773 Y125.18 E.14285
G1 X135.763 Y125.046 E.00376
G1 X135.018 Y124.922 E.02106
; WIPE_START
G1 F10512.433
G1 X135.763 Y125.046 E-.28682
G1 X135.773 Y125.18 E-.05119
G1 X135.628 Y126.281 E-.42198
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.436 Y132.02 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130838
G1 F2139
M204 S6000
G1 X138.608 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X136.625 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.444 Y130.844 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X133.985 Y131.31 E.09894
; Slow Down End
M204 S10000
G1 X129.311 Y130.709 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2139
M204 S6000
G1 X129.938 Y130.792 E.021
G1 X129.821 Y130.675 E.0055
G1 X129.95 Y130.413 E.00967
G1 X130.483 Y130.483 E.01783
G1 X124.785 Y124.785 E.26732
G1 X123.35 Y124.974 E.04801
G1 X120.89 Y127.434 E.11543
G1 X121.061 Y128.737 E.04359
G1 X123.123 Y130.799 E.0967
G1 X125.516 Y130.484 E.08009
G1 X131.215 Y124.785 E.26733
G1 X132.65 Y124.974 E.04801
G1 X135.11 Y127.434 E.11542
G1 X134.939 Y128.737 E.04359
G1 X132.877 Y130.799 E.0967
G1 X134.492 Y131.011 E.05401
M204 S10000
G1 X126.43 Y130.729 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F2139
M204 S6000
G1 X127.655 Y130.568 E.03421
G1 X127.958 Y130.552 E.00842
M204 S10000
G1 X123.005 Y131.18 F42000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X125.303 Y130.877 E.06422
; Slow Down End
; WIPE_START
G1 X123.32 Y131.138 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.564 Y132.02 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130853
G1 F2139
M204 S6000
G1 X117.392 Y132.438 E.02293
; WIPE_START
G1 F15000
G1 X119.375 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.391 Y126.428 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X120.986 Y130.944 E.1262
; Slow Down End
M204 S10000
G1 X122.042 Y124.78 F42000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X124.705 Y124.43 E.07441
; Slow Down End
M204 S10000
G1 X127.311 Y124.119 F42000
G1 F2139
M204 S6000
G3 X129.23 Y124.158 I.772 J9.198 E.05327
G1 X132.9 Y124.641 E.10255
; WIPE_START
G1 F10588.235
G1 X130.917 Y124.38 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.286 Y124.518 Z3.6 F42000
G1 X119.585 Y124.585 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130861
G1 F2139
M204 S6000
G1 X116.413 Y125.002 E.02293
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X118.395 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/85
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z3.6 I.002 J1.217 P1  F42000
G1 X136.201 Y124.71 Z3.6
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5973
M204 S6000
G1 X135.261 Y131.844 E.2387
G1 X128.31 Y130.929 E.23258
G2 X127.69 Y130.929 I-.31 J2.802 E.02062
G1 X120.739 Y131.844 E.23258
G1 X119.799 Y124.71 E.2387
G1 X126.731 Y123.797 E.23191
G3 X128.067 Y123.715 I1.645 J15.881 E.04442
G3 X129.269 Y123.797 I-.123 J10.652 E.03999
G1 X136.141 Y124.702 E.22992
M204 S250
G1 X136.578 Y124.848 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5973
M204 S5000
G1 X135.662 Y131.808 E.21571
G1 X138.606 Y132.196 E.09126
G1 X138.668 Y131.725 E.0146
G1 X138.896 Y131.755 E.00706
G1 X138.795 Y132.52 E.02371
G3 X138.577 Y132.676 I-.191 J-.036 E.00908
G1 X128.268 Y131.319 E.31952
G2 X127.732 Y131.319 I-.268 J2.339 E.01648
G1 X117.352 Y132.674 E.32166
G3 X117.205 Y132.52 I.04 J-.186 E.00695
G1 X117.104 Y131.755 E.02371
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.0146
G1 X120.338 Y131.808 E.09126
G1 X119.422 Y124.848 E.2157
G1 X116.478 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.213 Y124.986 E.02327
G3 X116.383 Y124.764 I.202 J-.021 E.00948
G1 X126.684 Y123.408 E.31925
G3 X128.076 Y123.323 I1.694 J16.356 E.04286
G3 X129.316 Y123.408 I-.131 J11.04 E.03823
G1 X139.617 Y124.764 E.31925
G3 X139.787 Y124.986 I-.031 J.2 E.00949
G1 X139.689 Y125.737 E.02326
G1 X139.46 Y125.707 E.00707
G1 X139.522 Y125.236 E.0146
G1 X136.637 Y124.856 E.08942
; WIPE_START
G1 F9547.055
M204 S6000
G1 X136.359 Y126.837 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X136.415 Y124.585 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130843
G1 F5973
M204 S6000
G1 X139.587 Y125.002 E.02293
; WIPE_START
G1 F15000
G1 X137.605 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.356 Y124.87 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.43496
G1 F5973
M204 S6000
G1 X133.307 Y124.732 E.03381
G1 X133.313 Y124.794 E.00199
G1 X133.761 Y125.242 E.02023
G1 X134.306 Y124.902 E.02052
M204 S10000
G1 X134.945 Y131.432 F42000
; LINE_WIDTH: 0.37107
G1 F5973
M204 S6000
G1 X134.452 Y131.367 E.01328
G1 X135.029 Y130.79 E.02182
G1 X134.953 Y131.372 E.01571
M204 S10000
G1 X135.436 Y132.02 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.13084
G1 F5973
M204 S6000
G1 X138.608 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X136.625 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.779 Y131.48 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.41309
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X135.112 Y130.148 E.1029
G1 X135.211 Y129.394 E.04154
G1 X133.381 Y131.224 E.14132
G1 X132.802 Y131.148 E.03187
G1 X135.31 Y128.64 E.19368
G1 X135.41 Y127.885 E.04154
G1 X132.224 Y131.071 E.24604
G1 X131.645 Y130.995 E.03187
G1 X135.509 Y127.131 E.2984
G1 X135.608 Y126.377 E.04154
G1 X131.066 Y130.919 E.35076
G1 X130.512 Y130.846 E.03052
G1 X130.507 Y130.823 E.00129
G1 X135.708 Y125.623 E.40158
G1 X135.786 Y125.028 E.03276
G1 X135.664 Y125.012 E.00674
G1 X130.214 Y130.462 E.42085
G1 X129.886 Y130.134 E.02529
G1 X135.085 Y124.936 E.40145
G1 X135.053 Y124.931 E.00176
G1 X133.7 Y125.776 E.0871
G1 X133.645 Y125.721 E.00425
M73 P44 R11
G1 X129.559 Y129.807 E.31552
G1 X129.359 Y129.607 E.01543
G1 X128.636 Y130.074 E.04701
G1 X133.317 Y125.393 E.36148
G1 X132.99 Y125.066 E.02529
G1 X127.471 Y130.585 E.42619
G1 X126.717 Y130.684 E.04154
G1 X132.77 Y124.631 E.46746
G1 X132.191 Y124.555 E.03187
G1 X126.343 Y130.403 E.45161
G1 X126.144 Y129.998 E.02465
G1 X125.266 Y130.875 E.06775
G1 X125.208 Y130.883 E.00319
G1 X131.613 Y124.479 E.49457
G1 X131.034 Y124.402 E.03187
G1 X124.454 Y130.982 E.50812
G1 X123.7 Y131.081 E.04154
G1 X130.455 Y124.326 E.52167
G1 X129.876 Y124.25 E.03187
G1 X123.061 Y131.066 E.52634
G1 X123.052 Y130.976 E.0049
G1 X122.774 Y130.698 E.02152
G1 X129.298 Y124.174 E.5038
G2 X128.702 Y124.114 I-1.359 J10.571 E.03267
G1 X122.446 Y130.37 E.48311
G1 X122.232 Y130.156 E.01652
G1 X121.632 Y130.529 E.03858
G1 X128.076 Y124.086 E.4976
G2 X127.434 Y124.107 I.897 J37.214 E.03508
G1 X127.321 Y124.186 E.00753
G1 X120.943 Y130.564 E.49254
G1 X120.867 Y129.985 E.03187
G1 X125.55 Y125.302 E.36166
G1 X125.223 Y124.974 E.02529
G1 X120.79 Y129.406 E.34227
G1 X120.714 Y128.828 E.03187
G1 X124.895 Y124.647 E.32288
G1 X124.688 Y124.439 E.01603
G1 X124.412 Y124.475 E.01521
G1 X120.638 Y128.249 E.29142
G1 X120.562 Y127.67 E.03187
G1 X123.658 Y124.575 E.23906
G1 X122.903 Y124.674 E.04154
G1 X120.486 Y127.092 E.1867
G1 X120.41 Y126.513 E.03187
G1 X122.384 Y124.538 E.1525
M106 S201.45
M204 S10000
G1 X120.306 Y125.098 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.53818
; LAYER_HEIGHT: 0.2
G1 F5973
M204 S6000
G1 X120.38 Y125.664 E.02303
G1 X120.611 Y125.633 E.00942
G1 X121.274 Y124.971 E.03783
G1 X120.365 Y125.09 E.03701
M204 S10000
G1 X125.258 Y124.403 F42000
; LINE_WIDTH: 0.45166
G1 F5973
M204 S6000
G1 X125.672 Y124.817 E.01951
G1 X126.496 Y124.24 E.03351
G1 X125.318 Y124.395 E.03959
; WIPE_START
G1 F8807.555
G1 X126.496 Y124.24 E-.45168
G1 X125.832 Y124.705 E-.30832
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.585 Y124.585 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130861
G1 F5973
M204 S6000
G1 X116.413 Y125.002 E.02293
; WIPE_START
G1 F15000
G1 X118.395 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.409 Y132.31 Z3.8 F42000
G1 X117.392 Y132.438 Z3.8
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.130844
G1 F5973
M204 S6000
G1 X120.564 Y132.02 E.02292
; WIPE_START
G1 F15000
G1 X118.581 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.167 Y130.724 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.48809
G1 F5973
M204 S6000
G1 X121.142 Y131.361 E.0438
G1 X122.611 Y131.168 E.05377
G1 X122.21 Y130.766 E.02061
M204 S10000
G1 X126.051 Y130.69 F42000
; LINE_WIDTH: 0.45634
G1 F5973
M204 S6000
G2 X126.043 Y130.779 I-.026 J.043 E.0068
M204 S10000
G1 X129.855 Y130.716 F42000
; LINE_WIDTH: 0.4606
G1 F5973
M204 S6000
G1 X129.3 Y130.162 E.0267
G1 X128.682 Y130.561 E.02506
G1 X129.796 Y130.708 E.03822
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8619.038
G1 X128.682 Y130.561 E-.42674
G1 X129.3 Y130.162 E-.27975
G1 X129.4 Y130.261 E-.0535
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/85
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z3.8 I.77 J.943 P1  F42000
G1 X136.201 Y124.71 Z3.8
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4231
M204 S6000
G1 X135.261 Y131.844 E.2387
G1 X128.317 Y130.93 E.23236
G2 X127.683 Y130.93 I-.317 J4.258 E.02102
G1 X120.739 Y131.844 E.23236
G1 X119.799 Y124.71 E.2387
G1 X126.731 Y123.797 E.23191
G3 X128.073 Y123.715 I1.632 J15.711 E.04461
G3 X129.269 Y123.797 I-.127 J10.638 E.0398
G1 X136.141 Y124.702 E.22992
M204 S250
G1 X136.578 Y124.848 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4231
M204 S5000
G1 X135.662 Y131.808 E.2157
G1 X138.606 Y132.196 E.09126
G1 X138.668 Y131.725 E.0146
G1 X138.896 Y131.755 E.00706
G1 X138.781 Y132.567 E.0252
G3 X138.577 Y132.676 I-.177 J-.085 E.00758
G1 X128.27 Y131.319 E.31945
G2 X127.73 Y131.319 I-.27 J3.671 E.0166
G1 X117.355 Y132.674 E.32152
G3 X117.205 Y132.522 I.038 J-.187 E.00696
G1 X117.104 Y131.755 E.02377
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.0146
G1 X120.338 Y131.808 E.09126
G1 X119.422 Y124.848 E.2157
G1 X116.478 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.213 Y124.986 E.02327
G3 X116.383 Y124.764 I.202 J-.021 E.00947
G1 X126.684 Y123.408 E.31925
G3 X128.081 Y123.323 I1.682 J16.194 E.04303
G3 X129.316 Y123.408 I-.135 J11.026 E.03806
G1 X139.617 Y124.764 E.31925
G3 X139.787 Y124.986 I-.031 J.2 E.00948
G1 X139.689 Y125.737 E.02327
G1 X139.46 Y125.707 E.00707
G1 X139.522 Y125.236 E.0146
G1 X136.637 Y124.856 E.08942
; WIPE_START
G1 F9547.055
M204 S6000
G1 X136.359 Y126.837 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X136.415 Y124.585 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130835
G1 F4231
M204 S6000
G1 X139.587 Y125.002 E.02292
; WIPE_START
G1 F15000
G1 X137.605 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.591 Y132.31 Z4 F42000
G1 X138.608 Y132.438 Z4
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.130849
G1 F4231
M204 S6000
G1 X135.436 Y132.02 E.02292
; WIPE_START
G1 F15000
G1 X137.419 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.442 Y131.571 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42272
G1 F4231
M204 S6000
G1 X135.04 Y130.973 E.02619
G1 X135.121 Y130.354 E.01931
G1 X134.118 Y131.357 E.04391
G1 X133.644 Y131.295 E.01482
G1 X135.203 Y129.736 E.06825
G1 X135.284 Y129.117 E.01931
G1 X133.169 Y131.232 E.09258
G1 X132.694 Y131.17 E.01482
G1 X135.366 Y128.499 E.11692
G1 X135.447 Y127.88 E.01931
G1 X132.22 Y131.107 E.14126
G1 X131.745 Y131.045 E.01482
G1 X135.529 Y127.261 E.1656
G1 X135.61 Y126.643 E.01931
G1 X131.27 Y130.983 E.18994
G1 X130.796 Y130.92 E.01482
G1 X135.691 Y126.024 E.21427
G1 X135.773 Y125.406 E.01931
G1 X130.321 Y130.858 E.23861
G1 X129.847 Y130.795 E.01482
G1 X135.666 Y124.976 E.25471
G1 X135.191 Y124.913 E.01482
G1 X129.372 Y130.733 E.25471
G1 X128.897 Y130.67 E.01482
G1 X134.717 Y124.851 E.25471
G1 X134.242 Y124.788 E.01482
G1 X128.423 Y130.608 E.25471
G2 X127.912 Y130.581 I-.467 J4.011 E.01582
G1 X133.768 Y124.726 E.25627
G1 X133.293 Y124.663 E.01482
G1 X127.314 Y130.642 E.2617
G1 X126.695 Y130.724 E.01931
G1 X132.818 Y124.601 E.268
G1 X132.344 Y124.538 E.01482
G1 X126.077 Y130.805 E.2743
G1 X125.458 Y130.887 E.01931
G1 X131.869 Y124.476 E.2806
G1 X131.394 Y124.413 E.01482
G1 X124.839 Y130.968 E.2869
G1 X124.221 Y131.049 E.01931
G1 X130.92 Y124.351 E.2932
G1 X130.445 Y124.288 E.01482
G1 X123.602 Y131.131 E.2995
G1 X122.984 Y131.212 E.01931
G1 X129.97 Y124.226 E.3058
G1 X129.496 Y124.163 E.01482
G1 X122.365 Y131.294 E.31209
G1 X121.747 Y131.375 E.01931
G1 X129.017 Y124.105 E.31821
G2 X128.516 Y124.069 I-.532 J3.932 E.01557
G1 X121.128 Y131.457 E.32334
G1 X121.025 Y131.47 E.0032
G1 X120.973 Y131.074 E.01236
G1 X127.998 Y124.05 E.30745
G2 X127.441 Y124.07 I-.141 J3.874 E.01726
G1 X120.911 Y130.6 E.28581
G1 X120.848 Y130.125 E.01482
G1 X126.852 Y124.121 E.26278
G2 X126.238 Y124.198 I.58 J7.107 E.01916
G1 X120.786 Y129.65 E.23863
G1 X120.723 Y129.176 E.01482
M73 P45 R11
G1 X125.62 Y124.28 E.21429
G1 X125.001 Y124.361 E.01931
G1 X120.661 Y128.701 E.18996
G1 X120.598 Y128.227 E.01482
G1 X124.382 Y124.443 E.16562
G1 X123.764 Y124.524 E.01931
G1 X120.536 Y127.752 E.14128
G1 X120.473 Y127.277 E.01482
G1 X123.145 Y124.605 E.11694
G1 X122.527 Y124.687 E.01931
G1 X120.411 Y126.803 E.09261
G1 X120.349 Y126.328 E.01482
G1 X121.908 Y124.768 E.06827
G1 X121.29 Y124.85 E.01931
G1 X120.286 Y125.853 E.04393
G1 X120.224 Y125.379 E.01482
G1 X120.868 Y124.734 E.02822
; WIPE_START
G1 F9478.673
G1 X120.224 Y125.379 E-.34646
G1 X120.286 Y125.853 E-.18192
G1 X120.717 Y125.422 E-.23162
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.585 Y124.585 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130851
G1 F4231
M204 S6000
G1 X116.413 Y125.002 E.02293
; WIPE_START
G1 F15000
G1 X118.395 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.409 Y132.31 Z4 F42000
G1 X117.392 Y132.438 Z4
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.130852
G1 F4231
M204 S6000
G1 X120.564 Y132.02 E.02293
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X118.581 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/85
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z4 I.48 J1.118 P1  F42000
G1 X136.201 Y124.71 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4254
M204 S6000
G1 X135.261 Y131.844 E.2387
G1 X128.317 Y130.93 E.23236
G2 X127.69 Y130.929 I-.318 J3.31 E.02082
G1 X120.739 Y131.844 E.23258
G1 X119.799 Y124.71 E.2387
G1 X126.731 Y123.797 E.23191
G3 X128.078 Y123.715 I1.62 J15.55 E.04479
G3 X129.269 Y123.797 I-.131 J10.62 E.03962
G1 X136.141 Y124.702 E.22992
M204 S250
G1 X136.578 Y124.848 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4254
M204 S5000
G1 X135.662 Y131.808 E.21571
G1 X138.606 Y132.196 E.09126
G1 X138.668 Y131.725 E.0146
G1 X138.896 Y131.755 E.00706
G1 X138.795 Y132.52 E.02371
G3 X138.578 Y132.676 I-.19 J-.035 E.00907
G1 X128.27 Y131.319 E.31947
G2 X127.732 Y131.319 I-.27 J2.787 E.01654
G1 X117.422 Y132.676 E.31955
G1 X117.352 Y132.674 E.00215
G1 X117.271 Y132.635 E.00275
G3 X117.205 Y132.52 I.124 J-.148 E.00416
G1 X117.104 Y131.755 E.02371
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.0146
G1 X120.338 Y131.808 E.09126
G1 X119.422 Y124.848 E.2157
G1 X116.477 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.213 Y124.986 E.02327
G3 X116.383 Y124.764 I.202 J-.021 E.00948
G1 X126.684 Y123.408 E.31925
G3 X128.087 Y123.323 I1.67 J16.041 E.0432
G3 X129.316 Y123.408 I-.139 J11.009 E.03789
G1 X139.617 Y124.764 E.31925
G3 X139.787 Y124.986 I-.031 J.2 E.00948
G1 X139.689 Y125.737 E.02327
G1 X139.46 Y125.707 E.00707
G1 X139.522 Y125.236 E.0146
G1 X136.637 Y124.856 E.08942
; WIPE_START
G1 F9547.055
M204 S6000
G1 X136.359 Y126.837 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X135.928 Y125.53 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42272
G1 F4254
M204 S6000
G1 X135.329 Y124.931 E.02619
G1 X134.711 Y124.85 E.01931
G1 X135.714 Y125.853 E.04391
G1 X135.652 Y126.328 E.01482
G1 X134.092 Y124.768 E.06825
G1 X133.474 Y124.687 E.01931
G1 X135.589 Y126.802 E.09259
G1 X135.527 Y127.277 E.01482
G1 X132.855 Y124.605 E.11692
G1 X132.237 Y124.524 E.01931
G1 X135.464 Y127.751 E.14126
G1 X135.402 Y128.226 E.01482
G1 X131.618 Y124.443 E.1656
G1 X130.999 Y124.361 E.01931
G1 X135.339 Y128.701 E.18994
G1 X135.277 Y129.175 E.01482
G1 X130.381 Y124.28 E.21428
G1 X129.762 Y124.198 E.01931
G1 X135.214 Y129.65 E.23861
G1 X135.152 Y130.125 E.01482
G1 X129.146 Y124.119 E.26286
G2 X128.561 Y124.071 I-.67 J4.596 E.01817
G1 X135.089 Y130.599 E.28572
G1 X135.027 Y131.074 E.01482
G1 X128.003 Y124.05 E.30743
G2 X127.482 Y124.066 I-.15 J3.598 E.01615
G1 X134.872 Y131.457 E.32348
G1 X134.254 Y131.375 E.01931
G1 X126.988 Y124.109 E.31802
G2 X126.505 Y124.163 I.377 J5.576 E.01505
G1 X133.635 Y131.294 E.3121
G1 X133.017 Y131.212 E.01931
G1 X126.03 Y124.226 E.3058
G1 X125.555 Y124.288 E.01482
G1 X132.398 Y131.131 E.2995
G1 X131.78 Y131.05 E.01931
G1 X125.081 Y124.351 E.2932
G1 X124.606 Y124.413 E.01482
G1 X131.161 Y130.968 E.2869
G1 X130.542 Y130.887 E.01931
G1 X124.131 Y124.476 E.2806
G1 X123.657 Y124.538 E.01482
G1 X129.924 Y130.805 E.2743
G1 X129.305 Y130.724 E.01931
G1 X123.182 Y124.601 E.268
G1 X122.707 Y124.663 E.01482
G1 X128.687 Y130.642 E.26171
G2 X128.088 Y130.581 I-.852 J5.321 E.01864
G1 X122.233 Y124.726 E.25627
G1 X121.758 Y124.788 E.01482
G1 X127.578 Y130.608 E.25471
G1 X127.103 Y130.67 E.01482
G1 X121.284 Y124.85 E.25471
G1 X120.809 Y124.913 E.01482
G1 X126.628 Y130.733 E.25471
G1 X126.154 Y130.795 E.01482
G1 X120.334 Y124.975 E.25471
G1 X120.173 Y124.997 E.00503
G1 X120.227 Y125.405 E.01276
G1 X125.679 Y130.857 E.23863
G1 X125.205 Y130.92 E.01482
G1 X120.308 Y126.024 E.21429
G1 X120.39 Y126.642 E.01931
G1 X124.73 Y130.982 E.18996
G1 X124.255 Y131.045 E.01482
G1 X120.471 Y127.261 E.16562
G1 X120.553 Y127.88 E.01931
G1 X123.781 Y131.107 E.14128
G1 X123.306 Y131.17 E.01482
G1 X120.634 Y128.498 E.11694
G1 X120.716 Y129.117 E.01931
G1 X122.831 Y131.232 E.0926
G1 X122.357 Y131.295 E.01482
G1 X120.797 Y129.735 E.06827
G1 X120.879 Y130.354 E.01931
G1 X121.882 Y131.357 E.04393
G1 X121.408 Y131.42 E.01482
G1 X120.763 Y130.775 E.02822
; WIPE_START
G1 F9478.673
G1 X121.408 Y131.42 E-.34645
G1 X121.882 Y131.357 E-.18192
G1 X121.451 Y130.926 E-.23163
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.564 Y132.02 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130853
G1 F4254
M204 S6000
G1 X117.392 Y132.438 E.02293
; WIPE_START
G1 F15000
G1 X119.375 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.462 Y125.122 Z4.2 F42000
G1 X116.413 Y125.002 Z4.2
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.130851
G1 F4254
M204 S6000
G1 X119.585 Y124.585 E.02293
; WIPE_START
G1 F15000
G1 X117.602 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.234 Y124.74 Z4.2 F42000
G1 X136.415 Y124.585 Z4.2
G1 Z3.8
M73 P46 R11
G1 E.8 F1800
; LINE_WIDTH: 0.130835
G1 F4254
M204 S6000
G1 X139.587 Y125.002 E.02292
; WIPE_START
G1 F15000
G1 X137.605 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.591 Y132.31 Z4.2 F42000
G1 X138.608 Y132.438 Z4.2
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.13084
G1 F4254
M204 S6000
G1 X135.436 Y132.02 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X137.419 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/85
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z4.2 I1.202 J-.193 P1  F42000
G1 X136.201 Y124.71 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4226
M204 S6000
G1 X135.261 Y131.844 E.2387
G1 X128.317 Y130.93 E.23236
G2 X127.69 Y130.929 I-.318 J3.313 E.02082
G1 X120.739 Y131.844 E.23258
G1 X119.799 Y124.71 E.2387
G1 X126.731 Y123.797 E.23191
G3 X128.084 Y123.716 I1.608 J15.393 E.04497
G3 X129.269 Y123.797 I-.135 J10.602 E.03944
G1 X136.141 Y124.702 E.22992
M204 S250
G1 X136.578 Y124.848 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4226
M204 S5000
G1 X135.662 Y131.808 E.2157
G1 X138.606 Y132.196 E.09126
G1 X138.668 Y131.725 E.0146
G1 X138.896 Y131.755 E.00706
G1 X138.781 Y132.567 E.02521
G3 X138.576 Y132.676 I-.177 J-.085 E.00762
G1 X128.27 Y131.319 E.3194
G2 X127.732 Y131.319 I-.27 J2.788 E.01654
G1 X117.355 Y132.674 E.32159
G3 X117.205 Y132.52 I.041 J-.189 E.00701
G1 X117.104 Y131.755 E.02371
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.0146
G1 X120.338 Y131.808 E.09126
M73 P46 R10
G1 X119.422 Y124.848 E.2157
G1 X116.477 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.213 Y124.986 E.02326
G3 X116.383 Y124.764 I.192 J-.029 E.0096
G1 X126.684 Y123.408 E.31925
G3 X128.092 Y123.324 I1.659 J15.89 E.04337
G3 X129.316 Y123.408 I-.143 J10.992 E.03772
G1 X139.617 Y124.764 E.31925
G3 X139.787 Y124.986 I-.031 J.2 E.00949
G1 X139.689 Y125.737 E.02326
G1 X139.46 Y125.707 E.00707
G1 X139.522 Y125.236 E.0146
G1 X136.637 Y124.856 E.08942
; WIPE_START
G1 F9547.055
M204 S6000
G1 X136.359 Y126.837 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X136.415 Y124.585 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130837
G1 F4226
M204 S6000
G1 X139.587 Y125.002 E.02292
; WIPE_START
G1 F15000
G1 X137.605 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.591 Y132.31 Z4.4 F42000
G1 X138.608 Y132.438 Z4.4
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.130837
G1 F4226
M204 S6000
G1 X135.436 Y132.02 E.02292
; WIPE_START
G1 F15000
G1 X137.419 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.442 Y131.571 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42272
G1 F4226
M204 S6000
G1 X135.04 Y130.973 E.02619
G1 X135.121 Y130.354 E.01931
G1 X134.118 Y131.357 E.04391
G1 X133.644 Y131.295 E.01482
G1 X135.203 Y129.736 E.06825
G1 X135.284 Y129.117 E.01931
G1 X133.169 Y131.232 E.09258
G1 X132.694 Y131.17 E.01482
G1 X135.366 Y128.499 E.11692
G1 X135.447 Y127.88 E.01931
G1 X132.22 Y131.107 E.14126
G1 X131.745 Y131.045 E.01482
G1 X135.529 Y127.261 E.1656
G1 X135.61 Y126.643 E.01931
G1 X131.27 Y130.983 E.18994
G1 X130.796 Y130.92 E.01482
G1 X135.691 Y126.024 E.21427
G1 X135.773 Y125.406 E.01931
G1 X130.321 Y130.858 E.23861
G1 X129.847 Y130.795 E.01482
G1 X135.666 Y124.976 E.25471
G1 X135.191 Y124.913 E.01482
G1 X129.372 Y130.733 E.25471
G1 X128.897 Y130.67 E.01482
G1 X134.717 Y124.851 E.25471
G1 X134.242 Y124.788 E.01482
G1 X128.423 Y130.608 E.25471
G2 X127.912 Y130.581 I-.457 J3.883 E.01584
G1 X133.768 Y124.726 E.25629
G1 X133.293 Y124.663 E.01482
G1 X127.314 Y130.642 E.2617
G1 X126.695 Y130.724 E.01931
G1 X132.818 Y124.601 E.268
G1 X132.344 Y124.538 E.01482
G1 X126.077 Y130.805 E.2743
G1 X125.458 Y130.887 E.01931
G1 X131.869 Y124.476 E.2806
G1 X131.394 Y124.413 E.01482
G1 X124.839 Y130.968 E.2869
G1 X124.221 Y131.049 E.01931
G1 X130.92 Y124.351 E.2932
G1 X130.445 Y124.288 E.01482
G1 X123.602 Y131.131 E.2995
G1 X122.984 Y131.212 E.01931
G1 X129.97 Y124.226 E.3058
G1 X129.496 Y124.163 E.01482
G1 X122.365 Y131.294 E.31209
G1 X121.747 Y131.375 E.01931
G1 X129.017 Y124.105 E.31821
G2 X128.516 Y124.069 I-.534 J3.951 E.01557
G1 X121.128 Y131.457 E.32334
G1 X121.025 Y131.47 E.0032
G1 X120.973 Y131.074 E.01236
G1 X127.998 Y124.05 E.30744
G2 X127.441 Y124.07 I-.145 J3.826 E.01725
G1 X120.911 Y130.6 E.28581
G1 X120.848 Y130.125 E.01482
G1 X126.852 Y124.121 E.26278
G2 X126.238 Y124.198 I.58 J7.104 E.01916
G1 X120.786 Y129.65 E.23863
G1 X120.723 Y129.176 E.01482
G1 X125.62 Y124.28 E.21429
G1 X125.001 Y124.361 E.01931
G1 X120.661 Y128.701 E.18996
G1 X120.598 Y128.227 E.01482
G1 X124.382 Y124.443 E.16562
G1 X123.764 Y124.524 E.01931
G1 X120.536 Y127.752 E.14128
G1 X120.473 Y127.277 E.01482
G1 X123.145 Y124.605 E.11694
G1 X122.527 Y124.687 E.01931
G1 X120.411 Y126.803 E.09261
G1 X120.349 Y126.328 E.01482
G1 X121.908 Y124.768 E.06827
G1 X121.29 Y124.85 E.01931
G1 X120.286 Y125.853 E.04393
G1 X120.224 Y125.379 E.01482
G1 X120.868 Y124.734 E.02822
; WIPE_START
G1 F9478.673
G1 X120.224 Y125.379 E-.34646
G1 X120.286 Y125.853 E-.18192
G1 X120.717 Y125.422 E-.23162
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.585 Y124.585 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130851
G1 F4226
M204 S6000
G1 X116.413 Y125.002 E.02293
; WIPE_START
G1 F15000
G1 X118.395 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.409 Y132.31 Z4.4 F42000
G1 X117.392 Y132.438 Z4.4
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.130852
G1 F4226
M204 S6000
G1 X120.564 Y132.02 E.02293
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X118.581 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/85
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z4.4 I.48 J1.118 P1  F42000
G1 X136.201 Y124.71 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4312
M204 S6000
G1 X136.064 Y125.746 E.03467
G1 X128 Y124.684 E.26981
G1 X119.936 Y125.746 E.26981
G1 X119.799 Y124.71 E.03467
G1 X126.731 Y123.797 E.23192
G3 X128.089 Y123.716 I1.597 J15.249 E.04516
G3 X129.269 Y123.797 I-.139 J10.586 E.03926
G1 X136.141 Y124.702 E.22992
; WIPE_START
G1 F8843.478
G1 X136.064 Y125.746 E-.39781
G1 X135.119 Y125.622 E-.36219
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.763 Y130.066 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F4312
M204 S6000
G1 X135.398 Y130.808 E.18853
G1 X135.261 Y131.844 E.03467
G1 X128.317 Y130.93 E.23236
G2 X127.69 Y130.929 I-.318 J3.31 E.02082
G1 X120.739 Y131.844 E.23258
G1 X120.602 Y130.808 E.03467
G1 X128 Y129.834 E.24752
G1 X129.704 Y130.058 E.057
; WIPE_START
G1 F8843.478
G1 X131.687 Y130.319 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.578 Y124.848 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4312
M204 S5000
G1 X135.662 Y131.808 E.2157
G1 X138.606 Y132.196 E.09126
M73 P47 R10
G1 X138.668 Y131.725 E.0146
G1 X138.896 Y131.755 E.00706
G1 X138.78 Y132.567 E.02521
G3 X138.577 Y132.676 I-.177 J-.086 E.00756
G1 X128.27 Y131.319 E.31946
G2 X127.732 Y131.319 I-.27 J2.787 E.01654
G1 X117.424 Y132.676 E.31948
G1 X117.31 Y132.66 E.00353
G3 X117.205 Y132.52 I.087 J-.175 E.00558
G1 X117.104 Y131.755 E.02371
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.0146
G1 X120.338 Y131.808 E.09126
G1 X119.422 Y124.848 E.2157
G1 X116.478 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.213 Y124.986 E.02327
G3 X116.383 Y124.764 I.201 J-.022 E.00948
G1 X126.684 Y123.408 E.31925
G3 X128.098 Y123.324 I1.647 J15.744 E.04354
G3 X129.316 Y123.408 I-.147 J10.979 E.03755
G1 X139.617 Y124.764 E.31925
G3 X139.787 Y124.986 I-.03 J.2 E.00949
G1 X139.689 Y125.737 E.02327
G1 X139.46 Y125.707 E.00707
G1 X139.522 Y125.236 E.0146
G1 X136.637 Y124.856 E.08942
; WIPE_START
G1 F9547.055
M204 S6000
G1 X136.359 Y126.837 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X136.176 Y126.311 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Top surface
G1 F4312
M204 S2000
G1 X135.803 Y125.938 E.01622
G1 X135.243 Y125.911
G1 X136.114 Y126.782 E.03786
G1 X136.052 Y127.253
G1 X134.629 Y125.83 E.06185
G1 X134.015 Y125.749
G1 X135.99 Y127.725 E.08584
G1 X135.928 Y128.196
G1 X133.4 Y125.668 E.10983
G1 X132.786 Y125.587
G1 X135.866 Y128.667 E.13382
G1 X135.804 Y129.138
G1 X132.172 Y125.507 E.15781
G1 X131.558 Y125.426
G1 X135.742 Y129.609 E.1818
G1 X135.68 Y130.081
G1 X130.944 Y125.345 E.20579
G1 X130.33 Y125.264
G1 X135.618 Y130.552 E.22978
G1 X135.017 Y130.485
G1 X129.716 Y125.183 E.23038
G1 X129.102 Y125.102
G1 X134.403 Y130.404 E.23038
G1 X133.789 Y130.323
G1 X128.488 Y125.021 E.23038
G1 X128.206 Y125.273
G1 X133.175 Y130.242 E.21595
G1 X132.561 Y130.161
G1 X128.144 Y125.744 E.19196
G1 X128.081 Y126.215
G1 X131.947 Y130.081 E.16797
G1 X131.333 Y130
G1 X128.019 Y126.686 E.14399
M204 S10000
G1 X127.813 Y125.413 F42000
G1 F4312
M204 S2000
G1 X127.432 Y125.032 E.01657
G1 X126.96 Y125.094
G1 X127.894 Y126.027 E.04056
G1 X127.975 Y126.642
G1 X126.489 Y125.156 E.06455
G1 X126.018 Y125.218
G1 X130.719 Y129.919 E.20427
G1 X130.105 Y129.838
G1 X125.547 Y125.28 E.19806
G1 X125.076 Y125.342
G1 X129.49 Y129.757 E.19185
G1 X128.876 Y129.676
G1 X124.604 Y125.404 E.18564
G1 X124.133 Y125.466
G1 X128.262 Y129.595 E.17943
G1 X127.73 Y129.596
G1 X123.662 Y125.528 E.17678
G1 X123.191 Y125.59
G1 X127.259 Y129.659 E.17678
G1 X126.788 Y129.721
G1 X122.72 Y125.652 E.17678
G1 X122.248 Y125.715
G1 X126.316 Y129.783 E.17678
G1 X125.845 Y129.845
G1 X121.777 Y125.777 E.17678
G1 X121.306 Y125.839
G1 X125.374 Y129.907 E.17678
G1 X124.903 Y129.969
G1 X120.835 Y125.901 E.17678
G1 X120.363 Y125.963
G1 X124.431 Y130.031 E.17678
G1 X123.96 Y130.093
G1 X119.849 Y125.982 E.17864
G1 X119.851 Y126.517
G1 X123.489 Y130.155 E.15809
G1 X123.018 Y130.217
G1 X119.932 Y127.131 E.1341
G1 X120.013 Y127.745
G1 X122.547 Y130.279 E.11011
G1 X122.075 Y130.341
G1 X120.094 Y128.359 E.08612
G1 X120.174 Y128.973
G1 X121.604 Y130.403 E.06213
G1 X121.133 Y130.465
G1 X120.255 Y129.587 E.03814
G1 X120.336 Y130.201
G1 X120.705 Y130.57 E.01602
; WIPE_START
G1 F9547.055
M204 S6000
G1 X120.336 Y130.201 E-.19806
G1 X120.255 Y129.587 E-.23538
G1 X120.863 Y130.195 E-.32656
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.703 Y126.809 Z4.6 F42000
G1 X127.997 Y126.664 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.106205
G1 F4312
M204 S6000
G1 X127.864 Y126.797 E.00097
M204 S10000
G1 X128 Y126.452 F42000
; LINE_WIDTH: 0.121892
G1 F4312
M204 S6000
G1 X128 Y126.227 E.00144
; LINE_WIDTH: 0.171828
G1 X128 Y126.003 E.00236
; LINE_WIDTH: 0.221765
G1 X128 Y125.779 E.00327
; LINE_WIDTH: 0.271701
G1 X128 Y125.555 E.00418
; LINE_WIDTH: 0.321637
G1 X128 Y125.331 E.00509
; LINE_WIDTH: 0.371573
G1 X128 Y125.106 E.006
; LINE_WIDTH: 0.42151
G1 X128 Y124.882 E.00692
M204 S10000
G1 X127.6 Y124.228 F42000
; LINE_WIDTH: 0.624116
G1 F4312
M204 S6000
G3 X128.037 Y124.2 I.373 J2.418 E.02074
G1 X128.4 Y124.228 E.01724
; LINE_WIDTH: 0.679615
G3 X129.207 Y124.316 I-1.626 J18.551 E.04214
G1 X135.931 Y125.201 E.35185
M204 S10000
G1 X136.415 Y124.585 F42000
; LINE_WIDTH: 0.130835
G1 F4312
M204 S6000
G1 X139.587 Y125.002 E.02292
; WIPE_START
G1 F15000
G1 X137.605 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.591 Y132.31 Z4.6 F42000
G1 X138.608 Y132.438 Z4.6
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.130858
G1 F4312
M204 S6000
G1 X135.436 Y132.02 E.02293
M204 S10000
G1 X135.128 Y131.299 F42000
; LINE_WIDTH: 0.681
G1 F4312
M204 S6000
G1 X128.455 Y130.421 E.34996
M204 S10000
G1 X128.041 Y130.242 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.55136
G1 F4312
M204 S6000
G2 X128.043 Y130.349 I-.027 J.054 E.01019
M204 S10000
G1 X127.564 Y130.418 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.68101
G1 F4312
M204 S6000
G1 X120.872 Y131.299 E.35094
M204 S10000
G1 X120.564 Y132.02 F42000
; LINE_WIDTH: 0.130853
G1 F4312
M204 S6000
G1 X117.392 Y132.438 E.02293
; WIPE_START
G1 F15000
G1 X119.375 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.462 Y125.122 Z4.6 F42000
G1 X116.413 Y125.002 Z4.6
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.130849
G1 F4312
M204 S6000
G1 X119.585 Y124.585 E.02293
M204 S10000
G1 X120.069 Y125.201 F42000
; LINE_WIDTH: 0.679611
G1 F4312
M204 S6000
G1 X126.793 Y124.316 E.35185
G3 X127.6 Y124.228 I2.432 J18.452 E.04213
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5654.241
G1 X126.793 Y124.316 E-.30858
G1 X125.615 Y124.471 E-.45142
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/85
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z4.6 I-.311 J1.176 P1  F42000
G1 X128.467 Y125.226 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3069
M204 S6000
G1 X128.107 Y127.961 E.09151
G1 X127.893 Y127.961 E.0071
G1 X127.533 Y125.226 E.09151
G1 X119.998 Y126.218 E.25211
G1 X119.799 Y124.71 E.05045
G1 X126.731 Y123.797 E.23192
G3 X128.095 Y123.716 I1.586 J15.114 E.04534
G3 X129.269 Y123.797 I-.142 J10.567 E.03907
G1 X136.201 Y124.71 E.23192
G1 X136.002 Y126.218 E.05045
G1 X128.527 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X128.223 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.631 Y129.534 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F3069
M204 S6000
G1 X128 Y129.354 E.04581
G1 X135.46 Y130.336 E.24959
G1 X135.261 Y131.844 E.05045
G1 X128.317 Y130.93 E.23236
G2 X127.69 Y130.929 I-.318 J3.313 E.02082
G1 X120.739 Y131.844 E.23258
G1 X120.54 Y130.336 E.05045
G1 X126.571 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X128 Y129.354 E-.54754
G1 X128.554 Y129.427 E-.21246
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.805 Y125.666 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3069
M204 S5000
G1 X128.365 Y129.007 E.10355
G1 X135.9 Y129.999 E.23353
G1 X135.662 Y131.808 E.05608
G1 X138.606 Y132.196 E.09126
G1 X138.668 Y131.725 E.0146
G1 X138.896 Y131.755 E.00706
G1 X138.78 Y132.567 E.02522
G3 X138.577 Y132.676 I-.177 J-.086 E.00757
G1 X128.27 Y131.319 E.31945
G2 X127.732 Y131.319 I-.27 J2.788 E.01654
G1 X117.354 Y132.674 E.32159
G3 X117.205 Y132.52 I.04 J-.188 E.00701
G1 X117.104 Y131.755 E.02372
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.0146
G1 X120.338 Y131.808 E.09126
G1 X120.1 Y129.999 E.05608
G1 X127.635 Y129.007 E.23353
G1 X127.195 Y125.666 E.10355
G1 X119.66 Y126.658 E.23353
G1 X119.422 Y124.848 E.05608
G1 X116.478 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.213 Y124.986 E.02327
G3 X116.383 Y124.764 I.202 J-.021 E.00947
G1 X126.684 Y123.408 E.31926
G3 X128.103 Y123.324 I1.638 J15.615 E.04371
G3 X129.316 Y123.408 I-.151 J10.961 E.03738
G1 X139.617 Y124.764 E.31926
G3 X139.787 Y124.986 I-.031 J.2 E.00948
G1 X139.689 Y125.737 E.02327
G1 X139.46 Y125.707 E.00707
G1 X139.522 Y125.236 E.0146
G1 X136.578 Y124.848 E.09126
G1 X136.34 Y126.658 E.05608
G1 X128.864 Y125.673 E.23168
; WIPE_START
M73 P48 R10
G1 F9547.055
M204 S6000
G1 X128.568 Y127.651 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X128 Y128.157 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.513104
G1 F3069
M204 S6000
G1 X128 Y128.365 E.00796
; LINE_WIDTH: 0.474813
G1 X128 Y128.573 E.00731
; LINE_WIDTH: 0.436522
G1 X128 Y128.78 E.00667
; LINE_WIDTH: 0.39823
G1 X128 Y128.988 E.00602
; LINE_WIDTH: 0.357144
G1 X128.146 Y129.166 E.00589
M204 S10000
G1 X128 Y129.75 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F3069
M204 S6000
G1 X120.98 Y130.674 E.21756
G1 X121.076 Y131.404 E.02264
G1 X127.646 Y130.539 E.20361
G3 X128.361 Y130.54 I.351 J5.36 E.02199
G1 X134.924 Y131.404 E.20339
G1 X135.02 Y130.674 E.02264
G1 X128.059 Y129.757 E.21572
M204 S10000
G1 X121.393 Y130.991 F42000
; LINE_WIDTH: 0.404077
G1 F3069
M204 S6000
G1 X127.598 Y130.174 E.18417
G3 X128.409 Y130.175 I.403 J2.825 E.02396
G1 X134.547 Y130.983 E.1822
; WIPE_START
G1 F9967.979
G1 X132.564 Y130.722 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.436 Y132.02 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130847
G1 F3069
M204 S6000
G1 X138.608 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X136.625 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.538 Y125.122 Z4.8 F42000
G1 X139.587 Y125.002 Z4.8
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.130835
G1 F3069
M204 S6000
G1 X136.415 Y124.585 E.02292
; WIPE_START
G1 F15000
G1 X138.398 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.767 Y124.992 Z4.8 F42000
G1 X128 Y125.046 Z4.8
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.518972
G1 F3069
M204 S6000
G1 X128 Y125.267 E.00857
; LINE_WIDTH: 0.469319
G1 X128 Y125.488 E.00768
; LINE_WIDTH: 0.419666
G1 X128 Y125.709 E.00679
; LINE_WIDTH: 0.370013
G1 X128 Y125.93 E.00589
; LINE_WIDTH: 0.320361
G1 X128 Y126.151 E.005
; LINE_WIDTH: 0.270708
G1 X128 Y126.372 E.0041
; LINE_WIDTH: 0.221055
G1 X128 Y126.593 E.00321
; LINE_WIDTH: 0.171403
G1 X128 Y126.814 E.00231
; LINE_WIDTH: 0.12175
G1 X128 Y127.035 E.00142
; WIPE_START
G1 F15000
G1 X128 Y126.814 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.653 Y125.364 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.4026
G1 F3069
M204 S6000
G1 X126.786 Y124.557 E.18131
M204 S10000
G1 X128.664 Y124.856 F42000
; LINE_WIDTH: 0.420226
G1 F3069
M204 S6000
G1 X135.665 Y125.778 E.2171
G1 X135.761 Y125.047 E.02265
G1 X129.219 Y124.186 E.20287
G1 X128.802 Y124.15 E.01285
; LINE_WIDTH: 0.453553
G1 X128.449 Y124.15 E.01184
; LINE_WIDTH: 0.496272
G2 X127.592 Y124.156 I-.118 J44.42 E.03166
; LINE_WIDTH: 0.513415
G1 X127.061 Y124.215 E.02049
; LINE_WIDTH: 0.50824
G1 X126.962 Y124.206 E.00375
; LINE_WIDTH: 0.47294
G1 X126.864 Y124.197 E.00346
; LINE_WIDTH: 0.420115
G1 X126.765 Y124.188 E.00304
G1 X120.239 Y125.047 E.20232
G1 X120.335 Y125.778 E.02265
G1 X126.893 Y124.914 E.20331
; LINE_WIDTH: 0.43764
G1 X127.031 Y124.878 E.00458
; LINE_WIDTH: 0.47294
G1 X127.169 Y124.842 E.00499
; LINE_WIDTH: 0.504767
G1 X127.307 Y124.807 E.00536
G1 X127.386 Y124.656 E.00641
G1 X127.612 Y124.613 E.00866
G1 X128.463 Y124.616 E.03204
; LINE_WIDTH: 0.476563
G1 X128.54 Y124.674 E.00341
; LINE_WIDTH: 0.430776
G3 X128.642 Y124.8 I-.05 J.146 E.0054
M204 S10000
G1 X128.914 Y124.52 F42000
; LINE_WIDTH: 0.402469
G1 F3069
M204 S6000
G1 X135.288 Y125.357 E.18835
; WIPE_START
G1 F10012.543
G1 X133.305 Y125.096 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.678 Y124.812 Z4.8 F42000
G1 X119.585 Y124.585 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130839
G1 F3069
M204 S6000
G1 X116.413 Y125.002 E.02292
; WIPE_START
G1 F15000
G1 X118.395 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.409 Y132.31 Z4.8 F42000
G1 X117.392 Y132.438 Z4.8
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.130852
G1 F3069
M204 S6000
G1 X120.564 Y132.02 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X118.581 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/85
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z4.8 I.707 J.991 P1  F42000
G1 X128.467 Y125.226 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3069
M204 S6000
G1 X128.107 Y127.961 E.09151
G1 X127.893 Y127.961 E.0071
G1 X127.533 Y125.226 E.09151
G1 X119.998 Y126.218 E.25211
G1 X119.799 Y124.71 E.05045
G1 X126.731 Y123.797 E.23192
G3 X128.1 Y123.716 I1.577 J14.987 E.04552
G3 X129.269 Y123.797 I-.146 J10.552 E.03889
G1 X136.201 Y124.71 E.23192
G1 X136.002 Y126.218 E.05045
G1 X128.527 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X128.223 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.631 Y129.534 Z5 F42000
G1 Z4.6
G1 E.8 F1800
G1 F3069
M204 S6000
G1 X128 Y129.354 E.04581
G1 X135.46 Y130.336 E.24959
G1 X135.261 Y131.844 E.05045
G1 X128.317 Y130.93 E.23236
G2 X127.683 Y130.93 I-.317 J4.256 E.02102
G1 X120.739 Y131.844 E.23236
G1 X120.54 Y130.336 E.05045
G1 X126.571 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X128 Y129.354 E-.54755
G1 X128.554 Y129.427 E-.21245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.805 Y125.666 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3069
M204 S5000
G1 X128.365 Y129.007 E.10355
G1 X135.9 Y129.999 E.23353
G1 X135.662 Y131.808 E.05608
G1 X138.606 Y132.196 E.09126
G1 X138.668 Y131.725 E.0146
G1 X138.896 Y131.755 E.00706
G1 X138.791 Y132.538 E.02429
G3 X138.578 Y132.676 I-.184 J-.051 E.00853
G1 X128.27 Y131.319 E.31947
G2 X127.73 Y131.319 I-.27 J3.668 E.01661
G1 X117.354 Y132.674 E.32152
G3 X117.205 Y132.522 I.041 J-.189 E.00695
G1 X117.104 Y131.755 E.02377
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.0146
G1 X120.338 Y131.808 E.09126
G1 X120.1 Y129.999 E.05608
G1 X127.635 Y129.007 E.23353
G1 X127.195 Y125.666 E.10355
G1 X119.66 Y126.658 E.23353
G1 X119.422 Y124.848 E.05608
G1 X116.478 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.213 Y124.986 E.02326
G3 X116.383 Y124.764 I.201 J-.022 E.00949
G1 X126.684 Y123.408 E.31925
G3 X128.109 Y123.324 I1.628 J15.493 E.04388
G3 X129.316 Y123.408 I-.155 J10.945 E.03721
G1 X139.617 Y124.764 E.31926
G3 X139.787 Y124.986 I-.032 J.2 E.00948
G1 X139.689 Y125.737 E.02326
G1 X139.46 Y125.707 E.00707
G1 X139.522 Y125.236 E.0146
G1 X136.578 Y124.848 E.09126
G1 X136.34 Y126.658 E.05608
G1 X128.864 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.568 Y127.651 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X128 Y128.157 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51311
G1 F3069
M204 S6000
G1 X128 Y128.365 E.00796
; LINE_WIDTH: 0.474822
G1 X128 Y128.573 E.00731
; LINE_WIDTH: 0.436535
G1 X128 Y128.78 E.00667
; LINE_WIDTH: 0.398247
G1 X128 Y128.988 E.00602
; LINE_WIDTH: 0.357162
G1 X128.146 Y129.166 E.00589
M204 S10000
G1 X128 Y129.75 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F3069
M204 S6000
G1 X120.98 Y130.674 E.21756
G1 X121.076 Y131.404 E.02264
G1 X127.639 Y130.54 E.20339
G3 X128.361 Y130.54 I.361 J5.363 E.02221
G1 X134.924 Y131.404 E.20339
G1 X135.02 Y130.674 E.02264
G1 X128.059 Y129.757 E.21572
M204 S10000
G1 X121.393 Y130.991 F42000
; LINE_WIDTH: 0.404108
G1 F3069
M204 S6000
G1 X127.591 Y130.175 E.18398
G3 X128.409 Y130.175 I.409 J2.852 E.02417
G1 X134.547 Y130.983 E.18222
; WIPE_START
G1 F9967.119
G1 X132.564 Y130.722 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.436 Y132.02 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130858
G1 F3069
M204 S6000
G1 X138.608 Y132.438 E.02293
; WIPE_START
G1 F15000
G1 X136.625 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.538 Y125.122 Z5 F42000
G1 X139.587 Y125.002 Z5
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.130828
G1 F3069
M204 S6000
M73 P49 R10
G1 X136.415 Y124.585 E.02292
; WIPE_START
G1 F15000
G1 X138.398 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.767 Y124.992 Z5 F42000
G1 X128 Y125.046 Z5
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.518973
G1 F3069
M204 S6000
G1 X128 Y125.267 E.00857
; LINE_WIDTH: 0.46932
G1 X128 Y125.488 E.00768
; LINE_WIDTH: 0.419667
G1 X128 Y125.709 E.00679
; LINE_WIDTH: 0.370014
G1 X128 Y125.93 E.00589
; LINE_WIDTH: 0.320361
G1 X128 Y126.151 E.005
; LINE_WIDTH: 0.270708
G1 X128 Y126.372 E.0041
; LINE_WIDTH: 0.221056
G1 X128 Y126.593 E.00321
; LINE_WIDTH: 0.171403
G1 X128 Y126.814 E.00231
; LINE_WIDTH: 0.12175
G1 X128 Y127.035 E.00142
; WIPE_START
G1 F15000
G1 X128 Y126.814 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.653 Y125.364 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.4026
G1 F3069
M204 S6000
G1 X126.786 Y124.557 E.18131
M204 S10000
G1 X128.664 Y124.856 F42000
; LINE_WIDTH: 0.420226
G1 F3069
M204 S6000
G1 X135.665 Y125.778 E.2171
G1 X135.761 Y125.047 E.02265
G1 X129.219 Y124.186 E.20287
G1 X128.802 Y124.15 E.01285
; LINE_WIDTH: 0.453545
G1 X128.451 Y124.15 E.01175
; LINE_WIDTH: 0.496213
G2 X127.6 Y124.155 I-.099 J53.493 E.03144
; LINE_WIDTH: 0.5134
G1 X127.061 Y124.215 E.02081
; LINE_WIDTH: 0.508249
G1 X126.962 Y124.206 E.00375
; LINE_WIDTH: 0.472945
G1 X126.864 Y124.197 E.00346
; LINE_WIDTH: 0.420115
G1 X126.765 Y124.188 E.00304
G1 X120.239 Y125.047 E.20232
G1 X120.335 Y125.778 E.02265
G1 X126.893 Y124.914 E.20331
; LINE_WIDTH: 0.437642
G1 X127.031 Y124.878 E.00458
; LINE_WIDTH: 0.472945
G1 X127.169 Y124.842 E.00499
; LINE_WIDTH: 0.504746
G1 X127.307 Y124.807 E.00536
G1 X127.385 Y124.655 E.00641
G1 X127.612 Y124.613 E.00866
G1 X128.463 Y124.616 E.03205
; LINE_WIDTH: 0.476555
G1 X128.54 Y124.674 E.00341
; LINE_WIDTH: 0.43077
G3 X128.642 Y124.8 I-.05 J.146 E.0054
M204 S10000
G1 X128.914 Y124.52 F42000
; LINE_WIDTH: 0.40247
G1 F3069
M204 S6000
G1 X135.288 Y125.357 E.18834
; WIPE_START
G1 F10012.532
G1 X133.305 Y125.096 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.678 Y124.812 Z5 F42000
G1 X119.585 Y124.585 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130827
G1 F3069
M204 S6000
G1 X116.413 Y125.002 E.02292
; WIPE_START
G1 F15000
G1 X118.395 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.409 Y132.31 Z5 F42000
G1 X117.392 Y132.438 Z5
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.130842
G1 F3069
M204 S6000
G1 X120.564 Y132.02 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X118.581 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/85
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z5 I.707 J.991 P1  F42000
G1 X128.467 Y125.226 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2456
M204 S6000
G1 X128.107 Y127.961 E.09151
G1 X127.893 Y127.961 E.0071
G1 X127.533 Y125.226 E.09151
G1 X119.998 Y126.218 E.25211
G1 X119.799 Y124.71 E.05045
G1 X126.731 Y123.797 E.23192
G3 X128.106 Y123.716 I1.568 J14.872 E.04571
G3 X129.269 Y123.797 I-.15 J10.532 E.0387
G1 X136.201 Y124.71 E.23192
G1 X136.002 Y126.218 E.05045
G1 X128.527 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X128.223 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.631 Y129.534 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F2456
M204 S6000
G1 X128 Y129.354 E.04581
G1 X135.46 Y130.336 E.24959
G1 X135.261 Y131.844 E.05045
G1 X128.317 Y130.93 E.23235
G2 X127.683 Y130.93 I-.317 J4.251 E.02103
G1 X120.739 Y131.844 E.23236
G1 X120.54 Y130.336 E.05045
G1 X126.571 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X128 Y129.354 E-.54754
G1 X128.554 Y129.427 E-.21246
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.805 Y125.666 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2456
M204 S5000
G1 X128.365 Y129.007 E.10355
G1 X135.9 Y129.999 E.23353
G1 X135.662 Y131.808 E.05608
G1 X138.606 Y132.196 E.09126
G1 X138.668 Y131.725 E.0146
G1 X138.896 Y131.755 E.00706
G1 X138.795 Y132.52 E.02371
G3 X138.576 Y132.676 I-.192 J-.038 E.00911
G1 X128.27 Y131.319 E.3194
G2 X127.73 Y131.319 I-.27 J3.667 E.01661
G1 X117.354 Y132.674 E.32152
G3 X117.205 Y132.52 I.04 J-.188 E.00701
G1 X117.104 Y131.755 E.02371
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.0146
G1 X120.338 Y131.808 E.09126
G1 X120.1 Y129.999 E.05608
G1 X127.635 Y129.007 E.23353
G1 X127.195 Y125.666 E.10355
G1 X119.66 Y126.658 E.23353
G1 X119.422 Y124.848 E.05608
G1 X116.478 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.213 Y124.986 E.02327
G3 X116.383 Y124.764 I.201 J-.022 E.00948
G1 X126.684 Y123.408 E.31925
G3 X128.114 Y123.324 I1.62 J15.392 E.04405
G3 X129.316 Y123.408 I-.159 J10.923 E.03704
G1 X139.617 Y124.764 E.31925
G3 X139.787 Y124.986 I-.031 J.2 E.00949
G1 X139.689 Y125.737 E.02327
G1 X139.46 Y125.707 E.00707
G1 X139.522 Y125.236 E.0146
G1 X136.578 Y124.848 E.09126
G1 X136.34 Y126.658 E.05608
G1 X128.864 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.568 Y127.651 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X128 Y128.157 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.513103
G1 F2456
M204 S6000
G1 X128 Y128.365 E.00796
; LINE_WIDTH: 0.474812
G1 X128 Y128.573 E.00731
; LINE_WIDTH: 0.436521
G1 X128 Y128.78 E.00667
; LINE_WIDTH: 0.39823
G1 X128 Y128.988 E.00602
; LINE_WIDTH: 0.357111
G1 X128.146 Y129.166 E.00589
; WIPE_START
G1 F11458.005
G1 X128 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128 Y127.035 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.121749
G1 F2456
M204 S6000
G1 X128 Y126.814 E.00142
; LINE_WIDTH: 0.171402
G1 X128 Y126.593 E.00231
; LINE_WIDTH: 0.221054
G1 X128 Y126.372 E.00321
; LINE_WIDTH: 0.270706
G1 X128 Y126.151 E.0041
; LINE_WIDTH: 0.320358
G1 X128 Y125.93 E.005
; LINE_WIDTH: 0.37001
G1 X128 Y125.709 E.00589
; LINE_WIDTH: 0.419662
G1 X128 Y125.488 E.00679
; LINE_WIDTH: 0.469314
G1 X128 Y125.267 E.00768
; LINE_WIDTH: 0.518966
G1 X128 Y125.046 E.00857
M204 S10000
G1 X121.216 Y125.706 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2456
M204 S6000
G1 X122.83 Y125.494 E.05401
G1 X123.788 Y124.536 E.04493
G1 X124.449 Y124.449 E.0221
G1 X125.184 Y125.184 E.03448
G1 X127.392 Y124.893 E.07389
G1 X127.392 Y124.698 E.00648
G1 X128.608 Y124.698 E.04032
G1 X128.608 Y124.893 E.00648
G1 X130.816 Y125.184 E.07389
G1 X131.551 Y124.449 E.03448
G1 X132.212 Y124.536 E.0221
G1 X133.17 Y125.494 E.04493
G1 X134.784 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X133.17 Y125.494 E-.61876
G1 X132.907 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.415 Y124.585 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130835
G1 F2456
M204 S6000
G1 X139.587 Y125.002 E.02292
; WIPE_START
G1 F15000
G1 X137.605 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.89 Y130.612 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2456
M204 S6000
G1 X133.276 Y130.4 E.05401
G1 X132.541 Y131.135 E.03448
G1 X130.922 Y130.922 E.05419
G1 X129.964 Y129.964 E.04493
G1 X128 Y129.705 E.0657
G1 X126.036 Y129.964 E.06571
G1 X125.078 Y130.922 E.04493
G1 X123.459 Y131.135 E.05419
G1 X122.724 Y130.4 E.03448
G1 X121.11 Y130.612 E.05401
; WIPE_START
M73 P50 R10
G1 F8843.478
G1 X122.724 Y130.4 E-.61876
G1 X122.987 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.564 Y132.02 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130854
G1 F2456
M204 S6000
G1 X117.392 Y132.438 E.02293
; WIPE_START
G1 F15000
G1 X119.375 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.462 Y125.122 Z5.2 F42000
G1 X116.413 Y125.002 Z5.2
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.130861
G1 F2456
M204 S6000
G1 X119.585 Y124.585 E.02293
; WIPE_START
G1 F15000
G1 X117.602 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.683 Y127.694 Z5.2 F42000
G1 X135.436 Y132.02 Z5.2
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.130848
G1 F2456
M204 S6000
G1 X138.608 Y132.438 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X136.625 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/85
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z5.2 I.789 J-.926 P1  F42000
G1 X128.467 Y125.226 Z5.2
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2467
M204 S6000
G1 X128.107 Y127.961 E.09151
G1 X127.893 Y127.961 E.0071
G1 X127.533 Y125.226 E.09151
G1 X119.998 Y126.218 E.25211
G1 X119.799 Y124.71 E.05045
G1 X126.731 Y123.797 E.23192
G3 X128.111 Y123.716 I1.559 J14.758 E.04589
G3 X129.269 Y123.797 I-.155 J10.524 E.03852
G1 X136.201 Y124.71 E.23191
G1 X136.002 Y126.218 E.05045
G1 X128.527 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X128.223 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.631 Y129.534 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F2467
M204 S6000
G1 X128 Y129.354 E.04581
G1 X135.46 Y130.336 E.24959
G1 X135.261 Y131.844 E.05045
G1 X128.317 Y130.93 E.23236
G2 X127.69 Y130.929 I-.318 J3.312 E.02082
G1 X120.739 Y131.844 E.23257
G1 X120.54 Y130.336 E.05045
G1 X126.571 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X128 Y129.354 E-.54753
G1 X128.554 Y129.427 E-.21247
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.805 Y125.666 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2467
M204 S5000
G1 X128.365 Y129.007 E.10355
G1 X135.9 Y129.999 E.23353
G1 X135.662 Y131.808 E.05608
G1 X138.606 Y132.196 E.09126
G1 X138.668 Y131.725 E.0146
G1 X138.896 Y131.755 E.00706
G1 X138.791 Y132.538 E.02428
G3 X138.576 Y132.676 I-.185 J-.053 E.00859
G1 X128.27 Y131.319 E.3194
G2 X127.732 Y131.319 I-.27 J2.786 E.01655
G1 X117.354 Y132.674 E.32159
G3 X117.205 Y132.522 I.041 J-.189 E.00695
G1 X117.104 Y131.755 E.02377
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.0146
G1 X120.338 Y131.808 E.09126
G1 X120.1 Y129.999 E.05608
G1 X127.635 Y129.007 E.23353
G1 X127.195 Y125.666 E.10355
G1 X119.66 Y126.658 E.23353
G1 X119.422 Y124.848 E.05608
G1 X116.478 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.213 Y124.986 E.02327
G3 X116.383 Y124.764 I.201 J-.022 E.00948
G1 X126.684 Y123.408 E.31925
G3 X128.12 Y123.324 I1.612 J15.281 E.04422
G3 X129.316 Y123.408 I-.164 J10.919 E.03687
G1 X139.617 Y124.764 E.31926
G3 X139.787 Y124.986 I-.031 J.2 E.00948
G1 X139.689 Y125.737 E.02327
G1 X139.46 Y125.707 E.00707
G1 X139.522 Y125.236 E.0146
G1 X136.578 Y124.848 E.09126
G1 X136.34 Y126.658 E.05608
G1 X128.864 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.568 Y127.651 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X128 Y128.157 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.513103
G1 F2467
M204 S6000
G1 X128 Y128.365 E.00796
; LINE_WIDTH: 0.474812
G1 X128 Y128.573 E.00731
; LINE_WIDTH: 0.436521
G1 X128 Y128.78 E.00667
; LINE_WIDTH: 0.39823
G1 X128 Y128.988 E.00602
; LINE_WIDTH: 0.357111
G1 X128.146 Y129.166 E.00589
; WIPE_START
G1 F11458.005
G1 X128 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128 Y127.035 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.121749
G1 F2467
M204 S6000
G1 X128 Y126.814 E.00142
; LINE_WIDTH: 0.171402
G1 X128 Y126.593 E.00231
; LINE_WIDTH: 0.221054
G1 X128 Y126.372 E.00321
; LINE_WIDTH: 0.270706
G1 X128 Y126.151 E.0041
; LINE_WIDTH: 0.320358
G1 X128 Y125.93 E.005
; LINE_WIDTH: 0.37001
G1 X128 Y125.709 E.00589
; LINE_WIDTH: 0.419662
G1 X128 Y125.488 E.00679
; LINE_WIDTH: 0.469314
G1 X128 Y125.267 E.00768
; LINE_WIDTH: 0.518966
G1 X128 Y125.046 E.00857
; WIPE_START
G1 F7562.305
G1 X128 Y125.267 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.63 Y125.093 Z5.4 F42000
G1 X139.587 Y125.002 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.130845
G1 F2467
M204 S6000
G1 X136.415 Y124.585 E.02293
; WIPE_START
G1 F15000
G1 X138.398 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.784 Y125.706 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2467
M204 S6000
G1 X133.17 Y125.494 E.05401
G1 X132.212 Y124.536 E.04493
G1 X131.551 Y124.449 E.0221
G1 X130.816 Y125.184 E.03448
G1 X128.608 Y124.893 E.07389
G1 X128.608 Y124.698 E.00648
G1 X127.392 Y124.698 E.04032
G1 X127.392 Y124.893 E.00648
G1 X125.184 Y125.184 E.07389
G1 X124.449 Y124.449 E.03448
G1 X123.788 Y124.536 E.0221
G1 X122.83 Y125.494 E.04493
G1 X121.216 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X122.83 Y125.494 E-.61876
G1 X123.093 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.585 Y124.585 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130849
G1 F2467
M204 S6000
G1 X116.413 Y125.002 E.02293
; WIPE_START
G1 F15000
G1 X118.395 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.409 Y132.31 Z5.4 F42000
G1 X117.392 Y132.438 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.130842
G1 F2467
M204 S6000
G1 X120.564 Y132.02 E.02292
; WIPE_START
G1 F15000
G1 X118.581 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.11 Y130.612 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2467
M204 S6000
G1 X122.724 Y130.4 E.05401
G1 X123.459 Y131.135 E.03448
G1 X125.078 Y130.922 E.05419
G1 X126.036 Y129.964 E.04493
G1 X128 Y129.705 E.06571
G1 X129.964 Y129.964 E.0657
G1 X130.922 Y130.922 E.04493
G1 X132.541 Y131.135 E.05419
G1 X133.276 Y130.4 E.03448
G1 X134.89 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X133.276 Y130.4 E-.61876
G1 X133.013 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.436 Y132.02 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130858
G1 F2467
M204 S6000
G1 X138.608 Y132.438 E.02293
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X136.625 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/85
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z5.4 I.789 J-.926 P1  F42000
G1 X128.467 Y125.226 Z5.4
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2467
M204 S6000
G1 X128.107 Y127.961 E.09151
G1 X127.893 Y127.961 E.0071
G1 X127.533 Y125.226 E.09151
G1 X119.998 Y126.218 E.25211
G1 X119.799 Y124.71 E.05045
G1 X126.731 Y123.797 E.23192
G3 X128.117 Y123.716 I1.551 J14.654 E.04607
G3 X129.269 Y123.797 I-.159 J10.514 E.03834
G1 X136.201 Y124.71 E.23192
G1 X136.002 Y126.218 E.05045
M73 P51 R10
G1 X128.527 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X128.223 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.631 Y129.534 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F2467
M204 S6000
G1 X128 Y129.354 E.04581
G1 X135.46 Y130.336 E.24959
G1 X135.261 Y131.844 E.05045
G1 X128.317 Y130.93 E.23236
G2 X127.69 Y130.929 I-.318 J3.31 E.02082
G1 X120.739 Y131.844 E.23258
G1 X120.54 Y130.336 E.05045
G1 X126.571 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X128 Y129.354 E-.54755
G1 X128.554 Y129.427 E-.21245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.805 Y125.666 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2467
M204 S5000
G1 X128.365 Y129.007 E.10355
G1 X135.9 Y129.999 E.23353
G1 X135.662 Y131.808 E.05608
G1 X138.606 Y132.196 E.09126
M73 P51 R9
G1 X138.668 Y131.725 E.0146
G1 X138.896 Y131.755 E.00706
G1 X138.795 Y132.52 E.02371
G3 X138.577 Y132.676 I-.191 J-.036 E.00909
G1 X128.27 Y131.319 E.31945
G2 X127.732 Y131.319 I-.27 J2.786 E.01655
G1 X117.424 Y132.676 E.31948
G1 X117.301 Y132.655 E.00382
G1 X117.225 Y132.577 E.00335
G3 X117.205 Y132.52 I.184 J-.095 E.00188
G1 X117.104 Y131.755 E.02371
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.0146
G1 X120.338 Y131.808 E.09126
G1 X120.1 Y129.999 E.05608
G1 X127.635 Y129.007 E.23353
G1 X127.195 Y125.666 E.10355
G1 X119.66 Y126.658 E.23353
G1 X119.422 Y124.848 E.05608
G1 X116.478 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.213 Y124.986 E.02326
G3 X116.383 Y124.764 I.201 J-.022 E.0095
G1 X126.684 Y123.408 E.31925
G3 X128.125 Y123.324 I1.604 J15.182 E.04439
G3 X129.316 Y123.408 I-.168 J10.906 E.0367
G1 X139.617 Y124.764 E.31925
G3 X139.787 Y124.986 I-.032 J.201 E.00949
G1 X139.689 Y125.737 E.02326
G1 X139.46 Y125.707 E.00707
G1 X139.522 Y125.236 E.0146
G1 X136.578 Y124.848 E.09126
G1 X136.34 Y126.658 E.05608
G1 X128.864 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.568 Y127.651 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X128 Y128.157 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51311
G1 F2467
M204 S6000
G1 X128 Y128.365 E.00796
; LINE_WIDTH: 0.474822
G1 X128 Y128.573 E.00731
; LINE_WIDTH: 0.436535
G1 X128 Y128.78 E.00667
; LINE_WIDTH: 0.398247
G1 X128 Y128.988 E.00602
; LINE_WIDTH: 0.357162
G1 X128.146 Y129.166 E.00589
; WIPE_START
G1 F11456.137
G1 X128 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128 Y127.035 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.12175
G1 F2467
M204 S6000
G1 X128 Y126.814 E.00142
; LINE_WIDTH: 0.171403
G1 X128 Y126.593 E.00231
; LINE_WIDTH: 0.221056
G1 X128 Y126.372 E.00321
; LINE_WIDTH: 0.270708
G1 X128 Y126.151 E.0041
; LINE_WIDTH: 0.320361
G1 X128 Y125.93 E.005
; LINE_WIDTH: 0.370014
G1 X128 Y125.709 E.00589
; LINE_WIDTH: 0.419667
G1 X128 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X128 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X128 Y125.046 E.00857
; WIPE_START
G1 F7562.194
G1 X128 Y125.267 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.37 Y125.093 Z5.6 F42000
G1 X116.413 Y125.002 Z5.6
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.130851
G1 F2467
M204 S6000
G1 X119.585 Y124.585 E.02293
; WIPE_START
G1 F15000
G1 X117.602 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.216 Y125.706 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2467
M204 S6000
G1 X122.83 Y125.494 E.05401
G1 X123.788 Y124.536 E.04493
G1 X124.449 Y124.449 E.0221
G1 X125.184 Y125.184 E.03448
G1 X127.392 Y124.893 E.07389
G1 X127.392 Y124.697 E.00649
G1 X128.608 Y124.697 E.04032
G1 X128.608 Y124.893 E.00649
G1 X130.816 Y125.184 E.07389
G1 X131.551 Y124.449 E.03448
G1 X132.212 Y124.536 E.0221
G1 X133.17 Y125.494 E.04493
G1 X134.784 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X133.17 Y125.494 E-.61876
G1 X132.907 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.415 Y124.585 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130835
G1 F2467
M204 S6000
G1 X139.587 Y125.002 E.02292
; WIPE_START
G1 F15000
G1 X137.605 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.591 Y132.31 Z5.6 F42000
G1 X138.608 Y132.438 Z5.6
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.130847
G1 F2467
M204 S6000
G1 X135.436 Y132.02 E.02292
; WIPE_START
G1 F15000
G1 X137.419 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.89 Y130.612 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2467
M204 S6000
G1 X133.276 Y130.4 E.05401
G1 X132.541 Y131.135 E.03448
G1 X130.922 Y130.922 E.05419
G1 X129.964 Y129.964 E.04493
G1 X128 Y129.705 E.06571
G1 X126.036 Y129.964 E.06571
G1 X125.078 Y130.922 E.04493
G1 X123.459 Y131.135 E.05419
G1 X122.724 Y130.4 E.03448
G1 X121.11 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X122.724 Y130.4 E-.61876
G1 X122.987 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.564 Y132.02 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130852
G1 F2467
M204 S6000
G1 X117.392 Y132.438 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X119.375 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/85
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z5.6 I.739 J.967 P1  F42000
G1 X128.467 Y125.226 Z5.6
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2468
M204 S6000
G1 X128.107 Y127.961 E.09151
G1 X127.893 Y127.961 E.0071
G1 X127.533 Y125.226 E.09151
G1 X119.998 Y126.218 E.25211
G1 X119.799 Y124.71 E.05045
G1 X126.731 Y123.797 E.23192
G3 X128.122 Y123.716 I1.543 J14.548 E.04626
G3 X129.269 Y123.797 I-.164 J10.501 E.03815
G1 X136.201 Y124.71 E.23192
G1 X136.002 Y126.218 E.05045
G1 X128.527 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X128.223 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.631 Y129.534 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
G1 F2468
M204 S6000
G1 X128 Y129.354 E.04581
G1 X135.46 Y130.336 E.24959
G1 X135.261 Y131.844 E.05045
G1 X128.317 Y130.93 E.23236
G2 X127.683 Y130.93 I-.317 J4.256 E.02102
G1 X120.739 Y131.844 E.23236
G1 X120.54 Y130.336 E.05045
G1 X126.571 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X128 Y129.354 E-.54755
G1 X128.554 Y129.427 E-.21245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.805 Y125.666 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2468
M204 S5000
G1 X128.365 Y129.007 E.10355
G1 X135.9 Y129.999 E.23353
G1 X135.662 Y131.808 E.05608
G1 X138.606 Y132.196 E.09126
G1 X138.668 Y131.725 E.0146
G1 X138.896 Y131.755 E.00706
G1 X138.78 Y132.568 E.02525
G3 X138.577 Y132.676 I-.176 J-.087 E.00754
G1 X128.27 Y131.319 E.31945
G2 X127.73 Y131.319 I-.27 J3.668 E.01661
G1 X117.424 Y132.676 E.31942
G1 X117.34 Y132.671 E.00256
G1 X117.271 Y132.635 E.0024
G3 X117.205 Y132.52 I.123 J-.147 E.00416
G1 X117.104 Y131.755 E.02371
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.0146
G1 X120.338 Y131.808 E.09126
G1 X120.1 Y129.999 E.05608
G1 X127.635 Y129.007 E.23353
G1 X127.195 Y125.666 E.10355
G1 X119.66 Y126.658 E.23353
G1 X119.422 Y124.848 E.05608
G1 X116.478 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.213 Y124.986 E.02327
G3 X116.383 Y124.764 I.201 J-.022 E.00948
G1 X126.684 Y123.408 E.31925
G3 X128.131 Y123.324 I1.596 J15.069 E.04456
G3 X129.316 Y123.408 I-.172 J10.893 E.03653
G1 X139.617 Y124.764 E.31925
G3 X139.787 Y124.986 I-.031 J.2 E.00949
G1 X139.689 Y125.737 E.02326
G1 X139.46 Y125.707 E.00707
G1 X139.522 Y125.236 E.0146
G1 X136.578 Y124.848 E.09126
G1 X136.34 Y126.658 E.05608
G1 X128.864 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.568 Y127.651 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X128 Y128.157 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51311
M73 P52 R9
G1 F2468
M204 S6000
G1 X128 Y128.365 E.00796
; LINE_WIDTH: 0.474822
G1 X128 Y128.573 E.00731
; LINE_WIDTH: 0.436535
G1 X128 Y128.78 E.00667
; LINE_WIDTH: 0.398247
G1 X128 Y128.988 E.00602
; LINE_WIDTH: 0.357162
G1 X128.146 Y129.166 E.00589
; WIPE_START
G1 F11456.137
G1 X128 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128 Y127.035 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.12175
G1 F2468
M204 S6000
G1 X128 Y126.814 E.00142
; LINE_WIDTH: 0.171403
G1 X128 Y126.593 E.00231
; LINE_WIDTH: 0.221056
G1 X128 Y126.372 E.00321
; LINE_WIDTH: 0.270708
G1 X128 Y126.151 E.0041
; LINE_WIDTH: 0.320361
G1 X128 Y125.93 E.005
; LINE_WIDTH: 0.370014
G1 X128 Y125.709 E.00589
; LINE_WIDTH: 0.419667
G1 X128 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X128 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X128 Y125.046 E.00857
; WIPE_START
G1 F7562.194
G1 X128 Y125.267 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.63 Y125.093 Z5.8 F42000
G1 X139.587 Y125.002 Z5.8
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.130845
G1 F2468
M204 S6000
G1 X136.415 Y124.585 E.02293
; WIPE_START
G1 F15000
G1 X138.398 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.784 Y125.706 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2468
M204 S6000
G1 X133.17 Y125.494 E.05401
G1 X132.212 Y124.536 E.04493
G1 X131.551 Y124.449 E.0221
G1 X130.816 Y125.184 E.03448
G1 X128.608 Y124.893 E.07389
G1 X128.608 Y124.697 E.00649
G1 X127.392 Y124.697 E.04032
G1 X127.392 Y124.893 E.00649
G1 X125.184 Y125.184 E.07389
G1 X124.449 Y124.449 E.03448
G1 X123.788 Y124.536 E.0221
G1 X122.83 Y125.494 E.04493
G1 X121.216 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X122.83 Y125.494 E-.61876
G1 X123.093 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.585 Y124.585 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130861
G1 F2468
M204 S6000
G1 X116.413 Y125.002 E.02293
; WIPE_START
G1 F15000
G1 X118.395 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.409 Y132.31 Z5.8 F42000
G1 X117.392 Y132.438 Z5.8
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.13084
G1 F2468
M204 S6000
G1 X120.564 Y132.02 E.02292
; WIPE_START
G1 F15000
G1 X118.581 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.11 Y130.612 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2468
M204 S6000
G1 X122.724 Y130.4 E.05401
G1 X123.459 Y131.135 E.03448
G1 X125.078 Y130.922 E.05419
G1 X126.036 Y129.964 E.04493
G1 X128 Y129.705 E.06571
G1 X129.964 Y129.964 E.06571
G1 X130.922 Y130.922 E.04493
G1 X132.541 Y131.135 E.05419
G1 X133.276 Y130.4 E.03448
G1 X134.89 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X133.276 Y130.4 E-.61876
G1 X133.013 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.436 Y132.02 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130837
G1 F2468
M204 S6000
G1 X138.608 Y132.438 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X136.625 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/85
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z5.8 I.789 J-.926 P1  F42000
G1 X128.467 Y125.226 Z5.8
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X128.107 Y127.961 E.09151
G1 X127.893 Y127.961 E.0071
G1 X127.533 Y125.226 E.09151
G1 X119.998 Y126.218 E.25211
G1 X119.799 Y124.71 E.05045
G1 X126.731 Y123.797 E.23192
G3 X128.128 Y123.717 I1.536 J14.454 E.04644
G3 X129.269 Y123.797 I-.168 J10.482 E.03797
G1 X136.201 Y124.71 E.23192
G1 X136.002 Y126.218 E.05045
G1 X128.527 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X128.223 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.631 Y129.534 Z6 F42000
G1 Z5.6
G1 E.8 F1800
G1 F2455
M204 S6000
G1 X128 Y129.354 E.04581
G1 X135.46 Y130.336 E.24959
G1 X135.261 Y131.844 E.05045
G1 X128.317 Y130.93 E.23236
G2 X127.683 Y130.93 I-.317 J4.256 E.02102
G1 X120.739 Y131.844 E.23236
G1 X120.54 Y130.336 E.05045
G1 X126.571 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X128 Y129.354 E-.54755
G1 X128.554 Y129.427 E-.21245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.805 Y125.666 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2455
M204 S5000
G1 X128.365 Y129.007 E.10355
G1 X135.9 Y129.999 E.23353
G1 X135.662 Y131.808 E.05608
G1 X138.606 Y132.196 E.09126
G1 X138.668 Y131.725 E.0146
G1 X138.896 Y131.755 E.00706
G1 X138.781 Y132.565 E.02515
G3 X138.576 Y132.676 I-.177 J-.083 E.00769
G1 X128.27 Y131.319 E.3194
G2 X127.73 Y131.319 I-.27 J3.669 E.01661
G1 X117.424 Y132.676 E.3194
G1 X117.354 Y132.674 E.00215
G1 X117.268 Y132.632 E.00296
G3 X117.205 Y132.52 I.134 J-.149 E.00402
G1 X117.104 Y131.755 E.02371
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.0146
G1 X120.338 Y131.808 E.09126
G1 X120.1 Y129.999 E.05608
G1 X127.635 Y129.007 E.23353
G1 X127.195 Y125.666 E.10355
G1 X119.66 Y126.658 E.23353
G1 X119.422 Y124.848 E.05608
G1 X116.478 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.213 Y124.986 E.02327
G3 X116.383 Y124.764 I.201 J-.022 E.00948
G1 X126.684 Y123.408 E.31926
G3 X128.137 Y123.325 I1.589 J14.979 E.04473
G3 X129.316 Y123.408 I-.176 J10.875 E.03636
G1 X139.617 Y124.764 E.31926
G3 X139.787 Y124.986 I-.031 J.2 E.00948
G1 X139.689 Y125.737 E.02327
G1 X139.46 Y125.707 E.00707
G1 X139.522 Y125.236 E.0146
G1 X136.578 Y124.848 E.09126
G1 X136.34 Y126.658 E.05608
G1 X128.864 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.568 Y127.651 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X128 Y128.157 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51311
G1 F2455
M204 S6000
G1 X128 Y128.365 E.00796
; LINE_WIDTH: 0.474822
G1 X128 Y128.573 E.00731
; LINE_WIDTH: 0.436535
G1 X128 Y128.78 E.00667
; LINE_WIDTH: 0.398247
G1 X128 Y128.988 E.00602
; LINE_WIDTH: 0.357162
G1 X128.146 Y129.166 E.00589
; WIPE_START
G1 F11456.137
G1 X128 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128 Y127.035 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.12175
G1 F2455
M204 S6000
G1 X128 Y126.814 E.00142
; LINE_WIDTH: 0.171403
G1 X128 Y126.593 E.00231
; LINE_WIDTH: 0.221056
G1 X128 Y126.372 E.00321
; LINE_WIDTH: 0.270708
G1 X128 Y126.151 E.0041
; LINE_WIDTH: 0.320361
G1 X128 Y125.93 E.005
; LINE_WIDTH: 0.370014
G1 X128 Y125.709 E.00589
; LINE_WIDTH: 0.419667
G1 X128 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X128 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X128 Y125.046 E.00857
M204 S10000
G1 X121.216 Y125.706 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X122.83 Y125.494 E.05401
G1 X123.788 Y124.536 E.04493
G1 X124.449 Y124.449 E.0221
G1 X125.184 Y125.184 E.03448
G1 X127.392 Y124.893 E.07389
G1 X127.392 Y124.697 E.00649
G1 X128.608 Y124.697 E.04032
G1 X128.608 Y124.893 E.00649
G1 X130.816 Y125.184 E.07389
G1 X131.551 Y124.449 E.03448
G1 X132.212 Y124.536 E.0221
G1 X133.17 Y125.494 E.04493
G1 X134.784 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X133.17 Y125.494 E-.61876
G1 X132.907 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.415 Y124.585 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130855
G1 F2455
M204 S6000
G1 X139.587 Y125.002 E.02293
; WIPE_START
M73 P53 R9
G1 F15000
G1 X137.605 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.89 Y130.612 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X133.276 Y130.4 E.05401
G1 X132.541 Y131.135 E.03448
G1 X130.922 Y130.922 E.05419
G1 X129.964 Y129.964 E.04493
G1 X128 Y129.705 E.06571
G1 X126.036 Y129.964 E.06571
G1 X125.078 Y130.922 E.04493
G1 X123.459 Y131.135 E.05419
G1 X122.724 Y130.4 E.03448
G1 X121.11 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X122.724 Y130.4 E-.61876
G1 X122.987 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.564 Y132.02 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130849
G1 F2455
M204 S6000
G1 X117.392 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X119.375 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.462 Y125.122 Z6 F42000
G1 X116.413 Y125.002 Z6
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.130852
G1 F2455
M204 S6000
G1 X119.585 Y124.585 E.02293
; WIPE_START
G1 F15000
G1 X117.602 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.683 Y127.694 Z6 F42000
G1 X135.436 Y132.02 Z6
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.130849
G1 F2455
M204 S6000
G1 X138.608 Y132.438 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X136.625 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/85
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z6 I.789 J-.926 P1  F42000
G1 X128.467 Y125.226 Z6
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X128.107 Y127.961 E.09151
G1 X127.893 Y127.961 E.0071
G1 X127.533 Y125.226 E.09151
G1 X119.998 Y126.218 E.25211
G1 X119.799 Y124.71 E.05045
G1 X126.731 Y123.797 E.23192
G3 X128.134 Y123.717 I1.528 J14.351 E.04662
G3 X129.269 Y123.797 I-.172 J10.472 E.03778
G1 X136.201 Y124.71 E.23192
G1 X136.002 Y126.218 E.05045
G1 X128.527 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X128.223 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.631 Y129.534 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
G1 F2455
M204 S6000
G1 X128 Y129.354 E.04581
G1 X135.46 Y130.336 E.24959
G1 X135.261 Y131.844 E.05045
G1 X128.317 Y130.93 E.23235
G2 X127.683 Y130.93 I-.317 J4.251 E.02103
G1 X120.739 Y131.844 E.23236
G1 X120.54 Y130.336 E.05045
G1 X126.571 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X128 Y129.354 E-.54753
G1 X128.554 Y129.427 E-.21247
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.805 Y125.666 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2455
M204 S5000
G1 X128.365 Y129.007 E.10355
G1 X135.9 Y129.999 E.23353
G1 X135.662 Y131.808 E.05608
G1 X138.606 Y132.196 E.09126
G1 X138.668 Y131.725 E.0146
G1 X138.896 Y131.755 E.00706
G1 X138.795 Y132.52 E.02371
G3 X138.576 Y132.676 I-.19 J-.035 E.00915
G1 X128.27 Y131.319 E.3194
G2 X127.73 Y131.319 I-.27 J3.667 E.01661
G1 X117.354 Y132.674 E.32152
G3 X117.205 Y132.52 I.041 J-.189 E.007
G1 X117.104 Y131.755 E.02372
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.0146
G1 X120.338 Y131.808 E.09126
G1 X120.1 Y129.999 E.05608
G1 X127.635 Y129.007 E.23353
G1 X127.195 Y125.666 E.10355
G1 X119.66 Y126.658 E.23353
G1 X119.422 Y124.848 E.05608
G1 X116.478 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.213 Y124.986 E.02326
G3 X116.383 Y124.764 I.192 J-.029 E.0096
G1 X126.684 Y123.408 E.31925
G3 X128.142 Y123.325 I1.582 J14.888 E.0449
G3 X129.316 Y123.408 I-.18 J10.857 E.03619
G1 X139.617 Y124.764 E.31925
G3 X139.787 Y124.986 I-.031 J.2 E.00949
G1 X139.689 Y125.737 E.02326
G1 X139.46 Y125.707 E.00707
G1 X139.522 Y125.236 E.0146
G1 X136.578 Y124.848 E.09126
G1 X136.34 Y126.658 E.05608
G1 X128.864 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.568 Y127.651 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X128 Y128.157 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.513104
G1 F2455
M204 S6000
G1 X128 Y128.365 E.00796
; LINE_WIDTH: 0.474813
G1 X128 Y128.573 E.00731
; LINE_WIDTH: 0.436521
G1 X128 Y128.78 E.00667
; LINE_WIDTH: 0.39823
G1 X128 Y128.988 E.00602
; LINE_WIDTH: 0.357143
G1 X128.146 Y129.166 E.00589
; WIPE_START
G1 F11456.834
G1 X128 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128 Y127.035 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.121749
G1 F2455
M204 S6000
G1 X128 Y126.814 E.00142
; LINE_WIDTH: 0.1714
G1 X128 Y126.593 E.00231
; LINE_WIDTH: 0.221051
G1 X128 Y126.372 E.00321
; LINE_WIDTH: 0.270702
G1 X128 Y126.151 E.0041
; LINE_WIDTH: 0.320354
G1 X128 Y125.93 E.005
; LINE_WIDTH: 0.370005
G1 X128 Y125.709 E.00589
; LINE_WIDTH: 0.419656
G1 X128 Y125.488 E.00679
; LINE_WIDTH: 0.469307
G1 X128 Y125.267 E.00768
; LINE_WIDTH: 0.518958
G1 X128 Y125.046 E.00857
M204 S10000
G1 X134.784 Y125.706 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X133.17 Y125.494 E.05401
G1 X132.212 Y124.536 E.04493
G1 X131.551 Y124.449 E.0221
G1 X130.816 Y125.184 E.03448
G1 X128.608 Y124.893 E.07389
G1 X128.608 Y124.698 E.00648
G1 X127.392 Y124.698 E.04032
G1 X127.392 Y124.893 E.00648
G1 X125.184 Y125.184 E.07389
G1 X124.449 Y124.449 E.03448
G1 X123.788 Y124.536 E.0221
G1 X122.83 Y125.494 E.04493
G1 X121.216 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X122.83 Y125.494 E-.61876
G1 X123.093 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.585 Y124.585 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130851
G1 F2455
M204 S6000
G1 X116.413 Y125.002 E.02293
; WIPE_START
G1 F15000
G1 X118.395 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.11 Y130.612 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X122.724 Y130.4 E.05401
G1 X123.459 Y131.135 E.03448
G1 X125.078 Y130.922 E.05419
G1 X126.036 Y129.964 E.04493
G1 X128 Y129.705 E.06571
G1 X129.964 Y129.964 E.06571
G1 X130.922 Y130.922 E.04493
G1 X132.541 Y131.135 E.05419
G1 X133.276 Y130.4 E.03448
G1 X134.89 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X133.276 Y130.4 E-.61876
G1 X133.013 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.436 Y132.02 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130858
G1 F2455
M204 S6000
G1 X138.608 Y132.438 E.02293
; WIPE_START
G1 F15000
G1 X136.625 Y132.177 E-.76
; WIPE_END
M73 P54 R9
G1 E-.04 F1800
M204 S10000
G1 X139.538 Y125.122 Z6.2 F42000
G1 X139.587 Y125.002 Z6.2
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.130835
G1 F2455
M204 S6000
G1 X136.415 Y124.585 E.02292
; WIPE_START
G1 F15000
G1 X138.398 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.317 Y127.694 Z6.2 F42000
G1 X120.564 Y132.02 Z6.2
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.13085
G1 F2455
M204 S6000
G1 X117.392 Y132.438 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X119.375 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/85
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z6.2 I.739 J.967 P1  F42000
G1 X128.467 Y125.226 Z6.2
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2468
M204 S6000
G1 X128.107 Y127.961 E.09151
G1 X127.893 Y127.961 E.0071
G1 X127.533 Y125.226 E.09151
G1 X119.998 Y126.218 E.25211
G1 X119.799 Y124.71 E.05045
G1 X126.731 Y123.797 E.23192
G3 X128.139 Y123.717 I1.521 J14.264 E.04681
G3 X129.269 Y123.797 I-.176 J10.458 E.0376
G1 X136.201 Y124.71 E.23192
G1 X136.002 Y126.218 E.05045
G1 X128.527 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X128.223 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.631 Y129.534 Z6.4 F42000
G1 Z6
G1 E.8 F1800
G1 F2468
M204 S6000
G1 X128 Y129.354 E.04581
G1 X135.46 Y130.336 E.24959
G1 X135.261 Y131.844 E.05045
G1 X128.317 Y130.93 E.23236
G2 X127.69 Y130.929 I-.318 J3.312 E.02082
G1 X120.739 Y131.844 E.23257
G1 X120.54 Y130.336 E.05045
G1 X126.571 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X128 Y129.354 E-.54755
G1 X128.554 Y129.427 E-.21245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.805 Y125.666 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2468
M204 S5000
G1 X128.365 Y129.007 E.10355
G1 X135.9 Y129.999 E.23353
G1 X135.662 Y131.808 E.05608
G1 X138.606 Y132.196 E.09126
G1 X138.668 Y131.725 E.0146
G1 X138.896 Y131.755 E.00706
G1 X138.78 Y132.569 E.02526
G3 X138.576 Y132.676 I-.176 J-.088 E.00756
G1 X128.27 Y131.319 E.3194
G2 X127.732 Y131.319 I-.27 J2.785 E.01655
G1 X117.354 Y132.674 E.32159
G3 X117.205 Y132.52 I.041 J-.189 E.007
G1 X117.104 Y131.755 E.02371
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.0146
G1 X120.338 Y131.808 E.09126
G1 X120.1 Y129.999 E.05608
G1 X127.635 Y129.007 E.23353
G1 X127.195 Y125.666 E.10355
G1 X119.66 Y126.658 E.23353
G1 X119.422 Y124.848 E.05608
G1 X116.478 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.213 Y124.986 E.02326
G3 X116.383 Y124.764 I.201 J-.022 E.00949
G1 X126.684 Y123.408 E.31925
G3 X128.148 Y123.325 I1.575 J14.803 E.04507
G3 X129.316 Y123.408 I-.185 J10.851 E.03602
G1 X139.617 Y124.764 E.31925
G3 X139.787 Y124.986 I-.031 J.2 E.00949
G1 X139.689 Y125.737 E.02326
G1 X139.46 Y125.707 E.00707
G1 X139.522 Y125.236 E.0146
G1 X136.578 Y124.848 E.09126
G1 X136.34 Y126.658 E.05608
G1 X128.864 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.568 Y127.651 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X128 Y128.157 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51311
G1 F2468
M204 S6000
G1 X128 Y128.365 E.00796
; LINE_WIDTH: 0.474822
G1 X128 Y128.573 E.00731
; LINE_WIDTH: 0.436535
G1 X128 Y128.78 E.00667
; LINE_WIDTH: 0.398247
G1 X128 Y128.988 E.00602
; LINE_WIDTH: 0.357162
G1 X128.146 Y129.166 E.00589
; WIPE_START
G1 F11456.137
G1 X128 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128 Y127.035 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.12175
G1 F2468
M204 S6000
G1 X128 Y126.814 E.00142
; LINE_WIDTH: 0.171403
G1 X128 Y126.593 E.00231
; LINE_WIDTH: 0.221056
G1 X128 Y126.372 E.00321
; LINE_WIDTH: 0.270708
G1 X128 Y126.151 E.0041
; LINE_WIDTH: 0.320361
G1 X128 Y125.93 E.005
; LINE_WIDTH: 0.370014
G1 X128 Y125.709 E.00589
; LINE_WIDTH: 0.419667
G1 X128 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X128 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X128 Y125.046 E.00857
; WIPE_START
G1 F7562.194
G1 X128 Y125.267 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.37 Y125.093 Z6.4 F42000
G1 X116.413 Y125.002 Z6.4
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.130851
G1 F2468
M204 S6000
G1 X119.585 Y124.585 E.02293
; WIPE_START
G1 F15000
G1 X117.602 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.216 Y125.706 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2468
M204 S6000
G1 X122.83 Y125.494 E.05401
G1 X123.788 Y124.536 E.04493
G1 X124.449 Y124.449 E.0221
G1 X125.184 Y125.184 E.03448
G1 X127.392 Y124.893 E.07389
G1 X127.392 Y124.697 E.00649
G1 X128.608 Y124.697 E.04032
G1 X128.608 Y124.893 E.00649
G1 X130.816 Y125.184 E.07389
G1 X131.551 Y124.449 E.03448
G1 X132.212 Y124.536 E.0221
G1 X133.17 Y125.494 E.04493
G1 X134.784 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X133.17 Y125.494 E-.61876
G1 X132.907 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.415 Y124.585 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130855
G1 F2468
M204 S6000
G1 X139.587 Y125.002 E.02293
; WIPE_START
G1 F15000
G1 X137.605 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.591 Y132.31 Z6.4 F42000
G1 X138.608 Y132.438 Z6.4
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.130847
G1 F2468
M204 S6000
G1 X135.436 Y132.02 E.02292
; WIPE_START
G1 F15000
G1 X137.419 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.89 Y130.612 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2468
M204 S6000
G1 X133.276 Y130.4 E.05401
G1 X132.541 Y131.135 E.03448
G1 X130.922 Y130.922 E.05419
G1 X129.964 Y129.964 E.04493
G1 X128 Y129.705 E.06571
G1 X126.036 Y129.964 E.06571
G1 X125.078 Y130.922 E.04493
G1 X123.459 Y131.135 E.05419
G1 X122.724 Y130.4 E.03448
G1 X121.11 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X122.724 Y130.4 E-.61876
G1 X122.987 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.564 Y132.02 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130853
G1 F2468
M204 S6000
G1 X117.392 Y132.438 E.02293
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X119.375 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/85
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z6.4 I.739 J.967 P1  F42000
G1 X128.467 Y125.226 Z6.4
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2468
M204 S6000
G1 X128.107 Y127.961 E.09151
G1 X127.893 Y127.961 E.0071
G1 X127.533 Y125.226 E.09151
G1 X119.998 Y126.218 E.25211
G1 X119.799 Y124.71 E.05045
G1 X126.731 Y123.797 E.23192
G3 X128.145 Y123.717 I1.515 J14.182 E.04699
G3 X129.269 Y123.797 I-.181 J10.448 E.03742
G1 X136.201 Y124.71 E.23192
G1 X136.002 Y126.218 E.05045
G1 X128.527 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X128.223 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.631 Y129.534 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
G1 F2468
M204 S6000
G1 X128 Y129.354 E.04581
G1 X135.46 Y130.336 E.24959
G1 X135.261 Y131.844 E.05045
G1 X128.317 Y130.93 E.23235
G2 X127.687 Y130.929 I-.318 J3.903 E.02093
G1 X120.739 Y131.844 E.23246
G1 X120.54 Y130.336 E.05045
G1 X126.571 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X128 Y129.354 E-.54755
G1 X128.554 Y129.427 E-.21245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.805 Y125.666 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2468
M204 S5000
G1 X128.365 Y129.007 E.10355
G1 X135.9 Y129.999 E.23353
G1 X135.662 Y131.808 E.05608
G1 X138.606 Y132.196 E.09126
G1 X138.668 Y131.725 E.0146
G1 X138.896 Y131.755 E.00706
G1 X138.791 Y132.538 E.02428
G3 X138.577 Y132.676 I-.185 J-.052 E.00855
G1 X128.27 Y131.319 E.31944
G2 X127.731 Y131.319 I-.27 J3.33 E.01657
G1 X117.424 Y132.676 E.31946
G1 X117.35 Y132.673 E.00227
M73 P55 R9
G3 X117.205 Y132.521 I.044 J-.187 E.00681
G1 X117.104 Y131.755 E.02376
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.0146
G1 X120.338 Y131.808 E.09126
G1 X120.1 Y129.999 E.05608
G1 X127.635 Y129.007 E.23353
G1 X127.195 Y125.666 E.10355
G1 X119.66 Y126.658 E.23353
G1 X119.422 Y124.848 E.05608
G1 X116.478 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.213 Y124.986 E.02327
G3 X116.383 Y124.764 I.201 J-.022 E.00949
G1 X126.684 Y123.408 E.31925
G3 X128.153 Y123.325 I1.569 J14.722 E.04524
G3 X129.316 Y123.408 I-.189 J10.841 E.03585
G1 X139.617 Y124.764 E.31925
G3 X139.787 Y124.986 I-.027 J.197 E.00952
G1 X139.689 Y125.737 E.02327
G1 X139.46 Y125.707 E.00707
G1 X139.522 Y125.236 E.0146
G1 X136.578 Y124.848 E.09126
G1 X136.34 Y126.658 E.05608
G1 X128.864 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.568 Y127.651 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X128 Y128.157 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51311
G1 F2468
M204 S6000
G1 X128 Y128.365 E.00796
; LINE_WIDTH: 0.474822
G1 X128 Y128.573 E.00731
; LINE_WIDTH: 0.436535
G1 X128 Y128.78 E.00667
; LINE_WIDTH: 0.398247
G1 X128 Y128.988 E.00602
; LINE_WIDTH: 0.357162
G1 X128.146 Y129.166 E.00589
; WIPE_START
G1 F11456.137
G1 X128 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128 Y127.035 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.12175
G1 F2468
M204 S6000
G1 X128 Y126.814 E.00142
; LINE_WIDTH: 0.171403
G1 X128 Y126.593 E.00231
; LINE_WIDTH: 0.221056
G1 X128 Y126.372 E.00321
; LINE_WIDTH: 0.270708
G1 X128 Y126.151 E.0041
; LINE_WIDTH: 0.320361
G1 X128 Y125.93 E.005
; LINE_WIDTH: 0.370014
G1 X128 Y125.709 E.00589
; LINE_WIDTH: 0.419667
G1 X128 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X128 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X128 Y125.046 E.00857
; WIPE_START
G1 F7562.194
G1 X128 Y125.267 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.63 Y125.093 Z6.6 F42000
G1 X139.587 Y125.002 Z6.6
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.130845
G1 F2468
M204 S6000
G1 X136.415 Y124.585 E.02293
; WIPE_START
G1 F15000
G1 X138.398 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.784 Y125.706 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2468
M204 S6000
G1 X133.17 Y125.494 E.05401
G1 X132.212 Y124.536 E.04493
G1 X131.551 Y124.449 E.0221
G1 X130.816 Y125.184 E.03448
G1 X128.608 Y124.893 E.07389
G1 X128.608 Y124.697 E.00649
G1 X127.392 Y124.697 E.04032
G1 X127.392 Y124.893 E.00649
G1 X125.184 Y125.184 E.07389
G1 X124.449 Y124.449 E.03448
G1 X123.788 Y124.536 E.0221
G1 X122.83 Y125.494 E.04493
G1 X121.216 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X122.83 Y125.494 E-.61876
G1 X123.093 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.585 Y124.585 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130863
G1 F2468
M204 S6000
G1 X116.413 Y125.002 E.02293
; WIPE_START
G1 F15000
G1 X118.395 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.409 Y132.31 Z6.6 F42000
G1 X117.392 Y132.438 Z6.6
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.130853
G1 F2468
M204 S6000
G1 X120.564 Y132.02 E.02293
; WIPE_START
G1 F15000
G1 X118.581 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.11 Y130.612 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2468
M204 S6000
G1 X122.724 Y130.4 E.05401
G1 X123.459 Y131.135 E.03448
G1 X125.078 Y130.922 E.05419
G1 X126.036 Y129.964 E.04493
G1 X128 Y129.705 E.06571
G1 X129.964 Y129.964 E.06571
G1 X130.922 Y130.922 E.04493
G1 X132.541 Y131.135 E.05419
G1 X133.276 Y130.4 E.03448
G1 X134.89 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X133.276 Y130.4 E-.61876
G1 X133.013 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.436 Y132.02 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130847
G1 F2468
M204 S6000
G1 X138.608 Y132.438 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X136.625 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/85
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z6.6 I.789 J-.926 P1  F42000
G1 X128.467 Y125.226 Z6.6
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2467
M204 S6000
G1 X128.107 Y127.961 E.09151
G1 X127.893 Y127.961 E.0071
G1 X127.533 Y125.226 E.09151
G1 X119.998 Y126.218 E.25211
G1 X119.799 Y124.71 E.05045
G1 X126.731 Y123.797 E.23192
G3 X128.15 Y123.717 I1.509 J14.104 E.04717
G3 X129.269 Y123.797 I-.185 J10.434 E.03724
G1 X136.201 Y124.71 E.23191
G1 X136.002 Y126.218 E.05045
G1 X128.527 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X128.223 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.631 Y129.534 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
G1 F2467
M204 S6000
G1 X128 Y129.354 E.04581
G1 X135.46 Y130.336 E.2496
G1 X135.261 Y131.844 E.05045
G1 X128.317 Y130.93 E.23236
G2 X127.683 Y130.93 I-.317 J4.256 E.02102
G1 X120.739 Y131.844 E.23236
G1 X120.54 Y130.336 E.05045
G1 X126.571 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X128 Y129.354 E-.54753
G1 X128.554 Y129.427 E-.21247
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.805 Y125.666 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2467
M204 S5000
G1 X128.365 Y129.007 E.10355
G1 X135.9 Y129.999 E.23353
G1 X135.662 Y131.808 E.05608
G1 X138.606 Y132.196 E.09126
G1 X138.668 Y131.725 E.0146
G1 X138.896 Y131.755 E.00706
G1 X138.795 Y132.52 E.02371
G1 X138.768 Y132.591 E.00233
G3 X138.577 Y132.676 I-.162 J-.107 E.00678
G1 X128.27 Y131.319 E.31944
G2 X127.73 Y131.319 I-.27 J3.668 E.01661
G1 X117.424 Y132.676 E.3194
G1 X117.35 Y132.673 E.0023
G1 X117.271 Y132.635 E.00268
G3 X117.205 Y132.521 I.132 J-.153 E.00411
G1 X117.104 Y131.755 E.02375
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.0146
G1 X120.338 Y131.808 E.09126
G1 X120.1 Y129.999 E.05608
G1 X127.635 Y129.007 E.23353
G1 X127.195 Y125.666 E.10355
G1 X119.66 Y126.658 E.23353
G1 X119.422 Y124.848 E.05608
G1 X116.478 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.213 Y124.986 E.02326
G3 X116.383 Y124.764 I.201 J-.022 E.00949
G1 X126.684 Y123.408 E.31925
G3 X128.159 Y123.325 I1.563 J14.645 E.04541
G3 X129.316 Y123.408 I-.194 J10.827 E.03568
G1 X139.617 Y124.764 E.31925
G3 X139.787 Y124.986 I-.031 J.2 E.00949
G1 X139.689 Y125.737 E.02326
G1 X139.46 Y125.707 E.00707
G1 X139.522 Y125.236 E.0146
G1 X136.578 Y124.848 E.09126
G1 X136.34 Y126.658 E.05608
G1 X128.864 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.568 Y127.651 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X128 Y128.157 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.513104
G1 F2467
M204 S6000
G1 X128 Y128.365 E.00796
; LINE_WIDTH: 0.474812
G1 X128 Y128.573 E.00731
; LINE_WIDTH: 0.43652
G1 X128 Y128.78 E.00667
; LINE_WIDTH: 0.398228
G1 X128 Y128.988 E.00602
; LINE_WIDTH: 0.357153
G1 X128.146 Y129.166 E.00589
; WIPE_START
G1 F11456.472
G1 X128 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128 Y127.035 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.121749
G1 F2467
M204 S6000
G1 X128 Y126.814 E.00142
; LINE_WIDTH: 0.1714
M73 P55 R8
G1 X128 Y126.593 E.00231
; LINE_WIDTH: 0.221051
G1 X128 Y126.372 E.00321
; LINE_WIDTH: 0.270702
G1 X128 Y126.151 E.0041
; LINE_WIDTH: 0.320354
G1 X128 Y125.93 E.005
; LINE_WIDTH: 0.370005
G1 X128 Y125.709 E.00589
; LINE_WIDTH: 0.419656
G1 X128 Y125.488 E.00679
; LINE_WIDTH: 0.469307
G1 X128 Y125.267 E.00768
; LINE_WIDTH: 0.518958
M73 P56 R8
G1 X128 Y125.046 E.00857
; WIPE_START
G1 F7562.425
G1 X128 Y125.267 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.37 Y125.093 Z6.8 F42000
G1 X116.413 Y125.002 Z6.8
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.130827
G1 F2467
M204 S6000
G1 X119.585 Y124.585 E.02292
; WIPE_START
G1 F15000
G1 X117.602 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.216 Y125.706 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2467
M204 S6000
G1 X122.83 Y125.494 E.05401
G1 X123.788 Y124.536 E.04493
G1 X124.449 Y124.449 E.0221
G1 X125.184 Y125.184 E.03448
G1 X127.392 Y124.893 E.07389
G1 X127.392 Y124.698 E.00648
G1 X128.608 Y124.698 E.04032
G1 X128.608 Y124.893 E.00648
G1 X130.816 Y125.184 E.07389
G1 X131.551 Y124.449 E.03448
G1 X132.212 Y124.536 E.0221
G1 X133.17 Y125.494 E.04493
G1 X134.784 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X133.17 Y125.494 E-.61876
G1 X132.907 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.415 Y124.585 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130835
G1 F2467
M204 S6000
G1 X139.587 Y125.002 E.02292
; WIPE_START
G1 F15000
G1 X137.605 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.591 Y132.31 Z6.8 F42000
G1 X138.608 Y132.438 Z6.8
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.13084
G1 F2467
M204 S6000
G1 X135.436 Y132.02 E.02292
; WIPE_START
G1 F15000
G1 X137.419 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.89 Y130.612 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2467
M204 S6000
G1 X133.276 Y130.4 E.05401
G1 X132.541 Y131.135 E.03448
G1 X130.922 Y130.922 E.05419
G1 X129.964 Y129.964 E.04493
G1 X128 Y129.705 E.06571
G1 X126.036 Y129.964 E.06571
G1 X125.078 Y130.922 E.04493
G1 X123.459 Y131.135 E.05419
G1 X122.724 Y130.4 E.03448
G1 X121.11 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X122.724 Y130.4 E-.61876
G1 X122.987 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.564 Y132.02 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130853
G1 F2467
M204 S6000
G1 X117.392 Y132.438 E.02293
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X119.375 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/85
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z6.8 I.739 J.967 P1  F42000
G1 X128.467 Y125.226 Z6.8
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X128.107 Y127.961 E.09151
G1 X127.893 Y127.961 E.0071
G1 X127.533 Y125.226 E.09151
G1 X119.998 Y126.218 E.25211
G1 X119.799 Y124.71 E.05045
G1 X126.731 Y123.797 E.23192
G3 X128.156 Y123.717 I1.503 J14.029 E.04736
G3 X129.269 Y123.797 I-.19 J10.425 E.03705
G1 X136.201 Y124.71 E.23191
G1 X136.002 Y126.218 E.05045
G1 X128.527 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X128.223 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.631 Y129.534 Z7 F42000
G1 Z6.6
G1 E.8 F1800
G1 F2455
M204 S6000
G1 X128 Y129.354 E.04581
G1 X135.46 Y130.336 E.24959
G1 X135.261 Y131.844 E.05045
G1 X128.317 Y130.93 E.23235
G2 X127.683 Y130.93 I-.317 J4.251 E.02103
G1 X120.739 Y131.844 E.23236
G1 X120.54 Y130.336 E.05045
G1 X126.571 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X128 Y129.354 E-.54755
G1 X128.554 Y129.427 E-.21245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.805 Y125.666 Z7 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2455
M204 S5000
G1 X128.365 Y129.007 E.10355
G1 X135.9 Y129.999 E.23353
G1 X135.662 Y131.808 E.05608
G1 X138.606 Y132.196 E.09126
G1 X138.668 Y131.725 E.0146
G1 X138.896 Y131.755 E.00706
G1 X138.781 Y132.565 E.02516
G3 X138.576 Y132.676 I-.178 J-.084 E.00767
G1 X128.27 Y131.319 E.3194
G2 X127.73 Y131.319 I-.27 J3.667 E.01661
G1 X117.354 Y132.674 E.32152
G3 X117.205 Y132.521 I.041 J-.189 E.00696
G1 X117.104 Y131.755 E.02376
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.0146
G1 X120.338 Y131.808 E.09126
G1 X120.1 Y129.999 E.05608
G1 X127.635 Y129.007 E.23353
G1 X127.195 Y125.666 E.10355
G1 X119.66 Y126.658 E.23353
G1 X119.422 Y124.848 E.05608
G1 X116.478 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.213 Y124.986 E.02326
G3 X116.383 Y124.764 I.192 J-.029 E.0096
G1 X126.684 Y123.408 E.31925
G3 X128.164 Y123.325 I1.557 J14.572 E.04558
G3 X129.316 Y123.408 I-.199 J10.819 E.03551
G1 X139.617 Y124.764 E.31925
G3 X139.787 Y124.986 I-.031 J.2 E.00949
G1 X139.689 Y125.737 E.02326
G1 X139.46 Y125.707 E.00707
G1 X139.522 Y125.236 E.0146
G1 X136.578 Y124.848 E.09126
G1 X136.34 Y126.658 E.05608
G1 X128.864 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.568 Y127.651 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X128 Y128.157 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51311
G1 F2455
M204 S6000
G1 X128 Y128.365 E.00796
; LINE_WIDTH: 0.474822
G1 X128 Y128.573 E.00731
; LINE_WIDTH: 0.436535
G1 X128 Y128.78 E.00667
; LINE_WIDTH: 0.398247
G1 X128 Y128.988 E.00602
; LINE_WIDTH: 0.357162
G1 X128.146 Y129.166 E.00589
; WIPE_START
G1 F11456.137
G1 X128 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128 Y127.035 Z7 F42000
G1 Z6.6
G1 E.8 F1800
; LINE_WIDTH: 0.12175
G1 F2455
M204 S6000
G1 X128 Y126.814 E.00142
; LINE_WIDTH: 0.171403
G1 X128 Y126.593 E.00231
; LINE_WIDTH: 0.221056
G1 X128 Y126.372 E.00321
; LINE_WIDTH: 0.270708
G1 X128 Y126.151 E.0041
; LINE_WIDTH: 0.320361
G1 X128 Y125.93 E.005
; LINE_WIDTH: 0.370014
G1 X128 Y125.709 E.00589
; LINE_WIDTH: 0.419667
G1 X128 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X128 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X128 Y125.046 E.00857
M204 S10000
G1 X134.784 Y125.706 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X133.17 Y125.494 E.05401
G1 X132.212 Y124.536 E.04493
G1 X131.551 Y124.449 E.0221
G1 X130.816 Y125.184 E.03448
G1 X128.608 Y124.893 E.07389
G1 X128.608 Y124.697 E.00649
G1 X127.392 Y124.697 E.04032
G1 X127.392 Y124.893 E.00649
G1 X125.184 Y125.184 E.07389
G1 X124.449 Y124.449 E.03448
G1 X123.788 Y124.536 E.0221
G1 X122.83 Y125.494 E.04493
G1 X121.216 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X122.83 Y125.494 E-.61876
G1 X123.093 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.585 Y124.585 Z7 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130838
G1 F2455
M204 S6000
G1 X116.413 Y125.002 E.02292
; WIPE_START
G1 F15000
G1 X118.395 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.11 Y130.612 Z7 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X122.724 Y130.4 E.05401
G1 X123.459 Y131.135 E.03448
G1 X125.078 Y130.922 E.05419
G1 X126.036 Y129.964 E.04493
G1 X128 Y129.705 E.06571
G1 X129.964 Y129.964 E.06571
G1 X130.922 Y130.922 E.04493
G1 X132.541 Y131.135 E.05419
G1 X133.276 Y130.4 E.03448
G1 X134.89 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X133.276 Y130.4 E-.61876
M73 P57 R8
G1 X133.013 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.436 Y132.02 Z7 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130847
G1 F2455
M204 S6000
G1 X138.608 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X136.625 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.538 Y125.122 Z7 F42000
G1 X139.587 Y125.002 Z7
G1 Z6.6
G1 E.8 F1800
; LINE_WIDTH: 0.130847
G1 F2455
M204 S6000
G1 X136.415 Y124.585 E.02293
; WIPE_START
G1 F15000
G1 X138.398 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.317 Y127.694 Z7 F42000
G1 X120.564 Y132.02 Z7
G1 Z6.6
G1 E.8 F1800
; LINE_WIDTH: 0.130853
G1 F2455
M204 S6000
G1 X117.392 Y132.438 E.02293
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X119.375 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/85
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z7 I.739 J.967 P1  F42000
G1 X128.467 Y125.226 Z7
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2468
M204 S6000
G1 X128.107 Y127.961 E.09151
G1 X127.893 Y127.961 E.0071
G1 X127.533 Y125.226 E.09151
G1 X119.998 Y126.218 E.25211
G1 X119.799 Y124.71 E.05045
G1 X126.731 Y123.797 E.23192
G3 X128.161 Y123.717 I1.498 J13.959 E.04754
G3 X129.269 Y123.797 I-.195 J10.416 E.03687
G1 X136.201 Y124.71 E.23192
G1 X136.002 Y126.218 E.05045
G1 X128.527 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X128.223 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.631 Y129.534 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
G1 F2468
M204 S6000
G1 X128 Y129.354 E.04581
G1 X135.46 Y130.336 E.2496
G1 X135.261 Y131.844 E.05045
G1 X128.317 Y130.93 E.23235
G2 X127.683 Y130.93 I-.317 J4.251 E.02103
G1 X120.739 Y131.844 E.23236
G1 X120.54 Y130.336 E.05045
G1 X126.571 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X128 Y129.354 E-.54755
G1 X128.554 Y129.427 E-.21245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.805 Y125.666 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2468
M204 S5000
G1 X128.365 Y129.007 E.10355
G1 X135.9 Y129.999 E.23353
G1 X135.662 Y131.808 E.05608
G1 X138.606 Y132.196 E.09126
G1 X138.668 Y131.725 E.0146
G1 X138.896 Y131.755 E.00706
G1 X138.791 Y132.538 E.02429
G3 X138.576 Y132.676 I-.184 J-.051 E.0086
G1 X128.27 Y131.319 E.3194
G2 X127.73 Y131.319 I-.27 J3.667 E.01661
G1 X117.355 Y132.674 E.32152
G3 X117.205 Y132.52 I.038 J-.186 E.00702
G1 X117.104 Y131.755 E.02371
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.0146
G1 X120.338 Y131.808 E.09126
G1 X120.1 Y129.999 E.05608
G1 X127.635 Y129.007 E.23353
G1 X127.195 Y125.666 E.10355
G1 X119.66 Y126.658 E.23353
G1 X119.422 Y124.848 E.05608
G1 X116.478 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.213 Y124.986 E.02327
G3 X116.383 Y124.764 I.201 J-.022 E.00949
G1 X126.684 Y123.408 E.31925
G3 X128.17 Y123.325 I1.552 J14.502 E.04575
G3 X129.316 Y123.408 I-.203 J10.809 E.03534
G1 X139.617 Y124.764 E.31925
G3 X139.787 Y124.986 I-.032 J.201 E.00948
G1 X139.689 Y125.737 E.02327
G1 X139.46 Y125.707 E.00707
G1 X139.522 Y125.236 E.0146
G1 X136.578 Y124.848 E.09126
G1 X136.34 Y126.658 E.05608
G1 X128.864 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.568 Y127.651 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X128 Y128.157 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51311
G1 F2468
M204 S6000
G1 X128 Y128.365 E.00796
; LINE_WIDTH: 0.474822
G1 X128 Y128.573 E.00731
; LINE_WIDTH: 0.436535
G1 X128 Y128.78 E.00667
; LINE_WIDTH: 0.398247
G1 X128 Y128.988 E.00602
; LINE_WIDTH: 0.357162
G1 X128.146 Y129.166 E.00589
; WIPE_START
G1 F11456.137
G1 X128 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128 Y127.035 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
; LINE_WIDTH: 0.12175
G1 F2468
M204 S6000
G1 X128 Y126.814 E.00142
; LINE_WIDTH: 0.171403
G1 X128 Y126.593 E.00231
; LINE_WIDTH: 0.221056
G1 X128 Y126.372 E.00321
; LINE_WIDTH: 0.270708
G1 X128 Y126.151 E.0041
; LINE_WIDTH: 0.320361
G1 X128 Y125.93 E.005
; LINE_WIDTH: 0.370014
G1 X128 Y125.709 E.00589
; LINE_WIDTH: 0.419667
G1 X128 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X128 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X128 Y125.046 E.00857
; WIPE_START
G1 F7562.194
G1 X128 Y125.267 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.37 Y125.093 Z7.2 F42000
G1 X116.413 Y125.002 Z7.2
G1 Z6.8
G1 E.8 F1800
; LINE_WIDTH: 0.130851
G1 F2468
M204 S6000
G1 X119.585 Y124.585 E.02293
; WIPE_START
G1 F15000
G1 X117.602 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.216 Y125.706 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2468
M204 S6000
G1 X122.83 Y125.494 E.05401
G1 X123.788 Y124.536 E.04493
G1 X124.449 Y124.449 E.0221
G1 X125.184 Y125.184 E.03448
G1 X127.392 Y124.893 E.07389
G1 X127.392 Y124.697 E.00649
G1 X128.608 Y124.697 E.04032
G1 X128.608 Y124.893 E.00649
G1 X130.816 Y125.184 E.07389
G1 X131.551 Y124.449 E.03448
G1 X132.212 Y124.536 E.0221
G1 X133.17 Y125.494 E.04493
G1 X134.784 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X133.17 Y125.494 E-.61876
G1 X132.907 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.415 Y124.585 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130835
G1 F2468
M204 S6000
G1 X139.587 Y125.002 E.02292
; WIPE_START
G1 F15000
G1 X137.605 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.591 Y132.31 Z7.2 F42000
G1 X138.608 Y132.438 Z7.2
G1 Z6.8
G1 E.8 F1800
; LINE_WIDTH: 0.130849
G1 F2468
M204 S6000
G1 X135.436 Y132.02 E.02292
; WIPE_START
G1 F15000
G1 X137.419 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.89 Y130.612 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2468
M204 S6000
G1 X133.276 Y130.4 E.05401
G1 X132.541 Y131.135 E.03448
G1 X130.922 Y130.922 E.05419
G1 X129.964 Y129.964 E.04493
G1 X128 Y129.705 E.06571
G1 X126.036 Y129.964 E.06571
G1 X125.078 Y130.922 E.04493
G1 X123.459 Y131.135 E.05419
G1 X122.724 Y130.4 E.03448
M73 P58 R8
G1 X121.11 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X122.724 Y130.4 E-.61876
G1 X122.987 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.564 Y132.02 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130852
G1 F2468
M204 S6000
G1 X117.392 Y132.438 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X119.375 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/85
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z7.2 I.739 J.967 P1  F42000
G1 X128.467 Y125.226 Z7.2
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X128.107 Y127.961 E.09151
G1 X127.893 Y127.961 E.0071
G1 X127.533 Y125.226 E.09151
G1 X119.998 Y126.218 E.25211
G1 X119.799 Y124.71 E.05045
G1 X126.731 Y123.797 E.23192
G3 X128.167 Y123.717 I1.493 J13.892 E.04772
G3 X129.269 Y123.797 I-.2 J10.417 E.03668
G1 X136.201 Y124.71 E.23192
G1 X136.002 Y126.218 E.05045
G1 X128.527 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X128.223 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.631 Y129.534 Z7.4 F42000
G1 Z7
G1 E.8 F1800
G1 F2455
M204 S6000
G1 X128 Y129.354 E.04581
G1 X135.46 Y130.336 E.24959
G1 X135.261 Y131.844 E.05045
G1 X128.317 Y130.93 E.23236
G2 X127.683 Y130.93 I-.317 J4.256 E.02102
G1 X120.739 Y131.844 E.23236
G1 X120.54 Y130.336 E.05045
G1 X126.571 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X128 Y129.354 E-.54755
G1 X128.554 Y129.427 E-.21245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.805 Y125.666 Z7.4 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2455
M204 S5000
G1 X128.365 Y129.007 E.10355
G1 X135.9 Y129.999 E.23353
G1 X135.662 Y131.808 E.05608
G1 X138.606 Y132.196 E.09126
G1 X138.668 Y131.725 E.0146
G1 X138.896 Y131.755 E.00706
G1 X138.795 Y132.52 E.02371
G3 X138.576 Y132.676 I-.191 J-.036 E.00914
G1 X128.27 Y131.319 E.3194
G2 X127.73 Y131.319 I-.27 J3.669 E.01661
G1 X117.354 Y132.674 E.32152
G3 X117.205 Y132.521 I.041 J-.189 E.00696
G1 X117.104 Y131.755 E.02376
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.0146
G1 X120.338 Y131.808 E.09126
G1 X120.1 Y129.999 E.05608
G1 X127.635 Y129.007 E.23353
G1 X127.195 Y125.666 E.10355
G1 X119.66 Y126.658 E.23353
G1 X119.422 Y124.848 E.05608
G1 X116.478 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.213 Y124.986 E.02326
G3 X116.383 Y124.764 I.203 J-.021 E.00948
G1 X126.684 Y123.408 E.31925
G3 X128.175 Y123.325 I1.547 J14.436 E.04592
G3 X129.316 Y123.408 I-.209 J10.81 E.03517
G1 X139.617 Y124.764 E.31925
G3 X139.787 Y124.986 I-.032 J.201 E.00948
G1 X139.689 Y125.737 E.02326
G1 X139.46 Y125.707 E.00707
G1 X139.522 Y125.236 E.0146
G1 X136.578 Y124.848 E.09126
G1 X136.34 Y126.658 E.05608
G1 X128.864 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.568 Y127.651 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X128 Y128.157 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51311
G1 F2455
M204 S6000
G1 X128 Y128.365 E.00796
; LINE_WIDTH: 0.474822
G1 X128 Y128.573 E.00731
; LINE_WIDTH: 0.436535
G1 X128 Y128.78 E.00667
; LINE_WIDTH: 0.398247
G1 X128 Y128.988 E.00602
; LINE_WIDTH: 0.357162
G1 X128.146 Y129.166 E.00589
; WIPE_START
G1 F11456.137
G1 X128 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128 Y127.035 Z7.4 F42000
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.12175
G1 F2455
M204 S6000
G1 X128 Y126.814 E.00142
; LINE_WIDTH: 0.171403
G1 X128 Y126.593 E.00231
; LINE_WIDTH: 0.221056
G1 X128 Y126.372 E.00321
; LINE_WIDTH: 0.270708
G1 X128 Y126.151 E.0041
; LINE_WIDTH: 0.320361
G1 X128 Y125.93 E.005
; LINE_WIDTH: 0.370014
G1 X128 Y125.709 E.00589
; LINE_WIDTH: 0.419667
G1 X128 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X128 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X128 Y125.046 E.00857
M204 S10000
G1 X134.784 Y125.706 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X133.17 Y125.494 E.05401
G1 X132.212 Y124.536 E.04493
G1 X131.551 Y124.449 E.0221
G1 X130.816 Y125.184 E.03448
G1 X128.608 Y124.893 E.07389
G1 X128.608 Y124.697 E.00649
G1 X127.392 Y124.697 E.04032
G1 X127.392 Y124.893 E.00649
G1 X125.184 Y125.184 E.07389
G1 X124.449 Y124.449 E.03448
G1 X123.788 Y124.536 E.0221
G1 X122.83 Y125.494 E.04493
G1 X121.216 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X122.83 Y125.494 E-.61876
G1 X123.093 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.585 Y124.585 Z7.4 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130851
G1 F2455
M204 S6000
G1 X116.413 Y125.002 E.02293
; WIPE_START
G1 F15000
G1 X118.395 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.11 Y130.612 Z7.4 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X122.724 Y130.4 E.05401
G1 X123.459 Y131.135 E.03448
G1 X125.078 Y130.922 E.05419
G1 X126.036 Y129.964 E.04493
G1 X128 Y129.705 E.06571
G1 X129.964 Y129.964 E.06571
G1 X130.922 Y130.922 E.04493
G1 X132.541 Y131.135 E.05419
G1 X133.276 Y130.4 E.03448
G1 X134.89 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X133.276 Y130.4 E-.61876
G1 X133.013 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.436 Y132.02 Z7.4 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.13084
G1 F2455
M204 S6000
G1 X138.608 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X136.625 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.538 Y125.122 Z7.4 F42000
G1 X139.587 Y125.002 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.130835
G1 F2455
M204 S6000
G1 X136.415 Y124.585 E.02292
; WIPE_START
G1 F15000
G1 X138.398 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.317 Y127.694 Z7.4 F42000
G1 X120.564 Y132.02 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.130852
G1 F2455
M204 S6000
G1 X117.392 Y132.438 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X119.375 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/85
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z7.4 I.739 J.967 P1  F42000
G1 X128.467 Y125.226 Z7.4
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X128.107 Y127.961 E.09151
G1 X127.893 Y127.961 E.0071
G1 X127.533 Y125.226 E.09151
G1 X119.998 Y126.218 E.25211
G1 X119.799 Y124.71 E.05045
G1 X126.731 Y123.797 E.23192
G3 X128.172 Y123.718 I1.488 J13.828 E.04791
G3 X129.269 Y123.797 I-.205 J10.409 E.0365
G1 X136.201 Y124.71 E.23192
G1 X136.002 Y126.218 E.05045
G1 X128.527 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X128.223 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.631 Y129.534 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
G1 F2455
M204 S6000
G1 X128 Y129.354 E.04581
G1 X135.46 Y130.336 E.24959
G1 X135.261 Y131.844 E.05045
G1 X128.317 Y130.93 E.23236
G2 X127.69 Y130.929 I-.318 J3.31 E.02083
G1 X120.739 Y131.844 E.23257
G1 X120.54 Y130.336 E.05045
G1 X126.571 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X128 Y129.354 E-.54756
G1 X128.554 Y129.427 E-.21244
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.805 Y125.666 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2455
M204 S5000
G1 X128.365 Y129.007 E.10355
G1 X135.9 Y129.999 E.23353
G1 X135.662 Y131.808 E.05608
G1 X138.606 Y132.196 E.09126
G1 X138.668 Y131.725 E.0146
G1 X138.896 Y131.755 E.00706
G1 X138.795 Y132.52 E.02371
G3 X138.577 Y132.676 I-.191 J-.037 E.00909
G1 X128.27 Y131.319 E.31943
G2 X127.732 Y131.319 I-.27 J2.786 E.01655
G1 X117.424 Y132.676 E.31949
G1 X117.328 Y132.667 E.00297
G1 X117.251 Y132.616 E.00283
G3 X117.205 Y132.521 I.204 J-.158 E.00325
G1 X117.104 Y131.755 E.02375
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.0146
G1 X120.338 Y131.808 E.09126
G1 X120.1 Y129.999 E.05608
G1 X127.635 Y129.007 E.23353
G1 X127.195 Y125.666 E.10355
G1 X119.66 Y126.658 E.23353
G1 X119.422 Y124.848 E.05608
G1 X116.478 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.213 Y124.986 E.02326
G3 X116.383 Y124.764 I.191 J-.03 E.00961
G1 X126.684 Y123.408 E.31925
G3 X128.181 Y123.326 I1.542 J14.373 E.04609
G3 X129.316 Y123.408 I-.214 J10.807 E.03499
G1 X139.617 Y124.764 E.31925
G3 X139.787 Y124.986 I-.022 J.193 E.00959
G1 X139.689 Y125.737 E.02327
G1 X139.46 Y125.707 E.00707
G1 X139.522 Y125.236 E.0146
G1 X136.578 Y124.848 E.09126
G1 X136.34 Y126.658 E.05608
G1 X128.864 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.568 Y127.651 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
M73 P59 R8
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X128 Y128.157 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51311
G1 F2455
M204 S6000
G1 X128 Y128.365 E.00796
; LINE_WIDTH: 0.474823
G1 X128 Y128.573 E.00731
; LINE_WIDTH: 0.436536
G1 X128 Y128.78 E.00667
; LINE_WIDTH: 0.39825
G1 X128 Y128.988 E.00602
; LINE_WIDTH: 0.35712
G1 X128.146 Y129.166 E.00589
; WIPE_START
G1 F11457.67
G1 X128 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128 Y127.035 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; LINE_WIDTH: 0.12175
G1 F2455
M204 S6000
G1 X128 Y126.814 E.00142
; LINE_WIDTH: 0.171403
G1 X128 Y126.593 E.00231
; LINE_WIDTH: 0.221056
G1 X128 Y126.372 E.00321
; LINE_WIDTH: 0.270708
G1 X128 Y126.151 E.0041
; LINE_WIDTH: 0.320361
G1 X128 Y125.93 E.005
; LINE_WIDTH: 0.370014
G1 X128 Y125.709 E.00589
; LINE_WIDTH: 0.419667
G1 X128 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X128 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X128 Y125.046 E.00857
M204 S10000
G1 X121.216 Y125.706 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X122.83 Y125.494 E.05401
G1 X123.788 Y124.536 E.04493
G1 X124.449 Y124.449 E.0221
G1 X125.184 Y125.184 E.03448
G1 X127.392 Y124.893 E.07389
G1 X127.392 Y124.697 E.00649
G1 X128.608 Y124.697 E.04032
G1 X128.608 Y124.893 E.00649
G1 X130.816 Y125.184 E.07389
G1 X131.551 Y124.449 E.03448
G1 X132.212 Y124.536 E.0221
G1 X133.17 Y125.494 E.04493
G1 X134.784 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X133.17 Y125.494 E-.61876
G1 X132.907 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.415 Y124.585 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130837
G1 F2455
M204 S6000
G1 X139.587 Y125.002 E.02292
; WIPE_START
G1 F15000
G1 X137.605 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.89 Y130.612 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X133.276 Y130.4 E.05401
G1 X132.541 Y131.135 E.03448
G1 X130.922 Y130.922 E.05419
G1 X129.964 Y129.964 E.04493
G1 X128 Y129.705 E.0657
G1 X126.036 Y129.964 E.06571
G1 X125.078 Y130.922 E.04493
G1 X123.459 Y131.135 E.05419
G1 X122.724 Y130.4 E.03448
G1 X121.11 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X122.724 Y130.4 E-.61876
G1 X122.987 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.564 Y132.02 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130852
G1 F2455
M204 S6000
G1 X117.392 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X119.375 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.462 Y125.122 Z7.6 F42000
G1 X116.413 Y125.002 Z7.6
G1 Z7.2
G1 E.8 F1800
; LINE_WIDTH: 0.13084
G1 F2455
M204 S6000
G1 X119.585 Y124.585 E.02292
; WIPE_START
G1 F15000
G1 X117.602 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.683 Y127.694 Z7.6 F42000
G1 X135.436 Y132.02 Z7.6
G1 Z7.2
G1 E.8 F1800
; LINE_WIDTH: 0.130857
G1 F2455
M204 S6000
G1 X138.608 Y132.438 E.02293
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X136.625 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/85
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z7.6 I.789 J-.926 P1  F42000
G1 X128.467 Y125.226 Z7.6
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X128.107 Y127.961 E.09151
G1 X127.893 Y127.961 E.0071
G1 X127.533 Y125.226 E.09151
G1 X119.998 Y126.218 E.25211
G1 X119.799 Y124.71 E.05045
G1 X126.731 Y123.797 E.23192
G3 X128.178 Y123.718 I1.483 J13.764 E.04809
G3 X129.269 Y123.797 I-.21 J10.407 E.03632
G1 X136.201 Y124.71 E.23191
G1 X136.002 Y126.218 E.05045
G1 X128.527 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X128.223 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.631 Y129.534 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
G1 F2455
M204 S6000
G1 X128 Y129.354 E.04581
G1 X135.46 Y130.336 E.24959
G1 X135.261 Y131.844 E.05045
G1 X128.31 Y130.929 E.23257
G2 X127.683 Y130.93 I-.309 J3.31 E.02082
G1 X120.739 Y131.844 E.23236
G1 X120.54 Y130.336 E.05045
G1 X126.571 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X128 Y129.354 E-.54755
G1 X128.554 Y129.427 E-.21245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.805 Y125.666 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2455
M204 S5000
G1 X128.365 Y129.007 E.10355
G1 X135.9 Y129.999 E.23353
G1 X135.662 Y131.808 E.05608
G1 X138.606 Y132.196 E.09126
G1 X138.668 Y131.725 E.0146
G1 X138.896 Y131.755 E.00706
G1 X138.781 Y132.566 E.02516
G3 X138.576 Y132.676 I-.178 J-.084 E.00767
G1 X128.268 Y131.319 E.31947
G2 X127.73 Y131.319 I-.267 J2.786 E.01655
G1 X117.355 Y132.674 E.32152
G3 X117.205 Y132.52 I.04 J-.188 E.00701
G1 X117.104 Y131.755 E.02372
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.0146
G1 X120.338 Y131.808 E.09126
G1 X120.1 Y129.999 E.05608
G1 X127.635 Y129.007 E.23353
G1 X127.195 Y125.666 E.10355
G1 X119.66 Y126.658 E.23353
G1 X119.422 Y124.848 E.05608
G1 X116.478 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.213 Y124.986 E.02327
G3 X116.383 Y124.764 I.201 J-.022 E.00949
G1 X126.684 Y123.408 E.31925
G3 X128.186 Y123.326 I1.537 J14.309 E.04626
G3 X129.316 Y123.408 I-.219 J10.806 E.03483
G1 X139.617 Y124.764 E.31925
G3 X139.787 Y124.986 I-.03 J.2 E.0095
G1 X139.689 Y125.737 E.02327
G1 X139.46 Y125.707 E.00707
G1 X139.522 Y125.236 E.0146
G1 X136.578 Y124.848 E.09126
G1 X136.34 Y126.658 E.05608
G1 X128.864 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.568 Y127.651 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X128 Y128.157 F42000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51311
G1 F2455
M204 S6000
G1 X128 Y128.365 E.00796
; LINE_WIDTH: 0.474822
G1 X128 Y128.573 E.00731
; LINE_WIDTH: 0.436535
G1 X128 Y128.78 E.00667
; LINE_WIDTH: 0.398247
G1 X128 Y128.988 E.00602
; LINE_WIDTH: 0.357162
G1 X128.146 Y129.166 E.00589
; WIPE_START
G1 F11456.137
G1 X128 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128 Y127.035 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
; LINE_WIDTH: 0.12175
G1 F2455
M204 S6000
G1 X128 Y126.814 E.00142
; LINE_WIDTH: 0.171403
G1 X128 Y126.593 E.00231
; LINE_WIDTH: 0.221056
G1 X128 Y126.372 E.00321
; LINE_WIDTH: 0.270708
G1 X128 Y126.151 E.0041
; LINE_WIDTH: 0.320361
G1 X128 Y125.93 E.005
; LINE_WIDTH: 0.370014
G1 X128 Y125.709 E.00589
; LINE_WIDTH: 0.419667
G1 X128 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X128 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X128 Y125.046 E.00857
M204 S10000
G1 X134.784 Y125.706 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X133.17 Y125.494 E.05401
G1 X132.212 Y124.536 E.04493
G1 X131.551 Y124.449 E.0221
G1 X130.816 Y125.184 E.03448
G1 X128.608 Y124.893 E.07389
G1 X128.608 Y124.697 E.00649
G1 X127.392 Y124.697 E.04032
G1 X127.392 Y124.893 E.00649
G1 X125.184 Y125.184 E.07389
G1 X124.449 Y124.449 E.03448
G1 X123.788 Y124.536 E.0221
G1 X122.83 Y125.494 E.04493
G1 X121.216 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X122.83 Y125.494 E-.61876
G1 X123.093 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.585 Y124.585 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130827
G1 F2455
M204 S6000
G1 X116.413 Y125.002 E.02292
; WIPE_START
G1 F15000
G1 X118.395 Y124.741 E-.76
; WIPE_END
M73 P60 R8
G1 E-.04 F1800
M204 S10000
G1 X121.11 Y130.612 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X122.724 Y130.4 E.05401
G1 X123.459 Y131.135 E.03448
G1 X125.078 Y130.922 E.05419
G1 X126.036 Y129.964 E.04493
G1 X128 Y129.705 E.06571
G1 X129.964 Y129.964 E.06571
G1 X130.922 Y130.922 E.04493
G1 X132.541 Y131.135 E.05419
G1 X133.276 Y130.4 E.03448
G1 X134.89 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X133.276 Y130.4 E-.61876
G1 X133.013 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.436 Y132.02 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130837
G1 F2455
M204 S6000
G1 X138.608 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X136.625 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.538 Y125.122 Z7.8 F42000
G1 X139.587 Y125.002 Z7.8
G1 Z7.4
G1 E.8 F1800
; LINE_WIDTH: 0.130835
G1 F2455
M204 S6000
G1 X136.415 Y124.585 E.02292
; WIPE_START
G1 F15000
G1 X138.398 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.317 Y127.694 Z7.8 F42000
G1 X120.564 Y132.02 Z7.8
G1 Z7.4
G1 E.8 F1800
; LINE_WIDTH: 0.130854
G1 F2455
M204 S6000
G1 X117.392 Y132.438 E.02293
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X119.375 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/85
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z7.8 I.739 J.967 P1  F42000
G1 X128.467 Y125.226 Z7.8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2468
M204 S6000
G1 X128.107 Y127.961 E.09151
G1 X127.893 Y127.961 E.0071
G1 X127.533 Y125.226 E.09151
G1 X119.998 Y126.218 E.25211
G1 X119.799 Y124.71 E.05045
G1 X126.731 Y123.797 E.23192
G3 X128.183 Y123.718 I1.478 J13.706 E.04827
G3 X129.269 Y123.797 I-.215 J10.402 E.03613
G1 X136.201 Y124.71 E.23192
G1 X136.002 Y126.218 E.05045
G1 X128.527 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X128.223 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.631 Y129.534 Z8 F42000
G1 Z7.6
G1 E.8 F1800
G1 F2468
M204 S6000
G1 X128 Y129.354 E.04581
G1 X135.46 Y130.336 E.24959
G1 X135.261 Y131.844 E.05045
G1 X128.317 Y130.93 E.23235
G2 X127.683 Y130.93 I-.317 J4.251 E.02103
G1 X120.739 Y131.844 E.23236
G1 X120.54 Y130.336 E.05045
G1 X126.571 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X128 Y129.354 E-.54756
G1 X128.554 Y129.427 E-.21244
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.805 Y125.666 Z8 F42000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2468
M204 S5000
G1 X128.365 Y129.007 E.10355
G1 X135.9 Y129.999 E.23353
G1 X135.662 Y131.808 E.05608
G1 X138.606 Y132.196 E.09126
G1 X138.668 Y131.725 E.0146
G1 X138.896 Y131.755 E.00706
G1 X138.781 Y132.566 E.02517
G3 X138.576 Y132.676 I-.177 J-.084 E.00767
G1 X128.27 Y131.319 E.3194
G2 X127.73 Y131.319 I-.27 J3.667 E.01661
G1 X117.355 Y132.674 E.32152
G3 X117.205 Y132.521 I.041 J-.189 E.00697
G1 X117.104 Y131.755 E.02375
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.0146
G1 X120.338 Y131.808 E.09126
G1 X120.1 Y129.999 E.05608
G1 X127.635 Y129.007 E.23353
G1 X127.195 Y125.666 E.10355
G1 X119.66 Y126.658 E.23353
G1 X119.422 Y124.848 E.05608
G1 X116.478 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.213 Y124.986 E.02327
G3 X116.383 Y124.764 I.203 J-.02 E.00946
G1 X126.684 Y123.408 E.31926
G3 X128.192 Y123.326 I1.533 J14.245 E.04643
G3 X129.316 Y123.408 I-.225 J10.801 E.03465
G1 X139.617 Y124.764 E.31926
G3 X139.787 Y124.986 I-.033 J.201 E.00946
G1 X139.689 Y125.737 E.02327
G1 X139.46 Y125.707 E.00707
G1 X139.522 Y125.236 E.0146
G1 X136.578 Y124.848 E.09126
G1 X136.34 Y126.658 E.05608
G1 X128.864 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.568 Y127.651 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X128 Y128.157 F42000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51311
G1 F2468
M204 S6000
G1 X128 Y128.365 E.00796
; LINE_WIDTH: 0.474823
G1 X128 Y128.573 E.00731
; LINE_WIDTH: 0.436536
G1 X128 Y128.78 E.00667
; LINE_WIDTH: 0.39825
G1 X128 Y128.988 E.00602
; LINE_WIDTH: 0.35712
G1 X128.146 Y129.166 E.00589
; WIPE_START
G1 F11457.67
G1 X128 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128 Y127.035 Z8 F42000
G1 Z7.6
G1 E.8 F1800
; LINE_WIDTH: 0.12175
G1 F2468
M204 S6000
G1 X128 Y126.814 E.00142
; LINE_WIDTH: 0.171403
G1 X128 Y126.593 E.00231
; LINE_WIDTH: 0.221056
G1 X128 Y126.372 E.00321
; LINE_WIDTH: 0.270708
G1 X128 Y126.151 E.0041
; LINE_WIDTH: 0.320361
G1 X128 Y125.93 E.005
; LINE_WIDTH: 0.370014
G1 X128 Y125.709 E.00589
; LINE_WIDTH: 0.419667
G1 X128 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X128 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X128 Y125.046 E.00857
; WIPE_START
G1 F7562.194
G1 X128 Y125.267 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.37 Y125.093 Z8 F42000
G1 X116.413 Y125.002 Z8
G1 Z7.6
G1 E.8 F1800
; LINE_WIDTH: 0.130851
G1 F2468
M204 S6000
G1 X119.585 Y124.585 E.02293
; WIPE_START
G1 F15000
G1 X117.602 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.216 Y125.706 Z8 F42000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2468
M204 S6000
G1 X122.83 Y125.494 E.05401
G1 X123.788 Y124.536 E.04493
G1 X124.449 Y124.449 E.0221
G1 X125.184 Y125.184 E.03448
G1 X127.392 Y124.893 E.07389
G1 X127.392 Y124.697 E.00649
G1 X128.608 Y124.697 E.04032
G1 X128.608 Y124.893 E.00649
G1 X130.816 Y125.184 E.07389
G1 X131.551 Y124.449 E.03448
G1 X132.212 Y124.536 E.0221
G1 X133.17 Y125.494 E.04493
G1 X134.784 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X133.17 Y125.494 E-.61876
G1 X132.907 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.415 Y124.585 Z8 F42000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130835
G1 F2468
M204 S6000
G1 X139.587 Y125.002 E.02292
; WIPE_START
G1 F15000
G1 X137.605 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P60 R7
G1 X138.591 Y132.31 Z8 F42000
G1 X138.608 Y132.438 Z8
G1 Z7.6
G1 E.8 F1800
; LINE_WIDTH: 0.130848
G1 F2468
M204 S6000
G1 X135.436 Y132.02 E.02292
; WIPE_START
G1 F15000
G1 X137.419 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.89 Y130.612 Z8 F42000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2468
M204 S6000
G1 X133.276 Y130.4 E.05401
G1 X132.541 Y131.135 E.03448
G1 X130.922 Y130.922 E.05419
G1 X129.964 Y129.964 E.04493
G1 X128 Y129.705 E.0657
G1 X126.036 Y129.964 E.06571
G1 X125.078 Y130.922 E.04493
G1 X123.459 Y131.135 E.05419
G1 X122.724 Y130.4 E.03448
M73 P61 R7
G1 X121.11 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X122.724 Y130.4 E-.61876
G1 X122.987 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.564 Y132.02 Z8 F42000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130852
G1 F2468
M204 S6000
G1 X117.392 Y132.438 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X119.375 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/85
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z8 I.739 J.967 P1  F42000
G1 X128.467 Y125.226 Z8
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2468
M204 S6000
G1 X128.107 Y127.961 E.09151
G1 X127.893 Y127.961 E.0071
G1 X127.533 Y125.226 E.09151
G1 X119.998 Y126.218 E.25211
G1 X119.799 Y124.71 E.05045
G1 X126.731 Y123.797 E.23192
G3 X128.189 Y123.718 I1.474 J13.655 E.04846
G3 X129.269 Y123.797 I-.22 J10.395 E.03595
G1 X136.201 Y124.71 E.23192
G1 X136.002 Y126.218 E.05045
G1 X128.527 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X128.223 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.631 Y129.534 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
G1 F2468
M204 S6000
G1 X128 Y129.354 E.04581
G1 X135.46 Y130.336 E.24959
G1 X135.261 Y131.844 E.05045
G1 X128.317 Y130.93 E.23235
G2 X127.683 Y130.93 I-.317 J4.251 E.02103
G1 X120.739 Y131.844 E.23236
G1 X120.54 Y130.336 E.05045
G1 X126.571 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X128 Y129.354 E-.54755
G1 X128.554 Y129.427 E-.21245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.805 Y125.666 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2468
M204 S5000
G1 X128.365 Y129.007 E.10355
G1 X135.9 Y129.999 E.23353
G1 X135.662 Y131.808 E.05608
G1 X138.606 Y132.196 E.09126
G1 X138.668 Y131.725 E.0146
G1 X138.896 Y131.755 E.00706
G1 X138.795 Y132.52 E.02372
G3 X138.576 Y132.676 I-.189 J-.034 E.00916
G1 X128.27 Y131.319 E.3194
G2 X127.73 Y131.319 I-.27 J3.667 E.01661
G1 X117.354 Y132.674 E.32152
G3 X117.205 Y132.521 I.038 J-.186 E.00698
G1 X117.104 Y131.755 E.02375
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.0146
G1 X120.338 Y131.808 E.09126
G1 X120.1 Y129.999 E.05608
G1 X127.635 Y129.007 E.23353
G1 X127.195 Y125.666 E.10355
G1 X119.66 Y126.658 E.23353
G1 X119.422 Y124.848 E.05608
G1 X116.478 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.213 Y124.986 E.02326
G3 X116.383 Y124.764 I.201 J-.022 E.00949
G1 X126.684 Y123.408 E.31926
G3 X128.197 Y123.326 I1.529 J14.201 E.0466
G3 X129.316 Y123.408 I-.229 J10.79 E.03448
G1 X139.617 Y124.764 E.31926
G3 X139.787 Y124.986 I-.022 J.193 E.00959
G1 X139.689 Y125.737 E.02326
G1 X139.46 Y125.707 E.00707
G1 X139.522 Y125.236 E.0146
G1 X136.578 Y124.848 E.09126
G1 X136.34 Y126.658 E.05608
G1 X128.864 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.568 Y127.651 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X128 Y128.157 F42000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51311
G1 F2468
M204 S6000
G1 X128 Y128.365 E.00796
; LINE_WIDTH: 0.474822
G1 X128 Y128.573 E.00731
; LINE_WIDTH: 0.436535
G1 X128 Y128.78 E.00667
; LINE_WIDTH: 0.398247
G1 X128 Y128.988 E.00602
; LINE_WIDTH: 0.357162
G1 X128.146 Y129.166 E.00589
; WIPE_START
G1 F11456.137
G1 X128 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128 Y127.035 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
; LINE_WIDTH: 0.12175
G1 F2468
M204 S6000
G1 X128 Y126.814 E.00142
; LINE_WIDTH: 0.171403
G1 X128 Y126.593 E.00231
; LINE_WIDTH: 0.221056
G1 X128 Y126.372 E.00321
; LINE_WIDTH: 0.270708
G1 X128 Y126.151 E.0041
; LINE_WIDTH: 0.320361
G1 X128 Y125.93 E.005
; LINE_WIDTH: 0.370014
G1 X128 Y125.709 E.00589
; LINE_WIDTH: 0.419667
G1 X128 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X128 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X128 Y125.046 E.00857
; WIPE_START
G1 F7562.194
G1 X128 Y125.267 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.63 Y125.093 Z8.2 F42000
G1 X139.587 Y125.002 Z8.2
G1 Z7.8
G1 E.8 F1800
; LINE_WIDTH: 0.130837
G1 F2468
M204 S6000
G1 X136.415 Y124.585 E.02292
; WIPE_START
G1 F15000
G1 X138.398 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.784 Y125.706 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2468
M204 S6000
G1 X133.17 Y125.494 E.05401
G1 X132.212 Y124.536 E.04493
G1 X131.551 Y124.449 E.0221
G1 X130.816 Y125.184 E.03448
G1 X128.608 Y124.893 E.07389
G1 X128.608 Y124.697 E.00649
G1 X127.392 Y124.697 E.04032
G1 X127.392 Y124.893 E.00649
G1 X125.184 Y125.184 E.07389
G1 X124.449 Y124.449 E.03448
G1 X123.788 Y124.536 E.0221
G1 X122.83 Y125.494 E.04493
G1 X121.216 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X122.83 Y125.494 E-.61876
G1 X123.093 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.585 Y124.585 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.13084
G1 F2468
M204 S6000
G1 X116.413 Y125.002 E.02292
; WIPE_START
G1 F15000
G1 X118.395 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.409 Y132.31 Z8.2 F42000
G1 X117.392 Y132.438 Z8.2
G1 Z7.8
G1 E.8 F1800
; LINE_WIDTH: 0.130852
G1 F2468
M204 S6000
G1 X120.564 Y132.02 E.02292
; WIPE_START
G1 F15000
G1 X118.581 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.11 Y130.612 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2468
M204 S6000
G1 X122.724 Y130.4 E.05401
G1 X123.459 Y131.135 E.03448
G1 X125.078 Y130.922 E.05419
G1 X126.036 Y129.964 E.04493
G1 X128 Y129.705 E.06571
G1 X129.964 Y129.964 E.06571
G1 X130.922 Y130.922 E.04493
G1 X132.541 Y131.135 E.05419
G1 X133.276 Y130.4 E.03448
G1 X134.89 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X133.276 Y130.4 E-.61876
G1 X133.013 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.436 Y132.02 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130848
G1 F2468
M204 S6000
G1 X138.608 Y132.438 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X136.625 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/85
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z8.2 I.789 J-.926 P1  F42000
G1 X128.467 Y125.226 Z8.2
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X128.107 Y127.961 E.09151
G1 X127.893 Y127.961 E.0071
G1 X127.533 Y125.226 E.09151
G1 X119.998 Y126.218 E.25211
G1 X119.799 Y124.71 E.05045
G1 X126.731 Y123.797 E.23192
G3 X128.194 Y123.718 I1.47 J13.606 E.04864
G3 X129.269 Y123.797 I-.226 J10.402 E.03577
G1 X136.201 Y124.71 E.23191
G1 X136.002 Y126.218 E.05045
G1 X128.527 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X128.223 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.631 Y129.534 Z8.4 F42000
G1 Z8
G1 E.8 F1800
G1 F2455
M204 S6000
G1 X128 Y129.354 E.04581
M73 P62 R7
G1 X135.46 Y130.336 E.24959
G1 X135.261 Y131.844 E.05045
G1 X128.317 Y130.93 E.23235
G2 X127.683 Y130.93 I-.317 J4.251 E.02103
G1 X120.739 Y131.844 E.23236
G1 X120.54 Y130.336 E.05045
G1 X126.571 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X128 Y129.354 E-.54755
G1 X128.554 Y129.427 E-.21245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.805 Y125.666 Z8.4 F42000
G1 Z8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2455
M204 S5000
G1 X128.365 Y129.007 E.10355
G1 X135.9 Y129.999 E.23353
G1 X135.662 Y131.808 E.05608
G1 X138.606 Y132.196 E.09126
G1 X138.668 Y131.725 E.0146
G1 X138.896 Y131.755 E.00706
G1 X138.795 Y132.52 E.02371
G3 X138.577 Y132.676 I-.191 J-.036 E.0091
G1 X128.27 Y131.319 E.31943
G2 X127.73 Y131.319 I-.27 J3.667 E.01661
G1 X117.424 Y132.676 E.31942
G1 X117.323 Y132.665 E.00311
G1 X117.25 Y132.614 E.00273
G3 X117.205 Y132.52 I.179 J-.144 E.00324
G1 X117.104 Y131.755 E.02371
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.0146
G1 X120.338 Y131.808 E.09126
G1 X120.1 Y129.999 E.05608
G1 X127.635 Y129.007 E.23353
G1 X127.195 Y125.666 E.10355
G1 X119.66 Y126.658 E.23353
G1 X119.422 Y124.848 E.05608
G1 X116.478 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.213 Y124.986 E.02327
G3 X116.383 Y124.764 I.194 J-.027 E.00956
G1 X126.684 Y123.408 E.31925
G3 X128.203 Y123.326 I1.525 J14.146 E.04677
G3 X129.316 Y123.408 I-.235 J10.796 E.03432
G1 X139.617 Y124.764 E.31926
G3 X139.787 Y124.986 I-.031 J.2 E.00949
G1 X139.689 Y125.737 E.02327
G1 X139.46 Y125.707 E.00707
G1 X139.522 Y125.236 E.0146
G1 X136.578 Y124.848 E.09126
G1 X136.34 Y126.658 E.05608
G1 X128.864 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.568 Y127.651 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X128 Y128.157 F42000
G1 Z8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51311
G1 F2455
M204 S6000
G1 X128 Y128.365 E.00796
; LINE_WIDTH: 0.474822
G1 X128 Y128.573 E.00731
; LINE_WIDTH: 0.436535
G1 X128 Y128.78 E.00667
; LINE_WIDTH: 0.398247
G1 X128 Y128.988 E.00602
; LINE_WIDTH: 0.357162
G1 X128.146 Y129.166 E.00589
; WIPE_START
G1 F11456.137
G1 X128 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128 Y127.035 Z8.4 F42000
G1 Z8
G1 E.8 F1800
; LINE_WIDTH: 0.12175
G1 F2455
M204 S6000
G1 X128 Y126.814 E.00142
; LINE_WIDTH: 0.171403
G1 X128 Y126.593 E.00231
; LINE_WIDTH: 0.221056
G1 X128 Y126.372 E.00321
; LINE_WIDTH: 0.270708
G1 X128 Y126.151 E.0041
; LINE_WIDTH: 0.320361
G1 X128 Y125.93 E.005
; LINE_WIDTH: 0.370014
G1 X128 Y125.709 E.00589
; LINE_WIDTH: 0.419667
G1 X128 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X128 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X128 Y125.046 E.00857
M204 S10000
G1 X121.216 Y125.706 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X122.83 Y125.494 E.05401
G1 X123.788 Y124.536 E.04493
G1 X124.449 Y124.449 E.0221
G1 X125.184 Y125.184 E.03448
G1 X127.392 Y124.893 E.07389
G1 X127.392 Y124.697 E.00649
G1 X128.608 Y124.697 E.04032
G1 X128.608 Y124.893 E.00649
G1 X130.816 Y125.184 E.07389
G1 X131.551 Y124.449 E.03448
G1 X132.212 Y124.536 E.0221
G1 X133.17 Y125.494 E.04493
G1 X134.784 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X133.17 Y125.494 E-.61876
G1 X132.907 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.415 Y124.585 Z8.4 F42000
G1 Z8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130835
G1 F2455
M204 S6000
G1 X139.587 Y125.002 E.02292
; WIPE_START
G1 F15000
G1 X137.605 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.89 Y130.612 Z8.4 F42000
G1 Z8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X133.276 Y130.4 E.05401
G1 X132.541 Y131.135 E.03448
G1 X130.922 Y130.922 E.05419
G1 X129.964 Y129.964 E.04493
G1 X128 Y129.705 E.06571
G1 X126.036 Y129.964 E.06571
G1 X125.078 Y130.922 E.04493
G1 X123.459 Y131.135 E.05419
G1 X122.724 Y130.4 E.03448
G1 X121.11 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X122.724 Y130.4 E-.61876
G1 X122.987 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.564 Y132.02 Z8.4 F42000
G1 Z8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130852
G1 F2455
M204 S6000
G1 X117.392 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X119.375 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.462 Y125.122 Z8.4 F42000
G1 X116.413 Y125.002 Z8.4
G1 Z8
G1 E.8 F1800
; LINE_WIDTH: 0.130851
G1 F2455
M204 S6000
G1 X119.585 Y124.585 E.02293
; WIPE_START
G1 F15000
G1 X117.602 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.683 Y127.694 Z8.4 F42000
G1 X135.436 Y132.02 Z8.4
G1 Z8
G1 E.8 F1800
; LINE_WIDTH: 0.130837
G1 F2455
M204 S6000
G1 X138.608 Y132.438 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X136.625 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/85
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z8.4 I.789 J-.926 P1  F42000
G1 X128.467 Y125.226 Z8.4
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2467
M204 S6000
G1 X128.107 Y127.961 E.09151
G1 X127.893 Y127.961 E.0071
G1 X127.533 Y125.226 E.09151
G1 X119.998 Y126.218 E.25211
G1 X119.799 Y124.71 E.05045
G1 X126.731 Y123.797 E.23192
G3 X128.2 Y123.718 I1.467 J13.556 E.04882
G3 X129.269 Y123.797 I-.232 J10.402 E.03558
G1 X136.201 Y124.71 E.23191
G1 X136.002 Y126.218 E.05045
G1 X128.527 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X128.223 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.631 Y129.534 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
G1 F2467
M204 S6000
G1 X128 Y129.354 E.04581
G1 X135.46 Y130.336 E.24959
G1 X135.261 Y131.844 E.05045
G1 X128.317 Y130.93 E.23236
G2 X127.69 Y130.929 I-.318 J3.31 E.02083
G1 X120.739 Y131.844 E.23257
G1 X120.54 Y130.336 E.05045
G1 X126.571 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X128 Y129.354 E-.54756
G1 X128.554 Y129.427 E-.21244
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.805 Y125.666 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2467
M204 S5000
G1 X128.365 Y129.007 E.10355
G1 X135.9 Y129.999 E.23353
G1 X135.662 Y131.808 E.05608
G1 X138.606 Y132.196 E.09126
G1 X138.668 Y131.725 E.0146
G1 X138.896 Y131.755 E.00706
G1 X138.795 Y132.52 E.02371
G1 X138.768 Y132.59 E.00232
G3 X138.577 Y132.676 I-.161 J-.103 E.00681
G1 X128.27 Y131.319 E.31943
G2 X127.732 Y131.319 I-.27 J2.786 E.01655
G1 X117.423 Y132.676 E.3195
G1 X117.325 Y132.666 E.00303
G1 X117.251 Y132.615 E.00276
G3 X117.205 Y132.521 I.201 J-.156 E.00325
G1 X117.104 Y131.755 E.02375
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.0146
G1 X120.338 Y131.808 E.09126
G1 X120.1 Y129.999 E.05608
G1 X127.635 Y129.007 E.23353
G1 X127.195 Y125.666 E.10355
G1 X119.66 Y126.658 E.23353
G1 X119.422 Y124.848 E.05608
G1 X116.478 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.213 Y124.986 E.02328
G3 X116.383 Y124.764 I.193 J-.028 E.00958
G1 X126.684 Y123.408 E.31925
G3 X128.208 Y123.326 I1.521 J14.096 E.04694
G3 X129.316 Y123.408 I-.241 J10.797 E.03415
G1 X139.617 Y124.764 E.31925
G3 X139.787 Y124.986 I-.023 J.193 E.00958
G1 X139.689 Y125.737 E.02327
G1 X139.46 Y125.707 E.00707
G1 X139.522 Y125.236 E.0146
G1 X136.578 Y124.848 E.09126
G1 X136.34 Y126.658 E.05608
G1 X128.864 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.568 Y127.651 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X128 Y128.157 F42000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51311
G1 F2467
M204 S6000
G1 X128 Y128.365 E.00796
; LINE_WIDTH: 0.474823
G1 X128 Y128.573 E.00731
; LINE_WIDTH: 0.436536
G1 X128 Y128.78 E.00667
; LINE_WIDTH: 0.39825
G1 X128 Y128.988 E.00602
; LINE_WIDTH: 0.35712
G1 X128.146 Y129.166 E.00589
; WIPE_START
G1 F11457.67
G1 X128 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128 Y127.035 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
; LINE_WIDTH: 0.12175
G1 F2467
M204 S6000
G1 X128 Y126.814 E.00142
; LINE_WIDTH: 0.171403
G1 X128 Y126.593 E.00231
; LINE_WIDTH: 0.221056
G1 X128 Y126.372 E.00321
; LINE_WIDTH: 0.270708
G1 X128 Y126.151 E.0041
; LINE_WIDTH: 0.320361
G1 X128 Y125.93 E.005
; LINE_WIDTH: 0.370014
G1 X128 Y125.709 E.00589
; LINE_WIDTH: 0.419667
G1 X128 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X128 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X128 Y125.046 E.00857
; WIPE_START
M73 P63 R7
G1 F7562.194
G1 X128 Y125.267 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.63 Y125.093 Z8.6 F42000
G1 X139.587 Y125.002 Z8.6
G1 Z8.2
G1 E.8 F1800
; LINE_WIDTH: 0.130856
G1 F2467
M204 S6000
G1 X136.415 Y124.585 E.02293
; WIPE_START
G1 F15000
G1 X138.398 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.784 Y125.706 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2467
M204 S6000
G1 X133.17 Y125.494 E.05401
G1 X132.212 Y124.536 E.04493
G1 X131.551 Y124.449 E.0221
G1 X130.816 Y125.184 E.03448
G1 X128.608 Y124.893 E.07389
G1 X128.608 Y124.697 E.00649
G1 X127.392 Y124.697 E.04032
G1 X127.392 Y124.893 E.00649
G1 X125.184 Y125.184 E.07389
G1 X124.449 Y124.449 E.03448
G1 X123.788 Y124.536 E.0221
G1 X122.83 Y125.494 E.04493
G1 X121.216 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X122.83 Y125.494 E-.61876
G1 X123.093 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.585 Y124.585 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130852
G1 F2467
M204 S6000
G1 X116.413 Y125.002 E.02293
; WIPE_START
G1 F15000
G1 X118.395 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.409 Y132.31 Z8.6 F42000
G1 X117.392 Y132.438 Z8.6
G1 Z8.2
G1 E.8 F1800
; LINE_WIDTH: 0.130854
G1 F2467
M204 S6000
G1 X120.564 Y132.02 E.02293
; WIPE_START
G1 F15000
G1 X118.581 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.11 Y130.612 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2467
M204 S6000
G1 X122.724 Y130.4 E.05401
G1 X123.459 Y131.135 E.03448
G1 X125.078 Y130.922 E.05419
G1 X126.036 Y129.964 E.04493
G1 X128 Y129.705 E.06571
G1 X129.964 Y129.964 E.0657
G1 X130.922 Y130.922 E.04493
G1 X132.541 Y131.135 E.05419
G1 X133.276 Y130.4 E.03448
G1 X134.89 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X133.276 Y130.4 E-.61876
G1 X133.013 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.436 Y132.02 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130848
G1 F2467
M204 S6000
G1 X138.608 Y132.438 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X136.625 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 42/85
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z8.6 I.789 J-.926 P1  F42000
G1 X128.467 Y125.226 Z8.6
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2467
M204 S6000
G1 X128.107 Y127.961 E.09151
G1 X127.893 Y127.961 E.0071
G1 X127.533 Y125.226 E.09151
G1 X119.998 Y126.218 E.25211
G1 X119.799 Y124.71 E.05045
G1 X126.731 Y123.797 E.23192
G3 X128.205 Y123.718 I1.463 J13.502 E.04901
G3 X129.269 Y123.797 I-.237 J10.4 E.0354
G1 X136.201 Y124.71 E.23192
G1 X136.002 Y126.218 E.05045
G1 X128.527 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X128.223 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.631 Y129.534 Z8.8 F42000
G1 Z8.4
G1 E.8 F1800
G1 F2467
M204 S6000
G1 X128 Y129.354 E.04581
G1 X135.46 Y130.336 E.24959
G1 X135.261 Y131.844 E.05045
G1 X128.312 Y130.929 E.2325
G2 X127.683 Y130.93 I-.311 J3.781 E.02089
G1 X120.739 Y131.844 E.23236
G1 X120.54 Y130.336 E.05045
G1 X126.571 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X128 Y129.354 E-.54755
G1 X128.554 Y129.427 E-.21245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.805 Y125.666 Z8.8 F42000
G1 Z8.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2467
M204 S5000
G1 X128.365 Y129.007 E.10355
G1 X135.9 Y129.999 E.23353
G1 X135.662 Y131.808 E.05608
G1 X138.606 Y132.196 E.09126
G1 X138.668 Y131.725 E.0146
G1 X138.896 Y131.755 E.00706
G1 X138.795 Y132.52 E.02371
G3 X138.576 Y132.676 I-.19 J-.035 E.00915
G1 X128.268 Y131.319 E.31945
G2 X127.73 Y131.319 I-.268 J3.211 E.01656
G1 X117.355 Y132.674 E.32152
G3 X117.205 Y132.52 I.04 J-.189 E.00701
G1 X117.104 Y131.755 E.02371
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.0146
G1 X120.338 Y131.808 E.09126
G1 X120.1 Y129.999 E.05608
G1 X127.635 Y129.007 E.23353
G1 X127.195 Y125.666 E.10355
G1 X119.66 Y126.658 E.23353
G1 X119.422 Y124.848 E.05608
G1 X116.478 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.213 Y124.986 E.02326
G3 X116.383 Y124.764 I.193 J-.029 E.00959
G1 X126.684 Y123.408 E.31925
G3 X128.214 Y123.326 I1.517 J14.049 E.04711
G3 X129.316 Y123.408 I-.246 J10.794 E.03397
G1 X139.617 Y124.764 E.31925
G3 X139.787 Y124.986 I-.023 J.193 E.00959
G1 X139.689 Y125.737 E.02326
G1 X139.46 Y125.707 E.00707
G1 X139.522 Y125.236 E.0146
G1 X136.578 Y124.848 E.09126
G1 X136.34 Y126.658 E.05608
G1 X128.864 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.568 Y127.651 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X128 Y128.157 F42000
G1 Z8.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51311
G1 F2467
M204 S6000
G1 X128 Y128.365 E.00796
; LINE_WIDTH: 0.474822
G1 X128 Y128.573 E.00731
; LINE_WIDTH: 0.436535
G1 X128 Y128.78 E.00667
; LINE_WIDTH: 0.398247
G1 X128 Y128.988 E.00602
; LINE_WIDTH: 0.357162
G1 X128.146 Y129.166 E.00589
; WIPE_START
G1 F11456.137
G1 X128 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128 Y127.035 Z8.8 F42000
G1 Z8.4
G1 E.8 F1800
; LINE_WIDTH: 0.12175
G1 F2467
M204 S6000
G1 X128 Y126.814 E.00142
; LINE_WIDTH: 0.171403
G1 X128 Y126.593 E.00231
; LINE_WIDTH: 0.221056
G1 X128 Y126.372 E.00321
; LINE_WIDTH: 0.270708
G1 X128 Y126.151 E.0041
; LINE_WIDTH: 0.320361
G1 X128 Y125.93 E.005
; LINE_WIDTH: 0.370014
G1 X128 Y125.709 E.00589
; LINE_WIDTH: 0.419667
G1 X128 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X128 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X128 Y125.046 E.00857
; WIPE_START
G1 F7562.194
G1 X128 Y125.267 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.37 Y125.093 Z8.8 F42000
G1 X116.413 Y125.002 Z8.8
G1 Z8.4
G1 E.8 F1800
; LINE_WIDTH: 0.130827
G1 F2467
M204 S6000
G1 X119.585 Y124.585 E.02292
; WIPE_START
G1 F15000
G1 X117.602 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.216 Y125.706 Z8.8 F42000
G1 Z8.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2467
M204 S6000
G1 X122.83 Y125.494 E.05401
G1 X123.788 Y124.536 E.04493
G1 X124.449 Y124.449 E.0221
G1 X125.184 Y125.184 E.03448
G1 X127.392 Y124.893 E.07389
G1 X127.392 Y124.697 E.00649
G1 X128.608 Y124.697 E.04032
G1 X128.608 Y124.893 E.00649
G1 X130.816 Y125.184 E.07389
G1 X131.551 Y124.449 E.03448
G1 X132.212 Y124.536 E.0221
G1 X133.17 Y125.494 E.04493
G1 X134.784 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X133.17 Y125.494 E-.61876
G1 X132.907 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.415 Y124.585 Z8.8 F42000
G1 Z8.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130845
G1 F2467
M204 S6000
G1 X139.587 Y125.002 E.02293
; WIPE_START
G1 F15000
G1 X137.605 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.591 Y132.31 Z8.8 F42000
G1 X138.608 Y132.438 Z8.8
G1 Z8.4
G1 E.8 F1800
; LINE_WIDTH: 0.130847
M73 P64 R7
G1 F2467
M204 S6000
G1 X135.436 Y132.02 E.02292
; WIPE_START
G1 F15000
G1 X137.419 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.89 Y130.612 Z8.8 F42000
G1 Z8.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2467
M204 S6000
G1 X133.276 Y130.4 E.05401
G1 X132.541 Y131.135 E.03448
G1 X130.922 Y130.922 E.05419
G1 X129.964 Y129.964 E.04493
G1 X128 Y129.705 E.06571
G1 X126.036 Y129.964 E.06571
G1 X125.078 Y130.922 E.04493
G1 X123.459 Y131.135 E.05419
G1 X122.724 Y130.4 E.03448
G1 X121.11 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X122.724 Y130.4 E-.61876
G1 X122.987 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.564 Y132.02 Z8.8 F42000
G1 Z8.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130852
G1 F2467
M204 S6000
G1 X117.392 Y132.438 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15000
G1 X119.375 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 43/85
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z8.8 I.739 J.967 P1  F42000
G1 X128.467 Y125.226 Z8.8
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X128.107 Y127.961 E.09151
G1 X127.893 Y127.961 E.0071
G1 X127.533 Y125.226 E.09151
G1 X119.998 Y126.218 E.25211
G1 X119.799 Y124.71 E.05045
G1 X126.731 Y123.797 E.23192
G3 X128.422 Y123.723 I1.41 J12.814 E.05619
G3 X129.269 Y123.797 I-.426 J9.736 E.02822
G1 X136.201 Y124.71 E.23192
G1 X136.002 Y126.218 E.05045
G1 X128.527 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X128.223 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.631 Y129.534 Z9 F42000
G1 Z8.6
G1 E.8 F1800
G1 F2455
M204 S6000
G1 X128 Y129.354 E.04581
G1 X135.46 Y130.336 E.24959
G1 X135.261 Y131.844 E.05045
G1 X128.317 Y130.93 E.23235
G2 X127.683 Y130.93 I-.317 J4.251 E.02103
G1 X120.739 Y131.844 E.23236
G1 X120.54 Y130.336 E.05045
G1 X126.571 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X128 Y129.354 E-.54755
G1 X128.554 Y129.427 E-.21245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.805 Y125.666 Z9 F42000
G1 Z8.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2455
M204 S5000
G1 X128.365 Y129.007 E.10355
G1 X135.9 Y129.999 E.23353
G1 X135.662 Y131.808 E.05608
G1 X138.606 Y132.196 E.09126
G1 X138.668 Y131.725 E.0146
G1 X138.896 Y131.755 E.00706
G1 X138.795 Y132.52 E.02371
G3 X138.576 Y132.676 I-.189 J-.034 E.00916
G1 X128.27 Y131.319 E.3194
G2 X127.73 Y131.319 I-.27 J3.667 E.01661
G1 X117.354 Y132.674 E.32152
G3 X117.205 Y132.52 I.041 J-.189 E.00701
G1 X117.104 Y131.755 E.02371
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.0146
G1 X120.338 Y131.808 E.09126
G1 X120.1 Y129.999 E.05608
G1 X127.635 Y129.007 E.23353
G1 X127.195 Y125.666 E.10355
G1 X119.66 Y126.658 E.23353
G1 X119.422 Y124.848 E.05608
G1 X116.478 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.213 Y124.986 E.02326
G3 X116.383 Y124.764 I.198 J-.025 E.00953
G1 X126.684 Y123.408 E.31925
G3 X128.439 Y123.331 I1.463 J13.335 E.05402
G3 X129.316 Y123.408 I-.441 J10.082 E.02706
G1 X139.617 Y124.764 E.31925
G3 X139.787 Y124.986 I-.022 J.193 E.00959
G1 X139.689 Y125.737 E.02326
G1 X139.46 Y125.707 E.00707
G1 X139.522 Y125.236 E.0146
G1 X136.578 Y124.848 E.09126
G1 X136.34 Y126.658 E.05608
G1 X128.864 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.568 Y127.651 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X128 Y128.157 F42000
G1 Z8.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51311
G1 F2455
M204 S6000
G1 X128 Y128.365 E.00796
; LINE_WIDTH: 0.474822
G1 X128 Y128.573 E.00731
; LINE_WIDTH: 0.436535
G1 X128 Y128.78 E.00667
; LINE_WIDTH: 0.398247
G1 X128 Y128.988 E.00602
; LINE_WIDTH: 0.357162
G1 X128.146 Y129.166 E.00589
; WIPE_START
G1 F11456.137
G1 X128 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128 Y127.035 Z9 F42000
G1 Z8.6
G1 E.8 F1800
; LINE_WIDTH: 0.12175
G1 F2455
M204 S6000
G1 X128 Y126.814 E.00142
; LINE_WIDTH: 0.171403
G1 X128 Y126.593 E.00231
; LINE_WIDTH: 0.221056
G1 X128 Y126.372 E.00321
; LINE_WIDTH: 0.270708
G1 X128 Y126.151 E.0041
; LINE_WIDTH: 0.320361
G1 X128 Y125.93 E.005
; LINE_WIDTH: 0.370014
G1 X128 Y125.709 E.00589
; LINE_WIDTH: 0.419667
G1 X128 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X128 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X128 Y125.046 E.00857
M204 S10000
G1 X134.784 Y125.706 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X133.17 Y125.494 E.05401
G1 X132.212 Y124.536 E.04493
G1 X131.551 Y124.449 E.0221
G1 X130.816 Y125.184 E.03448
G1 X128.608 Y124.893 E.07389
G1 X128.608 Y124.697 E.00649
G1 X127.392 Y124.697 E.04032
G1 X127.392 Y124.893 E.00649
G1 X125.184 Y125.184 E.07389
G1 X124.449 Y124.449 E.03448
G1 X123.788 Y124.536 E.0221
G1 X122.83 Y125.494 E.04493
G1 X121.216 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X122.83 Y125.494 E-.61876
G1 X123.093 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.585 Y124.585 Z9 F42000
G1 Z8.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130851
G1 F2455
M204 S6000
G1 X116.413 Y125.002 E.02293
; WIPE_START
G1 F15000
G1 X118.395 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.11 Y130.612 Z9 F42000
G1 Z8.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X122.724 Y130.4 E.05401
G1 X123.459 Y131.135 E.03448
G1 X125.078 Y130.922 E.05419
G1 X126.036 Y129.964 E.04493
G1 X128 Y129.705 E.06571
G1 X129.964 Y129.964 E.06571
G1 X130.922 Y130.922 E.04493
G1 X132.541 Y131.135 E.05419
G1 X133.276 Y130.4 E.03448
G1 X134.89 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X133.276 Y130.4 E-.61876
G1 X133.013 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.436 Y132.02 Z9 F42000
G1 Z8.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130848
G1 F2455
M204 S6000
G1 X138.608 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X136.625 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.538 Y125.122 Z9 F42000
G1 X139.587 Y125.002 Z9
G1 Z8.6
G1 E.8 F1800
; LINE_WIDTH: 0.130845
G1 F2455
M204 S6000
G1 X136.415 Y124.585 E.02293
; WIPE_START
G1 F15000
G1 X138.398 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.317 Y127.694 Z9 F42000
G1 X120.564 Y132.02 Z9
G1 Z8.6
G1 E.8 F1800
; LINE_WIDTH: 0.130853
G1 F2455
M204 S6000
G1 X117.392 Y132.438 E.02293
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X119.375 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 44/85
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z9 I.739 J.967 P1  F42000
G1 X128.467 Y125.226 Z9
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2468
M204 S6000
G1 X128.107 Y127.961 E.09151
G1 X127.893 Y127.961 E.0071
G1 X127.533 Y125.226 E.09151
G1 X119.998 Y126.218 E.25211
M73 P65 R7
G1 X119.799 Y124.71 E.05045
G1 X126.731 Y123.797 E.23192
G3 X128.217 Y123.718 I1.456 J13.414 E.04938
G3 X129.269 Y123.797 I-.25 J10.412 E.03503
G1 X136.201 Y124.71 E.23192
G1 X136.002 Y126.218 E.05045
G1 X128.527 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X128.223 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.631 Y129.534 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
G1 F2468
M204 S6000
G1 X128 Y129.354 E.04581
G1 X135.46 Y130.336 E.24959
G1 X135.261 Y131.844 E.05045
G1 X128.317 Y130.93 E.23235
G2 X127.683 Y130.93 I-.317 J4.251 E.02103
G1 X120.739 Y131.844 E.23236
G1 X120.54 Y130.336 E.05045
G1 X126.571 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X128 Y129.354 E-.54756
G1 X128.554 Y129.427 E-.21244
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.805 Y125.666 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2468
M204 S5000
G1 X128.365 Y129.007 E.10355
G1 X135.9 Y129.999 E.23353
G1 X135.662 Y131.808 E.05608
G1 X138.606 Y132.196 E.09126
G1 X138.668 Y131.725 E.0146
G1 X138.896 Y131.755 E.00706
G1 X138.791 Y132.538 E.02428
G3 X138.576 Y132.676 I-.184 J-.051 E.00861
G1 X128.27 Y131.319 E.3194
G2 X127.73 Y131.319 I-.27 J3.667 E.01661
G1 X117.424 Y132.676 E.3194
G1 X117.324 Y132.665 E.00309
G1 X117.251 Y132.615 E.00272
G3 X117.205 Y132.52 I.178 J-.145 E.00329
G1 X117.104 Y131.755 E.02371
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.0146
G1 X120.338 Y131.808 E.09126
G1 X120.1 Y129.999 E.05608
G1 X127.635 Y129.007 E.23353
G1 X127.195 Y125.666 E.10355
G1 X119.66 Y126.658 E.23353
G1 X119.422 Y124.848 E.05608
G1 X116.478 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.213 Y124.986 E.02327
G3 X116.383 Y124.764 I.192 J-.029 E.00959
G1 X126.684 Y123.408 E.31925
G3 X128.225 Y123.326 I1.511 J13.961 E.04745
G3 X129.316 Y123.408 I-.257 J10.797 E.03364
G1 X139.617 Y124.764 E.31925
G3 X139.787 Y124.986 I-.023 J.193 E.00958
G1 X139.689 Y125.737 E.02327
G1 X139.46 Y125.707 E.00707
G1 X139.522 Y125.236 E.0146
G1 X136.578 Y124.848 E.09126
G1 X136.34 Y126.658 E.05608
G1 X128.864 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.568 Y127.651 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X128 Y128.157 F42000
G1 Z8.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51311
G1 F2468
M204 S6000
G1 X128 Y128.365 E.00796
; LINE_WIDTH: 0.474823
G1 X128 Y128.573 E.00731
; LINE_WIDTH: 0.436536
G1 X128 Y128.78 E.00667
; LINE_WIDTH: 0.39825
G1 X128 Y128.988 E.00602
; LINE_WIDTH: 0.35712
G1 X128.146 Y129.166 E.00589
; WIPE_START
G1 F11457.67
G1 X128 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128 Y127.035 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
; LINE_WIDTH: 0.12175
G1 F2468
M204 S6000
G1 X128 Y126.814 E.00142
; LINE_WIDTH: 0.171403
G1 X128 Y126.593 E.00231
; LINE_WIDTH: 0.221056
G1 X128 Y126.372 E.00321
; LINE_WIDTH: 0.270708
G1 X128 Y126.151 E.0041
; LINE_WIDTH: 0.320361
G1 X128 Y125.93 E.005
; LINE_WIDTH: 0.370014
G1 X128 Y125.709 E.00589
; LINE_WIDTH: 0.419667
G1 X128 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X128 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X128 Y125.046 E.00857
; WIPE_START
G1 F7562.194
G1 X128 Y125.267 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.37 Y125.093 Z9.2 F42000
G1 X116.413 Y125.002 Z9.2
G1 Z8.8
G1 E.8 F1800
; LINE_WIDTH: 0.130851
G1 F2468
M204 S6000
G1 X119.585 Y124.585 E.02293
; WIPE_START
G1 F15000
G1 X117.602 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.216 Y125.706 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2468
M204 S6000
G1 X122.83 Y125.494 E.05401
G1 X123.788 Y124.536 E.04493
G1 X124.449 Y124.449 E.0221
G1 X125.184 Y125.184 E.03448
G1 X127.392 Y124.893 E.07389
G1 X127.392 Y124.697 E.00649
G1 X128.608 Y124.697 E.04032
G1 X128.608 Y124.893 E.00649
G1 X130.816 Y125.184 E.07389
G1 X131.551 Y124.449 E.03448
G1 X132.212 Y124.536 E.0221
G1 X133.17 Y125.494 E.04493
G1 X134.784 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X133.17 Y125.494 E-.61876
G1 X132.907 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.415 Y124.585 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130828
G1 F2468
M204 S6000
G1 X139.587 Y125.002 E.02292
; WIPE_START
G1 F15000
G1 X137.605 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.591 Y132.31 Z9.2 F42000
G1 X138.608 Y132.438 Z9.2
G1 Z8.8
G1 E.8 F1800
; LINE_WIDTH: 0.130837
G1 F2468
M204 S6000
G1 X135.436 Y132.02 E.02292
; WIPE_START
G1 F15000
G1 X137.419 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.89 Y130.612 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2468
M204 S6000
G1 X133.276 Y130.4 E.05401
G1 X132.541 Y131.135 E.03448
G1 X130.922 Y130.922 E.05419
G1 X129.964 Y129.964 E.04493
G1 X128 Y129.705 E.0657
G1 X126.036 Y129.964 E.06571
G1 X125.078 Y130.922 E.04493
G1 X123.459 Y131.135 E.05419
G1 X122.724 Y130.4 E.03448
G1 X121.11 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X122.724 Y130.4 E-.61876
G1 X122.987 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.564 Y132.02 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130853
G1 F2468
M204 S6000
G1 X117.392 Y132.438 E.02293
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X119.375 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 45/85
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z9.2 I.739 J.967 P1  F42000
G1 X128.467 Y125.226 Z9.2
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
M73 P65 R6
G1 X128.107 Y127.961 E.09151
G1 X127.893 Y127.961 E.0071
G1 X127.533 Y125.226 E.09151
G1 X119.998 Y126.218 E.25211
G1 X119.799 Y124.71 E.05045
G1 X126.731 Y123.797 E.23192
G3 X128.222 Y123.719 I1.453 J13.374 E.04956
G3 X129.269 Y123.797 I-.255 J10.41 E.03485
G1 X136.201 Y124.71 E.23191
G1 X136.002 Y126.218 E.05045
G1 X128.527 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X128.223 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.631 Y129.534 Z9.4 F42000
G1 Z9
G1 E.8 F1800
G1 F2455
M204 S6000
G1 X128 Y129.354 E.04581
G1 X135.46 Y130.336 E.24959
G1 X135.261 Y131.844 E.05045
G1 X128.317 Y130.93 E.23235
G2 X127.683 Y130.93 I-.317 J4.251 E.02103
G1 X120.739 Y131.844 E.23236
G1 X120.54 Y130.336 E.05045
G1 X126.571 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X128 Y129.354 E-.54755
G1 X128.554 Y129.427 E-.21245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.805 Y125.666 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2455
M204 S5000
G1 X128.365 Y129.007 E.10355
G1 X135.9 Y129.999 E.23353
G1 X135.662 Y131.808 E.05608
G1 X138.606 Y132.196 E.09126
G1 X138.668 Y131.725 E.0146
G1 X138.896 Y131.755 E.00706
G1 X138.791 Y132.538 E.02428
G3 X138.577 Y132.676 I-.185 J-.051 E.00857
G1 X128.27 Y131.319 E.31943
G2 X127.73 Y131.319 I-.27 J3.667 E.01661
G1 X117.423 Y132.676 E.31943
G1 X117.326 Y132.666 E.003
G1 X117.251 Y132.615 E.00278
G3 X117.205 Y132.521 I.199 J-.155 E.00326
G1 X117.104 Y131.755 E.02375
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.0146
G1 X120.338 Y131.808 E.09126
G1 X120.1 Y129.999 E.05608
G1 X127.635 Y129.007 E.23353
G1 X127.195 Y125.666 E.10355
M73 P66 R6
G1 X119.66 Y126.658 E.23353
G1 X119.422 Y124.848 E.05608
G1 X116.478 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.213 Y124.986 E.02326
G3 X116.383 Y124.764 I.193 J-.029 E.00959
G1 X126.684 Y123.408 E.31925
G3 X128.231 Y123.327 I1.508 J13.921 E.04762
G3 X129.316 Y123.408 I-.264 J10.804 E.03347
G1 X139.617 Y124.764 E.31925
G3 X139.787 Y124.986 I-.023 J.194 E.00959
G1 X139.689 Y125.737 E.02326
G1 X139.46 Y125.707 E.00707
G1 X139.522 Y125.236 E.0146
G1 X136.578 Y124.848 E.09126
G1 X136.34 Y126.658 E.05608
G1 X128.864 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.568 Y127.651 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X128 Y128.157 F42000
G1 Z9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51311
G1 F2455
M204 S6000
G1 X128 Y128.365 E.00796
; LINE_WIDTH: 0.474822
G1 X128 Y128.573 E.00731
; LINE_WIDTH: 0.436535
G1 X128 Y128.78 E.00667
; LINE_WIDTH: 0.398247
G1 X128 Y128.988 E.00602
; LINE_WIDTH: 0.357162
G1 X128.146 Y129.166 E.00589
; WIPE_START
G1 F11456.137
G1 X128 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128 Y127.035 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.12175
G1 F2455
M204 S6000
G1 X128 Y126.814 E.00142
; LINE_WIDTH: 0.171403
G1 X128 Y126.593 E.00231
; LINE_WIDTH: 0.221056
G1 X128 Y126.372 E.00321
; LINE_WIDTH: 0.270708
G1 X128 Y126.151 E.0041
; LINE_WIDTH: 0.320361
G1 X128 Y125.93 E.005
; LINE_WIDTH: 0.370014
G1 X128 Y125.709 E.00589
; LINE_WIDTH: 0.419667
G1 X128 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X128 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X128 Y125.046 E.00857
M204 S10000
G1 X134.784 Y125.706 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X133.17 Y125.494 E.05401
G1 X132.212 Y124.536 E.04493
G1 X131.551 Y124.449 E.0221
G1 X130.816 Y125.184 E.03448
G1 X128.608 Y124.893 E.07389
G1 X128.608 Y124.697 E.00649
G1 X127.392 Y124.697 E.04032
G1 X127.392 Y124.893 E.00649
G1 X125.184 Y125.184 E.07389
G1 X124.449 Y124.449 E.03448
G1 X123.788 Y124.536 E.0221
G1 X122.83 Y125.494 E.04493
G1 X121.216 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X122.83 Y125.494 E-.61876
G1 X123.093 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.585 Y124.585 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130851
G1 F2455
M204 S6000
G1 X116.413 Y125.002 E.02293
; WIPE_START
G1 F15000
G1 X118.395 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.11 Y130.612 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X122.724 Y130.4 E.05401
G1 X123.459 Y131.135 E.03448
G1 X125.078 Y130.922 E.05419
G1 X126.036 Y129.964 E.04493
G1 X128 Y129.705 E.06571
G1 X129.964 Y129.964 E.06571
G1 X130.922 Y130.922 E.04493
G1 X132.541 Y131.135 E.05419
G1 X133.276 Y130.4 E.03448
G1 X134.89 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X133.276 Y130.4 E-.61876
G1 X133.013 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.436 Y132.02 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130837
G1 F2455
M204 S6000
G1 X138.608 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X136.625 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.538 Y125.122 Z9.4 F42000
G1 X139.587 Y125.002 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.130845
G1 F2455
M204 S6000
G1 X136.415 Y124.585 E.02293
; WIPE_START
G1 F15000
G1 X138.398 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.317 Y127.694 Z9.4 F42000
G1 X120.564 Y132.02 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.130854
G1 F2455
M204 S6000
G1 X117.392 Y132.438 E.02293
; CHANGE_LAYER
; Z_HEIGHT: 9.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X119.375 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 46/85
; update layer progress
M73 L46
M991 S0 P45 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z9.4 I.739 J.967 P1  F42000
G1 X128.467 Y125.226 Z9.4
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2468
M204 S6000
G1 X128.107 Y127.961 E.09151
G1 X127.893 Y127.961 E.0071
G1 X127.533 Y125.226 E.09151
G1 X119.998 Y126.218 E.25211
G1 X119.799 Y124.71 E.05045
G1 X126.731 Y123.797 E.23192
G3 X128.228 Y123.719 I1.45 J13.337 E.04974
G3 X129.269 Y123.797 I-.262 J10.424 E.03466
G1 X136.201 Y124.71 E.23192
G1 X136.002 Y126.218 E.05045
G1 X128.527 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X128.223 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.631 Y129.534 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
G1 F2468
M204 S6000
G1 X128 Y129.354 E.04581
G1 X135.46 Y130.336 E.24959
G1 X135.261 Y131.844 E.05045
G1 X128.317 Y130.93 E.23235
G2 X127.69 Y130.929 I-.318 J3.309 E.02083
G1 X120.739 Y131.844 E.23257
G1 X120.54 Y130.336 E.05045
G1 X126.571 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X128 Y129.354 E-.54755
G1 X128.554 Y129.427 E-.21245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.805 Y125.666 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2468
M204 S5000
G1 X128.365 Y129.007 E.10355
G1 X135.9 Y129.999 E.23353
G1 X135.662 Y131.808 E.05608
G1 X138.606 Y132.196 E.09126
G1 X138.668 Y131.725 E.0146
G1 X138.896 Y131.755 E.00706
G1 X138.781 Y132.566 E.02517
G3 X138.576 Y132.676 I-.177 J-.084 E.00764
G1 X128.27 Y131.319 E.31942
G2 X127.732 Y131.319 I-.27 J2.784 E.01655
G1 X117.355 Y132.674 E.32159
G3 X117.205 Y132.52 I.04 J-.189 E.00701
G1 X117.104 Y131.755 E.02371
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.0146
G1 X120.338 Y131.808 E.09126
G1 X120.1 Y129.999 E.05608
G1 X127.635 Y129.007 E.23353
G1 X127.195 Y125.666 E.10355
G1 X119.66 Y126.658 E.23353
G1 X119.422 Y124.848 E.05608
G1 X116.478 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.213 Y124.986 E.02326
G3 X116.383 Y124.764 I.196 J-.026 E.00954
G1 X126.684 Y123.408 E.31925
G3 X128.236 Y123.327 I1.505 J13.883 E.04779
G3 X129.316 Y123.408 I-.27 J10.818 E.03329
G1 X139.617 Y124.764 E.31925
G3 X139.787 Y124.986 I-.03 J.2 E.0095
G1 X139.689 Y125.737 E.02326
G1 X139.46 Y125.707 E.00707
G1 X139.522 Y125.236 E.0146
G1 X136.578 Y124.848 E.09126
G1 X136.34 Y126.658 E.05608
G1 X128.864 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.568 Y127.651 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X128 Y128.157 F42000
G1 Z9.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51311
G1 F2468
M204 S6000
G1 X128 Y128.365 E.00796
; LINE_WIDTH: 0.474822
G1 X128 Y128.573 E.00731
; LINE_WIDTH: 0.436535
G1 X128 Y128.78 E.00667
; LINE_WIDTH: 0.398247
G1 X128 Y128.988 E.00602
; LINE_WIDTH: 0.357162
G1 X128.146 Y129.166 E.00589
; WIPE_START
G1 F11456.137
G1 X128 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128 Y127.035 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
; LINE_WIDTH: 0.12175
G1 F2468
M204 S6000
G1 X128 Y126.814 E.00142
; LINE_WIDTH: 0.171403
G1 X128 Y126.593 E.00231
; LINE_WIDTH: 0.221056
G1 X128 Y126.372 E.00321
; LINE_WIDTH: 0.270708
G1 X128 Y126.151 E.0041
; LINE_WIDTH: 0.320361
G1 X128 Y125.93 E.005
; LINE_WIDTH: 0.370014
G1 X128 Y125.709 E.00589
; LINE_WIDTH: 0.419667
G1 X128 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X128 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X128 Y125.046 E.00857
; WIPE_START
G1 F7562.194
G1 X128 Y125.267 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.37 Y125.093 Z9.6 F42000
G1 X116.413 Y125.002 Z9.6
G1 Z9.2
G1 E.8 F1800
; LINE_WIDTH: 0.130839
G1 F2468
M204 S6000
G1 X119.585 Y124.585 E.02292
; WIPE_START
G1 F15000
G1 X117.602 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.216 Y125.706 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2468
M204 S6000
G1 X122.83 Y125.494 E.05401
G1 X123.788 Y124.536 E.04493
G1 X124.449 Y124.449 E.0221
G1 X125.184 Y125.184 E.03448
G1 X127.392 Y124.893 E.07389
G1 X127.392 Y124.697 E.00649
M73 P67 R6
G1 X128.608 Y124.697 E.04032
G1 X128.608 Y124.893 E.00649
G1 X130.816 Y125.184 E.07389
G1 X131.551 Y124.449 E.03448
G1 X132.212 Y124.536 E.0221
G1 X133.17 Y125.494 E.04493
G1 X134.784 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X133.17 Y125.494 E-.61876
G1 X132.907 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.415 Y124.585 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130837
G1 F2468
M204 S6000
G1 X139.587 Y125.002 E.02292
; WIPE_START
G1 F15000
G1 X137.605 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.591 Y132.31 Z9.6 F42000
G1 X138.608 Y132.438 Z9.6
G1 Z9.2
G1 E.8 F1800
; LINE_WIDTH: 0.130848
G1 F2468
M204 S6000
G1 X135.436 Y132.02 E.02292
; WIPE_START
G1 F15000
G1 X137.419 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.89 Y130.612 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2468
M204 S6000
G1 X133.276 Y130.4 E.05401
G1 X132.541 Y131.135 E.03448
G1 X130.922 Y130.922 E.05419
G1 X129.964 Y129.964 E.04493
G1 X128 Y129.705 E.06571
G1 X126.036 Y129.964 E.06571
G1 X125.078 Y130.922 E.04493
G1 X123.459 Y131.135 E.05419
G1 X122.724 Y130.4 E.03448
G1 X121.11 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X122.724 Y130.4 E-.61876
G1 X122.987 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.564 Y132.02 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130852
G1 F2468
M204 S6000
G1 X117.392 Y132.438 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 9.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X119.375 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 47/85
; update layer progress
M73 L47
M991 S0 P46 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z9.6 I.739 J.967 P1  F42000
G1 X128.467 Y125.226 Z9.6
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2468
M204 S6000
G1 X128.107 Y127.961 E.09151
G1 X127.893 Y127.961 E.0071
G1 X127.533 Y125.226 E.09151
G1 X119.998 Y126.218 E.25211
G1 X119.799 Y124.71 E.05045
G1 X126.731 Y123.797 E.23192
G3 X128.233 Y123.719 I1.447 J13.298 E.04993
G3 X129.269 Y123.797 I-.268 J10.435 E.03448
G1 X136.201 Y124.71 E.23191
G1 X136.002 Y126.218 E.05045
G1 X128.527 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X128.223 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.631 Y129.534 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
G1 F2468
M204 S6000
G1 X128 Y129.354 E.04581
G1 X135.46 Y130.336 E.24959
G1 X135.261 Y131.844 E.05045
G1 X128.312 Y130.929 E.23251
G2 X127.683 Y130.93 I-.311 J3.725 E.02088
G1 X120.739 Y131.844 E.23236
G1 X120.54 Y130.336 E.05045
G1 X126.571 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X128 Y129.354 E-.54756
G1 X128.554 Y129.427 E-.21244
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.805 Y125.666 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2468
M204 S5000
G1 X128.365 Y129.007 E.10355
G1 X135.9 Y129.999 E.23353
G1 X135.662 Y131.808 E.05608
G1 X138.606 Y132.196 E.09126
G1 X138.668 Y131.725 E.0146
G1 X138.896 Y131.755 E.00706
G1 X138.791 Y132.538 E.02428
G3 X138.576 Y132.676 I-.184 J-.051 E.0086
G1 X128.268 Y131.319 E.31945
G2 X127.73 Y131.319 I-.268 J3.156 E.01656
G1 X117.355 Y132.674 E.32152
G3 X117.205 Y132.52 I.04 J-.189 E.00701
G1 X117.104 Y131.755 E.02371
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.0146
G1 X120.338 Y131.808 E.09126
G1 X120.1 Y129.999 E.05608
G1 X127.635 Y129.007 E.23353
G1 X127.195 Y125.666 E.10355
G1 X119.66 Y126.658 E.23353
G1 X119.422 Y124.848 E.05608
G1 X116.478 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.213 Y124.986 E.02327
G3 X116.383 Y124.764 I.192 J-.029 E.00959
G1 X126.684 Y123.408 E.31925
G3 X128.242 Y123.327 I1.502 J13.843 E.04796
G3 X129.316 Y123.408 I-.277 J10.828 E.03312
G1 X139.617 Y124.764 E.31925
G3 X139.787 Y124.986 I-.024 J.195 E.00956
G1 X139.689 Y125.737 E.02327
G1 X139.46 Y125.707 E.00707
G1 X139.522 Y125.236 E.0146
G1 X136.578 Y124.848 E.09126
G1 X136.34 Y126.658 E.05608
G1 X128.864 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.568 Y127.651 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X128 Y128.157 F42000
G1 Z9.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51311
G1 F2468
M204 S6000
G1 X128 Y128.365 E.00796
; LINE_WIDTH: 0.474823
G1 X128 Y128.573 E.00731
; LINE_WIDTH: 0.436536
G1 X128 Y128.78 E.00667
; LINE_WIDTH: 0.39825
G1 X128 Y128.988 E.00602
; LINE_WIDTH: 0.35712
G1 X128.146 Y129.166 E.00589
; WIPE_START
G1 F11457.67
G1 X128 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128 Y127.035 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
; LINE_WIDTH: 0.12175
G1 F2468
M204 S6000
G1 X128 Y126.814 E.00142
; LINE_WIDTH: 0.171403
G1 X128 Y126.593 E.00231
; LINE_WIDTH: 0.221056
G1 X128 Y126.372 E.00321
; LINE_WIDTH: 0.270708
G1 X128 Y126.151 E.0041
; LINE_WIDTH: 0.320361
G1 X128 Y125.93 E.005
; LINE_WIDTH: 0.370014
G1 X128 Y125.709 E.00589
; LINE_WIDTH: 0.419667
G1 X128 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X128 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X128 Y125.046 E.00857
; WIPE_START
G1 F7562.194
G1 X128 Y125.267 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.63 Y125.093 Z9.8 F42000
G1 X139.587 Y125.002 Z9.8
G1 Z9.4
G1 E.8 F1800
; LINE_WIDTH: 0.130837
G1 F2468
M204 S6000
G1 X136.415 Y124.585 E.02292
; WIPE_START
G1 F15000
G1 X138.398 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.784 Y125.706 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2468
M204 S6000
G1 X133.17 Y125.494 E.05401
G1 X132.212 Y124.536 E.04493
G1 X131.551 Y124.449 E.0221
G1 X130.816 Y125.184 E.03448
G1 X128.608 Y124.893 E.07389
G1 X128.608 Y124.697 E.00649
G1 X127.392 Y124.697 E.04032
G1 X127.392 Y124.893 E.00649
G1 X125.184 Y125.184 E.07389
G1 X124.449 Y124.449 E.03448
G1 X123.788 Y124.536 E.0221
G1 X122.83 Y125.494 E.04493
G1 X121.216 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X122.83 Y125.494 E-.61876
G1 X123.093 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.585 Y124.585 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130851
G1 F2468
M204 S6000
G1 X116.413 Y125.002 E.02293
; WIPE_START
G1 F15000
G1 X118.395 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.409 Y132.31 Z9.8 F42000
G1 X117.392 Y132.438 Z9.8
G1 Z9.4
G1 E.8 F1800
; LINE_WIDTH: 0.130842
G1 F2468
M204 S6000
G1 X120.564 Y132.02 E.02292
; WIPE_START
G1 F15000
G1 X118.581 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.11 Y130.612 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2468
M204 S6000
G1 X122.724 Y130.4 E.05401
G1 X123.459 Y131.135 E.03448
G1 X125.078 Y130.922 E.05419
G1 X126.036 Y129.964 E.04493
G1 X128 Y129.705 E.06571
G1 X129.964 Y129.964 E.0657
G1 X130.922 Y130.922 E.04493
G1 X132.541 Y131.135 E.05419
G1 X133.276 Y130.4 E.03448
G1 X134.89 Y130.612 E.05401
; WIPE_START
M73 P68 R6
G1 F8843.478
G1 X133.276 Y130.4 E-.61876
G1 X133.013 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.436 Y132.02 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130847
G1 F2468
M204 S6000
G1 X138.608 Y132.438 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 9.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15000
G1 X136.625 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 48/85
; update layer progress
M73 L48
M991 S0 P47 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z9.8 I.789 J-.926 P1  F42000
G1 X128.467 Y125.226 Z9.8
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2467
M204 S6000
G1 X128.107 Y127.961 E.09151
G1 X127.893 Y127.961 E.0071
G1 X127.533 Y125.226 E.09151
G1 X119.998 Y126.218 E.25211
G1 X119.799 Y124.71 E.05045
G1 X126.731 Y123.797 E.23192
G3 X128.239 Y123.719 I1.444 J13.264 E.05011
G3 X129.269 Y123.797 I-.275 J10.441 E.0343
G1 X136.201 Y124.71 E.23191
G1 X136.002 Y126.218 E.05045
G1 X128.527 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X128.223 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.631 Y129.534 Z10 F42000
G1 Z9.6
G1 E.8 F1800
G1 F2467
M204 S6000
G1 X128 Y129.354 E.04581
G1 X135.46 Y130.336 E.24959
G1 X135.261 Y131.844 E.05045
G1 X128.317 Y130.93 E.23235
G2 X127.683 Y130.93 I-.317 J4.251 E.02103
G1 X120.739 Y131.844 E.23236
G1 X120.54 Y130.336 E.05045
G1 X126.571 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X128 Y129.354 E-.54755
G1 X128.554 Y129.427 E-.21245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.805 Y125.666 Z10 F42000
G1 Z9.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2467
M204 S5000
G1 X128.365 Y129.007 E.10355
G1 X135.9 Y129.999 E.23353
G1 X135.662 Y131.808 E.05608
G1 X138.606 Y132.196 E.09126
G1 X138.668 Y131.725 E.0146
G1 X138.896 Y131.755 E.00706
G1 X138.791 Y132.538 E.02429
G3 X138.576 Y132.676 I-.184 J-.051 E.0086
G1 X128.27 Y131.319 E.3194
G2 X127.73 Y131.319 I-.27 J3.667 E.01661
G1 X117.354 Y132.674 E.32152
G3 X117.205 Y132.522 I.039 J-.188 E.00693
G1 X117.104 Y131.755 E.02379
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.0146
G1 X120.338 Y131.808 E.09126
G1 X120.1 Y129.999 E.05608
G1 X127.635 Y129.007 E.23353
G1 X127.195 Y125.666 E.10355
G1 X119.66 Y126.658 E.23353
G1 X119.422 Y124.848 E.05608
G1 X116.478 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.213 Y124.986 E.02326
G3 X116.383 Y124.764 I.195 J-.027 E.00957
G1 X126.684 Y123.408 E.31925
G3 X128.247 Y123.327 I1.499 J13.808 E.04813
G3 X129.316 Y123.408 I-.283 J10.834 E.03296
G1 X139.617 Y124.764 E.31925
G3 X139.787 Y124.986 I-.024 J.195 E.00957
G1 X139.689 Y125.737 E.02326
G1 X139.46 Y125.707 E.00707
G1 X139.522 Y125.236 E.0146
G1 X136.578 Y124.848 E.09126
G1 X136.34 Y126.658 E.05608
G1 X128.864 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.568 Y127.651 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X128 Y128.157 F42000
G1 Z9.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51311
G1 F2467
M204 S6000
G1 X128 Y128.365 E.00796
; LINE_WIDTH: 0.474822
G1 X128 Y128.573 E.00731
; LINE_WIDTH: 0.436535
G1 X128 Y128.78 E.00667
; LINE_WIDTH: 0.398247
G1 X128 Y128.988 E.00602
; LINE_WIDTH: 0.357162
G1 X128.146 Y129.166 E.00589
; WIPE_START
G1 F11456.137
G1 X128 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128 Y127.035 Z10 F42000
G1 Z9.6
G1 E.8 F1800
; LINE_WIDTH: 0.12175
G1 F2467
M204 S6000
G1 X128 Y126.814 E.00142
; LINE_WIDTH: 0.171403
G1 X128 Y126.593 E.00231
; LINE_WIDTH: 0.221056
G1 X128 Y126.372 E.00321
; LINE_WIDTH: 0.270708
G1 X128 Y126.151 E.0041
; LINE_WIDTH: 0.320361
G1 X128 Y125.93 E.005
; LINE_WIDTH: 0.370014
G1 X128 Y125.709 E.00589
; LINE_WIDTH: 0.419667
G1 X128 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X128 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X128 Y125.046 E.00857
; WIPE_START
G1 F7562.194
G1 X128 Y125.267 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.37 Y125.093 Z10 F42000
G1 X116.413 Y125.002 Z10
G1 Z9.6
G1 E.8 F1800
; LINE_WIDTH: 0.130839
G1 F2467
M204 S6000
G1 X119.585 Y124.585 E.02292
; WIPE_START
G1 F15000
G1 X117.602 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.216 Y125.706 Z10 F42000
G1 Z9.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2467
M204 S6000
G1 X122.83 Y125.494 E.05401
G1 X123.788 Y124.536 E.04493
G1 X124.449 Y124.449 E.0221
G1 X125.184 Y125.184 E.03448
G1 X127.392 Y124.893 E.07389
G1 X127.392 Y124.697 E.00649
G1 X128.608 Y124.697 E.04032
G1 X128.608 Y124.893 E.00649
G1 X130.816 Y125.184 E.07389
G1 X131.551 Y124.449 E.03448
G1 X132.212 Y124.536 E.0221
G1 X133.17 Y125.494 E.04493
G1 X134.784 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X133.17 Y125.494 E-.61876
G1 X132.907 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.415 Y124.585 Z10 F42000
G1 Z9.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130845
G1 F2467
M204 S6000
G1 X139.587 Y125.002 E.02293
; WIPE_START
G1 F15000
G1 X137.605 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.591 Y132.31 Z10 F42000
G1 X138.608 Y132.438 Z10
G1 Z9.6
G1 E.8 F1800
; LINE_WIDTH: 0.130848
G1 F2467
M204 S6000
G1 X135.436 Y132.02 E.02292
; WIPE_START
G1 F15000
G1 X137.419 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.89 Y130.612 Z10 F42000
G1 Z9.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2467
M204 S6000
G1 X133.276 Y130.4 E.05401
G1 X132.541 Y131.135 E.03448
G1 X130.922 Y130.922 E.05419
G1 X129.964 Y129.964 E.04493
G1 X128 Y129.705 E.06571
G1 X126.036 Y129.964 E.06571
G1 X125.078 Y130.922 E.04493
G1 X123.459 Y131.135 E.05419
G1 X122.724 Y130.4 E.03448
G1 X121.11 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X122.724 Y130.4 E-.61876
G1 X122.987 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.564 Y132.02 Z10 F42000
G1 Z9.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130852
G1 F2467
M204 S6000
G1 X117.392 Y132.438 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 9.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X119.375 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 49/85
; update layer progress
M73 L49
M991 S0 P48 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z10 I.739 J.967 P1  F42000
G1 X128.467 Y125.226 Z10
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X128.107 Y127.961 E.09151
G1 X127.893 Y127.961 E.0071
G1 X127.533 Y125.226 E.09151
G1 X119.998 Y126.218 E.25211
G1 X119.799 Y124.71 E.05045
G1 X126.731 Y123.797 E.23192
G3 X128.244 Y123.719 I1.442 J13.234 E.05029
G3 X129.269 Y123.797 I-.282 J10.466 E.03411
G1 X136.201 Y124.71 E.23192
M73 P69 R6
G1 X136.002 Y126.218 E.05045
G1 X128.527 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X128.223 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.631 Y129.534 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
G1 F2455
M204 S6000
G1 X128 Y129.354 E.04581
G1 X135.46 Y130.336 E.24959
G1 X135.261 Y131.844 E.05045
G1 X128.317 Y130.93 E.23236
G2 X127.69 Y130.929 I-.318 J3.31 E.02083
G1 X120.739 Y131.844 E.23257
G1 X120.54 Y130.336 E.05045
G1 X126.571 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X128 Y129.354 E-.54755
G1 X128.554 Y129.427 E-.21245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.805 Y125.666 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2455
M204 S5000
G1 X128.365 Y129.007 E.10355
G1 X135.9 Y129.999 E.23353
G1 X135.662 Y131.808 E.05608
G1 X138.606 Y132.196 E.09126
G1 X138.668 Y131.725 E.0146
G1 X138.896 Y131.755 E.00706
G1 X138.791 Y132.538 E.02428
G3 X138.576 Y132.676 I-.185 J-.052 E.0086
G1 X128.27 Y131.319 E.3194
G2 X127.732 Y131.319 I-.27 J2.787 E.01655
G1 X117.424 Y132.676 E.31947
G1 X117.311 Y132.66 E.00353
G3 X117.205 Y132.521 I.087 J-.175 E.00556
G1 X117.104 Y131.755 E.02374
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.0146
G1 X120.338 Y131.808 E.09126
G1 X120.1 Y129.999 E.05608
G1 X127.635 Y129.007 E.23353
G1 X127.195 Y125.666 E.10355
G1 X119.66 Y126.658 E.23353
G1 X119.422 Y124.848 E.05608
G1 X116.478 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.213 Y124.986 E.02326
G3 X116.383 Y124.764 I.195 J-.027 E.00957
G1 X126.684 Y123.408 E.31925
G3 X128.253 Y123.327 I1.497 J13.778 E.0483
G3 X129.316 Y123.408 I-.29 J10.848 E.03279
G1 X139.617 Y124.764 E.31925
G3 X139.787 Y124.986 I-.024 J.195 E.00957
G1 X139.689 Y125.737 E.02326
G1 X139.46 Y125.707 E.00707
G1 X139.522 Y125.236 E.0146
G1 X136.578 Y124.848 E.09126
G1 X136.34 Y126.658 E.05608
G1 X128.864 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.568 Y127.651 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X128 Y128.157 F42000
G1 Z9.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51311
G1 F2455
M204 S6000
G1 X128 Y128.365 E.00796
; LINE_WIDTH: 0.474822
G1 X128 Y128.573 E.00731
; LINE_WIDTH: 0.436535
G1 X128 Y128.78 E.00667
; LINE_WIDTH: 0.398247
G1 X128 Y128.988 E.00602
; LINE_WIDTH: 0.357162
G1 X128.146 Y129.166 E.00589
; WIPE_START
G1 F11456.137
G1 X128 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128 Y127.035 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
; LINE_WIDTH: 0.12175
G1 F2455
M204 S6000
G1 X128 Y126.814 E.00142
; LINE_WIDTH: 0.171403
G1 X128 Y126.593 E.00231
; LINE_WIDTH: 0.221056
G1 X128 Y126.372 E.00321
; LINE_WIDTH: 0.270708
G1 X128 Y126.151 E.0041
; LINE_WIDTH: 0.320361
G1 X128 Y125.93 E.005
; LINE_WIDTH: 0.370014
G1 X128 Y125.709 E.00589
; LINE_WIDTH: 0.419667
G1 X128 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X128 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X128 Y125.046 E.00857
M204 S10000
G1 X134.784 Y125.706 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X133.17 Y125.494 E.05401
G1 X132.212 Y124.536 E.04493
G1 X131.551 Y124.449 E.0221
G1 X130.816 Y125.184 E.03448
G1 X128.608 Y124.893 E.07389
G1 X128.608 Y124.697 E.00649
G1 X127.392 Y124.697 E.04032
G1 X127.392 Y124.893 E.00649
G1 X125.184 Y125.184 E.07389
G1 X124.449 Y124.449 E.03448
G1 X123.788 Y124.536 E.0221
G1 X122.83 Y125.494 E.04493
G1 X121.216 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X122.83 Y125.494 E-.61876
G1 X123.093 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.585 Y124.585 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130851
G1 F2455
M204 S6000
G1 X116.413 Y125.002 E.02293
; WIPE_START
G1 F15000
G1 X118.395 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.11 Y130.612 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X122.724 Y130.4 E.05401
G1 X123.459 Y131.135 E.03448
G1 X125.078 Y130.922 E.05419
G1 X126.036 Y129.964 E.04493
G1 X128 Y129.705 E.06571
G1 X129.964 Y129.964 E.06571
G1 X130.922 Y130.922 E.04493
G1 X132.541 Y131.135 E.05419
G1 X133.276 Y130.4 E.03448
G1 X134.89 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X133.276 Y130.4 E-.61876
G1 X133.013 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.436 Y132.02 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130837
G1 F2455
M204 S6000
G1 X138.608 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X136.625 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.538 Y125.122 Z10.2 F42000
G1 X139.587 Y125.002 Z10.2
G1 Z9.8
G1 E.8 F1800
; LINE_WIDTH: 0.130845
G1 F2455
M204 S6000
G1 X136.415 Y124.585 E.02293
; WIPE_START
G1 F15000
G1 X138.398 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.317 Y127.694 Z10.2 F42000
G1 X120.564 Y132.02 Z10.2
G1 Z9.8
G1 E.8 F1800
; LINE_WIDTH: 0.130854
G1 F2455
M204 S6000
G1 X117.392 Y132.438 E.02293
; CHANGE_LAYER
; Z_HEIGHT: 10
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X119.375 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 50/85
; update layer progress
M73 L50
M991 S0 P49 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z10.2 I.739 J.967 P1  F42000
G1 X128.467 Y125.226 Z10.2
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2468
M204 S6000
G1 X128.107 Y127.961 E.09151
G1 X127.893 Y127.961 E.0071
G1 X127.533 Y125.226 E.09151
G1 X119.998 Y126.218 E.25211
G1 X119.799 Y124.71 E.05045
G1 X126.731 Y123.797 E.23192
G3 X128.25 Y123.719 I1.44 J13.203 E.05048
G3 X129.269 Y123.797 I-.289 J10.477 E.03393
G1 X136.201 Y124.71 E.23191
G1 X136.002 Y126.218 E.05045
G1 X128.527 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X128.223 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.631 Y129.534 Z10.4 F42000
G1 Z10
G1 E.8 F1800
G1 F2468
M204 S6000
G1 X128 Y129.354 E.04581
G1 X135.46 Y130.336 E.24959
G1 X135.261 Y131.844 E.05045
G1 X128.317 Y130.93 E.23235
G2 X127.683 Y130.93 I-.317 J4.251 E.02103
G1 X120.739 Y131.844 E.23236
G1 X120.54 Y130.336 E.05045
G1 X126.571 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X128 Y129.354 E-.54756
G1 X128.554 Y129.427 E-.21244
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.805 Y125.666 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2468
M204 S5000
G1 X128.365 Y129.007 E.10355
G1 X135.9 Y129.999 E.23353
G1 X135.662 Y131.808 E.05608
G1 X138.606 Y132.196 E.09126
G1 X138.668 Y131.725 E.0146
G1 X138.896 Y131.755 E.00706
G1 X138.791 Y132.538 E.02428
G3 X138.577 Y132.676 I-.185 J-.053 E.00857
G1 X128.27 Y131.319 E.31942
G2 X127.73 Y131.319 I-.27 J3.667 E.01661
G1 X117.395 Y132.678 E.3203
G3 X117.205 Y132.522 I-.001 J-.192 E.00817
G1 X117.104 Y131.755 E.02379
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.0146
G1 X120.338 Y131.808 E.09126
G1 X120.1 Y129.999 E.05608
G1 X127.635 Y129.007 E.23353
G1 X127.195 Y125.666 E.10355
G1 X119.66 Y126.658 E.23353
G1 X119.422 Y124.848 E.05608
G1 X116.478 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.213 Y124.986 E.02327
G3 X116.383 Y124.764 I.198 J-.024 E.00952
G1 X126.684 Y123.408 E.31925
G3 X128.258 Y123.327 I1.494 J13.747 E.04847
G3 X129.316 Y123.408 I-.298 J10.874 E.03261
G1 X139.617 Y124.764 E.31925
G3 X139.787 Y124.986 I-.021 J.192 E.00961
G1 X139.689 Y125.737 E.02327
G1 X139.46 Y125.707 E.00707
G1 X139.522 Y125.236 E.0146
G1 X136.578 Y124.848 E.09126
G1 X136.34 Y126.658 E.05608
G1 X128.864 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.568 Y127.651 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X128 Y128.157 F42000
G1 Z10
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51311
G1 F2468
M204 S6000
G1 X128 Y128.365 E.00796
; LINE_WIDTH: 0.474823
G1 X128 Y128.573 E.00731
; LINE_WIDTH: 0.436536
G1 X128 Y128.78 E.00667
; LINE_WIDTH: 0.39825
G1 X128 Y128.988 E.00602
; LINE_WIDTH: 0.35712
G1 X128.146 Y129.166 E.00589
; WIPE_START
G1 F11457.67
G1 X128 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128 Y127.035 Z10.4 F42000
M73 P70 R6
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.12175
G1 F2468
M204 S6000
G1 X128 Y126.814 E.00142
; LINE_WIDTH: 0.171403
G1 X128 Y126.593 E.00231
; LINE_WIDTH: 0.221056
G1 X128 Y126.372 E.00321
; LINE_WIDTH: 0.270708
G1 X128 Y126.151 E.0041
; LINE_WIDTH: 0.320361
G1 X128 Y125.93 E.005
; LINE_WIDTH: 0.370014
G1 X128 Y125.709 E.00589
; LINE_WIDTH: 0.419667
G1 X128 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X128 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X128 Y125.046 E.00857
; WIPE_START
G1 F7562.194
G1 X128 Y125.267 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.37 Y125.093 Z10.4 F42000
G1 X116.413 Y125.002 Z10.4
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.130849
G1 F2468
M204 S6000
G1 X119.585 Y124.585 E.02293
; WIPE_START
G1 F15000
G1 X117.602 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.216 Y125.706 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2468
M204 S6000
G1 X122.83 Y125.494 E.05401
G1 X123.788 Y124.536 E.04493
G1 X124.449 Y124.449 E.0221
G1 X125.184 Y125.184 E.03448
G1 X127.392 Y124.893 E.07389
G1 X127.392 Y124.697 E.00649
G1 X128.608 Y124.697 E.04032
G1 X128.608 Y124.893 E.00649
G1 X130.816 Y125.184 E.07389
G1 X131.551 Y124.449 E.03448
G1 X132.212 Y124.536 E.0221
G1 X133.17 Y125.494 E.04493
G1 X134.784 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X133.17 Y125.494 E-.61876
G1 X132.907 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.415 Y124.585 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130836
G1 F2468
M204 S6000
G1 X139.587 Y125.002 E.02292
; WIPE_START
G1 F15000
G1 X137.605 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.591 Y132.31 Z10.4 F42000
G1 X138.608 Y132.438 Z10.4
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.130847
G1 F2468
M204 S6000
G1 X135.436 Y132.02 E.02292
; WIPE_START
G1 F15000
G1 X137.419 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.89 Y130.612 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2468
M204 S6000
G1 X133.276 Y130.4 E.05401
G1 X132.541 Y131.135 E.03448
G1 X130.922 Y130.922 E.05419
G1 X129.964 Y129.964 E.04493
G1 X128 Y129.705 E.0657
G1 X126.036 Y129.964 E.06571
G1 X125.078 Y130.922 E.04493
G1 X123.459 Y131.135 E.05419
G1 X122.724 Y130.4 E.03448
G1 X121.11 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X122.724 Y130.4 E-.61876
G1 X122.987 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.564 Y132.02 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130855
G1 F2468
M204 S6000
G1 X117.392 Y132.438 E.02293
; CHANGE_LAYER
; Z_HEIGHT: 10.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X119.375 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 51/85
; update layer progress
M73 L51
M991 S0 P50 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z10.4 I.739 J.967 P1  F42000
G1 X128.467 Y125.226 Z10.4
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X128.107 Y127.961 E.09151
G1 X127.893 Y127.961 E.0071
G1 X127.533 Y125.226 E.09151
G1 X119.998 Y126.218 E.25211
G1 X119.799 Y124.71 E.05045
G1 X126.731 Y123.797 E.23192
G3 X128.255 Y123.719 I1.437 J13.171 E.05066
G3 X129.269 Y123.797 I-.296 J10.496 E.03375
G1 X136.201 Y124.71 E.23192
G1 X136.002 Y126.218 E.05045
G1 X128.527 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X128.223 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.631 Y129.534 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
G1 F2455
M204 S6000
G1 X128 Y129.354 E.04581
M73 P70 R5
G1 X135.46 Y130.336 E.24959
G1 X135.261 Y131.844 E.05045
G1 X128.317 Y130.93 E.23236
G2 X127.69 Y130.929 I-.318 J3.31 E.02083
G1 X120.739 Y131.844 E.23257
G1 X120.54 Y130.336 E.05045
G1 X126.571 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X128 Y129.354 E-.54755
G1 X128.554 Y129.427 E-.21245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.805 Y125.666 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2455
M204 S5000
G1 X128.365 Y129.007 E.10355
G1 X135.9 Y129.999 E.23353
G1 X135.662 Y131.808 E.05608
G1 X138.606 Y132.196 E.09126
G1 X138.668 Y131.725 E.0146
G1 X138.896 Y131.755 E.00706
G1 X138.795 Y132.52 E.02371
G3 X138.576 Y132.676 I-.192 J-.037 E.0091
G1 X128.27 Y131.319 E.31942
G2 X127.732 Y131.319 I-.27 J2.786 E.01655
G1 X117.355 Y132.674 E.32159
G3 X117.205 Y132.522 I.041 J-.189 E.00693
G1 X117.104 Y131.755 E.02379
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.0146
G1 X120.338 Y131.808 E.09126
G1 X120.1 Y129.999 E.05608
G1 X127.635 Y129.007 E.23353
G1 X127.195 Y125.666 E.10355
G1 X119.66 Y126.658 E.23353
G1 X119.422 Y124.848 E.05608
G1 X116.478 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.213 Y124.986 E.02328
G3 X116.383 Y124.764 I.192 J-.029 E.00959
G1 X126.684 Y123.408 E.31925
G3 X128.264 Y123.327 I1.492 J13.714 E.04864
G3 X129.316 Y123.408 I-.305 J10.892 E.03244
G1 X139.617 Y124.764 E.31925
G3 X139.787 Y124.986 I-.024 J.195 E.00957
G1 X139.689 Y125.737 E.02327
G1 X139.46 Y125.707 E.00707
G1 X139.522 Y125.236 E.0146
G1 X136.578 Y124.848 E.09126
G1 X136.34 Y126.658 E.05608
G1 X128.864 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.568 Y127.651 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X128 Y128.157 F42000
G1 Z10.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51311
G1 F2455
M204 S6000
G1 X128 Y128.365 E.00796
; LINE_WIDTH: 0.474822
G1 X128 Y128.573 E.00731
; LINE_WIDTH: 0.436535
G1 X128 Y128.78 E.00667
; LINE_WIDTH: 0.398247
G1 X128 Y128.988 E.00602
; LINE_WIDTH: 0.357162
G1 X128.146 Y129.166 E.00589
; WIPE_START
G1 F11456.137
G1 X128 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128 Y127.035 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
; LINE_WIDTH: 0.12175
G1 F2455
M204 S6000
G1 X128 Y126.814 E.00142
; LINE_WIDTH: 0.171403
G1 X128 Y126.593 E.00231
; LINE_WIDTH: 0.221056
G1 X128 Y126.372 E.00321
; LINE_WIDTH: 0.270708
G1 X128 Y126.151 E.0041
; LINE_WIDTH: 0.320361
G1 X128 Y125.93 E.005
; LINE_WIDTH: 0.370014
G1 X128 Y125.709 E.00589
; LINE_WIDTH: 0.419667
G1 X128 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X128 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X128 Y125.046 E.00857
M204 S10000
G1 X134.784 Y125.706 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X133.17 Y125.494 E.05401
G1 X132.212 Y124.536 E.04493
G1 X131.551 Y124.449 E.0221
G1 X130.816 Y125.184 E.03448
G1 X128.608 Y124.893 E.07389
G1 X128.608 Y124.697 E.00649
G1 X127.392 Y124.697 E.04032
G1 X127.392 Y124.893 E.00649
G1 X125.184 Y125.184 E.07389
G1 X124.449 Y124.449 E.03448
G1 X123.788 Y124.536 E.0221
G1 X122.83 Y125.494 E.04493
G1 X121.216 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X122.83 Y125.494 E-.61876
G1 X123.093 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.585 Y124.585 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130828
G1 F2455
M204 S6000
G1 X116.413 Y125.002 E.02292
; WIPE_START
G1 F15000
G1 X118.395 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.11 Y130.612 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X122.724 Y130.4 E.05401
G1 X123.459 Y131.135 E.03448
G1 X125.078 Y130.922 E.05419
G1 X126.036 Y129.964 E.04493
G1 X128 Y129.705 E.06571
G1 X129.964 Y129.964 E.06571
G1 X130.922 Y130.922 E.04493
G1 X132.541 Y131.135 E.05419
G1 X133.276 Y130.4 E.03448
G1 X134.89 Y130.612 E.05401
; WIPE_START
G1 F8843.478
M73 P71 R5
G1 X133.276 Y130.4 E-.61876
G1 X133.013 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.436 Y132.02 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130848
G1 F2455
M204 S6000
G1 X138.608 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X136.625 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.538 Y125.122 Z10.6 F42000
G1 X139.587 Y125.002 Z10.6
G1 Z10.2
G1 E.8 F1800
; LINE_WIDTH: 0.130837
G1 F2455
M204 S6000
G1 X136.415 Y124.585 E.02292
; WIPE_START
G1 F15000
G1 X138.398 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.317 Y127.694 Z10.6 F42000
G1 X120.564 Y132.02 Z10.6
G1 Z10.2
G1 E.8 F1800
; LINE_WIDTH: 0.130853
G1 F2455
M204 S6000
G1 X117.392 Y132.438 E.02293
; CHANGE_LAYER
; Z_HEIGHT: 10.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X119.375 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 52/85
; update layer progress
M73 L52
M991 S0 P51 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z10.6 I.739 J.967 P1  F42000
G1 X128.467 Y125.226 Z10.6
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X128.107 Y127.961 E.09151
G1 X127.893 Y127.961 E.0071
G1 X127.533 Y125.226 E.09151
G1 X119.998 Y126.218 E.25211
G1 X119.799 Y124.71 E.05045
G1 X126.731 Y123.797 E.23192
G3 X128.261 Y123.719 I1.435 J13.147 E.05084
G3 X129.269 Y123.797 I-.304 J10.521 E.03356
G1 X136.201 Y124.71 E.23191
G1 X136.002 Y126.218 E.05045
G1 X128.527 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X128.223 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.631 Y129.534 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
G1 F2455
M204 S6000
G1 X128 Y129.354 E.04581
G1 X135.46 Y130.336 E.24959
G1 X135.261 Y131.844 E.05045
G1 X128.312 Y130.929 E.23252
G2 X127.683 Y130.93 I-.311 J3.662 E.02088
G1 X120.739 Y131.844 E.23235
G1 X120.54 Y130.336 E.05045
G1 X126.571 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X128 Y129.354 E-.54756
G1 X128.554 Y129.427 E-.21244
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.805 Y125.666 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2455
M204 S5000
G1 X128.365 Y129.007 E.10355
G1 X135.9 Y129.999 E.23353
G1 X135.662 Y131.808 E.05608
G1 X138.606 Y132.196 E.09126
G1 X138.668 Y131.725 E.0146
G1 X138.896 Y131.755 E.00706
G1 X138.782 Y132.564 E.02513
G3 X138.576 Y132.676 I-.178 J-.083 E.00769
G1 X128.268 Y131.319 E.31947
G2 X127.73 Y131.319 I-.268 J3.102 E.01656
G1 X117.424 Y132.676 E.3194
G1 X117.323 Y132.665 E.00314
G1 X117.239 Y132.601 E.00323
G3 X117.205 Y132.52 I.181 J-.125 E.00273
G1 X117.104 Y131.755 E.02371
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.0146
G1 X120.338 Y131.808 E.09126
G1 X120.1 Y129.999 E.05608
G1 X127.635 Y129.007 E.23353
G1 X127.195 Y125.666 E.10355
G1 X119.66 Y126.658 E.23353
G1 X119.422 Y124.848 E.05608
G1 X116.478 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.213 Y124.986 E.02326
G3 X116.383 Y124.764 I.195 J-.027 E.00957
G1 X126.684 Y123.408 E.31925
G3 X128.269 Y123.327 I1.49 J13.689 E.04881
G3 X129.316 Y123.408 I-.313 J10.915 E.03228
G1 X139.617 Y124.764 E.31925
G3 X139.787 Y124.986 I-.024 J.195 E.00956
G1 X139.689 Y125.737 E.02327
G1 X139.46 Y125.707 E.00707
G1 X139.522 Y125.236 E.0146
G1 X136.578 Y124.848 E.09126
G1 X136.34 Y126.658 E.05608
G1 X128.864 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.568 Y127.651 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X128 Y128.157 F42000
G1 Z10.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51311
G1 F2455
M204 S6000
G1 X128 Y128.365 E.00796
; LINE_WIDTH: 0.474823
G1 X128 Y128.573 E.00731
; LINE_WIDTH: 0.436536
G1 X128 Y128.78 E.00667
; LINE_WIDTH: 0.39825
G1 X128 Y128.988 E.00602
; LINE_WIDTH: 0.35712
G1 X128.146 Y129.166 E.00589
; WIPE_START
G1 F11457.67
G1 X128 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128 Y127.035 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
; LINE_WIDTH: 0.12175
G1 F2455
M204 S6000
G1 X128 Y126.814 E.00142
; LINE_WIDTH: 0.171403
G1 X128 Y126.593 E.00231
; LINE_WIDTH: 0.221056
G1 X128 Y126.372 E.00321
; LINE_WIDTH: 0.270708
G1 X128 Y126.151 E.0041
; LINE_WIDTH: 0.320361
G1 X128 Y125.93 E.005
; LINE_WIDTH: 0.370014
G1 X128 Y125.709 E.00589
; LINE_WIDTH: 0.419667
G1 X128 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X128 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X128 Y125.046 E.00857
M204 S10000
G1 X121.216 Y125.706 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X122.83 Y125.494 E.05401
G1 X123.788 Y124.536 E.04493
G1 X124.449 Y124.449 E.0221
G1 X125.184 Y125.184 E.03448
G1 X127.392 Y124.893 E.07389
G1 X127.392 Y124.697 E.00649
G1 X128.608 Y124.697 E.04032
G1 X128.608 Y124.893 E.00649
G1 X130.816 Y125.184 E.07389
G1 X131.551 Y124.449 E.03448
G1 X132.212 Y124.536 E.0221
G1 X133.17 Y125.494 E.04493
G1 X134.784 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X133.17 Y125.494 E-.61876
G1 X132.907 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.415 Y124.585 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130845
G1 F2455
M204 S6000
G1 X139.587 Y125.002 E.02293
; WIPE_START
G1 F15000
G1 X137.605 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.89 Y130.612 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X133.276 Y130.4 E.05401
G1 X132.541 Y131.135 E.03448
G1 X130.922 Y130.922 E.05419
G1 X129.964 Y129.964 E.04493
G1 X128 Y129.705 E.0657
G1 X126.036 Y129.964 E.06571
G1 X125.078 Y130.922 E.04493
G1 X123.459 Y131.135 E.05419
G1 X122.724 Y130.4 E.03448
G1 X121.11 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X122.724 Y130.4 E-.61876
G1 X122.987 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.564 Y132.02 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130852
G1 F2455
M204 S6000
G1 X117.392 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X119.375 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.462 Y125.122 Z10.8 F42000
G1 X116.413 Y125.002 Z10.8
G1 Z10.4
G1 E.8 F1800
; LINE_WIDTH: 0.130851
G1 F2455
M204 S6000
G1 X119.585 Y124.585 E.02293
; WIPE_START
G1 F15000
G1 X117.602 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.683 Y127.694 Z10.8 F42000
G1 X135.436 Y132.02 Z10.8
G1 Z10.4
G1 E.8 F1800
; LINE_WIDTH: 0.130847
G1 F2455
M204 S6000
G1 X138.608 Y132.438 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 10.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15000
G1 X136.625 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 53/85
; update layer progress
M73 L53
M991 S0 P52 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z10.8 I.789 J-.926 P1  F42000
G1 X128.467 Y125.226 Z10.8
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X128.107 Y127.961 E.09151
G1 X127.893 Y127.961 E.0071
G1 X127.533 Y125.226 E.09151
G1 X119.998 Y126.218 E.25211
G1 X119.799 Y124.71 E.05045
G1 X126.731 Y123.797 E.23192
G3 X128.266 Y123.72 I1.433 J13.12 E.05103
G3 X129.269 Y123.797 I-.312 J10.544 E.03338
M73 P72 R5
G1 X136.201 Y124.71 E.23191
G1 X136.002 Y126.218 E.05045
G1 X128.527 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X128.223 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.631 Y129.534 Z11 F42000
G1 Z10.6
G1 E.8 F1800
G1 F2455
M204 S6000
G1 X128 Y129.354 E.04581
G1 X135.46 Y130.336 E.24959
G1 X135.261 Y131.844 E.05045
G1 X128.317 Y130.93 E.23235
G2 X127.683 Y130.93 I-.317 J4.251 E.02103
G1 X120.739 Y131.844 E.23236
G1 X120.54 Y130.336 E.05045
G1 X126.571 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X128 Y129.354 E-.54754
G1 X128.554 Y129.427 E-.21246
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.805 Y125.666 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2455
M204 S5000
G1 X128.365 Y129.007 E.10355
G1 X135.9 Y129.999 E.23353
G1 X135.662 Y131.808 E.05608
G1 X138.606 Y132.196 E.09126
G1 X138.668 Y131.725 E.0146
G1 X138.896 Y131.755 E.00706
G1 X138.795 Y132.52 E.02371
G3 X138.576 Y132.676 I-.189 J-.034 E.00917
G1 X128.27 Y131.319 E.3194
G2 X127.73 Y131.319 I-.27 J3.667 E.01661
G1 X117.424 Y132.676 E.3194
G1 X117.31 Y132.66 E.00353
G3 X117.205 Y132.52 I.082 J-.172 E.00559
G1 X117.104 Y131.755 E.02371
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.0146
G1 X120.338 Y131.808 E.09126
G1 X120.1 Y129.999 E.05608
G1 X127.635 Y129.007 E.23353
G1 X127.195 Y125.666 E.10355
G1 X119.66 Y126.658 E.23353
G1 X119.422 Y124.848 E.05608
G1 X116.478 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.213 Y124.986 E.02326
G3 X116.383 Y124.764 I.192 J-.029 E.0096
G1 X126.684 Y123.408 E.31925
G3 X128.275 Y123.328 I1.487 J13.656 E.04898
G3 X129.316 Y123.408 I-.32 J10.934 E.03211
G1 X139.617 Y124.764 E.31924
G3 X139.787 Y124.986 I-.03 J.2 E.0095
G1 X139.689 Y125.737 E.02327
G1 X139.46 Y125.707 E.00707
G1 X139.522 Y125.236 E.0146
G1 X136.578 Y124.848 E.09126
G1 X136.34 Y126.658 E.05608
G1 X128.864 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.568 Y127.651 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X128 Y128.157 F42000
G1 Z10.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.513105
G1 F2455
M204 S6000
G1 X128 Y128.365 E.00796
; LINE_WIDTH: 0.474819
G1 X128 Y128.573 E.00731
; LINE_WIDTH: 0.436533
G1 X128 Y128.78 E.00667
; LINE_WIDTH: 0.398246
G1 X128 Y128.988 E.00602
; LINE_WIDTH: 0.357154
G1 X128.146 Y129.166 E.00589
; WIPE_START
G1 F11456.44
G1 X128 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128 Y127.035 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; LINE_WIDTH: 0.121749
G1 F2455
M204 S6000
G1 X128 Y126.814 E.00142
; LINE_WIDTH: 0.1714
G1 X128 Y126.593 E.00231
; LINE_WIDTH: 0.221051
G1 X128 Y126.372 E.00321
; LINE_WIDTH: 0.270703
G1 X128 Y126.151 E.0041
; LINE_WIDTH: 0.320354
G1 X128 Y125.93 E.005
; LINE_WIDTH: 0.370005
G1 X128 Y125.709 E.00589
; LINE_WIDTH: 0.419657
G1 X128 Y125.488 E.00679
; LINE_WIDTH: 0.469308
G1 X128 Y125.267 E.00768
; LINE_WIDTH: 0.518959
G1 X128 Y125.046 E.00857
M204 S10000
G1 X134.784 Y125.706 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X133.17 Y125.494 E.05401
G1 X132.212 Y124.536 E.04493
G1 X131.551 Y124.449 E.0221
G1 X130.816 Y125.184 E.03448
G1 X128.608 Y124.893 E.07389
G1 X128.608 Y124.697 E.00648
G1 X127.392 Y124.697 E.04032
G1 X127.392 Y124.893 E.00648
G1 X125.184 Y125.184 E.07389
G1 X124.449 Y124.449 E.03448
G1 X123.788 Y124.536 E.0221
G1 X122.83 Y125.494 E.04493
G1 X121.216 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X122.83 Y125.494 E-.61876
G1 X123.093 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.585 Y124.585 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130827
G1 F2455
M204 S6000
G1 X116.413 Y125.002 E.02292
; WIPE_START
G1 F15000
G1 X118.395 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.11 Y130.612 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X122.724 Y130.4 E.05401
G1 X123.459 Y131.135 E.03448
G1 X125.078 Y130.922 E.05419
G1 X126.036 Y129.964 E.04493
G1 X128 Y129.705 E.06571
G1 X129.964 Y129.964 E.06571
G1 X130.922 Y130.922 E.04493
G1 X132.541 Y131.135 E.05419
G1 X133.276 Y130.4 E.03448
G1 X134.89 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X133.276 Y130.4 E-.61876
G1 X133.013 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.436 Y132.02 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.13084
G1 F2455
M204 S6000
G1 X138.608 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X136.625 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.538 Y125.122 Z11 F42000
G1 X139.587 Y125.002 Z11
G1 Z10.6
G1 E.8 F1800
; LINE_WIDTH: 0.130837
G1 F2455
M204 S6000
G1 X136.415 Y124.585 E.02292
; WIPE_START
G1 F15000
G1 X138.398 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.317 Y127.694 Z11 F42000
G1 X120.564 Y132.02 Z11
G1 Z10.6
G1 E.8 F1800
; LINE_WIDTH: 0.130852
G1 F2455
M204 S6000
G1 X117.392 Y132.438 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 10.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X119.375 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 54/85
; update layer progress
M73 L54
M991 S0 P53 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z11 I.739 J.967 P1  F42000
G1 X128.467 Y125.226 Z11
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X128.107 Y127.961 E.09151
G1 X127.893 Y127.961 E.0071
G1 X127.533 Y125.226 E.09151
G1 X119.998 Y126.218 E.25211
G1 X119.799 Y124.71 E.05045
G1 X126.731 Y123.797 E.23192
G3 X128.272 Y123.72 I1.432 J13.098 E.05121
G3 X129.269 Y123.797 I-.321 J10.579 E.0332
G1 X136.201 Y124.71 E.23191
G1 X136.002 Y126.218 E.05045
G1 X128.527 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X128.223 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.631 Y129.534 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
G1 F2455
M204 S6000
G1 X128 Y129.354 E.04581
G1 X135.46 Y130.336 E.24959
G1 X135.261 Y131.844 E.05045
G1 X128.312 Y130.929 E.23253
G2 X127.69 Y130.929 I-.312 J2.99 E.02067
G1 X120.739 Y131.844 E.23257
G1 X120.54 Y130.336 E.05045
G1 X126.571 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X128 Y129.354 E-.54755
M73 P73 R5
G1 X128.554 Y129.427 E-.21245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.805 Y125.666 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2455
M204 S5000
G1 X128.365 Y129.007 E.10355
G1 X135.9 Y129.999 E.23353
G1 X135.662 Y131.808 E.05608
G1 X138.606 Y132.196 E.09126
G1 X138.668 Y131.725 E.0146
G1 X138.896 Y131.755 E.00706
G1 X138.791 Y132.538 E.02428
G3 X138.576 Y132.676 I-.185 J-.051 E.0086
G1 X128.268 Y131.319 E.31945
G2 X127.732 Y131.319 I-.268 J2.5 E.0165
G1 X117.396 Y132.678 E.32035
G3 X117.205 Y132.52 I-.002 J-.192 E.00828
G1 X117.104 Y131.755 E.02371
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.0146
G1 X120.338 Y131.808 E.09126
G1 X120.1 Y129.999 E.05608
G1 X127.635 Y129.007 E.23353
G1 X127.195 Y125.666 E.10355
G1 X119.66 Y126.658 E.23353
G1 X119.422 Y124.848 E.05608
G1 X116.478 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.213 Y124.986 E.02327
G3 X116.383 Y124.764 I.192 J-.029 E.00958
G1 X126.684 Y123.408 E.31926
G3 X128.28 Y123.328 I1.486 J13.634 E.04915
G3 X129.316 Y123.408 I-.329 J10.966 E.03193
G1 X139.617 Y124.764 E.31926
G3 X139.787 Y124.986 I-.025 J.195 E.00956
G1 X139.689 Y125.737 E.02327
G1 X139.46 Y125.707 E.00707
G1 X139.522 Y125.236 E.0146
G1 X136.578 Y124.848 E.09126
G1 X136.34 Y126.658 E.05608
G1 X128.864 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.568 Y127.651 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X128 Y128.157 F42000
G1 Z10.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51311
G1 F2455
M204 S6000
G1 X128 Y128.365 E.00796
; LINE_WIDTH: 0.474822
G1 X128 Y128.573 E.00731
; LINE_WIDTH: 0.436535
G1 X128 Y128.78 E.00667
; LINE_WIDTH: 0.398247
G1 X128 Y128.988 E.00602
; LINE_WIDTH: 0.357162
G1 X128.146 Y129.166 E.00589
; WIPE_START
G1 F11456.137
G1 X128 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128 Y127.035 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
; LINE_WIDTH: 0.12175
G1 F2455
M204 S6000
G1 X128 Y126.814 E.00142
; LINE_WIDTH: 0.171403
G1 X128 Y126.593 E.00231
; LINE_WIDTH: 0.221056
G1 X128 Y126.372 E.00321
; LINE_WIDTH: 0.270708
G1 X128 Y126.151 E.0041
; LINE_WIDTH: 0.320361
G1 X128 Y125.93 E.005
; LINE_WIDTH: 0.370014
G1 X128 Y125.709 E.00589
; LINE_WIDTH: 0.419667
G1 X128 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X128 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X128 Y125.046 E.00857
M204 S10000
G1 X121.216 Y125.706 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X122.83 Y125.494 E.05401
G1 X123.788 Y124.536 E.04493
G1 X124.449 Y124.449 E.0221
G1 X125.184 Y125.184 E.03448
G1 X127.392 Y124.893 E.07389
G1 X127.392 Y124.697 E.00649
G1 X128.608 Y124.697 E.04032
G1 X128.608 Y124.893 E.00649
G1 X130.816 Y125.184 E.07389
G1 X131.551 Y124.449 E.03448
G1 X132.212 Y124.536 E.0221
G1 X133.17 Y125.494 E.04493
G1 X134.784 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X133.17 Y125.494 E-.61876
G1 X132.907 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.415 Y124.585 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130844
G1 F2455
M204 S6000
G1 X139.587 Y125.002 E.02293
; WIPE_START
G1 F15000
G1 X137.605 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.89 Y130.612 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X133.276 Y130.4 E.05401
G1 X132.541 Y131.135 E.03448
G1 X130.922 Y130.922 E.05419
G1 X129.964 Y129.964 E.04493
G1 X128 Y129.705 E.06571
G1 X126.036 Y129.964 E.06571
G1 X125.078 Y130.922 E.04493
G1 X123.459 Y131.135 E.05419
G1 X122.724 Y130.4 E.03448
G1 X121.11 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X122.724 Y130.4 E-.61876
G1 X122.987 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.564 Y132.02 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130852
G1 F2455
M204 S6000
G1 X117.392 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X119.375 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.462 Y125.122 Z11.2 F42000
G1 X116.413 Y125.002 Z11.2
G1 Z10.8
G1 E.8 F1800
; LINE_WIDTH: 0.130851
G1 F2455
M204 S6000
G1 X119.585 Y124.585 E.02293
; WIPE_START
G1 F15000
G1 X117.602 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.683 Y127.694 Z11.2 F42000
G1 X135.436 Y132.02 Z11.2
G1 Z10.8
G1 E.8 F1800
; LINE_WIDTH: 0.130847
G1 F2455
M204 S6000
G1 X138.608 Y132.438 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 11
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X136.625 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 55/85
; update layer progress
M73 L55
M991 S0 P54 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z11.2 I.789 J-.926 P1  F42000
G1 X128.467 Y125.226 Z11.2
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X128.107 Y127.961 E.09151
G1 X127.893 Y127.961 E.0071
G1 X127.533 Y125.226 E.09151
G1 X119.998 Y126.218 E.25211
G1 X119.799 Y124.71 E.05045
G1 X126.731 Y123.797 E.23192
G3 X128.277 Y123.72 I1.429 J13.069 E.05139
G3 X129.269 Y123.797 I-.328 J10.598 E.03301
G1 X136.201 Y124.71 E.23191
G1 X136.002 Y126.218 E.05045
G1 X128.527 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X128.223 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.631 Y129.534 Z11.4 F42000
G1 Z11
G1 E.8 F1800
G1 F2455
M204 S6000
G1 X128 Y129.354 E.04581
G1 X135.46 Y130.336 E.24959
G1 X135.261 Y131.844 E.05045
G1 X128.312 Y130.929 E.23253
G2 X127.69 Y130.929 I-.312 J2.984 E.02066
G1 X120.739 Y131.844 E.23257
G1 X120.54 Y130.336 E.05045
G1 X126.571 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X128 Y129.354 E-.54756
G1 X128.554 Y129.427 E-.21244
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.805 Y125.666 Z11.4 F42000
G1 Z11
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2455
M204 S5000
G1 X128.365 Y129.007 E.10355
G1 X135.9 Y129.999 E.23353
G1 X135.662 Y131.808 E.05608
G1 X138.606 Y132.196 E.09126
G1 X138.668 Y131.725 E.0146
G1 X138.896 Y131.755 E.00706
G1 X138.791 Y132.538 E.02428
G3 X138.576 Y132.676 I-.184 J-.051 E.00859
G1 X128.268 Y131.319 E.31947
G2 X127.732 Y131.319 I-.268 J2.493 E.0165
G1 X117.423 Y132.676 E.31951
G1 X117.355 Y132.674 E.0021
G1 X117.271 Y132.635 E.00284
G3 X117.205 Y132.52 I.132 J-.153 E.00414
G1 X117.104 Y131.755 E.02373
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.0146
G1 X120.338 Y131.808 E.09126
G1 X120.1 Y129.999 E.05608
G1 X127.635 Y129.007 E.23353
G1 X127.195 Y125.666 E.10355
G1 X119.66 Y126.658 E.23353
G1 X119.422 Y124.848 E.05608
G1 X116.478 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.211 Y124.934 E.02486
G3 X116.383 Y124.764 I.201 J.031 E.00793
G1 X126.684 Y123.408 E.31925
G3 X128.286 Y123.328 I1.484 J13.61 E.04932
G3 X129.316 Y123.408 I-.336 J10.982 E.03176
G1 X139.617 Y124.764 E.31926
G3 X139.787 Y124.986 I-.025 J.195 E.00956
G1 X139.689 Y125.737 E.02326
G1 X139.46 Y125.707 E.00707
G1 X139.522 Y125.236 E.0146
G1 X136.578 Y124.848 E.09126
G1 X136.34 Y126.658 E.05608
G1 X128.864 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.568 Y127.651 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X128 Y128.157 F42000
G1 Z11
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51311
G1 F2455
M204 S6000
G1 X128 Y128.365 E.00796
; LINE_WIDTH: 0.474823
G1 X128 Y128.573 E.00731
; LINE_WIDTH: 0.436536
G1 X128 Y128.78 E.00667
; LINE_WIDTH: 0.39825
G1 X128 Y128.988 E.00602
; LINE_WIDTH: 0.35712
G1 X128.146 Y129.166 E.00589
; WIPE_START
G1 F11457.67
G1 X128 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128 Y127.035 Z11.4 F42000
G1 Z11
G1 E.8 F1800
; LINE_WIDTH: 0.12175
G1 F2455
M204 S6000
G1 X128 Y126.814 E.00142
; LINE_WIDTH: 0.171403
G1 X128 Y126.593 E.00231
; LINE_WIDTH: 0.221056
G1 X128 Y126.372 E.00321
; LINE_WIDTH: 0.270708
G1 X128 Y126.151 E.0041
; LINE_WIDTH: 0.320361
G1 X128 Y125.93 E.005
; LINE_WIDTH: 0.370014
G1 X128 Y125.709 E.00589
; LINE_WIDTH: 0.419667
G1 X128 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X128 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X128 Y125.046 E.00857
M204 S10000
G1 X134.784 Y125.706 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X133.17 Y125.494 E.05401
G1 X132.212 Y124.536 E.04493
G1 X131.551 Y124.449 E.0221
G1 X130.816 Y125.184 E.03448
G1 X128.608 Y124.893 E.07389
G1 X128.608 Y124.697 E.00649
G1 X127.392 Y124.697 E.04032
G1 X127.392 Y124.893 E.00649
G1 X125.184 Y125.184 E.07389
G1 X124.449 Y124.449 E.03448
G1 X123.788 Y124.536 E.0221
G1 X122.83 Y125.494 E.04493
G1 X121.216 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X122.83 Y125.494 E-.61876
G1 X123.093 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.585 Y124.585 Z11.4 F42000
M73 P74 R5
G1 Z11
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130863
G1 F2455
M204 S6000
G1 X116.413 Y125.002 E.02293
; WIPE_START
G1 F15000
G1 X118.395 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.11 Y130.612 Z11.4 F42000
G1 Z11
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X122.724 Y130.4 E.05401
G1 X123.459 Y131.135 E.03448
G1 X125.078 Y130.922 E.05419
G1 X126.036 Y129.964 E.04493
G1 X128 Y129.705 E.06571
G1 X129.964 Y129.964 E.0657
G1 X130.922 Y130.922 E.04493
G1 X132.541 Y131.135 E.05419
G1 X133.276 Y130.4 E.03448
G1 X134.89 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X133.276 Y130.4 E-.61876
G1 X133.013 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.436 Y132.02 Z11.4 F42000
G1 Z11
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130849
G1 F2455
M204 S6000
G1 X138.608 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X136.625 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.538 Y125.122 Z11.4 F42000
G1 X139.587 Y125.002 Z11.4
G1 Z11
G1 E.8 F1800
; LINE_WIDTH: 0.130835
G1 F2455
M204 S6000
G1 X136.415 Y124.585 E.02292
; WIPE_START
G1 F15000
G1 X138.398 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.317 Y127.694 Z11.4 F42000
G1 X120.564 Y132.02 Z11.4
G1 Z11
G1 E.8 F1800
; LINE_WIDTH: 0.130864
G1 F2455
M204 S6000
G1 X117.392 Y132.438 E.02293
; CHANGE_LAYER
; Z_HEIGHT: 11.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X119.375 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 56/85
; update layer progress
M73 L56
M991 S0 P55 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z11.4 I.739 J.967 P1  F42000
G1 X128.467 Y125.226 Z11.4
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2468
M204 S6000
G1 X128.107 Y127.961 E.09151
G1 X127.893 Y127.961 E.0071
G1 X127.533 Y125.226 E.09151
G1 X119.998 Y126.218 E.25211
G1 X119.799 Y124.71 E.05045
G1 X126.731 Y123.797 E.23191
G3 X128.283 Y123.72 I1.427 J13.041 E.05158
G3 X129.269 Y123.797 I-.336 J10.625 E.03283
G1 X136.201 Y124.71 E.23191
G1 X136.002 Y126.218 E.05045
G1 X128.527 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X128.223 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.631 Y129.534 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
G1 F2468
M204 S6000
G1 X128 Y129.354 E.04581
G1 X135.46 Y130.336 E.24959
G1 X135.261 Y131.844 E.05045
G1 X128.31 Y130.929 E.23257
G2 X127.683 Y130.93 I-.309 J3.31 E.02082
G1 X120.739 Y131.844 E.23236
G1 X120.54 Y130.336 E.05045
G1 X126.571 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X128 Y129.354 E-.54755
G1 X128.554 Y129.427 E-.21245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.805 Y125.666 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2468
M204 S5000
G1 X128.365 Y129.007 E.10355
G1 X135.9 Y129.999 E.23353
G1 X135.662 Y131.808 E.05608
G1 X138.606 Y132.196 E.09126
G1 X138.668 Y131.725 E.0146
G1 X138.896 Y131.755 E.00706
G1 X138.79 Y132.543 E.02443
G3 X138.576 Y132.676 I-.183 J-.055 E.00844
G1 X128.268 Y131.319 E.31949
G2 X127.73 Y131.319 I-.267 J2.784 E.01655
G1 X117.424 Y132.676 E.3194
G1 X117.326 Y132.666 E.00303
G1 X117.25 Y132.614 E.00282
G3 X117.205 Y132.52 I.181 J-.145 E.00326
G1 X117.104 Y131.755 E.02371
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.0146
G1 X120.338 Y131.808 E.09126
G1 X120.1 Y129.999 E.05608
G1 X127.635 Y129.007 E.23353
G1 X127.195 Y125.666 E.10355
G1 X119.66 Y126.658 E.23353
G1 X119.422 Y124.848 E.05608
G1 X116.478 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.213 Y124.986 E.02327
G3 X116.383 Y124.764 I.195 J-.027 E.00956
G1 X126.684 Y123.408 E.31925
G3 X128.291 Y123.328 I1.482 J13.581 E.04949
G3 X129.316 Y123.408 I-.344 J11.007 E.0316
G1 X139.617 Y124.764 E.31926
G3 X139.787 Y124.986 I-.025 J.195 E.00956
G1 X139.689 Y125.737 E.02327
G1 X139.46 Y125.707 E.00707
G1 X139.522 Y125.236 E.0146
G1 X136.578 Y124.848 E.09126
G1 X136.34 Y126.658 E.05608
G1 X128.864 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.568 Y127.651 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X128 Y128.157 F42000
G1 Z11.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51311
G1 F2468
M204 S6000
G1 X128 Y128.365 E.00796
; LINE_WIDTH: 0.474822
G1 X128 Y128.573 E.00731
; LINE_WIDTH: 0.436535
G1 X128 Y128.78 E.00667
; LINE_WIDTH: 0.398247
G1 X128 Y128.988 E.00602
; LINE_WIDTH: 0.357162
G1 X128.146 Y129.166 E.00589
; WIPE_START
G1 F11456.137
G1 X128 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128 Y127.035 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; LINE_WIDTH: 0.12175
G1 F2468
M204 S6000
G1 X128 Y126.814 E.00142
; LINE_WIDTH: 0.171403
G1 X128 Y126.593 E.00231
; LINE_WIDTH: 0.221056
G1 X128 Y126.372 E.00321
; LINE_WIDTH: 0.270708
G1 X128 Y126.151 E.0041
; LINE_WIDTH: 0.320361
G1 X128 Y125.93 E.005
; LINE_WIDTH: 0.370014
G1 X128 Y125.709 E.00589
; LINE_WIDTH: 0.419667
G1 X128 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X128 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X128 Y125.046 E.00857
; WIPE_START
G1 F7562.194
G1 X128 Y125.267 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.37 Y125.093 Z11.6 F42000
G1 X116.413 Y125.002 Z11.6
G1 Z11.2
G1 E.8 F1800
; LINE_WIDTH: 0.130839
G1 F2468
M204 S6000
G1 X119.585 Y124.585 E.02292
; WIPE_START
G1 F15000
G1 X117.602 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.216 Y125.706 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2468
M204 S6000
G1 X122.83 Y125.494 E.05401
G1 X123.788 Y124.536 E.04493
G1 X124.449 Y124.449 E.0221
G1 X125.184 Y125.184 E.03448
G1 X127.392 Y124.893 E.07389
G1 X127.392 Y124.697 E.00649
G1 X128.608 Y124.697 E.04032
G1 X128.608 Y124.893 E.00649
G1 X130.816 Y125.184 E.07389
G1 X131.551 Y124.449 E.03448
G1 X132.212 Y124.536 E.0221
G1 X133.17 Y125.494 E.04493
G1 X134.784 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X133.17 Y125.494 E-.61876
G1 X132.907 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.415 Y124.585 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130835
G1 F2468
M204 S6000
G1 X139.587 Y125.002 E.02292
; WIPE_START
G1 F15000
G1 X137.605 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.591 Y132.31 Z11.6 F42000
G1 X138.608 Y132.438 Z11.6
G1 Z11.2
G1 E.8 F1800
; LINE_WIDTH: 0.13084
G1 F2468
M204 S6000
G1 X135.436 Y132.02 E.02292
; WIPE_START
G1 F15000
G1 X137.419 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.89 Y130.612 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2468
M204 S6000
G1 X133.276 Y130.4 E.05401
G1 X132.541 Y131.135 E.03448
G1 X130.922 Y130.922 E.05419
G1 X129.964 Y129.964 E.04493
G1 X128 Y129.705 E.06571
G1 X126.036 Y129.964 E.06571
G1 X125.078 Y130.922 E.04493
G1 X123.459 Y131.135 E.05419
G1 X122.724 Y130.4 E.03448
G1 X121.11 Y130.612 E.05401
; WIPE_START
M73 P75 R5
G1 F8843.478
G1 X122.724 Y130.4 E-.61876
G1 X122.987 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.564 Y132.02 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130852
G1 F2468
M204 S6000
G1 X117.392 Y132.438 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 11.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X119.375 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 57/85
; update layer progress
M73 L57
M991 S0 P56 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z11.6 I.739 J.967 P1  F42000
G1 X128.467 Y125.226 Z11.6
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X128.107 Y127.961 E.09151
G1 X127.893 Y127.961 E.0071
G1 X127.533 Y125.226 E.09151
G1 X119.998 Y126.218 E.25211
G1 X119.799 Y124.71 E.05045
G1 X126.731 Y123.797 E.23192
G3 X128.288 Y123.72 I1.426 J13.026 E.05176
G3 X129.269 Y123.797 I-.346 J10.669 E.03264
G1 X136.201 Y124.71 E.23192
G1 X136.002 Y126.218 E.05045
G1 X128.527 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X128.223 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.631 Y129.534 Z11.8 F42000
G1 Z11.4
G1 E.8 F1800
G1 F2455
M204 S6000
G1 X128 Y129.354 E.04581
G1 X135.46 Y130.336 E.24959
G1 X135.261 Y131.844 E.05045
G1 X128.312 Y130.929 E.23253
G2 X127.683 Y130.93 I-.31 J3.606 E.02087
G1 X120.739 Y131.844 E.23235
G1 X120.54 Y130.336 E.05045
G1 X126.571 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X128 Y129.354 E-.54755
G1 X128.554 Y129.427 E-.21245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.805 Y125.666 Z11.8 F42000
G1 Z11.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2455
M204 S5000
G1 X128.365 Y129.007 E.10355
G1 X135.9 Y129.999 E.23353
G1 X135.662 Y131.808 E.05608
G1 X138.606 Y132.196 E.09126
G1 X138.668 Y131.725 E.0146
G1 X138.896 Y131.755 E.00706
G1 X138.795 Y132.52 E.02371
G3 X138.576 Y132.676 I-.189 J-.034 E.00916
G1 X128.268 Y131.319 E.31945
G2 X127.73 Y131.319 I-.268 J3.052 E.01656
G1 X117.354 Y132.674 E.32152
G3 X117.205 Y132.52 I.039 J-.187 E.00702
G1 X117.104 Y131.755 E.02371
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.0146
G1 X120.338 Y131.808 E.09126
G1 X120.1 Y129.999 E.05608
G1 X127.635 Y129.007 E.23353
G1 X127.195 Y125.666 E.10355
G1 X119.66 Y126.658 E.23353
G1 X119.422 Y124.848 E.05608
G1 X116.478 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.213 Y124.986 E.02327
G3 X116.383 Y124.764 I.192 J-.029 E.00958
G1 X126.684 Y123.408 E.31926
G3 X128.297 Y123.328 I1.48 J13.566 E.04966
G3 X129.316 Y123.408 I-.353 J11.05 E.03142
G1 X139.617 Y124.764 E.31926
G3 X139.787 Y124.986 I-.022 J.193 E.00959
G1 X139.689 Y125.737 E.02327
G1 X139.46 Y125.707 E.00707
G1 X139.522 Y125.236 E.0146
G1 X136.578 Y124.848 E.09126
G1 X136.34 Y126.658 E.05608
G1 X128.864 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.568 Y127.651 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X128 Y128.157 F42000
G1 Z11.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51311
G1 F2455
M204 S6000
G1 X128 Y128.365 E.00796
; LINE_WIDTH: 0.474822
G1 X128 Y128.573 E.00731
; LINE_WIDTH: 0.436535
G1 X128 Y128.78 E.00667
; LINE_WIDTH: 0.398247
G1 X128 Y128.988 E.00602
; LINE_WIDTH: 0.357162
G1 X128.146 Y129.166 E.00589
; WIPE_START
G1 F11456.137
G1 X128 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128 Y127.035 Z11.8 F42000
G1 Z11.4
G1 E.8 F1800
; LINE_WIDTH: 0.12175
G1 F2455
M204 S6000
G1 X128 Y126.814 E.00142
; LINE_WIDTH: 0.171403
G1 X128 Y126.593 E.00231
; LINE_WIDTH: 0.221056
G1 X128 Y126.372 E.00321
; LINE_WIDTH: 0.270708
G1 X128 Y126.151 E.0041
; LINE_WIDTH: 0.320361
G1 X128 Y125.93 E.005
; LINE_WIDTH: 0.370014
G1 X128 Y125.709 E.00589
; LINE_WIDTH: 0.419667
G1 X128 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X128 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X128 Y125.046 E.00857
M204 S10000
G1 X134.784 Y125.706 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X133.17 Y125.494 E.05401
G1 X132.212 Y124.536 E.04493
G1 X131.551 Y124.449 E.0221
G1 X130.816 Y125.184 E.03448
G1 X128.608 Y124.893 E.07389
G1 X128.608 Y124.697 E.00649
G1 X127.392 Y124.697 E.04032
G1 X127.392 Y124.893 E.00649
G1 X125.184 Y125.184 E.07389
G1 X124.449 Y124.449 E.03448
G1 X123.788 Y124.536 E.0221
G1 X122.83 Y125.494 E.04493
G1 X121.216 Y125.706 E.05401
; WIPE_START
M73 P75 R4
G1 F8843.478
G1 X122.83 Y125.494 E-.61876
G1 X123.093 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.585 Y124.585 Z11.8 F42000
G1 Z11.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130849
G1 F2455
M204 S6000
G1 X116.413 Y125.002 E.02293
; WIPE_START
G1 F15000
G1 X118.395 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.11 Y130.612 Z11.8 F42000
G1 Z11.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X122.724 Y130.4 E.05401
G1 X123.459 Y131.135 E.03448
G1 X125.078 Y130.922 E.05419
G1 X126.036 Y129.964 E.04493
G1 X128 Y129.705 E.06571
G1 X129.964 Y129.964 E.06571
G1 X130.922 Y130.922 E.04493
G1 X132.541 Y131.135 E.05419
G1 X133.276 Y130.4 E.03448
G1 X134.89 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X133.276 Y130.4 E-.61876
G1 X133.013 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.436 Y132.02 Z11.8 F42000
G1 Z11.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130839
G1 F2455
M204 S6000
G1 X138.608 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X136.625 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.538 Y125.122 Z11.8 F42000
G1 X139.587 Y125.002 Z11.8
G1 Z11.4
G1 E.8 F1800
; LINE_WIDTH: 0.130844
G1 F2455
M204 S6000
G1 X136.415 Y124.585 E.02293
; WIPE_START
G1 F15000
G1 X138.398 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.317 Y127.694 Z11.8 F42000
G1 X120.564 Y132.02 Z11.8
G1 Z11.4
G1 E.8 F1800
; LINE_WIDTH: 0.130864
G1 F2455
M204 S6000
G1 X117.392 Y132.438 E.02293
; CHANGE_LAYER
; Z_HEIGHT: 11.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15000
G1 X119.375 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 58/85
; update layer progress
M73 L58
M991 S0 P57 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z11.8 I.739 J.967 P1  F42000
G1 X128.467 Y125.226 Z11.8
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2468
M204 S6000
G1 X128.107 Y127.961 E.09151
G1 X127.893 Y127.961 E.0071
G1 X127.533 Y125.226 E.09151
G1 X119.998 Y126.218 E.25211
G1 X119.799 Y124.71 E.05045
G1 X126.731 Y123.797 E.23192
G3 X128.294 Y123.72 I1.425 J13.007 E.05194
G3 X129.269 Y123.797 I-.356 J10.711 E.03246
G1 X136.201 Y124.71 E.23192
G1 X136.002 Y126.218 E.05045
G1 X128.527 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X128.223 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.631 Y129.534 Z12 F42000
G1 Z11.6
G1 E.8 F1800
G1 F2468
M204 S6000
G1 X128 Y129.354 E.04581
G1 X135.46 Y130.336 E.24959
G1 X135.261 Y131.844 E.05045
G1 X128.31 Y130.929 E.23257
G2 X127.69 Y130.929 I-.31 J2.803 E.02063
G1 X120.739 Y131.844 E.23257
G1 X120.54 Y130.336 E.05045
G1 X126.571 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X128 Y129.354 E-.54756
G1 X128.554 Y129.427 E-.21244
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.805 Y125.666 Z12 F42000
M73 P76 R4
G1 Z11.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2468
M204 S5000
G1 X128.365 Y129.007 E.10355
G1 X135.9 Y129.999 E.23353
G1 X135.662 Y131.808 E.05608
G1 X138.606 Y132.196 E.09126
G1 X138.668 Y131.725 E.0146
G1 X138.896 Y131.755 E.00706
G1 X138.795 Y132.52 E.02371
G3 X138.576 Y132.676 I-.193 J-.039 E.00911
G1 X128.268 Y131.319 E.31947
G2 X127.732 Y131.319 I-.268 J2.339 E.01649
G1 X117.423 Y132.676 E.31952
G1 X117.31 Y132.66 E.00349
G3 X117.205 Y132.52 I.086 J-.174 E.00558
G1 X117.104 Y131.755 E.02371
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.0146
G1 X120.338 Y131.808 E.09126
G1 X120.1 Y129.999 E.05608
G1 X127.635 Y129.007 E.23353
G1 X127.195 Y125.666 E.10355
G1 X119.66 Y126.658 E.23353
G1 X119.422 Y124.848 E.05608
G1 X116.478 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.211 Y124.934 E.02486
G3 X116.383 Y124.764 I.201 J.031 E.00793
G1 X126.684 Y123.408 E.31925
G3 X128.303 Y123.328 I1.479 J13.546 E.04983
G3 X129.316 Y123.408 I-.363 J11.089 E.03125
G1 X139.617 Y124.764 E.31926
G3 X139.787 Y124.986 I-.031 J.2 E.00949
G1 X139.689 Y125.737 E.02327
G1 X139.46 Y125.707 E.00707
G1 X139.522 Y125.236 E.0146
G1 X136.578 Y124.848 E.09126
G1 X136.34 Y126.658 E.05608
G1 X128.864 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.568 Y127.651 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X128 Y128.157 F42000
G1 Z11.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51311
G1 F2468
M204 S6000
G1 X128 Y128.365 E.00796
; LINE_WIDTH: 0.474823
G1 X128 Y128.573 E.00731
; LINE_WIDTH: 0.436536
G1 X128 Y128.78 E.00667
; LINE_WIDTH: 0.39825
G1 X128 Y128.988 E.00602
; LINE_WIDTH: 0.35712
G1 X128.146 Y129.166 E.00589
; WIPE_START
G1 F11457.67
G1 X128 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128 Y127.035 Z12 F42000
G1 Z11.6
G1 E.8 F1800
; LINE_WIDTH: 0.12175
G1 F2468
M204 S6000
G1 X128 Y126.814 E.00142
; LINE_WIDTH: 0.171403
G1 X128 Y126.593 E.00231
; LINE_WIDTH: 0.221056
G1 X128 Y126.372 E.00321
; LINE_WIDTH: 0.270708
G1 X128 Y126.151 E.0041
; LINE_WIDTH: 0.320361
G1 X128 Y125.93 E.005
; LINE_WIDTH: 0.370014
G1 X128 Y125.709 E.00589
; LINE_WIDTH: 0.419667
G1 X128 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X128 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X128 Y125.046 E.00857
; WIPE_START
G1 F7562.194
G1 X128 Y125.267 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.37 Y125.093 Z12 F42000
G1 X116.413 Y125.002 Z12
G1 Z11.6
G1 E.8 F1800
; LINE_WIDTH: 0.130851
G1 F2468
M204 S6000
G1 X119.585 Y124.585 E.02293
; WIPE_START
G1 F15000
G1 X117.602 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.216 Y125.706 Z12 F42000
G1 Z11.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2468
M204 S6000
G1 X122.83 Y125.494 E.05401
G1 X123.788 Y124.536 E.04493
G1 X124.449 Y124.449 E.0221
G1 X125.184 Y125.184 E.03448
G1 X127.392 Y124.893 E.07389
G1 X127.392 Y124.697 E.00649
G1 X128.608 Y124.697 E.04032
G1 X128.608 Y124.893 E.00649
G1 X130.816 Y125.184 E.07389
G1 X131.551 Y124.449 E.03448
G1 X132.212 Y124.536 E.0221
G1 X133.17 Y125.494 E.04493
G1 X134.784 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X133.17 Y125.494 E-.61876
G1 X132.907 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.415 Y124.585 Z12 F42000
G1 Z11.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130835
G1 F2468
M204 S6000
G1 X139.587 Y125.002 E.02292
; WIPE_START
G1 F15000
G1 X137.605 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.591 Y132.31 Z12 F42000
G1 X138.608 Y132.438 Z12
G1 Z11.6
G1 E.8 F1800
; LINE_WIDTH: 0.130848
G1 F2468
M204 S6000
G1 X135.436 Y132.02 E.02292
; WIPE_START
G1 F15000
G1 X137.419 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.89 Y130.612 Z12 F42000
G1 Z11.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2468
M204 S6000
G1 X133.276 Y130.4 E.05401
G1 X132.541 Y131.135 E.03448
G1 X130.922 Y130.922 E.05419
G1 X129.964 Y129.964 E.04493
G1 X128 Y129.705 E.0657
G1 X126.036 Y129.964 E.06571
G1 X125.078 Y130.922 E.04493
G1 X123.459 Y131.135 E.05419
G1 X122.724 Y130.4 E.03448
G1 X121.11 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X122.724 Y130.4 E-.61876
G1 X122.987 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.564 Y132.02 Z12 F42000
G1 Z11.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130852
G1 F2468
M204 S6000
G1 X117.392 Y132.438 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 11.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X119.375 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 59/85
; update layer progress
M73 L59
M991 S0 P58 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z12 I.739 J.967 P1  F42000
G1 X128.467 Y125.226 Z12
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X128.107 Y127.961 E.09151
G1 X127.893 Y127.961 E.0071
G1 X127.533 Y125.226 E.09151
G1 X119.998 Y126.218 E.25211
G1 X119.799 Y124.71 E.05045
G1 X126.731 Y123.797 E.23192
G3 X128.3 Y123.72 I1.423 J12.989 E.05213
G3 X129.269 Y123.797 I-.365 J10.747 E.03228
G1 X136.201 Y124.71 E.23191
G1 X136.002 Y126.218 E.05045
G1 X128.527 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X128.223 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.631 Y129.534 Z12.2 F42000
G1 Z11.8
G1 E.8 F1800
G1 F2455
M204 S6000
G1 X128 Y129.354 E.04581
G1 X135.46 Y130.336 E.24959
G1 X135.261 Y131.844 E.05045
G1 X128.311 Y130.929 E.23254
G2 X127.689 Y130.929 I-.311 J3.151 E.02069
G1 X120.739 Y131.844 E.23253
G1 X120.54 Y130.336 E.05045
G1 X126.571 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X128 Y129.354 E-.54755
G1 X128.554 Y129.427 E-.21245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.805 Y125.666 Z12.2 F42000
G1 Z11.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2455
M204 S5000
G1 X128.365 Y129.007 E.10355
G1 X135.9 Y129.999 E.23353
G1 X135.662 Y131.808 E.05608
G1 X138.606 Y132.196 E.09126
G1 X138.668 Y131.725 E.0146
G1 X138.896 Y131.755 E.00706
G1 X138.795 Y132.52 E.02371
G3 X138.576 Y132.676 I-.191 J-.037 E.00911
G1 X128.268 Y131.319 E.31947
G2 X127.732 Y131.319 I-.268 J2.634 E.0165
G1 X117.423 Y132.676 E.3195
G1 X117.354 Y132.674 E.0021
G1 X117.271 Y132.635 E.00283
G3 X117.205 Y132.52 I.131 J-.152 E.00416
G1 X117.104 Y131.755 E.02371
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.0146
G1 X120.338 Y131.808 E.09126
G1 X120.1 Y129.999 E.05608
G1 X127.635 Y129.007 E.23353
G1 X127.195 Y125.666 E.10355
G1 X119.66 Y126.658 E.23353
G1 X119.422 Y124.848 E.05608
G1 X116.478 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.213 Y124.986 E.02326
G3 X116.383 Y124.764 I.195 J-.027 E.00956
G1 X126.684 Y123.408 E.31925
G3 X128.308 Y123.328 I1.477 J13.527 E.05
G3 X129.316 Y123.408 I-.372 J11.122 E.03108
G1 X139.617 Y124.764 E.31925
M73 P77 R4
G3 X139.787 Y124.986 I-.027 J.197 E.00953
G1 X139.689 Y125.737 E.02326
G1 X139.46 Y125.707 E.00707
G1 X139.522 Y125.236 E.0146
G1 X136.578 Y124.848 E.09126
G1 X136.34 Y126.658 E.05608
G1 X128.864 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.568 Y127.651 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X128 Y128.157 F42000
G1 Z11.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51311
G1 F2455
M204 S6000
G1 X128 Y128.365 E.00796
; LINE_WIDTH: 0.474822
G1 X128 Y128.573 E.00731
; LINE_WIDTH: 0.436535
G1 X128 Y128.78 E.00667
; LINE_WIDTH: 0.398247
G1 X128 Y128.988 E.00602
; LINE_WIDTH: 0.357162
G1 X128.146 Y129.166 E.00589
; WIPE_START
G1 F11456.137
G1 X128 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128 Y127.035 Z12.2 F42000
G1 Z11.8
G1 E.8 F1800
; LINE_WIDTH: 0.12175
G1 F2455
M204 S6000
G1 X128 Y126.814 E.00142
; LINE_WIDTH: 0.171403
G1 X128 Y126.593 E.00231
; LINE_WIDTH: 0.221056
G1 X128 Y126.372 E.00321
; LINE_WIDTH: 0.270708
G1 X128 Y126.151 E.0041
; LINE_WIDTH: 0.320361
G1 X128 Y125.93 E.005
; LINE_WIDTH: 0.370014
G1 X128 Y125.709 E.00589
; LINE_WIDTH: 0.419667
G1 X128 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X128 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X128 Y125.046 E.00857
M204 S10000
G1 X134.784 Y125.706 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X133.17 Y125.494 E.05401
G1 X132.212 Y124.536 E.04493
G1 X131.551 Y124.449 E.0221
G1 X130.816 Y125.184 E.03448
G1 X128.608 Y124.893 E.07389
G1 X128.608 Y124.697 E.00649
G1 X127.392 Y124.697 E.04032
G1 X127.392 Y124.893 E.00649
G1 X125.184 Y125.184 E.07389
G1 X124.449 Y124.449 E.03448
G1 X123.788 Y124.536 E.0221
G1 X122.83 Y125.494 E.04493
G1 X121.216 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X122.83 Y125.494 E-.61876
G1 X123.093 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.585 Y124.585 Z12.2 F42000
G1 Z11.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130851
G1 F2455
M204 S6000
G1 X116.413 Y125.002 E.02293
; WIPE_START
G1 F15000
G1 X118.395 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.11 Y130.612 Z12.2 F42000
G1 Z11.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X122.724 Y130.4 E.05401
G1 X123.459 Y131.135 E.03448
G1 X125.078 Y130.922 E.05419
G1 X126.036 Y129.964 E.04493
G1 X128 Y129.705 E.06571
G1 X129.964 Y129.964 E.06571
G1 X130.922 Y130.922 E.04493
G1 X132.541 Y131.135 E.05419
G1 X133.276 Y130.4 E.03448
G1 X134.89 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X133.276 Y130.4 E-.61876
G1 X133.013 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.436 Y132.02 Z12.2 F42000
G1 Z11.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130846
G1 F2455
M204 S6000
G1 X138.608 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X136.625 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.538 Y125.122 Z12.2 F42000
G1 X139.587 Y125.002 Z12.2
G1 Z11.8
G1 E.8 F1800
; LINE_WIDTH: 0.130835
G1 F2455
M204 S6000
G1 X136.415 Y124.585 E.02292
; WIPE_START
G1 F15000
G1 X138.398 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.317 Y127.694 Z12.2 F42000
G1 X120.564 Y132.02 Z12.2
G1 Z11.8
G1 E.8 F1800
; LINE_WIDTH: 0.130852
G1 F2455
M204 S6000
G1 X117.392 Y132.438 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 12
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X119.375 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 60/85
; update layer progress
M73 L60
M991 S0 P59 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z12.2 I.739 J.967 P1  F42000
G1 X128.467 Y125.226 Z12.2
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X128.107 Y127.961 E.09151
G1 X127.893 Y127.961 E.0071
G1 X127.533 Y125.226 E.09151
G1 X119.998 Y126.218 E.25211
G1 X119.799 Y124.71 E.05045
G1 X126.731 Y123.797 E.23192
G3 X128.305 Y123.72 I1.422 J12.972 E.05231
G3 X129.269 Y123.797 I-.375 J10.799 E.0321
G1 X136.201 Y124.71 E.23191
G1 X136.002 Y126.218 E.05045
G1 X128.527 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X128.223 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.631 Y129.534 Z12.4 F42000
G1 Z12
G1 E.8 F1800
G1 F2455
M204 S6000
G1 X128 Y129.354 E.04581
G1 X135.46 Y130.336 E.2496
G1 X135.261 Y131.844 E.05045
G1 X128.31 Y130.929 E.23257
G2 X127.69 Y130.929 I-.31 J2.801 E.02062
G1 X120.739 Y131.844 E.23257
G1 X120.54 Y130.336 E.05045
G1 X126.571 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X128 Y129.354 E-.54753
G1 X128.554 Y129.427 E-.21247
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.805 Y125.666 Z12.4 F42000
G1 Z12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2455
M204 S5000
G1 X128.365 Y129.007 E.10355
G1 X135.9 Y129.999 E.23353
G1 X135.662 Y131.808 E.05608
G1 X138.606 Y132.196 E.09126
G1 X138.668 Y131.725 E.0146
G1 X138.896 Y131.755 E.00706
G1 X138.795 Y132.52 E.02371
G3 X138.576 Y132.676 I-.193 J-.039 E.0091
G1 X128.268 Y131.319 E.31948
G2 X127.732 Y131.319 I-.268 J2.338 E.01649
G1 X117.355 Y132.674 E.32159
G3 X117.205 Y132.52 I.038 J-.186 E.00703
G1 X117.104 Y131.755 E.02371
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.0146
G1 X120.338 Y131.808 E.09126
G1 X120.1 Y129.999 E.05608
G1 X127.635 Y129.007 E.23353
G1 X127.195 Y125.666 E.10355
G1 X119.66 Y126.658 E.23353
G1 X119.422 Y124.848 E.05608
G1 X116.478 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.213 Y124.986 E.02327
G3 X116.383 Y124.764 I.201 J-.022 E.00948
G1 X126.684 Y123.408 E.31925
G3 X128.314 Y123.328 I1.476 J13.51 E.05017
G3 X129.316 Y123.408 I-.382 J11.172 E.03091
G1 X139.617 Y124.764 E.31925
G3 X139.787 Y124.986 I-.021 J.193 E.0096
G1 X139.689 Y125.737 E.02327
G1 X139.46 Y125.707 E.00707
G1 X139.522 Y125.236 E.0146
G1 X136.578 Y124.848 E.09126
G1 X136.34 Y126.658 E.05608
G1 X128.864 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.568 Y127.651 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X128 Y128.157 F42000
G1 Z12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.513104
G1 F2455
M204 S6000
G1 X128 Y128.365 E.00796
; LINE_WIDTH: 0.474812
G1 X128 Y128.573 E.00731
; LINE_WIDTH: 0.436519
G1 X128 Y128.78 E.00667
; LINE_WIDTH: 0.398227
G1 X128 Y128.988 E.00602
; LINE_WIDTH: 0.357182
G1 X128.146 Y129.166 E.00589
; WIPE_START
G1 F11455.418
G1 X128 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128 Y127.035 Z12.4 F42000
G1 Z12
G1 E.8 F1800
; LINE_WIDTH: 0.12175
G1 F2455
M204 S6000
G1 X128 Y126.814 E.00142
; LINE_WIDTH: 0.171403
G1 X128 Y126.593 E.00231
; LINE_WIDTH: 0.221055
G1 X128 Y126.372 E.00321
; LINE_WIDTH: 0.270708
G1 X128 Y126.151 E.0041
; LINE_WIDTH: 0.320361
G1 X128 Y125.93 E.005
; LINE_WIDTH: 0.370014
G1 X128 Y125.709 E.00589
; LINE_WIDTH: 0.419666
G1 X128 Y125.488 E.00679
; LINE_WIDTH: 0.469319
G1 X128 Y125.267 E.00768
; LINE_WIDTH: 0.518972
G1 X128 Y125.046 E.00857
M204 S10000
G1 X121.216 Y125.706 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X122.83 Y125.494 E.05401
G1 X123.788 Y124.536 E.04493
G1 X124.449 Y124.449 E.0221
G1 X125.184 Y125.184 E.03448
G1 X127.392 Y124.893 E.07389
G1 X127.392 Y124.697 E.00649
G1 X128.608 Y124.697 E.04032
G1 X128.608 Y124.893 E.00649
G1 X130.816 Y125.184 E.07389
G1 X131.551 Y124.449 E.03448
G1 X132.212 Y124.536 E.0221
G1 X133.17 Y125.494 E.04493
G1 X134.784 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X133.17 Y125.494 E-.61876
G1 X132.907 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.415 Y124.585 Z12.4 F42000
G1 Z12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130837
G1 F2455
M204 S6000
G1 X139.587 Y125.002 E.02292
; WIPE_START
G1 F15000
G1 X137.605 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.89 Y130.612 Z12.4 F42000
G1 Z12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X133.276 Y130.4 E.05401
G1 X132.541 Y131.135 E.03448
G1 X130.922 Y130.922 E.05419
G1 X129.964 Y129.964 E.04493
G1 X128 Y129.705 E.06571
G1 X126.036 Y129.964 E.0657
G1 X125.078 Y130.922 E.04493
G1 X123.459 Y131.135 E.05419
G1 X122.724 Y130.4 E.03448
G1 X121.11 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X122.724 Y130.4 E-.61876
M73 P78 R4
G1 X122.987 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.564 Y132.02 Z12.4 F42000
G1 Z12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130852
G1 F2455
M204 S6000
G1 X117.392 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X119.375 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.462 Y125.122 Z12.4 F42000
G1 X116.413 Y125.002 Z12.4
G1 Z12
G1 E.8 F1800
; LINE_WIDTH: 0.130851
G1 F2455
M204 S6000
G1 X119.585 Y124.585 E.02293
; WIPE_START
G1 F15000
G1 X117.602 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.683 Y127.694 Z12.4 F42000
G1 X135.436 Y132.02 Z12.4
G1 Z12
G1 E.8 F1800
; LINE_WIDTH: 0.130847
G1 F2455
M204 S6000
G1 X138.608 Y132.438 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 12.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X136.625 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 61/85
; update layer progress
M73 L61
M991 S0 P60 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z12.4 I.789 J-.926 P1  F42000
G1 X128.467 Y125.226 Z12.4
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2467
M204 S6000
G1 X128.107 Y127.961 E.09151
G1 X127.893 Y127.961 E.0071
G1 X127.533 Y125.226 E.09151
G1 X119.998 Y126.218 E.25211
G1 X119.799 Y124.71 E.05045
G1 X126.731 Y123.797 E.23192
G3 X128.311 Y123.721 I1.421 J12.954 E.05249
G3 X129.269 Y123.797 I-.387 J10.862 E.03191
G1 X136.201 Y124.71 E.23192
G1 X136.002 Y126.218 E.05045
G1 X128.527 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X128.223 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.631 Y129.534 Z12.6 F42000
G1 Z12.2
G1 E.8 F1800
G1 F2467
M204 S6000
G1 X128 Y129.354 E.04581
G1 X135.46 Y130.336 E.24959
G1 X135.261 Y131.844 E.05045
G1 X128.31 Y130.929 E.23257
G2 X127.69 Y130.929 I-.31 J2.801 E.02062
G1 X120.739 Y131.844 E.23257
G1 X120.54 Y130.336 E.05045
G1 X126.571 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X128 Y129.354 E-.54756
G1 X128.554 Y129.427 E-.21244
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.805 Y125.666 Z12.6 F42000
G1 Z12.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2467
M204 S5000
G1 X128.365 Y129.007 E.10355
G1 X135.9 Y129.999 E.23353
G1 X135.662 Y131.808 E.05608
G1 X138.606 Y132.196 E.09126
G1 X138.668 Y131.725 E.0146
G1 X138.896 Y131.755 E.00706
G1 X138.795 Y132.52 E.02372
G3 X138.576 Y132.676 I-.19 J-.035 E.00913
G1 X128.268 Y131.319 E.31948
G2 X127.732 Y131.319 I-.268 J2.337 E.01649
G1 X117.424 Y132.676 E.31947
G1 X117.354 Y132.674 E.00215
G1 X117.271 Y132.635 E.00283
G3 X117.205 Y132.52 I.132 J-.152 E.00413
G1 X117.104 Y131.755 E.02373
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.0146
G1 X120.338 Y131.808 E.09126
G1 X120.1 Y129.999 E.05608
G1 X127.635 Y129.007 E.23353
G1 X127.195 Y125.666 E.10355
G1 X119.66 Y126.658 E.23353
G1 X119.422 Y124.848 E.05608
G1 X116.478 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.213 Y124.986 E.02326
G3 X116.383 Y124.764 I.192 J-.029 E.0096
G1 X126.684 Y123.408 E.31925
G3 X128.319 Y123.329 I1.475 J13.49 E.05034
G3 X129.316 Y123.408 I-.393 J11.231 E.03074
G1 X139.617 Y124.764 E.31925
G3 X139.787 Y124.986 I-.021 J.193 E.0096
G1 X139.689 Y125.737 E.02327
G1 X139.46 Y125.707 E.00707
G1 X139.522 Y125.236 E.0146
G1 X136.578 Y124.848 E.09126
G1 X136.34 Y126.658 E.05608
G1 X128.864 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.568 Y127.651 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X128 Y128.157 F42000
G1 Z12.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.513125
G1 F2467
M204 S6000
G1 X128 Y128.365 E.00796
; LINE_WIDTH: 0.474834
G1 X128 Y128.573 E.00731
; LINE_WIDTH: 0.436543
G1 X128 Y128.78 E.00667
; LINE_WIDTH: 0.398252
G1 X128 Y128.988 E.00602
; LINE_WIDTH: 0.357142
G1 X128.146 Y129.166 E.00589
; WIPE_START
G1 F11456.876
G1 X128 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128 Y127.035 Z12.6 F42000
G1 Z12.2
G1 E.8 F1800
; LINE_WIDTH: 0.12175
G1 F2467
M204 S6000
G1 X128 Y126.814 E.00142
; LINE_WIDTH: 0.171403
G1 X128 Y126.593 E.00231
; LINE_WIDTH: 0.221056
G1 X128 Y126.372 E.00321
; LINE_WIDTH: 0.270709
G1 X128 Y126.151 E.0041
; LINE_WIDTH: 0.320362
G1 X128 Y125.93 E.005
; LINE_WIDTH: 0.370015
G1 X128 Y125.709 E.00589
; LINE_WIDTH: 0.419667
G1 X128 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X128 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X128 Y125.046 E.00857
; WIPE_START
G1 F7562.183
G1 X128 Y125.267 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.63 Y125.093 Z12.6 F42000
G1 X139.587 Y125.002 Z12.6
G1 Z12.2
G1 E.8 F1800
; LINE_WIDTH: 0.130845
G1 F2467
M204 S6000
G1 X136.415 Y124.585 E.02293
; WIPE_START
G1 F15000
G1 X138.398 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.784 Y125.706 Z12.6 F42000
G1 Z12.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2467
M204 S6000
G1 X133.17 Y125.494 E.05401
G1 X132.212 Y124.536 E.04493
G1 X131.551 Y124.449 E.0221
G1 X130.816 Y125.184 E.03448
G1 X128.608 Y124.893 E.07389
G1 X128.608 Y124.697 E.00649
G1 X127.392 Y124.697 E.04032
G1 X127.392 Y124.893 E.00649
G1 X125.184 Y125.184 E.07389
G1 X124.449 Y124.449 E.03448
G1 X123.788 Y124.536 E.0221
G1 X122.83 Y125.494 E.04493
G1 X121.216 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X122.83 Y125.494 E-.61876
G1 X123.093 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.585 Y124.585 Z12.6 F42000
G1 Z12.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130851
G1 F2467
M204 S6000
G1 X116.413 Y125.002 E.02293
; WIPE_START
G1 F15000
G1 X118.395 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.409 Y132.31 Z12.6 F42000
G1 X117.392 Y132.438 Z12.6
G1 Z12.2
G1 E.8 F1800
; LINE_WIDTH: 0.130864
G1 F2467
M204 S6000
G1 X120.564 Y132.02 E.02293
; WIPE_START
G1 F15000
G1 X118.581 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.11 Y130.612 Z12.6 F42000
G1 Z12.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2467
M204 S6000
G1 X122.724 Y130.4 E.05401
G1 X123.459 Y131.135 E.03448
G1 X125.078 Y130.922 E.05419
G1 X126.036 Y129.964 E.04493
G1 X128 Y129.705 E.06571
G1 X129.964 Y129.964 E.0657
G1 X130.922 Y130.922 E.04493
G1 X132.541 Y131.135 E.05419
G1 X133.276 Y130.4 E.03448
G1 X134.89 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X133.276 Y130.4 E-.61876
G1 X133.013 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.436 Y132.02 Z12.6 F42000
G1 Z12.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130847
G1 F2467
M204 S6000
G1 X138.608 Y132.438 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 12.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X136.625 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 62/85
; update layer progress
M73 L62
M991 S0 P61 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z12.6 I.789 J-.926 P1  F42000
G1 X128.467 Y125.226 Z12.6
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2467
M204 S6000
G1 X128.107 Y127.961 E.09151
G1 X127.893 Y127.961 E.0071
G1 X127.533 Y125.226 E.09151
G1 X119.998 Y126.218 E.25211
G1 X119.799 Y124.71 E.05045
G1 X126.731 Y123.797 E.23192
G3 X128.316 Y123.721 I1.419 J12.939 E.05268
M73 P79 R4
G3 X129.269 Y123.797 I-.398 J10.921 E.03173
G1 X136.201 Y124.71 E.23192
G1 X136.002 Y126.218 E.05045
G1 X128.527 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X128.223 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.631 Y129.534 Z12.8 F42000
G1 Z12.4
G1 E.8 F1800
G1 F2467
M204 S6000
G1 X128 Y129.354 E.04581
G1 X135.46 Y130.336 E.24959
G1 X135.261 Y131.844 E.05045
G1 X128.311 Y130.929 E.23254
G2 X127.683 Y130.93 I-.31 J3.553 E.02086
G1 X120.739 Y131.844 E.23236
G1 X120.54 Y130.336 E.05045
G1 X126.571 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X128 Y129.354 E-.54755
G1 X128.554 Y129.427 E-.21245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.805 Y125.666 Z12.8 F42000
G1 Z12.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2467
M204 S5000
G1 X128.365 Y129.007 E.10355
G1 X135.9 Y129.999 E.23353
G1 X135.662 Y131.808 E.05608
G1 X138.606 Y132.196 E.09126
G1 X138.668 Y131.725 E.0146
G1 X138.896 Y131.755 E.00706
G1 X138.791 Y132.538 E.02428
G3 X138.576 Y132.676 I-.184 J-.051 E.00861
G1 X128.268 Y131.319 E.31946
G2 X127.73 Y131.319 I-.268 J3 E.01655
G1 X117.424 Y132.676 E.3194
G1 X117.307 Y132.658 E.00364
G3 X117.205 Y132.52 I.085 J-.17 E.00548
G1 X117.104 Y131.755 E.02371
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.0146
G1 X120.338 Y131.808 E.09126
G1 X120.1 Y129.999 E.05608
G1 X127.635 Y129.007 E.23353
G1 X127.195 Y125.666 E.10355
G1 X119.66 Y126.658 E.23353
G1 X119.422 Y124.848 E.05608
G1 X116.478 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.213 Y124.986 E.02326
G3 X116.383 Y124.764 I.198 J-.025 E.00953
G1 X126.684 Y123.408 E.31925
G3 X128.325 Y123.329 I1.473 J13.474 E.05051
G3 X129.316 Y123.408 I-.404 J11.293 E.03057
G1 X139.617 Y124.764 E.31925
G3 X139.787 Y124.986 I-.031 J.2 E.00949
G1 X139.689 Y125.737 E.02326
G1 X139.46 Y125.707 E.00707
G1 X139.522 Y125.236 E.0146
G1 X136.578 Y124.848 E.09126
G1 X136.34 Y126.658 E.05608
G1 X128.864 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.568 Y127.651 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X128 Y128.157 F42000
G1 Z12.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51311
G1 F2467
M204 S6000
G1 X128 Y128.365 E.00796
; LINE_WIDTH: 0.474822
G1 X128 Y128.573 E.00731
; LINE_WIDTH: 0.436535
G1 X128 Y128.78 E.00667
; LINE_WIDTH: 0.398247
G1 X128 Y128.988 E.00602
; LINE_WIDTH: 0.357162
G1 X128.146 Y129.166 E.00589
; WIPE_START
G1 F11456.137
G1 X128 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128 Y127.035 Z12.8 F42000
G1 Z12.4
G1 E.8 F1800
; LINE_WIDTH: 0.12175
G1 F2467
M204 S6000
G1 X128 Y126.814 E.00142
; LINE_WIDTH: 0.171403
G1 X128 Y126.593 E.00231
; LINE_WIDTH: 0.221056
G1 X128 Y126.372 E.00321
; LINE_WIDTH: 0.270708
G1 X128 Y126.151 E.0041
; LINE_WIDTH: 0.320361
G1 X128 Y125.93 E.005
; LINE_WIDTH: 0.370014
G1 X128 Y125.709 E.00589
; LINE_WIDTH: 0.419667
G1 X128 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X128 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X128 Y125.046 E.00857
; WIPE_START
G1 F7562.194
G1 X128 Y125.267 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.37 Y125.093 Z12.8 F42000
G1 X116.412 Y125.002 Z12.8
G1 Z12.4
G1 E.8 F1800
; LINE_WIDTH: 0.130827
G1 F2467
M204 S6000
G1 X119.585 Y124.585 E.02292
; WIPE_START
G1 F15000
G1 X117.602 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.216 Y125.706 Z12.8 F42000
G1 Z12.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2467
M204 S6000
G1 X122.83 Y125.494 E.05401
G1 X123.788 Y124.536 E.04493
G1 X124.449 Y124.449 E.0221
G1 X125.184 Y125.184 E.03448
G1 X127.392 Y124.893 E.07389
G1 X127.392 Y124.697 E.00649
G1 X128.608 Y124.697 E.04032
G1 X128.608 Y124.893 E.00649
G1 X130.816 Y125.184 E.07389
G1 X131.551 Y124.449 E.03448
G1 X132.212 Y124.536 E.0221
G1 X133.17 Y125.494 E.04493
G1 X134.784 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X133.17 Y125.494 E-.61876
G1 X132.907 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.415 Y124.585 Z12.8 F42000
G1 Z12.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130843
G1 F2467
M204 S6000
G1 X139.587 Y125.002 E.02293
; WIPE_START
G1 F15000
G1 X137.605 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.591 Y132.31 Z12.8 F42000
G1 X138.608 Y132.438 Z12.8
G1 Z12.4
G1 E.8 F1800
; LINE_WIDTH: 0.130847
G1 F2467
M204 S6000
G1 X135.436 Y132.02 E.02292
; WIPE_START
G1 F15000
G1 X137.419 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.89 Y130.612 Z12.8 F42000
G1 Z12.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2467
M204 S6000
G1 X133.276 Y130.4 E.05401
G1 X132.541 Y131.135 E.03448
G1 X130.922 Y130.922 E.05419
G1 X129.964 Y129.964 E.04493
G1 X128 Y129.705 E.06571
G1 X126.036 Y129.964 E.06571
G1 X125.078 Y130.922 E.04493
G1 X123.459 Y131.135 E.05419
G1 X122.724 Y130.4 E.03448
G1 X121.11 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X122.724 Y130.4 E-.61876
G1 X122.987 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.564 Y132.02 Z12.8 F42000
G1 Z12.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130855
G1 F2467
M204 S6000
G1 X117.392 Y132.438 E.02293
; CHANGE_LAYER
; Z_HEIGHT: 12.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15000
G1 X119.375 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 63/85
; update layer progress
M73 L63
M991 S0 P62 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z12.8 I.739 J.967 P1  F42000
G1 X128.467 Y125.226 Z12.8
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X128.107 Y127.961 E.09151
G1 X127.893 Y127.961 E.0071
G1 X127.533 Y125.226 E.09151
G1 X119.998 Y126.218 E.25211
G1 X119.799 Y124.71 E.05045
G1 X126.731 Y123.797 E.23192
G3 X128.322 Y123.721 I1.418 J12.926 E.05286
G3 X129.269 Y123.797 I-.41 J10.991 E.03154
G1 X136.201 Y124.71 E.23191
G1 X136.002 Y126.218 E.05045
G1 X128.527 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X128.223 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.631 Y129.534 Z13 F42000
G1 Z12.6
G1 E.8 F1800
G1 F2455
M204 S6000
G1 X128 Y129.354 E.04581
G1 X135.46 Y130.336 E.24959
G1 X135.261 Y131.844 E.05045
G1 X128.31 Y130.929 E.23257
G2 X127.69 Y130.929 I-.31 J2.803 E.02063
G1 X120.739 Y131.844 E.23257
G1 X120.54 Y130.336 E.05045
G1 X126.571 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X128 Y129.354 E-.54755
G1 X128.554 Y129.427 E-.21245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.805 Y125.666 Z13 F42000
G1 Z12.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2455
M204 S5000
G1 X128.365 Y129.007 E.10355
G1 X135.9 Y129.999 E.23353
G1 X135.662 Y131.808 E.05608
M73 P80 R4
G1 X138.606 Y132.196 E.09126
G1 X138.668 Y131.725 E.0146
G1 X138.896 Y131.755 E.00706
G1 X138.791 Y132.538 E.02429
G3 X138.576 Y132.676 I-.184 J-.051 E.0086
G1 X128.268 Y131.319 E.31947
G2 X127.732 Y131.319 I-.268 J2.339 E.01649
G1 X117.401 Y132.678 E.3202
G3 X117.205 Y132.52 I-.007 J-.191 E.00844
G1 X117.104 Y131.755 E.02371
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.0146
G1 X120.338 Y131.808 E.09126
G1 X120.1 Y129.999 E.05608
G1 X127.635 Y129.007 E.23353
G1 X127.195 Y125.666 E.10355
G1 X119.66 Y126.658 E.23353
G1 X119.422 Y124.848 E.05608
G1 X116.478 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.212 Y124.931 E.02495
G3 X116.383 Y124.764 I.2 J.034 E.00785
G1 X126.684 Y123.408 E.31925
G3 X128.33 Y123.329 I1.472 J13.46 E.05068
G3 X129.316 Y123.408 I-.416 J11.36 E.0304
G1 X139.617 Y124.764 E.31925
G3 X139.787 Y124.986 I-.024 J.195 E.00956
G1 X139.689 Y125.737 E.02327
G1 X139.46 Y125.707 E.00707
G1 X139.522 Y125.236 E.0146
G1 X136.578 Y124.848 E.09126
G1 X136.34 Y126.658 E.05608
G1 X128.864 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.568 Y127.651 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X128 Y128.157 F42000
G1 Z12.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.51311
G1 F2455
M204 S6000
G1 X128 Y128.365 E.00796
; LINE_WIDTH: 0.474822
G1 X128 Y128.573 E.00731
; LINE_WIDTH: 0.436535
G1 X128 Y128.78 E.00667
; LINE_WIDTH: 0.398247
G1 X128 Y128.988 E.00602
; LINE_WIDTH: 0.357162
G1 X128.146 Y129.166 E.00589
; WIPE_START
G1 F11456.137
G1 X128 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128 Y127.035 Z13 F42000
G1 Z12.6
G1 E.8 F1800
; LINE_WIDTH: 0.12175
G1 F2455
M204 S6000
G1 X128 Y126.814 E.00142
; LINE_WIDTH: 0.171403
G1 X128 Y126.593 E.00231
; LINE_WIDTH: 0.221056
G1 X128 Y126.372 E.00321
; LINE_WIDTH: 0.270708
G1 X128 Y126.151 E.0041
; LINE_WIDTH: 0.320361
G1 X128 Y125.93 E.005
; LINE_WIDTH: 0.370014
G1 X128 Y125.709 E.00589
; LINE_WIDTH: 0.419667
G1 X128 Y125.488 E.00679
; LINE_WIDTH: 0.46932
G1 X128 Y125.267 E.00768
; LINE_WIDTH: 0.518973
G1 X128 Y125.046 E.00857
M204 S10000
G1 X134.784 Y125.706 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X133.17 Y125.494 E.05401
G1 X132.212 Y124.536 E.04493
G1 X131.551 Y124.449 E.0221
G1 X130.816 Y125.184 E.03448
G1 X128.608 Y124.893 E.07389
G1 X128.608 Y124.697 E.00649
G1 X127.392 Y124.697 E.04032
G1 X127.392 Y124.893 E.00649
G1 X125.184 Y125.184 E.07389
G1 X124.449 Y124.449 E.03448
G1 X123.788 Y124.536 E.0221
G1 X122.83 Y125.494 E.04493
G1 X121.216 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X122.83 Y125.494 E-.61876
G1 X123.093 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.585 Y124.585 Z13 F42000
G1 Z12.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130851
G1 F2455
M204 S6000
G1 X116.413 Y125.002 E.02293
; WIPE_START
G1 F15000
G1 X118.395 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.11 Y130.612 Z13 F42000
G1 Z12.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X122.724 Y130.4 E.05401
G1 X123.459 Y131.135 E.03448
G1 X125.078 Y130.922 E.05419
G1 X126.036 Y129.964 E.04493
G1 X128 Y129.705 E.06571
G1 X129.964 Y129.964 E.06571
G1 X130.922 Y130.922 E.04493
G1 X132.541 Y131.135 E.05419
G1 X133.276 Y130.4 E.03448
G1 X134.89 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X133.276 Y130.4 E-.61876
G1 X133.013 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.436 Y132.02 Z13 F42000
G1 Z12.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130847
G1 F2455
M204 S6000
G1 X138.608 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X136.625 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.538 Y125.122 Z13 F42000
G1 X139.587 Y125.002 Z13
G1 Z12.6
G1 E.8 F1800
; LINE_WIDTH: 0.130835
G1 F2455
M204 S6000
G1 X136.415 Y124.585 E.02292
; WIPE_START
G1 F15000
G1 X138.398 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.317 Y127.694 Z13 F42000
G1 X120.564 Y132.02 Z13
G1 Z12.6
G1 E.8 F1800
; LINE_WIDTH: 0.130853
M73 P80 R3
G1 F2455
M204 S6000
G1 X117.392 Y132.438 E.02293
; CHANGE_LAYER
; Z_HEIGHT: 12.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X119.375 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 64/85
; update layer progress
M73 L64
M991 S0 P63 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z13 I.739 J.967 P1  F42000
G1 X128.467 Y125.226 Z13
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X128.107 Y127.961 E.09151
G1 X127.893 Y127.961 E.0071
G1 X127.533 Y125.226 E.09151
G1 X119.998 Y126.218 E.25211
G1 X119.799 Y124.71 E.05045
G1 X126.731 Y123.797 E.23192
G3 X128.327 Y123.721 I1.418 J12.917 E.05305
G3 X129.269 Y123.797 I-.423 J11.069 E.03136
G1 X136.201 Y124.71 E.23192
G1 X136.002 Y126.218 E.05045
G1 X128.527 Y125.233 E.25012
; WIPE_START
G1 F8843.478
G1 X128.223 Y127.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.631 Y129.534 Z13.2 F42000
G1 Z12.8
G1 E.8 F1800
G1 F2455
M204 S6000
G1 X128 Y129.354 E.04581
G1 X135.46 Y130.336 E.2496
G1 X135.261 Y131.844 E.05045
G1 X128.311 Y130.929 E.23254
G2 X127.69 Y130.929 I-.311 J2.927 E.02065
G1 X120.739 Y131.844 E.23257
G1 X120.54 Y130.336 E.05045
G1 X126.571 Y129.542 E.2018
; WIPE_START
G1 F8843.478
G1 X128 Y129.354 E-.54753
G1 X128.554 Y129.427 E-.21247
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.805 Y125.666 Z13.2 F42000
G1 Z12.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2455
M204 S5000
G1 X128.365 Y129.007 E.10355
G1 X135.9 Y129.999 E.23353
G1 X135.662 Y131.808 E.05608
G1 X138.606 Y132.196 E.09126
G1 X138.668 Y131.725 E.0146
G1 X138.896 Y131.755 E.00706
G1 X138.795 Y132.52 E.02371
G3 X138.576 Y132.676 I-.19 J-.034 E.00914
G1 X128.268 Y131.319 E.31947
G2 X127.732 Y131.319 I-.268 J2.445 E.01649
G1 X117.397 Y132.678 E.32029
G3 X117.205 Y132.52 I-.004 J-.192 E.00833
G1 X117.104 Y131.755 E.02371
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.0146
G1 X120.338 Y131.808 E.09126
G1 X120.1 Y129.999 E.05608
G1 X127.635 Y129.007 E.23353
G1 X127.195 Y125.666 E.10355
G1 X119.66 Y126.658 E.23353
G1 X119.422 Y124.848 E.05608
G1 X116.478 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.213 Y124.986 E.02327
G3 X116.383 Y124.764 I.192 J-.029 E.00959
G1 X126.684 Y123.408 E.31925
G3 X128.336 Y123.329 I1.471 J13.45 E.05085
G3 X129.316 Y123.408 I-.426 J11.41 E.03023
G1 X139.617 Y124.764 E.31925
G3 X139.787 Y124.986 I-.031 J.2 E.00949
G1 X139.689 Y125.737 E.02327
G1 X139.46 Y125.707 E.00707
G1 X139.522 Y125.236 E.0146
G1 X136.578 Y124.848 E.09126
G1 X136.34 Y126.658 E.05608
G1 X128.864 Y125.673 E.23168
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.568 Y127.651 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X128 Y128.157 F42000
G1 Z12.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.5131
G1 F2455
M204 S6000
G1 X128 Y128.365 E.00796
; LINE_WIDTH: 0.474803
G1 X128 Y128.572 E.00732
; LINE_WIDTH: 0.436505
G1 X128 Y128.78 E.00667
; LINE_WIDTH: 0.398208
G1 X128 Y128.988 E.00602
; LINE_WIDTH: 0.357142
G1 X128.146 Y129.166 E.00589
; WIPE_START
G1 F11456.891
G1 X128 Y128.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128 Y127.035 Z13.2 F42000
G1 Z12.8
G1 E.8 F1800
; LINE_WIDTH: 0.121749
G1 F2455
M204 S6000
G1 X128 Y126.814 E.00142
; LINE_WIDTH: 0.1714
G1 X128 Y126.593 E.00231
; LINE_WIDTH: 0.221051
G1 X128 Y126.372 E.00321
; LINE_WIDTH: 0.270702
G1 X128 Y126.151 E.0041
; LINE_WIDTH: 0.320353
G1 X128 Y125.93 E.005
; LINE_WIDTH: 0.370004
G1 X128 Y125.709 E.00589
; LINE_WIDTH: 0.419656
G1 X128 Y125.488 E.00679
; LINE_WIDTH: 0.469307
G1 X128 Y125.267 E.00768
; LINE_WIDTH: 0.518958
G1 X128 Y125.046 E.00857
M204 S10000
G1 X121.216 Y125.706 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
M73 P81 R3
G1 F2455
M204 S6000
G1 X122.83 Y125.494 E.05401
G1 X123.788 Y124.536 E.04493
G1 X124.449 Y124.449 E.0221
G1 X125.184 Y125.184 E.03448
G1 X127.392 Y124.893 E.07389
G1 X127.392 Y124.697 E.00648
G1 X128.608 Y124.697 E.04032
G1 X128.608 Y124.893 E.00648
G1 X130.816 Y125.184 E.07389
G1 X131.551 Y124.449 E.03448
G1 X132.212 Y124.536 E.0221
G1 X133.17 Y125.494 E.04493
G1 X134.784 Y125.706 E.05401
; WIPE_START
G1 F8843.478
G1 X133.17 Y125.494 E-.61876
G1 X132.907 Y125.231 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.415 Y124.585 Z13.2 F42000
G1 Z12.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130835
G1 F2455
M204 S6000
G1 X139.587 Y125.002 E.02292
; WIPE_START
G1 F15000
G1 X137.605 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.89 Y130.612 Z13.2 F42000
G1 Z12.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2455
M204 S6000
G1 X133.276 Y130.4 E.05401
G1 X132.541 Y131.135 E.03448
G1 X130.922 Y130.922 E.05419
G1 X129.964 Y129.964 E.04493
G1 X128 Y129.705 E.06571
G1 X126.036 Y129.964 E.06571
G1 X125.078 Y130.922 E.04493
G1 X123.459 Y131.135 E.05419
G1 X122.724 Y130.4 E.03448
G1 X121.11 Y130.612 E.05401
; WIPE_START
G1 F8843.478
G1 X122.724 Y130.4 E-.61876
G1 X122.987 Y130.663 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.564 Y132.02 Z13.2 F42000
G1 Z12.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130852
G1 F2455
M204 S6000
G1 X117.392 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X119.375 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.462 Y125.122 Z13.2 F42000
G1 X116.413 Y125.002 Z13.2
G1 Z12.8
G1 E.8 F1800
; LINE_WIDTH: 0.130861
G1 F2455
M204 S6000
G1 X119.585 Y124.585 E.02293
; WIPE_START
G1 F15000
G1 X117.602 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.683 Y127.694 Z13.2 F42000
G1 X135.436 Y132.02 Z13.2
G1 Z12.8
G1 E.8 F1800
; LINE_WIDTH: 0.130837
G1 F2455
M204 S6000
G1 X138.608 Y132.438 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 13
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X136.625 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 65/85
; update layer progress
M73 L65
M991 S0 P64 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z13.2 I.494 J-1.112 P1  F42000
G1 X119.799 Y124.71 Z13.2
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5227
M204 S6000
G1 X126.731 Y123.797 E.23192
G3 X128.333 Y123.721 I1.417 J12.901 E.05323
G3 X129.269 Y123.797 I-.435 J11.14 E.03118
G1 X136.201 Y124.71 E.23192
G1 X136.052 Y125.84 E.03783
G1 X136 Y126.237 E.01327
G1 F4919.51
G1 X135.947 Y126.634 E.01327
M106 S255
G1 F1800
G1 X135.897 Y127.013 E.01269
M106 S201.45
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X135.565 Y129.541 E.08459
M106 S201.45
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X135.515 Y129.92 E.01269
M106 S201.45
G1 F4919.51
G1 X135.462 Y130.317 E.01327
G1 F5227
G1 X135.41 Y130.713 E.01327
G1 X135.261 Y131.844 E.03783
G1 X128.31 Y130.929 E.23257
G2 X127.69 Y130.929 I-.31 J2.802 E.02062
G1 X120.739 Y131.844 E.23257
G1 X120.59 Y130.713 E.03783
G1 X120.538 Y130.317 E.01327
G1 F4919.51
G1 X120.485 Y129.92 E.01327
M106 S255
G1 F1800
G1 X120.435 Y129.541 E.01269
M106 S201.45
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X120.103 Y127.013 E.08459
M106 S201.45
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X120.053 Y126.634 E.01269
M106 S201.45
G1 F4919.51
G1 X120 Y126.237 E.01327
G1 F5227
G1 X119.948 Y125.84 E.01327
G1 X119.807 Y124.769 E.03584
M204 S250
G1 X119.422 Y124.848 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5227
M204 S5000
G1 X116.478 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.213 Y124.986 E.02326
G3 X116.383 Y124.764 I.195 J-.027 E.00956
G1 X126.684 Y123.408 E.31926
G3 X128.341 Y123.329 I1.47 J13.433 E.05102
G3 X129.316 Y123.408 I-.44 J11.498 E.03006
G1 X139.617 Y124.764 E.31926
G3 X139.787 Y124.986 I-.022 J.193 E.0096
G1 X139.689 Y125.737 E.02326
G1 X139.46 Y125.707 E.00707
G1 X139.522 Y125.236 E.0146
G1 X136.578 Y124.848 E.09126
G1 X136.439 Y125.905 E.03276
G1 X136.387 Y126.302 E.01229
G1 F4919.51
G1 X136.334 Y126.698 E.01229
M106 S255
G1 F1800
G1 X136.286 Y127.064 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X135.953 Y129.592 E.08459
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X135.905 Y129.958 E.01134
M106 S201.45
G1 F4919.51
G1 X135.853 Y130.355 E.01229
G1 F5227
G1 X135.801 Y130.751 E.01229
G1 X135.662 Y131.808 E.03276
G1 X138.606 Y132.196 E.09126
G1 X138.668 Y131.725 E.0146
G1 X138.896 Y131.755 E.00706
G1 X138.795 Y132.52 E.02371
G3 X138.576 Y132.676 I-.191 J-.037 E.00912
G1 X128.268 Y131.319 E.31948
G2 X127.732 Y131.319 I-.268 J2.339 E.01649
G1 X117.354 Y132.674 E.32159
G3 X117.205 Y132.52 I.041 J-.189 E.00699
G1 X117.104 Y131.755 E.02372
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.0146
G1 X120.338 Y131.808 E.09126
G1 X120.199 Y130.751 E.03276
G1 X120.147 Y130.355 E.01229
G1 F4919.51
G1 X120.095 Y129.958 E.01229
M106 S255
G1 F1800
G1 X120.047 Y129.592 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X119.714 Y127.064 E.08459
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X119.666 Y126.698 E.01134
M106 S201.45
G1 F4919.51
G1 X119.613 Y126.302 E.01229
G1 F5227
G1 X119.561 Y125.905 E.01229
G1 X119.43 Y124.908 E.03091
; WIPE_START
G1 F9547.055
M204 S6000
G1 X117.442 Y125.129 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X116.413 Y125.002 F42000
G1 Z13
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130851
G1 F5227
M204 S6000
G1 X119.585 Y124.585 E.02293
; WIPE_START
G1 F15000
G1 X117.602 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.4 I-.925 J.791 P1  F42000
G1 X120.416 Y128.138 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.42413
M106 S255
G1 F3000
M204 S6000
G1 X120.685 Y126.091 E.06411
G1 X121.076 Y126.04 E.01226
G1 X120.693 Y128.948 E.09111
G1 X120.875 Y130.328 E.04323
G1 X120.897 Y130.325 E.00068
G1 X121.468 Y125.988 E.13587
G1 X121.859 Y125.937 E.01226
G1 X121.288 Y130.273 E.13587
G1 X121.679 Y130.222 E.01226
G1 X122.25 Y125.885 E.13587
G1 X122.641 Y125.834 E.01226
G1 X122.07 Y130.17 E.13587
G1 X122.462 Y130.119 E.01226
G1 X123.033 Y125.782 E.13587
G1 X123.424 Y125.731 E.01226
G1 X122.853 Y130.067 E.13587
G1 X123.244 Y130.016 E.01226
G1 X123.815 Y125.679 E.13587
G1 X124.207 Y125.628 E.01226
G1 X123.636 Y129.964 E.13587
G1 X124.027 Y129.913 E.01226
G1 X124.598 Y125.576 E.13587
G1 X124.989 Y125.525 E.01226
G1 X124.418 Y129.861 E.13587
G1 X124.809 Y129.81 E.01226
G1 X125.38 Y125.473 E.13587
G1 X125.772 Y125.422 E.01226
G1 X125.201 Y129.758 E.13587
G1 X125.592 Y129.707 E.01226
G1 X126.163 Y125.37 E.13587
G1 X126.554 Y125.319 E.01226
G1 X125.983 Y129.655 E.13587
G1 X126.375 Y129.604 E.01226
G1 X126.946 Y125.267 E.13587
G1 X127.337 Y125.216 E.01226
G1 X126.766 Y129.552 E.13587
G1 X127.157 Y129.501 E.01226
G1 X127.748 Y125.01 E.1407
G1 X127.845 Y125.01 E.00302
G1 X128 Y125.141 E.0063
G1 X128.13 Y125.031 E.0053
G1 X127.548 Y129.449 E.13843
G1 X127.94 Y129.398 E.01226
G1 X128.495 Y125.183 E.13204
G1 X128.871 Y125.243 E.01185
G1 X128.32 Y129.432 E.13124
G1 X128.698 Y129.482 E.01184
G1 X129.249 Y125.293 E.13124
G1 X129.627 Y125.343 E.01184
G1 X129.076 Y129.531 E.13124
G1 X129.454 Y129.581 E.01184
G1 X130.005 Y125.392 E.13124
G1 X130.383 Y125.442 E.01184
G1 X129.832 Y129.631 E.13124
G1 X130.209 Y129.681 E.01184
G1 X130.761 Y125.492 E.13124
G1 X131.139 Y125.542 E.01184
G1 X130.587 Y129.73 E.13124
G1 X130.965 Y129.78 E.01184
G1 X131.517 Y125.591 E.13124
G1 X131.895 Y125.641 E.01184
G1 X131.343 Y129.83 E.13124
G1 X131.721 Y129.88 E.01184
G1 X132.273 Y125.691 E.13124
G1 X132.651 Y125.741 E.01184
G1 X132.099 Y129.929 E.13124
G1 X132.477 Y129.979 E.01184
G1 X133.029 Y125.79 E.13124
G1 X133.407 Y125.84 E.01184
G1 X132.855 Y130.029 E.13124
G1 X133.233 Y130.079 E.01184
G1 X133.785 Y125.89 E.13124
G1 X134.162 Y125.94 E.01184
G1 X133.611 Y130.128 E.13124
G1 X133.989 Y130.178 E.01184
G1 X134.54 Y125.989 E.13124
G1 X134.918 Y126.039 E.01184
G1 X134.367 Y130.228 E.13124
G1 X134.745 Y130.278 E.01184
G1 X135.296 Y126.089 E.13124
G1 X135.674 Y126.139 E.01184
G1 X135.101 Y130.496 E.13651
M106 S201.45
; WIPE_START
G1 X135.362 Y128.513 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.436 Y132.02 Z13.4 F42000
G1 Z13
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130837
G1 F5227
M204 S6000
G1 X138.608 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X136.625 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.538 Y125.122 Z13.4 F42000
G1 X139.587 Y125.002 Z13.4
G1 Z13
G1 E.8 F1800
; LINE_WIDTH: 0.130835
G1 F5227
M204 S6000
G1 X136.415 Y124.585 E.02292
; WIPE_START
G1 F15000
G1 X138.398 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.692 Y125.614 Z13.4 F42000
M73 P82 R3
G1 Z13
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5227
M204 S6000
G1 X133.077 Y125.401 E.05401
G1 X132.212 Y124.536 E.0406
G1 X131.551 Y124.449 E.02211
G1 X130.887 Y125.113 E.03115
G1 X128.646 Y124.818 E.07498
G1 X128.446 Y124.618 E.00937
G1 X127.554 Y124.618 E.0296
G1 X127.354 Y124.818 E.00937
G1 X125.113 Y125.113 E.07498
G1 X124.449 Y124.449 E.03115
G1 X123.788 Y124.536 E.02211
G1 X122.923 Y125.401 E.0406
G1 X121.308 Y125.614 E.05401
; WIPE_START
G1 F8843.478
G1 X122.923 Y125.401 E-.61876
G1 X123.186 Y125.139 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.4 I-1.144 J-.414 P1  F42000
G1 X121.18 Y130.683 Z13.4
G1 Z13
G1 E.8 F1800
G1 F5227
M204 S6000
G1 X122.795 Y130.471 E.05401
G1 X123.459 Y131.135 E.03115
G1 X125.079 Y130.921 E.05419
G1 X125.944 Y130.056 E.0406
G1 X127.403 Y129.864 E.04882
G3 X128.597 Y129.864 I.597 J2.228 E.04006
G1 X130.056 Y130.056 E.04882
G1 X130.921 Y130.921 E.0406
G1 X132.541 Y131.135 E.05419
G1 X133.205 Y130.471 E.03115
G1 X134.82 Y130.683 E.05401
; WIPE_START
G1 F8843.478
G1 X133.205 Y130.471 E-.61876
G1 X132.942 Y130.733 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.351 Y131.523 Z13.4 F42000
G1 X120.564 Y132.02 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130852
G1 F5227
M204 S6000
G1 X117.392 Y132.438 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 13.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X119.375 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 66/85
; update layer progress
M73 L66
M991 S0 P65 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z13.4 I1.215 J.069 P1  F42000
G1 X119.799 Y124.71 Z13.4
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3575
M204 S6000
G1 X126.731 Y123.797 E.23192
G3 X128.338 Y123.721 I1.416 J12.89 E.05341
G3 X129.269 Y123.797 I-.449 J11.23 E.03099
G1 X136.201 Y124.71 E.23192
G1 X135.261 Y131.844 E.2387
G1 X128.31 Y130.929 E.23257
G2 X127.69 Y130.929 I-.31 J2.801 E.02062
G1 X120.739 Y131.844 E.23257
G1 X119.807 Y124.769 E.23671
M204 S250
G1 X119.422 Y124.848 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3575
M204 S5000
G1 X116.478 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.211 Y124.934 E.02484
G3 X116.383 Y124.764 I.201 J.031 E.00795
G1 X126.684 Y123.408 E.31926
G3 X128.347 Y123.329 I1.469 J13.422 E.05119
G3 X129.316 Y123.408 I-.454 J11.58 E.02989
G1 X139.617 Y124.764 E.31925
G3 X139.787 Y124.986 I-.031 J.2 E.00949
G1 X139.689 Y125.737 E.02327
G1 X139.46 Y125.707 E.00707
G1 X139.522 Y125.236 E.0146
G1 X136.578 Y124.848 E.09126
G1 X135.662 Y131.808 E.21571
G1 X138.606 Y132.196 E.09126
G1 X138.668 Y131.725 E.0146
G1 X138.896 Y131.755 E.00706
G1 X138.791 Y132.538 E.02428
G3 X138.576 Y132.676 I-.184 J-.051 E.0086
G1 X128.268 Y131.319 E.31948
G2 X127.732 Y131.319 I-.268 J2.338 E.01649
G1 X117.424 Y132.676 E.31947
G1 X117.308 Y132.658 E.00361
G3 X117.205 Y132.52 I.089 J-.174 E.00549
G1 X117.104 Y131.755 E.02371
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.0146
G1 X120.338 Y131.808 E.09126
G1 X119.43 Y124.908 E.21386
; WIPE_START
G1 F9547.055
M204 S6000
G1 X117.442 Y125.129 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X116.413 Y125.002 F42000
G1 Z13.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130852
G1 F3575
M204 S6000
G1 X119.585 Y124.585 E.02293
; WIPE_START
G1 F15000
G1 X117.602 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.308 Y125.614 Z13.6 F42000
G1 Z13.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3575
M204 S6000
G1 X122.923 Y125.401 E.05401
G1 X123.788 Y124.536 E.0406
G1 X124.449 Y124.449 E.02211
G1 X125.113 Y125.113 E.03115
G1 X127.354 Y124.818 E.07498
G1 X127.554 Y124.618 E.00937
G1 X128.446 Y124.618 E.0296
G1 X128.646 Y124.818 E.00937
G1 X130.887 Y125.113 E.07498
G1 X131.551 Y124.449 E.03115
G1 X132.212 Y124.536 E.02211
G1 X133.077 Y125.401 E.0406
G1 X134.692 Y125.614 E.05401
; WIPE_START
G1 F8843.478
G1 X133.077 Y125.401 E-.61876
G1 X132.814 Y125.138 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.415 Y124.585 Z13.6 F42000
G1 Z13.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130835
G1 F3575
M204 S6000
G1 X139.587 Y125.002 E.02292
; WIPE_START
G1 F15000
G1 X137.605 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.6 I-1.021 J-.663 P1  F42000
G1 X135.342 Y128.226 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F3575
M204 S6000
G1 X135.618 Y126.131 E.06492
G1 X128.554 Y125.201 E.21894
G3 X128.29 Y125.01 I.179 J-.524 E.01015
G1 X127.71 Y125.01 E.01782
G1 X127.469 Y125.197 E.00937
G1 X127.414 Y125.206 E.00172
G1 X120.382 Y126.131 E.21792
G1 X120.933 Y130.32 E.12982
G1 X127.968 Y129.394 E.218
G1 X135.067 Y130.32 E.21997
G1 X135.334 Y128.286 E.06306
M204 S10000
G1 X134.968 Y128.177 F42000
G1 F3575
M204 S6000
G1 X135.195 Y126.456 E.05334
G1 X128.504 Y125.575 E.20735
G1 X128.239 Y125.467 E.00881
G1 X128.147 Y125.387 E.00375
G1 X127.853 Y125.387 E.009
G1 X127.624 Y125.542 E.00851
G1 X127.463 Y125.579 E.00509
G1 X120.805 Y126.456 E.20633
G1 X121.258 Y129.897 E.10665
G1 X127.924 Y129.02 E.20659
G1 X128.063 Y129.021 E.00428
G1 X134.742 Y129.897 E.20697
G1 X134.961 Y128.236 E.05148
M204 S10000
G1 X134.595 Y128.128 F42000
G1 F3575
M204 S6000
G1 X134.772 Y126.781 E.04175
G1 X128.455 Y125.949 E.19577
G3 X127.987 Y125.769 I.184 J-1.175 E.01553
G1 X127.657 Y125.927 E.01126
G1 X127.512 Y125.953 E.00452
G1 X121.228 Y126.781 E.19475
G1 X121.583 Y129.474 E.08348
G1 X127.88 Y128.645 E.19517
G1 X128.112 Y128.647 E.00714
G1 X134.417 Y129.474 E.19539
G1 X134.587 Y128.187 E.03989
M204 S10000
G1 X134.221 Y128.078 F42000
G1 F3575
M204 S6000
G1 X134.349 Y127.105 E.03017
G1 X128.406 Y126.323 E.18418
G1 X128.106 Y126.247 E.00951
G1 X128 Y126.188 E.00372
G3 X127.561 Y126.327 I-.537 J-.935 E.01425
G1 X121.651 Y127.105 E.18316
G1 X121.907 Y129.051 E.06031
G1 X127.817 Y128.273 E.18316
G1 X128.161 Y128.273 E.01057
G1 X134.093 Y129.052 E.18381
G1 X134.213 Y128.138 E.02831
M204 S10000
G1 X133.847 Y128.029 F42000
G1 F3575
M204 S6000
G1 X133.926 Y127.43 E.01858
G1 X128.357 Y126.697 E.1726
G1 X128 Y126.608 E.01129
G1 X127.61 Y126.701 E.01231
G1 X122.074 Y127.43 E.17158
G1 X122.232 Y128.628 E.03713
G1 X127.768 Y127.899 E.17158
G1 X128.211 Y127.899 E.01359
G1 X133.768 Y128.629 E.17223
G1 X133.839 Y128.089 E.01673
M204 S10000
G1 X133.454 Y127.978 F42000
; LINE_WIDTH: 0.459584
G1 F3575
M204 S6000
G1 X133.481 Y127.771 E.00706
G1 X127.946 Y127.051 E.18951
G1 X122.519 Y127.771 E.18587
G1 X122.573 Y128.183 E.01412
G1 X127.716 Y127.506 E.17613
G3 X128.262 Y127.505 I.275 J1.361 E.01865
G1 X133.427 Y128.184 E.17685
G1 X133.446 Y128.037 E.00503
M204 S10000
G1 X134.82 Y130.683 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3575
M204 S6000
G1 X133.205 Y130.471 E.05401
G1 X132.541 Y131.135 E.03115
G1 X130.921 Y130.921 E.05419
G1 X130.056 Y130.056 E.0406
G1 X128 Y129.785 E.06879
G1 X125.944 Y130.056 E.06879
G1 X125.079 Y130.921 E.0406
G1 X123.459 Y131.135 E.05419
G1 X122.795 Y130.471 E.03115
G1 X121.18 Y130.683 E.05401
; WIPE_START
G1 F8843.478
G1 X122.795 Y130.471 E-.61876
G1 X123.058 Y130.733 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.564 Y132.02 Z13.6 F42000
G1 Z13.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130852
G1 F3575
M204 S6000
G1 X117.392 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X119.375 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.007 Y132.103 Z13.6 F42000
G1 X135.436 Y132.02 Z13.6
G1 Z13.2
G1 E.8 F1800
; LINE_WIDTH: 0.130848
G1 F3575
M204 S6000
G1 X138.608 Y132.438 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 13.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X136.625 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 67/85
; update layer progress
M73 L67
M991 S0 P66 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z13.6 I.494 J-1.112 P1  F42000
G1 X119.799 Y124.71 Z13.6
M73 P83 R3
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2965
M204 S6000
G1 X126.731 Y123.797 E.23191
G3 X128.344 Y123.721 I1.415 J12.879 E.0536
G3 X129.269 Y123.797 I-.464 J11.33 E.03081
G1 X136.201 Y124.71 E.23191
G1 X135.261 Y131.844 E.2387
G1 X128.311 Y130.929 E.23255
G2 X127.689 Y130.929 I-.311 J3.029 E.02067
G1 X120.739 Y131.844 E.23255
G1 X119.807 Y124.769 E.23671
M204 S250
G1 X119.422 Y124.848 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2965
M204 S5000
G1 X116.478 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.213 Y124.986 E.02327
G3 X116.383 Y124.764 I.192 J-.029 E.00959
G1 X126.684 Y123.408 E.31925
G3 X128.352 Y123.329 I1.468 J13.406 E.05136
G3 X129.316 Y123.408 I-.467 J11.663 E.02972
G1 X139.617 Y124.764 E.31925
G3 X139.787 Y124.986 I-.031 J.2 E.00948
G1 X139.689 Y125.737 E.02327
G1 X139.46 Y125.707 E.00707
G1 X139.523 Y125.236 E.0146
G1 X136.578 Y124.848 E.09126
G1 X135.662 Y131.808 E.21571
G1 X138.606 Y132.196 E.09126
G1 X138.668 Y131.725 E.01459
G1 X138.896 Y131.755 E.00706
G1 X138.795 Y132.52 E.02371
G3 X138.576 Y132.676 I-.191 J-.036 E.00914
G1 X128.268 Y131.319 E.31946
G2 X127.732 Y131.319 I-.268 J2.532 E.0165
G1 X117.354 Y132.674 E.32159
G3 X117.205 Y132.522 I.038 J-.187 E.00694
G1 X117.104 Y131.755 E.02379
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.0146
G1 X120.338 Y131.808 E.09126
G1 X119.43 Y124.908 E.21386
; WIPE_START
G1 F9547.055
M204 S6000
G1 X117.442 Y125.129 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X116.413 Y125.002 F42000
G1 Z13.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130826
G1 F2965
M204 S6000
G1 X119.585 Y124.585 E.02292
; WIPE_START
G1 F15000
G1 X117.602 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.463 Y126.46 Z13.8 F42000
G1 Z13.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2965
M204 S6000
G1 X122.077 Y126.247 E.05401
G1 X123.788 Y124.536 E.08027
G1 X124.449 Y124.449 E.02211
G1 X125.762 Y125.762 E.06159
G1 X124.148 Y125.974 E.05401
M204 S10000
G1 X125.993 Y127.746 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.484845
G1 F2965
M204 S6000
G1 X125.935 Y127.308 E.01591
G1 X121.783 Y127.855 E.15082
G1 X121.84 Y128.293 E.01591
G1 X125.933 Y127.754 E.14866
M204 S10000
G1 X126.452 Y128.099 F42000
; LINE_WIDTH: 0.41999
G1 F2965
M204 S6000
G1 X126.287 Y126.849 E.03874
G1 X121.323 Y127.502 E.15385
G1 X121.488 Y128.752 E.03874
G1 X126.393 Y128.107 E.15201
M204 S10000
G1 X126.875 Y128.423 F42000
G1 F2965
M204 S6000
G1 X126.612 Y126.426 E.06192
G1 X120.9 Y127.178 E.17703
G1 X121.163 Y129.175 E.06192
G1 X126.816 Y128.431 E.17518
M204 S10000
G1 X127.296 Y128.729 F42000
G1 F2965
M204 S6000
G1 X126.938 Y126.014 E.08414
G1 X126.917 Y126.005 E.0007
G1 X120.477 Y126.853 E.1996
G1 X120.838 Y129.599 E.08509
G1 X127.25 Y128.754 E.19871
M204 S10000
G1 X125.175 Y129.423 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2965
M204 S6000
G1 X126.79 Y129.21 E.05401
G1 X125.079 Y130.921 E.08027
G1 X123.459 Y131.135 E.05419
G1 X122.146 Y129.822 E.06159
G1 X120.846 Y129.993 E.04348
G1 X120.888 Y130.308 E.01053
; WIPE_START
G1 F8843.478
G1 X120.846 Y129.993 E-.12062
G1 X122.146 Y129.822 E-.49814
G1 X122.409 Y130.085 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.564 Y132.02 Z13.8 F42000
G1 Z13.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130853
G1 F2965
M204 S6000
G1 X117.392 Y132.438 E.02293
; WIPE_START
G1 F15000
G1 X119.375 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.42 Y129.241 Z13.8 F42000
G1 X130.007 Y127.746 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.48485
G1 F2965
M204 S6000
G1 X134.16 Y128.293 E.15082
G1 X134.217 Y127.855 E.01591
G1 X130.065 Y127.308 E.15082
G1 X130.015 Y127.687 E.01375
M204 S10000
G1 X129.548 Y128.099 F42000
; LINE_WIDTH: 0.41999
G1 F2965
M204 S6000
G1 X134.512 Y128.752 E.15385
G1 X134.677 Y127.502 E.03874
G1 X129.713 Y126.849 E.15385
G1 X129.556 Y128.039 E.0369
M204 S10000
G1 X129.125 Y128.423 F42000
G1 F2965
M204 S6000
G1 X134.837 Y129.175 E.17703
G1 X135.1 Y127.178 E.06192
G1 X129.388 Y126.426 E.17702
G1 X129.133 Y128.364 E.06007
M204 S10000
G1 X128.703 Y128.737 F42000
G1 F2965
M204 S6000
G1 X135.162 Y129.599 E.2002
G1 X135.523 Y126.853 E.08509
G1 X129.075 Y126.004 E.19985
G1 X128.711 Y128.677 E.08289
M204 S10000
G1 X135.537 Y126.46 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2965
M204 S6000
G1 X133.923 Y126.247 E.05401
G1 X132.212 Y124.536 E.08027
G1 X131.551 Y124.449 E.02211
G1 X130.238 Y125.762 E.06159
G1 X128.965 Y125.594 E.0426
G1 X128.694 Y125.802 E.01131
G1 X128.466 Y127.534 E.05794
G1 X127.642 Y128.358 E.03867
G1 X127.534 Y127.534 E.02758
G1 X128.358 Y128.358 E.03867
G1 X128.294 Y128.847 E.01635
G1 X128.501 Y129.117 E.01131
G1 X129.21 Y129.21 E.02373
G1 X130.921 Y130.921 E.08027
G1 X132.541 Y131.135 E.05419
G1 X133.854 Y129.822 E.06159
G1 X135.154 Y129.993 E.04348
G1 X135.112 Y130.308 E.01053
; WIPE_START
G1 F8843.478
G1 X135.154 Y129.993 E-.12062
G1 X133.854 Y129.822 E-.49814
G1 X133.591 Y130.085 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.436 Y132.02 Z13.8 F42000
G1 Z13.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130848
G1 F2965
M204 S6000
G1 X138.608 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X136.625 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.538 Y125.122 Z13.8 F42000
G1 X139.587 Y125.002 Z13.8
G1 Z13.4
G1 E.8 F1800
; LINE_WIDTH: 0.130835
G1 F2965
M204 S6000
G1 X136.415 Y124.585 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 13.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15000
G1 X138.398 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 68/85
; update layer progress
M73 L68
M991 S0 P67 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z13.8 I.009 J-1.217 P1  F42000
G1 X119.799 Y124.71 Z13.8
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1837
M204 S6000
G1 X126.731 Y123.797 E.23191
G3 X128.349 Y123.721 I1.414 J12.867 E.05378
G3 X129.269 Y123.797 I-.478 J11.416 E.03063
G1 X136.201 Y124.71 E.23191
G1 X135.261 Y131.844 E.2387
G1 X128.311 Y130.929 E.23255
G2 X127.689 Y130.929 I-.311 J3.016 E.02067
G1 X120.739 Y131.844 E.23255
G1 X119.807 Y124.769 E.23671
M204 S250
G1 X119.422 Y124.848 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1837
M204 S5000
G1 X116.478 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.211 Y124.934 E.02486
G3 X116.383 Y124.764 I.201 J.031 E.00794
G1 X126.684 Y123.408 E.31925
G3 X128.358 Y123.329 I1.468 J13.397 E.05153
G3 X129.316 Y123.408 I-.48 J11.74 E.02955
G1 X139.617 Y124.764 E.31925
G3 X139.787 Y124.986 I-.031 J.2 E.00948
G1 X139.689 Y125.737 E.02327
G1 X139.46 Y125.707 E.00707
G1 X139.522 Y125.236 E.0146
G1 X136.578 Y124.848 E.09126
G1 X135.662 Y131.808 E.21571
G1 X138.606 Y132.196 E.09126
G1 X138.668 Y131.725 E.0146
G1 X138.896 Y131.755 E.00706
G1 X138.795 Y132.52 E.02371
G3 X138.576 Y132.676 I-.19 J-.034 E.00916
G1 X128.268 Y131.319 E.31946
G2 X127.732 Y131.319 I-.268 J2.519 E.0165
G1 X117.423 Y132.676 E.31952
G1 X117.31 Y132.66 E.00349
G3 X117.205 Y132.52 I.087 J-.175 E.00558
G1 X117.104 Y131.755 E.02371
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.0146
G1 X120.338 Y131.808 E.09126
G1 X119.43 Y124.908 E.21386
; WIPE_START
G1 F9547.055
M204 S6000
M73 P84 R3
G1 X117.442 Y125.129 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X116.413 Y125.002 F42000
G1 Z13.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.13084
G1 F1837
M204 S6000
G1 X119.585 Y124.585 E.02292
; WIPE_START
G1 F15000
G1 X117.602 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.392 Y132.438 Z14 F42000
G1 Z13.6
G1 E.8 F1800
; LINE_WIDTH: 0.130852
G1 F1837
M204 S6000
G1 X120.564 Y132.02 E.02292
; WIPE_START
G1 F15000
G1 X118.581 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.844 Y131.347 Z14 F42000
G1 Z13.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1837
M204 S6000
G1 X123.459 Y131.135 E.05401
G1 X120.623 Y128.299 E.13302
G1 X120.554 Y127.77 E.01769
G1 X123.788 Y124.536 E.15174
G1 X124.449 Y124.449 E.02211
G1 X130.921 Y130.921 E.30364
G1 X132.541 Y131.135 E.05419
G1 X135.377 Y128.299 E.13302
G1 X135.446 Y127.77 E.01769
G1 X132.212 Y124.536 E.15174
G1 X131.551 Y124.449 E.02211
G1 X125.079 Y130.921 E.30364
G1 X126.693 Y130.709 E.05401
; WIPE_START
G1 F8843.478
G1 X125.079 Y130.921 E-.61876
G1 X125.341 Y130.659 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.905 Y131.679 Z14 F42000
G1 X135.436 Y132.02 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130848
G1 F1837
M204 S6000
G1 X138.608 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X136.625 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.538 Y125.122 Z14 F42000
G1 X139.587 Y125.002 Z14
G1 Z13.6
G1 E.8 F1800
; LINE_WIDTH: 0.130844
G1 F1837
M204 S6000
G1 X136.415 Y124.585 E.02293
; CHANGE_LAYER
; Z_HEIGHT: 13.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X138.398 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 69/85
; update layer progress
M73 L69
M991 S0 P68 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z14 I.009 J-1.217 P1  F42000
G1 X119.799 Y124.71 Z14
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1821
M204 S6000
G1 X126.731 Y123.797 E.23191
G3 X128.355 Y123.721 I1.413 J12.86 E.05397
G3 X129.269 Y123.797 I-.495 J11.53 E.03044
G1 X136.201 Y124.71 E.23191
G1 X135.261 Y131.844 E.2387
G1 X128.31 Y130.929 E.23257
G2 X127.683 Y130.93 I-.309 J3.315 E.02082
G1 X120.739 Y131.844 E.23236
G1 X119.807 Y124.769 E.23671
M204 S250
G1 X119.422 Y124.848 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1821
M204 S5000
G1 X116.478 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.213 Y124.986 E.02326
G3 X116.383 Y124.764 I.192 J-.029 E.00959
G1 X126.684 Y123.408 E.31926
G3 X128.363 Y123.33 I1.467 J13.391 E.0517
G3 X129.316 Y123.408 I-.495 J11.842 E.02938
G1 X139.617 Y124.764 E.31925
G3 X139.787 Y124.986 I-.022 J.193 E.0096
G1 X139.689 Y125.737 E.02326
G1 X139.46 Y125.707 E.00707
G1 X139.522 Y125.236 E.0146
G1 X136.578 Y124.848 E.09126
G1 X135.662 Y131.808 E.21571
G1 X138.606 Y132.196 E.09126
G1 X138.668 Y131.725 E.0146
G1 X138.896 Y131.755 E.00706
G1 X138.791 Y132.538 E.02428
G3 X138.576 Y132.676 I-.184 J-.051 E.0086
G1 X128.268 Y131.319 E.31948
G2 X127.73 Y131.319 I-.267 J2.789 E.01655
G1 X117.423 Y132.676 E.31945
G1 X117.31 Y132.66 E.00348
G3 X117.205 Y132.52 I.087 J-.175 E.00558
G1 X117.104 Y131.755 E.02371
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.0146
G1 X120.338 Y131.808 E.09126
G1 X119.43 Y124.908 E.21386
; WIPE_START
G1 F9547.055
M204 S6000
G1 X117.442 Y125.129 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X116.413 Y125.002 F42000
G1 Z13.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130852
G1 F1821
M204 S6000
G1 X119.585 Y124.585 E.02293
M204 S10000
G1 X120.564 Y132.02 F42000
; LINE_WIDTH: 0.130855
G1 F1821
M204 S6000
G1 X117.392 Y132.438 E.02293
; WIPE_START
G1 F15000
G1 X119.375 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.693 Y130.709 Z14.2 F42000
G1 Z13.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1821
M204 S6000
G1 X125.079 Y130.921 E.05401
G1 X131.551 Y124.449 E.30364
G1 X132.212 Y124.536 E.02211
G1 X135.446 Y127.77 E.15174
G1 X135.377 Y128.299 E.01769
G1 X132.541 Y131.135 E.13302
G1 X130.921 Y130.921 E.05419
G1 X124.449 Y124.449 E.30364
G1 X123.788 Y124.536 E.02211
G1 X120.554 Y127.77 E.15174
G1 X120.623 Y128.299 E.01769
G1 X123.459 Y131.135 E.13302
G1 X121.844 Y131.347 E.05401
; WIPE_START
G1 F8843.478
G1 X123.459 Y131.135 E-.61876
G1 X123.196 Y130.872 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.795 Y131.585 Z14.2 F42000
G1 X135.436 Y132.02 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130848
G1 F1821
M204 S6000
G1 X138.608 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X136.625 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.538 Y125.122 Z14.2 F42000
G1 X139.587 Y125.002 Z14.2
G1 Z13.8
G1 E.8 F1800
; LINE_WIDTH: 0.130835
G1 F1821
M204 S6000
G1 X136.415 Y124.585 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 14
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X138.398 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 70/85
; update layer progress
M73 L70
M991 S0 P69 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z14.2 I.009 J-1.217 P1  F42000
G1 X119.799 Y124.71 Z14.2
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1837
M204 S6000
G1 X126.731 Y123.797 E.23192
G3 X128.422 Y123.723 I1.41 J12.812 E.05619
G3 X129.269 Y123.797 I-.426 J9.735 E.02822
G1 X136.201 Y124.71 E.23192
G1 X135.261 Y131.844 E.2387
G1 X128.311 Y130.929 E.23256
G2 X127.689 Y130.929 I-.311 J2.988 E.02065
G1 X120.739 Y131.844 E.23256
G1 X119.807 Y124.769 E.23671
M204 S250
G1 X119.422 Y124.848 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1837
M204 S5000
G1 X116.478 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.213 Y124.986 E.02327
G3 X116.383 Y124.764 I.198 J-.025 E.00952
G1 X126.684 Y123.408 E.31925
G3 X128.439 Y123.331 I1.463 J13.332 E.05402
G3 X129.316 Y123.408 I-.441 J10.081 E.02706
G1 X139.617 Y124.764 E.31926
G3 X139.787 Y124.986 I-.023 J.193 E.00958
G1 X139.689 Y125.737 E.02327
G1 X139.46 Y125.707 E.00707
G1 X139.522 Y125.236 E.0146
G1 X136.578 Y124.848 E.09126
G1 X135.662 Y131.808 E.21571
M73 P85 R3
G1 X138.606 Y132.196 E.09126
G1 X138.668 Y131.725 E.0146
G1 X138.896 Y131.755 E.00706
G1 X138.795 Y132.52 E.02371
G3 X138.576 Y132.676 I-.188 J-.032 E.00918
G1 X128.268 Y131.319 E.31947
G2 X127.732 Y131.319 I-.268 J2.495 E.01649
G1 X117.354 Y132.674 E.32159
G3 X117.205 Y132.52 I.041 J-.189 E.00701
G1 X117.104 Y131.755 E.02371
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.0146
G1 X120.338 Y131.808 E.09126
G1 X119.43 Y124.908 E.21386
; WIPE_START
G1 F9547.055
M204 S6000
G1 X117.442 Y125.129 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X116.413 Y125.002 F42000
G1 Z14
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.13085
G1 F1837
M204 S6000
G1 X119.585 Y124.585 E.02293
; WIPE_START
G1 F15000
G1 X117.602 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.392 Y132.438 Z14.4 F42000
G1 Z14
G1 E.8 F1800
; LINE_WIDTH: 0.130849
G1 F1837
M204 S6000
G1 X120.564 Y132.02 E.02292
; WIPE_START
G1 F15000
G1 X118.581 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.844 Y131.347 Z14.4 F42000
G1 Z14
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1837
M204 S6000
G1 X123.459 Y131.135 E.05401
G1 X120.623 Y128.299 E.13302
G1 X120.554 Y127.77 E.01769
G1 X123.788 Y124.536 E.15174
G1 X124.449 Y124.449 E.02211
G1 X130.921 Y130.921 E.30364
G1 X132.541 Y131.135 E.05419
G1 X135.377 Y128.299 E.13302
G1 X135.446 Y127.77 E.01769
G1 X132.212 Y124.536 E.15174
G1 X131.551 Y124.449 E.02211
G1 X125.079 Y130.921 E.30364
G1 X126.693 Y130.709 E.05401
; WIPE_START
G1 F8843.478
G1 X125.079 Y130.921 E-.61876
G1 X125.341 Y130.659 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.905 Y131.679 Z14.4 F42000
M73 P85 R2
G1 X135.436 Y132.02 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130837
G1 F1837
M204 S6000
G1 X138.608 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X136.625 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.538 Y125.122 Z14.4 F42000
G1 X139.587 Y125.002 Z14.4
G1 Z14
G1 E.8 F1800
; LINE_WIDTH: 0.130845
G1 F1837
M204 S6000
G1 X136.415 Y124.585 E.02293
; CHANGE_LAYER
; Z_HEIGHT: 14.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X138.398 Y124.846 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 71/85
; update layer progress
M73 L71
M991 S0 P70 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z14.4 I.009 J-1.217 P1  F42000
G1 X119.799 Y124.71 Z14.4
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2068
M204 S6000
G1 X126.731 Y123.797 E.23192
G3 X128.366 Y123.722 I1.412 J12.843 E.05433
G3 X129.269 Y123.797 I-.531 J11.802 E.03008
G1 X136.201 Y124.71 E.23191
G1 X135.261 Y131.844 E.2387
G1 X128.31 Y130.929 E.23257
G2 X127.69 Y130.929 I-.31 J2.801 E.02062
G1 X120.739 Y131.844 E.23257
G1 X119.807 Y124.769 E.23671
M204 S250
G1 X119.422 Y124.848 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2068
M204 S5000
G1 X116.478 Y125.236 E.09126
G1 X116.54 Y125.707 E.0146
G1 X116.311 Y125.737 E.00707
G1 X116.211 Y124.934 E.02485
G3 X116.383 Y124.764 I.201 J.031 E.00795
G1 X126.684 Y123.408 E.31925
G3 X128.374 Y123.33 I1.465 J13.365 E.05204
G3 X129.316 Y123.408 I-.53 J12.088 E.02904
G1 X139.617 Y124.764 E.31925
G3 X139.787 Y124.986 I-.031 J.2 E.00948
G1 X139.689 Y125.737 E.02327
G1 X139.46 Y125.707 E.00707
G1 X139.522 Y125.236 E.0146
G1 X136.578 Y124.848 E.09126
G1 X135.662 Y131.808 E.21571
G1 X138.606 Y132.196 E.09126
G1 X138.668 Y131.725 E.0146
G1 X138.896 Y131.755 E.00706
G1 X138.79 Y132.54 E.02434
G3 X138.576 Y132.676 I-.184 J-.052 E.00854
G1 X128.268 Y131.319 E.31948
G2 X127.732 Y131.319 I-.268 J2.338 E.01649
G1 X117.424 Y132.676 E.31947
G1 X117.354 Y132.674 E.00215
G1 X117.271 Y132.635 E.00283
G3 X117.205 Y132.52 I.122 J-.147 E.00416
G1 X117.104 Y131.755 E.02371
G1 X117.332 Y131.725 E.00706
G1 X117.394 Y132.196 E.0146
G1 X120.338 Y131.808 E.09126
G1 X119.43 Y124.908 E.21386
; WIPE_START
G1 F9547.055
M204 S6000
G1 X117.442 Y125.129 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X116.413 Y125.002 F42000
G1 Z14.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130849
G1 F2068
M204 S6000
G1 X119.585 Y124.585 E.02293
M204 S10000
G1 X120.564 Y132.02 F42000
; LINE_WIDTH: 0.130852
G1 F2068
M204 S6000
G1 X117.392 Y132.438 E.02292
; WIPE_START
G1 F15000
G1 X119.375 Y132.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.363 Y131.133 Z14.6 F42000
G1 Z14.2
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.383586
G1 F2068
M204 S6000
G1 X121.209 Y131.416 E.0603
G1 X121.074 Y131.406 E.00374
G1 X121.03 Y131.279 E.00374
G1 X120.227 Y125.18 E.17078
M73 P86 R2
G1 X120.237 Y125.046 E.00374
G1 X120.364 Y125.001 E.00374
G1 X124.876 Y124.407 E.12633
M204 S10000
G1 X126.693 Y130.709 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2068
M204 S6000
G1 X125.079 Y130.921 E.05401
G1 X131.551 Y124.449 E.30364
G1 X132.212 Y124.536 E.02211
G1 X135.11 Y127.434 E.13597
G1 X134.939 Y128.737 E.04359
G1 X132.877 Y130.799 E.0967
G1 X130.483 Y130.483 E.0801
G1 X124.785 Y124.785 E.26732
G1 X123.35 Y124.974 E.04801
G1 X120.89 Y127.434 E.11542
G1 X121.061 Y128.737 E.04359
G1 X123.123 Y130.799 E.09671
G1 X121.508 Y131.011 E.05401
M204 S10000
G1 X130.403 Y130.839 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.383604
G1 F2068
M204 S6000
G1 X134.791 Y131.416 E.12288
G1 X134.926 Y131.406 E.00374
G1 X134.97 Y131.279 E.00374
G1 X135.773 Y125.18 E.17078
G1 X135.763 Y125.046 E.00374
G1 X135.636 Y125.001 E.00374
G1 X133.721 Y124.749 E.05361
; WIPE_START
G1 F10566.98
G1 X135.636 Y125.001 E-.73388
G1 X135.701 Y125.024 E-.02612
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.415 Y124.585 Z14.6 F42000
G1 Z14.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130845
G1 F2068
M204 S6000
G1 X139.587 Y125.002 E.02293
; WIPE_START
G1 F15000
G1 X137.605 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.591 Y132.31 Z14.6 F42000
G1 X138.608 Y132.438 Z14.6
G1 Z14.2
G1 E.8 F1800
; LINE_WIDTH: 0.130847
G1 F2068
M204 S6000
G1 X135.436 Y132.02 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 14.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X137.419 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 72/85
; update layer progress
M73 L72
M991 S0 P71 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z14.6 I.032 J-1.217 P1  F42000
G1 X120.739 Y131.844 Z14.6
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4493
M204 S6000
G1 X119.799 Y124.71 E.2387
G1 X126.731 Y123.797 E.23191
G3 X128.36 Y123.722 I1.413 J12.853 E.05414
G3 X129.269 Y123.797 I-.315 J9.292 E.03027
G1 X136.201 Y124.71 E.23191
G1 X135.261 Y131.844 E.2387
G1 X128.311 Y130.929 E.23255
G2 X127.689 Y130.929 I-.311 J2.956 E.02066
G1 X120.798 Y131.836 E.23056
; WIPE_START
G1 F8843.478
G1 X120.52 Y129.856 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.807 Y127.583 Z14.8 F42000
G1 X136.578 Y124.848 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4493
M204 S5000
G1 X139.126 Y125.184 E.07897
G1 X139.522 Y125.236 E.01229
G1 X139.455 Y125.747 E.01586
M106 S255
G1 F1800
G1 X139.407 Y126.113 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X138.722 Y131.318 E.17415
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X138.674 Y131.684 E.01134
M106 S201.45
G1 F4493
G1 X138.606 Y132.196 E.01586
G1 X138.21 Y132.144 E.01229
G1 X135.662 Y131.808 E.07897
G1 X136.51 Y125.362 E.19977
G1 X136.57 Y124.908 E.01409
; WIPE_START
G1 F9547.055
M204 S6000
G1 X138.558 Y125.122 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.927 Y125.013 Z14.8 F42000
G1 X119.422 Y124.848 Z14.8
G1 Z14.4
G1 E.8 F1800
G1 F4493
M204 S5000
G1 X120.338 Y131.808 E.2157
G1 X117.79 Y132.144 E.07897
G1 X117.394 Y132.196 E.01229
G1 X117.326 Y131.684 E.01586
M106 S255
G1 F1800
G1 X117.278 Y131.318 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X116.593 Y126.113 E.17415
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X116.545 Y125.747 E.01134
M106 S201.45
G1 F4493
G1 X116.478 Y125.236 E.01586
G1 X116.874 Y125.184 E.01229
G1 X119.152 Y124.884 E.07059
G1 X119.363 Y124.856 E.00654
; WIPE_START
G1 F9547.055
M204 S6000
G1 X119.641 Y126.837 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.203 Y132.506 Z14.8 F42000
G1 Z14.4
G1 E.8 F1800
G1 F4493
M204 S5000
G1 X117.151 Y132.111 E.01225
G1 X117.098 Y131.714 E.01229
M106 S255
G1 F1800
G1 X117.05 Y131.348 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X116.365 Y126.143 E.17415
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X116.317 Y125.777 E.01134
M106 S201.45
G1 F4493
G1 X116.265 Y125.381 E.01229
G1 X116.213 Y124.986 E.01223
G1 X116.217 Y124.904 E.00254
G1 X116.254 Y124.833 E.00246
G3 X116.383 Y124.764 I.153 J.132 E.0046
G1 X126.684 Y123.408 E.31925
G3 X128.376 Y123.33 I1.465 J13.366 E.05209
G3 X129.316 Y123.408 I-.326 J9.612 E.029
G1 X139.617 Y124.764 E.31925
G3 X139.788 Y124.984 I-.025 J.195 E.00948
G1 X139.735 Y125.381 E.01231
G1 X139.683 Y125.777 E.01229
M106 S255
G1 F1800
G1 X139.635 Y126.143 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X138.95 Y131.348 E.17415
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1920
G1 X138.902 Y131.714 E.01134
M73 P87 R2
G1 F4493
G1 X138.849 Y132.111 E.01229
G1 X138.797 Y132.506 E.01224
G3 X138.576 Y132.676 I-.193 J-.022 E.00959
G1 X128.268 Y131.319 E.31946
G2 X127.732 Y131.319 I-.268 J2.47 E.01649
G1 X117.354 Y132.674 E.32159
G3 X117.219 Y132.564 I.041 J-.19 E.00557
; WIPE_START
G1 F9547.055
M204 S6000
G1 X117.151 Y132.111 E-.17433
G1 X117.098 Y131.714 E-.152
G1 X117.05 Y131.348 E-.14022
G1 X116.949 Y130.583 E-.29346
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X117.391 Y132.438 F42000
G1 Z14.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130863
G1 F4493
M204 S6000
G1 X120.564 Y132.02 E.02293
; WIPE_START
G1 F15000
G1 X118.581 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.016 Y131.376 Z14.8 F42000
G1 Z14.4
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.41795
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X127.32 Y127.072 E.34021
G1 X126.989 Y126.741 E.02616
G1 X122.489 Y131.241 E.35571
G1 X121.727 Y131.341 E.04297
G1 X126.658 Y126.41 E.38979
G1 X126.327 Y126.079 E.02616
G1 X121.048 Y131.359 E.41737
G1 X120.971 Y130.774 E.03297
G1 X125.996 Y125.748 E.39729
G1 X125.665 Y125.418 E.02616
G1 X120.894 Y130.189 E.37722
G1 X120.817 Y129.605 E.03297
G1 X125.334 Y125.087 E.35715
G1 X125.004 Y124.756 E.02616
G1 X120.74 Y129.02 E.33708
G1 X120.663 Y128.435 E.03297
G1 X124.654 Y124.443 E.31554
G1 X123.892 Y124.544 E.04297
G1 X120.586 Y127.85 E.26138
G1 X120.509 Y127.265 E.03297
G1 X123.13 Y124.644 E.20722
G1 X122.368 Y124.744 E.04297
G1 X120.432 Y126.681 E.15306
G1 X120.355 Y126.096 E.03297
G1 X121.606 Y124.845 E.0989
G1 X120.844 Y124.945 E.04297
G1 X120.097 Y125.692 E.05901
M106 S201.45
; WIPE_START
G1 X120.844 Y124.945 E-.40114
G1 X121.606 Y124.845 E-.2921
G1 X121.481 Y124.969 E-.06676
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.585 Y124.585 Z14.8 F42000
G1 Z14.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130836
; LAYER_HEIGHT: 0.2
G1 F4493
M204 S6000
G1 X116.413 Y125.002 E.02292
; WIPE_START
G1 F15000
G1 X118.395 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.903 Y126.115 Z14.8 F42000
G1 X127.208 Y126.354 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4493
M204 S6000
G1 X127.932 Y127.078 E.03399
G1 X127.505 Y127.505 E.02003
G1 X129.263 Y129.263 E.08247
G1 X132.674 Y125.852 E.16002
G1 X132.356 Y125.534 E.01493
G1 X132.783 Y125.107 E.02003
G1 X132.212 Y124.536 E.0268
G1 X131.551 Y124.449 E.02211
G1 X125.079 Y130.921 E.30364
G1 X126.693 Y130.709 E.05401
; WIPE_START
G1 F8843.478
G1 X125.079 Y130.921 E-.61876
G1 X125.341 Y130.659 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.906 Y131.673 Z14.8 F42000
G1 X138.609 Y132.438 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130836
G1 F4493
M204 S6000
G1 X135.436 Y132.02 E.02292
; WIPE_START
G1 F15000
G1 X137.419 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.276 Y131.546 Z14.8 F42000
G1 Z14.4
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.41999
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X135.027 Y130.795 E.05994
G1 X135.127 Y130.029 E.04358
G1 X133.869 Y131.288 E.10046
G1 X133.282 Y131.211 E.03344
G1 X135.228 Y129.264 E.15539
G1 X135.329 Y128.499 E.04358
G1 X132.694 Y131.133 E.21032
G1 X132.107 Y131.056 E.03344
G1 X135.43 Y127.733 E.26524
G1 X135.531 Y126.968 E.04358
G1 X131.52 Y130.979 E.32017
G1 X130.932 Y130.901 E.03344
G1 X135.631 Y126.202 E.3751
G1 X135.732 Y125.437 E.04358
G1 X130.453 Y130.716 E.42138
G1 X130.128 Y130.376 E.02654
G1 X135.512 Y124.992 E.42979
G1 X134.925 Y124.915 E.03344
G1 X129.796 Y130.044 E.40943
G1 X129.464 Y129.711 E.02653
G1 X134.338 Y124.837 E.38908
G1 X133.75 Y124.76 E.03344
G1 X132.826 Y125.684 E.07378
M106 S201.45
; WIPE_START
G1 X133.75 Y124.76 E-.49671
G1 X134.338 Y124.837 E-.22511
G1 X134.267 Y124.908 E-.03818
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.415 Y124.585 Z14.8 F42000
G1 Z14.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130845
; LAYER_HEIGHT: 0.2
G1 F4493
M204 S6000
G1 X139.587 Y125.002 E.02293
; CHANGE_LAYER
; Z_HEIGHT: 14.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15000
G1 X137.605 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 73/85
; update layer progress
M73 L73
M991 S0 P72 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z14.8 I-.472 J-1.122 P1  F42000
G1 X120.739 Y131.844 Z14.8
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3202
M204 S6000
G1 X119.799 Y124.71 E.2387
G1 X126.731 Y123.797 E.23192
G3 X128.366 Y123.722 I1.413 J12.851 E.05432
G3 X129.269 Y123.797 I-.324 J9.326 E.03009
G1 X136.201 Y124.71 E.23192
G1 X135.261 Y131.844 E.2387
G1 X128.311 Y130.929 E.23255
G2 X127.69 Y130.929 I-.311 J2.871 E.02064
G1 X120.798 Y131.836 E.23058
; WIPE_START
G1 F8843.478
G1 X120.52 Y129.856 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.844 Y127.708 Z15 F42000
G1 X136.537 Y125.158 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3202
M204 S5000
G1 X136.578 Y124.848 E.00961
G1 X139.522 Y125.236 E.09126
G1 X138.606 Y132.196 E.2157
G1 X135.662 Y131.808 E.09126
G1 X136.529 Y125.218 E.20425
; WIPE_START
G1 F9547.055
M204 S6000
G1 X136.578 Y124.848 E-.14168
G1 X138.191 Y125.061 E-.61832
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.559 Y124.974 Z15 F42000
G1 X119.422 Y124.848 Z15
G1 Z14.6
G1 E.8 F1800
G1 F3202
M204 S5000
G1 X120.338 Y131.808 E.21571
G1 X117.394 Y132.196 E.09126
G1 X116.478 Y125.236 E.2157
G1 X119.363 Y124.856 E.08942
; WIPE_START
G1 F9547.055
M204 S6000
G1 X119.641 Y126.837 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.203 Y132.506 Z15 F42000
G1 Z14.6
G1 E.8 F1800
G1 F3202
M204 S5000
G1 X116.213 Y124.986 E.23305
G1 X116.222 Y124.889 E.003
G1 X116.273 Y124.813 E.00282
G3 X116.383 Y124.764 I.154 J.2 E.00373
G1 X126.684 Y123.408 E.31925
G3 X128.382 Y123.33 I1.465 J13.368 E.05226
G3 X129.316 Y123.408 I-.335 J9.645 E.02883
G1 X139.617 Y124.764 E.31925
G3 X139.787 Y124.986 I-.022 J.193 E.00959
G1 X138.797 Y132.506 E.23305
G3 X138.578 Y132.676 I-.192 J-.02 E.00953
G1 X128.268 Y131.319 E.31954
G2 X127.732 Y131.319 I-.268 J2.397 E.01649
G1 X117.354 Y132.674 E.32159
G3 X117.218 Y132.564 I.041 J-.19 E.00558
; WIPE_START
G1 F9547.055
M204 S6000
G1 X116.955 Y130.582 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X117.391 Y132.438 F42000
G1 Z14.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.13085
G1 F3202
M204 S6000
G1 X120.564 Y132.02 E.02293
; WIPE_START
G1 F15000
G1 X118.581 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.62 Y126.549 Z15 F42000
G1 X123.756 Y126.395 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3202
M204 S6000
G1 X123.544 Y124.78 E.05401
G1 X123.788 Y124.536 E.01146
G1 X124.449 Y124.449 E.02211
G1 X130.921 Y130.921 E.30364
G2 X128.002 Y130.56 I-4.142 J21.506 E.09767
G2 X125.079 Y130.921 I1.193 J21.665 E.09777
G1 X131.551 Y124.449 E.30364
G1 X132.212 Y124.536 E.02211
G1 X132.456 Y124.78 E.01146
G1 X132.244 Y126.395 E.05401
; WIPE_START
G1 F8843.478
G1 X132.456 Y124.78 E-.61876
G1 X132.212 Y124.536 E-.1313
G1 X132.186 Y124.532 E-.00995
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.415 Y124.585 Z15 F42000
G1 Z14.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130845
G1 F3202
M204 S6000
G1 X139.587 Y125.002 E.02293
M204 S10000
G1 X138.609 Y132.438 F42000
; LINE_WIDTH: 0.130846
G1 F3202
M204 S6000
G1 X135.436 Y132.02 E.02293
; WIPE_START
G1 F15000
G1 X137.419 Y132.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.03 Y131.023 Z15 F42000
G1 Z14.6
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F3202
M204 S6000
G1 X134.924 Y131.404 E.0897
G1 X135.761 Y125.047 E.19701
G1 X132.867 Y124.666 E.0897
G1 X132.037 Y130.964 E.19517
M204 S10000
G1 X135.196 Y126.445 F42000
G1 F3202
M204 S6000
G1 X135.338 Y125.372 E.03326
G1 X133.191 Y125.089 E.06653
G1 X132.453 Y130.699 E.17384
G1 X134.599 Y130.981 E.06653
G1 X135.189 Y126.505 E.13873
M204 S10000
G1 X134.823 Y126.396 F42000
G1 F3202
M204 S6000
G1 X134.915 Y125.697 E.02168
G1 X133.516 Y125.512 E.04335
M73 P88 R2
G1 X132.876 Y130.374 E.15067
G1 X134.275 Y130.558 E.04335
G1 X134.815 Y126.455 E.12715
M204 S10000
G1 X134.379 Y126.338 F42000
; LINE_WIDTH: 0.55985
G1 F3202
M204 S6000
G1 X134.413 Y126.081 E.01089
G1 X133.901 Y126.014 E.02177
G1 X133.377 Y129.989 E.16889
G1 X133.89 Y130.057 E.02177
G1 X134.372 Y126.397 E.15548
M204 S10000
G1 X123.324 Y126.113 F42000
; LINE_WIDTH: 0.41999
G1 F3202
M204 S6000
G1 X123.133 Y124.666 E.04485
G1 X120.239 Y125.047 E.0897
G1 X121.076 Y131.404 E.19701
G1 X123.97 Y131.023 E.0897
G1 X123.332 Y126.173 E.15032
M204 S10000
G1 X122.95 Y126.163 F42000
G1 F3202
M204 S6000
G1 X122.809 Y125.089 E.03326
G1 X120.662 Y125.372 E.06653
G1 X121.401 Y130.981 E.17384
G1 X123.547 Y130.699 E.06653
G1 X122.958 Y126.222 E.13873
M204 S10000
G1 X122.576 Y126.212 F42000
G1 F3202
M204 S6000
G1 X122.484 Y125.512 E.02168
G1 X121.085 Y125.697 E.04335
G1 X121.725 Y130.558 E.15067
G1 X123.124 Y130.374 E.04335
G1 X122.584 Y126.271 E.12715
M204 S10000
G1 X122.133 Y126.27 F42000
; LINE_WIDTH: 0.55987
G1 F3202
M204 S6000
G1 X122.099 Y126.014 E.01089
G1 X121.587 Y126.081 E.02178
G1 X122.11 Y130.057 E.1689
G1 X122.623 Y129.989 E.02178
G1 X122.141 Y126.33 E.15548
; WIPE_START
G1 F6963.931
G1 X122.402 Y128.313 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.585 Y124.585 Z15 F42000
G1 Z14.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130829
G1 F3202
M204 S6000
G1 X116.413 Y125.002 E.02292
; CHANGE_LAYER
; Z_HEIGHT: 14.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X118.395 Y124.741 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 74/85
; update layer progress
M73 L74
M991 S0 P73 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z15 I-1.21 J-.133 P1  F42000
G1 X117.566 Y132.262 Z15
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3387.004
M204 S6000
G1 X117.551 Y132.147 E.00383
G1 F2520
G1 X116.642 Y125.242 E.23104
G1 F3386.934
G1 X116.627 Y125.127 E.00383
G1 F4600
G1 X117.023 Y125.075 E.01327
G1 X117.42 Y125.023 E.01327
G1 X126.731 Y123.797 E.31153
G3 X128.371 Y123.722 I1.412 J12.841 E.05449
G3 X129.269 Y123.797 I-.332 J9.349 E.02992
G1 X138.58 Y125.023 E.31153
G1 X138.977 Y125.075 E.01327
G1 X139.373 Y125.127 E.01327
G1 F3387.014
G1 X139.358 Y125.242 E.00383
G1 F2520
G1 X138.449 Y132.147 E.23104
G1 F3386.924
G1 X138.434 Y132.262 E.00383
G1 F4600
G1 X138.037 Y132.21 E.01327
G1 X137.641 Y132.157 E.01327
G1 X128.31 Y130.929 E.31218
G2 X127.69 Y130.929 I-.31 J2.803 E.02063
G1 X117.625 Y132.254 E.33673
M204 S250
G1 X117.203 Y132.506 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4600
M204 S5000
G1 X116.213 Y124.986 E.23305
G1 X116.217 Y124.902 E.00259
G1 X116.254 Y124.833 E.0024
G3 X116.383 Y124.764 I.153 J.132 E.00459
G1 X126.684 Y123.408 E.31926
G3 X128.387 Y123.33 I1.465 J13.359 E.05242
G3 X129.316 Y123.408 I-.343 J9.667 E.02866
G1 X139.617 Y124.764 E.31925
G3 X139.788 Y124.983 I-.022 J.193 E.00951
G1 X138.797 Y132.506 E.23313
G3 X138.576 Y132.676 I-.193 J-.022 E.00958
G1 X128.268 Y131.319 E.31948
G2 X127.732 Y131.319 I-.268 J2.339 E.01649
G1 X117.354 Y132.674 E.32159
G3 X117.219 Y132.564 I.041 J-.189 E.00557
; WIPE_START
G1 F9547.055
M204 S6000
G1 X116.955 Y130.582 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X116.983 Y125.246 F42000
G1 Z14.8
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.42882
M106 S255
G1 F3000
M204 S6000
G1 X117.857 Y131.887 E.21066
G1 X118.24 Y131.837 E.01214
G1 X117.388 Y125.363 E.20532
G1 X117.77 Y125.313 E.01214
G1 X118.622 Y131.787 E.20532
G1 X119.005 Y131.736 E.01214
G1 X118.153 Y125.263 E.20532
G1 X118.535 Y125.212 E.01214
G1 X119.388 Y131.686 E.20532
G1 X119.77 Y131.635 E.01214
G1 X118.918 Y125.162 E.20532
G1 X119.301 Y125.112 E.01214
G1 X120.153 Y131.585 E.20532
G1 X120.535 Y131.535 E.01214
G1 X119.683 Y125.061 E.20532
G1 X120.066 Y125.011 E.01214
G1 X120.918 Y131.484 E.20532
G1 X121.301 Y131.434 E.01214
G1 X120.426 Y124.792 E.21066
M106 S201.45
M204 S10000
G1 X123.285 Y125.816 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F4600
M204 S6000
G1 X123.133 Y124.666 E.03564
G1 X120.834 Y124.969 E.07126
G1 X121.667 Y131.326 E.19701
G1 X123.97 Y131.023 E.07139
G1 X123.293 Y125.876 E.15952
M204 S10000
G1 X122.911 Y125.866 F42000
G1 F4600
M204 S6000
G1 X122.809 Y125.089 E.02406
G1 X121.257 Y125.294 E.0481
G1 X121.992 Y130.903 E.17384
G1 X123.547 Y130.699 E.04821
G1 X122.919 Y125.925 E.14794
M204 S10000
G1 X122.537 Y125.915 F42000
G1 F4600
M204 S6000
G1 X122.484 Y125.512 E.01247
G1 X121.68 Y125.618 E.02493
G1 X122.316 Y130.48 E.15067
G1 X123.124 Y130.374 E.02503
G1 X122.545 Y125.974 E.13635
M204 S10000
G1 X122.667 Y130.023 F42000
; LINE_WIDTH: 0.47893
G1 F4600
M204 S6000
G1 X122.143 Y126.027 E.1432
M204 S10000
G1 X132.244 Y126.395 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4600
M204 S6000
G1 X132.456 Y124.78 E.05401
G1 X132.212 Y124.536 E.01146
G1 X131.551 Y124.449 E.02211
G1 X125.079 Y130.921 E.30364
G3 X128 Y130.56 I4.119 J21.329 E.09772
G3 X130.921 Y130.921 I-1.201 J21.713 E.09772
G1 X124.449 Y124.449 E.30364
G1 X123.788 Y124.536 E.02211
G1 X123.544 Y124.78 E.01146
G1 X123.756 Y126.395 E.05401
M204 S10000
G1 X135.018 Y126.122 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F4600
M204 S6000
G1 X135.17 Y124.97 E.03571
G1 X132.867 Y124.666 E.07139
G1 X132.03 Y131.023 E.19701
G1 X134.329 Y131.326 E.07126
G1 X135.01 Y126.181 E.15946
M204 S10000
G1 X134.644 Y126.072 F42000
G1 F4600
M204 S6000
G1 X134.747 Y125.294 E.02411
G1 X133.191 Y125.089 E.04821
G1 X132.453 Y130.699 E.17384
G1 X134.005 Y130.903 E.0481
G1 X134.636 Y126.132 E.14788
M204 S10000
G1 X134.27 Y126.023 F42000
G1 F4600
M204 S6000
G1 X134.324 Y125.619 E.01252
G1 X133.516 Y125.512 E.02503
G1 X132.876 Y130.374 E.15067
G1 X133.68 Y130.48 E.02493
G1 X134.262 Y126.082 E.1363
M204 S10000
G1 X133.331 Y130.024 F42000
; LINE_WIDTH: 0.47891
G1 F4600
M204 S6000
G1 X133.859 Y126.029 E.14319
M204 S10000
G1 X134.677 Y131.602 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.42882
M106 S255
G1 F3000
M204 S6000
G1 X135.552 Y124.96 E.21066
G1 X135.934 Y125.011 E.01214
G1 X135.082 Y131.484 E.20532
G1 X135.465 Y131.535 E.01213
G1 X136.317 Y125.061 E.20532
G1 X136.699 Y125.112 E.01214
G1 X135.847 Y131.585 E.20532
G1 X136.23 Y131.635 E.01214
G1 X137.082 Y125.162 E.20532
G1 X137.465 Y125.212 E.01214
G1 X136.612 Y131.686 E.20532
G1 X136.995 Y131.736 E.01213
G1 X137.847 Y125.263 E.20532
G1 X138.23 Y125.313 E.01213
G1 X137.378 Y131.787 E.20532
G1 X137.76 Y131.837 E.01214
G1 X138.612 Y125.363 E.20532
G1 X138.995 Y125.414 E.01214
G1 X138.121 Y132.055 E.21066
M106 S201.45
; CHANGE_LAYER
; Z_HEIGHT: 15
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
G1 X138.382 Y130.073 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 75/85
; update layer progress
M73 L75
M991 S0 P74 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z15.2 I-.127 J-1.21 P1  F42000
G1 X117.566 Y132.262 Z15.2
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3760
M204 S6000
G1 X116.627 Y125.127 E.2387
G1 X126.731 Y123.797 E.33807
G3 X128.376 Y123.722 I1.412 J12.837 E.05468
G3 X129.269 Y123.797 I-.341 J9.38 E.02973
G1 X139.373 Y125.127 E.33806
G1 X138.434 Y132.262 E.2387
G1 X128.311 Y130.929 E.33871
G2 X127.689 Y130.929 I-.311 J2.917 E.02064
G1 X117.625 Y132.254 E.33672
M204 S250
G1 X117.203 Y132.506 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3760
M204 S5000
G1 X116.211 Y124.961 E.23382
G3 X116.383 Y124.764 I.191 J-.007 E.00886
G1 X126.684 Y123.408 E.31925
G3 X128.393 Y123.33 I1.464 J13.354 E.05259
G3 X129.316 Y123.408 I-.352 J9.698 E.02849
G1 X139.617 Y124.764 E.31925
M73 P89 R2
G3 X139.788 Y124.984 I-.022 J.193 E.00951
G1 X138.797 Y132.505 E.23312
G3 X138.576 Y132.676 I-.195 J-.025 E.00955
G1 X128.268 Y131.319 E.31947
G2 X127.732 Y131.319 I-.268 J2.436 E.01649
G1 X117.354 Y132.674 E.32159
G3 X117.218 Y132.564 I.039 J-.187 E.00559
; WIPE_START
G1 F9547.055
M204 S6000
G1 X116.955 Y130.582 E-.76
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
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X118.406 Y131.986 F42000
G1 Z15
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.43371
G1 F3760
M204 S6000
G1 X117.784 Y131.364 E.02803
G1 X117.7 Y130.727 E.02044
G1 X118.743 Y131.771 E.04699
G1 X119.232 Y131.706 E.01569
G1 X117.616 Y130.091 E.07276
G1 X117.532 Y129.454 E.02044
G1 X119.72 Y131.642 E.09852
G1 X120.208 Y131.578 E.01569
G1 X117.449 Y128.818 E.12429
G1 X117.365 Y128.182 E.02044
G1 X120.697 Y131.514 E.15006
G1 X121.185 Y131.449 E.01569
G1 X117.281 Y127.545 E.17582
G1 X117.197 Y126.909 E.02044
G1 X121.674 Y131.385 E.20159
G1 X122.162 Y131.321 E.01569
G1 X117.113 Y126.272 E.22736
G1 X117.03 Y125.636 E.02044
G1 X122.65 Y131.256 E.25312
G1 X123.139 Y131.192 E.01569
G1 X117.319 Y125.372 E.26209
G1 X117.807 Y125.308 E.01569
G1 X123.627 Y131.128 E.26209
G1 X123.978 Y131.082 E.01127
G1 X123.954 Y130.902 E.00575
G1 X118.296 Y125.244 E.25484
G1 X118.784 Y125.179 E.01569
G1 X123.871 Y130.266 E.22907
G1 X123.787 Y129.63 E.02044
G1 X119.272 Y125.115 E.2033
G1 X119.761 Y125.051 E.01569
G1 X123.703 Y128.993 E.17754
G1 X123.619 Y128.357 E.02044
G1 X120.249 Y124.987 E.15177
G1 X120.738 Y124.922 E.01569
G1 X123.535 Y127.72 E.126
G1 X123.452 Y127.084 E.02044
G1 X121.226 Y124.858 E.10024
G1 X121.714 Y124.794 E.01569
G1 X123.368 Y126.447 E.07447
G1 X123.284 Y125.811 E.02044
G1 X122.203 Y124.729 E.0487
G1 X122.691 Y124.665 E.01569
G1 X123.397 Y125.371 E.03181
M204 S10000
G1 X123.756 Y126.395 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3760
M204 S6000
G1 X123.544 Y124.78 E.05401
G1 X123.788 Y124.536 E.01146
G1 X124.449 Y124.449 E.02211
G1 X130.921 Y130.921 E.30364
G2 X128 Y130.56 I-4.133 J21.432 E.09772
G2 X125.079 Y130.921 I1.211 J21.793 E.09772
G1 X131.551 Y124.449 E.30364
G1 X132.212 Y124.536 E.02211
G1 X132.456 Y124.78 E.01146
G1 X132.244 Y126.395 E.05401
M204 S10000
G1 X131.925 Y130.52 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42067
G1 F3760
M204 S6000
G1 X132.557 Y131.152 E.02751
G1 X133.172 Y131.233 E.0191
G1 X132.138 Y130.199 E.045
G1 X132.2 Y129.727 E.01466
G1 X133.787 Y131.314 E.06908
G1 X134.402 Y131.395 E.0191
G1 X132.263 Y129.255 E.09316
G1 X132.325 Y128.783 E.01466
G1 X135.018 Y131.476 E.11723
G1 X135.633 Y131.557 E.0191
G1 X132.387 Y128.311 E.14131
G1 X132.449 Y127.839 E.01466
G1 X136.248 Y131.638 E.16538
G1 X136.863 Y131.719 E.0191
G1 X132.511 Y127.367 E.18946
G1 X132.573 Y126.895 E.01466
G1 X137.479 Y131.8 E.21354
G1 X138.094 Y131.881 E.0191
G1 X132.635 Y126.423 E.23761
G1 X132.698 Y125.951 E.01466
G1 X138.204 Y131.457 E.23971
G1 X138.266 Y130.985 E.01466
G1 X132.76 Y125.478 E.23971
G1 X132.822 Y125.006 E.01466
G1 X138.328 Y130.513 E.23971
G1 X138.39 Y130.041 E.01466
G1 X132.97 Y124.62 E.23595
G1 X133.585 Y124.701 E.0191
G1 X138.453 Y129.569 E.21188
G1 X138.515 Y129.097 E.01466
G1 X134.201 Y124.782 E.1878
G1 X134.816 Y124.863 E.0191
G1 X138.577 Y128.624 E.16373
G1 X138.639 Y128.152 E.01466
G1 X135.431 Y124.944 E.13965
G1 X136.046 Y125.025 E.0191
G1 X138.701 Y127.68 E.11557
G1 X138.763 Y127.208 E.01466
G1 X136.661 Y125.106 E.0915
G1 X137.277 Y125.187 E.0191
G1 X138.825 Y126.736 E.06742
G1 X138.888 Y126.264 E.01466
G1 X137.892 Y125.268 E.04335
G1 X138.507 Y125.349 E.0191
G1 X139.101 Y125.943 E.02585
; CHANGE_LAYER
; Z_HEIGHT: 15.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9530.112
G1 X138.507 Y125.349 E-.31915
G1 X137.892 Y125.268 E-.2358
G1 X138.273 Y125.65 E-.20505
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 76/85
; update layer progress
M73 L76
M991 S0 P75 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z15.4 I-.455 J-1.129 P1  F42000
G1 X123.986 Y131.417 Z15.4
G1 Z15.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4236
M204 S6000
G1 X123.047 Y124.282 E.2387
G1 X126.731 Y123.797 E.12325
G3 X128.382 Y123.722 I1.411 J12.831 E.05486
G3 X129.269 Y123.797 I-.349 J9.399 E.02955
G1 X132.953 Y124.282 E.12325
G1 X132.014 Y131.417 E.2387
G1 X128.31 Y130.929 E.12391
G2 X127.69 Y130.929 I-.31 J2.801 E.02062
G1 X124.046 Y131.409 E.12192
; WIPE_START
G1 F8843.478
G1 X123.768 Y129.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.203 Y132.506 Z15.6 F42000
G1 Z15.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4236
M204 S5000
G1 X116.213 Y124.986 E.23305
G1 X116.218 Y124.902 E.00259
G1 X116.254 Y124.833 E.00239
G3 X116.383 Y124.764 I.153 J.132 E.0046
G1 X126.684 Y123.408 E.31925
G3 X128.398 Y123.33 I1.464 J13.344 E.05277
G3 X129.316 Y123.408 I-.361 J9.728 E.02832
G1 X139.617 Y124.764 E.31925
G3 X139.787 Y124.986 I-.022 J.193 E.00958
G1 X138.797 Y132.505 E.23305
G3 X138.576 Y132.676 I-.193 J-.022 E.00959
G1 X128.268 Y131.319 E.31947
G2 X127.732 Y131.319 I-.268 J2.339 E.01649
G1 X117.354 Y132.674 E.32159
G3 X117.218 Y132.564 I.039 J-.187 E.00559
; WIPE_START
G1 F9547.055
M204 S6000
G1 X116.955 Y130.582 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z15.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z15.6
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z15.6 F4000
            G39.3 S1
            G0 Z15.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X122.924 Y131.743 F42000
G1 Z15.2
G1 E.8 F1800
; FEATURE: Top surface
G1 F4236
M204 S2000
G1 X123.659 Y131.007 E.03195
G1 X123.597 Y130.536
G1 X122.31 Y131.823 E.05594
G1 X121.696 Y131.904
G1 X123.535 Y130.065 E.07993
G1 X123.473 Y129.594
G1 X121.082 Y131.985 E.10392
G1 X120.468 Y132.066
G1 X123.411 Y129.122 E.12791
M73 P90 R2
G1 X123.349 Y128.651
G1 X119.854 Y132.147 E.1519
G1 X119.24 Y132.228
G1 X123.287 Y128.18 E.17589
G1 X123.225 Y127.709
G1 X118.625 Y132.309 E.19988
G1 X118.011 Y132.389
G1 X123.163 Y127.238 E.22387
G1 X123.101 Y126.766
G1 X117.406 Y132.461 E.24748
G1 X117.344 Y131.99
G1 X123.039 Y126.295 E.24748
G1 X122.977 Y125.824
G1 X117.282 Y131.519 E.24748
G1 X117.22 Y131.048
G1 X122.915 Y125.353 E.24748
G1 X122.853 Y124.881
G1 X117.158 Y130.577 E.24748
G1 X117.096 Y130.105
G1 X122.834 Y124.367 E.24935
G1 X122.5 Y124.168
G1 X117.034 Y129.634 E.23753
G1 X116.972 Y129.163
G1 X121.886 Y124.249 E.21354
G1 X121.272 Y124.33
G1 X116.91 Y128.692 E.18955
G1 X116.848 Y128.22
G1 X120.658 Y124.41 E.16556
G1 X120.044 Y124.491
G1 X116.786 Y127.749 E.14157
G1 X116.724 Y127.278
G1 X119.429 Y124.572 E.11758
G1 X118.815 Y124.653
G1 X116.662 Y126.807 E.09359
G1 X116.599 Y126.336
G1 X118.201 Y124.734 E.0696
G1 X117.587 Y124.815
G1 X116.537 Y125.864 E.04561
G1 X116.475 Y125.393
M73 P90 R1
G1 X116.973 Y124.896 E.02162
; WIPE_START
G1 F9547.055
M204 S6000
G1 X116.475 Y125.393 E-.2674
G1 X116.537 Y125.864 E-.18061
G1 X117.118 Y125.284 E-.31199
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.727 Y125.875 Z15.6 F42000
G1 X132.314 Y126.465 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4236
M204 S6000
G1 X132.527 Y124.851 E.05401
G1 X132.212 Y124.536 E.01478
G1 X131.551 Y124.449 E.02211
G1 X125.079 Y130.921 E.30364
G3 X128 Y130.56 I4.118 J21.324 E.09772
G3 X130.921 Y130.921 I-1.198 J21.696 E.09772
G1 X124.452 Y124.452 E.30351
G1 X123.786 Y124.538 E.02226
G1 X123.473 Y124.851 E.01469
G1 X123.686 Y126.465 E.05401
; WIPE_START
G1 F8843.478
G1 X123.473 Y124.851 E-.61876
G1 X123.736 Y124.588 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.569 Y127.988 Z15.6 F42000
G1 X138.653 Y132.011 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F4236
M204 S2000
G1 X138.242 Y132.423 E.01788
G1 X137.771 Y132.361
G1 X138.734 Y131.397 E.04187
G1 X138.815 Y130.783
G1 X137.299 Y132.299 E.06586
G1 X136.828 Y132.237
G1 X138.896 Y130.169 E.08985
G1 X138.977 Y129.555
G1 X136.357 Y132.175 E.11384
G1 X135.886 Y132.113
G1 X139.058 Y128.941 E.13783
G1 X139.138 Y128.327
G1 X135.414 Y132.05 E.16182
G1 X134.943 Y131.988
G1 X139.219 Y127.712 E.18581
G1 X139.3 Y127.098
G1 X134.472 Y131.926 E.2098
G1 X134.001 Y131.864
G1 X139.381 Y126.484 E.23379
G1 X139.462 Y125.87
G1 X133.53 Y131.802 E.25778
G1 X133.058 Y131.74
G1 X139.543 Y125.256 E.28177
G1 X139.33 Y124.935
G1 X132.587 Y131.678 E.29301
G1 X132.226 Y131.506
G1 X138.859 Y124.873 E.28821
G1 X138.387 Y124.811
G1 X132.363 Y130.836 E.26179
G1 X132.444 Y130.222
G1 X137.916 Y124.749 E.2378
G1 X137.445 Y124.687
G1 X132.525 Y129.607 E.21381
G1 X132.606 Y128.993
G1 X136.974 Y124.625 E.18982
G1 X136.503 Y124.563
G1 X132.687 Y128.379 E.16583
G1 X132.767 Y127.765
G1 X136.031 Y124.501 E.14184
G1 X135.56 Y124.439
G1 X132.848 Y127.151 E.11785
G1 X132.929 Y126.537
G1 X135.089 Y124.377 E.09386
G1 X134.618 Y124.315
G1 X133.01 Y125.923 E.06987
G1 X133.091 Y125.309
G1 X134.147 Y124.253 E.04588
G1 X133.675 Y124.191
G1 X133.172 Y124.695 E.02189
; CHANGE_LAYER
; Z_HEIGHT: 15.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.055
M204 S6000
G1 X133.675 Y124.191 E-.27066
G1 X134.147 Y124.253 E-.18061
G1 X133.572 Y124.828 E-.30873
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 77/85
; update layer progress
M73 L77
M991 S0 P76 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z15.6 I-.671 J-1.015 P1  F42000
G1 X123.515 Y131.479 Z15.6
G1 Z15.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1809
M204 S6000
G1 X122.575 Y124.344 E.2387
G1 X126.731 Y123.797 E.13903
G3 X128.387 Y123.722 I1.411 J12.826 E.05504
G3 X129.269 Y123.797 I-.359 J9.437 E.02937
G1 X133.425 Y124.344 E.13903
G1 X132.485 Y131.479 E.2387
G1 X128.31 Y130.929 E.13969
G2 X127.689 Y130.929 I-.31 J2.889 E.02064
G1 X123.574 Y131.471 E.13769
; WIPE_START
G1 F8843.478
G1 X123.297 Y129.49 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.163 Y126.157 Z15.8 F42000
G1 X133.815 Y124.384 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1809
M204 S5000
G1 X139.387 Y125.117 E.17269
G1 X138.444 Y132.275 E.22185
G1 X132.873 Y131.542 E.17269
G1 X133.621 Y125.856 E.17622
G1 X133.807 Y124.443 E.04379
; WIPE_START
G1 F9547.055
M204 S6000
G1 X135.793 Y124.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.162 Y124.515 Z15.8 F42000
G1 X122.185 Y124.384 Z15.8
G1 Z15.4
G1 E.8 F1800
G1 F1809
M204 S5000
G1 X123.127 Y131.542 E.22185
G1 X117.556 Y132.275 E.17269
G1 X116.613 Y125.117 E.22185
G1 X117.788 Y124.962 E.03641
G1 X122.126 Y124.391 E.13443
; WIPE_START
G1 F9547.055
M204 S6000
G1 X122.403 Y126.372 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.467 Y132.194 Z15.8 F42000
G1 X117.203 Y132.506 Z15.8
G1 Z15.4
G1 E.8 F1800
G1 F1809
M204 S5000
G1 X116.213 Y124.986 E.23305
G1 X116.229 Y124.871 E.00356
G3 X116.383 Y124.764 I.176 J.088 E.006
G1 X126.684 Y123.408 E.31925
G3 X128.403 Y123.33 I1.464 J13.344 E.05293
G3 X129.316 Y123.408 I-.371 J9.768 E.02815
G1 X139.617 Y124.764 E.31926
G3 X139.788 Y124.984 I-.025 J.195 E.00948
G1 X138.797 Y132.506 E.23313
G3 X138.576 Y132.676 I-.193 J-.022 E.00959
G1 X128.268 Y131.319 E.31946
G2 X127.732 Y131.319 I-.268 J2.412 E.01649
G1 X117.422 Y132.676 E.31953
G1 X117.31 Y132.659 E.00349
G3 X117.219 Y132.564 I.088 J-.176 E.00413
; WIPE_START
G1 F9547.055
M204 S6000
G1 X116.955 Y130.581 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z15.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z15.8
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z15.8 F4000
            G39.3 S1
            G0 Z15.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


M73 P91 R1
G1 X123.262 Y126.889 F42000
G1 Z15.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1809
M204 S6000
G1 X123.049 Y125.275 E.05401
G1 X123.785 Y124.539 E.03454
G1 X124.452 Y124.452 E.02231
G1 X130.921 Y130.921 E.30348
G2 X128 Y130.56 I-4.13 J21.416 E.09772
G2 X125.079 Y130.921 I1.211 J21.792 E.09772
G1 X131.551 Y124.449 E.30364
G1 X132.212 Y124.536 E.02211
G1 X132.951 Y125.275 E.03467
G1 X132.738 Y126.889 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 15.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F8843.478
G1 X132.951 Y125.275 E-.61876
G1 X132.688 Y125.012 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 78/85
; update layer progress
M73 L78
M991 S0 P77 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z15.8 I-.701 J-.995 P1  F42000
G1 X123.515 Y131.479 Z15.8
G1 Z15.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1813
M204 S6000
G1 X122.575 Y124.344 E.2387
G1 X126.731 Y123.797 E.13903
G3 X128.393 Y123.722 I1.411 J12.827 E.05521
G3 X129.269 Y123.797 I-.369 J9.487 E.02919
G1 X133.425 Y124.344 E.13903
G1 X132.485 Y131.479 E.2387
G1 X128.316 Y130.93 E.13948
G2 X127.689 Y130.929 I-.318 J3.377 E.02083
G1 X123.574 Y131.471 E.13769
; WIPE_START
G1 F8843.478
G1 X123.297 Y129.49 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.163 Y126.157 Z16 F42000
G1 X133.815 Y124.384 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1813
M204 S5000
G1 X139.387 Y125.117 E.17269
G1 X138.444 Y132.275 E.22185
G1 X132.873 Y131.542 E.17269
G1 X133.399 Y127.541 E.12398
G1 X133.807 Y124.443 E.09602
; WIPE_START
G1 F9547.055
M204 S6000
G1 X135.793 Y124.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.162 Y124.515 Z16 F42000
G1 X122.185 Y124.384 Z16
G1 Z15.6
G1 E.8 F1800
G1 F1813
M204 S5000
G1 X123.127 Y131.542 E.22185
G1 X117.556 Y132.275 E.17269
G1 X116.613 Y125.117 E.22185
G1 X122.126 Y124.391 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X122.403 Y126.372 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.467 Y132.194 Z16 F42000
G1 X117.203 Y132.506 Z16
G1 Z15.6
G1 E.8 F1800
G1 F1813
M204 S5000
G1 X116.211 Y124.962 E.2338
G3 X116.383 Y124.764 I.192 J-.006 E.00886
G1 X126.684 Y123.408 E.31926
G3 X128.409 Y123.331 I1.463 J13.344 E.0531
G3 X129.316 Y123.408 I-.381 J9.81 E.02798
G1 X139.617 Y124.764 E.31925
G3 X139.788 Y124.983 I-.02 J.192 E.00954
G1 X138.797 Y132.505 E.23313
G3 X138.576 Y132.676 I-.192 J-.02 E.00961
G1 X128.27 Y131.319 E.3194
G2 X127.732 Y131.319 I-.27 J2.843 E.01655
G1 X117.354 Y132.674 E.32159
G3 X117.218 Y132.564 I.039 J-.188 E.00559
; WIPE_START
G1 F9547.055
M204 S6000
G1 X116.955 Y130.582 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z16 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z16
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z16 F4000
            G39.3 S1
            G0 Z16 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X132.738 Y126.889 F42000
G1 Z15.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1813
M204 S6000
G1 X132.951 Y125.275 E.05401
G1 X132.212 Y124.536 E.03467
G1 X131.551 Y124.449 E.02211
G1 X125.079 Y130.921 E.30364
G3 X128.006 Y130.56 I4.106 J21.233 E.09794
G3 X130.921 Y130.921 I-1.335 J22.709 E.0975
G1 X124.452 Y124.452 E.30348
G1 X123.785 Y124.539 E.02231
G1 X123.049 Y125.275 E.03454
G1 X123.262 Y126.889 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 15.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X123.049 Y125.275 E-.61876
G1 X123.312 Y125.012 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 79/85
; update layer progress
M73 L79
M991 S0 P78 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z16 I-1.216 J.038 P1  F42000
G1 X123.515 Y131.479 Z16
G1 Z15.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1805
M204 S6000
G1 X122.575 Y124.344 E.2387
G1 X126.731 Y123.797 E.13903
G3 X128.398 Y123.722 I1.41 J12.817 E.05539
G3 X129.269 Y123.797 I-.378 J9.522 E.02902
G1 X133.425 Y124.344 E.13903
G1 X132.485 Y131.479 E.2387
G1 X128.31 Y130.929 E.13968
G2 X127.69 Y130.929 I-.311 J2.831 E.02064
G1 X123.574 Y131.471 E.1377
; WIPE_START
G1 F8843.478
G1 X123.297 Y129.49 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.76 Y131.089 Z16.2 F42000
G1 X132.873 Y131.542 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1805
M204 S5000
G1 X133.177 Y129.227 E.07175
G1 X133.815 Y124.384 E.1501
G1 X139.387 Y125.117 E.17269
G1 X138.444 Y132.275 E.22185
G1 X132.932 Y131.55 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X133.142 Y129.561 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.241 Y126.3 Z16.2 F42000
G1 X122.185 Y124.384 Z16.2
G1 Z15.8
G1 E.8 F1800
G1 F1805
M204 S5000
G1 X123.127 Y131.542 E.22185
G1 X117.556 Y132.275 E.17269
G1 X116.613 Y125.117 E.22185
G1 X120.366 Y124.623 E.1163
G1 X122.126 Y124.391 E.05454
; WIPE_START
G1 F9547.055
M204 S6000
G1 X122.403 Y126.372 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.467 Y132.194 Z16.2 F42000
G1 X117.203 Y132.506 Z16.2
G1 Z15.8
G1 E.8 F1800
G1 F1805
M204 S5000
G1 X116.213 Y124.986 E.23305
G1 X116.217 Y124.902 E.00257
G1 X116.254 Y124.833 E.00241
G3 X116.383 Y124.764 I.153 J.132 E.0046
G1 X126.684 Y123.408 E.31925
G3 X128.414 Y123.331 I1.463 J13.335 E.05327
G3 X129.316 Y123.408 I-.39 J9.849 E.02782
G1 X139.617 Y124.764 E.31925
G3 X139.787 Y124.985 I-.02 J.192 E.00959
G1 X138.797 Y132.506 E.23308
G3 X138.576 Y132.676 I-.192 J-.02 E.00961
G1 X128.268 Y131.319 E.31947
G2 X127.732 Y131.319 I-.268 J2.365 E.01649
G1 X117.424 Y132.676 E.31949
G1 X117.354 Y132.674 E.00213
G1 X117.271 Y132.635 E.00283
G3 X117.218 Y132.563 I.132 J-.153 E.00275
; WIPE_START
G1 F9547.055
M204 S6000
G1 X116.955 Y130.581 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z16.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z16.2
M73 P92 R1
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z16.2 F4000
            G39.3 S1
            G0 Z16.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X123.262 Y126.889 F42000
G1 Z15.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1805
M204 S6000
G1 X123.049 Y125.275 E.05401
G1 X123.785 Y124.539 E.03454
G1 X124.452 Y124.452 E.02231
G1 X130.921 Y130.921 E.30348
G2 X128.001 Y130.56 I-4.132 J21.426 E.09769
G2 X125.079 Y130.921 I1.198 J21.699 E.09775
G1 X131.551 Y124.449 E.30364
G1 X132.212 Y124.536 E.02211
G1 X132.951 Y125.275 E.03467
G1 X132.738 Y126.889 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 16
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X132.951 Y125.275 E-.61876
G1 X132.688 Y125.012 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 80/85
; update layer progress
M73 L80
M991 S0 P79 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z16.2 I-.701 J-.995 P1  F42000
G1 X123.515 Y131.479 Z16.2
G1 Z16
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2058
M204 S6000
G1 X122.575 Y124.344 E.2387
G1 X126.731 Y123.797 E.13903
G3 X128.403 Y123.723 I1.41 J12.815 E.05557
G3 X129.269 Y123.797 I-.387 J9.553 E.02884
G1 X133.425 Y124.344 E.13903
G1 X132.485 Y131.479 E.2387
G1 X128.31 Y130.929 E.13969
G2 X127.69 Y130.929 I-.31 J2.849 E.02063
G1 X123.574 Y131.471 E.1377
; WIPE_START
G1 F8843.478
G1 X123.297 Y129.49 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.185 Y124.384 Z16.4 F42000
G1 Z16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2058
M204 S5000
G1 X123.127 Y131.542 E.22185
G1 X117.556 Y132.275 E.17269
G1 X116.613 Y125.117 E.22185
G1 X121.655 Y124.453 E.15625
G1 X122.126 Y124.391 E.0146
; WIPE_START
G1 F9547.055
M204 S6000
G1 X122.403 Y126.372 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.247 Y129.751 Z16.4 F42000
G1 X132.873 Y131.542 Z16.4
G1 Z16
G1 E.8 F1800
G1 F2058
M204 S5000
G1 X132.955 Y130.912 E.01951
G1 X133.815 Y124.384 E.20234
G1 X139.387 Y125.117 E.17269
G1 X138.444 Y132.275 E.22185
G1 X132.932 Y131.55 E.17084
; WIPE_START
G1 F9547.055
M204 S6000
G1 X132.955 Y130.912 E-.24237
G1 X133.133 Y129.562 E-.51763
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.628 Y130.949 Z16.4 F42000
G1 X117.203 Y132.506 Z16.4
G1 Z16
G1 E.8 F1800
G1 F2058
M204 S5000
G1 X116.213 Y124.986 E.23305
G1 X116.214 Y124.916 E.00215
G1 X116.254 Y124.833 E.00283
G3 X116.383 Y124.764 I.153 J.132 E.0046
G1 X126.684 Y123.408 E.31925
G3 X128.42 Y123.331 I1.462 J13.328 E.05344
G3 X129.316 Y123.408 I-.401 J9.893 E.02765
G1 X139.617 Y124.764 E.31925
G3 X139.788 Y124.983 I-.02 J.192 E.00953
G1 X138.797 Y132.506 E.23313
G3 X138.576 Y132.676 I-.192 J-.02 E.00962
G1 X128.268 Y131.319 E.31946
G2 X127.732 Y131.319 I-.268 J2.377 E.01649
G1 X117.424 Y132.676 E.31948
G1 X117.354 Y132.674 E.00214
G1 X117.271 Y132.635 E.00283
G3 X117.218 Y132.563 I.132 J-.153 E.00275
; WIPE_START
G1 F9547.055
M204 S6000
G1 X116.955 Y130.581 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z16.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z16.4
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z16.4 F4000
            G39.3 S1
            G0 Z16.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X128.351 Y130.568 F42000
G1 Z16
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F2058
M204 S6000
G2 X127.649 Y130.568 I-.351 J8.224 E.01944
G1 X123.985 Y131.051 E.1024
G1 X123.88 Y130.904 E.00499
G1 X123.078 Y124.806 E.17042
G1 X123.14 Y124.637 E.00499
G1 X126.774 Y124.162 E.10154
G3 X129.234 Y124.158 I1.244 J10.103 E.06831
G1 X132.86 Y124.636 E.10133
G1 X132.923 Y124.805 E.00499
G1 X132.12 Y130.904 E.17045
G1 X132.015 Y131.051 E.00499
G1 X128.41 Y130.576 E.10074
M204 S10000
G1 X132.582 Y125.187 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2058
M204 S6000
G1 X132.611 Y124.969 E.00731
G1 X131.215 Y124.785 E.0467
G1 X125.517 Y130.483 E.26732
G3 X128.001 Y130.183 I3.523 J18.683 E.08309
G3 X130.483 Y130.483 I-1.065 J19.174 E.08299
G1 X124.785 Y124.785 E.26731
G1 X123.389 Y124.97 E.0467
G1 X123.418 Y125.187 E.00725
; CHANGE_LAYER
; Z_HEIGHT: 16.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F8843.478
G1 X123.389 Y124.97 E-.08307
G1 X124.785 Y124.785 E-.53501
G1 X125.049 Y125.049 E-.14192
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 81/85
; update layer progress
M73 L81
M991 S0 P80 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z16.4 I-.845 J-.876 P1  F42000
G1 X117.566 Y132.262 Z16.4
G1 Z16.2
M73 P93 R1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X116.627 Y125.127 E.2387
G1 X126.731 Y123.797 E.33807
G3 X128.409 Y123.723 I1.41 J12.812 E.05575
G3 X129.269 Y123.797 I-.398 J9.599 E.02865
G1 X139.373 Y125.127 E.33807
G1 X138.434 Y132.262 E.2387
G1 X128.317 Y130.93 E.33851
G2 X127.69 Y130.929 I-.318 J3.342 E.02083
G1 X117.625 Y132.254 E.33673
M204 S250
G1 X117.203 Y132.505 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X116.214 Y124.916 E.23517
G3 X116.383 Y124.764 I.189 J.041 E.00745
G1 X126.684 Y123.408 E.31925
G3 X128.426 Y123.331 I1.463 J13.333 E.05361
G3 X129.316 Y123.408 I-.412 J9.939 E.02748
G1 X139.617 Y124.764 E.31925
G3 X139.787 Y124.986 I-.02 J.192 E.00961
G1 X138.797 Y132.506 E.23306
G3 X138.576 Y132.676 I-.191 J-.019 E.00963
G1 X128.27 Y131.319 E.3194
G2 X127.732 Y131.319 I-.27 J2.811 E.01655
G1 X117.354 Y132.674 E.32159
G3 X117.218 Y132.564 I.041 J-.19 E.00558
; WIPE_START
M204 S6000
G1 X116.958 Y130.581 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z16.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z16.6
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z16.6 F4000
            G39.3 S1
            G0 Z16.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X117.737 Y131.9 F42000
G1 Z16.2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.4266
M106 S255
G1 F3000
M204 S6000
G1 X123.634 Y131.123 E.18597
G1 X123.584 Y130.743 E.012
G1 X117.855 Y131.497 E.18067
G1 X117.805 Y131.117 E.012
G1 X123.534 Y130.363 E.18067
G1 X123.484 Y129.982 E.012
G1 X117.755 Y130.736 E.18067
G1 X117.705 Y130.356 E.012
G1 X123.434 Y129.602 E.18067
G1 X123.384 Y129.221 E.012
G1 X117.655 Y129.976 E.18067
G1 X117.605 Y129.595 E.012
G1 X123.334 Y128.841 E.18067
G1 X123.284 Y128.461 E.012
G1 X117.555 Y129.215 E.18067
G1 X117.505 Y128.834 E.012
G1 X123.234 Y128.08 E.18067
G1 X123.184 Y127.7 E.012
G1 X117.455 Y128.454 E.18067
G1 X117.404 Y128.074 E.012
G1 X123.134 Y127.319 E.18067
G1 X123.084 Y126.939 E.012
G1 X117.354 Y127.693 E.18067
G1 X117.304 Y127.313 E.012
G1 X123.033 Y126.559 E.18067
G1 X122.983 Y126.178 E.012
G1 X117.254 Y126.932 E.18067
G1 X117.204 Y126.552 E.012
G1 X122.933 Y125.798 E.18067
G1 X122.883 Y125.417 E.012
G1 X117.154 Y126.172 E.18067
G1 X117.104 Y125.791 E.012
G1 X122.833 Y125.037 E.18067
G1 X122.783 Y124.657 E.012
G1 X116.886 Y125.433 E.18597
M106 S201.45
; WIPE_START
G1 X118.869 Y125.172 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z16.6 I-.876 J.845 P1  F42000
G1 X123.727 Y130.206 Z16.6
G1 Z16.2
G1 E.8 F1800
; LINE_WIDTH: 0.40412
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X124.497 Y130.976 E.05696
G1 X125.065 Y130.902 E.02991
G1 X123.864 Y129.701 E.08872
G1 X123.767 Y128.962 E.03898
G1 X125.632 Y130.827 E.13786
G1 X126.2 Y130.752 E.02991
G1 X123.67 Y128.222 E.187
G1 X123.572 Y127.482 E.03898
G1 X126.767 Y130.677 E.23613
G1 X127.335 Y130.603 E.02991
G1 X123.475 Y126.743 E.28527
G1 X123.378 Y126.003 E.03899
G1 X127.918 Y130.544 E.33561
G3 X128.612 Y130.596 I.035 J4.228 E.0364
G1 X123.28 Y125.264 E.39408
G1 X123.197 Y124.635 E.03312
G1 X123.283 Y124.624 E.0045
G1 X129.352 Y130.693 E.44855
G1 X130.091 Y130.791 E.03899
G1 X123.85 Y124.549 E.46127
G1 X124.418 Y124.475 E.02991
G1 X130.831 Y130.888 E.47398
G1 X131.571 Y130.985 E.03899
G1 X124.985 Y124.4 E.4867
G1 X125.553 Y124.325 E.02991
G1 X131.995 Y130.768 E.47614
G1 X132.07 Y130.2 E.02991
G1 X126.12 Y124.251 E.43972
G1 X126.688 Y124.176 E.02991
G1 X132.145 Y129.633 E.4033
G1 X132.219 Y129.065 E.02991
G1 X127.275 Y124.121 E.36543
G3 X127.889 Y124.093 I.468 J3.503 E.03217
G1 X132.294 Y128.498 E.32556
G1 X132.369 Y127.93 E.02991
G1 X128.544 Y124.106 E.28266
G3 X129.248 Y124.167 I-.344 J7.954 E.03695
G1 X132.444 Y127.363 E.23615
G1 X132.518 Y126.795 E.02991
G1 X129.988 Y124.265 E.18701
G1 X130.727 Y124.362 E.03898
G1 X132.593 Y126.228 E.13787
G1 X132.668 Y125.66 E.02991
G1 X131.467 Y124.459 E.08873
G1 X132.207 Y124.557 E.03898
G1 X132.923 Y125.273 E.05293
M106 S201.45
M204 S10000
G1 X133.049 Y124.634 F42000
; LINE_WIDTH: 0.42661
; LAYER_HEIGHT: 0.2
M106 S255
G1 F3000
M204 S6000
G1 X133.94 Y124.752 E.02811
G1 X133.983 Y124.808 E.00221
G1 X138.94 Y125.46 E.1563
G1 X138.896 Y125.791 E.01043
G1 X133.167 Y125.037 E.18067
G1 X133.117 Y125.417 E.012
G1 X138.846 Y126.171 E.18067
M73 P94 R1
G1 X138.796 Y126.552 E.012
G1 X133.067 Y125.798 E.18067
G1 X133.017 Y126.178 E.012
G1 X138.746 Y126.932 E.18067
G1 X138.696 Y127.313 E.012
G1 X132.967 Y126.558 E.18067
G1 X132.917 Y126.939 E.012
G1 X138.646 Y127.693 E.18067
G1 X138.596 Y128.073 E.012
G1 X132.866 Y127.319 E.18067
G1 X132.816 Y127.7 E.012
G1 X138.545 Y128.454 E.18067
G1 X138.495 Y128.834 E.012
G1 X132.766 Y128.08 E.18067
G1 X132.716 Y128.46 E.012
G1 X138.445 Y129.215 E.18067
G1 X138.395 Y129.595 E.012
G1 X132.666 Y128.841 E.18067
G1 X132.616 Y129.221 E.012
G1 X138.345 Y129.976 E.18067
G1 X138.295 Y130.356 E.012
G1 X132.566 Y129.602 E.18067
G1 X132.516 Y129.982 E.012
G1 X138.245 Y130.736 E.18067
G1 X138.195 Y131.117 E.012
G1 X132.466 Y130.362 E.18067
G1 X132.416 Y130.743 E.012
G1 X138.145 Y131.497 E.18067
G1 X138.101 Y131.828 E.01043
G1 X133.145 Y131.176 E.15631
G1 X133.089 Y131.219 E.00221
G1 X132.197 Y131.101 E.02811
M106 S201.45
; CHANGE_LAYER
; Z_HEIGHT: 16.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F3000
G1 X133.089 Y131.219 E-.34163
G1 X133.145 Y131.176 E-.02683
G1 X134.166 Y131.31 E-.39154
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 82/85
; update layer progress
M73 L82
M991 S0 P81 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z16.6 I-.07 J-1.215 P1  F42000
G1 X117.572 Y132.261 Z16.6
G1 Z16.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5023
M204 S6000
G1 X116.633 Y125.127 E.2387
G1 X126.731 Y123.797 E.33785
G3 X128.414 Y123.723 I1.41 J12.813 E.05592
G3 X129.269 Y123.797 I-.409 J9.652 E.02849
G1 X139.367 Y125.127 E.33785
G1 X138.428 Y132.261 E.2387
G1 X128.31 Y130.929 E.33851
G2 X127.69 Y130.929 I-.31 J2.811 E.02062
G1 X117.632 Y132.253 E.33652
M204 S250
G1 X117.209 Y132.503 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5023
M204 S5000
G1 X116.219 Y124.985 E.23301
G1 X116.222 Y124.911 E.00229
G3 X116.395 Y124.762 I.191 J.049 E.00747
G1 X126.684 Y123.408 E.31886
G3 X128.431 Y123.331 I1.463 J13.332 E.05377
G3 X129.316 Y123.408 I-.423 J9.998 E.02731
G1 X139.605 Y124.762 E.31887
G3 X139.781 Y124.985 I-.015 J.193 E.0098
G1 X138.791 Y132.505 E.23305
G3 X138.563 Y132.674 I-.193 J-.022 E.00977
G1 X128.268 Y131.319 E.31908
G2 X127.732 Y131.319 I-.268 J2.346 E.01649
G1 X117.437 Y132.674 E.31908
G1 X117.349 Y132.67 E.00271
G1 X117.278 Y132.633 E.00245
G3 X117.224 Y132.561 I.131 J-.153 E.00278
; WIPE_START
G1 F9547.055
M204 S6000
G1 X116.961 Y130.578 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z16.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z16.8
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z16.8 F4000
            G39.3 S1
            G0 Z16.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X117.699 Y125.151 F42000
G1 Z16.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42121
G1 F5023
M204 S6000
G1 X117.057 Y125.793 E.02797
G1 X117.119 Y126.266 E.0147
G1 X118.118 Y125.267 E.04352
G1 X118.734 Y125.186 E.01916
G1 X117.181 Y126.738 E.06766
G1 X117.244 Y127.211 E.0147
G1 X119.35 Y125.105 E.09181
G1 X119.966 Y125.024 E.01916
G1 X117.306 Y127.684 E.11595
G1 X117.368 Y128.157 E.0147
G1 X120.582 Y124.943 E.1401
G1 X121.198 Y124.862 E.01916
G1 X117.43 Y128.629 E.16424
G1 X117.493 Y129.102 E.0147
G1 X121.814 Y124.781 E.18839
G1 X122.43 Y124.7 E.01916
G1 X117.555 Y129.575 E.21253
G1 X117.617 Y130.048 E.0147
G1 X123.046 Y124.618 E.23668
G1 X123.662 Y124.537 E.01916
G1 X117.679 Y130.52 E.26082
G1 X117.742 Y130.993 E.0147
G1 X124.278 Y124.456 E.28497
G1 X124.895 Y124.375 E.01916
G1 X117.804 Y131.466 E.30911
G1 X117.859 Y131.887 E.0131
G1 X117.926 Y131.878 E.00209
G1 X125.511 Y124.294 E.33063
G1 X126.127 Y124.213 E.01916
G1 X118.543 Y131.797 E.33063
G1 X119.159 Y131.716 E.01916
G1 X126.743 Y124.132 E.33063
G3 X127.33 Y124.079 I.898 J6.722 E.01819
G1 X119.775 Y131.635 E.32938
G1 X120.391 Y131.554 E.01916
G1 X127.888 Y124.056 E.32685
G3 X128.422 Y124.058 I.256 J3.067 E.01646
G1 X121.007 Y131.473 E.32324
G1 X121.623 Y131.392 E.01916
G1 X128.914 Y124.101 E.31783
G3 X129.399 Y124.15 I-.319 J5.518 E.01504
G1 X122.239 Y131.31 E.31213
G1 X122.855 Y131.229 E.01916
G1 X129.872 Y124.213 E.30588
G1 X130.345 Y124.275 E.0147
G1 X123.471 Y131.148 E.29964
G1 X124.087 Y131.067 E.01916
G1 X130.817 Y124.337 E.29339
G1 X131.29 Y124.399 E.0147
G1 X124.703 Y130.986 E.28714
G1 X125.32 Y130.905 E.01916
G1 X131.763 Y124.462 E.28089
G1 X132.236 Y124.524 E.0147
G1 X125.936 Y130.824 E.27464
G1 X126.552 Y130.743 E.01916
G1 X132.708 Y124.586 E.26839
G1 X133.181 Y124.648 E.0147
G1 X127.168 Y130.662 E.26214
G3 X127.775 Y130.59 I.834 J4.443 E.01885
G1 X133.654 Y124.711 E.25629
G1 X134.126 Y124.773 E.0147
G1 X128.305 Y130.595 E.2538
G3 X128.78 Y130.655 I-.205 J3.534 E.01477
G1 X134.599 Y124.835 E.2537
G1 X135.072 Y124.897 E.0147
G1 X129.252 Y130.717 E.2537
G1 X129.725 Y130.779 E.0147
G1 X135.545 Y124.96 E.2537
G1 X136.017 Y125.022 E.0147
G1 X130.198 Y130.841 E.2537
G1 X130.671 Y130.904 E.0147
G1 X136.49 Y125.084 E.2537
G1 X136.963 Y125.146 E.0147
G1 X131.143 Y130.966 E.2537
M73 P95 R1
G1 X131.616 Y131.028 E.0147
G1 X137.436 Y125.208 E.2537
G1 X137.908 Y125.271 E.0147
G1 X132.089 Y131.09 E.2537
G1 X132.562 Y131.153 E.0147
G1 X138.381 Y125.333 E.2537
G1 X138.854 Y125.395 E.0147
G1 X133.034 Y131.215 E.2537
G1 X133.507 Y131.277 E.0147
G1 X138.936 Y125.848 E.23665
G1 X138.855 Y126.465 E.01916
G1 X133.98 Y131.339 E.21251
G1 X134.453 Y131.401 E.0147
G1 X138.773 Y127.081 E.18836
G1 X138.692 Y127.697 E.01916
G1 X134.925 Y131.464 E.16422
G1 X135.398 Y131.526 E.0147
G1 X138.611 Y128.313 E.14007
G1 X138.53 Y128.929 E.01916
G1 X135.871 Y131.588 E.11593
G1 X136.344 Y131.65 E.0147
G1 X138.449 Y129.545 E.09178
G1 X138.368 Y130.161 E.01916
G1 X136.816 Y131.713 E.06764
G1 X137.289 Y131.775 E.0147
G1 X138.287 Y130.777 E.04349
G1 X138.206 Y131.393 E.01916
G1 X137.611 Y131.988 E.02594
; CHANGE_LAYER
; Z_HEIGHT: 16.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F9516.508
G1 X138.206 Y131.393 E-.31979
G1 X138.287 Y130.777 E-.23613
M73 P95 R0
G1 X137.907 Y131.157 E-.20408
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 83/85
; update layer progress
M73 L83
M991 S0 P82 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z16.8 I-.066 J-1.215 P1  F42000
G1 X117.624 Y132.254 Z16.8
G1 Z16.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4928
M204 S6000
G1 X116.685 Y125.12 E.23869
G1 X126.731 Y123.797 E.33612
G3 X128.419 Y123.723 I1.41 J12.812 E.05611
G3 X129.269 Y123.797 I-.42 J9.701 E.02831
G1 X139.315 Y125.12 E.33612
G1 X138.376 Y132.254 E.23869
G1 X128.31 Y130.929 E.33678
G2 X127.683 Y130.93 I-.309 J3.31 E.02082
G1 X117.683 Y132.246 E.33458
M204 S250
G1 X117.261 Y132.497 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4928
M204 S5000
G1 X116.27 Y124.976 E.2331
G1 X116.289 Y124.871 E.00329
G3 X116.515 Y124.747 I.247 J.183 E.00818
G1 X126.684 Y123.408 E.31515
G3 X128.436 Y123.331 I1.462 J13.328 E.05394
G3 X129.316 Y123.408 I-.435 J10.054 E.02714
G1 X139.483 Y124.746 E.31511
G3 X139.73 Y124.976 I.02 J.225 E.01167
G1 X138.739 Y132.497 E.2331
G3 X138.47 Y132.661 I-.212 J-.045 E.01085
G1 X128.268 Y131.319 E.31619
G2 X127.73 Y131.319 I-.267 J2.786 E.01655
G1 X117.532 Y132.661 E.31607
G3 X117.281 Y132.553 I-.058 J-.21 E.00905
; WIPE_START
G1 F9547.055
M204 S6000
G1 X117.017 Y130.571 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z17 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z17
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z17 F4000
            G39.3 S1
            G0 Z17 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X118.452 Y131.98 F42000
G1 Z16.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42708
G1 F4928
M204 S6000
G1 X117.844 Y131.371 E.02693
G1 X117.762 Y130.746 E.01975
G1 X118.781 Y131.765 E.04514
G1 X119.261 Y131.702 E.01516
G1 X117.679 Y130.12 E.07004
G1 X117.597 Y129.494 E.01975
G1 X119.741 Y131.639 E.09494
G1 X120.221 Y131.576 E.01516
G1 X117.514 Y128.869 E.11984
G1 X117.432 Y128.243 E.01975
G1 X120.701 Y131.512 E.14474
G1 X121.182 Y131.449 E.01516
G1 X117.35 Y127.617 E.16964
G1 X117.267 Y126.992 E.01975
G1 X121.662 Y131.386 E.19454
G1 X122.142 Y131.323 E.01516
G1 X117.185 Y126.366 E.21944
G1 X117.103 Y125.74 E.01975
G1 X122.622 Y131.26 E.24434
G1 X123.102 Y131.197 E.01516
G1 X117.283 Y125.377 E.25763
G1 X117.763 Y125.314 E.01516
G1 X123.582 Y131.133 E.25763
G1 X124.062 Y131.07 E.01516
G1 X118.243 Y125.251 E.25763
G1 X118.723 Y125.188 E.01516
G1 X124.542 Y131.007 E.25763
G1 X125.022 Y130.944 E.01516
G1 X119.203 Y125.124 E.25763
G1 X119.683 Y125.061 E.01516
G1 X125.502 Y130.881 E.25763
G1 X125.983 Y130.817 E.01516
G1 X120.163 Y124.998 E.25763
G1 X120.643 Y124.935 E.01516
G1 X126.463 Y130.754 E.25763
G1 X126.943 Y130.691 E.01516
G1 X121.123 Y124.872 E.25763
G1 X121.603 Y124.808 E.01516
G1 X127.423 Y130.628 E.25764
G3 X127.918 Y130.58 I.617 J3.811 E.01559
G1 X122.083 Y124.745 E.25832
G1 X122.564 Y124.682 E.01516
G1 X128.499 Y130.618 E.26278
G1 X129.125 Y130.7 E.01975
G1 X123.044 Y124.619 E.26922
G1 X123.524 Y124.556 E.01516
G1 X129.75 Y130.782 E.27566
G1 X130.376 Y130.865 E.01975
G1 X124.004 Y124.492 E.28211
G1 X124.484 Y124.429 E.01516
G1 X131.002 Y130.947 E.28855
G1 X131.627 Y131.029 E.01975
G1 X124.964 Y124.366 E.29499
G1 X125.444 Y124.303 E.01516
G1 X132.253 Y131.112 E.30144
G1 X132.879 Y131.194 E.01975
G1 X125.924 Y124.24 E.30788
G1 X126.404 Y124.176 E.01516
G1 X133.504 Y131.276 E.31432
G1 X134.13 Y131.359 E.01975
G1 X126.889 Y124.118 E.32056
G1 X127.388 Y124.074 E.0157
G1 X134.755 Y131.441 E.32614
G1 X135.381 Y131.523 E.01975
G1 X127.914 Y124.056 E.33058
G3 X128.462 Y124.061 I.246 J3.138 E.01719
G1 X136.007 Y131.606 E.334
G1 X136.632 Y131.688 E.01975
G1 X129.057 Y124.113 E.33534
G3 X129.674 Y124.187 I-.533 J7.098 E.01945
G1 X137.258 Y131.77 E.33574
G1 X137.883 Y131.853 E.01975
G1 X130.3 Y124.269 E.33573
G1 X130.926 Y124.351 E.01975
G1 X138.132 Y131.557 E.31902
G1 X138.195 Y131.077 E.01516
G1 X131.551 Y124.434 E.29412
G1 X132.177 Y124.516 E.01975
G1 X138.258 Y130.597 E.26922
G1 X138.321 Y130.117 E.01516
G1 X132.802 Y124.599 E.24432
G1 X133.428 Y124.681 E.01975
G1 X138.384 Y129.637 E.21942
G1 X138.448 Y129.157 E.01516
G1 X134.054 Y124.763 E.19452
G1 X134.679 Y124.846 E.01975
G1 X138.511 Y128.677 E.16962
G1 X138.574 Y128.197 E.01516
G1 X135.305 Y124.928 E.14472
G1 X135.931 Y125.01 E.01975
G1 X138.637 Y127.717 E.11982
G1 X138.7 Y127.237 E.01516
G1 X136.556 Y125.093 E.09492
G1 X137.182 Y125.175 E.01975
G1 X138.764 Y126.757 E.07002
G1 X138.827 Y126.277 E.01516
G1 X137.808 Y125.257 E.04512
G1 X138.433 Y125.34 E.01975
G1 X139.041 Y125.948 E.02691
; CHANGE_LAYER
; Z_HEIGHT: 16.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F9371.095
G1 X138.433 Y125.34 E-.32671
G1 X137.808 Y125.257 E-.2398
G1 X138.168 Y125.618 E-.19349
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 84/85
; update layer progress
M73 L84
M991 S0 P83 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z17 I-.375 J-1.158 P1  F42000
G1 X117.738 Y132.226 Z17
G1 Z16.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4895
M204 S6000
G1 X116.803 Y125.117 E.23785
G1 X126.732 Y123.81 E.33223
G3 X128.053 Y123.728 I1.68 J16.334 E.04391
M73 P96 R0
G3 X129.268 Y123.81 I-.114 J10.692 E.0404
G1 X139.197 Y125.117 E.33223
G1 X138.262 Y132.226 E.23785
G1 X128.317 Y130.917 E.33273
G2 X127.687 Y130.916 I-.318 J3.382 E.02091
G1 X117.798 Y132.218 E.33088
M204 S250
G1 X117.389 Y132.524 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4895
M204 S5000
G1 X116.388 Y124.968 E.23421
G1 X116.4 Y124.887 E.00253
G1 X116.461 Y124.821 E.00275
G3 X116.778 Y124.725 I.452 J.922 E.01023
G1 X126.685 Y123.421 E.30706
G3 X128.062 Y123.336 I1.726 J16.779 E.04238
G3 X129.315 Y123.421 I-.122 J11.081 E.0386
G1 X139.222 Y124.725 E.30706
G3 X139.607 Y124.902 I.012 J.48 E.01348
G1 X139.612 Y124.968 E.00205
G1 X138.623 Y132.483 E.2329
G1 X138.567 Y132.573 E.00326
G3 X138.208 Y132.614 I-.232 J-.434 E.01137
G1 X128.271 Y131.306 E.30797
G2 X127.73 Y131.306 I-.271 J2.848 E.01664
G1 X117.792 Y132.614 E.30802
G3 X117.435 Y132.561 I-.124 J-.391 E.0115
; WIPE_START
G1 F9547.055
M204 S6000
G1 X117.161 Y130.58 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z17.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z17.2
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z17.2 F4000
            G39.3 S1
            G0 Z17.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X117.076 Y125.939 F42000
G1 Z16.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42358
G1 F4895
M204 S6000
G1 X117.676 Y125.338 E.02634
G1 X118.296 Y125.257 E.0194
G1 X117.29 Y126.263 E.04416
G1 X117.352 Y126.739 E.01488
G1 X118.916 Y125.175 E.06861
G1 X119.536 Y125.093 E.0194
G1 X117.415 Y127.215 E.09306
G1 X117.478 Y127.69 E.01488
G1 X120.156 Y125.012 E.1175
G1 X120.776 Y124.93 E.0194
G1 X117.54 Y128.166 E.14195
G1 X117.603 Y128.642 E.01488
G1 X121.396 Y124.849 E.1664
G1 X122.016 Y124.767 E.0194
G1 X117.665 Y129.118 E.19085
G1 X117.728 Y129.593 E.01488
G1 X122.636 Y124.685 E.2153
G1 X123.256 Y124.604 E.0194
G1 X117.791 Y130.069 E.23975
G1 X117.853 Y130.545 E.01488
G1 X123.876 Y124.522 E.26419
G1 X124.496 Y124.44 E.0194
G1 X117.916 Y131.02 E.28864
G1 X117.979 Y131.496 E.01488
G1 X125.116 Y124.359 E.31309
G1 X125.736 Y124.277 E.0194
G1 X118.181 Y131.832 E.33139
G1 X118.801 Y131.75 E.0194
G1 X126.356 Y124.196 E.33139
G3 X126.966 Y124.124 I1.129 J6.98 E.01906
G1 X119.421 Y131.668 E.33095
G1 X120.041 Y131.587 E.0194
G1 X127.556 Y124.072 E.32964
G3 X128.103 Y124.064 I.466 J12.004 E.01697
G1 X120.661 Y131.505 E.32645
G1 X121.281 Y131.424 E.0194
G1 X128.618 Y124.087 E.32185
G3 X129.115 Y124.128 I-.077 J3.899 E.01547
G1 X121.901 Y131.342 E.31644
G1 X122.521 Y131.26 E.0194
G1 X129.592 Y124.189 E.31021
G1 X130.068 Y124.251 E.01488
G1 X123.141 Y131.179 E.30388
G1 X123.761 Y131.097 E.0194
G1 X130.544 Y124.314 E.29756
G1 X131.02 Y124.377 E.01488
G1 X124.381 Y131.016 E.29123
G1 X125.001 Y130.934 E.0194
G1 X131.495 Y124.439 E.2849
G1 X131.971 Y124.502 E.01488
G1 X125.621 Y130.852 E.27858
G1 X126.241 Y130.771 E.0194
G1 X132.447 Y124.565 E.27225
G1 X132.922 Y124.627 E.01488
G1 X126.861 Y130.689 E.26592
G1 X127.48 Y130.607 E.0194
G1 X133.398 Y124.69 E.25959
G1 X133.874 Y124.752 E.01488
G1 X128.06 Y130.566 E.25503
G3 X128.553 Y130.612 I-.105 J3.801 E.01535
G1 X134.35 Y124.815 E.25429
G1 X134.825 Y124.878 E.01488
G1 X129.028 Y130.674 E.25429
G1 X129.504 Y130.737 E.01488
G1 X135.301 Y124.94 E.25429
G1 X135.777 Y125.003 E.01488
G1 X129.98 Y130.8 E.25429
G1 X130.456 Y130.862 E.01488
G1 X136.252 Y125.066 E.25429
G1 X136.728 Y125.128 E.01488
G1 X130.931 Y130.925 E.25429
G1 X131.407 Y130.988 E.01488
G1 X137.204 Y125.191 E.25429
G1 X137.68 Y125.253 E.01488
G1 X131.883 Y131.05 E.25429
G1 X132.358 Y131.113 E.01488
G1 X138.155 Y125.316 E.25429
G1 X138.631 Y125.379 E.01488
G1 X132.834 Y131.175 E.25429
G1 X133.31 Y131.238 E.01488
G1 X138.775 Y125.773 E.23974
G1 X138.693 Y126.393 E.0194
G1 X133.786 Y131.301 E.21529
G1 X134.261 Y131.363 E.01488
G1 X138.612 Y127.013 E.19084
G1 X138.53 Y127.633 E.0194
G1 X134.737 Y131.426 E.16639
G1 X135.213 Y131.489 E.01488
G1 X138.448 Y128.253 E.14194
G1 X138.367 Y128.873 E.0194
G1 X135.688 Y131.551 E.11749
G1 X136.164 Y131.614 E.01488
G1 X138.285 Y129.493 E.09304
G1 X138.204 Y130.113 E.0194
G1 X136.64 Y131.676 E.0686
G1 X137.116 Y131.739 E.01488
G1 X138.122 Y130.733 E.04415
G1 X138.04 Y131.353 E.0194
G1 X137.44 Y131.953 E.02633
; CHANGE_LAYER
; Z_HEIGHT: 17
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F9457.259
G1 X138.04 Y131.353 E-.32259
G1 X138.122 Y130.733 E-.23761
G1 X137.75 Y131.104 E-.1998
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 85/85
; update layer progress
M73 L85
M991 S0 P84 ;notify layer change
; OBJECT_ID: 394
M204 S10000
G17
G3 Z17.2 I-.081 J-1.214 P1  F42000
G1 X117.611 Y132.444 Z17.2
G1 Z17
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5237
M204 S5000
G1 X116.625 Y124.925 E.23303
G3 X116.795 Y124.847 I.186 J.181 E.00591
G1 X126.701 Y123.542 E.30701
G3 X128.12 Y123.46 I1.587 J15.027 E.04368
G3 X129.299 Y123.542 I-.162 J10.756 E.03632
G1 X139.205 Y124.847 E.30702
G3 X139.377 Y124.94 I.021 J.167 E.00642
G1 X138.389 Y132.444 E.23257
G1 X138.317 Y132.488 E.00258
G3 X138.195 Y132.489 I-.065 J-.385 E.00376
G1 X128.288 Y131.185 E.30707
G2 X127.715 Y131.184 I-.288 J2.97 E.01764
G1 X117.805 Y132.489 E.30714
G3 X117.66 Y132.478 I-.059 J-.184 E.00456
; WIPE_START
G1 F9547.055
M204 S6000
G1 X117.388 Y130.497 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z17.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z17.4
G1 X0 Y127.975 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z17.4 F4000
            G39.3 S1
            G0 Z17.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X139.094 Y125.496 F42000
G1 Z17
G1 E.8 F1800
; FEATURE: Top surface
G1 F5237
M204 S2000
G1 X138.57 Y124.972 E.02276
G1 X137.956 Y124.891
G1 X139.032 Y125.967 E.04674
G1 X138.969 Y126.438
G1 X137.342 Y124.81 E.07072
G1 X136.728 Y124.73
G1 X138.907 Y126.909 E.0947
G1 X138.845 Y127.38
G1 X136.114 Y124.649 E.11868
G1 X135.5 Y124.568
G1 X138.783 Y127.851 E.14266
G1 X138.72 Y128.322
G1 X134.886 Y124.487 E.16664
G1 X134.271 Y124.406
G1 X138.658 Y128.793 E.19062
G1 X138.596 Y129.264
G1 X133.657 Y124.325 E.21459
G1 X133.043 Y124.245
G1 X138.533 Y129.735 E.23857
G1 X138.471 Y130.206
G1 X132.429 Y124.164 E.26255
G1 X131.815 Y124.083
G1 X138.409 Y130.677 E.28653
G1 X138.347 Y131.148
G1 X131.201 Y124.002 E.31051
G1 X130.587 Y123.921
G1 X138.284 Y131.619 E.33449
G1 X138.222 Y132.09
G1 X129.973 Y123.84 E.35847
M73 P97 R0
G1 X129.359 Y123.759
G1 X137.831 Y132.232 E.36817
G1 X137.217 Y132.151
G1 X128.764 Y123.698 E.36734
G1 X128.204 Y123.671
G1 X136.603 Y132.07 E.36497
G1 X135.989 Y131.989
G1 X127.672 Y123.673 E.3614
G1 X127.175 Y123.709
G1 X135.375 Y131.909 E.35631
G1 X134.761 Y131.828
G1 X126.686 Y123.754 E.35086
G1 X126.215 Y123.816
G1 X134.146 Y131.747 E.34465
G1 X133.532 Y131.666
G1 X125.744 Y123.878 E.33844
G1 X125.273 Y123.94
G1 X132.918 Y131.585 E.33223
G1 X132.304 Y131.504
G1 X124.802 Y124.002 E.32603
G1 X124.33 Y124.064
G1 X131.69 Y131.423 E.31982
G1 X131.076 Y131.343
G1 X123.859 Y124.126 E.31361
G1 X123.388 Y124.188
G1 X130.462 Y131.262 E.3074
G1 X129.848 Y131.181
G1 X122.917 Y124.25 E.30119
G1 X122.445 Y124.312
G1 X129.234 Y131.1 E.29498
G1 X128.619 Y131.019
G1 X121.974 Y124.374 E.28877
G1 X121.503 Y124.436
G1 X128.027 Y130.96 E.28349
G1 X127.533 Y130.999
G1 X121.032 Y124.498 E.28251
G1 X120.561 Y124.56
G1 X127.062 Y131.061 E.28251
G1 X126.59 Y131.123
G1 X120.089 Y124.622 E.28251
G1 X119.618 Y124.684
G1 X126.119 Y131.185 E.28251
G1 X125.648 Y131.247
G1 X119.147 Y124.746 E.28251
G1 X118.676 Y124.808
G1 X125.177 Y131.309 E.28251
G1 X124.706 Y131.371
G1 X118.204 Y124.87 E.28251
G1 X117.733 Y124.932
G1 X124.234 Y131.433 E.28251
G1 X123.763 Y131.495
G1 X117.262 Y124.994 E.28251
G1 X116.857 Y125.122
G1 X123.292 Y131.557 E.27965
G1 X122.821 Y131.619
G1 X116.938 Y125.737 E.25564
G1 X117.019 Y126.351
G1 X122.349 Y131.682 E.23163
G1 X121.878 Y131.744
G1 X117.1 Y126.966 E.20762
G1 X117.182 Y127.58
G1 X121.407 Y131.806 E.18361
G1 X120.936 Y131.868
G1 X117.263 Y128.195 E.1596
G1 X117.344 Y128.809
G1 X120.465 Y131.93 E.1356
G1 X119.993 Y131.992
G1 X117.426 Y129.424 E.11159
G1 X117.507 Y130.038
G1 X119.522 Y132.054 E.08758
G1 X119.051 Y132.116
G1 X117.588 Y130.653 E.06357
G1 X117.669 Y131.267
G1 X118.58 Y132.178 E.03956
G1 X118.109 Y132.24
G1 X117.751 Y131.882 E.01555
; WIPE_START
G1 F9547.055
M204 S6000
G1 X118.109 Y132.24 E-.19232
G1 X118.58 Y132.178 E-.18061
G1 X117.859 Y131.458 E-.38707
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.486 Y131.756 Z17.4 F42000
G1 X138.219 Y132.255 Z17.4
G1 Z17
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.11535
G1 F5237
M204 S6000
G1 X137.829 Y132.234 E.00231
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F15000
G1 X138.219 Y132.255 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z17.4 I1.217 J0 P1  F42000
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
G1 Z17.4 F900 ; lower z a little
G1 X0 Y127.975 F18000 ; move to safe pos
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

    G1 Z117 F600
    G1 Z115

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

